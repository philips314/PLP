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
{FR0} foldr _ z []     = z
{FR1} foldr f z (x:xs) = f x (foldr f z xs)
{M0}: map _ []     = []
{M1}: map f (x:xs) = f x : map xs
{FL0}: foldl _ z [] = z
{FL1}: foldl f z (x:xs) = foldl f (f z x) xs
{FLIP}: flip f x y = f y x

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
# IV.
```
∀xs::[a]. ∀f::(a->b). length (map f xs) = length xs
```
Por induccion estructural sobre xs tenemos dos casos: Base e inductivo  
**Caso Base:** `P([])`
```
length (map f []) = {M0}
length [] = {L0}
0 = {L0}
length []

P([]) vale
```
**Caso inductivo:** `∀xs::[a]. ∀ x::a. P(xs) {HI} => P(x:xs) {TI}`  
Donde:  
P(xs): length (map f xs) = length xs. {HI}  
P(x:xs): length (map f (x:xs)) = length (x:xs). {TI}
```
length (map f (x:xs)) = {M1}
length (f x : map f xs) = {L1}
1 + lenght (map f xs) = {HI}
1 + length xs = {DEF LENGTH}
length (x:xs)

Llegamos a lo mismo. ∴vale P(x:xs) y se prueba la propiedad.
```
# V.
```
∀xs::[a]. ∀p::a->Bool. ∀e::a. ((elem e (filter p xs)) ⇒ (elem e xs)) (asumiendo Eq a)

```
Por induccion estructural sobre xs tenemos dos casos: Base e inductivo  
**Caso Base:** `P([])`
```
elem e (filter p []) = {F1}
elem e [] = {ELEM}
False

P([]) vale, pues False ==> ALGO es una implicacion Verdadera
```
**Caso inductivo:** `∀xs::[a]. ∀ x::a. P(xs) {HI} => P(x:xs) {TI}`    
Donde:    
P(xs): ((elem e (filter p xs)) ⇒ (elem e xs)). {HI}    
P(x:xs): ((elem e (filter p (x:xs))) ⇒ (elem e (x:xs))). {TI}
```
elem e (filter p (x:xs) = {F1}
elem e (if p x then x : filter p xs else filter p xs)
Por extensionalidad de booleanos, tengo dos casos: p x = True o p x = False
{1} p x = True
     elem e (if p x then x : filter p xs else filter p xs) = {True & if}
     elem e (x : filter p xs) = {ELEM}
     e == x || elem e filter p xs
     Por extensionalidad de booleanos y (||) tengo dos casos:
     {2.1} e == x = True
           e == x || elem e filter p xs = {True}
           True ||  elem e filter p xs = {||}
           True ==> Si e pertenece a la lista (x:xs) "filtrada", tambien pertenece a la lista (x:xs) original.
     {2.2} e == x = False
           e == x || elem e filter p xs = {False}
           False || elem e filter p xs = {||}
           elem e filter p xs = {HI}
           ((elem e (filter p xs)) ⇒ (elem e xs))
{2} p x = False
     elem e (if p x then x : filter p xs else filter p xs) = {False & if}
     - elem e (filter p xs) 
     (elem e (x:xs)) = {ELEM}
     - e == x || elem e xs
     Tengo: elem e (filter p xs) ==> e == x || elem e xs
          Si ((elem e (filter p xs)) = False ==> Se cumple la implicacion.
          Si ((elem e (filter p xs)) = True ==> Hay que ver que pasa con e == x || elem e xs
               Si e == x es True, la implicacion es verdadera (por ||)
               Si e == x es False, queda probado por HI que: elem e (filter p xs) ==> elem e xs
          

Llegamos a lo mismo. ∴vale P(x:xs) y se prueba la propiedad.
```
# VI.
```
∀xs::[a]. ∀x::a. ponerAlFinal x xs = xs ++ (x:[])
```
Por induccion estructural sobre xs tenemos dos casos: Base e inductivo  
**Caso Base:** `P([])`
```
ponerAlFinal x [] = {P0}
foldr (:) (x:[]) [] = {F0}
[x]

[] ++ (x:[]) = {:}
[] ++ ([x]) = {++}
[x]

P([]) vale
```
**Caso inductivo:** `∀xs::[a]. ∀ x::a. P(xs) {HI} => P(x:xs) {TI}`  
Donde:  
P(xs): ponerAlFinal x xs = xs ++ (x:[]). {HI}  
P(x:xs): ponerAlFinal x (x:xs) = (x:xs) ++ (x:[]). {TI}
```
ponerAlFinal x (x:xs) = {P0}
foldr (:) (x':[]) (x:xs) = {:}
foldr (:) [x'] (x:xs) = {FR1}
(:) x (foldr (:) [x'] xs) = {:}
x : (foldr (:) [x'] xs)

(x:xs) ++ (x':[]) = {:}
(x:xs) ++ [x'] = {++}
foldr (:) [x'] (x:xs) = {FR1}
(:) x (foldr (:) [x'] xs) = {:}
x : (foldr (:) [x'] xs)

Llegamos a lo mismo de ambos lados del igual. ∴vale P(x:xs) y se prueba la propiedad.
```
# VII.
```
reverse = foldr (\x rec -> rec ++ (x:[])) []
```
Por extensionalidad funcional, basta ver que ∀ys::[a]. P(ys), donde P(ys): reverse ys = foldr (\x rec -> rec ++ (x:[])) [] ys  
Por induccion estructural sobre xs tenemos dos casos: Base e inductivo  
**Caso Base:** `P([])`
```
reverse [] = {R0}
foldl (flip (:)) [] [] = {FL0}
[]

foldr (\x rec -> rec ++ (x:[])) [] [] = {FR0}
[]

P([]) vale
```
????
**Caso inductivo:** `∀xs::[a]. ∀ x::a. P(xs) {HI} => P(x:xs) {TI}`  
Donde:  
P(xs): reverse xs = foldr (\x rec -> rec ++ (x:[])) [] xs. {HI}  
P(x:xs): reverse (x:xs) = foldr (\x rec -> rec ++ (x:[])) [] (x:xs). {TI}
```
reverse (x:xs) = {R0}
foldl (flip (:)) [] (x:xs) = {FL1}
foldl (flip (:)) ((flip (:)) [] x) xs = {FLIP}
foldl (flip (:)) ((:) x []) xs = {:}
foldl (flip (:)) [x] xs = {LEMA1}
reverse xs ++ [x]

foldr (\x rec -> rec ++ (x':[])) [] (x:xs) = {FR1}
(\x' rec -> rec ++ [x']) x (foldr (\y rec -> rec ++ [y]) [] xs) = {B} donde x'=x & rec=(foldr (\y rec -> rec ++ [y]) [] xs)
(foldr (\y rec -> rec ++ [y]) [] xs) ++ [x] = {HI}
reverse xs ++ [x]

Llegamos a lo mismo de ambos lados del igual. ∴vale P(x:xs) y se prueba la propiedad.
```
```
--Lema 1--
P(xs): ∀xs::[a]. ∀y::a. foldl (flip (:)) [y] xs = reverse xs ++ [y]
```
**Caso Base:** `P([])`  
```
foldl (flip (:)) [y] [] = {FL0}
[y]

reverse [] ++ [y] = {R0}
foldl (flip (:)) [] [] ++ [y] = {FL0}
[] ++ [y] = {++}
[y]

P([]) vale
```
**Caso inductivo:** `∀xs::[a]. ∀ x::a. P(xs) {HI} => P(x:xs) {TI}`  
Donde:  
P(xs): foldl (flip (:)) [y] xs = reverse xs ++ [y] {HI}  
P(x:xs): foldl (flip (:)) [y] (x:xs) = reverse (x:xs) ++ [y] {TI}  
```
foldl (flip (:)) [y] (x:xs) = {FL1}
foldl (flip (:)) ((flip (:)) [y] x) xs = {FLIP}
foldl (flip (:)) ((:) x [y]) xs = {:}
foldl (flip (:)) ([x:y]) xs = {HI}
reverse xs ++ [x:y]

reverse (x:xs) ++ [y] = {R0}
foldl (flip (:)) [] (x:xs) ++ [y] = {FL1}
foldl (flip (:)) ((flip (:)) [] x) xs ++ [y]  = {FLIP ; :}
foldl (flip (:)) [x] xs ++ [y] = {HI}
reverse xs ++ [x] ++ [y] = {++}
reverse xs ++ [x:y]

Llegamos a lo mismo de ambos lados del igual. ∴vale el LEMA 1
```
