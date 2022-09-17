( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l948 - location
    l20 - location
    p225 - obj
    p798 - obj
    p872 - obj
    p238 - obj
    t1219 - truck
    t1540 - truck
    t1813 - truck
  )
  ( :init
    ( in-city l948 c000 )
    ( in-city l20 c000 )
    ( obj-at p225 l20 )
    ( obj-at p798 l20 )
    ( obj-at p872 l20 )
    ( obj-at p238 l20 )
    ( truck-at t1219 l948 )
    ( truck-at t1540 l20 )
    ( truck-at t1813 l20 )
    ( greater-than p798 p225 )
    ( greater-than p872 p225 )
    ( greater-than p872 p798 )
    ( greater-than p238 p225 )
    ( greater-than p238 p798 )
    ( greater-than p238 p872 )
  )
  ( :tasks
    ( Deliver-4Pkg p225 p798 p872 p238 l948 )
  )
)
