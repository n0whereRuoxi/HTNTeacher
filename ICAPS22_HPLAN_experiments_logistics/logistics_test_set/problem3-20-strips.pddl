( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l734 - location
    l510 - location
    l645 - location
    p255 - obj
    p294 - obj
    p243 - obj
    t1482 - truck
    t1092 - truck
  )
  ( :init
    ( in-city l734 c000 )
    ( in-city l510 c000 )
    ( in-city l645 c000 )
    ( obj-at p255 l510 )
    ( in-truck p294 t1482 )
    ( in-truck p243 t1482 )
    ( truck-at t1482 l645 )
    ( truck-at t1092 l645 )
    ( greater-than p294 p255 )
    ( greater-than p243 p255 )
    ( greater-than p243 p294 )
  )
  ( :goal
    ( and
      ( obj-at p255 l734 )
      ( obj-at p294 l734 )
      ( obj-at p243 l734 )
    )
  )
)
