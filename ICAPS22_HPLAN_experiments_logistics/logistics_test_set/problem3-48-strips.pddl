( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l260 - location
    l977 - location
    l914 - location
    l694 - location
    p353 - obj
    p11 - obj
    p112 - obj
    t1227 - truck
    t1727 - truck
  )
  ( :init
    ( in-city l260 c000 )
    ( in-city l977 c000 )
    ( in-city l914 c000 )
    ( in-city l694 c000 )
    ( obj-at p353 l977 )
    ( in-truck p11 t1227 )
    ( obj-at p112 l914 )
    ( truck-at t1227 l977 )
    ( truck-at t1727 l914 )
    ( greater-than p11 p353 )
    ( greater-than p112 p353 )
    ( greater-than p112 p11 )
  )
  ( :goal
    ( and
      ( obj-at p353 l260 )
      ( obj-at p11 l260 )
      ( obj-at p112 l260 )
    )
  )
)
