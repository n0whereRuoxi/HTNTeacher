( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b528 - block
    b138 - block
    b906 - block
    b34 - block
    b108 - block
    b278 - block
    b210 - block
    b593 - block
    b579 - block
    b768 - block
    b550 - block
    b670 - block
    b13 - block
    b207 - block
    b945 - block
    b72 - block
    b465 - block
    b655 - block
    b688 - block
    b403 - block
    b767 - block
    b810 - block
    b669 - block
    b633 - block
    b571 - block
    b577 - block
    b508 - block
    b645 - block
    b534 - block
    b894 - block
    b455 - block
    b502 - block
    b779 - block
    b404 - block
    b353 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b528 )
    ( on b138 b528 )
    ( on b906 b138 )
    ( on b34 b906 )
    ( on b108 b34 )
    ( on b278 b108 )
    ( on b210 b278 )
    ( on b593 b210 )
    ( on b579 b593 )
    ( on b768 b579 )
    ( on b550 b768 )
    ( on b670 b550 )
    ( on b13 b670 )
    ( on b207 b13 )
    ( on b945 b207 )
    ( on b72 b945 )
    ( on b465 b72 )
    ( on b655 b465 )
    ( on b688 b655 )
    ( on b403 b688 )
    ( on b767 b403 )
    ( on b810 b767 )
    ( on b669 b810 )
    ( on b633 b669 )
    ( on b571 b633 )
    ( on b577 b571 )
    ( on b508 b577 )
    ( on b645 b508 )
    ( on b534 b645 )
    ( on b894 b534 )
    ( on b455 b894 )
    ( on b502 b455 )
    ( on b779 b502 )
    ( on b404 b779 )
    ( on b353 b404 )
    ( clear b353 )
  )
  ( :goal
    ( and
      ( clear b528 )
    )
  )
)
