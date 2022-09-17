( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b530 - block
    b394 - block
    b54 - block
    b186 - block
    b881 - block
    b277 - block
    b518 - block
    b439 - block
    b930 - block
    b753 - block
    b781 - block
    b669 - block
    b64 - block
    b576 - block
    b801 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b530 )
    ( on b394 b530 )
    ( on b54 b394 )
    ( on b186 b54 )
    ( on b881 b186 )
    ( on b277 b881 )
    ( on b518 b277 )
    ( on b439 b518 )
    ( on b930 b439 )
    ( on b753 b930 )
    ( on b781 b753 )
    ( on b669 b781 )
    ( on b64 b669 )
    ( on b576 b64 )
    ( on b801 b576 )
    ( clear b801 )
  )
  ( :tasks
    ( Make-14Pile b394 b54 b186 b881 b277 b518 b439 b930 b753 b781 b669 b64 b576 b801 )
  )
)
