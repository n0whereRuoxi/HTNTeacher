( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b831 - block
    b771 - block
    b679 - block
    b533 - block
    b80 - block
    b527 - block
    b211 - block
    b417 - block
    b914 - block
    b346 - block
    b806 - block
    b5 - block
    b503 - block
    b792 - block
    b76 - block
    b459 - block
    b120 - block
    b523 - block
    b94 - block
    b275 - block
    b618 - block
    b484 - block
    b650 - block
    b136 - block
    b760 - block
    b928 - block
    b22 - block
    b773 - block
    b946 - block
    b549 - block
    b994 - block
    b464 - block
    b545 - block
    b546 - block
    b70 - block
    b491 - block
    b543 - block
    b749 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b831 )
    ( on b771 b831 )
    ( on b679 b771 )
    ( on b533 b679 )
    ( on b80 b533 )
    ( on b527 b80 )
    ( on b211 b527 )
    ( on b417 b211 )
    ( on b914 b417 )
    ( on b346 b914 )
    ( on b806 b346 )
    ( on b5 b806 )
    ( on b503 b5 )
    ( on b792 b503 )
    ( on b76 b792 )
    ( on b459 b76 )
    ( on b120 b459 )
    ( on b523 b120 )
    ( on b94 b523 )
    ( on b275 b94 )
    ( on b618 b275 )
    ( on b484 b618 )
    ( on b650 b484 )
    ( on b136 b650 )
    ( on b760 b136 )
    ( on b928 b760 )
    ( on b22 b928 )
    ( on b773 b22 )
    ( on b946 b773 )
    ( on b549 b946 )
    ( on b994 b549 )
    ( on b464 b994 )
    ( on b545 b464 )
    ( on b546 b545 )
    ( on b70 b546 )
    ( on b491 b70 )
    ( on b543 b491 )
    ( on b749 b543 )
    ( clear b749 )
  )
  ( :goal
    ( and
      ( clear b831 )
    )
  )
)
