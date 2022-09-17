( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l285 - location
    p728 - obj
    p87 - obj
    t1377 - truck
  )
  ( :init
    ( in-city l285 c000 )
    ( in-truck p728 t1377 )
    ( in-truck p87 t1377 )
    ( truck-at t1377 l285 )
    ( greater-than p87 p728 )
  )
  ( :tasks
    ( Deliver-2Pkg p728 p87 l285 )
  )
)
