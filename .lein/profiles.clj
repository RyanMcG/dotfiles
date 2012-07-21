{:user {:plugins [[lein-tarsier "0.9.1"]
                  [lein-swank "1.4.4"]
                  [lein-difftest "1.3.7"]
                  [lein-clojars "0.8.0"]
                  ;[jark/jark-server "0.4.0"]
                  [clj-stacktrace "0.2.4"]
                  [lein-pprint "1.1.1"]
                  [slamhound "1.2.0"]
                  [lein-cljsbuild "0.1.9"]
                  [lein-deps-tree "0.1.1"]
                  ;[lein-autodoc "0.9.0"]
                  [lein-marginalia "0.7.0"]
                  [lein-noir "1.2.0"]]
        :repl-options {:timeout 60000}
        :injections [(let [orig (ns-resolve (doto 'clojure.stacktrace require)
                                            'print-cause-trace)
                           new (ns-resolve (doto 'clj-stacktrace.repl require)
                                           'pst)]
                       (alter-var-root orig (constantly @new)))]
        :vimclojure-opts {:repl true
                          :port 2113}}}
