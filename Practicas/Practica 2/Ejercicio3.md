# Practica 2 / Ejercicio 3 
## Considerar las siguientes funciones y demostrar las siguientes propiedades:
```
     length :: [a] -> Int
{L0} length [] = 0
{L1} length (x:xs) = 1 + length xs
     duplicar :: [a] -> [a]
{D0} duplicar [] = []
{D1} duplicar (x:xs) = x : x : duplicar xs
     append :: [a] -> [a] -> [a]
{A0} append [] ys = ys
{A1} append (x:xs) ys = x : append xs ys
(++) :: [a] -> [a] -> [a]
{++} xs ++ ys = foldr (:) ys xs
     ponerAlFinal :: a -> [a] -> [a]
{P0} ponerAlFinal x = foldr (:) (x:[])
     reverse :: [a] -> [a]
{R0} reverse = foldl (flip (:)) []
{F0} foldr _ z []     = z
{F1} foldr f z (x:xs) = f x (foldr f z xs)

```
# I.
```
∀xs::[a]. length (duplicar xs) = 2 * length xs.
```
Por induccion estructural tenemos dos casos: Base e inductivo
**Caso Base:** `P([])`
```
length (duplicar []) = {D0}
length [] = {L0}
0

2 * length [] = {L0}
2 * 0 = {INT}
0

P([]) vale
```
**Caso inductivo:** `∀xs::[a]. ∀ x::a. P(xs) {HI} => P(x:xs) {TI}`
Donde:
P(xs): length (duplicar xs) = 2 * length xs. {HI}
P(x:xs): length (duplicar (x:xs)) = 2 * length (x:xs). {TI}
```
length (duplicar (x:xs)) = {D1}
length (x : x : duplicar xs) = {L1}
1 + length (x : duplicar xs) = {L1}
1 + 1 + length (duplicar xs) = {HI}
1 + 1 + 2 * length xs = {INT}
2 + 2 * length xs

2 * length (x:xs) = {L1}
2 * (1 + length xs) = {INT}
2 + 2 * length xs

Llegamos a lo mismo de ambos lados del igual. ∴vale P(x:xs) y se prueba la propiedad.
```
# II.
```
∀xs::[a]. ∀ys::[a]. length (append xs ys) = length xs + length ys
```
Por induccion estructural sobre xs tenemos dos casos: Base e inductivo
**Caso Base:** `P([])`
```
length (append [] ys) = {A0}
length ys

length [] + length ys = {L0}
0 + length ys = {INT}
length ys

P([]) vale
```
**Caso inductivo:** `∀xs::[a]. ∀ x::a. P(xs) {HI} => P(x:xs) {TI}`
Donde:
P(xs): length (append xs ys) = length xs + length ys. {HI}
P(x:xs): length (append (x:xs) ys) = length (x:xs) + length ys. {TI}
```
length (append (x:xs) ys) = {A1}
length (x : append xs ys) = {L1}
1 + length (append xs ys) = 1 + length xs + length ys

length (x:xs) + length ys = {L1}
1 + length xs + length ys

Llegamos a lo mismo de ambos lados del igual. ∴vale P(x:xs) y se prueba la propiedad.
```
# III.
```
∀xs::[a]. ∀x::a. [x] ++ xs = x:xs
```
Por induccion estructural sobre xs tenemos dos casos: Base e inductivo
**Caso Base:** `P([])`
```
[x] ++ [] = {++}
[x]

x : [] = {:}
[x]

P([]) vale
```
**Caso inductivo:** `∀xs::[a]. ∀ x::a. P(xs) {HI} => P(x:xs) {TI}`
Donde:
P(xs): [x] ++ xs = x:xs. {HI}
P(x:xs): [x'] ++ (x:xs) = x':(x:xs). {TI}
```
[x'] ++ (x:xs) = {++}
foldr (:) (x:xs) [x'] = {F1}
(:) x' (foldr (:) (x:xs) []) = {F0}
(:) x' : (x:xs) = {:}
x' : (x:xs)

Llegamos a lo mismo. ∴vale P(x:xs) y se prueba la propiedad.
```
