( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b950 - block
    b252 - block
    b969 - block
    b517 - block
    b317 - block
    b71 - block
    b841 - block
    b283 - block
    b263 - block
    b216 - block
    b946 - block
    b166 - block
    b786 - block
    b214 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b950 )
    ( on b252 b950 )
    ( on b969 b252 )
    ( on b517 b969 )
    ( on b317 b517 )
    ( on b71 b317 )
    ( on b841 b71 )
    ( on b283 b841 )
    ( on b263 b283 )
    ( on b216 b263 )
    ( on b946 b216 )
    ( on b166 b946 )
    ( on b786 b166 )
    ( on b214 b786 )
    ( clear b214 )
  )
  ( :tasks
    ( Make-13Pile b252 b969 b517 b317 b71 b841 b283 b263 b216 b946 b166 b786 b214 )
  )
)
