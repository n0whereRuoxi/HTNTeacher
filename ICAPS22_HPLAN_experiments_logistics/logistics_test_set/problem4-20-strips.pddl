( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l259 - location
    l983 - location
    l773 - location
    p994 - obj
    p305 - obj
    p64 - obj
    p510 - obj
    t1621 - truck
    t1544 - truck
    t1112 - truck
  )
  ( :init
    ( in-city l259 c000 )
    ( in-city l983 c000 )
    ( in-city l773 c000 )
    ( obj-at p994 l773 )
    ( obj-at p305 l983 )
    ( in-truck p64 t1112 )
    ( in-truck p510 t1544 )
    ( truck-at t1621 l983 )
    ( truck-at t1544 l983 )
    ( truck-at t1112 l773 )
    ( greater-than p305 p994 )
    ( greater-than p64 p994 )
    ( greater-than p64 p305 )
    ( greater-than p510 p994 )
    ( greater-than p510 p305 )
    ( greater-than p510 p64 )
  )
  ( :goal
    ( and
      ( obj-at p994 l259 )
      ( obj-at p305 l259 )
      ( obj-at p64 l259 )
      ( obj-at p510 l259 )
    )
  )
)
