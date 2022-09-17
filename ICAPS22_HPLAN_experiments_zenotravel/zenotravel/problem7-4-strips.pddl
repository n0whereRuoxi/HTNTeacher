( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city753 - city
    city651 - city
    city754 - city
    city23 - city
    city112 - city
    person111 - person
    person266 - person
    person51 - person
    person895 - person
    person922 - person
    person736 - person
    person238 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person111 city754 )
    ( person-at person266 city754 )
    ( person-at person51 city754 )
    ( person-at person895 city23 )
    ( person-at person922 city754 )
    ( person-at person736 city23 )
    ( person-at person238 city112 )
  )
  ( :goal
    ( and
      ( person-at person111 city000 )
      ( person-at person266 city000 )
      ( person-at person51 city000 )
      ( person-at person895 city000 )
      ( person-at person922 city000 )
      ( person-at person736 city000 )
      ( person-at person238 city000 )
    )
  )
)
