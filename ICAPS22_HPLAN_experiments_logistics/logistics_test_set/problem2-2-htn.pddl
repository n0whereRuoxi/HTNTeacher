( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l674 - location
    l76 - location
    p492 - obj
    p852 - obj
    t1220 - truck
  )
  ( :init
    ( in-city l674 c000 )
    ( in-city l76 c000 )
    ( in-truck p492 t1220 )
    ( in-truck p852 t1220 )
    ( truck-at t1220 l76 )
    ( greater-than p852 p492 )
  )
  ( :tasks
    ( Deliver-2Pkg p492 p852 l674 )
  )
)
