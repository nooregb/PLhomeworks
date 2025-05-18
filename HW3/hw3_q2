datatype ('a, 'b) heterolist = NIL | ::: of 'a * ('b, 'a) heterolist
infixr 5 :::;

fun build4 (x, one, y, two) = x ::: (one ::: (y ::: (two ::: NIL)))

local
  fun unzipHelperA lst acc =
    case lst of
      NIL => acc
    | x ::: xs => unzipHelperB xs (#1 acc @ [x], #2 acc)
  and unzipHelperB lst acc =
    case lst of
      NIL => acc
    | x ::: xs => unzipHelperA xs (#1 acc, #2 acc @ [x])
in
  fun unzip heteroList = unzipHelperA heteroList ([], [])
end

fun zip ([], []) = NIL
  | zip (x::xs, y::ys) = x ::: y ::: zip(xs, ys)
  | zip _ = raise Empty
