( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l35 - location
    l810 - location
    l644 - location
    l470 - location
    l38 - location
    p460 - obj
    p798 - obj
    p320 - obj
    p393 - obj
    t1016 - truck
    t1717 - truck
    t1189 - truck
  )
  ( :init
    ( in-city l35 c000 )
    ( in-city l810 c000 )
    ( in-city l644 c000 )
    ( in-city l470 c000 )
    ( in-city l38 c000 )
    ( obj-at p460 l38 )
    ( obj-at p798 l810 )
    ( obj-at p320 l810 )
    ( in-truck p393 t1016 )
    ( truck-at t1016 l644 )
    ( truck-at t1717 l35 )
    ( truck-at t1189 l38 )
    ( greater-than p798 p460 )
    ( greater-than p320 p460 )
    ( greater-than p320 p798 )
    ( greater-than p393 p460 )
    ( greater-than p393 p798 )
    ( greater-than p393 p320 )
  )
  ( :tasks
    ( Deliver-4Pkg p460 p798 p320 p393 l35 )
  )
)
