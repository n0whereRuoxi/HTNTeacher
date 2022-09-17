( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l806 - location
    l682 - location
    l281 - location
    l180 - location
    l808 - location
    l414 - location
    l404 - location
    p611 - obj
    p404 - obj
    p820 - obj
    p458 - obj
    t1705 - truck
    t1571 - truck
    t1562 - truck
  )
  ( :init
    ( in-city l806 c000 )
    ( in-city l682 c000 )
    ( in-city l281 c000 )
    ( in-city l180 c000 )
    ( in-city l808 c000 )
    ( in-city l414 c000 )
    ( in-city l404 c000 )
    ( obj-at p611 l808 )
    ( obj-at p404 l281 )
    ( obj-at p820 l682 )
    ( obj-at p458 l180 )
    ( truck-at t1705 l404 )
    ( truck-at t1571 l180 )
    ( truck-at t1562 l808 )
    ( greater-than p404 p611 )
    ( greater-than p820 p611 )
    ( greater-than p820 p404 )
    ( greater-than p458 p611 )
    ( greater-than p458 p404 )
    ( greater-than p458 p820 )
  )
  ( :goal
    ( and
      ( obj-at p611 l806 )
      ( obj-at p404 l806 )
      ( obj-at p820 l806 )
      ( obj-at p458 l806 )
    )
  )
)
