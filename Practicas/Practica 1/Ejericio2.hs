curry :: ((a,b) -> c) -> a -> b -> c
curry f x y = f (x,y)

curryL :: ((a,b) -> c) -> a -> b -> c
curryL f = \x y -> f (x,y)

uncurry :: (a -> b -> c) -> (a,b) -> c 
uncurry f (x,y) = f x y

uncurryL :: (a -> b -> c) -> (a,b) -> c 
uncurryL f = \(x,y) -> f x y
