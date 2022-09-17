( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l379 - location
    l681 - location
    l887 - location
    l920 - location
    l502 - location
    p749 - obj
    p795 - obj
    p372 - obj
    t1541 - truck
    t1448 - truck
  )
  ( :init
    ( in-city l379 c000 )
    ( in-city l681 c000 )
    ( in-city l887 c000 )
    ( in-city l920 c000 )
    ( in-city l502 c000 )
    ( obj-at p749 l920 )
    ( in-truck p795 t1541 )
    ( in-truck p372 t1541 )
    ( truck-at t1541 l681 )
    ( truck-at t1448 l502 )
    ( greater-than p795 p749 )
    ( greater-than p372 p749 )
    ( greater-than p372 p795 )
  )
  ( :tasks
    ( Deliver-3Pkg p749 p795 p372 l379 )
  )
)
