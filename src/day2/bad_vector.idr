data Vect : Nat -> Type -> Type where
    Nil : Vect Z a
    (::) : a -> Vect k a -> Vect (S k) a

add : Vect n a -> Vect m a -> Vect (n + m) a
add Nil ys = ys
add (x :: xs) ys = x :: add xs xs
