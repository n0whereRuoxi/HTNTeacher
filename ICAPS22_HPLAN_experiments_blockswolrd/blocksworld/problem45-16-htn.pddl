( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b323 - block
    b786 - block
    b262 - block
    b157 - block
    b970 - block
    b904 - block
    b784 - block
    b848 - block
    b444 - block
    b415 - block
    b858 - block
    b15 - block
    b604 - block
    b555 - block
    b149 - block
    b783 - block
    b566 - block
    b519 - block
    b940 - block
    b40 - block
    b806 - block
    b9 - block
    b919 - block
    b663 - block
    b701 - block
    b47 - block
    b13 - block
    b22 - block
    b336 - block
    b543 - block
    b734 - block
    b220 - block
    b860 - block
    b725 - block
    b845 - block
    b870 - block
    b206 - block
    b163 - block
    b560 - block
    b341 - block
    b184 - block
    b492 - block
    b283 - block
    b927 - block
    b413 - block
    b407 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b323 )
    ( on b786 b323 )
    ( on b262 b786 )
    ( on b157 b262 )
    ( on b970 b157 )
    ( on b904 b970 )
    ( on b784 b904 )
    ( on b848 b784 )
    ( on b444 b848 )
    ( on b415 b444 )
    ( on b858 b415 )
    ( on b15 b858 )
    ( on b604 b15 )
    ( on b555 b604 )
    ( on b149 b555 )
    ( on b783 b149 )
    ( on b566 b783 )
    ( on b519 b566 )
    ( on b940 b519 )
    ( on b40 b940 )
    ( on b806 b40 )
    ( on b9 b806 )
    ( on b919 b9 )
    ( on b663 b919 )
    ( on b701 b663 )
    ( on b47 b701 )
    ( on b13 b47 )
    ( on b22 b13 )
    ( on b336 b22 )
    ( on b543 b336 )
    ( on b734 b543 )
    ( on b220 b734 )
    ( on b860 b220 )
    ( on b725 b860 )
    ( on b845 b725 )
    ( on b870 b845 )
    ( on b206 b870 )
    ( on b163 b206 )
    ( on b560 b163 )
    ( on b341 b560 )
    ( on b184 b341 )
    ( on b492 b184 )
    ( on b283 b492 )
    ( on b927 b283 )
    ( on b413 b927 )
    ( on b407 b413 )
    ( clear b407 )
  )
  ( :tasks
    ( Make-45Pile b786 b262 b157 b970 b904 b784 b848 b444 b415 b858 b15 b604 b555 b149 b783 b566 b519 b940 b40 b806 b9 b919 b663 b701 b47 b13 b22 b336 b543 b734 b220 b860 b725 b845 b870 b206 b163 b560 b341 b184 b492 b283 b927 b413 b407 )
  )
)
