( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b232 - block
    b408 - block
    b693 - block
    b948 - block
    b210 - block
    b895 - block
    b937 - block
    b549 - block
    b903 - block
    b958 - block
    b394 - block
    b336 - block
    b548 - block
    b702 - block
    b554 - block
    b223 - block
    b273 - block
    b384 - block
    b995 - block
    b727 - block
    b175 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b232 )
    ( on b408 b232 )
    ( on b693 b408 )
    ( on b948 b693 )
    ( on b210 b948 )
    ( on b895 b210 )
    ( on b937 b895 )
    ( on b549 b937 )
    ( on b903 b549 )
    ( on b958 b903 )
    ( on b394 b958 )
    ( on b336 b394 )
    ( on b548 b336 )
    ( on b702 b548 )
    ( on b554 b702 )
    ( on b223 b554 )
    ( on b273 b223 )
    ( on b384 b273 )
    ( on b995 b384 )
    ( on b727 b995 )
    ( on b175 b727 )
    ( clear b175 )
  )
  ( :tasks
    ( Make-20Pile b408 b693 b948 b210 b895 b937 b549 b903 b958 b394 b336 b548 b702 b554 b223 b273 b384 b995 b727 b175 )
  )
)
