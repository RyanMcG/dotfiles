{:user {:dependencies [[clj-stacktrace "0.2.8"]
                       [org.clojure/tools.trace "0.7.8"]
                       [org.clojure/tools.namespace "0.2.7"]
                       [redl "0.2.4"]
                       [speclj-tmux "1.0.0"]
                       [spyscope "0.1.5"]
                       [com.aphyr/prism "0.1.2"]
                       [slamhound "1.5.5"]]
        :plugins [[lein-difftest "2.0.0"]
                  [lein-exec "0.3.4"]
                  [lein-ancient "0.5.5"]
                  [com.aphyr/prism "0.1.2"]
                  [org.bodil/lein-noderepl "0.1.11"]
                  [quickie "0.3.6"]
                  [lein-kibit "0.0.8"]
                  [jonase/eastwood "0.2.0"]
                  [lein-clojars "0.9.1"]
                  [lein-pprint "1.1.2"]
                  [lein-expectations "0.0.8"]
                  [lein-ring "0.8.13"]
                  [lein-cljsbuild "1.0.3"]
                  [lein-deps-tree "0.1.2"]
                  [mvxcvi/whidbey "0.4.1"]
                  [lein-typed "0.3.5"]
                  [lein-marginalia "0.8.0"]]
        ; printing options are customizable:
        :puget-options {}
        :repl-options {:timeout 120000}
        :injections [(require '[redl core complete])
                     (require 'spyscope.core)
                     (require 'clojure.tools.namespace)
                     (let [orig (ns-resolve (doto 'clojure.stacktrace require)
                                            'print-cause-trace)
                           new (ns-resolve (doto 'clj-stacktrace.repl require)
                                           'pst)]
                       (alter-var-root orig (constantly @new)))]
        :vimclojure-opts {:repl true}}}
