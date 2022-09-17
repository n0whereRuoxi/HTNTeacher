( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l322 - location
    p729 - obj
    p815 - obj
    t1373 - truck
  )
  ( :init
    ( in-city l322 c000 )
    ( in-truck p729 t1373 )
    ( in-truck p815 t1373 )
    ( truck-at t1373 l322 )
    ( greater-than p815 p729 )
  )
  ( :tasks
    ( Deliver-2Pkg p729 p815 l322 )
  )
)
