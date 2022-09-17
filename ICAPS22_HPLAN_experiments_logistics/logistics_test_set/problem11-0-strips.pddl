( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l492 - location
    l471 - location
    l280 - location
    l197 - location
    l213 - location
    l941 - location
    l697 - location
    l586 - location
    l823 - location
    p357 - obj
    p647 - obj
    p687 - obj
    p616 - obj
    p712 - obj
    p183 - obj
    p141 - obj
    p786 - obj
    p234 - obj
    p203 - obj
    p275 - obj
    t1123 - truck
    t1596 - truck
    t1411 - truck
    t1033 - truck
    t1432 - truck
    t1281 - truck
    t1339 - truck
    t1219 - truck
    t1773 - truck
    t1216 - truck
  )
  ( :init
    ( in-city l492 c000 )
    ( in-city l471 c000 )
    ( in-city l280 c000 )
    ( in-city l197 c000 )
    ( in-city l213 c000 )
    ( in-city l941 c000 )
    ( in-city l697 c000 )
    ( in-city l586 c000 )
    ( in-city l823 c000 )
    ( in-truck p357 t1033 )
    ( in-truck p647 t1339 )
    ( in-truck p687 t1216 )
    ( in-truck p616 t1219 )
    ( in-truck p712 t1123 )
    ( in-truck p183 t1773 )
    ( obj-at p141 l941 )
    ( in-truck p786 t1339 )
    ( obj-at p234 l697 )
    ( in-truck p203 t1219 )
    ( in-truck p275 t1219 )
    ( truck-at t1123 l492 )
    ( truck-at t1596 l823 )
    ( truck-at t1411 l823 )
    ( truck-at t1033 l586 )
    ( truck-at t1432 l941 )
    ( truck-at t1281 l586 )
    ( truck-at t1339 l586 )
    ( truck-at t1219 l197 )
    ( truck-at t1773 l823 )
    ( truck-at t1216 l586 )
    ( greater-than p647 p357 )
    ( greater-than p687 p357 )
    ( greater-than p687 p647 )
    ( greater-than p616 p357 )
    ( greater-than p616 p647 )
    ( greater-than p616 p687 )
    ( greater-than p712 p357 )
    ( greater-than p712 p647 )
    ( greater-than p712 p687 )
    ( greater-than p712 p616 )
    ( greater-than p183 p357 )
    ( greater-than p183 p647 )
    ( greater-than p183 p687 )
    ( greater-than p183 p616 )
    ( greater-than p183 p712 )
    ( greater-than p141 p357 )
    ( greater-than p141 p647 )
    ( greater-than p141 p687 )
    ( greater-than p141 p616 )
    ( greater-than p141 p712 )
    ( greater-than p141 p183 )
    ( greater-than p786 p357 )
    ( greater-than p786 p647 )
    ( greater-than p786 p687 )
    ( greater-than p786 p616 )
    ( greater-than p786 p712 )
    ( greater-than p786 p183 )
    ( greater-than p786 p141 )
    ( greater-than p234 p357 )
    ( greater-than p234 p647 )
    ( greater-than p234 p687 )
    ( greater-than p234 p616 )
    ( greater-than p234 p712 )
    ( greater-than p234 p183 )
    ( greater-than p234 p141 )
    ( greater-than p234 p786 )
    ( greater-than p203 p357 )
    ( greater-than p203 p647 )
    ( greater-than p203 p687 )
    ( greater-than p203 p616 )
    ( greater-than p203 p712 )
    ( greater-than p203 p183 )
    ( greater-than p203 p141 )
    ( greater-than p203 p786 )
    ( greater-than p203 p234 )
    ( greater-than p275 p357 )
    ( greater-than p275 p647 )
    ( greater-than p275 p687 )
    ( greater-than p275 p616 )
    ( greater-than p275 p712 )
    ( greater-than p275 p183 )
    ( greater-than p275 p141 )
    ( greater-than p275 p786 )
    ( greater-than p275 p234 )
    ( greater-than p275 p203 )
  )
  ( :goal
    ( and
      ( obj-at p357 l492 )
      ( obj-at p647 l492 )
      ( obj-at p687 l492 )
      ( obj-at p616 l492 )
      ( obj-at p712 l492 )
      ( obj-at p183 l492 )
      ( obj-at p141 l492 )
      ( obj-at p786 l492 )
      ( obj-at p234 l492 )
      ( obj-at p203 l492 )
      ( obj-at p275 l492 )
    )
  )
)
