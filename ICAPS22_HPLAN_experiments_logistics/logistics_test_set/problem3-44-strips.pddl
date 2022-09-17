( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l224 - location
    l326 - location
    p552 - obj
    p898 - obj
    p547 - obj
    t1964 - truck
    t1703 - truck
  )
  ( :init
    ( in-city l224 c000 )
    ( in-city l326 c000 )
    ( in-truck p552 t1964 )
    ( in-truck p898 t1703 )
    ( in-truck p547 t1703 )
    ( truck-at t1964 l326 )
    ( truck-at t1703 l326 )
    ( greater-than p898 p552 )
    ( greater-than p547 p552 )
    ( greater-than p547 p898 )
  )
  ( :goal
    ( and
      ( obj-at p552 l224 )
      ( obj-at p898 l224 )
      ( obj-at p547 l224 )
    )
  )
)
