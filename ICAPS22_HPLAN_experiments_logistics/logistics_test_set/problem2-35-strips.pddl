( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l638 - location
    p356 - obj
    p306 - obj
    t1440 - truck
  )
  ( :init
    ( in-city l638 c000 )
    ( in-truck p356 t1440 )
    ( in-truck p306 t1440 )
    ( truck-at t1440 l638 )
    ( greater-than p306 p356 )
  )
  ( :goal
    ( and
      ( obj-at p356 l638 )
      ( obj-at p306 l638 )
    )
  )
)
