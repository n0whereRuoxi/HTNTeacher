( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-30 - location
    l000-686 - location
    l000-538 - location
    l000-831 - location
    l000-1 - location
    l000-558 - location
    l000-450 - location
    l000-357 - location
    p649 - obj
    p170 - obj
    p719 - obj
    p87 - obj
    p168 - obj
    p982 - obj
    p356 - obj
    p70 - obj
    p833 - obj
    p445 - obj
    p579 - obj
    p64 - obj
    p180 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-30 c000 )
    ( in-city l000-686 c000 )
    ( in-city l000-538 c000 )
    ( in-city l000-831 c000 )
    ( in-city l000-1 c000 )
    ( in-city l000-558 c000 )
    ( in-city l000-450 c000 )
    ( in-city l000-357 c000 )
    ( obj-at p649 l000-686 )
    ( obj-at p170 l000-686 )
    ( obj-at p719 l000-30 )
    ( obj-at p87 l000-831 )
    ( obj-at p168 l000-450 )
    ( obj-at p982 l000-30 )
    ( obj-at p356 l000-538 )
    ( obj-at p70 l000-686 )
    ( obj-at p833 l000-30 )
    ( obj-at p445 l000-1 )
    ( obj-at p579 l000-686 )
    ( obj-at p64 l000-30 )
    ( obj-at p180 l000-30 )
    ( greater-than p170 p649 )
    ( greater-than p719 p649 )
    ( greater-than p719 p170 )
    ( greater-than p87 p649 )
    ( greater-than p87 p170 )
    ( greater-than p87 p719 )
    ( greater-than p168 p649 )
    ( greater-than p168 p170 )
    ( greater-than p168 p719 )
    ( greater-than p168 p87 )
    ( greater-than p982 p649 )
    ( greater-than p982 p170 )
    ( greater-than p982 p719 )
    ( greater-than p982 p87 )
    ( greater-than p982 p168 )
    ( greater-than p356 p649 )
    ( greater-than p356 p170 )
    ( greater-than p356 p719 )
    ( greater-than p356 p87 )
    ( greater-than p356 p168 )
    ( greater-than p356 p982 )
    ( greater-than p70 p649 )
    ( greater-than p70 p170 )
    ( greater-than p70 p719 )
    ( greater-than p70 p87 )
    ( greater-than p70 p168 )
    ( greater-than p70 p982 )
    ( greater-than p70 p356 )
    ( greater-than p833 p649 )
    ( greater-than p833 p170 )
    ( greater-than p833 p719 )
    ( greater-than p833 p87 )
    ( greater-than p833 p168 )
    ( greater-than p833 p982 )
    ( greater-than p833 p356 )
    ( greater-than p833 p70 )
    ( greater-than p445 p649 )
    ( greater-than p445 p170 )
    ( greater-than p445 p719 )
    ( greater-than p445 p87 )
    ( greater-than p445 p168 )
    ( greater-than p445 p982 )
    ( greater-than p445 p356 )
    ( greater-than p445 p70 )
    ( greater-than p445 p833 )
    ( greater-than p579 p649 )
    ( greater-than p579 p170 )
    ( greater-than p579 p719 )
    ( greater-than p579 p87 )
    ( greater-than p579 p168 )
    ( greater-than p579 p982 )
    ( greater-than p579 p356 )
    ( greater-than p579 p70 )
    ( greater-than p579 p833 )
    ( greater-than p579 p445 )
    ( greater-than p64 p649 )
    ( greater-than p64 p170 )
    ( greater-than p64 p719 )
    ( greater-than p64 p87 )
    ( greater-than p64 p168 )
    ( greater-than p64 p982 )
    ( greater-than p64 p356 )
    ( greater-than p64 p70 )
    ( greater-than p64 p833 )
    ( greater-than p64 p445 )
    ( greater-than p64 p579 )
    ( greater-than p180 p649 )
    ( greater-than p180 p170 )
    ( greater-than p180 p719 )
    ( greater-than p180 p87 )
    ( greater-than p180 p168 )
    ( greater-than p180 p982 )
    ( greater-than p180 p356 )
    ( greater-than p180 p70 )
    ( greater-than p180 p833 )
    ( greater-than p180 p445 )
    ( greater-than p180 p579 )
    ( greater-than p180 p64 )
  )
  ( :tasks
    ( Deliver-13Pkg p649 p170 p719 p87 p168 p982 p356 p70 p833 p445 p579 p64 p180 l000-000 )
  )
)
