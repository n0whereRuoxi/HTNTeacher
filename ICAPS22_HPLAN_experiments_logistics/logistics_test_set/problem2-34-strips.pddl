( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l919 - location
    p67 - obj
    p485 - obj
    t1865 - truck
  )
  ( :init
    ( in-city l919 c000 )
    ( in-truck p67 t1865 )
    ( in-truck p485 t1865 )
    ( truck-at t1865 l919 )
    ( greater-than p485 p67 )
  )
  ( :goal
    ( and
      ( obj-at p67 l919 )
      ( obj-at p485 l919 )
    )
  )
)
