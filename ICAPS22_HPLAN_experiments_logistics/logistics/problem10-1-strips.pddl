( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-163 - location
    l000-475 - location
    l000-300 - location
    l000-802 - location
    l000-311 - location
    l000-842 - location
    l000-964 - location
    p562 - obj
    p261 - obj
    p681 - obj
    p763 - obj
    p352 - obj
    p998 - obj
    p849 - obj
    p373 - obj
    p677 - obj
    p166 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-163 c000 )
    ( in-city l000-475 c000 )
    ( in-city l000-300 c000 )
    ( in-city l000-802 c000 )
    ( in-city l000-311 c000 )
    ( in-city l000-842 c000 )
    ( in-city l000-964 c000 )
    ( obj-at p562 l000-802 )
    ( obj-at p261 l000-802 )
    ( obj-at p681 l000-802 )
    ( obj-at p763 l000-311 )
    ( obj-at p352 l000-300 )
    ( obj-at p998 l000-842 )
    ( obj-at p849 l000-802 )
    ( obj-at p373 l000-311 )
    ( obj-at p677 l000-311 )
    ( obj-at p166 l000-163 )
    ( greater-than p261 p562 )
    ( greater-than p681 p562 )
    ( greater-than p681 p261 )
    ( greater-than p763 p562 )
    ( greater-than p763 p261 )
    ( greater-than p763 p681 )
    ( greater-than p352 p562 )
    ( greater-than p352 p261 )
    ( greater-than p352 p681 )
    ( greater-than p352 p763 )
    ( greater-than p998 p562 )
    ( greater-than p998 p261 )
    ( greater-than p998 p681 )
    ( greater-than p998 p763 )
    ( greater-than p998 p352 )
    ( greater-than p849 p562 )
    ( greater-than p849 p261 )
    ( greater-than p849 p681 )
    ( greater-than p849 p763 )
    ( greater-than p849 p352 )
    ( greater-than p849 p998 )
    ( greater-than p373 p562 )
    ( greater-than p373 p261 )
    ( greater-than p373 p681 )
    ( greater-than p373 p763 )
    ( greater-than p373 p352 )
    ( greater-than p373 p998 )
    ( greater-than p373 p849 )
    ( greater-than p677 p562 )
    ( greater-than p677 p261 )
    ( greater-than p677 p681 )
    ( greater-than p677 p763 )
    ( greater-than p677 p352 )
    ( greater-than p677 p998 )
    ( greater-than p677 p849 )
    ( greater-than p677 p373 )
    ( greater-than p166 p562 )
    ( greater-than p166 p261 )
    ( greater-than p166 p681 )
    ( greater-than p166 p763 )
    ( greater-than p166 p352 )
    ( greater-than p166 p998 )
    ( greater-than p166 p849 )
    ( greater-than p166 p373 )
    ( greater-than p166 p677 )
  )
  ( :goal
    ( and
      ( obj-at p562 l000-000 )
      ( obj-at p261 l000-000 )
      ( obj-at p681 l000-000 )
      ( obj-at p763 l000-000 )
      ( obj-at p352 l000-000 )
      ( obj-at p998 l000-000 )
      ( obj-at p849 l000-000 )
      ( obj-at p373 l000-000 )
      ( obj-at p677 l000-000 )
      ( obj-at p166 l000-000 )
    )
  )
)
