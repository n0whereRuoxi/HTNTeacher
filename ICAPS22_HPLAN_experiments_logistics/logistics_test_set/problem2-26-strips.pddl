( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l575 - location
    l995 - location
    p381 - obj
    p532 - obj
    t1108 - truck
  )
  ( :init
    ( in-city l575 c000 )
    ( in-city l995 c000 )
    ( obj-at p381 l995 )
    ( in-truck p532 t1108 )
    ( truck-at t1108 l575 )
    ( greater-than p532 p381 )
  )
  ( :goal
    ( and
      ( obj-at p381 l575 )
      ( obj-at p532 l575 )
    )
  )
)
