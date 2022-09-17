( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l591 - location
    l245 - location
    l861 - location
    l223 - location
    l269 - location
    l335 - location
    p49 - obj
    p778 - obj
    p474 - obj
    t1383 - truck
    t1015 - truck
  )
  ( :init
    ( in-city l591 c000 )
    ( in-city l245 c000 )
    ( in-city l861 c000 )
    ( in-city l223 c000 )
    ( in-city l269 c000 )
    ( in-city l335 c000 )
    ( obj-at p49 l223 )
    ( obj-at p778 l335 )
    ( obj-at p474 l335 )
    ( truck-at t1383 l245 )
    ( truck-at t1015 l861 )
    ( greater-than p778 p49 )
    ( greater-than p474 p49 )
    ( greater-than p474 p778 )
  )
  ( :goal
    ( and
      ( obj-at p49 l591 )
      ( obj-at p778 l591 )
      ( obj-at p474 l591 )
    )
  )
)
