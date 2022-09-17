( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b729 - block
    b748 - block
    b554 - block
    b303 - block
    b899 - block
    b380 - block
    b229 - block
    b159 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b729 )
    ( on b748 b729 )
    ( on b554 b748 )
    ( on b303 b554 )
    ( on b899 b303 )
    ( on b380 b899 )
    ( on b229 b380 )
    ( on b159 b229 )
    ( clear b159 )
  )
  ( :tasks
    ( Make-7Pile b748 b554 b303 b899 b380 b229 b159 )
  )
)
