( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b156 - block
    b944 - block
    b795 - block
    b351 - block
    b305 - block
    b408 - block
    b41 - block
    b687 - block
    b316 - block
    b181 - block
    b309 - block
    b659 - block
    b534 - block
    b1 - block
    b184 - block
    b841 - block
    b176 - block
    b363 - block
    b179 - block
    b752 - block
    b500 - block
    b690 - block
    b469 - block
    b230 - block
    b656 - block
    b669 - block
    b376 - block
    b175 - block
    b867 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b156 )
    ( on b944 b156 )
    ( on b795 b944 )
    ( on b351 b795 )
    ( on b305 b351 )
    ( on b408 b305 )
    ( on b41 b408 )
    ( on b687 b41 )
    ( on b316 b687 )
    ( on b181 b316 )
    ( on b309 b181 )
    ( on b659 b309 )
    ( on b534 b659 )
    ( on b1 b534 )
    ( on b184 b1 )
    ( on b841 b184 )
    ( on b176 b841 )
    ( on b363 b176 )
    ( on b179 b363 )
    ( on b752 b179 )
    ( on b500 b752 )
    ( on b690 b500 )
    ( on b469 b690 )
    ( on b230 b469 )
    ( on b656 b230 )
    ( on b669 b656 )
    ( on b376 b669 )
    ( on b175 b376 )
    ( on b867 b175 )
    ( clear b867 )
  )
  ( :tasks
    ( Make-28Pile b944 b795 b351 b305 b408 b41 b687 b316 b181 b309 b659 b534 b1 b184 b841 b176 b363 b179 b752 b500 b690 b469 b230 b656 b669 b376 b175 b867 )
  )
)
