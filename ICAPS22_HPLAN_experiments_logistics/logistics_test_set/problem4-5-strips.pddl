( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l204 - location
    l57 - location
    l831 - location
    p764 - obj
    p165 - obj
    p543 - obj
    p141 - obj
    t1300 - truck
    t1836 - truck
    t1292 - truck
  )
  ( :init
    ( in-city l204 c000 )
    ( in-city l57 c000 )
    ( in-city l831 c000 )
    ( obj-at p764 l831 )
    ( in-truck p165 t1292 )
    ( in-truck p543 t1292 )
    ( obj-at p141 l57 )
    ( truck-at t1300 l57 )
    ( truck-at t1836 l204 )
    ( truck-at t1292 l204 )
    ( greater-than p165 p764 )
    ( greater-than p543 p764 )
    ( greater-than p543 p165 )
    ( greater-than p141 p764 )
    ( greater-than p141 p165 )
    ( greater-than p141 p543 )
  )
  ( :goal
    ( and
      ( obj-at p764 l204 )
      ( obj-at p165 l204 )
      ( obj-at p543 l204 )
      ( obj-at p141 l204 )
    )
  )
)
