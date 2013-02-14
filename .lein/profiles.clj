{:user {:dependencies [[clj-stacktrace "0.2.5"]
                       [spyscope "0.1.0"]
                       [nrepl-transcript "0.1.0"]
                       [limit-break "0.1.0-SNAPSHOT"]]
        :plugins [[lein-difftest "1.3.7"]
                  [lein-drip "0.1.1-SNAPSHOT"]
                  [lein-clojars "0.9.1"]
                  [lein-pprint "1.1.1"]
                  [lein-ring "0.8.0"]
                  [slamhound "1.3.1"]
                  [lein-cljsbuild "0.1.9"]
                  [lein-deps-tree "0.1.2"]
                  [lein-marginalia "0.7.1"]]
        :repl-options {:timeout 120000
                       :nrepl-middleware
                       [nrepl-transcript.file/wrap-file-transcript]}
        :injections [(let [orig (ns-resolve (doto 'clojure.stacktrace require)
                                            'print-cause-trace)
                           new (ns-resolve (doto 'clj-stacktrace.repl require)
                                           'pst)]
                       (alter-var-root orig (constantly @new)))]
        :vimclojure-opts {:repl true}}}
