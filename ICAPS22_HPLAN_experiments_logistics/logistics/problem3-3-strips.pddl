( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-266 - location
    l000-350 - location
    l000-590 - location
    p891 - obj
    p923 - obj
    p6 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-266 c000 )
    ( in-city l000-350 c000 )
    ( in-city l000-590 c000 )
    ( obj-at p891 l000-590 )
    ( obj-at p923 l000-350 )
    ( obj-at p6 l000-350 )
    ( greater-than p923 p891 )
    ( greater-than p6 p891 )
    ( greater-than p6 p923 )
  )
  ( :goal
    ( and
      ( obj-at p891 l000-000 )
      ( obj-at p923 l000-000 )
      ( obj-at p6 l000-000 )
    )
  )
)
