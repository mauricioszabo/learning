# Steps for a fullstack Clojure

1. Install Leiningen
1. Run `lein new app tic-tac-toe`
1. Change your project.clj to add the following `:dependencies`:

```clojure
  :dependencies [[org.clojure/clojure "1.10.0"]
                 [io.pedestal/pedestal.service "0.5.8"]]
  :resource-paths ["resources"]
```

1. Also change your project.clj to add a new profile `:dev`, with the following `:dependencies`; if you want, you can also add config to open up a socket-REPL (so you can connect Chlorine to it):

```clojure
  :profiles {:uberjar {:aot :all}
             :dev {:dependencies [[io.pedestal/pedestal.service-tools "0.5.8"]
                                  [io.pedestal/pedestal.jetty "0.5.8"]
                                  [thheller/shadow-cljs "2.10.13"]]
                   :jvm-opts ["-Dclojure.server.myrepl={:port,4321,:accept,clojure.core.server/repl}"]}
                   :source-paths ["dev"]}}
```

1. Now, inside the `dev/user.clj`, add a code to start a development server for you, and generate your "WAR" file.
