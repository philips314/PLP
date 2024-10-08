# Programacion funcional.  
## I.  
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

# Demostración e inferencia.  
## I.  
Demostrar usando deduccion natural, sin utilizar principios clásicos:  
((P ⇒ Q) ∧ (Q ⇒ R)) ⇒ ¬R ⇒ ¬P  
```

                                        ------------------------------- ax
                                        ((P ⇒ Q) ∧ (Q ⇒ R)), ¬R, P ⊢ P                                   
                                        ----------------------------------- Vi2    -----------------------------------ax     ------------------------------------- ABAJO
                                        ((P ⇒ Q) ∧ (Q ⇒ R)), ¬R, P ⊢ R V P        ((P ⇒ Q) ∧ (Q ⇒ R)), ¬R, P, R ⊢ R       ((P ⇒ Q) ∧ (Q ⇒ R)), ¬R, P, P ⊢ R
--------------------------------ax      ------------------------------------------------------------------------------------------------------------------------- Ve
((P ⇒ Q) ∧ (Q ⇒ R)), ¬R, P ⊢ ¬R       ((P ⇒ Q) ∧ (Q ⇒ R)), ¬R, P ⊢ R
----------------------------------------------------------------------- ¬e
((P ⇒ Q) ∧ (Q ⇒ R)), ¬R, P ⊢ ⊥ 
---------------------------------------- ¬i
((P ⇒ Q) ∧ (Q ⇒ R)), ¬R ⊢ ¬P 
--------------------------------------------------------⇒i
((P ⇒ Q) ∧ (Q ⇒ R)) ⊢ ¬R ⇒ ¬P 
--------------------------------------------------------⇒i
∅ ⊢ ((P ⇒ Q) ∧ (Q ⇒ R)) ⇒ ¬R ⇒ ¬P 
```
```
                                                                        -------------------------------------------------------ax 
                                                                         ((P ⇒ Q) ∧ (Q ⇒ R)), ¬R, P, P ⊢ (P ⇒ Q) ∧ (Q ⇒ R)
---------------------------------------------------ax                   ------------------------------------------------------ ∧e1       ------------------------------------ ax
((P ⇒ Q) ∧ (Q ⇒ R)), ¬R, P, P ⊢ (P ⇒ Q) ∧ (Q ⇒ R)                      ((P ⇒ Q) ∧ (Q ⇒ R)), ¬R, P, P ⊢ P ⇒ Q                         ((P ⇒ Q) ∧ (Q ⇒ R)), ¬R, P, P ⊢ P
---------------------------------------------------- ∧e2                 ------------------------------------------------------------------------------------------------------ ⇒e
((P ⇒ Q) ∧ (Q ⇒ R)), ¬R, P, P ⊢ Q ⇒ R                                   ((P ⇒ Q) ∧ (Q ⇒ R)), ¬R, P, P ⊢ Q
------------------------------------------------------------------------------------------------------------------------- ⇒e
((P ⇒ Q) ∧ (Q ⇒ R)), ¬R, P, P ⊢ R
```
## II.  
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
## III.  
Demostracion de propiedades.  
Considerar las siguientes definiciones sobre árboles con informacion en las hojas.  
```
data AIH a = Hoja a | Bin (AIH a) (AIH a)

{E0} esHoja (Hoja x) = True
{E1} esHoja (Bin i d) = False

{I} izq (Bin i d) = i

{D} der (Bin i d) = d

{M0} mismaEstructura (Hoja x) = esHoja
{M1} mismaEstructura (Bin i d) = \t -> not (esHoja t) && mismaEstructura i (izq t) && mismaEstructura d (der t)
```
### a. Demostrar:  
`∀t::AIH a. ∀u:: AIH a. mismaEstuctura t u = mismaEstuctura u t`  
Hago induccion sobre t, defino:  
P(t): `∀u:: AIH a. mismaEstuctura t u = mismaEstuctura u t`  
Quiero ver que si se cumple: `∀n::a. P(Hoja n) ∧ (∀i::AIH a. ∀d:: AIH a. P(i) ∧ P(d))` -> `P(Bin i d)`  
entonces `∀t::AIH a. P(t)`  
Caso base: `P(Hoja n)`  
```
mismaEstuctura (Hoja n) u = mismaEstuctura u (Hoja n) {M0}
esHoja u = mismaEstructura u (Hoja n)
...
Por lo visto debajo, P(Hoja n) vale
```
Por extensionalidad sobre u, hay dos casos:
Caso 1: `u = Hoja m`  
```
esHoja u = mismaEstructura u (Hoja n) {Caso 1}
True = mismaEstructura (Hoja u) (Hoja n) {M0}
True = esHoja (Hoja n) {E0}
True = True
```
Caso 2: `u = Bin izq der`  
```
esHoja u = mismaEstructura u (Hoja n) {Caso 2}
esHoja (Bin izq der) = mismaEstructura (Bin izquierda derecha) (Hoja n) {E1}
False = mismaEstructura (Bin izquierda derecha) (Hoja n) {M1}
False = (\t -> not (esHoja t) && mismaEstructura izquierda (izq t) && mismaEstructura derecha (der t)) (Hoja n) {B}
False =  (not (esHoja (Hoja n)) && mismaEstructura izquierda (izq (Hoja n)) && mismaEstructura derecha (der (Hoja n))) {E0 ; not ; &&}
False = False
```
Caso inductivo:  
Asumo que P(izq) ∧ P(der): `∀u::AIH a. (mismaEstructura izq u = mismaEstructura u izq)  ∧ (mismaEstructura der u = mismaEstructura u der)`  
Sigo con P(Bin izq der):  
```
mismaEstructura (Bin izquierda derecha) u = mismaEstructura u (Bin izquierda derecha) {M1}
(\t -> not (esHoja t) && mismaEstructura izquierda (izq t) && mismaEstructura derecha (der t)) u = mismaEstructura u (Bin izquierda derecha)
```
Por extensionalidad sobre u, hay dos casos:  
Caso 1: `u = Hoja m`  
```
(\t -> not (esHoja t) && mismaEstructura izquierda (izq t) && mismaEstructura derecha (der t)) u = mismaEstructura u (Bin izquierda derecha) {Caso1}
(\t -> not (esHoja t) && mismaEstructura izquierda (izq t) && mismaEstructura derecha (der t)) (Hoja m) = mismaEstructura (Hoja m) (Bin izquierda derecha) {B}
not (esHoja (Hoja m)) && mismaEstructura izquierda (izq (Hoja m)) && mismaEstructura derecha (der (Hoja m)) = mismaEstructura (Hoja m) (Bin izquierda derecha) {E0 ; not ; &&}
False = mismaEstructura (Hoja m) (Bin izquierda derecha) {M0}
False = esHoja (Bin izquierda derecha) {E1}
False = False
```
Caso 2: `u = Bin izq der`  
```
(\t -> not (esHoja t) && mismaEstructura izquierda (izq t) && mismaEstructura derecha (der t)) u  = mismaEstructura u (Bin izquierda derecha) {Caso2}
(\t -> not (esHoja t) && mismaEstructura izquierda (izq t) && mismaEstructura derecha (der t)) (Bin izquierda derecha) = mismaEstructura (Bin izq der) (Bin izquierda derecha) {B}
not (esHoja (Bin izquierda derecha)) && mismaEstructura izquierda (izq (Bin izquierda derecha)) && mismaEstructura derecha (der (Bin izquierda derecha)) = mismaEstructura (Bin izq der) (Bin izquierda derecha) {E1 ; not ; &&}
mismaEstructura izquierda (izq (Bin izquierda derecha)) && mismaEstructura derecha (der (Bin izquierda derecha)) = mismaEstructura (Bin izq der) (Bin izquierda derecha) {I ; D}

Sea (Bin izquierda derecha), izquierda = left y (Bin izquierda derecha), derecha = right

mismaEstructura izquierda left && mismaEstructura derecha right = mismaEstructura (Bin left right) (Bin izquierda derecha)

mismaEstructura (Bin left right) (Bin izquierda derecha): {M1 ; B}
(not (esHoja (Bin izquierda derecha)) && mismaEstructura i (izq (Bin izquierda derecha)) && mismaEstructura d (der (Bin izquierda derecha))) {E1 ; not ; &&}
mismaEstructura left (izq (Bin izquierda derecha)) && mismaEstructura right (der (Bin izquierda derecha)) {izq ; der}
mismaEstructura left izquierda && mismaEstructura right derecha

Hacemos algo similar del otro lado, y me queda...
mismaEstructura left izquierda && mismaEstructura right derecha = mismaEstructura izquierda left && mismaEstructura derecha right.
Esto vale por HI. Por lo tanto, la propiedad vale.
```  
# Calculo Lambda Tipado.    
## I.
Se desea modelar Diccionarios, para eso se extienden los tipos y expresiones de la siguiente manera:  
τ ::= . . . | Dicc(τ,τ)  
M ::= . . . | $Vacio_{σ,τ}$ | definir(M,M,M) | def?(M,M) | obtener(M,M)  
* Dicc(σ,τ) es el tipo de los diccionarios con claves de tipo σ y valores de tipo τ.  
* $Vacio_{σ,τ}$ es un diccionario vacio con claves σ y valores τ.
* definir(M,N,O) define el valor O en la clave N para el diccionario M.
* def?(M,N) indica si la clave N fue definida para el diccionario M.
* obtener(M,M) da el valor asociado a la clave N en el diccionario M.
### a. Introducir las reglas de tipado para la extensión propuesta.  
```
-------------------------- axVacio
Γ ⊢ Vacio_{σ,τ}: Dicc(σ,τ)

Γ ⊢ M: Dicc(σ,τ)    Γ ⊢ N:σ     Γ ⊢ O:τ
------------------------------------------ definir
Γ ⊢ definir(M,N,O): Dicc(σ,τ)

Γ ⊢ M: Dicc(σ,τ)    Γ ⊢ N:σ
-------------------------------- def?
Γ ⊢ def?(M,N): Bool

Γ ⊢ M: Dicc(σ,τ)    Γ ⊢ N:σ
-------------------------------- obtener
Γ ⊢ obtener(M,N): τ
```
### b. Definir el conjunto de valores y las nuevas reglas de semántica operacional a pequeños pasos. No es necesario escribir la reglas de congruencia, sino que basta con indicar cuantas son.   
```
V ::= ... | Vacio_{σ,τ} | definir(V,V,V)
Reglas de semantica:
def?(Vacio_{σ,τ},V) -> False {DEFv}
def?(definir(V,U,W),U') -> if U == U' then True else def?(V,U') [DEFd]
obtener(Vacio_{σ,τ}, U) -> obtener(Vacio_{σ,τ}, U) //Se cuelga {OBTv}
obtener(definir(V,U,W),U') -> if U == U' then W else obtener(V,U') {OBTd}
```
### c. Mostrar paso por paso como reduce la expresión:  
(suponer que zero == zero -> True)  
(λd:Dicc(Nat,Bool). if def?(d,0) then obtener(d,0) else False) definir($Vacio_{Nat,Bool}$,0,True). 
```
(λd:Dicc(Nat,Bool). if def?(d,0) then obtener(d,0) else False) definir(Vacio_{Nat,Bool},0,True)
{B}
(if def?(d,0) then obtener(d,0) else False){d := definir(Vacio_{Nat,Bool},0,True)}
{sustitucion}
if def?(definir(Vacio_{Nat,Bool},0,True),0) then obtener(definir(Vacio_{Nat,Bool},0,True),0) else False
{definir}
if (if 0 == 0 then True else def?(Vacio_{Nat,Bool}, 0)) then obtener(definir(Vacio_{Nat,Bool},0,True),0) else False
{== ; if}
if True then obtener(if 0 == 0 then True else obtener(definir(Vacio_{Nat,Bool},0,True),0) else False
{if}
obtener(definir(Vacio_{Nat,Bool},0,True),0)
{OBTd}
if 0 == 0 then True else obtener(Vacio_{Nat,Bool}, 0)
{== ; if}
True
```  
## II.  
Se desea modelar Árboles con informacion, para eso se extienden los tipos y expresiones de la siguiente manera:  
τ ::= . . . | AIH(τ)  
M ::= . . . | Hoja(M) | Bin(M,M) | case M of Hoja x ->> M; Bin(i,d) ->> M
* AIH(τ) es el tipo de los arboles con informacion en las hojas de tipo τ.  
* Hoja(M) es un arbol compuesto por una unica hoja con informacion M.
* Bin(M1,M2) es una arbol compuesto por dos subarboles M1 y M2.  
* El obs case M of Hoja x ->> M1; Bin(i,d) ->> M2 permite acceder al valor de un árbol que es hoja
  (el cual se ligará a la variable x que puede aparecer libre en M2), y a los dos subárboles de un arbol que no es hoja (los cuales se ligarán a las variables i y d que pueden aparecer libres en M3)
