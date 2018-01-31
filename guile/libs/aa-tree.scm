;; from:
;; https://git.savannah.nongnu.org/git/guile-aa-tree.git

;;
;; aa-tree.scm - AA tree implementation for guile
;; Copyright (C) 2017  Christopher Howard

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(define-module (aa-tree)
  #:use-module (oop goops)
  #:export (aa-delete
            aa-insert
            aa-map
            aa-map-keys
            aa-map-reverse
            aa-map-values
            aa-search
            aa-to-list))

(define-method (< (a <string>) . rest) (apply string<? a rest))

(define-method (< (a <symbol>) . rest) (apply string<? (symbol->string a) (map symbol->string rest)))



;; aa tree structure is
;;
;;   ((key . value) (left-tree . right-tree) level)
;;
;; Empty trees are represented by #nil
(define (leaf-node key value)
  (list (cons key value) (cons #nil #nil) 1))

(define (is-leaf? tree)
  (and (nil? (left-tree tree)) (nil? (right-tree tree))))

(define (key tree)
  (if tree (caar tree) #nil))

(define (value tree)
  (if tree (cdar tree) #nil))

(define (replace-key tree k)
  (if (nil? tree) #nil
      (list (cons k (value tree))
            (cons (left-tree tree) (right-tree tree))
            (level tree))))

(define (replace-value tree v)
  (if (nil? tree) #nil
      (list (cons (key tree) v)
            (cons (left-tree tree) (right-tree tree))
            (level tree))))

(define (key-value tree)
  (if tree (car tree) #nil))

(define (left-tree tree)
  (if tree (caadr tree) #nil))

(define (replace-left-tree tree l-tree)
  (if (nil? tree) #nil
      (list (key-value tree) (cons l-tree (right-tree tree)) (level tree))))

(define (right-tree tree)
  (if tree (cdadr tree) #nil))

(define (replace-right-tree tree r-tree)
  (if (nil? tree) #nil
      (list (key-value tree) (cons (left-tree tree) r-tree) (level tree))))

(define (level tree)
  (if tree (caddr tree) #nil))

(define (replace-level tree l)
  (list (key-value tree) (cons (left-tree tree) (right-tree tree)) l))

(define (horizontal-left-link? tree)
  (if (left-tree tree)
      (= (level (left-tree tree))
         (level tree))
      #f))

(define (consecutive-horizontal-right-links? tree)
  (if (right-tree (right-tree tree))
      (= (level tree)
         (level (right-tree tree))
         (level (right-tree (right-tree tree))))
      #f))

;; skew operation
;;
;; If a horizontal left link is detected, do a right rotation to
;; convert it into a horizontal right link.
;;
;;   L <- T        L2 -> T2
;;  / \    \  =>  /     / \
;; A   B    R    A     B   R

(define (skew tree)
  (if (not (horizontal-left-link? tree))
      tree
      (let* ((A (left-tree (left-tree tree)))
             (B (right-tree (left-tree tree)))
             (R (right-tree tree))
             (L (left-tree tree))
             (T2 (list (key-value tree) (cons B R) (level tree))))
        (list (key-value L) (cons A T2) (level L)))))

;; split operation
;;
;; If two consecutive horizontal right links are detected, use a left
;; rotation and a level increase to generate a new tree with two fewer
;; horizontal right links.
;;
;;   T -> R -> X        R2
;;  /    /       =>    / \
;; A    B             T2  X
;;                   / \
;;                  A   B

(define (split tree)
  (if (not (consecutive-horizontal-right-links? tree))
      tree
      (let* ((A (left-tree tree))
             (R (right-tree tree))
             (B (left-tree R))
             (X (right-tree R))
             (T2 (list (key-value tree) (cons A B) (level tree))))
        (list (key-value R) (cons T2 X) (1+ (level R))))))

;; aa-insert operation
;;
;; Recursively aa-insert a value into the tree and rebalance the tree. If
;; a node with a matching key existings in the tree, replace it with
;; the new node (i.e., update the value).
;;
;; Keys must either numbers, strings, or symbols. The keys aa-inserted
;; must be of the same types as keys already existing in the tree.
;;
;; The key parameter may be a list of keys, in which case the function
;; will do a nested insert, inserting trees inside values.
(define* (aa-insert tree k #:optional v)
  (if (list? k)
      (aa-insert-nested tree k v)
      (split
       (skew
        (cond
         ((nil? tree) (leaf-node k v))
         ((< k (key tree)) (replace-left-tree tree (aa-insert (left-tree tree) k v)))
         ((equal? k (key tree)) (replace-value tree v))
         (#t (replace-right-tree tree (aa-insert (right-tree tree) k v))))))))

(define (aa-search tree k)
  (if (list? k) (aa-search-nested tree k)
      (cond
       ((nil? tree) #nil)
       ((< k (key tree)) (aa-search (left-tree tree) k))
       ((equal? k (key tree)) (list (value tree)))
       (#t (aa-search (right-tree tree) k)))))

;; aa-delete operation
;;
;; The key parameter may be a list of keys, in which case the function
;; will do a nested delete.
(define (aa-delete tree k)
  (if (list? k) (aa-delete-nested tree k)
      (let* ((t1
              (skew
               (decrease-level
                (cond
                 ((nil? tree) tree)
                 ((> k (key tree))
                  (replace-right-tree tree (aa-delete (right-tree tree) k)))
                 ((< k (key tree))
                  (replace-left-tree tree (aa-delete (left-tree tree) k)))
                 ((is-leaf? tree) #nil)
                 ((nil? (left-tree tree))
                  (let* ((succ (successor tree))
                         (t2 (replace-right-tree tree (aa-delete (right-tree tree) (key succ)))))
                    (replace-key (replace-value t2 (value succ)) (key succ))))
                 (#t
                  (let* ((pred (predecessor tree))
                         (t2 (replace-left-tree tree (aa-delete (left-tree tree) (key pred)))))
                    (replace-key (replace-value t2 (value pred)) (key pred))))))))
             (t2 (replace-right-tree t1 (skew (right-tree t1))))
             (t3 (if (nil? (right-tree t2))
                     (replace-right-tree
                      t2
                      (replace-right-tree
                       (right-tree t2)
                       (skew (right-tree (right-tree t2)))))
                     t2))
             (t4 (split t3)))
        (replace-right-tree t4 (split (right-tree t4))))))

(define (decrease-level tree)
  (let* ((nilwrap (lambda (X) (if (nil? X) 0 X)))
         (should-be (+ 1 (min (nilwrap (level (left-tree tree))) (nilwrap (level (right-tree tree)))))))
    (if (< should-be (nilwrap (level tree)))
        (let ((t2 (replace-level tree should-be)))
          (if (< should-be (nilwrap (level (right-tree t2))))
              (replace-right-tree t2 (replace-level (right-tree t2) should-be))
              t2)) tree)))

(define (successor tree)
  (letrec ((descend-left (lambda (t)
                           (if (nil? (left-tree t))
                               t
                               (descend-left (left-tree t))))))
    (descend-left (right-tree tree))))

(define (predecessor tree)
  (letrec ((descend-right (lambda (t)
                            (if (nil? (right-tree t))
                                t
                                (descend-right (right-tree t))))))
    (descend-right (left-tree tree))))

(define (aa-map fn tree)
  (if (left-tree tree) (aa-map fn (left-tree tree)))
  (fn (key-value tree))
  (if (right-tree tree) (aa-map fn (right-tree tree))))

(define (aa-map-reverse fn tree)
  (if (right-tree tree) (aa-map fn (right-tree tree)))
  (fn (key-value tree))
  (if (left-tree tree) (aa-map fn (left-tree tree))))

(define (aa-map-keys fn tree)
  (aa-map (lambda (kv) (fn (car kv))) tree))

(define (aa-map-values fn tree)
  (aa-map (lambda (kv) (fn (cdr kv))) tree))

(define (aa-to-list tree)
  (let ((l '()))
    (aa-map-reverse
     (lambda (kv)
       (set! l (cons kv l))) tree) l))

;; Basic idea here is that
;; aa-insert tree key1 key2 value =
;; (aa-insert Ao k1 B)
;;   where B = (aa-insert Bo k2 value)
;;         Bo = (aa-search Ao k1)
;;         Ao = tree
;;
;; That idea is extrapolated out to as many keys as we want using a
;; recursive function.
(define (aa-insert-nested tree key-lst val)
  (cond
   ;; no keys - doesn't make sense
   ((nil? key-lst) (throw 'out-of-range))
   ;; single key list
   ((nil? (cdr key-lst))
    (aa-insert tree (car key-lst) val))
   ;; multiple key list
   (#t
    (aa-insert tree
               (car key-lst)
               (aa-insert-nested (let ((search-result
                                        (aa-search tree (car key-lst))))
                                   (if (nil? search-result) #nil
                                       (car search-result)))
                                 (cdr key-lst) val)))))

(define (aa-delete-nested tree key-lst)
  (cond
   ;; no keys, just return the tree
   ((nil? key-lst) tree)
   ;; single key list
   ((nil? (cdr key-lst))
    (aa-delete tree (car key-lst)))
   ;; multiple key list
   (#t
    (let ((search-result
           (aa-search tree (car key-lst))))
      (if (nil? search-result) tree
          (aa-insert tree
                     (car key-lst)
                     (aa-delete-nested (car search-result)
                                       (cdr key-lst))))))))

(define (aa-search-nested tree key-lst)
  (cond
   ;; no keys, doesn't make sense
   ((nil? key-lst) (throw 'out-of-range))
   ;; single key list
   ((nil? (cdr key-lst))
    (aa-search tree (car key-lst)))
   ;; multiple key list
   (#t
    (let ((search-result
           (aa-search tree (car key-lst))))
      (if (nil? search-result) #nil
          (aa-search-nested (car search-result) (cdr key-lst)))))))
