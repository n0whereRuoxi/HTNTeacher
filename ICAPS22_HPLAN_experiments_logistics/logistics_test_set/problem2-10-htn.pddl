( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l374 - location
    l290 - location
    l121 - location
    p732 - obj
    p315 - obj
    t1954 - truck
  )
  ( :init
    ( in-city l374 c000 )
    ( in-city l290 c000 )
    ( in-city l121 c000 )
    ( obj-at p732 l290 )
    ( in-truck p315 t1954 )
    ( truck-at t1954 l121 )
    ( greater-than p315 p732 )
  )
  ( :tasks
    ( Deliver-2Pkg p732 p315 l374 )
  )
)
