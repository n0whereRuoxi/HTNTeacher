( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l267 - location
    l948 - location
    l22 - location
    l770 - location
    l78 - location
    l35 - location
    l811 - location
    l43 - location
    l389 - location
    l538 - location
    l747 - location
    l751 - location
    l492 - location
    l998 - location
    l955 - location
    l674 - location
    l943 - location
    p558 - obj
    p724 - obj
    p644 - obj
    p800 - obj
    p876 - obj
    p809 - obj
    p490 - obj
    p134 - obj
    p690 - obj
    p479 - obj
    p757 - obj
    p928 - obj
    p35 - obj
    t1782 - truck
    t1101 - truck
    t1239 - truck
    t1976 - truck
    t1117 - truck
    t1195 - truck
    t1926 - truck
    t1179 - truck
    t1781 - truck
    t1185 - truck
    t1055 - truck
    t1278 - truck
  )
  ( :init
    ( in-city l267 c000 )
    ( in-city l948 c000 )
    ( in-city l22 c000 )
    ( in-city l770 c000 )
    ( in-city l78 c000 )
    ( in-city l35 c000 )
    ( in-city l811 c000 )
    ( in-city l43 c000 )
    ( in-city l389 c000 )
    ( in-city l538 c000 )
    ( in-city l747 c000 )
    ( in-city l751 c000 )
    ( in-city l492 c000 )
    ( in-city l998 c000 )
    ( in-city l955 c000 )
    ( in-city l674 c000 )
    ( in-city l943 c000 )
    ( in-truck p558 t1055 )
    ( obj-at p724 l955 )
    ( obj-at p644 l948 )
    ( in-truck p800 t1117 )
    ( in-truck p876 t1179 )
    ( in-truck p809 t1117 )
    ( obj-at p490 l948 )
    ( in-truck p134 t1278 )
    ( obj-at p690 l998 )
    ( obj-at p479 l538 )
    ( obj-at p757 l943 )
    ( in-truck p928 t1101 )
    ( obj-at p35 l998 )
    ( truck-at t1782 l22 )
    ( truck-at t1101 l267 )
    ( truck-at t1239 l22 )
    ( truck-at t1976 l35 )
    ( truck-at t1117 l538 )
    ( truck-at t1195 l78 )
    ( truck-at t1926 l267 )
    ( truck-at t1179 l811 )
    ( truck-at t1781 l770 )
    ( truck-at t1185 l538 )
    ( truck-at t1055 l955 )
    ( truck-at t1278 l492 )
    ( greater-than p724 p558 )
    ( greater-than p644 p558 )
    ( greater-than p644 p724 )
    ( greater-than p800 p558 )
    ( greater-than p800 p724 )
    ( greater-than p800 p644 )
    ( greater-than p876 p558 )
    ( greater-than p876 p724 )
    ( greater-than p876 p644 )
    ( greater-than p876 p800 )
    ( greater-than p809 p558 )
    ( greater-than p809 p724 )
    ( greater-than p809 p644 )
    ( greater-than p809 p800 )
    ( greater-than p809 p876 )
    ( greater-than p490 p558 )
    ( greater-than p490 p724 )
    ( greater-than p490 p644 )
    ( greater-than p490 p800 )
    ( greater-than p490 p876 )
    ( greater-than p490 p809 )
    ( greater-than p134 p558 )
    ( greater-than p134 p724 )
    ( greater-than p134 p644 )
    ( greater-than p134 p800 )
    ( greater-than p134 p876 )
    ( greater-than p134 p809 )
    ( greater-than p134 p490 )
    ( greater-than p690 p558 )
    ( greater-than p690 p724 )
    ( greater-than p690 p644 )
    ( greater-than p690 p800 )
    ( greater-than p690 p876 )
    ( greater-than p690 p809 )
    ( greater-than p690 p490 )
    ( greater-than p690 p134 )
    ( greater-than p479 p558 )
    ( greater-than p479 p724 )
    ( greater-than p479 p644 )
    ( greater-than p479 p800 )
    ( greater-than p479 p876 )
    ( greater-than p479 p809 )
    ( greater-than p479 p490 )
    ( greater-than p479 p134 )
    ( greater-than p479 p690 )
    ( greater-than p757 p558 )
    ( greater-than p757 p724 )
    ( greater-than p757 p644 )
    ( greater-than p757 p800 )
    ( greater-than p757 p876 )
    ( greater-than p757 p809 )
    ( greater-than p757 p490 )
    ( greater-than p757 p134 )
    ( greater-than p757 p690 )
    ( greater-than p757 p479 )
    ( greater-than p928 p558 )
    ( greater-than p928 p724 )
    ( greater-than p928 p644 )
    ( greater-than p928 p800 )
    ( greater-than p928 p876 )
    ( greater-than p928 p809 )
    ( greater-than p928 p490 )
    ( greater-than p928 p134 )
    ( greater-than p928 p690 )
    ( greater-than p928 p479 )
    ( greater-than p928 p757 )
    ( greater-than p35 p558 )
    ( greater-than p35 p724 )
    ( greater-than p35 p644 )
    ( greater-than p35 p800 )
    ( greater-than p35 p876 )
    ( greater-than p35 p809 )
    ( greater-than p35 p490 )
    ( greater-than p35 p134 )
    ( greater-than p35 p690 )
    ( greater-than p35 p479 )
    ( greater-than p35 p757 )
    ( greater-than p35 p928 )
  )
  ( :goal
    ( and
      ( obj-at p558 l267 )
      ( obj-at p724 l267 )
      ( obj-at p644 l267 )
      ( obj-at p800 l267 )
      ( obj-at p876 l267 )
      ( obj-at p809 l267 )
      ( obj-at p490 l267 )
      ( obj-at p134 l267 )
      ( obj-at p690 l267 )
      ( obj-at p479 l267 )
      ( obj-at p757 l267 )
      ( obj-at p928 l267 )
      ( obj-at p35 l267 )
    )
  )
)
