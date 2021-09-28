declare

A = p(a: 5 b: 6)
B = p(a: 7 b: 8)

/*
    Mozart implements a default comparaison for records:
    Since A & B records have the same pattern: same label && same features
    then the comparaison between A & B with the binary operator '==' won't be false by default.
    But since a field value for a same feature is different then the comparaison will result as 'false'
*/

{Browse A == B} % displays 'false'
{Browse A \= B} % displays 'true'

/*
    records are fine but if one wants to iterate over the features
    one must get the collection of atoms and integers featuring that record
    and iterate over it.

    The conventional way of iterating over a record is to first
    restrict the domain of records to records with only ascending integers starting from 1 as features
    such as:
*/

X = primes(1: 2 2: 3 3: 7)

/*
    Then one can enumerate starting from 1 to {Width X}
    to access each field one by one by applying the '.' operator !

    That type of data structure is known as 'tuple'. It is so
    widely use that the Oz language propose a "sweeter" syntax to declare a tuple:
*/

Y = primes(2 3 7)   % syntactic sugar for tuples
{Browse X == Y}

/*
    tuples are fine but if one wants to iterate over different records
    one can declare a tuple of records:
*/

Z = triange(p(x: 5 y: 5) p(x: 8 y: 8) p(x: 3 y: 3))

/*
    tuples of records are fine but if one wants to append a new record to the tuple ?
    one must iterate over the tuple and redeclare it with another {Width tuple} + 1 features.
    The data structure is said to be not "dynamic".
*/

Quad = quad(Z.1 Z.2 Z.3 p(x: ~3 y: ~3))

/*
    this operation is quiet expensive so what if one wants to dynamicaly append a record ?
    one must nest records altogether as follows: 
*/

Integers = n(1 n(2 n(3 nil)))

% then if one wants to append a new record

Ints = n(0 Integers)

/*
    That type of data structure is known as a 'list'. It is so
    widely use that the Oz language propose a "sweeter" syntax to declare a 'list':
*/

Even = [2 4 6 8]    % syntactic sugar for 'list'

% then one can compose
ZeroEven = 0 | Even
{Browse ZeroEven}

% and acess
{Browse ZeroEven.1 == 0}        % 'true'
{Browse ZeroEven.2 == Even}     % 'true'
{Browse ZeroEven.2.1 == Even.1} % 'true'

% Oz language propose a "sweeter" syntax to declare "String":

Bye = "Bye !"
% Which is a list where all heads (L.1) are character value !
% Mozart propose predifined procedures that you can access from the Identifier "String", "List", "Tuple" ect...