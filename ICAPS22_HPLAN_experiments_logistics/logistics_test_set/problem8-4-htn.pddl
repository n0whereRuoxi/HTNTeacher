( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l57 - location
    l518 - location
    l369 - location
    l997 - location
    l277 - location
    l541 - location
    l844 - location
    l598 - location
    l968 - location
    l155 - location
    p727 - obj
    p396 - obj
    p860 - obj
    p979 - obj
    p541 - obj
    p818 - obj
    p477 - obj
    p776 - obj
    t1880 - truck
    t1496 - truck
    t1832 - truck
    t1147 - truck
    t1985 - truck
    t1699 - truck
    t1413 - truck
  )
  ( :init
    ( in-city l57 c000 )
    ( in-city l518 c000 )
    ( in-city l369 c000 )
    ( in-city l997 c000 )
    ( in-city l277 c000 )
    ( in-city l541 c000 )
    ( in-city l844 c000 )
    ( in-city l598 c000 )
    ( in-city l968 c000 )
    ( in-city l155 c000 )
    ( obj-at p727 l541 )
    ( obj-at p396 l277 )
    ( obj-at p860 l277 )
    ( obj-at p979 l968 )
    ( obj-at p541 l598 )
    ( obj-at p818 l844 )
    ( obj-at p477 l997 )
    ( obj-at p776 l155 )
    ( truck-at t1880 l997 )
    ( truck-at t1496 l598 )
    ( truck-at t1832 l369 )
    ( truck-at t1147 l518 )
    ( truck-at t1985 l57 )
    ( truck-at t1699 l277 )
    ( truck-at t1413 l369 )
    ( greater-than p396 p727 )
    ( greater-than p860 p727 )
    ( greater-than p860 p396 )
    ( greater-than p979 p727 )
    ( greater-than p979 p396 )
    ( greater-than p979 p860 )
    ( greater-than p541 p727 )
    ( greater-than p541 p396 )
    ( greater-than p541 p860 )
    ( greater-than p541 p979 )
    ( greater-than p818 p727 )
    ( greater-than p818 p396 )
    ( greater-than p818 p860 )
    ( greater-than p818 p979 )
    ( greater-than p818 p541 )
    ( greater-than p477 p727 )
    ( greater-than p477 p396 )
    ( greater-than p477 p860 )
    ( greater-than p477 p979 )
    ( greater-than p477 p541 )
    ( greater-than p477 p818 )
    ( greater-than p776 p727 )
    ( greater-than p776 p396 )
    ( greater-than p776 p860 )
    ( greater-than p776 p979 )
    ( greater-than p776 p541 )
    ( greater-than p776 p818 )
    ( greater-than p776 p477 )
  )
  ( :tasks
    ( Deliver-8Pkg p727 p396 p860 p979 p541 p818 p477 p776 l57 )
  )
)
