grammar SOL;

program
    : expression (BREAK expression)* EOF
    | expression BREAK EOF
    ;

expression
    : value
    | assign
    | compare
    | operation
    | condition
    | expression condition+
    ;

assign
    : SYMBOL OP_ASSIGN value
    ;

compare
    : value OP_COMPARE value
    ;

operation
    : value OP value
    ;

condition
    : '?' '{' '}'
    | '?' '{' expression (BREAK expression)* '}'
    | '||' '{' '}'
    | '||' '{' expression (BREAK expression)* '}'
    ;

value
    : OP_PREFIX* SYMBOL
    | OP_PREFIX* '(' expression ')'
    | function_call
    | float
    | integer
    | STRING
    ;

function_call
    : OP_PREFIX* SYMBOL '(' ')'
    | OP_PREFIX* SYMBOL '(' (expression (',' expression)*)? ')'
    ;

float: INT (NUM_SEPARATOR INT)* '.' INT (NUM_SEPARATOR INT)* ;
integer: INT (NUM_SEPARATOR INT)* ;

/*
string
    : '\'' ('\\\'' | STR | '{' expression '}')* '\''
    ;
*/

fragment OP_CLASS: '@';
fragment OP_TYPE: '%';
fragment OP_NOT: '!';

OP_PREFIX
    : OP_CLASS
    | OP_TYPE
    | OP_NOT
    ;

fragment OP_EQ:             '==';
fragment OP_NOT_EQ:         '!=';
fragment OP_LOOSE_EQ:       '~=';
fragment OP_LESS_THAN:      '<' ;
fragment OP_LESS_THAN_EQ:   '<=';
fragment OP_MORE_THAN:      '<' ;
fragment OP_MORE_THAN_EQ:   '<=';
fragment OP_TYPE_EQ:        '%=';

OP_COMPARE
    : OP_EQ
    | OP_NOT_EQ
    | OP_LOOSE_EQ
    | OP_LESS_THAN
    | OP_LESS_THAN_EQ
    | OP_MORE_THAN
    | OP_MORE_THAN_EQ
    | OP_TYPE_EQ
    ;

fragment OP_ADD: '+'  ;
fragment OP_SUB: '-'  ;
fragment OP_POW: '**' ;
fragment OP_MUL: '*'  ;
fragment OP_MOD: '//' ;
fragment OP_DIV: '/'  ;

OP
    : OP_EQ
    | OP_ADD
    | OP_POW
    | OP_MUL
    | OP_MOD
    | OP_DIV
    ;

fragment OP_ASS:            '='     ;
fragment OP_ADD_INPLACE:    '+='    ;
fragment OP_SUB_INPLACE:    '-='    ;
fragment OP_POW_INPLACE:    '**='   ;
fragment OP_MUL_INPLACE:    '*='    ;
fragment OP_TYPE_INPLACE:   '%='    ;
fragment OP_MOD_INPLACE:    '//='   ;
fragment OP_DIV_INPLACE:    '/='    ;

OP_ASSIGN
    : OP_ASS
    | OP_ADD_INPLACE
    | OP_SUB_INPLACE
    | OP_POW_INPLACE
    | OP_MUL_INPLACE
    | OP_TYPE_INPLACE
    | OP_MOD_INPLACE
    | OP_DIV_INPLACE
    ;

STRING: '$'? '\'' ~[\\\']* '\'' ;
COMMENT: ('/*' .*? '*/') -> channel(HIDDEN) ;
NUM_SEPARATOR: '_' ;
INT: [0-9]+ ;
SYMBOL: ('.' | '$')? ID ('.' ID)* ;
ID: [a-zA-Z][a-zA-Z0-9]* ;
BREAK: (';' | NL) -> skip;
NL: [\r\n]+ -> skip ;
SPACE: [ \t]+ -> skip ;

