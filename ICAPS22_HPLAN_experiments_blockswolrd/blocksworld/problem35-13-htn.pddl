( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b1 - block
    b379 - block
    b260 - block
    b85 - block
    b182 - block
    b736 - block
    b850 - block
    b948 - block
    b246 - block
    b518 - block
    b223 - block
    b210 - block
    b377 - block
    b346 - block
    b783 - block
    b420 - block
    b895 - block
    b386 - block
    b593 - block
    b733 - block
    b565 - block
    b728 - block
    b208 - block
    b16 - block
    b769 - block
    b647 - block
    b234 - block
    b54 - block
    b192 - block
    b405 - block
    b31 - block
    b829 - block
    b118 - block
    b607 - block
    b961 - block
    b440 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b1 )
    ( on b379 b1 )
    ( on b260 b379 )
    ( on b85 b260 )
    ( on b182 b85 )
    ( on b736 b182 )
    ( on b850 b736 )
    ( on b948 b850 )
    ( on b246 b948 )
    ( on b518 b246 )
    ( on b223 b518 )
    ( on b210 b223 )
    ( on b377 b210 )
    ( on b346 b377 )
    ( on b783 b346 )
    ( on b420 b783 )
    ( on b895 b420 )
    ( on b386 b895 )
    ( on b593 b386 )
    ( on b733 b593 )
    ( on b565 b733 )
    ( on b728 b565 )
    ( on b208 b728 )
    ( on b16 b208 )
    ( on b769 b16 )
    ( on b647 b769 )
    ( on b234 b647 )
    ( on b54 b234 )
    ( on b192 b54 )
    ( on b405 b192 )
    ( on b31 b405 )
    ( on b829 b31 )
    ( on b118 b829 )
    ( on b607 b118 )
    ( on b961 b607 )
    ( on b440 b961 )
    ( clear b440 )
  )
  ( :tasks
    ( Make-35Pile b379 b260 b85 b182 b736 b850 b948 b246 b518 b223 b210 b377 b346 b783 b420 b895 b386 b593 b733 b565 b728 b208 b16 b769 b647 b234 b54 b192 b405 b31 b829 b118 b607 b961 b440 )
  )
)
