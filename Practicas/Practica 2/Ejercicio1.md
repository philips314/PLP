# Practica 2 / Ejercicio 1 
## Sean las siguientes definiciones de funciones:
- intercambiar (x,y) = (y,x)
- espejar (Left x) = Right x
- espejar (Right x) = Left x
- asociarI (x,(y,z)) = ((x,y),z)
- asociarD ((x,y),z)) = (x,(y,z))
- flip f x y = f y x
- curry f x y = f (x,y)
- uncurry f (x,y) = f x y

## I.
```
∀p :: (a,b). intercambiar (intercambiar p) = p
```
Por principio de extensionalidad para pares, basta ver que:
```
∀x :: a. ∀y :: b. intercambiar (intercambiar (x,y)) = (x,y)
```
```
intercambiar (intercambiar (x,y)) = {intercambiar}
intercambiar (y,x) = {intercambiar}
(x,y)
```
## II. ??
```
∀ p:: (a,(b,c)). asociarD (asociarI p) = p
```
Por principio de extencionalidad para pares, basta ver que: 
```
∀x::a. ∀y::b. ∀z::c. asociarD (asociarI (x,(y,z))) = (x,(y,z)).
```
## III.
```
∀p::Either a b. espejar (espejar p) = p
```
Por principio de extensionalidad del Either, basta ver que tenemos 2 casos:
```
{1} p = Left x
{2} p = Right x
```
Caso p = Left x
```
espejar (espejar p) = {1}
espejar (espejar (Left x)) = {ESPEJAR}
espejar (Right x) = {ESPEJAR}
Left x
```
Caso p = Right x
```
espejar (espejar p) = {2}
espejar (espejar (Right x)) = {ESPEJAR}
espejar (Left x) = {ESPEJAR}
Right x
```
Tanto para el caso {1} como para el {2}, llegamos a espejar (espejar p) = p.
