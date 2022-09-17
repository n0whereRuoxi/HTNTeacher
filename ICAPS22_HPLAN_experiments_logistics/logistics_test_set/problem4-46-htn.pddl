( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l130 - location
    l994 - location
    l986 - location
    l182 - location
    l585 - location
    l18 - location
    l656 - location
    l313 - location
    p610 - obj
    p127 - obj
    p287 - obj
    p840 - obj
    t1558 - truck
    t1697 - truck
    t1636 - truck
  )
  ( :init
    ( in-city l130 c000 )
    ( in-city l994 c000 )
    ( in-city l986 c000 )
    ( in-city l182 c000 )
    ( in-city l585 c000 )
    ( in-city l18 c000 )
    ( in-city l656 c000 )
    ( in-city l313 c000 )
    ( in-truck p610 t1697 )
    ( obj-at p127 l313 )
    ( in-truck p287 t1636 )
    ( obj-at p840 l656 )
    ( truck-at t1558 l313 )
    ( truck-at t1697 l182 )
    ( truck-at t1636 l182 )
    ( greater-than p127 p610 )
    ( greater-than p287 p610 )
    ( greater-than p287 p127 )
    ( greater-than p840 p610 )
    ( greater-than p840 p127 )
    ( greater-than p840 p287 )
  )
  ( :tasks
    ( Deliver-4Pkg p610 p127 p287 p840 l130 )
  )
)
