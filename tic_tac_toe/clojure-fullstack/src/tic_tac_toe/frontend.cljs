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

(defn- board-row [row idx]
  [:div {:key idx :style h-align}
   (map (fn [idx elem] [:div {:key idx :style square} elem])
        (range) row)])

(defonce board (r/atom [["" "" ""] ["" "" ""] ["" "" ""]]))
(defn- board-elem []
  [:div
   (map (fn [row idx] (board-row row idx))
        @board (range))])

(defn ^:dev/after-load main []
  (r-dom/render [board-elem] (. js/document querySelector "#app")))
