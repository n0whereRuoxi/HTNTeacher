( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l76 - location
    l468 - location
    l72 - location
    l153 - location
    l497 - location
    l671 - location
    l370 - location
    l917 - location
    l493 - location
    l417 - location
    l271 - location
    l427 - location
    l953 - location
    p550 - obj
    p596 - obj
    p231 - obj
    p923 - obj
    p530 - obj
    p413 - obj
    p952 - obj
    t1804 - truck
    t1411 - truck
    t1500 - truck
    t1170 - truck
    t1881 - truck
    t1461 - truck
  )
  ( :init
    ( in-city l76 c000 )
    ( in-city l468 c000 )
    ( in-city l72 c000 )
    ( in-city l153 c000 )
    ( in-city l497 c000 )
    ( in-city l671 c000 )
    ( in-city l370 c000 )
    ( in-city l917 c000 )
    ( in-city l493 c000 )
    ( in-city l417 c000 )
    ( in-city l271 c000 )
    ( in-city l427 c000 )
    ( in-city l953 c000 )
    ( obj-at p550 l953 )
    ( obj-at p596 l953 )
    ( obj-at p231 l72 )
    ( obj-at p923 l417 )
    ( obj-at p530 l153 )
    ( obj-at p413 l271 )
    ( obj-at p952 l370 )
    ( truck-at t1804 l417 )
    ( truck-at t1411 l153 )
    ( truck-at t1500 l497 )
    ( truck-at t1170 l153 )
    ( truck-at t1881 l493 )
    ( truck-at t1461 l917 )
    ( greater-than p596 p550 )
    ( greater-than p231 p550 )
    ( greater-than p231 p596 )
    ( greater-than p923 p550 )
    ( greater-than p923 p596 )
    ( greater-than p923 p231 )
    ( greater-than p530 p550 )
    ( greater-than p530 p596 )
    ( greater-than p530 p231 )
    ( greater-than p530 p923 )
    ( greater-than p413 p550 )
    ( greater-than p413 p596 )
    ( greater-than p413 p231 )
    ( greater-than p413 p923 )
    ( greater-than p413 p530 )
    ( greater-than p952 p550 )
    ( greater-than p952 p596 )
    ( greater-than p952 p231 )
    ( greater-than p952 p923 )
    ( greater-than p952 p530 )
    ( greater-than p952 p413 )
  )
  ( :tasks
    ( Deliver-7Pkg p550 p596 p231 p923 p530 p413 p952 l76 )
  )
)
