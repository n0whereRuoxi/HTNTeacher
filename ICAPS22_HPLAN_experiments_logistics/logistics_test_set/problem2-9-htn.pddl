( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l258 - location
    p221 - obj
    p757 - obj
    t1881 - truck
  )
  ( :init
    ( in-city l258 c000 )
    ( in-truck p221 t1881 )
    ( in-truck p757 t1881 )
    ( truck-at t1881 l258 )
    ( greater-than p757 p221 )
  )
  ( :tasks
    ( Deliver-2Pkg p221 p757 l258 )
  )
)
