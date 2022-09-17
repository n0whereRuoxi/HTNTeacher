( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l315 - location
    l756 - location
    l133 - location
    l424 - location
    l907 - location
    l829 - location
    l156 - location
    l895 - location
    l989 - location
    l182 - location
    l531 - location
    l100 - location
    l417 - location
    l106 - location
    l420 - location
    l964 - location
    p911 - obj
    p567 - obj
    p964 - obj
    p467 - obj
    p234 - obj
    p136 - obj
    p691 - obj
    p629 - obj
    p990 - obj
    t1993 - truck
    t1843 - truck
    t1521 - truck
    t1033 - truck
    t1784 - truck
    t1877 - truck
    t1599 - truck
    t1091 - truck
  )
  ( :init
    ( in-city l315 c000 )
    ( in-city l756 c000 )
    ( in-city l133 c000 )
    ( in-city l424 c000 )
    ( in-city l907 c000 )
    ( in-city l829 c000 )
    ( in-city l156 c000 )
    ( in-city l895 c000 )
    ( in-city l989 c000 )
    ( in-city l182 c000 )
    ( in-city l531 c000 )
    ( in-city l100 c000 )
    ( in-city l417 c000 )
    ( in-city l106 c000 )
    ( in-city l420 c000 )
    ( in-city l964 c000 )
    ( in-truck p911 t1599 )
    ( obj-at p567 l424 )
    ( obj-at p964 l895 )
    ( in-truck p467 t1521 )
    ( obj-at p234 l100 )
    ( obj-at p136 l895 )
    ( in-truck p691 t1843 )
    ( obj-at p629 l964 )
    ( obj-at p990 l182 )
    ( truck-at t1993 l829 )
    ( truck-at t1843 l420 )
    ( truck-at t1521 l156 )
    ( truck-at t1033 l182 )
    ( truck-at t1784 l182 )
    ( truck-at t1877 l100 )
    ( truck-at t1599 l964 )
    ( truck-at t1091 l756 )
    ( greater-than p567 p911 )
    ( greater-than p964 p911 )
    ( greater-than p964 p567 )
    ( greater-than p467 p911 )
    ( greater-than p467 p567 )
    ( greater-than p467 p964 )
    ( greater-than p234 p911 )
    ( greater-than p234 p567 )
    ( greater-than p234 p964 )
    ( greater-than p234 p467 )
    ( greater-than p136 p911 )
    ( greater-than p136 p567 )
    ( greater-than p136 p964 )
    ( greater-than p136 p467 )
    ( greater-than p136 p234 )
    ( greater-than p691 p911 )
    ( greater-than p691 p567 )
    ( greater-than p691 p964 )
    ( greater-than p691 p467 )
    ( greater-than p691 p234 )
    ( greater-than p691 p136 )
    ( greater-than p629 p911 )
    ( greater-than p629 p567 )
    ( greater-than p629 p964 )
    ( greater-than p629 p467 )
    ( greater-than p629 p234 )
    ( greater-than p629 p136 )
    ( greater-than p629 p691 )
    ( greater-than p990 p911 )
    ( greater-than p990 p567 )
    ( greater-than p990 p964 )
    ( greater-than p990 p467 )
    ( greater-than p990 p234 )
    ( greater-than p990 p136 )
    ( greater-than p990 p691 )
    ( greater-than p990 p629 )
  )
  ( :goal
    ( and
      ( obj-at p911 l315 )
      ( obj-at p567 l315 )
      ( obj-at p964 l315 )
      ( obj-at p467 l315 )
      ( obj-at p234 l315 )
      ( obj-at p136 l315 )
      ( obj-at p691 l315 )
      ( obj-at p629 l315 )
      ( obj-at p990 l315 )
    )
  )
)
