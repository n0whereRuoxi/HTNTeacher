( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b848 - block
    b842 - block
    b360 - block
    b86 - block
    b536 - block
    b979 - block
    b184 - block
    b269 - block
    b423 - block
    b597 - block
    b426 - block
    b774 - block
    b527 - block
    b766 - block
    b203 - block
    b124 - block
    b67 - block
    b644 - block
    b879 - block
    b839 - block
    b824 - block
    b999 - block
    b815 - block
    b125 - block
    b645 - block
    b577 - block
    b418 - block
    b566 - block
    b328 - block
    b455 - block
    b490 - block
    b570 - block
    b391 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b848 )
    ( on b842 b848 )
    ( on b360 b842 )
    ( on b86 b360 )
    ( on b536 b86 )
    ( on b979 b536 )
    ( on b184 b979 )
    ( on b269 b184 )
    ( on b423 b269 )
    ( on b597 b423 )
    ( on b426 b597 )
    ( on b774 b426 )
    ( on b527 b774 )
    ( on b766 b527 )
    ( on b203 b766 )
    ( on b124 b203 )
    ( on b67 b124 )
    ( on b644 b67 )
    ( on b879 b644 )
    ( on b839 b879 )
    ( on b824 b839 )
    ( on b999 b824 )
    ( on b815 b999 )
    ( on b125 b815 )
    ( on b645 b125 )
    ( on b577 b645 )
    ( on b418 b577 )
    ( on b566 b418 )
    ( on b328 b566 )
    ( on b455 b328 )
    ( on b490 b455 )
    ( on b570 b490 )
    ( on b391 b570 )
    ( clear b391 )
  )
  ( :goal
    ( and
      ( clear b848 )
    )
  )
)
