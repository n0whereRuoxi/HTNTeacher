( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l932 - location
    l715 - location
    l142 - location
    l836 - location
    l213 - location
    l875 - location
    l275 - location
    p863 - obj
    p838 - obj
    p939 - obj
    p866 - obj
    t1418 - truck
    t1503 - truck
    t1375 - truck
  )
  ( :init
    ( in-city l932 c000 )
    ( in-city l715 c000 )
    ( in-city l142 c000 )
    ( in-city l836 c000 )
    ( in-city l213 c000 )
    ( in-city l875 c000 )
    ( in-city l275 c000 )
    ( in-truck p863 t1418 )
    ( obj-at p838 l213 )
    ( obj-at p939 l875 )
    ( in-truck p866 t1503 )
    ( truck-at t1418 l213 )
    ( truck-at t1503 l932 )
    ( truck-at t1375 l836 )
    ( greater-than p838 p863 )
    ( greater-than p939 p863 )
    ( greater-than p939 p838 )
    ( greater-than p866 p863 )
    ( greater-than p866 p838 )
    ( greater-than p866 p939 )
  )
  ( :tasks
    ( Deliver-4Pkg p863 p838 p939 p866 l932 )
  )
)
