( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b77 - block
    b428 - block
    b123 - block
    b944 - block
    b770 - block
    b612 - block
    b151 - block
    b925 - block
    b294 - block
    b275 - block
    b557 - block
    b625 - block
    b198 - block
    b418 - block
    b383 - block
    b967 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b77 )
    ( on b428 b77 )
    ( on b123 b428 )
    ( on b944 b123 )
    ( on b770 b944 )
    ( on b612 b770 )
    ( on b151 b612 )
    ( on b925 b151 )
    ( on b294 b925 )
    ( on b275 b294 )
    ( on b557 b275 )
    ( on b625 b557 )
    ( on b198 b625 )
    ( on b418 b198 )
    ( on b383 b418 )
    ( on b967 b383 )
    ( clear b967 )
  )
  ( :tasks
    ( Make-15Pile b428 b123 b944 b770 b612 b151 b925 b294 b275 b557 b625 b198 b418 b383 b967 )
  )
)
