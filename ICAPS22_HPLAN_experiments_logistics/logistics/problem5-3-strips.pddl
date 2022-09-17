( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-601 - location
    l000-885 - location
    l000-819 - location
    p165 - obj
    p184 - obj
    p273 - obj
    p601 - obj
    p293 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-601 c000 )
    ( in-city l000-885 c000 )
    ( in-city l000-819 c000 )
    ( obj-at p165 l000-819 )
    ( obj-at p184 l000-885 )
    ( obj-at p273 l000-819 )
    ( obj-at p601 l000-885 )
    ( obj-at p293 l000-885 )
    ( greater-than p184 p165 )
    ( greater-than p273 p165 )
    ( greater-than p273 p184 )
    ( greater-than p601 p165 )
    ( greater-than p601 p184 )
    ( greater-than p601 p273 )
    ( greater-than p293 p165 )
    ( greater-than p293 p184 )
    ( greater-than p293 p273 )
    ( greater-than p293 p601 )
  )
  ( :goal
    ( and
      ( obj-at p165 l000-000 )
      ( obj-at p184 l000-000 )
      ( obj-at p273 l000-000 )
      ( obj-at p601 l000-000 )
      ( obj-at p293 l000-000 )
    )
  )
)
