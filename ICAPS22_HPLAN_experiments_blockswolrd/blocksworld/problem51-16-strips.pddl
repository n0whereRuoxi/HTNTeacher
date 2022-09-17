( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b966 - block
    b825 - block
    b710 - block
    b477 - block
    b986 - block
    b137 - block
    b68 - block
    b999 - block
    b700 - block
    b807 - block
    b156 - block
    b34 - block
    b444 - block
    b440 - block
    b238 - block
    b267 - block
    b89 - block
    b243 - block
    b545 - block
    b971 - block
    b380 - block
    b510 - block
    b395 - block
    b778 - block
    b616 - block
    b618 - block
    b324 - block
    b500 - block
    b773 - block
    b564 - block
    b3 - block
    b735 - block
    b446 - block
    b653 - block
    b888 - block
    b234 - block
    b567 - block
    b297 - block
    b298 - block
    b786 - block
    b861 - block
    b376 - block
    b35 - block
    b933 - block
    b186 - block
    b457 - block
    b265 - block
    b663 - block
    b334 - block
    b954 - block
    b323 - block
    b554 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b966 )
    ( on b825 b966 )
    ( on b710 b825 )
    ( on b477 b710 )
    ( on b986 b477 )
    ( on b137 b986 )
    ( on b68 b137 )
    ( on b999 b68 )
    ( on b700 b999 )
    ( on b807 b700 )
    ( on b156 b807 )
    ( on b34 b156 )
    ( on b444 b34 )
    ( on b440 b444 )
    ( on b238 b440 )
    ( on b267 b238 )
    ( on b89 b267 )
    ( on b243 b89 )
    ( on b545 b243 )
    ( on b971 b545 )
    ( on b380 b971 )
    ( on b510 b380 )
    ( on b395 b510 )
    ( on b778 b395 )
    ( on b616 b778 )
    ( on b618 b616 )
    ( on b324 b618 )
    ( on b500 b324 )
    ( on b773 b500 )
    ( on b564 b773 )
    ( on b3 b564 )
    ( on b735 b3 )
    ( on b446 b735 )
    ( on b653 b446 )
    ( on b888 b653 )
    ( on b234 b888 )
    ( on b567 b234 )
    ( on b297 b567 )
    ( on b298 b297 )
    ( on b786 b298 )
    ( on b861 b786 )
    ( on b376 b861 )
    ( on b35 b376 )
    ( on b933 b35 )
    ( on b186 b933 )
    ( on b457 b186 )
    ( on b265 b457 )
    ( on b663 b265 )
    ( on b334 b663 )
    ( on b954 b334 )
    ( on b323 b954 )
    ( on b554 b323 )
    ( clear b554 )
  )
  ( :goal
    ( and
      ( clear b966 )
    )
  )
)
