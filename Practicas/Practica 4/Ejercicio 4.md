# Practica 4 / Ejercicio 4  
Para los siguientes términos:  
I. Insertar todos los paréntesis de acuerdo a la convención usual.  
II. Dibujar el árbol sintáctico de cada una de las expresiones.  
III. Indicar en el árbol cuáles ocurrencias de variables aparecen ligadas y cuáles libres  
IV. En cuál o cuáles de los términos anteriores ocurre la siguiente expresión como subtérmino?: 
(λx: Bool → Nat → Bool. λy : Bool → Nat. λz : Bool. x z (y z)) u  
OBS: Las variables con ' son las libres.  

## a. u x (y z) (λv : Bool. v y)  = ((u x) (y z)) (λv : Bool. v y) 
```
u x (y z) (λv : Bool. v y) =
(u x) (y z) (λv : Bool. v y) =
((u' x') (y' z')) (λv : Bool. v y') 

((u x) (y z)) (λv : Bool. v y)   = {app}
(u x) (y z) | (λv : Bool. v y)   = {app;abs}
u x | y z | v y                  = {app;app;app}
u | x | y | z | v | y
```
## b. (λx: Bool → Nat → Bool. λy : Bool → Nat. λz : Bool. x z (y z)) u v w = 
(((λx: Bool → Nat → Bool. λy : Bool → Nat. λz : Bool. (x z) (y z)) u) v) w  
```
(λx: Bool → Nat → Bool. λy : Bool → Nat. λz : Bool. x z (y z)) u v w =
((λx: Bool → Nat → Bool. λy : Bool → Nat. λz : Bool. (x z) (y z)) u) v w =
(((λx: Bool → Nat → Bool. λy : Bool → Nat. λz : Bool. (x z) (y z)) u') v') w' 

(((λx: Bool → Nat → Bool. λy : Bool → Nat. λz : Bool. (x z) (y z)) u) v) w  = {app}
((λx: Bool → Nat → Bool. λy : Bool → Nat. λz : Bool. (x z) (y z)) u) v | w  = {app}
((λx: Bool → Nat → Bool. λy : Bool → Nat. λz : Bool. (x z) (y z)) u | v | w = {app}
(λx: Bool → Nat → Bool. λy : Bool → Nat. λz : Bool. (x z) (y z) | u | v | w = {abs}
(x z) (y z) | u | v | w                                                     = {app}
(x z) | (y z) | u | v | w                                                   = {app;app}
x | z | y | z | u | v | w
```
## c. w (λx: Bool → Nat → Bool. λy : Bool → Nat. λz : Bool. x z (y z)) u v =
```
w (λx: Bool → Nat → Bool. λy : Bool → Nat. λz : Bool. x z (y z)) u v =
w (λx: Bool → Nat → Bool. λy : Bool → Nat. λz : Bool. x z (y z)) u v
```
