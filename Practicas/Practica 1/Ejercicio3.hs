I.
foldr _ z [] = z
foldr f z (x:xs) = f x (foldr f z xs)

sumFoldr :: [Integer] -> Integer
sumFoldr = foldr (+) 0 

elemFoldr :: Eq a => a -> [a] -> Bool
elemFoldr e = foldr (\x rec -> x == e || rec) False

masmasconFoldr :: [a] -> [a] -> [a]
masmasconFoldr xs ys = foldr (:) ys xs

filterFoldr :: (a->Bool) -> [a] -> [a]
filterFoldr f = foldr (\x rec -> if f x then x : rec else rec) []

mapFoldr :: (a->b) -> [a] -> [b]
mapFoldr f = foldr (\x rec -> f x : rec) []

II.
--foldr1 aplica una funcion de a dos elementos de una lista -> f x y = c -> f c z ...
mejorSegun :: (a->a->Bool) -> [a] -> a
mejorSegun _ [x] = x
mejorSegun pred (x:xs) = if pred x rec then x else rec
	where rec = mejorSegun pred xs 

mejorSegunFoldr1 :: (a->a->Bool) -> [a] -> a
mejorSegunFoldr1 pred = foldr1 (\x rec -> if pred x rec then x else rec)

III.
foldl  _ z [] = []
foldl f z (x:xs) = foldl f (f z x) xs

sumasParciales :: Num a => [a] -> [a]
sumasParciales = foldl (\rec x -> rec ++ (if null rec then [x] else [x + last rec])) []
--Sea sumasParciales [1,4,2]
--rec: [] y x: 1 => [] ++ [1] = [1]
--rec: [1] y x:4 => [4 + last [1]] = [4 + 1] = [5]
--rec: [1,5] y x:2 => [2 + last [1,5]] = [2 + 5] = [7]
--rec [1,5,7] y x:[] => [1,5,7] ++ [] = [1,5,7]

IV.
sumaAlt :: Num a => [a] -> a
sumaAlt = foldr (-) 0

V.
sumaAlt2 :: Num a => [a] -> a
sumaAlt2 = foldl (flip (-)) 0
