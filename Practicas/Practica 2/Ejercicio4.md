# Practica 2 / Ejercicio 4 
## Demostrar las siguientes propiedades utilizando inducción estructural sobre listas y el principio de extensionalidad:
# I.
reverse . reverse = id. 
```
{REVERSE}: reverse = foldl (flip (:)) []
{F0}: foldl f z [] = z
{F1}: foldl f z (x:xs) = foldl f (f z x) xs
```
Por extencionalidad funcional, basta ver que:  
```
∀xs::[a]. (reverse . reverse) xs = id xs.
```
Por induccion estructural sobre listas:  
Quiero probar que ∀xs :: [a]. ∀x :: a. P(xs), donde `P(xs): (reverse . reverse) xs = id xs.`

**Caso Base:** `P([])`
```
(reverse . reverse) [] = {.}
reverse (reverse []) = {REVERSE}
reverse (foldl (flip (:)) []) []= {F0}
reverse [] = {REVERSE}
(foldl (flip (:)) []) [] = {F0}
[] = {ID}
id []

P([]) vale
```
**Caso Inductivo:** `∀xs::[a]. ∀x::a. P(xs) {HI} => P(x:xs) {TI}`  
Asumo que P(xs) vale y quiero probar que P(x:xs) vale.  
Donde:  
P(xs): (reverse . reverse) xs = id xs.  
P(x:xs): (reverse . reverse) (x:xs) = id (x:xs).

```
(reverse . reverse) (x:xs) = {.}
reverse (reverse (x:xs)) = {REVERSE}
reverse (foldl (flip (:)) [] (x:xs)) = {F1}
reverse (foldl (flip (:)) ((flip (:)) [] x) xs) = {FLIP y (:)}
reverse (foldl (flip (:)) [x]) xs) ????
```

# II.  
append = (++).  
```
{A0}: append [] ys = ys
{A1}: append (x:xs) ys = x : append xs ys
{++}: xs ++ ys = foldr (:) ys xs
{F0}: foldr _ z [] = z
{F1}: foldr f z (x:xs) = f x (foldr f z xs)
```
Por extencionalidad funcional, basta ver que:  
```
∀xs::[a]. ∀ys::[a]. append xs ys = (++) xs ys.
``` 
Por induccion estructural sobre listas xs, basta con probar que:
```
∀xs::[a]. P(xs), donde P(xs): ∀ys::[a]. append xs ys = (++) xs ys.
```
**Caso Base:** `P([])`
```
append [] ys = {A0}
ys

(++) [] ys = {++}
foldr (:) ys [] = {F0}
ys

P([]) vale
```
**Caso Inductivo:** `∀xs::[a]. ∀x::a. P(xs) {HI} => P(x:xs) {TI}`  
Asumo que P(xs) vale y quiero probar que P(x:xs) vale.  
Donde:   
P(xs): append xs ys = (++) xs ys.  
P(x:xs): append (x:xs) ys = (++) (x:xs) ys.
```
append (x:xs) ys = {A1}
x : append xs ys = {HI}
x : (++) xs ys = {++}
x : xs ++ ys = {:}
(x:xs) ++ ys

(++) (x:xs) ys = {++}
(x:xs) ++ ys

Llegamos a lo mismo de ambos lados del igual. ∴vale P(x:xs) y se prueba la propiedad.
```

# III.  
map id = id.
```
{ID}: id x = x
{M0}: map _ [] = []
{M1}: map f (x:xs) = f x : map f xs
```
Por extencionalidad funcional, basta ver que:  
```
∀xs::[a]. map id xs = id xs.
``` 
Por induccion estructural sobre listas xs, basta con probar que:
```
∀xs::[a]. P(xs), donde P(xs): map id xs = id xs.
```
**Caso Base:** `P([])`
```
map id [] = {ID}
map [] = {M0}
[]

id [] = {ID}
[]

P([]) vale
```
**Caso Inductivo:** `∀xs::[a]. ∀x::a. P(xs) {HI} => P(x:xs) {TI}`  
Asumo que P(xs) vale y quiero probar que P(x:xs) vale.  
Donde:   
P(xs): map id xs = id xs.  
P(x:xs): map id (x:xs) = id (x:xs).
```
map id (x:xs) = {M1}
id x : map id xs = {ID}
x : map id xs = {HI}
x : id xs = {ID}
x : xs = {ID}
id (x:xs)

Llegamos a lo mismo. ∴vale P(x:xs) y se prueba la propiedad.
```
