( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l934 - location
    l749 - location
    l617 - location
    p956 - obj
    p20 - obj
    p453 - obj
    p440 - obj
    t1142 - truck
    t1555 - truck
    t1902 - truck
  )
  ( :init
    ( in-city l934 c000 )
    ( in-city l749 c000 )
    ( in-city l617 c000 )
    ( in-truck p956 t1142 )
    ( in-truck p20 t1555 )
    ( obj-at p453 l617 )
    ( in-truck p440 t1902 )
    ( truck-at t1142 l934 )
    ( truck-at t1555 l934 )
    ( truck-at t1902 l617 )
    ( greater-than p20 p956 )
    ( greater-than p453 p956 )
    ( greater-than p453 p20 )
    ( greater-than p440 p956 )
    ( greater-than p440 p20 )
    ( greater-than p440 p453 )
  )
  ( :goal
    ( and
      ( obj-at p956 l934 )
      ( obj-at p20 l934 )
      ( obj-at p453 l934 )
      ( obj-at p440 l934 )
    )
  )
)
