( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l460 - location
    l414 - location
    l409 - location
    p325 - obj
    p742 - obj
    t1409 - truck
  )
  ( :init
    ( in-city l460 c000 )
    ( in-city l414 c000 )
    ( in-city l409 c000 )
    ( in-truck p325 t1409 )
    ( in-truck p742 t1409 )
    ( truck-at t1409 l414 )
    ( greater-than p742 p325 )
  )
  ( :tasks
    ( Deliver-2Pkg p325 p742 l460 )
  )
)
