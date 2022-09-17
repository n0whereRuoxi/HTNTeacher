( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b440 - block
    b895 - block
    b208 - block
    b387 - block
    b177 - block
    b700 - block
    b484 - block
    b536 - block
    b666 - block
    b840 - block
    b523 - block
    b938 - block
    b967 - block
    b745 - block
    b371 - block
    b608 - block
    b19 - block
    b906 - block
    b379 - block
    b52 - block
    b726 - block
    b933 - block
    b104 - block
    b837 - block
    b956 - block
    b812 - block
    b89 - block
    b459 - block
    b948 - block
    b69 - block
    b364 - block
    b420 - block
    b588 - block
    b251 - block
    b366 - block
    b68 - block
    b528 - block
    b3 - block
    b219 - block
    b687 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b440 )
    ( on b895 b440 )
    ( on b208 b895 )
    ( on b387 b208 )
    ( on b177 b387 )
    ( on b700 b177 )
    ( on b484 b700 )
    ( on b536 b484 )
    ( on b666 b536 )
    ( on b840 b666 )
    ( on b523 b840 )
    ( on b938 b523 )
    ( on b967 b938 )
    ( on b745 b967 )
    ( on b371 b745 )
    ( on b608 b371 )
    ( on b19 b608 )
    ( on b906 b19 )
    ( on b379 b906 )
    ( on b52 b379 )
    ( on b726 b52 )
    ( on b933 b726 )
    ( on b104 b933 )
    ( on b837 b104 )
    ( on b956 b837 )
    ( on b812 b956 )
    ( on b89 b812 )
    ( on b459 b89 )
    ( on b948 b459 )
    ( on b69 b948 )
    ( on b364 b69 )
    ( on b420 b364 )
    ( on b588 b420 )
    ( on b251 b588 )
    ( on b366 b251 )
    ( on b68 b366 )
    ( on b528 b68 )
    ( on b3 b528 )
    ( on b219 b3 )
    ( on b687 b219 )
    ( clear b687 )
  )
  ( :goal
    ( and
      ( clear b440 )
    )
  )
)
