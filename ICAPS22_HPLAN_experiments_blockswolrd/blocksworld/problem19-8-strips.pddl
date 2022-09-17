( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b602 - block
    b890 - block
    b177 - block
    b773 - block
    b302 - block
    b658 - block
    b263 - block
    b478 - block
    b987 - block
    b909 - block
    b216 - block
    b202 - block
    b267 - block
    b517 - block
    b902 - block
    b76 - block
    b648 - block
    b143 - block
    b273 - block
    b163 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b602 )
    ( on b890 b602 )
    ( on b177 b890 )
    ( on b773 b177 )
    ( on b302 b773 )
    ( on b658 b302 )
    ( on b263 b658 )
    ( on b478 b263 )
    ( on b987 b478 )
    ( on b909 b987 )
    ( on b216 b909 )
    ( on b202 b216 )
    ( on b267 b202 )
    ( on b517 b267 )
    ( on b902 b517 )
    ( on b76 b902 )
    ( on b648 b76 )
    ( on b143 b648 )
    ( on b273 b143 )
    ( on b163 b273 )
    ( clear b163 )
  )
  ( :goal
    ( and
      ( clear b602 )
    )
  )
)
