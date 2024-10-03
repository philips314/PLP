# Practica 4 / Ejercicio 1  
Determinar qué expresiones son sintácticamente válidas (es decir, pueden ser generadas con las gramáticas presentadas) y determinar a qué categoría pertenecen (expresiones de términos o expresiones de tipos):  
## a. x  
$\checkmark$ es un término.  
## b. x x  
$\checkmark$ es un término.  
## c. M  
$\times$ M representa un término, pero no es un término en si mismo.  
## d. M M  
$\times$ M representa un término, pero no es un término en si mismo.  
## e. true false  
$\checkmark$ es un término.  
## f. true succ(false true)  
$\checkmark$ es sintácticamente válida pero no tipa.  
## g. λx.isZero(x)  
$\times$ No es valido, a x le falta el tipo.  
## h. λx: σ. succ(x)  
$\times$   
## i. λx: Bool. succ(x)  
$\checkmark$ es sintácticamente válida pero no tipa.  
## j. λx: if true then Bool else Nat. x  
$\checkmark$ En las ramas del if deben aparecer términos, y ni Bool ni Nat son términos (son tipos).  
## k. σ  
$\times$ No es una expresion sintácticamente válidas, es un tipo cualquiera.  
## l. Bool  
??
## m. Bool → Bool  
??
## n. Bool → Bool → Nat  
??
## ñ. (Bool → Bool) → Nat  
??
## o. succ true  
$\times$ No es una expresion sintácticamente válidas, le falta el parentesís.  
## p. λx: Bool. if zero then true else zero succ(true)  
$\checkmark$ Es valida, pero no tipa.  

