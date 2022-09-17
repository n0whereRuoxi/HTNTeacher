( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l74 - location
    l131 - location
    l895 - location
    p52 - obj
    p83 - obj
    p212 - obj
    p619 - obj
    t1236 - truck
    t1735 - truck
    t1266 - truck
  )
  ( :init
    ( in-city l74 c000 )
    ( in-city l131 c000 )
    ( in-city l895 c000 )
    ( obj-at p52 l131 )
    ( in-truck p83 t1236 )
    ( in-truck p212 t1735 )
    ( in-truck p619 t1266 )
    ( truck-at t1236 l74 )
    ( truck-at t1735 l131 )
    ( truck-at t1266 l74 )
    ( greater-than p83 p52 )
    ( greater-than p212 p52 )
    ( greater-than p212 p83 )
    ( greater-than p619 p52 )
    ( greater-than p619 p83 )
    ( greater-than p619 p212 )
  )
  ( :goal
    ( and
      ( obj-at p52 l74 )
      ( obj-at p83 l74 )
      ( obj-at p212 l74 )
      ( obj-at p619 l74 )
    )
  )
)
