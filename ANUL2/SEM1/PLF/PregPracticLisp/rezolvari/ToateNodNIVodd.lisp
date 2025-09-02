(defun substituie (l e niv)
    (cond
        ((null l) nil)
        ((atom l) (cond 
                    ((equal (mod niv 2) 1) e)
                    (t l)))
        (t (mapcar #'(lambda (x) (substituie x e (+ niv 1))) l))
    )
)

(defun main(l e)
    (substituie l e 1)
)

; Test examples
(print (main '(1 (2 3) (4 (5 1) 1) 1) 0))  ; replaces all atoms on odd levels with 0
(print (main '(a (b (c) (d)) (e (f) g)) 'x))  ; replaces all atoms on odd levels with x
(print (main '(1 2 (3 4 (5 6) 7) 8) 9))  ; replaces all atoms on odd levels with 9