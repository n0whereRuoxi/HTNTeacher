( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l455 - location
    l342 - location
    l897 - location
    l788 - location
    l349 - location
    l684 - location
    p626 - obj
    p908 - obj
    p618 - obj
    t1548 - truck
    t1943 - truck
  )
  ( :init
    ( in-city l455 c000 )
    ( in-city l342 c000 )
    ( in-city l897 c000 )
    ( in-city l788 c000 )
    ( in-city l349 c000 )
    ( in-city l684 c000 )
    ( in-truck p626 t1943 )
    ( obj-at p908 l684 )
    ( obj-at p618 l349 )
    ( truck-at t1548 l684 )
    ( truck-at t1943 l349 )
    ( greater-than p908 p626 )
    ( greater-than p618 p626 )
    ( greater-than p618 p908 )
  )
  ( :tasks
    ( Deliver-3Pkg p626 p908 p618 l455 )
  )
)
