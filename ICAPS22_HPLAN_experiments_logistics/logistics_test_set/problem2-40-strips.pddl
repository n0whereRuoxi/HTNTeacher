( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l935 - location
    l154 - location
    l847 - location
    p90 - obj
    p411 - obj
    t1857 - truck
  )
  ( :init
    ( in-city l935 c000 )
    ( in-city l154 c000 )
    ( in-city l847 c000 )
    ( obj-at p90 l154 )
    ( in-truck p411 t1857 )
    ( truck-at t1857 l847 )
    ( greater-than p411 p90 )
  )
  ( :goal
    ( and
      ( obj-at p90 l935 )
      ( obj-at p411 l935 )
    )
  )
)
