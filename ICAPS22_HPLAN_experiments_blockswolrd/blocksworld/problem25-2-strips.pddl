( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b110 - block
    b251 - block
    b793 - block
    b715 - block
    b567 - block
    b851 - block
    b698 - block
    b908 - block
    b181 - block
    b594 - block
    b835 - block
    b582 - block
    b131 - block
    b628 - block
    b63 - block
    b683 - block
    b121 - block
    b175 - block
    b117 - block
    b232 - block
    b940 - block
    b342 - block
    b928 - block
    b598 - block
    b211 - block
    b778 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b110 )
    ( on b251 b110 )
    ( on b793 b251 )
    ( on b715 b793 )
    ( on b567 b715 )
    ( on b851 b567 )
    ( on b698 b851 )
    ( on b908 b698 )
    ( on b181 b908 )
    ( on b594 b181 )
    ( on b835 b594 )
    ( on b582 b835 )
    ( on b131 b582 )
    ( on b628 b131 )
    ( on b63 b628 )
    ( on b683 b63 )
    ( on b121 b683 )
    ( on b175 b121 )
    ( on b117 b175 )
    ( on b232 b117 )
    ( on b940 b232 )
    ( on b342 b940 )
    ( on b928 b342 )
    ( on b598 b928 )
    ( on b211 b598 )
    ( on b778 b211 )
    ( clear b778 )
  )
  ( :goal
    ( and
      ( clear b110 )
    )
  )
)
