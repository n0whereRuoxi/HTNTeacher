( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l124 - location
    l344 - location
    l114 - location
    l295 - location
    l395 - location
    l336 - location
    l630 - location
    l767 - location
    p970 - obj
    p958 - obj
    p474 - obj
    p292 - obj
    t1753 - truck
    t1358 - truck
    t1249 - truck
  )
  ( :init
    ( in-city l124 c000 )
    ( in-city l344 c000 )
    ( in-city l114 c000 )
    ( in-city l295 c000 )
    ( in-city l395 c000 )
    ( in-city l336 c000 )
    ( in-city l630 c000 )
    ( in-city l767 c000 )
    ( obj-at p970 l344 )
    ( obj-at p958 l395 )
    ( obj-at p474 l114 )
    ( in-truck p292 t1249 )
    ( truck-at t1753 l295 )
    ( truck-at t1358 l630 )
    ( truck-at t1249 l395 )
    ( greater-than p958 p970 )
    ( greater-than p474 p970 )
    ( greater-than p474 p958 )
    ( greater-than p292 p970 )
    ( greater-than p292 p958 )
    ( greater-than p292 p474 )
  )
  ( :tasks
    ( Deliver-4Pkg p970 p958 p474 p292 l124 )
  )
)
