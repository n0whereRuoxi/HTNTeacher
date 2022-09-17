( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b622 - block
    b696 - block
    b499 - block
    b670 - block
    b794 - block
    b359 - block
    b796 - block
    b15 - block
    b783 - block
    b143 - block
    b295 - block
    b39 - block
    b717 - block
    b346 - block
    b229 - block
    b601 - block
    b748 - block
    b989 - block
    b546 - block
    b406 - block
    b711 - block
    b328 - block
    b743 - block
    b363 - block
    b971 - block
    b38 - block
    b82 - block
    b988 - block
    b802 - block
    b567 - block
    b849 - block
    b79 - block
    b34 - block
    b740 - block
    b282 - block
    b207 - block
    b603 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b622 )
    ( on b696 b622 )
    ( on b499 b696 )
    ( on b670 b499 )
    ( on b794 b670 )
    ( on b359 b794 )
    ( on b796 b359 )
    ( on b15 b796 )
    ( on b783 b15 )
    ( on b143 b783 )
    ( on b295 b143 )
    ( on b39 b295 )
    ( on b717 b39 )
    ( on b346 b717 )
    ( on b229 b346 )
    ( on b601 b229 )
    ( on b748 b601 )
    ( on b989 b748 )
    ( on b546 b989 )
    ( on b406 b546 )
    ( on b711 b406 )
    ( on b328 b711 )
    ( on b743 b328 )
    ( on b363 b743 )
    ( on b971 b363 )
    ( on b38 b971 )
    ( on b82 b38 )
    ( on b988 b82 )
    ( on b802 b988 )
    ( on b567 b802 )
    ( on b849 b567 )
    ( on b79 b849 )
    ( on b34 b79 )
    ( on b740 b34 )
    ( on b282 b740 )
    ( on b207 b282 )
    ( on b603 b207 )
    ( clear b603 )
  )
  ( :tasks
    ( Make-36Pile b696 b499 b670 b794 b359 b796 b15 b783 b143 b295 b39 b717 b346 b229 b601 b748 b989 b546 b406 b711 b328 b743 b363 b971 b38 b82 b988 b802 b567 b849 b79 b34 b740 b282 b207 b603 )
  )
)
