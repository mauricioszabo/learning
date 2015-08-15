(defn != [a b] (not (= a b)))

(defn matches-line [row]
  (and (apply = row) (!= (first row) " ")))

(defn same-horiz [board]
  (let
    [match (first (filter matches-line board))]
    (= match nil) nil (first match)))

(defn same-vert [board]
  (same-horiz (apply map vector board)))

(defn same-diag1 [board]
  (let [f (first (first board))]
    (if
      (and (= f (second (second board)) (last (last board))) (!= f " "))
      f
      nil)))

(defn same-diag2 [board]
  (same-diag1 (apply map vector (reverse board))))

(defn who-won? [board]
  (or
    (same-horiz board)
    (same-vert board)
    (same-diag1 board)
    (same-diag2 board)))

(defn no-more-movements? [board]
  (let
    [blank-space? (fn [row] (some (partial = " ") row))]
    (not (some blank-space? board))))

(def empty-board
  (let
    [row, [" " " " " "]]
    [row row row]))
