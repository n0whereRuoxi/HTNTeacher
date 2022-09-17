( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-815 - location
    l000-741 - location
    l000-419 - location
    l000-997 - location
    l000-477 - location
    l000-359 - location
    l000-697 - location
    l000-314 - location
    p666 - obj
    p273 - obj
    p828 - obj
    p437 - obj
    p994 - obj
    p72 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-815 c000 )
    ( in-city l000-741 c000 )
    ( in-city l000-419 c000 )
    ( in-city l000-997 c000 )
    ( in-city l000-477 c000 )
    ( in-city l000-359 c000 )
    ( in-city l000-697 c000 )
    ( in-city l000-314 c000 )
    ( obj-at p666 l000-997 )
    ( obj-at p273 l000-997 )
    ( obj-at p828 l000-697 )
    ( obj-at p437 l000-477 )
    ( obj-at p994 l000-997 )
    ( obj-at p72 l000-697 )
    ( greater-than p273 p666 )
    ( greater-than p828 p666 )
    ( greater-than p828 p273 )
    ( greater-than p437 p666 )
    ( greater-than p437 p273 )
    ( greater-than p437 p828 )
    ( greater-than p994 p666 )
    ( greater-than p994 p273 )
    ( greater-than p994 p828 )
    ( greater-than p994 p437 )
    ( greater-than p72 p666 )
    ( greater-than p72 p273 )
    ( greater-than p72 p828 )
    ( greater-than p72 p437 )
    ( greater-than p72 p994 )
  )
  ( :goal
    ( and
      ( obj-at p666 l000-000 )
      ( obj-at p273 l000-000 )
      ( obj-at p828 l000-000 )
      ( obj-at p437 l000-000 )
      ( obj-at p994 l000-000 )
      ( obj-at p72 l000-000 )
    )
  )
)
