(defun sau(l)
    (cond
        ((null l) NIL)
        (T (OR (CAR l) (sau (cdr l))))
    )
)

(defun nivel(l niv e)
    (cond
        ((AND (atom l) (equal l e) (equal (mod (+ niv 1) 2) 0)) T)  ; modified condition
        ((AND (atom l) (equal l e) (equal (mod (+ niv 1) 2) 1)) NIL)
        ((AND (atom l) (not (equal l e))) NIL)
        (T (FUNCALL #'sau (mapcar #'(lambda (l) (nivel l (+ niv 1) e)) l)))
    )
)

; Test cases with root at level 0
(print (nivel '(a (b (g)) (d (d(e))(f))) 0 'a))      ; starts at level 0
(print (nivel '(1 (2 (1)) (3 (1))) 0 1))       ; starts at level 0
(print (nivel '(x (y (x (x))) (x)) 0 'x))      ; starts at level 0