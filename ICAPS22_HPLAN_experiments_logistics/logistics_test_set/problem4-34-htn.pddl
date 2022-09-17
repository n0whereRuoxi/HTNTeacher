( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l694 - location
    l544 - location
    l627 - location
    l378 - location
    l143 - location
    l255 - location
    p31 - obj
    p230 - obj
    p906 - obj
    p183 - obj
    t1276 - truck
    t1991 - truck
    t1409 - truck
  )
  ( :init
    ( in-city l694 c000 )
    ( in-city l544 c000 )
    ( in-city l627 c000 )
    ( in-city l378 c000 )
    ( in-city l143 c000 )
    ( in-city l255 c000 )
    ( obj-at p31 l143 )
    ( obj-at p230 l378 )
    ( obj-at p906 l544 )
    ( in-truck p183 t1276 )
    ( truck-at t1276 l544 )
    ( truck-at t1991 l544 )
    ( truck-at t1409 l627 )
    ( greater-than p230 p31 )
    ( greater-than p906 p31 )
    ( greater-than p906 p230 )
    ( greater-than p183 p31 )
    ( greater-than p183 p230 )
    ( greater-than p183 p906 )
  )
  ( :tasks
    ( Deliver-4Pkg p31 p230 p906 p183 l694 )
  )
)
