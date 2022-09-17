( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l547 - location
    l68 - location
    l689 - location
    l344 - location
    p519 - obj
    p126 - obj
    p812 - obj
    t1676 - truck
    t1820 - truck
  )
  ( :init
    ( in-city l547 c000 )
    ( in-city l68 c000 )
    ( in-city l689 c000 )
    ( in-city l344 c000 )
    ( obj-at p519 l344 )
    ( in-truck p126 t1820 )
    ( in-truck p812 t1820 )
    ( truck-at t1676 l68 )
    ( truck-at t1820 l547 )
    ( greater-than p126 p519 )
    ( greater-than p812 p519 )
    ( greater-than p812 p126 )
  )
  ( :goal
    ( and
      ( obj-at p519 l547 )
      ( obj-at p126 l547 )
      ( obj-at p812 l547 )
    )
  )
)
