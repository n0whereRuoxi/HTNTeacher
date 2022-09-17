( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b531 - block
    b480 - block
    b144 - block
    b934 - block
    b158 - block
    b669 - block
    b256 - block
    b163 - block
    b851 - block
    b729 - block
    b177 - block
    b273 - block
    b175 - block
    b521 - block
    b959 - block
    b967 - block
    b642 - block
    b343 - block
    b205 - block
    b131 - block
    b307 - block
    b769 - block
    b991 - block
    b449 - block
    b900 - block
    b216 - block
    b439 - block
    b146 - block
    b587 - block
    b621 - block
    b6 - block
    b169 - block
    b622 - block
    b416 - block
    b67 - block
    b142 - block
    b383 - block
    b92 - block
    b346 - block
    b635 - block
    b432 - block
    b896 - block
    b530 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b531 )
    ( on b480 b531 )
    ( on b144 b480 )
    ( on b934 b144 )
    ( on b158 b934 )
    ( on b669 b158 )
    ( on b256 b669 )
    ( on b163 b256 )
    ( on b851 b163 )
    ( on b729 b851 )
    ( on b177 b729 )
    ( on b273 b177 )
    ( on b175 b273 )
    ( on b521 b175 )
    ( on b959 b521 )
    ( on b967 b959 )
    ( on b642 b967 )
    ( on b343 b642 )
    ( on b205 b343 )
    ( on b131 b205 )
    ( on b307 b131 )
    ( on b769 b307 )
    ( on b991 b769 )
    ( on b449 b991 )
    ( on b900 b449 )
    ( on b216 b900 )
    ( on b439 b216 )
    ( on b146 b439 )
    ( on b587 b146 )
    ( on b621 b587 )
    ( on b6 b621 )
    ( on b169 b6 )
    ( on b622 b169 )
    ( on b416 b622 )
    ( on b67 b416 )
    ( on b142 b67 )
    ( on b383 b142 )
    ( on b92 b383 )
    ( on b346 b92 )
    ( on b635 b346 )
    ( on b432 b635 )
    ( on b896 b432 )
    ( on b530 b896 )
    ( clear b530 )
  )
  ( :tasks
    ( Make-42Pile b480 b144 b934 b158 b669 b256 b163 b851 b729 b177 b273 b175 b521 b959 b967 b642 b343 b205 b131 b307 b769 b991 b449 b900 b216 b439 b146 b587 b621 b6 b169 b622 b416 b67 b142 b383 b92 b346 b635 b432 b896 b530 )
  )
)
