( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l477 - location
    l537 - location
    l892 - location
    l402 - location
    l122 - location
    l937 - location
    l427 - location
    l956 - location
    l972 - location
    l350 - location
    l60 - location
    l896 - location
    l126 - location
    l698 - location
    l603 - location
    l253 - location
    l874 - location
    l146 - location
    l240 - location
    l814 - location
    p88 - obj
    p342 - obj
    p588 - obj
    p887 - obj
    p862 - obj
    p295 - obj
    p561 - obj
    p256 - obj
    p506 - obj
    p167 - obj
    p450 - obj
    p718 - obj
    p656 - obj
    t1329 - truck
    t1632 - truck
    t1765 - truck
    t1556 - truck
    t1168 - truck
    t1069 - truck
    t1334 - truck
    t1982 - truck
    t1684 - truck
    t1380 - truck
    t1294 - truck
    t1164 - truck
  )
  ( :init
    ( in-city l477 c000 )
    ( in-city l537 c000 )
    ( in-city l892 c000 )
    ( in-city l402 c000 )
    ( in-city l122 c000 )
    ( in-city l937 c000 )
    ( in-city l427 c000 )
    ( in-city l956 c000 )
    ( in-city l972 c000 )
    ( in-city l350 c000 )
    ( in-city l60 c000 )
    ( in-city l896 c000 )
    ( in-city l126 c000 )
    ( in-city l698 c000 )
    ( in-city l603 c000 )
    ( in-city l253 c000 )
    ( in-city l874 c000 )
    ( in-city l146 c000 )
    ( in-city l240 c000 )
    ( in-city l814 c000 )
    ( obj-at p88 l60 )
    ( obj-at p342 l896 )
    ( obj-at p588 l892 )
    ( obj-at p887 l60 )
    ( in-truck p862 t1556 )
    ( in-truck p295 t1765 )
    ( obj-at p561 l874 )
    ( obj-at p256 l892 )
    ( obj-at p506 l146 )
    ( obj-at p167 l972 )
    ( in-truck p450 t1329 )
    ( obj-at p718 l896 )
    ( obj-at p656 l603 )
    ( truck-at t1329 l956 )
    ( truck-at t1632 l937 )
    ( truck-at t1765 l603 )
    ( truck-at t1556 l350 )
    ( truck-at t1168 l814 )
    ( truck-at t1069 l146 )
    ( truck-at t1334 l477 )
    ( truck-at t1982 l537 )
    ( truck-at t1684 l937 )
    ( truck-at t1380 l956 )
    ( truck-at t1294 l956 )
    ( truck-at t1164 l477 )
    ( greater-than p342 p88 )
    ( greater-than p588 p88 )
    ( greater-than p588 p342 )
    ( greater-than p887 p88 )
    ( greater-than p887 p342 )
    ( greater-than p887 p588 )
    ( greater-than p862 p88 )
    ( greater-than p862 p342 )
    ( greater-than p862 p588 )
    ( greater-than p862 p887 )
    ( greater-than p295 p88 )
    ( greater-than p295 p342 )
    ( greater-than p295 p588 )
    ( greater-than p295 p887 )
    ( greater-than p295 p862 )
    ( greater-than p561 p88 )
    ( greater-than p561 p342 )
    ( greater-than p561 p588 )
    ( greater-than p561 p887 )
    ( greater-than p561 p862 )
    ( greater-than p561 p295 )
    ( greater-than p256 p88 )
    ( greater-than p256 p342 )
    ( greater-than p256 p588 )
    ( greater-than p256 p887 )
    ( greater-than p256 p862 )
    ( greater-than p256 p295 )
    ( greater-than p256 p561 )
    ( greater-than p506 p88 )
    ( greater-than p506 p342 )
    ( greater-than p506 p588 )
    ( greater-than p506 p887 )
    ( greater-than p506 p862 )
    ( greater-than p506 p295 )
    ( greater-than p506 p561 )
    ( greater-than p506 p256 )
    ( greater-than p167 p88 )
    ( greater-than p167 p342 )
    ( greater-than p167 p588 )
    ( greater-than p167 p887 )
    ( greater-than p167 p862 )
    ( greater-than p167 p295 )
    ( greater-than p167 p561 )
    ( greater-than p167 p256 )
    ( greater-than p167 p506 )
    ( greater-than p450 p88 )
    ( greater-than p450 p342 )
    ( greater-than p450 p588 )
    ( greater-than p450 p887 )
    ( greater-than p450 p862 )
    ( greater-than p450 p295 )
    ( greater-than p450 p561 )
    ( greater-than p450 p256 )
    ( greater-than p450 p506 )
    ( greater-than p450 p167 )
    ( greater-than p718 p88 )
    ( greater-than p718 p342 )
    ( greater-than p718 p588 )
    ( greater-than p718 p887 )
    ( greater-than p718 p862 )
    ( greater-than p718 p295 )
    ( greater-than p718 p561 )
    ( greater-than p718 p256 )
    ( greater-than p718 p506 )
    ( greater-than p718 p167 )
    ( greater-than p718 p450 )
    ( greater-than p656 p88 )
    ( greater-than p656 p342 )
    ( greater-than p656 p588 )
    ( greater-than p656 p887 )
    ( greater-than p656 p862 )
    ( greater-than p656 p295 )
    ( greater-than p656 p561 )
    ( greater-than p656 p256 )
    ( greater-than p656 p506 )
    ( greater-than p656 p167 )
    ( greater-than p656 p450 )
    ( greater-than p656 p718 )
  )
  ( :tasks
    ( Deliver-13Pkg p88 p342 p588 p887 p862 p295 p561 p256 p506 p167 p450 p718 p656 l477 )
  )
)
