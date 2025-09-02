(defun maxim-nivel (l nivel)
    (cond
        ((numberp l) (cond ((equal (mod nivel 2) 1) l) (t nil)))
        ((atom l) nil)
        (t (apply #'max (mapcar #'(lambda (x) (maxim-nivel x nivel)) l)))
    )
)

; numar subliste care indeplinesc conditia
(defun numar-subliste (l)
    (cond
        ((atom l) 0)
        (t (+ (cond 
                ((equal (mod (maxim-nivel l 1) 2) 0) 1) 
                (t 0))
             (apply #'+ (mapcar #'numar-subliste l))))
    )
)
(print (numar-subliste '(1 (2 (3)) (4 (5 6)) 7)))