( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b471 - block
    b847 - block
    b182 - block
    b804 - block
    b196 - block
    b497 - block
    b838 - block
    b136 - block
    b730 - block
    b858 - block
    b30 - block
    b239 - block
    b684 - block
    b309 - block
    b202 - block
    b523 - block
    b705 - block
    b710 - block
    b919 - block
    b187 - block
    b167 - block
    b296 - block
    b680 - block
    b389 - block
    b293 - block
    b473 - block
    b271 - block
    b985 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b471 )
    ( on b847 b471 )
    ( on b182 b847 )
    ( on b804 b182 )
    ( on b196 b804 )
    ( on b497 b196 )
    ( on b838 b497 )
    ( on b136 b838 )
    ( on b730 b136 )
    ( on b858 b730 )
    ( on b30 b858 )
    ( on b239 b30 )
    ( on b684 b239 )
    ( on b309 b684 )
    ( on b202 b309 )
    ( on b523 b202 )
    ( on b705 b523 )
    ( on b710 b705 )
    ( on b919 b710 )
    ( on b187 b919 )
    ( on b167 b187 )
    ( on b296 b167 )
    ( on b680 b296 )
    ( on b389 b680 )
    ( on b293 b389 )
    ( on b473 b293 )
    ( on b271 b473 )
    ( on b985 b271 )
    ( clear b985 )
  )
  ( :tasks
    ( Make-27Pile b847 b182 b804 b196 b497 b838 b136 b730 b858 b30 b239 b684 b309 b202 b523 b705 b710 b919 b187 b167 b296 b680 b389 b293 b473 b271 b985 )
  )
)
