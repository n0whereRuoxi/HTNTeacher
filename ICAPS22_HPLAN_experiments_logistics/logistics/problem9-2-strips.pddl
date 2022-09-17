( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-632 - location
    l000-78 - location
    l000-950 - location
    l000-609 - location
    l000-89 - location
    l000-980 - location
    l000-552 - location
    l000-37 - location
    l000-33 - location
    l000-755 - location
    p320 - obj
    p109 - obj
    p784 - obj
    p458 - obj
    p802 - obj
    p50 - obj
    p877 - obj
    p337 - obj
    p641 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-632 c000 )
    ( in-city l000-78 c000 )
    ( in-city l000-950 c000 )
    ( in-city l000-609 c000 )
    ( in-city l000-89 c000 )
    ( in-city l000-980 c000 )
    ( in-city l000-552 c000 )
    ( in-city l000-37 c000 )
    ( in-city l000-33 c000 )
    ( in-city l000-755 c000 )
    ( obj-at p320 l000-552 )
    ( obj-at p109 l000-950 )
    ( obj-at p784 l000-980 )
    ( obj-at p458 l000-950 )
    ( obj-at p802 l000-33 )
    ( obj-at p50 l000-89 )
    ( obj-at p877 l000-950 )
    ( obj-at p337 l000-89 )
    ( obj-at p641 l000-78 )
    ( greater-than p109 p320 )
    ( greater-than p784 p320 )
    ( greater-than p784 p109 )
    ( greater-than p458 p320 )
    ( greater-than p458 p109 )
    ( greater-than p458 p784 )
    ( greater-than p802 p320 )
    ( greater-than p802 p109 )
    ( greater-than p802 p784 )
    ( greater-than p802 p458 )
    ( greater-than p50 p320 )
    ( greater-than p50 p109 )
    ( greater-than p50 p784 )
    ( greater-than p50 p458 )
    ( greater-than p50 p802 )
    ( greater-than p877 p320 )
    ( greater-than p877 p109 )
    ( greater-than p877 p784 )
    ( greater-than p877 p458 )
    ( greater-than p877 p802 )
    ( greater-than p877 p50 )
    ( greater-than p337 p320 )
    ( greater-than p337 p109 )
    ( greater-than p337 p784 )
    ( greater-than p337 p458 )
    ( greater-than p337 p802 )
    ( greater-than p337 p50 )
    ( greater-than p337 p877 )
    ( greater-than p641 p320 )
    ( greater-than p641 p109 )
    ( greater-than p641 p784 )
    ( greater-than p641 p458 )
    ( greater-than p641 p802 )
    ( greater-than p641 p50 )
    ( greater-than p641 p877 )
    ( greater-than p641 p337 )
  )
  ( :goal
    ( and
      ( obj-at p320 l000-000 )
      ( obj-at p109 l000-000 )
      ( obj-at p784 l000-000 )
      ( obj-at p458 l000-000 )
      ( obj-at p802 l000-000 )
      ( obj-at p50 l000-000 )
      ( obj-at p877 l000-000 )
      ( obj-at p337 l000-000 )
      ( obj-at p641 l000-000 )
    )
  )
)
