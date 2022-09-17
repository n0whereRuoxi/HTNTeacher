( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-998 - location
    l000-747 - location
    l000-932 - location
    l000-972 - location
    l000-856 - location
    l000-688 - location
    l000-996 - location
    p8 - obj
    p854 - obj
    p823 - obj
    p574 - obj
    p626 - obj
    p600 - obj
    p540 - obj
    p220 - obj
    p490 - obj
    p773 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-998 c000 )
    ( in-city l000-747 c000 )
    ( in-city l000-932 c000 )
    ( in-city l000-972 c000 )
    ( in-city l000-856 c000 )
    ( in-city l000-688 c000 )
    ( in-city l000-996 c000 )
    ( obj-at p8 l000-998 )
    ( obj-at p854 l000-932 )
    ( obj-at p823 l000-747 )
    ( obj-at p574 l000-688 )
    ( obj-at p626 l000-856 )
    ( obj-at p600 l000-996 )
    ( obj-at p540 l000-932 )
    ( obj-at p220 l000-747 )
    ( obj-at p490 l000-998 )
    ( obj-at p773 l000-932 )
    ( greater-than p854 p8 )
    ( greater-than p823 p8 )
    ( greater-than p823 p854 )
    ( greater-than p574 p8 )
    ( greater-than p574 p854 )
    ( greater-than p574 p823 )
    ( greater-than p626 p8 )
    ( greater-than p626 p854 )
    ( greater-than p626 p823 )
    ( greater-than p626 p574 )
    ( greater-than p600 p8 )
    ( greater-than p600 p854 )
    ( greater-than p600 p823 )
    ( greater-than p600 p574 )
    ( greater-than p600 p626 )
    ( greater-than p540 p8 )
    ( greater-than p540 p854 )
    ( greater-than p540 p823 )
    ( greater-than p540 p574 )
    ( greater-than p540 p626 )
    ( greater-than p540 p600 )
    ( greater-than p220 p8 )
    ( greater-than p220 p854 )
    ( greater-than p220 p823 )
    ( greater-than p220 p574 )
    ( greater-than p220 p626 )
    ( greater-than p220 p600 )
    ( greater-than p220 p540 )
    ( greater-than p490 p8 )
    ( greater-than p490 p854 )
    ( greater-than p490 p823 )
    ( greater-than p490 p574 )
    ( greater-than p490 p626 )
    ( greater-than p490 p600 )
    ( greater-than p490 p540 )
    ( greater-than p490 p220 )
    ( greater-than p773 p8 )
    ( greater-than p773 p854 )
    ( greater-than p773 p823 )
    ( greater-than p773 p574 )
    ( greater-than p773 p626 )
    ( greater-than p773 p600 )
    ( greater-than p773 p540 )
    ( greater-than p773 p220 )
    ( greater-than p773 p490 )
  )
  ( :tasks
    ( Deliver-10Pkg p8 p854 p823 p574 p626 p600 p540 p220 p490 p773 l000-000 )
  )
)
