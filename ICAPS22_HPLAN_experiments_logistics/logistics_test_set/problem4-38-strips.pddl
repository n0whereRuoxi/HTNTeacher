( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l314 - location
    l544 - location
    p225 - obj
    p903 - obj
    p620 - obj
    p474 - obj
    t1288 - truck
    t1424 - truck
    t1128 - truck
  )
  ( :init
    ( in-city l314 c000 )
    ( in-city l544 c000 )
    ( obj-at p225 l544 )
    ( in-truck p903 t1128 )
    ( in-truck p620 t1288 )
    ( in-truck p474 t1128 )
    ( truck-at t1288 l544 )
    ( truck-at t1424 l544 )
    ( truck-at t1128 l314 )
    ( greater-than p903 p225 )
    ( greater-than p620 p225 )
    ( greater-than p620 p903 )
    ( greater-than p474 p225 )
    ( greater-than p474 p903 )
    ( greater-than p474 p620 )
  )
  ( :goal
    ( and
      ( obj-at p225 l314 )
      ( obj-at p903 l314 )
      ( obj-at p620 l314 )
      ( obj-at p474 l314 )
    )
  )
)
