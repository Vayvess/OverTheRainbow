/*
    Let's start with the "Descriptive declarative programming paradigm" (DDPP)
    JSON is a context free language which embodies only one semantic concept the "record" thus
    JSON is said to belonging to the DDPP which isn't turing complete.

    let's discover the "record" semantic concept trough Oz
*/

/* example of declaration of Number type constant:
    - 8 -> Int (positive)
    - ~8 -> Int (negative)
    - 8.0 -> Float (positive)
    - ~8.0 -> Float (negative)
    - &a -> Char (a)
*/

% A, B, C, D, E, F are the identifiers introduced
local A B C D E F in
    % an identifier can be bound to a Number type constant as follows
    A = 8       % Int (positive)
    B = ~7      % Int (negative)
    C = 3.0     % Float (positive)
    D = ~8.5    % Float (negative)
    E = &a      % Char (a -> 97 ASCII)

    % an identifier can be bound to a Record type constant as follows
    F = numbers(
        numConst: 84
        intPos: A
        'intNeg': B
        66: C
        'floatNeg': D
        charA: E
        isBneg: B < 0
    )

    /*  BNF-like notation of a record !
        - 'numbers' is the label of the record -> <label> ::= <atom> | true | false | unit
        - <atom> ::= lowercase letters -> 'i am an atom' | imAtom

        - intPos, 'intNeg', 66, ect... are the features of the record
        - <feature> ::= <atom> | <integer> | true | false | unit

        - finally: <label>( {<feature>: <expression>} )
        - <expression>: http://mozart2.org/mozart-v1/doc-1.4.0/notation/node3.html#chapter.context-free
    */

    {Browse F}
    {Browse F.numConst}
    {Browse F.'intPos'}
    {Browse F.66}
    {Browse F.(65 + 1)}
    {Browse F.isBneg}
end
% end of the local scope of the identifiers A, B, C, D, E, F

/*
    The scope of an identifier is the part of the program text for which
    each occurrence of the identifier corresponds to the same memory adress.
    {Browse A} would throw a binding analysis error -> variable A not introduced
*/
