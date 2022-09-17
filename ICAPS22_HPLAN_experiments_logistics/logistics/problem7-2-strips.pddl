( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-515 - location
    l000-354 - location
    l000-181 - location
    l000-933 - location
    l000-940 - location
    l000-163 - location
    l000-230 - location
    l000-773 - location
    l000-825 - location
    l000-147 - location
    p146 - obj
    p400 - obj
    p293 - obj
    p826 - obj
    p40 - obj
    p702 - obj
    p267 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-515 c000 )
    ( in-city l000-354 c000 )
    ( in-city l000-181 c000 )
    ( in-city l000-933 c000 )
    ( in-city l000-940 c000 )
    ( in-city l000-163 c000 )
    ( in-city l000-230 c000 )
    ( in-city l000-773 c000 )
    ( in-city l000-825 c000 )
    ( in-city l000-147 c000 )
    ( obj-at p146 l000-230 )
    ( obj-at p400 l000-163 )
    ( obj-at p293 l000-163 )
    ( obj-at p826 l000-230 )
    ( obj-at p40 l000-933 )
    ( obj-at p702 l000-515 )
    ( obj-at p267 l000-230 )
    ( greater-than p400 p146 )
    ( greater-than p293 p146 )
    ( greater-than p293 p400 )
    ( greater-than p826 p146 )
    ( greater-than p826 p400 )
    ( greater-than p826 p293 )
    ( greater-than p40 p146 )
    ( greater-than p40 p400 )
    ( greater-than p40 p293 )
    ( greater-than p40 p826 )
    ( greater-than p702 p146 )
    ( greater-than p702 p400 )
    ( greater-than p702 p293 )
    ( greater-than p702 p826 )
    ( greater-than p702 p40 )
    ( greater-than p267 p146 )
    ( greater-than p267 p400 )
    ( greater-than p267 p293 )
    ( greater-than p267 p826 )
    ( greater-than p267 p40 )
    ( greater-than p267 p702 )
  )
  ( :goal
    ( and
      ( obj-at p146 l000-000 )
      ( obj-at p400 l000-000 )
      ( obj-at p293 l000-000 )
      ( obj-at p826 l000-000 )
      ( obj-at p40 l000-000 )
      ( obj-at p702 l000-000 )
      ( obj-at p267 l000-000 )
    )
  )
)
