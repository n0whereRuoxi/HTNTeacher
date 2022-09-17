( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b20 - block
    b921 - block
    b337 - block
    b372 - block
    b199 - block
    b72 - block
    b503 - block
    b866 - block
    b829 - block
    b371 - block
    b918 - block
    b705 - block
    b818 - block
    b524 - block
    b156 - block
    b474 - block
    b366 - block
    b677 - block
    b824 - block
    b987 - block
    b331 - block
    b820 - block
    b16 - block
    b334 - block
    b591 - block
    b101 - block
    b703 - block
    b80 - block
    b543 - block
    b741 - block
    b54 - block
    b570 - block
    b830 - block
    b75 - block
    b733 - block
    b560 - block
    b457 - block
    b239 - block
    b363 - block
    b48 - block
    b598 - block
    b846 - block
    b521 - block
    b565 - block
    b529 - block
    b693 - block
    b427 - block
    b275 - block
    b249 - block
    b607 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b20 )
    ( on b921 b20 )
    ( on b337 b921 )
    ( on b372 b337 )
    ( on b199 b372 )
    ( on b72 b199 )
    ( on b503 b72 )
    ( on b866 b503 )
    ( on b829 b866 )
    ( on b371 b829 )
    ( on b918 b371 )
    ( on b705 b918 )
    ( on b818 b705 )
    ( on b524 b818 )
    ( on b156 b524 )
    ( on b474 b156 )
    ( on b366 b474 )
    ( on b677 b366 )
    ( on b824 b677 )
    ( on b987 b824 )
    ( on b331 b987 )
    ( on b820 b331 )
    ( on b16 b820 )
    ( on b334 b16 )
    ( on b591 b334 )
    ( on b101 b591 )
    ( on b703 b101 )
    ( on b80 b703 )
    ( on b543 b80 )
    ( on b741 b543 )
    ( on b54 b741 )
    ( on b570 b54 )
    ( on b830 b570 )
    ( on b75 b830 )
    ( on b733 b75 )
    ( on b560 b733 )
    ( on b457 b560 )
    ( on b239 b457 )
    ( on b363 b239 )
    ( on b48 b363 )
    ( on b598 b48 )
    ( on b846 b598 )
    ( on b521 b846 )
    ( on b565 b521 )
    ( on b529 b565 )
    ( on b693 b529 )
    ( on b427 b693 )
    ( on b275 b427 )
    ( on b249 b275 )
    ( on b607 b249 )
    ( clear b607 )
  )
  ( :goal
    ( and
      ( clear b20 )
    )
  )
)
