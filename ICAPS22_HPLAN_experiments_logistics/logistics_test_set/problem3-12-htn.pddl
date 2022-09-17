( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l140 - location
    l799 - location
    l486 - location
    p903 - obj
    p317 - obj
    p669 - obj
    t1851 - truck
    t1102 - truck
  )
  ( :init
    ( in-city l140 c000 )
    ( in-city l799 c000 )
    ( in-city l486 c000 )
    ( in-truck p903 t1102 )
    ( in-truck p317 t1102 )
    ( obj-at p669 l799 )
    ( truck-at t1851 l486 )
    ( truck-at t1102 l140 )
    ( greater-than p317 p903 )
    ( greater-than p669 p903 )
    ( greater-than p669 p317 )
  )
  ( :tasks
    ( Deliver-3Pkg p903 p317 p669 l140 )
  )
)
