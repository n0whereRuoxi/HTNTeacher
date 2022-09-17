( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b449 - block
    b858 - block
    b760 - block
    b586 - block
    b168 - block
    b394 - block
    b842 - block
    b28 - block
    b272 - block
    b35 - block
    b209 - block
    b505 - block
    b999 - block
    b752 - block
    b583 - block
    b667 - block
    b221 - block
    b112 - block
    b53 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b449 )
    ( on b858 b449 )
    ( on b760 b858 )
    ( on b586 b760 )
    ( on b168 b586 )
    ( on b394 b168 )
    ( on b842 b394 )
    ( on b28 b842 )
    ( on b272 b28 )
    ( on b35 b272 )
    ( on b209 b35 )
    ( on b505 b209 )
    ( on b999 b505 )
    ( on b752 b999 )
    ( on b583 b752 )
    ( on b667 b583 )
    ( on b221 b667 )
    ( on b112 b221 )
    ( on b53 b112 )
    ( clear b53 )
  )
  ( :tasks
    ( Make-18Pile b858 b760 b586 b168 b394 b842 b28 b272 b35 b209 b505 b999 b752 b583 b667 b221 b112 b53 )
  )
)
