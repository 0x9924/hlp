#ifndef _LISTA_H
#define _LISTA_H

#include <iostream>
using namespace std;

template <class T>
class Node {
     T data;
     Node<T> * _next;
     Node<T> * _prev;
public:
     Node<T> * next() { return _next; }
     Node<T> * prev() { return _prev; }
     void set_next(Node<T> * next) { _next = next; }
     void set_prev(Node<T> * prev) { _prev = prev; }
     T value() { return data; }
     template <typename ListT>
     friend class List;
     Node(T e) { data = e; _prev = _next = this; }
     Node(T e, Node<T> * prev, Node<T> * next) {
          data = e;
          _prev = prev;
          _next = next;
     }
     
          
};

template<class T>
class List {
     Node<T> *_first;
     int _size;
     // pre: size > 0
     Node<T> * last_node() { return _first -> prev(); } 
public:
     List<T>() : _first(NULL), _size(0) {}

     ~List<T>() { while (_size > 0) { pop(); } }

     Node<T>* first_node() { return _first; }
     int size() { return _size; }
     void push(T e);
     T pop();
};

template<class T>
void List<T>::push(T e) 
{
     if (!_first) {
          Node<T>* tmp = new Node<T>(e);
          _first = tmp;
     } else {
          Node<T> * ult = last_node();
          Node<T> * n = new Node<T>(e, ult, _first);
          ult -> set_next(n);
          _first -> set_prev(n);
                    
     }
     _size++;
}


template<class T>
T List<T>::pop() {
     Node<T> * ult = last_node();
     T res = ult -> data;
     ult -> prev() -> set_next(ult -> next()) ;
     ult -> next() -> set_prev(ult -> prev()) ;
     _size--;
     delete ult;
     ult = NULL;
     return res;
}


#endif // _LISTA_H
