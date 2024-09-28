# Practica 2 / Ejercicio 2 
## Demostrar las siguientes igualdades utilizando el principio de extensionalidad funcional:
## I.  
flip . flip = id
```
{F}: flip f x y = f y x
{.}: (f . g) x = f (g x)
{I}: id x = x
```
Por principio de extensionalidad funcional, basta ver que:
```
∀f::a->b->c. ∀x::a. ∀y::b. flip . flip f x y = id f x y
```
```
flip . flip f x y = {.}
flip (flip f x y) = {F}
flip (f y x) = {F}
f x y
```
## II.  
∀f::(a,b)->c. uncurry (curry f) = f
```
{C}: curry f x y = f (x, y)
{U}: uncurry f (x, y) = f x y
```
Por principio de extensionalidad funcional, basta ver que:
```
∀f::(a,b)->c. ∀x::a. ∀y::b. uncurry (curry f) (x,y) = f (x,y)
```
```
uncurry (curry f) (x,y) = {U}
curry f x y = {C}
f (x,y)
```
## III.
flip const = const id
```
{F}: flip f x y = f y x
{C}: const x y = x
{I}: id x = x
```
Por principio de extensionalidad funcional, basta ver que:
```
∀x::a. ∀y::b. flip const x y = const id x y
```
```
Por un lado:
  flip const x y = {F}
  const y x = {C}
  y
Por el otro:
  const id x y = {C}
  id y = {ID}
  y
```
Que es igual por los dos lados...
## IV. ???
∀f::a->b. ∀g::b->c. ∀h::c->d. ((h . g) . f) = (h . (g . f))
```
{.}: (f . g) x = f (g x)
```
Por principio de extensionalidad funcional, basta ver que:
```
∀f::a->b. ∀g::b->c. ∀h::c->d. ∀x::a. ((h . g) . f) x = (h . (g . f)) x
```
```
Por un lado:
  ((h . g) . f) x = {.}
  (h.g) (f x) = {.}
  h (g (f x))
Por el otro:
  (h . (g . f)) x = {.}
  h ((g.f) x) = {.}
  h (g (f x))
```
Que es igual por los dos lados...
