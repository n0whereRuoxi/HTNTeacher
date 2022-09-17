( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l487 - location
    l547 - location
    l379 - location
    l297 - location
    l843 - location
    l832 - location
    l362 - location
    p588 - obj
    p644 - obj
    p244 - obj
    p585 - obj
    t1228 - truck
    t1888 - truck
    t1765 - truck
  )
  ( :init
    ( in-city l487 c000 )
    ( in-city l547 c000 )
    ( in-city l379 c000 )
    ( in-city l297 c000 )
    ( in-city l843 c000 )
    ( in-city l832 c000 )
    ( in-city l362 c000 )
    ( obj-at p588 l362 )
    ( obj-at p644 l379 )
    ( obj-at p244 l843 )
    ( obj-at p585 l843 )
    ( truck-at t1228 l843 )
    ( truck-at t1888 l487 )
    ( truck-at t1765 l843 )
    ( greater-than p644 p588 )
    ( greater-than p244 p588 )
    ( greater-than p244 p644 )
    ( greater-than p585 p588 )
    ( greater-than p585 p644 )
    ( greater-than p585 p244 )
  )
  ( :tasks
    ( Deliver-4Pkg p588 p644 p244 p585 l487 )
  )
)
