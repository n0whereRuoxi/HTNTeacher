( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l39 - location
    l893 - location
    l312 - location
    p253 - obj
    p63 - obj
    p697 - obj
    t1677 - truck
    t1053 - truck
  )
  ( :init
    ( in-city l39 c000 )
    ( in-city l893 c000 )
    ( in-city l312 c000 )
    ( in-truck p253 t1677 )
    ( obj-at p63 l312 )
    ( in-truck p697 t1053 )
    ( truck-at t1677 l312 )
    ( truck-at t1053 l312 )
    ( greater-than p63 p253 )
    ( greater-than p697 p253 )
    ( greater-than p697 p63 )
  )
  ( :tasks
    ( Deliver-3Pkg p253 p63 p697 l39 )
  )
)
