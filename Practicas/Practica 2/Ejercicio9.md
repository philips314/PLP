# Practica 2 / Ejercicio 9 
## Dadas las funciones altura y cantNodos denidas en la práctica 1 para árboles binarios, demostrar la siguiente propiedad:
```
∀ x::AB a. altura x ≤ cantNodos x
```
```hs
altura :: AB a -> Integer
altura = foldAB 0 f
    where f = \ri _ rd -> 1 + max ri rd

cantNodos :: AB a -> Integer
cantNodos = foldAB 0 g
    where g = \ri _ rd -> 1 + ri + rd

foldAB z f x = case x of
    Nil -> z
    (Bin i r d) -> f (rec i) r (rec d)
    where rec = foldAB z f
```
