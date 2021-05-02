(ns learn.day3.bills)

(defn open_bills_registry [] (ref []))

(defn do_bill_operation [bills_registry operation amount]
 (dosync (alter bills_registry concat [{operation amount}]))
 (println (str "Bill operation: " operation ". Amount: " amount)))

(defn charge [bills_registry amount]
  (do_bill_operation bills_registry :charge (- amount)))

(defn credit [bills_registry amount]
  (do_bill_operation bills_registry :credit amount))

(defn get_balance [bills_registry]
  (reduce + (map #(first (vals %)) @bills_registry)))

(defn -main []
  (def bills (open_bills_registry))
  (credit bills 250)
  (charge bills 75)
  (println (str "Balance: " (get_balance bills))))