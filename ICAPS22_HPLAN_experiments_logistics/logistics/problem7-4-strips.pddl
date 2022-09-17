( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-190 - location
    l000-233 - location
    l000-684 - location
    l000-889 - location
    l000-814 - location
    l000-273 - location
    l000-371 - location
    l000-842 - location
    l000-770 - location
    l000-109 - location
    p418 - obj
    p329 - obj
    p890 - obj
    p192 - obj
    p804 - obj
    p635 - obj
    p21 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-190 c000 )
    ( in-city l000-233 c000 )
    ( in-city l000-684 c000 )
    ( in-city l000-889 c000 )
    ( in-city l000-814 c000 )
    ( in-city l000-273 c000 )
    ( in-city l000-371 c000 )
    ( in-city l000-842 c000 )
    ( in-city l000-770 c000 )
    ( in-city l000-109 c000 )
    ( obj-at p418 l000-770 )
    ( obj-at p329 l000-273 )
    ( obj-at p890 l000-109 )
    ( obj-at p192 l000-190 )
    ( obj-at p804 l000-233 )
    ( obj-at p635 l000-814 )
    ( obj-at p21 l000-684 )
    ( greater-than p329 p418 )
    ( greater-than p890 p418 )
    ( greater-than p890 p329 )
    ( greater-than p192 p418 )
    ( greater-than p192 p329 )
    ( greater-than p192 p890 )
    ( greater-than p804 p418 )
    ( greater-than p804 p329 )
    ( greater-than p804 p890 )
    ( greater-than p804 p192 )
    ( greater-than p635 p418 )
    ( greater-than p635 p329 )
    ( greater-than p635 p890 )
    ( greater-than p635 p192 )
    ( greater-than p635 p804 )
    ( greater-than p21 p418 )
    ( greater-than p21 p329 )
    ( greater-than p21 p890 )
    ( greater-than p21 p192 )
    ( greater-than p21 p804 )
    ( greater-than p21 p635 )
  )
  ( :goal
    ( and
      ( obj-at p418 l000-000 )
      ( obj-at p329 l000-000 )
      ( obj-at p890 l000-000 )
      ( obj-at p192 l000-000 )
      ( obj-at p804 l000-000 )
      ( obj-at p635 l000-000 )
      ( obj-at p21 l000-000 )
    )
  )
)
