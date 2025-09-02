(defun inlocuire(l e subs)
    (cond
        ((AND (atom l) (not(equal l e))) l)
        ((AND (atom l) (equal l e)) subs)
        (t (mapcar #'(lambda (x) (inlocuire x e subs)) l))
    )
)

; Test examples
(print (inlocuire '(1 2 3 2 4 2) 2 10))  ; replace 2 with 10
(print (inlocuire '(a (b a) (c (a) d)) 'a 'x))  ; replace a with x
(print (inlocuire '(1 (2 (1) 3) (1 4)) 1 100))  ; replace 1 with 100