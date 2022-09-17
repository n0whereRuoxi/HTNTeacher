( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b216 - block
    b577 - block
    b111 - block
    b157 - block
    b147 - block
    b948 - block
    b983 - block
    b676 - block
    b873 - block
    b231 - block
    b83 - block
    b818 - block
    b96 - block
    b60 - block
    b745 - block
    b446 - block
    b454 - block
    b846 - block
    b751 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b216 )
    ( on b577 b216 )
    ( on b111 b577 )
    ( on b157 b111 )
    ( on b147 b157 )
    ( on b948 b147 )
    ( on b983 b948 )
    ( on b676 b983 )
    ( on b873 b676 )
    ( on b231 b873 )
    ( on b83 b231 )
    ( on b818 b83 )
    ( on b96 b818 )
    ( on b60 b96 )
    ( on b745 b60 )
    ( on b446 b745 )
    ( on b454 b446 )
    ( on b846 b454 )
    ( on b751 b846 )
    ( clear b751 )
  )
  ( :goal
    ( and
      ( clear b216 )
    )
  )
)
