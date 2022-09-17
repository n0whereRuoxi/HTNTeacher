( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l511 - location
    l433 - location
    p637 - obj
    p65 - obj
    p509 - obj
    p170 - obj
    p376 - obj
    t1305 - truck
    t1416 - truck
    t1262 - truck
    t1164 - truck
  )
  ( :init
    ( in-city l511 c000 )
    ( in-city l433 c000 )
    ( in-truck p637 t1262 )
    ( in-truck p65 t1262 )
    ( obj-at p509 l433 )
    ( in-truck p170 t1262 )
    ( in-truck p376 t1416 )
    ( truck-at t1305 l433 )
    ( truck-at t1416 l433 )
    ( truck-at t1262 l433 )
    ( truck-at t1164 l433 )
    ( greater-than p65 p637 )
    ( greater-than p509 p637 )
    ( greater-than p509 p65 )
    ( greater-than p170 p637 )
    ( greater-than p170 p65 )
    ( greater-than p170 p509 )
    ( greater-than p376 p637 )
    ( greater-than p376 p65 )
    ( greater-than p376 p509 )
    ( greater-than p376 p170 )
  )
  ( :tasks
    ( Deliver-5Pkg p637 p65 p509 p170 p376 l511 )
  )
)
