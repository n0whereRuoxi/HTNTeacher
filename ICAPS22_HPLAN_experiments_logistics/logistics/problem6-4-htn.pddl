( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-824 - location
    l000-652 - location
    l000-125 - location
    l000-70 - location
    l000-577 - location
    p664 - obj
    p267 - obj
    p338 - obj
    p992 - obj
    p933 - obj
    p728 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-824 c000 )
    ( in-city l000-652 c000 )
    ( in-city l000-125 c000 )
    ( in-city l000-70 c000 )
    ( in-city l000-577 c000 )
    ( obj-at p664 l000-70 )
    ( obj-at p267 l000-70 )
    ( obj-at p338 l000-577 )
    ( obj-at p992 l000-70 )
    ( obj-at p933 l000-577 )
    ( obj-at p728 l000-824 )
    ( greater-than p267 p664 )
    ( greater-than p338 p664 )
    ( greater-than p338 p267 )
    ( greater-than p992 p664 )
    ( greater-than p992 p267 )
    ( greater-than p992 p338 )
    ( greater-than p933 p664 )
    ( greater-than p933 p267 )
    ( greater-than p933 p338 )
    ( greater-than p933 p992 )
    ( greater-than p728 p664 )
    ( greater-than p728 p267 )
    ( greater-than p728 p338 )
    ( greater-than p728 p992 )
    ( greater-than p728 p933 )
  )
  ( :tasks
    ( Deliver-6Pkg p664 p267 p338 p992 p933 p728 l000-000 )
  )
)
