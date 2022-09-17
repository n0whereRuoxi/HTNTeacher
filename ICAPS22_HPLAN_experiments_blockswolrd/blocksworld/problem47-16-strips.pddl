( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b842 - block
    b467 - block
    b192 - block
    b238 - block
    b924 - block
    b237 - block
    b342 - block
    b791 - block
    b713 - block
    b74 - block
    b618 - block
    b813 - block
    b319 - block
    b532 - block
    b140 - block
    b982 - block
    b993 - block
    b263 - block
    b534 - block
    b212 - block
    b730 - block
    b464 - block
    b286 - block
    b990 - block
    b753 - block
    b736 - block
    b132 - block
    b628 - block
    b22 - block
    b41 - block
    b458 - block
    b280 - block
    b201 - block
    b375 - block
    b196 - block
    b513 - block
    b690 - block
    b641 - block
    b136 - block
    b358 - block
    b934 - block
    b939 - block
    b148 - block
    b560 - block
    b207 - block
    b315 - block
    b113 - block
    b938 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b842 )
    ( on b467 b842 )
    ( on b192 b467 )
    ( on b238 b192 )
    ( on b924 b238 )
    ( on b237 b924 )
    ( on b342 b237 )
    ( on b791 b342 )
    ( on b713 b791 )
    ( on b74 b713 )
    ( on b618 b74 )
    ( on b813 b618 )
    ( on b319 b813 )
    ( on b532 b319 )
    ( on b140 b532 )
    ( on b982 b140 )
    ( on b993 b982 )
    ( on b263 b993 )
    ( on b534 b263 )
    ( on b212 b534 )
    ( on b730 b212 )
    ( on b464 b730 )
    ( on b286 b464 )
    ( on b990 b286 )
    ( on b753 b990 )
    ( on b736 b753 )
    ( on b132 b736 )
    ( on b628 b132 )
    ( on b22 b628 )
    ( on b41 b22 )
    ( on b458 b41 )
    ( on b280 b458 )
    ( on b201 b280 )
    ( on b375 b201 )
    ( on b196 b375 )
    ( on b513 b196 )
    ( on b690 b513 )
    ( on b641 b690 )
    ( on b136 b641 )
    ( on b358 b136 )
    ( on b934 b358 )
    ( on b939 b934 )
    ( on b148 b939 )
    ( on b560 b148 )
    ( on b207 b560 )
    ( on b315 b207 )
    ( on b113 b315 )
    ( on b938 b113 )
    ( clear b938 )
  )
  ( :goal
    ( and
      ( clear b842 )
    )
  )
)
