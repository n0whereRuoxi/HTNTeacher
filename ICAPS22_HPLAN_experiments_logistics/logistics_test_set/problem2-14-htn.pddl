( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l500 - location
    l543 - location
    p945 - obj
    p924 - obj
    t1891 - truck
  )
  ( :init
    ( in-city l500 c000 )
    ( in-city l543 c000 )
    ( obj-at p945 l543 )
    ( obj-at p924 l543 )
    ( truck-at t1891 l500 )
    ( greater-than p924 p945 )
  )
  ( :tasks
    ( Deliver-2Pkg p945 p924 l500 )
  )
)
