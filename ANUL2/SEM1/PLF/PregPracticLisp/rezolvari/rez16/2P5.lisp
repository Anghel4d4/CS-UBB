

(defun sum (L K)
	(cond
		( (and ( = (mod K 2) 1) (numberp L) ) L)
		( (atom L) 0)
		(t (apply #'+(mapcar #'(lambda(L)(sum L (+ K 1) ) ) L) ) )
	)
)

(defun verify(L)
	(= (mod (sum L 0) 2)0 )
)

(defun solve(L)
	(cond
		( (atom  L) 0)
		( (verify L) (+ 1 (apply #'+ (mapcar #'solve L)  )))
		(t (apply #'+ (mapcar  #'solve L)))
	)
)



(print (solve '(A 1 (B 2) (1 C 4) (D 1 (6 F)) ((G 4) 6))))