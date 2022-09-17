( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b321 - block
    b764 - block
    b970 - block
    b824 - block
    b509 - block
    b808 - block
    b357 - block
    b620 - block
    b704 - block
    b815 - block
    b296 - block
    b922 - block
    b393 - block
    b228 - block
    b42 - block
    b86 - block
    b759 - block
    b160 - block
    b361 - block
    b194 - block
    b913 - block
    b294 - block
    b65 - block
    b963 - block
    b224 - block
    b755 - block
    b825 - block
    b177 - block
    b975 - block
    b894 - block
    b474 - block
    b727 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b321 )
    ( on b764 b321 )
    ( on b970 b764 )
    ( on b824 b970 )
    ( on b509 b824 )
    ( on b808 b509 )
    ( on b357 b808 )
    ( on b620 b357 )
    ( on b704 b620 )
    ( on b815 b704 )
    ( on b296 b815 )
    ( on b922 b296 )
    ( on b393 b922 )
    ( on b228 b393 )
    ( on b42 b228 )
    ( on b86 b42 )
    ( on b759 b86 )
    ( on b160 b759 )
    ( on b361 b160 )
    ( on b194 b361 )
    ( on b913 b194 )
    ( on b294 b913 )
    ( on b65 b294 )
    ( on b963 b65 )
    ( on b224 b963 )
    ( on b755 b224 )
    ( on b825 b755 )
    ( on b177 b825 )
    ( on b975 b177 )
    ( on b894 b975 )
    ( on b474 b894 )
    ( on b727 b474 )
    ( clear b727 )
  )
  ( :tasks
    ( Make-31Pile b764 b970 b824 b509 b808 b357 b620 b704 b815 b296 b922 b393 b228 b42 b86 b759 b160 b361 b194 b913 b294 b65 b963 b224 b755 b825 b177 b975 b894 b474 b727 )
  )
)
