{:user {:dependencies [[clj-stacktrace "0.2.5"]
                       [org.clojure/tools.trace "0.7.6"]
                       [org.clojure/tools.namespace "0.2.4"]
                       [redl "0.1.0"]
                       [speclj-tmux "1.0.0"]
                       [spyscope "0.1.3"]
                       [slamhound "1.3.3"]]
        :plugins [[lein-difftest "1.3.7"]
                  [lein-exec "0.3.0"]
                  [org.bodil/lein-noderepl "0.1.10"]
                  [lein-clojars "0.9.1"]
                  [lein-pprint "1.1.1"]
                  [lein-ring "0.8.0"]
                  [lein-cljsbuild "0.3.2"]
                  [lein-deps-tree "0.1.2"]
                  [lein-marginalia "0.7.1"]]
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
