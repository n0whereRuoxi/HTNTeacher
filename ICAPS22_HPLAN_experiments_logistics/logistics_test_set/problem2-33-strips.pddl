( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l254 - location
    l859 - location
    p320 - obj
    p566 - obj
    t1143 - truck
  )
  ( :init
    ( in-city l254 c000 )
    ( in-city l859 c000 )
    ( obj-at p320 l859 )
    ( in-truck p566 t1143 )
    ( truck-at t1143 l254 )
    ( greater-than p566 p320 )
  )
  ( :goal
    ( and
      ( obj-at p320 l254 )
      ( obj-at p566 l254 )
    )
  )
)
