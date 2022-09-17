( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l257 - location
    l783 - location
    l203 - location
    l944 - location
    p68 - obj
    p585 - obj
    t1170 - truck
  )
  ( :init
    ( in-city l257 c000 )
    ( in-city l783 c000 )
    ( in-city l203 c000 )
    ( in-city l944 c000 )
    ( obj-at p68 l944 )
    ( obj-at p585 l203 )
    ( truck-at t1170 l783 )
    ( greater-than p585 p68 )
  )
  ( :tasks
    ( Deliver-2Pkg p68 p585 l257 )
  )
)
