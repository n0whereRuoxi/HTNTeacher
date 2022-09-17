( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l329 - location
    l137 - location
    l337 - location
    p858 - obj
    p877 - obj
    p379 - obj
    t1306 - truck
    t1783 - truck
  )
  ( :init
    ( in-city l329 c000 )
    ( in-city l137 c000 )
    ( in-city l337 c000 )
    ( obj-at p858 l137 )
    ( obj-at p877 l337 )
    ( obj-at p379 l337 )
    ( truck-at t1306 l137 )
    ( truck-at t1783 l337 )
    ( greater-than p877 p858 )
    ( greater-than p379 p858 )
    ( greater-than p379 p877 )
  )
  ( :tasks
    ( Deliver-3Pkg p858 p877 p379 l329 )
  )
)
