( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b174 - block
    b737 - block
    b735 - block
    b527 - block
    b2 - block
    b882 - block
    b740 - block
    b196 - block
    b3 - block
    b885 - block
    b636 - block
    b250 - block
    b344 - block
    b488 - block
    b100 - block
    b660 - block
    b193 - block
    b697 - block
    b784 - block
    b145 - block
    b891 - block
    b298 - block
    b985 - block
    b31 - block
    b569 - block
    b352 - block
    b276 - block
    b401 - block
    b547 - block
    b172 - block
    b846 - block
    b967 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b174 )
    ( on b737 b174 )
    ( on b735 b737 )
    ( on b527 b735 )
    ( on b2 b527 )
    ( on b882 b2 )
    ( on b740 b882 )
    ( on b196 b740 )
    ( on b3 b196 )
    ( on b885 b3 )
    ( on b636 b885 )
    ( on b250 b636 )
    ( on b344 b250 )
    ( on b488 b344 )
    ( on b100 b488 )
    ( on b660 b100 )
    ( on b193 b660 )
    ( on b697 b193 )
    ( on b784 b697 )
    ( on b145 b784 )
    ( on b891 b145 )
    ( on b298 b891 )
    ( on b985 b298 )
    ( on b31 b985 )
    ( on b569 b31 )
    ( on b352 b569 )
    ( on b276 b352 )
    ( on b401 b276 )
    ( on b547 b401 )
    ( on b172 b547 )
    ( on b846 b172 )
    ( on b967 b846 )
    ( clear b967 )
  )
  ( :tasks
    ( Make-31Pile b737 b735 b527 b2 b882 b740 b196 b3 b885 b636 b250 b344 b488 b100 b660 b193 b697 b784 b145 b891 b298 b985 b31 b569 b352 b276 b401 b547 b172 b846 b967 )
  )
)
