( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b171 - block
    b882 - block
    b456 - block
    b282 - block
    b915 - block
    b86 - block
    b58 - block
    b357 - block
    b847 - block
    b302 - block
    b969 - block
    b963 - block
    b426 - block
    b232 - block
    b193 - block
    b258 - block
    b450 - block
    b699 - block
    b748 - block
    b326 - block
    b185 - block
    b777 - block
    b779 - block
    b607 - block
    b213 - block
    b399 - block
    b870 - block
    b220 - block
    b133 - block
    b222 - block
    b631 - block
    b447 - block
    b17 - block
    b356 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b171 )
    ( on b882 b171 )
    ( on b456 b882 )
    ( on b282 b456 )
    ( on b915 b282 )
    ( on b86 b915 )
    ( on b58 b86 )
    ( on b357 b58 )
    ( on b847 b357 )
    ( on b302 b847 )
    ( on b969 b302 )
    ( on b963 b969 )
    ( on b426 b963 )
    ( on b232 b426 )
    ( on b193 b232 )
    ( on b258 b193 )
    ( on b450 b258 )
    ( on b699 b450 )
    ( on b748 b699 )
    ( on b326 b748 )
    ( on b185 b326 )
    ( on b777 b185 )
    ( on b779 b777 )
    ( on b607 b779 )
    ( on b213 b607 )
    ( on b399 b213 )
    ( on b870 b399 )
    ( on b220 b870 )
    ( on b133 b220 )
    ( on b222 b133 )
    ( on b631 b222 )
    ( on b447 b631 )
    ( on b17 b447 )
    ( on b356 b17 )
    ( clear b356 )
  )
  ( :tasks
    ( Make-33Pile b882 b456 b282 b915 b86 b58 b357 b847 b302 b969 b963 b426 b232 b193 b258 b450 b699 b748 b326 b185 b777 b779 b607 b213 b399 b870 b220 b133 b222 b631 b447 b17 b356 )
  )
)
