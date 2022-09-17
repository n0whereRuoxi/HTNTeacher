( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l722 - location
    l745 - location
    l338 - location
    l774 - location
    l819 - location
    l396 - location
    l108 - location
    p971 - obj
    p128 - obj
    p239 - obj
    p960 - obj
    t1623 - truck
    t1083 - truck
    t1904 - truck
  )
  ( :init
    ( in-city l722 c000 )
    ( in-city l745 c000 )
    ( in-city l338 c000 )
    ( in-city l774 c000 )
    ( in-city l819 c000 )
    ( in-city l396 c000 )
    ( in-city l108 c000 )
    ( obj-at p971 l745 )
    ( obj-at p128 l774 )
    ( obj-at p239 l396 )
    ( in-truck p960 t1904 )
    ( truck-at t1623 l745 )
    ( truck-at t1083 l774 )
    ( truck-at t1904 l338 )
    ( greater-than p128 p971 )
    ( greater-than p239 p971 )
    ( greater-than p239 p128 )
    ( greater-than p960 p971 )
    ( greater-than p960 p128 )
    ( greater-than p960 p239 )
  )
  ( :tasks
    ( Deliver-4Pkg p971 p128 p239 p960 l722 )
  )
)
