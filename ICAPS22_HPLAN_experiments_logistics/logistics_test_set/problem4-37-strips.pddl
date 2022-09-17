( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l988 - location
    l845 - location
    l452 - location
    l989 - location
    l279 - location
    l545 - location
    l940 - location
    p26 - obj
    p211 - obj
    p474 - obj
    p119 - obj
    t1041 - truck
    t1993 - truck
    t1291 - truck
  )
  ( :init
    ( in-city l988 c000 )
    ( in-city l845 c000 )
    ( in-city l452 c000 )
    ( in-city l989 c000 )
    ( in-city l279 c000 )
    ( in-city l545 c000 )
    ( in-city l940 c000 )
    ( obj-at p26 l279 )
    ( in-truck p211 t1291 )
    ( in-truck p474 t1291 )
    ( obj-at p119 l452 )
    ( truck-at t1041 l545 )
    ( truck-at t1993 l452 )
    ( truck-at t1291 l989 )
    ( greater-than p211 p26 )
    ( greater-than p474 p26 )
    ( greater-than p474 p211 )
    ( greater-than p119 p26 )
    ( greater-than p119 p211 )
    ( greater-than p119 p474 )
  )
  ( :goal
    ( and
      ( obj-at p26 l988 )
      ( obj-at p211 l988 )
      ( obj-at p474 l988 )
      ( obj-at p119 l988 )
    )
  )
)
