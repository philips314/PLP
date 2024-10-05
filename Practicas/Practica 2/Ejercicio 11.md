# Practica 2 / Ejercicio 11.  
Considerar las siguientes funciones:  
```
     inorder :: AB a -> [a]
{I0} inorder = foldAB [] (\ri x rd -> ri ++ (x:rd))
     elemAB :: Eq a => a -> AB a -> Bool
{A0} elemAB e = foldAB False (\ri x rd -> (e == x) || ri || rd)
     elem :: Eq a => [a] -> Bool
{E0} elem e = foldr (\x rec -> (e == x) || rec) False
```
Demostrar la siguiente propiedad: `Eq a => ∀ e::a . elemAB e = elem e . inorder`  
Por extensionalidad funcional y 
