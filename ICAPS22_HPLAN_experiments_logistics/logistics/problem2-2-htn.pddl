( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-832 - location
    l000-510 - location
    p420 - obj
    p494 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-832 c000 )
    ( in-city l000-510 c000 )
    ( obj-at p420 l000-832 )
    ( obj-at p494 l000-832 )
    ( greater-than p494 p420 )
  )
  ( :tasks
    ( Deliver-2Pkg p420 p494 l000-000 )
  )
)
