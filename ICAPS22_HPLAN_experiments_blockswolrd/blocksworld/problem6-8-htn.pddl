( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b591 - block
    b56 - block
    b449 - block
    b798 - block
    b817 - block
    b856 - block
    b607 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b591 )
    ( on b56 b591 )
    ( on b449 b56 )
    ( on b798 b449 )
    ( on b817 b798 )
    ( on b856 b817 )
    ( on b607 b856 )
    ( clear b607 )
  )
  ( :tasks
    ( Make-6Pile b56 b449 b798 b817 b856 b607 )
  )
)
