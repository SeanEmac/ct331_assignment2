#lang racket

(require (file "assignment_q2.rkt")
         (file "assignment_q3.rkt"))

;
;Don't worry about this file unless you are doing the extra credit tests. 
;

;This structure allows a single function call
;to run every test in sequence, rather than
;calling each function separately. 
(define (runTests)
  (begin
    (display "Running tests...\n")
    ;begin calling test functions
    (printf "1: ~a\n" (test_ins_beg1))
    (printf "2: ~a\n" (test_ins_end1))
    (printf "3: ~a\n" (test_count_tl))
    (printf "4: ~a\n" (test_instances))
    (printf "5: ~a\n" (test_instances_tr))
    (printf "6: ~a\n" (test_instances_deep))

    ;end calling test functions
    (display "\nTests complete!\n")))

;Begin test functions
(define (test_ins_beg1)
  (equal? (ins_beg 1 '(2 3 4)) '(1 2 3 4)))

(define (test_ins_end1)
  (equal? (ins_end d '(a b c)) '(a b c d)))
  
(define (test_count_tl)
  (eq? (count_top_level '(a b c d (e f))) 5))

(define (test_instances)
  (eq? (count_instances 1 '(1 2 1 3 1 4)) 3))

(define (test_instances_tr)
  (eq? (count_instances_tr 1 '(1 2 1 3 1 4)) 3))

(define (test_instances_deep)
  (eq? (count_instances_deep 1 '( 2 (1) 1 (2 (1 (1 2)) 1))) 5))
;End test functions
;Run the tests
(runTests)