( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l986 - location
    p582 - obj
    p47 - obj
    t1702 - truck
  )
  ( :init
    ( in-city l986 c000 )
    ( in-truck p582 t1702 )
    ( in-truck p47 t1702 )
    ( truck-at t1702 l986 )
    ( greater-than p47 p582 )
  )
  ( :tasks
    ( Deliver-2Pkg p582 p47 l986 )
  )
)
