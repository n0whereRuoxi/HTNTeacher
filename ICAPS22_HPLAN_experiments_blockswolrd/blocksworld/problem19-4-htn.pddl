( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b350 - block
    b933 - block
    b92 - block
    b142 - block
    b922 - block
    b316 - block
    b896 - block
    b525 - block
    b462 - block
    b501 - block
    b77 - block
    b858 - block
    b517 - block
    b544 - block
    b753 - block
    b192 - block
    b550 - block
    b923 - block
    b491 - block
    b121 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b350 )
    ( on b933 b350 )
    ( on b92 b933 )
    ( on b142 b92 )
    ( on b922 b142 )
    ( on b316 b922 )
    ( on b896 b316 )
    ( on b525 b896 )
    ( on b462 b525 )
    ( on b501 b462 )
    ( on b77 b501 )
    ( on b858 b77 )
    ( on b517 b858 )
    ( on b544 b517 )
    ( on b753 b544 )
    ( on b192 b753 )
    ( on b550 b192 )
    ( on b923 b550 )
    ( on b491 b923 )
    ( on b121 b491 )
    ( clear b121 )
  )
  ( :tasks
    ( Make-19Pile b933 b92 b142 b922 b316 b896 b525 b462 b501 b77 b858 b517 b544 b753 b192 b550 b923 b491 b121 )
  )
)
