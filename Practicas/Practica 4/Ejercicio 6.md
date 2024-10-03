# Practica 4 / Ejercicio 6  
Dar una derivación o explicar por qué no es posible dar una derivación para cada uno de los siguientes juicios de tipado:  
## a. ⊢ if true then zero else succ(zero) : Nat  
```

                                           --------------ax0
                                           ∅ ⊢ zero: Nat
--------------t-True   -------------ax0    ----------------
∅ ⊢ true: Bool         ∅ ⊢ zero: Nat       succ(zero): Nat
--------------------------------------------------------- t-if
∅ ⊢ if true then zero else succ(zero) : Nat
```
## b. x : Nat, y : Bool ⊢ if true then false else (λz : Bool. z) true : Bool  
## c. ⊢ if λx: Bool. x then zero else succ(zero) : Nat  
## d. x : Bool → Nat, y : Bool ⊢ x y : Nat  


