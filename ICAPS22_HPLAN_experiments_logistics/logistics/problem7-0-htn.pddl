( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-68 - location
    l000-172 - location
    l000-694 - location
    l000-647 - location
    l000-531 - location
    p124 - obj
    p434 - obj
    p290 - obj
    p888 - obj
    p840 - obj
    p446 - obj
    p976 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-68 c000 )
    ( in-city l000-172 c000 )
    ( in-city l000-694 c000 )
    ( in-city l000-647 c000 )
    ( in-city l000-531 c000 )
    ( obj-at p124 l000-694 )
    ( obj-at p434 l000-68 )
    ( obj-at p290 l000-647 )
    ( obj-at p888 l000-694 )
    ( obj-at p840 l000-694 )
    ( obj-at p446 l000-694 )
    ( obj-at p976 l000-647 )
    ( greater-than p434 p124 )
    ( greater-than p290 p124 )
    ( greater-than p290 p434 )
    ( greater-than p888 p124 )
    ( greater-than p888 p434 )
    ( greater-than p888 p290 )
    ( greater-than p840 p124 )
    ( greater-than p840 p434 )
    ( greater-than p840 p290 )
    ( greater-than p840 p888 )
    ( greater-than p446 p124 )
    ( greater-than p446 p434 )
    ( greater-than p446 p290 )
    ( greater-than p446 p888 )
    ( greater-than p446 p840 )
    ( greater-than p976 p124 )
    ( greater-than p976 p434 )
    ( greater-than p976 p290 )
    ( greater-than p976 p888 )
    ( greater-than p976 p840 )
    ( greater-than p976 p446 )
  )
  ( :tasks
    ( Deliver-7Pkg p124 p434 p290 p888 p840 p446 p976 l000-000 )
  )
)
