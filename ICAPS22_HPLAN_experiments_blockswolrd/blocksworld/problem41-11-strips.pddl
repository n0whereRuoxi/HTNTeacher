( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b875 - block
    b189 - block
    b906 - block
    b99 - block
    b570 - block
    b988 - block
    b566 - block
    b644 - block
    b332 - block
    b771 - block
    b469 - block
    b908 - block
    b941 - block
    b699 - block
    b671 - block
    b946 - block
    b647 - block
    b385 - block
    b581 - block
    b132 - block
    b292 - block
    b296 - block
    b870 - block
    b619 - block
    b340 - block
    b144 - block
    b369 - block
    b290 - block
    b164 - block
    b711 - block
    b177 - block
    b891 - block
    b831 - block
    b51 - block
    b405 - block
    b6 - block
    b257 - block
    b791 - block
    b66 - block
    b911 - block
    b734 - block
    b444 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b875 )
    ( on b189 b875 )
    ( on b906 b189 )
    ( on b99 b906 )
    ( on b570 b99 )
    ( on b988 b570 )
    ( on b566 b988 )
    ( on b644 b566 )
    ( on b332 b644 )
    ( on b771 b332 )
    ( on b469 b771 )
    ( on b908 b469 )
    ( on b941 b908 )
    ( on b699 b941 )
    ( on b671 b699 )
    ( on b946 b671 )
    ( on b647 b946 )
    ( on b385 b647 )
    ( on b581 b385 )
    ( on b132 b581 )
    ( on b292 b132 )
    ( on b296 b292 )
    ( on b870 b296 )
    ( on b619 b870 )
    ( on b340 b619 )
    ( on b144 b340 )
    ( on b369 b144 )
    ( on b290 b369 )
    ( on b164 b290 )
    ( on b711 b164 )
    ( on b177 b711 )
    ( on b891 b177 )
    ( on b831 b891 )
    ( on b51 b831 )
    ( on b405 b51 )
    ( on b6 b405 )
    ( on b257 b6 )
    ( on b791 b257 )
    ( on b66 b791 )
    ( on b911 b66 )
    ( on b734 b911 )
    ( on b444 b734 )
    ( clear b444 )
  )
  ( :goal
    ( and
      ( clear b875 )
    )
  )
)
