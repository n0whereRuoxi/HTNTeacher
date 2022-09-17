( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b414 - block
    b573 - block
    b924 - block
    b791 - block
    b329 - block
    b809 - block
    b967 - block
    b587 - block
    b593 - block
    b75 - block
    b95 - block
    b783 - block
    b930 - block
    b116 - block
    b125 - block
    b646 - block
    b457 - block
    b60 - block
    b12 - block
    b789 - block
    b776 - block
    b433 - block
    b340 - block
    b400 - block
    b424 - block
    b861 - block
    b624 - block
    b44 - block
    b774 - block
    b927 - block
    b640 - block
    b670 - block
    b61 - block
    b387 - block
    b611 - block
    b997 - block
    b306 - block
    b514 - block
    b157 - block
    b913 - block
    b792 - block
    b955 - block
    b542 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b414 )
    ( on b573 b414 )
    ( on b924 b573 )
    ( on b791 b924 )
    ( on b329 b791 )
    ( on b809 b329 )
    ( on b967 b809 )
    ( on b587 b967 )
    ( on b593 b587 )
    ( on b75 b593 )
    ( on b95 b75 )
    ( on b783 b95 )
    ( on b930 b783 )
    ( on b116 b930 )
    ( on b125 b116 )
    ( on b646 b125 )
    ( on b457 b646 )
    ( on b60 b457 )
    ( on b12 b60 )
    ( on b789 b12 )
    ( on b776 b789 )
    ( on b433 b776 )
    ( on b340 b433 )
    ( on b400 b340 )
    ( on b424 b400 )
    ( on b861 b424 )
    ( on b624 b861 )
    ( on b44 b624 )
    ( on b774 b44 )
    ( on b927 b774 )
    ( on b640 b927 )
    ( on b670 b640 )
    ( on b61 b670 )
    ( on b387 b61 )
    ( on b611 b387 )
    ( on b997 b611 )
    ( on b306 b997 )
    ( on b514 b306 )
    ( on b157 b514 )
    ( on b913 b157 )
    ( on b792 b913 )
    ( on b955 b792 )
    ( on b542 b955 )
    ( clear b542 )
  )
  ( :tasks
    ( Make-42Pile b573 b924 b791 b329 b809 b967 b587 b593 b75 b95 b783 b930 b116 b125 b646 b457 b60 b12 b789 b776 b433 b340 b400 b424 b861 b624 b44 b774 b927 b640 b670 b61 b387 b611 b997 b306 b514 b157 b913 b792 b955 b542 )
  )
)
