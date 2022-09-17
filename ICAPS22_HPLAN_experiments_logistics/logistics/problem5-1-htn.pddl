( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-320 - location
    l000-822 - location
    l000-817 - location
    l000-500 - location
    l000-266 - location
    l000-579 - location
    p514 - obj
    p758 - obj
    p664 - obj
    p77 - obj
    p444 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-320 c000 )
    ( in-city l000-822 c000 )
    ( in-city l000-817 c000 )
    ( in-city l000-500 c000 )
    ( in-city l000-266 c000 )
    ( in-city l000-579 c000 )
    ( obj-at p514 l000-817 )
    ( obj-at p758 l000-822 )
    ( obj-at p664 l000-320 )
    ( obj-at p77 l000-579 )
    ( obj-at p444 l000-320 )
    ( greater-than p758 p514 )
    ( greater-than p664 p514 )
    ( greater-than p664 p758 )
    ( greater-than p77 p514 )
    ( greater-than p77 p758 )
    ( greater-than p77 p664 )
    ( greater-than p444 p514 )
    ( greater-than p444 p758 )
    ( greater-than p444 p664 )
    ( greater-than p444 p77 )
  )
  ( :tasks
    ( Deliver-5Pkg p514 p758 p664 p77 p444 l000-000 )
  )
)
