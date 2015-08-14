(def empty-board (fn []
  (let
    [row, [" " " " " "]]
    [row row row])))

(def won (fn [board]
  (or
    (same-horiz board)
    (same-vert board)
    (same-diag1 board)
    (same-diag2 board))))

(def same-horiz (fn [board]
  (first
    (filter
      (fn [row]
        (and (= (count (set row)) 1) (not (= (first row) " "))))
      board))))


(nth (empty-board) 1)
