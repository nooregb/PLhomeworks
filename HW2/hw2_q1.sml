fun sig1 f a b c pred d =
  if pred d then
    f (a, b)
  else
    c
fun sig2 x y = Real.> (y, x);
fun sig3 f lists = map (map f) lists
fun sig4 () = 1
fun sig5 f g x y = g(f x)
fun sig6 f list x = map f list
fun sig7 flag n x m =
  if flag andalso (Int.+(n, 0) = m) then
    x
  else
    x;

fun sig8 f g x = g x (f x)
fun sig9 f g x = g (f x)
fun sig10 p f x y =
  if p x then f p else y
