( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b112 - block
    b653 - block
    b62 - block
    b902 - block
    b757 - block
    b204 - block
    b655 - block
    b586 - block
    b833 - block
    b944 - block
    b487 - block
    b700 - block
    b491 - block
    b83 - block
    b70 - block
    b133 - block
    b146 - block
    b958 - block
    b271 - block
    b869 - block
    b461 - block
    b814 - block
    b443 - block
    b141 - block
    b196 - block
    b388 - block
    b160 - block
    b738 - block
    b839 - block
    b604 - block
    b249 - block
    b511 - block
    b104 - block
    b548 - block
    b663 - block
    b825 - block
    b682 - block
    b128 - block
    b975 - block
    b656 - block
    b488 - block
    b941 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b112 )
    ( on b653 b112 )
    ( on b62 b653 )
    ( on b902 b62 )
    ( on b757 b902 )
    ( on b204 b757 )
    ( on b655 b204 )
    ( on b586 b655 )
    ( on b833 b586 )
    ( on b944 b833 )
    ( on b487 b944 )
    ( on b700 b487 )
    ( on b491 b700 )
    ( on b83 b491 )
    ( on b70 b83 )
    ( on b133 b70 )
    ( on b146 b133 )
    ( on b958 b146 )
    ( on b271 b958 )
    ( on b869 b271 )
    ( on b461 b869 )
    ( on b814 b461 )
    ( on b443 b814 )
    ( on b141 b443 )
    ( on b196 b141 )
    ( on b388 b196 )
    ( on b160 b388 )
    ( on b738 b160 )
    ( on b839 b738 )
    ( on b604 b839 )
    ( on b249 b604 )
    ( on b511 b249 )
    ( on b104 b511 )
    ( on b548 b104 )
    ( on b663 b548 )
    ( on b825 b663 )
    ( on b682 b825 )
    ( on b128 b682 )
    ( on b975 b128 )
    ( on b656 b975 )
    ( on b488 b656 )
    ( on b941 b488 )
    ( clear b941 )
  )
  ( :goal
    ( and
      ( clear b112 )
    )
  )
)
