( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l397 - location
    l846 - location
    p410 - obj
    p859 - obj
    p505 - obj
    p464 - obj
    t1094 - truck
    t1642 - truck
    t1783 - truck
  )
  ( :init
    ( in-city l397 c000 )
    ( in-city l846 c000 )
    ( obj-at p410 l846 )
    ( in-truck p859 t1783 )
    ( in-truck p505 t1642 )
    ( in-truck p464 t1094 )
    ( truck-at t1094 l846 )
    ( truck-at t1642 l397 )
    ( truck-at t1783 l397 )
    ( greater-than p859 p410 )
    ( greater-than p505 p410 )
    ( greater-than p505 p859 )
    ( greater-than p464 p410 )
    ( greater-than p464 p859 )
    ( greater-than p464 p505 )
  )
  ( :goal
    ( and
      ( obj-at p410 l397 )
      ( obj-at p859 l397 )
      ( obj-at p505 l397 )
      ( obj-at p464 l397 )
    )
  )
)
