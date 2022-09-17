( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city561 - city
    city143 - city
    city467 - city
    city465 - city
    city362 - city
    city699 - city
    city223 - city
    city884 - city
    city819 - city
    city730 - city
    city122 - city
    city995 - city
    city9 - city
    city762 - city
    person935 - person
    person550 - person
    person898 - person
    person946 - person
    person38 - person
    person846 - person
    person408 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person935 city362 )
    ( person-at person550 city762 )
    ( person-at person898 city362 )
    ( person-at person946 city730 )
    ( person-at person38 city122 )
    ( person-at person846 city699 )
    ( person-at person408 city467 )
  )
  ( :goal
    ( and
      ( person-at person935 city000 )
      ( person-at person550 city000 )
      ( person-at person898 city000 )
      ( person-at person946 city000 )
      ( person-at person38 city000 )
      ( person-at person846 city000 )
      ( person-at person408 city000 )
    )
  )
)
