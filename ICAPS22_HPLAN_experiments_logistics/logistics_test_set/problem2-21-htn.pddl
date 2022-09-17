( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l569 - location
    l410 - location
    l359 - location
    p320 - obj
    p299 - obj
    t1330 - truck
  )
  ( :init
    ( in-city l569 c000 )
    ( in-city l410 c000 )
    ( in-city l359 c000 )
    ( in-truck p320 t1330 )
    ( in-truck p299 t1330 )
    ( truck-at t1330 l410 )
    ( greater-than p299 p320 )
  )
  ( :tasks
    ( Deliver-2Pkg p320 p299 l569 )
  )
)
