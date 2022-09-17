( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l583 - location
    l274 - location
    l16 - location
    l672 - location
    l588 - location
    l921 - location
    p571 - obj
    p108 - obj
    p75 - obj
    p834 - obj
    p802 - obj
    p696 - obj
    p505 - obj
    t1402 - truck
    t1616 - truck
    t1876 - truck
    t1890 - truck
    t1923 - truck
    t1474 - truck
  )
  ( :init
    ( in-city l583 c000 )
    ( in-city l274 c000 )
    ( in-city l16 c000 )
    ( in-city l672 c000 )
    ( in-city l588 c000 )
    ( in-city l921 c000 )
    ( obj-at p571 l274 )
    ( in-truck p108 t1923 )
    ( in-truck p75 t1876 )
    ( obj-at p834 l16 )
    ( obj-at p802 l16 )
    ( in-truck p696 t1923 )
    ( in-truck p505 t1616 )
    ( truck-at t1402 l672 )
    ( truck-at t1616 l274 )
    ( truck-at t1876 l921 )
    ( truck-at t1890 l588 )
    ( truck-at t1923 l588 )
    ( truck-at t1474 l274 )
    ( greater-than p108 p571 )
    ( greater-than p75 p571 )
    ( greater-than p75 p108 )
    ( greater-than p834 p571 )
    ( greater-than p834 p108 )
    ( greater-than p834 p75 )
    ( greater-than p802 p571 )
    ( greater-than p802 p108 )
    ( greater-than p802 p75 )
    ( greater-than p802 p834 )
    ( greater-than p696 p571 )
    ( greater-than p696 p108 )
    ( greater-than p696 p75 )
    ( greater-than p696 p834 )
    ( greater-than p696 p802 )
    ( greater-than p505 p571 )
    ( greater-than p505 p108 )
    ( greater-than p505 p75 )
    ( greater-than p505 p834 )
    ( greater-than p505 p802 )
    ( greater-than p505 p696 )
  )
  ( :goal
    ( and
      ( obj-at p571 l583 )
      ( obj-at p108 l583 )
      ( obj-at p75 l583 )
      ( obj-at p834 l583 )
      ( obj-at p802 l583 )
      ( obj-at p696 l583 )
      ( obj-at p505 l583 )
    )
  )
)
