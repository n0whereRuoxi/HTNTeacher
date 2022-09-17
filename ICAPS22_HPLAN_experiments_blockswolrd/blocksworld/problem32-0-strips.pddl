( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b110 - block
    b854 - block
    b886 - block
    b249 - block
    b702 - block
    b133 - block
    b471 - block
    b899 - block
    b981 - block
    b270 - block
    b444 - block
    b159 - block
    b63 - block
    b164 - block
    b499 - block
    b966 - block
    b192 - block
    b994 - block
    b163 - block
    b851 - block
    b665 - block
    b740 - block
    b428 - block
    b507 - block
    b649 - block
    b925 - block
    b593 - block
    b529 - block
    b465 - block
    b613 - block
    b212 - block
    b3 - block
    b272 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b110 )
    ( on b854 b110 )
    ( on b886 b854 )
    ( on b249 b886 )
    ( on b702 b249 )
    ( on b133 b702 )
    ( on b471 b133 )
    ( on b899 b471 )
    ( on b981 b899 )
    ( on b270 b981 )
    ( on b444 b270 )
    ( on b159 b444 )
    ( on b63 b159 )
    ( on b164 b63 )
    ( on b499 b164 )
    ( on b966 b499 )
    ( on b192 b966 )
    ( on b994 b192 )
    ( on b163 b994 )
    ( on b851 b163 )
    ( on b665 b851 )
    ( on b740 b665 )
    ( on b428 b740 )
    ( on b507 b428 )
    ( on b649 b507 )
    ( on b925 b649 )
    ( on b593 b925 )
    ( on b529 b593 )
    ( on b465 b529 )
    ( on b613 b465 )
    ( on b212 b613 )
    ( on b3 b212 )
    ( on b272 b3 )
    ( clear b272 )
  )
  ( :goal
    ( and
      ( clear b110 )
    )
  )
)
