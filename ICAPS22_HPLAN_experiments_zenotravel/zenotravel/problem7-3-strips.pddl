( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city337 - city
    city521 - city
    city165 - city
    city791 - city
    city17 - city
    city858 - city
    city947 - city
    city800 - city
    city329 - city
    city342 - city
    city217 - city
    city445 - city
    city215 - city
    city280 - city
    person78 - person
    person432 - person
    person817 - person
    person178 - person
    person905 - person
    person544 - person
    person32 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person78 city342 )
    ( person-at person432 city445 )
    ( person-at person817 city17 )
    ( person-at person178 city342 )
    ( person-at person905 city521 )
    ( person-at person544 city858 )
    ( person-at person32 city215 )
  )
  ( :goal
    ( and
      ( person-at person78 city000 )
      ( person-at person432 city000 )
      ( person-at person817 city000 )
      ( person-at person178 city000 )
      ( person-at person905 city000 )
      ( person-at person544 city000 )
      ( person-at person32 city000 )
    )
  )
)
