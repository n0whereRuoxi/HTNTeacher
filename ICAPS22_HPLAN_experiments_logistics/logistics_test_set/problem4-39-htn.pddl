( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l281 - location
    l299 - location
    l640 - location
    l4 - location
    p745 - obj
    p872 - obj
    p795 - obj
    p892 - obj
    t1153 - truck
    t1223 - truck
    t1866 - truck
  )
  ( :init
    ( in-city l281 c000 )
    ( in-city l299 c000 )
    ( in-city l640 c000 )
    ( in-city l4 c000 )
    ( obj-at p745 l640 )
    ( obj-at p872 l4 )
    ( in-truck p795 t1866 )
    ( in-truck p892 t1866 )
    ( truck-at t1153 l640 )
    ( truck-at t1223 l299 )
    ( truck-at t1866 l299 )
    ( greater-than p872 p745 )
    ( greater-than p795 p745 )
    ( greater-than p795 p872 )
    ( greater-than p892 p745 )
    ( greater-than p892 p872 )
    ( greater-than p892 p795 )
  )
  ( :tasks
    ( Deliver-4Pkg p745 p872 p795 p892 l281 )
  )
)
