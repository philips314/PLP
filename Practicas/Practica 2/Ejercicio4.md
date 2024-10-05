# Practica 2 / Ejercicio 4 
Demostrar las siguientes propiedades utilizando inducción estructural sobre listas y el principio de extensionalidad:
## I.
###reverse . reverse = id. 
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
P(xs): (reverse . reverse) xs = id xs. {HI}
P(x:xs): (reverse . reverse) (x:xs) = id (x:xs). {TI}

```
(reverse . reverse) (x:xs) = {.}
reverse (reverse (x:xs)) = {REVERSE}
reverse (foldl (flip (:)) [] (x:xs)) = {F1}
reverse (foldl (flip (:)) ((flip (:)) [] x) xs) = {FLIP y (:)}
reverse (foldl (flip (:)) [x]) xs) ????
```

## II.  
### append = (++).  
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
P(xs): append xs ys = (++) xs ys. {HI}
P(x:xs): append (x:xs) ys = (++) (x:xs) ys. {TI}
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

## III.  
### map id = id.
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
P(xs): map id xs = id xs. {HI}
P(x:xs): map id (x:xs) = id (x:xs). {TI}
```
map id (x:xs) = {M1}
id x : map id xs = {ID}
x : map id xs = {HI}
x : id xs = {ID}
x : xs = {ID}
id (x:xs)

Llegamos a lo mismo. ∴vale P(x:xs) y se prueba la propiedad.
```

## IV.  
### ∀f::a->b. ∀g::b->c. map (g . f) = map g . map f
```
{.}: f . g x = f (g x)
{M0}: map _ [] = []
{M1}: map f (x:xs) = f x : map f xs
```
Por extencionalidad funcional e induccion estructural, basta ver que:  
```
∀xs::[a]. P(xs), donde P(xs): ∀f::a->b. ∀g::b->c. map (g . f) xs = map g . map f xs
``` 
**Caso Base:** `P([])`
```
map (g . f) [] = {M0}
[]

map g . map f [] = {.}
map g (map f []) = {M0}
map g [] = {M0}
[]

P([]) vale
```
**Caso Inductivo:** `∀xs::[a]. ∀x::a. P(xs) {HI} => P(x:xs) {TI}`  
Asumo que P(xs) vale y quiero probar que P(x:xs) vale.  
Donde:   
P(xs): map (g . f) xs = map g . map f xs. {HI} 
P(x:xs): map (g . f) (x:xs) = map g . map f (x:xs). {TI}
```
map (g . f) (x:xs) = {M1}
(g.f) x : map (g.f) xs = {HI}
(g.f) x : (map g . map f xs) = {.}
(g.f) x : map g (map f xs) = {.}
g (f x) : map g (map f xs)

map g . map f (x:xs) = {.}
map g (map f x:xs) = {M1}
map g (f x : map f xs) = {M1}
g (f x) : map g (map f xs) = {.}

Llegamos a lo mismo de ambos lados del igual. ∴vale P(x:xs) y se prueba la propiedad.
```


