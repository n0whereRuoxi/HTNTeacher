( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l983 - location
    l220 - location
    l503 - location
    l500 - location
    l919 - location
    l492 - location
    l785 - location
    p299 - obj
    p733 - obj
    p258 - obj
    p552 - obj
    p871 - obj
    t1325 - truck
    t1696 - truck
    t1944 - truck
    t1858 - truck
  )
  ( :init
    ( in-city l983 c000 )
    ( in-city l220 c000 )
    ( in-city l503 c000 )
    ( in-city l500 c000 )
    ( in-city l919 c000 )
    ( in-city l492 c000 )
    ( in-city l785 c000 )
    ( obj-at p299 l919 )
    ( obj-at p733 l492 )
    ( obj-at p258 l500 )
    ( in-truck p552 t1325 )
    ( obj-at p871 l492 )
    ( truck-at t1325 l220 )
    ( truck-at t1696 l492 )
    ( truck-at t1944 l919 )
    ( truck-at t1858 l503 )
    ( greater-than p733 p299 )
    ( greater-than p258 p299 )
    ( greater-than p258 p733 )
    ( greater-than p552 p299 )
    ( greater-than p552 p733 )
    ( greater-than p552 p258 )
    ( greater-than p871 p299 )
    ( greater-than p871 p733 )
    ( greater-than p871 p258 )
    ( greater-than p871 p552 )
  )
  ( :tasks
    ( Deliver-5Pkg p299 p733 p258 p552 p871 l983 )
  )
)
