( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b259 - block
    b65 - block
    b963 - block
    b857 - block
    b170 - block
    b293 - block
    b686 - block
    b904 - block
    b620 - block
    b130 - block
    b685 - block
    b992 - block
    b231 - block
    b871 - block
    b556 - block
    b494 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b259 )
    ( on b65 b259 )
    ( on b963 b65 )
    ( on b857 b963 )
    ( on b170 b857 )
    ( on b293 b170 )
    ( on b686 b293 )
    ( on b904 b686 )
    ( on b620 b904 )
    ( on b130 b620 )
    ( on b685 b130 )
    ( on b992 b685 )
    ( on b231 b992 )
    ( on b871 b231 )
    ( on b556 b871 )
    ( on b494 b556 )
    ( clear b494 )
  )
  ( :tasks
    ( Make-15Pile b65 b963 b857 b170 b293 b686 b904 b620 b130 b685 b992 b231 b871 b556 b494 )
  )
)
