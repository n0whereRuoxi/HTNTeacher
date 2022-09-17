( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l185 - location
    l176 - location
    l24 - location
    l895 - location
    l333 - location
    l600 - location
    l218 - location
    p346 - obj
    p261 - obj
    p581 - obj
    p515 - obj
    t1641 - truck
    t1346 - truck
    t1045 - truck
  )
  ( :init
    ( in-city l185 c000 )
    ( in-city l176 c000 )
    ( in-city l24 c000 )
    ( in-city l895 c000 )
    ( in-city l333 c000 )
    ( in-city l600 c000 )
    ( in-city l218 c000 )
    ( obj-at p346 l218 )
    ( obj-at p261 l24 )
    ( in-truck p581 t1045 )
    ( in-truck p515 t1641 )
    ( truck-at t1641 l24 )
    ( truck-at t1346 l185 )
    ( truck-at t1045 l176 )
    ( greater-than p261 p346 )
    ( greater-than p581 p346 )
    ( greater-than p581 p261 )
    ( greater-than p515 p346 )
    ( greater-than p515 p261 )
    ( greater-than p515 p581 )
  )
  ( :tasks
    ( Deliver-4Pkg p346 p261 p581 p515 l185 )
  )
)
