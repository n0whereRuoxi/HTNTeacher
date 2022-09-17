( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l170 - location
    l380 - location
    l141 - location
    p98 - obj
    p655 - obj
    t1136 - truck
  )
  ( :init
    ( in-city l170 c000 )
    ( in-city l380 c000 )
    ( in-city l141 c000 )
    ( in-truck p98 t1136 )
    ( obj-at p655 l141 )
    ( truck-at t1136 l380 )
    ( greater-than p655 p98 )
  )
  ( :goal
    ( and
      ( obj-at p98 l170 )
      ( obj-at p655 l170 )
    )
  )
)
