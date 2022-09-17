( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l452 - location
    l947 - location
    l396 - location
    l542 - location
    p589 - obj
    p977 - obj
    t1453 - truck
  )
  ( :init
    ( in-city l452 c000 )
    ( in-city l947 c000 )
    ( in-city l396 c000 )
    ( in-city l542 c000 )
    ( obj-at p589 l947 )
    ( in-truck p977 t1453 )
    ( truck-at t1453 l396 )
    ( greater-than p977 p589 )
  )
  ( :goal
    ( and
      ( obj-at p589 l452 )
      ( obj-at p977 l452 )
    )
  )
)
