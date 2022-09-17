( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l945 - location
    p162 - obj
    p432 - obj
    t1988 - truck
  )
  ( :init
    ( in-city l945 c000 )
    ( in-truck p162 t1988 )
    ( in-truck p432 t1988 )
    ( truck-at t1988 l945 )
    ( greater-than p432 p162 )
  )
  ( :tasks
    ( Deliver-2Pkg p162 p432 l945 )
  )
)
