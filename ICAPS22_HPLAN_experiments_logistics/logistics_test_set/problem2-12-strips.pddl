( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l285 - location
    p728 - obj
    p87 - obj
    t1377 - truck
  )
  ( :init
    ( in-city l285 c000 )
    ( in-truck p728 t1377 )
    ( in-truck p87 t1377 )
    ( truck-at t1377 l285 )
    ( greater-than p87 p728 )
  )
  ( :goal
    ( and
      ( obj-at p728 l285 )
      ( obj-at p87 l285 )
    )
  )
)
