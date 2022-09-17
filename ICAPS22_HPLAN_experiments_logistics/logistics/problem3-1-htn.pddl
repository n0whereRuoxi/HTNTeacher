( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-301 - location
    l000-111 - location
    p259 - obj
    p345 - obj
    p312 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-301 c000 )
    ( in-city l000-111 c000 )
    ( obj-at p259 l000-301 )
    ( obj-at p345 l000-301 )
    ( obj-at p312 l000-111 )
    ( greater-than p345 p259 )
    ( greater-than p312 p259 )
    ( greater-than p312 p345 )
  )
  ( :tasks
    ( Deliver-3Pkg p259 p345 p312 l000-000 )
  )
)
