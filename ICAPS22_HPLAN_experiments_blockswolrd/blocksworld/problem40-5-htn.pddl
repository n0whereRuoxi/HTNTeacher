( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b161 - block
    b7 - block
    b764 - block
    b887 - block
    b690 - block
    b120 - block
    b153 - block
    b897 - block
    b110 - block
    b188 - block
    b805 - block
    b417 - block
    b254 - block
    b511 - block
    b551 - block
    b927 - block
    b299 - block
    b918 - block
    b698 - block
    b425 - block
    b983 - block
    b878 - block
    b494 - block
    b555 - block
    b564 - block
    b790 - block
    b599 - block
    b217 - block
    b563 - block
    b232 - block
    b989 - block
    b288 - block
    b879 - block
    b620 - block
    b577 - block
    b208 - block
    b576 - block
    b261 - block
    b473 - block
    b411 - block
    b495 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b161 )
    ( on b7 b161 )
    ( on b764 b7 )
    ( on b887 b764 )
    ( on b690 b887 )
    ( on b120 b690 )
    ( on b153 b120 )
    ( on b897 b153 )
    ( on b110 b897 )
    ( on b188 b110 )
    ( on b805 b188 )
    ( on b417 b805 )
    ( on b254 b417 )
    ( on b511 b254 )
    ( on b551 b511 )
    ( on b927 b551 )
    ( on b299 b927 )
    ( on b918 b299 )
    ( on b698 b918 )
    ( on b425 b698 )
    ( on b983 b425 )
    ( on b878 b983 )
    ( on b494 b878 )
    ( on b555 b494 )
    ( on b564 b555 )
    ( on b790 b564 )
    ( on b599 b790 )
    ( on b217 b599 )
    ( on b563 b217 )
    ( on b232 b563 )
    ( on b989 b232 )
    ( on b288 b989 )
    ( on b879 b288 )
    ( on b620 b879 )
    ( on b577 b620 )
    ( on b208 b577 )
    ( on b576 b208 )
    ( on b261 b576 )
    ( on b473 b261 )
    ( on b411 b473 )
    ( on b495 b411 )
    ( clear b495 )
  )
  ( :tasks
    ( Make-40Pile b7 b764 b887 b690 b120 b153 b897 b110 b188 b805 b417 b254 b511 b551 b927 b299 b918 b698 b425 b983 b878 b494 b555 b564 b790 b599 b217 b563 b232 b989 b288 b879 b620 b577 b208 b576 b261 b473 b411 b495 )
  )
)
