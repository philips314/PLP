# Practica 4 / Ejercicio 10
Determinar qué tipos representan σ y τ en cada uno de los siguientes juicios de tipado. Si hay más de una solución, o si no hay ninguna, indicarlo.
## a. x: σ ⊢ isZero(succ(x)) : τ  
```
-> SOlO tipa si σ = Nat y τ = Bool

x: σ ⊢ x: Nat
----------------------- t-SUCC
x: σ ⊢ succ(x) : Nat
------------------------------- t-isZERO
x: σ ⊢ isZero(succ(x)) : τ 
```
## b. ∅ ⊢ (λx: σ. x)(λy : Bool. zero) : σ ??? DUDAS CON LA PARTE DERECHA
```
Por el lado izquierdo: Tipa con cualquier σ
Por el derecho (*): Tipa si σ=Nat

---------- t-VAR                    ---------- t-VAR
x:σ ⊢ x:σ                           y:Bool ⊢ zero: σ  (*)
------------------------ t-ABS      --------------------------- t-ABS
∅ ⊢ (λx: σ. x): σ → σ               ∅ ⊢ (λy: Bool. zero): σ
-------------------------------------------------------------------------- t-APP
∅ ⊢ (λx: σ. x)(λy : Bool. zero) : σ
```
## c. y: τ ⊢ if (λx: σ. x) then y else succ(zero) : σ
```
No tipa pues, (λx: σ. x) deberia ser de tipo: μ → Bool.

                                                      ------------------ ax0
NO TIPA                        τ=σ                     y: τ ⊢ zero: Nat
-----------------------       -------------- t-VAR    -------------------------
y: τ ⊢ (λx: σ. x): Bool       y: τ ⊢ y: σ             y: τ ⊢ succ(zero) : σ
------------------------------------------------------------------------------ t-IF
y: τ ⊢ if (λx: σ. x) then y else succ(zero) : σ
```
## d. x: σ ⊢ x y : τ
```
Tipa si y solo si σ = μ → τ 

σ = μ → τ                    σ = μ 
---------------- t-VAR      ---------------- t-VAR
x: σ ⊢ x: μ → τ              x: σ ⊢ y : μ
----------------------------------------------- t-APP
x: σ ⊢ x y : τ
```
## e. x: σ, y: τ ⊢ x y : τ
```
Tipa si y solo si σ = μ → μ


σ = μ → τ                            τ = μ
--------------------- t-VAR          ------------------ t-VAR
x: σ, y: τ ⊢ x: μ → τ                x: σ, y: τ ⊢ y: μ
--------------------------------------------------------- t-APP
x: σ, y: τ ⊢ x y : τ
```
## f. x: σ ⊢ x true : τ
```
Tipa si y solo si σ = Bool → τ

σ = μ → τ                      μ = Bool
--------------- t-VAR         ---------------- t-TRUE
x: σ ⊢ x: μ → τ                x: σ ⊢ true: μ
--------------------------------------------------------- t-APP
x: σ ⊢ x true: τ
```
## g. x: σ ⊢ x true : σ
```
Tipa si y solo si σ = Bool → σ, pero esto no es valido. No se puede definir un tipo con una referencia ciclica.

σ = μ → σ                      μ = Bool
--------------- t-VAR         ---------------- t-TRUE
x: σ ⊢ x: μ → σ                x: σ ⊢ true: μ
--------------------------------------------------------- t-APP
x: σ ⊢ x true: σ
```
## h. x: σ ⊢ x x : τ
```
Solo tipa si σ = μ, pero si esto es asi, σ = σ → τ y esto no se puede.

σ = μ → τ                  σ = μ
---------------- t-VAR     ------------        
x: σ ⊢ x: μ → τ            x: σ ⊢ x: μ
--------------------------------------------------------- t-APP
x: σ ⊢ x x : τ
```
