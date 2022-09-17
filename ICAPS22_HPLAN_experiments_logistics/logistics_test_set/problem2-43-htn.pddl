( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l211 - location
    p681 - obj
    p953 - obj
    t1717 - truck
  )
  ( :init
    ( in-city l211 c000 )
    ( in-truck p681 t1717 )
    ( in-truck p953 t1717 )
    ( truck-at t1717 l211 )
    ( greater-than p953 p681 )
  )
  ( :tasks
    ( Deliver-2Pkg p681 p953 l211 )
  )
)
