( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l404 - location
    l796 - location
    l983 - location
    p807 - obj
    p444 - obj
    t1483 - truck
  )
  ( :init
    ( in-city l404 c000 )
    ( in-city l796 c000 )
    ( in-city l983 c000 )
    ( obj-at p807 l796 )
    ( in-truck p444 t1483 )
    ( truck-at t1483 l983 )
    ( greater-than p444 p807 )
  )
  ( :goal
    ( and
      ( obj-at p807 l404 )
      ( obj-at p444 l404 )
    )
  )
)
