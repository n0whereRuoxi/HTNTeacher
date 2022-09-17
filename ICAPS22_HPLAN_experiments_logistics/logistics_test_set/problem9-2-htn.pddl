( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l136 - location
    l296 - location
    l146 - location
    l726 - location
    l35 - location
    l180 - location
    l105 - location
    l851 - location
    l972 - location
    l406 - location
    p334 - obj
    p528 - obj
    p743 - obj
    p78 - obj
    p546 - obj
    p95 - obj
    p891 - obj
    p588 - obj
    p242 - obj
    t1990 - truck
    t1588 - truck
    t1689 - truck
    t1277 - truck
    t1362 - truck
    t1939 - truck
    t1033 - truck
    t1484 - truck
  )
  ( :init
    ( in-city l136 c000 )
    ( in-city l296 c000 )
    ( in-city l146 c000 )
    ( in-city l726 c000 )
    ( in-city l35 c000 )
    ( in-city l180 c000 )
    ( in-city l105 c000 )
    ( in-city l851 c000 )
    ( in-city l972 c000 )
    ( in-city l406 c000 )
    ( obj-at p334 l35 )
    ( obj-at p528 l726 )
    ( in-truck p743 t1689 )
    ( obj-at p78 l726 )
    ( in-truck p546 t1277 )
    ( in-truck p95 t1588 )
    ( obj-at p891 l726 )
    ( obj-at p588 l972 )
    ( obj-at p242 l406 )
    ( truck-at t1990 l406 )
    ( truck-at t1588 l726 )
    ( truck-at t1689 l136 )
    ( truck-at t1277 l851 )
    ( truck-at t1362 l180 )
    ( truck-at t1939 l136 )
    ( truck-at t1033 l296 )
    ( truck-at t1484 l726 )
    ( greater-than p528 p334 )
    ( greater-than p743 p334 )
    ( greater-than p743 p528 )
    ( greater-than p78 p334 )
    ( greater-than p78 p528 )
    ( greater-than p78 p743 )
    ( greater-than p546 p334 )
    ( greater-than p546 p528 )
    ( greater-than p546 p743 )
    ( greater-than p546 p78 )
    ( greater-than p95 p334 )
    ( greater-than p95 p528 )
    ( greater-than p95 p743 )
    ( greater-than p95 p78 )
    ( greater-than p95 p546 )
    ( greater-than p891 p334 )
    ( greater-than p891 p528 )
    ( greater-than p891 p743 )
    ( greater-than p891 p78 )
    ( greater-than p891 p546 )
    ( greater-than p891 p95 )
    ( greater-than p588 p334 )
    ( greater-than p588 p528 )
    ( greater-than p588 p743 )
    ( greater-than p588 p78 )
    ( greater-than p588 p546 )
    ( greater-than p588 p95 )
    ( greater-than p588 p891 )
    ( greater-than p242 p334 )
    ( greater-than p242 p528 )
    ( greater-than p242 p743 )
    ( greater-than p242 p78 )
    ( greater-than p242 p546 )
    ( greater-than p242 p95 )
    ( greater-than p242 p891 )
    ( greater-than p242 p588 )
  )
  ( :tasks
    ( Deliver-9Pkg p334 p528 p743 p78 p546 p95 p891 p588 p242 l136 )
  )
)
