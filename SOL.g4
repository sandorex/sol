grammar SOL ;

program: module EOF ;

module
    : expression (';' | NL)?
    | expression ((';' | NL) expression)+ (';' | NL)?
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
    : (compound_symbol | symbol) OP_ASSIGN expression
    | (compound_symbol | symbol) OP_INPLACE_ADD expression
    | (compound_symbol | symbol) OP_INPLACE_SUB expression
    | (compound_symbol | symbol) OP_INPLACE_POW expression
    | (compound_symbol | symbol) OP_INPLACE_MUL expression
    | (compound_symbol | symbol) OP_INPLACE_MOD expression
    | (compound_symbol | symbol) OP_INPLACE_DIV expression
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
    | op_prefix* compound_symbol
    | op_prefix* symbol
    | op_prefix* '(' expression? ')'
    | op_prefix* '{' module? '}'
    | float
    | integer
    | string
    | list
    | tuple
    | hashmap
    | enum
    ;

function_call
    : (compound_symbol | symbol) '(' (value (',' value)* ','?)? ')'
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

string
    : STR
    ;

integer
    : INT
    ;

float
    : FLOAT
    ;

compound_symbol
    : ('.' | SYS_PREFIX)? ID ('.' ID)+
    ;

// $x, .x, x are different symbols
symbol
    : ('.' | SYS_PREFIX)? ID
    ;

// sys_symbol
//     : SYS_PREFIX symbol
//     ;

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
OP_INPLACE_ADD:    '+='  ;
OP_INPLACE_SUB:    '-='  ;
OP_INPLACE_POW:    '**=' ;
OP_INPLACE_MUL:    '*='  ;
OP_INPLACE_MOD:    '//=' ;
OP_INPLACE_DIV:    '/='  ;

RETURN: '<>' ;

OP_LOOP: '->' ;
OP_IF: '?' ;
OP_ELSE: '||' ;

PBEG: '(' ;
PEND: ')' ;
SBEG: '[' ;
SEND: ']' ;
BBEG: '{' ;
BEND: '}' ;

EXPR_BREAK: ';' ;
DOT: '.' ;
COMMA: ',' ;

ID: [a-zA-Z_][a-zA-Z_0-9]* ;
STR: SYS_PREFIX? '\'' (~'\'')* '\'' ;

FLOAT: INT '.' INT ;
INT
    : '0b' [01]+
    | '0x' [0-9ABCDEFabcdef]+
    | [0-9_]+
    ;

SYS_PREFIX: '$' ;

NL: [\r\n]+ -> skip ;
WHITESPACE: [ \t]+ -> skip ;
COMMENT: ('/*' .*? '*/') -> channel(HIDDEN) ;

// vim: set commentstring=//%s :

