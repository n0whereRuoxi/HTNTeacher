( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l757 - location
    l69 - location
    l304 - location
    l511 - location
    l814 - location
    p276 - obj
    p344 - obj
    p479 - obj
    t1841 - truck
    t1120 - truck
  )
  ( :init
    ( in-city l757 c000 )
    ( in-city l69 c000 )
    ( in-city l304 c000 )
    ( in-city l511 c000 )
    ( in-city l814 c000 )
    ( in-truck p276 t1841 )
    ( obj-at p344 l511 )
    ( in-truck p479 t1120 )
    ( truck-at t1841 l69 )
    ( truck-at t1120 l304 )
    ( greater-than p344 p276 )
    ( greater-than p479 p276 )
    ( greater-than p479 p344 )
  )
  ( :tasks
    ( Deliver-3Pkg p276 p344 p479 l757 )
  )
)
