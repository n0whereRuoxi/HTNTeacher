( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b755 - block
    b164 - block
    b636 - block
    b501 - block
    b64 - block
    b330 - block
    b129 - block
    b345 - block
    b67 - block
    b395 - block
    b652 - block
    b209 - block
    b892 - block
    b718 - block
    b300 - block
    b70 - block
    b31 - block
    b605 - block
    b656 - block
    b705 - block
    b294 - block
    b455 - block
    b784 - block
    b405 - block
    b802 - block
    b484 - block
    b93 - block
    b749 - block
    b910 - block
    b96 - block
    b849 - block
    b437 - block
    b142 - block
    b334 - block
    b538 - block
    b970 - block
    b819 - block
    b948 - block
    b415 - block
    b482 - block
    b343 - block
    b558 - block
    b159 - block
    b326 - block
    b914 - block
    b103 - block
    b934 - block
    b576 - block
    b494 - block
    b191 - block
    b527 - block
    b170 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b755 )
    ( on b164 b755 )
    ( on b636 b164 )
    ( on b501 b636 )
    ( on b64 b501 )
    ( on b330 b64 )
    ( on b129 b330 )
    ( on b345 b129 )
    ( on b67 b345 )
    ( on b395 b67 )
    ( on b652 b395 )
    ( on b209 b652 )
    ( on b892 b209 )
    ( on b718 b892 )
    ( on b300 b718 )
    ( on b70 b300 )
    ( on b31 b70 )
    ( on b605 b31 )
    ( on b656 b605 )
    ( on b705 b656 )
    ( on b294 b705 )
    ( on b455 b294 )
    ( on b784 b455 )
    ( on b405 b784 )
    ( on b802 b405 )
    ( on b484 b802 )
    ( on b93 b484 )
    ( on b749 b93 )
    ( on b910 b749 )
    ( on b96 b910 )
    ( on b849 b96 )
    ( on b437 b849 )
    ( on b142 b437 )
    ( on b334 b142 )
    ( on b538 b334 )
    ( on b970 b538 )
    ( on b819 b970 )
    ( on b948 b819 )
    ( on b415 b948 )
    ( on b482 b415 )
    ( on b343 b482 )
    ( on b558 b343 )
    ( on b159 b558 )
    ( on b326 b159 )
    ( on b914 b326 )
    ( on b103 b914 )
    ( on b934 b103 )
    ( on b576 b934 )
    ( on b494 b576 )
    ( on b191 b494 )
    ( on b527 b191 )
    ( on b170 b527 )
    ( clear b170 )
  )
  ( :goal
    ( and
      ( clear b755 )
    )
  )
)
