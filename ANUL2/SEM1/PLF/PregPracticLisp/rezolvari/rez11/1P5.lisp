

(defun verify(L)
	(cond
		((null L )nil)
		((and (numberp (car L)) (= (mod (car L) 2) 0)) t)
		(( numberp (car L)) nil )
		(t (verify (cdr L)) )
	)
)

(defun nr(L)
	(cond
		( (atom L) 0)
		( (null L) 0)
		( (verify L ) (+ 1 (apply #'+ (mapcar #'nr L) )))
		(t (apply #'+ (mapcar #'nr L)))
	)
)


;; Exemplu de utilizare
(print (nr '(A (B 2) (1 C 4) (D 1 (9 F)) ((G 4) 6))))
;; Așteptat: 3 (sublistele (D 1 (9 F)), (9 F) și (G 7) au ultimul atom impar)