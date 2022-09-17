( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l836 - location
    l998 - location
    l206 - location
    l121 - location
    l263 - location
    l170 - location
    l70 - location
    l372 - location
    l400 - location
    l977 - location
    p889 - obj
    p369 - obj
    p826 - obj
    p720 - obj
    p51 - obj
    p99 - obj
    p367 - obj
    t1322 - truck
    t1075 - truck
    t1927 - truck
    t1526 - truck
    t1081 - truck
    t1972 - truck
  )
  ( :init
    ( in-city l836 c000 )
    ( in-city l998 c000 )
    ( in-city l206 c000 )
    ( in-city l121 c000 )
    ( in-city l263 c000 )
    ( in-city l170 c000 )
    ( in-city l70 c000 )
    ( in-city l372 c000 )
    ( in-city l400 c000 )
    ( in-city l977 c000 )
    ( in-truck p889 t1526 )
    ( in-truck p369 t1322 )
    ( obj-at p826 l170 )
    ( obj-at p720 l977 )
    ( obj-at p51 l998 )
    ( in-truck p99 t1322 )
    ( obj-at p367 l977 )
    ( truck-at t1322 l977 )
    ( truck-at t1075 l206 )
    ( truck-at t1927 l998 )
    ( truck-at t1526 l206 )
    ( truck-at t1081 l206 )
    ( truck-at t1972 l836 )
    ( greater-than p369 p889 )
    ( greater-than p826 p889 )
    ( greater-than p826 p369 )
    ( greater-than p720 p889 )
    ( greater-than p720 p369 )
    ( greater-than p720 p826 )
    ( greater-than p51 p889 )
    ( greater-than p51 p369 )
    ( greater-than p51 p826 )
    ( greater-than p51 p720 )
    ( greater-than p99 p889 )
    ( greater-than p99 p369 )
    ( greater-than p99 p826 )
    ( greater-than p99 p720 )
    ( greater-than p99 p51 )
    ( greater-than p367 p889 )
    ( greater-than p367 p369 )
    ( greater-than p367 p826 )
    ( greater-than p367 p720 )
    ( greater-than p367 p51 )
    ( greater-than p367 p99 )
  )
  ( :goal
    ( and
      ( obj-at p889 l836 )
      ( obj-at p369 l836 )
      ( obj-at p826 l836 )
      ( obj-at p720 l836 )
      ( obj-at p51 l836 )
      ( obj-at p99 l836 )
      ( obj-at p367 l836 )
    )
  )
)
