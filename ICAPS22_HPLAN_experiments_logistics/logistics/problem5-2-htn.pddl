( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-248 - location
    l000-717 - location
    l000-230 - location
    l000-261 - location
    l000-245 - location
    l000-555 - location
    l000-364 - location
    l000-124 - location
    p794 - obj
    p977 - obj
    p713 - obj
    p776 - obj
    p339 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-248 c000 )
    ( in-city l000-717 c000 )
    ( in-city l000-230 c000 )
    ( in-city l000-261 c000 )
    ( in-city l000-245 c000 )
    ( in-city l000-555 c000 )
    ( in-city l000-364 c000 )
    ( in-city l000-124 c000 )
    ( obj-at p794 l000-364 )
    ( obj-at p977 l000-555 )
    ( obj-at p713 l000-230 )
    ( obj-at p776 l000-717 )
    ( obj-at p339 l000-555 )
    ( greater-than p977 p794 )
    ( greater-than p713 p794 )
    ( greater-than p713 p977 )
    ( greater-than p776 p794 )
    ( greater-than p776 p977 )
    ( greater-than p776 p713 )
    ( greater-than p339 p794 )
    ( greater-than p339 p977 )
    ( greater-than p339 p713 )
    ( greater-than p339 p776 )
  )
  ( :tasks
    ( Deliver-5Pkg p794 p977 p713 p776 p339 l000-000 )
  )
)
