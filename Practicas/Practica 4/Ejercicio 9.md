# Practica 4 / Ejercicio 9  
Decimos que un tipo τ está habitado si existe un término M tal que el juicio ⊢ M : τ es derivable. En ese caso, decimos que M es un habitante de τ.  
Por ejemplo, dado un tipo σ, la identidad (λx : σ. x) es un habitante del tipo σ → σ.  
Demostrar que los siguientes tipos están habitados (para cualquier σ, τ y ρ):
## a. σ → τ → σ  
### λx: σ.λy: τ. x  
```
-----------------t-VAR
x: σ, y: τ ⊢ x: σ
--------------------------T-ABS
x: σ ⊢ λy:τ. x: τ → σ
--------------------------------T-ABS
∅ ⊢ λx: σ.λy: τ. x: σ → (τ → σ)
```
