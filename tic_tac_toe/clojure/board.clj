(def empty-board (fn []
  (let
    [row, (vector " " " " " ")]
    (vector row row row))))

(nth (empty-board) 1)
