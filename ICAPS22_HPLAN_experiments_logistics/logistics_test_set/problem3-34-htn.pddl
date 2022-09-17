( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l566 - location
    l752 - location
    l813 - location
    p950 - obj
    p507 - obj
    p13 - obj
    t1357 - truck
    t1238 - truck
  )
  ( :init
    ( in-city l566 c000 )
    ( in-city l752 c000 )
    ( in-city l813 c000 )
    ( obj-at p950 l813 )
    ( in-truck p507 t1238 )
    ( in-truck p13 t1357 )
    ( truck-at t1357 l813 )
    ( truck-at t1238 l566 )
    ( greater-than p507 p950 )
    ( greater-than p13 p950 )
    ( greater-than p13 p507 )
  )
  ( :tasks
    ( Deliver-3Pkg p950 p507 p13 l566 )
  )
)
