( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l442 - location
    l569 - location
    l840 - location
    p646 - obj
    p247 - obj
    t1363 - truck
  )
  ( :init
    ( in-city l442 c000 )
    ( in-city l569 c000 )
    ( in-city l840 c000 )
    ( obj-at p646 l569 )
    ( in-truck p247 t1363 )
    ( truck-at t1363 l442 )
    ( greater-than p247 p646 )
  )
  ( :tasks
    ( Deliver-2Pkg p646 p247 l442 )
  )
)
