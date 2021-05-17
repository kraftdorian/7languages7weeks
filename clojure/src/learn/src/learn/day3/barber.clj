(ns learn.day3.barber)

(def current_time (ref 0))
(def service_available_time_period 10000)
(def service_time 20)
(def min_visit_delay 10)
(def max_visit_delay 30)

(def customer_count (ref 0))
(def is_customer_seat_taken (ref 0))
(def waiting_room_seats_taken (ref 0))
(def waiting_room_seats_max 3)

(defn
  get_visit_delay
  []
  (nth (range min_visit_delay (+ 1 max_visit_delay)) (rand-int (inc (- max_visit_delay min_visit_delay)))))

(defn
  add_time
  [time]
  (dosync (alter current_time (fn [t] (+ t time)))))

(defn
  waiting_room_pop
  []
  (dosync (alter waiting_room_seats_taken dec)))

(defn
  waiting_room_push
  []
  (dosync (alter waiting_room_seats_taken inc)))

(defn
  set_customer_seat
  [is_taken]
  (dosync
    (alter is_customer_seat_taken
      (fn [is_currently_taken]
        (if (not= is_currently_taken is_taken) is_taken is_currently_taken)))))

(defn
  customer_leave
  []
  (dosync (alter customer_count inc)))

(defn
  do_service
  []
  (do
    (add_time service_time)
    (set_customer_seat 0)
    (customer_leave)))

(defn -main []
  (while ( < @current_time service_available_time_period)
    (if (= 0 @is_customer_seat_taken)
      ; Customer seat available
      (do
        (if (< 0 @waiting_room_seats_taken)
          ; Customer seat available and there are customers in waiting room, service them first
          (do
            (waiting_room_pop)
            (set_customer_seat 1)
            (do_service))
          ; Customer seat available and there are no customers in waiting room, just go straight to customer seat
          (do
            (set_customer_seat 1)
            (do_service))))
      ; Customer seat unavailable
      (do
        (if (< waiting_room_seats_taken waiting_room_seats_max)
          (do
            (waiting_room_push)))))
    (add_time (get_visit_delay)))
  (println (str "Serviced customers count: " @customer_count))
  (shutdown-agents))