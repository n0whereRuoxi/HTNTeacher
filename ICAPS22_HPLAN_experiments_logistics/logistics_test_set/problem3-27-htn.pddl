( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l978 - location
    l376 - location
    l894 - location
    l534 - location
    l112 - location
    p693 - obj
    p816 - obj
    p372 - obj
    t1290 - truck
    t1782 - truck
  )
  ( :init
    ( in-city l978 c000 )
    ( in-city l376 c000 )
    ( in-city l894 c000 )
    ( in-city l534 c000 )
    ( in-city l112 c000 )
    ( obj-at p693 l112 )
    ( obj-at p816 l112 )
    ( obj-at p372 l894 )
    ( truck-at t1290 l534 )
    ( truck-at t1782 l534 )
    ( greater-than p816 p693 )
    ( greater-than p372 p693 )
    ( greater-than p372 p816 )
  )
  ( :tasks
    ( Deliver-3Pkg p693 p816 p372 l978 )
  )
)
