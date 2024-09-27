# Practica 2 / Ejercicio 1 
## Sean las siguientes definiciones de funciones:
- intercambiar (x,y) = (y,x)
- espejar (Left x) = Right x
espejar (Right x) = Left x
- asociarI (x,(y,z)) = ((x,y),z)
- asociarD ((x,y),z)) = (x,(y,z))
- flip f x y = f y x
- curry f x y = f (x,y)
- uncurry f (x,y) = f x y

## I.
```
∀p :: (a,b). intercambiar (intercambiar p) = p
```
Por principio de **extensionalidad para pares**, basta ver que:
```
∀x :: a. ∀y :: b. intercambiar (intercambiar (x,y)) = (x,y)
```
```
intercambiar (intercambiar (x,y)) = {intercambiar}
intercambiar (y,x) = *{intercambiar}*
(x,y)
```
## II.
```
∀ p:: (a,(b,c)). asociarD (asociarI p) = p
```
