declare % inits the global scope for all the identifier introduced until end of file

X = 8   % Identifier X is introduced then bound to 8 (int type constant) for the global scope of the program

/*
    Every type in Oz have a predefined Identifier, what are they all bound to ?
    Let's start with "Value" the base type of the Oz type hierarchy !
*/

{Browse Value} 
/*  displays a record with all predifined procedure concerning Value type
    remembers that "Browse" is a procedure ? This mean we can call them too !
*/

Y = {Value.type Value}  % call of the procedure of the field of the feature 'type' of the record of the identifier "Value" 
{Browse Y}              % displays 'record'

% What's the type of the identifier "Y" ?
{Browse {Value.type Y}} % (Nested calls !) -> displays 'atom'

% More about the Oz types and their predifined procedures: http://mozart2.org/mozart-v1/doc-1.4.0/base/index.html
