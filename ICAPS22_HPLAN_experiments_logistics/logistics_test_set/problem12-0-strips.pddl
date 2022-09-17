( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l196 - location
    l352 - location
    l642 - location
    l245 - location
    l297 - location
    l811 - location
    l237 - location
    l554 - location
    l758 - location
    l403 - location
    l712 - location
    l684 - location
    l134 - location
    l566 - location
    l497 - location
    l693 - location
    p164 - obj
    p141 - obj
    p242 - obj
    p452 - obj
    p280 - obj
    p949 - obj
    p691 - obj
    p626 - obj
    p477 - obj
    p726 - obj
    p38 - obj
    p622 - obj
    t1126 - truck
    t1390 - truck
    t1282 - truck
    t1496 - truck
    t1084 - truck
    t1749 - truck
    t1955 - truck
    t1696 - truck
    t1687 - truck
    t1302 - truck
    t1022 - truck
  )
  ( :init
    ( in-city l196 c000 )
    ( in-city l352 c000 )
    ( in-city l642 c000 )
    ( in-city l245 c000 )
    ( in-city l297 c000 )
    ( in-city l811 c000 )
    ( in-city l237 c000 )
    ( in-city l554 c000 )
    ( in-city l758 c000 )
    ( in-city l403 c000 )
    ( in-city l712 c000 )
    ( in-city l684 c000 )
    ( in-city l134 c000 )
    ( in-city l566 c000 )
    ( in-city l497 c000 )
    ( in-city l693 c000 )
    ( in-truck p164 t1390 )
    ( obj-at p141 l693 )
    ( obj-at p242 l642 )
    ( obj-at p452 l352 )
    ( in-truck p280 t1696 )
    ( obj-at p949 l297 )
    ( obj-at p691 l758 )
    ( in-truck p626 t1696 )
    ( obj-at p477 l245 )
    ( in-truck p726 t1749 )
    ( in-truck p38 t1390 )
    ( obj-at p622 l497 )
    ( truck-at t1126 l684 )
    ( truck-at t1390 l811 )
    ( truck-at t1282 l811 )
    ( truck-at t1496 l297 )
    ( truck-at t1084 l196 )
    ( truck-at t1749 l134 )
    ( truck-at t1955 l297 )
    ( truck-at t1696 l566 )
    ( truck-at t1687 l352 )
    ( truck-at t1302 l297 )
    ( truck-at t1022 l196 )
    ( greater-than p141 p164 )
    ( greater-than p242 p164 )
    ( greater-than p242 p141 )
    ( greater-than p452 p164 )
    ( greater-than p452 p141 )
    ( greater-than p452 p242 )
    ( greater-than p280 p164 )
    ( greater-than p280 p141 )
    ( greater-than p280 p242 )
    ( greater-than p280 p452 )
    ( greater-than p949 p164 )
    ( greater-than p949 p141 )
    ( greater-than p949 p242 )
    ( greater-than p949 p452 )
    ( greater-than p949 p280 )
    ( greater-than p691 p164 )
    ( greater-than p691 p141 )
    ( greater-than p691 p242 )
    ( greater-than p691 p452 )
    ( greater-than p691 p280 )
    ( greater-than p691 p949 )
    ( greater-than p626 p164 )
    ( greater-than p626 p141 )
    ( greater-than p626 p242 )
    ( greater-than p626 p452 )
    ( greater-than p626 p280 )
    ( greater-than p626 p949 )
    ( greater-than p626 p691 )
    ( greater-than p477 p164 )
    ( greater-than p477 p141 )
    ( greater-than p477 p242 )
    ( greater-than p477 p452 )
    ( greater-than p477 p280 )
    ( greater-than p477 p949 )
    ( greater-than p477 p691 )
    ( greater-than p477 p626 )
    ( greater-than p726 p164 )
    ( greater-than p726 p141 )
    ( greater-than p726 p242 )
    ( greater-than p726 p452 )
    ( greater-than p726 p280 )
    ( greater-than p726 p949 )
    ( greater-than p726 p691 )
    ( greater-than p726 p626 )
    ( greater-than p726 p477 )
    ( greater-than p38 p164 )
    ( greater-than p38 p141 )
    ( greater-than p38 p242 )
    ( greater-than p38 p452 )
    ( greater-than p38 p280 )
    ( greater-than p38 p949 )
    ( greater-than p38 p691 )
    ( greater-than p38 p626 )
    ( greater-than p38 p477 )
    ( greater-than p38 p726 )
    ( greater-than p622 p164 )
    ( greater-than p622 p141 )
    ( greater-than p622 p242 )
    ( greater-than p622 p452 )
    ( greater-than p622 p280 )
    ( greater-than p622 p949 )
    ( greater-than p622 p691 )
    ( greater-than p622 p626 )
    ( greater-than p622 p477 )
    ( greater-than p622 p726 )
    ( greater-than p622 p38 )
  )
  ( :goal
    ( and
      ( obj-at p164 l196 )
      ( obj-at p141 l196 )
      ( obj-at p242 l196 )
      ( obj-at p452 l196 )
      ( obj-at p280 l196 )
      ( obj-at p949 l196 )
      ( obj-at p691 l196 )
      ( obj-at p626 l196 )
      ( obj-at p477 l196 )
      ( obj-at p726 l196 )
      ( obj-at p38 l196 )
      ( obj-at p622 l196 )
    )
  )
)
