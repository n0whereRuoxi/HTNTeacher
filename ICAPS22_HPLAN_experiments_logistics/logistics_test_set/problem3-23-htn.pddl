( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l999 - location
    l661 - location
    l631 - location
    l381 - location
    p766 - obj
    p578 - obj
    p94 - obj
    t1451 - truck
    t1660 - truck
  )
  ( :init
    ( in-city l999 c000 )
    ( in-city l661 c000 )
    ( in-city l631 c000 )
    ( in-city l381 c000 )
    ( obj-at p766 l381 )
    ( obj-at p578 l381 )
    ( obj-at p94 l661 )
    ( truck-at t1451 l381 )
    ( truck-at t1660 l999 )
    ( greater-than p578 p766 )
    ( greater-than p94 p766 )
    ( greater-than p94 p578 )
  )
  ( :tasks
    ( Deliver-3Pkg p766 p578 p94 l999 )
  )
)
