( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l467 - location
    l425 - location
    l436 - location
    l270 - location
    l886 - location
    l575 - location
    p649 - obj
    p729 - obj
    p520 - obj
    p337 - obj
    p985 - obj
    p269 - obj
    p73 - obj
    p888 - obj
    t1291 - truck
    t1636 - truck
    t1370 - truck
    t1352 - truck
    t1501 - truck
    t1234 - truck
    t1924 - truck
  )
  ( :init
    ( in-city l467 c000 )
    ( in-city l425 c000 )
    ( in-city l436 c000 )
    ( in-city l270 c000 )
    ( in-city l886 c000 )
    ( in-city l575 c000 )
    ( obj-at p649 l270 )
    ( obj-at p729 l425 )
    ( in-truck p520 t1352 )
    ( obj-at p337 l425 )
    ( in-truck p985 t1352 )
    ( obj-at p269 l436 )
    ( obj-at p73 l425 )
    ( in-truck p888 t1352 )
    ( truck-at t1291 l886 )
    ( truck-at t1636 l270 )
    ( truck-at t1370 l575 )
    ( truck-at t1352 l575 )
    ( truck-at t1501 l436 )
    ( truck-at t1234 l467 )
    ( truck-at t1924 l436 )
    ( greater-than p729 p649 )
    ( greater-than p520 p649 )
    ( greater-than p520 p729 )
    ( greater-than p337 p649 )
    ( greater-than p337 p729 )
    ( greater-than p337 p520 )
    ( greater-than p985 p649 )
    ( greater-than p985 p729 )
    ( greater-than p985 p520 )
    ( greater-than p985 p337 )
    ( greater-than p269 p649 )
    ( greater-than p269 p729 )
    ( greater-than p269 p520 )
    ( greater-than p269 p337 )
    ( greater-than p269 p985 )
    ( greater-than p73 p649 )
    ( greater-than p73 p729 )
    ( greater-than p73 p520 )
    ( greater-than p73 p337 )
    ( greater-than p73 p985 )
    ( greater-than p73 p269 )
    ( greater-than p888 p649 )
    ( greater-than p888 p729 )
    ( greater-than p888 p520 )
    ( greater-than p888 p337 )
    ( greater-than p888 p985 )
    ( greater-than p888 p269 )
    ( greater-than p888 p73 )
  )
  ( :goal
    ( and
      ( obj-at p649 l467 )
      ( obj-at p729 l467 )
      ( obj-at p520 l467 )
      ( obj-at p337 l467 )
      ( obj-at p985 l467 )
      ( obj-at p269 l467 )
      ( obj-at p73 l467 )
      ( obj-at p888 l467 )
    )
  )
)
