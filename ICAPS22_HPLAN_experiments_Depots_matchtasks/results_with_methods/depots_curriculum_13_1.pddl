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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14000 - SURFACE
      ?auto_14001 - SURFACE
    )
    :vars
    (
      ?auto_14002 - HOIST
      ?auto_14003 - PLACE
      ?auto_14005 - PLACE
      ?auto_14006 - HOIST
      ?auto_14007 - SURFACE
      ?auto_14004 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14002 ?auto_14003 ) ( SURFACE-AT ?auto_14000 ?auto_14003 ) ( CLEAR ?auto_14000 ) ( IS-CRATE ?auto_14001 ) ( AVAILABLE ?auto_14002 ) ( not ( = ?auto_14005 ?auto_14003 ) ) ( HOIST-AT ?auto_14006 ?auto_14005 ) ( AVAILABLE ?auto_14006 ) ( SURFACE-AT ?auto_14001 ?auto_14005 ) ( ON ?auto_14001 ?auto_14007 ) ( CLEAR ?auto_14001 ) ( TRUCK-AT ?auto_14004 ?auto_14003 ) ( not ( = ?auto_14000 ?auto_14001 ) ) ( not ( = ?auto_14000 ?auto_14007 ) ) ( not ( = ?auto_14001 ?auto_14007 ) ) ( not ( = ?auto_14002 ?auto_14006 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14004 ?auto_14003 ?auto_14005 )
      ( !LIFT ?auto_14006 ?auto_14001 ?auto_14007 ?auto_14005 )
      ( !LOAD ?auto_14006 ?auto_14001 ?auto_14004 ?auto_14005 )
      ( !DRIVE ?auto_14004 ?auto_14005 ?auto_14003 )
      ( !UNLOAD ?auto_14002 ?auto_14001 ?auto_14004 ?auto_14003 )
      ( !DROP ?auto_14002 ?auto_14001 ?auto_14000 ?auto_14003 )
      ( MAKE-1CRATE-VERIFY ?auto_14000 ?auto_14001 ) )
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
      ?auto_14014 - PLACE
      ?auto_14017 - PLACE
      ?auto_14015 - HOIST
      ?auto_14016 - SURFACE
      ?auto_14020 - PLACE
      ?auto_14022 - HOIST
      ?auto_14021 - SURFACE
      ?auto_14018 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14019 ?auto_14014 ) ( IS-CRATE ?auto_14013 ) ( not ( = ?auto_14017 ?auto_14014 ) ) ( HOIST-AT ?auto_14015 ?auto_14017 ) ( AVAILABLE ?auto_14015 ) ( SURFACE-AT ?auto_14013 ?auto_14017 ) ( ON ?auto_14013 ?auto_14016 ) ( CLEAR ?auto_14013 ) ( not ( = ?auto_14012 ?auto_14013 ) ) ( not ( = ?auto_14012 ?auto_14016 ) ) ( not ( = ?auto_14013 ?auto_14016 ) ) ( not ( = ?auto_14019 ?auto_14015 ) ) ( SURFACE-AT ?auto_14011 ?auto_14014 ) ( CLEAR ?auto_14011 ) ( IS-CRATE ?auto_14012 ) ( AVAILABLE ?auto_14019 ) ( not ( = ?auto_14020 ?auto_14014 ) ) ( HOIST-AT ?auto_14022 ?auto_14020 ) ( AVAILABLE ?auto_14022 ) ( SURFACE-AT ?auto_14012 ?auto_14020 ) ( ON ?auto_14012 ?auto_14021 ) ( CLEAR ?auto_14012 ) ( TRUCK-AT ?auto_14018 ?auto_14014 ) ( not ( = ?auto_14011 ?auto_14012 ) ) ( not ( = ?auto_14011 ?auto_14021 ) ) ( not ( = ?auto_14012 ?auto_14021 ) ) ( not ( = ?auto_14019 ?auto_14022 ) ) ( not ( = ?auto_14011 ?auto_14013 ) ) ( not ( = ?auto_14011 ?auto_14016 ) ) ( not ( = ?auto_14013 ?auto_14021 ) ) ( not ( = ?auto_14017 ?auto_14020 ) ) ( not ( = ?auto_14015 ?auto_14022 ) ) ( not ( = ?auto_14016 ?auto_14021 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14011 ?auto_14012 )
      ( MAKE-1CRATE ?auto_14012 ?auto_14013 )
      ( MAKE-2CRATE-VERIFY ?auto_14011 ?auto_14012 ?auto_14013 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14025 - SURFACE
      ?auto_14026 - SURFACE
    )
    :vars
    (
      ?auto_14027 - HOIST
      ?auto_14028 - PLACE
      ?auto_14030 - PLACE
      ?auto_14031 - HOIST
      ?auto_14032 - SURFACE
      ?auto_14029 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14027 ?auto_14028 ) ( SURFACE-AT ?auto_14025 ?auto_14028 ) ( CLEAR ?auto_14025 ) ( IS-CRATE ?auto_14026 ) ( AVAILABLE ?auto_14027 ) ( not ( = ?auto_14030 ?auto_14028 ) ) ( HOIST-AT ?auto_14031 ?auto_14030 ) ( AVAILABLE ?auto_14031 ) ( SURFACE-AT ?auto_14026 ?auto_14030 ) ( ON ?auto_14026 ?auto_14032 ) ( CLEAR ?auto_14026 ) ( TRUCK-AT ?auto_14029 ?auto_14028 ) ( not ( = ?auto_14025 ?auto_14026 ) ) ( not ( = ?auto_14025 ?auto_14032 ) ) ( not ( = ?auto_14026 ?auto_14032 ) ) ( not ( = ?auto_14027 ?auto_14031 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14029 ?auto_14028 ?auto_14030 )
      ( !LIFT ?auto_14031 ?auto_14026 ?auto_14032 ?auto_14030 )
      ( !LOAD ?auto_14031 ?auto_14026 ?auto_14029 ?auto_14030 )
      ( !DRIVE ?auto_14029 ?auto_14030 ?auto_14028 )
      ( !UNLOAD ?auto_14027 ?auto_14026 ?auto_14029 ?auto_14028 )
      ( !DROP ?auto_14027 ?auto_14026 ?auto_14025 ?auto_14028 )
      ( MAKE-1CRATE-VERIFY ?auto_14025 ?auto_14026 ) )
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
      ?auto_14041 - HOIST
      ?auto_14045 - PLACE
      ?auto_14044 - PLACE
      ?auto_14043 - HOIST
      ?auto_14046 - SURFACE
      ?auto_14052 - PLACE
      ?auto_14049 - HOIST
      ?auto_14048 - SURFACE
      ?auto_14051 - PLACE
      ?auto_14047 - HOIST
      ?auto_14050 - SURFACE
      ?auto_14042 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14041 ?auto_14045 ) ( IS-CRATE ?auto_14040 ) ( not ( = ?auto_14044 ?auto_14045 ) ) ( HOIST-AT ?auto_14043 ?auto_14044 ) ( AVAILABLE ?auto_14043 ) ( SURFACE-AT ?auto_14040 ?auto_14044 ) ( ON ?auto_14040 ?auto_14046 ) ( CLEAR ?auto_14040 ) ( not ( = ?auto_14039 ?auto_14040 ) ) ( not ( = ?auto_14039 ?auto_14046 ) ) ( not ( = ?auto_14040 ?auto_14046 ) ) ( not ( = ?auto_14041 ?auto_14043 ) ) ( IS-CRATE ?auto_14039 ) ( not ( = ?auto_14052 ?auto_14045 ) ) ( HOIST-AT ?auto_14049 ?auto_14052 ) ( AVAILABLE ?auto_14049 ) ( SURFACE-AT ?auto_14039 ?auto_14052 ) ( ON ?auto_14039 ?auto_14048 ) ( CLEAR ?auto_14039 ) ( not ( = ?auto_14038 ?auto_14039 ) ) ( not ( = ?auto_14038 ?auto_14048 ) ) ( not ( = ?auto_14039 ?auto_14048 ) ) ( not ( = ?auto_14041 ?auto_14049 ) ) ( SURFACE-AT ?auto_14037 ?auto_14045 ) ( CLEAR ?auto_14037 ) ( IS-CRATE ?auto_14038 ) ( AVAILABLE ?auto_14041 ) ( not ( = ?auto_14051 ?auto_14045 ) ) ( HOIST-AT ?auto_14047 ?auto_14051 ) ( AVAILABLE ?auto_14047 ) ( SURFACE-AT ?auto_14038 ?auto_14051 ) ( ON ?auto_14038 ?auto_14050 ) ( CLEAR ?auto_14038 ) ( TRUCK-AT ?auto_14042 ?auto_14045 ) ( not ( = ?auto_14037 ?auto_14038 ) ) ( not ( = ?auto_14037 ?auto_14050 ) ) ( not ( = ?auto_14038 ?auto_14050 ) ) ( not ( = ?auto_14041 ?auto_14047 ) ) ( not ( = ?auto_14037 ?auto_14039 ) ) ( not ( = ?auto_14037 ?auto_14048 ) ) ( not ( = ?auto_14039 ?auto_14050 ) ) ( not ( = ?auto_14052 ?auto_14051 ) ) ( not ( = ?auto_14049 ?auto_14047 ) ) ( not ( = ?auto_14048 ?auto_14050 ) ) ( not ( = ?auto_14037 ?auto_14040 ) ) ( not ( = ?auto_14037 ?auto_14046 ) ) ( not ( = ?auto_14038 ?auto_14040 ) ) ( not ( = ?auto_14038 ?auto_14046 ) ) ( not ( = ?auto_14040 ?auto_14048 ) ) ( not ( = ?auto_14040 ?auto_14050 ) ) ( not ( = ?auto_14044 ?auto_14052 ) ) ( not ( = ?auto_14044 ?auto_14051 ) ) ( not ( = ?auto_14043 ?auto_14049 ) ) ( not ( = ?auto_14043 ?auto_14047 ) ) ( not ( = ?auto_14046 ?auto_14048 ) ) ( not ( = ?auto_14046 ?auto_14050 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14037 ?auto_14038 ?auto_14039 )
      ( MAKE-1CRATE ?auto_14039 ?auto_14040 )
      ( MAKE-3CRATE-VERIFY ?auto_14037 ?auto_14038 ?auto_14039 ?auto_14040 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14055 - SURFACE
      ?auto_14056 - SURFACE
    )
    :vars
    (
      ?auto_14057 - HOIST
      ?auto_14058 - PLACE
      ?auto_14060 - PLACE
      ?auto_14061 - HOIST
      ?auto_14062 - SURFACE
      ?auto_14059 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14057 ?auto_14058 ) ( SURFACE-AT ?auto_14055 ?auto_14058 ) ( CLEAR ?auto_14055 ) ( IS-CRATE ?auto_14056 ) ( AVAILABLE ?auto_14057 ) ( not ( = ?auto_14060 ?auto_14058 ) ) ( HOIST-AT ?auto_14061 ?auto_14060 ) ( AVAILABLE ?auto_14061 ) ( SURFACE-AT ?auto_14056 ?auto_14060 ) ( ON ?auto_14056 ?auto_14062 ) ( CLEAR ?auto_14056 ) ( TRUCK-AT ?auto_14059 ?auto_14058 ) ( not ( = ?auto_14055 ?auto_14056 ) ) ( not ( = ?auto_14055 ?auto_14062 ) ) ( not ( = ?auto_14056 ?auto_14062 ) ) ( not ( = ?auto_14057 ?auto_14061 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14059 ?auto_14058 ?auto_14060 )
      ( !LIFT ?auto_14061 ?auto_14056 ?auto_14062 ?auto_14060 )
      ( !LOAD ?auto_14061 ?auto_14056 ?auto_14059 ?auto_14060 )
      ( !DRIVE ?auto_14059 ?auto_14060 ?auto_14058 )
      ( !UNLOAD ?auto_14057 ?auto_14056 ?auto_14059 ?auto_14058 )
      ( !DROP ?auto_14057 ?auto_14056 ?auto_14055 ?auto_14058 )
      ( MAKE-1CRATE-VERIFY ?auto_14055 ?auto_14056 ) )
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
      ?auto_14073 - HOIST
      ?auto_14078 - PLACE
      ?auto_14074 - PLACE
      ?auto_14075 - HOIST
      ?auto_14076 - SURFACE
      ?auto_14087 - PLACE
      ?auto_14080 - HOIST
      ?auto_14084 - SURFACE
      ?auto_14079 - PLACE
      ?auto_14085 - HOIST
      ?auto_14086 - SURFACE
      ?auto_14082 - PLACE
      ?auto_14081 - HOIST
      ?auto_14083 - SURFACE
      ?auto_14077 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14073 ?auto_14078 ) ( IS-CRATE ?auto_14072 ) ( not ( = ?auto_14074 ?auto_14078 ) ) ( HOIST-AT ?auto_14075 ?auto_14074 ) ( AVAILABLE ?auto_14075 ) ( SURFACE-AT ?auto_14072 ?auto_14074 ) ( ON ?auto_14072 ?auto_14076 ) ( CLEAR ?auto_14072 ) ( not ( = ?auto_14071 ?auto_14072 ) ) ( not ( = ?auto_14071 ?auto_14076 ) ) ( not ( = ?auto_14072 ?auto_14076 ) ) ( not ( = ?auto_14073 ?auto_14075 ) ) ( IS-CRATE ?auto_14071 ) ( not ( = ?auto_14087 ?auto_14078 ) ) ( HOIST-AT ?auto_14080 ?auto_14087 ) ( AVAILABLE ?auto_14080 ) ( SURFACE-AT ?auto_14071 ?auto_14087 ) ( ON ?auto_14071 ?auto_14084 ) ( CLEAR ?auto_14071 ) ( not ( = ?auto_14070 ?auto_14071 ) ) ( not ( = ?auto_14070 ?auto_14084 ) ) ( not ( = ?auto_14071 ?auto_14084 ) ) ( not ( = ?auto_14073 ?auto_14080 ) ) ( IS-CRATE ?auto_14070 ) ( not ( = ?auto_14079 ?auto_14078 ) ) ( HOIST-AT ?auto_14085 ?auto_14079 ) ( AVAILABLE ?auto_14085 ) ( SURFACE-AT ?auto_14070 ?auto_14079 ) ( ON ?auto_14070 ?auto_14086 ) ( CLEAR ?auto_14070 ) ( not ( = ?auto_14069 ?auto_14070 ) ) ( not ( = ?auto_14069 ?auto_14086 ) ) ( not ( = ?auto_14070 ?auto_14086 ) ) ( not ( = ?auto_14073 ?auto_14085 ) ) ( SURFACE-AT ?auto_14068 ?auto_14078 ) ( CLEAR ?auto_14068 ) ( IS-CRATE ?auto_14069 ) ( AVAILABLE ?auto_14073 ) ( not ( = ?auto_14082 ?auto_14078 ) ) ( HOIST-AT ?auto_14081 ?auto_14082 ) ( AVAILABLE ?auto_14081 ) ( SURFACE-AT ?auto_14069 ?auto_14082 ) ( ON ?auto_14069 ?auto_14083 ) ( CLEAR ?auto_14069 ) ( TRUCK-AT ?auto_14077 ?auto_14078 ) ( not ( = ?auto_14068 ?auto_14069 ) ) ( not ( = ?auto_14068 ?auto_14083 ) ) ( not ( = ?auto_14069 ?auto_14083 ) ) ( not ( = ?auto_14073 ?auto_14081 ) ) ( not ( = ?auto_14068 ?auto_14070 ) ) ( not ( = ?auto_14068 ?auto_14086 ) ) ( not ( = ?auto_14070 ?auto_14083 ) ) ( not ( = ?auto_14079 ?auto_14082 ) ) ( not ( = ?auto_14085 ?auto_14081 ) ) ( not ( = ?auto_14086 ?auto_14083 ) ) ( not ( = ?auto_14068 ?auto_14071 ) ) ( not ( = ?auto_14068 ?auto_14084 ) ) ( not ( = ?auto_14069 ?auto_14071 ) ) ( not ( = ?auto_14069 ?auto_14084 ) ) ( not ( = ?auto_14071 ?auto_14086 ) ) ( not ( = ?auto_14071 ?auto_14083 ) ) ( not ( = ?auto_14087 ?auto_14079 ) ) ( not ( = ?auto_14087 ?auto_14082 ) ) ( not ( = ?auto_14080 ?auto_14085 ) ) ( not ( = ?auto_14080 ?auto_14081 ) ) ( not ( = ?auto_14084 ?auto_14086 ) ) ( not ( = ?auto_14084 ?auto_14083 ) ) ( not ( = ?auto_14068 ?auto_14072 ) ) ( not ( = ?auto_14068 ?auto_14076 ) ) ( not ( = ?auto_14069 ?auto_14072 ) ) ( not ( = ?auto_14069 ?auto_14076 ) ) ( not ( = ?auto_14070 ?auto_14072 ) ) ( not ( = ?auto_14070 ?auto_14076 ) ) ( not ( = ?auto_14072 ?auto_14084 ) ) ( not ( = ?auto_14072 ?auto_14086 ) ) ( not ( = ?auto_14072 ?auto_14083 ) ) ( not ( = ?auto_14074 ?auto_14087 ) ) ( not ( = ?auto_14074 ?auto_14079 ) ) ( not ( = ?auto_14074 ?auto_14082 ) ) ( not ( = ?auto_14075 ?auto_14080 ) ) ( not ( = ?auto_14075 ?auto_14085 ) ) ( not ( = ?auto_14075 ?auto_14081 ) ) ( not ( = ?auto_14076 ?auto_14084 ) ) ( not ( = ?auto_14076 ?auto_14086 ) ) ( not ( = ?auto_14076 ?auto_14083 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_14068 ?auto_14069 ?auto_14070 ?auto_14071 )
      ( MAKE-1CRATE ?auto_14071 ?auto_14072 )
      ( MAKE-4CRATE-VERIFY ?auto_14068 ?auto_14069 ?auto_14070 ?auto_14071 ?auto_14072 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14090 - SURFACE
      ?auto_14091 - SURFACE
    )
    :vars
    (
      ?auto_14092 - HOIST
      ?auto_14093 - PLACE
      ?auto_14095 - PLACE
      ?auto_14096 - HOIST
      ?auto_14097 - SURFACE
      ?auto_14094 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14092 ?auto_14093 ) ( SURFACE-AT ?auto_14090 ?auto_14093 ) ( CLEAR ?auto_14090 ) ( IS-CRATE ?auto_14091 ) ( AVAILABLE ?auto_14092 ) ( not ( = ?auto_14095 ?auto_14093 ) ) ( HOIST-AT ?auto_14096 ?auto_14095 ) ( AVAILABLE ?auto_14096 ) ( SURFACE-AT ?auto_14091 ?auto_14095 ) ( ON ?auto_14091 ?auto_14097 ) ( CLEAR ?auto_14091 ) ( TRUCK-AT ?auto_14094 ?auto_14093 ) ( not ( = ?auto_14090 ?auto_14091 ) ) ( not ( = ?auto_14090 ?auto_14097 ) ) ( not ( = ?auto_14091 ?auto_14097 ) ) ( not ( = ?auto_14092 ?auto_14096 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14094 ?auto_14093 ?auto_14095 )
      ( !LIFT ?auto_14096 ?auto_14091 ?auto_14097 ?auto_14095 )
      ( !LOAD ?auto_14096 ?auto_14091 ?auto_14094 ?auto_14095 )
      ( !DRIVE ?auto_14094 ?auto_14095 ?auto_14093 )
      ( !UNLOAD ?auto_14092 ?auto_14091 ?auto_14094 ?auto_14093 )
      ( !DROP ?auto_14092 ?auto_14091 ?auto_14090 ?auto_14093 )
      ( MAKE-1CRATE-VERIFY ?auto_14090 ?auto_14091 ) )
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
      ?auto_14110 - HOIST
      ?auto_14111 - PLACE
      ?auto_14115 - PLACE
      ?auto_14113 - HOIST
      ?auto_14114 - SURFACE
      ?auto_14124 - PLACE
      ?auto_14122 - HOIST
      ?auto_14127 - SURFACE
      ?auto_14121 - PLACE
      ?auto_14119 - HOIST
      ?auto_14116 - SURFACE
      ?auto_14118 - PLACE
      ?auto_14117 - HOIST
      ?auto_14123 - SURFACE
      ?auto_14125 - PLACE
      ?auto_14120 - HOIST
      ?auto_14126 - SURFACE
      ?auto_14112 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14110 ?auto_14111 ) ( IS-CRATE ?auto_14109 ) ( not ( = ?auto_14115 ?auto_14111 ) ) ( HOIST-AT ?auto_14113 ?auto_14115 ) ( AVAILABLE ?auto_14113 ) ( SURFACE-AT ?auto_14109 ?auto_14115 ) ( ON ?auto_14109 ?auto_14114 ) ( CLEAR ?auto_14109 ) ( not ( = ?auto_14108 ?auto_14109 ) ) ( not ( = ?auto_14108 ?auto_14114 ) ) ( not ( = ?auto_14109 ?auto_14114 ) ) ( not ( = ?auto_14110 ?auto_14113 ) ) ( IS-CRATE ?auto_14108 ) ( not ( = ?auto_14124 ?auto_14111 ) ) ( HOIST-AT ?auto_14122 ?auto_14124 ) ( AVAILABLE ?auto_14122 ) ( SURFACE-AT ?auto_14108 ?auto_14124 ) ( ON ?auto_14108 ?auto_14127 ) ( CLEAR ?auto_14108 ) ( not ( = ?auto_14107 ?auto_14108 ) ) ( not ( = ?auto_14107 ?auto_14127 ) ) ( not ( = ?auto_14108 ?auto_14127 ) ) ( not ( = ?auto_14110 ?auto_14122 ) ) ( IS-CRATE ?auto_14107 ) ( not ( = ?auto_14121 ?auto_14111 ) ) ( HOIST-AT ?auto_14119 ?auto_14121 ) ( AVAILABLE ?auto_14119 ) ( SURFACE-AT ?auto_14107 ?auto_14121 ) ( ON ?auto_14107 ?auto_14116 ) ( CLEAR ?auto_14107 ) ( not ( = ?auto_14106 ?auto_14107 ) ) ( not ( = ?auto_14106 ?auto_14116 ) ) ( not ( = ?auto_14107 ?auto_14116 ) ) ( not ( = ?auto_14110 ?auto_14119 ) ) ( IS-CRATE ?auto_14106 ) ( not ( = ?auto_14118 ?auto_14111 ) ) ( HOIST-AT ?auto_14117 ?auto_14118 ) ( AVAILABLE ?auto_14117 ) ( SURFACE-AT ?auto_14106 ?auto_14118 ) ( ON ?auto_14106 ?auto_14123 ) ( CLEAR ?auto_14106 ) ( not ( = ?auto_14105 ?auto_14106 ) ) ( not ( = ?auto_14105 ?auto_14123 ) ) ( not ( = ?auto_14106 ?auto_14123 ) ) ( not ( = ?auto_14110 ?auto_14117 ) ) ( SURFACE-AT ?auto_14104 ?auto_14111 ) ( CLEAR ?auto_14104 ) ( IS-CRATE ?auto_14105 ) ( AVAILABLE ?auto_14110 ) ( not ( = ?auto_14125 ?auto_14111 ) ) ( HOIST-AT ?auto_14120 ?auto_14125 ) ( AVAILABLE ?auto_14120 ) ( SURFACE-AT ?auto_14105 ?auto_14125 ) ( ON ?auto_14105 ?auto_14126 ) ( CLEAR ?auto_14105 ) ( TRUCK-AT ?auto_14112 ?auto_14111 ) ( not ( = ?auto_14104 ?auto_14105 ) ) ( not ( = ?auto_14104 ?auto_14126 ) ) ( not ( = ?auto_14105 ?auto_14126 ) ) ( not ( = ?auto_14110 ?auto_14120 ) ) ( not ( = ?auto_14104 ?auto_14106 ) ) ( not ( = ?auto_14104 ?auto_14123 ) ) ( not ( = ?auto_14106 ?auto_14126 ) ) ( not ( = ?auto_14118 ?auto_14125 ) ) ( not ( = ?auto_14117 ?auto_14120 ) ) ( not ( = ?auto_14123 ?auto_14126 ) ) ( not ( = ?auto_14104 ?auto_14107 ) ) ( not ( = ?auto_14104 ?auto_14116 ) ) ( not ( = ?auto_14105 ?auto_14107 ) ) ( not ( = ?auto_14105 ?auto_14116 ) ) ( not ( = ?auto_14107 ?auto_14123 ) ) ( not ( = ?auto_14107 ?auto_14126 ) ) ( not ( = ?auto_14121 ?auto_14118 ) ) ( not ( = ?auto_14121 ?auto_14125 ) ) ( not ( = ?auto_14119 ?auto_14117 ) ) ( not ( = ?auto_14119 ?auto_14120 ) ) ( not ( = ?auto_14116 ?auto_14123 ) ) ( not ( = ?auto_14116 ?auto_14126 ) ) ( not ( = ?auto_14104 ?auto_14108 ) ) ( not ( = ?auto_14104 ?auto_14127 ) ) ( not ( = ?auto_14105 ?auto_14108 ) ) ( not ( = ?auto_14105 ?auto_14127 ) ) ( not ( = ?auto_14106 ?auto_14108 ) ) ( not ( = ?auto_14106 ?auto_14127 ) ) ( not ( = ?auto_14108 ?auto_14116 ) ) ( not ( = ?auto_14108 ?auto_14123 ) ) ( not ( = ?auto_14108 ?auto_14126 ) ) ( not ( = ?auto_14124 ?auto_14121 ) ) ( not ( = ?auto_14124 ?auto_14118 ) ) ( not ( = ?auto_14124 ?auto_14125 ) ) ( not ( = ?auto_14122 ?auto_14119 ) ) ( not ( = ?auto_14122 ?auto_14117 ) ) ( not ( = ?auto_14122 ?auto_14120 ) ) ( not ( = ?auto_14127 ?auto_14116 ) ) ( not ( = ?auto_14127 ?auto_14123 ) ) ( not ( = ?auto_14127 ?auto_14126 ) ) ( not ( = ?auto_14104 ?auto_14109 ) ) ( not ( = ?auto_14104 ?auto_14114 ) ) ( not ( = ?auto_14105 ?auto_14109 ) ) ( not ( = ?auto_14105 ?auto_14114 ) ) ( not ( = ?auto_14106 ?auto_14109 ) ) ( not ( = ?auto_14106 ?auto_14114 ) ) ( not ( = ?auto_14107 ?auto_14109 ) ) ( not ( = ?auto_14107 ?auto_14114 ) ) ( not ( = ?auto_14109 ?auto_14127 ) ) ( not ( = ?auto_14109 ?auto_14116 ) ) ( not ( = ?auto_14109 ?auto_14123 ) ) ( not ( = ?auto_14109 ?auto_14126 ) ) ( not ( = ?auto_14115 ?auto_14124 ) ) ( not ( = ?auto_14115 ?auto_14121 ) ) ( not ( = ?auto_14115 ?auto_14118 ) ) ( not ( = ?auto_14115 ?auto_14125 ) ) ( not ( = ?auto_14113 ?auto_14122 ) ) ( not ( = ?auto_14113 ?auto_14119 ) ) ( not ( = ?auto_14113 ?auto_14117 ) ) ( not ( = ?auto_14113 ?auto_14120 ) ) ( not ( = ?auto_14114 ?auto_14127 ) ) ( not ( = ?auto_14114 ?auto_14116 ) ) ( not ( = ?auto_14114 ?auto_14123 ) ) ( not ( = ?auto_14114 ?auto_14126 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_14104 ?auto_14105 ?auto_14106 ?auto_14107 ?auto_14108 )
      ( MAKE-1CRATE ?auto_14108 ?auto_14109 )
      ( MAKE-5CRATE-VERIFY ?auto_14104 ?auto_14105 ?auto_14106 ?auto_14107 ?auto_14108 ?auto_14109 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14130 - SURFACE
      ?auto_14131 - SURFACE
    )
    :vars
    (
      ?auto_14132 - HOIST
      ?auto_14133 - PLACE
      ?auto_14135 - PLACE
      ?auto_14136 - HOIST
      ?auto_14137 - SURFACE
      ?auto_14134 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14132 ?auto_14133 ) ( SURFACE-AT ?auto_14130 ?auto_14133 ) ( CLEAR ?auto_14130 ) ( IS-CRATE ?auto_14131 ) ( AVAILABLE ?auto_14132 ) ( not ( = ?auto_14135 ?auto_14133 ) ) ( HOIST-AT ?auto_14136 ?auto_14135 ) ( AVAILABLE ?auto_14136 ) ( SURFACE-AT ?auto_14131 ?auto_14135 ) ( ON ?auto_14131 ?auto_14137 ) ( CLEAR ?auto_14131 ) ( TRUCK-AT ?auto_14134 ?auto_14133 ) ( not ( = ?auto_14130 ?auto_14131 ) ) ( not ( = ?auto_14130 ?auto_14137 ) ) ( not ( = ?auto_14131 ?auto_14137 ) ) ( not ( = ?auto_14132 ?auto_14136 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14134 ?auto_14133 ?auto_14135 )
      ( !LIFT ?auto_14136 ?auto_14131 ?auto_14137 ?auto_14135 )
      ( !LOAD ?auto_14136 ?auto_14131 ?auto_14134 ?auto_14135 )
      ( !DRIVE ?auto_14134 ?auto_14135 ?auto_14133 )
      ( !UNLOAD ?auto_14132 ?auto_14131 ?auto_14134 ?auto_14133 )
      ( !DROP ?auto_14132 ?auto_14131 ?auto_14130 ?auto_14133 )
      ( MAKE-1CRATE-VERIFY ?auto_14130 ?auto_14131 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_14145 - SURFACE
      ?auto_14146 - SURFACE
      ?auto_14147 - SURFACE
      ?auto_14148 - SURFACE
      ?auto_14149 - SURFACE
      ?auto_14151 - SURFACE
      ?auto_14150 - SURFACE
    )
    :vars
    (
      ?auto_14157 - HOIST
      ?auto_14156 - PLACE
      ?auto_14152 - PLACE
      ?auto_14154 - HOIST
      ?auto_14153 - SURFACE
      ?auto_14168 - PLACE
      ?auto_14167 - HOIST
      ?auto_14166 - SURFACE
      ?auto_14160 - PLACE
      ?auto_14170 - HOIST
      ?auto_14158 - SURFACE
      ?auto_14169 - PLACE
      ?auto_14172 - HOIST
      ?auto_14159 - SURFACE
      ?auto_14165 - PLACE
      ?auto_14164 - HOIST
      ?auto_14171 - SURFACE
      ?auto_14163 - PLACE
      ?auto_14161 - HOIST
      ?auto_14162 - SURFACE
      ?auto_14155 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14157 ?auto_14156 ) ( IS-CRATE ?auto_14150 ) ( not ( = ?auto_14152 ?auto_14156 ) ) ( HOIST-AT ?auto_14154 ?auto_14152 ) ( AVAILABLE ?auto_14154 ) ( SURFACE-AT ?auto_14150 ?auto_14152 ) ( ON ?auto_14150 ?auto_14153 ) ( CLEAR ?auto_14150 ) ( not ( = ?auto_14151 ?auto_14150 ) ) ( not ( = ?auto_14151 ?auto_14153 ) ) ( not ( = ?auto_14150 ?auto_14153 ) ) ( not ( = ?auto_14157 ?auto_14154 ) ) ( IS-CRATE ?auto_14151 ) ( not ( = ?auto_14168 ?auto_14156 ) ) ( HOIST-AT ?auto_14167 ?auto_14168 ) ( AVAILABLE ?auto_14167 ) ( SURFACE-AT ?auto_14151 ?auto_14168 ) ( ON ?auto_14151 ?auto_14166 ) ( CLEAR ?auto_14151 ) ( not ( = ?auto_14149 ?auto_14151 ) ) ( not ( = ?auto_14149 ?auto_14166 ) ) ( not ( = ?auto_14151 ?auto_14166 ) ) ( not ( = ?auto_14157 ?auto_14167 ) ) ( IS-CRATE ?auto_14149 ) ( not ( = ?auto_14160 ?auto_14156 ) ) ( HOIST-AT ?auto_14170 ?auto_14160 ) ( AVAILABLE ?auto_14170 ) ( SURFACE-AT ?auto_14149 ?auto_14160 ) ( ON ?auto_14149 ?auto_14158 ) ( CLEAR ?auto_14149 ) ( not ( = ?auto_14148 ?auto_14149 ) ) ( not ( = ?auto_14148 ?auto_14158 ) ) ( not ( = ?auto_14149 ?auto_14158 ) ) ( not ( = ?auto_14157 ?auto_14170 ) ) ( IS-CRATE ?auto_14148 ) ( not ( = ?auto_14169 ?auto_14156 ) ) ( HOIST-AT ?auto_14172 ?auto_14169 ) ( AVAILABLE ?auto_14172 ) ( SURFACE-AT ?auto_14148 ?auto_14169 ) ( ON ?auto_14148 ?auto_14159 ) ( CLEAR ?auto_14148 ) ( not ( = ?auto_14147 ?auto_14148 ) ) ( not ( = ?auto_14147 ?auto_14159 ) ) ( not ( = ?auto_14148 ?auto_14159 ) ) ( not ( = ?auto_14157 ?auto_14172 ) ) ( IS-CRATE ?auto_14147 ) ( not ( = ?auto_14165 ?auto_14156 ) ) ( HOIST-AT ?auto_14164 ?auto_14165 ) ( AVAILABLE ?auto_14164 ) ( SURFACE-AT ?auto_14147 ?auto_14165 ) ( ON ?auto_14147 ?auto_14171 ) ( CLEAR ?auto_14147 ) ( not ( = ?auto_14146 ?auto_14147 ) ) ( not ( = ?auto_14146 ?auto_14171 ) ) ( not ( = ?auto_14147 ?auto_14171 ) ) ( not ( = ?auto_14157 ?auto_14164 ) ) ( SURFACE-AT ?auto_14145 ?auto_14156 ) ( CLEAR ?auto_14145 ) ( IS-CRATE ?auto_14146 ) ( AVAILABLE ?auto_14157 ) ( not ( = ?auto_14163 ?auto_14156 ) ) ( HOIST-AT ?auto_14161 ?auto_14163 ) ( AVAILABLE ?auto_14161 ) ( SURFACE-AT ?auto_14146 ?auto_14163 ) ( ON ?auto_14146 ?auto_14162 ) ( CLEAR ?auto_14146 ) ( TRUCK-AT ?auto_14155 ?auto_14156 ) ( not ( = ?auto_14145 ?auto_14146 ) ) ( not ( = ?auto_14145 ?auto_14162 ) ) ( not ( = ?auto_14146 ?auto_14162 ) ) ( not ( = ?auto_14157 ?auto_14161 ) ) ( not ( = ?auto_14145 ?auto_14147 ) ) ( not ( = ?auto_14145 ?auto_14171 ) ) ( not ( = ?auto_14147 ?auto_14162 ) ) ( not ( = ?auto_14165 ?auto_14163 ) ) ( not ( = ?auto_14164 ?auto_14161 ) ) ( not ( = ?auto_14171 ?auto_14162 ) ) ( not ( = ?auto_14145 ?auto_14148 ) ) ( not ( = ?auto_14145 ?auto_14159 ) ) ( not ( = ?auto_14146 ?auto_14148 ) ) ( not ( = ?auto_14146 ?auto_14159 ) ) ( not ( = ?auto_14148 ?auto_14171 ) ) ( not ( = ?auto_14148 ?auto_14162 ) ) ( not ( = ?auto_14169 ?auto_14165 ) ) ( not ( = ?auto_14169 ?auto_14163 ) ) ( not ( = ?auto_14172 ?auto_14164 ) ) ( not ( = ?auto_14172 ?auto_14161 ) ) ( not ( = ?auto_14159 ?auto_14171 ) ) ( not ( = ?auto_14159 ?auto_14162 ) ) ( not ( = ?auto_14145 ?auto_14149 ) ) ( not ( = ?auto_14145 ?auto_14158 ) ) ( not ( = ?auto_14146 ?auto_14149 ) ) ( not ( = ?auto_14146 ?auto_14158 ) ) ( not ( = ?auto_14147 ?auto_14149 ) ) ( not ( = ?auto_14147 ?auto_14158 ) ) ( not ( = ?auto_14149 ?auto_14159 ) ) ( not ( = ?auto_14149 ?auto_14171 ) ) ( not ( = ?auto_14149 ?auto_14162 ) ) ( not ( = ?auto_14160 ?auto_14169 ) ) ( not ( = ?auto_14160 ?auto_14165 ) ) ( not ( = ?auto_14160 ?auto_14163 ) ) ( not ( = ?auto_14170 ?auto_14172 ) ) ( not ( = ?auto_14170 ?auto_14164 ) ) ( not ( = ?auto_14170 ?auto_14161 ) ) ( not ( = ?auto_14158 ?auto_14159 ) ) ( not ( = ?auto_14158 ?auto_14171 ) ) ( not ( = ?auto_14158 ?auto_14162 ) ) ( not ( = ?auto_14145 ?auto_14151 ) ) ( not ( = ?auto_14145 ?auto_14166 ) ) ( not ( = ?auto_14146 ?auto_14151 ) ) ( not ( = ?auto_14146 ?auto_14166 ) ) ( not ( = ?auto_14147 ?auto_14151 ) ) ( not ( = ?auto_14147 ?auto_14166 ) ) ( not ( = ?auto_14148 ?auto_14151 ) ) ( not ( = ?auto_14148 ?auto_14166 ) ) ( not ( = ?auto_14151 ?auto_14158 ) ) ( not ( = ?auto_14151 ?auto_14159 ) ) ( not ( = ?auto_14151 ?auto_14171 ) ) ( not ( = ?auto_14151 ?auto_14162 ) ) ( not ( = ?auto_14168 ?auto_14160 ) ) ( not ( = ?auto_14168 ?auto_14169 ) ) ( not ( = ?auto_14168 ?auto_14165 ) ) ( not ( = ?auto_14168 ?auto_14163 ) ) ( not ( = ?auto_14167 ?auto_14170 ) ) ( not ( = ?auto_14167 ?auto_14172 ) ) ( not ( = ?auto_14167 ?auto_14164 ) ) ( not ( = ?auto_14167 ?auto_14161 ) ) ( not ( = ?auto_14166 ?auto_14158 ) ) ( not ( = ?auto_14166 ?auto_14159 ) ) ( not ( = ?auto_14166 ?auto_14171 ) ) ( not ( = ?auto_14166 ?auto_14162 ) ) ( not ( = ?auto_14145 ?auto_14150 ) ) ( not ( = ?auto_14145 ?auto_14153 ) ) ( not ( = ?auto_14146 ?auto_14150 ) ) ( not ( = ?auto_14146 ?auto_14153 ) ) ( not ( = ?auto_14147 ?auto_14150 ) ) ( not ( = ?auto_14147 ?auto_14153 ) ) ( not ( = ?auto_14148 ?auto_14150 ) ) ( not ( = ?auto_14148 ?auto_14153 ) ) ( not ( = ?auto_14149 ?auto_14150 ) ) ( not ( = ?auto_14149 ?auto_14153 ) ) ( not ( = ?auto_14150 ?auto_14166 ) ) ( not ( = ?auto_14150 ?auto_14158 ) ) ( not ( = ?auto_14150 ?auto_14159 ) ) ( not ( = ?auto_14150 ?auto_14171 ) ) ( not ( = ?auto_14150 ?auto_14162 ) ) ( not ( = ?auto_14152 ?auto_14168 ) ) ( not ( = ?auto_14152 ?auto_14160 ) ) ( not ( = ?auto_14152 ?auto_14169 ) ) ( not ( = ?auto_14152 ?auto_14165 ) ) ( not ( = ?auto_14152 ?auto_14163 ) ) ( not ( = ?auto_14154 ?auto_14167 ) ) ( not ( = ?auto_14154 ?auto_14170 ) ) ( not ( = ?auto_14154 ?auto_14172 ) ) ( not ( = ?auto_14154 ?auto_14164 ) ) ( not ( = ?auto_14154 ?auto_14161 ) ) ( not ( = ?auto_14153 ?auto_14166 ) ) ( not ( = ?auto_14153 ?auto_14158 ) ) ( not ( = ?auto_14153 ?auto_14159 ) ) ( not ( = ?auto_14153 ?auto_14171 ) ) ( not ( = ?auto_14153 ?auto_14162 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_14145 ?auto_14146 ?auto_14147 ?auto_14148 ?auto_14149 ?auto_14151 )
      ( MAKE-1CRATE ?auto_14151 ?auto_14150 )
      ( MAKE-6CRATE-VERIFY ?auto_14145 ?auto_14146 ?auto_14147 ?auto_14148 ?auto_14149 ?auto_14151 ?auto_14150 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14175 - SURFACE
      ?auto_14176 - SURFACE
    )
    :vars
    (
      ?auto_14177 - HOIST
      ?auto_14178 - PLACE
      ?auto_14180 - PLACE
      ?auto_14181 - HOIST
      ?auto_14182 - SURFACE
      ?auto_14179 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14177 ?auto_14178 ) ( SURFACE-AT ?auto_14175 ?auto_14178 ) ( CLEAR ?auto_14175 ) ( IS-CRATE ?auto_14176 ) ( AVAILABLE ?auto_14177 ) ( not ( = ?auto_14180 ?auto_14178 ) ) ( HOIST-AT ?auto_14181 ?auto_14180 ) ( AVAILABLE ?auto_14181 ) ( SURFACE-AT ?auto_14176 ?auto_14180 ) ( ON ?auto_14176 ?auto_14182 ) ( CLEAR ?auto_14176 ) ( TRUCK-AT ?auto_14179 ?auto_14178 ) ( not ( = ?auto_14175 ?auto_14176 ) ) ( not ( = ?auto_14175 ?auto_14182 ) ) ( not ( = ?auto_14176 ?auto_14182 ) ) ( not ( = ?auto_14177 ?auto_14181 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14179 ?auto_14178 ?auto_14180 )
      ( !LIFT ?auto_14181 ?auto_14176 ?auto_14182 ?auto_14180 )
      ( !LOAD ?auto_14181 ?auto_14176 ?auto_14179 ?auto_14180 )
      ( !DRIVE ?auto_14179 ?auto_14180 ?auto_14178 )
      ( !UNLOAD ?auto_14177 ?auto_14176 ?auto_14179 ?auto_14178 )
      ( !DROP ?auto_14177 ?auto_14176 ?auto_14175 ?auto_14178 )
      ( MAKE-1CRATE-VERIFY ?auto_14175 ?auto_14176 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_14191 - SURFACE
      ?auto_14192 - SURFACE
      ?auto_14193 - SURFACE
      ?auto_14194 - SURFACE
      ?auto_14195 - SURFACE
      ?auto_14197 - SURFACE
      ?auto_14196 - SURFACE
      ?auto_14198 - SURFACE
    )
    :vars
    (
      ?auto_14204 - HOIST
      ?auto_14202 - PLACE
      ?auto_14199 - PLACE
      ?auto_14201 - HOIST
      ?auto_14200 - SURFACE
      ?auto_14208 - PLACE
      ?auto_14205 - HOIST
      ?auto_14210 - SURFACE
      ?auto_14214 - PLACE
      ?auto_14215 - HOIST
      ?auto_14209 - SURFACE
      ?auto_14211 - PLACE
      ?auto_14217 - HOIST
      ?auto_14213 - SURFACE
      ?auto_14216 - PLACE
      ?auto_14206 - HOIST
      ?auto_14207 - SURFACE
      ?auto_14219 - PLACE
      ?auto_14220 - HOIST
      ?auto_14218 - SURFACE
      ?auto_14221 - PLACE
      ?auto_14212 - HOIST
      ?auto_14222 - SURFACE
      ?auto_14203 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14204 ?auto_14202 ) ( IS-CRATE ?auto_14198 ) ( not ( = ?auto_14199 ?auto_14202 ) ) ( HOIST-AT ?auto_14201 ?auto_14199 ) ( AVAILABLE ?auto_14201 ) ( SURFACE-AT ?auto_14198 ?auto_14199 ) ( ON ?auto_14198 ?auto_14200 ) ( CLEAR ?auto_14198 ) ( not ( = ?auto_14196 ?auto_14198 ) ) ( not ( = ?auto_14196 ?auto_14200 ) ) ( not ( = ?auto_14198 ?auto_14200 ) ) ( not ( = ?auto_14204 ?auto_14201 ) ) ( IS-CRATE ?auto_14196 ) ( not ( = ?auto_14208 ?auto_14202 ) ) ( HOIST-AT ?auto_14205 ?auto_14208 ) ( AVAILABLE ?auto_14205 ) ( SURFACE-AT ?auto_14196 ?auto_14208 ) ( ON ?auto_14196 ?auto_14210 ) ( CLEAR ?auto_14196 ) ( not ( = ?auto_14197 ?auto_14196 ) ) ( not ( = ?auto_14197 ?auto_14210 ) ) ( not ( = ?auto_14196 ?auto_14210 ) ) ( not ( = ?auto_14204 ?auto_14205 ) ) ( IS-CRATE ?auto_14197 ) ( not ( = ?auto_14214 ?auto_14202 ) ) ( HOIST-AT ?auto_14215 ?auto_14214 ) ( AVAILABLE ?auto_14215 ) ( SURFACE-AT ?auto_14197 ?auto_14214 ) ( ON ?auto_14197 ?auto_14209 ) ( CLEAR ?auto_14197 ) ( not ( = ?auto_14195 ?auto_14197 ) ) ( not ( = ?auto_14195 ?auto_14209 ) ) ( not ( = ?auto_14197 ?auto_14209 ) ) ( not ( = ?auto_14204 ?auto_14215 ) ) ( IS-CRATE ?auto_14195 ) ( not ( = ?auto_14211 ?auto_14202 ) ) ( HOIST-AT ?auto_14217 ?auto_14211 ) ( AVAILABLE ?auto_14217 ) ( SURFACE-AT ?auto_14195 ?auto_14211 ) ( ON ?auto_14195 ?auto_14213 ) ( CLEAR ?auto_14195 ) ( not ( = ?auto_14194 ?auto_14195 ) ) ( not ( = ?auto_14194 ?auto_14213 ) ) ( not ( = ?auto_14195 ?auto_14213 ) ) ( not ( = ?auto_14204 ?auto_14217 ) ) ( IS-CRATE ?auto_14194 ) ( not ( = ?auto_14216 ?auto_14202 ) ) ( HOIST-AT ?auto_14206 ?auto_14216 ) ( AVAILABLE ?auto_14206 ) ( SURFACE-AT ?auto_14194 ?auto_14216 ) ( ON ?auto_14194 ?auto_14207 ) ( CLEAR ?auto_14194 ) ( not ( = ?auto_14193 ?auto_14194 ) ) ( not ( = ?auto_14193 ?auto_14207 ) ) ( not ( = ?auto_14194 ?auto_14207 ) ) ( not ( = ?auto_14204 ?auto_14206 ) ) ( IS-CRATE ?auto_14193 ) ( not ( = ?auto_14219 ?auto_14202 ) ) ( HOIST-AT ?auto_14220 ?auto_14219 ) ( AVAILABLE ?auto_14220 ) ( SURFACE-AT ?auto_14193 ?auto_14219 ) ( ON ?auto_14193 ?auto_14218 ) ( CLEAR ?auto_14193 ) ( not ( = ?auto_14192 ?auto_14193 ) ) ( not ( = ?auto_14192 ?auto_14218 ) ) ( not ( = ?auto_14193 ?auto_14218 ) ) ( not ( = ?auto_14204 ?auto_14220 ) ) ( SURFACE-AT ?auto_14191 ?auto_14202 ) ( CLEAR ?auto_14191 ) ( IS-CRATE ?auto_14192 ) ( AVAILABLE ?auto_14204 ) ( not ( = ?auto_14221 ?auto_14202 ) ) ( HOIST-AT ?auto_14212 ?auto_14221 ) ( AVAILABLE ?auto_14212 ) ( SURFACE-AT ?auto_14192 ?auto_14221 ) ( ON ?auto_14192 ?auto_14222 ) ( CLEAR ?auto_14192 ) ( TRUCK-AT ?auto_14203 ?auto_14202 ) ( not ( = ?auto_14191 ?auto_14192 ) ) ( not ( = ?auto_14191 ?auto_14222 ) ) ( not ( = ?auto_14192 ?auto_14222 ) ) ( not ( = ?auto_14204 ?auto_14212 ) ) ( not ( = ?auto_14191 ?auto_14193 ) ) ( not ( = ?auto_14191 ?auto_14218 ) ) ( not ( = ?auto_14193 ?auto_14222 ) ) ( not ( = ?auto_14219 ?auto_14221 ) ) ( not ( = ?auto_14220 ?auto_14212 ) ) ( not ( = ?auto_14218 ?auto_14222 ) ) ( not ( = ?auto_14191 ?auto_14194 ) ) ( not ( = ?auto_14191 ?auto_14207 ) ) ( not ( = ?auto_14192 ?auto_14194 ) ) ( not ( = ?auto_14192 ?auto_14207 ) ) ( not ( = ?auto_14194 ?auto_14218 ) ) ( not ( = ?auto_14194 ?auto_14222 ) ) ( not ( = ?auto_14216 ?auto_14219 ) ) ( not ( = ?auto_14216 ?auto_14221 ) ) ( not ( = ?auto_14206 ?auto_14220 ) ) ( not ( = ?auto_14206 ?auto_14212 ) ) ( not ( = ?auto_14207 ?auto_14218 ) ) ( not ( = ?auto_14207 ?auto_14222 ) ) ( not ( = ?auto_14191 ?auto_14195 ) ) ( not ( = ?auto_14191 ?auto_14213 ) ) ( not ( = ?auto_14192 ?auto_14195 ) ) ( not ( = ?auto_14192 ?auto_14213 ) ) ( not ( = ?auto_14193 ?auto_14195 ) ) ( not ( = ?auto_14193 ?auto_14213 ) ) ( not ( = ?auto_14195 ?auto_14207 ) ) ( not ( = ?auto_14195 ?auto_14218 ) ) ( not ( = ?auto_14195 ?auto_14222 ) ) ( not ( = ?auto_14211 ?auto_14216 ) ) ( not ( = ?auto_14211 ?auto_14219 ) ) ( not ( = ?auto_14211 ?auto_14221 ) ) ( not ( = ?auto_14217 ?auto_14206 ) ) ( not ( = ?auto_14217 ?auto_14220 ) ) ( not ( = ?auto_14217 ?auto_14212 ) ) ( not ( = ?auto_14213 ?auto_14207 ) ) ( not ( = ?auto_14213 ?auto_14218 ) ) ( not ( = ?auto_14213 ?auto_14222 ) ) ( not ( = ?auto_14191 ?auto_14197 ) ) ( not ( = ?auto_14191 ?auto_14209 ) ) ( not ( = ?auto_14192 ?auto_14197 ) ) ( not ( = ?auto_14192 ?auto_14209 ) ) ( not ( = ?auto_14193 ?auto_14197 ) ) ( not ( = ?auto_14193 ?auto_14209 ) ) ( not ( = ?auto_14194 ?auto_14197 ) ) ( not ( = ?auto_14194 ?auto_14209 ) ) ( not ( = ?auto_14197 ?auto_14213 ) ) ( not ( = ?auto_14197 ?auto_14207 ) ) ( not ( = ?auto_14197 ?auto_14218 ) ) ( not ( = ?auto_14197 ?auto_14222 ) ) ( not ( = ?auto_14214 ?auto_14211 ) ) ( not ( = ?auto_14214 ?auto_14216 ) ) ( not ( = ?auto_14214 ?auto_14219 ) ) ( not ( = ?auto_14214 ?auto_14221 ) ) ( not ( = ?auto_14215 ?auto_14217 ) ) ( not ( = ?auto_14215 ?auto_14206 ) ) ( not ( = ?auto_14215 ?auto_14220 ) ) ( not ( = ?auto_14215 ?auto_14212 ) ) ( not ( = ?auto_14209 ?auto_14213 ) ) ( not ( = ?auto_14209 ?auto_14207 ) ) ( not ( = ?auto_14209 ?auto_14218 ) ) ( not ( = ?auto_14209 ?auto_14222 ) ) ( not ( = ?auto_14191 ?auto_14196 ) ) ( not ( = ?auto_14191 ?auto_14210 ) ) ( not ( = ?auto_14192 ?auto_14196 ) ) ( not ( = ?auto_14192 ?auto_14210 ) ) ( not ( = ?auto_14193 ?auto_14196 ) ) ( not ( = ?auto_14193 ?auto_14210 ) ) ( not ( = ?auto_14194 ?auto_14196 ) ) ( not ( = ?auto_14194 ?auto_14210 ) ) ( not ( = ?auto_14195 ?auto_14196 ) ) ( not ( = ?auto_14195 ?auto_14210 ) ) ( not ( = ?auto_14196 ?auto_14209 ) ) ( not ( = ?auto_14196 ?auto_14213 ) ) ( not ( = ?auto_14196 ?auto_14207 ) ) ( not ( = ?auto_14196 ?auto_14218 ) ) ( not ( = ?auto_14196 ?auto_14222 ) ) ( not ( = ?auto_14208 ?auto_14214 ) ) ( not ( = ?auto_14208 ?auto_14211 ) ) ( not ( = ?auto_14208 ?auto_14216 ) ) ( not ( = ?auto_14208 ?auto_14219 ) ) ( not ( = ?auto_14208 ?auto_14221 ) ) ( not ( = ?auto_14205 ?auto_14215 ) ) ( not ( = ?auto_14205 ?auto_14217 ) ) ( not ( = ?auto_14205 ?auto_14206 ) ) ( not ( = ?auto_14205 ?auto_14220 ) ) ( not ( = ?auto_14205 ?auto_14212 ) ) ( not ( = ?auto_14210 ?auto_14209 ) ) ( not ( = ?auto_14210 ?auto_14213 ) ) ( not ( = ?auto_14210 ?auto_14207 ) ) ( not ( = ?auto_14210 ?auto_14218 ) ) ( not ( = ?auto_14210 ?auto_14222 ) ) ( not ( = ?auto_14191 ?auto_14198 ) ) ( not ( = ?auto_14191 ?auto_14200 ) ) ( not ( = ?auto_14192 ?auto_14198 ) ) ( not ( = ?auto_14192 ?auto_14200 ) ) ( not ( = ?auto_14193 ?auto_14198 ) ) ( not ( = ?auto_14193 ?auto_14200 ) ) ( not ( = ?auto_14194 ?auto_14198 ) ) ( not ( = ?auto_14194 ?auto_14200 ) ) ( not ( = ?auto_14195 ?auto_14198 ) ) ( not ( = ?auto_14195 ?auto_14200 ) ) ( not ( = ?auto_14197 ?auto_14198 ) ) ( not ( = ?auto_14197 ?auto_14200 ) ) ( not ( = ?auto_14198 ?auto_14210 ) ) ( not ( = ?auto_14198 ?auto_14209 ) ) ( not ( = ?auto_14198 ?auto_14213 ) ) ( not ( = ?auto_14198 ?auto_14207 ) ) ( not ( = ?auto_14198 ?auto_14218 ) ) ( not ( = ?auto_14198 ?auto_14222 ) ) ( not ( = ?auto_14199 ?auto_14208 ) ) ( not ( = ?auto_14199 ?auto_14214 ) ) ( not ( = ?auto_14199 ?auto_14211 ) ) ( not ( = ?auto_14199 ?auto_14216 ) ) ( not ( = ?auto_14199 ?auto_14219 ) ) ( not ( = ?auto_14199 ?auto_14221 ) ) ( not ( = ?auto_14201 ?auto_14205 ) ) ( not ( = ?auto_14201 ?auto_14215 ) ) ( not ( = ?auto_14201 ?auto_14217 ) ) ( not ( = ?auto_14201 ?auto_14206 ) ) ( not ( = ?auto_14201 ?auto_14220 ) ) ( not ( = ?auto_14201 ?auto_14212 ) ) ( not ( = ?auto_14200 ?auto_14210 ) ) ( not ( = ?auto_14200 ?auto_14209 ) ) ( not ( = ?auto_14200 ?auto_14213 ) ) ( not ( = ?auto_14200 ?auto_14207 ) ) ( not ( = ?auto_14200 ?auto_14218 ) ) ( not ( = ?auto_14200 ?auto_14222 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_14191 ?auto_14192 ?auto_14193 ?auto_14194 ?auto_14195 ?auto_14197 ?auto_14196 )
      ( MAKE-1CRATE ?auto_14196 ?auto_14198 )
      ( MAKE-7CRATE-VERIFY ?auto_14191 ?auto_14192 ?auto_14193 ?auto_14194 ?auto_14195 ?auto_14197 ?auto_14196 ?auto_14198 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14225 - SURFACE
      ?auto_14226 - SURFACE
    )
    :vars
    (
      ?auto_14227 - HOIST
      ?auto_14228 - PLACE
      ?auto_14230 - PLACE
      ?auto_14231 - HOIST
      ?auto_14232 - SURFACE
      ?auto_14229 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14227 ?auto_14228 ) ( SURFACE-AT ?auto_14225 ?auto_14228 ) ( CLEAR ?auto_14225 ) ( IS-CRATE ?auto_14226 ) ( AVAILABLE ?auto_14227 ) ( not ( = ?auto_14230 ?auto_14228 ) ) ( HOIST-AT ?auto_14231 ?auto_14230 ) ( AVAILABLE ?auto_14231 ) ( SURFACE-AT ?auto_14226 ?auto_14230 ) ( ON ?auto_14226 ?auto_14232 ) ( CLEAR ?auto_14226 ) ( TRUCK-AT ?auto_14229 ?auto_14228 ) ( not ( = ?auto_14225 ?auto_14226 ) ) ( not ( = ?auto_14225 ?auto_14232 ) ) ( not ( = ?auto_14226 ?auto_14232 ) ) ( not ( = ?auto_14227 ?auto_14231 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14229 ?auto_14228 ?auto_14230 )
      ( !LIFT ?auto_14231 ?auto_14226 ?auto_14232 ?auto_14230 )
      ( !LOAD ?auto_14231 ?auto_14226 ?auto_14229 ?auto_14230 )
      ( !DRIVE ?auto_14229 ?auto_14230 ?auto_14228 )
      ( !UNLOAD ?auto_14227 ?auto_14226 ?auto_14229 ?auto_14228 )
      ( !DROP ?auto_14227 ?auto_14226 ?auto_14225 ?auto_14228 )
      ( MAKE-1CRATE-VERIFY ?auto_14225 ?auto_14226 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_14242 - SURFACE
      ?auto_14243 - SURFACE
      ?auto_14244 - SURFACE
      ?auto_14245 - SURFACE
      ?auto_14246 - SURFACE
      ?auto_14248 - SURFACE
      ?auto_14247 - SURFACE
      ?auto_14250 - SURFACE
      ?auto_14249 - SURFACE
    )
    :vars
    (
      ?auto_14253 - HOIST
      ?auto_14256 - PLACE
      ?auto_14254 - PLACE
      ?auto_14255 - HOIST
      ?auto_14251 - SURFACE
      ?auto_14275 - PLACE
      ?auto_14258 - HOIST
      ?auto_14274 - SURFACE
      ?auto_14257 - PLACE
      ?auto_14263 - HOIST
      ?auto_14272 - SURFACE
      ?auto_14267 - PLACE
      ?auto_14266 - HOIST
      ?auto_14273 - SURFACE
      ?auto_14271 - PLACE
      ?auto_14269 - HOIST
      ?auto_14265 - SURFACE
      ?auto_14268 - PLACE
      ?auto_14259 - HOIST
      ?auto_14260 - SURFACE
      ?auto_14261 - PLACE
      ?auto_14264 - HOIST
      ?auto_14270 - SURFACE
      ?auto_14262 - SURFACE
      ?auto_14252 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14253 ?auto_14256 ) ( IS-CRATE ?auto_14249 ) ( not ( = ?auto_14254 ?auto_14256 ) ) ( HOIST-AT ?auto_14255 ?auto_14254 ) ( SURFACE-AT ?auto_14249 ?auto_14254 ) ( ON ?auto_14249 ?auto_14251 ) ( CLEAR ?auto_14249 ) ( not ( = ?auto_14250 ?auto_14249 ) ) ( not ( = ?auto_14250 ?auto_14251 ) ) ( not ( = ?auto_14249 ?auto_14251 ) ) ( not ( = ?auto_14253 ?auto_14255 ) ) ( IS-CRATE ?auto_14250 ) ( not ( = ?auto_14275 ?auto_14256 ) ) ( HOIST-AT ?auto_14258 ?auto_14275 ) ( AVAILABLE ?auto_14258 ) ( SURFACE-AT ?auto_14250 ?auto_14275 ) ( ON ?auto_14250 ?auto_14274 ) ( CLEAR ?auto_14250 ) ( not ( = ?auto_14247 ?auto_14250 ) ) ( not ( = ?auto_14247 ?auto_14274 ) ) ( not ( = ?auto_14250 ?auto_14274 ) ) ( not ( = ?auto_14253 ?auto_14258 ) ) ( IS-CRATE ?auto_14247 ) ( not ( = ?auto_14257 ?auto_14256 ) ) ( HOIST-AT ?auto_14263 ?auto_14257 ) ( AVAILABLE ?auto_14263 ) ( SURFACE-AT ?auto_14247 ?auto_14257 ) ( ON ?auto_14247 ?auto_14272 ) ( CLEAR ?auto_14247 ) ( not ( = ?auto_14248 ?auto_14247 ) ) ( not ( = ?auto_14248 ?auto_14272 ) ) ( not ( = ?auto_14247 ?auto_14272 ) ) ( not ( = ?auto_14253 ?auto_14263 ) ) ( IS-CRATE ?auto_14248 ) ( not ( = ?auto_14267 ?auto_14256 ) ) ( HOIST-AT ?auto_14266 ?auto_14267 ) ( AVAILABLE ?auto_14266 ) ( SURFACE-AT ?auto_14248 ?auto_14267 ) ( ON ?auto_14248 ?auto_14273 ) ( CLEAR ?auto_14248 ) ( not ( = ?auto_14246 ?auto_14248 ) ) ( not ( = ?auto_14246 ?auto_14273 ) ) ( not ( = ?auto_14248 ?auto_14273 ) ) ( not ( = ?auto_14253 ?auto_14266 ) ) ( IS-CRATE ?auto_14246 ) ( not ( = ?auto_14271 ?auto_14256 ) ) ( HOIST-AT ?auto_14269 ?auto_14271 ) ( AVAILABLE ?auto_14269 ) ( SURFACE-AT ?auto_14246 ?auto_14271 ) ( ON ?auto_14246 ?auto_14265 ) ( CLEAR ?auto_14246 ) ( not ( = ?auto_14245 ?auto_14246 ) ) ( not ( = ?auto_14245 ?auto_14265 ) ) ( not ( = ?auto_14246 ?auto_14265 ) ) ( not ( = ?auto_14253 ?auto_14269 ) ) ( IS-CRATE ?auto_14245 ) ( not ( = ?auto_14268 ?auto_14256 ) ) ( HOIST-AT ?auto_14259 ?auto_14268 ) ( AVAILABLE ?auto_14259 ) ( SURFACE-AT ?auto_14245 ?auto_14268 ) ( ON ?auto_14245 ?auto_14260 ) ( CLEAR ?auto_14245 ) ( not ( = ?auto_14244 ?auto_14245 ) ) ( not ( = ?auto_14244 ?auto_14260 ) ) ( not ( = ?auto_14245 ?auto_14260 ) ) ( not ( = ?auto_14253 ?auto_14259 ) ) ( IS-CRATE ?auto_14244 ) ( not ( = ?auto_14261 ?auto_14256 ) ) ( HOIST-AT ?auto_14264 ?auto_14261 ) ( AVAILABLE ?auto_14264 ) ( SURFACE-AT ?auto_14244 ?auto_14261 ) ( ON ?auto_14244 ?auto_14270 ) ( CLEAR ?auto_14244 ) ( not ( = ?auto_14243 ?auto_14244 ) ) ( not ( = ?auto_14243 ?auto_14270 ) ) ( not ( = ?auto_14244 ?auto_14270 ) ) ( not ( = ?auto_14253 ?auto_14264 ) ) ( SURFACE-AT ?auto_14242 ?auto_14256 ) ( CLEAR ?auto_14242 ) ( IS-CRATE ?auto_14243 ) ( AVAILABLE ?auto_14253 ) ( AVAILABLE ?auto_14255 ) ( SURFACE-AT ?auto_14243 ?auto_14254 ) ( ON ?auto_14243 ?auto_14262 ) ( CLEAR ?auto_14243 ) ( TRUCK-AT ?auto_14252 ?auto_14256 ) ( not ( = ?auto_14242 ?auto_14243 ) ) ( not ( = ?auto_14242 ?auto_14262 ) ) ( not ( = ?auto_14243 ?auto_14262 ) ) ( not ( = ?auto_14242 ?auto_14244 ) ) ( not ( = ?auto_14242 ?auto_14270 ) ) ( not ( = ?auto_14244 ?auto_14262 ) ) ( not ( = ?auto_14261 ?auto_14254 ) ) ( not ( = ?auto_14264 ?auto_14255 ) ) ( not ( = ?auto_14270 ?auto_14262 ) ) ( not ( = ?auto_14242 ?auto_14245 ) ) ( not ( = ?auto_14242 ?auto_14260 ) ) ( not ( = ?auto_14243 ?auto_14245 ) ) ( not ( = ?auto_14243 ?auto_14260 ) ) ( not ( = ?auto_14245 ?auto_14270 ) ) ( not ( = ?auto_14245 ?auto_14262 ) ) ( not ( = ?auto_14268 ?auto_14261 ) ) ( not ( = ?auto_14268 ?auto_14254 ) ) ( not ( = ?auto_14259 ?auto_14264 ) ) ( not ( = ?auto_14259 ?auto_14255 ) ) ( not ( = ?auto_14260 ?auto_14270 ) ) ( not ( = ?auto_14260 ?auto_14262 ) ) ( not ( = ?auto_14242 ?auto_14246 ) ) ( not ( = ?auto_14242 ?auto_14265 ) ) ( not ( = ?auto_14243 ?auto_14246 ) ) ( not ( = ?auto_14243 ?auto_14265 ) ) ( not ( = ?auto_14244 ?auto_14246 ) ) ( not ( = ?auto_14244 ?auto_14265 ) ) ( not ( = ?auto_14246 ?auto_14260 ) ) ( not ( = ?auto_14246 ?auto_14270 ) ) ( not ( = ?auto_14246 ?auto_14262 ) ) ( not ( = ?auto_14271 ?auto_14268 ) ) ( not ( = ?auto_14271 ?auto_14261 ) ) ( not ( = ?auto_14271 ?auto_14254 ) ) ( not ( = ?auto_14269 ?auto_14259 ) ) ( not ( = ?auto_14269 ?auto_14264 ) ) ( not ( = ?auto_14269 ?auto_14255 ) ) ( not ( = ?auto_14265 ?auto_14260 ) ) ( not ( = ?auto_14265 ?auto_14270 ) ) ( not ( = ?auto_14265 ?auto_14262 ) ) ( not ( = ?auto_14242 ?auto_14248 ) ) ( not ( = ?auto_14242 ?auto_14273 ) ) ( not ( = ?auto_14243 ?auto_14248 ) ) ( not ( = ?auto_14243 ?auto_14273 ) ) ( not ( = ?auto_14244 ?auto_14248 ) ) ( not ( = ?auto_14244 ?auto_14273 ) ) ( not ( = ?auto_14245 ?auto_14248 ) ) ( not ( = ?auto_14245 ?auto_14273 ) ) ( not ( = ?auto_14248 ?auto_14265 ) ) ( not ( = ?auto_14248 ?auto_14260 ) ) ( not ( = ?auto_14248 ?auto_14270 ) ) ( not ( = ?auto_14248 ?auto_14262 ) ) ( not ( = ?auto_14267 ?auto_14271 ) ) ( not ( = ?auto_14267 ?auto_14268 ) ) ( not ( = ?auto_14267 ?auto_14261 ) ) ( not ( = ?auto_14267 ?auto_14254 ) ) ( not ( = ?auto_14266 ?auto_14269 ) ) ( not ( = ?auto_14266 ?auto_14259 ) ) ( not ( = ?auto_14266 ?auto_14264 ) ) ( not ( = ?auto_14266 ?auto_14255 ) ) ( not ( = ?auto_14273 ?auto_14265 ) ) ( not ( = ?auto_14273 ?auto_14260 ) ) ( not ( = ?auto_14273 ?auto_14270 ) ) ( not ( = ?auto_14273 ?auto_14262 ) ) ( not ( = ?auto_14242 ?auto_14247 ) ) ( not ( = ?auto_14242 ?auto_14272 ) ) ( not ( = ?auto_14243 ?auto_14247 ) ) ( not ( = ?auto_14243 ?auto_14272 ) ) ( not ( = ?auto_14244 ?auto_14247 ) ) ( not ( = ?auto_14244 ?auto_14272 ) ) ( not ( = ?auto_14245 ?auto_14247 ) ) ( not ( = ?auto_14245 ?auto_14272 ) ) ( not ( = ?auto_14246 ?auto_14247 ) ) ( not ( = ?auto_14246 ?auto_14272 ) ) ( not ( = ?auto_14247 ?auto_14273 ) ) ( not ( = ?auto_14247 ?auto_14265 ) ) ( not ( = ?auto_14247 ?auto_14260 ) ) ( not ( = ?auto_14247 ?auto_14270 ) ) ( not ( = ?auto_14247 ?auto_14262 ) ) ( not ( = ?auto_14257 ?auto_14267 ) ) ( not ( = ?auto_14257 ?auto_14271 ) ) ( not ( = ?auto_14257 ?auto_14268 ) ) ( not ( = ?auto_14257 ?auto_14261 ) ) ( not ( = ?auto_14257 ?auto_14254 ) ) ( not ( = ?auto_14263 ?auto_14266 ) ) ( not ( = ?auto_14263 ?auto_14269 ) ) ( not ( = ?auto_14263 ?auto_14259 ) ) ( not ( = ?auto_14263 ?auto_14264 ) ) ( not ( = ?auto_14263 ?auto_14255 ) ) ( not ( = ?auto_14272 ?auto_14273 ) ) ( not ( = ?auto_14272 ?auto_14265 ) ) ( not ( = ?auto_14272 ?auto_14260 ) ) ( not ( = ?auto_14272 ?auto_14270 ) ) ( not ( = ?auto_14272 ?auto_14262 ) ) ( not ( = ?auto_14242 ?auto_14250 ) ) ( not ( = ?auto_14242 ?auto_14274 ) ) ( not ( = ?auto_14243 ?auto_14250 ) ) ( not ( = ?auto_14243 ?auto_14274 ) ) ( not ( = ?auto_14244 ?auto_14250 ) ) ( not ( = ?auto_14244 ?auto_14274 ) ) ( not ( = ?auto_14245 ?auto_14250 ) ) ( not ( = ?auto_14245 ?auto_14274 ) ) ( not ( = ?auto_14246 ?auto_14250 ) ) ( not ( = ?auto_14246 ?auto_14274 ) ) ( not ( = ?auto_14248 ?auto_14250 ) ) ( not ( = ?auto_14248 ?auto_14274 ) ) ( not ( = ?auto_14250 ?auto_14272 ) ) ( not ( = ?auto_14250 ?auto_14273 ) ) ( not ( = ?auto_14250 ?auto_14265 ) ) ( not ( = ?auto_14250 ?auto_14260 ) ) ( not ( = ?auto_14250 ?auto_14270 ) ) ( not ( = ?auto_14250 ?auto_14262 ) ) ( not ( = ?auto_14275 ?auto_14257 ) ) ( not ( = ?auto_14275 ?auto_14267 ) ) ( not ( = ?auto_14275 ?auto_14271 ) ) ( not ( = ?auto_14275 ?auto_14268 ) ) ( not ( = ?auto_14275 ?auto_14261 ) ) ( not ( = ?auto_14275 ?auto_14254 ) ) ( not ( = ?auto_14258 ?auto_14263 ) ) ( not ( = ?auto_14258 ?auto_14266 ) ) ( not ( = ?auto_14258 ?auto_14269 ) ) ( not ( = ?auto_14258 ?auto_14259 ) ) ( not ( = ?auto_14258 ?auto_14264 ) ) ( not ( = ?auto_14258 ?auto_14255 ) ) ( not ( = ?auto_14274 ?auto_14272 ) ) ( not ( = ?auto_14274 ?auto_14273 ) ) ( not ( = ?auto_14274 ?auto_14265 ) ) ( not ( = ?auto_14274 ?auto_14260 ) ) ( not ( = ?auto_14274 ?auto_14270 ) ) ( not ( = ?auto_14274 ?auto_14262 ) ) ( not ( = ?auto_14242 ?auto_14249 ) ) ( not ( = ?auto_14242 ?auto_14251 ) ) ( not ( = ?auto_14243 ?auto_14249 ) ) ( not ( = ?auto_14243 ?auto_14251 ) ) ( not ( = ?auto_14244 ?auto_14249 ) ) ( not ( = ?auto_14244 ?auto_14251 ) ) ( not ( = ?auto_14245 ?auto_14249 ) ) ( not ( = ?auto_14245 ?auto_14251 ) ) ( not ( = ?auto_14246 ?auto_14249 ) ) ( not ( = ?auto_14246 ?auto_14251 ) ) ( not ( = ?auto_14248 ?auto_14249 ) ) ( not ( = ?auto_14248 ?auto_14251 ) ) ( not ( = ?auto_14247 ?auto_14249 ) ) ( not ( = ?auto_14247 ?auto_14251 ) ) ( not ( = ?auto_14249 ?auto_14274 ) ) ( not ( = ?auto_14249 ?auto_14272 ) ) ( not ( = ?auto_14249 ?auto_14273 ) ) ( not ( = ?auto_14249 ?auto_14265 ) ) ( not ( = ?auto_14249 ?auto_14260 ) ) ( not ( = ?auto_14249 ?auto_14270 ) ) ( not ( = ?auto_14249 ?auto_14262 ) ) ( not ( = ?auto_14251 ?auto_14274 ) ) ( not ( = ?auto_14251 ?auto_14272 ) ) ( not ( = ?auto_14251 ?auto_14273 ) ) ( not ( = ?auto_14251 ?auto_14265 ) ) ( not ( = ?auto_14251 ?auto_14260 ) ) ( not ( = ?auto_14251 ?auto_14270 ) ) ( not ( = ?auto_14251 ?auto_14262 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_14242 ?auto_14243 ?auto_14244 ?auto_14245 ?auto_14246 ?auto_14248 ?auto_14247 ?auto_14250 )
      ( MAKE-1CRATE ?auto_14250 ?auto_14249 )
      ( MAKE-8CRATE-VERIFY ?auto_14242 ?auto_14243 ?auto_14244 ?auto_14245 ?auto_14246 ?auto_14248 ?auto_14247 ?auto_14250 ?auto_14249 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14278 - SURFACE
      ?auto_14279 - SURFACE
    )
    :vars
    (
      ?auto_14280 - HOIST
      ?auto_14281 - PLACE
      ?auto_14283 - PLACE
      ?auto_14284 - HOIST
      ?auto_14285 - SURFACE
      ?auto_14282 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14280 ?auto_14281 ) ( SURFACE-AT ?auto_14278 ?auto_14281 ) ( CLEAR ?auto_14278 ) ( IS-CRATE ?auto_14279 ) ( AVAILABLE ?auto_14280 ) ( not ( = ?auto_14283 ?auto_14281 ) ) ( HOIST-AT ?auto_14284 ?auto_14283 ) ( AVAILABLE ?auto_14284 ) ( SURFACE-AT ?auto_14279 ?auto_14283 ) ( ON ?auto_14279 ?auto_14285 ) ( CLEAR ?auto_14279 ) ( TRUCK-AT ?auto_14282 ?auto_14281 ) ( not ( = ?auto_14278 ?auto_14279 ) ) ( not ( = ?auto_14278 ?auto_14285 ) ) ( not ( = ?auto_14279 ?auto_14285 ) ) ( not ( = ?auto_14280 ?auto_14284 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14282 ?auto_14281 ?auto_14283 )
      ( !LIFT ?auto_14284 ?auto_14279 ?auto_14285 ?auto_14283 )
      ( !LOAD ?auto_14284 ?auto_14279 ?auto_14282 ?auto_14283 )
      ( !DRIVE ?auto_14282 ?auto_14283 ?auto_14281 )
      ( !UNLOAD ?auto_14280 ?auto_14279 ?auto_14282 ?auto_14281 )
      ( !DROP ?auto_14280 ?auto_14279 ?auto_14278 ?auto_14281 )
      ( MAKE-1CRATE-VERIFY ?auto_14278 ?auto_14279 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_14296 - SURFACE
      ?auto_14297 - SURFACE
      ?auto_14298 - SURFACE
      ?auto_14299 - SURFACE
      ?auto_14300 - SURFACE
      ?auto_14303 - SURFACE
      ?auto_14301 - SURFACE
      ?auto_14305 - SURFACE
      ?auto_14304 - SURFACE
      ?auto_14302 - SURFACE
    )
    :vars
    (
      ?auto_14308 - HOIST
      ?auto_14311 - PLACE
      ?auto_14306 - PLACE
      ?auto_14310 - HOIST
      ?auto_14307 - SURFACE
      ?auto_14322 - PLACE
      ?auto_14325 - HOIST
      ?auto_14321 - SURFACE
      ?auto_14323 - SURFACE
      ?auto_14327 - PLACE
      ?auto_14317 - HOIST
      ?auto_14329 - SURFACE
      ?auto_14331 - PLACE
      ?auto_14312 - HOIST
      ?auto_14324 - SURFACE
      ?auto_14320 - PLACE
      ?auto_14314 - HOIST
      ?auto_14330 - SURFACE
      ?auto_14313 - PLACE
      ?auto_14328 - HOIST
      ?auto_14326 - SURFACE
      ?auto_14319 - PLACE
      ?auto_14316 - HOIST
      ?auto_14315 - SURFACE
      ?auto_14318 - SURFACE
      ?auto_14309 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14308 ?auto_14311 ) ( IS-CRATE ?auto_14302 ) ( not ( = ?auto_14306 ?auto_14311 ) ) ( HOIST-AT ?auto_14310 ?auto_14306 ) ( SURFACE-AT ?auto_14302 ?auto_14306 ) ( ON ?auto_14302 ?auto_14307 ) ( CLEAR ?auto_14302 ) ( not ( = ?auto_14304 ?auto_14302 ) ) ( not ( = ?auto_14304 ?auto_14307 ) ) ( not ( = ?auto_14302 ?auto_14307 ) ) ( not ( = ?auto_14308 ?auto_14310 ) ) ( IS-CRATE ?auto_14304 ) ( not ( = ?auto_14322 ?auto_14311 ) ) ( HOIST-AT ?auto_14325 ?auto_14322 ) ( SURFACE-AT ?auto_14304 ?auto_14322 ) ( ON ?auto_14304 ?auto_14321 ) ( CLEAR ?auto_14304 ) ( not ( = ?auto_14305 ?auto_14304 ) ) ( not ( = ?auto_14305 ?auto_14321 ) ) ( not ( = ?auto_14304 ?auto_14321 ) ) ( not ( = ?auto_14308 ?auto_14325 ) ) ( IS-CRATE ?auto_14305 ) ( AVAILABLE ?auto_14310 ) ( SURFACE-AT ?auto_14305 ?auto_14306 ) ( ON ?auto_14305 ?auto_14323 ) ( CLEAR ?auto_14305 ) ( not ( = ?auto_14301 ?auto_14305 ) ) ( not ( = ?auto_14301 ?auto_14323 ) ) ( not ( = ?auto_14305 ?auto_14323 ) ) ( IS-CRATE ?auto_14301 ) ( not ( = ?auto_14327 ?auto_14311 ) ) ( HOIST-AT ?auto_14317 ?auto_14327 ) ( AVAILABLE ?auto_14317 ) ( SURFACE-AT ?auto_14301 ?auto_14327 ) ( ON ?auto_14301 ?auto_14329 ) ( CLEAR ?auto_14301 ) ( not ( = ?auto_14303 ?auto_14301 ) ) ( not ( = ?auto_14303 ?auto_14329 ) ) ( not ( = ?auto_14301 ?auto_14329 ) ) ( not ( = ?auto_14308 ?auto_14317 ) ) ( IS-CRATE ?auto_14303 ) ( not ( = ?auto_14331 ?auto_14311 ) ) ( HOIST-AT ?auto_14312 ?auto_14331 ) ( AVAILABLE ?auto_14312 ) ( SURFACE-AT ?auto_14303 ?auto_14331 ) ( ON ?auto_14303 ?auto_14324 ) ( CLEAR ?auto_14303 ) ( not ( = ?auto_14300 ?auto_14303 ) ) ( not ( = ?auto_14300 ?auto_14324 ) ) ( not ( = ?auto_14303 ?auto_14324 ) ) ( not ( = ?auto_14308 ?auto_14312 ) ) ( IS-CRATE ?auto_14300 ) ( not ( = ?auto_14320 ?auto_14311 ) ) ( HOIST-AT ?auto_14314 ?auto_14320 ) ( AVAILABLE ?auto_14314 ) ( SURFACE-AT ?auto_14300 ?auto_14320 ) ( ON ?auto_14300 ?auto_14330 ) ( CLEAR ?auto_14300 ) ( not ( = ?auto_14299 ?auto_14300 ) ) ( not ( = ?auto_14299 ?auto_14330 ) ) ( not ( = ?auto_14300 ?auto_14330 ) ) ( not ( = ?auto_14308 ?auto_14314 ) ) ( IS-CRATE ?auto_14299 ) ( not ( = ?auto_14313 ?auto_14311 ) ) ( HOIST-AT ?auto_14328 ?auto_14313 ) ( AVAILABLE ?auto_14328 ) ( SURFACE-AT ?auto_14299 ?auto_14313 ) ( ON ?auto_14299 ?auto_14326 ) ( CLEAR ?auto_14299 ) ( not ( = ?auto_14298 ?auto_14299 ) ) ( not ( = ?auto_14298 ?auto_14326 ) ) ( not ( = ?auto_14299 ?auto_14326 ) ) ( not ( = ?auto_14308 ?auto_14328 ) ) ( IS-CRATE ?auto_14298 ) ( not ( = ?auto_14319 ?auto_14311 ) ) ( HOIST-AT ?auto_14316 ?auto_14319 ) ( AVAILABLE ?auto_14316 ) ( SURFACE-AT ?auto_14298 ?auto_14319 ) ( ON ?auto_14298 ?auto_14315 ) ( CLEAR ?auto_14298 ) ( not ( = ?auto_14297 ?auto_14298 ) ) ( not ( = ?auto_14297 ?auto_14315 ) ) ( not ( = ?auto_14298 ?auto_14315 ) ) ( not ( = ?auto_14308 ?auto_14316 ) ) ( SURFACE-AT ?auto_14296 ?auto_14311 ) ( CLEAR ?auto_14296 ) ( IS-CRATE ?auto_14297 ) ( AVAILABLE ?auto_14308 ) ( AVAILABLE ?auto_14325 ) ( SURFACE-AT ?auto_14297 ?auto_14322 ) ( ON ?auto_14297 ?auto_14318 ) ( CLEAR ?auto_14297 ) ( TRUCK-AT ?auto_14309 ?auto_14311 ) ( not ( = ?auto_14296 ?auto_14297 ) ) ( not ( = ?auto_14296 ?auto_14318 ) ) ( not ( = ?auto_14297 ?auto_14318 ) ) ( not ( = ?auto_14296 ?auto_14298 ) ) ( not ( = ?auto_14296 ?auto_14315 ) ) ( not ( = ?auto_14298 ?auto_14318 ) ) ( not ( = ?auto_14319 ?auto_14322 ) ) ( not ( = ?auto_14316 ?auto_14325 ) ) ( not ( = ?auto_14315 ?auto_14318 ) ) ( not ( = ?auto_14296 ?auto_14299 ) ) ( not ( = ?auto_14296 ?auto_14326 ) ) ( not ( = ?auto_14297 ?auto_14299 ) ) ( not ( = ?auto_14297 ?auto_14326 ) ) ( not ( = ?auto_14299 ?auto_14315 ) ) ( not ( = ?auto_14299 ?auto_14318 ) ) ( not ( = ?auto_14313 ?auto_14319 ) ) ( not ( = ?auto_14313 ?auto_14322 ) ) ( not ( = ?auto_14328 ?auto_14316 ) ) ( not ( = ?auto_14328 ?auto_14325 ) ) ( not ( = ?auto_14326 ?auto_14315 ) ) ( not ( = ?auto_14326 ?auto_14318 ) ) ( not ( = ?auto_14296 ?auto_14300 ) ) ( not ( = ?auto_14296 ?auto_14330 ) ) ( not ( = ?auto_14297 ?auto_14300 ) ) ( not ( = ?auto_14297 ?auto_14330 ) ) ( not ( = ?auto_14298 ?auto_14300 ) ) ( not ( = ?auto_14298 ?auto_14330 ) ) ( not ( = ?auto_14300 ?auto_14326 ) ) ( not ( = ?auto_14300 ?auto_14315 ) ) ( not ( = ?auto_14300 ?auto_14318 ) ) ( not ( = ?auto_14320 ?auto_14313 ) ) ( not ( = ?auto_14320 ?auto_14319 ) ) ( not ( = ?auto_14320 ?auto_14322 ) ) ( not ( = ?auto_14314 ?auto_14328 ) ) ( not ( = ?auto_14314 ?auto_14316 ) ) ( not ( = ?auto_14314 ?auto_14325 ) ) ( not ( = ?auto_14330 ?auto_14326 ) ) ( not ( = ?auto_14330 ?auto_14315 ) ) ( not ( = ?auto_14330 ?auto_14318 ) ) ( not ( = ?auto_14296 ?auto_14303 ) ) ( not ( = ?auto_14296 ?auto_14324 ) ) ( not ( = ?auto_14297 ?auto_14303 ) ) ( not ( = ?auto_14297 ?auto_14324 ) ) ( not ( = ?auto_14298 ?auto_14303 ) ) ( not ( = ?auto_14298 ?auto_14324 ) ) ( not ( = ?auto_14299 ?auto_14303 ) ) ( not ( = ?auto_14299 ?auto_14324 ) ) ( not ( = ?auto_14303 ?auto_14330 ) ) ( not ( = ?auto_14303 ?auto_14326 ) ) ( not ( = ?auto_14303 ?auto_14315 ) ) ( not ( = ?auto_14303 ?auto_14318 ) ) ( not ( = ?auto_14331 ?auto_14320 ) ) ( not ( = ?auto_14331 ?auto_14313 ) ) ( not ( = ?auto_14331 ?auto_14319 ) ) ( not ( = ?auto_14331 ?auto_14322 ) ) ( not ( = ?auto_14312 ?auto_14314 ) ) ( not ( = ?auto_14312 ?auto_14328 ) ) ( not ( = ?auto_14312 ?auto_14316 ) ) ( not ( = ?auto_14312 ?auto_14325 ) ) ( not ( = ?auto_14324 ?auto_14330 ) ) ( not ( = ?auto_14324 ?auto_14326 ) ) ( not ( = ?auto_14324 ?auto_14315 ) ) ( not ( = ?auto_14324 ?auto_14318 ) ) ( not ( = ?auto_14296 ?auto_14301 ) ) ( not ( = ?auto_14296 ?auto_14329 ) ) ( not ( = ?auto_14297 ?auto_14301 ) ) ( not ( = ?auto_14297 ?auto_14329 ) ) ( not ( = ?auto_14298 ?auto_14301 ) ) ( not ( = ?auto_14298 ?auto_14329 ) ) ( not ( = ?auto_14299 ?auto_14301 ) ) ( not ( = ?auto_14299 ?auto_14329 ) ) ( not ( = ?auto_14300 ?auto_14301 ) ) ( not ( = ?auto_14300 ?auto_14329 ) ) ( not ( = ?auto_14301 ?auto_14324 ) ) ( not ( = ?auto_14301 ?auto_14330 ) ) ( not ( = ?auto_14301 ?auto_14326 ) ) ( not ( = ?auto_14301 ?auto_14315 ) ) ( not ( = ?auto_14301 ?auto_14318 ) ) ( not ( = ?auto_14327 ?auto_14331 ) ) ( not ( = ?auto_14327 ?auto_14320 ) ) ( not ( = ?auto_14327 ?auto_14313 ) ) ( not ( = ?auto_14327 ?auto_14319 ) ) ( not ( = ?auto_14327 ?auto_14322 ) ) ( not ( = ?auto_14317 ?auto_14312 ) ) ( not ( = ?auto_14317 ?auto_14314 ) ) ( not ( = ?auto_14317 ?auto_14328 ) ) ( not ( = ?auto_14317 ?auto_14316 ) ) ( not ( = ?auto_14317 ?auto_14325 ) ) ( not ( = ?auto_14329 ?auto_14324 ) ) ( not ( = ?auto_14329 ?auto_14330 ) ) ( not ( = ?auto_14329 ?auto_14326 ) ) ( not ( = ?auto_14329 ?auto_14315 ) ) ( not ( = ?auto_14329 ?auto_14318 ) ) ( not ( = ?auto_14296 ?auto_14305 ) ) ( not ( = ?auto_14296 ?auto_14323 ) ) ( not ( = ?auto_14297 ?auto_14305 ) ) ( not ( = ?auto_14297 ?auto_14323 ) ) ( not ( = ?auto_14298 ?auto_14305 ) ) ( not ( = ?auto_14298 ?auto_14323 ) ) ( not ( = ?auto_14299 ?auto_14305 ) ) ( not ( = ?auto_14299 ?auto_14323 ) ) ( not ( = ?auto_14300 ?auto_14305 ) ) ( not ( = ?auto_14300 ?auto_14323 ) ) ( not ( = ?auto_14303 ?auto_14305 ) ) ( not ( = ?auto_14303 ?auto_14323 ) ) ( not ( = ?auto_14305 ?auto_14329 ) ) ( not ( = ?auto_14305 ?auto_14324 ) ) ( not ( = ?auto_14305 ?auto_14330 ) ) ( not ( = ?auto_14305 ?auto_14326 ) ) ( not ( = ?auto_14305 ?auto_14315 ) ) ( not ( = ?auto_14305 ?auto_14318 ) ) ( not ( = ?auto_14306 ?auto_14327 ) ) ( not ( = ?auto_14306 ?auto_14331 ) ) ( not ( = ?auto_14306 ?auto_14320 ) ) ( not ( = ?auto_14306 ?auto_14313 ) ) ( not ( = ?auto_14306 ?auto_14319 ) ) ( not ( = ?auto_14306 ?auto_14322 ) ) ( not ( = ?auto_14310 ?auto_14317 ) ) ( not ( = ?auto_14310 ?auto_14312 ) ) ( not ( = ?auto_14310 ?auto_14314 ) ) ( not ( = ?auto_14310 ?auto_14328 ) ) ( not ( = ?auto_14310 ?auto_14316 ) ) ( not ( = ?auto_14310 ?auto_14325 ) ) ( not ( = ?auto_14323 ?auto_14329 ) ) ( not ( = ?auto_14323 ?auto_14324 ) ) ( not ( = ?auto_14323 ?auto_14330 ) ) ( not ( = ?auto_14323 ?auto_14326 ) ) ( not ( = ?auto_14323 ?auto_14315 ) ) ( not ( = ?auto_14323 ?auto_14318 ) ) ( not ( = ?auto_14296 ?auto_14304 ) ) ( not ( = ?auto_14296 ?auto_14321 ) ) ( not ( = ?auto_14297 ?auto_14304 ) ) ( not ( = ?auto_14297 ?auto_14321 ) ) ( not ( = ?auto_14298 ?auto_14304 ) ) ( not ( = ?auto_14298 ?auto_14321 ) ) ( not ( = ?auto_14299 ?auto_14304 ) ) ( not ( = ?auto_14299 ?auto_14321 ) ) ( not ( = ?auto_14300 ?auto_14304 ) ) ( not ( = ?auto_14300 ?auto_14321 ) ) ( not ( = ?auto_14303 ?auto_14304 ) ) ( not ( = ?auto_14303 ?auto_14321 ) ) ( not ( = ?auto_14301 ?auto_14304 ) ) ( not ( = ?auto_14301 ?auto_14321 ) ) ( not ( = ?auto_14304 ?auto_14323 ) ) ( not ( = ?auto_14304 ?auto_14329 ) ) ( not ( = ?auto_14304 ?auto_14324 ) ) ( not ( = ?auto_14304 ?auto_14330 ) ) ( not ( = ?auto_14304 ?auto_14326 ) ) ( not ( = ?auto_14304 ?auto_14315 ) ) ( not ( = ?auto_14304 ?auto_14318 ) ) ( not ( = ?auto_14321 ?auto_14323 ) ) ( not ( = ?auto_14321 ?auto_14329 ) ) ( not ( = ?auto_14321 ?auto_14324 ) ) ( not ( = ?auto_14321 ?auto_14330 ) ) ( not ( = ?auto_14321 ?auto_14326 ) ) ( not ( = ?auto_14321 ?auto_14315 ) ) ( not ( = ?auto_14321 ?auto_14318 ) ) ( not ( = ?auto_14296 ?auto_14302 ) ) ( not ( = ?auto_14296 ?auto_14307 ) ) ( not ( = ?auto_14297 ?auto_14302 ) ) ( not ( = ?auto_14297 ?auto_14307 ) ) ( not ( = ?auto_14298 ?auto_14302 ) ) ( not ( = ?auto_14298 ?auto_14307 ) ) ( not ( = ?auto_14299 ?auto_14302 ) ) ( not ( = ?auto_14299 ?auto_14307 ) ) ( not ( = ?auto_14300 ?auto_14302 ) ) ( not ( = ?auto_14300 ?auto_14307 ) ) ( not ( = ?auto_14303 ?auto_14302 ) ) ( not ( = ?auto_14303 ?auto_14307 ) ) ( not ( = ?auto_14301 ?auto_14302 ) ) ( not ( = ?auto_14301 ?auto_14307 ) ) ( not ( = ?auto_14305 ?auto_14302 ) ) ( not ( = ?auto_14305 ?auto_14307 ) ) ( not ( = ?auto_14302 ?auto_14321 ) ) ( not ( = ?auto_14302 ?auto_14323 ) ) ( not ( = ?auto_14302 ?auto_14329 ) ) ( not ( = ?auto_14302 ?auto_14324 ) ) ( not ( = ?auto_14302 ?auto_14330 ) ) ( not ( = ?auto_14302 ?auto_14326 ) ) ( not ( = ?auto_14302 ?auto_14315 ) ) ( not ( = ?auto_14302 ?auto_14318 ) ) ( not ( = ?auto_14307 ?auto_14321 ) ) ( not ( = ?auto_14307 ?auto_14323 ) ) ( not ( = ?auto_14307 ?auto_14329 ) ) ( not ( = ?auto_14307 ?auto_14324 ) ) ( not ( = ?auto_14307 ?auto_14330 ) ) ( not ( = ?auto_14307 ?auto_14326 ) ) ( not ( = ?auto_14307 ?auto_14315 ) ) ( not ( = ?auto_14307 ?auto_14318 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_14296 ?auto_14297 ?auto_14298 ?auto_14299 ?auto_14300 ?auto_14303 ?auto_14301 ?auto_14305 ?auto_14304 )
      ( MAKE-1CRATE ?auto_14304 ?auto_14302 )
      ( MAKE-9CRATE-VERIFY ?auto_14296 ?auto_14297 ?auto_14298 ?auto_14299 ?auto_14300 ?auto_14303 ?auto_14301 ?auto_14305 ?auto_14304 ?auto_14302 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14334 - SURFACE
      ?auto_14335 - SURFACE
    )
    :vars
    (
      ?auto_14336 - HOIST
      ?auto_14337 - PLACE
      ?auto_14339 - PLACE
      ?auto_14340 - HOIST
      ?auto_14341 - SURFACE
      ?auto_14338 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14336 ?auto_14337 ) ( SURFACE-AT ?auto_14334 ?auto_14337 ) ( CLEAR ?auto_14334 ) ( IS-CRATE ?auto_14335 ) ( AVAILABLE ?auto_14336 ) ( not ( = ?auto_14339 ?auto_14337 ) ) ( HOIST-AT ?auto_14340 ?auto_14339 ) ( AVAILABLE ?auto_14340 ) ( SURFACE-AT ?auto_14335 ?auto_14339 ) ( ON ?auto_14335 ?auto_14341 ) ( CLEAR ?auto_14335 ) ( TRUCK-AT ?auto_14338 ?auto_14337 ) ( not ( = ?auto_14334 ?auto_14335 ) ) ( not ( = ?auto_14334 ?auto_14341 ) ) ( not ( = ?auto_14335 ?auto_14341 ) ) ( not ( = ?auto_14336 ?auto_14340 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14338 ?auto_14337 ?auto_14339 )
      ( !LIFT ?auto_14340 ?auto_14335 ?auto_14341 ?auto_14339 )
      ( !LOAD ?auto_14340 ?auto_14335 ?auto_14338 ?auto_14339 )
      ( !DRIVE ?auto_14338 ?auto_14339 ?auto_14337 )
      ( !UNLOAD ?auto_14336 ?auto_14335 ?auto_14338 ?auto_14337 )
      ( !DROP ?auto_14336 ?auto_14335 ?auto_14334 ?auto_14337 )
      ( MAKE-1CRATE-VERIFY ?auto_14334 ?auto_14335 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_14353 - SURFACE
      ?auto_14354 - SURFACE
      ?auto_14355 - SURFACE
      ?auto_14356 - SURFACE
      ?auto_14357 - SURFACE
      ?auto_14360 - SURFACE
      ?auto_14358 - SURFACE
      ?auto_14362 - SURFACE
      ?auto_14361 - SURFACE
      ?auto_14359 - SURFACE
      ?auto_14363 - SURFACE
    )
    :vars
    (
      ?auto_14368 - HOIST
      ?auto_14367 - PLACE
      ?auto_14364 - PLACE
      ?auto_14369 - HOIST
      ?auto_14366 - SURFACE
      ?auto_14383 - PLACE
      ?auto_14370 - HOIST
      ?auto_14379 - SURFACE
      ?auto_14376 - PLACE
      ?auto_14387 - HOIST
      ?auto_14385 - SURFACE
      ?auto_14381 - SURFACE
      ?auto_14388 - PLACE
      ?auto_14378 - HOIST
      ?auto_14389 - SURFACE
      ?auto_14373 - PLACE
      ?auto_14380 - HOIST
      ?auto_14386 - SURFACE
      ?auto_14384 - PLACE
      ?auto_14375 - HOIST
      ?auto_14371 - SURFACE
      ?auto_14372 - PLACE
      ?auto_14374 - HOIST
      ?auto_14382 - SURFACE
      ?auto_14390 - SURFACE
      ?auto_14377 - SURFACE
      ?auto_14365 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14368 ?auto_14367 ) ( IS-CRATE ?auto_14363 ) ( not ( = ?auto_14364 ?auto_14367 ) ) ( HOIST-AT ?auto_14369 ?auto_14364 ) ( SURFACE-AT ?auto_14363 ?auto_14364 ) ( ON ?auto_14363 ?auto_14366 ) ( CLEAR ?auto_14363 ) ( not ( = ?auto_14359 ?auto_14363 ) ) ( not ( = ?auto_14359 ?auto_14366 ) ) ( not ( = ?auto_14363 ?auto_14366 ) ) ( not ( = ?auto_14368 ?auto_14369 ) ) ( IS-CRATE ?auto_14359 ) ( not ( = ?auto_14383 ?auto_14367 ) ) ( HOIST-AT ?auto_14370 ?auto_14383 ) ( SURFACE-AT ?auto_14359 ?auto_14383 ) ( ON ?auto_14359 ?auto_14379 ) ( CLEAR ?auto_14359 ) ( not ( = ?auto_14361 ?auto_14359 ) ) ( not ( = ?auto_14361 ?auto_14379 ) ) ( not ( = ?auto_14359 ?auto_14379 ) ) ( not ( = ?auto_14368 ?auto_14370 ) ) ( IS-CRATE ?auto_14361 ) ( not ( = ?auto_14376 ?auto_14367 ) ) ( HOIST-AT ?auto_14387 ?auto_14376 ) ( SURFACE-AT ?auto_14361 ?auto_14376 ) ( ON ?auto_14361 ?auto_14385 ) ( CLEAR ?auto_14361 ) ( not ( = ?auto_14362 ?auto_14361 ) ) ( not ( = ?auto_14362 ?auto_14385 ) ) ( not ( = ?auto_14361 ?auto_14385 ) ) ( not ( = ?auto_14368 ?auto_14387 ) ) ( IS-CRATE ?auto_14362 ) ( AVAILABLE ?auto_14370 ) ( SURFACE-AT ?auto_14362 ?auto_14383 ) ( ON ?auto_14362 ?auto_14381 ) ( CLEAR ?auto_14362 ) ( not ( = ?auto_14358 ?auto_14362 ) ) ( not ( = ?auto_14358 ?auto_14381 ) ) ( not ( = ?auto_14362 ?auto_14381 ) ) ( IS-CRATE ?auto_14358 ) ( not ( = ?auto_14388 ?auto_14367 ) ) ( HOIST-AT ?auto_14378 ?auto_14388 ) ( AVAILABLE ?auto_14378 ) ( SURFACE-AT ?auto_14358 ?auto_14388 ) ( ON ?auto_14358 ?auto_14389 ) ( CLEAR ?auto_14358 ) ( not ( = ?auto_14360 ?auto_14358 ) ) ( not ( = ?auto_14360 ?auto_14389 ) ) ( not ( = ?auto_14358 ?auto_14389 ) ) ( not ( = ?auto_14368 ?auto_14378 ) ) ( IS-CRATE ?auto_14360 ) ( not ( = ?auto_14373 ?auto_14367 ) ) ( HOIST-AT ?auto_14380 ?auto_14373 ) ( AVAILABLE ?auto_14380 ) ( SURFACE-AT ?auto_14360 ?auto_14373 ) ( ON ?auto_14360 ?auto_14386 ) ( CLEAR ?auto_14360 ) ( not ( = ?auto_14357 ?auto_14360 ) ) ( not ( = ?auto_14357 ?auto_14386 ) ) ( not ( = ?auto_14360 ?auto_14386 ) ) ( not ( = ?auto_14368 ?auto_14380 ) ) ( IS-CRATE ?auto_14357 ) ( not ( = ?auto_14384 ?auto_14367 ) ) ( HOIST-AT ?auto_14375 ?auto_14384 ) ( AVAILABLE ?auto_14375 ) ( SURFACE-AT ?auto_14357 ?auto_14384 ) ( ON ?auto_14357 ?auto_14371 ) ( CLEAR ?auto_14357 ) ( not ( = ?auto_14356 ?auto_14357 ) ) ( not ( = ?auto_14356 ?auto_14371 ) ) ( not ( = ?auto_14357 ?auto_14371 ) ) ( not ( = ?auto_14368 ?auto_14375 ) ) ( IS-CRATE ?auto_14356 ) ( not ( = ?auto_14372 ?auto_14367 ) ) ( HOIST-AT ?auto_14374 ?auto_14372 ) ( AVAILABLE ?auto_14374 ) ( SURFACE-AT ?auto_14356 ?auto_14372 ) ( ON ?auto_14356 ?auto_14382 ) ( CLEAR ?auto_14356 ) ( not ( = ?auto_14355 ?auto_14356 ) ) ( not ( = ?auto_14355 ?auto_14382 ) ) ( not ( = ?auto_14356 ?auto_14382 ) ) ( not ( = ?auto_14368 ?auto_14374 ) ) ( IS-CRATE ?auto_14355 ) ( AVAILABLE ?auto_14369 ) ( SURFACE-AT ?auto_14355 ?auto_14364 ) ( ON ?auto_14355 ?auto_14390 ) ( CLEAR ?auto_14355 ) ( not ( = ?auto_14354 ?auto_14355 ) ) ( not ( = ?auto_14354 ?auto_14390 ) ) ( not ( = ?auto_14355 ?auto_14390 ) ) ( SURFACE-AT ?auto_14353 ?auto_14367 ) ( CLEAR ?auto_14353 ) ( IS-CRATE ?auto_14354 ) ( AVAILABLE ?auto_14368 ) ( AVAILABLE ?auto_14387 ) ( SURFACE-AT ?auto_14354 ?auto_14376 ) ( ON ?auto_14354 ?auto_14377 ) ( CLEAR ?auto_14354 ) ( TRUCK-AT ?auto_14365 ?auto_14367 ) ( not ( = ?auto_14353 ?auto_14354 ) ) ( not ( = ?auto_14353 ?auto_14377 ) ) ( not ( = ?auto_14354 ?auto_14377 ) ) ( not ( = ?auto_14353 ?auto_14355 ) ) ( not ( = ?auto_14353 ?auto_14390 ) ) ( not ( = ?auto_14355 ?auto_14377 ) ) ( not ( = ?auto_14364 ?auto_14376 ) ) ( not ( = ?auto_14369 ?auto_14387 ) ) ( not ( = ?auto_14390 ?auto_14377 ) ) ( not ( = ?auto_14353 ?auto_14356 ) ) ( not ( = ?auto_14353 ?auto_14382 ) ) ( not ( = ?auto_14354 ?auto_14356 ) ) ( not ( = ?auto_14354 ?auto_14382 ) ) ( not ( = ?auto_14356 ?auto_14390 ) ) ( not ( = ?auto_14356 ?auto_14377 ) ) ( not ( = ?auto_14372 ?auto_14364 ) ) ( not ( = ?auto_14372 ?auto_14376 ) ) ( not ( = ?auto_14374 ?auto_14369 ) ) ( not ( = ?auto_14374 ?auto_14387 ) ) ( not ( = ?auto_14382 ?auto_14390 ) ) ( not ( = ?auto_14382 ?auto_14377 ) ) ( not ( = ?auto_14353 ?auto_14357 ) ) ( not ( = ?auto_14353 ?auto_14371 ) ) ( not ( = ?auto_14354 ?auto_14357 ) ) ( not ( = ?auto_14354 ?auto_14371 ) ) ( not ( = ?auto_14355 ?auto_14357 ) ) ( not ( = ?auto_14355 ?auto_14371 ) ) ( not ( = ?auto_14357 ?auto_14382 ) ) ( not ( = ?auto_14357 ?auto_14390 ) ) ( not ( = ?auto_14357 ?auto_14377 ) ) ( not ( = ?auto_14384 ?auto_14372 ) ) ( not ( = ?auto_14384 ?auto_14364 ) ) ( not ( = ?auto_14384 ?auto_14376 ) ) ( not ( = ?auto_14375 ?auto_14374 ) ) ( not ( = ?auto_14375 ?auto_14369 ) ) ( not ( = ?auto_14375 ?auto_14387 ) ) ( not ( = ?auto_14371 ?auto_14382 ) ) ( not ( = ?auto_14371 ?auto_14390 ) ) ( not ( = ?auto_14371 ?auto_14377 ) ) ( not ( = ?auto_14353 ?auto_14360 ) ) ( not ( = ?auto_14353 ?auto_14386 ) ) ( not ( = ?auto_14354 ?auto_14360 ) ) ( not ( = ?auto_14354 ?auto_14386 ) ) ( not ( = ?auto_14355 ?auto_14360 ) ) ( not ( = ?auto_14355 ?auto_14386 ) ) ( not ( = ?auto_14356 ?auto_14360 ) ) ( not ( = ?auto_14356 ?auto_14386 ) ) ( not ( = ?auto_14360 ?auto_14371 ) ) ( not ( = ?auto_14360 ?auto_14382 ) ) ( not ( = ?auto_14360 ?auto_14390 ) ) ( not ( = ?auto_14360 ?auto_14377 ) ) ( not ( = ?auto_14373 ?auto_14384 ) ) ( not ( = ?auto_14373 ?auto_14372 ) ) ( not ( = ?auto_14373 ?auto_14364 ) ) ( not ( = ?auto_14373 ?auto_14376 ) ) ( not ( = ?auto_14380 ?auto_14375 ) ) ( not ( = ?auto_14380 ?auto_14374 ) ) ( not ( = ?auto_14380 ?auto_14369 ) ) ( not ( = ?auto_14380 ?auto_14387 ) ) ( not ( = ?auto_14386 ?auto_14371 ) ) ( not ( = ?auto_14386 ?auto_14382 ) ) ( not ( = ?auto_14386 ?auto_14390 ) ) ( not ( = ?auto_14386 ?auto_14377 ) ) ( not ( = ?auto_14353 ?auto_14358 ) ) ( not ( = ?auto_14353 ?auto_14389 ) ) ( not ( = ?auto_14354 ?auto_14358 ) ) ( not ( = ?auto_14354 ?auto_14389 ) ) ( not ( = ?auto_14355 ?auto_14358 ) ) ( not ( = ?auto_14355 ?auto_14389 ) ) ( not ( = ?auto_14356 ?auto_14358 ) ) ( not ( = ?auto_14356 ?auto_14389 ) ) ( not ( = ?auto_14357 ?auto_14358 ) ) ( not ( = ?auto_14357 ?auto_14389 ) ) ( not ( = ?auto_14358 ?auto_14386 ) ) ( not ( = ?auto_14358 ?auto_14371 ) ) ( not ( = ?auto_14358 ?auto_14382 ) ) ( not ( = ?auto_14358 ?auto_14390 ) ) ( not ( = ?auto_14358 ?auto_14377 ) ) ( not ( = ?auto_14388 ?auto_14373 ) ) ( not ( = ?auto_14388 ?auto_14384 ) ) ( not ( = ?auto_14388 ?auto_14372 ) ) ( not ( = ?auto_14388 ?auto_14364 ) ) ( not ( = ?auto_14388 ?auto_14376 ) ) ( not ( = ?auto_14378 ?auto_14380 ) ) ( not ( = ?auto_14378 ?auto_14375 ) ) ( not ( = ?auto_14378 ?auto_14374 ) ) ( not ( = ?auto_14378 ?auto_14369 ) ) ( not ( = ?auto_14378 ?auto_14387 ) ) ( not ( = ?auto_14389 ?auto_14386 ) ) ( not ( = ?auto_14389 ?auto_14371 ) ) ( not ( = ?auto_14389 ?auto_14382 ) ) ( not ( = ?auto_14389 ?auto_14390 ) ) ( not ( = ?auto_14389 ?auto_14377 ) ) ( not ( = ?auto_14353 ?auto_14362 ) ) ( not ( = ?auto_14353 ?auto_14381 ) ) ( not ( = ?auto_14354 ?auto_14362 ) ) ( not ( = ?auto_14354 ?auto_14381 ) ) ( not ( = ?auto_14355 ?auto_14362 ) ) ( not ( = ?auto_14355 ?auto_14381 ) ) ( not ( = ?auto_14356 ?auto_14362 ) ) ( not ( = ?auto_14356 ?auto_14381 ) ) ( not ( = ?auto_14357 ?auto_14362 ) ) ( not ( = ?auto_14357 ?auto_14381 ) ) ( not ( = ?auto_14360 ?auto_14362 ) ) ( not ( = ?auto_14360 ?auto_14381 ) ) ( not ( = ?auto_14362 ?auto_14389 ) ) ( not ( = ?auto_14362 ?auto_14386 ) ) ( not ( = ?auto_14362 ?auto_14371 ) ) ( not ( = ?auto_14362 ?auto_14382 ) ) ( not ( = ?auto_14362 ?auto_14390 ) ) ( not ( = ?auto_14362 ?auto_14377 ) ) ( not ( = ?auto_14383 ?auto_14388 ) ) ( not ( = ?auto_14383 ?auto_14373 ) ) ( not ( = ?auto_14383 ?auto_14384 ) ) ( not ( = ?auto_14383 ?auto_14372 ) ) ( not ( = ?auto_14383 ?auto_14364 ) ) ( not ( = ?auto_14383 ?auto_14376 ) ) ( not ( = ?auto_14370 ?auto_14378 ) ) ( not ( = ?auto_14370 ?auto_14380 ) ) ( not ( = ?auto_14370 ?auto_14375 ) ) ( not ( = ?auto_14370 ?auto_14374 ) ) ( not ( = ?auto_14370 ?auto_14369 ) ) ( not ( = ?auto_14370 ?auto_14387 ) ) ( not ( = ?auto_14381 ?auto_14389 ) ) ( not ( = ?auto_14381 ?auto_14386 ) ) ( not ( = ?auto_14381 ?auto_14371 ) ) ( not ( = ?auto_14381 ?auto_14382 ) ) ( not ( = ?auto_14381 ?auto_14390 ) ) ( not ( = ?auto_14381 ?auto_14377 ) ) ( not ( = ?auto_14353 ?auto_14361 ) ) ( not ( = ?auto_14353 ?auto_14385 ) ) ( not ( = ?auto_14354 ?auto_14361 ) ) ( not ( = ?auto_14354 ?auto_14385 ) ) ( not ( = ?auto_14355 ?auto_14361 ) ) ( not ( = ?auto_14355 ?auto_14385 ) ) ( not ( = ?auto_14356 ?auto_14361 ) ) ( not ( = ?auto_14356 ?auto_14385 ) ) ( not ( = ?auto_14357 ?auto_14361 ) ) ( not ( = ?auto_14357 ?auto_14385 ) ) ( not ( = ?auto_14360 ?auto_14361 ) ) ( not ( = ?auto_14360 ?auto_14385 ) ) ( not ( = ?auto_14358 ?auto_14361 ) ) ( not ( = ?auto_14358 ?auto_14385 ) ) ( not ( = ?auto_14361 ?auto_14381 ) ) ( not ( = ?auto_14361 ?auto_14389 ) ) ( not ( = ?auto_14361 ?auto_14386 ) ) ( not ( = ?auto_14361 ?auto_14371 ) ) ( not ( = ?auto_14361 ?auto_14382 ) ) ( not ( = ?auto_14361 ?auto_14390 ) ) ( not ( = ?auto_14361 ?auto_14377 ) ) ( not ( = ?auto_14385 ?auto_14381 ) ) ( not ( = ?auto_14385 ?auto_14389 ) ) ( not ( = ?auto_14385 ?auto_14386 ) ) ( not ( = ?auto_14385 ?auto_14371 ) ) ( not ( = ?auto_14385 ?auto_14382 ) ) ( not ( = ?auto_14385 ?auto_14390 ) ) ( not ( = ?auto_14385 ?auto_14377 ) ) ( not ( = ?auto_14353 ?auto_14359 ) ) ( not ( = ?auto_14353 ?auto_14379 ) ) ( not ( = ?auto_14354 ?auto_14359 ) ) ( not ( = ?auto_14354 ?auto_14379 ) ) ( not ( = ?auto_14355 ?auto_14359 ) ) ( not ( = ?auto_14355 ?auto_14379 ) ) ( not ( = ?auto_14356 ?auto_14359 ) ) ( not ( = ?auto_14356 ?auto_14379 ) ) ( not ( = ?auto_14357 ?auto_14359 ) ) ( not ( = ?auto_14357 ?auto_14379 ) ) ( not ( = ?auto_14360 ?auto_14359 ) ) ( not ( = ?auto_14360 ?auto_14379 ) ) ( not ( = ?auto_14358 ?auto_14359 ) ) ( not ( = ?auto_14358 ?auto_14379 ) ) ( not ( = ?auto_14362 ?auto_14359 ) ) ( not ( = ?auto_14362 ?auto_14379 ) ) ( not ( = ?auto_14359 ?auto_14385 ) ) ( not ( = ?auto_14359 ?auto_14381 ) ) ( not ( = ?auto_14359 ?auto_14389 ) ) ( not ( = ?auto_14359 ?auto_14386 ) ) ( not ( = ?auto_14359 ?auto_14371 ) ) ( not ( = ?auto_14359 ?auto_14382 ) ) ( not ( = ?auto_14359 ?auto_14390 ) ) ( not ( = ?auto_14359 ?auto_14377 ) ) ( not ( = ?auto_14379 ?auto_14385 ) ) ( not ( = ?auto_14379 ?auto_14381 ) ) ( not ( = ?auto_14379 ?auto_14389 ) ) ( not ( = ?auto_14379 ?auto_14386 ) ) ( not ( = ?auto_14379 ?auto_14371 ) ) ( not ( = ?auto_14379 ?auto_14382 ) ) ( not ( = ?auto_14379 ?auto_14390 ) ) ( not ( = ?auto_14379 ?auto_14377 ) ) ( not ( = ?auto_14353 ?auto_14363 ) ) ( not ( = ?auto_14353 ?auto_14366 ) ) ( not ( = ?auto_14354 ?auto_14363 ) ) ( not ( = ?auto_14354 ?auto_14366 ) ) ( not ( = ?auto_14355 ?auto_14363 ) ) ( not ( = ?auto_14355 ?auto_14366 ) ) ( not ( = ?auto_14356 ?auto_14363 ) ) ( not ( = ?auto_14356 ?auto_14366 ) ) ( not ( = ?auto_14357 ?auto_14363 ) ) ( not ( = ?auto_14357 ?auto_14366 ) ) ( not ( = ?auto_14360 ?auto_14363 ) ) ( not ( = ?auto_14360 ?auto_14366 ) ) ( not ( = ?auto_14358 ?auto_14363 ) ) ( not ( = ?auto_14358 ?auto_14366 ) ) ( not ( = ?auto_14362 ?auto_14363 ) ) ( not ( = ?auto_14362 ?auto_14366 ) ) ( not ( = ?auto_14361 ?auto_14363 ) ) ( not ( = ?auto_14361 ?auto_14366 ) ) ( not ( = ?auto_14363 ?auto_14379 ) ) ( not ( = ?auto_14363 ?auto_14385 ) ) ( not ( = ?auto_14363 ?auto_14381 ) ) ( not ( = ?auto_14363 ?auto_14389 ) ) ( not ( = ?auto_14363 ?auto_14386 ) ) ( not ( = ?auto_14363 ?auto_14371 ) ) ( not ( = ?auto_14363 ?auto_14382 ) ) ( not ( = ?auto_14363 ?auto_14390 ) ) ( not ( = ?auto_14363 ?auto_14377 ) ) ( not ( = ?auto_14366 ?auto_14379 ) ) ( not ( = ?auto_14366 ?auto_14385 ) ) ( not ( = ?auto_14366 ?auto_14381 ) ) ( not ( = ?auto_14366 ?auto_14389 ) ) ( not ( = ?auto_14366 ?auto_14386 ) ) ( not ( = ?auto_14366 ?auto_14371 ) ) ( not ( = ?auto_14366 ?auto_14382 ) ) ( not ( = ?auto_14366 ?auto_14390 ) ) ( not ( = ?auto_14366 ?auto_14377 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_14353 ?auto_14354 ?auto_14355 ?auto_14356 ?auto_14357 ?auto_14360 ?auto_14358 ?auto_14362 ?auto_14361 ?auto_14359 )
      ( MAKE-1CRATE ?auto_14359 ?auto_14363 )
      ( MAKE-10CRATE-VERIFY ?auto_14353 ?auto_14354 ?auto_14355 ?auto_14356 ?auto_14357 ?auto_14360 ?auto_14358 ?auto_14362 ?auto_14361 ?auto_14359 ?auto_14363 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14393 - SURFACE
      ?auto_14394 - SURFACE
    )
    :vars
    (
      ?auto_14395 - HOIST
      ?auto_14396 - PLACE
      ?auto_14398 - PLACE
      ?auto_14399 - HOIST
      ?auto_14400 - SURFACE
      ?auto_14397 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14395 ?auto_14396 ) ( SURFACE-AT ?auto_14393 ?auto_14396 ) ( CLEAR ?auto_14393 ) ( IS-CRATE ?auto_14394 ) ( AVAILABLE ?auto_14395 ) ( not ( = ?auto_14398 ?auto_14396 ) ) ( HOIST-AT ?auto_14399 ?auto_14398 ) ( AVAILABLE ?auto_14399 ) ( SURFACE-AT ?auto_14394 ?auto_14398 ) ( ON ?auto_14394 ?auto_14400 ) ( CLEAR ?auto_14394 ) ( TRUCK-AT ?auto_14397 ?auto_14396 ) ( not ( = ?auto_14393 ?auto_14394 ) ) ( not ( = ?auto_14393 ?auto_14400 ) ) ( not ( = ?auto_14394 ?auto_14400 ) ) ( not ( = ?auto_14395 ?auto_14399 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14397 ?auto_14396 ?auto_14398 )
      ( !LIFT ?auto_14399 ?auto_14394 ?auto_14400 ?auto_14398 )
      ( !LOAD ?auto_14399 ?auto_14394 ?auto_14397 ?auto_14398 )
      ( !DRIVE ?auto_14397 ?auto_14398 ?auto_14396 )
      ( !UNLOAD ?auto_14395 ?auto_14394 ?auto_14397 ?auto_14396 )
      ( !DROP ?auto_14395 ?auto_14394 ?auto_14393 ?auto_14396 )
      ( MAKE-1CRATE-VERIFY ?auto_14393 ?auto_14394 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_14413 - SURFACE
      ?auto_14414 - SURFACE
      ?auto_14415 - SURFACE
      ?auto_14416 - SURFACE
      ?auto_14417 - SURFACE
      ?auto_14420 - SURFACE
      ?auto_14418 - SURFACE
      ?auto_14422 - SURFACE
      ?auto_14421 - SURFACE
      ?auto_14419 - SURFACE
      ?auto_14424 - SURFACE
      ?auto_14423 - SURFACE
    )
    :vars
    (
      ?auto_14426 - HOIST
      ?auto_14429 - PLACE
      ?auto_14427 - PLACE
      ?auto_14430 - HOIST
      ?auto_14428 - SURFACE
      ?auto_14451 - PLACE
      ?auto_14453 - HOIST
      ?auto_14454 - SURFACE
      ?auto_14443 - PLACE
      ?auto_14433 - HOIST
      ?auto_14447 - SURFACE
      ?auto_14442 - PLACE
      ?auto_14439 - HOIST
      ?auto_14444 - SURFACE
      ?auto_14438 - SURFACE
      ?auto_14434 - PLACE
      ?auto_14431 - HOIST
      ?auto_14450 - SURFACE
      ?auto_14435 - PLACE
      ?auto_14446 - HOIST
      ?auto_14436 - SURFACE
      ?auto_14452 - PLACE
      ?auto_14432 - HOIST
      ?auto_14441 - SURFACE
      ?auto_14437 - PLACE
      ?auto_14440 - HOIST
      ?auto_14445 - SURFACE
      ?auto_14449 - SURFACE
      ?auto_14448 - SURFACE
      ?auto_14425 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14426 ?auto_14429 ) ( IS-CRATE ?auto_14423 ) ( not ( = ?auto_14427 ?auto_14429 ) ) ( HOIST-AT ?auto_14430 ?auto_14427 ) ( AVAILABLE ?auto_14430 ) ( SURFACE-AT ?auto_14423 ?auto_14427 ) ( ON ?auto_14423 ?auto_14428 ) ( CLEAR ?auto_14423 ) ( not ( = ?auto_14424 ?auto_14423 ) ) ( not ( = ?auto_14424 ?auto_14428 ) ) ( not ( = ?auto_14423 ?auto_14428 ) ) ( not ( = ?auto_14426 ?auto_14430 ) ) ( IS-CRATE ?auto_14424 ) ( not ( = ?auto_14451 ?auto_14429 ) ) ( HOIST-AT ?auto_14453 ?auto_14451 ) ( SURFACE-AT ?auto_14424 ?auto_14451 ) ( ON ?auto_14424 ?auto_14454 ) ( CLEAR ?auto_14424 ) ( not ( = ?auto_14419 ?auto_14424 ) ) ( not ( = ?auto_14419 ?auto_14454 ) ) ( not ( = ?auto_14424 ?auto_14454 ) ) ( not ( = ?auto_14426 ?auto_14453 ) ) ( IS-CRATE ?auto_14419 ) ( not ( = ?auto_14443 ?auto_14429 ) ) ( HOIST-AT ?auto_14433 ?auto_14443 ) ( SURFACE-AT ?auto_14419 ?auto_14443 ) ( ON ?auto_14419 ?auto_14447 ) ( CLEAR ?auto_14419 ) ( not ( = ?auto_14421 ?auto_14419 ) ) ( not ( = ?auto_14421 ?auto_14447 ) ) ( not ( = ?auto_14419 ?auto_14447 ) ) ( not ( = ?auto_14426 ?auto_14433 ) ) ( IS-CRATE ?auto_14421 ) ( not ( = ?auto_14442 ?auto_14429 ) ) ( HOIST-AT ?auto_14439 ?auto_14442 ) ( SURFACE-AT ?auto_14421 ?auto_14442 ) ( ON ?auto_14421 ?auto_14444 ) ( CLEAR ?auto_14421 ) ( not ( = ?auto_14422 ?auto_14421 ) ) ( not ( = ?auto_14422 ?auto_14444 ) ) ( not ( = ?auto_14421 ?auto_14444 ) ) ( not ( = ?auto_14426 ?auto_14439 ) ) ( IS-CRATE ?auto_14422 ) ( AVAILABLE ?auto_14433 ) ( SURFACE-AT ?auto_14422 ?auto_14443 ) ( ON ?auto_14422 ?auto_14438 ) ( CLEAR ?auto_14422 ) ( not ( = ?auto_14418 ?auto_14422 ) ) ( not ( = ?auto_14418 ?auto_14438 ) ) ( not ( = ?auto_14422 ?auto_14438 ) ) ( IS-CRATE ?auto_14418 ) ( not ( = ?auto_14434 ?auto_14429 ) ) ( HOIST-AT ?auto_14431 ?auto_14434 ) ( AVAILABLE ?auto_14431 ) ( SURFACE-AT ?auto_14418 ?auto_14434 ) ( ON ?auto_14418 ?auto_14450 ) ( CLEAR ?auto_14418 ) ( not ( = ?auto_14420 ?auto_14418 ) ) ( not ( = ?auto_14420 ?auto_14450 ) ) ( not ( = ?auto_14418 ?auto_14450 ) ) ( not ( = ?auto_14426 ?auto_14431 ) ) ( IS-CRATE ?auto_14420 ) ( not ( = ?auto_14435 ?auto_14429 ) ) ( HOIST-AT ?auto_14446 ?auto_14435 ) ( AVAILABLE ?auto_14446 ) ( SURFACE-AT ?auto_14420 ?auto_14435 ) ( ON ?auto_14420 ?auto_14436 ) ( CLEAR ?auto_14420 ) ( not ( = ?auto_14417 ?auto_14420 ) ) ( not ( = ?auto_14417 ?auto_14436 ) ) ( not ( = ?auto_14420 ?auto_14436 ) ) ( not ( = ?auto_14426 ?auto_14446 ) ) ( IS-CRATE ?auto_14417 ) ( not ( = ?auto_14452 ?auto_14429 ) ) ( HOIST-AT ?auto_14432 ?auto_14452 ) ( AVAILABLE ?auto_14432 ) ( SURFACE-AT ?auto_14417 ?auto_14452 ) ( ON ?auto_14417 ?auto_14441 ) ( CLEAR ?auto_14417 ) ( not ( = ?auto_14416 ?auto_14417 ) ) ( not ( = ?auto_14416 ?auto_14441 ) ) ( not ( = ?auto_14417 ?auto_14441 ) ) ( not ( = ?auto_14426 ?auto_14432 ) ) ( IS-CRATE ?auto_14416 ) ( not ( = ?auto_14437 ?auto_14429 ) ) ( HOIST-AT ?auto_14440 ?auto_14437 ) ( AVAILABLE ?auto_14440 ) ( SURFACE-AT ?auto_14416 ?auto_14437 ) ( ON ?auto_14416 ?auto_14445 ) ( CLEAR ?auto_14416 ) ( not ( = ?auto_14415 ?auto_14416 ) ) ( not ( = ?auto_14415 ?auto_14445 ) ) ( not ( = ?auto_14416 ?auto_14445 ) ) ( not ( = ?auto_14426 ?auto_14440 ) ) ( IS-CRATE ?auto_14415 ) ( AVAILABLE ?auto_14453 ) ( SURFACE-AT ?auto_14415 ?auto_14451 ) ( ON ?auto_14415 ?auto_14449 ) ( CLEAR ?auto_14415 ) ( not ( = ?auto_14414 ?auto_14415 ) ) ( not ( = ?auto_14414 ?auto_14449 ) ) ( not ( = ?auto_14415 ?auto_14449 ) ) ( SURFACE-AT ?auto_14413 ?auto_14429 ) ( CLEAR ?auto_14413 ) ( IS-CRATE ?auto_14414 ) ( AVAILABLE ?auto_14426 ) ( AVAILABLE ?auto_14439 ) ( SURFACE-AT ?auto_14414 ?auto_14442 ) ( ON ?auto_14414 ?auto_14448 ) ( CLEAR ?auto_14414 ) ( TRUCK-AT ?auto_14425 ?auto_14429 ) ( not ( = ?auto_14413 ?auto_14414 ) ) ( not ( = ?auto_14413 ?auto_14448 ) ) ( not ( = ?auto_14414 ?auto_14448 ) ) ( not ( = ?auto_14413 ?auto_14415 ) ) ( not ( = ?auto_14413 ?auto_14449 ) ) ( not ( = ?auto_14415 ?auto_14448 ) ) ( not ( = ?auto_14451 ?auto_14442 ) ) ( not ( = ?auto_14453 ?auto_14439 ) ) ( not ( = ?auto_14449 ?auto_14448 ) ) ( not ( = ?auto_14413 ?auto_14416 ) ) ( not ( = ?auto_14413 ?auto_14445 ) ) ( not ( = ?auto_14414 ?auto_14416 ) ) ( not ( = ?auto_14414 ?auto_14445 ) ) ( not ( = ?auto_14416 ?auto_14449 ) ) ( not ( = ?auto_14416 ?auto_14448 ) ) ( not ( = ?auto_14437 ?auto_14451 ) ) ( not ( = ?auto_14437 ?auto_14442 ) ) ( not ( = ?auto_14440 ?auto_14453 ) ) ( not ( = ?auto_14440 ?auto_14439 ) ) ( not ( = ?auto_14445 ?auto_14449 ) ) ( not ( = ?auto_14445 ?auto_14448 ) ) ( not ( = ?auto_14413 ?auto_14417 ) ) ( not ( = ?auto_14413 ?auto_14441 ) ) ( not ( = ?auto_14414 ?auto_14417 ) ) ( not ( = ?auto_14414 ?auto_14441 ) ) ( not ( = ?auto_14415 ?auto_14417 ) ) ( not ( = ?auto_14415 ?auto_14441 ) ) ( not ( = ?auto_14417 ?auto_14445 ) ) ( not ( = ?auto_14417 ?auto_14449 ) ) ( not ( = ?auto_14417 ?auto_14448 ) ) ( not ( = ?auto_14452 ?auto_14437 ) ) ( not ( = ?auto_14452 ?auto_14451 ) ) ( not ( = ?auto_14452 ?auto_14442 ) ) ( not ( = ?auto_14432 ?auto_14440 ) ) ( not ( = ?auto_14432 ?auto_14453 ) ) ( not ( = ?auto_14432 ?auto_14439 ) ) ( not ( = ?auto_14441 ?auto_14445 ) ) ( not ( = ?auto_14441 ?auto_14449 ) ) ( not ( = ?auto_14441 ?auto_14448 ) ) ( not ( = ?auto_14413 ?auto_14420 ) ) ( not ( = ?auto_14413 ?auto_14436 ) ) ( not ( = ?auto_14414 ?auto_14420 ) ) ( not ( = ?auto_14414 ?auto_14436 ) ) ( not ( = ?auto_14415 ?auto_14420 ) ) ( not ( = ?auto_14415 ?auto_14436 ) ) ( not ( = ?auto_14416 ?auto_14420 ) ) ( not ( = ?auto_14416 ?auto_14436 ) ) ( not ( = ?auto_14420 ?auto_14441 ) ) ( not ( = ?auto_14420 ?auto_14445 ) ) ( not ( = ?auto_14420 ?auto_14449 ) ) ( not ( = ?auto_14420 ?auto_14448 ) ) ( not ( = ?auto_14435 ?auto_14452 ) ) ( not ( = ?auto_14435 ?auto_14437 ) ) ( not ( = ?auto_14435 ?auto_14451 ) ) ( not ( = ?auto_14435 ?auto_14442 ) ) ( not ( = ?auto_14446 ?auto_14432 ) ) ( not ( = ?auto_14446 ?auto_14440 ) ) ( not ( = ?auto_14446 ?auto_14453 ) ) ( not ( = ?auto_14446 ?auto_14439 ) ) ( not ( = ?auto_14436 ?auto_14441 ) ) ( not ( = ?auto_14436 ?auto_14445 ) ) ( not ( = ?auto_14436 ?auto_14449 ) ) ( not ( = ?auto_14436 ?auto_14448 ) ) ( not ( = ?auto_14413 ?auto_14418 ) ) ( not ( = ?auto_14413 ?auto_14450 ) ) ( not ( = ?auto_14414 ?auto_14418 ) ) ( not ( = ?auto_14414 ?auto_14450 ) ) ( not ( = ?auto_14415 ?auto_14418 ) ) ( not ( = ?auto_14415 ?auto_14450 ) ) ( not ( = ?auto_14416 ?auto_14418 ) ) ( not ( = ?auto_14416 ?auto_14450 ) ) ( not ( = ?auto_14417 ?auto_14418 ) ) ( not ( = ?auto_14417 ?auto_14450 ) ) ( not ( = ?auto_14418 ?auto_14436 ) ) ( not ( = ?auto_14418 ?auto_14441 ) ) ( not ( = ?auto_14418 ?auto_14445 ) ) ( not ( = ?auto_14418 ?auto_14449 ) ) ( not ( = ?auto_14418 ?auto_14448 ) ) ( not ( = ?auto_14434 ?auto_14435 ) ) ( not ( = ?auto_14434 ?auto_14452 ) ) ( not ( = ?auto_14434 ?auto_14437 ) ) ( not ( = ?auto_14434 ?auto_14451 ) ) ( not ( = ?auto_14434 ?auto_14442 ) ) ( not ( = ?auto_14431 ?auto_14446 ) ) ( not ( = ?auto_14431 ?auto_14432 ) ) ( not ( = ?auto_14431 ?auto_14440 ) ) ( not ( = ?auto_14431 ?auto_14453 ) ) ( not ( = ?auto_14431 ?auto_14439 ) ) ( not ( = ?auto_14450 ?auto_14436 ) ) ( not ( = ?auto_14450 ?auto_14441 ) ) ( not ( = ?auto_14450 ?auto_14445 ) ) ( not ( = ?auto_14450 ?auto_14449 ) ) ( not ( = ?auto_14450 ?auto_14448 ) ) ( not ( = ?auto_14413 ?auto_14422 ) ) ( not ( = ?auto_14413 ?auto_14438 ) ) ( not ( = ?auto_14414 ?auto_14422 ) ) ( not ( = ?auto_14414 ?auto_14438 ) ) ( not ( = ?auto_14415 ?auto_14422 ) ) ( not ( = ?auto_14415 ?auto_14438 ) ) ( not ( = ?auto_14416 ?auto_14422 ) ) ( not ( = ?auto_14416 ?auto_14438 ) ) ( not ( = ?auto_14417 ?auto_14422 ) ) ( not ( = ?auto_14417 ?auto_14438 ) ) ( not ( = ?auto_14420 ?auto_14422 ) ) ( not ( = ?auto_14420 ?auto_14438 ) ) ( not ( = ?auto_14422 ?auto_14450 ) ) ( not ( = ?auto_14422 ?auto_14436 ) ) ( not ( = ?auto_14422 ?auto_14441 ) ) ( not ( = ?auto_14422 ?auto_14445 ) ) ( not ( = ?auto_14422 ?auto_14449 ) ) ( not ( = ?auto_14422 ?auto_14448 ) ) ( not ( = ?auto_14443 ?auto_14434 ) ) ( not ( = ?auto_14443 ?auto_14435 ) ) ( not ( = ?auto_14443 ?auto_14452 ) ) ( not ( = ?auto_14443 ?auto_14437 ) ) ( not ( = ?auto_14443 ?auto_14451 ) ) ( not ( = ?auto_14443 ?auto_14442 ) ) ( not ( = ?auto_14433 ?auto_14431 ) ) ( not ( = ?auto_14433 ?auto_14446 ) ) ( not ( = ?auto_14433 ?auto_14432 ) ) ( not ( = ?auto_14433 ?auto_14440 ) ) ( not ( = ?auto_14433 ?auto_14453 ) ) ( not ( = ?auto_14433 ?auto_14439 ) ) ( not ( = ?auto_14438 ?auto_14450 ) ) ( not ( = ?auto_14438 ?auto_14436 ) ) ( not ( = ?auto_14438 ?auto_14441 ) ) ( not ( = ?auto_14438 ?auto_14445 ) ) ( not ( = ?auto_14438 ?auto_14449 ) ) ( not ( = ?auto_14438 ?auto_14448 ) ) ( not ( = ?auto_14413 ?auto_14421 ) ) ( not ( = ?auto_14413 ?auto_14444 ) ) ( not ( = ?auto_14414 ?auto_14421 ) ) ( not ( = ?auto_14414 ?auto_14444 ) ) ( not ( = ?auto_14415 ?auto_14421 ) ) ( not ( = ?auto_14415 ?auto_14444 ) ) ( not ( = ?auto_14416 ?auto_14421 ) ) ( not ( = ?auto_14416 ?auto_14444 ) ) ( not ( = ?auto_14417 ?auto_14421 ) ) ( not ( = ?auto_14417 ?auto_14444 ) ) ( not ( = ?auto_14420 ?auto_14421 ) ) ( not ( = ?auto_14420 ?auto_14444 ) ) ( not ( = ?auto_14418 ?auto_14421 ) ) ( not ( = ?auto_14418 ?auto_14444 ) ) ( not ( = ?auto_14421 ?auto_14438 ) ) ( not ( = ?auto_14421 ?auto_14450 ) ) ( not ( = ?auto_14421 ?auto_14436 ) ) ( not ( = ?auto_14421 ?auto_14441 ) ) ( not ( = ?auto_14421 ?auto_14445 ) ) ( not ( = ?auto_14421 ?auto_14449 ) ) ( not ( = ?auto_14421 ?auto_14448 ) ) ( not ( = ?auto_14444 ?auto_14438 ) ) ( not ( = ?auto_14444 ?auto_14450 ) ) ( not ( = ?auto_14444 ?auto_14436 ) ) ( not ( = ?auto_14444 ?auto_14441 ) ) ( not ( = ?auto_14444 ?auto_14445 ) ) ( not ( = ?auto_14444 ?auto_14449 ) ) ( not ( = ?auto_14444 ?auto_14448 ) ) ( not ( = ?auto_14413 ?auto_14419 ) ) ( not ( = ?auto_14413 ?auto_14447 ) ) ( not ( = ?auto_14414 ?auto_14419 ) ) ( not ( = ?auto_14414 ?auto_14447 ) ) ( not ( = ?auto_14415 ?auto_14419 ) ) ( not ( = ?auto_14415 ?auto_14447 ) ) ( not ( = ?auto_14416 ?auto_14419 ) ) ( not ( = ?auto_14416 ?auto_14447 ) ) ( not ( = ?auto_14417 ?auto_14419 ) ) ( not ( = ?auto_14417 ?auto_14447 ) ) ( not ( = ?auto_14420 ?auto_14419 ) ) ( not ( = ?auto_14420 ?auto_14447 ) ) ( not ( = ?auto_14418 ?auto_14419 ) ) ( not ( = ?auto_14418 ?auto_14447 ) ) ( not ( = ?auto_14422 ?auto_14419 ) ) ( not ( = ?auto_14422 ?auto_14447 ) ) ( not ( = ?auto_14419 ?auto_14444 ) ) ( not ( = ?auto_14419 ?auto_14438 ) ) ( not ( = ?auto_14419 ?auto_14450 ) ) ( not ( = ?auto_14419 ?auto_14436 ) ) ( not ( = ?auto_14419 ?auto_14441 ) ) ( not ( = ?auto_14419 ?auto_14445 ) ) ( not ( = ?auto_14419 ?auto_14449 ) ) ( not ( = ?auto_14419 ?auto_14448 ) ) ( not ( = ?auto_14447 ?auto_14444 ) ) ( not ( = ?auto_14447 ?auto_14438 ) ) ( not ( = ?auto_14447 ?auto_14450 ) ) ( not ( = ?auto_14447 ?auto_14436 ) ) ( not ( = ?auto_14447 ?auto_14441 ) ) ( not ( = ?auto_14447 ?auto_14445 ) ) ( not ( = ?auto_14447 ?auto_14449 ) ) ( not ( = ?auto_14447 ?auto_14448 ) ) ( not ( = ?auto_14413 ?auto_14424 ) ) ( not ( = ?auto_14413 ?auto_14454 ) ) ( not ( = ?auto_14414 ?auto_14424 ) ) ( not ( = ?auto_14414 ?auto_14454 ) ) ( not ( = ?auto_14415 ?auto_14424 ) ) ( not ( = ?auto_14415 ?auto_14454 ) ) ( not ( = ?auto_14416 ?auto_14424 ) ) ( not ( = ?auto_14416 ?auto_14454 ) ) ( not ( = ?auto_14417 ?auto_14424 ) ) ( not ( = ?auto_14417 ?auto_14454 ) ) ( not ( = ?auto_14420 ?auto_14424 ) ) ( not ( = ?auto_14420 ?auto_14454 ) ) ( not ( = ?auto_14418 ?auto_14424 ) ) ( not ( = ?auto_14418 ?auto_14454 ) ) ( not ( = ?auto_14422 ?auto_14424 ) ) ( not ( = ?auto_14422 ?auto_14454 ) ) ( not ( = ?auto_14421 ?auto_14424 ) ) ( not ( = ?auto_14421 ?auto_14454 ) ) ( not ( = ?auto_14424 ?auto_14447 ) ) ( not ( = ?auto_14424 ?auto_14444 ) ) ( not ( = ?auto_14424 ?auto_14438 ) ) ( not ( = ?auto_14424 ?auto_14450 ) ) ( not ( = ?auto_14424 ?auto_14436 ) ) ( not ( = ?auto_14424 ?auto_14441 ) ) ( not ( = ?auto_14424 ?auto_14445 ) ) ( not ( = ?auto_14424 ?auto_14449 ) ) ( not ( = ?auto_14424 ?auto_14448 ) ) ( not ( = ?auto_14454 ?auto_14447 ) ) ( not ( = ?auto_14454 ?auto_14444 ) ) ( not ( = ?auto_14454 ?auto_14438 ) ) ( not ( = ?auto_14454 ?auto_14450 ) ) ( not ( = ?auto_14454 ?auto_14436 ) ) ( not ( = ?auto_14454 ?auto_14441 ) ) ( not ( = ?auto_14454 ?auto_14445 ) ) ( not ( = ?auto_14454 ?auto_14449 ) ) ( not ( = ?auto_14454 ?auto_14448 ) ) ( not ( = ?auto_14413 ?auto_14423 ) ) ( not ( = ?auto_14413 ?auto_14428 ) ) ( not ( = ?auto_14414 ?auto_14423 ) ) ( not ( = ?auto_14414 ?auto_14428 ) ) ( not ( = ?auto_14415 ?auto_14423 ) ) ( not ( = ?auto_14415 ?auto_14428 ) ) ( not ( = ?auto_14416 ?auto_14423 ) ) ( not ( = ?auto_14416 ?auto_14428 ) ) ( not ( = ?auto_14417 ?auto_14423 ) ) ( not ( = ?auto_14417 ?auto_14428 ) ) ( not ( = ?auto_14420 ?auto_14423 ) ) ( not ( = ?auto_14420 ?auto_14428 ) ) ( not ( = ?auto_14418 ?auto_14423 ) ) ( not ( = ?auto_14418 ?auto_14428 ) ) ( not ( = ?auto_14422 ?auto_14423 ) ) ( not ( = ?auto_14422 ?auto_14428 ) ) ( not ( = ?auto_14421 ?auto_14423 ) ) ( not ( = ?auto_14421 ?auto_14428 ) ) ( not ( = ?auto_14419 ?auto_14423 ) ) ( not ( = ?auto_14419 ?auto_14428 ) ) ( not ( = ?auto_14423 ?auto_14454 ) ) ( not ( = ?auto_14423 ?auto_14447 ) ) ( not ( = ?auto_14423 ?auto_14444 ) ) ( not ( = ?auto_14423 ?auto_14438 ) ) ( not ( = ?auto_14423 ?auto_14450 ) ) ( not ( = ?auto_14423 ?auto_14436 ) ) ( not ( = ?auto_14423 ?auto_14441 ) ) ( not ( = ?auto_14423 ?auto_14445 ) ) ( not ( = ?auto_14423 ?auto_14449 ) ) ( not ( = ?auto_14423 ?auto_14448 ) ) ( not ( = ?auto_14427 ?auto_14451 ) ) ( not ( = ?auto_14427 ?auto_14443 ) ) ( not ( = ?auto_14427 ?auto_14442 ) ) ( not ( = ?auto_14427 ?auto_14434 ) ) ( not ( = ?auto_14427 ?auto_14435 ) ) ( not ( = ?auto_14427 ?auto_14452 ) ) ( not ( = ?auto_14427 ?auto_14437 ) ) ( not ( = ?auto_14430 ?auto_14453 ) ) ( not ( = ?auto_14430 ?auto_14433 ) ) ( not ( = ?auto_14430 ?auto_14439 ) ) ( not ( = ?auto_14430 ?auto_14431 ) ) ( not ( = ?auto_14430 ?auto_14446 ) ) ( not ( = ?auto_14430 ?auto_14432 ) ) ( not ( = ?auto_14430 ?auto_14440 ) ) ( not ( = ?auto_14428 ?auto_14454 ) ) ( not ( = ?auto_14428 ?auto_14447 ) ) ( not ( = ?auto_14428 ?auto_14444 ) ) ( not ( = ?auto_14428 ?auto_14438 ) ) ( not ( = ?auto_14428 ?auto_14450 ) ) ( not ( = ?auto_14428 ?auto_14436 ) ) ( not ( = ?auto_14428 ?auto_14441 ) ) ( not ( = ?auto_14428 ?auto_14445 ) ) ( not ( = ?auto_14428 ?auto_14449 ) ) ( not ( = ?auto_14428 ?auto_14448 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_14413 ?auto_14414 ?auto_14415 ?auto_14416 ?auto_14417 ?auto_14420 ?auto_14418 ?auto_14422 ?auto_14421 ?auto_14419 ?auto_14424 )
      ( MAKE-1CRATE ?auto_14424 ?auto_14423 )
      ( MAKE-11CRATE-VERIFY ?auto_14413 ?auto_14414 ?auto_14415 ?auto_14416 ?auto_14417 ?auto_14420 ?auto_14418 ?auto_14422 ?auto_14421 ?auto_14419 ?auto_14424 ?auto_14423 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14457 - SURFACE
      ?auto_14458 - SURFACE
    )
    :vars
    (
      ?auto_14459 - HOIST
      ?auto_14460 - PLACE
      ?auto_14462 - PLACE
      ?auto_14463 - HOIST
      ?auto_14464 - SURFACE
      ?auto_14461 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14459 ?auto_14460 ) ( SURFACE-AT ?auto_14457 ?auto_14460 ) ( CLEAR ?auto_14457 ) ( IS-CRATE ?auto_14458 ) ( AVAILABLE ?auto_14459 ) ( not ( = ?auto_14462 ?auto_14460 ) ) ( HOIST-AT ?auto_14463 ?auto_14462 ) ( AVAILABLE ?auto_14463 ) ( SURFACE-AT ?auto_14458 ?auto_14462 ) ( ON ?auto_14458 ?auto_14464 ) ( CLEAR ?auto_14458 ) ( TRUCK-AT ?auto_14461 ?auto_14460 ) ( not ( = ?auto_14457 ?auto_14458 ) ) ( not ( = ?auto_14457 ?auto_14464 ) ) ( not ( = ?auto_14458 ?auto_14464 ) ) ( not ( = ?auto_14459 ?auto_14463 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14461 ?auto_14460 ?auto_14462 )
      ( !LIFT ?auto_14463 ?auto_14458 ?auto_14464 ?auto_14462 )
      ( !LOAD ?auto_14463 ?auto_14458 ?auto_14461 ?auto_14462 )
      ( !DRIVE ?auto_14461 ?auto_14462 ?auto_14460 )
      ( !UNLOAD ?auto_14459 ?auto_14458 ?auto_14461 ?auto_14460 )
      ( !DROP ?auto_14459 ?auto_14458 ?auto_14457 ?auto_14460 )
      ( MAKE-1CRATE-VERIFY ?auto_14457 ?auto_14458 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_14478 - SURFACE
      ?auto_14479 - SURFACE
      ?auto_14480 - SURFACE
      ?auto_14481 - SURFACE
      ?auto_14482 - SURFACE
      ?auto_14485 - SURFACE
      ?auto_14483 - SURFACE
      ?auto_14487 - SURFACE
      ?auto_14486 - SURFACE
      ?auto_14484 - SURFACE
      ?auto_14489 - SURFACE
      ?auto_14488 - SURFACE
      ?auto_14490 - SURFACE
    )
    :vars
    (
      ?auto_14491 - HOIST
      ?auto_14492 - PLACE
      ?auto_14496 - PLACE
      ?auto_14495 - HOIST
      ?auto_14493 - SURFACE
      ?auto_14518 - PLACE
      ?auto_14505 - HOIST
      ?auto_14499 - SURFACE
      ?auto_14514 - PLACE
      ?auto_14520 - HOIST
      ?auto_14507 - SURFACE
      ?auto_14513 - PLACE
      ?auto_14508 - HOIST
      ?auto_14509 - SURFACE
      ?auto_14504 - PLACE
      ?auto_14521 - HOIST
      ?auto_14500 - SURFACE
      ?auto_14512 - SURFACE
      ?auto_14497 - SURFACE
      ?auto_14503 - PLACE
      ?auto_14516 - HOIST
      ?auto_14517 - SURFACE
      ?auto_14498 - PLACE
      ?auto_14506 - HOIST
      ?auto_14501 - SURFACE
      ?auto_14510 - PLACE
      ?auto_14502 - HOIST
      ?auto_14515 - SURFACE
      ?auto_14519 - SURFACE
      ?auto_14511 - SURFACE
      ?auto_14494 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14491 ?auto_14492 ) ( IS-CRATE ?auto_14490 ) ( not ( = ?auto_14496 ?auto_14492 ) ) ( HOIST-AT ?auto_14495 ?auto_14496 ) ( SURFACE-AT ?auto_14490 ?auto_14496 ) ( ON ?auto_14490 ?auto_14493 ) ( CLEAR ?auto_14490 ) ( not ( = ?auto_14488 ?auto_14490 ) ) ( not ( = ?auto_14488 ?auto_14493 ) ) ( not ( = ?auto_14490 ?auto_14493 ) ) ( not ( = ?auto_14491 ?auto_14495 ) ) ( IS-CRATE ?auto_14488 ) ( not ( = ?auto_14518 ?auto_14492 ) ) ( HOIST-AT ?auto_14505 ?auto_14518 ) ( AVAILABLE ?auto_14505 ) ( SURFACE-AT ?auto_14488 ?auto_14518 ) ( ON ?auto_14488 ?auto_14499 ) ( CLEAR ?auto_14488 ) ( not ( = ?auto_14489 ?auto_14488 ) ) ( not ( = ?auto_14489 ?auto_14499 ) ) ( not ( = ?auto_14488 ?auto_14499 ) ) ( not ( = ?auto_14491 ?auto_14505 ) ) ( IS-CRATE ?auto_14489 ) ( not ( = ?auto_14514 ?auto_14492 ) ) ( HOIST-AT ?auto_14520 ?auto_14514 ) ( SURFACE-AT ?auto_14489 ?auto_14514 ) ( ON ?auto_14489 ?auto_14507 ) ( CLEAR ?auto_14489 ) ( not ( = ?auto_14484 ?auto_14489 ) ) ( not ( = ?auto_14484 ?auto_14507 ) ) ( not ( = ?auto_14489 ?auto_14507 ) ) ( not ( = ?auto_14491 ?auto_14520 ) ) ( IS-CRATE ?auto_14484 ) ( not ( = ?auto_14513 ?auto_14492 ) ) ( HOIST-AT ?auto_14508 ?auto_14513 ) ( SURFACE-AT ?auto_14484 ?auto_14513 ) ( ON ?auto_14484 ?auto_14509 ) ( CLEAR ?auto_14484 ) ( not ( = ?auto_14486 ?auto_14484 ) ) ( not ( = ?auto_14486 ?auto_14509 ) ) ( not ( = ?auto_14484 ?auto_14509 ) ) ( not ( = ?auto_14491 ?auto_14508 ) ) ( IS-CRATE ?auto_14486 ) ( not ( = ?auto_14504 ?auto_14492 ) ) ( HOIST-AT ?auto_14521 ?auto_14504 ) ( SURFACE-AT ?auto_14486 ?auto_14504 ) ( ON ?auto_14486 ?auto_14500 ) ( CLEAR ?auto_14486 ) ( not ( = ?auto_14487 ?auto_14486 ) ) ( not ( = ?auto_14487 ?auto_14500 ) ) ( not ( = ?auto_14486 ?auto_14500 ) ) ( not ( = ?auto_14491 ?auto_14521 ) ) ( IS-CRATE ?auto_14487 ) ( AVAILABLE ?auto_14508 ) ( SURFACE-AT ?auto_14487 ?auto_14513 ) ( ON ?auto_14487 ?auto_14512 ) ( CLEAR ?auto_14487 ) ( not ( = ?auto_14483 ?auto_14487 ) ) ( not ( = ?auto_14483 ?auto_14512 ) ) ( not ( = ?auto_14487 ?auto_14512 ) ) ( IS-CRATE ?auto_14483 ) ( AVAILABLE ?auto_14495 ) ( SURFACE-AT ?auto_14483 ?auto_14496 ) ( ON ?auto_14483 ?auto_14497 ) ( CLEAR ?auto_14483 ) ( not ( = ?auto_14485 ?auto_14483 ) ) ( not ( = ?auto_14485 ?auto_14497 ) ) ( not ( = ?auto_14483 ?auto_14497 ) ) ( IS-CRATE ?auto_14485 ) ( not ( = ?auto_14503 ?auto_14492 ) ) ( HOIST-AT ?auto_14516 ?auto_14503 ) ( AVAILABLE ?auto_14516 ) ( SURFACE-AT ?auto_14485 ?auto_14503 ) ( ON ?auto_14485 ?auto_14517 ) ( CLEAR ?auto_14485 ) ( not ( = ?auto_14482 ?auto_14485 ) ) ( not ( = ?auto_14482 ?auto_14517 ) ) ( not ( = ?auto_14485 ?auto_14517 ) ) ( not ( = ?auto_14491 ?auto_14516 ) ) ( IS-CRATE ?auto_14482 ) ( not ( = ?auto_14498 ?auto_14492 ) ) ( HOIST-AT ?auto_14506 ?auto_14498 ) ( AVAILABLE ?auto_14506 ) ( SURFACE-AT ?auto_14482 ?auto_14498 ) ( ON ?auto_14482 ?auto_14501 ) ( CLEAR ?auto_14482 ) ( not ( = ?auto_14481 ?auto_14482 ) ) ( not ( = ?auto_14481 ?auto_14501 ) ) ( not ( = ?auto_14482 ?auto_14501 ) ) ( not ( = ?auto_14491 ?auto_14506 ) ) ( IS-CRATE ?auto_14481 ) ( not ( = ?auto_14510 ?auto_14492 ) ) ( HOIST-AT ?auto_14502 ?auto_14510 ) ( AVAILABLE ?auto_14502 ) ( SURFACE-AT ?auto_14481 ?auto_14510 ) ( ON ?auto_14481 ?auto_14515 ) ( CLEAR ?auto_14481 ) ( not ( = ?auto_14480 ?auto_14481 ) ) ( not ( = ?auto_14480 ?auto_14515 ) ) ( not ( = ?auto_14481 ?auto_14515 ) ) ( not ( = ?auto_14491 ?auto_14502 ) ) ( IS-CRATE ?auto_14480 ) ( AVAILABLE ?auto_14520 ) ( SURFACE-AT ?auto_14480 ?auto_14514 ) ( ON ?auto_14480 ?auto_14519 ) ( CLEAR ?auto_14480 ) ( not ( = ?auto_14479 ?auto_14480 ) ) ( not ( = ?auto_14479 ?auto_14519 ) ) ( not ( = ?auto_14480 ?auto_14519 ) ) ( SURFACE-AT ?auto_14478 ?auto_14492 ) ( CLEAR ?auto_14478 ) ( IS-CRATE ?auto_14479 ) ( AVAILABLE ?auto_14491 ) ( AVAILABLE ?auto_14521 ) ( SURFACE-AT ?auto_14479 ?auto_14504 ) ( ON ?auto_14479 ?auto_14511 ) ( CLEAR ?auto_14479 ) ( TRUCK-AT ?auto_14494 ?auto_14492 ) ( not ( = ?auto_14478 ?auto_14479 ) ) ( not ( = ?auto_14478 ?auto_14511 ) ) ( not ( = ?auto_14479 ?auto_14511 ) ) ( not ( = ?auto_14478 ?auto_14480 ) ) ( not ( = ?auto_14478 ?auto_14519 ) ) ( not ( = ?auto_14480 ?auto_14511 ) ) ( not ( = ?auto_14514 ?auto_14504 ) ) ( not ( = ?auto_14520 ?auto_14521 ) ) ( not ( = ?auto_14519 ?auto_14511 ) ) ( not ( = ?auto_14478 ?auto_14481 ) ) ( not ( = ?auto_14478 ?auto_14515 ) ) ( not ( = ?auto_14479 ?auto_14481 ) ) ( not ( = ?auto_14479 ?auto_14515 ) ) ( not ( = ?auto_14481 ?auto_14519 ) ) ( not ( = ?auto_14481 ?auto_14511 ) ) ( not ( = ?auto_14510 ?auto_14514 ) ) ( not ( = ?auto_14510 ?auto_14504 ) ) ( not ( = ?auto_14502 ?auto_14520 ) ) ( not ( = ?auto_14502 ?auto_14521 ) ) ( not ( = ?auto_14515 ?auto_14519 ) ) ( not ( = ?auto_14515 ?auto_14511 ) ) ( not ( = ?auto_14478 ?auto_14482 ) ) ( not ( = ?auto_14478 ?auto_14501 ) ) ( not ( = ?auto_14479 ?auto_14482 ) ) ( not ( = ?auto_14479 ?auto_14501 ) ) ( not ( = ?auto_14480 ?auto_14482 ) ) ( not ( = ?auto_14480 ?auto_14501 ) ) ( not ( = ?auto_14482 ?auto_14515 ) ) ( not ( = ?auto_14482 ?auto_14519 ) ) ( not ( = ?auto_14482 ?auto_14511 ) ) ( not ( = ?auto_14498 ?auto_14510 ) ) ( not ( = ?auto_14498 ?auto_14514 ) ) ( not ( = ?auto_14498 ?auto_14504 ) ) ( not ( = ?auto_14506 ?auto_14502 ) ) ( not ( = ?auto_14506 ?auto_14520 ) ) ( not ( = ?auto_14506 ?auto_14521 ) ) ( not ( = ?auto_14501 ?auto_14515 ) ) ( not ( = ?auto_14501 ?auto_14519 ) ) ( not ( = ?auto_14501 ?auto_14511 ) ) ( not ( = ?auto_14478 ?auto_14485 ) ) ( not ( = ?auto_14478 ?auto_14517 ) ) ( not ( = ?auto_14479 ?auto_14485 ) ) ( not ( = ?auto_14479 ?auto_14517 ) ) ( not ( = ?auto_14480 ?auto_14485 ) ) ( not ( = ?auto_14480 ?auto_14517 ) ) ( not ( = ?auto_14481 ?auto_14485 ) ) ( not ( = ?auto_14481 ?auto_14517 ) ) ( not ( = ?auto_14485 ?auto_14501 ) ) ( not ( = ?auto_14485 ?auto_14515 ) ) ( not ( = ?auto_14485 ?auto_14519 ) ) ( not ( = ?auto_14485 ?auto_14511 ) ) ( not ( = ?auto_14503 ?auto_14498 ) ) ( not ( = ?auto_14503 ?auto_14510 ) ) ( not ( = ?auto_14503 ?auto_14514 ) ) ( not ( = ?auto_14503 ?auto_14504 ) ) ( not ( = ?auto_14516 ?auto_14506 ) ) ( not ( = ?auto_14516 ?auto_14502 ) ) ( not ( = ?auto_14516 ?auto_14520 ) ) ( not ( = ?auto_14516 ?auto_14521 ) ) ( not ( = ?auto_14517 ?auto_14501 ) ) ( not ( = ?auto_14517 ?auto_14515 ) ) ( not ( = ?auto_14517 ?auto_14519 ) ) ( not ( = ?auto_14517 ?auto_14511 ) ) ( not ( = ?auto_14478 ?auto_14483 ) ) ( not ( = ?auto_14478 ?auto_14497 ) ) ( not ( = ?auto_14479 ?auto_14483 ) ) ( not ( = ?auto_14479 ?auto_14497 ) ) ( not ( = ?auto_14480 ?auto_14483 ) ) ( not ( = ?auto_14480 ?auto_14497 ) ) ( not ( = ?auto_14481 ?auto_14483 ) ) ( not ( = ?auto_14481 ?auto_14497 ) ) ( not ( = ?auto_14482 ?auto_14483 ) ) ( not ( = ?auto_14482 ?auto_14497 ) ) ( not ( = ?auto_14483 ?auto_14517 ) ) ( not ( = ?auto_14483 ?auto_14501 ) ) ( not ( = ?auto_14483 ?auto_14515 ) ) ( not ( = ?auto_14483 ?auto_14519 ) ) ( not ( = ?auto_14483 ?auto_14511 ) ) ( not ( = ?auto_14496 ?auto_14503 ) ) ( not ( = ?auto_14496 ?auto_14498 ) ) ( not ( = ?auto_14496 ?auto_14510 ) ) ( not ( = ?auto_14496 ?auto_14514 ) ) ( not ( = ?auto_14496 ?auto_14504 ) ) ( not ( = ?auto_14495 ?auto_14516 ) ) ( not ( = ?auto_14495 ?auto_14506 ) ) ( not ( = ?auto_14495 ?auto_14502 ) ) ( not ( = ?auto_14495 ?auto_14520 ) ) ( not ( = ?auto_14495 ?auto_14521 ) ) ( not ( = ?auto_14497 ?auto_14517 ) ) ( not ( = ?auto_14497 ?auto_14501 ) ) ( not ( = ?auto_14497 ?auto_14515 ) ) ( not ( = ?auto_14497 ?auto_14519 ) ) ( not ( = ?auto_14497 ?auto_14511 ) ) ( not ( = ?auto_14478 ?auto_14487 ) ) ( not ( = ?auto_14478 ?auto_14512 ) ) ( not ( = ?auto_14479 ?auto_14487 ) ) ( not ( = ?auto_14479 ?auto_14512 ) ) ( not ( = ?auto_14480 ?auto_14487 ) ) ( not ( = ?auto_14480 ?auto_14512 ) ) ( not ( = ?auto_14481 ?auto_14487 ) ) ( not ( = ?auto_14481 ?auto_14512 ) ) ( not ( = ?auto_14482 ?auto_14487 ) ) ( not ( = ?auto_14482 ?auto_14512 ) ) ( not ( = ?auto_14485 ?auto_14487 ) ) ( not ( = ?auto_14485 ?auto_14512 ) ) ( not ( = ?auto_14487 ?auto_14497 ) ) ( not ( = ?auto_14487 ?auto_14517 ) ) ( not ( = ?auto_14487 ?auto_14501 ) ) ( not ( = ?auto_14487 ?auto_14515 ) ) ( not ( = ?auto_14487 ?auto_14519 ) ) ( not ( = ?auto_14487 ?auto_14511 ) ) ( not ( = ?auto_14513 ?auto_14496 ) ) ( not ( = ?auto_14513 ?auto_14503 ) ) ( not ( = ?auto_14513 ?auto_14498 ) ) ( not ( = ?auto_14513 ?auto_14510 ) ) ( not ( = ?auto_14513 ?auto_14514 ) ) ( not ( = ?auto_14513 ?auto_14504 ) ) ( not ( = ?auto_14508 ?auto_14495 ) ) ( not ( = ?auto_14508 ?auto_14516 ) ) ( not ( = ?auto_14508 ?auto_14506 ) ) ( not ( = ?auto_14508 ?auto_14502 ) ) ( not ( = ?auto_14508 ?auto_14520 ) ) ( not ( = ?auto_14508 ?auto_14521 ) ) ( not ( = ?auto_14512 ?auto_14497 ) ) ( not ( = ?auto_14512 ?auto_14517 ) ) ( not ( = ?auto_14512 ?auto_14501 ) ) ( not ( = ?auto_14512 ?auto_14515 ) ) ( not ( = ?auto_14512 ?auto_14519 ) ) ( not ( = ?auto_14512 ?auto_14511 ) ) ( not ( = ?auto_14478 ?auto_14486 ) ) ( not ( = ?auto_14478 ?auto_14500 ) ) ( not ( = ?auto_14479 ?auto_14486 ) ) ( not ( = ?auto_14479 ?auto_14500 ) ) ( not ( = ?auto_14480 ?auto_14486 ) ) ( not ( = ?auto_14480 ?auto_14500 ) ) ( not ( = ?auto_14481 ?auto_14486 ) ) ( not ( = ?auto_14481 ?auto_14500 ) ) ( not ( = ?auto_14482 ?auto_14486 ) ) ( not ( = ?auto_14482 ?auto_14500 ) ) ( not ( = ?auto_14485 ?auto_14486 ) ) ( not ( = ?auto_14485 ?auto_14500 ) ) ( not ( = ?auto_14483 ?auto_14486 ) ) ( not ( = ?auto_14483 ?auto_14500 ) ) ( not ( = ?auto_14486 ?auto_14512 ) ) ( not ( = ?auto_14486 ?auto_14497 ) ) ( not ( = ?auto_14486 ?auto_14517 ) ) ( not ( = ?auto_14486 ?auto_14501 ) ) ( not ( = ?auto_14486 ?auto_14515 ) ) ( not ( = ?auto_14486 ?auto_14519 ) ) ( not ( = ?auto_14486 ?auto_14511 ) ) ( not ( = ?auto_14500 ?auto_14512 ) ) ( not ( = ?auto_14500 ?auto_14497 ) ) ( not ( = ?auto_14500 ?auto_14517 ) ) ( not ( = ?auto_14500 ?auto_14501 ) ) ( not ( = ?auto_14500 ?auto_14515 ) ) ( not ( = ?auto_14500 ?auto_14519 ) ) ( not ( = ?auto_14500 ?auto_14511 ) ) ( not ( = ?auto_14478 ?auto_14484 ) ) ( not ( = ?auto_14478 ?auto_14509 ) ) ( not ( = ?auto_14479 ?auto_14484 ) ) ( not ( = ?auto_14479 ?auto_14509 ) ) ( not ( = ?auto_14480 ?auto_14484 ) ) ( not ( = ?auto_14480 ?auto_14509 ) ) ( not ( = ?auto_14481 ?auto_14484 ) ) ( not ( = ?auto_14481 ?auto_14509 ) ) ( not ( = ?auto_14482 ?auto_14484 ) ) ( not ( = ?auto_14482 ?auto_14509 ) ) ( not ( = ?auto_14485 ?auto_14484 ) ) ( not ( = ?auto_14485 ?auto_14509 ) ) ( not ( = ?auto_14483 ?auto_14484 ) ) ( not ( = ?auto_14483 ?auto_14509 ) ) ( not ( = ?auto_14487 ?auto_14484 ) ) ( not ( = ?auto_14487 ?auto_14509 ) ) ( not ( = ?auto_14484 ?auto_14500 ) ) ( not ( = ?auto_14484 ?auto_14512 ) ) ( not ( = ?auto_14484 ?auto_14497 ) ) ( not ( = ?auto_14484 ?auto_14517 ) ) ( not ( = ?auto_14484 ?auto_14501 ) ) ( not ( = ?auto_14484 ?auto_14515 ) ) ( not ( = ?auto_14484 ?auto_14519 ) ) ( not ( = ?auto_14484 ?auto_14511 ) ) ( not ( = ?auto_14509 ?auto_14500 ) ) ( not ( = ?auto_14509 ?auto_14512 ) ) ( not ( = ?auto_14509 ?auto_14497 ) ) ( not ( = ?auto_14509 ?auto_14517 ) ) ( not ( = ?auto_14509 ?auto_14501 ) ) ( not ( = ?auto_14509 ?auto_14515 ) ) ( not ( = ?auto_14509 ?auto_14519 ) ) ( not ( = ?auto_14509 ?auto_14511 ) ) ( not ( = ?auto_14478 ?auto_14489 ) ) ( not ( = ?auto_14478 ?auto_14507 ) ) ( not ( = ?auto_14479 ?auto_14489 ) ) ( not ( = ?auto_14479 ?auto_14507 ) ) ( not ( = ?auto_14480 ?auto_14489 ) ) ( not ( = ?auto_14480 ?auto_14507 ) ) ( not ( = ?auto_14481 ?auto_14489 ) ) ( not ( = ?auto_14481 ?auto_14507 ) ) ( not ( = ?auto_14482 ?auto_14489 ) ) ( not ( = ?auto_14482 ?auto_14507 ) ) ( not ( = ?auto_14485 ?auto_14489 ) ) ( not ( = ?auto_14485 ?auto_14507 ) ) ( not ( = ?auto_14483 ?auto_14489 ) ) ( not ( = ?auto_14483 ?auto_14507 ) ) ( not ( = ?auto_14487 ?auto_14489 ) ) ( not ( = ?auto_14487 ?auto_14507 ) ) ( not ( = ?auto_14486 ?auto_14489 ) ) ( not ( = ?auto_14486 ?auto_14507 ) ) ( not ( = ?auto_14489 ?auto_14509 ) ) ( not ( = ?auto_14489 ?auto_14500 ) ) ( not ( = ?auto_14489 ?auto_14512 ) ) ( not ( = ?auto_14489 ?auto_14497 ) ) ( not ( = ?auto_14489 ?auto_14517 ) ) ( not ( = ?auto_14489 ?auto_14501 ) ) ( not ( = ?auto_14489 ?auto_14515 ) ) ( not ( = ?auto_14489 ?auto_14519 ) ) ( not ( = ?auto_14489 ?auto_14511 ) ) ( not ( = ?auto_14507 ?auto_14509 ) ) ( not ( = ?auto_14507 ?auto_14500 ) ) ( not ( = ?auto_14507 ?auto_14512 ) ) ( not ( = ?auto_14507 ?auto_14497 ) ) ( not ( = ?auto_14507 ?auto_14517 ) ) ( not ( = ?auto_14507 ?auto_14501 ) ) ( not ( = ?auto_14507 ?auto_14515 ) ) ( not ( = ?auto_14507 ?auto_14519 ) ) ( not ( = ?auto_14507 ?auto_14511 ) ) ( not ( = ?auto_14478 ?auto_14488 ) ) ( not ( = ?auto_14478 ?auto_14499 ) ) ( not ( = ?auto_14479 ?auto_14488 ) ) ( not ( = ?auto_14479 ?auto_14499 ) ) ( not ( = ?auto_14480 ?auto_14488 ) ) ( not ( = ?auto_14480 ?auto_14499 ) ) ( not ( = ?auto_14481 ?auto_14488 ) ) ( not ( = ?auto_14481 ?auto_14499 ) ) ( not ( = ?auto_14482 ?auto_14488 ) ) ( not ( = ?auto_14482 ?auto_14499 ) ) ( not ( = ?auto_14485 ?auto_14488 ) ) ( not ( = ?auto_14485 ?auto_14499 ) ) ( not ( = ?auto_14483 ?auto_14488 ) ) ( not ( = ?auto_14483 ?auto_14499 ) ) ( not ( = ?auto_14487 ?auto_14488 ) ) ( not ( = ?auto_14487 ?auto_14499 ) ) ( not ( = ?auto_14486 ?auto_14488 ) ) ( not ( = ?auto_14486 ?auto_14499 ) ) ( not ( = ?auto_14484 ?auto_14488 ) ) ( not ( = ?auto_14484 ?auto_14499 ) ) ( not ( = ?auto_14488 ?auto_14507 ) ) ( not ( = ?auto_14488 ?auto_14509 ) ) ( not ( = ?auto_14488 ?auto_14500 ) ) ( not ( = ?auto_14488 ?auto_14512 ) ) ( not ( = ?auto_14488 ?auto_14497 ) ) ( not ( = ?auto_14488 ?auto_14517 ) ) ( not ( = ?auto_14488 ?auto_14501 ) ) ( not ( = ?auto_14488 ?auto_14515 ) ) ( not ( = ?auto_14488 ?auto_14519 ) ) ( not ( = ?auto_14488 ?auto_14511 ) ) ( not ( = ?auto_14518 ?auto_14514 ) ) ( not ( = ?auto_14518 ?auto_14513 ) ) ( not ( = ?auto_14518 ?auto_14504 ) ) ( not ( = ?auto_14518 ?auto_14496 ) ) ( not ( = ?auto_14518 ?auto_14503 ) ) ( not ( = ?auto_14518 ?auto_14498 ) ) ( not ( = ?auto_14518 ?auto_14510 ) ) ( not ( = ?auto_14505 ?auto_14520 ) ) ( not ( = ?auto_14505 ?auto_14508 ) ) ( not ( = ?auto_14505 ?auto_14521 ) ) ( not ( = ?auto_14505 ?auto_14495 ) ) ( not ( = ?auto_14505 ?auto_14516 ) ) ( not ( = ?auto_14505 ?auto_14506 ) ) ( not ( = ?auto_14505 ?auto_14502 ) ) ( not ( = ?auto_14499 ?auto_14507 ) ) ( not ( = ?auto_14499 ?auto_14509 ) ) ( not ( = ?auto_14499 ?auto_14500 ) ) ( not ( = ?auto_14499 ?auto_14512 ) ) ( not ( = ?auto_14499 ?auto_14497 ) ) ( not ( = ?auto_14499 ?auto_14517 ) ) ( not ( = ?auto_14499 ?auto_14501 ) ) ( not ( = ?auto_14499 ?auto_14515 ) ) ( not ( = ?auto_14499 ?auto_14519 ) ) ( not ( = ?auto_14499 ?auto_14511 ) ) ( not ( = ?auto_14478 ?auto_14490 ) ) ( not ( = ?auto_14478 ?auto_14493 ) ) ( not ( = ?auto_14479 ?auto_14490 ) ) ( not ( = ?auto_14479 ?auto_14493 ) ) ( not ( = ?auto_14480 ?auto_14490 ) ) ( not ( = ?auto_14480 ?auto_14493 ) ) ( not ( = ?auto_14481 ?auto_14490 ) ) ( not ( = ?auto_14481 ?auto_14493 ) ) ( not ( = ?auto_14482 ?auto_14490 ) ) ( not ( = ?auto_14482 ?auto_14493 ) ) ( not ( = ?auto_14485 ?auto_14490 ) ) ( not ( = ?auto_14485 ?auto_14493 ) ) ( not ( = ?auto_14483 ?auto_14490 ) ) ( not ( = ?auto_14483 ?auto_14493 ) ) ( not ( = ?auto_14487 ?auto_14490 ) ) ( not ( = ?auto_14487 ?auto_14493 ) ) ( not ( = ?auto_14486 ?auto_14490 ) ) ( not ( = ?auto_14486 ?auto_14493 ) ) ( not ( = ?auto_14484 ?auto_14490 ) ) ( not ( = ?auto_14484 ?auto_14493 ) ) ( not ( = ?auto_14489 ?auto_14490 ) ) ( not ( = ?auto_14489 ?auto_14493 ) ) ( not ( = ?auto_14490 ?auto_14499 ) ) ( not ( = ?auto_14490 ?auto_14507 ) ) ( not ( = ?auto_14490 ?auto_14509 ) ) ( not ( = ?auto_14490 ?auto_14500 ) ) ( not ( = ?auto_14490 ?auto_14512 ) ) ( not ( = ?auto_14490 ?auto_14497 ) ) ( not ( = ?auto_14490 ?auto_14517 ) ) ( not ( = ?auto_14490 ?auto_14501 ) ) ( not ( = ?auto_14490 ?auto_14515 ) ) ( not ( = ?auto_14490 ?auto_14519 ) ) ( not ( = ?auto_14490 ?auto_14511 ) ) ( not ( = ?auto_14493 ?auto_14499 ) ) ( not ( = ?auto_14493 ?auto_14507 ) ) ( not ( = ?auto_14493 ?auto_14509 ) ) ( not ( = ?auto_14493 ?auto_14500 ) ) ( not ( = ?auto_14493 ?auto_14512 ) ) ( not ( = ?auto_14493 ?auto_14497 ) ) ( not ( = ?auto_14493 ?auto_14517 ) ) ( not ( = ?auto_14493 ?auto_14501 ) ) ( not ( = ?auto_14493 ?auto_14515 ) ) ( not ( = ?auto_14493 ?auto_14519 ) ) ( not ( = ?auto_14493 ?auto_14511 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_14478 ?auto_14479 ?auto_14480 ?auto_14481 ?auto_14482 ?auto_14485 ?auto_14483 ?auto_14487 ?auto_14486 ?auto_14484 ?auto_14489 ?auto_14488 )
      ( MAKE-1CRATE ?auto_14488 ?auto_14490 )
      ( MAKE-12CRATE-VERIFY ?auto_14478 ?auto_14479 ?auto_14480 ?auto_14481 ?auto_14482 ?auto_14485 ?auto_14483 ?auto_14487 ?auto_14486 ?auto_14484 ?auto_14489 ?auto_14488 ?auto_14490 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14524 - SURFACE
      ?auto_14525 - SURFACE
    )
    :vars
    (
      ?auto_14526 - HOIST
      ?auto_14527 - PLACE
      ?auto_14529 - PLACE
      ?auto_14530 - HOIST
      ?auto_14531 - SURFACE
      ?auto_14528 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14526 ?auto_14527 ) ( SURFACE-AT ?auto_14524 ?auto_14527 ) ( CLEAR ?auto_14524 ) ( IS-CRATE ?auto_14525 ) ( AVAILABLE ?auto_14526 ) ( not ( = ?auto_14529 ?auto_14527 ) ) ( HOIST-AT ?auto_14530 ?auto_14529 ) ( AVAILABLE ?auto_14530 ) ( SURFACE-AT ?auto_14525 ?auto_14529 ) ( ON ?auto_14525 ?auto_14531 ) ( CLEAR ?auto_14525 ) ( TRUCK-AT ?auto_14528 ?auto_14527 ) ( not ( = ?auto_14524 ?auto_14525 ) ) ( not ( = ?auto_14524 ?auto_14531 ) ) ( not ( = ?auto_14525 ?auto_14531 ) ) ( not ( = ?auto_14526 ?auto_14530 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14528 ?auto_14527 ?auto_14529 )
      ( !LIFT ?auto_14530 ?auto_14525 ?auto_14531 ?auto_14529 )
      ( !LOAD ?auto_14530 ?auto_14525 ?auto_14528 ?auto_14529 )
      ( !DRIVE ?auto_14528 ?auto_14529 ?auto_14527 )
      ( !UNLOAD ?auto_14526 ?auto_14525 ?auto_14528 ?auto_14527 )
      ( !DROP ?auto_14526 ?auto_14525 ?auto_14524 ?auto_14527 )
      ( MAKE-1CRATE-VERIFY ?auto_14524 ?auto_14525 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_14546 - SURFACE
      ?auto_14547 - SURFACE
      ?auto_14548 - SURFACE
      ?auto_14549 - SURFACE
      ?auto_14550 - SURFACE
      ?auto_14553 - SURFACE
      ?auto_14551 - SURFACE
      ?auto_14555 - SURFACE
      ?auto_14554 - SURFACE
      ?auto_14552 - SURFACE
      ?auto_14557 - SURFACE
      ?auto_14556 - SURFACE
      ?auto_14558 - SURFACE
      ?auto_14559 - SURFACE
    )
    :vars
    (
      ?auto_14563 - HOIST
      ?auto_14560 - PLACE
      ?auto_14562 - PLACE
      ?auto_14561 - HOIST
      ?auto_14564 - SURFACE
      ?auto_14575 - SURFACE
      ?auto_14591 - PLACE
      ?auto_14587 - HOIST
      ?auto_14571 - SURFACE
      ?auto_14582 - PLACE
      ?auto_14577 - HOIST
      ?auto_14581 - SURFACE
      ?auto_14568 - PLACE
      ?auto_14589 - HOIST
      ?auto_14576 - SURFACE
      ?auto_14574 - PLACE
      ?auto_14580 - HOIST
      ?auto_14570 - SURFACE
      ?auto_14567 - SURFACE
      ?auto_14584 - SURFACE
      ?auto_14569 - PLACE
      ?auto_14579 - HOIST
      ?auto_14588 - SURFACE
      ?auto_14566 - PLACE
      ?auto_14573 - HOIST
      ?auto_14590 - SURFACE
      ?auto_14586 - PLACE
      ?auto_14572 - HOIST
      ?auto_14585 - SURFACE
      ?auto_14583 - SURFACE
      ?auto_14578 - SURFACE
      ?auto_14565 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14563 ?auto_14560 ) ( IS-CRATE ?auto_14559 ) ( not ( = ?auto_14562 ?auto_14560 ) ) ( HOIST-AT ?auto_14561 ?auto_14562 ) ( SURFACE-AT ?auto_14559 ?auto_14562 ) ( ON ?auto_14559 ?auto_14564 ) ( CLEAR ?auto_14559 ) ( not ( = ?auto_14558 ?auto_14559 ) ) ( not ( = ?auto_14558 ?auto_14564 ) ) ( not ( = ?auto_14559 ?auto_14564 ) ) ( not ( = ?auto_14563 ?auto_14561 ) ) ( IS-CRATE ?auto_14558 ) ( SURFACE-AT ?auto_14558 ?auto_14562 ) ( ON ?auto_14558 ?auto_14575 ) ( CLEAR ?auto_14558 ) ( not ( = ?auto_14556 ?auto_14558 ) ) ( not ( = ?auto_14556 ?auto_14575 ) ) ( not ( = ?auto_14558 ?auto_14575 ) ) ( IS-CRATE ?auto_14556 ) ( not ( = ?auto_14591 ?auto_14560 ) ) ( HOIST-AT ?auto_14587 ?auto_14591 ) ( AVAILABLE ?auto_14587 ) ( SURFACE-AT ?auto_14556 ?auto_14591 ) ( ON ?auto_14556 ?auto_14571 ) ( CLEAR ?auto_14556 ) ( not ( = ?auto_14557 ?auto_14556 ) ) ( not ( = ?auto_14557 ?auto_14571 ) ) ( not ( = ?auto_14556 ?auto_14571 ) ) ( not ( = ?auto_14563 ?auto_14587 ) ) ( IS-CRATE ?auto_14557 ) ( not ( = ?auto_14582 ?auto_14560 ) ) ( HOIST-AT ?auto_14577 ?auto_14582 ) ( SURFACE-AT ?auto_14557 ?auto_14582 ) ( ON ?auto_14557 ?auto_14581 ) ( CLEAR ?auto_14557 ) ( not ( = ?auto_14552 ?auto_14557 ) ) ( not ( = ?auto_14552 ?auto_14581 ) ) ( not ( = ?auto_14557 ?auto_14581 ) ) ( not ( = ?auto_14563 ?auto_14577 ) ) ( IS-CRATE ?auto_14552 ) ( not ( = ?auto_14568 ?auto_14560 ) ) ( HOIST-AT ?auto_14589 ?auto_14568 ) ( SURFACE-AT ?auto_14552 ?auto_14568 ) ( ON ?auto_14552 ?auto_14576 ) ( CLEAR ?auto_14552 ) ( not ( = ?auto_14554 ?auto_14552 ) ) ( not ( = ?auto_14554 ?auto_14576 ) ) ( not ( = ?auto_14552 ?auto_14576 ) ) ( not ( = ?auto_14563 ?auto_14589 ) ) ( IS-CRATE ?auto_14554 ) ( not ( = ?auto_14574 ?auto_14560 ) ) ( HOIST-AT ?auto_14580 ?auto_14574 ) ( SURFACE-AT ?auto_14554 ?auto_14574 ) ( ON ?auto_14554 ?auto_14570 ) ( CLEAR ?auto_14554 ) ( not ( = ?auto_14555 ?auto_14554 ) ) ( not ( = ?auto_14555 ?auto_14570 ) ) ( not ( = ?auto_14554 ?auto_14570 ) ) ( not ( = ?auto_14563 ?auto_14580 ) ) ( IS-CRATE ?auto_14555 ) ( AVAILABLE ?auto_14589 ) ( SURFACE-AT ?auto_14555 ?auto_14568 ) ( ON ?auto_14555 ?auto_14567 ) ( CLEAR ?auto_14555 ) ( not ( = ?auto_14551 ?auto_14555 ) ) ( not ( = ?auto_14551 ?auto_14567 ) ) ( not ( = ?auto_14555 ?auto_14567 ) ) ( IS-CRATE ?auto_14551 ) ( AVAILABLE ?auto_14561 ) ( SURFACE-AT ?auto_14551 ?auto_14562 ) ( ON ?auto_14551 ?auto_14584 ) ( CLEAR ?auto_14551 ) ( not ( = ?auto_14553 ?auto_14551 ) ) ( not ( = ?auto_14553 ?auto_14584 ) ) ( not ( = ?auto_14551 ?auto_14584 ) ) ( IS-CRATE ?auto_14553 ) ( not ( = ?auto_14569 ?auto_14560 ) ) ( HOIST-AT ?auto_14579 ?auto_14569 ) ( AVAILABLE ?auto_14579 ) ( SURFACE-AT ?auto_14553 ?auto_14569 ) ( ON ?auto_14553 ?auto_14588 ) ( CLEAR ?auto_14553 ) ( not ( = ?auto_14550 ?auto_14553 ) ) ( not ( = ?auto_14550 ?auto_14588 ) ) ( not ( = ?auto_14553 ?auto_14588 ) ) ( not ( = ?auto_14563 ?auto_14579 ) ) ( IS-CRATE ?auto_14550 ) ( not ( = ?auto_14566 ?auto_14560 ) ) ( HOIST-AT ?auto_14573 ?auto_14566 ) ( AVAILABLE ?auto_14573 ) ( SURFACE-AT ?auto_14550 ?auto_14566 ) ( ON ?auto_14550 ?auto_14590 ) ( CLEAR ?auto_14550 ) ( not ( = ?auto_14549 ?auto_14550 ) ) ( not ( = ?auto_14549 ?auto_14590 ) ) ( not ( = ?auto_14550 ?auto_14590 ) ) ( not ( = ?auto_14563 ?auto_14573 ) ) ( IS-CRATE ?auto_14549 ) ( not ( = ?auto_14586 ?auto_14560 ) ) ( HOIST-AT ?auto_14572 ?auto_14586 ) ( AVAILABLE ?auto_14572 ) ( SURFACE-AT ?auto_14549 ?auto_14586 ) ( ON ?auto_14549 ?auto_14585 ) ( CLEAR ?auto_14549 ) ( not ( = ?auto_14548 ?auto_14549 ) ) ( not ( = ?auto_14548 ?auto_14585 ) ) ( not ( = ?auto_14549 ?auto_14585 ) ) ( not ( = ?auto_14563 ?auto_14572 ) ) ( IS-CRATE ?auto_14548 ) ( AVAILABLE ?auto_14577 ) ( SURFACE-AT ?auto_14548 ?auto_14582 ) ( ON ?auto_14548 ?auto_14583 ) ( CLEAR ?auto_14548 ) ( not ( = ?auto_14547 ?auto_14548 ) ) ( not ( = ?auto_14547 ?auto_14583 ) ) ( not ( = ?auto_14548 ?auto_14583 ) ) ( SURFACE-AT ?auto_14546 ?auto_14560 ) ( CLEAR ?auto_14546 ) ( IS-CRATE ?auto_14547 ) ( AVAILABLE ?auto_14563 ) ( AVAILABLE ?auto_14580 ) ( SURFACE-AT ?auto_14547 ?auto_14574 ) ( ON ?auto_14547 ?auto_14578 ) ( CLEAR ?auto_14547 ) ( TRUCK-AT ?auto_14565 ?auto_14560 ) ( not ( = ?auto_14546 ?auto_14547 ) ) ( not ( = ?auto_14546 ?auto_14578 ) ) ( not ( = ?auto_14547 ?auto_14578 ) ) ( not ( = ?auto_14546 ?auto_14548 ) ) ( not ( = ?auto_14546 ?auto_14583 ) ) ( not ( = ?auto_14548 ?auto_14578 ) ) ( not ( = ?auto_14582 ?auto_14574 ) ) ( not ( = ?auto_14577 ?auto_14580 ) ) ( not ( = ?auto_14583 ?auto_14578 ) ) ( not ( = ?auto_14546 ?auto_14549 ) ) ( not ( = ?auto_14546 ?auto_14585 ) ) ( not ( = ?auto_14547 ?auto_14549 ) ) ( not ( = ?auto_14547 ?auto_14585 ) ) ( not ( = ?auto_14549 ?auto_14583 ) ) ( not ( = ?auto_14549 ?auto_14578 ) ) ( not ( = ?auto_14586 ?auto_14582 ) ) ( not ( = ?auto_14586 ?auto_14574 ) ) ( not ( = ?auto_14572 ?auto_14577 ) ) ( not ( = ?auto_14572 ?auto_14580 ) ) ( not ( = ?auto_14585 ?auto_14583 ) ) ( not ( = ?auto_14585 ?auto_14578 ) ) ( not ( = ?auto_14546 ?auto_14550 ) ) ( not ( = ?auto_14546 ?auto_14590 ) ) ( not ( = ?auto_14547 ?auto_14550 ) ) ( not ( = ?auto_14547 ?auto_14590 ) ) ( not ( = ?auto_14548 ?auto_14550 ) ) ( not ( = ?auto_14548 ?auto_14590 ) ) ( not ( = ?auto_14550 ?auto_14585 ) ) ( not ( = ?auto_14550 ?auto_14583 ) ) ( not ( = ?auto_14550 ?auto_14578 ) ) ( not ( = ?auto_14566 ?auto_14586 ) ) ( not ( = ?auto_14566 ?auto_14582 ) ) ( not ( = ?auto_14566 ?auto_14574 ) ) ( not ( = ?auto_14573 ?auto_14572 ) ) ( not ( = ?auto_14573 ?auto_14577 ) ) ( not ( = ?auto_14573 ?auto_14580 ) ) ( not ( = ?auto_14590 ?auto_14585 ) ) ( not ( = ?auto_14590 ?auto_14583 ) ) ( not ( = ?auto_14590 ?auto_14578 ) ) ( not ( = ?auto_14546 ?auto_14553 ) ) ( not ( = ?auto_14546 ?auto_14588 ) ) ( not ( = ?auto_14547 ?auto_14553 ) ) ( not ( = ?auto_14547 ?auto_14588 ) ) ( not ( = ?auto_14548 ?auto_14553 ) ) ( not ( = ?auto_14548 ?auto_14588 ) ) ( not ( = ?auto_14549 ?auto_14553 ) ) ( not ( = ?auto_14549 ?auto_14588 ) ) ( not ( = ?auto_14553 ?auto_14590 ) ) ( not ( = ?auto_14553 ?auto_14585 ) ) ( not ( = ?auto_14553 ?auto_14583 ) ) ( not ( = ?auto_14553 ?auto_14578 ) ) ( not ( = ?auto_14569 ?auto_14566 ) ) ( not ( = ?auto_14569 ?auto_14586 ) ) ( not ( = ?auto_14569 ?auto_14582 ) ) ( not ( = ?auto_14569 ?auto_14574 ) ) ( not ( = ?auto_14579 ?auto_14573 ) ) ( not ( = ?auto_14579 ?auto_14572 ) ) ( not ( = ?auto_14579 ?auto_14577 ) ) ( not ( = ?auto_14579 ?auto_14580 ) ) ( not ( = ?auto_14588 ?auto_14590 ) ) ( not ( = ?auto_14588 ?auto_14585 ) ) ( not ( = ?auto_14588 ?auto_14583 ) ) ( not ( = ?auto_14588 ?auto_14578 ) ) ( not ( = ?auto_14546 ?auto_14551 ) ) ( not ( = ?auto_14546 ?auto_14584 ) ) ( not ( = ?auto_14547 ?auto_14551 ) ) ( not ( = ?auto_14547 ?auto_14584 ) ) ( not ( = ?auto_14548 ?auto_14551 ) ) ( not ( = ?auto_14548 ?auto_14584 ) ) ( not ( = ?auto_14549 ?auto_14551 ) ) ( not ( = ?auto_14549 ?auto_14584 ) ) ( not ( = ?auto_14550 ?auto_14551 ) ) ( not ( = ?auto_14550 ?auto_14584 ) ) ( not ( = ?auto_14551 ?auto_14588 ) ) ( not ( = ?auto_14551 ?auto_14590 ) ) ( not ( = ?auto_14551 ?auto_14585 ) ) ( not ( = ?auto_14551 ?auto_14583 ) ) ( not ( = ?auto_14551 ?auto_14578 ) ) ( not ( = ?auto_14562 ?auto_14569 ) ) ( not ( = ?auto_14562 ?auto_14566 ) ) ( not ( = ?auto_14562 ?auto_14586 ) ) ( not ( = ?auto_14562 ?auto_14582 ) ) ( not ( = ?auto_14562 ?auto_14574 ) ) ( not ( = ?auto_14561 ?auto_14579 ) ) ( not ( = ?auto_14561 ?auto_14573 ) ) ( not ( = ?auto_14561 ?auto_14572 ) ) ( not ( = ?auto_14561 ?auto_14577 ) ) ( not ( = ?auto_14561 ?auto_14580 ) ) ( not ( = ?auto_14584 ?auto_14588 ) ) ( not ( = ?auto_14584 ?auto_14590 ) ) ( not ( = ?auto_14584 ?auto_14585 ) ) ( not ( = ?auto_14584 ?auto_14583 ) ) ( not ( = ?auto_14584 ?auto_14578 ) ) ( not ( = ?auto_14546 ?auto_14555 ) ) ( not ( = ?auto_14546 ?auto_14567 ) ) ( not ( = ?auto_14547 ?auto_14555 ) ) ( not ( = ?auto_14547 ?auto_14567 ) ) ( not ( = ?auto_14548 ?auto_14555 ) ) ( not ( = ?auto_14548 ?auto_14567 ) ) ( not ( = ?auto_14549 ?auto_14555 ) ) ( not ( = ?auto_14549 ?auto_14567 ) ) ( not ( = ?auto_14550 ?auto_14555 ) ) ( not ( = ?auto_14550 ?auto_14567 ) ) ( not ( = ?auto_14553 ?auto_14555 ) ) ( not ( = ?auto_14553 ?auto_14567 ) ) ( not ( = ?auto_14555 ?auto_14584 ) ) ( not ( = ?auto_14555 ?auto_14588 ) ) ( not ( = ?auto_14555 ?auto_14590 ) ) ( not ( = ?auto_14555 ?auto_14585 ) ) ( not ( = ?auto_14555 ?auto_14583 ) ) ( not ( = ?auto_14555 ?auto_14578 ) ) ( not ( = ?auto_14568 ?auto_14562 ) ) ( not ( = ?auto_14568 ?auto_14569 ) ) ( not ( = ?auto_14568 ?auto_14566 ) ) ( not ( = ?auto_14568 ?auto_14586 ) ) ( not ( = ?auto_14568 ?auto_14582 ) ) ( not ( = ?auto_14568 ?auto_14574 ) ) ( not ( = ?auto_14589 ?auto_14561 ) ) ( not ( = ?auto_14589 ?auto_14579 ) ) ( not ( = ?auto_14589 ?auto_14573 ) ) ( not ( = ?auto_14589 ?auto_14572 ) ) ( not ( = ?auto_14589 ?auto_14577 ) ) ( not ( = ?auto_14589 ?auto_14580 ) ) ( not ( = ?auto_14567 ?auto_14584 ) ) ( not ( = ?auto_14567 ?auto_14588 ) ) ( not ( = ?auto_14567 ?auto_14590 ) ) ( not ( = ?auto_14567 ?auto_14585 ) ) ( not ( = ?auto_14567 ?auto_14583 ) ) ( not ( = ?auto_14567 ?auto_14578 ) ) ( not ( = ?auto_14546 ?auto_14554 ) ) ( not ( = ?auto_14546 ?auto_14570 ) ) ( not ( = ?auto_14547 ?auto_14554 ) ) ( not ( = ?auto_14547 ?auto_14570 ) ) ( not ( = ?auto_14548 ?auto_14554 ) ) ( not ( = ?auto_14548 ?auto_14570 ) ) ( not ( = ?auto_14549 ?auto_14554 ) ) ( not ( = ?auto_14549 ?auto_14570 ) ) ( not ( = ?auto_14550 ?auto_14554 ) ) ( not ( = ?auto_14550 ?auto_14570 ) ) ( not ( = ?auto_14553 ?auto_14554 ) ) ( not ( = ?auto_14553 ?auto_14570 ) ) ( not ( = ?auto_14551 ?auto_14554 ) ) ( not ( = ?auto_14551 ?auto_14570 ) ) ( not ( = ?auto_14554 ?auto_14567 ) ) ( not ( = ?auto_14554 ?auto_14584 ) ) ( not ( = ?auto_14554 ?auto_14588 ) ) ( not ( = ?auto_14554 ?auto_14590 ) ) ( not ( = ?auto_14554 ?auto_14585 ) ) ( not ( = ?auto_14554 ?auto_14583 ) ) ( not ( = ?auto_14554 ?auto_14578 ) ) ( not ( = ?auto_14570 ?auto_14567 ) ) ( not ( = ?auto_14570 ?auto_14584 ) ) ( not ( = ?auto_14570 ?auto_14588 ) ) ( not ( = ?auto_14570 ?auto_14590 ) ) ( not ( = ?auto_14570 ?auto_14585 ) ) ( not ( = ?auto_14570 ?auto_14583 ) ) ( not ( = ?auto_14570 ?auto_14578 ) ) ( not ( = ?auto_14546 ?auto_14552 ) ) ( not ( = ?auto_14546 ?auto_14576 ) ) ( not ( = ?auto_14547 ?auto_14552 ) ) ( not ( = ?auto_14547 ?auto_14576 ) ) ( not ( = ?auto_14548 ?auto_14552 ) ) ( not ( = ?auto_14548 ?auto_14576 ) ) ( not ( = ?auto_14549 ?auto_14552 ) ) ( not ( = ?auto_14549 ?auto_14576 ) ) ( not ( = ?auto_14550 ?auto_14552 ) ) ( not ( = ?auto_14550 ?auto_14576 ) ) ( not ( = ?auto_14553 ?auto_14552 ) ) ( not ( = ?auto_14553 ?auto_14576 ) ) ( not ( = ?auto_14551 ?auto_14552 ) ) ( not ( = ?auto_14551 ?auto_14576 ) ) ( not ( = ?auto_14555 ?auto_14552 ) ) ( not ( = ?auto_14555 ?auto_14576 ) ) ( not ( = ?auto_14552 ?auto_14570 ) ) ( not ( = ?auto_14552 ?auto_14567 ) ) ( not ( = ?auto_14552 ?auto_14584 ) ) ( not ( = ?auto_14552 ?auto_14588 ) ) ( not ( = ?auto_14552 ?auto_14590 ) ) ( not ( = ?auto_14552 ?auto_14585 ) ) ( not ( = ?auto_14552 ?auto_14583 ) ) ( not ( = ?auto_14552 ?auto_14578 ) ) ( not ( = ?auto_14576 ?auto_14570 ) ) ( not ( = ?auto_14576 ?auto_14567 ) ) ( not ( = ?auto_14576 ?auto_14584 ) ) ( not ( = ?auto_14576 ?auto_14588 ) ) ( not ( = ?auto_14576 ?auto_14590 ) ) ( not ( = ?auto_14576 ?auto_14585 ) ) ( not ( = ?auto_14576 ?auto_14583 ) ) ( not ( = ?auto_14576 ?auto_14578 ) ) ( not ( = ?auto_14546 ?auto_14557 ) ) ( not ( = ?auto_14546 ?auto_14581 ) ) ( not ( = ?auto_14547 ?auto_14557 ) ) ( not ( = ?auto_14547 ?auto_14581 ) ) ( not ( = ?auto_14548 ?auto_14557 ) ) ( not ( = ?auto_14548 ?auto_14581 ) ) ( not ( = ?auto_14549 ?auto_14557 ) ) ( not ( = ?auto_14549 ?auto_14581 ) ) ( not ( = ?auto_14550 ?auto_14557 ) ) ( not ( = ?auto_14550 ?auto_14581 ) ) ( not ( = ?auto_14553 ?auto_14557 ) ) ( not ( = ?auto_14553 ?auto_14581 ) ) ( not ( = ?auto_14551 ?auto_14557 ) ) ( not ( = ?auto_14551 ?auto_14581 ) ) ( not ( = ?auto_14555 ?auto_14557 ) ) ( not ( = ?auto_14555 ?auto_14581 ) ) ( not ( = ?auto_14554 ?auto_14557 ) ) ( not ( = ?auto_14554 ?auto_14581 ) ) ( not ( = ?auto_14557 ?auto_14576 ) ) ( not ( = ?auto_14557 ?auto_14570 ) ) ( not ( = ?auto_14557 ?auto_14567 ) ) ( not ( = ?auto_14557 ?auto_14584 ) ) ( not ( = ?auto_14557 ?auto_14588 ) ) ( not ( = ?auto_14557 ?auto_14590 ) ) ( not ( = ?auto_14557 ?auto_14585 ) ) ( not ( = ?auto_14557 ?auto_14583 ) ) ( not ( = ?auto_14557 ?auto_14578 ) ) ( not ( = ?auto_14581 ?auto_14576 ) ) ( not ( = ?auto_14581 ?auto_14570 ) ) ( not ( = ?auto_14581 ?auto_14567 ) ) ( not ( = ?auto_14581 ?auto_14584 ) ) ( not ( = ?auto_14581 ?auto_14588 ) ) ( not ( = ?auto_14581 ?auto_14590 ) ) ( not ( = ?auto_14581 ?auto_14585 ) ) ( not ( = ?auto_14581 ?auto_14583 ) ) ( not ( = ?auto_14581 ?auto_14578 ) ) ( not ( = ?auto_14546 ?auto_14556 ) ) ( not ( = ?auto_14546 ?auto_14571 ) ) ( not ( = ?auto_14547 ?auto_14556 ) ) ( not ( = ?auto_14547 ?auto_14571 ) ) ( not ( = ?auto_14548 ?auto_14556 ) ) ( not ( = ?auto_14548 ?auto_14571 ) ) ( not ( = ?auto_14549 ?auto_14556 ) ) ( not ( = ?auto_14549 ?auto_14571 ) ) ( not ( = ?auto_14550 ?auto_14556 ) ) ( not ( = ?auto_14550 ?auto_14571 ) ) ( not ( = ?auto_14553 ?auto_14556 ) ) ( not ( = ?auto_14553 ?auto_14571 ) ) ( not ( = ?auto_14551 ?auto_14556 ) ) ( not ( = ?auto_14551 ?auto_14571 ) ) ( not ( = ?auto_14555 ?auto_14556 ) ) ( not ( = ?auto_14555 ?auto_14571 ) ) ( not ( = ?auto_14554 ?auto_14556 ) ) ( not ( = ?auto_14554 ?auto_14571 ) ) ( not ( = ?auto_14552 ?auto_14556 ) ) ( not ( = ?auto_14552 ?auto_14571 ) ) ( not ( = ?auto_14556 ?auto_14581 ) ) ( not ( = ?auto_14556 ?auto_14576 ) ) ( not ( = ?auto_14556 ?auto_14570 ) ) ( not ( = ?auto_14556 ?auto_14567 ) ) ( not ( = ?auto_14556 ?auto_14584 ) ) ( not ( = ?auto_14556 ?auto_14588 ) ) ( not ( = ?auto_14556 ?auto_14590 ) ) ( not ( = ?auto_14556 ?auto_14585 ) ) ( not ( = ?auto_14556 ?auto_14583 ) ) ( not ( = ?auto_14556 ?auto_14578 ) ) ( not ( = ?auto_14591 ?auto_14582 ) ) ( not ( = ?auto_14591 ?auto_14568 ) ) ( not ( = ?auto_14591 ?auto_14574 ) ) ( not ( = ?auto_14591 ?auto_14562 ) ) ( not ( = ?auto_14591 ?auto_14569 ) ) ( not ( = ?auto_14591 ?auto_14566 ) ) ( not ( = ?auto_14591 ?auto_14586 ) ) ( not ( = ?auto_14587 ?auto_14577 ) ) ( not ( = ?auto_14587 ?auto_14589 ) ) ( not ( = ?auto_14587 ?auto_14580 ) ) ( not ( = ?auto_14587 ?auto_14561 ) ) ( not ( = ?auto_14587 ?auto_14579 ) ) ( not ( = ?auto_14587 ?auto_14573 ) ) ( not ( = ?auto_14587 ?auto_14572 ) ) ( not ( = ?auto_14571 ?auto_14581 ) ) ( not ( = ?auto_14571 ?auto_14576 ) ) ( not ( = ?auto_14571 ?auto_14570 ) ) ( not ( = ?auto_14571 ?auto_14567 ) ) ( not ( = ?auto_14571 ?auto_14584 ) ) ( not ( = ?auto_14571 ?auto_14588 ) ) ( not ( = ?auto_14571 ?auto_14590 ) ) ( not ( = ?auto_14571 ?auto_14585 ) ) ( not ( = ?auto_14571 ?auto_14583 ) ) ( not ( = ?auto_14571 ?auto_14578 ) ) ( not ( = ?auto_14546 ?auto_14558 ) ) ( not ( = ?auto_14546 ?auto_14575 ) ) ( not ( = ?auto_14547 ?auto_14558 ) ) ( not ( = ?auto_14547 ?auto_14575 ) ) ( not ( = ?auto_14548 ?auto_14558 ) ) ( not ( = ?auto_14548 ?auto_14575 ) ) ( not ( = ?auto_14549 ?auto_14558 ) ) ( not ( = ?auto_14549 ?auto_14575 ) ) ( not ( = ?auto_14550 ?auto_14558 ) ) ( not ( = ?auto_14550 ?auto_14575 ) ) ( not ( = ?auto_14553 ?auto_14558 ) ) ( not ( = ?auto_14553 ?auto_14575 ) ) ( not ( = ?auto_14551 ?auto_14558 ) ) ( not ( = ?auto_14551 ?auto_14575 ) ) ( not ( = ?auto_14555 ?auto_14558 ) ) ( not ( = ?auto_14555 ?auto_14575 ) ) ( not ( = ?auto_14554 ?auto_14558 ) ) ( not ( = ?auto_14554 ?auto_14575 ) ) ( not ( = ?auto_14552 ?auto_14558 ) ) ( not ( = ?auto_14552 ?auto_14575 ) ) ( not ( = ?auto_14557 ?auto_14558 ) ) ( not ( = ?auto_14557 ?auto_14575 ) ) ( not ( = ?auto_14558 ?auto_14571 ) ) ( not ( = ?auto_14558 ?auto_14581 ) ) ( not ( = ?auto_14558 ?auto_14576 ) ) ( not ( = ?auto_14558 ?auto_14570 ) ) ( not ( = ?auto_14558 ?auto_14567 ) ) ( not ( = ?auto_14558 ?auto_14584 ) ) ( not ( = ?auto_14558 ?auto_14588 ) ) ( not ( = ?auto_14558 ?auto_14590 ) ) ( not ( = ?auto_14558 ?auto_14585 ) ) ( not ( = ?auto_14558 ?auto_14583 ) ) ( not ( = ?auto_14558 ?auto_14578 ) ) ( not ( = ?auto_14575 ?auto_14571 ) ) ( not ( = ?auto_14575 ?auto_14581 ) ) ( not ( = ?auto_14575 ?auto_14576 ) ) ( not ( = ?auto_14575 ?auto_14570 ) ) ( not ( = ?auto_14575 ?auto_14567 ) ) ( not ( = ?auto_14575 ?auto_14584 ) ) ( not ( = ?auto_14575 ?auto_14588 ) ) ( not ( = ?auto_14575 ?auto_14590 ) ) ( not ( = ?auto_14575 ?auto_14585 ) ) ( not ( = ?auto_14575 ?auto_14583 ) ) ( not ( = ?auto_14575 ?auto_14578 ) ) ( not ( = ?auto_14546 ?auto_14559 ) ) ( not ( = ?auto_14546 ?auto_14564 ) ) ( not ( = ?auto_14547 ?auto_14559 ) ) ( not ( = ?auto_14547 ?auto_14564 ) ) ( not ( = ?auto_14548 ?auto_14559 ) ) ( not ( = ?auto_14548 ?auto_14564 ) ) ( not ( = ?auto_14549 ?auto_14559 ) ) ( not ( = ?auto_14549 ?auto_14564 ) ) ( not ( = ?auto_14550 ?auto_14559 ) ) ( not ( = ?auto_14550 ?auto_14564 ) ) ( not ( = ?auto_14553 ?auto_14559 ) ) ( not ( = ?auto_14553 ?auto_14564 ) ) ( not ( = ?auto_14551 ?auto_14559 ) ) ( not ( = ?auto_14551 ?auto_14564 ) ) ( not ( = ?auto_14555 ?auto_14559 ) ) ( not ( = ?auto_14555 ?auto_14564 ) ) ( not ( = ?auto_14554 ?auto_14559 ) ) ( not ( = ?auto_14554 ?auto_14564 ) ) ( not ( = ?auto_14552 ?auto_14559 ) ) ( not ( = ?auto_14552 ?auto_14564 ) ) ( not ( = ?auto_14557 ?auto_14559 ) ) ( not ( = ?auto_14557 ?auto_14564 ) ) ( not ( = ?auto_14556 ?auto_14559 ) ) ( not ( = ?auto_14556 ?auto_14564 ) ) ( not ( = ?auto_14559 ?auto_14575 ) ) ( not ( = ?auto_14559 ?auto_14571 ) ) ( not ( = ?auto_14559 ?auto_14581 ) ) ( not ( = ?auto_14559 ?auto_14576 ) ) ( not ( = ?auto_14559 ?auto_14570 ) ) ( not ( = ?auto_14559 ?auto_14567 ) ) ( not ( = ?auto_14559 ?auto_14584 ) ) ( not ( = ?auto_14559 ?auto_14588 ) ) ( not ( = ?auto_14559 ?auto_14590 ) ) ( not ( = ?auto_14559 ?auto_14585 ) ) ( not ( = ?auto_14559 ?auto_14583 ) ) ( not ( = ?auto_14559 ?auto_14578 ) ) ( not ( = ?auto_14564 ?auto_14575 ) ) ( not ( = ?auto_14564 ?auto_14571 ) ) ( not ( = ?auto_14564 ?auto_14581 ) ) ( not ( = ?auto_14564 ?auto_14576 ) ) ( not ( = ?auto_14564 ?auto_14570 ) ) ( not ( = ?auto_14564 ?auto_14567 ) ) ( not ( = ?auto_14564 ?auto_14584 ) ) ( not ( = ?auto_14564 ?auto_14588 ) ) ( not ( = ?auto_14564 ?auto_14590 ) ) ( not ( = ?auto_14564 ?auto_14585 ) ) ( not ( = ?auto_14564 ?auto_14583 ) ) ( not ( = ?auto_14564 ?auto_14578 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_14546 ?auto_14547 ?auto_14548 ?auto_14549 ?auto_14550 ?auto_14553 ?auto_14551 ?auto_14555 ?auto_14554 ?auto_14552 ?auto_14557 ?auto_14556 ?auto_14558 )
      ( MAKE-1CRATE ?auto_14558 ?auto_14559 )
      ( MAKE-13CRATE-VERIFY ?auto_14546 ?auto_14547 ?auto_14548 ?auto_14549 ?auto_14550 ?auto_14553 ?auto_14551 ?auto_14555 ?auto_14554 ?auto_14552 ?auto_14557 ?auto_14556 ?auto_14558 ?auto_14559 ) )
  )

)

