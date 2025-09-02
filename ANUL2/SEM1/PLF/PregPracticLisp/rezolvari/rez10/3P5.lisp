(defun last-num (x)
  (cond ((numberp x) x)
        ((atom x) nil)
        (t (or (last-num (cdr x)) 
              (last-num (car x))))))

(defun countS (x)
  (cond 
    ((atom x) 0)
    ((and (numberp (last-num x)) 
          (= (mod (last-num x) 2) 1)) 
     (+ 1 (apply #'+ (mapcar #'countS x))))
    (t (apply #'+ (mapcar #'countS x)))))

;; Tests
(print (countS '((G 7))))                              ; => 1
(print (countS '(9 F)))                                ; => 1
(print (countS '(A (B 2) (1 C 4) (D 1 (9 F)) ((G 7) 6))))  ; => 3