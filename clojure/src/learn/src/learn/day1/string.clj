(ns learn.day1.string)

(defn string-length-greater
  [string, n]
  (> (count string) n))

(defn -main
  []
  (println (string-length-greater "Clojure is fun!" 14)))