( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l134 - location
    l687 - location
    l299 - location
    p298 - obj
    p542 - obj
    t1143 - truck
  )
  ( :init
    ( in-city l134 c000 )
    ( in-city l687 c000 )
    ( in-city l299 c000 )
    ( in-truck p298 t1143 )
    ( obj-at p542 l687 )
    ( truck-at t1143 l299 )
    ( greater-than p542 p298 )
  )
  ( :goal
    ( and
      ( obj-at p298 l134 )
      ( obj-at p542 l134 )
    )
  )
)
