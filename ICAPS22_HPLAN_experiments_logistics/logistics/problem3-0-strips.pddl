( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-957 - location
    l000-83 - location
    l000-564 - location
    p411 - obj
    p92 - obj
    p155 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-957 c000 )
    ( in-city l000-83 c000 )
    ( in-city l000-564 c000 )
    ( obj-at p411 l000-564 )
    ( obj-at p92 l000-83 )
    ( obj-at p155 l000-83 )
    ( greater-than p92 p411 )
    ( greater-than p155 p411 )
    ( greater-than p155 p92 )
  )
  ( :goal
    ( and
      ( obj-at p411 l000-000 )
      ( obj-at p92 l000-000 )
      ( obj-at p155 l000-000 )
    )
  )
)
