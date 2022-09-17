( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b145 - block
    b699 - block
    b604 - block
    b434 - block
    b655 - block
    b66 - block
    b525 - block
    b678 - block
    b229 - block
    b373 - block
    b192 - block
    b446 - block
    b442 - block
    b785 - block
    b649 - block
    b393 - block
    b24 - block
    b200 - block
    b776 - block
    b905 - block
    b896 - block
    b563 - block
    b851 - block
    b432 - block
    b544 - block
    b877 - block
    b537 - block
    b472 - block
    b45 - block
    b736 - block
    b311 - block
    b173 - block
    b468 - block
    b710 - block
    b897 - block
    b180 - block
    b39 - block
    b626 - block
    b464 - block
    b949 - block
    b170 - block
    b980 - block
    b95 - block
    b817 - block
    b438 - block
    b48 - block
    b247 - block
    b208 - block
    b540 - block
    b130 - block
    b607 - block
    b233 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b145 )
    ( on b699 b145 )
    ( on b604 b699 )
    ( on b434 b604 )
    ( on b655 b434 )
    ( on b66 b655 )
    ( on b525 b66 )
    ( on b678 b525 )
    ( on b229 b678 )
    ( on b373 b229 )
    ( on b192 b373 )
    ( on b446 b192 )
    ( on b442 b446 )
    ( on b785 b442 )
    ( on b649 b785 )
    ( on b393 b649 )
    ( on b24 b393 )
    ( on b200 b24 )
    ( on b776 b200 )
    ( on b905 b776 )
    ( on b896 b905 )
    ( on b563 b896 )
    ( on b851 b563 )
    ( on b432 b851 )
    ( on b544 b432 )
    ( on b877 b544 )
    ( on b537 b877 )
    ( on b472 b537 )
    ( on b45 b472 )
    ( on b736 b45 )
    ( on b311 b736 )
    ( on b173 b311 )
    ( on b468 b173 )
    ( on b710 b468 )
    ( on b897 b710 )
    ( on b180 b897 )
    ( on b39 b180 )
    ( on b626 b39 )
    ( on b464 b626 )
    ( on b949 b464 )
    ( on b170 b949 )
    ( on b980 b170 )
    ( on b95 b980 )
    ( on b817 b95 )
    ( on b438 b817 )
    ( on b48 b438 )
    ( on b247 b48 )
    ( on b208 b247 )
    ( on b540 b208 )
    ( on b130 b540 )
    ( on b607 b130 )
    ( on b233 b607 )
    ( clear b233 )
  )
  ( :goal
    ( and
      ( clear b145 )
    )
  )
)
