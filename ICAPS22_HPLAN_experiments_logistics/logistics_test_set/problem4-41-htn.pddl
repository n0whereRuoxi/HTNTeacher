( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l355 - location
    l258 - location
    l207 - location
    l841 - location
    l286 - location
    l174 - location
    p791 - obj
    p555 - obj
    p941 - obj
    p822 - obj
    t1161 - truck
    t1779 - truck
    t1615 - truck
  )
  ( :init
    ( in-city l355 c000 )
    ( in-city l258 c000 )
    ( in-city l207 c000 )
    ( in-city l841 c000 )
    ( in-city l286 c000 )
    ( in-city l174 c000 )
    ( obj-at p791 l174 )
    ( in-truck p555 t1161 )
    ( in-truck p941 t1161 )
    ( in-truck p822 t1161 )
    ( truck-at t1161 l841 )
    ( truck-at t1779 l207 )
    ( truck-at t1615 l258 )
    ( greater-than p555 p791 )
    ( greater-than p941 p791 )
    ( greater-than p941 p555 )
    ( greater-than p822 p791 )
    ( greater-than p822 p555 )
    ( greater-than p822 p941 )
  )
  ( :tasks
    ( Deliver-4Pkg p791 p555 p941 p822 l355 )
  )
)
