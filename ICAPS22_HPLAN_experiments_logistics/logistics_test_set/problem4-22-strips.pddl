( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l729 - location
    l945 - location
    l538 - location
    l726 - location
    l832 - location
    l901 - location
    p704 - obj
    p979 - obj
    p296 - obj
    p835 - obj
    t1144 - truck
    t1110 - truck
    t1322 - truck
  )
  ( :init
    ( in-city l729 c000 )
    ( in-city l945 c000 )
    ( in-city l538 c000 )
    ( in-city l726 c000 )
    ( in-city l832 c000 )
    ( in-city l901 c000 )
    ( obj-at p704 l832 )
    ( obj-at p979 l901 )
    ( in-truck p296 t1144 )
    ( obj-at p835 l945 )
    ( truck-at t1144 l726 )
    ( truck-at t1110 l945 )
    ( truck-at t1322 l729 )
    ( greater-than p979 p704 )
    ( greater-than p296 p704 )
    ( greater-than p296 p979 )
    ( greater-than p835 p704 )
    ( greater-than p835 p979 )
    ( greater-than p835 p296 )
  )
  ( :goal
    ( and
      ( obj-at p704 l729 )
      ( obj-at p979 l729 )
      ( obj-at p296 l729 )
      ( obj-at p835 l729 )
    )
  )
)
