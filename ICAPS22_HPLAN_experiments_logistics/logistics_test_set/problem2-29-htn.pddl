( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l328 - location
    l632 - location
    l663 - location
    p903 - obj
    p39 - obj
    t1992 - truck
  )
  ( :init
    ( in-city l328 c000 )
    ( in-city l632 c000 )
    ( in-city l663 c000 )
    ( in-truck p903 t1992 )
    ( obj-at p39 l632 )
    ( truck-at t1992 l663 )
    ( greater-than p39 p903 )
  )
  ( :tasks
    ( Deliver-2Pkg p903 p39 l328 )
  )
)
