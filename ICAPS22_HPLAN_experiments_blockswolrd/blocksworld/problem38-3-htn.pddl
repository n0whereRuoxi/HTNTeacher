( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b946 - block
    b385 - block
    b701 - block
    b838 - block
    b604 - block
    b32 - block
    b727 - block
    b517 - block
    b831 - block
    b255 - block
    b109 - block
    b411 - block
    b808 - block
    b310 - block
    b847 - block
    b338 - block
    b712 - block
    b448 - block
    b581 - block
    b822 - block
    b753 - block
    b554 - block
    b737 - block
    b329 - block
    b162 - block
    b884 - block
    b963 - block
    b800 - block
    b529 - block
    b532 - block
    b651 - block
    b875 - block
    b940 - block
    b64 - block
    b985 - block
    b533 - block
    b711 - block
    b246 - block
    b851 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b946 )
    ( on b385 b946 )
    ( on b701 b385 )
    ( on b838 b701 )
    ( on b604 b838 )
    ( on b32 b604 )
    ( on b727 b32 )
    ( on b517 b727 )
    ( on b831 b517 )
    ( on b255 b831 )
    ( on b109 b255 )
    ( on b411 b109 )
    ( on b808 b411 )
    ( on b310 b808 )
    ( on b847 b310 )
    ( on b338 b847 )
    ( on b712 b338 )
    ( on b448 b712 )
    ( on b581 b448 )
    ( on b822 b581 )
    ( on b753 b822 )
    ( on b554 b753 )
    ( on b737 b554 )
    ( on b329 b737 )
    ( on b162 b329 )
    ( on b884 b162 )
    ( on b963 b884 )
    ( on b800 b963 )
    ( on b529 b800 )
    ( on b532 b529 )
    ( on b651 b532 )
    ( on b875 b651 )
    ( on b940 b875 )
    ( on b64 b940 )
    ( on b985 b64 )
    ( on b533 b985 )
    ( on b711 b533 )
    ( on b246 b711 )
    ( on b851 b246 )
    ( clear b851 )
  )
  ( :tasks
    ( Make-38Pile b385 b701 b838 b604 b32 b727 b517 b831 b255 b109 b411 b808 b310 b847 b338 b712 b448 b581 b822 b753 b554 b737 b329 b162 b884 b963 b800 b529 b532 b651 b875 b940 b64 b985 b533 b711 b246 b851 )
  )
)
