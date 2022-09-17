( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b259 - block
    b445 - block
    b488 - block
    b622 - block
    b383 - block
    b370 - block
    b761 - block
    b945 - block
    b567 - block
    b720 - block
    b943 - block
    b699 - block
    b701 - block
    b574 - block
    b111 - block
    b375 - block
    b514 - block
    b686 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b259 )
    ( on b445 b259 )
    ( on b488 b445 )
    ( on b622 b488 )
    ( on b383 b622 )
    ( on b370 b383 )
    ( on b761 b370 )
    ( on b945 b761 )
    ( on b567 b945 )
    ( on b720 b567 )
    ( on b943 b720 )
    ( on b699 b943 )
    ( on b701 b699 )
    ( on b574 b701 )
    ( on b111 b574 )
    ( on b375 b111 )
    ( on b514 b375 )
    ( on b686 b514 )
    ( clear b686 )
  )
  ( :tasks
    ( Make-17Pile b445 b488 b622 b383 b370 b761 b945 b567 b720 b943 b699 b701 b574 b111 b375 b514 b686 )
  )
)
