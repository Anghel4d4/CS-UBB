(defun first_atom(l)
    (cond
        ((null l) nil)
        ((atom l) l)
        (t (first_atom (car l)))
    )
)

(defun solve(l)
    (cond
        ((null l) 0)
        ((atom l) 0)
        ((not (numberp (first_atom l))) (+ 1 (apply #'+ (mapcar #'solve l))))
        (t (apply #'+ (mapcar #'solve l)))
    )
)

; Test
(print (solve '(A (B 2) (1 C (D 3)) (2 E))))
; Va afișa 4 (subliste care încep cu atom nenumeric: 
; lista principală, (B 2), (D 3), și (1 C (D 3)))