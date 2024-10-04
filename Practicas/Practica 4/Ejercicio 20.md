# Practica 4 / Ejercicio 20.
Este ejercicio extiende el cálculo-λ tipado con pares. Las gramáticas de los tipos y los términos se extienden de la siguiente manera:  
τ ::= . . . | τ × τ  
M ::= . . . | <M, M> | π1(M) | π2(M)  
donde σ × τ es el tipo de los pares cuya primera componente es de tipo σ y cuya segunda componente es de tipo τ , <M, N> construye un par y π1(M) y π2(M) proyectan la primera y la segunda componente de un par, respectivamente.  
## a. Definir reglas de tipado para los nuevos constructores de términos.  
```
Γ ⊢ M: σ     Γ ⊢ N: τ                 Γ ⊢ M: σ x τ                 Γ ⊢ M: σ x τ
------------------------- t-PAR       ----------------- t-FST      ----------------- t-SND
Γ ⊢ <M, N>: σ × τ                     Γ ⊢ π1(M): σ                 Γ ⊢ π2(M): τ
```
## b. Usando las reglas de tipado anteriores, y dados los tipos σ, τ y ρ, exhibir habitantes de los siguientes tipos: 
I. Constructor de pares: σ → τ → (σ × τ).  
```
λx: σ. λy: τ. <x,y>
```
II. Proyecciones: (σ × τ) → σ y (σ × τ) → τ.  
```
λp: σ x τ. π1(p)
λp: σ x τ. π2(p)
```
III. Conmutatividad: (σ × τ) → (τ × σ).  
```
λp: σ x τ. <π2(p), π1(p)>
```
IV. Asociatividad: ((σ × τ) × ρ) → (σ × (τ × ρ)) y (σ × (τ × ρ)) → ((σ × τ) × ρ).  
```
λx:((σ × τ) × ρ). < π1(π1(x)), <π1(π2(x)), π2(x)> >
λy:(σ × (τ × ρ)). < <π1(y), π2(π1(y))>, π2(π2(y)) >
```
V. Currificación: ((σ × τ) → ρ) → (σ → τ → ρ) y (σ → τ → ρ) → ((σ × τ) → ρ).  
```
λf:((σ × τ) → ρ). λx: σ. λy: τ. f <x,y>
λg:(σ → τ → ρ). λp: σ × τ. g π1(p) π2(p)
```
## c. Cómo se extiende el conjunto de los valores?  
```
τ ::= . . . | τ × τ  
M ::= . . . | <M, M> | π1(M) | π2(M
```
## d. Definir reglas de semántica operacional manteniendo el determinismo y la preservación de tipos. Importante: no olvidar las reglas de congruencia.  
```
Obs: cg es congruencia y cm es computo.

    M → M'                         N → N'
----------------- cg-p1       -------------------- cg-p2
 <M,N> → <M',N>                <V1,N> → <V1,N'>

    M → M'                        M → M'
---------------- cg-π1       ---------------- cg-π2
 π1(M) → π1(M')                π2(M) → π2(M')

π1(<V1,V2>) → V1   {cm-π1}
π1(<V1,V2>) → V2   {cm-π2}
```
## e. Demostrar el determinismo de la relación de reducción definida. Se verifica la propiedad de preservación de tipos? Se verifica la propiedad de progreso?  
```
asd
```
## Extra. Verificar el siguiente juicio de tipado ∅ ⊢ π1((λx: Nat. <x, True>) 0): Nat  
```
---------------- t-VAR       ---------------------- t-TRUE
x: Nat ⊢ x: Nat              x: Nat ⊢ True: Bool
----------------------------------------------------- t-PAR
x: Nat ⊢ <x, True>: Nat x Bool
------------------------------------------ t-ABS          ------------ax0
∅ ⊢ λx: Nat. <x, True>: Nat → Nat x Bool                  ∅ ⊢ 0: Nat
------------------------------------------------------------------------- T-APP
∅ ⊢ (λx: Nat. <x, True>) 0: Nat x Bool
----------------------------------------- t-π1
∅ ⊢ π1((λx: Nat. <x, True>) 0): Nat
```
## Extra. Reducir π1((λx: Nat. <x, True>) 0) a un valor.  
```
π1((λx: Nat. <x, True>) 0) → π1(<0, True>) → 0     {B,cm-π1}
```

 
