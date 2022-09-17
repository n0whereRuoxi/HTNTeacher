( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l194 - location
    l466 - location
    p732 - obj
    p404 - obj
    p790 - obj
    t1964 - truck
    t1277 - truck
  )
  ( :init
    ( in-city l194 c000 )
    ( in-city l466 c000 )
    ( obj-at p732 l466 )
    ( in-truck p404 t1277 )
    ( in-truck p790 t1277 )
    ( truck-at t1964 l194 )
    ( truck-at t1277 l466 )
    ( greater-than p404 p732 )
    ( greater-than p790 p732 )
    ( greater-than p790 p404 )
  )
  ( :tasks
    ( Deliver-3Pkg p732 p404 p790 l194 )
  )
)
