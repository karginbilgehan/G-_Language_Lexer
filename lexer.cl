;"||" is used to separate elements from each other
(defvar fileToRead ""); is used to read a file
(defvar intControl 0);is used for the incoming character is an integer
(defvar opControl 0);is used for the incoming character is an operator
(defvar idenControl 0);;is used for the incoming character is an identifier
(defvar partial "");is used to parse the given code
(defvar partialForOperators "");is used to parse the given code for operators
(defvar lexerAnalysis "");is used to to keep the result

;gloabal vareiables
(defvar addop "+")
(defvar subop "-")
(defvar multop "*")
(defvar sqrop "**")
(defvar divideop "/")
(defvar openparan "(")
(defvar closeparan ")")
(defvar trueop "true")
(defvar falseop "false")
(defvar andkeyword "and")
(defvar orkeyword "or")
(defvar notkeyword "not")
(defvar equalkeyword "equal")
(defvar appendkeyword "append")
(defvar concatkeyword "concat")
(defvar setkeyword "set")
(defvar deffunkeyword "deffun")
(defvar forkeyword "for")
(defvar whilekeyword "while")
(defvar ifkeyword "if")
(defvar exitkeyword "exit")

;it is the main function
(defun lexer (filename)
  (with-open-file (stream filename)
     (loop :for fileToRead := (read-char stream nil) :while fileToRead :collect 
      	(specifiy fileToRead ) 
     )
  		
  )	
  	
	(setf lexerAnalysis (list lexerAnalysis))
	lexerAnalysis	
)
;it is used to separate elements in the given file. Provides control over space, new line and tab.
;determines whether the incoming element is an integer value, keyword, operator or identifier.
;calls the "adlist" function to add the required elements to the list after the determination is finished.
;elm: Parameter from a file which include a character 
(defun specifiy (elm)
	(cond 
		;determines whether the incoming element is an operator
		((or (string-equal elm subop) (string-equal elm addop))
			(setf partialForOperators (concatenate 'string partialForOperators (list elm)))
			(setf opControl 1)
			(addList partialForOperators))

		((or (string-equal elm multop) (string-equal elm sqrop))
			(setf partialForOperators (concatenate 'string partialForOperators (list elm)))
			(setf opControl 1)
			(addList partialForOperators))
		
		((or (string-equal elm openparan) (string-equal elm closeparan) (string-equal elm divideop))
			(setf partialForOperators (concatenate 'string partialForOperators (list elm)))
			(setf opControl 1)
			(addList partialForOperators))	
		
		((or (char= elm #\Space ) (char= elm #\Newline) (char= elm #\Tab))
			(addList partial))
		;determines whether the incoming element is an character
 		((alpha-char-p elm)
			(setf partial (concatenate 'string partial (list elm)))
			(setf idenControl 1))
		
		;determines whether the incoming element is an integer
	 	((eq (isInteger elm) 1)
			(setf partial (concatenate 'string partial (list elm)))
			(setf intControl 1))

	)
)
;Checks whether the incoming number is an integer for integer control
;Used within the "specifiy" function
(defun isInteger (var)
	(cond 

		( (string-equal var "0")1)
		( (string-equal var "1")1)
		( (string-equal var "2")1)
		( (string-equal var "3")1)
		( (string-equal var "4")1)
		( (string-equal var "5")1)
		( (string-equal var "6")1)
		( (string-equal var "7")1)
		( (string-equal var "8")1)
		( (string-equal var "9")1)
		(t 0)

	)
)
;provides control of the list as parsed
;after providing control, adds the required element to the list
;parseList: The parsed list from the "specify" function
(defun addList (parseList) 
	
	
	(cond 
		((string-equal parseList trueop)
			(setf lexerAnalysis (concatenate 'string lexerAnalysis "BinaryOperator ---> true || "))
			(setf partial ""))

		((string-equal parseList falseop)
			(setf lexerAnalysis (concatenate 'string lexerAnalysis "BinaryOperator ---> false || "))
			(setf partial ""))

		((string-equal parseList andkeyword)
			(setf lexerAnalysis (concatenate 'string lexerAnalysis "keyword ---> and || "))
			(setf partial ""))
	
	
	 	((string-equal parseList orkeyword)
			(setf lexerAnalysis (concatenate 'string lexerAnalysis "keyword ---> or || "))
			(setf partial ""))
	 	
	 	((string-equal parseList notkeyword)
			(setf lexerAnalysis (concatenate 'string lexerAnalysis "keyword ---> not|| "))
			(setf partial ""))

	 	((string-equal parseList equalkeyword)
			(setf lexerAnalysis (concatenate 'string lexerAnalysis "keyword ---> equal || "))
			(setf partial ""))

	 	((string-equal parseList appendkeyword)
			(setf lexerAnalysis (concatenate 'string lexerAnalysis "keyword ---> append || "))
			(setf partial ""))

	 	((string-equal parseList concatkeyword)
			(setf lexerAnalysis (concatenate 'string lexerAnalysis "keyword ---> concat || "))
			(setf partial ""))

	 	((string-equal parseList setkeyword)
			(setf lexerAnalysis (concatenate 'string lexerAnalysis "keyword ---> set || "))
			(setf partial ""))

	 	((string-equal parseList deffunkeyword)
			(setf lexerAnalysis (concatenate 'string lexerAnalysis "keyword ---> deffun || "))
			(setf partial ""))

	 	((string-equal parseList forkeyword)
			(setf lexerAnalysis (concatenate 'string lexerAnalysis "keyword ---> for || "))
			(setf partial ""))

	 	((string-equal parseList whilekeyword)
			(setf lexerAnalysis (concatenate 'string lexerAnalysis "keyword ---> while || "))
			(setf partial ""))

	 	((string-equal parseList ifkeyword)
			(setf lexerAnalysis (concatenate 'string lexerAnalysis "keyword ---> if || "))
			(setf partial ""))

	 	((string-equal parseList exitkeyword)
			(setf lexerAnalysis (concatenate 'string lexerAnalysis "keyword ---> exit || "))
			(setf partial ""))
	 	
	 	((eq intControl 1)
	 		(setf lexerAnalysis (concatenate 'string lexerAnalysis "IntegerValue ---> " partial " || "))
	 		(setf partial "")
	 		(setf intControl 0))

	 	((eq opControl 1)
	 		(setf lexerAnalysis (concatenate 'string lexerAnalysis "Operator ---> " partialForOperators " || "))
	 		(setf partialForOperators "")
	 		(setf opControl 0))

	 	((eq idenControl 1)
	 		(setf lexerAnalysis (concatenate 'string lexerAnalysis "Identifier ---> " partial " || "))
	 		(setf partial "")
	 		(setf idenControl 0))
	 	
	 	(t  (setf partial "") 
	 		(setf partialForOperators ""))
	)
)
