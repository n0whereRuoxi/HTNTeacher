( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l256 - location
    l67 - location
    p32 - obj
    p554 - obj
    p55 - obj
    t1800 - truck
    t1295 - truck
  )
  ( :init
    ( in-city l256 c000 )
    ( in-city l67 c000 )
    ( obj-at p32 l67 )
    ( in-truck p554 t1295 )
    ( in-truck p55 t1295 )
    ( truck-at t1800 l67 )
    ( truck-at t1295 l256 )
    ( greater-than p554 p32 )
    ( greater-than p55 p32 )
    ( greater-than p55 p554 )
  )
  ( :goal
    ( and
      ( obj-at p32 l256 )
      ( obj-at p554 l256 )
      ( obj-at p55 l256 )
    )
  )
)
