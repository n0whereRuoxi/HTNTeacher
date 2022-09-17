( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-847 - location
    l000-87 - location
    l000-209 - location
    l000-944 - location
    p476 - obj
    p757 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-847 c000 )
    ( in-city l000-87 c000 )
    ( in-city l000-209 c000 )
    ( in-city l000-944 c000 )
    ( obj-at p476 l000-944 )
    ( obj-at p757 l000-944 )
    ( greater-than p757 p476 )
  )
  ( :tasks
    ( Deliver-2Pkg p476 p757 l000-000 )
  )
)
