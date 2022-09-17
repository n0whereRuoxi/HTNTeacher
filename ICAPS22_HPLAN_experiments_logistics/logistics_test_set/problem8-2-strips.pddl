( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l473 - location
    l391 - location
    l483 - location
    l474 - location
    l758 - location
    l853 - location
    l485 - location
    l79 - location
    l411 - location
    p724 - obj
    p282 - obj
    p120 - obj
    p341 - obj
    p815 - obj
    p658 - obj
    p812 - obj
    p384 - obj
    t1026 - truck
    t1338 - truck
    t1975 - truck
    t1717 - truck
    t1948 - truck
    t1488 - truck
    t1175 - truck
  )
  ( :init
    ( in-city l473 c000 )
    ( in-city l391 c000 )
    ( in-city l483 c000 )
    ( in-city l474 c000 )
    ( in-city l758 c000 )
    ( in-city l853 c000 )
    ( in-city l485 c000 )
    ( in-city l79 c000 )
    ( in-city l411 c000 )
    ( in-truck p724 t1488 )
    ( obj-at p282 l474 )
    ( in-truck p120 t1488 )
    ( obj-at p341 l79 )
    ( in-truck p815 t1338 )
    ( obj-at p658 l411 )
    ( obj-at p812 l853 )
    ( in-truck p384 t1975 )
    ( truck-at t1026 l473 )
    ( truck-at t1338 l758 )
    ( truck-at t1975 l473 )
    ( truck-at t1717 l485 )
    ( truck-at t1948 l485 )
    ( truck-at t1488 l79 )
    ( truck-at t1175 l483 )
    ( greater-than p282 p724 )
    ( greater-than p120 p724 )
    ( greater-than p120 p282 )
    ( greater-than p341 p724 )
    ( greater-than p341 p282 )
    ( greater-than p341 p120 )
    ( greater-than p815 p724 )
    ( greater-than p815 p282 )
    ( greater-than p815 p120 )
    ( greater-than p815 p341 )
    ( greater-than p658 p724 )
    ( greater-than p658 p282 )
    ( greater-than p658 p120 )
    ( greater-than p658 p341 )
    ( greater-than p658 p815 )
    ( greater-than p812 p724 )
    ( greater-than p812 p282 )
    ( greater-than p812 p120 )
    ( greater-than p812 p341 )
    ( greater-than p812 p815 )
    ( greater-than p812 p658 )
    ( greater-than p384 p724 )
    ( greater-than p384 p282 )
    ( greater-than p384 p120 )
    ( greater-than p384 p341 )
    ( greater-than p384 p815 )
    ( greater-than p384 p658 )
    ( greater-than p384 p812 )
  )
  ( :goal
    ( and
      ( obj-at p724 l473 )
      ( obj-at p282 l473 )
      ( obj-at p120 l473 )
      ( obj-at p341 l473 )
      ( obj-at p815 l473 )
      ( obj-at p658 l473 )
      ( obj-at p812 l473 )
      ( obj-at p384 l473 )
    )
  )
)
