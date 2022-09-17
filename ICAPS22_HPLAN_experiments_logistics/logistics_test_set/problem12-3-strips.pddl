( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l605 - location
    l324 - location
    l374 - location
    l451 - location
    l96 - location
    l103 - location
    l465 - location
    l338 - location
    l794 - location
    l559 - location
    l733 - location
    l332 - location
    l645 - location
    l585 - location
    l272 - location
    p267 - obj
    p472 - obj
    p804 - obj
    p196 - obj
    p884 - obj
    p700 - obj
    p843 - obj
    p765 - obj
    p1 - obj
    p695 - obj
    p725 - obj
    p284 - obj
    t1984 - truck
    t1315 - truck
    t1319 - truck
    t1531 - truck
    t1179 - truck
    t1095 - truck
    t1218 - truck
    t1685 - truck
    t1801 - truck
    t1795 - truck
    t1492 - truck
  )
  ( :init
    ( in-city l605 c000 )
    ( in-city l324 c000 )
    ( in-city l374 c000 )
    ( in-city l451 c000 )
    ( in-city l96 c000 )
    ( in-city l103 c000 )
    ( in-city l465 c000 )
    ( in-city l338 c000 )
    ( in-city l794 c000 )
    ( in-city l559 c000 )
    ( in-city l733 c000 )
    ( in-city l332 c000 )
    ( in-city l645 c000 )
    ( in-city l585 c000 )
    ( in-city l272 c000 )
    ( in-truck p267 t1685 )
    ( obj-at p472 l794 )
    ( obj-at p804 l324 )
    ( obj-at p196 l103 )
    ( obj-at p884 l465 )
    ( obj-at p700 l585 )
    ( in-truck p843 t1984 )
    ( obj-at p765 l338 )
    ( in-truck p1 t1531 )
    ( obj-at p695 l794 )
    ( in-truck p725 t1315 )
    ( obj-at p284 l272 )
    ( truck-at t1984 l374 )
    ( truck-at t1315 l465 )
    ( truck-at t1319 l465 )
    ( truck-at t1531 l96 )
    ( truck-at t1179 l733 )
    ( truck-at t1095 l585 )
    ( truck-at t1218 l645 )
    ( truck-at t1685 l559 )
    ( truck-at t1801 l645 )
    ( truck-at t1795 l585 )
    ( truck-at t1492 l451 )
    ( greater-than p472 p267 )
    ( greater-than p804 p267 )
    ( greater-than p804 p472 )
    ( greater-than p196 p267 )
    ( greater-than p196 p472 )
    ( greater-than p196 p804 )
    ( greater-than p884 p267 )
    ( greater-than p884 p472 )
    ( greater-than p884 p804 )
    ( greater-than p884 p196 )
    ( greater-than p700 p267 )
    ( greater-than p700 p472 )
    ( greater-than p700 p804 )
    ( greater-than p700 p196 )
    ( greater-than p700 p884 )
    ( greater-than p843 p267 )
    ( greater-than p843 p472 )
    ( greater-than p843 p804 )
    ( greater-than p843 p196 )
    ( greater-than p843 p884 )
    ( greater-than p843 p700 )
    ( greater-than p765 p267 )
    ( greater-than p765 p472 )
    ( greater-than p765 p804 )
    ( greater-than p765 p196 )
    ( greater-than p765 p884 )
    ( greater-than p765 p700 )
    ( greater-than p765 p843 )
    ( greater-than p1 p267 )
    ( greater-than p1 p472 )
    ( greater-than p1 p804 )
    ( greater-than p1 p196 )
    ( greater-than p1 p884 )
    ( greater-than p1 p700 )
    ( greater-than p1 p843 )
    ( greater-than p1 p765 )
    ( greater-than p695 p267 )
    ( greater-than p695 p472 )
    ( greater-than p695 p804 )
    ( greater-than p695 p196 )
    ( greater-than p695 p884 )
    ( greater-than p695 p700 )
    ( greater-than p695 p843 )
    ( greater-than p695 p765 )
    ( greater-than p695 p1 )
    ( greater-than p725 p267 )
    ( greater-than p725 p472 )
    ( greater-than p725 p804 )
    ( greater-than p725 p196 )
    ( greater-than p725 p884 )
    ( greater-than p725 p700 )
    ( greater-than p725 p843 )
    ( greater-than p725 p765 )
    ( greater-than p725 p1 )
    ( greater-than p725 p695 )
    ( greater-than p284 p267 )
    ( greater-than p284 p472 )
    ( greater-than p284 p804 )
    ( greater-than p284 p196 )
    ( greater-than p284 p884 )
    ( greater-than p284 p700 )
    ( greater-than p284 p843 )
    ( greater-than p284 p765 )
    ( greater-than p284 p1 )
    ( greater-than p284 p695 )
    ( greater-than p284 p725 )
  )
  ( :goal
    ( and
      ( obj-at p267 l605 )
      ( obj-at p472 l605 )
      ( obj-at p804 l605 )
      ( obj-at p196 l605 )
      ( obj-at p884 l605 )
      ( obj-at p700 l605 )
      ( obj-at p843 l605 )
      ( obj-at p765 l605 )
      ( obj-at p1 l605 )
      ( obj-at p695 l605 )
      ( obj-at p725 l605 )
      ( obj-at p284 l605 )
    )
  )
)
