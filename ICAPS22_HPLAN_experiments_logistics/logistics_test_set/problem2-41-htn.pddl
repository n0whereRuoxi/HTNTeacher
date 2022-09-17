( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l404 - location
    l796 - location
    l983 - location
    p807 - obj
    p444 - obj
    t1483 - truck
  )
  ( :init
    ( in-city l404 c000 )
    ( in-city l796 c000 )
    ( in-city l983 c000 )
    ( obj-at p807 l796 )
    ( in-truck p444 t1483 )
    ( truck-at t1483 l983 )
    ( greater-than p444 p807 )
  )
  ( :tasks
    ( Deliver-2Pkg p807 p444 l404 )
  )
)
