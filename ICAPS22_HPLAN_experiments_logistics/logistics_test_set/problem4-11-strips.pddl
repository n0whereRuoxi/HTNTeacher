( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l63 - location
    l829 - location
    l220 - location
    l22 - location
    l979 - location
    l840 - location
    p664 - obj
    p711 - obj
    p411 - obj
    p265 - obj
    t1851 - truck
    t1999 - truck
    t1329 - truck
  )
  ( :init
    ( in-city l63 c000 )
    ( in-city l829 c000 )
    ( in-city l220 c000 )
    ( in-city l22 c000 )
    ( in-city l979 c000 )
    ( in-city l840 c000 )
    ( in-truck p664 t1329 )
    ( obj-at p711 l220 )
    ( obj-at p411 l829 )
    ( in-truck p265 t1329 )
    ( truck-at t1851 l220 )
    ( truck-at t1999 l840 )
    ( truck-at t1329 l22 )
    ( greater-than p711 p664 )
    ( greater-than p411 p664 )
    ( greater-than p411 p711 )
    ( greater-than p265 p664 )
    ( greater-than p265 p711 )
    ( greater-than p265 p411 )
  )
  ( :goal
    ( and
      ( obj-at p664 l63 )
      ( obj-at p711 l63 )
      ( obj-at p411 l63 )
      ( obj-at p265 l63 )
    )
  )
)
