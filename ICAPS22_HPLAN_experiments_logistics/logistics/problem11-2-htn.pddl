( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-581 - location
    l000-767 - location
    l000-666 - location
    l000-787 - location
    l000-874 - location
    l000-156 - location
    l000-214 - location
    l000-165 - location
    l000-70 - location
    l000-624 - location
    l000-472 - location
    l000-501 - location
    l000-529 - location
    p855 - obj
    p772 - obj
    p738 - obj
    p387 - obj
    p737 - obj
    p780 - obj
    p412 - obj
    p860 - obj
    p796 - obj
    p479 - obj
    p265 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-581 c000 )
    ( in-city l000-767 c000 )
    ( in-city l000-666 c000 )
    ( in-city l000-787 c000 )
    ( in-city l000-874 c000 )
    ( in-city l000-156 c000 )
    ( in-city l000-214 c000 )
    ( in-city l000-165 c000 )
    ( in-city l000-70 c000 )
    ( in-city l000-624 c000 )
    ( in-city l000-472 c000 )
    ( in-city l000-501 c000 )
    ( in-city l000-529 c000 )
    ( obj-at p855 l000-767 )
    ( obj-at p772 l000-666 )
    ( obj-at p738 l000-529 )
    ( obj-at p387 l000-165 )
    ( obj-at p737 l000-581 )
    ( obj-at p780 l000-472 )
    ( obj-at p412 l000-874 )
    ( obj-at p860 l000-874 )
    ( obj-at p796 l000-70 )
    ( obj-at p479 l000-529 )
    ( obj-at p265 l000-156 )
    ( greater-than p772 p855 )
    ( greater-than p738 p855 )
    ( greater-than p738 p772 )
    ( greater-than p387 p855 )
    ( greater-than p387 p772 )
    ( greater-than p387 p738 )
    ( greater-than p737 p855 )
    ( greater-than p737 p772 )
    ( greater-than p737 p738 )
    ( greater-than p737 p387 )
    ( greater-than p780 p855 )
    ( greater-than p780 p772 )
    ( greater-than p780 p738 )
    ( greater-than p780 p387 )
    ( greater-than p780 p737 )
    ( greater-than p412 p855 )
    ( greater-than p412 p772 )
    ( greater-than p412 p738 )
    ( greater-than p412 p387 )
    ( greater-than p412 p737 )
    ( greater-than p412 p780 )
    ( greater-than p860 p855 )
    ( greater-than p860 p772 )
    ( greater-than p860 p738 )
    ( greater-than p860 p387 )
    ( greater-than p860 p737 )
    ( greater-than p860 p780 )
    ( greater-than p860 p412 )
    ( greater-than p796 p855 )
    ( greater-than p796 p772 )
    ( greater-than p796 p738 )
    ( greater-than p796 p387 )
    ( greater-than p796 p737 )
    ( greater-than p796 p780 )
    ( greater-than p796 p412 )
    ( greater-than p796 p860 )
    ( greater-than p479 p855 )
    ( greater-than p479 p772 )
    ( greater-than p479 p738 )
    ( greater-than p479 p387 )
    ( greater-than p479 p737 )
    ( greater-than p479 p780 )
    ( greater-than p479 p412 )
    ( greater-than p479 p860 )
    ( greater-than p479 p796 )
    ( greater-than p265 p855 )
    ( greater-than p265 p772 )
    ( greater-than p265 p738 )
    ( greater-than p265 p387 )
    ( greater-than p265 p737 )
    ( greater-than p265 p780 )
    ( greater-than p265 p412 )
    ( greater-than p265 p860 )
    ( greater-than p265 p796 )
    ( greater-than p265 p479 )
  )
  ( :tasks
    ( Deliver-11Pkg p855 p772 p738 p387 p737 p780 p412 p860 p796 p479 p265 l000-000 )
  )
)
