( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l466 - location
    l44 - location
    l587 - location
    p909 - obj
    p411 - obj
    p996 - obj
    t1322 - truck
    t1647 - truck
  )
  ( :init
    ( in-city l466 c000 )
    ( in-city l44 c000 )
    ( in-city l587 c000 )
    ( obj-at p909 l44 )
    ( obj-at p411 l587 )
    ( in-truck p996 t1322 )
    ( truck-at t1322 l466 )
    ( truck-at t1647 l44 )
    ( greater-than p411 p909 )
    ( greater-than p996 p909 )
    ( greater-than p996 p411 )
  )
  ( :goal
    ( and
      ( obj-at p909 l466 )
      ( obj-at p411 l466 )
      ( obj-at p996 l466 )
    )
  )
)
