( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l355 - location
    l527 - location
    p61 - obj
    p895 - obj
    p717 - obj
    t1484 - truck
    t1203 - truck
  )
  ( :init
    ( in-city l355 c000 )
    ( in-city l527 c000 )
    ( in-truck p61 t1484 )
    ( obj-at p895 l527 )
    ( in-truck p717 t1484 )
    ( truck-at t1484 l355 )
    ( truck-at t1203 l527 )
    ( greater-than p895 p61 )
    ( greater-than p717 p61 )
    ( greater-than p717 p895 )
  )
  ( :tasks
    ( Deliver-3Pkg p61 p895 p717 l355 )
  )
)
