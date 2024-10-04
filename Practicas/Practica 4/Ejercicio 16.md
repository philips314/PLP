# Practica 4 / Ejercicio 16  
Para el siguiente ejercicio, considerar el cálculo sin la regla pred(zero) → zero. Un programa es un término que tipa en el contexto vacío (es decir, no puede contener variables libres).  
Para cada una de las siguientes expresiones:  
a) Determinar si puede ser considerada un programa.  
b) Si es un programa, Cuál es el resultado de su evaluación? Determinar si se trata de una forma normal, y en caso de serlo, si es un valor o un error.  
## I. (λx: Bool. x) true  
```
Es un programa.
(λx: Bool. x) true = true {funcion/valor}
```
## II. λx: Nat. pred(succ(x))  
```
Es un programa 
λx: Nat. pred(succ(x))  {valor}
```
## III. λx: Nat. pred(succ(y))  
```
No tipa, pues requiere informacion sobre el y (y: Nat) para tipar.
```
## IV. (λx: Bool. pred(isZero(x))) true  
```


---------------------------------------
∅ ⊢ (λx: Bool. pred(isZero(x))) true
```
## V. (λf : Nat → Bool. f zero) (λx: Nat. isZero(x))  
```
```
## VI. (λf : Nat → Bool. x) (λx: Nat. isZero(x))  
```
```
## VII. (λf : Nat → Bool. f pred(zero)) (λx :Nat. isZero(x))  
```
```
# VIII. µy : Nat. succ(y)  
```
```
