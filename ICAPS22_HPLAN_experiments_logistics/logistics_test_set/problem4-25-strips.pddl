( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l271 - location
    l843 - location
    l890 - location
    p579 - obj
    p926 - obj
    p978 - obj
    p861 - obj
    t1441 - truck
    t1646 - truck
    t1301 - truck
  )
  ( :init
    ( in-city l271 c000 )
    ( in-city l843 c000 )
    ( in-city l890 c000 )
    ( obj-at p579 l890 )
    ( obj-at p926 l843 )
    ( in-truck p978 t1646 )
    ( obj-at p861 l843 )
    ( truck-at t1441 l843 )
    ( truck-at t1646 l271 )
    ( truck-at t1301 l271 )
    ( greater-than p926 p579 )
    ( greater-than p978 p579 )
    ( greater-than p978 p926 )
    ( greater-than p861 p579 )
    ( greater-than p861 p926 )
    ( greater-than p861 p978 )
  )
  ( :goal
    ( and
      ( obj-at p579 l271 )
      ( obj-at p926 l271 )
      ( obj-at p978 l271 )
      ( obj-at p861 l271 )
    )
  )
)
