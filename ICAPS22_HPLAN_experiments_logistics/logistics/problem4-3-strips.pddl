( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-927 - location
    l000-586 - location
    l000-453 - location
    l000-509 - location
    l000-234 - location
    p913 - obj
    p550 - obj
    p902 - obj
    p276 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-927 c000 )
    ( in-city l000-586 c000 )
    ( in-city l000-453 c000 )
    ( in-city l000-509 c000 )
    ( in-city l000-234 c000 )
    ( obj-at p913 l000-453 )
    ( obj-at p550 l000-509 )
    ( obj-at p902 l000-586 )
    ( obj-at p276 l000-453 )
    ( greater-than p550 p913 )
    ( greater-than p902 p913 )
    ( greater-than p902 p550 )
    ( greater-than p276 p913 )
    ( greater-than p276 p550 )
    ( greater-than p276 p902 )
  )
  ( :goal
    ( and
      ( obj-at p913 l000-000 )
      ( obj-at p550 l000-000 )
      ( obj-at p902 l000-000 )
      ( obj-at p276 l000-000 )
    )
  )
)
