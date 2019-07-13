;; en ./project.clj
(defproject printargs
  :main printargs.core)


;; en .src/core.clj
(ns printargs.core)

(defn -main "docs"
  [& args] ;; params to main
  (run! println args))

