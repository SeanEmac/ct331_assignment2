#lang racket
(cons 1 2)
(cons 1 (cons 2 (cons 3 empty)))
(cons "string" (cons 9 (cons 1 (cons 2 (cons 3 empty)))))
;(cons "string" (cons 9 '(1 2 3)))
(list "string" 9 (list 1 2 3))
(append '("string") '(9) '((1 2 3)))