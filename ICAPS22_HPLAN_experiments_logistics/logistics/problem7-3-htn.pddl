( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-703 - location
    l000-47 - location
    l000-643 - location
    l000-157 - location
    l000-311 - location
    l000-92 - location
    l000-330 - location
    l000-216 - location
    l000-252 - location
    l000-961 - location
    l000-641 - location
    l000-405 - location
    p313 - obj
    p891 - obj
    p755 - obj
    p467 - obj
    p604 - obj
    p704 - obj
    p714 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-703 c000 )
    ( in-city l000-47 c000 )
    ( in-city l000-643 c000 )
    ( in-city l000-157 c000 )
    ( in-city l000-311 c000 )
    ( in-city l000-92 c000 )
    ( in-city l000-330 c000 )
    ( in-city l000-216 c000 )
    ( in-city l000-252 c000 )
    ( in-city l000-961 c000 )
    ( in-city l000-641 c000 )
    ( in-city l000-405 c000 )
    ( obj-at p313 l000-216 )
    ( obj-at p891 l000-643 )
    ( obj-at p755 l000-92 )
    ( obj-at p467 l000-961 )
    ( obj-at p604 l000-703 )
    ( obj-at p704 l000-252 )
    ( obj-at p714 l000-311 )
    ( greater-than p891 p313 )
    ( greater-than p755 p313 )
    ( greater-than p755 p891 )
    ( greater-than p467 p313 )
    ( greater-than p467 p891 )
    ( greater-than p467 p755 )
    ( greater-than p604 p313 )
    ( greater-than p604 p891 )
    ( greater-than p604 p755 )
    ( greater-than p604 p467 )
    ( greater-than p704 p313 )
    ( greater-than p704 p891 )
    ( greater-than p704 p755 )
    ( greater-than p704 p467 )
    ( greater-than p704 p604 )
    ( greater-than p714 p313 )
    ( greater-than p714 p891 )
    ( greater-than p714 p755 )
    ( greater-than p714 p467 )
    ( greater-than p714 p604 )
    ( greater-than p714 p704 )
  )
  ( :tasks
    ( Deliver-7Pkg p313 p891 p755 p467 p604 p704 p714 l000-000 )
  )
)
