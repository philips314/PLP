# Practica 3 / Ejercicio 9  
Probar los siguientes teoremas:  
## I. ((P ⇒ Q) ⇒ Q) ⇒ ((Q ⇒ P) ⇒ P)  
```
                                                                                                                                                                    ----------------------------------------- ax
                                                                                                                                                                     ((P ⇒ Q) ⇒ Q), (Q ⇒ P), ¬P, ¬Q ⊢ ¬P
------------------------------------- ax                                                                                                                            --------------------------------------------- ⇒i
((P ⇒ Q) ⇒ Q), (Q ⇒ P), ¬P ⊢ Q ⇒ P                                                                                                                                 ((P ⇒ Q) ⇒ Q), (Q ⇒ P), ¬P ⊢ ¬Q ⇒ ¬P
-------------------------------------- CONTRAPOSICION       ---------------------------------- ax                 --------------------------------------------- ax   -------------------------------------------- CONTRAPOSICION
((P ⇒ Q) ⇒ Q), (Q ⇒ P), ¬P ⊢ ¬P ⇒ ¬Q                       ((P ⇒ Q) ⇒ Q), (Q ⇒ P), ¬P ⊢ ¬P                      ((P ⇒ Q) ⇒ Q), (Q ⇒ P), ¬P ⊢ (P ⇒ Q) ⇒ Q       ((P ⇒ Q) ⇒ Q), (Q ⇒ P), ¬P ⊢ P ⇒ Q
---------------------------------------------------------------------------------------------------------- ⇒e    ---------------------------------------------------------------------------------------------- ⇒e
((P ⇒ Q) ⇒ Q), (Q ⇒ P), ¬P ⊢ ¬Q                                                                                   ((P ⇒ Q) ⇒ Q), (Q ⇒ P), ¬P ⊢ Q
-------------------------------------------------------------------------------------------------------------------------------------------------------- ¬e
((P ⇒ Q) ⇒ Q), (Q ⇒ P), ¬P ⊢ ⊥
--------------------------------- PBC
((P ⇒ Q) ⇒ Q), (Q ⇒ P) ⊢ P
--------------------------------------------------------------------------- ⇒i
((P ⇒ Q) ⇒ Q) ⊢ (Q ⇒ P) ⇒ P
----------------------------------------- ⇒i
⊢ ((P ⇒ Q) ⇒ Q) ⇒ ((Q ⇒ P) ⇒ P)
```

## II. (P ⇒ Q) ⇒ ((¬P ⇒ Q) ⇒ Q)  
```
asd
```
