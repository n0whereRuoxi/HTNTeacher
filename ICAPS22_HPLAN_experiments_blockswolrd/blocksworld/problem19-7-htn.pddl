( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b816 - block
    b733 - block
    b138 - block
    b806 - block
    b16 - block
    b968 - block
    b819 - block
    b835 - block
    b8 - block
    b29 - block
    b545 - block
    b524 - block
    b525 - block
    b609 - block
    b252 - block
    b164 - block
    b394 - block
    b504 - block
    b551 - block
    b277 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b816 )
    ( on b733 b816 )
    ( on b138 b733 )
    ( on b806 b138 )
    ( on b16 b806 )
    ( on b968 b16 )
    ( on b819 b968 )
    ( on b835 b819 )
    ( on b8 b835 )
    ( on b29 b8 )
    ( on b545 b29 )
    ( on b524 b545 )
    ( on b525 b524 )
    ( on b609 b525 )
    ( on b252 b609 )
    ( on b164 b252 )
    ( on b394 b164 )
    ( on b504 b394 )
    ( on b551 b504 )
    ( on b277 b551 )
    ( clear b277 )
  )
  ( :tasks
    ( Make-19Pile b733 b138 b806 b16 b968 b819 b835 b8 b29 b545 b524 b525 b609 b252 b164 b394 b504 b551 b277 )
  )
)
