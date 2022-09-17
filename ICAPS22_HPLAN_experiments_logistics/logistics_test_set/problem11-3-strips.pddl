( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l570 - location
    l490 - location
    l48 - location
    l869 - location
    l966 - location
    l272 - location
    l58 - location
    l755 - location
    l817 - location
    l988 - location
    l209 - location
    l889 - location
    l822 - location
    l225 - location
    l422 - location
    l104 - location
    l542 - location
    l566 - location
    l250 - location
    l425 - location
    l261 - location
    p303 - obj
    p669 - obj
    p280 - obj
    p259 - obj
    p565 - obj
    p468 - obj
    p202 - obj
    p642 - obj
    p563 - obj
    p168 - obj
    p306 - obj
    t1678 - truck
    t1757 - truck
    t1269 - truck
    t1434 - truck
    t1105 - truck
    t1885 - truck
    t1894 - truck
    t1551 - truck
    t1366 - truck
    t1832 - truck
  )
  ( :init
    ( in-city l570 c000 )
    ( in-city l490 c000 )
    ( in-city l48 c000 )
    ( in-city l869 c000 )
    ( in-city l966 c000 )
    ( in-city l272 c000 )
    ( in-city l58 c000 )
    ( in-city l755 c000 )
    ( in-city l817 c000 )
    ( in-city l988 c000 )
    ( in-city l209 c000 )
    ( in-city l889 c000 )
    ( in-city l822 c000 )
    ( in-city l225 c000 )
    ( in-city l422 c000 )
    ( in-city l104 c000 )
    ( in-city l542 c000 )
    ( in-city l566 c000 )
    ( in-city l250 c000 )
    ( in-city l425 c000 )
    ( in-city l261 c000 )
    ( obj-at p303 l988 )
    ( obj-at p669 l225 )
    ( obj-at p280 l261 )
    ( obj-at p259 l822 )
    ( obj-at p565 l889 )
    ( in-truck p468 t1678 )
    ( in-truck p202 t1366 )
    ( obj-at p642 l58 )
    ( obj-at p563 l422 )
    ( obj-at p168 l48 )
    ( in-truck p306 t1894 )
    ( truck-at t1678 l755 )
    ( truck-at t1757 l566 )
    ( truck-at t1269 l988 )
    ( truck-at t1434 l755 )
    ( truck-at t1105 l272 )
    ( truck-at t1885 l755 )
    ( truck-at t1894 l988 )
    ( truck-at t1551 l104 )
    ( truck-at t1366 l822 )
    ( truck-at t1832 l209 )
    ( greater-than p669 p303 )
    ( greater-than p280 p303 )
    ( greater-than p280 p669 )
    ( greater-than p259 p303 )
    ( greater-than p259 p669 )
    ( greater-than p259 p280 )
    ( greater-than p565 p303 )
    ( greater-than p565 p669 )
    ( greater-than p565 p280 )
    ( greater-than p565 p259 )
    ( greater-than p468 p303 )
    ( greater-than p468 p669 )
    ( greater-than p468 p280 )
    ( greater-than p468 p259 )
    ( greater-than p468 p565 )
    ( greater-than p202 p303 )
    ( greater-than p202 p669 )
    ( greater-than p202 p280 )
    ( greater-than p202 p259 )
    ( greater-than p202 p565 )
    ( greater-than p202 p468 )
    ( greater-than p642 p303 )
    ( greater-than p642 p669 )
    ( greater-than p642 p280 )
    ( greater-than p642 p259 )
    ( greater-than p642 p565 )
    ( greater-than p642 p468 )
    ( greater-than p642 p202 )
    ( greater-than p563 p303 )
    ( greater-than p563 p669 )
    ( greater-than p563 p280 )
    ( greater-than p563 p259 )
    ( greater-than p563 p565 )
    ( greater-than p563 p468 )
    ( greater-than p563 p202 )
    ( greater-than p563 p642 )
    ( greater-than p168 p303 )
    ( greater-than p168 p669 )
    ( greater-than p168 p280 )
    ( greater-than p168 p259 )
    ( greater-than p168 p565 )
    ( greater-than p168 p468 )
    ( greater-than p168 p202 )
    ( greater-than p168 p642 )
    ( greater-than p168 p563 )
    ( greater-than p306 p303 )
    ( greater-than p306 p669 )
    ( greater-than p306 p280 )
    ( greater-than p306 p259 )
    ( greater-than p306 p565 )
    ( greater-than p306 p468 )
    ( greater-than p306 p202 )
    ( greater-than p306 p642 )
    ( greater-than p306 p563 )
    ( greater-than p306 p168 )
  )
  ( :goal
    ( and
      ( obj-at p303 l570 )
      ( obj-at p669 l570 )
      ( obj-at p280 l570 )
      ( obj-at p259 l570 )
      ( obj-at p565 l570 )
      ( obj-at p468 l570 )
      ( obj-at p202 l570 )
      ( obj-at p642 l570 )
      ( obj-at p563 l570 )
      ( obj-at p168 l570 )
      ( obj-at p306 l570 )
    )
  )
)
