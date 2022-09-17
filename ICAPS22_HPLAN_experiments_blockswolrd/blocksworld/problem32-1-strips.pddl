( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b890 - block
    b84 - block
    b981 - block
    b780 - block
    b300 - block
    b14 - block
    b251 - block
    b641 - block
    b563 - block
    b626 - block
    b860 - block
    b755 - block
    b643 - block
    b654 - block
    b17 - block
    b406 - block
    b900 - block
    b839 - block
    b696 - block
    b808 - block
    b131 - block
    b983 - block
    b582 - block
    b885 - block
    b756 - block
    b777 - block
    b118 - block
    b551 - block
    b803 - block
    b409 - block
    b877 - block
    b719 - block
    b866 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b890 )
    ( on b84 b890 )
    ( on b981 b84 )
    ( on b780 b981 )
    ( on b300 b780 )
    ( on b14 b300 )
    ( on b251 b14 )
    ( on b641 b251 )
    ( on b563 b641 )
    ( on b626 b563 )
    ( on b860 b626 )
    ( on b755 b860 )
    ( on b643 b755 )
    ( on b654 b643 )
    ( on b17 b654 )
    ( on b406 b17 )
    ( on b900 b406 )
    ( on b839 b900 )
    ( on b696 b839 )
    ( on b808 b696 )
    ( on b131 b808 )
    ( on b983 b131 )
    ( on b582 b983 )
    ( on b885 b582 )
    ( on b756 b885 )
    ( on b777 b756 )
    ( on b118 b777 )
    ( on b551 b118 )
    ( on b803 b551 )
    ( on b409 b803 )
    ( on b877 b409 )
    ( on b719 b877 )
    ( on b866 b719 )
    ( clear b866 )
  )
  ( :goal
    ( and
      ( clear b890 )
    )
  )
)
