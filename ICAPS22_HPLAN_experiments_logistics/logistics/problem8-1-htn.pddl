( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-795 - location
    l000-601 - location
    l000-51 - location
    l000-551 - location
    l000-778 - location
    l000-962 - location
    l000-770 - location
    l000-925 - location
    l000-59 - location
    l000-347 - location
    l000-665 - location
    l000-587 - location
    l000-438 - location
    l000-963 - location
    l000-509 - location
    p155 - obj
    p234 - obj
    p138 - obj
    p353 - obj
    p729 - obj
    p510 - obj
    p449 - obj
    p436 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-795 c000 )
    ( in-city l000-601 c000 )
    ( in-city l000-51 c000 )
    ( in-city l000-551 c000 )
    ( in-city l000-778 c000 )
    ( in-city l000-962 c000 )
    ( in-city l000-770 c000 )
    ( in-city l000-925 c000 )
    ( in-city l000-59 c000 )
    ( in-city l000-347 c000 )
    ( in-city l000-665 c000 )
    ( in-city l000-587 c000 )
    ( in-city l000-438 c000 )
    ( in-city l000-963 c000 )
    ( in-city l000-509 c000 )
    ( obj-at p155 l000-795 )
    ( obj-at p234 l000-665 )
    ( obj-at p138 l000-778 )
    ( obj-at p353 l000-587 )
    ( obj-at p729 l000-795 )
    ( obj-at p510 l000-665 )
    ( obj-at p449 l000-59 )
    ( obj-at p436 l000-347 )
    ( greater-than p234 p155 )
    ( greater-than p138 p155 )
    ( greater-than p138 p234 )
    ( greater-than p353 p155 )
    ( greater-than p353 p234 )
    ( greater-than p353 p138 )
    ( greater-than p729 p155 )
    ( greater-than p729 p234 )
    ( greater-than p729 p138 )
    ( greater-than p729 p353 )
    ( greater-than p510 p155 )
    ( greater-than p510 p234 )
    ( greater-than p510 p138 )
    ( greater-than p510 p353 )
    ( greater-than p510 p729 )
    ( greater-than p449 p155 )
    ( greater-than p449 p234 )
    ( greater-than p449 p138 )
    ( greater-than p449 p353 )
    ( greater-than p449 p729 )
    ( greater-than p449 p510 )
    ( greater-than p436 p155 )
    ( greater-than p436 p234 )
    ( greater-than p436 p138 )
    ( greater-than p436 p353 )
    ( greater-than p436 p729 )
    ( greater-than p436 p510 )
    ( greater-than p436 p449 )
  )
  ( :tasks
    ( Deliver-8Pkg p155 p234 p138 p353 p729 p510 p449 p436 l000-000 )
  )
)
