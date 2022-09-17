( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-66 - location
    l000-319 - location
    l000-888 - location
    l000-950 - location
    l000-87 - location
    l000-873 - location
    l000-729 - location
    l000-136 - location
    l000-769 - location
    l000-140 - location
    l000-364 - location
    l000-497 - location
    l000-363 - location
    l000-580 - location
    l000-418 - location
    l000-5 - location
    l000-553 - location
    l000-205 - location
    l000-307 - location
    l000-644 - location
    l000-827 - location
    l000-118 - location
    l000-591 - location
    l000-825 - location
    p724 - obj
    p812 - obj
    p859 - obj
    p481 - obj
    p299 - obj
    p168 - obj
    p858 - obj
    p980 - obj
    p358 - obj
    p499 - obj
    p248 - obj
    p300 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-66 c000 )
    ( in-city l000-319 c000 )
    ( in-city l000-888 c000 )
    ( in-city l000-950 c000 )
    ( in-city l000-87 c000 )
    ( in-city l000-873 c000 )
    ( in-city l000-729 c000 )
    ( in-city l000-136 c000 )
    ( in-city l000-769 c000 )
    ( in-city l000-140 c000 )
    ( in-city l000-364 c000 )
    ( in-city l000-497 c000 )
    ( in-city l000-363 c000 )
    ( in-city l000-580 c000 )
    ( in-city l000-418 c000 )
    ( in-city l000-5 c000 )
    ( in-city l000-553 c000 )
    ( in-city l000-205 c000 )
    ( in-city l000-307 c000 )
    ( in-city l000-644 c000 )
    ( in-city l000-827 c000 )
    ( in-city l000-118 c000 )
    ( in-city l000-591 c000 )
    ( in-city l000-825 c000 )
    ( obj-at p724 l000-769 )
    ( obj-at p812 l000-140 )
    ( obj-at p859 l000-418 )
    ( obj-at p481 l000-5 )
    ( obj-at p299 l000-364 )
    ( obj-at p168 l000-553 )
    ( obj-at p858 l000-136 )
    ( obj-at p980 l000-580 )
    ( obj-at p358 l000-418 )
    ( obj-at p499 l000-87 )
    ( obj-at p248 l000-497 )
    ( obj-at p300 l000-319 )
    ( greater-than p812 p724 )
    ( greater-than p859 p724 )
    ( greater-than p859 p812 )
    ( greater-than p481 p724 )
    ( greater-than p481 p812 )
    ( greater-than p481 p859 )
    ( greater-than p299 p724 )
    ( greater-than p299 p812 )
    ( greater-than p299 p859 )
    ( greater-than p299 p481 )
    ( greater-than p168 p724 )
    ( greater-than p168 p812 )
    ( greater-than p168 p859 )
    ( greater-than p168 p481 )
    ( greater-than p168 p299 )
    ( greater-than p858 p724 )
    ( greater-than p858 p812 )
    ( greater-than p858 p859 )
    ( greater-than p858 p481 )
    ( greater-than p858 p299 )
    ( greater-than p858 p168 )
    ( greater-than p980 p724 )
    ( greater-than p980 p812 )
    ( greater-than p980 p859 )
    ( greater-than p980 p481 )
    ( greater-than p980 p299 )
    ( greater-than p980 p168 )
    ( greater-than p980 p858 )
    ( greater-than p358 p724 )
    ( greater-than p358 p812 )
    ( greater-than p358 p859 )
    ( greater-than p358 p481 )
    ( greater-than p358 p299 )
    ( greater-than p358 p168 )
    ( greater-than p358 p858 )
    ( greater-than p358 p980 )
    ( greater-than p499 p724 )
    ( greater-than p499 p812 )
    ( greater-than p499 p859 )
    ( greater-than p499 p481 )
    ( greater-than p499 p299 )
    ( greater-than p499 p168 )
    ( greater-than p499 p858 )
    ( greater-than p499 p980 )
    ( greater-than p499 p358 )
    ( greater-than p248 p724 )
    ( greater-than p248 p812 )
    ( greater-than p248 p859 )
    ( greater-than p248 p481 )
    ( greater-than p248 p299 )
    ( greater-than p248 p168 )
    ( greater-than p248 p858 )
    ( greater-than p248 p980 )
    ( greater-than p248 p358 )
    ( greater-than p248 p499 )
    ( greater-than p300 p724 )
    ( greater-than p300 p812 )
    ( greater-than p300 p859 )
    ( greater-than p300 p481 )
    ( greater-than p300 p299 )
    ( greater-than p300 p168 )
    ( greater-than p300 p858 )
    ( greater-than p300 p980 )
    ( greater-than p300 p358 )
    ( greater-than p300 p499 )
    ( greater-than p300 p248 )
  )
  ( :tasks
    ( Deliver-12Pkg p724 p812 p859 p481 p299 p168 p858 p980 p358 p499 p248 p300 l000-000 )
  )
)
