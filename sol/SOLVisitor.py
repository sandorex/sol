# Generated from SOL.g4 by ANTLR 4.13.1
from antlr4 import *
if "." in __name__:
    from .SOLParser import SOLParser
else:
    from SOLParser import SOLParser

# This class defines a complete generic visitor for a parse tree produced by SOLParser.

class SOLVisitor(ParseTreeVisitor):

    # Visit a parse tree produced by SOLParser#program.
    def visitProgram(self, ctx:SOLParser.ProgramContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SOLParser#module.
    def visitModule(self, ctx:SOLParser.ModuleContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SOLParser#expression.
    def visitExpression(self, ctx:SOLParser.ExpressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SOLParser#assign.
    def visitAssign(self, ctx:SOLParser.AssignContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SOLParser#compare.
    def visitCompare(self, ctx:SOLParser.CompareContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SOLParser#operation.
    def visitOperation(self, ctx:SOLParser.OperationContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SOLParser#condition.
    def visitCondition(self, ctx:SOLParser.ConditionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SOLParser#value.
    def visitValue(self, ctx:SOLParser.ValueContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SOLParser#function_call.
    def visitFunction_call(self, ctx:SOLParser.Function_callContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SOLParser#function_def.
    def visitFunction_def(self, ctx:SOLParser.Function_defContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SOLParser#loop.
    def visitLoop(self, ctx:SOLParser.LoopContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SOLParser#list.
    def visitList(self, ctx:SOLParser.ListContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SOLParser#tuple.
    def visitTuple(self, ctx:SOLParser.TupleContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SOLParser#hashmap.
    def visitHashmap(self, ctx:SOLParser.HashmapContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SOLParser#enum.
    def visitEnum(self, ctx:SOLParser.EnumContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SOLParser#string.
    def visitString(self, ctx:SOLParser.StringContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SOLParser#integer.
    def visitInteger(self, ctx:SOLParser.IntegerContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SOLParser#float.
    def visitFloat(self, ctx:SOLParser.FloatContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SOLParser#compound_symbol.
    def visitCompound_symbol(self, ctx:SOLParser.Compound_symbolContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SOLParser#symbol.
    def visitSymbol(self, ctx:SOLParser.SymbolContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SOLParser#special.
    def visitSpecial(self, ctx:SOLParser.SpecialContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SOLParser#op_prefix.
    def visitOp_prefix(self, ctx:SOLParser.Op_prefixContext):
        return self.visitChildren(ctx)



del SOLParser