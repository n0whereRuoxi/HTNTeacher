( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l19 - location
    l514 - location
    l738 - location
    l504 - location
    p996 - obj
    p168 - obj
    p447 - obj
    t1866 - truck
    t1976 - truck
  )
  ( :init
    ( in-city l19 c000 )
    ( in-city l514 c000 )
    ( in-city l738 c000 )
    ( in-city l504 c000 )
    ( obj-at p996 l514 )
    ( obj-at p168 l738 )
    ( in-truck p447 t1976 )
    ( truck-at t1866 l738 )
    ( truck-at t1976 l738 )
    ( greater-than p168 p996 )
    ( greater-than p447 p996 )
    ( greater-than p447 p168 )
  )
  ( :tasks
    ( Deliver-3Pkg p996 p168 p447 l19 )
  )
)
