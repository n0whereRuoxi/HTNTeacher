( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city87 - city
    city364 - city
    city643 - city
    city895 - city
    city449 - city
    city997 - city
    city689 - city
    city304 - city
    city89 - city
    city811 - city
    city775 - city
    city174 - city
    city964 - city
    city530 - city
    city147 - city
    city534 - city
    city188 - city
    person1 - person
    person614 - person
    person111 - person
    person243 - person
    person784 - person
    person942 - person
    person213 - person
    person398 - person
    person480 - person
    person531 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person1 city530 )
    ( person-at person614 city364 )
    ( person-at person111 city89 )
    ( person-at person243 city997 )
    ( person-at person784 city364 )
    ( person-at person942 city643 )
    ( person-at person213 city895 )
    ( person-at person398 city964 )
    ( person-at person480 city643 )
    ( person-at person531 city964 )
  )
  ( :goal
    ( and
      ( person-at person1 city000 )
      ( person-at person614 city000 )
      ( person-at person111 city000 )
      ( person-at person243 city000 )
      ( person-at person784 city000 )
      ( person-at person942 city000 )
      ( person-at person213 city000 )
      ( person-at person398 city000 )
      ( person-at person480 city000 )
      ( person-at person531 city000 )
    )
  )
)
