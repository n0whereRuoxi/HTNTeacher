( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l771 - location
    l128 - location
    l420 - location
    l122 - location
    l865 - location
    l398 - location
    p985 - obj
    p460 - obj
    p851 - obj
    p359 - obj
    t1074 - truck
    t1256 - truck
    t1030 - truck
  )
  ( :init
    ( in-city l771 c000 )
    ( in-city l128 c000 )
    ( in-city l420 c000 )
    ( in-city l122 c000 )
    ( in-city l865 c000 )
    ( in-city l398 c000 )
    ( in-truck p985 t1074 )
    ( in-truck p460 t1030 )
    ( obj-at p851 l128 )
    ( obj-at p359 l398 )
    ( truck-at t1074 l398 )
    ( truck-at t1256 l128 )
    ( truck-at t1030 l771 )
    ( greater-than p460 p985 )
    ( greater-than p851 p985 )
    ( greater-than p851 p460 )
    ( greater-than p359 p985 )
    ( greater-than p359 p460 )
    ( greater-than p359 p851 )
  )
  ( :goal
    ( and
      ( obj-at p985 l771 )
      ( obj-at p460 l771 )
      ( obj-at p851 l771 )
      ( obj-at p359 l771 )
    )
  )
)
