( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l127 - location
    l946 - location
    l27 - location
    l977 - location
    l980 - location
    l88 - location
    p390 - obj
    p49 - obj
    p573 - obj
    p599 - obj
    t1198 - truck
    t1563 - truck
    t1756 - truck
  )
  ( :init
    ( in-city l127 c000 )
    ( in-city l946 c000 )
    ( in-city l27 c000 )
    ( in-city l977 c000 )
    ( in-city l980 c000 )
    ( in-city l88 c000 )
    ( in-truck p390 t1563 )
    ( obj-at p49 l27 )
    ( obj-at p573 l27 )
    ( in-truck p599 t1198 )
    ( truck-at t1198 l88 )
    ( truck-at t1563 l127 )
    ( truck-at t1756 l88 )
    ( greater-than p49 p390 )
    ( greater-than p573 p390 )
    ( greater-than p573 p49 )
    ( greater-than p599 p390 )
    ( greater-than p599 p49 )
    ( greater-than p599 p573 )
  )
  ( :tasks
    ( Deliver-4Pkg p390 p49 p573 p599 l127 )
  )
)
