( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b902 - block
    b220 - block
    b249 - block
    b578 - block
    b999 - block
    b646 - block
    b952 - block
    b745 - block
    b599 - block
    b230 - block
    b100 - block
    b174 - block
    b418 - block
    b852 - block
    b508 - block
    b118 - block
    b117 - block
    b722 - block
    b207 - block
    b869 - block
    b276 - block
    b124 - block
    b7 - block
    b598 - block
    b303 - block
    b331 - block
    b66 - block
    b233 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b902 )
    ( on b220 b902 )
    ( on b249 b220 )
    ( on b578 b249 )
    ( on b999 b578 )
    ( on b646 b999 )
    ( on b952 b646 )
    ( on b745 b952 )
    ( on b599 b745 )
    ( on b230 b599 )
    ( on b100 b230 )
    ( on b174 b100 )
    ( on b418 b174 )
    ( on b852 b418 )
    ( on b508 b852 )
    ( on b118 b508 )
    ( on b117 b118 )
    ( on b722 b117 )
    ( on b207 b722 )
    ( on b869 b207 )
    ( on b276 b869 )
    ( on b124 b276 )
    ( on b7 b124 )
    ( on b598 b7 )
    ( on b303 b598 )
    ( on b331 b303 )
    ( on b66 b331 )
    ( on b233 b66 )
    ( clear b233 )
  )
  ( :goal
    ( and
      ( clear b902 )
    )
  )
)
