(defun maxim-nivel(l)
    (cond
    ((numberp l)l)
    ((atom l) nil)
    (t(apply #'max (mapcar #'maxim-nivel l)))
    )
)

(defun nr_sub(l)
    (cond
        ((atom l) 0)
        (t (+ (cond
            ((equal (mod (maxim-nivel l) 2) 0) 1)
            (t 0))
            (apply #'+ (mapcar #' nr_sub l))))

    )
)

(print (nr_sub '(1 (2 (3)) (4 (5 6)) 7)))