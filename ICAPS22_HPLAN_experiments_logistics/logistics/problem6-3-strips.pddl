( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-669 - location
    l000-142 - location
    l000-858 - location
    l000-756 - location
    l000-847 - location
    l000-429 - location
    l000-90 - location
    l000-873 - location
    l000-746 - location
    l000-354 - location
    l000-732 - location
    l000-813 - location
    p305 - obj
    p968 - obj
    p317 - obj
    p349 - obj
    p557 - obj
    p945 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-669 c000 )
    ( in-city l000-142 c000 )
    ( in-city l000-858 c000 )
    ( in-city l000-756 c000 )
    ( in-city l000-847 c000 )
    ( in-city l000-429 c000 )
    ( in-city l000-90 c000 )
    ( in-city l000-873 c000 )
    ( in-city l000-746 c000 )
    ( in-city l000-354 c000 )
    ( in-city l000-732 c000 )
    ( in-city l000-813 c000 )
    ( obj-at p305 l000-732 )
    ( obj-at p968 l000-732 )
    ( obj-at p317 l000-669 )
    ( obj-at p349 l000-756 )
    ( obj-at p557 l000-756 )
    ( obj-at p945 l000-669 )
    ( greater-than p968 p305 )
    ( greater-than p317 p305 )
    ( greater-than p317 p968 )
    ( greater-than p349 p305 )
    ( greater-than p349 p968 )
    ( greater-than p349 p317 )
    ( greater-than p557 p305 )
    ( greater-than p557 p968 )
    ( greater-than p557 p317 )
    ( greater-than p557 p349 )
    ( greater-than p945 p305 )
    ( greater-than p945 p968 )
    ( greater-than p945 p317 )
    ( greater-than p945 p349 )
    ( greater-than p945 p557 )
  )
  ( :goal
    ( and
      ( obj-at p305 l000-000 )
      ( obj-at p968 l000-000 )
      ( obj-at p317 l000-000 )
      ( obj-at p349 l000-000 )
      ( obj-at p557 l000-000 )
      ( obj-at p945 l000-000 )
    )
  )
)
