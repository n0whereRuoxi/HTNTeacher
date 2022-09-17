( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-547 - location
    l000-707 - location
    l000-480 - location
    l000-481 - location
    l000-755 - location
    l000-867 - location
    l000-619 - location
    l000-173 - location
    l000-221 - location
    l000-199 - location
    l000-420 - location
    l000-677 - location
    l000-808 - location
    l000-68 - location
    l000-933 - location
    p597 - obj
    p808 - obj
    p98 - obj
    p932 - obj
    p99 - obj
    p980 - obj
    p272 - obj
    p411 - obj
    p246 - obj
    p975 - obj
    p106 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-547 c000 )
    ( in-city l000-707 c000 )
    ( in-city l000-480 c000 )
    ( in-city l000-481 c000 )
    ( in-city l000-755 c000 )
    ( in-city l000-867 c000 )
    ( in-city l000-619 c000 )
    ( in-city l000-173 c000 )
    ( in-city l000-221 c000 )
    ( in-city l000-199 c000 )
    ( in-city l000-420 c000 )
    ( in-city l000-677 c000 )
    ( in-city l000-808 c000 )
    ( in-city l000-68 c000 )
    ( in-city l000-933 c000 )
    ( obj-at p597 l000-221 )
    ( obj-at p808 l000-867 )
    ( obj-at p98 l000-707 )
    ( obj-at p932 l000-173 )
    ( obj-at p99 l000-199 )
    ( obj-at p980 l000-755 )
    ( obj-at p272 l000-867 )
    ( obj-at p411 l000-420 )
    ( obj-at p246 l000-221 )
    ( obj-at p975 l000-933 )
    ( obj-at p106 l000-420 )
    ( greater-than p808 p597 )
    ( greater-than p98 p597 )
    ( greater-than p98 p808 )
    ( greater-than p932 p597 )
    ( greater-than p932 p808 )
    ( greater-than p932 p98 )
    ( greater-than p99 p597 )
    ( greater-than p99 p808 )
    ( greater-than p99 p98 )
    ( greater-than p99 p932 )
    ( greater-than p980 p597 )
    ( greater-than p980 p808 )
    ( greater-than p980 p98 )
    ( greater-than p980 p932 )
    ( greater-than p980 p99 )
    ( greater-than p272 p597 )
    ( greater-than p272 p808 )
    ( greater-than p272 p98 )
    ( greater-than p272 p932 )
    ( greater-than p272 p99 )
    ( greater-than p272 p980 )
    ( greater-than p411 p597 )
    ( greater-than p411 p808 )
    ( greater-than p411 p98 )
    ( greater-than p411 p932 )
    ( greater-than p411 p99 )
    ( greater-than p411 p980 )
    ( greater-than p411 p272 )
    ( greater-than p246 p597 )
    ( greater-than p246 p808 )
    ( greater-than p246 p98 )
    ( greater-than p246 p932 )
    ( greater-than p246 p99 )
    ( greater-than p246 p980 )
    ( greater-than p246 p272 )
    ( greater-than p246 p411 )
    ( greater-than p975 p597 )
    ( greater-than p975 p808 )
    ( greater-than p975 p98 )
    ( greater-than p975 p932 )
    ( greater-than p975 p99 )
    ( greater-than p975 p980 )
    ( greater-than p975 p272 )
    ( greater-than p975 p411 )
    ( greater-than p975 p246 )
    ( greater-than p106 p597 )
    ( greater-than p106 p808 )
    ( greater-than p106 p98 )
    ( greater-than p106 p932 )
    ( greater-than p106 p99 )
    ( greater-than p106 p980 )
    ( greater-than p106 p272 )
    ( greater-than p106 p411 )
    ( greater-than p106 p246 )
    ( greater-than p106 p975 )
  )
  ( :tasks
    ( Deliver-11Pkg p597 p808 p98 p932 p99 p980 p272 p411 p246 p975 p106 l000-000 )
  )
)
