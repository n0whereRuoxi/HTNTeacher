( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l619 - location
    l494 - location
    l516 - location
    l926 - location
    p440 - obj
    p198 - obj
    t1111 - truck
  )
  ( :init
    ( in-city l619 c000 )
    ( in-city l494 c000 )
    ( in-city l516 c000 )
    ( in-city l926 c000 )
    ( obj-at p440 l926 )
    ( obj-at p198 l516 )
    ( truck-at t1111 l494 )
    ( greater-than p198 p440 )
  )
  ( :tasks
    ( Deliver-2Pkg p440 p198 l619 )
  )
)
