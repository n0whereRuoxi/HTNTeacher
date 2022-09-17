( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-412 - location
    l000-578 - location
    l000-79 - location
    l000-7 - location
    l000-552 - location
    l000-382 - location
    l000-363 - location
    p109 - obj
    p696 - obj
    p510 - obj
    p256 - obj
    p245 - obj
    p870 - obj
    p26 - obj
    p232 - obj
    p612 - obj
    p234 - obj
    p375 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-412 c000 )
    ( in-city l000-578 c000 )
    ( in-city l000-79 c000 )
    ( in-city l000-7 c000 )
    ( in-city l000-552 c000 )
    ( in-city l000-382 c000 )
    ( in-city l000-363 c000 )
    ( obj-at p109 l000-7 )
    ( obj-at p696 l000-363 )
    ( obj-at p510 l000-578 )
    ( obj-at p256 l000-79 )
    ( obj-at p245 l000-578 )
    ( obj-at p870 l000-412 )
    ( obj-at p26 l000-363 )
    ( obj-at p232 l000-412 )
    ( obj-at p612 l000-552 )
    ( obj-at p234 l000-363 )
    ( obj-at p375 l000-382 )
    ( greater-than p696 p109 )
    ( greater-than p510 p109 )
    ( greater-than p510 p696 )
    ( greater-than p256 p109 )
    ( greater-than p256 p696 )
    ( greater-than p256 p510 )
    ( greater-than p245 p109 )
    ( greater-than p245 p696 )
    ( greater-than p245 p510 )
    ( greater-than p245 p256 )
    ( greater-than p870 p109 )
    ( greater-than p870 p696 )
    ( greater-than p870 p510 )
    ( greater-than p870 p256 )
    ( greater-than p870 p245 )
    ( greater-than p26 p109 )
    ( greater-than p26 p696 )
    ( greater-than p26 p510 )
    ( greater-than p26 p256 )
    ( greater-than p26 p245 )
    ( greater-than p26 p870 )
    ( greater-than p232 p109 )
    ( greater-than p232 p696 )
    ( greater-than p232 p510 )
    ( greater-than p232 p256 )
    ( greater-than p232 p245 )
    ( greater-than p232 p870 )
    ( greater-than p232 p26 )
    ( greater-than p612 p109 )
    ( greater-than p612 p696 )
    ( greater-than p612 p510 )
    ( greater-than p612 p256 )
    ( greater-than p612 p245 )
    ( greater-than p612 p870 )
    ( greater-than p612 p26 )
    ( greater-than p612 p232 )
    ( greater-than p234 p109 )
    ( greater-than p234 p696 )
    ( greater-than p234 p510 )
    ( greater-than p234 p256 )
    ( greater-than p234 p245 )
    ( greater-than p234 p870 )
    ( greater-than p234 p26 )
    ( greater-than p234 p232 )
    ( greater-than p234 p612 )
    ( greater-than p375 p109 )
    ( greater-than p375 p696 )
    ( greater-than p375 p510 )
    ( greater-than p375 p256 )
    ( greater-than p375 p245 )
    ( greater-than p375 p870 )
    ( greater-than p375 p26 )
    ( greater-than p375 p232 )
    ( greater-than p375 p612 )
    ( greater-than p375 p234 )
  )
  ( :goal
    ( and
      ( obj-at p109 l000-000 )
      ( obj-at p696 l000-000 )
      ( obj-at p510 l000-000 )
      ( obj-at p256 l000-000 )
      ( obj-at p245 l000-000 )
      ( obj-at p870 l000-000 )
      ( obj-at p26 l000-000 )
      ( obj-at p232 l000-000 )
      ( obj-at p612 l000-000 )
      ( obj-at p234 l000-000 )
      ( obj-at p375 l000-000 )
    )
  )
)
