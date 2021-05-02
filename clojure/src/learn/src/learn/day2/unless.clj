(ns learn.day2.unless)

(defmacro unless [condition condition_false condition_true]
  (list 'if (list 'not condition) condition_false condition_true))

(defn -main
  []
  (unless (> 1 2) (println "1 < 2") (println "1 > 2"))
  (unless (< 1 2) (println "1 > 2") (println "1 < 2"))
)