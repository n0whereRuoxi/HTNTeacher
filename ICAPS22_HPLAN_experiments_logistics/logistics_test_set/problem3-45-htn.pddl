( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l20 - location
    l713 - location
    p170 - obj
    p276 - obj
    p921 - obj
    t1696 - truck
    t1627 - truck
  )
  ( :init
    ( in-city l20 c000 )
    ( in-city l713 c000 )
    ( obj-at p170 l713 )
    ( in-truck p276 t1696 )
    ( obj-at p921 l713 )
    ( truck-at t1696 l20 )
    ( truck-at t1627 l713 )
    ( greater-than p276 p170 )
    ( greater-than p921 p170 )
    ( greater-than p921 p276 )
  )
  ( :tasks
    ( Deliver-3Pkg p170 p276 p921 l20 )
  )
)
