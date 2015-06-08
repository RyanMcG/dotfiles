{:user {:dependencies [[clj-stacktrace "0.2.8"]
                       [spyscope "0.1.5"]
                       [debugger "0.1.7"]
                       [bolth "0.1.0"]
                       [com.aphyr/prism "0.1.2"]
                       [slamhound "1.5.5"]]
        :plugins [[lein-difftest "2.0.0"]
                  [lein-exec "0.3.4"]
                  [lein-instant-cheatsheet "2.1.3"]
                  [lein-ancient "0.5.5"]
                  [com.aphyr/prism "0.1.2"]
                  [org.bodil/lein-noderepl "0.1.11"]
                  [quickie "0.3.6"]
                  [lein-kibit "0.0.8"]
                  [jonase/eastwood "0.2.0"]
                  [lein-clojars "0.9.1"]
                  [lein-pprint "1.1.2"]
                  [lein-ring "0.8.13"]
                  [lein-cljsbuild "1.0.6"]
                  [lein-deps-tree "0.1.2"]
                  [mvxcvi/whidbey "0.4.1"]
                  [lein-typed "0.3.5"]
                  [lein-marginalia "0.8.0"]]
        ; printing options are customizable:
        :puget-options {}
        :repl-options {:timeout 120000}
        :injections [(require 'spyscope.core)
                     (let [orig (ns-resolve (doto 'clojure.stacktrace require)
                                            'print-cause-trace)
                           new (ns-resolve (doto 'clj-stacktrace.repl require)
                                           'pst)]
                       (alter-var-root orig (constantly @new)))]
        :vimclojure-opts {:repl true}}}
