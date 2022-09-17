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
      ?auto_19052 - SURFACE
      ?auto_19053 - SURFACE
    )
    :vars
    (
      ?auto_19054 - HOIST
      ?auto_19055 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19054 ?auto_19055 ) ( SURFACE-AT ?auto_19053 ?auto_19055 ) ( CLEAR ?auto_19053 ) ( LIFTING ?auto_19054 ?auto_19052 ) ( IS-CRATE ?auto_19052 ) ( not ( = ?auto_19052 ?auto_19053 ) ) )
    :subtasks
    ( ( !DROP ?auto_19054 ?auto_19052 ?auto_19053 ?auto_19055 )
      ( MAKE-ON-VERIFY ?auto_19052 ?auto_19053 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19056 - SURFACE
      ?auto_19057 - SURFACE
    )
    :vars
    (
      ?auto_19058 - HOIST
      ?auto_19059 - PLACE
      ?auto_19060 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19058 ?auto_19059 ) ( SURFACE-AT ?auto_19057 ?auto_19059 ) ( CLEAR ?auto_19057 ) ( IS-CRATE ?auto_19056 ) ( not ( = ?auto_19056 ?auto_19057 ) ) ( TRUCK-AT ?auto_19060 ?auto_19059 ) ( AVAILABLE ?auto_19058 ) ( IN ?auto_19056 ?auto_19060 ) )
    :subtasks
    ( ( !UNLOAD ?auto_19058 ?auto_19056 ?auto_19060 ?auto_19059 )
      ( MAKE-ON ?auto_19056 ?auto_19057 )
      ( MAKE-ON-VERIFY ?auto_19056 ?auto_19057 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19061 - SURFACE
      ?auto_19062 - SURFACE
    )
    :vars
    (
      ?auto_19065 - HOIST
      ?auto_19063 - PLACE
      ?auto_19064 - TRUCK
      ?auto_19066 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19065 ?auto_19063 ) ( SURFACE-AT ?auto_19062 ?auto_19063 ) ( CLEAR ?auto_19062 ) ( IS-CRATE ?auto_19061 ) ( not ( = ?auto_19061 ?auto_19062 ) ) ( AVAILABLE ?auto_19065 ) ( IN ?auto_19061 ?auto_19064 ) ( TRUCK-AT ?auto_19064 ?auto_19066 ) ( not ( = ?auto_19066 ?auto_19063 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19064 ?auto_19066 ?auto_19063 )
      ( MAKE-ON ?auto_19061 ?auto_19062 )
      ( MAKE-ON-VERIFY ?auto_19061 ?auto_19062 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19067 - SURFACE
      ?auto_19068 - SURFACE
    )
    :vars
    (
      ?auto_19069 - HOIST
      ?auto_19072 - PLACE
      ?auto_19070 - TRUCK
      ?auto_19071 - PLACE
      ?auto_19073 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_19069 ?auto_19072 ) ( SURFACE-AT ?auto_19068 ?auto_19072 ) ( CLEAR ?auto_19068 ) ( IS-CRATE ?auto_19067 ) ( not ( = ?auto_19067 ?auto_19068 ) ) ( AVAILABLE ?auto_19069 ) ( TRUCK-AT ?auto_19070 ?auto_19071 ) ( not ( = ?auto_19071 ?auto_19072 ) ) ( HOIST-AT ?auto_19073 ?auto_19071 ) ( LIFTING ?auto_19073 ?auto_19067 ) ( not ( = ?auto_19069 ?auto_19073 ) ) )
    :subtasks
    ( ( !LOAD ?auto_19073 ?auto_19067 ?auto_19070 ?auto_19071 )
      ( MAKE-ON ?auto_19067 ?auto_19068 )
      ( MAKE-ON-VERIFY ?auto_19067 ?auto_19068 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19074 - SURFACE
      ?auto_19075 - SURFACE
    )
    :vars
    (
      ?auto_19077 - HOIST
      ?auto_19079 - PLACE
      ?auto_19076 - TRUCK
      ?auto_19078 - PLACE
      ?auto_19080 - HOIST
      ?auto_19081 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19077 ?auto_19079 ) ( SURFACE-AT ?auto_19075 ?auto_19079 ) ( CLEAR ?auto_19075 ) ( IS-CRATE ?auto_19074 ) ( not ( = ?auto_19074 ?auto_19075 ) ) ( AVAILABLE ?auto_19077 ) ( TRUCK-AT ?auto_19076 ?auto_19078 ) ( not ( = ?auto_19078 ?auto_19079 ) ) ( HOIST-AT ?auto_19080 ?auto_19078 ) ( not ( = ?auto_19077 ?auto_19080 ) ) ( AVAILABLE ?auto_19080 ) ( SURFACE-AT ?auto_19074 ?auto_19078 ) ( ON ?auto_19074 ?auto_19081 ) ( CLEAR ?auto_19074 ) ( not ( = ?auto_19074 ?auto_19081 ) ) ( not ( = ?auto_19075 ?auto_19081 ) ) )
    :subtasks
    ( ( !LIFT ?auto_19080 ?auto_19074 ?auto_19081 ?auto_19078 )
      ( MAKE-ON ?auto_19074 ?auto_19075 )
      ( MAKE-ON-VERIFY ?auto_19074 ?auto_19075 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19082 - SURFACE
      ?auto_19083 - SURFACE
    )
    :vars
    (
      ?auto_19088 - HOIST
      ?auto_19085 - PLACE
      ?auto_19084 - PLACE
      ?auto_19086 - HOIST
      ?auto_19089 - SURFACE
      ?auto_19087 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19088 ?auto_19085 ) ( SURFACE-AT ?auto_19083 ?auto_19085 ) ( CLEAR ?auto_19083 ) ( IS-CRATE ?auto_19082 ) ( not ( = ?auto_19082 ?auto_19083 ) ) ( AVAILABLE ?auto_19088 ) ( not ( = ?auto_19084 ?auto_19085 ) ) ( HOIST-AT ?auto_19086 ?auto_19084 ) ( not ( = ?auto_19088 ?auto_19086 ) ) ( AVAILABLE ?auto_19086 ) ( SURFACE-AT ?auto_19082 ?auto_19084 ) ( ON ?auto_19082 ?auto_19089 ) ( CLEAR ?auto_19082 ) ( not ( = ?auto_19082 ?auto_19089 ) ) ( not ( = ?auto_19083 ?auto_19089 ) ) ( TRUCK-AT ?auto_19087 ?auto_19085 ) )
    :subtasks
    ( ( !DRIVE ?auto_19087 ?auto_19085 ?auto_19084 )
      ( MAKE-ON ?auto_19082 ?auto_19083 )
      ( MAKE-ON-VERIFY ?auto_19082 ?auto_19083 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19130 - SURFACE
      ?auto_19131 - SURFACE
    )
    :vars
    (
      ?auto_19132 - HOIST
      ?auto_19134 - PLACE
      ?auto_19135 - PLACE
      ?auto_19133 - HOIST
      ?auto_19136 - SURFACE
      ?auto_19137 - TRUCK
      ?auto_19138 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19132 ?auto_19134 ) ( IS-CRATE ?auto_19130 ) ( not ( = ?auto_19130 ?auto_19131 ) ) ( not ( = ?auto_19135 ?auto_19134 ) ) ( HOIST-AT ?auto_19133 ?auto_19135 ) ( not ( = ?auto_19132 ?auto_19133 ) ) ( AVAILABLE ?auto_19133 ) ( SURFACE-AT ?auto_19130 ?auto_19135 ) ( ON ?auto_19130 ?auto_19136 ) ( CLEAR ?auto_19130 ) ( not ( = ?auto_19130 ?auto_19136 ) ) ( not ( = ?auto_19131 ?auto_19136 ) ) ( TRUCK-AT ?auto_19137 ?auto_19134 ) ( SURFACE-AT ?auto_19138 ?auto_19134 ) ( CLEAR ?auto_19138 ) ( LIFTING ?auto_19132 ?auto_19131 ) ( IS-CRATE ?auto_19131 ) ( not ( = ?auto_19130 ?auto_19138 ) ) ( not ( = ?auto_19131 ?auto_19138 ) ) ( not ( = ?auto_19136 ?auto_19138 ) ) )
    :subtasks
    ( ( !DROP ?auto_19132 ?auto_19131 ?auto_19138 ?auto_19134 )
      ( MAKE-ON ?auto_19130 ?auto_19131 )
      ( MAKE-ON-VERIFY ?auto_19130 ?auto_19131 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19139 - SURFACE
      ?auto_19140 - SURFACE
    )
    :vars
    (
      ?auto_19146 - HOIST
      ?auto_19144 - PLACE
      ?auto_19145 - PLACE
      ?auto_19142 - HOIST
      ?auto_19141 - SURFACE
      ?auto_19147 - TRUCK
      ?auto_19143 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19146 ?auto_19144 ) ( IS-CRATE ?auto_19139 ) ( not ( = ?auto_19139 ?auto_19140 ) ) ( not ( = ?auto_19145 ?auto_19144 ) ) ( HOIST-AT ?auto_19142 ?auto_19145 ) ( not ( = ?auto_19146 ?auto_19142 ) ) ( AVAILABLE ?auto_19142 ) ( SURFACE-AT ?auto_19139 ?auto_19145 ) ( ON ?auto_19139 ?auto_19141 ) ( CLEAR ?auto_19139 ) ( not ( = ?auto_19139 ?auto_19141 ) ) ( not ( = ?auto_19140 ?auto_19141 ) ) ( TRUCK-AT ?auto_19147 ?auto_19144 ) ( SURFACE-AT ?auto_19143 ?auto_19144 ) ( CLEAR ?auto_19143 ) ( IS-CRATE ?auto_19140 ) ( not ( = ?auto_19139 ?auto_19143 ) ) ( not ( = ?auto_19140 ?auto_19143 ) ) ( not ( = ?auto_19141 ?auto_19143 ) ) ( AVAILABLE ?auto_19146 ) ( IN ?auto_19140 ?auto_19147 ) )
    :subtasks
    ( ( !UNLOAD ?auto_19146 ?auto_19140 ?auto_19147 ?auto_19144 )
      ( MAKE-ON ?auto_19139 ?auto_19140 )
      ( MAKE-ON-VERIFY ?auto_19139 ?auto_19140 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19154 - SURFACE
      ?auto_19155 - SURFACE
    )
    :vars
    (
      ?auto_19156 - HOIST
      ?auto_19161 - PLACE
      ?auto_19159 - PLACE
      ?auto_19158 - HOIST
      ?auto_19157 - SURFACE
      ?auto_19160 - TRUCK
      ?auto_19162 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19156 ?auto_19161 ) ( SURFACE-AT ?auto_19155 ?auto_19161 ) ( CLEAR ?auto_19155 ) ( IS-CRATE ?auto_19154 ) ( not ( = ?auto_19154 ?auto_19155 ) ) ( AVAILABLE ?auto_19156 ) ( not ( = ?auto_19159 ?auto_19161 ) ) ( HOIST-AT ?auto_19158 ?auto_19159 ) ( not ( = ?auto_19156 ?auto_19158 ) ) ( AVAILABLE ?auto_19158 ) ( SURFACE-AT ?auto_19154 ?auto_19159 ) ( ON ?auto_19154 ?auto_19157 ) ( CLEAR ?auto_19154 ) ( not ( = ?auto_19154 ?auto_19157 ) ) ( not ( = ?auto_19155 ?auto_19157 ) ) ( TRUCK-AT ?auto_19160 ?auto_19162 ) ( not ( = ?auto_19162 ?auto_19161 ) ) ( not ( = ?auto_19159 ?auto_19162 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19160 ?auto_19162 ?auto_19161 )
      ( MAKE-ON ?auto_19154 ?auto_19155 )
      ( MAKE-ON-VERIFY ?auto_19154 ?auto_19155 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19557 - SURFACE
      ?auto_19558 - SURFACE
    )
    :vars
    (
      ?auto_19561 - HOIST
      ?auto_19562 - PLACE
      ?auto_19564 - TRUCK
      ?auto_19563 - PLACE
      ?auto_19559 - HOIST
      ?auto_19560 - SURFACE
      ?auto_19565 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19561 ?auto_19562 ) ( SURFACE-AT ?auto_19558 ?auto_19562 ) ( CLEAR ?auto_19558 ) ( IS-CRATE ?auto_19557 ) ( not ( = ?auto_19557 ?auto_19558 ) ) ( AVAILABLE ?auto_19561 ) ( TRUCK-AT ?auto_19564 ?auto_19563 ) ( not ( = ?auto_19563 ?auto_19562 ) ) ( HOIST-AT ?auto_19559 ?auto_19563 ) ( not ( = ?auto_19561 ?auto_19559 ) ) ( SURFACE-AT ?auto_19557 ?auto_19563 ) ( ON ?auto_19557 ?auto_19560 ) ( CLEAR ?auto_19557 ) ( not ( = ?auto_19557 ?auto_19560 ) ) ( not ( = ?auto_19558 ?auto_19560 ) ) ( LIFTING ?auto_19559 ?auto_19565 ) ( IS-CRATE ?auto_19565 ) ( not ( = ?auto_19557 ?auto_19565 ) ) ( not ( = ?auto_19558 ?auto_19565 ) ) ( not ( = ?auto_19560 ?auto_19565 ) ) )
    :subtasks
    ( ( !LOAD ?auto_19559 ?auto_19565 ?auto_19564 ?auto_19563 )
      ( MAKE-ON ?auto_19557 ?auto_19558 )
      ( MAKE-ON-VERIFY ?auto_19557 ?auto_19558 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19697 - SURFACE
      ?auto_19698 - SURFACE
    )
    :vars
    (
      ?auto_19704 - HOIST
      ?auto_19703 - PLACE
      ?auto_19700 - PLACE
      ?auto_19701 - HOIST
      ?auto_19699 - SURFACE
      ?auto_19702 - TRUCK
      ?auto_19705 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19704 ?auto_19703 ) ( SURFACE-AT ?auto_19698 ?auto_19703 ) ( CLEAR ?auto_19698 ) ( IS-CRATE ?auto_19697 ) ( not ( = ?auto_19697 ?auto_19698 ) ) ( not ( = ?auto_19700 ?auto_19703 ) ) ( HOIST-AT ?auto_19701 ?auto_19700 ) ( not ( = ?auto_19704 ?auto_19701 ) ) ( AVAILABLE ?auto_19701 ) ( SURFACE-AT ?auto_19697 ?auto_19700 ) ( ON ?auto_19697 ?auto_19699 ) ( CLEAR ?auto_19697 ) ( not ( = ?auto_19697 ?auto_19699 ) ) ( not ( = ?auto_19698 ?auto_19699 ) ) ( TRUCK-AT ?auto_19702 ?auto_19703 ) ( LIFTING ?auto_19704 ?auto_19705 ) ( IS-CRATE ?auto_19705 ) ( not ( = ?auto_19697 ?auto_19705 ) ) ( not ( = ?auto_19698 ?auto_19705 ) ) ( not ( = ?auto_19699 ?auto_19705 ) ) )
    :subtasks
    ( ( !LOAD ?auto_19704 ?auto_19705 ?auto_19702 ?auto_19703 )
      ( MAKE-ON ?auto_19697 ?auto_19698 )
      ( MAKE-ON-VERIFY ?auto_19697 ?auto_19698 ) )
  )

)

