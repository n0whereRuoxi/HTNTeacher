( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-715 - location
    l000-94 - location
    l000-75 - location
    l000-264 - location
    l000-257 - location
    l000-957 - location
    l000-505 - location
    l000-246 - location
    l000-360 - location
    l000-299 - location
    l000-263 - location
    l000-805 - location
    l000-659 - location
    l000-961 - location
    l000-656 - location
    l000-47 - location
    l000-942 - location
    p495 - obj
    p112 - obj
    p883 - obj
    p409 - obj
    p203 - obj
    p329 - obj
    p363 - obj
    p73 - obj
    p871 - obj
    p231 - obj
    p438 - obj
    p367 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-715 c000 )
    ( in-city l000-94 c000 )
    ( in-city l000-75 c000 )
    ( in-city l000-264 c000 )
    ( in-city l000-257 c000 )
    ( in-city l000-957 c000 )
    ( in-city l000-505 c000 )
    ( in-city l000-246 c000 )
    ( in-city l000-360 c000 )
    ( in-city l000-299 c000 )
    ( in-city l000-263 c000 )
    ( in-city l000-805 c000 )
    ( in-city l000-659 c000 )
    ( in-city l000-961 c000 )
    ( in-city l000-656 c000 )
    ( in-city l000-47 c000 )
    ( in-city l000-942 c000 )
    ( obj-at p495 l000-246 )
    ( obj-at p112 l000-257 )
    ( obj-at p883 l000-94 )
    ( obj-at p409 l000-257 )
    ( obj-at p203 l000-264 )
    ( obj-at p329 l000-659 )
    ( obj-at p363 l000-246 )
    ( obj-at p73 l000-360 )
    ( obj-at p871 l000-942 )
    ( obj-at p231 l000-257 )
    ( obj-at p438 l000-75 )
    ( obj-at p367 l000-715 )
    ( greater-than p112 p495 )
    ( greater-than p883 p495 )
    ( greater-than p883 p112 )
    ( greater-than p409 p495 )
    ( greater-than p409 p112 )
    ( greater-than p409 p883 )
    ( greater-than p203 p495 )
    ( greater-than p203 p112 )
    ( greater-than p203 p883 )
    ( greater-than p203 p409 )
    ( greater-than p329 p495 )
    ( greater-than p329 p112 )
    ( greater-than p329 p883 )
    ( greater-than p329 p409 )
    ( greater-than p329 p203 )
    ( greater-than p363 p495 )
    ( greater-than p363 p112 )
    ( greater-than p363 p883 )
    ( greater-than p363 p409 )
    ( greater-than p363 p203 )
    ( greater-than p363 p329 )
    ( greater-than p73 p495 )
    ( greater-than p73 p112 )
    ( greater-than p73 p883 )
    ( greater-than p73 p409 )
    ( greater-than p73 p203 )
    ( greater-than p73 p329 )
    ( greater-than p73 p363 )
    ( greater-than p871 p495 )
    ( greater-than p871 p112 )
    ( greater-than p871 p883 )
    ( greater-than p871 p409 )
    ( greater-than p871 p203 )
    ( greater-than p871 p329 )
    ( greater-than p871 p363 )
    ( greater-than p871 p73 )
    ( greater-than p231 p495 )
    ( greater-than p231 p112 )
    ( greater-than p231 p883 )
    ( greater-than p231 p409 )
    ( greater-than p231 p203 )
    ( greater-than p231 p329 )
    ( greater-than p231 p363 )
    ( greater-than p231 p73 )
    ( greater-than p231 p871 )
    ( greater-than p438 p495 )
    ( greater-than p438 p112 )
    ( greater-than p438 p883 )
    ( greater-than p438 p409 )
    ( greater-than p438 p203 )
    ( greater-than p438 p329 )
    ( greater-than p438 p363 )
    ( greater-than p438 p73 )
    ( greater-than p438 p871 )
    ( greater-than p438 p231 )
    ( greater-than p367 p495 )
    ( greater-than p367 p112 )
    ( greater-than p367 p883 )
    ( greater-than p367 p409 )
    ( greater-than p367 p203 )
    ( greater-than p367 p329 )
    ( greater-than p367 p363 )
    ( greater-than p367 p73 )
    ( greater-than p367 p871 )
    ( greater-than p367 p231 )
    ( greater-than p367 p438 )
  )
  ( :tasks
    ( Deliver-12Pkg p495 p112 p883 p409 p203 p329 p363 p73 p871 p231 p438 p367 l000-000 )
  )
)
