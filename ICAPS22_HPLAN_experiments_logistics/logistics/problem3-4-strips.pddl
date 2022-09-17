( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-554 - location
    l000-308 - location
    l000-429 - location
    l000-233 - location
    l000-946 - location
    l000-863 - location
    p444 - obj
    p217 - obj
    p573 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-554 c000 )
    ( in-city l000-308 c000 )
    ( in-city l000-429 c000 )
    ( in-city l000-233 c000 )
    ( in-city l000-946 c000 )
    ( in-city l000-863 c000 )
    ( obj-at p444 l000-233 )
    ( obj-at p217 l000-308 )
    ( obj-at p573 l000-308 )
    ( greater-than p217 p444 )
    ( greater-than p573 p444 )
    ( greater-than p573 p217 )
  )
  ( :goal
    ( and
      ( obj-at p444 l000-000 )
      ( obj-at p217 l000-000 )
      ( obj-at p573 l000-000 )
    )
  )
)
