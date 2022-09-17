( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b453 - block
    b291 - block
    b82 - block
    b911 - block
    b45 - block
    b64 - block
    b271 - block
    b322 - block
    b705 - block
    b961 - block
    b758 - block
    b971 - block
    b813 - block
    b398 - block
    b91 - block
    b657 - block
    b504 - block
    b316 - block
    b461 - block
    b935 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b453 )
    ( on b291 b453 )
    ( on b82 b291 )
    ( on b911 b82 )
    ( on b45 b911 )
    ( on b64 b45 )
    ( on b271 b64 )
    ( on b322 b271 )
    ( on b705 b322 )
    ( on b961 b705 )
    ( on b758 b961 )
    ( on b971 b758 )
    ( on b813 b971 )
    ( on b398 b813 )
    ( on b91 b398 )
    ( on b657 b91 )
    ( on b504 b657 )
    ( on b316 b504 )
    ( on b461 b316 )
    ( on b935 b461 )
    ( clear b935 )
  )
  ( :tasks
    ( Make-19Pile b291 b82 b911 b45 b64 b271 b322 b705 b961 b758 b971 b813 b398 b91 b657 b504 b316 b461 b935 )
  )
)
