( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l825 - location
    l586 - location
    l841 - location
    l798 - location
    p928 - obj
    p303 - obj
    p446 - obj
    p579 - obj
    p497 - obj
    p133 - obj
    t1429 - truck
    t1132 - truck
    t1906 - truck
    t1451 - truck
    t1592 - truck
  )
  ( :init
    ( in-city l825 c000 )
    ( in-city l586 c000 )
    ( in-city l841 c000 )
    ( in-city l798 c000 )
    ( in-truck p928 t1906 )
    ( obj-at p303 l841 )
    ( in-truck p446 t1429 )
    ( in-truck p579 t1592 )
    ( in-truck p497 t1429 )
    ( in-truck p133 t1132 )
    ( truck-at t1429 l841 )
    ( truck-at t1132 l586 )
    ( truck-at t1906 l586 )
    ( truck-at t1451 l841 )
    ( truck-at t1592 l825 )
    ( greater-than p303 p928 )
    ( greater-than p446 p928 )
    ( greater-than p446 p303 )
    ( greater-than p579 p928 )
    ( greater-than p579 p303 )
    ( greater-than p579 p446 )
    ( greater-than p497 p928 )
    ( greater-than p497 p303 )
    ( greater-than p497 p446 )
    ( greater-than p497 p579 )
    ( greater-than p133 p928 )
    ( greater-than p133 p303 )
    ( greater-than p133 p446 )
    ( greater-than p133 p579 )
    ( greater-than p133 p497 )
  )
  ( :goal
    ( and
      ( obj-at p928 l825 )
      ( obj-at p303 l825 )
      ( obj-at p446 l825 )
      ( obj-at p579 l825 )
      ( obj-at p497 l825 )
      ( obj-at p133 l825 )
    )
  )
)
