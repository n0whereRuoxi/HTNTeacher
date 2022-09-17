( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l975 - location
    l446 - location
    l492 - location
    l680 - location
    l162 - location
    l708 - location
    l966 - location
    l187 - location
    l117 - location
    l531 - location
    l164 - location
    l203 - location
    l661 - location
    l589 - location
    l812 - location
    l722 - location
    p22 - obj
    p287 - obj
    p753 - obj
    p733 - obj
    p412 - obj
    p835 - obj
    p48 - obj
    p373 - obj
    p523 - obj
    p513 - obj
    p392 - obj
    p278 - obj
    t1568 - truck
    t1944 - truck
    t1948 - truck
    t1002 - truck
    t1940 - truck
    t1814 - truck
    t1562 - truck
    t1993 - truck
    t1305 - truck
    t1495 - truck
    t1030 - truck
  )
  ( :init
    ( in-city l975 c000 )
    ( in-city l446 c000 )
    ( in-city l492 c000 )
    ( in-city l680 c000 )
    ( in-city l162 c000 )
    ( in-city l708 c000 )
    ( in-city l966 c000 )
    ( in-city l187 c000 )
    ( in-city l117 c000 )
    ( in-city l531 c000 )
    ( in-city l164 c000 )
    ( in-city l203 c000 )
    ( in-city l661 c000 )
    ( in-city l589 c000 )
    ( in-city l812 c000 )
    ( in-city l722 c000 )
    ( obj-at p22 l531 )
    ( in-truck p287 t1030 )
    ( obj-at p753 l708 )
    ( in-truck p733 t1305 )
    ( obj-at p412 l966 )
    ( obj-at p835 l164 )
    ( obj-at p48 l164 )
    ( obj-at p373 l203 )
    ( obj-at p523 l531 )
    ( obj-at p513 l187 )
    ( obj-at p392 l708 )
    ( in-truck p278 t1030 )
    ( truck-at t1568 l446 )
    ( truck-at t1944 l164 )
    ( truck-at t1948 l446 )
    ( truck-at t1002 l966 )
    ( truck-at t1940 l661 )
    ( truck-at t1814 l661 )
    ( truck-at t1562 l680 )
    ( truck-at t1993 l162 )
    ( truck-at t1305 l812 )
    ( truck-at t1495 l680 )
    ( truck-at t1030 l446 )
    ( greater-than p287 p22 )
    ( greater-than p753 p22 )
    ( greater-than p753 p287 )
    ( greater-than p733 p22 )
    ( greater-than p733 p287 )
    ( greater-than p733 p753 )
    ( greater-than p412 p22 )
    ( greater-than p412 p287 )
    ( greater-than p412 p753 )
    ( greater-than p412 p733 )
    ( greater-than p835 p22 )
    ( greater-than p835 p287 )
    ( greater-than p835 p753 )
    ( greater-than p835 p733 )
    ( greater-than p835 p412 )
    ( greater-than p48 p22 )
    ( greater-than p48 p287 )
    ( greater-than p48 p753 )
    ( greater-than p48 p733 )
    ( greater-than p48 p412 )
    ( greater-than p48 p835 )
    ( greater-than p373 p22 )
    ( greater-than p373 p287 )
    ( greater-than p373 p753 )
    ( greater-than p373 p733 )
    ( greater-than p373 p412 )
    ( greater-than p373 p835 )
    ( greater-than p373 p48 )
    ( greater-than p523 p22 )
    ( greater-than p523 p287 )
    ( greater-than p523 p753 )
    ( greater-than p523 p733 )
    ( greater-than p523 p412 )
    ( greater-than p523 p835 )
    ( greater-than p523 p48 )
    ( greater-than p523 p373 )
    ( greater-than p513 p22 )
    ( greater-than p513 p287 )
    ( greater-than p513 p753 )
    ( greater-than p513 p733 )
    ( greater-than p513 p412 )
    ( greater-than p513 p835 )
    ( greater-than p513 p48 )
    ( greater-than p513 p373 )
    ( greater-than p513 p523 )
    ( greater-than p392 p22 )
    ( greater-than p392 p287 )
    ( greater-than p392 p753 )
    ( greater-than p392 p733 )
    ( greater-than p392 p412 )
    ( greater-than p392 p835 )
    ( greater-than p392 p48 )
    ( greater-than p392 p373 )
    ( greater-than p392 p523 )
    ( greater-than p392 p513 )
    ( greater-than p278 p22 )
    ( greater-than p278 p287 )
    ( greater-than p278 p753 )
    ( greater-than p278 p733 )
    ( greater-than p278 p412 )
    ( greater-than p278 p835 )
    ( greater-than p278 p48 )
    ( greater-than p278 p373 )
    ( greater-than p278 p523 )
    ( greater-than p278 p513 )
    ( greater-than p278 p392 )
  )
  ( :goal
    ( and
      ( obj-at p22 l975 )
      ( obj-at p287 l975 )
      ( obj-at p753 l975 )
      ( obj-at p733 l975 )
      ( obj-at p412 l975 )
      ( obj-at p835 l975 )
      ( obj-at p48 l975 )
      ( obj-at p373 l975 )
      ( obj-at p523 l975 )
      ( obj-at p513 l975 )
      ( obj-at p392 l975 )
      ( obj-at p278 l975 )
    )
  )
)
