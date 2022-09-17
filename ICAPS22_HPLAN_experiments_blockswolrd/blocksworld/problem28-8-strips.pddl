( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b207 - block
    b534 - block
    b202 - block
    b484 - block
    b661 - block
    b602 - block
    b584 - block
    b588 - block
    b335 - block
    b635 - block
    b142 - block
    b460 - block
    b771 - block
    b885 - block
    b182 - block
    b147 - block
    b89 - block
    b877 - block
    b672 - block
    b88 - block
    b895 - block
    b314 - block
    b933 - block
    b2 - block
    b583 - block
    b750 - block
    b685 - block
    b772 - block
    b981 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b207 )
    ( on b534 b207 )
    ( on b202 b534 )
    ( on b484 b202 )
    ( on b661 b484 )
    ( on b602 b661 )
    ( on b584 b602 )
    ( on b588 b584 )
    ( on b335 b588 )
    ( on b635 b335 )
    ( on b142 b635 )
    ( on b460 b142 )
    ( on b771 b460 )
    ( on b885 b771 )
    ( on b182 b885 )
    ( on b147 b182 )
    ( on b89 b147 )
    ( on b877 b89 )
    ( on b672 b877 )
    ( on b88 b672 )
    ( on b895 b88 )
    ( on b314 b895 )
    ( on b933 b314 )
    ( on b2 b933 )
    ( on b583 b2 )
    ( on b750 b583 )
    ( on b685 b750 )
    ( on b772 b685 )
    ( on b981 b772 )
    ( clear b981 )
  )
  ( :goal
    ( and
      ( clear b207 )
    )
  )
)
