( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b621 - block
    b275 - block
    b808 - block
    b895 - block
    b466 - block
    b269 - block
    b162 - block
    b359 - block
    b819 - block
    b361 - block
    b116 - block
    b673 - block
    b717 - block
    b123 - block
    b7 - block
    b2 - block
    b241 - block
    b948 - block
    b224 - block
    b656 - block
    b19 - block
    b704 - block
    b779 - block
    b507 - block
    b1 - block
    b583 - block
    b217 - block
    b316 - block
    b962 - block
    b297 - block
    b415 - block
    b976 - block
    b35 - block
    b567 - block
    b700 - block
    b615 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b621 )
    ( on b275 b621 )
    ( on b808 b275 )
    ( on b895 b808 )
    ( on b466 b895 )
    ( on b269 b466 )
    ( on b162 b269 )
    ( on b359 b162 )
    ( on b819 b359 )
    ( on b361 b819 )
    ( on b116 b361 )
    ( on b673 b116 )
    ( on b717 b673 )
    ( on b123 b717 )
    ( on b7 b123 )
    ( on b2 b7 )
    ( on b241 b2 )
    ( on b948 b241 )
    ( on b224 b948 )
    ( on b656 b224 )
    ( on b19 b656 )
    ( on b704 b19 )
    ( on b779 b704 )
    ( on b507 b779 )
    ( on b1 b507 )
    ( on b583 b1 )
    ( on b217 b583 )
    ( on b316 b217 )
    ( on b962 b316 )
    ( on b297 b962 )
    ( on b415 b297 )
    ( on b976 b415 )
    ( on b35 b976 )
    ( on b567 b35 )
    ( on b700 b567 )
    ( on b615 b700 )
    ( clear b615 )
  )
  ( :tasks
    ( Make-35Pile b275 b808 b895 b466 b269 b162 b359 b819 b361 b116 b673 b717 b123 b7 b2 b241 b948 b224 b656 b19 b704 b779 b507 b1 b583 b217 b316 b962 b297 b415 b976 b35 b567 b700 b615 )
  )
)
