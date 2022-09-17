( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l698 - location
    l718 - location
    p511 - obj
    p435 - obj
    p123 - obj
    p612 - obj
    t1951 - truck
    t1004 - truck
    t1925 - truck
  )
  ( :init
    ( in-city l698 c000 )
    ( in-city l718 c000 )
    ( in-truck p511 t1925 )
    ( in-truck p435 t1004 )
    ( in-truck p123 t1925 )
    ( in-truck p612 t1925 )
    ( truck-at t1951 l698 )
    ( truck-at t1004 l698 )
    ( truck-at t1925 l698 )
    ( greater-than p435 p511 )
    ( greater-than p123 p511 )
    ( greater-than p123 p435 )
    ( greater-than p612 p511 )
    ( greater-than p612 p435 )
    ( greater-than p612 p123 )
  )
  ( :goal
    ( and
      ( obj-at p511 l698 )
      ( obj-at p435 l698 )
      ( obj-at p123 l698 )
      ( obj-at p612 l698 )
    )
  )
)
