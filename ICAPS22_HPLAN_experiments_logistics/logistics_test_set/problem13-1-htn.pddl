( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l541 - location
    l647 - location
    l161 - location
    l63 - location
    l176 - location
    l261 - location
    l483 - location
    l843 - location
    l149 - location
    l570 - location
    l644 - location
    l865 - location
    l520 - location
    l801 - location
    p415 - obj
    p368 - obj
    p83 - obj
    p392 - obj
    p766 - obj
    p815 - obj
    p153 - obj
    p400 - obj
    p666 - obj
    p779 - obj
    p802 - obj
    p4 - obj
    p485 - obj
    t1341 - truck
    t1749 - truck
    t1036 - truck
    t1088 - truck
    t1249 - truck
    t1152 - truck
    t1390 - truck
    t1500 - truck
    t1783 - truck
    t1350 - truck
    t1982 - truck
    t1442 - truck
  )
  ( :init
    ( in-city l541 c000 )
    ( in-city l647 c000 )
    ( in-city l161 c000 )
    ( in-city l63 c000 )
    ( in-city l176 c000 )
    ( in-city l261 c000 )
    ( in-city l483 c000 )
    ( in-city l843 c000 )
    ( in-city l149 c000 )
    ( in-city l570 c000 )
    ( in-city l644 c000 )
    ( in-city l865 c000 )
    ( in-city l520 c000 )
    ( in-city l801 c000 )
    ( obj-at p415 l647 )
    ( in-truck p368 t1249 )
    ( obj-at p83 l801 )
    ( obj-at p392 l520 )
    ( obj-at p766 l843 )
    ( obj-at p815 l644 )
    ( in-truck p153 t1350 )
    ( in-truck p400 t1749 )
    ( in-truck p666 t1390 )
    ( obj-at p779 l161 )
    ( obj-at p802 l161 )
    ( in-truck p4 t1350 )
    ( in-truck p485 t1088 )
    ( truck-at t1341 l541 )
    ( truck-at t1749 l161 )
    ( truck-at t1036 l161 )
    ( truck-at t1088 l261 )
    ( truck-at t1249 l644 )
    ( truck-at t1152 l570 )
    ( truck-at t1390 l63 )
    ( truck-at t1500 l161 )
    ( truck-at t1783 l63 )
    ( truck-at t1350 l261 )
    ( truck-at t1982 l261 )
    ( truck-at t1442 l647 )
    ( greater-than p368 p415 )
    ( greater-than p83 p415 )
    ( greater-than p83 p368 )
    ( greater-than p392 p415 )
    ( greater-than p392 p368 )
    ( greater-than p392 p83 )
    ( greater-than p766 p415 )
    ( greater-than p766 p368 )
    ( greater-than p766 p83 )
    ( greater-than p766 p392 )
    ( greater-than p815 p415 )
    ( greater-than p815 p368 )
    ( greater-than p815 p83 )
    ( greater-than p815 p392 )
    ( greater-than p815 p766 )
    ( greater-than p153 p415 )
    ( greater-than p153 p368 )
    ( greater-than p153 p83 )
    ( greater-than p153 p392 )
    ( greater-than p153 p766 )
    ( greater-than p153 p815 )
    ( greater-than p400 p415 )
    ( greater-than p400 p368 )
    ( greater-than p400 p83 )
    ( greater-than p400 p392 )
    ( greater-than p400 p766 )
    ( greater-than p400 p815 )
    ( greater-than p400 p153 )
    ( greater-than p666 p415 )
    ( greater-than p666 p368 )
    ( greater-than p666 p83 )
    ( greater-than p666 p392 )
    ( greater-than p666 p766 )
    ( greater-than p666 p815 )
    ( greater-than p666 p153 )
    ( greater-than p666 p400 )
    ( greater-than p779 p415 )
    ( greater-than p779 p368 )
    ( greater-than p779 p83 )
    ( greater-than p779 p392 )
    ( greater-than p779 p766 )
    ( greater-than p779 p815 )
    ( greater-than p779 p153 )
    ( greater-than p779 p400 )
    ( greater-than p779 p666 )
    ( greater-than p802 p415 )
    ( greater-than p802 p368 )
    ( greater-than p802 p83 )
    ( greater-than p802 p392 )
    ( greater-than p802 p766 )
    ( greater-than p802 p815 )
    ( greater-than p802 p153 )
    ( greater-than p802 p400 )
    ( greater-than p802 p666 )
    ( greater-than p802 p779 )
    ( greater-than p4 p415 )
    ( greater-than p4 p368 )
    ( greater-than p4 p83 )
    ( greater-than p4 p392 )
    ( greater-than p4 p766 )
    ( greater-than p4 p815 )
    ( greater-than p4 p153 )
    ( greater-than p4 p400 )
    ( greater-than p4 p666 )
    ( greater-than p4 p779 )
    ( greater-than p4 p802 )
    ( greater-than p485 p415 )
    ( greater-than p485 p368 )
    ( greater-than p485 p83 )
    ( greater-than p485 p392 )
    ( greater-than p485 p766 )
    ( greater-than p485 p815 )
    ( greater-than p485 p153 )
    ( greater-than p485 p400 )
    ( greater-than p485 p666 )
    ( greater-than p485 p779 )
    ( greater-than p485 p802 )
    ( greater-than p485 p4 )
  )
  ( :tasks
    ( Deliver-13Pkg p415 p368 p83 p392 p766 p815 p153 p400 p666 p779 p802 p4 p485 l541 )
  )
)
