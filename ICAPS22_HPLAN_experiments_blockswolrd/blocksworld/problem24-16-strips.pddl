( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b8 - block
    b682 - block
    b492 - block
    b434 - block
    b18 - block
    b239 - block
    b804 - block
    b563 - block
    b130 - block
    b812 - block
    b256 - block
    b105 - block
    b638 - block
    b335 - block
    b504 - block
    b769 - block
    b550 - block
    b941 - block
    b316 - block
    b397 - block
    b971 - block
    b58 - block
    b449 - block
    b844 - block
    b874 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b8 )
    ( on b682 b8 )
    ( on b492 b682 )
    ( on b434 b492 )
    ( on b18 b434 )
    ( on b239 b18 )
    ( on b804 b239 )
    ( on b563 b804 )
    ( on b130 b563 )
    ( on b812 b130 )
    ( on b256 b812 )
    ( on b105 b256 )
    ( on b638 b105 )
    ( on b335 b638 )
    ( on b504 b335 )
    ( on b769 b504 )
    ( on b550 b769 )
    ( on b941 b550 )
    ( on b316 b941 )
    ( on b397 b316 )
    ( on b971 b397 )
    ( on b58 b971 )
    ( on b449 b58 )
    ( on b844 b449 )
    ( on b874 b844 )
    ( clear b874 )
  )
  ( :goal
    ( and
      ( clear b8 )
    )
  )
)
