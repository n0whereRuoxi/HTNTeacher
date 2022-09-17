( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-986 - location
    l000-223 - location
    l000-838 - location
    l000-712 - location
    l000-687 - location
    l000-125 - location
    l000-200 - location
    l000-174 - location
    l000-775 - location
    l000-535 - location
    l000-875 - location
    l000-77 - location
    l000-744 - location
    l000-989 - location
    l000-363 - location
    l000-942 - location
    l000-127 - location
    l000-708 - location
    p692 - obj
    p275 - obj
    p872 - obj
    p576 - obj
    p21 - obj
    p312 - obj
    p487 - obj
    p511 - obj
    p57 - obj
    p949 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-986 c000 )
    ( in-city l000-223 c000 )
    ( in-city l000-838 c000 )
    ( in-city l000-712 c000 )
    ( in-city l000-687 c000 )
    ( in-city l000-125 c000 )
    ( in-city l000-200 c000 )
    ( in-city l000-174 c000 )
    ( in-city l000-775 c000 )
    ( in-city l000-535 c000 )
    ( in-city l000-875 c000 )
    ( in-city l000-77 c000 )
    ( in-city l000-744 c000 )
    ( in-city l000-989 c000 )
    ( in-city l000-363 c000 )
    ( in-city l000-942 c000 )
    ( in-city l000-127 c000 )
    ( in-city l000-708 c000 )
    ( obj-at p692 l000-989 )
    ( obj-at p275 l000-986 )
    ( obj-at p872 l000-535 )
    ( obj-at p576 l000-535 )
    ( obj-at p21 l000-125 )
    ( obj-at p312 l000-200 )
    ( obj-at p487 l000-687 )
    ( obj-at p511 l000-989 )
    ( obj-at p57 l000-989 )
    ( obj-at p949 l000-127 )
    ( greater-than p275 p692 )
    ( greater-than p872 p692 )
    ( greater-than p872 p275 )
    ( greater-than p576 p692 )
    ( greater-than p576 p275 )
    ( greater-than p576 p872 )
    ( greater-than p21 p692 )
    ( greater-than p21 p275 )
    ( greater-than p21 p872 )
    ( greater-than p21 p576 )
    ( greater-than p312 p692 )
    ( greater-than p312 p275 )
    ( greater-than p312 p872 )
    ( greater-than p312 p576 )
    ( greater-than p312 p21 )
    ( greater-than p487 p692 )
    ( greater-than p487 p275 )
    ( greater-than p487 p872 )
    ( greater-than p487 p576 )
    ( greater-than p487 p21 )
    ( greater-than p487 p312 )
    ( greater-than p511 p692 )
    ( greater-than p511 p275 )
    ( greater-than p511 p872 )
    ( greater-than p511 p576 )
    ( greater-than p511 p21 )
    ( greater-than p511 p312 )
    ( greater-than p511 p487 )
    ( greater-than p57 p692 )
    ( greater-than p57 p275 )
    ( greater-than p57 p872 )
    ( greater-than p57 p576 )
    ( greater-than p57 p21 )
    ( greater-than p57 p312 )
    ( greater-than p57 p487 )
    ( greater-than p57 p511 )
    ( greater-than p949 p692 )
    ( greater-than p949 p275 )
    ( greater-than p949 p872 )
    ( greater-than p949 p576 )
    ( greater-than p949 p21 )
    ( greater-than p949 p312 )
    ( greater-than p949 p487 )
    ( greater-than p949 p511 )
    ( greater-than p949 p57 )
  )
  ( :tasks
    ( Deliver-10Pkg p692 p275 p872 p576 p21 p312 p487 p511 p57 p949 l000-000 )
  )
)
