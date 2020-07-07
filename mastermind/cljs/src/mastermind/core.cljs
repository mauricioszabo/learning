(ns mastermind.core
  (:require [reagent.core :as r]
            [reagent.dom :as r-dom]
            [mastermind.rules :as rules]
            ["@material-ui/core" :refer [Icon Badge Paper Button ButtonGroup Container]]))

(defonce state (r/atom {}))

(def ^:private get-color {:red "rgb(223, 41, 53)"
                          :green "rgb(12, 131, 70)"
                          :blue "#00A"
                          :yellow "rgb(255, 212, 0)"
                          :pink "rgb(246, 91, 227)"
                          :gray "#A5A5A5"})

(defn- color-circle
  ([idx color]
   [:div.circle {:key idx :style {:background-color (get-color color)}}])
  ([idx color size]
   [:div.circle {:key idx :style {:background-color (get-color color)
                                  :width size
                                  :height size}}]))

(defn- old-guess [colors {:keys [result guess]}]
  (let [{:keys [black white]} result]
    [:div.cols (map color-circle (range) guess)
     [:> Badge {:color "secondary" :badge-content (str black)} [:> Icon "stop_circle"]]
     [:> Badge {:color "secondary" :badge-content (str white)} [:> Icon "panorama_fish_eye"]]]))

(defn- buttons [state color]
  ^{:key color}
  [:> Button {:variant "contained"
              :disable-elevation true
              :style {:width "6em" :height "2.5em" :background-color (get-color color)}
              :on-click (fn [_]
                          (swap! state update :current-guess
                                 #(cond-> % (< (count %) 4) (conj color))))}])

(defn- new-game! []
  (reset! state (rules/new-game-state)))

(defn- send-guess! [state]
  (let [current-guess (:current-guess @state)
        colors (:colors @state)
        result (rules/compare-guess colors current-guess)]
    (when (and (= 4 (count current-guess)))
      (swap! state
             #(-> %
                  (assoc :current-guess [])
                  (update :old-guesses conj {:result result :guess current-guess}))))))

(defn- index [state]
  (let [{:keys [old-guesses colors]} @state
        win? (-> old-guesses peek :result :black (= 4))
        lost? (= 10 (count old-guesses))]
    [:> Container {:style {:margin-top "2em" :margin-bottom "2em"}}
     [:> Paper
      [:> Container {:style {:display "flex" :flex-direction "column" :align-items "center"}}
       [:h1 "MASTERMIND REAGENT"]
       [:> Button {:variant "outlined" :on-click new-game!} "New Game"]
       [:div.cols
        (if win?
          (map #(color-circle %1 %2 "3em") (range 4) colors)
          (map #(color-circle % :black "3em") (range 4)))]
       [:div.cols {:style {:margin-top "1.5em"}} [:b "Guesses"]]
       [:div.rows (map (fn [g i] ^{:key i} [old-guess colors g])
                       old-guesses
                       (range))]

       [:div.cols {:style {:margin-top "5em" :height "3em"}}
        (map color-circle (range) (:current-guess @state))]
       [:div.cols {:style {:width "35em" :justify-content "space-between"}}
        (map #(buttons state %) (keys get-color))]
       (cond
         win? [:h2 "You have won the game!"]
         lost? [:h2 "You have LOST the game! Looser!!!"]
         :else [:> ButtonGroup {:style {:margin-top "1em" :margin-bottom "1em"}}
                [:> Button {:on-click (fn [_] (send-guess! state))}
                 "Guess"]
                [:> Button {:on-click (fn [_] (swap! state assoc :current-guess []))}
                 "Reset"]])]]]))

(defn ^:dev/after-load render []
  (r-dom/render [index state] (. js/document querySelector "#app")))

(defn main []
  (new-game!)
  (render))
