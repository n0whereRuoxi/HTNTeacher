( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b975 - block
    b153 - block
    b736 - block
    b751 - block
    b67 - block
    b284 - block
    b707 - block
    b23 - block
    b369 - block
    b130 - block
    b804 - block
    b273 - block
    b419 - block
    b51 - block
    b612 - block
    b230 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b975 )
    ( on b153 b975 )
    ( on b736 b153 )
    ( on b751 b736 )
    ( on b67 b751 )
    ( on b284 b67 )
    ( on b707 b284 )
    ( on b23 b707 )
    ( on b369 b23 )
    ( on b130 b369 )
    ( on b804 b130 )
    ( on b273 b804 )
    ( on b419 b273 )
    ( on b51 b419 )
    ( on b612 b51 )
    ( on b230 b612 )
    ( clear b230 )
  )
  ( :tasks
    ( Make-15Pile b153 b736 b751 b67 b284 b707 b23 b369 b130 b804 b273 b419 b51 b612 b230 )
  )
)
