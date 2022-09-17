( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    l828 - location
    l913 - location
    l498 - location
    l52 - location
    l797 - location
    l580 - location
    l808 - location
    l603 - location
    p898 - obj
    p342 - obj
    p745 - obj
    p562 - obj
    p596 - obj
    p840 - obj
    p324 - obj
    p891 - obj
    p785 - obj
    p244 - obj
    p601 - obj
    p602 - obj
    t1692 - truck
    t1129 - truck
    t1815 - truck
    t1079 - truck
    t1161 - truck
    t1296 - truck
    t1531 - truck
    t1230 - truck
    t1513 - truck
    t1929 - truck
    t1520 - truck
  )
  ( :init
    ( in-city l828 c000 )
    ( in-city l913 c000 )
    ( in-city l498 c000 )
    ( in-city l52 c000 )
    ( in-city l797 c000 )
    ( in-city l580 c000 )
    ( in-city l808 c000 )
    ( in-city l603 c000 )
    ( in-truck p898 t1815 )
    ( obj-at p342 l580 )
    ( in-truck p745 t1520 )
    ( in-truck p562 t1161 )
    ( obj-at p596 l580 )
    ( in-truck p840 t1129 )
    ( obj-at p324 l52 )
    ( obj-at p891 l52 )
    ( in-truck p785 t1513 )
    ( in-truck p244 t1230 )
    ( in-truck p601 t1815 )
    ( in-truck p602 t1129 )
    ( truck-at t1692 l580 )
    ( truck-at t1129 l52 )
    ( truck-at t1815 l828 )
    ( truck-at t1079 l603 )
    ( truck-at t1161 l603 )
    ( truck-at t1296 l797 )
    ( truck-at t1531 l808 )
    ( truck-at t1230 l580 )
    ( truck-at t1513 l603 )
    ( truck-at t1929 l603 )
    ( truck-at t1520 l52 )
    ( greater-than p342 p898 )
    ( greater-than p745 p898 )
    ( greater-than p745 p342 )
    ( greater-than p562 p898 )
    ( greater-than p562 p342 )
    ( greater-than p562 p745 )
    ( greater-than p596 p898 )
    ( greater-than p596 p342 )
    ( greater-than p596 p745 )
    ( greater-than p596 p562 )
    ( greater-than p840 p898 )
    ( greater-than p840 p342 )
    ( greater-than p840 p745 )
    ( greater-than p840 p562 )
    ( greater-than p840 p596 )
    ( greater-than p324 p898 )
    ( greater-than p324 p342 )
    ( greater-than p324 p745 )
    ( greater-than p324 p562 )
    ( greater-than p324 p596 )
    ( greater-than p324 p840 )
    ( greater-than p891 p898 )
    ( greater-than p891 p342 )
    ( greater-than p891 p745 )
    ( greater-than p891 p562 )
    ( greater-than p891 p596 )
    ( greater-than p891 p840 )
    ( greater-than p891 p324 )
    ( greater-than p785 p898 )
    ( greater-than p785 p342 )
    ( greater-than p785 p745 )
    ( greater-than p785 p562 )
    ( greater-than p785 p596 )
    ( greater-than p785 p840 )
    ( greater-than p785 p324 )
    ( greater-than p785 p891 )
    ( greater-than p244 p898 )
    ( greater-than p244 p342 )
    ( greater-than p244 p745 )
    ( greater-than p244 p562 )
    ( greater-than p244 p596 )
    ( greater-than p244 p840 )
    ( greater-than p244 p324 )
    ( greater-than p244 p891 )
    ( greater-than p244 p785 )
    ( greater-than p601 p898 )
    ( greater-than p601 p342 )
    ( greater-than p601 p745 )
    ( greater-than p601 p562 )
    ( greater-than p601 p596 )
    ( greater-than p601 p840 )
    ( greater-than p601 p324 )
    ( greater-than p601 p891 )
    ( greater-than p601 p785 )
    ( greater-than p601 p244 )
    ( greater-than p602 p898 )
    ( greater-than p602 p342 )
    ( greater-than p602 p745 )
    ( greater-than p602 p562 )
    ( greater-than p602 p596 )
    ( greater-than p602 p840 )
    ( greater-than p602 p324 )
    ( greater-than p602 p891 )
    ( greater-than p602 p785 )
    ( greater-than p602 p244 )
    ( greater-than p602 p601 )
  )
  ( :tasks
    ( Deliver-12Pkg p898 p342 p745 p562 p596 p840 p324 p891 p785 p244 p601 p602 l828 )
  )
)
