( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b817 - block
    b681 - block
    b783 - block
    b844 - block
    b176 - block
    b952 - block
    b566 - block
    b650 - block
    b91 - block
    b272 - block
    b22 - block
    b66 - block
    b629 - block
    b448 - block
    b653 - block
    b599 - block
    b833 - block
    b972 - block
    b170 - block
    b138 - block
    b278 - block
    b117 - block
    b689 - block
    b277 - block
    b172 - block
    b85 - block
    b484 - block
    b307 - block
    b447 - block
    b705 - block
    b120 - block
    b790 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b817 )
    ( on b681 b817 )
    ( on b783 b681 )
    ( on b844 b783 )
    ( on b176 b844 )
    ( on b952 b176 )
    ( on b566 b952 )
    ( on b650 b566 )
    ( on b91 b650 )
    ( on b272 b91 )
    ( on b22 b272 )
    ( on b66 b22 )
    ( on b629 b66 )
    ( on b448 b629 )
    ( on b653 b448 )
    ( on b599 b653 )
    ( on b833 b599 )
    ( on b972 b833 )
    ( on b170 b972 )
    ( on b138 b170 )
    ( on b278 b138 )
    ( on b117 b278 )
    ( on b689 b117 )
    ( on b277 b689 )
    ( on b172 b277 )
    ( on b85 b172 )
    ( on b484 b85 )
    ( on b307 b484 )
    ( on b447 b307 )
    ( on b705 b447 )
    ( on b120 b705 )
    ( on b790 b120 )
    ( clear b790 )
  )
  ( :tasks
    ( Make-31Pile b681 b783 b844 b176 b952 b566 b650 b91 b272 b22 b66 b629 b448 b653 b599 b833 b972 b170 b138 b278 b117 b689 b277 b172 b85 b484 b307 b447 b705 b120 b790 )
  )
)
