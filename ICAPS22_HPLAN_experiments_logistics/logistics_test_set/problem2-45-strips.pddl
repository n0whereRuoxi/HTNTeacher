( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l978 - location
    p47 - obj
    p700 - obj
    t1343 - truck
  )
  ( :init
    ( in-city l978 c000 )
    ( in-truck p47 t1343 )
    ( in-truck p700 t1343 )
    ( truck-at t1343 l978 )
    ( greater-than p700 p47 )
  )
  ( :goal
    ( and
      ( obj-at p47 l978 )
      ( obj-at p700 l978 )
    )
  )
)