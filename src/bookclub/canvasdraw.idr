import Data.Vect

pixel : Vect 1 Char
pixel = ' ' :: Nil

canvas : (rows: Nat) -> (cols: Nat) -> Vect rows (Vect cols Char)
canvas rows cols = replicate rows (replicate cols ' ')

-- ￼data Fin : Nat -> Type where
--   FZ : Fin (S k)
--   FS : Fin k -> Fin (S k)

-- You could try drawPoint in the REPL with eg. drawPoint (canvas 3 3) (FS 1) (FS 0)
drawPoint : (oldCanvas: Vect rows (Vect cols Char)) ->
            (row: Fin rows) ->
            (col: Fin cols) ->
            Vect rows (Vect cols Char)
drawPoint oldCanvas row col = replaceAt row newrow oldCanvas
  where newrow = replaceAt col 'a' (index row oldCanvas)

tryUpdate : Vect size Char -> Nat -> Vect size Char
tryUpdate xs index {size = Z} = xs
tryUpdate xs index {size = (S k)} = case (natToFin index (S k)) of
  Nothing => xs
  Just i  => replaceAt i 'a' xs
