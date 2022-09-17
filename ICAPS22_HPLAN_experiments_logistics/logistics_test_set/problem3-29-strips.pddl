( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l453 - location
    l256 - location
    l626 - location
    l627 - location
    l425 - location
    p464 - obj
    p12 - obj
    p600 - obj
    t1197 - truck
    t1478 - truck
  )
  ( :init
    ( in-city l453 c000 )
    ( in-city l256 c000 )
    ( in-city l626 c000 )
    ( in-city l627 c000 )
    ( in-city l425 c000 )
    ( obj-at p464 l256 )
    ( obj-at p12 l627 )
    ( obj-at p600 l425 )
    ( truck-at t1197 l626 )
    ( truck-at t1478 l627 )
    ( greater-than p12 p464 )
    ( greater-than p600 p464 )
    ( greater-than p600 p12 )
  )
  ( :goal
    ( and
      ( obj-at p464 l453 )
      ( obj-at p12 l453 )
      ( obj-at p600 l453 )
    )
  )
)
