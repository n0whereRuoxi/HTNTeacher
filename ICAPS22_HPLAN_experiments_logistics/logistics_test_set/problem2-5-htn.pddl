( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l581 - location
    p406 - obj
    p161 - obj
    t1195 - truck
  )
  ( :init
    ( in-city l581 c000 )
    ( in-truck p406 t1195 )
    ( in-truck p161 t1195 )
    ( truck-at t1195 l581 )
    ( greater-than p161 p406 )
  )
  ( :tasks
    ( Deliver-2Pkg p406 p161 l581 )
  )
)
