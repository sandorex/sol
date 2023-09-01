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
    | expression condition+
    | loop
    | special
    ;

assign
    : symbol OP_ASSIGN expression
    | symbol OP_ADD_INPLACE expression
    | symbol OP_SUB_INPLACE expression
    | symbol OP_POW_INPLACE expression
    | symbol OP_MUL_INPLACE expression
    | symbol OP_TYPE_INPLACE expression
    | symbol OP_MOD_INPLACE expression
    | symbol OP_DIV_INPLACE expression
    ;

compare
    : value OP_EQ value
    | value OP_NOT_EQ value
    | value OP_LOOSE_EQ value
    | value OP_LESS_THAN value
    | value OP_LESS_THAN_EQ value
    | value OP_MORE_THAN value
    | value OP_MORE_THAN_EQ value
    | value OP_TYPE_EQ value
    ;

operation
    : value OP_EQ value
    | value OP_ADD value
    | value OP_POW value
    | value OP_MUL value
    | value OP_MOD value
    | value OP_DIV value
    ;

condition
    : '?' '{' module? '}'
    | '||' '{' module? '}'
    ;

value
    : function_def
    | op_prefix* function_call
    | op_prefix* symbol
    | op_prefix* compound_symbol
    | op_prefix* '(' expression? ')'
    | op_prefix* '{' module? '}'
    | FLOAT
    | INT
    | STRING
    | list
    | tuple
    | hashmap
    | enum
    ;

function_call
    : (symbol | compound_symbol) '(' (value (',' value)* ','?)? ')'
    ;

function_def
    : '('
        (
            symbol ('=' value)? (',' symbol ('=' value)?)* ','?
        )?
    ')' '{' module? '}'
    ;

loop
    : value? '->' value? '{' module? '}'
    ;

list
    : '[' ']'
    | '[' value (',' value)* ','? ']'
    ;

tuple
    : '[' ';' ']'
    | '[' value (';' value)* ';'? ']'
    ;

hashmap
    : '[' '=' ']'
    | '[' value '=' value (';' value '=' value)* ';'? ']'
    ;

enum
    : OP_CLASS '['
        (
            ID (',' ID)* ','?
        )?
    ']'
    ;

// basically x.y.z
compound_symbol
    : ('.' | SYS_PREFIX)? ID ('.' ID)+
    ;

// $x, .x, x are different symbols
symbol
    : ('.' | SYS_PREFIX)? ID
    ;

special
    : RETURN expression?
    ;

op_prefix
    : OP_CLASS
    | OP_TYPE
    | OP_NOT
    ;

OP_CLASS: '@' ;
OP_TYPE:  '%' ;
OP_NOT:   '!' ;

OP_EQ:             '=='  ;
OP_NOT_EQ:         '!='  ;
OP_LOOSE_EQ:       '~='  ;
OP_LESS_THAN:      '<'   ;
OP_LESS_THAN_EQ:   '<='  ;
OP_MORE_THAN:      '>'   ;
OP_MORE_THAN_EQ:   '>='  ;
OP_TYPE_EQ:        '%==' ;

OP_ADD: '+'  ;
OP_SUB: '-'  ;
OP_POW: '**' ;
OP_MUL: '*'  ;
OP_MOD: '//' ;
OP_DIV: '/'  ;

OP_ASSIGN:         '='   ;
OP_ADD_INPLACE:    '+='  ;
OP_SUB_INPLACE:    '-='  ;
OP_POW_INPLACE:    '**=' ;
OP_MUL_INPLACE:    '*='  ;
OP_TYPE_INPLACE:   '%='  ;
OP_MOD_INPLACE:    '//=' ;
OP_DIV_INPLACE:    '/='  ;

RETURN: '<>' ;

ID: [a-zA-Z_][a-zA-Z_0-9]* ;
STRING: SYS_PREFIX? '\'' (~'\'')* '\'' ;
FLOAT: INT '.' INT ;
INT: [0-9_]+ ;

SYS_PREFIX: '$' ;

NL: [\r\n]+ -> skip ;
WHITESPACE: [ \t]+ -> skip ;

COMMENT: ('/*' .*? '*/') -> channel(HIDDEN) ;

// vim: set commentstring=//%s :

