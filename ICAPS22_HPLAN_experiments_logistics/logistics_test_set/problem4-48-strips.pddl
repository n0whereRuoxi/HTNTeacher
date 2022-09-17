( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l474 - location
    l600 - location
    l824 - location
    l572 - location
    p689 - obj
    p289 - obj
    p237 - obj
    p810 - obj
    t1973 - truck
    t1910 - truck
    t1025 - truck
  )
  ( :init
    ( in-city l474 c000 )
    ( in-city l600 c000 )
    ( in-city l824 c000 )
    ( in-city l572 c000 )
    ( obj-at p689 l572 )
    ( obj-at p289 l572 )
    ( obj-at p237 l572 )
    ( obj-at p810 l572 )
    ( truck-at t1973 l474 )
    ( truck-at t1910 l600 )
    ( truck-at t1025 l824 )
    ( greater-than p289 p689 )
    ( greater-than p237 p689 )
    ( greater-than p237 p289 )
    ( greater-than p810 p689 )
    ( greater-than p810 p289 )
    ( greater-than p810 p237 )
  )
  ( :goal
    ( and
      ( obj-at p689 l474 )
      ( obj-at p289 l474 )
      ( obj-at p237 l474 )
      ( obj-at p810 l474 )
    )
  )
)
