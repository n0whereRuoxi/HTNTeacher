( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l953 - location
    l145 - location
    l353 - location
    l859 - location
    l738 - location
    p245 - obj
    p114 - obj
    p335 - obj
    t1540 - truck
    t1166 - truck
  )
  ( :init
    ( in-city l953 c000 )
    ( in-city l145 c000 )
    ( in-city l353 c000 )
    ( in-city l859 c000 )
    ( in-city l738 c000 )
    ( in-truck p245 t1166 )
    ( in-truck p114 t1166 )
    ( obj-at p335 l145 )
    ( truck-at t1540 l353 )
    ( truck-at t1166 l738 )
    ( greater-than p114 p245 )
    ( greater-than p335 p245 )
    ( greater-than p335 p114 )
  )
  ( :goal
    ( and
      ( obj-at p245 l953 )
      ( obj-at p114 l953 )
      ( obj-at p335 l953 )
    )
  )
)
