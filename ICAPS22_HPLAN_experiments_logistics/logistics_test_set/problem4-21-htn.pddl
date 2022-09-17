( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l595 - location
    l158 - location
    p474 - obj
    p689 - obj
    p284 - obj
    p199 - obj
    t1355 - truck
    t1830 - truck
    t1909 - truck
  )
  ( :init
    ( in-city l595 c000 )
    ( in-city l158 c000 )
    ( in-truck p474 t1909 )
    ( in-truck p689 t1830 )
    ( in-truck p284 t1355 )
    ( obj-at p199 l158 )
    ( truck-at t1355 l595 )
    ( truck-at t1830 l595 )
    ( truck-at t1909 l158 )
    ( greater-than p689 p474 )
    ( greater-than p284 p474 )
    ( greater-than p284 p689 )
    ( greater-than p199 p474 )
    ( greater-than p199 p689 )
    ( greater-than p199 p284 )
  )
  ( :tasks
    ( Deliver-4Pkg p474 p689 p284 p199 l595 )
  )
)
