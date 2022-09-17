( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b702 - block
    b54 - block
    b645 - block
    b690 - block
    b199 - block
    b707 - block
    b939 - block
    b753 - block
    b331 - block
    b521 - block
    b918 - block
    b496 - block
    b774 - block
    b725 - block
    b953 - block
    b910 - block
    b997 - block
    b259 - block
    b309 - block
    b300 - block
    b18 - block
    b45 - block
    b589 - block
    b460 - block
    b146 - block
    b902 - block
    b172 - block
    b599 - block
    b338 - block
    b66 - block
    b797 - block
    b364 - block
    b100 - block
    b807 - block
    b974 - block
    b825 - block
    b20 - block
    b818 - block
    b475 - block
    b257 - block
    b855 - block
    b383 - block
    b673 - block
    b783 - block
    b433 - block
    b950 - block
    b145 - block
    b129 - block
    b932 - block
    b498 - block
    b614 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b702 )
    ( on b54 b702 )
    ( on b645 b54 )
    ( on b690 b645 )
    ( on b199 b690 )
    ( on b707 b199 )
    ( on b939 b707 )
    ( on b753 b939 )
    ( on b331 b753 )
    ( on b521 b331 )
    ( on b918 b521 )
    ( on b496 b918 )
    ( on b774 b496 )
    ( on b725 b774 )
    ( on b953 b725 )
    ( on b910 b953 )
    ( on b997 b910 )
    ( on b259 b997 )
    ( on b309 b259 )
    ( on b300 b309 )
    ( on b18 b300 )
    ( on b45 b18 )
    ( on b589 b45 )
    ( on b460 b589 )
    ( on b146 b460 )
    ( on b902 b146 )
    ( on b172 b902 )
    ( on b599 b172 )
    ( on b338 b599 )
    ( on b66 b338 )
    ( on b797 b66 )
    ( on b364 b797 )
    ( on b100 b364 )
    ( on b807 b100 )
    ( on b974 b807 )
    ( on b825 b974 )
    ( on b20 b825 )
    ( on b818 b20 )
    ( on b475 b818 )
    ( on b257 b475 )
    ( on b855 b257 )
    ( on b383 b855 )
    ( on b673 b383 )
    ( on b783 b673 )
    ( on b433 b783 )
    ( on b950 b433 )
    ( on b145 b950 )
    ( on b129 b145 )
    ( on b932 b129 )
    ( on b498 b932 )
    ( on b614 b498 )
    ( clear b614 )
  )
  ( :goal
    ( and
      ( clear b702 )
    )
  )
)
