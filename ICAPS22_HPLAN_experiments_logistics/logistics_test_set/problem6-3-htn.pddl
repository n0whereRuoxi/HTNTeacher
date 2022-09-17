( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l176 - location
    l361 - location
    l828 - location
    l50 - location
    l511 - location
    l764 - location
    l920 - location
    l173 - location
    l913 - location
    l183 - location
    l604 - location
    l26 - location
    p752 - obj
    p211 - obj
    p405 - obj
    p914 - obj
    p76 - obj
    p668 - obj
    t1933 - truck
    t1436 - truck
    t1770 - truck
    t1006 - truck
    t1171 - truck
  )
  ( :init
    ( in-city l176 c000 )
    ( in-city l361 c000 )
    ( in-city l828 c000 )
    ( in-city l50 c000 )
    ( in-city l511 c000 )
    ( in-city l764 c000 )
    ( in-city l920 c000 )
    ( in-city l173 c000 )
    ( in-city l913 c000 )
    ( in-city l183 c000 )
    ( in-city l604 c000 )
    ( in-city l26 c000 )
    ( obj-at p752 l913 )
    ( obj-at p211 l26 )
    ( obj-at p405 l361 )
    ( obj-at p914 l361 )
    ( obj-at p76 l173 )
    ( in-truck p668 t1006 )
    ( truck-at t1933 l764 )
    ( truck-at t1436 l511 )
    ( truck-at t1770 l176 )
    ( truck-at t1006 l176 )
    ( truck-at t1171 l173 )
    ( greater-than p211 p752 )
    ( greater-than p405 p752 )
    ( greater-than p405 p211 )
    ( greater-than p914 p752 )
    ( greater-than p914 p211 )
    ( greater-than p914 p405 )
    ( greater-than p76 p752 )
    ( greater-than p76 p211 )
    ( greater-than p76 p405 )
    ( greater-than p76 p914 )
    ( greater-than p668 p752 )
    ( greater-than p668 p211 )
    ( greater-than p668 p405 )
    ( greater-than p668 p914 )
    ( greater-than p668 p76 )
  )
  ( :tasks
    ( Deliver-6Pkg p752 p211 p405 p914 p76 p668 l176 )
  )
)
