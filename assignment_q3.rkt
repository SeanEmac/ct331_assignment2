#lang racket
(provide sorted_order)
(provide is_present)
(provide insert_item)
(provide insert_list)
(provide tree_sort)
(provide higher_order)

; Some helper functions for trees.
(define (create value left-child right-child)(list value left-child right-child)); Make a tree using list
(define (value tree)(car tree)); return the value
(define (left-child tree)(cadr tree)); return left branch
(define (right-child tree)(caddr tree)); return right branch

(define (sorted_order tree)
    (cond   [ (null? tree) #f ]; Tree is empty
            [ else ((sorted_order(left-child tree)); Call on Left sub-tree first so that its in sorted order
                    (display (value tree)); Print Current value
                    (sorted_order(right-child tree))) ]; Call on Right sub-tree
    )
)

(define (is_present item tree)
    (cond   [ (null? tree) #f ]; Tree is empty
            [ (eq? item (value tree)) #t ]; Item Found
            [ (< item (value tree)) (is_present item (left-child tree)) ]; item < value then search left child
            [ (> item (value tree)) (is_present item (right-child tree)) ]; item > value then search right child
    )
)

(define (insert_item item tree); Returns a new tree with the item added
    (cond   [ (null? tree) (create item null null) ]; If null, make a new tree
            [ (eq? (value tree) item) tree ]; If item is already there, dont change anything
            [ (< item (value tree)); If item < value insert in the right branch
                (create (value tree) (insert_item item (left-child tree)) (right-child tree)) ]
            [ (> item (value tree)); If item > value insert in the left branch
                (create (value tree) (left-child tree) (insert_item item (right-child tree))) ]
    )
)

(define (insert_list lst tree); Returns a new tree with the list inserted
    (cond   [ (null? (car lst)) tree ]; If the list is empty return the tree
            [ else ( (insert_item (car lst)); Insert the first item in the list
                     (insert_list (cdr lst) tree) )]; Recursively inser the rest of the list
    )
)

; Take a list and make it into a binary search
(define (tree_sort lst)
    (define tree (insert_list lst '())); Make a tree and insert the list
    (sorted_order tree); Display the tree
)

; Same as insert list but with < or > passed in
(define (higher_order lst func)
    (display "sorted list higher order\n")
)

(define tree1 (create 2 1 3))
(define tree2 (create 6 5 7))
(define tree3 (create 4 tree1 tree2))

;        4
;     /     \
;    2       6
;   / \     / \ 
;  1   3   5   7