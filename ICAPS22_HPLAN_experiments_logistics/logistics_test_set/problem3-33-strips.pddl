( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l83 - location
    l245 - location
    l81 - location
    l689 - location
    l238 - location
    l22 - location
    p598 - obj
    p752 - obj
    p667 - obj
    t1061 - truck
    t1263 - truck
  )
  ( :init
    ( in-city l83 c000 )
    ( in-city l245 c000 )
    ( in-city l81 c000 )
    ( in-city l689 c000 )
    ( in-city l238 c000 )
    ( in-city l22 c000 )
    ( obj-at p598 l238 )
    ( obj-at p752 l22 )
    ( in-truck p667 t1263 )
    ( truck-at t1061 l83 )
    ( truck-at t1263 l22 )
    ( greater-than p752 p598 )
    ( greater-than p667 p598 )
    ( greater-than p667 p752 )
  )
  ( :goal
    ( and
      ( obj-at p598 l83 )
      ( obj-at p752 l83 )
      ( obj-at p667 l83 )
    )
  )
)
