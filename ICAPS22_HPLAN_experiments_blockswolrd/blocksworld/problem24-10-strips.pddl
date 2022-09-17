( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b998 - block
    b152 - block
    b612 - block
    b741 - block
    b941 - block
    b868 - block
    b49 - block
    b342 - block
    b795 - block
    b227 - block
    b175 - block
    b568 - block
    b611 - block
    b735 - block
    b570 - block
    b446 - block
    b681 - block
    b953 - block
    b457 - block
    b282 - block
    b703 - block
    b262 - block
    b4 - block
    b928 - block
    b237 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b998 )
    ( on b152 b998 )
    ( on b612 b152 )
    ( on b741 b612 )
    ( on b941 b741 )
    ( on b868 b941 )
    ( on b49 b868 )
    ( on b342 b49 )
    ( on b795 b342 )
    ( on b227 b795 )
    ( on b175 b227 )
    ( on b568 b175 )
    ( on b611 b568 )
    ( on b735 b611 )
    ( on b570 b735 )
    ( on b446 b570 )
    ( on b681 b446 )
    ( on b953 b681 )
    ( on b457 b953 )
    ( on b282 b457 )
    ( on b703 b282 )
    ( on b262 b703 )
    ( on b4 b262 )
    ( on b928 b4 )
    ( on b237 b928 )
    ( clear b237 )
  )
  ( :goal
    ( and
      ( clear b998 )
    )
  )
)
