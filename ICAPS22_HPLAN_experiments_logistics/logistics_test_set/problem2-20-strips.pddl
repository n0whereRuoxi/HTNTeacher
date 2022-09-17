( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l929 - location
    l916 - location
    l79 - location
    p623 - obj
    p651 - obj
    t1816 - truck
  )
  ( :init
    ( in-city l929 c000 )
    ( in-city l916 c000 )
    ( in-city l79 c000 )
    ( obj-at p623 l79 )
    ( in-truck p651 t1816 )
    ( truck-at t1816 l929 )
    ( greater-than p651 p623 )
  )
  ( :goal
    ( and
      ( obj-at p623 l929 )
      ( obj-at p651 l929 )
    )
  )
)
