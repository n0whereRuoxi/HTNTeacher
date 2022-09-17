( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l602 - location
    l233 - location
    l877 - location
    l417 - location
    l592 - location
    l791 - location
    l949 - location
    l191 - location
    l888 - location
    l341 - location
    l687 - location
    l809 - location
    l820 - location
    l425 - location
    l215 - location
    l760 - location
    l140 - location
    l342 - location
    l604 - location
    l133 - location
    l801 - location
    l766 - location
    p251 - obj
    p926 - obj
    p532 - obj
    p436 - obj
    p420 - obj
    p765 - obj
    p136 - obj
    p757 - obj
    p473 - obj
    p51 - obj
    p300 - obj
    p383 - obj
    p531 - obj
    t1937 - truck
    t1793 - truck
    t1183 - truck
    t1151 - truck
    t1875 - truck
    t1810 - truck
    t1037 - truck
    t1781 - truck
    t1032 - truck
    t1085 - truck
    t1771 - truck
    t1268 - truck
  )
  ( :init
    ( in-city l602 c000 )
    ( in-city l233 c000 )
    ( in-city l877 c000 )
    ( in-city l417 c000 )
    ( in-city l592 c000 )
    ( in-city l791 c000 )
    ( in-city l949 c000 )
    ( in-city l191 c000 )
    ( in-city l888 c000 )
    ( in-city l341 c000 )
    ( in-city l687 c000 )
    ( in-city l809 c000 )
    ( in-city l820 c000 )
    ( in-city l425 c000 )
    ( in-city l215 c000 )
    ( in-city l760 c000 )
    ( in-city l140 c000 )
    ( in-city l342 c000 )
    ( in-city l604 c000 )
    ( in-city l133 c000 )
    ( in-city l801 c000 )
    ( in-city l766 c000 )
    ( in-truck p251 t1183 )
    ( in-truck p926 t1268 )
    ( obj-at p532 l820 )
    ( obj-at p436 l791 )
    ( obj-at p420 l760 )
    ( obj-at p765 l877 )
    ( in-truck p136 t1268 )
    ( obj-at p757 l809 )
    ( obj-at p473 l133 )
    ( obj-at p51 l949 )
    ( obj-at p300 l687 )
    ( in-truck p383 t1268 )
    ( in-truck p531 t1781 )
    ( truck-at t1937 l801 )
    ( truck-at t1793 l140 )
    ( truck-at t1183 l820 )
    ( truck-at t1151 l191 )
    ( truck-at t1875 l140 )
    ( truck-at t1810 l877 )
    ( truck-at t1037 l877 )
    ( truck-at t1781 l888 )
    ( truck-at t1032 l425 )
    ( truck-at t1085 l801 )
    ( truck-at t1771 l791 )
    ( truck-at t1268 l233 )
    ( greater-than p926 p251 )
    ( greater-than p532 p251 )
    ( greater-than p532 p926 )
    ( greater-than p436 p251 )
    ( greater-than p436 p926 )
    ( greater-than p436 p532 )
    ( greater-than p420 p251 )
    ( greater-than p420 p926 )
    ( greater-than p420 p532 )
    ( greater-than p420 p436 )
    ( greater-than p765 p251 )
    ( greater-than p765 p926 )
    ( greater-than p765 p532 )
    ( greater-than p765 p436 )
    ( greater-than p765 p420 )
    ( greater-than p136 p251 )
    ( greater-than p136 p926 )
    ( greater-than p136 p532 )
    ( greater-than p136 p436 )
    ( greater-than p136 p420 )
    ( greater-than p136 p765 )
    ( greater-than p757 p251 )
    ( greater-than p757 p926 )
    ( greater-than p757 p532 )
    ( greater-than p757 p436 )
    ( greater-than p757 p420 )
    ( greater-than p757 p765 )
    ( greater-than p757 p136 )
    ( greater-than p473 p251 )
    ( greater-than p473 p926 )
    ( greater-than p473 p532 )
    ( greater-than p473 p436 )
    ( greater-than p473 p420 )
    ( greater-than p473 p765 )
    ( greater-than p473 p136 )
    ( greater-than p473 p757 )
    ( greater-than p51 p251 )
    ( greater-than p51 p926 )
    ( greater-than p51 p532 )
    ( greater-than p51 p436 )
    ( greater-than p51 p420 )
    ( greater-than p51 p765 )
    ( greater-than p51 p136 )
    ( greater-than p51 p757 )
    ( greater-than p51 p473 )
    ( greater-than p300 p251 )
    ( greater-than p300 p926 )
    ( greater-than p300 p532 )
    ( greater-than p300 p436 )
    ( greater-than p300 p420 )
    ( greater-than p300 p765 )
    ( greater-than p300 p136 )
    ( greater-than p300 p757 )
    ( greater-than p300 p473 )
    ( greater-than p300 p51 )
    ( greater-than p383 p251 )
    ( greater-than p383 p926 )
    ( greater-than p383 p532 )
    ( greater-than p383 p436 )
    ( greater-than p383 p420 )
    ( greater-than p383 p765 )
    ( greater-than p383 p136 )
    ( greater-than p383 p757 )
    ( greater-than p383 p473 )
    ( greater-than p383 p51 )
    ( greater-than p383 p300 )
    ( greater-than p531 p251 )
    ( greater-than p531 p926 )
    ( greater-than p531 p532 )
    ( greater-than p531 p436 )
    ( greater-than p531 p420 )
    ( greater-than p531 p765 )
    ( greater-than p531 p136 )
    ( greater-than p531 p757 )
    ( greater-than p531 p473 )
    ( greater-than p531 p51 )
    ( greater-than p531 p300 )
    ( greater-than p531 p383 )
  )
  ( :tasks
    ( Deliver-13Pkg p251 p926 p532 p436 p420 p765 p136 p757 p473 p51 p300 p383 p531 l602 )
  )
)
