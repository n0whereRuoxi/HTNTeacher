( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l305 - location
    l152 - location
    l478 - location
    p767 - obj
    p282 - obj
    p995 - obj
    t1523 - truck
    t1585 - truck
  )
  ( :init
    ( in-city l305 c000 )
    ( in-city l152 c000 )
    ( in-city l478 c000 )
    ( in-truck p767 t1585 )
    ( in-truck p282 t1585 )
    ( in-truck p995 t1523 )
    ( truck-at t1523 l478 )
    ( truck-at t1585 l152 )
    ( greater-than p282 p767 )
    ( greater-than p995 p767 )
    ( greater-than p995 p282 )
  )
  ( :goal
    ( and
      ( obj-at p767 l305 )
      ( obj-at p282 l305 )
      ( obj-at p995 l305 )
    )
  )
)
