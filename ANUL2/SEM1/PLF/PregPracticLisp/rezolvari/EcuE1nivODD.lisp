; substituie(l, e, e1, niv) = { l , l e atom si l != e
; { e , l e atom si l = e si niv % 2 = 0
; { e1 , l e atom si l = e si niv % 2 = 1
; { substituie(l1, e, e1, niv + 1) U ... U substituie(ln, e, e1, niv + 1) , altfel
;
; substituie(l:list, e:element, e1:element, niv:intreg)
(defun substituie(l e e1 niv)
(cond
(
(AND (atom l) (not (equal l e)))
l
)
(
(AND (atom l) (equal l e) (equal (mod niv 2) 0))
e
)
(
(AND (atom l) (equal l e) (equal (mod niv 2) 1))
e1
)
(
T
(mapcar #'(lambda (x)
(substituie x e e1 (+ niv 1))
)
l
)
)
)
)
; main(l, e, e1) = substituie(l,e,e1,0)
; aceasta este functia main
; main(l:list, e:element, e1:element)
(defun main(l e e1)
(substituie l e e1 0)
)