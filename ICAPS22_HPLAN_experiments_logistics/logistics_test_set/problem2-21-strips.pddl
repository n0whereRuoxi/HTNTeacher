( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l569 - location
    l410 - location
    l359 - location
    p320 - obj
    p299 - obj
    t1330 - truck
  )
  ( :init
    ( in-city l569 c000 )
    ( in-city l410 c000 )
    ( in-city l359 c000 )
    ( in-truck p320 t1330 )
    ( in-truck p299 t1330 )
    ( truck-at t1330 l410 )
    ( greater-than p299 p320 )
  )
  ( :goal
    ( and
      ( obj-at p320 l569 )
      ( obj-at p299 l569 )
    )
  )
)
