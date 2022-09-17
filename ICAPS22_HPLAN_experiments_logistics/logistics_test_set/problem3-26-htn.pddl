( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l738 - location
    l439 - location
    l511 - location
    l933 - location
    l16 - location
    p859 - obj
    p907 - obj
    p375 - obj
    t1520 - truck
    t1628 - truck
  )
  ( :init
    ( in-city l738 c000 )
    ( in-city l439 c000 )
    ( in-city l511 c000 )
    ( in-city l933 c000 )
    ( in-city l16 c000 )
    ( in-truck p859 t1628 )
    ( in-truck p907 t1628 )
    ( obj-at p375 l439 )
    ( truck-at t1520 l511 )
    ( truck-at t1628 l439 )
    ( greater-than p907 p859 )
    ( greater-than p375 p859 )
    ( greater-than p375 p907 )
  )
  ( :tasks
    ( Deliver-3Pkg p859 p907 p375 l738 )
  )
)
