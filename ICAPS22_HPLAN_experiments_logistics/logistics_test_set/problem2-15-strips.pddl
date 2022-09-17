( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l77 - location
    l763 - location
    l14 - location
    p58 - obj
    p362 - obj
    t1289 - truck
  )
  ( :init
    ( in-city l77 c000 )
    ( in-city l763 c000 )
    ( in-city l14 c000 )
    ( in-truck p58 t1289 )
    ( obj-at p362 l763 )
    ( truck-at t1289 l77 )
    ( greater-than p362 p58 )
  )
  ( :goal
    ( and
      ( obj-at p58 l77 )
      ( obj-at p362 l77 )
    )
  )
)
