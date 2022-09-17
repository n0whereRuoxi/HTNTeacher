( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b866 - block
    b117 - block
    b76 - block
    b522 - block
    b800 - block
    b552 - block
    b246 - block
    b623 - block
    b562 - block
    b910 - block
    b790 - block
    b144 - block
    b343 - block
    b556 - block
    b127 - block
    b657 - block
    b394 - block
    b27 - block
    b728 - block
    b940 - block
    b843 - block
    b34 - block
    b967 - block
    b893 - block
    b781 - block
    b648 - block
    b530 - block
    b17 - block
    b114 - block
    b827 - block
    b473 - block
    b714 - block
    b294 - block
    b616 - block
    b758 - block
    b10 - block
    b880 - block
    b141 - block
    b961 - block
    b172 - block
    b469 - block
    b88 - block
    b649 - block
    b786 - block
    b686 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b866 )
    ( on b117 b866 )
    ( on b76 b117 )
    ( on b522 b76 )
    ( on b800 b522 )
    ( on b552 b800 )
    ( on b246 b552 )
    ( on b623 b246 )
    ( on b562 b623 )
    ( on b910 b562 )
    ( on b790 b910 )
    ( on b144 b790 )
    ( on b343 b144 )
    ( on b556 b343 )
    ( on b127 b556 )
    ( on b657 b127 )
    ( on b394 b657 )
    ( on b27 b394 )
    ( on b728 b27 )
    ( on b940 b728 )
    ( on b843 b940 )
    ( on b34 b843 )
    ( on b967 b34 )
    ( on b893 b967 )
    ( on b781 b893 )
    ( on b648 b781 )
    ( on b530 b648 )
    ( on b17 b530 )
    ( on b114 b17 )
    ( on b827 b114 )
    ( on b473 b827 )
    ( on b714 b473 )
    ( on b294 b714 )
    ( on b616 b294 )
    ( on b758 b616 )
    ( on b10 b758 )
    ( on b880 b10 )
    ( on b141 b880 )
    ( on b961 b141 )
    ( on b172 b961 )
    ( on b469 b172 )
    ( on b88 b469 )
    ( on b649 b88 )
    ( on b786 b649 )
    ( on b686 b786 )
    ( clear b686 )
  )
  ( :goal
    ( and
      ( clear b866 )
    )
  )
)
