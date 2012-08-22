; 10^6 > 6 * 9^5 より 求める数は最大でも6桁である。
(defun pow (x) (expt x 5)) ; 一つの桁に対して行なう処理

(defun check (v)
  (let ((sum 0) (x v))
    (while (> x 0)
      (incf sum (pow (mod x 10)))
      (setq x (truncate x 10)))
    (= v sum))) ; ある数xが問題の条件を満たすか

(setq answer -1) ; 1^5 = 1を除外する
(dotimes (x 1000000)
  (if (check x) (incf answer x))) ; 合計を求める
(print answer)
; Output : 443839
