( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l291 - location
    l319 - location
    l939 - location
    l901 - location
    l830 - location
    l492 - location
    l521 - location
    l367 - location
    l700 - location
    p747 - obj
    p889 - obj
    p212 - obj
    p79 - obj
    p788 - obj
    p93 - obj
    p673 - obj
    p810 - obj
    p193 - obj
    p324 - obj
    t1614 - truck
    t1162 - truck
    t1423 - truck
    t1890 - truck
    t1276 - truck
    t1545 - truck
    t1138 - truck
    t1074 - truck
    t1687 - truck
  )
  ( :init
    ( in-city l291 c000 )
    ( in-city l319 c000 )
    ( in-city l939 c000 )
    ( in-city l901 c000 )
    ( in-city l830 c000 )
    ( in-city l492 c000 )
    ( in-city l521 c000 )
    ( in-city l367 c000 )
    ( in-city l700 c000 )
    ( obj-at p747 l939 )
    ( in-truck p889 t1074 )
    ( obj-at p212 l700 )
    ( in-truck p79 t1890 )
    ( obj-at p788 l830 )
    ( obj-at p93 l319 )
    ( obj-at p673 l901 )
    ( obj-at p810 l901 )
    ( obj-at p193 l830 )
    ( in-truck p324 t1687 )
    ( truck-at t1614 l367 )
    ( truck-at t1162 l492 )
    ( truck-at t1423 l700 )
    ( truck-at t1890 l939 )
    ( truck-at t1276 l367 )
    ( truck-at t1545 l492 )
    ( truck-at t1138 l830 )
    ( truck-at t1074 l521 )
    ( truck-at t1687 l939 )
    ( greater-than p889 p747 )
    ( greater-than p212 p747 )
    ( greater-than p212 p889 )
    ( greater-than p79 p747 )
    ( greater-than p79 p889 )
    ( greater-than p79 p212 )
    ( greater-than p788 p747 )
    ( greater-than p788 p889 )
    ( greater-than p788 p212 )
    ( greater-than p788 p79 )
    ( greater-than p93 p747 )
    ( greater-than p93 p889 )
    ( greater-than p93 p212 )
    ( greater-than p93 p79 )
    ( greater-than p93 p788 )
    ( greater-than p673 p747 )
    ( greater-than p673 p889 )
    ( greater-than p673 p212 )
    ( greater-than p673 p79 )
    ( greater-than p673 p788 )
    ( greater-than p673 p93 )
    ( greater-than p810 p747 )
    ( greater-than p810 p889 )
    ( greater-than p810 p212 )
    ( greater-than p810 p79 )
    ( greater-than p810 p788 )
    ( greater-than p810 p93 )
    ( greater-than p810 p673 )
    ( greater-than p193 p747 )
    ( greater-than p193 p889 )
    ( greater-than p193 p212 )
    ( greater-than p193 p79 )
    ( greater-than p193 p788 )
    ( greater-than p193 p93 )
    ( greater-than p193 p673 )
    ( greater-than p193 p810 )
    ( greater-than p324 p747 )
    ( greater-than p324 p889 )
    ( greater-than p324 p212 )
    ( greater-than p324 p79 )
    ( greater-than p324 p788 )
    ( greater-than p324 p93 )
    ( greater-than p324 p673 )
    ( greater-than p324 p810 )
    ( greater-than p324 p193 )
  )
  ( :tasks
    ( Deliver-10Pkg p747 p889 p212 p79 p788 p93 p673 p810 p193 p324 l291 )
  )
)
