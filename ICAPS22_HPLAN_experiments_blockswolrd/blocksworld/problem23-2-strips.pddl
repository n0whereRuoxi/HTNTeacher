( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b63 - block
    b596 - block
    b5 - block
    b816 - block
    b884 - block
    b471 - block
    b871 - block
    b69 - block
    b315 - block
    b886 - block
    b161 - block
    b544 - block
    b626 - block
    b476 - block
    b85 - block
    b714 - block
    b440 - block
    b614 - block
    b212 - block
    b354 - block
    b340 - block
    b364 - block
    b334 - block
    b743 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b63 )
    ( on b596 b63 )
    ( on b5 b596 )
    ( on b816 b5 )
    ( on b884 b816 )
    ( on b471 b884 )
    ( on b871 b471 )
    ( on b69 b871 )
    ( on b315 b69 )
    ( on b886 b315 )
    ( on b161 b886 )
    ( on b544 b161 )
    ( on b626 b544 )
    ( on b476 b626 )
    ( on b85 b476 )
    ( on b714 b85 )
    ( on b440 b714 )
    ( on b614 b440 )
    ( on b212 b614 )
    ( on b354 b212 )
    ( on b340 b354 )
    ( on b364 b340 )
    ( on b334 b364 )
    ( on b743 b334 )
    ( clear b743 )
  )
  ( :goal
    ( and
      ( clear b63 )
    )
  )
)
