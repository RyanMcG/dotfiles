{:user {:plugins [[lein-tarsier "0.9.2-SNAPSHOT"]
                  [lein-swank "1.4.4"]
                  [lein-difftest "1.3.7"]
                  [clj-stacktrace "0.2.4"]
                  [lein-pprint "1.1.1"]
                  [slamhound "1.2.0"]
                  [lein-cljsbuild "0.1.8"]
                  ;[lein-autodoc "0.9.0"]
                  [lein-marginalia "0.7.0"]
                  [lein-noir "1.2.0"]]
        ;:injections [(let [orig (ns-resolve (doto 'clojure.stacktrace require)
                                            ;'print-cause-trace)
                           ;new (ns-resolve (doto 'clj-stacktrace.repl require)
                                           ;'pst)]
                       ;(alter-var-root orig (constantly @new)))]
        :vimclojure-opts {:repl true
                          :port 2113}}}
