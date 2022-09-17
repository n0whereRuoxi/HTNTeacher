( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l831 - location
    l806 - location
    l461 - location
    l676 - location
    l158 - location
    l227 - location
    l787 - location
    l883 - location
    p860 - obj
    p818 - obj
    p271 - obj
    p734 - obj
    p452 - obj
    t1779 - truck
    t1273 - truck
    t1256 - truck
    t1963 - truck
  )
  ( :init
    ( in-city l831 c000 )
    ( in-city l806 c000 )
    ( in-city l461 c000 )
    ( in-city l676 c000 )
    ( in-city l158 c000 )
    ( in-city l227 c000 )
    ( in-city l787 c000 )
    ( in-city l883 c000 )
    ( obj-at p860 l227 )
    ( obj-at p818 l676 )
    ( obj-at p271 l676 )
    ( obj-at p734 l158 )
    ( obj-at p452 l158 )
    ( truck-at t1779 l158 )
    ( truck-at t1273 l461 )
    ( truck-at t1256 l883 )
    ( truck-at t1963 l831 )
    ( greater-than p818 p860 )
    ( greater-than p271 p860 )
    ( greater-than p271 p818 )
    ( greater-than p734 p860 )
    ( greater-than p734 p818 )
    ( greater-than p734 p271 )
    ( greater-than p452 p860 )
    ( greater-than p452 p818 )
    ( greater-than p452 p271 )
    ( greater-than p452 p734 )
  )
  ( :goal
    ( and
      ( obj-at p860 l831 )
      ( obj-at p818 l831 )
      ( obj-at p271 l831 )
      ( obj-at p734 l831 )
      ( obj-at p452 l831 )
    )
  )
)
