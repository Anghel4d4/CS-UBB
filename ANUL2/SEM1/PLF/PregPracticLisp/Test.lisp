;contor(l k niv)= 1, daca l=atom si k=niv
; 0 , daca l=atom k!=niv
; contor(l1,k,niv+1)U..U contor(ln,k,niv+1)

(defun contor (l k niv)
    (cond
        ((AND (atom l) (equal niv k)) 1)
        ((AND (atom l) (not(equal niv k))) 0)
        (T (apply #'+ 
                 (mapcar #'(lambda (x)
                            (contor x k (+ niv 1)))
                        l)))
    )
)
(print (contor '(a (b c) (d (e))) 1 -1))  

(print (contor '(a (b c) (d (e))) 2 -1))  

(print (contor '(a (b c) (d (e))) 0 -1))  

(print (contor '(a (b c) (d (e))) 3 -1))  
