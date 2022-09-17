( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l709 - location
    l670 - location
    l442 - location
    p663 - obj
    p126 - obj
    p754 - obj
    p231 - obj
    t1178 - truck
    t1192 - truck
    t1257 - truck
  )
  ( :init
    ( in-city l709 c000 )
    ( in-city l670 c000 )
    ( in-city l442 c000 )
    ( in-truck p663 t1178 )
    ( obj-at p126 l442 )
    ( obj-at p754 l442 )
    ( obj-at p231 l442 )
    ( truck-at t1178 l670 )
    ( truck-at t1192 l670 )
    ( truck-at t1257 l670 )
    ( greater-than p126 p663 )
    ( greater-than p754 p663 )
    ( greater-than p754 p126 )
    ( greater-than p231 p663 )
    ( greater-than p231 p126 )
    ( greater-than p231 p754 )
  )
  ( :goal
    ( and
      ( obj-at p663 l709 )
      ( obj-at p126 l709 )
      ( obj-at p754 l709 )
      ( obj-at p231 l709 )
    )
  )
)
