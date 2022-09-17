( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-986 - location
    l000-143 - location
    l000-228 - location
    l000-861 - location
    l000-600 - location
    l000-300 - location
    l000-753 - location
    p145 - obj
    p428 - obj
    p792 - obj
    p879 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-986 c000 )
    ( in-city l000-143 c000 )
    ( in-city l000-228 c000 )
    ( in-city l000-861 c000 )
    ( in-city l000-600 c000 )
    ( in-city l000-300 c000 )
    ( in-city l000-753 c000 )
    ( obj-at p145 l000-143 )
    ( obj-at p428 l000-600 )
    ( obj-at p792 l000-753 )
    ( obj-at p879 l000-861 )
    ( greater-than p428 p145 )
    ( greater-than p792 p145 )
    ( greater-than p792 p428 )
    ( greater-than p879 p145 )
    ( greater-than p879 p428 )
    ( greater-than p879 p792 )
  )
  ( :tasks
    ( Deliver-4Pkg p145 p428 p792 p879 l000-000 )
  )
)
