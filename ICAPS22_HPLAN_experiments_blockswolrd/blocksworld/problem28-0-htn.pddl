( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b833 - block
    b921 - block
    b386 - block
    b297 - block
    b770 - block
    b78 - block
    b998 - block
    b138 - block
    b397 - block
    b369 - block
    b81 - block
    b186 - block
    b333 - block
    b512 - block
    b842 - block
    b140 - block
    b958 - block
    b200 - block
    b817 - block
    b766 - block
    b348 - block
    b616 - block
    b416 - block
    b127 - block
    b575 - block
    b551 - block
    b688 - block
    b258 - block
    b900 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b833 )
    ( on b921 b833 )
    ( on b386 b921 )
    ( on b297 b386 )
    ( on b770 b297 )
    ( on b78 b770 )
    ( on b998 b78 )
    ( on b138 b998 )
    ( on b397 b138 )
    ( on b369 b397 )
    ( on b81 b369 )
    ( on b186 b81 )
    ( on b333 b186 )
    ( on b512 b333 )
    ( on b842 b512 )
    ( on b140 b842 )
    ( on b958 b140 )
    ( on b200 b958 )
    ( on b817 b200 )
    ( on b766 b817 )
    ( on b348 b766 )
    ( on b616 b348 )
    ( on b416 b616 )
    ( on b127 b416 )
    ( on b575 b127 )
    ( on b551 b575 )
    ( on b688 b551 )
    ( on b258 b688 )
    ( on b900 b258 )
    ( clear b900 )
  )
  ( :tasks
    ( Make-28Pile b921 b386 b297 b770 b78 b998 b138 b397 b369 b81 b186 b333 b512 b842 b140 b958 b200 b817 b766 b348 b616 b416 b127 b575 b551 b688 b258 b900 )
  )
)
