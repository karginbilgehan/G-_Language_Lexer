# G-_Language_Lexer
A lexer implementation for G++. G++ is a kind of functional programming language that given the description.
This program takes a file name and perform lexical analysis of the program contained within this file.

## Tokenize
Lexer must tokenize the given program according to some properties. These features are as follows:
 * Keywords:
    * ``` and, or, not, equal, append, concat, set, deffun, for, if, exit ```
 * Operators:
    * ``` +, -, /, *, (, ), ** ```
 * Terminals:
    * Operators
    * Keywords
    * Id -> [a-zA-Z]+
    * BinaryValue -> True | False
    * IntegerValue -> [-]* [1-9]* [0-9]+
 
## Sample Input and Output 
Sample input and output is provided below.

* Sample Input:

 (deffun sumup (x)
    (if (equal x 0)
      1
      (+ x (sumup (- x 1)))
    )
 )

* Sample Output:

(("operator" "(") ("keyword" "deffun")
("identifier" "sumup") ("operator" "(")
("identifier" "x") ("operator" ")") ("operator"
"(") ("keyword" "if") ("operator" "(") ("keyword"
"equal") ("identifier" "x") ("integer" "0")
("operator" ")") ("integer" "1") ("operator" "(")
("operator" "+") ("identifier" "x") ("operator"
"(") ("identifier" "sumup") ("operator" "(")
("operator" "-") ("identifier" "x") ("integer" "1")
("operator" ")") ("operator" ")") ("operator" ")")
("operator" ")") ("operator" ")")
