( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l301 - location
    l269 - location
    l758 - location
    l914 - location
    l754 - location
    p251 - obj
    p705 - obj
    p809 - obj
    p46 - obj
    p4 - obj
    t1201 - truck
    t1335 - truck
    t1458 - truck
    t1189 - truck
  )
  ( :init
    ( in-city l301 c000 )
    ( in-city l269 c000 )
    ( in-city l758 c000 )
    ( in-city l914 c000 )
    ( in-city l754 c000 )
    ( in-truck p251 t1335 )
    ( obj-at p705 l758 )
    ( obj-at p809 l269 )
    ( obj-at p46 l914 )
    ( in-truck p4 t1201 )
    ( truck-at t1201 l301 )
    ( truck-at t1335 l301 )
    ( truck-at t1458 l754 )
    ( truck-at t1189 l758 )
    ( greater-than p705 p251 )
    ( greater-than p809 p251 )
    ( greater-than p809 p705 )
    ( greater-than p46 p251 )
    ( greater-than p46 p705 )
    ( greater-than p46 p809 )
    ( greater-than p4 p251 )
    ( greater-than p4 p705 )
    ( greater-than p4 p809 )
    ( greater-than p4 p46 )
  )
  ( :tasks
    ( Deliver-5Pkg p251 p705 p809 p46 p4 l301 )
  )
)
