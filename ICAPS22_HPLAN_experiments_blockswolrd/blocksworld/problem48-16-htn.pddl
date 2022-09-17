( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b871 - block
    b623 - block
    b175 - block
    b246 - block
    b133 - block
    b564 - block
    b78 - block
    b161 - block
    b230 - block
    b560 - block
    b271 - block
    b499 - block
    b191 - block
    b857 - block
    b352 - block
    b145 - block
    b245 - block
    b285 - block
    b98 - block
    b73 - block
    b26 - block
    b992 - block
    b491 - block
    b993 - block
    b28 - block
    b322 - block
    b894 - block
    b332 - block
    b658 - block
    b202 - block
    b646 - block
    b255 - block
    b985 - block
    b598 - block
    b314 - block
    b716 - block
    b310 - block
    b654 - block
    b74 - block
    b262 - block
    b892 - block
    b131 - block
    b336 - block
    b729 - block
    b761 - block
    b326 - block
    b163 - block
    b313 - block
    b514 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b871 )
    ( on b623 b871 )
    ( on b175 b623 )
    ( on b246 b175 )
    ( on b133 b246 )
    ( on b564 b133 )
    ( on b78 b564 )
    ( on b161 b78 )
    ( on b230 b161 )
    ( on b560 b230 )
    ( on b271 b560 )
    ( on b499 b271 )
    ( on b191 b499 )
    ( on b857 b191 )
    ( on b352 b857 )
    ( on b145 b352 )
    ( on b245 b145 )
    ( on b285 b245 )
    ( on b98 b285 )
    ( on b73 b98 )
    ( on b26 b73 )
    ( on b992 b26 )
    ( on b491 b992 )
    ( on b993 b491 )
    ( on b28 b993 )
    ( on b322 b28 )
    ( on b894 b322 )
    ( on b332 b894 )
    ( on b658 b332 )
    ( on b202 b658 )
    ( on b646 b202 )
    ( on b255 b646 )
    ( on b985 b255 )
    ( on b598 b985 )
    ( on b314 b598 )
    ( on b716 b314 )
    ( on b310 b716 )
    ( on b654 b310 )
    ( on b74 b654 )
    ( on b262 b74 )
    ( on b892 b262 )
    ( on b131 b892 )
    ( on b336 b131 )
    ( on b729 b336 )
    ( on b761 b729 )
    ( on b326 b761 )
    ( on b163 b326 )
    ( on b313 b163 )
    ( on b514 b313 )
    ( clear b514 )
  )
  ( :tasks
    ( Make-48Pile b623 b175 b246 b133 b564 b78 b161 b230 b560 b271 b499 b191 b857 b352 b145 b245 b285 b98 b73 b26 b992 b491 b993 b28 b322 b894 b332 b658 b202 b646 b255 b985 b598 b314 b716 b310 b654 b74 b262 b892 b131 b336 b729 b761 b326 b163 b313 b514 )
  )
)
