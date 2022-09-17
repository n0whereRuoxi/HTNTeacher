( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l707 - location
    l551 - location
    p878 - obj
    p964 - obj
    t1737 - truck
  )
  ( :init
    ( in-city l707 c000 )
    ( in-city l551 c000 )
    ( in-truck p878 t1737 )
    ( obj-at p964 l551 )
    ( truck-at t1737 l707 )
    ( greater-than p964 p878 )
  )
  ( :tasks
    ( Deliver-2Pkg p878 p964 l707 )
  )
)
