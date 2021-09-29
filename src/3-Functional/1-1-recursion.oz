/*
    The 'procedure' semantic concept induce reusability into our programs let see how far we can go in terms of reusability !
*/

declare
% Let's construct a 'list' of integers step by step !

A = nil % empty 'list'
/* Since Oz identifiers can only be bound one time to a value
    A = 1 | A
    will throw an error, we must introduce a new identifier (B) !
*/
B = 1 | A

/*
    Not only there's a limit of identifiers we can use if one wants to construct a large list but it's also
    heavy for the programmer to declare ! 'procedures' induce reusability into our programs so let's declare one !
*/

fun {Combine X Y}
    Y | X
end

C = {Combine B 2}   % displays [2 1]

/*
    The same problems appears but at least we now have a function :) ! This means reusability is now induce in our program.
    How does one can exploit this reusability efficiently ? Get a look at the following function !
*/

fun {Range I N}
    if N == 0 then nil                  % base case terminal condition
    else I | {Range I + 1 N - 1} end    % recursive call to Range
end

D = {Range 5 3}    
{Browse D}  % displays [5 6 7]

/*
    A function calling itself is known as "recursive", procedures induce reusability trough a program and a simple control flow such
    as the "if then else" clause allows to recurse (loop) over a set of instruction until a condition is reach ! This technique of programming
    is known as "Invariant programming" which is the best technique we know so far to solve a problem trough programming !

    Let's now talk about
*/
