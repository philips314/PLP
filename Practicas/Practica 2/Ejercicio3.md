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
