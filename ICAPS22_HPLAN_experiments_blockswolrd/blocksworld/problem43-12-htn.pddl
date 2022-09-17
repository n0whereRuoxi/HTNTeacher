( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b488 - block
    b519 - block
    b435 - block
    b697 - block
    b444 - block
    b904 - block
    b955 - block
    b848 - block
    b32 - block
    b285 - block
    b379 - block
    b806 - block
    b382 - block
    b820 - block
    b557 - block
    b235 - block
    b497 - block
    b549 - block
    b513 - block
    b308 - block
    b288 - block
    b786 - block
    b363 - block
    b108 - block
    b82 - block
    b675 - block
    b227 - block
    b992 - block
    b291 - block
    b780 - block
    b237 - block
    b277 - block
    b871 - block
    b469 - block
    b808 - block
    b92 - block
    b54 - block
    b695 - block
    b735 - block
    b903 - block
    b479 - block
    b98 - block
    b564 - block
    b754 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b488 )
    ( on b519 b488 )
    ( on b435 b519 )
    ( on b697 b435 )
    ( on b444 b697 )
    ( on b904 b444 )
    ( on b955 b904 )
    ( on b848 b955 )
    ( on b32 b848 )
    ( on b285 b32 )
    ( on b379 b285 )
    ( on b806 b379 )
    ( on b382 b806 )
    ( on b820 b382 )
    ( on b557 b820 )
    ( on b235 b557 )
    ( on b497 b235 )
    ( on b549 b497 )
    ( on b513 b549 )
    ( on b308 b513 )
    ( on b288 b308 )
    ( on b786 b288 )
    ( on b363 b786 )
    ( on b108 b363 )
    ( on b82 b108 )
    ( on b675 b82 )
    ( on b227 b675 )
    ( on b992 b227 )
    ( on b291 b992 )
    ( on b780 b291 )
    ( on b237 b780 )
    ( on b277 b237 )
    ( on b871 b277 )
    ( on b469 b871 )
    ( on b808 b469 )
    ( on b92 b808 )
    ( on b54 b92 )
    ( on b695 b54 )
    ( on b735 b695 )
    ( on b903 b735 )
    ( on b479 b903 )
    ( on b98 b479 )
    ( on b564 b98 )
    ( on b754 b564 )
    ( clear b754 )
  )
  ( :tasks
    ( Make-43Pile b519 b435 b697 b444 b904 b955 b848 b32 b285 b379 b806 b382 b820 b557 b235 b497 b549 b513 b308 b288 b786 b363 b108 b82 b675 b227 b992 b291 b780 b237 b277 b871 b469 b808 b92 b54 b695 b735 b903 b479 b98 b564 b754 )
  )
)
