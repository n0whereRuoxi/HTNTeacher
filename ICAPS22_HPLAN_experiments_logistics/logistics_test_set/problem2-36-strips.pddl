( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l25 - location
    l718 - location
    p148 - obj
    p883 - obj
    t1548 - truck
  )
  ( :init
    ( in-city l25 c000 )
    ( in-city l718 c000 )
    ( in-truck p148 t1548 )
    ( in-truck p883 t1548 )
    ( truck-at t1548 l718 )
    ( greater-than p883 p148 )
  )
  ( :goal
    ( and
      ( obj-at p148 l25 )
      ( obj-at p883 l25 )
    )
  )
)
