( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l595 - location
    l40 - location
    l853 - location
    p578 - obj
    p649 - obj
    p406 - obj
    p658 - obj
    t1888 - truck
    t1018 - truck
    t1169 - truck
  )
  ( :init
    ( in-city l595 c000 )
    ( in-city l40 c000 )
    ( in-city l853 c000 )
    ( in-truck p578 t1018 )
    ( in-truck p649 t1169 )
    ( in-truck p406 t1018 )
    ( obj-at p658 l40 )
    ( truck-at t1888 l853 )
    ( truck-at t1018 l595 )
    ( truck-at t1169 l40 )
    ( greater-than p649 p578 )
    ( greater-than p406 p578 )
    ( greater-than p406 p649 )
    ( greater-than p658 p578 )
    ( greater-than p658 p649 )
    ( greater-than p658 p406 )
  )
  ( :tasks
    ( Deliver-4Pkg p578 p649 p406 p658 l595 )
  )
)
