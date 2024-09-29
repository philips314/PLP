# Ejercicios de la clase de Sistemas Deductivos  
![Machete](Imagenes/machete.png)
# I.  
Demostrar ¬(P ⇒ (Q ⇒ P)) FORM.
```
          -----FQ ------FP
          Q FORM  P FORM
------FP -------------- F⇒
P FORM   (Q ⇒ P) FORM
---------------------- F⇒
(P ⇒ (Q ⇒ P)) FORM
--------------- F¬
¬(P ⇒ (Q ⇒ P))
```
# II.  
Dar derivacion de P ∧ Q ⊢ Q ∧ P.  
```
-------------ax  -------------ax
P ∧ Q ⊢ P ∧ Q    P ∧ Q ⊢ P ∧ Q
--------------∧e2 ----------------∧e2
P ∧ Q ⊢ Q           P ∧ Q ⊢ P
-------------------------------∧i
P ∧ Q ⊢ Q ∧ P
```
