( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l274 - location
    l649 - location
    p515 - obj
    p37 - obj
    p318 - obj
    t1745 - truck
    t1958 - truck
  )
  ( :init
    ( in-city l274 c000 )
    ( in-city l649 c000 )
    ( obj-at p515 l649 )
    ( in-truck p37 t1745 )
    ( obj-at p318 l649 )
    ( truck-at t1745 l274 )
    ( truck-at t1958 l274 )
    ( greater-than p37 p515 )
    ( greater-than p318 p515 )
    ( greater-than p318 p37 )
  )
  ( :tasks
    ( Deliver-3Pkg p515 p37 p318 l274 )
  )
)
