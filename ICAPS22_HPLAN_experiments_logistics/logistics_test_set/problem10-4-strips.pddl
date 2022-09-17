( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l807 - location
    l580 - location
    l417 - location
    l29 - location
    l152 - location
    l311 - location
    l20 - location
    l583 - location
    l19 - location
    l246 - location
    l809 - location
    l739 - location
    l936 - location
    p136 - obj
    p760 - obj
    p241 - obj
    p98 - obj
    p567 - obj
    p228 - obj
    p43 - obj
    p372 - obj
    p397 - obj
    p681 - obj
    t1470 - truck
    t1133 - truck
    t1178 - truck
    t1433 - truck
    t1951 - truck
    t1257 - truck
    t1789 - truck
    t1006 - truck
    t1620 - truck
  )
  ( :init
    ( in-city l807 c000 )
    ( in-city l580 c000 )
    ( in-city l417 c000 )
    ( in-city l29 c000 )
    ( in-city l152 c000 )
    ( in-city l311 c000 )
    ( in-city l20 c000 )
    ( in-city l583 c000 )
    ( in-city l19 c000 )
    ( in-city l246 c000 )
    ( in-city l809 c000 )
    ( in-city l739 c000 )
    ( in-city l936 c000 )
    ( obj-at p136 l29 )
    ( obj-at p760 l936 )
    ( obj-at p241 l583 )
    ( in-truck p98 t1620 )
    ( in-truck p567 t1178 )
    ( in-truck p228 t1178 )
    ( in-truck p43 t1433 )
    ( obj-at p372 l739 )
    ( in-truck p397 t1133 )
    ( obj-at p681 l580 )
    ( truck-at t1470 l809 )
    ( truck-at t1133 l739 )
    ( truck-at t1178 l152 )
    ( truck-at t1433 l19 )
    ( truck-at t1951 l311 )
    ( truck-at t1257 l417 )
    ( truck-at t1789 l417 )
    ( truck-at t1006 l417 )
    ( truck-at t1620 l809 )
    ( greater-than p760 p136 )
    ( greater-than p241 p136 )
    ( greater-than p241 p760 )
    ( greater-than p98 p136 )
    ( greater-than p98 p760 )
    ( greater-than p98 p241 )
    ( greater-than p567 p136 )
    ( greater-than p567 p760 )
    ( greater-than p567 p241 )
    ( greater-than p567 p98 )
    ( greater-than p228 p136 )
    ( greater-than p228 p760 )
    ( greater-than p228 p241 )
    ( greater-than p228 p98 )
    ( greater-than p228 p567 )
    ( greater-than p43 p136 )
    ( greater-than p43 p760 )
    ( greater-than p43 p241 )
    ( greater-than p43 p98 )
    ( greater-than p43 p567 )
    ( greater-than p43 p228 )
    ( greater-than p372 p136 )
    ( greater-than p372 p760 )
    ( greater-than p372 p241 )
    ( greater-than p372 p98 )
    ( greater-than p372 p567 )
    ( greater-than p372 p228 )
    ( greater-than p372 p43 )
    ( greater-than p397 p136 )
    ( greater-than p397 p760 )
    ( greater-than p397 p241 )
    ( greater-than p397 p98 )
    ( greater-than p397 p567 )
    ( greater-than p397 p228 )
    ( greater-than p397 p43 )
    ( greater-than p397 p372 )
    ( greater-than p681 p136 )
    ( greater-than p681 p760 )
    ( greater-than p681 p241 )
    ( greater-than p681 p98 )
    ( greater-than p681 p567 )
    ( greater-than p681 p228 )
    ( greater-than p681 p43 )
    ( greater-than p681 p372 )
    ( greater-than p681 p397 )
  )
  ( :goal
    ( and
      ( obj-at p136 l807 )
      ( obj-at p760 l807 )
      ( obj-at p241 l807 )
      ( obj-at p98 l807 )
      ( obj-at p567 l807 )
      ( obj-at p228 l807 )
      ( obj-at p43 l807 )
      ( obj-at p372 l807 )
      ( obj-at p397 l807 )
      ( obj-at p681 l807 )
    )
  )
)
