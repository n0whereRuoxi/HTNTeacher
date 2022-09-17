( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l209 - location
    l508 - location
    p262 - obj
    p655 - obj
    p522 - obj
    p607 - obj
    t1379 - truck
    t1605 - truck
    t1999 - truck
  )
  ( :init
    ( in-city l209 c000 )
    ( in-city l508 c000 )
    ( in-truck p262 t1605 )
    ( in-truck p655 t1999 )
    ( in-truck p522 t1379 )
    ( in-truck p607 t1999 )
    ( truck-at t1379 l508 )
    ( truck-at t1605 l209 )
    ( truck-at t1999 l508 )
    ( greater-than p655 p262 )
    ( greater-than p522 p262 )
    ( greater-than p522 p655 )
    ( greater-than p607 p262 )
    ( greater-than p607 p655 )
    ( greater-than p607 p522 )
  )
  ( :goal
    ( and
      ( obj-at p262 l209 )
      ( obj-at p655 l209 )
      ( obj-at p522 l209 )
      ( obj-at p607 l209 )
    )
  )
)
