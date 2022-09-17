( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l753 - location
    l534 - location
    l680 - location
    l623 - location
    l842 - location
    p693 - obj
    p238 - obj
    p210 - obj
    p471 - obj
    p9 - obj
    p596 - obj
    p299 - obj
    p947 - obj
    p794 - obj
    t1127 - truck
    t1569 - truck
    t1713 - truck
    t1174 - truck
    t1976 - truck
    t1063 - truck
    t1594 - truck
    t1626 - truck
  )
  ( :init
    ( in-city l753 c000 )
    ( in-city l534 c000 )
    ( in-city l680 c000 )
    ( in-city l623 c000 )
    ( in-city l842 c000 )
    ( in-truck p693 t1127 )
    ( in-truck p238 t1713 )
    ( obj-at p210 l680 )
    ( in-truck p471 t1569 )
    ( in-truck p9 t1569 )
    ( in-truck p596 t1127 )
    ( obj-at p299 l842 )
    ( in-truck p947 t1976 )
    ( in-truck p794 t1976 )
    ( truck-at t1127 l534 )
    ( truck-at t1569 l534 )
    ( truck-at t1713 l842 )
    ( truck-at t1174 l842 )
    ( truck-at t1976 l680 )
    ( truck-at t1063 l534 )
    ( truck-at t1594 l842 )
    ( truck-at t1626 l534 )
    ( greater-than p238 p693 )
    ( greater-than p210 p693 )
    ( greater-than p210 p238 )
    ( greater-than p471 p693 )
    ( greater-than p471 p238 )
    ( greater-than p471 p210 )
    ( greater-than p9 p693 )
    ( greater-than p9 p238 )
    ( greater-than p9 p210 )
    ( greater-than p9 p471 )
    ( greater-than p596 p693 )
    ( greater-than p596 p238 )
    ( greater-than p596 p210 )
    ( greater-than p596 p471 )
    ( greater-than p596 p9 )
    ( greater-than p299 p693 )
    ( greater-than p299 p238 )
    ( greater-than p299 p210 )
    ( greater-than p299 p471 )
    ( greater-than p299 p9 )
    ( greater-than p299 p596 )
    ( greater-than p947 p693 )
    ( greater-than p947 p238 )
    ( greater-than p947 p210 )
    ( greater-than p947 p471 )
    ( greater-than p947 p9 )
    ( greater-than p947 p596 )
    ( greater-than p947 p299 )
    ( greater-than p794 p693 )
    ( greater-than p794 p238 )
    ( greater-than p794 p210 )
    ( greater-than p794 p471 )
    ( greater-than p794 p9 )
    ( greater-than p794 p596 )
    ( greater-than p794 p299 )
    ( greater-than p794 p947 )
  )
  ( :goal
    ( and
      ( obj-at p693 l753 )
      ( obj-at p238 l753 )
      ( obj-at p210 l753 )
      ( obj-at p471 l753 )
      ( obj-at p9 l753 )
      ( obj-at p596 l753 )
      ( obj-at p299 l753 )
      ( obj-at p947 l753 )
      ( obj-at p794 l753 )
    )
  )
)
