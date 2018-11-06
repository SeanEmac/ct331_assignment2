#lang racket
(provide ins_beg)
(provide ins_end)
(provide count_top_level)
(provide count_instances)
(provide count_instances_tr)
(provide count_inst_tr)
(provide count_instances_deep)

; A
(define (ins_beg el lst)
  ; Can assume list is not empty  
  (cons el lst); Cons element to the list, this will put it at the start
)

; B
(define (ins_end el lst)
  (append lst (list el)); Append takes 2 list arguments, will append to the end
)

; C
(define (count_top_level lst)
  (cond [ (null? lst) 0 ]; if list is null return 0
        [ (null? (cdr lst)) 1 ]; if rest of list is null return 1
        [ else (+ 1 (count_top_level (cdr lst))) ]; else add 1 to the total and recursivly call count_top_level on rest of list
  )
)

; D
(define (count_instances el lst)
  (cond [ (null? lst) 0 ]; if list is null return 0
        [ (eq? (car lst) el) (+ 1 (count_instances el (cdr lst))) ]; if first matches element, +1 and call count_instances on the rest of list
        [ else (count_instances el (cdr lst)) ]; else just call count_instances on the rest of the list
  )
)

; E
(define (count_instances_tr el lst); Helper function
  (count_inst_tr el 0 lst); call the tail recursive function with a starting value of 0
)

(define (count_inst_tr el total lst); Tail recursive function
  (cond
    [ (null? lst) total ]; if empty return the total to the helper function
    [ (eq? (car lst) el) (count_inst_tr el (+ 1 total) (cdr lst)) ]; if the first and input match, +1 and call function on rest of list
    [ else (count_inst_tr el total (cdr lst)) ]; else call count_inst_tr on rest of list
  )
)

; F
(define (count_instances_deep el lst)
  (cond
    [ (null? lst) 0 ]; if empty return 0
    [ (list? (car lst)) (+ (count_instances_deep el (car lst))(count_instances_deep el (cdr lst))) ]; if car is a list, call count_instances_deep on that nested list + the rest of the list
    [ (eq? (car lst) el) (+ 1 (count_instances_deep el (cdr lst))) ]; if they match, +1 and call function on rest of list
    [ else (count_instances_deep el (cdr lst)) ]; else cal function on rest of list
  )
)