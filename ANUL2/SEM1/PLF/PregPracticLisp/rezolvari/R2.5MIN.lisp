(defun minim-nivel (l nivel)
    (cond
        ((numberp l) (cond ((equal (mod nivel 2) 1) l) (t nil)))
        ((atom l) nil)
        (t (apply #'min (mapcar #'(lambda (x) (minim-nivel x nivel)) l)))
    )
)

; numar subliste care indeplinesc conditia
(defun numar-subliste (l)
    (cond
        ((atom l) 0)
        (t (+ (cond 
                ((equal (mod (minim-nivel l 1) 2) 0) 1) 
                (t 0))
             (apply #'+ (mapcar #'numar-subliste l))))
    )
)