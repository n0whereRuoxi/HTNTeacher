( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l550 - location
    l482 - location
    l248 - location
    l799 - location
    p847 - obj
    p600 - obj
    t1833 - truck
  )
  ( :init
    ( in-city l550 c000 )
    ( in-city l482 c000 )
    ( in-city l248 c000 )
    ( in-city l799 c000 )
    ( obj-at p847 l248 )
    ( in-truck p600 t1833 )
    ( truck-at t1833 l248 )
    ( greater-than p600 p847 )
  )
  ( :tasks
    ( Deliver-2Pkg p847 p600 l550 )
  )
)
