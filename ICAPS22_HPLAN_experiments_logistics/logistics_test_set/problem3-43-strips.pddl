( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l811 - location
    l307 - location
    p9 - obj
    p265 - obj
    p897 - obj
    t1570 - truck
    t1215 - truck
  )
  ( :init
    ( in-city l811 c000 )
    ( in-city l307 c000 )
    ( in-truck p9 t1570 )
    ( in-truck p265 t1215 )
    ( obj-at p897 l307 )
    ( truck-at t1570 l307 )
    ( truck-at t1215 l307 )
    ( greater-than p265 p9 )
    ( greater-than p897 p9 )
    ( greater-than p897 p265 )
  )
  ( :goal
    ( and
      ( obj-at p9 l811 )
      ( obj-at p265 l811 )
      ( obj-at p897 l811 )
    )
  )
)
