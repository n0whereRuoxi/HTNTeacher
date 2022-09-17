( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l473 - location
    l657 - location
    l377 - location
    p870 - obj
    p716 - obj
    t1991 - truck
  )
  ( :init
    ( in-city l473 c000 )
    ( in-city l657 c000 )
    ( in-city l377 c000 )
    ( obj-at p870 l377 )
    ( obj-at p716 l377 )
    ( truck-at t1991 l377 )
    ( greater-than p716 p870 )
  )
  ( :tasks
    ( Deliver-2Pkg p870 p716 l473 )
  )
)
