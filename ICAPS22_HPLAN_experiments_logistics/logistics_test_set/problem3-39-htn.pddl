( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l851 - location
    l884 - location
    l486 - location
    l267 - location
    l670 - location
    p707 - obj
    p822 - obj
    p443 - obj
    t1019 - truck
    t1746 - truck
  )
  ( :init
    ( in-city l851 c000 )
    ( in-city l884 c000 )
    ( in-city l486 c000 )
    ( in-city l267 c000 )
    ( in-city l670 c000 )
    ( obj-at p707 l267 )
    ( obj-at p822 l486 )
    ( obj-at p443 l267 )
    ( truck-at t1019 l670 )
    ( truck-at t1746 l486 )
    ( greater-than p822 p707 )
    ( greater-than p443 p707 )
    ( greater-than p443 p822 )
  )
  ( :tasks
    ( Deliver-3Pkg p707 p822 p443 l851 )
  )
)
