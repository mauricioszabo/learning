(ns user
  (:require [shadow.cljs.devtools.api :as shadow]
            [shadow.cljs.devtools.server :as server]
            [tic-tac-toe.core :as core]))

(defonce ^:private server-info (atom nil))

(defn start! []
  (server/start!)
  (shadow/watch :browser)
  (reset! server-info (core/start)))

(defn stop! []
  (server/stop!)
  (when-let [stop! (:io.pedestal.http/stop-fn @server-info)]
    (stop!)
    (reset! server-info nil)))
