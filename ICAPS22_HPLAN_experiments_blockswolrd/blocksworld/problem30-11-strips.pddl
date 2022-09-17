( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b750 - block
    b726 - block
    b758 - block
    b814 - block
    b857 - block
    b359 - block
    b682 - block
    b196 - block
    b619 - block
    b10 - block
    b75 - block
    b141 - block
    b7 - block
    b710 - block
    b169 - block
    b227 - block
    b713 - block
    b409 - block
    b984 - block
    b260 - block
    b128 - block
    b465 - block
    b733 - block
    b124 - block
    b101 - block
    b86 - block
    b956 - block
    b659 - block
    b446 - block
    b674 - block
    b643 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b750 )
    ( on b726 b750 )
    ( on b758 b726 )
    ( on b814 b758 )
    ( on b857 b814 )
    ( on b359 b857 )
    ( on b682 b359 )
    ( on b196 b682 )
    ( on b619 b196 )
    ( on b10 b619 )
    ( on b75 b10 )
    ( on b141 b75 )
    ( on b7 b141 )
    ( on b710 b7 )
    ( on b169 b710 )
    ( on b227 b169 )
    ( on b713 b227 )
    ( on b409 b713 )
    ( on b984 b409 )
    ( on b260 b984 )
    ( on b128 b260 )
    ( on b465 b128 )
    ( on b733 b465 )
    ( on b124 b733 )
    ( on b101 b124 )
    ( on b86 b101 )
    ( on b956 b86 )
    ( on b659 b956 )
    ( on b446 b659 )
    ( on b674 b446 )
    ( on b643 b674 )
    ( clear b643 )
  )
  ( :goal
    ( and
      ( clear b750 )
    )
  )
)
