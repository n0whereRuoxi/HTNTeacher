( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b907 - block
    b638 - block
    b723 - block
    b265 - block
    b613 - block
    b883 - block
    b458 - block
    b461 - block
    b799 - block
    b578 - block
    b92 - block
    b820 - block
    b860 - block
    b421 - block
    b715 - block
    b163 - block
    b406 - block
    b79 - block
    b225 - block
    b512 - block
    b545 - block
    b328 - block
    b148 - block
    b396 - block
    b437 - block
    b459 - block
    b930 - block
    b549 - block
    b137 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b907 )
    ( on b638 b907 )
    ( on b723 b638 )
    ( on b265 b723 )
    ( on b613 b265 )
    ( on b883 b613 )
    ( on b458 b883 )
    ( on b461 b458 )
    ( on b799 b461 )
    ( on b578 b799 )
    ( on b92 b578 )
    ( on b820 b92 )
    ( on b860 b820 )
    ( on b421 b860 )
    ( on b715 b421 )
    ( on b163 b715 )
    ( on b406 b163 )
    ( on b79 b406 )
    ( on b225 b79 )
    ( on b512 b225 )
    ( on b545 b512 )
    ( on b328 b545 )
    ( on b148 b328 )
    ( on b396 b148 )
    ( on b437 b396 )
    ( on b459 b437 )
    ( on b930 b459 )
    ( on b549 b930 )
    ( on b137 b549 )
    ( clear b137 )
  )
  ( :tasks
    ( Make-28Pile b638 b723 b265 b613 b883 b458 b461 b799 b578 b92 b820 b860 b421 b715 b163 b406 b79 b225 b512 b545 b328 b148 b396 b437 b459 b930 b549 b137 )
  )
)
