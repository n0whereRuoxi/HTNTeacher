( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l566 - location
    l598 - location
    l951 - location
    l481 - location
    l874 - location
    l2 - location
    l628 - location
    l547 - location
    l408 - location
    l517 - location
    l688 - location
    l554 - location
    l338 - location
    p334 - obj
    p304 - obj
    p423 - obj
    p861 - obj
    p462 - obj
    p121 - obj
    p316 - obj
    p401 - obj
    p199 - obj
    p300 - obj
    p557 - obj
    p534 - obj
    p428 - obj
    t1729 - truck
    t1971 - truck
    t1367 - truck
    t1457 - truck
    t1100 - truck
    t1517 - truck
    t1331 - truck
    t1643 - truck
    t1706 - truck
    t1749 - truck
    t1167 - truck
    t1176 - truck
  )
  ( :init
    ( in-city l566 c000 )
    ( in-city l598 c000 )
    ( in-city l951 c000 )
    ( in-city l481 c000 )
    ( in-city l874 c000 )
    ( in-city l2 c000 )
    ( in-city l628 c000 )
    ( in-city l547 c000 )
    ( in-city l408 c000 )
    ( in-city l517 c000 )
    ( in-city l688 c000 )
    ( in-city l554 c000 )
    ( in-city l338 c000 )
    ( obj-at p334 l688 )
    ( obj-at p304 l874 )
    ( obj-at p423 l598 )
    ( obj-at p861 l517 )
    ( obj-at p462 l338 )
    ( obj-at p121 l338 )
    ( obj-at p316 l951 )
    ( in-truck p401 t1517 )
    ( obj-at p199 l598 )
    ( obj-at p300 l874 )
    ( obj-at p557 l338 )
    ( in-truck p534 t1729 )
    ( in-truck p428 t1749 )
    ( truck-at t1729 l874 )
    ( truck-at t1971 l547 )
    ( truck-at t1367 l951 )
    ( truck-at t1457 l566 )
    ( truck-at t1100 l688 )
    ( truck-at t1517 l628 )
    ( truck-at t1331 l628 )
    ( truck-at t1643 l481 )
    ( truck-at t1706 l408 )
    ( truck-at t1749 l2 )
    ( truck-at t1167 l628 )
    ( truck-at t1176 l874 )
    ( greater-than p304 p334 )
    ( greater-than p423 p334 )
    ( greater-than p423 p304 )
    ( greater-than p861 p334 )
    ( greater-than p861 p304 )
    ( greater-than p861 p423 )
    ( greater-than p462 p334 )
    ( greater-than p462 p304 )
    ( greater-than p462 p423 )
    ( greater-than p462 p861 )
    ( greater-than p121 p334 )
    ( greater-than p121 p304 )
    ( greater-than p121 p423 )
    ( greater-than p121 p861 )
    ( greater-than p121 p462 )
    ( greater-than p316 p334 )
    ( greater-than p316 p304 )
    ( greater-than p316 p423 )
    ( greater-than p316 p861 )
    ( greater-than p316 p462 )
    ( greater-than p316 p121 )
    ( greater-than p401 p334 )
    ( greater-than p401 p304 )
    ( greater-than p401 p423 )
    ( greater-than p401 p861 )
    ( greater-than p401 p462 )
    ( greater-than p401 p121 )
    ( greater-than p401 p316 )
    ( greater-than p199 p334 )
    ( greater-than p199 p304 )
    ( greater-than p199 p423 )
    ( greater-than p199 p861 )
    ( greater-than p199 p462 )
    ( greater-than p199 p121 )
    ( greater-than p199 p316 )
    ( greater-than p199 p401 )
    ( greater-than p300 p334 )
    ( greater-than p300 p304 )
    ( greater-than p300 p423 )
    ( greater-than p300 p861 )
    ( greater-than p300 p462 )
    ( greater-than p300 p121 )
    ( greater-than p300 p316 )
    ( greater-than p300 p401 )
    ( greater-than p300 p199 )
    ( greater-than p557 p334 )
    ( greater-than p557 p304 )
    ( greater-than p557 p423 )
    ( greater-than p557 p861 )
    ( greater-than p557 p462 )
    ( greater-than p557 p121 )
    ( greater-than p557 p316 )
    ( greater-than p557 p401 )
    ( greater-than p557 p199 )
    ( greater-than p557 p300 )
    ( greater-than p534 p334 )
    ( greater-than p534 p304 )
    ( greater-than p534 p423 )
    ( greater-than p534 p861 )
    ( greater-than p534 p462 )
    ( greater-than p534 p121 )
    ( greater-than p534 p316 )
    ( greater-than p534 p401 )
    ( greater-than p534 p199 )
    ( greater-than p534 p300 )
    ( greater-than p534 p557 )
    ( greater-than p428 p334 )
    ( greater-than p428 p304 )
    ( greater-than p428 p423 )
    ( greater-than p428 p861 )
    ( greater-than p428 p462 )
    ( greater-than p428 p121 )
    ( greater-than p428 p316 )
    ( greater-than p428 p401 )
    ( greater-than p428 p199 )
    ( greater-than p428 p300 )
    ( greater-than p428 p557 )
    ( greater-than p428 p534 )
  )
  ( :goal
    ( and
      ( obj-at p334 l566 )
      ( obj-at p304 l566 )
      ( obj-at p423 l566 )
      ( obj-at p861 l566 )
      ( obj-at p462 l566 )
      ( obj-at p121 l566 )
      ( obj-at p316 l566 )
      ( obj-at p401 l566 )
      ( obj-at p199 l566 )
      ( obj-at p300 l566 )
      ( obj-at p557 l566 )
      ( obj-at p534 l566 )
      ( obj-at p428 l566 )
    )
  )
)
