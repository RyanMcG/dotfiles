{:user {:dependencies [[clj-stacktrace "0.2.8"]
                       [spyscope "0.1.5"]
                       [alembic "0.3.2"]
                       [debugger "0.1.7"]
                       [bolth "0.1.0"]
                       [com.aphyr/prism "0.1.3"]
                       [slamhound "1.5.5"]]
        :plugins [[lein-difftest "2.0.0"]
                  [lein-exec "0.3.5"]
                  [com.palletops/lein-shorthand "0.4.0"]
                  [lein-instant-cheatsheet "2.1.4"]
                  [lein-ancient "0.6.7"]
                  [com.aphyr/prism "0.1.3"]
                  [org.bodil/lein-noderepl "0.1.11"]
                  [quickie "0.4.0"]
                  [lein-kibit "0.1.2"]
                  [jonase/eastwood "0.2.1"]
                  [lein-clojars "0.9.1"]
                  [lein-pprint "1.1.2"]
                  [lein-ring "0.9.7"]
                  [lein-cljsbuild "1.1.0"]
                  [mvxcvi/whidbey "1.0.0"]
                  [lein-typed "0.3.5"]
                  [lein-marginalia "0.8.0"]]
        ; printing options are customizable:
        :puget-options {}
        :shorthand {. [alembic.still/distill alembic.still/lein]}
        :repl-options {:timeout 120000}
        :injections [(require 'spyscope.core)
                     (let [orig (ns-resolve (doto 'clojure.stacktrace require)
                                            'print-cause-trace)
                           new (ns-resolve (doto 'clj-stacktrace.repl require)
                                           'pst)]
                       (alter-var-root orig (constantly @new)))]
        :vimclojure-opts {:repl true}}}
