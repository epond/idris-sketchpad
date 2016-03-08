-- Contrary to the book, Vect is not included in the Prelude
-- http://www.idris-lang.org/docs/current/prelude_doc/
-- http://docs.idris-lang.org/en/latest/tutorial/interp.html?highlight=prelude
data Vect : Nat -> Type -> Type where
    Nil : Vect Z a
    (::) : a -> Vect k a -> Vect (S k) a

add : Vect n a -> Vect m a -> Vect (n + m) a
add Nil ys = ys
add (x :: xs) ys = x :: add xs ys

myVect1 : Vect 1 Int
myVect1 = 42 :: Nil