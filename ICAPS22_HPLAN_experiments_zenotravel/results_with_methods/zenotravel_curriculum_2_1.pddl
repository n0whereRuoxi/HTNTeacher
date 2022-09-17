( define ( domain zenotravel )
  ( :requirements :strips :typing :htn )
  ( :types aircraft city flevel person )
  ( :predicates
    ( PERSON-AT ?x - PERSON ?c - CITY )
    ( AIRCRAFT-AT ?y - AIRCRAFT ?c - CITY )
    ( IN ?p - PERSON ?a - AIRCRAFT )
    ( FUEL-LEVEL ?a - AIRCRAFT ?l - FLEVEL )
    ( NEXT ?l1 - FLEVEL ?l2 - FLEVEL )
  )
  ( :action !BOARD
    :parameters
    (
      ?p - PERSON
      ?a - AIRCRAFT
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p ?c ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( not ( PERSON-AT ?p ?c ) ) ( IN ?p ?a ) )
  )
  ( :action !DEBARK
    :parameters
    (
      ?p - PERSON
      ?a - AIRCRAFT
      ?c - CITY
    )
    :precondition
    ( and ( IN ?p ?a ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( not ( IN ?p ?a ) ) ( PERSON-AT ?p ?c ) )
  )
  ( :action !FLY
    :parameters
    (
      ?a - AIRCRAFT
      ?c1 - CITY
      ?c2 - CITY
      ?l1 - FLEVEL
      ?l2 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?a ?c1 ) ( FUEL-LEVEL ?a ?l1 ) ( NEXT ?l2 ?l1 ) )
    :effect
    ( and ( not ( AIRCRAFT-AT ?a ?c1 ) ) ( AIRCRAFT-AT ?a ?c2 ) ( not ( FUEL-LEVEL ?a ?l1 ) ) ( FUEL-LEVEL ?a ?l2 ) )
  )
  ( :action !ZOOM
    :parameters
    (
      ?a - AIRCRAFT
      ?c1 - CITY
      ?c2 - CITY
      ?l1 - FLEVEL
      ?l2 - FLEVEL
      ?l3 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?a ?c1 ) ( FUEL-LEVEL ?a ?l1 ) ( NEXT ?l2 ?l1 ) ( NEXT ?l3 ?l2 ) )
    :effect
    ( and ( not ( AIRCRAFT-AT ?a ?c1 ) ) ( AIRCRAFT-AT ?a ?c2 ) ( not ( FUEL-LEVEL ?a ?l1 ) ) ( FUEL-LEVEL ?a ?l3 ) )
  )
  ( :action !REFUEL
    :parameters
    (
      ?a - AIRCRAFT
      ?c - CITY
      ?l - FLEVEL
      ?l1 - FLEVEL
    )
    :precondition
    ( and ( FUEL-LEVEL ?a ?l ) ( NEXT ?l ?l1 ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( FUEL-LEVEL ?a ?l1 ) ( not ( FUEL-LEVEL ?a ?l ) ) )
  )
  ( :method TRAVEL
    :parameters
    (
      ?p - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-2PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_50 - PERSON
      ?auto_49 - CITY
    )
    :vars
    (
      ?auto_53 - FLEVEL
      ?auto_52 - FLEVEL
      ?auto_54 - CITY
      ?auto_51 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_53 ?auto_52 ) ( PERSON-AT ?auto_50 ?auto_54 ) ( AIRCRAFT-AT ?auto_51 ?auto_49 ) ( FUEL-LEVEL ?auto_51 ?auto_53 ) ( not ( = ?auto_49 ?auto_54 ) ) ( not ( = ?auto_53 ?auto_52 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_51 ?auto_49 ?auto_53 ?auto_52 )
      ( !FLY ?auto_51 ?auto_49 ?auto_54 ?auto_52 ?auto_53 )
      ( !REFUEL ?auto_51 ?auto_54 ?auto_53 ?auto_52 )
      ( !BOARD ?auto_50 ?auto_51 ?auto_54 )
      ( !FLY ?auto_51 ?auto_54 ?auto_49 ?auto_52 ?auto_53 )
      ( !DEBARK ?auto_50 ?auto_51 ?auto_49 )
      ( FLY-1PPL-VERIFY ?auto_50 ?auto_49 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_58 - PERSON
      ?auto_57 - CITY
    )
    :vars
    (
      ?auto_61 - FLEVEL
      ?auto_60 - FLEVEL
      ?auto_62 - CITY
      ?auto_59 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_61 ?auto_60 ) ( PERSON-AT ?auto_58 ?auto_62 ) ( AIRCRAFT-AT ?auto_59 ?auto_57 ) ( FUEL-LEVEL ?auto_59 ?auto_61 ) ( not ( = ?auto_57 ?auto_62 ) ) ( not ( = ?auto_61 ?auto_60 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_59 ?auto_57 ?auto_61 ?auto_60 )
      ( !FLY ?auto_59 ?auto_57 ?auto_62 ?auto_60 ?auto_61 )
      ( !REFUEL ?auto_59 ?auto_62 ?auto_61 ?auto_60 )
      ( !BOARD ?auto_58 ?auto_59 ?auto_62 )
      ( !FLY ?auto_59 ?auto_62 ?auto_57 ?auto_60 ?auto_61 )
      ( !DEBARK ?auto_58 ?auto_59 ?auto_57 )
      ( FLY-1PPL-VERIFY ?auto_58 ?auto_57 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_73 - PERSON
      ?auto_74 - PERSON
      ?auto_72 - CITY
    )
    :vars
    (
      ?auto_77 - FLEVEL
      ?auto_75 - FLEVEL
      ?auto_76 - CITY
      ?auto_79 - CITY
      ?auto_78 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_77 ?auto_75 ) ( PERSON-AT ?auto_74 ?auto_76 ) ( not ( = ?auto_72 ?auto_76 ) ) ( not ( = ?auto_77 ?auto_75 ) ) ( PERSON-AT ?auto_73 ?auto_79 ) ( AIRCRAFT-AT ?auto_78 ?auto_72 ) ( FUEL-LEVEL ?auto_78 ?auto_77 ) ( not ( = ?auto_72 ?auto_79 ) ) ( not ( = ?auto_73 ?auto_74 ) ) ( not ( = ?auto_76 ?auto_79 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_73 ?auto_72 )
      ( FLY-1PPL ?auto_74 ?auto_72 )
      ( FLY-2PPL-VERIFY ?auto_73 ?auto_74 ?auto_72 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_81 - PERSON
      ?auto_82 - PERSON
      ?auto_80 - CITY
    )
    :vars
    (
      ?auto_85 - FLEVEL
      ?auto_83 - FLEVEL
      ?auto_84 - CITY
      ?auto_86 - CITY
      ?auto_87 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_85 ?auto_83 ) ( PERSON-AT ?auto_81 ?auto_84 ) ( not ( = ?auto_80 ?auto_84 ) ) ( not ( = ?auto_85 ?auto_83 ) ) ( PERSON-AT ?auto_82 ?auto_86 ) ( AIRCRAFT-AT ?auto_87 ?auto_80 ) ( FUEL-LEVEL ?auto_87 ?auto_85 ) ( not ( = ?auto_80 ?auto_86 ) ) ( not ( = ?auto_82 ?auto_81 ) ) ( not ( = ?auto_84 ?auto_86 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_82 ?auto_81 ?auto_80 )
      ( FLY-2PPL-VERIFY ?auto_81 ?auto_82 ?auto_80 ) )
  )

)

