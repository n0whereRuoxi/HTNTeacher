( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-774 - location
    l000-52 - location
    l000-772 - location
    l000-75 - location
    p406 - obj
    p509 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-774 c000 )
    ( in-city l000-52 c000 )
    ( in-city l000-772 c000 )
    ( in-city l000-75 c000 )
    ( obj-at p406 l000-774 )
    ( obj-at p509 l000-772 )
    ( greater-than p509 p406 )
  )
  ( :tasks
    ( Deliver-2Pkg p406 p509 l000-000 )
  )
)
