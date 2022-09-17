( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l785 - location
    l734 - location
    l349 - location
    l739 - location
    p914 - obj
    p468 - obj
    p599 - obj
    p410 - obj
    p332 - obj
    t1872 - truck
    t1717 - truck
    t1203 - truck
    t1956 - truck
  )
  ( :init
    ( in-city l785 c000 )
    ( in-city l734 c000 )
    ( in-city l349 c000 )
    ( in-city l739 c000 )
    ( in-truck p914 t1872 )
    ( obj-at p468 l734 )
    ( obj-at p599 l739 )
    ( in-truck p410 t1717 )
    ( obj-at p332 l734 )
    ( truck-at t1872 l349 )
    ( truck-at t1717 l739 )
    ( truck-at t1203 l349 )
    ( truck-at t1956 l739 )
    ( greater-than p468 p914 )
    ( greater-than p599 p914 )
    ( greater-than p599 p468 )
    ( greater-than p410 p914 )
    ( greater-than p410 p468 )
    ( greater-than p410 p599 )
    ( greater-than p332 p914 )
    ( greater-than p332 p468 )
    ( greater-than p332 p599 )
    ( greater-than p332 p410 )
  )
  ( :tasks
    ( Deliver-5Pkg p914 p468 p599 p410 p332 l785 )
  )
)
