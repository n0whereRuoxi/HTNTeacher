( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l81 - location
    l211 - location
    p801 - obj
    p81 - obj
    t1159 - truck
  )
  ( :init
    ( in-city l81 c000 )
    ( in-city l211 c000 )
    ( obj-at p801 l211 )
    ( obj-at p81 l211 )
    ( truck-at t1159 l211 )
    ( greater-than p81 p801 )
  )
  ( :tasks
    ( Deliver-2Pkg p801 p81 l81 )
  )
)
