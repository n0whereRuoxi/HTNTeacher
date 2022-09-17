( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l129 - location
    l608 - location
    l212 - location
    p924 - obj
    p707 - obj
    t1009 - truck
  )
  ( :init
    ( in-city l129 c000 )
    ( in-city l608 c000 )
    ( in-city l212 c000 )
    ( in-truck p924 t1009 )
    ( obj-at p707 l608 )
    ( truck-at t1009 l129 )
    ( greater-than p707 p924 )
  )
  ( :goal
    ( and
      ( obj-at p924 l129 )
      ( obj-at p707 l129 )
    )
  )
)
