( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l602 - location
    l747 - location
    l556 - location
    l929 - location
    l326 - location
    l102 - location
    l425 - location
    l46 - location
    l754 - location
    l575 - location
    l29 - location
    l39 - location
    l514 - location
    p271 - obj
    p619 - obj
    p99 - obj
    p232 - obj
    p477 - obj
    p772 - obj
    p80 - obj
    p19 - obj
    p203 - obj
    p940 - obj
    p799 - obj
    p475 - obj
    t1782 - truck
    t1583 - truck
    t1197 - truck
    t1105 - truck
    t1213 - truck
    t1878 - truck
    t1265 - truck
    t1721 - truck
    t1838 - truck
    t1270 - truck
    t1106 - truck
  )
  ( :init
    ( in-city l602 c000 )
    ( in-city l747 c000 )
    ( in-city l556 c000 )
    ( in-city l929 c000 )
    ( in-city l326 c000 )
    ( in-city l102 c000 )
    ( in-city l425 c000 )
    ( in-city l46 c000 )
    ( in-city l754 c000 )
    ( in-city l575 c000 )
    ( in-city l29 c000 )
    ( in-city l39 c000 )
    ( in-city l514 c000 )
    ( obj-at p271 l747 )
    ( obj-at p619 l514 )
    ( in-truck p99 t1265 )
    ( obj-at p232 l575 )
    ( in-truck p477 t1838 )
    ( in-truck p772 t1270 )
    ( obj-at p80 l46 )
    ( obj-at p19 l326 )
    ( obj-at p203 l556 )
    ( in-truck p940 t1265 )
    ( in-truck p799 t1106 )
    ( in-truck p475 t1105 )
    ( truck-at t1782 l514 )
    ( truck-at t1583 l747 )
    ( truck-at t1197 l747 )
    ( truck-at t1105 l602 )
    ( truck-at t1213 l747 )
    ( truck-at t1878 l326 )
    ( truck-at t1265 l102 )
    ( truck-at t1721 l46 )
    ( truck-at t1838 l929 )
    ( truck-at t1270 l754 )
    ( truck-at t1106 l39 )
    ( greater-than p619 p271 )
    ( greater-than p99 p271 )
    ( greater-than p99 p619 )
    ( greater-than p232 p271 )
    ( greater-than p232 p619 )
    ( greater-than p232 p99 )
    ( greater-than p477 p271 )
    ( greater-than p477 p619 )
    ( greater-than p477 p99 )
    ( greater-than p477 p232 )
    ( greater-than p772 p271 )
    ( greater-than p772 p619 )
    ( greater-than p772 p99 )
    ( greater-than p772 p232 )
    ( greater-than p772 p477 )
    ( greater-than p80 p271 )
    ( greater-than p80 p619 )
    ( greater-than p80 p99 )
    ( greater-than p80 p232 )
    ( greater-than p80 p477 )
    ( greater-than p80 p772 )
    ( greater-than p19 p271 )
    ( greater-than p19 p619 )
    ( greater-than p19 p99 )
    ( greater-than p19 p232 )
    ( greater-than p19 p477 )
    ( greater-than p19 p772 )
    ( greater-than p19 p80 )
    ( greater-than p203 p271 )
    ( greater-than p203 p619 )
    ( greater-than p203 p99 )
    ( greater-than p203 p232 )
    ( greater-than p203 p477 )
    ( greater-than p203 p772 )
    ( greater-than p203 p80 )
    ( greater-than p203 p19 )
    ( greater-than p940 p271 )
    ( greater-than p940 p619 )
    ( greater-than p940 p99 )
    ( greater-than p940 p232 )
    ( greater-than p940 p477 )
    ( greater-than p940 p772 )
    ( greater-than p940 p80 )
    ( greater-than p940 p19 )
    ( greater-than p940 p203 )
    ( greater-than p799 p271 )
    ( greater-than p799 p619 )
    ( greater-than p799 p99 )
    ( greater-than p799 p232 )
    ( greater-than p799 p477 )
    ( greater-than p799 p772 )
    ( greater-than p799 p80 )
    ( greater-than p799 p19 )
    ( greater-than p799 p203 )
    ( greater-than p799 p940 )
    ( greater-than p475 p271 )
    ( greater-than p475 p619 )
    ( greater-than p475 p99 )
    ( greater-than p475 p232 )
    ( greater-than p475 p477 )
    ( greater-than p475 p772 )
    ( greater-than p475 p80 )
    ( greater-than p475 p19 )
    ( greater-than p475 p203 )
    ( greater-than p475 p940 )
    ( greater-than p475 p799 )
  )
  ( :tasks
    ( Deliver-12Pkg p271 p619 p99 p232 p477 p772 p80 p19 p203 p940 p799 p475 l602 )
  )
)
