( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-657 - location
    p919 - obj
    p691 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-657 c000 )
    ( obj-at p919 l000-657 )
    ( obj-at p691 l000-657 )
    ( greater-than p691 p919 )
  )
  ( :tasks
    ( Deliver-2Pkg p919 p691 l000-000 )
  )
)
