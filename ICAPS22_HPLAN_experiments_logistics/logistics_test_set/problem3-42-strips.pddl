( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l392 - location
    l313 - location
    p396 - obj
    p878 - obj
    p877 - obj
    t1431 - truck
    t1510 - truck
  )
  ( :init
    ( in-city l392 c000 )
    ( in-city l313 c000 )
    ( in-truck p396 t1431 )
    ( obj-at p878 l313 )
    ( in-truck p877 t1510 )
    ( truck-at t1431 l392 )
    ( truck-at t1510 l392 )
    ( greater-than p878 p396 )
    ( greater-than p877 p396 )
    ( greater-than p877 p878 )
  )
  ( :goal
    ( and
      ( obj-at p396 l392 )
      ( obj-at p878 l392 )
      ( obj-at p877 l392 )
    )
  )
)
