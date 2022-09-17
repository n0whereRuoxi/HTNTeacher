( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l393 - location
    l671 - location
    l867 - location
    l172 - location
    p740 - obj
    p178 - obj
    p893 - obj
    p874 - obj
    t1651 - truck
    t1252 - truck
    t1525 - truck
  )
  ( :init
    ( in-city l393 c000 )
    ( in-city l671 c000 )
    ( in-city l867 c000 )
    ( in-city l172 c000 )
    ( in-truck p740 t1651 )
    ( in-truck p178 t1252 )
    ( in-truck p893 t1525 )
    ( in-truck p874 t1651 )
    ( truck-at t1651 l867 )
    ( truck-at t1252 l867 )
    ( truck-at t1525 l671 )
    ( greater-than p178 p740 )
    ( greater-than p893 p740 )
    ( greater-than p893 p178 )
    ( greater-than p874 p740 )
    ( greater-than p874 p178 )
    ( greater-than p874 p893 )
  )
  ( :goal
    ( and
      ( obj-at p740 l393 )
      ( obj-at p178 l393 )
      ( obj-at p893 l393 )
      ( obj-at p874 l393 )
    )
  )
)
