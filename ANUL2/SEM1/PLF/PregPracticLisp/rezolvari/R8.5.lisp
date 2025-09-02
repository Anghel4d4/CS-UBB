(defun count-numbers (l)
    (cond
        ((null l) 0)
        ((numberp l) 1)
        ((atom l) 0)
        (t (apply #'+ (mapcar #'count-numbers l)))
    )
)

(defun count-sublists (l)
    (cond
        ((atom l) 0)
        (t (+ (cond 
                ((equal (mod (count-numbers l) 2) 1) 1)
                (t 0))
             (apply #'+ (mapcar #'count-sublists l))))
    )
)

; Test
(print (count-sublists '(1 (2 A) (1 2 (3 B)) (1 C))))