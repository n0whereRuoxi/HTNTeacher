( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b655 - block
    b631 - block
    b515 - block
    b620 - block
    b644 - block
    b695 - block
    b481 - block
    b98 - block
    b704 - block
    b903 - block
    b711 - block
    b899 - block
    b265 - block
    b47 - block
    b591 - block
    b142 - block
    b456 - block
    b782 - block
    b721 - block
    b358 - block
    b852 - block
    b643 - block
    b673 - block
    b601 - block
    b995 - block
    b970 - block
    b540 - block
    b856 - block
    b744 - block
    b781 - block
    b362 - block
    b328 - block
    b919 - block
    b64 - block
    b103 - block
    b942 - block
    b93 - block
    b354 - block
    b742 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b655 )
    ( on b631 b655 )
    ( on b515 b631 )
    ( on b620 b515 )
    ( on b644 b620 )
    ( on b695 b644 )
    ( on b481 b695 )
    ( on b98 b481 )
    ( on b704 b98 )
    ( on b903 b704 )
    ( on b711 b903 )
    ( on b899 b711 )
    ( on b265 b899 )
    ( on b47 b265 )
    ( on b591 b47 )
    ( on b142 b591 )
    ( on b456 b142 )
    ( on b782 b456 )
    ( on b721 b782 )
    ( on b358 b721 )
    ( on b852 b358 )
    ( on b643 b852 )
    ( on b673 b643 )
    ( on b601 b673 )
    ( on b995 b601 )
    ( on b970 b995 )
    ( on b540 b970 )
    ( on b856 b540 )
    ( on b744 b856 )
    ( on b781 b744 )
    ( on b362 b781 )
    ( on b328 b362 )
    ( on b919 b328 )
    ( on b64 b919 )
    ( on b103 b64 )
    ( on b942 b103 )
    ( on b93 b942 )
    ( on b354 b93 )
    ( on b742 b354 )
    ( clear b742 )
  )
  ( :tasks
    ( Make-38Pile b631 b515 b620 b644 b695 b481 b98 b704 b903 b711 b899 b265 b47 b591 b142 b456 b782 b721 b358 b852 b643 b673 b601 b995 b970 b540 b856 b744 b781 b362 b328 b919 b64 b103 b942 b93 b354 b742 )
  )
)
