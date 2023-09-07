# Generated from SOL.g4 by ANTLR 4.13.1
from antlr4 import *
if "." in __name__:
    from .SOLParser import SOLParser
else:
    from SOLParser import SOLParser

# This class defines a complete listener for a parse tree produced by SOLParser.
class SOLListener(ParseTreeListener):

    # Enter a parse tree produced by SOLParser#program.
    def enterProgram(self, ctx:SOLParser.ProgramContext):
        pass

    # Exit a parse tree produced by SOLParser#program.
    def exitProgram(self, ctx:SOLParser.ProgramContext):
        pass


    # Enter a parse tree produced by SOLParser#module.
    def enterModule(self, ctx:SOLParser.ModuleContext):
        pass

    # Exit a parse tree produced by SOLParser#module.
    def exitModule(self, ctx:SOLParser.ModuleContext):
        pass


    # Enter a parse tree produced by SOLParser#expression.
    def enterExpression(self, ctx:SOLParser.ExpressionContext):
        pass

    # Exit a parse tree produced by SOLParser#expression.
    def exitExpression(self, ctx:SOLParser.ExpressionContext):
        pass


    # Enter a parse tree produced by SOLParser#assign.
    def enterAssign(self, ctx:SOLParser.AssignContext):
        pass

    # Exit a parse tree produced by SOLParser#assign.
    def exitAssign(self, ctx:SOLParser.AssignContext):
        pass


    # Enter a parse tree produced by SOLParser#compare.
    def enterCompare(self, ctx:SOLParser.CompareContext):
        pass

    # Exit a parse tree produced by SOLParser#compare.
    def exitCompare(self, ctx:SOLParser.CompareContext):
        pass


    # Enter a parse tree produced by SOLParser#operation.
    def enterOperation(self, ctx:SOLParser.OperationContext):
        pass

    # Exit a parse tree produced by SOLParser#operation.
    def exitOperation(self, ctx:SOLParser.OperationContext):
        pass


    # Enter a parse tree produced by SOLParser#condition.
    def enterCondition(self, ctx:SOLParser.ConditionContext):
        pass

    # Exit a parse tree produced by SOLParser#condition.
    def exitCondition(self, ctx:SOLParser.ConditionContext):
        pass


    # Enter a parse tree produced by SOLParser#value.
    def enterValue(self, ctx:SOLParser.ValueContext):
        pass

    # Exit a parse tree produced by SOLParser#value.
    def exitValue(self, ctx:SOLParser.ValueContext):
        pass


    # Enter a parse tree produced by SOLParser#function_call.
    def enterFunction_call(self, ctx:SOLParser.Function_callContext):
        pass

    # Exit a parse tree produced by SOLParser#function_call.
    def exitFunction_call(self, ctx:SOLParser.Function_callContext):
        pass


    # Enter a parse tree produced by SOLParser#function_def.
    def enterFunction_def(self, ctx:SOLParser.Function_defContext):
        pass

    # Exit a parse tree produced by SOLParser#function_def.
    def exitFunction_def(self, ctx:SOLParser.Function_defContext):
        pass


    # Enter a parse tree produced by SOLParser#loop.
    def enterLoop(self, ctx:SOLParser.LoopContext):
        pass

    # Exit a parse tree produced by SOLParser#loop.
    def exitLoop(self, ctx:SOLParser.LoopContext):
        pass


    # Enter a parse tree produced by SOLParser#list.
    def enterList(self, ctx:SOLParser.ListContext):
        pass

    # Exit a parse tree produced by SOLParser#list.
    def exitList(self, ctx:SOLParser.ListContext):
        pass


    # Enter a parse tree produced by SOLParser#tuple.
    def enterTuple(self, ctx:SOLParser.TupleContext):
        pass

    # Exit a parse tree produced by SOLParser#tuple.
    def exitTuple(self, ctx:SOLParser.TupleContext):
        pass


    # Enter a parse tree produced by SOLParser#hashmap.
    def enterHashmap(self, ctx:SOLParser.HashmapContext):
        pass

    # Exit a parse tree produced by SOLParser#hashmap.
    def exitHashmap(self, ctx:SOLParser.HashmapContext):
        pass


    # Enter a parse tree produced by SOLParser#enum.
    def enterEnum(self, ctx:SOLParser.EnumContext):
        pass

    # Exit a parse tree produced by SOLParser#enum.
    def exitEnum(self, ctx:SOLParser.EnumContext):
        pass


    # Enter a parse tree produced by SOLParser#string.
    def enterString(self, ctx:SOLParser.StringContext):
        pass

    # Exit a parse tree produced by SOLParser#string.
    def exitString(self, ctx:SOLParser.StringContext):
        pass


    # Enter a parse tree produced by SOLParser#integer.
    def enterInteger(self, ctx:SOLParser.IntegerContext):
        pass

    # Exit a parse tree produced by SOLParser#integer.
    def exitInteger(self, ctx:SOLParser.IntegerContext):
        pass


    # Enter a parse tree produced by SOLParser#float.
    def enterFloat(self, ctx:SOLParser.FloatContext):
        pass

    # Exit a parse tree produced by SOLParser#float.
    def exitFloat(self, ctx:SOLParser.FloatContext):
        pass


    # Enter a parse tree produced by SOLParser#compound_symbol.
    def enterCompound_symbol(self, ctx:SOLParser.Compound_symbolContext):
        pass

    # Exit a parse tree produced by SOLParser#compound_symbol.
    def exitCompound_symbol(self, ctx:SOLParser.Compound_symbolContext):
        pass


    # Enter a parse tree produced by SOLParser#symbol.
    def enterSymbol(self, ctx:SOLParser.SymbolContext):
        pass

    # Exit a parse tree produced by SOLParser#symbol.
    def exitSymbol(self, ctx:SOLParser.SymbolContext):
        pass


    # Enter a parse tree produced by SOLParser#special.
    def enterSpecial(self, ctx:SOLParser.SpecialContext):
        pass

    # Exit a parse tree produced by SOLParser#special.
    def exitSpecial(self, ctx:SOLParser.SpecialContext):
        pass


    # Enter a parse tree produced by SOLParser#op_prefix.
    def enterOp_prefix(self, ctx:SOLParser.Op_prefixContext):
        pass

    # Exit a parse tree produced by SOLParser#op_prefix.
    def exitOp_prefix(self, ctx:SOLParser.Op_prefixContext):
        pass



del SOLParser