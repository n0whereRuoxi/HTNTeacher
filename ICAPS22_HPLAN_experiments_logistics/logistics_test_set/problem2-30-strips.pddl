( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l364 - location
    l406 - location
    l980 - location
    p596 - obj
    p767 - obj
    t1516 - truck
  )
  ( :init
    ( in-city l364 c000 )
    ( in-city l406 c000 )
    ( in-city l980 c000 )
    ( obj-at p596 l980 )
    ( obj-at p767 l980 )
    ( truck-at t1516 l980 )
    ( greater-than p767 p596 )
  )
  ( :goal
    ( and
      ( obj-at p596 l364 )
      ( obj-at p767 l364 )
    )
  )
)
