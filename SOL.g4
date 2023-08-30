grammar SOL ;

program: module EOF ;

module
    : expression ((';' | NL)* expression)* (';' | NL)*
    ;

expression
    : value
    | assign
    | compare
    | operation
    | condition
    | expression condition+
    | loop
    | special
    ;

// move the operators over here so they dont create additional node in AST
assign
    : SYMBOL op_assign expression
    ;

compare
    : value op_compare value
    ;

operation
    : value op value
    ;

condition
    : '?' '{' '}'
    | '?' '{' module '}'
    | '||' '{' '}'
    | '||' '{' module '}'
    ;

value
    : op_prefix* SYMBOL
    | op_prefix* function_call
    | FLOAT
    | INT
    | STRING
    | list
    | tuple
    | hashmap
    | function
    | op_prefix* '(' expression ')'
    ;

function_call
    : SYMBOL '(' ')'
    | SYMBOL '(' (value (',' value)*)? ')'
    ;

// TODO function arguments
function
    : '(' ')' '{' module? '}'
    ;

loop
    : value? '->' value? '{' module? '}'
    ;

// TODO these dont accept newlines as breaks
list
    : '[' ']'
    | '[' value (',' value)* ','? ']'
    ;

tuple
    : '[' ';' ']'
    | '[' value (';' value)* ';'? ']'
    ;

hashmap
    : '[#]'
    | '[' value '=' value (';' value '=' value)* ';'? ']'
    ;

OP_CLASS: '@';
OP_TYPE: '%';
OP_NOT: '!';

op_prefix
    : OP_CLASS
    | OP_TYPE
    | OP_NOT
    ;

OP_EQ:             '==' ;
OP_NOT_EQ:         '!=' ;
OP_LOOSE_EQ:       '~=' ;
OP_LESS_THAN:      '<'  ;
OP_LESS_THAN_EQ:   '<=' ;
OP_MORE_THAN:      '>'  ;
OP_MORE_THAN_EQ:   '>=' ;
OP_TYPE_EQ:        '%==';

op_compare
    : OP_EQ
    | OP_NOT_EQ
    | OP_LOOSE_EQ
    | OP_LESS_THAN
    | OP_LESS_THAN_EQ
    | OP_MORE_THAN
    | OP_MORE_THAN_EQ
    | OP_TYPE_EQ
    ;

OP_ADD: '+'  ;
OP_SUB: '-'  ;
OP_POW: '**' ;
OP_MUL: '*'  ;
OP_MOD: '//' ;
OP_DIV: '/'  ;

op
    : OP_EQ
    | OP_ADD
    | OP_POW
    | OP_MUL
    | OP_MOD
    | OP_DIV
    ;

OP_ASSIGN:         '='     ;
OP_ADD_INPLACE:    '+='    ;
OP_SUB_INPLACE:    '-='    ;
OP_POW_INPLACE:    '**='   ;
OP_MUL_INPLACE:    '*='    ;
OP_TYPE_INPLACE:   '%='    ;
OP_MOD_INPLACE:    '//='   ;
OP_DIV_INPLACE:    '/='    ;

op_assign
    : OP_ASSIGN
    | OP_ADD_INPLACE
    | OP_SUB_INPLACE
    | OP_POW_INPLACE
    | OP_MUL_INPLACE
    | OP_TYPE_INPLACE
    | OP_MOD_INPLACE
    | OP_DIV_INPLACE
    ;

LOOP_BREAK: '<>' ;

special
    : LOOP_BREAK
    ;

fragment ID: [a-zA-Z_][a-zA-Z_0-9]* ;
SYMBOL: ('.' | '$')? ID ('.' ID)* ;

STRING: '$'? '\'' (~'\'')* '\'' ;

FLOAT: INT '.' INT ;
INT: [0-9_]+ ;

NL: [\r\n]+ -> skip ;
WHITESPACE: [ \t]+ -> skip ;

COMMENT: ('/*' .*? '*/') -> channel(HIDDEN) ;

// vim: set commentstring=//%s :
