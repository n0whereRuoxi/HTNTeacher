( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l929 - location
    l747 - location
    l153 - location
    p751 - obj
    p173 - obj
    t1298 - truck
  )
  ( :init
    ( in-city l929 c000 )
    ( in-city l747 c000 )
    ( in-city l153 c000 )
    ( obj-at p751 l153 )
    ( obj-at p173 l747 )
    ( truck-at t1298 l929 )
    ( greater-than p173 p751 )
  )
  ( :goal
    ( and
      ( obj-at p751 l929 )
      ( obj-at p173 l929 )
    )
  )
)
