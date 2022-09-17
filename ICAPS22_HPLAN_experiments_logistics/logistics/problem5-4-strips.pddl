( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-811 - location
    l000-675 - location
    l000-658 - location
    l000-272 - location
    l000-512 - location
    l000-140 - location
    l000-874 - location
    l000-862 - location
    p584 - obj
    p101 - obj
    p342 - obj
    p289 - obj
    p770 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-811 c000 )
    ( in-city l000-675 c000 )
    ( in-city l000-658 c000 )
    ( in-city l000-272 c000 )
    ( in-city l000-512 c000 )
    ( in-city l000-140 c000 )
    ( in-city l000-874 c000 )
    ( in-city l000-862 c000 )
    ( obj-at p584 l000-874 )
    ( obj-at p101 l000-658 )
    ( obj-at p342 l000-140 )
    ( obj-at p289 l000-862 )
    ( obj-at p770 l000-272 )
    ( greater-than p101 p584 )
    ( greater-than p342 p584 )
    ( greater-than p342 p101 )
    ( greater-than p289 p584 )
    ( greater-than p289 p101 )
    ( greater-than p289 p342 )
    ( greater-than p770 p584 )
    ( greater-than p770 p101 )
    ( greater-than p770 p342 )
    ( greater-than p770 p289 )
  )
  ( :goal
    ( and
      ( obj-at p584 l000-000 )
      ( obj-at p101 l000-000 )
      ( obj-at p342 l000-000 )
      ( obj-at p289 l000-000 )
      ( obj-at p770 l000-000 )
    )
  )
)
