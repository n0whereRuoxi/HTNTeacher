( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-470 - location
    l000-124 - location
    l000-291 - location
    l000-651 - location
    l000-585 - location
    l000-131 - location
    l000-887 - location
    l000-721 - location
    l000-964 - location
    l000-187 - location
    l000-737 - location
    l000-520 - location
    l000-496 - location
    p666 - obj
    p44 - obj
    p784 - obj
    p33 - obj
    p631 - obj
    p675 - obj
    p517 - obj
    p555 - obj
    p478 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-470 c000 )
    ( in-city l000-124 c000 )
    ( in-city l000-291 c000 )
    ( in-city l000-651 c000 )
    ( in-city l000-585 c000 )
    ( in-city l000-131 c000 )
    ( in-city l000-887 c000 )
    ( in-city l000-721 c000 )
    ( in-city l000-964 c000 )
    ( in-city l000-187 c000 )
    ( in-city l000-737 c000 )
    ( in-city l000-520 c000 )
    ( in-city l000-496 c000 )
    ( obj-at p666 l000-651 )
    ( obj-at p44 l000-651 )
    ( obj-at p784 l000-187 )
    ( obj-at p33 l000-131 )
    ( obj-at p631 l000-964 )
    ( obj-at p675 l000-187 )
    ( obj-at p517 l000-470 )
    ( obj-at p555 l000-964 )
    ( obj-at p478 l000-887 )
    ( greater-than p44 p666 )
    ( greater-than p784 p666 )
    ( greater-than p784 p44 )
    ( greater-than p33 p666 )
    ( greater-than p33 p44 )
    ( greater-than p33 p784 )
    ( greater-than p631 p666 )
    ( greater-than p631 p44 )
    ( greater-than p631 p784 )
    ( greater-than p631 p33 )
    ( greater-than p675 p666 )
    ( greater-than p675 p44 )
    ( greater-than p675 p784 )
    ( greater-than p675 p33 )
    ( greater-than p675 p631 )
    ( greater-than p517 p666 )
    ( greater-than p517 p44 )
    ( greater-than p517 p784 )
    ( greater-than p517 p33 )
    ( greater-than p517 p631 )
    ( greater-than p517 p675 )
    ( greater-than p555 p666 )
    ( greater-than p555 p44 )
    ( greater-than p555 p784 )
    ( greater-than p555 p33 )
    ( greater-than p555 p631 )
    ( greater-than p555 p675 )
    ( greater-than p555 p517 )
    ( greater-than p478 p666 )
    ( greater-than p478 p44 )
    ( greater-than p478 p784 )
    ( greater-than p478 p33 )
    ( greater-than p478 p631 )
    ( greater-than p478 p675 )
    ( greater-than p478 p517 )
    ( greater-than p478 p555 )
  )
  ( :goal
    ( and
      ( obj-at p666 l000-000 )
      ( obj-at p44 l000-000 )
      ( obj-at p784 l000-000 )
      ( obj-at p33 l000-000 )
      ( obj-at p631 l000-000 )
      ( obj-at p675 l000-000 )
      ( obj-at p517 l000-000 )
      ( obj-at p555 l000-000 )
      ( obj-at p478 l000-000 )
    )
  )
)
