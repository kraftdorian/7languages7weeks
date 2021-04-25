(ns learn.day1.type)

(defn collection-type
  "Returns type of the given collection. It is using Clojure classes to custom keywords Map"
  [collection]
  ({
    clojure.lang.PersistentList :list,
    clojure.lang.PersistentVector :vector,
    clojure.lang.PersistentArrayMap :map,
    clojure.lang.PersistentHashSet :set
  } (type collection)))

(defn -main
  []
  (println
    (collection-type '(:one :two :three))
    (collection-type '[:one :two :three])
    (collection-type {:one 1, :two 2, :three 3})
    (collection-type #{:one :two :three})))