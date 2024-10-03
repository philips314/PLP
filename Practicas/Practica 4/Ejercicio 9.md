# Practica 4 / Ejercicio 9  
Decimos que un tipo τ está habitado si existe un término M tal que el juicio ⊢ M : τ es derivable. En ese caso, decimos que M es un habitante de τ.  
Por ejemplo, dado un tipo σ, la identidad (λx : σ. x) es un habitante del tipo σ → σ.  
Demostrar que los siguientes tipos están habitados (para cualquier σ, τ y ρ):

Para pensar: el tipo b es el de la función conocida como Combinador S. ¾Con qué función ya conocida de Haskellse corresponden los habitantes de los otros tipos? ¾Hay tipos que no estén habitados? ¾Si se reemplaza → por⇒, las fórmulas habitadas son siempre tautologías? ¾Las tautologías son siempre fórmulas habitadas?
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
## b. (σ → τ → ρ) → (σ → τ) → σ → ρ  
### λf: (σ → τ → ρ). λg: (σ → τ). λx: σ. (f x)(g x)
```
--------------------------------------------ax0   -----------------------------------ax0                                 -------------------------------------------ax0       -------------------------------------ax0
f:(σ → τ → ρ), g:(σ → τ), x:σ ⊢ f: σ → τ → ρ      f:(σ → τ → ρ), g:(σ → τ), x:σ ⊢ x:σ                                     f:(σ → τ → ρ), g:(σ → τ), x:σ ⊢ g: σ → τ            f:(σ → τ → ρ), g:(σ → τ), x:σ ⊢ x:σ    
--------------------------------------------------------------------------------------------------- t-APP                --------------------------------------------------------------------------------------------- t-APP 
f:(σ → τ → ρ), g:(σ → τ), x:σ ⊢ (f x): τ → ρ                                                                              f:(σ → τ → ρ), g:(σ → τ), x:σ ⊢(g x): τ
------------------------------------------------------------------------------------------------------------------------------------------------------------------------ t-APP
f:(σ → τ → ρ), g:(σ → τ), x:σ ⊢ (f x) (g x): ρ
--------------------------------------------------------- t-ABS
f:(σ → τ → ρ), g:(σ → τ) ⊢ λx: σ. (f x) (g x): σ → ρ 
------------------------------------------------------------------- t-ABS
f:(σ → τ → ρ) ⊢ λg: (σ → τ). λx: σ. (f x) (g x): (σ → τ) → σ → ρ 
---------------------------------------------------------------------------------------- t-ABS
∅ ⊢ λf: (σ → τ → ρ). λg: (σ → τ). λx: σ. (f x) (g x): (σ → τ → ρ) → (σ → τ) → σ → ρ 
```
## c. (σ → τ → ρ) → τ → σ → ρ  
### 
