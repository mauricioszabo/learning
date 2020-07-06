(ns mastermind.rules
  (:require [clojure.test :as t]))

(def colors (->> [:red :green :blue :yellow :pink :black]
                 cycle
                 (take (* 4 6))))

(defn shuffle-colors []
  (->> colors shuffle (take 4)))
(t/deftest shuffle-colors-test
  (t/is (= 4 (count (shuffle-colors)))))

(defn compare-guess [colors guess]
  (let [results (map (fn [color guess] (when-not (= color guess) [color guess]))
                     colors guess)
        colors-f (frequencies (map first results))
        guess-f (frequencies (map second results))]
    {:white (->> (dissoc guess-f nil)
                 (map (fn [[color freq]] (min freq (get colors-f color 0))))
                 (reduce +))
     :black (get colors-f nil 0)}))

(t/deftest compare-guess-test
  (t/testing "guess everything wrong"
    (t/is (= {:white 0 :black 0}
             (compare-guess [:red :green :blue :yellow]
                            [:pink :black :pink :black]))))

  (t/testing "guess something on the right place"
    (t/is (= {:white 0 :black 1}
             (compare-guess [:red :green :blue :yellow]
                            [:red :red :black :pink]))))

  (t/testing "guess something on the right place, and some on wrong"
    (t/is (= {:white 2 :black 1}
             (compare-guess [:red :blue :red :red]
                            [:red :red :black :blue])))))
