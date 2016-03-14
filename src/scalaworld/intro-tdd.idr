-- https://www.youtube.com/watch?v=X36ye-1x_HQ
-- Assumes https://github.com/idris-hackers/atom-language-idris

-- Idea: Don't make any progress until you have figured out all the types.

-- Put cursor on ListType and ctrl-alt-a generates a skeleton definition
-- with a hole of ?ListType_rhs. Load it into the REPL and it will tell
-- you there is a hole: "Holes: Main.ListType"
-- Inspect the type of the hole with ctrl-alt-t
-- Put cursor on Bool and ctrl-alt-d will give you documentation which tells
-- you it has possible values of False and True.
-- Case split singleton with ctrl-alt-c to split it into the two possibilities.
ListType : (singleton : Bool) -> Type
ListType False = List Nat
ListType True = Nat

-- We want functions that return types so that we can use them in types.
-- Generate a skeleton definition and inspect the type of the hole.
-- Initially we can only inspect singleton as we don't have the type of x.
-- Case split singleton and inspect the type of the hole for False x.
-- Idris knows that x must be of type List Nat.
-- Case split on the x of False x and True x.
-- Expression search with ctrl-alt-s.
sumList : (singleton : Bool) -> ListType singleton -> Nat
sumList False [] = 0
sumList False (x :: xs) = x + sumList False xs
sumList True x = x
