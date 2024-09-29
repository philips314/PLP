# Practica 3 / Ejercicio 5  
Demostrar en deducción natural que las siguientes fórmulas son teoremas sin usar principios de razonamiento clásicos salvo que se indique lo contrario. Recordemos que una fórmula σ es un teorema si y sólo si vale ⊢ σ:  
## I. Modus ponens relativizado: (ρ ⇒ σ ⇒ τ ) ⇒ (ρ ⇒ σ) ⇒ ρ ⇒ τ.
```
asdas
```
## II. Reducción al absurdo: (ρ ⇒ ⊥) ⇒ ¬ρ  
```
                      -------------------ax  ---------------ax
                      (ρ ⇒ ⊥), P ⊢ P ⇒ ⊥   (ρ ⇒ ⊥), P ⊢ P
                      ------------------------------------------⇒e
                      (ρ ⇒ ⊥), P ⊢ ⊥
---------------ax     ------------------- ⊥e
(ρ ⇒ ⊥), P ⊢ P       (ρ ⇒ ⊥), P ⊢ ¬P
--------------------------------------- ¬e
(ρ ⇒ ⊥), P ⊢ ⊥ 
----------------- ¬i
(ρ ⇒ ⊥) ⊢ ¬ρ 
----------------- ⇒i
⊢ (ρ ⇒ ⊥) ⇒ ¬ρ 
```
