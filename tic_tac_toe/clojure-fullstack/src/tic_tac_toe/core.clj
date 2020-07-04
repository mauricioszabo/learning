(ns tic-tac-toe.core
  (:require [io.pedestal.http :as http]
            [io.pedestal.http.route :as route])
  (:gen-class))

(defn- respond-hello [request]
  {:status 200 :body "Hello, world!"})

(def routes
  (route/expand-routes
   #{["/greet" :get respond-hello :route-name :greet]}))

(defn create-dev-server []
  (http/create-server
   {::http/routes routes
    ::http/resource-path "public"
    ::http/secure-headers {:content-security-policy-settings ""}
    ::http/type :jetty
    ::http/port 3000
    ::http/join? false}))

(defn start []
  (http/start (create-dev-server)))
; (defn -main
;   "I don't do a whole lot ... yet."
;   [& args]
;   (println "Hello, World!"))
