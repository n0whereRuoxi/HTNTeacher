( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b457 - block
    b541 - block
    b428 - block
    b538 - block
    b976 - block
    b772 - block
    b468 - block
    b857 - block
    b148 - block
    b685 - block
    b946 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b457 )
    ( on b541 b457 )
    ( on b428 b541 )
    ( on b538 b428 )
    ( on b976 b538 )
    ( on b772 b976 )
    ( on b468 b772 )
    ( on b857 b468 )
    ( on b148 b857 )
    ( on b685 b148 )
    ( on b946 b685 )
    ( clear b946 )
  )
  ( :tasks
    ( Make-10Pile b541 b428 b538 b976 b772 b468 b857 b148 b685 b946 )
  )
)
