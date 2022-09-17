( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l887 - location
    l276 - location
    l457 - location
    l69 - location
    l257 - location
    l366 - location
    p578 - obj
    p869 - obj
    p427 - obj
    p324 - obj
    t1671 - truck
    t1685 - truck
    t1055 - truck
  )
  ( :init
    ( in-city l887 c000 )
    ( in-city l276 c000 )
    ( in-city l457 c000 )
    ( in-city l69 c000 )
    ( in-city l257 c000 )
    ( in-city l366 c000 )
    ( in-truck p578 t1055 )
    ( in-truck p869 t1685 )
    ( obj-at p427 l69 )
    ( in-truck p324 t1685 )
    ( truck-at t1671 l69 )
    ( truck-at t1685 l257 )
    ( truck-at t1055 l887 )
    ( greater-than p869 p578 )
    ( greater-than p427 p578 )
    ( greater-than p427 p869 )
    ( greater-than p324 p578 )
    ( greater-than p324 p869 )
    ( greater-than p324 p427 )
  )
  ( :tasks
    ( Deliver-4Pkg p578 p869 p427 p324 l887 )
  )
)
