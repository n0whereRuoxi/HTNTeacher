( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-532 - location
    l000-857 - location
    l000-403 - location
    l000-299 - location
    l000-32 - location
    l000-608 - location
    l000-499 - location
    l000-461 - location
    l000-610 - location
    l000-518 - location
    l000-704 - location
    l000-966 - location
    p749 - obj
    p302 - obj
    p449 - obj
    p573 - obj
    p252 - obj
    p769 - obj
    p394 - obj
    p421 - obj
    p639 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-532 c000 )
    ( in-city l000-857 c000 )
    ( in-city l000-403 c000 )
    ( in-city l000-299 c000 )
    ( in-city l000-32 c000 )
    ( in-city l000-608 c000 )
    ( in-city l000-499 c000 )
    ( in-city l000-461 c000 )
    ( in-city l000-610 c000 )
    ( in-city l000-518 c000 )
    ( in-city l000-704 c000 )
    ( in-city l000-966 c000 )
    ( obj-at p749 l000-461 )
    ( obj-at p302 l000-532 )
    ( obj-at p449 l000-499 )
    ( obj-at p573 l000-32 )
    ( obj-at p252 l000-299 )
    ( obj-at p769 l000-403 )
    ( obj-at p394 l000-499 )
    ( obj-at p421 l000-857 )
    ( obj-at p639 l000-704 )
    ( greater-than p302 p749 )
    ( greater-than p449 p749 )
    ( greater-than p449 p302 )
    ( greater-than p573 p749 )
    ( greater-than p573 p302 )
    ( greater-than p573 p449 )
    ( greater-than p252 p749 )
    ( greater-than p252 p302 )
    ( greater-than p252 p449 )
    ( greater-than p252 p573 )
    ( greater-than p769 p749 )
    ( greater-than p769 p302 )
    ( greater-than p769 p449 )
    ( greater-than p769 p573 )
    ( greater-than p769 p252 )
    ( greater-than p394 p749 )
    ( greater-than p394 p302 )
    ( greater-than p394 p449 )
    ( greater-than p394 p573 )
    ( greater-than p394 p252 )
    ( greater-than p394 p769 )
    ( greater-than p421 p749 )
    ( greater-than p421 p302 )
    ( greater-than p421 p449 )
    ( greater-than p421 p573 )
    ( greater-than p421 p252 )
    ( greater-than p421 p769 )
    ( greater-than p421 p394 )
    ( greater-than p639 p749 )
    ( greater-than p639 p302 )
    ( greater-than p639 p449 )
    ( greater-than p639 p573 )
    ( greater-than p639 p252 )
    ( greater-than p639 p769 )
    ( greater-than p639 p394 )
    ( greater-than p639 p421 )
  )
  ( :tasks
    ( Deliver-9Pkg p749 p302 p449 p573 p252 p769 p394 p421 p639 l000-000 )
  )
)
