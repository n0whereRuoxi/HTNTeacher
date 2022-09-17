( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l140 - location
    l131 - location
    p319 - obj
    p640 - obj
    p791 - obj
    p834 - obj
    t1003 - truck
    t1404 - truck
    t1633 - truck
  )
  ( :init
    ( in-city l140 c000 )
    ( in-city l131 c000 )
    ( in-truck p319 t1633 )
    ( in-truck p640 t1633 )
    ( in-truck p791 t1404 )
    ( in-truck p834 t1633 )
    ( truck-at t1003 l131 )
    ( truck-at t1404 l140 )
    ( truck-at t1633 l131 )
    ( greater-than p640 p319 )
    ( greater-than p791 p319 )
    ( greater-than p791 p640 )
    ( greater-than p834 p319 )
    ( greater-than p834 p640 )
    ( greater-than p834 p791 )
  )
  ( :tasks
    ( Deliver-4Pkg p319 p640 p791 p834 l140 )
  )
)
