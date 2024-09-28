map2 :: (Float, Float) -> Float
max2 (x, y)
     | x >= y = x
     | otherwise = y

normaVectorial (x,y) :: (Float, Float) -> Float
normaVectorial (x, y) = sqrt (x^2 + y^2)

subtract :: Float -> Float -> Float
subtract = flip (-)

predecesor :: Float -> Float
predecesor = subtract 1

evaluarEnCero :: (Float -> a) -> b
evaluarEnCero = \f -> f 0

dosVeces :: (a -> a) -> a -> a
dosVeces = \f -> f . f 
-- f . f = f (f a) = f a = a

flipAll :: [a -> b -> c] -> [b -> a -> c]
flipAll = map flip
-- flip :: (a -> b -> c) -> (b -> a -> c)
-- map :: (a -> b) -> [a] -> [b]
-- El a del map queda (a -> b -> c) y el b queda (b -> a -> c)
--Intuitivamente, espera una lista de funciones a las que se les aplica flip (provocando que estas esperen sus argumentos en orden inverso)

- flipRaro = flip flip
