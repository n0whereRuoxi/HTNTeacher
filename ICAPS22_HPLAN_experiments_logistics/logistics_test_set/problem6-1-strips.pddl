( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l754 - location
    l101 - location
    l573 - location
    l138 - location
    l733 - location
    l131 - location
    l18 - location
    l488 - location
    l771 - location
    l445 - location
    l870 - location
    l791 - location
    p819 - obj
    p292 - obj
    p43 - obj
    p993 - obj
    p904 - obj
    p419 - obj
    t1443 - truck
    t1931 - truck
    t1886 - truck
    t1122 - truck
    t1061 - truck
  )
  ( :init
    ( in-city l754 c000 )
    ( in-city l101 c000 )
    ( in-city l573 c000 )
    ( in-city l138 c000 )
    ( in-city l733 c000 )
    ( in-city l131 c000 )
    ( in-city l18 c000 )
    ( in-city l488 c000 )
    ( in-city l771 c000 )
    ( in-city l445 c000 )
    ( in-city l870 c000 )
    ( in-city l791 c000 )
    ( obj-at p819 l573 )
    ( in-truck p292 t1931 )
    ( in-truck p43 t1061 )
    ( obj-at p993 l138 )
    ( in-truck p904 t1931 )
    ( obj-at p419 l771 )
    ( truck-at t1443 l445 )
    ( truck-at t1931 l131 )
    ( truck-at t1886 l101 )
    ( truck-at t1122 l131 )
    ( truck-at t1061 l18 )
    ( greater-than p292 p819 )
    ( greater-than p43 p819 )
    ( greater-than p43 p292 )
    ( greater-than p993 p819 )
    ( greater-than p993 p292 )
    ( greater-than p993 p43 )
    ( greater-than p904 p819 )
    ( greater-than p904 p292 )
    ( greater-than p904 p43 )
    ( greater-than p904 p993 )
    ( greater-than p419 p819 )
    ( greater-than p419 p292 )
    ( greater-than p419 p43 )
    ( greater-than p419 p993 )
    ( greater-than p419 p904 )
  )
  ( :goal
    ( and
      ( obj-at p819 l754 )
      ( obj-at p292 l754 )
      ( obj-at p43 l754 )
      ( obj-at p993 l754 )
      ( obj-at p904 l754 )
      ( obj-at p419 l754 )
    )
  )
)
