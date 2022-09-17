( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b602 - block
    b841 - block
    b495 - block
    b111 - block
    b328 - block
    b331 - block
    b416 - block
    b137 - block
    b482 - block
    b761 - block
    b960 - block
    b855 - block
    b215 - block
    b658 - block
    b15 - block
    b71 - block
    b422 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b602 )
    ( on b841 b602 )
    ( on b495 b841 )
    ( on b111 b495 )
    ( on b328 b111 )
    ( on b331 b328 )
    ( on b416 b331 )
    ( on b137 b416 )
    ( on b482 b137 )
    ( on b761 b482 )
    ( on b960 b761 )
    ( on b855 b960 )
    ( on b215 b855 )
    ( on b658 b215 )
    ( on b15 b658 )
    ( on b71 b15 )
    ( on b422 b71 )
    ( clear b422 )
  )
  ( :tasks
    ( Make-16Pile b841 b495 b111 b328 b331 b416 b137 b482 b761 b960 b855 b215 b658 b15 b71 b422 )
  )
)