## V.  
### ∀f::a->b. ∀p::b->Bool. map f . filter (p . f) = filter p . map f.
```
{(.)}: (.) f g x = f (g x)
{M0}:  map _ []     = []
{M1}:  map f (x:xs) = f x : map f xs
{F0}:  filter _ []    = []
{F1}:  filter p (x:xs) = if p x then x : filter p xs else filter p xs
```
Por extencionalidad funcional e induccion sobre listas xs, basta ver que:  
```
∀xs::[a]. P(xs), donde P(xs): ∀f::a->b. ∀p::b->Bool. map f . filter (p . f) xs = filter p . map f xs.
```
**Caso Base:** `P([])`
```
map f . filter (p . f) [] = {.}
map f (filter (p.f) [] ) = {F0}
map f [] = {M0}
[]

filter p . map f [] = {.}
filter p (map f []) = {M0}
filter p [] = {F0}
[]

P([]) vale
```
**Caso Inductivo:** `∀xs::[a]. ∀x::a. P(xs) {HI} => P(x:xs) {TI}`  
Asumo que P(xs) vale y quiero probar que P(x:xs) vale.  
Donde:   
P(xs): map f . filter (p . f) xs = filter p . map f xs. {HI}
P(x:xs): map f . filter (p . f) (x:xs) = filter p . map f (x:xs). {TI}
```
map f . filter (p . f) (x:xs) = {.}
map f (filter (p.f) x:xs ) = {F1}
map f (if (p.f) x then x : filter (p.f) xs else filter (p.f) xs) = {.}
map f (if p (f x) then x : filter (p.f) xs else filter (p.f) xs)

filter p . map f (x:xs) = {.}
filter p (map f x:xs) = {M1}
filter p (f x : map f xs) = {F1}
if p (f x) then (f x) : filter p (map f xs) else filter p (map f xs) = {.}
if p (f x) then (f x) : (filter p . map f xs) else (filter p . map f) xs

Por extensionalidad de booleanos hay 2 casos:

  (p.f) x = True

    map f (if (p.f) x then x : filter (p.f) xs else filter (p.f) xs) = {(p.f) x = True}
    map f (x : filter (p.f) xs) = {M1}
    f x : map f (filter (p.f) xs) = {.}
    f x : map f . filter (p . f) xs 

    if p (f x) then (f x) : (filter p . map f xs) else (filter p . map f) xs = { p (f x) = True}
    f x : (filter p . map f xs) = {HI}
    f x : map f . filter (p . f) xs

  (p.f) x = False

    map f (if (p.f) x then x : filter (p.f) xs else filter (p.f) xs) = {(p.f) x = False}
    map f (filter (p.f) xs) = {.}

    if p (f x) then (f x) : (filter p . map f xs) else (filter p . map f) xs = {(p.f) x = False}
    (filter p . map f) xs = {HI}
    map f . filter (p . f) xs = {.}
    map f (filter (p.f) xs)


Llegamos a lo mismo de ambos lados del igual. ∴vale P(x:xs) y se prueba la propiedad.
```
## VI. ???
### ∀f::a->b. ∀e::a. ∀xs::[a]. ((elem e xs) ⇒ (elem (f e) (map f xs)))  (asumiendo Eq a y Eq b)
```
{E0}: elem e [] = False
{E1}: elem e (x:xs) = e == x || elem e xs
{M0}: map _ [] = []
{M1}: map f (x:xs) = f x : map f xs
```
Por extencionalidad funcional e induccion estructural sobre listas xs, basta ver que:  
```
∀xs::[a]. P(xs), donde P(xs): ∀f::a->b. ∀e::a. ((elem e xs) ⇒ (elem (f e) (map f xs)))
``` 
**Caso Base:** `P([])`
```
((elem e []) = {E0}
False, y con esto sabemos que vale la implicacion 
P([]) vale
```
**Caso Inductivo:** `∀xs::[a]. ∀x::a. P(xs) {HI} => P(x:xs) {TI}`  
Asumo que P(xs) vale y quiero probar que P(x:xs) vale.  
Donde:   
P(xs): ((elem e xs) ⇒ (elem (f e) (map f xs))). {HI}  
P(x:xs): ((elem e (x:xs)) ⇒ (elem (f e) (map f (x:xs)))). {TI}
```
elem e (x:xs) {E1}
e == x || elem e xs
Por extencionalidad de Booleanos, hay cuatro casos:
e == x = True ∧ elem e xs = True
  e == x || elem e xs = {True}
  True || True = {||}
  True
e == x = False ∧ elem e xs = True
  e == x || elem e xs = {False ∧ True}
  False || True = {||}
  True 
e == x = True ∧ elem e xs = False
  e == x || elem e xs = {True ∧ False}
  True || False = {||}
  True
e == x = False ∧ elem e xs = False
  e == x || elem e xs = {False ∧ False}
  False || False = {||}
  False

?????
```
