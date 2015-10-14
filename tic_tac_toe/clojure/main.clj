(ns tictactoe.main
    (:require [tictactoe.board :refer :all]))

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
    #(play board player)))

(defn valid-movement [board player colMatch rowMatch]
  (let [col (.indexOf ["A" "B" "C"] colMatch)
        row (- (Integer/parseInt rowMatch) 1)
        new-player (case player "X" "O" "X")
        new-board (assoc-in board [row col] player)]
    #(play new-board new-player)))

(defn treat-movement [board player]
  (let [[_ colMatch rowMatch]
        (re-matches #"([ABC])\-?([123])" (read-line))]
    (if colMatch
      (valid-movement board player colMatch rowMatch)
      (invalid-movement board player))))

(defn next-turn [board player]
  (print "Player" player ", your move: ")
  (flush)
  (treat-movement board player))

(defn won-game [v] (println "Player" v "won!\n"))

(def tie #(println "No more movements - game ended in a tie\n"))

(defn play [board player]
  (print-board board)
  (let [victorious (who-won? board)]
    (cond
      victorious (won-game victorious)
      (no-more-movements? board) (tie)
      :else (next-turn board player))))

(defn -main [& args] (trampoline play empty-board "X"))
