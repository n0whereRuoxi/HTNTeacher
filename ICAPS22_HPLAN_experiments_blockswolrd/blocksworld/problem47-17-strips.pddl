( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b12 - block
    b202 - block
    b669 - block
    b912 - block
    b388 - block
    b961 - block
    b977 - block
    b390 - block
    b54 - block
    b752 - block
    b254 - block
    b522 - block
    b603 - block
    b348 - block
    b315 - block
    b461 - block
    b401 - block
    b152 - block
    b62 - block
    b88 - block
    b472 - block
    b718 - block
    b657 - block
    b725 - block
    b803 - block
    b158 - block
    b338 - block
    b532 - block
    b503 - block
    b64 - block
    b934 - block
    b927 - block
    b420 - block
    b719 - block
    b212 - block
    b316 - block
    b267 - block
    b541 - block
    b992 - block
    b1 - block
    b317 - block
    b230 - block
    b353 - block
    b568 - block
    b125 - block
    b958 - block
    b215 - block
    b271 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b12 )
    ( on b202 b12 )
    ( on b669 b202 )
    ( on b912 b669 )
    ( on b388 b912 )
    ( on b961 b388 )
    ( on b977 b961 )
    ( on b390 b977 )
    ( on b54 b390 )
    ( on b752 b54 )
    ( on b254 b752 )
    ( on b522 b254 )
    ( on b603 b522 )
    ( on b348 b603 )
    ( on b315 b348 )
    ( on b461 b315 )
    ( on b401 b461 )
    ( on b152 b401 )
    ( on b62 b152 )
    ( on b88 b62 )
    ( on b472 b88 )
    ( on b718 b472 )
    ( on b657 b718 )
    ( on b725 b657 )
    ( on b803 b725 )
    ( on b158 b803 )
    ( on b338 b158 )
    ( on b532 b338 )
    ( on b503 b532 )
    ( on b64 b503 )
    ( on b934 b64 )
    ( on b927 b934 )
    ( on b420 b927 )
    ( on b719 b420 )
    ( on b212 b719 )
    ( on b316 b212 )
    ( on b267 b316 )
    ( on b541 b267 )
    ( on b992 b541 )
    ( on b1 b992 )
    ( on b317 b1 )
    ( on b230 b317 )
    ( on b353 b230 )
    ( on b568 b353 )
    ( on b125 b568 )
    ( on b958 b125 )
    ( on b215 b958 )
    ( on b271 b215 )
    ( clear b271 )
  )
  ( :goal
    ( and
      ( clear b12 )
    )
  )
)
