( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l592 - location
    l164 - location
    l523 - location
    l746 - location
    l907 - location
    p357 - obj
    p788 - obj
    p592 - obj
    p655 - obj
    t1686 - truck
    t1707 - truck
    t1348 - truck
  )
  ( :init
    ( in-city l592 c000 )
    ( in-city l164 c000 )
    ( in-city l523 c000 )
    ( in-city l746 c000 )
    ( in-city l907 c000 )
    ( obj-at p357 l164 )
    ( obj-at p788 l746 )
    ( obj-at p592 l164 )
    ( obj-at p655 l907 )
    ( truck-at t1686 l907 )
    ( truck-at t1707 l164 )
    ( truck-at t1348 l907 )
    ( greater-than p788 p357 )
    ( greater-than p592 p357 )
    ( greater-than p592 p788 )
    ( greater-than p655 p357 )
    ( greater-than p655 p788 )
    ( greater-than p655 p592 )
  )
  ( :goal
    ( and
      ( obj-at p357 l592 )
      ( obj-at p788 l592 )
      ( obj-at p592 l592 )
      ( obj-at p655 l592 )
    )
  )
)
