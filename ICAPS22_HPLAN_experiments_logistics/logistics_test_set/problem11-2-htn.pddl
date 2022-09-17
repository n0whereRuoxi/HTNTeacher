( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l35 - location
    l379 - location
    l57 - location
    l932 - location
    l536 - location
    l943 - location
    l719 - location
    l443 - location
    l126 - location
    l119 - location
    p25 - obj
    p22 - obj
    p378 - obj
    p354 - obj
    p424 - obj
    p312 - obj
    p777 - obj
    p379 - obj
    p395 - obj
    p875 - obj
    p171 - obj
    t1683 - truck
    t1769 - truck
    t1628 - truck
    t1889 - truck
    t1068 - truck
    t1357 - truck
    t1757 - truck
    t1643 - truck
    t1830 - truck
    t1491 - truck
  )
  ( :init
    ( in-city l35 c000 )
    ( in-city l379 c000 )
    ( in-city l57 c000 )
    ( in-city l932 c000 )
    ( in-city l536 c000 )
    ( in-city l943 c000 )
    ( in-city l719 c000 )
    ( in-city l443 c000 )
    ( in-city l126 c000 )
    ( in-city l119 c000 )
    ( in-truck p25 t1830 )
    ( in-truck p22 t1769 )
    ( obj-at p378 l57 )
    ( obj-at p354 l379 )
    ( obj-at p424 l126 )
    ( in-truck p312 t1889 )
    ( obj-at p777 l57 )
    ( in-truck p379 t1491 )
    ( obj-at p395 l943 )
    ( in-truck p875 t1068 )
    ( in-truck p171 t1628 )
    ( truck-at t1683 l443 )
    ( truck-at t1769 l119 )
    ( truck-at t1628 l943 )
    ( truck-at t1889 l119 )
    ( truck-at t1068 l35 )
    ( truck-at t1357 l119 )
    ( truck-at t1757 l126 )
    ( truck-at t1643 l35 )
    ( truck-at t1830 l932 )
    ( truck-at t1491 l57 )
    ( greater-than p22 p25 )
    ( greater-than p378 p25 )
    ( greater-than p378 p22 )
    ( greater-than p354 p25 )
    ( greater-than p354 p22 )
    ( greater-than p354 p378 )
    ( greater-than p424 p25 )
    ( greater-than p424 p22 )
    ( greater-than p424 p378 )
    ( greater-than p424 p354 )
    ( greater-than p312 p25 )
    ( greater-than p312 p22 )
    ( greater-than p312 p378 )
    ( greater-than p312 p354 )
    ( greater-than p312 p424 )
    ( greater-than p777 p25 )
    ( greater-than p777 p22 )
    ( greater-than p777 p378 )
    ( greater-than p777 p354 )
    ( greater-than p777 p424 )
    ( greater-than p777 p312 )
    ( greater-than p379 p25 )
    ( greater-than p379 p22 )
    ( greater-than p379 p378 )
    ( greater-than p379 p354 )
    ( greater-than p379 p424 )
    ( greater-than p379 p312 )
    ( greater-than p379 p777 )
    ( greater-than p395 p25 )
    ( greater-than p395 p22 )
    ( greater-than p395 p378 )
    ( greater-than p395 p354 )
    ( greater-than p395 p424 )
    ( greater-than p395 p312 )
    ( greater-than p395 p777 )
    ( greater-than p395 p379 )
    ( greater-than p875 p25 )
    ( greater-than p875 p22 )
    ( greater-than p875 p378 )
    ( greater-than p875 p354 )
    ( greater-than p875 p424 )
    ( greater-than p875 p312 )
    ( greater-than p875 p777 )
    ( greater-than p875 p379 )
    ( greater-than p875 p395 )
    ( greater-than p171 p25 )
    ( greater-than p171 p22 )
    ( greater-than p171 p378 )
    ( greater-than p171 p354 )
    ( greater-than p171 p424 )
    ( greater-than p171 p312 )
    ( greater-than p171 p777 )
    ( greater-than p171 p379 )
    ( greater-than p171 p395 )
    ( greater-than p171 p875 )
  )
  ( :tasks
    ( Deliver-11Pkg p25 p22 p378 p354 p424 p312 p777 p379 p395 p875 p171 l35 )
  )
)
