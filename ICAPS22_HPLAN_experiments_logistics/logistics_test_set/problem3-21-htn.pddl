( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l530 - location
    l918 - location
    l69 - location
    l363 - location
    l20 - location
    l49 - location
    p882 - obj
    p767 - obj
    p492 - obj
    t1753 - truck
    t1939 - truck
  )
  ( :init
    ( in-city l530 c000 )
    ( in-city l918 c000 )
    ( in-city l69 c000 )
    ( in-city l363 c000 )
    ( in-city l20 c000 )
    ( in-city l49 c000 )
    ( in-truck p882 t1939 )
    ( obj-at p767 l49 )
    ( obj-at p492 l20 )
    ( truck-at t1753 l69 )
    ( truck-at t1939 l69 )
    ( greater-than p767 p882 )
    ( greater-than p492 p882 )
    ( greater-than p492 p767 )
  )
  ( :tasks
    ( Deliver-3Pkg p882 p767 p492 l530 )
  )
)
