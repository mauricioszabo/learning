(ns mastermind.core
  (:require [reagent.core :as r]
            [reagent.dom :as r-dom]))

(defn- index []
  [:div "Hello, world!"])

(defn main []
  (r-dom/render [index] (. js/document querySelector "#app")))
