( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l569 - location
    l241 - location
    l486 - location
    l556 - location
    l359 - location
    l791 - location
    l609 - location
    p708 - obj
    p691 - obj
    p671 - obj
    p464 - obj
    t1166 - truck
    t1575 - truck
    t1754 - truck
  )
  ( :init
    ( in-city l569 c000 )
    ( in-city l241 c000 )
    ( in-city l486 c000 )
    ( in-city l556 c000 )
    ( in-city l359 c000 )
    ( in-city l791 c000 )
    ( in-city l609 c000 )
    ( in-truck p708 t1754 )
    ( in-truck p691 t1754 )
    ( obj-at p671 l609 )
    ( in-truck p464 t1575 )
    ( truck-at t1166 l556 )
    ( truck-at t1575 l241 )
    ( truck-at t1754 l609 )
    ( greater-than p691 p708 )
    ( greater-than p671 p708 )
    ( greater-than p671 p691 )
    ( greater-than p464 p708 )
    ( greater-than p464 p691 )
    ( greater-than p464 p671 )
  )
  ( :goal
    ( and
      ( obj-at p708 l569 )
      ( obj-at p691 l569 )
      ( obj-at p671 l569 )
      ( obj-at p464 l569 )
    )
  )
)
