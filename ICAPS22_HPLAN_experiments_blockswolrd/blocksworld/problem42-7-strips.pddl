( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b99 - block
    b590 - block
    b395 - block
    b241 - block
    b473 - block
    b289 - block
    b225 - block
    b599 - block
    b543 - block
    b949 - block
    b795 - block
    b676 - block
    b61 - block
    b752 - block
    b360 - block
    b920 - block
    b942 - block
    b977 - block
    b696 - block
    b683 - block
    b952 - block
    b491 - block
    b251 - block
    b513 - block
    b943 - block
    b143 - block
    b773 - block
    b466 - block
    b748 - block
    b358 - block
    b879 - block
    b174 - block
    b640 - block
    b885 - block
    b2 - block
    b974 - block
    b951 - block
    b447 - block
    b845 - block
    b454 - block
    b812 - block
    b88 - block
    b294 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b99 )
    ( on b590 b99 )
    ( on b395 b590 )
    ( on b241 b395 )
    ( on b473 b241 )
    ( on b289 b473 )
    ( on b225 b289 )
    ( on b599 b225 )
    ( on b543 b599 )
    ( on b949 b543 )
    ( on b795 b949 )
    ( on b676 b795 )
    ( on b61 b676 )
    ( on b752 b61 )
    ( on b360 b752 )
    ( on b920 b360 )
    ( on b942 b920 )
    ( on b977 b942 )
    ( on b696 b977 )
    ( on b683 b696 )
    ( on b952 b683 )
    ( on b491 b952 )
    ( on b251 b491 )
    ( on b513 b251 )
    ( on b943 b513 )
    ( on b143 b943 )
    ( on b773 b143 )
    ( on b466 b773 )
    ( on b748 b466 )
    ( on b358 b748 )
    ( on b879 b358 )
    ( on b174 b879 )
    ( on b640 b174 )
    ( on b885 b640 )
    ( on b2 b885 )
    ( on b974 b2 )
    ( on b951 b974 )
    ( on b447 b951 )
    ( on b845 b447 )
    ( on b454 b845 )
    ( on b812 b454 )
    ( on b88 b812 )
    ( on b294 b88 )
    ( clear b294 )
  )
  ( :goal
    ( and
      ( clear b99 )
    )
  )
)
