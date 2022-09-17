( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l300 - location
    l11 - location
    l654 - location
    l457 - location
    p297 - obj
    p679 - obj
    t1599 - truck
  )
  ( :init
    ( in-city l300 c000 )
    ( in-city l11 c000 )
    ( in-city l654 c000 )
    ( in-city l457 c000 )
    ( obj-at p297 l11 )
    ( in-truck p679 t1599 )
    ( truck-at t1599 l457 )
    ( greater-than p679 p297 )
  )
  ( :tasks
    ( Deliver-2Pkg p297 p679 l300 )
  )
)
