( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l449 - location
    l68 - location
    l303 - location
    p183 - obj
    p331 - obj
    p922 - obj
    p744 - obj
    t1356 - truck
    t1806 - truck
    t1861 - truck
  )
  ( :init
    ( in-city l449 c000 )
    ( in-city l68 c000 )
    ( in-city l303 c000 )
    ( in-truck p183 t1806 )
    ( in-truck p331 t1861 )
    ( in-truck p922 t1806 )
    ( in-truck p744 t1356 )
    ( truck-at t1356 l303 )
    ( truck-at t1806 l449 )
    ( truck-at t1861 l449 )
    ( greater-than p331 p183 )
    ( greater-than p922 p183 )
    ( greater-than p922 p331 )
    ( greater-than p744 p183 )
    ( greater-than p744 p331 )
    ( greater-than p744 p922 )
  )
  ( :tasks
    ( Deliver-4Pkg p183 p331 p922 p744 l449 )
  )
)
