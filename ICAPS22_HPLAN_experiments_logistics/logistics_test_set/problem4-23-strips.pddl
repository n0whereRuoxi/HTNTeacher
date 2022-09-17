( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l593 - location
    l315 - location
    p281 - obj
    p46 - obj
    p45 - obj
    p424 - obj
    t1932 - truck
    t1556 - truck
    t1653 - truck
  )
  ( :init
    ( in-city l593 c000 )
    ( in-city l315 c000 )
    ( in-truck p281 t1556 )
    ( in-truck p46 t1556 )
    ( in-truck p45 t1556 )
    ( obj-at p424 l315 )
    ( truck-at t1932 l593 )
    ( truck-at t1556 l593 )
    ( truck-at t1653 l593 )
    ( greater-than p46 p281 )
    ( greater-than p45 p281 )
    ( greater-than p45 p46 )
    ( greater-than p424 p281 )
    ( greater-than p424 p46 )
    ( greater-than p424 p45 )
  )
  ( :goal
    ( and
      ( obj-at p281 l593 )
      ( obj-at p46 l593 )
      ( obj-at p45 l593 )
      ( obj-at p424 l593 )
    )
  )
)
