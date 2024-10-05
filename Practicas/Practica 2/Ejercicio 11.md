# Practica 2 / Ejercicio 11.  
Considerar las siguientes funciones:  
```
     inorder :: AB a -> [a]
{I0} inorder = foldAB [] (\ri x rd -> ri ++ (x:rd))
     elemAB :: Eq a => a -> AB a -> Bool
{A0} elemAB e = foldAB False (\ri x rd -> (e == x) || ri || rd)
     elem :: Eq a => [a] -> Bool
{E0} elem e = foldr (\x rec -> (e == x) || rec) False
     (++) :: [a] -> [a] -> [a]
{++} xs ++ ys = foldr (:) ys xs

       foldAB :: b -> (a -> b -> b -> b) -> AB a -> b
{FAB0} foldAB Nil = cNil
{FAB1} foldAB Bin izq v der =  cBin v (rec izq) (rec der)
          where rec = foldAB cNil cBin

	foldr :: (a -> b -> b) -> b -> [a] -> b
{F0} foldr f z [] = z
{F1} foldr f z (x:xs) = f x (foldr f z xs)
```
Demostrar la siguiente propiedad: `Eq a => ∀ e::a . elemAB e = elem e . inorder`  
Por extensionalidad funcional, basta con probar que: `Eq a => ∀e::a. ∀t::AB a. elemAB e t = elem e . inorder t`  
Por induccion sobre el arbol t, defino:  
`P(t): Eq a => ∀e::a. ∀t::AB a. elemAB e t = elem e . inorder t`  
Busco probar que: `P(Nil) ∧ (P(izq) ∧ P(der)) => P(Bin izq r der)`  
Caso base: `P(Nil)`  
```
elemAB e Nil = {A0}
foldAB False (\ri x rd -> (e==x) || ri || rd) Nil = {FAB0}
False

elem e . inorder Nil = {.}
elem e (inorder Nil) = {I0}
elem e (foldAB [] (\ri x rd -> ri ++ (x:rd)) Nil) {FAB0}
elem e [] = {ELEM}
False

P(Nil) vale
```
Caso inductivo: `P(izq) ∧ P(der) {HI}=> P(Bin izq r der) {TI}`  
```
elemAB e (Bin izq r der) = {A0}
foldAB False (\ri x rd -> (e == x) || ri || rd) (Bin izq r der) = {FAB1}, donde g = (\ri x rd -> (e == x) || ri || rd)
g r (foldAB False g izq) (foldAB False g der) = {A0}
g r (elemAB e izq) (elemAB e der) = {HI}
g r (elem e . inorder izq) (elem e . inorder der) = {.}
g r (elem e (inorder izq)) (elem e (inorder der)) = {g}
r == e || (elem e (inorder izq)) || (elem e (inorder der))

elem e . inorder (Bin izq r der) = {.}
elem e (inorder (Bin izq r der)) = {I0}, donde j = (\ri x rd -> ri ++ (x:rd))
elem e (foldAB [] j (Bin izq r der)) = {FAB1}
elem e (j r (foldAB [] j izq) (foldAB [] j der)) = {I0}
elem e (j r (inorder izq) (inorder der)) = {h}
elem e ( (inorder izq) ++ (e : (inorder der)) ) = {LEMA1}
r == e || elem e (inorder izq) || elem e (inorder der)

Se pudo llegar a lo mismo de los dos lados del igual, por lo que vale lo que queria probar.
```
**Lema 1:**  
`Eq a => ∀e::a. ∀xizq, yder::[a]. elem e (xizq ++ (e : yder)) = r == e || (elem e xizq) || (elem e yder)`  
Hago induccion sobre listas xizq, con la proposicion:  
**P(zs)**: `∀xs,ys::[a]. ∀e,r::a. elem e (zs ++ (r:ys)) = r == e || elem e zs || elem e ys`  
Por induccion estructural, busco demostrar que: P([]) ∧ P(xs) {HI} ⇒ P(x:xs) {TI}  
Caso base: `P([])`  
```
elem e ([] ++ (r:ys)) = {++}
elem e (foldr (:) (r:ys) []) = {F0}
elem e (r:ys) = {ELEM}
e == r || elem e ys

r == e || (elem e []) || (elem e ys) = {ELEM}
r == e || False || elem e ys = {||}
r == e || elem e ys

P([]) vale
```
Caso inductivo, donde:
```
p(xs): elem e (xs ++ (r:ys)) = e == r || elem e xs || elem e ys {HI}
P(x:xs) elem e ((x:xs) ++ (r:ys)) = e == r || elem e (x:xs) || elem e ys {TI}
```
Desarrolo...  
```
elem e ((x:xs) ++ (r:ys)) = {++}
elem e (foldr (:) (r:ys) (x:xs)) = {F1}
elem e ((:) x (foldr (:) (r:ys) xs)) = {:}
elem e (x : (foldr (:) (r:ys) xs) ) = {ELEM}
e == x || elem e (foldr (:) (r:ys) xs) = {++}
e == x || elem e (xs ++ (r:ys)) = {HI}
e == x || e == r || elem e xs || elem e ys

e == r || elem e (x:xs) || elem e ys = {ELEM}
e == r || e == x || elem e xs || elem e ys

Pude llegar a lo mismo de los dos lados del igual, por lo tanto, el lema vale.
```

