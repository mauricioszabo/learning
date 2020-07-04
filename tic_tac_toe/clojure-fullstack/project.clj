(defproject tic-tac-toe "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  :url "http://example.com/FIXME"
  :license {:name "EPL-2.0 OR GPL-2.0-or-later WITH Classpath-exception-2.0"
            :url "https://www.eclipse.org/legal/epl-2.0/"}
  :dependencies [[org.clojure/clojure "1.10.0"]
                 [io.pedestal/pedestal.service "0.5.8"]
                 [reagent "0.10.0"]]
  :resource-paths ["resources"]

  :main ^:skip-aot tic-tac-toe.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all}
             :dev {:dependencies [[io.pedestal/pedestal.service-tools "0.5.8"]
                                  [io.pedestal/pedestal.jetty "0.5.8"]
                                  [thheller/shadow-cljs "2.10.13"]]
                   :jvm-opts ["-Dclojure.server.myrepl={:port,4321,:accept,clojure.core.server/repl}"]
                   :source-paths ["dev"]}})
