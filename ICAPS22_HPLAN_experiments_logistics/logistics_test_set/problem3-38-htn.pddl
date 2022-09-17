( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l806 - location
    l833 - location
    l825 - location
    p595 - obj
    p255 - obj
    p788 - obj
    t1810 - truck
    t1450 - truck
  )
  ( :init
    ( in-city l806 c000 )
    ( in-city l833 c000 )
    ( in-city l825 c000 )
    ( obj-at p595 l833 )
    ( obj-at p255 l833 )
    ( obj-at p788 l833 )
    ( truck-at t1810 l825 )
    ( truck-at t1450 l806 )
    ( greater-than p255 p595 )
    ( greater-than p788 p595 )
    ( greater-than p788 p255 )
  )
  ( :tasks
    ( Deliver-3Pkg p595 p255 p788 l806 )
  )
)
