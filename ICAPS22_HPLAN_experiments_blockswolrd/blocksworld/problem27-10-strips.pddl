( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b666 - block
    b58 - block
    b872 - block
    b294 - block
    b618 - block
    b23 - block
    b11 - block
    b348 - block
    b959 - block
    b297 - block
    b836 - block
    b990 - block
    b167 - block
    b995 - block
    b10 - block
    b215 - block
    b881 - block
    b909 - block
    b203 - block
    b989 - block
    b243 - block
    b86 - block
    b434 - block
    b184 - block
    b241 - block
    b505 - block
    b301 - block
    b277 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b666 )
    ( on b58 b666 )
    ( on b872 b58 )
    ( on b294 b872 )
    ( on b618 b294 )
    ( on b23 b618 )
    ( on b11 b23 )
    ( on b348 b11 )
    ( on b959 b348 )
    ( on b297 b959 )
    ( on b836 b297 )
    ( on b990 b836 )
    ( on b167 b990 )
    ( on b995 b167 )
    ( on b10 b995 )
    ( on b215 b10 )
    ( on b881 b215 )
    ( on b909 b881 )
    ( on b203 b909 )
    ( on b989 b203 )
    ( on b243 b989 )
    ( on b86 b243 )
    ( on b434 b86 )
    ( on b184 b434 )
    ( on b241 b184 )
    ( on b505 b241 )
    ( on b301 b505 )
    ( on b277 b301 )
    ( clear b277 )
  )
  ( :goal
    ( and
      ( clear b666 )
    )
  )
)
