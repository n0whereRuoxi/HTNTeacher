( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b274 - block
    b112 - block
    b959 - block
    b289 - block
    b356 - block
    b918 - block
    b111 - block
    b636 - block
    b471 - block
    b622 - block
    b283 - block
    b557 - block
    b138 - block
    b578 - block
    b364 - block
    b392 - block
    b338 - block
    b249 - block
    b830 - block
    b440 - block
    b747 - block
    b16 - block
    b694 - block
    b208 - block
    b1 - block
    b810 - block
    b508 - block
    b165 - block
    b211 - block
    b150 - block
    b912 - block
    b204 - block
    b64 - block
    b137 - block
    b529 - block
    b890 - block
    b779 - block
    b405 - block
    b885 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b274 )
    ( on b112 b274 )
    ( on b959 b112 )
    ( on b289 b959 )
    ( on b356 b289 )
    ( on b918 b356 )
    ( on b111 b918 )
    ( on b636 b111 )
    ( on b471 b636 )
    ( on b622 b471 )
    ( on b283 b622 )
    ( on b557 b283 )
    ( on b138 b557 )
    ( on b578 b138 )
    ( on b364 b578 )
    ( on b392 b364 )
    ( on b338 b392 )
    ( on b249 b338 )
    ( on b830 b249 )
    ( on b440 b830 )
    ( on b747 b440 )
    ( on b16 b747 )
    ( on b694 b16 )
    ( on b208 b694 )
    ( on b1 b208 )
    ( on b810 b1 )
    ( on b508 b810 )
    ( on b165 b508 )
    ( on b211 b165 )
    ( on b150 b211 )
    ( on b912 b150 )
    ( on b204 b912 )
    ( on b64 b204 )
    ( on b137 b64 )
    ( on b529 b137 )
    ( on b890 b529 )
    ( on b779 b890 )
    ( on b405 b779 )
    ( on b885 b405 )
    ( clear b885 )
  )
  ( :goal
    ( and
      ( clear b274 )
    )
  )
)
