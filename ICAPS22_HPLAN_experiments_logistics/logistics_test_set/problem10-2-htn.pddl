( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l696 - location
    l837 - location
    l246 - location
    l79 - location
    l183 - location
    l819 - location
    l647 - location
    l843 - location
    l546 - location
    l917 - location
    l274 - location
    l456 - location
    l251 - location
    l3 - location
    l589 - location
    l115 - location
    l447 - location
    p486 - obj
    p73 - obj
    p867 - obj
    p887 - obj
    p506 - obj
    p528 - obj
    p467 - obj
    p653 - obj
    p267 - obj
    p731 - obj
    t1570 - truck
    t1032 - truck
    t1979 - truck
    t1647 - truck
    t1212 - truck
    t1164 - truck
    t1565 - truck
    t1730 - truck
    t1957 - truck
  )
  ( :init
    ( in-city l696 c000 )
    ( in-city l837 c000 )
    ( in-city l246 c000 )
    ( in-city l79 c000 )
    ( in-city l183 c000 )
    ( in-city l819 c000 )
    ( in-city l647 c000 )
    ( in-city l843 c000 )
    ( in-city l546 c000 )
    ( in-city l917 c000 )
    ( in-city l274 c000 )
    ( in-city l456 c000 )
    ( in-city l251 c000 )
    ( in-city l3 c000 )
    ( in-city l589 c000 )
    ( in-city l115 c000 )
    ( in-city l447 c000 )
    ( obj-at p486 l456 )
    ( obj-at p73 l246 )
    ( in-truck p867 t1647 )
    ( in-truck p887 t1979 )
    ( obj-at p506 l115 )
    ( obj-at p528 l79 )
    ( obj-at p467 l843 )
    ( obj-at p653 l447 )
    ( obj-at p267 l843 )
    ( in-truck p731 t1647 )
    ( truck-at t1570 l546 )
    ( truck-at t1032 l843 )
    ( truck-at t1979 l647 )
    ( truck-at t1647 l843 )
    ( truck-at t1212 l3 )
    ( truck-at t1164 l696 )
    ( truck-at t1565 l917 )
    ( truck-at t1730 l647 )
    ( truck-at t1957 l917 )
    ( greater-than p73 p486 )
    ( greater-than p867 p486 )
    ( greater-than p867 p73 )
    ( greater-than p887 p486 )
    ( greater-than p887 p73 )
    ( greater-than p887 p867 )
    ( greater-than p506 p486 )
    ( greater-than p506 p73 )
    ( greater-than p506 p867 )
    ( greater-than p506 p887 )
    ( greater-than p528 p486 )
    ( greater-than p528 p73 )
    ( greater-than p528 p867 )
    ( greater-than p528 p887 )
    ( greater-than p528 p506 )
    ( greater-than p467 p486 )
    ( greater-than p467 p73 )
    ( greater-than p467 p867 )
    ( greater-than p467 p887 )
    ( greater-than p467 p506 )
    ( greater-than p467 p528 )
    ( greater-than p653 p486 )
    ( greater-than p653 p73 )
    ( greater-than p653 p867 )
    ( greater-than p653 p887 )
    ( greater-than p653 p506 )
    ( greater-than p653 p528 )
    ( greater-than p653 p467 )
    ( greater-than p267 p486 )
    ( greater-than p267 p73 )
    ( greater-than p267 p867 )
    ( greater-than p267 p887 )
    ( greater-than p267 p506 )
    ( greater-than p267 p528 )
    ( greater-than p267 p467 )
    ( greater-than p267 p653 )
    ( greater-than p731 p486 )
    ( greater-than p731 p73 )
    ( greater-than p731 p867 )
    ( greater-than p731 p887 )
    ( greater-than p731 p506 )
    ( greater-than p731 p528 )
    ( greater-than p731 p467 )
    ( greater-than p731 p653 )
    ( greater-than p731 p267 )
  )
  ( :tasks
    ( Deliver-10Pkg p486 p73 p867 p887 p506 p528 p467 p653 p267 p731 l696 )
  )
)
