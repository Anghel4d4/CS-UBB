; substituie(l, niv, k) = { l , l e atom si niv != k
; { 0 , l e atom si niv = k
; { substituie(l2, niv k) U ... U substituie(ln, niv k) , altfel
;
; substituie(l:list, niv:intreg, k:intreg)
(defun substituie(l niv k)
(cond
(
(AND (atom l) (not (equal niv k)))
l
)
(
(AND (atom l) (equal niv k))
0
)
(
T
(mapcar #'(lambda (x)
(substituie x (+ niv 1) k)
)
l
)
)
)
)
; main(l, k) = substituie(l,0,k)
; aceasta este functia main
; main(l:list, k:integer)
(defun main(l k)
(substituie l 0 k)
)

(print (main '(a (1(2 b)) (c (d))) 2))