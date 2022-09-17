( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l275 - location
    p737 - obj
    p373 - obj
    t1653 - truck
  )
  ( :init
    ( in-city l275 c000 )
    ( in-truck p737 t1653 )
    ( in-truck p373 t1653 )
    ( truck-at t1653 l275 )
    ( greater-than p373 p737 )
  )
  ( :tasks
    ( Deliver-2Pkg p737 p373 l275 )
  )
)
