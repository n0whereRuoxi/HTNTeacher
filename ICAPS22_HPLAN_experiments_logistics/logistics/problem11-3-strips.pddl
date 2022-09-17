( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-217 - location
    l000-49 - location
    l000-788 - location
    l000-13 - location
    l000-578 - location
    l000-220 - location
    l000-150 - location
    l000-337 - location
    l000-950 - location
    l000-803 - location
    l000-365 - location
    l000-114 - location
    l000-165 - location
    l000-599 - location
    l000-614 - location
    l000-236 - location
    l000-989 - location
    l000-663 - location
    l000-948 - location
    l000-556 - location
    l000-48 - location
    p548 - obj
    p834 - obj
    p794 - obj
    p186 - obj
    p810 - obj
    p896 - obj
    p455 - obj
    p661 - obj
    p688 - obj
    p119 - obj
    p975 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-217 c000 )
    ( in-city l000-49 c000 )
    ( in-city l000-788 c000 )
    ( in-city l000-13 c000 )
    ( in-city l000-578 c000 )
    ( in-city l000-220 c000 )
    ( in-city l000-150 c000 )
    ( in-city l000-337 c000 )
    ( in-city l000-950 c000 )
    ( in-city l000-803 c000 )
    ( in-city l000-365 c000 )
    ( in-city l000-114 c000 )
    ( in-city l000-165 c000 )
    ( in-city l000-599 c000 )
    ( in-city l000-614 c000 )
    ( in-city l000-236 c000 )
    ( in-city l000-989 c000 )
    ( in-city l000-663 c000 )
    ( in-city l000-948 c000 )
    ( in-city l000-556 c000 )
    ( in-city l000-48 c000 )
    ( obj-at p548 l000-236 )
    ( obj-at p834 l000-663 )
    ( obj-at p794 l000-614 )
    ( obj-at p186 l000-803 )
    ( obj-at p810 l000-556 )
    ( obj-at p896 l000-337 )
    ( obj-at p455 l000-49 )
    ( obj-at p661 l000-578 )
    ( obj-at p688 l000-556 )
    ( obj-at p119 l000-220 )
    ( obj-at p975 l000-49 )
    ( greater-than p834 p548 )
    ( greater-than p794 p548 )
    ( greater-than p794 p834 )
    ( greater-than p186 p548 )
    ( greater-than p186 p834 )
    ( greater-than p186 p794 )
    ( greater-than p810 p548 )
    ( greater-than p810 p834 )
    ( greater-than p810 p794 )
    ( greater-than p810 p186 )
    ( greater-than p896 p548 )
    ( greater-than p896 p834 )
    ( greater-than p896 p794 )
    ( greater-than p896 p186 )
    ( greater-than p896 p810 )
    ( greater-than p455 p548 )
    ( greater-than p455 p834 )
    ( greater-than p455 p794 )
    ( greater-than p455 p186 )
    ( greater-than p455 p810 )
    ( greater-than p455 p896 )
    ( greater-than p661 p548 )
    ( greater-than p661 p834 )
    ( greater-than p661 p794 )
    ( greater-than p661 p186 )
    ( greater-than p661 p810 )
    ( greater-than p661 p896 )
    ( greater-than p661 p455 )
    ( greater-than p688 p548 )
    ( greater-than p688 p834 )
    ( greater-than p688 p794 )
    ( greater-than p688 p186 )
    ( greater-than p688 p810 )
    ( greater-than p688 p896 )
    ( greater-than p688 p455 )
    ( greater-than p688 p661 )
    ( greater-than p119 p548 )
    ( greater-than p119 p834 )
    ( greater-than p119 p794 )
    ( greater-than p119 p186 )
    ( greater-than p119 p810 )
    ( greater-than p119 p896 )
    ( greater-than p119 p455 )
    ( greater-than p119 p661 )
    ( greater-than p119 p688 )
    ( greater-than p975 p548 )
    ( greater-than p975 p834 )
    ( greater-than p975 p794 )
    ( greater-than p975 p186 )
    ( greater-than p975 p810 )
    ( greater-than p975 p896 )
    ( greater-than p975 p455 )
    ( greater-than p975 p661 )
    ( greater-than p975 p688 )
    ( greater-than p975 p119 )
  )
  ( :goal
    ( and
      ( obj-at p548 l000-000 )
      ( obj-at p834 l000-000 )
      ( obj-at p794 l000-000 )
      ( obj-at p186 l000-000 )
      ( obj-at p810 l000-000 )
      ( obj-at p896 l000-000 )
      ( obj-at p455 l000-000 )
      ( obj-at p661 l000-000 )
      ( obj-at p688 l000-000 )
      ( obj-at p119 l000-000 )
      ( obj-at p975 l000-000 )
    )
  )
)
