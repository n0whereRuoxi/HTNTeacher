( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-270 - location
    l000-364 - location
    l000-187 - location
    l000-940 - location
    l000-247 - location
    l000-80 - location
    l000-323 - location
    l000-223 - location
    p825 - obj
    p462 - obj
    p7 - obj
    p691 - obj
    p847 - obj
    p153 - obj
    p369 - obj
    p375 - obj
    p277 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-270 c000 )
    ( in-city l000-364 c000 )
    ( in-city l000-187 c000 )
    ( in-city l000-940 c000 )
    ( in-city l000-247 c000 )
    ( in-city l000-80 c000 )
    ( in-city l000-323 c000 )
    ( in-city l000-223 c000 )
    ( obj-at p825 l000-270 )
    ( obj-at p462 l000-323 )
    ( obj-at p7 l000-247 )
    ( obj-at p691 l000-187 )
    ( obj-at p847 l000-270 )
    ( obj-at p153 l000-223 )
    ( obj-at p369 l000-364 )
    ( obj-at p375 l000-247 )
    ( obj-at p277 l000-940 )
    ( greater-than p462 p825 )
    ( greater-than p7 p825 )
    ( greater-than p7 p462 )
    ( greater-than p691 p825 )
    ( greater-than p691 p462 )
    ( greater-than p691 p7 )
    ( greater-than p847 p825 )
    ( greater-than p847 p462 )
    ( greater-than p847 p7 )
    ( greater-than p847 p691 )
    ( greater-than p153 p825 )
    ( greater-than p153 p462 )
    ( greater-than p153 p7 )
    ( greater-than p153 p691 )
    ( greater-than p153 p847 )
    ( greater-than p369 p825 )
    ( greater-than p369 p462 )
    ( greater-than p369 p7 )
    ( greater-than p369 p691 )
    ( greater-than p369 p847 )
    ( greater-than p369 p153 )
    ( greater-than p375 p825 )
    ( greater-than p375 p462 )
    ( greater-than p375 p7 )
    ( greater-than p375 p691 )
    ( greater-than p375 p847 )
    ( greater-than p375 p153 )
    ( greater-than p375 p369 )
    ( greater-than p277 p825 )
    ( greater-than p277 p462 )
    ( greater-than p277 p7 )
    ( greater-than p277 p691 )
    ( greater-than p277 p847 )
    ( greater-than p277 p153 )
    ( greater-than p277 p369 )
    ( greater-than p277 p375 )
  )
  ( :tasks
    ( Deliver-9Pkg p825 p462 p7 p691 p847 p153 p369 p375 p277 l000-000 )
  )
)
