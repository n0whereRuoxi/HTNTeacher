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

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-6CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( CLEAR ?c6 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-7CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( CLEAR ?c7 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-8CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( CLEAR ?c8 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-9CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( CLEAR ?c9 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-10CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( CLEAR ?c10 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-11CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( CLEAR ?c11 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-12CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( CLEAR ?c12 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-13CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
      ?c13 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( CLEAR ?c13 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13990 - SURFACE
      ?auto_13991 - SURFACE
    )
    :vars
    (
      ?auto_13992 - HOIST
      ?auto_13993 - PLACE
      ?auto_13995 - PLACE
      ?auto_13996 - HOIST
      ?auto_13997 - SURFACE
      ?auto_13994 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13992 ?auto_13993 ) ( SURFACE-AT ?auto_13990 ?auto_13993 ) ( CLEAR ?auto_13990 ) ( IS-CRATE ?auto_13991 ) ( AVAILABLE ?auto_13992 ) ( not ( = ?auto_13995 ?auto_13993 ) ) ( HOIST-AT ?auto_13996 ?auto_13995 ) ( AVAILABLE ?auto_13996 ) ( SURFACE-AT ?auto_13991 ?auto_13995 ) ( ON ?auto_13991 ?auto_13997 ) ( CLEAR ?auto_13991 ) ( TRUCK-AT ?auto_13994 ?auto_13993 ) ( not ( = ?auto_13990 ?auto_13991 ) ) ( not ( = ?auto_13990 ?auto_13997 ) ) ( not ( = ?auto_13991 ?auto_13997 ) ) ( not ( = ?auto_13992 ?auto_13996 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13994 ?auto_13993 ?auto_13995 )
      ( !LIFT ?auto_13996 ?auto_13991 ?auto_13997 ?auto_13995 )
      ( !LOAD ?auto_13996 ?auto_13991 ?auto_13994 ?auto_13995 )
      ( !DRIVE ?auto_13994 ?auto_13995 ?auto_13993 )
      ( !UNLOAD ?auto_13992 ?auto_13991 ?auto_13994 ?auto_13993 )
      ( !DROP ?auto_13992 ?auto_13991 ?auto_13990 ?auto_13993 )
      ( MAKE-1CRATE-VERIFY ?auto_13990 ?auto_13991 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14011 - SURFACE
      ?auto_14012 - SURFACE
      ?auto_14013 - SURFACE
    )
    :vars
    (
      ?auto_14019 - HOIST
      ?auto_14017 - PLACE
      ?auto_14016 - PLACE
      ?auto_14018 - HOIST
      ?auto_14015 - SURFACE
      ?auto_14022 - PLACE
      ?auto_14021 - HOIST
      ?auto_14020 - SURFACE
      ?auto_14014 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14019 ?auto_14017 ) ( IS-CRATE ?auto_14013 ) ( not ( = ?auto_14016 ?auto_14017 ) ) ( HOIST-AT ?auto_14018 ?auto_14016 ) ( AVAILABLE ?auto_14018 ) ( SURFACE-AT ?auto_14013 ?auto_14016 ) ( ON ?auto_14013 ?auto_14015 ) ( CLEAR ?auto_14013 ) ( not ( = ?auto_14012 ?auto_14013 ) ) ( not ( = ?auto_14012 ?auto_14015 ) ) ( not ( = ?auto_14013 ?auto_14015 ) ) ( not ( = ?auto_14019 ?auto_14018 ) ) ( SURFACE-AT ?auto_14011 ?auto_14017 ) ( CLEAR ?auto_14011 ) ( IS-CRATE ?auto_14012 ) ( AVAILABLE ?auto_14019 ) ( not ( = ?auto_14022 ?auto_14017 ) ) ( HOIST-AT ?auto_14021 ?auto_14022 ) ( AVAILABLE ?auto_14021 ) ( SURFACE-AT ?auto_14012 ?auto_14022 ) ( ON ?auto_14012 ?auto_14020 ) ( CLEAR ?auto_14012 ) ( TRUCK-AT ?auto_14014 ?auto_14017 ) ( not ( = ?auto_14011 ?auto_14012 ) ) ( not ( = ?auto_14011 ?auto_14020 ) ) ( not ( = ?auto_14012 ?auto_14020 ) ) ( not ( = ?auto_14019 ?auto_14021 ) ) ( not ( = ?auto_14011 ?auto_14013 ) ) ( not ( = ?auto_14011 ?auto_14015 ) ) ( not ( = ?auto_14013 ?auto_14020 ) ) ( not ( = ?auto_14016 ?auto_14022 ) ) ( not ( = ?auto_14018 ?auto_14021 ) ) ( not ( = ?auto_14015 ?auto_14020 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14011 ?auto_14012 )
      ( MAKE-1CRATE ?auto_14012 ?auto_14013 )
      ( MAKE-2CRATE-VERIFY ?auto_14011 ?auto_14012 ?auto_14013 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14037 - SURFACE
      ?auto_14038 - SURFACE
      ?auto_14039 - SURFACE
      ?auto_14040 - SURFACE
    )
    :vars
    (
      ?auto_14043 - HOIST
      ?auto_14045 - PLACE
      ?auto_14044 - PLACE
      ?auto_14041 - HOIST
      ?auto_14042 - SURFACE
      ?auto_14048 - PLACE
      ?auto_14051 - HOIST
      ?auto_14050 - SURFACE
      ?auto_14052 - PLACE
      ?auto_14049 - HOIST
      ?auto_14047 - SURFACE
      ?auto_14046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14043 ?auto_14045 ) ( IS-CRATE ?auto_14040 ) ( not ( = ?auto_14044 ?auto_14045 ) ) ( HOIST-AT ?auto_14041 ?auto_14044 ) ( AVAILABLE ?auto_14041 ) ( SURFACE-AT ?auto_14040 ?auto_14044 ) ( ON ?auto_14040 ?auto_14042 ) ( CLEAR ?auto_14040 ) ( not ( = ?auto_14039 ?auto_14040 ) ) ( not ( = ?auto_14039 ?auto_14042 ) ) ( not ( = ?auto_14040 ?auto_14042 ) ) ( not ( = ?auto_14043 ?auto_14041 ) ) ( IS-CRATE ?auto_14039 ) ( not ( = ?auto_14048 ?auto_14045 ) ) ( HOIST-AT ?auto_14051 ?auto_14048 ) ( AVAILABLE ?auto_14051 ) ( SURFACE-AT ?auto_14039 ?auto_14048 ) ( ON ?auto_14039 ?auto_14050 ) ( CLEAR ?auto_14039 ) ( not ( = ?auto_14038 ?auto_14039 ) ) ( not ( = ?auto_14038 ?auto_14050 ) ) ( not ( = ?auto_14039 ?auto_14050 ) ) ( not ( = ?auto_14043 ?auto_14051 ) ) ( SURFACE-AT ?auto_14037 ?auto_14045 ) ( CLEAR ?auto_14037 ) ( IS-CRATE ?auto_14038 ) ( AVAILABLE ?auto_14043 ) ( not ( = ?auto_14052 ?auto_14045 ) ) ( HOIST-AT ?auto_14049 ?auto_14052 ) ( AVAILABLE ?auto_14049 ) ( SURFACE-AT ?auto_14038 ?auto_14052 ) ( ON ?auto_14038 ?auto_14047 ) ( CLEAR ?auto_14038 ) ( TRUCK-AT ?auto_14046 ?auto_14045 ) ( not ( = ?auto_14037 ?auto_14038 ) ) ( not ( = ?auto_14037 ?auto_14047 ) ) ( not ( = ?auto_14038 ?auto_14047 ) ) ( not ( = ?auto_14043 ?auto_14049 ) ) ( not ( = ?auto_14037 ?auto_14039 ) ) ( not ( = ?auto_14037 ?auto_14050 ) ) ( not ( = ?auto_14039 ?auto_14047 ) ) ( not ( = ?auto_14048 ?auto_14052 ) ) ( not ( = ?auto_14051 ?auto_14049 ) ) ( not ( = ?auto_14050 ?auto_14047 ) ) ( not ( = ?auto_14037 ?auto_14040 ) ) ( not ( = ?auto_14037 ?auto_14042 ) ) ( not ( = ?auto_14038 ?auto_14040 ) ) ( not ( = ?auto_14038 ?auto_14042 ) ) ( not ( = ?auto_14040 ?auto_14050 ) ) ( not ( = ?auto_14040 ?auto_14047 ) ) ( not ( = ?auto_14044 ?auto_14048 ) ) ( not ( = ?auto_14044 ?auto_14052 ) ) ( not ( = ?auto_14041 ?auto_14051 ) ) ( not ( = ?auto_14041 ?auto_14049 ) ) ( not ( = ?auto_14042 ?auto_14050 ) ) ( not ( = ?auto_14042 ?auto_14047 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14037 ?auto_14038 ?auto_14039 )
      ( MAKE-1CRATE ?auto_14039 ?auto_14040 )
      ( MAKE-3CRATE-VERIFY ?auto_14037 ?auto_14038 ?auto_14039 ?auto_14040 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14068 - SURFACE
      ?auto_14069 - SURFACE
      ?auto_14070 - SURFACE
      ?auto_14071 - SURFACE
      ?auto_14072 - SURFACE
    )
    :vars
    (
      ?auto_14078 - HOIST
      ?auto_14076 - PLACE
      ?auto_14075 - PLACE
      ?auto_14074 - HOIST
      ?auto_14077 - SURFACE
      ?auto_14081 - PLACE
      ?auto_14083 - HOIST
      ?auto_14086 - SURFACE
      ?auto_14080 - PLACE
      ?auto_14082 - HOIST
      ?auto_14087 - SURFACE
      ?auto_14084 - PLACE
      ?auto_14085 - HOIST
      ?auto_14079 - SURFACE
      ?auto_14073 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14078 ?auto_14076 ) ( IS-CRATE ?auto_14072 ) ( not ( = ?auto_14075 ?auto_14076 ) ) ( HOIST-AT ?auto_14074 ?auto_14075 ) ( AVAILABLE ?auto_14074 ) ( SURFACE-AT ?auto_14072 ?auto_14075 ) ( ON ?auto_14072 ?auto_14077 ) ( CLEAR ?auto_14072 ) ( not ( = ?auto_14071 ?auto_14072 ) ) ( not ( = ?auto_14071 ?auto_14077 ) ) ( not ( = ?auto_14072 ?auto_14077 ) ) ( not ( = ?auto_14078 ?auto_14074 ) ) ( IS-CRATE ?auto_14071 ) ( not ( = ?auto_14081 ?auto_14076 ) ) ( HOIST-AT ?auto_14083 ?auto_14081 ) ( AVAILABLE ?auto_14083 ) ( SURFACE-AT ?auto_14071 ?auto_14081 ) ( ON ?auto_14071 ?auto_14086 ) ( CLEAR ?auto_14071 ) ( not ( = ?auto_14070 ?auto_14071 ) ) ( not ( = ?auto_14070 ?auto_14086 ) ) ( not ( = ?auto_14071 ?auto_14086 ) ) ( not ( = ?auto_14078 ?auto_14083 ) ) ( IS-CRATE ?auto_14070 ) ( not ( = ?auto_14080 ?auto_14076 ) ) ( HOIST-AT ?auto_14082 ?auto_14080 ) ( AVAILABLE ?auto_14082 ) ( SURFACE-AT ?auto_14070 ?auto_14080 ) ( ON ?auto_14070 ?auto_14087 ) ( CLEAR ?auto_14070 ) ( not ( = ?auto_14069 ?auto_14070 ) ) ( not ( = ?auto_14069 ?auto_14087 ) ) ( not ( = ?auto_14070 ?auto_14087 ) ) ( not ( = ?auto_14078 ?auto_14082 ) ) ( SURFACE-AT ?auto_14068 ?auto_14076 ) ( CLEAR ?auto_14068 ) ( IS-CRATE ?auto_14069 ) ( AVAILABLE ?auto_14078 ) ( not ( = ?auto_14084 ?auto_14076 ) ) ( HOIST-AT ?auto_14085 ?auto_14084 ) ( AVAILABLE ?auto_14085 ) ( SURFACE-AT ?auto_14069 ?auto_14084 ) ( ON ?auto_14069 ?auto_14079 ) ( CLEAR ?auto_14069 ) ( TRUCK-AT ?auto_14073 ?auto_14076 ) ( not ( = ?auto_14068 ?auto_14069 ) ) ( not ( = ?auto_14068 ?auto_14079 ) ) ( not ( = ?auto_14069 ?auto_14079 ) ) ( not ( = ?auto_14078 ?auto_14085 ) ) ( not ( = ?auto_14068 ?auto_14070 ) ) ( not ( = ?auto_14068 ?auto_14087 ) ) ( not ( = ?auto_14070 ?auto_14079 ) ) ( not ( = ?auto_14080 ?auto_14084 ) ) ( not ( = ?auto_14082 ?auto_14085 ) ) ( not ( = ?auto_14087 ?auto_14079 ) ) ( not ( = ?auto_14068 ?auto_14071 ) ) ( not ( = ?auto_14068 ?auto_14086 ) ) ( not ( = ?auto_14069 ?auto_14071 ) ) ( not ( = ?auto_14069 ?auto_14086 ) ) ( not ( = ?auto_14071 ?auto_14087 ) ) ( not ( = ?auto_14071 ?auto_14079 ) ) ( not ( = ?auto_14081 ?auto_14080 ) ) ( not ( = ?auto_14081 ?auto_14084 ) ) ( not ( = ?auto_14083 ?auto_14082 ) ) ( not ( = ?auto_14083 ?auto_14085 ) ) ( not ( = ?auto_14086 ?auto_14087 ) ) ( not ( = ?auto_14086 ?auto_14079 ) ) ( not ( = ?auto_14068 ?auto_14072 ) ) ( not ( = ?auto_14068 ?auto_14077 ) ) ( not ( = ?auto_14069 ?auto_14072 ) ) ( not ( = ?auto_14069 ?auto_14077 ) ) ( not ( = ?auto_14070 ?auto_14072 ) ) ( not ( = ?auto_14070 ?auto_14077 ) ) ( not ( = ?auto_14072 ?auto_14086 ) ) ( not ( = ?auto_14072 ?auto_14087 ) ) ( not ( = ?auto_14072 ?auto_14079 ) ) ( not ( = ?auto_14075 ?auto_14081 ) ) ( not ( = ?auto_14075 ?auto_14080 ) ) ( not ( = ?auto_14075 ?auto_14084 ) ) ( not ( = ?auto_14074 ?auto_14083 ) ) ( not ( = ?auto_14074 ?auto_14082 ) ) ( not ( = ?auto_14074 ?auto_14085 ) ) ( not ( = ?auto_14077 ?auto_14086 ) ) ( not ( = ?auto_14077 ?auto_14087 ) ) ( not ( = ?auto_14077 ?auto_14079 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_14068 ?auto_14069 ?auto_14070 ?auto_14071 )
      ( MAKE-1CRATE ?auto_14071 ?auto_14072 )
      ( MAKE-4CRATE-VERIFY ?auto_14068 ?auto_14069 ?auto_14070 ?auto_14071 ?auto_14072 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14104 - SURFACE
      ?auto_14105 - SURFACE
      ?auto_14106 - SURFACE
      ?auto_14107 - SURFACE
      ?auto_14108 - SURFACE
      ?auto_14109 - SURFACE
    )
    :vars
    (
      ?auto_14113 - HOIST
      ?auto_14114 - PLACE
      ?auto_14112 - PLACE
      ?auto_14115 - HOIST
      ?auto_14110 - SURFACE
      ?auto_14124 - PLACE
      ?auto_14123 - HOIST
      ?auto_14119 - SURFACE
      ?auto_14126 - PLACE
      ?auto_14118 - HOIST
      ?auto_14120 - SURFACE
      ?auto_14121 - PLACE
      ?auto_14122 - HOIST
      ?auto_14116 - SURFACE
      ?auto_14117 - PLACE
      ?auto_14127 - HOIST
      ?auto_14125 - SURFACE
      ?auto_14111 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14113 ?auto_14114 ) ( IS-CRATE ?auto_14109 ) ( not ( = ?auto_14112 ?auto_14114 ) ) ( HOIST-AT ?auto_14115 ?auto_14112 ) ( AVAILABLE ?auto_14115 ) ( SURFACE-AT ?auto_14109 ?auto_14112 ) ( ON ?auto_14109 ?auto_14110 ) ( CLEAR ?auto_14109 ) ( not ( = ?auto_14108 ?auto_14109 ) ) ( not ( = ?auto_14108 ?auto_14110 ) ) ( not ( = ?auto_14109 ?auto_14110 ) ) ( not ( = ?auto_14113 ?auto_14115 ) ) ( IS-CRATE ?auto_14108 ) ( not ( = ?auto_14124 ?auto_14114 ) ) ( HOIST-AT ?auto_14123 ?auto_14124 ) ( AVAILABLE ?auto_14123 ) ( SURFACE-AT ?auto_14108 ?auto_14124 ) ( ON ?auto_14108 ?auto_14119 ) ( CLEAR ?auto_14108 ) ( not ( = ?auto_14107 ?auto_14108 ) ) ( not ( = ?auto_14107 ?auto_14119 ) ) ( not ( = ?auto_14108 ?auto_14119 ) ) ( not ( = ?auto_14113 ?auto_14123 ) ) ( IS-CRATE ?auto_14107 ) ( not ( = ?auto_14126 ?auto_14114 ) ) ( HOIST-AT ?auto_14118 ?auto_14126 ) ( AVAILABLE ?auto_14118 ) ( SURFACE-AT ?auto_14107 ?auto_14126 ) ( ON ?auto_14107 ?auto_14120 ) ( CLEAR ?auto_14107 ) ( not ( = ?auto_14106 ?auto_14107 ) ) ( not ( = ?auto_14106 ?auto_14120 ) ) ( not ( = ?auto_14107 ?auto_14120 ) ) ( not ( = ?auto_14113 ?auto_14118 ) ) ( IS-CRATE ?auto_14106 ) ( not ( = ?auto_14121 ?auto_14114 ) ) ( HOIST-AT ?auto_14122 ?auto_14121 ) ( AVAILABLE ?auto_14122 ) ( SURFACE-AT ?auto_14106 ?auto_14121 ) ( ON ?auto_14106 ?auto_14116 ) ( CLEAR ?auto_14106 ) ( not ( = ?auto_14105 ?auto_14106 ) ) ( not ( = ?auto_14105 ?auto_14116 ) ) ( not ( = ?auto_14106 ?auto_14116 ) ) ( not ( = ?auto_14113 ?auto_14122 ) ) ( SURFACE-AT ?auto_14104 ?auto_14114 ) ( CLEAR ?auto_14104 ) ( IS-CRATE ?auto_14105 ) ( AVAILABLE ?auto_14113 ) ( not ( = ?auto_14117 ?auto_14114 ) ) ( HOIST-AT ?auto_14127 ?auto_14117 ) ( AVAILABLE ?auto_14127 ) ( SURFACE-AT ?auto_14105 ?auto_14117 ) ( ON ?auto_14105 ?auto_14125 ) ( CLEAR ?auto_14105 ) ( TRUCK-AT ?auto_14111 ?auto_14114 ) ( not ( = ?auto_14104 ?auto_14105 ) ) ( not ( = ?auto_14104 ?auto_14125 ) ) ( not ( = ?auto_14105 ?auto_14125 ) ) ( not ( = ?auto_14113 ?auto_14127 ) ) ( not ( = ?auto_14104 ?auto_14106 ) ) ( not ( = ?auto_14104 ?auto_14116 ) ) ( not ( = ?auto_14106 ?auto_14125 ) ) ( not ( = ?auto_14121 ?auto_14117 ) ) ( not ( = ?auto_14122 ?auto_14127 ) ) ( not ( = ?auto_14116 ?auto_14125 ) ) ( not ( = ?auto_14104 ?auto_14107 ) ) ( not ( = ?auto_14104 ?auto_14120 ) ) ( not ( = ?auto_14105 ?auto_14107 ) ) ( not ( = ?auto_14105 ?auto_14120 ) ) ( not ( = ?auto_14107 ?auto_14116 ) ) ( not ( = ?auto_14107 ?auto_14125 ) ) ( not ( = ?auto_14126 ?auto_14121 ) ) ( not ( = ?auto_14126 ?auto_14117 ) ) ( not ( = ?auto_14118 ?auto_14122 ) ) ( not ( = ?auto_14118 ?auto_14127 ) ) ( not ( = ?auto_14120 ?auto_14116 ) ) ( not ( = ?auto_14120 ?auto_14125 ) ) ( not ( = ?auto_14104 ?auto_14108 ) ) ( not ( = ?auto_14104 ?auto_14119 ) ) ( not ( = ?auto_14105 ?auto_14108 ) ) ( not ( = ?auto_14105 ?auto_14119 ) ) ( not ( = ?auto_14106 ?auto_14108 ) ) ( not ( = ?auto_14106 ?auto_14119 ) ) ( not ( = ?auto_14108 ?auto_14120 ) ) ( not ( = ?auto_14108 ?auto_14116 ) ) ( not ( = ?auto_14108 ?auto_14125 ) ) ( not ( = ?auto_14124 ?auto_14126 ) ) ( not ( = ?auto_14124 ?auto_14121 ) ) ( not ( = ?auto_14124 ?auto_14117 ) ) ( not ( = ?auto_14123 ?auto_14118 ) ) ( not ( = ?auto_14123 ?auto_14122 ) ) ( not ( = ?auto_14123 ?auto_14127 ) ) ( not ( = ?auto_14119 ?auto_14120 ) ) ( not ( = ?auto_14119 ?auto_14116 ) ) ( not ( = ?auto_14119 ?auto_14125 ) ) ( not ( = ?auto_14104 ?auto_14109 ) ) ( not ( = ?auto_14104 ?auto_14110 ) ) ( not ( = ?auto_14105 ?auto_14109 ) ) ( not ( = ?auto_14105 ?auto_14110 ) ) ( not ( = ?auto_14106 ?auto_14109 ) ) ( not ( = ?auto_14106 ?auto_14110 ) ) ( not ( = ?auto_14107 ?auto_14109 ) ) ( not ( = ?auto_14107 ?auto_14110 ) ) ( not ( = ?auto_14109 ?auto_14119 ) ) ( not ( = ?auto_14109 ?auto_14120 ) ) ( not ( = ?auto_14109 ?auto_14116 ) ) ( not ( = ?auto_14109 ?auto_14125 ) ) ( not ( = ?auto_14112 ?auto_14124 ) ) ( not ( = ?auto_14112 ?auto_14126 ) ) ( not ( = ?auto_14112 ?auto_14121 ) ) ( not ( = ?auto_14112 ?auto_14117 ) ) ( not ( = ?auto_14115 ?auto_14123 ) ) ( not ( = ?auto_14115 ?auto_14118 ) ) ( not ( = ?auto_14115 ?auto_14122 ) ) ( not ( = ?auto_14115 ?auto_14127 ) ) ( not ( = ?auto_14110 ?auto_14119 ) ) ( not ( = ?auto_14110 ?auto_14120 ) ) ( not ( = ?auto_14110 ?auto_14116 ) ) ( not ( = ?auto_14110 ?auto_14125 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_14104 ?auto_14105 ?auto_14106 ?auto_14107 ?auto_14108 )
      ( MAKE-1CRATE ?auto_14108 ?auto_14109 )
      ( MAKE-5CRATE-VERIFY ?auto_14104 ?auto_14105 ?auto_14106 ?auto_14107 ?auto_14108 ?auto_14109 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_14145 - SURFACE
      ?auto_14146 - SURFACE
      ?auto_14147 - SURFACE
      ?auto_14148 - SURFACE
      ?auto_14149 - SURFACE
      ?auto_14150 - SURFACE
      ?auto_14151 - SURFACE
    )
    :vars
    (
      ?auto_14156 - HOIST
      ?auto_14152 - PLACE
      ?auto_14154 - PLACE
      ?auto_14155 - HOIST
      ?auto_14153 - SURFACE
      ?auto_14159 - PLACE
      ?auto_14169 - HOIST
      ?auto_14168 - SURFACE
      ?auto_14166 - PLACE
      ?auto_14163 - HOIST
      ?auto_14158 - SURFACE
      ?auto_14170 - PLACE
      ?auto_14165 - HOIST
      ?auto_14161 - SURFACE
      ?auto_14172 - PLACE
      ?auto_14162 - HOIST
      ?auto_14160 - SURFACE
      ?auto_14171 - PLACE
      ?auto_14167 - HOIST
      ?auto_14164 - SURFACE
      ?auto_14157 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14156 ?auto_14152 ) ( IS-CRATE ?auto_14151 ) ( not ( = ?auto_14154 ?auto_14152 ) ) ( HOIST-AT ?auto_14155 ?auto_14154 ) ( AVAILABLE ?auto_14155 ) ( SURFACE-AT ?auto_14151 ?auto_14154 ) ( ON ?auto_14151 ?auto_14153 ) ( CLEAR ?auto_14151 ) ( not ( = ?auto_14150 ?auto_14151 ) ) ( not ( = ?auto_14150 ?auto_14153 ) ) ( not ( = ?auto_14151 ?auto_14153 ) ) ( not ( = ?auto_14156 ?auto_14155 ) ) ( IS-CRATE ?auto_14150 ) ( not ( = ?auto_14159 ?auto_14152 ) ) ( HOIST-AT ?auto_14169 ?auto_14159 ) ( AVAILABLE ?auto_14169 ) ( SURFACE-AT ?auto_14150 ?auto_14159 ) ( ON ?auto_14150 ?auto_14168 ) ( CLEAR ?auto_14150 ) ( not ( = ?auto_14149 ?auto_14150 ) ) ( not ( = ?auto_14149 ?auto_14168 ) ) ( not ( = ?auto_14150 ?auto_14168 ) ) ( not ( = ?auto_14156 ?auto_14169 ) ) ( IS-CRATE ?auto_14149 ) ( not ( = ?auto_14166 ?auto_14152 ) ) ( HOIST-AT ?auto_14163 ?auto_14166 ) ( AVAILABLE ?auto_14163 ) ( SURFACE-AT ?auto_14149 ?auto_14166 ) ( ON ?auto_14149 ?auto_14158 ) ( CLEAR ?auto_14149 ) ( not ( = ?auto_14148 ?auto_14149 ) ) ( not ( = ?auto_14148 ?auto_14158 ) ) ( not ( = ?auto_14149 ?auto_14158 ) ) ( not ( = ?auto_14156 ?auto_14163 ) ) ( IS-CRATE ?auto_14148 ) ( not ( = ?auto_14170 ?auto_14152 ) ) ( HOIST-AT ?auto_14165 ?auto_14170 ) ( AVAILABLE ?auto_14165 ) ( SURFACE-AT ?auto_14148 ?auto_14170 ) ( ON ?auto_14148 ?auto_14161 ) ( CLEAR ?auto_14148 ) ( not ( = ?auto_14147 ?auto_14148 ) ) ( not ( = ?auto_14147 ?auto_14161 ) ) ( not ( = ?auto_14148 ?auto_14161 ) ) ( not ( = ?auto_14156 ?auto_14165 ) ) ( IS-CRATE ?auto_14147 ) ( not ( = ?auto_14172 ?auto_14152 ) ) ( HOIST-AT ?auto_14162 ?auto_14172 ) ( AVAILABLE ?auto_14162 ) ( SURFACE-AT ?auto_14147 ?auto_14172 ) ( ON ?auto_14147 ?auto_14160 ) ( CLEAR ?auto_14147 ) ( not ( = ?auto_14146 ?auto_14147 ) ) ( not ( = ?auto_14146 ?auto_14160 ) ) ( not ( = ?auto_14147 ?auto_14160 ) ) ( not ( = ?auto_14156 ?auto_14162 ) ) ( SURFACE-AT ?auto_14145 ?auto_14152 ) ( CLEAR ?auto_14145 ) ( IS-CRATE ?auto_14146 ) ( AVAILABLE ?auto_14156 ) ( not ( = ?auto_14171 ?auto_14152 ) ) ( HOIST-AT ?auto_14167 ?auto_14171 ) ( AVAILABLE ?auto_14167 ) ( SURFACE-AT ?auto_14146 ?auto_14171 ) ( ON ?auto_14146 ?auto_14164 ) ( CLEAR ?auto_14146 ) ( TRUCK-AT ?auto_14157 ?auto_14152 ) ( not ( = ?auto_14145 ?auto_14146 ) ) ( not ( = ?auto_14145 ?auto_14164 ) ) ( not ( = ?auto_14146 ?auto_14164 ) ) ( not ( = ?auto_14156 ?auto_14167 ) ) ( not ( = ?auto_14145 ?auto_14147 ) ) ( not ( = ?auto_14145 ?auto_14160 ) ) ( not ( = ?auto_14147 ?auto_14164 ) ) ( not ( = ?auto_14172 ?auto_14171 ) ) ( not ( = ?auto_14162 ?auto_14167 ) ) ( not ( = ?auto_14160 ?auto_14164 ) ) ( not ( = ?auto_14145 ?auto_14148 ) ) ( not ( = ?auto_14145 ?auto_14161 ) ) ( not ( = ?auto_14146 ?auto_14148 ) ) ( not ( = ?auto_14146 ?auto_14161 ) ) ( not ( = ?auto_14148 ?auto_14160 ) ) ( not ( = ?auto_14148 ?auto_14164 ) ) ( not ( = ?auto_14170 ?auto_14172 ) ) ( not ( = ?auto_14170 ?auto_14171 ) ) ( not ( = ?auto_14165 ?auto_14162 ) ) ( not ( = ?auto_14165 ?auto_14167 ) ) ( not ( = ?auto_14161 ?auto_14160 ) ) ( not ( = ?auto_14161 ?auto_14164 ) ) ( not ( = ?auto_14145 ?auto_14149 ) ) ( not ( = ?auto_14145 ?auto_14158 ) ) ( not ( = ?auto_14146 ?auto_14149 ) ) ( not ( = ?auto_14146 ?auto_14158 ) ) ( not ( = ?auto_14147 ?auto_14149 ) ) ( not ( = ?auto_14147 ?auto_14158 ) ) ( not ( = ?auto_14149 ?auto_14161 ) ) ( not ( = ?auto_14149 ?auto_14160 ) ) ( not ( = ?auto_14149 ?auto_14164 ) ) ( not ( = ?auto_14166 ?auto_14170 ) ) ( not ( = ?auto_14166 ?auto_14172 ) ) ( not ( = ?auto_14166 ?auto_14171 ) ) ( not ( = ?auto_14163 ?auto_14165 ) ) ( not ( = ?auto_14163 ?auto_14162 ) ) ( not ( = ?auto_14163 ?auto_14167 ) ) ( not ( = ?auto_14158 ?auto_14161 ) ) ( not ( = ?auto_14158 ?auto_14160 ) ) ( not ( = ?auto_14158 ?auto_14164 ) ) ( not ( = ?auto_14145 ?auto_14150 ) ) ( not ( = ?auto_14145 ?auto_14168 ) ) ( not ( = ?auto_14146 ?auto_14150 ) ) ( not ( = ?auto_14146 ?auto_14168 ) ) ( not ( = ?auto_14147 ?auto_14150 ) ) ( not ( = ?auto_14147 ?auto_14168 ) ) ( not ( = ?auto_14148 ?auto_14150 ) ) ( not ( = ?auto_14148 ?auto_14168 ) ) ( not ( = ?auto_14150 ?auto_14158 ) ) ( not ( = ?auto_14150 ?auto_14161 ) ) ( not ( = ?auto_14150 ?auto_14160 ) ) ( not ( = ?auto_14150 ?auto_14164 ) ) ( not ( = ?auto_14159 ?auto_14166 ) ) ( not ( = ?auto_14159 ?auto_14170 ) ) ( not ( = ?auto_14159 ?auto_14172 ) ) ( not ( = ?auto_14159 ?auto_14171 ) ) ( not ( = ?auto_14169 ?auto_14163 ) ) ( not ( = ?auto_14169 ?auto_14165 ) ) ( not ( = ?auto_14169 ?auto_14162 ) ) ( not ( = ?auto_14169 ?auto_14167 ) ) ( not ( = ?auto_14168 ?auto_14158 ) ) ( not ( = ?auto_14168 ?auto_14161 ) ) ( not ( = ?auto_14168 ?auto_14160 ) ) ( not ( = ?auto_14168 ?auto_14164 ) ) ( not ( = ?auto_14145 ?auto_14151 ) ) ( not ( = ?auto_14145 ?auto_14153 ) ) ( not ( = ?auto_14146 ?auto_14151 ) ) ( not ( = ?auto_14146 ?auto_14153 ) ) ( not ( = ?auto_14147 ?auto_14151 ) ) ( not ( = ?auto_14147 ?auto_14153 ) ) ( not ( = ?auto_14148 ?auto_14151 ) ) ( not ( = ?auto_14148 ?auto_14153 ) ) ( not ( = ?auto_14149 ?auto_14151 ) ) ( not ( = ?auto_14149 ?auto_14153 ) ) ( not ( = ?auto_14151 ?auto_14168 ) ) ( not ( = ?auto_14151 ?auto_14158 ) ) ( not ( = ?auto_14151 ?auto_14161 ) ) ( not ( = ?auto_14151 ?auto_14160 ) ) ( not ( = ?auto_14151 ?auto_14164 ) ) ( not ( = ?auto_14154 ?auto_14159 ) ) ( not ( = ?auto_14154 ?auto_14166 ) ) ( not ( = ?auto_14154 ?auto_14170 ) ) ( not ( = ?auto_14154 ?auto_14172 ) ) ( not ( = ?auto_14154 ?auto_14171 ) ) ( not ( = ?auto_14155 ?auto_14169 ) ) ( not ( = ?auto_14155 ?auto_14163 ) ) ( not ( = ?auto_14155 ?auto_14165 ) ) ( not ( = ?auto_14155 ?auto_14162 ) ) ( not ( = ?auto_14155 ?auto_14167 ) ) ( not ( = ?auto_14153 ?auto_14168 ) ) ( not ( = ?auto_14153 ?auto_14158 ) ) ( not ( = ?auto_14153 ?auto_14161 ) ) ( not ( = ?auto_14153 ?auto_14160 ) ) ( not ( = ?auto_14153 ?auto_14164 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_14145 ?auto_14146 ?auto_14147 ?auto_14148 ?auto_14149 ?auto_14150 )
      ( MAKE-1CRATE ?auto_14150 ?auto_14151 )
      ( MAKE-6CRATE-VERIFY ?auto_14145 ?auto_14146 ?auto_14147 ?auto_14148 ?auto_14149 ?auto_14150 ?auto_14151 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_14191 - SURFACE
      ?auto_14192 - SURFACE
      ?auto_14193 - SURFACE
      ?auto_14194 - SURFACE
      ?auto_14195 - SURFACE
      ?auto_14196 - SURFACE
      ?auto_14197 - SURFACE
      ?auto_14198 - SURFACE
    )
    :vars
    (
      ?auto_14202 - HOIST
      ?auto_14204 - PLACE
      ?auto_14203 - PLACE
      ?auto_14199 - HOIST
      ?auto_14201 - SURFACE
      ?auto_14217 - PLACE
      ?auto_14216 - HOIST
      ?auto_14209 - SURFACE
      ?auto_14213 - PLACE
      ?auto_14221 - HOIST
      ?auto_14207 - SURFACE
      ?auto_14206 - PLACE
      ?auto_14220 - HOIST
      ?auto_14222 - SURFACE
      ?auto_14210 - PLACE
      ?auto_14208 - HOIST
      ?auto_14212 - SURFACE
      ?auto_14218 - PLACE
      ?auto_14219 - HOIST
      ?auto_14215 - SURFACE
      ?auto_14205 - PLACE
      ?auto_14214 - HOIST
      ?auto_14211 - SURFACE
      ?auto_14200 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14202 ?auto_14204 ) ( IS-CRATE ?auto_14198 ) ( not ( = ?auto_14203 ?auto_14204 ) ) ( HOIST-AT ?auto_14199 ?auto_14203 ) ( AVAILABLE ?auto_14199 ) ( SURFACE-AT ?auto_14198 ?auto_14203 ) ( ON ?auto_14198 ?auto_14201 ) ( CLEAR ?auto_14198 ) ( not ( = ?auto_14197 ?auto_14198 ) ) ( not ( = ?auto_14197 ?auto_14201 ) ) ( not ( = ?auto_14198 ?auto_14201 ) ) ( not ( = ?auto_14202 ?auto_14199 ) ) ( IS-CRATE ?auto_14197 ) ( not ( = ?auto_14217 ?auto_14204 ) ) ( HOIST-AT ?auto_14216 ?auto_14217 ) ( AVAILABLE ?auto_14216 ) ( SURFACE-AT ?auto_14197 ?auto_14217 ) ( ON ?auto_14197 ?auto_14209 ) ( CLEAR ?auto_14197 ) ( not ( = ?auto_14196 ?auto_14197 ) ) ( not ( = ?auto_14196 ?auto_14209 ) ) ( not ( = ?auto_14197 ?auto_14209 ) ) ( not ( = ?auto_14202 ?auto_14216 ) ) ( IS-CRATE ?auto_14196 ) ( not ( = ?auto_14213 ?auto_14204 ) ) ( HOIST-AT ?auto_14221 ?auto_14213 ) ( AVAILABLE ?auto_14221 ) ( SURFACE-AT ?auto_14196 ?auto_14213 ) ( ON ?auto_14196 ?auto_14207 ) ( CLEAR ?auto_14196 ) ( not ( = ?auto_14195 ?auto_14196 ) ) ( not ( = ?auto_14195 ?auto_14207 ) ) ( not ( = ?auto_14196 ?auto_14207 ) ) ( not ( = ?auto_14202 ?auto_14221 ) ) ( IS-CRATE ?auto_14195 ) ( not ( = ?auto_14206 ?auto_14204 ) ) ( HOIST-AT ?auto_14220 ?auto_14206 ) ( AVAILABLE ?auto_14220 ) ( SURFACE-AT ?auto_14195 ?auto_14206 ) ( ON ?auto_14195 ?auto_14222 ) ( CLEAR ?auto_14195 ) ( not ( = ?auto_14194 ?auto_14195 ) ) ( not ( = ?auto_14194 ?auto_14222 ) ) ( not ( = ?auto_14195 ?auto_14222 ) ) ( not ( = ?auto_14202 ?auto_14220 ) ) ( IS-CRATE ?auto_14194 ) ( not ( = ?auto_14210 ?auto_14204 ) ) ( HOIST-AT ?auto_14208 ?auto_14210 ) ( AVAILABLE ?auto_14208 ) ( SURFACE-AT ?auto_14194 ?auto_14210 ) ( ON ?auto_14194 ?auto_14212 ) ( CLEAR ?auto_14194 ) ( not ( = ?auto_14193 ?auto_14194 ) ) ( not ( = ?auto_14193 ?auto_14212 ) ) ( not ( = ?auto_14194 ?auto_14212 ) ) ( not ( = ?auto_14202 ?auto_14208 ) ) ( IS-CRATE ?auto_14193 ) ( not ( = ?auto_14218 ?auto_14204 ) ) ( HOIST-AT ?auto_14219 ?auto_14218 ) ( AVAILABLE ?auto_14219 ) ( SURFACE-AT ?auto_14193 ?auto_14218 ) ( ON ?auto_14193 ?auto_14215 ) ( CLEAR ?auto_14193 ) ( not ( = ?auto_14192 ?auto_14193 ) ) ( not ( = ?auto_14192 ?auto_14215 ) ) ( not ( = ?auto_14193 ?auto_14215 ) ) ( not ( = ?auto_14202 ?auto_14219 ) ) ( SURFACE-AT ?auto_14191 ?auto_14204 ) ( CLEAR ?auto_14191 ) ( IS-CRATE ?auto_14192 ) ( AVAILABLE ?auto_14202 ) ( not ( = ?auto_14205 ?auto_14204 ) ) ( HOIST-AT ?auto_14214 ?auto_14205 ) ( AVAILABLE ?auto_14214 ) ( SURFACE-AT ?auto_14192 ?auto_14205 ) ( ON ?auto_14192 ?auto_14211 ) ( CLEAR ?auto_14192 ) ( TRUCK-AT ?auto_14200 ?auto_14204 ) ( not ( = ?auto_14191 ?auto_14192 ) ) ( not ( = ?auto_14191 ?auto_14211 ) ) ( not ( = ?auto_14192 ?auto_14211 ) ) ( not ( = ?auto_14202 ?auto_14214 ) ) ( not ( = ?auto_14191 ?auto_14193 ) ) ( not ( = ?auto_14191 ?auto_14215 ) ) ( not ( = ?auto_14193 ?auto_14211 ) ) ( not ( = ?auto_14218 ?auto_14205 ) ) ( not ( = ?auto_14219 ?auto_14214 ) ) ( not ( = ?auto_14215 ?auto_14211 ) ) ( not ( = ?auto_14191 ?auto_14194 ) ) ( not ( = ?auto_14191 ?auto_14212 ) ) ( not ( = ?auto_14192 ?auto_14194 ) ) ( not ( = ?auto_14192 ?auto_14212 ) ) ( not ( = ?auto_14194 ?auto_14215 ) ) ( not ( = ?auto_14194 ?auto_14211 ) ) ( not ( = ?auto_14210 ?auto_14218 ) ) ( not ( = ?auto_14210 ?auto_14205 ) ) ( not ( = ?auto_14208 ?auto_14219 ) ) ( not ( = ?auto_14208 ?auto_14214 ) ) ( not ( = ?auto_14212 ?auto_14215 ) ) ( not ( = ?auto_14212 ?auto_14211 ) ) ( not ( = ?auto_14191 ?auto_14195 ) ) ( not ( = ?auto_14191 ?auto_14222 ) ) ( not ( = ?auto_14192 ?auto_14195 ) ) ( not ( = ?auto_14192 ?auto_14222 ) ) ( not ( = ?auto_14193 ?auto_14195 ) ) ( not ( = ?auto_14193 ?auto_14222 ) ) ( not ( = ?auto_14195 ?auto_14212 ) ) ( not ( = ?auto_14195 ?auto_14215 ) ) ( not ( = ?auto_14195 ?auto_14211 ) ) ( not ( = ?auto_14206 ?auto_14210 ) ) ( not ( = ?auto_14206 ?auto_14218 ) ) ( not ( = ?auto_14206 ?auto_14205 ) ) ( not ( = ?auto_14220 ?auto_14208 ) ) ( not ( = ?auto_14220 ?auto_14219 ) ) ( not ( = ?auto_14220 ?auto_14214 ) ) ( not ( = ?auto_14222 ?auto_14212 ) ) ( not ( = ?auto_14222 ?auto_14215 ) ) ( not ( = ?auto_14222 ?auto_14211 ) ) ( not ( = ?auto_14191 ?auto_14196 ) ) ( not ( = ?auto_14191 ?auto_14207 ) ) ( not ( = ?auto_14192 ?auto_14196 ) ) ( not ( = ?auto_14192 ?auto_14207 ) ) ( not ( = ?auto_14193 ?auto_14196 ) ) ( not ( = ?auto_14193 ?auto_14207 ) ) ( not ( = ?auto_14194 ?auto_14196 ) ) ( not ( = ?auto_14194 ?auto_14207 ) ) ( not ( = ?auto_14196 ?auto_14222 ) ) ( not ( = ?auto_14196 ?auto_14212 ) ) ( not ( = ?auto_14196 ?auto_14215 ) ) ( not ( = ?auto_14196 ?auto_14211 ) ) ( not ( = ?auto_14213 ?auto_14206 ) ) ( not ( = ?auto_14213 ?auto_14210 ) ) ( not ( = ?auto_14213 ?auto_14218 ) ) ( not ( = ?auto_14213 ?auto_14205 ) ) ( not ( = ?auto_14221 ?auto_14220 ) ) ( not ( = ?auto_14221 ?auto_14208 ) ) ( not ( = ?auto_14221 ?auto_14219 ) ) ( not ( = ?auto_14221 ?auto_14214 ) ) ( not ( = ?auto_14207 ?auto_14222 ) ) ( not ( = ?auto_14207 ?auto_14212 ) ) ( not ( = ?auto_14207 ?auto_14215 ) ) ( not ( = ?auto_14207 ?auto_14211 ) ) ( not ( = ?auto_14191 ?auto_14197 ) ) ( not ( = ?auto_14191 ?auto_14209 ) ) ( not ( = ?auto_14192 ?auto_14197 ) ) ( not ( = ?auto_14192 ?auto_14209 ) ) ( not ( = ?auto_14193 ?auto_14197 ) ) ( not ( = ?auto_14193 ?auto_14209 ) ) ( not ( = ?auto_14194 ?auto_14197 ) ) ( not ( = ?auto_14194 ?auto_14209 ) ) ( not ( = ?auto_14195 ?auto_14197 ) ) ( not ( = ?auto_14195 ?auto_14209 ) ) ( not ( = ?auto_14197 ?auto_14207 ) ) ( not ( = ?auto_14197 ?auto_14222 ) ) ( not ( = ?auto_14197 ?auto_14212 ) ) ( not ( = ?auto_14197 ?auto_14215 ) ) ( not ( = ?auto_14197 ?auto_14211 ) ) ( not ( = ?auto_14217 ?auto_14213 ) ) ( not ( = ?auto_14217 ?auto_14206 ) ) ( not ( = ?auto_14217 ?auto_14210 ) ) ( not ( = ?auto_14217 ?auto_14218 ) ) ( not ( = ?auto_14217 ?auto_14205 ) ) ( not ( = ?auto_14216 ?auto_14221 ) ) ( not ( = ?auto_14216 ?auto_14220 ) ) ( not ( = ?auto_14216 ?auto_14208 ) ) ( not ( = ?auto_14216 ?auto_14219 ) ) ( not ( = ?auto_14216 ?auto_14214 ) ) ( not ( = ?auto_14209 ?auto_14207 ) ) ( not ( = ?auto_14209 ?auto_14222 ) ) ( not ( = ?auto_14209 ?auto_14212 ) ) ( not ( = ?auto_14209 ?auto_14215 ) ) ( not ( = ?auto_14209 ?auto_14211 ) ) ( not ( = ?auto_14191 ?auto_14198 ) ) ( not ( = ?auto_14191 ?auto_14201 ) ) ( not ( = ?auto_14192 ?auto_14198 ) ) ( not ( = ?auto_14192 ?auto_14201 ) ) ( not ( = ?auto_14193 ?auto_14198 ) ) ( not ( = ?auto_14193 ?auto_14201 ) ) ( not ( = ?auto_14194 ?auto_14198 ) ) ( not ( = ?auto_14194 ?auto_14201 ) ) ( not ( = ?auto_14195 ?auto_14198 ) ) ( not ( = ?auto_14195 ?auto_14201 ) ) ( not ( = ?auto_14196 ?auto_14198 ) ) ( not ( = ?auto_14196 ?auto_14201 ) ) ( not ( = ?auto_14198 ?auto_14209 ) ) ( not ( = ?auto_14198 ?auto_14207 ) ) ( not ( = ?auto_14198 ?auto_14222 ) ) ( not ( = ?auto_14198 ?auto_14212 ) ) ( not ( = ?auto_14198 ?auto_14215 ) ) ( not ( = ?auto_14198 ?auto_14211 ) ) ( not ( = ?auto_14203 ?auto_14217 ) ) ( not ( = ?auto_14203 ?auto_14213 ) ) ( not ( = ?auto_14203 ?auto_14206 ) ) ( not ( = ?auto_14203 ?auto_14210 ) ) ( not ( = ?auto_14203 ?auto_14218 ) ) ( not ( = ?auto_14203 ?auto_14205 ) ) ( not ( = ?auto_14199 ?auto_14216 ) ) ( not ( = ?auto_14199 ?auto_14221 ) ) ( not ( = ?auto_14199 ?auto_14220 ) ) ( not ( = ?auto_14199 ?auto_14208 ) ) ( not ( = ?auto_14199 ?auto_14219 ) ) ( not ( = ?auto_14199 ?auto_14214 ) ) ( not ( = ?auto_14201 ?auto_14209 ) ) ( not ( = ?auto_14201 ?auto_14207 ) ) ( not ( = ?auto_14201 ?auto_14222 ) ) ( not ( = ?auto_14201 ?auto_14212 ) ) ( not ( = ?auto_14201 ?auto_14215 ) ) ( not ( = ?auto_14201 ?auto_14211 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_14191 ?auto_14192 ?auto_14193 ?auto_14194 ?auto_14195 ?auto_14196 ?auto_14197 )
      ( MAKE-1CRATE ?auto_14197 ?auto_14198 )
      ( MAKE-7CRATE-VERIFY ?auto_14191 ?auto_14192 ?auto_14193 ?auto_14194 ?auto_14195 ?auto_14196 ?auto_14197 ?auto_14198 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_14242 - SURFACE
      ?auto_14243 - SURFACE
      ?auto_14244 - SURFACE
      ?auto_14245 - SURFACE
      ?auto_14246 - SURFACE
      ?auto_14247 - SURFACE
      ?auto_14248 - SURFACE
      ?auto_14249 - SURFACE
      ?auto_14250 - SURFACE
    )
    :vars
    (
      ?auto_14256 - HOIST
      ?auto_14255 - PLACE
      ?auto_14252 - PLACE
      ?auto_14253 - HOIST
      ?auto_14251 - SURFACE
      ?auto_14264 - PLACE
      ?auto_14259 - HOIST
      ?auto_14263 - SURFACE
      ?auto_14268 - PLACE
      ?auto_14274 - HOIST
      ?auto_14266 - SURFACE
      ?auto_14269 - PLACE
      ?auto_14270 - HOIST
      ?auto_14273 - SURFACE
      ?auto_14258 - PLACE
      ?auto_14272 - HOIST
      ?auto_14262 - SURFACE
      ?auto_14265 - PLACE
      ?auto_14257 - HOIST
      ?auto_14260 - SURFACE
      ?auto_14261 - PLACE
      ?auto_14271 - HOIST
      ?auto_14275 - SURFACE
      ?auto_14267 - SURFACE
      ?auto_14254 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14256 ?auto_14255 ) ( IS-CRATE ?auto_14250 ) ( not ( = ?auto_14252 ?auto_14255 ) ) ( HOIST-AT ?auto_14253 ?auto_14252 ) ( SURFACE-AT ?auto_14250 ?auto_14252 ) ( ON ?auto_14250 ?auto_14251 ) ( CLEAR ?auto_14250 ) ( not ( = ?auto_14249 ?auto_14250 ) ) ( not ( = ?auto_14249 ?auto_14251 ) ) ( not ( = ?auto_14250 ?auto_14251 ) ) ( not ( = ?auto_14256 ?auto_14253 ) ) ( IS-CRATE ?auto_14249 ) ( not ( = ?auto_14264 ?auto_14255 ) ) ( HOIST-AT ?auto_14259 ?auto_14264 ) ( AVAILABLE ?auto_14259 ) ( SURFACE-AT ?auto_14249 ?auto_14264 ) ( ON ?auto_14249 ?auto_14263 ) ( CLEAR ?auto_14249 ) ( not ( = ?auto_14248 ?auto_14249 ) ) ( not ( = ?auto_14248 ?auto_14263 ) ) ( not ( = ?auto_14249 ?auto_14263 ) ) ( not ( = ?auto_14256 ?auto_14259 ) ) ( IS-CRATE ?auto_14248 ) ( not ( = ?auto_14268 ?auto_14255 ) ) ( HOIST-AT ?auto_14274 ?auto_14268 ) ( AVAILABLE ?auto_14274 ) ( SURFACE-AT ?auto_14248 ?auto_14268 ) ( ON ?auto_14248 ?auto_14266 ) ( CLEAR ?auto_14248 ) ( not ( = ?auto_14247 ?auto_14248 ) ) ( not ( = ?auto_14247 ?auto_14266 ) ) ( not ( = ?auto_14248 ?auto_14266 ) ) ( not ( = ?auto_14256 ?auto_14274 ) ) ( IS-CRATE ?auto_14247 ) ( not ( = ?auto_14269 ?auto_14255 ) ) ( HOIST-AT ?auto_14270 ?auto_14269 ) ( AVAILABLE ?auto_14270 ) ( SURFACE-AT ?auto_14247 ?auto_14269 ) ( ON ?auto_14247 ?auto_14273 ) ( CLEAR ?auto_14247 ) ( not ( = ?auto_14246 ?auto_14247 ) ) ( not ( = ?auto_14246 ?auto_14273 ) ) ( not ( = ?auto_14247 ?auto_14273 ) ) ( not ( = ?auto_14256 ?auto_14270 ) ) ( IS-CRATE ?auto_14246 ) ( not ( = ?auto_14258 ?auto_14255 ) ) ( HOIST-AT ?auto_14272 ?auto_14258 ) ( AVAILABLE ?auto_14272 ) ( SURFACE-AT ?auto_14246 ?auto_14258 ) ( ON ?auto_14246 ?auto_14262 ) ( CLEAR ?auto_14246 ) ( not ( = ?auto_14245 ?auto_14246 ) ) ( not ( = ?auto_14245 ?auto_14262 ) ) ( not ( = ?auto_14246 ?auto_14262 ) ) ( not ( = ?auto_14256 ?auto_14272 ) ) ( IS-CRATE ?auto_14245 ) ( not ( = ?auto_14265 ?auto_14255 ) ) ( HOIST-AT ?auto_14257 ?auto_14265 ) ( AVAILABLE ?auto_14257 ) ( SURFACE-AT ?auto_14245 ?auto_14265 ) ( ON ?auto_14245 ?auto_14260 ) ( CLEAR ?auto_14245 ) ( not ( = ?auto_14244 ?auto_14245 ) ) ( not ( = ?auto_14244 ?auto_14260 ) ) ( not ( = ?auto_14245 ?auto_14260 ) ) ( not ( = ?auto_14256 ?auto_14257 ) ) ( IS-CRATE ?auto_14244 ) ( not ( = ?auto_14261 ?auto_14255 ) ) ( HOIST-AT ?auto_14271 ?auto_14261 ) ( AVAILABLE ?auto_14271 ) ( SURFACE-AT ?auto_14244 ?auto_14261 ) ( ON ?auto_14244 ?auto_14275 ) ( CLEAR ?auto_14244 ) ( not ( = ?auto_14243 ?auto_14244 ) ) ( not ( = ?auto_14243 ?auto_14275 ) ) ( not ( = ?auto_14244 ?auto_14275 ) ) ( not ( = ?auto_14256 ?auto_14271 ) ) ( SURFACE-AT ?auto_14242 ?auto_14255 ) ( CLEAR ?auto_14242 ) ( IS-CRATE ?auto_14243 ) ( AVAILABLE ?auto_14256 ) ( AVAILABLE ?auto_14253 ) ( SURFACE-AT ?auto_14243 ?auto_14252 ) ( ON ?auto_14243 ?auto_14267 ) ( CLEAR ?auto_14243 ) ( TRUCK-AT ?auto_14254 ?auto_14255 ) ( not ( = ?auto_14242 ?auto_14243 ) ) ( not ( = ?auto_14242 ?auto_14267 ) ) ( not ( = ?auto_14243 ?auto_14267 ) ) ( not ( = ?auto_14242 ?auto_14244 ) ) ( not ( = ?auto_14242 ?auto_14275 ) ) ( not ( = ?auto_14244 ?auto_14267 ) ) ( not ( = ?auto_14261 ?auto_14252 ) ) ( not ( = ?auto_14271 ?auto_14253 ) ) ( not ( = ?auto_14275 ?auto_14267 ) ) ( not ( = ?auto_14242 ?auto_14245 ) ) ( not ( = ?auto_14242 ?auto_14260 ) ) ( not ( = ?auto_14243 ?auto_14245 ) ) ( not ( = ?auto_14243 ?auto_14260 ) ) ( not ( = ?auto_14245 ?auto_14275 ) ) ( not ( = ?auto_14245 ?auto_14267 ) ) ( not ( = ?auto_14265 ?auto_14261 ) ) ( not ( = ?auto_14265 ?auto_14252 ) ) ( not ( = ?auto_14257 ?auto_14271 ) ) ( not ( = ?auto_14257 ?auto_14253 ) ) ( not ( = ?auto_14260 ?auto_14275 ) ) ( not ( = ?auto_14260 ?auto_14267 ) ) ( not ( = ?auto_14242 ?auto_14246 ) ) ( not ( = ?auto_14242 ?auto_14262 ) ) ( not ( = ?auto_14243 ?auto_14246 ) ) ( not ( = ?auto_14243 ?auto_14262 ) ) ( not ( = ?auto_14244 ?auto_14246 ) ) ( not ( = ?auto_14244 ?auto_14262 ) ) ( not ( = ?auto_14246 ?auto_14260 ) ) ( not ( = ?auto_14246 ?auto_14275 ) ) ( not ( = ?auto_14246 ?auto_14267 ) ) ( not ( = ?auto_14258 ?auto_14265 ) ) ( not ( = ?auto_14258 ?auto_14261 ) ) ( not ( = ?auto_14258 ?auto_14252 ) ) ( not ( = ?auto_14272 ?auto_14257 ) ) ( not ( = ?auto_14272 ?auto_14271 ) ) ( not ( = ?auto_14272 ?auto_14253 ) ) ( not ( = ?auto_14262 ?auto_14260 ) ) ( not ( = ?auto_14262 ?auto_14275 ) ) ( not ( = ?auto_14262 ?auto_14267 ) ) ( not ( = ?auto_14242 ?auto_14247 ) ) ( not ( = ?auto_14242 ?auto_14273 ) ) ( not ( = ?auto_14243 ?auto_14247 ) ) ( not ( = ?auto_14243 ?auto_14273 ) ) ( not ( = ?auto_14244 ?auto_14247 ) ) ( not ( = ?auto_14244 ?auto_14273 ) ) ( not ( = ?auto_14245 ?auto_14247 ) ) ( not ( = ?auto_14245 ?auto_14273 ) ) ( not ( = ?auto_14247 ?auto_14262 ) ) ( not ( = ?auto_14247 ?auto_14260 ) ) ( not ( = ?auto_14247 ?auto_14275 ) ) ( not ( = ?auto_14247 ?auto_14267 ) ) ( not ( = ?auto_14269 ?auto_14258 ) ) ( not ( = ?auto_14269 ?auto_14265 ) ) ( not ( = ?auto_14269 ?auto_14261 ) ) ( not ( = ?auto_14269 ?auto_14252 ) ) ( not ( = ?auto_14270 ?auto_14272 ) ) ( not ( = ?auto_14270 ?auto_14257 ) ) ( not ( = ?auto_14270 ?auto_14271 ) ) ( not ( = ?auto_14270 ?auto_14253 ) ) ( not ( = ?auto_14273 ?auto_14262 ) ) ( not ( = ?auto_14273 ?auto_14260 ) ) ( not ( = ?auto_14273 ?auto_14275 ) ) ( not ( = ?auto_14273 ?auto_14267 ) ) ( not ( = ?auto_14242 ?auto_14248 ) ) ( not ( = ?auto_14242 ?auto_14266 ) ) ( not ( = ?auto_14243 ?auto_14248 ) ) ( not ( = ?auto_14243 ?auto_14266 ) ) ( not ( = ?auto_14244 ?auto_14248 ) ) ( not ( = ?auto_14244 ?auto_14266 ) ) ( not ( = ?auto_14245 ?auto_14248 ) ) ( not ( = ?auto_14245 ?auto_14266 ) ) ( not ( = ?auto_14246 ?auto_14248 ) ) ( not ( = ?auto_14246 ?auto_14266 ) ) ( not ( = ?auto_14248 ?auto_14273 ) ) ( not ( = ?auto_14248 ?auto_14262 ) ) ( not ( = ?auto_14248 ?auto_14260 ) ) ( not ( = ?auto_14248 ?auto_14275 ) ) ( not ( = ?auto_14248 ?auto_14267 ) ) ( not ( = ?auto_14268 ?auto_14269 ) ) ( not ( = ?auto_14268 ?auto_14258 ) ) ( not ( = ?auto_14268 ?auto_14265 ) ) ( not ( = ?auto_14268 ?auto_14261 ) ) ( not ( = ?auto_14268 ?auto_14252 ) ) ( not ( = ?auto_14274 ?auto_14270 ) ) ( not ( = ?auto_14274 ?auto_14272 ) ) ( not ( = ?auto_14274 ?auto_14257 ) ) ( not ( = ?auto_14274 ?auto_14271 ) ) ( not ( = ?auto_14274 ?auto_14253 ) ) ( not ( = ?auto_14266 ?auto_14273 ) ) ( not ( = ?auto_14266 ?auto_14262 ) ) ( not ( = ?auto_14266 ?auto_14260 ) ) ( not ( = ?auto_14266 ?auto_14275 ) ) ( not ( = ?auto_14266 ?auto_14267 ) ) ( not ( = ?auto_14242 ?auto_14249 ) ) ( not ( = ?auto_14242 ?auto_14263 ) ) ( not ( = ?auto_14243 ?auto_14249 ) ) ( not ( = ?auto_14243 ?auto_14263 ) ) ( not ( = ?auto_14244 ?auto_14249 ) ) ( not ( = ?auto_14244 ?auto_14263 ) ) ( not ( = ?auto_14245 ?auto_14249 ) ) ( not ( = ?auto_14245 ?auto_14263 ) ) ( not ( = ?auto_14246 ?auto_14249 ) ) ( not ( = ?auto_14246 ?auto_14263 ) ) ( not ( = ?auto_14247 ?auto_14249 ) ) ( not ( = ?auto_14247 ?auto_14263 ) ) ( not ( = ?auto_14249 ?auto_14266 ) ) ( not ( = ?auto_14249 ?auto_14273 ) ) ( not ( = ?auto_14249 ?auto_14262 ) ) ( not ( = ?auto_14249 ?auto_14260 ) ) ( not ( = ?auto_14249 ?auto_14275 ) ) ( not ( = ?auto_14249 ?auto_14267 ) ) ( not ( = ?auto_14264 ?auto_14268 ) ) ( not ( = ?auto_14264 ?auto_14269 ) ) ( not ( = ?auto_14264 ?auto_14258 ) ) ( not ( = ?auto_14264 ?auto_14265 ) ) ( not ( = ?auto_14264 ?auto_14261 ) ) ( not ( = ?auto_14264 ?auto_14252 ) ) ( not ( = ?auto_14259 ?auto_14274 ) ) ( not ( = ?auto_14259 ?auto_14270 ) ) ( not ( = ?auto_14259 ?auto_14272 ) ) ( not ( = ?auto_14259 ?auto_14257 ) ) ( not ( = ?auto_14259 ?auto_14271 ) ) ( not ( = ?auto_14259 ?auto_14253 ) ) ( not ( = ?auto_14263 ?auto_14266 ) ) ( not ( = ?auto_14263 ?auto_14273 ) ) ( not ( = ?auto_14263 ?auto_14262 ) ) ( not ( = ?auto_14263 ?auto_14260 ) ) ( not ( = ?auto_14263 ?auto_14275 ) ) ( not ( = ?auto_14263 ?auto_14267 ) ) ( not ( = ?auto_14242 ?auto_14250 ) ) ( not ( = ?auto_14242 ?auto_14251 ) ) ( not ( = ?auto_14243 ?auto_14250 ) ) ( not ( = ?auto_14243 ?auto_14251 ) ) ( not ( = ?auto_14244 ?auto_14250 ) ) ( not ( = ?auto_14244 ?auto_14251 ) ) ( not ( = ?auto_14245 ?auto_14250 ) ) ( not ( = ?auto_14245 ?auto_14251 ) ) ( not ( = ?auto_14246 ?auto_14250 ) ) ( not ( = ?auto_14246 ?auto_14251 ) ) ( not ( = ?auto_14247 ?auto_14250 ) ) ( not ( = ?auto_14247 ?auto_14251 ) ) ( not ( = ?auto_14248 ?auto_14250 ) ) ( not ( = ?auto_14248 ?auto_14251 ) ) ( not ( = ?auto_14250 ?auto_14263 ) ) ( not ( = ?auto_14250 ?auto_14266 ) ) ( not ( = ?auto_14250 ?auto_14273 ) ) ( not ( = ?auto_14250 ?auto_14262 ) ) ( not ( = ?auto_14250 ?auto_14260 ) ) ( not ( = ?auto_14250 ?auto_14275 ) ) ( not ( = ?auto_14250 ?auto_14267 ) ) ( not ( = ?auto_14251 ?auto_14263 ) ) ( not ( = ?auto_14251 ?auto_14266 ) ) ( not ( = ?auto_14251 ?auto_14273 ) ) ( not ( = ?auto_14251 ?auto_14262 ) ) ( not ( = ?auto_14251 ?auto_14260 ) ) ( not ( = ?auto_14251 ?auto_14275 ) ) ( not ( = ?auto_14251 ?auto_14267 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_14242 ?auto_14243 ?auto_14244 ?auto_14245 ?auto_14246 ?auto_14247 ?auto_14248 ?auto_14249 )
      ( MAKE-1CRATE ?auto_14249 ?auto_14250 )
      ( MAKE-8CRATE-VERIFY ?auto_14242 ?auto_14243 ?auto_14244 ?auto_14245 ?auto_14246 ?auto_14247 ?auto_14248 ?auto_14249 ?auto_14250 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_14296 - SURFACE
      ?auto_14297 - SURFACE
      ?auto_14298 - SURFACE
      ?auto_14299 - SURFACE
      ?auto_14300 - SURFACE
      ?auto_14301 - SURFACE
      ?auto_14302 - SURFACE
      ?auto_14303 - SURFACE
      ?auto_14304 - SURFACE
      ?auto_14305 - SURFACE
    )
    :vars
    (
      ?auto_14311 - HOIST
      ?auto_14310 - PLACE
      ?auto_14307 - PLACE
      ?auto_14306 - HOIST
      ?auto_14309 - SURFACE
      ?auto_14320 - PLACE
      ?auto_14331 - HOIST
      ?auto_14328 - SURFACE
      ?auto_14312 - SURFACE
      ?auto_14316 - PLACE
      ?auto_14326 - HOIST
      ?auto_14329 - SURFACE
      ?auto_14325 - PLACE
      ?auto_14317 - HOIST
      ?auto_14324 - SURFACE
      ?auto_14318 - PLACE
      ?auto_14314 - HOIST
      ?auto_14330 - SURFACE
      ?auto_14319 - PLACE
      ?auto_14323 - HOIST
      ?auto_14321 - SURFACE
      ?auto_14327 - PLACE
      ?auto_14322 - HOIST
      ?auto_14315 - SURFACE
      ?auto_14313 - SURFACE
      ?auto_14308 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14311 ?auto_14310 ) ( IS-CRATE ?auto_14305 ) ( not ( = ?auto_14307 ?auto_14310 ) ) ( HOIST-AT ?auto_14306 ?auto_14307 ) ( SURFACE-AT ?auto_14305 ?auto_14307 ) ( ON ?auto_14305 ?auto_14309 ) ( CLEAR ?auto_14305 ) ( not ( = ?auto_14304 ?auto_14305 ) ) ( not ( = ?auto_14304 ?auto_14309 ) ) ( not ( = ?auto_14305 ?auto_14309 ) ) ( not ( = ?auto_14311 ?auto_14306 ) ) ( IS-CRATE ?auto_14304 ) ( not ( = ?auto_14320 ?auto_14310 ) ) ( HOIST-AT ?auto_14331 ?auto_14320 ) ( SURFACE-AT ?auto_14304 ?auto_14320 ) ( ON ?auto_14304 ?auto_14328 ) ( CLEAR ?auto_14304 ) ( not ( = ?auto_14303 ?auto_14304 ) ) ( not ( = ?auto_14303 ?auto_14328 ) ) ( not ( = ?auto_14304 ?auto_14328 ) ) ( not ( = ?auto_14311 ?auto_14331 ) ) ( IS-CRATE ?auto_14303 ) ( AVAILABLE ?auto_14306 ) ( SURFACE-AT ?auto_14303 ?auto_14307 ) ( ON ?auto_14303 ?auto_14312 ) ( CLEAR ?auto_14303 ) ( not ( = ?auto_14302 ?auto_14303 ) ) ( not ( = ?auto_14302 ?auto_14312 ) ) ( not ( = ?auto_14303 ?auto_14312 ) ) ( IS-CRATE ?auto_14302 ) ( not ( = ?auto_14316 ?auto_14310 ) ) ( HOIST-AT ?auto_14326 ?auto_14316 ) ( AVAILABLE ?auto_14326 ) ( SURFACE-AT ?auto_14302 ?auto_14316 ) ( ON ?auto_14302 ?auto_14329 ) ( CLEAR ?auto_14302 ) ( not ( = ?auto_14301 ?auto_14302 ) ) ( not ( = ?auto_14301 ?auto_14329 ) ) ( not ( = ?auto_14302 ?auto_14329 ) ) ( not ( = ?auto_14311 ?auto_14326 ) ) ( IS-CRATE ?auto_14301 ) ( not ( = ?auto_14325 ?auto_14310 ) ) ( HOIST-AT ?auto_14317 ?auto_14325 ) ( AVAILABLE ?auto_14317 ) ( SURFACE-AT ?auto_14301 ?auto_14325 ) ( ON ?auto_14301 ?auto_14324 ) ( CLEAR ?auto_14301 ) ( not ( = ?auto_14300 ?auto_14301 ) ) ( not ( = ?auto_14300 ?auto_14324 ) ) ( not ( = ?auto_14301 ?auto_14324 ) ) ( not ( = ?auto_14311 ?auto_14317 ) ) ( IS-CRATE ?auto_14300 ) ( not ( = ?auto_14318 ?auto_14310 ) ) ( HOIST-AT ?auto_14314 ?auto_14318 ) ( AVAILABLE ?auto_14314 ) ( SURFACE-AT ?auto_14300 ?auto_14318 ) ( ON ?auto_14300 ?auto_14330 ) ( CLEAR ?auto_14300 ) ( not ( = ?auto_14299 ?auto_14300 ) ) ( not ( = ?auto_14299 ?auto_14330 ) ) ( not ( = ?auto_14300 ?auto_14330 ) ) ( not ( = ?auto_14311 ?auto_14314 ) ) ( IS-CRATE ?auto_14299 ) ( not ( = ?auto_14319 ?auto_14310 ) ) ( HOIST-AT ?auto_14323 ?auto_14319 ) ( AVAILABLE ?auto_14323 ) ( SURFACE-AT ?auto_14299 ?auto_14319 ) ( ON ?auto_14299 ?auto_14321 ) ( CLEAR ?auto_14299 ) ( not ( = ?auto_14298 ?auto_14299 ) ) ( not ( = ?auto_14298 ?auto_14321 ) ) ( not ( = ?auto_14299 ?auto_14321 ) ) ( not ( = ?auto_14311 ?auto_14323 ) ) ( IS-CRATE ?auto_14298 ) ( not ( = ?auto_14327 ?auto_14310 ) ) ( HOIST-AT ?auto_14322 ?auto_14327 ) ( AVAILABLE ?auto_14322 ) ( SURFACE-AT ?auto_14298 ?auto_14327 ) ( ON ?auto_14298 ?auto_14315 ) ( CLEAR ?auto_14298 ) ( not ( = ?auto_14297 ?auto_14298 ) ) ( not ( = ?auto_14297 ?auto_14315 ) ) ( not ( = ?auto_14298 ?auto_14315 ) ) ( not ( = ?auto_14311 ?auto_14322 ) ) ( SURFACE-AT ?auto_14296 ?auto_14310 ) ( CLEAR ?auto_14296 ) ( IS-CRATE ?auto_14297 ) ( AVAILABLE ?auto_14311 ) ( AVAILABLE ?auto_14331 ) ( SURFACE-AT ?auto_14297 ?auto_14320 ) ( ON ?auto_14297 ?auto_14313 ) ( CLEAR ?auto_14297 ) ( TRUCK-AT ?auto_14308 ?auto_14310 ) ( not ( = ?auto_14296 ?auto_14297 ) ) ( not ( = ?auto_14296 ?auto_14313 ) ) ( not ( = ?auto_14297 ?auto_14313 ) ) ( not ( = ?auto_14296 ?auto_14298 ) ) ( not ( = ?auto_14296 ?auto_14315 ) ) ( not ( = ?auto_14298 ?auto_14313 ) ) ( not ( = ?auto_14327 ?auto_14320 ) ) ( not ( = ?auto_14322 ?auto_14331 ) ) ( not ( = ?auto_14315 ?auto_14313 ) ) ( not ( = ?auto_14296 ?auto_14299 ) ) ( not ( = ?auto_14296 ?auto_14321 ) ) ( not ( = ?auto_14297 ?auto_14299 ) ) ( not ( = ?auto_14297 ?auto_14321 ) ) ( not ( = ?auto_14299 ?auto_14315 ) ) ( not ( = ?auto_14299 ?auto_14313 ) ) ( not ( = ?auto_14319 ?auto_14327 ) ) ( not ( = ?auto_14319 ?auto_14320 ) ) ( not ( = ?auto_14323 ?auto_14322 ) ) ( not ( = ?auto_14323 ?auto_14331 ) ) ( not ( = ?auto_14321 ?auto_14315 ) ) ( not ( = ?auto_14321 ?auto_14313 ) ) ( not ( = ?auto_14296 ?auto_14300 ) ) ( not ( = ?auto_14296 ?auto_14330 ) ) ( not ( = ?auto_14297 ?auto_14300 ) ) ( not ( = ?auto_14297 ?auto_14330 ) ) ( not ( = ?auto_14298 ?auto_14300 ) ) ( not ( = ?auto_14298 ?auto_14330 ) ) ( not ( = ?auto_14300 ?auto_14321 ) ) ( not ( = ?auto_14300 ?auto_14315 ) ) ( not ( = ?auto_14300 ?auto_14313 ) ) ( not ( = ?auto_14318 ?auto_14319 ) ) ( not ( = ?auto_14318 ?auto_14327 ) ) ( not ( = ?auto_14318 ?auto_14320 ) ) ( not ( = ?auto_14314 ?auto_14323 ) ) ( not ( = ?auto_14314 ?auto_14322 ) ) ( not ( = ?auto_14314 ?auto_14331 ) ) ( not ( = ?auto_14330 ?auto_14321 ) ) ( not ( = ?auto_14330 ?auto_14315 ) ) ( not ( = ?auto_14330 ?auto_14313 ) ) ( not ( = ?auto_14296 ?auto_14301 ) ) ( not ( = ?auto_14296 ?auto_14324 ) ) ( not ( = ?auto_14297 ?auto_14301 ) ) ( not ( = ?auto_14297 ?auto_14324 ) ) ( not ( = ?auto_14298 ?auto_14301 ) ) ( not ( = ?auto_14298 ?auto_14324 ) ) ( not ( = ?auto_14299 ?auto_14301 ) ) ( not ( = ?auto_14299 ?auto_14324 ) ) ( not ( = ?auto_14301 ?auto_14330 ) ) ( not ( = ?auto_14301 ?auto_14321 ) ) ( not ( = ?auto_14301 ?auto_14315 ) ) ( not ( = ?auto_14301 ?auto_14313 ) ) ( not ( = ?auto_14325 ?auto_14318 ) ) ( not ( = ?auto_14325 ?auto_14319 ) ) ( not ( = ?auto_14325 ?auto_14327 ) ) ( not ( = ?auto_14325 ?auto_14320 ) ) ( not ( = ?auto_14317 ?auto_14314 ) ) ( not ( = ?auto_14317 ?auto_14323 ) ) ( not ( = ?auto_14317 ?auto_14322 ) ) ( not ( = ?auto_14317 ?auto_14331 ) ) ( not ( = ?auto_14324 ?auto_14330 ) ) ( not ( = ?auto_14324 ?auto_14321 ) ) ( not ( = ?auto_14324 ?auto_14315 ) ) ( not ( = ?auto_14324 ?auto_14313 ) ) ( not ( = ?auto_14296 ?auto_14302 ) ) ( not ( = ?auto_14296 ?auto_14329 ) ) ( not ( = ?auto_14297 ?auto_14302 ) ) ( not ( = ?auto_14297 ?auto_14329 ) ) ( not ( = ?auto_14298 ?auto_14302 ) ) ( not ( = ?auto_14298 ?auto_14329 ) ) ( not ( = ?auto_14299 ?auto_14302 ) ) ( not ( = ?auto_14299 ?auto_14329 ) ) ( not ( = ?auto_14300 ?auto_14302 ) ) ( not ( = ?auto_14300 ?auto_14329 ) ) ( not ( = ?auto_14302 ?auto_14324 ) ) ( not ( = ?auto_14302 ?auto_14330 ) ) ( not ( = ?auto_14302 ?auto_14321 ) ) ( not ( = ?auto_14302 ?auto_14315 ) ) ( not ( = ?auto_14302 ?auto_14313 ) ) ( not ( = ?auto_14316 ?auto_14325 ) ) ( not ( = ?auto_14316 ?auto_14318 ) ) ( not ( = ?auto_14316 ?auto_14319 ) ) ( not ( = ?auto_14316 ?auto_14327 ) ) ( not ( = ?auto_14316 ?auto_14320 ) ) ( not ( = ?auto_14326 ?auto_14317 ) ) ( not ( = ?auto_14326 ?auto_14314 ) ) ( not ( = ?auto_14326 ?auto_14323 ) ) ( not ( = ?auto_14326 ?auto_14322 ) ) ( not ( = ?auto_14326 ?auto_14331 ) ) ( not ( = ?auto_14329 ?auto_14324 ) ) ( not ( = ?auto_14329 ?auto_14330 ) ) ( not ( = ?auto_14329 ?auto_14321 ) ) ( not ( = ?auto_14329 ?auto_14315 ) ) ( not ( = ?auto_14329 ?auto_14313 ) ) ( not ( = ?auto_14296 ?auto_14303 ) ) ( not ( = ?auto_14296 ?auto_14312 ) ) ( not ( = ?auto_14297 ?auto_14303 ) ) ( not ( = ?auto_14297 ?auto_14312 ) ) ( not ( = ?auto_14298 ?auto_14303 ) ) ( not ( = ?auto_14298 ?auto_14312 ) ) ( not ( = ?auto_14299 ?auto_14303 ) ) ( not ( = ?auto_14299 ?auto_14312 ) ) ( not ( = ?auto_14300 ?auto_14303 ) ) ( not ( = ?auto_14300 ?auto_14312 ) ) ( not ( = ?auto_14301 ?auto_14303 ) ) ( not ( = ?auto_14301 ?auto_14312 ) ) ( not ( = ?auto_14303 ?auto_14329 ) ) ( not ( = ?auto_14303 ?auto_14324 ) ) ( not ( = ?auto_14303 ?auto_14330 ) ) ( not ( = ?auto_14303 ?auto_14321 ) ) ( not ( = ?auto_14303 ?auto_14315 ) ) ( not ( = ?auto_14303 ?auto_14313 ) ) ( not ( = ?auto_14307 ?auto_14316 ) ) ( not ( = ?auto_14307 ?auto_14325 ) ) ( not ( = ?auto_14307 ?auto_14318 ) ) ( not ( = ?auto_14307 ?auto_14319 ) ) ( not ( = ?auto_14307 ?auto_14327 ) ) ( not ( = ?auto_14307 ?auto_14320 ) ) ( not ( = ?auto_14306 ?auto_14326 ) ) ( not ( = ?auto_14306 ?auto_14317 ) ) ( not ( = ?auto_14306 ?auto_14314 ) ) ( not ( = ?auto_14306 ?auto_14323 ) ) ( not ( = ?auto_14306 ?auto_14322 ) ) ( not ( = ?auto_14306 ?auto_14331 ) ) ( not ( = ?auto_14312 ?auto_14329 ) ) ( not ( = ?auto_14312 ?auto_14324 ) ) ( not ( = ?auto_14312 ?auto_14330 ) ) ( not ( = ?auto_14312 ?auto_14321 ) ) ( not ( = ?auto_14312 ?auto_14315 ) ) ( not ( = ?auto_14312 ?auto_14313 ) ) ( not ( = ?auto_14296 ?auto_14304 ) ) ( not ( = ?auto_14296 ?auto_14328 ) ) ( not ( = ?auto_14297 ?auto_14304 ) ) ( not ( = ?auto_14297 ?auto_14328 ) ) ( not ( = ?auto_14298 ?auto_14304 ) ) ( not ( = ?auto_14298 ?auto_14328 ) ) ( not ( = ?auto_14299 ?auto_14304 ) ) ( not ( = ?auto_14299 ?auto_14328 ) ) ( not ( = ?auto_14300 ?auto_14304 ) ) ( not ( = ?auto_14300 ?auto_14328 ) ) ( not ( = ?auto_14301 ?auto_14304 ) ) ( not ( = ?auto_14301 ?auto_14328 ) ) ( not ( = ?auto_14302 ?auto_14304 ) ) ( not ( = ?auto_14302 ?auto_14328 ) ) ( not ( = ?auto_14304 ?auto_14312 ) ) ( not ( = ?auto_14304 ?auto_14329 ) ) ( not ( = ?auto_14304 ?auto_14324 ) ) ( not ( = ?auto_14304 ?auto_14330 ) ) ( not ( = ?auto_14304 ?auto_14321 ) ) ( not ( = ?auto_14304 ?auto_14315 ) ) ( not ( = ?auto_14304 ?auto_14313 ) ) ( not ( = ?auto_14328 ?auto_14312 ) ) ( not ( = ?auto_14328 ?auto_14329 ) ) ( not ( = ?auto_14328 ?auto_14324 ) ) ( not ( = ?auto_14328 ?auto_14330 ) ) ( not ( = ?auto_14328 ?auto_14321 ) ) ( not ( = ?auto_14328 ?auto_14315 ) ) ( not ( = ?auto_14328 ?auto_14313 ) ) ( not ( = ?auto_14296 ?auto_14305 ) ) ( not ( = ?auto_14296 ?auto_14309 ) ) ( not ( = ?auto_14297 ?auto_14305 ) ) ( not ( = ?auto_14297 ?auto_14309 ) ) ( not ( = ?auto_14298 ?auto_14305 ) ) ( not ( = ?auto_14298 ?auto_14309 ) ) ( not ( = ?auto_14299 ?auto_14305 ) ) ( not ( = ?auto_14299 ?auto_14309 ) ) ( not ( = ?auto_14300 ?auto_14305 ) ) ( not ( = ?auto_14300 ?auto_14309 ) ) ( not ( = ?auto_14301 ?auto_14305 ) ) ( not ( = ?auto_14301 ?auto_14309 ) ) ( not ( = ?auto_14302 ?auto_14305 ) ) ( not ( = ?auto_14302 ?auto_14309 ) ) ( not ( = ?auto_14303 ?auto_14305 ) ) ( not ( = ?auto_14303 ?auto_14309 ) ) ( not ( = ?auto_14305 ?auto_14328 ) ) ( not ( = ?auto_14305 ?auto_14312 ) ) ( not ( = ?auto_14305 ?auto_14329 ) ) ( not ( = ?auto_14305 ?auto_14324 ) ) ( not ( = ?auto_14305 ?auto_14330 ) ) ( not ( = ?auto_14305 ?auto_14321 ) ) ( not ( = ?auto_14305 ?auto_14315 ) ) ( not ( = ?auto_14305 ?auto_14313 ) ) ( not ( = ?auto_14309 ?auto_14328 ) ) ( not ( = ?auto_14309 ?auto_14312 ) ) ( not ( = ?auto_14309 ?auto_14329 ) ) ( not ( = ?auto_14309 ?auto_14324 ) ) ( not ( = ?auto_14309 ?auto_14330 ) ) ( not ( = ?auto_14309 ?auto_14321 ) ) ( not ( = ?auto_14309 ?auto_14315 ) ) ( not ( = ?auto_14309 ?auto_14313 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_14296 ?auto_14297 ?auto_14298 ?auto_14299 ?auto_14300 ?auto_14301 ?auto_14302 ?auto_14303 ?auto_14304 )
      ( MAKE-1CRATE ?auto_14304 ?auto_14305 )
      ( MAKE-9CRATE-VERIFY ?auto_14296 ?auto_14297 ?auto_14298 ?auto_14299 ?auto_14300 ?auto_14301 ?auto_14302 ?auto_14303 ?auto_14304 ?auto_14305 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_14353 - SURFACE
      ?auto_14354 - SURFACE
      ?auto_14355 - SURFACE
      ?auto_14356 - SURFACE
      ?auto_14357 - SURFACE
      ?auto_14358 - SURFACE
      ?auto_14359 - SURFACE
      ?auto_14360 - SURFACE
      ?auto_14361 - SURFACE
      ?auto_14362 - SURFACE
      ?auto_14363 - SURFACE
    )
    :vars
    (
      ?auto_14365 - HOIST
      ?auto_14369 - PLACE
      ?auto_14366 - PLACE
      ?auto_14368 - HOIST
      ?auto_14367 - SURFACE
      ?auto_14371 - PLACE
      ?auto_14381 - HOIST
      ?auto_14385 - SURFACE
      ?auto_14375 - PLACE
      ?auto_14376 - HOIST
      ?auto_14382 - SURFACE
      ?auto_14373 - SURFACE
      ?auto_14384 - PLACE
      ?auto_14370 - HOIST
      ?auto_14386 - SURFACE
      ?auto_14378 - PLACE
      ?auto_14388 - HOIST
      ?auto_14379 - SURFACE
      ?auto_14380 - PLACE
      ?auto_14387 - HOIST
      ?auto_14390 - SURFACE
      ?auto_14389 - PLACE
      ?auto_14383 - HOIST
      ?auto_14374 - SURFACE
      ?auto_14377 - SURFACE
      ?auto_14372 - SURFACE
      ?auto_14364 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14365 ?auto_14369 ) ( IS-CRATE ?auto_14363 ) ( not ( = ?auto_14366 ?auto_14369 ) ) ( HOIST-AT ?auto_14368 ?auto_14366 ) ( SURFACE-AT ?auto_14363 ?auto_14366 ) ( ON ?auto_14363 ?auto_14367 ) ( CLEAR ?auto_14363 ) ( not ( = ?auto_14362 ?auto_14363 ) ) ( not ( = ?auto_14362 ?auto_14367 ) ) ( not ( = ?auto_14363 ?auto_14367 ) ) ( not ( = ?auto_14365 ?auto_14368 ) ) ( IS-CRATE ?auto_14362 ) ( not ( = ?auto_14371 ?auto_14369 ) ) ( HOIST-AT ?auto_14381 ?auto_14371 ) ( SURFACE-AT ?auto_14362 ?auto_14371 ) ( ON ?auto_14362 ?auto_14385 ) ( CLEAR ?auto_14362 ) ( not ( = ?auto_14361 ?auto_14362 ) ) ( not ( = ?auto_14361 ?auto_14385 ) ) ( not ( = ?auto_14362 ?auto_14385 ) ) ( not ( = ?auto_14365 ?auto_14381 ) ) ( IS-CRATE ?auto_14361 ) ( not ( = ?auto_14375 ?auto_14369 ) ) ( HOIST-AT ?auto_14376 ?auto_14375 ) ( SURFACE-AT ?auto_14361 ?auto_14375 ) ( ON ?auto_14361 ?auto_14382 ) ( CLEAR ?auto_14361 ) ( not ( = ?auto_14360 ?auto_14361 ) ) ( not ( = ?auto_14360 ?auto_14382 ) ) ( not ( = ?auto_14361 ?auto_14382 ) ) ( not ( = ?auto_14365 ?auto_14376 ) ) ( IS-CRATE ?auto_14360 ) ( AVAILABLE ?auto_14381 ) ( SURFACE-AT ?auto_14360 ?auto_14371 ) ( ON ?auto_14360 ?auto_14373 ) ( CLEAR ?auto_14360 ) ( not ( = ?auto_14359 ?auto_14360 ) ) ( not ( = ?auto_14359 ?auto_14373 ) ) ( not ( = ?auto_14360 ?auto_14373 ) ) ( IS-CRATE ?auto_14359 ) ( not ( = ?auto_14384 ?auto_14369 ) ) ( HOIST-AT ?auto_14370 ?auto_14384 ) ( AVAILABLE ?auto_14370 ) ( SURFACE-AT ?auto_14359 ?auto_14384 ) ( ON ?auto_14359 ?auto_14386 ) ( CLEAR ?auto_14359 ) ( not ( = ?auto_14358 ?auto_14359 ) ) ( not ( = ?auto_14358 ?auto_14386 ) ) ( not ( = ?auto_14359 ?auto_14386 ) ) ( not ( = ?auto_14365 ?auto_14370 ) ) ( IS-CRATE ?auto_14358 ) ( not ( = ?auto_14378 ?auto_14369 ) ) ( HOIST-AT ?auto_14388 ?auto_14378 ) ( AVAILABLE ?auto_14388 ) ( SURFACE-AT ?auto_14358 ?auto_14378 ) ( ON ?auto_14358 ?auto_14379 ) ( CLEAR ?auto_14358 ) ( not ( = ?auto_14357 ?auto_14358 ) ) ( not ( = ?auto_14357 ?auto_14379 ) ) ( not ( = ?auto_14358 ?auto_14379 ) ) ( not ( = ?auto_14365 ?auto_14388 ) ) ( IS-CRATE ?auto_14357 ) ( not ( = ?auto_14380 ?auto_14369 ) ) ( HOIST-AT ?auto_14387 ?auto_14380 ) ( AVAILABLE ?auto_14387 ) ( SURFACE-AT ?auto_14357 ?auto_14380 ) ( ON ?auto_14357 ?auto_14390 ) ( CLEAR ?auto_14357 ) ( not ( = ?auto_14356 ?auto_14357 ) ) ( not ( = ?auto_14356 ?auto_14390 ) ) ( not ( = ?auto_14357 ?auto_14390 ) ) ( not ( = ?auto_14365 ?auto_14387 ) ) ( IS-CRATE ?auto_14356 ) ( not ( = ?auto_14389 ?auto_14369 ) ) ( HOIST-AT ?auto_14383 ?auto_14389 ) ( AVAILABLE ?auto_14383 ) ( SURFACE-AT ?auto_14356 ?auto_14389 ) ( ON ?auto_14356 ?auto_14374 ) ( CLEAR ?auto_14356 ) ( not ( = ?auto_14355 ?auto_14356 ) ) ( not ( = ?auto_14355 ?auto_14374 ) ) ( not ( = ?auto_14356 ?auto_14374 ) ) ( not ( = ?auto_14365 ?auto_14383 ) ) ( IS-CRATE ?auto_14355 ) ( AVAILABLE ?auto_14368 ) ( SURFACE-AT ?auto_14355 ?auto_14366 ) ( ON ?auto_14355 ?auto_14377 ) ( CLEAR ?auto_14355 ) ( not ( = ?auto_14354 ?auto_14355 ) ) ( not ( = ?auto_14354 ?auto_14377 ) ) ( not ( = ?auto_14355 ?auto_14377 ) ) ( SURFACE-AT ?auto_14353 ?auto_14369 ) ( CLEAR ?auto_14353 ) ( IS-CRATE ?auto_14354 ) ( AVAILABLE ?auto_14365 ) ( AVAILABLE ?auto_14376 ) ( SURFACE-AT ?auto_14354 ?auto_14375 ) ( ON ?auto_14354 ?auto_14372 ) ( CLEAR ?auto_14354 ) ( TRUCK-AT ?auto_14364 ?auto_14369 ) ( not ( = ?auto_14353 ?auto_14354 ) ) ( not ( = ?auto_14353 ?auto_14372 ) ) ( not ( = ?auto_14354 ?auto_14372 ) ) ( not ( = ?auto_14353 ?auto_14355 ) ) ( not ( = ?auto_14353 ?auto_14377 ) ) ( not ( = ?auto_14355 ?auto_14372 ) ) ( not ( = ?auto_14366 ?auto_14375 ) ) ( not ( = ?auto_14368 ?auto_14376 ) ) ( not ( = ?auto_14377 ?auto_14372 ) ) ( not ( = ?auto_14353 ?auto_14356 ) ) ( not ( = ?auto_14353 ?auto_14374 ) ) ( not ( = ?auto_14354 ?auto_14356 ) ) ( not ( = ?auto_14354 ?auto_14374 ) ) ( not ( = ?auto_14356 ?auto_14377 ) ) ( not ( = ?auto_14356 ?auto_14372 ) ) ( not ( = ?auto_14389 ?auto_14366 ) ) ( not ( = ?auto_14389 ?auto_14375 ) ) ( not ( = ?auto_14383 ?auto_14368 ) ) ( not ( = ?auto_14383 ?auto_14376 ) ) ( not ( = ?auto_14374 ?auto_14377 ) ) ( not ( = ?auto_14374 ?auto_14372 ) ) ( not ( = ?auto_14353 ?auto_14357 ) ) ( not ( = ?auto_14353 ?auto_14390 ) ) ( not ( = ?auto_14354 ?auto_14357 ) ) ( not ( = ?auto_14354 ?auto_14390 ) ) ( not ( = ?auto_14355 ?auto_14357 ) ) ( not ( = ?auto_14355 ?auto_14390 ) ) ( not ( = ?auto_14357 ?auto_14374 ) ) ( not ( = ?auto_14357 ?auto_14377 ) ) ( not ( = ?auto_14357 ?auto_14372 ) ) ( not ( = ?auto_14380 ?auto_14389 ) ) ( not ( = ?auto_14380 ?auto_14366 ) ) ( not ( = ?auto_14380 ?auto_14375 ) ) ( not ( = ?auto_14387 ?auto_14383 ) ) ( not ( = ?auto_14387 ?auto_14368 ) ) ( not ( = ?auto_14387 ?auto_14376 ) ) ( not ( = ?auto_14390 ?auto_14374 ) ) ( not ( = ?auto_14390 ?auto_14377 ) ) ( not ( = ?auto_14390 ?auto_14372 ) ) ( not ( = ?auto_14353 ?auto_14358 ) ) ( not ( = ?auto_14353 ?auto_14379 ) ) ( not ( = ?auto_14354 ?auto_14358 ) ) ( not ( = ?auto_14354 ?auto_14379 ) ) ( not ( = ?auto_14355 ?auto_14358 ) ) ( not ( = ?auto_14355 ?auto_14379 ) ) ( not ( = ?auto_14356 ?auto_14358 ) ) ( not ( = ?auto_14356 ?auto_14379 ) ) ( not ( = ?auto_14358 ?auto_14390 ) ) ( not ( = ?auto_14358 ?auto_14374 ) ) ( not ( = ?auto_14358 ?auto_14377 ) ) ( not ( = ?auto_14358 ?auto_14372 ) ) ( not ( = ?auto_14378 ?auto_14380 ) ) ( not ( = ?auto_14378 ?auto_14389 ) ) ( not ( = ?auto_14378 ?auto_14366 ) ) ( not ( = ?auto_14378 ?auto_14375 ) ) ( not ( = ?auto_14388 ?auto_14387 ) ) ( not ( = ?auto_14388 ?auto_14383 ) ) ( not ( = ?auto_14388 ?auto_14368 ) ) ( not ( = ?auto_14388 ?auto_14376 ) ) ( not ( = ?auto_14379 ?auto_14390 ) ) ( not ( = ?auto_14379 ?auto_14374 ) ) ( not ( = ?auto_14379 ?auto_14377 ) ) ( not ( = ?auto_14379 ?auto_14372 ) ) ( not ( = ?auto_14353 ?auto_14359 ) ) ( not ( = ?auto_14353 ?auto_14386 ) ) ( not ( = ?auto_14354 ?auto_14359 ) ) ( not ( = ?auto_14354 ?auto_14386 ) ) ( not ( = ?auto_14355 ?auto_14359 ) ) ( not ( = ?auto_14355 ?auto_14386 ) ) ( not ( = ?auto_14356 ?auto_14359 ) ) ( not ( = ?auto_14356 ?auto_14386 ) ) ( not ( = ?auto_14357 ?auto_14359 ) ) ( not ( = ?auto_14357 ?auto_14386 ) ) ( not ( = ?auto_14359 ?auto_14379 ) ) ( not ( = ?auto_14359 ?auto_14390 ) ) ( not ( = ?auto_14359 ?auto_14374 ) ) ( not ( = ?auto_14359 ?auto_14377 ) ) ( not ( = ?auto_14359 ?auto_14372 ) ) ( not ( = ?auto_14384 ?auto_14378 ) ) ( not ( = ?auto_14384 ?auto_14380 ) ) ( not ( = ?auto_14384 ?auto_14389 ) ) ( not ( = ?auto_14384 ?auto_14366 ) ) ( not ( = ?auto_14384 ?auto_14375 ) ) ( not ( = ?auto_14370 ?auto_14388 ) ) ( not ( = ?auto_14370 ?auto_14387 ) ) ( not ( = ?auto_14370 ?auto_14383 ) ) ( not ( = ?auto_14370 ?auto_14368 ) ) ( not ( = ?auto_14370 ?auto_14376 ) ) ( not ( = ?auto_14386 ?auto_14379 ) ) ( not ( = ?auto_14386 ?auto_14390 ) ) ( not ( = ?auto_14386 ?auto_14374 ) ) ( not ( = ?auto_14386 ?auto_14377 ) ) ( not ( = ?auto_14386 ?auto_14372 ) ) ( not ( = ?auto_14353 ?auto_14360 ) ) ( not ( = ?auto_14353 ?auto_14373 ) ) ( not ( = ?auto_14354 ?auto_14360 ) ) ( not ( = ?auto_14354 ?auto_14373 ) ) ( not ( = ?auto_14355 ?auto_14360 ) ) ( not ( = ?auto_14355 ?auto_14373 ) ) ( not ( = ?auto_14356 ?auto_14360 ) ) ( not ( = ?auto_14356 ?auto_14373 ) ) ( not ( = ?auto_14357 ?auto_14360 ) ) ( not ( = ?auto_14357 ?auto_14373 ) ) ( not ( = ?auto_14358 ?auto_14360 ) ) ( not ( = ?auto_14358 ?auto_14373 ) ) ( not ( = ?auto_14360 ?auto_14386 ) ) ( not ( = ?auto_14360 ?auto_14379 ) ) ( not ( = ?auto_14360 ?auto_14390 ) ) ( not ( = ?auto_14360 ?auto_14374 ) ) ( not ( = ?auto_14360 ?auto_14377 ) ) ( not ( = ?auto_14360 ?auto_14372 ) ) ( not ( = ?auto_14371 ?auto_14384 ) ) ( not ( = ?auto_14371 ?auto_14378 ) ) ( not ( = ?auto_14371 ?auto_14380 ) ) ( not ( = ?auto_14371 ?auto_14389 ) ) ( not ( = ?auto_14371 ?auto_14366 ) ) ( not ( = ?auto_14371 ?auto_14375 ) ) ( not ( = ?auto_14381 ?auto_14370 ) ) ( not ( = ?auto_14381 ?auto_14388 ) ) ( not ( = ?auto_14381 ?auto_14387 ) ) ( not ( = ?auto_14381 ?auto_14383 ) ) ( not ( = ?auto_14381 ?auto_14368 ) ) ( not ( = ?auto_14381 ?auto_14376 ) ) ( not ( = ?auto_14373 ?auto_14386 ) ) ( not ( = ?auto_14373 ?auto_14379 ) ) ( not ( = ?auto_14373 ?auto_14390 ) ) ( not ( = ?auto_14373 ?auto_14374 ) ) ( not ( = ?auto_14373 ?auto_14377 ) ) ( not ( = ?auto_14373 ?auto_14372 ) ) ( not ( = ?auto_14353 ?auto_14361 ) ) ( not ( = ?auto_14353 ?auto_14382 ) ) ( not ( = ?auto_14354 ?auto_14361 ) ) ( not ( = ?auto_14354 ?auto_14382 ) ) ( not ( = ?auto_14355 ?auto_14361 ) ) ( not ( = ?auto_14355 ?auto_14382 ) ) ( not ( = ?auto_14356 ?auto_14361 ) ) ( not ( = ?auto_14356 ?auto_14382 ) ) ( not ( = ?auto_14357 ?auto_14361 ) ) ( not ( = ?auto_14357 ?auto_14382 ) ) ( not ( = ?auto_14358 ?auto_14361 ) ) ( not ( = ?auto_14358 ?auto_14382 ) ) ( not ( = ?auto_14359 ?auto_14361 ) ) ( not ( = ?auto_14359 ?auto_14382 ) ) ( not ( = ?auto_14361 ?auto_14373 ) ) ( not ( = ?auto_14361 ?auto_14386 ) ) ( not ( = ?auto_14361 ?auto_14379 ) ) ( not ( = ?auto_14361 ?auto_14390 ) ) ( not ( = ?auto_14361 ?auto_14374 ) ) ( not ( = ?auto_14361 ?auto_14377 ) ) ( not ( = ?auto_14361 ?auto_14372 ) ) ( not ( = ?auto_14382 ?auto_14373 ) ) ( not ( = ?auto_14382 ?auto_14386 ) ) ( not ( = ?auto_14382 ?auto_14379 ) ) ( not ( = ?auto_14382 ?auto_14390 ) ) ( not ( = ?auto_14382 ?auto_14374 ) ) ( not ( = ?auto_14382 ?auto_14377 ) ) ( not ( = ?auto_14382 ?auto_14372 ) ) ( not ( = ?auto_14353 ?auto_14362 ) ) ( not ( = ?auto_14353 ?auto_14385 ) ) ( not ( = ?auto_14354 ?auto_14362 ) ) ( not ( = ?auto_14354 ?auto_14385 ) ) ( not ( = ?auto_14355 ?auto_14362 ) ) ( not ( = ?auto_14355 ?auto_14385 ) ) ( not ( = ?auto_14356 ?auto_14362 ) ) ( not ( = ?auto_14356 ?auto_14385 ) ) ( not ( = ?auto_14357 ?auto_14362 ) ) ( not ( = ?auto_14357 ?auto_14385 ) ) ( not ( = ?auto_14358 ?auto_14362 ) ) ( not ( = ?auto_14358 ?auto_14385 ) ) ( not ( = ?auto_14359 ?auto_14362 ) ) ( not ( = ?auto_14359 ?auto_14385 ) ) ( not ( = ?auto_14360 ?auto_14362 ) ) ( not ( = ?auto_14360 ?auto_14385 ) ) ( not ( = ?auto_14362 ?auto_14382 ) ) ( not ( = ?auto_14362 ?auto_14373 ) ) ( not ( = ?auto_14362 ?auto_14386 ) ) ( not ( = ?auto_14362 ?auto_14379 ) ) ( not ( = ?auto_14362 ?auto_14390 ) ) ( not ( = ?auto_14362 ?auto_14374 ) ) ( not ( = ?auto_14362 ?auto_14377 ) ) ( not ( = ?auto_14362 ?auto_14372 ) ) ( not ( = ?auto_14385 ?auto_14382 ) ) ( not ( = ?auto_14385 ?auto_14373 ) ) ( not ( = ?auto_14385 ?auto_14386 ) ) ( not ( = ?auto_14385 ?auto_14379 ) ) ( not ( = ?auto_14385 ?auto_14390 ) ) ( not ( = ?auto_14385 ?auto_14374 ) ) ( not ( = ?auto_14385 ?auto_14377 ) ) ( not ( = ?auto_14385 ?auto_14372 ) ) ( not ( = ?auto_14353 ?auto_14363 ) ) ( not ( = ?auto_14353 ?auto_14367 ) ) ( not ( = ?auto_14354 ?auto_14363 ) ) ( not ( = ?auto_14354 ?auto_14367 ) ) ( not ( = ?auto_14355 ?auto_14363 ) ) ( not ( = ?auto_14355 ?auto_14367 ) ) ( not ( = ?auto_14356 ?auto_14363 ) ) ( not ( = ?auto_14356 ?auto_14367 ) ) ( not ( = ?auto_14357 ?auto_14363 ) ) ( not ( = ?auto_14357 ?auto_14367 ) ) ( not ( = ?auto_14358 ?auto_14363 ) ) ( not ( = ?auto_14358 ?auto_14367 ) ) ( not ( = ?auto_14359 ?auto_14363 ) ) ( not ( = ?auto_14359 ?auto_14367 ) ) ( not ( = ?auto_14360 ?auto_14363 ) ) ( not ( = ?auto_14360 ?auto_14367 ) ) ( not ( = ?auto_14361 ?auto_14363 ) ) ( not ( = ?auto_14361 ?auto_14367 ) ) ( not ( = ?auto_14363 ?auto_14385 ) ) ( not ( = ?auto_14363 ?auto_14382 ) ) ( not ( = ?auto_14363 ?auto_14373 ) ) ( not ( = ?auto_14363 ?auto_14386 ) ) ( not ( = ?auto_14363 ?auto_14379 ) ) ( not ( = ?auto_14363 ?auto_14390 ) ) ( not ( = ?auto_14363 ?auto_14374 ) ) ( not ( = ?auto_14363 ?auto_14377 ) ) ( not ( = ?auto_14363 ?auto_14372 ) ) ( not ( = ?auto_14367 ?auto_14385 ) ) ( not ( = ?auto_14367 ?auto_14382 ) ) ( not ( = ?auto_14367 ?auto_14373 ) ) ( not ( = ?auto_14367 ?auto_14386 ) ) ( not ( = ?auto_14367 ?auto_14379 ) ) ( not ( = ?auto_14367 ?auto_14390 ) ) ( not ( = ?auto_14367 ?auto_14374 ) ) ( not ( = ?auto_14367 ?auto_14377 ) ) ( not ( = ?auto_14367 ?auto_14372 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_14353 ?auto_14354 ?auto_14355 ?auto_14356 ?auto_14357 ?auto_14358 ?auto_14359 ?auto_14360 ?auto_14361 ?auto_14362 )
      ( MAKE-1CRATE ?auto_14362 ?auto_14363 )
      ( MAKE-10CRATE-VERIFY ?auto_14353 ?auto_14354 ?auto_14355 ?auto_14356 ?auto_14357 ?auto_14358 ?auto_14359 ?auto_14360 ?auto_14361 ?auto_14362 ?auto_14363 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_14413 - SURFACE
      ?auto_14414 - SURFACE
      ?auto_14415 - SURFACE
      ?auto_14416 - SURFACE
      ?auto_14417 - SURFACE
      ?auto_14418 - SURFACE
      ?auto_14419 - SURFACE
      ?auto_14420 - SURFACE
      ?auto_14421 - SURFACE
      ?auto_14422 - SURFACE
      ?auto_14423 - SURFACE
      ?auto_14424 - SURFACE
    )
    :vars
    (
      ?auto_14429 - HOIST
      ?auto_14427 - PLACE
      ?auto_14430 - PLACE
      ?auto_14425 - HOIST
      ?auto_14426 - SURFACE
      ?auto_14454 - PLACE
      ?auto_14449 - HOIST
      ?auto_14453 - SURFACE
      ?auto_14432 - PLACE
      ?auto_14438 - HOIST
      ?auto_14447 - SURFACE
      ?auto_14435 - PLACE
      ?auto_14445 - HOIST
      ?auto_14448 - SURFACE
      ?auto_14439 - SURFACE
      ?auto_14442 - PLACE
      ?auto_14431 - HOIST
      ?auto_14451 - SURFACE
      ?auto_14436 - PLACE
      ?auto_14450 - HOIST
      ?auto_14443 - SURFACE
      ?auto_14444 - PLACE
      ?auto_14452 - HOIST
      ?auto_14434 - SURFACE
      ?auto_14433 - PLACE
      ?auto_14446 - HOIST
      ?auto_14440 - SURFACE
      ?auto_14437 - SURFACE
      ?auto_14441 - SURFACE
      ?auto_14428 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14429 ?auto_14427 ) ( IS-CRATE ?auto_14424 ) ( not ( = ?auto_14430 ?auto_14427 ) ) ( HOIST-AT ?auto_14425 ?auto_14430 ) ( AVAILABLE ?auto_14425 ) ( SURFACE-AT ?auto_14424 ?auto_14430 ) ( ON ?auto_14424 ?auto_14426 ) ( CLEAR ?auto_14424 ) ( not ( = ?auto_14423 ?auto_14424 ) ) ( not ( = ?auto_14423 ?auto_14426 ) ) ( not ( = ?auto_14424 ?auto_14426 ) ) ( not ( = ?auto_14429 ?auto_14425 ) ) ( IS-CRATE ?auto_14423 ) ( not ( = ?auto_14454 ?auto_14427 ) ) ( HOIST-AT ?auto_14449 ?auto_14454 ) ( SURFACE-AT ?auto_14423 ?auto_14454 ) ( ON ?auto_14423 ?auto_14453 ) ( CLEAR ?auto_14423 ) ( not ( = ?auto_14422 ?auto_14423 ) ) ( not ( = ?auto_14422 ?auto_14453 ) ) ( not ( = ?auto_14423 ?auto_14453 ) ) ( not ( = ?auto_14429 ?auto_14449 ) ) ( IS-CRATE ?auto_14422 ) ( not ( = ?auto_14432 ?auto_14427 ) ) ( HOIST-AT ?auto_14438 ?auto_14432 ) ( SURFACE-AT ?auto_14422 ?auto_14432 ) ( ON ?auto_14422 ?auto_14447 ) ( CLEAR ?auto_14422 ) ( not ( = ?auto_14421 ?auto_14422 ) ) ( not ( = ?auto_14421 ?auto_14447 ) ) ( not ( = ?auto_14422 ?auto_14447 ) ) ( not ( = ?auto_14429 ?auto_14438 ) ) ( IS-CRATE ?auto_14421 ) ( not ( = ?auto_14435 ?auto_14427 ) ) ( HOIST-AT ?auto_14445 ?auto_14435 ) ( SURFACE-AT ?auto_14421 ?auto_14435 ) ( ON ?auto_14421 ?auto_14448 ) ( CLEAR ?auto_14421 ) ( not ( = ?auto_14420 ?auto_14421 ) ) ( not ( = ?auto_14420 ?auto_14448 ) ) ( not ( = ?auto_14421 ?auto_14448 ) ) ( not ( = ?auto_14429 ?auto_14445 ) ) ( IS-CRATE ?auto_14420 ) ( AVAILABLE ?auto_14438 ) ( SURFACE-AT ?auto_14420 ?auto_14432 ) ( ON ?auto_14420 ?auto_14439 ) ( CLEAR ?auto_14420 ) ( not ( = ?auto_14419 ?auto_14420 ) ) ( not ( = ?auto_14419 ?auto_14439 ) ) ( not ( = ?auto_14420 ?auto_14439 ) ) ( IS-CRATE ?auto_14419 ) ( not ( = ?auto_14442 ?auto_14427 ) ) ( HOIST-AT ?auto_14431 ?auto_14442 ) ( AVAILABLE ?auto_14431 ) ( SURFACE-AT ?auto_14419 ?auto_14442 ) ( ON ?auto_14419 ?auto_14451 ) ( CLEAR ?auto_14419 ) ( not ( = ?auto_14418 ?auto_14419 ) ) ( not ( = ?auto_14418 ?auto_14451 ) ) ( not ( = ?auto_14419 ?auto_14451 ) ) ( not ( = ?auto_14429 ?auto_14431 ) ) ( IS-CRATE ?auto_14418 ) ( not ( = ?auto_14436 ?auto_14427 ) ) ( HOIST-AT ?auto_14450 ?auto_14436 ) ( AVAILABLE ?auto_14450 ) ( SURFACE-AT ?auto_14418 ?auto_14436 ) ( ON ?auto_14418 ?auto_14443 ) ( CLEAR ?auto_14418 ) ( not ( = ?auto_14417 ?auto_14418 ) ) ( not ( = ?auto_14417 ?auto_14443 ) ) ( not ( = ?auto_14418 ?auto_14443 ) ) ( not ( = ?auto_14429 ?auto_14450 ) ) ( IS-CRATE ?auto_14417 ) ( not ( = ?auto_14444 ?auto_14427 ) ) ( HOIST-AT ?auto_14452 ?auto_14444 ) ( AVAILABLE ?auto_14452 ) ( SURFACE-AT ?auto_14417 ?auto_14444 ) ( ON ?auto_14417 ?auto_14434 ) ( CLEAR ?auto_14417 ) ( not ( = ?auto_14416 ?auto_14417 ) ) ( not ( = ?auto_14416 ?auto_14434 ) ) ( not ( = ?auto_14417 ?auto_14434 ) ) ( not ( = ?auto_14429 ?auto_14452 ) ) ( IS-CRATE ?auto_14416 ) ( not ( = ?auto_14433 ?auto_14427 ) ) ( HOIST-AT ?auto_14446 ?auto_14433 ) ( AVAILABLE ?auto_14446 ) ( SURFACE-AT ?auto_14416 ?auto_14433 ) ( ON ?auto_14416 ?auto_14440 ) ( CLEAR ?auto_14416 ) ( not ( = ?auto_14415 ?auto_14416 ) ) ( not ( = ?auto_14415 ?auto_14440 ) ) ( not ( = ?auto_14416 ?auto_14440 ) ) ( not ( = ?auto_14429 ?auto_14446 ) ) ( IS-CRATE ?auto_14415 ) ( AVAILABLE ?auto_14449 ) ( SURFACE-AT ?auto_14415 ?auto_14454 ) ( ON ?auto_14415 ?auto_14437 ) ( CLEAR ?auto_14415 ) ( not ( = ?auto_14414 ?auto_14415 ) ) ( not ( = ?auto_14414 ?auto_14437 ) ) ( not ( = ?auto_14415 ?auto_14437 ) ) ( SURFACE-AT ?auto_14413 ?auto_14427 ) ( CLEAR ?auto_14413 ) ( IS-CRATE ?auto_14414 ) ( AVAILABLE ?auto_14429 ) ( AVAILABLE ?auto_14445 ) ( SURFACE-AT ?auto_14414 ?auto_14435 ) ( ON ?auto_14414 ?auto_14441 ) ( CLEAR ?auto_14414 ) ( TRUCK-AT ?auto_14428 ?auto_14427 ) ( not ( = ?auto_14413 ?auto_14414 ) ) ( not ( = ?auto_14413 ?auto_14441 ) ) ( not ( = ?auto_14414 ?auto_14441 ) ) ( not ( = ?auto_14413 ?auto_14415 ) ) ( not ( = ?auto_14413 ?auto_14437 ) ) ( not ( = ?auto_14415 ?auto_14441 ) ) ( not ( = ?auto_14454 ?auto_14435 ) ) ( not ( = ?auto_14449 ?auto_14445 ) ) ( not ( = ?auto_14437 ?auto_14441 ) ) ( not ( = ?auto_14413 ?auto_14416 ) ) ( not ( = ?auto_14413 ?auto_14440 ) ) ( not ( = ?auto_14414 ?auto_14416 ) ) ( not ( = ?auto_14414 ?auto_14440 ) ) ( not ( = ?auto_14416 ?auto_14437 ) ) ( not ( = ?auto_14416 ?auto_14441 ) ) ( not ( = ?auto_14433 ?auto_14454 ) ) ( not ( = ?auto_14433 ?auto_14435 ) ) ( not ( = ?auto_14446 ?auto_14449 ) ) ( not ( = ?auto_14446 ?auto_14445 ) ) ( not ( = ?auto_14440 ?auto_14437 ) ) ( not ( = ?auto_14440 ?auto_14441 ) ) ( not ( = ?auto_14413 ?auto_14417 ) ) ( not ( = ?auto_14413 ?auto_14434 ) ) ( not ( = ?auto_14414 ?auto_14417 ) ) ( not ( = ?auto_14414 ?auto_14434 ) ) ( not ( = ?auto_14415 ?auto_14417 ) ) ( not ( = ?auto_14415 ?auto_14434 ) ) ( not ( = ?auto_14417 ?auto_14440 ) ) ( not ( = ?auto_14417 ?auto_14437 ) ) ( not ( = ?auto_14417 ?auto_14441 ) ) ( not ( = ?auto_14444 ?auto_14433 ) ) ( not ( = ?auto_14444 ?auto_14454 ) ) ( not ( = ?auto_14444 ?auto_14435 ) ) ( not ( = ?auto_14452 ?auto_14446 ) ) ( not ( = ?auto_14452 ?auto_14449 ) ) ( not ( = ?auto_14452 ?auto_14445 ) ) ( not ( = ?auto_14434 ?auto_14440 ) ) ( not ( = ?auto_14434 ?auto_14437 ) ) ( not ( = ?auto_14434 ?auto_14441 ) ) ( not ( = ?auto_14413 ?auto_14418 ) ) ( not ( = ?auto_14413 ?auto_14443 ) ) ( not ( = ?auto_14414 ?auto_14418 ) ) ( not ( = ?auto_14414 ?auto_14443 ) ) ( not ( = ?auto_14415 ?auto_14418 ) ) ( not ( = ?auto_14415 ?auto_14443 ) ) ( not ( = ?auto_14416 ?auto_14418 ) ) ( not ( = ?auto_14416 ?auto_14443 ) ) ( not ( = ?auto_14418 ?auto_14434 ) ) ( not ( = ?auto_14418 ?auto_14440 ) ) ( not ( = ?auto_14418 ?auto_14437 ) ) ( not ( = ?auto_14418 ?auto_14441 ) ) ( not ( = ?auto_14436 ?auto_14444 ) ) ( not ( = ?auto_14436 ?auto_14433 ) ) ( not ( = ?auto_14436 ?auto_14454 ) ) ( not ( = ?auto_14436 ?auto_14435 ) ) ( not ( = ?auto_14450 ?auto_14452 ) ) ( not ( = ?auto_14450 ?auto_14446 ) ) ( not ( = ?auto_14450 ?auto_14449 ) ) ( not ( = ?auto_14450 ?auto_14445 ) ) ( not ( = ?auto_14443 ?auto_14434 ) ) ( not ( = ?auto_14443 ?auto_14440 ) ) ( not ( = ?auto_14443 ?auto_14437 ) ) ( not ( = ?auto_14443 ?auto_14441 ) ) ( not ( = ?auto_14413 ?auto_14419 ) ) ( not ( = ?auto_14413 ?auto_14451 ) ) ( not ( = ?auto_14414 ?auto_14419 ) ) ( not ( = ?auto_14414 ?auto_14451 ) ) ( not ( = ?auto_14415 ?auto_14419 ) ) ( not ( = ?auto_14415 ?auto_14451 ) ) ( not ( = ?auto_14416 ?auto_14419 ) ) ( not ( = ?auto_14416 ?auto_14451 ) ) ( not ( = ?auto_14417 ?auto_14419 ) ) ( not ( = ?auto_14417 ?auto_14451 ) ) ( not ( = ?auto_14419 ?auto_14443 ) ) ( not ( = ?auto_14419 ?auto_14434 ) ) ( not ( = ?auto_14419 ?auto_14440 ) ) ( not ( = ?auto_14419 ?auto_14437 ) ) ( not ( = ?auto_14419 ?auto_14441 ) ) ( not ( = ?auto_14442 ?auto_14436 ) ) ( not ( = ?auto_14442 ?auto_14444 ) ) ( not ( = ?auto_14442 ?auto_14433 ) ) ( not ( = ?auto_14442 ?auto_14454 ) ) ( not ( = ?auto_14442 ?auto_14435 ) ) ( not ( = ?auto_14431 ?auto_14450 ) ) ( not ( = ?auto_14431 ?auto_14452 ) ) ( not ( = ?auto_14431 ?auto_14446 ) ) ( not ( = ?auto_14431 ?auto_14449 ) ) ( not ( = ?auto_14431 ?auto_14445 ) ) ( not ( = ?auto_14451 ?auto_14443 ) ) ( not ( = ?auto_14451 ?auto_14434 ) ) ( not ( = ?auto_14451 ?auto_14440 ) ) ( not ( = ?auto_14451 ?auto_14437 ) ) ( not ( = ?auto_14451 ?auto_14441 ) ) ( not ( = ?auto_14413 ?auto_14420 ) ) ( not ( = ?auto_14413 ?auto_14439 ) ) ( not ( = ?auto_14414 ?auto_14420 ) ) ( not ( = ?auto_14414 ?auto_14439 ) ) ( not ( = ?auto_14415 ?auto_14420 ) ) ( not ( = ?auto_14415 ?auto_14439 ) ) ( not ( = ?auto_14416 ?auto_14420 ) ) ( not ( = ?auto_14416 ?auto_14439 ) ) ( not ( = ?auto_14417 ?auto_14420 ) ) ( not ( = ?auto_14417 ?auto_14439 ) ) ( not ( = ?auto_14418 ?auto_14420 ) ) ( not ( = ?auto_14418 ?auto_14439 ) ) ( not ( = ?auto_14420 ?auto_14451 ) ) ( not ( = ?auto_14420 ?auto_14443 ) ) ( not ( = ?auto_14420 ?auto_14434 ) ) ( not ( = ?auto_14420 ?auto_14440 ) ) ( not ( = ?auto_14420 ?auto_14437 ) ) ( not ( = ?auto_14420 ?auto_14441 ) ) ( not ( = ?auto_14432 ?auto_14442 ) ) ( not ( = ?auto_14432 ?auto_14436 ) ) ( not ( = ?auto_14432 ?auto_14444 ) ) ( not ( = ?auto_14432 ?auto_14433 ) ) ( not ( = ?auto_14432 ?auto_14454 ) ) ( not ( = ?auto_14432 ?auto_14435 ) ) ( not ( = ?auto_14438 ?auto_14431 ) ) ( not ( = ?auto_14438 ?auto_14450 ) ) ( not ( = ?auto_14438 ?auto_14452 ) ) ( not ( = ?auto_14438 ?auto_14446 ) ) ( not ( = ?auto_14438 ?auto_14449 ) ) ( not ( = ?auto_14438 ?auto_14445 ) ) ( not ( = ?auto_14439 ?auto_14451 ) ) ( not ( = ?auto_14439 ?auto_14443 ) ) ( not ( = ?auto_14439 ?auto_14434 ) ) ( not ( = ?auto_14439 ?auto_14440 ) ) ( not ( = ?auto_14439 ?auto_14437 ) ) ( not ( = ?auto_14439 ?auto_14441 ) ) ( not ( = ?auto_14413 ?auto_14421 ) ) ( not ( = ?auto_14413 ?auto_14448 ) ) ( not ( = ?auto_14414 ?auto_14421 ) ) ( not ( = ?auto_14414 ?auto_14448 ) ) ( not ( = ?auto_14415 ?auto_14421 ) ) ( not ( = ?auto_14415 ?auto_14448 ) ) ( not ( = ?auto_14416 ?auto_14421 ) ) ( not ( = ?auto_14416 ?auto_14448 ) ) ( not ( = ?auto_14417 ?auto_14421 ) ) ( not ( = ?auto_14417 ?auto_14448 ) ) ( not ( = ?auto_14418 ?auto_14421 ) ) ( not ( = ?auto_14418 ?auto_14448 ) ) ( not ( = ?auto_14419 ?auto_14421 ) ) ( not ( = ?auto_14419 ?auto_14448 ) ) ( not ( = ?auto_14421 ?auto_14439 ) ) ( not ( = ?auto_14421 ?auto_14451 ) ) ( not ( = ?auto_14421 ?auto_14443 ) ) ( not ( = ?auto_14421 ?auto_14434 ) ) ( not ( = ?auto_14421 ?auto_14440 ) ) ( not ( = ?auto_14421 ?auto_14437 ) ) ( not ( = ?auto_14421 ?auto_14441 ) ) ( not ( = ?auto_14448 ?auto_14439 ) ) ( not ( = ?auto_14448 ?auto_14451 ) ) ( not ( = ?auto_14448 ?auto_14443 ) ) ( not ( = ?auto_14448 ?auto_14434 ) ) ( not ( = ?auto_14448 ?auto_14440 ) ) ( not ( = ?auto_14448 ?auto_14437 ) ) ( not ( = ?auto_14448 ?auto_14441 ) ) ( not ( = ?auto_14413 ?auto_14422 ) ) ( not ( = ?auto_14413 ?auto_14447 ) ) ( not ( = ?auto_14414 ?auto_14422 ) ) ( not ( = ?auto_14414 ?auto_14447 ) ) ( not ( = ?auto_14415 ?auto_14422 ) ) ( not ( = ?auto_14415 ?auto_14447 ) ) ( not ( = ?auto_14416 ?auto_14422 ) ) ( not ( = ?auto_14416 ?auto_14447 ) ) ( not ( = ?auto_14417 ?auto_14422 ) ) ( not ( = ?auto_14417 ?auto_14447 ) ) ( not ( = ?auto_14418 ?auto_14422 ) ) ( not ( = ?auto_14418 ?auto_14447 ) ) ( not ( = ?auto_14419 ?auto_14422 ) ) ( not ( = ?auto_14419 ?auto_14447 ) ) ( not ( = ?auto_14420 ?auto_14422 ) ) ( not ( = ?auto_14420 ?auto_14447 ) ) ( not ( = ?auto_14422 ?auto_14448 ) ) ( not ( = ?auto_14422 ?auto_14439 ) ) ( not ( = ?auto_14422 ?auto_14451 ) ) ( not ( = ?auto_14422 ?auto_14443 ) ) ( not ( = ?auto_14422 ?auto_14434 ) ) ( not ( = ?auto_14422 ?auto_14440 ) ) ( not ( = ?auto_14422 ?auto_14437 ) ) ( not ( = ?auto_14422 ?auto_14441 ) ) ( not ( = ?auto_14447 ?auto_14448 ) ) ( not ( = ?auto_14447 ?auto_14439 ) ) ( not ( = ?auto_14447 ?auto_14451 ) ) ( not ( = ?auto_14447 ?auto_14443 ) ) ( not ( = ?auto_14447 ?auto_14434 ) ) ( not ( = ?auto_14447 ?auto_14440 ) ) ( not ( = ?auto_14447 ?auto_14437 ) ) ( not ( = ?auto_14447 ?auto_14441 ) ) ( not ( = ?auto_14413 ?auto_14423 ) ) ( not ( = ?auto_14413 ?auto_14453 ) ) ( not ( = ?auto_14414 ?auto_14423 ) ) ( not ( = ?auto_14414 ?auto_14453 ) ) ( not ( = ?auto_14415 ?auto_14423 ) ) ( not ( = ?auto_14415 ?auto_14453 ) ) ( not ( = ?auto_14416 ?auto_14423 ) ) ( not ( = ?auto_14416 ?auto_14453 ) ) ( not ( = ?auto_14417 ?auto_14423 ) ) ( not ( = ?auto_14417 ?auto_14453 ) ) ( not ( = ?auto_14418 ?auto_14423 ) ) ( not ( = ?auto_14418 ?auto_14453 ) ) ( not ( = ?auto_14419 ?auto_14423 ) ) ( not ( = ?auto_14419 ?auto_14453 ) ) ( not ( = ?auto_14420 ?auto_14423 ) ) ( not ( = ?auto_14420 ?auto_14453 ) ) ( not ( = ?auto_14421 ?auto_14423 ) ) ( not ( = ?auto_14421 ?auto_14453 ) ) ( not ( = ?auto_14423 ?auto_14447 ) ) ( not ( = ?auto_14423 ?auto_14448 ) ) ( not ( = ?auto_14423 ?auto_14439 ) ) ( not ( = ?auto_14423 ?auto_14451 ) ) ( not ( = ?auto_14423 ?auto_14443 ) ) ( not ( = ?auto_14423 ?auto_14434 ) ) ( not ( = ?auto_14423 ?auto_14440 ) ) ( not ( = ?auto_14423 ?auto_14437 ) ) ( not ( = ?auto_14423 ?auto_14441 ) ) ( not ( = ?auto_14453 ?auto_14447 ) ) ( not ( = ?auto_14453 ?auto_14448 ) ) ( not ( = ?auto_14453 ?auto_14439 ) ) ( not ( = ?auto_14453 ?auto_14451 ) ) ( not ( = ?auto_14453 ?auto_14443 ) ) ( not ( = ?auto_14453 ?auto_14434 ) ) ( not ( = ?auto_14453 ?auto_14440 ) ) ( not ( = ?auto_14453 ?auto_14437 ) ) ( not ( = ?auto_14453 ?auto_14441 ) ) ( not ( = ?auto_14413 ?auto_14424 ) ) ( not ( = ?auto_14413 ?auto_14426 ) ) ( not ( = ?auto_14414 ?auto_14424 ) ) ( not ( = ?auto_14414 ?auto_14426 ) ) ( not ( = ?auto_14415 ?auto_14424 ) ) ( not ( = ?auto_14415 ?auto_14426 ) ) ( not ( = ?auto_14416 ?auto_14424 ) ) ( not ( = ?auto_14416 ?auto_14426 ) ) ( not ( = ?auto_14417 ?auto_14424 ) ) ( not ( = ?auto_14417 ?auto_14426 ) ) ( not ( = ?auto_14418 ?auto_14424 ) ) ( not ( = ?auto_14418 ?auto_14426 ) ) ( not ( = ?auto_14419 ?auto_14424 ) ) ( not ( = ?auto_14419 ?auto_14426 ) ) ( not ( = ?auto_14420 ?auto_14424 ) ) ( not ( = ?auto_14420 ?auto_14426 ) ) ( not ( = ?auto_14421 ?auto_14424 ) ) ( not ( = ?auto_14421 ?auto_14426 ) ) ( not ( = ?auto_14422 ?auto_14424 ) ) ( not ( = ?auto_14422 ?auto_14426 ) ) ( not ( = ?auto_14424 ?auto_14453 ) ) ( not ( = ?auto_14424 ?auto_14447 ) ) ( not ( = ?auto_14424 ?auto_14448 ) ) ( not ( = ?auto_14424 ?auto_14439 ) ) ( not ( = ?auto_14424 ?auto_14451 ) ) ( not ( = ?auto_14424 ?auto_14443 ) ) ( not ( = ?auto_14424 ?auto_14434 ) ) ( not ( = ?auto_14424 ?auto_14440 ) ) ( not ( = ?auto_14424 ?auto_14437 ) ) ( not ( = ?auto_14424 ?auto_14441 ) ) ( not ( = ?auto_14430 ?auto_14454 ) ) ( not ( = ?auto_14430 ?auto_14432 ) ) ( not ( = ?auto_14430 ?auto_14435 ) ) ( not ( = ?auto_14430 ?auto_14442 ) ) ( not ( = ?auto_14430 ?auto_14436 ) ) ( not ( = ?auto_14430 ?auto_14444 ) ) ( not ( = ?auto_14430 ?auto_14433 ) ) ( not ( = ?auto_14425 ?auto_14449 ) ) ( not ( = ?auto_14425 ?auto_14438 ) ) ( not ( = ?auto_14425 ?auto_14445 ) ) ( not ( = ?auto_14425 ?auto_14431 ) ) ( not ( = ?auto_14425 ?auto_14450 ) ) ( not ( = ?auto_14425 ?auto_14452 ) ) ( not ( = ?auto_14425 ?auto_14446 ) ) ( not ( = ?auto_14426 ?auto_14453 ) ) ( not ( = ?auto_14426 ?auto_14447 ) ) ( not ( = ?auto_14426 ?auto_14448 ) ) ( not ( = ?auto_14426 ?auto_14439 ) ) ( not ( = ?auto_14426 ?auto_14451 ) ) ( not ( = ?auto_14426 ?auto_14443 ) ) ( not ( = ?auto_14426 ?auto_14434 ) ) ( not ( = ?auto_14426 ?auto_14440 ) ) ( not ( = ?auto_14426 ?auto_14437 ) ) ( not ( = ?auto_14426 ?auto_14441 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_14413 ?auto_14414 ?auto_14415 ?auto_14416 ?auto_14417 ?auto_14418 ?auto_14419 ?auto_14420 ?auto_14421 ?auto_14422 ?auto_14423 )
      ( MAKE-1CRATE ?auto_14423 ?auto_14424 )
      ( MAKE-11CRATE-VERIFY ?auto_14413 ?auto_14414 ?auto_14415 ?auto_14416 ?auto_14417 ?auto_14418 ?auto_14419 ?auto_14420 ?auto_14421 ?auto_14422 ?auto_14423 ?auto_14424 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_14478 - SURFACE
      ?auto_14479 - SURFACE
      ?auto_14480 - SURFACE
      ?auto_14481 - SURFACE
      ?auto_14482 - SURFACE
      ?auto_14483 - SURFACE
      ?auto_14484 - SURFACE
      ?auto_14485 - SURFACE
      ?auto_14486 - SURFACE
      ?auto_14487 - SURFACE
      ?auto_14488 - SURFACE
      ?auto_14489 - SURFACE
      ?auto_14490 - SURFACE
    )
    :vars
    (
      ?auto_14496 - HOIST
      ?auto_14495 - PLACE
      ?auto_14492 - PLACE
      ?auto_14491 - HOIST
      ?auto_14493 - SURFACE
      ?auto_14519 - PLACE
      ?auto_14520 - HOIST
      ?auto_14514 - SURFACE
      ?auto_14509 - PLACE
      ?auto_14505 - HOIST
      ?auto_14517 - SURFACE
      ?auto_14503 - PLACE
      ?auto_14513 - HOIST
      ?auto_14502 - SURFACE
      ?auto_14515 - PLACE
      ?auto_14518 - HOIST
      ?auto_14501 - SURFACE
      ?auto_14508 - SURFACE
      ?auto_14521 - SURFACE
      ?auto_14499 - PLACE
      ?auto_14498 - HOIST
      ?auto_14510 - SURFACE
      ?auto_14504 - PLACE
      ?auto_14500 - HOIST
      ?auto_14511 - SURFACE
      ?auto_14512 - PLACE
      ?auto_14497 - HOIST
      ?auto_14506 - SURFACE
      ?auto_14516 - SURFACE
      ?auto_14507 - SURFACE
      ?auto_14494 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14496 ?auto_14495 ) ( IS-CRATE ?auto_14490 ) ( not ( = ?auto_14492 ?auto_14495 ) ) ( HOIST-AT ?auto_14491 ?auto_14492 ) ( SURFACE-AT ?auto_14490 ?auto_14492 ) ( ON ?auto_14490 ?auto_14493 ) ( CLEAR ?auto_14490 ) ( not ( = ?auto_14489 ?auto_14490 ) ) ( not ( = ?auto_14489 ?auto_14493 ) ) ( not ( = ?auto_14490 ?auto_14493 ) ) ( not ( = ?auto_14496 ?auto_14491 ) ) ( IS-CRATE ?auto_14489 ) ( not ( = ?auto_14519 ?auto_14495 ) ) ( HOIST-AT ?auto_14520 ?auto_14519 ) ( AVAILABLE ?auto_14520 ) ( SURFACE-AT ?auto_14489 ?auto_14519 ) ( ON ?auto_14489 ?auto_14514 ) ( CLEAR ?auto_14489 ) ( not ( = ?auto_14488 ?auto_14489 ) ) ( not ( = ?auto_14488 ?auto_14514 ) ) ( not ( = ?auto_14489 ?auto_14514 ) ) ( not ( = ?auto_14496 ?auto_14520 ) ) ( IS-CRATE ?auto_14488 ) ( not ( = ?auto_14509 ?auto_14495 ) ) ( HOIST-AT ?auto_14505 ?auto_14509 ) ( SURFACE-AT ?auto_14488 ?auto_14509 ) ( ON ?auto_14488 ?auto_14517 ) ( CLEAR ?auto_14488 ) ( not ( = ?auto_14487 ?auto_14488 ) ) ( not ( = ?auto_14487 ?auto_14517 ) ) ( not ( = ?auto_14488 ?auto_14517 ) ) ( not ( = ?auto_14496 ?auto_14505 ) ) ( IS-CRATE ?auto_14487 ) ( not ( = ?auto_14503 ?auto_14495 ) ) ( HOIST-AT ?auto_14513 ?auto_14503 ) ( SURFACE-AT ?auto_14487 ?auto_14503 ) ( ON ?auto_14487 ?auto_14502 ) ( CLEAR ?auto_14487 ) ( not ( = ?auto_14486 ?auto_14487 ) ) ( not ( = ?auto_14486 ?auto_14502 ) ) ( not ( = ?auto_14487 ?auto_14502 ) ) ( not ( = ?auto_14496 ?auto_14513 ) ) ( IS-CRATE ?auto_14486 ) ( not ( = ?auto_14515 ?auto_14495 ) ) ( HOIST-AT ?auto_14518 ?auto_14515 ) ( SURFACE-AT ?auto_14486 ?auto_14515 ) ( ON ?auto_14486 ?auto_14501 ) ( CLEAR ?auto_14486 ) ( not ( = ?auto_14485 ?auto_14486 ) ) ( not ( = ?auto_14485 ?auto_14501 ) ) ( not ( = ?auto_14486 ?auto_14501 ) ) ( not ( = ?auto_14496 ?auto_14518 ) ) ( IS-CRATE ?auto_14485 ) ( AVAILABLE ?auto_14513 ) ( SURFACE-AT ?auto_14485 ?auto_14503 ) ( ON ?auto_14485 ?auto_14508 ) ( CLEAR ?auto_14485 ) ( not ( = ?auto_14484 ?auto_14485 ) ) ( not ( = ?auto_14484 ?auto_14508 ) ) ( not ( = ?auto_14485 ?auto_14508 ) ) ( IS-CRATE ?auto_14484 ) ( AVAILABLE ?auto_14491 ) ( SURFACE-AT ?auto_14484 ?auto_14492 ) ( ON ?auto_14484 ?auto_14521 ) ( CLEAR ?auto_14484 ) ( not ( = ?auto_14483 ?auto_14484 ) ) ( not ( = ?auto_14483 ?auto_14521 ) ) ( not ( = ?auto_14484 ?auto_14521 ) ) ( IS-CRATE ?auto_14483 ) ( not ( = ?auto_14499 ?auto_14495 ) ) ( HOIST-AT ?auto_14498 ?auto_14499 ) ( AVAILABLE ?auto_14498 ) ( SURFACE-AT ?auto_14483 ?auto_14499 ) ( ON ?auto_14483 ?auto_14510 ) ( CLEAR ?auto_14483 ) ( not ( = ?auto_14482 ?auto_14483 ) ) ( not ( = ?auto_14482 ?auto_14510 ) ) ( not ( = ?auto_14483 ?auto_14510 ) ) ( not ( = ?auto_14496 ?auto_14498 ) ) ( IS-CRATE ?auto_14482 ) ( not ( = ?auto_14504 ?auto_14495 ) ) ( HOIST-AT ?auto_14500 ?auto_14504 ) ( AVAILABLE ?auto_14500 ) ( SURFACE-AT ?auto_14482 ?auto_14504 ) ( ON ?auto_14482 ?auto_14511 ) ( CLEAR ?auto_14482 ) ( not ( = ?auto_14481 ?auto_14482 ) ) ( not ( = ?auto_14481 ?auto_14511 ) ) ( not ( = ?auto_14482 ?auto_14511 ) ) ( not ( = ?auto_14496 ?auto_14500 ) ) ( IS-CRATE ?auto_14481 ) ( not ( = ?auto_14512 ?auto_14495 ) ) ( HOIST-AT ?auto_14497 ?auto_14512 ) ( AVAILABLE ?auto_14497 ) ( SURFACE-AT ?auto_14481 ?auto_14512 ) ( ON ?auto_14481 ?auto_14506 ) ( CLEAR ?auto_14481 ) ( not ( = ?auto_14480 ?auto_14481 ) ) ( not ( = ?auto_14480 ?auto_14506 ) ) ( not ( = ?auto_14481 ?auto_14506 ) ) ( not ( = ?auto_14496 ?auto_14497 ) ) ( IS-CRATE ?auto_14480 ) ( AVAILABLE ?auto_14505 ) ( SURFACE-AT ?auto_14480 ?auto_14509 ) ( ON ?auto_14480 ?auto_14516 ) ( CLEAR ?auto_14480 ) ( not ( = ?auto_14479 ?auto_14480 ) ) ( not ( = ?auto_14479 ?auto_14516 ) ) ( not ( = ?auto_14480 ?auto_14516 ) ) ( SURFACE-AT ?auto_14478 ?auto_14495 ) ( CLEAR ?auto_14478 ) ( IS-CRATE ?auto_14479 ) ( AVAILABLE ?auto_14496 ) ( AVAILABLE ?auto_14518 ) ( SURFACE-AT ?auto_14479 ?auto_14515 ) ( ON ?auto_14479 ?auto_14507 ) ( CLEAR ?auto_14479 ) ( TRUCK-AT ?auto_14494 ?auto_14495 ) ( not ( = ?auto_14478 ?auto_14479 ) ) ( not ( = ?auto_14478 ?auto_14507 ) ) ( not ( = ?auto_14479 ?auto_14507 ) ) ( not ( = ?auto_14478 ?auto_14480 ) ) ( not ( = ?auto_14478 ?auto_14516 ) ) ( not ( = ?auto_14480 ?auto_14507 ) ) ( not ( = ?auto_14509 ?auto_14515 ) ) ( not ( = ?auto_14505 ?auto_14518 ) ) ( not ( = ?auto_14516 ?auto_14507 ) ) ( not ( = ?auto_14478 ?auto_14481 ) ) ( not ( = ?auto_14478 ?auto_14506 ) ) ( not ( = ?auto_14479 ?auto_14481 ) ) ( not ( = ?auto_14479 ?auto_14506 ) ) ( not ( = ?auto_14481 ?auto_14516 ) ) ( not ( = ?auto_14481 ?auto_14507 ) ) ( not ( = ?auto_14512 ?auto_14509 ) ) ( not ( = ?auto_14512 ?auto_14515 ) ) ( not ( = ?auto_14497 ?auto_14505 ) ) ( not ( = ?auto_14497 ?auto_14518 ) ) ( not ( = ?auto_14506 ?auto_14516 ) ) ( not ( = ?auto_14506 ?auto_14507 ) ) ( not ( = ?auto_14478 ?auto_14482 ) ) ( not ( = ?auto_14478 ?auto_14511 ) ) ( not ( = ?auto_14479 ?auto_14482 ) ) ( not ( = ?auto_14479 ?auto_14511 ) ) ( not ( = ?auto_14480 ?auto_14482 ) ) ( not ( = ?auto_14480 ?auto_14511 ) ) ( not ( = ?auto_14482 ?auto_14506 ) ) ( not ( = ?auto_14482 ?auto_14516 ) ) ( not ( = ?auto_14482 ?auto_14507 ) ) ( not ( = ?auto_14504 ?auto_14512 ) ) ( not ( = ?auto_14504 ?auto_14509 ) ) ( not ( = ?auto_14504 ?auto_14515 ) ) ( not ( = ?auto_14500 ?auto_14497 ) ) ( not ( = ?auto_14500 ?auto_14505 ) ) ( not ( = ?auto_14500 ?auto_14518 ) ) ( not ( = ?auto_14511 ?auto_14506 ) ) ( not ( = ?auto_14511 ?auto_14516 ) ) ( not ( = ?auto_14511 ?auto_14507 ) ) ( not ( = ?auto_14478 ?auto_14483 ) ) ( not ( = ?auto_14478 ?auto_14510 ) ) ( not ( = ?auto_14479 ?auto_14483 ) ) ( not ( = ?auto_14479 ?auto_14510 ) ) ( not ( = ?auto_14480 ?auto_14483 ) ) ( not ( = ?auto_14480 ?auto_14510 ) ) ( not ( = ?auto_14481 ?auto_14483 ) ) ( not ( = ?auto_14481 ?auto_14510 ) ) ( not ( = ?auto_14483 ?auto_14511 ) ) ( not ( = ?auto_14483 ?auto_14506 ) ) ( not ( = ?auto_14483 ?auto_14516 ) ) ( not ( = ?auto_14483 ?auto_14507 ) ) ( not ( = ?auto_14499 ?auto_14504 ) ) ( not ( = ?auto_14499 ?auto_14512 ) ) ( not ( = ?auto_14499 ?auto_14509 ) ) ( not ( = ?auto_14499 ?auto_14515 ) ) ( not ( = ?auto_14498 ?auto_14500 ) ) ( not ( = ?auto_14498 ?auto_14497 ) ) ( not ( = ?auto_14498 ?auto_14505 ) ) ( not ( = ?auto_14498 ?auto_14518 ) ) ( not ( = ?auto_14510 ?auto_14511 ) ) ( not ( = ?auto_14510 ?auto_14506 ) ) ( not ( = ?auto_14510 ?auto_14516 ) ) ( not ( = ?auto_14510 ?auto_14507 ) ) ( not ( = ?auto_14478 ?auto_14484 ) ) ( not ( = ?auto_14478 ?auto_14521 ) ) ( not ( = ?auto_14479 ?auto_14484 ) ) ( not ( = ?auto_14479 ?auto_14521 ) ) ( not ( = ?auto_14480 ?auto_14484 ) ) ( not ( = ?auto_14480 ?auto_14521 ) ) ( not ( = ?auto_14481 ?auto_14484 ) ) ( not ( = ?auto_14481 ?auto_14521 ) ) ( not ( = ?auto_14482 ?auto_14484 ) ) ( not ( = ?auto_14482 ?auto_14521 ) ) ( not ( = ?auto_14484 ?auto_14510 ) ) ( not ( = ?auto_14484 ?auto_14511 ) ) ( not ( = ?auto_14484 ?auto_14506 ) ) ( not ( = ?auto_14484 ?auto_14516 ) ) ( not ( = ?auto_14484 ?auto_14507 ) ) ( not ( = ?auto_14492 ?auto_14499 ) ) ( not ( = ?auto_14492 ?auto_14504 ) ) ( not ( = ?auto_14492 ?auto_14512 ) ) ( not ( = ?auto_14492 ?auto_14509 ) ) ( not ( = ?auto_14492 ?auto_14515 ) ) ( not ( = ?auto_14491 ?auto_14498 ) ) ( not ( = ?auto_14491 ?auto_14500 ) ) ( not ( = ?auto_14491 ?auto_14497 ) ) ( not ( = ?auto_14491 ?auto_14505 ) ) ( not ( = ?auto_14491 ?auto_14518 ) ) ( not ( = ?auto_14521 ?auto_14510 ) ) ( not ( = ?auto_14521 ?auto_14511 ) ) ( not ( = ?auto_14521 ?auto_14506 ) ) ( not ( = ?auto_14521 ?auto_14516 ) ) ( not ( = ?auto_14521 ?auto_14507 ) ) ( not ( = ?auto_14478 ?auto_14485 ) ) ( not ( = ?auto_14478 ?auto_14508 ) ) ( not ( = ?auto_14479 ?auto_14485 ) ) ( not ( = ?auto_14479 ?auto_14508 ) ) ( not ( = ?auto_14480 ?auto_14485 ) ) ( not ( = ?auto_14480 ?auto_14508 ) ) ( not ( = ?auto_14481 ?auto_14485 ) ) ( not ( = ?auto_14481 ?auto_14508 ) ) ( not ( = ?auto_14482 ?auto_14485 ) ) ( not ( = ?auto_14482 ?auto_14508 ) ) ( not ( = ?auto_14483 ?auto_14485 ) ) ( not ( = ?auto_14483 ?auto_14508 ) ) ( not ( = ?auto_14485 ?auto_14521 ) ) ( not ( = ?auto_14485 ?auto_14510 ) ) ( not ( = ?auto_14485 ?auto_14511 ) ) ( not ( = ?auto_14485 ?auto_14506 ) ) ( not ( = ?auto_14485 ?auto_14516 ) ) ( not ( = ?auto_14485 ?auto_14507 ) ) ( not ( = ?auto_14503 ?auto_14492 ) ) ( not ( = ?auto_14503 ?auto_14499 ) ) ( not ( = ?auto_14503 ?auto_14504 ) ) ( not ( = ?auto_14503 ?auto_14512 ) ) ( not ( = ?auto_14503 ?auto_14509 ) ) ( not ( = ?auto_14503 ?auto_14515 ) ) ( not ( = ?auto_14513 ?auto_14491 ) ) ( not ( = ?auto_14513 ?auto_14498 ) ) ( not ( = ?auto_14513 ?auto_14500 ) ) ( not ( = ?auto_14513 ?auto_14497 ) ) ( not ( = ?auto_14513 ?auto_14505 ) ) ( not ( = ?auto_14513 ?auto_14518 ) ) ( not ( = ?auto_14508 ?auto_14521 ) ) ( not ( = ?auto_14508 ?auto_14510 ) ) ( not ( = ?auto_14508 ?auto_14511 ) ) ( not ( = ?auto_14508 ?auto_14506 ) ) ( not ( = ?auto_14508 ?auto_14516 ) ) ( not ( = ?auto_14508 ?auto_14507 ) ) ( not ( = ?auto_14478 ?auto_14486 ) ) ( not ( = ?auto_14478 ?auto_14501 ) ) ( not ( = ?auto_14479 ?auto_14486 ) ) ( not ( = ?auto_14479 ?auto_14501 ) ) ( not ( = ?auto_14480 ?auto_14486 ) ) ( not ( = ?auto_14480 ?auto_14501 ) ) ( not ( = ?auto_14481 ?auto_14486 ) ) ( not ( = ?auto_14481 ?auto_14501 ) ) ( not ( = ?auto_14482 ?auto_14486 ) ) ( not ( = ?auto_14482 ?auto_14501 ) ) ( not ( = ?auto_14483 ?auto_14486 ) ) ( not ( = ?auto_14483 ?auto_14501 ) ) ( not ( = ?auto_14484 ?auto_14486 ) ) ( not ( = ?auto_14484 ?auto_14501 ) ) ( not ( = ?auto_14486 ?auto_14508 ) ) ( not ( = ?auto_14486 ?auto_14521 ) ) ( not ( = ?auto_14486 ?auto_14510 ) ) ( not ( = ?auto_14486 ?auto_14511 ) ) ( not ( = ?auto_14486 ?auto_14506 ) ) ( not ( = ?auto_14486 ?auto_14516 ) ) ( not ( = ?auto_14486 ?auto_14507 ) ) ( not ( = ?auto_14501 ?auto_14508 ) ) ( not ( = ?auto_14501 ?auto_14521 ) ) ( not ( = ?auto_14501 ?auto_14510 ) ) ( not ( = ?auto_14501 ?auto_14511 ) ) ( not ( = ?auto_14501 ?auto_14506 ) ) ( not ( = ?auto_14501 ?auto_14516 ) ) ( not ( = ?auto_14501 ?auto_14507 ) ) ( not ( = ?auto_14478 ?auto_14487 ) ) ( not ( = ?auto_14478 ?auto_14502 ) ) ( not ( = ?auto_14479 ?auto_14487 ) ) ( not ( = ?auto_14479 ?auto_14502 ) ) ( not ( = ?auto_14480 ?auto_14487 ) ) ( not ( = ?auto_14480 ?auto_14502 ) ) ( not ( = ?auto_14481 ?auto_14487 ) ) ( not ( = ?auto_14481 ?auto_14502 ) ) ( not ( = ?auto_14482 ?auto_14487 ) ) ( not ( = ?auto_14482 ?auto_14502 ) ) ( not ( = ?auto_14483 ?auto_14487 ) ) ( not ( = ?auto_14483 ?auto_14502 ) ) ( not ( = ?auto_14484 ?auto_14487 ) ) ( not ( = ?auto_14484 ?auto_14502 ) ) ( not ( = ?auto_14485 ?auto_14487 ) ) ( not ( = ?auto_14485 ?auto_14502 ) ) ( not ( = ?auto_14487 ?auto_14501 ) ) ( not ( = ?auto_14487 ?auto_14508 ) ) ( not ( = ?auto_14487 ?auto_14521 ) ) ( not ( = ?auto_14487 ?auto_14510 ) ) ( not ( = ?auto_14487 ?auto_14511 ) ) ( not ( = ?auto_14487 ?auto_14506 ) ) ( not ( = ?auto_14487 ?auto_14516 ) ) ( not ( = ?auto_14487 ?auto_14507 ) ) ( not ( = ?auto_14502 ?auto_14501 ) ) ( not ( = ?auto_14502 ?auto_14508 ) ) ( not ( = ?auto_14502 ?auto_14521 ) ) ( not ( = ?auto_14502 ?auto_14510 ) ) ( not ( = ?auto_14502 ?auto_14511 ) ) ( not ( = ?auto_14502 ?auto_14506 ) ) ( not ( = ?auto_14502 ?auto_14516 ) ) ( not ( = ?auto_14502 ?auto_14507 ) ) ( not ( = ?auto_14478 ?auto_14488 ) ) ( not ( = ?auto_14478 ?auto_14517 ) ) ( not ( = ?auto_14479 ?auto_14488 ) ) ( not ( = ?auto_14479 ?auto_14517 ) ) ( not ( = ?auto_14480 ?auto_14488 ) ) ( not ( = ?auto_14480 ?auto_14517 ) ) ( not ( = ?auto_14481 ?auto_14488 ) ) ( not ( = ?auto_14481 ?auto_14517 ) ) ( not ( = ?auto_14482 ?auto_14488 ) ) ( not ( = ?auto_14482 ?auto_14517 ) ) ( not ( = ?auto_14483 ?auto_14488 ) ) ( not ( = ?auto_14483 ?auto_14517 ) ) ( not ( = ?auto_14484 ?auto_14488 ) ) ( not ( = ?auto_14484 ?auto_14517 ) ) ( not ( = ?auto_14485 ?auto_14488 ) ) ( not ( = ?auto_14485 ?auto_14517 ) ) ( not ( = ?auto_14486 ?auto_14488 ) ) ( not ( = ?auto_14486 ?auto_14517 ) ) ( not ( = ?auto_14488 ?auto_14502 ) ) ( not ( = ?auto_14488 ?auto_14501 ) ) ( not ( = ?auto_14488 ?auto_14508 ) ) ( not ( = ?auto_14488 ?auto_14521 ) ) ( not ( = ?auto_14488 ?auto_14510 ) ) ( not ( = ?auto_14488 ?auto_14511 ) ) ( not ( = ?auto_14488 ?auto_14506 ) ) ( not ( = ?auto_14488 ?auto_14516 ) ) ( not ( = ?auto_14488 ?auto_14507 ) ) ( not ( = ?auto_14517 ?auto_14502 ) ) ( not ( = ?auto_14517 ?auto_14501 ) ) ( not ( = ?auto_14517 ?auto_14508 ) ) ( not ( = ?auto_14517 ?auto_14521 ) ) ( not ( = ?auto_14517 ?auto_14510 ) ) ( not ( = ?auto_14517 ?auto_14511 ) ) ( not ( = ?auto_14517 ?auto_14506 ) ) ( not ( = ?auto_14517 ?auto_14516 ) ) ( not ( = ?auto_14517 ?auto_14507 ) ) ( not ( = ?auto_14478 ?auto_14489 ) ) ( not ( = ?auto_14478 ?auto_14514 ) ) ( not ( = ?auto_14479 ?auto_14489 ) ) ( not ( = ?auto_14479 ?auto_14514 ) ) ( not ( = ?auto_14480 ?auto_14489 ) ) ( not ( = ?auto_14480 ?auto_14514 ) ) ( not ( = ?auto_14481 ?auto_14489 ) ) ( not ( = ?auto_14481 ?auto_14514 ) ) ( not ( = ?auto_14482 ?auto_14489 ) ) ( not ( = ?auto_14482 ?auto_14514 ) ) ( not ( = ?auto_14483 ?auto_14489 ) ) ( not ( = ?auto_14483 ?auto_14514 ) ) ( not ( = ?auto_14484 ?auto_14489 ) ) ( not ( = ?auto_14484 ?auto_14514 ) ) ( not ( = ?auto_14485 ?auto_14489 ) ) ( not ( = ?auto_14485 ?auto_14514 ) ) ( not ( = ?auto_14486 ?auto_14489 ) ) ( not ( = ?auto_14486 ?auto_14514 ) ) ( not ( = ?auto_14487 ?auto_14489 ) ) ( not ( = ?auto_14487 ?auto_14514 ) ) ( not ( = ?auto_14489 ?auto_14517 ) ) ( not ( = ?auto_14489 ?auto_14502 ) ) ( not ( = ?auto_14489 ?auto_14501 ) ) ( not ( = ?auto_14489 ?auto_14508 ) ) ( not ( = ?auto_14489 ?auto_14521 ) ) ( not ( = ?auto_14489 ?auto_14510 ) ) ( not ( = ?auto_14489 ?auto_14511 ) ) ( not ( = ?auto_14489 ?auto_14506 ) ) ( not ( = ?auto_14489 ?auto_14516 ) ) ( not ( = ?auto_14489 ?auto_14507 ) ) ( not ( = ?auto_14519 ?auto_14509 ) ) ( not ( = ?auto_14519 ?auto_14503 ) ) ( not ( = ?auto_14519 ?auto_14515 ) ) ( not ( = ?auto_14519 ?auto_14492 ) ) ( not ( = ?auto_14519 ?auto_14499 ) ) ( not ( = ?auto_14519 ?auto_14504 ) ) ( not ( = ?auto_14519 ?auto_14512 ) ) ( not ( = ?auto_14520 ?auto_14505 ) ) ( not ( = ?auto_14520 ?auto_14513 ) ) ( not ( = ?auto_14520 ?auto_14518 ) ) ( not ( = ?auto_14520 ?auto_14491 ) ) ( not ( = ?auto_14520 ?auto_14498 ) ) ( not ( = ?auto_14520 ?auto_14500 ) ) ( not ( = ?auto_14520 ?auto_14497 ) ) ( not ( = ?auto_14514 ?auto_14517 ) ) ( not ( = ?auto_14514 ?auto_14502 ) ) ( not ( = ?auto_14514 ?auto_14501 ) ) ( not ( = ?auto_14514 ?auto_14508 ) ) ( not ( = ?auto_14514 ?auto_14521 ) ) ( not ( = ?auto_14514 ?auto_14510 ) ) ( not ( = ?auto_14514 ?auto_14511 ) ) ( not ( = ?auto_14514 ?auto_14506 ) ) ( not ( = ?auto_14514 ?auto_14516 ) ) ( not ( = ?auto_14514 ?auto_14507 ) ) ( not ( = ?auto_14478 ?auto_14490 ) ) ( not ( = ?auto_14478 ?auto_14493 ) ) ( not ( = ?auto_14479 ?auto_14490 ) ) ( not ( = ?auto_14479 ?auto_14493 ) ) ( not ( = ?auto_14480 ?auto_14490 ) ) ( not ( = ?auto_14480 ?auto_14493 ) ) ( not ( = ?auto_14481 ?auto_14490 ) ) ( not ( = ?auto_14481 ?auto_14493 ) ) ( not ( = ?auto_14482 ?auto_14490 ) ) ( not ( = ?auto_14482 ?auto_14493 ) ) ( not ( = ?auto_14483 ?auto_14490 ) ) ( not ( = ?auto_14483 ?auto_14493 ) ) ( not ( = ?auto_14484 ?auto_14490 ) ) ( not ( = ?auto_14484 ?auto_14493 ) ) ( not ( = ?auto_14485 ?auto_14490 ) ) ( not ( = ?auto_14485 ?auto_14493 ) ) ( not ( = ?auto_14486 ?auto_14490 ) ) ( not ( = ?auto_14486 ?auto_14493 ) ) ( not ( = ?auto_14487 ?auto_14490 ) ) ( not ( = ?auto_14487 ?auto_14493 ) ) ( not ( = ?auto_14488 ?auto_14490 ) ) ( not ( = ?auto_14488 ?auto_14493 ) ) ( not ( = ?auto_14490 ?auto_14514 ) ) ( not ( = ?auto_14490 ?auto_14517 ) ) ( not ( = ?auto_14490 ?auto_14502 ) ) ( not ( = ?auto_14490 ?auto_14501 ) ) ( not ( = ?auto_14490 ?auto_14508 ) ) ( not ( = ?auto_14490 ?auto_14521 ) ) ( not ( = ?auto_14490 ?auto_14510 ) ) ( not ( = ?auto_14490 ?auto_14511 ) ) ( not ( = ?auto_14490 ?auto_14506 ) ) ( not ( = ?auto_14490 ?auto_14516 ) ) ( not ( = ?auto_14490 ?auto_14507 ) ) ( not ( = ?auto_14493 ?auto_14514 ) ) ( not ( = ?auto_14493 ?auto_14517 ) ) ( not ( = ?auto_14493 ?auto_14502 ) ) ( not ( = ?auto_14493 ?auto_14501 ) ) ( not ( = ?auto_14493 ?auto_14508 ) ) ( not ( = ?auto_14493 ?auto_14521 ) ) ( not ( = ?auto_14493 ?auto_14510 ) ) ( not ( = ?auto_14493 ?auto_14511 ) ) ( not ( = ?auto_14493 ?auto_14506 ) ) ( not ( = ?auto_14493 ?auto_14516 ) ) ( not ( = ?auto_14493 ?auto_14507 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_14478 ?auto_14479 ?auto_14480 ?auto_14481 ?auto_14482 ?auto_14483 ?auto_14484 ?auto_14485 ?auto_14486 ?auto_14487 ?auto_14488 ?auto_14489 )
      ( MAKE-1CRATE ?auto_14489 ?auto_14490 )
      ( MAKE-12CRATE-VERIFY ?auto_14478 ?auto_14479 ?auto_14480 ?auto_14481 ?auto_14482 ?auto_14483 ?auto_14484 ?auto_14485 ?auto_14486 ?auto_14487 ?auto_14488 ?auto_14489 ?auto_14490 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_14546 - SURFACE
      ?auto_14547 - SURFACE
      ?auto_14548 - SURFACE
      ?auto_14549 - SURFACE
      ?auto_14550 - SURFACE
      ?auto_14551 - SURFACE
      ?auto_14552 - SURFACE
      ?auto_14553 - SURFACE
      ?auto_14554 - SURFACE
      ?auto_14555 - SURFACE
      ?auto_14556 - SURFACE
      ?auto_14557 - SURFACE
      ?auto_14558 - SURFACE
      ?auto_14559 - SURFACE
    )
    :vars
    (
      ?auto_14561 - HOIST
      ?auto_14563 - PLACE
      ?auto_14564 - PLACE
      ?auto_14560 - HOIST
      ?auto_14562 - SURFACE
      ?auto_14574 - SURFACE
      ?auto_14585 - PLACE
      ?auto_14583 - HOIST
      ?auto_14573 - SURFACE
      ?auto_14570 - PLACE
      ?auto_14566 - HOIST
      ?auto_14571 - SURFACE
      ?auto_14569 - PLACE
      ?auto_14577 - HOIST
      ?auto_14587 - SURFACE
      ?auto_14581 - PLACE
      ?auto_14579 - HOIST
      ?auto_14584 - SURFACE
      ?auto_14591 - SURFACE
      ?auto_14586 - SURFACE
      ?auto_14588 - PLACE
      ?auto_14567 - HOIST
      ?auto_14582 - SURFACE
      ?auto_14576 - PLACE
      ?auto_14590 - HOIST
      ?auto_14575 - SURFACE
      ?auto_14572 - PLACE
      ?auto_14580 - HOIST
      ?auto_14589 - SURFACE
      ?auto_14568 - SURFACE
      ?auto_14578 - SURFACE
      ?auto_14565 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14561 ?auto_14563 ) ( IS-CRATE ?auto_14559 ) ( not ( = ?auto_14564 ?auto_14563 ) ) ( HOIST-AT ?auto_14560 ?auto_14564 ) ( SURFACE-AT ?auto_14559 ?auto_14564 ) ( ON ?auto_14559 ?auto_14562 ) ( CLEAR ?auto_14559 ) ( not ( = ?auto_14558 ?auto_14559 ) ) ( not ( = ?auto_14558 ?auto_14562 ) ) ( not ( = ?auto_14559 ?auto_14562 ) ) ( not ( = ?auto_14561 ?auto_14560 ) ) ( IS-CRATE ?auto_14558 ) ( SURFACE-AT ?auto_14558 ?auto_14564 ) ( ON ?auto_14558 ?auto_14574 ) ( CLEAR ?auto_14558 ) ( not ( = ?auto_14557 ?auto_14558 ) ) ( not ( = ?auto_14557 ?auto_14574 ) ) ( not ( = ?auto_14558 ?auto_14574 ) ) ( IS-CRATE ?auto_14557 ) ( not ( = ?auto_14585 ?auto_14563 ) ) ( HOIST-AT ?auto_14583 ?auto_14585 ) ( AVAILABLE ?auto_14583 ) ( SURFACE-AT ?auto_14557 ?auto_14585 ) ( ON ?auto_14557 ?auto_14573 ) ( CLEAR ?auto_14557 ) ( not ( = ?auto_14556 ?auto_14557 ) ) ( not ( = ?auto_14556 ?auto_14573 ) ) ( not ( = ?auto_14557 ?auto_14573 ) ) ( not ( = ?auto_14561 ?auto_14583 ) ) ( IS-CRATE ?auto_14556 ) ( not ( = ?auto_14570 ?auto_14563 ) ) ( HOIST-AT ?auto_14566 ?auto_14570 ) ( SURFACE-AT ?auto_14556 ?auto_14570 ) ( ON ?auto_14556 ?auto_14571 ) ( CLEAR ?auto_14556 ) ( not ( = ?auto_14555 ?auto_14556 ) ) ( not ( = ?auto_14555 ?auto_14571 ) ) ( not ( = ?auto_14556 ?auto_14571 ) ) ( not ( = ?auto_14561 ?auto_14566 ) ) ( IS-CRATE ?auto_14555 ) ( not ( = ?auto_14569 ?auto_14563 ) ) ( HOIST-AT ?auto_14577 ?auto_14569 ) ( SURFACE-AT ?auto_14555 ?auto_14569 ) ( ON ?auto_14555 ?auto_14587 ) ( CLEAR ?auto_14555 ) ( not ( = ?auto_14554 ?auto_14555 ) ) ( not ( = ?auto_14554 ?auto_14587 ) ) ( not ( = ?auto_14555 ?auto_14587 ) ) ( not ( = ?auto_14561 ?auto_14577 ) ) ( IS-CRATE ?auto_14554 ) ( not ( = ?auto_14581 ?auto_14563 ) ) ( HOIST-AT ?auto_14579 ?auto_14581 ) ( SURFACE-AT ?auto_14554 ?auto_14581 ) ( ON ?auto_14554 ?auto_14584 ) ( CLEAR ?auto_14554 ) ( not ( = ?auto_14553 ?auto_14554 ) ) ( not ( = ?auto_14553 ?auto_14584 ) ) ( not ( = ?auto_14554 ?auto_14584 ) ) ( not ( = ?auto_14561 ?auto_14579 ) ) ( IS-CRATE ?auto_14553 ) ( AVAILABLE ?auto_14577 ) ( SURFACE-AT ?auto_14553 ?auto_14569 ) ( ON ?auto_14553 ?auto_14591 ) ( CLEAR ?auto_14553 ) ( not ( = ?auto_14552 ?auto_14553 ) ) ( not ( = ?auto_14552 ?auto_14591 ) ) ( not ( = ?auto_14553 ?auto_14591 ) ) ( IS-CRATE ?auto_14552 ) ( AVAILABLE ?auto_14560 ) ( SURFACE-AT ?auto_14552 ?auto_14564 ) ( ON ?auto_14552 ?auto_14586 ) ( CLEAR ?auto_14552 ) ( not ( = ?auto_14551 ?auto_14552 ) ) ( not ( = ?auto_14551 ?auto_14586 ) ) ( not ( = ?auto_14552 ?auto_14586 ) ) ( IS-CRATE ?auto_14551 ) ( not ( = ?auto_14588 ?auto_14563 ) ) ( HOIST-AT ?auto_14567 ?auto_14588 ) ( AVAILABLE ?auto_14567 ) ( SURFACE-AT ?auto_14551 ?auto_14588 ) ( ON ?auto_14551 ?auto_14582 ) ( CLEAR ?auto_14551 ) ( not ( = ?auto_14550 ?auto_14551 ) ) ( not ( = ?auto_14550 ?auto_14582 ) ) ( not ( = ?auto_14551 ?auto_14582 ) ) ( not ( = ?auto_14561 ?auto_14567 ) ) ( IS-CRATE ?auto_14550 ) ( not ( = ?auto_14576 ?auto_14563 ) ) ( HOIST-AT ?auto_14590 ?auto_14576 ) ( AVAILABLE ?auto_14590 ) ( SURFACE-AT ?auto_14550 ?auto_14576 ) ( ON ?auto_14550 ?auto_14575 ) ( CLEAR ?auto_14550 ) ( not ( = ?auto_14549 ?auto_14550 ) ) ( not ( = ?auto_14549 ?auto_14575 ) ) ( not ( = ?auto_14550 ?auto_14575 ) ) ( not ( = ?auto_14561 ?auto_14590 ) ) ( IS-CRATE ?auto_14549 ) ( not ( = ?auto_14572 ?auto_14563 ) ) ( HOIST-AT ?auto_14580 ?auto_14572 ) ( AVAILABLE ?auto_14580 ) ( SURFACE-AT ?auto_14549 ?auto_14572 ) ( ON ?auto_14549 ?auto_14589 ) ( CLEAR ?auto_14549 ) ( not ( = ?auto_14548 ?auto_14549 ) ) ( not ( = ?auto_14548 ?auto_14589 ) ) ( not ( = ?auto_14549 ?auto_14589 ) ) ( not ( = ?auto_14561 ?auto_14580 ) ) ( IS-CRATE ?auto_14548 ) ( AVAILABLE ?auto_14566 ) ( SURFACE-AT ?auto_14548 ?auto_14570 ) ( ON ?auto_14548 ?auto_14568 ) ( CLEAR ?auto_14548 ) ( not ( = ?auto_14547 ?auto_14548 ) ) ( not ( = ?auto_14547 ?auto_14568 ) ) ( not ( = ?auto_14548 ?auto_14568 ) ) ( SURFACE-AT ?auto_14546 ?auto_14563 ) ( CLEAR ?auto_14546 ) ( IS-CRATE ?auto_14547 ) ( AVAILABLE ?auto_14561 ) ( AVAILABLE ?auto_14579 ) ( SURFACE-AT ?auto_14547 ?auto_14581 ) ( ON ?auto_14547 ?auto_14578 ) ( CLEAR ?auto_14547 ) ( TRUCK-AT ?auto_14565 ?auto_14563 ) ( not ( = ?auto_14546 ?auto_14547 ) ) ( not ( = ?auto_14546 ?auto_14578 ) ) ( not ( = ?auto_14547 ?auto_14578 ) ) ( not ( = ?auto_14546 ?auto_14548 ) ) ( not ( = ?auto_14546 ?auto_14568 ) ) ( not ( = ?auto_14548 ?auto_14578 ) ) ( not ( = ?auto_14570 ?auto_14581 ) ) ( not ( = ?auto_14566 ?auto_14579 ) ) ( not ( = ?auto_14568 ?auto_14578 ) ) ( not ( = ?auto_14546 ?auto_14549 ) ) ( not ( = ?auto_14546 ?auto_14589 ) ) ( not ( = ?auto_14547 ?auto_14549 ) ) ( not ( = ?auto_14547 ?auto_14589 ) ) ( not ( = ?auto_14549 ?auto_14568 ) ) ( not ( = ?auto_14549 ?auto_14578 ) ) ( not ( = ?auto_14572 ?auto_14570 ) ) ( not ( = ?auto_14572 ?auto_14581 ) ) ( not ( = ?auto_14580 ?auto_14566 ) ) ( not ( = ?auto_14580 ?auto_14579 ) ) ( not ( = ?auto_14589 ?auto_14568 ) ) ( not ( = ?auto_14589 ?auto_14578 ) ) ( not ( = ?auto_14546 ?auto_14550 ) ) ( not ( = ?auto_14546 ?auto_14575 ) ) ( not ( = ?auto_14547 ?auto_14550 ) ) ( not ( = ?auto_14547 ?auto_14575 ) ) ( not ( = ?auto_14548 ?auto_14550 ) ) ( not ( = ?auto_14548 ?auto_14575 ) ) ( not ( = ?auto_14550 ?auto_14589 ) ) ( not ( = ?auto_14550 ?auto_14568 ) ) ( not ( = ?auto_14550 ?auto_14578 ) ) ( not ( = ?auto_14576 ?auto_14572 ) ) ( not ( = ?auto_14576 ?auto_14570 ) ) ( not ( = ?auto_14576 ?auto_14581 ) ) ( not ( = ?auto_14590 ?auto_14580 ) ) ( not ( = ?auto_14590 ?auto_14566 ) ) ( not ( = ?auto_14590 ?auto_14579 ) ) ( not ( = ?auto_14575 ?auto_14589 ) ) ( not ( = ?auto_14575 ?auto_14568 ) ) ( not ( = ?auto_14575 ?auto_14578 ) ) ( not ( = ?auto_14546 ?auto_14551 ) ) ( not ( = ?auto_14546 ?auto_14582 ) ) ( not ( = ?auto_14547 ?auto_14551 ) ) ( not ( = ?auto_14547 ?auto_14582 ) ) ( not ( = ?auto_14548 ?auto_14551 ) ) ( not ( = ?auto_14548 ?auto_14582 ) ) ( not ( = ?auto_14549 ?auto_14551 ) ) ( not ( = ?auto_14549 ?auto_14582 ) ) ( not ( = ?auto_14551 ?auto_14575 ) ) ( not ( = ?auto_14551 ?auto_14589 ) ) ( not ( = ?auto_14551 ?auto_14568 ) ) ( not ( = ?auto_14551 ?auto_14578 ) ) ( not ( = ?auto_14588 ?auto_14576 ) ) ( not ( = ?auto_14588 ?auto_14572 ) ) ( not ( = ?auto_14588 ?auto_14570 ) ) ( not ( = ?auto_14588 ?auto_14581 ) ) ( not ( = ?auto_14567 ?auto_14590 ) ) ( not ( = ?auto_14567 ?auto_14580 ) ) ( not ( = ?auto_14567 ?auto_14566 ) ) ( not ( = ?auto_14567 ?auto_14579 ) ) ( not ( = ?auto_14582 ?auto_14575 ) ) ( not ( = ?auto_14582 ?auto_14589 ) ) ( not ( = ?auto_14582 ?auto_14568 ) ) ( not ( = ?auto_14582 ?auto_14578 ) ) ( not ( = ?auto_14546 ?auto_14552 ) ) ( not ( = ?auto_14546 ?auto_14586 ) ) ( not ( = ?auto_14547 ?auto_14552 ) ) ( not ( = ?auto_14547 ?auto_14586 ) ) ( not ( = ?auto_14548 ?auto_14552 ) ) ( not ( = ?auto_14548 ?auto_14586 ) ) ( not ( = ?auto_14549 ?auto_14552 ) ) ( not ( = ?auto_14549 ?auto_14586 ) ) ( not ( = ?auto_14550 ?auto_14552 ) ) ( not ( = ?auto_14550 ?auto_14586 ) ) ( not ( = ?auto_14552 ?auto_14582 ) ) ( not ( = ?auto_14552 ?auto_14575 ) ) ( not ( = ?auto_14552 ?auto_14589 ) ) ( not ( = ?auto_14552 ?auto_14568 ) ) ( not ( = ?auto_14552 ?auto_14578 ) ) ( not ( = ?auto_14564 ?auto_14588 ) ) ( not ( = ?auto_14564 ?auto_14576 ) ) ( not ( = ?auto_14564 ?auto_14572 ) ) ( not ( = ?auto_14564 ?auto_14570 ) ) ( not ( = ?auto_14564 ?auto_14581 ) ) ( not ( = ?auto_14560 ?auto_14567 ) ) ( not ( = ?auto_14560 ?auto_14590 ) ) ( not ( = ?auto_14560 ?auto_14580 ) ) ( not ( = ?auto_14560 ?auto_14566 ) ) ( not ( = ?auto_14560 ?auto_14579 ) ) ( not ( = ?auto_14586 ?auto_14582 ) ) ( not ( = ?auto_14586 ?auto_14575 ) ) ( not ( = ?auto_14586 ?auto_14589 ) ) ( not ( = ?auto_14586 ?auto_14568 ) ) ( not ( = ?auto_14586 ?auto_14578 ) ) ( not ( = ?auto_14546 ?auto_14553 ) ) ( not ( = ?auto_14546 ?auto_14591 ) ) ( not ( = ?auto_14547 ?auto_14553 ) ) ( not ( = ?auto_14547 ?auto_14591 ) ) ( not ( = ?auto_14548 ?auto_14553 ) ) ( not ( = ?auto_14548 ?auto_14591 ) ) ( not ( = ?auto_14549 ?auto_14553 ) ) ( not ( = ?auto_14549 ?auto_14591 ) ) ( not ( = ?auto_14550 ?auto_14553 ) ) ( not ( = ?auto_14550 ?auto_14591 ) ) ( not ( = ?auto_14551 ?auto_14553 ) ) ( not ( = ?auto_14551 ?auto_14591 ) ) ( not ( = ?auto_14553 ?auto_14586 ) ) ( not ( = ?auto_14553 ?auto_14582 ) ) ( not ( = ?auto_14553 ?auto_14575 ) ) ( not ( = ?auto_14553 ?auto_14589 ) ) ( not ( = ?auto_14553 ?auto_14568 ) ) ( not ( = ?auto_14553 ?auto_14578 ) ) ( not ( = ?auto_14569 ?auto_14564 ) ) ( not ( = ?auto_14569 ?auto_14588 ) ) ( not ( = ?auto_14569 ?auto_14576 ) ) ( not ( = ?auto_14569 ?auto_14572 ) ) ( not ( = ?auto_14569 ?auto_14570 ) ) ( not ( = ?auto_14569 ?auto_14581 ) ) ( not ( = ?auto_14577 ?auto_14560 ) ) ( not ( = ?auto_14577 ?auto_14567 ) ) ( not ( = ?auto_14577 ?auto_14590 ) ) ( not ( = ?auto_14577 ?auto_14580 ) ) ( not ( = ?auto_14577 ?auto_14566 ) ) ( not ( = ?auto_14577 ?auto_14579 ) ) ( not ( = ?auto_14591 ?auto_14586 ) ) ( not ( = ?auto_14591 ?auto_14582 ) ) ( not ( = ?auto_14591 ?auto_14575 ) ) ( not ( = ?auto_14591 ?auto_14589 ) ) ( not ( = ?auto_14591 ?auto_14568 ) ) ( not ( = ?auto_14591 ?auto_14578 ) ) ( not ( = ?auto_14546 ?auto_14554 ) ) ( not ( = ?auto_14546 ?auto_14584 ) ) ( not ( = ?auto_14547 ?auto_14554 ) ) ( not ( = ?auto_14547 ?auto_14584 ) ) ( not ( = ?auto_14548 ?auto_14554 ) ) ( not ( = ?auto_14548 ?auto_14584 ) ) ( not ( = ?auto_14549 ?auto_14554 ) ) ( not ( = ?auto_14549 ?auto_14584 ) ) ( not ( = ?auto_14550 ?auto_14554 ) ) ( not ( = ?auto_14550 ?auto_14584 ) ) ( not ( = ?auto_14551 ?auto_14554 ) ) ( not ( = ?auto_14551 ?auto_14584 ) ) ( not ( = ?auto_14552 ?auto_14554 ) ) ( not ( = ?auto_14552 ?auto_14584 ) ) ( not ( = ?auto_14554 ?auto_14591 ) ) ( not ( = ?auto_14554 ?auto_14586 ) ) ( not ( = ?auto_14554 ?auto_14582 ) ) ( not ( = ?auto_14554 ?auto_14575 ) ) ( not ( = ?auto_14554 ?auto_14589 ) ) ( not ( = ?auto_14554 ?auto_14568 ) ) ( not ( = ?auto_14554 ?auto_14578 ) ) ( not ( = ?auto_14584 ?auto_14591 ) ) ( not ( = ?auto_14584 ?auto_14586 ) ) ( not ( = ?auto_14584 ?auto_14582 ) ) ( not ( = ?auto_14584 ?auto_14575 ) ) ( not ( = ?auto_14584 ?auto_14589 ) ) ( not ( = ?auto_14584 ?auto_14568 ) ) ( not ( = ?auto_14584 ?auto_14578 ) ) ( not ( = ?auto_14546 ?auto_14555 ) ) ( not ( = ?auto_14546 ?auto_14587 ) ) ( not ( = ?auto_14547 ?auto_14555 ) ) ( not ( = ?auto_14547 ?auto_14587 ) ) ( not ( = ?auto_14548 ?auto_14555 ) ) ( not ( = ?auto_14548 ?auto_14587 ) ) ( not ( = ?auto_14549 ?auto_14555 ) ) ( not ( = ?auto_14549 ?auto_14587 ) ) ( not ( = ?auto_14550 ?auto_14555 ) ) ( not ( = ?auto_14550 ?auto_14587 ) ) ( not ( = ?auto_14551 ?auto_14555 ) ) ( not ( = ?auto_14551 ?auto_14587 ) ) ( not ( = ?auto_14552 ?auto_14555 ) ) ( not ( = ?auto_14552 ?auto_14587 ) ) ( not ( = ?auto_14553 ?auto_14555 ) ) ( not ( = ?auto_14553 ?auto_14587 ) ) ( not ( = ?auto_14555 ?auto_14584 ) ) ( not ( = ?auto_14555 ?auto_14591 ) ) ( not ( = ?auto_14555 ?auto_14586 ) ) ( not ( = ?auto_14555 ?auto_14582 ) ) ( not ( = ?auto_14555 ?auto_14575 ) ) ( not ( = ?auto_14555 ?auto_14589 ) ) ( not ( = ?auto_14555 ?auto_14568 ) ) ( not ( = ?auto_14555 ?auto_14578 ) ) ( not ( = ?auto_14587 ?auto_14584 ) ) ( not ( = ?auto_14587 ?auto_14591 ) ) ( not ( = ?auto_14587 ?auto_14586 ) ) ( not ( = ?auto_14587 ?auto_14582 ) ) ( not ( = ?auto_14587 ?auto_14575 ) ) ( not ( = ?auto_14587 ?auto_14589 ) ) ( not ( = ?auto_14587 ?auto_14568 ) ) ( not ( = ?auto_14587 ?auto_14578 ) ) ( not ( = ?auto_14546 ?auto_14556 ) ) ( not ( = ?auto_14546 ?auto_14571 ) ) ( not ( = ?auto_14547 ?auto_14556 ) ) ( not ( = ?auto_14547 ?auto_14571 ) ) ( not ( = ?auto_14548 ?auto_14556 ) ) ( not ( = ?auto_14548 ?auto_14571 ) ) ( not ( = ?auto_14549 ?auto_14556 ) ) ( not ( = ?auto_14549 ?auto_14571 ) ) ( not ( = ?auto_14550 ?auto_14556 ) ) ( not ( = ?auto_14550 ?auto_14571 ) ) ( not ( = ?auto_14551 ?auto_14556 ) ) ( not ( = ?auto_14551 ?auto_14571 ) ) ( not ( = ?auto_14552 ?auto_14556 ) ) ( not ( = ?auto_14552 ?auto_14571 ) ) ( not ( = ?auto_14553 ?auto_14556 ) ) ( not ( = ?auto_14553 ?auto_14571 ) ) ( not ( = ?auto_14554 ?auto_14556 ) ) ( not ( = ?auto_14554 ?auto_14571 ) ) ( not ( = ?auto_14556 ?auto_14587 ) ) ( not ( = ?auto_14556 ?auto_14584 ) ) ( not ( = ?auto_14556 ?auto_14591 ) ) ( not ( = ?auto_14556 ?auto_14586 ) ) ( not ( = ?auto_14556 ?auto_14582 ) ) ( not ( = ?auto_14556 ?auto_14575 ) ) ( not ( = ?auto_14556 ?auto_14589 ) ) ( not ( = ?auto_14556 ?auto_14568 ) ) ( not ( = ?auto_14556 ?auto_14578 ) ) ( not ( = ?auto_14571 ?auto_14587 ) ) ( not ( = ?auto_14571 ?auto_14584 ) ) ( not ( = ?auto_14571 ?auto_14591 ) ) ( not ( = ?auto_14571 ?auto_14586 ) ) ( not ( = ?auto_14571 ?auto_14582 ) ) ( not ( = ?auto_14571 ?auto_14575 ) ) ( not ( = ?auto_14571 ?auto_14589 ) ) ( not ( = ?auto_14571 ?auto_14568 ) ) ( not ( = ?auto_14571 ?auto_14578 ) ) ( not ( = ?auto_14546 ?auto_14557 ) ) ( not ( = ?auto_14546 ?auto_14573 ) ) ( not ( = ?auto_14547 ?auto_14557 ) ) ( not ( = ?auto_14547 ?auto_14573 ) ) ( not ( = ?auto_14548 ?auto_14557 ) ) ( not ( = ?auto_14548 ?auto_14573 ) ) ( not ( = ?auto_14549 ?auto_14557 ) ) ( not ( = ?auto_14549 ?auto_14573 ) ) ( not ( = ?auto_14550 ?auto_14557 ) ) ( not ( = ?auto_14550 ?auto_14573 ) ) ( not ( = ?auto_14551 ?auto_14557 ) ) ( not ( = ?auto_14551 ?auto_14573 ) ) ( not ( = ?auto_14552 ?auto_14557 ) ) ( not ( = ?auto_14552 ?auto_14573 ) ) ( not ( = ?auto_14553 ?auto_14557 ) ) ( not ( = ?auto_14553 ?auto_14573 ) ) ( not ( = ?auto_14554 ?auto_14557 ) ) ( not ( = ?auto_14554 ?auto_14573 ) ) ( not ( = ?auto_14555 ?auto_14557 ) ) ( not ( = ?auto_14555 ?auto_14573 ) ) ( not ( = ?auto_14557 ?auto_14571 ) ) ( not ( = ?auto_14557 ?auto_14587 ) ) ( not ( = ?auto_14557 ?auto_14584 ) ) ( not ( = ?auto_14557 ?auto_14591 ) ) ( not ( = ?auto_14557 ?auto_14586 ) ) ( not ( = ?auto_14557 ?auto_14582 ) ) ( not ( = ?auto_14557 ?auto_14575 ) ) ( not ( = ?auto_14557 ?auto_14589 ) ) ( not ( = ?auto_14557 ?auto_14568 ) ) ( not ( = ?auto_14557 ?auto_14578 ) ) ( not ( = ?auto_14585 ?auto_14570 ) ) ( not ( = ?auto_14585 ?auto_14569 ) ) ( not ( = ?auto_14585 ?auto_14581 ) ) ( not ( = ?auto_14585 ?auto_14564 ) ) ( not ( = ?auto_14585 ?auto_14588 ) ) ( not ( = ?auto_14585 ?auto_14576 ) ) ( not ( = ?auto_14585 ?auto_14572 ) ) ( not ( = ?auto_14583 ?auto_14566 ) ) ( not ( = ?auto_14583 ?auto_14577 ) ) ( not ( = ?auto_14583 ?auto_14579 ) ) ( not ( = ?auto_14583 ?auto_14560 ) ) ( not ( = ?auto_14583 ?auto_14567 ) ) ( not ( = ?auto_14583 ?auto_14590 ) ) ( not ( = ?auto_14583 ?auto_14580 ) ) ( not ( = ?auto_14573 ?auto_14571 ) ) ( not ( = ?auto_14573 ?auto_14587 ) ) ( not ( = ?auto_14573 ?auto_14584 ) ) ( not ( = ?auto_14573 ?auto_14591 ) ) ( not ( = ?auto_14573 ?auto_14586 ) ) ( not ( = ?auto_14573 ?auto_14582 ) ) ( not ( = ?auto_14573 ?auto_14575 ) ) ( not ( = ?auto_14573 ?auto_14589 ) ) ( not ( = ?auto_14573 ?auto_14568 ) ) ( not ( = ?auto_14573 ?auto_14578 ) ) ( not ( = ?auto_14546 ?auto_14558 ) ) ( not ( = ?auto_14546 ?auto_14574 ) ) ( not ( = ?auto_14547 ?auto_14558 ) ) ( not ( = ?auto_14547 ?auto_14574 ) ) ( not ( = ?auto_14548 ?auto_14558 ) ) ( not ( = ?auto_14548 ?auto_14574 ) ) ( not ( = ?auto_14549 ?auto_14558 ) ) ( not ( = ?auto_14549 ?auto_14574 ) ) ( not ( = ?auto_14550 ?auto_14558 ) ) ( not ( = ?auto_14550 ?auto_14574 ) ) ( not ( = ?auto_14551 ?auto_14558 ) ) ( not ( = ?auto_14551 ?auto_14574 ) ) ( not ( = ?auto_14552 ?auto_14558 ) ) ( not ( = ?auto_14552 ?auto_14574 ) ) ( not ( = ?auto_14553 ?auto_14558 ) ) ( not ( = ?auto_14553 ?auto_14574 ) ) ( not ( = ?auto_14554 ?auto_14558 ) ) ( not ( = ?auto_14554 ?auto_14574 ) ) ( not ( = ?auto_14555 ?auto_14558 ) ) ( not ( = ?auto_14555 ?auto_14574 ) ) ( not ( = ?auto_14556 ?auto_14558 ) ) ( not ( = ?auto_14556 ?auto_14574 ) ) ( not ( = ?auto_14558 ?auto_14573 ) ) ( not ( = ?auto_14558 ?auto_14571 ) ) ( not ( = ?auto_14558 ?auto_14587 ) ) ( not ( = ?auto_14558 ?auto_14584 ) ) ( not ( = ?auto_14558 ?auto_14591 ) ) ( not ( = ?auto_14558 ?auto_14586 ) ) ( not ( = ?auto_14558 ?auto_14582 ) ) ( not ( = ?auto_14558 ?auto_14575 ) ) ( not ( = ?auto_14558 ?auto_14589 ) ) ( not ( = ?auto_14558 ?auto_14568 ) ) ( not ( = ?auto_14558 ?auto_14578 ) ) ( not ( = ?auto_14574 ?auto_14573 ) ) ( not ( = ?auto_14574 ?auto_14571 ) ) ( not ( = ?auto_14574 ?auto_14587 ) ) ( not ( = ?auto_14574 ?auto_14584 ) ) ( not ( = ?auto_14574 ?auto_14591 ) ) ( not ( = ?auto_14574 ?auto_14586 ) ) ( not ( = ?auto_14574 ?auto_14582 ) ) ( not ( = ?auto_14574 ?auto_14575 ) ) ( not ( = ?auto_14574 ?auto_14589 ) ) ( not ( = ?auto_14574 ?auto_14568 ) ) ( not ( = ?auto_14574 ?auto_14578 ) ) ( not ( = ?auto_14546 ?auto_14559 ) ) ( not ( = ?auto_14546 ?auto_14562 ) ) ( not ( = ?auto_14547 ?auto_14559 ) ) ( not ( = ?auto_14547 ?auto_14562 ) ) ( not ( = ?auto_14548 ?auto_14559 ) ) ( not ( = ?auto_14548 ?auto_14562 ) ) ( not ( = ?auto_14549 ?auto_14559 ) ) ( not ( = ?auto_14549 ?auto_14562 ) ) ( not ( = ?auto_14550 ?auto_14559 ) ) ( not ( = ?auto_14550 ?auto_14562 ) ) ( not ( = ?auto_14551 ?auto_14559 ) ) ( not ( = ?auto_14551 ?auto_14562 ) ) ( not ( = ?auto_14552 ?auto_14559 ) ) ( not ( = ?auto_14552 ?auto_14562 ) ) ( not ( = ?auto_14553 ?auto_14559 ) ) ( not ( = ?auto_14553 ?auto_14562 ) ) ( not ( = ?auto_14554 ?auto_14559 ) ) ( not ( = ?auto_14554 ?auto_14562 ) ) ( not ( = ?auto_14555 ?auto_14559 ) ) ( not ( = ?auto_14555 ?auto_14562 ) ) ( not ( = ?auto_14556 ?auto_14559 ) ) ( not ( = ?auto_14556 ?auto_14562 ) ) ( not ( = ?auto_14557 ?auto_14559 ) ) ( not ( = ?auto_14557 ?auto_14562 ) ) ( not ( = ?auto_14559 ?auto_14574 ) ) ( not ( = ?auto_14559 ?auto_14573 ) ) ( not ( = ?auto_14559 ?auto_14571 ) ) ( not ( = ?auto_14559 ?auto_14587 ) ) ( not ( = ?auto_14559 ?auto_14584 ) ) ( not ( = ?auto_14559 ?auto_14591 ) ) ( not ( = ?auto_14559 ?auto_14586 ) ) ( not ( = ?auto_14559 ?auto_14582 ) ) ( not ( = ?auto_14559 ?auto_14575 ) ) ( not ( = ?auto_14559 ?auto_14589 ) ) ( not ( = ?auto_14559 ?auto_14568 ) ) ( not ( = ?auto_14559 ?auto_14578 ) ) ( not ( = ?auto_14562 ?auto_14574 ) ) ( not ( = ?auto_14562 ?auto_14573 ) ) ( not ( = ?auto_14562 ?auto_14571 ) ) ( not ( = ?auto_14562 ?auto_14587 ) ) ( not ( = ?auto_14562 ?auto_14584 ) ) ( not ( = ?auto_14562 ?auto_14591 ) ) ( not ( = ?auto_14562 ?auto_14586 ) ) ( not ( = ?auto_14562 ?auto_14582 ) ) ( not ( = ?auto_14562 ?auto_14575 ) ) ( not ( = ?auto_14562 ?auto_14589 ) ) ( not ( = ?auto_14562 ?auto_14568 ) ) ( not ( = ?auto_14562 ?auto_14578 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_14546 ?auto_14547 ?auto_14548 ?auto_14549 ?auto_14550 ?auto_14551 ?auto_14552 ?auto_14553 ?auto_14554 ?auto_14555 ?auto_14556 ?auto_14557 ?auto_14558 )
      ( MAKE-1CRATE ?auto_14558 ?auto_14559 )
      ( MAKE-13CRATE-VERIFY ?auto_14546 ?auto_14547 ?auto_14548 ?auto_14549 ?auto_14550 ?auto_14551 ?auto_14552 ?auto_14553 ?auto_14554 ?auto_14555 ?auto_14556 ?auto_14557 ?auto_14558 ?auto_14559 ) )
  )

)

