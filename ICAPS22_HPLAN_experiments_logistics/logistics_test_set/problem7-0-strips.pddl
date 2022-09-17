( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l961 - location
    l101 - location
    l763 - location
    l670 - location
    l902 - location
    l437 - location
    l794 - location
    l31 - location
    p414 - obj
    p718 - obj
    p749 - obj
    p858 - obj
    p23 - obj
    p452 - obj
    p812 - obj
    t1917 - truck
    t1012 - truck
    t1540 - truck
    t1949 - truck
    t1460 - truck
    t1383 - truck
  )
  ( :init
    ( in-city l961 c000 )
    ( in-city l101 c000 )
    ( in-city l763 c000 )
    ( in-city l670 c000 )
    ( in-city l902 c000 )
    ( in-city l437 c000 )
    ( in-city l794 c000 )
    ( in-city l31 c000 )
    ( in-truck p414 t1540 )
    ( obj-at p718 l101 )
    ( obj-at p749 l101 )
    ( obj-at p858 l437 )
    ( obj-at p23 l437 )
    ( in-truck p452 t1949 )
    ( obj-at p812 l31 )
    ( truck-at t1917 l794 )
    ( truck-at t1012 l437 )
    ( truck-at t1540 l101 )
    ( truck-at t1949 l961 )
    ( truck-at t1460 l437 )
    ( truck-at t1383 l961 )
    ( greater-than p718 p414 )
    ( greater-than p749 p414 )
    ( greater-than p749 p718 )
    ( greater-than p858 p414 )
    ( greater-than p858 p718 )
    ( greater-than p858 p749 )
    ( greater-than p23 p414 )
    ( greater-than p23 p718 )
    ( greater-than p23 p749 )
    ( greater-than p23 p858 )
    ( greater-than p452 p414 )
    ( greater-than p452 p718 )
    ( greater-than p452 p749 )
    ( greater-than p452 p858 )
    ( greater-than p452 p23 )
    ( greater-than p812 p414 )
    ( greater-than p812 p718 )
    ( greater-than p812 p749 )
    ( greater-than p812 p858 )
    ( greater-than p812 p23 )
    ( greater-than p812 p452 )
  )
  ( :goal
    ( and
      ( obj-at p414 l961 )
      ( obj-at p718 l961 )
      ( obj-at p749 l961 )
      ( obj-at p858 l961 )
      ( obj-at p23 l961 )
      ( obj-at p452 l961 )
      ( obj-at p812 l961 )
    )
  )
)
