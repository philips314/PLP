# Practica 4 / Ejercicio 20.
Este ejercicio extiende el cálculo-λ tipado con pares. Las gramáticas de los tipos y los términos se extienden de la siguiente manera:  
τ ::= . . . | τ × τ  
M ::= . . . | >M, M> | π1(M) | π2(M)  
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
V. Currificación: ((σ × τ ) → ρ) → (σ → τ → ρ) y (σ → τ → ρ) → ((σ × τ ) → ρ).  
```
asd
```
## c. Cómo se extiende el conjunto de los valores?  
```
asd
```
## d. Definir reglas de semántica operacional manteniendo el determinismo y la preservación de tipos. Importante: no olvidar las reglas de congruencia.  
```
asd
```
## e. Demostrar el determinismo de la relación de reducción definida. Se verica la propiedad de preservación de tipos? Se verica la propiedad de progreso?  
```
asd
```

 
