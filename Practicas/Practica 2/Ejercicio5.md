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
{F0} foldr _ z []  = z
{F1} foldr f z (x:xs) = f x (foldr f z xs)
{C} const a _ = a
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
```
Por un lado:
zip [] ys = {Z0}
foldr ( \x rec ys -> if null ys then [] else (x, head ys) : rec (tail ys) ) (const []) [] ys = {F0}
(const []) ys = {C}
[]
Por el otro:
zip' [] ys = {Z'0}
[]

([] == []) ==> P([]) vale.
```
**Caso Inductivo:** `∀xs::[a]. ∀x::a. P(xs) {HI} => P(x:xs) {TI}`
Asumo que P(xs) vale y qvq P(x:xs) es verdadera.
Donde: 
P(xs): ∀ys::[b]. zip xs ys = zip' xs ys **{HI}**
P(x:xs): ∀ys::[b]. zip (x:xs) ys = zip' (x:xs) ys **{TI}**
```
Por un lado:
zip (x:xs) ys = {Z0}
foldr ( \x rec ys -> if null ys then [] else (x, head ys) : rec (tail ys) ) (const []) (x:xs) ys = {F1} foldr f z (x:xs) = f x (foldr f z xs)
( \x rec ys -> if null ys then [] else (x, head ys) : rec (tail ys) ) x ( foldr (\x rec ys -> if null ys then [] else (x, head ys) : rec (tail ys)) (const []) xs) ys = {B}
     donde x = x, rec = (foldr (\x rec ys -> if null ys then [] else (x, head ys) : rec (tail ys)) (const []) xs) & ys = ys.
if null ys then [] else (x, head ys) : (foldr (\x rec ys -> if null ys then [] else (x, head ys) : rec (tail ys)) (const []) xs) (tail ys) = {Z0}
if null ys then [] else (x, head ys) : zip xs (tail ys) = {HI} TENGO DUDAS SOBRE ESTE PROCEDIMIENTO PUES YS != (TAIL YS)
if null ys then [] else (x, head ys) : zip' xs (tail ys)

Por el otro:
zip' (x:xs) ys = {Z'1}
if null ys then [] else (x, head ys) : zip' xs (tail ys)

Llegamos a lo mismo desde los dos lados. ∴P(x:xs) vale, y con ello, vale lo que queriamos probar. 
```
