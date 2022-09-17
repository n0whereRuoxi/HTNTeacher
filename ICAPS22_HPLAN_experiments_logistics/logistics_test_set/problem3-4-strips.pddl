( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l188 - location
    l656 - location
    p635 - obj
    p868 - obj
    p409 - obj
    t1637 - truck
    t1927 - truck
  )
  ( :init
    ( in-city l188 c000 )
    ( in-city l656 c000 )
    ( in-truck p635 t1927 )
    ( obj-at p868 l656 )
    ( in-truck p409 t1637 )
    ( truck-at t1637 l656 )
    ( truck-at t1927 l656 )
    ( greater-than p868 p635 )
    ( greater-than p409 p635 )
    ( greater-than p409 p868 )
  )
  ( :goal
    ( and
      ( obj-at p635 l188 )
      ( obj-at p868 l188 )
      ( obj-at p409 l188 )
    )
  )
)
