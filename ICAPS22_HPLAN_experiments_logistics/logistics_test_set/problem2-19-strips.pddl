( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l707 - location
    p780 - obj
    p391 - obj
    t1608 - truck
  )
  ( :init
    ( in-city l707 c000 )
    ( in-truck p780 t1608 )
    ( in-truck p391 t1608 )
    ( truck-at t1608 l707 )
    ( greater-than p391 p780 )
  )
  ( :goal
    ( and
      ( obj-at p780 l707 )
      ( obj-at p391 l707 )
    )
  )
)
