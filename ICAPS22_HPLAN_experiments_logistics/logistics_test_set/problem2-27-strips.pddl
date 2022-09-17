( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l758 - location
    l553 - location
    l683 - location
    p241 - obj
    p177 - obj
    t1371 - truck
  )
  ( :init
    ( in-city l758 c000 )
    ( in-city l553 c000 )
    ( in-city l683 c000 )
    ( obj-at p241 l683 )
    ( in-truck p177 t1371 )
    ( truck-at t1371 l553 )
    ( greater-than p177 p241 )
  )
  ( :goal
    ( and
      ( obj-at p241 l758 )
      ( obj-at p177 l758 )
    )
  )
)
