( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l762 - location
    l670 - location
    l961 - location
    l203 - location
    p426 - obj
    p174 - obj
    p465 - obj
    t1583 - truck
    t1409 - truck
  )
  ( :init
    ( in-city l762 c000 )
    ( in-city l670 c000 )
    ( in-city l961 c000 )
    ( in-city l203 c000 )
    ( in-truck p426 t1409 )
    ( obj-at p174 l670 )
    ( obj-at p465 l961 )
    ( truck-at t1583 l762 )
    ( truck-at t1409 l670 )
    ( greater-than p174 p426 )
    ( greater-than p465 p426 )
    ( greater-than p465 p174 )
  )
  ( :tasks
    ( Deliver-3Pkg p426 p174 p465 l762 )
  )
)
