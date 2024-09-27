valorAbsoluto :: Float -> Float
valorAbsoluto x = if x < 0 then -x else x

bisiesto :: Int -> Bool
bisiesto x = mod x 400 == 0 || mod x 4 == 0 && mod x 100 /= 0

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial(n-1)

esPrimo :: Int -> Bool
esPrimo 1 = False
esPrimo n = length (factores n) == 2
    where factores n = [x| x <- [1..n], mod n x == 0]

cantDivisoresPrimos :: Int -> Int
cantDivisoresPrimos 0 = 0
cantDivisoresPrimos n = length [y| y <- [1..n], mod n y ==0, esPrimo y]

inverso :: Float -> Maybe Float
inverso 0 = Nothing
inverso x = Just (1/x)

aEntero :: Either Int Bool -> Int
aEntero (Left a) = a
aEntero (Right False) = 0
aEntero (Right True) = 1

limpiar :: String -> String -> String
limpiar (x:xs) (y:ys) = [c | c <- y:ys, c `notElem` (x : xs)]

difPromedio :: [Float] -> [Float]
difPromedio lista = map (\i -> i - promedio lista) lista
    where promedio lista = sum lista / fromIntegral(length lista)

todosIguales :: [Int] -> Bool
todosIguales (x:xs) = null (limpiarEnteros [x] (x:xs)) 

limpiarEnteros :: Eq a => [a] -> [a] -> [a]
limpiarEnteros (x:xs) (y:ys) = [c | c <- y:ys, c `notElem` (x : xs)]

data AB a = Nil | Nodo (AB a) a (AB a)

vacioAB :: AB a -> Bool
vacioAB Nil = True
vacioAB _ = False

negacionAB :: AB Bool -> AB Bool
negacionAB Nil = Nil
negacionAB (Nodo izq raiz der) = Nodo (negacionAB izq) (not raiz) (negacionAB der) 

productoAB :: AB Int -> Int
productoAB Nil = 1
productoAB (Nodo izq raiz der) = raiz * productoAB izq *productoAB der

difPromedioNormal :: [Float] -> [Float]
difPromedioNormal lista = map (flip (-) (promedio lista)) lista

promedio :: [Float] -> Float
promedio lista = sum lista / fromIntegral (length lista)

limpiarNormal :: String -> String -> String
limpiarNormal [] ys = ys
limpiarNormal (x:xs) ys = limpiarNormal xs (filter (/= x) ys)

pertenece :: Eq a => a -> [a] -> Bool
pertenece _ [] = False
pertenece a (x:xs) = x == a || pertenece a xs 
