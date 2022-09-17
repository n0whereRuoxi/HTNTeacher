( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-816 - location
    l000-810 - location
    p844 - obj
    p946 - obj
    p592 - obj
    p622 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-816 c000 )
    ( in-city l000-810 c000 )
    ( obj-at p844 l000-816 )
    ( obj-at p946 l000-816 )
    ( obj-at p592 l000-810 )
    ( obj-at p622 l000-816 )
    ( greater-than p946 p844 )
    ( greater-than p592 p844 )
    ( greater-than p592 p946 )
    ( greater-than p622 p844 )
    ( greater-than p622 p946 )
    ( greater-than p622 p592 )
  )
  ( :goal
    ( and
      ( obj-at p844 l000-000 )
      ( obj-at p946 l000-000 )
      ( obj-at p592 l000-000 )
      ( obj-at p622 l000-000 )
    )
  )
)
