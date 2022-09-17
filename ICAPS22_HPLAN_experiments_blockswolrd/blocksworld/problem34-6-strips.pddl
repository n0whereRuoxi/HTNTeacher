( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b69 - block
    b11 - block
    b130 - block
    b432 - block
    b726 - block
    b748 - block
    b272 - block
    b176 - block
    b531 - block
    b578 - block
    b512 - block
    b417 - block
    b769 - block
    b516 - block
    b180 - block
    b877 - block
    b598 - block
    b653 - block
    b262 - block
    b410 - block
    b446 - block
    b21 - block
    b195 - block
    b1 - block
    b360 - block
    b362 - block
    b188 - block
    b401 - block
    b425 - block
    b620 - block
    b285 - block
    b885 - block
    b164 - block
    b500 - block
    b271 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b69 )
    ( on b11 b69 )
    ( on b130 b11 )
    ( on b432 b130 )
    ( on b726 b432 )
    ( on b748 b726 )
    ( on b272 b748 )
    ( on b176 b272 )
    ( on b531 b176 )
    ( on b578 b531 )
    ( on b512 b578 )
    ( on b417 b512 )
    ( on b769 b417 )
    ( on b516 b769 )
    ( on b180 b516 )
    ( on b877 b180 )
    ( on b598 b877 )
    ( on b653 b598 )
    ( on b262 b653 )
    ( on b410 b262 )
    ( on b446 b410 )
    ( on b21 b446 )
    ( on b195 b21 )
    ( on b1 b195 )
    ( on b360 b1 )
    ( on b362 b360 )
    ( on b188 b362 )
    ( on b401 b188 )
    ( on b425 b401 )
    ( on b620 b425 )
    ( on b285 b620 )
    ( on b885 b285 )
    ( on b164 b885 )
    ( on b500 b164 )
    ( on b271 b500 )
    ( clear b271 )
  )
  ( :goal
    ( and
      ( clear b69 )
    )
  )
)
