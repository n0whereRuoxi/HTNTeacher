( define ( domain depots )
  ( :requirements :strips :typing :equality :htn )
  ( :types hoist place surface truck )
  ( :predicates
    ( SURFACE-AT ?a - SURFACE ?b - PLACE )
    ( ON ?c - SURFACE ?d - SURFACE )
    ( IN ?e - SURFACE ?f - TRUCK )
    ( LIFTING ?g - HOIST ?h - SURFACE )
    ( AVAILABLE ?i - HOIST )
    ( CLEAR ?j - SURFACE )
    ( IS-CRATE ?k - SURFACE )
    ( HOIST-AT ?l - HOIST ?m - PLACE )
    ( TRUCK-AT ?n - TRUCK ?o - PLACE )
  )
  ( :action !DRIVE
    :parameters
    (
      ?truck - TRUCK
      ?old - PLACE
      ?new - PLACE
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?old ) ( not ( = ?old ?new ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?old ) ) ( TRUCK-AT ?truck ?new ) )
  )
  ( :action !LIFT
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( ON ?crate ?below ) ( CLEAR ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( SURFACE-AT ?crate ?here ) ) ( not ( CLEAR ?crate ) ) ( not ( AVAILABLE ?hoist ) ) ( not ( ON ?crate ?below ) ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) )
  )
  ( :action !DROP
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( SURFACE-AT ?below ?here ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( not ( CLEAR ?below ) ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( CLEAR ?crate ) ( ON ?crate ?below ) )
  )
  ( :action !LOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( IN ?crate ?truck ) ( AVAILABLE ?hoist ) )
  )
  ( :action !UNLOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( AVAILABLE ?hoist ) ( IN ?crate ?truck ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( IN ?crate ?truck ) ) ( not ( AVAILABLE ?hoist ) ) ( LIFTING ?hoist ?crate ) )
  )
  ( :method MAKE-ON
    :parameters
    (
      ?ab - SURFACE
      ?be - SURFACE
    )
    :precondition
    ( and ( ON ?ab ?be ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON-VERIFY
    :parameters
    (
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16086 - SURFACE
      ?auto_16087 - SURFACE
    )
    :vars
    (
      ?auto_16088 - HOIST
      ?auto_16089 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16088 ?auto_16089 ) ( SURFACE-AT ?auto_16087 ?auto_16089 ) ( CLEAR ?auto_16087 ) ( LIFTING ?auto_16088 ?auto_16086 ) ( IS-CRATE ?auto_16086 ) ( not ( = ?auto_16086 ?auto_16087 ) ) )
    :subtasks
    ( ( !DROP ?auto_16088 ?auto_16086 ?auto_16087 ?auto_16089 )
      ( MAKE-ON-VERIFY ?auto_16086 ?auto_16087 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16090 - SURFACE
      ?auto_16091 - SURFACE
    )
    :vars
    (
      ?auto_16093 - HOIST
      ?auto_16092 - PLACE
      ?auto_16094 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16093 ?auto_16092 ) ( SURFACE-AT ?auto_16091 ?auto_16092 ) ( CLEAR ?auto_16091 ) ( IS-CRATE ?auto_16090 ) ( not ( = ?auto_16090 ?auto_16091 ) ) ( TRUCK-AT ?auto_16094 ?auto_16092 ) ( AVAILABLE ?auto_16093 ) ( IN ?auto_16090 ?auto_16094 ) )
    :subtasks
    ( ( !UNLOAD ?auto_16093 ?auto_16090 ?auto_16094 ?auto_16092 )
      ( MAKE-ON ?auto_16090 ?auto_16091 )
      ( MAKE-ON-VERIFY ?auto_16090 ?auto_16091 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16095 - SURFACE
      ?auto_16096 - SURFACE
    )
    :vars
    (
      ?auto_16097 - HOIST
      ?auto_16098 - PLACE
      ?auto_16099 - TRUCK
      ?auto_16100 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16097 ?auto_16098 ) ( SURFACE-AT ?auto_16096 ?auto_16098 ) ( CLEAR ?auto_16096 ) ( IS-CRATE ?auto_16095 ) ( not ( = ?auto_16095 ?auto_16096 ) ) ( AVAILABLE ?auto_16097 ) ( IN ?auto_16095 ?auto_16099 ) ( TRUCK-AT ?auto_16099 ?auto_16100 ) ( not ( = ?auto_16100 ?auto_16098 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16099 ?auto_16100 ?auto_16098 )
      ( MAKE-ON ?auto_16095 ?auto_16096 )
      ( MAKE-ON-VERIFY ?auto_16095 ?auto_16096 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16101 - SURFACE
      ?auto_16102 - SURFACE
    )
    :vars
    (
      ?auto_16103 - HOIST
      ?auto_16106 - PLACE
      ?auto_16104 - TRUCK
      ?auto_16105 - PLACE
      ?auto_16107 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16103 ?auto_16106 ) ( SURFACE-AT ?auto_16102 ?auto_16106 ) ( CLEAR ?auto_16102 ) ( IS-CRATE ?auto_16101 ) ( not ( = ?auto_16101 ?auto_16102 ) ) ( AVAILABLE ?auto_16103 ) ( TRUCK-AT ?auto_16104 ?auto_16105 ) ( not ( = ?auto_16105 ?auto_16106 ) ) ( HOIST-AT ?auto_16107 ?auto_16105 ) ( LIFTING ?auto_16107 ?auto_16101 ) ( not ( = ?auto_16103 ?auto_16107 ) ) )
    :subtasks
    ( ( !LOAD ?auto_16107 ?auto_16101 ?auto_16104 ?auto_16105 )
      ( MAKE-ON ?auto_16101 ?auto_16102 )
      ( MAKE-ON-VERIFY ?auto_16101 ?auto_16102 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16108 - SURFACE
      ?auto_16109 - SURFACE
    )
    :vars
    (
      ?auto_16112 - HOIST
      ?auto_16114 - PLACE
      ?auto_16110 - TRUCK
      ?auto_16113 - PLACE
      ?auto_16111 - HOIST
      ?auto_16115 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16112 ?auto_16114 ) ( SURFACE-AT ?auto_16109 ?auto_16114 ) ( CLEAR ?auto_16109 ) ( IS-CRATE ?auto_16108 ) ( not ( = ?auto_16108 ?auto_16109 ) ) ( AVAILABLE ?auto_16112 ) ( TRUCK-AT ?auto_16110 ?auto_16113 ) ( not ( = ?auto_16113 ?auto_16114 ) ) ( HOIST-AT ?auto_16111 ?auto_16113 ) ( not ( = ?auto_16112 ?auto_16111 ) ) ( AVAILABLE ?auto_16111 ) ( SURFACE-AT ?auto_16108 ?auto_16113 ) ( ON ?auto_16108 ?auto_16115 ) ( CLEAR ?auto_16108 ) ( not ( = ?auto_16108 ?auto_16115 ) ) ( not ( = ?auto_16109 ?auto_16115 ) ) )
    :subtasks
    ( ( !LIFT ?auto_16111 ?auto_16108 ?auto_16115 ?auto_16113 )
      ( MAKE-ON ?auto_16108 ?auto_16109 )
      ( MAKE-ON-VERIFY ?auto_16108 ?auto_16109 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16116 - SURFACE
      ?auto_16117 - SURFACE
    )
    :vars
    (
      ?auto_16120 - HOIST
      ?auto_16121 - PLACE
      ?auto_16122 - PLACE
      ?auto_16123 - HOIST
      ?auto_16118 - SURFACE
      ?auto_16119 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16120 ?auto_16121 ) ( SURFACE-AT ?auto_16117 ?auto_16121 ) ( CLEAR ?auto_16117 ) ( IS-CRATE ?auto_16116 ) ( not ( = ?auto_16116 ?auto_16117 ) ) ( AVAILABLE ?auto_16120 ) ( not ( = ?auto_16122 ?auto_16121 ) ) ( HOIST-AT ?auto_16123 ?auto_16122 ) ( not ( = ?auto_16120 ?auto_16123 ) ) ( AVAILABLE ?auto_16123 ) ( SURFACE-AT ?auto_16116 ?auto_16122 ) ( ON ?auto_16116 ?auto_16118 ) ( CLEAR ?auto_16116 ) ( not ( = ?auto_16116 ?auto_16118 ) ) ( not ( = ?auto_16117 ?auto_16118 ) ) ( TRUCK-AT ?auto_16119 ?auto_16121 ) )
    :subtasks
    ( ( !DRIVE ?auto_16119 ?auto_16121 ?auto_16122 )
      ( MAKE-ON ?auto_16116 ?auto_16117 )
      ( MAKE-ON-VERIFY ?auto_16116 ?auto_16117 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16164 - SURFACE
      ?auto_16165 - SURFACE
    )
    :vars
    (
      ?auto_16166 - HOIST
      ?auto_16167 - PLACE
      ?auto_16168 - PLACE
      ?auto_16170 - HOIST
      ?auto_16171 - SURFACE
      ?auto_16169 - TRUCK
      ?auto_16172 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16166 ?auto_16167 ) ( IS-CRATE ?auto_16164 ) ( not ( = ?auto_16164 ?auto_16165 ) ) ( not ( = ?auto_16168 ?auto_16167 ) ) ( HOIST-AT ?auto_16170 ?auto_16168 ) ( not ( = ?auto_16166 ?auto_16170 ) ) ( AVAILABLE ?auto_16170 ) ( SURFACE-AT ?auto_16164 ?auto_16168 ) ( ON ?auto_16164 ?auto_16171 ) ( CLEAR ?auto_16164 ) ( not ( = ?auto_16164 ?auto_16171 ) ) ( not ( = ?auto_16165 ?auto_16171 ) ) ( TRUCK-AT ?auto_16169 ?auto_16167 ) ( SURFACE-AT ?auto_16172 ?auto_16167 ) ( CLEAR ?auto_16172 ) ( LIFTING ?auto_16166 ?auto_16165 ) ( IS-CRATE ?auto_16165 ) ( not ( = ?auto_16164 ?auto_16172 ) ) ( not ( = ?auto_16165 ?auto_16172 ) ) ( not ( = ?auto_16171 ?auto_16172 ) ) )
    :subtasks
    ( ( !DROP ?auto_16166 ?auto_16165 ?auto_16172 ?auto_16167 )
      ( MAKE-ON ?auto_16164 ?auto_16165 )
      ( MAKE-ON-VERIFY ?auto_16164 ?auto_16165 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16173 - SURFACE
      ?auto_16174 - SURFACE
    )
    :vars
    (
      ?auto_16176 - HOIST
      ?auto_16179 - PLACE
      ?auto_16178 - PLACE
      ?auto_16175 - HOIST
      ?auto_16177 - SURFACE
      ?auto_16180 - TRUCK
      ?auto_16181 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16176 ?auto_16179 ) ( IS-CRATE ?auto_16173 ) ( not ( = ?auto_16173 ?auto_16174 ) ) ( not ( = ?auto_16178 ?auto_16179 ) ) ( HOIST-AT ?auto_16175 ?auto_16178 ) ( not ( = ?auto_16176 ?auto_16175 ) ) ( AVAILABLE ?auto_16175 ) ( SURFACE-AT ?auto_16173 ?auto_16178 ) ( ON ?auto_16173 ?auto_16177 ) ( CLEAR ?auto_16173 ) ( not ( = ?auto_16173 ?auto_16177 ) ) ( not ( = ?auto_16174 ?auto_16177 ) ) ( TRUCK-AT ?auto_16180 ?auto_16179 ) ( SURFACE-AT ?auto_16181 ?auto_16179 ) ( CLEAR ?auto_16181 ) ( IS-CRATE ?auto_16174 ) ( not ( = ?auto_16173 ?auto_16181 ) ) ( not ( = ?auto_16174 ?auto_16181 ) ) ( not ( = ?auto_16177 ?auto_16181 ) ) ( AVAILABLE ?auto_16176 ) ( IN ?auto_16174 ?auto_16180 ) )
    :subtasks
    ( ( !UNLOAD ?auto_16176 ?auto_16174 ?auto_16180 ?auto_16179 )
      ( MAKE-ON ?auto_16173 ?auto_16174 )
      ( MAKE-ON-VERIFY ?auto_16173 ?auto_16174 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16188 - SURFACE
      ?auto_16189 - SURFACE
    )
    :vars
    (
      ?auto_16195 - HOIST
      ?auto_16191 - PLACE
      ?auto_16194 - PLACE
      ?auto_16193 - HOIST
      ?auto_16192 - SURFACE
      ?auto_16190 - TRUCK
      ?auto_16196 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16195 ?auto_16191 ) ( SURFACE-AT ?auto_16189 ?auto_16191 ) ( CLEAR ?auto_16189 ) ( IS-CRATE ?auto_16188 ) ( not ( = ?auto_16188 ?auto_16189 ) ) ( AVAILABLE ?auto_16195 ) ( not ( = ?auto_16194 ?auto_16191 ) ) ( HOIST-AT ?auto_16193 ?auto_16194 ) ( not ( = ?auto_16195 ?auto_16193 ) ) ( AVAILABLE ?auto_16193 ) ( SURFACE-AT ?auto_16188 ?auto_16194 ) ( ON ?auto_16188 ?auto_16192 ) ( CLEAR ?auto_16188 ) ( not ( = ?auto_16188 ?auto_16192 ) ) ( not ( = ?auto_16189 ?auto_16192 ) ) ( TRUCK-AT ?auto_16190 ?auto_16196 ) ( not ( = ?auto_16196 ?auto_16191 ) ) ( not ( = ?auto_16194 ?auto_16196 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16190 ?auto_16196 ?auto_16191 )
      ( MAKE-ON ?auto_16188 ?auto_16189 )
      ( MAKE-ON-VERIFY ?auto_16188 ?auto_16189 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16373 - SURFACE
      ?auto_16374 - SURFACE
    )
    :vars
    (
      ?auto_16375 - HOIST
      ?auto_16377 - PLACE
      ?auto_16379 - TRUCK
      ?auto_16378 - PLACE
      ?auto_16376 - HOIST
      ?auto_16380 - SURFACE
      ?auto_16381 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16375 ?auto_16377 ) ( SURFACE-AT ?auto_16374 ?auto_16377 ) ( CLEAR ?auto_16374 ) ( IS-CRATE ?auto_16373 ) ( not ( = ?auto_16373 ?auto_16374 ) ) ( AVAILABLE ?auto_16375 ) ( TRUCK-AT ?auto_16379 ?auto_16378 ) ( not ( = ?auto_16378 ?auto_16377 ) ) ( HOIST-AT ?auto_16376 ?auto_16378 ) ( not ( = ?auto_16375 ?auto_16376 ) ) ( SURFACE-AT ?auto_16373 ?auto_16378 ) ( ON ?auto_16373 ?auto_16380 ) ( CLEAR ?auto_16373 ) ( not ( = ?auto_16373 ?auto_16380 ) ) ( not ( = ?auto_16374 ?auto_16380 ) ) ( LIFTING ?auto_16376 ?auto_16381 ) ( IS-CRATE ?auto_16381 ) ( not ( = ?auto_16373 ?auto_16381 ) ) ( not ( = ?auto_16374 ?auto_16381 ) ) ( not ( = ?auto_16380 ?auto_16381 ) ) )
    :subtasks
    ( ( !LOAD ?auto_16376 ?auto_16381 ?auto_16379 ?auto_16378 )
      ( MAKE-ON ?auto_16373 ?auto_16374 )
      ( MAKE-ON-VERIFY ?auto_16373 ?auto_16374 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16489 - SURFACE
      ?auto_16490 - SURFACE
    )
    :vars
    (
      ?auto_16496 - HOIST
      ?auto_16492 - PLACE
      ?auto_16491 - PLACE
      ?auto_16495 - HOIST
      ?auto_16493 - SURFACE
      ?auto_16494 - TRUCK
      ?auto_16497 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16496 ?auto_16492 ) ( SURFACE-AT ?auto_16490 ?auto_16492 ) ( CLEAR ?auto_16490 ) ( IS-CRATE ?auto_16489 ) ( not ( = ?auto_16489 ?auto_16490 ) ) ( not ( = ?auto_16491 ?auto_16492 ) ) ( HOIST-AT ?auto_16495 ?auto_16491 ) ( not ( = ?auto_16496 ?auto_16495 ) ) ( AVAILABLE ?auto_16495 ) ( SURFACE-AT ?auto_16489 ?auto_16491 ) ( ON ?auto_16489 ?auto_16493 ) ( CLEAR ?auto_16489 ) ( not ( = ?auto_16489 ?auto_16493 ) ) ( not ( = ?auto_16490 ?auto_16493 ) ) ( TRUCK-AT ?auto_16494 ?auto_16492 ) ( LIFTING ?auto_16496 ?auto_16497 ) ( IS-CRATE ?auto_16497 ) ( not ( = ?auto_16489 ?auto_16497 ) ) ( not ( = ?auto_16490 ?auto_16497 ) ) ( not ( = ?auto_16493 ?auto_16497 ) ) )
    :subtasks
    ( ( !LOAD ?auto_16496 ?auto_16497 ?auto_16494 ?auto_16492 )
      ( MAKE-ON ?auto_16489 ?auto_16490 )
      ( MAKE-ON-VERIFY ?auto_16489 ?auto_16490 ) )
  )

)

