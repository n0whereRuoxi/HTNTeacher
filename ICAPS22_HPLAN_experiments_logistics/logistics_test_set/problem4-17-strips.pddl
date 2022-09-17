( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l790 - location
    l897 - location
    l568 - location
    l26 - location
    l528 - location
    l797 - location
    l157 - location
    l296 - location
    p941 - obj
    p968 - obj
    p486 - obj
    p137 - obj
    t1232 - truck
    t1740 - truck
    t1250 - truck
  )
  ( :init
    ( in-city l790 c000 )
    ( in-city l897 c000 )
    ( in-city l568 c000 )
    ( in-city l26 c000 )
    ( in-city l528 c000 )
    ( in-city l797 c000 )
    ( in-city l157 c000 )
    ( in-city l296 c000 )
    ( obj-at p941 l296 )
    ( obj-at p968 l296 )
    ( obj-at p486 l26 )
    ( obj-at p137 l157 )
    ( truck-at t1232 l897 )
    ( truck-at t1740 l797 )
    ( truck-at t1250 l568 )
    ( greater-than p968 p941 )
    ( greater-than p486 p941 )
    ( greater-than p486 p968 )
    ( greater-than p137 p941 )
    ( greater-than p137 p968 )
    ( greater-than p137 p486 )
  )
  ( :goal
    ( and
      ( obj-at p941 l790 )
      ( obj-at p968 l790 )
      ( obj-at p486 l790 )
      ( obj-at p137 l790 )
    )
  )
)
