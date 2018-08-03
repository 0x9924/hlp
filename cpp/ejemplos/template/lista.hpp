#ifndef _LISTA_H
#define _LISTA_H

using namespace std;

template <class T>
class Nodo {
     T data;
     Nodo<T> * _next;
     Nodo<T> * _prev;
public:
     Nodo<T> * next() { return _next; }
     Nodo<T> * prev() { return _prev; }
     void set_next(Nodo<T> * next) { _next = next; }
     void set_prev(Nodo<T> * prev) { _prev = prev; }
     T value() { return data; }
     template <typename ListT>
     friend class Lista;
     Nodo(T e) { data = e; _prev = _next = this; }
     Nodo(T e, Nodo<T> * prev, Nodo<T> * next) {
          data = e;
          prev = _prev;
          next = _next;
     }
          
};

template<class T>
class Lista {
     Nodo<T> *_head;
     int _size;
     // pre: size > 0
     Nodo<T> * ultimo_nodo() { return _head -> prev(); } 
public:
     Lista<T>() : _head(NULL), _size(0) {}
          
     Nodo<T>* head() { return _head; }
     int size() { return _size; }
     void agregar(T e);
};

template<class T>
void Lista<T>::agregar(T e) 
{
     if (!_head) {
          Nodo<T>* tmp = new Nodo<T>(e);
          _head = tmp;
     } else {
          Nodo<T> * ult = ultimo_nodo();
          Nodo<T> * n = new Nodo<T>(e, ult, _head);
          ult -> set_next(n);
          _head -> set_prev(n);
                    
     }
     _size++;
}

#endif // _LISTA_H
