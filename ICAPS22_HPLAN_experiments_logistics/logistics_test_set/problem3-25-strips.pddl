( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l241 - location
    l714 - location
    l916 - location
    p181 - obj
    p477 - obj
    p408 - obj
    t1954 - truck
    t1715 - truck
  )
  ( :init
    ( in-city l241 c000 )
    ( in-city l714 c000 )
    ( in-city l916 c000 )
    ( in-truck p181 t1715 )
    ( in-truck p477 t1715 )
    ( obj-at p408 l916 )
    ( truck-at t1954 l241 )
    ( truck-at t1715 l714 )
    ( greater-than p477 p181 )
    ( greater-than p408 p181 )
    ( greater-than p408 p477 )
  )
  ( :goal
    ( and
      ( obj-at p181 l241 )
      ( obj-at p477 l241 )
      ( obj-at p408 l241 )
    )
  )
)
