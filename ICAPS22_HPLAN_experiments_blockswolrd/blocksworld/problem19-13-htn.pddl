( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b78 - block
    b117 - block
    b655 - block
    b339 - block
    b947 - block
    b36 - block
    b263 - block
    b278 - block
    b909 - block
    b365 - block
    b59 - block
    b105 - block
    b179 - block
    b384 - block
    b825 - block
    b669 - block
    b819 - block
    b921 - block
    b341 - block
    b67 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b78 )
    ( on b117 b78 )
    ( on b655 b117 )
    ( on b339 b655 )
    ( on b947 b339 )
    ( on b36 b947 )
    ( on b263 b36 )
    ( on b278 b263 )
    ( on b909 b278 )
    ( on b365 b909 )
    ( on b59 b365 )
    ( on b105 b59 )
    ( on b179 b105 )
    ( on b384 b179 )
    ( on b825 b384 )
    ( on b669 b825 )
    ( on b819 b669 )
    ( on b921 b819 )
    ( on b341 b921 )
    ( on b67 b341 )
    ( clear b67 )
  )
  ( :tasks
    ( Make-19Pile b117 b655 b339 b947 b36 b263 b278 b909 b365 b59 b105 b179 b384 b825 b669 b819 b921 b341 b67 )
  )
)
