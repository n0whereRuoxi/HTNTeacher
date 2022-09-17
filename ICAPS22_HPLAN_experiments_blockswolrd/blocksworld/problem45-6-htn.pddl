( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b33 - block
    b235 - block
    b430 - block
    b293 - block
    b857 - block
    b428 - block
    b737 - block
    b89 - block
    b62 - block
    b225 - block
    b17 - block
    b922 - block
    b868 - block
    b968 - block
    b163 - block
    b147 - block
    b455 - block
    b984 - block
    b331 - block
    b641 - block
    b495 - block
    b2 - block
    b357 - block
    b757 - block
    b474 - block
    b146 - block
    b612 - block
    b600 - block
    b687 - block
    b882 - block
    b446 - block
    b191 - block
    b645 - block
    b639 - block
    b667 - block
    b283 - block
    b787 - block
    b742 - block
    b90 - block
    b615 - block
    b237 - block
    b263 - block
    b727 - block
    b654 - block
    b583 - block
    b352 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b33 )
    ( on b235 b33 )
    ( on b430 b235 )
    ( on b293 b430 )
    ( on b857 b293 )
    ( on b428 b857 )
    ( on b737 b428 )
    ( on b89 b737 )
    ( on b62 b89 )
    ( on b225 b62 )
    ( on b17 b225 )
    ( on b922 b17 )
    ( on b868 b922 )
    ( on b968 b868 )
    ( on b163 b968 )
    ( on b147 b163 )
    ( on b455 b147 )
    ( on b984 b455 )
    ( on b331 b984 )
    ( on b641 b331 )
    ( on b495 b641 )
    ( on b2 b495 )
    ( on b357 b2 )
    ( on b757 b357 )
    ( on b474 b757 )
    ( on b146 b474 )
    ( on b612 b146 )
    ( on b600 b612 )
    ( on b687 b600 )
    ( on b882 b687 )
    ( on b446 b882 )
    ( on b191 b446 )
    ( on b645 b191 )
    ( on b639 b645 )
    ( on b667 b639 )
    ( on b283 b667 )
    ( on b787 b283 )
    ( on b742 b787 )
    ( on b90 b742 )
    ( on b615 b90 )
    ( on b237 b615 )
    ( on b263 b237 )
    ( on b727 b263 )
    ( on b654 b727 )
    ( on b583 b654 )
    ( on b352 b583 )
    ( clear b352 )
  )
  ( :tasks
    ( Make-45Pile b235 b430 b293 b857 b428 b737 b89 b62 b225 b17 b922 b868 b968 b163 b147 b455 b984 b331 b641 b495 b2 b357 b757 b474 b146 b612 b600 b687 b882 b446 b191 b645 b639 b667 b283 b787 b742 b90 b615 b237 b263 b727 b654 b583 b352 )
  )
)
