;create-positions(n) = 
;    []                                      , daca n < 0
;   append(create-positions(n-1), [n])      , altefl
;create-positions(n:intreg)


(defun create-positions (n)
    (cond
        ((< n 0) nil)
        (t (append (create-positions (- n 1)) (list n)))
    )
)




;insereaza(l,poz,e) = 
;    [e]                 , daca l = []
;   e ∪ l              , daca poz = 0
; l1 ∪ insereaza([l2..ln],poz-1,e)  ,altefl
;insereaza(l:list,poz:int,e:int)
(defun insereaza (l poz e)
    (cond
        ((null l) (list e))
        ((= poz 0) (cons e l))
        (t (cons (car l) (insereaza (cdr l) (- poz 1) e)))
    )
)


;insereaza-everywhere(l,e) = 
;    map(λpoz.insereaza(l,poz,e), create-positions(length(l)))
;insereaza-everywhere(l:list,e:int)
(defun insereaza-everywhere (l e)
    (mapcar #'(lambda (poz) 
                (insereaza l poz e))
            (create-positions (length l)))
)

(print (insereaza-everywhere '(2 3) 1))

(print (insereaza-everywhere '(4 5 6) 9))
