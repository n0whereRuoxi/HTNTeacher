( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b603 - block
    b268 - block
    b369 - block
    b733 - block
    b881 - block
    b996 - block
    b807 - block
    b459 - block
    b1 - block
    b882 - block
    b681 - block
    b607 - block
    b561 - block
    b202 - block
    b744 - block
    b440 - block
    b203 - block
    b521 - block
    b802 - block
    b933 - block
    b734 - block
    b611 - block
    b494 - block
    b326 - block
    b307 - block
    b703 - block
    b608 - block
    b979 - block
    b985 - block
    b397 - block
    b574 - block
    b276 - block
    b471 - block
    b917 - block
    b941 - block
    b317 - block
    b192 - block
    b710 - block
    b30 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b603 )
    ( on b268 b603 )
    ( on b369 b268 )
    ( on b733 b369 )
    ( on b881 b733 )
    ( on b996 b881 )
    ( on b807 b996 )
    ( on b459 b807 )
    ( on b1 b459 )
    ( on b882 b1 )
    ( on b681 b882 )
    ( on b607 b681 )
    ( on b561 b607 )
    ( on b202 b561 )
    ( on b744 b202 )
    ( on b440 b744 )
    ( on b203 b440 )
    ( on b521 b203 )
    ( on b802 b521 )
    ( on b933 b802 )
    ( on b734 b933 )
    ( on b611 b734 )
    ( on b494 b611 )
    ( on b326 b494 )
    ( on b307 b326 )
    ( on b703 b307 )
    ( on b608 b703 )
    ( on b979 b608 )
    ( on b985 b979 )
    ( on b397 b985 )
    ( on b574 b397 )
    ( on b276 b574 )
    ( on b471 b276 )
    ( on b917 b471 )
    ( on b941 b917 )
    ( on b317 b941 )
    ( on b192 b317 )
    ( on b710 b192 )
    ( on b30 b710 )
    ( clear b30 )
  )
  ( :tasks
    ( Make-38Pile b268 b369 b733 b881 b996 b807 b459 b1 b882 b681 b607 b561 b202 b744 b440 b203 b521 b802 b933 b734 b611 b494 b326 b307 b703 b608 b979 b985 b397 b574 b276 b471 b917 b941 b317 b192 b710 b30 )
  )
)
