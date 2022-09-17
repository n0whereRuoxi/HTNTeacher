( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-982 - location
    l000-327 - location
    l000-153 - location
    l000-443 - location
    l000-888 - location
    l000-968 - location
    l000-401 - location
    p419 - obj
    p838 - obj
    p927 - obj
    p10 - obj
    p915 - obj
    p843 - obj
    p627 - obj
    p308 - obj
    p496 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-982 c000 )
    ( in-city l000-327 c000 )
    ( in-city l000-153 c000 )
    ( in-city l000-443 c000 )
    ( in-city l000-888 c000 )
    ( in-city l000-968 c000 )
    ( in-city l000-401 c000 )
    ( obj-at p419 l000-401 )
    ( obj-at p838 l000-968 )
    ( obj-at p927 l000-968 )
    ( obj-at p10 l000-153 )
    ( obj-at p915 l000-401 )
    ( obj-at p843 l000-401 )
    ( obj-at p627 l000-401 )
    ( obj-at p308 l000-888 )
    ( obj-at p496 l000-153 )
    ( greater-than p838 p419 )
    ( greater-than p927 p419 )
    ( greater-than p927 p838 )
    ( greater-than p10 p419 )
    ( greater-than p10 p838 )
    ( greater-than p10 p927 )
    ( greater-than p915 p419 )
    ( greater-than p915 p838 )
    ( greater-than p915 p927 )
    ( greater-than p915 p10 )
    ( greater-than p843 p419 )
    ( greater-than p843 p838 )
    ( greater-than p843 p927 )
    ( greater-than p843 p10 )
    ( greater-than p843 p915 )
    ( greater-than p627 p419 )
    ( greater-than p627 p838 )
    ( greater-than p627 p927 )
    ( greater-than p627 p10 )
    ( greater-than p627 p915 )
    ( greater-than p627 p843 )
    ( greater-than p308 p419 )
    ( greater-than p308 p838 )
    ( greater-than p308 p927 )
    ( greater-than p308 p10 )
    ( greater-than p308 p915 )
    ( greater-than p308 p843 )
    ( greater-than p308 p627 )
    ( greater-than p496 p419 )
    ( greater-than p496 p838 )
    ( greater-than p496 p927 )
    ( greater-than p496 p10 )
    ( greater-than p496 p915 )
    ( greater-than p496 p843 )
    ( greater-than p496 p627 )
    ( greater-than p496 p308 )
  )
  ( :goal
    ( and
      ( obj-at p419 l000-000 )
      ( obj-at p838 l000-000 )
      ( obj-at p927 l000-000 )
      ( obj-at p10 l000-000 )
      ( obj-at p915 l000-000 )
      ( obj-at p843 l000-000 )
      ( obj-at p627 l000-000 )
      ( obj-at p308 l000-000 )
      ( obj-at p496 l000-000 )
    )
  )
)
