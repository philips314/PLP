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
```
                                                                              --------------------------------------- t-VAR
                                                                               x : Nat, y : Bool, z: Bool ⊢ z: bool
                                                                              --------------------------------------------------t-ABS        --------------------------------ax0
                                                                               x : Nat, y : Bool ⊢ (λz : Bool. z): Bool -> Bool              x : Nat, y : Bool ⊢ true: Bool
------------------------------ax0    ------------------------------ax0        ----------------------------------------------------------------------------------------------- t-APP
x : Nat, y : Bool ⊢ true: Bool       x : Nat, y : Bool ⊢ false: Bool          x : Nat, y : Bool ⊢ (λz : Bool. z) true: Bool
---------------------------------------------------------------------------------------------------------------------------- t-if
x : Nat, y : Bool ⊢ if true then false else (λz : Bool. z) true : Bool 
```
## c. ⊢ if λx: Bool. x then zero else succ(zero) : Nat  
```
                                                          ---------------ax0
NO TIPA                                                    ∅ ⊢ zero: Nat
-------------------------       ---------------ax0        ---------------------- t-succ
∅ ⊢ (λx: Bool. x): Bool         ∅ ⊢ zero: Nat             ∅ ⊢ succ(zero): Nat
----------------------------------------------------------------------------------- t-if
∅ ⊢ if λx: Bool. x then zero else succ(zero) : Nat
```
## d. x : Bool → Nat, y : Bool ⊢ x y : Nat  
```

------------------------------------------t-VAR       ----------------------------------t-VAR
x : Bool → Nat, y : Bool ⊢ x: Bool -> Nat             x : Bool → Nat, y : Bool ⊢ y: Bool
------------------------------------------------------------------------------------------ t-APP
x : Bool → Nat, y : Bool ⊢ x y : Nat
```


