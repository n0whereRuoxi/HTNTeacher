( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-734 - location
    l000-168 - location
    l000-533 - location
    l000-826 - location
    l000-32 - location
    l000-339 - location
    p79 - obj
    p623 - obj
    p536 - obj
    p148 - obj
    p247 - obj
    p764 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-734 c000 )
    ( in-city l000-168 c000 )
    ( in-city l000-533 c000 )
    ( in-city l000-826 c000 )
    ( in-city l000-32 c000 )
    ( in-city l000-339 c000 )
    ( obj-at p79 l000-168 )
    ( obj-at p623 l000-533 )
    ( obj-at p536 l000-533 )
    ( obj-at p148 l000-32 )
    ( obj-at p247 l000-339 )
    ( obj-at p764 l000-533 )
    ( greater-than p623 p79 )
    ( greater-than p536 p79 )
    ( greater-than p536 p623 )
    ( greater-than p148 p79 )
    ( greater-than p148 p623 )
    ( greater-than p148 p536 )
    ( greater-than p247 p79 )
    ( greater-than p247 p623 )
    ( greater-than p247 p536 )
    ( greater-than p247 p148 )
    ( greater-than p764 p79 )
    ( greater-than p764 p623 )
    ( greater-than p764 p536 )
    ( greater-than p764 p148 )
    ( greater-than p764 p247 )
  )
  ( :tasks
    ( Deliver-6Pkg p79 p623 p536 p148 p247 p764 l000-000 )
  )
)
