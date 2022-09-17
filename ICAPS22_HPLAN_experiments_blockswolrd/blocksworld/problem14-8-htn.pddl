( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b851 - block
    b984 - block
    b194 - block
    b760 - block
    b868 - block
    b410 - block
    b413 - block
    b361 - block
    b610 - block
    b555 - block
    b367 - block
    b17 - block
    b752 - block
    b232 - block
    b73 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b851 )
    ( on b984 b851 )
    ( on b194 b984 )
    ( on b760 b194 )
    ( on b868 b760 )
    ( on b410 b868 )
    ( on b413 b410 )
    ( on b361 b413 )
    ( on b610 b361 )
    ( on b555 b610 )
    ( on b367 b555 )
    ( on b17 b367 )
    ( on b752 b17 )
    ( on b232 b752 )
    ( on b73 b232 )
    ( clear b73 )
  )
  ( :tasks
    ( Make-14Pile b984 b194 b760 b868 b410 b413 b361 b610 b555 b367 b17 b752 b232 b73 )
  )
)
