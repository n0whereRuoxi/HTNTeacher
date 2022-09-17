( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b320 - block
    b231 - block
    b315 - block
    b257 - block
    b382 - block
    b821 - block
    b705 - block
    b290 - block
    b947 - block
    b880 - block
    b819 - block
    b572 - block
    b308 - block
    b903 - block
    b720 - block
    b234 - block
    b909 - block
    b506 - block
    b974 - block
    b628 - block
    b31 - block
    b872 - block
    b71 - block
    b915 - block
    b898 - block
    b631 - block
    b769 - block
    b344 - block
    b687 - block
    b471 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b320 )
    ( on b231 b320 )
    ( on b315 b231 )
    ( on b257 b315 )
    ( on b382 b257 )
    ( on b821 b382 )
    ( on b705 b821 )
    ( on b290 b705 )
    ( on b947 b290 )
    ( on b880 b947 )
    ( on b819 b880 )
    ( on b572 b819 )
    ( on b308 b572 )
    ( on b903 b308 )
    ( on b720 b903 )
    ( on b234 b720 )
    ( on b909 b234 )
    ( on b506 b909 )
    ( on b974 b506 )
    ( on b628 b974 )
    ( on b31 b628 )
    ( on b872 b31 )
    ( on b71 b872 )
    ( on b915 b71 )
    ( on b898 b915 )
    ( on b631 b898 )
    ( on b769 b631 )
    ( on b344 b769 )
    ( on b687 b344 )
    ( on b471 b687 )
    ( clear b471 )
  )
  ( :tasks
    ( Make-29Pile b231 b315 b257 b382 b821 b705 b290 b947 b880 b819 b572 b308 b903 b720 b234 b909 b506 b974 b628 b31 b872 b71 b915 b898 b631 b769 b344 b687 b471 )
  )
)
