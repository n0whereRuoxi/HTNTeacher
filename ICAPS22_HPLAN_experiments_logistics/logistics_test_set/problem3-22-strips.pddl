( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l556 - location
    l821 - location
    l15 - location
    p955 - obj
    p56 - obj
    p851 - obj
    t1151 - truck
    t1631 - truck
  )
  ( :init
    ( in-city l556 c000 )
    ( in-city l821 c000 )
    ( in-city l15 c000 )
    ( obj-at p955 l15 )
    ( obj-at p56 l821 )
    ( in-truck p851 t1151 )
    ( truck-at t1151 l556 )
    ( truck-at t1631 l821 )
    ( greater-than p56 p955 )
    ( greater-than p851 p955 )
    ( greater-than p851 p56 )
  )
  ( :goal
    ( and
      ( obj-at p955 l556 )
      ( obj-at p56 l556 )
      ( obj-at p851 l556 )
    )
  )
)
