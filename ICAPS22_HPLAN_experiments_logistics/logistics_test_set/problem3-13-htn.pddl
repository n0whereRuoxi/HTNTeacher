( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l285 - location
    l899 - location
    l746 - location
    p262 - obj
    p700 - obj
    p452 - obj
    t1562 - truck
    t1671 - truck
  )
  ( :init
    ( in-city l285 c000 )
    ( in-city l899 c000 )
    ( in-city l746 c000 )
    ( in-truck p262 t1562 )
    ( obj-at p700 l899 )
    ( obj-at p452 l899 )
    ( truck-at t1562 l746 )
    ( truck-at t1671 l899 )
    ( greater-than p700 p262 )
    ( greater-than p452 p262 )
    ( greater-than p452 p700 )
  )
  ( :tasks
    ( Deliver-3Pkg p262 p700 p452 l285 )
  )
)
