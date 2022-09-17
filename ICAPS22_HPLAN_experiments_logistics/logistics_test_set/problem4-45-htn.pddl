( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l120 - location
    l283 - location
    l211 - location
    l163 - location
    p471 - obj
    p570 - obj
    p443 - obj
    p507 - obj
    t1832 - truck
    t1048 - truck
    t1715 - truck
  )
  ( :init
    ( in-city l120 c000 )
    ( in-city l283 c000 )
    ( in-city l211 c000 )
    ( in-city l163 c000 )
    ( in-truck p471 t1715 )
    ( obj-at p570 l211 )
    ( in-truck p443 t1832 )
    ( obj-at p507 l211 )
    ( truck-at t1832 l163 )
    ( truck-at t1048 l211 )
    ( truck-at t1715 l283 )
    ( greater-than p570 p471 )
    ( greater-than p443 p471 )
    ( greater-than p443 p570 )
    ( greater-than p507 p471 )
    ( greater-than p507 p570 )
    ( greater-than p507 p443 )
  )
  ( :tasks
    ( Deliver-4Pkg p471 p570 p443 p507 l120 )
  )
)
