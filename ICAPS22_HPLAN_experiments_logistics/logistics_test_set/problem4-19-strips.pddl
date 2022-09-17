( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l772 - location
    l991 - location
    l117 - location
    l651 - location
    p266 - obj
    p85 - obj
    p721 - obj
    p475 - obj
    t1213 - truck
    t1634 - truck
    t1141 - truck
  )
  ( :init
    ( in-city l772 c000 )
    ( in-city l991 c000 )
    ( in-city l117 c000 )
    ( in-city l651 c000 )
    ( obj-at p266 l651 )
    ( obj-at p85 l651 )
    ( in-truck p721 t1634 )
    ( obj-at p475 l991 )
    ( truck-at t1213 l772 )
    ( truck-at t1634 l117 )
    ( truck-at t1141 l117 )
    ( greater-than p85 p266 )
    ( greater-than p721 p266 )
    ( greater-than p721 p85 )
    ( greater-than p475 p266 )
    ( greater-than p475 p85 )
    ( greater-than p475 p721 )
  )
  ( :goal
    ( and
      ( obj-at p266 l772 )
      ( obj-at p85 l772 )
      ( obj-at p721 l772 )
      ( obj-at p475 l772 )
    )
  )
)
