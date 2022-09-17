( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l6 - location
    l705 - location
    l160 - location
    l515 - location
    l960 - location
    l424 - location
    l459 - location
    l526 - location
    l236 - location
    l118 - location
    l460 - location
    l376 - location
    l605 - location
    l34 - location
    l733 - location
    l978 - location
    l128 - location
    p319 - obj
    p87 - obj
    p54 - obj
    p75 - obj
    p659 - obj
    p190 - obj
    p782 - obj
    p106 - obj
    p452 - obj
    t1108 - truck
    t1936 - truck
    t1016 - truck
    t1025 - truck
    t1422 - truck
    t1654 - truck
    t1238 - truck
    t1705 - truck
  )
  ( :init
    ( in-city l6 c000 )
    ( in-city l705 c000 )
    ( in-city l160 c000 )
    ( in-city l515 c000 )
    ( in-city l960 c000 )
    ( in-city l424 c000 )
    ( in-city l459 c000 )
    ( in-city l526 c000 )
    ( in-city l236 c000 )
    ( in-city l118 c000 )
    ( in-city l460 c000 )
    ( in-city l376 c000 )
    ( in-city l605 c000 )
    ( in-city l34 c000 )
    ( in-city l733 c000 )
    ( in-city l978 c000 )
    ( in-city l128 c000 )
    ( in-truck p319 t1705 )
    ( in-truck p87 t1422 )
    ( obj-at p54 l526 )
    ( obj-at p75 l515 )
    ( in-truck p659 t1422 )
    ( obj-at p190 l960 )
    ( obj-at p782 l34 )
    ( in-truck p106 t1936 )
    ( obj-at p452 l128 )
    ( truck-at t1108 l118 )
    ( truck-at t1936 l960 )
    ( truck-at t1016 l6 )
    ( truck-at t1025 l605 )
    ( truck-at t1422 l128 )
    ( truck-at t1654 l960 )
    ( truck-at t1238 l34 )
    ( truck-at t1705 l515 )
    ( greater-than p87 p319 )
    ( greater-than p54 p319 )
    ( greater-than p54 p87 )
    ( greater-than p75 p319 )
    ( greater-than p75 p87 )
    ( greater-than p75 p54 )
    ( greater-than p659 p319 )
    ( greater-than p659 p87 )
    ( greater-than p659 p54 )
    ( greater-than p659 p75 )
    ( greater-than p190 p319 )
    ( greater-than p190 p87 )
    ( greater-than p190 p54 )
    ( greater-than p190 p75 )
    ( greater-than p190 p659 )
    ( greater-than p782 p319 )
    ( greater-than p782 p87 )
    ( greater-than p782 p54 )
    ( greater-than p782 p75 )
    ( greater-than p782 p659 )
    ( greater-than p782 p190 )
    ( greater-than p106 p319 )
    ( greater-than p106 p87 )
    ( greater-than p106 p54 )
    ( greater-than p106 p75 )
    ( greater-than p106 p659 )
    ( greater-than p106 p190 )
    ( greater-than p106 p782 )
    ( greater-than p452 p319 )
    ( greater-than p452 p87 )
    ( greater-than p452 p54 )
    ( greater-than p452 p75 )
    ( greater-than p452 p659 )
    ( greater-than p452 p190 )
    ( greater-than p452 p782 )
    ( greater-than p452 p106 )
  )
  ( :tasks
    ( Deliver-9Pkg p319 p87 p54 p75 p659 p190 p782 p106 p452 l6 )
  )
)
