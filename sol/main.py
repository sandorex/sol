#!/usr/bin/env python3
#
# https://github.com/sandorex/sol

import ast
import antlr4

from .SOLLexer import SOLLexer
from .SOLVisitor import SOLVisitor
from .SOLParser import SOLParser

class ConverterVisitor(SOLVisitor):
    def visitProgram(self, ctx):
        # this looks useless but its the starting point, there could be more
        # starting points in the future
        return self.visitModule(ctx.module())

    def visitModule(self, ctx):
        # just visit everything and put into one module
        return ast.Module(body=self.visitChildren(ctx))

    def visitAssign(self, ctx):
        # have to modify ctx to store instead of load
        left = self.visit(ctx.getChild(0))
        left.ctx = ast.Store()

        right = self.visit(ctx.getChild(2))

        match ctx.getChild(1).getSymbol().type:
            case SOLParser.OP_ASSIGN:
                return ast.Assign(targets=[left], value=right)

            case SOLParser.OP_INPLACE_ADD:
                return ast.AugAssign(target=left, op=ast.Add(), value=right)

            case SOLParser.OP_INPLACE_SUB:
                return ast.AugAssign(target=left, op=ast.Sub(), value=right)

            case SOLParser.OP_INPLACE_POW:
                return ast.AugAssign(target=left, op=ast.Pow(), value=right)

            case SOLParser.OP_INPLACE_MUL:
                return ast.AugAssign(target=left, op=ast.Mult(), value=right)

            case SOLParser.OP_INPLACE_MOD:
                return ast.AugAssign(target=left, op=ast.Mod(), value=right)

            case SOLParser.OP_INPLACE_DIV:
                return ast.AugAssign(target=left, op=ast.Div(), value=right)

        # TODO add custom error in case there is something wrong with operators
        return None

    def visitCompare(self, ctx):
        left = self.visit(ctx.getChild(0))
        right = self.visit(ctx.getChild(2))

        match ctx.getChild(1).getSymbol().type:
            case SOLParser.OP_EQ:
                return ast.Compare(left=left, ops=[ast.Eq()], comparators=[right])

            case SOLParser.OP_NOT_EQ:
                return ast.Compare(left=left, ops=[ast.NotEq()], comparators=[right])

            case SOLParser.OP_LOOSE_EQ:
                raise NotImplementedError("loose equal is not implemented")

            case SOLParser.OP_LESS_THAN:
                return ast.Compare(left=left, ops=[ast.Lt()], comparators=[right])

            case SOLParser.OP_LESS_THAN_EQ:
                return ast.Compare(left=left, ops=[ast.LtE()], comparators=[right])

            case SOLParser.OP_MORE_THAN:
                return ast.Compare(left=left, ops=[ast.Gt()], comparators=[right])

            case SOLParser.OP_MORE_THAN_EQ:
                return ast.Compare(left=left, ops=[ast.GtE()], comparators=[right])

            case SOLParser.OP_TYPE_EQ:
                return ast.Compare(
                    left=ast.Call(func=ast.Name(id="type", ctx=ast.Load()), args=[left]),
                    ops=[ast.Eq()],
                    comparators=[ast.Call(func=ast.Name(id="type", ctx=ast.Load()), args=[right])]
                )

        return None

    def visitString(self, ctx):
        # TODO parse the string if it is prefixed by an $
        raw = ctx.getText()
        if raw.startswith("$"):
            raise NotImplementedError("Evaluated strings are not implemented yet")

        return ast.Constant(value=raw)

    def visitInteger(self, ctx):
        # TODO error handling
        raw = ctx.getText().replace("_", "")
        if raw.startswith("0b"):
            return ast.Constant(value=int(raw, base=2))
        elif raw.startswith("0x"):
            return ast.Constant(value=int(raw, base=16))
        else:
            return ast.Constant(value=int(raw))

    def visitSymbol(self, ctx):
        # TODO deal with sys ($ prefix) and non local symbols
        return ast.Name(id=ctx.getText(), ctx=ast.Load())

    # def visitCompound_symbol(self, ctx):
    #     return

def main():
    lexer = SOLLexer(antlr4.StdinStream())
    stream = antlr4.CommonTokenStream(lexer)
    parser = SOLParser(stream)

    program = parser.program()
    visitor = ConverterVisitor()
    val = visitor.visitProgram(program)
    # print(val)
    print(ast.dump(val))

