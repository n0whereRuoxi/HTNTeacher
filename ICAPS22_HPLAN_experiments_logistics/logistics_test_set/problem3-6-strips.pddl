( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l823 - location
    l938 - location
    l121 - location
    l771 - location
    p619 - obj
    p890 - obj
    p98 - obj
    t1641 - truck
    t1178 - truck
  )
  ( :init
    ( in-city l823 c000 )
    ( in-city l938 c000 )
    ( in-city l121 c000 )
    ( in-city l771 c000 )
    ( obj-at p619 l938 )
    ( obj-at p890 l771 )
    ( in-truck p98 t1641 )
    ( truck-at t1641 l771 )
    ( truck-at t1178 l771 )
    ( greater-than p890 p619 )
    ( greater-than p98 p619 )
    ( greater-than p98 p890 )
  )
  ( :goal
    ( and
      ( obj-at p619 l823 )
      ( obj-at p890 l823 )
      ( obj-at p98 l823 )
    )
  )
)
