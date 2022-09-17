( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-49 - location
    l000-832 - location
    l000-523 - location
    l000-397 - location
    l000-269 - location
    p318 - obj
    p130 - obj
    p145 - obj
    p341 - obj
    p627 - obj
    p518 - obj
    p383 - obj
    p45 - obj
    p460 - obj
    p398 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-49 c000 )
    ( in-city l000-832 c000 )
    ( in-city l000-523 c000 )
    ( in-city l000-397 c000 )
    ( in-city l000-269 c000 )
    ( obj-at p318 l000-832 )
    ( obj-at p130 l000-49 )
    ( obj-at p145 l000-832 )
    ( obj-at p341 l000-269 )
    ( obj-at p627 l000-49 )
    ( obj-at p518 l000-49 )
    ( obj-at p383 l000-49 )
    ( obj-at p45 l000-269 )
    ( obj-at p460 l000-49 )
    ( obj-at p398 l000-397 )
    ( greater-than p130 p318 )
    ( greater-than p145 p318 )
    ( greater-than p145 p130 )
    ( greater-than p341 p318 )
    ( greater-than p341 p130 )
    ( greater-than p341 p145 )
    ( greater-than p627 p318 )
    ( greater-than p627 p130 )
    ( greater-than p627 p145 )
    ( greater-than p627 p341 )
    ( greater-than p518 p318 )
    ( greater-than p518 p130 )
    ( greater-than p518 p145 )
    ( greater-than p518 p341 )
    ( greater-than p518 p627 )
    ( greater-than p383 p318 )
    ( greater-than p383 p130 )
    ( greater-than p383 p145 )
    ( greater-than p383 p341 )
    ( greater-than p383 p627 )
    ( greater-than p383 p518 )
    ( greater-than p45 p318 )
    ( greater-than p45 p130 )
    ( greater-than p45 p145 )
    ( greater-than p45 p341 )
    ( greater-than p45 p627 )
    ( greater-than p45 p518 )
    ( greater-than p45 p383 )
    ( greater-than p460 p318 )
    ( greater-than p460 p130 )
    ( greater-than p460 p145 )
    ( greater-than p460 p341 )
    ( greater-than p460 p627 )
    ( greater-than p460 p518 )
    ( greater-than p460 p383 )
    ( greater-than p460 p45 )
    ( greater-than p398 p318 )
    ( greater-than p398 p130 )
    ( greater-than p398 p145 )
    ( greater-than p398 p341 )
    ( greater-than p398 p627 )
    ( greater-than p398 p518 )
    ( greater-than p398 p383 )
    ( greater-than p398 p45 )
    ( greater-than p398 p460 )
  )
  ( :goal
    ( and
      ( obj-at p318 l000-000 )
      ( obj-at p130 l000-000 )
      ( obj-at p145 l000-000 )
      ( obj-at p341 l000-000 )
      ( obj-at p627 l000-000 )
      ( obj-at p518 l000-000 )
      ( obj-at p383 l000-000 )
      ( obj-at p45 l000-000 )
      ( obj-at p460 l000-000 )
      ( obj-at p398 l000-000 )
    )
  )
)
