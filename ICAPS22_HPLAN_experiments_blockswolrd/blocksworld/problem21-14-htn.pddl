( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b100 - block
    b403 - block
    b242 - block
    b116 - block
    b431 - block
    b868 - block
    b79 - block
    b33 - block
    b24 - block
    b562 - block
    b527 - block
    b254 - block
    b735 - block
    b670 - block
    b490 - block
    b129 - block
    b469 - block
    b468 - block
    b634 - block
    b701 - block
    b238 - block
    b149 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b100 )
    ( on b403 b100 )
    ( on b242 b403 )
    ( on b116 b242 )
    ( on b431 b116 )
    ( on b868 b431 )
    ( on b79 b868 )
    ( on b33 b79 )
    ( on b24 b33 )
    ( on b562 b24 )
    ( on b527 b562 )
    ( on b254 b527 )
    ( on b735 b254 )
    ( on b670 b735 )
    ( on b490 b670 )
    ( on b129 b490 )
    ( on b469 b129 )
    ( on b468 b469 )
    ( on b634 b468 )
    ( on b701 b634 )
    ( on b238 b701 )
    ( on b149 b238 )
    ( clear b149 )
  )
  ( :tasks
    ( Make-21Pile b403 b242 b116 b431 b868 b79 b33 b24 b562 b527 b254 b735 b670 b490 b129 b469 b468 b634 b701 b238 b149 )
  )
)
