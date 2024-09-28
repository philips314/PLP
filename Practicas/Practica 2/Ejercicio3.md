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
∀xs::[a]. length (duplicar xs) = 2 * length xs.
