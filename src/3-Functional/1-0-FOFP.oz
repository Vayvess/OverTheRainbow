/*
    Let's extend the "Descriptive declarative programming paradigm" (DDPP)
    with the "procedure" semantic concept whenever a context-free language embodies
    at least these two semantic concept (record, procedure) it is said turing complete.

    let's discover the "procedure" semantic concept trough Oz
*/
declare

L = [1 2 3 4 5]
{Browse L}  % We already used procedure before in the DDPP but they were predifined, let's now defined our own !

proc {Cube X Y} % the identifier of our procedure is Cube, the parameters of our procedure are X and Y
    Y = X * X * X
end

Z           % Z is introduced
{Cube 3 Z}  % procedure call with args 3 Z
{Browse Z}  % display 27

% a "sweeter" syntax
A = {Cube 4}    % A is the arg of the last parameter of the procedure Cube
{Browse A}      % Browse doesn't bound any value thus have no "return value"

% procedure with a "return value" are known as "function" and are so widely used that the Oz language propose a "sweeter" syntax:

fun {Square X}
    X * X   % last expression evaluated will be the return value
end

C = {Square 8}

/*  All those syntactic sugars are translated at first by Mozart to the kernel language of Oz for sake of the compiler implementation simplicity.
    result from the Oz emacs plugin -> core syntax
    
    declare Square C in
    local UnnestApply1 in
    proc {Square X Result1}
        Result1 = X * X
    end
    UnnestApply1 = 8
    {Square UnnestApply1 C}
    {Browser C}
    end
*/