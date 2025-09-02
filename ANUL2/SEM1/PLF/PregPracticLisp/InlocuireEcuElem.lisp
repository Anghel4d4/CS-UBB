; model matematic
; inlocuire(l, e, subs) = { l , l e atom si l != e
; { subs , l e atom si l = e
; { inlocuire(l1) U ... U inlocuire(l1) , altfel
;
; inlocuire(l:list, e:element, subs:element)
(defun inlocuire(l e subs)
(cond
(
(AND (atom l) (not(equal l e)))
l
)
(
(AND (atom l) (equal l e))
subs
)
(t
(mapcar #'(lambda (x) (
inlocuire x e subs
)
)
l
)
)
)
)
(format t "~%Test result: ~A" 
    (inlocuire '(1 2 (1 3 (1 4)) 1) 1 10)
)