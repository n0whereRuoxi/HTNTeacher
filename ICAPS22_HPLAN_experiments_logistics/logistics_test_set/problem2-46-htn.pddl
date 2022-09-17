( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l509 - location
    p903 - obj
    p511 - obj
    t1250 - truck
  )
  ( :init
    ( in-city l509 c000 )
    ( in-truck p903 t1250 )
    ( in-truck p511 t1250 )
    ( truck-at t1250 l509 )
    ( greater-than p511 p903 )
  )
  ( :tasks
    ( Deliver-2Pkg p903 p511 l509 )
  )
)
