;or-list(l) = {
;    nil,                 daca l = []
;    true,               daca l1 = true
;    or-list(l2..ln),   altfel
;}
;or-list(l:list)

;memb(l,e) = {
;    nil,                                    daca l = []
;    true,                                   daca atom(l) și l = e
;    false,                                  daca atom(l) și l != e
;    or-list(map(lambdax.memb(x,e), [l1,...,ln])), altfel
;}
;memb(l:list,e:atom)

(defun or-list (l)
    (cond
        ((null l) nil)
        ((car l) t)
        (t (or-list (cdr l)))))

(defun memb(l e)
    (cond
        ((null l) nil)
        ((atom l) (equal l e))
        (t (or-list 
        (mapcar #'(lambda (x) (memb x e))l)))
    )
)

; cazuri test
(print (memb '(1 (2 a) 3) 'a))      ; T ; NIL T NIL
(print (memb '(1 (2 (3)) 4) 3))     ; T
(print (memb '((a b) c) 'x))        ; NIL