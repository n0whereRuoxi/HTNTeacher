( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b219 - block
    b883 - block
    b661 - block
    b221 - block
    b658 - block
    b496 - block
    b169 - block
    b562 - block
    b189 - block
    b669 - block
    b659 - block
    b517 - block
    b137 - block
    b187 - block
    b773 - block
    b56 - block
    b464 - block
    b192 - block
    b281 - block
    b505 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b219 )
    ( on b883 b219 )
    ( on b661 b883 )
    ( on b221 b661 )
    ( on b658 b221 )
    ( on b496 b658 )
    ( on b169 b496 )
    ( on b562 b169 )
    ( on b189 b562 )
    ( on b669 b189 )
    ( on b659 b669 )
    ( on b517 b659 )
    ( on b137 b517 )
    ( on b187 b137 )
    ( on b773 b187 )
    ( on b56 b773 )
    ( on b464 b56 )
    ( on b192 b464 )
    ( on b281 b192 )
    ( on b505 b281 )
    ( clear b505 )
  )
  ( :tasks
    ( Make-19Pile b883 b661 b221 b658 b496 b169 b562 b189 b669 b659 b517 b137 b187 b773 b56 b464 b192 b281 b505 )
  )
)
