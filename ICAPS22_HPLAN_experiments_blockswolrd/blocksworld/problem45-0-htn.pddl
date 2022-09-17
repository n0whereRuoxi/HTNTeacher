( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b11 - block
    b145 - block
    b2 - block
    b452 - block
    b956 - block
    b729 - block
    b502 - block
    b912 - block
    b547 - block
    b422 - block
    b459 - block
    b885 - block
    b953 - block
    b964 - block
    b924 - block
    b312 - block
    b569 - block
    b379 - block
    b352 - block
    b146 - block
    b828 - block
    b565 - block
    b505 - block
    b580 - block
    b482 - block
    b701 - block
    b256 - block
    b83 - block
    b185 - block
    b952 - block
    b751 - block
    b949 - block
    b419 - block
    b657 - block
    b101 - block
    b804 - block
    b295 - block
    b193 - block
    b159 - block
    b887 - block
    b588 - block
    b857 - block
    b730 - block
    b982 - block
    b651 - block
    b646 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b11 )
    ( on b145 b11 )
    ( on b2 b145 )
    ( on b452 b2 )
    ( on b956 b452 )
    ( on b729 b956 )
    ( on b502 b729 )
    ( on b912 b502 )
    ( on b547 b912 )
    ( on b422 b547 )
    ( on b459 b422 )
    ( on b885 b459 )
    ( on b953 b885 )
    ( on b964 b953 )
    ( on b924 b964 )
    ( on b312 b924 )
    ( on b569 b312 )
    ( on b379 b569 )
    ( on b352 b379 )
    ( on b146 b352 )
    ( on b828 b146 )
    ( on b565 b828 )
    ( on b505 b565 )
    ( on b580 b505 )
    ( on b482 b580 )
    ( on b701 b482 )
    ( on b256 b701 )
    ( on b83 b256 )
    ( on b185 b83 )
    ( on b952 b185 )
    ( on b751 b952 )
    ( on b949 b751 )
    ( on b419 b949 )
    ( on b657 b419 )
    ( on b101 b657 )
    ( on b804 b101 )
    ( on b295 b804 )
    ( on b193 b295 )
    ( on b159 b193 )
    ( on b887 b159 )
    ( on b588 b887 )
    ( on b857 b588 )
    ( on b730 b857 )
    ( on b982 b730 )
    ( on b651 b982 )
    ( on b646 b651 )
    ( clear b646 )
  )
  ( :tasks
    ( Make-45Pile b145 b2 b452 b956 b729 b502 b912 b547 b422 b459 b885 b953 b964 b924 b312 b569 b379 b352 b146 b828 b565 b505 b580 b482 b701 b256 b83 b185 b952 b751 b949 b419 b657 b101 b804 b295 b193 b159 b887 b588 b857 b730 b982 b651 b646 )
  )
)
