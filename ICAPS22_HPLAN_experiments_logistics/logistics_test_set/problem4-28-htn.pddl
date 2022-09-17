( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l727 - location
    l669 - location
    l430 - location
    l823 - location
    p44 - obj
    p365 - obj
    p992 - obj
    p314 - obj
    t1674 - truck
    t1707 - truck
    t1089 - truck
  )
  ( :init
    ( in-city l727 c000 )
    ( in-city l669 c000 )
    ( in-city l430 c000 )
    ( in-city l823 c000 )
    ( in-truck p44 t1674 )
    ( in-truck p365 t1674 )
    ( in-truck p992 t1707 )
    ( in-truck p314 t1089 )
    ( truck-at t1674 l823 )
    ( truck-at t1707 l430 )
    ( truck-at t1089 l727 )
    ( greater-than p365 p44 )
    ( greater-than p992 p44 )
    ( greater-than p992 p365 )
    ( greater-than p314 p44 )
    ( greater-than p314 p365 )
    ( greater-than p314 p992 )
  )
  ( :tasks
    ( Deliver-4Pkg p44 p365 p992 p314 l727 )
  )
)
