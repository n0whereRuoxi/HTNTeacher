( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l563 - location
    p699 - obj
    p862 - obj
    t1725 - truck
  )
  ( :init
    ( in-city l563 c000 )
    ( in-truck p699 t1725 )
    ( in-truck p862 t1725 )
    ( truck-at t1725 l563 )
    ( greater-than p862 p699 )
  )
  ( :tasks
    ( Deliver-2Pkg p699 p862 l563 )
  )
)
