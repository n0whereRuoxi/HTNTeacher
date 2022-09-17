( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l544 - location
    l954 - location
    p490 - obj
    p573 - obj
    t1838 - truck
  )
  ( :init
    ( in-city l544 c000 )
    ( in-city l954 c000 )
    ( obj-at p490 l954 )
    ( obj-at p573 l954 )
    ( truck-at t1838 l954 )
    ( greater-than p573 p490 )
  )
  ( :tasks
    ( Deliver-2Pkg p490 p573 l544 )
  )
)
