#lang racket
;A cons pair of two numbers
(cons 1 2)

;A list of 3 numbers, using only the cons function. 
(cons 1 (cons 2 (cons 3 empty)))

;A list containing a string, a number and a nested list of three numbers,
;using only the cons function.
(cons "string" (cons 9 '((1 2 3))))

;using only the list function.
(list "string" 9 (list 1 2 3))

;using only the append function. 
(append '("string") '(9) '((1 2 3)))