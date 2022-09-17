( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b549 - block
    b214 - block
    b3 - block
    b794 - block
    b39 - block
    b640 - block
    b851 - block
    b75 - block
    b728 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b549 )
    ( on b214 b549 )
    ( on b3 b214 )
    ( on b794 b3 )
    ( on b39 b794 )
    ( on b640 b39 )
    ( on b851 b640 )
    ( on b75 b851 )
    ( on b728 b75 )
    ( clear b728 )
  )
  ( :tasks
    ( Make-8Pile b214 b3 b794 b39 b640 b851 b75 b728 )
  )
)
