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

  ( :method FLY-3PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?p3 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) ( PERSON-AT ?p3 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-4PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?p3 - PERSON
      ?p4 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) ( PERSON-AT ?p3 ?c ) ( PERSON-AT ?p4 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_7943 - PERSON
      ?auto_7942 - CITY
    )
    :vars
    (
      ?auto_7946 - FLEVEL
      ?auto_7945 - FLEVEL
      ?auto_7947 - CITY
      ?auto_7944 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7946 ?auto_7945 ) ( PERSON-AT ?auto_7943 ?auto_7947 ) ( AIRCRAFT-AT ?auto_7944 ?auto_7942 ) ( FUEL-LEVEL ?auto_7944 ?auto_7946 ) ( not ( = ?auto_7942 ?auto_7947 ) ) ( not ( = ?auto_7946 ?auto_7945 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_7944 ?auto_7942 ?auto_7946 ?auto_7945 )
      ( !FLY ?auto_7944 ?auto_7942 ?auto_7947 ?auto_7945 ?auto_7946 )
      ( !REFUEL ?auto_7944 ?auto_7947 ?auto_7946 ?auto_7945 )
      ( !BOARD ?auto_7943 ?auto_7944 ?auto_7947 )
      ( !FLY ?auto_7944 ?auto_7947 ?auto_7942 ?auto_7945 ?auto_7946 )
      ( !DEBARK ?auto_7943 ?auto_7944 ?auto_7942 )
      ( FLY-1PPL-VERIFY ?auto_7943 ?auto_7942 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_7966 - PERSON
      ?auto_7967 - PERSON
      ?auto_7965 - CITY
    )
    :vars
    (
      ?auto_7971 - FLEVEL
      ?auto_7969 - FLEVEL
      ?auto_7970 - CITY
      ?auto_7972 - CITY
      ?auto_7968 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7971 ?auto_7969 ) ( PERSON-AT ?auto_7967 ?auto_7970 ) ( not ( = ?auto_7965 ?auto_7970 ) ) ( not ( = ?auto_7971 ?auto_7969 ) ) ( PERSON-AT ?auto_7966 ?auto_7972 ) ( AIRCRAFT-AT ?auto_7968 ?auto_7965 ) ( FUEL-LEVEL ?auto_7968 ?auto_7971 ) ( not ( = ?auto_7965 ?auto_7972 ) ) ( not ( = ?auto_7966 ?auto_7967 ) ) ( not ( = ?auto_7970 ?auto_7972 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_7966 ?auto_7965 )
      ( FLY-1PPL ?auto_7967 ?auto_7965 )
      ( FLY-2PPL-VERIFY ?auto_7966 ?auto_7967 ?auto_7965 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8080 - PERSON
      ?auto_8081 - PERSON
      ?auto_8082 - PERSON
      ?auto_8079 - CITY
    )
    :vars
    (
      ?auto_8086 - FLEVEL
      ?auto_8083 - FLEVEL
      ?auto_8085 - CITY
      ?auto_8087 - CITY
      ?auto_8084 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8086 ?auto_8083 ) ( PERSON-AT ?auto_8082 ?auto_8085 ) ( not ( = ?auto_8079 ?auto_8085 ) ) ( not ( = ?auto_8086 ?auto_8083 ) ) ( PERSON-AT ?auto_8081 ?auto_8085 ) ( PERSON-AT ?auto_8080 ?auto_8087 ) ( AIRCRAFT-AT ?auto_8084 ?auto_8079 ) ( FUEL-LEVEL ?auto_8084 ?auto_8086 ) ( not ( = ?auto_8079 ?auto_8087 ) ) ( not ( = ?auto_8080 ?auto_8081 ) ) ( not ( = ?auto_8085 ?auto_8087 ) ) ( not ( = ?auto_8080 ?auto_8082 ) ) ( not ( = ?auto_8081 ?auto_8082 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8080 ?auto_8081 ?auto_8079 )
      ( FLY-1PPL ?auto_8082 ?auto_8079 )
      ( FLY-3PPL-VERIFY ?auto_8080 ?auto_8081 ?auto_8082 ?auto_8079 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8113 - PERSON
      ?auto_8114 - PERSON
      ?auto_8115 - PERSON
      ?auto_8112 - CITY
    )
    :vars
    (
      ?auto_8120 - FLEVEL
      ?auto_8119 - FLEVEL
      ?auto_8118 - CITY
      ?auto_8116 - CITY
      ?auto_8117 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8120 ?auto_8119 ) ( PERSON-AT ?auto_8115 ?auto_8118 ) ( not ( = ?auto_8112 ?auto_8118 ) ) ( not ( = ?auto_8120 ?auto_8119 ) ) ( PERSON-AT ?auto_8113 ?auto_8118 ) ( PERSON-AT ?auto_8114 ?auto_8116 ) ( AIRCRAFT-AT ?auto_8117 ?auto_8112 ) ( FUEL-LEVEL ?auto_8117 ?auto_8120 ) ( not ( = ?auto_8112 ?auto_8116 ) ) ( not ( = ?auto_8114 ?auto_8113 ) ) ( not ( = ?auto_8118 ?auto_8116 ) ) ( not ( = ?auto_8114 ?auto_8115 ) ) ( not ( = ?auto_8113 ?auto_8115 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_8114 ?auto_8113 ?auto_8115 ?auto_8112 )
      ( FLY-3PPL-VERIFY ?auto_8113 ?auto_8114 ?auto_8115 ?auto_8112 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8132 - PERSON
      ?auto_8133 - PERSON
      ?auto_8134 - PERSON
      ?auto_8131 - CITY
    )
    :vars
    (
      ?auto_8138 - FLEVEL
      ?auto_8136 - FLEVEL
      ?auto_8135 - CITY
      ?auto_8139 - CITY
      ?auto_8137 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8138 ?auto_8136 ) ( PERSON-AT ?auto_8133 ?auto_8135 ) ( not ( = ?auto_8131 ?auto_8135 ) ) ( not ( = ?auto_8138 ?auto_8136 ) ) ( PERSON-AT ?auto_8132 ?auto_8135 ) ( PERSON-AT ?auto_8134 ?auto_8139 ) ( AIRCRAFT-AT ?auto_8137 ?auto_8131 ) ( FUEL-LEVEL ?auto_8137 ?auto_8138 ) ( not ( = ?auto_8131 ?auto_8139 ) ) ( not ( = ?auto_8134 ?auto_8132 ) ) ( not ( = ?auto_8135 ?auto_8139 ) ) ( not ( = ?auto_8134 ?auto_8133 ) ) ( not ( = ?auto_8132 ?auto_8133 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_8132 ?auto_8134 ?auto_8133 ?auto_8131 )
      ( FLY-3PPL-VERIFY ?auto_8132 ?auto_8133 ?auto_8134 ?auto_8131 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_9234 - PERSON
      ?auto_9235 - PERSON
      ?auto_9236 - PERSON
      ?auto_9237 - PERSON
      ?auto_9233 - CITY
    )
    :vars
    (
      ?auto_9240 - FLEVEL
      ?auto_9239 - FLEVEL
      ?auto_9241 - CITY
      ?auto_9242 - CITY
      ?auto_9243 - CITY
      ?auto_9238 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9240 ?auto_9239 ) ( PERSON-AT ?auto_9237 ?auto_9241 ) ( not ( = ?auto_9233 ?auto_9241 ) ) ( not ( = ?auto_9240 ?auto_9239 ) ) ( PERSON-AT ?auto_9236 ?auto_9242 ) ( not ( = ?auto_9233 ?auto_9242 ) ) ( PERSON-AT ?auto_9235 ?auto_9242 ) ( PERSON-AT ?auto_9234 ?auto_9243 ) ( AIRCRAFT-AT ?auto_9238 ?auto_9233 ) ( FUEL-LEVEL ?auto_9238 ?auto_9240 ) ( not ( = ?auto_9233 ?auto_9243 ) ) ( not ( = ?auto_9234 ?auto_9235 ) ) ( not ( = ?auto_9242 ?auto_9243 ) ) ( not ( = ?auto_9234 ?auto_9236 ) ) ( not ( = ?auto_9235 ?auto_9236 ) ) ( not ( = ?auto_9234 ?auto_9237 ) ) ( not ( = ?auto_9235 ?auto_9237 ) ) ( not ( = ?auto_9236 ?auto_9237 ) ) ( not ( = ?auto_9241 ?auto_9242 ) ) ( not ( = ?auto_9241 ?auto_9243 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_9235 ?auto_9234 ?auto_9236 ?auto_9233 )
      ( FLY-1PPL ?auto_9237 ?auto_9233 )
      ( FLY-4PPL-VERIFY ?auto_9234 ?auto_9235 ?auto_9236 ?auto_9237 ?auto_9233 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_9269 - PERSON
      ?auto_9270 - PERSON
      ?auto_9271 - PERSON
      ?auto_9272 - PERSON
      ?auto_9268 - CITY
    )
    :vars
    (
      ?auto_9274 - FLEVEL
      ?auto_9273 - FLEVEL
      ?auto_9276 - CITY
      ?auto_9275 - CITY
      ?auto_9277 - CITY
      ?auto_9278 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9274 ?auto_9273 ) ( PERSON-AT ?auto_9271 ?auto_9276 ) ( not ( = ?auto_9268 ?auto_9276 ) ) ( not ( = ?auto_9274 ?auto_9273 ) ) ( PERSON-AT ?auto_9272 ?auto_9275 ) ( not ( = ?auto_9268 ?auto_9275 ) ) ( PERSON-AT ?auto_9270 ?auto_9275 ) ( PERSON-AT ?auto_9269 ?auto_9277 ) ( AIRCRAFT-AT ?auto_9278 ?auto_9268 ) ( FUEL-LEVEL ?auto_9278 ?auto_9274 ) ( not ( = ?auto_9268 ?auto_9277 ) ) ( not ( = ?auto_9269 ?auto_9270 ) ) ( not ( = ?auto_9275 ?auto_9277 ) ) ( not ( = ?auto_9269 ?auto_9272 ) ) ( not ( = ?auto_9270 ?auto_9272 ) ) ( not ( = ?auto_9269 ?auto_9271 ) ) ( not ( = ?auto_9270 ?auto_9271 ) ) ( not ( = ?auto_9272 ?auto_9271 ) ) ( not ( = ?auto_9276 ?auto_9275 ) ) ( not ( = ?auto_9276 ?auto_9277 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_9269 ?auto_9270 ?auto_9272 ?auto_9271 ?auto_9268 )
      ( FLY-4PPL-VERIFY ?auto_9269 ?auto_9270 ?auto_9271 ?auto_9272 ?auto_9268 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_9436 - PERSON
      ?auto_9437 - PERSON
      ?auto_9438 - PERSON
      ?auto_9439 - PERSON
      ?auto_9435 - CITY
    )
    :vars
    (
      ?auto_9441 - FLEVEL
      ?auto_9445 - FLEVEL
      ?auto_9443 - CITY
      ?auto_9442 - CITY
      ?auto_9440 - CITY
      ?auto_9444 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9441 ?auto_9445 ) ( PERSON-AT ?auto_9437 ?auto_9443 ) ( not ( = ?auto_9435 ?auto_9443 ) ) ( not ( = ?auto_9441 ?auto_9445 ) ) ( PERSON-AT ?auto_9439 ?auto_9442 ) ( not ( = ?auto_9435 ?auto_9442 ) ) ( PERSON-AT ?auto_9438 ?auto_9442 ) ( PERSON-AT ?auto_9436 ?auto_9440 ) ( AIRCRAFT-AT ?auto_9444 ?auto_9435 ) ( FUEL-LEVEL ?auto_9444 ?auto_9441 ) ( not ( = ?auto_9435 ?auto_9440 ) ) ( not ( = ?auto_9436 ?auto_9438 ) ) ( not ( = ?auto_9442 ?auto_9440 ) ) ( not ( = ?auto_9436 ?auto_9439 ) ) ( not ( = ?auto_9438 ?auto_9439 ) ) ( not ( = ?auto_9436 ?auto_9437 ) ) ( not ( = ?auto_9438 ?auto_9437 ) ) ( not ( = ?auto_9439 ?auto_9437 ) ) ( not ( = ?auto_9443 ?auto_9442 ) ) ( not ( = ?auto_9443 ?auto_9440 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_9436 ?auto_9438 ?auto_9437 ?auto_9439 ?auto_9435 )
      ( FLY-4PPL-VERIFY ?auto_9436 ?auto_9437 ?auto_9438 ?auto_9439 ?auto_9435 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_9574 - PERSON
      ?auto_9575 - PERSON
      ?auto_9576 - PERSON
      ?auto_9577 - PERSON
      ?auto_9573 - CITY
    )
    :vars
    (
      ?auto_9579 - FLEVEL
      ?auto_9583 - FLEVEL
      ?auto_9581 - CITY
      ?auto_9580 - CITY
      ?auto_9578 - CITY
      ?auto_9582 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9579 ?auto_9583 ) ( PERSON-AT ?auto_9577 ?auto_9581 ) ( not ( = ?auto_9573 ?auto_9581 ) ) ( not ( = ?auto_9579 ?auto_9583 ) ) ( PERSON-AT ?auto_9576 ?auto_9580 ) ( not ( = ?auto_9573 ?auto_9580 ) ) ( PERSON-AT ?auto_9574 ?auto_9580 ) ( PERSON-AT ?auto_9575 ?auto_9578 ) ( AIRCRAFT-AT ?auto_9582 ?auto_9573 ) ( FUEL-LEVEL ?auto_9582 ?auto_9579 ) ( not ( = ?auto_9573 ?auto_9578 ) ) ( not ( = ?auto_9575 ?auto_9574 ) ) ( not ( = ?auto_9580 ?auto_9578 ) ) ( not ( = ?auto_9575 ?auto_9576 ) ) ( not ( = ?auto_9574 ?auto_9576 ) ) ( not ( = ?auto_9575 ?auto_9577 ) ) ( not ( = ?auto_9574 ?auto_9577 ) ) ( not ( = ?auto_9576 ?auto_9577 ) ) ( not ( = ?auto_9581 ?auto_9580 ) ) ( not ( = ?auto_9581 ?auto_9578 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_9575 ?auto_9574 ?auto_9577 ?auto_9576 ?auto_9573 )
      ( FLY-4PPL-VERIFY ?auto_9574 ?auto_9575 ?auto_9576 ?auto_9577 ?auto_9573 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_9609 - PERSON
      ?auto_9610 - PERSON
      ?auto_9611 - PERSON
      ?auto_9612 - PERSON
      ?auto_9608 - CITY
    )
    :vars
    (
      ?auto_9614 - FLEVEL
      ?auto_9618 - FLEVEL
      ?auto_9616 - CITY
      ?auto_9615 - CITY
      ?auto_9613 - CITY
      ?auto_9617 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9614 ?auto_9618 ) ( PERSON-AT ?auto_9611 ?auto_9616 ) ( not ( = ?auto_9608 ?auto_9616 ) ) ( not ( = ?auto_9614 ?auto_9618 ) ) ( PERSON-AT ?auto_9612 ?auto_9615 ) ( not ( = ?auto_9608 ?auto_9615 ) ) ( PERSON-AT ?auto_9609 ?auto_9615 ) ( PERSON-AT ?auto_9610 ?auto_9613 ) ( AIRCRAFT-AT ?auto_9617 ?auto_9608 ) ( FUEL-LEVEL ?auto_9617 ?auto_9614 ) ( not ( = ?auto_9608 ?auto_9613 ) ) ( not ( = ?auto_9610 ?auto_9609 ) ) ( not ( = ?auto_9615 ?auto_9613 ) ) ( not ( = ?auto_9610 ?auto_9612 ) ) ( not ( = ?auto_9609 ?auto_9612 ) ) ( not ( = ?auto_9610 ?auto_9611 ) ) ( not ( = ?auto_9609 ?auto_9611 ) ) ( not ( = ?auto_9612 ?auto_9611 ) ) ( not ( = ?auto_9616 ?auto_9615 ) ) ( not ( = ?auto_9616 ?auto_9613 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_9610 ?auto_9609 ?auto_9611 ?auto_9612 ?auto_9608 )
      ( FLY-4PPL-VERIFY ?auto_9609 ?auto_9610 ?auto_9611 ?auto_9612 ?auto_9608 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_9719 - PERSON
      ?auto_9720 - PERSON
      ?auto_9721 - PERSON
      ?auto_9722 - PERSON
      ?auto_9718 - CITY
    )
    :vars
    (
      ?auto_9724 - FLEVEL
      ?auto_9728 - FLEVEL
      ?auto_9726 - CITY
      ?auto_9725 - CITY
      ?auto_9723 - CITY
      ?auto_9727 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9724 ?auto_9728 ) ( PERSON-AT ?auto_9722 ?auto_9726 ) ( not ( = ?auto_9718 ?auto_9726 ) ) ( not ( = ?auto_9724 ?auto_9728 ) ) ( PERSON-AT ?auto_9720 ?auto_9725 ) ( not ( = ?auto_9718 ?auto_9725 ) ) ( PERSON-AT ?auto_9719 ?auto_9725 ) ( PERSON-AT ?auto_9721 ?auto_9723 ) ( AIRCRAFT-AT ?auto_9727 ?auto_9718 ) ( FUEL-LEVEL ?auto_9727 ?auto_9724 ) ( not ( = ?auto_9718 ?auto_9723 ) ) ( not ( = ?auto_9721 ?auto_9719 ) ) ( not ( = ?auto_9725 ?auto_9723 ) ) ( not ( = ?auto_9721 ?auto_9720 ) ) ( not ( = ?auto_9719 ?auto_9720 ) ) ( not ( = ?auto_9721 ?auto_9722 ) ) ( not ( = ?auto_9719 ?auto_9722 ) ) ( not ( = ?auto_9720 ?auto_9722 ) ) ( not ( = ?auto_9726 ?auto_9725 ) ) ( not ( = ?auto_9726 ?auto_9723 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_9721 ?auto_9719 ?auto_9722 ?auto_9720 ?auto_9718 )
      ( FLY-4PPL-VERIFY ?auto_9719 ?auto_9720 ?auto_9721 ?auto_9722 ?auto_9718 ) )
  )

)

