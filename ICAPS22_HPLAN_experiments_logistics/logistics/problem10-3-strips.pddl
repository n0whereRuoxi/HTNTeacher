( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-688 - location
    l000-679 - location
    l000-991 - location
    l000-481 - location
    l000-416 - location
    l000-391 - location
    l000-380 - location
    l000-37 - location
    l000-197 - location
    l000-628 - location
    l000-362 - location
    p216 - obj
    p813 - obj
    p497 - obj
    p638 - obj
    p403 - obj
    p968 - obj
    p405 - obj
    p940 - obj
    p951 - obj
    p374 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-688 c000 )
    ( in-city l000-679 c000 )
    ( in-city l000-991 c000 )
    ( in-city l000-481 c000 )
    ( in-city l000-416 c000 )
    ( in-city l000-391 c000 )
    ( in-city l000-380 c000 )
    ( in-city l000-37 c000 )
    ( in-city l000-197 c000 )
    ( in-city l000-628 c000 )
    ( in-city l000-362 c000 )
    ( obj-at p216 l000-991 )
    ( obj-at p813 l000-197 )
    ( obj-at p497 l000-391 )
    ( obj-at p638 l000-679 )
    ( obj-at p403 l000-391 )
    ( obj-at p968 l000-688 )
    ( obj-at p405 l000-628 )
    ( obj-at p940 l000-362 )
    ( obj-at p951 l000-362 )
    ( obj-at p374 l000-380 )
    ( greater-than p813 p216 )
    ( greater-than p497 p216 )
    ( greater-than p497 p813 )
    ( greater-than p638 p216 )
    ( greater-than p638 p813 )
    ( greater-than p638 p497 )
    ( greater-than p403 p216 )
    ( greater-than p403 p813 )
    ( greater-than p403 p497 )
    ( greater-than p403 p638 )
    ( greater-than p968 p216 )
    ( greater-than p968 p813 )
    ( greater-than p968 p497 )
    ( greater-than p968 p638 )
    ( greater-than p968 p403 )
    ( greater-than p405 p216 )
    ( greater-than p405 p813 )
    ( greater-than p405 p497 )
    ( greater-than p405 p638 )
    ( greater-than p405 p403 )
    ( greater-than p405 p968 )
    ( greater-than p940 p216 )
    ( greater-than p940 p813 )
    ( greater-than p940 p497 )
    ( greater-than p940 p638 )
    ( greater-than p940 p403 )
    ( greater-than p940 p968 )
    ( greater-than p940 p405 )
    ( greater-than p951 p216 )
    ( greater-than p951 p813 )
    ( greater-than p951 p497 )
    ( greater-than p951 p638 )
    ( greater-than p951 p403 )
    ( greater-than p951 p968 )
    ( greater-than p951 p405 )
    ( greater-than p951 p940 )
    ( greater-than p374 p216 )
    ( greater-than p374 p813 )
    ( greater-than p374 p497 )
    ( greater-than p374 p638 )
    ( greater-than p374 p403 )
    ( greater-than p374 p968 )
    ( greater-than p374 p405 )
    ( greater-than p374 p940 )
    ( greater-than p374 p951 )
  )
  ( :goal
    ( and
      ( obj-at p216 l000-000 )
      ( obj-at p813 l000-000 )
      ( obj-at p497 l000-000 )
      ( obj-at p638 l000-000 )
      ( obj-at p403 l000-000 )
      ( obj-at p968 l000-000 )
      ( obj-at p405 l000-000 )
      ( obj-at p940 l000-000 )
      ( obj-at p951 l000-000 )
      ( obj-at p374 l000-000 )
    )
  )
)
