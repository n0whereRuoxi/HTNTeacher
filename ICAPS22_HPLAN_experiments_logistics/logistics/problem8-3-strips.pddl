( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-427 - location
    l000-89 - location
    l000-423 - location
    l000-201 - location
    l000-366 - location
    l000-916 - location
    l000-461 - location
    l000-165 - location
    l000-330 - location
    l000-763 - location
    l000-95 - location
    l000-202 - location
    l000-282 - location
    l000-642 - location
    l000-960 - location
    p191 - obj
    p689 - obj
    p480 - obj
    p130 - obj
    p162 - obj
    p573 - obj
    p684 - obj
    p659 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-427 c000 )
    ( in-city l000-89 c000 )
    ( in-city l000-423 c000 )
    ( in-city l000-201 c000 )
    ( in-city l000-366 c000 )
    ( in-city l000-916 c000 )
    ( in-city l000-461 c000 )
    ( in-city l000-165 c000 )
    ( in-city l000-330 c000 )
    ( in-city l000-763 c000 )
    ( in-city l000-95 c000 )
    ( in-city l000-202 c000 )
    ( in-city l000-282 c000 )
    ( in-city l000-642 c000 )
    ( in-city l000-960 c000 )
    ( obj-at p191 l000-461 )
    ( obj-at p689 l000-201 )
    ( obj-at p480 l000-763 )
    ( obj-at p130 l000-202 )
    ( obj-at p162 l000-366 )
    ( obj-at p573 l000-201 )
    ( obj-at p684 l000-89 )
    ( obj-at p659 l000-95 )
    ( greater-than p689 p191 )
    ( greater-than p480 p191 )
    ( greater-than p480 p689 )
    ( greater-than p130 p191 )
    ( greater-than p130 p689 )
    ( greater-than p130 p480 )
    ( greater-than p162 p191 )
    ( greater-than p162 p689 )
    ( greater-than p162 p480 )
    ( greater-than p162 p130 )
    ( greater-than p573 p191 )
    ( greater-than p573 p689 )
    ( greater-than p573 p480 )
    ( greater-than p573 p130 )
    ( greater-than p573 p162 )
    ( greater-than p684 p191 )
    ( greater-than p684 p689 )
    ( greater-than p684 p480 )
    ( greater-than p684 p130 )
    ( greater-than p684 p162 )
    ( greater-than p684 p573 )
    ( greater-than p659 p191 )
    ( greater-than p659 p689 )
    ( greater-than p659 p480 )
    ( greater-than p659 p130 )
    ( greater-than p659 p162 )
    ( greater-than p659 p573 )
    ( greater-than p659 p684 )
  )
  ( :goal
    ( and
      ( obj-at p191 l000-000 )
      ( obj-at p689 l000-000 )
      ( obj-at p480 l000-000 )
      ( obj-at p130 l000-000 )
      ( obj-at p162 l000-000 )
      ( obj-at p573 l000-000 )
      ( obj-at p684 l000-000 )
      ( obj-at p659 l000-000 )
    )
  )
)
