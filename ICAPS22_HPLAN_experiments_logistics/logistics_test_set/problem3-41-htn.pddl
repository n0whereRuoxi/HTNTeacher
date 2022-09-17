( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l800 - location
    l263 - location
    l763 - location
    l823 - location
    l535 - location
    l603 - location
    p937 - obj
    p817 - obj
    p243 - obj
    t1490 - truck
    t1946 - truck
  )
  ( :init
    ( in-city l800 c000 )
    ( in-city l263 c000 )
    ( in-city l763 c000 )
    ( in-city l823 c000 )
    ( in-city l535 c000 )
    ( in-city l603 c000 )
    ( obj-at p937 l823 )
    ( obj-at p817 l763 )
    ( obj-at p243 l823 )
    ( truck-at t1490 l763 )
    ( truck-at t1946 l535 )
    ( greater-than p817 p937 )
    ( greater-than p243 p937 )
    ( greater-than p243 p817 )
  )
  ( :tasks
    ( Deliver-3Pkg p937 p817 p243 l800 )
  )
)
