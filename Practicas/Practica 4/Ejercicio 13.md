# Practica 4 / Ejercicio 13  
Sean σ, τ, ρ tipos. Según la definición de sustitución, calcular:  
## a. (λy: σ. x (λx: τ. x)){x := (λy : ρ. x y)}  ∉ ∈
``` 
(λy: σ. x (λx: τ. x)){x := (λy: ρ. x y)} = 
λy: σ. x (λx: τ. x){x := (λy: ρ. x y)} =
λy: σ. x{x := (λy: ρ. x y)}   (λx: τ. x){x := (λy: ρ. x y)} =
λy: σ. (λy: ρ. x y)(λx: τ. x)
```
## b. (y (λv: σ. x v)){x := (λy : τ. v y)}
```
(y (λv: σ. x v)){x := (λy : τ. v y)} =
y{x := (λy : τ. v y)}  (λv: σ. x v){x := (λy : τ. v y)} = {x ∉ fv(λv: σ. x v)}
y (λv: σ. x v)
```
