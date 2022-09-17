( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l693 - location
    l393 - location
    l365 - location
    l828 - location
    l241 - location
    l888 - location
    l61 - location
    l633 - location
    l347 - location
    l709 - location
    l610 - location
    l931 - location
    l634 - location
    l528 - location
    p809 - obj
    p286 - obj
    p587 - obj
    p8 - obj
    p766 - obj
    p342 - obj
    p991 - obj
    t1487 - truck
    t1456 - truck
    t1944 - truck
    t1345 - truck
    t1718 - truck
    t1882 - truck
  )
  ( :init
    ( in-city l693 c000 )
    ( in-city l393 c000 )
    ( in-city l365 c000 )
    ( in-city l828 c000 )
    ( in-city l241 c000 )
    ( in-city l888 c000 )
    ( in-city l61 c000 )
    ( in-city l633 c000 )
    ( in-city l347 c000 )
    ( in-city l709 c000 )
    ( in-city l610 c000 )
    ( in-city l931 c000 )
    ( in-city l634 c000 )
    ( in-city l528 c000 )
    ( obj-at p809 l610 )
    ( obj-at p286 l393 )
    ( in-truck p587 t1345 )
    ( in-truck p8 t1487 )
    ( obj-at p766 l610 )
    ( obj-at p342 l528 )
    ( obj-at p991 l365 )
    ( truck-at t1487 l241 )
    ( truck-at t1456 l393 )
    ( truck-at t1944 l61 )
    ( truck-at t1345 l634 )
    ( truck-at t1718 l528 )
    ( truck-at t1882 l634 )
    ( greater-than p286 p809 )
    ( greater-than p587 p809 )
    ( greater-than p587 p286 )
    ( greater-than p8 p809 )
    ( greater-than p8 p286 )
    ( greater-than p8 p587 )
    ( greater-than p766 p809 )
    ( greater-than p766 p286 )
    ( greater-than p766 p587 )
    ( greater-than p766 p8 )
    ( greater-than p342 p809 )
    ( greater-than p342 p286 )
    ( greater-than p342 p587 )
    ( greater-than p342 p8 )
    ( greater-than p342 p766 )
    ( greater-than p991 p809 )
    ( greater-than p991 p286 )
    ( greater-than p991 p587 )
    ( greater-than p991 p8 )
    ( greater-than p991 p766 )
    ( greater-than p991 p342 )
  )
  ( :tasks
    ( Deliver-7Pkg p809 p286 p587 p8 p766 p342 p991 l693 )
  )
)
