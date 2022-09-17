( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b905 - block
    b741 - block
    b748 - block
    b740 - block
    b851 - block
    b610 - block
    b359 - block
    b971 - block
    b438 - block
    b660 - block
    b924 - block
    b542 - block
    b734 - block
    b444 - block
    b669 - block
    b1 - block
    b852 - block
    b761 - block
    b933 - block
    b929 - block
    b869 - block
    b934 - block
    b593 - block
    b299 - block
    b890 - block
    b276 - block
    b619 - block
    b543 - block
    b621 - block
    b273 - block
    b82 - block
    b218 - block
    b707 - block
    b815 - block
    b649 - block
    b57 - block
    b699 - block
    b294 - block
    b856 - block
    b791 - block
    b386 - block
    b818 - block
    b412 - block
    b331 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b905 )
    ( on b741 b905 )
    ( on b748 b741 )
    ( on b740 b748 )
    ( on b851 b740 )
    ( on b610 b851 )
    ( on b359 b610 )
    ( on b971 b359 )
    ( on b438 b971 )
    ( on b660 b438 )
    ( on b924 b660 )
    ( on b542 b924 )
    ( on b734 b542 )
    ( on b444 b734 )
    ( on b669 b444 )
    ( on b1 b669 )
    ( on b852 b1 )
    ( on b761 b852 )
    ( on b933 b761 )
    ( on b929 b933 )
    ( on b869 b929 )
    ( on b934 b869 )
    ( on b593 b934 )
    ( on b299 b593 )
    ( on b890 b299 )
    ( on b276 b890 )
    ( on b619 b276 )
    ( on b543 b619 )
    ( on b621 b543 )
    ( on b273 b621 )
    ( on b82 b273 )
    ( on b218 b82 )
    ( on b707 b218 )
    ( on b815 b707 )
    ( on b649 b815 )
    ( on b57 b649 )
    ( on b699 b57 )
    ( on b294 b699 )
    ( on b856 b294 )
    ( on b791 b856 )
    ( on b386 b791 )
    ( on b818 b386 )
    ( on b412 b818 )
    ( on b331 b412 )
    ( clear b331 )
  )
  ( :goal
    ( and
      ( clear b905 )
    )
  )
)
