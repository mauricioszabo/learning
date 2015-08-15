(load "board")

(defn print-board [board]
  (do
    (def sep "   --+---+--\n")
    (def j clojure.string/join)
    (def lines (map-indexed
      (fn [i row] (str (+ i 1) "  " (j " | " row) "\n"))
      board))
    (println "\n   A   B   C")
    (println (j sep lines))
    (println "")))

(declare play)

(defn invalid-movement [board player]
  (do
    (println "Invalid move. Movements must be like 'A1', 'B2', etc.\n")
    (play board player)))

(defn valid-movement [board player colMatch rowMatch]
  (do
    (def col (.indexOf ["A" "B" "C"] colMatch))
    (def row (- (Integer/parseInt rowMatch) 1))
    (def new-player (if (= player "X") "O" "X"))
    (def new-board (assoc board row (assoc (nth board row) col player)))
    (play new-board new-player)))

(defn treat-movement [board player]
  (let [[_ colMatch rowMatch]
        (re-matches #"([ABC])\-?([123])" (read-line))]
    (if colMatch
      (valid-movement board player colMatch rowMatch)
      (invalid-movement board player))))

(defn next-turn [board player] (do
  (print "Player" player ", your move: ")
  (flush)
  (treat-movement board player)))

(defn won-game [v] (println "Player" v "won!\n"))

(defn tie [] (println "No more movements - game ended in a tie\n"))

(defn play [board player] (do
  (print-board board)
  (def victorious (who-won? board))

  (if victorious
    (won-game victorious)
    (if (no-more-movements? board)
      (tie)
      (next-turn board player)))))

(play empty-board "X")
