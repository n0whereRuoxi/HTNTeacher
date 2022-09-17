( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b754 - block
    b942 - block
    b4 - block
    b784 - block
    b283 - block
    b25 - block
    b672 - block
    b748 - block
    b737 - block
    b562 - block
    b991 - block
    b728 - block
    b931 - block
    b775 - block
    b553 - block
    b376 - block
    b454 - block
    b524 - block
    b164 - block
    b953 - block
    b832 - block
    b666 - block
    b63 - block
    b821 - block
    b622 - block
    b384 - block
    b22 - block
    b785 - block
    b806 - block
    b803 - block
    b13 - block
    b75 - block
    b196 - block
    b726 - block
    b322 - block
    b734 - block
    b908 - block
    b602 - block
    b603 - block
    b284 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b754 )
    ( on b942 b754 )
    ( on b4 b942 )
    ( on b784 b4 )
    ( on b283 b784 )
    ( on b25 b283 )
    ( on b672 b25 )
    ( on b748 b672 )
    ( on b737 b748 )
    ( on b562 b737 )
    ( on b991 b562 )
    ( on b728 b991 )
    ( on b931 b728 )
    ( on b775 b931 )
    ( on b553 b775 )
    ( on b376 b553 )
    ( on b454 b376 )
    ( on b524 b454 )
    ( on b164 b524 )
    ( on b953 b164 )
    ( on b832 b953 )
    ( on b666 b832 )
    ( on b63 b666 )
    ( on b821 b63 )
    ( on b622 b821 )
    ( on b384 b622 )
    ( on b22 b384 )
    ( on b785 b22 )
    ( on b806 b785 )
    ( on b803 b806 )
    ( on b13 b803 )
    ( on b75 b13 )
    ( on b196 b75 )
    ( on b726 b196 )
    ( on b322 b726 )
    ( on b734 b322 )
    ( on b908 b734 )
    ( on b602 b908 )
    ( on b603 b602 )
    ( on b284 b603 )
    ( clear b284 )
  )
  ( :goal
    ( and
      ( clear b754 )
    )
  )
)
