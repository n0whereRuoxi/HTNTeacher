( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l582 - location
    l92 - location
    p538 - obj
    p299 - obj
    t1426 - truck
  )
  ( :init
    ( in-city l582 c000 )
    ( in-city l92 c000 )
    ( obj-at p538 l92 )
    ( obj-at p299 l92 )
    ( truck-at t1426 l582 )
    ( greater-than p299 p538 )
  )
  ( :goal
    ( and
      ( obj-at p538 l582 )
      ( obj-at p299 l582 )
    )
  )
)
