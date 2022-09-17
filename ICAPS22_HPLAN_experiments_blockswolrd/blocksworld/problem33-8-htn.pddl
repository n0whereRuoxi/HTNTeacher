( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b771 - block
    b734 - block
    b721 - block
    b384 - block
    b17 - block
    b965 - block
    b439 - block
    b283 - block
    b435 - block
    b316 - block
    b829 - block
    b279 - block
    b667 - block
    b32 - block
    b928 - block
    b6 - block
    b494 - block
    b249 - block
    b26 - block
    b87 - block
    b603 - block
    b131 - block
    b169 - block
    b534 - block
    b355 - block
    b990 - block
    b997 - block
    b640 - block
    b160 - block
    b266 - block
    b308 - block
    b195 - block
    b93 - block
    b73 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b771 )
    ( on b734 b771 )
    ( on b721 b734 )
    ( on b384 b721 )
    ( on b17 b384 )
    ( on b965 b17 )
    ( on b439 b965 )
    ( on b283 b439 )
    ( on b435 b283 )
    ( on b316 b435 )
    ( on b829 b316 )
    ( on b279 b829 )
    ( on b667 b279 )
    ( on b32 b667 )
    ( on b928 b32 )
    ( on b6 b928 )
    ( on b494 b6 )
    ( on b249 b494 )
    ( on b26 b249 )
    ( on b87 b26 )
    ( on b603 b87 )
    ( on b131 b603 )
    ( on b169 b131 )
    ( on b534 b169 )
    ( on b355 b534 )
    ( on b990 b355 )
    ( on b997 b990 )
    ( on b640 b997 )
    ( on b160 b640 )
    ( on b266 b160 )
    ( on b308 b266 )
    ( on b195 b308 )
    ( on b93 b195 )
    ( on b73 b93 )
    ( clear b73 )
  )
  ( :tasks
    ( Make-33Pile b734 b721 b384 b17 b965 b439 b283 b435 b316 b829 b279 b667 b32 b928 b6 b494 b249 b26 b87 b603 b131 b169 b534 b355 b990 b997 b640 b160 b266 b308 b195 b93 b73 )
  )
)
