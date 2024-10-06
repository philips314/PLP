# Primer parcial 2024 -> Primer cuatrimestre.  
## Ejercicio 1.  
El siguiente tipo de datos sirve para representar árboles ternarios:  
data AT a = NilT | Tri a (AT a) (AT a) (AT a)  
Definimos el siguiente árbol para los ejemplos:  
at1 = Tri | (Tri 2 NilT NilT NilT) (Tri 3 (Tri 4 NilT NilT NilT) NilT NilT) (Tri 5 NilT NilT Nilt)  

### a. Dar el tipo y definir la funcion foldAT que implementa el esquema de recursion estructural para el tipo AT a (se permite el uso de recursión explicita).  
```
foldAT :: b -> (a -> b -> b -> b -> b) -> AT a -> b
foldAT cNil cTri t = case t of
                   NilT -> cNil
                   Tri x izq mid der -> cTri x (rec izq) (rec mid) (rec der)
                              where rec = foldAT cNil cTri
```
Donde:  
```
cNil: Valor que retorna cuando el arbol es NilT.
cTri: Funcion que toma el valor de un nodo y los resultados de los 3 hijos, y devuelve un valor de tipo b.
```
### b. Definir la funcion preorder :: AT a -> [a].  
Esta funcion lista los nodos de un arbol AT en el orden que aparecen: Primero la raiz, luego los nodos del subarbol izq, despues los del medio y finalmente los del derecho.  
```
preorder :: AT a -> [a]
preorder = foldAT [] (\x rizq rmid rder -> x : rizq ++ rmid ++ rder)
```
### c. Definir la funcion mapAT :: (a -> b) -> AT a -> AT b.  
Análoga a la funcion map para listas, pero para árboles AT.  
```
mapAT :: (a -> b) -> AT a -> AT b
mapAT f = foldAT (NilT) (\x rizq rmid rder -> Tri (f x) rizq rmid rder)
```
### d. Definir la funcion nivel :: AT a -> Int -> [a].  
Devuelve la lista de nodos del nivel correspondiente del árbol, siendo 0 el nivel de la raíz.  
```
nivel :: AT a -> Int -> [a]
nivel = foldAT (const []) (\x rizq rmid rder -> \n -> if n == 0 then [x] else ((rizq (n-1)) ++ (rmid (n-1)) ++ (rder (n-1)) )) 
```
## Ejercicio 2.  
Demostracion de propiedades.  
Considerar las siguientes definiciones sobre listas y árboles estrictamente binarios.  
```
data AEB a = Hoja a | Bin (AED a) a (AED a)
{C} const = (\x -> \y -> x)
{H} head (x:xs) = x
{T} tail (x:xs) = xs
{L0} length [] = 0
{L1} length (x:xs) = 1 + length xs
{N0} null [] = True
{N1} null (x:xs) = False
{A0} altura (Hoja x) = 1
{A1} altura (Bin i r d) = 1 + max (altura i) (altura d)
{E0} esPreRama (Hoja x) = \xs -> null xs || (xs == [x])
{E1} esPreRama (Bin i r d) = \xs -> null xs ||
                    (r == head xs && (esPrerama i (tail xs) || esPreRama d (tail xs)))
```
### a. Asumiendo Eq a, demostrar:  
`∀t::AEB a. ∀xs::[a]. esPreRama t xs ⇒ legth xs ≤ altura t`
Para demostrar esta proposicion, hago induccion estructural sobre el AEB. Tiene dos constructores: Hoja y Bin.  
Defino P(x): esPreRama x xs ⇒ length xs ≤ altura x.  
Caso base: `P(Hoja h)`  
```
esPreRama (Hoja h) xs ⇒ legth xs ≤ altura (Hoja h) = {E0 ; A0}
(\xs -> null xs || (xs == [h])) xs ⇒ legth xs ≤ 1 = {B}
null xs || (xs == [h]) ⇒ legth xs ≤ 1

Luego de ver los casos por extensionalidad, conluyo que P(Hoja h) vale.
```
Por extensionalidad de boolenaos: (null xs) y (xs == [h]) pueden ser True o False. Tengo 4 casos:  
Caso 1: `null xs = True` y `xs == [h] = True`  
```
No tiene sentido probar esto pues si xs == [], entonces no puede pasar que xs == [h].
```
Caso 2: `null xs = False` y `xs == [h] = False`  
```
null xs || (xs == [h]) ⇒ legth xs ≤ 1 = {CASO 2}
False || False ⇒ legth xs ≤ 1 = {||}
False ⇒ legth xs ≤ 1 = {⇒}
True
```
Caso 3: `null xs = True` y `xs == [h] = False`  
```
null xs || (xs == [h]) ⇒ legth xs ≤ 1 = {CASO 3}
True || False ⇒ legth xs ≤ 1 = {||}
True ⇒ legth xs ≤ 1 {null xs = True; L0}
True ⇒ 0 ≤ 1 {≤}
True ⇒ True = {⇒}
True
```
Caso 4: `null xs = False` y `xs == [h] = True`  
```
null xs || (xs == [h]) ⇒ legth xs ≤ 1 = {CASO 4}
False || True ⇒ legth xs ≤ 1 = {||}
True ⇒ legth xs ≤ 1 {null xs = True; L0}
True ⇒ 0 ≤ 1 {≤}
True ⇒ True = {⇒}
True
```  
Paso inductivo: P(Bin i r d).  
Asumo que: `∀i,d::AEB a. P(i) ∧ P(d)` vale {HI}.  
Qvq: `(∀i,d::AEB a. P(i) ∧ P(d)) ⇒ (∀r::a. P(Bin i r d))`, es decir que P(Bin i r d) es mi TI.  
```
esPreRama (Bin i r d) xs = {E1}
\xs -> null xs || (r == head xs && (esPrerama i (tail xs) || esPreRama d (tail xs))) xs = {B}
null xs || (r == head xs && (esPrerama i (tail xs) || esPreRama d (tail xs)))

length xs ≤ altura (Bin i r d) = {A1}
length xs ≤ 1 + max (altura i) (altura d)

Me queda:
null xs || (r == head xs && (esPrerama i (tail xs) || esPreRama d (tail xs))) ⇒ length xs ≤ 1 + max (altura i) (altura d)
```
Voy a usar extensionalidad sobre listas:  
Caso base: xs = [].  
```
null [] || (r == head [] && (esPrerama i (tail []) || esPreRama d (tail []))) ⇒ length [] ≤ 1 + max (altura i) (altura d) = {N0 ; ||}
True ⇒ length [] ≤ 1 + max (altura i) (altura d) = {L0}
True ⇒ 0 ≤ 1 + max (altura i) (altura d)

Como ∀t::AED a. altura t ≥ 0, entonces me queda:
True ⇒ 0 ≤ 1 + 0 = {≤}
True ⇒ True = {⇒}
True

El caso base vale!
```
Caso xs = (y:ys).  
```
null (y:ys) || (r == head (y:ys) && (esPrerama i (tail (y:ys)) || esPreRama d (tail (y:ys)))) ⇒ length (y:ys) ≤ 1 + max (altura i) (altura d) = {N1, H, T, L1}
False || (r == y && (esPrerama i ys) || esPreRama d ys)) ⇒ 1 + length ys ≤ 1 + max (altura i) (altura d) = {||}
r == y && ((esPrerama i ys) || esPreRama d ys) ⇒ 1 + length ys ≤ 1 + max (altura i) (altura d)
```
Por extensionalidad de booleanos r == y puede ser True o False.  
Caso 1: `r == y = False`  
```
(r == y) && ((esPrerama i ys) || (esPreRama d ys)) ⇒ 1 + length ys ≤ 1 + max (altura i) (altura d) = {CASO 1}
False && ((esPrerama i ys) || (esPreRama d ys)) ⇒ 1 + length ys ≤ 1 + max (altura i) (altura d)
False ⇒ 1 + length ys ≤ 1 + max (altura i) (altura d) = {⇒}
True
```
Caso 2: `r == y = True`  
```
(esPrerama i ys) || (esPreRama d ys) ⇒ 1 + length ys ≤ 1 + max (altura i) (altura d) 

Por HI tengo que esPreRama t xs ⇒ legth xs ≤ altura t. Por lo tanto...
True
```
