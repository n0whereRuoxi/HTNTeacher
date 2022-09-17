( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l597 - location
    l812 - location
    p924 - obj
    p564 - obj
    p586 - obj
    p156 - obj
    t1681 - truck
    t1277 - truck
    t1390 - truck
  )
  ( :init
    ( in-city l597 c000 )
    ( in-city l812 c000 )
    ( in-truck p924 t1390 )
    ( in-truck p564 t1681 )
    ( in-truck p586 t1681 )
    ( in-truck p156 t1277 )
    ( truck-at t1681 l812 )
    ( truck-at t1277 l597 )
    ( truck-at t1390 l812 )
    ( greater-than p564 p924 )
    ( greater-than p586 p924 )
    ( greater-than p586 p564 )
    ( greater-than p156 p924 )
    ( greater-than p156 p564 )
    ( greater-than p156 p586 )
  )
  ( :tasks
    ( Deliver-4Pkg p924 p564 p586 p156 l597 )
  )
)
