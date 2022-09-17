( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l192 - location
    l821 - location
    l902 - location
    l93 - location
    l285 - location
    l241 - location
    l783 - location
    p492 - obj
    p443 - obj
    p509 - obj
    p957 - obj
    p657 - obj
    p489 - obj
    p201 - obj
    p306 - obj
    p847 - obj
    p543 - obj
    t1777 - truck
    t1288 - truck
    t1064 - truck
    t1118 - truck
    t1152 - truck
    t1700 - truck
    t1255 - truck
    t1410 - truck
    t1164 - truck
  )
  ( :init
    ( in-city l192 c000 )
    ( in-city l821 c000 )
    ( in-city l902 c000 )
    ( in-city l93 c000 )
    ( in-city l285 c000 )
    ( in-city l241 c000 )
    ( in-city l783 c000 )
    ( obj-at p492 l93 )
    ( in-truck p443 t1064 )
    ( obj-at p509 l783 )
    ( in-truck p957 t1700 )
    ( obj-at p657 l93 )
    ( obj-at p489 l93 )
    ( obj-at p201 l241 )
    ( in-truck p306 t1288 )
    ( obj-at p847 l821 )
    ( obj-at p543 l902 )
    ( truck-at t1777 l783 )
    ( truck-at t1288 l821 )
    ( truck-at t1064 l821 )
    ( truck-at t1118 l241 )
    ( truck-at t1152 l783 )
    ( truck-at t1700 l902 )
    ( truck-at t1255 l241 )
    ( truck-at t1410 l93 )
    ( truck-at t1164 l241 )
    ( greater-than p443 p492 )
    ( greater-than p509 p492 )
    ( greater-than p509 p443 )
    ( greater-than p957 p492 )
    ( greater-than p957 p443 )
    ( greater-than p957 p509 )
    ( greater-than p657 p492 )
    ( greater-than p657 p443 )
    ( greater-than p657 p509 )
    ( greater-than p657 p957 )
    ( greater-than p489 p492 )
    ( greater-than p489 p443 )
    ( greater-than p489 p509 )
    ( greater-than p489 p957 )
    ( greater-than p489 p657 )
    ( greater-than p201 p492 )
    ( greater-than p201 p443 )
    ( greater-than p201 p509 )
    ( greater-than p201 p957 )
    ( greater-than p201 p657 )
    ( greater-than p201 p489 )
    ( greater-than p306 p492 )
    ( greater-than p306 p443 )
    ( greater-than p306 p509 )
    ( greater-than p306 p957 )
    ( greater-than p306 p657 )
    ( greater-than p306 p489 )
    ( greater-than p306 p201 )
    ( greater-than p847 p492 )
    ( greater-than p847 p443 )
    ( greater-than p847 p509 )
    ( greater-than p847 p957 )
    ( greater-than p847 p657 )
    ( greater-than p847 p489 )
    ( greater-than p847 p201 )
    ( greater-than p847 p306 )
    ( greater-than p543 p492 )
    ( greater-than p543 p443 )
    ( greater-than p543 p509 )
    ( greater-than p543 p957 )
    ( greater-than p543 p657 )
    ( greater-than p543 p489 )
    ( greater-than p543 p201 )
    ( greater-than p543 p306 )
    ( greater-than p543 p847 )
  )
  ( :goal
    ( and
      ( obj-at p492 l192 )
      ( obj-at p443 l192 )
      ( obj-at p509 l192 )
      ( obj-at p957 l192 )
      ( obj-at p657 l192 )
      ( obj-at p489 l192 )
      ( obj-at p201 l192 )
      ( obj-at p306 l192 )
      ( obj-at p847 l192 )
      ( obj-at p543 l192 )
    )
  )
)
