(defun last_atom(l)
    (cond
        ((null l) nil)
        ((atom l) l)
        ((null (cdr l)) (last_atom (car l)))
        ((null (cddr l)) (last_atom (cadr l)))
        (t (last_atom (cdr l)))
    )
)

(defun solve(l)
    (cond
        ((null l) 0)
        ((atom l) 0)
        ((not (numberp (last_atom l))) (+ 1 (apply #'+ (mapcar #'solve l))))
        (t (apply #'+ (mapcar #'solve l)))
    )
)

; Test
(print (solve '(A (B 2) (1 C) (2 E))))