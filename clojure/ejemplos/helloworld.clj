;; en ./project.clj
(defproject helloworld
  ;; ... (many keywords)
  ;; :repl-options {:init-ns helloworld.core
  :main helloworld.core)


;; en .src/core.clj
(ns helloworld.core)

(defn -main "docs"
  [] ;; params to main
  (println "Hello, World!"))

