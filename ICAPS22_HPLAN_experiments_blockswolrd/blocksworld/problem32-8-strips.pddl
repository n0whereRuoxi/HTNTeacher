( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b803 - block
    b309 - block
    b222 - block
    b28 - block
    b179 - block
    b647 - block
    b911 - block
    b642 - block
    b509 - block
    b744 - block
    b471 - block
    b674 - block
    b16 - block
    b72 - block
    b406 - block
    b139 - block
    b57 - block
    b223 - block
    b145 - block
    b426 - block
    b721 - block
    b795 - block
    b239 - block
    b654 - block
    b809 - block
    b328 - block
    b549 - block
    b879 - block
    b686 - block
    b295 - block
    b135 - block
    b914 - block
    b236 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b803 )
    ( on b309 b803 )
    ( on b222 b309 )
    ( on b28 b222 )
    ( on b179 b28 )
    ( on b647 b179 )
    ( on b911 b647 )
    ( on b642 b911 )
    ( on b509 b642 )
    ( on b744 b509 )
    ( on b471 b744 )
    ( on b674 b471 )
    ( on b16 b674 )
    ( on b72 b16 )
    ( on b406 b72 )
    ( on b139 b406 )
    ( on b57 b139 )
    ( on b223 b57 )
    ( on b145 b223 )
    ( on b426 b145 )
    ( on b721 b426 )
    ( on b795 b721 )
    ( on b239 b795 )
    ( on b654 b239 )
    ( on b809 b654 )
    ( on b328 b809 )
    ( on b549 b328 )
    ( on b879 b549 )
    ( on b686 b879 )
    ( on b295 b686 )
    ( on b135 b295 )
    ( on b914 b135 )
    ( on b236 b914 )
    ( clear b236 )
  )
  ( :goal
    ( and
      ( clear b803 )
    )
  )
)
