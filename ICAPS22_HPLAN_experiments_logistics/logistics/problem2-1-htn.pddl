( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-354 - location
    l000-374 - location
    l000-951 - location
    p29 - obj
    p450 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-354 c000 )
    ( in-city l000-374 c000 )
    ( in-city l000-951 c000 )
    ( obj-at p29 l000-354 )
    ( obj-at p450 l000-354 )
    ( greater-than p450 p29 )
  )
  ( :tasks
    ( Deliver-2Pkg p29 p450 l000-000 )
  )
)
