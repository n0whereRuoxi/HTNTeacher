( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-770 - location
    l000-660 - location
    p225 - obj
    p254 - obj
    p141 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-770 c000 )
    ( in-city l000-660 c000 )
    ( obj-at p225 l000-660 )
    ( obj-at p254 l000-660 )
    ( obj-at p141 l000-770 )
    ( greater-than p254 p225 )
    ( greater-than p141 p225 )
    ( greater-than p141 p254 )
  )
  ( :goal
    ( and
      ( obj-at p225 l000-000 )
      ( obj-at p254 l000-000 )
      ( obj-at p141 l000-000 )
    )
  )
)
