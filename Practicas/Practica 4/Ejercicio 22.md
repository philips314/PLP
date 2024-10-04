# Practica 4 / Ejercicio 22.  
Este ejercicio extiende el Cálculo Lambda tipado con listas.  
Comenzamos ampliando el conjunto de tipos:  
τ ::= . . . | [τ]  
donde [τ] representa el tipo de las listas cuyas componentes son de tipo τ . El conjunto de términos ahora incluye:  
M, N, O ::= . . . | $[ ]_τ$ | M :: N | case M of {[ ] $\leadsto$ N | h :: t $\leadsto$ O} | foldr M base $\leadsto$ N; rec(h, r) $\leadsto$ O  
donde:
* $[ ]_σ$ es la lista vacía cuyos elementos son de tipo σ.  
* M :: N agrega M a la lista N.  
* case M of {[ ] $\leadsto$ N | h :: t $\leadsto$ O} es el observador de listas. Por su parte, los nombres de variables que se indiquen luego del | (h y t en este caso) son variables que pueden aparecer libres en O y deberán ligarse con la cabeza y cola de la lista respectivamente.  
* foldr M base $\leadsto$ N;rec(h, r) $\leadsto$ O es el operador de recursión estructural (no currificado). Los nombres de variables indicados entre paréntesis (h y r en este caso) son variables que pueden aparecer libres en O y deberán ser ligadas con la cabeza y el resultado de la recursión respectivamente.
Por ejemplo:
* case zero :: succ(zero) :: $[ ]_{Nat}$ of {[ ] $\leadsto$ False | x :: xs $\leadsto$ isZero(x)} $\twoheadrightarrow$ True  
* foldr 1 :: 2 :: 3 :: (λx: [Nat]. x) $[ ]_{Nat}$ base $\leadsto$ zero; rec(head, rec) $\leadsto$ head + rec $\twoheadrightarrow$ 6
## a. Mostrar el árbol sintáctico para los dos ejemplos dados.  
```
```
## b. Agregar reglas de tipado para las nuevas expresiones.  
```
```
## c. Demostrar el siguiente juicio de tipado (recomendación: marcar variables libres y ligadas en el término antes de comenzar).  
### x : Bool, y : [Bool] ⊢ foldr x :: x :: y base $\leadsto$ y; rec(y, x) $\leadsto$ if y then x else $[ ]_{Bool}$ : [Bool]  
```
```
## d. Mostrar cómo se extiende el conjunto de valores. Estos deben reejar la forma de las listas que un programa podría devolver.  
```
```
## e. Agregar los axiomas y reglas de reducción asociados a las nuevas expresiones.  
```
```

