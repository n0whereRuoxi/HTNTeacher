( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l644 - location
    l295 - location
    l40 - location
    l992 - location
    p367 - obj
    p851 - obj
    p619 - obj
    t1807 - truck
    t1292 - truck
  )
  ( :init
    ( in-city l644 c000 )
    ( in-city l295 c000 )
    ( in-city l40 c000 )
    ( in-city l992 c000 )
    ( obj-at p367 l295 )
    ( in-truck p851 t1292 )
    ( obj-at p619 l295 )
    ( truck-at t1807 l295 )
    ( truck-at t1292 l644 )
    ( greater-than p851 p367 )
    ( greater-than p619 p367 )
    ( greater-than p619 p851 )
  )
  ( :tasks
    ( Deliver-3Pkg p367 p851 p619 l644 )
  )
)
