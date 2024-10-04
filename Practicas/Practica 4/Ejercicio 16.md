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
NO TIPA, no es un programa.

x:Bool ⊢ x: Nat 
-----------------------
x:Bool ⊢ isZero(x): Nat
-----------------------------
x:Bool ⊢ pred(isZero(x)): Nat
----------------------------------------- t-ABS       ------------- t-TRUE
⊢ λx: Bool. pred(isZero(x)): Bool -> Nat               ⊢ true: Bool
---------------------------------------------------------------------- t-APP
∅ ⊢ (λx: Bool. pred(isZero(x))) true
```
## V. (λf : Nat → Bool. f zero) (λx: Nat. isZero(x))  
```
Es un programa, especificamente un valor.

(λf : Nat → Bool. f zero) (λx: Nat. isZero(x))
(f 0) {f := λx: Nat. isZero(x)} =
(λx: Nat. isZero(x)) 0
isZero(x){x := 0} =
isZero(0) =
true
```
## VI. (λf : Nat → Bool. x) (λx: Nat. isZero(x))  
```
No es un programa, no tipa.
```
## VII. (λf : Nat → Bool. f pred(zero)) (λx :Nat. isZero(x))  
```
(λf : Nat → Bool. f pred(zero)) (λx :Nat. isZero(x)) =
(λf : Nat → Bool. f pred(0)) (λx :Nat. isZero(x)) =
(f pred(0)){f := (λx :Nat. isZero(x))} =
(λx :Nat. isZero(x)) pred(0) =
λx :Nat. isZero(x){x := pred(0)} =
isZero(pred(0))

Como sacamos la regla pred(0) → 0, no podemos seguir reduciendo, pero isZero(pred(0)) no es un valor, asi que se considera un error.
```
# VIII. µy : Nat. succ(y)  
```
???
```
