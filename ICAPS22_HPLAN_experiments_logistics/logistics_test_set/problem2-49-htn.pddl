( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l875 - location
    l637 - location
    p689 - obj
    p619 - obj
    t1389 - truck
  )
  ( :init
    ( in-city l875 c000 )
    ( in-city l637 c000 )
    ( in-truck p689 t1389 )
    ( in-truck p619 t1389 )
    ( truck-at t1389 l637 )
    ( greater-than p619 p689 )
  )
  ( :tasks
    ( Deliver-2Pkg p689 p619 l875 )
  )
)
