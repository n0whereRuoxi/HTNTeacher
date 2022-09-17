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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_347998 - SURFACE
      ?auto_347999 - SURFACE
    )
    :vars
    (
      ?auto_348000 - HOIST
      ?auto_348001 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_348000 ?auto_348001 ) ( SURFACE-AT ?auto_347998 ?auto_348001 ) ( CLEAR ?auto_347998 ) ( LIFTING ?auto_348000 ?auto_347999 ) ( IS-CRATE ?auto_347999 ) ( not ( = ?auto_347998 ?auto_347999 ) ) )
    :subtasks
    ( ( !DROP ?auto_348000 ?auto_347999 ?auto_347998 ?auto_348001 )
      ( MAKE-1CRATE-VERIFY ?auto_347998 ?auto_347999 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_348002 - SURFACE
      ?auto_348003 - SURFACE
    )
    :vars
    (
      ?auto_348004 - HOIST
      ?auto_348005 - PLACE
      ?auto_348006 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348004 ?auto_348005 ) ( SURFACE-AT ?auto_348002 ?auto_348005 ) ( CLEAR ?auto_348002 ) ( IS-CRATE ?auto_348003 ) ( not ( = ?auto_348002 ?auto_348003 ) ) ( TRUCK-AT ?auto_348006 ?auto_348005 ) ( AVAILABLE ?auto_348004 ) ( IN ?auto_348003 ?auto_348006 ) )
    :subtasks
    ( ( !UNLOAD ?auto_348004 ?auto_348003 ?auto_348006 ?auto_348005 )
      ( MAKE-1CRATE ?auto_348002 ?auto_348003 )
      ( MAKE-1CRATE-VERIFY ?auto_348002 ?auto_348003 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_348007 - SURFACE
      ?auto_348008 - SURFACE
    )
    :vars
    (
      ?auto_348011 - HOIST
      ?auto_348010 - PLACE
      ?auto_348009 - TRUCK
      ?auto_348012 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_348011 ?auto_348010 ) ( SURFACE-AT ?auto_348007 ?auto_348010 ) ( CLEAR ?auto_348007 ) ( IS-CRATE ?auto_348008 ) ( not ( = ?auto_348007 ?auto_348008 ) ) ( AVAILABLE ?auto_348011 ) ( IN ?auto_348008 ?auto_348009 ) ( TRUCK-AT ?auto_348009 ?auto_348012 ) ( not ( = ?auto_348012 ?auto_348010 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_348009 ?auto_348012 ?auto_348010 )
      ( MAKE-1CRATE ?auto_348007 ?auto_348008 )
      ( MAKE-1CRATE-VERIFY ?auto_348007 ?auto_348008 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_348013 - SURFACE
      ?auto_348014 - SURFACE
    )
    :vars
    (
      ?auto_348015 - HOIST
      ?auto_348017 - PLACE
      ?auto_348016 - TRUCK
      ?auto_348018 - PLACE
      ?auto_348019 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_348015 ?auto_348017 ) ( SURFACE-AT ?auto_348013 ?auto_348017 ) ( CLEAR ?auto_348013 ) ( IS-CRATE ?auto_348014 ) ( not ( = ?auto_348013 ?auto_348014 ) ) ( AVAILABLE ?auto_348015 ) ( TRUCK-AT ?auto_348016 ?auto_348018 ) ( not ( = ?auto_348018 ?auto_348017 ) ) ( HOIST-AT ?auto_348019 ?auto_348018 ) ( LIFTING ?auto_348019 ?auto_348014 ) ( not ( = ?auto_348015 ?auto_348019 ) ) )
    :subtasks
    ( ( !LOAD ?auto_348019 ?auto_348014 ?auto_348016 ?auto_348018 )
      ( MAKE-1CRATE ?auto_348013 ?auto_348014 )
      ( MAKE-1CRATE-VERIFY ?auto_348013 ?auto_348014 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_348020 - SURFACE
      ?auto_348021 - SURFACE
    )
    :vars
    (
      ?auto_348022 - HOIST
      ?auto_348025 - PLACE
      ?auto_348026 - TRUCK
      ?auto_348023 - PLACE
      ?auto_348024 - HOIST
      ?auto_348027 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_348022 ?auto_348025 ) ( SURFACE-AT ?auto_348020 ?auto_348025 ) ( CLEAR ?auto_348020 ) ( IS-CRATE ?auto_348021 ) ( not ( = ?auto_348020 ?auto_348021 ) ) ( AVAILABLE ?auto_348022 ) ( TRUCK-AT ?auto_348026 ?auto_348023 ) ( not ( = ?auto_348023 ?auto_348025 ) ) ( HOIST-AT ?auto_348024 ?auto_348023 ) ( not ( = ?auto_348022 ?auto_348024 ) ) ( AVAILABLE ?auto_348024 ) ( SURFACE-AT ?auto_348021 ?auto_348023 ) ( ON ?auto_348021 ?auto_348027 ) ( CLEAR ?auto_348021 ) ( not ( = ?auto_348020 ?auto_348027 ) ) ( not ( = ?auto_348021 ?auto_348027 ) ) )
    :subtasks
    ( ( !LIFT ?auto_348024 ?auto_348021 ?auto_348027 ?auto_348023 )
      ( MAKE-1CRATE ?auto_348020 ?auto_348021 )
      ( MAKE-1CRATE-VERIFY ?auto_348020 ?auto_348021 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_348028 - SURFACE
      ?auto_348029 - SURFACE
    )
    :vars
    (
      ?auto_348031 - HOIST
      ?auto_348035 - PLACE
      ?auto_348034 - PLACE
      ?auto_348033 - HOIST
      ?auto_348032 - SURFACE
      ?auto_348030 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348031 ?auto_348035 ) ( SURFACE-AT ?auto_348028 ?auto_348035 ) ( CLEAR ?auto_348028 ) ( IS-CRATE ?auto_348029 ) ( not ( = ?auto_348028 ?auto_348029 ) ) ( AVAILABLE ?auto_348031 ) ( not ( = ?auto_348034 ?auto_348035 ) ) ( HOIST-AT ?auto_348033 ?auto_348034 ) ( not ( = ?auto_348031 ?auto_348033 ) ) ( AVAILABLE ?auto_348033 ) ( SURFACE-AT ?auto_348029 ?auto_348034 ) ( ON ?auto_348029 ?auto_348032 ) ( CLEAR ?auto_348029 ) ( not ( = ?auto_348028 ?auto_348032 ) ) ( not ( = ?auto_348029 ?auto_348032 ) ) ( TRUCK-AT ?auto_348030 ?auto_348035 ) )
    :subtasks
    ( ( !DRIVE ?auto_348030 ?auto_348035 ?auto_348034 )
      ( MAKE-1CRATE ?auto_348028 ?auto_348029 )
      ( MAKE-1CRATE-VERIFY ?auto_348028 ?auto_348029 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_348045 - SURFACE
      ?auto_348046 - SURFACE
      ?auto_348047 - SURFACE
    )
    :vars
    (
      ?auto_348049 - HOIST
      ?auto_348048 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_348049 ?auto_348048 ) ( SURFACE-AT ?auto_348046 ?auto_348048 ) ( CLEAR ?auto_348046 ) ( LIFTING ?auto_348049 ?auto_348047 ) ( IS-CRATE ?auto_348047 ) ( not ( = ?auto_348046 ?auto_348047 ) ) ( ON ?auto_348046 ?auto_348045 ) ( not ( = ?auto_348045 ?auto_348046 ) ) ( not ( = ?auto_348045 ?auto_348047 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_348046 ?auto_348047 )
      ( MAKE-2CRATE-VERIFY ?auto_348045 ?auto_348046 ?auto_348047 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_348055 - SURFACE
      ?auto_348056 - SURFACE
      ?auto_348057 - SURFACE
    )
    :vars
    (
      ?auto_348060 - HOIST
      ?auto_348059 - PLACE
      ?auto_348058 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348060 ?auto_348059 ) ( SURFACE-AT ?auto_348056 ?auto_348059 ) ( CLEAR ?auto_348056 ) ( IS-CRATE ?auto_348057 ) ( not ( = ?auto_348056 ?auto_348057 ) ) ( TRUCK-AT ?auto_348058 ?auto_348059 ) ( AVAILABLE ?auto_348060 ) ( IN ?auto_348057 ?auto_348058 ) ( ON ?auto_348056 ?auto_348055 ) ( not ( = ?auto_348055 ?auto_348056 ) ) ( not ( = ?auto_348055 ?auto_348057 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_348056 ?auto_348057 )
      ( MAKE-2CRATE-VERIFY ?auto_348055 ?auto_348056 ?auto_348057 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_348061 - SURFACE
      ?auto_348062 - SURFACE
    )
    :vars
    (
      ?auto_348066 - HOIST
      ?auto_348064 - PLACE
      ?auto_348065 - TRUCK
      ?auto_348063 - SURFACE
      ?auto_348067 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_348066 ?auto_348064 ) ( SURFACE-AT ?auto_348061 ?auto_348064 ) ( CLEAR ?auto_348061 ) ( IS-CRATE ?auto_348062 ) ( not ( = ?auto_348061 ?auto_348062 ) ) ( AVAILABLE ?auto_348066 ) ( IN ?auto_348062 ?auto_348065 ) ( ON ?auto_348061 ?auto_348063 ) ( not ( = ?auto_348063 ?auto_348061 ) ) ( not ( = ?auto_348063 ?auto_348062 ) ) ( TRUCK-AT ?auto_348065 ?auto_348067 ) ( not ( = ?auto_348067 ?auto_348064 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_348065 ?auto_348067 ?auto_348064 )
      ( MAKE-2CRATE ?auto_348063 ?auto_348061 ?auto_348062 )
      ( MAKE-1CRATE-VERIFY ?auto_348061 ?auto_348062 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_348068 - SURFACE
      ?auto_348069 - SURFACE
      ?auto_348070 - SURFACE
    )
    :vars
    (
      ?auto_348074 - HOIST
      ?auto_348072 - PLACE
      ?auto_348071 - TRUCK
      ?auto_348073 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_348074 ?auto_348072 ) ( SURFACE-AT ?auto_348069 ?auto_348072 ) ( CLEAR ?auto_348069 ) ( IS-CRATE ?auto_348070 ) ( not ( = ?auto_348069 ?auto_348070 ) ) ( AVAILABLE ?auto_348074 ) ( IN ?auto_348070 ?auto_348071 ) ( ON ?auto_348069 ?auto_348068 ) ( not ( = ?auto_348068 ?auto_348069 ) ) ( not ( = ?auto_348068 ?auto_348070 ) ) ( TRUCK-AT ?auto_348071 ?auto_348073 ) ( not ( = ?auto_348073 ?auto_348072 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_348069 ?auto_348070 )
      ( MAKE-2CRATE-VERIFY ?auto_348068 ?auto_348069 ?auto_348070 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_348075 - SURFACE
      ?auto_348076 - SURFACE
    )
    :vars
    (
      ?auto_348077 - HOIST
      ?auto_348078 - PLACE
      ?auto_348081 - SURFACE
      ?auto_348080 - TRUCK
      ?auto_348079 - PLACE
      ?auto_348082 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_348077 ?auto_348078 ) ( SURFACE-AT ?auto_348075 ?auto_348078 ) ( CLEAR ?auto_348075 ) ( IS-CRATE ?auto_348076 ) ( not ( = ?auto_348075 ?auto_348076 ) ) ( AVAILABLE ?auto_348077 ) ( ON ?auto_348075 ?auto_348081 ) ( not ( = ?auto_348081 ?auto_348075 ) ) ( not ( = ?auto_348081 ?auto_348076 ) ) ( TRUCK-AT ?auto_348080 ?auto_348079 ) ( not ( = ?auto_348079 ?auto_348078 ) ) ( HOIST-AT ?auto_348082 ?auto_348079 ) ( LIFTING ?auto_348082 ?auto_348076 ) ( not ( = ?auto_348077 ?auto_348082 ) ) )
    :subtasks
    ( ( !LOAD ?auto_348082 ?auto_348076 ?auto_348080 ?auto_348079 )
      ( MAKE-2CRATE ?auto_348081 ?auto_348075 ?auto_348076 )
      ( MAKE-1CRATE-VERIFY ?auto_348075 ?auto_348076 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_348083 - SURFACE
      ?auto_348084 - SURFACE
      ?auto_348085 - SURFACE
    )
    :vars
    (
      ?auto_348087 - HOIST
      ?auto_348088 - PLACE
      ?auto_348089 - TRUCK
      ?auto_348090 - PLACE
      ?auto_348086 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_348087 ?auto_348088 ) ( SURFACE-AT ?auto_348084 ?auto_348088 ) ( CLEAR ?auto_348084 ) ( IS-CRATE ?auto_348085 ) ( not ( = ?auto_348084 ?auto_348085 ) ) ( AVAILABLE ?auto_348087 ) ( ON ?auto_348084 ?auto_348083 ) ( not ( = ?auto_348083 ?auto_348084 ) ) ( not ( = ?auto_348083 ?auto_348085 ) ) ( TRUCK-AT ?auto_348089 ?auto_348090 ) ( not ( = ?auto_348090 ?auto_348088 ) ) ( HOIST-AT ?auto_348086 ?auto_348090 ) ( LIFTING ?auto_348086 ?auto_348085 ) ( not ( = ?auto_348087 ?auto_348086 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_348084 ?auto_348085 )
      ( MAKE-2CRATE-VERIFY ?auto_348083 ?auto_348084 ?auto_348085 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_348091 - SURFACE
      ?auto_348092 - SURFACE
    )
    :vars
    (
      ?auto_348098 - HOIST
      ?auto_348095 - PLACE
      ?auto_348096 - SURFACE
      ?auto_348097 - TRUCK
      ?auto_348094 - PLACE
      ?auto_348093 - HOIST
      ?auto_348099 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_348098 ?auto_348095 ) ( SURFACE-AT ?auto_348091 ?auto_348095 ) ( CLEAR ?auto_348091 ) ( IS-CRATE ?auto_348092 ) ( not ( = ?auto_348091 ?auto_348092 ) ) ( AVAILABLE ?auto_348098 ) ( ON ?auto_348091 ?auto_348096 ) ( not ( = ?auto_348096 ?auto_348091 ) ) ( not ( = ?auto_348096 ?auto_348092 ) ) ( TRUCK-AT ?auto_348097 ?auto_348094 ) ( not ( = ?auto_348094 ?auto_348095 ) ) ( HOIST-AT ?auto_348093 ?auto_348094 ) ( not ( = ?auto_348098 ?auto_348093 ) ) ( AVAILABLE ?auto_348093 ) ( SURFACE-AT ?auto_348092 ?auto_348094 ) ( ON ?auto_348092 ?auto_348099 ) ( CLEAR ?auto_348092 ) ( not ( = ?auto_348091 ?auto_348099 ) ) ( not ( = ?auto_348092 ?auto_348099 ) ) ( not ( = ?auto_348096 ?auto_348099 ) ) )
    :subtasks
    ( ( !LIFT ?auto_348093 ?auto_348092 ?auto_348099 ?auto_348094 )
      ( MAKE-2CRATE ?auto_348096 ?auto_348091 ?auto_348092 )
      ( MAKE-1CRATE-VERIFY ?auto_348091 ?auto_348092 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_348100 - SURFACE
      ?auto_348101 - SURFACE
      ?auto_348102 - SURFACE
    )
    :vars
    (
      ?auto_348104 - HOIST
      ?auto_348105 - PLACE
      ?auto_348107 - TRUCK
      ?auto_348103 - PLACE
      ?auto_348108 - HOIST
      ?auto_348106 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_348104 ?auto_348105 ) ( SURFACE-AT ?auto_348101 ?auto_348105 ) ( CLEAR ?auto_348101 ) ( IS-CRATE ?auto_348102 ) ( not ( = ?auto_348101 ?auto_348102 ) ) ( AVAILABLE ?auto_348104 ) ( ON ?auto_348101 ?auto_348100 ) ( not ( = ?auto_348100 ?auto_348101 ) ) ( not ( = ?auto_348100 ?auto_348102 ) ) ( TRUCK-AT ?auto_348107 ?auto_348103 ) ( not ( = ?auto_348103 ?auto_348105 ) ) ( HOIST-AT ?auto_348108 ?auto_348103 ) ( not ( = ?auto_348104 ?auto_348108 ) ) ( AVAILABLE ?auto_348108 ) ( SURFACE-AT ?auto_348102 ?auto_348103 ) ( ON ?auto_348102 ?auto_348106 ) ( CLEAR ?auto_348102 ) ( not ( = ?auto_348101 ?auto_348106 ) ) ( not ( = ?auto_348102 ?auto_348106 ) ) ( not ( = ?auto_348100 ?auto_348106 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_348101 ?auto_348102 )
      ( MAKE-2CRATE-VERIFY ?auto_348100 ?auto_348101 ?auto_348102 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_348109 - SURFACE
      ?auto_348110 - SURFACE
    )
    :vars
    (
      ?auto_348116 - HOIST
      ?auto_348117 - PLACE
      ?auto_348111 - SURFACE
      ?auto_348115 - PLACE
      ?auto_348114 - HOIST
      ?auto_348113 - SURFACE
      ?auto_348112 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348116 ?auto_348117 ) ( SURFACE-AT ?auto_348109 ?auto_348117 ) ( CLEAR ?auto_348109 ) ( IS-CRATE ?auto_348110 ) ( not ( = ?auto_348109 ?auto_348110 ) ) ( AVAILABLE ?auto_348116 ) ( ON ?auto_348109 ?auto_348111 ) ( not ( = ?auto_348111 ?auto_348109 ) ) ( not ( = ?auto_348111 ?auto_348110 ) ) ( not ( = ?auto_348115 ?auto_348117 ) ) ( HOIST-AT ?auto_348114 ?auto_348115 ) ( not ( = ?auto_348116 ?auto_348114 ) ) ( AVAILABLE ?auto_348114 ) ( SURFACE-AT ?auto_348110 ?auto_348115 ) ( ON ?auto_348110 ?auto_348113 ) ( CLEAR ?auto_348110 ) ( not ( = ?auto_348109 ?auto_348113 ) ) ( not ( = ?auto_348110 ?auto_348113 ) ) ( not ( = ?auto_348111 ?auto_348113 ) ) ( TRUCK-AT ?auto_348112 ?auto_348117 ) )
    :subtasks
    ( ( !DRIVE ?auto_348112 ?auto_348117 ?auto_348115 )
      ( MAKE-2CRATE ?auto_348111 ?auto_348109 ?auto_348110 )
      ( MAKE-1CRATE-VERIFY ?auto_348109 ?auto_348110 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_348118 - SURFACE
      ?auto_348119 - SURFACE
      ?auto_348120 - SURFACE
    )
    :vars
    (
      ?auto_348125 - HOIST
      ?auto_348123 - PLACE
      ?auto_348122 - PLACE
      ?auto_348126 - HOIST
      ?auto_348124 - SURFACE
      ?auto_348121 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348125 ?auto_348123 ) ( SURFACE-AT ?auto_348119 ?auto_348123 ) ( CLEAR ?auto_348119 ) ( IS-CRATE ?auto_348120 ) ( not ( = ?auto_348119 ?auto_348120 ) ) ( AVAILABLE ?auto_348125 ) ( ON ?auto_348119 ?auto_348118 ) ( not ( = ?auto_348118 ?auto_348119 ) ) ( not ( = ?auto_348118 ?auto_348120 ) ) ( not ( = ?auto_348122 ?auto_348123 ) ) ( HOIST-AT ?auto_348126 ?auto_348122 ) ( not ( = ?auto_348125 ?auto_348126 ) ) ( AVAILABLE ?auto_348126 ) ( SURFACE-AT ?auto_348120 ?auto_348122 ) ( ON ?auto_348120 ?auto_348124 ) ( CLEAR ?auto_348120 ) ( not ( = ?auto_348119 ?auto_348124 ) ) ( not ( = ?auto_348120 ?auto_348124 ) ) ( not ( = ?auto_348118 ?auto_348124 ) ) ( TRUCK-AT ?auto_348121 ?auto_348123 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_348119 ?auto_348120 )
      ( MAKE-2CRATE-VERIFY ?auto_348118 ?auto_348119 ?auto_348120 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_348127 - SURFACE
      ?auto_348128 - SURFACE
    )
    :vars
    (
      ?auto_348129 - HOIST
      ?auto_348133 - PLACE
      ?auto_348132 - SURFACE
      ?auto_348130 - PLACE
      ?auto_348135 - HOIST
      ?auto_348131 - SURFACE
      ?auto_348134 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348129 ?auto_348133 ) ( IS-CRATE ?auto_348128 ) ( not ( = ?auto_348127 ?auto_348128 ) ) ( not ( = ?auto_348132 ?auto_348127 ) ) ( not ( = ?auto_348132 ?auto_348128 ) ) ( not ( = ?auto_348130 ?auto_348133 ) ) ( HOIST-AT ?auto_348135 ?auto_348130 ) ( not ( = ?auto_348129 ?auto_348135 ) ) ( AVAILABLE ?auto_348135 ) ( SURFACE-AT ?auto_348128 ?auto_348130 ) ( ON ?auto_348128 ?auto_348131 ) ( CLEAR ?auto_348128 ) ( not ( = ?auto_348127 ?auto_348131 ) ) ( not ( = ?auto_348128 ?auto_348131 ) ) ( not ( = ?auto_348132 ?auto_348131 ) ) ( TRUCK-AT ?auto_348134 ?auto_348133 ) ( SURFACE-AT ?auto_348132 ?auto_348133 ) ( CLEAR ?auto_348132 ) ( LIFTING ?auto_348129 ?auto_348127 ) ( IS-CRATE ?auto_348127 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_348132 ?auto_348127 )
      ( MAKE-2CRATE ?auto_348132 ?auto_348127 ?auto_348128 )
      ( MAKE-1CRATE-VERIFY ?auto_348127 ?auto_348128 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_348136 - SURFACE
      ?auto_348137 - SURFACE
      ?auto_348138 - SURFACE
    )
    :vars
    (
      ?auto_348143 - HOIST
      ?auto_348142 - PLACE
      ?auto_348139 - PLACE
      ?auto_348141 - HOIST
      ?auto_348144 - SURFACE
      ?auto_348140 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348143 ?auto_348142 ) ( IS-CRATE ?auto_348138 ) ( not ( = ?auto_348137 ?auto_348138 ) ) ( not ( = ?auto_348136 ?auto_348137 ) ) ( not ( = ?auto_348136 ?auto_348138 ) ) ( not ( = ?auto_348139 ?auto_348142 ) ) ( HOIST-AT ?auto_348141 ?auto_348139 ) ( not ( = ?auto_348143 ?auto_348141 ) ) ( AVAILABLE ?auto_348141 ) ( SURFACE-AT ?auto_348138 ?auto_348139 ) ( ON ?auto_348138 ?auto_348144 ) ( CLEAR ?auto_348138 ) ( not ( = ?auto_348137 ?auto_348144 ) ) ( not ( = ?auto_348138 ?auto_348144 ) ) ( not ( = ?auto_348136 ?auto_348144 ) ) ( TRUCK-AT ?auto_348140 ?auto_348142 ) ( SURFACE-AT ?auto_348136 ?auto_348142 ) ( CLEAR ?auto_348136 ) ( LIFTING ?auto_348143 ?auto_348137 ) ( IS-CRATE ?auto_348137 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_348137 ?auto_348138 )
      ( MAKE-2CRATE-VERIFY ?auto_348136 ?auto_348137 ?auto_348138 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_348145 - SURFACE
      ?auto_348146 - SURFACE
    )
    :vars
    (
      ?auto_348150 - HOIST
      ?auto_348152 - PLACE
      ?auto_348151 - SURFACE
      ?auto_348153 - PLACE
      ?auto_348147 - HOIST
      ?auto_348149 - SURFACE
      ?auto_348148 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348150 ?auto_348152 ) ( IS-CRATE ?auto_348146 ) ( not ( = ?auto_348145 ?auto_348146 ) ) ( not ( = ?auto_348151 ?auto_348145 ) ) ( not ( = ?auto_348151 ?auto_348146 ) ) ( not ( = ?auto_348153 ?auto_348152 ) ) ( HOIST-AT ?auto_348147 ?auto_348153 ) ( not ( = ?auto_348150 ?auto_348147 ) ) ( AVAILABLE ?auto_348147 ) ( SURFACE-AT ?auto_348146 ?auto_348153 ) ( ON ?auto_348146 ?auto_348149 ) ( CLEAR ?auto_348146 ) ( not ( = ?auto_348145 ?auto_348149 ) ) ( not ( = ?auto_348146 ?auto_348149 ) ) ( not ( = ?auto_348151 ?auto_348149 ) ) ( TRUCK-AT ?auto_348148 ?auto_348152 ) ( SURFACE-AT ?auto_348151 ?auto_348152 ) ( CLEAR ?auto_348151 ) ( IS-CRATE ?auto_348145 ) ( AVAILABLE ?auto_348150 ) ( IN ?auto_348145 ?auto_348148 ) )
    :subtasks
    ( ( !UNLOAD ?auto_348150 ?auto_348145 ?auto_348148 ?auto_348152 )
      ( MAKE-2CRATE ?auto_348151 ?auto_348145 ?auto_348146 )
      ( MAKE-1CRATE-VERIFY ?auto_348145 ?auto_348146 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_348154 - SURFACE
      ?auto_348155 - SURFACE
      ?auto_348156 - SURFACE
    )
    :vars
    (
      ?auto_348162 - HOIST
      ?auto_348158 - PLACE
      ?auto_348157 - PLACE
      ?auto_348161 - HOIST
      ?auto_348159 - SURFACE
      ?auto_348160 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348162 ?auto_348158 ) ( IS-CRATE ?auto_348156 ) ( not ( = ?auto_348155 ?auto_348156 ) ) ( not ( = ?auto_348154 ?auto_348155 ) ) ( not ( = ?auto_348154 ?auto_348156 ) ) ( not ( = ?auto_348157 ?auto_348158 ) ) ( HOIST-AT ?auto_348161 ?auto_348157 ) ( not ( = ?auto_348162 ?auto_348161 ) ) ( AVAILABLE ?auto_348161 ) ( SURFACE-AT ?auto_348156 ?auto_348157 ) ( ON ?auto_348156 ?auto_348159 ) ( CLEAR ?auto_348156 ) ( not ( = ?auto_348155 ?auto_348159 ) ) ( not ( = ?auto_348156 ?auto_348159 ) ) ( not ( = ?auto_348154 ?auto_348159 ) ) ( TRUCK-AT ?auto_348160 ?auto_348158 ) ( SURFACE-AT ?auto_348154 ?auto_348158 ) ( CLEAR ?auto_348154 ) ( IS-CRATE ?auto_348155 ) ( AVAILABLE ?auto_348162 ) ( IN ?auto_348155 ?auto_348160 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_348155 ?auto_348156 )
      ( MAKE-2CRATE-VERIFY ?auto_348154 ?auto_348155 ?auto_348156 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_348199 - SURFACE
      ?auto_348200 - SURFACE
    )
    :vars
    (
      ?auto_348205 - HOIST
      ?auto_348201 - PLACE
      ?auto_348207 - SURFACE
      ?auto_348202 - PLACE
      ?auto_348206 - HOIST
      ?auto_348204 - SURFACE
      ?auto_348203 - TRUCK
      ?auto_348208 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_348205 ?auto_348201 ) ( SURFACE-AT ?auto_348199 ?auto_348201 ) ( CLEAR ?auto_348199 ) ( IS-CRATE ?auto_348200 ) ( not ( = ?auto_348199 ?auto_348200 ) ) ( AVAILABLE ?auto_348205 ) ( ON ?auto_348199 ?auto_348207 ) ( not ( = ?auto_348207 ?auto_348199 ) ) ( not ( = ?auto_348207 ?auto_348200 ) ) ( not ( = ?auto_348202 ?auto_348201 ) ) ( HOIST-AT ?auto_348206 ?auto_348202 ) ( not ( = ?auto_348205 ?auto_348206 ) ) ( AVAILABLE ?auto_348206 ) ( SURFACE-AT ?auto_348200 ?auto_348202 ) ( ON ?auto_348200 ?auto_348204 ) ( CLEAR ?auto_348200 ) ( not ( = ?auto_348199 ?auto_348204 ) ) ( not ( = ?auto_348200 ?auto_348204 ) ) ( not ( = ?auto_348207 ?auto_348204 ) ) ( TRUCK-AT ?auto_348203 ?auto_348208 ) ( not ( = ?auto_348208 ?auto_348201 ) ) ( not ( = ?auto_348202 ?auto_348208 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_348203 ?auto_348208 ?auto_348201 )
      ( MAKE-1CRATE ?auto_348199 ?auto_348200 )
      ( MAKE-1CRATE-VERIFY ?auto_348199 ?auto_348200 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_348239 - SURFACE
      ?auto_348240 - SURFACE
      ?auto_348241 - SURFACE
      ?auto_348238 - SURFACE
    )
    :vars
    (
      ?auto_348243 - HOIST
      ?auto_348242 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_348243 ?auto_348242 ) ( SURFACE-AT ?auto_348241 ?auto_348242 ) ( CLEAR ?auto_348241 ) ( LIFTING ?auto_348243 ?auto_348238 ) ( IS-CRATE ?auto_348238 ) ( not ( = ?auto_348241 ?auto_348238 ) ) ( ON ?auto_348240 ?auto_348239 ) ( ON ?auto_348241 ?auto_348240 ) ( not ( = ?auto_348239 ?auto_348240 ) ) ( not ( = ?auto_348239 ?auto_348241 ) ) ( not ( = ?auto_348239 ?auto_348238 ) ) ( not ( = ?auto_348240 ?auto_348241 ) ) ( not ( = ?auto_348240 ?auto_348238 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_348241 ?auto_348238 )
      ( MAKE-3CRATE-VERIFY ?auto_348239 ?auto_348240 ?auto_348241 ?auto_348238 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_348256 - SURFACE
      ?auto_348257 - SURFACE
      ?auto_348258 - SURFACE
      ?auto_348255 - SURFACE
    )
    :vars
    (
      ?auto_348259 - HOIST
      ?auto_348261 - PLACE
      ?auto_348260 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348259 ?auto_348261 ) ( SURFACE-AT ?auto_348258 ?auto_348261 ) ( CLEAR ?auto_348258 ) ( IS-CRATE ?auto_348255 ) ( not ( = ?auto_348258 ?auto_348255 ) ) ( TRUCK-AT ?auto_348260 ?auto_348261 ) ( AVAILABLE ?auto_348259 ) ( IN ?auto_348255 ?auto_348260 ) ( ON ?auto_348258 ?auto_348257 ) ( not ( = ?auto_348257 ?auto_348258 ) ) ( not ( = ?auto_348257 ?auto_348255 ) ) ( ON ?auto_348257 ?auto_348256 ) ( not ( = ?auto_348256 ?auto_348257 ) ) ( not ( = ?auto_348256 ?auto_348258 ) ) ( not ( = ?auto_348256 ?auto_348255 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348257 ?auto_348258 ?auto_348255 )
      ( MAKE-3CRATE-VERIFY ?auto_348256 ?auto_348257 ?auto_348258 ?auto_348255 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_348277 - SURFACE
      ?auto_348278 - SURFACE
      ?auto_348279 - SURFACE
      ?auto_348276 - SURFACE
    )
    :vars
    (
      ?auto_348281 - HOIST
      ?auto_348280 - PLACE
      ?auto_348282 - TRUCK
      ?auto_348283 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_348281 ?auto_348280 ) ( SURFACE-AT ?auto_348279 ?auto_348280 ) ( CLEAR ?auto_348279 ) ( IS-CRATE ?auto_348276 ) ( not ( = ?auto_348279 ?auto_348276 ) ) ( AVAILABLE ?auto_348281 ) ( IN ?auto_348276 ?auto_348282 ) ( ON ?auto_348279 ?auto_348278 ) ( not ( = ?auto_348278 ?auto_348279 ) ) ( not ( = ?auto_348278 ?auto_348276 ) ) ( TRUCK-AT ?auto_348282 ?auto_348283 ) ( not ( = ?auto_348283 ?auto_348280 ) ) ( ON ?auto_348278 ?auto_348277 ) ( not ( = ?auto_348277 ?auto_348278 ) ) ( not ( = ?auto_348277 ?auto_348279 ) ) ( not ( = ?auto_348277 ?auto_348276 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348278 ?auto_348279 ?auto_348276 )
      ( MAKE-3CRATE-VERIFY ?auto_348277 ?auto_348278 ?auto_348279 ?auto_348276 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_348301 - SURFACE
      ?auto_348302 - SURFACE
      ?auto_348303 - SURFACE
      ?auto_348300 - SURFACE
    )
    :vars
    (
      ?auto_348308 - HOIST
      ?auto_348306 - PLACE
      ?auto_348304 - TRUCK
      ?auto_348305 - PLACE
      ?auto_348307 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_348308 ?auto_348306 ) ( SURFACE-AT ?auto_348303 ?auto_348306 ) ( CLEAR ?auto_348303 ) ( IS-CRATE ?auto_348300 ) ( not ( = ?auto_348303 ?auto_348300 ) ) ( AVAILABLE ?auto_348308 ) ( ON ?auto_348303 ?auto_348302 ) ( not ( = ?auto_348302 ?auto_348303 ) ) ( not ( = ?auto_348302 ?auto_348300 ) ) ( TRUCK-AT ?auto_348304 ?auto_348305 ) ( not ( = ?auto_348305 ?auto_348306 ) ) ( HOIST-AT ?auto_348307 ?auto_348305 ) ( LIFTING ?auto_348307 ?auto_348300 ) ( not ( = ?auto_348308 ?auto_348307 ) ) ( ON ?auto_348302 ?auto_348301 ) ( not ( = ?auto_348301 ?auto_348302 ) ) ( not ( = ?auto_348301 ?auto_348303 ) ) ( not ( = ?auto_348301 ?auto_348300 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348302 ?auto_348303 ?auto_348300 )
      ( MAKE-3CRATE-VERIFY ?auto_348301 ?auto_348302 ?auto_348303 ?auto_348300 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_348328 - SURFACE
      ?auto_348329 - SURFACE
      ?auto_348330 - SURFACE
      ?auto_348327 - SURFACE
    )
    :vars
    (
      ?auto_348335 - HOIST
      ?auto_348331 - PLACE
      ?auto_348333 - TRUCK
      ?auto_348334 - PLACE
      ?auto_348336 - HOIST
      ?auto_348332 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_348335 ?auto_348331 ) ( SURFACE-AT ?auto_348330 ?auto_348331 ) ( CLEAR ?auto_348330 ) ( IS-CRATE ?auto_348327 ) ( not ( = ?auto_348330 ?auto_348327 ) ) ( AVAILABLE ?auto_348335 ) ( ON ?auto_348330 ?auto_348329 ) ( not ( = ?auto_348329 ?auto_348330 ) ) ( not ( = ?auto_348329 ?auto_348327 ) ) ( TRUCK-AT ?auto_348333 ?auto_348334 ) ( not ( = ?auto_348334 ?auto_348331 ) ) ( HOIST-AT ?auto_348336 ?auto_348334 ) ( not ( = ?auto_348335 ?auto_348336 ) ) ( AVAILABLE ?auto_348336 ) ( SURFACE-AT ?auto_348327 ?auto_348334 ) ( ON ?auto_348327 ?auto_348332 ) ( CLEAR ?auto_348327 ) ( not ( = ?auto_348330 ?auto_348332 ) ) ( not ( = ?auto_348327 ?auto_348332 ) ) ( not ( = ?auto_348329 ?auto_348332 ) ) ( ON ?auto_348329 ?auto_348328 ) ( not ( = ?auto_348328 ?auto_348329 ) ) ( not ( = ?auto_348328 ?auto_348330 ) ) ( not ( = ?auto_348328 ?auto_348327 ) ) ( not ( = ?auto_348328 ?auto_348332 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348329 ?auto_348330 ?auto_348327 )
      ( MAKE-3CRATE-VERIFY ?auto_348328 ?auto_348329 ?auto_348330 ?auto_348327 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_348356 - SURFACE
      ?auto_348357 - SURFACE
      ?auto_348358 - SURFACE
      ?auto_348355 - SURFACE
    )
    :vars
    (
      ?auto_348360 - HOIST
      ?auto_348359 - PLACE
      ?auto_348361 - PLACE
      ?auto_348364 - HOIST
      ?auto_348362 - SURFACE
      ?auto_348363 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348360 ?auto_348359 ) ( SURFACE-AT ?auto_348358 ?auto_348359 ) ( CLEAR ?auto_348358 ) ( IS-CRATE ?auto_348355 ) ( not ( = ?auto_348358 ?auto_348355 ) ) ( AVAILABLE ?auto_348360 ) ( ON ?auto_348358 ?auto_348357 ) ( not ( = ?auto_348357 ?auto_348358 ) ) ( not ( = ?auto_348357 ?auto_348355 ) ) ( not ( = ?auto_348361 ?auto_348359 ) ) ( HOIST-AT ?auto_348364 ?auto_348361 ) ( not ( = ?auto_348360 ?auto_348364 ) ) ( AVAILABLE ?auto_348364 ) ( SURFACE-AT ?auto_348355 ?auto_348361 ) ( ON ?auto_348355 ?auto_348362 ) ( CLEAR ?auto_348355 ) ( not ( = ?auto_348358 ?auto_348362 ) ) ( not ( = ?auto_348355 ?auto_348362 ) ) ( not ( = ?auto_348357 ?auto_348362 ) ) ( TRUCK-AT ?auto_348363 ?auto_348359 ) ( ON ?auto_348357 ?auto_348356 ) ( not ( = ?auto_348356 ?auto_348357 ) ) ( not ( = ?auto_348356 ?auto_348358 ) ) ( not ( = ?auto_348356 ?auto_348355 ) ) ( not ( = ?auto_348356 ?auto_348362 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348357 ?auto_348358 ?auto_348355 )
      ( MAKE-3CRATE-VERIFY ?auto_348356 ?auto_348357 ?auto_348358 ?auto_348355 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_348384 - SURFACE
      ?auto_348385 - SURFACE
      ?auto_348386 - SURFACE
      ?auto_348383 - SURFACE
    )
    :vars
    (
      ?auto_348387 - HOIST
      ?auto_348391 - PLACE
      ?auto_348390 - PLACE
      ?auto_348389 - HOIST
      ?auto_348392 - SURFACE
      ?auto_348388 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348387 ?auto_348391 ) ( IS-CRATE ?auto_348383 ) ( not ( = ?auto_348386 ?auto_348383 ) ) ( not ( = ?auto_348385 ?auto_348386 ) ) ( not ( = ?auto_348385 ?auto_348383 ) ) ( not ( = ?auto_348390 ?auto_348391 ) ) ( HOIST-AT ?auto_348389 ?auto_348390 ) ( not ( = ?auto_348387 ?auto_348389 ) ) ( AVAILABLE ?auto_348389 ) ( SURFACE-AT ?auto_348383 ?auto_348390 ) ( ON ?auto_348383 ?auto_348392 ) ( CLEAR ?auto_348383 ) ( not ( = ?auto_348386 ?auto_348392 ) ) ( not ( = ?auto_348383 ?auto_348392 ) ) ( not ( = ?auto_348385 ?auto_348392 ) ) ( TRUCK-AT ?auto_348388 ?auto_348391 ) ( SURFACE-AT ?auto_348385 ?auto_348391 ) ( CLEAR ?auto_348385 ) ( LIFTING ?auto_348387 ?auto_348386 ) ( IS-CRATE ?auto_348386 ) ( ON ?auto_348385 ?auto_348384 ) ( not ( = ?auto_348384 ?auto_348385 ) ) ( not ( = ?auto_348384 ?auto_348386 ) ) ( not ( = ?auto_348384 ?auto_348383 ) ) ( not ( = ?auto_348384 ?auto_348392 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348385 ?auto_348386 ?auto_348383 )
      ( MAKE-3CRATE-VERIFY ?auto_348384 ?auto_348385 ?auto_348386 ?auto_348383 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_348412 - SURFACE
      ?auto_348413 - SURFACE
      ?auto_348414 - SURFACE
      ?auto_348411 - SURFACE
    )
    :vars
    (
      ?auto_348419 - HOIST
      ?auto_348416 - PLACE
      ?auto_348417 - PLACE
      ?auto_348415 - HOIST
      ?auto_348420 - SURFACE
      ?auto_348418 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348419 ?auto_348416 ) ( IS-CRATE ?auto_348411 ) ( not ( = ?auto_348414 ?auto_348411 ) ) ( not ( = ?auto_348413 ?auto_348414 ) ) ( not ( = ?auto_348413 ?auto_348411 ) ) ( not ( = ?auto_348417 ?auto_348416 ) ) ( HOIST-AT ?auto_348415 ?auto_348417 ) ( not ( = ?auto_348419 ?auto_348415 ) ) ( AVAILABLE ?auto_348415 ) ( SURFACE-AT ?auto_348411 ?auto_348417 ) ( ON ?auto_348411 ?auto_348420 ) ( CLEAR ?auto_348411 ) ( not ( = ?auto_348414 ?auto_348420 ) ) ( not ( = ?auto_348411 ?auto_348420 ) ) ( not ( = ?auto_348413 ?auto_348420 ) ) ( TRUCK-AT ?auto_348418 ?auto_348416 ) ( SURFACE-AT ?auto_348413 ?auto_348416 ) ( CLEAR ?auto_348413 ) ( IS-CRATE ?auto_348414 ) ( AVAILABLE ?auto_348419 ) ( IN ?auto_348414 ?auto_348418 ) ( ON ?auto_348413 ?auto_348412 ) ( not ( = ?auto_348412 ?auto_348413 ) ) ( not ( = ?auto_348412 ?auto_348414 ) ) ( not ( = ?auto_348412 ?auto_348411 ) ) ( not ( = ?auto_348412 ?auto_348420 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348413 ?auto_348414 ?auto_348411 )
      ( MAKE-3CRATE-VERIFY ?auto_348412 ?auto_348413 ?auto_348414 ?auto_348411 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_348703 - SURFACE
      ?auto_348704 - SURFACE
      ?auto_348705 - SURFACE
      ?auto_348702 - SURFACE
      ?auto_348706 - SURFACE
    )
    :vars
    (
      ?auto_348708 - HOIST
      ?auto_348707 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_348708 ?auto_348707 ) ( SURFACE-AT ?auto_348702 ?auto_348707 ) ( CLEAR ?auto_348702 ) ( LIFTING ?auto_348708 ?auto_348706 ) ( IS-CRATE ?auto_348706 ) ( not ( = ?auto_348702 ?auto_348706 ) ) ( ON ?auto_348704 ?auto_348703 ) ( ON ?auto_348705 ?auto_348704 ) ( ON ?auto_348702 ?auto_348705 ) ( not ( = ?auto_348703 ?auto_348704 ) ) ( not ( = ?auto_348703 ?auto_348705 ) ) ( not ( = ?auto_348703 ?auto_348702 ) ) ( not ( = ?auto_348703 ?auto_348706 ) ) ( not ( = ?auto_348704 ?auto_348705 ) ) ( not ( = ?auto_348704 ?auto_348702 ) ) ( not ( = ?auto_348704 ?auto_348706 ) ) ( not ( = ?auto_348705 ?auto_348702 ) ) ( not ( = ?auto_348705 ?auto_348706 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_348702 ?auto_348706 )
      ( MAKE-4CRATE-VERIFY ?auto_348703 ?auto_348704 ?auto_348705 ?auto_348702 ?auto_348706 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_348728 - SURFACE
      ?auto_348729 - SURFACE
      ?auto_348730 - SURFACE
      ?auto_348727 - SURFACE
      ?auto_348731 - SURFACE
    )
    :vars
    (
      ?auto_348732 - HOIST
      ?auto_348733 - PLACE
      ?auto_348734 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348732 ?auto_348733 ) ( SURFACE-AT ?auto_348727 ?auto_348733 ) ( CLEAR ?auto_348727 ) ( IS-CRATE ?auto_348731 ) ( not ( = ?auto_348727 ?auto_348731 ) ) ( TRUCK-AT ?auto_348734 ?auto_348733 ) ( AVAILABLE ?auto_348732 ) ( IN ?auto_348731 ?auto_348734 ) ( ON ?auto_348727 ?auto_348730 ) ( not ( = ?auto_348730 ?auto_348727 ) ) ( not ( = ?auto_348730 ?auto_348731 ) ) ( ON ?auto_348729 ?auto_348728 ) ( ON ?auto_348730 ?auto_348729 ) ( not ( = ?auto_348728 ?auto_348729 ) ) ( not ( = ?auto_348728 ?auto_348730 ) ) ( not ( = ?auto_348728 ?auto_348727 ) ) ( not ( = ?auto_348728 ?auto_348731 ) ) ( not ( = ?auto_348729 ?auto_348730 ) ) ( not ( = ?auto_348729 ?auto_348727 ) ) ( not ( = ?auto_348729 ?auto_348731 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348730 ?auto_348727 ?auto_348731 )
      ( MAKE-4CRATE-VERIFY ?auto_348728 ?auto_348729 ?auto_348730 ?auto_348727 ?auto_348731 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_348758 - SURFACE
      ?auto_348759 - SURFACE
      ?auto_348760 - SURFACE
      ?auto_348757 - SURFACE
      ?auto_348761 - SURFACE
    )
    :vars
    (
      ?auto_348765 - HOIST
      ?auto_348764 - PLACE
      ?auto_348763 - TRUCK
      ?auto_348762 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_348765 ?auto_348764 ) ( SURFACE-AT ?auto_348757 ?auto_348764 ) ( CLEAR ?auto_348757 ) ( IS-CRATE ?auto_348761 ) ( not ( = ?auto_348757 ?auto_348761 ) ) ( AVAILABLE ?auto_348765 ) ( IN ?auto_348761 ?auto_348763 ) ( ON ?auto_348757 ?auto_348760 ) ( not ( = ?auto_348760 ?auto_348757 ) ) ( not ( = ?auto_348760 ?auto_348761 ) ) ( TRUCK-AT ?auto_348763 ?auto_348762 ) ( not ( = ?auto_348762 ?auto_348764 ) ) ( ON ?auto_348759 ?auto_348758 ) ( ON ?auto_348760 ?auto_348759 ) ( not ( = ?auto_348758 ?auto_348759 ) ) ( not ( = ?auto_348758 ?auto_348760 ) ) ( not ( = ?auto_348758 ?auto_348757 ) ) ( not ( = ?auto_348758 ?auto_348761 ) ) ( not ( = ?auto_348759 ?auto_348760 ) ) ( not ( = ?auto_348759 ?auto_348757 ) ) ( not ( = ?auto_348759 ?auto_348761 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348760 ?auto_348757 ?auto_348761 )
      ( MAKE-4CRATE-VERIFY ?auto_348758 ?auto_348759 ?auto_348760 ?auto_348757 ?auto_348761 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_348792 - SURFACE
      ?auto_348793 - SURFACE
      ?auto_348794 - SURFACE
      ?auto_348791 - SURFACE
      ?auto_348795 - SURFACE
    )
    :vars
    (
      ?auto_348798 - HOIST
      ?auto_348796 - PLACE
      ?auto_348800 - TRUCK
      ?auto_348797 - PLACE
      ?auto_348799 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_348798 ?auto_348796 ) ( SURFACE-AT ?auto_348791 ?auto_348796 ) ( CLEAR ?auto_348791 ) ( IS-CRATE ?auto_348795 ) ( not ( = ?auto_348791 ?auto_348795 ) ) ( AVAILABLE ?auto_348798 ) ( ON ?auto_348791 ?auto_348794 ) ( not ( = ?auto_348794 ?auto_348791 ) ) ( not ( = ?auto_348794 ?auto_348795 ) ) ( TRUCK-AT ?auto_348800 ?auto_348797 ) ( not ( = ?auto_348797 ?auto_348796 ) ) ( HOIST-AT ?auto_348799 ?auto_348797 ) ( LIFTING ?auto_348799 ?auto_348795 ) ( not ( = ?auto_348798 ?auto_348799 ) ) ( ON ?auto_348793 ?auto_348792 ) ( ON ?auto_348794 ?auto_348793 ) ( not ( = ?auto_348792 ?auto_348793 ) ) ( not ( = ?auto_348792 ?auto_348794 ) ) ( not ( = ?auto_348792 ?auto_348791 ) ) ( not ( = ?auto_348792 ?auto_348795 ) ) ( not ( = ?auto_348793 ?auto_348794 ) ) ( not ( = ?auto_348793 ?auto_348791 ) ) ( not ( = ?auto_348793 ?auto_348795 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348794 ?auto_348791 ?auto_348795 )
      ( MAKE-4CRATE-VERIFY ?auto_348792 ?auto_348793 ?auto_348794 ?auto_348791 ?auto_348795 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_348830 - SURFACE
      ?auto_348831 - SURFACE
      ?auto_348832 - SURFACE
      ?auto_348829 - SURFACE
      ?auto_348833 - SURFACE
    )
    :vars
    (
      ?auto_348837 - HOIST
      ?auto_348836 - PLACE
      ?auto_348834 - TRUCK
      ?auto_348839 - PLACE
      ?auto_348835 - HOIST
      ?auto_348838 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_348837 ?auto_348836 ) ( SURFACE-AT ?auto_348829 ?auto_348836 ) ( CLEAR ?auto_348829 ) ( IS-CRATE ?auto_348833 ) ( not ( = ?auto_348829 ?auto_348833 ) ) ( AVAILABLE ?auto_348837 ) ( ON ?auto_348829 ?auto_348832 ) ( not ( = ?auto_348832 ?auto_348829 ) ) ( not ( = ?auto_348832 ?auto_348833 ) ) ( TRUCK-AT ?auto_348834 ?auto_348839 ) ( not ( = ?auto_348839 ?auto_348836 ) ) ( HOIST-AT ?auto_348835 ?auto_348839 ) ( not ( = ?auto_348837 ?auto_348835 ) ) ( AVAILABLE ?auto_348835 ) ( SURFACE-AT ?auto_348833 ?auto_348839 ) ( ON ?auto_348833 ?auto_348838 ) ( CLEAR ?auto_348833 ) ( not ( = ?auto_348829 ?auto_348838 ) ) ( not ( = ?auto_348833 ?auto_348838 ) ) ( not ( = ?auto_348832 ?auto_348838 ) ) ( ON ?auto_348831 ?auto_348830 ) ( ON ?auto_348832 ?auto_348831 ) ( not ( = ?auto_348830 ?auto_348831 ) ) ( not ( = ?auto_348830 ?auto_348832 ) ) ( not ( = ?auto_348830 ?auto_348829 ) ) ( not ( = ?auto_348830 ?auto_348833 ) ) ( not ( = ?auto_348830 ?auto_348838 ) ) ( not ( = ?auto_348831 ?auto_348832 ) ) ( not ( = ?auto_348831 ?auto_348829 ) ) ( not ( = ?auto_348831 ?auto_348833 ) ) ( not ( = ?auto_348831 ?auto_348838 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348832 ?auto_348829 ?auto_348833 )
      ( MAKE-4CRATE-VERIFY ?auto_348830 ?auto_348831 ?auto_348832 ?auto_348829 ?auto_348833 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_348869 - SURFACE
      ?auto_348870 - SURFACE
      ?auto_348871 - SURFACE
      ?auto_348868 - SURFACE
      ?auto_348872 - SURFACE
    )
    :vars
    (
      ?auto_348877 - HOIST
      ?auto_348874 - PLACE
      ?auto_348875 - PLACE
      ?auto_348878 - HOIST
      ?auto_348873 - SURFACE
      ?auto_348876 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348877 ?auto_348874 ) ( SURFACE-AT ?auto_348868 ?auto_348874 ) ( CLEAR ?auto_348868 ) ( IS-CRATE ?auto_348872 ) ( not ( = ?auto_348868 ?auto_348872 ) ) ( AVAILABLE ?auto_348877 ) ( ON ?auto_348868 ?auto_348871 ) ( not ( = ?auto_348871 ?auto_348868 ) ) ( not ( = ?auto_348871 ?auto_348872 ) ) ( not ( = ?auto_348875 ?auto_348874 ) ) ( HOIST-AT ?auto_348878 ?auto_348875 ) ( not ( = ?auto_348877 ?auto_348878 ) ) ( AVAILABLE ?auto_348878 ) ( SURFACE-AT ?auto_348872 ?auto_348875 ) ( ON ?auto_348872 ?auto_348873 ) ( CLEAR ?auto_348872 ) ( not ( = ?auto_348868 ?auto_348873 ) ) ( not ( = ?auto_348872 ?auto_348873 ) ) ( not ( = ?auto_348871 ?auto_348873 ) ) ( TRUCK-AT ?auto_348876 ?auto_348874 ) ( ON ?auto_348870 ?auto_348869 ) ( ON ?auto_348871 ?auto_348870 ) ( not ( = ?auto_348869 ?auto_348870 ) ) ( not ( = ?auto_348869 ?auto_348871 ) ) ( not ( = ?auto_348869 ?auto_348868 ) ) ( not ( = ?auto_348869 ?auto_348872 ) ) ( not ( = ?auto_348869 ?auto_348873 ) ) ( not ( = ?auto_348870 ?auto_348871 ) ) ( not ( = ?auto_348870 ?auto_348868 ) ) ( not ( = ?auto_348870 ?auto_348872 ) ) ( not ( = ?auto_348870 ?auto_348873 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348871 ?auto_348868 ?auto_348872 )
      ( MAKE-4CRATE-VERIFY ?auto_348869 ?auto_348870 ?auto_348871 ?auto_348868 ?auto_348872 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_348908 - SURFACE
      ?auto_348909 - SURFACE
      ?auto_348910 - SURFACE
      ?auto_348907 - SURFACE
      ?auto_348911 - SURFACE
    )
    :vars
    (
      ?auto_348915 - HOIST
      ?auto_348912 - PLACE
      ?auto_348917 - PLACE
      ?auto_348916 - HOIST
      ?auto_348913 - SURFACE
      ?auto_348914 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348915 ?auto_348912 ) ( IS-CRATE ?auto_348911 ) ( not ( = ?auto_348907 ?auto_348911 ) ) ( not ( = ?auto_348910 ?auto_348907 ) ) ( not ( = ?auto_348910 ?auto_348911 ) ) ( not ( = ?auto_348917 ?auto_348912 ) ) ( HOIST-AT ?auto_348916 ?auto_348917 ) ( not ( = ?auto_348915 ?auto_348916 ) ) ( AVAILABLE ?auto_348916 ) ( SURFACE-AT ?auto_348911 ?auto_348917 ) ( ON ?auto_348911 ?auto_348913 ) ( CLEAR ?auto_348911 ) ( not ( = ?auto_348907 ?auto_348913 ) ) ( not ( = ?auto_348911 ?auto_348913 ) ) ( not ( = ?auto_348910 ?auto_348913 ) ) ( TRUCK-AT ?auto_348914 ?auto_348912 ) ( SURFACE-AT ?auto_348910 ?auto_348912 ) ( CLEAR ?auto_348910 ) ( LIFTING ?auto_348915 ?auto_348907 ) ( IS-CRATE ?auto_348907 ) ( ON ?auto_348909 ?auto_348908 ) ( ON ?auto_348910 ?auto_348909 ) ( not ( = ?auto_348908 ?auto_348909 ) ) ( not ( = ?auto_348908 ?auto_348910 ) ) ( not ( = ?auto_348908 ?auto_348907 ) ) ( not ( = ?auto_348908 ?auto_348911 ) ) ( not ( = ?auto_348908 ?auto_348913 ) ) ( not ( = ?auto_348909 ?auto_348910 ) ) ( not ( = ?auto_348909 ?auto_348907 ) ) ( not ( = ?auto_348909 ?auto_348911 ) ) ( not ( = ?auto_348909 ?auto_348913 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348910 ?auto_348907 ?auto_348911 )
      ( MAKE-4CRATE-VERIFY ?auto_348908 ?auto_348909 ?auto_348910 ?auto_348907 ?auto_348911 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_348947 - SURFACE
      ?auto_348948 - SURFACE
      ?auto_348949 - SURFACE
      ?auto_348946 - SURFACE
      ?auto_348950 - SURFACE
    )
    :vars
    (
      ?auto_348953 - HOIST
      ?auto_348956 - PLACE
      ?auto_348952 - PLACE
      ?auto_348954 - HOIST
      ?auto_348951 - SURFACE
      ?auto_348955 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348953 ?auto_348956 ) ( IS-CRATE ?auto_348950 ) ( not ( = ?auto_348946 ?auto_348950 ) ) ( not ( = ?auto_348949 ?auto_348946 ) ) ( not ( = ?auto_348949 ?auto_348950 ) ) ( not ( = ?auto_348952 ?auto_348956 ) ) ( HOIST-AT ?auto_348954 ?auto_348952 ) ( not ( = ?auto_348953 ?auto_348954 ) ) ( AVAILABLE ?auto_348954 ) ( SURFACE-AT ?auto_348950 ?auto_348952 ) ( ON ?auto_348950 ?auto_348951 ) ( CLEAR ?auto_348950 ) ( not ( = ?auto_348946 ?auto_348951 ) ) ( not ( = ?auto_348950 ?auto_348951 ) ) ( not ( = ?auto_348949 ?auto_348951 ) ) ( TRUCK-AT ?auto_348955 ?auto_348956 ) ( SURFACE-AT ?auto_348949 ?auto_348956 ) ( CLEAR ?auto_348949 ) ( IS-CRATE ?auto_348946 ) ( AVAILABLE ?auto_348953 ) ( IN ?auto_348946 ?auto_348955 ) ( ON ?auto_348948 ?auto_348947 ) ( ON ?auto_348949 ?auto_348948 ) ( not ( = ?auto_348947 ?auto_348948 ) ) ( not ( = ?auto_348947 ?auto_348949 ) ) ( not ( = ?auto_348947 ?auto_348946 ) ) ( not ( = ?auto_348947 ?auto_348950 ) ) ( not ( = ?auto_348947 ?auto_348951 ) ) ( not ( = ?auto_348948 ?auto_348949 ) ) ( not ( = ?auto_348948 ?auto_348946 ) ) ( not ( = ?auto_348948 ?auto_348950 ) ) ( not ( = ?auto_348948 ?auto_348951 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348949 ?auto_348946 ?auto_348950 )
      ( MAKE-4CRATE-VERIFY ?auto_348947 ?auto_348948 ?auto_348949 ?auto_348946 ?auto_348950 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_349219 - SURFACE
      ?auto_349220 - SURFACE
    )
    :vars
    (
      ?auto_349227 - HOIST
      ?auto_349221 - PLACE
      ?auto_349223 - SURFACE
      ?auto_349222 - TRUCK
      ?auto_349225 - PLACE
      ?auto_349224 - HOIST
      ?auto_349226 - SURFACE
      ?auto_349228 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_349227 ?auto_349221 ) ( SURFACE-AT ?auto_349219 ?auto_349221 ) ( CLEAR ?auto_349219 ) ( IS-CRATE ?auto_349220 ) ( not ( = ?auto_349219 ?auto_349220 ) ) ( AVAILABLE ?auto_349227 ) ( ON ?auto_349219 ?auto_349223 ) ( not ( = ?auto_349223 ?auto_349219 ) ) ( not ( = ?auto_349223 ?auto_349220 ) ) ( TRUCK-AT ?auto_349222 ?auto_349225 ) ( not ( = ?auto_349225 ?auto_349221 ) ) ( HOIST-AT ?auto_349224 ?auto_349225 ) ( not ( = ?auto_349227 ?auto_349224 ) ) ( SURFACE-AT ?auto_349220 ?auto_349225 ) ( ON ?auto_349220 ?auto_349226 ) ( CLEAR ?auto_349220 ) ( not ( = ?auto_349219 ?auto_349226 ) ) ( not ( = ?auto_349220 ?auto_349226 ) ) ( not ( = ?auto_349223 ?auto_349226 ) ) ( LIFTING ?auto_349224 ?auto_349228 ) ( IS-CRATE ?auto_349228 ) ( not ( = ?auto_349219 ?auto_349228 ) ) ( not ( = ?auto_349220 ?auto_349228 ) ) ( not ( = ?auto_349223 ?auto_349228 ) ) ( not ( = ?auto_349226 ?auto_349228 ) ) )
    :subtasks
    ( ( !LOAD ?auto_349224 ?auto_349228 ?auto_349222 ?auto_349225 )
      ( MAKE-1CRATE ?auto_349219 ?auto_349220 )
      ( MAKE-1CRATE-VERIFY ?auto_349219 ?auto_349220 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_349606 - SURFACE
      ?auto_349607 - SURFACE
      ?auto_349608 - SURFACE
      ?auto_349605 - SURFACE
      ?auto_349609 - SURFACE
      ?auto_349610 - SURFACE
    )
    :vars
    (
      ?auto_349612 - HOIST
      ?auto_349611 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_349612 ?auto_349611 ) ( SURFACE-AT ?auto_349609 ?auto_349611 ) ( CLEAR ?auto_349609 ) ( LIFTING ?auto_349612 ?auto_349610 ) ( IS-CRATE ?auto_349610 ) ( not ( = ?auto_349609 ?auto_349610 ) ) ( ON ?auto_349607 ?auto_349606 ) ( ON ?auto_349608 ?auto_349607 ) ( ON ?auto_349605 ?auto_349608 ) ( ON ?auto_349609 ?auto_349605 ) ( not ( = ?auto_349606 ?auto_349607 ) ) ( not ( = ?auto_349606 ?auto_349608 ) ) ( not ( = ?auto_349606 ?auto_349605 ) ) ( not ( = ?auto_349606 ?auto_349609 ) ) ( not ( = ?auto_349606 ?auto_349610 ) ) ( not ( = ?auto_349607 ?auto_349608 ) ) ( not ( = ?auto_349607 ?auto_349605 ) ) ( not ( = ?auto_349607 ?auto_349609 ) ) ( not ( = ?auto_349607 ?auto_349610 ) ) ( not ( = ?auto_349608 ?auto_349605 ) ) ( not ( = ?auto_349608 ?auto_349609 ) ) ( not ( = ?auto_349608 ?auto_349610 ) ) ( not ( = ?auto_349605 ?auto_349609 ) ) ( not ( = ?auto_349605 ?auto_349610 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_349609 ?auto_349610 )
      ( MAKE-5CRATE-VERIFY ?auto_349606 ?auto_349607 ?auto_349608 ?auto_349605 ?auto_349609 ?auto_349610 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_349640 - SURFACE
      ?auto_349641 - SURFACE
      ?auto_349642 - SURFACE
      ?auto_349639 - SURFACE
      ?auto_349643 - SURFACE
      ?auto_349644 - SURFACE
    )
    :vars
    (
      ?auto_349645 - HOIST
      ?auto_349646 - PLACE
      ?auto_349647 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_349645 ?auto_349646 ) ( SURFACE-AT ?auto_349643 ?auto_349646 ) ( CLEAR ?auto_349643 ) ( IS-CRATE ?auto_349644 ) ( not ( = ?auto_349643 ?auto_349644 ) ) ( TRUCK-AT ?auto_349647 ?auto_349646 ) ( AVAILABLE ?auto_349645 ) ( IN ?auto_349644 ?auto_349647 ) ( ON ?auto_349643 ?auto_349639 ) ( not ( = ?auto_349639 ?auto_349643 ) ) ( not ( = ?auto_349639 ?auto_349644 ) ) ( ON ?auto_349641 ?auto_349640 ) ( ON ?auto_349642 ?auto_349641 ) ( ON ?auto_349639 ?auto_349642 ) ( not ( = ?auto_349640 ?auto_349641 ) ) ( not ( = ?auto_349640 ?auto_349642 ) ) ( not ( = ?auto_349640 ?auto_349639 ) ) ( not ( = ?auto_349640 ?auto_349643 ) ) ( not ( = ?auto_349640 ?auto_349644 ) ) ( not ( = ?auto_349641 ?auto_349642 ) ) ( not ( = ?auto_349641 ?auto_349639 ) ) ( not ( = ?auto_349641 ?auto_349643 ) ) ( not ( = ?auto_349641 ?auto_349644 ) ) ( not ( = ?auto_349642 ?auto_349639 ) ) ( not ( = ?auto_349642 ?auto_349643 ) ) ( not ( = ?auto_349642 ?auto_349644 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_349639 ?auto_349643 ?auto_349644 )
      ( MAKE-5CRATE-VERIFY ?auto_349640 ?auto_349641 ?auto_349642 ?auto_349639 ?auto_349643 ?auto_349644 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_349680 - SURFACE
      ?auto_349681 - SURFACE
      ?auto_349682 - SURFACE
      ?auto_349679 - SURFACE
      ?auto_349683 - SURFACE
      ?auto_349684 - SURFACE
    )
    :vars
    (
      ?auto_349686 - HOIST
      ?auto_349687 - PLACE
      ?auto_349685 - TRUCK
      ?auto_349688 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_349686 ?auto_349687 ) ( SURFACE-AT ?auto_349683 ?auto_349687 ) ( CLEAR ?auto_349683 ) ( IS-CRATE ?auto_349684 ) ( not ( = ?auto_349683 ?auto_349684 ) ) ( AVAILABLE ?auto_349686 ) ( IN ?auto_349684 ?auto_349685 ) ( ON ?auto_349683 ?auto_349679 ) ( not ( = ?auto_349679 ?auto_349683 ) ) ( not ( = ?auto_349679 ?auto_349684 ) ) ( TRUCK-AT ?auto_349685 ?auto_349688 ) ( not ( = ?auto_349688 ?auto_349687 ) ) ( ON ?auto_349681 ?auto_349680 ) ( ON ?auto_349682 ?auto_349681 ) ( ON ?auto_349679 ?auto_349682 ) ( not ( = ?auto_349680 ?auto_349681 ) ) ( not ( = ?auto_349680 ?auto_349682 ) ) ( not ( = ?auto_349680 ?auto_349679 ) ) ( not ( = ?auto_349680 ?auto_349683 ) ) ( not ( = ?auto_349680 ?auto_349684 ) ) ( not ( = ?auto_349681 ?auto_349682 ) ) ( not ( = ?auto_349681 ?auto_349679 ) ) ( not ( = ?auto_349681 ?auto_349683 ) ) ( not ( = ?auto_349681 ?auto_349684 ) ) ( not ( = ?auto_349682 ?auto_349679 ) ) ( not ( = ?auto_349682 ?auto_349683 ) ) ( not ( = ?auto_349682 ?auto_349684 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_349679 ?auto_349683 ?auto_349684 )
      ( MAKE-5CRATE-VERIFY ?auto_349680 ?auto_349681 ?auto_349682 ?auto_349679 ?auto_349683 ?auto_349684 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_349725 - SURFACE
      ?auto_349726 - SURFACE
      ?auto_349727 - SURFACE
      ?auto_349724 - SURFACE
      ?auto_349728 - SURFACE
      ?auto_349729 - SURFACE
    )
    :vars
    (
      ?auto_349734 - HOIST
      ?auto_349731 - PLACE
      ?auto_349732 - TRUCK
      ?auto_349730 - PLACE
      ?auto_349733 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_349734 ?auto_349731 ) ( SURFACE-AT ?auto_349728 ?auto_349731 ) ( CLEAR ?auto_349728 ) ( IS-CRATE ?auto_349729 ) ( not ( = ?auto_349728 ?auto_349729 ) ) ( AVAILABLE ?auto_349734 ) ( ON ?auto_349728 ?auto_349724 ) ( not ( = ?auto_349724 ?auto_349728 ) ) ( not ( = ?auto_349724 ?auto_349729 ) ) ( TRUCK-AT ?auto_349732 ?auto_349730 ) ( not ( = ?auto_349730 ?auto_349731 ) ) ( HOIST-AT ?auto_349733 ?auto_349730 ) ( LIFTING ?auto_349733 ?auto_349729 ) ( not ( = ?auto_349734 ?auto_349733 ) ) ( ON ?auto_349726 ?auto_349725 ) ( ON ?auto_349727 ?auto_349726 ) ( ON ?auto_349724 ?auto_349727 ) ( not ( = ?auto_349725 ?auto_349726 ) ) ( not ( = ?auto_349725 ?auto_349727 ) ) ( not ( = ?auto_349725 ?auto_349724 ) ) ( not ( = ?auto_349725 ?auto_349728 ) ) ( not ( = ?auto_349725 ?auto_349729 ) ) ( not ( = ?auto_349726 ?auto_349727 ) ) ( not ( = ?auto_349726 ?auto_349724 ) ) ( not ( = ?auto_349726 ?auto_349728 ) ) ( not ( = ?auto_349726 ?auto_349729 ) ) ( not ( = ?auto_349727 ?auto_349724 ) ) ( not ( = ?auto_349727 ?auto_349728 ) ) ( not ( = ?auto_349727 ?auto_349729 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_349724 ?auto_349728 ?auto_349729 )
      ( MAKE-5CRATE-VERIFY ?auto_349725 ?auto_349726 ?auto_349727 ?auto_349724 ?auto_349728 ?auto_349729 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_349775 - SURFACE
      ?auto_349776 - SURFACE
      ?auto_349777 - SURFACE
      ?auto_349774 - SURFACE
      ?auto_349778 - SURFACE
      ?auto_349779 - SURFACE
    )
    :vars
    (
      ?auto_349785 - HOIST
      ?auto_349783 - PLACE
      ?auto_349782 - TRUCK
      ?auto_349780 - PLACE
      ?auto_349784 - HOIST
      ?auto_349781 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_349785 ?auto_349783 ) ( SURFACE-AT ?auto_349778 ?auto_349783 ) ( CLEAR ?auto_349778 ) ( IS-CRATE ?auto_349779 ) ( not ( = ?auto_349778 ?auto_349779 ) ) ( AVAILABLE ?auto_349785 ) ( ON ?auto_349778 ?auto_349774 ) ( not ( = ?auto_349774 ?auto_349778 ) ) ( not ( = ?auto_349774 ?auto_349779 ) ) ( TRUCK-AT ?auto_349782 ?auto_349780 ) ( not ( = ?auto_349780 ?auto_349783 ) ) ( HOIST-AT ?auto_349784 ?auto_349780 ) ( not ( = ?auto_349785 ?auto_349784 ) ) ( AVAILABLE ?auto_349784 ) ( SURFACE-AT ?auto_349779 ?auto_349780 ) ( ON ?auto_349779 ?auto_349781 ) ( CLEAR ?auto_349779 ) ( not ( = ?auto_349778 ?auto_349781 ) ) ( not ( = ?auto_349779 ?auto_349781 ) ) ( not ( = ?auto_349774 ?auto_349781 ) ) ( ON ?auto_349776 ?auto_349775 ) ( ON ?auto_349777 ?auto_349776 ) ( ON ?auto_349774 ?auto_349777 ) ( not ( = ?auto_349775 ?auto_349776 ) ) ( not ( = ?auto_349775 ?auto_349777 ) ) ( not ( = ?auto_349775 ?auto_349774 ) ) ( not ( = ?auto_349775 ?auto_349778 ) ) ( not ( = ?auto_349775 ?auto_349779 ) ) ( not ( = ?auto_349775 ?auto_349781 ) ) ( not ( = ?auto_349776 ?auto_349777 ) ) ( not ( = ?auto_349776 ?auto_349774 ) ) ( not ( = ?auto_349776 ?auto_349778 ) ) ( not ( = ?auto_349776 ?auto_349779 ) ) ( not ( = ?auto_349776 ?auto_349781 ) ) ( not ( = ?auto_349777 ?auto_349774 ) ) ( not ( = ?auto_349777 ?auto_349778 ) ) ( not ( = ?auto_349777 ?auto_349779 ) ) ( not ( = ?auto_349777 ?auto_349781 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_349774 ?auto_349778 ?auto_349779 )
      ( MAKE-5CRATE-VERIFY ?auto_349775 ?auto_349776 ?auto_349777 ?auto_349774 ?auto_349778 ?auto_349779 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_349826 - SURFACE
      ?auto_349827 - SURFACE
      ?auto_349828 - SURFACE
      ?auto_349825 - SURFACE
      ?auto_349829 - SURFACE
      ?auto_349830 - SURFACE
    )
    :vars
    (
      ?auto_349831 - HOIST
      ?auto_349835 - PLACE
      ?auto_349836 - PLACE
      ?auto_349832 - HOIST
      ?auto_349833 - SURFACE
      ?auto_349834 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_349831 ?auto_349835 ) ( SURFACE-AT ?auto_349829 ?auto_349835 ) ( CLEAR ?auto_349829 ) ( IS-CRATE ?auto_349830 ) ( not ( = ?auto_349829 ?auto_349830 ) ) ( AVAILABLE ?auto_349831 ) ( ON ?auto_349829 ?auto_349825 ) ( not ( = ?auto_349825 ?auto_349829 ) ) ( not ( = ?auto_349825 ?auto_349830 ) ) ( not ( = ?auto_349836 ?auto_349835 ) ) ( HOIST-AT ?auto_349832 ?auto_349836 ) ( not ( = ?auto_349831 ?auto_349832 ) ) ( AVAILABLE ?auto_349832 ) ( SURFACE-AT ?auto_349830 ?auto_349836 ) ( ON ?auto_349830 ?auto_349833 ) ( CLEAR ?auto_349830 ) ( not ( = ?auto_349829 ?auto_349833 ) ) ( not ( = ?auto_349830 ?auto_349833 ) ) ( not ( = ?auto_349825 ?auto_349833 ) ) ( TRUCK-AT ?auto_349834 ?auto_349835 ) ( ON ?auto_349827 ?auto_349826 ) ( ON ?auto_349828 ?auto_349827 ) ( ON ?auto_349825 ?auto_349828 ) ( not ( = ?auto_349826 ?auto_349827 ) ) ( not ( = ?auto_349826 ?auto_349828 ) ) ( not ( = ?auto_349826 ?auto_349825 ) ) ( not ( = ?auto_349826 ?auto_349829 ) ) ( not ( = ?auto_349826 ?auto_349830 ) ) ( not ( = ?auto_349826 ?auto_349833 ) ) ( not ( = ?auto_349827 ?auto_349828 ) ) ( not ( = ?auto_349827 ?auto_349825 ) ) ( not ( = ?auto_349827 ?auto_349829 ) ) ( not ( = ?auto_349827 ?auto_349830 ) ) ( not ( = ?auto_349827 ?auto_349833 ) ) ( not ( = ?auto_349828 ?auto_349825 ) ) ( not ( = ?auto_349828 ?auto_349829 ) ) ( not ( = ?auto_349828 ?auto_349830 ) ) ( not ( = ?auto_349828 ?auto_349833 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_349825 ?auto_349829 ?auto_349830 )
      ( MAKE-5CRATE-VERIFY ?auto_349826 ?auto_349827 ?auto_349828 ?auto_349825 ?auto_349829 ?auto_349830 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_349877 - SURFACE
      ?auto_349878 - SURFACE
      ?auto_349879 - SURFACE
      ?auto_349876 - SURFACE
      ?auto_349880 - SURFACE
      ?auto_349881 - SURFACE
    )
    :vars
    (
      ?auto_349886 - HOIST
      ?auto_349887 - PLACE
      ?auto_349882 - PLACE
      ?auto_349885 - HOIST
      ?auto_349884 - SURFACE
      ?auto_349883 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_349886 ?auto_349887 ) ( IS-CRATE ?auto_349881 ) ( not ( = ?auto_349880 ?auto_349881 ) ) ( not ( = ?auto_349876 ?auto_349880 ) ) ( not ( = ?auto_349876 ?auto_349881 ) ) ( not ( = ?auto_349882 ?auto_349887 ) ) ( HOIST-AT ?auto_349885 ?auto_349882 ) ( not ( = ?auto_349886 ?auto_349885 ) ) ( AVAILABLE ?auto_349885 ) ( SURFACE-AT ?auto_349881 ?auto_349882 ) ( ON ?auto_349881 ?auto_349884 ) ( CLEAR ?auto_349881 ) ( not ( = ?auto_349880 ?auto_349884 ) ) ( not ( = ?auto_349881 ?auto_349884 ) ) ( not ( = ?auto_349876 ?auto_349884 ) ) ( TRUCK-AT ?auto_349883 ?auto_349887 ) ( SURFACE-AT ?auto_349876 ?auto_349887 ) ( CLEAR ?auto_349876 ) ( LIFTING ?auto_349886 ?auto_349880 ) ( IS-CRATE ?auto_349880 ) ( ON ?auto_349878 ?auto_349877 ) ( ON ?auto_349879 ?auto_349878 ) ( ON ?auto_349876 ?auto_349879 ) ( not ( = ?auto_349877 ?auto_349878 ) ) ( not ( = ?auto_349877 ?auto_349879 ) ) ( not ( = ?auto_349877 ?auto_349876 ) ) ( not ( = ?auto_349877 ?auto_349880 ) ) ( not ( = ?auto_349877 ?auto_349881 ) ) ( not ( = ?auto_349877 ?auto_349884 ) ) ( not ( = ?auto_349878 ?auto_349879 ) ) ( not ( = ?auto_349878 ?auto_349876 ) ) ( not ( = ?auto_349878 ?auto_349880 ) ) ( not ( = ?auto_349878 ?auto_349881 ) ) ( not ( = ?auto_349878 ?auto_349884 ) ) ( not ( = ?auto_349879 ?auto_349876 ) ) ( not ( = ?auto_349879 ?auto_349880 ) ) ( not ( = ?auto_349879 ?auto_349881 ) ) ( not ( = ?auto_349879 ?auto_349884 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_349876 ?auto_349880 ?auto_349881 )
      ( MAKE-5CRATE-VERIFY ?auto_349877 ?auto_349878 ?auto_349879 ?auto_349876 ?auto_349880 ?auto_349881 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_349928 - SURFACE
      ?auto_349929 - SURFACE
      ?auto_349930 - SURFACE
      ?auto_349927 - SURFACE
      ?auto_349931 - SURFACE
      ?auto_349932 - SURFACE
    )
    :vars
    (
      ?auto_349934 - HOIST
      ?auto_349938 - PLACE
      ?auto_349935 - PLACE
      ?auto_349933 - HOIST
      ?auto_349937 - SURFACE
      ?auto_349936 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_349934 ?auto_349938 ) ( IS-CRATE ?auto_349932 ) ( not ( = ?auto_349931 ?auto_349932 ) ) ( not ( = ?auto_349927 ?auto_349931 ) ) ( not ( = ?auto_349927 ?auto_349932 ) ) ( not ( = ?auto_349935 ?auto_349938 ) ) ( HOIST-AT ?auto_349933 ?auto_349935 ) ( not ( = ?auto_349934 ?auto_349933 ) ) ( AVAILABLE ?auto_349933 ) ( SURFACE-AT ?auto_349932 ?auto_349935 ) ( ON ?auto_349932 ?auto_349937 ) ( CLEAR ?auto_349932 ) ( not ( = ?auto_349931 ?auto_349937 ) ) ( not ( = ?auto_349932 ?auto_349937 ) ) ( not ( = ?auto_349927 ?auto_349937 ) ) ( TRUCK-AT ?auto_349936 ?auto_349938 ) ( SURFACE-AT ?auto_349927 ?auto_349938 ) ( CLEAR ?auto_349927 ) ( IS-CRATE ?auto_349931 ) ( AVAILABLE ?auto_349934 ) ( IN ?auto_349931 ?auto_349936 ) ( ON ?auto_349929 ?auto_349928 ) ( ON ?auto_349930 ?auto_349929 ) ( ON ?auto_349927 ?auto_349930 ) ( not ( = ?auto_349928 ?auto_349929 ) ) ( not ( = ?auto_349928 ?auto_349930 ) ) ( not ( = ?auto_349928 ?auto_349927 ) ) ( not ( = ?auto_349928 ?auto_349931 ) ) ( not ( = ?auto_349928 ?auto_349932 ) ) ( not ( = ?auto_349928 ?auto_349937 ) ) ( not ( = ?auto_349929 ?auto_349930 ) ) ( not ( = ?auto_349929 ?auto_349927 ) ) ( not ( = ?auto_349929 ?auto_349931 ) ) ( not ( = ?auto_349929 ?auto_349932 ) ) ( not ( = ?auto_349929 ?auto_349937 ) ) ( not ( = ?auto_349930 ?auto_349927 ) ) ( not ( = ?auto_349930 ?auto_349931 ) ) ( not ( = ?auto_349930 ?auto_349932 ) ) ( not ( = ?auto_349930 ?auto_349937 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_349927 ?auto_349931 ?auto_349932 )
      ( MAKE-5CRATE-VERIFY ?auto_349928 ?auto_349929 ?auto_349930 ?auto_349927 ?auto_349931 ?auto_349932 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_350607 - SURFACE
      ?auto_350608 - SURFACE
    )
    :vars
    (
      ?auto_350611 - HOIST
      ?auto_350612 - PLACE
      ?auto_350614 - SURFACE
      ?auto_350613 - PLACE
      ?auto_350615 - HOIST
      ?auto_350609 - SURFACE
      ?auto_350610 - TRUCK
      ?auto_350616 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_350611 ?auto_350612 ) ( SURFACE-AT ?auto_350607 ?auto_350612 ) ( CLEAR ?auto_350607 ) ( IS-CRATE ?auto_350608 ) ( not ( = ?auto_350607 ?auto_350608 ) ) ( ON ?auto_350607 ?auto_350614 ) ( not ( = ?auto_350614 ?auto_350607 ) ) ( not ( = ?auto_350614 ?auto_350608 ) ) ( not ( = ?auto_350613 ?auto_350612 ) ) ( HOIST-AT ?auto_350615 ?auto_350613 ) ( not ( = ?auto_350611 ?auto_350615 ) ) ( AVAILABLE ?auto_350615 ) ( SURFACE-AT ?auto_350608 ?auto_350613 ) ( ON ?auto_350608 ?auto_350609 ) ( CLEAR ?auto_350608 ) ( not ( = ?auto_350607 ?auto_350609 ) ) ( not ( = ?auto_350608 ?auto_350609 ) ) ( not ( = ?auto_350614 ?auto_350609 ) ) ( TRUCK-AT ?auto_350610 ?auto_350612 ) ( LIFTING ?auto_350611 ?auto_350616 ) ( IS-CRATE ?auto_350616 ) ( not ( = ?auto_350607 ?auto_350616 ) ) ( not ( = ?auto_350608 ?auto_350616 ) ) ( not ( = ?auto_350614 ?auto_350616 ) ) ( not ( = ?auto_350609 ?auto_350616 ) ) )
    :subtasks
    ( ( !LOAD ?auto_350611 ?auto_350616 ?auto_350610 ?auto_350612 )
      ( MAKE-1CRATE ?auto_350607 ?auto_350608 )
      ( MAKE-1CRATE-VERIFY ?auto_350607 ?auto_350608 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_351124 - SURFACE
      ?auto_351125 - SURFACE
      ?auto_351126 - SURFACE
      ?auto_351123 - SURFACE
      ?auto_351127 - SURFACE
      ?auto_351129 - SURFACE
      ?auto_351128 - SURFACE
    )
    :vars
    (
      ?auto_351130 - HOIST
      ?auto_351131 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_351130 ?auto_351131 ) ( SURFACE-AT ?auto_351129 ?auto_351131 ) ( CLEAR ?auto_351129 ) ( LIFTING ?auto_351130 ?auto_351128 ) ( IS-CRATE ?auto_351128 ) ( not ( = ?auto_351129 ?auto_351128 ) ) ( ON ?auto_351125 ?auto_351124 ) ( ON ?auto_351126 ?auto_351125 ) ( ON ?auto_351123 ?auto_351126 ) ( ON ?auto_351127 ?auto_351123 ) ( ON ?auto_351129 ?auto_351127 ) ( not ( = ?auto_351124 ?auto_351125 ) ) ( not ( = ?auto_351124 ?auto_351126 ) ) ( not ( = ?auto_351124 ?auto_351123 ) ) ( not ( = ?auto_351124 ?auto_351127 ) ) ( not ( = ?auto_351124 ?auto_351129 ) ) ( not ( = ?auto_351124 ?auto_351128 ) ) ( not ( = ?auto_351125 ?auto_351126 ) ) ( not ( = ?auto_351125 ?auto_351123 ) ) ( not ( = ?auto_351125 ?auto_351127 ) ) ( not ( = ?auto_351125 ?auto_351129 ) ) ( not ( = ?auto_351125 ?auto_351128 ) ) ( not ( = ?auto_351126 ?auto_351123 ) ) ( not ( = ?auto_351126 ?auto_351127 ) ) ( not ( = ?auto_351126 ?auto_351129 ) ) ( not ( = ?auto_351126 ?auto_351128 ) ) ( not ( = ?auto_351123 ?auto_351127 ) ) ( not ( = ?auto_351123 ?auto_351129 ) ) ( not ( = ?auto_351123 ?auto_351128 ) ) ( not ( = ?auto_351127 ?auto_351129 ) ) ( not ( = ?auto_351127 ?auto_351128 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_351129 ?auto_351128 )
      ( MAKE-6CRATE-VERIFY ?auto_351124 ?auto_351125 ?auto_351126 ?auto_351123 ?auto_351127 ?auto_351129 ?auto_351128 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_351168 - SURFACE
      ?auto_351169 - SURFACE
      ?auto_351170 - SURFACE
      ?auto_351167 - SURFACE
      ?auto_351171 - SURFACE
      ?auto_351173 - SURFACE
      ?auto_351172 - SURFACE
    )
    :vars
    (
      ?auto_351174 - HOIST
      ?auto_351175 - PLACE
      ?auto_351176 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_351174 ?auto_351175 ) ( SURFACE-AT ?auto_351173 ?auto_351175 ) ( CLEAR ?auto_351173 ) ( IS-CRATE ?auto_351172 ) ( not ( = ?auto_351173 ?auto_351172 ) ) ( TRUCK-AT ?auto_351176 ?auto_351175 ) ( AVAILABLE ?auto_351174 ) ( IN ?auto_351172 ?auto_351176 ) ( ON ?auto_351173 ?auto_351171 ) ( not ( = ?auto_351171 ?auto_351173 ) ) ( not ( = ?auto_351171 ?auto_351172 ) ) ( ON ?auto_351169 ?auto_351168 ) ( ON ?auto_351170 ?auto_351169 ) ( ON ?auto_351167 ?auto_351170 ) ( ON ?auto_351171 ?auto_351167 ) ( not ( = ?auto_351168 ?auto_351169 ) ) ( not ( = ?auto_351168 ?auto_351170 ) ) ( not ( = ?auto_351168 ?auto_351167 ) ) ( not ( = ?auto_351168 ?auto_351171 ) ) ( not ( = ?auto_351168 ?auto_351173 ) ) ( not ( = ?auto_351168 ?auto_351172 ) ) ( not ( = ?auto_351169 ?auto_351170 ) ) ( not ( = ?auto_351169 ?auto_351167 ) ) ( not ( = ?auto_351169 ?auto_351171 ) ) ( not ( = ?auto_351169 ?auto_351173 ) ) ( not ( = ?auto_351169 ?auto_351172 ) ) ( not ( = ?auto_351170 ?auto_351167 ) ) ( not ( = ?auto_351170 ?auto_351171 ) ) ( not ( = ?auto_351170 ?auto_351173 ) ) ( not ( = ?auto_351170 ?auto_351172 ) ) ( not ( = ?auto_351167 ?auto_351171 ) ) ( not ( = ?auto_351167 ?auto_351173 ) ) ( not ( = ?auto_351167 ?auto_351172 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_351171 ?auto_351173 ?auto_351172 )
      ( MAKE-6CRATE-VERIFY ?auto_351168 ?auto_351169 ?auto_351170 ?auto_351167 ?auto_351171 ?auto_351173 ?auto_351172 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_351219 - SURFACE
      ?auto_351220 - SURFACE
      ?auto_351221 - SURFACE
      ?auto_351218 - SURFACE
      ?auto_351222 - SURFACE
      ?auto_351224 - SURFACE
      ?auto_351223 - SURFACE
    )
    :vars
    (
      ?auto_351228 - HOIST
      ?auto_351226 - PLACE
      ?auto_351225 - TRUCK
      ?auto_351227 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_351228 ?auto_351226 ) ( SURFACE-AT ?auto_351224 ?auto_351226 ) ( CLEAR ?auto_351224 ) ( IS-CRATE ?auto_351223 ) ( not ( = ?auto_351224 ?auto_351223 ) ) ( AVAILABLE ?auto_351228 ) ( IN ?auto_351223 ?auto_351225 ) ( ON ?auto_351224 ?auto_351222 ) ( not ( = ?auto_351222 ?auto_351224 ) ) ( not ( = ?auto_351222 ?auto_351223 ) ) ( TRUCK-AT ?auto_351225 ?auto_351227 ) ( not ( = ?auto_351227 ?auto_351226 ) ) ( ON ?auto_351220 ?auto_351219 ) ( ON ?auto_351221 ?auto_351220 ) ( ON ?auto_351218 ?auto_351221 ) ( ON ?auto_351222 ?auto_351218 ) ( not ( = ?auto_351219 ?auto_351220 ) ) ( not ( = ?auto_351219 ?auto_351221 ) ) ( not ( = ?auto_351219 ?auto_351218 ) ) ( not ( = ?auto_351219 ?auto_351222 ) ) ( not ( = ?auto_351219 ?auto_351224 ) ) ( not ( = ?auto_351219 ?auto_351223 ) ) ( not ( = ?auto_351220 ?auto_351221 ) ) ( not ( = ?auto_351220 ?auto_351218 ) ) ( not ( = ?auto_351220 ?auto_351222 ) ) ( not ( = ?auto_351220 ?auto_351224 ) ) ( not ( = ?auto_351220 ?auto_351223 ) ) ( not ( = ?auto_351221 ?auto_351218 ) ) ( not ( = ?auto_351221 ?auto_351222 ) ) ( not ( = ?auto_351221 ?auto_351224 ) ) ( not ( = ?auto_351221 ?auto_351223 ) ) ( not ( = ?auto_351218 ?auto_351222 ) ) ( not ( = ?auto_351218 ?auto_351224 ) ) ( not ( = ?auto_351218 ?auto_351223 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_351222 ?auto_351224 ?auto_351223 )
      ( MAKE-6CRATE-VERIFY ?auto_351219 ?auto_351220 ?auto_351221 ?auto_351218 ?auto_351222 ?auto_351224 ?auto_351223 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_351276 - SURFACE
      ?auto_351277 - SURFACE
      ?auto_351278 - SURFACE
      ?auto_351275 - SURFACE
      ?auto_351279 - SURFACE
      ?auto_351281 - SURFACE
      ?auto_351280 - SURFACE
    )
    :vars
    (
      ?auto_351284 - HOIST
      ?auto_351282 - PLACE
      ?auto_351285 - TRUCK
      ?auto_351283 - PLACE
      ?auto_351286 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_351284 ?auto_351282 ) ( SURFACE-AT ?auto_351281 ?auto_351282 ) ( CLEAR ?auto_351281 ) ( IS-CRATE ?auto_351280 ) ( not ( = ?auto_351281 ?auto_351280 ) ) ( AVAILABLE ?auto_351284 ) ( ON ?auto_351281 ?auto_351279 ) ( not ( = ?auto_351279 ?auto_351281 ) ) ( not ( = ?auto_351279 ?auto_351280 ) ) ( TRUCK-AT ?auto_351285 ?auto_351283 ) ( not ( = ?auto_351283 ?auto_351282 ) ) ( HOIST-AT ?auto_351286 ?auto_351283 ) ( LIFTING ?auto_351286 ?auto_351280 ) ( not ( = ?auto_351284 ?auto_351286 ) ) ( ON ?auto_351277 ?auto_351276 ) ( ON ?auto_351278 ?auto_351277 ) ( ON ?auto_351275 ?auto_351278 ) ( ON ?auto_351279 ?auto_351275 ) ( not ( = ?auto_351276 ?auto_351277 ) ) ( not ( = ?auto_351276 ?auto_351278 ) ) ( not ( = ?auto_351276 ?auto_351275 ) ) ( not ( = ?auto_351276 ?auto_351279 ) ) ( not ( = ?auto_351276 ?auto_351281 ) ) ( not ( = ?auto_351276 ?auto_351280 ) ) ( not ( = ?auto_351277 ?auto_351278 ) ) ( not ( = ?auto_351277 ?auto_351275 ) ) ( not ( = ?auto_351277 ?auto_351279 ) ) ( not ( = ?auto_351277 ?auto_351281 ) ) ( not ( = ?auto_351277 ?auto_351280 ) ) ( not ( = ?auto_351278 ?auto_351275 ) ) ( not ( = ?auto_351278 ?auto_351279 ) ) ( not ( = ?auto_351278 ?auto_351281 ) ) ( not ( = ?auto_351278 ?auto_351280 ) ) ( not ( = ?auto_351275 ?auto_351279 ) ) ( not ( = ?auto_351275 ?auto_351281 ) ) ( not ( = ?auto_351275 ?auto_351280 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_351279 ?auto_351281 ?auto_351280 )
      ( MAKE-6CRATE-VERIFY ?auto_351276 ?auto_351277 ?auto_351278 ?auto_351275 ?auto_351279 ?auto_351281 ?auto_351280 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_351339 - SURFACE
      ?auto_351340 - SURFACE
      ?auto_351341 - SURFACE
      ?auto_351338 - SURFACE
      ?auto_351342 - SURFACE
      ?auto_351344 - SURFACE
      ?auto_351343 - SURFACE
    )
    :vars
    (
      ?auto_351349 - HOIST
      ?auto_351350 - PLACE
      ?auto_351346 - TRUCK
      ?auto_351348 - PLACE
      ?auto_351347 - HOIST
      ?auto_351345 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_351349 ?auto_351350 ) ( SURFACE-AT ?auto_351344 ?auto_351350 ) ( CLEAR ?auto_351344 ) ( IS-CRATE ?auto_351343 ) ( not ( = ?auto_351344 ?auto_351343 ) ) ( AVAILABLE ?auto_351349 ) ( ON ?auto_351344 ?auto_351342 ) ( not ( = ?auto_351342 ?auto_351344 ) ) ( not ( = ?auto_351342 ?auto_351343 ) ) ( TRUCK-AT ?auto_351346 ?auto_351348 ) ( not ( = ?auto_351348 ?auto_351350 ) ) ( HOIST-AT ?auto_351347 ?auto_351348 ) ( not ( = ?auto_351349 ?auto_351347 ) ) ( AVAILABLE ?auto_351347 ) ( SURFACE-AT ?auto_351343 ?auto_351348 ) ( ON ?auto_351343 ?auto_351345 ) ( CLEAR ?auto_351343 ) ( not ( = ?auto_351344 ?auto_351345 ) ) ( not ( = ?auto_351343 ?auto_351345 ) ) ( not ( = ?auto_351342 ?auto_351345 ) ) ( ON ?auto_351340 ?auto_351339 ) ( ON ?auto_351341 ?auto_351340 ) ( ON ?auto_351338 ?auto_351341 ) ( ON ?auto_351342 ?auto_351338 ) ( not ( = ?auto_351339 ?auto_351340 ) ) ( not ( = ?auto_351339 ?auto_351341 ) ) ( not ( = ?auto_351339 ?auto_351338 ) ) ( not ( = ?auto_351339 ?auto_351342 ) ) ( not ( = ?auto_351339 ?auto_351344 ) ) ( not ( = ?auto_351339 ?auto_351343 ) ) ( not ( = ?auto_351339 ?auto_351345 ) ) ( not ( = ?auto_351340 ?auto_351341 ) ) ( not ( = ?auto_351340 ?auto_351338 ) ) ( not ( = ?auto_351340 ?auto_351342 ) ) ( not ( = ?auto_351340 ?auto_351344 ) ) ( not ( = ?auto_351340 ?auto_351343 ) ) ( not ( = ?auto_351340 ?auto_351345 ) ) ( not ( = ?auto_351341 ?auto_351338 ) ) ( not ( = ?auto_351341 ?auto_351342 ) ) ( not ( = ?auto_351341 ?auto_351344 ) ) ( not ( = ?auto_351341 ?auto_351343 ) ) ( not ( = ?auto_351341 ?auto_351345 ) ) ( not ( = ?auto_351338 ?auto_351342 ) ) ( not ( = ?auto_351338 ?auto_351344 ) ) ( not ( = ?auto_351338 ?auto_351343 ) ) ( not ( = ?auto_351338 ?auto_351345 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_351342 ?auto_351344 ?auto_351343 )
      ( MAKE-6CRATE-VERIFY ?auto_351339 ?auto_351340 ?auto_351341 ?auto_351338 ?auto_351342 ?auto_351344 ?auto_351343 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_351403 - SURFACE
      ?auto_351404 - SURFACE
      ?auto_351405 - SURFACE
      ?auto_351402 - SURFACE
      ?auto_351406 - SURFACE
      ?auto_351408 - SURFACE
      ?auto_351407 - SURFACE
    )
    :vars
    (
      ?auto_351409 - HOIST
      ?auto_351414 - PLACE
      ?auto_351411 - PLACE
      ?auto_351412 - HOIST
      ?auto_351413 - SURFACE
      ?auto_351410 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_351409 ?auto_351414 ) ( SURFACE-AT ?auto_351408 ?auto_351414 ) ( CLEAR ?auto_351408 ) ( IS-CRATE ?auto_351407 ) ( not ( = ?auto_351408 ?auto_351407 ) ) ( AVAILABLE ?auto_351409 ) ( ON ?auto_351408 ?auto_351406 ) ( not ( = ?auto_351406 ?auto_351408 ) ) ( not ( = ?auto_351406 ?auto_351407 ) ) ( not ( = ?auto_351411 ?auto_351414 ) ) ( HOIST-AT ?auto_351412 ?auto_351411 ) ( not ( = ?auto_351409 ?auto_351412 ) ) ( AVAILABLE ?auto_351412 ) ( SURFACE-AT ?auto_351407 ?auto_351411 ) ( ON ?auto_351407 ?auto_351413 ) ( CLEAR ?auto_351407 ) ( not ( = ?auto_351408 ?auto_351413 ) ) ( not ( = ?auto_351407 ?auto_351413 ) ) ( not ( = ?auto_351406 ?auto_351413 ) ) ( TRUCK-AT ?auto_351410 ?auto_351414 ) ( ON ?auto_351404 ?auto_351403 ) ( ON ?auto_351405 ?auto_351404 ) ( ON ?auto_351402 ?auto_351405 ) ( ON ?auto_351406 ?auto_351402 ) ( not ( = ?auto_351403 ?auto_351404 ) ) ( not ( = ?auto_351403 ?auto_351405 ) ) ( not ( = ?auto_351403 ?auto_351402 ) ) ( not ( = ?auto_351403 ?auto_351406 ) ) ( not ( = ?auto_351403 ?auto_351408 ) ) ( not ( = ?auto_351403 ?auto_351407 ) ) ( not ( = ?auto_351403 ?auto_351413 ) ) ( not ( = ?auto_351404 ?auto_351405 ) ) ( not ( = ?auto_351404 ?auto_351402 ) ) ( not ( = ?auto_351404 ?auto_351406 ) ) ( not ( = ?auto_351404 ?auto_351408 ) ) ( not ( = ?auto_351404 ?auto_351407 ) ) ( not ( = ?auto_351404 ?auto_351413 ) ) ( not ( = ?auto_351405 ?auto_351402 ) ) ( not ( = ?auto_351405 ?auto_351406 ) ) ( not ( = ?auto_351405 ?auto_351408 ) ) ( not ( = ?auto_351405 ?auto_351407 ) ) ( not ( = ?auto_351405 ?auto_351413 ) ) ( not ( = ?auto_351402 ?auto_351406 ) ) ( not ( = ?auto_351402 ?auto_351408 ) ) ( not ( = ?auto_351402 ?auto_351407 ) ) ( not ( = ?auto_351402 ?auto_351413 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_351406 ?auto_351408 ?auto_351407 )
      ( MAKE-6CRATE-VERIFY ?auto_351403 ?auto_351404 ?auto_351405 ?auto_351402 ?auto_351406 ?auto_351408 ?auto_351407 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_351467 - SURFACE
      ?auto_351468 - SURFACE
      ?auto_351469 - SURFACE
      ?auto_351466 - SURFACE
      ?auto_351470 - SURFACE
      ?auto_351472 - SURFACE
      ?auto_351471 - SURFACE
    )
    :vars
    (
      ?auto_351473 - HOIST
      ?auto_351476 - PLACE
      ?auto_351475 - PLACE
      ?auto_351474 - HOIST
      ?auto_351477 - SURFACE
      ?auto_351478 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_351473 ?auto_351476 ) ( IS-CRATE ?auto_351471 ) ( not ( = ?auto_351472 ?auto_351471 ) ) ( not ( = ?auto_351470 ?auto_351472 ) ) ( not ( = ?auto_351470 ?auto_351471 ) ) ( not ( = ?auto_351475 ?auto_351476 ) ) ( HOIST-AT ?auto_351474 ?auto_351475 ) ( not ( = ?auto_351473 ?auto_351474 ) ) ( AVAILABLE ?auto_351474 ) ( SURFACE-AT ?auto_351471 ?auto_351475 ) ( ON ?auto_351471 ?auto_351477 ) ( CLEAR ?auto_351471 ) ( not ( = ?auto_351472 ?auto_351477 ) ) ( not ( = ?auto_351471 ?auto_351477 ) ) ( not ( = ?auto_351470 ?auto_351477 ) ) ( TRUCK-AT ?auto_351478 ?auto_351476 ) ( SURFACE-AT ?auto_351470 ?auto_351476 ) ( CLEAR ?auto_351470 ) ( LIFTING ?auto_351473 ?auto_351472 ) ( IS-CRATE ?auto_351472 ) ( ON ?auto_351468 ?auto_351467 ) ( ON ?auto_351469 ?auto_351468 ) ( ON ?auto_351466 ?auto_351469 ) ( ON ?auto_351470 ?auto_351466 ) ( not ( = ?auto_351467 ?auto_351468 ) ) ( not ( = ?auto_351467 ?auto_351469 ) ) ( not ( = ?auto_351467 ?auto_351466 ) ) ( not ( = ?auto_351467 ?auto_351470 ) ) ( not ( = ?auto_351467 ?auto_351472 ) ) ( not ( = ?auto_351467 ?auto_351471 ) ) ( not ( = ?auto_351467 ?auto_351477 ) ) ( not ( = ?auto_351468 ?auto_351469 ) ) ( not ( = ?auto_351468 ?auto_351466 ) ) ( not ( = ?auto_351468 ?auto_351470 ) ) ( not ( = ?auto_351468 ?auto_351472 ) ) ( not ( = ?auto_351468 ?auto_351471 ) ) ( not ( = ?auto_351468 ?auto_351477 ) ) ( not ( = ?auto_351469 ?auto_351466 ) ) ( not ( = ?auto_351469 ?auto_351470 ) ) ( not ( = ?auto_351469 ?auto_351472 ) ) ( not ( = ?auto_351469 ?auto_351471 ) ) ( not ( = ?auto_351469 ?auto_351477 ) ) ( not ( = ?auto_351466 ?auto_351470 ) ) ( not ( = ?auto_351466 ?auto_351472 ) ) ( not ( = ?auto_351466 ?auto_351471 ) ) ( not ( = ?auto_351466 ?auto_351477 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_351470 ?auto_351472 ?auto_351471 )
      ( MAKE-6CRATE-VERIFY ?auto_351467 ?auto_351468 ?auto_351469 ?auto_351466 ?auto_351470 ?auto_351472 ?auto_351471 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_351531 - SURFACE
      ?auto_351532 - SURFACE
      ?auto_351533 - SURFACE
      ?auto_351530 - SURFACE
      ?auto_351534 - SURFACE
      ?auto_351536 - SURFACE
      ?auto_351535 - SURFACE
    )
    :vars
    (
      ?auto_351541 - HOIST
      ?auto_351540 - PLACE
      ?auto_351542 - PLACE
      ?auto_351539 - HOIST
      ?auto_351538 - SURFACE
      ?auto_351537 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_351541 ?auto_351540 ) ( IS-CRATE ?auto_351535 ) ( not ( = ?auto_351536 ?auto_351535 ) ) ( not ( = ?auto_351534 ?auto_351536 ) ) ( not ( = ?auto_351534 ?auto_351535 ) ) ( not ( = ?auto_351542 ?auto_351540 ) ) ( HOIST-AT ?auto_351539 ?auto_351542 ) ( not ( = ?auto_351541 ?auto_351539 ) ) ( AVAILABLE ?auto_351539 ) ( SURFACE-AT ?auto_351535 ?auto_351542 ) ( ON ?auto_351535 ?auto_351538 ) ( CLEAR ?auto_351535 ) ( not ( = ?auto_351536 ?auto_351538 ) ) ( not ( = ?auto_351535 ?auto_351538 ) ) ( not ( = ?auto_351534 ?auto_351538 ) ) ( TRUCK-AT ?auto_351537 ?auto_351540 ) ( SURFACE-AT ?auto_351534 ?auto_351540 ) ( CLEAR ?auto_351534 ) ( IS-CRATE ?auto_351536 ) ( AVAILABLE ?auto_351541 ) ( IN ?auto_351536 ?auto_351537 ) ( ON ?auto_351532 ?auto_351531 ) ( ON ?auto_351533 ?auto_351532 ) ( ON ?auto_351530 ?auto_351533 ) ( ON ?auto_351534 ?auto_351530 ) ( not ( = ?auto_351531 ?auto_351532 ) ) ( not ( = ?auto_351531 ?auto_351533 ) ) ( not ( = ?auto_351531 ?auto_351530 ) ) ( not ( = ?auto_351531 ?auto_351534 ) ) ( not ( = ?auto_351531 ?auto_351536 ) ) ( not ( = ?auto_351531 ?auto_351535 ) ) ( not ( = ?auto_351531 ?auto_351538 ) ) ( not ( = ?auto_351532 ?auto_351533 ) ) ( not ( = ?auto_351532 ?auto_351530 ) ) ( not ( = ?auto_351532 ?auto_351534 ) ) ( not ( = ?auto_351532 ?auto_351536 ) ) ( not ( = ?auto_351532 ?auto_351535 ) ) ( not ( = ?auto_351532 ?auto_351538 ) ) ( not ( = ?auto_351533 ?auto_351530 ) ) ( not ( = ?auto_351533 ?auto_351534 ) ) ( not ( = ?auto_351533 ?auto_351536 ) ) ( not ( = ?auto_351533 ?auto_351535 ) ) ( not ( = ?auto_351533 ?auto_351538 ) ) ( not ( = ?auto_351530 ?auto_351534 ) ) ( not ( = ?auto_351530 ?auto_351536 ) ) ( not ( = ?auto_351530 ?auto_351535 ) ) ( not ( = ?auto_351530 ?auto_351538 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_351534 ?auto_351536 ?auto_351535 )
      ( MAKE-6CRATE-VERIFY ?auto_351531 ?auto_351532 ?auto_351533 ?auto_351530 ?auto_351534 ?auto_351536 ?auto_351535 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_353475 - SURFACE
      ?auto_353476 - SURFACE
      ?auto_353477 - SURFACE
      ?auto_353474 - SURFACE
      ?auto_353478 - SURFACE
      ?auto_353480 - SURFACE
      ?auto_353479 - SURFACE
      ?auto_353481 - SURFACE
    )
    :vars
    (
      ?auto_353483 - HOIST
      ?auto_353482 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_353483 ?auto_353482 ) ( SURFACE-AT ?auto_353479 ?auto_353482 ) ( CLEAR ?auto_353479 ) ( LIFTING ?auto_353483 ?auto_353481 ) ( IS-CRATE ?auto_353481 ) ( not ( = ?auto_353479 ?auto_353481 ) ) ( ON ?auto_353476 ?auto_353475 ) ( ON ?auto_353477 ?auto_353476 ) ( ON ?auto_353474 ?auto_353477 ) ( ON ?auto_353478 ?auto_353474 ) ( ON ?auto_353480 ?auto_353478 ) ( ON ?auto_353479 ?auto_353480 ) ( not ( = ?auto_353475 ?auto_353476 ) ) ( not ( = ?auto_353475 ?auto_353477 ) ) ( not ( = ?auto_353475 ?auto_353474 ) ) ( not ( = ?auto_353475 ?auto_353478 ) ) ( not ( = ?auto_353475 ?auto_353480 ) ) ( not ( = ?auto_353475 ?auto_353479 ) ) ( not ( = ?auto_353475 ?auto_353481 ) ) ( not ( = ?auto_353476 ?auto_353477 ) ) ( not ( = ?auto_353476 ?auto_353474 ) ) ( not ( = ?auto_353476 ?auto_353478 ) ) ( not ( = ?auto_353476 ?auto_353480 ) ) ( not ( = ?auto_353476 ?auto_353479 ) ) ( not ( = ?auto_353476 ?auto_353481 ) ) ( not ( = ?auto_353477 ?auto_353474 ) ) ( not ( = ?auto_353477 ?auto_353478 ) ) ( not ( = ?auto_353477 ?auto_353480 ) ) ( not ( = ?auto_353477 ?auto_353479 ) ) ( not ( = ?auto_353477 ?auto_353481 ) ) ( not ( = ?auto_353474 ?auto_353478 ) ) ( not ( = ?auto_353474 ?auto_353480 ) ) ( not ( = ?auto_353474 ?auto_353479 ) ) ( not ( = ?auto_353474 ?auto_353481 ) ) ( not ( = ?auto_353478 ?auto_353480 ) ) ( not ( = ?auto_353478 ?auto_353479 ) ) ( not ( = ?auto_353478 ?auto_353481 ) ) ( not ( = ?auto_353480 ?auto_353479 ) ) ( not ( = ?auto_353480 ?auto_353481 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_353479 ?auto_353481 )
      ( MAKE-7CRATE-VERIFY ?auto_353475 ?auto_353476 ?auto_353477 ?auto_353474 ?auto_353478 ?auto_353480 ?auto_353479 ?auto_353481 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_353530 - SURFACE
      ?auto_353531 - SURFACE
      ?auto_353532 - SURFACE
      ?auto_353529 - SURFACE
      ?auto_353533 - SURFACE
      ?auto_353535 - SURFACE
      ?auto_353534 - SURFACE
      ?auto_353536 - SURFACE
    )
    :vars
    (
      ?auto_353539 - HOIST
      ?auto_353537 - PLACE
      ?auto_353538 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353539 ?auto_353537 ) ( SURFACE-AT ?auto_353534 ?auto_353537 ) ( CLEAR ?auto_353534 ) ( IS-CRATE ?auto_353536 ) ( not ( = ?auto_353534 ?auto_353536 ) ) ( TRUCK-AT ?auto_353538 ?auto_353537 ) ( AVAILABLE ?auto_353539 ) ( IN ?auto_353536 ?auto_353538 ) ( ON ?auto_353534 ?auto_353535 ) ( not ( = ?auto_353535 ?auto_353534 ) ) ( not ( = ?auto_353535 ?auto_353536 ) ) ( ON ?auto_353531 ?auto_353530 ) ( ON ?auto_353532 ?auto_353531 ) ( ON ?auto_353529 ?auto_353532 ) ( ON ?auto_353533 ?auto_353529 ) ( ON ?auto_353535 ?auto_353533 ) ( not ( = ?auto_353530 ?auto_353531 ) ) ( not ( = ?auto_353530 ?auto_353532 ) ) ( not ( = ?auto_353530 ?auto_353529 ) ) ( not ( = ?auto_353530 ?auto_353533 ) ) ( not ( = ?auto_353530 ?auto_353535 ) ) ( not ( = ?auto_353530 ?auto_353534 ) ) ( not ( = ?auto_353530 ?auto_353536 ) ) ( not ( = ?auto_353531 ?auto_353532 ) ) ( not ( = ?auto_353531 ?auto_353529 ) ) ( not ( = ?auto_353531 ?auto_353533 ) ) ( not ( = ?auto_353531 ?auto_353535 ) ) ( not ( = ?auto_353531 ?auto_353534 ) ) ( not ( = ?auto_353531 ?auto_353536 ) ) ( not ( = ?auto_353532 ?auto_353529 ) ) ( not ( = ?auto_353532 ?auto_353533 ) ) ( not ( = ?auto_353532 ?auto_353535 ) ) ( not ( = ?auto_353532 ?auto_353534 ) ) ( not ( = ?auto_353532 ?auto_353536 ) ) ( not ( = ?auto_353529 ?auto_353533 ) ) ( not ( = ?auto_353529 ?auto_353535 ) ) ( not ( = ?auto_353529 ?auto_353534 ) ) ( not ( = ?auto_353529 ?auto_353536 ) ) ( not ( = ?auto_353533 ?auto_353535 ) ) ( not ( = ?auto_353533 ?auto_353534 ) ) ( not ( = ?auto_353533 ?auto_353536 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353535 ?auto_353534 ?auto_353536 )
      ( MAKE-7CRATE-VERIFY ?auto_353530 ?auto_353531 ?auto_353532 ?auto_353529 ?auto_353533 ?auto_353535 ?auto_353534 ?auto_353536 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_353593 - SURFACE
      ?auto_353594 - SURFACE
      ?auto_353595 - SURFACE
      ?auto_353592 - SURFACE
      ?auto_353596 - SURFACE
      ?auto_353598 - SURFACE
      ?auto_353597 - SURFACE
      ?auto_353599 - SURFACE
    )
    :vars
    (
      ?auto_353600 - HOIST
      ?auto_353602 - PLACE
      ?auto_353603 - TRUCK
      ?auto_353601 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_353600 ?auto_353602 ) ( SURFACE-AT ?auto_353597 ?auto_353602 ) ( CLEAR ?auto_353597 ) ( IS-CRATE ?auto_353599 ) ( not ( = ?auto_353597 ?auto_353599 ) ) ( AVAILABLE ?auto_353600 ) ( IN ?auto_353599 ?auto_353603 ) ( ON ?auto_353597 ?auto_353598 ) ( not ( = ?auto_353598 ?auto_353597 ) ) ( not ( = ?auto_353598 ?auto_353599 ) ) ( TRUCK-AT ?auto_353603 ?auto_353601 ) ( not ( = ?auto_353601 ?auto_353602 ) ) ( ON ?auto_353594 ?auto_353593 ) ( ON ?auto_353595 ?auto_353594 ) ( ON ?auto_353592 ?auto_353595 ) ( ON ?auto_353596 ?auto_353592 ) ( ON ?auto_353598 ?auto_353596 ) ( not ( = ?auto_353593 ?auto_353594 ) ) ( not ( = ?auto_353593 ?auto_353595 ) ) ( not ( = ?auto_353593 ?auto_353592 ) ) ( not ( = ?auto_353593 ?auto_353596 ) ) ( not ( = ?auto_353593 ?auto_353598 ) ) ( not ( = ?auto_353593 ?auto_353597 ) ) ( not ( = ?auto_353593 ?auto_353599 ) ) ( not ( = ?auto_353594 ?auto_353595 ) ) ( not ( = ?auto_353594 ?auto_353592 ) ) ( not ( = ?auto_353594 ?auto_353596 ) ) ( not ( = ?auto_353594 ?auto_353598 ) ) ( not ( = ?auto_353594 ?auto_353597 ) ) ( not ( = ?auto_353594 ?auto_353599 ) ) ( not ( = ?auto_353595 ?auto_353592 ) ) ( not ( = ?auto_353595 ?auto_353596 ) ) ( not ( = ?auto_353595 ?auto_353598 ) ) ( not ( = ?auto_353595 ?auto_353597 ) ) ( not ( = ?auto_353595 ?auto_353599 ) ) ( not ( = ?auto_353592 ?auto_353596 ) ) ( not ( = ?auto_353592 ?auto_353598 ) ) ( not ( = ?auto_353592 ?auto_353597 ) ) ( not ( = ?auto_353592 ?auto_353599 ) ) ( not ( = ?auto_353596 ?auto_353598 ) ) ( not ( = ?auto_353596 ?auto_353597 ) ) ( not ( = ?auto_353596 ?auto_353599 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353598 ?auto_353597 ?auto_353599 )
      ( MAKE-7CRATE-VERIFY ?auto_353593 ?auto_353594 ?auto_353595 ?auto_353592 ?auto_353596 ?auto_353598 ?auto_353597 ?auto_353599 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_353663 - SURFACE
      ?auto_353664 - SURFACE
      ?auto_353665 - SURFACE
      ?auto_353662 - SURFACE
      ?auto_353666 - SURFACE
      ?auto_353668 - SURFACE
      ?auto_353667 - SURFACE
      ?auto_353669 - SURFACE
    )
    :vars
    (
      ?auto_353673 - HOIST
      ?auto_353672 - PLACE
      ?auto_353670 - TRUCK
      ?auto_353674 - PLACE
      ?auto_353671 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_353673 ?auto_353672 ) ( SURFACE-AT ?auto_353667 ?auto_353672 ) ( CLEAR ?auto_353667 ) ( IS-CRATE ?auto_353669 ) ( not ( = ?auto_353667 ?auto_353669 ) ) ( AVAILABLE ?auto_353673 ) ( ON ?auto_353667 ?auto_353668 ) ( not ( = ?auto_353668 ?auto_353667 ) ) ( not ( = ?auto_353668 ?auto_353669 ) ) ( TRUCK-AT ?auto_353670 ?auto_353674 ) ( not ( = ?auto_353674 ?auto_353672 ) ) ( HOIST-AT ?auto_353671 ?auto_353674 ) ( LIFTING ?auto_353671 ?auto_353669 ) ( not ( = ?auto_353673 ?auto_353671 ) ) ( ON ?auto_353664 ?auto_353663 ) ( ON ?auto_353665 ?auto_353664 ) ( ON ?auto_353662 ?auto_353665 ) ( ON ?auto_353666 ?auto_353662 ) ( ON ?auto_353668 ?auto_353666 ) ( not ( = ?auto_353663 ?auto_353664 ) ) ( not ( = ?auto_353663 ?auto_353665 ) ) ( not ( = ?auto_353663 ?auto_353662 ) ) ( not ( = ?auto_353663 ?auto_353666 ) ) ( not ( = ?auto_353663 ?auto_353668 ) ) ( not ( = ?auto_353663 ?auto_353667 ) ) ( not ( = ?auto_353663 ?auto_353669 ) ) ( not ( = ?auto_353664 ?auto_353665 ) ) ( not ( = ?auto_353664 ?auto_353662 ) ) ( not ( = ?auto_353664 ?auto_353666 ) ) ( not ( = ?auto_353664 ?auto_353668 ) ) ( not ( = ?auto_353664 ?auto_353667 ) ) ( not ( = ?auto_353664 ?auto_353669 ) ) ( not ( = ?auto_353665 ?auto_353662 ) ) ( not ( = ?auto_353665 ?auto_353666 ) ) ( not ( = ?auto_353665 ?auto_353668 ) ) ( not ( = ?auto_353665 ?auto_353667 ) ) ( not ( = ?auto_353665 ?auto_353669 ) ) ( not ( = ?auto_353662 ?auto_353666 ) ) ( not ( = ?auto_353662 ?auto_353668 ) ) ( not ( = ?auto_353662 ?auto_353667 ) ) ( not ( = ?auto_353662 ?auto_353669 ) ) ( not ( = ?auto_353666 ?auto_353668 ) ) ( not ( = ?auto_353666 ?auto_353667 ) ) ( not ( = ?auto_353666 ?auto_353669 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353668 ?auto_353667 ?auto_353669 )
      ( MAKE-7CRATE-VERIFY ?auto_353663 ?auto_353664 ?auto_353665 ?auto_353662 ?auto_353666 ?auto_353668 ?auto_353667 ?auto_353669 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_353740 - SURFACE
      ?auto_353741 - SURFACE
      ?auto_353742 - SURFACE
      ?auto_353739 - SURFACE
      ?auto_353743 - SURFACE
      ?auto_353745 - SURFACE
      ?auto_353744 - SURFACE
      ?auto_353746 - SURFACE
    )
    :vars
    (
      ?auto_353752 - HOIST
      ?auto_353750 - PLACE
      ?auto_353748 - TRUCK
      ?auto_353747 - PLACE
      ?auto_353751 - HOIST
      ?auto_353749 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_353752 ?auto_353750 ) ( SURFACE-AT ?auto_353744 ?auto_353750 ) ( CLEAR ?auto_353744 ) ( IS-CRATE ?auto_353746 ) ( not ( = ?auto_353744 ?auto_353746 ) ) ( AVAILABLE ?auto_353752 ) ( ON ?auto_353744 ?auto_353745 ) ( not ( = ?auto_353745 ?auto_353744 ) ) ( not ( = ?auto_353745 ?auto_353746 ) ) ( TRUCK-AT ?auto_353748 ?auto_353747 ) ( not ( = ?auto_353747 ?auto_353750 ) ) ( HOIST-AT ?auto_353751 ?auto_353747 ) ( not ( = ?auto_353752 ?auto_353751 ) ) ( AVAILABLE ?auto_353751 ) ( SURFACE-AT ?auto_353746 ?auto_353747 ) ( ON ?auto_353746 ?auto_353749 ) ( CLEAR ?auto_353746 ) ( not ( = ?auto_353744 ?auto_353749 ) ) ( not ( = ?auto_353746 ?auto_353749 ) ) ( not ( = ?auto_353745 ?auto_353749 ) ) ( ON ?auto_353741 ?auto_353740 ) ( ON ?auto_353742 ?auto_353741 ) ( ON ?auto_353739 ?auto_353742 ) ( ON ?auto_353743 ?auto_353739 ) ( ON ?auto_353745 ?auto_353743 ) ( not ( = ?auto_353740 ?auto_353741 ) ) ( not ( = ?auto_353740 ?auto_353742 ) ) ( not ( = ?auto_353740 ?auto_353739 ) ) ( not ( = ?auto_353740 ?auto_353743 ) ) ( not ( = ?auto_353740 ?auto_353745 ) ) ( not ( = ?auto_353740 ?auto_353744 ) ) ( not ( = ?auto_353740 ?auto_353746 ) ) ( not ( = ?auto_353740 ?auto_353749 ) ) ( not ( = ?auto_353741 ?auto_353742 ) ) ( not ( = ?auto_353741 ?auto_353739 ) ) ( not ( = ?auto_353741 ?auto_353743 ) ) ( not ( = ?auto_353741 ?auto_353745 ) ) ( not ( = ?auto_353741 ?auto_353744 ) ) ( not ( = ?auto_353741 ?auto_353746 ) ) ( not ( = ?auto_353741 ?auto_353749 ) ) ( not ( = ?auto_353742 ?auto_353739 ) ) ( not ( = ?auto_353742 ?auto_353743 ) ) ( not ( = ?auto_353742 ?auto_353745 ) ) ( not ( = ?auto_353742 ?auto_353744 ) ) ( not ( = ?auto_353742 ?auto_353746 ) ) ( not ( = ?auto_353742 ?auto_353749 ) ) ( not ( = ?auto_353739 ?auto_353743 ) ) ( not ( = ?auto_353739 ?auto_353745 ) ) ( not ( = ?auto_353739 ?auto_353744 ) ) ( not ( = ?auto_353739 ?auto_353746 ) ) ( not ( = ?auto_353739 ?auto_353749 ) ) ( not ( = ?auto_353743 ?auto_353745 ) ) ( not ( = ?auto_353743 ?auto_353744 ) ) ( not ( = ?auto_353743 ?auto_353746 ) ) ( not ( = ?auto_353743 ?auto_353749 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353745 ?auto_353744 ?auto_353746 )
      ( MAKE-7CRATE-VERIFY ?auto_353740 ?auto_353741 ?auto_353742 ?auto_353739 ?auto_353743 ?auto_353745 ?auto_353744 ?auto_353746 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_353818 - SURFACE
      ?auto_353819 - SURFACE
      ?auto_353820 - SURFACE
      ?auto_353817 - SURFACE
      ?auto_353821 - SURFACE
      ?auto_353823 - SURFACE
      ?auto_353822 - SURFACE
      ?auto_353824 - SURFACE
    )
    :vars
    (
      ?auto_353825 - HOIST
      ?auto_353826 - PLACE
      ?auto_353827 - PLACE
      ?auto_353829 - HOIST
      ?auto_353828 - SURFACE
      ?auto_353830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353825 ?auto_353826 ) ( SURFACE-AT ?auto_353822 ?auto_353826 ) ( CLEAR ?auto_353822 ) ( IS-CRATE ?auto_353824 ) ( not ( = ?auto_353822 ?auto_353824 ) ) ( AVAILABLE ?auto_353825 ) ( ON ?auto_353822 ?auto_353823 ) ( not ( = ?auto_353823 ?auto_353822 ) ) ( not ( = ?auto_353823 ?auto_353824 ) ) ( not ( = ?auto_353827 ?auto_353826 ) ) ( HOIST-AT ?auto_353829 ?auto_353827 ) ( not ( = ?auto_353825 ?auto_353829 ) ) ( AVAILABLE ?auto_353829 ) ( SURFACE-AT ?auto_353824 ?auto_353827 ) ( ON ?auto_353824 ?auto_353828 ) ( CLEAR ?auto_353824 ) ( not ( = ?auto_353822 ?auto_353828 ) ) ( not ( = ?auto_353824 ?auto_353828 ) ) ( not ( = ?auto_353823 ?auto_353828 ) ) ( TRUCK-AT ?auto_353830 ?auto_353826 ) ( ON ?auto_353819 ?auto_353818 ) ( ON ?auto_353820 ?auto_353819 ) ( ON ?auto_353817 ?auto_353820 ) ( ON ?auto_353821 ?auto_353817 ) ( ON ?auto_353823 ?auto_353821 ) ( not ( = ?auto_353818 ?auto_353819 ) ) ( not ( = ?auto_353818 ?auto_353820 ) ) ( not ( = ?auto_353818 ?auto_353817 ) ) ( not ( = ?auto_353818 ?auto_353821 ) ) ( not ( = ?auto_353818 ?auto_353823 ) ) ( not ( = ?auto_353818 ?auto_353822 ) ) ( not ( = ?auto_353818 ?auto_353824 ) ) ( not ( = ?auto_353818 ?auto_353828 ) ) ( not ( = ?auto_353819 ?auto_353820 ) ) ( not ( = ?auto_353819 ?auto_353817 ) ) ( not ( = ?auto_353819 ?auto_353821 ) ) ( not ( = ?auto_353819 ?auto_353823 ) ) ( not ( = ?auto_353819 ?auto_353822 ) ) ( not ( = ?auto_353819 ?auto_353824 ) ) ( not ( = ?auto_353819 ?auto_353828 ) ) ( not ( = ?auto_353820 ?auto_353817 ) ) ( not ( = ?auto_353820 ?auto_353821 ) ) ( not ( = ?auto_353820 ?auto_353823 ) ) ( not ( = ?auto_353820 ?auto_353822 ) ) ( not ( = ?auto_353820 ?auto_353824 ) ) ( not ( = ?auto_353820 ?auto_353828 ) ) ( not ( = ?auto_353817 ?auto_353821 ) ) ( not ( = ?auto_353817 ?auto_353823 ) ) ( not ( = ?auto_353817 ?auto_353822 ) ) ( not ( = ?auto_353817 ?auto_353824 ) ) ( not ( = ?auto_353817 ?auto_353828 ) ) ( not ( = ?auto_353821 ?auto_353823 ) ) ( not ( = ?auto_353821 ?auto_353822 ) ) ( not ( = ?auto_353821 ?auto_353824 ) ) ( not ( = ?auto_353821 ?auto_353828 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353823 ?auto_353822 ?auto_353824 )
      ( MAKE-7CRATE-VERIFY ?auto_353818 ?auto_353819 ?auto_353820 ?auto_353817 ?auto_353821 ?auto_353823 ?auto_353822 ?auto_353824 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_353896 - SURFACE
      ?auto_353897 - SURFACE
      ?auto_353898 - SURFACE
      ?auto_353895 - SURFACE
      ?auto_353899 - SURFACE
      ?auto_353901 - SURFACE
      ?auto_353900 - SURFACE
      ?auto_353902 - SURFACE
    )
    :vars
    (
      ?auto_353904 - HOIST
      ?auto_353907 - PLACE
      ?auto_353903 - PLACE
      ?auto_353906 - HOIST
      ?auto_353908 - SURFACE
      ?auto_353905 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353904 ?auto_353907 ) ( IS-CRATE ?auto_353902 ) ( not ( = ?auto_353900 ?auto_353902 ) ) ( not ( = ?auto_353901 ?auto_353900 ) ) ( not ( = ?auto_353901 ?auto_353902 ) ) ( not ( = ?auto_353903 ?auto_353907 ) ) ( HOIST-AT ?auto_353906 ?auto_353903 ) ( not ( = ?auto_353904 ?auto_353906 ) ) ( AVAILABLE ?auto_353906 ) ( SURFACE-AT ?auto_353902 ?auto_353903 ) ( ON ?auto_353902 ?auto_353908 ) ( CLEAR ?auto_353902 ) ( not ( = ?auto_353900 ?auto_353908 ) ) ( not ( = ?auto_353902 ?auto_353908 ) ) ( not ( = ?auto_353901 ?auto_353908 ) ) ( TRUCK-AT ?auto_353905 ?auto_353907 ) ( SURFACE-AT ?auto_353901 ?auto_353907 ) ( CLEAR ?auto_353901 ) ( LIFTING ?auto_353904 ?auto_353900 ) ( IS-CRATE ?auto_353900 ) ( ON ?auto_353897 ?auto_353896 ) ( ON ?auto_353898 ?auto_353897 ) ( ON ?auto_353895 ?auto_353898 ) ( ON ?auto_353899 ?auto_353895 ) ( ON ?auto_353901 ?auto_353899 ) ( not ( = ?auto_353896 ?auto_353897 ) ) ( not ( = ?auto_353896 ?auto_353898 ) ) ( not ( = ?auto_353896 ?auto_353895 ) ) ( not ( = ?auto_353896 ?auto_353899 ) ) ( not ( = ?auto_353896 ?auto_353901 ) ) ( not ( = ?auto_353896 ?auto_353900 ) ) ( not ( = ?auto_353896 ?auto_353902 ) ) ( not ( = ?auto_353896 ?auto_353908 ) ) ( not ( = ?auto_353897 ?auto_353898 ) ) ( not ( = ?auto_353897 ?auto_353895 ) ) ( not ( = ?auto_353897 ?auto_353899 ) ) ( not ( = ?auto_353897 ?auto_353901 ) ) ( not ( = ?auto_353897 ?auto_353900 ) ) ( not ( = ?auto_353897 ?auto_353902 ) ) ( not ( = ?auto_353897 ?auto_353908 ) ) ( not ( = ?auto_353898 ?auto_353895 ) ) ( not ( = ?auto_353898 ?auto_353899 ) ) ( not ( = ?auto_353898 ?auto_353901 ) ) ( not ( = ?auto_353898 ?auto_353900 ) ) ( not ( = ?auto_353898 ?auto_353902 ) ) ( not ( = ?auto_353898 ?auto_353908 ) ) ( not ( = ?auto_353895 ?auto_353899 ) ) ( not ( = ?auto_353895 ?auto_353901 ) ) ( not ( = ?auto_353895 ?auto_353900 ) ) ( not ( = ?auto_353895 ?auto_353902 ) ) ( not ( = ?auto_353895 ?auto_353908 ) ) ( not ( = ?auto_353899 ?auto_353901 ) ) ( not ( = ?auto_353899 ?auto_353900 ) ) ( not ( = ?auto_353899 ?auto_353902 ) ) ( not ( = ?auto_353899 ?auto_353908 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353901 ?auto_353900 ?auto_353902 )
      ( MAKE-7CRATE-VERIFY ?auto_353896 ?auto_353897 ?auto_353898 ?auto_353895 ?auto_353899 ?auto_353901 ?auto_353900 ?auto_353902 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_353974 - SURFACE
      ?auto_353975 - SURFACE
      ?auto_353976 - SURFACE
      ?auto_353973 - SURFACE
      ?auto_353977 - SURFACE
      ?auto_353979 - SURFACE
      ?auto_353978 - SURFACE
      ?auto_353980 - SURFACE
    )
    :vars
    (
      ?auto_353982 - HOIST
      ?auto_353985 - PLACE
      ?auto_353986 - PLACE
      ?auto_353981 - HOIST
      ?auto_353984 - SURFACE
      ?auto_353983 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353982 ?auto_353985 ) ( IS-CRATE ?auto_353980 ) ( not ( = ?auto_353978 ?auto_353980 ) ) ( not ( = ?auto_353979 ?auto_353978 ) ) ( not ( = ?auto_353979 ?auto_353980 ) ) ( not ( = ?auto_353986 ?auto_353985 ) ) ( HOIST-AT ?auto_353981 ?auto_353986 ) ( not ( = ?auto_353982 ?auto_353981 ) ) ( AVAILABLE ?auto_353981 ) ( SURFACE-AT ?auto_353980 ?auto_353986 ) ( ON ?auto_353980 ?auto_353984 ) ( CLEAR ?auto_353980 ) ( not ( = ?auto_353978 ?auto_353984 ) ) ( not ( = ?auto_353980 ?auto_353984 ) ) ( not ( = ?auto_353979 ?auto_353984 ) ) ( TRUCK-AT ?auto_353983 ?auto_353985 ) ( SURFACE-AT ?auto_353979 ?auto_353985 ) ( CLEAR ?auto_353979 ) ( IS-CRATE ?auto_353978 ) ( AVAILABLE ?auto_353982 ) ( IN ?auto_353978 ?auto_353983 ) ( ON ?auto_353975 ?auto_353974 ) ( ON ?auto_353976 ?auto_353975 ) ( ON ?auto_353973 ?auto_353976 ) ( ON ?auto_353977 ?auto_353973 ) ( ON ?auto_353979 ?auto_353977 ) ( not ( = ?auto_353974 ?auto_353975 ) ) ( not ( = ?auto_353974 ?auto_353976 ) ) ( not ( = ?auto_353974 ?auto_353973 ) ) ( not ( = ?auto_353974 ?auto_353977 ) ) ( not ( = ?auto_353974 ?auto_353979 ) ) ( not ( = ?auto_353974 ?auto_353978 ) ) ( not ( = ?auto_353974 ?auto_353980 ) ) ( not ( = ?auto_353974 ?auto_353984 ) ) ( not ( = ?auto_353975 ?auto_353976 ) ) ( not ( = ?auto_353975 ?auto_353973 ) ) ( not ( = ?auto_353975 ?auto_353977 ) ) ( not ( = ?auto_353975 ?auto_353979 ) ) ( not ( = ?auto_353975 ?auto_353978 ) ) ( not ( = ?auto_353975 ?auto_353980 ) ) ( not ( = ?auto_353975 ?auto_353984 ) ) ( not ( = ?auto_353976 ?auto_353973 ) ) ( not ( = ?auto_353976 ?auto_353977 ) ) ( not ( = ?auto_353976 ?auto_353979 ) ) ( not ( = ?auto_353976 ?auto_353978 ) ) ( not ( = ?auto_353976 ?auto_353980 ) ) ( not ( = ?auto_353976 ?auto_353984 ) ) ( not ( = ?auto_353973 ?auto_353977 ) ) ( not ( = ?auto_353973 ?auto_353979 ) ) ( not ( = ?auto_353973 ?auto_353978 ) ) ( not ( = ?auto_353973 ?auto_353980 ) ) ( not ( = ?auto_353973 ?auto_353984 ) ) ( not ( = ?auto_353977 ?auto_353979 ) ) ( not ( = ?auto_353977 ?auto_353978 ) ) ( not ( = ?auto_353977 ?auto_353980 ) ) ( not ( = ?auto_353977 ?auto_353984 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353979 ?auto_353978 ?auto_353980 )
      ( MAKE-7CRATE-VERIFY ?auto_353974 ?auto_353975 ?auto_353976 ?auto_353973 ?auto_353977 ?auto_353979 ?auto_353978 ?auto_353980 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_356893 - SURFACE
      ?auto_356894 - SURFACE
      ?auto_356895 - SURFACE
      ?auto_356892 - SURFACE
      ?auto_356896 - SURFACE
      ?auto_356898 - SURFACE
      ?auto_356897 - SURFACE
      ?auto_356899 - SURFACE
      ?auto_356900 - SURFACE
    )
    :vars
    (
      ?auto_356901 - HOIST
      ?auto_356902 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_356901 ?auto_356902 ) ( SURFACE-AT ?auto_356899 ?auto_356902 ) ( CLEAR ?auto_356899 ) ( LIFTING ?auto_356901 ?auto_356900 ) ( IS-CRATE ?auto_356900 ) ( not ( = ?auto_356899 ?auto_356900 ) ) ( ON ?auto_356894 ?auto_356893 ) ( ON ?auto_356895 ?auto_356894 ) ( ON ?auto_356892 ?auto_356895 ) ( ON ?auto_356896 ?auto_356892 ) ( ON ?auto_356898 ?auto_356896 ) ( ON ?auto_356897 ?auto_356898 ) ( ON ?auto_356899 ?auto_356897 ) ( not ( = ?auto_356893 ?auto_356894 ) ) ( not ( = ?auto_356893 ?auto_356895 ) ) ( not ( = ?auto_356893 ?auto_356892 ) ) ( not ( = ?auto_356893 ?auto_356896 ) ) ( not ( = ?auto_356893 ?auto_356898 ) ) ( not ( = ?auto_356893 ?auto_356897 ) ) ( not ( = ?auto_356893 ?auto_356899 ) ) ( not ( = ?auto_356893 ?auto_356900 ) ) ( not ( = ?auto_356894 ?auto_356895 ) ) ( not ( = ?auto_356894 ?auto_356892 ) ) ( not ( = ?auto_356894 ?auto_356896 ) ) ( not ( = ?auto_356894 ?auto_356898 ) ) ( not ( = ?auto_356894 ?auto_356897 ) ) ( not ( = ?auto_356894 ?auto_356899 ) ) ( not ( = ?auto_356894 ?auto_356900 ) ) ( not ( = ?auto_356895 ?auto_356892 ) ) ( not ( = ?auto_356895 ?auto_356896 ) ) ( not ( = ?auto_356895 ?auto_356898 ) ) ( not ( = ?auto_356895 ?auto_356897 ) ) ( not ( = ?auto_356895 ?auto_356899 ) ) ( not ( = ?auto_356895 ?auto_356900 ) ) ( not ( = ?auto_356892 ?auto_356896 ) ) ( not ( = ?auto_356892 ?auto_356898 ) ) ( not ( = ?auto_356892 ?auto_356897 ) ) ( not ( = ?auto_356892 ?auto_356899 ) ) ( not ( = ?auto_356892 ?auto_356900 ) ) ( not ( = ?auto_356896 ?auto_356898 ) ) ( not ( = ?auto_356896 ?auto_356897 ) ) ( not ( = ?auto_356896 ?auto_356899 ) ) ( not ( = ?auto_356896 ?auto_356900 ) ) ( not ( = ?auto_356898 ?auto_356897 ) ) ( not ( = ?auto_356898 ?auto_356899 ) ) ( not ( = ?auto_356898 ?auto_356900 ) ) ( not ( = ?auto_356897 ?auto_356899 ) ) ( not ( = ?auto_356897 ?auto_356900 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_356899 ?auto_356900 )
      ( MAKE-8CRATE-VERIFY ?auto_356893 ?auto_356894 ?auto_356895 ?auto_356892 ?auto_356896 ?auto_356898 ?auto_356897 ?auto_356899 ?auto_356900 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_356960 - SURFACE
      ?auto_356961 - SURFACE
      ?auto_356962 - SURFACE
      ?auto_356959 - SURFACE
      ?auto_356963 - SURFACE
      ?auto_356965 - SURFACE
      ?auto_356964 - SURFACE
      ?auto_356966 - SURFACE
      ?auto_356967 - SURFACE
    )
    :vars
    (
      ?auto_356969 - HOIST
      ?auto_356968 - PLACE
      ?auto_356970 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_356969 ?auto_356968 ) ( SURFACE-AT ?auto_356966 ?auto_356968 ) ( CLEAR ?auto_356966 ) ( IS-CRATE ?auto_356967 ) ( not ( = ?auto_356966 ?auto_356967 ) ) ( TRUCK-AT ?auto_356970 ?auto_356968 ) ( AVAILABLE ?auto_356969 ) ( IN ?auto_356967 ?auto_356970 ) ( ON ?auto_356966 ?auto_356964 ) ( not ( = ?auto_356964 ?auto_356966 ) ) ( not ( = ?auto_356964 ?auto_356967 ) ) ( ON ?auto_356961 ?auto_356960 ) ( ON ?auto_356962 ?auto_356961 ) ( ON ?auto_356959 ?auto_356962 ) ( ON ?auto_356963 ?auto_356959 ) ( ON ?auto_356965 ?auto_356963 ) ( ON ?auto_356964 ?auto_356965 ) ( not ( = ?auto_356960 ?auto_356961 ) ) ( not ( = ?auto_356960 ?auto_356962 ) ) ( not ( = ?auto_356960 ?auto_356959 ) ) ( not ( = ?auto_356960 ?auto_356963 ) ) ( not ( = ?auto_356960 ?auto_356965 ) ) ( not ( = ?auto_356960 ?auto_356964 ) ) ( not ( = ?auto_356960 ?auto_356966 ) ) ( not ( = ?auto_356960 ?auto_356967 ) ) ( not ( = ?auto_356961 ?auto_356962 ) ) ( not ( = ?auto_356961 ?auto_356959 ) ) ( not ( = ?auto_356961 ?auto_356963 ) ) ( not ( = ?auto_356961 ?auto_356965 ) ) ( not ( = ?auto_356961 ?auto_356964 ) ) ( not ( = ?auto_356961 ?auto_356966 ) ) ( not ( = ?auto_356961 ?auto_356967 ) ) ( not ( = ?auto_356962 ?auto_356959 ) ) ( not ( = ?auto_356962 ?auto_356963 ) ) ( not ( = ?auto_356962 ?auto_356965 ) ) ( not ( = ?auto_356962 ?auto_356964 ) ) ( not ( = ?auto_356962 ?auto_356966 ) ) ( not ( = ?auto_356962 ?auto_356967 ) ) ( not ( = ?auto_356959 ?auto_356963 ) ) ( not ( = ?auto_356959 ?auto_356965 ) ) ( not ( = ?auto_356959 ?auto_356964 ) ) ( not ( = ?auto_356959 ?auto_356966 ) ) ( not ( = ?auto_356959 ?auto_356967 ) ) ( not ( = ?auto_356963 ?auto_356965 ) ) ( not ( = ?auto_356963 ?auto_356964 ) ) ( not ( = ?auto_356963 ?auto_356966 ) ) ( not ( = ?auto_356963 ?auto_356967 ) ) ( not ( = ?auto_356965 ?auto_356964 ) ) ( not ( = ?auto_356965 ?auto_356966 ) ) ( not ( = ?auto_356965 ?auto_356967 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_356964 ?auto_356966 ?auto_356967 )
      ( MAKE-8CRATE-VERIFY ?auto_356960 ?auto_356961 ?auto_356962 ?auto_356959 ?auto_356963 ?auto_356965 ?auto_356964 ?auto_356966 ?auto_356967 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_357036 - SURFACE
      ?auto_357037 - SURFACE
      ?auto_357038 - SURFACE
      ?auto_357035 - SURFACE
      ?auto_357039 - SURFACE
      ?auto_357041 - SURFACE
      ?auto_357040 - SURFACE
      ?auto_357042 - SURFACE
      ?auto_357043 - SURFACE
    )
    :vars
    (
      ?auto_357047 - HOIST
      ?auto_357044 - PLACE
      ?auto_357046 - TRUCK
      ?auto_357045 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_357047 ?auto_357044 ) ( SURFACE-AT ?auto_357042 ?auto_357044 ) ( CLEAR ?auto_357042 ) ( IS-CRATE ?auto_357043 ) ( not ( = ?auto_357042 ?auto_357043 ) ) ( AVAILABLE ?auto_357047 ) ( IN ?auto_357043 ?auto_357046 ) ( ON ?auto_357042 ?auto_357040 ) ( not ( = ?auto_357040 ?auto_357042 ) ) ( not ( = ?auto_357040 ?auto_357043 ) ) ( TRUCK-AT ?auto_357046 ?auto_357045 ) ( not ( = ?auto_357045 ?auto_357044 ) ) ( ON ?auto_357037 ?auto_357036 ) ( ON ?auto_357038 ?auto_357037 ) ( ON ?auto_357035 ?auto_357038 ) ( ON ?auto_357039 ?auto_357035 ) ( ON ?auto_357041 ?auto_357039 ) ( ON ?auto_357040 ?auto_357041 ) ( not ( = ?auto_357036 ?auto_357037 ) ) ( not ( = ?auto_357036 ?auto_357038 ) ) ( not ( = ?auto_357036 ?auto_357035 ) ) ( not ( = ?auto_357036 ?auto_357039 ) ) ( not ( = ?auto_357036 ?auto_357041 ) ) ( not ( = ?auto_357036 ?auto_357040 ) ) ( not ( = ?auto_357036 ?auto_357042 ) ) ( not ( = ?auto_357036 ?auto_357043 ) ) ( not ( = ?auto_357037 ?auto_357038 ) ) ( not ( = ?auto_357037 ?auto_357035 ) ) ( not ( = ?auto_357037 ?auto_357039 ) ) ( not ( = ?auto_357037 ?auto_357041 ) ) ( not ( = ?auto_357037 ?auto_357040 ) ) ( not ( = ?auto_357037 ?auto_357042 ) ) ( not ( = ?auto_357037 ?auto_357043 ) ) ( not ( = ?auto_357038 ?auto_357035 ) ) ( not ( = ?auto_357038 ?auto_357039 ) ) ( not ( = ?auto_357038 ?auto_357041 ) ) ( not ( = ?auto_357038 ?auto_357040 ) ) ( not ( = ?auto_357038 ?auto_357042 ) ) ( not ( = ?auto_357038 ?auto_357043 ) ) ( not ( = ?auto_357035 ?auto_357039 ) ) ( not ( = ?auto_357035 ?auto_357041 ) ) ( not ( = ?auto_357035 ?auto_357040 ) ) ( not ( = ?auto_357035 ?auto_357042 ) ) ( not ( = ?auto_357035 ?auto_357043 ) ) ( not ( = ?auto_357039 ?auto_357041 ) ) ( not ( = ?auto_357039 ?auto_357040 ) ) ( not ( = ?auto_357039 ?auto_357042 ) ) ( not ( = ?auto_357039 ?auto_357043 ) ) ( not ( = ?auto_357041 ?auto_357040 ) ) ( not ( = ?auto_357041 ?auto_357042 ) ) ( not ( = ?auto_357041 ?auto_357043 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_357040 ?auto_357042 ?auto_357043 )
      ( MAKE-8CRATE-VERIFY ?auto_357036 ?auto_357037 ?auto_357038 ?auto_357035 ?auto_357039 ?auto_357041 ?auto_357040 ?auto_357042 ?auto_357043 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_357120 - SURFACE
      ?auto_357121 - SURFACE
      ?auto_357122 - SURFACE
      ?auto_357119 - SURFACE
      ?auto_357123 - SURFACE
      ?auto_357125 - SURFACE
      ?auto_357124 - SURFACE
      ?auto_357126 - SURFACE
      ?auto_357127 - SURFACE
    )
    :vars
    (
      ?auto_357128 - HOIST
      ?auto_357129 - PLACE
      ?auto_357132 - TRUCK
      ?auto_357131 - PLACE
      ?auto_357130 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_357128 ?auto_357129 ) ( SURFACE-AT ?auto_357126 ?auto_357129 ) ( CLEAR ?auto_357126 ) ( IS-CRATE ?auto_357127 ) ( not ( = ?auto_357126 ?auto_357127 ) ) ( AVAILABLE ?auto_357128 ) ( ON ?auto_357126 ?auto_357124 ) ( not ( = ?auto_357124 ?auto_357126 ) ) ( not ( = ?auto_357124 ?auto_357127 ) ) ( TRUCK-AT ?auto_357132 ?auto_357131 ) ( not ( = ?auto_357131 ?auto_357129 ) ) ( HOIST-AT ?auto_357130 ?auto_357131 ) ( LIFTING ?auto_357130 ?auto_357127 ) ( not ( = ?auto_357128 ?auto_357130 ) ) ( ON ?auto_357121 ?auto_357120 ) ( ON ?auto_357122 ?auto_357121 ) ( ON ?auto_357119 ?auto_357122 ) ( ON ?auto_357123 ?auto_357119 ) ( ON ?auto_357125 ?auto_357123 ) ( ON ?auto_357124 ?auto_357125 ) ( not ( = ?auto_357120 ?auto_357121 ) ) ( not ( = ?auto_357120 ?auto_357122 ) ) ( not ( = ?auto_357120 ?auto_357119 ) ) ( not ( = ?auto_357120 ?auto_357123 ) ) ( not ( = ?auto_357120 ?auto_357125 ) ) ( not ( = ?auto_357120 ?auto_357124 ) ) ( not ( = ?auto_357120 ?auto_357126 ) ) ( not ( = ?auto_357120 ?auto_357127 ) ) ( not ( = ?auto_357121 ?auto_357122 ) ) ( not ( = ?auto_357121 ?auto_357119 ) ) ( not ( = ?auto_357121 ?auto_357123 ) ) ( not ( = ?auto_357121 ?auto_357125 ) ) ( not ( = ?auto_357121 ?auto_357124 ) ) ( not ( = ?auto_357121 ?auto_357126 ) ) ( not ( = ?auto_357121 ?auto_357127 ) ) ( not ( = ?auto_357122 ?auto_357119 ) ) ( not ( = ?auto_357122 ?auto_357123 ) ) ( not ( = ?auto_357122 ?auto_357125 ) ) ( not ( = ?auto_357122 ?auto_357124 ) ) ( not ( = ?auto_357122 ?auto_357126 ) ) ( not ( = ?auto_357122 ?auto_357127 ) ) ( not ( = ?auto_357119 ?auto_357123 ) ) ( not ( = ?auto_357119 ?auto_357125 ) ) ( not ( = ?auto_357119 ?auto_357124 ) ) ( not ( = ?auto_357119 ?auto_357126 ) ) ( not ( = ?auto_357119 ?auto_357127 ) ) ( not ( = ?auto_357123 ?auto_357125 ) ) ( not ( = ?auto_357123 ?auto_357124 ) ) ( not ( = ?auto_357123 ?auto_357126 ) ) ( not ( = ?auto_357123 ?auto_357127 ) ) ( not ( = ?auto_357125 ?auto_357124 ) ) ( not ( = ?auto_357125 ?auto_357126 ) ) ( not ( = ?auto_357125 ?auto_357127 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_357124 ?auto_357126 ?auto_357127 )
      ( MAKE-8CRATE-VERIFY ?auto_357120 ?auto_357121 ?auto_357122 ?auto_357119 ?auto_357123 ?auto_357125 ?auto_357124 ?auto_357126 ?auto_357127 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_357212 - SURFACE
      ?auto_357213 - SURFACE
      ?auto_357214 - SURFACE
      ?auto_357211 - SURFACE
      ?auto_357215 - SURFACE
      ?auto_357217 - SURFACE
      ?auto_357216 - SURFACE
      ?auto_357218 - SURFACE
      ?auto_357219 - SURFACE
    )
    :vars
    (
      ?auto_357221 - HOIST
      ?auto_357220 - PLACE
      ?auto_357225 - TRUCK
      ?auto_357222 - PLACE
      ?auto_357223 - HOIST
      ?auto_357224 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_357221 ?auto_357220 ) ( SURFACE-AT ?auto_357218 ?auto_357220 ) ( CLEAR ?auto_357218 ) ( IS-CRATE ?auto_357219 ) ( not ( = ?auto_357218 ?auto_357219 ) ) ( AVAILABLE ?auto_357221 ) ( ON ?auto_357218 ?auto_357216 ) ( not ( = ?auto_357216 ?auto_357218 ) ) ( not ( = ?auto_357216 ?auto_357219 ) ) ( TRUCK-AT ?auto_357225 ?auto_357222 ) ( not ( = ?auto_357222 ?auto_357220 ) ) ( HOIST-AT ?auto_357223 ?auto_357222 ) ( not ( = ?auto_357221 ?auto_357223 ) ) ( AVAILABLE ?auto_357223 ) ( SURFACE-AT ?auto_357219 ?auto_357222 ) ( ON ?auto_357219 ?auto_357224 ) ( CLEAR ?auto_357219 ) ( not ( = ?auto_357218 ?auto_357224 ) ) ( not ( = ?auto_357219 ?auto_357224 ) ) ( not ( = ?auto_357216 ?auto_357224 ) ) ( ON ?auto_357213 ?auto_357212 ) ( ON ?auto_357214 ?auto_357213 ) ( ON ?auto_357211 ?auto_357214 ) ( ON ?auto_357215 ?auto_357211 ) ( ON ?auto_357217 ?auto_357215 ) ( ON ?auto_357216 ?auto_357217 ) ( not ( = ?auto_357212 ?auto_357213 ) ) ( not ( = ?auto_357212 ?auto_357214 ) ) ( not ( = ?auto_357212 ?auto_357211 ) ) ( not ( = ?auto_357212 ?auto_357215 ) ) ( not ( = ?auto_357212 ?auto_357217 ) ) ( not ( = ?auto_357212 ?auto_357216 ) ) ( not ( = ?auto_357212 ?auto_357218 ) ) ( not ( = ?auto_357212 ?auto_357219 ) ) ( not ( = ?auto_357212 ?auto_357224 ) ) ( not ( = ?auto_357213 ?auto_357214 ) ) ( not ( = ?auto_357213 ?auto_357211 ) ) ( not ( = ?auto_357213 ?auto_357215 ) ) ( not ( = ?auto_357213 ?auto_357217 ) ) ( not ( = ?auto_357213 ?auto_357216 ) ) ( not ( = ?auto_357213 ?auto_357218 ) ) ( not ( = ?auto_357213 ?auto_357219 ) ) ( not ( = ?auto_357213 ?auto_357224 ) ) ( not ( = ?auto_357214 ?auto_357211 ) ) ( not ( = ?auto_357214 ?auto_357215 ) ) ( not ( = ?auto_357214 ?auto_357217 ) ) ( not ( = ?auto_357214 ?auto_357216 ) ) ( not ( = ?auto_357214 ?auto_357218 ) ) ( not ( = ?auto_357214 ?auto_357219 ) ) ( not ( = ?auto_357214 ?auto_357224 ) ) ( not ( = ?auto_357211 ?auto_357215 ) ) ( not ( = ?auto_357211 ?auto_357217 ) ) ( not ( = ?auto_357211 ?auto_357216 ) ) ( not ( = ?auto_357211 ?auto_357218 ) ) ( not ( = ?auto_357211 ?auto_357219 ) ) ( not ( = ?auto_357211 ?auto_357224 ) ) ( not ( = ?auto_357215 ?auto_357217 ) ) ( not ( = ?auto_357215 ?auto_357216 ) ) ( not ( = ?auto_357215 ?auto_357218 ) ) ( not ( = ?auto_357215 ?auto_357219 ) ) ( not ( = ?auto_357215 ?auto_357224 ) ) ( not ( = ?auto_357217 ?auto_357216 ) ) ( not ( = ?auto_357217 ?auto_357218 ) ) ( not ( = ?auto_357217 ?auto_357219 ) ) ( not ( = ?auto_357217 ?auto_357224 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_357216 ?auto_357218 ?auto_357219 )
      ( MAKE-8CRATE-VERIFY ?auto_357212 ?auto_357213 ?auto_357214 ?auto_357211 ?auto_357215 ?auto_357217 ?auto_357216 ?auto_357218 ?auto_357219 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_357305 - SURFACE
      ?auto_357306 - SURFACE
      ?auto_357307 - SURFACE
      ?auto_357304 - SURFACE
      ?auto_357308 - SURFACE
      ?auto_357310 - SURFACE
      ?auto_357309 - SURFACE
      ?auto_357311 - SURFACE
      ?auto_357312 - SURFACE
    )
    :vars
    (
      ?auto_357313 - HOIST
      ?auto_357317 - PLACE
      ?auto_357314 - PLACE
      ?auto_357316 - HOIST
      ?auto_357315 - SURFACE
      ?auto_357318 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_357313 ?auto_357317 ) ( SURFACE-AT ?auto_357311 ?auto_357317 ) ( CLEAR ?auto_357311 ) ( IS-CRATE ?auto_357312 ) ( not ( = ?auto_357311 ?auto_357312 ) ) ( AVAILABLE ?auto_357313 ) ( ON ?auto_357311 ?auto_357309 ) ( not ( = ?auto_357309 ?auto_357311 ) ) ( not ( = ?auto_357309 ?auto_357312 ) ) ( not ( = ?auto_357314 ?auto_357317 ) ) ( HOIST-AT ?auto_357316 ?auto_357314 ) ( not ( = ?auto_357313 ?auto_357316 ) ) ( AVAILABLE ?auto_357316 ) ( SURFACE-AT ?auto_357312 ?auto_357314 ) ( ON ?auto_357312 ?auto_357315 ) ( CLEAR ?auto_357312 ) ( not ( = ?auto_357311 ?auto_357315 ) ) ( not ( = ?auto_357312 ?auto_357315 ) ) ( not ( = ?auto_357309 ?auto_357315 ) ) ( TRUCK-AT ?auto_357318 ?auto_357317 ) ( ON ?auto_357306 ?auto_357305 ) ( ON ?auto_357307 ?auto_357306 ) ( ON ?auto_357304 ?auto_357307 ) ( ON ?auto_357308 ?auto_357304 ) ( ON ?auto_357310 ?auto_357308 ) ( ON ?auto_357309 ?auto_357310 ) ( not ( = ?auto_357305 ?auto_357306 ) ) ( not ( = ?auto_357305 ?auto_357307 ) ) ( not ( = ?auto_357305 ?auto_357304 ) ) ( not ( = ?auto_357305 ?auto_357308 ) ) ( not ( = ?auto_357305 ?auto_357310 ) ) ( not ( = ?auto_357305 ?auto_357309 ) ) ( not ( = ?auto_357305 ?auto_357311 ) ) ( not ( = ?auto_357305 ?auto_357312 ) ) ( not ( = ?auto_357305 ?auto_357315 ) ) ( not ( = ?auto_357306 ?auto_357307 ) ) ( not ( = ?auto_357306 ?auto_357304 ) ) ( not ( = ?auto_357306 ?auto_357308 ) ) ( not ( = ?auto_357306 ?auto_357310 ) ) ( not ( = ?auto_357306 ?auto_357309 ) ) ( not ( = ?auto_357306 ?auto_357311 ) ) ( not ( = ?auto_357306 ?auto_357312 ) ) ( not ( = ?auto_357306 ?auto_357315 ) ) ( not ( = ?auto_357307 ?auto_357304 ) ) ( not ( = ?auto_357307 ?auto_357308 ) ) ( not ( = ?auto_357307 ?auto_357310 ) ) ( not ( = ?auto_357307 ?auto_357309 ) ) ( not ( = ?auto_357307 ?auto_357311 ) ) ( not ( = ?auto_357307 ?auto_357312 ) ) ( not ( = ?auto_357307 ?auto_357315 ) ) ( not ( = ?auto_357304 ?auto_357308 ) ) ( not ( = ?auto_357304 ?auto_357310 ) ) ( not ( = ?auto_357304 ?auto_357309 ) ) ( not ( = ?auto_357304 ?auto_357311 ) ) ( not ( = ?auto_357304 ?auto_357312 ) ) ( not ( = ?auto_357304 ?auto_357315 ) ) ( not ( = ?auto_357308 ?auto_357310 ) ) ( not ( = ?auto_357308 ?auto_357309 ) ) ( not ( = ?auto_357308 ?auto_357311 ) ) ( not ( = ?auto_357308 ?auto_357312 ) ) ( not ( = ?auto_357308 ?auto_357315 ) ) ( not ( = ?auto_357310 ?auto_357309 ) ) ( not ( = ?auto_357310 ?auto_357311 ) ) ( not ( = ?auto_357310 ?auto_357312 ) ) ( not ( = ?auto_357310 ?auto_357315 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_357309 ?auto_357311 ?auto_357312 )
      ( MAKE-8CRATE-VERIFY ?auto_357305 ?auto_357306 ?auto_357307 ?auto_357304 ?auto_357308 ?auto_357310 ?auto_357309 ?auto_357311 ?auto_357312 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_357398 - SURFACE
      ?auto_357399 - SURFACE
      ?auto_357400 - SURFACE
      ?auto_357397 - SURFACE
      ?auto_357401 - SURFACE
      ?auto_357403 - SURFACE
      ?auto_357402 - SURFACE
      ?auto_357404 - SURFACE
      ?auto_357405 - SURFACE
    )
    :vars
    (
      ?auto_357411 - HOIST
      ?auto_357410 - PLACE
      ?auto_357408 - PLACE
      ?auto_357409 - HOIST
      ?auto_357407 - SURFACE
      ?auto_357406 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_357411 ?auto_357410 ) ( IS-CRATE ?auto_357405 ) ( not ( = ?auto_357404 ?auto_357405 ) ) ( not ( = ?auto_357402 ?auto_357404 ) ) ( not ( = ?auto_357402 ?auto_357405 ) ) ( not ( = ?auto_357408 ?auto_357410 ) ) ( HOIST-AT ?auto_357409 ?auto_357408 ) ( not ( = ?auto_357411 ?auto_357409 ) ) ( AVAILABLE ?auto_357409 ) ( SURFACE-AT ?auto_357405 ?auto_357408 ) ( ON ?auto_357405 ?auto_357407 ) ( CLEAR ?auto_357405 ) ( not ( = ?auto_357404 ?auto_357407 ) ) ( not ( = ?auto_357405 ?auto_357407 ) ) ( not ( = ?auto_357402 ?auto_357407 ) ) ( TRUCK-AT ?auto_357406 ?auto_357410 ) ( SURFACE-AT ?auto_357402 ?auto_357410 ) ( CLEAR ?auto_357402 ) ( LIFTING ?auto_357411 ?auto_357404 ) ( IS-CRATE ?auto_357404 ) ( ON ?auto_357399 ?auto_357398 ) ( ON ?auto_357400 ?auto_357399 ) ( ON ?auto_357397 ?auto_357400 ) ( ON ?auto_357401 ?auto_357397 ) ( ON ?auto_357403 ?auto_357401 ) ( ON ?auto_357402 ?auto_357403 ) ( not ( = ?auto_357398 ?auto_357399 ) ) ( not ( = ?auto_357398 ?auto_357400 ) ) ( not ( = ?auto_357398 ?auto_357397 ) ) ( not ( = ?auto_357398 ?auto_357401 ) ) ( not ( = ?auto_357398 ?auto_357403 ) ) ( not ( = ?auto_357398 ?auto_357402 ) ) ( not ( = ?auto_357398 ?auto_357404 ) ) ( not ( = ?auto_357398 ?auto_357405 ) ) ( not ( = ?auto_357398 ?auto_357407 ) ) ( not ( = ?auto_357399 ?auto_357400 ) ) ( not ( = ?auto_357399 ?auto_357397 ) ) ( not ( = ?auto_357399 ?auto_357401 ) ) ( not ( = ?auto_357399 ?auto_357403 ) ) ( not ( = ?auto_357399 ?auto_357402 ) ) ( not ( = ?auto_357399 ?auto_357404 ) ) ( not ( = ?auto_357399 ?auto_357405 ) ) ( not ( = ?auto_357399 ?auto_357407 ) ) ( not ( = ?auto_357400 ?auto_357397 ) ) ( not ( = ?auto_357400 ?auto_357401 ) ) ( not ( = ?auto_357400 ?auto_357403 ) ) ( not ( = ?auto_357400 ?auto_357402 ) ) ( not ( = ?auto_357400 ?auto_357404 ) ) ( not ( = ?auto_357400 ?auto_357405 ) ) ( not ( = ?auto_357400 ?auto_357407 ) ) ( not ( = ?auto_357397 ?auto_357401 ) ) ( not ( = ?auto_357397 ?auto_357403 ) ) ( not ( = ?auto_357397 ?auto_357402 ) ) ( not ( = ?auto_357397 ?auto_357404 ) ) ( not ( = ?auto_357397 ?auto_357405 ) ) ( not ( = ?auto_357397 ?auto_357407 ) ) ( not ( = ?auto_357401 ?auto_357403 ) ) ( not ( = ?auto_357401 ?auto_357402 ) ) ( not ( = ?auto_357401 ?auto_357404 ) ) ( not ( = ?auto_357401 ?auto_357405 ) ) ( not ( = ?auto_357401 ?auto_357407 ) ) ( not ( = ?auto_357403 ?auto_357402 ) ) ( not ( = ?auto_357403 ?auto_357404 ) ) ( not ( = ?auto_357403 ?auto_357405 ) ) ( not ( = ?auto_357403 ?auto_357407 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_357402 ?auto_357404 ?auto_357405 )
      ( MAKE-8CRATE-VERIFY ?auto_357398 ?auto_357399 ?auto_357400 ?auto_357397 ?auto_357401 ?auto_357403 ?auto_357402 ?auto_357404 ?auto_357405 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_357491 - SURFACE
      ?auto_357492 - SURFACE
      ?auto_357493 - SURFACE
      ?auto_357490 - SURFACE
      ?auto_357494 - SURFACE
      ?auto_357496 - SURFACE
      ?auto_357495 - SURFACE
      ?auto_357497 - SURFACE
      ?auto_357498 - SURFACE
    )
    :vars
    (
      ?auto_357500 - HOIST
      ?auto_357502 - PLACE
      ?auto_357504 - PLACE
      ?auto_357503 - HOIST
      ?auto_357501 - SURFACE
      ?auto_357499 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_357500 ?auto_357502 ) ( IS-CRATE ?auto_357498 ) ( not ( = ?auto_357497 ?auto_357498 ) ) ( not ( = ?auto_357495 ?auto_357497 ) ) ( not ( = ?auto_357495 ?auto_357498 ) ) ( not ( = ?auto_357504 ?auto_357502 ) ) ( HOIST-AT ?auto_357503 ?auto_357504 ) ( not ( = ?auto_357500 ?auto_357503 ) ) ( AVAILABLE ?auto_357503 ) ( SURFACE-AT ?auto_357498 ?auto_357504 ) ( ON ?auto_357498 ?auto_357501 ) ( CLEAR ?auto_357498 ) ( not ( = ?auto_357497 ?auto_357501 ) ) ( not ( = ?auto_357498 ?auto_357501 ) ) ( not ( = ?auto_357495 ?auto_357501 ) ) ( TRUCK-AT ?auto_357499 ?auto_357502 ) ( SURFACE-AT ?auto_357495 ?auto_357502 ) ( CLEAR ?auto_357495 ) ( IS-CRATE ?auto_357497 ) ( AVAILABLE ?auto_357500 ) ( IN ?auto_357497 ?auto_357499 ) ( ON ?auto_357492 ?auto_357491 ) ( ON ?auto_357493 ?auto_357492 ) ( ON ?auto_357490 ?auto_357493 ) ( ON ?auto_357494 ?auto_357490 ) ( ON ?auto_357496 ?auto_357494 ) ( ON ?auto_357495 ?auto_357496 ) ( not ( = ?auto_357491 ?auto_357492 ) ) ( not ( = ?auto_357491 ?auto_357493 ) ) ( not ( = ?auto_357491 ?auto_357490 ) ) ( not ( = ?auto_357491 ?auto_357494 ) ) ( not ( = ?auto_357491 ?auto_357496 ) ) ( not ( = ?auto_357491 ?auto_357495 ) ) ( not ( = ?auto_357491 ?auto_357497 ) ) ( not ( = ?auto_357491 ?auto_357498 ) ) ( not ( = ?auto_357491 ?auto_357501 ) ) ( not ( = ?auto_357492 ?auto_357493 ) ) ( not ( = ?auto_357492 ?auto_357490 ) ) ( not ( = ?auto_357492 ?auto_357494 ) ) ( not ( = ?auto_357492 ?auto_357496 ) ) ( not ( = ?auto_357492 ?auto_357495 ) ) ( not ( = ?auto_357492 ?auto_357497 ) ) ( not ( = ?auto_357492 ?auto_357498 ) ) ( not ( = ?auto_357492 ?auto_357501 ) ) ( not ( = ?auto_357493 ?auto_357490 ) ) ( not ( = ?auto_357493 ?auto_357494 ) ) ( not ( = ?auto_357493 ?auto_357496 ) ) ( not ( = ?auto_357493 ?auto_357495 ) ) ( not ( = ?auto_357493 ?auto_357497 ) ) ( not ( = ?auto_357493 ?auto_357498 ) ) ( not ( = ?auto_357493 ?auto_357501 ) ) ( not ( = ?auto_357490 ?auto_357494 ) ) ( not ( = ?auto_357490 ?auto_357496 ) ) ( not ( = ?auto_357490 ?auto_357495 ) ) ( not ( = ?auto_357490 ?auto_357497 ) ) ( not ( = ?auto_357490 ?auto_357498 ) ) ( not ( = ?auto_357490 ?auto_357501 ) ) ( not ( = ?auto_357494 ?auto_357496 ) ) ( not ( = ?auto_357494 ?auto_357495 ) ) ( not ( = ?auto_357494 ?auto_357497 ) ) ( not ( = ?auto_357494 ?auto_357498 ) ) ( not ( = ?auto_357494 ?auto_357501 ) ) ( not ( = ?auto_357496 ?auto_357495 ) ) ( not ( = ?auto_357496 ?auto_357497 ) ) ( not ( = ?auto_357496 ?auto_357498 ) ) ( not ( = ?auto_357496 ?auto_357501 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_357495 ?auto_357497 ?auto_357498 )
      ( MAKE-8CRATE-VERIFY ?auto_357491 ?auto_357492 ?auto_357493 ?auto_357490 ?auto_357494 ?auto_357496 ?auto_357495 ?auto_357497 ?auto_357498 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_361607 - SURFACE
      ?auto_361608 - SURFACE
      ?auto_361609 - SURFACE
      ?auto_361606 - SURFACE
      ?auto_361610 - SURFACE
      ?auto_361612 - SURFACE
      ?auto_361611 - SURFACE
      ?auto_361613 - SURFACE
      ?auto_361614 - SURFACE
      ?auto_361615 - SURFACE
    )
    :vars
    (
      ?auto_361617 - HOIST
      ?auto_361616 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_361617 ?auto_361616 ) ( SURFACE-AT ?auto_361614 ?auto_361616 ) ( CLEAR ?auto_361614 ) ( LIFTING ?auto_361617 ?auto_361615 ) ( IS-CRATE ?auto_361615 ) ( not ( = ?auto_361614 ?auto_361615 ) ) ( ON ?auto_361608 ?auto_361607 ) ( ON ?auto_361609 ?auto_361608 ) ( ON ?auto_361606 ?auto_361609 ) ( ON ?auto_361610 ?auto_361606 ) ( ON ?auto_361612 ?auto_361610 ) ( ON ?auto_361611 ?auto_361612 ) ( ON ?auto_361613 ?auto_361611 ) ( ON ?auto_361614 ?auto_361613 ) ( not ( = ?auto_361607 ?auto_361608 ) ) ( not ( = ?auto_361607 ?auto_361609 ) ) ( not ( = ?auto_361607 ?auto_361606 ) ) ( not ( = ?auto_361607 ?auto_361610 ) ) ( not ( = ?auto_361607 ?auto_361612 ) ) ( not ( = ?auto_361607 ?auto_361611 ) ) ( not ( = ?auto_361607 ?auto_361613 ) ) ( not ( = ?auto_361607 ?auto_361614 ) ) ( not ( = ?auto_361607 ?auto_361615 ) ) ( not ( = ?auto_361608 ?auto_361609 ) ) ( not ( = ?auto_361608 ?auto_361606 ) ) ( not ( = ?auto_361608 ?auto_361610 ) ) ( not ( = ?auto_361608 ?auto_361612 ) ) ( not ( = ?auto_361608 ?auto_361611 ) ) ( not ( = ?auto_361608 ?auto_361613 ) ) ( not ( = ?auto_361608 ?auto_361614 ) ) ( not ( = ?auto_361608 ?auto_361615 ) ) ( not ( = ?auto_361609 ?auto_361606 ) ) ( not ( = ?auto_361609 ?auto_361610 ) ) ( not ( = ?auto_361609 ?auto_361612 ) ) ( not ( = ?auto_361609 ?auto_361611 ) ) ( not ( = ?auto_361609 ?auto_361613 ) ) ( not ( = ?auto_361609 ?auto_361614 ) ) ( not ( = ?auto_361609 ?auto_361615 ) ) ( not ( = ?auto_361606 ?auto_361610 ) ) ( not ( = ?auto_361606 ?auto_361612 ) ) ( not ( = ?auto_361606 ?auto_361611 ) ) ( not ( = ?auto_361606 ?auto_361613 ) ) ( not ( = ?auto_361606 ?auto_361614 ) ) ( not ( = ?auto_361606 ?auto_361615 ) ) ( not ( = ?auto_361610 ?auto_361612 ) ) ( not ( = ?auto_361610 ?auto_361611 ) ) ( not ( = ?auto_361610 ?auto_361613 ) ) ( not ( = ?auto_361610 ?auto_361614 ) ) ( not ( = ?auto_361610 ?auto_361615 ) ) ( not ( = ?auto_361612 ?auto_361611 ) ) ( not ( = ?auto_361612 ?auto_361613 ) ) ( not ( = ?auto_361612 ?auto_361614 ) ) ( not ( = ?auto_361612 ?auto_361615 ) ) ( not ( = ?auto_361611 ?auto_361613 ) ) ( not ( = ?auto_361611 ?auto_361614 ) ) ( not ( = ?auto_361611 ?auto_361615 ) ) ( not ( = ?auto_361613 ?auto_361614 ) ) ( not ( = ?auto_361613 ?auto_361615 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_361614 ?auto_361615 )
      ( MAKE-9CRATE-VERIFY ?auto_361607 ?auto_361608 ?auto_361609 ?auto_361606 ?auto_361610 ?auto_361612 ?auto_361611 ?auto_361613 ?auto_361614 ?auto_361615 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_361687 - SURFACE
      ?auto_361688 - SURFACE
      ?auto_361689 - SURFACE
      ?auto_361686 - SURFACE
      ?auto_361690 - SURFACE
      ?auto_361692 - SURFACE
      ?auto_361691 - SURFACE
      ?auto_361693 - SURFACE
      ?auto_361694 - SURFACE
      ?auto_361695 - SURFACE
    )
    :vars
    (
      ?auto_361697 - HOIST
      ?auto_361696 - PLACE
      ?auto_361698 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_361697 ?auto_361696 ) ( SURFACE-AT ?auto_361694 ?auto_361696 ) ( CLEAR ?auto_361694 ) ( IS-CRATE ?auto_361695 ) ( not ( = ?auto_361694 ?auto_361695 ) ) ( TRUCK-AT ?auto_361698 ?auto_361696 ) ( AVAILABLE ?auto_361697 ) ( IN ?auto_361695 ?auto_361698 ) ( ON ?auto_361694 ?auto_361693 ) ( not ( = ?auto_361693 ?auto_361694 ) ) ( not ( = ?auto_361693 ?auto_361695 ) ) ( ON ?auto_361688 ?auto_361687 ) ( ON ?auto_361689 ?auto_361688 ) ( ON ?auto_361686 ?auto_361689 ) ( ON ?auto_361690 ?auto_361686 ) ( ON ?auto_361692 ?auto_361690 ) ( ON ?auto_361691 ?auto_361692 ) ( ON ?auto_361693 ?auto_361691 ) ( not ( = ?auto_361687 ?auto_361688 ) ) ( not ( = ?auto_361687 ?auto_361689 ) ) ( not ( = ?auto_361687 ?auto_361686 ) ) ( not ( = ?auto_361687 ?auto_361690 ) ) ( not ( = ?auto_361687 ?auto_361692 ) ) ( not ( = ?auto_361687 ?auto_361691 ) ) ( not ( = ?auto_361687 ?auto_361693 ) ) ( not ( = ?auto_361687 ?auto_361694 ) ) ( not ( = ?auto_361687 ?auto_361695 ) ) ( not ( = ?auto_361688 ?auto_361689 ) ) ( not ( = ?auto_361688 ?auto_361686 ) ) ( not ( = ?auto_361688 ?auto_361690 ) ) ( not ( = ?auto_361688 ?auto_361692 ) ) ( not ( = ?auto_361688 ?auto_361691 ) ) ( not ( = ?auto_361688 ?auto_361693 ) ) ( not ( = ?auto_361688 ?auto_361694 ) ) ( not ( = ?auto_361688 ?auto_361695 ) ) ( not ( = ?auto_361689 ?auto_361686 ) ) ( not ( = ?auto_361689 ?auto_361690 ) ) ( not ( = ?auto_361689 ?auto_361692 ) ) ( not ( = ?auto_361689 ?auto_361691 ) ) ( not ( = ?auto_361689 ?auto_361693 ) ) ( not ( = ?auto_361689 ?auto_361694 ) ) ( not ( = ?auto_361689 ?auto_361695 ) ) ( not ( = ?auto_361686 ?auto_361690 ) ) ( not ( = ?auto_361686 ?auto_361692 ) ) ( not ( = ?auto_361686 ?auto_361691 ) ) ( not ( = ?auto_361686 ?auto_361693 ) ) ( not ( = ?auto_361686 ?auto_361694 ) ) ( not ( = ?auto_361686 ?auto_361695 ) ) ( not ( = ?auto_361690 ?auto_361692 ) ) ( not ( = ?auto_361690 ?auto_361691 ) ) ( not ( = ?auto_361690 ?auto_361693 ) ) ( not ( = ?auto_361690 ?auto_361694 ) ) ( not ( = ?auto_361690 ?auto_361695 ) ) ( not ( = ?auto_361692 ?auto_361691 ) ) ( not ( = ?auto_361692 ?auto_361693 ) ) ( not ( = ?auto_361692 ?auto_361694 ) ) ( not ( = ?auto_361692 ?auto_361695 ) ) ( not ( = ?auto_361691 ?auto_361693 ) ) ( not ( = ?auto_361691 ?auto_361694 ) ) ( not ( = ?auto_361691 ?auto_361695 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_361693 ?auto_361694 ?auto_361695 )
      ( MAKE-9CRATE-VERIFY ?auto_361687 ?auto_361688 ?auto_361689 ?auto_361686 ?auto_361690 ?auto_361692 ?auto_361691 ?auto_361693 ?auto_361694 ?auto_361695 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_361777 - SURFACE
      ?auto_361778 - SURFACE
      ?auto_361779 - SURFACE
      ?auto_361776 - SURFACE
      ?auto_361780 - SURFACE
      ?auto_361782 - SURFACE
      ?auto_361781 - SURFACE
      ?auto_361783 - SURFACE
      ?auto_361784 - SURFACE
      ?auto_361785 - SURFACE
    )
    :vars
    (
      ?auto_361786 - HOIST
      ?auto_361787 - PLACE
      ?auto_361788 - TRUCK
      ?auto_361789 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_361786 ?auto_361787 ) ( SURFACE-AT ?auto_361784 ?auto_361787 ) ( CLEAR ?auto_361784 ) ( IS-CRATE ?auto_361785 ) ( not ( = ?auto_361784 ?auto_361785 ) ) ( AVAILABLE ?auto_361786 ) ( IN ?auto_361785 ?auto_361788 ) ( ON ?auto_361784 ?auto_361783 ) ( not ( = ?auto_361783 ?auto_361784 ) ) ( not ( = ?auto_361783 ?auto_361785 ) ) ( TRUCK-AT ?auto_361788 ?auto_361789 ) ( not ( = ?auto_361789 ?auto_361787 ) ) ( ON ?auto_361778 ?auto_361777 ) ( ON ?auto_361779 ?auto_361778 ) ( ON ?auto_361776 ?auto_361779 ) ( ON ?auto_361780 ?auto_361776 ) ( ON ?auto_361782 ?auto_361780 ) ( ON ?auto_361781 ?auto_361782 ) ( ON ?auto_361783 ?auto_361781 ) ( not ( = ?auto_361777 ?auto_361778 ) ) ( not ( = ?auto_361777 ?auto_361779 ) ) ( not ( = ?auto_361777 ?auto_361776 ) ) ( not ( = ?auto_361777 ?auto_361780 ) ) ( not ( = ?auto_361777 ?auto_361782 ) ) ( not ( = ?auto_361777 ?auto_361781 ) ) ( not ( = ?auto_361777 ?auto_361783 ) ) ( not ( = ?auto_361777 ?auto_361784 ) ) ( not ( = ?auto_361777 ?auto_361785 ) ) ( not ( = ?auto_361778 ?auto_361779 ) ) ( not ( = ?auto_361778 ?auto_361776 ) ) ( not ( = ?auto_361778 ?auto_361780 ) ) ( not ( = ?auto_361778 ?auto_361782 ) ) ( not ( = ?auto_361778 ?auto_361781 ) ) ( not ( = ?auto_361778 ?auto_361783 ) ) ( not ( = ?auto_361778 ?auto_361784 ) ) ( not ( = ?auto_361778 ?auto_361785 ) ) ( not ( = ?auto_361779 ?auto_361776 ) ) ( not ( = ?auto_361779 ?auto_361780 ) ) ( not ( = ?auto_361779 ?auto_361782 ) ) ( not ( = ?auto_361779 ?auto_361781 ) ) ( not ( = ?auto_361779 ?auto_361783 ) ) ( not ( = ?auto_361779 ?auto_361784 ) ) ( not ( = ?auto_361779 ?auto_361785 ) ) ( not ( = ?auto_361776 ?auto_361780 ) ) ( not ( = ?auto_361776 ?auto_361782 ) ) ( not ( = ?auto_361776 ?auto_361781 ) ) ( not ( = ?auto_361776 ?auto_361783 ) ) ( not ( = ?auto_361776 ?auto_361784 ) ) ( not ( = ?auto_361776 ?auto_361785 ) ) ( not ( = ?auto_361780 ?auto_361782 ) ) ( not ( = ?auto_361780 ?auto_361781 ) ) ( not ( = ?auto_361780 ?auto_361783 ) ) ( not ( = ?auto_361780 ?auto_361784 ) ) ( not ( = ?auto_361780 ?auto_361785 ) ) ( not ( = ?auto_361782 ?auto_361781 ) ) ( not ( = ?auto_361782 ?auto_361783 ) ) ( not ( = ?auto_361782 ?auto_361784 ) ) ( not ( = ?auto_361782 ?auto_361785 ) ) ( not ( = ?auto_361781 ?auto_361783 ) ) ( not ( = ?auto_361781 ?auto_361784 ) ) ( not ( = ?auto_361781 ?auto_361785 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_361783 ?auto_361784 ?auto_361785 )
      ( MAKE-9CRATE-VERIFY ?auto_361777 ?auto_361778 ?auto_361779 ?auto_361776 ?auto_361780 ?auto_361782 ?auto_361781 ?auto_361783 ?auto_361784 ?auto_361785 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_361876 - SURFACE
      ?auto_361877 - SURFACE
      ?auto_361878 - SURFACE
      ?auto_361875 - SURFACE
      ?auto_361879 - SURFACE
      ?auto_361881 - SURFACE
      ?auto_361880 - SURFACE
      ?auto_361882 - SURFACE
      ?auto_361883 - SURFACE
      ?auto_361884 - SURFACE
    )
    :vars
    (
      ?auto_361887 - HOIST
      ?auto_361885 - PLACE
      ?auto_361888 - TRUCK
      ?auto_361889 - PLACE
      ?auto_361886 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_361887 ?auto_361885 ) ( SURFACE-AT ?auto_361883 ?auto_361885 ) ( CLEAR ?auto_361883 ) ( IS-CRATE ?auto_361884 ) ( not ( = ?auto_361883 ?auto_361884 ) ) ( AVAILABLE ?auto_361887 ) ( ON ?auto_361883 ?auto_361882 ) ( not ( = ?auto_361882 ?auto_361883 ) ) ( not ( = ?auto_361882 ?auto_361884 ) ) ( TRUCK-AT ?auto_361888 ?auto_361889 ) ( not ( = ?auto_361889 ?auto_361885 ) ) ( HOIST-AT ?auto_361886 ?auto_361889 ) ( LIFTING ?auto_361886 ?auto_361884 ) ( not ( = ?auto_361887 ?auto_361886 ) ) ( ON ?auto_361877 ?auto_361876 ) ( ON ?auto_361878 ?auto_361877 ) ( ON ?auto_361875 ?auto_361878 ) ( ON ?auto_361879 ?auto_361875 ) ( ON ?auto_361881 ?auto_361879 ) ( ON ?auto_361880 ?auto_361881 ) ( ON ?auto_361882 ?auto_361880 ) ( not ( = ?auto_361876 ?auto_361877 ) ) ( not ( = ?auto_361876 ?auto_361878 ) ) ( not ( = ?auto_361876 ?auto_361875 ) ) ( not ( = ?auto_361876 ?auto_361879 ) ) ( not ( = ?auto_361876 ?auto_361881 ) ) ( not ( = ?auto_361876 ?auto_361880 ) ) ( not ( = ?auto_361876 ?auto_361882 ) ) ( not ( = ?auto_361876 ?auto_361883 ) ) ( not ( = ?auto_361876 ?auto_361884 ) ) ( not ( = ?auto_361877 ?auto_361878 ) ) ( not ( = ?auto_361877 ?auto_361875 ) ) ( not ( = ?auto_361877 ?auto_361879 ) ) ( not ( = ?auto_361877 ?auto_361881 ) ) ( not ( = ?auto_361877 ?auto_361880 ) ) ( not ( = ?auto_361877 ?auto_361882 ) ) ( not ( = ?auto_361877 ?auto_361883 ) ) ( not ( = ?auto_361877 ?auto_361884 ) ) ( not ( = ?auto_361878 ?auto_361875 ) ) ( not ( = ?auto_361878 ?auto_361879 ) ) ( not ( = ?auto_361878 ?auto_361881 ) ) ( not ( = ?auto_361878 ?auto_361880 ) ) ( not ( = ?auto_361878 ?auto_361882 ) ) ( not ( = ?auto_361878 ?auto_361883 ) ) ( not ( = ?auto_361878 ?auto_361884 ) ) ( not ( = ?auto_361875 ?auto_361879 ) ) ( not ( = ?auto_361875 ?auto_361881 ) ) ( not ( = ?auto_361875 ?auto_361880 ) ) ( not ( = ?auto_361875 ?auto_361882 ) ) ( not ( = ?auto_361875 ?auto_361883 ) ) ( not ( = ?auto_361875 ?auto_361884 ) ) ( not ( = ?auto_361879 ?auto_361881 ) ) ( not ( = ?auto_361879 ?auto_361880 ) ) ( not ( = ?auto_361879 ?auto_361882 ) ) ( not ( = ?auto_361879 ?auto_361883 ) ) ( not ( = ?auto_361879 ?auto_361884 ) ) ( not ( = ?auto_361881 ?auto_361880 ) ) ( not ( = ?auto_361881 ?auto_361882 ) ) ( not ( = ?auto_361881 ?auto_361883 ) ) ( not ( = ?auto_361881 ?auto_361884 ) ) ( not ( = ?auto_361880 ?auto_361882 ) ) ( not ( = ?auto_361880 ?auto_361883 ) ) ( not ( = ?auto_361880 ?auto_361884 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_361882 ?auto_361883 ?auto_361884 )
      ( MAKE-9CRATE-VERIFY ?auto_361876 ?auto_361877 ?auto_361878 ?auto_361875 ?auto_361879 ?auto_361881 ?auto_361880 ?auto_361882 ?auto_361883 ?auto_361884 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_361984 - SURFACE
      ?auto_361985 - SURFACE
      ?auto_361986 - SURFACE
      ?auto_361983 - SURFACE
      ?auto_361987 - SURFACE
      ?auto_361989 - SURFACE
      ?auto_361988 - SURFACE
      ?auto_361990 - SURFACE
      ?auto_361991 - SURFACE
      ?auto_361992 - SURFACE
    )
    :vars
    (
      ?auto_361996 - HOIST
      ?auto_361995 - PLACE
      ?auto_361993 - TRUCK
      ?auto_361998 - PLACE
      ?auto_361997 - HOIST
      ?auto_361994 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_361996 ?auto_361995 ) ( SURFACE-AT ?auto_361991 ?auto_361995 ) ( CLEAR ?auto_361991 ) ( IS-CRATE ?auto_361992 ) ( not ( = ?auto_361991 ?auto_361992 ) ) ( AVAILABLE ?auto_361996 ) ( ON ?auto_361991 ?auto_361990 ) ( not ( = ?auto_361990 ?auto_361991 ) ) ( not ( = ?auto_361990 ?auto_361992 ) ) ( TRUCK-AT ?auto_361993 ?auto_361998 ) ( not ( = ?auto_361998 ?auto_361995 ) ) ( HOIST-AT ?auto_361997 ?auto_361998 ) ( not ( = ?auto_361996 ?auto_361997 ) ) ( AVAILABLE ?auto_361997 ) ( SURFACE-AT ?auto_361992 ?auto_361998 ) ( ON ?auto_361992 ?auto_361994 ) ( CLEAR ?auto_361992 ) ( not ( = ?auto_361991 ?auto_361994 ) ) ( not ( = ?auto_361992 ?auto_361994 ) ) ( not ( = ?auto_361990 ?auto_361994 ) ) ( ON ?auto_361985 ?auto_361984 ) ( ON ?auto_361986 ?auto_361985 ) ( ON ?auto_361983 ?auto_361986 ) ( ON ?auto_361987 ?auto_361983 ) ( ON ?auto_361989 ?auto_361987 ) ( ON ?auto_361988 ?auto_361989 ) ( ON ?auto_361990 ?auto_361988 ) ( not ( = ?auto_361984 ?auto_361985 ) ) ( not ( = ?auto_361984 ?auto_361986 ) ) ( not ( = ?auto_361984 ?auto_361983 ) ) ( not ( = ?auto_361984 ?auto_361987 ) ) ( not ( = ?auto_361984 ?auto_361989 ) ) ( not ( = ?auto_361984 ?auto_361988 ) ) ( not ( = ?auto_361984 ?auto_361990 ) ) ( not ( = ?auto_361984 ?auto_361991 ) ) ( not ( = ?auto_361984 ?auto_361992 ) ) ( not ( = ?auto_361984 ?auto_361994 ) ) ( not ( = ?auto_361985 ?auto_361986 ) ) ( not ( = ?auto_361985 ?auto_361983 ) ) ( not ( = ?auto_361985 ?auto_361987 ) ) ( not ( = ?auto_361985 ?auto_361989 ) ) ( not ( = ?auto_361985 ?auto_361988 ) ) ( not ( = ?auto_361985 ?auto_361990 ) ) ( not ( = ?auto_361985 ?auto_361991 ) ) ( not ( = ?auto_361985 ?auto_361992 ) ) ( not ( = ?auto_361985 ?auto_361994 ) ) ( not ( = ?auto_361986 ?auto_361983 ) ) ( not ( = ?auto_361986 ?auto_361987 ) ) ( not ( = ?auto_361986 ?auto_361989 ) ) ( not ( = ?auto_361986 ?auto_361988 ) ) ( not ( = ?auto_361986 ?auto_361990 ) ) ( not ( = ?auto_361986 ?auto_361991 ) ) ( not ( = ?auto_361986 ?auto_361992 ) ) ( not ( = ?auto_361986 ?auto_361994 ) ) ( not ( = ?auto_361983 ?auto_361987 ) ) ( not ( = ?auto_361983 ?auto_361989 ) ) ( not ( = ?auto_361983 ?auto_361988 ) ) ( not ( = ?auto_361983 ?auto_361990 ) ) ( not ( = ?auto_361983 ?auto_361991 ) ) ( not ( = ?auto_361983 ?auto_361992 ) ) ( not ( = ?auto_361983 ?auto_361994 ) ) ( not ( = ?auto_361987 ?auto_361989 ) ) ( not ( = ?auto_361987 ?auto_361988 ) ) ( not ( = ?auto_361987 ?auto_361990 ) ) ( not ( = ?auto_361987 ?auto_361991 ) ) ( not ( = ?auto_361987 ?auto_361992 ) ) ( not ( = ?auto_361987 ?auto_361994 ) ) ( not ( = ?auto_361989 ?auto_361988 ) ) ( not ( = ?auto_361989 ?auto_361990 ) ) ( not ( = ?auto_361989 ?auto_361991 ) ) ( not ( = ?auto_361989 ?auto_361992 ) ) ( not ( = ?auto_361989 ?auto_361994 ) ) ( not ( = ?auto_361988 ?auto_361990 ) ) ( not ( = ?auto_361988 ?auto_361991 ) ) ( not ( = ?auto_361988 ?auto_361992 ) ) ( not ( = ?auto_361988 ?auto_361994 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_361990 ?auto_361991 ?auto_361992 )
      ( MAKE-9CRATE-VERIFY ?auto_361984 ?auto_361985 ?auto_361986 ?auto_361983 ?auto_361987 ?auto_361989 ?auto_361988 ?auto_361990 ?auto_361991 ?auto_361992 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_362093 - SURFACE
      ?auto_362094 - SURFACE
      ?auto_362095 - SURFACE
      ?auto_362092 - SURFACE
      ?auto_362096 - SURFACE
      ?auto_362098 - SURFACE
      ?auto_362097 - SURFACE
      ?auto_362099 - SURFACE
      ?auto_362100 - SURFACE
      ?auto_362101 - SURFACE
    )
    :vars
    (
      ?auto_362106 - HOIST
      ?auto_362102 - PLACE
      ?auto_362107 - PLACE
      ?auto_362105 - HOIST
      ?auto_362103 - SURFACE
      ?auto_362104 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_362106 ?auto_362102 ) ( SURFACE-AT ?auto_362100 ?auto_362102 ) ( CLEAR ?auto_362100 ) ( IS-CRATE ?auto_362101 ) ( not ( = ?auto_362100 ?auto_362101 ) ) ( AVAILABLE ?auto_362106 ) ( ON ?auto_362100 ?auto_362099 ) ( not ( = ?auto_362099 ?auto_362100 ) ) ( not ( = ?auto_362099 ?auto_362101 ) ) ( not ( = ?auto_362107 ?auto_362102 ) ) ( HOIST-AT ?auto_362105 ?auto_362107 ) ( not ( = ?auto_362106 ?auto_362105 ) ) ( AVAILABLE ?auto_362105 ) ( SURFACE-AT ?auto_362101 ?auto_362107 ) ( ON ?auto_362101 ?auto_362103 ) ( CLEAR ?auto_362101 ) ( not ( = ?auto_362100 ?auto_362103 ) ) ( not ( = ?auto_362101 ?auto_362103 ) ) ( not ( = ?auto_362099 ?auto_362103 ) ) ( TRUCK-AT ?auto_362104 ?auto_362102 ) ( ON ?auto_362094 ?auto_362093 ) ( ON ?auto_362095 ?auto_362094 ) ( ON ?auto_362092 ?auto_362095 ) ( ON ?auto_362096 ?auto_362092 ) ( ON ?auto_362098 ?auto_362096 ) ( ON ?auto_362097 ?auto_362098 ) ( ON ?auto_362099 ?auto_362097 ) ( not ( = ?auto_362093 ?auto_362094 ) ) ( not ( = ?auto_362093 ?auto_362095 ) ) ( not ( = ?auto_362093 ?auto_362092 ) ) ( not ( = ?auto_362093 ?auto_362096 ) ) ( not ( = ?auto_362093 ?auto_362098 ) ) ( not ( = ?auto_362093 ?auto_362097 ) ) ( not ( = ?auto_362093 ?auto_362099 ) ) ( not ( = ?auto_362093 ?auto_362100 ) ) ( not ( = ?auto_362093 ?auto_362101 ) ) ( not ( = ?auto_362093 ?auto_362103 ) ) ( not ( = ?auto_362094 ?auto_362095 ) ) ( not ( = ?auto_362094 ?auto_362092 ) ) ( not ( = ?auto_362094 ?auto_362096 ) ) ( not ( = ?auto_362094 ?auto_362098 ) ) ( not ( = ?auto_362094 ?auto_362097 ) ) ( not ( = ?auto_362094 ?auto_362099 ) ) ( not ( = ?auto_362094 ?auto_362100 ) ) ( not ( = ?auto_362094 ?auto_362101 ) ) ( not ( = ?auto_362094 ?auto_362103 ) ) ( not ( = ?auto_362095 ?auto_362092 ) ) ( not ( = ?auto_362095 ?auto_362096 ) ) ( not ( = ?auto_362095 ?auto_362098 ) ) ( not ( = ?auto_362095 ?auto_362097 ) ) ( not ( = ?auto_362095 ?auto_362099 ) ) ( not ( = ?auto_362095 ?auto_362100 ) ) ( not ( = ?auto_362095 ?auto_362101 ) ) ( not ( = ?auto_362095 ?auto_362103 ) ) ( not ( = ?auto_362092 ?auto_362096 ) ) ( not ( = ?auto_362092 ?auto_362098 ) ) ( not ( = ?auto_362092 ?auto_362097 ) ) ( not ( = ?auto_362092 ?auto_362099 ) ) ( not ( = ?auto_362092 ?auto_362100 ) ) ( not ( = ?auto_362092 ?auto_362101 ) ) ( not ( = ?auto_362092 ?auto_362103 ) ) ( not ( = ?auto_362096 ?auto_362098 ) ) ( not ( = ?auto_362096 ?auto_362097 ) ) ( not ( = ?auto_362096 ?auto_362099 ) ) ( not ( = ?auto_362096 ?auto_362100 ) ) ( not ( = ?auto_362096 ?auto_362101 ) ) ( not ( = ?auto_362096 ?auto_362103 ) ) ( not ( = ?auto_362098 ?auto_362097 ) ) ( not ( = ?auto_362098 ?auto_362099 ) ) ( not ( = ?auto_362098 ?auto_362100 ) ) ( not ( = ?auto_362098 ?auto_362101 ) ) ( not ( = ?auto_362098 ?auto_362103 ) ) ( not ( = ?auto_362097 ?auto_362099 ) ) ( not ( = ?auto_362097 ?auto_362100 ) ) ( not ( = ?auto_362097 ?auto_362101 ) ) ( not ( = ?auto_362097 ?auto_362103 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_362099 ?auto_362100 ?auto_362101 )
      ( MAKE-9CRATE-VERIFY ?auto_362093 ?auto_362094 ?auto_362095 ?auto_362092 ?auto_362096 ?auto_362098 ?auto_362097 ?auto_362099 ?auto_362100 ?auto_362101 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_362202 - SURFACE
      ?auto_362203 - SURFACE
      ?auto_362204 - SURFACE
      ?auto_362201 - SURFACE
      ?auto_362205 - SURFACE
      ?auto_362207 - SURFACE
      ?auto_362206 - SURFACE
      ?auto_362208 - SURFACE
      ?auto_362209 - SURFACE
      ?auto_362210 - SURFACE
    )
    :vars
    (
      ?auto_362212 - HOIST
      ?auto_362214 - PLACE
      ?auto_362213 - PLACE
      ?auto_362211 - HOIST
      ?auto_362215 - SURFACE
      ?auto_362216 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_362212 ?auto_362214 ) ( IS-CRATE ?auto_362210 ) ( not ( = ?auto_362209 ?auto_362210 ) ) ( not ( = ?auto_362208 ?auto_362209 ) ) ( not ( = ?auto_362208 ?auto_362210 ) ) ( not ( = ?auto_362213 ?auto_362214 ) ) ( HOIST-AT ?auto_362211 ?auto_362213 ) ( not ( = ?auto_362212 ?auto_362211 ) ) ( AVAILABLE ?auto_362211 ) ( SURFACE-AT ?auto_362210 ?auto_362213 ) ( ON ?auto_362210 ?auto_362215 ) ( CLEAR ?auto_362210 ) ( not ( = ?auto_362209 ?auto_362215 ) ) ( not ( = ?auto_362210 ?auto_362215 ) ) ( not ( = ?auto_362208 ?auto_362215 ) ) ( TRUCK-AT ?auto_362216 ?auto_362214 ) ( SURFACE-AT ?auto_362208 ?auto_362214 ) ( CLEAR ?auto_362208 ) ( LIFTING ?auto_362212 ?auto_362209 ) ( IS-CRATE ?auto_362209 ) ( ON ?auto_362203 ?auto_362202 ) ( ON ?auto_362204 ?auto_362203 ) ( ON ?auto_362201 ?auto_362204 ) ( ON ?auto_362205 ?auto_362201 ) ( ON ?auto_362207 ?auto_362205 ) ( ON ?auto_362206 ?auto_362207 ) ( ON ?auto_362208 ?auto_362206 ) ( not ( = ?auto_362202 ?auto_362203 ) ) ( not ( = ?auto_362202 ?auto_362204 ) ) ( not ( = ?auto_362202 ?auto_362201 ) ) ( not ( = ?auto_362202 ?auto_362205 ) ) ( not ( = ?auto_362202 ?auto_362207 ) ) ( not ( = ?auto_362202 ?auto_362206 ) ) ( not ( = ?auto_362202 ?auto_362208 ) ) ( not ( = ?auto_362202 ?auto_362209 ) ) ( not ( = ?auto_362202 ?auto_362210 ) ) ( not ( = ?auto_362202 ?auto_362215 ) ) ( not ( = ?auto_362203 ?auto_362204 ) ) ( not ( = ?auto_362203 ?auto_362201 ) ) ( not ( = ?auto_362203 ?auto_362205 ) ) ( not ( = ?auto_362203 ?auto_362207 ) ) ( not ( = ?auto_362203 ?auto_362206 ) ) ( not ( = ?auto_362203 ?auto_362208 ) ) ( not ( = ?auto_362203 ?auto_362209 ) ) ( not ( = ?auto_362203 ?auto_362210 ) ) ( not ( = ?auto_362203 ?auto_362215 ) ) ( not ( = ?auto_362204 ?auto_362201 ) ) ( not ( = ?auto_362204 ?auto_362205 ) ) ( not ( = ?auto_362204 ?auto_362207 ) ) ( not ( = ?auto_362204 ?auto_362206 ) ) ( not ( = ?auto_362204 ?auto_362208 ) ) ( not ( = ?auto_362204 ?auto_362209 ) ) ( not ( = ?auto_362204 ?auto_362210 ) ) ( not ( = ?auto_362204 ?auto_362215 ) ) ( not ( = ?auto_362201 ?auto_362205 ) ) ( not ( = ?auto_362201 ?auto_362207 ) ) ( not ( = ?auto_362201 ?auto_362206 ) ) ( not ( = ?auto_362201 ?auto_362208 ) ) ( not ( = ?auto_362201 ?auto_362209 ) ) ( not ( = ?auto_362201 ?auto_362210 ) ) ( not ( = ?auto_362201 ?auto_362215 ) ) ( not ( = ?auto_362205 ?auto_362207 ) ) ( not ( = ?auto_362205 ?auto_362206 ) ) ( not ( = ?auto_362205 ?auto_362208 ) ) ( not ( = ?auto_362205 ?auto_362209 ) ) ( not ( = ?auto_362205 ?auto_362210 ) ) ( not ( = ?auto_362205 ?auto_362215 ) ) ( not ( = ?auto_362207 ?auto_362206 ) ) ( not ( = ?auto_362207 ?auto_362208 ) ) ( not ( = ?auto_362207 ?auto_362209 ) ) ( not ( = ?auto_362207 ?auto_362210 ) ) ( not ( = ?auto_362207 ?auto_362215 ) ) ( not ( = ?auto_362206 ?auto_362208 ) ) ( not ( = ?auto_362206 ?auto_362209 ) ) ( not ( = ?auto_362206 ?auto_362210 ) ) ( not ( = ?auto_362206 ?auto_362215 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_362208 ?auto_362209 ?auto_362210 )
      ( MAKE-9CRATE-VERIFY ?auto_362202 ?auto_362203 ?auto_362204 ?auto_362201 ?auto_362205 ?auto_362207 ?auto_362206 ?auto_362208 ?auto_362209 ?auto_362210 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_362311 - SURFACE
      ?auto_362312 - SURFACE
      ?auto_362313 - SURFACE
      ?auto_362310 - SURFACE
      ?auto_362314 - SURFACE
      ?auto_362316 - SURFACE
      ?auto_362315 - SURFACE
      ?auto_362317 - SURFACE
      ?auto_362318 - SURFACE
      ?auto_362319 - SURFACE
    )
    :vars
    (
      ?auto_362322 - HOIST
      ?auto_362320 - PLACE
      ?auto_362323 - PLACE
      ?auto_362325 - HOIST
      ?auto_362321 - SURFACE
      ?auto_362324 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_362322 ?auto_362320 ) ( IS-CRATE ?auto_362319 ) ( not ( = ?auto_362318 ?auto_362319 ) ) ( not ( = ?auto_362317 ?auto_362318 ) ) ( not ( = ?auto_362317 ?auto_362319 ) ) ( not ( = ?auto_362323 ?auto_362320 ) ) ( HOIST-AT ?auto_362325 ?auto_362323 ) ( not ( = ?auto_362322 ?auto_362325 ) ) ( AVAILABLE ?auto_362325 ) ( SURFACE-AT ?auto_362319 ?auto_362323 ) ( ON ?auto_362319 ?auto_362321 ) ( CLEAR ?auto_362319 ) ( not ( = ?auto_362318 ?auto_362321 ) ) ( not ( = ?auto_362319 ?auto_362321 ) ) ( not ( = ?auto_362317 ?auto_362321 ) ) ( TRUCK-AT ?auto_362324 ?auto_362320 ) ( SURFACE-AT ?auto_362317 ?auto_362320 ) ( CLEAR ?auto_362317 ) ( IS-CRATE ?auto_362318 ) ( AVAILABLE ?auto_362322 ) ( IN ?auto_362318 ?auto_362324 ) ( ON ?auto_362312 ?auto_362311 ) ( ON ?auto_362313 ?auto_362312 ) ( ON ?auto_362310 ?auto_362313 ) ( ON ?auto_362314 ?auto_362310 ) ( ON ?auto_362316 ?auto_362314 ) ( ON ?auto_362315 ?auto_362316 ) ( ON ?auto_362317 ?auto_362315 ) ( not ( = ?auto_362311 ?auto_362312 ) ) ( not ( = ?auto_362311 ?auto_362313 ) ) ( not ( = ?auto_362311 ?auto_362310 ) ) ( not ( = ?auto_362311 ?auto_362314 ) ) ( not ( = ?auto_362311 ?auto_362316 ) ) ( not ( = ?auto_362311 ?auto_362315 ) ) ( not ( = ?auto_362311 ?auto_362317 ) ) ( not ( = ?auto_362311 ?auto_362318 ) ) ( not ( = ?auto_362311 ?auto_362319 ) ) ( not ( = ?auto_362311 ?auto_362321 ) ) ( not ( = ?auto_362312 ?auto_362313 ) ) ( not ( = ?auto_362312 ?auto_362310 ) ) ( not ( = ?auto_362312 ?auto_362314 ) ) ( not ( = ?auto_362312 ?auto_362316 ) ) ( not ( = ?auto_362312 ?auto_362315 ) ) ( not ( = ?auto_362312 ?auto_362317 ) ) ( not ( = ?auto_362312 ?auto_362318 ) ) ( not ( = ?auto_362312 ?auto_362319 ) ) ( not ( = ?auto_362312 ?auto_362321 ) ) ( not ( = ?auto_362313 ?auto_362310 ) ) ( not ( = ?auto_362313 ?auto_362314 ) ) ( not ( = ?auto_362313 ?auto_362316 ) ) ( not ( = ?auto_362313 ?auto_362315 ) ) ( not ( = ?auto_362313 ?auto_362317 ) ) ( not ( = ?auto_362313 ?auto_362318 ) ) ( not ( = ?auto_362313 ?auto_362319 ) ) ( not ( = ?auto_362313 ?auto_362321 ) ) ( not ( = ?auto_362310 ?auto_362314 ) ) ( not ( = ?auto_362310 ?auto_362316 ) ) ( not ( = ?auto_362310 ?auto_362315 ) ) ( not ( = ?auto_362310 ?auto_362317 ) ) ( not ( = ?auto_362310 ?auto_362318 ) ) ( not ( = ?auto_362310 ?auto_362319 ) ) ( not ( = ?auto_362310 ?auto_362321 ) ) ( not ( = ?auto_362314 ?auto_362316 ) ) ( not ( = ?auto_362314 ?auto_362315 ) ) ( not ( = ?auto_362314 ?auto_362317 ) ) ( not ( = ?auto_362314 ?auto_362318 ) ) ( not ( = ?auto_362314 ?auto_362319 ) ) ( not ( = ?auto_362314 ?auto_362321 ) ) ( not ( = ?auto_362316 ?auto_362315 ) ) ( not ( = ?auto_362316 ?auto_362317 ) ) ( not ( = ?auto_362316 ?auto_362318 ) ) ( not ( = ?auto_362316 ?auto_362319 ) ) ( not ( = ?auto_362316 ?auto_362321 ) ) ( not ( = ?auto_362315 ?auto_362317 ) ) ( not ( = ?auto_362315 ?auto_362318 ) ) ( not ( = ?auto_362315 ?auto_362319 ) ) ( not ( = ?auto_362315 ?auto_362321 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_362317 ?auto_362318 ?auto_362319 )
      ( MAKE-9CRATE-VERIFY ?auto_362311 ?auto_362312 ?auto_362313 ?auto_362310 ?auto_362314 ?auto_362316 ?auto_362315 ?auto_362317 ?auto_362318 ?auto_362319 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_367876 - SURFACE
      ?auto_367877 - SURFACE
      ?auto_367878 - SURFACE
      ?auto_367875 - SURFACE
      ?auto_367879 - SURFACE
      ?auto_367881 - SURFACE
      ?auto_367880 - SURFACE
      ?auto_367882 - SURFACE
      ?auto_367883 - SURFACE
      ?auto_367884 - SURFACE
      ?auto_367885 - SURFACE
    )
    :vars
    (
      ?auto_367887 - HOIST
      ?auto_367886 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_367887 ?auto_367886 ) ( SURFACE-AT ?auto_367884 ?auto_367886 ) ( CLEAR ?auto_367884 ) ( LIFTING ?auto_367887 ?auto_367885 ) ( IS-CRATE ?auto_367885 ) ( not ( = ?auto_367884 ?auto_367885 ) ) ( ON ?auto_367877 ?auto_367876 ) ( ON ?auto_367878 ?auto_367877 ) ( ON ?auto_367875 ?auto_367878 ) ( ON ?auto_367879 ?auto_367875 ) ( ON ?auto_367881 ?auto_367879 ) ( ON ?auto_367880 ?auto_367881 ) ( ON ?auto_367882 ?auto_367880 ) ( ON ?auto_367883 ?auto_367882 ) ( ON ?auto_367884 ?auto_367883 ) ( not ( = ?auto_367876 ?auto_367877 ) ) ( not ( = ?auto_367876 ?auto_367878 ) ) ( not ( = ?auto_367876 ?auto_367875 ) ) ( not ( = ?auto_367876 ?auto_367879 ) ) ( not ( = ?auto_367876 ?auto_367881 ) ) ( not ( = ?auto_367876 ?auto_367880 ) ) ( not ( = ?auto_367876 ?auto_367882 ) ) ( not ( = ?auto_367876 ?auto_367883 ) ) ( not ( = ?auto_367876 ?auto_367884 ) ) ( not ( = ?auto_367876 ?auto_367885 ) ) ( not ( = ?auto_367877 ?auto_367878 ) ) ( not ( = ?auto_367877 ?auto_367875 ) ) ( not ( = ?auto_367877 ?auto_367879 ) ) ( not ( = ?auto_367877 ?auto_367881 ) ) ( not ( = ?auto_367877 ?auto_367880 ) ) ( not ( = ?auto_367877 ?auto_367882 ) ) ( not ( = ?auto_367877 ?auto_367883 ) ) ( not ( = ?auto_367877 ?auto_367884 ) ) ( not ( = ?auto_367877 ?auto_367885 ) ) ( not ( = ?auto_367878 ?auto_367875 ) ) ( not ( = ?auto_367878 ?auto_367879 ) ) ( not ( = ?auto_367878 ?auto_367881 ) ) ( not ( = ?auto_367878 ?auto_367880 ) ) ( not ( = ?auto_367878 ?auto_367882 ) ) ( not ( = ?auto_367878 ?auto_367883 ) ) ( not ( = ?auto_367878 ?auto_367884 ) ) ( not ( = ?auto_367878 ?auto_367885 ) ) ( not ( = ?auto_367875 ?auto_367879 ) ) ( not ( = ?auto_367875 ?auto_367881 ) ) ( not ( = ?auto_367875 ?auto_367880 ) ) ( not ( = ?auto_367875 ?auto_367882 ) ) ( not ( = ?auto_367875 ?auto_367883 ) ) ( not ( = ?auto_367875 ?auto_367884 ) ) ( not ( = ?auto_367875 ?auto_367885 ) ) ( not ( = ?auto_367879 ?auto_367881 ) ) ( not ( = ?auto_367879 ?auto_367880 ) ) ( not ( = ?auto_367879 ?auto_367882 ) ) ( not ( = ?auto_367879 ?auto_367883 ) ) ( not ( = ?auto_367879 ?auto_367884 ) ) ( not ( = ?auto_367879 ?auto_367885 ) ) ( not ( = ?auto_367881 ?auto_367880 ) ) ( not ( = ?auto_367881 ?auto_367882 ) ) ( not ( = ?auto_367881 ?auto_367883 ) ) ( not ( = ?auto_367881 ?auto_367884 ) ) ( not ( = ?auto_367881 ?auto_367885 ) ) ( not ( = ?auto_367880 ?auto_367882 ) ) ( not ( = ?auto_367880 ?auto_367883 ) ) ( not ( = ?auto_367880 ?auto_367884 ) ) ( not ( = ?auto_367880 ?auto_367885 ) ) ( not ( = ?auto_367882 ?auto_367883 ) ) ( not ( = ?auto_367882 ?auto_367884 ) ) ( not ( = ?auto_367882 ?auto_367885 ) ) ( not ( = ?auto_367883 ?auto_367884 ) ) ( not ( = ?auto_367883 ?auto_367885 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_367884 ?auto_367885 )
      ( MAKE-10CRATE-VERIFY ?auto_367876 ?auto_367877 ?auto_367878 ?auto_367875 ?auto_367879 ?auto_367881 ?auto_367880 ?auto_367882 ?auto_367883 ?auto_367884 ?auto_367885 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_367970 - SURFACE
      ?auto_367971 - SURFACE
      ?auto_367972 - SURFACE
      ?auto_367969 - SURFACE
      ?auto_367973 - SURFACE
      ?auto_367975 - SURFACE
      ?auto_367974 - SURFACE
      ?auto_367976 - SURFACE
      ?auto_367977 - SURFACE
      ?auto_367978 - SURFACE
      ?auto_367979 - SURFACE
    )
    :vars
    (
      ?auto_367981 - HOIST
      ?auto_367980 - PLACE
      ?auto_367982 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_367981 ?auto_367980 ) ( SURFACE-AT ?auto_367978 ?auto_367980 ) ( CLEAR ?auto_367978 ) ( IS-CRATE ?auto_367979 ) ( not ( = ?auto_367978 ?auto_367979 ) ) ( TRUCK-AT ?auto_367982 ?auto_367980 ) ( AVAILABLE ?auto_367981 ) ( IN ?auto_367979 ?auto_367982 ) ( ON ?auto_367978 ?auto_367977 ) ( not ( = ?auto_367977 ?auto_367978 ) ) ( not ( = ?auto_367977 ?auto_367979 ) ) ( ON ?auto_367971 ?auto_367970 ) ( ON ?auto_367972 ?auto_367971 ) ( ON ?auto_367969 ?auto_367972 ) ( ON ?auto_367973 ?auto_367969 ) ( ON ?auto_367975 ?auto_367973 ) ( ON ?auto_367974 ?auto_367975 ) ( ON ?auto_367976 ?auto_367974 ) ( ON ?auto_367977 ?auto_367976 ) ( not ( = ?auto_367970 ?auto_367971 ) ) ( not ( = ?auto_367970 ?auto_367972 ) ) ( not ( = ?auto_367970 ?auto_367969 ) ) ( not ( = ?auto_367970 ?auto_367973 ) ) ( not ( = ?auto_367970 ?auto_367975 ) ) ( not ( = ?auto_367970 ?auto_367974 ) ) ( not ( = ?auto_367970 ?auto_367976 ) ) ( not ( = ?auto_367970 ?auto_367977 ) ) ( not ( = ?auto_367970 ?auto_367978 ) ) ( not ( = ?auto_367970 ?auto_367979 ) ) ( not ( = ?auto_367971 ?auto_367972 ) ) ( not ( = ?auto_367971 ?auto_367969 ) ) ( not ( = ?auto_367971 ?auto_367973 ) ) ( not ( = ?auto_367971 ?auto_367975 ) ) ( not ( = ?auto_367971 ?auto_367974 ) ) ( not ( = ?auto_367971 ?auto_367976 ) ) ( not ( = ?auto_367971 ?auto_367977 ) ) ( not ( = ?auto_367971 ?auto_367978 ) ) ( not ( = ?auto_367971 ?auto_367979 ) ) ( not ( = ?auto_367972 ?auto_367969 ) ) ( not ( = ?auto_367972 ?auto_367973 ) ) ( not ( = ?auto_367972 ?auto_367975 ) ) ( not ( = ?auto_367972 ?auto_367974 ) ) ( not ( = ?auto_367972 ?auto_367976 ) ) ( not ( = ?auto_367972 ?auto_367977 ) ) ( not ( = ?auto_367972 ?auto_367978 ) ) ( not ( = ?auto_367972 ?auto_367979 ) ) ( not ( = ?auto_367969 ?auto_367973 ) ) ( not ( = ?auto_367969 ?auto_367975 ) ) ( not ( = ?auto_367969 ?auto_367974 ) ) ( not ( = ?auto_367969 ?auto_367976 ) ) ( not ( = ?auto_367969 ?auto_367977 ) ) ( not ( = ?auto_367969 ?auto_367978 ) ) ( not ( = ?auto_367969 ?auto_367979 ) ) ( not ( = ?auto_367973 ?auto_367975 ) ) ( not ( = ?auto_367973 ?auto_367974 ) ) ( not ( = ?auto_367973 ?auto_367976 ) ) ( not ( = ?auto_367973 ?auto_367977 ) ) ( not ( = ?auto_367973 ?auto_367978 ) ) ( not ( = ?auto_367973 ?auto_367979 ) ) ( not ( = ?auto_367975 ?auto_367974 ) ) ( not ( = ?auto_367975 ?auto_367976 ) ) ( not ( = ?auto_367975 ?auto_367977 ) ) ( not ( = ?auto_367975 ?auto_367978 ) ) ( not ( = ?auto_367975 ?auto_367979 ) ) ( not ( = ?auto_367974 ?auto_367976 ) ) ( not ( = ?auto_367974 ?auto_367977 ) ) ( not ( = ?auto_367974 ?auto_367978 ) ) ( not ( = ?auto_367974 ?auto_367979 ) ) ( not ( = ?auto_367976 ?auto_367977 ) ) ( not ( = ?auto_367976 ?auto_367978 ) ) ( not ( = ?auto_367976 ?auto_367979 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_367977 ?auto_367978 ?auto_367979 )
      ( MAKE-10CRATE-VERIFY ?auto_367970 ?auto_367971 ?auto_367972 ?auto_367969 ?auto_367973 ?auto_367975 ?auto_367974 ?auto_367976 ?auto_367977 ?auto_367978 ?auto_367979 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_368075 - SURFACE
      ?auto_368076 - SURFACE
      ?auto_368077 - SURFACE
      ?auto_368074 - SURFACE
      ?auto_368078 - SURFACE
      ?auto_368080 - SURFACE
      ?auto_368079 - SURFACE
      ?auto_368081 - SURFACE
      ?auto_368082 - SURFACE
      ?auto_368083 - SURFACE
      ?auto_368084 - SURFACE
    )
    :vars
    (
      ?auto_368086 - HOIST
      ?auto_368085 - PLACE
      ?auto_368087 - TRUCK
      ?auto_368088 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_368086 ?auto_368085 ) ( SURFACE-AT ?auto_368083 ?auto_368085 ) ( CLEAR ?auto_368083 ) ( IS-CRATE ?auto_368084 ) ( not ( = ?auto_368083 ?auto_368084 ) ) ( AVAILABLE ?auto_368086 ) ( IN ?auto_368084 ?auto_368087 ) ( ON ?auto_368083 ?auto_368082 ) ( not ( = ?auto_368082 ?auto_368083 ) ) ( not ( = ?auto_368082 ?auto_368084 ) ) ( TRUCK-AT ?auto_368087 ?auto_368088 ) ( not ( = ?auto_368088 ?auto_368085 ) ) ( ON ?auto_368076 ?auto_368075 ) ( ON ?auto_368077 ?auto_368076 ) ( ON ?auto_368074 ?auto_368077 ) ( ON ?auto_368078 ?auto_368074 ) ( ON ?auto_368080 ?auto_368078 ) ( ON ?auto_368079 ?auto_368080 ) ( ON ?auto_368081 ?auto_368079 ) ( ON ?auto_368082 ?auto_368081 ) ( not ( = ?auto_368075 ?auto_368076 ) ) ( not ( = ?auto_368075 ?auto_368077 ) ) ( not ( = ?auto_368075 ?auto_368074 ) ) ( not ( = ?auto_368075 ?auto_368078 ) ) ( not ( = ?auto_368075 ?auto_368080 ) ) ( not ( = ?auto_368075 ?auto_368079 ) ) ( not ( = ?auto_368075 ?auto_368081 ) ) ( not ( = ?auto_368075 ?auto_368082 ) ) ( not ( = ?auto_368075 ?auto_368083 ) ) ( not ( = ?auto_368075 ?auto_368084 ) ) ( not ( = ?auto_368076 ?auto_368077 ) ) ( not ( = ?auto_368076 ?auto_368074 ) ) ( not ( = ?auto_368076 ?auto_368078 ) ) ( not ( = ?auto_368076 ?auto_368080 ) ) ( not ( = ?auto_368076 ?auto_368079 ) ) ( not ( = ?auto_368076 ?auto_368081 ) ) ( not ( = ?auto_368076 ?auto_368082 ) ) ( not ( = ?auto_368076 ?auto_368083 ) ) ( not ( = ?auto_368076 ?auto_368084 ) ) ( not ( = ?auto_368077 ?auto_368074 ) ) ( not ( = ?auto_368077 ?auto_368078 ) ) ( not ( = ?auto_368077 ?auto_368080 ) ) ( not ( = ?auto_368077 ?auto_368079 ) ) ( not ( = ?auto_368077 ?auto_368081 ) ) ( not ( = ?auto_368077 ?auto_368082 ) ) ( not ( = ?auto_368077 ?auto_368083 ) ) ( not ( = ?auto_368077 ?auto_368084 ) ) ( not ( = ?auto_368074 ?auto_368078 ) ) ( not ( = ?auto_368074 ?auto_368080 ) ) ( not ( = ?auto_368074 ?auto_368079 ) ) ( not ( = ?auto_368074 ?auto_368081 ) ) ( not ( = ?auto_368074 ?auto_368082 ) ) ( not ( = ?auto_368074 ?auto_368083 ) ) ( not ( = ?auto_368074 ?auto_368084 ) ) ( not ( = ?auto_368078 ?auto_368080 ) ) ( not ( = ?auto_368078 ?auto_368079 ) ) ( not ( = ?auto_368078 ?auto_368081 ) ) ( not ( = ?auto_368078 ?auto_368082 ) ) ( not ( = ?auto_368078 ?auto_368083 ) ) ( not ( = ?auto_368078 ?auto_368084 ) ) ( not ( = ?auto_368080 ?auto_368079 ) ) ( not ( = ?auto_368080 ?auto_368081 ) ) ( not ( = ?auto_368080 ?auto_368082 ) ) ( not ( = ?auto_368080 ?auto_368083 ) ) ( not ( = ?auto_368080 ?auto_368084 ) ) ( not ( = ?auto_368079 ?auto_368081 ) ) ( not ( = ?auto_368079 ?auto_368082 ) ) ( not ( = ?auto_368079 ?auto_368083 ) ) ( not ( = ?auto_368079 ?auto_368084 ) ) ( not ( = ?auto_368081 ?auto_368082 ) ) ( not ( = ?auto_368081 ?auto_368083 ) ) ( not ( = ?auto_368081 ?auto_368084 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_368082 ?auto_368083 ?auto_368084 )
      ( MAKE-10CRATE-VERIFY ?auto_368075 ?auto_368076 ?auto_368077 ?auto_368074 ?auto_368078 ?auto_368080 ?auto_368079 ?auto_368081 ?auto_368082 ?auto_368083 ?auto_368084 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_368190 - SURFACE
      ?auto_368191 - SURFACE
      ?auto_368192 - SURFACE
      ?auto_368189 - SURFACE
      ?auto_368193 - SURFACE
      ?auto_368195 - SURFACE
      ?auto_368194 - SURFACE
      ?auto_368196 - SURFACE
      ?auto_368197 - SURFACE
      ?auto_368198 - SURFACE
      ?auto_368199 - SURFACE
    )
    :vars
    (
      ?auto_368202 - HOIST
      ?auto_368201 - PLACE
      ?auto_368204 - TRUCK
      ?auto_368200 - PLACE
      ?auto_368203 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_368202 ?auto_368201 ) ( SURFACE-AT ?auto_368198 ?auto_368201 ) ( CLEAR ?auto_368198 ) ( IS-CRATE ?auto_368199 ) ( not ( = ?auto_368198 ?auto_368199 ) ) ( AVAILABLE ?auto_368202 ) ( ON ?auto_368198 ?auto_368197 ) ( not ( = ?auto_368197 ?auto_368198 ) ) ( not ( = ?auto_368197 ?auto_368199 ) ) ( TRUCK-AT ?auto_368204 ?auto_368200 ) ( not ( = ?auto_368200 ?auto_368201 ) ) ( HOIST-AT ?auto_368203 ?auto_368200 ) ( LIFTING ?auto_368203 ?auto_368199 ) ( not ( = ?auto_368202 ?auto_368203 ) ) ( ON ?auto_368191 ?auto_368190 ) ( ON ?auto_368192 ?auto_368191 ) ( ON ?auto_368189 ?auto_368192 ) ( ON ?auto_368193 ?auto_368189 ) ( ON ?auto_368195 ?auto_368193 ) ( ON ?auto_368194 ?auto_368195 ) ( ON ?auto_368196 ?auto_368194 ) ( ON ?auto_368197 ?auto_368196 ) ( not ( = ?auto_368190 ?auto_368191 ) ) ( not ( = ?auto_368190 ?auto_368192 ) ) ( not ( = ?auto_368190 ?auto_368189 ) ) ( not ( = ?auto_368190 ?auto_368193 ) ) ( not ( = ?auto_368190 ?auto_368195 ) ) ( not ( = ?auto_368190 ?auto_368194 ) ) ( not ( = ?auto_368190 ?auto_368196 ) ) ( not ( = ?auto_368190 ?auto_368197 ) ) ( not ( = ?auto_368190 ?auto_368198 ) ) ( not ( = ?auto_368190 ?auto_368199 ) ) ( not ( = ?auto_368191 ?auto_368192 ) ) ( not ( = ?auto_368191 ?auto_368189 ) ) ( not ( = ?auto_368191 ?auto_368193 ) ) ( not ( = ?auto_368191 ?auto_368195 ) ) ( not ( = ?auto_368191 ?auto_368194 ) ) ( not ( = ?auto_368191 ?auto_368196 ) ) ( not ( = ?auto_368191 ?auto_368197 ) ) ( not ( = ?auto_368191 ?auto_368198 ) ) ( not ( = ?auto_368191 ?auto_368199 ) ) ( not ( = ?auto_368192 ?auto_368189 ) ) ( not ( = ?auto_368192 ?auto_368193 ) ) ( not ( = ?auto_368192 ?auto_368195 ) ) ( not ( = ?auto_368192 ?auto_368194 ) ) ( not ( = ?auto_368192 ?auto_368196 ) ) ( not ( = ?auto_368192 ?auto_368197 ) ) ( not ( = ?auto_368192 ?auto_368198 ) ) ( not ( = ?auto_368192 ?auto_368199 ) ) ( not ( = ?auto_368189 ?auto_368193 ) ) ( not ( = ?auto_368189 ?auto_368195 ) ) ( not ( = ?auto_368189 ?auto_368194 ) ) ( not ( = ?auto_368189 ?auto_368196 ) ) ( not ( = ?auto_368189 ?auto_368197 ) ) ( not ( = ?auto_368189 ?auto_368198 ) ) ( not ( = ?auto_368189 ?auto_368199 ) ) ( not ( = ?auto_368193 ?auto_368195 ) ) ( not ( = ?auto_368193 ?auto_368194 ) ) ( not ( = ?auto_368193 ?auto_368196 ) ) ( not ( = ?auto_368193 ?auto_368197 ) ) ( not ( = ?auto_368193 ?auto_368198 ) ) ( not ( = ?auto_368193 ?auto_368199 ) ) ( not ( = ?auto_368195 ?auto_368194 ) ) ( not ( = ?auto_368195 ?auto_368196 ) ) ( not ( = ?auto_368195 ?auto_368197 ) ) ( not ( = ?auto_368195 ?auto_368198 ) ) ( not ( = ?auto_368195 ?auto_368199 ) ) ( not ( = ?auto_368194 ?auto_368196 ) ) ( not ( = ?auto_368194 ?auto_368197 ) ) ( not ( = ?auto_368194 ?auto_368198 ) ) ( not ( = ?auto_368194 ?auto_368199 ) ) ( not ( = ?auto_368196 ?auto_368197 ) ) ( not ( = ?auto_368196 ?auto_368198 ) ) ( not ( = ?auto_368196 ?auto_368199 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_368197 ?auto_368198 ?auto_368199 )
      ( MAKE-10CRATE-VERIFY ?auto_368190 ?auto_368191 ?auto_368192 ?auto_368189 ?auto_368193 ?auto_368195 ?auto_368194 ?auto_368196 ?auto_368197 ?auto_368198 ?auto_368199 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_368315 - SURFACE
      ?auto_368316 - SURFACE
      ?auto_368317 - SURFACE
      ?auto_368314 - SURFACE
      ?auto_368318 - SURFACE
      ?auto_368320 - SURFACE
      ?auto_368319 - SURFACE
      ?auto_368321 - SURFACE
      ?auto_368322 - SURFACE
      ?auto_368323 - SURFACE
      ?auto_368324 - SURFACE
    )
    :vars
    (
      ?auto_368325 - HOIST
      ?auto_368327 - PLACE
      ?auto_368329 - TRUCK
      ?auto_368328 - PLACE
      ?auto_368326 - HOIST
      ?auto_368330 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_368325 ?auto_368327 ) ( SURFACE-AT ?auto_368323 ?auto_368327 ) ( CLEAR ?auto_368323 ) ( IS-CRATE ?auto_368324 ) ( not ( = ?auto_368323 ?auto_368324 ) ) ( AVAILABLE ?auto_368325 ) ( ON ?auto_368323 ?auto_368322 ) ( not ( = ?auto_368322 ?auto_368323 ) ) ( not ( = ?auto_368322 ?auto_368324 ) ) ( TRUCK-AT ?auto_368329 ?auto_368328 ) ( not ( = ?auto_368328 ?auto_368327 ) ) ( HOIST-AT ?auto_368326 ?auto_368328 ) ( not ( = ?auto_368325 ?auto_368326 ) ) ( AVAILABLE ?auto_368326 ) ( SURFACE-AT ?auto_368324 ?auto_368328 ) ( ON ?auto_368324 ?auto_368330 ) ( CLEAR ?auto_368324 ) ( not ( = ?auto_368323 ?auto_368330 ) ) ( not ( = ?auto_368324 ?auto_368330 ) ) ( not ( = ?auto_368322 ?auto_368330 ) ) ( ON ?auto_368316 ?auto_368315 ) ( ON ?auto_368317 ?auto_368316 ) ( ON ?auto_368314 ?auto_368317 ) ( ON ?auto_368318 ?auto_368314 ) ( ON ?auto_368320 ?auto_368318 ) ( ON ?auto_368319 ?auto_368320 ) ( ON ?auto_368321 ?auto_368319 ) ( ON ?auto_368322 ?auto_368321 ) ( not ( = ?auto_368315 ?auto_368316 ) ) ( not ( = ?auto_368315 ?auto_368317 ) ) ( not ( = ?auto_368315 ?auto_368314 ) ) ( not ( = ?auto_368315 ?auto_368318 ) ) ( not ( = ?auto_368315 ?auto_368320 ) ) ( not ( = ?auto_368315 ?auto_368319 ) ) ( not ( = ?auto_368315 ?auto_368321 ) ) ( not ( = ?auto_368315 ?auto_368322 ) ) ( not ( = ?auto_368315 ?auto_368323 ) ) ( not ( = ?auto_368315 ?auto_368324 ) ) ( not ( = ?auto_368315 ?auto_368330 ) ) ( not ( = ?auto_368316 ?auto_368317 ) ) ( not ( = ?auto_368316 ?auto_368314 ) ) ( not ( = ?auto_368316 ?auto_368318 ) ) ( not ( = ?auto_368316 ?auto_368320 ) ) ( not ( = ?auto_368316 ?auto_368319 ) ) ( not ( = ?auto_368316 ?auto_368321 ) ) ( not ( = ?auto_368316 ?auto_368322 ) ) ( not ( = ?auto_368316 ?auto_368323 ) ) ( not ( = ?auto_368316 ?auto_368324 ) ) ( not ( = ?auto_368316 ?auto_368330 ) ) ( not ( = ?auto_368317 ?auto_368314 ) ) ( not ( = ?auto_368317 ?auto_368318 ) ) ( not ( = ?auto_368317 ?auto_368320 ) ) ( not ( = ?auto_368317 ?auto_368319 ) ) ( not ( = ?auto_368317 ?auto_368321 ) ) ( not ( = ?auto_368317 ?auto_368322 ) ) ( not ( = ?auto_368317 ?auto_368323 ) ) ( not ( = ?auto_368317 ?auto_368324 ) ) ( not ( = ?auto_368317 ?auto_368330 ) ) ( not ( = ?auto_368314 ?auto_368318 ) ) ( not ( = ?auto_368314 ?auto_368320 ) ) ( not ( = ?auto_368314 ?auto_368319 ) ) ( not ( = ?auto_368314 ?auto_368321 ) ) ( not ( = ?auto_368314 ?auto_368322 ) ) ( not ( = ?auto_368314 ?auto_368323 ) ) ( not ( = ?auto_368314 ?auto_368324 ) ) ( not ( = ?auto_368314 ?auto_368330 ) ) ( not ( = ?auto_368318 ?auto_368320 ) ) ( not ( = ?auto_368318 ?auto_368319 ) ) ( not ( = ?auto_368318 ?auto_368321 ) ) ( not ( = ?auto_368318 ?auto_368322 ) ) ( not ( = ?auto_368318 ?auto_368323 ) ) ( not ( = ?auto_368318 ?auto_368324 ) ) ( not ( = ?auto_368318 ?auto_368330 ) ) ( not ( = ?auto_368320 ?auto_368319 ) ) ( not ( = ?auto_368320 ?auto_368321 ) ) ( not ( = ?auto_368320 ?auto_368322 ) ) ( not ( = ?auto_368320 ?auto_368323 ) ) ( not ( = ?auto_368320 ?auto_368324 ) ) ( not ( = ?auto_368320 ?auto_368330 ) ) ( not ( = ?auto_368319 ?auto_368321 ) ) ( not ( = ?auto_368319 ?auto_368322 ) ) ( not ( = ?auto_368319 ?auto_368323 ) ) ( not ( = ?auto_368319 ?auto_368324 ) ) ( not ( = ?auto_368319 ?auto_368330 ) ) ( not ( = ?auto_368321 ?auto_368322 ) ) ( not ( = ?auto_368321 ?auto_368323 ) ) ( not ( = ?auto_368321 ?auto_368324 ) ) ( not ( = ?auto_368321 ?auto_368330 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_368322 ?auto_368323 ?auto_368324 )
      ( MAKE-10CRATE-VERIFY ?auto_368315 ?auto_368316 ?auto_368317 ?auto_368314 ?auto_368318 ?auto_368320 ?auto_368319 ?auto_368321 ?auto_368322 ?auto_368323 ?auto_368324 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_368441 - SURFACE
      ?auto_368442 - SURFACE
      ?auto_368443 - SURFACE
      ?auto_368440 - SURFACE
      ?auto_368444 - SURFACE
      ?auto_368446 - SURFACE
      ?auto_368445 - SURFACE
      ?auto_368447 - SURFACE
      ?auto_368448 - SURFACE
      ?auto_368449 - SURFACE
      ?auto_368450 - SURFACE
    )
    :vars
    (
      ?auto_368451 - HOIST
      ?auto_368456 - PLACE
      ?auto_368454 - PLACE
      ?auto_368452 - HOIST
      ?auto_368455 - SURFACE
      ?auto_368453 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_368451 ?auto_368456 ) ( SURFACE-AT ?auto_368449 ?auto_368456 ) ( CLEAR ?auto_368449 ) ( IS-CRATE ?auto_368450 ) ( not ( = ?auto_368449 ?auto_368450 ) ) ( AVAILABLE ?auto_368451 ) ( ON ?auto_368449 ?auto_368448 ) ( not ( = ?auto_368448 ?auto_368449 ) ) ( not ( = ?auto_368448 ?auto_368450 ) ) ( not ( = ?auto_368454 ?auto_368456 ) ) ( HOIST-AT ?auto_368452 ?auto_368454 ) ( not ( = ?auto_368451 ?auto_368452 ) ) ( AVAILABLE ?auto_368452 ) ( SURFACE-AT ?auto_368450 ?auto_368454 ) ( ON ?auto_368450 ?auto_368455 ) ( CLEAR ?auto_368450 ) ( not ( = ?auto_368449 ?auto_368455 ) ) ( not ( = ?auto_368450 ?auto_368455 ) ) ( not ( = ?auto_368448 ?auto_368455 ) ) ( TRUCK-AT ?auto_368453 ?auto_368456 ) ( ON ?auto_368442 ?auto_368441 ) ( ON ?auto_368443 ?auto_368442 ) ( ON ?auto_368440 ?auto_368443 ) ( ON ?auto_368444 ?auto_368440 ) ( ON ?auto_368446 ?auto_368444 ) ( ON ?auto_368445 ?auto_368446 ) ( ON ?auto_368447 ?auto_368445 ) ( ON ?auto_368448 ?auto_368447 ) ( not ( = ?auto_368441 ?auto_368442 ) ) ( not ( = ?auto_368441 ?auto_368443 ) ) ( not ( = ?auto_368441 ?auto_368440 ) ) ( not ( = ?auto_368441 ?auto_368444 ) ) ( not ( = ?auto_368441 ?auto_368446 ) ) ( not ( = ?auto_368441 ?auto_368445 ) ) ( not ( = ?auto_368441 ?auto_368447 ) ) ( not ( = ?auto_368441 ?auto_368448 ) ) ( not ( = ?auto_368441 ?auto_368449 ) ) ( not ( = ?auto_368441 ?auto_368450 ) ) ( not ( = ?auto_368441 ?auto_368455 ) ) ( not ( = ?auto_368442 ?auto_368443 ) ) ( not ( = ?auto_368442 ?auto_368440 ) ) ( not ( = ?auto_368442 ?auto_368444 ) ) ( not ( = ?auto_368442 ?auto_368446 ) ) ( not ( = ?auto_368442 ?auto_368445 ) ) ( not ( = ?auto_368442 ?auto_368447 ) ) ( not ( = ?auto_368442 ?auto_368448 ) ) ( not ( = ?auto_368442 ?auto_368449 ) ) ( not ( = ?auto_368442 ?auto_368450 ) ) ( not ( = ?auto_368442 ?auto_368455 ) ) ( not ( = ?auto_368443 ?auto_368440 ) ) ( not ( = ?auto_368443 ?auto_368444 ) ) ( not ( = ?auto_368443 ?auto_368446 ) ) ( not ( = ?auto_368443 ?auto_368445 ) ) ( not ( = ?auto_368443 ?auto_368447 ) ) ( not ( = ?auto_368443 ?auto_368448 ) ) ( not ( = ?auto_368443 ?auto_368449 ) ) ( not ( = ?auto_368443 ?auto_368450 ) ) ( not ( = ?auto_368443 ?auto_368455 ) ) ( not ( = ?auto_368440 ?auto_368444 ) ) ( not ( = ?auto_368440 ?auto_368446 ) ) ( not ( = ?auto_368440 ?auto_368445 ) ) ( not ( = ?auto_368440 ?auto_368447 ) ) ( not ( = ?auto_368440 ?auto_368448 ) ) ( not ( = ?auto_368440 ?auto_368449 ) ) ( not ( = ?auto_368440 ?auto_368450 ) ) ( not ( = ?auto_368440 ?auto_368455 ) ) ( not ( = ?auto_368444 ?auto_368446 ) ) ( not ( = ?auto_368444 ?auto_368445 ) ) ( not ( = ?auto_368444 ?auto_368447 ) ) ( not ( = ?auto_368444 ?auto_368448 ) ) ( not ( = ?auto_368444 ?auto_368449 ) ) ( not ( = ?auto_368444 ?auto_368450 ) ) ( not ( = ?auto_368444 ?auto_368455 ) ) ( not ( = ?auto_368446 ?auto_368445 ) ) ( not ( = ?auto_368446 ?auto_368447 ) ) ( not ( = ?auto_368446 ?auto_368448 ) ) ( not ( = ?auto_368446 ?auto_368449 ) ) ( not ( = ?auto_368446 ?auto_368450 ) ) ( not ( = ?auto_368446 ?auto_368455 ) ) ( not ( = ?auto_368445 ?auto_368447 ) ) ( not ( = ?auto_368445 ?auto_368448 ) ) ( not ( = ?auto_368445 ?auto_368449 ) ) ( not ( = ?auto_368445 ?auto_368450 ) ) ( not ( = ?auto_368445 ?auto_368455 ) ) ( not ( = ?auto_368447 ?auto_368448 ) ) ( not ( = ?auto_368447 ?auto_368449 ) ) ( not ( = ?auto_368447 ?auto_368450 ) ) ( not ( = ?auto_368447 ?auto_368455 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_368448 ?auto_368449 ?auto_368450 )
      ( MAKE-10CRATE-VERIFY ?auto_368441 ?auto_368442 ?auto_368443 ?auto_368440 ?auto_368444 ?auto_368446 ?auto_368445 ?auto_368447 ?auto_368448 ?auto_368449 ?auto_368450 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_368567 - SURFACE
      ?auto_368568 - SURFACE
      ?auto_368569 - SURFACE
      ?auto_368566 - SURFACE
      ?auto_368570 - SURFACE
      ?auto_368572 - SURFACE
      ?auto_368571 - SURFACE
      ?auto_368573 - SURFACE
      ?auto_368574 - SURFACE
      ?auto_368575 - SURFACE
      ?auto_368576 - SURFACE
    )
    :vars
    (
      ?auto_368577 - HOIST
      ?auto_368579 - PLACE
      ?auto_368582 - PLACE
      ?auto_368578 - HOIST
      ?auto_368581 - SURFACE
      ?auto_368580 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_368577 ?auto_368579 ) ( IS-CRATE ?auto_368576 ) ( not ( = ?auto_368575 ?auto_368576 ) ) ( not ( = ?auto_368574 ?auto_368575 ) ) ( not ( = ?auto_368574 ?auto_368576 ) ) ( not ( = ?auto_368582 ?auto_368579 ) ) ( HOIST-AT ?auto_368578 ?auto_368582 ) ( not ( = ?auto_368577 ?auto_368578 ) ) ( AVAILABLE ?auto_368578 ) ( SURFACE-AT ?auto_368576 ?auto_368582 ) ( ON ?auto_368576 ?auto_368581 ) ( CLEAR ?auto_368576 ) ( not ( = ?auto_368575 ?auto_368581 ) ) ( not ( = ?auto_368576 ?auto_368581 ) ) ( not ( = ?auto_368574 ?auto_368581 ) ) ( TRUCK-AT ?auto_368580 ?auto_368579 ) ( SURFACE-AT ?auto_368574 ?auto_368579 ) ( CLEAR ?auto_368574 ) ( LIFTING ?auto_368577 ?auto_368575 ) ( IS-CRATE ?auto_368575 ) ( ON ?auto_368568 ?auto_368567 ) ( ON ?auto_368569 ?auto_368568 ) ( ON ?auto_368566 ?auto_368569 ) ( ON ?auto_368570 ?auto_368566 ) ( ON ?auto_368572 ?auto_368570 ) ( ON ?auto_368571 ?auto_368572 ) ( ON ?auto_368573 ?auto_368571 ) ( ON ?auto_368574 ?auto_368573 ) ( not ( = ?auto_368567 ?auto_368568 ) ) ( not ( = ?auto_368567 ?auto_368569 ) ) ( not ( = ?auto_368567 ?auto_368566 ) ) ( not ( = ?auto_368567 ?auto_368570 ) ) ( not ( = ?auto_368567 ?auto_368572 ) ) ( not ( = ?auto_368567 ?auto_368571 ) ) ( not ( = ?auto_368567 ?auto_368573 ) ) ( not ( = ?auto_368567 ?auto_368574 ) ) ( not ( = ?auto_368567 ?auto_368575 ) ) ( not ( = ?auto_368567 ?auto_368576 ) ) ( not ( = ?auto_368567 ?auto_368581 ) ) ( not ( = ?auto_368568 ?auto_368569 ) ) ( not ( = ?auto_368568 ?auto_368566 ) ) ( not ( = ?auto_368568 ?auto_368570 ) ) ( not ( = ?auto_368568 ?auto_368572 ) ) ( not ( = ?auto_368568 ?auto_368571 ) ) ( not ( = ?auto_368568 ?auto_368573 ) ) ( not ( = ?auto_368568 ?auto_368574 ) ) ( not ( = ?auto_368568 ?auto_368575 ) ) ( not ( = ?auto_368568 ?auto_368576 ) ) ( not ( = ?auto_368568 ?auto_368581 ) ) ( not ( = ?auto_368569 ?auto_368566 ) ) ( not ( = ?auto_368569 ?auto_368570 ) ) ( not ( = ?auto_368569 ?auto_368572 ) ) ( not ( = ?auto_368569 ?auto_368571 ) ) ( not ( = ?auto_368569 ?auto_368573 ) ) ( not ( = ?auto_368569 ?auto_368574 ) ) ( not ( = ?auto_368569 ?auto_368575 ) ) ( not ( = ?auto_368569 ?auto_368576 ) ) ( not ( = ?auto_368569 ?auto_368581 ) ) ( not ( = ?auto_368566 ?auto_368570 ) ) ( not ( = ?auto_368566 ?auto_368572 ) ) ( not ( = ?auto_368566 ?auto_368571 ) ) ( not ( = ?auto_368566 ?auto_368573 ) ) ( not ( = ?auto_368566 ?auto_368574 ) ) ( not ( = ?auto_368566 ?auto_368575 ) ) ( not ( = ?auto_368566 ?auto_368576 ) ) ( not ( = ?auto_368566 ?auto_368581 ) ) ( not ( = ?auto_368570 ?auto_368572 ) ) ( not ( = ?auto_368570 ?auto_368571 ) ) ( not ( = ?auto_368570 ?auto_368573 ) ) ( not ( = ?auto_368570 ?auto_368574 ) ) ( not ( = ?auto_368570 ?auto_368575 ) ) ( not ( = ?auto_368570 ?auto_368576 ) ) ( not ( = ?auto_368570 ?auto_368581 ) ) ( not ( = ?auto_368572 ?auto_368571 ) ) ( not ( = ?auto_368572 ?auto_368573 ) ) ( not ( = ?auto_368572 ?auto_368574 ) ) ( not ( = ?auto_368572 ?auto_368575 ) ) ( not ( = ?auto_368572 ?auto_368576 ) ) ( not ( = ?auto_368572 ?auto_368581 ) ) ( not ( = ?auto_368571 ?auto_368573 ) ) ( not ( = ?auto_368571 ?auto_368574 ) ) ( not ( = ?auto_368571 ?auto_368575 ) ) ( not ( = ?auto_368571 ?auto_368576 ) ) ( not ( = ?auto_368571 ?auto_368581 ) ) ( not ( = ?auto_368573 ?auto_368574 ) ) ( not ( = ?auto_368573 ?auto_368575 ) ) ( not ( = ?auto_368573 ?auto_368576 ) ) ( not ( = ?auto_368573 ?auto_368581 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_368574 ?auto_368575 ?auto_368576 )
      ( MAKE-10CRATE-VERIFY ?auto_368567 ?auto_368568 ?auto_368569 ?auto_368566 ?auto_368570 ?auto_368572 ?auto_368571 ?auto_368573 ?auto_368574 ?auto_368575 ?auto_368576 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_368693 - SURFACE
      ?auto_368694 - SURFACE
      ?auto_368695 - SURFACE
      ?auto_368692 - SURFACE
      ?auto_368696 - SURFACE
      ?auto_368698 - SURFACE
      ?auto_368697 - SURFACE
      ?auto_368699 - SURFACE
      ?auto_368700 - SURFACE
      ?auto_368701 - SURFACE
      ?auto_368702 - SURFACE
    )
    :vars
    (
      ?auto_368703 - HOIST
      ?auto_368704 - PLACE
      ?auto_368707 - PLACE
      ?auto_368708 - HOIST
      ?auto_368705 - SURFACE
      ?auto_368706 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_368703 ?auto_368704 ) ( IS-CRATE ?auto_368702 ) ( not ( = ?auto_368701 ?auto_368702 ) ) ( not ( = ?auto_368700 ?auto_368701 ) ) ( not ( = ?auto_368700 ?auto_368702 ) ) ( not ( = ?auto_368707 ?auto_368704 ) ) ( HOIST-AT ?auto_368708 ?auto_368707 ) ( not ( = ?auto_368703 ?auto_368708 ) ) ( AVAILABLE ?auto_368708 ) ( SURFACE-AT ?auto_368702 ?auto_368707 ) ( ON ?auto_368702 ?auto_368705 ) ( CLEAR ?auto_368702 ) ( not ( = ?auto_368701 ?auto_368705 ) ) ( not ( = ?auto_368702 ?auto_368705 ) ) ( not ( = ?auto_368700 ?auto_368705 ) ) ( TRUCK-AT ?auto_368706 ?auto_368704 ) ( SURFACE-AT ?auto_368700 ?auto_368704 ) ( CLEAR ?auto_368700 ) ( IS-CRATE ?auto_368701 ) ( AVAILABLE ?auto_368703 ) ( IN ?auto_368701 ?auto_368706 ) ( ON ?auto_368694 ?auto_368693 ) ( ON ?auto_368695 ?auto_368694 ) ( ON ?auto_368692 ?auto_368695 ) ( ON ?auto_368696 ?auto_368692 ) ( ON ?auto_368698 ?auto_368696 ) ( ON ?auto_368697 ?auto_368698 ) ( ON ?auto_368699 ?auto_368697 ) ( ON ?auto_368700 ?auto_368699 ) ( not ( = ?auto_368693 ?auto_368694 ) ) ( not ( = ?auto_368693 ?auto_368695 ) ) ( not ( = ?auto_368693 ?auto_368692 ) ) ( not ( = ?auto_368693 ?auto_368696 ) ) ( not ( = ?auto_368693 ?auto_368698 ) ) ( not ( = ?auto_368693 ?auto_368697 ) ) ( not ( = ?auto_368693 ?auto_368699 ) ) ( not ( = ?auto_368693 ?auto_368700 ) ) ( not ( = ?auto_368693 ?auto_368701 ) ) ( not ( = ?auto_368693 ?auto_368702 ) ) ( not ( = ?auto_368693 ?auto_368705 ) ) ( not ( = ?auto_368694 ?auto_368695 ) ) ( not ( = ?auto_368694 ?auto_368692 ) ) ( not ( = ?auto_368694 ?auto_368696 ) ) ( not ( = ?auto_368694 ?auto_368698 ) ) ( not ( = ?auto_368694 ?auto_368697 ) ) ( not ( = ?auto_368694 ?auto_368699 ) ) ( not ( = ?auto_368694 ?auto_368700 ) ) ( not ( = ?auto_368694 ?auto_368701 ) ) ( not ( = ?auto_368694 ?auto_368702 ) ) ( not ( = ?auto_368694 ?auto_368705 ) ) ( not ( = ?auto_368695 ?auto_368692 ) ) ( not ( = ?auto_368695 ?auto_368696 ) ) ( not ( = ?auto_368695 ?auto_368698 ) ) ( not ( = ?auto_368695 ?auto_368697 ) ) ( not ( = ?auto_368695 ?auto_368699 ) ) ( not ( = ?auto_368695 ?auto_368700 ) ) ( not ( = ?auto_368695 ?auto_368701 ) ) ( not ( = ?auto_368695 ?auto_368702 ) ) ( not ( = ?auto_368695 ?auto_368705 ) ) ( not ( = ?auto_368692 ?auto_368696 ) ) ( not ( = ?auto_368692 ?auto_368698 ) ) ( not ( = ?auto_368692 ?auto_368697 ) ) ( not ( = ?auto_368692 ?auto_368699 ) ) ( not ( = ?auto_368692 ?auto_368700 ) ) ( not ( = ?auto_368692 ?auto_368701 ) ) ( not ( = ?auto_368692 ?auto_368702 ) ) ( not ( = ?auto_368692 ?auto_368705 ) ) ( not ( = ?auto_368696 ?auto_368698 ) ) ( not ( = ?auto_368696 ?auto_368697 ) ) ( not ( = ?auto_368696 ?auto_368699 ) ) ( not ( = ?auto_368696 ?auto_368700 ) ) ( not ( = ?auto_368696 ?auto_368701 ) ) ( not ( = ?auto_368696 ?auto_368702 ) ) ( not ( = ?auto_368696 ?auto_368705 ) ) ( not ( = ?auto_368698 ?auto_368697 ) ) ( not ( = ?auto_368698 ?auto_368699 ) ) ( not ( = ?auto_368698 ?auto_368700 ) ) ( not ( = ?auto_368698 ?auto_368701 ) ) ( not ( = ?auto_368698 ?auto_368702 ) ) ( not ( = ?auto_368698 ?auto_368705 ) ) ( not ( = ?auto_368697 ?auto_368699 ) ) ( not ( = ?auto_368697 ?auto_368700 ) ) ( not ( = ?auto_368697 ?auto_368701 ) ) ( not ( = ?auto_368697 ?auto_368702 ) ) ( not ( = ?auto_368697 ?auto_368705 ) ) ( not ( = ?auto_368699 ?auto_368700 ) ) ( not ( = ?auto_368699 ?auto_368701 ) ) ( not ( = ?auto_368699 ?auto_368702 ) ) ( not ( = ?auto_368699 ?auto_368705 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_368700 ?auto_368701 ?auto_368702 )
      ( MAKE-10CRATE-VERIFY ?auto_368693 ?auto_368694 ?auto_368695 ?auto_368692 ?auto_368696 ?auto_368698 ?auto_368697 ?auto_368699 ?auto_368700 ?auto_368701 ?auto_368702 ) )
  )

)

