# Programacion funcional.  

# Demostración e inferencia.  
## I. Demostrar usando deduccion natural, sin utilizar principios clásicos:  
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
