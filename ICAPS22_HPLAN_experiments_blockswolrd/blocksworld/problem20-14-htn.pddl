( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b858 - block
    b133 - block
    b24 - block
    b975 - block
    b310 - block
    b879 - block
    b230 - block
    b587 - block
    b911 - block
    b311 - block
    b705 - block
    b543 - block
    b672 - block
    b185 - block
    b616 - block
    b155 - block
    b289 - block
    b373 - block
    b928 - block
    b969 - block
    b366 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b858 )
    ( on b133 b858 )
    ( on b24 b133 )
    ( on b975 b24 )
    ( on b310 b975 )
    ( on b879 b310 )
    ( on b230 b879 )
    ( on b587 b230 )
    ( on b911 b587 )
    ( on b311 b911 )
    ( on b705 b311 )
    ( on b543 b705 )
    ( on b672 b543 )
    ( on b185 b672 )
    ( on b616 b185 )
    ( on b155 b616 )
    ( on b289 b155 )
    ( on b373 b289 )
    ( on b928 b373 )
    ( on b969 b928 )
    ( on b366 b969 )
    ( clear b366 )
  )
  ( :tasks
    ( Make-20Pile b133 b24 b975 b310 b879 b230 b587 b911 b311 b705 b543 b672 b185 b616 b155 b289 b373 b928 b969 b366 )
  )
)
