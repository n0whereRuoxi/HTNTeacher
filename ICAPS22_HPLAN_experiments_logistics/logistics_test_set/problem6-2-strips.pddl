( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l756 - location
    l793 - location
    l273 - location
    l291 - location
    l490 - location
    l510 - location
    l126 - location
    l524 - location
    p210 - obj
    p524 - obj
    p853 - obj
    p660 - obj
    p648 - obj
    p644 - obj
    t1950 - truck
    t1148 - truck
    t1732 - truck
    t1438 - truck
    t1112 - truck
  )
  ( :init
    ( in-city l756 c000 )
    ( in-city l793 c000 )
    ( in-city l273 c000 )
    ( in-city l291 c000 )
    ( in-city l490 c000 )
    ( in-city l510 c000 )
    ( in-city l126 c000 )
    ( in-city l524 c000 )
    ( in-truck p210 t1112 )
    ( in-truck p524 t1732 )
    ( obj-at p853 l273 )
    ( obj-at p660 l273 )
    ( obj-at p648 l490 )
    ( in-truck p644 t1112 )
    ( truck-at t1950 l524 )
    ( truck-at t1148 l756 )
    ( truck-at t1732 l490 )
    ( truck-at t1438 l273 )
    ( truck-at t1112 l524 )
    ( greater-than p524 p210 )
    ( greater-than p853 p210 )
    ( greater-than p853 p524 )
    ( greater-than p660 p210 )
    ( greater-than p660 p524 )
    ( greater-than p660 p853 )
    ( greater-than p648 p210 )
    ( greater-than p648 p524 )
    ( greater-than p648 p853 )
    ( greater-than p648 p660 )
    ( greater-than p644 p210 )
    ( greater-than p644 p524 )
    ( greater-than p644 p853 )
    ( greater-than p644 p660 )
    ( greater-than p644 p648 )
  )
  ( :goal
    ( and
      ( obj-at p210 l756 )
      ( obj-at p524 l756 )
      ( obj-at p853 l756 )
      ( obj-at p660 l756 )
      ( obj-at p648 l756 )
      ( obj-at p644 l756 )
    )
  )
)
