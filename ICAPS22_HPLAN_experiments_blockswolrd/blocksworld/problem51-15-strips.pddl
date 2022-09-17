( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b567 - block
    b833 - block
    b559 - block
    b655 - block
    b385 - block
    b618 - block
    b330 - block
    b61 - block
    b632 - block
    b852 - block
    b190 - block
    b985 - block
    b29 - block
    b540 - block
    b185 - block
    b270 - block
    b203 - block
    b210 - block
    b672 - block
    b251 - block
    b193 - block
    b292 - block
    b587 - block
    b750 - block
    b467 - block
    b932 - block
    b713 - block
    b453 - block
    b246 - block
    b268 - block
    b37 - block
    b588 - block
    b371 - block
    b617 - block
    b677 - block
    b218 - block
    b630 - block
    b59 - block
    b528 - block
    b896 - block
    b201 - block
    b26 - block
    b583 - block
    b204 - block
    b448 - block
    b459 - block
    b387 - block
    b104 - block
    b364 - block
    b870 - block
    b612 - block
    b857 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b567 )
    ( on b833 b567 )
    ( on b559 b833 )
    ( on b655 b559 )
    ( on b385 b655 )
    ( on b618 b385 )
    ( on b330 b618 )
    ( on b61 b330 )
    ( on b632 b61 )
    ( on b852 b632 )
    ( on b190 b852 )
    ( on b985 b190 )
    ( on b29 b985 )
    ( on b540 b29 )
    ( on b185 b540 )
    ( on b270 b185 )
    ( on b203 b270 )
    ( on b210 b203 )
    ( on b672 b210 )
    ( on b251 b672 )
    ( on b193 b251 )
    ( on b292 b193 )
    ( on b587 b292 )
    ( on b750 b587 )
    ( on b467 b750 )
    ( on b932 b467 )
    ( on b713 b932 )
    ( on b453 b713 )
    ( on b246 b453 )
    ( on b268 b246 )
    ( on b37 b268 )
    ( on b588 b37 )
    ( on b371 b588 )
    ( on b617 b371 )
    ( on b677 b617 )
    ( on b218 b677 )
    ( on b630 b218 )
    ( on b59 b630 )
    ( on b528 b59 )
    ( on b896 b528 )
    ( on b201 b896 )
    ( on b26 b201 )
    ( on b583 b26 )
    ( on b204 b583 )
    ( on b448 b204 )
    ( on b459 b448 )
    ( on b387 b459 )
    ( on b104 b387 )
    ( on b364 b104 )
    ( on b870 b364 )
    ( on b612 b870 )
    ( on b857 b612 )
    ( clear b857 )
  )
  ( :goal
    ( and
      ( clear b567 )
    )
  )
)
