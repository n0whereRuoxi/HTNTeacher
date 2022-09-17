( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    aircraft000 - aircraft
    city812 - city
    city383 - city
    city455 - city
    city903 - city
    city151 - city
    city216 - city
    city551 - city
    city689 - city
    city866 - city
    city625 - city
    city335 - city
    city203 - city
    city201 - city
    city468 - city
    city346 - city
    city795 - city
    city948 - city
    person719 - person
    person667 - person
    person102 - person
    person59 - person
    person609 - person
    person579 - person
    person698 - person
    person188 - person
    person643 - person
    person753 - person
    person359 - person
    person966 - person
    person675 - person
  )
  ( :init
    ( next level000 level001 )
    ( airport l000-000 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person719 city551 )
    ( person-at person667 city689 )
    ( person-at person102 city551 )
    ( person-at person59 city948 )
    ( person-at person609 city866 )
    ( person-at person579 city346 )
    ( person-at person698 city203 )
    ( person-at person188 city455 )
    ( person-at person643 city203 )
    ( person-at person753 city625 )
    ( person-at person359 city201 )
    ( person-at person966 city866 )
    ( person-at person675 city201 )
  )
  ( :goal
    ( and
      ( person-at person719 city000 )
      ( person-at person667 city000 )
      ( person-at person102 city000 )
      ( person-at person59 city000 )
      ( person-at person609 city000 )
      ( person-at person579 city000 )
      ( person-at person698 city000 )
      ( person-at person188 city000 )
      ( person-at person643 city000 )
      ( person-at person753 city000 )
      ( person-at person359 city000 )
      ( person-at person966 city000 )
      ( person-at person675 city000 )
    )
  )
)
