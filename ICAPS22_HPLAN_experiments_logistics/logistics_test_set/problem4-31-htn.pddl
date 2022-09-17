( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l224 - location
    l742 - location
    l835 - location
    l194 - location
    l891 - location
    l998 - location
    l212 - location
    l681 - location
    p825 - obj
    p305 - obj
    p249 - obj
    p460 - obj
    t1314 - truck
    t1418 - truck
    t1084 - truck
  )
  ( :init
    ( in-city l224 c000 )
    ( in-city l742 c000 )
    ( in-city l835 c000 )
    ( in-city l194 c000 )
    ( in-city l891 c000 )
    ( in-city l998 c000 )
    ( in-city l212 c000 )
    ( in-city l681 c000 )
    ( obj-at p825 l835 )
    ( in-truck p305 t1418 )
    ( obj-at p249 l681 )
    ( obj-at p460 l998 )
    ( truck-at t1314 l194 )
    ( truck-at t1418 l212 )
    ( truck-at t1084 l224 )
    ( greater-than p305 p825 )
    ( greater-than p249 p825 )
    ( greater-than p249 p305 )
    ( greater-than p460 p825 )
    ( greater-than p460 p305 )
    ( greater-than p460 p249 )
  )
  ( :tasks
    ( Deliver-4Pkg p825 p305 p249 p460 l224 )
  )
)
