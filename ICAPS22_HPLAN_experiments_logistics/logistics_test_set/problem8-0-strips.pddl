( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l782 - location
    l694 - location
    l925 - location
    l497 - location
    l547 - location
    l474 - location
    l56 - location
    p858 - obj
    p640 - obj
    p2 - obj
    p67 - obj
    p223 - obj
    p660 - obj
    p473 - obj
    p279 - obj
    t1157 - truck
    t1197 - truck
    t1513 - truck
    t1310 - truck
    t1076 - truck
    t1311 - truck
    t1614 - truck
  )
  ( :init
    ( in-city l782 c000 )
    ( in-city l694 c000 )
    ( in-city l925 c000 )
    ( in-city l497 c000 )
    ( in-city l547 c000 )
    ( in-city l474 c000 )
    ( in-city l56 c000 )
    ( obj-at p858 l474 )
    ( obj-at p640 l56 )
    ( in-truck p2 t1197 )
    ( in-truck p67 t1076 )
    ( obj-at p223 l694 )
    ( in-truck p660 t1157 )
    ( in-truck p473 t1076 )
    ( in-truck p279 t1513 )
    ( truck-at t1157 l547 )
    ( truck-at t1197 l497 )
    ( truck-at t1513 l56 )
    ( truck-at t1310 l56 )
    ( truck-at t1076 l497 )
    ( truck-at t1311 l782 )
    ( truck-at t1614 l497 )
    ( greater-than p640 p858 )
    ( greater-than p2 p858 )
    ( greater-than p2 p640 )
    ( greater-than p67 p858 )
    ( greater-than p67 p640 )
    ( greater-than p67 p2 )
    ( greater-than p223 p858 )
    ( greater-than p223 p640 )
    ( greater-than p223 p2 )
    ( greater-than p223 p67 )
    ( greater-than p660 p858 )
    ( greater-than p660 p640 )
    ( greater-than p660 p2 )
    ( greater-than p660 p67 )
    ( greater-than p660 p223 )
    ( greater-than p473 p858 )
    ( greater-than p473 p640 )
    ( greater-than p473 p2 )
    ( greater-than p473 p67 )
    ( greater-than p473 p223 )
    ( greater-than p473 p660 )
    ( greater-than p279 p858 )
    ( greater-than p279 p640 )
    ( greater-than p279 p2 )
    ( greater-than p279 p67 )
    ( greater-than p279 p223 )
    ( greater-than p279 p660 )
    ( greater-than p279 p473 )
  )
  ( :goal
    ( and
      ( obj-at p858 l782 )
      ( obj-at p640 l782 )
      ( obj-at p2 l782 )
      ( obj-at p67 l782 )
      ( obj-at p223 l782 )
      ( obj-at p660 l782 )
      ( obj-at p473 l782 )
      ( obj-at p279 l782 )
    )
  )
)
