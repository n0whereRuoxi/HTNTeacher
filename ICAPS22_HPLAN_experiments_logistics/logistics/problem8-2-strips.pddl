( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-608 - location
    l000-851 - location
    l000-592 - location
    l000-493 - location
    p56 - obj
    p449 - obj
    p441 - obj
    p579 - obj
    p779 - obj
    p339 - obj
    p287 - obj
    p591 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-608 c000 )
    ( in-city l000-851 c000 )
    ( in-city l000-592 c000 )
    ( in-city l000-493 c000 )
    ( obj-at p56 l000-608 )
    ( obj-at p449 l000-493 )
    ( obj-at p441 l000-851 )
    ( obj-at p579 l000-592 )
    ( obj-at p779 l000-493 )
    ( obj-at p339 l000-851 )
    ( obj-at p287 l000-851 )
    ( obj-at p591 l000-608 )
    ( greater-than p449 p56 )
    ( greater-than p441 p56 )
    ( greater-than p441 p449 )
    ( greater-than p579 p56 )
    ( greater-than p579 p449 )
    ( greater-than p579 p441 )
    ( greater-than p779 p56 )
    ( greater-than p779 p449 )
    ( greater-than p779 p441 )
    ( greater-than p779 p579 )
    ( greater-than p339 p56 )
    ( greater-than p339 p449 )
    ( greater-than p339 p441 )
    ( greater-than p339 p579 )
    ( greater-than p339 p779 )
    ( greater-than p287 p56 )
    ( greater-than p287 p449 )
    ( greater-than p287 p441 )
    ( greater-than p287 p579 )
    ( greater-than p287 p779 )
    ( greater-than p287 p339 )
    ( greater-than p591 p56 )
    ( greater-than p591 p449 )
    ( greater-than p591 p441 )
    ( greater-than p591 p579 )
    ( greater-than p591 p779 )
    ( greater-than p591 p339 )
    ( greater-than p591 p287 )
  )
  ( :goal
    ( and
      ( obj-at p56 l000-000 )
      ( obj-at p449 l000-000 )
      ( obj-at p441 l000-000 )
      ( obj-at p579 l000-000 )
      ( obj-at p779 l000-000 )
      ( obj-at p339 l000-000 )
      ( obj-at p287 l000-000 )
      ( obj-at p591 l000-000 )
    )
  )
)
