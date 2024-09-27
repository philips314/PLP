Sean las siguientes defniciones de funciones:
- intercambiar (x,y) = (y,x)
- espejar (Left x) = Right x
espejar (Right x) = Left x
- asociarI (x,(y,z)) = ((x,y),z)
- asociarD ((x,y),z)) = (x,(y,z))
- flip f x y = f y x
- curry f x y = f (x,y)
- uncurry f (x,y) = f x y
