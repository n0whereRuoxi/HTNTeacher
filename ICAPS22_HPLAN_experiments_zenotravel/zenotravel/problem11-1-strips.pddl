( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city79 - city
    city38 - city
    city702 - city
    city617 - city
    city771 - city
    city366 - city
    city127 - city
    city80 - city
    city247 - city
    city166 - city
    city720 - city
    city930 - city
    city987 - city
    city574 - city
    city782 - city
    city663 - city
    city339 - city
    city400 - city
    city83 - city
    city207 - city
    city582 - city
    person379 - person
    person408 - person
    person859 - person
    person553 - person
    person591 - person
    person870 - person
    person415 - person
    person52 - person
    person708 - person
    person634 - person
    person904 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person379 city617 )
    ( person-at person408 city38 )
    ( person-at person859 city166 )
    ( person-at person553 city400 )
    ( person-at person591 city720 )
    ( person-at person870 city79 )
    ( person-at person415 city127 )
    ( person-at person52 city702 )
    ( person-at person708 city782 )
    ( person-at person634 city247 )
    ( person-at person904 city987 )
  )
  ( :goal
    ( and
      ( person-at person379 city000 )
      ( person-at person408 city000 )
      ( person-at person859 city000 )
      ( person-at person553 city000 )
      ( person-at person591 city000 )
      ( person-at person870 city000 )
      ( person-at person415 city000 )
      ( person-at person52 city000 )
      ( person-at person708 city000 )
      ( person-at person634 city000 )
      ( person-at person904 city000 )
    )
  )
)
