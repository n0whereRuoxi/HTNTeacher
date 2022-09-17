( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l904 - location
    l267 - location
    l678 - location
    l318 - location
    p202 - obj
    p929 - obj
    p533 - obj
    p61 - obj
    t1196 - truck
    t1436 - truck
    t1538 - truck
  )
  ( :init
    ( in-city l904 c000 )
    ( in-city l267 c000 )
    ( in-city l678 c000 )
    ( in-city l318 c000 )
    ( in-truck p202 t1196 )
    ( in-truck p929 t1196 )
    ( in-truck p533 t1538 )
    ( in-truck p61 t1538 )
    ( truck-at t1196 l904 )
    ( truck-at t1436 l318 )
    ( truck-at t1538 l678 )
    ( greater-than p929 p202 )
    ( greater-than p533 p202 )
    ( greater-than p533 p929 )
    ( greater-than p61 p202 )
    ( greater-than p61 p929 )
    ( greater-than p61 p533 )
  )
  ( :goal
    ( and
      ( obj-at p202 l904 )
      ( obj-at p929 l904 )
      ( obj-at p533 l904 )
      ( obj-at p61 l904 )
    )
  )
)
