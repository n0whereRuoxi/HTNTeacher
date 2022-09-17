( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-674 - location
    l000-756 - location
    l000-449 - location
    p819 - obj
    p345 - obj
    p460 - obj
    p949 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-674 c000 )
    ( in-city l000-756 c000 )
    ( in-city l000-449 c000 )
    ( obj-at p819 l000-674 )
    ( obj-at p345 l000-449 )
    ( obj-at p460 l000-449 )
    ( obj-at p949 l000-756 )
    ( greater-than p345 p819 )
    ( greater-than p460 p819 )
    ( greater-than p460 p345 )
    ( greater-than p949 p819 )
    ( greater-than p949 p345 )
    ( greater-than p949 p460 )
  )
  ( :tasks
    ( Deliver-4Pkg p819 p345 p460 p949 l000-000 )
  )
)
