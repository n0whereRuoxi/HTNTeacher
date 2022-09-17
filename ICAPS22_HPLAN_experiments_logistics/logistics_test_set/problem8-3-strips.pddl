( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l323 - location
    l89 - location
    l476 - location
    l63 - location
    l997 - location
    l270 - location
    l386 - location
    p563 - obj
    p748 - obj
    p908 - obj
    p953 - obj
    p739 - obj
    p629 - obj
    p941 - obj
    p420 - obj
    t1177 - truck
    t1618 - truck
    t1043 - truck
    t1002 - truck
    t1672 - truck
    t1066 - truck
    t1463 - truck
  )
  ( :init
    ( in-city l323 c000 )
    ( in-city l89 c000 )
    ( in-city l476 c000 )
    ( in-city l63 c000 )
    ( in-city l997 c000 )
    ( in-city l270 c000 )
    ( in-city l386 c000 )
    ( obj-at p563 l63 )
    ( in-truck p748 t1177 )
    ( obj-at p908 l270 )
    ( in-truck p953 t1043 )
    ( in-truck p739 t1002 )
    ( obj-at p629 l270 )
    ( obj-at p941 l63 )
    ( in-truck p420 t1672 )
    ( truck-at t1177 l63 )
    ( truck-at t1618 l386 )
    ( truck-at t1043 l386 )
    ( truck-at t1002 l997 )
    ( truck-at t1672 l997 )
    ( truck-at t1066 l270 )
    ( truck-at t1463 l386 )
    ( greater-than p748 p563 )
    ( greater-than p908 p563 )
    ( greater-than p908 p748 )
    ( greater-than p953 p563 )
    ( greater-than p953 p748 )
    ( greater-than p953 p908 )
    ( greater-than p739 p563 )
    ( greater-than p739 p748 )
    ( greater-than p739 p908 )
    ( greater-than p739 p953 )
    ( greater-than p629 p563 )
    ( greater-than p629 p748 )
    ( greater-than p629 p908 )
    ( greater-than p629 p953 )
    ( greater-than p629 p739 )
    ( greater-than p941 p563 )
    ( greater-than p941 p748 )
    ( greater-than p941 p908 )
    ( greater-than p941 p953 )
    ( greater-than p941 p739 )
    ( greater-than p941 p629 )
    ( greater-than p420 p563 )
    ( greater-than p420 p748 )
    ( greater-than p420 p908 )
    ( greater-than p420 p953 )
    ( greater-than p420 p739 )
    ( greater-than p420 p629 )
    ( greater-than p420 p941 )
  )
  ( :goal
    ( and
      ( obj-at p563 l323 )
      ( obj-at p748 l323 )
      ( obj-at p908 l323 )
      ( obj-at p953 l323 )
      ( obj-at p739 l323 )
      ( obj-at p629 l323 )
      ( obj-at p941 l323 )
      ( obj-at p420 l323 )
    )
  )
)
