# Practica 3 / Ejercicio 1
Determinar valor de verdad, cuando el valor de P y Q es V mientras que el de S y T es F.  
## I. (¬P ∨ Q)
```
(¬P v Q) = (¬V v V) = (F v V) = V
```
## II. (P ∨ (S ∧ T) ∨ Q)
```
(P ∨ (S ∧ T) ∨ Q) = (V v (F ∧ F) v V) = (V v (F) v V) = V
```
## III. ¬(Q ∨ S)
```
¬(Q ∨ S) = ¬(V v F) = ¬(V) = F
```
## IV. (¬P ∨ S) ⇔ (¬P ∧ ¬S)
```
(¬P ∨ S) ⇔ (¬P ∧ ¬S) =
(¬V v F) ⇔ (¬V ∧ ¬F) =
(F v F) ⇔ (F ∧ V) =
F ⇔ F = V
```
## V. ((P ∨ S) ∧ (T ∨ Q))
```
((P ∨ S) ∧ (T ∨ Q)) =
((V v F) ∧ (F v V)) =
(V ∧ V) = V
```
## VI. (((P ∨ S) ∧ (T ∨ Q)) ⇔ (P ∨ (S ∧ T) ∨ Q))
```
(((P ∨ S) ∧ (T ∨ Q)) ⇔ (P ∨ (S ∧ T) ∨ Q)) = 
(((V v F) ∧ (F v V)) ⇔ (V v (F ∧ F) v V)) =
(((V) ∧ (V)) ⇔ (V v (F) v V)) =
( (V) ⇔ (V) ) = V
```
## VII. (¬Q ∧ ¬S)
```
(¬Q ∧ ¬S) = (¬F ∧ ¬F) = (V ∧ V) = V
```
