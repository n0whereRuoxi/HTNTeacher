( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b41 - block
    b309 - block
    b27 - block
    b567 - block
    b753 - block
    b513 - block
    b132 - block
    b253 - block
    b595 - block
    b247 - block
    b825 - block
    b206 - block
    b324 - block
    b696 - block
    b620 - block
    b57 - block
    b879 - block
    b597 - block
    b163 - block
    b207 - block
    b684 - block
    b30 - block
    b946 - block
    b925 - block
    b467 - block
    b875 - block
    b835 - block
    b521 - block
    b335 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b41 )
    ( on b309 b41 )
    ( on b27 b309 )
    ( on b567 b27 )
    ( on b753 b567 )
    ( on b513 b753 )
    ( on b132 b513 )
    ( on b253 b132 )
    ( on b595 b253 )
    ( on b247 b595 )
    ( on b825 b247 )
    ( on b206 b825 )
    ( on b324 b206 )
    ( on b696 b324 )
    ( on b620 b696 )
    ( on b57 b620 )
    ( on b879 b57 )
    ( on b597 b879 )
    ( on b163 b597 )
    ( on b207 b163 )
    ( on b684 b207 )
    ( on b30 b684 )
    ( on b946 b30 )
    ( on b925 b946 )
    ( on b467 b925 )
    ( on b875 b467 )
    ( on b835 b875 )
    ( on b521 b835 )
    ( on b335 b521 )
    ( clear b335 )
  )
  ( :tasks
    ( Make-28Pile b309 b27 b567 b753 b513 b132 b253 b595 b247 b825 b206 b324 b696 b620 b57 b879 b597 b163 b207 b684 b30 b946 b925 b467 b875 b835 b521 b335 )
  )
)
