% (optional) Setting up the Browser GUI -> http://mozart2.org/mozart-v1/doc-1.4.0/browser/index.html
{Browser.object option(buffer size:64)}
{Browser.object option(special xSize:400)}
{Browser.object option(special ySize:320)}
{Browser.object option(representation strings:true)} % Avoid ASCII List Representation

/* There's two shortcuts that can be handy ->
    - CTRL-U: Clear the browser text
    - CTRL-X: Exit the browser
*/

% The Browser can be invoked by the predefined unary procedure Browse
{Browse "Hello, world!"}

/* The Oz Browser:
    - The Oz Browser is a concurrent output tool for displaying possibly partial information about the values of identifiers.
    - Browser has a graphical user interface which is built using the Oz Tk interface: http://mozart2.org/mozart-v1/doc-1.4.0/wp/index.html

    - All identifiers starts with a CAPITAL letters so does "Browser".
    - An identifier refers to a value located in the program's stack or heap.
    - More about the Oz notation: http://mozart2.org/mozart-v1/doc-1.4.0/notation/index.html
*/