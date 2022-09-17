( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b599 - block
    b971 - block
    b625 - block
    b50 - block
    b94 - block
    b238 - block
    b173 - block
    b723 - block
    b359 - block
    b64 - block
    b227 - block
    b501 - block
    b52 - block
    b7 - block
    b340 - block
    b478 - block
    b589 - block
    b932 - block
    b762 - block
    b310 - block
    b902 - block
    b218 - block
    b136 - block
    b664 - block
    b981 - block
    b860 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b599 )
    ( on b971 b599 )
    ( on b625 b971 )
    ( on b50 b625 )
    ( on b94 b50 )
    ( on b238 b94 )
    ( on b173 b238 )
    ( on b723 b173 )
    ( on b359 b723 )
    ( on b64 b359 )
    ( on b227 b64 )
    ( on b501 b227 )
    ( on b52 b501 )
    ( on b7 b52 )
    ( on b340 b7 )
    ( on b478 b340 )
    ( on b589 b478 )
    ( on b932 b589 )
    ( on b762 b932 )
    ( on b310 b762 )
    ( on b902 b310 )
    ( on b218 b902 )
    ( on b136 b218 )
    ( on b664 b136 )
    ( on b981 b664 )
    ( on b860 b981 )
    ( clear b860 )
  )
  ( :tasks
    ( Make-25Pile b971 b625 b50 b94 b238 b173 b723 b359 b64 b227 b501 b52 b7 b340 b478 b589 b932 b762 b310 b902 b218 b136 b664 b981 b860 )
  )
)
