( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-382 - location
    l000-401 - location
    l000-936 - location
    l000-290 - location
    l000-395 - location
    l000-273 - location
    l000-827 - location
    l000-99 - location
    l000-252 - location
    l000-596 - location
    l000-720 - location
    l000-365 - location
    l000-114 - location
    p462 - obj
    p622 - obj
    p652 - obj
    p610 - obj
    p50 - obj
    p840 - obj
    p804 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-382 c000 )
    ( in-city l000-401 c000 )
    ( in-city l000-936 c000 )
    ( in-city l000-290 c000 )
    ( in-city l000-395 c000 )
    ( in-city l000-273 c000 )
    ( in-city l000-827 c000 )
    ( in-city l000-99 c000 )
    ( in-city l000-252 c000 )
    ( in-city l000-596 c000 )
    ( in-city l000-720 c000 )
    ( in-city l000-365 c000 )
    ( in-city l000-114 c000 )
    ( obj-at p462 l000-827 )
    ( obj-at p622 l000-365 )
    ( obj-at p652 l000-382 )
    ( obj-at p610 l000-936 )
    ( obj-at p50 l000-720 )
    ( obj-at p840 l000-273 )
    ( obj-at p804 l000-273 )
    ( greater-than p622 p462 )
    ( greater-than p652 p462 )
    ( greater-than p652 p622 )
    ( greater-than p610 p462 )
    ( greater-than p610 p622 )
    ( greater-than p610 p652 )
    ( greater-than p50 p462 )
    ( greater-than p50 p622 )
    ( greater-than p50 p652 )
    ( greater-than p50 p610 )
    ( greater-than p840 p462 )
    ( greater-than p840 p622 )
    ( greater-than p840 p652 )
    ( greater-than p840 p610 )
    ( greater-than p840 p50 )
    ( greater-than p804 p462 )
    ( greater-than p804 p622 )
    ( greater-than p804 p652 )
    ( greater-than p804 p610 )
    ( greater-than p804 p50 )
    ( greater-than p804 p840 )
  )
  ( :goal
    ( and
      ( obj-at p462 l000-000 )
      ( obj-at p622 l000-000 )
      ( obj-at p652 l000-000 )
      ( obj-at p610 l000-000 )
      ( obj-at p50 l000-000 )
      ( obj-at p840 l000-000 )
      ( obj-at p804 l000-000 )
    )
  )
)
