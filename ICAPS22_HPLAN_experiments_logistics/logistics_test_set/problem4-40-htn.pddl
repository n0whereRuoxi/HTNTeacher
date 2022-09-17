( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l936 - location
    l174 - location
    l36 - location
    l134 - location
    l811 - location
    p808 - obj
    p359 - obj
    p494 - obj
    p629 - obj
    t1163 - truck
    t1672 - truck
    t1205 - truck
  )
  ( :init
    ( in-city l936 c000 )
    ( in-city l174 c000 )
    ( in-city l36 c000 )
    ( in-city l134 c000 )
    ( in-city l811 c000 )
    ( in-truck p808 t1672 )
    ( obj-at p359 l811 )
    ( obj-at p494 l134 )
    ( obj-at p629 l174 )
    ( truck-at t1163 l811 )
    ( truck-at t1672 l134 )
    ( truck-at t1205 l174 )
    ( greater-than p359 p808 )
    ( greater-than p494 p808 )
    ( greater-than p494 p359 )
    ( greater-than p629 p808 )
    ( greater-than p629 p359 )
    ( greater-than p629 p494 )
  )
  ( :tasks
    ( Deliver-4Pkg p808 p359 p494 p629 l936 )
  )
)
