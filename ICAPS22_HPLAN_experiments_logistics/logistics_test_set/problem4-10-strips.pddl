( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l34 - location
    l318 - location
    p378 - obj
    p146 - obj
    p522 - obj
    p765 - obj
    t1553 - truck
    t1429 - truck
    t1309 - truck
  )
  ( :init
    ( in-city l34 c000 )
    ( in-city l318 c000 )
    ( in-truck p378 t1309 )
    ( in-truck p146 t1553 )
    ( in-truck p522 t1309 )
    ( in-truck p765 t1309 )
    ( truck-at t1553 l318 )
    ( truck-at t1429 l34 )
    ( truck-at t1309 l34 )
    ( greater-than p146 p378 )
    ( greater-than p522 p378 )
    ( greater-than p522 p146 )
    ( greater-than p765 p378 )
    ( greater-than p765 p146 )
    ( greater-than p765 p522 )
  )
  ( :goal
    ( and
      ( obj-at p378 l34 )
      ( obj-at p146 l34 )
      ( obj-at p522 l34 )
      ( obj-at p765 l34 )
    )
  )
)
