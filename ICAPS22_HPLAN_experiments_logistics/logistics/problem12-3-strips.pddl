( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-114 - location
    l000-464 - location
    l000-502 - location
    l000-330 - location
    l000-802 - location
    l000-982 - location
    l000-690 - location
    l000-313 - location
    l000-105 - location
    l000-964 - location
    l000-75 - location
    l000-463 - location
    l000-142 - location
    l000-815 - location
    l000-663 - location
    l000-403 - location
    l000-581 - location
    l000-768 - location
    l000-476 - location
    l000-792 - location
    l000-804 - location
    l000-266 - location
    p71 - obj
    p447 - obj
    p288 - obj
    p128 - obj
    p988 - obj
    p682 - obj
    p182 - obj
    p679 - obj
    p527 - obj
    p999 - obj
    p994 - obj
    p656 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-114 c000 )
    ( in-city l000-464 c000 )
    ( in-city l000-502 c000 )
    ( in-city l000-330 c000 )
    ( in-city l000-802 c000 )
    ( in-city l000-982 c000 )
    ( in-city l000-690 c000 )
    ( in-city l000-313 c000 )
    ( in-city l000-105 c000 )
    ( in-city l000-964 c000 )
    ( in-city l000-75 c000 )
    ( in-city l000-463 c000 )
    ( in-city l000-142 c000 )
    ( in-city l000-815 c000 )
    ( in-city l000-663 c000 )
    ( in-city l000-403 c000 )
    ( in-city l000-581 c000 )
    ( in-city l000-768 c000 )
    ( in-city l000-476 c000 )
    ( in-city l000-792 c000 )
    ( in-city l000-804 c000 )
    ( in-city l000-266 c000 )
    ( obj-at p71 l000-804 )
    ( obj-at p447 l000-581 )
    ( obj-at p288 l000-804 )
    ( obj-at p128 l000-403 )
    ( obj-at p988 l000-804 )
    ( obj-at p682 l000-403 )
    ( obj-at p182 l000-114 )
    ( obj-at p679 l000-815 )
    ( obj-at p527 l000-463 )
    ( obj-at p999 l000-114 )
    ( obj-at p994 l000-75 )
    ( obj-at p656 l000-502 )
    ( greater-than p447 p71 )
    ( greater-than p288 p71 )
    ( greater-than p288 p447 )
    ( greater-than p128 p71 )
    ( greater-than p128 p447 )
    ( greater-than p128 p288 )
    ( greater-than p988 p71 )
    ( greater-than p988 p447 )
    ( greater-than p988 p288 )
    ( greater-than p988 p128 )
    ( greater-than p682 p71 )
    ( greater-than p682 p447 )
    ( greater-than p682 p288 )
    ( greater-than p682 p128 )
    ( greater-than p682 p988 )
    ( greater-than p182 p71 )
    ( greater-than p182 p447 )
    ( greater-than p182 p288 )
    ( greater-than p182 p128 )
    ( greater-than p182 p988 )
    ( greater-than p182 p682 )
    ( greater-than p679 p71 )
    ( greater-than p679 p447 )
    ( greater-than p679 p288 )
    ( greater-than p679 p128 )
    ( greater-than p679 p988 )
    ( greater-than p679 p682 )
    ( greater-than p679 p182 )
    ( greater-than p527 p71 )
    ( greater-than p527 p447 )
    ( greater-than p527 p288 )
    ( greater-than p527 p128 )
    ( greater-than p527 p988 )
    ( greater-than p527 p682 )
    ( greater-than p527 p182 )
    ( greater-than p527 p679 )
    ( greater-than p999 p71 )
    ( greater-than p999 p447 )
    ( greater-than p999 p288 )
    ( greater-than p999 p128 )
    ( greater-than p999 p988 )
    ( greater-than p999 p682 )
    ( greater-than p999 p182 )
    ( greater-than p999 p679 )
    ( greater-than p999 p527 )
    ( greater-than p994 p71 )
    ( greater-than p994 p447 )
    ( greater-than p994 p288 )
    ( greater-than p994 p128 )
    ( greater-than p994 p988 )
    ( greater-than p994 p682 )
    ( greater-than p994 p182 )
    ( greater-than p994 p679 )
    ( greater-than p994 p527 )
    ( greater-than p994 p999 )
    ( greater-than p656 p71 )
    ( greater-than p656 p447 )
    ( greater-than p656 p288 )
    ( greater-than p656 p128 )
    ( greater-than p656 p988 )
    ( greater-than p656 p682 )
    ( greater-than p656 p182 )
    ( greater-than p656 p679 )
    ( greater-than p656 p527 )
    ( greater-than p656 p999 )
    ( greater-than p656 p994 )
  )
  ( :goal
    ( and
      ( obj-at p71 l000-000 )
      ( obj-at p447 l000-000 )
      ( obj-at p288 l000-000 )
      ( obj-at p128 l000-000 )
      ( obj-at p988 l000-000 )
      ( obj-at p682 l000-000 )
      ( obj-at p182 l000-000 )
      ( obj-at p679 l000-000 )
      ( obj-at p527 l000-000 )
      ( obj-at p999 l000-000 )
      ( obj-at p994 l000-000 )
      ( obj-at p656 l000-000 )
    )
  )
)
