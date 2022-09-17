( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l578 - location
    l161 - location
    l247 - location
    l426 - location
    l103 - location
    l88 - location
    p805 - obj
    p470 - obj
    p396 - obj
    t1115 - truck
    t1820 - truck
  )
  ( :init
    ( in-city l578 c000 )
    ( in-city l161 c000 )
    ( in-city l247 c000 )
    ( in-city l426 c000 )
    ( in-city l103 c000 )
    ( in-city l88 c000 )
    ( in-truck p805 t1115 )
    ( in-truck p470 t1115 )
    ( obj-at p396 l88 )
    ( truck-at t1115 l247 )
    ( truck-at t1820 l247 )
    ( greater-than p470 p805 )
    ( greater-than p396 p805 )
    ( greater-than p396 p470 )
  )
  ( :goal
    ( and
      ( obj-at p805 l578 )
      ( obj-at p470 l578 )
      ( obj-at p396 l578 )
    )
  )
)
