( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l132 - location
    l943 - location
    l158 - location
    l720 - location
    l493 - location
    l377 - location
    l710 - location
    l947 - location
    l672 - location
    l357 - location
    l59 - location
    l360 - location
    l758 - location
    l469 - location
    l475 - location
    l814 - location
    l240 - location
    l196 - location
    p767 - obj
    p783 - obj
    p489 - obj
    p956 - obj
    p918 - obj
    p649 - obj
    p460 - obj
    p746 - obj
    p601 - obj
    p894 - obj
    t1580 - truck
    t1002 - truck
    t1633 - truck
    t1886 - truck
    t1199 - truck
    t1963 - truck
    t1641 - truck
    t1787 - truck
    t1027 - truck
  )
  ( :init
    ( in-city l132 c000 )
    ( in-city l943 c000 )
    ( in-city l158 c000 )
    ( in-city l720 c000 )
    ( in-city l493 c000 )
    ( in-city l377 c000 )
    ( in-city l710 c000 )
    ( in-city l947 c000 )
    ( in-city l672 c000 )
    ( in-city l357 c000 )
    ( in-city l59 c000 )
    ( in-city l360 c000 )
    ( in-city l758 c000 )
    ( in-city l469 c000 )
    ( in-city l475 c000 )
    ( in-city l814 c000 )
    ( in-city l240 c000 )
    ( in-city l196 c000 )
    ( obj-at p767 l493 )
    ( obj-at p783 l357 )
    ( in-truck p489 t1963 )
    ( obj-at p956 l475 )
    ( obj-at p918 l240 )
    ( obj-at p649 l59 )
    ( obj-at p460 l360 )
    ( in-truck p746 t1886 )
    ( in-truck p601 t1641 )
    ( obj-at p894 l377 )
    ( truck-at t1580 l758 )
    ( truck-at t1002 l710 )
    ( truck-at t1633 l720 )
    ( truck-at t1886 l672 )
    ( truck-at t1199 l720 )
    ( truck-at t1963 l943 )
    ( truck-at t1641 l240 )
    ( truck-at t1787 l943 )
    ( truck-at t1027 l357 )
    ( greater-than p783 p767 )
    ( greater-than p489 p767 )
    ( greater-than p489 p783 )
    ( greater-than p956 p767 )
    ( greater-than p956 p783 )
    ( greater-than p956 p489 )
    ( greater-than p918 p767 )
    ( greater-than p918 p783 )
    ( greater-than p918 p489 )
    ( greater-than p918 p956 )
    ( greater-than p649 p767 )
    ( greater-than p649 p783 )
    ( greater-than p649 p489 )
    ( greater-than p649 p956 )
    ( greater-than p649 p918 )
    ( greater-than p460 p767 )
    ( greater-than p460 p783 )
    ( greater-than p460 p489 )
    ( greater-than p460 p956 )
    ( greater-than p460 p918 )
    ( greater-than p460 p649 )
    ( greater-than p746 p767 )
    ( greater-than p746 p783 )
    ( greater-than p746 p489 )
    ( greater-than p746 p956 )
    ( greater-than p746 p918 )
    ( greater-than p746 p649 )
    ( greater-than p746 p460 )
    ( greater-than p601 p767 )
    ( greater-than p601 p783 )
    ( greater-than p601 p489 )
    ( greater-than p601 p956 )
    ( greater-than p601 p918 )
    ( greater-than p601 p649 )
    ( greater-than p601 p460 )
    ( greater-than p601 p746 )
    ( greater-than p894 p767 )
    ( greater-than p894 p783 )
    ( greater-than p894 p489 )
    ( greater-than p894 p956 )
    ( greater-than p894 p918 )
    ( greater-than p894 p649 )
    ( greater-than p894 p460 )
    ( greater-than p894 p746 )
    ( greater-than p894 p601 )
  )
  ( :tasks
    ( Deliver-10Pkg p767 p783 p489 p956 p918 p649 p460 p746 p601 p894 l132 )
  )
)
