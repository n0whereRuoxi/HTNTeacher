( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l86 - location
    l289 - location
    l202 - location
    l315 - location
    l106 - location
    l346 - location
    p207 - obj
    p424 - obj
    p958 - obj
    t1792 - truck
    t1994 - truck
  )
  ( :init
    ( in-city l86 c000 )
    ( in-city l289 c000 )
    ( in-city l202 c000 )
    ( in-city l315 c000 )
    ( in-city l106 c000 )
    ( in-city l346 c000 )
    ( obj-at p207 l315 )
    ( obj-at p424 l202 )
    ( obj-at p958 l315 )
    ( truck-at t1792 l86 )
    ( truck-at t1994 l346 )
    ( greater-than p424 p207 )
    ( greater-than p958 p207 )
    ( greater-than p958 p424 )
  )
  ( :tasks
    ( Deliver-3Pkg p207 p424 p958 l86 )
  )
)
