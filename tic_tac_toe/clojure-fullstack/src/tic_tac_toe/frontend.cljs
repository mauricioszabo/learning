(ns tic-tac-toe.frontend
  (:require [reagent.core :as r]
            [reagent.dom :as r-dom]))

(def ^:private square {:width "1em"
                       :height "1em"
                       :border "1px solid"
                       :text-align "center"
                       :font-size "4em"})

(def ^:private h-align {:display "flex"})
(def ^:private v-align {:display "flex" :flex-direction "column"})

(defonce state (r/atom {:board [["" "" ""] ["" "" ""] ["" "" ""]]
                        :current-player "X"}))
(defn- mark-board [row col]
  (let [curr (:current-player @state)]
    (swap! state #(-> %
                      (assoc-in [:board row col] curr)
                      (assoc :current-player (if (= "X" curr) "O" "X"))))))

(defn- board-row [row row-idx]
  [:div {:key row-idx :style h-align}
   (map (fn [idx elem] [:div {:key idx
                              :style square
                              :on-click (fn [_] (mark-board row-idx idx))}
                        elem])
        (range) row)])

(defn- board-elem []
  [:div
   (map (fn [row idx] (board-row row idx))
        (:board @state) (range))])

(defn ^:dev/after-load main []
  (r-dom/render [board-elem] (. js/document querySelector "#app")))