### a. Introducir las reglas de tipado para la extensión propuesta.  
```
Γ ⊢ M: τ
---------------------- t-Hoja
Γ ⊢ Hoja(M): AIH(τ)

Γ ⊢ M1: AIH(τ)      Γ ⊢ M2: AIH(τ)
------------------------------------ t-Bin
Γ ⊢ Bin(M1,M2): AIH(τ)

Γ ⊢ M: AIH(τ)         Γ ⊢ M1: AIH(τ)      Γ ⊢ i, d, M2: AIH(τ)
----------------------------------------------------------------- t-Bin
Γ ⊢ case M of Hoja x ->> M1; Bin(i,d) ->> M2
```
### b. Definir el conjunto de valores y las nuevas reglas de semántica operacional a pequeños pasos (congruencia y computo).   
```
V := ... | Hoja(V) | Bin(V,V)
Reglas de computo.
case Hoja(V) of Hoja x ->> M1; Bin(i,d) ->> M2 => M1{x := V} {Case1}
case Bin(V1,V2) of Hoja x ->> M1; Bin(i,d) ->> M2 => M2{i := V1}{d := V2} {Case2}
Reglas de congruencia.
      M -> M'
--------------------- cg-H
Hoja(M) -> Hoja(M')

      M1 -> M1'
-------------------------- cg-B1
Bin(M1,M2) -> Bin(M1',M2)

      M2 -> M2'
-------------------------- cg-B2
Bin(V1,M2) -> Bin(V1,M2')
                                       M -> M'
----------------------------------------------------------------------------------------- cg-C
case M of Hoja x ->> M1; Bin(i,d) ->> M2 -> case M' of Hoja x ->> M1; Bin(i,d) ->> M2
```
### c. Mostrar paso por paso como reduce la expresión:  
case (λn: Nat. Hoja(n)) Succ(zero) of Hoja x ->> Succ(Pred(x)); Bin(i,d) ->> zero
```
case ((λn: Nat. Hoja(n)) Succ(zero)) of Hoja x ->> Succ(Pred(x)); Bin(i,d) ->> zero -> {cg-C}

(λn: Nat. Hoja(n)) Succ(zero) -> {B}
Hoja(Succ(Zero))

case Hoja(Succ(Zero)) of Hoja x ->> Succ(Pred(x)); Bin(i,d) ->> zero -> {Case1}
Succ(Pred(x)){x := Succ(Zero)}
Succ(Pred(Succ(Zero))) -> {succ ; pred}
Succ(Zero)
```
### d. Definir como macro:  
La funcion $esHoja_{τ}$, que toma un AIH(τ) y devuelve un booleano que indica si es una hoja.  
```
asd
```
