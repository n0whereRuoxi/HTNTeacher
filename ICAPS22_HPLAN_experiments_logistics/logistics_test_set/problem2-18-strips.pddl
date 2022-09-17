( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l58 - location
    l581 - location
    l846 - location
    p852 - obj
    p279 - obj
    t1253 - truck
  )
  ( :init
    ( in-city l58 c000 )
    ( in-city l581 c000 )
    ( in-city l846 c000 )
    ( in-truck p852 t1253 )
    ( obj-at p279 l581 )
    ( truck-at t1253 l58 )
    ( greater-than p279 p852 )
  )
  ( :goal
    ( and
      ( obj-at p852 l58 )
      ( obj-at p279 l58 )
    )
  )
)
