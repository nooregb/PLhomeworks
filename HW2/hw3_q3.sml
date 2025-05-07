datatype start = first_we_mine | I | as_a_child | chicken | ender | flint | slime | water_bucket;
datatype ending = jockey | pearl | and_steel | I_yeared_for_the_mines | am_Steve | release | then_we_craft | cube;
datatype part = part of (start * ending);
datatype content = Content_End  | Content of (part * content);

fun start_to_string s =
  case s of
    first_we_mine          => "first we mine"
  | I                      => "I"
  | as_a_child             => "as a child"
  | chicken                => "chicken"
  | ender                  => "ender"
  | flint                  => "flint"
  | slime                  => "slime"
  | water_bucket           => "water bucket"

fun ending_to_string e =
  case e of
    jockey                 => "jockey"
  | pearl                  => "pearl"
  | and_steel              => "and steel"
  | I_yeared_for_the_mines => "I yearned for the mines"
  | am_Steve               => "am Steve"
  | release                => "release"
  | then_we_craft          => "then we craft"
  | cube                   => "cube"

fun good_part (cnt: content) (ss: string list): bool = 
  case (cnt, ss) of 
    (Content_End, []) => true 
  | (Content_End, _) => false 
  | (Content (part (_, _), rest), "*" :: ss') =>
      good_part rest ss' 
  | (Content (part (_, e), rest), "totem of undying" :: e_str :: ss') =>
      if ending_to_string e = e_str then
        good_part rest ss'
      else
        false
  | (Content (part (s, e), rest), start_str :: end_str :: ss') =>
      if start_to_string s = start_str andalso ending_to_string e = end_str then
        good_part rest ss'
      else
        false
  | _ => false