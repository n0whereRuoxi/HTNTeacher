( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b166 - block
    b416 - block
    b169 - block
    b934 - block
    b189 - block
    b114 - block
    b559 - block
    b368 - block
    b30 - block
    b726 - block
    b314 - block
    b688 - block
    b719 - block
    b962 - block
    b469 - block
    b683 - block
    b105 - block
    b64 - block
    b806 - block
    b597 - block
    b882 - block
    b211 - block
    b268 - block
    b677 - block
    b490 - block
    b262 - block
    b299 - block
    b894 - block
    b245 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b166 )
    ( on b416 b166 )
    ( on b169 b416 )
    ( on b934 b169 )
    ( on b189 b934 )
    ( on b114 b189 )
    ( on b559 b114 )
    ( on b368 b559 )
    ( on b30 b368 )
    ( on b726 b30 )
    ( on b314 b726 )
    ( on b688 b314 )
    ( on b719 b688 )
    ( on b962 b719 )
    ( on b469 b962 )
    ( on b683 b469 )
    ( on b105 b683 )
    ( on b64 b105 )
    ( on b806 b64 )
    ( on b597 b806 )
    ( on b882 b597 )
    ( on b211 b882 )
    ( on b268 b211 )
    ( on b677 b268 )
    ( on b490 b677 )
    ( on b262 b490 )
    ( on b299 b262 )
    ( on b894 b299 )
    ( on b245 b894 )
    ( clear b245 )
  )
  ( :goal
    ( and
      ( clear b166 )
    )
  )
)
