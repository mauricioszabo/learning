(ns tic-tac-toe.core
  (:require [io.pedestal.http :as http]
            [io.pedestal.http.route :as route])
  (:gen-class))

(defn- respond-hello [request]
  {:status 200 :body "Hello, world!"})

(defn- index [req]
  {:status 301 :headers {"Location" "/index.html"}})

(def routes
  (route/expand-routes
   #{["/" :get index :route-name :index]
     ["/greet" :get respond-hello :route-name :greet]}))

(defn create-dev-server []
  (http/create-server
   {:env :dev
    ::http/routes #(deref #'routes)
    ::http/resource-path "public"
    ::http/secure-headers {:content-security-policy-settings ""}
    ::http/type :jetty
    ::http/port 3000
    ::http/join? false}))

(defn start []
  (http/start (create-dev-server)))
