(ns learn.day2.account)

(defprotocol MoneyAccount
  (balance [account])
  (deposit [account amount])
  (withdraw [account amount]))

(defrecord BankAccount [money] MoneyAccount
  (balance [_] money)
  (deposit [_ amount] (BankAccount. (+ money amount)))
  (withdraw [_ amount] (BankAccount. (- money amount))))

(defn -main []
  (def account (BankAccount. 100))
  (println (str "Initial account balance: " (balance account)))
  (println (str "Deposited 50. Current balance: " (balance (deposit account 50))))
)