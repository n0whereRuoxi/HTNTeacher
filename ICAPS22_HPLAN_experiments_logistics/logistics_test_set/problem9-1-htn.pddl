( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l795 - location
    l708 - location
    l7 - location
    l323 - location
    l943 - location
    l1 - location
    l963 - location
    l449 - location
    l102 - location
    l371 - location
    l913 - location
    l312 - location
    l831 - location
    l727 - location
    p911 - obj
    p648 - obj
    p883 - obj
    p326 - obj
    p596 - obj
    p528 - obj
    p389 - obj
    p172 - obj
    p292 - obj
    t1983 - truck
    t1526 - truck
    t1782 - truck
    t1223 - truck
    t1322 - truck
    t1674 - truck
    t1909 - truck
    t1018 - truck
  )
  ( :init
    ( in-city l795 c000 )
    ( in-city l708 c000 )
    ( in-city l7 c000 )
    ( in-city l323 c000 )
    ( in-city l943 c000 )
    ( in-city l1 c000 )
    ( in-city l963 c000 )
    ( in-city l449 c000 )
    ( in-city l102 c000 )
    ( in-city l371 c000 )
    ( in-city l913 c000 )
    ( in-city l312 c000 )
    ( in-city l831 c000 )
    ( in-city l727 c000 )
    ( in-truck p911 t1983 )
    ( in-truck p648 t1018 )
    ( obj-at p883 l831 )
    ( obj-at p326 l1 )
    ( in-truck p596 t1674 )
    ( obj-at p528 l323 )
    ( in-truck p389 t1018 )
    ( in-truck p172 t1674 )
    ( obj-at p292 l7 )
    ( truck-at t1983 l943 )
    ( truck-at t1526 l831 )
    ( truck-at t1782 l708 )
    ( truck-at t1223 l449 )
    ( truck-at t1322 l323 )
    ( truck-at t1674 l795 )
    ( truck-at t1909 l1 )
    ( truck-at t1018 l831 )
    ( greater-than p648 p911 )
    ( greater-than p883 p911 )
    ( greater-than p883 p648 )
    ( greater-than p326 p911 )
    ( greater-than p326 p648 )
    ( greater-than p326 p883 )
    ( greater-than p596 p911 )
    ( greater-than p596 p648 )
    ( greater-than p596 p883 )
    ( greater-than p596 p326 )
    ( greater-than p528 p911 )
    ( greater-than p528 p648 )
    ( greater-than p528 p883 )
    ( greater-than p528 p326 )
    ( greater-than p528 p596 )
    ( greater-than p389 p911 )
    ( greater-than p389 p648 )
    ( greater-than p389 p883 )
    ( greater-than p389 p326 )
    ( greater-than p389 p596 )
    ( greater-than p389 p528 )
    ( greater-than p172 p911 )
    ( greater-than p172 p648 )
    ( greater-than p172 p883 )
    ( greater-than p172 p326 )
    ( greater-than p172 p596 )
    ( greater-than p172 p528 )
    ( greater-than p172 p389 )
    ( greater-than p292 p911 )
    ( greater-than p292 p648 )
    ( greater-than p292 p883 )
    ( greater-than p292 p326 )
    ( greater-than p292 p596 )
    ( greater-than p292 p528 )
    ( greater-than p292 p389 )
    ( greater-than p292 p172 )
  )
  ( :tasks
    ( Deliver-9Pkg p911 p648 p883 p326 p596 p528 p389 p172 p292 l795 )
  )
)
