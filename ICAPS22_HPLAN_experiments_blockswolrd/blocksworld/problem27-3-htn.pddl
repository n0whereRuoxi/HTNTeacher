( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b335 - block
    b439 - block
    b563 - block
    b152 - block
    b446 - block
    b805 - block
    b885 - block
    b125 - block
    b400 - block
    b408 - block
    b999 - block
    b22 - block
    b743 - block
    b278 - block
    b804 - block
    b362 - block
    b654 - block
    b89 - block
    b14 - block
    b903 - block
    b476 - block
    b415 - block
    b156 - block
    b897 - block
    b905 - block
    b258 - block
    b205 - block
    b592 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b335 )
    ( on b439 b335 )
    ( on b563 b439 )
    ( on b152 b563 )
    ( on b446 b152 )
    ( on b805 b446 )
    ( on b885 b805 )
    ( on b125 b885 )
    ( on b400 b125 )
    ( on b408 b400 )
    ( on b999 b408 )
    ( on b22 b999 )
    ( on b743 b22 )
    ( on b278 b743 )
    ( on b804 b278 )
    ( on b362 b804 )
    ( on b654 b362 )
    ( on b89 b654 )
    ( on b14 b89 )
    ( on b903 b14 )
    ( on b476 b903 )
    ( on b415 b476 )
    ( on b156 b415 )
    ( on b897 b156 )
    ( on b905 b897 )
    ( on b258 b905 )
    ( on b205 b258 )
    ( on b592 b205 )
    ( clear b592 )
  )
  ( :tasks
    ( Make-27Pile b439 b563 b152 b446 b805 b885 b125 b400 b408 b999 b22 b743 b278 b804 b362 b654 b89 b14 b903 b476 b415 b156 b897 b905 b258 b205 b592 )
  )
)
