# Practica 4 / Ejercicio 20.
Este ejercicio extiende el cálculo-λ tipado con pares. Las gramáticas de los tipos y los términos se extienden de la siguiente manera:  
τ ::= . . . | τ × τ  
M ::= . . . | hM, Mi | π1(M) | π2(M)  
donde σ × τ es el tipo de los pares cuya primera componente es de tipo σ y cuya segunda componente es de tipo τ , <M, N> construye un par y π1(M) y π2(M) proyectan la primera y la segunda componente de un par, respectivamente.  
## a. Definir reglas de tipado para los nuevos constructores de términos.  
```
asd
```
## b. Usando las reglas de tipado anteriores, y dados los tipos σ, τ y ρ, exhibir habitantes de los siguientes tipos: 
I. Constructor de pares: σ → τ → (σ × τ).  
```
asd
```
II. Proyecciones: (σ × τ ) → σ y (σ × τ ) → τ.  
```
asd
```
III. Conmutatividad: (σ × τ ) → (τ × σ).  
```
asd
```
IV. Asociatividad: ((σ × τ ) × ρ) → (σ × (τ × ρ)) y (σ × (τ × ρ)) → ((σ × τ ) × ρ).  
```
asd
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

 
