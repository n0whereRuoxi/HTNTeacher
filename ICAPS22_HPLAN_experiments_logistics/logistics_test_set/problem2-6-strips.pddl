( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l89 - location
    l602 - location
    l388 - location
    p967 - obj
    p260 - obj
    t1520 - truck
  )
  ( :init
    ( in-city l89 c000 )
    ( in-city l602 c000 )
    ( in-city l388 c000 )
    ( obj-at p967 l388 )
    ( obj-at p260 l602 )
    ( truck-at t1520 l602 )
    ( greater-than p260 p967 )
  )
  ( :goal
    ( and
      ( obj-at p967 l89 )
      ( obj-at p260 l89 )
    )
  )
)
