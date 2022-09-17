( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l208 - location
    l879 - location
    p425 - obj
    p47 - obj
    t1650 - truck
  )
  ( :init
    ( in-city l208 c000 )
    ( in-city l879 c000 )
    ( obj-at p425 l879 )
    ( obj-at p47 l879 )
    ( truck-at t1650 l208 )
    ( greater-than p47 p425 )
  )
  ( :tasks
    ( Deliver-2Pkg p425 p47 l208 )
  )
)
