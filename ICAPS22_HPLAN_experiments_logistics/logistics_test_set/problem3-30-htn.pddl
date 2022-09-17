( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l492 - location
    l787 - location
    l104 - location
    p390 - obj
    p400 - obj
    p688 - obj
    t1928 - truck
    t1761 - truck
  )
  ( :init
    ( in-city l492 c000 )
    ( in-city l787 c000 )
    ( in-city l104 c000 )
    ( obj-at p390 l787 )
    ( in-truck p400 t1761 )
    ( in-truck p688 t1761 )
    ( truck-at t1928 l787 )
    ( truck-at t1761 l492 )
    ( greater-than p400 p390 )
    ( greater-than p688 p390 )
    ( greater-than p688 p400 )
  )
  ( :tasks
    ( Deliver-3Pkg p390 p400 p688 l492 )
  )
)
