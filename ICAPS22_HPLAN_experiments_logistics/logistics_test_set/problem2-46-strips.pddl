( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l509 - location
    p903 - obj
    p511 - obj
    t1250 - truck
  )
  ( :init
    ( in-city l509 c000 )
    ( in-truck p903 t1250 )
    ( in-truck p511 t1250 )
    ( truck-at t1250 l509 )
    ( greater-than p511 p903 )
  )
  ( :goal
    ( and
      ( obj-at p903 l509 )
      ( obj-at p511 l509 )
    )
  )
)
