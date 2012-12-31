{:user {:dependencies [[clj-stacktrace "0.2.5"]
                       [spyscope "0.1.0"]]
        :plugins [
                  ;[lein-tarsier "0.9.4-SNAPSHOT"]
                  ;[lein-swank "1.4.4"]
                  [lein-difftest "1.3.7"]
                  [lein-clojars "0.9.1"]
                  ;[jark/jark-server "0.4.0"]
                  [lein-pprint "1.1.1"]
                  [lein-ring "0.7.5"]
                  [slamhound "1.3.0"]
                  [lein-cljsbuild "0.1.9"]
                  [lein-deps-tree "0.1.2"]
                  ;[lein-autodoc "0.9.0"]
                  [lein-marginalia "0.7.1"]]
        :repl-options {:timeout 120000}
        :injections [(let [orig (ns-resolve (doto 'clojure.stacktrace require)
                                            'print-cause-trace)
                           new (ns-resolve (doto 'clj-stacktrace.repl require)
                                           'pst)]
                       (alter-var-root orig (constantly @new)))]
        :vimclojure-opts {:repl true}}}
