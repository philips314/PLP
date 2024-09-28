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
