( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l680 - location
    l686 - location
    l144 - location
    l558 - location
    l634 - location
    l159 - location
    l535 - location
    p668 - obj
    p474 - obj
    p870 - obj
    p95 - obj
    t1381 - truck
    t1766 - truck
    t1506 - truck
  )
  ( :init
    ( in-city l680 c000 )
    ( in-city l686 c000 )
    ( in-city l144 c000 )
    ( in-city l558 c000 )
    ( in-city l634 c000 )
    ( in-city l159 c000 )
    ( in-city l535 c000 )
    ( in-truck p668 t1506 )
    ( in-truck p474 t1766 )
    ( in-truck p870 t1381 )
    ( obj-at p95 l634 )
    ( truck-at t1381 l680 )
    ( truck-at t1766 l680 )
    ( truck-at t1506 l535 )
    ( greater-than p474 p668 )
    ( greater-than p870 p668 )
    ( greater-than p870 p474 )
    ( greater-than p95 p668 )
    ( greater-than p95 p474 )
    ( greater-than p95 p870 )
  )
  ( :tasks
    ( Deliver-4Pkg p668 p474 p870 p95 l680 )
  )
)
