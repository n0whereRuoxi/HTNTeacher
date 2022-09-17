( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b787 - block
    b69 - block
    b343 - block
    b969 - block
    b784 - block
    b30 - block
    b371 - block
    b434 - block
    b196 - block
    b424 - block
    b878 - block
    b374 - block
    b336 - block
    b104 - block
    b299 - block
    b487 - block
    b422 - block
    b324 - block
    b22 - block
    b576 - block
    b729 - block
    b670 - block
    b789 - block
    b850 - block
    b852 - block
    b418 - block
    b402 - block
    b40 - block
    b591 - block
    b429 - block
    b511 - block
    b652 - block
    b658 - block
    b278 - block
    b807 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b787 )
    ( on b69 b787 )
    ( on b343 b69 )
    ( on b969 b343 )
    ( on b784 b969 )
    ( on b30 b784 )
    ( on b371 b30 )
    ( on b434 b371 )
    ( on b196 b434 )
    ( on b424 b196 )
    ( on b878 b424 )
    ( on b374 b878 )
    ( on b336 b374 )
    ( on b104 b336 )
    ( on b299 b104 )
    ( on b487 b299 )
    ( on b422 b487 )
    ( on b324 b422 )
    ( on b22 b324 )
    ( on b576 b22 )
    ( on b729 b576 )
    ( on b670 b729 )
    ( on b789 b670 )
    ( on b850 b789 )
    ( on b852 b850 )
    ( on b418 b852 )
    ( on b402 b418 )
    ( on b40 b402 )
    ( on b591 b40 )
    ( on b429 b591 )
    ( on b511 b429 )
    ( on b652 b511 )
    ( on b658 b652 )
    ( on b278 b658 )
    ( on b807 b278 )
    ( clear b807 )
  )
  ( :tasks
    ( Make-34Pile b69 b343 b969 b784 b30 b371 b434 b196 b424 b878 b374 b336 b104 b299 b487 b422 b324 b22 b576 b729 b670 b789 b850 b852 b418 b402 b40 b591 b429 b511 b652 b658 b278 b807 )
  )
)
