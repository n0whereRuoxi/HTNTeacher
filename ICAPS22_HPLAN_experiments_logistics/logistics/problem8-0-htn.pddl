( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-333 - location
    l000-232 - location
    l000-991 - location
    l000-771 - location
    l000-868 - location
    l000-606 - location
    p558 - obj
    p217 - obj
    p381 - obj
    p497 - obj
    p273 - obj
    p844 - obj
    p100 - obj
    p949 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-333 c000 )
    ( in-city l000-232 c000 )
    ( in-city l000-991 c000 )
    ( in-city l000-771 c000 )
    ( in-city l000-868 c000 )
    ( in-city l000-606 c000 )
    ( obj-at p558 l000-606 )
    ( obj-at p217 l000-606 )
    ( obj-at p381 l000-868 )
    ( obj-at p497 l000-771 )
    ( obj-at p273 l000-606 )
    ( obj-at p844 l000-232 )
    ( obj-at p100 l000-868 )
    ( obj-at p949 l000-232 )
    ( greater-than p217 p558 )
    ( greater-than p381 p558 )
    ( greater-than p381 p217 )
    ( greater-than p497 p558 )
    ( greater-than p497 p217 )
    ( greater-than p497 p381 )
    ( greater-than p273 p558 )
    ( greater-than p273 p217 )
    ( greater-than p273 p381 )
    ( greater-than p273 p497 )
    ( greater-than p844 p558 )
    ( greater-than p844 p217 )
    ( greater-than p844 p381 )
    ( greater-than p844 p497 )
    ( greater-than p844 p273 )
    ( greater-than p100 p558 )
    ( greater-than p100 p217 )
    ( greater-than p100 p381 )
    ( greater-than p100 p497 )
    ( greater-than p100 p273 )
    ( greater-than p100 p844 )
    ( greater-than p949 p558 )
    ( greater-than p949 p217 )
    ( greater-than p949 p381 )
    ( greater-than p949 p497 )
    ( greater-than p949 p273 )
    ( greater-than p949 p844 )
    ( greater-than p949 p100 )
  )
  ( :tasks
    ( Deliver-8Pkg p558 p217 p381 p497 p273 p844 p100 p949 l000-000 )
  )
)
