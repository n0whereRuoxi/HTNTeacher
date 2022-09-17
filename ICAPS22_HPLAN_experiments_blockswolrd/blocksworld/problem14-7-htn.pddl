( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b419 - block
    b532 - block
    b169 - block
    b86 - block
    b330 - block
    b231 - block
    b926 - block
    b779 - block
    b793 - block
    b451 - block
    b491 - block
    b479 - block
    b43 - block
    b420 - block
    b555 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b419 )
    ( on b532 b419 )
    ( on b169 b532 )
    ( on b86 b169 )
    ( on b330 b86 )
    ( on b231 b330 )
    ( on b926 b231 )
    ( on b779 b926 )
    ( on b793 b779 )
    ( on b451 b793 )
    ( on b491 b451 )
    ( on b479 b491 )
    ( on b43 b479 )
    ( on b420 b43 )
    ( on b555 b420 )
    ( clear b555 )
  )
  ( :tasks
    ( Make-14Pile b532 b169 b86 b330 b231 b926 b779 b793 b451 b491 b479 b43 b420 b555 )
  )
)
