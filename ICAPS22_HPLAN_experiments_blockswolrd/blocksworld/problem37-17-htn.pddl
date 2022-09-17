( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b253 - block
    b122 - block
    b907 - block
    b518 - block
    b860 - block
    b443 - block
    b42 - block
    b539 - block
    b707 - block
    b346 - block
    b805 - block
    b396 - block
    b433 - block
    b386 - block
    b30 - block
    b417 - block
    b184 - block
    b90 - block
    b547 - block
    b300 - block
    b459 - block
    b897 - block
    b136 - block
    b49 - block
    b986 - block
    b6 - block
    b375 - block
    b281 - block
    b495 - block
    b171 - block
    b320 - block
    b959 - block
    b864 - block
    b16 - block
    b408 - block
    b407 - block
    b51 - block
    b3 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b253 )
    ( on b122 b253 )
    ( on b907 b122 )
    ( on b518 b907 )
    ( on b860 b518 )
    ( on b443 b860 )
    ( on b42 b443 )
    ( on b539 b42 )
    ( on b707 b539 )
    ( on b346 b707 )
    ( on b805 b346 )
    ( on b396 b805 )
    ( on b433 b396 )
    ( on b386 b433 )
    ( on b30 b386 )
    ( on b417 b30 )
    ( on b184 b417 )
    ( on b90 b184 )
    ( on b547 b90 )
    ( on b300 b547 )
    ( on b459 b300 )
    ( on b897 b459 )
    ( on b136 b897 )
    ( on b49 b136 )
    ( on b986 b49 )
    ( on b6 b986 )
    ( on b375 b6 )
    ( on b281 b375 )
    ( on b495 b281 )
    ( on b171 b495 )
    ( on b320 b171 )
    ( on b959 b320 )
    ( on b864 b959 )
    ( on b16 b864 )
    ( on b408 b16 )
    ( on b407 b408 )
    ( on b51 b407 )
    ( on b3 b51 )
    ( clear b3 )
  )
  ( :tasks
    ( Make-37Pile b122 b907 b518 b860 b443 b42 b539 b707 b346 b805 b396 b433 b386 b30 b417 b184 b90 b547 b300 b459 b897 b136 b49 b986 b6 b375 b281 b495 b171 b320 b959 b864 b16 b408 b407 b51 b3 )
  )
)
