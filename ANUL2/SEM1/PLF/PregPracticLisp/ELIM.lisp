;elim(l,e) = 
;    []                          , daca l = []
;    l                           , daca l e atom
;    map(lambda(x).             
;       ( altfel

;elim(l:list, e:int)
(defun elim (l e)
    (cond
        ((null l) nil)
        ((atom l) l)
        (t (mapcar #'(lambda (x)
                      (cond
                          ((equal x e) nil)
                          ((listp x) (elim x e))
                          (t x)))
                  l))
    )
)

; Test cases
(print (elim '(1 2 (3 2) 4 2) 2))
(print (elim '((1 3) 2 (3 2)) 3))
(print (elim '(1 2 3) 4))