( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l351 - location
    l949 - location
    l226 - location
    l461 - location
    p3 - obj
    p329 - obj
    p802 - obj
    t1835 - truck
    t1888 - truck
  )
  ( :init
    ( in-city l351 c000 )
    ( in-city l949 c000 )
    ( in-city l226 c000 )
    ( in-city l461 c000 )
    ( in-truck p3 t1835 )
    ( obj-at p329 l461 )
    ( obj-at p802 l461 )
    ( truck-at t1835 l949 )
    ( truck-at t1888 l351 )
    ( greater-than p329 p3 )
    ( greater-than p802 p3 )
    ( greater-than p802 p329 )
  )
  ( :goal
    ( and
      ( obj-at p3 l351 )
      ( obj-at p329 l351 )
      ( obj-at p802 l351 )
    )
  )
)
