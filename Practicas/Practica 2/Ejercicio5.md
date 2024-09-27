# Practica 2 / Ejercicio 5 
## Dadas las siguientes funciones:
```
     zip :: [a] -> [b] -> [(a,b)]
{Z0} zip = foldr f (const [])
         where f = \x rec ys ->
                   if null ys then []
                   else (x, head ys) : rec (tail ys)

      zip' :: [a] -> [b] -> [(a,b)]
{Z'0} zip' [] ys = []
{Z'1} zip' (x:xs) ys = if null ys then [] else (x, head ys) : zip' xs (tail ys)
```
### Demostrar que zip = zip' utilizando inducción estructural y el principio de extensionalidad.

Quiero ver que: `zip = zip'`.
Por principio de extencionalidad funcional basta ver que:
```
∀xs :: [a]. P(xs), donde P(xs): ∀ys :: [b]. zip xs ys = zip' xs ys
```
Por induccion sobre listas xs...
```
P(xs): zip xs ys = zip' xs ys
```
**Caso Base:** `P([])`
