( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-38 - location
    l000-34 - location
    p572 - obj
    p713 - obj
    p396 - obj
    p495 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-38 c000 )
    ( in-city l000-34 c000 )
    ( obj-at p572 l000-38 )
    ( obj-at p713 l000-38 )
    ( obj-at p396 l000-34 )
    ( obj-at p495 l000-34 )
    ( greater-than p713 p572 )
    ( greater-than p396 p572 )
    ( greater-than p396 p713 )
    ( greater-than p495 p572 )
    ( greater-than p495 p713 )
    ( greater-than p495 p396 )
  )
  ( :tasks
    ( Deliver-4Pkg p572 p713 p396 p495 l000-000 )
  )
)
