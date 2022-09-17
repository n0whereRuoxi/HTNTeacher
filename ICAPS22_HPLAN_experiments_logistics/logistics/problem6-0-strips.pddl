( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-457 - location
    l000-651 - location
    l000-259 - location
    l000-366 - location
    l000-481 - location
    l000-730 - location
    l000-972 - location
    l000-58 - location
    l000-220 - location
    l000-462 - location
    l000-214 - location
    l000-921 - location
    p218 - obj
    p435 - obj
    p590 - obj
    p62 - obj
    p342 - obj
    p705 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-457 c000 )
    ( in-city l000-651 c000 )
    ( in-city l000-259 c000 )
    ( in-city l000-366 c000 )
    ( in-city l000-481 c000 )
    ( in-city l000-730 c000 )
    ( in-city l000-972 c000 )
    ( in-city l000-58 c000 )
    ( in-city l000-220 c000 )
    ( in-city l000-462 c000 )
    ( in-city l000-214 c000 )
    ( in-city l000-921 c000 )
    ( obj-at p218 l000-921 )
    ( obj-at p435 l000-220 )
    ( obj-at p590 l000-259 )
    ( obj-at p62 l000-921 )
    ( obj-at p342 l000-972 )
    ( obj-at p705 l000-220 )
    ( greater-than p435 p218 )
    ( greater-than p590 p218 )
    ( greater-than p590 p435 )
    ( greater-than p62 p218 )
    ( greater-than p62 p435 )
    ( greater-than p62 p590 )
    ( greater-than p342 p218 )
    ( greater-than p342 p435 )
    ( greater-than p342 p590 )
    ( greater-than p342 p62 )
    ( greater-than p705 p218 )
    ( greater-than p705 p435 )
    ( greater-than p705 p590 )
    ( greater-than p705 p62 )
    ( greater-than p705 p342 )
  )
  ( :goal
    ( and
      ( obj-at p218 l000-000 )
      ( obj-at p435 l000-000 )
      ( obj-at p590 l000-000 )
      ( obj-at p62 l000-000 )
      ( obj-at p342 l000-000 )
      ( obj-at p705 l000-000 )
    )
  )
)
