( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l721 - location
    l610 - location
    l738 - location
    l115 - location
    p662 - obj
    p314 - obj
    p195 - obj
    t1196 - truck
    t1472 - truck
  )
  ( :init
    ( in-city l721 c000 )
    ( in-city l610 c000 )
    ( in-city l738 c000 )
    ( in-city l115 c000 )
    ( obj-at p662 l738 )
    ( obj-at p314 l115 )
    ( obj-at p195 l115 )
    ( truck-at t1196 l738 )
    ( truck-at t1472 l115 )
    ( greater-than p314 p662 )
    ( greater-than p195 p662 )
    ( greater-than p195 p314 )
  )
  ( :tasks
    ( Deliver-3Pkg p662 p314 p195 l721 )
  )
)
