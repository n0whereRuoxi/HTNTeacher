( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b168 - block
    b542 - block
    b966 - block
    b147 - block
    b913 - block
    b651 - block
    b496 - block
    b93 - block
    b605 - block
    b224 - block
    b590 - block
    b808 - block
    b513 - block
    b32 - block
    b719 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b168 )
    ( on b542 b168 )
    ( on b966 b542 )
    ( on b147 b966 )
    ( on b913 b147 )
    ( on b651 b913 )
    ( on b496 b651 )
    ( on b93 b496 )
    ( on b605 b93 )
    ( on b224 b605 )
    ( on b590 b224 )
    ( on b808 b590 )
    ( on b513 b808 )
    ( on b32 b513 )
    ( on b719 b32 )
    ( clear b719 )
  )
  ( :tasks
    ( Make-14Pile b542 b966 b147 b913 b651 b496 b93 b605 b224 b590 b808 b513 b32 b719 )
  )
)
