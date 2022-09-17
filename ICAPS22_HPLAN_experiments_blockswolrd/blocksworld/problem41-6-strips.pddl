( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b848 - block
    b532 - block
    b351 - block
    b598 - block
    b729 - block
    b381 - block
    b923 - block
    b637 - block
    b524 - block
    b644 - block
    b10 - block
    b354 - block
    b878 - block
    b17 - block
    b837 - block
    b590 - block
    b626 - block
    b841 - block
    b503 - block
    b685 - block
    b250 - block
    b95 - block
    b416 - block
    b341 - block
    b639 - block
    b695 - block
    b275 - block
    b407 - block
    b885 - block
    b883 - block
    b628 - block
    b370 - block
    b758 - block
    b195 - block
    b342 - block
    b893 - block
    b429 - block
    b592 - block
    b391 - block
    b523 - block
    b470 - block
    b505 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b848 )
    ( on b532 b848 )
    ( on b351 b532 )
    ( on b598 b351 )
    ( on b729 b598 )
    ( on b381 b729 )
    ( on b923 b381 )
    ( on b637 b923 )
    ( on b524 b637 )
    ( on b644 b524 )
    ( on b10 b644 )
    ( on b354 b10 )
    ( on b878 b354 )
    ( on b17 b878 )
    ( on b837 b17 )
    ( on b590 b837 )
    ( on b626 b590 )
    ( on b841 b626 )
    ( on b503 b841 )
    ( on b685 b503 )
    ( on b250 b685 )
    ( on b95 b250 )
    ( on b416 b95 )
    ( on b341 b416 )
    ( on b639 b341 )
    ( on b695 b639 )
    ( on b275 b695 )
    ( on b407 b275 )
    ( on b885 b407 )
    ( on b883 b885 )
    ( on b628 b883 )
    ( on b370 b628 )
    ( on b758 b370 )
    ( on b195 b758 )
    ( on b342 b195 )
    ( on b893 b342 )
    ( on b429 b893 )
    ( on b592 b429 )
    ( on b391 b592 )
    ( on b523 b391 )
    ( on b470 b523 )
    ( on b505 b470 )
    ( clear b505 )
  )
  ( :goal
    ( and
      ( clear b848 )
    )
  )
)
