( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b588 - block
    b337 - block
    b226 - block
    b756 - block
    b757 - block
    b813 - block
    b353 - block
    b831 - block
    b652 - block
    b129 - block
    b753 - block
    b881 - block
    b60 - block
    b341 - block
    b184 - block
    b445 - block
    b950 - block
    b676 - block
    b773 - block
    b858 - block
    b686 - block
    b436 - block
    b206 - block
    b407 - block
    b472 - block
    b627 - block
    b413 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b588 )
    ( on b337 b588 )
    ( on b226 b337 )
    ( on b756 b226 )
    ( on b757 b756 )
    ( on b813 b757 )
    ( on b353 b813 )
    ( on b831 b353 )
    ( on b652 b831 )
    ( on b129 b652 )
    ( on b753 b129 )
    ( on b881 b753 )
    ( on b60 b881 )
    ( on b341 b60 )
    ( on b184 b341 )
    ( on b445 b184 )
    ( on b950 b445 )
    ( on b676 b950 )
    ( on b773 b676 )
    ( on b858 b773 )
    ( on b686 b858 )
    ( on b436 b686 )
    ( on b206 b436 )
    ( on b407 b206 )
    ( on b472 b407 )
    ( on b627 b472 )
    ( on b413 b627 )
    ( clear b413 )
  )
  ( :goal
    ( and
      ( clear b588 )
    )
  )
)
