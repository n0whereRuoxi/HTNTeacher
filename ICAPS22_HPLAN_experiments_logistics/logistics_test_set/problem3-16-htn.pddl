( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l968 - location
    l782 - location
    l336 - location
    l584 - location
    l520 - location
    p901 - obj
    p925 - obj
    p903 - obj
    t1236 - truck
    t1378 - truck
  )
  ( :init
    ( in-city l968 c000 )
    ( in-city l782 c000 )
    ( in-city l336 c000 )
    ( in-city l584 c000 )
    ( in-city l520 c000 )
    ( obj-at p901 l520 )
    ( obj-at p925 l520 )
    ( obj-at p903 l520 )
    ( truck-at t1236 l336 )
    ( truck-at t1378 l968 )
    ( greater-than p925 p901 )
    ( greater-than p903 p901 )
    ( greater-than p903 p925 )
  )
  ( :tasks
    ( Deliver-3Pkg p901 p925 p903 l968 )
  )
)
