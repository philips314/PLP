map2 :: (Float, Float) -> Float
max2 (x, y)
     | x >= y = x
     | otherwise = y


- normaVectorial (x, y) = sqrt (x^2 + y^2)
- subtract = flip (-)
- predecesor = subtract 1
- evaluarEnCero = \f -> f 0
- dosVeces = \f -> f . f
- flipAll = map flip
- flipRaro = flip flip
