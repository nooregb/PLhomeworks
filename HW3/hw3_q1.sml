local
  fun neighbors edges u =
    List.map #2 (List.filter (fn (x,y) => x = u) edges)

  fun adjacency verts edges =
    List.map (fn u => (u, neighbors edges u)) verts

  fun build_verts edges =
    let
      fun add x xs = if List.exists (fn y => y = x) xs then xs else x::xs
    in
      List.foldl (fn ((u,v), verts) => add v (add u verts)) [] edges
    end

  fun build_map edges =
    let
      val verts = build_verts edges
    in
      adjacency verts edges
    end

in

fun reachable adj u v =
  if u = v then true
  else
    let
      fun visit seen u =
        if List.exists (fn x => x = u) seen then false
        else
          case List.find (fn (x,ns) => x = u) adj of
              NONE => false
            | SOME (_, ns)  =>
                if List.exists (fn w => w = v) ns then
                  true
                else
                  List.exists (fn w => visit (u::seen) w) ns
    in
      visit [] u
    end

fun well_connected verts edges =
  let
    val adj = build_map edges
  in
    List.all (fn u => List.all (fn v => reachable adj u v) verts) verts
  end

fun max_removable_edges verts edges =
  let
    fun aux [] curr removed = removed
      | aux (e::es) curr removed =
          let
            val without_e = List.filter (fn x => x <> e) curr
          in
            if well_connected verts without_e then
              aux es without_e (removed + 1)
            else
              aux es curr removed
          end
  in
    aux edges edges 0
  end

end

