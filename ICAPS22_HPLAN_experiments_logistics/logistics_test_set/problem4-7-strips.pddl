( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l353 - location
    l800 - location
    l834 - location
    p680 - obj
    p728 - obj
    p589 - obj
    p570 - obj
    t1541 - truck
    t1129 - truck
    t1651 - truck
  )
  ( :init
    ( in-city l353 c000 )
    ( in-city l800 c000 )
    ( in-city l834 c000 )
    ( obj-at p680 l834 )
    ( obj-at p728 l834 )
    ( obj-at p589 l834 )
    ( obj-at p570 l800 )
    ( truck-at t1541 l353 )
    ( truck-at t1129 l834 )
    ( truck-at t1651 l353 )
    ( greater-than p728 p680 )
    ( greater-than p589 p680 )
    ( greater-than p589 p728 )
    ( greater-than p570 p680 )
    ( greater-than p570 p728 )
    ( greater-than p570 p589 )
  )
  ( :goal
    ( and
      ( obj-at p680 l353 )
      ( obj-at p728 l353 )
      ( obj-at p589 l353 )
      ( obj-at p570 l353 )
    )
  )
)
