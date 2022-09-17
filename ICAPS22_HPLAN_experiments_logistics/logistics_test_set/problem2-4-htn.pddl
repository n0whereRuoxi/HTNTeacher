( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l756 - location
    l243 - location
    l93 - location
    p140 - obj
    p763 - obj
    t1227 - truck
  )
  ( :init
    ( in-city l756 c000 )
    ( in-city l243 c000 )
    ( in-city l93 c000 )
    ( obj-at p140 l93 )
    ( obj-at p763 l243 )
    ( truck-at t1227 l756 )
    ( greater-than p763 p140 )
  )
  ( :tasks
    ( Deliver-2Pkg p140 p763 l756 )
  )
)
