( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l728 - location
    l456 - location
    l861 - location
    p666 - obj
    p235 - obj
    p88 - obj
    p791 - obj
    t1166 - truck
    t1940 - truck
    t1370 - truck
  )
  ( :init
    ( in-city l728 c000 )
    ( in-city l456 c000 )
    ( in-city l861 c000 )
    ( obj-at p666 l456 )
    ( in-truck p235 t1370 )
    ( obj-at p88 l456 )
    ( in-truck p791 t1166 )
    ( truck-at t1166 l861 )
    ( truck-at t1940 l456 )
    ( truck-at t1370 l728 )
    ( greater-than p235 p666 )
    ( greater-than p88 p666 )
    ( greater-than p88 p235 )
    ( greater-than p791 p666 )
    ( greater-than p791 p235 )
    ( greater-than p791 p88 )
  )
  ( :tasks
    ( Deliver-4Pkg p666 p235 p88 p791 l728 )
  )
)
