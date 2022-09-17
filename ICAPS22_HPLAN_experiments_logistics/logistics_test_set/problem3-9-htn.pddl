( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l158 - location
    l593 - location
    p899 - obj
    p151 - obj
    p166 - obj
    t1161 - truck
    t1954 - truck
  )
  ( :init
    ( in-city l158 c000 )
    ( in-city l593 c000 )
    ( obj-at p899 l593 )
    ( in-truck p151 t1161 )
    ( in-truck p166 t1954 )
    ( truck-at t1161 l158 )
    ( truck-at t1954 l593 )
    ( greater-than p151 p899 )
    ( greater-than p166 p899 )
    ( greater-than p166 p151 )
  )
  ( :tasks
    ( Deliver-3Pkg p899 p151 p166 l158 )
  )
)
