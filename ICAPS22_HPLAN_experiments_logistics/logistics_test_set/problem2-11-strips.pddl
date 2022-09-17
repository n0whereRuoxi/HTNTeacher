( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l782 - location
    p112 - obj
    p62 - obj
    t1335 - truck
  )
  ( :init
    ( in-city l782 c000 )
    ( in-truck p112 t1335 )
    ( in-truck p62 t1335 )
    ( truck-at t1335 l782 )
    ( greater-than p62 p112 )
  )
  ( :goal
    ( and
      ( obj-at p112 l782 )
      ( obj-at p62 l782 )
    )
  )
)
