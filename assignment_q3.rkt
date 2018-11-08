#lang racket
(provide sorted_order)
(provide is_present)
(provide insert_item)
(provide insert_list)
(provide tree_sort)
(provide higher_order)

; Some helper functions for trees.
(define (create node left right)(list left node right)); Make a tree using list
; take tree as a list of Left-Node-Right
; when creating, the format is Node-Left-Right
(define (left-child tree)(car tree)); return left branch
(define (value tree)(cadr tree)); return the value
(define (right-child tree)(caddr tree)); return right branch; caddr

; A
(define (sorted_order tree)
    (begin  (cond [ (not (null? (left-child tree))) (sorted_order (left-child tree))])
            ; If left child not null, call recusively on left child
            (display (value tree))
            ; Display node value
            (display " ")
            (cond [ (not (null? (right-child tree))) (sorted_order (right-child tree))])
            ; If right child not null, call recursively on right child
    )
)

; B
(define (is_present item tree)
    (cond   [ (null? tree) #f ]; Tree is empty
            [ (eq? item (value tree)) #t ]; Item Found
            [ (< item (value tree)) (is_present item (left-child tree)) ]; item < value then search left child
            [ (> item (value tree)) (is_present item (right-child tree)) ]; item > value then search right child
    )
)

; C
(define (insert_item item tree); Returns a new tree with the item added
    (cond   [ (null? tree) (create item null null) ]; If null, make a new tree
            [ (eq? (value tree) item) tree ]; If item is already there, dont change anything
            [ (< item (value tree)); If item < value insert in the right branch
                (create (value tree) (insert_item item (left-child tree)) (right-child tree)) ]
            [ (> item (value tree)); If item > value insert in the left branch
                (create (value tree) (left-child tree) (insert_item item (right-child tree))) ]
    )
)

; D
(define (insert_list lst tree); Returns a new tree with the list inserted
    (cond   [ (null? lst) tree ]; If the list is empty return the tree
            [ else (insert_list (cdr lst) (insert_item (car lst) tree)) ]
            ; Else recursivly call insert list on the rest of the list
            ; while inserting the Car of the list
    )
)

; E
; Take a list and make it into a binary search
(define (tree_sort lst)
    (define tree (insert_list lst '())); Make a tree and insert the list
    (sorted_order tree); Display the tree
)

; F
; Same as tree sort but with < or > function passed in
(define (higher_order lst order)
    ; 0 for normal ascending, 1 for descending
    (cond   [ (eq? order 0) (sorted_order (insert_list lst '() )) ]; Normal sort acending
            [ (eq? order 1) (sorted_order (insert_list_descending lst '() )) ]; Descending sort
    )
)

(define (insert_list_descending lst tree); Same as normal insert list but calls descending verion of insert item
    (cond   [ (null? lst) tree ];
            [ else (insert_list_descending (cdr lst) (insert_item_descending (car lst) tree)) ]
    )
)

(define (insert_item_descending item tree)
; Reversed implementation of insert item, will insert lower items on the right. 
    (cond   [ (null? tree) (create item null null) ]; If null, make a new tree
            [ (eq? (value tree) item) tree ]; If item is already there, dont change anything
            [ (> item (value tree)); if item > value, insert on left (opposite of normal)
                (create (value tree) (insert_item_descending item (left-child tree)) (right-child tree)) ]
            [ (< item (value tree)); if item < value, insert on right (opposite of normal)
                (create (value tree) (left-child tree) (insert_item_descending item (right-child tree))) ]
    )
)

; Create a tree for testing
(define one (create 1 null null))
(define three (create 3 null null))
(define five (create 5 null null))
(define seven (create 7 null null))
(define tree1 (create 2 one three))
(define tree2 (create 6 five seven))
(define MainTree (create 4 tree1 tree2))

;         4
;      /     \
;     2       6
;    / \     / \ 
;   1   3   5   7
;  / \ / \ / \ / \
;()() ()() ()() ()() Row of nulls

(sorted_order MainTree); Display tree
(display "\nIs 8 present? ")
(is_present 8 MainTree)

(display "\nInserting 8:\n"); Insert item into the tree
(define ChangedTree (insert_item 8 MainTree))
(sorted_order ChangedTree)
(display "\nIs 8 present? ")
(is_present 8 ChangedTree)


(define lst (list 8 9 10)); Insert list into the tree
(display "\nInserting a list: ")
(display lst)
(display "\ninto: ")
(sorted_order MainTree)
(display "\n")
(sorted_order (insert_list lst MainTree))

(define lst1 (list 5 2 9 3)); sort a list
(display "\n\nTree sorting : ")
(display lst1)
(display "\n")
(tree_sort lst1)

(define lst2 (list 1 2 3 4 5)); Higher order sort a list
(display "\n\nHigher Order Sorting Ascending : ")
(display lst2)
(display "\n")
(higher_order lst2 0)
(display "\n\nHigher Order Sorting Descending : ")
(display lst2)
(display "\n")
(higher_order lst2 1)
(display "\n\n")