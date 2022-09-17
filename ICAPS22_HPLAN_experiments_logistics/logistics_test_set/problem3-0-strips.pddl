( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l66 - location
    l415 - location
    l567 - location
    l329 - location
    l422 - location
    p958 - obj
    p682 - obj
    p824 - obj
    t1731 - truck
    t1721 - truck
  )
  ( :init
    ( in-city l66 c000 )
    ( in-city l415 c000 )
    ( in-city l567 c000 )
    ( in-city l329 c000 )
    ( in-city l422 c000 )
    ( in-truck p958 t1731 )
    ( obj-at p682 l567 )
    ( in-truck p824 t1721 )
    ( truck-at t1731 l329 )
    ( truck-at t1721 l567 )
    ( greater-than p682 p958 )
    ( greater-than p824 p958 )
    ( greater-than p824 p682 )
  )
  ( :goal
    ( and
      ( obj-at p958 l66 )
      ( obj-at p682 l66 )
      ( obj-at p824 l66 )
    )
  )
)
