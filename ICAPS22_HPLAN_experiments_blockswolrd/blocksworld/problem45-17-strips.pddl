( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b304 - block
    b497 - block
    b286 - block
    b305 - block
    b665 - block
    b755 - block
    b646 - block
    b135 - block
    b392 - block
    b652 - block
    b998 - block
    b257 - block
    b749 - block
    b838 - block
    b886 - block
    b535 - block
    b241 - block
    b195 - block
    b613 - block
    b356 - block
    b905 - block
    b346 - block
    b719 - block
    b789 - block
    b638 - block
    b918 - block
    b208 - block
    b808 - block
    b498 - block
    b781 - block
    b644 - block
    b834 - block
    b41 - block
    b778 - block
    b829 - block
    b760 - block
    b607 - block
    b506 - block
    b985 - block
    b295 - block
    b581 - block
    b843 - block
    b989 - block
    b319 - block
    b394 - block
    b382 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b304 )
    ( on b497 b304 )
    ( on b286 b497 )
    ( on b305 b286 )
    ( on b665 b305 )
    ( on b755 b665 )
    ( on b646 b755 )
    ( on b135 b646 )
    ( on b392 b135 )
    ( on b652 b392 )
    ( on b998 b652 )
    ( on b257 b998 )
    ( on b749 b257 )
    ( on b838 b749 )
    ( on b886 b838 )
    ( on b535 b886 )
    ( on b241 b535 )
    ( on b195 b241 )
    ( on b613 b195 )
    ( on b356 b613 )
    ( on b905 b356 )
    ( on b346 b905 )
    ( on b719 b346 )
    ( on b789 b719 )
    ( on b638 b789 )
    ( on b918 b638 )
    ( on b208 b918 )
    ( on b808 b208 )
    ( on b498 b808 )
    ( on b781 b498 )
    ( on b644 b781 )
    ( on b834 b644 )
    ( on b41 b834 )
    ( on b778 b41 )
    ( on b829 b778 )
    ( on b760 b829 )
    ( on b607 b760 )
    ( on b506 b607 )
    ( on b985 b506 )
    ( on b295 b985 )
    ( on b581 b295 )
    ( on b843 b581 )
    ( on b989 b843 )
    ( on b319 b989 )
    ( on b394 b319 )
    ( on b382 b394 )
    ( clear b382 )
  )
  ( :goal
    ( and
      ( clear b304 )
    )
  )
)
