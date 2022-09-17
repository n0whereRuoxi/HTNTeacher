( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l89 - location
    l874 - location
    l457 - location
    l498 - location
    p812 - obj
    p39 - obj
    p902 - obj
    t1510 - truck
    t1981 - truck
  )
  ( :init
    ( in-city l89 c000 )
    ( in-city l874 c000 )
    ( in-city l457 c000 )
    ( in-city l498 c000 )
    ( obj-at p812 l457 )
    ( in-truck p39 t1981 )
    ( in-truck p902 t1510 )
    ( truck-at t1510 l89 )
    ( truck-at t1981 l498 )
    ( greater-than p39 p812 )
    ( greater-than p902 p812 )
    ( greater-than p902 p39 )
  )
  ( :tasks
    ( Deliver-3Pkg p812 p39 p902 l89 )
  )
)
