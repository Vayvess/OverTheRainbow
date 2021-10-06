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
    is known as "Invariant programming" which is one of the best technique we know so far to solve a problem trough programming !

    Let's get a closer look to recursion !
*/

declare
fun {FastExpo X N}
    if N == 0 then
        1
    elseif N == 1 then
        X
    elseif N mod 2 == 0 then
        {FastExpo X * X N div 2}    % tail-recursive call
    else
        X * {FastExpo X * X (N - 1) div 2}  % non-tail-recursive call -> (bad performance)
    end
end
{Browse {FastExpo 2 15}}

/*
    A multi-task OS such as Unix allows numbers of simultaneous program execution, programs are executed
    under the form of 'process'. A process can be describe as being an instance of program that's beeing executing
    on one or more processor under the control of the OS. The OS maintains data structures which are required for the process to perform.
    
    This data structures are allocated and initialized on the RAM during the processus's booting, updated while the processus is running and deleted
    when the processus end.

    Each process in Linux has a memory mapping of 4GB (32 bit) and 8TB in (64 bit) environments:
    It's the maximum amount of memory that is possible to address by the OS. One can notice, that this is
    indepedent of how many physical memory a system has. Every process is giving the illusion to run alone on the computer.


    The memory space reserved by an OS such as Unix on the RAM can be organised as follows:

    - Segment OS: process info.
    - Segment text: Situated on the low part of the memory, it's in this zone that are stocked all the instruction which are executed by the micro-processor.
    - Segment initialized: Where the global variable which has been explicitly initialized (pre-processing step of the compilation).
    - Segment non-initialized: ~ filled then by default value.
    - Segment empty
    - Segment stack
    - programs entry point's arg and envp
    - Segment os: process info.

    After the allocation the OS loads "architecture" specific registers of the micro-processor determined by their ABI.
    
    For example on IA32:
    Processors does have at least 8 generic registers named:
    - EAX, EBX, ECX, EDX, EBP, ESI, EDI et ESP.

    - EBP and ESP are manufacturers optimized registers in order to handle stack manipulation
    Thus OS designer are well aware of that and conventionaly puts the summit of stack adress on
    the ESP register at booting.
    - Same goes by for EIP it stores program counter keeps track of the current instruction of the segment text.
    
    Now let's talk about compiler design, registers are initialized in a specific way by the OS but one may choose to handle
    compiler's intern data structure in a different way ! But stacks are well suited and commonly use ! Let's see how one could
    implement FOFPP with a stack.

    Whenever a procedure is called its arguments and the identifiers declared inside the procedure definition are pushed on the stack and the program counter is updated.
    So that on runtime procedure have quick access memory space to work on. When the procedure is done the stack is poped out and the program counter
    are updated. That is the reason why one talk about the scope of an identifier.
    
    Sources:
    - https://en.wikipedia.org/wiki/Process_(computing)
    - https://en.wikipedia.org/wiki/Application_binary_interface
    - https://en.wikipedia.org/wiki/Call_stack
*/

fun {Fact N}
    if N == 0 then 1
    else N * {Fact N - 1} end   % non-tail-recursive call -> (bad performance)
end
{Browse {Fact 4}}

/*
    Now let's talk about optimization, as one can see here we have a recursive call of the procedure Fact this means the stack has to be pushed for each of those calls.
    {Fact 4} grows as follows:
    - (4 * {Fact 3})
    - (4 * 3 * {Fact 2})
    - (4 * 3 * 2 * {Fact 1})
    - (4 * 3 * 2 * 1 * {Fact 0})
    - (4 * 3 * 2 * 1 * 1)   base case achieve (stops recursion)
    - (4 * 3 * 2 * 1)
    - (4 * 3 * 2)
    - (4 * 6)
    - (24) and procedure returns.

    As one can notice, the stack growing that way means that if N is too large we can run out of memory quickly. But no worries compiler
    designers have think through to solve that problem !

    Let's look at the best practice:
*/

fun {TcoFact N Acc}
    if N == 0 then Acc
    else {TcoFact N - 1 Acc * N} end    % tail-recursive call
end
{Browse {TcoFact 4 1}}

/*
    Since the recursive call is the last expression evaluated the stack can stay in place. Every decent compiler for a functional programming language
    does Tail-call optimization it's mandatory. But not every compiler does since they use loop control flow instead wich is equivalent to tail-call recursion function
    
    - https://en.wikipedia.org/wiki/Tail_call

    fun {Range I N}
        if N == 0 then nil                  % base case terminal condition
        else I | {Range I + 1 N - 1} end    % recursive call to Range -> is tail call optimize since | operator does no constraint to compiler (same goes for the # operator for tuple)
    end
*/
