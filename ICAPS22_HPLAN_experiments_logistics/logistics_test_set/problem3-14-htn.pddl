( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l861 - location
    l454 - location
    l946 - location
    l431 - location
    l370 - location
    l55 - location
    p233 - obj
    p49 - obj
    p468 - obj
    t1341 - truck
    t1327 - truck
  )
  ( :init
    ( in-city l861 c000 )
    ( in-city l454 c000 )
    ( in-city l946 c000 )
    ( in-city l431 c000 )
    ( in-city l370 c000 )
    ( in-city l55 c000 )
    ( in-truck p233 t1341 )
    ( obj-at p49 l431 )
    ( obj-at p468 l55 )
    ( truck-at t1341 l454 )
    ( truck-at t1327 l431 )
    ( greater-than p49 p233 )
    ( greater-than p468 p233 )
    ( greater-than p468 p49 )
  )
  ( :tasks
    ( Deliver-3Pkg p233 p49 p468 l861 )
  )
)
