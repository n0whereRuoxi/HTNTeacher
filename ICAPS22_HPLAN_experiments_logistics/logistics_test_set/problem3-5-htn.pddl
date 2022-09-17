( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l614 - location
    l518 - location
    l938 - location
    l841 - location
    p806 - obj
    p732 - obj
    p558 - obj
    t1260 - truck
    t1657 - truck
  )
  ( :init
    ( in-city l614 c000 )
    ( in-city l518 c000 )
    ( in-city l938 c000 )
    ( in-city l841 c000 )
    ( obj-at p806 l841 )
    ( obj-at p732 l841 )
    ( in-truck p558 t1657 )
    ( truck-at t1260 l841 )
    ( truck-at t1657 l518 )
    ( greater-than p732 p806 )
    ( greater-than p558 p806 )
    ( greater-than p558 p732 )
  )
  ( :tasks
    ( Deliver-3Pkg p806 p732 p558 l614 )
  )
)
