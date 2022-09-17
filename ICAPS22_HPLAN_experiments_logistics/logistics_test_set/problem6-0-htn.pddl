( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l902 - location
    l687 - location
    l249 - location
    l375 - location
    l519 - location
    l147 - location
    l301 - location
    p63 - obj
    p961 - obj
    p503 - obj
    p382 - obj
    p436 - obj
    p942 - obj
    t1010 - truck
    t1847 - truck
    t1182 - truck
    t1814 - truck
    t1232 - truck
  )
  ( :init
    ( in-city l902 c000 )
    ( in-city l687 c000 )
    ( in-city l249 c000 )
    ( in-city l375 c000 )
    ( in-city l519 c000 )
    ( in-city l147 c000 )
    ( in-city l301 c000 )
    ( obj-at p63 l249 )
    ( obj-at p961 l249 )
    ( in-truck p503 t1182 )
    ( obj-at p382 l301 )
    ( in-truck p436 t1847 )
    ( in-truck p942 t1232 )
    ( truck-at t1010 l301 )
    ( truck-at t1847 l902 )
    ( truck-at t1182 l519 )
    ( truck-at t1814 l902 )
    ( truck-at t1232 l902 )
    ( greater-than p961 p63 )
    ( greater-than p503 p63 )
    ( greater-than p503 p961 )
    ( greater-than p382 p63 )
    ( greater-than p382 p961 )
    ( greater-than p382 p503 )
    ( greater-than p436 p63 )
    ( greater-than p436 p961 )
    ( greater-than p436 p503 )
    ( greater-than p436 p382 )
    ( greater-than p942 p63 )
    ( greater-than p942 p961 )
    ( greater-than p942 p503 )
    ( greater-than p942 p382 )
    ( greater-than p942 p436 )
  )
  ( :tasks
    ( Deliver-6Pkg p63 p961 p503 p382 p436 p942 l902 )
  )
)
