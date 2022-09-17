( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l625 - location
    l997 - location
    l531 - location
    l420 - location
    l554 - location
    l952 - location
    l50 - location
    p490 - obj
    p476 - obj
    p719 - obj
    p828 - obj
    t1634 - truck
    t1986 - truck
    t1064 - truck
  )
  ( :init
    ( in-city l625 c000 )
    ( in-city l997 c000 )
    ( in-city l531 c000 )
    ( in-city l420 c000 )
    ( in-city l554 c000 )
    ( in-city l952 c000 )
    ( in-city l50 c000 )
    ( in-truck p490 t1986 )
    ( obj-at p476 l997 )
    ( in-truck p719 t1064 )
    ( in-truck p828 t1064 )
    ( truck-at t1634 l952 )
    ( truck-at t1986 l952 )
    ( truck-at t1064 l554 )
    ( greater-than p476 p490 )
    ( greater-than p719 p490 )
    ( greater-than p719 p476 )
    ( greater-than p828 p490 )
    ( greater-than p828 p476 )
    ( greater-than p828 p719 )
  )
  ( :goal
    ( and
      ( obj-at p490 l625 )
      ( obj-at p476 l625 )
      ( obj-at p719 l625 )
      ( obj-at p828 l625 )
    )
  )
)
