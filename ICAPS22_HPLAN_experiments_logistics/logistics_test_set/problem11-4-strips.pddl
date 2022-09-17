( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l547 - location
    l706 - location
    l645 - location
    l45 - location
    l440 - location
    l970 - location
    l662 - location
    l421 - location
    l47 - location
    l515 - location
    p210 - obj
    p608 - obj
    p157 - obj
    p663 - obj
    p531 - obj
    p736 - obj
    p264 - obj
    p378 - obj
    p477 - obj
    p159 - obj
    p548 - obj
    t1719 - truck
    t1230 - truck
    t1545 - truck
    t1381 - truck
    t1149 - truck
    t1918 - truck
    t1962 - truck
    t1547 - truck
    t1554 - truck
    t1216 - truck
  )
  ( :init
    ( in-city l547 c000 )
    ( in-city l706 c000 )
    ( in-city l645 c000 )
    ( in-city l45 c000 )
    ( in-city l440 c000 )
    ( in-city l970 c000 )
    ( in-city l662 c000 )
    ( in-city l421 c000 )
    ( in-city l47 c000 )
    ( in-city l515 c000 )
    ( in-truck p210 t1554 )
    ( in-truck p608 t1381 )
    ( obj-at p157 l706 )
    ( in-truck p663 t1545 )
    ( obj-at p531 l45 )
    ( in-truck p736 t1719 )
    ( obj-at p264 l45 )
    ( in-truck p378 t1216 )
    ( in-truck p477 t1547 )
    ( obj-at p159 l47 )
    ( in-truck p548 t1149 )
    ( truck-at t1719 l440 )
    ( truck-at t1230 l547 )
    ( truck-at t1545 l47 )
    ( truck-at t1381 l440 )
    ( truck-at t1149 l440 )
    ( truck-at t1918 l421 )
    ( truck-at t1962 l440 )
    ( truck-at t1547 l440 )
    ( truck-at t1554 l662 )
    ( truck-at t1216 l440 )
    ( greater-than p608 p210 )
    ( greater-than p157 p210 )
    ( greater-than p157 p608 )
    ( greater-than p663 p210 )
    ( greater-than p663 p608 )
    ( greater-than p663 p157 )
    ( greater-than p531 p210 )
    ( greater-than p531 p608 )
    ( greater-than p531 p157 )
    ( greater-than p531 p663 )
    ( greater-than p736 p210 )
    ( greater-than p736 p608 )
    ( greater-than p736 p157 )
    ( greater-than p736 p663 )
    ( greater-than p736 p531 )
    ( greater-than p264 p210 )
    ( greater-than p264 p608 )
    ( greater-than p264 p157 )
    ( greater-than p264 p663 )
    ( greater-than p264 p531 )
    ( greater-than p264 p736 )
    ( greater-than p378 p210 )
    ( greater-than p378 p608 )
    ( greater-than p378 p157 )
    ( greater-than p378 p663 )
    ( greater-than p378 p531 )
    ( greater-than p378 p736 )
    ( greater-than p378 p264 )
    ( greater-than p477 p210 )
    ( greater-than p477 p608 )
    ( greater-than p477 p157 )
    ( greater-than p477 p663 )
    ( greater-than p477 p531 )
    ( greater-than p477 p736 )
    ( greater-than p477 p264 )
    ( greater-than p477 p378 )
    ( greater-than p159 p210 )
    ( greater-than p159 p608 )
    ( greater-than p159 p157 )
    ( greater-than p159 p663 )
    ( greater-than p159 p531 )
    ( greater-than p159 p736 )
    ( greater-than p159 p264 )
    ( greater-than p159 p378 )
    ( greater-than p159 p477 )
    ( greater-than p548 p210 )
    ( greater-than p548 p608 )
    ( greater-than p548 p157 )
    ( greater-than p548 p663 )
    ( greater-than p548 p531 )
    ( greater-than p548 p736 )
    ( greater-than p548 p264 )
    ( greater-than p548 p378 )
    ( greater-than p548 p477 )
    ( greater-than p548 p159 )
  )
  ( :goal
    ( and
      ( obj-at p210 l547 )
      ( obj-at p608 l547 )
      ( obj-at p157 l547 )
      ( obj-at p663 l547 )
      ( obj-at p531 l547 )
      ( obj-at p736 l547 )
      ( obj-at p264 l547 )
      ( obj-at p378 l547 )
      ( obj-at p477 l547 )
      ( obj-at p159 l547 )
      ( obj-at p548 l547 )
    )
  )
)
