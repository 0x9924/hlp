# Probabilidad

__Experimento__: es cualquier proceso que genera observaciones y puede repetirse.

__Espacio muestral__ S: Es el conjunto de todos los reultados posibles del
                    experimento.

## Axiomas

A1   $P(A) \geq 0$ , para todo evento $A$.

A2    $P(S) = 1$ 

A3 a  Si $A_1, A_2, \dots, A_n$ es una colección finita de sucesos mutuamente
      excluyentes, o sea tales que la intersección $A_i \cap A_j = \emptyset$,
      para todo $i \neq j$, entonces: 
	  $$P \left( \bigcap_{i=1}^n \right) A_i 
	  = \sum_{i=1}^n P(A_i)$$
	  

A3 b  Si $A_1, A_2, \dots, A_n$ es una colección infinita numerable de
	sucesos mutuamente exluyentes (o sea $A_i \cap A_k \forall i \neq j$),
	entonces:
	$$P \left( \bigcap_{i=1}^{\infty} \right) A_i 
	  = \sum_{i=1}^{\infty} P(A_i)$$
	  

## Propiedades

1   $P(A^{\complement}) = 1 - P(A)$

2   $P(\emptyset) = 0$

3   Si $A \subset B \to P(A) \leq P(B)$
	   y
       $P(B-A) = P(B) -P(A)$

4   Dado dos sucesos cualesquiera $A$ y $B$,
	$P(A \cup B) = P(A) + P(B) - P(A\cap B)$

5   Dado dos sucesos cualesquiera $A$ y $B$,
	$P(A \cup B) \leq P(A) + P(B)$
	

## DEF. (_Probabilidad condicional_)

Sean $A$ y $B$ eventos tales que $P(B)>0$, entonces la probailidad del evento 
$A$ condicional a la ocurrencia del evento $B$ es

$$P(A|B) = \frac{P(A\cap B)}{P(B)}$$

## Propiedades de la probabilidad condicional.
Dado un suceso $B$ fijo tal que $P(B)>0$, $P(\cdot|B)$ es un aprobabilidad,
por lo que se cumplen los axiomas de la probabilidad.

## Regla del producto
Dados dos sucesos $A$ y $B$ tales que $P(B)>0$, se tiene:

$$P(A\cap B) = P(A|B) P(B)$$

Si además $P(A)>0$, entonces

$$P(A\cap B) = P(B|A) P(A)$$

## DEF. (_Particion_) 
Una colección de eventos $A_1, \dots, A_n$ constituye una __partición__ del 
espacio muestral $S$ es:

1.    $A_i \cap A_j = \emptyset, \forall i \neq j$

2.    $P(A_i)>0, \forall i$

3.    $\bigcup_{i=1}^k A_i = S$


## Teorema de la probabilidad total
Sea $A_1, \dots, A_n$ una partición del espacio muestral $S$ y sea $B$ un
suceso cualquiera. Entonces:

$$ P(B) = \sum_{i=1}^k P(B|A_i)P(A_i)$$


## Teorema de Bayes
Sea $A_1, \dots, A_n$ una partición del espacio muestral $S$ y sea $B$ un
suceso cualquiera tal que $P(B)>0$. Entonces:

$$ P(A_j|B) = \frac{P(B|A_j) P(A_j)}
                   {\sum_{i=1}^k P(B|A)P(A_j)}$$
                   
## DEF. (_independencia_)
Los eventos $A$ y $B$ son __independientes__ si:
$$ P(A\cap B) = P(A) P(B)$$

## Proposición
Si $P(B) > 0$, $A$ y $B$ son independientes si y sólo si 
$$P(A|B) = P(A) $$

## Propiedades

1. Si $A \cap B = \emptyset$, $P(A)>0 $ y $P(B)>0$ entonces $A$ y$B$ no
   son independientes.

2. Si $P(B)=0$, entonces $B$ es independiente de cualquier suceso $A$ tal que 
   $P(A) >0$
   
3. Si $A\subseteq B, P(A) > 0$ y $P(B)<1$m entonces $A$ y$B$ no son 
   independientes.
   
4. Si $A$ y $B$ son independientes, $A$ y $B^{\complement}$ también lo son.


## DEF. (_independencia de dos o más eventos_)

Los eventos $A_1, \dots, A_n$ son independientes si para tofo $k = 2, \dots, n$
y para todo conjunto de índices $\{ i_1, i_2, \dots, i_k\}$ tales que 
$1 \leq i_1 \leq i_2 \leq \dots \leq i_k \leq n$ se verifica:

$$ P(A_{i_1} \cap A_{i_2} \cap \dots \cap ) = P(A_{i_1}) P(A_{i_2}) \dots P(A_{i_k})$$
