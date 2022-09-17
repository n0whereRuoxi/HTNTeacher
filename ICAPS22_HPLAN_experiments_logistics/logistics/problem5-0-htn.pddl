( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-198 - location
    l000-347 - location
    l000-882 - location
    l000-784 - location
    l000-780 - location
    l000-970 - location
    l000-119 - location
    l000-336 - location
    p526 - obj
    p739 - obj
    p436 - obj
    p609 - obj
    p97 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-198 c000 )
    ( in-city l000-347 c000 )
    ( in-city l000-882 c000 )
    ( in-city l000-784 c000 )
    ( in-city l000-780 c000 )
    ( in-city l000-970 c000 )
    ( in-city l000-119 c000 )
    ( in-city l000-336 c000 )
    ( obj-at p526 l000-347 )
    ( obj-at p739 l000-784 )
    ( obj-at p436 l000-336 )
    ( obj-at p609 l000-780 )
    ( obj-at p97 l000-970 )
    ( greater-than p739 p526 )
    ( greater-than p436 p526 )
    ( greater-than p436 p739 )
    ( greater-than p609 p526 )
    ( greater-than p609 p739 )
    ( greater-than p609 p436 )
    ( greater-than p97 p526 )
    ( greater-than p97 p739 )
    ( greater-than p97 p436 )
    ( greater-than p97 p609 )
  )
  ( :tasks
    ( Deliver-5Pkg p526 p739 p436 p609 p97 l000-000 )
  )
)
