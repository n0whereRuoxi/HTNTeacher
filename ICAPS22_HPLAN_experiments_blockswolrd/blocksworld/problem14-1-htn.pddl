( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b684 - block
    b651 - block
    b380 - block
    b827 - block
    b678 - block
    b847 - block
    b116 - block
    b969 - block
    b123 - block
    b168 - block
    b669 - block
    b721 - block
    b676 - block
    b295 - block
    b208 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b684 )
    ( on b651 b684 )
    ( on b380 b651 )
    ( on b827 b380 )
    ( on b678 b827 )
    ( on b847 b678 )
    ( on b116 b847 )
    ( on b969 b116 )
    ( on b123 b969 )
    ( on b168 b123 )
    ( on b669 b168 )
    ( on b721 b669 )
    ( on b676 b721 )
    ( on b295 b676 )
    ( on b208 b295 )
    ( clear b208 )
  )
  ( :tasks
    ( Make-14Pile b651 b380 b827 b678 b847 b116 b969 b123 b168 b669 b721 b676 b295 b208 )
  )
)
