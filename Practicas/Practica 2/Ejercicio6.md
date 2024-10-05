# Practica 2 / Ejercicio 6
## Dadas las siguientes funciones:
```
     nub :: Eq a => [a] -> [a]
{N0} nub [] = []
{N1} nub (x:xs) = x : filter (\y -> x /= y) (nub xs)
     union :: Eq a => [a] -> [a] -> [a]
{U0} union xs ys = nub (xs++ys)
     intersect :: Eq a => [a] -> [a] -> [a]
{I0} intersect xs ys = filter (\e -> elem e ys) xs
{FI0} filter _ [] = []
{FI1} filter p (x:xs) =  if p x then x : (filter p xs) else filter p xs
{E0}: elem e []     = False
{E1}: elem e (x:xs) = x == e || elem x xs
```
Indicar si las siguientes propiedades son verdaderas o falsas. Si son verdaderas, realizar una demostración. Si son falsas, presentar un contraejemplo.

# I.  
```
Eq a => ∀xs::[a]. ∀e::a. ∀p::a->Bool. elem e xs && p e = elem e (filter p xs)
```
Verdadero  
Intuitivamente: Indica que si e esta en xs y p(e) entonces e va a estar en filter p xs, ya que filter solo "saca" los elementos que no cumplan p.  
Por **Induccion estructural sobre listas**, tenemos que:  

```
∀xs::[a]. P(xs), donde P(xs): Eq e => ∀e::a. ∀p::a->Bool. elem e xs && p e = elem e (filter p xs)
```
**Caso Base:** `P([])`
```
Por un lado:
elem e [] && p e = {E0}
False && p e = {&&}
False

elem e (filter p []) = {FI0}
elem e [] = {E0}
False

P([]) vale
```
Caso Inductivo: ∀xs::[a]. ∀x::a. P(xs) {HI} => P(x:xs) {TI}  
Asumo que P(xs) vale y qvq P(x:xs) es verdadera.  
Donde:  
P(xs): elem e xs && p e = elem e (filter p xs) {HI}  
P(x:xs): elem e (x:xs) && p e = elem e (filter p (x:xs)) {TI}  
```
elem e (x:xs) && p e= {E1}
(e == x || elem e xs) && p e

elem e (filter p (x:xs) ) = {FI1}
elem e (if p x then x : filter p xs else filter p xs)
```
Por **extensionalidad sobre Booleanos**: `p e :: Bool` ==> Puede ser True o False & `p x :: Bool` ==> Puede ser True o False.  
**Caso 1:** `p e = False` & `p x = False`
```
(e == x || elem e xs) && p e = {p e = False}
False

elem e (if p x then x : filter p xs else filter p xs) = {p x = False}
elem e (filter p xs) = {HI}
elem e xs && p e = {p e = False}
False

Me queda False de los dos lados!
```
**Caso 2:** `p e = True` & `p x = True`
```
(e == x || elem e xs) && p e = {p e = True}
(e == x || elem e xs) && True = {&&}
e == x || elem e xs

elem e (if p x then x : filter p xs else filter p xs) = {p x = True}
elem e (x : filter p xs) = {E1}
e == x || elem e (filter p xs) = {HI}
e == x || elem e xs && p e = {p e = True; &&}
e == x || elem e xs

Tengo lo mismo de los dos lados!
```
**Caso 3:** `p e = True` & `p x = False`
```
e == x || elem e xs && p e = {p e = True}
e == x || elem e xs && True = {&&}
e == x || elem e xs

elem e (if p x then x : filter p xs else filter p xs) = {p x = False}
elem e (filter p xs) = {HI}
elem e xs && p e = {p e = True; &&}
elem e xs

Si e == x entonces p e == p x, pero p e = True & p x = False, por ende e != x. Me queda elem e xs de los dos lados {||}
```
**Caso 4:** `p e = False` & `p x = true`
```
(e == x || elem e xs) && p e = {p e = False}
(e == x || elem e xs) && False = {&&}
False

elem e (if p x then x : filter p xs else filter p xs) = {p x = True}
elem e (x : filter p xs) = {E1}
e == x || elem e (filter p xs) = {HI}
e == X || elem e xs && p e = {p e = False; &&}
e == x || False = {||}
e == x

Sea e == x, entonces p e == p x, pero habia asumido que p e = False y p x = True ==> Asi que me queda False == True = False.
Tengo lo mismo de los dos lados.
```
???  
# II.
```
Eq a => ∀xs::[a]. ∀e::a. elem e xs = elem e (nub xs)
```
Nub es una funcion que quita los elementos repetidos de una lista. Por lo tanto, si un elemento e pertenece a xs, este tambien deberia pertenecer en nub xs.  
Quiero probar que la afirmacion es verdadera.  
Por Induccion estructural sobre listas xs , tenemos que:
```
∀xs::[a]. P(xs), donde p(xs): ∀e::a. elem e xs = elem e (nub xs)
```
**Caso Base:** `P([])`
```
elem e [] = {E0}
False

elem e (nub []) = {N0}
elem e [] = {E0]
[]

P([]) vale
```
**Caso Inductivo:** ∀xs::[a]. ∀x::a. P(xs) {HI} => P(x:xs) {TI}  
Asumo que P(xs) vale y quiero probar que P(x:xs) vale.  
Donde:  
P(xs): elem e xs = elem e (nub xs). {HI}  
P(x:xs): elem e (x:xs) = elem e (nub (x:xs). {TI}
```
elem e (x:xs) = {E1}
e == x || elem e xs

elem e (nub (x:xs)) = {N1}
elem e (x : filter (\y -> x /= y) (nub xs)) = {E1}
e == x || elem e filter (\y -> x /= y) (nub xs)

Por extensionalidad de booleanos: e == x puede ser True o False
Si e == x es True:
     Por {||} nos queda True de ambos lados.
Si e == x es False:
     Por {||}, basta ver que: elem e xs = elem e filter (\y -> x /= y) (nub xs)


          

     
```

# V.  
```
Eq a => ∀xs::[a]. ∀ys::[a]. length (union xs ys) = length xs + length ys
```
Falso.  
Intuitivamente, pueden haber elementos repetidos entre las listas. El lado izq las toma en cuenta para evitarlas, y el lado derecho las incluye.
**Contraejemplo:**
```
xs = [2] ys = [2]

length (union [2] [2]) = {U0}
length (nub [2]++[2]) = {++}
length (nub [2,2]) = {N1} nub (x:xs) = x : filter (\y -> x /= y) (nub xs)
length (2 : filter (\y -> 2 /= y) (nub [2])) = {N1}
length (2 : filter (\y -> 2 /= y) (2 : filter (\y -> 2 /= y) (nub []))) = {N0}
length (2 : filter (\y -> 2 /= y) (2 : filter (\y -> 2 /= y) [])) = {FILTER}
length (2 : filter (\y -> 2 /= y) (2 : [])) = {:}
length (2 : filter (\y -> 2 /= y) [2])) = {FILTER pues 2 /= 2 es False}
length (2 : [])) = {:}
length [2] = {LENGTH}
1

length [2] + length [1] = {LENGTH}
1 + 1 = {INT}
2

1 != 2 ==> La afirmacion es Falsa.
```
