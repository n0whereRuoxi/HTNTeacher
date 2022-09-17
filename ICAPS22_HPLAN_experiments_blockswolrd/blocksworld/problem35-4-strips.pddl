( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b453 - block
    b519 - block
    b888 - block
    b384 - block
    b584 - block
    b5 - block
    b452 - block
    b455 - block
    b582 - block
    b306 - block
    b276 - block
    b567 - block
    b849 - block
    b435 - block
    b319 - block
    b618 - block
    b239 - block
    b166 - block
    b825 - block
    b690 - block
    b61 - block
    b482 - block
    b287 - block
    b711 - block
    b268 - block
    b139 - block
    b495 - block
    b428 - block
    b809 - block
    b37 - block
    b460 - block
    b447 - block
    b684 - block
    b527 - block
    b90 - block
    b589 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b453 )
    ( on b519 b453 )
    ( on b888 b519 )
    ( on b384 b888 )
    ( on b584 b384 )
    ( on b5 b584 )
    ( on b452 b5 )
    ( on b455 b452 )
    ( on b582 b455 )
    ( on b306 b582 )
    ( on b276 b306 )
    ( on b567 b276 )
    ( on b849 b567 )
    ( on b435 b849 )
    ( on b319 b435 )
    ( on b618 b319 )
    ( on b239 b618 )
    ( on b166 b239 )
    ( on b825 b166 )
    ( on b690 b825 )
    ( on b61 b690 )
    ( on b482 b61 )
    ( on b287 b482 )
    ( on b711 b287 )
    ( on b268 b711 )
    ( on b139 b268 )
    ( on b495 b139 )
    ( on b428 b495 )
    ( on b809 b428 )
    ( on b37 b809 )
    ( on b460 b37 )
    ( on b447 b460 )
    ( on b684 b447 )
    ( on b527 b684 )
    ( on b90 b527 )
    ( on b589 b90 )
    ( clear b589 )
  )
  ( :goal
    ( and
      ( clear b453 )
    )
  )
)
