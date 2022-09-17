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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20021 - SURFACE
      ?auto_20022 - SURFACE
    )
    :vars
    (
      ?auto_20023 - HOIST
      ?auto_20024 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20023 ?auto_20024 ) ( SURFACE-AT ?auto_20021 ?auto_20024 ) ( CLEAR ?auto_20021 ) ( LIFTING ?auto_20023 ?auto_20022 ) ( IS-CRATE ?auto_20022 ) ( not ( = ?auto_20021 ?auto_20022 ) ) )
    :subtasks
    ( ( !DROP ?auto_20023 ?auto_20022 ?auto_20021 ?auto_20024 )
      ( MAKE-1CRATE-VERIFY ?auto_20021 ?auto_20022 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20025 - SURFACE
      ?auto_20026 - SURFACE
    )
    :vars
    (
      ?auto_20028 - HOIST
      ?auto_20027 - PLACE
      ?auto_20029 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20028 ?auto_20027 ) ( SURFACE-AT ?auto_20025 ?auto_20027 ) ( CLEAR ?auto_20025 ) ( IS-CRATE ?auto_20026 ) ( not ( = ?auto_20025 ?auto_20026 ) ) ( TRUCK-AT ?auto_20029 ?auto_20027 ) ( AVAILABLE ?auto_20028 ) ( IN ?auto_20026 ?auto_20029 ) )
    :subtasks
    ( ( !UNLOAD ?auto_20028 ?auto_20026 ?auto_20029 ?auto_20027 )
      ( MAKE-1CRATE ?auto_20025 ?auto_20026 )
      ( MAKE-1CRATE-VERIFY ?auto_20025 ?auto_20026 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20030 - SURFACE
      ?auto_20031 - SURFACE
    )
    :vars
    (
      ?auto_20034 - HOIST
      ?auto_20032 - PLACE
      ?auto_20033 - TRUCK
      ?auto_20035 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20034 ?auto_20032 ) ( SURFACE-AT ?auto_20030 ?auto_20032 ) ( CLEAR ?auto_20030 ) ( IS-CRATE ?auto_20031 ) ( not ( = ?auto_20030 ?auto_20031 ) ) ( AVAILABLE ?auto_20034 ) ( IN ?auto_20031 ?auto_20033 ) ( TRUCK-AT ?auto_20033 ?auto_20035 ) ( not ( = ?auto_20035 ?auto_20032 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20033 ?auto_20035 ?auto_20032 )
      ( MAKE-1CRATE ?auto_20030 ?auto_20031 )
      ( MAKE-1CRATE-VERIFY ?auto_20030 ?auto_20031 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20036 - SURFACE
      ?auto_20037 - SURFACE
    )
    :vars
    (
      ?auto_20039 - HOIST
      ?auto_20040 - PLACE
      ?auto_20041 - TRUCK
      ?auto_20038 - PLACE
      ?auto_20042 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20039 ?auto_20040 ) ( SURFACE-AT ?auto_20036 ?auto_20040 ) ( CLEAR ?auto_20036 ) ( IS-CRATE ?auto_20037 ) ( not ( = ?auto_20036 ?auto_20037 ) ) ( AVAILABLE ?auto_20039 ) ( TRUCK-AT ?auto_20041 ?auto_20038 ) ( not ( = ?auto_20038 ?auto_20040 ) ) ( HOIST-AT ?auto_20042 ?auto_20038 ) ( LIFTING ?auto_20042 ?auto_20037 ) ( not ( = ?auto_20039 ?auto_20042 ) ) )
    :subtasks
    ( ( !LOAD ?auto_20042 ?auto_20037 ?auto_20041 ?auto_20038 )
      ( MAKE-1CRATE ?auto_20036 ?auto_20037 )
      ( MAKE-1CRATE-VERIFY ?auto_20036 ?auto_20037 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20043 - SURFACE
      ?auto_20044 - SURFACE
    )
    :vars
    (
      ?auto_20049 - HOIST
      ?auto_20046 - PLACE
      ?auto_20047 - TRUCK
      ?auto_20045 - PLACE
      ?auto_20048 - HOIST
      ?auto_20050 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20049 ?auto_20046 ) ( SURFACE-AT ?auto_20043 ?auto_20046 ) ( CLEAR ?auto_20043 ) ( IS-CRATE ?auto_20044 ) ( not ( = ?auto_20043 ?auto_20044 ) ) ( AVAILABLE ?auto_20049 ) ( TRUCK-AT ?auto_20047 ?auto_20045 ) ( not ( = ?auto_20045 ?auto_20046 ) ) ( HOIST-AT ?auto_20048 ?auto_20045 ) ( not ( = ?auto_20049 ?auto_20048 ) ) ( AVAILABLE ?auto_20048 ) ( SURFACE-AT ?auto_20044 ?auto_20045 ) ( ON ?auto_20044 ?auto_20050 ) ( CLEAR ?auto_20044 ) ( not ( = ?auto_20043 ?auto_20050 ) ) ( not ( = ?auto_20044 ?auto_20050 ) ) )
    :subtasks
    ( ( !LIFT ?auto_20048 ?auto_20044 ?auto_20050 ?auto_20045 )
      ( MAKE-1CRATE ?auto_20043 ?auto_20044 )
      ( MAKE-1CRATE-VERIFY ?auto_20043 ?auto_20044 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20051 - SURFACE
      ?auto_20052 - SURFACE
    )
    :vars
    (
      ?auto_20058 - HOIST
      ?auto_20055 - PLACE
      ?auto_20057 - PLACE
      ?auto_20054 - HOIST
      ?auto_20053 - SURFACE
      ?auto_20056 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20058 ?auto_20055 ) ( SURFACE-AT ?auto_20051 ?auto_20055 ) ( CLEAR ?auto_20051 ) ( IS-CRATE ?auto_20052 ) ( not ( = ?auto_20051 ?auto_20052 ) ) ( AVAILABLE ?auto_20058 ) ( not ( = ?auto_20057 ?auto_20055 ) ) ( HOIST-AT ?auto_20054 ?auto_20057 ) ( not ( = ?auto_20058 ?auto_20054 ) ) ( AVAILABLE ?auto_20054 ) ( SURFACE-AT ?auto_20052 ?auto_20057 ) ( ON ?auto_20052 ?auto_20053 ) ( CLEAR ?auto_20052 ) ( not ( = ?auto_20051 ?auto_20053 ) ) ( not ( = ?auto_20052 ?auto_20053 ) ) ( TRUCK-AT ?auto_20056 ?auto_20055 ) )
    :subtasks
    ( ( !DRIVE ?auto_20056 ?auto_20055 ?auto_20057 )
      ( MAKE-1CRATE ?auto_20051 ?auto_20052 )
      ( MAKE-1CRATE-VERIFY ?auto_20051 ?auto_20052 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20064 - SURFACE
      ?auto_20065 - SURFACE
    )
    :vars
    (
      ?auto_20066 - HOIST
      ?auto_20067 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20066 ?auto_20067 ) ( SURFACE-AT ?auto_20064 ?auto_20067 ) ( CLEAR ?auto_20064 ) ( LIFTING ?auto_20066 ?auto_20065 ) ( IS-CRATE ?auto_20065 ) ( not ( = ?auto_20064 ?auto_20065 ) ) )
    :subtasks
    ( ( !DROP ?auto_20066 ?auto_20065 ?auto_20064 ?auto_20067 )
      ( MAKE-1CRATE-VERIFY ?auto_20064 ?auto_20065 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20068 - SURFACE
      ?auto_20069 - SURFACE
      ?auto_20070 - SURFACE
    )
    :vars
    (
      ?auto_20072 - HOIST
      ?auto_20071 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20072 ?auto_20071 ) ( SURFACE-AT ?auto_20069 ?auto_20071 ) ( CLEAR ?auto_20069 ) ( LIFTING ?auto_20072 ?auto_20070 ) ( IS-CRATE ?auto_20070 ) ( not ( = ?auto_20069 ?auto_20070 ) ) ( ON ?auto_20069 ?auto_20068 ) ( not ( = ?auto_20068 ?auto_20069 ) ) ( not ( = ?auto_20068 ?auto_20070 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20069 ?auto_20070 )
      ( MAKE-2CRATE-VERIFY ?auto_20068 ?auto_20069 ?auto_20070 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20073 - SURFACE
      ?auto_20074 - SURFACE
    )
    :vars
    (
      ?auto_20076 - HOIST
      ?auto_20075 - PLACE
      ?auto_20077 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20076 ?auto_20075 ) ( SURFACE-AT ?auto_20073 ?auto_20075 ) ( CLEAR ?auto_20073 ) ( IS-CRATE ?auto_20074 ) ( not ( = ?auto_20073 ?auto_20074 ) ) ( TRUCK-AT ?auto_20077 ?auto_20075 ) ( AVAILABLE ?auto_20076 ) ( IN ?auto_20074 ?auto_20077 ) )
    :subtasks
    ( ( !UNLOAD ?auto_20076 ?auto_20074 ?auto_20077 ?auto_20075 )
      ( MAKE-1CRATE ?auto_20073 ?auto_20074 )
      ( MAKE-1CRATE-VERIFY ?auto_20073 ?auto_20074 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20078 - SURFACE
      ?auto_20079 - SURFACE
      ?auto_20080 - SURFACE
    )
    :vars
    (
      ?auto_20081 - HOIST
      ?auto_20083 - PLACE
      ?auto_20082 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20081 ?auto_20083 ) ( SURFACE-AT ?auto_20079 ?auto_20083 ) ( CLEAR ?auto_20079 ) ( IS-CRATE ?auto_20080 ) ( not ( = ?auto_20079 ?auto_20080 ) ) ( TRUCK-AT ?auto_20082 ?auto_20083 ) ( AVAILABLE ?auto_20081 ) ( IN ?auto_20080 ?auto_20082 ) ( ON ?auto_20079 ?auto_20078 ) ( not ( = ?auto_20078 ?auto_20079 ) ) ( not ( = ?auto_20078 ?auto_20080 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20079 ?auto_20080 )
      ( MAKE-2CRATE-VERIFY ?auto_20078 ?auto_20079 ?auto_20080 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20084 - SURFACE
      ?auto_20085 - SURFACE
    )
    :vars
    (
      ?auto_20086 - HOIST
      ?auto_20087 - PLACE
      ?auto_20088 - TRUCK
      ?auto_20089 - SURFACE
      ?auto_20090 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20086 ?auto_20087 ) ( SURFACE-AT ?auto_20084 ?auto_20087 ) ( CLEAR ?auto_20084 ) ( IS-CRATE ?auto_20085 ) ( not ( = ?auto_20084 ?auto_20085 ) ) ( AVAILABLE ?auto_20086 ) ( IN ?auto_20085 ?auto_20088 ) ( ON ?auto_20084 ?auto_20089 ) ( not ( = ?auto_20089 ?auto_20084 ) ) ( not ( = ?auto_20089 ?auto_20085 ) ) ( TRUCK-AT ?auto_20088 ?auto_20090 ) ( not ( = ?auto_20090 ?auto_20087 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20088 ?auto_20090 ?auto_20087 )
      ( MAKE-2CRATE ?auto_20089 ?auto_20084 ?auto_20085 )
      ( MAKE-1CRATE-VERIFY ?auto_20084 ?auto_20085 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20091 - SURFACE
      ?auto_20092 - SURFACE
      ?auto_20093 - SURFACE
    )
    :vars
    (
      ?auto_20097 - HOIST
      ?auto_20094 - PLACE
      ?auto_20095 - TRUCK
      ?auto_20096 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20097 ?auto_20094 ) ( SURFACE-AT ?auto_20092 ?auto_20094 ) ( CLEAR ?auto_20092 ) ( IS-CRATE ?auto_20093 ) ( not ( = ?auto_20092 ?auto_20093 ) ) ( AVAILABLE ?auto_20097 ) ( IN ?auto_20093 ?auto_20095 ) ( ON ?auto_20092 ?auto_20091 ) ( not ( = ?auto_20091 ?auto_20092 ) ) ( not ( = ?auto_20091 ?auto_20093 ) ) ( TRUCK-AT ?auto_20095 ?auto_20096 ) ( not ( = ?auto_20096 ?auto_20094 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20092 ?auto_20093 )
      ( MAKE-2CRATE-VERIFY ?auto_20091 ?auto_20092 ?auto_20093 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20098 - SURFACE
      ?auto_20099 - SURFACE
    )
    :vars
    (
      ?auto_20102 - HOIST
      ?auto_20103 - PLACE
      ?auto_20101 - SURFACE
      ?auto_20104 - TRUCK
      ?auto_20100 - PLACE
      ?auto_20105 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20102 ?auto_20103 ) ( SURFACE-AT ?auto_20098 ?auto_20103 ) ( CLEAR ?auto_20098 ) ( IS-CRATE ?auto_20099 ) ( not ( = ?auto_20098 ?auto_20099 ) ) ( AVAILABLE ?auto_20102 ) ( ON ?auto_20098 ?auto_20101 ) ( not ( = ?auto_20101 ?auto_20098 ) ) ( not ( = ?auto_20101 ?auto_20099 ) ) ( TRUCK-AT ?auto_20104 ?auto_20100 ) ( not ( = ?auto_20100 ?auto_20103 ) ) ( HOIST-AT ?auto_20105 ?auto_20100 ) ( LIFTING ?auto_20105 ?auto_20099 ) ( not ( = ?auto_20102 ?auto_20105 ) ) )
    :subtasks
    ( ( !LOAD ?auto_20105 ?auto_20099 ?auto_20104 ?auto_20100 )
      ( MAKE-2CRATE ?auto_20101 ?auto_20098 ?auto_20099 )
      ( MAKE-1CRATE-VERIFY ?auto_20098 ?auto_20099 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20106 - SURFACE
      ?auto_20107 - SURFACE
      ?auto_20108 - SURFACE
    )
    :vars
    (
      ?auto_20110 - HOIST
      ?auto_20113 - PLACE
      ?auto_20111 - TRUCK
      ?auto_20112 - PLACE
      ?auto_20109 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20110 ?auto_20113 ) ( SURFACE-AT ?auto_20107 ?auto_20113 ) ( CLEAR ?auto_20107 ) ( IS-CRATE ?auto_20108 ) ( not ( = ?auto_20107 ?auto_20108 ) ) ( AVAILABLE ?auto_20110 ) ( ON ?auto_20107 ?auto_20106 ) ( not ( = ?auto_20106 ?auto_20107 ) ) ( not ( = ?auto_20106 ?auto_20108 ) ) ( TRUCK-AT ?auto_20111 ?auto_20112 ) ( not ( = ?auto_20112 ?auto_20113 ) ) ( HOIST-AT ?auto_20109 ?auto_20112 ) ( LIFTING ?auto_20109 ?auto_20108 ) ( not ( = ?auto_20110 ?auto_20109 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20107 ?auto_20108 )
      ( MAKE-2CRATE-VERIFY ?auto_20106 ?auto_20107 ?auto_20108 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20114 - SURFACE
      ?auto_20115 - SURFACE
    )
    :vars
    (
      ?auto_20121 - HOIST
      ?auto_20118 - PLACE
      ?auto_20120 - SURFACE
      ?auto_20119 - TRUCK
      ?auto_20116 - PLACE
      ?auto_20117 - HOIST
      ?auto_20122 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20121 ?auto_20118 ) ( SURFACE-AT ?auto_20114 ?auto_20118 ) ( CLEAR ?auto_20114 ) ( IS-CRATE ?auto_20115 ) ( not ( = ?auto_20114 ?auto_20115 ) ) ( AVAILABLE ?auto_20121 ) ( ON ?auto_20114 ?auto_20120 ) ( not ( = ?auto_20120 ?auto_20114 ) ) ( not ( = ?auto_20120 ?auto_20115 ) ) ( TRUCK-AT ?auto_20119 ?auto_20116 ) ( not ( = ?auto_20116 ?auto_20118 ) ) ( HOIST-AT ?auto_20117 ?auto_20116 ) ( not ( = ?auto_20121 ?auto_20117 ) ) ( AVAILABLE ?auto_20117 ) ( SURFACE-AT ?auto_20115 ?auto_20116 ) ( ON ?auto_20115 ?auto_20122 ) ( CLEAR ?auto_20115 ) ( not ( = ?auto_20114 ?auto_20122 ) ) ( not ( = ?auto_20115 ?auto_20122 ) ) ( not ( = ?auto_20120 ?auto_20122 ) ) )
    :subtasks
    ( ( !LIFT ?auto_20117 ?auto_20115 ?auto_20122 ?auto_20116 )
      ( MAKE-2CRATE ?auto_20120 ?auto_20114 ?auto_20115 )
      ( MAKE-1CRATE-VERIFY ?auto_20114 ?auto_20115 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20123 - SURFACE
      ?auto_20124 - SURFACE
      ?auto_20125 - SURFACE
    )
    :vars
    (
      ?auto_20129 - HOIST
      ?auto_20131 - PLACE
      ?auto_20128 - TRUCK
      ?auto_20130 - PLACE
      ?auto_20126 - HOIST
      ?auto_20127 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20129 ?auto_20131 ) ( SURFACE-AT ?auto_20124 ?auto_20131 ) ( CLEAR ?auto_20124 ) ( IS-CRATE ?auto_20125 ) ( not ( = ?auto_20124 ?auto_20125 ) ) ( AVAILABLE ?auto_20129 ) ( ON ?auto_20124 ?auto_20123 ) ( not ( = ?auto_20123 ?auto_20124 ) ) ( not ( = ?auto_20123 ?auto_20125 ) ) ( TRUCK-AT ?auto_20128 ?auto_20130 ) ( not ( = ?auto_20130 ?auto_20131 ) ) ( HOIST-AT ?auto_20126 ?auto_20130 ) ( not ( = ?auto_20129 ?auto_20126 ) ) ( AVAILABLE ?auto_20126 ) ( SURFACE-AT ?auto_20125 ?auto_20130 ) ( ON ?auto_20125 ?auto_20127 ) ( CLEAR ?auto_20125 ) ( not ( = ?auto_20124 ?auto_20127 ) ) ( not ( = ?auto_20125 ?auto_20127 ) ) ( not ( = ?auto_20123 ?auto_20127 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20124 ?auto_20125 )
      ( MAKE-2CRATE-VERIFY ?auto_20123 ?auto_20124 ?auto_20125 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20132 - SURFACE
      ?auto_20133 - SURFACE
    )
    :vars
    (
      ?auto_20140 - HOIST
      ?auto_20139 - PLACE
      ?auto_20134 - SURFACE
      ?auto_20135 - PLACE
      ?auto_20136 - HOIST
      ?auto_20137 - SURFACE
      ?auto_20138 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20140 ?auto_20139 ) ( SURFACE-AT ?auto_20132 ?auto_20139 ) ( CLEAR ?auto_20132 ) ( IS-CRATE ?auto_20133 ) ( not ( = ?auto_20132 ?auto_20133 ) ) ( AVAILABLE ?auto_20140 ) ( ON ?auto_20132 ?auto_20134 ) ( not ( = ?auto_20134 ?auto_20132 ) ) ( not ( = ?auto_20134 ?auto_20133 ) ) ( not ( = ?auto_20135 ?auto_20139 ) ) ( HOIST-AT ?auto_20136 ?auto_20135 ) ( not ( = ?auto_20140 ?auto_20136 ) ) ( AVAILABLE ?auto_20136 ) ( SURFACE-AT ?auto_20133 ?auto_20135 ) ( ON ?auto_20133 ?auto_20137 ) ( CLEAR ?auto_20133 ) ( not ( = ?auto_20132 ?auto_20137 ) ) ( not ( = ?auto_20133 ?auto_20137 ) ) ( not ( = ?auto_20134 ?auto_20137 ) ) ( TRUCK-AT ?auto_20138 ?auto_20139 ) )
    :subtasks
    ( ( !DRIVE ?auto_20138 ?auto_20139 ?auto_20135 )
      ( MAKE-2CRATE ?auto_20134 ?auto_20132 ?auto_20133 )
      ( MAKE-1CRATE-VERIFY ?auto_20132 ?auto_20133 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20141 - SURFACE
      ?auto_20142 - SURFACE
      ?auto_20143 - SURFACE
    )
    :vars
    (
      ?auto_20149 - HOIST
      ?auto_20148 - PLACE
      ?auto_20147 - PLACE
      ?auto_20145 - HOIST
      ?auto_20146 - SURFACE
      ?auto_20144 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20149 ?auto_20148 ) ( SURFACE-AT ?auto_20142 ?auto_20148 ) ( CLEAR ?auto_20142 ) ( IS-CRATE ?auto_20143 ) ( not ( = ?auto_20142 ?auto_20143 ) ) ( AVAILABLE ?auto_20149 ) ( ON ?auto_20142 ?auto_20141 ) ( not ( = ?auto_20141 ?auto_20142 ) ) ( not ( = ?auto_20141 ?auto_20143 ) ) ( not ( = ?auto_20147 ?auto_20148 ) ) ( HOIST-AT ?auto_20145 ?auto_20147 ) ( not ( = ?auto_20149 ?auto_20145 ) ) ( AVAILABLE ?auto_20145 ) ( SURFACE-AT ?auto_20143 ?auto_20147 ) ( ON ?auto_20143 ?auto_20146 ) ( CLEAR ?auto_20143 ) ( not ( = ?auto_20142 ?auto_20146 ) ) ( not ( = ?auto_20143 ?auto_20146 ) ) ( not ( = ?auto_20141 ?auto_20146 ) ) ( TRUCK-AT ?auto_20144 ?auto_20148 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20142 ?auto_20143 )
      ( MAKE-2CRATE-VERIFY ?auto_20141 ?auto_20142 ?auto_20143 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20150 - SURFACE
      ?auto_20151 - SURFACE
    )
    :vars
    (
      ?auto_20153 - HOIST
      ?auto_20156 - PLACE
      ?auto_20152 - SURFACE
      ?auto_20158 - PLACE
      ?auto_20154 - HOIST
      ?auto_20157 - SURFACE
      ?auto_20155 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20153 ?auto_20156 ) ( IS-CRATE ?auto_20151 ) ( not ( = ?auto_20150 ?auto_20151 ) ) ( not ( = ?auto_20152 ?auto_20150 ) ) ( not ( = ?auto_20152 ?auto_20151 ) ) ( not ( = ?auto_20158 ?auto_20156 ) ) ( HOIST-AT ?auto_20154 ?auto_20158 ) ( not ( = ?auto_20153 ?auto_20154 ) ) ( AVAILABLE ?auto_20154 ) ( SURFACE-AT ?auto_20151 ?auto_20158 ) ( ON ?auto_20151 ?auto_20157 ) ( CLEAR ?auto_20151 ) ( not ( = ?auto_20150 ?auto_20157 ) ) ( not ( = ?auto_20151 ?auto_20157 ) ) ( not ( = ?auto_20152 ?auto_20157 ) ) ( TRUCK-AT ?auto_20155 ?auto_20156 ) ( SURFACE-AT ?auto_20152 ?auto_20156 ) ( CLEAR ?auto_20152 ) ( LIFTING ?auto_20153 ?auto_20150 ) ( IS-CRATE ?auto_20150 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20152 ?auto_20150 )
      ( MAKE-2CRATE ?auto_20152 ?auto_20150 ?auto_20151 )
      ( MAKE-1CRATE-VERIFY ?auto_20150 ?auto_20151 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20159 - SURFACE
      ?auto_20160 - SURFACE
      ?auto_20161 - SURFACE
    )
    :vars
    (
      ?auto_20164 - HOIST
      ?auto_20166 - PLACE
      ?auto_20167 - PLACE
      ?auto_20163 - HOIST
      ?auto_20162 - SURFACE
      ?auto_20165 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20164 ?auto_20166 ) ( IS-CRATE ?auto_20161 ) ( not ( = ?auto_20160 ?auto_20161 ) ) ( not ( = ?auto_20159 ?auto_20160 ) ) ( not ( = ?auto_20159 ?auto_20161 ) ) ( not ( = ?auto_20167 ?auto_20166 ) ) ( HOIST-AT ?auto_20163 ?auto_20167 ) ( not ( = ?auto_20164 ?auto_20163 ) ) ( AVAILABLE ?auto_20163 ) ( SURFACE-AT ?auto_20161 ?auto_20167 ) ( ON ?auto_20161 ?auto_20162 ) ( CLEAR ?auto_20161 ) ( not ( = ?auto_20160 ?auto_20162 ) ) ( not ( = ?auto_20161 ?auto_20162 ) ) ( not ( = ?auto_20159 ?auto_20162 ) ) ( TRUCK-AT ?auto_20165 ?auto_20166 ) ( SURFACE-AT ?auto_20159 ?auto_20166 ) ( CLEAR ?auto_20159 ) ( LIFTING ?auto_20164 ?auto_20160 ) ( IS-CRATE ?auto_20160 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20160 ?auto_20161 )
      ( MAKE-2CRATE-VERIFY ?auto_20159 ?auto_20160 ?auto_20161 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20168 - SURFACE
      ?auto_20169 - SURFACE
    )
    :vars
    (
      ?auto_20174 - HOIST
      ?auto_20175 - PLACE
      ?auto_20176 - SURFACE
      ?auto_20171 - PLACE
      ?auto_20172 - HOIST
      ?auto_20173 - SURFACE
      ?auto_20170 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20174 ?auto_20175 ) ( IS-CRATE ?auto_20169 ) ( not ( = ?auto_20168 ?auto_20169 ) ) ( not ( = ?auto_20176 ?auto_20168 ) ) ( not ( = ?auto_20176 ?auto_20169 ) ) ( not ( = ?auto_20171 ?auto_20175 ) ) ( HOIST-AT ?auto_20172 ?auto_20171 ) ( not ( = ?auto_20174 ?auto_20172 ) ) ( AVAILABLE ?auto_20172 ) ( SURFACE-AT ?auto_20169 ?auto_20171 ) ( ON ?auto_20169 ?auto_20173 ) ( CLEAR ?auto_20169 ) ( not ( = ?auto_20168 ?auto_20173 ) ) ( not ( = ?auto_20169 ?auto_20173 ) ) ( not ( = ?auto_20176 ?auto_20173 ) ) ( TRUCK-AT ?auto_20170 ?auto_20175 ) ( SURFACE-AT ?auto_20176 ?auto_20175 ) ( CLEAR ?auto_20176 ) ( IS-CRATE ?auto_20168 ) ( AVAILABLE ?auto_20174 ) ( IN ?auto_20168 ?auto_20170 ) )
    :subtasks
    ( ( !UNLOAD ?auto_20174 ?auto_20168 ?auto_20170 ?auto_20175 )
      ( MAKE-2CRATE ?auto_20176 ?auto_20168 ?auto_20169 )
      ( MAKE-1CRATE-VERIFY ?auto_20168 ?auto_20169 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20177 - SURFACE
      ?auto_20178 - SURFACE
      ?auto_20179 - SURFACE
    )
    :vars
    (
      ?auto_20183 - HOIST
      ?auto_20180 - PLACE
      ?auto_20182 - PLACE
      ?auto_20184 - HOIST
      ?auto_20185 - SURFACE
      ?auto_20181 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20183 ?auto_20180 ) ( IS-CRATE ?auto_20179 ) ( not ( = ?auto_20178 ?auto_20179 ) ) ( not ( = ?auto_20177 ?auto_20178 ) ) ( not ( = ?auto_20177 ?auto_20179 ) ) ( not ( = ?auto_20182 ?auto_20180 ) ) ( HOIST-AT ?auto_20184 ?auto_20182 ) ( not ( = ?auto_20183 ?auto_20184 ) ) ( AVAILABLE ?auto_20184 ) ( SURFACE-AT ?auto_20179 ?auto_20182 ) ( ON ?auto_20179 ?auto_20185 ) ( CLEAR ?auto_20179 ) ( not ( = ?auto_20178 ?auto_20185 ) ) ( not ( = ?auto_20179 ?auto_20185 ) ) ( not ( = ?auto_20177 ?auto_20185 ) ) ( TRUCK-AT ?auto_20181 ?auto_20180 ) ( SURFACE-AT ?auto_20177 ?auto_20180 ) ( CLEAR ?auto_20177 ) ( IS-CRATE ?auto_20178 ) ( AVAILABLE ?auto_20183 ) ( IN ?auto_20178 ?auto_20181 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20178 ?auto_20179 )
      ( MAKE-2CRATE-VERIFY ?auto_20177 ?auto_20178 ?auto_20179 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20186 - SURFACE
      ?auto_20187 - SURFACE
    )
    :vars
    (
      ?auto_20189 - HOIST
      ?auto_20192 - PLACE
      ?auto_20188 - SURFACE
      ?auto_20193 - PLACE
      ?auto_20191 - HOIST
      ?auto_20190 - SURFACE
      ?auto_20194 - TRUCK
      ?auto_20195 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20189 ?auto_20192 ) ( IS-CRATE ?auto_20187 ) ( not ( = ?auto_20186 ?auto_20187 ) ) ( not ( = ?auto_20188 ?auto_20186 ) ) ( not ( = ?auto_20188 ?auto_20187 ) ) ( not ( = ?auto_20193 ?auto_20192 ) ) ( HOIST-AT ?auto_20191 ?auto_20193 ) ( not ( = ?auto_20189 ?auto_20191 ) ) ( AVAILABLE ?auto_20191 ) ( SURFACE-AT ?auto_20187 ?auto_20193 ) ( ON ?auto_20187 ?auto_20190 ) ( CLEAR ?auto_20187 ) ( not ( = ?auto_20186 ?auto_20190 ) ) ( not ( = ?auto_20187 ?auto_20190 ) ) ( not ( = ?auto_20188 ?auto_20190 ) ) ( SURFACE-AT ?auto_20188 ?auto_20192 ) ( CLEAR ?auto_20188 ) ( IS-CRATE ?auto_20186 ) ( AVAILABLE ?auto_20189 ) ( IN ?auto_20186 ?auto_20194 ) ( TRUCK-AT ?auto_20194 ?auto_20195 ) ( not ( = ?auto_20195 ?auto_20192 ) ) ( not ( = ?auto_20193 ?auto_20195 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20194 ?auto_20195 ?auto_20192 )
      ( MAKE-2CRATE ?auto_20188 ?auto_20186 ?auto_20187 )
      ( MAKE-1CRATE-VERIFY ?auto_20186 ?auto_20187 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20196 - SURFACE
      ?auto_20197 - SURFACE
      ?auto_20198 - SURFACE
    )
    :vars
    (
      ?auto_20203 - HOIST
      ?auto_20204 - PLACE
      ?auto_20200 - PLACE
      ?auto_20202 - HOIST
      ?auto_20201 - SURFACE
      ?auto_20199 - TRUCK
      ?auto_20205 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20203 ?auto_20204 ) ( IS-CRATE ?auto_20198 ) ( not ( = ?auto_20197 ?auto_20198 ) ) ( not ( = ?auto_20196 ?auto_20197 ) ) ( not ( = ?auto_20196 ?auto_20198 ) ) ( not ( = ?auto_20200 ?auto_20204 ) ) ( HOIST-AT ?auto_20202 ?auto_20200 ) ( not ( = ?auto_20203 ?auto_20202 ) ) ( AVAILABLE ?auto_20202 ) ( SURFACE-AT ?auto_20198 ?auto_20200 ) ( ON ?auto_20198 ?auto_20201 ) ( CLEAR ?auto_20198 ) ( not ( = ?auto_20197 ?auto_20201 ) ) ( not ( = ?auto_20198 ?auto_20201 ) ) ( not ( = ?auto_20196 ?auto_20201 ) ) ( SURFACE-AT ?auto_20196 ?auto_20204 ) ( CLEAR ?auto_20196 ) ( IS-CRATE ?auto_20197 ) ( AVAILABLE ?auto_20203 ) ( IN ?auto_20197 ?auto_20199 ) ( TRUCK-AT ?auto_20199 ?auto_20205 ) ( not ( = ?auto_20205 ?auto_20204 ) ) ( not ( = ?auto_20200 ?auto_20205 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20197 ?auto_20198 )
      ( MAKE-2CRATE-VERIFY ?auto_20196 ?auto_20197 ?auto_20198 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20206 - SURFACE
      ?auto_20207 - SURFACE
    )
    :vars
    (
      ?auto_20214 - HOIST
      ?auto_20208 - PLACE
      ?auto_20215 - SURFACE
      ?auto_20213 - PLACE
      ?auto_20209 - HOIST
      ?auto_20211 - SURFACE
      ?auto_20212 - TRUCK
      ?auto_20210 - PLACE
      ?auto_20216 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20214 ?auto_20208 ) ( IS-CRATE ?auto_20207 ) ( not ( = ?auto_20206 ?auto_20207 ) ) ( not ( = ?auto_20215 ?auto_20206 ) ) ( not ( = ?auto_20215 ?auto_20207 ) ) ( not ( = ?auto_20213 ?auto_20208 ) ) ( HOIST-AT ?auto_20209 ?auto_20213 ) ( not ( = ?auto_20214 ?auto_20209 ) ) ( AVAILABLE ?auto_20209 ) ( SURFACE-AT ?auto_20207 ?auto_20213 ) ( ON ?auto_20207 ?auto_20211 ) ( CLEAR ?auto_20207 ) ( not ( = ?auto_20206 ?auto_20211 ) ) ( not ( = ?auto_20207 ?auto_20211 ) ) ( not ( = ?auto_20215 ?auto_20211 ) ) ( SURFACE-AT ?auto_20215 ?auto_20208 ) ( CLEAR ?auto_20215 ) ( IS-CRATE ?auto_20206 ) ( AVAILABLE ?auto_20214 ) ( TRUCK-AT ?auto_20212 ?auto_20210 ) ( not ( = ?auto_20210 ?auto_20208 ) ) ( not ( = ?auto_20213 ?auto_20210 ) ) ( HOIST-AT ?auto_20216 ?auto_20210 ) ( LIFTING ?auto_20216 ?auto_20206 ) ( not ( = ?auto_20214 ?auto_20216 ) ) ( not ( = ?auto_20209 ?auto_20216 ) ) )
    :subtasks
    ( ( !LOAD ?auto_20216 ?auto_20206 ?auto_20212 ?auto_20210 )
      ( MAKE-2CRATE ?auto_20215 ?auto_20206 ?auto_20207 )
      ( MAKE-1CRATE-VERIFY ?auto_20206 ?auto_20207 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20217 - SURFACE
      ?auto_20218 - SURFACE
      ?auto_20219 - SURFACE
    )
    :vars
    (
      ?auto_20225 - HOIST
      ?auto_20224 - PLACE
      ?auto_20227 - PLACE
      ?auto_20221 - HOIST
      ?auto_20226 - SURFACE
      ?auto_20222 - TRUCK
      ?auto_20223 - PLACE
      ?auto_20220 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20225 ?auto_20224 ) ( IS-CRATE ?auto_20219 ) ( not ( = ?auto_20218 ?auto_20219 ) ) ( not ( = ?auto_20217 ?auto_20218 ) ) ( not ( = ?auto_20217 ?auto_20219 ) ) ( not ( = ?auto_20227 ?auto_20224 ) ) ( HOIST-AT ?auto_20221 ?auto_20227 ) ( not ( = ?auto_20225 ?auto_20221 ) ) ( AVAILABLE ?auto_20221 ) ( SURFACE-AT ?auto_20219 ?auto_20227 ) ( ON ?auto_20219 ?auto_20226 ) ( CLEAR ?auto_20219 ) ( not ( = ?auto_20218 ?auto_20226 ) ) ( not ( = ?auto_20219 ?auto_20226 ) ) ( not ( = ?auto_20217 ?auto_20226 ) ) ( SURFACE-AT ?auto_20217 ?auto_20224 ) ( CLEAR ?auto_20217 ) ( IS-CRATE ?auto_20218 ) ( AVAILABLE ?auto_20225 ) ( TRUCK-AT ?auto_20222 ?auto_20223 ) ( not ( = ?auto_20223 ?auto_20224 ) ) ( not ( = ?auto_20227 ?auto_20223 ) ) ( HOIST-AT ?auto_20220 ?auto_20223 ) ( LIFTING ?auto_20220 ?auto_20218 ) ( not ( = ?auto_20225 ?auto_20220 ) ) ( not ( = ?auto_20221 ?auto_20220 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20218 ?auto_20219 )
      ( MAKE-2CRATE-VERIFY ?auto_20217 ?auto_20218 ?auto_20219 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20228 - SURFACE
      ?auto_20229 - SURFACE
    )
    :vars
    (
      ?auto_20237 - HOIST
      ?auto_20235 - PLACE
      ?auto_20234 - SURFACE
      ?auto_20230 - PLACE
      ?auto_20236 - HOIST
      ?auto_20232 - SURFACE
      ?auto_20231 - TRUCK
      ?auto_20233 - PLACE
      ?auto_20238 - HOIST
      ?auto_20239 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20237 ?auto_20235 ) ( IS-CRATE ?auto_20229 ) ( not ( = ?auto_20228 ?auto_20229 ) ) ( not ( = ?auto_20234 ?auto_20228 ) ) ( not ( = ?auto_20234 ?auto_20229 ) ) ( not ( = ?auto_20230 ?auto_20235 ) ) ( HOIST-AT ?auto_20236 ?auto_20230 ) ( not ( = ?auto_20237 ?auto_20236 ) ) ( AVAILABLE ?auto_20236 ) ( SURFACE-AT ?auto_20229 ?auto_20230 ) ( ON ?auto_20229 ?auto_20232 ) ( CLEAR ?auto_20229 ) ( not ( = ?auto_20228 ?auto_20232 ) ) ( not ( = ?auto_20229 ?auto_20232 ) ) ( not ( = ?auto_20234 ?auto_20232 ) ) ( SURFACE-AT ?auto_20234 ?auto_20235 ) ( CLEAR ?auto_20234 ) ( IS-CRATE ?auto_20228 ) ( AVAILABLE ?auto_20237 ) ( TRUCK-AT ?auto_20231 ?auto_20233 ) ( not ( = ?auto_20233 ?auto_20235 ) ) ( not ( = ?auto_20230 ?auto_20233 ) ) ( HOIST-AT ?auto_20238 ?auto_20233 ) ( not ( = ?auto_20237 ?auto_20238 ) ) ( not ( = ?auto_20236 ?auto_20238 ) ) ( AVAILABLE ?auto_20238 ) ( SURFACE-AT ?auto_20228 ?auto_20233 ) ( ON ?auto_20228 ?auto_20239 ) ( CLEAR ?auto_20228 ) ( not ( = ?auto_20228 ?auto_20239 ) ) ( not ( = ?auto_20229 ?auto_20239 ) ) ( not ( = ?auto_20234 ?auto_20239 ) ) ( not ( = ?auto_20232 ?auto_20239 ) ) )
    :subtasks
    ( ( !LIFT ?auto_20238 ?auto_20228 ?auto_20239 ?auto_20233 )
      ( MAKE-2CRATE ?auto_20234 ?auto_20228 ?auto_20229 )
      ( MAKE-1CRATE-VERIFY ?auto_20228 ?auto_20229 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20240 - SURFACE
      ?auto_20241 - SURFACE
      ?auto_20242 - SURFACE
    )
    :vars
    (
      ?auto_20248 - HOIST
      ?auto_20245 - PLACE
      ?auto_20247 - PLACE
      ?auto_20244 - HOIST
      ?auto_20243 - SURFACE
      ?auto_20249 - TRUCK
      ?auto_20250 - PLACE
      ?auto_20246 - HOIST
      ?auto_20251 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20248 ?auto_20245 ) ( IS-CRATE ?auto_20242 ) ( not ( = ?auto_20241 ?auto_20242 ) ) ( not ( = ?auto_20240 ?auto_20241 ) ) ( not ( = ?auto_20240 ?auto_20242 ) ) ( not ( = ?auto_20247 ?auto_20245 ) ) ( HOIST-AT ?auto_20244 ?auto_20247 ) ( not ( = ?auto_20248 ?auto_20244 ) ) ( AVAILABLE ?auto_20244 ) ( SURFACE-AT ?auto_20242 ?auto_20247 ) ( ON ?auto_20242 ?auto_20243 ) ( CLEAR ?auto_20242 ) ( not ( = ?auto_20241 ?auto_20243 ) ) ( not ( = ?auto_20242 ?auto_20243 ) ) ( not ( = ?auto_20240 ?auto_20243 ) ) ( SURFACE-AT ?auto_20240 ?auto_20245 ) ( CLEAR ?auto_20240 ) ( IS-CRATE ?auto_20241 ) ( AVAILABLE ?auto_20248 ) ( TRUCK-AT ?auto_20249 ?auto_20250 ) ( not ( = ?auto_20250 ?auto_20245 ) ) ( not ( = ?auto_20247 ?auto_20250 ) ) ( HOIST-AT ?auto_20246 ?auto_20250 ) ( not ( = ?auto_20248 ?auto_20246 ) ) ( not ( = ?auto_20244 ?auto_20246 ) ) ( AVAILABLE ?auto_20246 ) ( SURFACE-AT ?auto_20241 ?auto_20250 ) ( ON ?auto_20241 ?auto_20251 ) ( CLEAR ?auto_20241 ) ( not ( = ?auto_20241 ?auto_20251 ) ) ( not ( = ?auto_20242 ?auto_20251 ) ) ( not ( = ?auto_20240 ?auto_20251 ) ) ( not ( = ?auto_20243 ?auto_20251 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20241 ?auto_20242 )
      ( MAKE-2CRATE-VERIFY ?auto_20240 ?auto_20241 ?auto_20242 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20252 - SURFACE
      ?auto_20253 - SURFACE
    )
    :vars
    (
      ?auto_20263 - HOIST
      ?auto_20259 - PLACE
      ?auto_20260 - SURFACE
      ?auto_20254 - PLACE
      ?auto_20261 - HOIST
      ?auto_20255 - SURFACE
      ?auto_20258 - PLACE
      ?auto_20257 - HOIST
      ?auto_20256 - SURFACE
      ?auto_20262 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20263 ?auto_20259 ) ( IS-CRATE ?auto_20253 ) ( not ( = ?auto_20252 ?auto_20253 ) ) ( not ( = ?auto_20260 ?auto_20252 ) ) ( not ( = ?auto_20260 ?auto_20253 ) ) ( not ( = ?auto_20254 ?auto_20259 ) ) ( HOIST-AT ?auto_20261 ?auto_20254 ) ( not ( = ?auto_20263 ?auto_20261 ) ) ( AVAILABLE ?auto_20261 ) ( SURFACE-AT ?auto_20253 ?auto_20254 ) ( ON ?auto_20253 ?auto_20255 ) ( CLEAR ?auto_20253 ) ( not ( = ?auto_20252 ?auto_20255 ) ) ( not ( = ?auto_20253 ?auto_20255 ) ) ( not ( = ?auto_20260 ?auto_20255 ) ) ( SURFACE-AT ?auto_20260 ?auto_20259 ) ( CLEAR ?auto_20260 ) ( IS-CRATE ?auto_20252 ) ( AVAILABLE ?auto_20263 ) ( not ( = ?auto_20258 ?auto_20259 ) ) ( not ( = ?auto_20254 ?auto_20258 ) ) ( HOIST-AT ?auto_20257 ?auto_20258 ) ( not ( = ?auto_20263 ?auto_20257 ) ) ( not ( = ?auto_20261 ?auto_20257 ) ) ( AVAILABLE ?auto_20257 ) ( SURFACE-AT ?auto_20252 ?auto_20258 ) ( ON ?auto_20252 ?auto_20256 ) ( CLEAR ?auto_20252 ) ( not ( = ?auto_20252 ?auto_20256 ) ) ( not ( = ?auto_20253 ?auto_20256 ) ) ( not ( = ?auto_20260 ?auto_20256 ) ) ( not ( = ?auto_20255 ?auto_20256 ) ) ( TRUCK-AT ?auto_20262 ?auto_20259 ) )
    :subtasks
    ( ( !DRIVE ?auto_20262 ?auto_20259 ?auto_20258 )
      ( MAKE-2CRATE ?auto_20260 ?auto_20252 ?auto_20253 )
      ( MAKE-1CRATE-VERIFY ?auto_20252 ?auto_20253 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20264 - SURFACE
      ?auto_20265 - SURFACE
      ?auto_20266 - SURFACE
    )
    :vars
    (
      ?auto_20269 - HOIST
      ?auto_20273 - PLACE
      ?auto_20274 - PLACE
      ?auto_20270 - HOIST
      ?auto_20267 - SURFACE
      ?auto_20271 - PLACE
      ?auto_20272 - HOIST
      ?auto_20275 - SURFACE
      ?auto_20268 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20269 ?auto_20273 ) ( IS-CRATE ?auto_20266 ) ( not ( = ?auto_20265 ?auto_20266 ) ) ( not ( = ?auto_20264 ?auto_20265 ) ) ( not ( = ?auto_20264 ?auto_20266 ) ) ( not ( = ?auto_20274 ?auto_20273 ) ) ( HOIST-AT ?auto_20270 ?auto_20274 ) ( not ( = ?auto_20269 ?auto_20270 ) ) ( AVAILABLE ?auto_20270 ) ( SURFACE-AT ?auto_20266 ?auto_20274 ) ( ON ?auto_20266 ?auto_20267 ) ( CLEAR ?auto_20266 ) ( not ( = ?auto_20265 ?auto_20267 ) ) ( not ( = ?auto_20266 ?auto_20267 ) ) ( not ( = ?auto_20264 ?auto_20267 ) ) ( SURFACE-AT ?auto_20264 ?auto_20273 ) ( CLEAR ?auto_20264 ) ( IS-CRATE ?auto_20265 ) ( AVAILABLE ?auto_20269 ) ( not ( = ?auto_20271 ?auto_20273 ) ) ( not ( = ?auto_20274 ?auto_20271 ) ) ( HOIST-AT ?auto_20272 ?auto_20271 ) ( not ( = ?auto_20269 ?auto_20272 ) ) ( not ( = ?auto_20270 ?auto_20272 ) ) ( AVAILABLE ?auto_20272 ) ( SURFACE-AT ?auto_20265 ?auto_20271 ) ( ON ?auto_20265 ?auto_20275 ) ( CLEAR ?auto_20265 ) ( not ( = ?auto_20265 ?auto_20275 ) ) ( not ( = ?auto_20266 ?auto_20275 ) ) ( not ( = ?auto_20264 ?auto_20275 ) ) ( not ( = ?auto_20267 ?auto_20275 ) ) ( TRUCK-AT ?auto_20268 ?auto_20273 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20265 ?auto_20266 )
      ( MAKE-2CRATE-VERIFY ?auto_20264 ?auto_20265 ?auto_20266 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20285 - SURFACE
      ?auto_20286 - SURFACE
    )
    :vars
    (
      ?auto_20287 - HOIST
      ?auto_20288 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20287 ?auto_20288 ) ( SURFACE-AT ?auto_20285 ?auto_20288 ) ( CLEAR ?auto_20285 ) ( LIFTING ?auto_20287 ?auto_20286 ) ( IS-CRATE ?auto_20286 ) ( not ( = ?auto_20285 ?auto_20286 ) ) )
    :subtasks
    ( ( !DROP ?auto_20287 ?auto_20286 ?auto_20285 ?auto_20288 )
      ( MAKE-1CRATE-VERIFY ?auto_20285 ?auto_20286 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20289 - SURFACE
      ?auto_20290 - SURFACE
      ?auto_20291 - SURFACE
    )
    :vars
    (
      ?auto_20293 - HOIST
      ?auto_20292 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20293 ?auto_20292 ) ( SURFACE-AT ?auto_20290 ?auto_20292 ) ( CLEAR ?auto_20290 ) ( LIFTING ?auto_20293 ?auto_20291 ) ( IS-CRATE ?auto_20291 ) ( not ( = ?auto_20290 ?auto_20291 ) ) ( ON ?auto_20290 ?auto_20289 ) ( not ( = ?auto_20289 ?auto_20290 ) ) ( not ( = ?auto_20289 ?auto_20291 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20290 ?auto_20291 )
      ( MAKE-2CRATE-VERIFY ?auto_20289 ?auto_20290 ?auto_20291 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20294 - SURFACE
      ?auto_20295 - SURFACE
      ?auto_20296 - SURFACE
      ?auto_20297 - SURFACE
    )
    :vars
    (
      ?auto_20299 - HOIST
      ?auto_20298 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20299 ?auto_20298 ) ( SURFACE-AT ?auto_20296 ?auto_20298 ) ( CLEAR ?auto_20296 ) ( LIFTING ?auto_20299 ?auto_20297 ) ( IS-CRATE ?auto_20297 ) ( not ( = ?auto_20296 ?auto_20297 ) ) ( ON ?auto_20295 ?auto_20294 ) ( ON ?auto_20296 ?auto_20295 ) ( not ( = ?auto_20294 ?auto_20295 ) ) ( not ( = ?auto_20294 ?auto_20296 ) ) ( not ( = ?auto_20294 ?auto_20297 ) ) ( not ( = ?auto_20295 ?auto_20296 ) ) ( not ( = ?auto_20295 ?auto_20297 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20296 ?auto_20297 )
      ( MAKE-3CRATE-VERIFY ?auto_20294 ?auto_20295 ?auto_20296 ?auto_20297 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20300 - SURFACE
      ?auto_20301 - SURFACE
    )
    :vars
    (
      ?auto_20303 - HOIST
      ?auto_20302 - PLACE
      ?auto_20304 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20303 ?auto_20302 ) ( SURFACE-AT ?auto_20300 ?auto_20302 ) ( CLEAR ?auto_20300 ) ( IS-CRATE ?auto_20301 ) ( not ( = ?auto_20300 ?auto_20301 ) ) ( TRUCK-AT ?auto_20304 ?auto_20302 ) ( AVAILABLE ?auto_20303 ) ( IN ?auto_20301 ?auto_20304 ) )
    :subtasks
    ( ( !UNLOAD ?auto_20303 ?auto_20301 ?auto_20304 ?auto_20302 )
      ( MAKE-1CRATE ?auto_20300 ?auto_20301 )
      ( MAKE-1CRATE-VERIFY ?auto_20300 ?auto_20301 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20305 - SURFACE
      ?auto_20306 - SURFACE
      ?auto_20307 - SURFACE
    )
    :vars
    (
      ?auto_20309 - HOIST
      ?auto_20308 - PLACE
      ?auto_20310 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20309 ?auto_20308 ) ( SURFACE-AT ?auto_20306 ?auto_20308 ) ( CLEAR ?auto_20306 ) ( IS-CRATE ?auto_20307 ) ( not ( = ?auto_20306 ?auto_20307 ) ) ( TRUCK-AT ?auto_20310 ?auto_20308 ) ( AVAILABLE ?auto_20309 ) ( IN ?auto_20307 ?auto_20310 ) ( ON ?auto_20306 ?auto_20305 ) ( not ( = ?auto_20305 ?auto_20306 ) ) ( not ( = ?auto_20305 ?auto_20307 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20306 ?auto_20307 )
      ( MAKE-2CRATE-VERIFY ?auto_20305 ?auto_20306 ?auto_20307 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20311 - SURFACE
      ?auto_20312 - SURFACE
      ?auto_20313 - SURFACE
      ?auto_20314 - SURFACE
    )
    :vars
    (
      ?auto_20316 - HOIST
      ?auto_20317 - PLACE
      ?auto_20315 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20316 ?auto_20317 ) ( SURFACE-AT ?auto_20313 ?auto_20317 ) ( CLEAR ?auto_20313 ) ( IS-CRATE ?auto_20314 ) ( not ( = ?auto_20313 ?auto_20314 ) ) ( TRUCK-AT ?auto_20315 ?auto_20317 ) ( AVAILABLE ?auto_20316 ) ( IN ?auto_20314 ?auto_20315 ) ( ON ?auto_20313 ?auto_20312 ) ( not ( = ?auto_20312 ?auto_20313 ) ) ( not ( = ?auto_20312 ?auto_20314 ) ) ( ON ?auto_20312 ?auto_20311 ) ( not ( = ?auto_20311 ?auto_20312 ) ) ( not ( = ?auto_20311 ?auto_20313 ) ) ( not ( = ?auto_20311 ?auto_20314 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20312 ?auto_20313 ?auto_20314 )
      ( MAKE-3CRATE-VERIFY ?auto_20311 ?auto_20312 ?auto_20313 ?auto_20314 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20318 - SURFACE
      ?auto_20319 - SURFACE
    )
    :vars
    (
      ?auto_20322 - HOIST
      ?auto_20323 - PLACE
      ?auto_20320 - TRUCK
      ?auto_20321 - SURFACE
      ?auto_20324 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20322 ?auto_20323 ) ( SURFACE-AT ?auto_20318 ?auto_20323 ) ( CLEAR ?auto_20318 ) ( IS-CRATE ?auto_20319 ) ( not ( = ?auto_20318 ?auto_20319 ) ) ( AVAILABLE ?auto_20322 ) ( IN ?auto_20319 ?auto_20320 ) ( ON ?auto_20318 ?auto_20321 ) ( not ( = ?auto_20321 ?auto_20318 ) ) ( not ( = ?auto_20321 ?auto_20319 ) ) ( TRUCK-AT ?auto_20320 ?auto_20324 ) ( not ( = ?auto_20324 ?auto_20323 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20320 ?auto_20324 ?auto_20323 )
      ( MAKE-2CRATE ?auto_20321 ?auto_20318 ?auto_20319 )
      ( MAKE-1CRATE-VERIFY ?auto_20318 ?auto_20319 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20325 - SURFACE
      ?auto_20326 - SURFACE
      ?auto_20327 - SURFACE
    )
    :vars
    (
      ?auto_20329 - HOIST
      ?auto_20328 - PLACE
      ?auto_20331 - TRUCK
      ?auto_20330 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20329 ?auto_20328 ) ( SURFACE-AT ?auto_20326 ?auto_20328 ) ( CLEAR ?auto_20326 ) ( IS-CRATE ?auto_20327 ) ( not ( = ?auto_20326 ?auto_20327 ) ) ( AVAILABLE ?auto_20329 ) ( IN ?auto_20327 ?auto_20331 ) ( ON ?auto_20326 ?auto_20325 ) ( not ( = ?auto_20325 ?auto_20326 ) ) ( not ( = ?auto_20325 ?auto_20327 ) ) ( TRUCK-AT ?auto_20331 ?auto_20330 ) ( not ( = ?auto_20330 ?auto_20328 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20326 ?auto_20327 )
      ( MAKE-2CRATE-VERIFY ?auto_20325 ?auto_20326 ?auto_20327 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20332 - SURFACE
      ?auto_20333 - SURFACE
      ?auto_20334 - SURFACE
      ?auto_20335 - SURFACE
    )
    :vars
    (
      ?auto_20338 - HOIST
      ?auto_20337 - PLACE
      ?auto_20336 - TRUCK
      ?auto_20339 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20338 ?auto_20337 ) ( SURFACE-AT ?auto_20334 ?auto_20337 ) ( CLEAR ?auto_20334 ) ( IS-CRATE ?auto_20335 ) ( not ( = ?auto_20334 ?auto_20335 ) ) ( AVAILABLE ?auto_20338 ) ( IN ?auto_20335 ?auto_20336 ) ( ON ?auto_20334 ?auto_20333 ) ( not ( = ?auto_20333 ?auto_20334 ) ) ( not ( = ?auto_20333 ?auto_20335 ) ) ( TRUCK-AT ?auto_20336 ?auto_20339 ) ( not ( = ?auto_20339 ?auto_20337 ) ) ( ON ?auto_20333 ?auto_20332 ) ( not ( = ?auto_20332 ?auto_20333 ) ) ( not ( = ?auto_20332 ?auto_20334 ) ) ( not ( = ?auto_20332 ?auto_20335 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20333 ?auto_20334 ?auto_20335 )
      ( MAKE-3CRATE-VERIFY ?auto_20332 ?auto_20333 ?auto_20334 ?auto_20335 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20340 - SURFACE
      ?auto_20341 - SURFACE
    )
    :vars
    (
      ?auto_20344 - HOIST
      ?auto_20343 - PLACE
      ?auto_20346 - SURFACE
      ?auto_20342 - TRUCK
      ?auto_20345 - PLACE
      ?auto_20347 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20344 ?auto_20343 ) ( SURFACE-AT ?auto_20340 ?auto_20343 ) ( CLEAR ?auto_20340 ) ( IS-CRATE ?auto_20341 ) ( not ( = ?auto_20340 ?auto_20341 ) ) ( AVAILABLE ?auto_20344 ) ( ON ?auto_20340 ?auto_20346 ) ( not ( = ?auto_20346 ?auto_20340 ) ) ( not ( = ?auto_20346 ?auto_20341 ) ) ( TRUCK-AT ?auto_20342 ?auto_20345 ) ( not ( = ?auto_20345 ?auto_20343 ) ) ( HOIST-AT ?auto_20347 ?auto_20345 ) ( LIFTING ?auto_20347 ?auto_20341 ) ( not ( = ?auto_20344 ?auto_20347 ) ) )
    :subtasks
    ( ( !LOAD ?auto_20347 ?auto_20341 ?auto_20342 ?auto_20345 )
      ( MAKE-2CRATE ?auto_20346 ?auto_20340 ?auto_20341 )
      ( MAKE-1CRATE-VERIFY ?auto_20340 ?auto_20341 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20348 - SURFACE
      ?auto_20349 - SURFACE
      ?auto_20350 - SURFACE
    )
    :vars
    (
      ?auto_20351 - HOIST
      ?auto_20353 - PLACE
      ?auto_20355 - TRUCK
      ?auto_20352 - PLACE
      ?auto_20354 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20351 ?auto_20353 ) ( SURFACE-AT ?auto_20349 ?auto_20353 ) ( CLEAR ?auto_20349 ) ( IS-CRATE ?auto_20350 ) ( not ( = ?auto_20349 ?auto_20350 ) ) ( AVAILABLE ?auto_20351 ) ( ON ?auto_20349 ?auto_20348 ) ( not ( = ?auto_20348 ?auto_20349 ) ) ( not ( = ?auto_20348 ?auto_20350 ) ) ( TRUCK-AT ?auto_20355 ?auto_20352 ) ( not ( = ?auto_20352 ?auto_20353 ) ) ( HOIST-AT ?auto_20354 ?auto_20352 ) ( LIFTING ?auto_20354 ?auto_20350 ) ( not ( = ?auto_20351 ?auto_20354 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20349 ?auto_20350 )
      ( MAKE-2CRATE-VERIFY ?auto_20348 ?auto_20349 ?auto_20350 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20356 - SURFACE
      ?auto_20357 - SURFACE
      ?auto_20358 - SURFACE
      ?auto_20359 - SURFACE
    )
    :vars
    (
      ?auto_20362 - HOIST
      ?auto_20363 - PLACE
      ?auto_20364 - TRUCK
      ?auto_20360 - PLACE
      ?auto_20361 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20362 ?auto_20363 ) ( SURFACE-AT ?auto_20358 ?auto_20363 ) ( CLEAR ?auto_20358 ) ( IS-CRATE ?auto_20359 ) ( not ( = ?auto_20358 ?auto_20359 ) ) ( AVAILABLE ?auto_20362 ) ( ON ?auto_20358 ?auto_20357 ) ( not ( = ?auto_20357 ?auto_20358 ) ) ( not ( = ?auto_20357 ?auto_20359 ) ) ( TRUCK-AT ?auto_20364 ?auto_20360 ) ( not ( = ?auto_20360 ?auto_20363 ) ) ( HOIST-AT ?auto_20361 ?auto_20360 ) ( LIFTING ?auto_20361 ?auto_20359 ) ( not ( = ?auto_20362 ?auto_20361 ) ) ( ON ?auto_20357 ?auto_20356 ) ( not ( = ?auto_20356 ?auto_20357 ) ) ( not ( = ?auto_20356 ?auto_20358 ) ) ( not ( = ?auto_20356 ?auto_20359 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20357 ?auto_20358 ?auto_20359 )
      ( MAKE-3CRATE-VERIFY ?auto_20356 ?auto_20357 ?auto_20358 ?auto_20359 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20365 - SURFACE
      ?auto_20366 - SURFACE
    )
    :vars
    (
      ?auto_20369 - HOIST
      ?auto_20370 - PLACE
      ?auto_20371 - SURFACE
      ?auto_20372 - TRUCK
      ?auto_20367 - PLACE
      ?auto_20368 - HOIST
      ?auto_20373 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20369 ?auto_20370 ) ( SURFACE-AT ?auto_20365 ?auto_20370 ) ( CLEAR ?auto_20365 ) ( IS-CRATE ?auto_20366 ) ( not ( = ?auto_20365 ?auto_20366 ) ) ( AVAILABLE ?auto_20369 ) ( ON ?auto_20365 ?auto_20371 ) ( not ( = ?auto_20371 ?auto_20365 ) ) ( not ( = ?auto_20371 ?auto_20366 ) ) ( TRUCK-AT ?auto_20372 ?auto_20367 ) ( not ( = ?auto_20367 ?auto_20370 ) ) ( HOIST-AT ?auto_20368 ?auto_20367 ) ( not ( = ?auto_20369 ?auto_20368 ) ) ( AVAILABLE ?auto_20368 ) ( SURFACE-AT ?auto_20366 ?auto_20367 ) ( ON ?auto_20366 ?auto_20373 ) ( CLEAR ?auto_20366 ) ( not ( = ?auto_20365 ?auto_20373 ) ) ( not ( = ?auto_20366 ?auto_20373 ) ) ( not ( = ?auto_20371 ?auto_20373 ) ) )
    :subtasks
    ( ( !LIFT ?auto_20368 ?auto_20366 ?auto_20373 ?auto_20367 )
      ( MAKE-2CRATE ?auto_20371 ?auto_20365 ?auto_20366 )
      ( MAKE-1CRATE-VERIFY ?auto_20365 ?auto_20366 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20374 - SURFACE
      ?auto_20375 - SURFACE
      ?auto_20376 - SURFACE
    )
    :vars
    (
      ?auto_20382 - HOIST
      ?auto_20381 - PLACE
      ?auto_20377 - TRUCK
      ?auto_20379 - PLACE
      ?auto_20378 - HOIST
      ?auto_20380 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20382 ?auto_20381 ) ( SURFACE-AT ?auto_20375 ?auto_20381 ) ( CLEAR ?auto_20375 ) ( IS-CRATE ?auto_20376 ) ( not ( = ?auto_20375 ?auto_20376 ) ) ( AVAILABLE ?auto_20382 ) ( ON ?auto_20375 ?auto_20374 ) ( not ( = ?auto_20374 ?auto_20375 ) ) ( not ( = ?auto_20374 ?auto_20376 ) ) ( TRUCK-AT ?auto_20377 ?auto_20379 ) ( not ( = ?auto_20379 ?auto_20381 ) ) ( HOIST-AT ?auto_20378 ?auto_20379 ) ( not ( = ?auto_20382 ?auto_20378 ) ) ( AVAILABLE ?auto_20378 ) ( SURFACE-AT ?auto_20376 ?auto_20379 ) ( ON ?auto_20376 ?auto_20380 ) ( CLEAR ?auto_20376 ) ( not ( = ?auto_20375 ?auto_20380 ) ) ( not ( = ?auto_20376 ?auto_20380 ) ) ( not ( = ?auto_20374 ?auto_20380 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20375 ?auto_20376 )
      ( MAKE-2CRATE-VERIFY ?auto_20374 ?auto_20375 ?auto_20376 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20383 - SURFACE
      ?auto_20384 - SURFACE
      ?auto_20385 - SURFACE
      ?auto_20386 - SURFACE
    )
    :vars
    (
      ?auto_20389 - HOIST
      ?auto_20387 - PLACE
      ?auto_20388 - TRUCK
      ?auto_20391 - PLACE
      ?auto_20392 - HOIST
      ?auto_20390 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20389 ?auto_20387 ) ( SURFACE-AT ?auto_20385 ?auto_20387 ) ( CLEAR ?auto_20385 ) ( IS-CRATE ?auto_20386 ) ( not ( = ?auto_20385 ?auto_20386 ) ) ( AVAILABLE ?auto_20389 ) ( ON ?auto_20385 ?auto_20384 ) ( not ( = ?auto_20384 ?auto_20385 ) ) ( not ( = ?auto_20384 ?auto_20386 ) ) ( TRUCK-AT ?auto_20388 ?auto_20391 ) ( not ( = ?auto_20391 ?auto_20387 ) ) ( HOIST-AT ?auto_20392 ?auto_20391 ) ( not ( = ?auto_20389 ?auto_20392 ) ) ( AVAILABLE ?auto_20392 ) ( SURFACE-AT ?auto_20386 ?auto_20391 ) ( ON ?auto_20386 ?auto_20390 ) ( CLEAR ?auto_20386 ) ( not ( = ?auto_20385 ?auto_20390 ) ) ( not ( = ?auto_20386 ?auto_20390 ) ) ( not ( = ?auto_20384 ?auto_20390 ) ) ( ON ?auto_20384 ?auto_20383 ) ( not ( = ?auto_20383 ?auto_20384 ) ) ( not ( = ?auto_20383 ?auto_20385 ) ) ( not ( = ?auto_20383 ?auto_20386 ) ) ( not ( = ?auto_20383 ?auto_20390 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20384 ?auto_20385 ?auto_20386 )
      ( MAKE-3CRATE-VERIFY ?auto_20383 ?auto_20384 ?auto_20385 ?auto_20386 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20393 - SURFACE
      ?auto_20394 - SURFACE
    )
    :vars
    (
      ?auto_20397 - HOIST
      ?auto_20395 - PLACE
      ?auto_20401 - SURFACE
      ?auto_20399 - PLACE
      ?auto_20400 - HOIST
      ?auto_20398 - SURFACE
      ?auto_20396 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20397 ?auto_20395 ) ( SURFACE-AT ?auto_20393 ?auto_20395 ) ( CLEAR ?auto_20393 ) ( IS-CRATE ?auto_20394 ) ( not ( = ?auto_20393 ?auto_20394 ) ) ( AVAILABLE ?auto_20397 ) ( ON ?auto_20393 ?auto_20401 ) ( not ( = ?auto_20401 ?auto_20393 ) ) ( not ( = ?auto_20401 ?auto_20394 ) ) ( not ( = ?auto_20399 ?auto_20395 ) ) ( HOIST-AT ?auto_20400 ?auto_20399 ) ( not ( = ?auto_20397 ?auto_20400 ) ) ( AVAILABLE ?auto_20400 ) ( SURFACE-AT ?auto_20394 ?auto_20399 ) ( ON ?auto_20394 ?auto_20398 ) ( CLEAR ?auto_20394 ) ( not ( = ?auto_20393 ?auto_20398 ) ) ( not ( = ?auto_20394 ?auto_20398 ) ) ( not ( = ?auto_20401 ?auto_20398 ) ) ( TRUCK-AT ?auto_20396 ?auto_20395 ) )
    :subtasks
    ( ( !DRIVE ?auto_20396 ?auto_20395 ?auto_20399 )
      ( MAKE-2CRATE ?auto_20401 ?auto_20393 ?auto_20394 )
      ( MAKE-1CRATE-VERIFY ?auto_20393 ?auto_20394 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20402 - SURFACE
      ?auto_20403 - SURFACE
      ?auto_20404 - SURFACE
    )
    :vars
    (
      ?auto_20405 - HOIST
      ?auto_20410 - PLACE
      ?auto_20406 - PLACE
      ?auto_20409 - HOIST
      ?auto_20407 - SURFACE
      ?auto_20408 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20405 ?auto_20410 ) ( SURFACE-AT ?auto_20403 ?auto_20410 ) ( CLEAR ?auto_20403 ) ( IS-CRATE ?auto_20404 ) ( not ( = ?auto_20403 ?auto_20404 ) ) ( AVAILABLE ?auto_20405 ) ( ON ?auto_20403 ?auto_20402 ) ( not ( = ?auto_20402 ?auto_20403 ) ) ( not ( = ?auto_20402 ?auto_20404 ) ) ( not ( = ?auto_20406 ?auto_20410 ) ) ( HOIST-AT ?auto_20409 ?auto_20406 ) ( not ( = ?auto_20405 ?auto_20409 ) ) ( AVAILABLE ?auto_20409 ) ( SURFACE-AT ?auto_20404 ?auto_20406 ) ( ON ?auto_20404 ?auto_20407 ) ( CLEAR ?auto_20404 ) ( not ( = ?auto_20403 ?auto_20407 ) ) ( not ( = ?auto_20404 ?auto_20407 ) ) ( not ( = ?auto_20402 ?auto_20407 ) ) ( TRUCK-AT ?auto_20408 ?auto_20410 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20403 ?auto_20404 )
      ( MAKE-2CRATE-VERIFY ?auto_20402 ?auto_20403 ?auto_20404 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20411 - SURFACE
      ?auto_20412 - SURFACE
      ?auto_20413 - SURFACE
      ?auto_20414 - SURFACE
    )
    :vars
    (
      ?auto_20420 - HOIST
      ?auto_20416 - PLACE
      ?auto_20418 - PLACE
      ?auto_20415 - HOIST
      ?auto_20419 - SURFACE
      ?auto_20417 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20420 ?auto_20416 ) ( SURFACE-AT ?auto_20413 ?auto_20416 ) ( CLEAR ?auto_20413 ) ( IS-CRATE ?auto_20414 ) ( not ( = ?auto_20413 ?auto_20414 ) ) ( AVAILABLE ?auto_20420 ) ( ON ?auto_20413 ?auto_20412 ) ( not ( = ?auto_20412 ?auto_20413 ) ) ( not ( = ?auto_20412 ?auto_20414 ) ) ( not ( = ?auto_20418 ?auto_20416 ) ) ( HOIST-AT ?auto_20415 ?auto_20418 ) ( not ( = ?auto_20420 ?auto_20415 ) ) ( AVAILABLE ?auto_20415 ) ( SURFACE-AT ?auto_20414 ?auto_20418 ) ( ON ?auto_20414 ?auto_20419 ) ( CLEAR ?auto_20414 ) ( not ( = ?auto_20413 ?auto_20419 ) ) ( not ( = ?auto_20414 ?auto_20419 ) ) ( not ( = ?auto_20412 ?auto_20419 ) ) ( TRUCK-AT ?auto_20417 ?auto_20416 ) ( ON ?auto_20412 ?auto_20411 ) ( not ( = ?auto_20411 ?auto_20412 ) ) ( not ( = ?auto_20411 ?auto_20413 ) ) ( not ( = ?auto_20411 ?auto_20414 ) ) ( not ( = ?auto_20411 ?auto_20419 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20412 ?auto_20413 ?auto_20414 )
      ( MAKE-3CRATE-VERIFY ?auto_20411 ?auto_20412 ?auto_20413 ?auto_20414 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20421 - SURFACE
      ?auto_20422 - SURFACE
    )
    :vars
    (
      ?auto_20429 - HOIST
      ?auto_20425 - PLACE
      ?auto_20423 - SURFACE
      ?auto_20427 - PLACE
      ?auto_20424 - HOIST
      ?auto_20428 - SURFACE
      ?auto_20426 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20429 ?auto_20425 ) ( IS-CRATE ?auto_20422 ) ( not ( = ?auto_20421 ?auto_20422 ) ) ( not ( = ?auto_20423 ?auto_20421 ) ) ( not ( = ?auto_20423 ?auto_20422 ) ) ( not ( = ?auto_20427 ?auto_20425 ) ) ( HOIST-AT ?auto_20424 ?auto_20427 ) ( not ( = ?auto_20429 ?auto_20424 ) ) ( AVAILABLE ?auto_20424 ) ( SURFACE-AT ?auto_20422 ?auto_20427 ) ( ON ?auto_20422 ?auto_20428 ) ( CLEAR ?auto_20422 ) ( not ( = ?auto_20421 ?auto_20428 ) ) ( not ( = ?auto_20422 ?auto_20428 ) ) ( not ( = ?auto_20423 ?auto_20428 ) ) ( TRUCK-AT ?auto_20426 ?auto_20425 ) ( SURFACE-AT ?auto_20423 ?auto_20425 ) ( CLEAR ?auto_20423 ) ( LIFTING ?auto_20429 ?auto_20421 ) ( IS-CRATE ?auto_20421 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20423 ?auto_20421 )
      ( MAKE-2CRATE ?auto_20423 ?auto_20421 ?auto_20422 )
      ( MAKE-1CRATE-VERIFY ?auto_20421 ?auto_20422 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20430 - SURFACE
      ?auto_20431 - SURFACE
      ?auto_20432 - SURFACE
    )
    :vars
    (
      ?auto_20436 - HOIST
      ?auto_20437 - PLACE
      ?auto_20438 - PLACE
      ?auto_20433 - HOIST
      ?auto_20435 - SURFACE
      ?auto_20434 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20436 ?auto_20437 ) ( IS-CRATE ?auto_20432 ) ( not ( = ?auto_20431 ?auto_20432 ) ) ( not ( = ?auto_20430 ?auto_20431 ) ) ( not ( = ?auto_20430 ?auto_20432 ) ) ( not ( = ?auto_20438 ?auto_20437 ) ) ( HOIST-AT ?auto_20433 ?auto_20438 ) ( not ( = ?auto_20436 ?auto_20433 ) ) ( AVAILABLE ?auto_20433 ) ( SURFACE-AT ?auto_20432 ?auto_20438 ) ( ON ?auto_20432 ?auto_20435 ) ( CLEAR ?auto_20432 ) ( not ( = ?auto_20431 ?auto_20435 ) ) ( not ( = ?auto_20432 ?auto_20435 ) ) ( not ( = ?auto_20430 ?auto_20435 ) ) ( TRUCK-AT ?auto_20434 ?auto_20437 ) ( SURFACE-AT ?auto_20430 ?auto_20437 ) ( CLEAR ?auto_20430 ) ( LIFTING ?auto_20436 ?auto_20431 ) ( IS-CRATE ?auto_20431 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20431 ?auto_20432 )
      ( MAKE-2CRATE-VERIFY ?auto_20430 ?auto_20431 ?auto_20432 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20439 - SURFACE
      ?auto_20440 - SURFACE
      ?auto_20441 - SURFACE
      ?auto_20442 - SURFACE
    )
    :vars
    (
      ?auto_20446 - HOIST
      ?auto_20443 - PLACE
      ?auto_20444 - PLACE
      ?auto_20445 - HOIST
      ?auto_20448 - SURFACE
      ?auto_20447 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20446 ?auto_20443 ) ( IS-CRATE ?auto_20442 ) ( not ( = ?auto_20441 ?auto_20442 ) ) ( not ( = ?auto_20440 ?auto_20441 ) ) ( not ( = ?auto_20440 ?auto_20442 ) ) ( not ( = ?auto_20444 ?auto_20443 ) ) ( HOIST-AT ?auto_20445 ?auto_20444 ) ( not ( = ?auto_20446 ?auto_20445 ) ) ( AVAILABLE ?auto_20445 ) ( SURFACE-AT ?auto_20442 ?auto_20444 ) ( ON ?auto_20442 ?auto_20448 ) ( CLEAR ?auto_20442 ) ( not ( = ?auto_20441 ?auto_20448 ) ) ( not ( = ?auto_20442 ?auto_20448 ) ) ( not ( = ?auto_20440 ?auto_20448 ) ) ( TRUCK-AT ?auto_20447 ?auto_20443 ) ( SURFACE-AT ?auto_20440 ?auto_20443 ) ( CLEAR ?auto_20440 ) ( LIFTING ?auto_20446 ?auto_20441 ) ( IS-CRATE ?auto_20441 ) ( ON ?auto_20440 ?auto_20439 ) ( not ( = ?auto_20439 ?auto_20440 ) ) ( not ( = ?auto_20439 ?auto_20441 ) ) ( not ( = ?auto_20439 ?auto_20442 ) ) ( not ( = ?auto_20439 ?auto_20448 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20440 ?auto_20441 ?auto_20442 )
      ( MAKE-3CRATE-VERIFY ?auto_20439 ?auto_20440 ?auto_20441 ?auto_20442 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20449 - SURFACE
      ?auto_20450 - SURFACE
    )
    :vars
    (
      ?auto_20454 - HOIST
      ?auto_20451 - PLACE
      ?auto_20456 - SURFACE
      ?auto_20452 - PLACE
      ?auto_20453 - HOIST
      ?auto_20457 - SURFACE
      ?auto_20455 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20454 ?auto_20451 ) ( IS-CRATE ?auto_20450 ) ( not ( = ?auto_20449 ?auto_20450 ) ) ( not ( = ?auto_20456 ?auto_20449 ) ) ( not ( = ?auto_20456 ?auto_20450 ) ) ( not ( = ?auto_20452 ?auto_20451 ) ) ( HOIST-AT ?auto_20453 ?auto_20452 ) ( not ( = ?auto_20454 ?auto_20453 ) ) ( AVAILABLE ?auto_20453 ) ( SURFACE-AT ?auto_20450 ?auto_20452 ) ( ON ?auto_20450 ?auto_20457 ) ( CLEAR ?auto_20450 ) ( not ( = ?auto_20449 ?auto_20457 ) ) ( not ( = ?auto_20450 ?auto_20457 ) ) ( not ( = ?auto_20456 ?auto_20457 ) ) ( TRUCK-AT ?auto_20455 ?auto_20451 ) ( SURFACE-AT ?auto_20456 ?auto_20451 ) ( CLEAR ?auto_20456 ) ( IS-CRATE ?auto_20449 ) ( AVAILABLE ?auto_20454 ) ( IN ?auto_20449 ?auto_20455 ) )
    :subtasks
    ( ( !UNLOAD ?auto_20454 ?auto_20449 ?auto_20455 ?auto_20451 )
      ( MAKE-2CRATE ?auto_20456 ?auto_20449 ?auto_20450 )
      ( MAKE-1CRATE-VERIFY ?auto_20449 ?auto_20450 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20458 - SURFACE
      ?auto_20459 - SURFACE
      ?auto_20460 - SURFACE
    )
    :vars
    (
      ?auto_20466 - HOIST
      ?auto_20463 - PLACE
      ?auto_20464 - PLACE
      ?auto_20465 - HOIST
      ?auto_20461 - SURFACE
      ?auto_20462 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20466 ?auto_20463 ) ( IS-CRATE ?auto_20460 ) ( not ( = ?auto_20459 ?auto_20460 ) ) ( not ( = ?auto_20458 ?auto_20459 ) ) ( not ( = ?auto_20458 ?auto_20460 ) ) ( not ( = ?auto_20464 ?auto_20463 ) ) ( HOIST-AT ?auto_20465 ?auto_20464 ) ( not ( = ?auto_20466 ?auto_20465 ) ) ( AVAILABLE ?auto_20465 ) ( SURFACE-AT ?auto_20460 ?auto_20464 ) ( ON ?auto_20460 ?auto_20461 ) ( CLEAR ?auto_20460 ) ( not ( = ?auto_20459 ?auto_20461 ) ) ( not ( = ?auto_20460 ?auto_20461 ) ) ( not ( = ?auto_20458 ?auto_20461 ) ) ( TRUCK-AT ?auto_20462 ?auto_20463 ) ( SURFACE-AT ?auto_20458 ?auto_20463 ) ( CLEAR ?auto_20458 ) ( IS-CRATE ?auto_20459 ) ( AVAILABLE ?auto_20466 ) ( IN ?auto_20459 ?auto_20462 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20459 ?auto_20460 )
      ( MAKE-2CRATE-VERIFY ?auto_20458 ?auto_20459 ?auto_20460 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20467 - SURFACE
      ?auto_20468 - SURFACE
      ?auto_20469 - SURFACE
      ?auto_20470 - SURFACE
    )
    :vars
    (
      ?auto_20474 - HOIST
      ?auto_20475 - PLACE
      ?auto_20473 - PLACE
      ?auto_20472 - HOIST
      ?auto_20476 - SURFACE
      ?auto_20471 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20474 ?auto_20475 ) ( IS-CRATE ?auto_20470 ) ( not ( = ?auto_20469 ?auto_20470 ) ) ( not ( = ?auto_20468 ?auto_20469 ) ) ( not ( = ?auto_20468 ?auto_20470 ) ) ( not ( = ?auto_20473 ?auto_20475 ) ) ( HOIST-AT ?auto_20472 ?auto_20473 ) ( not ( = ?auto_20474 ?auto_20472 ) ) ( AVAILABLE ?auto_20472 ) ( SURFACE-AT ?auto_20470 ?auto_20473 ) ( ON ?auto_20470 ?auto_20476 ) ( CLEAR ?auto_20470 ) ( not ( = ?auto_20469 ?auto_20476 ) ) ( not ( = ?auto_20470 ?auto_20476 ) ) ( not ( = ?auto_20468 ?auto_20476 ) ) ( TRUCK-AT ?auto_20471 ?auto_20475 ) ( SURFACE-AT ?auto_20468 ?auto_20475 ) ( CLEAR ?auto_20468 ) ( IS-CRATE ?auto_20469 ) ( AVAILABLE ?auto_20474 ) ( IN ?auto_20469 ?auto_20471 ) ( ON ?auto_20468 ?auto_20467 ) ( not ( = ?auto_20467 ?auto_20468 ) ) ( not ( = ?auto_20467 ?auto_20469 ) ) ( not ( = ?auto_20467 ?auto_20470 ) ) ( not ( = ?auto_20467 ?auto_20476 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20468 ?auto_20469 ?auto_20470 )
      ( MAKE-3CRATE-VERIFY ?auto_20467 ?auto_20468 ?auto_20469 ?auto_20470 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20477 - SURFACE
      ?auto_20478 - SURFACE
    )
    :vars
    (
      ?auto_20483 - HOIST
      ?auto_20484 - PLACE
      ?auto_20479 - SURFACE
      ?auto_20482 - PLACE
      ?auto_20481 - HOIST
      ?auto_20485 - SURFACE
      ?auto_20480 - TRUCK
      ?auto_20486 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20483 ?auto_20484 ) ( IS-CRATE ?auto_20478 ) ( not ( = ?auto_20477 ?auto_20478 ) ) ( not ( = ?auto_20479 ?auto_20477 ) ) ( not ( = ?auto_20479 ?auto_20478 ) ) ( not ( = ?auto_20482 ?auto_20484 ) ) ( HOIST-AT ?auto_20481 ?auto_20482 ) ( not ( = ?auto_20483 ?auto_20481 ) ) ( AVAILABLE ?auto_20481 ) ( SURFACE-AT ?auto_20478 ?auto_20482 ) ( ON ?auto_20478 ?auto_20485 ) ( CLEAR ?auto_20478 ) ( not ( = ?auto_20477 ?auto_20485 ) ) ( not ( = ?auto_20478 ?auto_20485 ) ) ( not ( = ?auto_20479 ?auto_20485 ) ) ( SURFACE-AT ?auto_20479 ?auto_20484 ) ( CLEAR ?auto_20479 ) ( IS-CRATE ?auto_20477 ) ( AVAILABLE ?auto_20483 ) ( IN ?auto_20477 ?auto_20480 ) ( TRUCK-AT ?auto_20480 ?auto_20486 ) ( not ( = ?auto_20486 ?auto_20484 ) ) ( not ( = ?auto_20482 ?auto_20486 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20480 ?auto_20486 ?auto_20484 )
      ( MAKE-2CRATE ?auto_20479 ?auto_20477 ?auto_20478 )
      ( MAKE-1CRATE-VERIFY ?auto_20477 ?auto_20478 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20487 - SURFACE
      ?auto_20488 - SURFACE
      ?auto_20489 - SURFACE
    )
    :vars
    (
      ?auto_20491 - HOIST
      ?auto_20494 - PLACE
      ?auto_20493 - PLACE
      ?auto_20496 - HOIST
      ?auto_20495 - SURFACE
      ?auto_20490 - TRUCK
      ?auto_20492 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20491 ?auto_20494 ) ( IS-CRATE ?auto_20489 ) ( not ( = ?auto_20488 ?auto_20489 ) ) ( not ( = ?auto_20487 ?auto_20488 ) ) ( not ( = ?auto_20487 ?auto_20489 ) ) ( not ( = ?auto_20493 ?auto_20494 ) ) ( HOIST-AT ?auto_20496 ?auto_20493 ) ( not ( = ?auto_20491 ?auto_20496 ) ) ( AVAILABLE ?auto_20496 ) ( SURFACE-AT ?auto_20489 ?auto_20493 ) ( ON ?auto_20489 ?auto_20495 ) ( CLEAR ?auto_20489 ) ( not ( = ?auto_20488 ?auto_20495 ) ) ( not ( = ?auto_20489 ?auto_20495 ) ) ( not ( = ?auto_20487 ?auto_20495 ) ) ( SURFACE-AT ?auto_20487 ?auto_20494 ) ( CLEAR ?auto_20487 ) ( IS-CRATE ?auto_20488 ) ( AVAILABLE ?auto_20491 ) ( IN ?auto_20488 ?auto_20490 ) ( TRUCK-AT ?auto_20490 ?auto_20492 ) ( not ( = ?auto_20492 ?auto_20494 ) ) ( not ( = ?auto_20493 ?auto_20492 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20488 ?auto_20489 )
      ( MAKE-2CRATE-VERIFY ?auto_20487 ?auto_20488 ?auto_20489 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20497 - SURFACE
      ?auto_20498 - SURFACE
      ?auto_20499 - SURFACE
      ?auto_20500 - SURFACE
    )
    :vars
    (
      ?auto_20502 - HOIST
      ?auto_20505 - PLACE
      ?auto_20504 - PLACE
      ?auto_20501 - HOIST
      ?auto_20503 - SURFACE
      ?auto_20507 - TRUCK
      ?auto_20506 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20502 ?auto_20505 ) ( IS-CRATE ?auto_20500 ) ( not ( = ?auto_20499 ?auto_20500 ) ) ( not ( = ?auto_20498 ?auto_20499 ) ) ( not ( = ?auto_20498 ?auto_20500 ) ) ( not ( = ?auto_20504 ?auto_20505 ) ) ( HOIST-AT ?auto_20501 ?auto_20504 ) ( not ( = ?auto_20502 ?auto_20501 ) ) ( AVAILABLE ?auto_20501 ) ( SURFACE-AT ?auto_20500 ?auto_20504 ) ( ON ?auto_20500 ?auto_20503 ) ( CLEAR ?auto_20500 ) ( not ( = ?auto_20499 ?auto_20503 ) ) ( not ( = ?auto_20500 ?auto_20503 ) ) ( not ( = ?auto_20498 ?auto_20503 ) ) ( SURFACE-AT ?auto_20498 ?auto_20505 ) ( CLEAR ?auto_20498 ) ( IS-CRATE ?auto_20499 ) ( AVAILABLE ?auto_20502 ) ( IN ?auto_20499 ?auto_20507 ) ( TRUCK-AT ?auto_20507 ?auto_20506 ) ( not ( = ?auto_20506 ?auto_20505 ) ) ( not ( = ?auto_20504 ?auto_20506 ) ) ( ON ?auto_20498 ?auto_20497 ) ( not ( = ?auto_20497 ?auto_20498 ) ) ( not ( = ?auto_20497 ?auto_20499 ) ) ( not ( = ?auto_20497 ?auto_20500 ) ) ( not ( = ?auto_20497 ?auto_20503 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20498 ?auto_20499 ?auto_20500 )
      ( MAKE-3CRATE-VERIFY ?auto_20497 ?auto_20498 ?auto_20499 ?auto_20500 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20508 - SURFACE
      ?auto_20509 - SURFACE
    )
    :vars
    (
      ?auto_20511 - HOIST
      ?auto_20515 - PLACE
      ?auto_20513 - SURFACE
      ?auto_20514 - PLACE
      ?auto_20510 - HOIST
      ?auto_20512 - SURFACE
      ?auto_20517 - TRUCK
      ?auto_20516 - PLACE
      ?auto_20518 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20511 ?auto_20515 ) ( IS-CRATE ?auto_20509 ) ( not ( = ?auto_20508 ?auto_20509 ) ) ( not ( = ?auto_20513 ?auto_20508 ) ) ( not ( = ?auto_20513 ?auto_20509 ) ) ( not ( = ?auto_20514 ?auto_20515 ) ) ( HOIST-AT ?auto_20510 ?auto_20514 ) ( not ( = ?auto_20511 ?auto_20510 ) ) ( AVAILABLE ?auto_20510 ) ( SURFACE-AT ?auto_20509 ?auto_20514 ) ( ON ?auto_20509 ?auto_20512 ) ( CLEAR ?auto_20509 ) ( not ( = ?auto_20508 ?auto_20512 ) ) ( not ( = ?auto_20509 ?auto_20512 ) ) ( not ( = ?auto_20513 ?auto_20512 ) ) ( SURFACE-AT ?auto_20513 ?auto_20515 ) ( CLEAR ?auto_20513 ) ( IS-CRATE ?auto_20508 ) ( AVAILABLE ?auto_20511 ) ( TRUCK-AT ?auto_20517 ?auto_20516 ) ( not ( = ?auto_20516 ?auto_20515 ) ) ( not ( = ?auto_20514 ?auto_20516 ) ) ( HOIST-AT ?auto_20518 ?auto_20516 ) ( LIFTING ?auto_20518 ?auto_20508 ) ( not ( = ?auto_20511 ?auto_20518 ) ) ( not ( = ?auto_20510 ?auto_20518 ) ) )
    :subtasks
    ( ( !LOAD ?auto_20518 ?auto_20508 ?auto_20517 ?auto_20516 )
      ( MAKE-2CRATE ?auto_20513 ?auto_20508 ?auto_20509 )
      ( MAKE-1CRATE-VERIFY ?auto_20508 ?auto_20509 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20519 - SURFACE
      ?auto_20520 - SURFACE
      ?auto_20521 - SURFACE
    )
    :vars
    (
      ?auto_20529 - HOIST
      ?auto_20528 - PLACE
      ?auto_20522 - PLACE
      ?auto_20524 - HOIST
      ?auto_20526 - SURFACE
      ?auto_20523 - TRUCK
      ?auto_20525 - PLACE
      ?auto_20527 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20529 ?auto_20528 ) ( IS-CRATE ?auto_20521 ) ( not ( = ?auto_20520 ?auto_20521 ) ) ( not ( = ?auto_20519 ?auto_20520 ) ) ( not ( = ?auto_20519 ?auto_20521 ) ) ( not ( = ?auto_20522 ?auto_20528 ) ) ( HOIST-AT ?auto_20524 ?auto_20522 ) ( not ( = ?auto_20529 ?auto_20524 ) ) ( AVAILABLE ?auto_20524 ) ( SURFACE-AT ?auto_20521 ?auto_20522 ) ( ON ?auto_20521 ?auto_20526 ) ( CLEAR ?auto_20521 ) ( not ( = ?auto_20520 ?auto_20526 ) ) ( not ( = ?auto_20521 ?auto_20526 ) ) ( not ( = ?auto_20519 ?auto_20526 ) ) ( SURFACE-AT ?auto_20519 ?auto_20528 ) ( CLEAR ?auto_20519 ) ( IS-CRATE ?auto_20520 ) ( AVAILABLE ?auto_20529 ) ( TRUCK-AT ?auto_20523 ?auto_20525 ) ( not ( = ?auto_20525 ?auto_20528 ) ) ( not ( = ?auto_20522 ?auto_20525 ) ) ( HOIST-AT ?auto_20527 ?auto_20525 ) ( LIFTING ?auto_20527 ?auto_20520 ) ( not ( = ?auto_20529 ?auto_20527 ) ) ( not ( = ?auto_20524 ?auto_20527 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20520 ?auto_20521 )
      ( MAKE-2CRATE-VERIFY ?auto_20519 ?auto_20520 ?auto_20521 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20530 - SURFACE
      ?auto_20531 - SURFACE
      ?auto_20532 - SURFACE
      ?auto_20533 - SURFACE
    )
    :vars
    (
      ?auto_20537 - HOIST
      ?auto_20538 - PLACE
      ?auto_20535 - PLACE
      ?auto_20539 - HOIST
      ?auto_20540 - SURFACE
      ?auto_20536 - TRUCK
      ?auto_20534 - PLACE
      ?auto_20541 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20537 ?auto_20538 ) ( IS-CRATE ?auto_20533 ) ( not ( = ?auto_20532 ?auto_20533 ) ) ( not ( = ?auto_20531 ?auto_20532 ) ) ( not ( = ?auto_20531 ?auto_20533 ) ) ( not ( = ?auto_20535 ?auto_20538 ) ) ( HOIST-AT ?auto_20539 ?auto_20535 ) ( not ( = ?auto_20537 ?auto_20539 ) ) ( AVAILABLE ?auto_20539 ) ( SURFACE-AT ?auto_20533 ?auto_20535 ) ( ON ?auto_20533 ?auto_20540 ) ( CLEAR ?auto_20533 ) ( not ( = ?auto_20532 ?auto_20540 ) ) ( not ( = ?auto_20533 ?auto_20540 ) ) ( not ( = ?auto_20531 ?auto_20540 ) ) ( SURFACE-AT ?auto_20531 ?auto_20538 ) ( CLEAR ?auto_20531 ) ( IS-CRATE ?auto_20532 ) ( AVAILABLE ?auto_20537 ) ( TRUCK-AT ?auto_20536 ?auto_20534 ) ( not ( = ?auto_20534 ?auto_20538 ) ) ( not ( = ?auto_20535 ?auto_20534 ) ) ( HOIST-AT ?auto_20541 ?auto_20534 ) ( LIFTING ?auto_20541 ?auto_20532 ) ( not ( = ?auto_20537 ?auto_20541 ) ) ( not ( = ?auto_20539 ?auto_20541 ) ) ( ON ?auto_20531 ?auto_20530 ) ( not ( = ?auto_20530 ?auto_20531 ) ) ( not ( = ?auto_20530 ?auto_20532 ) ) ( not ( = ?auto_20530 ?auto_20533 ) ) ( not ( = ?auto_20530 ?auto_20540 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20531 ?auto_20532 ?auto_20533 )
      ( MAKE-3CRATE-VERIFY ?auto_20530 ?auto_20531 ?auto_20532 ?auto_20533 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20542 - SURFACE
      ?auto_20543 - SURFACE
    )
    :vars
    (
      ?auto_20548 - HOIST
      ?auto_20549 - PLACE
      ?auto_20546 - SURFACE
      ?auto_20545 - PLACE
      ?auto_20550 - HOIST
      ?auto_20551 - SURFACE
      ?auto_20547 - TRUCK
      ?auto_20544 - PLACE
      ?auto_20552 - HOIST
      ?auto_20553 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20548 ?auto_20549 ) ( IS-CRATE ?auto_20543 ) ( not ( = ?auto_20542 ?auto_20543 ) ) ( not ( = ?auto_20546 ?auto_20542 ) ) ( not ( = ?auto_20546 ?auto_20543 ) ) ( not ( = ?auto_20545 ?auto_20549 ) ) ( HOIST-AT ?auto_20550 ?auto_20545 ) ( not ( = ?auto_20548 ?auto_20550 ) ) ( AVAILABLE ?auto_20550 ) ( SURFACE-AT ?auto_20543 ?auto_20545 ) ( ON ?auto_20543 ?auto_20551 ) ( CLEAR ?auto_20543 ) ( not ( = ?auto_20542 ?auto_20551 ) ) ( not ( = ?auto_20543 ?auto_20551 ) ) ( not ( = ?auto_20546 ?auto_20551 ) ) ( SURFACE-AT ?auto_20546 ?auto_20549 ) ( CLEAR ?auto_20546 ) ( IS-CRATE ?auto_20542 ) ( AVAILABLE ?auto_20548 ) ( TRUCK-AT ?auto_20547 ?auto_20544 ) ( not ( = ?auto_20544 ?auto_20549 ) ) ( not ( = ?auto_20545 ?auto_20544 ) ) ( HOIST-AT ?auto_20552 ?auto_20544 ) ( not ( = ?auto_20548 ?auto_20552 ) ) ( not ( = ?auto_20550 ?auto_20552 ) ) ( AVAILABLE ?auto_20552 ) ( SURFACE-AT ?auto_20542 ?auto_20544 ) ( ON ?auto_20542 ?auto_20553 ) ( CLEAR ?auto_20542 ) ( not ( = ?auto_20542 ?auto_20553 ) ) ( not ( = ?auto_20543 ?auto_20553 ) ) ( not ( = ?auto_20546 ?auto_20553 ) ) ( not ( = ?auto_20551 ?auto_20553 ) ) )
    :subtasks
    ( ( !LIFT ?auto_20552 ?auto_20542 ?auto_20553 ?auto_20544 )
      ( MAKE-2CRATE ?auto_20546 ?auto_20542 ?auto_20543 )
      ( MAKE-1CRATE-VERIFY ?auto_20542 ?auto_20543 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20554 - SURFACE
      ?auto_20555 - SURFACE
      ?auto_20556 - SURFACE
    )
    :vars
    (
      ?auto_20560 - HOIST
      ?auto_20562 - PLACE
      ?auto_20564 - PLACE
      ?auto_20561 - HOIST
      ?auto_20559 - SURFACE
      ?auto_20557 - TRUCK
      ?auto_20558 - PLACE
      ?auto_20565 - HOIST
      ?auto_20563 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20560 ?auto_20562 ) ( IS-CRATE ?auto_20556 ) ( not ( = ?auto_20555 ?auto_20556 ) ) ( not ( = ?auto_20554 ?auto_20555 ) ) ( not ( = ?auto_20554 ?auto_20556 ) ) ( not ( = ?auto_20564 ?auto_20562 ) ) ( HOIST-AT ?auto_20561 ?auto_20564 ) ( not ( = ?auto_20560 ?auto_20561 ) ) ( AVAILABLE ?auto_20561 ) ( SURFACE-AT ?auto_20556 ?auto_20564 ) ( ON ?auto_20556 ?auto_20559 ) ( CLEAR ?auto_20556 ) ( not ( = ?auto_20555 ?auto_20559 ) ) ( not ( = ?auto_20556 ?auto_20559 ) ) ( not ( = ?auto_20554 ?auto_20559 ) ) ( SURFACE-AT ?auto_20554 ?auto_20562 ) ( CLEAR ?auto_20554 ) ( IS-CRATE ?auto_20555 ) ( AVAILABLE ?auto_20560 ) ( TRUCK-AT ?auto_20557 ?auto_20558 ) ( not ( = ?auto_20558 ?auto_20562 ) ) ( not ( = ?auto_20564 ?auto_20558 ) ) ( HOIST-AT ?auto_20565 ?auto_20558 ) ( not ( = ?auto_20560 ?auto_20565 ) ) ( not ( = ?auto_20561 ?auto_20565 ) ) ( AVAILABLE ?auto_20565 ) ( SURFACE-AT ?auto_20555 ?auto_20558 ) ( ON ?auto_20555 ?auto_20563 ) ( CLEAR ?auto_20555 ) ( not ( = ?auto_20555 ?auto_20563 ) ) ( not ( = ?auto_20556 ?auto_20563 ) ) ( not ( = ?auto_20554 ?auto_20563 ) ) ( not ( = ?auto_20559 ?auto_20563 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20555 ?auto_20556 )
      ( MAKE-2CRATE-VERIFY ?auto_20554 ?auto_20555 ?auto_20556 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20566 - SURFACE
      ?auto_20567 - SURFACE
      ?auto_20568 - SURFACE
      ?auto_20569 - SURFACE
    )
    :vars
    (
      ?auto_20572 - HOIST
      ?auto_20571 - PLACE
      ?auto_20570 - PLACE
      ?auto_20577 - HOIST
      ?auto_20573 - SURFACE
      ?auto_20574 - TRUCK
      ?auto_20578 - PLACE
      ?auto_20575 - HOIST
      ?auto_20576 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20572 ?auto_20571 ) ( IS-CRATE ?auto_20569 ) ( not ( = ?auto_20568 ?auto_20569 ) ) ( not ( = ?auto_20567 ?auto_20568 ) ) ( not ( = ?auto_20567 ?auto_20569 ) ) ( not ( = ?auto_20570 ?auto_20571 ) ) ( HOIST-AT ?auto_20577 ?auto_20570 ) ( not ( = ?auto_20572 ?auto_20577 ) ) ( AVAILABLE ?auto_20577 ) ( SURFACE-AT ?auto_20569 ?auto_20570 ) ( ON ?auto_20569 ?auto_20573 ) ( CLEAR ?auto_20569 ) ( not ( = ?auto_20568 ?auto_20573 ) ) ( not ( = ?auto_20569 ?auto_20573 ) ) ( not ( = ?auto_20567 ?auto_20573 ) ) ( SURFACE-AT ?auto_20567 ?auto_20571 ) ( CLEAR ?auto_20567 ) ( IS-CRATE ?auto_20568 ) ( AVAILABLE ?auto_20572 ) ( TRUCK-AT ?auto_20574 ?auto_20578 ) ( not ( = ?auto_20578 ?auto_20571 ) ) ( not ( = ?auto_20570 ?auto_20578 ) ) ( HOIST-AT ?auto_20575 ?auto_20578 ) ( not ( = ?auto_20572 ?auto_20575 ) ) ( not ( = ?auto_20577 ?auto_20575 ) ) ( AVAILABLE ?auto_20575 ) ( SURFACE-AT ?auto_20568 ?auto_20578 ) ( ON ?auto_20568 ?auto_20576 ) ( CLEAR ?auto_20568 ) ( not ( = ?auto_20568 ?auto_20576 ) ) ( not ( = ?auto_20569 ?auto_20576 ) ) ( not ( = ?auto_20567 ?auto_20576 ) ) ( not ( = ?auto_20573 ?auto_20576 ) ) ( ON ?auto_20567 ?auto_20566 ) ( not ( = ?auto_20566 ?auto_20567 ) ) ( not ( = ?auto_20566 ?auto_20568 ) ) ( not ( = ?auto_20566 ?auto_20569 ) ) ( not ( = ?auto_20566 ?auto_20573 ) ) ( not ( = ?auto_20566 ?auto_20576 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20567 ?auto_20568 ?auto_20569 )
      ( MAKE-3CRATE-VERIFY ?auto_20566 ?auto_20567 ?auto_20568 ?auto_20569 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20579 - SURFACE
      ?auto_20580 - SURFACE
    )
    :vars
    (
      ?auto_20583 - HOIST
      ?auto_20582 - PLACE
      ?auto_20589 - SURFACE
      ?auto_20581 - PLACE
      ?auto_20588 - HOIST
      ?auto_20584 - SURFACE
      ?auto_20590 - PLACE
      ?auto_20586 - HOIST
      ?auto_20587 - SURFACE
      ?auto_20585 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20583 ?auto_20582 ) ( IS-CRATE ?auto_20580 ) ( not ( = ?auto_20579 ?auto_20580 ) ) ( not ( = ?auto_20589 ?auto_20579 ) ) ( not ( = ?auto_20589 ?auto_20580 ) ) ( not ( = ?auto_20581 ?auto_20582 ) ) ( HOIST-AT ?auto_20588 ?auto_20581 ) ( not ( = ?auto_20583 ?auto_20588 ) ) ( AVAILABLE ?auto_20588 ) ( SURFACE-AT ?auto_20580 ?auto_20581 ) ( ON ?auto_20580 ?auto_20584 ) ( CLEAR ?auto_20580 ) ( not ( = ?auto_20579 ?auto_20584 ) ) ( not ( = ?auto_20580 ?auto_20584 ) ) ( not ( = ?auto_20589 ?auto_20584 ) ) ( SURFACE-AT ?auto_20589 ?auto_20582 ) ( CLEAR ?auto_20589 ) ( IS-CRATE ?auto_20579 ) ( AVAILABLE ?auto_20583 ) ( not ( = ?auto_20590 ?auto_20582 ) ) ( not ( = ?auto_20581 ?auto_20590 ) ) ( HOIST-AT ?auto_20586 ?auto_20590 ) ( not ( = ?auto_20583 ?auto_20586 ) ) ( not ( = ?auto_20588 ?auto_20586 ) ) ( AVAILABLE ?auto_20586 ) ( SURFACE-AT ?auto_20579 ?auto_20590 ) ( ON ?auto_20579 ?auto_20587 ) ( CLEAR ?auto_20579 ) ( not ( = ?auto_20579 ?auto_20587 ) ) ( not ( = ?auto_20580 ?auto_20587 ) ) ( not ( = ?auto_20589 ?auto_20587 ) ) ( not ( = ?auto_20584 ?auto_20587 ) ) ( TRUCK-AT ?auto_20585 ?auto_20582 ) )
    :subtasks
    ( ( !DRIVE ?auto_20585 ?auto_20582 ?auto_20590 )
      ( MAKE-2CRATE ?auto_20589 ?auto_20579 ?auto_20580 )
      ( MAKE-1CRATE-VERIFY ?auto_20579 ?auto_20580 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20591 - SURFACE
      ?auto_20592 - SURFACE
      ?auto_20593 - SURFACE
    )
    :vars
    (
      ?auto_20595 - HOIST
      ?auto_20597 - PLACE
      ?auto_20599 - PLACE
      ?auto_20600 - HOIST
      ?auto_20598 - SURFACE
      ?auto_20596 - PLACE
      ?auto_20601 - HOIST
      ?auto_20594 - SURFACE
      ?auto_20602 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20595 ?auto_20597 ) ( IS-CRATE ?auto_20593 ) ( not ( = ?auto_20592 ?auto_20593 ) ) ( not ( = ?auto_20591 ?auto_20592 ) ) ( not ( = ?auto_20591 ?auto_20593 ) ) ( not ( = ?auto_20599 ?auto_20597 ) ) ( HOIST-AT ?auto_20600 ?auto_20599 ) ( not ( = ?auto_20595 ?auto_20600 ) ) ( AVAILABLE ?auto_20600 ) ( SURFACE-AT ?auto_20593 ?auto_20599 ) ( ON ?auto_20593 ?auto_20598 ) ( CLEAR ?auto_20593 ) ( not ( = ?auto_20592 ?auto_20598 ) ) ( not ( = ?auto_20593 ?auto_20598 ) ) ( not ( = ?auto_20591 ?auto_20598 ) ) ( SURFACE-AT ?auto_20591 ?auto_20597 ) ( CLEAR ?auto_20591 ) ( IS-CRATE ?auto_20592 ) ( AVAILABLE ?auto_20595 ) ( not ( = ?auto_20596 ?auto_20597 ) ) ( not ( = ?auto_20599 ?auto_20596 ) ) ( HOIST-AT ?auto_20601 ?auto_20596 ) ( not ( = ?auto_20595 ?auto_20601 ) ) ( not ( = ?auto_20600 ?auto_20601 ) ) ( AVAILABLE ?auto_20601 ) ( SURFACE-AT ?auto_20592 ?auto_20596 ) ( ON ?auto_20592 ?auto_20594 ) ( CLEAR ?auto_20592 ) ( not ( = ?auto_20592 ?auto_20594 ) ) ( not ( = ?auto_20593 ?auto_20594 ) ) ( not ( = ?auto_20591 ?auto_20594 ) ) ( not ( = ?auto_20598 ?auto_20594 ) ) ( TRUCK-AT ?auto_20602 ?auto_20597 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20592 ?auto_20593 )
      ( MAKE-2CRATE-VERIFY ?auto_20591 ?auto_20592 ?auto_20593 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20603 - SURFACE
      ?auto_20604 - SURFACE
      ?auto_20605 - SURFACE
      ?auto_20606 - SURFACE
    )
    :vars
    (
      ?auto_20612 - HOIST
      ?auto_20608 - PLACE
      ?auto_20609 - PLACE
      ?auto_20613 - HOIST
      ?auto_20611 - SURFACE
      ?auto_20607 - PLACE
      ?auto_20614 - HOIST
      ?auto_20615 - SURFACE
      ?auto_20610 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20612 ?auto_20608 ) ( IS-CRATE ?auto_20606 ) ( not ( = ?auto_20605 ?auto_20606 ) ) ( not ( = ?auto_20604 ?auto_20605 ) ) ( not ( = ?auto_20604 ?auto_20606 ) ) ( not ( = ?auto_20609 ?auto_20608 ) ) ( HOIST-AT ?auto_20613 ?auto_20609 ) ( not ( = ?auto_20612 ?auto_20613 ) ) ( AVAILABLE ?auto_20613 ) ( SURFACE-AT ?auto_20606 ?auto_20609 ) ( ON ?auto_20606 ?auto_20611 ) ( CLEAR ?auto_20606 ) ( not ( = ?auto_20605 ?auto_20611 ) ) ( not ( = ?auto_20606 ?auto_20611 ) ) ( not ( = ?auto_20604 ?auto_20611 ) ) ( SURFACE-AT ?auto_20604 ?auto_20608 ) ( CLEAR ?auto_20604 ) ( IS-CRATE ?auto_20605 ) ( AVAILABLE ?auto_20612 ) ( not ( = ?auto_20607 ?auto_20608 ) ) ( not ( = ?auto_20609 ?auto_20607 ) ) ( HOIST-AT ?auto_20614 ?auto_20607 ) ( not ( = ?auto_20612 ?auto_20614 ) ) ( not ( = ?auto_20613 ?auto_20614 ) ) ( AVAILABLE ?auto_20614 ) ( SURFACE-AT ?auto_20605 ?auto_20607 ) ( ON ?auto_20605 ?auto_20615 ) ( CLEAR ?auto_20605 ) ( not ( = ?auto_20605 ?auto_20615 ) ) ( not ( = ?auto_20606 ?auto_20615 ) ) ( not ( = ?auto_20604 ?auto_20615 ) ) ( not ( = ?auto_20611 ?auto_20615 ) ) ( TRUCK-AT ?auto_20610 ?auto_20608 ) ( ON ?auto_20604 ?auto_20603 ) ( not ( = ?auto_20603 ?auto_20604 ) ) ( not ( = ?auto_20603 ?auto_20605 ) ) ( not ( = ?auto_20603 ?auto_20606 ) ) ( not ( = ?auto_20603 ?auto_20611 ) ) ( not ( = ?auto_20603 ?auto_20615 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20604 ?auto_20605 ?auto_20606 )
      ( MAKE-3CRATE-VERIFY ?auto_20603 ?auto_20604 ?auto_20605 ?auto_20606 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20616 - SURFACE
      ?auto_20617 - SURFACE
    )
    :vars
    (
      ?auto_20623 - HOIST
      ?auto_20619 - PLACE
      ?auto_20625 - SURFACE
      ?auto_20620 - PLACE
      ?auto_20624 - HOIST
      ?auto_20622 - SURFACE
      ?auto_20618 - PLACE
      ?auto_20626 - HOIST
      ?auto_20627 - SURFACE
      ?auto_20621 - TRUCK
      ?auto_20628 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20623 ?auto_20619 ) ( IS-CRATE ?auto_20617 ) ( not ( = ?auto_20616 ?auto_20617 ) ) ( not ( = ?auto_20625 ?auto_20616 ) ) ( not ( = ?auto_20625 ?auto_20617 ) ) ( not ( = ?auto_20620 ?auto_20619 ) ) ( HOIST-AT ?auto_20624 ?auto_20620 ) ( not ( = ?auto_20623 ?auto_20624 ) ) ( AVAILABLE ?auto_20624 ) ( SURFACE-AT ?auto_20617 ?auto_20620 ) ( ON ?auto_20617 ?auto_20622 ) ( CLEAR ?auto_20617 ) ( not ( = ?auto_20616 ?auto_20622 ) ) ( not ( = ?auto_20617 ?auto_20622 ) ) ( not ( = ?auto_20625 ?auto_20622 ) ) ( IS-CRATE ?auto_20616 ) ( not ( = ?auto_20618 ?auto_20619 ) ) ( not ( = ?auto_20620 ?auto_20618 ) ) ( HOIST-AT ?auto_20626 ?auto_20618 ) ( not ( = ?auto_20623 ?auto_20626 ) ) ( not ( = ?auto_20624 ?auto_20626 ) ) ( AVAILABLE ?auto_20626 ) ( SURFACE-AT ?auto_20616 ?auto_20618 ) ( ON ?auto_20616 ?auto_20627 ) ( CLEAR ?auto_20616 ) ( not ( = ?auto_20616 ?auto_20627 ) ) ( not ( = ?auto_20617 ?auto_20627 ) ) ( not ( = ?auto_20625 ?auto_20627 ) ) ( not ( = ?auto_20622 ?auto_20627 ) ) ( TRUCK-AT ?auto_20621 ?auto_20619 ) ( SURFACE-AT ?auto_20628 ?auto_20619 ) ( CLEAR ?auto_20628 ) ( LIFTING ?auto_20623 ?auto_20625 ) ( IS-CRATE ?auto_20625 ) ( not ( = ?auto_20628 ?auto_20625 ) ) ( not ( = ?auto_20616 ?auto_20628 ) ) ( not ( = ?auto_20617 ?auto_20628 ) ) ( not ( = ?auto_20622 ?auto_20628 ) ) ( not ( = ?auto_20627 ?auto_20628 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20628 ?auto_20625 )
      ( MAKE-2CRATE ?auto_20625 ?auto_20616 ?auto_20617 )
      ( MAKE-1CRATE-VERIFY ?auto_20616 ?auto_20617 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20629 - SURFACE
      ?auto_20630 - SURFACE
      ?auto_20631 - SURFACE
    )
    :vars
    (
      ?auto_20633 - HOIST
      ?auto_20641 - PLACE
      ?auto_20637 - PLACE
      ?auto_20632 - HOIST
      ?auto_20639 - SURFACE
      ?auto_20635 - PLACE
      ?auto_20640 - HOIST
      ?auto_20636 - SURFACE
      ?auto_20638 - TRUCK
      ?auto_20634 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20633 ?auto_20641 ) ( IS-CRATE ?auto_20631 ) ( not ( = ?auto_20630 ?auto_20631 ) ) ( not ( = ?auto_20629 ?auto_20630 ) ) ( not ( = ?auto_20629 ?auto_20631 ) ) ( not ( = ?auto_20637 ?auto_20641 ) ) ( HOIST-AT ?auto_20632 ?auto_20637 ) ( not ( = ?auto_20633 ?auto_20632 ) ) ( AVAILABLE ?auto_20632 ) ( SURFACE-AT ?auto_20631 ?auto_20637 ) ( ON ?auto_20631 ?auto_20639 ) ( CLEAR ?auto_20631 ) ( not ( = ?auto_20630 ?auto_20639 ) ) ( not ( = ?auto_20631 ?auto_20639 ) ) ( not ( = ?auto_20629 ?auto_20639 ) ) ( IS-CRATE ?auto_20630 ) ( not ( = ?auto_20635 ?auto_20641 ) ) ( not ( = ?auto_20637 ?auto_20635 ) ) ( HOIST-AT ?auto_20640 ?auto_20635 ) ( not ( = ?auto_20633 ?auto_20640 ) ) ( not ( = ?auto_20632 ?auto_20640 ) ) ( AVAILABLE ?auto_20640 ) ( SURFACE-AT ?auto_20630 ?auto_20635 ) ( ON ?auto_20630 ?auto_20636 ) ( CLEAR ?auto_20630 ) ( not ( = ?auto_20630 ?auto_20636 ) ) ( not ( = ?auto_20631 ?auto_20636 ) ) ( not ( = ?auto_20629 ?auto_20636 ) ) ( not ( = ?auto_20639 ?auto_20636 ) ) ( TRUCK-AT ?auto_20638 ?auto_20641 ) ( SURFACE-AT ?auto_20634 ?auto_20641 ) ( CLEAR ?auto_20634 ) ( LIFTING ?auto_20633 ?auto_20629 ) ( IS-CRATE ?auto_20629 ) ( not ( = ?auto_20634 ?auto_20629 ) ) ( not ( = ?auto_20630 ?auto_20634 ) ) ( not ( = ?auto_20631 ?auto_20634 ) ) ( not ( = ?auto_20639 ?auto_20634 ) ) ( not ( = ?auto_20636 ?auto_20634 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20630 ?auto_20631 )
      ( MAKE-2CRATE-VERIFY ?auto_20629 ?auto_20630 ?auto_20631 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20642 - SURFACE
      ?auto_20643 - SURFACE
      ?auto_20644 - SURFACE
      ?auto_20645 - SURFACE
    )
    :vars
    (
      ?auto_20646 - HOIST
      ?auto_20648 - PLACE
      ?auto_20651 - PLACE
      ?auto_20653 - HOIST
      ?auto_20649 - SURFACE
      ?auto_20654 - PLACE
      ?auto_20647 - HOIST
      ?auto_20652 - SURFACE
      ?auto_20650 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20646 ?auto_20648 ) ( IS-CRATE ?auto_20645 ) ( not ( = ?auto_20644 ?auto_20645 ) ) ( not ( = ?auto_20643 ?auto_20644 ) ) ( not ( = ?auto_20643 ?auto_20645 ) ) ( not ( = ?auto_20651 ?auto_20648 ) ) ( HOIST-AT ?auto_20653 ?auto_20651 ) ( not ( = ?auto_20646 ?auto_20653 ) ) ( AVAILABLE ?auto_20653 ) ( SURFACE-AT ?auto_20645 ?auto_20651 ) ( ON ?auto_20645 ?auto_20649 ) ( CLEAR ?auto_20645 ) ( not ( = ?auto_20644 ?auto_20649 ) ) ( not ( = ?auto_20645 ?auto_20649 ) ) ( not ( = ?auto_20643 ?auto_20649 ) ) ( IS-CRATE ?auto_20644 ) ( not ( = ?auto_20654 ?auto_20648 ) ) ( not ( = ?auto_20651 ?auto_20654 ) ) ( HOIST-AT ?auto_20647 ?auto_20654 ) ( not ( = ?auto_20646 ?auto_20647 ) ) ( not ( = ?auto_20653 ?auto_20647 ) ) ( AVAILABLE ?auto_20647 ) ( SURFACE-AT ?auto_20644 ?auto_20654 ) ( ON ?auto_20644 ?auto_20652 ) ( CLEAR ?auto_20644 ) ( not ( = ?auto_20644 ?auto_20652 ) ) ( not ( = ?auto_20645 ?auto_20652 ) ) ( not ( = ?auto_20643 ?auto_20652 ) ) ( not ( = ?auto_20649 ?auto_20652 ) ) ( TRUCK-AT ?auto_20650 ?auto_20648 ) ( SURFACE-AT ?auto_20642 ?auto_20648 ) ( CLEAR ?auto_20642 ) ( LIFTING ?auto_20646 ?auto_20643 ) ( IS-CRATE ?auto_20643 ) ( not ( = ?auto_20642 ?auto_20643 ) ) ( not ( = ?auto_20644 ?auto_20642 ) ) ( not ( = ?auto_20645 ?auto_20642 ) ) ( not ( = ?auto_20649 ?auto_20642 ) ) ( not ( = ?auto_20652 ?auto_20642 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20643 ?auto_20644 ?auto_20645 )
      ( MAKE-3CRATE-VERIFY ?auto_20642 ?auto_20643 ?auto_20644 ?auto_20645 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20655 - SURFACE
      ?auto_20656 - SURFACE
    )
    :vars
    (
      ?auto_20657 - HOIST
      ?auto_20660 - PLACE
      ?auto_20659 - SURFACE
      ?auto_20663 - PLACE
      ?auto_20666 - HOIST
      ?auto_20661 - SURFACE
      ?auto_20667 - PLACE
      ?auto_20658 - HOIST
      ?auto_20664 - SURFACE
      ?auto_20662 - TRUCK
      ?auto_20665 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20657 ?auto_20660 ) ( IS-CRATE ?auto_20656 ) ( not ( = ?auto_20655 ?auto_20656 ) ) ( not ( = ?auto_20659 ?auto_20655 ) ) ( not ( = ?auto_20659 ?auto_20656 ) ) ( not ( = ?auto_20663 ?auto_20660 ) ) ( HOIST-AT ?auto_20666 ?auto_20663 ) ( not ( = ?auto_20657 ?auto_20666 ) ) ( AVAILABLE ?auto_20666 ) ( SURFACE-AT ?auto_20656 ?auto_20663 ) ( ON ?auto_20656 ?auto_20661 ) ( CLEAR ?auto_20656 ) ( not ( = ?auto_20655 ?auto_20661 ) ) ( not ( = ?auto_20656 ?auto_20661 ) ) ( not ( = ?auto_20659 ?auto_20661 ) ) ( IS-CRATE ?auto_20655 ) ( not ( = ?auto_20667 ?auto_20660 ) ) ( not ( = ?auto_20663 ?auto_20667 ) ) ( HOIST-AT ?auto_20658 ?auto_20667 ) ( not ( = ?auto_20657 ?auto_20658 ) ) ( not ( = ?auto_20666 ?auto_20658 ) ) ( AVAILABLE ?auto_20658 ) ( SURFACE-AT ?auto_20655 ?auto_20667 ) ( ON ?auto_20655 ?auto_20664 ) ( CLEAR ?auto_20655 ) ( not ( = ?auto_20655 ?auto_20664 ) ) ( not ( = ?auto_20656 ?auto_20664 ) ) ( not ( = ?auto_20659 ?auto_20664 ) ) ( not ( = ?auto_20661 ?auto_20664 ) ) ( TRUCK-AT ?auto_20662 ?auto_20660 ) ( SURFACE-AT ?auto_20665 ?auto_20660 ) ( CLEAR ?auto_20665 ) ( IS-CRATE ?auto_20659 ) ( not ( = ?auto_20665 ?auto_20659 ) ) ( not ( = ?auto_20655 ?auto_20665 ) ) ( not ( = ?auto_20656 ?auto_20665 ) ) ( not ( = ?auto_20661 ?auto_20665 ) ) ( not ( = ?auto_20664 ?auto_20665 ) ) ( AVAILABLE ?auto_20657 ) ( IN ?auto_20659 ?auto_20662 ) )
    :subtasks
    ( ( !UNLOAD ?auto_20657 ?auto_20659 ?auto_20662 ?auto_20660 )
      ( MAKE-2CRATE ?auto_20659 ?auto_20655 ?auto_20656 )
      ( MAKE-1CRATE-VERIFY ?auto_20655 ?auto_20656 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20668 - SURFACE
      ?auto_20669 - SURFACE
      ?auto_20670 - SURFACE
    )
    :vars
    (
      ?auto_20674 - HOIST
      ?auto_20673 - PLACE
      ?auto_20677 - PLACE
      ?auto_20678 - HOIST
      ?auto_20676 - SURFACE
      ?auto_20680 - PLACE
      ?auto_20679 - HOIST
      ?auto_20671 - SURFACE
      ?auto_20675 - TRUCK
      ?auto_20672 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20674 ?auto_20673 ) ( IS-CRATE ?auto_20670 ) ( not ( = ?auto_20669 ?auto_20670 ) ) ( not ( = ?auto_20668 ?auto_20669 ) ) ( not ( = ?auto_20668 ?auto_20670 ) ) ( not ( = ?auto_20677 ?auto_20673 ) ) ( HOIST-AT ?auto_20678 ?auto_20677 ) ( not ( = ?auto_20674 ?auto_20678 ) ) ( AVAILABLE ?auto_20678 ) ( SURFACE-AT ?auto_20670 ?auto_20677 ) ( ON ?auto_20670 ?auto_20676 ) ( CLEAR ?auto_20670 ) ( not ( = ?auto_20669 ?auto_20676 ) ) ( not ( = ?auto_20670 ?auto_20676 ) ) ( not ( = ?auto_20668 ?auto_20676 ) ) ( IS-CRATE ?auto_20669 ) ( not ( = ?auto_20680 ?auto_20673 ) ) ( not ( = ?auto_20677 ?auto_20680 ) ) ( HOIST-AT ?auto_20679 ?auto_20680 ) ( not ( = ?auto_20674 ?auto_20679 ) ) ( not ( = ?auto_20678 ?auto_20679 ) ) ( AVAILABLE ?auto_20679 ) ( SURFACE-AT ?auto_20669 ?auto_20680 ) ( ON ?auto_20669 ?auto_20671 ) ( CLEAR ?auto_20669 ) ( not ( = ?auto_20669 ?auto_20671 ) ) ( not ( = ?auto_20670 ?auto_20671 ) ) ( not ( = ?auto_20668 ?auto_20671 ) ) ( not ( = ?auto_20676 ?auto_20671 ) ) ( TRUCK-AT ?auto_20675 ?auto_20673 ) ( SURFACE-AT ?auto_20672 ?auto_20673 ) ( CLEAR ?auto_20672 ) ( IS-CRATE ?auto_20668 ) ( not ( = ?auto_20672 ?auto_20668 ) ) ( not ( = ?auto_20669 ?auto_20672 ) ) ( not ( = ?auto_20670 ?auto_20672 ) ) ( not ( = ?auto_20676 ?auto_20672 ) ) ( not ( = ?auto_20671 ?auto_20672 ) ) ( AVAILABLE ?auto_20674 ) ( IN ?auto_20668 ?auto_20675 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20669 ?auto_20670 )
      ( MAKE-2CRATE-VERIFY ?auto_20668 ?auto_20669 ?auto_20670 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20681 - SURFACE
      ?auto_20682 - SURFACE
      ?auto_20683 - SURFACE
      ?auto_20684 - SURFACE
    )
    :vars
    (
      ?auto_20688 - HOIST
      ?auto_20689 - PLACE
      ?auto_20685 - PLACE
      ?auto_20691 - HOIST
      ?auto_20693 - SURFACE
      ?auto_20690 - PLACE
      ?auto_20687 - HOIST
      ?auto_20686 - SURFACE
      ?auto_20692 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20688 ?auto_20689 ) ( IS-CRATE ?auto_20684 ) ( not ( = ?auto_20683 ?auto_20684 ) ) ( not ( = ?auto_20682 ?auto_20683 ) ) ( not ( = ?auto_20682 ?auto_20684 ) ) ( not ( = ?auto_20685 ?auto_20689 ) ) ( HOIST-AT ?auto_20691 ?auto_20685 ) ( not ( = ?auto_20688 ?auto_20691 ) ) ( AVAILABLE ?auto_20691 ) ( SURFACE-AT ?auto_20684 ?auto_20685 ) ( ON ?auto_20684 ?auto_20693 ) ( CLEAR ?auto_20684 ) ( not ( = ?auto_20683 ?auto_20693 ) ) ( not ( = ?auto_20684 ?auto_20693 ) ) ( not ( = ?auto_20682 ?auto_20693 ) ) ( IS-CRATE ?auto_20683 ) ( not ( = ?auto_20690 ?auto_20689 ) ) ( not ( = ?auto_20685 ?auto_20690 ) ) ( HOIST-AT ?auto_20687 ?auto_20690 ) ( not ( = ?auto_20688 ?auto_20687 ) ) ( not ( = ?auto_20691 ?auto_20687 ) ) ( AVAILABLE ?auto_20687 ) ( SURFACE-AT ?auto_20683 ?auto_20690 ) ( ON ?auto_20683 ?auto_20686 ) ( CLEAR ?auto_20683 ) ( not ( = ?auto_20683 ?auto_20686 ) ) ( not ( = ?auto_20684 ?auto_20686 ) ) ( not ( = ?auto_20682 ?auto_20686 ) ) ( not ( = ?auto_20693 ?auto_20686 ) ) ( TRUCK-AT ?auto_20692 ?auto_20689 ) ( SURFACE-AT ?auto_20681 ?auto_20689 ) ( CLEAR ?auto_20681 ) ( IS-CRATE ?auto_20682 ) ( not ( = ?auto_20681 ?auto_20682 ) ) ( not ( = ?auto_20683 ?auto_20681 ) ) ( not ( = ?auto_20684 ?auto_20681 ) ) ( not ( = ?auto_20693 ?auto_20681 ) ) ( not ( = ?auto_20686 ?auto_20681 ) ) ( AVAILABLE ?auto_20688 ) ( IN ?auto_20682 ?auto_20692 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20682 ?auto_20683 ?auto_20684 )
      ( MAKE-3CRATE-VERIFY ?auto_20681 ?auto_20682 ?auto_20683 ?auto_20684 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20694 - SURFACE
      ?auto_20695 - SURFACE
    )
    :vars
    (
      ?auto_20699 - HOIST
      ?auto_20700 - PLACE
      ?auto_20702 - SURFACE
      ?auto_20696 - PLACE
      ?auto_20703 - HOIST
      ?auto_20706 - SURFACE
      ?auto_20701 - PLACE
      ?auto_20698 - HOIST
      ?auto_20697 - SURFACE
      ?auto_20705 - SURFACE
      ?auto_20704 - TRUCK
      ?auto_20707 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20699 ?auto_20700 ) ( IS-CRATE ?auto_20695 ) ( not ( = ?auto_20694 ?auto_20695 ) ) ( not ( = ?auto_20702 ?auto_20694 ) ) ( not ( = ?auto_20702 ?auto_20695 ) ) ( not ( = ?auto_20696 ?auto_20700 ) ) ( HOIST-AT ?auto_20703 ?auto_20696 ) ( not ( = ?auto_20699 ?auto_20703 ) ) ( AVAILABLE ?auto_20703 ) ( SURFACE-AT ?auto_20695 ?auto_20696 ) ( ON ?auto_20695 ?auto_20706 ) ( CLEAR ?auto_20695 ) ( not ( = ?auto_20694 ?auto_20706 ) ) ( not ( = ?auto_20695 ?auto_20706 ) ) ( not ( = ?auto_20702 ?auto_20706 ) ) ( IS-CRATE ?auto_20694 ) ( not ( = ?auto_20701 ?auto_20700 ) ) ( not ( = ?auto_20696 ?auto_20701 ) ) ( HOIST-AT ?auto_20698 ?auto_20701 ) ( not ( = ?auto_20699 ?auto_20698 ) ) ( not ( = ?auto_20703 ?auto_20698 ) ) ( AVAILABLE ?auto_20698 ) ( SURFACE-AT ?auto_20694 ?auto_20701 ) ( ON ?auto_20694 ?auto_20697 ) ( CLEAR ?auto_20694 ) ( not ( = ?auto_20694 ?auto_20697 ) ) ( not ( = ?auto_20695 ?auto_20697 ) ) ( not ( = ?auto_20702 ?auto_20697 ) ) ( not ( = ?auto_20706 ?auto_20697 ) ) ( SURFACE-AT ?auto_20705 ?auto_20700 ) ( CLEAR ?auto_20705 ) ( IS-CRATE ?auto_20702 ) ( not ( = ?auto_20705 ?auto_20702 ) ) ( not ( = ?auto_20694 ?auto_20705 ) ) ( not ( = ?auto_20695 ?auto_20705 ) ) ( not ( = ?auto_20706 ?auto_20705 ) ) ( not ( = ?auto_20697 ?auto_20705 ) ) ( AVAILABLE ?auto_20699 ) ( IN ?auto_20702 ?auto_20704 ) ( TRUCK-AT ?auto_20704 ?auto_20707 ) ( not ( = ?auto_20707 ?auto_20700 ) ) ( not ( = ?auto_20696 ?auto_20707 ) ) ( not ( = ?auto_20701 ?auto_20707 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20704 ?auto_20707 ?auto_20700 )
      ( MAKE-2CRATE ?auto_20702 ?auto_20694 ?auto_20695 )
      ( MAKE-1CRATE-VERIFY ?auto_20694 ?auto_20695 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20708 - SURFACE
      ?auto_20709 - SURFACE
      ?auto_20710 - SURFACE
    )
    :vars
    (
      ?auto_20714 - HOIST
      ?auto_20719 - PLACE
      ?auto_20715 - PLACE
      ?auto_20713 - HOIST
      ?auto_20721 - SURFACE
      ?auto_20720 - PLACE
      ?auto_20716 - HOIST
      ?auto_20717 - SURFACE
      ?auto_20718 - SURFACE
      ?auto_20711 - TRUCK
      ?auto_20712 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20714 ?auto_20719 ) ( IS-CRATE ?auto_20710 ) ( not ( = ?auto_20709 ?auto_20710 ) ) ( not ( = ?auto_20708 ?auto_20709 ) ) ( not ( = ?auto_20708 ?auto_20710 ) ) ( not ( = ?auto_20715 ?auto_20719 ) ) ( HOIST-AT ?auto_20713 ?auto_20715 ) ( not ( = ?auto_20714 ?auto_20713 ) ) ( AVAILABLE ?auto_20713 ) ( SURFACE-AT ?auto_20710 ?auto_20715 ) ( ON ?auto_20710 ?auto_20721 ) ( CLEAR ?auto_20710 ) ( not ( = ?auto_20709 ?auto_20721 ) ) ( not ( = ?auto_20710 ?auto_20721 ) ) ( not ( = ?auto_20708 ?auto_20721 ) ) ( IS-CRATE ?auto_20709 ) ( not ( = ?auto_20720 ?auto_20719 ) ) ( not ( = ?auto_20715 ?auto_20720 ) ) ( HOIST-AT ?auto_20716 ?auto_20720 ) ( not ( = ?auto_20714 ?auto_20716 ) ) ( not ( = ?auto_20713 ?auto_20716 ) ) ( AVAILABLE ?auto_20716 ) ( SURFACE-AT ?auto_20709 ?auto_20720 ) ( ON ?auto_20709 ?auto_20717 ) ( CLEAR ?auto_20709 ) ( not ( = ?auto_20709 ?auto_20717 ) ) ( not ( = ?auto_20710 ?auto_20717 ) ) ( not ( = ?auto_20708 ?auto_20717 ) ) ( not ( = ?auto_20721 ?auto_20717 ) ) ( SURFACE-AT ?auto_20718 ?auto_20719 ) ( CLEAR ?auto_20718 ) ( IS-CRATE ?auto_20708 ) ( not ( = ?auto_20718 ?auto_20708 ) ) ( not ( = ?auto_20709 ?auto_20718 ) ) ( not ( = ?auto_20710 ?auto_20718 ) ) ( not ( = ?auto_20721 ?auto_20718 ) ) ( not ( = ?auto_20717 ?auto_20718 ) ) ( AVAILABLE ?auto_20714 ) ( IN ?auto_20708 ?auto_20711 ) ( TRUCK-AT ?auto_20711 ?auto_20712 ) ( not ( = ?auto_20712 ?auto_20719 ) ) ( not ( = ?auto_20715 ?auto_20712 ) ) ( not ( = ?auto_20720 ?auto_20712 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20709 ?auto_20710 )
      ( MAKE-2CRATE-VERIFY ?auto_20708 ?auto_20709 ?auto_20710 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20722 - SURFACE
      ?auto_20723 - SURFACE
      ?auto_20724 - SURFACE
      ?auto_20725 - SURFACE
    )
    :vars
    (
      ?auto_20726 - HOIST
      ?auto_20727 - PLACE
      ?auto_20731 - PLACE
      ?auto_20728 - HOIST
      ?auto_20733 - SURFACE
      ?auto_20735 - PLACE
      ?auto_20732 - HOIST
      ?auto_20729 - SURFACE
      ?auto_20734 - TRUCK
      ?auto_20730 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20726 ?auto_20727 ) ( IS-CRATE ?auto_20725 ) ( not ( = ?auto_20724 ?auto_20725 ) ) ( not ( = ?auto_20723 ?auto_20724 ) ) ( not ( = ?auto_20723 ?auto_20725 ) ) ( not ( = ?auto_20731 ?auto_20727 ) ) ( HOIST-AT ?auto_20728 ?auto_20731 ) ( not ( = ?auto_20726 ?auto_20728 ) ) ( AVAILABLE ?auto_20728 ) ( SURFACE-AT ?auto_20725 ?auto_20731 ) ( ON ?auto_20725 ?auto_20733 ) ( CLEAR ?auto_20725 ) ( not ( = ?auto_20724 ?auto_20733 ) ) ( not ( = ?auto_20725 ?auto_20733 ) ) ( not ( = ?auto_20723 ?auto_20733 ) ) ( IS-CRATE ?auto_20724 ) ( not ( = ?auto_20735 ?auto_20727 ) ) ( not ( = ?auto_20731 ?auto_20735 ) ) ( HOIST-AT ?auto_20732 ?auto_20735 ) ( not ( = ?auto_20726 ?auto_20732 ) ) ( not ( = ?auto_20728 ?auto_20732 ) ) ( AVAILABLE ?auto_20732 ) ( SURFACE-AT ?auto_20724 ?auto_20735 ) ( ON ?auto_20724 ?auto_20729 ) ( CLEAR ?auto_20724 ) ( not ( = ?auto_20724 ?auto_20729 ) ) ( not ( = ?auto_20725 ?auto_20729 ) ) ( not ( = ?auto_20723 ?auto_20729 ) ) ( not ( = ?auto_20733 ?auto_20729 ) ) ( SURFACE-AT ?auto_20722 ?auto_20727 ) ( CLEAR ?auto_20722 ) ( IS-CRATE ?auto_20723 ) ( not ( = ?auto_20722 ?auto_20723 ) ) ( not ( = ?auto_20724 ?auto_20722 ) ) ( not ( = ?auto_20725 ?auto_20722 ) ) ( not ( = ?auto_20733 ?auto_20722 ) ) ( not ( = ?auto_20729 ?auto_20722 ) ) ( AVAILABLE ?auto_20726 ) ( IN ?auto_20723 ?auto_20734 ) ( TRUCK-AT ?auto_20734 ?auto_20730 ) ( not ( = ?auto_20730 ?auto_20727 ) ) ( not ( = ?auto_20731 ?auto_20730 ) ) ( not ( = ?auto_20735 ?auto_20730 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20723 ?auto_20724 ?auto_20725 )
      ( MAKE-3CRATE-VERIFY ?auto_20722 ?auto_20723 ?auto_20724 ?auto_20725 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20736 - SURFACE
      ?auto_20737 - SURFACE
    )
    :vars
    (
      ?auto_20738 - HOIST
      ?auto_20739 - PLACE
      ?auto_20741 - SURFACE
      ?auto_20744 - PLACE
      ?auto_20740 - HOIST
      ?auto_20746 - SURFACE
      ?auto_20748 - PLACE
      ?auto_20745 - HOIST
      ?auto_20742 - SURFACE
      ?auto_20749 - SURFACE
      ?auto_20747 - TRUCK
      ?auto_20743 - PLACE
      ?auto_20750 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20738 ?auto_20739 ) ( IS-CRATE ?auto_20737 ) ( not ( = ?auto_20736 ?auto_20737 ) ) ( not ( = ?auto_20741 ?auto_20736 ) ) ( not ( = ?auto_20741 ?auto_20737 ) ) ( not ( = ?auto_20744 ?auto_20739 ) ) ( HOIST-AT ?auto_20740 ?auto_20744 ) ( not ( = ?auto_20738 ?auto_20740 ) ) ( AVAILABLE ?auto_20740 ) ( SURFACE-AT ?auto_20737 ?auto_20744 ) ( ON ?auto_20737 ?auto_20746 ) ( CLEAR ?auto_20737 ) ( not ( = ?auto_20736 ?auto_20746 ) ) ( not ( = ?auto_20737 ?auto_20746 ) ) ( not ( = ?auto_20741 ?auto_20746 ) ) ( IS-CRATE ?auto_20736 ) ( not ( = ?auto_20748 ?auto_20739 ) ) ( not ( = ?auto_20744 ?auto_20748 ) ) ( HOIST-AT ?auto_20745 ?auto_20748 ) ( not ( = ?auto_20738 ?auto_20745 ) ) ( not ( = ?auto_20740 ?auto_20745 ) ) ( AVAILABLE ?auto_20745 ) ( SURFACE-AT ?auto_20736 ?auto_20748 ) ( ON ?auto_20736 ?auto_20742 ) ( CLEAR ?auto_20736 ) ( not ( = ?auto_20736 ?auto_20742 ) ) ( not ( = ?auto_20737 ?auto_20742 ) ) ( not ( = ?auto_20741 ?auto_20742 ) ) ( not ( = ?auto_20746 ?auto_20742 ) ) ( SURFACE-AT ?auto_20749 ?auto_20739 ) ( CLEAR ?auto_20749 ) ( IS-CRATE ?auto_20741 ) ( not ( = ?auto_20749 ?auto_20741 ) ) ( not ( = ?auto_20736 ?auto_20749 ) ) ( not ( = ?auto_20737 ?auto_20749 ) ) ( not ( = ?auto_20746 ?auto_20749 ) ) ( not ( = ?auto_20742 ?auto_20749 ) ) ( AVAILABLE ?auto_20738 ) ( TRUCK-AT ?auto_20747 ?auto_20743 ) ( not ( = ?auto_20743 ?auto_20739 ) ) ( not ( = ?auto_20744 ?auto_20743 ) ) ( not ( = ?auto_20748 ?auto_20743 ) ) ( HOIST-AT ?auto_20750 ?auto_20743 ) ( LIFTING ?auto_20750 ?auto_20741 ) ( not ( = ?auto_20738 ?auto_20750 ) ) ( not ( = ?auto_20740 ?auto_20750 ) ) ( not ( = ?auto_20745 ?auto_20750 ) ) )
    :subtasks
    ( ( !LOAD ?auto_20750 ?auto_20741 ?auto_20747 ?auto_20743 )
      ( MAKE-2CRATE ?auto_20741 ?auto_20736 ?auto_20737 )
      ( MAKE-1CRATE-VERIFY ?auto_20736 ?auto_20737 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20751 - SURFACE
      ?auto_20752 - SURFACE
      ?auto_20753 - SURFACE
    )
    :vars
    (
      ?auto_20761 - HOIST
      ?auto_20757 - PLACE
      ?auto_20763 - PLACE
      ?auto_20759 - HOIST
      ?auto_20765 - SURFACE
      ?auto_20756 - PLACE
      ?auto_20754 - HOIST
      ?auto_20758 - SURFACE
      ?auto_20762 - SURFACE
      ?auto_20764 - TRUCK
      ?auto_20755 - PLACE
      ?auto_20760 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20761 ?auto_20757 ) ( IS-CRATE ?auto_20753 ) ( not ( = ?auto_20752 ?auto_20753 ) ) ( not ( = ?auto_20751 ?auto_20752 ) ) ( not ( = ?auto_20751 ?auto_20753 ) ) ( not ( = ?auto_20763 ?auto_20757 ) ) ( HOIST-AT ?auto_20759 ?auto_20763 ) ( not ( = ?auto_20761 ?auto_20759 ) ) ( AVAILABLE ?auto_20759 ) ( SURFACE-AT ?auto_20753 ?auto_20763 ) ( ON ?auto_20753 ?auto_20765 ) ( CLEAR ?auto_20753 ) ( not ( = ?auto_20752 ?auto_20765 ) ) ( not ( = ?auto_20753 ?auto_20765 ) ) ( not ( = ?auto_20751 ?auto_20765 ) ) ( IS-CRATE ?auto_20752 ) ( not ( = ?auto_20756 ?auto_20757 ) ) ( not ( = ?auto_20763 ?auto_20756 ) ) ( HOIST-AT ?auto_20754 ?auto_20756 ) ( not ( = ?auto_20761 ?auto_20754 ) ) ( not ( = ?auto_20759 ?auto_20754 ) ) ( AVAILABLE ?auto_20754 ) ( SURFACE-AT ?auto_20752 ?auto_20756 ) ( ON ?auto_20752 ?auto_20758 ) ( CLEAR ?auto_20752 ) ( not ( = ?auto_20752 ?auto_20758 ) ) ( not ( = ?auto_20753 ?auto_20758 ) ) ( not ( = ?auto_20751 ?auto_20758 ) ) ( not ( = ?auto_20765 ?auto_20758 ) ) ( SURFACE-AT ?auto_20762 ?auto_20757 ) ( CLEAR ?auto_20762 ) ( IS-CRATE ?auto_20751 ) ( not ( = ?auto_20762 ?auto_20751 ) ) ( not ( = ?auto_20752 ?auto_20762 ) ) ( not ( = ?auto_20753 ?auto_20762 ) ) ( not ( = ?auto_20765 ?auto_20762 ) ) ( not ( = ?auto_20758 ?auto_20762 ) ) ( AVAILABLE ?auto_20761 ) ( TRUCK-AT ?auto_20764 ?auto_20755 ) ( not ( = ?auto_20755 ?auto_20757 ) ) ( not ( = ?auto_20763 ?auto_20755 ) ) ( not ( = ?auto_20756 ?auto_20755 ) ) ( HOIST-AT ?auto_20760 ?auto_20755 ) ( LIFTING ?auto_20760 ?auto_20751 ) ( not ( = ?auto_20761 ?auto_20760 ) ) ( not ( = ?auto_20759 ?auto_20760 ) ) ( not ( = ?auto_20754 ?auto_20760 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20752 ?auto_20753 )
      ( MAKE-2CRATE-VERIFY ?auto_20751 ?auto_20752 ?auto_20753 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20766 - SURFACE
      ?auto_20767 - SURFACE
      ?auto_20768 - SURFACE
      ?auto_20769 - SURFACE
    )
    :vars
    (
      ?auto_20780 - HOIST
      ?auto_20779 - PLACE
      ?auto_20775 - PLACE
      ?auto_20773 - HOIST
      ?auto_20772 - SURFACE
      ?auto_20771 - PLACE
      ?auto_20776 - HOIST
      ?auto_20778 - SURFACE
      ?auto_20774 - TRUCK
      ?auto_20770 - PLACE
      ?auto_20777 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20780 ?auto_20779 ) ( IS-CRATE ?auto_20769 ) ( not ( = ?auto_20768 ?auto_20769 ) ) ( not ( = ?auto_20767 ?auto_20768 ) ) ( not ( = ?auto_20767 ?auto_20769 ) ) ( not ( = ?auto_20775 ?auto_20779 ) ) ( HOIST-AT ?auto_20773 ?auto_20775 ) ( not ( = ?auto_20780 ?auto_20773 ) ) ( AVAILABLE ?auto_20773 ) ( SURFACE-AT ?auto_20769 ?auto_20775 ) ( ON ?auto_20769 ?auto_20772 ) ( CLEAR ?auto_20769 ) ( not ( = ?auto_20768 ?auto_20772 ) ) ( not ( = ?auto_20769 ?auto_20772 ) ) ( not ( = ?auto_20767 ?auto_20772 ) ) ( IS-CRATE ?auto_20768 ) ( not ( = ?auto_20771 ?auto_20779 ) ) ( not ( = ?auto_20775 ?auto_20771 ) ) ( HOIST-AT ?auto_20776 ?auto_20771 ) ( not ( = ?auto_20780 ?auto_20776 ) ) ( not ( = ?auto_20773 ?auto_20776 ) ) ( AVAILABLE ?auto_20776 ) ( SURFACE-AT ?auto_20768 ?auto_20771 ) ( ON ?auto_20768 ?auto_20778 ) ( CLEAR ?auto_20768 ) ( not ( = ?auto_20768 ?auto_20778 ) ) ( not ( = ?auto_20769 ?auto_20778 ) ) ( not ( = ?auto_20767 ?auto_20778 ) ) ( not ( = ?auto_20772 ?auto_20778 ) ) ( SURFACE-AT ?auto_20766 ?auto_20779 ) ( CLEAR ?auto_20766 ) ( IS-CRATE ?auto_20767 ) ( not ( = ?auto_20766 ?auto_20767 ) ) ( not ( = ?auto_20768 ?auto_20766 ) ) ( not ( = ?auto_20769 ?auto_20766 ) ) ( not ( = ?auto_20772 ?auto_20766 ) ) ( not ( = ?auto_20778 ?auto_20766 ) ) ( AVAILABLE ?auto_20780 ) ( TRUCK-AT ?auto_20774 ?auto_20770 ) ( not ( = ?auto_20770 ?auto_20779 ) ) ( not ( = ?auto_20775 ?auto_20770 ) ) ( not ( = ?auto_20771 ?auto_20770 ) ) ( HOIST-AT ?auto_20777 ?auto_20770 ) ( LIFTING ?auto_20777 ?auto_20767 ) ( not ( = ?auto_20780 ?auto_20777 ) ) ( not ( = ?auto_20773 ?auto_20777 ) ) ( not ( = ?auto_20776 ?auto_20777 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20767 ?auto_20768 ?auto_20769 )
      ( MAKE-3CRATE-VERIFY ?auto_20766 ?auto_20767 ?auto_20768 ?auto_20769 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20781 - SURFACE
      ?auto_20782 - SURFACE
    )
    :vars
    (
      ?auto_20795 - HOIST
      ?auto_20794 - PLACE
      ?auto_20785 - SURFACE
      ?auto_20789 - PLACE
      ?auto_20787 - HOIST
      ?auto_20786 - SURFACE
      ?auto_20784 - PLACE
      ?auto_20790 - HOIST
      ?auto_20793 - SURFACE
      ?auto_20792 - SURFACE
      ?auto_20788 - TRUCK
      ?auto_20783 - PLACE
      ?auto_20791 - HOIST
      ?auto_20796 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20795 ?auto_20794 ) ( IS-CRATE ?auto_20782 ) ( not ( = ?auto_20781 ?auto_20782 ) ) ( not ( = ?auto_20785 ?auto_20781 ) ) ( not ( = ?auto_20785 ?auto_20782 ) ) ( not ( = ?auto_20789 ?auto_20794 ) ) ( HOIST-AT ?auto_20787 ?auto_20789 ) ( not ( = ?auto_20795 ?auto_20787 ) ) ( AVAILABLE ?auto_20787 ) ( SURFACE-AT ?auto_20782 ?auto_20789 ) ( ON ?auto_20782 ?auto_20786 ) ( CLEAR ?auto_20782 ) ( not ( = ?auto_20781 ?auto_20786 ) ) ( not ( = ?auto_20782 ?auto_20786 ) ) ( not ( = ?auto_20785 ?auto_20786 ) ) ( IS-CRATE ?auto_20781 ) ( not ( = ?auto_20784 ?auto_20794 ) ) ( not ( = ?auto_20789 ?auto_20784 ) ) ( HOIST-AT ?auto_20790 ?auto_20784 ) ( not ( = ?auto_20795 ?auto_20790 ) ) ( not ( = ?auto_20787 ?auto_20790 ) ) ( AVAILABLE ?auto_20790 ) ( SURFACE-AT ?auto_20781 ?auto_20784 ) ( ON ?auto_20781 ?auto_20793 ) ( CLEAR ?auto_20781 ) ( not ( = ?auto_20781 ?auto_20793 ) ) ( not ( = ?auto_20782 ?auto_20793 ) ) ( not ( = ?auto_20785 ?auto_20793 ) ) ( not ( = ?auto_20786 ?auto_20793 ) ) ( SURFACE-AT ?auto_20792 ?auto_20794 ) ( CLEAR ?auto_20792 ) ( IS-CRATE ?auto_20785 ) ( not ( = ?auto_20792 ?auto_20785 ) ) ( not ( = ?auto_20781 ?auto_20792 ) ) ( not ( = ?auto_20782 ?auto_20792 ) ) ( not ( = ?auto_20786 ?auto_20792 ) ) ( not ( = ?auto_20793 ?auto_20792 ) ) ( AVAILABLE ?auto_20795 ) ( TRUCK-AT ?auto_20788 ?auto_20783 ) ( not ( = ?auto_20783 ?auto_20794 ) ) ( not ( = ?auto_20789 ?auto_20783 ) ) ( not ( = ?auto_20784 ?auto_20783 ) ) ( HOIST-AT ?auto_20791 ?auto_20783 ) ( not ( = ?auto_20795 ?auto_20791 ) ) ( not ( = ?auto_20787 ?auto_20791 ) ) ( not ( = ?auto_20790 ?auto_20791 ) ) ( AVAILABLE ?auto_20791 ) ( SURFACE-AT ?auto_20785 ?auto_20783 ) ( ON ?auto_20785 ?auto_20796 ) ( CLEAR ?auto_20785 ) ( not ( = ?auto_20781 ?auto_20796 ) ) ( not ( = ?auto_20782 ?auto_20796 ) ) ( not ( = ?auto_20785 ?auto_20796 ) ) ( not ( = ?auto_20786 ?auto_20796 ) ) ( not ( = ?auto_20793 ?auto_20796 ) ) ( not ( = ?auto_20792 ?auto_20796 ) ) )
    :subtasks
    ( ( !LIFT ?auto_20791 ?auto_20785 ?auto_20796 ?auto_20783 )
      ( MAKE-2CRATE ?auto_20785 ?auto_20781 ?auto_20782 )
      ( MAKE-1CRATE-VERIFY ?auto_20781 ?auto_20782 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20797 - SURFACE
      ?auto_20798 - SURFACE
      ?auto_20799 - SURFACE
    )
    :vars
    (
      ?auto_20806 - HOIST
      ?auto_20801 - PLACE
      ?auto_20803 - PLACE
      ?auto_20812 - HOIST
      ?auto_20809 - SURFACE
      ?auto_20811 - PLACE
      ?auto_20810 - HOIST
      ?auto_20805 - SURFACE
      ?auto_20802 - SURFACE
      ?auto_20808 - TRUCK
      ?auto_20807 - PLACE
      ?auto_20800 - HOIST
      ?auto_20804 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20806 ?auto_20801 ) ( IS-CRATE ?auto_20799 ) ( not ( = ?auto_20798 ?auto_20799 ) ) ( not ( = ?auto_20797 ?auto_20798 ) ) ( not ( = ?auto_20797 ?auto_20799 ) ) ( not ( = ?auto_20803 ?auto_20801 ) ) ( HOIST-AT ?auto_20812 ?auto_20803 ) ( not ( = ?auto_20806 ?auto_20812 ) ) ( AVAILABLE ?auto_20812 ) ( SURFACE-AT ?auto_20799 ?auto_20803 ) ( ON ?auto_20799 ?auto_20809 ) ( CLEAR ?auto_20799 ) ( not ( = ?auto_20798 ?auto_20809 ) ) ( not ( = ?auto_20799 ?auto_20809 ) ) ( not ( = ?auto_20797 ?auto_20809 ) ) ( IS-CRATE ?auto_20798 ) ( not ( = ?auto_20811 ?auto_20801 ) ) ( not ( = ?auto_20803 ?auto_20811 ) ) ( HOIST-AT ?auto_20810 ?auto_20811 ) ( not ( = ?auto_20806 ?auto_20810 ) ) ( not ( = ?auto_20812 ?auto_20810 ) ) ( AVAILABLE ?auto_20810 ) ( SURFACE-AT ?auto_20798 ?auto_20811 ) ( ON ?auto_20798 ?auto_20805 ) ( CLEAR ?auto_20798 ) ( not ( = ?auto_20798 ?auto_20805 ) ) ( not ( = ?auto_20799 ?auto_20805 ) ) ( not ( = ?auto_20797 ?auto_20805 ) ) ( not ( = ?auto_20809 ?auto_20805 ) ) ( SURFACE-AT ?auto_20802 ?auto_20801 ) ( CLEAR ?auto_20802 ) ( IS-CRATE ?auto_20797 ) ( not ( = ?auto_20802 ?auto_20797 ) ) ( not ( = ?auto_20798 ?auto_20802 ) ) ( not ( = ?auto_20799 ?auto_20802 ) ) ( not ( = ?auto_20809 ?auto_20802 ) ) ( not ( = ?auto_20805 ?auto_20802 ) ) ( AVAILABLE ?auto_20806 ) ( TRUCK-AT ?auto_20808 ?auto_20807 ) ( not ( = ?auto_20807 ?auto_20801 ) ) ( not ( = ?auto_20803 ?auto_20807 ) ) ( not ( = ?auto_20811 ?auto_20807 ) ) ( HOIST-AT ?auto_20800 ?auto_20807 ) ( not ( = ?auto_20806 ?auto_20800 ) ) ( not ( = ?auto_20812 ?auto_20800 ) ) ( not ( = ?auto_20810 ?auto_20800 ) ) ( AVAILABLE ?auto_20800 ) ( SURFACE-AT ?auto_20797 ?auto_20807 ) ( ON ?auto_20797 ?auto_20804 ) ( CLEAR ?auto_20797 ) ( not ( = ?auto_20798 ?auto_20804 ) ) ( not ( = ?auto_20799 ?auto_20804 ) ) ( not ( = ?auto_20797 ?auto_20804 ) ) ( not ( = ?auto_20809 ?auto_20804 ) ) ( not ( = ?auto_20805 ?auto_20804 ) ) ( not ( = ?auto_20802 ?auto_20804 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20798 ?auto_20799 )
      ( MAKE-2CRATE-VERIFY ?auto_20797 ?auto_20798 ?auto_20799 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20813 - SURFACE
      ?auto_20814 - SURFACE
      ?auto_20815 - SURFACE
      ?auto_20816 - SURFACE
    )
    :vars
    (
      ?auto_20823 - HOIST
      ?auto_20827 - PLACE
      ?auto_20817 - PLACE
      ?auto_20824 - HOIST
      ?auto_20822 - SURFACE
      ?auto_20828 - PLACE
      ?auto_20821 - HOIST
      ?auto_20818 - SURFACE
      ?auto_20819 - TRUCK
      ?auto_20820 - PLACE
      ?auto_20825 - HOIST
      ?auto_20826 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20823 ?auto_20827 ) ( IS-CRATE ?auto_20816 ) ( not ( = ?auto_20815 ?auto_20816 ) ) ( not ( = ?auto_20814 ?auto_20815 ) ) ( not ( = ?auto_20814 ?auto_20816 ) ) ( not ( = ?auto_20817 ?auto_20827 ) ) ( HOIST-AT ?auto_20824 ?auto_20817 ) ( not ( = ?auto_20823 ?auto_20824 ) ) ( AVAILABLE ?auto_20824 ) ( SURFACE-AT ?auto_20816 ?auto_20817 ) ( ON ?auto_20816 ?auto_20822 ) ( CLEAR ?auto_20816 ) ( not ( = ?auto_20815 ?auto_20822 ) ) ( not ( = ?auto_20816 ?auto_20822 ) ) ( not ( = ?auto_20814 ?auto_20822 ) ) ( IS-CRATE ?auto_20815 ) ( not ( = ?auto_20828 ?auto_20827 ) ) ( not ( = ?auto_20817 ?auto_20828 ) ) ( HOIST-AT ?auto_20821 ?auto_20828 ) ( not ( = ?auto_20823 ?auto_20821 ) ) ( not ( = ?auto_20824 ?auto_20821 ) ) ( AVAILABLE ?auto_20821 ) ( SURFACE-AT ?auto_20815 ?auto_20828 ) ( ON ?auto_20815 ?auto_20818 ) ( CLEAR ?auto_20815 ) ( not ( = ?auto_20815 ?auto_20818 ) ) ( not ( = ?auto_20816 ?auto_20818 ) ) ( not ( = ?auto_20814 ?auto_20818 ) ) ( not ( = ?auto_20822 ?auto_20818 ) ) ( SURFACE-AT ?auto_20813 ?auto_20827 ) ( CLEAR ?auto_20813 ) ( IS-CRATE ?auto_20814 ) ( not ( = ?auto_20813 ?auto_20814 ) ) ( not ( = ?auto_20815 ?auto_20813 ) ) ( not ( = ?auto_20816 ?auto_20813 ) ) ( not ( = ?auto_20822 ?auto_20813 ) ) ( not ( = ?auto_20818 ?auto_20813 ) ) ( AVAILABLE ?auto_20823 ) ( TRUCK-AT ?auto_20819 ?auto_20820 ) ( not ( = ?auto_20820 ?auto_20827 ) ) ( not ( = ?auto_20817 ?auto_20820 ) ) ( not ( = ?auto_20828 ?auto_20820 ) ) ( HOIST-AT ?auto_20825 ?auto_20820 ) ( not ( = ?auto_20823 ?auto_20825 ) ) ( not ( = ?auto_20824 ?auto_20825 ) ) ( not ( = ?auto_20821 ?auto_20825 ) ) ( AVAILABLE ?auto_20825 ) ( SURFACE-AT ?auto_20814 ?auto_20820 ) ( ON ?auto_20814 ?auto_20826 ) ( CLEAR ?auto_20814 ) ( not ( = ?auto_20815 ?auto_20826 ) ) ( not ( = ?auto_20816 ?auto_20826 ) ) ( not ( = ?auto_20814 ?auto_20826 ) ) ( not ( = ?auto_20822 ?auto_20826 ) ) ( not ( = ?auto_20818 ?auto_20826 ) ) ( not ( = ?auto_20813 ?auto_20826 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20814 ?auto_20815 ?auto_20816 )
      ( MAKE-3CRATE-VERIFY ?auto_20813 ?auto_20814 ?auto_20815 ?auto_20816 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20829 - SURFACE
      ?auto_20830 - SURFACE
    )
    :vars
    (
      ?auto_20837 - HOIST
      ?auto_20843 - PLACE
      ?auto_20838 - SURFACE
      ?auto_20831 - PLACE
      ?auto_20839 - HOIST
      ?auto_20836 - SURFACE
      ?auto_20844 - PLACE
      ?auto_20835 - HOIST
      ?auto_20832 - SURFACE
      ?auto_20840 - SURFACE
      ?auto_20834 - PLACE
      ?auto_20841 - HOIST
      ?auto_20842 - SURFACE
      ?auto_20833 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20837 ?auto_20843 ) ( IS-CRATE ?auto_20830 ) ( not ( = ?auto_20829 ?auto_20830 ) ) ( not ( = ?auto_20838 ?auto_20829 ) ) ( not ( = ?auto_20838 ?auto_20830 ) ) ( not ( = ?auto_20831 ?auto_20843 ) ) ( HOIST-AT ?auto_20839 ?auto_20831 ) ( not ( = ?auto_20837 ?auto_20839 ) ) ( AVAILABLE ?auto_20839 ) ( SURFACE-AT ?auto_20830 ?auto_20831 ) ( ON ?auto_20830 ?auto_20836 ) ( CLEAR ?auto_20830 ) ( not ( = ?auto_20829 ?auto_20836 ) ) ( not ( = ?auto_20830 ?auto_20836 ) ) ( not ( = ?auto_20838 ?auto_20836 ) ) ( IS-CRATE ?auto_20829 ) ( not ( = ?auto_20844 ?auto_20843 ) ) ( not ( = ?auto_20831 ?auto_20844 ) ) ( HOIST-AT ?auto_20835 ?auto_20844 ) ( not ( = ?auto_20837 ?auto_20835 ) ) ( not ( = ?auto_20839 ?auto_20835 ) ) ( AVAILABLE ?auto_20835 ) ( SURFACE-AT ?auto_20829 ?auto_20844 ) ( ON ?auto_20829 ?auto_20832 ) ( CLEAR ?auto_20829 ) ( not ( = ?auto_20829 ?auto_20832 ) ) ( not ( = ?auto_20830 ?auto_20832 ) ) ( not ( = ?auto_20838 ?auto_20832 ) ) ( not ( = ?auto_20836 ?auto_20832 ) ) ( SURFACE-AT ?auto_20840 ?auto_20843 ) ( CLEAR ?auto_20840 ) ( IS-CRATE ?auto_20838 ) ( not ( = ?auto_20840 ?auto_20838 ) ) ( not ( = ?auto_20829 ?auto_20840 ) ) ( not ( = ?auto_20830 ?auto_20840 ) ) ( not ( = ?auto_20836 ?auto_20840 ) ) ( not ( = ?auto_20832 ?auto_20840 ) ) ( AVAILABLE ?auto_20837 ) ( not ( = ?auto_20834 ?auto_20843 ) ) ( not ( = ?auto_20831 ?auto_20834 ) ) ( not ( = ?auto_20844 ?auto_20834 ) ) ( HOIST-AT ?auto_20841 ?auto_20834 ) ( not ( = ?auto_20837 ?auto_20841 ) ) ( not ( = ?auto_20839 ?auto_20841 ) ) ( not ( = ?auto_20835 ?auto_20841 ) ) ( AVAILABLE ?auto_20841 ) ( SURFACE-AT ?auto_20838 ?auto_20834 ) ( ON ?auto_20838 ?auto_20842 ) ( CLEAR ?auto_20838 ) ( not ( = ?auto_20829 ?auto_20842 ) ) ( not ( = ?auto_20830 ?auto_20842 ) ) ( not ( = ?auto_20838 ?auto_20842 ) ) ( not ( = ?auto_20836 ?auto_20842 ) ) ( not ( = ?auto_20832 ?auto_20842 ) ) ( not ( = ?auto_20840 ?auto_20842 ) ) ( TRUCK-AT ?auto_20833 ?auto_20843 ) )
    :subtasks
    ( ( !DRIVE ?auto_20833 ?auto_20843 ?auto_20834 )
      ( MAKE-2CRATE ?auto_20838 ?auto_20829 ?auto_20830 )
      ( MAKE-1CRATE-VERIFY ?auto_20829 ?auto_20830 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20845 - SURFACE
      ?auto_20846 - SURFACE
      ?auto_20847 - SURFACE
    )
    :vars
    (
      ?auto_20850 - HOIST
      ?auto_20857 - PLACE
      ?auto_20851 - PLACE
      ?auto_20858 - HOIST
      ?auto_20856 - SURFACE
      ?auto_20855 - PLACE
      ?auto_20849 - HOIST
      ?auto_20852 - SURFACE
      ?auto_20853 - SURFACE
      ?auto_20859 - PLACE
      ?auto_20860 - HOIST
      ?auto_20854 - SURFACE
      ?auto_20848 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20850 ?auto_20857 ) ( IS-CRATE ?auto_20847 ) ( not ( = ?auto_20846 ?auto_20847 ) ) ( not ( = ?auto_20845 ?auto_20846 ) ) ( not ( = ?auto_20845 ?auto_20847 ) ) ( not ( = ?auto_20851 ?auto_20857 ) ) ( HOIST-AT ?auto_20858 ?auto_20851 ) ( not ( = ?auto_20850 ?auto_20858 ) ) ( AVAILABLE ?auto_20858 ) ( SURFACE-AT ?auto_20847 ?auto_20851 ) ( ON ?auto_20847 ?auto_20856 ) ( CLEAR ?auto_20847 ) ( not ( = ?auto_20846 ?auto_20856 ) ) ( not ( = ?auto_20847 ?auto_20856 ) ) ( not ( = ?auto_20845 ?auto_20856 ) ) ( IS-CRATE ?auto_20846 ) ( not ( = ?auto_20855 ?auto_20857 ) ) ( not ( = ?auto_20851 ?auto_20855 ) ) ( HOIST-AT ?auto_20849 ?auto_20855 ) ( not ( = ?auto_20850 ?auto_20849 ) ) ( not ( = ?auto_20858 ?auto_20849 ) ) ( AVAILABLE ?auto_20849 ) ( SURFACE-AT ?auto_20846 ?auto_20855 ) ( ON ?auto_20846 ?auto_20852 ) ( CLEAR ?auto_20846 ) ( not ( = ?auto_20846 ?auto_20852 ) ) ( not ( = ?auto_20847 ?auto_20852 ) ) ( not ( = ?auto_20845 ?auto_20852 ) ) ( not ( = ?auto_20856 ?auto_20852 ) ) ( SURFACE-AT ?auto_20853 ?auto_20857 ) ( CLEAR ?auto_20853 ) ( IS-CRATE ?auto_20845 ) ( not ( = ?auto_20853 ?auto_20845 ) ) ( not ( = ?auto_20846 ?auto_20853 ) ) ( not ( = ?auto_20847 ?auto_20853 ) ) ( not ( = ?auto_20856 ?auto_20853 ) ) ( not ( = ?auto_20852 ?auto_20853 ) ) ( AVAILABLE ?auto_20850 ) ( not ( = ?auto_20859 ?auto_20857 ) ) ( not ( = ?auto_20851 ?auto_20859 ) ) ( not ( = ?auto_20855 ?auto_20859 ) ) ( HOIST-AT ?auto_20860 ?auto_20859 ) ( not ( = ?auto_20850 ?auto_20860 ) ) ( not ( = ?auto_20858 ?auto_20860 ) ) ( not ( = ?auto_20849 ?auto_20860 ) ) ( AVAILABLE ?auto_20860 ) ( SURFACE-AT ?auto_20845 ?auto_20859 ) ( ON ?auto_20845 ?auto_20854 ) ( CLEAR ?auto_20845 ) ( not ( = ?auto_20846 ?auto_20854 ) ) ( not ( = ?auto_20847 ?auto_20854 ) ) ( not ( = ?auto_20845 ?auto_20854 ) ) ( not ( = ?auto_20856 ?auto_20854 ) ) ( not ( = ?auto_20852 ?auto_20854 ) ) ( not ( = ?auto_20853 ?auto_20854 ) ) ( TRUCK-AT ?auto_20848 ?auto_20857 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20846 ?auto_20847 )
      ( MAKE-2CRATE-VERIFY ?auto_20845 ?auto_20846 ?auto_20847 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20861 - SURFACE
      ?auto_20862 - SURFACE
      ?auto_20863 - SURFACE
      ?auto_20864 - SURFACE
    )
    :vars
    (
      ?auto_20873 - HOIST
      ?auto_20874 - PLACE
      ?auto_20875 - PLACE
      ?auto_20872 - HOIST
      ?auto_20871 - SURFACE
      ?auto_20867 - PLACE
      ?auto_20866 - HOIST
      ?auto_20868 - SURFACE
      ?auto_20869 - PLACE
      ?auto_20876 - HOIST
      ?auto_20865 - SURFACE
      ?auto_20870 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20873 ?auto_20874 ) ( IS-CRATE ?auto_20864 ) ( not ( = ?auto_20863 ?auto_20864 ) ) ( not ( = ?auto_20862 ?auto_20863 ) ) ( not ( = ?auto_20862 ?auto_20864 ) ) ( not ( = ?auto_20875 ?auto_20874 ) ) ( HOIST-AT ?auto_20872 ?auto_20875 ) ( not ( = ?auto_20873 ?auto_20872 ) ) ( AVAILABLE ?auto_20872 ) ( SURFACE-AT ?auto_20864 ?auto_20875 ) ( ON ?auto_20864 ?auto_20871 ) ( CLEAR ?auto_20864 ) ( not ( = ?auto_20863 ?auto_20871 ) ) ( not ( = ?auto_20864 ?auto_20871 ) ) ( not ( = ?auto_20862 ?auto_20871 ) ) ( IS-CRATE ?auto_20863 ) ( not ( = ?auto_20867 ?auto_20874 ) ) ( not ( = ?auto_20875 ?auto_20867 ) ) ( HOIST-AT ?auto_20866 ?auto_20867 ) ( not ( = ?auto_20873 ?auto_20866 ) ) ( not ( = ?auto_20872 ?auto_20866 ) ) ( AVAILABLE ?auto_20866 ) ( SURFACE-AT ?auto_20863 ?auto_20867 ) ( ON ?auto_20863 ?auto_20868 ) ( CLEAR ?auto_20863 ) ( not ( = ?auto_20863 ?auto_20868 ) ) ( not ( = ?auto_20864 ?auto_20868 ) ) ( not ( = ?auto_20862 ?auto_20868 ) ) ( not ( = ?auto_20871 ?auto_20868 ) ) ( SURFACE-AT ?auto_20861 ?auto_20874 ) ( CLEAR ?auto_20861 ) ( IS-CRATE ?auto_20862 ) ( not ( = ?auto_20861 ?auto_20862 ) ) ( not ( = ?auto_20863 ?auto_20861 ) ) ( not ( = ?auto_20864 ?auto_20861 ) ) ( not ( = ?auto_20871 ?auto_20861 ) ) ( not ( = ?auto_20868 ?auto_20861 ) ) ( AVAILABLE ?auto_20873 ) ( not ( = ?auto_20869 ?auto_20874 ) ) ( not ( = ?auto_20875 ?auto_20869 ) ) ( not ( = ?auto_20867 ?auto_20869 ) ) ( HOIST-AT ?auto_20876 ?auto_20869 ) ( not ( = ?auto_20873 ?auto_20876 ) ) ( not ( = ?auto_20872 ?auto_20876 ) ) ( not ( = ?auto_20866 ?auto_20876 ) ) ( AVAILABLE ?auto_20876 ) ( SURFACE-AT ?auto_20862 ?auto_20869 ) ( ON ?auto_20862 ?auto_20865 ) ( CLEAR ?auto_20862 ) ( not ( = ?auto_20863 ?auto_20865 ) ) ( not ( = ?auto_20864 ?auto_20865 ) ) ( not ( = ?auto_20862 ?auto_20865 ) ) ( not ( = ?auto_20871 ?auto_20865 ) ) ( not ( = ?auto_20868 ?auto_20865 ) ) ( not ( = ?auto_20861 ?auto_20865 ) ) ( TRUCK-AT ?auto_20870 ?auto_20874 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20862 ?auto_20863 ?auto_20864 )
      ( MAKE-3CRATE-VERIFY ?auto_20861 ?auto_20862 ?auto_20863 ?auto_20864 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20891 - SURFACE
      ?auto_20892 - SURFACE
    )
    :vars
    (
      ?auto_20893 - HOIST
      ?auto_20894 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20893 ?auto_20894 ) ( SURFACE-AT ?auto_20891 ?auto_20894 ) ( CLEAR ?auto_20891 ) ( LIFTING ?auto_20893 ?auto_20892 ) ( IS-CRATE ?auto_20892 ) ( not ( = ?auto_20891 ?auto_20892 ) ) )
    :subtasks
    ( ( !DROP ?auto_20893 ?auto_20892 ?auto_20891 ?auto_20894 )
      ( MAKE-1CRATE-VERIFY ?auto_20891 ?auto_20892 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20895 - SURFACE
      ?auto_20896 - SURFACE
      ?auto_20897 - SURFACE
    )
    :vars
    (
      ?auto_20898 - HOIST
      ?auto_20899 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20898 ?auto_20899 ) ( SURFACE-AT ?auto_20896 ?auto_20899 ) ( CLEAR ?auto_20896 ) ( LIFTING ?auto_20898 ?auto_20897 ) ( IS-CRATE ?auto_20897 ) ( not ( = ?auto_20896 ?auto_20897 ) ) ( ON ?auto_20896 ?auto_20895 ) ( not ( = ?auto_20895 ?auto_20896 ) ) ( not ( = ?auto_20895 ?auto_20897 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20896 ?auto_20897 )
      ( MAKE-2CRATE-VERIFY ?auto_20895 ?auto_20896 ?auto_20897 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20900 - SURFACE
      ?auto_20901 - SURFACE
      ?auto_20902 - SURFACE
      ?auto_20903 - SURFACE
    )
    :vars
    (
      ?auto_20904 - HOIST
      ?auto_20905 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20904 ?auto_20905 ) ( SURFACE-AT ?auto_20902 ?auto_20905 ) ( CLEAR ?auto_20902 ) ( LIFTING ?auto_20904 ?auto_20903 ) ( IS-CRATE ?auto_20903 ) ( not ( = ?auto_20902 ?auto_20903 ) ) ( ON ?auto_20901 ?auto_20900 ) ( ON ?auto_20902 ?auto_20901 ) ( not ( = ?auto_20900 ?auto_20901 ) ) ( not ( = ?auto_20900 ?auto_20902 ) ) ( not ( = ?auto_20900 ?auto_20903 ) ) ( not ( = ?auto_20901 ?auto_20902 ) ) ( not ( = ?auto_20901 ?auto_20903 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20902 ?auto_20903 )
      ( MAKE-3CRATE-VERIFY ?auto_20900 ?auto_20901 ?auto_20902 ?auto_20903 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_20906 - SURFACE
      ?auto_20907 - SURFACE
      ?auto_20908 - SURFACE
      ?auto_20909 - SURFACE
      ?auto_20910 - SURFACE
    )
    :vars
    (
      ?auto_20911 - HOIST
      ?auto_20912 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20911 ?auto_20912 ) ( SURFACE-AT ?auto_20909 ?auto_20912 ) ( CLEAR ?auto_20909 ) ( LIFTING ?auto_20911 ?auto_20910 ) ( IS-CRATE ?auto_20910 ) ( not ( = ?auto_20909 ?auto_20910 ) ) ( ON ?auto_20907 ?auto_20906 ) ( ON ?auto_20908 ?auto_20907 ) ( ON ?auto_20909 ?auto_20908 ) ( not ( = ?auto_20906 ?auto_20907 ) ) ( not ( = ?auto_20906 ?auto_20908 ) ) ( not ( = ?auto_20906 ?auto_20909 ) ) ( not ( = ?auto_20906 ?auto_20910 ) ) ( not ( = ?auto_20907 ?auto_20908 ) ) ( not ( = ?auto_20907 ?auto_20909 ) ) ( not ( = ?auto_20907 ?auto_20910 ) ) ( not ( = ?auto_20908 ?auto_20909 ) ) ( not ( = ?auto_20908 ?auto_20910 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20909 ?auto_20910 )
      ( MAKE-4CRATE-VERIFY ?auto_20906 ?auto_20907 ?auto_20908 ?auto_20909 ?auto_20910 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20913 - SURFACE
      ?auto_20914 - SURFACE
    )
    :vars
    (
      ?auto_20915 - HOIST
      ?auto_20916 - PLACE
      ?auto_20917 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20915 ?auto_20916 ) ( SURFACE-AT ?auto_20913 ?auto_20916 ) ( CLEAR ?auto_20913 ) ( IS-CRATE ?auto_20914 ) ( not ( = ?auto_20913 ?auto_20914 ) ) ( TRUCK-AT ?auto_20917 ?auto_20916 ) ( AVAILABLE ?auto_20915 ) ( IN ?auto_20914 ?auto_20917 ) )
    :subtasks
    ( ( !UNLOAD ?auto_20915 ?auto_20914 ?auto_20917 ?auto_20916 )
      ( MAKE-1CRATE ?auto_20913 ?auto_20914 )
      ( MAKE-1CRATE-VERIFY ?auto_20913 ?auto_20914 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20918 - SURFACE
      ?auto_20919 - SURFACE
      ?auto_20920 - SURFACE
    )
    :vars
    (
      ?auto_20921 - HOIST
      ?auto_20923 - PLACE
      ?auto_20922 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20921 ?auto_20923 ) ( SURFACE-AT ?auto_20919 ?auto_20923 ) ( CLEAR ?auto_20919 ) ( IS-CRATE ?auto_20920 ) ( not ( = ?auto_20919 ?auto_20920 ) ) ( TRUCK-AT ?auto_20922 ?auto_20923 ) ( AVAILABLE ?auto_20921 ) ( IN ?auto_20920 ?auto_20922 ) ( ON ?auto_20919 ?auto_20918 ) ( not ( = ?auto_20918 ?auto_20919 ) ) ( not ( = ?auto_20918 ?auto_20920 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20919 ?auto_20920 )
      ( MAKE-2CRATE-VERIFY ?auto_20918 ?auto_20919 ?auto_20920 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20924 - SURFACE
      ?auto_20925 - SURFACE
      ?auto_20926 - SURFACE
      ?auto_20927 - SURFACE
    )
    :vars
    (
      ?auto_20929 - HOIST
      ?auto_20928 - PLACE
      ?auto_20930 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20929 ?auto_20928 ) ( SURFACE-AT ?auto_20926 ?auto_20928 ) ( CLEAR ?auto_20926 ) ( IS-CRATE ?auto_20927 ) ( not ( = ?auto_20926 ?auto_20927 ) ) ( TRUCK-AT ?auto_20930 ?auto_20928 ) ( AVAILABLE ?auto_20929 ) ( IN ?auto_20927 ?auto_20930 ) ( ON ?auto_20926 ?auto_20925 ) ( not ( = ?auto_20925 ?auto_20926 ) ) ( not ( = ?auto_20925 ?auto_20927 ) ) ( ON ?auto_20925 ?auto_20924 ) ( not ( = ?auto_20924 ?auto_20925 ) ) ( not ( = ?auto_20924 ?auto_20926 ) ) ( not ( = ?auto_20924 ?auto_20927 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20925 ?auto_20926 ?auto_20927 )
      ( MAKE-3CRATE-VERIFY ?auto_20924 ?auto_20925 ?auto_20926 ?auto_20927 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_20931 - SURFACE
      ?auto_20932 - SURFACE
      ?auto_20933 - SURFACE
      ?auto_20934 - SURFACE
      ?auto_20935 - SURFACE
    )
    :vars
    (
      ?auto_20937 - HOIST
      ?auto_20936 - PLACE
      ?auto_20938 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20937 ?auto_20936 ) ( SURFACE-AT ?auto_20934 ?auto_20936 ) ( CLEAR ?auto_20934 ) ( IS-CRATE ?auto_20935 ) ( not ( = ?auto_20934 ?auto_20935 ) ) ( TRUCK-AT ?auto_20938 ?auto_20936 ) ( AVAILABLE ?auto_20937 ) ( IN ?auto_20935 ?auto_20938 ) ( ON ?auto_20934 ?auto_20933 ) ( not ( = ?auto_20933 ?auto_20934 ) ) ( not ( = ?auto_20933 ?auto_20935 ) ) ( ON ?auto_20932 ?auto_20931 ) ( ON ?auto_20933 ?auto_20932 ) ( not ( = ?auto_20931 ?auto_20932 ) ) ( not ( = ?auto_20931 ?auto_20933 ) ) ( not ( = ?auto_20931 ?auto_20934 ) ) ( not ( = ?auto_20931 ?auto_20935 ) ) ( not ( = ?auto_20932 ?auto_20933 ) ) ( not ( = ?auto_20932 ?auto_20934 ) ) ( not ( = ?auto_20932 ?auto_20935 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20933 ?auto_20934 ?auto_20935 )
      ( MAKE-4CRATE-VERIFY ?auto_20931 ?auto_20932 ?auto_20933 ?auto_20934 ?auto_20935 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20939 - SURFACE
      ?auto_20940 - SURFACE
    )
    :vars
    (
      ?auto_20943 - HOIST
      ?auto_20941 - PLACE
      ?auto_20944 - TRUCK
      ?auto_20942 - SURFACE
      ?auto_20945 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20943 ?auto_20941 ) ( SURFACE-AT ?auto_20939 ?auto_20941 ) ( CLEAR ?auto_20939 ) ( IS-CRATE ?auto_20940 ) ( not ( = ?auto_20939 ?auto_20940 ) ) ( AVAILABLE ?auto_20943 ) ( IN ?auto_20940 ?auto_20944 ) ( ON ?auto_20939 ?auto_20942 ) ( not ( = ?auto_20942 ?auto_20939 ) ) ( not ( = ?auto_20942 ?auto_20940 ) ) ( TRUCK-AT ?auto_20944 ?auto_20945 ) ( not ( = ?auto_20945 ?auto_20941 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20944 ?auto_20945 ?auto_20941 )
      ( MAKE-2CRATE ?auto_20942 ?auto_20939 ?auto_20940 )
      ( MAKE-1CRATE-VERIFY ?auto_20939 ?auto_20940 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20946 - SURFACE
      ?auto_20947 - SURFACE
      ?auto_20948 - SURFACE
    )
    :vars
    (
      ?auto_20950 - HOIST
      ?auto_20951 - PLACE
      ?auto_20949 - TRUCK
      ?auto_20952 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20950 ?auto_20951 ) ( SURFACE-AT ?auto_20947 ?auto_20951 ) ( CLEAR ?auto_20947 ) ( IS-CRATE ?auto_20948 ) ( not ( = ?auto_20947 ?auto_20948 ) ) ( AVAILABLE ?auto_20950 ) ( IN ?auto_20948 ?auto_20949 ) ( ON ?auto_20947 ?auto_20946 ) ( not ( = ?auto_20946 ?auto_20947 ) ) ( not ( = ?auto_20946 ?auto_20948 ) ) ( TRUCK-AT ?auto_20949 ?auto_20952 ) ( not ( = ?auto_20952 ?auto_20951 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20947 ?auto_20948 )
      ( MAKE-2CRATE-VERIFY ?auto_20946 ?auto_20947 ?auto_20948 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20953 - SURFACE
      ?auto_20954 - SURFACE
      ?auto_20955 - SURFACE
      ?auto_20956 - SURFACE
    )
    :vars
    (
      ?auto_20958 - HOIST
      ?auto_20960 - PLACE
      ?auto_20959 - TRUCK
      ?auto_20957 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20958 ?auto_20960 ) ( SURFACE-AT ?auto_20955 ?auto_20960 ) ( CLEAR ?auto_20955 ) ( IS-CRATE ?auto_20956 ) ( not ( = ?auto_20955 ?auto_20956 ) ) ( AVAILABLE ?auto_20958 ) ( IN ?auto_20956 ?auto_20959 ) ( ON ?auto_20955 ?auto_20954 ) ( not ( = ?auto_20954 ?auto_20955 ) ) ( not ( = ?auto_20954 ?auto_20956 ) ) ( TRUCK-AT ?auto_20959 ?auto_20957 ) ( not ( = ?auto_20957 ?auto_20960 ) ) ( ON ?auto_20954 ?auto_20953 ) ( not ( = ?auto_20953 ?auto_20954 ) ) ( not ( = ?auto_20953 ?auto_20955 ) ) ( not ( = ?auto_20953 ?auto_20956 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20954 ?auto_20955 ?auto_20956 )
      ( MAKE-3CRATE-VERIFY ?auto_20953 ?auto_20954 ?auto_20955 ?auto_20956 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_20961 - SURFACE
      ?auto_20962 - SURFACE
      ?auto_20963 - SURFACE
      ?auto_20964 - SURFACE
      ?auto_20965 - SURFACE
    )
    :vars
    (
      ?auto_20967 - HOIST
      ?auto_20969 - PLACE
      ?auto_20968 - TRUCK
      ?auto_20966 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20967 ?auto_20969 ) ( SURFACE-AT ?auto_20964 ?auto_20969 ) ( CLEAR ?auto_20964 ) ( IS-CRATE ?auto_20965 ) ( not ( = ?auto_20964 ?auto_20965 ) ) ( AVAILABLE ?auto_20967 ) ( IN ?auto_20965 ?auto_20968 ) ( ON ?auto_20964 ?auto_20963 ) ( not ( = ?auto_20963 ?auto_20964 ) ) ( not ( = ?auto_20963 ?auto_20965 ) ) ( TRUCK-AT ?auto_20968 ?auto_20966 ) ( not ( = ?auto_20966 ?auto_20969 ) ) ( ON ?auto_20962 ?auto_20961 ) ( ON ?auto_20963 ?auto_20962 ) ( not ( = ?auto_20961 ?auto_20962 ) ) ( not ( = ?auto_20961 ?auto_20963 ) ) ( not ( = ?auto_20961 ?auto_20964 ) ) ( not ( = ?auto_20961 ?auto_20965 ) ) ( not ( = ?auto_20962 ?auto_20963 ) ) ( not ( = ?auto_20962 ?auto_20964 ) ) ( not ( = ?auto_20962 ?auto_20965 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20963 ?auto_20964 ?auto_20965 )
      ( MAKE-4CRATE-VERIFY ?auto_20961 ?auto_20962 ?auto_20963 ?auto_20964 ?auto_20965 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20970 - SURFACE
      ?auto_20971 - SURFACE
    )
    :vars
    (
      ?auto_20973 - HOIST
      ?auto_20975 - PLACE
      ?auto_20976 - SURFACE
      ?auto_20974 - TRUCK
      ?auto_20972 - PLACE
      ?auto_20977 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20973 ?auto_20975 ) ( SURFACE-AT ?auto_20970 ?auto_20975 ) ( CLEAR ?auto_20970 ) ( IS-CRATE ?auto_20971 ) ( not ( = ?auto_20970 ?auto_20971 ) ) ( AVAILABLE ?auto_20973 ) ( ON ?auto_20970 ?auto_20976 ) ( not ( = ?auto_20976 ?auto_20970 ) ) ( not ( = ?auto_20976 ?auto_20971 ) ) ( TRUCK-AT ?auto_20974 ?auto_20972 ) ( not ( = ?auto_20972 ?auto_20975 ) ) ( HOIST-AT ?auto_20977 ?auto_20972 ) ( LIFTING ?auto_20977 ?auto_20971 ) ( not ( = ?auto_20973 ?auto_20977 ) ) )
    :subtasks
    ( ( !LOAD ?auto_20977 ?auto_20971 ?auto_20974 ?auto_20972 )
      ( MAKE-2CRATE ?auto_20976 ?auto_20970 ?auto_20971 )
      ( MAKE-1CRATE-VERIFY ?auto_20970 ?auto_20971 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20978 - SURFACE
      ?auto_20979 - SURFACE
      ?auto_20980 - SURFACE
    )
    :vars
    (
      ?auto_20981 - HOIST
      ?auto_20985 - PLACE
      ?auto_20982 - TRUCK
      ?auto_20983 - PLACE
      ?auto_20984 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20981 ?auto_20985 ) ( SURFACE-AT ?auto_20979 ?auto_20985 ) ( CLEAR ?auto_20979 ) ( IS-CRATE ?auto_20980 ) ( not ( = ?auto_20979 ?auto_20980 ) ) ( AVAILABLE ?auto_20981 ) ( ON ?auto_20979 ?auto_20978 ) ( not ( = ?auto_20978 ?auto_20979 ) ) ( not ( = ?auto_20978 ?auto_20980 ) ) ( TRUCK-AT ?auto_20982 ?auto_20983 ) ( not ( = ?auto_20983 ?auto_20985 ) ) ( HOIST-AT ?auto_20984 ?auto_20983 ) ( LIFTING ?auto_20984 ?auto_20980 ) ( not ( = ?auto_20981 ?auto_20984 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20979 ?auto_20980 )
      ( MAKE-2CRATE-VERIFY ?auto_20978 ?auto_20979 ?auto_20980 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20986 - SURFACE
      ?auto_20987 - SURFACE
      ?auto_20988 - SURFACE
      ?auto_20989 - SURFACE
    )
    :vars
    (
      ?auto_20992 - HOIST
      ?auto_20993 - PLACE
      ?auto_20991 - TRUCK
      ?auto_20994 - PLACE
      ?auto_20990 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20992 ?auto_20993 ) ( SURFACE-AT ?auto_20988 ?auto_20993 ) ( CLEAR ?auto_20988 ) ( IS-CRATE ?auto_20989 ) ( not ( = ?auto_20988 ?auto_20989 ) ) ( AVAILABLE ?auto_20992 ) ( ON ?auto_20988 ?auto_20987 ) ( not ( = ?auto_20987 ?auto_20988 ) ) ( not ( = ?auto_20987 ?auto_20989 ) ) ( TRUCK-AT ?auto_20991 ?auto_20994 ) ( not ( = ?auto_20994 ?auto_20993 ) ) ( HOIST-AT ?auto_20990 ?auto_20994 ) ( LIFTING ?auto_20990 ?auto_20989 ) ( not ( = ?auto_20992 ?auto_20990 ) ) ( ON ?auto_20987 ?auto_20986 ) ( not ( = ?auto_20986 ?auto_20987 ) ) ( not ( = ?auto_20986 ?auto_20988 ) ) ( not ( = ?auto_20986 ?auto_20989 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20987 ?auto_20988 ?auto_20989 )
      ( MAKE-3CRATE-VERIFY ?auto_20986 ?auto_20987 ?auto_20988 ?auto_20989 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_20995 - SURFACE
      ?auto_20996 - SURFACE
      ?auto_20997 - SURFACE
      ?auto_20998 - SURFACE
      ?auto_20999 - SURFACE
    )
    :vars
    (
      ?auto_21002 - HOIST
      ?auto_21003 - PLACE
      ?auto_21001 - TRUCK
      ?auto_21004 - PLACE
      ?auto_21000 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21002 ?auto_21003 ) ( SURFACE-AT ?auto_20998 ?auto_21003 ) ( CLEAR ?auto_20998 ) ( IS-CRATE ?auto_20999 ) ( not ( = ?auto_20998 ?auto_20999 ) ) ( AVAILABLE ?auto_21002 ) ( ON ?auto_20998 ?auto_20997 ) ( not ( = ?auto_20997 ?auto_20998 ) ) ( not ( = ?auto_20997 ?auto_20999 ) ) ( TRUCK-AT ?auto_21001 ?auto_21004 ) ( not ( = ?auto_21004 ?auto_21003 ) ) ( HOIST-AT ?auto_21000 ?auto_21004 ) ( LIFTING ?auto_21000 ?auto_20999 ) ( not ( = ?auto_21002 ?auto_21000 ) ) ( ON ?auto_20996 ?auto_20995 ) ( ON ?auto_20997 ?auto_20996 ) ( not ( = ?auto_20995 ?auto_20996 ) ) ( not ( = ?auto_20995 ?auto_20997 ) ) ( not ( = ?auto_20995 ?auto_20998 ) ) ( not ( = ?auto_20995 ?auto_20999 ) ) ( not ( = ?auto_20996 ?auto_20997 ) ) ( not ( = ?auto_20996 ?auto_20998 ) ) ( not ( = ?auto_20996 ?auto_20999 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20997 ?auto_20998 ?auto_20999 )
      ( MAKE-4CRATE-VERIFY ?auto_20995 ?auto_20996 ?auto_20997 ?auto_20998 ?auto_20999 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21005 - SURFACE
      ?auto_21006 - SURFACE
    )
    :vars
    (
      ?auto_21009 - HOIST
      ?auto_21010 - PLACE
      ?auto_21012 - SURFACE
      ?auto_21008 - TRUCK
      ?auto_21011 - PLACE
      ?auto_21007 - HOIST
      ?auto_21013 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21009 ?auto_21010 ) ( SURFACE-AT ?auto_21005 ?auto_21010 ) ( CLEAR ?auto_21005 ) ( IS-CRATE ?auto_21006 ) ( not ( = ?auto_21005 ?auto_21006 ) ) ( AVAILABLE ?auto_21009 ) ( ON ?auto_21005 ?auto_21012 ) ( not ( = ?auto_21012 ?auto_21005 ) ) ( not ( = ?auto_21012 ?auto_21006 ) ) ( TRUCK-AT ?auto_21008 ?auto_21011 ) ( not ( = ?auto_21011 ?auto_21010 ) ) ( HOIST-AT ?auto_21007 ?auto_21011 ) ( not ( = ?auto_21009 ?auto_21007 ) ) ( AVAILABLE ?auto_21007 ) ( SURFACE-AT ?auto_21006 ?auto_21011 ) ( ON ?auto_21006 ?auto_21013 ) ( CLEAR ?auto_21006 ) ( not ( = ?auto_21005 ?auto_21013 ) ) ( not ( = ?auto_21006 ?auto_21013 ) ) ( not ( = ?auto_21012 ?auto_21013 ) ) )
    :subtasks
    ( ( !LIFT ?auto_21007 ?auto_21006 ?auto_21013 ?auto_21011 )
      ( MAKE-2CRATE ?auto_21012 ?auto_21005 ?auto_21006 )
      ( MAKE-1CRATE-VERIFY ?auto_21005 ?auto_21006 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21014 - SURFACE
      ?auto_21015 - SURFACE
      ?auto_21016 - SURFACE
    )
    :vars
    (
      ?auto_21022 - HOIST
      ?auto_21019 - PLACE
      ?auto_21021 - TRUCK
      ?auto_21020 - PLACE
      ?auto_21018 - HOIST
      ?auto_21017 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21022 ?auto_21019 ) ( SURFACE-AT ?auto_21015 ?auto_21019 ) ( CLEAR ?auto_21015 ) ( IS-CRATE ?auto_21016 ) ( not ( = ?auto_21015 ?auto_21016 ) ) ( AVAILABLE ?auto_21022 ) ( ON ?auto_21015 ?auto_21014 ) ( not ( = ?auto_21014 ?auto_21015 ) ) ( not ( = ?auto_21014 ?auto_21016 ) ) ( TRUCK-AT ?auto_21021 ?auto_21020 ) ( not ( = ?auto_21020 ?auto_21019 ) ) ( HOIST-AT ?auto_21018 ?auto_21020 ) ( not ( = ?auto_21022 ?auto_21018 ) ) ( AVAILABLE ?auto_21018 ) ( SURFACE-AT ?auto_21016 ?auto_21020 ) ( ON ?auto_21016 ?auto_21017 ) ( CLEAR ?auto_21016 ) ( not ( = ?auto_21015 ?auto_21017 ) ) ( not ( = ?auto_21016 ?auto_21017 ) ) ( not ( = ?auto_21014 ?auto_21017 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21015 ?auto_21016 )
      ( MAKE-2CRATE-VERIFY ?auto_21014 ?auto_21015 ?auto_21016 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21023 - SURFACE
      ?auto_21024 - SURFACE
      ?auto_21025 - SURFACE
      ?auto_21026 - SURFACE
    )
    :vars
    (
      ?auto_21030 - HOIST
      ?auto_21032 - PLACE
      ?auto_21029 - TRUCK
      ?auto_21031 - PLACE
      ?auto_21028 - HOIST
      ?auto_21027 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21030 ?auto_21032 ) ( SURFACE-AT ?auto_21025 ?auto_21032 ) ( CLEAR ?auto_21025 ) ( IS-CRATE ?auto_21026 ) ( not ( = ?auto_21025 ?auto_21026 ) ) ( AVAILABLE ?auto_21030 ) ( ON ?auto_21025 ?auto_21024 ) ( not ( = ?auto_21024 ?auto_21025 ) ) ( not ( = ?auto_21024 ?auto_21026 ) ) ( TRUCK-AT ?auto_21029 ?auto_21031 ) ( not ( = ?auto_21031 ?auto_21032 ) ) ( HOIST-AT ?auto_21028 ?auto_21031 ) ( not ( = ?auto_21030 ?auto_21028 ) ) ( AVAILABLE ?auto_21028 ) ( SURFACE-AT ?auto_21026 ?auto_21031 ) ( ON ?auto_21026 ?auto_21027 ) ( CLEAR ?auto_21026 ) ( not ( = ?auto_21025 ?auto_21027 ) ) ( not ( = ?auto_21026 ?auto_21027 ) ) ( not ( = ?auto_21024 ?auto_21027 ) ) ( ON ?auto_21024 ?auto_21023 ) ( not ( = ?auto_21023 ?auto_21024 ) ) ( not ( = ?auto_21023 ?auto_21025 ) ) ( not ( = ?auto_21023 ?auto_21026 ) ) ( not ( = ?auto_21023 ?auto_21027 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21024 ?auto_21025 ?auto_21026 )
      ( MAKE-3CRATE-VERIFY ?auto_21023 ?auto_21024 ?auto_21025 ?auto_21026 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21033 - SURFACE
      ?auto_21034 - SURFACE
      ?auto_21035 - SURFACE
      ?auto_21036 - SURFACE
      ?auto_21037 - SURFACE
    )
    :vars
    (
      ?auto_21041 - HOIST
      ?auto_21043 - PLACE
      ?auto_21040 - TRUCK
      ?auto_21042 - PLACE
      ?auto_21039 - HOIST
      ?auto_21038 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21041 ?auto_21043 ) ( SURFACE-AT ?auto_21036 ?auto_21043 ) ( CLEAR ?auto_21036 ) ( IS-CRATE ?auto_21037 ) ( not ( = ?auto_21036 ?auto_21037 ) ) ( AVAILABLE ?auto_21041 ) ( ON ?auto_21036 ?auto_21035 ) ( not ( = ?auto_21035 ?auto_21036 ) ) ( not ( = ?auto_21035 ?auto_21037 ) ) ( TRUCK-AT ?auto_21040 ?auto_21042 ) ( not ( = ?auto_21042 ?auto_21043 ) ) ( HOIST-AT ?auto_21039 ?auto_21042 ) ( not ( = ?auto_21041 ?auto_21039 ) ) ( AVAILABLE ?auto_21039 ) ( SURFACE-AT ?auto_21037 ?auto_21042 ) ( ON ?auto_21037 ?auto_21038 ) ( CLEAR ?auto_21037 ) ( not ( = ?auto_21036 ?auto_21038 ) ) ( not ( = ?auto_21037 ?auto_21038 ) ) ( not ( = ?auto_21035 ?auto_21038 ) ) ( ON ?auto_21034 ?auto_21033 ) ( ON ?auto_21035 ?auto_21034 ) ( not ( = ?auto_21033 ?auto_21034 ) ) ( not ( = ?auto_21033 ?auto_21035 ) ) ( not ( = ?auto_21033 ?auto_21036 ) ) ( not ( = ?auto_21033 ?auto_21037 ) ) ( not ( = ?auto_21033 ?auto_21038 ) ) ( not ( = ?auto_21034 ?auto_21035 ) ) ( not ( = ?auto_21034 ?auto_21036 ) ) ( not ( = ?auto_21034 ?auto_21037 ) ) ( not ( = ?auto_21034 ?auto_21038 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21035 ?auto_21036 ?auto_21037 )
      ( MAKE-4CRATE-VERIFY ?auto_21033 ?auto_21034 ?auto_21035 ?auto_21036 ?auto_21037 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21044 - SURFACE
      ?auto_21045 - SURFACE
    )
    :vars
    (
      ?auto_21049 - HOIST
      ?auto_21052 - PLACE
      ?auto_21050 - SURFACE
      ?auto_21051 - PLACE
      ?auto_21047 - HOIST
      ?auto_21046 - SURFACE
      ?auto_21048 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21049 ?auto_21052 ) ( SURFACE-AT ?auto_21044 ?auto_21052 ) ( CLEAR ?auto_21044 ) ( IS-CRATE ?auto_21045 ) ( not ( = ?auto_21044 ?auto_21045 ) ) ( AVAILABLE ?auto_21049 ) ( ON ?auto_21044 ?auto_21050 ) ( not ( = ?auto_21050 ?auto_21044 ) ) ( not ( = ?auto_21050 ?auto_21045 ) ) ( not ( = ?auto_21051 ?auto_21052 ) ) ( HOIST-AT ?auto_21047 ?auto_21051 ) ( not ( = ?auto_21049 ?auto_21047 ) ) ( AVAILABLE ?auto_21047 ) ( SURFACE-AT ?auto_21045 ?auto_21051 ) ( ON ?auto_21045 ?auto_21046 ) ( CLEAR ?auto_21045 ) ( not ( = ?auto_21044 ?auto_21046 ) ) ( not ( = ?auto_21045 ?auto_21046 ) ) ( not ( = ?auto_21050 ?auto_21046 ) ) ( TRUCK-AT ?auto_21048 ?auto_21052 ) )
    :subtasks
    ( ( !DRIVE ?auto_21048 ?auto_21052 ?auto_21051 )
      ( MAKE-2CRATE ?auto_21050 ?auto_21044 ?auto_21045 )
      ( MAKE-1CRATE-VERIFY ?auto_21044 ?auto_21045 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21053 - SURFACE
      ?auto_21054 - SURFACE
      ?auto_21055 - SURFACE
    )
    :vars
    (
      ?auto_21060 - HOIST
      ?auto_21056 - PLACE
      ?auto_21061 - PLACE
      ?auto_21057 - HOIST
      ?auto_21059 - SURFACE
      ?auto_21058 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21060 ?auto_21056 ) ( SURFACE-AT ?auto_21054 ?auto_21056 ) ( CLEAR ?auto_21054 ) ( IS-CRATE ?auto_21055 ) ( not ( = ?auto_21054 ?auto_21055 ) ) ( AVAILABLE ?auto_21060 ) ( ON ?auto_21054 ?auto_21053 ) ( not ( = ?auto_21053 ?auto_21054 ) ) ( not ( = ?auto_21053 ?auto_21055 ) ) ( not ( = ?auto_21061 ?auto_21056 ) ) ( HOIST-AT ?auto_21057 ?auto_21061 ) ( not ( = ?auto_21060 ?auto_21057 ) ) ( AVAILABLE ?auto_21057 ) ( SURFACE-AT ?auto_21055 ?auto_21061 ) ( ON ?auto_21055 ?auto_21059 ) ( CLEAR ?auto_21055 ) ( not ( = ?auto_21054 ?auto_21059 ) ) ( not ( = ?auto_21055 ?auto_21059 ) ) ( not ( = ?auto_21053 ?auto_21059 ) ) ( TRUCK-AT ?auto_21058 ?auto_21056 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21054 ?auto_21055 )
      ( MAKE-2CRATE-VERIFY ?auto_21053 ?auto_21054 ?auto_21055 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21062 - SURFACE
      ?auto_21063 - SURFACE
      ?auto_21064 - SURFACE
      ?auto_21065 - SURFACE
    )
    :vars
    (
      ?auto_21069 - HOIST
      ?auto_21066 - PLACE
      ?auto_21068 - PLACE
      ?auto_21067 - HOIST
      ?auto_21070 - SURFACE
      ?auto_21071 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21069 ?auto_21066 ) ( SURFACE-AT ?auto_21064 ?auto_21066 ) ( CLEAR ?auto_21064 ) ( IS-CRATE ?auto_21065 ) ( not ( = ?auto_21064 ?auto_21065 ) ) ( AVAILABLE ?auto_21069 ) ( ON ?auto_21064 ?auto_21063 ) ( not ( = ?auto_21063 ?auto_21064 ) ) ( not ( = ?auto_21063 ?auto_21065 ) ) ( not ( = ?auto_21068 ?auto_21066 ) ) ( HOIST-AT ?auto_21067 ?auto_21068 ) ( not ( = ?auto_21069 ?auto_21067 ) ) ( AVAILABLE ?auto_21067 ) ( SURFACE-AT ?auto_21065 ?auto_21068 ) ( ON ?auto_21065 ?auto_21070 ) ( CLEAR ?auto_21065 ) ( not ( = ?auto_21064 ?auto_21070 ) ) ( not ( = ?auto_21065 ?auto_21070 ) ) ( not ( = ?auto_21063 ?auto_21070 ) ) ( TRUCK-AT ?auto_21071 ?auto_21066 ) ( ON ?auto_21063 ?auto_21062 ) ( not ( = ?auto_21062 ?auto_21063 ) ) ( not ( = ?auto_21062 ?auto_21064 ) ) ( not ( = ?auto_21062 ?auto_21065 ) ) ( not ( = ?auto_21062 ?auto_21070 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21063 ?auto_21064 ?auto_21065 )
      ( MAKE-3CRATE-VERIFY ?auto_21062 ?auto_21063 ?auto_21064 ?auto_21065 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21072 - SURFACE
      ?auto_21073 - SURFACE
      ?auto_21074 - SURFACE
      ?auto_21075 - SURFACE
      ?auto_21076 - SURFACE
    )
    :vars
    (
      ?auto_21080 - HOIST
      ?auto_21077 - PLACE
      ?auto_21079 - PLACE
      ?auto_21078 - HOIST
      ?auto_21081 - SURFACE
      ?auto_21082 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21080 ?auto_21077 ) ( SURFACE-AT ?auto_21075 ?auto_21077 ) ( CLEAR ?auto_21075 ) ( IS-CRATE ?auto_21076 ) ( not ( = ?auto_21075 ?auto_21076 ) ) ( AVAILABLE ?auto_21080 ) ( ON ?auto_21075 ?auto_21074 ) ( not ( = ?auto_21074 ?auto_21075 ) ) ( not ( = ?auto_21074 ?auto_21076 ) ) ( not ( = ?auto_21079 ?auto_21077 ) ) ( HOIST-AT ?auto_21078 ?auto_21079 ) ( not ( = ?auto_21080 ?auto_21078 ) ) ( AVAILABLE ?auto_21078 ) ( SURFACE-AT ?auto_21076 ?auto_21079 ) ( ON ?auto_21076 ?auto_21081 ) ( CLEAR ?auto_21076 ) ( not ( = ?auto_21075 ?auto_21081 ) ) ( not ( = ?auto_21076 ?auto_21081 ) ) ( not ( = ?auto_21074 ?auto_21081 ) ) ( TRUCK-AT ?auto_21082 ?auto_21077 ) ( ON ?auto_21073 ?auto_21072 ) ( ON ?auto_21074 ?auto_21073 ) ( not ( = ?auto_21072 ?auto_21073 ) ) ( not ( = ?auto_21072 ?auto_21074 ) ) ( not ( = ?auto_21072 ?auto_21075 ) ) ( not ( = ?auto_21072 ?auto_21076 ) ) ( not ( = ?auto_21072 ?auto_21081 ) ) ( not ( = ?auto_21073 ?auto_21074 ) ) ( not ( = ?auto_21073 ?auto_21075 ) ) ( not ( = ?auto_21073 ?auto_21076 ) ) ( not ( = ?auto_21073 ?auto_21081 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21074 ?auto_21075 ?auto_21076 )
      ( MAKE-4CRATE-VERIFY ?auto_21072 ?auto_21073 ?auto_21074 ?auto_21075 ?auto_21076 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21083 - SURFACE
      ?auto_21084 - SURFACE
    )
    :vars
    (
      ?auto_21088 - HOIST
      ?auto_21085 - PLACE
      ?auto_21089 - SURFACE
      ?auto_21087 - PLACE
      ?auto_21086 - HOIST
      ?auto_21090 - SURFACE
      ?auto_21091 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21088 ?auto_21085 ) ( IS-CRATE ?auto_21084 ) ( not ( = ?auto_21083 ?auto_21084 ) ) ( not ( = ?auto_21089 ?auto_21083 ) ) ( not ( = ?auto_21089 ?auto_21084 ) ) ( not ( = ?auto_21087 ?auto_21085 ) ) ( HOIST-AT ?auto_21086 ?auto_21087 ) ( not ( = ?auto_21088 ?auto_21086 ) ) ( AVAILABLE ?auto_21086 ) ( SURFACE-AT ?auto_21084 ?auto_21087 ) ( ON ?auto_21084 ?auto_21090 ) ( CLEAR ?auto_21084 ) ( not ( = ?auto_21083 ?auto_21090 ) ) ( not ( = ?auto_21084 ?auto_21090 ) ) ( not ( = ?auto_21089 ?auto_21090 ) ) ( TRUCK-AT ?auto_21091 ?auto_21085 ) ( SURFACE-AT ?auto_21089 ?auto_21085 ) ( CLEAR ?auto_21089 ) ( LIFTING ?auto_21088 ?auto_21083 ) ( IS-CRATE ?auto_21083 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21089 ?auto_21083 )
      ( MAKE-2CRATE ?auto_21089 ?auto_21083 ?auto_21084 )
      ( MAKE-1CRATE-VERIFY ?auto_21083 ?auto_21084 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21092 - SURFACE
      ?auto_21093 - SURFACE
      ?auto_21094 - SURFACE
    )
    :vars
    (
      ?auto_21097 - HOIST
      ?auto_21095 - PLACE
      ?auto_21098 - PLACE
      ?auto_21096 - HOIST
      ?auto_21099 - SURFACE
      ?auto_21100 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21097 ?auto_21095 ) ( IS-CRATE ?auto_21094 ) ( not ( = ?auto_21093 ?auto_21094 ) ) ( not ( = ?auto_21092 ?auto_21093 ) ) ( not ( = ?auto_21092 ?auto_21094 ) ) ( not ( = ?auto_21098 ?auto_21095 ) ) ( HOIST-AT ?auto_21096 ?auto_21098 ) ( not ( = ?auto_21097 ?auto_21096 ) ) ( AVAILABLE ?auto_21096 ) ( SURFACE-AT ?auto_21094 ?auto_21098 ) ( ON ?auto_21094 ?auto_21099 ) ( CLEAR ?auto_21094 ) ( not ( = ?auto_21093 ?auto_21099 ) ) ( not ( = ?auto_21094 ?auto_21099 ) ) ( not ( = ?auto_21092 ?auto_21099 ) ) ( TRUCK-AT ?auto_21100 ?auto_21095 ) ( SURFACE-AT ?auto_21092 ?auto_21095 ) ( CLEAR ?auto_21092 ) ( LIFTING ?auto_21097 ?auto_21093 ) ( IS-CRATE ?auto_21093 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21093 ?auto_21094 )
      ( MAKE-2CRATE-VERIFY ?auto_21092 ?auto_21093 ?auto_21094 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21101 - SURFACE
      ?auto_21102 - SURFACE
      ?auto_21103 - SURFACE
      ?auto_21104 - SURFACE
    )
    :vars
    (
      ?auto_21110 - HOIST
      ?auto_21105 - PLACE
      ?auto_21106 - PLACE
      ?auto_21107 - HOIST
      ?auto_21108 - SURFACE
      ?auto_21109 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21110 ?auto_21105 ) ( IS-CRATE ?auto_21104 ) ( not ( = ?auto_21103 ?auto_21104 ) ) ( not ( = ?auto_21102 ?auto_21103 ) ) ( not ( = ?auto_21102 ?auto_21104 ) ) ( not ( = ?auto_21106 ?auto_21105 ) ) ( HOIST-AT ?auto_21107 ?auto_21106 ) ( not ( = ?auto_21110 ?auto_21107 ) ) ( AVAILABLE ?auto_21107 ) ( SURFACE-AT ?auto_21104 ?auto_21106 ) ( ON ?auto_21104 ?auto_21108 ) ( CLEAR ?auto_21104 ) ( not ( = ?auto_21103 ?auto_21108 ) ) ( not ( = ?auto_21104 ?auto_21108 ) ) ( not ( = ?auto_21102 ?auto_21108 ) ) ( TRUCK-AT ?auto_21109 ?auto_21105 ) ( SURFACE-AT ?auto_21102 ?auto_21105 ) ( CLEAR ?auto_21102 ) ( LIFTING ?auto_21110 ?auto_21103 ) ( IS-CRATE ?auto_21103 ) ( ON ?auto_21102 ?auto_21101 ) ( not ( = ?auto_21101 ?auto_21102 ) ) ( not ( = ?auto_21101 ?auto_21103 ) ) ( not ( = ?auto_21101 ?auto_21104 ) ) ( not ( = ?auto_21101 ?auto_21108 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21102 ?auto_21103 ?auto_21104 )
      ( MAKE-3CRATE-VERIFY ?auto_21101 ?auto_21102 ?auto_21103 ?auto_21104 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21111 - SURFACE
      ?auto_21112 - SURFACE
      ?auto_21113 - SURFACE
      ?auto_21114 - SURFACE
      ?auto_21115 - SURFACE
    )
    :vars
    (
      ?auto_21121 - HOIST
      ?auto_21116 - PLACE
      ?auto_21117 - PLACE
      ?auto_21118 - HOIST
      ?auto_21119 - SURFACE
      ?auto_21120 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21121 ?auto_21116 ) ( IS-CRATE ?auto_21115 ) ( not ( = ?auto_21114 ?auto_21115 ) ) ( not ( = ?auto_21113 ?auto_21114 ) ) ( not ( = ?auto_21113 ?auto_21115 ) ) ( not ( = ?auto_21117 ?auto_21116 ) ) ( HOIST-AT ?auto_21118 ?auto_21117 ) ( not ( = ?auto_21121 ?auto_21118 ) ) ( AVAILABLE ?auto_21118 ) ( SURFACE-AT ?auto_21115 ?auto_21117 ) ( ON ?auto_21115 ?auto_21119 ) ( CLEAR ?auto_21115 ) ( not ( = ?auto_21114 ?auto_21119 ) ) ( not ( = ?auto_21115 ?auto_21119 ) ) ( not ( = ?auto_21113 ?auto_21119 ) ) ( TRUCK-AT ?auto_21120 ?auto_21116 ) ( SURFACE-AT ?auto_21113 ?auto_21116 ) ( CLEAR ?auto_21113 ) ( LIFTING ?auto_21121 ?auto_21114 ) ( IS-CRATE ?auto_21114 ) ( ON ?auto_21112 ?auto_21111 ) ( ON ?auto_21113 ?auto_21112 ) ( not ( = ?auto_21111 ?auto_21112 ) ) ( not ( = ?auto_21111 ?auto_21113 ) ) ( not ( = ?auto_21111 ?auto_21114 ) ) ( not ( = ?auto_21111 ?auto_21115 ) ) ( not ( = ?auto_21111 ?auto_21119 ) ) ( not ( = ?auto_21112 ?auto_21113 ) ) ( not ( = ?auto_21112 ?auto_21114 ) ) ( not ( = ?auto_21112 ?auto_21115 ) ) ( not ( = ?auto_21112 ?auto_21119 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21113 ?auto_21114 ?auto_21115 )
      ( MAKE-4CRATE-VERIFY ?auto_21111 ?auto_21112 ?auto_21113 ?auto_21114 ?auto_21115 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21122 - SURFACE
      ?auto_21123 - SURFACE
    )
    :vars
    (
      ?auto_21130 - HOIST
      ?auto_21124 - PLACE
      ?auto_21127 - SURFACE
      ?auto_21125 - PLACE
      ?auto_21126 - HOIST
      ?auto_21128 - SURFACE
      ?auto_21129 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21130 ?auto_21124 ) ( IS-CRATE ?auto_21123 ) ( not ( = ?auto_21122 ?auto_21123 ) ) ( not ( = ?auto_21127 ?auto_21122 ) ) ( not ( = ?auto_21127 ?auto_21123 ) ) ( not ( = ?auto_21125 ?auto_21124 ) ) ( HOIST-AT ?auto_21126 ?auto_21125 ) ( not ( = ?auto_21130 ?auto_21126 ) ) ( AVAILABLE ?auto_21126 ) ( SURFACE-AT ?auto_21123 ?auto_21125 ) ( ON ?auto_21123 ?auto_21128 ) ( CLEAR ?auto_21123 ) ( not ( = ?auto_21122 ?auto_21128 ) ) ( not ( = ?auto_21123 ?auto_21128 ) ) ( not ( = ?auto_21127 ?auto_21128 ) ) ( TRUCK-AT ?auto_21129 ?auto_21124 ) ( SURFACE-AT ?auto_21127 ?auto_21124 ) ( CLEAR ?auto_21127 ) ( IS-CRATE ?auto_21122 ) ( AVAILABLE ?auto_21130 ) ( IN ?auto_21122 ?auto_21129 ) )
    :subtasks
    ( ( !UNLOAD ?auto_21130 ?auto_21122 ?auto_21129 ?auto_21124 )
      ( MAKE-2CRATE ?auto_21127 ?auto_21122 ?auto_21123 )
      ( MAKE-1CRATE-VERIFY ?auto_21122 ?auto_21123 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21131 - SURFACE
      ?auto_21132 - SURFACE
      ?auto_21133 - SURFACE
    )
    :vars
    (
      ?auto_21135 - HOIST
      ?auto_21137 - PLACE
      ?auto_21139 - PLACE
      ?auto_21138 - HOIST
      ?auto_21134 - SURFACE
      ?auto_21136 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21135 ?auto_21137 ) ( IS-CRATE ?auto_21133 ) ( not ( = ?auto_21132 ?auto_21133 ) ) ( not ( = ?auto_21131 ?auto_21132 ) ) ( not ( = ?auto_21131 ?auto_21133 ) ) ( not ( = ?auto_21139 ?auto_21137 ) ) ( HOIST-AT ?auto_21138 ?auto_21139 ) ( not ( = ?auto_21135 ?auto_21138 ) ) ( AVAILABLE ?auto_21138 ) ( SURFACE-AT ?auto_21133 ?auto_21139 ) ( ON ?auto_21133 ?auto_21134 ) ( CLEAR ?auto_21133 ) ( not ( = ?auto_21132 ?auto_21134 ) ) ( not ( = ?auto_21133 ?auto_21134 ) ) ( not ( = ?auto_21131 ?auto_21134 ) ) ( TRUCK-AT ?auto_21136 ?auto_21137 ) ( SURFACE-AT ?auto_21131 ?auto_21137 ) ( CLEAR ?auto_21131 ) ( IS-CRATE ?auto_21132 ) ( AVAILABLE ?auto_21135 ) ( IN ?auto_21132 ?auto_21136 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21132 ?auto_21133 )
      ( MAKE-2CRATE-VERIFY ?auto_21131 ?auto_21132 ?auto_21133 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21140 - SURFACE
      ?auto_21141 - SURFACE
      ?auto_21142 - SURFACE
      ?auto_21143 - SURFACE
    )
    :vars
    (
      ?auto_21145 - HOIST
      ?auto_21144 - PLACE
      ?auto_21149 - PLACE
      ?auto_21146 - HOIST
      ?auto_21148 - SURFACE
      ?auto_21147 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21145 ?auto_21144 ) ( IS-CRATE ?auto_21143 ) ( not ( = ?auto_21142 ?auto_21143 ) ) ( not ( = ?auto_21141 ?auto_21142 ) ) ( not ( = ?auto_21141 ?auto_21143 ) ) ( not ( = ?auto_21149 ?auto_21144 ) ) ( HOIST-AT ?auto_21146 ?auto_21149 ) ( not ( = ?auto_21145 ?auto_21146 ) ) ( AVAILABLE ?auto_21146 ) ( SURFACE-AT ?auto_21143 ?auto_21149 ) ( ON ?auto_21143 ?auto_21148 ) ( CLEAR ?auto_21143 ) ( not ( = ?auto_21142 ?auto_21148 ) ) ( not ( = ?auto_21143 ?auto_21148 ) ) ( not ( = ?auto_21141 ?auto_21148 ) ) ( TRUCK-AT ?auto_21147 ?auto_21144 ) ( SURFACE-AT ?auto_21141 ?auto_21144 ) ( CLEAR ?auto_21141 ) ( IS-CRATE ?auto_21142 ) ( AVAILABLE ?auto_21145 ) ( IN ?auto_21142 ?auto_21147 ) ( ON ?auto_21141 ?auto_21140 ) ( not ( = ?auto_21140 ?auto_21141 ) ) ( not ( = ?auto_21140 ?auto_21142 ) ) ( not ( = ?auto_21140 ?auto_21143 ) ) ( not ( = ?auto_21140 ?auto_21148 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21141 ?auto_21142 ?auto_21143 )
      ( MAKE-3CRATE-VERIFY ?auto_21140 ?auto_21141 ?auto_21142 ?auto_21143 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21150 - SURFACE
      ?auto_21151 - SURFACE
      ?auto_21152 - SURFACE
      ?auto_21153 - SURFACE
      ?auto_21154 - SURFACE
    )
    :vars
    (
      ?auto_21156 - HOIST
      ?auto_21155 - PLACE
      ?auto_21160 - PLACE
      ?auto_21157 - HOIST
      ?auto_21159 - SURFACE
      ?auto_21158 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21156 ?auto_21155 ) ( IS-CRATE ?auto_21154 ) ( not ( = ?auto_21153 ?auto_21154 ) ) ( not ( = ?auto_21152 ?auto_21153 ) ) ( not ( = ?auto_21152 ?auto_21154 ) ) ( not ( = ?auto_21160 ?auto_21155 ) ) ( HOIST-AT ?auto_21157 ?auto_21160 ) ( not ( = ?auto_21156 ?auto_21157 ) ) ( AVAILABLE ?auto_21157 ) ( SURFACE-AT ?auto_21154 ?auto_21160 ) ( ON ?auto_21154 ?auto_21159 ) ( CLEAR ?auto_21154 ) ( not ( = ?auto_21153 ?auto_21159 ) ) ( not ( = ?auto_21154 ?auto_21159 ) ) ( not ( = ?auto_21152 ?auto_21159 ) ) ( TRUCK-AT ?auto_21158 ?auto_21155 ) ( SURFACE-AT ?auto_21152 ?auto_21155 ) ( CLEAR ?auto_21152 ) ( IS-CRATE ?auto_21153 ) ( AVAILABLE ?auto_21156 ) ( IN ?auto_21153 ?auto_21158 ) ( ON ?auto_21151 ?auto_21150 ) ( ON ?auto_21152 ?auto_21151 ) ( not ( = ?auto_21150 ?auto_21151 ) ) ( not ( = ?auto_21150 ?auto_21152 ) ) ( not ( = ?auto_21150 ?auto_21153 ) ) ( not ( = ?auto_21150 ?auto_21154 ) ) ( not ( = ?auto_21150 ?auto_21159 ) ) ( not ( = ?auto_21151 ?auto_21152 ) ) ( not ( = ?auto_21151 ?auto_21153 ) ) ( not ( = ?auto_21151 ?auto_21154 ) ) ( not ( = ?auto_21151 ?auto_21159 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21152 ?auto_21153 ?auto_21154 )
      ( MAKE-4CRATE-VERIFY ?auto_21150 ?auto_21151 ?auto_21152 ?auto_21153 ?auto_21154 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21161 - SURFACE
      ?auto_21162 - SURFACE
    )
    :vars
    (
      ?auto_21164 - HOIST
      ?auto_21163 - PLACE
      ?auto_21169 - SURFACE
      ?auto_21168 - PLACE
      ?auto_21165 - HOIST
      ?auto_21167 - SURFACE
      ?auto_21166 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21164 ?auto_21163 ) ( IS-CRATE ?auto_21162 ) ( not ( = ?auto_21161 ?auto_21162 ) ) ( not ( = ?auto_21169 ?auto_21161 ) ) ( not ( = ?auto_21169 ?auto_21162 ) ) ( not ( = ?auto_21168 ?auto_21163 ) ) ( HOIST-AT ?auto_21165 ?auto_21168 ) ( not ( = ?auto_21164 ?auto_21165 ) ) ( AVAILABLE ?auto_21165 ) ( SURFACE-AT ?auto_21162 ?auto_21168 ) ( ON ?auto_21162 ?auto_21167 ) ( CLEAR ?auto_21162 ) ( not ( = ?auto_21161 ?auto_21167 ) ) ( not ( = ?auto_21162 ?auto_21167 ) ) ( not ( = ?auto_21169 ?auto_21167 ) ) ( SURFACE-AT ?auto_21169 ?auto_21163 ) ( CLEAR ?auto_21169 ) ( IS-CRATE ?auto_21161 ) ( AVAILABLE ?auto_21164 ) ( IN ?auto_21161 ?auto_21166 ) ( TRUCK-AT ?auto_21166 ?auto_21168 ) )
    :subtasks
    ( ( !DRIVE ?auto_21166 ?auto_21168 ?auto_21163 )
      ( MAKE-2CRATE ?auto_21169 ?auto_21161 ?auto_21162 )
      ( MAKE-1CRATE-VERIFY ?auto_21161 ?auto_21162 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21170 - SURFACE
      ?auto_21171 - SURFACE
      ?auto_21172 - SURFACE
    )
    :vars
    (
      ?auto_21173 - HOIST
      ?auto_21175 - PLACE
      ?auto_21177 - PLACE
      ?auto_21178 - HOIST
      ?auto_21176 - SURFACE
      ?auto_21174 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21173 ?auto_21175 ) ( IS-CRATE ?auto_21172 ) ( not ( = ?auto_21171 ?auto_21172 ) ) ( not ( = ?auto_21170 ?auto_21171 ) ) ( not ( = ?auto_21170 ?auto_21172 ) ) ( not ( = ?auto_21177 ?auto_21175 ) ) ( HOIST-AT ?auto_21178 ?auto_21177 ) ( not ( = ?auto_21173 ?auto_21178 ) ) ( AVAILABLE ?auto_21178 ) ( SURFACE-AT ?auto_21172 ?auto_21177 ) ( ON ?auto_21172 ?auto_21176 ) ( CLEAR ?auto_21172 ) ( not ( = ?auto_21171 ?auto_21176 ) ) ( not ( = ?auto_21172 ?auto_21176 ) ) ( not ( = ?auto_21170 ?auto_21176 ) ) ( SURFACE-AT ?auto_21170 ?auto_21175 ) ( CLEAR ?auto_21170 ) ( IS-CRATE ?auto_21171 ) ( AVAILABLE ?auto_21173 ) ( IN ?auto_21171 ?auto_21174 ) ( TRUCK-AT ?auto_21174 ?auto_21177 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21171 ?auto_21172 )
      ( MAKE-2CRATE-VERIFY ?auto_21170 ?auto_21171 ?auto_21172 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21179 - SURFACE
      ?auto_21180 - SURFACE
      ?auto_21181 - SURFACE
      ?auto_21182 - SURFACE
    )
    :vars
    (
      ?auto_21186 - HOIST
      ?auto_21185 - PLACE
      ?auto_21184 - PLACE
      ?auto_21188 - HOIST
      ?auto_21187 - SURFACE
      ?auto_21183 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21186 ?auto_21185 ) ( IS-CRATE ?auto_21182 ) ( not ( = ?auto_21181 ?auto_21182 ) ) ( not ( = ?auto_21180 ?auto_21181 ) ) ( not ( = ?auto_21180 ?auto_21182 ) ) ( not ( = ?auto_21184 ?auto_21185 ) ) ( HOIST-AT ?auto_21188 ?auto_21184 ) ( not ( = ?auto_21186 ?auto_21188 ) ) ( AVAILABLE ?auto_21188 ) ( SURFACE-AT ?auto_21182 ?auto_21184 ) ( ON ?auto_21182 ?auto_21187 ) ( CLEAR ?auto_21182 ) ( not ( = ?auto_21181 ?auto_21187 ) ) ( not ( = ?auto_21182 ?auto_21187 ) ) ( not ( = ?auto_21180 ?auto_21187 ) ) ( SURFACE-AT ?auto_21180 ?auto_21185 ) ( CLEAR ?auto_21180 ) ( IS-CRATE ?auto_21181 ) ( AVAILABLE ?auto_21186 ) ( IN ?auto_21181 ?auto_21183 ) ( TRUCK-AT ?auto_21183 ?auto_21184 ) ( ON ?auto_21180 ?auto_21179 ) ( not ( = ?auto_21179 ?auto_21180 ) ) ( not ( = ?auto_21179 ?auto_21181 ) ) ( not ( = ?auto_21179 ?auto_21182 ) ) ( not ( = ?auto_21179 ?auto_21187 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21180 ?auto_21181 ?auto_21182 )
      ( MAKE-3CRATE-VERIFY ?auto_21179 ?auto_21180 ?auto_21181 ?auto_21182 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21189 - SURFACE
      ?auto_21190 - SURFACE
      ?auto_21191 - SURFACE
      ?auto_21192 - SURFACE
      ?auto_21193 - SURFACE
    )
    :vars
    (
      ?auto_21197 - HOIST
      ?auto_21196 - PLACE
      ?auto_21195 - PLACE
      ?auto_21199 - HOIST
      ?auto_21198 - SURFACE
      ?auto_21194 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21197 ?auto_21196 ) ( IS-CRATE ?auto_21193 ) ( not ( = ?auto_21192 ?auto_21193 ) ) ( not ( = ?auto_21191 ?auto_21192 ) ) ( not ( = ?auto_21191 ?auto_21193 ) ) ( not ( = ?auto_21195 ?auto_21196 ) ) ( HOIST-AT ?auto_21199 ?auto_21195 ) ( not ( = ?auto_21197 ?auto_21199 ) ) ( AVAILABLE ?auto_21199 ) ( SURFACE-AT ?auto_21193 ?auto_21195 ) ( ON ?auto_21193 ?auto_21198 ) ( CLEAR ?auto_21193 ) ( not ( = ?auto_21192 ?auto_21198 ) ) ( not ( = ?auto_21193 ?auto_21198 ) ) ( not ( = ?auto_21191 ?auto_21198 ) ) ( SURFACE-AT ?auto_21191 ?auto_21196 ) ( CLEAR ?auto_21191 ) ( IS-CRATE ?auto_21192 ) ( AVAILABLE ?auto_21197 ) ( IN ?auto_21192 ?auto_21194 ) ( TRUCK-AT ?auto_21194 ?auto_21195 ) ( ON ?auto_21190 ?auto_21189 ) ( ON ?auto_21191 ?auto_21190 ) ( not ( = ?auto_21189 ?auto_21190 ) ) ( not ( = ?auto_21189 ?auto_21191 ) ) ( not ( = ?auto_21189 ?auto_21192 ) ) ( not ( = ?auto_21189 ?auto_21193 ) ) ( not ( = ?auto_21189 ?auto_21198 ) ) ( not ( = ?auto_21190 ?auto_21191 ) ) ( not ( = ?auto_21190 ?auto_21192 ) ) ( not ( = ?auto_21190 ?auto_21193 ) ) ( not ( = ?auto_21190 ?auto_21198 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21191 ?auto_21192 ?auto_21193 )
      ( MAKE-4CRATE-VERIFY ?auto_21189 ?auto_21190 ?auto_21191 ?auto_21192 ?auto_21193 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21200 - SURFACE
      ?auto_21201 - SURFACE
    )
    :vars
    (
      ?auto_21206 - HOIST
      ?auto_21204 - PLACE
      ?auto_21205 - SURFACE
      ?auto_21203 - PLACE
      ?auto_21208 - HOIST
      ?auto_21207 - SURFACE
      ?auto_21202 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21206 ?auto_21204 ) ( IS-CRATE ?auto_21201 ) ( not ( = ?auto_21200 ?auto_21201 ) ) ( not ( = ?auto_21205 ?auto_21200 ) ) ( not ( = ?auto_21205 ?auto_21201 ) ) ( not ( = ?auto_21203 ?auto_21204 ) ) ( HOIST-AT ?auto_21208 ?auto_21203 ) ( not ( = ?auto_21206 ?auto_21208 ) ) ( SURFACE-AT ?auto_21201 ?auto_21203 ) ( ON ?auto_21201 ?auto_21207 ) ( CLEAR ?auto_21201 ) ( not ( = ?auto_21200 ?auto_21207 ) ) ( not ( = ?auto_21201 ?auto_21207 ) ) ( not ( = ?auto_21205 ?auto_21207 ) ) ( SURFACE-AT ?auto_21205 ?auto_21204 ) ( CLEAR ?auto_21205 ) ( IS-CRATE ?auto_21200 ) ( AVAILABLE ?auto_21206 ) ( TRUCK-AT ?auto_21202 ?auto_21203 ) ( LIFTING ?auto_21208 ?auto_21200 ) )
    :subtasks
    ( ( !LOAD ?auto_21208 ?auto_21200 ?auto_21202 ?auto_21203 )
      ( MAKE-2CRATE ?auto_21205 ?auto_21200 ?auto_21201 )
      ( MAKE-1CRATE-VERIFY ?auto_21200 ?auto_21201 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21209 - SURFACE
      ?auto_21210 - SURFACE
      ?auto_21211 - SURFACE
    )
    :vars
    (
      ?auto_21215 - HOIST
      ?auto_21216 - PLACE
      ?auto_21212 - PLACE
      ?auto_21217 - HOIST
      ?auto_21214 - SURFACE
      ?auto_21213 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21215 ?auto_21216 ) ( IS-CRATE ?auto_21211 ) ( not ( = ?auto_21210 ?auto_21211 ) ) ( not ( = ?auto_21209 ?auto_21210 ) ) ( not ( = ?auto_21209 ?auto_21211 ) ) ( not ( = ?auto_21212 ?auto_21216 ) ) ( HOIST-AT ?auto_21217 ?auto_21212 ) ( not ( = ?auto_21215 ?auto_21217 ) ) ( SURFACE-AT ?auto_21211 ?auto_21212 ) ( ON ?auto_21211 ?auto_21214 ) ( CLEAR ?auto_21211 ) ( not ( = ?auto_21210 ?auto_21214 ) ) ( not ( = ?auto_21211 ?auto_21214 ) ) ( not ( = ?auto_21209 ?auto_21214 ) ) ( SURFACE-AT ?auto_21209 ?auto_21216 ) ( CLEAR ?auto_21209 ) ( IS-CRATE ?auto_21210 ) ( AVAILABLE ?auto_21215 ) ( TRUCK-AT ?auto_21213 ?auto_21212 ) ( LIFTING ?auto_21217 ?auto_21210 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21210 ?auto_21211 )
      ( MAKE-2CRATE-VERIFY ?auto_21209 ?auto_21210 ?auto_21211 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21218 - SURFACE
      ?auto_21219 - SURFACE
      ?auto_21220 - SURFACE
      ?auto_21221 - SURFACE
    )
    :vars
    (
      ?auto_21223 - HOIST
      ?auto_21225 - PLACE
      ?auto_21222 - PLACE
      ?auto_21224 - HOIST
      ?auto_21226 - SURFACE
      ?auto_21227 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21223 ?auto_21225 ) ( IS-CRATE ?auto_21221 ) ( not ( = ?auto_21220 ?auto_21221 ) ) ( not ( = ?auto_21219 ?auto_21220 ) ) ( not ( = ?auto_21219 ?auto_21221 ) ) ( not ( = ?auto_21222 ?auto_21225 ) ) ( HOIST-AT ?auto_21224 ?auto_21222 ) ( not ( = ?auto_21223 ?auto_21224 ) ) ( SURFACE-AT ?auto_21221 ?auto_21222 ) ( ON ?auto_21221 ?auto_21226 ) ( CLEAR ?auto_21221 ) ( not ( = ?auto_21220 ?auto_21226 ) ) ( not ( = ?auto_21221 ?auto_21226 ) ) ( not ( = ?auto_21219 ?auto_21226 ) ) ( SURFACE-AT ?auto_21219 ?auto_21225 ) ( CLEAR ?auto_21219 ) ( IS-CRATE ?auto_21220 ) ( AVAILABLE ?auto_21223 ) ( TRUCK-AT ?auto_21227 ?auto_21222 ) ( LIFTING ?auto_21224 ?auto_21220 ) ( ON ?auto_21219 ?auto_21218 ) ( not ( = ?auto_21218 ?auto_21219 ) ) ( not ( = ?auto_21218 ?auto_21220 ) ) ( not ( = ?auto_21218 ?auto_21221 ) ) ( not ( = ?auto_21218 ?auto_21226 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21219 ?auto_21220 ?auto_21221 )
      ( MAKE-3CRATE-VERIFY ?auto_21218 ?auto_21219 ?auto_21220 ?auto_21221 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21228 - SURFACE
      ?auto_21229 - SURFACE
      ?auto_21230 - SURFACE
      ?auto_21231 - SURFACE
      ?auto_21232 - SURFACE
    )
    :vars
    (
      ?auto_21234 - HOIST
      ?auto_21236 - PLACE
      ?auto_21233 - PLACE
      ?auto_21235 - HOIST
      ?auto_21237 - SURFACE
      ?auto_21238 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21234 ?auto_21236 ) ( IS-CRATE ?auto_21232 ) ( not ( = ?auto_21231 ?auto_21232 ) ) ( not ( = ?auto_21230 ?auto_21231 ) ) ( not ( = ?auto_21230 ?auto_21232 ) ) ( not ( = ?auto_21233 ?auto_21236 ) ) ( HOIST-AT ?auto_21235 ?auto_21233 ) ( not ( = ?auto_21234 ?auto_21235 ) ) ( SURFACE-AT ?auto_21232 ?auto_21233 ) ( ON ?auto_21232 ?auto_21237 ) ( CLEAR ?auto_21232 ) ( not ( = ?auto_21231 ?auto_21237 ) ) ( not ( = ?auto_21232 ?auto_21237 ) ) ( not ( = ?auto_21230 ?auto_21237 ) ) ( SURFACE-AT ?auto_21230 ?auto_21236 ) ( CLEAR ?auto_21230 ) ( IS-CRATE ?auto_21231 ) ( AVAILABLE ?auto_21234 ) ( TRUCK-AT ?auto_21238 ?auto_21233 ) ( LIFTING ?auto_21235 ?auto_21231 ) ( ON ?auto_21229 ?auto_21228 ) ( ON ?auto_21230 ?auto_21229 ) ( not ( = ?auto_21228 ?auto_21229 ) ) ( not ( = ?auto_21228 ?auto_21230 ) ) ( not ( = ?auto_21228 ?auto_21231 ) ) ( not ( = ?auto_21228 ?auto_21232 ) ) ( not ( = ?auto_21228 ?auto_21237 ) ) ( not ( = ?auto_21229 ?auto_21230 ) ) ( not ( = ?auto_21229 ?auto_21231 ) ) ( not ( = ?auto_21229 ?auto_21232 ) ) ( not ( = ?auto_21229 ?auto_21237 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21230 ?auto_21231 ?auto_21232 )
      ( MAKE-4CRATE-VERIFY ?auto_21228 ?auto_21229 ?auto_21230 ?auto_21231 ?auto_21232 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21239 - SURFACE
      ?auto_21240 - SURFACE
    )
    :vars
    (
      ?auto_21242 - HOIST
      ?auto_21244 - PLACE
      ?auto_21247 - SURFACE
      ?auto_21241 - PLACE
      ?auto_21243 - HOIST
      ?auto_21245 - SURFACE
      ?auto_21246 - TRUCK
      ?auto_21248 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21242 ?auto_21244 ) ( IS-CRATE ?auto_21240 ) ( not ( = ?auto_21239 ?auto_21240 ) ) ( not ( = ?auto_21247 ?auto_21239 ) ) ( not ( = ?auto_21247 ?auto_21240 ) ) ( not ( = ?auto_21241 ?auto_21244 ) ) ( HOIST-AT ?auto_21243 ?auto_21241 ) ( not ( = ?auto_21242 ?auto_21243 ) ) ( SURFACE-AT ?auto_21240 ?auto_21241 ) ( ON ?auto_21240 ?auto_21245 ) ( CLEAR ?auto_21240 ) ( not ( = ?auto_21239 ?auto_21245 ) ) ( not ( = ?auto_21240 ?auto_21245 ) ) ( not ( = ?auto_21247 ?auto_21245 ) ) ( SURFACE-AT ?auto_21247 ?auto_21244 ) ( CLEAR ?auto_21247 ) ( IS-CRATE ?auto_21239 ) ( AVAILABLE ?auto_21242 ) ( TRUCK-AT ?auto_21246 ?auto_21241 ) ( AVAILABLE ?auto_21243 ) ( SURFACE-AT ?auto_21239 ?auto_21241 ) ( ON ?auto_21239 ?auto_21248 ) ( CLEAR ?auto_21239 ) ( not ( = ?auto_21239 ?auto_21248 ) ) ( not ( = ?auto_21240 ?auto_21248 ) ) ( not ( = ?auto_21247 ?auto_21248 ) ) ( not ( = ?auto_21245 ?auto_21248 ) ) )
    :subtasks
    ( ( !LIFT ?auto_21243 ?auto_21239 ?auto_21248 ?auto_21241 )
      ( MAKE-2CRATE ?auto_21247 ?auto_21239 ?auto_21240 )
      ( MAKE-1CRATE-VERIFY ?auto_21239 ?auto_21240 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21249 - SURFACE
      ?auto_21250 - SURFACE
      ?auto_21251 - SURFACE
    )
    :vars
    (
      ?auto_21256 - HOIST
      ?auto_21255 - PLACE
      ?auto_21252 - PLACE
      ?auto_21257 - HOIST
      ?auto_21253 - SURFACE
      ?auto_21254 - TRUCK
      ?auto_21258 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21256 ?auto_21255 ) ( IS-CRATE ?auto_21251 ) ( not ( = ?auto_21250 ?auto_21251 ) ) ( not ( = ?auto_21249 ?auto_21250 ) ) ( not ( = ?auto_21249 ?auto_21251 ) ) ( not ( = ?auto_21252 ?auto_21255 ) ) ( HOIST-AT ?auto_21257 ?auto_21252 ) ( not ( = ?auto_21256 ?auto_21257 ) ) ( SURFACE-AT ?auto_21251 ?auto_21252 ) ( ON ?auto_21251 ?auto_21253 ) ( CLEAR ?auto_21251 ) ( not ( = ?auto_21250 ?auto_21253 ) ) ( not ( = ?auto_21251 ?auto_21253 ) ) ( not ( = ?auto_21249 ?auto_21253 ) ) ( SURFACE-AT ?auto_21249 ?auto_21255 ) ( CLEAR ?auto_21249 ) ( IS-CRATE ?auto_21250 ) ( AVAILABLE ?auto_21256 ) ( TRUCK-AT ?auto_21254 ?auto_21252 ) ( AVAILABLE ?auto_21257 ) ( SURFACE-AT ?auto_21250 ?auto_21252 ) ( ON ?auto_21250 ?auto_21258 ) ( CLEAR ?auto_21250 ) ( not ( = ?auto_21250 ?auto_21258 ) ) ( not ( = ?auto_21251 ?auto_21258 ) ) ( not ( = ?auto_21249 ?auto_21258 ) ) ( not ( = ?auto_21253 ?auto_21258 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21250 ?auto_21251 )
      ( MAKE-2CRATE-VERIFY ?auto_21249 ?auto_21250 ?auto_21251 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21259 - SURFACE
      ?auto_21260 - SURFACE
      ?auto_21261 - SURFACE
      ?auto_21262 - SURFACE
    )
    :vars
    (
      ?auto_21264 - HOIST
      ?auto_21267 - PLACE
      ?auto_21268 - PLACE
      ?auto_21265 - HOIST
      ?auto_21269 - SURFACE
      ?auto_21266 - TRUCK
      ?auto_21263 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21264 ?auto_21267 ) ( IS-CRATE ?auto_21262 ) ( not ( = ?auto_21261 ?auto_21262 ) ) ( not ( = ?auto_21260 ?auto_21261 ) ) ( not ( = ?auto_21260 ?auto_21262 ) ) ( not ( = ?auto_21268 ?auto_21267 ) ) ( HOIST-AT ?auto_21265 ?auto_21268 ) ( not ( = ?auto_21264 ?auto_21265 ) ) ( SURFACE-AT ?auto_21262 ?auto_21268 ) ( ON ?auto_21262 ?auto_21269 ) ( CLEAR ?auto_21262 ) ( not ( = ?auto_21261 ?auto_21269 ) ) ( not ( = ?auto_21262 ?auto_21269 ) ) ( not ( = ?auto_21260 ?auto_21269 ) ) ( SURFACE-AT ?auto_21260 ?auto_21267 ) ( CLEAR ?auto_21260 ) ( IS-CRATE ?auto_21261 ) ( AVAILABLE ?auto_21264 ) ( TRUCK-AT ?auto_21266 ?auto_21268 ) ( AVAILABLE ?auto_21265 ) ( SURFACE-AT ?auto_21261 ?auto_21268 ) ( ON ?auto_21261 ?auto_21263 ) ( CLEAR ?auto_21261 ) ( not ( = ?auto_21261 ?auto_21263 ) ) ( not ( = ?auto_21262 ?auto_21263 ) ) ( not ( = ?auto_21260 ?auto_21263 ) ) ( not ( = ?auto_21269 ?auto_21263 ) ) ( ON ?auto_21260 ?auto_21259 ) ( not ( = ?auto_21259 ?auto_21260 ) ) ( not ( = ?auto_21259 ?auto_21261 ) ) ( not ( = ?auto_21259 ?auto_21262 ) ) ( not ( = ?auto_21259 ?auto_21269 ) ) ( not ( = ?auto_21259 ?auto_21263 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21260 ?auto_21261 ?auto_21262 )
      ( MAKE-3CRATE-VERIFY ?auto_21259 ?auto_21260 ?auto_21261 ?auto_21262 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21270 - SURFACE
      ?auto_21271 - SURFACE
      ?auto_21272 - SURFACE
      ?auto_21273 - SURFACE
      ?auto_21274 - SURFACE
    )
    :vars
    (
      ?auto_21276 - HOIST
      ?auto_21279 - PLACE
      ?auto_21280 - PLACE
      ?auto_21277 - HOIST
      ?auto_21281 - SURFACE
      ?auto_21278 - TRUCK
      ?auto_21275 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21276 ?auto_21279 ) ( IS-CRATE ?auto_21274 ) ( not ( = ?auto_21273 ?auto_21274 ) ) ( not ( = ?auto_21272 ?auto_21273 ) ) ( not ( = ?auto_21272 ?auto_21274 ) ) ( not ( = ?auto_21280 ?auto_21279 ) ) ( HOIST-AT ?auto_21277 ?auto_21280 ) ( not ( = ?auto_21276 ?auto_21277 ) ) ( SURFACE-AT ?auto_21274 ?auto_21280 ) ( ON ?auto_21274 ?auto_21281 ) ( CLEAR ?auto_21274 ) ( not ( = ?auto_21273 ?auto_21281 ) ) ( not ( = ?auto_21274 ?auto_21281 ) ) ( not ( = ?auto_21272 ?auto_21281 ) ) ( SURFACE-AT ?auto_21272 ?auto_21279 ) ( CLEAR ?auto_21272 ) ( IS-CRATE ?auto_21273 ) ( AVAILABLE ?auto_21276 ) ( TRUCK-AT ?auto_21278 ?auto_21280 ) ( AVAILABLE ?auto_21277 ) ( SURFACE-AT ?auto_21273 ?auto_21280 ) ( ON ?auto_21273 ?auto_21275 ) ( CLEAR ?auto_21273 ) ( not ( = ?auto_21273 ?auto_21275 ) ) ( not ( = ?auto_21274 ?auto_21275 ) ) ( not ( = ?auto_21272 ?auto_21275 ) ) ( not ( = ?auto_21281 ?auto_21275 ) ) ( ON ?auto_21271 ?auto_21270 ) ( ON ?auto_21272 ?auto_21271 ) ( not ( = ?auto_21270 ?auto_21271 ) ) ( not ( = ?auto_21270 ?auto_21272 ) ) ( not ( = ?auto_21270 ?auto_21273 ) ) ( not ( = ?auto_21270 ?auto_21274 ) ) ( not ( = ?auto_21270 ?auto_21281 ) ) ( not ( = ?auto_21270 ?auto_21275 ) ) ( not ( = ?auto_21271 ?auto_21272 ) ) ( not ( = ?auto_21271 ?auto_21273 ) ) ( not ( = ?auto_21271 ?auto_21274 ) ) ( not ( = ?auto_21271 ?auto_21281 ) ) ( not ( = ?auto_21271 ?auto_21275 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21272 ?auto_21273 ?auto_21274 )
      ( MAKE-4CRATE-VERIFY ?auto_21270 ?auto_21271 ?auto_21272 ?auto_21273 ?auto_21274 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21282 - SURFACE
      ?auto_21283 - SURFACE
    )
    :vars
    (
      ?auto_21285 - HOIST
      ?auto_21289 - PLACE
      ?auto_21287 - SURFACE
      ?auto_21290 - PLACE
      ?auto_21286 - HOIST
      ?auto_21291 - SURFACE
      ?auto_21284 - SURFACE
      ?auto_21288 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21285 ?auto_21289 ) ( IS-CRATE ?auto_21283 ) ( not ( = ?auto_21282 ?auto_21283 ) ) ( not ( = ?auto_21287 ?auto_21282 ) ) ( not ( = ?auto_21287 ?auto_21283 ) ) ( not ( = ?auto_21290 ?auto_21289 ) ) ( HOIST-AT ?auto_21286 ?auto_21290 ) ( not ( = ?auto_21285 ?auto_21286 ) ) ( SURFACE-AT ?auto_21283 ?auto_21290 ) ( ON ?auto_21283 ?auto_21291 ) ( CLEAR ?auto_21283 ) ( not ( = ?auto_21282 ?auto_21291 ) ) ( not ( = ?auto_21283 ?auto_21291 ) ) ( not ( = ?auto_21287 ?auto_21291 ) ) ( SURFACE-AT ?auto_21287 ?auto_21289 ) ( CLEAR ?auto_21287 ) ( IS-CRATE ?auto_21282 ) ( AVAILABLE ?auto_21285 ) ( AVAILABLE ?auto_21286 ) ( SURFACE-AT ?auto_21282 ?auto_21290 ) ( ON ?auto_21282 ?auto_21284 ) ( CLEAR ?auto_21282 ) ( not ( = ?auto_21282 ?auto_21284 ) ) ( not ( = ?auto_21283 ?auto_21284 ) ) ( not ( = ?auto_21287 ?auto_21284 ) ) ( not ( = ?auto_21291 ?auto_21284 ) ) ( TRUCK-AT ?auto_21288 ?auto_21289 ) )
    :subtasks
    ( ( !DRIVE ?auto_21288 ?auto_21289 ?auto_21290 )
      ( MAKE-2CRATE ?auto_21287 ?auto_21282 ?auto_21283 )
      ( MAKE-1CRATE-VERIFY ?auto_21282 ?auto_21283 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21292 - SURFACE
      ?auto_21293 - SURFACE
      ?auto_21294 - SURFACE
    )
    :vars
    (
      ?auto_21295 - HOIST
      ?auto_21296 - PLACE
      ?auto_21301 - PLACE
      ?auto_21298 - HOIST
      ?auto_21297 - SURFACE
      ?auto_21300 - SURFACE
      ?auto_21299 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21295 ?auto_21296 ) ( IS-CRATE ?auto_21294 ) ( not ( = ?auto_21293 ?auto_21294 ) ) ( not ( = ?auto_21292 ?auto_21293 ) ) ( not ( = ?auto_21292 ?auto_21294 ) ) ( not ( = ?auto_21301 ?auto_21296 ) ) ( HOIST-AT ?auto_21298 ?auto_21301 ) ( not ( = ?auto_21295 ?auto_21298 ) ) ( SURFACE-AT ?auto_21294 ?auto_21301 ) ( ON ?auto_21294 ?auto_21297 ) ( CLEAR ?auto_21294 ) ( not ( = ?auto_21293 ?auto_21297 ) ) ( not ( = ?auto_21294 ?auto_21297 ) ) ( not ( = ?auto_21292 ?auto_21297 ) ) ( SURFACE-AT ?auto_21292 ?auto_21296 ) ( CLEAR ?auto_21292 ) ( IS-CRATE ?auto_21293 ) ( AVAILABLE ?auto_21295 ) ( AVAILABLE ?auto_21298 ) ( SURFACE-AT ?auto_21293 ?auto_21301 ) ( ON ?auto_21293 ?auto_21300 ) ( CLEAR ?auto_21293 ) ( not ( = ?auto_21293 ?auto_21300 ) ) ( not ( = ?auto_21294 ?auto_21300 ) ) ( not ( = ?auto_21292 ?auto_21300 ) ) ( not ( = ?auto_21297 ?auto_21300 ) ) ( TRUCK-AT ?auto_21299 ?auto_21296 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21293 ?auto_21294 )
      ( MAKE-2CRATE-VERIFY ?auto_21292 ?auto_21293 ?auto_21294 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21302 - SURFACE
      ?auto_21303 - SURFACE
      ?auto_21304 - SURFACE
      ?auto_21305 - SURFACE
    )
    :vars
    (
      ?auto_21310 - HOIST
      ?auto_21312 - PLACE
      ?auto_21307 - PLACE
      ?auto_21309 - HOIST
      ?auto_21308 - SURFACE
      ?auto_21311 - SURFACE
      ?auto_21306 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21310 ?auto_21312 ) ( IS-CRATE ?auto_21305 ) ( not ( = ?auto_21304 ?auto_21305 ) ) ( not ( = ?auto_21303 ?auto_21304 ) ) ( not ( = ?auto_21303 ?auto_21305 ) ) ( not ( = ?auto_21307 ?auto_21312 ) ) ( HOIST-AT ?auto_21309 ?auto_21307 ) ( not ( = ?auto_21310 ?auto_21309 ) ) ( SURFACE-AT ?auto_21305 ?auto_21307 ) ( ON ?auto_21305 ?auto_21308 ) ( CLEAR ?auto_21305 ) ( not ( = ?auto_21304 ?auto_21308 ) ) ( not ( = ?auto_21305 ?auto_21308 ) ) ( not ( = ?auto_21303 ?auto_21308 ) ) ( SURFACE-AT ?auto_21303 ?auto_21312 ) ( CLEAR ?auto_21303 ) ( IS-CRATE ?auto_21304 ) ( AVAILABLE ?auto_21310 ) ( AVAILABLE ?auto_21309 ) ( SURFACE-AT ?auto_21304 ?auto_21307 ) ( ON ?auto_21304 ?auto_21311 ) ( CLEAR ?auto_21304 ) ( not ( = ?auto_21304 ?auto_21311 ) ) ( not ( = ?auto_21305 ?auto_21311 ) ) ( not ( = ?auto_21303 ?auto_21311 ) ) ( not ( = ?auto_21308 ?auto_21311 ) ) ( TRUCK-AT ?auto_21306 ?auto_21312 ) ( ON ?auto_21303 ?auto_21302 ) ( not ( = ?auto_21302 ?auto_21303 ) ) ( not ( = ?auto_21302 ?auto_21304 ) ) ( not ( = ?auto_21302 ?auto_21305 ) ) ( not ( = ?auto_21302 ?auto_21308 ) ) ( not ( = ?auto_21302 ?auto_21311 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21303 ?auto_21304 ?auto_21305 )
      ( MAKE-3CRATE-VERIFY ?auto_21302 ?auto_21303 ?auto_21304 ?auto_21305 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21313 - SURFACE
      ?auto_21314 - SURFACE
      ?auto_21315 - SURFACE
      ?auto_21316 - SURFACE
      ?auto_21317 - SURFACE
    )
    :vars
    (
      ?auto_21322 - HOIST
      ?auto_21324 - PLACE
      ?auto_21319 - PLACE
      ?auto_21321 - HOIST
      ?auto_21320 - SURFACE
      ?auto_21323 - SURFACE
      ?auto_21318 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21322 ?auto_21324 ) ( IS-CRATE ?auto_21317 ) ( not ( = ?auto_21316 ?auto_21317 ) ) ( not ( = ?auto_21315 ?auto_21316 ) ) ( not ( = ?auto_21315 ?auto_21317 ) ) ( not ( = ?auto_21319 ?auto_21324 ) ) ( HOIST-AT ?auto_21321 ?auto_21319 ) ( not ( = ?auto_21322 ?auto_21321 ) ) ( SURFACE-AT ?auto_21317 ?auto_21319 ) ( ON ?auto_21317 ?auto_21320 ) ( CLEAR ?auto_21317 ) ( not ( = ?auto_21316 ?auto_21320 ) ) ( not ( = ?auto_21317 ?auto_21320 ) ) ( not ( = ?auto_21315 ?auto_21320 ) ) ( SURFACE-AT ?auto_21315 ?auto_21324 ) ( CLEAR ?auto_21315 ) ( IS-CRATE ?auto_21316 ) ( AVAILABLE ?auto_21322 ) ( AVAILABLE ?auto_21321 ) ( SURFACE-AT ?auto_21316 ?auto_21319 ) ( ON ?auto_21316 ?auto_21323 ) ( CLEAR ?auto_21316 ) ( not ( = ?auto_21316 ?auto_21323 ) ) ( not ( = ?auto_21317 ?auto_21323 ) ) ( not ( = ?auto_21315 ?auto_21323 ) ) ( not ( = ?auto_21320 ?auto_21323 ) ) ( TRUCK-AT ?auto_21318 ?auto_21324 ) ( ON ?auto_21314 ?auto_21313 ) ( ON ?auto_21315 ?auto_21314 ) ( not ( = ?auto_21313 ?auto_21314 ) ) ( not ( = ?auto_21313 ?auto_21315 ) ) ( not ( = ?auto_21313 ?auto_21316 ) ) ( not ( = ?auto_21313 ?auto_21317 ) ) ( not ( = ?auto_21313 ?auto_21320 ) ) ( not ( = ?auto_21313 ?auto_21323 ) ) ( not ( = ?auto_21314 ?auto_21315 ) ) ( not ( = ?auto_21314 ?auto_21316 ) ) ( not ( = ?auto_21314 ?auto_21317 ) ) ( not ( = ?auto_21314 ?auto_21320 ) ) ( not ( = ?auto_21314 ?auto_21323 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21315 ?auto_21316 ?auto_21317 )
      ( MAKE-4CRATE-VERIFY ?auto_21313 ?auto_21314 ?auto_21315 ?auto_21316 ?auto_21317 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21325 - SURFACE
      ?auto_21326 - SURFACE
    )
    :vars
    (
      ?auto_21331 - HOIST
      ?auto_21334 - PLACE
      ?auto_21332 - SURFACE
      ?auto_21328 - PLACE
      ?auto_21330 - HOIST
      ?auto_21329 - SURFACE
      ?auto_21333 - SURFACE
      ?auto_21327 - TRUCK
      ?auto_21335 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21331 ?auto_21334 ) ( IS-CRATE ?auto_21326 ) ( not ( = ?auto_21325 ?auto_21326 ) ) ( not ( = ?auto_21332 ?auto_21325 ) ) ( not ( = ?auto_21332 ?auto_21326 ) ) ( not ( = ?auto_21328 ?auto_21334 ) ) ( HOIST-AT ?auto_21330 ?auto_21328 ) ( not ( = ?auto_21331 ?auto_21330 ) ) ( SURFACE-AT ?auto_21326 ?auto_21328 ) ( ON ?auto_21326 ?auto_21329 ) ( CLEAR ?auto_21326 ) ( not ( = ?auto_21325 ?auto_21329 ) ) ( not ( = ?auto_21326 ?auto_21329 ) ) ( not ( = ?auto_21332 ?auto_21329 ) ) ( IS-CRATE ?auto_21325 ) ( AVAILABLE ?auto_21330 ) ( SURFACE-AT ?auto_21325 ?auto_21328 ) ( ON ?auto_21325 ?auto_21333 ) ( CLEAR ?auto_21325 ) ( not ( = ?auto_21325 ?auto_21333 ) ) ( not ( = ?auto_21326 ?auto_21333 ) ) ( not ( = ?auto_21332 ?auto_21333 ) ) ( not ( = ?auto_21329 ?auto_21333 ) ) ( TRUCK-AT ?auto_21327 ?auto_21334 ) ( SURFACE-AT ?auto_21335 ?auto_21334 ) ( CLEAR ?auto_21335 ) ( LIFTING ?auto_21331 ?auto_21332 ) ( IS-CRATE ?auto_21332 ) ( not ( = ?auto_21335 ?auto_21332 ) ) ( not ( = ?auto_21325 ?auto_21335 ) ) ( not ( = ?auto_21326 ?auto_21335 ) ) ( not ( = ?auto_21329 ?auto_21335 ) ) ( not ( = ?auto_21333 ?auto_21335 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21335 ?auto_21332 )
      ( MAKE-2CRATE ?auto_21332 ?auto_21325 ?auto_21326 )
      ( MAKE-1CRATE-VERIFY ?auto_21325 ?auto_21326 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21336 - SURFACE
      ?auto_21337 - SURFACE
      ?auto_21338 - SURFACE
    )
    :vars
    (
      ?auto_21340 - HOIST
      ?auto_21341 - PLACE
      ?auto_21345 - PLACE
      ?auto_21339 - HOIST
      ?auto_21344 - SURFACE
      ?auto_21343 - SURFACE
      ?auto_21346 - TRUCK
      ?auto_21342 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21340 ?auto_21341 ) ( IS-CRATE ?auto_21338 ) ( not ( = ?auto_21337 ?auto_21338 ) ) ( not ( = ?auto_21336 ?auto_21337 ) ) ( not ( = ?auto_21336 ?auto_21338 ) ) ( not ( = ?auto_21345 ?auto_21341 ) ) ( HOIST-AT ?auto_21339 ?auto_21345 ) ( not ( = ?auto_21340 ?auto_21339 ) ) ( SURFACE-AT ?auto_21338 ?auto_21345 ) ( ON ?auto_21338 ?auto_21344 ) ( CLEAR ?auto_21338 ) ( not ( = ?auto_21337 ?auto_21344 ) ) ( not ( = ?auto_21338 ?auto_21344 ) ) ( not ( = ?auto_21336 ?auto_21344 ) ) ( IS-CRATE ?auto_21337 ) ( AVAILABLE ?auto_21339 ) ( SURFACE-AT ?auto_21337 ?auto_21345 ) ( ON ?auto_21337 ?auto_21343 ) ( CLEAR ?auto_21337 ) ( not ( = ?auto_21337 ?auto_21343 ) ) ( not ( = ?auto_21338 ?auto_21343 ) ) ( not ( = ?auto_21336 ?auto_21343 ) ) ( not ( = ?auto_21344 ?auto_21343 ) ) ( TRUCK-AT ?auto_21346 ?auto_21341 ) ( SURFACE-AT ?auto_21342 ?auto_21341 ) ( CLEAR ?auto_21342 ) ( LIFTING ?auto_21340 ?auto_21336 ) ( IS-CRATE ?auto_21336 ) ( not ( = ?auto_21342 ?auto_21336 ) ) ( not ( = ?auto_21337 ?auto_21342 ) ) ( not ( = ?auto_21338 ?auto_21342 ) ) ( not ( = ?auto_21344 ?auto_21342 ) ) ( not ( = ?auto_21343 ?auto_21342 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21337 ?auto_21338 )
      ( MAKE-2CRATE-VERIFY ?auto_21336 ?auto_21337 ?auto_21338 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21347 - SURFACE
      ?auto_21348 - SURFACE
      ?auto_21349 - SURFACE
      ?auto_21350 - SURFACE
    )
    :vars
    (
      ?auto_21352 - HOIST
      ?auto_21356 - PLACE
      ?auto_21351 - PLACE
      ?auto_21355 - HOIST
      ?auto_21357 - SURFACE
      ?auto_21353 - SURFACE
      ?auto_21354 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21352 ?auto_21356 ) ( IS-CRATE ?auto_21350 ) ( not ( = ?auto_21349 ?auto_21350 ) ) ( not ( = ?auto_21348 ?auto_21349 ) ) ( not ( = ?auto_21348 ?auto_21350 ) ) ( not ( = ?auto_21351 ?auto_21356 ) ) ( HOIST-AT ?auto_21355 ?auto_21351 ) ( not ( = ?auto_21352 ?auto_21355 ) ) ( SURFACE-AT ?auto_21350 ?auto_21351 ) ( ON ?auto_21350 ?auto_21357 ) ( CLEAR ?auto_21350 ) ( not ( = ?auto_21349 ?auto_21357 ) ) ( not ( = ?auto_21350 ?auto_21357 ) ) ( not ( = ?auto_21348 ?auto_21357 ) ) ( IS-CRATE ?auto_21349 ) ( AVAILABLE ?auto_21355 ) ( SURFACE-AT ?auto_21349 ?auto_21351 ) ( ON ?auto_21349 ?auto_21353 ) ( CLEAR ?auto_21349 ) ( not ( = ?auto_21349 ?auto_21353 ) ) ( not ( = ?auto_21350 ?auto_21353 ) ) ( not ( = ?auto_21348 ?auto_21353 ) ) ( not ( = ?auto_21357 ?auto_21353 ) ) ( TRUCK-AT ?auto_21354 ?auto_21356 ) ( SURFACE-AT ?auto_21347 ?auto_21356 ) ( CLEAR ?auto_21347 ) ( LIFTING ?auto_21352 ?auto_21348 ) ( IS-CRATE ?auto_21348 ) ( not ( = ?auto_21347 ?auto_21348 ) ) ( not ( = ?auto_21349 ?auto_21347 ) ) ( not ( = ?auto_21350 ?auto_21347 ) ) ( not ( = ?auto_21357 ?auto_21347 ) ) ( not ( = ?auto_21353 ?auto_21347 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21348 ?auto_21349 ?auto_21350 )
      ( MAKE-3CRATE-VERIFY ?auto_21347 ?auto_21348 ?auto_21349 ?auto_21350 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21358 - SURFACE
      ?auto_21359 - SURFACE
      ?auto_21360 - SURFACE
      ?auto_21361 - SURFACE
      ?auto_21362 - SURFACE
    )
    :vars
    (
      ?auto_21364 - HOIST
      ?auto_21368 - PLACE
      ?auto_21363 - PLACE
      ?auto_21367 - HOIST
      ?auto_21369 - SURFACE
      ?auto_21365 - SURFACE
      ?auto_21366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21364 ?auto_21368 ) ( IS-CRATE ?auto_21362 ) ( not ( = ?auto_21361 ?auto_21362 ) ) ( not ( = ?auto_21360 ?auto_21361 ) ) ( not ( = ?auto_21360 ?auto_21362 ) ) ( not ( = ?auto_21363 ?auto_21368 ) ) ( HOIST-AT ?auto_21367 ?auto_21363 ) ( not ( = ?auto_21364 ?auto_21367 ) ) ( SURFACE-AT ?auto_21362 ?auto_21363 ) ( ON ?auto_21362 ?auto_21369 ) ( CLEAR ?auto_21362 ) ( not ( = ?auto_21361 ?auto_21369 ) ) ( not ( = ?auto_21362 ?auto_21369 ) ) ( not ( = ?auto_21360 ?auto_21369 ) ) ( IS-CRATE ?auto_21361 ) ( AVAILABLE ?auto_21367 ) ( SURFACE-AT ?auto_21361 ?auto_21363 ) ( ON ?auto_21361 ?auto_21365 ) ( CLEAR ?auto_21361 ) ( not ( = ?auto_21361 ?auto_21365 ) ) ( not ( = ?auto_21362 ?auto_21365 ) ) ( not ( = ?auto_21360 ?auto_21365 ) ) ( not ( = ?auto_21369 ?auto_21365 ) ) ( TRUCK-AT ?auto_21366 ?auto_21368 ) ( SURFACE-AT ?auto_21359 ?auto_21368 ) ( CLEAR ?auto_21359 ) ( LIFTING ?auto_21364 ?auto_21360 ) ( IS-CRATE ?auto_21360 ) ( not ( = ?auto_21359 ?auto_21360 ) ) ( not ( = ?auto_21361 ?auto_21359 ) ) ( not ( = ?auto_21362 ?auto_21359 ) ) ( not ( = ?auto_21369 ?auto_21359 ) ) ( not ( = ?auto_21365 ?auto_21359 ) ) ( ON ?auto_21359 ?auto_21358 ) ( not ( = ?auto_21358 ?auto_21359 ) ) ( not ( = ?auto_21358 ?auto_21360 ) ) ( not ( = ?auto_21358 ?auto_21361 ) ) ( not ( = ?auto_21358 ?auto_21362 ) ) ( not ( = ?auto_21358 ?auto_21369 ) ) ( not ( = ?auto_21358 ?auto_21365 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21360 ?auto_21361 ?auto_21362 )
      ( MAKE-4CRATE-VERIFY ?auto_21358 ?auto_21359 ?auto_21360 ?auto_21361 ?auto_21362 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21370 - SURFACE
      ?auto_21371 - SURFACE
    )
    :vars
    (
      ?auto_21373 - HOIST
      ?auto_21377 - PLACE
      ?auto_21380 - SURFACE
      ?auto_21372 - PLACE
      ?auto_21376 - HOIST
      ?auto_21378 - SURFACE
      ?auto_21374 - SURFACE
      ?auto_21375 - TRUCK
      ?auto_21379 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21373 ?auto_21377 ) ( IS-CRATE ?auto_21371 ) ( not ( = ?auto_21370 ?auto_21371 ) ) ( not ( = ?auto_21380 ?auto_21370 ) ) ( not ( = ?auto_21380 ?auto_21371 ) ) ( not ( = ?auto_21372 ?auto_21377 ) ) ( HOIST-AT ?auto_21376 ?auto_21372 ) ( not ( = ?auto_21373 ?auto_21376 ) ) ( SURFACE-AT ?auto_21371 ?auto_21372 ) ( ON ?auto_21371 ?auto_21378 ) ( CLEAR ?auto_21371 ) ( not ( = ?auto_21370 ?auto_21378 ) ) ( not ( = ?auto_21371 ?auto_21378 ) ) ( not ( = ?auto_21380 ?auto_21378 ) ) ( IS-CRATE ?auto_21370 ) ( AVAILABLE ?auto_21376 ) ( SURFACE-AT ?auto_21370 ?auto_21372 ) ( ON ?auto_21370 ?auto_21374 ) ( CLEAR ?auto_21370 ) ( not ( = ?auto_21370 ?auto_21374 ) ) ( not ( = ?auto_21371 ?auto_21374 ) ) ( not ( = ?auto_21380 ?auto_21374 ) ) ( not ( = ?auto_21378 ?auto_21374 ) ) ( TRUCK-AT ?auto_21375 ?auto_21377 ) ( SURFACE-AT ?auto_21379 ?auto_21377 ) ( CLEAR ?auto_21379 ) ( IS-CRATE ?auto_21380 ) ( not ( = ?auto_21379 ?auto_21380 ) ) ( not ( = ?auto_21370 ?auto_21379 ) ) ( not ( = ?auto_21371 ?auto_21379 ) ) ( not ( = ?auto_21378 ?auto_21379 ) ) ( not ( = ?auto_21374 ?auto_21379 ) ) ( AVAILABLE ?auto_21373 ) ( IN ?auto_21380 ?auto_21375 ) )
    :subtasks
    ( ( !UNLOAD ?auto_21373 ?auto_21380 ?auto_21375 ?auto_21377 )
      ( MAKE-2CRATE ?auto_21380 ?auto_21370 ?auto_21371 )
      ( MAKE-1CRATE-VERIFY ?auto_21370 ?auto_21371 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21381 - SURFACE
      ?auto_21382 - SURFACE
      ?auto_21383 - SURFACE
    )
    :vars
    (
      ?auto_21391 - HOIST
      ?auto_21389 - PLACE
      ?auto_21390 - PLACE
      ?auto_21388 - HOIST
      ?auto_21385 - SURFACE
      ?auto_21386 - SURFACE
      ?auto_21384 - TRUCK
      ?auto_21387 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21391 ?auto_21389 ) ( IS-CRATE ?auto_21383 ) ( not ( = ?auto_21382 ?auto_21383 ) ) ( not ( = ?auto_21381 ?auto_21382 ) ) ( not ( = ?auto_21381 ?auto_21383 ) ) ( not ( = ?auto_21390 ?auto_21389 ) ) ( HOIST-AT ?auto_21388 ?auto_21390 ) ( not ( = ?auto_21391 ?auto_21388 ) ) ( SURFACE-AT ?auto_21383 ?auto_21390 ) ( ON ?auto_21383 ?auto_21385 ) ( CLEAR ?auto_21383 ) ( not ( = ?auto_21382 ?auto_21385 ) ) ( not ( = ?auto_21383 ?auto_21385 ) ) ( not ( = ?auto_21381 ?auto_21385 ) ) ( IS-CRATE ?auto_21382 ) ( AVAILABLE ?auto_21388 ) ( SURFACE-AT ?auto_21382 ?auto_21390 ) ( ON ?auto_21382 ?auto_21386 ) ( CLEAR ?auto_21382 ) ( not ( = ?auto_21382 ?auto_21386 ) ) ( not ( = ?auto_21383 ?auto_21386 ) ) ( not ( = ?auto_21381 ?auto_21386 ) ) ( not ( = ?auto_21385 ?auto_21386 ) ) ( TRUCK-AT ?auto_21384 ?auto_21389 ) ( SURFACE-AT ?auto_21387 ?auto_21389 ) ( CLEAR ?auto_21387 ) ( IS-CRATE ?auto_21381 ) ( not ( = ?auto_21387 ?auto_21381 ) ) ( not ( = ?auto_21382 ?auto_21387 ) ) ( not ( = ?auto_21383 ?auto_21387 ) ) ( not ( = ?auto_21385 ?auto_21387 ) ) ( not ( = ?auto_21386 ?auto_21387 ) ) ( AVAILABLE ?auto_21391 ) ( IN ?auto_21381 ?auto_21384 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21382 ?auto_21383 )
      ( MAKE-2CRATE-VERIFY ?auto_21381 ?auto_21382 ?auto_21383 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21392 - SURFACE
      ?auto_21393 - SURFACE
      ?auto_21394 - SURFACE
      ?auto_21395 - SURFACE
    )
    :vars
    (
      ?auto_21401 - HOIST
      ?auto_21399 - PLACE
      ?auto_21396 - PLACE
      ?auto_21402 - HOIST
      ?auto_21400 - SURFACE
      ?auto_21397 - SURFACE
      ?auto_21398 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21401 ?auto_21399 ) ( IS-CRATE ?auto_21395 ) ( not ( = ?auto_21394 ?auto_21395 ) ) ( not ( = ?auto_21393 ?auto_21394 ) ) ( not ( = ?auto_21393 ?auto_21395 ) ) ( not ( = ?auto_21396 ?auto_21399 ) ) ( HOIST-AT ?auto_21402 ?auto_21396 ) ( not ( = ?auto_21401 ?auto_21402 ) ) ( SURFACE-AT ?auto_21395 ?auto_21396 ) ( ON ?auto_21395 ?auto_21400 ) ( CLEAR ?auto_21395 ) ( not ( = ?auto_21394 ?auto_21400 ) ) ( not ( = ?auto_21395 ?auto_21400 ) ) ( not ( = ?auto_21393 ?auto_21400 ) ) ( IS-CRATE ?auto_21394 ) ( AVAILABLE ?auto_21402 ) ( SURFACE-AT ?auto_21394 ?auto_21396 ) ( ON ?auto_21394 ?auto_21397 ) ( CLEAR ?auto_21394 ) ( not ( = ?auto_21394 ?auto_21397 ) ) ( not ( = ?auto_21395 ?auto_21397 ) ) ( not ( = ?auto_21393 ?auto_21397 ) ) ( not ( = ?auto_21400 ?auto_21397 ) ) ( TRUCK-AT ?auto_21398 ?auto_21399 ) ( SURFACE-AT ?auto_21392 ?auto_21399 ) ( CLEAR ?auto_21392 ) ( IS-CRATE ?auto_21393 ) ( not ( = ?auto_21392 ?auto_21393 ) ) ( not ( = ?auto_21394 ?auto_21392 ) ) ( not ( = ?auto_21395 ?auto_21392 ) ) ( not ( = ?auto_21400 ?auto_21392 ) ) ( not ( = ?auto_21397 ?auto_21392 ) ) ( AVAILABLE ?auto_21401 ) ( IN ?auto_21393 ?auto_21398 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21393 ?auto_21394 ?auto_21395 )
      ( MAKE-3CRATE-VERIFY ?auto_21392 ?auto_21393 ?auto_21394 ?auto_21395 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21403 - SURFACE
      ?auto_21404 - SURFACE
      ?auto_21405 - SURFACE
      ?auto_21406 - SURFACE
      ?auto_21407 - SURFACE
    )
    :vars
    (
      ?auto_21413 - HOIST
      ?auto_21411 - PLACE
      ?auto_21408 - PLACE
      ?auto_21414 - HOIST
      ?auto_21412 - SURFACE
      ?auto_21409 - SURFACE
      ?auto_21410 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21413 ?auto_21411 ) ( IS-CRATE ?auto_21407 ) ( not ( = ?auto_21406 ?auto_21407 ) ) ( not ( = ?auto_21405 ?auto_21406 ) ) ( not ( = ?auto_21405 ?auto_21407 ) ) ( not ( = ?auto_21408 ?auto_21411 ) ) ( HOIST-AT ?auto_21414 ?auto_21408 ) ( not ( = ?auto_21413 ?auto_21414 ) ) ( SURFACE-AT ?auto_21407 ?auto_21408 ) ( ON ?auto_21407 ?auto_21412 ) ( CLEAR ?auto_21407 ) ( not ( = ?auto_21406 ?auto_21412 ) ) ( not ( = ?auto_21407 ?auto_21412 ) ) ( not ( = ?auto_21405 ?auto_21412 ) ) ( IS-CRATE ?auto_21406 ) ( AVAILABLE ?auto_21414 ) ( SURFACE-AT ?auto_21406 ?auto_21408 ) ( ON ?auto_21406 ?auto_21409 ) ( CLEAR ?auto_21406 ) ( not ( = ?auto_21406 ?auto_21409 ) ) ( not ( = ?auto_21407 ?auto_21409 ) ) ( not ( = ?auto_21405 ?auto_21409 ) ) ( not ( = ?auto_21412 ?auto_21409 ) ) ( TRUCK-AT ?auto_21410 ?auto_21411 ) ( SURFACE-AT ?auto_21404 ?auto_21411 ) ( CLEAR ?auto_21404 ) ( IS-CRATE ?auto_21405 ) ( not ( = ?auto_21404 ?auto_21405 ) ) ( not ( = ?auto_21406 ?auto_21404 ) ) ( not ( = ?auto_21407 ?auto_21404 ) ) ( not ( = ?auto_21412 ?auto_21404 ) ) ( not ( = ?auto_21409 ?auto_21404 ) ) ( AVAILABLE ?auto_21413 ) ( IN ?auto_21405 ?auto_21410 ) ( ON ?auto_21404 ?auto_21403 ) ( not ( = ?auto_21403 ?auto_21404 ) ) ( not ( = ?auto_21403 ?auto_21405 ) ) ( not ( = ?auto_21403 ?auto_21406 ) ) ( not ( = ?auto_21403 ?auto_21407 ) ) ( not ( = ?auto_21403 ?auto_21412 ) ) ( not ( = ?auto_21403 ?auto_21409 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21405 ?auto_21406 ?auto_21407 )
      ( MAKE-4CRATE-VERIFY ?auto_21403 ?auto_21404 ?auto_21405 ?auto_21406 ?auto_21407 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21415 - SURFACE
      ?auto_21416 - SURFACE
    )
    :vars
    (
      ?auto_21424 - HOIST
      ?auto_21421 - PLACE
      ?auto_21422 - SURFACE
      ?auto_21417 - PLACE
      ?auto_21425 - HOIST
      ?auto_21423 - SURFACE
      ?auto_21418 - SURFACE
      ?auto_21419 - SURFACE
      ?auto_21420 - TRUCK
      ?auto_21426 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21424 ?auto_21421 ) ( IS-CRATE ?auto_21416 ) ( not ( = ?auto_21415 ?auto_21416 ) ) ( not ( = ?auto_21422 ?auto_21415 ) ) ( not ( = ?auto_21422 ?auto_21416 ) ) ( not ( = ?auto_21417 ?auto_21421 ) ) ( HOIST-AT ?auto_21425 ?auto_21417 ) ( not ( = ?auto_21424 ?auto_21425 ) ) ( SURFACE-AT ?auto_21416 ?auto_21417 ) ( ON ?auto_21416 ?auto_21423 ) ( CLEAR ?auto_21416 ) ( not ( = ?auto_21415 ?auto_21423 ) ) ( not ( = ?auto_21416 ?auto_21423 ) ) ( not ( = ?auto_21422 ?auto_21423 ) ) ( IS-CRATE ?auto_21415 ) ( AVAILABLE ?auto_21425 ) ( SURFACE-AT ?auto_21415 ?auto_21417 ) ( ON ?auto_21415 ?auto_21418 ) ( CLEAR ?auto_21415 ) ( not ( = ?auto_21415 ?auto_21418 ) ) ( not ( = ?auto_21416 ?auto_21418 ) ) ( not ( = ?auto_21422 ?auto_21418 ) ) ( not ( = ?auto_21423 ?auto_21418 ) ) ( SURFACE-AT ?auto_21419 ?auto_21421 ) ( CLEAR ?auto_21419 ) ( IS-CRATE ?auto_21422 ) ( not ( = ?auto_21419 ?auto_21422 ) ) ( not ( = ?auto_21415 ?auto_21419 ) ) ( not ( = ?auto_21416 ?auto_21419 ) ) ( not ( = ?auto_21423 ?auto_21419 ) ) ( not ( = ?auto_21418 ?auto_21419 ) ) ( AVAILABLE ?auto_21424 ) ( IN ?auto_21422 ?auto_21420 ) ( TRUCK-AT ?auto_21420 ?auto_21426 ) ( not ( = ?auto_21426 ?auto_21421 ) ) ( not ( = ?auto_21417 ?auto_21426 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21420 ?auto_21426 ?auto_21421 )
      ( MAKE-2CRATE ?auto_21422 ?auto_21415 ?auto_21416 )
      ( MAKE-1CRATE-VERIFY ?auto_21415 ?auto_21416 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21427 - SURFACE
      ?auto_21428 - SURFACE
      ?auto_21429 - SURFACE
    )
    :vars
    (
      ?auto_21432 - HOIST
      ?auto_21437 - PLACE
      ?auto_21430 - PLACE
      ?auto_21438 - HOIST
      ?auto_21434 - SURFACE
      ?auto_21433 - SURFACE
      ?auto_21436 - SURFACE
      ?auto_21431 - TRUCK
      ?auto_21435 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21432 ?auto_21437 ) ( IS-CRATE ?auto_21429 ) ( not ( = ?auto_21428 ?auto_21429 ) ) ( not ( = ?auto_21427 ?auto_21428 ) ) ( not ( = ?auto_21427 ?auto_21429 ) ) ( not ( = ?auto_21430 ?auto_21437 ) ) ( HOIST-AT ?auto_21438 ?auto_21430 ) ( not ( = ?auto_21432 ?auto_21438 ) ) ( SURFACE-AT ?auto_21429 ?auto_21430 ) ( ON ?auto_21429 ?auto_21434 ) ( CLEAR ?auto_21429 ) ( not ( = ?auto_21428 ?auto_21434 ) ) ( not ( = ?auto_21429 ?auto_21434 ) ) ( not ( = ?auto_21427 ?auto_21434 ) ) ( IS-CRATE ?auto_21428 ) ( AVAILABLE ?auto_21438 ) ( SURFACE-AT ?auto_21428 ?auto_21430 ) ( ON ?auto_21428 ?auto_21433 ) ( CLEAR ?auto_21428 ) ( not ( = ?auto_21428 ?auto_21433 ) ) ( not ( = ?auto_21429 ?auto_21433 ) ) ( not ( = ?auto_21427 ?auto_21433 ) ) ( not ( = ?auto_21434 ?auto_21433 ) ) ( SURFACE-AT ?auto_21436 ?auto_21437 ) ( CLEAR ?auto_21436 ) ( IS-CRATE ?auto_21427 ) ( not ( = ?auto_21436 ?auto_21427 ) ) ( not ( = ?auto_21428 ?auto_21436 ) ) ( not ( = ?auto_21429 ?auto_21436 ) ) ( not ( = ?auto_21434 ?auto_21436 ) ) ( not ( = ?auto_21433 ?auto_21436 ) ) ( AVAILABLE ?auto_21432 ) ( IN ?auto_21427 ?auto_21431 ) ( TRUCK-AT ?auto_21431 ?auto_21435 ) ( not ( = ?auto_21435 ?auto_21437 ) ) ( not ( = ?auto_21430 ?auto_21435 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21428 ?auto_21429 )
      ( MAKE-2CRATE-VERIFY ?auto_21427 ?auto_21428 ?auto_21429 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21439 - SURFACE
      ?auto_21440 - SURFACE
      ?auto_21441 - SURFACE
      ?auto_21442 - SURFACE
    )
    :vars
    (
      ?auto_21444 - HOIST
      ?auto_21448 - PLACE
      ?auto_21449 - PLACE
      ?auto_21450 - HOIST
      ?auto_21446 - SURFACE
      ?auto_21447 - SURFACE
      ?auto_21445 - TRUCK
      ?auto_21443 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21444 ?auto_21448 ) ( IS-CRATE ?auto_21442 ) ( not ( = ?auto_21441 ?auto_21442 ) ) ( not ( = ?auto_21440 ?auto_21441 ) ) ( not ( = ?auto_21440 ?auto_21442 ) ) ( not ( = ?auto_21449 ?auto_21448 ) ) ( HOIST-AT ?auto_21450 ?auto_21449 ) ( not ( = ?auto_21444 ?auto_21450 ) ) ( SURFACE-AT ?auto_21442 ?auto_21449 ) ( ON ?auto_21442 ?auto_21446 ) ( CLEAR ?auto_21442 ) ( not ( = ?auto_21441 ?auto_21446 ) ) ( not ( = ?auto_21442 ?auto_21446 ) ) ( not ( = ?auto_21440 ?auto_21446 ) ) ( IS-CRATE ?auto_21441 ) ( AVAILABLE ?auto_21450 ) ( SURFACE-AT ?auto_21441 ?auto_21449 ) ( ON ?auto_21441 ?auto_21447 ) ( CLEAR ?auto_21441 ) ( not ( = ?auto_21441 ?auto_21447 ) ) ( not ( = ?auto_21442 ?auto_21447 ) ) ( not ( = ?auto_21440 ?auto_21447 ) ) ( not ( = ?auto_21446 ?auto_21447 ) ) ( SURFACE-AT ?auto_21439 ?auto_21448 ) ( CLEAR ?auto_21439 ) ( IS-CRATE ?auto_21440 ) ( not ( = ?auto_21439 ?auto_21440 ) ) ( not ( = ?auto_21441 ?auto_21439 ) ) ( not ( = ?auto_21442 ?auto_21439 ) ) ( not ( = ?auto_21446 ?auto_21439 ) ) ( not ( = ?auto_21447 ?auto_21439 ) ) ( AVAILABLE ?auto_21444 ) ( IN ?auto_21440 ?auto_21445 ) ( TRUCK-AT ?auto_21445 ?auto_21443 ) ( not ( = ?auto_21443 ?auto_21448 ) ) ( not ( = ?auto_21449 ?auto_21443 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21440 ?auto_21441 ?auto_21442 )
      ( MAKE-3CRATE-VERIFY ?auto_21439 ?auto_21440 ?auto_21441 ?auto_21442 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21451 - SURFACE
      ?auto_21452 - SURFACE
      ?auto_21453 - SURFACE
      ?auto_21454 - SURFACE
      ?auto_21455 - SURFACE
    )
    :vars
    (
      ?auto_21457 - HOIST
      ?auto_21461 - PLACE
      ?auto_21462 - PLACE
      ?auto_21463 - HOIST
      ?auto_21459 - SURFACE
      ?auto_21460 - SURFACE
      ?auto_21458 - TRUCK
      ?auto_21456 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21457 ?auto_21461 ) ( IS-CRATE ?auto_21455 ) ( not ( = ?auto_21454 ?auto_21455 ) ) ( not ( = ?auto_21453 ?auto_21454 ) ) ( not ( = ?auto_21453 ?auto_21455 ) ) ( not ( = ?auto_21462 ?auto_21461 ) ) ( HOIST-AT ?auto_21463 ?auto_21462 ) ( not ( = ?auto_21457 ?auto_21463 ) ) ( SURFACE-AT ?auto_21455 ?auto_21462 ) ( ON ?auto_21455 ?auto_21459 ) ( CLEAR ?auto_21455 ) ( not ( = ?auto_21454 ?auto_21459 ) ) ( not ( = ?auto_21455 ?auto_21459 ) ) ( not ( = ?auto_21453 ?auto_21459 ) ) ( IS-CRATE ?auto_21454 ) ( AVAILABLE ?auto_21463 ) ( SURFACE-AT ?auto_21454 ?auto_21462 ) ( ON ?auto_21454 ?auto_21460 ) ( CLEAR ?auto_21454 ) ( not ( = ?auto_21454 ?auto_21460 ) ) ( not ( = ?auto_21455 ?auto_21460 ) ) ( not ( = ?auto_21453 ?auto_21460 ) ) ( not ( = ?auto_21459 ?auto_21460 ) ) ( SURFACE-AT ?auto_21452 ?auto_21461 ) ( CLEAR ?auto_21452 ) ( IS-CRATE ?auto_21453 ) ( not ( = ?auto_21452 ?auto_21453 ) ) ( not ( = ?auto_21454 ?auto_21452 ) ) ( not ( = ?auto_21455 ?auto_21452 ) ) ( not ( = ?auto_21459 ?auto_21452 ) ) ( not ( = ?auto_21460 ?auto_21452 ) ) ( AVAILABLE ?auto_21457 ) ( IN ?auto_21453 ?auto_21458 ) ( TRUCK-AT ?auto_21458 ?auto_21456 ) ( not ( = ?auto_21456 ?auto_21461 ) ) ( not ( = ?auto_21462 ?auto_21456 ) ) ( ON ?auto_21452 ?auto_21451 ) ( not ( = ?auto_21451 ?auto_21452 ) ) ( not ( = ?auto_21451 ?auto_21453 ) ) ( not ( = ?auto_21451 ?auto_21454 ) ) ( not ( = ?auto_21451 ?auto_21455 ) ) ( not ( = ?auto_21451 ?auto_21459 ) ) ( not ( = ?auto_21451 ?auto_21460 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21453 ?auto_21454 ?auto_21455 )
      ( MAKE-4CRATE-VERIFY ?auto_21451 ?auto_21452 ?auto_21453 ?auto_21454 ?auto_21455 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21464 - SURFACE
      ?auto_21465 - SURFACE
    )
    :vars
    (
      ?auto_21468 - HOIST
      ?auto_21473 - PLACE
      ?auto_21466 - SURFACE
      ?auto_21474 - PLACE
      ?auto_21475 - HOIST
      ?auto_21470 - SURFACE
      ?auto_21471 - SURFACE
      ?auto_21472 - SURFACE
      ?auto_21469 - TRUCK
      ?auto_21467 - PLACE
      ?auto_21476 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21468 ?auto_21473 ) ( IS-CRATE ?auto_21465 ) ( not ( = ?auto_21464 ?auto_21465 ) ) ( not ( = ?auto_21466 ?auto_21464 ) ) ( not ( = ?auto_21466 ?auto_21465 ) ) ( not ( = ?auto_21474 ?auto_21473 ) ) ( HOIST-AT ?auto_21475 ?auto_21474 ) ( not ( = ?auto_21468 ?auto_21475 ) ) ( SURFACE-AT ?auto_21465 ?auto_21474 ) ( ON ?auto_21465 ?auto_21470 ) ( CLEAR ?auto_21465 ) ( not ( = ?auto_21464 ?auto_21470 ) ) ( not ( = ?auto_21465 ?auto_21470 ) ) ( not ( = ?auto_21466 ?auto_21470 ) ) ( IS-CRATE ?auto_21464 ) ( AVAILABLE ?auto_21475 ) ( SURFACE-AT ?auto_21464 ?auto_21474 ) ( ON ?auto_21464 ?auto_21471 ) ( CLEAR ?auto_21464 ) ( not ( = ?auto_21464 ?auto_21471 ) ) ( not ( = ?auto_21465 ?auto_21471 ) ) ( not ( = ?auto_21466 ?auto_21471 ) ) ( not ( = ?auto_21470 ?auto_21471 ) ) ( SURFACE-AT ?auto_21472 ?auto_21473 ) ( CLEAR ?auto_21472 ) ( IS-CRATE ?auto_21466 ) ( not ( = ?auto_21472 ?auto_21466 ) ) ( not ( = ?auto_21464 ?auto_21472 ) ) ( not ( = ?auto_21465 ?auto_21472 ) ) ( not ( = ?auto_21470 ?auto_21472 ) ) ( not ( = ?auto_21471 ?auto_21472 ) ) ( AVAILABLE ?auto_21468 ) ( TRUCK-AT ?auto_21469 ?auto_21467 ) ( not ( = ?auto_21467 ?auto_21473 ) ) ( not ( = ?auto_21474 ?auto_21467 ) ) ( HOIST-AT ?auto_21476 ?auto_21467 ) ( LIFTING ?auto_21476 ?auto_21466 ) ( not ( = ?auto_21468 ?auto_21476 ) ) ( not ( = ?auto_21475 ?auto_21476 ) ) )
    :subtasks
    ( ( !LOAD ?auto_21476 ?auto_21466 ?auto_21469 ?auto_21467 )
      ( MAKE-2CRATE ?auto_21466 ?auto_21464 ?auto_21465 )
      ( MAKE-1CRATE-VERIFY ?auto_21464 ?auto_21465 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21477 - SURFACE
      ?auto_21478 - SURFACE
      ?auto_21479 - SURFACE
    )
    :vars
    (
      ?auto_21482 - HOIST
      ?auto_21485 - PLACE
      ?auto_21487 - PLACE
      ?auto_21486 - HOIST
      ?auto_21484 - SURFACE
      ?auto_21480 - SURFACE
      ?auto_21489 - SURFACE
      ?auto_21488 - TRUCK
      ?auto_21483 - PLACE
      ?auto_21481 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21482 ?auto_21485 ) ( IS-CRATE ?auto_21479 ) ( not ( = ?auto_21478 ?auto_21479 ) ) ( not ( = ?auto_21477 ?auto_21478 ) ) ( not ( = ?auto_21477 ?auto_21479 ) ) ( not ( = ?auto_21487 ?auto_21485 ) ) ( HOIST-AT ?auto_21486 ?auto_21487 ) ( not ( = ?auto_21482 ?auto_21486 ) ) ( SURFACE-AT ?auto_21479 ?auto_21487 ) ( ON ?auto_21479 ?auto_21484 ) ( CLEAR ?auto_21479 ) ( not ( = ?auto_21478 ?auto_21484 ) ) ( not ( = ?auto_21479 ?auto_21484 ) ) ( not ( = ?auto_21477 ?auto_21484 ) ) ( IS-CRATE ?auto_21478 ) ( AVAILABLE ?auto_21486 ) ( SURFACE-AT ?auto_21478 ?auto_21487 ) ( ON ?auto_21478 ?auto_21480 ) ( CLEAR ?auto_21478 ) ( not ( = ?auto_21478 ?auto_21480 ) ) ( not ( = ?auto_21479 ?auto_21480 ) ) ( not ( = ?auto_21477 ?auto_21480 ) ) ( not ( = ?auto_21484 ?auto_21480 ) ) ( SURFACE-AT ?auto_21489 ?auto_21485 ) ( CLEAR ?auto_21489 ) ( IS-CRATE ?auto_21477 ) ( not ( = ?auto_21489 ?auto_21477 ) ) ( not ( = ?auto_21478 ?auto_21489 ) ) ( not ( = ?auto_21479 ?auto_21489 ) ) ( not ( = ?auto_21484 ?auto_21489 ) ) ( not ( = ?auto_21480 ?auto_21489 ) ) ( AVAILABLE ?auto_21482 ) ( TRUCK-AT ?auto_21488 ?auto_21483 ) ( not ( = ?auto_21483 ?auto_21485 ) ) ( not ( = ?auto_21487 ?auto_21483 ) ) ( HOIST-AT ?auto_21481 ?auto_21483 ) ( LIFTING ?auto_21481 ?auto_21477 ) ( not ( = ?auto_21482 ?auto_21481 ) ) ( not ( = ?auto_21486 ?auto_21481 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21478 ?auto_21479 )
      ( MAKE-2CRATE-VERIFY ?auto_21477 ?auto_21478 ?auto_21479 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21490 - SURFACE
      ?auto_21491 - SURFACE
      ?auto_21492 - SURFACE
      ?auto_21493 - SURFACE
    )
    :vars
    (
      ?auto_21499 - HOIST
      ?auto_21501 - PLACE
      ?auto_21495 - PLACE
      ?auto_21494 - HOIST
      ?auto_21496 - SURFACE
      ?auto_21497 - SURFACE
      ?auto_21500 - TRUCK
      ?auto_21498 - PLACE
      ?auto_21502 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21499 ?auto_21501 ) ( IS-CRATE ?auto_21493 ) ( not ( = ?auto_21492 ?auto_21493 ) ) ( not ( = ?auto_21491 ?auto_21492 ) ) ( not ( = ?auto_21491 ?auto_21493 ) ) ( not ( = ?auto_21495 ?auto_21501 ) ) ( HOIST-AT ?auto_21494 ?auto_21495 ) ( not ( = ?auto_21499 ?auto_21494 ) ) ( SURFACE-AT ?auto_21493 ?auto_21495 ) ( ON ?auto_21493 ?auto_21496 ) ( CLEAR ?auto_21493 ) ( not ( = ?auto_21492 ?auto_21496 ) ) ( not ( = ?auto_21493 ?auto_21496 ) ) ( not ( = ?auto_21491 ?auto_21496 ) ) ( IS-CRATE ?auto_21492 ) ( AVAILABLE ?auto_21494 ) ( SURFACE-AT ?auto_21492 ?auto_21495 ) ( ON ?auto_21492 ?auto_21497 ) ( CLEAR ?auto_21492 ) ( not ( = ?auto_21492 ?auto_21497 ) ) ( not ( = ?auto_21493 ?auto_21497 ) ) ( not ( = ?auto_21491 ?auto_21497 ) ) ( not ( = ?auto_21496 ?auto_21497 ) ) ( SURFACE-AT ?auto_21490 ?auto_21501 ) ( CLEAR ?auto_21490 ) ( IS-CRATE ?auto_21491 ) ( not ( = ?auto_21490 ?auto_21491 ) ) ( not ( = ?auto_21492 ?auto_21490 ) ) ( not ( = ?auto_21493 ?auto_21490 ) ) ( not ( = ?auto_21496 ?auto_21490 ) ) ( not ( = ?auto_21497 ?auto_21490 ) ) ( AVAILABLE ?auto_21499 ) ( TRUCK-AT ?auto_21500 ?auto_21498 ) ( not ( = ?auto_21498 ?auto_21501 ) ) ( not ( = ?auto_21495 ?auto_21498 ) ) ( HOIST-AT ?auto_21502 ?auto_21498 ) ( LIFTING ?auto_21502 ?auto_21491 ) ( not ( = ?auto_21499 ?auto_21502 ) ) ( not ( = ?auto_21494 ?auto_21502 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21491 ?auto_21492 ?auto_21493 )
      ( MAKE-3CRATE-VERIFY ?auto_21490 ?auto_21491 ?auto_21492 ?auto_21493 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21503 - SURFACE
      ?auto_21504 - SURFACE
      ?auto_21505 - SURFACE
      ?auto_21506 - SURFACE
      ?auto_21507 - SURFACE
    )
    :vars
    (
      ?auto_21513 - HOIST
      ?auto_21515 - PLACE
      ?auto_21509 - PLACE
      ?auto_21508 - HOIST
      ?auto_21510 - SURFACE
      ?auto_21511 - SURFACE
      ?auto_21514 - TRUCK
      ?auto_21512 - PLACE
      ?auto_21516 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21513 ?auto_21515 ) ( IS-CRATE ?auto_21507 ) ( not ( = ?auto_21506 ?auto_21507 ) ) ( not ( = ?auto_21505 ?auto_21506 ) ) ( not ( = ?auto_21505 ?auto_21507 ) ) ( not ( = ?auto_21509 ?auto_21515 ) ) ( HOIST-AT ?auto_21508 ?auto_21509 ) ( not ( = ?auto_21513 ?auto_21508 ) ) ( SURFACE-AT ?auto_21507 ?auto_21509 ) ( ON ?auto_21507 ?auto_21510 ) ( CLEAR ?auto_21507 ) ( not ( = ?auto_21506 ?auto_21510 ) ) ( not ( = ?auto_21507 ?auto_21510 ) ) ( not ( = ?auto_21505 ?auto_21510 ) ) ( IS-CRATE ?auto_21506 ) ( AVAILABLE ?auto_21508 ) ( SURFACE-AT ?auto_21506 ?auto_21509 ) ( ON ?auto_21506 ?auto_21511 ) ( CLEAR ?auto_21506 ) ( not ( = ?auto_21506 ?auto_21511 ) ) ( not ( = ?auto_21507 ?auto_21511 ) ) ( not ( = ?auto_21505 ?auto_21511 ) ) ( not ( = ?auto_21510 ?auto_21511 ) ) ( SURFACE-AT ?auto_21504 ?auto_21515 ) ( CLEAR ?auto_21504 ) ( IS-CRATE ?auto_21505 ) ( not ( = ?auto_21504 ?auto_21505 ) ) ( not ( = ?auto_21506 ?auto_21504 ) ) ( not ( = ?auto_21507 ?auto_21504 ) ) ( not ( = ?auto_21510 ?auto_21504 ) ) ( not ( = ?auto_21511 ?auto_21504 ) ) ( AVAILABLE ?auto_21513 ) ( TRUCK-AT ?auto_21514 ?auto_21512 ) ( not ( = ?auto_21512 ?auto_21515 ) ) ( not ( = ?auto_21509 ?auto_21512 ) ) ( HOIST-AT ?auto_21516 ?auto_21512 ) ( LIFTING ?auto_21516 ?auto_21505 ) ( not ( = ?auto_21513 ?auto_21516 ) ) ( not ( = ?auto_21508 ?auto_21516 ) ) ( ON ?auto_21504 ?auto_21503 ) ( not ( = ?auto_21503 ?auto_21504 ) ) ( not ( = ?auto_21503 ?auto_21505 ) ) ( not ( = ?auto_21503 ?auto_21506 ) ) ( not ( = ?auto_21503 ?auto_21507 ) ) ( not ( = ?auto_21503 ?auto_21510 ) ) ( not ( = ?auto_21503 ?auto_21511 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21505 ?auto_21506 ?auto_21507 )
      ( MAKE-4CRATE-VERIFY ?auto_21503 ?auto_21504 ?auto_21505 ?auto_21506 ?auto_21507 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21517 - SURFACE
      ?auto_21518 - SURFACE
    )
    :vars
    (
      ?auto_21525 - HOIST
      ?auto_21527 - PLACE
      ?auto_21529 - SURFACE
      ?auto_21520 - PLACE
      ?auto_21519 - HOIST
      ?auto_21521 - SURFACE
      ?auto_21522 - SURFACE
      ?auto_21524 - SURFACE
      ?auto_21526 - TRUCK
      ?auto_21523 - PLACE
      ?auto_21528 - HOIST
      ?auto_21530 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21525 ?auto_21527 ) ( IS-CRATE ?auto_21518 ) ( not ( = ?auto_21517 ?auto_21518 ) ) ( not ( = ?auto_21529 ?auto_21517 ) ) ( not ( = ?auto_21529 ?auto_21518 ) ) ( not ( = ?auto_21520 ?auto_21527 ) ) ( HOIST-AT ?auto_21519 ?auto_21520 ) ( not ( = ?auto_21525 ?auto_21519 ) ) ( SURFACE-AT ?auto_21518 ?auto_21520 ) ( ON ?auto_21518 ?auto_21521 ) ( CLEAR ?auto_21518 ) ( not ( = ?auto_21517 ?auto_21521 ) ) ( not ( = ?auto_21518 ?auto_21521 ) ) ( not ( = ?auto_21529 ?auto_21521 ) ) ( IS-CRATE ?auto_21517 ) ( AVAILABLE ?auto_21519 ) ( SURFACE-AT ?auto_21517 ?auto_21520 ) ( ON ?auto_21517 ?auto_21522 ) ( CLEAR ?auto_21517 ) ( not ( = ?auto_21517 ?auto_21522 ) ) ( not ( = ?auto_21518 ?auto_21522 ) ) ( not ( = ?auto_21529 ?auto_21522 ) ) ( not ( = ?auto_21521 ?auto_21522 ) ) ( SURFACE-AT ?auto_21524 ?auto_21527 ) ( CLEAR ?auto_21524 ) ( IS-CRATE ?auto_21529 ) ( not ( = ?auto_21524 ?auto_21529 ) ) ( not ( = ?auto_21517 ?auto_21524 ) ) ( not ( = ?auto_21518 ?auto_21524 ) ) ( not ( = ?auto_21521 ?auto_21524 ) ) ( not ( = ?auto_21522 ?auto_21524 ) ) ( AVAILABLE ?auto_21525 ) ( TRUCK-AT ?auto_21526 ?auto_21523 ) ( not ( = ?auto_21523 ?auto_21527 ) ) ( not ( = ?auto_21520 ?auto_21523 ) ) ( HOIST-AT ?auto_21528 ?auto_21523 ) ( not ( = ?auto_21525 ?auto_21528 ) ) ( not ( = ?auto_21519 ?auto_21528 ) ) ( AVAILABLE ?auto_21528 ) ( SURFACE-AT ?auto_21529 ?auto_21523 ) ( ON ?auto_21529 ?auto_21530 ) ( CLEAR ?auto_21529 ) ( not ( = ?auto_21517 ?auto_21530 ) ) ( not ( = ?auto_21518 ?auto_21530 ) ) ( not ( = ?auto_21529 ?auto_21530 ) ) ( not ( = ?auto_21521 ?auto_21530 ) ) ( not ( = ?auto_21522 ?auto_21530 ) ) ( not ( = ?auto_21524 ?auto_21530 ) ) )
    :subtasks
    ( ( !LIFT ?auto_21528 ?auto_21529 ?auto_21530 ?auto_21523 )
      ( MAKE-2CRATE ?auto_21529 ?auto_21517 ?auto_21518 )
      ( MAKE-1CRATE-VERIFY ?auto_21517 ?auto_21518 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21531 - SURFACE
      ?auto_21532 - SURFACE
      ?auto_21533 - SURFACE
    )
    :vars
    (
      ?auto_21535 - HOIST
      ?auto_21537 - PLACE
      ?auto_21534 - PLACE
      ?auto_21543 - HOIST
      ?auto_21542 - SURFACE
      ?auto_21538 - SURFACE
      ?auto_21536 - SURFACE
      ?auto_21540 - TRUCK
      ?auto_21539 - PLACE
      ?auto_21544 - HOIST
      ?auto_21541 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21535 ?auto_21537 ) ( IS-CRATE ?auto_21533 ) ( not ( = ?auto_21532 ?auto_21533 ) ) ( not ( = ?auto_21531 ?auto_21532 ) ) ( not ( = ?auto_21531 ?auto_21533 ) ) ( not ( = ?auto_21534 ?auto_21537 ) ) ( HOIST-AT ?auto_21543 ?auto_21534 ) ( not ( = ?auto_21535 ?auto_21543 ) ) ( SURFACE-AT ?auto_21533 ?auto_21534 ) ( ON ?auto_21533 ?auto_21542 ) ( CLEAR ?auto_21533 ) ( not ( = ?auto_21532 ?auto_21542 ) ) ( not ( = ?auto_21533 ?auto_21542 ) ) ( not ( = ?auto_21531 ?auto_21542 ) ) ( IS-CRATE ?auto_21532 ) ( AVAILABLE ?auto_21543 ) ( SURFACE-AT ?auto_21532 ?auto_21534 ) ( ON ?auto_21532 ?auto_21538 ) ( CLEAR ?auto_21532 ) ( not ( = ?auto_21532 ?auto_21538 ) ) ( not ( = ?auto_21533 ?auto_21538 ) ) ( not ( = ?auto_21531 ?auto_21538 ) ) ( not ( = ?auto_21542 ?auto_21538 ) ) ( SURFACE-AT ?auto_21536 ?auto_21537 ) ( CLEAR ?auto_21536 ) ( IS-CRATE ?auto_21531 ) ( not ( = ?auto_21536 ?auto_21531 ) ) ( not ( = ?auto_21532 ?auto_21536 ) ) ( not ( = ?auto_21533 ?auto_21536 ) ) ( not ( = ?auto_21542 ?auto_21536 ) ) ( not ( = ?auto_21538 ?auto_21536 ) ) ( AVAILABLE ?auto_21535 ) ( TRUCK-AT ?auto_21540 ?auto_21539 ) ( not ( = ?auto_21539 ?auto_21537 ) ) ( not ( = ?auto_21534 ?auto_21539 ) ) ( HOIST-AT ?auto_21544 ?auto_21539 ) ( not ( = ?auto_21535 ?auto_21544 ) ) ( not ( = ?auto_21543 ?auto_21544 ) ) ( AVAILABLE ?auto_21544 ) ( SURFACE-AT ?auto_21531 ?auto_21539 ) ( ON ?auto_21531 ?auto_21541 ) ( CLEAR ?auto_21531 ) ( not ( = ?auto_21532 ?auto_21541 ) ) ( not ( = ?auto_21533 ?auto_21541 ) ) ( not ( = ?auto_21531 ?auto_21541 ) ) ( not ( = ?auto_21542 ?auto_21541 ) ) ( not ( = ?auto_21538 ?auto_21541 ) ) ( not ( = ?auto_21536 ?auto_21541 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21532 ?auto_21533 )
      ( MAKE-2CRATE-VERIFY ?auto_21531 ?auto_21532 ?auto_21533 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21545 - SURFACE
      ?auto_21546 - SURFACE
      ?auto_21547 - SURFACE
      ?auto_21548 - SURFACE
    )
    :vars
    (
      ?auto_21553 - HOIST
      ?auto_21554 - PLACE
      ?auto_21549 - PLACE
      ?auto_21550 - HOIST
      ?auto_21556 - SURFACE
      ?auto_21551 - SURFACE
      ?auto_21558 - TRUCK
      ?auto_21552 - PLACE
      ?auto_21557 - HOIST
      ?auto_21555 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21553 ?auto_21554 ) ( IS-CRATE ?auto_21548 ) ( not ( = ?auto_21547 ?auto_21548 ) ) ( not ( = ?auto_21546 ?auto_21547 ) ) ( not ( = ?auto_21546 ?auto_21548 ) ) ( not ( = ?auto_21549 ?auto_21554 ) ) ( HOIST-AT ?auto_21550 ?auto_21549 ) ( not ( = ?auto_21553 ?auto_21550 ) ) ( SURFACE-AT ?auto_21548 ?auto_21549 ) ( ON ?auto_21548 ?auto_21556 ) ( CLEAR ?auto_21548 ) ( not ( = ?auto_21547 ?auto_21556 ) ) ( not ( = ?auto_21548 ?auto_21556 ) ) ( not ( = ?auto_21546 ?auto_21556 ) ) ( IS-CRATE ?auto_21547 ) ( AVAILABLE ?auto_21550 ) ( SURFACE-AT ?auto_21547 ?auto_21549 ) ( ON ?auto_21547 ?auto_21551 ) ( CLEAR ?auto_21547 ) ( not ( = ?auto_21547 ?auto_21551 ) ) ( not ( = ?auto_21548 ?auto_21551 ) ) ( not ( = ?auto_21546 ?auto_21551 ) ) ( not ( = ?auto_21556 ?auto_21551 ) ) ( SURFACE-AT ?auto_21545 ?auto_21554 ) ( CLEAR ?auto_21545 ) ( IS-CRATE ?auto_21546 ) ( not ( = ?auto_21545 ?auto_21546 ) ) ( not ( = ?auto_21547 ?auto_21545 ) ) ( not ( = ?auto_21548 ?auto_21545 ) ) ( not ( = ?auto_21556 ?auto_21545 ) ) ( not ( = ?auto_21551 ?auto_21545 ) ) ( AVAILABLE ?auto_21553 ) ( TRUCK-AT ?auto_21558 ?auto_21552 ) ( not ( = ?auto_21552 ?auto_21554 ) ) ( not ( = ?auto_21549 ?auto_21552 ) ) ( HOIST-AT ?auto_21557 ?auto_21552 ) ( not ( = ?auto_21553 ?auto_21557 ) ) ( not ( = ?auto_21550 ?auto_21557 ) ) ( AVAILABLE ?auto_21557 ) ( SURFACE-AT ?auto_21546 ?auto_21552 ) ( ON ?auto_21546 ?auto_21555 ) ( CLEAR ?auto_21546 ) ( not ( = ?auto_21547 ?auto_21555 ) ) ( not ( = ?auto_21548 ?auto_21555 ) ) ( not ( = ?auto_21546 ?auto_21555 ) ) ( not ( = ?auto_21556 ?auto_21555 ) ) ( not ( = ?auto_21551 ?auto_21555 ) ) ( not ( = ?auto_21545 ?auto_21555 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21546 ?auto_21547 ?auto_21548 )
      ( MAKE-3CRATE-VERIFY ?auto_21545 ?auto_21546 ?auto_21547 ?auto_21548 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21559 - SURFACE
      ?auto_21560 - SURFACE
      ?auto_21561 - SURFACE
      ?auto_21562 - SURFACE
      ?auto_21563 - SURFACE
    )
    :vars
    (
      ?auto_21568 - HOIST
      ?auto_21569 - PLACE
      ?auto_21564 - PLACE
      ?auto_21565 - HOIST
      ?auto_21571 - SURFACE
      ?auto_21566 - SURFACE
      ?auto_21573 - TRUCK
      ?auto_21567 - PLACE
      ?auto_21572 - HOIST
      ?auto_21570 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21568 ?auto_21569 ) ( IS-CRATE ?auto_21563 ) ( not ( = ?auto_21562 ?auto_21563 ) ) ( not ( = ?auto_21561 ?auto_21562 ) ) ( not ( = ?auto_21561 ?auto_21563 ) ) ( not ( = ?auto_21564 ?auto_21569 ) ) ( HOIST-AT ?auto_21565 ?auto_21564 ) ( not ( = ?auto_21568 ?auto_21565 ) ) ( SURFACE-AT ?auto_21563 ?auto_21564 ) ( ON ?auto_21563 ?auto_21571 ) ( CLEAR ?auto_21563 ) ( not ( = ?auto_21562 ?auto_21571 ) ) ( not ( = ?auto_21563 ?auto_21571 ) ) ( not ( = ?auto_21561 ?auto_21571 ) ) ( IS-CRATE ?auto_21562 ) ( AVAILABLE ?auto_21565 ) ( SURFACE-AT ?auto_21562 ?auto_21564 ) ( ON ?auto_21562 ?auto_21566 ) ( CLEAR ?auto_21562 ) ( not ( = ?auto_21562 ?auto_21566 ) ) ( not ( = ?auto_21563 ?auto_21566 ) ) ( not ( = ?auto_21561 ?auto_21566 ) ) ( not ( = ?auto_21571 ?auto_21566 ) ) ( SURFACE-AT ?auto_21560 ?auto_21569 ) ( CLEAR ?auto_21560 ) ( IS-CRATE ?auto_21561 ) ( not ( = ?auto_21560 ?auto_21561 ) ) ( not ( = ?auto_21562 ?auto_21560 ) ) ( not ( = ?auto_21563 ?auto_21560 ) ) ( not ( = ?auto_21571 ?auto_21560 ) ) ( not ( = ?auto_21566 ?auto_21560 ) ) ( AVAILABLE ?auto_21568 ) ( TRUCK-AT ?auto_21573 ?auto_21567 ) ( not ( = ?auto_21567 ?auto_21569 ) ) ( not ( = ?auto_21564 ?auto_21567 ) ) ( HOIST-AT ?auto_21572 ?auto_21567 ) ( not ( = ?auto_21568 ?auto_21572 ) ) ( not ( = ?auto_21565 ?auto_21572 ) ) ( AVAILABLE ?auto_21572 ) ( SURFACE-AT ?auto_21561 ?auto_21567 ) ( ON ?auto_21561 ?auto_21570 ) ( CLEAR ?auto_21561 ) ( not ( = ?auto_21562 ?auto_21570 ) ) ( not ( = ?auto_21563 ?auto_21570 ) ) ( not ( = ?auto_21561 ?auto_21570 ) ) ( not ( = ?auto_21571 ?auto_21570 ) ) ( not ( = ?auto_21566 ?auto_21570 ) ) ( not ( = ?auto_21560 ?auto_21570 ) ) ( ON ?auto_21560 ?auto_21559 ) ( not ( = ?auto_21559 ?auto_21560 ) ) ( not ( = ?auto_21559 ?auto_21561 ) ) ( not ( = ?auto_21559 ?auto_21562 ) ) ( not ( = ?auto_21559 ?auto_21563 ) ) ( not ( = ?auto_21559 ?auto_21571 ) ) ( not ( = ?auto_21559 ?auto_21566 ) ) ( not ( = ?auto_21559 ?auto_21570 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21561 ?auto_21562 ?auto_21563 )
      ( MAKE-4CRATE-VERIFY ?auto_21559 ?auto_21560 ?auto_21561 ?auto_21562 ?auto_21563 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21574 - SURFACE
      ?auto_21575 - SURFACE
    )
    :vars
    (
      ?auto_21581 - HOIST
      ?auto_21582 - PLACE
      ?auto_21585 - SURFACE
      ?auto_21576 - PLACE
      ?auto_21577 - HOIST
      ?auto_21584 - SURFACE
      ?auto_21578 - SURFACE
      ?auto_21580 - SURFACE
      ?auto_21579 - PLACE
      ?auto_21586 - HOIST
      ?auto_21583 - SURFACE
      ?auto_21587 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21581 ?auto_21582 ) ( IS-CRATE ?auto_21575 ) ( not ( = ?auto_21574 ?auto_21575 ) ) ( not ( = ?auto_21585 ?auto_21574 ) ) ( not ( = ?auto_21585 ?auto_21575 ) ) ( not ( = ?auto_21576 ?auto_21582 ) ) ( HOIST-AT ?auto_21577 ?auto_21576 ) ( not ( = ?auto_21581 ?auto_21577 ) ) ( SURFACE-AT ?auto_21575 ?auto_21576 ) ( ON ?auto_21575 ?auto_21584 ) ( CLEAR ?auto_21575 ) ( not ( = ?auto_21574 ?auto_21584 ) ) ( not ( = ?auto_21575 ?auto_21584 ) ) ( not ( = ?auto_21585 ?auto_21584 ) ) ( IS-CRATE ?auto_21574 ) ( AVAILABLE ?auto_21577 ) ( SURFACE-AT ?auto_21574 ?auto_21576 ) ( ON ?auto_21574 ?auto_21578 ) ( CLEAR ?auto_21574 ) ( not ( = ?auto_21574 ?auto_21578 ) ) ( not ( = ?auto_21575 ?auto_21578 ) ) ( not ( = ?auto_21585 ?auto_21578 ) ) ( not ( = ?auto_21584 ?auto_21578 ) ) ( SURFACE-AT ?auto_21580 ?auto_21582 ) ( CLEAR ?auto_21580 ) ( IS-CRATE ?auto_21585 ) ( not ( = ?auto_21580 ?auto_21585 ) ) ( not ( = ?auto_21574 ?auto_21580 ) ) ( not ( = ?auto_21575 ?auto_21580 ) ) ( not ( = ?auto_21584 ?auto_21580 ) ) ( not ( = ?auto_21578 ?auto_21580 ) ) ( AVAILABLE ?auto_21581 ) ( not ( = ?auto_21579 ?auto_21582 ) ) ( not ( = ?auto_21576 ?auto_21579 ) ) ( HOIST-AT ?auto_21586 ?auto_21579 ) ( not ( = ?auto_21581 ?auto_21586 ) ) ( not ( = ?auto_21577 ?auto_21586 ) ) ( AVAILABLE ?auto_21586 ) ( SURFACE-AT ?auto_21585 ?auto_21579 ) ( ON ?auto_21585 ?auto_21583 ) ( CLEAR ?auto_21585 ) ( not ( = ?auto_21574 ?auto_21583 ) ) ( not ( = ?auto_21575 ?auto_21583 ) ) ( not ( = ?auto_21585 ?auto_21583 ) ) ( not ( = ?auto_21584 ?auto_21583 ) ) ( not ( = ?auto_21578 ?auto_21583 ) ) ( not ( = ?auto_21580 ?auto_21583 ) ) ( TRUCK-AT ?auto_21587 ?auto_21582 ) )
    :subtasks
    ( ( !DRIVE ?auto_21587 ?auto_21582 ?auto_21579 )
      ( MAKE-2CRATE ?auto_21585 ?auto_21574 ?auto_21575 )
      ( MAKE-1CRATE-VERIFY ?auto_21574 ?auto_21575 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21588 - SURFACE
      ?auto_21589 - SURFACE
      ?auto_21590 - SURFACE
    )
    :vars
    (
      ?auto_21594 - HOIST
      ?auto_21597 - PLACE
      ?auto_21595 - PLACE
      ?auto_21593 - HOIST
      ?auto_21599 - SURFACE
      ?auto_21600 - SURFACE
      ?auto_21591 - SURFACE
      ?auto_21596 - PLACE
      ?auto_21601 - HOIST
      ?auto_21592 - SURFACE
      ?auto_21598 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21594 ?auto_21597 ) ( IS-CRATE ?auto_21590 ) ( not ( = ?auto_21589 ?auto_21590 ) ) ( not ( = ?auto_21588 ?auto_21589 ) ) ( not ( = ?auto_21588 ?auto_21590 ) ) ( not ( = ?auto_21595 ?auto_21597 ) ) ( HOIST-AT ?auto_21593 ?auto_21595 ) ( not ( = ?auto_21594 ?auto_21593 ) ) ( SURFACE-AT ?auto_21590 ?auto_21595 ) ( ON ?auto_21590 ?auto_21599 ) ( CLEAR ?auto_21590 ) ( not ( = ?auto_21589 ?auto_21599 ) ) ( not ( = ?auto_21590 ?auto_21599 ) ) ( not ( = ?auto_21588 ?auto_21599 ) ) ( IS-CRATE ?auto_21589 ) ( AVAILABLE ?auto_21593 ) ( SURFACE-AT ?auto_21589 ?auto_21595 ) ( ON ?auto_21589 ?auto_21600 ) ( CLEAR ?auto_21589 ) ( not ( = ?auto_21589 ?auto_21600 ) ) ( not ( = ?auto_21590 ?auto_21600 ) ) ( not ( = ?auto_21588 ?auto_21600 ) ) ( not ( = ?auto_21599 ?auto_21600 ) ) ( SURFACE-AT ?auto_21591 ?auto_21597 ) ( CLEAR ?auto_21591 ) ( IS-CRATE ?auto_21588 ) ( not ( = ?auto_21591 ?auto_21588 ) ) ( not ( = ?auto_21589 ?auto_21591 ) ) ( not ( = ?auto_21590 ?auto_21591 ) ) ( not ( = ?auto_21599 ?auto_21591 ) ) ( not ( = ?auto_21600 ?auto_21591 ) ) ( AVAILABLE ?auto_21594 ) ( not ( = ?auto_21596 ?auto_21597 ) ) ( not ( = ?auto_21595 ?auto_21596 ) ) ( HOIST-AT ?auto_21601 ?auto_21596 ) ( not ( = ?auto_21594 ?auto_21601 ) ) ( not ( = ?auto_21593 ?auto_21601 ) ) ( AVAILABLE ?auto_21601 ) ( SURFACE-AT ?auto_21588 ?auto_21596 ) ( ON ?auto_21588 ?auto_21592 ) ( CLEAR ?auto_21588 ) ( not ( = ?auto_21589 ?auto_21592 ) ) ( not ( = ?auto_21590 ?auto_21592 ) ) ( not ( = ?auto_21588 ?auto_21592 ) ) ( not ( = ?auto_21599 ?auto_21592 ) ) ( not ( = ?auto_21600 ?auto_21592 ) ) ( not ( = ?auto_21591 ?auto_21592 ) ) ( TRUCK-AT ?auto_21598 ?auto_21597 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21589 ?auto_21590 )
      ( MAKE-2CRATE-VERIFY ?auto_21588 ?auto_21589 ?auto_21590 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21602 - SURFACE
      ?auto_21603 - SURFACE
      ?auto_21604 - SURFACE
      ?auto_21605 - SURFACE
    )
    :vars
    (
      ?auto_21609 - HOIST
      ?auto_21612 - PLACE
      ?auto_21608 - PLACE
      ?auto_21614 - HOIST
      ?auto_21606 - SURFACE
      ?auto_21610 - SURFACE
      ?auto_21607 - PLACE
      ?auto_21615 - HOIST
      ?auto_21613 - SURFACE
      ?auto_21611 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21609 ?auto_21612 ) ( IS-CRATE ?auto_21605 ) ( not ( = ?auto_21604 ?auto_21605 ) ) ( not ( = ?auto_21603 ?auto_21604 ) ) ( not ( = ?auto_21603 ?auto_21605 ) ) ( not ( = ?auto_21608 ?auto_21612 ) ) ( HOIST-AT ?auto_21614 ?auto_21608 ) ( not ( = ?auto_21609 ?auto_21614 ) ) ( SURFACE-AT ?auto_21605 ?auto_21608 ) ( ON ?auto_21605 ?auto_21606 ) ( CLEAR ?auto_21605 ) ( not ( = ?auto_21604 ?auto_21606 ) ) ( not ( = ?auto_21605 ?auto_21606 ) ) ( not ( = ?auto_21603 ?auto_21606 ) ) ( IS-CRATE ?auto_21604 ) ( AVAILABLE ?auto_21614 ) ( SURFACE-AT ?auto_21604 ?auto_21608 ) ( ON ?auto_21604 ?auto_21610 ) ( CLEAR ?auto_21604 ) ( not ( = ?auto_21604 ?auto_21610 ) ) ( not ( = ?auto_21605 ?auto_21610 ) ) ( not ( = ?auto_21603 ?auto_21610 ) ) ( not ( = ?auto_21606 ?auto_21610 ) ) ( SURFACE-AT ?auto_21602 ?auto_21612 ) ( CLEAR ?auto_21602 ) ( IS-CRATE ?auto_21603 ) ( not ( = ?auto_21602 ?auto_21603 ) ) ( not ( = ?auto_21604 ?auto_21602 ) ) ( not ( = ?auto_21605 ?auto_21602 ) ) ( not ( = ?auto_21606 ?auto_21602 ) ) ( not ( = ?auto_21610 ?auto_21602 ) ) ( AVAILABLE ?auto_21609 ) ( not ( = ?auto_21607 ?auto_21612 ) ) ( not ( = ?auto_21608 ?auto_21607 ) ) ( HOIST-AT ?auto_21615 ?auto_21607 ) ( not ( = ?auto_21609 ?auto_21615 ) ) ( not ( = ?auto_21614 ?auto_21615 ) ) ( AVAILABLE ?auto_21615 ) ( SURFACE-AT ?auto_21603 ?auto_21607 ) ( ON ?auto_21603 ?auto_21613 ) ( CLEAR ?auto_21603 ) ( not ( = ?auto_21604 ?auto_21613 ) ) ( not ( = ?auto_21605 ?auto_21613 ) ) ( not ( = ?auto_21603 ?auto_21613 ) ) ( not ( = ?auto_21606 ?auto_21613 ) ) ( not ( = ?auto_21610 ?auto_21613 ) ) ( not ( = ?auto_21602 ?auto_21613 ) ) ( TRUCK-AT ?auto_21611 ?auto_21612 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21603 ?auto_21604 ?auto_21605 )
      ( MAKE-3CRATE-VERIFY ?auto_21602 ?auto_21603 ?auto_21604 ?auto_21605 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21616 - SURFACE
      ?auto_21617 - SURFACE
      ?auto_21618 - SURFACE
      ?auto_21619 - SURFACE
      ?auto_21620 - SURFACE
    )
    :vars
    (
      ?auto_21624 - HOIST
      ?auto_21627 - PLACE
      ?auto_21623 - PLACE
      ?auto_21629 - HOIST
      ?auto_21621 - SURFACE
      ?auto_21625 - SURFACE
      ?auto_21622 - PLACE
      ?auto_21630 - HOIST
      ?auto_21628 - SURFACE
      ?auto_21626 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21624 ?auto_21627 ) ( IS-CRATE ?auto_21620 ) ( not ( = ?auto_21619 ?auto_21620 ) ) ( not ( = ?auto_21618 ?auto_21619 ) ) ( not ( = ?auto_21618 ?auto_21620 ) ) ( not ( = ?auto_21623 ?auto_21627 ) ) ( HOIST-AT ?auto_21629 ?auto_21623 ) ( not ( = ?auto_21624 ?auto_21629 ) ) ( SURFACE-AT ?auto_21620 ?auto_21623 ) ( ON ?auto_21620 ?auto_21621 ) ( CLEAR ?auto_21620 ) ( not ( = ?auto_21619 ?auto_21621 ) ) ( not ( = ?auto_21620 ?auto_21621 ) ) ( not ( = ?auto_21618 ?auto_21621 ) ) ( IS-CRATE ?auto_21619 ) ( AVAILABLE ?auto_21629 ) ( SURFACE-AT ?auto_21619 ?auto_21623 ) ( ON ?auto_21619 ?auto_21625 ) ( CLEAR ?auto_21619 ) ( not ( = ?auto_21619 ?auto_21625 ) ) ( not ( = ?auto_21620 ?auto_21625 ) ) ( not ( = ?auto_21618 ?auto_21625 ) ) ( not ( = ?auto_21621 ?auto_21625 ) ) ( SURFACE-AT ?auto_21617 ?auto_21627 ) ( CLEAR ?auto_21617 ) ( IS-CRATE ?auto_21618 ) ( not ( = ?auto_21617 ?auto_21618 ) ) ( not ( = ?auto_21619 ?auto_21617 ) ) ( not ( = ?auto_21620 ?auto_21617 ) ) ( not ( = ?auto_21621 ?auto_21617 ) ) ( not ( = ?auto_21625 ?auto_21617 ) ) ( AVAILABLE ?auto_21624 ) ( not ( = ?auto_21622 ?auto_21627 ) ) ( not ( = ?auto_21623 ?auto_21622 ) ) ( HOIST-AT ?auto_21630 ?auto_21622 ) ( not ( = ?auto_21624 ?auto_21630 ) ) ( not ( = ?auto_21629 ?auto_21630 ) ) ( AVAILABLE ?auto_21630 ) ( SURFACE-AT ?auto_21618 ?auto_21622 ) ( ON ?auto_21618 ?auto_21628 ) ( CLEAR ?auto_21618 ) ( not ( = ?auto_21619 ?auto_21628 ) ) ( not ( = ?auto_21620 ?auto_21628 ) ) ( not ( = ?auto_21618 ?auto_21628 ) ) ( not ( = ?auto_21621 ?auto_21628 ) ) ( not ( = ?auto_21625 ?auto_21628 ) ) ( not ( = ?auto_21617 ?auto_21628 ) ) ( TRUCK-AT ?auto_21626 ?auto_21627 ) ( ON ?auto_21617 ?auto_21616 ) ( not ( = ?auto_21616 ?auto_21617 ) ) ( not ( = ?auto_21616 ?auto_21618 ) ) ( not ( = ?auto_21616 ?auto_21619 ) ) ( not ( = ?auto_21616 ?auto_21620 ) ) ( not ( = ?auto_21616 ?auto_21621 ) ) ( not ( = ?auto_21616 ?auto_21625 ) ) ( not ( = ?auto_21616 ?auto_21628 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21618 ?auto_21619 ?auto_21620 )
      ( MAKE-4CRATE-VERIFY ?auto_21616 ?auto_21617 ?auto_21618 ?auto_21619 ?auto_21620 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21631 - SURFACE
      ?auto_21632 - SURFACE
    )
    :vars
    (
      ?auto_21636 - HOIST
      ?auto_21640 - PLACE
      ?auto_21643 - SURFACE
      ?auto_21635 - PLACE
      ?auto_21642 - HOIST
      ?auto_21633 - SURFACE
      ?auto_21637 - SURFACE
      ?auto_21639 - SURFACE
      ?auto_21634 - PLACE
      ?auto_21644 - HOIST
      ?auto_21641 - SURFACE
      ?auto_21638 - TRUCK
      ?auto_21645 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21636 ?auto_21640 ) ( IS-CRATE ?auto_21632 ) ( not ( = ?auto_21631 ?auto_21632 ) ) ( not ( = ?auto_21643 ?auto_21631 ) ) ( not ( = ?auto_21643 ?auto_21632 ) ) ( not ( = ?auto_21635 ?auto_21640 ) ) ( HOIST-AT ?auto_21642 ?auto_21635 ) ( not ( = ?auto_21636 ?auto_21642 ) ) ( SURFACE-AT ?auto_21632 ?auto_21635 ) ( ON ?auto_21632 ?auto_21633 ) ( CLEAR ?auto_21632 ) ( not ( = ?auto_21631 ?auto_21633 ) ) ( not ( = ?auto_21632 ?auto_21633 ) ) ( not ( = ?auto_21643 ?auto_21633 ) ) ( IS-CRATE ?auto_21631 ) ( AVAILABLE ?auto_21642 ) ( SURFACE-AT ?auto_21631 ?auto_21635 ) ( ON ?auto_21631 ?auto_21637 ) ( CLEAR ?auto_21631 ) ( not ( = ?auto_21631 ?auto_21637 ) ) ( not ( = ?auto_21632 ?auto_21637 ) ) ( not ( = ?auto_21643 ?auto_21637 ) ) ( not ( = ?auto_21633 ?auto_21637 ) ) ( IS-CRATE ?auto_21643 ) ( not ( = ?auto_21639 ?auto_21643 ) ) ( not ( = ?auto_21631 ?auto_21639 ) ) ( not ( = ?auto_21632 ?auto_21639 ) ) ( not ( = ?auto_21633 ?auto_21639 ) ) ( not ( = ?auto_21637 ?auto_21639 ) ) ( not ( = ?auto_21634 ?auto_21640 ) ) ( not ( = ?auto_21635 ?auto_21634 ) ) ( HOIST-AT ?auto_21644 ?auto_21634 ) ( not ( = ?auto_21636 ?auto_21644 ) ) ( not ( = ?auto_21642 ?auto_21644 ) ) ( AVAILABLE ?auto_21644 ) ( SURFACE-AT ?auto_21643 ?auto_21634 ) ( ON ?auto_21643 ?auto_21641 ) ( CLEAR ?auto_21643 ) ( not ( = ?auto_21631 ?auto_21641 ) ) ( not ( = ?auto_21632 ?auto_21641 ) ) ( not ( = ?auto_21643 ?auto_21641 ) ) ( not ( = ?auto_21633 ?auto_21641 ) ) ( not ( = ?auto_21637 ?auto_21641 ) ) ( not ( = ?auto_21639 ?auto_21641 ) ) ( TRUCK-AT ?auto_21638 ?auto_21640 ) ( SURFACE-AT ?auto_21645 ?auto_21640 ) ( CLEAR ?auto_21645 ) ( LIFTING ?auto_21636 ?auto_21639 ) ( IS-CRATE ?auto_21639 ) ( not ( = ?auto_21645 ?auto_21639 ) ) ( not ( = ?auto_21631 ?auto_21645 ) ) ( not ( = ?auto_21632 ?auto_21645 ) ) ( not ( = ?auto_21643 ?auto_21645 ) ) ( not ( = ?auto_21633 ?auto_21645 ) ) ( not ( = ?auto_21637 ?auto_21645 ) ) ( not ( = ?auto_21641 ?auto_21645 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21645 ?auto_21639 )
      ( MAKE-2CRATE ?auto_21643 ?auto_21631 ?auto_21632 )
      ( MAKE-1CRATE-VERIFY ?auto_21631 ?auto_21632 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21646 - SURFACE
      ?auto_21647 - SURFACE
      ?auto_21648 - SURFACE
    )
    :vars
    (
      ?auto_21650 - HOIST
      ?auto_21659 - PLACE
      ?auto_21649 - PLACE
      ?auto_21660 - HOIST
      ?auto_21656 - SURFACE
      ?auto_21651 - SURFACE
      ?auto_21653 - SURFACE
      ?auto_21655 - PLACE
      ?auto_21657 - HOIST
      ?auto_21658 - SURFACE
      ?auto_21652 - TRUCK
      ?auto_21654 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21650 ?auto_21659 ) ( IS-CRATE ?auto_21648 ) ( not ( = ?auto_21647 ?auto_21648 ) ) ( not ( = ?auto_21646 ?auto_21647 ) ) ( not ( = ?auto_21646 ?auto_21648 ) ) ( not ( = ?auto_21649 ?auto_21659 ) ) ( HOIST-AT ?auto_21660 ?auto_21649 ) ( not ( = ?auto_21650 ?auto_21660 ) ) ( SURFACE-AT ?auto_21648 ?auto_21649 ) ( ON ?auto_21648 ?auto_21656 ) ( CLEAR ?auto_21648 ) ( not ( = ?auto_21647 ?auto_21656 ) ) ( not ( = ?auto_21648 ?auto_21656 ) ) ( not ( = ?auto_21646 ?auto_21656 ) ) ( IS-CRATE ?auto_21647 ) ( AVAILABLE ?auto_21660 ) ( SURFACE-AT ?auto_21647 ?auto_21649 ) ( ON ?auto_21647 ?auto_21651 ) ( CLEAR ?auto_21647 ) ( not ( = ?auto_21647 ?auto_21651 ) ) ( not ( = ?auto_21648 ?auto_21651 ) ) ( not ( = ?auto_21646 ?auto_21651 ) ) ( not ( = ?auto_21656 ?auto_21651 ) ) ( IS-CRATE ?auto_21646 ) ( not ( = ?auto_21653 ?auto_21646 ) ) ( not ( = ?auto_21647 ?auto_21653 ) ) ( not ( = ?auto_21648 ?auto_21653 ) ) ( not ( = ?auto_21656 ?auto_21653 ) ) ( not ( = ?auto_21651 ?auto_21653 ) ) ( not ( = ?auto_21655 ?auto_21659 ) ) ( not ( = ?auto_21649 ?auto_21655 ) ) ( HOIST-AT ?auto_21657 ?auto_21655 ) ( not ( = ?auto_21650 ?auto_21657 ) ) ( not ( = ?auto_21660 ?auto_21657 ) ) ( AVAILABLE ?auto_21657 ) ( SURFACE-AT ?auto_21646 ?auto_21655 ) ( ON ?auto_21646 ?auto_21658 ) ( CLEAR ?auto_21646 ) ( not ( = ?auto_21647 ?auto_21658 ) ) ( not ( = ?auto_21648 ?auto_21658 ) ) ( not ( = ?auto_21646 ?auto_21658 ) ) ( not ( = ?auto_21656 ?auto_21658 ) ) ( not ( = ?auto_21651 ?auto_21658 ) ) ( not ( = ?auto_21653 ?auto_21658 ) ) ( TRUCK-AT ?auto_21652 ?auto_21659 ) ( SURFACE-AT ?auto_21654 ?auto_21659 ) ( CLEAR ?auto_21654 ) ( LIFTING ?auto_21650 ?auto_21653 ) ( IS-CRATE ?auto_21653 ) ( not ( = ?auto_21654 ?auto_21653 ) ) ( not ( = ?auto_21647 ?auto_21654 ) ) ( not ( = ?auto_21648 ?auto_21654 ) ) ( not ( = ?auto_21646 ?auto_21654 ) ) ( not ( = ?auto_21656 ?auto_21654 ) ) ( not ( = ?auto_21651 ?auto_21654 ) ) ( not ( = ?auto_21658 ?auto_21654 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21647 ?auto_21648 )
      ( MAKE-2CRATE-VERIFY ?auto_21646 ?auto_21647 ?auto_21648 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21661 - SURFACE
      ?auto_21662 - SURFACE
      ?auto_21663 - SURFACE
      ?auto_21664 - SURFACE
    )
    :vars
    (
      ?auto_21666 - HOIST
      ?auto_21672 - PLACE
      ?auto_21674 - PLACE
      ?auto_21669 - HOIST
      ?auto_21675 - SURFACE
      ?auto_21668 - SURFACE
      ?auto_21667 - PLACE
      ?auto_21671 - HOIST
      ?auto_21670 - SURFACE
      ?auto_21665 - TRUCK
      ?auto_21673 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21666 ?auto_21672 ) ( IS-CRATE ?auto_21664 ) ( not ( = ?auto_21663 ?auto_21664 ) ) ( not ( = ?auto_21662 ?auto_21663 ) ) ( not ( = ?auto_21662 ?auto_21664 ) ) ( not ( = ?auto_21674 ?auto_21672 ) ) ( HOIST-AT ?auto_21669 ?auto_21674 ) ( not ( = ?auto_21666 ?auto_21669 ) ) ( SURFACE-AT ?auto_21664 ?auto_21674 ) ( ON ?auto_21664 ?auto_21675 ) ( CLEAR ?auto_21664 ) ( not ( = ?auto_21663 ?auto_21675 ) ) ( not ( = ?auto_21664 ?auto_21675 ) ) ( not ( = ?auto_21662 ?auto_21675 ) ) ( IS-CRATE ?auto_21663 ) ( AVAILABLE ?auto_21669 ) ( SURFACE-AT ?auto_21663 ?auto_21674 ) ( ON ?auto_21663 ?auto_21668 ) ( CLEAR ?auto_21663 ) ( not ( = ?auto_21663 ?auto_21668 ) ) ( not ( = ?auto_21664 ?auto_21668 ) ) ( not ( = ?auto_21662 ?auto_21668 ) ) ( not ( = ?auto_21675 ?auto_21668 ) ) ( IS-CRATE ?auto_21662 ) ( not ( = ?auto_21661 ?auto_21662 ) ) ( not ( = ?auto_21663 ?auto_21661 ) ) ( not ( = ?auto_21664 ?auto_21661 ) ) ( not ( = ?auto_21675 ?auto_21661 ) ) ( not ( = ?auto_21668 ?auto_21661 ) ) ( not ( = ?auto_21667 ?auto_21672 ) ) ( not ( = ?auto_21674 ?auto_21667 ) ) ( HOIST-AT ?auto_21671 ?auto_21667 ) ( not ( = ?auto_21666 ?auto_21671 ) ) ( not ( = ?auto_21669 ?auto_21671 ) ) ( AVAILABLE ?auto_21671 ) ( SURFACE-AT ?auto_21662 ?auto_21667 ) ( ON ?auto_21662 ?auto_21670 ) ( CLEAR ?auto_21662 ) ( not ( = ?auto_21663 ?auto_21670 ) ) ( not ( = ?auto_21664 ?auto_21670 ) ) ( not ( = ?auto_21662 ?auto_21670 ) ) ( not ( = ?auto_21675 ?auto_21670 ) ) ( not ( = ?auto_21668 ?auto_21670 ) ) ( not ( = ?auto_21661 ?auto_21670 ) ) ( TRUCK-AT ?auto_21665 ?auto_21672 ) ( SURFACE-AT ?auto_21673 ?auto_21672 ) ( CLEAR ?auto_21673 ) ( LIFTING ?auto_21666 ?auto_21661 ) ( IS-CRATE ?auto_21661 ) ( not ( = ?auto_21673 ?auto_21661 ) ) ( not ( = ?auto_21663 ?auto_21673 ) ) ( not ( = ?auto_21664 ?auto_21673 ) ) ( not ( = ?auto_21662 ?auto_21673 ) ) ( not ( = ?auto_21675 ?auto_21673 ) ) ( not ( = ?auto_21668 ?auto_21673 ) ) ( not ( = ?auto_21670 ?auto_21673 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21662 ?auto_21663 ?auto_21664 )
      ( MAKE-3CRATE-VERIFY ?auto_21661 ?auto_21662 ?auto_21663 ?auto_21664 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21676 - SURFACE
      ?auto_21677 - SURFACE
      ?auto_21678 - SURFACE
      ?auto_21679 - SURFACE
      ?auto_21680 - SURFACE
    )
    :vars
    (
      ?auto_21682 - HOIST
      ?auto_21688 - PLACE
      ?auto_21689 - PLACE
      ?auto_21685 - HOIST
      ?auto_21690 - SURFACE
      ?auto_21684 - SURFACE
      ?auto_21683 - PLACE
      ?auto_21687 - HOIST
      ?auto_21686 - SURFACE
      ?auto_21681 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21682 ?auto_21688 ) ( IS-CRATE ?auto_21680 ) ( not ( = ?auto_21679 ?auto_21680 ) ) ( not ( = ?auto_21678 ?auto_21679 ) ) ( not ( = ?auto_21678 ?auto_21680 ) ) ( not ( = ?auto_21689 ?auto_21688 ) ) ( HOIST-AT ?auto_21685 ?auto_21689 ) ( not ( = ?auto_21682 ?auto_21685 ) ) ( SURFACE-AT ?auto_21680 ?auto_21689 ) ( ON ?auto_21680 ?auto_21690 ) ( CLEAR ?auto_21680 ) ( not ( = ?auto_21679 ?auto_21690 ) ) ( not ( = ?auto_21680 ?auto_21690 ) ) ( not ( = ?auto_21678 ?auto_21690 ) ) ( IS-CRATE ?auto_21679 ) ( AVAILABLE ?auto_21685 ) ( SURFACE-AT ?auto_21679 ?auto_21689 ) ( ON ?auto_21679 ?auto_21684 ) ( CLEAR ?auto_21679 ) ( not ( = ?auto_21679 ?auto_21684 ) ) ( not ( = ?auto_21680 ?auto_21684 ) ) ( not ( = ?auto_21678 ?auto_21684 ) ) ( not ( = ?auto_21690 ?auto_21684 ) ) ( IS-CRATE ?auto_21678 ) ( not ( = ?auto_21677 ?auto_21678 ) ) ( not ( = ?auto_21679 ?auto_21677 ) ) ( not ( = ?auto_21680 ?auto_21677 ) ) ( not ( = ?auto_21690 ?auto_21677 ) ) ( not ( = ?auto_21684 ?auto_21677 ) ) ( not ( = ?auto_21683 ?auto_21688 ) ) ( not ( = ?auto_21689 ?auto_21683 ) ) ( HOIST-AT ?auto_21687 ?auto_21683 ) ( not ( = ?auto_21682 ?auto_21687 ) ) ( not ( = ?auto_21685 ?auto_21687 ) ) ( AVAILABLE ?auto_21687 ) ( SURFACE-AT ?auto_21678 ?auto_21683 ) ( ON ?auto_21678 ?auto_21686 ) ( CLEAR ?auto_21678 ) ( not ( = ?auto_21679 ?auto_21686 ) ) ( not ( = ?auto_21680 ?auto_21686 ) ) ( not ( = ?auto_21678 ?auto_21686 ) ) ( not ( = ?auto_21690 ?auto_21686 ) ) ( not ( = ?auto_21684 ?auto_21686 ) ) ( not ( = ?auto_21677 ?auto_21686 ) ) ( TRUCK-AT ?auto_21681 ?auto_21688 ) ( SURFACE-AT ?auto_21676 ?auto_21688 ) ( CLEAR ?auto_21676 ) ( LIFTING ?auto_21682 ?auto_21677 ) ( IS-CRATE ?auto_21677 ) ( not ( = ?auto_21676 ?auto_21677 ) ) ( not ( = ?auto_21679 ?auto_21676 ) ) ( not ( = ?auto_21680 ?auto_21676 ) ) ( not ( = ?auto_21678 ?auto_21676 ) ) ( not ( = ?auto_21690 ?auto_21676 ) ) ( not ( = ?auto_21684 ?auto_21676 ) ) ( not ( = ?auto_21686 ?auto_21676 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21678 ?auto_21679 ?auto_21680 )
      ( MAKE-4CRATE-VERIFY ?auto_21676 ?auto_21677 ?auto_21678 ?auto_21679 ?auto_21680 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21691 - SURFACE
      ?auto_21692 - SURFACE
    )
    :vars
    (
      ?auto_21694 - HOIST
      ?auto_21700 - PLACE
      ?auto_21704 - SURFACE
      ?auto_21702 - PLACE
      ?auto_21697 - HOIST
      ?auto_21705 - SURFACE
      ?auto_21696 - SURFACE
      ?auto_21703 - SURFACE
      ?auto_21695 - PLACE
      ?auto_21699 - HOIST
      ?auto_21698 - SURFACE
      ?auto_21693 - TRUCK
      ?auto_21701 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21694 ?auto_21700 ) ( IS-CRATE ?auto_21692 ) ( not ( = ?auto_21691 ?auto_21692 ) ) ( not ( = ?auto_21704 ?auto_21691 ) ) ( not ( = ?auto_21704 ?auto_21692 ) ) ( not ( = ?auto_21702 ?auto_21700 ) ) ( HOIST-AT ?auto_21697 ?auto_21702 ) ( not ( = ?auto_21694 ?auto_21697 ) ) ( SURFACE-AT ?auto_21692 ?auto_21702 ) ( ON ?auto_21692 ?auto_21705 ) ( CLEAR ?auto_21692 ) ( not ( = ?auto_21691 ?auto_21705 ) ) ( not ( = ?auto_21692 ?auto_21705 ) ) ( not ( = ?auto_21704 ?auto_21705 ) ) ( IS-CRATE ?auto_21691 ) ( AVAILABLE ?auto_21697 ) ( SURFACE-AT ?auto_21691 ?auto_21702 ) ( ON ?auto_21691 ?auto_21696 ) ( CLEAR ?auto_21691 ) ( not ( = ?auto_21691 ?auto_21696 ) ) ( not ( = ?auto_21692 ?auto_21696 ) ) ( not ( = ?auto_21704 ?auto_21696 ) ) ( not ( = ?auto_21705 ?auto_21696 ) ) ( IS-CRATE ?auto_21704 ) ( not ( = ?auto_21703 ?auto_21704 ) ) ( not ( = ?auto_21691 ?auto_21703 ) ) ( not ( = ?auto_21692 ?auto_21703 ) ) ( not ( = ?auto_21705 ?auto_21703 ) ) ( not ( = ?auto_21696 ?auto_21703 ) ) ( not ( = ?auto_21695 ?auto_21700 ) ) ( not ( = ?auto_21702 ?auto_21695 ) ) ( HOIST-AT ?auto_21699 ?auto_21695 ) ( not ( = ?auto_21694 ?auto_21699 ) ) ( not ( = ?auto_21697 ?auto_21699 ) ) ( AVAILABLE ?auto_21699 ) ( SURFACE-AT ?auto_21704 ?auto_21695 ) ( ON ?auto_21704 ?auto_21698 ) ( CLEAR ?auto_21704 ) ( not ( = ?auto_21691 ?auto_21698 ) ) ( not ( = ?auto_21692 ?auto_21698 ) ) ( not ( = ?auto_21704 ?auto_21698 ) ) ( not ( = ?auto_21705 ?auto_21698 ) ) ( not ( = ?auto_21696 ?auto_21698 ) ) ( not ( = ?auto_21703 ?auto_21698 ) ) ( TRUCK-AT ?auto_21693 ?auto_21700 ) ( SURFACE-AT ?auto_21701 ?auto_21700 ) ( CLEAR ?auto_21701 ) ( IS-CRATE ?auto_21703 ) ( not ( = ?auto_21701 ?auto_21703 ) ) ( not ( = ?auto_21691 ?auto_21701 ) ) ( not ( = ?auto_21692 ?auto_21701 ) ) ( not ( = ?auto_21704 ?auto_21701 ) ) ( not ( = ?auto_21705 ?auto_21701 ) ) ( not ( = ?auto_21696 ?auto_21701 ) ) ( not ( = ?auto_21698 ?auto_21701 ) ) ( AVAILABLE ?auto_21694 ) ( IN ?auto_21703 ?auto_21693 ) )
    :subtasks
    ( ( !UNLOAD ?auto_21694 ?auto_21703 ?auto_21693 ?auto_21700 )
      ( MAKE-2CRATE ?auto_21704 ?auto_21691 ?auto_21692 )
      ( MAKE-1CRATE-VERIFY ?auto_21691 ?auto_21692 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21706 - SURFACE
      ?auto_21707 - SURFACE
      ?auto_21708 - SURFACE
    )
    :vars
    (
      ?auto_21712 - HOIST
      ?auto_21710 - PLACE
      ?auto_21714 - PLACE
      ?auto_21711 - HOIST
      ?auto_21716 - SURFACE
      ?auto_21719 - SURFACE
      ?auto_21717 - SURFACE
      ?auto_21720 - PLACE
      ?auto_21713 - HOIST
      ?auto_21718 - SURFACE
      ?auto_21709 - TRUCK
      ?auto_21715 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21712 ?auto_21710 ) ( IS-CRATE ?auto_21708 ) ( not ( = ?auto_21707 ?auto_21708 ) ) ( not ( = ?auto_21706 ?auto_21707 ) ) ( not ( = ?auto_21706 ?auto_21708 ) ) ( not ( = ?auto_21714 ?auto_21710 ) ) ( HOIST-AT ?auto_21711 ?auto_21714 ) ( not ( = ?auto_21712 ?auto_21711 ) ) ( SURFACE-AT ?auto_21708 ?auto_21714 ) ( ON ?auto_21708 ?auto_21716 ) ( CLEAR ?auto_21708 ) ( not ( = ?auto_21707 ?auto_21716 ) ) ( not ( = ?auto_21708 ?auto_21716 ) ) ( not ( = ?auto_21706 ?auto_21716 ) ) ( IS-CRATE ?auto_21707 ) ( AVAILABLE ?auto_21711 ) ( SURFACE-AT ?auto_21707 ?auto_21714 ) ( ON ?auto_21707 ?auto_21719 ) ( CLEAR ?auto_21707 ) ( not ( = ?auto_21707 ?auto_21719 ) ) ( not ( = ?auto_21708 ?auto_21719 ) ) ( not ( = ?auto_21706 ?auto_21719 ) ) ( not ( = ?auto_21716 ?auto_21719 ) ) ( IS-CRATE ?auto_21706 ) ( not ( = ?auto_21717 ?auto_21706 ) ) ( not ( = ?auto_21707 ?auto_21717 ) ) ( not ( = ?auto_21708 ?auto_21717 ) ) ( not ( = ?auto_21716 ?auto_21717 ) ) ( not ( = ?auto_21719 ?auto_21717 ) ) ( not ( = ?auto_21720 ?auto_21710 ) ) ( not ( = ?auto_21714 ?auto_21720 ) ) ( HOIST-AT ?auto_21713 ?auto_21720 ) ( not ( = ?auto_21712 ?auto_21713 ) ) ( not ( = ?auto_21711 ?auto_21713 ) ) ( AVAILABLE ?auto_21713 ) ( SURFACE-AT ?auto_21706 ?auto_21720 ) ( ON ?auto_21706 ?auto_21718 ) ( CLEAR ?auto_21706 ) ( not ( = ?auto_21707 ?auto_21718 ) ) ( not ( = ?auto_21708 ?auto_21718 ) ) ( not ( = ?auto_21706 ?auto_21718 ) ) ( not ( = ?auto_21716 ?auto_21718 ) ) ( not ( = ?auto_21719 ?auto_21718 ) ) ( not ( = ?auto_21717 ?auto_21718 ) ) ( TRUCK-AT ?auto_21709 ?auto_21710 ) ( SURFACE-AT ?auto_21715 ?auto_21710 ) ( CLEAR ?auto_21715 ) ( IS-CRATE ?auto_21717 ) ( not ( = ?auto_21715 ?auto_21717 ) ) ( not ( = ?auto_21707 ?auto_21715 ) ) ( not ( = ?auto_21708 ?auto_21715 ) ) ( not ( = ?auto_21706 ?auto_21715 ) ) ( not ( = ?auto_21716 ?auto_21715 ) ) ( not ( = ?auto_21719 ?auto_21715 ) ) ( not ( = ?auto_21718 ?auto_21715 ) ) ( AVAILABLE ?auto_21712 ) ( IN ?auto_21717 ?auto_21709 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21707 ?auto_21708 )
      ( MAKE-2CRATE-VERIFY ?auto_21706 ?auto_21707 ?auto_21708 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21721 - SURFACE
      ?auto_21722 - SURFACE
      ?auto_21723 - SURFACE
      ?auto_21724 - SURFACE
    )
    :vars
    (
      ?auto_21731 - HOIST
      ?auto_21726 - PLACE
      ?auto_21734 - PLACE
      ?auto_21730 - HOIST
      ?auto_21729 - SURFACE
      ?auto_21728 - SURFACE
      ?auto_21732 - PLACE
      ?auto_21727 - HOIST
      ?auto_21733 - SURFACE
      ?auto_21725 - TRUCK
      ?auto_21735 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21731 ?auto_21726 ) ( IS-CRATE ?auto_21724 ) ( not ( = ?auto_21723 ?auto_21724 ) ) ( not ( = ?auto_21722 ?auto_21723 ) ) ( not ( = ?auto_21722 ?auto_21724 ) ) ( not ( = ?auto_21734 ?auto_21726 ) ) ( HOIST-AT ?auto_21730 ?auto_21734 ) ( not ( = ?auto_21731 ?auto_21730 ) ) ( SURFACE-AT ?auto_21724 ?auto_21734 ) ( ON ?auto_21724 ?auto_21729 ) ( CLEAR ?auto_21724 ) ( not ( = ?auto_21723 ?auto_21729 ) ) ( not ( = ?auto_21724 ?auto_21729 ) ) ( not ( = ?auto_21722 ?auto_21729 ) ) ( IS-CRATE ?auto_21723 ) ( AVAILABLE ?auto_21730 ) ( SURFACE-AT ?auto_21723 ?auto_21734 ) ( ON ?auto_21723 ?auto_21728 ) ( CLEAR ?auto_21723 ) ( not ( = ?auto_21723 ?auto_21728 ) ) ( not ( = ?auto_21724 ?auto_21728 ) ) ( not ( = ?auto_21722 ?auto_21728 ) ) ( not ( = ?auto_21729 ?auto_21728 ) ) ( IS-CRATE ?auto_21722 ) ( not ( = ?auto_21721 ?auto_21722 ) ) ( not ( = ?auto_21723 ?auto_21721 ) ) ( not ( = ?auto_21724 ?auto_21721 ) ) ( not ( = ?auto_21729 ?auto_21721 ) ) ( not ( = ?auto_21728 ?auto_21721 ) ) ( not ( = ?auto_21732 ?auto_21726 ) ) ( not ( = ?auto_21734 ?auto_21732 ) ) ( HOIST-AT ?auto_21727 ?auto_21732 ) ( not ( = ?auto_21731 ?auto_21727 ) ) ( not ( = ?auto_21730 ?auto_21727 ) ) ( AVAILABLE ?auto_21727 ) ( SURFACE-AT ?auto_21722 ?auto_21732 ) ( ON ?auto_21722 ?auto_21733 ) ( CLEAR ?auto_21722 ) ( not ( = ?auto_21723 ?auto_21733 ) ) ( not ( = ?auto_21724 ?auto_21733 ) ) ( not ( = ?auto_21722 ?auto_21733 ) ) ( not ( = ?auto_21729 ?auto_21733 ) ) ( not ( = ?auto_21728 ?auto_21733 ) ) ( not ( = ?auto_21721 ?auto_21733 ) ) ( TRUCK-AT ?auto_21725 ?auto_21726 ) ( SURFACE-AT ?auto_21735 ?auto_21726 ) ( CLEAR ?auto_21735 ) ( IS-CRATE ?auto_21721 ) ( not ( = ?auto_21735 ?auto_21721 ) ) ( not ( = ?auto_21723 ?auto_21735 ) ) ( not ( = ?auto_21724 ?auto_21735 ) ) ( not ( = ?auto_21722 ?auto_21735 ) ) ( not ( = ?auto_21729 ?auto_21735 ) ) ( not ( = ?auto_21728 ?auto_21735 ) ) ( not ( = ?auto_21733 ?auto_21735 ) ) ( AVAILABLE ?auto_21731 ) ( IN ?auto_21721 ?auto_21725 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21722 ?auto_21723 ?auto_21724 )
      ( MAKE-3CRATE-VERIFY ?auto_21721 ?auto_21722 ?auto_21723 ?auto_21724 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21736 - SURFACE
      ?auto_21737 - SURFACE
      ?auto_21738 - SURFACE
      ?auto_21739 - SURFACE
      ?auto_21740 - SURFACE
    )
    :vars
    (
      ?auto_21747 - HOIST
      ?auto_21742 - PLACE
      ?auto_21750 - PLACE
      ?auto_21746 - HOIST
      ?auto_21745 - SURFACE
      ?auto_21744 - SURFACE
      ?auto_21748 - PLACE
      ?auto_21743 - HOIST
      ?auto_21749 - SURFACE
      ?auto_21741 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21747 ?auto_21742 ) ( IS-CRATE ?auto_21740 ) ( not ( = ?auto_21739 ?auto_21740 ) ) ( not ( = ?auto_21738 ?auto_21739 ) ) ( not ( = ?auto_21738 ?auto_21740 ) ) ( not ( = ?auto_21750 ?auto_21742 ) ) ( HOIST-AT ?auto_21746 ?auto_21750 ) ( not ( = ?auto_21747 ?auto_21746 ) ) ( SURFACE-AT ?auto_21740 ?auto_21750 ) ( ON ?auto_21740 ?auto_21745 ) ( CLEAR ?auto_21740 ) ( not ( = ?auto_21739 ?auto_21745 ) ) ( not ( = ?auto_21740 ?auto_21745 ) ) ( not ( = ?auto_21738 ?auto_21745 ) ) ( IS-CRATE ?auto_21739 ) ( AVAILABLE ?auto_21746 ) ( SURFACE-AT ?auto_21739 ?auto_21750 ) ( ON ?auto_21739 ?auto_21744 ) ( CLEAR ?auto_21739 ) ( not ( = ?auto_21739 ?auto_21744 ) ) ( not ( = ?auto_21740 ?auto_21744 ) ) ( not ( = ?auto_21738 ?auto_21744 ) ) ( not ( = ?auto_21745 ?auto_21744 ) ) ( IS-CRATE ?auto_21738 ) ( not ( = ?auto_21737 ?auto_21738 ) ) ( not ( = ?auto_21739 ?auto_21737 ) ) ( not ( = ?auto_21740 ?auto_21737 ) ) ( not ( = ?auto_21745 ?auto_21737 ) ) ( not ( = ?auto_21744 ?auto_21737 ) ) ( not ( = ?auto_21748 ?auto_21742 ) ) ( not ( = ?auto_21750 ?auto_21748 ) ) ( HOIST-AT ?auto_21743 ?auto_21748 ) ( not ( = ?auto_21747 ?auto_21743 ) ) ( not ( = ?auto_21746 ?auto_21743 ) ) ( AVAILABLE ?auto_21743 ) ( SURFACE-AT ?auto_21738 ?auto_21748 ) ( ON ?auto_21738 ?auto_21749 ) ( CLEAR ?auto_21738 ) ( not ( = ?auto_21739 ?auto_21749 ) ) ( not ( = ?auto_21740 ?auto_21749 ) ) ( not ( = ?auto_21738 ?auto_21749 ) ) ( not ( = ?auto_21745 ?auto_21749 ) ) ( not ( = ?auto_21744 ?auto_21749 ) ) ( not ( = ?auto_21737 ?auto_21749 ) ) ( TRUCK-AT ?auto_21741 ?auto_21742 ) ( SURFACE-AT ?auto_21736 ?auto_21742 ) ( CLEAR ?auto_21736 ) ( IS-CRATE ?auto_21737 ) ( not ( = ?auto_21736 ?auto_21737 ) ) ( not ( = ?auto_21739 ?auto_21736 ) ) ( not ( = ?auto_21740 ?auto_21736 ) ) ( not ( = ?auto_21738 ?auto_21736 ) ) ( not ( = ?auto_21745 ?auto_21736 ) ) ( not ( = ?auto_21744 ?auto_21736 ) ) ( not ( = ?auto_21749 ?auto_21736 ) ) ( AVAILABLE ?auto_21747 ) ( IN ?auto_21737 ?auto_21741 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21738 ?auto_21739 ?auto_21740 )
      ( MAKE-4CRATE-VERIFY ?auto_21736 ?auto_21737 ?auto_21738 ?auto_21739 ?auto_21740 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21751 - SURFACE
      ?auto_21752 - SURFACE
    )
    :vars
    (
      ?auto_21759 - HOIST
      ?auto_21754 - PLACE
      ?auto_21761 - SURFACE
      ?auto_21764 - PLACE
      ?auto_21758 - HOIST
      ?auto_21757 - SURFACE
      ?auto_21756 - SURFACE
      ?auto_21762 - SURFACE
      ?auto_21760 - PLACE
      ?auto_21755 - HOIST
      ?auto_21763 - SURFACE
      ?auto_21765 - SURFACE
      ?auto_21753 - TRUCK
      ?auto_21766 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21759 ?auto_21754 ) ( IS-CRATE ?auto_21752 ) ( not ( = ?auto_21751 ?auto_21752 ) ) ( not ( = ?auto_21761 ?auto_21751 ) ) ( not ( = ?auto_21761 ?auto_21752 ) ) ( not ( = ?auto_21764 ?auto_21754 ) ) ( HOIST-AT ?auto_21758 ?auto_21764 ) ( not ( = ?auto_21759 ?auto_21758 ) ) ( SURFACE-AT ?auto_21752 ?auto_21764 ) ( ON ?auto_21752 ?auto_21757 ) ( CLEAR ?auto_21752 ) ( not ( = ?auto_21751 ?auto_21757 ) ) ( not ( = ?auto_21752 ?auto_21757 ) ) ( not ( = ?auto_21761 ?auto_21757 ) ) ( IS-CRATE ?auto_21751 ) ( AVAILABLE ?auto_21758 ) ( SURFACE-AT ?auto_21751 ?auto_21764 ) ( ON ?auto_21751 ?auto_21756 ) ( CLEAR ?auto_21751 ) ( not ( = ?auto_21751 ?auto_21756 ) ) ( not ( = ?auto_21752 ?auto_21756 ) ) ( not ( = ?auto_21761 ?auto_21756 ) ) ( not ( = ?auto_21757 ?auto_21756 ) ) ( IS-CRATE ?auto_21761 ) ( not ( = ?auto_21762 ?auto_21761 ) ) ( not ( = ?auto_21751 ?auto_21762 ) ) ( not ( = ?auto_21752 ?auto_21762 ) ) ( not ( = ?auto_21757 ?auto_21762 ) ) ( not ( = ?auto_21756 ?auto_21762 ) ) ( not ( = ?auto_21760 ?auto_21754 ) ) ( not ( = ?auto_21764 ?auto_21760 ) ) ( HOIST-AT ?auto_21755 ?auto_21760 ) ( not ( = ?auto_21759 ?auto_21755 ) ) ( not ( = ?auto_21758 ?auto_21755 ) ) ( AVAILABLE ?auto_21755 ) ( SURFACE-AT ?auto_21761 ?auto_21760 ) ( ON ?auto_21761 ?auto_21763 ) ( CLEAR ?auto_21761 ) ( not ( = ?auto_21751 ?auto_21763 ) ) ( not ( = ?auto_21752 ?auto_21763 ) ) ( not ( = ?auto_21761 ?auto_21763 ) ) ( not ( = ?auto_21757 ?auto_21763 ) ) ( not ( = ?auto_21756 ?auto_21763 ) ) ( not ( = ?auto_21762 ?auto_21763 ) ) ( SURFACE-AT ?auto_21765 ?auto_21754 ) ( CLEAR ?auto_21765 ) ( IS-CRATE ?auto_21762 ) ( not ( = ?auto_21765 ?auto_21762 ) ) ( not ( = ?auto_21751 ?auto_21765 ) ) ( not ( = ?auto_21752 ?auto_21765 ) ) ( not ( = ?auto_21761 ?auto_21765 ) ) ( not ( = ?auto_21757 ?auto_21765 ) ) ( not ( = ?auto_21756 ?auto_21765 ) ) ( not ( = ?auto_21763 ?auto_21765 ) ) ( AVAILABLE ?auto_21759 ) ( IN ?auto_21762 ?auto_21753 ) ( TRUCK-AT ?auto_21753 ?auto_21766 ) ( not ( = ?auto_21766 ?auto_21754 ) ) ( not ( = ?auto_21764 ?auto_21766 ) ) ( not ( = ?auto_21760 ?auto_21766 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21753 ?auto_21766 ?auto_21754 )
      ( MAKE-2CRATE ?auto_21761 ?auto_21751 ?auto_21752 )
      ( MAKE-1CRATE-VERIFY ?auto_21751 ?auto_21752 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21767 - SURFACE
      ?auto_21768 - SURFACE
      ?auto_21769 - SURFACE
    )
    :vars
    (
      ?auto_21772 - HOIST
      ?auto_21781 - PLACE
      ?auto_21774 - PLACE
      ?auto_21773 - HOIST
      ?auto_21780 - SURFACE
      ?auto_21770 - SURFACE
      ?auto_21777 - SURFACE
      ?auto_21771 - PLACE
      ?auto_21776 - HOIST
      ?auto_21778 - SURFACE
      ?auto_21775 - SURFACE
      ?auto_21779 - TRUCK
      ?auto_21782 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21772 ?auto_21781 ) ( IS-CRATE ?auto_21769 ) ( not ( = ?auto_21768 ?auto_21769 ) ) ( not ( = ?auto_21767 ?auto_21768 ) ) ( not ( = ?auto_21767 ?auto_21769 ) ) ( not ( = ?auto_21774 ?auto_21781 ) ) ( HOIST-AT ?auto_21773 ?auto_21774 ) ( not ( = ?auto_21772 ?auto_21773 ) ) ( SURFACE-AT ?auto_21769 ?auto_21774 ) ( ON ?auto_21769 ?auto_21780 ) ( CLEAR ?auto_21769 ) ( not ( = ?auto_21768 ?auto_21780 ) ) ( not ( = ?auto_21769 ?auto_21780 ) ) ( not ( = ?auto_21767 ?auto_21780 ) ) ( IS-CRATE ?auto_21768 ) ( AVAILABLE ?auto_21773 ) ( SURFACE-AT ?auto_21768 ?auto_21774 ) ( ON ?auto_21768 ?auto_21770 ) ( CLEAR ?auto_21768 ) ( not ( = ?auto_21768 ?auto_21770 ) ) ( not ( = ?auto_21769 ?auto_21770 ) ) ( not ( = ?auto_21767 ?auto_21770 ) ) ( not ( = ?auto_21780 ?auto_21770 ) ) ( IS-CRATE ?auto_21767 ) ( not ( = ?auto_21777 ?auto_21767 ) ) ( not ( = ?auto_21768 ?auto_21777 ) ) ( not ( = ?auto_21769 ?auto_21777 ) ) ( not ( = ?auto_21780 ?auto_21777 ) ) ( not ( = ?auto_21770 ?auto_21777 ) ) ( not ( = ?auto_21771 ?auto_21781 ) ) ( not ( = ?auto_21774 ?auto_21771 ) ) ( HOIST-AT ?auto_21776 ?auto_21771 ) ( not ( = ?auto_21772 ?auto_21776 ) ) ( not ( = ?auto_21773 ?auto_21776 ) ) ( AVAILABLE ?auto_21776 ) ( SURFACE-AT ?auto_21767 ?auto_21771 ) ( ON ?auto_21767 ?auto_21778 ) ( CLEAR ?auto_21767 ) ( not ( = ?auto_21768 ?auto_21778 ) ) ( not ( = ?auto_21769 ?auto_21778 ) ) ( not ( = ?auto_21767 ?auto_21778 ) ) ( not ( = ?auto_21780 ?auto_21778 ) ) ( not ( = ?auto_21770 ?auto_21778 ) ) ( not ( = ?auto_21777 ?auto_21778 ) ) ( SURFACE-AT ?auto_21775 ?auto_21781 ) ( CLEAR ?auto_21775 ) ( IS-CRATE ?auto_21777 ) ( not ( = ?auto_21775 ?auto_21777 ) ) ( not ( = ?auto_21768 ?auto_21775 ) ) ( not ( = ?auto_21769 ?auto_21775 ) ) ( not ( = ?auto_21767 ?auto_21775 ) ) ( not ( = ?auto_21780 ?auto_21775 ) ) ( not ( = ?auto_21770 ?auto_21775 ) ) ( not ( = ?auto_21778 ?auto_21775 ) ) ( AVAILABLE ?auto_21772 ) ( IN ?auto_21777 ?auto_21779 ) ( TRUCK-AT ?auto_21779 ?auto_21782 ) ( not ( = ?auto_21782 ?auto_21781 ) ) ( not ( = ?auto_21774 ?auto_21782 ) ) ( not ( = ?auto_21771 ?auto_21782 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21768 ?auto_21769 )
      ( MAKE-2CRATE-VERIFY ?auto_21767 ?auto_21768 ?auto_21769 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21783 - SURFACE
      ?auto_21784 - SURFACE
      ?auto_21785 - SURFACE
      ?auto_21786 - SURFACE
    )
    :vars
    (
      ?auto_21793 - HOIST
      ?auto_21790 - PLACE
      ?auto_21795 - PLACE
      ?auto_21791 - HOIST
      ?auto_21788 - SURFACE
      ?auto_21798 - SURFACE
      ?auto_21797 - PLACE
      ?auto_21794 - HOIST
      ?auto_21787 - SURFACE
      ?auto_21789 - SURFACE
      ?auto_21792 - TRUCK
      ?auto_21796 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21793 ?auto_21790 ) ( IS-CRATE ?auto_21786 ) ( not ( = ?auto_21785 ?auto_21786 ) ) ( not ( = ?auto_21784 ?auto_21785 ) ) ( not ( = ?auto_21784 ?auto_21786 ) ) ( not ( = ?auto_21795 ?auto_21790 ) ) ( HOIST-AT ?auto_21791 ?auto_21795 ) ( not ( = ?auto_21793 ?auto_21791 ) ) ( SURFACE-AT ?auto_21786 ?auto_21795 ) ( ON ?auto_21786 ?auto_21788 ) ( CLEAR ?auto_21786 ) ( not ( = ?auto_21785 ?auto_21788 ) ) ( not ( = ?auto_21786 ?auto_21788 ) ) ( not ( = ?auto_21784 ?auto_21788 ) ) ( IS-CRATE ?auto_21785 ) ( AVAILABLE ?auto_21791 ) ( SURFACE-AT ?auto_21785 ?auto_21795 ) ( ON ?auto_21785 ?auto_21798 ) ( CLEAR ?auto_21785 ) ( not ( = ?auto_21785 ?auto_21798 ) ) ( not ( = ?auto_21786 ?auto_21798 ) ) ( not ( = ?auto_21784 ?auto_21798 ) ) ( not ( = ?auto_21788 ?auto_21798 ) ) ( IS-CRATE ?auto_21784 ) ( not ( = ?auto_21783 ?auto_21784 ) ) ( not ( = ?auto_21785 ?auto_21783 ) ) ( not ( = ?auto_21786 ?auto_21783 ) ) ( not ( = ?auto_21788 ?auto_21783 ) ) ( not ( = ?auto_21798 ?auto_21783 ) ) ( not ( = ?auto_21797 ?auto_21790 ) ) ( not ( = ?auto_21795 ?auto_21797 ) ) ( HOIST-AT ?auto_21794 ?auto_21797 ) ( not ( = ?auto_21793 ?auto_21794 ) ) ( not ( = ?auto_21791 ?auto_21794 ) ) ( AVAILABLE ?auto_21794 ) ( SURFACE-AT ?auto_21784 ?auto_21797 ) ( ON ?auto_21784 ?auto_21787 ) ( CLEAR ?auto_21784 ) ( not ( = ?auto_21785 ?auto_21787 ) ) ( not ( = ?auto_21786 ?auto_21787 ) ) ( not ( = ?auto_21784 ?auto_21787 ) ) ( not ( = ?auto_21788 ?auto_21787 ) ) ( not ( = ?auto_21798 ?auto_21787 ) ) ( not ( = ?auto_21783 ?auto_21787 ) ) ( SURFACE-AT ?auto_21789 ?auto_21790 ) ( CLEAR ?auto_21789 ) ( IS-CRATE ?auto_21783 ) ( not ( = ?auto_21789 ?auto_21783 ) ) ( not ( = ?auto_21785 ?auto_21789 ) ) ( not ( = ?auto_21786 ?auto_21789 ) ) ( not ( = ?auto_21784 ?auto_21789 ) ) ( not ( = ?auto_21788 ?auto_21789 ) ) ( not ( = ?auto_21798 ?auto_21789 ) ) ( not ( = ?auto_21787 ?auto_21789 ) ) ( AVAILABLE ?auto_21793 ) ( IN ?auto_21783 ?auto_21792 ) ( TRUCK-AT ?auto_21792 ?auto_21796 ) ( not ( = ?auto_21796 ?auto_21790 ) ) ( not ( = ?auto_21795 ?auto_21796 ) ) ( not ( = ?auto_21797 ?auto_21796 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21784 ?auto_21785 ?auto_21786 )
      ( MAKE-3CRATE-VERIFY ?auto_21783 ?auto_21784 ?auto_21785 ?auto_21786 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21799 - SURFACE
      ?auto_21800 - SURFACE
      ?auto_21801 - SURFACE
      ?auto_21802 - SURFACE
      ?auto_21803 - SURFACE
    )
    :vars
    (
      ?auto_21809 - HOIST
      ?auto_21806 - PLACE
      ?auto_21811 - PLACE
      ?auto_21807 - HOIST
      ?auto_21805 - SURFACE
      ?auto_21814 - SURFACE
      ?auto_21813 - PLACE
      ?auto_21810 - HOIST
      ?auto_21804 - SURFACE
      ?auto_21808 - TRUCK
      ?auto_21812 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21809 ?auto_21806 ) ( IS-CRATE ?auto_21803 ) ( not ( = ?auto_21802 ?auto_21803 ) ) ( not ( = ?auto_21801 ?auto_21802 ) ) ( not ( = ?auto_21801 ?auto_21803 ) ) ( not ( = ?auto_21811 ?auto_21806 ) ) ( HOIST-AT ?auto_21807 ?auto_21811 ) ( not ( = ?auto_21809 ?auto_21807 ) ) ( SURFACE-AT ?auto_21803 ?auto_21811 ) ( ON ?auto_21803 ?auto_21805 ) ( CLEAR ?auto_21803 ) ( not ( = ?auto_21802 ?auto_21805 ) ) ( not ( = ?auto_21803 ?auto_21805 ) ) ( not ( = ?auto_21801 ?auto_21805 ) ) ( IS-CRATE ?auto_21802 ) ( AVAILABLE ?auto_21807 ) ( SURFACE-AT ?auto_21802 ?auto_21811 ) ( ON ?auto_21802 ?auto_21814 ) ( CLEAR ?auto_21802 ) ( not ( = ?auto_21802 ?auto_21814 ) ) ( not ( = ?auto_21803 ?auto_21814 ) ) ( not ( = ?auto_21801 ?auto_21814 ) ) ( not ( = ?auto_21805 ?auto_21814 ) ) ( IS-CRATE ?auto_21801 ) ( not ( = ?auto_21800 ?auto_21801 ) ) ( not ( = ?auto_21802 ?auto_21800 ) ) ( not ( = ?auto_21803 ?auto_21800 ) ) ( not ( = ?auto_21805 ?auto_21800 ) ) ( not ( = ?auto_21814 ?auto_21800 ) ) ( not ( = ?auto_21813 ?auto_21806 ) ) ( not ( = ?auto_21811 ?auto_21813 ) ) ( HOIST-AT ?auto_21810 ?auto_21813 ) ( not ( = ?auto_21809 ?auto_21810 ) ) ( not ( = ?auto_21807 ?auto_21810 ) ) ( AVAILABLE ?auto_21810 ) ( SURFACE-AT ?auto_21801 ?auto_21813 ) ( ON ?auto_21801 ?auto_21804 ) ( CLEAR ?auto_21801 ) ( not ( = ?auto_21802 ?auto_21804 ) ) ( not ( = ?auto_21803 ?auto_21804 ) ) ( not ( = ?auto_21801 ?auto_21804 ) ) ( not ( = ?auto_21805 ?auto_21804 ) ) ( not ( = ?auto_21814 ?auto_21804 ) ) ( not ( = ?auto_21800 ?auto_21804 ) ) ( SURFACE-AT ?auto_21799 ?auto_21806 ) ( CLEAR ?auto_21799 ) ( IS-CRATE ?auto_21800 ) ( not ( = ?auto_21799 ?auto_21800 ) ) ( not ( = ?auto_21802 ?auto_21799 ) ) ( not ( = ?auto_21803 ?auto_21799 ) ) ( not ( = ?auto_21801 ?auto_21799 ) ) ( not ( = ?auto_21805 ?auto_21799 ) ) ( not ( = ?auto_21814 ?auto_21799 ) ) ( not ( = ?auto_21804 ?auto_21799 ) ) ( AVAILABLE ?auto_21809 ) ( IN ?auto_21800 ?auto_21808 ) ( TRUCK-AT ?auto_21808 ?auto_21812 ) ( not ( = ?auto_21812 ?auto_21806 ) ) ( not ( = ?auto_21811 ?auto_21812 ) ) ( not ( = ?auto_21813 ?auto_21812 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21801 ?auto_21802 ?auto_21803 )
      ( MAKE-4CRATE-VERIFY ?auto_21799 ?auto_21800 ?auto_21801 ?auto_21802 ?auto_21803 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21815 - SURFACE
      ?auto_21816 - SURFACE
    )
    :vars
    (
      ?auto_21823 - HOIST
      ?auto_21820 - PLACE
      ?auto_21824 - SURFACE
      ?auto_21826 - PLACE
      ?auto_21821 - HOIST
      ?auto_21818 - SURFACE
      ?auto_21830 - SURFACE
      ?auto_21829 - SURFACE
      ?auto_21828 - PLACE
      ?auto_21825 - HOIST
      ?auto_21817 - SURFACE
      ?auto_21819 - SURFACE
      ?auto_21822 - TRUCK
      ?auto_21827 - PLACE
      ?auto_21831 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21823 ?auto_21820 ) ( IS-CRATE ?auto_21816 ) ( not ( = ?auto_21815 ?auto_21816 ) ) ( not ( = ?auto_21824 ?auto_21815 ) ) ( not ( = ?auto_21824 ?auto_21816 ) ) ( not ( = ?auto_21826 ?auto_21820 ) ) ( HOIST-AT ?auto_21821 ?auto_21826 ) ( not ( = ?auto_21823 ?auto_21821 ) ) ( SURFACE-AT ?auto_21816 ?auto_21826 ) ( ON ?auto_21816 ?auto_21818 ) ( CLEAR ?auto_21816 ) ( not ( = ?auto_21815 ?auto_21818 ) ) ( not ( = ?auto_21816 ?auto_21818 ) ) ( not ( = ?auto_21824 ?auto_21818 ) ) ( IS-CRATE ?auto_21815 ) ( AVAILABLE ?auto_21821 ) ( SURFACE-AT ?auto_21815 ?auto_21826 ) ( ON ?auto_21815 ?auto_21830 ) ( CLEAR ?auto_21815 ) ( not ( = ?auto_21815 ?auto_21830 ) ) ( not ( = ?auto_21816 ?auto_21830 ) ) ( not ( = ?auto_21824 ?auto_21830 ) ) ( not ( = ?auto_21818 ?auto_21830 ) ) ( IS-CRATE ?auto_21824 ) ( not ( = ?auto_21829 ?auto_21824 ) ) ( not ( = ?auto_21815 ?auto_21829 ) ) ( not ( = ?auto_21816 ?auto_21829 ) ) ( not ( = ?auto_21818 ?auto_21829 ) ) ( not ( = ?auto_21830 ?auto_21829 ) ) ( not ( = ?auto_21828 ?auto_21820 ) ) ( not ( = ?auto_21826 ?auto_21828 ) ) ( HOIST-AT ?auto_21825 ?auto_21828 ) ( not ( = ?auto_21823 ?auto_21825 ) ) ( not ( = ?auto_21821 ?auto_21825 ) ) ( AVAILABLE ?auto_21825 ) ( SURFACE-AT ?auto_21824 ?auto_21828 ) ( ON ?auto_21824 ?auto_21817 ) ( CLEAR ?auto_21824 ) ( not ( = ?auto_21815 ?auto_21817 ) ) ( not ( = ?auto_21816 ?auto_21817 ) ) ( not ( = ?auto_21824 ?auto_21817 ) ) ( not ( = ?auto_21818 ?auto_21817 ) ) ( not ( = ?auto_21830 ?auto_21817 ) ) ( not ( = ?auto_21829 ?auto_21817 ) ) ( SURFACE-AT ?auto_21819 ?auto_21820 ) ( CLEAR ?auto_21819 ) ( IS-CRATE ?auto_21829 ) ( not ( = ?auto_21819 ?auto_21829 ) ) ( not ( = ?auto_21815 ?auto_21819 ) ) ( not ( = ?auto_21816 ?auto_21819 ) ) ( not ( = ?auto_21824 ?auto_21819 ) ) ( not ( = ?auto_21818 ?auto_21819 ) ) ( not ( = ?auto_21830 ?auto_21819 ) ) ( not ( = ?auto_21817 ?auto_21819 ) ) ( AVAILABLE ?auto_21823 ) ( TRUCK-AT ?auto_21822 ?auto_21827 ) ( not ( = ?auto_21827 ?auto_21820 ) ) ( not ( = ?auto_21826 ?auto_21827 ) ) ( not ( = ?auto_21828 ?auto_21827 ) ) ( HOIST-AT ?auto_21831 ?auto_21827 ) ( LIFTING ?auto_21831 ?auto_21829 ) ( not ( = ?auto_21823 ?auto_21831 ) ) ( not ( = ?auto_21821 ?auto_21831 ) ) ( not ( = ?auto_21825 ?auto_21831 ) ) )
    :subtasks
    ( ( !LOAD ?auto_21831 ?auto_21829 ?auto_21822 ?auto_21827 )
      ( MAKE-2CRATE ?auto_21824 ?auto_21815 ?auto_21816 )
      ( MAKE-1CRATE-VERIFY ?auto_21815 ?auto_21816 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21832 - SURFACE
      ?auto_21833 - SURFACE
      ?auto_21834 - SURFACE
    )
    :vars
    (
      ?auto_21847 - HOIST
      ?auto_21844 - PLACE
      ?auto_21842 - PLACE
      ?auto_21840 - HOIST
      ?auto_21835 - SURFACE
      ?auto_21839 - SURFACE
      ?auto_21846 - SURFACE
      ?auto_21841 - PLACE
      ?auto_21843 - HOIST
      ?auto_21837 - SURFACE
      ?auto_21848 - SURFACE
      ?auto_21845 - TRUCK
      ?auto_21838 - PLACE
      ?auto_21836 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21847 ?auto_21844 ) ( IS-CRATE ?auto_21834 ) ( not ( = ?auto_21833 ?auto_21834 ) ) ( not ( = ?auto_21832 ?auto_21833 ) ) ( not ( = ?auto_21832 ?auto_21834 ) ) ( not ( = ?auto_21842 ?auto_21844 ) ) ( HOIST-AT ?auto_21840 ?auto_21842 ) ( not ( = ?auto_21847 ?auto_21840 ) ) ( SURFACE-AT ?auto_21834 ?auto_21842 ) ( ON ?auto_21834 ?auto_21835 ) ( CLEAR ?auto_21834 ) ( not ( = ?auto_21833 ?auto_21835 ) ) ( not ( = ?auto_21834 ?auto_21835 ) ) ( not ( = ?auto_21832 ?auto_21835 ) ) ( IS-CRATE ?auto_21833 ) ( AVAILABLE ?auto_21840 ) ( SURFACE-AT ?auto_21833 ?auto_21842 ) ( ON ?auto_21833 ?auto_21839 ) ( CLEAR ?auto_21833 ) ( not ( = ?auto_21833 ?auto_21839 ) ) ( not ( = ?auto_21834 ?auto_21839 ) ) ( not ( = ?auto_21832 ?auto_21839 ) ) ( not ( = ?auto_21835 ?auto_21839 ) ) ( IS-CRATE ?auto_21832 ) ( not ( = ?auto_21846 ?auto_21832 ) ) ( not ( = ?auto_21833 ?auto_21846 ) ) ( not ( = ?auto_21834 ?auto_21846 ) ) ( not ( = ?auto_21835 ?auto_21846 ) ) ( not ( = ?auto_21839 ?auto_21846 ) ) ( not ( = ?auto_21841 ?auto_21844 ) ) ( not ( = ?auto_21842 ?auto_21841 ) ) ( HOIST-AT ?auto_21843 ?auto_21841 ) ( not ( = ?auto_21847 ?auto_21843 ) ) ( not ( = ?auto_21840 ?auto_21843 ) ) ( AVAILABLE ?auto_21843 ) ( SURFACE-AT ?auto_21832 ?auto_21841 ) ( ON ?auto_21832 ?auto_21837 ) ( CLEAR ?auto_21832 ) ( not ( = ?auto_21833 ?auto_21837 ) ) ( not ( = ?auto_21834 ?auto_21837 ) ) ( not ( = ?auto_21832 ?auto_21837 ) ) ( not ( = ?auto_21835 ?auto_21837 ) ) ( not ( = ?auto_21839 ?auto_21837 ) ) ( not ( = ?auto_21846 ?auto_21837 ) ) ( SURFACE-AT ?auto_21848 ?auto_21844 ) ( CLEAR ?auto_21848 ) ( IS-CRATE ?auto_21846 ) ( not ( = ?auto_21848 ?auto_21846 ) ) ( not ( = ?auto_21833 ?auto_21848 ) ) ( not ( = ?auto_21834 ?auto_21848 ) ) ( not ( = ?auto_21832 ?auto_21848 ) ) ( not ( = ?auto_21835 ?auto_21848 ) ) ( not ( = ?auto_21839 ?auto_21848 ) ) ( not ( = ?auto_21837 ?auto_21848 ) ) ( AVAILABLE ?auto_21847 ) ( TRUCK-AT ?auto_21845 ?auto_21838 ) ( not ( = ?auto_21838 ?auto_21844 ) ) ( not ( = ?auto_21842 ?auto_21838 ) ) ( not ( = ?auto_21841 ?auto_21838 ) ) ( HOIST-AT ?auto_21836 ?auto_21838 ) ( LIFTING ?auto_21836 ?auto_21846 ) ( not ( = ?auto_21847 ?auto_21836 ) ) ( not ( = ?auto_21840 ?auto_21836 ) ) ( not ( = ?auto_21843 ?auto_21836 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21833 ?auto_21834 )
      ( MAKE-2CRATE-VERIFY ?auto_21832 ?auto_21833 ?auto_21834 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21849 - SURFACE
      ?auto_21850 - SURFACE
      ?auto_21851 - SURFACE
      ?auto_21852 - SURFACE
    )
    :vars
    (
      ?auto_21856 - HOIST
      ?auto_21857 - PLACE
      ?auto_21859 - PLACE
      ?auto_21853 - HOIST
      ?auto_21865 - SURFACE
      ?auto_21855 - SURFACE
      ?auto_21864 - PLACE
      ?auto_21858 - HOIST
      ?auto_21863 - SURFACE
      ?auto_21861 - SURFACE
      ?auto_21860 - TRUCK
      ?auto_21862 - PLACE
      ?auto_21854 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21856 ?auto_21857 ) ( IS-CRATE ?auto_21852 ) ( not ( = ?auto_21851 ?auto_21852 ) ) ( not ( = ?auto_21850 ?auto_21851 ) ) ( not ( = ?auto_21850 ?auto_21852 ) ) ( not ( = ?auto_21859 ?auto_21857 ) ) ( HOIST-AT ?auto_21853 ?auto_21859 ) ( not ( = ?auto_21856 ?auto_21853 ) ) ( SURFACE-AT ?auto_21852 ?auto_21859 ) ( ON ?auto_21852 ?auto_21865 ) ( CLEAR ?auto_21852 ) ( not ( = ?auto_21851 ?auto_21865 ) ) ( not ( = ?auto_21852 ?auto_21865 ) ) ( not ( = ?auto_21850 ?auto_21865 ) ) ( IS-CRATE ?auto_21851 ) ( AVAILABLE ?auto_21853 ) ( SURFACE-AT ?auto_21851 ?auto_21859 ) ( ON ?auto_21851 ?auto_21855 ) ( CLEAR ?auto_21851 ) ( not ( = ?auto_21851 ?auto_21855 ) ) ( not ( = ?auto_21852 ?auto_21855 ) ) ( not ( = ?auto_21850 ?auto_21855 ) ) ( not ( = ?auto_21865 ?auto_21855 ) ) ( IS-CRATE ?auto_21850 ) ( not ( = ?auto_21849 ?auto_21850 ) ) ( not ( = ?auto_21851 ?auto_21849 ) ) ( not ( = ?auto_21852 ?auto_21849 ) ) ( not ( = ?auto_21865 ?auto_21849 ) ) ( not ( = ?auto_21855 ?auto_21849 ) ) ( not ( = ?auto_21864 ?auto_21857 ) ) ( not ( = ?auto_21859 ?auto_21864 ) ) ( HOIST-AT ?auto_21858 ?auto_21864 ) ( not ( = ?auto_21856 ?auto_21858 ) ) ( not ( = ?auto_21853 ?auto_21858 ) ) ( AVAILABLE ?auto_21858 ) ( SURFACE-AT ?auto_21850 ?auto_21864 ) ( ON ?auto_21850 ?auto_21863 ) ( CLEAR ?auto_21850 ) ( not ( = ?auto_21851 ?auto_21863 ) ) ( not ( = ?auto_21852 ?auto_21863 ) ) ( not ( = ?auto_21850 ?auto_21863 ) ) ( not ( = ?auto_21865 ?auto_21863 ) ) ( not ( = ?auto_21855 ?auto_21863 ) ) ( not ( = ?auto_21849 ?auto_21863 ) ) ( SURFACE-AT ?auto_21861 ?auto_21857 ) ( CLEAR ?auto_21861 ) ( IS-CRATE ?auto_21849 ) ( not ( = ?auto_21861 ?auto_21849 ) ) ( not ( = ?auto_21851 ?auto_21861 ) ) ( not ( = ?auto_21852 ?auto_21861 ) ) ( not ( = ?auto_21850 ?auto_21861 ) ) ( not ( = ?auto_21865 ?auto_21861 ) ) ( not ( = ?auto_21855 ?auto_21861 ) ) ( not ( = ?auto_21863 ?auto_21861 ) ) ( AVAILABLE ?auto_21856 ) ( TRUCK-AT ?auto_21860 ?auto_21862 ) ( not ( = ?auto_21862 ?auto_21857 ) ) ( not ( = ?auto_21859 ?auto_21862 ) ) ( not ( = ?auto_21864 ?auto_21862 ) ) ( HOIST-AT ?auto_21854 ?auto_21862 ) ( LIFTING ?auto_21854 ?auto_21849 ) ( not ( = ?auto_21856 ?auto_21854 ) ) ( not ( = ?auto_21853 ?auto_21854 ) ) ( not ( = ?auto_21858 ?auto_21854 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21850 ?auto_21851 ?auto_21852 )
      ( MAKE-3CRATE-VERIFY ?auto_21849 ?auto_21850 ?auto_21851 ?auto_21852 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21866 - SURFACE
      ?auto_21867 - SURFACE
      ?auto_21868 - SURFACE
      ?auto_21869 - SURFACE
      ?auto_21870 - SURFACE
    )
    :vars
    (
      ?auto_21874 - HOIST
      ?auto_21875 - PLACE
      ?auto_21877 - PLACE
      ?auto_21871 - HOIST
      ?auto_21882 - SURFACE
      ?auto_21873 - SURFACE
      ?auto_21881 - PLACE
      ?auto_21876 - HOIST
      ?auto_21880 - SURFACE
      ?auto_21878 - TRUCK
      ?auto_21879 - PLACE
      ?auto_21872 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21874 ?auto_21875 ) ( IS-CRATE ?auto_21870 ) ( not ( = ?auto_21869 ?auto_21870 ) ) ( not ( = ?auto_21868 ?auto_21869 ) ) ( not ( = ?auto_21868 ?auto_21870 ) ) ( not ( = ?auto_21877 ?auto_21875 ) ) ( HOIST-AT ?auto_21871 ?auto_21877 ) ( not ( = ?auto_21874 ?auto_21871 ) ) ( SURFACE-AT ?auto_21870 ?auto_21877 ) ( ON ?auto_21870 ?auto_21882 ) ( CLEAR ?auto_21870 ) ( not ( = ?auto_21869 ?auto_21882 ) ) ( not ( = ?auto_21870 ?auto_21882 ) ) ( not ( = ?auto_21868 ?auto_21882 ) ) ( IS-CRATE ?auto_21869 ) ( AVAILABLE ?auto_21871 ) ( SURFACE-AT ?auto_21869 ?auto_21877 ) ( ON ?auto_21869 ?auto_21873 ) ( CLEAR ?auto_21869 ) ( not ( = ?auto_21869 ?auto_21873 ) ) ( not ( = ?auto_21870 ?auto_21873 ) ) ( not ( = ?auto_21868 ?auto_21873 ) ) ( not ( = ?auto_21882 ?auto_21873 ) ) ( IS-CRATE ?auto_21868 ) ( not ( = ?auto_21867 ?auto_21868 ) ) ( not ( = ?auto_21869 ?auto_21867 ) ) ( not ( = ?auto_21870 ?auto_21867 ) ) ( not ( = ?auto_21882 ?auto_21867 ) ) ( not ( = ?auto_21873 ?auto_21867 ) ) ( not ( = ?auto_21881 ?auto_21875 ) ) ( not ( = ?auto_21877 ?auto_21881 ) ) ( HOIST-AT ?auto_21876 ?auto_21881 ) ( not ( = ?auto_21874 ?auto_21876 ) ) ( not ( = ?auto_21871 ?auto_21876 ) ) ( AVAILABLE ?auto_21876 ) ( SURFACE-AT ?auto_21868 ?auto_21881 ) ( ON ?auto_21868 ?auto_21880 ) ( CLEAR ?auto_21868 ) ( not ( = ?auto_21869 ?auto_21880 ) ) ( not ( = ?auto_21870 ?auto_21880 ) ) ( not ( = ?auto_21868 ?auto_21880 ) ) ( not ( = ?auto_21882 ?auto_21880 ) ) ( not ( = ?auto_21873 ?auto_21880 ) ) ( not ( = ?auto_21867 ?auto_21880 ) ) ( SURFACE-AT ?auto_21866 ?auto_21875 ) ( CLEAR ?auto_21866 ) ( IS-CRATE ?auto_21867 ) ( not ( = ?auto_21866 ?auto_21867 ) ) ( not ( = ?auto_21869 ?auto_21866 ) ) ( not ( = ?auto_21870 ?auto_21866 ) ) ( not ( = ?auto_21868 ?auto_21866 ) ) ( not ( = ?auto_21882 ?auto_21866 ) ) ( not ( = ?auto_21873 ?auto_21866 ) ) ( not ( = ?auto_21880 ?auto_21866 ) ) ( AVAILABLE ?auto_21874 ) ( TRUCK-AT ?auto_21878 ?auto_21879 ) ( not ( = ?auto_21879 ?auto_21875 ) ) ( not ( = ?auto_21877 ?auto_21879 ) ) ( not ( = ?auto_21881 ?auto_21879 ) ) ( HOIST-AT ?auto_21872 ?auto_21879 ) ( LIFTING ?auto_21872 ?auto_21867 ) ( not ( = ?auto_21874 ?auto_21872 ) ) ( not ( = ?auto_21871 ?auto_21872 ) ) ( not ( = ?auto_21876 ?auto_21872 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21868 ?auto_21869 ?auto_21870 )
      ( MAKE-4CRATE-VERIFY ?auto_21866 ?auto_21867 ?auto_21868 ?auto_21869 ?auto_21870 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21883 - SURFACE
      ?auto_21884 - SURFACE
    )
    :vars
    (
      ?auto_21889 - HOIST
      ?auto_21890 - PLACE
      ?auto_21887 - SURFACE
      ?auto_21892 - PLACE
      ?auto_21885 - HOIST
      ?auto_21899 - SURFACE
      ?auto_21888 - SURFACE
      ?auto_21897 - SURFACE
      ?auto_21898 - PLACE
      ?auto_21891 - HOIST
      ?auto_21896 - SURFACE
      ?auto_21894 - SURFACE
      ?auto_21893 - TRUCK
      ?auto_21895 - PLACE
      ?auto_21886 - HOIST
      ?auto_21900 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21889 ?auto_21890 ) ( IS-CRATE ?auto_21884 ) ( not ( = ?auto_21883 ?auto_21884 ) ) ( not ( = ?auto_21887 ?auto_21883 ) ) ( not ( = ?auto_21887 ?auto_21884 ) ) ( not ( = ?auto_21892 ?auto_21890 ) ) ( HOIST-AT ?auto_21885 ?auto_21892 ) ( not ( = ?auto_21889 ?auto_21885 ) ) ( SURFACE-AT ?auto_21884 ?auto_21892 ) ( ON ?auto_21884 ?auto_21899 ) ( CLEAR ?auto_21884 ) ( not ( = ?auto_21883 ?auto_21899 ) ) ( not ( = ?auto_21884 ?auto_21899 ) ) ( not ( = ?auto_21887 ?auto_21899 ) ) ( IS-CRATE ?auto_21883 ) ( AVAILABLE ?auto_21885 ) ( SURFACE-AT ?auto_21883 ?auto_21892 ) ( ON ?auto_21883 ?auto_21888 ) ( CLEAR ?auto_21883 ) ( not ( = ?auto_21883 ?auto_21888 ) ) ( not ( = ?auto_21884 ?auto_21888 ) ) ( not ( = ?auto_21887 ?auto_21888 ) ) ( not ( = ?auto_21899 ?auto_21888 ) ) ( IS-CRATE ?auto_21887 ) ( not ( = ?auto_21897 ?auto_21887 ) ) ( not ( = ?auto_21883 ?auto_21897 ) ) ( not ( = ?auto_21884 ?auto_21897 ) ) ( not ( = ?auto_21899 ?auto_21897 ) ) ( not ( = ?auto_21888 ?auto_21897 ) ) ( not ( = ?auto_21898 ?auto_21890 ) ) ( not ( = ?auto_21892 ?auto_21898 ) ) ( HOIST-AT ?auto_21891 ?auto_21898 ) ( not ( = ?auto_21889 ?auto_21891 ) ) ( not ( = ?auto_21885 ?auto_21891 ) ) ( AVAILABLE ?auto_21891 ) ( SURFACE-AT ?auto_21887 ?auto_21898 ) ( ON ?auto_21887 ?auto_21896 ) ( CLEAR ?auto_21887 ) ( not ( = ?auto_21883 ?auto_21896 ) ) ( not ( = ?auto_21884 ?auto_21896 ) ) ( not ( = ?auto_21887 ?auto_21896 ) ) ( not ( = ?auto_21899 ?auto_21896 ) ) ( not ( = ?auto_21888 ?auto_21896 ) ) ( not ( = ?auto_21897 ?auto_21896 ) ) ( SURFACE-AT ?auto_21894 ?auto_21890 ) ( CLEAR ?auto_21894 ) ( IS-CRATE ?auto_21897 ) ( not ( = ?auto_21894 ?auto_21897 ) ) ( not ( = ?auto_21883 ?auto_21894 ) ) ( not ( = ?auto_21884 ?auto_21894 ) ) ( not ( = ?auto_21887 ?auto_21894 ) ) ( not ( = ?auto_21899 ?auto_21894 ) ) ( not ( = ?auto_21888 ?auto_21894 ) ) ( not ( = ?auto_21896 ?auto_21894 ) ) ( AVAILABLE ?auto_21889 ) ( TRUCK-AT ?auto_21893 ?auto_21895 ) ( not ( = ?auto_21895 ?auto_21890 ) ) ( not ( = ?auto_21892 ?auto_21895 ) ) ( not ( = ?auto_21898 ?auto_21895 ) ) ( HOIST-AT ?auto_21886 ?auto_21895 ) ( not ( = ?auto_21889 ?auto_21886 ) ) ( not ( = ?auto_21885 ?auto_21886 ) ) ( not ( = ?auto_21891 ?auto_21886 ) ) ( AVAILABLE ?auto_21886 ) ( SURFACE-AT ?auto_21897 ?auto_21895 ) ( ON ?auto_21897 ?auto_21900 ) ( CLEAR ?auto_21897 ) ( not ( = ?auto_21883 ?auto_21900 ) ) ( not ( = ?auto_21884 ?auto_21900 ) ) ( not ( = ?auto_21887 ?auto_21900 ) ) ( not ( = ?auto_21899 ?auto_21900 ) ) ( not ( = ?auto_21888 ?auto_21900 ) ) ( not ( = ?auto_21897 ?auto_21900 ) ) ( not ( = ?auto_21896 ?auto_21900 ) ) ( not ( = ?auto_21894 ?auto_21900 ) ) )
    :subtasks
    ( ( !LIFT ?auto_21886 ?auto_21897 ?auto_21900 ?auto_21895 )
      ( MAKE-2CRATE ?auto_21887 ?auto_21883 ?auto_21884 )
      ( MAKE-1CRATE-VERIFY ?auto_21883 ?auto_21884 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21901 - SURFACE
      ?auto_21902 - SURFACE
      ?auto_21903 - SURFACE
    )
    :vars
    (
      ?auto_21909 - HOIST
      ?auto_21916 - PLACE
      ?auto_21911 - PLACE
      ?auto_21904 - HOIST
      ?auto_21907 - SURFACE
      ?auto_21914 - SURFACE
      ?auto_21917 - SURFACE
      ?auto_21912 - PLACE
      ?auto_21915 - HOIST
      ?auto_21910 - SURFACE
      ?auto_21906 - SURFACE
      ?auto_21918 - TRUCK
      ?auto_21908 - PLACE
      ?auto_21913 - HOIST
      ?auto_21905 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21909 ?auto_21916 ) ( IS-CRATE ?auto_21903 ) ( not ( = ?auto_21902 ?auto_21903 ) ) ( not ( = ?auto_21901 ?auto_21902 ) ) ( not ( = ?auto_21901 ?auto_21903 ) ) ( not ( = ?auto_21911 ?auto_21916 ) ) ( HOIST-AT ?auto_21904 ?auto_21911 ) ( not ( = ?auto_21909 ?auto_21904 ) ) ( SURFACE-AT ?auto_21903 ?auto_21911 ) ( ON ?auto_21903 ?auto_21907 ) ( CLEAR ?auto_21903 ) ( not ( = ?auto_21902 ?auto_21907 ) ) ( not ( = ?auto_21903 ?auto_21907 ) ) ( not ( = ?auto_21901 ?auto_21907 ) ) ( IS-CRATE ?auto_21902 ) ( AVAILABLE ?auto_21904 ) ( SURFACE-AT ?auto_21902 ?auto_21911 ) ( ON ?auto_21902 ?auto_21914 ) ( CLEAR ?auto_21902 ) ( not ( = ?auto_21902 ?auto_21914 ) ) ( not ( = ?auto_21903 ?auto_21914 ) ) ( not ( = ?auto_21901 ?auto_21914 ) ) ( not ( = ?auto_21907 ?auto_21914 ) ) ( IS-CRATE ?auto_21901 ) ( not ( = ?auto_21917 ?auto_21901 ) ) ( not ( = ?auto_21902 ?auto_21917 ) ) ( not ( = ?auto_21903 ?auto_21917 ) ) ( not ( = ?auto_21907 ?auto_21917 ) ) ( not ( = ?auto_21914 ?auto_21917 ) ) ( not ( = ?auto_21912 ?auto_21916 ) ) ( not ( = ?auto_21911 ?auto_21912 ) ) ( HOIST-AT ?auto_21915 ?auto_21912 ) ( not ( = ?auto_21909 ?auto_21915 ) ) ( not ( = ?auto_21904 ?auto_21915 ) ) ( AVAILABLE ?auto_21915 ) ( SURFACE-AT ?auto_21901 ?auto_21912 ) ( ON ?auto_21901 ?auto_21910 ) ( CLEAR ?auto_21901 ) ( not ( = ?auto_21902 ?auto_21910 ) ) ( not ( = ?auto_21903 ?auto_21910 ) ) ( not ( = ?auto_21901 ?auto_21910 ) ) ( not ( = ?auto_21907 ?auto_21910 ) ) ( not ( = ?auto_21914 ?auto_21910 ) ) ( not ( = ?auto_21917 ?auto_21910 ) ) ( SURFACE-AT ?auto_21906 ?auto_21916 ) ( CLEAR ?auto_21906 ) ( IS-CRATE ?auto_21917 ) ( not ( = ?auto_21906 ?auto_21917 ) ) ( not ( = ?auto_21902 ?auto_21906 ) ) ( not ( = ?auto_21903 ?auto_21906 ) ) ( not ( = ?auto_21901 ?auto_21906 ) ) ( not ( = ?auto_21907 ?auto_21906 ) ) ( not ( = ?auto_21914 ?auto_21906 ) ) ( not ( = ?auto_21910 ?auto_21906 ) ) ( AVAILABLE ?auto_21909 ) ( TRUCK-AT ?auto_21918 ?auto_21908 ) ( not ( = ?auto_21908 ?auto_21916 ) ) ( not ( = ?auto_21911 ?auto_21908 ) ) ( not ( = ?auto_21912 ?auto_21908 ) ) ( HOIST-AT ?auto_21913 ?auto_21908 ) ( not ( = ?auto_21909 ?auto_21913 ) ) ( not ( = ?auto_21904 ?auto_21913 ) ) ( not ( = ?auto_21915 ?auto_21913 ) ) ( AVAILABLE ?auto_21913 ) ( SURFACE-AT ?auto_21917 ?auto_21908 ) ( ON ?auto_21917 ?auto_21905 ) ( CLEAR ?auto_21917 ) ( not ( = ?auto_21902 ?auto_21905 ) ) ( not ( = ?auto_21903 ?auto_21905 ) ) ( not ( = ?auto_21901 ?auto_21905 ) ) ( not ( = ?auto_21907 ?auto_21905 ) ) ( not ( = ?auto_21914 ?auto_21905 ) ) ( not ( = ?auto_21917 ?auto_21905 ) ) ( not ( = ?auto_21910 ?auto_21905 ) ) ( not ( = ?auto_21906 ?auto_21905 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21902 ?auto_21903 )
      ( MAKE-2CRATE-VERIFY ?auto_21901 ?auto_21902 ?auto_21903 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21919 - SURFACE
      ?auto_21920 - SURFACE
      ?auto_21921 - SURFACE
      ?auto_21922 - SURFACE
    )
    :vars
    (
      ?auto_21936 - HOIST
      ?auto_21931 - PLACE
      ?auto_21928 - PLACE
      ?auto_21929 - HOIST
      ?auto_21923 - SURFACE
      ?auto_21934 - SURFACE
      ?auto_21933 - PLACE
      ?auto_21930 - HOIST
      ?auto_21927 - SURFACE
      ?auto_21932 - SURFACE
      ?auto_21924 - TRUCK
      ?auto_21926 - PLACE
      ?auto_21935 - HOIST
      ?auto_21925 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21936 ?auto_21931 ) ( IS-CRATE ?auto_21922 ) ( not ( = ?auto_21921 ?auto_21922 ) ) ( not ( = ?auto_21920 ?auto_21921 ) ) ( not ( = ?auto_21920 ?auto_21922 ) ) ( not ( = ?auto_21928 ?auto_21931 ) ) ( HOIST-AT ?auto_21929 ?auto_21928 ) ( not ( = ?auto_21936 ?auto_21929 ) ) ( SURFACE-AT ?auto_21922 ?auto_21928 ) ( ON ?auto_21922 ?auto_21923 ) ( CLEAR ?auto_21922 ) ( not ( = ?auto_21921 ?auto_21923 ) ) ( not ( = ?auto_21922 ?auto_21923 ) ) ( not ( = ?auto_21920 ?auto_21923 ) ) ( IS-CRATE ?auto_21921 ) ( AVAILABLE ?auto_21929 ) ( SURFACE-AT ?auto_21921 ?auto_21928 ) ( ON ?auto_21921 ?auto_21934 ) ( CLEAR ?auto_21921 ) ( not ( = ?auto_21921 ?auto_21934 ) ) ( not ( = ?auto_21922 ?auto_21934 ) ) ( not ( = ?auto_21920 ?auto_21934 ) ) ( not ( = ?auto_21923 ?auto_21934 ) ) ( IS-CRATE ?auto_21920 ) ( not ( = ?auto_21919 ?auto_21920 ) ) ( not ( = ?auto_21921 ?auto_21919 ) ) ( not ( = ?auto_21922 ?auto_21919 ) ) ( not ( = ?auto_21923 ?auto_21919 ) ) ( not ( = ?auto_21934 ?auto_21919 ) ) ( not ( = ?auto_21933 ?auto_21931 ) ) ( not ( = ?auto_21928 ?auto_21933 ) ) ( HOIST-AT ?auto_21930 ?auto_21933 ) ( not ( = ?auto_21936 ?auto_21930 ) ) ( not ( = ?auto_21929 ?auto_21930 ) ) ( AVAILABLE ?auto_21930 ) ( SURFACE-AT ?auto_21920 ?auto_21933 ) ( ON ?auto_21920 ?auto_21927 ) ( CLEAR ?auto_21920 ) ( not ( = ?auto_21921 ?auto_21927 ) ) ( not ( = ?auto_21922 ?auto_21927 ) ) ( not ( = ?auto_21920 ?auto_21927 ) ) ( not ( = ?auto_21923 ?auto_21927 ) ) ( not ( = ?auto_21934 ?auto_21927 ) ) ( not ( = ?auto_21919 ?auto_21927 ) ) ( SURFACE-AT ?auto_21932 ?auto_21931 ) ( CLEAR ?auto_21932 ) ( IS-CRATE ?auto_21919 ) ( not ( = ?auto_21932 ?auto_21919 ) ) ( not ( = ?auto_21921 ?auto_21932 ) ) ( not ( = ?auto_21922 ?auto_21932 ) ) ( not ( = ?auto_21920 ?auto_21932 ) ) ( not ( = ?auto_21923 ?auto_21932 ) ) ( not ( = ?auto_21934 ?auto_21932 ) ) ( not ( = ?auto_21927 ?auto_21932 ) ) ( AVAILABLE ?auto_21936 ) ( TRUCK-AT ?auto_21924 ?auto_21926 ) ( not ( = ?auto_21926 ?auto_21931 ) ) ( not ( = ?auto_21928 ?auto_21926 ) ) ( not ( = ?auto_21933 ?auto_21926 ) ) ( HOIST-AT ?auto_21935 ?auto_21926 ) ( not ( = ?auto_21936 ?auto_21935 ) ) ( not ( = ?auto_21929 ?auto_21935 ) ) ( not ( = ?auto_21930 ?auto_21935 ) ) ( AVAILABLE ?auto_21935 ) ( SURFACE-AT ?auto_21919 ?auto_21926 ) ( ON ?auto_21919 ?auto_21925 ) ( CLEAR ?auto_21919 ) ( not ( = ?auto_21921 ?auto_21925 ) ) ( not ( = ?auto_21922 ?auto_21925 ) ) ( not ( = ?auto_21920 ?auto_21925 ) ) ( not ( = ?auto_21923 ?auto_21925 ) ) ( not ( = ?auto_21934 ?auto_21925 ) ) ( not ( = ?auto_21919 ?auto_21925 ) ) ( not ( = ?auto_21927 ?auto_21925 ) ) ( not ( = ?auto_21932 ?auto_21925 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21920 ?auto_21921 ?auto_21922 )
      ( MAKE-3CRATE-VERIFY ?auto_21919 ?auto_21920 ?auto_21921 ?auto_21922 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21937 - SURFACE
      ?auto_21938 - SURFACE
      ?auto_21939 - SURFACE
      ?auto_21940 - SURFACE
      ?auto_21941 - SURFACE
    )
    :vars
    (
      ?auto_21954 - HOIST
      ?auto_21950 - PLACE
      ?auto_21947 - PLACE
      ?auto_21948 - HOIST
      ?auto_21942 - SURFACE
      ?auto_21952 - SURFACE
      ?auto_21951 - PLACE
      ?auto_21949 - HOIST
      ?auto_21946 - SURFACE
      ?auto_21943 - TRUCK
      ?auto_21945 - PLACE
      ?auto_21953 - HOIST
      ?auto_21944 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21954 ?auto_21950 ) ( IS-CRATE ?auto_21941 ) ( not ( = ?auto_21940 ?auto_21941 ) ) ( not ( = ?auto_21939 ?auto_21940 ) ) ( not ( = ?auto_21939 ?auto_21941 ) ) ( not ( = ?auto_21947 ?auto_21950 ) ) ( HOIST-AT ?auto_21948 ?auto_21947 ) ( not ( = ?auto_21954 ?auto_21948 ) ) ( SURFACE-AT ?auto_21941 ?auto_21947 ) ( ON ?auto_21941 ?auto_21942 ) ( CLEAR ?auto_21941 ) ( not ( = ?auto_21940 ?auto_21942 ) ) ( not ( = ?auto_21941 ?auto_21942 ) ) ( not ( = ?auto_21939 ?auto_21942 ) ) ( IS-CRATE ?auto_21940 ) ( AVAILABLE ?auto_21948 ) ( SURFACE-AT ?auto_21940 ?auto_21947 ) ( ON ?auto_21940 ?auto_21952 ) ( CLEAR ?auto_21940 ) ( not ( = ?auto_21940 ?auto_21952 ) ) ( not ( = ?auto_21941 ?auto_21952 ) ) ( not ( = ?auto_21939 ?auto_21952 ) ) ( not ( = ?auto_21942 ?auto_21952 ) ) ( IS-CRATE ?auto_21939 ) ( not ( = ?auto_21938 ?auto_21939 ) ) ( not ( = ?auto_21940 ?auto_21938 ) ) ( not ( = ?auto_21941 ?auto_21938 ) ) ( not ( = ?auto_21942 ?auto_21938 ) ) ( not ( = ?auto_21952 ?auto_21938 ) ) ( not ( = ?auto_21951 ?auto_21950 ) ) ( not ( = ?auto_21947 ?auto_21951 ) ) ( HOIST-AT ?auto_21949 ?auto_21951 ) ( not ( = ?auto_21954 ?auto_21949 ) ) ( not ( = ?auto_21948 ?auto_21949 ) ) ( AVAILABLE ?auto_21949 ) ( SURFACE-AT ?auto_21939 ?auto_21951 ) ( ON ?auto_21939 ?auto_21946 ) ( CLEAR ?auto_21939 ) ( not ( = ?auto_21940 ?auto_21946 ) ) ( not ( = ?auto_21941 ?auto_21946 ) ) ( not ( = ?auto_21939 ?auto_21946 ) ) ( not ( = ?auto_21942 ?auto_21946 ) ) ( not ( = ?auto_21952 ?auto_21946 ) ) ( not ( = ?auto_21938 ?auto_21946 ) ) ( SURFACE-AT ?auto_21937 ?auto_21950 ) ( CLEAR ?auto_21937 ) ( IS-CRATE ?auto_21938 ) ( not ( = ?auto_21937 ?auto_21938 ) ) ( not ( = ?auto_21940 ?auto_21937 ) ) ( not ( = ?auto_21941 ?auto_21937 ) ) ( not ( = ?auto_21939 ?auto_21937 ) ) ( not ( = ?auto_21942 ?auto_21937 ) ) ( not ( = ?auto_21952 ?auto_21937 ) ) ( not ( = ?auto_21946 ?auto_21937 ) ) ( AVAILABLE ?auto_21954 ) ( TRUCK-AT ?auto_21943 ?auto_21945 ) ( not ( = ?auto_21945 ?auto_21950 ) ) ( not ( = ?auto_21947 ?auto_21945 ) ) ( not ( = ?auto_21951 ?auto_21945 ) ) ( HOIST-AT ?auto_21953 ?auto_21945 ) ( not ( = ?auto_21954 ?auto_21953 ) ) ( not ( = ?auto_21948 ?auto_21953 ) ) ( not ( = ?auto_21949 ?auto_21953 ) ) ( AVAILABLE ?auto_21953 ) ( SURFACE-AT ?auto_21938 ?auto_21945 ) ( ON ?auto_21938 ?auto_21944 ) ( CLEAR ?auto_21938 ) ( not ( = ?auto_21940 ?auto_21944 ) ) ( not ( = ?auto_21941 ?auto_21944 ) ) ( not ( = ?auto_21939 ?auto_21944 ) ) ( not ( = ?auto_21942 ?auto_21944 ) ) ( not ( = ?auto_21952 ?auto_21944 ) ) ( not ( = ?auto_21938 ?auto_21944 ) ) ( not ( = ?auto_21946 ?auto_21944 ) ) ( not ( = ?auto_21937 ?auto_21944 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21939 ?auto_21940 ?auto_21941 )
      ( MAKE-4CRATE-VERIFY ?auto_21937 ?auto_21938 ?auto_21939 ?auto_21940 ?auto_21941 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21955 - SURFACE
      ?auto_21956 - SURFACE
    )
    :vars
    (
      ?auto_21971 - HOIST
      ?auto_21966 - PLACE
      ?auto_21972 - SURFACE
      ?auto_21962 - PLACE
      ?auto_21963 - HOIST
      ?auto_21957 - SURFACE
      ?auto_21969 - SURFACE
      ?auto_21965 - SURFACE
      ?auto_21968 - PLACE
      ?auto_21964 - HOIST
      ?auto_21961 - SURFACE
      ?auto_21967 - SURFACE
      ?auto_21960 - PLACE
      ?auto_21970 - HOIST
      ?auto_21959 - SURFACE
      ?auto_21958 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21971 ?auto_21966 ) ( IS-CRATE ?auto_21956 ) ( not ( = ?auto_21955 ?auto_21956 ) ) ( not ( = ?auto_21972 ?auto_21955 ) ) ( not ( = ?auto_21972 ?auto_21956 ) ) ( not ( = ?auto_21962 ?auto_21966 ) ) ( HOIST-AT ?auto_21963 ?auto_21962 ) ( not ( = ?auto_21971 ?auto_21963 ) ) ( SURFACE-AT ?auto_21956 ?auto_21962 ) ( ON ?auto_21956 ?auto_21957 ) ( CLEAR ?auto_21956 ) ( not ( = ?auto_21955 ?auto_21957 ) ) ( not ( = ?auto_21956 ?auto_21957 ) ) ( not ( = ?auto_21972 ?auto_21957 ) ) ( IS-CRATE ?auto_21955 ) ( AVAILABLE ?auto_21963 ) ( SURFACE-AT ?auto_21955 ?auto_21962 ) ( ON ?auto_21955 ?auto_21969 ) ( CLEAR ?auto_21955 ) ( not ( = ?auto_21955 ?auto_21969 ) ) ( not ( = ?auto_21956 ?auto_21969 ) ) ( not ( = ?auto_21972 ?auto_21969 ) ) ( not ( = ?auto_21957 ?auto_21969 ) ) ( IS-CRATE ?auto_21972 ) ( not ( = ?auto_21965 ?auto_21972 ) ) ( not ( = ?auto_21955 ?auto_21965 ) ) ( not ( = ?auto_21956 ?auto_21965 ) ) ( not ( = ?auto_21957 ?auto_21965 ) ) ( not ( = ?auto_21969 ?auto_21965 ) ) ( not ( = ?auto_21968 ?auto_21966 ) ) ( not ( = ?auto_21962 ?auto_21968 ) ) ( HOIST-AT ?auto_21964 ?auto_21968 ) ( not ( = ?auto_21971 ?auto_21964 ) ) ( not ( = ?auto_21963 ?auto_21964 ) ) ( AVAILABLE ?auto_21964 ) ( SURFACE-AT ?auto_21972 ?auto_21968 ) ( ON ?auto_21972 ?auto_21961 ) ( CLEAR ?auto_21972 ) ( not ( = ?auto_21955 ?auto_21961 ) ) ( not ( = ?auto_21956 ?auto_21961 ) ) ( not ( = ?auto_21972 ?auto_21961 ) ) ( not ( = ?auto_21957 ?auto_21961 ) ) ( not ( = ?auto_21969 ?auto_21961 ) ) ( not ( = ?auto_21965 ?auto_21961 ) ) ( SURFACE-AT ?auto_21967 ?auto_21966 ) ( CLEAR ?auto_21967 ) ( IS-CRATE ?auto_21965 ) ( not ( = ?auto_21967 ?auto_21965 ) ) ( not ( = ?auto_21955 ?auto_21967 ) ) ( not ( = ?auto_21956 ?auto_21967 ) ) ( not ( = ?auto_21972 ?auto_21967 ) ) ( not ( = ?auto_21957 ?auto_21967 ) ) ( not ( = ?auto_21969 ?auto_21967 ) ) ( not ( = ?auto_21961 ?auto_21967 ) ) ( AVAILABLE ?auto_21971 ) ( not ( = ?auto_21960 ?auto_21966 ) ) ( not ( = ?auto_21962 ?auto_21960 ) ) ( not ( = ?auto_21968 ?auto_21960 ) ) ( HOIST-AT ?auto_21970 ?auto_21960 ) ( not ( = ?auto_21971 ?auto_21970 ) ) ( not ( = ?auto_21963 ?auto_21970 ) ) ( not ( = ?auto_21964 ?auto_21970 ) ) ( AVAILABLE ?auto_21970 ) ( SURFACE-AT ?auto_21965 ?auto_21960 ) ( ON ?auto_21965 ?auto_21959 ) ( CLEAR ?auto_21965 ) ( not ( = ?auto_21955 ?auto_21959 ) ) ( not ( = ?auto_21956 ?auto_21959 ) ) ( not ( = ?auto_21972 ?auto_21959 ) ) ( not ( = ?auto_21957 ?auto_21959 ) ) ( not ( = ?auto_21969 ?auto_21959 ) ) ( not ( = ?auto_21965 ?auto_21959 ) ) ( not ( = ?auto_21961 ?auto_21959 ) ) ( not ( = ?auto_21967 ?auto_21959 ) ) ( TRUCK-AT ?auto_21958 ?auto_21966 ) )
    :subtasks
    ( ( !DRIVE ?auto_21958 ?auto_21966 ?auto_21960 )
      ( MAKE-2CRATE ?auto_21972 ?auto_21955 ?auto_21956 )
      ( MAKE-1CRATE-VERIFY ?auto_21955 ?auto_21956 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21973 - SURFACE
      ?auto_21974 - SURFACE
      ?auto_21975 - SURFACE
    )
    :vars
    (
      ?auto_21986 - HOIST
      ?auto_21989 - PLACE
      ?auto_21987 - PLACE
      ?auto_21982 - HOIST
      ?auto_21978 - SURFACE
      ?auto_21990 - SURFACE
      ?auto_21976 - SURFACE
      ?auto_21977 - PLACE
      ?auto_21988 - HOIST
      ?auto_21979 - SURFACE
      ?auto_21980 - SURFACE
      ?auto_21981 - PLACE
      ?auto_21983 - HOIST
      ?auto_21984 - SURFACE
      ?auto_21985 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21986 ?auto_21989 ) ( IS-CRATE ?auto_21975 ) ( not ( = ?auto_21974 ?auto_21975 ) ) ( not ( = ?auto_21973 ?auto_21974 ) ) ( not ( = ?auto_21973 ?auto_21975 ) ) ( not ( = ?auto_21987 ?auto_21989 ) ) ( HOIST-AT ?auto_21982 ?auto_21987 ) ( not ( = ?auto_21986 ?auto_21982 ) ) ( SURFACE-AT ?auto_21975 ?auto_21987 ) ( ON ?auto_21975 ?auto_21978 ) ( CLEAR ?auto_21975 ) ( not ( = ?auto_21974 ?auto_21978 ) ) ( not ( = ?auto_21975 ?auto_21978 ) ) ( not ( = ?auto_21973 ?auto_21978 ) ) ( IS-CRATE ?auto_21974 ) ( AVAILABLE ?auto_21982 ) ( SURFACE-AT ?auto_21974 ?auto_21987 ) ( ON ?auto_21974 ?auto_21990 ) ( CLEAR ?auto_21974 ) ( not ( = ?auto_21974 ?auto_21990 ) ) ( not ( = ?auto_21975 ?auto_21990 ) ) ( not ( = ?auto_21973 ?auto_21990 ) ) ( not ( = ?auto_21978 ?auto_21990 ) ) ( IS-CRATE ?auto_21973 ) ( not ( = ?auto_21976 ?auto_21973 ) ) ( not ( = ?auto_21974 ?auto_21976 ) ) ( not ( = ?auto_21975 ?auto_21976 ) ) ( not ( = ?auto_21978 ?auto_21976 ) ) ( not ( = ?auto_21990 ?auto_21976 ) ) ( not ( = ?auto_21977 ?auto_21989 ) ) ( not ( = ?auto_21987 ?auto_21977 ) ) ( HOIST-AT ?auto_21988 ?auto_21977 ) ( not ( = ?auto_21986 ?auto_21988 ) ) ( not ( = ?auto_21982 ?auto_21988 ) ) ( AVAILABLE ?auto_21988 ) ( SURFACE-AT ?auto_21973 ?auto_21977 ) ( ON ?auto_21973 ?auto_21979 ) ( CLEAR ?auto_21973 ) ( not ( = ?auto_21974 ?auto_21979 ) ) ( not ( = ?auto_21975 ?auto_21979 ) ) ( not ( = ?auto_21973 ?auto_21979 ) ) ( not ( = ?auto_21978 ?auto_21979 ) ) ( not ( = ?auto_21990 ?auto_21979 ) ) ( not ( = ?auto_21976 ?auto_21979 ) ) ( SURFACE-AT ?auto_21980 ?auto_21989 ) ( CLEAR ?auto_21980 ) ( IS-CRATE ?auto_21976 ) ( not ( = ?auto_21980 ?auto_21976 ) ) ( not ( = ?auto_21974 ?auto_21980 ) ) ( not ( = ?auto_21975 ?auto_21980 ) ) ( not ( = ?auto_21973 ?auto_21980 ) ) ( not ( = ?auto_21978 ?auto_21980 ) ) ( not ( = ?auto_21990 ?auto_21980 ) ) ( not ( = ?auto_21979 ?auto_21980 ) ) ( AVAILABLE ?auto_21986 ) ( not ( = ?auto_21981 ?auto_21989 ) ) ( not ( = ?auto_21987 ?auto_21981 ) ) ( not ( = ?auto_21977 ?auto_21981 ) ) ( HOIST-AT ?auto_21983 ?auto_21981 ) ( not ( = ?auto_21986 ?auto_21983 ) ) ( not ( = ?auto_21982 ?auto_21983 ) ) ( not ( = ?auto_21988 ?auto_21983 ) ) ( AVAILABLE ?auto_21983 ) ( SURFACE-AT ?auto_21976 ?auto_21981 ) ( ON ?auto_21976 ?auto_21984 ) ( CLEAR ?auto_21976 ) ( not ( = ?auto_21974 ?auto_21984 ) ) ( not ( = ?auto_21975 ?auto_21984 ) ) ( not ( = ?auto_21973 ?auto_21984 ) ) ( not ( = ?auto_21978 ?auto_21984 ) ) ( not ( = ?auto_21990 ?auto_21984 ) ) ( not ( = ?auto_21976 ?auto_21984 ) ) ( not ( = ?auto_21979 ?auto_21984 ) ) ( not ( = ?auto_21980 ?auto_21984 ) ) ( TRUCK-AT ?auto_21985 ?auto_21989 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21974 ?auto_21975 )
      ( MAKE-2CRATE-VERIFY ?auto_21973 ?auto_21974 ?auto_21975 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21991 - SURFACE
      ?auto_21992 - SURFACE
      ?auto_21993 - SURFACE
      ?auto_21994 - SURFACE
    )
    :vars
    (
      ?auto_21998 - HOIST
      ?auto_21999 - PLACE
      ?auto_22000 - PLACE
      ?auto_22005 - HOIST
      ?auto_22006 - SURFACE
      ?auto_21995 - SURFACE
      ?auto_22001 - PLACE
      ?auto_21997 - HOIST
      ?auto_22004 - SURFACE
      ?auto_22007 - SURFACE
      ?auto_22003 - PLACE
      ?auto_22002 - HOIST
      ?auto_22008 - SURFACE
      ?auto_21996 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21998 ?auto_21999 ) ( IS-CRATE ?auto_21994 ) ( not ( = ?auto_21993 ?auto_21994 ) ) ( not ( = ?auto_21992 ?auto_21993 ) ) ( not ( = ?auto_21992 ?auto_21994 ) ) ( not ( = ?auto_22000 ?auto_21999 ) ) ( HOIST-AT ?auto_22005 ?auto_22000 ) ( not ( = ?auto_21998 ?auto_22005 ) ) ( SURFACE-AT ?auto_21994 ?auto_22000 ) ( ON ?auto_21994 ?auto_22006 ) ( CLEAR ?auto_21994 ) ( not ( = ?auto_21993 ?auto_22006 ) ) ( not ( = ?auto_21994 ?auto_22006 ) ) ( not ( = ?auto_21992 ?auto_22006 ) ) ( IS-CRATE ?auto_21993 ) ( AVAILABLE ?auto_22005 ) ( SURFACE-AT ?auto_21993 ?auto_22000 ) ( ON ?auto_21993 ?auto_21995 ) ( CLEAR ?auto_21993 ) ( not ( = ?auto_21993 ?auto_21995 ) ) ( not ( = ?auto_21994 ?auto_21995 ) ) ( not ( = ?auto_21992 ?auto_21995 ) ) ( not ( = ?auto_22006 ?auto_21995 ) ) ( IS-CRATE ?auto_21992 ) ( not ( = ?auto_21991 ?auto_21992 ) ) ( not ( = ?auto_21993 ?auto_21991 ) ) ( not ( = ?auto_21994 ?auto_21991 ) ) ( not ( = ?auto_22006 ?auto_21991 ) ) ( not ( = ?auto_21995 ?auto_21991 ) ) ( not ( = ?auto_22001 ?auto_21999 ) ) ( not ( = ?auto_22000 ?auto_22001 ) ) ( HOIST-AT ?auto_21997 ?auto_22001 ) ( not ( = ?auto_21998 ?auto_21997 ) ) ( not ( = ?auto_22005 ?auto_21997 ) ) ( AVAILABLE ?auto_21997 ) ( SURFACE-AT ?auto_21992 ?auto_22001 ) ( ON ?auto_21992 ?auto_22004 ) ( CLEAR ?auto_21992 ) ( not ( = ?auto_21993 ?auto_22004 ) ) ( not ( = ?auto_21994 ?auto_22004 ) ) ( not ( = ?auto_21992 ?auto_22004 ) ) ( not ( = ?auto_22006 ?auto_22004 ) ) ( not ( = ?auto_21995 ?auto_22004 ) ) ( not ( = ?auto_21991 ?auto_22004 ) ) ( SURFACE-AT ?auto_22007 ?auto_21999 ) ( CLEAR ?auto_22007 ) ( IS-CRATE ?auto_21991 ) ( not ( = ?auto_22007 ?auto_21991 ) ) ( not ( = ?auto_21993 ?auto_22007 ) ) ( not ( = ?auto_21994 ?auto_22007 ) ) ( not ( = ?auto_21992 ?auto_22007 ) ) ( not ( = ?auto_22006 ?auto_22007 ) ) ( not ( = ?auto_21995 ?auto_22007 ) ) ( not ( = ?auto_22004 ?auto_22007 ) ) ( AVAILABLE ?auto_21998 ) ( not ( = ?auto_22003 ?auto_21999 ) ) ( not ( = ?auto_22000 ?auto_22003 ) ) ( not ( = ?auto_22001 ?auto_22003 ) ) ( HOIST-AT ?auto_22002 ?auto_22003 ) ( not ( = ?auto_21998 ?auto_22002 ) ) ( not ( = ?auto_22005 ?auto_22002 ) ) ( not ( = ?auto_21997 ?auto_22002 ) ) ( AVAILABLE ?auto_22002 ) ( SURFACE-AT ?auto_21991 ?auto_22003 ) ( ON ?auto_21991 ?auto_22008 ) ( CLEAR ?auto_21991 ) ( not ( = ?auto_21993 ?auto_22008 ) ) ( not ( = ?auto_21994 ?auto_22008 ) ) ( not ( = ?auto_21992 ?auto_22008 ) ) ( not ( = ?auto_22006 ?auto_22008 ) ) ( not ( = ?auto_21995 ?auto_22008 ) ) ( not ( = ?auto_21991 ?auto_22008 ) ) ( not ( = ?auto_22004 ?auto_22008 ) ) ( not ( = ?auto_22007 ?auto_22008 ) ) ( TRUCK-AT ?auto_21996 ?auto_21999 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21992 ?auto_21993 ?auto_21994 )
      ( MAKE-3CRATE-VERIFY ?auto_21991 ?auto_21992 ?auto_21993 ?auto_21994 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22009 - SURFACE
      ?auto_22010 - SURFACE
      ?auto_22011 - SURFACE
      ?auto_22012 - SURFACE
      ?auto_22013 - SURFACE
    )
    :vars
    (
      ?auto_22017 - HOIST
      ?auto_22018 - PLACE
      ?auto_22019 - PLACE
      ?auto_22024 - HOIST
      ?auto_22025 - SURFACE
      ?auto_22014 - SURFACE
      ?auto_22020 - PLACE
      ?auto_22016 - HOIST
      ?auto_22023 - SURFACE
      ?auto_22022 - PLACE
      ?auto_22021 - HOIST
      ?auto_22026 - SURFACE
      ?auto_22015 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22017 ?auto_22018 ) ( IS-CRATE ?auto_22013 ) ( not ( = ?auto_22012 ?auto_22013 ) ) ( not ( = ?auto_22011 ?auto_22012 ) ) ( not ( = ?auto_22011 ?auto_22013 ) ) ( not ( = ?auto_22019 ?auto_22018 ) ) ( HOIST-AT ?auto_22024 ?auto_22019 ) ( not ( = ?auto_22017 ?auto_22024 ) ) ( SURFACE-AT ?auto_22013 ?auto_22019 ) ( ON ?auto_22013 ?auto_22025 ) ( CLEAR ?auto_22013 ) ( not ( = ?auto_22012 ?auto_22025 ) ) ( not ( = ?auto_22013 ?auto_22025 ) ) ( not ( = ?auto_22011 ?auto_22025 ) ) ( IS-CRATE ?auto_22012 ) ( AVAILABLE ?auto_22024 ) ( SURFACE-AT ?auto_22012 ?auto_22019 ) ( ON ?auto_22012 ?auto_22014 ) ( CLEAR ?auto_22012 ) ( not ( = ?auto_22012 ?auto_22014 ) ) ( not ( = ?auto_22013 ?auto_22014 ) ) ( not ( = ?auto_22011 ?auto_22014 ) ) ( not ( = ?auto_22025 ?auto_22014 ) ) ( IS-CRATE ?auto_22011 ) ( not ( = ?auto_22010 ?auto_22011 ) ) ( not ( = ?auto_22012 ?auto_22010 ) ) ( not ( = ?auto_22013 ?auto_22010 ) ) ( not ( = ?auto_22025 ?auto_22010 ) ) ( not ( = ?auto_22014 ?auto_22010 ) ) ( not ( = ?auto_22020 ?auto_22018 ) ) ( not ( = ?auto_22019 ?auto_22020 ) ) ( HOIST-AT ?auto_22016 ?auto_22020 ) ( not ( = ?auto_22017 ?auto_22016 ) ) ( not ( = ?auto_22024 ?auto_22016 ) ) ( AVAILABLE ?auto_22016 ) ( SURFACE-AT ?auto_22011 ?auto_22020 ) ( ON ?auto_22011 ?auto_22023 ) ( CLEAR ?auto_22011 ) ( not ( = ?auto_22012 ?auto_22023 ) ) ( not ( = ?auto_22013 ?auto_22023 ) ) ( not ( = ?auto_22011 ?auto_22023 ) ) ( not ( = ?auto_22025 ?auto_22023 ) ) ( not ( = ?auto_22014 ?auto_22023 ) ) ( not ( = ?auto_22010 ?auto_22023 ) ) ( SURFACE-AT ?auto_22009 ?auto_22018 ) ( CLEAR ?auto_22009 ) ( IS-CRATE ?auto_22010 ) ( not ( = ?auto_22009 ?auto_22010 ) ) ( not ( = ?auto_22012 ?auto_22009 ) ) ( not ( = ?auto_22013 ?auto_22009 ) ) ( not ( = ?auto_22011 ?auto_22009 ) ) ( not ( = ?auto_22025 ?auto_22009 ) ) ( not ( = ?auto_22014 ?auto_22009 ) ) ( not ( = ?auto_22023 ?auto_22009 ) ) ( AVAILABLE ?auto_22017 ) ( not ( = ?auto_22022 ?auto_22018 ) ) ( not ( = ?auto_22019 ?auto_22022 ) ) ( not ( = ?auto_22020 ?auto_22022 ) ) ( HOIST-AT ?auto_22021 ?auto_22022 ) ( not ( = ?auto_22017 ?auto_22021 ) ) ( not ( = ?auto_22024 ?auto_22021 ) ) ( not ( = ?auto_22016 ?auto_22021 ) ) ( AVAILABLE ?auto_22021 ) ( SURFACE-AT ?auto_22010 ?auto_22022 ) ( ON ?auto_22010 ?auto_22026 ) ( CLEAR ?auto_22010 ) ( not ( = ?auto_22012 ?auto_22026 ) ) ( not ( = ?auto_22013 ?auto_22026 ) ) ( not ( = ?auto_22011 ?auto_22026 ) ) ( not ( = ?auto_22025 ?auto_22026 ) ) ( not ( = ?auto_22014 ?auto_22026 ) ) ( not ( = ?auto_22010 ?auto_22026 ) ) ( not ( = ?auto_22023 ?auto_22026 ) ) ( not ( = ?auto_22009 ?auto_22026 ) ) ( TRUCK-AT ?auto_22015 ?auto_22018 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22011 ?auto_22012 ?auto_22013 )
      ( MAKE-4CRATE-VERIFY ?auto_22009 ?auto_22010 ?auto_22011 ?auto_22012 ?auto_22013 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22047 - SURFACE
      ?auto_22048 - SURFACE
    )
    :vars
    (
      ?auto_22049 - HOIST
      ?auto_22050 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22049 ?auto_22050 ) ( SURFACE-AT ?auto_22047 ?auto_22050 ) ( CLEAR ?auto_22047 ) ( LIFTING ?auto_22049 ?auto_22048 ) ( IS-CRATE ?auto_22048 ) ( not ( = ?auto_22047 ?auto_22048 ) ) )
    :subtasks
    ( ( !DROP ?auto_22049 ?auto_22048 ?auto_22047 ?auto_22050 )
      ( MAKE-1CRATE-VERIFY ?auto_22047 ?auto_22048 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22051 - SURFACE
      ?auto_22052 - SURFACE
      ?auto_22053 - SURFACE
    )
    :vars
    (
      ?auto_22055 - HOIST
      ?auto_22054 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22055 ?auto_22054 ) ( SURFACE-AT ?auto_22052 ?auto_22054 ) ( CLEAR ?auto_22052 ) ( LIFTING ?auto_22055 ?auto_22053 ) ( IS-CRATE ?auto_22053 ) ( not ( = ?auto_22052 ?auto_22053 ) ) ( ON ?auto_22052 ?auto_22051 ) ( not ( = ?auto_22051 ?auto_22052 ) ) ( not ( = ?auto_22051 ?auto_22053 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22052 ?auto_22053 )
      ( MAKE-2CRATE-VERIFY ?auto_22051 ?auto_22052 ?auto_22053 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22056 - SURFACE
      ?auto_22057 - SURFACE
      ?auto_22058 - SURFACE
      ?auto_22059 - SURFACE
    )
    :vars
    (
      ?auto_22061 - HOIST
      ?auto_22060 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22061 ?auto_22060 ) ( SURFACE-AT ?auto_22058 ?auto_22060 ) ( CLEAR ?auto_22058 ) ( LIFTING ?auto_22061 ?auto_22059 ) ( IS-CRATE ?auto_22059 ) ( not ( = ?auto_22058 ?auto_22059 ) ) ( ON ?auto_22057 ?auto_22056 ) ( ON ?auto_22058 ?auto_22057 ) ( not ( = ?auto_22056 ?auto_22057 ) ) ( not ( = ?auto_22056 ?auto_22058 ) ) ( not ( = ?auto_22056 ?auto_22059 ) ) ( not ( = ?auto_22057 ?auto_22058 ) ) ( not ( = ?auto_22057 ?auto_22059 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22058 ?auto_22059 )
      ( MAKE-3CRATE-VERIFY ?auto_22056 ?auto_22057 ?auto_22058 ?auto_22059 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22062 - SURFACE
      ?auto_22063 - SURFACE
      ?auto_22064 - SURFACE
      ?auto_22065 - SURFACE
      ?auto_22066 - SURFACE
    )
    :vars
    (
      ?auto_22068 - HOIST
      ?auto_22067 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22068 ?auto_22067 ) ( SURFACE-AT ?auto_22065 ?auto_22067 ) ( CLEAR ?auto_22065 ) ( LIFTING ?auto_22068 ?auto_22066 ) ( IS-CRATE ?auto_22066 ) ( not ( = ?auto_22065 ?auto_22066 ) ) ( ON ?auto_22063 ?auto_22062 ) ( ON ?auto_22064 ?auto_22063 ) ( ON ?auto_22065 ?auto_22064 ) ( not ( = ?auto_22062 ?auto_22063 ) ) ( not ( = ?auto_22062 ?auto_22064 ) ) ( not ( = ?auto_22062 ?auto_22065 ) ) ( not ( = ?auto_22062 ?auto_22066 ) ) ( not ( = ?auto_22063 ?auto_22064 ) ) ( not ( = ?auto_22063 ?auto_22065 ) ) ( not ( = ?auto_22063 ?auto_22066 ) ) ( not ( = ?auto_22064 ?auto_22065 ) ) ( not ( = ?auto_22064 ?auto_22066 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22065 ?auto_22066 )
      ( MAKE-4CRATE-VERIFY ?auto_22062 ?auto_22063 ?auto_22064 ?auto_22065 ?auto_22066 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22069 - SURFACE
      ?auto_22070 - SURFACE
      ?auto_22071 - SURFACE
      ?auto_22072 - SURFACE
      ?auto_22073 - SURFACE
      ?auto_22074 - SURFACE
    )
    :vars
    (
      ?auto_22076 - HOIST
      ?auto_22075 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22076 ?auto_22075 ) ( SURFACE-AT ?auto_22073 ?auto_22075 ) ( CLEAR ?auto_22073 ) ( LIFTING ?auto_22076 ?auto_22074 ) ( IS-CRATE ?auto_22074 ) ( not ( = ?auto_22073 ?auto_22074 ) ) ( ON ?auto_22070 ?auto_22069 ) ( ON ?auto_22071 ?auto_22070 ) ( ON ?auto_22072 ?auto_22071 ) ( ON ?auto_22073 ?auto_22072 ) ( not ( = ?auto_22069 ?auto_22070 ) ) ( not ( = ?auto_22069 ?auto_22071 ) ) ( not ( = ?auto_22069 ?auto_22072 ) ) ( not ( = ?auto_22069 ?auto_22073 ) ) ( not ( = ?auto_22069 ?auto_22074 ) ) ( not ( = ?auto_22070 ?auto_22071 ) ) ( not ( = ?auto_22070 ?auto_22072 ) ) ( not ( = ?auto_22070 ?auto_22073 ) ) ( not ( = ?auto_22070 ?auto_22074 ) ) ( not ( = ?auto_22071 ?auto_22072 ) ) ( not ( = ?auto_22071 ?auto_22073 ) ) ( not ( = ?auto_22071 ?auto_22074 ) ) ( not ( = ?auto_22072 ?auto_22073 ) ) ( not ( = ?auto_22072 ?auto_22074 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22073 ?auto_22074 )
      ( MAKE-5CRATE-VERIFY ?auto_22069 ?auto_22070 ?auto_22071 ?auto_22072 ?auto_22073 ?auto_22074 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22077 - SURFACE
      ?auto_22078 - SURFACE
    )
    :vars
    (
      ?auto_22080 - HOIST
      ?auto_22079 - PLACE
      ?auto_22081 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22080 ?auto_22079 ) ( SURFACE-AT ?auto_22077 ?auto_22079 ) ( CLEAR ?auto_22077 ) ( IS-CRATE ?auto_22078 ) ( not ( = ?auto_22077 ?auto_22078 ) ) ( TRUCK-AT ?auto_22081 ?auto_22079 ) ( AVAILABLE ?auto_22080 ) ( IN ?auto_22078 ?auto_22081 ) )
    :subtasks
    ( ( !UNLOAD ?auto_22080 ?auto_22078 ?auto_22081 ?auto_22079 )
      ( MAKE-1CRATE ?auto_22077 ?auto_22078 )
      ( MAKE-1CRATE-VERIFY ?auto_22077 ?auto_22078 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22082 - SURFACE
      ?auto_22083 - SURFACE
      ?auto_22084 - SURFACE
    )
    :vars
    (
      ?auto_22085 - HOIST
      ?auto_22086 - PLACE
      ?auto_22087 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22085 ?auto_22086 ) ( SURFACE-AT ?auto_22083 ?auto_22086 ) ( CLEAR ?auto_22083 ) ( IS-CRATE ?auto_22084 ) ( not ( = ?auto_22083 ?auto_22084 ) ) ( TRUCK-AT ?auto_22087 ?auto_22086 ) ( AVAILABLE ?auto_22085 ) ( IN ?auto_22084 ?auto_22087 ) ( ON ?auto_22083 ?auto_22082 ) ( not ( = ?auto_22082 ?auto_22083 ) ) ( not ( = ?auto_22082 ?auto_22084 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22083 ?auto_22084 )
      ( MAKE-2CRATE-VERIFY ?auto_22082 ?auto_22083 ?auto_22084 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22088 - SURFACE
      ?auto_22089 - SURFACE
      ?auto_22090 - SURFACE
      ?auto_22091 - SURFACE
    )
    :vars
    (
      ?auto_22092 - HOIST
      ?auto_22093 - PLACE
      ?auto_22094 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22092 ?auto_22093 ) ( SURFACE-AT ?auto_22090 ?auto_22093 ) ( CLEAR ?auto_22090 ) ( IS-CRATE ?auto_22091 ) ( not ( = ?auto_22090 ?auto_22091 ) ) ( TRUCK-AT ?auto_22094 ?auto_22093 ) ( AVAILABLE ?auto_22092 ) ( IN ?auto_22091 ?auto_22094 ) ( ON ?auto_22090 ?auto_22089 ) ( not ( = ?auto_22089 ?auto_22090 ) ) ( not ( = ?auto_22089 ?auto_22091 ) ) ( ON ?auto_22089 ?auto_22088 ) ( not ( = ?auto_22088 ?auto_22089 ) ) ( not ( = ?auto_22088 ?auto_22090 ) ) ( not ( = ?auto_22088 ?auto_22091 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22089 ?auto_22090 ?auto_22091 )
      ( MAKE-3CRATE-VERIFY ?auto_22088 ?auto_22089 ?auto_22090 ?auto_22091 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22095 - SURFACE
      ?auto_22096 - SURFACE
      ?auto_22097 - SURFACE
      ?auto_22098 - SURFACE
      ?auto_22099 - SURFACE
    )
    :vars
    (
      ?auto_22100 - HOIST
      ?auto_22101 - PLACE
      ?auto_22102 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22100 ?auto_22101 ) ( SURFACE-AT ?auto_22098 ?auto_22101 ) ( CLEAR ?auto_22098 ) ( IS-CRATE ?auto_22099 ) ( not ( = ?auto_22098 ?auto_22099 ) ) ( TRUCK-AT ?auto_22102 ?auto_22101 ) ( AVAILABLE ?auto_22100 ) ( IN ?auto_22099 ?auto_22102 ) ( ON ?auto_22098 ?auto_22097 ) ( not ( = ?auto_22097 ?auto_22098 ) ) ( not ( = ?auto_22097 ?auto_22099 ) ) ( ON ?auto_22096 ?auto_22095 ) ( ON ?auto_22097 ?auto_22096 ) ( not ( = ?auto_22095 ?auto_22096 ) ) ( not ( = ?auto_22095 ?auto_22097 ) ) ( not ( = ?auto_22095 ?auto_22098 ) ) ( not ( = ?auto_22095 ?auto_22099 ) ) ( not ( = ?auto_22096 ?auto_22097 ) ) ( not ( = ?auto_22096 ?auto_22098 ) ) ( not ( = ?auto_22096 ?auto_22099 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22097 ?auto_22098 ?auto_22099 )
      ( MAKE-4CRATE-VERIFY ?auto_22095 ?auto_22096 ?auto_22097 ?auto_22098 ?auto_22099 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22103 - SURFACE
      ?auto_22104 - SURFACE
      ?auto_22105 - SURFACE
      ?auto_22106 - SURFACE
      ?auto_22107 - SURFACE
      ?auto_22108 - SURFACE
    )
    :vars
    (
      ?auto_22109 - HOIST
      ?auto_22110 - PLACE
      ?auto_22111 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22109 ?auto_22110 ) ( SURFACE-AT ?auto_22107 ?auto_22110 ) ( CLEAR ?auto_22107 ) ( IS-CRATE ?auto_22108 ) ( not ( = ?auto_22107 ?auto_22108 ) ) ( TRUCK-AT ?auto_22111 ?auto_22110 ) ( AVAILABLE ?auto_22109 ) ( IN ?auto_22108 ?auto_22111 ) ( ON ?auto_22107 ?auto_22106 ) ( not ( = ?auto_22106 ?auto_22107 ) ) ( not ( = ?auto_22106 ?auto_22108 ) ) ( ON ?auto_22104 ?auto_22103 ) ( ON ?auto_22105 ?auto_22104 ) ( ON ?auto_22106 ?auto_22105 ) ( not ( = ?auto_22103 ?auto_22104 ) ) ( not ( = ?auto_22103 ?auto_22105 ) ) ( not ( = ?auto_22103 ?auto_22106 ) ) ( not ( = ?auto_22103 ?auto_22107 ) ) ( not ( = ?auto_22103 ?auto_22108 ) ) ( not ( = ?auto_22104 ?auto_22105 ) ) ( not ( = ?auto_22104 ?auto_22106 ) ) ( not ( = ?auto_22104 ?auto_22107 ) ) ( not ( = ?auto_22104 ?auto_22108 ) ) ( not ( = ?auto_22105 ?auto_22106 ) ) ( not ( = ?auto_22105 ?auto_22107 ) ) ( not ( = ?auto_22105 ?auto_22108 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22106 ?auto_22107 ?auto_22108 )
      ( MAKE-5CRATE-VERIFY ?auto_22103 ?auto_22104 ?auto_22105 ?auto_22106 ?auto_22107 ?auto_22108 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22112 - SURFACE
      ?auto_22113 - SURFACE
    )
    :vars
    (
      ?auto_22114 - HOIST
      ?auto_22116 - PLACE
      ?auto_22117 - TRUCK
      ?auto_22115 - SURFACE
      ?auto_22118 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22114 ?auto_22116 ) ( SURFACE-AT ?auto_22112 ?auto_22116 ) ( CLEAR ?auto_22112 ) ( IS-CRATE ?auto_22113 ) ( not ( = ?auto_22112 ?auto_22113 ) ) ( AVAILABLE ?auto_22114 ) ( IN ?auto_22113 ?auto_22117 ) ( ON ?auto_22112 ?auto_22115 ) ( not ( = ?auto_22115 ?auto_22112 ) ) ( not ( = ?auto_22115 ?auto_22113 ) ) ( TRUCK-AT ?auto_22117 ?auto_22118 ) ( not ( = ?auto_22118 ?auto_22116 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22117 ?auto_22118 ?auto_22116 )
      ( MAKE-2CRATE ?auto_22115 ?auto_22112 ?auto_22113 )
      ( MAKE-1CRATE-VERIFY ?auto_22112 ?auto_22113 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22119 - SURFACE
      ?auto_22120 - SURFACE
      ?auto_22121 - SURFACE
    )
    :vars
    (
      ?auto_22123 - HOIST
      ?auto_22125 - PLACE
      ?auto_22122 - TRUCK
      ?auto_22124 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22123 ?auto_22125 ) ( SURFACE-AT ?auto_22120 ?auto_22125 ) ( CLEAR ?auto_22120 ) ( IS-CRATE ?auto_22121 ) ( not ( = ?auto_22120 ?auto_22121 ) ) ( AVAILABLE ?auto_22123 ) ( IN ?auto_22121 ?auto_22122 ) ( ON ?auto_22120 ?auto_22119 ) ( not ( = ?auto_22119 ?auto_22120 ) ) ( not ( = ?auto_22119 ?auto_22121 ) ) ( TRUCK-AT ?auto_22122 ?auto_22124 ) ( not ( = ?auto_22124 ?auto_22125 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22120 ?auto_22121 )
      ( MAKE-2CRATE-VERIFY ?auto_22119 ?auto_22120 ?auto_22121 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22126 - SURFACE
      ?auto_22127 - SURFACE
      ?auto_22128 - SURFACE
      ?auto_22129 - SURFACE
    )
    :vars
    (
      ?auto_22130 - HOIST
      ?auto_22131 - PLACE
      ?auto_22132 - TRUCK
      ?auto_22133 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22130 ?auto_22131 ) ( SURFACE-AT ?auto_22128 ?auto_22131 ) ( CLEAR ?auto_22128 ) ( IS-CRATE ?auto_22129 ) ( not ( = ?auto_22128 ?auto_22129 ) ) ( AVAILABLE ?auto_22130 ) ( IN ?auto_22129 ?auto_22132 ) ( ON ?auto_22128 ?auto_22127 ) ( not ( = ?auto_22127 ?auto_22128 ) ) ( not ( = ?auto_22127 ?auto_22129 ) ) ( TRUCK-AT ?auto_22132 ?auto_22133 ) ( not ( = ?auto_22133 ?auto_22131 ) ) ( ON ?auto_22127 ?auto_22126 ) ( not ( = ?auto_22126 ?auto_22127 ) ) ( not ( = ?auto_22126 ?auto_22128 ) ) ( not ( = ?auto_22126 ?auto_22129 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22127 ?auto_22128 ?auto_22129 )
      ( MAKE-3CRATE-VERIFY ?auto_22126 ?auto_22127 ?auto_22128 ?auto_22129 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22134 - SURFACE
      ?auto_22135 - SURFACE
      ?auto_22136 - SURFACE
      ?auto_22137 - SURFACE
      ?auto_22138 - SURFACE
    )
    :vars
    (
      ?auto_22139 - HOIST
      ?auto_22140 - PLACE
      ?auto_22141 - TRUCK
      ?auto_22142 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22139 ?auto_22140 ) ( SURFACE-AT ?auto_22137 ?auto_22140 ) ( CLEAR ?auto_22137 ) ( IS-CRATE ?auto_22138 ) ( not ( = ?auto_22137 ?auto_22138 ) ) ( AVAILABLE ?auto_22139 ) ( IN ?auto_22138 ?auto_22141 ) ( ON ?auto_22137 ?auto_22136 ) ( not ( = ?auto_22136 ?auto_22137 ) ) ( not ( = ?auto_22136 ?auto_22138 ) ) ( TRUCK-AT ?auto_22141 ?auto_22142 ) ( not ( = ?auto_22142 ?auto_22140 ) ) ( ON ?auto_22135 ?auto_22134 ) ( ON ?auto_22136 ?auto_22135 ) ( not ( = ?auto_22134 ?auto_22135 ) ) ( not ( = ?auto_22134 ?auto_22136 ) ) ( not ( = ?auto_22134 ?auto_22137 ) ) ( not ( = ?auto_22134 ?auto_22138 ) ) ( not ( = ?auto_22135 ?auto_22136 ) ) ( not ( = ?auto_22135 ?auto_22137 ) ) ( not ( = ?auto_22135 ?auto_22138 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22136 ?auto_22137 ?auto_22138 )
      ( MAKE-4CRATE-VERIFY ?auto_22134 ?auto_22135 ?auto_22136 ?auto_22137 ?auto_22138 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22143 - SURFACE
      ?auto_22144 - SURFACE
      ?auto_22145 - SURFACE
      ?auto_22146 - SURFACE
      ?auto_22147 - SURFACE
      ?auto_22148 - SURFACE
    )
    :vars
    (
      ?auto_22149 - HOIST
      ?auto_22150 - PLACE
      ?auto_22151 - TRUCK
      ?auto_22152 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22149 ?auto_22150 ) ( SURFACE-AT ?auto_22147 ?auto_22150 ) ( CLEAR ?auto_22147 ) ( IS-CRATE ?auto_22148 ) ( not ( = ?auto_22147 ?auto_22148 ) ) ( AVAILABLE ?auto_22149 ) ( IN ?auto_22148 ?auto_22151 ) ( ON ?auto_22147 ?auto_22146 ) ( not ( = ?auto_22146 ?auto_22147 ) ) ( not ( = ?auto_22146 ?auto_22148 ) ) ( TRUCK-AT ?auto_22151 ?auto_22152 ) ( not ( = ?auto_22152 ?auto_22150 ) ) ( ON ?auto_22144 ?auto_22143 ) ( ON ?auto_22145 ?auto_22144 ) ( ON ?auto_22146 ?auto_22145 ) ( not ( = ?auto_22143 ?auto_22144 ) ) ( not ( = ?auto_22143 ?auto_22145 ) ) ( not ( = ?auto_22143 ?auto_22146 ) ) ( not ( = ?auto_22143 ?auto_22147 ) ) ( not ( = ?auto_22143 ?auto_22148 ) ) ( not ( = ?auto_22144 ?auto_22145 ) ) ( not ( = ?auto_22144 ?auto_22146 ) ) ( not ( = ?auto_22144 ?auto_22147 ) ) ( not ( = ?auto_22144 ?auto_22148 ) ) ( not ( = ?auto_22145 ?auto_22146 ) ) ( not ( = ?auto_22145 ?auto_22147 ) ) ( not ( = ?auto_22145 ?auto_22148 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22146 ?auto_22147 ?auto_22148 )
      ( MAKE-5CRATE-VERIFY ?auto_22143 ?auto_22144 ?auto_22145 ?auto_22146 ?auto_22147 ?auto_22148 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22153 - SURFACE
      ?auto_22154 - SURFACE
    )
    :vars
    (
      ?auto_22155 - HOIST
      ?auto_22156 - PLACE
      ?auto_22159 - SURFACE
      ?auto_22157 - TRUCK
      ?auto_22158 - PLACE
      ?auto_22160 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22155 ?auto_22156 ) ( SURFACE-AT ?auto_22153 ?auto_22156 ) ( CLEAR ?auto_22153 ) ( IS-CRATE ?auto_22154 ) ( not ( = ?auto_22153 ?auto_22154 ) ) ( AVAILABLE ?auto_22155 ) ( ON ?auto_22153 ?auto_22159 ) ( not ( = ?auto_22159 ?auto_22153 ) ) ( not ( = ?auto_22159 ?auto_22154 ) ) ( TRUCK-AT ?auto_22157 ?auto_22158 ) ( not ( = ?auto_22158 ?auto_22156 ) ) ( HOIST-AT ?auto_22160 ?auto_22158 ) ( LIFTING ?auto_22160 ?auto_22154 ) ( not ( = ?auto_22155 ?auto_22160 ) ) )
    :subtasks
    ( ( !LOAD ?auto_22160 ?auto_22154 ?auto_22157 ?auto_22158 )
      ( MAKE-2CRATE ?auto_22159 ?auto_22153 ?auto_22154 )
      ( MAKE-1CRATE-VERIFY ?auto_22153 ?auto_22154 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22161 - SURFACE
      ?auto_22162 - SURFACE
      ?auto_22163 - SURFACE
    )
    :vars
    (
      ?auto_22165 - HOIST
      ?auto_22166 - PLACE
      ?auto_22164 - TRUCK
      ?auto_22167 - PLACE
      ?auto_22168 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22165 ?auto_22166 ) ( SURFACE-AT ?auto_22162 ?auto_22166 ) ( CLEAR ?auto_22162 ) ( IS-CRATE ?auto_22163 ) ( not ( = ?auto_22162 ?auto_22163 ) ) ( AVAILABLE ?auto_22165 ) ( ON ?auto_22162 ?auto_22161 ) ( not ( = ?auto_22161 ?auto_22162 ) ) ( not ( = ?auto_22161 ?auto_22163 ) ) ( TRUCK-AT ?auto_22164 ?auto_22167 ) ( not ( = ?auto_22167 ?auto_22166 ) ) ( HOIST-AT ?auto_22168 ?auto_22167 ) ( LIFTING ?auto_22168 ?auto_22163 ) ( not ( = ?auto_22165 ?auto_22168 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22162 ?auto_22163 )
      ( MAKE-2CRATE-VERIFY ?auto_22161 ?auto_22162 ?auto_22163 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22169 - SURFACE
      ?auto_22170 - SURFACE
      ?auto_22171 - SURFACE
      ?auto_22172 - SURFACE
    )
    :vars
    (
      ?auto_22175 - HOIST
      ?auto_22173 - PLACE
      ?auto_22174 - TRUCK
      ?auto_22176 - PLACE
      ?auto_22177 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22175 ?auto_22173 ) ( SURFACE-AT ?auto_22171 ?auto_22173 ) ( CLEAR ?auto_22171 ) ( IS-CRATE ?auto_22172 ) ( not ( = ?auto_22171 ?auto_22172 ) ) ( AVAILABLE ?auto_22175 ) ( ON ?auto_22171 ?auto_22170 ) ( not ( = ?auto_22170 ?auto_22171 ) ) ( not ( = ?auto_22170 ?auto_22172 ) ) ( TRUCK-AT ?auto_22174 ?auto_22176 ) ( not ( = ?auto_22176 ?auto_22173 ) ) ( HOIST-AT ?auto_22177 ?auto_22176 ) ( LIFTING ?auto_22177 ?auto_22172 ) ( not ( = ?auto_22175 ?auto_22177 ) ) ( ON ?auto_22170 ?auto_22169 ) ( not ( = ?auto_22169 ?auto_22170 ) ) ( not ( = ?auto_22169 ?auto_22171 ) ) ( not ( = ?auto_22169 ?auto_22172 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22170 ?auto_22171 ?auto_22172 )
      ( MAKE-3CRATE-VERIFY ?auto_22169 ?auto_22170 ?auto_22171 ?auto_22172 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22178 - SURFACE
      ?auto_22179 - SURFACE
      ?auto_22180 - SURFACE
      ?auto_22181 - SURFACE
      ?auto_22182 - SURFACE
    )
    :vars
    (
      ?auto_22185 - HOIST
      ?auto_22183 - PLACE
      ?auto_22184 - TRUCK
      ?auto_22186 - PLACE
      ?auto_22187 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22185 ?auto_22183 ) ( SURFACE-AT ?auto_22181 ?auto_22183 ) ( CLEAR ?auto_22181 ) ( IS-CRATE ?auto_22182 ) ( not ( = ?auto_22181 ?auto_22182 ) ) ( AVAILABLE ?auto_22185 ) ( ON ?auto_22181 ?auto_22180 ) ( not ( = ?auto_22180 ?auto_22181 ) ) ( not ( = ?auto_22180 ?auto_22182 ) ) ( TRUCK-AT ?auto_22184 ?auto_22186 ) ( not ( = ?auto_22186 ?auto_22183 ) ) ( HOIST-AT ?auto_22187 ?auto_22186 ) ( LIFTING ?auto_22187 ?auto_22182 ) ( not ( = ?auto_22185 ?auto_22187 ) ) ( ON ?auto_22179 ?auto_22178 ) ( ON ?auto_22180 ?auto_22179 ) ( not ( = ?auto_22178 ?auto_22179 ) ) ( not ( = ?auto_22178 ?auto_22180 ) ) ( not ( = ?auto_22178 ?auto_22181 ) ) ( not ( = ?auto_22178 ?auto_22182 ) ) ( not ( = ?auto_22179 ?auto_22180 ) ) ( not ( = ?auto_22179 ?auto_22181 ) ) ( not ( = ?auto_22179 ?auto_22182 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22180 ?auto_22181 ?auto_22182 )
      ( MAKE-4CRATE-VERIFY ?auto_22178 ?auto_22179 ?auto_22180 ?auto_22181 ?auto_22182 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22188 - SURFACE
      ?auto_22189 - SURFACE
      ?auto_22190 - SURFACE
      ?auto_22191 - SURFACE
      ?auto_22192 - SURFACE
      ?auto_22193 - SURFACE
    )
    :vars
    (
      ?auto_22196 - HOIST
      ?auto_22194 - PLACE
      ?auto_22195 - TRUCK
      ?auto_22197 - PLACE
      ?auto_22198 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22196 ?auto_22194 ) ( SURFACE-AT ?auto_22192 ?auto_22194 ) ( CLEAR ?auto_22192 ) ( IS-CRATE ?auto_22193 ) ( not ( = ?auto_22192 ?auto_22193 ) ) ( AVAILABLE ?auto_22196 ) ( ON ?auto_22192 ?auto_22191 ) ( not ( = ?auto_22191 ?auto_22192 ) ) ( not ( = ?auto_22191 ?auto_22193 ) ) ( TRUCK-AT ?auto_22195 ?auto_22197 ) ( not ( = ?auto_22197 ?auto_22194 ) ) ( HOIST-AT ?auto_22198 ?auto_22197 ) ( LIFTING ?auto_22198 ?auto_22193 ) ( not ( = ?auto_22196 ?auto_22198 ) ) ( ON ?auto_22189 ?auto_22188 ) ( ON ?auto_22190 ?auto_22189 ) ( ON ?auto_22191 ?auto_22190 ) ( not ( = ?auto_22188 ?auto_22189 ) ) ( not ( = ?auto_22188 ?auto_22190 ) ) ( not ( = ?auto_22188 ?auto_22191 ) ) ( not ( = ?auto_22188 ?auto_22192 ) ) ( not ( = ?auto_22188 ?auto_22193 ) ) ( not ( = ?auto_22189 ?auto_22190 ) ) ( not ( = ?auto_22189 ?auto_22191 ) ) ( not ( = ?auto_22189 ?auto_22192 ) ) ( not ( = ?auto_22189 ?auto_22193 ) ) ( not ( = ?auto_22190 ?auto_22191 ) ) ( not ( = ?auto_22190 ?auto_22192 ) ) ( not ( = ?auto_22190 ?auto_22193 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22191 ?auto_22192 ?auto_22193 )
      ( MAKE-5CRATE-VERIFY ?auto_22188 ?auto_22189 ?auto_22190 ?auto_22191 ?auto_22192 ?auto_22193 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22199 - SURFACE
      ?auto_22200 - SURFACE
    )
    :vars
    (
      ?auto_22203 - HOIST
      ?auto_22201 - PLACE
      ?auto_22205 - SURFACE
      ?auto_22202 - TRUCK
      ?auto_22204 - PLACE
      ?auto_22206 - HOIST
      ?auto_22207 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22203 ?auto_22201 ) ( SURFACE-AT ?auto_22199 ?auto_22201 ) ( CLEAR ?auto_22199 ) ( IS-CRATE ?auto_22200 ) ( not ( = ?auto_22199 ?auto_22200 ) ) ( AVAILABLE ?auto_22203 ) ( ON ?auto_22199 ?auto_22205 ) ( not ( = ?auto_22205 ?auto_22199 ) ) ( not ( = ?auto_22205 ?auto_22200 ) ) ( TRUCK-AT ?auto_22202 ?auto_22204 ) ( not ( = ?auto_22204 ?auto_22201 ) ) ( HOIST-AT ?auto_22206 ?auto_22204 ) ( not ( = ?auto_22203 ?auto_22206 ) ) ( AVAILABLE ?auto_22206 ) ( SURFACE-AT ?auto_22200 ?auto_22204 ) ( ON ?auto_22200 ?auto_22207 ) ( CLEAR ?auto_22200 ) ( not ( = ?auto_22199 ?auto_22207 ) ) ( not ( = ?auto_22200 ?auto_22207 ) ) ( not ( = ?auto_22205 ?auto_22207 ) ) )
    :subtasks
    ( ( !LIFT ?auto_22206 ?auto_22200 ?auto_22207 ?auto_22204 )
      ( MAKE-2CRATE ?auto_22205 ?auto_22199 ?auto_22200 )
      ( MAKE-1CRATE-VERIFY ?auto_22199 ?auto_22200 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22208 - SURFACE
      ?auto_22209 - SURFACE
      ?auto_22210 - SURFACE
    )
    :vars
    (
      ?auto_22214 - HOIST
      ?auto_22211 - PLACE
      ?auto_22213 - TRUCK
      ?auto_22212 - PLACE
      ?auto_22215 - HOIST
      ?auto_22216 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22214 ?auto_22211 ) ( SURFACE-AT ?auto_22209 ?auto_22211 ) ( CLEAR ?auto_22209 ) ( IS-CRATE ?auto_22210 ) ( not ( = ?auto_22209 ?auto_22210 ) ) ( AVAILABLE ?auto_22214 ) ( ON ?auto_22209 ?auto_22208 ) ( not ( = ?auto_22208 ?auto_22209 ) ) ( not ( = ?auto_22208 ?auto_22210 ) ) ( TRUCK-AT ?auto_22213 ?auto_22212 ) ( not ( = ?auto_22212 ?auto_22211 ) ) ( HOIST-AT ?auto_22215 ?auto_22212 ) ( not ( = ?auto_22214 ?auto_22215 ) ) ( AVAILABLE ?auto_22215 ) ( SURFACE-AT ?auto_22210 ?auto_22212 ) ( ON ?auto_22210 ?auto_22216 ) ( CLEAR ?auto_22210 ) ( not ( = ?auto_22209 ?auto_22216 ) ) ( not ( = ?auto_22210 ?auto_22216 ) ) ( not ( = ?auto_22208 ?auto_22216 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22209 ?auto_22210 )
      ( MAKE-2CRATE-VERIFY ?auto_22208 ?auto_22209 ?auto_22210 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22217 - SURFACE
      ?auto_22218 - SURFACE
      ?auto_22219 - SURFACE
      ?auto_22220 - SURFACE
    )
    :vars
    (
      ?auto_22225 - HOIST
      ?auto_22221 - PLACE
      ?auto_22222 - TRUCK
      ?auto_22226 - PLACE
      ?auto_22224 - HOIST
      ?auto_22223 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22225 ?auto_22221 ) ( SURFACE-AT ?auto_22219 ?auto_22221 ) ( CLEAR ?auto_22219 ) ( IS-CRATE ?auto_22220 ) ( not ( = ?auto_22219 ?auto_22220 ) ) ( AVAILABLE ?auto_22225 ) ( ON ?auto_22219 ?auto_22218 ) ( not ( = ?auto_22218 ?auto_22219 ) ) ( not ( = ?auto_22218 ?auto_22220 ) ) ( TRUCK-AT ?auto_22222 ?auto_22226 ) ( not ( = ?auto_22226 ?auto_22221 ) ) ( HOIST-AT ?auto_22224 ?auto_22226 ) ( not ( = ?auto_22225 ?auto_22224 ) ) ( AVAILABLE ?auto_22224 ) ( SURFACE-AT ?auto_22220 ?auto_22226 ) ( ON ?auto_22220 ?auto_22223 ) ( CLEAR ?auto_22220 ) ( not ( = ?auto_22219 ?auto_22223 ) ) ( not ( = ?auto_22220 ?auto_22223 ) ) ( not ( = ?auto_22218 ?auto_22223 ) ) ( ON ?auto_22218 ?auto_22217 ) ( not ( = ?auto_22217 ?auto_22218 ) ) ( not ( = ?auto_22217 ?auto_22219 ) ) ( not ( = ?auto_22217 ?auto_22220 ) ) ( not ( = ?auto_22217 ?auto_22223 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22218 ?auto_22219 ?auto_22220 )
      ( MAKE-3CRATE-VERIFY ?auto_22217 ?auto_22218 ?auto_22219 ?auto_22220 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22227 - SURFACE
      ?auto_22228 - SURFACE
      ?auto_22229 - SURFACE
      ?auto_22230 - SURFACE
      ?auto_22231 - SURFACE
    )
    :vars
    (
      ?auto_22236 - HOIST
      ?auto_22232 - PLACE
      ?auto_22233 - TRUCK
      ?auto_22237 - PLACE
      ?auto_22235 - HOIST
      ?auto_22234 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22236 ?auto_22232 ) ( SURFACE-AT ?auto_22230 ?auto_22232 ) ( CLEAR ?auto_22230 ) ( IS-CRATE ?auto_22231 ) ( not ( = ?auto_22230 ?auto_22231 ) ) ( AVAILABLE ?auto_22236 ) ( ON ?auto_22230 ?auto_22229 ) ( not ( = ?auto_22229 ?auto_22230 ) ) ( not ( = ?auto_22229 ?auto_22231 ) ) ( TRUCK-AT ?auto_22233 ?auto_22237 ) ( not ( = ?auto_22237 ?auto_22232 ) ) ( HOIST-AT ?auto_22235 ?auto_22237 ) ( not ( = ?auto_22236 ?auto_22235 ) ) ( AVAILABLE ?auto_22235 ) ( SURFACE-AT ?auto_22231 ?auto_22237 ) ( ON ?auto_22231 ?auto_22234 ) ( CLEAR ?auto_22231 ) ( not ( = ?auto_22230 ?auto_22234 ) ) ( not ( = ?auto_22231 ?auto_22234 ) ) ( not ( = ?auto_22229 ?auto_22234 ) ) ( ON ?auto_22228 ?auto_22227 ) ( ON ?auto_22229 ?auto_22228 ) ( not ( = ?auto_22227 ?auto_22228 ) ) ( not ( = ?auto_22227 ?auto_22229 ) ) ( not ( = ?auto_22227 ?auto_22230 ) ) ( not ( = ?auto_22227 ?auto_22231 ) ) ( not ( = ?auto_22227 ?auto_22234 ) ) ( not ( = ?auto_22228 ?auto_22229 ) ) ( not ( = ?auto_22228 ?auto_22230 ) ) ( not ( = ?auto_22228 ?auto_22231 ) ) ( not ( = ?auto_22228 ?auto_22234 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22229 ?auto_22230 ?auto_22231 )
      ( MAKE-4CRATE-VERIFY ?auto_22227 ?auto_22228 ?auto_22229 ?auto_22230 ?auto_22231 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22238 - SURFACE
      ?auto_22239 - SURFACE
      ?auto_22240 - SURFACE
      ?auto_22241 - SURFACE
      ?auto_22242 - SURFACE
      ?auto_22243 - SURFACE
    )
    :vars
    (
      ?auto_22248 - HOIST
      ?auto_22244 - PLACE
      ?auto_22245 - TRUCK
      ?auto_22249 - PLACE
      ?auto_22247 - HOIST
      ?auto_22246 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22248 ?auto_22244 ) ( SURFACE-AT ?auto_22242 ?auto_22244 ) ( CLEAR ?auto_22242 ) ( IS-CRATE ?auto_22243 ) ( not ( = ?auto_22242 ?auto_22243 ) ) ( AVAILABLE ?auto_22248 ) ( ON ?auto_22242 ?auto_22241 ) ( not ( = ?auto_22241 ?auto_22242 ) ) ( not ( = ?auto_22241 ?auto_22243 ) ) ( TRUCK-AT ?auto_22245 ?auto_22249 ) ( not ( = ?auto_22249 ?auto_22244 ) ) ( HOIST-AT ?auto_22247 ?auto_22249 ) ( not ( = ?auto_22248 ?auto_22247 ) ) ( AVAILABLE ?auto_22247 ) ( SURFACE-AT ?auto_22243 ?auto_22249 ) ( ON ?auto_22243 ?auto_22246 ) ( CLEAR ?auto_22243 ) ( not ( = ?auto_22242 ?auto_22246 ) ) ( not ( = ?auto_22243 ?auto_22246 ) ) ( not ( = ?auto_22241 ?auto_22246 ) ) ( ON ?auto_22239 ?auto_22238 ) ( ON ?auto_22240 ?auto_22239 ) ( ON ?auto_22241 ?auto_22240 ) ( not ( = ?auto_22238 ?auto_22239 ) ) ( not ( = ?auto_22238 ?auto_22240 ) ) ( not ( = ?auto_22238 ?auto_22241 ) ) ( not ( = ?auto_22238 ?auto_22242 ) ) ( not ( = ?auto_22238 ?auto_22243 ) ) ( not ( = ?auto_22238 ?auto_22246 ) ) ( not ( = ?auto_22239 ?auto_22240 ) ) ( not ( = ?auto_22239 ?auto_22241 ) ) ( not ( = ?auto_22239 ?auto_22242 ) ) ( not ( = ?auto_22239 ?auto_22243 ) ) ( not ( = ?auto_22239 ?auto_22246 ) ) ( not ( = ?auto_22240 ?auto_22241 ) ) ( not ( = ?auto_22240 ?auto_22242 ) ) ( not ( = ?auto_22240 ?auto_22243 ) ) ( not ( = ?auto_22240 ?auto_22246 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22241 ?auto_22242 ?auto_22243 )
      ( MAKE-5CRATE-VERIFY ?auto_22238 ?auto_22239 ?auto_22240 ?auto_22241 ?auto_22242 ?auto_22243 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22250 - SURFACE
      ?auto_22251 - SURFACE
    )
    :vars
    (
      ?auto_22257 - HOIST
      ?auto_22252 - PLACE
      ?auto_22253 - SURFACE
      ?auto_22258 - PLACE
      ?auto_22256 - HOIST
      ?auto_22255 - SURFACE
      ?auto_22254 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22257 ?auto_22252 ) ( SURFACE-AT ?auto_22250 ?auto_22252 ) ( CLEAR ?auto_22250 ) ( IS-CRATE ?auto_22251 ) ( not ( = ?auto_22250 ?auto_22251 ) ) ( AVAILABLE ?auto_22257 ) ( ON ?auto_22250 ?auto_22253 ) ( not ( = ?auto_22253 ?auto_22250 ) ) ( not ( = ?auto_22253 ?auto_22251 ) ) ( not ( = ?auto_22258 ?auto_22252 ) ) ( HOIST-AT ?auto_22256 ?auto_22258 ) ( not ( = ?auto_22257 ?auto_22256 ) ) ( AVAILABLE ?auto_22256 ) ( SURFACE-AT ?auto_22251 ?auto_22258 ) ( ON ?auto_22251 ?auto_22255 ) ( CLEAR ?auto_22251 ) ( not ( = ?auto_22250 ?auto_22255 ) ) ( not ( = ?auto_22251 ?auto_22255 ) ) ( not ( = ?auto_22253 ?auto_22255 ) ) ( TRUCK-AT ?auto_22254 ?auto_22252 ) )
    :subtasks
    ( ( !DRIVE ?auto_22254 ?auto_22252 ?auto_22258 )
      ( MAKE-2CRATE ?auto_22253 ?auto_22250 ?auto_22251 )
      ( MAKE-1CRATE-VERIFY ?auto_22250 ?auto_22251 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22259 - SURFACE
      ?auto_22260 - SURFACE
      ?auto_22261 - SURFACE
    )
    :vars
    (
      ?auto_22266 - HOIST
      ?auto_22267 - PLACE
      ?auto_22265 - PLACE
      ?auto_22263 - HOIST
      ?auto_22262 - SURFACE
      ?auto_22264 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22266 ?auto_22267 ) ( SURFACE-AT ?auto_22260 ?auto_22267 ) ( CLEAR ?auto_22260 ) ( IS-CRATE ?auto_22261 ) ( not ( = ?auto_22260 ?auto_22261 ) ) ( AVAILABLE ?auto_22266 ) ( ON ?auto_22260 ?auto_22259 ) ( not ( = ?auto_22259 ?auto_22260 ) ) ( not ( = ?auto_22259 ?auto_22261 ) ) ( not ( = ?auto_22265 ?auto_22267 ) ) ( HOIST-AT ?auto_22263 ?auto_22265 ) ( not ( = ?auto_22266 ?auto_22263 ) ) ( AVAILABLE ?auto_22263 ) ( SURFACE-AT ?auto_22261 ?auto_22265 ) ( ON ?auto_22261 ?auto_22262 ) ( CLEAR ?auto_22261 ) ( not ( = ?auto_22260 ?auto_22262 ) ) ( not ( = ?auto_22261 ?auto_22262 ) ) ( not ( = ?auto_22259 ?auto_22262 ) ) ( TRUCK-AT ?auto_22264 ?auto_22267 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22260 ?auto_22261 )
      ( MAKE-2CRATE-VERIFY ?auto_22259 ?auto_22260 ?auto_22261 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22268 - SURFACE
      ?auto_22269 - SURFACE
      ?auto_22270 - SURFACE
      ?auto_22271 - SURFACE
    )
    :vars
    (
      ?auto_22274 - HOIST
      ?auto_22272 - PLACE
      ?auto_22273 - PLACE
      ?auto_22277 - HOIST
      ?auto_22275 - SURFACE
      ?auto_22276 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22274 ?auto_22272 ) ( SURFACE-AT ?auto_22270 ?auto_22272 ) ( CLEAR ?auto_22270 ) ( IS-CRATE ?auto_22271 ) ( not ( = ?auto_22270 ?auto_22271 ) ) ( AVAILABLE ?auto_22274 ) ( ON ?auto_22270 ?auto_22269 ) ( not ( = ?auto_22269 ?auto_22270 ) ) ( not ( = ?auto_22269 ?auto_22271 ) ) ( not ( = ?auto_22273 ?auto_22272 ) ) ( HOIST-AT ?auto_22277 ?auto_22273 ) ( not ( = ?auto_22274 ?auto_22277 ) ) ( AVAILABLE ?auto_22277 ) ( SURFACE-AT ?auto_22271 ?auto_22273 ) ( ON ?auto_22271 ?auto_22275 ) ( CLEAR ?auto_22271 ) ( not ( = ?auto_22270 ?auto_22275 ) ) ( not ( = ?auto_22271 ?auto_22275 ) ) ( not ( = ?auto_22269 ?auto_22275 ) ) ( TRUCK-AT ?auto_22276 ?auto_22272 ) ( ON ?auto_22269 ?auto_22268 ) ( not ( = ?auto_22268 ?auto_22269 ) ) ( not ( = ?auto_22268 ?auto_22270 ) ) ( not ( = ?auto_22268 ?auto_22271 ) ) ( not ( = ?auto_22268 ?auto_22275 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22269 ?auto_22270 ?auto_22271 )
      ( MAKE-3CRATE-VERIFY ?auto_22268 ?auto_22269 ?auto_22270 ?auto_22271 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22278 - SURFACE
      ?auto_22279 - SURFACE
      ?auto_22280 - SURFACE
      ?auto_22281 - SURFACE
      ?auto_22282 - SURFACE
    )
    :vars
    (
      ?auto_22285 - HOIST
      ?auto_22283 - PLACE
      ?auto_22284 - PLACE
      ?auto_22288 - HOIST
      ?auto_22286 - SURFACE
      ?auto_22287 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22285 ?auto_22283 ) ( SURFACE-AT ?auto_22281 ?auto_22283 ) ( CLEAR ?auto_22281 ) ( IS-CRATE ?auto_22282 ) ( not ( = ?auto_22281 ?auto_22282 ) ) ( AVAILABLE ?auto_22285 ) ( ON ?auto_22281 ?auto_22280 ) ( not ( = ?auto_22280 ?auto_22281 ) ) ( not ( = ?auto_22280 ?auto_22282 ) ) ( not ( = ?auto_22284 ?auto_22283 ) ) ( HOIST-AT ?auto_22288 ?auto_22284 ) ( not ( = ?auto_22285 ?auto_22288 ) ) ( AVAILABLE ?auto_22288 ) ( SURFACE-AT ?auto_22282 ?auto_22284 ) ( ON ?auto_22282 ?auto_22286 ) ( CLEAR ?auto_22282 ) ( not ( = ?auto_22281 ?auto_22286 ) ) ( not ( = ?auto_22282 ?auto_22286 ) ) ( not ( = ?auto_22280 ?auto_22286 ) ) ( TRUCK-AT ?auto_22287 ?auto_22283 ) ( ON ?auto_22279 ?auto_22278 ) ( ON ?auto_22280 ?auto_22279 ) ( not ( = ?auto_22278 ?auto_22279 ) ) ( not ( = ?auto_22278 ?auto_22280 ) ) ( not ( = ?auto_22278 ?auto_22281 ) ) ( not ( = ?auto_22278 ?auto_22282 ) ) ( not ( = ?auto_22278 ?auto_22286 ) ) ( not ( = ?auto_22279 ?auto_22280 ) ) ( not ( = ?auto_22279 ?auto_22281 ) ) ( not ( = ?auto_22279 ?auto_22282 ) ) ( not ( = ?auto_22279 ?auto_22286 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22280 ?auto_22281 ?auto_22282 )
      ( MAKE-4CRATE-VERIFY ?auto_22278 ?auto_22279 ?auto_22280 ?auto_22281 ?auto_22282 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22289 - SURFACE
      ?auto_22290 - SURFACE
      ?auto_22291 - SURFACE
      ?auto_22292 - SURFACE
      ?auto_22293 - SURFACE
      ?auto_22294 - SURFACE
    )
    :vars
    (
      ?auto_22297 - HOIST
      ?auto_22295 - PLACE
      ?auto_22296 - PLACE
      ?auto_22300 - HOIST
      ?auto_22298 - SURFACE
      ?auto_22299 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22297 ?auto_22295 ) ( SURFACE-AT ?auto_22293 ?auto_22295 ) ( CLEAR ?auto_22293 ) ( IS-CRATE ?auto_22294 ) ( not ( = ?auto_22293 ?auto_22294 ) ) ( AVAILABLE ?auto_22297 ) ( ON ?auto_22293 ?auto_22292 ) ( not ( = ?auto_22292 ?auto_22293 ) ) ( not ( = ?auto_22292 ?auto_22294 ) ) ( not ( = ?auto_22296 ?auto_22295 ) ) ( HOIST-AT ?auto_22300 ?auto_22296 ) ( not ( = ?auto_22297 ?auto_22300 ) ) ( AVAILABLE ?auto_22300 ) ( SURFACE-AT ?auto_22294 ?auto_22296 ) ( ON ?auto_22294 ?auto_22298 ) ( CLEAR ?auto_22294 ) ( not ( = ?auto_22293 ?auto_22298 ) ) ( not ( = ?auto_22294 ?auto_22298 ) ) ( not ( = ?auto_22292 ?auto_22298 ) ) ( TRUCK-AT ?auto_22299 ?auto_22295 ) ( ON ?auto_22290 ?auto_22289 ) ( ON ?auto_22291 ?auto_22290 ) ( ON ?auto_22292 ?auto_22291 ) ( not ( = ?auto_22289 ?auto_22290 ) ) ( not ( = ?auto_22289 ?auto_22291 ) ) ( not ( = ?auto_22289 ?auto_22292 ) ) ( not ( = ?auto_22289 ?auto_22293 ) ) ( not ( = ?auto_22289 ?auto_22294 ) ) ( not ( = ?auto_22289 ?auto_22298 ) ) ( not ( = ?auto_22290 ?auto_22291 ) ) ( not ( = ?auto_22290 ?auto_22292 ) ) ( not ( = ?auto_22290 ?auto_22293 ) ) ( not ( = ?auto_22290 ?auto_22294 ) ) ( not ( = ?auto_22290 ?auto_22298 ) ) ( not ( = ?auto_22291 ?auto_22292 ) ) ( not ( = ?auto_22291 ?auto_22293 ) ) ( not ( = ?auto_22291 ?auto_22294 ) ) ( not ( = ?auto_22291 ?auto_22298 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22292 ?auto_22293 ?auto_22294 )
      ( MAKE-5CRATE-VERIFY ?auto_22289 ?auto_22290 ?auto_22291 ?auto_22292 ?auto_22293 ?auto_22294 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22301 - SURFACE
      ?auto_22302 - SURFACE
    )
    :vars
    (
      ?auto_22305 - HOIST
      ?auto_22303 - PLACE
      ?auto_22307 - SURFACE
      ?auto_22304 - PLACE
      ?auto_22309 - HOIST
      ?auto_22306 - SURFACE
      ?auto_22308 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22305 ?auto_22303 ) ( IS-CRATE ?auto_22302 ) ( not ( = ?auto_22301 ?auto_22302 ) ) ( not ( = ?auto_22307 ?auto_22301 ) ) ( not ( = ?auto_22307 ?auto_22302 ) ) ( not ( = ?auto_22304 ?auto_22303 ) ) ( HOIST-AT ?auto_22309 ?auto_22304 ) ( not ( = ?auto_22305 ?auto_22309 ) ) ( AVAILABLE ?auto_22309 ) ( SURFACE-AT ?auto_22302 ?auto_22304 ) ( ON ?auto_22302 ?auto_22306 ) ( CLEAR ?auto_22302 ) ( not ( = ?auto_22301 ?auto_22306 ) ) ( not ( = ?auto_22302 ?auto_22306 ) ) ( not ( = ?auto_22307 ?auto_22306 ) ) ( TRUCK-AT ?auto_22308 ?auto_22303 ) ( SURFACE-AT ?auto_22307 ?auto_22303 ) ( CLEAR ?auto_22307 ) ( LIFTING ?auto_22305 ?auto_22301 ) ( IS-CRATE ?auto_22301 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22307 ?auto_22301 )
      ( MAKE-2CRATE ?auto_22307 ?auto_22301 ?auto_22302 )
      ( MAKE-1CRATE-VERIFY ?auto_22301 ?auto_22302 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22310 - SURFACE
      ?auto_22311 - SURFACE
      ?auto_22312 - SURFACE
    )
    :vars
    (
      ?auto_22316 - HOIST
      ?auto_22314 - PLACE
      ?auto_22317 - PLACE
      ?auto_22318 - HOIST
      ?auto_22313 - SURFACE
      ?auto_22315 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22316 ?auto_22314 ) ( IS-CRATE ?auto_22312 ) ( not ( = ?auto_22311 ?auto_22312 ) ) ( not ( = ?auto_22310 ?auto_22311 ) ) ( not ( = ?auto_22310 ?auto_22312 ) ) ( not ( = ?auto_22317 ?auto_22314 ) ) ( HOIST-AT ?auto_22318 ?auto_22317 ) ( not ( = ?auto_22316 ?auto_22318 ) ) ( AVAILABLE ?auto_22318 ) ( SURFACE-AT ?auto_22312 ?auto_22317 ) ( ON ?auto_22312 ?auto_22313 ) ( CLEAR ?auto_22312 ) ( not ( = ?auto_22311 ?auto_22313 ) ) ( not ( = ?auto_22312 ?auto_22313 ) ) ( not ( = ?auto_22310 ?auto_22313 ) ) ( TRUCK-AT ?auto_22315 ?auto_22314 ) ( SURFACE-AT ?auto_22310 ?auto_22314 ) ( CLEAR ?auto_22310 ) ( LIFTING ?auto_22316 ?auto_22311 ) ( IS-CRATE ?auto_22311 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22311 ?auto_22312 )
      ( MAKE-2CRATE-VERIFY ?auto_22310 ?auto_22311 ?auto_22312 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22319 - SURFACE
      ?auto_22320 - SURFACE
      ?auto_22321 - SURFACE
      ?auto_22322 - SURFACE
    )
    :vars
    (
      ?auto_22327 - HOIST
      ?auto_22326 - PLACE
      ?auto_22323 - PLACE
      ?auto_22325 - HOIST
      ?auto_22324 - SURFACE
      ?auto_22328 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22327 ?auto_22326 ) ( IS-CRATE ?auto_22322 ) ( not ( = ?auto_22321 ?auto_22322 ) ) ( not ( = ?auto_22320 ?auto_22321 ) ) ( not ( = ?auto_22320 ?auto_22322 ) ) ( not ( = ?auto_22323 ?auto_22326 ) ) ( HOIST-AT ?auto_22325 ?auto_22323 ) ( not ( = ?auto_22327 ?auto_22325 ) ) ( AVAILABLE ?auto_22325 ) ( SURFACE-AT ?auto_22322 ?auto_22323 ) ( ON ?auto_22322 ?auto_22324 ) ( CLEAR ?auto_22322 ) ( not ( = ?auto_22321 ?auto_22324 ) ) ( not ( = ?auto_22322 ?auto_22324 ) ) ( not ( = ?auto_22320 ?auto_22324 ) ) ( TRUCK-AT ?auto_22328 ?auto_22326 ) ( SURFACE-AT ?auto_22320 ?auto_22326 ) ( CLEAR ?auto_22320 ) ( LIFTING ?auto_22327 ?auto_22321 ) ( IS-CRATE ?auto_22321 ) ( ON ?auto_22320 ?auto_22319 ) ( not ( = ?auto_22319 ?auto_22320 ) ) ( not ( = ?auto_22319 ?auto_22321 ) ) ( not ( = ?auto_22319 ?auto_22322 ) ) ( not ( = ?auto_22319 ?auto_22324 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22320 ?auto_22321 ?auto_22322 )
      ( MAKE-3CRATE-VERIFY ?auto_22319 ?auto_22320 ?auto_22321 ?auto_22322 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22329 - SURFACE
      ?auto_22330 - SURFACE
      ?auto_22331 - SURFACE
      ?auto_22332 - SURFACE
      ?auto_22333 - SURFACE
    )
    :vars
    (
      ?auto_22338 - HOIST
      ?auto_22337 - PLACE
      ?auto_22334 - PLACE
      ?auto_22336 - HOIST
      ?auto_22335 - SURFACE
      ?auto_22339 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22338 ?auto_22337 ) ( IS-CRATE ?auto_22333 ) ( not ( = ?auto_22332 ?auto_22333 ) ) ( not ( = ?auto_22331 ?auto_22332 ) ) ( not ( = ?auto_22331 ?auto_22333 ) ) ( not ( = ?auto_22334 ?auto_22337 ) ) ( HOIST-AT ?auto_22336 ?auto_22334 ) ( not ( = ?auto_22338 ?auto_22336 ) ) ( AVAILABLE ?auto_22336 ) ( SURFACE-AT ?auto_22333 ?auto_22334 ) ( ON ?auto_22333 ?auto_22335 ) ( CLEAR ?auto_22333 ) ( not ( = ?auto_22332 ?auto_22335 ) ) ( not ( = ?auto_22333 ?auto_22335 ) ) ( not ( = ?auto_22331 ?auto_22335 ) ) ( TRUCK-AT ?auto_22339 ?auto_22337 ) ( SURFACE-AT ?auto_22331 ?auto_22337 ) ( CLEAR ?auto_22331 ) ( LIFTING ?auto_22338 ?auto_22332 ) ( IS-CRATE ?auto_22332 ) ( ON ?auto_22330 ?auto_22329 ) ( ON ?auto_22331 ?auto_22330 ) ( not ( = ?auto_22329 ?auto_22330 ) ) ( not ( = ?auto_22329 ?auto_22331 ) ) ( not ( = ?auto_22329 ?auto_22332 ) ) ( not ( = ?auto_22329 ?auto_22333 ) ) ( not ( = ?auto_22329 ?auto_22335 ) ) ( not ( = ?auto_22330 ?auto_22331 ) ) ( not ( = ?auto_22330 ?auto_22332 ) ) ( not ( = ?auto_22330 ?auto_22333 ) ) ( not ( = ?auto_22330 ?auto_22335 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22331 ?auto_22332 ?auto_22333 )
      ( MAKE-4CRATE-VERIFY ?auto_22329 ?auto_22330 ?auto_22331 ?auto_22332 ?auto_22333 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22340 - SURFACE
      ?auto_22341 - SURFACE
      ?auto_22342 - SURFACE
      ?auto_22343 - SURFACE
      ?auto_22344 - SURFACE
      ?auto_22345 - SURFACE
    )
    :vars
    (
      ?auto_22350 - HOIST
      ?auto_22349 - PLACE
      ?auto_22346 - PLACE
      ?auto_22348 - HOIST
      ?auto_22347 - SURFACE
      ?auto_22351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22350 ?auto_22349 ) ( IS-CRATE ?auto_22345 ) ( not ( = ?auto_22344 ?auto_22345 ) ) ( not ( = ?auto_22343 ?auto_22344 ) ) ( not ( = ?auto_22343 ?auto_22345 ) ) ( not ( = ?auto_22346 ?auto_22349 ) ) ( HOIST-AT ?auto_22348 ?auto_22346 ) ( not ( = ?auto_22350 ?auto_22348 ) ) ( AVAILABLE ?auto_22348 ) ( SURFACE-AT ?auto_22345 ?auto_22346 ) ( ON ?auto_22345 ?auto_22347 ) ( CLEAR ?auto_22345 ) ( not ( = ?auto_22344 ?auto_22347 ) ) ( not ( = ?auto_22345 ?auto_22347 ) ) ( not ( = ?auto_22343 ?auto_22347 ) ) ( TRUCK-AT ?auto_22351 ?auto_22349 ) ( SURFACE-AT ?auto_22343 ?auto_22349 ) ( CLEAR ?auto_22343 ) ( LIFTING ?auto_22350 ?auto_22344 ) ( IS-CRATE ?auto_22344 ) ( ON ?auto_22341 ?auto_22340 ) ( ON ?auto_22342 ?auto_22341 ) ( ON ?auto_22343 ?auto_22342 ) ( not ( = ?auto_22340 ?auto_22341 ) ) ( not ( = ?auto_22340 ?auto_22342 ) ) ( not ( = ?auto_22340 ?auto_22343 ) ) ( not ( = ?auto_22340 ?auto_22344 ) ) ( not ( = ?auto_22340 ?auto_22345 ) ) ( not ( = ?auto_22340 ?auto_22347 ) ) ( not ( = ?auto_22341 ?auto_22342 ) ) ( not ( = ?auto_22341 ?auto_22343 ) ) ( not ( = ?auto_22341 ?auto_22344 ) ) ( not ( = ?auto_22341 ?auto_22345 ) ) ( not ( = ?auto_22341 ?auto_22347 ) ) ( not ( = ?auto_22342 ?auto_22343 ) ) ( not ( = ?auto_22342 ?auto_22344 ) ) ( not ( = ?auto_22342 ?auto_22345 ) ) ( not ( = ?auto_22342 ?auto_22347 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22343 ?auto_22344 ?auto_22345 )
      ( MAKE-5CRATE-VERIFY ?auto_22340 ?auto_22341 ?auto_22342 ?auto_22343 ?auto_22344 ?auto_22345 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22352 - SURFACE
      ?auto_22353 - SURFACE
    )
    :vars
    (
      ?auto_22359 - HOIST
      ?auto_22358 - PLACE
      ?auto_22354 - SURFACE
      ?auto_22355 - PLACE
      ?auto_22357 - HOIST
      ?auto_22356 - SURFACE
      ?auto_22360 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22359 ?auto_22358 ) ( IS-CRATE ?auto_22353 ) ( not ( = ?auto_22352 ?auto_22353 ) ) ( not ( = ?auto_22354 ?auto_22352 ) ) ( not ( = ?auto_22354 ?auto_22353 ) ) ( not ( = ?auto_22355 ?auto_22358 ) ) ( HOIST-AT ?auto_22357 ?auto_22355 ) ( not ( = ?auto_22359 ?auto_22357 ) ) ( AVAILABLE ?auto_22357 ) ( SURFACE-AT ?auto_22353 ?auto_22355 ) ( ON ?auto_22353 ?auto_22356 ) ( CLEAR ?auto_22353 ) ( not ( = ?auto_22352 ?auto_22356 ) ) ( not ( = ?auto_22353 ?auto_22356 ) ) ( not ( = ?auto_22354 ?auto_22356 ) ) ( TRUCK-AT ?auto_22360 ?auto_22358 ) ( SURFACE-AT ?auto_22354 ?auto_22358 ) ( CLEAR ?auto_22354 ) ( IS-CRATE ?auto_22352 ) ( AVAILABLE ?auto_22359 ) ( IN ?auto_22352 ?auto_22360 ) )
    :subtasks
    ( ( !UNLOAD ?auto_22359 ?auto_22352 ?auto_22360 ?auto_22358 )
      ( MAKE-2CRATE ?auto_22354 ?auto_22352 ?auto_22353 )
      ( MAKE-1CRATE-VERIFY ?auto_22352 ?auto_22353 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22361 - SURFACE
      ?auto_22362 - SURFACE
      ?auto_22363 - SURFACE
    )
    :vars
    (
      ?auto_22364 - HOIST
      ?auto_22365 - PLACE
      ?auto_22367 - PLACE
      ?auto_22369 - HOIST
      ?auto_22368 - SURFACE
      ?auto_22366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22364 ?auto_22365 ) ( IS-CRATE ?auto_22363 ) ( not ( = ?auto_22362 ?auto_22363 ) ) ( not ( = ?auto_22361 ?auto_22362 ) ) ( not ( = ?auto_22361 ?auto_22363 ) ) ( not ( = ?auto_22367 ?auto_22365 ) ) ( HOIST-AT ?auto_22369 ?auto_22367 ) ( not ( = ?auto_22364 ?auto_22369 ) ) ( AVAILABLE ?auto_22369 ) ( SURFACE-AT ?auto_22363 ?auto_22367 ) ( ON ?auto_22363 ?auto_22368 ) ( CLEAR ?auto_22363 ) ( not ( = ?auto_22362 ?auto_22368 ) ) ( not ( = ?auto_22363 ?auto_22368 ) ) ( not ( = ?auto_22361 ?auto_22368 ) ) ( TRUCK-AT ?auto_22366 ?auto_22365 ) ( SURFACE-AT ?auto_22361 ?auto_22365 ) ( CLEAR ?auto_22361 ) ( IS-CRATE ?auto_22362 ) ( AVAILABLE ?auto_22364 ) ( IN ?auto_22362 ?auto_22366 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22362 ?auto_22363 )
      ( MAKE-2CRATE-VERIFY ?auto_22361 ?auto_22362 ?auto_22363 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22370 - SURFACE
      ?auto_22371 - SURFACE
      ?auto_22372 - SURFACE
      ?auto_22373 - SURFACE
    )
    :vars
    (
      ?auto_22376 - HOIST
      ?auto_22379 - PLACE
      ?auto_22375 - PLACE
      ?auto_22377 - HOIST
      ?auto_22374 - SURFACE
      ?auto_22378 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22376 ?auto_22379 ) ( IS-CRATE ?auto_22373 ) ( not ( = ?auto_22372 ?auto_22373 ) ) ( not ( = ?auto_22371 ?auto_22372 ) ) ( not ( = ?auto_22371 ?auto_22373 ) ) ( not ( = ?auto_22375 ?auto_22379 ) ) ( HOIST-AT ?auto_22377 ?auto_22375 ) ( not ( = ?auto_22376 ?auto_22377 ) ) ( AVAILABLE ?auto_22377 ) ( SURFACE-AT ?auto_22373 ?auto_22375 ) ( ON ?auto_22373 ?auto_22374 ) ( CLEAR ?auto_22373 ) ( not ( = ?auto_22372 ?auto_22374 ) ) ( not ( = ?auto_22373 ?auto_22374 ) ) ( not ( = ?auto_22371 ?auto_22374 ) ) ( TRUCK-AT ?auto_22378 ?auto_22379 ) ( SURFACE-AT ?auto_22371 ?auto_22379 ) ( CLEAR ?auto_22371 ) ( IS-CRATE ?auto_22372 ) ( AVAILABLE ?auto_22376 ) ( IN ?auto_22372 ?auto_22378 ) ( ON ?auto_22371 ?auto_22370 ) ( not ( = ?auto_22370 ?auto_22371 ) ) ( not ( = ?auto_22370 ?auto_22372 ) ) ( not ( = ?auto_22370 ?auto_22373 ) ) ( not ( = ?auto_22370 ?auto_22374 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22371 ?auto_22372 ?auto_22373 )
      ( MAKE-3CRATE-VERIFY ?auto_22370 ?auto_22371 ?auto_22372 ?auto_22373 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22380 - SURFACE
      ?auto_22381 - SURFACE
      ?auto_22382 - SURFACE
      ?auto_22383 - SURFACE
      ?auto_22384 - SURFACE
    )
    :vars
    (
      ?auto_22387 - HOIST
      ?auto_22390 - PLACE
      ?auto_22386 - PLACE
      ?auto_22388 - HOIST
      ?auto_22385 - SURFACE
      ?auto_22389 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22387 ?auto_22390 ) ( IS-CRATE ?auto_22384 ) ( not ( = ?auto_22383 ?auto_22384 ) ) ( not ( = ?auto_22382 ?auto_22383 ) ) ( not ( = ?auto_22382 ?auto_22384 ) ) ( not ( = ?auto_22386 ?auto_22390 ) ) ( HOIST-AT ?auto_22388 ?auto_22386 ) ( not ( = ?auto_22387 ?auto_22388 ) ) ( AVAILABLE ?auto_22388 ) ( SURFACE-AT ?auto_22384 ?auto_22386 ) ( ON ?auto_22384 ?auto_22385 ) ( CLEAR ?auto_22384 ) ( not ( = ?auto_22383 ?auto_22385 ) ) ( not ( = ?auto_22384 ?auto_22385 ) ) ( not ( = ?auto_22382 ?auto_22385 ) ) ( TRUCK-AT ?auto_22389 ?auto_22390 ) ( SURFACE-AT ?auto_22382 ?auto_22390 ) ( CLEAR ?auto_22382 ) ( IS-CRATE ?auto_22383 ) ( AVAILABLE ?auto_22387 ) ( IN ?auto_22383 ?auto_22389 ) ( ON ?auto_22381 ?auto_22380 ) ( ON ?auto_22382 ?auto_22381 ) ( not ( = ?auto_22380 ?auto_22381 ) ) ( not ( = ?auto_22380 ?auto_22382 ) ) ( not ( = ?auto_22380 ?auto_22383 ) ) ( not ( = ?auto_22380 ?auto_22384 ) ) ( not ( = ?auto_22380 ?auto_22385 ) ) ( not ( = ?auto_22381 ?auto_22382 ) ) ( not ( = ?auto_22381 ?auto_22383 ) ) ( not ( = ?auto_22381 ?auto_22384 ) ) ( not ( = ?auto_22381 ?auto_22385 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22382 ?auto_22383 ?auto_22384 )
      ( MAKE-4CRATE-VERIFY ?auto_22380 ?auto_22381 ?auto_22382 ?auto_22383 ?auto_22384 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22391 - SURFACE
      ?auto_22392 - SURFACE
      ?auto_22393 - SURFACE
      ?auto_22394 - SURFACE
      ?auto_22395 - SURFACE
      ?auto_22396 - SURFACE
    )
    :vars
    (
      ?auto_22399 - HOIST
      ?auto_22402 - PLACE
      ?auto_22398 - PLACE
      ?auto_22400 - HOIST
      ?auto_22397 - SURFACE
      ?auto_22401 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22399 ?auto_22402 ) ( IS-CRATE ?auto_22396 ) ( not ( = ?auto_22395 ?auto_22396 ) ) ( not ( = ?auto_22394 ?auto_22395 ) ) ( not ( = ?auto_22394 ?auto_22396 ) ) ( not ( = ?auto_22398 ?auto_22402 ) ) ( HOIST-AT ?auto_22400 ?auto_22398 ) ( not ( = ?auto_22399 ?auto_22400 ) ) ( AVAILABLE ?auto_22400 ) ( SURFACE-AT ?auto_22396 ?auto_22398 ) ( ON ?auto_22396 ?auto_22397 ) ( CLEAR ?auto_22396 ) ( not ( = ?auto_22395 ?auto_22397 ) ) ( not ( = ?auto_22396 ?auto_22397 ) ) ( not ( = ?auto_22394 ?auto_22397 ) ) ( TRUCK-AT ?auto_22401 ?auto_22402 ) ( SURFACE-AT ?auto_22394 ?auto_22402 ) ( CLEAR ?auto_22394 ) ( IS-CRATE ?auto_22395 ) ( AVAILABLE ?auto_22399 ) ( IN ?auto_22395 ?auto_22401 ) ( ON ?auto_22392 ?auto_22391 ) ( ON ?auto_22393 ?auto_22392 ) ( ON ?auto_22394 ?auto_22393 ) ( not ( = ?auto_22391 ?auto_22392 ) ) ( not ( = ?auto_22391 ?auto_22393 ) ) ( not ( = ?auto_22391 ?auto_22394 ) ) ( not ( = ?auto_22391 ?auto_22395 ) ) ( not ( = ?auto_22391 ?auto_22396 ) ) ( not ( = ?auto_22391 ?auto_22397 ) ) ( not ( = ?auto_22392 ?auto_22393 ) ) ( not ( = ?auto_22392 ?auto_22394 ) ) ( not ( = ?auto_22392 ?auto_22395 ) ) ( not ( = ?auto_22392 ?auto_22396 ) ) ( not ( = ?auto_22392 ?auto_22397 ) ) ( not ( = ?auto_22393 ?auto_22394 ) ) ( not ( = ?auto_22393 ?auto_22395 ) ) ( not ( = ?auto_22393 ?auto_22396 ) ) ( not ( = ?auto_22393 ?auto_22397 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22394 ?auto_22395 ?auto_22396 )
      ( MAKE-5CRATE-VERIFY ?auto_22391 ?auto_22392 ?auto_22393 ?auto_22394 ?auto_22395 ?auto_22396 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22403 - SURFACE
      ?auto_22404 - SURFACE
    )
    :vars
    (
      ?auto_22407 - HOIST
      ?auto_22411 - PLACE
      ?auto_22410 - SURFACE
      ?auto_22406 - PLACE
      ?auto_22408 - HOIST
      ?auto_22405 - SURFACE
      ?auto_22409 - TRUCK
      ?auto_22412 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22407 ?auto_22411 ) ( IS-CRATE ?auto_22404 ) ( not ( = ?auto_22403 ?auto_22404 ) ) ( not ( = ?auto_22410 ?auto_22403 ) ) ( not ( = ?auto_22410 ?auto_22404 ) ) ( not ( = ?auto_22406 ?auto_22411 ) ) ( HOIST-AT ?auto_22408 ?auto_22406 ) ( not ( = ?auto_22407 ?auto_22408 ) ) ( AVAILABLE ?auto_22408 ) ( SURFACE-AT ?auto_22404 ?auto_22406 ) ( ON ?auto_22404 ?auto_22405 ) ( CLEAR ?auto_22404 ) ( not ( = ?auto_22403 ?auto_22405 ) ) ( not ( = ?auto_22404 ?auto_22405 ) ) ( not ( = ?auto_22410 ?auto_22405 ) ) ( SURFACE-AT ?auto_22410 ?auto_22411 ) ( CLEAR ?auto_22410 ) ( IS-CRATE ?auto_22403 ) ( AVAILABLE ?auto_22407 ) ( IN ?auto_22403 ?auto_22409 ) ( TRUCK-AT ?auto_22409 ?auto_22412 ) ( not ( = ?auto_22412 ?auto_22411 ) ) ( not ( = ?auto_22406 ?auto_22412 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22409 ?auto_22412 ?auto_22411 )
      ( MAKE-2CRATE ?auto_22410 ?auto_22403 ?auto_22404 )
      ( MAKE-1CRATE-VERIFY ?auto_22403 ?auto_22404 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22413 - SURFACE
      ?auto_22414 - SURFACE
      ?auto_22415 - SURFACE
    )
    :vars
    (
      ?auto_22421 - HOIST
      ?auto_22418 - PLACE
      ?auto_22416 - PLACE
      ?auto_22417 - HOIST
      ?auto_22419 - SURFACE
      ?auto_22422 - TRUCK
      ?auto_22420 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22421 ?auto_22418 ) ( IS-CRATE ?auto_22415 ) ( not ( = ?auto_22414 ?auto_22415 ) ) ( not ( = ?auto_22413 ?auto_22414 ) ) ( not ( = ?auto_22413 ?auto_22415 ) ) ( not ( = ?auto_22416 ?auto_22418 ) ) ( HOIST-AT ?auto_22417 ?auto_22416 ) ( not ( = ?auto_22421 ?auto_22417 ) ) ( AVAILABLE ?auto_22417 ) ( SURFACE-AT ?auto_22415 ?auto_22416 ) ( ON ?auto_22415 ?auto_22419 ) ( CLEAR ?auto_22415 ) ( not ( = ?auto_22414 ?auto_22419 ) ) ( not ( = ?auto_22415 ?auto_22419 ) ) ( not ( = ?auto_22413 ?auto_22419 ) ) ( SURFACE-AT ?auto_22413 ?auto_22418 ) ( CLEAR ?auto_22413 ) ( IS-CRATE ?auto_22414 ) ( AVAILABLE ?auto_22421 ) ( IN ?auto_22414 ?auto_22422 ) ( TRUCK-AT ?auto_22422 ?auto_22420 ) ( not ( = ?auto_22420 ?auto_22418 ) ) ( not ( = ?auto_22416 ?auto_22420 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22414 ?auto_22415 )
      ( MAKE-2CRATE-VERIFY ?auto_22413 ?auto_22414 ?auto_22415 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22423 - SURFACE
      ?auto_22424 - SURFACE
      ?auto_22425 - SURFACE
      ?auto_22426 - SURFACE
    )
    :vars
    (
      ?auto_22427 - HOIST
      ?auto_22431 - PLACE
      ?auto_22428 - PLACE
      ?auto_22433 - HOIST
      ?auto_22432 - SURFACE
      ?auto_22430 - TRUCK
      ?auto_22429 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22427 ?auto_22431 ) ( IS-CRATE ?auto_22426 ) ( not ( = ?auto_22425 ?auto_22426 ) ) ( not ( = ?auto_22424 ?auto_22425 ) ) ( not ( = ?auto_22424 ?auto_22426 ) ) ( not ( = ?auto_22428 ?auto_22431 ) ) ( HOIST-AT ?auto_22433 ?auto_22428 ) ( not ( = ?auto_22427 ?auto_22433 ) ) ( AVAILABLE ?auto_22433 ) ( SURFACE-AT ?auto_22426 ?auto_22428 ) ( ON ?auto_22426 ?auto_22432 ) ( CLEAR ?auto_22426 ) ( not ( = ?auto_22425 ?auto_22432 ) ) ( not ( = ?auto_22426 ?auto_22432 ) ) ( not ( = ?auto_22424 ?auto_22432 ) ) ( SURFACE-AT ?auto_22424 ?auto_22431 ) ( CLEAR ?auto_22424 ) ( IS-CRATE ?auto_22425 ) ( AVAILABLE ?auto_22427 ) ( IN ?auto_22425 ?auto_22430 ) ( TRUCK-AT ?auto_22430 ?auto_22429 ) ( not ( = ?auto_22429 ?auto_22431 ) ) ( not ( = ?auto_22428 ?auto_22429 ) ) ( ON ?auto_22424 ?auto_22423 ) ( not ( = ?auto_22423 ?auto_22424 ) ) ( not ( = ?auto_22423 ?auto_22425 ) ) ( not ( = ?auto_22423 ?auto_22426 ) ) ( not ( = ?auto_22423 ?auto_22432 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22424 ?auto_22425 ?auto_22426 )
      ( MAKE-3CRATE-VERIFY ?auto_22423 ?auto_22424 ?auto_22425 ?auto_22426 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22434 - SURFACE
      ?auto_22435 - SURFACE
      ?auto_22436 - SURFACE
      ?auto_22437 - SURFACE
      ?auto_22438 - SURFACE
    )
    :vars
    (
      ?auto_22439 - HOIST
      ?auto_22443 - PLACE
      ?auto_22440 - PLACE
      ?auto_22445 - HOIST
      ?auto_22444 - SURFACE
      ?auto_22442 - TRUCK
      ?auto_22441 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22439 ?auto_22443 ) ( IS-CRATE ?auto_22438 ) ( not ( = ?auto_22437 ?auto_22438 ) ) ( not ( = ?auto_22436 ?auto_22437 ) ) ( not ( = ?auto_22436 ?auto_22438 ) ) ( not ( = ?auto_22440 ?auto_22443 ) ) ( HOIST-AT ?auto_22445 ?auto_22440 ) ( not ( = ?auto_22439 ?auto_22445 ) ) ( AVAILABLE ?auto_22445 ) ( SURFACE-AT ?auto_22438 ?auto_22440 ) ( ON ?auto_22438 ?auto_22444 ) ( CLEAR ?auto_22438 ) ( not ( = ?auto_22437 ?auto_22444 ) ) ( not ( = ?auto_22438 ?auto_22444 ) ) ( not ( = ?auto_22436 ?auto_22444 ) ) ( SURFACE-AT ?auto_22436 ?auto_22443 ) ( CLEAR ?auto_22436 ) ( IS-CRATE ?auto_22437 ) ( AVAILABLE ?auto_22439 ) ( IN ?auto_22437 ?auto_22442 ) ( TRUCK-AT ?auto_22442 ?auto_22441 ) ( not ( = ?auto_22441 ?auto_22443 ) ) ( not ( = ?auto_22440 ?auto_22441 ) ) ( ON ?auto_22435 ?auto_22434 ) ( ON ?auto_22436 ?auto_22435 ) ( not ( = ?auto_22434 ?auto_22435 ) ) ( not ( = ?auto_22434 ?auto_22436 ) ) ( not ( = ?auto_22434 ?auto_22437 ) ) ( not ( = ?auto_22434 ?auto_22438 ) ) ( not ( = ?auto_22434 ?auto_22444 ) ) ( not ( = ?auto_22435 ?auto_22436 ) ) ( not ( = ?auto_22435 ?auto_22437 ) ) ( not ( = ?auto_22435 ?auto_22438 ) ) ( not ( = ?auto_22435 ?auto_22444 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22436 ?auto_22437 ?auto_22438 )
      ( MAKE-4CRATE-VERIFY ?auto_22434 ?auto_22435 ?auto_22436 ?auto_22437 ?auto_22438 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22446 - SURFACE
      ?auto_22447 - SURFACE
      ?auto_22448 - SURFACE
      ?auto_22449 - SURFACE
      ?auto_22450 - SURFACE
      ?auto_22451 - SURFACE
    )
    :vars
    (
      ?auto_22452 - HOIST
      ?auto_22456 - PLACE
      ?auto_22453 - PLACE
      ?auto_22458 - HOIST
      ?auto_22457 - SURFACE
      ?auto_22455 - TRUCK
      ?auto_22454 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22452 ?auto_22456 ) ( IS-CRATE ?auto_22451 ) ( not ( = ?auto_22450 ?auto_22451 ) ) ( not ( = ?auto_22449 ?auto_22450 ) ) ( not ( = ?auto_22449 ?auto_22451 ) ) ( not ( = ?auto_22453 ?auto_22456 ) ) ( HOIST-AT ?auto_22458 ?auto_22453 ) ( not ( = ?auto_22452 ?auto_22458 ) ) ( AVAILABLE ?auto_22458 ) ( SURFACE-AT ?auto_22451 ?auto_22453 ) ( ON ?auto_22451 ?auto_22457 ) ( CLEAR ?auto_22451 ) ( not ( = ?auto_22450 ?auto_22457 ) ) ( not ( = ?auto_22451 ?auto_22457 ) ) ( not ( = ?auto_22449 ?auto_22457 ) ) ( SURFACE-AT ?auto_22449 ?auto_22456 ) ( CLEAR ?auto_22449 ) ( IS-CRATE ?auto_22450 ) ( AVAILABLE ?auto_22452 ) ( IN ?auto_22450 ?auto_22455 ) ( TRUCK-AT ?auto_22455 ?auto_22454 ) ( not ( = ?auto_22454 ?auto_22456 ) ) ( not ( = ?auto_22453 ?auto_22454 ) ) ( ON ?auto_22447 ?auto_22446 ) ( ON ?auto_22448 ?auto_22447 ) ( ON ?auto_22449 ?auto_22448 ) ( not ( = ?auto_22446 ?auto_22447 ) ) ( not ( = ?auto_22446 ?auto_22448 ) ) ( not ( = ?auto_22446 ?auto_22449 ) ) ( not ( = ?auto_22446 ?auto_22450 ) ) ( not ( = ?auto_22446 ?auto_22451 ) ) ( not ( = ?auto_22446 ?auto_22457 ) ) ( not ( = ?auto_22447 ?auto_22448 ) ) ( not ( = ?auto_22447 ?auto_22449 ) ) ( not ( = ?auto_22447 ?auto_22450 ) ) ( not ( = ?auto_22447 ?auto_22451 ) ) ( not ( = ?auto_22447 ?auto_22457 ) ) ( not ( = ?auto_22448 ?auto_22449 ) ) ( not ( = ?auto_22448 ?auto_22450 ) ) ( not ( = ?auto_22448 ?auto_22451 ) ) ( not ( = ?auto_22448 ?auto_22457 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22449 ?auto_22450 ?auto_22451 )
      ( MAKE-5CRATE-VERIFY ?auto_22446 ?auto_22447 ?auto_22448 ?auto_22449 ?auto_22450 ?auto_22451 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22459 - SURFACE
      ?auto_22460 - SURFACE
    )
    :vars
    (
      ?auto_22461 - HOIST
      ?auto_22466 - PLACE
      ?auto_22463 - SURFACE
      ?auto_22462 - PLACE
      ?auto_22468 - HOIST
      ?auto_22467 - SURFACE
      ?auto_22465 - TRUCK
      ?auto_22464 - PLACE
      ?auto_22469 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22461 ?auto_22466 ) ( IS-CRATE ?auto_22460 ) ( not ( = ?auto_22459 ?auto_22460 ) ) ( not ( = ?auto_22463 ?auto_22459 ) ) ( not ( = ?auto_22463 ?auto_22460 ) ) ( not ( = ?auto_22462 ?auto_22466 ) ) ( HOIST-AT ?auto_22468 ?auto_22462 ) ( not ( = ?auto_22461 ?auto_22468 ) ) ( AVAILABLE ?auto_22468 ) ( SURFACE-AT ?auto_22460 ?auto_22462 ) ( ON ?auto_22460 ?auto_22467 ) ( CLEAR ?auto_22460 ) ( not ( = ?auto_22459 ?auto_22467 ) ) ( not ( = ?auto_22460 ?auto_22467 ) ) ( not ( = ?auto_22463 ?auto_22467 ) ) ( SURFACE-AT ?auto_22463 ?auto_22466 ) ( CLEAR ?auto_22463 ) ( IS-CRATE ?auto_22459 ) ( AVAILABLE ?auto_22461 ) ( TRUCK-AT ?auto_22465 ?auto_22464 ) ( not ( = ?auto_22464 ?auto_22466 ) ) ( not ( = ?auto_22462 ?auto_22464 ) ) ( HOIST-AT ?auto_22469 ?auto_22464 ) ( LIFTING ?auto_22469 ?auto_22459 ) ( not ( = ?auto_22461 ?auto_22469 ) ) ( not ( = ?auto_22468 ?auto_22469 ) ) )
    :subtasks
    ( ( !LOAD ?auto_22469 ?auto_22459 ?auto_22465 ?auto_22464 )
      ( MAKE-2CRATE ?auto_22463 ?auto_22459 ?auto_22460 )
      ( MAKE-1CRATE-VERIFY ?auto_22459 ?auto_22460 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22470 - SURFACE
      ?auto_22471 - SURFACE
      ?auto_22472 - SURFACE
    )
    :vars
    (
      ?auto_22475 - HOIST
      ?auto_22476 - PLACE
      ?auto_22474 - PLACE
      ?auto_22480 - HOIST
      ?auto_22477 - SURFACE
      ?auto_22478 - TRUCK
      ?auto_22473 - PLACE
      ?auto_22479 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22475 ?auto_22476 ) ( IS-CRATE ?auto_22472 ) ( not ( = ?auto_22471 ?auto_22472 ) ) ( not ( = ?auto_22470 ?auto_22471 ) ) ( not ( = ?auto_22470 ?auto_22472 ) ) ( not ( = ?auto_22474 ?auto_22476 ) ) ( HOIST-AT ?auto_22480 ?auto_22474 ) ( not ( = ?auto_22475 ?auto_22480 ) ) ( AVAILABLE ?auto_22480 ) ( SURFACE-AT ?auto_22472 ?auto_22474 ) ( ON ?auto_22472 ?auto_22477 ) ( CLEAR ?auto_22472 ) ( not ( = ?auto_22471 ?auto_22477 ) ) ( not ( = ?auto_22472 ?auto_22477 ) ) ( not ( = ?auto_22470 ?auto_22477 ) ) ( SURFACE-AT ?auto_22470 ?auto_22476 ) ( CLEAR ?auto_22470 ) ( IS-CRATE ?auto_22471 ) ( AVAILABLE ?auto_22475 ) ( TRUCK-AT ?auto_22478 ?auto_22473 ) ( not ( = ?auto_22473 ?auto_22476 ) ) ( not ( = ?auto_22474 ?auto_22473 ) ) ( HOIST-AT ?auto_22479 ?auto_22473 ) ( LIFTING ?auto_22479 ?auto_22471 ) ( not ( = ?auto_22475 ?auto_22479 ) ) ( not ( = ?auto_22480 ?auto_22479 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22471 ?auto_22472 )
      ( MAKE-2CRATE-VERIFY ?auto_22470 ?auto_22471 ?auto_22472 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22481 - SURFACE
      ?auto_22482 - SURFACE
      ?auto_22483 - SURFACE
      ?auto_22484 - SURFACE
    )
    :vars
    (
      ?auto_22487 - HOIST
      ?auto_22492 - PLACE
      ?auto_22486 - PLACE
      ?auto_22485 - HOIST
      ?auto_22488 - SURFACE
      ?auto_22490 - TRUCK
      ?auto_22491 - PLACE
      ?auto_22489 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22487 ?auto_22492 ) ( IS-CRATE ?auto_22484 ) ( not ( = ?auto_22483 ?auto_22484 ) ) ( not ( = ?auto_22482 ?auto_22483 ) ) ( not ( = ?auto_22482 ?auto_22484 ) ) ( not ( = ?auto_22486 ?auto_22492 ) ) ( HOIST-AT ?auto_22485 ?auto_22486 ) ( not ( = ?auto_22487 ?auto_22485 ) ) ( AVAILABLE ?auto_22485 ) ( SURFACE-AT ?auto_22484 ?auto_22486 ) ( ON ?auto_22484 ?auto_22488 ) ( CLEAR ?auto_22484 ) ( not ( = ?auto_22483 ?auto_22488 ) ) ( not ( = ?auto_22484 ?auto_22488 ) ) ( not ( = ?auto_22482 ?auto_22488 ) ) ( SURFACE-AT ?auto_22482 ?auto_22492 ) ( CLEAR ?auto_22482 ) ( IS-CRATE ?auto_22483 ) ( AVAILABLE ?auto_22487 ) ( TRUCK-AT ?auto_22490 ?auto_22491 ) ( not ( = ?auto_22491 ?auto_22492 ) ) ( not ( = ?auto_22486 ?auto_22491 ) ) ( HOIST-AT ?auto_22489 ?auto_22491 ) ( LIFTING ?auto_22489 ?auto_22483 ) ( not ( = ?auto_22487 ?auto_22489 ) ) ( not ( = ?auto_22485 ?auto_22489 ) ) ( ON ?auto_22482 ?auto_22481 ) ( not ( = ?auto_22481 ?auto_22482 ) ) ( not ( = ?auto_22481 ?auto_22483 ) ) ( not ( = ?auto_22481 ?auto_22484 ) ) ( not ( = ?auto_22481 ?auto_22488 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22482 ?auto_22483 ?auto_22484 )
      ( MAKE-3CRATE-VERIFY ?auto_22481 ?auto_22482 ?auto_22483 ?auto_22484 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22493 - SURFACE
      ?auto_22494 - SURFACE
      ?auto_22495 - SURFACE
      ?auto_22496 - SURFACE
      ?auto_22497 - SURFACE
    )
    :vars
    (
      ?auto_22500 - HOIST
      ?auto_22505 - PLACE
      ?auto_22499 - PLACE
      ?auto_22498 - HOIST
      ?auto_22501 - SURFACE
      ?auto_22503 - TRUCK
      ?auto_22504 - PLACE
      ?auto_22502 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22500 ?auto_22505 ) ( IS-CRATE ?auto_22497 ) ( not ( = ?auto_22496 ?auto_22497 ) ) ( not ( = ?auto_22495 ?auto_22496 ) ) ( not ( = ?auto_22495 ?auto_22497 ) ) ( not ( = ?auto_22499 ?auto_22505 ) ) ( HOIST-AT ?auto_22498 ?auto_22499 ) ( not ( = ?auto_22500 ?auto_22498 ) ) ( AVAILABLE ?auto_22498 ) ( SURFACE-AT ?auto_22497 ?auto_22499 ) ( ON ?auto_22497 ?auto_22501 ) ( CLEAR ?auto_22497 ) ( not ( = ?auto_22496 ?auto_22501 ) ) ( not ( = ?auto_22497 ?auto_22501 ) ) ( not ( = ?auto_22495 ?auto_22501 ) ) ( SURFACE-AT ?auto_22495 ?auto_22505 ) ( CLEAR ?auto_22495 ) ( IS-CRATE ?auto_22496 ) ( AVAILABLE ?auto_22500 ) ( TRUCK-AT ?auto_22503 ?auto_22504 ) ( not ( = ?auto_22504 ?auto_22505 ) ) ( not ( = ?auto_22499 ?auto_22504 ) ) ( HOIST-AT ?auto_22502 ?auto_22504 ) ( LIFTING ?auto_22502 ?auto_22496 ) ( not ( = ?auto_22500 ?auto_22502 ) ) ( not ( = ?auto_22498 ?auto_22502 ) ) ( ON ?auto_22494 ?auto_22493 ) ( ON ?auto_22495 ?auto_22494 ) ( not ( = ?auto_22493 ?auto_22494 ) ) ( not ( = ?auto_22493 ?auto_22495 ) ) ( not ( = ?auto_22493 ?auto_22496 ) ) ( not ( = ?auto_22493 ?auto_22497 ) ) ( not ( = ?auto_22493 ?auto_22501 ) ) ( not ( = ?auto_22494 ?auto_22495 ) ) ( not ( = ?auto_22494 ?auto_22496 ) ) ( not ( = ?auto_22494 ?auto_22497 ) ) ( not ( = ?auto_22494 ?auto_22501 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22495 ?auto_22496 ?auto_22497 )
      ( MAKE-4CRATE-VERIFY ?auto_22493 ?auto_22494 ?auto_22495 ?auto_22496 ?auto_22497 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22506 - SURFACE
      ?auto_22507 - SURFACE
      ?auto_22508 - SURFACE
      ?auto_22509 - SURFACE
      ?auto_22510 - SURFACE
      ?auto_22511 - SURFACE
    )
    :vars
    (
      ?auto_22514 - HOIST
      ?auto_22519 - PLACE
      ?auto_22513 - PLACE
      ?auto_22512 - HOIST
      ?auto_22515 - SURFACE
      ?auto_22517 - TRUCK
      ?auto_22518 - PLACE
      ?auto_22516 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22514 ?auto_22519 ) ( IS-CRATE ?auto_22511 ) ( not ( = ?auto_22510 ?auto_22511 ) ) ( not ( = ?auto_22509 ?auto_22510 ) ) ( not ( = ?auto_22509 ?auto_22511 ) ) ( not ( = ?auto_22513 ?auto_22519 ) ) ( HOIST-AT ?auto_22512 ?auto_22513 ) ( not ( = ?auto_22514 ?auto_22512 ) ) ( AVAILABLE ?auto_22512 ) ( SURFACE-AT ?auto_22511 ?auto_22513 ) ( ON ?auto_22511 ?auto_22515 ) ( CLEAR ?auto_22511 ) ( not ( = ?auto_22510 ?auto_22515 ) ) ( not ( = ?auto_22511 ?auto_22515 ) ) ( not ( = ?auto_22509 ?auto_22515 ) ) ( SURFACE-AT ?auto_22509 ?auto_22519 ) ( CLEAR ?auto_22509 ) ( IS-CRATE ?auto_22510 ) ( AVAILABLE ?auto_22514 ) ( TRUCK-AT ?auto_22517 ?auto_22518 ) ( not ( = ?auto_22518 ?auto_22519 ) ) ( not ( = ?auto_22513 ?auto_22518 ) ) ( HOIST-AT ?auto_22516 ?auto_22518 ) ( LIFTING ?auto_22516 ?auto_22510 ) ( not ( = ?auto_22514 ?auto_22516 ) ) ( not ( = ?auto_22512 ?auto_22516 ) ) ( ON ?auto_22507 ?auto_22506 ) ( ON ?auto_22508 ?auto_22507 ) ( ON ?auto_22509 ?auto_22508 ) ( not ( = ?auto_22506 ?auto_22507 ) ) ( not ( = ?auto_22506 ?auto_22508 ) ) ( not ( = ?auto_22506 ?auto_22509 ) ) ( not ( = ?auto_22506 ?auto_22510 ) ) ( not ( = ?auto_22506 ?auto_22511 ) ) ( not ( = ?auto_22506 ?auto_22515 ) ) ( not ( = ?auto_22507 ?auto_22508 ) ) ( not ( = ?auto_22507 ?auto_22509 ) ) ( not ( = ?auto_22507 ?auto_22510 ) ) ( not ( = ?auto_22507 ?auto_22511 ) ) ( not ( = ?auto_22507 ?auto_22515 ) ) ( not ( = ?auto_22508 ?auto_22509 ) ) ( not ( = ?auto_22508 ?auto_22510 ) ) ( not ( = ?auto_22508 ?auto_22511 ) ) ( not ( = ?auto_22508 ?auto_22515 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22509 ?auto_22510 ?auto_22511 )
      ( MAKE-5CRATE-VERIFY ?auto_22506 ?auto_22507 ?auto_22508 ?auto_22509 ?auto_22510 ?auto_22511 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22520 - SURFACE
      ?auto_22521 - SURFACE
    )
    :vars
    (
      ?auto_22524 - HOIST
      ?auto_22530 - PLACE
      ?auto_22527 - SURFACE
      ?auto_22523 - PLACE
      ?auto_22522 - HOIST
      ?auto_22525 - SURFACE
      ?auto_22528 - TRUCK
      ?auto_22529 - PLACE
      ?auto_22526 - HOIST
      ?auto_22531 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22524 ?auto_22530 ) ( IS-CRATE ?auto_22521 ) ( not ( = ?auto_22520 ?auto_22521 ) ) ( not ( = ?auto_22527 ?auto_22520 ) ) ( not ( = ?auto_22527 ?auto_22521 ) ) ( not ( = ?auto_22523 ?auto_22530 ) ) ( HOIST-AT ?auto_22522 ?auto_22523 ) ( not ( = ?auto_22524 ?auto_22522 ) ) ( AVAILABLE ?auto_22522 ) ( SURFACE-AT ?auto_22521 ?auto_22523 ) ( ON ?auto_22521 ?auto_22525 ) ( CLEAR ?auto_22521 ) ( not ( = ?auto_22520 ?auto_22525 ) ) ( not ( = ?auto_22521 ?auto_22525 ) ) ( not ( = ?auto_22527 ?auto_22525 ) ) ( SURFACE-AT ?auto_22527 ?auto_22530 ) ( CLEAR ?auto_22527 ) ( IS-CRATE ?auto_22520 ) ( AVAILABLE ?auto_22524 ) ( TRUCK-AT ?auto_22528 ?auto_22529 ) ( not ( = ?auto_22529 ?auto_22530 ) ) ( not ( = ?auto_22523 ?auto_22529 ) ) ( HOIST-AT ?auto_22526 ?auto_22529 ) ( not ( = ?auto_22524 ?auto_22526 ) ) ( not ( = ?auto_22522 ?auto_22526 ) ) ( AVAILABLE ?auto_22526 ) ( SURFACE-AT ?auto_22520 ?auto_22529 ) ( ON ?auto_22520 ?auto_22531 ) ( CLEAR ?auto_22520 ) ( not ( = ?auto_22520 ?auto_22531 ) ) ( not ( = ?auto_22521 ?auto_22531 ) ) ( not ( = ?auto_22527 ?auto_22531 ) ) ( not ( = ?auto_22525 ?auto_22531 ) ) )
    :subtasks
    ( ( !LIFT ?auto_22526 ?auto_22520 ?auto_22531 ?auto_22529 )
      ( MAKE-2CRATE ?auto_22527 ?auto_22520 ?auto_22521 )
      ( MAKE-1CRATE-VERIFY ?auto_22520 ?auto_22521 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22532 - SURFACE
      ?auto_22533 - SURFACE
      ?auto_22534 - SURFACE
    )
    :vars
    (
      ?auto_22535 - HOIST
      ?auto_22542 - PLACE
      ?auto_22541 - PLACE
      ?auto_22537 - HOIST
      ?auto_22538 - SURFACE
      ?auto_22539 - TRUCK
      ?auto_22540 - PLACE
      ?auto_22543 - HOIST
      ?auto_22536 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22535 ?auto_22542 ) ( IS-CRATE ?auto_22534 ) ( not ( = ?auto_22533 ?auto_22534 ) ) ( not ( = ?auto_22532 ?auto_22533 ) ) ( not ( = ?auto_22532 ?auto_22534 ) ) ( not ( = ?auto_22541 ?auto_22542 ) ) ( HOIST-AT ?auto_22537 ?auto_22541 ) ( not ( = ?auto_22535 ?auto_22537 ) ) ( AVAILABLE ?auto_22537 ) ( SURFACE-AT ?auto_22534 ?auto_22541 ) ( ON ?auto_22534 ?auto_22538 ) ( CLEAR ?auto_22534 ) ( not ( = ?auto_22533 ?auto_22538 ) ) ( not ( = ?auto_22534 ?auto_22538 ) ) ( not ( = ?auto_22532 ?auto_22538 ) ) ( SURFACE-AT ?auto_22532 ?auto_22542 ) ( CLEAR ?auto_22532 ) ( IS-CRATE ?auto_22533 ) ( AVAILABLE ?auto_22535 ) ( TRUCK-AT ?auto_22539 ?auto_22540 ) ( not ( = ?auto_22540 ?auto_22542 ) ) ( not ( = ?auto_22541 ?auto_22540 ) ) ( HOIST-AT ?auto_22543 ?auto_22540 ) ( not ( = ?auto_22535 ?auto_22543 ) ) ( not ( = ?auto_22537 ?auto_22543 ) ) ( AVAILABLE ?auto_22543 ) ( SURFACE-AT ?auto_22533 ?auto_22540 ) ( ON ?auto_22533 ?auto_22536 ) ( CLEAR ?auto_22533 ) ( not ( = ?auto_22533 ?auto_22536 ) ) ( not ( = ?auto_22534 ?auto_22536 ) ) ( not ( = ?auto_22532 ?auto_22536 ) ) ( not ( = ?auto_22538 ?auto_22536 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22533 ?auto_22534 )
      ( MAKE-2CRATE-VERIFY ?auto_22532 ?auto_22533 ?auto_22534 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22544 - SURFACE
      ?auto_22545 - SURFACE
      ?auto_22546 - SURFACE
      ?auto_22547 - SURFACE
    )
    :vars
    (
      ?auto_22548 - HOIST
      ?auto_22554 - PLACE
      ?auto_22551 - PLACE
      ?auto_22552 - HOIST
      ?auto_22550 - SURFACE
      ?auto_22549 - TRUCK
      ?auto_22555 - PLACE
      ?auto_22553 - HOIST
      ?auto_22556 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22548 ?auto_22554 ) ( IS-CRATE ?auto_22547 ) ( not ( = ?auto_22546 ?auto_22547 ) ) ( not ( = ?auto_22545 ?auto_22546 ) ) ( not ( = ?auto_22545 ?auto_22547 ) ) ( not ( = ?auto_22551 ?auto_22554 ) ) ( HOIST-AT ?auto_22552 ?auto_22551 ) ( not ( = ?auto_22548 ?auto_22552 ) ) ( AVAILABLE ?auto_22552 ) ( SURFACE-AT ?auto_22547 ?auto_22551 ) ( ON ?auto_22547 ?auto_22550 ) ( CLEAR ?auto_22547 ) ( not ( = ?auto_22546 ?auto_22550 ) ) ( not ( = ?auto_22547 ?auto_22550 ) ) ( not ( = ?auto_22545 ?auto_22550 ) ) ( SURFACE-AT ?auto_22545 ?auto_22554 ) ( CLEAR ?auto_22545 ) ( IS-CRATE ?auto_22546 ) ( AVAILABLE ?auto_22548 ) ( TRUCK-AT ?auto_22549 ?auto_22555 ) ( not ( = ?auto_22555 ?auto_22554 ) ) ( not ( = ?auto_22551 ?auto_22555 ) ) ( HOIST-AT ?auto_22553 ?auto_22555 ) ( not ( = ?auto_22548 ?auto_22553 ) ) ( not ( = ?auto_22552 ?auto_22553 ) ) ( AVAILABLE ?auto_22553 ) ( SURFACE-AT ?auto_22546 ?auto_22555 ) ( ON ?auto_22546 ?auto_22556 ) ( CLEAR ?auto_22546 ) ( not ( = ?auto_22546 ?auto_22556 ) ) ( not ( = ?auto_22547 ?auto_22556 ) ) ( not ( = ?auto_22545 ?auto_22556 ) ) ( not ( = ?auto_22550 ?auto_22556 ) ) ( ON ?auto_22545 ?auto_22544 ) ( not ( = ?auto_22544 ?auto_22545 ) ) ( not ( = ?auto_22544 ?auto_22546 ) ) ( not ( = ?auto_22544 ?auto_22547 ) ) ( not ( = ?auto_22544 ?auto_22550 ) ) ( not ( = ?auto_22544 ?auto_22556 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22545 ?auto_22546 ?auto_22547 )
      ( MAKE-3CRATE-VERIFY ?auto_22544 ?auto_22545 ?auto_22546 ?auto_22547 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22557 - SURFACE
      ?auto_22558 - SURFACE
      ?auto_22559 - SURFACE
      ?auto_22560 - SURFACE
      ?auto_22561 - SURFACE
    )
    :vars
    (
      ?auto_22562 - HOIST
      ?auto_22568 - PLACE
      ?auto_22565 - PLACE
      ?auto_22566 - HOIST
      ?auto_22564 - SURFACE
      ?auto_22563 - TRUCK
      ?auto_22569 - PLACE
      ?auto_22567 - HOIST
      ?auto_22570 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22562 ?auto_22568 ) ( IS-CRATE ?auto_22561 ) ( not ( = ?auto_22560 ?auto_22561 ) ) ( not ( = ?auto_22559 ?auto_22560 ) ) ( not ( = ?auto_22559 ?auto_22561 ) ) ( not ( = ?auto_22565 ?auto_22568 ) ) ( HOIST-AT ?auto_22566 ?auto_22565 ) ( not ( = ?auto_22562 ?auto_22566 ) ) ( AVAILABLE ?auto_22566 ) ( SURFACE-AT ?auto_22561 ?auto_22565 ) ( ON ?auto_22561 ?auto_22564 ) ( CLEAR ?auto_22561 ) ( not ( = ?auto_22560 ?auto_22564 ) ) ( not ( = ?auto_22561 ?auto_22564 ) ) ( not ( = ?auto_22559 ?auto_22564 ) ) ( SURFACE-AT ?auto_22559 ?auto_22568 ) ( CLEAR ?auto_22559 ) ( IS-CRATE ?auto_22560 ) ( AVAILABLE ?auto_22562 ) ( TRUCK-AT ?auto_22563 ?auto_22569 ) ( not ( = ?auto_22569 ?auto_22568 ) ) ( not ( = ?auto_22565 ?auto_22569 ) ) ( HOIST-AT ?auto_22567 ?auto_22569 ) ( not ( = ?auto_22562 ?auto_22567 ) ) ( not ( = ?auto_22566 ?auto_22567 ) ) ( AVAILABLE ?auto_22567 ) ( SURFACE-AT ?auto_22560 ?auto_22569 ) ( ON ?auto_22560 ?auto_22570 ) ( CLEAR ?auto_22560 ) ( not ( = ?auto_22560 ?auto_22570 ) ) ( not ( = ?auto_22561 ?auto_22570 ) ) ( not ( = ?auto_22559 ?auto_22570 ) ) ( not ( = ?auto_22564 ?auto_22570 ) ) ( ON ?auto_22558 ?auto_22557 ) ( ON ?auto_22559 ?auto_22558 ) ( not ( = ?auto_22557 ?auto_22558 ) ) ( not ( = ?auto_22557 ?auto_22559 ) ) ( not ( = ?auto_22557 ?auto_22560 ) ) ( not ( = ?auto_22557 ?auto_22561 ) ) ( not ( = ?auto_22557 ?auto_22564 ) ) ( not ( = ?auto_22557 ?auto_22570 ) ) ( not ( = ?auto_22558 ?auto_22559 ) ) ( not ( = ?auto_22558 ?auto_22560 ) ) ( not ( = ?auto_22558 ?auto_22561 ) ) ( not ( = ?auto_22558 ?auto_22564 ) ) ( not ( = ?auto_22558 ?auto_22570 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22559 ?auto_22560 ?auto_22561 )
      ( MAKE-4CRATE-VERIFY ?auto_22557 ?auto_22558 ?auto_22559 ?auto_22560 ?auto_22561 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22571 - SURFACE
      ?auto_22572 - SURFACE
      ?auto_22573 - SURFACE
      ?auto_22574 - SURFACE
      ?auto_22575 - SURFACE
      ?auto_22576 - SURFACE
    )
    :vars
    (
      ?auto_22577 - HOIST
      ?auto_22583 - PLACE
      ?auto_22580 - PLACE
      ?auto_22581 - HOIST
      ?auto_22579 - SURFACE
      ?auto_22578 - TRUCK
      ?auto_22584 - PLACE
      ?auto_22582 - HOIST
      ?auto_22585 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22577 ?auto_22583 ) ( IS-CRATE ?auto_22576 ) ( not ( = ?auto_22575 ?auto_22576 ) ) ( not ( = ?auto_22574 ?auto_22575 ) ) ( not ( = ?auto_22574 ?auto_22576 ) ) ( not ( = ?auto_22580 ?auto_22583 ) ) ( HOIST-AT ?auto_22581 ?auto_22580 ) ( not ( = ?auto_22577 ?auto_22581 ) ) ( AVAILABLE ?auto_22581 ) ( SURFACE-AT ?auto_22576 ?auto_22580 ) ( ON ?auto_22576 ?auto_22579 ) ( CLEAR ?auto_22576 ) ( not ( = ?auto_22575 ?auto_22579 ) ) ( not ( = ?auto_22576 ?auto_22579 ) ) ( not ( = ?auto_22574 ?auto_22579 ) ) ( SURFACE-AT ?auto_22574 ?auto_22583 ) ( CLEAR ?auto_22574 ) ( IS-CRATE ?auto_22575 ) ( AVAILABLE ?auto_22577 ) ( TRUCK-AT ?auto_22578 ?auto_22584 ) ( not ( = ?auto_22584 ?auto_22583 ) ) ( not ( = ?auto_22580 ?auto_22584 ) ) ( HOIST-AT ?auto_22582 ?auto_22584 ) ( not ( = ?auto_22577 ?auto_22582 ) ) ( not ( = ?auto_22581 ?auto_22582 ) ) ( AVAILABLE ?auto_22582 ) ( SURFACE-AT ?auto_22575 ?auto_22584 ) ( ON ?auto_22575 ?auto_22585 ) ( CLEAR ?auto_22575 ) ( not ( = ?auto_22575 ?auto_22585 ) ) ( not ( = ?auto_22576 ?auto_22585 ) ) ( not ( = ?auto_22574 ?auto_22585 ) ) ( not ( = ?auto_22579 ?auto_22585 ) ) ( ON ?auto_22572 ?auto_22571 ) ( ON ?auto_22573 ?auto_22572 ) ( ON ?auto_22574 ?auto_22573 ) ( not ( = ?auto_22571 ?auto_22572 ) ) ( not ( = ?auto_22571 ?auto_22573 ) ) ( not ( = ?auto_22571 ?auto_22574 ) ) ( not ( = ?auto_22571 ?auto_22575 ) ) ( not ( = ?auto_22571 ?auto_22576 ) ) ( not ( = ?auto_22571 ?auto_22579 ) ) ( not ( = ?auto_22571 ?auto_22585 ) ) ( not ( = ?auto_22572 ?auto_22573 ) ) ( not ( = ?auto_22572 ?auto_22574 ) ) ( not ( = ?auto_22572 ?auto_22575 ) ) ( not ( = ?auto_22572 ?auto_22576 ) ) ( not ( = ?auto_22572 ?auto_22579 ) ) ( not ( = ?auto_22572 ?auto_22585 ) ) ( not ( = ?auto_22573 ?auto_22574 ) ) ( not ( = ?auto_22573 ?auto_22575 ) ) ( not ( = ?auto_22573 ?auto_22576 ) ) ( not ( = ?auto_22573 ?auto_22579 ) ) ( not ( = ?auto_22573 ?auto_22585 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22574 ?auto_22575 ?auto_22576 )
      ( MAKE-5CRATE-VERIFY ?auto_22571 ?auto_22572 ?auto_22573 ?auto_22574 ?auto_22575 ?auto_22576 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22586 - SURFACE
      ?auto_22587 - SURFACE
    )
    :vars
    (
      ?auto_22588 - HOIST
      ?auto_22595 - PLACE
      ?auto_22589 - SURFACE
      ?auto_22592 - PLACE
      ?auto_22593 - HOIST
      ?auto_22591 - SURFACE
      ?auto_22596 - PLACE
      ?auto_22594 - HOIST
      ?auto_22597 - SURFACE
      ?auto_22590 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22588 ?auto_22595 ) ( IS-CRATE ?auto_22587 ) ( not ( = ?auto_22586 ?auto_22587 ) ) ( not ( = ?auto_22589 ?auto_22586 ) ) ( not ( = ?auto_22589 ?auto_22587 ) ) ( not ( = ?auto_22592 ?auto_22595 ) ) ( HOIST-AT ?auto_22593 ?auto_22592 ) ( not ( = ?auto_22588 ?auto_22593 ) ) ( AVAILABLE ?auto_22593 ) ( SURFACE-AT ?auto_22587 ?auto_22592 ) ( ON ?auto_22587 ?auto_22591 ) ( CLEAR ?auto_22587 ) ( not ( = ?auto_22586 ?auto_22591 ) ) ( not ( = ?auto_22587 ?auto_22591 ) ) ( not ( = ?auto_22589 ?auto_22591 ) ) ( SURFACE-AT ?auto_22589 ?auto_22595 ) ( CLEAR ?auto_22589 ) ( IS-CRATE ?auto_22586 ) ( AVAILABLE ?auto_22588 ) ( not ( = ?auto_22596 ?auto_22595 ) ) ( not ( = ?auto_22592 ?auto_22596 ) ) ( HOIST-AT ?auto_22594 ?auto_22596 ) ( not ( = ?auto_22588 ?auto_22594 ) ) ( not ( = ?auto_22593 ?auto_22594 ) ) ( AVAILABLE ?auto_22594 ) ( SURFACE-AT ?auto_22586 ?auto_22596 ) ( ON ?auto_22586 ?auto_22597 ) ( CLEAR ?auto_22586 ) ( not ( = ?auto_22586 ?auto_22597 ) ) ( not ( = ?auto_22587 ?auto_22597 ) ) ( not ( = ?auto_22589 ?auto_22597 ) ) ( not ( = ?auto_22591 ?auto_22597 ) ) ( TRUCK-AT ?auto_22590 ?auto_22595 ) )
    :subtasks
    ( ( !DRIVE ?auto_22590 ?auto_22595 ?auto_22596 )
      ( MAKE-2CRATE ?auto_22589 ?auto_22586 ?auto_22587 )
      ( MAKE-1CRATE-VERIFY ?auto_22586 ?auto_22587 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22598 - SURFACE
      ?auto_22599 - SURFACE
      ?auto_22600 - SURFACE
    )
    :vars
    (
      ?auto_22604 - HOIST
      ?auto_22603 - PLACE
      ?auto_22607 - PLACE
      ?auto_22608 - HOIST
      ?auto_22602 - SURFACE
      ?auto_22601 - PLACE
      ?auto_22609 - HOIST
      ?auto_22606 - SURFACE
      ?auto_22605 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22604 ?auto_22603 ) ( IS-CRATE ?auto_22600 ) ( not ( = ?auto_22599 ?auto_22600 ) ) ( not ( = ?auto_22598 ?auto_22599 ) ) ( not ( = ?auto_22598 ?auto_22600 ) ) ( not ( = ?auto_22607 ?auto_22603 ) ) ( HOIST-AT ?auto_22608 ?auto_22607 ) ( not ( = ?auto_22604 ?auto_22608 ) ) ( AVAILABLE ?auto_22608 ) ( SURFACE-AT ?auto_22600 ?auto_22607 ) ( ON ?auto_22600 ?auto_22602 ) ( CLEAR ?auto_22600 ) ( not ( = ?auto_22599 ?auto_22602 ) ) ( not ( = ?auto_22600 ?auto_22602 ) ) ( not ( = ?auto_22598 ?auto_22602 ) ) ( SURFACE-AT ?auto_22598 ?auto_22603 ) ( CLEAR ?auto_22598 ) ( IS-CRATE ?auto_22599 ) ( AVAILABLE ?auto_22604 ) ( not ( = ?auto_22601 ?auto_22603 ) ) ( not ( = ?auto_22607 ?auto_22601 ) ) ( HOIST-AT ?auto_22609 ?auto_22601 ) ( not ( = ?auto_22604 ?auto_22609 ) ) ( not ( = ?auto_22608 ?auto_22609 ) ) ( AVAILABLE ?auto_22609 ) ( SURFACE-AT ?auto_22599 ?auto_22601 ) ( ON ?auto_22599 ?auto_22606 ) ( CLEAR ?auto_22599 ) ( not ( = ?auto_22599 ?auto_22606 ) ) ( not ( = ?auto_22600 ?auto_22606 ) ) ( not ( = ?auto_22598 ?auto_22606 ) ) ( not ( = ?auto_22602 ?auto_22606 ) ) ( TRUCK-AT ?auto_22605 ?auto_22603 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22599 ?auto_22600 )
      ( MAKE-2CRATE-VERIFY ?auto_22598 ?auto_22599 ?auto_22600 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22610 - SURFACE
      ?auto_22611 - SURFACE
      ?auto_22612 - SURFACE
      ?auto_22613 - SURFACE
    )
    :vars
    (
      ?auto_22614 - HOIST
      ?auto_22622 - PLACE
      ?auto_22616 - PLACE
      ?auto_22621 - HOIST
      ?auto_22620 - SURFACE
      ?auto_22617 - PLACE
      ?auto_22618 - HOIST
      ?auto_22615 - SURFACE
      ?auto_22619 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22614 ?auto_22622 ) ( IS-CRATE ?auto_22613 ) ( not ( = ?auto_22612 ?auto_22613 ) ) ( not ( = ?auto_22611 ?auto_22612 ) ) ( not ( = ?auto_22611 ?auto_22613 ) ) ( not ( = ?auto_22616 ?auto_22622 ) ) ( HOIST-AT ?auto_22621 ?auto_22616 ) ( not ( = ?auto_22614 ?auto_22621 ) ) ( AVAILABLE ?auto_22621 ) ( SURFACE-AT ?auto_22613 ?auto_22616 ) ( ON ?auto_22613 ?auto_22620 ) ( CLEAR ?auto_22613 ) ( not ( = ?auto_22612 ?auto_22620 ) ) ( not ( = ?auto_22613 ?auto_22620 ) ) ( not ( = ?auto_22611 ?auto_22620 ) ) ( SURFACE-AT ?auto_22611 ?auto_22622 ) ( CLEAR ?auto_22611 ) ( IS-CRATE ?auto_22612 ) ( AVAILABLE ?auto_22614 ) ( not ( = ?auto_22617 ?auto_22622 ) ) ( not ( = ?auto_22616 ?auto_22617 ) ) ( HOIST-AT ?auto_22618 ?auto_22617 ) ( not ( = ?auto_22614 ?auto_22618 ) ) ( not ( = ?auto_22621 ?auto_22618 ) ) ( AVAILABLE ?auto_22618 ) ( SURFACE-AT ?auto_22612 ?auto_22617 ) ( ON ?auto_22612 ?auto_22615 ) ( CLEAR ?auto_22612 ) ( not ( = ?auto_22612 ?auto_22615 ) ) ( not ( = ?auto_22613 ?auto_22615 ) ) ( not ( = ?auto_22611 ?auto_22615 ) ) ( not ( = ?auto_22620 ?auto_22615 ) ) ( TRUCK-AT ?auto_22619 ?auto_22622 ) ( ON ?auto_22611 ?auto_22610 ) ( not ( = ?auto_22610 ?auto_22611 ) ) ( not ( = ?auto_22610 ?auto_22612 ) ) ( not ( = ?auto_22610 ?auto_22613 ) ) ( not ( = ?auto_22610 ?auto_22620 ) ) ( not ( = ?auto_22610 ?auto_22615 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22611 ?auto_22612 ?auto_22613 )
      ( MAKE-3CRATE-VERIFY ?auto_22610 ?auto_22611 ?auto_22612 ?auto_22613 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22623 - SURFACE
      ?auto_22624 - SURFACE
      ?auto_22625 - SURFACE
      ?auto_22626 - SURFACE
      ?auto_22627 - SURFACE
    )
    :vars
    (
      ?auto_22628 - HOIST
      ?auto_22636 - PLACE
      ?auto_22630 - PLACE
      ?auto_22635 - HOIST
      ?auto_22634 - SURFACE
      ?auto_22631 - PLACE
      ?auto_22632 - HOIST
      ?auto_22629 - SURFACE
      ?auto_22633 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22628 ?auto_22636 ) ( IS-CRATE ?auto_22627 ) ( not ( = ?auto_22626 ?auto_22627 ) ) ( not ( = ?auto_22625 ?auto_22626 ) ) ( not ( = ?auto_22625 ?auto_22627 ) ) ( not ( = ?auto_22630 ?auto_22636 ) ) ( HOIST-AT ?auto_22635 ?auto_22630 ) ( not ( = ?auto_22628 ?auto_22635 ) ) ( AVAILABLE ?auto_22635 ) ( SURFACE-AT ?auto_22627 ?auto_22630 ) ( ON ?auto_22627 ?auto_22634 ) ( CLEAR ?auto_22627 ) ( not ( = ?auto_22626 ?auto_22634 ) ) ( not ( = ?auto_22627 ?auto_22634 ) ) ( not ( = ?auto_22625 ?auto_22634 ) ) ( SURFACE-AT ?auto_22625 ?auto_22636 ) ( CLEAR ?auto_22625 ) ( IS-CRATE ?auto_22626 ) ( AVAILABLE ?auto_22628 ) ( not ( = ?auto_22631 ?auto_22636 ) ) ( not ( = ?auto_22630 ?auto_22631 ) ) ( HOIST-AT ?auto_22632 ?auto_22631 ) ( not ( = ?auto_22628 ?auto_22632 ) ) ( not ( = ?auto_22635 ?auto_22632 ) ) ( AVAILABLE ?auto_22632 ) ( SURFACE-AT ?auto_22626 ?auto_22631 ) ( ON ?auto_22626 ?auto_22629 ) ( CLEAR ?auto_22626 ) ( not ( = ?auto_22626 ?auto_22629 ) ) ( not ( = ?auto_22627 ?auto_22629 ) ) ( not ( = ?auto_22625 ?auto_22629 ) ) ( not ( = ?auto_22634 ?auto_22629 ) ) ( TRUCK-AT ?auto_22633 ?auto_22636 ) ( ON ?auto_22624 ?auto_22623 ) ( ON ?auto_22625 ?auto_22624 ) ( not ( = ?auto_22623 ?auto_22624 ) ) ( not ( = ?auto_22623 ?auto_22625 ) ) ( not ( = ?auto_22623 ?auto_22626 ) ) ( not ( = ?auto_22623 ?auto_22627 ) ) ( not ( = ?auto_22623 ?auto_22634 ) ) ( not ( = ?auto_22623 ?auto_22629 ) ) ( not ( = ?auto_22624 ?auto_22625 ) ) ( not ( = ?auto_22624 ?auto_22626 ) ) ( not ( = ?auto_22624 ?auto_22627 ) ) ( not ( = ?auto_22624 ?auto_22634 ) ) ( not ( = ?auto_22624 ?auto_22629 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22625 ?auto_22626 ?auto_22627 )
      ( MAKE-4CRATE-VERIFY ?auto_22623 ?auto_22624 ?auto_22625 ?auto_22626 ?auto_22627 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22637 - SURFACE
      ?auto_22638 - SURFACE
      ?auto_22639 - SURFACE
      ?auto_22640 - SURFACE
      ?auto_22641 - SURFACE
      ?auto_22642 - SURFACE
    )
    :vars
    (
      ?auto_22643 - HOIST
      ?auto_22651 - PLACE
      ?auto_22645 - PLACE
      ?auto_22650 - HOIST
      ?auto_22649 - SURFACE
      ?auto_22646 - PLACE
      ?auto_22647 - HOIST
      ?auto_22644 - SURFACE
      ?auto_22648 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22643 ?auto_22651 ) ( IS-CRATE ?auto_22642 ) ( not ( = ?auto_22641 ?auto_22642 ) ) ( not ( = ?auto_22640 ?auto_22641 ) ) ( not ( = ?auto_22640 ?auto_22642 ) ) ( not ( = ?auto_22645 ?auto_22651 ) ) ( HOIST-AT ?auto_22650 ?auto_22645 ) ( not ( = ?auto_22643 ?auto_22650 ) ) ( AVAILABLE ?auto_22650 ) ( SURFACE-AT ?auto_22642 ?auto_22645 ) ( ON ?auto_22642 ?auto_22649 ) ( CLEAR ?auto_22642 ) ( not ( = ?auto_22641 ?auto_22649 ) ) ( not ( = ?auto_22642 ?auto_22649 ) ) ( not ( = ?auto_22640 ?auto_22649 ) ) ( SURFACE-AT ?auto_22640 ?auto_22651 ) ( CLEAR ?auto_22640 ) ( IS-CRATE ?auto_22641 ) ( AVAILABLE ?auto_22643 ) ( not ( = ?auto_22646 ?auto_22651 ) ) ( not ( = ?auto_22645 ?auto_22646 ) ) ( HOIST-AT ?auto_22647 ?auto_22646 ) ( not ( = ?auto_22643 ?auto_22647 ) ) ( not ( = ?auto_22650 ?auto_22647 ) ) ( AVAILABLE ?auto_22647 ) ( SURFACE-AT ?auto_22641 ?auto_22646 ) ( ON ?auto_22641 ?auto_22644 ) ( CLEAR ?auto_22641 ) ( not ( = ?auto_22641 ?auto_22644 ) ) ( not ( = ?auto_22642 ?auto_22644 ) ) ( not ( = ?auto_22640 ?auto_22644 ) ) ( not ( = ?auto_22649 ?auto_22644 ) ) ( TRUCK-AT ?auto_22648 ?auto_22651 ) ( ON ?auto_22638 ?auto_22637 ) ( ON ?auto_22639 ?auto_22638 ) ( ON ?auto_22640 ?auto_22639 ) ( not ( = ?auto_22637 ?auto_22638 ) ) ( not ( = ?auto_22637 ?auto_22639 ) ) ( not ( = ?auto_22637 ?auto_22640 ) ) ( not ( = ?auto_22637 ?auto_22641 ) ) ( not ( = ?auto_22637 ?auto_22642 ) ) ( not ( = ?auto_22637 ?auto_22649 ) ) ( not ( = ?auto_22637 ?auto_22644 ) ) ( not ( = ?auto_22638 ?auto_22639 ) ) ( not ( = ?auto_22638 ?auto_22640 ) ) ( not ( = ?auto_22638 ?auto_22641 ) ) ( not ( = ?auto_22638 ?auto_22642 ) ) ( not ( = ?auto_22638 ?auto_22649 ) ) ( not ( = ?auto_22638 ?auto_22644 ) ) ( not ( = ?auto_22639 ?auto_22640 ) ) ( not ( = ?auto_22639 ?auto_22641 ) ) ( not ( = ?auto_22639 ?auto_22642 ) ) ( not ( = ?auto_22639 ?auto_22649 ) ) ( not ( = ?auto_22639 ?auto_22644 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22640 ?auto_22641 ?auto_22642 )
      ( MAKE-5CRATE-VERIFY ?auto_22637 ?auto_22638 ?auto_22639 ?auto_22640 ?auto_22641 ?auto_22642 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22652 - SURFACE
      ?auto_22653 - SURFACE
    )
    :vars
    (
      ?auto_22654 - HOIST
      ?auto_22663 - PLACE
      ?auto_22661 - SURFACE
      ?auto_22656 - PLACE
      ?auto_22662 - HOIST
      ?auto_22660 - SURFACE
      ?auto_22657 - PLACE
      ?auto_22658 - HOIST
      ?auto_22655 - SURFACE
      ?auto_22659 - TRUCK
      ?auto_22664 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22654 ?auto_22663 ) ( IS-CRATE ?auto_22653 ) ( not ( = ?auto_22652 ?auto_22653 ) ) ( not ( = ?auto_22661 ?auto_22652 ) ) ( not ( = ?auto_22661 ?auto_22653 ) ) ( not ( = ?auto_22656 ?auto_22663 ) ) ( HOIST-AT ?auto_22662 ?auto_22656 ) ( not ( = ?auto_22654 ?auto_22662 ) ) ( AVAILABLE ?auto_22662 ) ( SURFACE-AT ?auto_22653 ?auto_22656 ) ( ON ?auto_22653 ?auto_22660 ) ( CLEAR ?auto_22653 ) ( not ( = ?auto_22652 ?auto_22660 ) ) ( not ( = ?auto_22653 ?auto_22660 ) ) ( not ( = ?auto_22661 ?auto_22660 ) ) ( IS-CRATE ?auto_22652 ) ( not ( = ?auto_22657 ?auto_22663 ) ) ( not ( = ?auto_22656 ?auto_22657 ) ) ( HOIST-AT ?auto_22658 ?auto_22657 ) ( not ( = ?auto_22654 ?auto_22658 ) ) ( not ( = ?auto_22662 ?auto_22658 ) ) ( AVAILABLE ?auto_22658 ) ( SURFACE-AT ?auto_22652 ?auto_22657 ) ( ON ?auto_22652 ?auto_22655 ) ( CLEAR ?auto_22652 ) ( not ( = ?auto_22652 ?auto_22655 ) ) ( not ( = ?auto_22653 ?auto_22655 ) ) ( not ( = ?auto_22661 ?auto_22655 ) ) ( not ( = ?auto_22660 ?auto_22655 ) ) ( TRUCK-AT ?auto_22659 ?auto_22663 ) ( SURFACE-AT ?auto_22664 ?auto_22663 ) ( CLEAR ?auto_22664 ) ( LIFTING ?auto_22654 ?auto_22661 ) ( IS-CRATE ?auto_22661 ) ( not ( = ?auto_22664 ?auto_22661 ) ) ( not ( = ?auto_22652 ?auto_22664 ) ) ( not ( = ?auto_22653 ?auto_22664 ) ) ( not ( = ?auto_22660 ?auto_22664 ) ) ( not ( = ?auto_22655 ?auto_22664 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22664 ?auto_22661 )
      ( MAKE-2CRATE ?auto_22661 ?auto_22652 ?auto_22653 )
      ( MAKE-1CRATE-VERIFY ?auto_22652 ?auto_22653 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22665 - SURFACE
      ?auto_22666 - SURFACE
      ?auto_22667 - SURFACE
    )
    :vars
    (
      ?auto_22673 - HOIST
      ?auto_22671 - PLACE
      ?auto_22675 - PLACE
      ?auto_22676 - HOIST
      ?auto_22674 - SURFACE
      ?auto_22668 - PLACE
      ?auto_22670 - HOIST
      ?auto_22677 - SURFACE
      ?auto_22669 - TRUCK
      ?auto_22672 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22673 ?auto_22671 ) ( IS-CRATE ?auto_22667 ) ( not ( = ?auto_22666 ?auto_22667 ) ) ( not ( = ?auto_22665 ?auto_22666 ) ) ( not ( = ?auto_22665 ?auto_22667 ) ) ( not ( = ?auto_22675 ?auto_22671 ) ) ( HOIST-AT ?auto_22676 ?auto_22675 ) ( not ( = ?auto_22673 ?auto_22676 ) ) ( AVAILABLE ?auto_22676 ) ( SURFACE-AT ?auto_22667 ?auto_22675 ) ( ON ?auto_22667 ?auto_22674 ) ( CLEAR ?auto_22667 ) ( not ( = ?auto_22666 ?auto_22674 ) ) ( not ( = ?auto_22667 ?auto_22674 ) ) ( not ( = ?auto_22665 ?auto_22674 ) ) ( IS-CRATE ?auto_22666 ) ( not ( = ?auto_22668 ?auto_22671 ) ) ( not ( = ?auto_22675 ?auto_22668 ) ) ( HOIST-AT ?auto_22670 ?auto_22668 ) ( not ( = ?auto_22673 ?auto_22670 ) ) ( not ( = ?auto_22676 ?auto_22670 ) ) ( AVAILABLE ?auto_22670 ) ( SURFACE-AT ?auto_22666 ?auto_22668 ) ( ON ?auto_22666 ?auto_22677 ) ( CLEAR ?auto_22666 ) ( not ( = ?auto_22666 ?auto_22677 ) ) ( not ( = ?auto_22667 ?auto_22677 ) ) ( not ( = ?auto_22665 ?auto_22677 ) ) ( not ( = ?auto_22674 ?auto_22677 ) ) ( TRUCK-AT ?auto_22669 ?auto_22671 ) ( SURFACE-AT ?auto_22672 ?auto_22671 ) ( CLEAR ?auto_22672 ) ( LIFTING ?auto_22673 ?auto_22665 ) ( IS-CRATE ?auto_22665 ) ( not ( = ?auto_22672 ?auto_22665 ) ) ( not ( = ?auto_22666 ?auto_22672 ) ) ( not ( = ?auto_22667 ?auto_22672 ) ) ( not ( = ?auto_22674 ?auto_22672 ) ) ( not ( = ?auto_22677 ?auto_22672 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22666 ?auto_22667 )
      ( MAKE-2CRATE-VERIFY ?auto_22665 ?auto_22666 ?auto_22667 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22678 - SURFACE
      ?auto_22679 - SURFACE
      ?auto_22680 - SURFACE
      ?auto_22681 - SURFACE
    )
    :vars
    (
      ?auto_22687 - HOIST
      ?auto_22682 - PLACE
      ?auto_22688 - PLACE
      ?auto_22689 - HOIST
      ?auto_22683 - SURFACE
      ?auto_22684 - PLACE
      ?auto_22690 - HOIST
      ?auto_22686 - SURFACE
      ?auto_22685 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22687 ?auto_22682 ) ( IS-CRATE ?auto_22681 ) ( not ( = ?auto_22680 ?auto_22681 ) ) ( not ( = ?auto_22679 ?auto_22680 ) ) ( not ( = ?auto_22679 ?auto_22681 ) ) ( not ( = ?auto_22688 ?auto_22682 ) ) ( HOIST-AT ?auto_22689 ?auto_22688 ) ( not ( = ?auto_22687 ?auto_22689 ) ) ( AVAILABLE ?auto_22689 ) ( SURFACE-AT ?auto_22681 ?auto_22688 ) ( ON ?auto_22681 ?auto_22683 ) ( CLEAR ?auto_22681 ) ( not ( = ?auto_22680 ?auto_22683 ) ) ( not ( = ?auto_22681 ?auto_22683 ) ) ( not ( = ?auto_22679 ?auto_22683 ) ) ( IS-CRATE ?auto_22680 ) ( not ( = ?auto_22684 ?auto_22682 ) ) ( not ( = ?auto_22688 ?auto_22684 ) ) ( HOIST-AT ?auto_22690 ?auto_22684 ) ( not ( = ?auto_22687 ?auto_22690 ) ) ( not ( = ?auto_22689 ?auto_22690 ) ) ( AVAILABLE ?auto_22690 ) ( SURFACE-AT ?auto_22680 ?auto_22684 ) ( ON ?auto_22680 ?auto_22686 ) ( CLEAR ?auto_22680 ) ( not ( = ?auto_22680 ?auto_22686 ) ) ( not ( = ?auto_22681 ?auto_22686 ) ) ( not ( = ?auto_22679 ?auto_22686 ) ) ( not ( = ?auto_22683 ?auto_22686 ) ) ( TRUCK-AT ?auto_22685 ?auto_22682 ) ( SURFACE-AT ?auto_22678 ?auto_22682 ) ( CLEAR ?auto_22678 ) ( LIFTING ?auto_22687 ?auto_22679 ) ( IS-CRATE ?auto_22679 ) ( not ( = ?auto_22678 ?auto_22679 ) ) ( not ( = ?auto_22680 ?auto_22678 ) ) ( not ( = ?auto_22681 ?auto_22678 ) ) ( not ( = ?auto_22683 ?auto_22678 ) ) ( not ( = ?auto_22686 ?auto_22678 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22679 ?auto_22680 ?auto_22681 )
      ( MAKE-3CRATE-VERIFY ?auto_22678 ?auto_22679 ?auto_22680 ?auto_22681 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22691 - SURFACE
      ?auto_22692 - SURFACE
      ?auto_22693 - SURFACE
      ?auto_22694 - SURFACE
      ?auto_22695 - SURFACE
    )
    :vars
    (
      ?auto_22701 - HOIST
      ?auto_22696 - PLACE
      ?auto_22702 - PLACE
      ?auto_22703 - HOIST
      ?auto_22697 - SURFACE
      ?auto_22698 - PLACE
      ?auto_22704 - HOIST
      ?auto_22700 - SURFACE
      ?auto_22699 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22701 ?auto_22696 ) ( IS-CRATE ?auto_22695 ) ( not ( = ?auto_22694 ?auto_22695 ) ) ( not ( = ?auto_22693 ?auto_22694 ) ) ( not ( = ?auto_22693 ?auto_22695 ) ) ( not ( = ?auto_22702 ?auto_22696 ) ) ( HOIST-AT ?auto_22703 ?auto_22702 ) ( not ( = ?auto_22701 ?auto_22703 ) ) ( AVAILABLE ?auto_22703 ) ( SURFACE-AT ?auto_22695 ?auto_22702 ) ( ON ?auto_22695 ?auto_22697 ) ( CLEAR ?auto_22695 ) ( not ( = ?auto_22694 ?auto_22697 ) ) ( not ( = ?auto_22695 ?auto_22697 ) ) ( not ( = ?auto_22693 ?auto_22697 ) ) ( IS-CRATE ?auto_22694 ) ( not ( = ?auto_22698 ?auto_22696 ) ) ( not ( = ?auto_22702 ?auto_22698 ) ) ( HOIST-AT ?auto_22704 ?auto_22698 ) ( not ( = ?auto_22701 ?auto_22704 ) ) ( not ( = ?auto_22703 ?auto_22704 ) ) ( AVAILABLE ?auto_22704 ) ( SURFACE-AT ?auto_22694 ?auto_22698 ) ( ON ?auto_22694 ?auto_22700 ) ( CLEAR ?auto_22694 ) ( not ( = ?auto_22694 ?auto_22700 ) ) ( not ( = ?auto_22695 ?auto_22700 ) ) ( not ( = ?auto_22693 ?auto_22700 ) ) ( not ( = ?auto_22697 ?auto_22700 ) ) ( TRUCK-AT ?auto_22699 ?auto_22696 ) ( SURFACE-AT ?auto_22692 ?auto_22696 ) ( CLEAR ?auto_22692 ) ( LIFTING ?auto_22701 ?auto_22693 ) ( IS-CRATE ?auto_22693 ) ( not ( = ?auto_22692 ?auto_22693 ) ) ( not ( = ?auto_22694 ?auto_22692 ) ) ( not ( = ?auto_22695 ?auto_22692 ) ) ( not ( = ?auto_22697 ?auto_22692 ) ) ( not ( = ?auto_22700 ?auto_22692 ) ) ( ON ?auto_22692 ?auto_22691 ) ( not ( = ?auto_22691 ?auto_22692 ) ) ( not ( = ?auto_22691 ?auto_22693 ) ) ( not ( = ?auto_22691 ?auto_22694 ) ) ( not ( = ?auto_22691 ?auto_22695 ) ) ( not ( = ?auto_22691 ?auto_22697 ) ) ( not ( = ?auto_22691 ?auto_22700 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22693 ?auto_22694 ?auto_22695 )
      ( MAKE-4CRATE-VERIFY ?auto_22691 ?auto_22692 ?auto_22693 ?auto_22694 ?auto_22695 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22705 - SURFACE
      ?auto_22706 - SURFACE
      ?auto_22707 - SURFACE
      ?auto_22708 - SURFACE
      ?auto_22709 - SURFACE
      ?auto_22710 - SURFACE
    )
    :vars
    (
      ?auto_22716 - HOIST
      ?auto_22711 - PLACE
      ?auto_22717 - PLACE
      ?auto_22718 - HOIST
      ?auto_22712 - SURFACE
      ?auto_22713 - PLACE
      ?auto_22719 - HOIST
      ?auto_22715 - SURFACE
      ?auto_22714 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22716 ?auto_22711 ) ( IS-CRATE ?auto_22710 ) ( not ( = ?auto_22709 ?auto_22710 ) ) ( not ( = ?auto_22708 ?auto_22709 ) ) ( not ( = ?auto_22708 ?auto_22710 ) ) ( not ( = ?auto_22717 ?auto_22711 ) ) ( HOIST-AT ?auto_22718 ?auto_22717 ) ( not ( = ?auto_22716 ?auto_22718 ) ) ( AVAILABLE ?auto_22718 ) ( SURFACE-AT ?auto_22710 ?auto_22717 ) ( ON ?auto_22710 ?auto_22712 ) ( CLEAR ?auto_22710 ) ( not ( = ?auto_22709 ?auto_22712 ) ) ( not ( = ?auto_22710 ?auto_22712 ) ) ( not ( = ?auto_22708 ?auto_22712 ) ) ( IS-CRATE ?auto_22709 ) ( not ( = ?auto_22713 ?auto_22711 ) ) ( not ( = ?auto_22717 ?auto_22713 ) ) ( HOIST-AT ?auto_22719 ?auto_22713 ) ( not ( = ?auto_22716 ?auto_22719 ) ) ( not ( = ?auto_22718 ?auto_22719 ) ) ( AVAILABLE ?auto_22719 ) ( SURFACE-AT ?auto_22709 ?auto_22713 ) ( ON ?auto_22709 ?auto_22715 ) ( CLEAR ?auto_22709 ) ( not ( = ?auto_22709 ?auto_22715 ) ) ( not ( = ?auto_22710 ?auto_22715 ) ) ( not ( = ?auto_22708 ?auto_22715 ) ) ( not ( = ?auto_22712 ?auto_22715 ) ) ( TRUCK-AT ?auto_22714 ?auto_22711 ) ( SURFACE-AT ?auto_22707 ?auto_22711 ) ( CLEAR ?auto_22707 ) ( LIFTING ?auto_22716 ?auto_22708 ) ( IS-CRATE ?auto_22708 ) ( not ( = ?auto_22707 ?auto_22708 ) ) ( not ( = ?auto_22709 ?auto_22707 ) ) ( not ( = ?auto_22710 ?auto_22707 ) ) ( not ( = ?auto_22712 ?auto_22707 ) ) ( not ( = ?auto_22715 ?auto_22707 ) ) ( ON ?auto_22706 ?auto_22705 ) ( ON ?auto_22707 ?auto_22706 ) ( not ( = ?auto_22705 ?auto_22706 ) ) ( not ( = ?auto_22705 ?auto_22707 ) ) ( not ( = ?auto_22705 ?auto_22708 ) ) ( not ( = ?auto_22705 ?auto_22709 ) ) ( not ( = ?auto_22705 ?auto_22710 ) ) ( not ( = ?auto_22705 ?auto_22712 ) ) ( not ( = ?auto_22705 ?auto_22715 ) ) ( not ( = ?auto_22706 ?auto_22707 ) ) ( not ( = ?auto_22706 ?auto_22708 ) ) ( not ( = ?auto_22706 ?auto_22709 ) ) ( not ( = ?auto_22706 ?auto_22710 ) ) ( not ( = ?auto_22706 ?auto_22712 ) ) ( not ( = ?auto_22706 ?auto_22715 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22708 ?auto_22709 ?auto_22710 )
      ( MAKE-5CRATE-VERIFY ?auto_22705 ?auto_22706 ?auto_22707 ?auto_22708 ?auto_22709 ?auto_22710 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22720 - SURFACE
      ?auto_22721 - SURFACE
    )
    :vars
    (
      ?auto_22729 - HOIST
      ?auto_22722 - PLACE
      ?auto_22726 - SURFACE
      ?auto_22730 - PLACE
      ?auto_22731 - HOIST
      ?auto_22723 - SURFACE
      ?auto_22725 - PLACE
      ?auto_22732 - HOIST
      ?auto_22728 - SURFACE
      ?auto_22727 - TRUCK
      ?auto_22724 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22729 ?auto_22722 ) ( IS-CRATE ?auto_22721 ) ( not ( = ?auto_22720 ?auto_22721 ) ) ( not ( = ?auto_22726 ?auto_22720 ) ) ( not ( = ?auto_22726 ?auto_22721 ) ) ( not ( = ?auto_22730 ?auto_22722 ) ) ( HOIST-AT ?auto_22731 ?auto_22730 ) ( not ( = ?auto_22729 ?auto_22731 ) ) ( AVAILABLE ?auto_22731 ) ( SURFACE-AT ?auto_22721 ?auto_22730 ) ( ON ?auto_22721 ?auto_22723 ) ( CLEAR ?auto_22721 ) ( not ( = ?auto_22720 ?auto_22723 ) ) ( not ( = ?auto_22721 ?auto_22723 ) ) ( not ( = ?auto_22726 ?auto_22723 ) ) ( IS-CRATE ?auto_22720 ) ( not ( = ?auto_22725 ?auto_22722 ) ) ( not ( = ?auto_22730 ?auto_22725 ) ) ( HOIST-AT ?auto_22732 ?auto_22725 ) ( not ( = ?auto_22729 ?auto_22732 ) ) ( not ( = ?auto_22731 ?auto_22732 ) ) ( AVAILABLE ?auto_22732 ) ( SURFACE-AT ?auto_22720 ?auto_22725 ) ( ON ?auto_22720 ?auto_22728 ) ( CLEAR ?auto_22720 ) ( not ( = ?auto_22720 ?auto_22728 ) ) ( not ( = ?auto_22721 ?auto_22728 ) ) ( not ( = ?auto_22726 ?auto_22728 ) ) ( not ( = ?auto_22723 ?auto_22728 ) ) ( TRUCK-AT ?auto_22727 ?auto_22722 ) ( SURFACE-AT ?auto_22724 ?auto_22722 ) ( CLEAR ?auto_22724 ) ( IS-CRATE ?auto_22726 ) ( not ( = ?auto_22724 ?auto_22726 ) ) ( not ( = ?auto_22720 ?auto_22724 ) ) ( not ( = ?auto_22721 ?auto_22724 ) ) ( not ( = ?auto_22723 ?auto_22724 ) ) ( not ( = ?auto_22728 ?auto_22724 ) ) ( AVAILABLE ?auto_22729 ) ( IN ?auto_22726 ?auto_22727 ) )
    :subtasks
    ( ( !UNLOAD ?auto_22729 ?auto_22726 ?auto_22727 ?auto_22722 )
      ( MAKE-2CRATE ?auto_22726 ?auto_22720 ?auto_22721 )
      ( MAKE-1CRATE-VERIFY ?auto_22720 ?auto_22721 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22733 - SURFACE
      ?auto_22734 - SURFACE
      ?auto_22735 - SURFACE
    )
    :vars
    (
      ?auto_22738 - HOIST
      ?auto_22740 - PLACE
      ?auto_22744 - PLACE
      ?auto_22739 - HOIST
      ?auto_22737 - SURFACE
      ?auto_22736 - PLACE
      ?auto_22742 - HOIST
      ?auto_22745 - SURFACE
      ?auto_22743 - TRUCK
      ?auto_22741 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22738 ?auto_22740 ) ( IS-CRATE ?auto_22735 ) ( not ( = ?auto_22734 ?auto_22735 ) ) ( not ( = ?auto_22733 ?auto_22734 ) ) ( not ( = ?auto_22733 ?auto_22735 ) ) ( not ( = ?auto_22744 ?auto_22740 ) ) ( HOIST-AT ?auto_22739 ?auto_22744 ) ( not ( = ?auto_22738 ?auto_22739 ) ) ( AVAILABLE ?auto_22739 ) ( SURFACE-AT ?auto_22735 ?auto_22744 ) ( ON ?auto_22735 ?auto_22737 ) ( CLEAR ?auto_22735 ) ( not ( = ?auto_22734 ?auto_22737 ) ) ( not ( = ?auto_22735 ?auto_22737 ) ) ( not ( = ?auto_22733 ?auto_22737 ) ) ( IS-CRATE ?auto_22734 ) ( not ( = ?auto_22736 ?auto_22740 ) ) ( not ( = ?auto_22744 ?auto_22736 ) ) ( HOIST-AT ?auto_22742 ?auto_22736 ) ( not ( = ?auto_22738 ?auto_22742 ) ) ( not ( = ?auto_22739 ?auto_22742 ) ) ( AVAILABLE ?auto_22742 ) ( SURFACE-AT ?auto_22734 ?auto_22736 ) ( ON ?auto_22734 ?auto_22745 ) ( CLEAR ?auto_22734 ) ( not ( = ?auto_22734 ?auto_22745 ) ) ( not ( = ?auto_22735 ?auto_22745 ) ) ( not ( = ?auto_22733 ?auto_22745 ) ) ( not ( = ?auto_22737 ?auto_22745 ) ) ( TRUCK-AT ?auto_22743 ?auto_22740 ) ( SURFACE-AT ?auto_22741 ?auto_22740 ) ( CLEAR ?auto_22741 ) ( IS-CRATE ?auto_22733 ) ( not ( = ?auto_22741 ?auto_22733 ) ) ( not ( = ?auto_22734 ?auto_22741 ) ) ( not ( = ?auto_22735 ?auto_22741 ) ) ( not ( = ?auto_22737 ?auto_22741 ) ) ( not ( = ?auto_22745 ?auto_22741 ) ) ( AVAILABLE ?auto_22738 ) ( IN ?auto_22733 ?auto_22743 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22734 ?auto_22735 )
      ( MAKE-2CRATE-VERIFY ?auto_22733 ?auto_22734 ?auto_22735 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22746 - SURFACE
      ?auto_22747 - SURFACE
      ?auto_22748 - SURFACE
      ?auto_22749 - SURFACE
    )
    :vars
    (
      ?auto_22751 - HOIST
      ?auto_22753 - PLACE
      ?auto_22754 - PLACE
      ?auto_22755 - HOIST
      ?auto_22752 - SURFACE
      ?auto_22756 - PLACE
      ?auto_22758 - HOIST
      ?auto_22750 - SURFACE
      ?auto_22757 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22751 ?auto_22753 ) ( IS-CRATE ?auto_22749 ) ( not ( = ?auto_22748 ?auto_22749 ) ) ( not ( = ?auto_22747 ?auto_22748 ) ) ( not ( = ?auto_22747 ?auto_22749 ) ) ( not ( = ?auto_22754 ?auto_22753 ) ) ( HOIST-AT ?auto_22755 ?auto_22754 ) ( not ( = ?auto_22751 ?auto_22755 ) ) ( AVAILABLE ?auto_22755 ) ( SURFACE-AT ?auto_22749 ?auto_22754 ) ( ON ?auto_22749 ?auto_22752 ) ( CLEAR ?auto_22749 ) ( not ( = ?auto_22748 ?auto_22752 ) ) ( not ( = ?auto_22749 ?auto_22752 ) ) ( not ( = ?auto_22747 ?auto_22752 ) ) ( IS-CRATE ?auto_22748 ) ( not ( = ?auto_22756 ?auto_22753 ) ) ( not ( = ?auto_22754 ?auto_22756 ) ) ( HOIST-AT ?auto_22758 ?auto_22756 ) ( not ( = ?auto_22751 ?auto_22758 ) ) ( not ( = ?auto_22755 ?auto_22758 ) ) ( AVAILABLE ?auto_22758 ) ( SURFACE-AT ?auto_22748 ?auto_22756 ) ( ON ?auto_22748 ?auto_22750 ) ( CLEAR ?auto_22748 ) ( not ( = ?auto_22748 ?auto_22750 ) ) ( not ( = ?auto_22749 ?auto_22750 ) ) ( not ( = ?auto_22747 ?auto_22750 ) ) ( not ( = ?auto_22752 ?auto_22750 ) ) ( TRUCK-AT ?auto_22757 ?auto_22753 ) ( SURFACE-AT ?auto_22746 ?auto_22753 ) ( CLEAR ?auto_22746 ) ( IS-CRATE ?auto_22747 ) ( not ( = ?auto_22746 ?auto_22747 ) ) ( not ( = ?auto_22748 ?auto_22746 ) ) ( not ( = ?auto_22749 ?auto_22746 ) ) ( not ( = ?auto_22752 ?auto_22746 ) ) ( not ( = ?auto_22750 ?auto_22746 ) ) ( AVAILABLE ?auto_22751 ) ( IN ?auto_22747 ?auto_22757 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22747 ?auto_22748 ?auto_22749 )
      ( MAKE-3CRATE-VERIFY ?auto_22746 ?auto_22747 ?auto_22748 ?auto_22749 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22759 - SURFACE
      ?auto_22760 - SURFACE
      ?auto_22761 - SURFACE
      ?auto_22762 - SURFACE
      ?auto_22763 - SURFACE
    )
    :vars
    (
      ?auto_22765 - HOIST
      ?auto_22767 - PLACE
      ?auto_22768 - PLACE
      ?auto_22769 - HOIST
      ?auto_22766 - SURFACE
      ?auto_22770 - PLACE
      ?auto_22772 - HOIST
      ?auto_22764 - SURFACE
      ?auto_22771 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22765 ?auto_22767 ) ( IS-CRATE ?auto_22763 ) ( not ( = ?auto_22762 ?auto_22763 ) ) ( not ( = ?auto_22761 ?auto_22762 ) ) ( not ( = ?auto_22761 ?auto_22763 ) ) ( not ( = ?auto_22768 ?auto_22767 ) ) ( HOIST-AT ?auto_22769 ?auto_22768 ) ( not ( = ?auto_22765 ?auto_22769 ) ) ( AVAILABLE ?auto_22769 ) ( SURFACE-AT ?auto_22763 ?auto_22768 ) ( ON ?auto_22763 ?auto_22766 ) ( CLEAR ?auto_22763 ) ( not ( = ?auto_22762 ?auto_22766 ) ) ( not ( = ?auto_22763 ?auto_22766 ) ) ( not ( = ?auto_22761 ?auto_22766 ) ) ( IS-CRATE ?auto_22762 ) ( not ( = ?auto_22770 ?auto_22767 ) ) ( not ( = ?auto_22768 ?auto_22770 ) ) ( HOIST-AT ?auto_22772 ?auto_22770 ) ( not ( = ?auto_22765 ?auto_22772 ) ) ( not ( = ?auto_22769 ?auto_22772 ) ) ( AVAILABLE ?auto_22772 ) ( SURFACE-AT ?auto_22762 ?auto_22770 ) ( ON ?auto_22762 ?auto_22764 ) ( CLEAR ?auto_22762 ) ( not ( = ?auto_22762 ?auto_22764 ) ) ( not ( = ?auto_22763 ?auto_22764 ) ) ( not ( = ?auto_22761 ?auto_22764 ) ) ( not ( = ?auto_22766 ?auto_22764 ) ) ( TRUCK-AT ?auto_22771 ?auto_22767 ) ( SURFACE-AT ?auto_22760 ?auto_22767 ) ( CLEAR ?auto_22760 ) ( IS-CRATE ?auto_22761 ) ( not ( = ?auto_22760 ?auto_22761 ) ) ( not ( = ?auto_22762 ?auto_22760 ) ) ( not ( = ?auto_22763 ?auto_22760 ) ) ( not ( = ?auto_22766 ?auto_22760 ) ) ( not ( = ?auto_22764 ?auto_22760 ) ) ( AVAILABLE ?auto_22765 ) ( IN ?auto_22761 ?auto_22771 ) ( ON ?auto_22760 ?auto_22759 ) ( not ( = ?auto_22759 ?auto_22760 ) ) ( not ( = ?auto_22759 ?auto_22761 ) ) ( not ( = ?auto_22759 ?auto_22762 ) ) ( not ( = ?auto_22759 ?auto_22763 ) ) ( not ( = ?auto_22759 ?auto_22766 ) ) ( not ( = ?auto_22759 ?auto_22764 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22761 ?auto_22762 ?auto_22763 )
      ( MAKE-4CRATE-VERIFY ?auto_22759 ?auto_22760 ?auto_22761 ?auto_22762 ?auto_22763 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22773 - SURFACE
      ?auto_22774 - SURFACE
      ?auto_22775 - SURFACE
      ?auto_22776 - SURFACE
      ?auto_22777 - SURFACE
      ?auto_22778 - SURFACE
    )
    :vars
    (
      ?auto_22780 - HOIST
      ?auto_22782 - PLACE
      ?auto_22783 - PLACE
      ?auto_22784 - HOIST
      ?auto_22781 - SURFACE
      ?auto_22785 - PLACE
      ?auto_22787 - HOIST
      ?auto_22779 - SURFACE
      ?auto_22786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22780 ?auto_22782 ) ( IS-CRATE ?auto_22778 ) ( not ( = ?auto_22777 ?auto_22778 ) ) ( not ( = ?auto_22776 ?auto_22777 ) ) ( not ( = ?auto_22776 ?auto_22778 ) ) ( not ( = ?auto_22783 ?auto_22782 ) ) ( HOIST-AT ?auto_22784 ?auto_22783 ) ( not ( = ?auto_22780 ?auto_22784 ) ) ( AVAILABLE ?auto_22784 ) ( SURFACE-AT ?auto_22778 ?auto_22783 ) ( ON ?auto_22778 ?auto_22781 ) ( CLEAR ?auto_22778 ) ( not ( = ?auto_22777 ?auto_22781 ) ) ( not ( = ?auto_22778 ?auto_22781 ) ) ( not ( = ?auto_22776 ?auto_22781 ) ) ( IS-CRATE ?auto_22777 ) ( not ( = ?auto_22785 ?auto_22782 ) ) ( not ( = ?auto_22783 ?auto_22785 ) ) ( HOIST-AT ?auto_22787 ?auto_22785 ) ( not ( = ?auto_22780 ?auto_22787 ) ) ( not ( = ?auto_22784 ?auto_22787 ) ) ( AVAILABLE ?auto_22787 ) ( SURFACE-AT ?auto_22777 ?auto_22785 ) ( ON ?auto_22777 ?auto_22779 ) ( CLEAR ?auto_22777 ) ( not ( = ?auto_22777 ?auto_22779 ) ) ( not ( = ?auto_22778 ?auto_22779 ) ) ( not ( = ?auto_22776 ?auto_22779 ) ) ( not ( = ?auto_22781 ?auto_22779 ) ) ( TRUCK-AT ?auto_22786 ?auto_22782 ) ( SURFACE-AT ?auto_22775 ?auto_22782 ) ( CLEAR ?auto_22775 ) ( IS-CRATE ?auto_22776 ) ( not ( = ?auto_22775 ?auto_22776 ) ) ( not ( = ?auto_22777 ?auto_22775 ) ) ( not ( = ?auto_22778 ?auto_22775 ) ) ( not ( = ?auto_22781 ?auto_22775 ) ) ( not ( = ?auto_22779 ?auto_22775 ) ) ( AVAILABLE ?auto_22780 ) ( IN ?auto_22776 ?auto_22786 ) ( ON ?auto_22774 ?auto_22773 ) ( ON ?auto_22775 ?auto_22774 ) ( not ( = ?auto_22773 ?auto_22774 ) ) ( not ( = ?auto_22773 ?auto_22775 ) ) ( not ( = ?auto_22773 ?auto_22776 ) ) ( not ( = ?auto_22773 ?auto_22777 ) ) ( not ( = ?auto_22773 ?auto_22778 ) ) ( not ( = ?auto_22773 ?auto_22781 ) ) ( not ( = ?auto_22773 ?auto_22779 ) ) ( not ( = ?auto_22774 ?auto_22775 ) ) ( not ( = ?auto_22774 ?auto_22776 ) ) ( not ( = ?auto_22774 ?auto_22777 ) ) ( not ( = ?auto_22774 ?auto_22778 ) ) ( not ( = ?auto_22774 ?auto_22781 ) ) ( not ( = ?auto_22774 ?auto_22779 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22776 ?auto_22777 ?auto_22778 )
      ( MAKE-5CRATE-VERIFY ?auto_22773 ?auto_22774 ?auto_22775 ?auto_22776 ?auto_22777 ?auto_22778 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22788 - SURFACE
      ?auto_22789 - SURFACE
    )
    :vars
    (
      ?auto_22791 - HOIST
      ?auto_22793 - PLACE
      ?auto_22794 - SURFACE
      ?auto_22795 - PLACE
      ?auto_22796 - HOIST
      ?auto_22792 - SURFACE
      ?auto_22797 - PLACE
      ?auto_22800 - HOIST
      ?auto_22790 - SURFACE
      ?auto_22798 - SURFACE
      ?auto_22799 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22791 ?auto_22793 ) ( IS-CRATE ?auto_22789 ) ( not ( = ?auto_22788 ?auto_22789 ) ) ( not ( = ?auto_22794 ?auto_22788 ) ) ( not ( = ?auto_22794 ?auto_22789 ) ) ( not ( = ?auto_22795 ?auto_22793 ) ) ( HOIST-AT ?auto_22796 ?auto_22795 ) ( not ( = ?auto_22791 ?auto_22796 ) ) ( AVAILABLE ?auto_22796 ) ( SURFACE-AT ?auto_22789 ?auto_22795 ) ( ON ?auto_22789 ?auto_22792 ) ( CLEAR ?auto_22789 ) ( not ( = ?auto_22788 ?auto_22792 ) ) ( not ( = ?auto_22789 ?auto_22792 ) ) ( not ( = ?auto_22794 ?auto_22792 ) ) ( IS-CRATE ?auto_22788 ) ( not ( = ?auto_22797 ?auto_22793 ) ) ( not ( = ?auto_22795 ?auto_22797 ) ) ( HOIST-AT ?auto_22800 ?auto_22797 ) ( not ( = ?auto_22791 ?auto_22800 ) ) ( not ( = ?auto_22796 ?auto_22800 ) ) ( AVAILABLE ?auto_22800 ) ( SURFACE-AT ?auto_22788 ?auto_22797 ) ( ON ?auto_22788 ?auto_22790 ) ( CLEAR ?auto_22788 ) ( not ( = ?auto_22788 ?auto_22790 ) ) ( not ( = ?auto_22789 ?auto_22790 ) ) ( not ( = ?auto_22794 ?auto_22790 ) ) ( not ( = ?auto_22792 ?auto_22790 ) ) ( SURFACE-AT ?auto_22798 ?auto_22793 ) ( CLEAR ?auto_22798 ) ( IS-CRATE ?auto_22794 ) ( not ( = ?auto_22798 ?auto_22794 ) ) ( not ( = ?auto_22788 ?auto_22798 ) ) ( not ( = ?auto_22789 ?auto_22798 ) ) ( not ( = ?auto_22792 ?auto_22798 ) ) ( not ( = ?auto_22790 ?auto_22798 ) ) ( AVAILABLE ?auto_22791 ) ( IN ?auto_22794 ?auto_22799 ) ( TRUCK-AT ?auto_22799 ?auto_22797 ) )
    :subtasks
    ( ( !DRIVE ?auto_22799 ?auto_22797 ?auto_22793 )
      ( MAKE-2CRATE ?auto_22794 ?auto_22788 ?auto_22789 )
      ( MAKE-1CRATE-VERIFY ?auto_22788 ?auto_22789 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22801 - SURFACE
      ?auto_22802 - SURFACE
      ?auto_22803 - SURFACE
    )
    :vars
    (
      ?auto_22805 - HOIST
      ?auto_22810 - PLACE
      ?auto_22807 - PLACE
      ?auto_22812 - HOIST
      ?auto_22809 - SURFACE
      ?auto_22813 - PLACE
      ?auto_22804 - HOIST
      ?auto_22811 - SURFACE
      ?auto_22808 - SURFACE
      ?auto_22806 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22805 ?auto_22810 ) ( IS-CRATE ?auto_22803 ) ( not ( = ?auto_22802 ?auto_22803 ) ) ( not ( = ?auto_22801 ?auto_22802 ) ) ( not ( = ?auto_22801 ?auto_22803 ) ) ( not ( = ?auto_22807 ?auto_22810 ) ) ( HOIST-AT ?auto_22812 ?auto_22807 ) ( not ( = ?auto_22805 ?auto_22812 ) ) ( AVAILABLE ?auto_22812 ) ( SURFACE-AT ?auto_22803 ?auto_22807 ) ( ON ?auto_22803 ?auto_22809 ) ( CLEAR ?auto_22803 ) ( not ( = ?auto_22802 ?auto_22809 ) ) ( not ( = ?auto_22803 ?auto_22809 ) ) ( not ( = ?auto_22801 ?auto_22809 ) ) ( IS-CRATE ?auto_22802 ) ( not ( = ?auto_22813 ?auto_22810 ) ) ( not ( = ?auto_22807 ?auto_22813 ) ) ( HOIST-AT ?auto_22804 ?auto_22813 ) ( not ( = ?auto_22805 ?auto_22804 ) ) ( not ( = ?auto_22812 ?auto_22804 ) ) ( AVAILABLE ?auto_22804 ) ( SURFACE-AT ?auto_22802 ?auto_22813 ) ( ON ?auto_22802 ?auto_22811 ) ( CLEAR ?auto_22802 ) ( not ( = ?auto_22802 ?auto_22811 ) ) ( not ( = ?auto_22803 ?auto_22811 ) ) ( not ( = ?auto_22801 ?auto_22811 ) ) ( not ( = ?auto_22809 ?auto_22811 ) ) ( SURFACE-AT ?auto_22808 ?auto_22810 ) ( CLEAR ?auto_22808 ) ( IS-CRATE ?auto_22801 ) ( not ( = ?auto_22808 ?auto_22801 ) ) ( not ( = ?auto_22802 ?auto_22808 ) ) ( not ( = ?auto_22803 ?auto_22808 ) ) ( not ( = ?auto_22809 ?auto_22808 ) ) ( not ( = ?auto_22811 ?auto_22808 ) ) ( AVAILABLE ?auto_22805 ) ( IN ?auto_22801 ?auto_22806 ) ( TRUCK-AT ?auto_22806 ?auto_22813 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22802 ?auto_22803 )
      ( MAKE-2CRATE-VERIFY ?auto_22801 ?auto_22802 ?auto_22803 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22814 - SURFACE
      ?auto_22815 - SURFACE
      ?auto_22816 - SURFACE
      ?auto_22817 - SURFACE
    )
    :vars
    (
      ?auto_22820 - HOIST
      ?auto_22824 - PLACE
      ?auto_22823 - PLACE
      ?auto_22821 - HOIST
      ?auto_22819 - SURFACE
      ?auto_22825 - PLACE
      ?auto_22822 - HOIST
      ?auto_22826 - SURFACE
      ?auto_22818 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22820 ?auto_22824 ) ( IS-CRATE ?auto_22817 ) ( not ( = ?auto_22816 ?auto_22817 ) ) ( not ( = ?auto_22815 ?auto_22816 ) ) ( not ( = ?auto_22815 ?auto_22817 ) ) ( not ( = ?auto_22823 ?auto_22824 ) ) ( HOIST-AT ?auto_22821 ?auto_22823 ) ( not ( = ?auto_22820 ?auto_22821 ) ) ( AVAILABLE ?auto_22821 ) ( SURFACE-AT ?auto_22817 ?auto_22823 ) ( ON ?auto_22817 ?auto_22819 ) ( CLEAR ?auto_22817 ) ( not ( = ?auto_22816 ?auto_22819 ) ) ( not ( = ?auto_22817 ?auto_22819 ) ) ( not ( = ?auto_22815 ?auto_22819 ) ) ( IS-CRATE ?auto_22816 ) ( not ( = ?auto_22825 ?auto_22824 ) ) ( not ( = ?auto_22823 ?auto_22825 ) ) ( HOIST-AT ?auto_22822 ?auto_22825 ) ( not ( = ?auto_22820 ?auto_22822 ) ) ( not ( = ?auto_22821 ?auto_22822 ) ) ( AVAILABLE ?auto_22822 ) ( SURFACE-AT ?auto_22816 ?auto_22825 ) ( ON ?auto_22816 ?auto_22826 ) ( CLEAR ?auto_22816 ) ( not ( = ?auto_22816 ?auto_22826 ) ) ( not ( = ?auto_22817 ?auto_22826 ) ) ( not ( = ?auto_22815 ?auto_22826 ) ) ( not ( = ?auto_22819 ?auto_22826 ) ) ( SURFACE-AT ?auto_22814 ?auto_22824 ) ( CLEAR ?auto_22814 ) ( IS-CRATE ?auto_22815 ) ( not ( = ?auto_22814 ?auto_22815 ) ) ( not ( = ?auto_22816 ?auto_22814 ) ) ( not ( = ?auto_22817 ?auto_22814 ) ) ( not ( = ?auto_22819 ?auto_22814 ) ) ( not ( = ?auto_22826 ?auto_22814 ) ) ( AVAILABLE ?auto_22820 ) ( IN ?auto_22815 ?auto_22818 ) ( TRUCK-AT ?auto_22818 ?auto_22825 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22815 ?auto_22816 ?auto_22817 )
      ( MAKE-3CRATE-VERIFY ?auto_22814 ?auto_22815 ?auto_22816 ?auto_22817 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22827 - SURFACE
      ?auto_22828 - SURFACE
      ?auto_22829 - SURFACE
      ?auto_22830 - SURFACE
      ?auto_22831 - SURFACE
    )
    :vars
    (
      ?auto_22834 - HOIST
      ?auto_22838 - PLACE
      ?auto_22837 - PLACE
      ?auto_22835 - HOIST
      ?auto_22833 - SURFACE
      ?auto_22839 - PLACE
      ?auto_22836 - HOIST
      ?auto_22840 - SURFACE
      ?auto_22832 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22834 ?auto_22838 ) ( IS-CRATE ?auto_22831 ) ( not ( = ?auto_22830 ?auto_22831 ) ) ( not ( = ?auto_22829 ?auto_22830 ) ) ( not ( = ?auto_22829 ?auto_22831 ) ) ( not ( = ?auto_22837 ?auto_22838 ) ) ( HOIST-AT ?auto_22835 ?auto_22837 ) ( not ( = ?auto_22834 ?auto_22835 ) ) ( AVAILABLE ?auto_22835 ) ( SURFACE-AT ?auto_22831 ?auto_22837 ) ( ON ?auto_22831 ?auto_22833 ) ( CLEAR ?auto_22831 ) ( not ( = ?auto_22830 ?auto_22833 ) ) ( not ( = ?auto_22831 ?auto_22833 ) ) ( not ( = ?auto_22829 ?auto_22833 ) ) ( IS-CRATE ?auto_22830 ) ( not ( = ?auto_22839 ?auto_22838 ) ) ( not ( = ?auto_22837 ?auto_22839 ) ) ( HOIST-AT ?auto_22836 ?auto_22839 ) ( not ( = ?auto_22834 ?auto_22836 ) ) ( not ( = ?auto_22835 ?auto_22836 ) ) ( AVAILABLE ?auto_22836 ) ( SURFACE-AT ?auto_22830 ?auto_22839 ) ( ON ?auto_22830 ?auto_22840 ) ( CLEAR ?auto_22830 ) ( not ( = ?auto_22830 ?auto_22840 ) ) ( not ( = ?auto_22831 ?auto_22840 ) ) ( not ( = ?auto_22829 ?auto_22840 ) ) ( not ( = ?auto_22833 ?auto_22840 ) ) ( SURFACE-AT ?auto_22828 ?auto_22838 ) ( CLEAR ?auto_22828 ) ( IS-CRATE ?auto_22829 ) ( not ( = ?auto_22828 ?auto_22829 ) ) ( not ( = ?auto_22830 ?auto_22828 ) ) ( not ( = ?auto_22831 ?auto_22828 ) ) ( not ( = ?auto_22833 ?auto_22828 ) ) ( not ( = ?auto_22840 ?auto_22828 ) ) ( AVAILABLE ?auto_22834 ) ( IN ?auto_22829 ?auto_22832 ) ( TRUCK-AT ?auto_22832 ?auto_22839 ) ( ON ?auto_22828 ?auto_22827 ) ( not ( = ?auto_22827 ?auto_22828 ) ) ( not ( = ?auto_22827 ?auto_22829 ) ) ( not ( = ?auto_22827 ?auto_22830 ) ) ( not ( = ?auto_22827 ?auto_22831 ) ) ( not ( = ?auto_22827 ?auto_22833 ) ) ( not ( = ?auto_22827 ?auto_22840 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22829 ?auto_22830 ?auto_22831 )
      ( MAKE-4CRATE-VERIFY ?auto_22827 ?auto_22828 ?auto_22829 ?auto_22830 ?auto_22831 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22841 - SURFACE
      ?auto_22842 - SURFACE
      ?auto_22843 - SURFACE
      ?auto_22844 - SURFACE
      ?auto_22845 - SURFACE
      ?auto_22846 - SURFACE
    )
    :vars
    (
      ?auto_22849 - HOIST
      ?auto_22853 - PLACE
      ?auto_22852 - PLACE
      ?auto_22850 - HOIST
      ?auto_22848 - SURFACE
      ?auto_22854 - PLACE
      ?auto_22851 - HOIST
      ?auto_22855 - SURFACE
      ?auto_22847 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22849 ?auto_22853 ) ( IS-CRATE ?auto_22846 ) ( not ( = ?auto_22845 ?auto_22846 ) ) ( not ( = ?auto_22844 ?auto_22845 ) ) ( not ( = ?auto_22844 ?auto_22846 ) ) ( not ( = ?auto_22852 ?auto_22853 ) ) ( HOIST-AT ?auto_22850 ?auto_22852 ) ( not ( = ?auto_22849 ?auto_22850 ) ) ( AVAILABLE ?auto_22850 ) ( SURFACE-AT ?auto_22846 ?auto_22852 ) ( ON ?auto_22846 ?auto_22848 ) ( CLEAR ?auto_22846 ) ( not ( = ?auto_22845 ?auto_22848 ) ) ( not ( = ?auto_22846 ?auto_22848 ) ) ( not ( = ?auto_22844 ?auto_22848 ) ) ( IS-CRATE ?auto_22845 ) ( not ( = ?auto_22854 ?auto_22853 ) ) ( not ( = ?auto_22852 ?auto_22854 ) ) ( HOIST-AT ?auto_22851 ?auto_22854 ) ( not ( = ?auto_22849 ?auto_22851 ) ) ( not ( = ?auto_22850 ?auto_22851 ) ) ( AVAILABLE ?auto_22851 ) ( SURFACE-AT ?auto_22845 ?auto_22854 ) ( ON ?auto_22845 ?auto_22855 ) ( CLEAR ?auto_22845 ) ( not ( = ?auto_22845 ?auto_22855 ) ) ( not ( = ?auto_22846 ?auto_22855 ) ) ( not ( = ?auto_22844 ?auto_22855 ) ) ( not ( = ?auto_22848 ?auto_22855 ) ) ( SURFACE-AT ?auto_22843 ?auto_22853 ) ( CLEAR ?auto_22843 ) ( IS-CRATE ?auto_22844 ) ( not ( = ?auto_22843 ?auto_22844 ) ) ( not ( = ?auto_22845 ?auto_22843 ) ) ( not ( = ?auto_22846 ?auto_22843 ) ) ( not ( = ?auto_22848 ?auto_22843 ) ) ( not ( = ?auto_22855 ?auto_22843 ) ) ( AVAILABLE ?auto_22849 ) ( IN ?auto_22844 ?auto_22847 ) ( TRUCK-AT ?auto_22847 ?auto_22854 ) ( ON ?auto_22842 ?auto_22841 ) ( ON ?auto_22843 ?auto_22842 ) ( not ( = ?auto_22841 ?auto_22842 ) ) ( not ( = ?auto_22841 ?auto_22843 ) ) ( not ( = ?auto_22841 ?auto_22844 ) ) ( not ( = ?auto_22841 ?auto_22845 ) ) ( not ( = ?auto_22841 ?auto_22846 ) ) ( not ( = ?auto_22841 ?auto_22848 ) ) ( not ( = ?auto_22841 ?auto_22855 ) ) ( not ( = ?auto_22842 ?auto_22843 ) ) ( not ( = ?auto_22842 ?auto_22844 ) ) ( not ( = ?auto_22842 ?auto_22845 ) ) ( not ( = ?auto_22842 ?auto_22846 ) ) ( not ( = ?auto_22842 ?auto_22848 ) ) ( not ( = ?auto_22842 ?auto_22855 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22844 ?auto_22845 ?auto_22846 )
      ( MAKE-5CRATE-VERIFY ?auto_22841 ?auto_22842 ?auto_22843 ?auto_22844 ?auto_22845 ?auto_22846 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22856 - SURFACE
      ?auto_22857 - SURFACE
    )
    :vars
    (
      ?auto_22860 - HOIST
      ?auto_22865 - PLACE
      ?auto_22867 - SURFACE
      ?auto_22864 - PLACE
      ?auto_22861 - HOIST
      ?auto_22859 - SURFACE
      ?auto_22866 - PLACE
      ?auto_22862 - HOIST
      ?auto_22868 - SURFACE
      ?auto_22863 - SURFACE
      ?auto_22858 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22860 ?auto_22865 ) ( IS-CRATE ?auto_22857 ) ( not ( = ?auto_22856 ?auto_22857 ) ) ( not ( = ?auto_22867 ?auto_22856 ) ) ( not ( = ?auto_22867 ?auto_22857 ) ) ( not ( = ?auto_22864 ?auto_22865 ) ) ( HOIST-AT ?auto_22861 ?auto_22864 ) ( not ( = ?auto_22860 ?auto_22861 ) ) ( AVAILABLE ?auto_22861 ) ( SURFACE-AT ?auto_22857 ?auto_22864 ) ( ON ?auto_22857 ?auto_22859 ) ( CLEAR ?auto_22857 ) ( not ( = ?auto_22856 ?auto_22859 ) ) ( not ( = ?auto_22857 ?auto_22859 ) ) ( not ( = ?auto_22867 ?auto_22859 ) ) ( IS-CRATE ?auto_22856 ) ( not ( = ?auto_22866 ?auto_22865 ) ) ( not ( = ?auto_22864 ?auto_22866 ) ) ( HOIST-AT ?auto_22862 ?auto_22866 ) ( not ( = ?auto_22860 ?auto_22862 ) ) ( not ( = ?auto_22861 ?auto_22862 ) ) ( SURFACE-AT ?auto_22856 ?auto_22866 ) ( ON ?auto_22856 ?auto_22868 ) ( CLEAR ?auto_22856 ) ( not ( = ?auto_22856 ?auto_22868 ) ) ( not ( = ?auto_22857 ?auto_22868 ) ) ( not ( = ?auto_22867 ?auto_22868 ) ) ( not ( = ?auto_22859 ?auto_22868 ) ) ( SURFACE-AT ?auto_22863 ?auto_22865 ) ( CLEAR ?auto_22863 ) ( IS-CRATE ?auto_22867 ) ( not ( = ?auto_22863 ?auto_22867 ) ) ( not ( = ?auto_22856 ?auto_22863 ) ) ( not ( = ?auto_22857 ?auto_22863 ) ) ( not ( = ?auto_22859 ?auto_22863 ) ) ( not ( = ?auto_22868 ?auto_22863 ) ) ( AVAILABLE ?auto_22860 ) ( TRUCK-AT ?auto_22858 ?auto_22866 ) ( LIFTING ?auto_22862 ?auto_22867 ) )
    :subtasks
    ( ( !LOAD ?auto_22862 ?auto_22867 ?auto_22858 ?auto_22866 )
      ( MAKE-2CRATE ?auto_22867 ?auto_22856 ?auto_22857 )
      ( MAKE-1CRATE-VERIFY ?auto_22856 ?auto_22857 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22869 - SURFACE
      ?auto_22870 - SURFACE
      ?auto_22871 - SURFACE
    )
    :vars
    (
      ?auto_22873 - HOIST
      ?auto_22874 - PLACE
      ?auto_22880 - PLACE
      ?auto_22876 - HOIST
      ?auto_22872 - SURFACE
      ?auto_22878 - PLACE
      ?auto_22875 - HOIST
      ?auto_22881 - SURFACE
      ?auto_22879 - SURFACE
      ?auto_22877 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22873 ?auto_22874 ) ( IS-CRATE ?auto_22871 ) ( not ( = ?auto_22870 ?auto_22871 ) ) ( not ( = ?auto_22869 ?auto_22870 ) ) ( not ( = ?auto_22869 ?auto_22871 ) ) ( not ( = ?auto_22880 ?auto_22874 ) ) ( HOIST-AT ?auto_22876 ?auto_22880 ) ( not ( = ?auto_22873 ?auto_22876 ) ) ( AVAILABLE ?auto_22876 ) ( SURFACE-AT ?auto_22871 ?auto_22880 ) ( ON ?auto_22871 ?auto_22872 ) ( CLEAR ?auto_22871 ) ( not ( = ?auto_22870 ?auto_22872 ) ) ( not ( = ?auto_22871 ?auto_22872 ) ) ( not ( = ?auto_22869 ?auto_22872 ) ) ( IS-CRATE ?auto_22870 ) ( not ( = ?auto_22878 ?auto_22874 ) ) ( not ( = ?auto_22880 ?auto_22878 ) ) ( HOIST-AT ?auto_22875 ?auto_22878 ) ( not ( = ?auto_22873 ?auto_22875 ) ) ( not ( = ?auto_22876 ?auto_22875 ) ) ( SURFACE-AT ?auto_22870 ?auto_22878 ) ( ON ?auto_22870 ?auto_22881 ) ( CLEAR ?auto_22870 ) ( not ( = ?auto_22870 ?auto_22881 ) ) ( not ( = ?auto_22871 ?auto_22881 ) ) ( not ( = ?auto_22869 ?auto_22881 ) ) ( not ( = ?auto_22872 ?auto_22881 ) ) ( SURFACE-AT ?auto_22879 ?auto_22874 ) ( CLEAR ?auto_22879 ) ( IS-CRATE ?auto_22869 ) ( not ( = ?auto_22879 ?auto_22869 ) ) ( not ( = ?auto_22870 ?auto_22879 ) ) ( not ( = ?auto_22871 ?auto_22879 ) ) ( not ( = ?auto_22872 ?auto_22879 ) ) ( not ( = ?auto_22881 ?auto_22879 ) ) ( AVAILABLE ?auto_22873 ) ( TRUCK-AT ?auto_22877 ?auto_22878 ) ( LIFTING ?auto_22875 ?auto_22869 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22870 ?auto_22871 )
      ( MAKE-2CRATE-VERIFY ?auto_22869 ?auto_22870 ?auto_22871 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22882 - SURFACE
      ?auto_22883 - SURFACE
      ?auto_22884 - SURFACE
      ?auto_22885 - SURFACE
    )
    :vars
    (
      ?auto_22888 - HOIST
      ?auto_22889 - PLACE
      ?auto_22886 - PLACE
      ?auto_22890 - HOIST
      ?auto_22893 - SURFACE
      ?auto_22891 - PLACE
      ?auto_22894 - HOIST
      ?auto_22892 - SURFACE
      ?auto_22887 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22888 ?auto_22889 ) ( IS-CRATE ?auto_22885 ) ( not ( = ?auto_22884 ?auto_22885 ) ) ( not ( = ?auto_22883 ?auto_22884 ) ) ( not ( = ?auto_22883 ?auto_22885 ) ) ( not ( = ?auto_22886 ?auto_22889 ) ) ( HOIST-AT ?auto_22890 ?auto_22886 ) ( not ( = ?auto_22888 ?auto_22890 ) ) ( AVAILABLE ?auto_22890 ) ( SURFACE-AT ?auto_22885 ?auto_22886 ) ( ON ?auto_22885 ?auto_22893 ) ( CLEAR ?auto_22885 ) ( not ( = ?auto_22884 ?auto_22893 ) ) ( not ( = ?auto_22885 ?auto_22893 ) ) ( not ( = ?auto_22883 ?auto_22893 ) ) ( IS-CRATE ?auto_22884 ) ( not ( = ?auto_22891 ?auto_22889 ) ) ( not ( = ?auto_22886 ?auto_22891 ) ) ( HOIST-AT ?auto_22894 ?auto_22891 ) ( not ( = ?auto_22888 ?auto_22894 ) ) ( not ( = ?auto_22890 ?auto_22894 ) ) ( SURFACE-AT ?auto_22884 ?auto_22891 ) ( ON ?auto_22884 ?auto_22892 ) ( CLEAR ?auto_22884 ) ( not ( = ?auto_22884 ?auto_22892 ) ) ( not ( = ?auto_22885 ?auto_22892 ) ) ( not ( = ?auto_22883 ?auto_22892 ) ) ( not ( = ?auto_22893 ?auto_22892 ) ) ( SURFACE-AT ?auto_22882 ?auto_22889 ) ( CLEAR ?auto_22882 ) ( IS-CRATE ?auto_22883 ) ( not ( = ?auto_22882 ?auto_22883 ) ) ( not ( = ?auto_22884 ?auto_22882 ) ) ( not ( = ?auto_22885 ?auto_22882 ) ) ( not ( = ?auto_22893 ?auto_22882 ) ) ( not ( = ?auto_22892 ?auto_22882 ) ) ( AVAILABLE ?auto_22888 ) ( TRUCK-AT ?auto_22887 ?auto_22891 ) ( LIFTING ?auto_22894 ?auto_22883 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22883 ?auto_22884 ?auto_22885 )
      ( MAKE-3CRATE-VERIFY ?auto_22882 ?auto_22883 ?auto_22884 ?auto_22885 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22895 - SURFACE
      ?auto_22896 - SURFACE
      ?auto_22897 - SURFACE
      ?auto_22898 - SURFACE
      ?auto_22899 - SURFACE
    )
    :vars
    (
      ?auto_22902 - HOIST
      ?auto_22903 - PLACE
      ?auto_22900 - PLACE
      ?auto_22904 - HOIST
      ?auto_22907 - SURFACE
      ?auto_22905 - PLACE
      ?auto_22908 - HOIST
      ?auto_22906 - SURFACE
      ?auto_22901 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22902 ?auto_22903 ) ( IS-CRATE ?auto_22899 ) ( not ( = ?auto_22898 ?auto_22899 ) ) ( not ( = ?auto_22897 ?auto_22898 ) ) ( not ( = ?auto_22897 ?auto_22899 ) ) ( not ( = ?auto_22900 ?auto_22903 ) ) ( HOIST-AT ?auto_22904 ?auto_22900 ) ( not ( = ?auto_22902 ?auto_22904 ) ) ( AVAILABLE ?auto_22904 ) ( SURFACE-AT ?auto_22899 ?auto_22900 ) ( ON ?auto_22899 ?auto_22907 ) ( CLEAR ?auto_22899 ) ( not ( = ?auto_22898 ?auto_22907 ) ) ( not ( = ?auto_22899 ?auto_22907 ) ) ( not ( = ?auto_22897 ?auto_22907 ) ) ( IS-CRATE ?auto_22898 ) ( not ( = ?auto_22905 ?auto_22903 ) ) ( not ( = ?auto_22900 ?auto_22905 ) ) ( HOIST-AT ?auto_22908 ?auto_22905 ) ( not ( = ?auto_22902 ?auto_22908 ) ) ( not ( = ?auto_22904 ?auto_22908 ) ) ( SURFACE-AT ?auto_22898 ?auto_22905 ) ( ON ?auto_22898 ?auto_22906 ) ( CLEAR ?auto_22898 ) ( not ( = ?auto_22898 ?auto_22906 ) ) ( not ( = ?auto_22899 ?auto_22906 ) ) ( not ( = ?auto_22897 ?auto_22906 ) ) ( not ( = ?auto_22907 ?auto_22906 ) ) ( SURFACE-AT ?auto_22896 ?auto_22903 ) ( CLEAR ?auto_22896 ) ( IS-CRATE ?auto_22897 ) ( not ( = ?auto_22896 ?auto_22897 ) ) ( not ( = ?auto_22898 ?auto_22896 ) ) ( not ( = ?auto_22899 ?auto_22896 ) ) ( not ( = ?auto_22907 ?auto_22896 ) ) ( not ( = ?auto_22906 ?auto_22896 ) ) ( AVAILABLE ?auto_22902 ) ( TRUCK-AT ?auto_22901 ?auto_22905 ) ( LIFTING ?auto_22908 ?auto_22897 ) ( ON ?auto_22896 ?auto_22895 ) ( not ( = ?auto_22895 ?auto_22896 ) ) ( not ( = ?auto_22895 ?auto_22897 ) ) ( not ( = ?auto_22895 ?auto_22898 ) ) ( not ( = ?auto_22895 ?auto_22899 ) ) ( not ( = ?auto_22895 ?auto_22907 ) ) ( not ( = ?auto_22895 ?auto_22906 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22897 ?auto_22898 ?auto_22899 )
      ( MAKE-4CRATE-VERIFY ?auto_22895 ?auto_22896 ?auto_22897 ?auto_22898 ?auto_22899 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22909 - SURFACE
      ?auto_22910 - SURFACE
      ?auto_22911 - SURFACE
      ?auto_22912 - SURFACE
      ?auto_22913 - SURFACE
      ?auto_22914 - SURFACE
    )
    :vars
    (
      ?auto_22917 - HOIST
      ?auto_22918 - PLACE
      ?auto_22915 - PLACE
      ?auto_22919 - HOIST
      ?auto_22922 - SURFACE
      ?auto_22920 - PLACE
      ?auto_22923 - HOIST
      ?auto_22921 - SURFACE
      ?auto_22916 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22917 ?auto_22918 ) ( IS-CRATE ?auto_22914 ) ( not ( = ?auto_22913 ?auto_22914 ) ) ( not ( = ?auto_22912 ?auto_22913 ) ) ( not ( = ?auto_22912 ?auto_22914 ) ) ( not ( = ?auto_22915 ?auto_22918 ) ) ( HOIST-AT ?auto_22919 ?auto_22915 ) ( not ( = ?auto_22917 ?auto_22919 ) ) ( AVAILABLE ?auto_22919 ) ( SURFACE-AT ?auto_22914 ?auto_22915 ) ( ON ?auto_22914 ?auto_22922 ) ( CLEAR ?auto_22914 ) ( not ( = ?auto_22913 ?auto_22922 ) ) ( not ( = ?auto_22914 ?auto_22922 ) ) ( not ( = ?auto_22912 ?auto_22922 ) ) ( IS-CRATE ?auto_22913 ) ( not ( = ?auto_22920 ?auto_22918 ) ) ( not ( = ?auto_22915 ?auto_22920 ) ) ( HOIST-AT ?auto_22923 ?auto_22920 ) ( not ( = ?auto_22917 ?auto_22923 ) ) ( not ( = ?auto_22919 ?auto_22923 ) ) ( SURFACE-AT ?auto_22913 ?auto_22920 ) ( ON ?auto_22913 ?auto_22921 ) ( CLEAR ?auto_22913 ) ( not ( = ?auto_22913 ?auto_22921 ) ) ( not ( = ?auto_22914 ?auto_22921 ) ) ( not ( = ?auto_22912 ?auto_22921 ) ) ( not ( = ?auto_22922 ?auto_22921 ) ) ( SURFACE-AT ?auto_22911 ?auto_22918 ) ( CLEAR ?auto_22911 ) ( IS-CRATE ?auto_22912 ) ( not ( = ?auto_22911 ?auto_22912 ) ) ( not ( = ?auto_22913 ?auto_22911 ) ) ( not ( = ?auto_22914 ?auto_22911 ) ) ( not ( = ?auto_22922 ?auto_22911 ) ) ( not ( = ?auto_22921 ?auto_22911 ) ) ( AVAILABLE ?auto_22917 ) ( TRUCK-AT ?auto_22916 ?auto_22920 ) ( LIFTING ?auto_22923 ?auto_22912 ) ( ON ?auto_22910 ?auto_22909 ) ( ON ?auto_22911 ?auto_22910 ) ( not ( = ?auto_22909 ?auto_22910 ) ) ( not ( = ?auto_22909 ?auto_22911 ) ) ( not ( = ?auto_22909 ?auto_22912 ) ) ( not ( = ?auto_22909 ?auto_22913 ) ) ( not ( = ?auto_22909 ?auto_22914 ) ) ( not ( = ?auto_22909 ?auto_22922 ) ) ( not ( = ?auto_22909 ?auto_22921 ) ) ( not ( = ?auto_22910 ?auto_22911 ) ) ( not ( = ?auto_22910 ?auto_22912 ) ) ( not ( = ?auto_22910 ?auto_22913 ) ) ( not ( = ?auto_22910 ?auto_22914 ) ) ( not ( = ?auto_22910 ?auto_22922 ) ) ( not ( = ?auto_22910 ?auto_22921 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22912 ?auto_22913 ?auto_22914 )
      ( MAKE-5CRATE-VERIFY ?auto_22909 ?auto_22910 ?auto_22911 ?auto_22912 ?auto_22913 ?auto_22914 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22924 - SURFACE
      ?auto_22925 - SURFACE
    )
    :vars
    (
      ?auto_22929 - HOIST
      ?auto_22930 - PLACE
      ?auto_22936 - SURFACE
      ?auto_22927 - PLACE
      ?auto_22931 - HOIST
      ?auto_22934 - SURFACE
      ?auto_22932 - PLACE
      ?auto_22935 - HOIST
      ?auto_22933 - SURFACE
      ?auto_22926 - SURFACE
      ?auto_22928 - TRUCK
      ?auto_22937 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22929 ?auto_22930 ) ( IS-CRATE ?auto_22925 ) ( not ( = ?auto_22924 ?auto_22925 ) ) ( not ( = ?auto_22936 ?auto_22924 ) ) ( not ( = ?auto_22936 ?auto_22925 ) ) ( not ( = ?auto_22927 ?auto_22930 ) ) ( HOIST-AT ?auto_22931 ?auto_22927 ) ( not ( = ?auto_22929 ?auto_22931 ) ) ( AVAILABLE ?auto_22931 ) ( SURFACE-AT ?auto_22925 ?auto_22927 ) ( ON ?auto_22925 ?auto_22934 ) ( CLEAR ?auto_22925 ) ( not ( = ?auto_22924 ?auto_22934 ) ) ( not ( = ?auto_22925 ?auto_22934 ) ) ( not ( = ?auto_22936 ?auto_22934 ) ) ( IS-CRATE ?auto_22924 ) ( not ( = ?auto_22932 ?auto_22930 ) ) ( not ( = ?auto_22927 ?auto_22932 ) ) ( HOIST-AT ?auto_22935 ?auto_22932 ) ( not ( = ?auto_22929 ?auto_22935 ) ) ( not ( = ?auto_22931 ?auto_22935 ) ) ( SURFACE-AT ?auto_22924 ?auto_22932 ) ( ON ?auto_22924 ?auto_22933 ) ( CLEAR ?auto_22924 ) ( not ( = ?auto_22924 ?auto_22933 ) ) ( not ( = ?auto_22925 ?auto_22933 ) ) ( not ( = ?auto_22936 ?auto_22933 ) ) ( not ( = ?auto_22934 ?auto_22933 ) ) ( SURFACE-AT ?auto_22926 ?auto_22930 ) ( CLEAR ?auto_22926 ) ( IS-CRATE ?auto_22936 ) ( not ( = ?auto_22926 ?auto_22936 ) ) ( not ( = ?auto_22924 ?auto_22926 ) ) ( not ( = ?auto_22925 ?auto_22926 ) ) ( not ( = ?auto_22934 ?auto_22926 ) ) ( not ( = ?auto_22933 ?auto_22926 ) ) ( AVAILABLE ?auto_22929 ) ( TRUCK-AT ?auto_22928 ?auto_22932 ) ( AVAILABLE ?auto_22935 ) ( SURFACE-AT ?auto_22936 ?auto_22932 ) ( ON ?auto_22936 ?auto_22937 ) ( CLEAR ?auto_22936 ) ( not ( = ?auto_22924 ?auto_22937 ) ) ( not ( = ?auto_22925 ?auto_22937 ) ) ( not ( = ?auto_22936 ?auto_22937 ) ) ( not ( = ?auto_22934 ?auto_22937 ) ) ( not ( = ?auto_22933 ?auto_22937 ) ) ( not ( = ?auto_22926 ?auto_22937 ) ) )
    :subtasks
    ( ( !LIFT ?auto_22935 ?auto_22936 ?auto_22937 ?auto_22932 )
      ( MAKE-2CRATE ?auto_22936 ?auto_22924 ?auto_22925 )
      ( MAKE-1CRATE-VERIFY ?auto_22924 ?auto_22925 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22938 - SURFACE
      ?auto_22939 - SURFACE
      ?auto_22940 - SURFACE
    )
    :vars
    (
      ?auto_22942 - HOIST
      ?auto_22947 - PLACE
      ?auto_22946 - PLACE
      ?auto_22943 - HOIST
      ?auto_22944 - SURFACE
      ?auto_22951 - PLACE
      ?auto_22949 - HOIST
      ?auto_22950 - SURFACE
      ?auto_22945 - SURFACE
      ?auto_22948 - TRUCK
      ?auto_22941 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22942 ?auto_22947 ) ( IS-CRATE ?auto_22940 ) ( not ( = ?auto_22939 ?auto_22940 ) ) ( not ( = ?auto_22938 ?auto_22939 ) ) ( not ( = ?auto_22938 ?auto_22940 ) ) ( not ( = ?auto_22946 ?auto_22947 ) ) ( HOIST-AT ?auto_22943 ?auto_22946 ) ( not ( = ?auto_22942 ?auto_22943 ) ) ( AVAILABLE ?auto_22943 ) ( SURFACE-AT ?auto_22940 ?auto_22946 ) ( ON ?auto_22940 ?auto_22944 ) ( CLEAR ?auto_22940 ) ( not ( = ?auto_22939 ?auto_22944 ) ) ( not ( = ?auto_22940 ?auto_22944 ) ) ( not ( = ?auto_22938 ?auto_22944 ) ) ( IS-CRATE ?auto_22939 ) ( not ( = ?auto_22951 ?auto_22947 ) ) ( not ( = ?auto_22946 ?auto_22951 ) ) ( HOIST-AT ?auto_22949 ?auto_22951 ) ( not ( = ?auto_22942 ?auto_22949 ) ) ( not ( = ?auto_22943 ?auto_22949 ) ) ( SURFACE-AT ?auto_22939 ?auto_22951 ) ( ON ?auto_22939 ?auto_22950 ) ( CLEAR ?auto_22939 ) ( not ( = ?auto_22939 ?auto_22950 ) ) ( not ( = ?auto_22940 ?auto_22950 ) ) ( not ( = ?auto_22938 ?auto_22950 ) ) ( not ( = ?auto_22944 ?auto_22950 ) ) ( SURFACE-AT ?auto_22945 ?auto_22947 ) ( CLEAR ?auto_22945 ) ( IS-CRATE ?auto_22938 ) ( not ( = ?auto_22945 ?auto_22938 ) ) ( not ( = ?auto_22939 ?auto_22945 ) ) ( not ( = ?auto_22940 ?auto_22945 ) ) ( not ( = ?auto_22944 ?auto_22945 ) ) ( not ( = ?auto_22950 ?auto_22945 ) ) ( AVAILABLE ?auto_22942 ) ( TRUCK-AT ?auto_22948 ?auto_22951 ) ( AVAILABLE ?auto_22949 ) ( SURFACE-AT ?auto_22938 ?auto_22951 ) ( ON ?auto_22938 ?auto_22941 ) ( CLEAR ?auto_22938 ) ( not ( = ?auto_22939 ?auto_22941 ) ) ( not ( = ?auto_22940 ?auto_22941 ) ) ( not ( = ?auto_22938 ?auto_22941 ) ) ( not ( = ?auto_22944 ?auto_22941 ) ) ( not ( = ?auto_22950 ?auto_22941 ) ) ( not ( = ?auto_22945 ?auto_22941 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22939 ?auto_22940 )
      ( MAKE-2CRATE-VERIFY ?auto_22938 ?auto_22939 ?auto_22940 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22952 - SURFACE
      ?auto_22953 - SURFACE
      ?auto_22954 - SURFACE
      ?auto_22955 - SURFACE
    )
    :vars
    (
      ?auto_22958 - HOIST
      ?auto_22956 - PLACE
      ?auto_22961 - PLACE
      ?auto_22960 - HOIST
      ?auto_22965 - SURFACE
      ?auto_22959 - PLACE
      ?auto_22957 - HOIST
      ?auto_22964 - SURFACE
      ?auto_22963 - TRUCK
      ?auto_22962 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22958 ?auto_22956 ) ( IS-CRATE ?auto_22955 ) ( not ( = ?auto_22954 ?auto_22955 ) ) ( not ( = ?auto_22953 ?auto_22954 ) ) ( not ( = ?auto_22953 ?auto_22955 ) ) ( not ( = ?auto_22961 ?auto_22956 ) ) ( HOIST-AT ?auto_22960 ?auto_22961 ) ( not ( = ?auto_22958 ?auto_22960 ) ) ( AVAILABLE ?auto_22960 ) ( SURFACE-AT ?auto_22955 ?auto_22961 ) ( ON ?auto_22955 ?auto_22965 ) ( CLEAR ?auto_22955 ) ( not ( = ?auto_22954 ?auto_22965 ) ) ( not ( = ?auto_22955 ?auto_22965 ) ) ( not ( = ?auto_22953 ?auto_22965 ) ) ( IS-CRATE ?auto_22954 ) ( not ( = ?auto_22959 ?auto_22956 ) ) ( not ( = ?auto_22961 ?auto_22959 ) ) ( HOIST-AT ?auto_22957 ?auto_22959 ) ( not ( = ?auto_22958 ?auto_22957 ) ) ( not ( = ?auto_22960 ?auto_22957 ) ) ( SURFACE-AT ?auto_22954 ?auto_22959 ) ( ON ?auto_22954 ?auto_22964 ) ( CLEAR ?auto_22954 ) ( not ( = ?auto_22954 ?auto_22964 ) ) ( not ( = ?auto_22955 ?auto_22964 ) ) ( not ( = ?auto_22953 ?auto_22964 ) ) ( not ( = ?auto_22965 ?auto_22964 ) ) ( SURFACE-AT ?auto_22952 ?auto_22956 ) ( CLEAR ?auto_22952 ) ( IS-CRATE ?auto_22953 ) ( not ( = ?auto_22952 ?auto_22953 ) ) ( not ( = ?auto_22954 ?auto_22952 ) ) ( not ( = ?auto_22955 ?auto_22952 ) ) ( not ( = ?auto_22965 ?auto_22952 ) ) ( not ( = ?auto_22964 ?auto_22952 ) ) ( AVAILABLE ?auto_22958 ) ( TRUCK-AT ?auto_22963 ?auto_22959 ) ( AVAILABLE ?auto_22957 ) ( SURFACE-AT ?auto_22953 ?auto_22959 ) ( ON ?auto_22953 ?auto_22962 ) ( CLEAR ?auto_22953 ) ( not ( = ?auto_22954 ?auto_22962 ) ) ( not ( = ?auto_22955 ?auto_22962 ) ) ( not ( = ?auto_22953 ?auto_22962 ) ) ( not ( = ?auto_22965 ?auto_22962 ) ) ( not ( = ?auto_22964 ?auto_22962 ) ) ( not ( = ?auto_22952 ?auto_22962 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22953 ?auto_22954 ?auto_22955 )
      ( MAKE-3CRATE-VERIFY ?auto_22952 ?auto_22953 ?auto_22954 ?auto_22955 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22966 - SURFACE
      ?auto_22967 - SURFACE
      ?auto_22968 - SURFACE
      ?auto_22969 - SURFACE
      ?auto_22970 - SURFACE
    )
    :vars
    (
      ?auto_22973 - HOIST
      ?auto_22971 - PLACE
      ?auto_22976 - PLACE
      ?auto_22975 - HOIST
      ?auto_22980 - SURFACE
      ?auto_22974 - PLACE
      ?auto_22972 - HOIST
      ?auto_22979 - SURFACE
      ?auto_22978 - TRUCK
      ?auto_22977 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22973 ?auto_22971 ) ( IS-CRATE ?auto_22970 ) ( not ( = ?auto_22969 ?auto_22970 ) ) ( not ( = ?auto_22968 ?auto_22969 ) ) ( not ( = ?auto_22968 ?auto_22970 ) ) ( not ( = ?auto_22976 ?auto_22971 ) ) ( HOIST-AT ?auto_22975 ?auto_22976 ) ( not ( = ?auto_22973 ?auto_22975 ) ) ( AVAILABLE ?auto_22975 ) ( SURFACE-AT ?auto_22970 ?auto_22976 ) ( ON ?auto_22970 ?auto_22980 ) ( CLEAR ?auto_22970 ) ( not ( = ?auto_22969 ?auto_22980 ) ) ( not ( = ?auto_22970 ?auto_22980 ) ) ( not ( = ?auto_22968 ?auto_22980 ) ) ( IS-CRATE ?auto_22969 ) ( not ( = ?auto_22974 ?auto_22971 ) ) ( not ( = ?auto_22976 ?auto_22974 ) ) ( HOIST-AT ?auto_22972 ?auto_22974 ) ( not ( = ?auto_22973 ?auto_22972 ) ) ( not ( = ?auto_22975 ?auto_22972 ) ) ( SURFACE-AT ?auto_22969 ?auto_22974 ) ( ON ?auto_22969 ?auto_22979 ) ( CLEAR ?auto_22969 ) ( not ( = ?auto_22969 ?auto_22979 ) ) ( not ( = ?auto_22970 ?auto_22979 ) ) ( not ( = ?auto_22968 ?auto_22979 ) ) ( not ( = ?auto_22980 ?auto_22979 ) ) ( SURFACE-AT ?auto_22967 ?auto_22971 ) ( CLEAR ?auto_22967 ) ( IS-CRATE ?auto_22968 ) ( not ( = ?auto_22967 ?auto_22968 ) ) ( not ( = ?auto_22969 ?auto_22967 ) ) ( not ( = ?auto_22970 ?auto_22967 ) ) ( not ( = ?auto_22980 ?auto_22967 ) ) ( not ( = ?auto_22979 ?auto_22967 ) ) ( AVAILABLE ?auto_22973 ) ( TRUCK-AT ?auto_22978 ?auto_22974 ) ( AVAILABLE ?auto_22972 ) ( SURFACE-AT ?auto_22968 ?auto_22974 ) ( ON ?auto_22968 ?auto_22977 ) ( CLEAR ?auto_22968 ) ( not ( = ?auto_22969 ?auto_22977 ) ) ( not ( = ?auto_22970 ?auto_22977 ) ) ( not ( = ?auto_22968 ?auto_22977 ) ) ( not ( = ?auto_22980 ?auto_22977 ) ) ( not ( = ?auto_22979 ?auto_22977 ) ) ( not ( = ?auto_22967 ?auto_22977 ) ) ( ON ?auto_22967 ?auto_22966 ) ( not ( = ?auto_22966 ?auto_22967 ) ) ( not ( = ?auto_22966 ?auto_22968 ) ) ( not ( = ?auto_22966 ?auto_22969 ) ) ( not ( = ?auto_22966 ?auto_22970 ) ) ( not ( = ?auto_22966 ?auto_22980 ) ) ( not ( = ?auto_22966 ?auto_22979 ) ) ( not ( = ?auto_22966 ?auto_22977 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22968 ?auto_22969 ?auto_22970 )
      ( MAKE-4CRATE-VERIFY ?auto_22966 ?auto_22967 ?auto_22968 ?auto_22969 ?auto_22970 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22981 - SURFACE
      ?auto_22982 - SURFACE
      ?auto_22983 - SURFACE
      ?auto_22984 - SURFACE
      ?auto_22985 - SURFACE
      ?auto_22986 - SURFACE
    )
    :vars
    (
      ?auto_22989 - HOIST
      ?auto_22987 - PLACE
      ?auto_22992 - PLACE
      ?auto_22991 - HOIST
      ?auto_22996 - SURFACE
      ?auto_22990 - PLACE
      ?auto_22988 - HOIST
      ?auto_22995 - SURFACE
      ?auto_22994 - TRUCK
      ?auto_22993 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22989 ?auto_22987 ) ( IS-CRATE ?auto_22986 ) ( not ( = ?auto_22985 ?auto_22986 ) ) ( not ( = ?auto_22984 ?auto_22985 ) ) ( not ( = ?auto_22984 ?auto_22986 ) ) ( not ( = ?auto_22992 ?auto_22987 ) ) ( HOIST-AT ?auto_22991 ?auto_22992 ) ( not ( = ?auto_22989 ?auto_22991 ) ) ( AVAILABLE ?auto_22991 ) ( SURFACE-AT ?auto_22986 ?auto_22992 ) ( ON ?auto_22986 ?auto_22996 ) ( CLEAR ?auto_22986 ) ( not ( = ?auto_22985 ?auto_22996 ) ) ( not ( = ?auto_22986 ?auto_22996 ) ) ( not ( = ?auto_22984 ?auto_22996 ) ) ( IS-CRATE ?auto_22985 ) ( not ( = ?auto_22990 ?auto_22987 ) ) ( not ( = ?auto_22992 ?auto_22990 ) ) ( HOIST-AT ?auto_22988 ?auto_22990 ) ( not ( = ?auto_22989 ?auto_22988 ) ) ( not ( = ?auto_22991 ?auto_22988 ) ) ( SURFACE-AT ?auto_22985 ?auto_22990 ) ( ON ?auto_22985 ?auto_22995 ) ( CLEAR ?auto_22985 ) ( not ( = ?auto_22985 ?auto_22995 ) ) ( not ( = ?auto_22986 ?auto_22995 ) ) ( not ( = ?auto_22984 ?auto_22995 ) ) ( not ( = ?auto_22996 ?auto_22995 ) ) ( SURFACE-AT ?auto_22983 ?auto_22987 ) ( CLEAR ?auto_22983 ) ( IS-CRATE ?auto_22984 ) ( not ( = ?auto_22983 ?auto_22984 ) ) ( not ( = ?auto_22985 ?auto_22983 ) ) ( not ( = ?auto_22986 ?auto_22983 ) ) ( not ( = ?auto_22996 ?auto_22983 ) ) ( not ( = ?auto_22995 ?auto_22983 ) ) ( AVAILABLE ?auto_22989 ) ( TRUCK-AT ?auto_22994 ?auto_22990 ) ( AVAILABLE ?auto_22988 ) ( SURFACE-AT ?auto_22984 ?auto_22990 ) ( ON ?auto_22984 ?auto_22993 ) ( CLEAR ?auto_22984 ) ( not ( = ?auto_22985 ?auto_22993 ) ) ( not ( = ?auto_22986 ?auto_22993 ) ) ( not ( = ?auto_22984 ?auto_22993 ) ) ( not ( = ?auto_22996 ?auto_22993 ) ) ( not ( = ?auto_22995 ?auto_22993 ) ) ( not ( = ?auto_22983 ?auto_22993 ) ) ( ON ?auto_22982 ?auto_22981 ) ( ON ?auto_22983 ?auto_22982 ) ( not ( = ?auto_22981 ?auto_22982 ) ) ( not ( = ?auto_22981 ?auto_22983 ) ) ( not ( = ?auto_22981 ?auto_22984 ) ) ( not ( = ?auto_22981 ?auto_22985 ) ) ( not ( = ?auto_22981 ?auto_22986 ) ) ( not ( = ?auto_22981 ?auto_22996 ) ) ( not ( = ?auto_22981 ?auto_22995 ) ) ( not ( = ?auto_22981 ?auto_22993 ) ) ( not ( = ?auto_22982 ?auto_22983 ) ) ( not ( = ?auto_22982 ?auto_22984 ) ) ( not ( = ?auto_22982 ?auto_22985 ) ) ( not ( = ?auto_22982 ?auto_22986 ) ) ( not ( = ?auto_22982 ?auto_22996 ) ) ( not ( = ?auto_22982 ?auto_22995 ) ) ( not ( = ?auto_22982 ?auto_22993 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22984 ?auto_22985 ?auto_22986 )
      ( MAKE-5CRATE-VERIFY ?auto_22981 ?auto_22982 ?auto_22983 ?auto_22984 ?auto_22985 ?auto_22986 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22997 - SURFACE
      ?auto_22998 - SURFACE
    )
    :vars
    (
      ?auto_23001 - HOIST
      ?auto_22999 - PLACE
      ?auto_23003 - SURFACE
      ?auto_23005 - PLACE
      ?auto_23004 - HOIST
      ?auto_23009 - SURFACE
      ?auto_23002 - PLACE
      ?auto_23000 - HOIST
      ?auto_23008 - SURFACE
      ?auto_23010 - SURFACE
      ?auto_23006 - SURFACE
      ?auto_23007 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23001 ?auto_22999 ) ( IS-CRATE ?auto_22998 ) ( not ( = ?auto_22997 ?auto_22998 ) ) ( not ( = ?auto_23003 ?auto_22997 ) ) ( not ( = ?auto_23003 ?auto_22998 ) ) ( not ( = ?auto_23005 ?auto_22999 ) ) ( HOIST-AT ?auto_23004 ?auto_23005 ) ( not ( = ?auto_23001 ?auto_23004 ) ) ( AVAILABLE ?auto_23004 ) ( SURFACE-AT ?auto_22998 ?auto_23005 ) ( ON ?auto_22998 ?auto_23009 ) ( CLEAR ?auto_22998 ) ( not ( = ?auto_22997 ?auto_23009 ) ) ( not ( = ?auto_22998 ?auto_23009 ) ) ( not ( = ?auto_23003 ?auto_23009 ) ) ( IS-CRATE ?auto_22997 ) ( not ( = ?auto_23002 ?auto_22999 ) ) ( not ( = ?auto_23005 ?auto_23002 ) ) ( HOIST-AT ?auto_23000 ?auto_23002 ) ( not ( = ?auto_23001 ?auto_23000 ) ) ( not ( = ?auto_23004 ?auto_23000 ) ) ( SURFACE-AT ?auto_22997 ?auto_23002 ) ( ON ?auto_22997 ?auto_23008 ) ( CLEAR ?auto_22997 ) ( not ( = ?auto_22997 ?auto_23008 ) ) ( not ( = ?auto_22998 ?auto_23008 ) ) ( not ( = ?auto_23003 ?auto_23008 ) ) ( not ( = ?auto_23009 ?auto_23008 ) ) ( SURFACE-AT ?auto_23010 ?auto_22999 ) ( CLEAR ?auto_23010 ) ( IS-CRATE ?auto_23003 ) ( not ( = ?auto_23010 ?auto_23003 ) ) ( not ( = ?auto_22997 ?auto_23010 ) ) ( not ( = ?auto_22998 ?auto_23010 ) ) ( not ( = ?auto_23009 ?auto_23010 ) ) ( not ( = ?auto_23008 ?auto_23010 ) ) ( AVAILABLE ?auto_23001 ) ( AVAILABLE ?auto_23000 ) ( SURFACE-AT ?auto_23003 ?auto_23002 ) ( ON ?auto_23003 ?auto_23006 ) ( CLEAR ?auto_23003 ) ( not ( = ?auto_22997 ?auto_23006 ) ) ( not ( = ?auto_22998 ?auto_23006 ) ) ( not ( = ?auto_23003 ?auto_23006 ) ) ( not ( = ?auto_23009 ?auto_23006 ) ) ( not ( = ?auto_23008 ?auto_23006 ) ) ( not ( = ?auto_23010 ?auto_23006 ) ) ( TRUCK-AT ?auto_23007 ?auto_22999 ) )
    :subtasks
    ( ( !DRIVE ?auto_23007 ?auto_22999 ?auto_23002 )
      ( MAKE-2CRATE ?auto_23003 ?auto_22997 ?auto_22998 )
      ( MAKE-1CRATE-VERIFY ?auto_22997 ?auto_22998 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23011 - SURFACE
      ?auto_23012 - SURFACE
      ?auto_23013 - SURFACE
    )
    :vars
    (
      ?auto_23022 - HOIST
      ?auto_23015 - PLACE
      ?auto_23020 - PLACE
      ?auto_23014 - HOIST
      ?auto_23018 - SURFACE
      ?auto_23019 - PLACE
      ?auto_23021 - HOIST
      ?auto_23017 - SURFACE
      ?auto_23023 - SURFACE
      ?auto_23024 - SURFACE
      ?auto_23016 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23022 ?auto_23015 ) ( IS-CRATE ?auto_23013 ) ( not ( = ?auto_23012 ?auto_23013 ) ) ( not ( = ?auto_23011 ?auto_23012 ) ) ( not ( = ?auto_23011 ?auto_23013 ) ) ( not ( = ?auto_23020 ?auto_23015 ) ) ( HOIST-AT ?auto_23014 ?auto_23020 ) ( not ( = ?auto_23022 ?auto_23014 ) ) ( AVAILABLE ?auto_23014 ) ( SURFACE-AT ?auto_23013 ?auto_23020 ) ( ON ?auto_23013 ?auto_23018 ) ( CLEAR ?auto_23013 ) ( not ( = ?auto_23012 ?auto_23018 ) ) ( not ( = ?auto_23013 ?auto_23018 ) ) ( not ( = ?auto_23011 ?auto_23018 ) ) ( IS-CRATE ?auto_23012 ) ( not ( = ?auto_23019 ?auto_23015 ) ) ( not ( = ?auto_23020 ?auto_23019 ) ) ( HOIST-AT ?auto_23021 ?auto_23019 ) ( not ( = ?auto_23022 ?auto_23021 ) ) ( not ( = ?auto_23014 ?auto_23021 ) ) ( SURFACE-AT ?auto_23012 ?auto_23019 ) ( ON ?auto_23012 ?auto_23017 ) ( CLEAR ?auto_23012 ) ( not ( = ?auto_23012 ?auto_23017 ) ) ( not ( = ?auto_23013 ?auto_23017 ) ) ( not ( = ?auto_23011 ?auto_23017 ) ) ( not ( = ?auto_23018 ?auto_23017 ) ) ( SURFACE-AT ?auto_23023 ?auto_23015 ) ( CLEAR ?auto_23023 ) ( IS-CRATE ?auto_23011 ) ( not ( = ?auto_23023 ?auto_23011 ) ) ( not ( = ?auto_23012 ?auto_23023 ) ) ( not ( = ?auto_23013 ?auto_23023 ) ) ( not ( = ?auto_23018 ?auto_23023 ) ) ( not ( = ?auto_23017 ?auto_23023 ) ) ( AVAILABLE ?auto_23022 ) ( AVAILABLE ?auto_23021 ) ( SURFACE-AT ?auto_23011 ?auto_23019 ) ( ON ?auto_23011 ?auto_23024 ) ( CLEAR ?auto_23011 ) ( not ( = ?auto_23012 ?auto_23024 ) ) ( not ( = ?auto_23013 ?auto_23024 ) ) ( not ( = ?auto_23011 ?auto_23024 ) ) ( not ( = ?auto_23018 ?auto_23024 ) ) ( not ( = ?auto_23017 ?auto_23024 ) ) ( not ( = ?auto_23023 ?auto_23024 ) ) ( TRUCK-AT ?auto_23016 ?auto_23015 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23012 ?auto_23013 )
      ( MAKE-2CRATE-VERIFY ?auto_23011 ?auto_23012 ?auto_23013 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23025 - SURFACE
      ?auto_23026 - SURFACE
      ?auto_23027 - SURFACE
      ?auto_23028 - SURFACE
    )
    :vars
    (
      ?auto_23032 - HOIST
      ?auto_23030 - PLACE
      ?auto_23033 - PLACE
      ?auto_23037 - HOIST
      ?auto_23034 - SURFACE
      ?auto_23036 - PLACE
      ?auto_23035 - HOIST
      ?auto_23031 - SURFACE
      ?auto_23029 - SURFACE
      ?auto_23038 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23032 ?auto_23030 ) ( IS-CRATE ?auto_23028 ) ( not ( = ?auto_23027 ?auto_23028 ) ) ( not ( = ?auto_23026 ?auto_23027 ) ) ( not ( = ?auto_23026 ?auto_23028 ) ) ( not ( = ?auto_23033 ?auto_23030 ) ) ( HOIST-AT ?auto_23037 ?auto_23033 ) ( not ( = ?auto_23032 ?auto_23037 ) ) ( AVAILABLE ?auto_23037 ) ( SURFACE-AT ?auto_23028 ?auto_23033 ) ( ON ?auto_23028 ?auto_23034 ) ( CLEAR ?auto_23028 ) ( not ( = ?auto_23027 ?auto_23034 ) ) ( not ( = ?auto_23028 ?auto_23034 ) ) ( not ( = ?auto_23026 ?auto_23034 ) ) ( IS-CRATE ?auto_23027 ) ( not ( = ?auto_23036 ?auto_23030 ) ) ( not ( = ?auto_23033 ?auto_23036 ) ) ( HOIST-AT ?auto_23035 ?auto_23036 ) ( not ( = ?auto_23032 ?auto_23035 ) ) ( not ( = ?auto_23037 ?auto_23035 ) ) ( SURFACE-AT ?auto_23027 ?auto_23036 ) ( ON ?auto_23027 ?auto_23031 ) ( CLEAR ?auto_23027 ) ( not ( = ?auto_23027 ?auto_23031 ) ) ( not ( = ?auto_23028 ?auto_23031 ) ) ( not ( = ?auto_23026 ?auto_23031 ) ) ( not ( = ?auto_23034 ?auto_23031 ) ) ( SURFACE-AT ?auto_23025 ?auto_23030 ) ( CLEAR ?auto_23025 ) ( IS-CRATE ?auto_23026 ) ( not ( = ?auto_23025 ?auto_23026 ) ) ( not ( = ?auto_23027 ?auto_23025 ) ) ( not ( = ?auto_23028 ?auto_23025 ) ) ( not ( = ?auto_23034 ?auto_23025 ) ) ( not ( = ?auto_23031 ?auto_23025 ) ) ( AVAILABLE ?auto_23032 ) ( AVAILABLE ?auto_23035 ) ( SURFACE-AT ?auto_23026 ?auto_23036 ) ( ON ?auto_23026 ?auto_23029 ) ( CLEAR ?auto_23026 ) ( not ( = ?auto_23027 ?auto_23029 ) ) ( not ( = ?auto_23028 ?auto_23029 ) ) ( not ( = ?auto_23026 ?auto_23029 ) ) ( not ( = ?auto_23034 ?auto_23029 ) ) ( not ( = ?auto_23031 ?auto_23029 ) ) ( not ( = ?auto_23025 ?auto_23029 ) ) ( TRUCK-AT ?auto_23038 ?auto_23030 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23026 ?auto_23027 ?auto_23028 )
      ( MAKE-3CRATE-VERIFY ?auto_23025 ?auto_23026 ?auto_23027 ?auto_23028 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23039 - SURFACE
      ?auto_23040 - SURFACE
      ?auto_23041 - SURFACE
      ?auto_23042 - SURFACE
      ?auto_23043 - SURFACE
    )
    :vars
    (
      ?auto_23047 - HOIST
      ?auto_23045 - PLACE
      ?auto_23048 - PLACE
      ?auto_23052 - HOIST
      ?auto_23049 - SURFACE
      ?auto_23051 - PLACE
      ?auto_23050 - HOIST
      ?auto_23046 - SURFACE
      ?auto_23044 - SURFACE
      ?auto_23053 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23047 ?auto_23045 ) ( IS-CRATE ?auto_23043 ) ( not ( = ?auto_23042 ?auto_23043 ) ) ( not ( = ?auto_23041 ?auto_23042 ) ) ( not ( = ?auto_23041 ?auto_23043 ) ) ( not ( = ?auto_23048 ?auto_23045 ) ) ( HOIST-AT ?auto_23052 ?auto_23048 ) ( not ( = ?auto_23047 ?auto_23052 ) ) ( AVAILABLE ?auto_23052 ) ( SURFACE-AT ?auto_23043 ?auto_23048 ) ( ON ?auto_23043 ?auto_23049 ) ( CLEAR ?auto_23043 ) ( not ( = ?auto_23042 ?auto_23049 ) ) ( not ( = ?auto_23043 ?auto_23049 ) ) ( not ( = ?auto_23041 ?auto_23049 ) ) ( IS-CRATE ?auto_23042 ) ( not ( = ?auto_23051 ?auto_23045 ) ) ( not ( = ?auto_23048 ?auto_23051 ) ) ( HOIST-AT ?auto_23050 ?auto_23051 ) ( not ( = ?auto_23047 ?auto_23050 ) ) ( not ( = ?auto_23052 ?auto_23050 ) ) ( SURFACE-AT ?auto_23042 ?auto_23051 ) ( ON ?auto_23042 ?auto_23046 ) ( CLEAR ?auto_23042 ) ( not ( = ?auto_23042 ?auto_23046 ) ) ( not ( = ?auto_23043 ?auto_23046 ) ) ( not ( = ?auto_23041 ?auto_23046 ) ) ( not ( = ?auto_23049 ?auto_23046 ) ) ( SURFACE-AT ?auto_23040 ?auto_23045 ) ( CLEAR ?auto_23040 ) ( IS-CRATE ?auto_23041 ) ( not ( = ?auto_23040 ?auto_23041 ) ) ( not ( = ?auto_23042 ?auto_23040 ) ) ( not ( = ?auto_23043 ?auto_23040 ) ) ( not ( = ?auto_23049 ?auto_23040 ) ) ( not ( = ?auto_23046 ?auto_23040 ) ) ( AVAILABLE ?auto_23047 ) ( AVAILABLE ?auto_23050 ) ( SURFACE-AT ?auto_23041 ?auto_23051 ) ( ON ?auto_23041 ?auto_23044 ) ( CLEAR ?auto_23041 ) ( not ( = ?auto_23042 ?auto_23044 ) ) ( not ( = ?auto_23043 ?auto_23044 ) ) ( not ( = ?auto_23041 ?auto_23044 ) ) ( not ( = ?auto_23049 ?auto_23044 ) ) ( not ( = ?auto_23046 ?auto_23044 ) ) ( not ( = ?auto_23040 ?auto_23044 ) ) ( TRUCK-AT ?auto_23053 ?auto_23045 ) ( ON ?auto_23040 ?auto_23039 ) ( not ( = ?auto_23039 ?auto_23040 ) ) ( not ( = ?auto_23039 ?auto_23041 ) ) ( not ( = ?auto_23039 ?auto_23042 ) ) ( not ( = ?auto_23039 ?auto_23043 ) ) ( not ( = ?auto_23039 ?auto_23049 ) ) ( not ( = ?auto_23039 ?auto_23046 ) ) ( not ( = ?auto_23039 ?auto_23044 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23041 ?auto_23042 ?auto_23043 )
      ( MAKE-4CRATE-VERIFY ?auto_23039 ?auto_23040 ?auto_23041 ?auto_23042 ?auto_23043 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23054 - SURFACE
      ?auto_23055 - SURFACE
      ?auto_23056 - SURFACE
      ?auto_23057 - SURFACE
      ?auto_23058 - SURFACE
      ?auto_23059 - SURFACE
    )
    :vars
    (
      ?auto_23063 - HOIST
      ?auto_23061 - PLACE
      ?auto_23064 - PLACE
      ?auto_23068 - HOIST
      ?auto_23065 - SURFACE
      ?auto_23067 - PLACE
      ?auto_23066 - HOIST
      ?auto_23062 - SURFACE
      ?auto_23060 - SURFACE
      ?auto_23069 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23063 ?auto_23061 ) ( IS-CRATE ?auto_23059 ) ( not ( = ?auto_23058 ?auto_23059 ) ) ( not ( = ?auto_23057 ?auto_23058 ) ) ( not ( = ?auto_23057 ?auto_23059 ) ) ( not ( = ?auto_23064 ?auto_23061 ) ) ( HOIST-AT ?auto_23068 ?auto_23064 ) ( not ( = ?auto_23063 ?auto_23068 ) ) ( AVAILABLE ?auto_23068 ) ( SURFACE-AT ?auto_23059 ?auto_23064 ) ( ON ?auto_23059 ?auto_23065 ) ( CLEAR ?auto_23059 ) ( not ( = ?auto_23058 ?auto_23065 ) ) ( not ( = ?auto_23059 ?auto_23065 ) ) ( not ( = ?auto_23057 ?auto_23065 ) ) ( IS-CRATE ?auto_23058 ) ( not ( = ?auto_23067 ?auto_23061 ) ) ( not ( = ?auto_23064 ?auto_23067 ) ) ( HOIST-AT ?auto_23066 ?auto_23067 ) ( not ( = ?auto_23063 ?auto_23066 ) ) ( not ( = ?auto_23068 ?auto_23066 ) ) ( SURFACE-AT ?auto_23058 ?auto_23067 ) ( ON ?auto_23058 ?auto_23062 ) ( CLEAR ?auto_23058 ) ( not ( = ?auto_23058 ?auto_23062 ) ) ( not ( = ?auto_23059 ?auto_23062 ) ) ( not ( = ?auto_23057 ?auto_23062 ) ) ( not ( = ?auto_23065 ?auto_23062 ) ) ( SURFACE-AT ?auto_23056 ?auto_23061 ) ( CLEAR ?auto_23056 ) ( IS-CRATE ?auto_23057 ) ( not ( = ?auto_23056 ?auto_23057 ) ) ( not ( = ?auto_23058 ?auto_23056 ) ) ( not ( = ?auto_23059 ?auto_23056 ) ) ( not ( = ?auto_23065 ?auto_23056 ) ) ( not ( = ?auto_23062 ?auto_23056 ) ) ( AVAILABLE ?auto_23063 ) ( AVAILABLE ?auto_23066 ) ( SURFACE-AT ?auto_23057 ?auto_23067 ) ( ON ?auto_23057 ?auto_23060 ) ( CLEAR ?auto_23057 ) ( not ( = ?auto_23058 ?auto_23060 ) ) ( not ( = ?auto_23059 ?auto_23060 ) ) ( not ( = ?auto_23057 ?auto_23060 ) ) ( not ( = ?auto_23065 ?auto_23060 ) ) ( not ( = ?auto_23062 ?auto_23060 ) ) ( not ( = ?auto_23056 ?auto_23060 ) ) ( TRUCK-AT ?auto_23069 ?auto_23061 ) ( ON ?auto_23055 ?auto_23054 ) ( ON ?auto_23056 ?auto_23055 ) ( not ( = ?auto_23054 ?auto_23055 ) ) ( not ( = ?auto_23054 ?auto_23056 ) ) ( not ( = ?auto_23054 ?auto_23057 ) ) ( not ( = ?auto_23054 ?auto_23058 ) ) ( not ( = ?auto_23054 ?auto_23059 ) ) ( not ( = ?auto_23054 ?auto_23065 ) ) ( not ( = ?auto_23054 ?auto_23062 ) ) ( not ( = ?auto_23054 ?auto_23060 ) ) ( not ( = ?auto_23055 ?auto_23056 ) ) ( not ( = ?auto_23055 ?auto_23057 ) ) ( not ( = ?auto_23055 ?auto_23058 ) ) ( not ( = ?auto_23055 ?auto_23059 ) ) ( not ( = ?auto_23055 ?auto_23065 ) ) ( not ( = ?auto_23055 ?auto_23062 ) ) ( not ( = ?auto_23055 ?auto_23060 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23057 ?auto_23058 ?auto_23059 )
      ( MAKE-5CRATE-VERIFY ?auto_23054 ?auto_23055 ?auto_23056 ?auto_23057 ?auto_23058 ?auto_23059 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23070 - SURFACE
      ?auto_23071 - SURFACE
    )
    :vars
    (
      ?auto_23076 - HOIST
      ?auto_23074 - PLACE
      ?auto_23083 - SURFACE
      ?auto_23077 - PLACE
      ?auto_23081 - HOIST
      ?auto_23078 - SURFACE
      ?auto_23080 - PLACE
      ?auto_23079 - HOIST
      ?auto_23075 - SURFACE
      ?auto_23073 - SURFACE
      ?auto_23072 - SURFACE
      ?auto_23082 - TRUCK
      ?auto_23084 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23076 ?auto_23074 ) ( IS-CRATE ?auto_23071 ) ( not ( = ?auto_23070 ?auto_23071 ) ) ( not ( = ?auto_23083 ?auto_23070 ) ) ( not ( = ?auto_23083 ?auto_23071 ) ) ( not ( = ?auto_23077 ?auto_23074 ) ) ( HOIST-AT ?auto_23081 ?auto_23077 ) ( not ( = ?auto_23076 ?auto_23081 ) ) ( AVAILABLE ?auto_23081 ) ( SURFACE-AT ?auto_23071 ?auto_23077 ) ( ON ?auto_23071 ?auto_23078 ) ( CLEAR ?auto_23071 ) ( not ( = ?auto_23070 ?auto_23078 ) ) ( not ( = ?auto_23071 ?auto_23078 ) ) ( not ( = ?auto_23083 ?auto_23078 ) ) ( IS-CRATE ?auto_23070 ) ( not ( = ?auto_23080 ?auto_23074 ) ) ( not ( = ?auto_23077 ?auto_23080 ) ) ( HOIST-AT ?auto_23079 ?auto_23080 ) ( not ( = ?auto_23076 ?auto_23079 ) ) ( not ( = ?auto_23081 ?auto_23079 ) ) ( SURFACE-AT ?auto_23070 ?auto_23080 ) ( ON ?auto_23070 ?auto_23075 ) ( CLEAR ?auto_23070 ) ( not ( = ?auto_23070 ?auto_23075 ) ) ( not ( = ?auto_23071 ?auto_23075 ) ) ( not ( = ?auto_23083 ?auto_23075 ) ) ( not ( = ?auto_23078 ?auto_23075 ) ) ( IS-CRATE ?auto_23083 ) ( not ( = ?auto_23073 ?auto_23083 ) ) ( not ( = ?auto_23070 ?auto_23073 ) ) ( not ( = ?auto_23071 ?auto_23073 ) ) ( not ( = ?auto_23078 ?auto_23073 ) ) ( not ( = ?auto_23075 ?auto_23073 ) ) ( AVAILABLE ?auto_23079 ) ( SURFACE-AT ?auto_23083 ?auto_23080 ) ( ON ?auto_23083 ?auto_23072 ) ( CLEAR ?auto_23083 ) ( not ( = ?auto_23070 ?auto_23072 ) ) ( not ( = ?auto_23071 ?auto_23072 ) ) ( not ( = ?auto_23083 ?auto_23072 ) ) ( not ( = ?auto_23078 ?auto_23072 ) ) ( not ( = ?auto_23075 ?auto_23072 ) ) ( not ( = ?auto_23073 ?auto_23072 ) ) ( TRUCK-AT ?auto_23082 ?auto_23074 ) ( SURFACE-AT ?auto_23084 ?auto_23074 ) ( CLEAR ?auto_23084 ) ( LIFTING ?auto_23076 ?auto_23073 ) ( IS-CRATE ?auto_23073 ) ( not ( = ?auto_23084 ?auto_23073 ) ) ( not ( = ?auto_23070 ?auto_23084 ) ) ( not ( = ?auto_23071 ?auto_23084 ) ) ( not ( = ?auto_23083 ?auto_23084 ) ) ( not ( = ?auto_23078 ?auto_23084 ) ) ( not ( = ?auto_23075 ?auto_23084 ) ) ( not ( = ?auto_23072 ?auto_23084 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23084 ?auto_23073 )
      ( MAKE-2CRATE ?auto_23083 ?auto_23070 ?auto_23071 )
      ( MAKE-1CRATE-VERIFY ?auto_23070 ?auto_23071 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23085 - SURFACE
      ?auto_23086 - SURFACE
      ?auto_23087 - SURFACE
    )
    :vars
    (
      ?auto_23098 - HOIST
      ?auto_23088 - PLACE
      ?auto_23096 - PLACE
      ?auto_23099 - HOIST
      ?auto_23093 - SURFACE
      ?auto_23091 - PLACE
      ?auto_23097 - HOIST
      ?auto_23094 - SURFACE
      ?auto_23090 - SURFACE
      ?auto_23092 - SURFACE
      ?auto_23095 - TRUCK
      ?auto_23089 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23098 ?auto_23088 ) ( IS-CRATE ?auto_23087 ) ( not ( = ?auto_23086 ?auto_23087 ) ) ( not ( = ?auto_23085 ?auto_23086 ) ) ( not ( = ?auto_23085 ?auto_23087 ) ) ( not ( = ?auto_23096 ?auto_23088 ) ) ( HOIST-AT ?auto_23099 ?auto_23096 ) ( not ( = ?auto_23098 ?auto_23099 ) ) ( AVAILABLE ?auto_23099 ) ( SURFACE-AT ?auto_23087 ?auto_23096 ) ( ON ?auto_23087 ?auto_23093 ) ( CLEAR ?auto_23087 ) ( not ( = ?auto_23086 ?auto_23093 ) ) ( not ( = ?auto_23087 ?auto_23093 ) ) ( not ( = ?auto_23085 ?auto_23093 ) ) ( IS-CRATE ?auto_23086 ) ( not ( = ?auto_23091 ?auto_23088 ) ) ( not ( = ?auto_23096 ?auto_23091 ) ) ( HOIST-AT ?auto_23097 ?auto_23091 ) ( not ( = ?auto_23098 ?auto_23097 ) ) ( not ( = ?auto_23099 ?auto_23097 ) ) ( SURFACE-AT ?auto_23086 ?auto_23091 ) ( ON ?auto_23086 ?auto_23094 ) ( CLEAR ?auto_23086 ) ( not ( = ?auto_23086 ?auto_23094 ) ) ( not ( = ?auto_23087 ?auto_23094 ) ) ( not ( = ?auto_23085 ?auto_23094 ) ) ( not ( = ?auto_23093 ?auto_23094 ) ) ( IS-CRATE ?auto_23085 ) ( not ( = ?auto_23090 ?auto_23085 ) ) ( not ( = ?auto_23086 ?auto_23090 ) ) ( not ( = ?auto_23087 ?auto_23090 ) ) ( not ( = ?auto_23093 ?auto_23090 ) ) ( not ( = ?auto_23094 ?auto_23090 ) ) ( AVAILABLE ?auto_23097 ) ( SURFACE-AT ?auto_23085 ?auto_23091 ) ( ON ?auto_23085 ?auto_23092 ) ( CLEAR ?auto_23085 ) ( not ( = ?auto_23086 ?auto_23092 ) ) ( not ( = ?auto_23087 ?auto_23092 ) ) ( not ( = ?auto_23085 ?auto_23092 ) ) ( not ( = ?auto_23093 ?auto_23092 ) ) ( not ( = ?auto_23094 ?auto_23092 ) ) ( not ( = ?auto_23090 ?auto_23092 ) ) ( TRUCK-AT ?auto_23095 ?auto_23088 ) ( SURFACE-AT ?auto_23089 ?auto_23088 ) ( CLEAR ?auto_23089 ) ( LIFTING ?auto_23098 ?auto_23090 ) ( IS-CRATE ?auto_23090 ) ( not ( = ?auto_23089 ?auto_23090 ) ) ( not ( = ?auto_23086 ?auto_23089 ) ) ( not ( = ?auto_23087 ?auto_23089 ) ) ( not ( = ?auto_23085 ?auto_23089 ) ) ( not ( = ?auto_23093 ?auto_23089 ) ) ( not ( = ?auto_23094 ?auto_23089 ) ) ( not ( = ?auto_23092 ?auto_23089 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23086 ?auto_23087 )
      ( MAKE-2CRATE-VERIFY ?auto_23085 ?auto_23086 ?auto_23087 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23100 - SURFACE
      ?auto_23101 - SURFACE
      ?auto_23102 - SURFACE
      ?auto_23103 - SURFACE
    )
    :vars
    (
      ?auto_23111 - HOIST
      ?auto_23104 - PLACE
      ?auto_23114 - PLACE
      ?auto_23108 - HOIST
      ?auto_23109 - SURFACE
      ?auto_23112 - PLACE
      ?auto_23113 - HOIST
      ?auto_23107 - SURFACE
      ?auto_23106 - SURFACE
      ?auto_23110 - TRUCK
      ?auto_23105 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23111 ?auto_23104 ) ( IS-CRATE ?auto_23103 ) ( not ( = ?auto_23102 ?auto_23103 ) ) ( not ( = ?auto_23101 ?auto_23102 ) ) ( not ( = ?auto_23101 ?auto_23103 ) ) ( not ( = ?auto_23114 ?auto_23104 ) ) ( HOIST-AT ?auto_23108 ?auto_23114 ) ( not ( = ?auto_23111 ?auto_23108 ) ) ( AVAILABLE ?auto_23108 ) ( SURFACE-AT ?auto_23103 ?auto_23114 ) ( ON ?auto_23103 ?auto_23109 ) ( CLEAR ?auto_23103 ) ( not ( = ?auto_23102 ?auto_23109 ) ) ( not ( = ?auto_23103 ?auto_23109 ) ) ( not ( = ?auto_23101 ?auto_23109 ) ) ( IS-CRATE ?auto_23102 ) ( not ( = ?auto_23112 ?auto_23104 ) ) ( not ( = ?auto_23114 ?auto_23112 ) ) ( HOIST-AT ?auto_23113 ?auto_23112 ) ( not ( = ?auto_23111 ?auto_23113 ) ) ( not ( = ?auto_23108 ?auto_23113 ) ) ( SURFACE-AT ?auto_23102 ?auto_23112 ) ( ON ?auto_23102 ?auto_23107 ) ( CLEAR ?auto_23102 ) ( not ( = ?auto_23102 ?auto_23107 ) ) ( not ( = ?auto_23103 ?auto_23107 ) ) ( not ( = ?auto_23101 ?auto_23107 ) ) ( not ( = ?auto_23109 ?auto_23107 ) ) ( IS-CRATE ?auto_23101 ) ( not ( = ?auto_23100 ?auto_23101 ) ) ( not ( = ?auto_23102 ?auto_23100 ) ) ( not ( = ?auto_23103 ?auto_23100 ) ) ( not ( = ?auto_23109 ?auto_23100 ) ) ( not ( = ?auto_23107 ?auto_23100 ) ) ( AVAILABLE ?auto_23113 ) ( SURFACE-AT ?auto_23101 ?auto_23112 ) ( ON ?auto_23101 ?auto_23106 ) ( CLEAR ?auto_23101 ) ( not ( = ?auto_23102 ?auto_23106 ) ) ( not ( = ?auto_23103 ?auto_23106 ) ) ( not ( = ?auto_23101 ?auto_23106 ) ) ( not ( = ?auto_23109 ?auto_23106 ) ) ( not ( = ?auto_23107 ?auto_23106 ) ) ( not ( = ?auto_23100 ?auto_23106 ) ) ( TRUCK-AT ?auto_23110 ?auto_23104 ) ( SURFACE-AT ?auto_23105 ?auto_23104 ) ( CLEAR ?auto_23105 ) ( LIFTING ?auto_23111 ?auto_23100 ) ( IS-CRATE ?auto_23100 ) ( not ( = ?auto_23105 ?auto_23100 ) ) ( not ( = ?auto_23102 ?auto_23105 ) ) ( not ( = ?auto_23103 ?auto_23105 ) ) ( not ( = ?auto_23101 ?auto_23105 ) ) ( not ( = ?auto_23109 ?auto_23105 ) ) ( not ( = ?auto_23107 ?auto_23105 ) ) ( not ( = ?auto_23106 ?auto_23105 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23101 ?auto_23102 ?auto_23103 )
      ( MAKE-3CRATE-VERIFY ?auto_23100 ?auto_23101 ?auto_23102 ?auto_23103 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23115 - SURFACE
      ?auto_23116 - SURFACE
      ?auto_23117 - SURFACE
      ?auto_23118 - SURFACE
      ?auto_23119 - SURFACE
    )
    :vars
    (
      ?auto_23126 - HOIST
      ?auto_23120 - PLACE
      ?auto_23129 - PLACE
      ?auto_23123 - HOIST
      ?auto_23124 - SURFACE
      ?auto_23127 - PLACE
      ?auto_23128 - HOIST
      ?auto_23122 - SURFACE
      ?auto_23121 - SURFACE
      ?auto_23125 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23126 ?auto_23120 ) ( IS-CRATE ?auto_23119 ) ( not ( = ?auto_23118 ?auto_23119 ) ) ( not ( = ?auto_23117 ?auto_23118 ) ) ( not ( = ?auto_23117 ?auto_23119 ) ) ( not ( = ?auto_23129 ?auto_23120 ) ) ( HOIST-AT ?auto_23123 ?auto_23129 ) ( not ( = ?auto_23126 ?auto_23123 ) ) ( AVAILABLE ?auto_23123 ) ( SURFACE-AT ?auto_23119 ?auto_23129 ) ( ON ?auto_23119 ?auto_23124 ) ( CLEAR ?auto_23119 ) ( not ( = ?auto_23118 ?auto_23124 ) ) ( not ( = ?auto_23119 ?auto_23124 ) ) ( not ( = ?auto_23117 ?auto_23124 ) ) ( IS-CRATE ?auto_23118 ) ( not ( = ?auto_23127 ?auto_23120 ) ) ( not ( = ?auto_23129 ?auto_23127 ) ) ( HOIST-AT ?auto_23128 ?auto_23127 ) ( not ( = ?auto_23126 ?auto_23128 ) ) ( not ( = ?auto_23123 ?auto_23128 ) ) ( SURFACE-AT ?auto_23118 ?auto_23127 ) ( ON ?auto_23118 ?auto_23122 ) ( CLEAR ?auto_23118 ) ( not ( = ?auto_23118 ?auto_23122 ) ) ( not ( = ?auto_23119 ?auto_23122 ) ) ( not ( = ?auto_23117 ?auto_23122 ) ) ( not ( = ?auto_23124 ?auto_23122 ) ) ( IS-CRATE ?auto_23117 ) ( not ( = ?auto_23116 ?auto_23117 ) ) ( not ( = ?auto_23118 ?auto_23116 ) ) ( not ( = ?auto_23119 ?auto_23116 ) ) ( not ( = ?auto_23124 ?auto_23116 ) ) ( not ( = ?auto_23122 ?auto_23116 ) ) ( AVAILABLE ?auto_23128 ) ( SURFACE-AT ?auto_23117 ?auto_23127 ) ( ON ?auto_23117 ?auto_23121 ) ( CLEAR ?auto_23117 ) ( not ( = ?auto_23118 ?auto_23121 ) ) ( not ( = ?auto_23119 ?auto_23121 ) ) ( not ( = ?auto_23117 ?auto_23121 ) ) ( not ( = ?auto_23124 ?auto_23121 ) ) ( not ( = ?auto_23122 ?auto_23121 ) ) ( not ( = ?auto_23116 ?auto_23121 ) ) ( TRUCK-AT ?auto_23125 ?auto_23120 ) ( SURFACE-AT ?auto_23115 ?auto_23120 ) ( CLEAR ?auto_23115 ) ( LIFTING ?auto_23126 ?auto_23116 ) ( IS-CRATE ?auto_23116 ) ( not ( = ?auto_23115 ?auto_23116 ) ) ( not ( = ?auto_23118 ?auto_23115 ) ) ( not ( = ?auto_23119 ?auto_23115 ) ) ( not ( = ?auto_23117 ?auto_23115 ) ) ( not ( = ?auto_23124 ?auto_23115 ) ) ( not ( = ?auto_23122 ?auto_23115 ) ) ( not ( = ?auto_23121 ?auto_23115 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23117 ?auto_23118 ?auto_23119 )
      ( MAKE-4CRATE-VERIFY ?auto_23115 ?auto_23116 ?auto_23117 ?auto_23118 ?auto_23119 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23130 - SURFACE
      ?auto_23131 - SURFACE
      ?auto_23132 - SURFACE
      ?auto_23133 - SURFACE
      ?auto_23134 - SURFACE
      ?auto_23135 - SURFACE
    )
    :vars
    (
      ?auto_23142 - HOIST
      ?auto_23136 - PLACE
      ?auto_23145 - PLACE
      ?auto_23139 - HOIST
      ?auto_23140 - SURFACE
      ?auto_23143 - PLACE
      ?auto_23144 - HOIST
      ?auto_23138 - SURFACE
      ?auto_23137 - SURFACE
      ?auto_23141 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23142 ?auto_23136 ) ( IS-CRATE ?auto_23135 ) ( not ( = ?auto_23134 ?auto_23135 ) ) ( not ( = ?auto_23133 ?auto_23134 ) ) ( not ( = ?auto_23133 ?auto_23135 ) ) ( not ( = ?auto_23145 ?auto_23136 ) ) ( HOIST-AT ?auto_23139 ?auto_23145 ) ( not ( = ?auto_23142 ?auto_23139 ) ) ( AVAILABLE ?auto_23139 ) ( SURFACE-AT ?auto_23135 ?auto_23145 ) ( ON ?auto_23135 ?auto_23140 ) ( CLEAR ?auto_23135 ) ( not ( = ?auto_23134 ?auto_23140 ) ) ( not ( = ?auto_23135 ?auto_23140 ) ) ( not ( = ?auto_23133 ?auto_23140 ) ) ( IS-CRATE ?auto_23134 ) ( not ( = ?auto_23143 ?auto_23136 ) ) ( not ( = ?auto_23145 ?auto_23143 ) ) ( HOIST-AT ?auto_23144 ?auto_23143 ) ( not ( = ?auto_23142 ?auto_23144 ) ) ( not ( = ?auto_23139 ?auto_23144 ) ) ( SURFACE-AT ?auto_23134 ?auto_23143 ) ( ON ?auto_23134 ?auto_23138 ) ( CLEAR ?auto_23134 ) ( not ( = ?auto_23134 ?auto_23138 ) ) ( not ( = ?auto_23135 ?auto_23138 ) ) ( not ( = ?auto_23133 ?auto_23138 ) ) ( not ( = ?auto_23140 ?auto_23138 ) ) ( IS-CRATE ?auto_23133 ) ( not ( = ?auto_23132 ?auto_23133 ) ) ( not ( = ?auto_23134 ?auto_23132 ) ) ( not ( = ?auto_23135 ?auto_23132 ) ) ( not ( = ?auto_23140 ?auto_23132 ) ) ( not ( = ?auto_23138 ?auto_23132 ) ) ( AVAILABLE ?auto_23144 ) ( SURFACE-AT ?auto_23133 ?auto_23143 ) ( ON ?auto_23133 ?auto_23137 ) ( CLEAR ?auto_23133 ) ( not ( = ?auto_23134 ?auto_23137 ) ) ( not ( = ?auto_23135 ?auto_23137 ) ) ( not ( = ?auto_23133 ?auto_23137 ) ) ( not ( = ?auto_23140 ?auto_23137 ) ) ( not ( = ?auto_23138 ?auto_23137 ) ) ( not ( = ?auto_23132 ?auto_23137 ) ) ( TRUCK-AT ?auto_23141 ?auto_23136 ) ( SURFACE-AT ?auto_23131 ?auto_23136 ) ( CLEAR ?auto_23131 ) ( LIFTING ?auto_23142 ?auto_23132 ) ( IS-CRATE ?auto_23132 ) ( not ( = ?auto_23131 ?auto_23132 ) ) ( not ( = ?auto_23134 ?auto_23131 ) ) ( not ( = ?auto_23135 ?auto_23131 ) ) ( not ( = ?auto_23133 ?auto_23131 ) ) ( not ( = ?auto_23140 ?auto_23131 ) ) ( not ( = ?auto_23138 ?auto_23131 ) ) ( not ( = ?auto_23137 ?auto_23131 ) ) ( ON ?auto_23131 ?auto_23130 ) ( not ( = ?auto_23130 ?auto_23131 ) ) ( not ( = ?auto_23130 ?auto_23132 ) ) ( not ( = ?auto_23130 ?auto_23133 ) ) ( not ( = ?auto_23130 ?auto_23134 ) ) ( not ( = ?auto_23130 ?auto_23135 ) ) ( not ( = ?auto_23130 ?auto_23140 ) ) ( not ( = ?auto_23130 ?auto_23138 ) ) ( not ( = ?auto_23130 ?auto_23137 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23133 ?auto_23134 ?auto_23135 )
      ( MAKE-5CRATE-VERIFY ?auto_23130 ?auto_23131 ?auto_23132 ?auto_23133 ?auto_23134 ?auto_23135 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23146 - SURFACE
      ?auto_23147 - SURFACE
    )
    :vars
    (
      ?auto_23156 - HOIST
      ?auto_23148 - PLACE
      ?auto_23160 - SURFACE
      ?auto_23159 - PLACE
      ?auto_23152 - HOIST
      ?auto_23153 - SURFACE
      ?auto_23157 - PLACE
      ?auto_23158 - HOIST
      ?auto_23151 - SURFACE
      ?auto_23154 - SURFACE
      ?auto_23150 - SURFACE
      ?auto_23155 - TRUCK
      ?auto_23149 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23156 ?auto_23148 ) ( IS-CRATE ?auto_23147 ) ( not ( = ?auto_23146 ?auto_23147 ) ) ( not ( = ?auto_23160 ?auto_23146 ) ) ( not ( = ?auto_23160 ?auto_23147 ) ) ( not ( = ?auto_23159 ?auto_23148 ) ) ( HOIST-AT ?auto_23152 ?auto_23159 ) ( not ( = ?auto_23156 ?auto_23152 ) ) ( AVAILABLE ?auto_23152 ) ( SURFACE-AT ?auto_23147 ?auto_23159 ) ( ON ?auto_23147 ?auto_23153 ) ( CLEAR ?auto_23147 ) ( not ( = ?auto_23146 ?auto_23153 ) ) ( not ( = ?auto_23147 ?auto_23153 ) ) ( not ( = ?auto_23160 ?auto_23153 ) ) ( IS-CRATE ?auto_23146 ) ( not ( = ?auto_23157 ?auto_23148 ) ) ( not ( = ?auto_23159 ?auto_23157 ) ) ( HOIST-AT ?auto_23158 ?auto_23157 ) ( not ( = ?auto_23156 ?auto_23158 ) ) ( not ( = ?auto_23152 ?auto_23158 ) ) ( SURFACE-AT ?auto_23146 ?auto_23157 ) ( ON ?auto_23146 ?auto_23151 ) ( CLEAR ?auto_23146 ) ( not ( = ?auto_23146 ?auto_23151 ) ) ( not ( = ?auto_23147 ?auto_23151 ) ) ( not ( = ?auto_23160 ?auto_23151 ) ) ( not ( = ?auto_23153 ?auto_23151 ) ) ( IS-CRATE ?auto_23160 ) ( not ( = ?auto_23154 ?auto_23160 ) ) ( not ( = ?auto_23146 ?auto_23154 ) ) ( not ( = ?auto_23147 ?auto_23154 ) ) ( not ( = ?auto_23153 ?auto_23154 ) ) ( not ( = ?auto_23151 ?auto_23154 ) ) ( AVAILABLE ?auto_23158 ) ( SURFACE-AT ?auto_23160 ?auto_23157 ) ( ON ?auto_23160 ?auto_23150 ) ( CLEAR ?auto_23160 ) ( not ( = ?auto_23146 ?auto_23150 ) ) ( not ( = ?auto_23147 ?auto_23150 ) ) ( not ( = ?auto_23160 ?auto_23150 ) ) ( not ( = ?auto_23153 ?auto_23150 ) ) ( not ( = ?auto_23151 ?auto_23150 ) ) ( not ( = ?auto_23154 ?auto_23150 ) ) ( TRUCK-AT ?auto_23155 ?auto_23148 ) ( SURFACE-AT ?auto_23149 ?auto_23148 ) ( CLEAR ?auto_23149 ) ( IS-CRATE ?auto_23154 ) ( not ( = ?auto_23149 ?auto_23154 ) ) ( not ( = ?auto_23146 ?auto_23149 ) ) ( not ( = ?auto_23147 ?auto_23149 ) ) ( not ( = ?auto_23160 ?auto_23149 ) ) ( not ( = ?auto_23153 ?auto_23149 ) ) ( not ( = ?auto_23151 ?auto_23149 ) ) ( not ( = ?auto_23150 ?auto_23149 ) ) ( AVAILABLE ?auto_23156 ) ( IN ?auto_23154 ?auto_23155 ) )
    :subtasks
    ( ( !UNLOAD ?auto_23156 ?auto_23154 ?auto_23155 ?auto_23148 )
      ( MAKE-2CRATE ?auto_23160 ?auto_23146 ?auto_23147 )
      ( MAKE-1CRATE-VERIFY ?auto_23146 ?auto_23147 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23161 - SURFACE
      ?auto_23162 - SURFACE
      ?auto_23163 - SURFACE
    )
    :vars
    (
      ?auto_23166 - HOIST
      ?auto_23171 - PLACE
      ?auto_23169 - PLACE
      ?auto_23174 - HOIST
      ?auto_23175 - SURFACE
      ?auto_23167 - PLACE
      ?auto_23173 - HOIST
      ?auto_23168 - SURFACE
      ?auto_23172 - SURFACE
      ?auto_23164 - SURFACE
      ?auto_23170 - TRUCK
      ?auto_23165 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23166 ?auto_23171 ) ( IS-CRATE ?auto_23163 ) ( not ( = ?auto_23162 ?auto_23163 ) ) ( not ( = ?auto_23161 ?auto_23162 ) ) ( not ( = ?auto_23161 ?auto_23163 ) ) ( not ( = ?auto_23169 ?auto_23171 ) ) ( HOIST-AT ?auto_23174 ?auto_23169 ) ( not ( = ?auto_23166 ?auto_23174 ) ) ( AVAILABLE ?auto_23174 ) ( SURFACE-AT ?auto_23163 ?auto_23169 ) ( ON ?auto_23163 ?auto_23175 ) ( CLEAR ?auto_23163 ) ( not ( = ?auto_23162 ?auto_23175 ) ) ( not ( = ?auto_23163 ?auto_23175 ) ) ( not ( = ?auto_23161 ?auto_23175 ) ) ( IS-CRATE ?auto_23162 ) ( not ( = ?auto_23167 ?auto_23171 ) ) ( not ( = ?auto_23169 ?auto_23167 ) ) ( HOIST-AT ?auto_23173 ?auto_23167 ) ( not ( = ?auto_23166 ?auto_23173 ) ) ( not ( = ?auto_23174 ?auto_23173 ) ) ( SURFACE-AT ?auto_23162 ?auto_23167 ) ( ON ?auto_23162 ?auto_23168 ) ( CLEAR ?auto_23162 ) ( not ( = ?auto_23162 ?auto_23168 ) ) ( not ( = ?auto_23163 ?auto_23168 ) ) ( not ( = ?auto_23161 ?auto_23168 ) ) ( not ( = ?auto_23175 ?auto_23168 ) ) ( IS-CRATE ?auto_23161 ) ( not ( = ?auto_23172 ?auto_23161 ) ) ( not ( = ?auto_23162 ?auto_23172 ) ) ( not ( = ?auto_23163 ?auto_23172 ) ) ( not ( = ?auto_23175 ?auto_23172 ) ) ( not ( = ?auto_23168 ?auto_23172 ) ) ( AVAILABLE ?auto_23173 ) ( SURFACE-AT ?auto_23161 ?auto_23167 ) ( ON ?auto_23161 ?auto_23164 ) ( CLEAR ?auto_23161 ) ( not ( = ?auto_23162 ?auto_23164 ) ) ( not ( = ?auto_23163 ?auto_23164 ) ) ( not ( = ?auto_23161 ?auto_23164 ) ) ( not ( = ?auto_23175 ?auto_23164 ) ) ( not ( = ?auto_23168 ?auto_23164 ) ) ( not ( = ?auto_23172 ?auto_23164 ) ) ( TRUCK-AT ?auto_23170 ?auto_23171 ) ( SURFACE-AT ?auto_23165 ?auto_23171 ) ( CLEAR ?auto_23165 ) ( IS-CRATE ?auto_23172 ) ( not ( = ?auto_23165 ?auto_23172 ) ) ( not ( = ?auto_23162 ?auto_23165 ) ) ( not ( = ?auto_23163 ?auto_23165 ) ) ( not ( = ?auto_23161 ?auto_23165 ) ) ( not ( = ?auto_23175 ?auto_23165 ) ) ( not ( = ?auto_23168 ?auto_23165 ) ) ( not ( = ?auto_23164 ?auto_23165 ) ) ( AVAILABLE ?auto_23166 ) ( IN ?auto_23172 ?auto_23170 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23162 ?auto_23163 )
      ( MAKE-2CRATE-VERIFY ?auto_23161 ?auto_23162 ?auto_23163 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23176 - SURFACE
      ?auto_23177 - SURFACE
      ?auto_23178 - SURFACE
      ?auto_23179 - SURFACE
    )
    :vars
    (
      ?auto_23187 - HOIST
      ?auto_23183 - PLACE
      ?auto_23190 - PLACE
      ?auto_23188 - HOIST
      ?auto_23182 - SURFACE
      ?auto_23185 - PLACE
      ?auto_23180 - HOIST
      ?auto_23181 - SURFACE
      ?auto_23189 - SURFACE
      ?auto_23184 - TRUCK
      ?auto_23186 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23187 ?auto_23183 ) ( IS-CRATE ?auto_23179 ) ( not ( = ?auto_23178 ?auto_23179 ) ) ( not ( = ?auto_23177 ?auto_23178 ) ) ( not ( = ?auto_23177 ?auto_23179 ) ) ( not ( = ?auto_23190 ?auto_23183 ) ) ( HOIST-AT ?auto_23188 ?auto_23190 ) ( not ( = ?auto_23187 ?auto_23188 ) ) ( AVAILABLE ?auto_23188 ) ( SURFACE-AT ?auto_23179 ?auto_23190 ) ( ON ?auto_23179 ?auto_23182 ) ( CLEAR ?auto_23179 ) ( not ( = ?auto_23178 ?auto_23182 ) ) ( not ( = ?auto_23179 ?auto_23182 ) ) ( not ( = ?auto_23177 ?auto_23182 ) ) ( IS-CRATE ?auto_23178 ) ( not ( = ?auto_23185 ?auto_23183 ) ) ( not ( = ?auto_23190 ?auto_23185 ) ) ( HOIST-AT ?auto_23180 ?auto_23185 ) ( not ( = ?auto_23187 ?auto_23180 ) ) ( not ( = ?auto_23188 ?auto_23180 ) ) ( SURFACE-AT ?auto_23178 ?auto_23185 ) ( ON ?auto_23178 ?auto_23181 ) ( CLEAR ?auto_23178 ) ( not ( = ?auto_23178 ?auto_23181 ) ) ( not ( = ?auto_23179 ?auto_23181 ) ) ( not ( = ?auto_23177 ?auto_23181 ) ) ( not ( = ?auto_23182 ?auto_23181 ) ) ( IS-CRATE ?auto_23177 ) ( not ( = ?auto_23176 ?auto_23177 ) ) ( not ( = ?auto_23178 ?auto_23176 ) ) ( not ( = ?auto_23179 ?auto_23176 ) ) ( not ( = ?auto_23182 ?auto_23176 ) ) ( not ( = ?auto_23181 ?auto_23176 ) ) ( AVAILABLE ?auto_23180 ) ( SURFACE-AT ?auto_23177 ?auto_23185 ) ( ON ?auto_23177 ?auto_23189 ) ( CLEAR ?auto_23177 ) ( not ( = ?auto_23178 ?auto_23189 ) ) ( not ( = ?auto_23179 ?auto_23189 ) ) ( not ( = ?auto_23177 ?auto_23189 ) ) ( not ( = ?auto_23182 ?auto_23189 ) ) ( not ( = ?auto_23181 ?auto_23189 ) ) ( not ( = ?auto_23176 ?auto_23189 ) ) ( TRUCK-AT ?auto_23184 ?auto_23183 ) ( SURFACE-AT ?auto_23186 ?auto_23183 ) ( CLEAR ?auto_23186 ) ( IS-CRATE ?auto_23176 ) ( not ( = ?auto_23186 ?auto_23176 ) ) ( not ( = ?auto_23178 ?auto_23186 ) ) ( not ( = ?auto_23179 ?auto_23186 ) ) ( not ( = ?auto_23177 ?auto_23186 ) ) ( not ( = ?auto_23182 ?auto_23186 ) ) ( not ( = ?auto_23181 ?auto_23186 ) ) ( not ( = ?auto_23189 ?auto_23186 ) ) ( AVAILABLE ?auto_23187 ) ( IN ?auto_23176 ?auto_23184 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23177 ?auto_23178 ?auto_23179 )
      ( MAKE-3CRATE-VERIFY ?auto_23176 ?auto_23177 ?auto_23178 ?auto_23179 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23191 - SURFACE
      ?auto_23192 - SURFACE
      ?auto_23193 - SURFACE
      ?auto_23194 - SURFACE
      ?auto_23195 - SURFACE
    )
    :vars
    (
      ?auto_23202 - HOIST
      ?auto_23199 - PLACE
      ?auto_23205 - PLACE
      ?auto_23203 - HOIST
      ?auto_23198 - SURFACE
      ?auto_23201 - PLACE
      ?auto_23196 - HOIST
      ?auto_23197 - SURFACE
      ?auto_23204 - SURFACE
      ?auto_23200 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23202 ?auto_23199 ) ( IS-CRATE ?auto_23195 ) ( not ( = ?auto_23194 ?auto_23195 ) ) ( not ( = ?auto_23193 ?auto_23194 ) ) ( not ( = ?auto_23193 ?auto_23195 ) ) ( not ( = ?auto_23205 ?auto_23199 ) ) ( HOIST-AT ?auto_23203 ?auto_23205 ) ( not ( = ?auto_23202 ?auto_23203 ) ) ( AVAILABLE ?auto_23203 ) ( SURFACE-AT ?auto_23195 ?auto_23205 ) ( ON ?auto_23195 ?auto_23198 ) ( CLEAR ?auto_23195 ) ( not ( = ?auto_23194 ?auto_23198 ) ) ( not ( = ?auto_23195 ?auto_23198 ) ) ( not ( = ?auto_23193 ?auto_23198 ) ) ( IS-CRATE ?auto_23194 ) ( not ( = ?auto_23201 ?auto_23199 ) ) ( not ( = ?auto_23205 ?auto_23201 ) ) ( HOIST-AT ?auto_23196 ?auto_23201 ) ( not ( = ?auto_23202 ?auto_23196 ) ) ( not ( = ?auto_23203 ?auto_23196 ) ) ( SURFACE-AT ?auto_23194 ?auto_23201 ) ( ON ?auto_23194 ?auto_23197 ) ( CLEAR ?auto_23194 ) ( not ( = ?auto_23194 ?auto_23197 ) ) ( not ( = ?auto_23195 ?auto_23197 ) ) ( not ( = ?auto_23193 ?auto_23197 ) ) ( not ( = ?auto_23198 ?auto_23197 ) ) ( IS-CRATE ?auto_23193 ) ( not ( = ?auto_23192 ?auto_23193 ) ) ( not ( = ?auto_23194 ?auto_23192 ) ) ( not ( = ?auto_23195 ?auto_23192 ) ) ( not ( = ?auto_23198 ?auto_23192 ) ) ( not ( = ?auto_23197 ?auto_23192 ) ) ( AVAILABLE ?auto_23196 ) ( SURFACE-AT ?auto_23193 ?auto_23201 ) ( ON ?auto_23193 ?auto_23204 ) ( CLEAR ?auto_23193 ) ( not ( = ?auto_23194 ?auto_23204 ) ) ( not ( = ?auto_23195 ?auto_23204 ) ) ( not ( = ?auto_23193 ?auto_23204 ) ) ( not ( = ?auto_23198 ?auto_23204 ) ) ( not ( = ?auto_23197 ?auto_23204 ) ) ( not ( = ?auto_23192 ?auto_23204 ) ) ( TRUCK-AT ?auto_23200 ?auto_23199 ) ( SURFACE-AT ?auto_23191 ?auto_23199 ) ( CLEAR ?auto_23191 ) ( IS-CRATE ?auto_23192 ) ( not ( = ?auto_23191 ?auto_23192 ) ) ( not ( = ?auto_23194 ?auto_23191 ) ) ( not ( = ?auto_23195 ?auto_23191 ) ) ( not ( = ?auto_23193 ?auto_23191 ) ) ( not ( = ?auto_23198 ?auto_23191 ) ) ( not ( = ?auto_23197 ?auto_23191 ) ) ( not ( = ?auto_23204 ?auto_23191 ) ) ( AVAILABLE ?auto_23202 ) ( IN ?auto_23192 ?auto_23200 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23193 ?auto_23194 ?auto_23195 )
      ( MAKE-4CRATE-VERIFY ?auto_23191 ?auto_23192 ?auto_23193 ?auto_23194 ?auto_23195 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23206 - SURFACE
      ?auto_23207 - SURFACE
      ?auto_23208 - SURFACE
      ?auto_23209 - SURFACE
      ?auto_23210 - SURFACE
      ?auto_23211 - SURFACE
    )
    :vars
    (
      ?auto_23218 - HOIST
      ?auto_23215 - PLACE
      ?auto_23221 - PLACE
      ?auto_23219 - HOIST
      ?auto_23214 - SURFACE
      ?auto_23217 - PLACE
      ?auto_23212 - HOIST
      ?auto_23213 - SURFACE
      ?auto_23220 - SURFACE
      ?auto_23216 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23218 ?auto_23215 ) ( IS-CRATE ?auto_23211 ) ( not ( = ?auto_23210 ?auto_23211 ) ) ( not ( = ?auto_23209 ?auto_23210 ) ) ( not ( = ?auto_23209 ?auto_23211 ) ) ( not ( = ?auto_23221 ?auto_23215 ) ) ( HOIST-AT ?auto_23219 ?auto_23221 ) ( not ( = ?auto_23218 ?auto_23219 ) ) ( AVAILABLE ?auto_23219 ) ( SURFACE-AT ?auto_23211 ?auto_23221 ) ( ON ?auto_23211 ?auto_23214 ) ( CLEAR ?auto_23211 ) ( not ( = ?auto_23210 ?auto_23214 ) ) ( not ( = ?auto_23211 ?auto_23214 ) ) ( not ( = ?auto_23209 ?auto_23214 ) ) ( IS-CRATE ?auto_23210 ) ( not ( = ?auto_23217 ?auto_23215 ) ) ( not ( = ?auto_23221 ?auto_23217 ) ) ( HOIST-AT ?auto_23212 ?auto_23217 ) ( not ( = ?auto_23218 ?auto_23212 ) ) ( not ( = ?auto_23219 ?auto_23212 ) ) ( SURFACE-AT ?auto_23210 ?auto_23217 ) ( ON ?auto_23210 ?auto_23213 ) ( CLEAR ?auto_23210 ) ( not ( = ?auto_23210 ?auto_23213 ) ) ( not ( = ?auto_23211 ?auto_23213 ) ) ( not ( = ?auto_23209 ?auto_23213 ) ) ( not ( = ?auto_23214 ?auto_23213 ) ) ( IS-CRATE ?auto_23209 ) ( not ( = ?auto_23208 ?auto_23209 ) ) ( not ( = ?auto_23210 ?auto_23208 ) ) ( not ( = ?auto_23211 ?auto_23208 ) ) ( not ( = ?auto_23214 ?auto_23208 ) ) ( not ( = ?auto_23213 ?auto_23208 ) ) ( AVAILABLE ?auto_23212 ) ( SURFACE-AT ?auto_23209 ?auto_23217 ) ( ON ?auto_23209 ?auto_23220 ) ( CLEAR ?auto_23209 ) ( not ( = ?auto_23210 ?auto_23220 ) ) ( not ( = ?auto_23211 ?auto_23220 ) ) ( not ( = ?auto_23209 ?auto_23220 ) ) ( not ( = ?auto_23214 ?auto_23220 ) ) ( not ( = ?auto_23213 ?auto_23220 ) ) ( not ( = ?auto_23208 ?auto_23220 ) ) ( TRUCK-AT ?auto_23216 ?auto_23215 ) ( SURFACE-AT ?auto_23207 ?auto_23215 ) ( CLEAR ?auto_23207 ) ( IS-CRATE ?auto_23208 ) ( not ( = ?auto_23207 ?auto_23208 ) ) ( not ( = ?auto_23210 ?auto_23207 ) ) ( not ( = ?auto_23211 ?auto_23207 ) ) ( not ( = ?auto_23209 ?auto_23207 ) ) ( not ( = ?auto_23214 ?auto_23207 ) ) ( not ( = ?auto_23213 ?auto_23207 ) ) ( not ( = ?auto_23220 ?auto_23207 ) ) ( AVAILABLE ?auto_23218 ) ( IN ?auto_23208 ?auto_23216 ) ( ON ?auto_23207 ?auto_23206 ) ( not ( = ?auto_23206 ?auto_23207 ) ) ( not ( = ?auto_23206 ?auto_23208 ) ) ( not ( = ?auto_23206 ?auto_23209 ) ) ( not ( = ?auto_23206 ?auto_23210 ) ) ( not ( = ?auto_23206 ?auto_23211 ) ) ( not ( = ?auto_23206 ?auto_23214 ) ) ( not ( = ?auto_23206 ?auto_23213 ) ) ( not ( = ?auto_23206 ?auto_23220 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23209 ?auto_23210 ?auto_23211 )
      ( MAKE-5CRATE-VERIFY ?auto_23206 ?auto_23207 ?auto_23208 ?auto_23209 ?auto_23210 ?auto_23211 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23222 - SURFACE
      ?auto_23223 - SURFACE
    )
    :vars
    (
      ?auto_23233 - HOIST
      ?auto_23228 - PLACE
      ?auto_23231 - SURFACE
      ?auto_23236 - PLACE
      ?auto_23234 - HOIST
      ?auto_23226 - SURFACE
      ?auto_23230 - PLACE
      ?auto_23224 - HOIST
      ?auto_23225 - SURFACE
      ?auto_23227 - SURFACE
      ?auto_23235 - SURFACE
      ?auto_23232 - SURFACE
      ?auto_23229 - TRUCK
      ?auto_23237 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23233 ?auto_23228 ) ( IS-CRATE ?auto_23223 ) ( not ( = ?auto_23222 ?auto_23223 ) ) ( not ( = ?auto_23231 ?auto_23222 ) ) ( not ( = ?auto_23231 ?auto_23223 ) ) ( not ( = ?auto_23236 ?auto_23228 ) ) ( HOIST-AT ?auto_23234 ?auto_23236 ) ( not ( = ?auto_23233 ?auto_23234 ) ) ( AVAILABLE ?auto_23234 ) ( SURFACE-AT ?auto_23223 ?auto_23236 ) ( ON ?auto_23223 ?auto_23226 ) ( CLEAR ?auto_23223 ) ( not ( = ?auto_23222 ?auto_23226 ) ) ( not ( = ?auto_23223 ?auto_23226 ) ) ( not ( = ?auto_23231 ?auto_23226 ) ) ( IS-CRATE ?auto_23222 ) ( not ( = ?auto_23230 ?auto_23228 ) ) ( not ( = ?auto_23236 ?auto_23230 ) ) ( HOIST-AT ?auto_23224 ?auto_23230 ) ( not ( = ?auto_23233 ?auto_23224 ) ) ( not ( = ?auto_23234 ?auto_23224 ) ) ( SURFACE-AT ?auto_23222 ?auto_23230 ) ( ON ?auto_23222 ?auto_23225 ) ( CLEAR ?auto_23222 ) ( not ( = ?auto_23222 ?auto_23225 ) ) ( not ( = ?auto_23223 ?auto_23225 ) ) ( not ( = ?auto_23231 ?auto_23225 ) ) ( not ( = ?auto_23226 ?auto_23225 ) ) ( IS-CRATE ?auto_23231 ) ( not ( = ?auto_23227 ?auto_23231 ) ) ( not ( = ?auto_23222 ?auto_23227 ) ) ( not ( = ?auto_23223 ?auto_23227 ) ) ( not ( = ?auto_23226 ?auto_23227 ) ) ( not ( = ?auto_23225 ?auto_23227 ) ) ( AVAILABLE ?auto_23224 ) ( SURFACE-AT ?auto_23231 ?auto_23230 ) ( ON ?auto_23231 ?auto_23235 ) ( CLEAR ?auto_23231 ) ( not ( = ?auto_23222 ?auto_23235 ) ) ( not ( = ?auto_23223 ?auto_23235 ) ) ( not ( = ?auto_23231 ?auto_23235 ) ) ( not ( = ?auto_23226 ?auto_23235 ) ) ( not ( = ?auto_23225 ?auto_23235 ) ) ( not ( = ?auto_23227 ?auto_23235 ) ) ( SURFACE-AT ?auto_23232 ?auto_23228 ) ( CLEAR ?auto_23232 ) ( IS-CRATE ?auto_23227 ) ( not ( = ?auto_23232 ?auto_23227 ) ) ( not ( = ?auto_23222 ?auto_23232 ) ) ( not ( = ?auto_23223 ?auto_23232 ) ) ( not ( = ?auto_23231 ?auto_23232 ) ) ( not ( = ?auto_23226 ?auto_23232 ) ) ( not ( = ?auto_23225 ?auto_23232 ) ) ( not ( = ?auto_23235 ?auto_23232 ) ) ( AVAILABLE ?auto_23233 ) ( IN ?auto_23227 ?auto_23229 ) ( TRUCK-AT ?auto_23229 ?auto_23237 ) ( not ( = ?auto_23237 ?auto_23228 ) ) ( not ( = ?auto_23236 ?auto_23237 ) ) ( not ( = ?auto_23230 ?auto_23237 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23229 ?auto_23237 ?auto_23228 )
      ( MAKE-2CRATE ?auto_23231 ?auto_23222 ?auto_23223 )
      ( MAKE-1CRATE-VERIFY ?auto_23222 ?auto_23223 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23238 - SURFACE
      ?auto_23239 - SURFACE
      ?auto_23240 - SURFACE
    )
    :vars
    (
      ?auto_23241 - HOIST
      ?auto_23248 - PLACE
      ?auto_23244 - PLACE
      ?auto_23243 - HOIST
      ?auto_23242 - SURFACE
      ?auto_23245 - PLACE
      ?auto_23250 - HOIST
      ?auto_23251 - SURFACE
      ?auto_23253 - SURFACE
      ?auto_23252 - SURFACE
      ?auto_23246 - SURFACE
      ?auto_23247 - TRUCK
      ?auto_23249 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23241 ?auto_23248 ) ( IS-CRATE ?auto_23240 ) ( not ( = ?auto_23239 ?auto_23240 ) ) ( not ( = ?auto_23238 ?auto_23239 ) ) ( not ( = ?auto_23238 ?auto_23240 ) ) ( not ( = ?auto_23244 ?auto_23248 ) ) ( HOIST-AT ?auto_23243 ?auto_23244 ) ( not ( = ?auto_23241 ?auto_23243 ) ) ( AVAILABLE ?auto_23243 ) ( SURFACE-AT ?auto_23240 ?auto_23244 ) ( ON ?auto_23240 ?auto_23242 ) ( CLEAR ?auto_23240 ) ( not ( = ?auto_23239 ?auto_23242 ) ) ( not ( = ?auto_23240 ?auto_23242 ) ) ( not ( = ?auto_23238 ?auto_23242 ) ) ( IS-CRATE ?auto_23239 ) ( not ( = ?auto_23245 ?auto_23248 ) ) ( not ( = ?auto_23244 ?auto_23245 ) ) ( HOIST-AT ?auto_23250 ?auto_23245 ) ( not ( = ?auto_23241 ?auto_23250 ) ) ( not ( = ?auto_23243 ?auto_23250 ) ) ( SURFACE-AT ?auto_23239 ?auto_23245 ) ( ON ?auto_23239 ?auto_23251 ) ( CLEAR ?auto_23239 ) ( not ( = ?auto_23239 ?auto_23251 ) ) ( not ( = ?auto_23240 ?auto_23251 ) ) ( not ( = ?auto_23238 ?auto_23251 ) ) ( not ( = ?auto_23242 ?auto_23251 ) ) ( IS-CRATE ?auto_23238 ) ( not ( = ?auto_23253 ?auto_23238 ) ) ( not ( = ?auto_23239 ?auto_23253 ) ) ( not ( = ?auto_23240 ?auto_23253 ) ) ( not ( = ?auto_23242 ?auto_23253 ) ) ( not ( = ?auto_23251 ?auto_23253 ) ) ( AVAILABLE ?auto_23250 ) ( SURFACE-AT ?auto_23238 ?auto_23245 ) ( ON ?auto_23238 ?auto_23252 ) ( CLEAR ?auto_23238 ) ( not ( = ?auto_23239 ?auto_23252 ) ) ( not ( = ?auto_23240 ?auto_23252 ) ) ( not ( = ?auto_23238 ?auto_23252 ) ) ( not ( = ?auto_23242 ?auto_23252 ) ) ( not ( = ?auto_23251 ?auto_23252 ) ) ( not ( = ?auto_23253 ?auto_23252 ) ) ( SURFACE-AT ?auto_23246 ?auto_23248 ) ( CLEAR ?auto_23246 ) ( IS-CRATE ?auto_23253 ) ( not ( = ?auto_23246 ?auto_23253 ) ) ( not ( = ?auto_23239 ?auto_23246 ) ) ( not ( = ?auto_23240 ?auto_23246 ) ) ( not ( = ?auto_23238 ?auto_23246 ) ) ( not ( = ?auto_23242 ?auto_23246 ) ) ( not ( = ?auto_23251 ?auto_23246 ) ) ( not ( = ?auto_23252 ?auto_23246 ) ) ( AVAILABLE ?auto_23241 ) ( IN ?auto_23253 ?auto_23247 ) ( TRUCK-AT ?auto_23247 ?auto_23249 ) ( not ( = ?auto_23249 ?auto_23248 ) ) ( not ( = ?auto_23244 ?auto_23249 ) ) ( not ( = ?auto_23245 ?auto_23249 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23239 ?auto_23240 )
      ( MAKE-2CRATE-VERIFY ?auto_23238 ?auto_23239 ?auto_23240 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23254 - SURFACE
      ?auto_23255 - SURFACE
      ?auto_23256 - SURFACE
      ?auto_23257 - SURFACE
    )
    :vars
    (
      ?auto_23265 - HOIST
      ?auto_23260 - PLACE
      ?auto_23261 - PLACE
      ?auto_23268 - HOIST
      ?auto_23264 - SURFACE
      ?auto_23262 - PLACE
      ?auto_23258 - HOIST
      ?auto_23267 - SURFACE
      ?auto_23269 - SURFACE
      ?auto_23259 - SURFACE
      ?auto_23266 - TRUCK
      ?auto_23263 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23265 ?auto_23260 ) ( IS-CRATE ?auto_23257 ) ( not ( = ?auto_23256 ?auto_23257 ) ) ( not ( = ?auto_23255 ?auto_23256 ) ) ( not ( = ?auto_23255 ?auto_23257 ) ) ( not ( = ?auto_23261 ?auto_23260 ) ) ( HOIST-AT ?auto_23268 ?auto_23261 ) ( not ( = ?auto_23265 ?auto_23268 ) ) ( AVAILABLE ?auto_23268 ) ( SURFACE-AT ?auto_23257 ?auto_23261 ) ( ON ?auto_23257 ?auto_23264 ) ( CLEAR ?auto_23257 ) ( not ( = ?auto_23256 ?auto_23264 ) ) ( not ( = ?auto_23257 ?auto_23264 ) ) ( not ( = ?auto_23255 ?auto_23264 ) ) ( IS-CRATE ?auto_23256 ) ( not ( = ?auto_23262 ?auto_23260 ) ) ( not ( = ?auto_23261 ?auto_23262 ) ) ( HOIST-AT ?auto_23258 ?auto_23262 ) ( not ( = ?auto_23265 ?auto_23258 ) ) ( not ( = ?auto_23268 ?auto_23258 ) ) ( SURFACE-AT ?auto_23256 ?auto_23262 ) ( ON ?auto_23256 ?auto_23267 ) ( CLEAR ?auto_23256 ) ( not ( = ?auto_23256 ?auto_23267 ) ) ( not ( = ?auto_23257 ?auto_23267 ) ) ( not ( = ?auto_23255 ?auto_23267 ) ) ( not ( = ?auto_23264 ?auto_23267 ) ) ( IS-CRATE ?auto_23255 ) ( not ( = ?auto_23254 ?auto_23255 ) ) ( not ( = ?auto_23256 ?auto_23254 ) ) ( not ( = ?auto_23257 ?auto_23254 ) ) ( not ( = ?auto_23264 ?auto_23254 ) ) ( not ( = ?auto_23267 ?auto_23254 ) ) ( AVAILABLE ?auto_23258 ) ( SURFACE-AT ?auto_23255 ?auto_23262 ) ( ON ?auto_23255 ?auto_23269 ) ( CLEAR ?auto_23255 ) ( not ( = ?auto_23256 ?auto_23269 ) ) ( not ( = ?auto_23257 ?auto_23269 ) ) ( not ( = ?auto_23255 ?auto_23269 ) ) ( not ( = ?auto_23264 ?auto_23269 ) ) ( not ( = ?auto_23267 ?auto_23269 ) ) ( not ( = ?auto_23254 ?auto_23269 ) ) ( SURFACE-AT ?auto_23259 ?auto_23260 ) ( CLEAR ?auto_23259 ) ( IS-CRATE ?auto_23254 ) ( not ( = ?auto_23259 ?auto_23254 ) ) ( not ( = ?auto_23256 ?auto_23259 ) ) ( not ( = ?auto_23257 ?auto_23259 ) ) ( not ( = ?auto_23255 ?auto_23259 ) ) ( not ( = ?auto_23264 ?auto_23259 ) ) ( not ( = ?auto_23267 ?auto_23259 ) ) ( not ( = ?auto_23269 ?auto_23259 ) ) ( AVAILABLE ?auto_23265 ) ( IN ?auto_23254 ?auto_23266 ) ( TRUCK-AT ?auto_23266 ?auto_23263 ) ( not ( = ?auto_23263 ?auto_23260 ) ) ( not ( = ?auto_23261 ?auto_23263 ) ) ( not ( = ?auto_23262 ?auto_23263 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23255 ?auto_23256 ?auto_23257 )
      ( MAKE-3CRATE-VERIFY ?auto_23254 ?auto_23255 ?auto_23256 ?auto_23257 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23270 - SURFACE
      ?auto_23271 - SURFACE
      ?auto_23272 - SURFACE
      ?auto_23273 - SURFACE
      ?auto_23274 - SURFACE
    )
    :vars
    (
      ?auto_23281 - HOIST
      ?auto_23276 - PLACE
      ?auto_23277 - PLACE
      ?auto_23284 - HOIST
      ?auto_23280 - SURFACE
      ?auto_23278 - PLACE
      ?auto_23275 - HOIST
      ?auto_23283 - SURFACE
      ?auto_23285 - SURFACE
      ?auto_23282 - TRUCK
      ?auto_23279 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23281 ?auto_23276 ) ( IS-CRATE ?auto_23274 ) ( not ( = ?auto_23273 ?auto_23274 ) ) ( not ( = ?auto_23272 ?auto_23273 ) ) ( not ( = ?auto_23272 ?auto_23274 ) ) ( not ( = ?auto_23277 ?auto_23276 ) ) ( HOIST-AT ?auto_23284 ?auto_23277 ) ( not ( = ?auto_23281 ?auto_23284 ) ) ( AVAILABLE ?auto_23284 ) ( SURFACE-AT ?auto_23274 ?auto_23277 ) ( ON ?auto_23274 ?auto_23280 ) ( CLEAR ?auto_23274 ) ( not ( = ?auto_23273 ?auto_23280 ) ) ( not ( = ?auto_23274 ?auto_23280 ) ) ( not ( = ?auto_23272 ?auto_23280 ) ) ( IS-CRATE ?auto_23273 ) ( not ( = ?auto_23278 ?auto_23276 ) ) ( not ( = ?auto_23277 ?auto_23278 ) ) ( HOIST-AT ?auto_23275 ?auto_23278 ) ( not ( = ?auto_23281 ?auto_23275 ) ) ( not ( = ?auto_23284 ?auto_23275 ) ) ( SURFACE-AT ?auto_23273 ?auto_23278 ) ( ON ?auto_23273 ?auto_23283 ) ( CLEAR ?auto_23273 ) ( not ( = ?auto_23273 ?auto_23283 ) ) ( not ( = ?auto_23274 ?auto_23283 ) ) ( not ( = ?auto_23272 ?auto_23283 ) ) ( not ( = ?auto_23280 ?auto_23283 ) ) ( IS-CRATE ?auto_23272 ) ( not ( = ?auto_23271 ?auto_23272 ) ) ( not ( = ?auto_23273 ?auto_23271 ) ) ( not ( = ?auto_23274 ?auto_23271 ) ) ( not ( = ?auto_23280 ?auto_23271 ) ) ( not ( = ?auto_23283 ?auto_23271 ) ) ( AVAILABLE ?auto_23275 ) ( SURFACE-AT ?auto_23272 ?auto_23278 ) ( ON ?auto_23272 ?auto_23285 ) ( CLEAR ?auto_23272 ) ( not ( = ?auto_23273 ?auto_23285 ) ) ( not ( = ?auto_23274 ?auto_23285 ) ) ( not ( = ?auto_23272 ?auto_23285 ) ) ( not ( = ?auto_23280 ?auto_23285 ) ) ( not ( = ?auto_23283 ?auto_23285 ) ) ( not ( = ?auto_23271 ?auto_23285 ) ) ( SURFACE-AT ?auto_23270 ?auto_23276 ) ( CLEAR ?auto_23270 ) ( IS-CRATE ?auto_23271 ) ( not ( = ?auto_23270 ?auto_23271 ) ) ( not ( = ?auto_23273 ?auto_23270 ) ) ( not ( = ?auto_23274 ?auto_23270 ) ) ( not ( = ?auto_23272 ?auto_23270 ) ) ( not ( = ?auto_23280 ?auto_23270 ) ) ( not ( = ?auto_23283 ?auto_23270 ) ) ( not ( = ?auto_23285 ?auto_23270 ) ) ( AVAILABLE ?auto_23281 ) ( IN ?auto_23271 ?auto_23282 ) ( TRUCK-AT ?auto_23282 ?auto_23279 ) ( not ( = ?auto_23279 ?auto_23276 ) ) ( not ( = ?auto_23277 ?auto_23279 ) ) ( not ( = ?auto_23278 ?auto_23279 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23272 ?auto_23273 ?auto_23274 )
      ( MAKE-4CRATE-VERIFY ?auto_23270 ?auto_23271 ?auto_23272 ?auto_23273 ?auto_23274 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23286 - SURFACE
      ?auto_23287 - SURFACE
      ?auto_23288 - SURFACE
      ?auto_23289 - SURFACE
      ?auto_23290 - SURFACE
      ?auto_23291 - SURFACE
    )
    :vars
    (
      ?auto_23298 - HOIST
      ?auto_23293 - PLACE
      ?auto_23294 - PLACE
      ?auto_23301 - HOIST
      ?auto_23297 - SURFACE
      ?auto_23295 - PLACE
      ?auto_23292 - HOIST
      ?auto_23300 - SURFACE
      ?auto_23302 - SURFACE
      ?auto_23299 - TRUCK
      ?auto_23296 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23298 ?auto_23293 ) ( IS-CRATE ?auto_23291 ) ( not ( = ?auto_23290 ?auto_23291 ) ) ( not ( = ?auto_23289 ?auto_23290 ) ) ( not ( = ?auto_23289 ?auto_23291 ) ) ( not ( = ?auto_23294 ?auto_23293 ) ) ( HOIST-AT ?auto_23301 ?auto_23294 ) ( not ( = ?auto_23298 ?auto_23301 ) ) ( AVAILABLE ?auto_23301 ) ( SURFACE-AT ?auto_23291 ?auto_23294 ) ( ON ?auto_23291 ?auto_23297 ) ( CLEAR ?auto_23291 ) ( not ( = ?auto_23290 ?auto_23297 ) ) ( not ( = ?auto_23291 ?auto_23297 ) ) ( not ( = ?auto_23289 ?auto_23297 ) ) ( IS-CRATE ?auto_23290 ) ( not ( = ?auto_23295 ?auto_23293 ) ) ( not ( = ?auto_23294 ?auto_23295 ) ) ( HOIST-AT ?auto_23292 ?auto_23295 ) ( not ( = ?auto_23298 ?auto_23292 ) ) ( not ( = ?auto_23301 ?auto_23292 ) ) ( SURFACE-AT ?auto_23290 ?auto_23295 ) ( ON ?auto_23290 ?auto_23300 ) ( CLEAR ?auto_23290 ) ( not ( = ?auto_23290 ?auto_23300 ) ) ( not ( = ?auto_23291 ?auto_23300 ) ) ( not ( = ?auto_23289 ?auto_23300 ) ) ( not ( = ?auto_23297 ?auto_23300 ) ) ( IS-CRATE ?auto_23289 ) ( not ( = ?auto_23288 ?auto_23289 ) ) ( not ( = ?auto_23290 ?auto_23288 ) ) ( not ( = ?auto_23291 ?auto_23288 ) ) ( not ( = ?auto_23297 ?auto_23288 ) ) ( not ( = ?auto_23300 ?auto_23288 ) ) ( AVAILABLE ?auto_23292 ) ( SURFACE-AT ?auto_23289 ?auto_23295 ) ( ON ?auto_23289 ?auto_23302 ) ( CLEAR ?auto_23289 ) ( not ( = ?auto_23290 ?auto_23302 ) ) ( not ( = ?auto_23291 ?auto_23302 ) ) ( not ( = ?auto_23289 ?auto_23302 ) ) ( not ( = ?auto_23297 ?auto_23302 ) ) ( not ( = ?auto_23300 ?auto_23302 ) ) ( not ( = ?auto_23288 ?auto_23302 ) ) ( SURFACE-AT ?auto_23287 ?auto_23293 ) ( CLEAR ?auto_23287 ) ( IS-CRATE ?auto_23288 ) ( not ( = ?auto_23287 ?auto_23288 ) ) ( not ( = ?auto_23290 ?auto_23287 ) ) ( not ( = ?auto_23291 ?auto_23287 ) ) ( not ( = ?auto_23289 ?auto_23287 ) ) ( not ( = ?auto_23297 ?auto_23287 ) ) ( not ( = ?auto_23300 ?auto_23287 ) ) ( not ( = ?auto_23302 ?auto_23287 ) ) ( AVAILABLE ?auto_23298 ) ( IN ?auto_23288 ?auto_23299 ) ( TRUCK-AT ?auto_23299 ?auto_23296 ) ( not ( = ?auto_23296 ?auto_23293 ) ) ( not ( = ?auto_23294 ?auto_23296 ) ) ( not ( = ?auto_23295 ?auto_23296 ) ) ( ON ?auto_23287 ?auto_23286 ) ( not ( = ?auto_23286 ?auto_23287 ) ) ( not ( = ?auto_23286 ?auto_23288 ) ) ( not ( = ?auto_23286 ?auto_23289 ) ) ( not ( = ?auto_23286 ?auto_23290 ) ) ( not ( = ?auto_23286 ?auto_23291 ) ) ( not ( = ?auto_23286 ?auto_23297 ) ) ( not ( = ?auto_23286 ?auto_23300 ) ) ( not ( = ?auto_23286 ?auto_23302 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23289 ?auto_23290 ?auto_23291 )
      ( MAKE-5CRATE-VERIFY ?auto_23286 ?auto_23287 ?auto_23288 ?auto_23289 ?auto_23290 ?auto_23291 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23303 - SURFACE
      ?auto_23304 - SURFACE
    )
    :vars
    (
      ?auto_23313 - HOIST
      ?auto_23308 - PLACE
      ?auto_23306 - SURFACE
      ?auto_23309 - PLACE
      ?auto_23317 - HOIST
      ?auto_23312 - SURFACE
      ?auto_23310 - PLACE
      ?auto_23305 - HOIST
      ?auto_23315 - SURFACE
      ?auto_23316 - SURFACE
      ?auto_23318 - SURFACE
      ?auto_23307 - SURFACE
      ?auto_23314 - TRUCK
      ?auto_23311 - PLACE
      ?auto_23319 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_23313 ?auto_23308 ) ( IS-CRATE ?auto_23304 ) ( not ( = ?auto_23303 ?auto_23304 ) ) ( not ( = ?auto_23306 ?auto_23303 ) ) ( not ( = ?auto_23306 ?auto_23304 ) ) ( not ( = ?auto_23309 ?auto_23308 ) ) ( HOIST-AT ?auto_23317 ?auto_23309 ) ( not ( = ?auto_23313 ?auto_23317 ) ) ( AVAILABLE ?auto_23317 ) ( SURFACE-AT ?auto_23304 ?auto_23309 ) ( ON ?auto_23304 ?auto_23312 ) ( CLEAR ?auto_23304 ) ( not ( = ?auto_23303 ?auto_23312 ) ) ( not ( = ?auto_23304 ?auto_23312 ) ) ( not ( = ?auto_23306 ?auto_23312 ) ) ( IS-CRATE ?auto_23303 ) ( not ( = ?auto_23310 ?auto_23308 ) ) ( not ( = ?auto_23309 ?auto_23310 ) ) ( HOIST-AT ?auto_23305 ?auto_23310 ) ( not ( = ?auto_23313 ?auto_23305 ) ) ( not ( = ?auto_23317 ?auto_23305 ) ) ( SURFACE-AT ?auto_23303 ?auto_23310 ) ( ON ?auto_23303 ?auto_23315 ) ( CLEAR ?auto_23303 ) ( not ( = ?auto_23303 ?auto_23315 ) ) ( not ( = ?auto_23304 ?auto_23315 ) ) ( not ( = ?auto_23306 ?auto_23315 ) ) ( not ( = ?auto_23312 ?auto_23315 ) ) ( IS-CRATE ?auto_23306 ) ( not ( = ?auto_23316 ?auto_23306 ) ) ( not ( = ?auto_23303 ?auto_23316 ) ) ( not ( = ?auto_23304 ?auto_23316 ) ) ( not ( = ?auto_23312 ?auto_23316 ) ) ( not ( = ?auto_23315 ?auto_23316 ) ) ( AVAILABLE ?auto_23305 ) ( SURFACE-AT ?auto_23306 ?auto_23310 ) ( ON ?auto_23306 ?auto_23318 ) ( CLEAR ?auto_23306 ) ( not ( = ?auto_23303 ?auto_23318 ) ) ( not ( = ?auto_23304 ?auto_23318 ) ) ( not ( = ?auto_23306 ?auto_23318 ) ) ( not ( = ?auto_23312 ?auto_23318 ) ) ( not ( = ?auto_23315 ?auto_23318 ) ) ( not ( = ?auto_23316 ?auto_23318 ) ) ( SURFACE-AT ?auto_23307 ?auto_23308 ) ( CLEAR ?auto_23307 ) ( IS-CRATE ?auto_23316 ) ( not ( = ?auto_23307 ?auto_23316 ) ) ( not ( = ?auto_23303 ?auto_23307 ) ) ( not ( = ?auto_23304 ?auto_23307 ) ) ( not ( = ?auto_23306 ?auto_23307 ) ) ( not ( = ?auto_23312 ?auto_23307 ) ) ( not ( = ?auto_23315 ?auto_23307 ) ) ( not ( = ?auto_23318 ?auto_23307 ) ) ( AVAILABLE ?auto_23313 ) ( TRUCK-AT ?auto_23314 ?auto_23311 ) ( not ( = ?auto_23311 ?auto_23308 ) ) ( not ( = ?auto_23309 ?auto_23311 ) ) ( not ( = ?auto_23310 ?auto_23311 ) ) ( HOIST-AT ?auto_23319 ?auto_23311 ) ( LIFTING ?auto_23319 ?auto_23316 ) ( not ( = ?auto_23313 ?auto_23319 ) ) ( not ( = ?auto_23317 ?auto_23319 ) ) ( not ( = ?auto_23305 ?auto_23319 ) ) )
    :subtasks
    ( ( !LOAD ?auto_23319 ?auto_23316 ?auto_23314 ?auto_23311 )
      ( MAKE-2CRATE ?auto_23306 ?auto_23303 ?auto_23304 )
      ( MAKE-1CRATE-VERIFY ?auto_23303 ?auto_23304 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23320 - SURFACE
      ?auto_23321 - SURFACE
      ?auto_23322 - SURFACE
    )
    :vars
    (
      ?auto_23335 - HOIST
      ?auto_23329 - PLACE
      ?auto_23330 - PLACE
      ?auto_23331 - HOIST
      ?auto_23325 - SURFACE
      ?auto_23334 - PLACE
      ?auto_23324 - HOIST
      ?auto_23333 - SURFACE
      ?auto_23328 - SURFACE
      ?auto_23336 - SURFACE
      ?auto_23332 - SURFACE
      ?auto_23326 - TRUCK
      ?auto_23323 - PLACE
      ?auto_23327 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_23335 ?auto_23329 ) ( IS-CRATE ?auto_23322 ) ( not ( = ?auto_23321 ?auto_23322 ) ) ( not ( = ?auto_23320 ?auto_23321 ) ) ( not ( = ?auto_23320 ?auto_23322 ) ) ( not ( = ?auto_23330 ?auto_23329 ) ) ( HOIST-AT ?auto_23331 ?auto_23330 ) ( not ( = ?auto_23335 ?auto_23331 ) ) ( AVAILABLE ?auto_23331 ) ( SURFACE-AT ?auto_23322 ?auto_23330 ) ( ON ?auto_23322 ?auto_23325 ) ( CLEAR ?auto_23322 ) ( not ( = ?auto_23321 ?auto_23325 ) ) ( not ( = ?auto_23322 ?auto_23325 ) ) ( not ( = ?auto_23320 ?auto_23325 ) ) ( IS-CRATE ?auto_23321 ) ( not ( = ?auto_23334 ?auto_23329 ) ) ( not ( = ?auto_23330 ?auto_23334 ) ) ( HOIST-AT ?auto_23324 ?auto_23334 ) ( not ( = ?auto_23335 ?auto_23324 ) ) ( not ( = ?auto_23331 ?auto_23324 ) ) ( SURFACE-AT ?auto_23321 ?auto_23334 ) ( ON ?auto_23321 ?auto_23333 ) ( CLEAR ?auto_23321 ) ( not ( = ?auto_23321 ?auto_23333 ) ) ( not ( = ?auto_23322 ?auto_23333 ) ) ( not ( = ?auto_23320 ?auto_23333 ) ) ( not ( = ?auto_23325 ?auto_23333 ) ) ( IS-CRATE ?auto_23320 ) ( not ( = ?auto_23328 ?auto_23320 ) ) ( not ( = ?auto_23321 ?auto_23328 ) ) ( not ( = ?auto_23322 ?auto_23328 ) ) ( not ( = ?auto_23325 ?auto_23328 ) ) ( not ( = ?auto_23333 ?auto_23328 ) ) ( AVAILABLE ?auto_23324 ) ( SURFACE-AT ?auto_23320 ?auto_23334 ) ( ON ?auto_23320 ?auto_23336 ) ( CLEAR ?auto_23320 ) ( not ( = ?auto_23321 ?auto_23336 ) ) ( not ( = ?auto_23322 ?auto_23336 ) ) ( not ( = ?auto_23320 ?auto_23336 ) ) ( not ( = ?auto_23325 ?auto_23336 ) ) ( not ( = ?auto_23333 ?auto_23336 ) ) ( not ( = ?auto_23328 ?auto_23336 ) ) ( SURFACE-AT ?auto_23332 ?auto_23329 ) ( CLEAR ?auto_23332 ) ( IS-CRATE ?auto_23328 ) ( not ( = ?auto_23332 ?auto_23328 ) ) ( not ( = ?auto_23321 ?auto_23332 ) ) ( not ( = ?auto_23322 ?auto_23332 ) ) ( not ( = ?auto_23320 ?auto_23332 ) ) ( not ( = ?auto_23325 ?auto_23332 ) ) ( not ( = ?auto_23333 ?auto_23332 ) ) ( not ( = ?auto_23336 ?auto_23332 ) ) ( AVAILABLE ?auto_23335 ) ( TRUCK-AT ?auto_23326 ?auto_23323 ) ( not ( = ?auto_23323 ?auto_23329 ) ) ( not ( = ?auto_23330 ?auto_23323 ) ) ( not ( = ?auto_23334 ?auto_23323 ) ) ( HOIST-AT ?auto_23327 ?auto_23323 ) ( LIFTING ?auto_23327 ?auto_23328 ) ( not ( = ?auto_23335 ?auto_23327 ) ) ( not ( = ?auto_23331 ?auto_23327 ) ) ( not ( = ?auto_23324 ?auto_23327 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23321 ?auto_23322 )
      ( MAKE-2CRATE-VERIFY ?auto_23320 ?auto_23321 ?auto_23322 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23337 - SURFACE
      ?auto_23338 - SURFACE
      ?auto_23339 - SURFACE
      ?auto_23340 - SURFACE
    )
    :vars
    (
      ?auto_23341 - HOIST
      ?auto_23344 - PLACE
      ?auto_23342 - PLACE
      ?auto_23345 - HOIST
      ?auto_23348 - SURFACE
      ?auto_23350 - PLACE
      ?auto_23352 - HOIST
      ?auto_23351 - SURFACE
      ?auto_23349 - SURFACE
      ?auto_23343 - SURFACE
      ?auto_23347 - TRUCK
      ?auto_23346 - PLACE
      ?auto_23353 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_23341 ?auto_23344 ) ( IS-CRATE ?auto_23340 ) ( not ( = ?auto_23339 ?auto_23340 ) ) ( not ( = ?auto_23338 ?auto_23339 ) ) ( not ( = ?auto_23338 ?auto_23340 ) ) ( not ( = ?auto_23342 ?auto_23344 ) ) ( HOIST-AT ?auto_23345 ?auto_23342 ) ( not ( = ?auto_23341 ?auto_23345 ) ) ( AVAILABLE ?auto_23345 ) ( SURFACE-AT ?auto_23340 ?auto_23342 ) ( ON ?auto_23340 ?auto_23348 ) ( CLEAR ?auto_23340 ) ( not ( = ?auto_23339 ?auto_23348 ) ) ( not ( = ?auto_23340 ?auto_23348 ) ) ( not ( = ?auto_23338 ?auto_23348 ) ) ( IS-CRATE ?auto_23339 ) ( not ( = ?auto_23350 ?auto_23344 ) ) ( not ( = ?auto_23342 ?auto_23350 ) ) ( HOIST-AT ?auto_23352 ?auto_23350 ) ( not ( = ?auto_23341 ?auto_23352 ) ) ( not ( = ?auto_23345 ?auto_23352 ) ) ( SURFACE-AT ?auto_23339 ?auto_23350 ) ( ON ?auto_23339 ?auto_23351 ) ( CLEAR ?auto_23339 ) ( not ( = ?auto_23339 ?auto_23351 ) ) ( not ( = ?auto_23340 ?auto_23351 ) ) ( not ( = ?auto_23338 ?auto_23351 ) ) ( not ( = ?auto_23348 ?auto_23351 ) ) ( IS-CRATE ?auto_23338 ) ( not ( = ?auto_23337 ?auto_23338 ) ) ( not ( = ?auto_23339 ?auto_23337 ) ) ( not ( = ?auto_23340 ?auto_23337 ) ) ( not ( = ?auto_23348 ?auto_23337 ) ) ( not ( = ?auto_23351 ?auto_23337 ) ) ( AVAILABLE ?auto_23352 ) ( SURFACE-AT ?auto_23338 ?auto_23350 ) ( ON ?auto_23338 ?auto_23349 ) ( CLEAR ?auto_23338 ) ( not ( = ?auto_23339 ?auto_23349 ) ) ( not ( = ?auto_23340 ?auto_23349 ) ) ( not ( = ?auto_23338 ?auto_23349 ) ) ( not ( = ?auto_23348 ?auto_23349 ) ) ( not ( = ?auto_23351 ?auto_23349 ) ) ( not ( = ?auto_23337 ?auto_23349 ) ) ( SURFACE-AT ?auto_23343 ?auto_23344 ) ( CLEAR ?auto_23343 ) ( IS-CRATE ?auto_23337 ) ( not ( = ?auto_23343 ?auto_23337 ) ) ( not ( = ?auto_23339 ?auto_23343 ) ) ( not ( = ?auto_23340 ?auto_23343 ) ) ( not ( = ?auto_23338 ?auto_23343 ) ) ( not ( = ?auto_23348 ?auto_23343 ) ) ( not ( = ?auto_23351 ?auto_23343 ) ) ( not ( = ?auto_23349 ?auto_23343 ) ) ( AVAILABLE ?auto_23341 ) ( TRUCK-AT ?auto_23347 ?auto_23346 ) ( not ( = ?auto_23346 ?auto_23344 ) ) ( not ( = ?auto_23342 ?auto_23346 ) ) ( not ( = ?auto_23350 ?auto_23346 ) ) ( HOIST-AT ?auto_23353 ?auto_23346 ) ( LIFTING ?auto_23353 ?auto_23337 ) ( not ( = ?auto_23341 ?auto_23353 ) ) ( not ( = ?auto_23345 ?auto_23353 ) ) ( not ( = ?auto_23352 ?auto_23353 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23338 ?auto_23339 ?auto_23340 )
      ( MAKE-3CRATE-VERIFY ?auto_23337 ?auto_23338 ?auto_23339 ?auto_23340 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23354 - SURFACE
      ?auto_23355 - SURFACE
      ?auto_23356 - SURFACE
      ?auto_23357 - SURFACE
      ?auto_23358 - SURFACE
    )
    :vars
    (
      ?auto_23359 - HOIST
      ?auto_23361 - PLACE
      ?auto_23360 - PLACE
      ?auto_23362 - HOIST
      ?auto_23365 - SURFACE
      ?auto_23367 - PLACE
      ?auto_23369 - HOIST
      ?auto_23368 - SURFACE
      ?auto_23366 - SURFACE
      ?auto_23364 - TRUCK
      ?auto_23363 - PLACE
      ?auto_23370 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_23359 ?auto_23361 ) ( IS-CRATE ?auto_23358 ) ( not ( = ?auto_23357 ?auto_23358 ) ) ( not ( = ?auto_23356 ?auto_23357 ) ) ( not ( = ?auto_23356 ?auto_23358 ) ) ( not ( = ?auto_23360 ?auto_23361 ) ) ( HOIST-AT ?auto_23362 ?auto_23360 ) ( not ( = ?auto_23359 ?auto_23362 ) ) ( AVAILABLE ?auto_23362 ) ( SURFACE-AT ?auto_23358 ?auto_23360 ) ( ON ?auto_23358 ?auto_23365 ) ( CLEAR ?auto_23358 ) ( not ( = ?auto_23357 ?auto_23365 ) ) ( not ( = ?auto_23358 ?auto_23365 ) ) ( not ( = ?auto_23356 ?auto_23365 ) ) ( IS-CRATE ?auto_23357 ) ( not ( = ?auto_23367 ?auto_23361 ) ) ( not ( = ?auto_23360 ?auto_23367 ) ) ( HOIST-AT ?auto_23369 ?auto_23367 ) ( not ( = ?auto_23359 ?auto_23369 ) ) ( not ( = ?auto_23362 ?auto_23369 ) ) ( SURFACE-AT ?auto_23357 ?auto_23367 ) ( ON ?auto_23357 ?auto_23368 ) ( CLEAR ?auto_23357 ) ( not ( = ?auto_23357 ?auto_23368 ) ) ( not ( = ?auto_23358 ?auto_23368 ) ) ( not ( = ?auto_23356 ?auto_23368 ) ) ( not ( = ?auto_23365 ?auto_23368 ) ) ( IS-CRATE ?auto_23356 ) ( not ( = ?auto_23355 ?auto_23356 ) ) ( not ( = ?auto_23357 ?auto_23355 ) ) ( not ( = ?auto_23358 ?auto_23355 ) ) ( not ( = ?auto_23365 ?auto_23355 ) ) ( not ( = ?auto_23368 ?auto_23355 ) ) ( AVAILABLE ?auto_23369 ) ( SURFACE-AT ?auto_23356 ?auto_23367 ) ( ON ?auto_23356 ?auto_23366 ) ( CLEAR ?auto_23356 ) ( not ( = ?auto_23357 ?auto_23366 ) ) ( not ( = ?auto_23358 ?auto_23366 ) ) ( not ( = ?auto_23356 ?auto_23366 ) ) ( not ( = ?auto_23365 ?auto_23366 ) ) ( not ( = ?auto_23368 ?auto_23366 ) ) ( not ( = ?auto_23355 ?auto_23366 ) ) ( SURFACE-AT ?auto_23354 ?auto_23361 ) ( CLEAR ?auto_23354 ) ( IS-CRATE ?auto_23355 ) ( not ( = ?auto_23354 ?auto_23355 ) ) ( not ( = ?auto_23357 ?auto_23354 ) ) ( not ( = ?auto_23358 ?auto_23354 ) ) ( not ( = ?auto_23356 ?auto_23354 ) ) ( not ( = ?auto_23365 ?auto_23354 ) ) ( not ( = ?auto_23368 ?auto_23354 ) ) ( not ( = ?auto_23366 ?auto_23354 ) ) ( AVAILABLE ?auto_23359 ) ( TRUCK-AT ?auto_23364 ?auto_23363 ) ( not ( = ?auto_23363 ?auto_23361 ) ) ( not ( = ?auto_23360 ?auto_23363 ) ) ( not ( = ?auto_23367 ?auto_23363 ) ) ( HOIST-AT ?auto_23370 ?auto_23363 ) ( LIFTING ?auto_23370 ?auto_23355 ) ( not ( = ?auto_23359 ?auto_23370 ) ) ( not ( = ?auto_23362 ?auto_23370 ) ) ( not ( = ?auto_23369 ?auto_23370 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23356 ?auto_23357 ?auto_23358 )
      ( MAKE-4CRATE-VERIFY ?auto_23354 ?auto_23355 ?auto_23356 ?auto_23357 ?auto_23358 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23371 - SURFACE
      ?auto_23372 - SURFACE
      ?auto_23373 - SURFACE
      ?auto_23374 - SURFACE
      ?auto_23375 - SURFACE
      ?auto_23376 - SURFACE
    )
    :vars
    (
      ?auto_23377 - HOIST
      ?auto_23379 - PLACE
      ?auto_23378 - PLACE
      ?auto_23380 - HOIST
      ?auto_23383 - SURFACE
      ?auto_23385 - PLACE
      ?auto_23387 - HOIST
      ?auto_23386 - SURFACE
      ?auto_23384 - SURFACE
      ?auto_23382 - TRUCK
      ?auto_23381 - PLACE
      ?auto_23388 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_23377 ?auto_23379 ) ( IS-CRATE ?auto_23376 ) ( not ( = ?auto_23375 ?auto_23376 ) ) ( not ( = ?auto_23374 ?auto_23375 ) ) ( not ( = ?auto_23374 ?auto_23376 ) ) ( not ( = ?auto_23378 ?auto_23379 ) ) ( HOIST-AT ?auto_23380 ?auto_23378 ) ( not ( = ?auto_23377 ?auto_23380 ) ) ( AVAILABLE ?auto_23380 ) ( SURFACE-AT ?auto_23376 ?auto_23378 ) ( ON ?auto_23376 ?auto_23383 ) ( CLEAR ?auto_23376 ) ( not ( = ?auto_23375 ?auto_23383 ) ) ( not ( = ?auto_23376 ?auto_23383 ) ) ( not ( = ?auto_23374 ?auto_23383 ) ) ( IS-CRATE ?auto_23375 ) ( not ( = ?auto_23385 ?auto_23379 ) ) ( not ( = ?auto_23378 ?auto_23385 ) ) ( HOIST-AT ?auto_23387 ?auto_23385 ) ( not ( = ?auto_23377 ?auto_23387 ) ) ( not ( = ?auto_23380 ?auto_23387 ) ) ( SURFACE-AT ?auto_23375 ?auto_23385 ) ( ON ?auto_23375 ?auto_23386 ) ( CLEAR ?auto_23375 ) ( not ( = ?auto_23375 ?auto_23386 ) ) ( not ( = ?auto_23376 ?auto_23386 ) ) ( not ( = ?auto_23374 ?auto_23386 ) ) ( not ( = ?auto_23383 ?auto_23386 ) ) ( IS-CRATE ?auto_23374 ) ( not ( = ?auto_23373 ?auto_23374 ) ) ( not ( = ?auto_23375 ?auto_23373 ) ) ( not ( = ?auto_23376 ?auto_23373 ) ) ( not ( = ?auto_23383 ?auto_23373 ) ) ( not ( = ?auto_23386 ?auto_23373 ) ) ( AVAILABLE ?auto_23387 ) ( SURFACE-AT ?auto_23374 ?auto_23385 ) ( ON ?auto_23374 ?auto_23384 ) ( CLEAR ?auto_23374 ) ( not ( = ?auto_23375 ?auto_23384 ) ) ( not ( = ?auto_23376 ?auto_23384 ) ) ( not ( = ?auto_23374 ?auto_23384 ) ) ( not ( = ?auto_23383 ?auto_23384 ) ) ( not ( = ?auto_23386 ?auto_23384 ) ) ( not ( = ?auto_23373 ?auto_23384 ) ) ( SURFACE-AT ?auto_23372 ?auto_23379 ) ( CLEAR ?auto_23372 ) ( IS-CRATE ?auto_23373 ) ( not ( = ?auto_23372 ?auto_23373 ) ) ( not ( = ?auto_23375 ?auto_23372 ) ) ( not ( = ?auto_23376 ?auto_23372 ) ) ( not ( = ?auto_23374 ?auto_23372 ) ) ( not ( = ?auto_23383 ?auto_23372 ) ) ( not ( = ?auto_23386 ?auto_23372 ) ) ( not ( = ?auto_23384 ?auto_23372 ) ) ( AVAILABLE ?auto_23377 ) ( TRUCK-AT ?auto_23382 ?auto_23381 ) ( not ( = ?auto_23381 ?auto_23379 ) ) ( not ( = ?auto_23378 ?auto_23381 ) ) ( not ( = ?auto_23385 ?auto_23381 ) ) ( HOIST-AT ?auto_23388 ?auto_23381 ) ( LIFTING ?auto_23388 ?auto_23373 ) ( not ( = ?auto_23377 ?auto_23388 ) ) ( not ( = ?auto_23380 ?auto_23388 ) ) ( not ( = ?auto_23387 ?auto_23388 ) ) ( ON ?auto_23372 ?auto_23371 ) ( not ( = ?auto_23371 ?auto_23372 ) ) ( not ( = ?auto_23371 ?auto_23373 ) ) ( not ( = ?auto_23371 ?auto_23374 ) ) ( not ( = ?auto_23371 ?auto_23375 ) ) ( not ( = ?auto_23371 ?auto_23376 ) ) ( not ( = ?auto_23371 ?auto_23383 ) ) ( not ( = ?auto_23371 ?auto_23386 ) ) ( not ( = ?auto_23371 ?auto_23384 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23374 ?auto_23375 ?auto_23376 )
      ( MAKE-5CRATE-VERIFY ?auto_23371 ?auto_23372 ?auto_23373 ?auto_23374 ?auto_23375 ?auto_23376 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23389 - SURFACE
      ?auto_23390 - SURFACE
    )
    :vars
    (
      ?auto_23391 - HOIST
      ?auto_23394 - PLACE
      ?auto_23398 - SURFACE
      ?auto_23392 - PLACE
      ?auto_23395 - HOIST
      ?auto_23399 - SURFACE
      ?auto_23402 - PLACE
      ?auto_23404 - HOIST
      ?auto_23403 - SURFACE
      ?auto_23401 - SURFACE
      ?auto_23400 - SURFACE
      ?auto_23393 - SURFACE
      ?auto_23397 - TRUCK
      ?auto_23396 - PLACE
      ?auto_23405 - HOIST
      ?auto_23406 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23391 ?auto_23394 ) ( IS-CRATE ?auto_23390 ) ( not ( = ?auto_23389 ?auto_23390 ) ) ( not ( = ?auto_23398 ?auto_23389 ) ) ( not ( = ?auto_23398 ?auto_23390 ) ) ( not ( = ?auto_23392 ?auto_23394 ) ) ( HOIST-AT ?auto_23395 ?auto_23392 ) ( not ( = ?auto_23391 ?auto_23395 ) ) ( AVAILABLE ?auto_23395 ) ( SURFACE-AT ?auto_23390 ?auto_23392 ) ( ON ?auto_23390 ?auto_23399 ) ( CLEAR ?auto_23390 ) ( not ( = ?auto_23389 ?auto_23399 ) ) ( not ( = ?auto_23390 ?auto_23399 ) ) ( not ( = ?auto_23398 ?auto_23399 ) ) ( IS-CRATE ?auto_23389 ) ( not ( = ?auto_23402 ?auto_23394 ) ) ( not ( = ?auto_23392 ?auto_23402 ) ) ( HOIST-AT ?auto_23404 ?auto_23402 ) ( not ( = ?auto_23391 ?auto_23404 ) ) ( not ( = ?auto_23395 ?auto_23404 ) ) ( SURFACE-AT ?auto_23389 ?auto_23402 ) ( ON ?auto_23389 ?auto_23403 ) ( CLEAR ?auto_23389 ) ( not ( = ?auto_23389 ?auto_23403 ) ) ( not ( = ?auto_23390 ?auto_23403 ) ) ( not ( = ?auto_23398 ?auto_23403 ) ) ( not ( = ?auto_23399 ?auto_23403 ) ) ( IS-CRATE ?auto_23398 ) ( not ( = ?auto_23401 ?auto_23398 ) ) ( not ( = ?auto_23389 ?auto_23401 ) ) ( not ( = ?auto_23390 ?auto_23401 ) ) ( not ( = ?auto_23399 ?auto_23401 ) ) ( not ( = ?auto_23403 ?auto_23401 ) ) ( AVAILABLE ?auto_23404 ) ( SURFACE-AT ?auto_23398 ?auto_23402 ) ( ON ?auto_23398 ?auto_23400 ) ( CLEAR ?auto_23398 ) ( not ( = ?auto_23389 ?auto_23400 ) ) ( not ( = ?auto_23390 ?auto_23400 ) ) ( not ( = ?auto_23398 ?auto_23400 ) ) ( not ( = ?auto_23399 ?auto_23400 ) ) ( not ( = ?auto_23403 ?auto_23400 ) ) ( not ( = ?auto_23401 ?auto_23400 ) ) ( SURFACE-AT ?auto_23393 ?auto_23394 ) ( CLEAR ?auto_23393 ) ( IS-CRATE ?auto_23401 ) ( not ( = ?auto_23393 ?auto_23401 ) ) ( not ( = ?auto_23389 ?auto_23393 ) ) ( not ( = ?auto_23390 ?auto_23393 ) ) ( not ( = ?auto_23398 ?auto_23393 ) ) ( not ( = ?auto_23399 ?auto_23393 ) ) ( not ( = ?auto_23403 ?auto_23393 ) ) ( not ( = ?auto_23400 ?auto_23393 ) ) ( AVAILABLE ?auto_23391 ) ( TRUCK-AT ?auto_23397 ?auto_23396 ) ( not ( = ?auto_23396 ?auto_23394 ) ) ( not ( = ?auto_23392 ?auto_23396 ) ) ( not ( = ?auto_23402 ?auto_23396 ) ) ( HOIST-AT ?auto_23405 ?auto_23396 ) ( not ( = ?auto_23391 ?auto_23405 ) ) ( not ( = ?auto_23395 ?auto_23405 ) ) ( not ( = ?auto_23404 ?auto_23405 ) ) ( AVAILABLE ?auto_23405 ) ( SURFACE-AT ?auto_23401 ?auto_23396 ) ( ON ?auto_23401 ?auto_23406 ) ( CLEAR ?auto_23401 ) ( not ( = ?auto_23389 ?auto_23406 ) ) ( not ( = ?auto_23390 ?auto_23406 ) ) ( not ( = ?auto_23398 ?auto_23406 ) ) ( not ( = ?auto_23399 ?auto_23406 ) ) ( not ( = ?auto_23403 ?auto_23406 ) ) ( not ( = ?auto_23401 ?auto_23406 ) ) ( not ( = ?auto_23400 ?auto_23406 ) ) ( not ( = ?auto_23393 ?auto_23406 ) ) )
    :subtasks
    ( ( !LIFT ?auto_23405 ?auto_23401 ?auto_23406 ?auto_23396 )
      ( MAKE-2CRATE ?auto_23398 ?auto_23389 ?auto_23390 )
      ( MAKE-1CRATE-VERIFY ?auto_23389 ?auto_23390 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23407 - SURFACE
      ?auto_23408 - SURFACE
      ?auto_23409 - SURFACE
    )
    :vars
    (
      ?auto_23423 - HOIST
      ?auto_23411 - PLACE
      ?auto_23424 - PLACE
      ?auto_23418 - HOIST
      ?auto_23422 - SURFACE
      ?auto_23419 - PLACE
      ?auto_23420 - HOIST
      ?auto_23416 - SURFACE
      ?auto_23413 - SURFACE
      ?auto_23415 - SURFACE
      ?auto_23412 - SURFACE
      ?auto_23410 - TRUCK
      ?auto_23421 - PLACE
      ?auto_23417 - HOIST
      ?auto_23414 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23423 ?auto_23411 ) ( IS-CRATE ?auto_23409 ) ( not ( = ?auto_23408 ?auto_23409 ) ) ( not ( = ?auto_23407 ?auto_23408 ) ) ( not ( = ?auto_23407 ?auto_23409 ) ) ( not ( = ?auto_23424 ?auto_23411 ) ) ( HOIST-AT ?auto_23418 ?auto_23424 ) ( not ( = ?auto_23423 ?auto_23418 ) ) ( AVAILABLE ?auto_23418 ) ( SURFACE-AT ?auto_23409 ?auto_23424 ) ( ON ?auto_23409 ?auto_23422 ) ( CLEAR ?auto_23409 ) ( not ( = ?auto_23408 ?auto_23422 ) ) ( not ( = ?auto_23409 ?auto_23422 ) ) ( not ( = ?auto_23407 ?auto_23422 ) ) ( IS-CRATE ?auto_23408 ) ( not ( = ?auto_23419 ?auto_23411 ) ) ( not ( = ?auto_23424 ?auto_23419 ) ) ( HOIST-AT ?auto_23420 ?auto_23419 ) ( not ( = ?auto_23423 ?auto_23420 ) ) ( not ( = ?auto_23418 ?auto_23420 ) ) ( SURFACE-AT ?auto_23408 ?auto_23419 ) ( ON ?auto_23408 ?auto_23416 ) ( CLEAR ?auto_23408 ) ( not ( = ?auto_23408 ?auto_23416 ) ) ( not ( = ?auto_23409 ?auto_23416 ) ) ( not ( = ?auto_23407 ?auto_23416 ) ) ( not ( = ?auto_23422 ?auto_23416 ) ) ( IS-CRATE ?auto_23407 ) ( not ( = ?auto_23413 ?auto_23407 ) ) ( not ( = ?auto_23408 ?auto_23413 ) ) ( not ( = ?auto_23409 ?auto_23413 ) ) ( not ( = ?auto_23422 ?auto_23413 ) ) ( not ( = ?auto_23416 ?auto_23413 ) ) ( AVAILABLE ?auto_23420 ) ( SURFACE-AT ?auto_23407 ?auto_23419 ) ( ON ?auto_23407 ?auto_23415 ) ( CLEAR ?auto_23407 ) ( not ( = ?auto_23408 ?auto_23415 ) ) ( not ( = ?auto_23409 ?auto_23415 ) ) ( not ( = ?auto_23407 ?auto_23415 ) ) ( not ( = ?auto_23422 ?auto_23415 ) ) ( not ( = ?auto_23416 ?auto_23415 ) ) ( not ( = ?auto_23413 ?auto_23415 ) ) ( SURFACE-AT ?auto_23412 ?auto_23411 ) ( CLEAR ?auto_23412 ) ( IS-CRATE ?auto_23413 ) ( not ( = ?auto_23412 ?auto_23413 ) ) ( not ( = ?auto_23408 ?auto_23412 ) ) ( not ( = ?auto_23409 ?auto_23412 ) ) ( not ( = ?auto_23407 ?auto_23412 ) ) ( not ( = ?auto_23422 ?auto_23412 ) ) ( not ( = ?auto_23416 ?auto_23412 ) ) ( not ( = ?auto_23415 ?auto_23412 ) ) ( AVAILABLE ?auto_23423 ) ( TRUCK-AT ?auto_23410 ?auto_23421 ) ( not ( = ?auto_23421 ?auto_23411 ) ) ( not ( = ?auto_23424 ?auto_23421 ) ) ( not ( = ?auto_23419 ?auto_23421 ) ) ( HOIST-AT ?auto_23417 ?auto_23421 ) ( not ( = ?auto_23423 ?auto_23417 ) ) ( not ( = ?auto_23418 ?auto_23417 ) ) ( not ( = ?auto_23420 ?auto_23417 ) ) ( AVAILABLE ?auto_23417 ) ( SURFACE-AT ?auto_23413 ?auto_23421 ) ( ON ?auto_23413 ?auto_23414 ) ( CLEAR ?auto_23413 ) ( not ( = ?auto_23408 ?auto_23414 ) ) ( not ( = ?auto_23409 ?auto_23414 ) ) ( not ( = ?auto_23407 ?auto_23414 ) ) ( not ( = ?auto_23422 ?auto_23414 ) ) ( not ( = ?auto_23416 ?auto_23414 ) ) ( not ( = ?auto_23413 ?auto_23414 ) ) ( not ( = ?auto_23415 ?auto_23414 ) ) ( not ( = ?auto_23412 ?auto_23414 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23408 ?auto_23409 )
      ( MAKE-2CRATE-VERIFY ?auto_23407 ?auto_23408 ?auto_23409 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23425 - SURFACE
      ?auto_23426 - SURFACE
      ?auto_23427 - SURFACE
      ?auto_23428 - SURFACE
    )
    :vars
    (
      ?auto_23436 - HOIST
      ?auto_23437 - PLACE
      ?auto_23441 - PLACE
      ?auto_23435 - HOIST
      ?auto_23431 - SURFACE
      ?auto_23434 - PLACE
      ?auto_23432 - HOIST
      ?auto_23440 - SURFACE
      ?auto_23438 - SURFACE
      ?auto_23439 - SURFACE
      ?auto_23430 - TRUCK
      ?auto_23433 - PLACE
      ?auto_23429 - HOIST
      ?auto_23442 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23436 ?auto_23437 ) ( IS-CRATE ?auto_23428 ) ( not ( = ?auto_23427 ?auto_23428 ) ) ( not ( = ?auto_23426 ?auto_23427 ) ) ( not ( = ?auto_23426 ?auto_23428 ) ) ( not ( = ?auto_23441 ?auto_23437 ) ) ( HOIST-AT ?auto_23435 ?auto_23441 ) ( not ( = ?auto_23436 ?auto_23435 ) ) ( AVAILABLE ?auto_23435 ) ( SURFACE-AT ?auto_23428 ?auto_23441 ) ( ON ?auto_23428 ?auto_23431 ) ( CLEAR ?auto_23428 ) ( not ( = ?auto_23427 ?auto_23431 ) ) ( not ( = ?auto_23428 ?auto_23431 ) ) ( not ( = ?auto_23426 ?auto_23431 ) ) ( IS-CRATE ?auto_23427 ) ( not ( = ?auto_23434 ?auto_23437 ) ) ( not ( = ?auto_23441 ?auto_23434 ) ) ( HOIST-AT ?auto_23432 ?auto_23434 ) ( not ( = ?auto_23436 ?auto_23432 ) ) ( not ( = ?auto_23435 ?auto_23432 ) ) ( SURFACE-AT ?auto_23427 ?auto_23434 ) ( ON ?auto_23427 ?auto_23440 ) ( CLEAR ?auto_23427 ) ( not ( = ?auto_23427 ?auto_23440 ) ) ( not ( = ?auto_23428 ?auto_23440 ) ) ( not ( = ?auto_23426 ?auto_23440 ) ) ( not ( = ?auto_23431 ?auto_23440 ) ) ( IS-CRATE ?auto_23426 ) ( not ( = ?auto_23425 ?auto_23426 ) ) ( not ( = ?auto_23427 ?auto_23425 ) ) ( not ( = ?auto_23428 ?auto_23425 ) ) ( not ( = ?auto_23431 ?auto_23425 ) ) ( not ( = ?auto_23440 ?auto_23425 ) ) ( AVAILABLE ?auto_23432 ) ( SURFACE-AT ?auto_23426 ?auto_23434 ) ( ON ?auto_23426 ?auto_23438 ) ( CLEAR ?auto_23426 ) ( not ( = ?auto_23427 ?auto_23438 ) ) ( not ( = ?auto_23428 ?auto_23438 ) ) ( not ( = ?auto_23426 ?auto_23438 ) ) ( not ( = ?auto_23431 ?auto_23438 ) ) ( not ( = ?auto_23440 ?auto_23438 ) ) ( not ( = ?auto_23425 ?auto_23438 ) ) ( SURFACE-AT ?auto_23439 ?auto_23437 ) ( CLEAR ?auto_23439 ) ( IS-CRATE ?auto_23425 ) ( not ( = ?auto_23439 ?auto_23425 ) ) ( not ( = ?auto_23427 ?auto_23439 ) ) ( not ( = ?auto_23428 ?auto_23439 ) ) ( not ( = ?auto_23426 ?auto_23439 ) ) ( not ( = ?auto_23431 ?auto_23439 ) ) ( not ( = ?auto_23440 ?auto_23439 ) ) ( not ( = ?auto_23438 ?auto_23439 ) ) ( AVAILABLE ?auto_23436 ) ( TRUCK-AT ?auto_23430 ?auto_23433 ) ( not ( = ?auto_23433 ?auto_23437 ) ) ( not ( = ?auto_23441 ?auto_23433 ) ) ( not ( = ?auto_23434 ?auto_23433 ) ) ( HOIST-AT ?auto_23429 ?auto_23433 ) ( not ( = ?auto_23436 ?auto_23429 ) ) ( not ( = ?auto_23435 ?auto_23429 ) ) ( not ( = ?auto_23432 ?auto_23429 ) ) ( AVAILABLE ?auto_23429 ) ( SURFACE-AT ?auto_23425 ?auto_23433 ) ( ON ?auto_23425 ?auto_23442 ) ( CLEAR ?auto_23425 ) ( not ( = ?auto_23427 ?auto_23442 ) ) ( not ( = ?auto_23428 ?auto_23442 ) ) ( not ( = ?auto_23426 ?auto_23442 ) ) ( not ( = ?auto_23431 ?auto_23442 ) ) ( not ( = ?auto_23440 ?auto_23442 ) ) ( not ( = ?auto_23425 ?auto_23442 ) ) ( not ( = ?auto_23438 ?auto_23442 ) ) ( not ( = ?auto_23439 ?auto_23442 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23426 ?auto_23427 ?auto_23428 )
      ( MAKE-3CRATE-VERIFY ?auto_23425 ?auto_23426 ?auto_23427 ?auto_23428 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23443 - SURFACE
      ?auto_23444 - SURFACE
      ?auto_23445 - SURFACE
      ?auto_23446 - SURFACE
      ?auto_23447 - SURFACE
    )
    :vars
    (
      ?auto_23455 - HOIST
      ?auto_23456 - PLACE
      ?auto_23459 - PLACE
      ?auto_23454 - HOIST
      ?auto_23450 - SURFACE
      ?auto_23453 - PLACE
      ?auto_23451 - HOIST
      ?auto_23458 - SURFACE
      ?auto_23457 - SURFACE
      ?auto_23449 - TRUCK
      ?auto_23452 - PLACE
      ?auto_23448 - HOIST
      ?auto_23460 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23455 ?auto_23456 ) ( IS-CRATE ?auto_23447 ) ( not ( = ?auto_23446 ?auto_23447 ) ) ( not ( = ?auto_23445 ?auto_23446 ) ) ( not ( = ?auto_23445 ?auto_23447 ) ) ( not ( = ?auto_23459 ?auto_23456 ) ) ( HOIST-AT ?auto_23454 ?auto_23459 ) ( not ( = ?auto_23455 ?auto_23454 ) ) ( AVAILABLE ?auto_23454 ) ( SURFACE-AT ?auto_23447 ?auto_23459 ) ( ON ?auto_23447 ?auto_23450 ) ( CLEAR ?auto_23447 ) ( not ( = ?auto_23446 ?auto_23450 ) ) ( not ( = ?auto_23447 ?auto_23450 ) ) ( not ( = ?auto_23445 ?auto_23450 ) ) ( IS-CRATE ?auto_23446 ) ( not ( = ?auto_23453 ?auto_23456 ) ) ( not ( = ?auto_23459 ?auto_23453 ) ) ( HOIST-AT ?auto_23451 ?auto_23453 ) ( not ( = ?auto_23455 ?auto_23451 ) ) ( not ( = ?auto_23454 ?auto_23451 ) ) ( SURFACE-AT ?auto_23446 ?auto_23453 ) ( ON ?auto_23446 ?auto_23458 ) ( CLEAR ?auto_23446 ) ( not ( = ?auto_23446 ?auto_23458 ) ) ( not ( = ?auto_23447 ?auto_23458 ) ) ( not ( = ?auto_23445 ?auto_23458 ) ) ( not ( = ?auto_23450 ?auto_23458 ) ) ( IS-CRATE ?auto_23445 ) ( not ( = ?auto_23444 ?auto_23445 ) ) ( not ( = ?auto_23446 ?auto_23444 ) ) ( not ( = ?auto_23447 ?auto_23444 ) ) ( not ( = ?auto_23450 ?auto_23444 ) ) ( not ( = ?auto_23458 ?auto_23444 ) ) ( AVAILABLE ?auto_23451 ) ( SURFACE-AT ?auto_23445 ?auto_23453 ) ( ON ?auto_23445 ?auto_23457 ) ( CLEAR ?auto_23445 ) ( not ( = ?auto_23446 ?auto_23457 ) ) ( not ( = ?auto_23447 ?auto_23457 ) ) ( not ( = ?auto_23445 ?auto_23457 ) ) ( not ( = ?auto_23450 ?auto_23457 ) ) ( not ( = ?auto_23458 ?auto_23457 ) ) ( not ( = ?auto_23444 ?auto_23457 ) ) ( SURFACE-AT ?auto_23443 ?auto_23456 ) ( CLEAR ?auto_23443 ) ( IS-CRATE ?auto_23444 ) ( not ( = ?auto_23443 ?auto_23444 ) ) ( not ( = ?auto_23446 ?auto_23443 ) ) ( not ( = ?auto_23447 ?auto_23443 ) ) ( not ( = ?auto_23445 ?auto_23443 ) ) ( not ( = ?auto_23450 ?auto_23443 ) ) ( not ( = ?auto_23458 ?auto_23443 ) ) ( not ( = ?auto_23457 ?auto_23443 ) ) ( AVAILABLE ?auto_23455 ) ( TRUCK-AT ?auto_23449 ?auto_23452 ) ( not ( = ?auto_23452 ?auto_23456 ) ) ( not ( = ?auto_23459 ?auto_23452 ) ) ( not ( = ?auto_23453 ?auto_23452 ) ) ( HOIST-AT ?auto_23448 ?auto_23452 ) ( not ( = ?auto_23455 ?auto_23448 ) ) ( not ( = ?auto_23454 ?auto_23448 ) ) ( not ( = ?auto_23451 ?auto_23448 ) ) ( AVAILABLE ?auto_23448 ) ( SURFACE-AT ?auto_23444 ?auto_23452 ) ( ON ?auto_23444 ?auto_23460 ) ( CLEAR ?auto_23444 ) ( not ( = ?auto_23446 ?auto_23460 ) ) ( not ( = ?auto_23447 ?auto_23460 ) ) ( not ( = ?auto_23445 ?auto_23460 ) ) ( not ( = ?auto_23450 ?auto_23460 ) ) ( not ( = ?auto_23458 ?auto_23460 ) ) ( not ( = ?auto_23444 ?auto_23460 ) ) ( not ( = ?auto_23457 ?auto_23460 ) ) ( not ( = ?auto_23443 ?auto_23460 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23445 ?auto_23446 ?auto_23447 )
      ( MAKE-4CRATE-VERIFY ?auto_23443 ?auto_23444 ?auto_23445 ?auto_23446 ?auto_23447 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23461 - SURFACE
      ?auto_23462 - SURFACE
      ?auto_23463 - SURFACE
      ?auto_23464 - SURFACE
      ?auto_23465 - SURFACE
      ?auto_23466 - SURFACE
    )
    :vars
    (
      ?auto_23474 - HOIST
      ?auto_23475 - PLACE
      ?auto_23478 - PLACE
      ?auto_23473 - HOIST
      ?auto_23469 - SURFACE
      ?auto_23472 - PLACE
      ?auto_23470 - HOIST
      ?auto_23477 - SURFACE
      ?auto_23476 - SURFACE
      ?auto_23468 - TRUCK
      ?auto_23471 - PLACE
      ?auto_23467 - HOIST
      ?auto_23479 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23474 ?auto_23475 ) ( IS-CRATE ?auto_23466 ) ( not ( = ?auto_23465 ?auto_23466 ) ) ( not ( = ?auto_23464 ?auto_23465 ) ) ( not ( = ?auto_23464 ?auto_23466 ) ) ( not ( = ?auto_23478 ?auto_23475 ) ) ( HOIST-AT ?auto_23473 ?auto_23478 ) ( not ( = ?auto_23474 ?auto_23473 ) ) ( AVAILABLE ?auto_23473 ) ( SURFACE-AT ?auto_23466 ?auto_23478 ) ( ON ?auto_23466 ?auto_23469 ) ( CLEAR ?auto_23466 ) ( not ( = ?auto_23465 ?auto_23469 ) ) ( not ( = ?auto_23466 ?auto_23469 ) ) ( not ( = ?auto_23464 ?auto_23469 ) ) ( IS-CRATE ?auto_23465 ) ( not ( = ?auto_23472 ?auto_23475 ) ) ( not ( = ?auto_23478 ?auto_23472 ) ) ( HOIST-AT ?auto_23470 ?auto_23472 ) ( not ( = ?auto_23474 ?auto_23470 ) ) ( not ( = ?auto_23473 ?auto_23470 ) ) ( SURFACE-AT ?auto_23465 ?auto_23472 ) ( ON ?auto_23465 ?auto_23477 ) ( CLEAR ?auto_23465 ) ( not ( = ?auto_23465 ?auto_23477 ) ) ( not ( = ?auto_23466 ?auto_23477 ) ) ( not ( = ?auto_23464 ?auto_23477 ) ) ( not ( = ?auto_23469 ?auto_23477 ) ) ( IS-CRATE ?auto_23464 ) ( not ( = ?auto_23463 ?auto_23464 ) ) ( not ( = ?auto_23465 ?auto_23463 ) ) ( not ( = ?auto_23466 ?auto_23463 ) ) ( not ( = ?auto_23469 ?auto_23463 ) ) ( not ( = ?auto_23477 ?auto_23463 ) ) ( AVAILABLE ?auto_23470 ) ( SURFACE-AT ?auto_23464 ?auto_23472 ) ( ON ?auto_23464 ?auto_23476 ) ( CLEAR ?auto_23464 ) ( not ( = ?auto_23465 ?auto_23476 ) ) ( not ( = ?auto_23466 ?auto_23476 ) ) ( not ( = ?auto_23464 ?auto_23476 ) ) ( not ( = ?auto_23469 ?auto_23476 ) ) ( not ( = ?auto_23477 ?auto_23476 ) ) ( not ( = ?auto_23463 ?auto_23476 ) ) ( SURFACE-AT ?auto_23462 ?auto_23475 ) ( CLEAR ?auto_23462 ) ( IS-CRATE ?auto_23463 ) ( not ( = ?auto_23462 ?auto_23463 ) ) ( not ( = ?auto_23465 ?auto_23462 ) ) ( not ( = ?auto_23466 ?auto_23462 ) ) ( not ( = ?auto_23464 ?auto_23462 ) ) ( not ( = ?auto_23469 ?auto_23462 ) ) ( not ( = ?auto_23477 ?auto_23462 ) ) ( not ( = ?auto_23476 ?auto_23462 ) ) ( AVAILABLE ?auto_23474 ) ( TRUCK-AT ?auto_23468 ?auto_23471 ) ( not ( = ?auto_23471 ?auto_23475 ) ) ( not ( = ?auto_23478 ?auto_23471 ) ) ( not ( = ?auto_23472 ?auto_23471 ) ) ( HOIST-AT ?auto_23467 ?auto_23471 ) ( not ( = ?auto_23474 ?auto_23467 ) ) ( not ( = ?auto_23473 ?auto_23467 ) ) ( not ( = ?auto_23470 ?auto_23467 ) ) ( AVAILABLE ?auto_23467 ) ( SURFACE-AT ?auto_23463 ?auto_23471 ) ( ON ?auto_23463 ?auto_23479 ) ( CLEAR ?auto_23463 ) ( not ( = ?auto_23465 ?auto_23479 ) ) ( not ( = ?auto_23466 ?auto_23479 ) ) ( not ( = ?auto_23464 ?auto_23479 ) ) ( not ( = ?auto_23469 ?auto_23479 ) ) ( not ( = ?auto_23477 ?auto_23479 ) ) ( not ( = ?auto_23463 ?auto_23479 ) ) ( not ( = ?auto_23476 ?auto_23479 ) ) ( not ( = ?auto_23462 ?auto_23479 ) ) ( ON ?auto_23462 ?auto_23461 ) ( not ( = ?auto_23461 ?auto_23462 ) ) ( not ( = ?auto_23461 ?auto_23463 ) ) ( not ( = ?auto_23461 ?auto_23464 ) ) ( not ( = ?auto_23461 ?auto_23465 ) ) ( not ( = ?auto_23461 ?auto_23466 ) ) ( not ( = ?auto_23461 ?auto_23469 ) ) ( not ( = ?auto_23461 ?auto_23477 ) ) ( not ( = ?auto_23461 ?auto_23476 ) ) ( not ( = ?auto_23461 ?auto_23479 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23464 ?auto_23465 ?auto_23466 )
      ( MAKE-5CRATE-VERIFY ?auto_23461 ?auto_23462 ?auto_23463 ?auto_23464 ?auto_23465 ?auto_23466 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23480 - SURFACE
      ?auto_23481 - SURFACE
    )
    :vars
    (
      ?auto_23490 - HOIST
      ?auto_23491 - PLACE
      ?auto_23495 - SURFACE
      ?auto_23496 - PLACE
      ?auto_23489 - HOIST
      ?auto_23485 - SURFACE
      ?auto_23488 - PLACE
      ?auto_23486 - HOIST
      ?auto_23494 - SURFACE
      ?auto_23483 - SURFACE
      ?auto_23492 - SURFACE
      ?auto_23493 - SURFACE
      ?auto_23487 - PLACE
      ?auto_23482 - HOIST
      ?auto_23497 - SURFACE
      ?auto_23484 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23490 ?auto_23491 ) ( IS-CRATE ?auto_23481 ) ( not ( = ?auto_23480 ?auto_23481 ) ) ( not ( = ?auto_23495 ?auto_23480 ) ) ( not ( = ?auto_23495 ?auto_23481 ) ) ( not ( = ?auto_23496 ?auto_23491 ) ) ( HOIST-AT ?auto_23489 ?auto_23496 ) ( not ( = ?auto_23490 ?auto_23489 ) ) ( AVAILABLE ?auto_23489 ) ( SURFACE-AT ?auto_23481 ?auto_23496 ) ( ON ?auto_23481 ?auto_23485 ) ( CLEAR ?auto_23481 ) ( not ( = ?auto_23480 ?auto_23485 ) ) ( not ( = ?auto_23481 ?auto_23485 ) ) ( not ( = ?auto_23495 ?auto_23485 ) ) ( IS-CRATE ?auto_23480 ) ( not ( = ?auto_23488 ?auto_23491 ) ) ( not ( = ?auto_23496 ?auto_23488 ) ) ( HOIST-AT ?auto_23486 ?auto_23488 ) ( not ( = ?auto_23490 ?auto_23486 ) ) ( not ( = ?auto_23489 ?auto_23486 ) ) ( SURFACE-AT ?auto_23480 ?auto_23488 ) ( ON ?auto_23480 ?auto_23494 ) ( CLEAR ?auto_23480 ) ( not ( = ?auto_23480 ?auto_23494 ) ) ( not ( = ?auto_23481 ?auto_23494 ) ) ( not ( = ?auto_23495 ?auto_23494 ) ) ( not ( = ?auto_23485 ?auto_23494 ) ) ( IS-CRATE ?auto_23495 ) ( not ( = ?auto_23483 ?auto_23495 ) ) ( not ( = ?auto_23480 ?auto_23483 ) ) ( not ( = ?auto_23481 ?auto_23483 ) ) ( not ( = ?auto_23485 ?auto_23483 ) ) ( not ( = ?auto_23494 ?auto_23483 ) ) ( AVAILABLE ?auto_23486 ) ( SURFACE-AT ?auto_23495 ?auto_23488 ) ( ON ?auto_23495 ?auto_23492 ) ( CLEAR ?auto_23495 ) ( not ( = ?auto_23480 ?auto_23492 ) ) ( not ( = ?auto_23481 ?auto_23492 ) ) ( not ( = ?auto_23495 ?auto_23492 ) ) ( not ( = ?auto_23485 ?auto_23492 ) ) ( not ( = ?auto_23494 ?auto_23492 ) ) ( not ( = ?auto_23483 ?auto_23492 ) ) ( SURFACE-AT ?auto_23493 ?auto_23491 ) ( CLEAR ?auto_23493 ) ( IS-CRATE ?auto_23483 ) ( not ( = ?auto_23493 ?auto_23483 ) ) ( not ( = ?auto_23480 ?auto_23493 ) ) ( not ( = ?auto_23481 ?auto_23493 ) ) ( not ( = ?auto_23495 ?auto_23493 ) ) ( not ( = ?auto_23485 ?auto_23493 ) ) ( not ( = ?auto_23494 ?auto_23493 ) ) ( not ( = ?auto_23492 ?auto_23493 ) ) ( AVAILABLE ?auto_23490 ) ( not ( = ?auto_23487 ?auto_23491 ) ) ( not ( = ?auto_23496 ?auto_23487 ) ) ( not ( = ?auto_23488 ?auto_23487 ) ) ( HOIST-AT ?auto_23482 ?auto_23487 ) ( not ( = ?auto_23490 ?auto_23482 ) ) ( not ( = ?auto_23489 ?auto_23482 ) ) ( not ( = ?auto_23486 ?auto_23482 ) ) ( AVAILABLE ?auto_23482 ) ( SURFACE-AT ?auto_23483 ?auto_23487 ) ( ON ?auto_23483 ?auto_23497 ) ( CLEAR ?auto_23483 ) ( not ( = ?auto_23480 ?auto_23497 ) ) ( not ( = ?auto_23481 ?auto_23497 ) ) ( not ( = ?auto_23495 ?auto_23497 ) ) ( not ( = ?auto_23485 ?auto_23497 ) ) ( not ( = ?auto_23494 ?auto_23497 ) ) ( not ( = ?auto_23483 ?auto_23497 ) ) ( not ( = ?auto_23492 ?auto_23497 ) ) ( not ( = ?auto_23493 ?auto_23497 ) ) ( TRUCK-AT ?auto_23484 ?auto_23491 ) )
    :subtasks
    ( ( !DRIVE ?auto_23484 ?auto_23491 ?auto_23487 )
      ( MAKE-2CRATE ?auto_23495 ?auto_23480 ?auto_23481 )
      ( MAKE-1CRATE-VERIFY ?auto_23480 ?auto_23481 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23498 - SURFACE
      ?auto_23499 - SURFACE
      ?auto_23500 - SURFACE
    )
    :vars
    (
      ?auto_23501 - HOIST
      ?auto_23510 - PLACE
      ?auto_23505 - PLACE
      ?auto_23512 - HOIST
      ?auto_23514 - SURFACE
      ?auto_23506 - PLACE
      ?auto_23515 - HOIST
      ?auto_23511 - SURFACE
      ?auto_23513 - SURFACE
      ?auto_23508 - SURFACE
      ?auto_23504 - SURFACE
      ?auto_23509 - PLACE
      ?auto_23502 - HOIST
      ?auto_23507 - SURFACE
      ?auto_23503 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23501 ?auto_23510 ) ( IS-CRATE ?auto_23500 ) ( not ( = ?auto_23499 ?auto_23500 ) ) ( not ( = ?auto_23498 ?auto_23499 ) ) ( not ( = ?auto_23498 ?auto_23500 ) ) ( not ( = ?auto_23505 ?auto_23510 ) ) ( HOIST-AT ?auto_23512 ?auto_23505 ) ( not ( = ?auto_23501 ?auto_23512 ) ) ( AVAILABLE ?auto_23512 ) ( SURFACE-AT ?auto_23500 ?auto_23505 ) ( ON ?auto_23500 ?auto_23514 ) ( CLEAR ?auto_23500 ) ( not ( = ?auto_23499 ?auto_23514 ) ) ( not ( = ?auto_23500 ?auto_23514 ) ) ( not ( = ?auto_23498 ?auto_23514 ) ) ( IS-CRATE ?auto_23499 ) ( not ( = ?auto_23506 ?auto_23510 ) ) ( not ( = ?auto_23505 ?auto_23506 ) ) ( HOIST-AT ?auto_23515 ?auto_23506 ) ( not ( = ?auto_23501 ?auto_23515 ) ) ( not ( = ?auto_23512 ?auto_23515 ) ) ( SURFACE-AT ?auto_23499 ?auto_23506 ) ( ON ?auto_23499 ?auto_23511 ) ( CLEAR ?auto_23499 ) ( not ( = ?auto_23499 ?auto_23511 ) ) ( not ( = ?auto_23500 ?auto_23511 ) ) ( not ( = ?auto_23498 ?auto_23511 ) ) ( not ( = ?auto_23514 ?auto_23511 ) ) ( IS-CRATE ?auto_23498 ) ( not ( = ?auto_23513 ?auto_23498 ) ) ( not ( = ?auto_23499 ?auto_23513 ) ) ( not ( = ?auto_23500 ?auto_23513 ) ) ( not ( = ?auto_23514 ?auto_23513 ) ) ( not ( = ?auto_23511 ?auto_23513 ) ) ( AVAILABLE ?auto_23515 ) ( SURFACE-AT ?auto_23498 ?auto_23506 ) ( ON ?auto_23498 ?auto_23508 ) ( CLEAR ?auto_23498 ) ( not ( = ?auto_23499 ?auto_23508 ) ) ( not ( = ?auto_23500 ?auto_23508 ) ) ( not ( = ?auto_23498 ?auto_23508 ) ) ( not ( = ?auto_23514 ?auto_23508 ) ) ( not ( = ?auto_23511 ?auto_23508 ) ) ( not ( = ?auto_23513 ?auto_23508 ) ) ( SURFACE-AT ?auto_23504 ?auto_23510 ) ( CLEAR ?auto_23504 ) ( IS-CRATE ?auto_23513 ) ( not ( = ?auto_23504 ?auto_23513 ) ) ( not ( = ?auto_23499 ?auto_23504 ) ) ( not ( = ?auto_23500 ?auto_23504 ) ) ( not ( = ?auto_23498 ?auto_23504 ) ) ( not ( = ?auto_23514 ?auto_23504 ) ) ( not ( = ?auto_23511 ?auto_23504 ) ) ( not ( = ?auto_23508 ?auto_23504 ) ) ( AVAILABLE ?auto_23501 ) ( not ( = ?auto_23509 ?auto_23510 ) ) ( not ( = ?auto_23505 ?auto_23509 ) ) ( not ( = ?auto_23506 ?auto_23509 ) ) ( HOIST-AT ?auto_23502 ?auto_23509 ) ( not ( = ?auto_23501 ?auto_23502 ) ) ( not ( = ?auto_23512 ?auto_23502 ) ) ( not ( = ?auto_23515 ?auto_23502 ) ) ( AVAILABLE ?auto_23502 ) ( SURFACE-AT ?auto_23513 ?auto_23509 ) ( ON ?auto_23513 ?auto_23507 ) ( CLEAR ?auto_23513 ) ( not ( = ?auto_23499 ?auto_23507 ) ) ( not ( = ?auto_23500 ?auto_23507 ) ) ( not ( = ?auto_23498 ?auto_23507 ) ) ( not ( = ?auto_23514 ?auto_23507 ) ) ( not ( = ?auto_23511 ?auto_23507 ) ) ( not ( = ?auto_23513 ?auto_23507 ) ) ( not ( = ?auto_23508 ?auto_23507 ) ) ( not ( = ?auto_23504 ?auto_23507 ) ) ( TRUCK-AT ?auto_23503 ?auto_23510 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23499 ?auto_23500 )
      ( MAKE-2CRATE-VERIFY ?auto_23498 ?auto_23499 ?auto_23500 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23516 - SURFACE
      ?auto_23517 - SURFACE
      ?auto_23518 - SURFACE
      ?auto_23519 - SURFACE
    )
    :vars
    (
      ?auto_23528 - HOIST
      ?auto_23527 - PLACE
      ?auto_23532 - PLACE
      ?auto_23520 - HOIST
      ?auto_23523 - SURFACE
      ?auto_23525 - PLACE
      ?auto_23533 - HOIST
      ?auto_23524 - SURFACE
      ?auto_23526 - SURFACE
      ?auto_23530 - SURFACE
      ?auto_23521 - PLACE
      ?auto_23531 - HOIST
      ?auto_23522 - SURFACE
      ?auto_23529 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23528 ?auto_23527 ) ( IS-CRATE ?auto_23519 ) ( not ( = ?auto_23518 ?auto_23519 ) ) ( not ( = ?auto_23517 ?auto_23518 ) ) ( not ( = ?auto_23517 ?auto_23519 ) ) ( not ( = ?auto_23532 ?auto_23527 ) ) ( HOIST-AT ?auto_23520 ?auto_23532 ) ( not ( = ?auto_23528 ?auto_23520 ) ) ( AVAILABLE ?auto_23520 ) ( SURFACE-AT ?auto_23519 ?auto_23532 ) ( ON ?auto_23519 ?auto_23523 ) ( CLEAR ?auto_23519 ) ( not ( = ?auto_23518 ?auto_23523 ) ) ( not ( = ?auto_23519 ?auto_23523 ) ) ( not ( = ?auto_23517 ?auto_23523 ) ) ( IS-CRATE ?auto_23518 ) ( not ( = ?auto_23525 ?auto_23527 ) ) ( not ( = ?auto_23532 ?auto_23525 ) ) ( HOIST-AT ?auto_23533 ?auto_23525 ) ( not ( = ?auto_23528 ?auto_23533 ) ) ( not ( = ?auto_23520 ?auto_23533 ) ) ( SURFACE-AT ?auto_23518 ?auto_23525 ) ( ON ?auto_23518 ?auto_23524 ) ( CLEAR ?auto_23518 ) ( not ( = ?auto_23518 ?auto_23524 ) ) ( not ( = ?auto_23519 ?auto_23524 ) ) ( not ( = ?auto_23517 ?auto_23524 ) ) ( not ( = ?auto_23523 ?auto_23524 ) ) ( IS-CRATE ?auto_23517 ) ( not ( = ?auto_23516 ?auto_23517 ) ) ( not ( = ?auto_23518 ?auto_23516 ) ) ( not ( = ?auto_23519 ?auto_23516 ) ) ( not ( = ?auto_23523 ?auto_23516 ) ) ( not ( = ?auto_23524 ?auto_23516 ) ) ( AVAILABLE ?auto_23533 ) ( SURFACE-AT ?auto_23517 ?auto_23525 ) ( ON ?auto_23517 ?auto_23526 ) ( CLEAR ?auto_23517 ) ( not ( = ?auto_23518 ?auto_23526 ) ) ( not ( = ?auto_23519 ?auto_23526 ) ) ( not ( = ?auto_23517 ?auto_23526 ) ) ( not ( = ?auto_23523 ?auto_23526 ) ) ( not ( = ?auto_23524 ?auto_23526 ) ) ( not ( = ?auto_23516 ?auto_23526 ) ) ( SURFACE-AT ?auto_23530 ?auto_23527 ) ( CLEAR ?auto_23530 ) ( IS-CRATE ?auto_23516 ) ( not ( = ?auto_23530 ?auto_23516 ) ) ( not ( = ?auto_23518 ?auto_23530 ) ) ( not ( = ?auto_23519 ?auto_23530 ) ) ( not ( = ?auto_23517 ?auto_23530 ) ) ( not ( = ?auto_23523 ?auto_23530 ) ) ( not ( = ?auto_23524 ?auto_23530 ) ) ( not ( = ?auto_23526 ?auto_23530 ) ) ( AVAILABLE ?auto_23528 ) ( not ( = ?auto_23521 ?auto_23527 ) ) ( not ( = ?auto_23532 ?auto_23521 ) ) ( not ( = ?auto_23525 ?auto_23521 ) ) ( HOIST-AT ?auto_23531 ?auto_23521 ) ( not ( = ?auto_23528 ?auto_23531 ) ) ( not ( = ?auto_23520 ?auto_23531 ) ) ( not ( = ?auto_23533 ?auto_23531 ) ) ( AVAILABLE ?auto_23531 ) ( SURFACE-AT ?auto_23516 ?auto_23521 ) ( ON ?auto_23516 ?auto_23522 ) ( CLEAR ?auto_23516 ) ( not ( = ?auto_23518 ?auto_23522 ) ) ( not ( = ?auto_23519 ?auto_23522 ) ) ( not ( = ?auto_23517 ?auto_23522 ) ) ( not ( = ?auto_23523 ?auto_23522 ) ) ( not ( = ?auto_23524 ?auto_23522 ) ) ( not ( = ?auto_23516 ?auto_23522 ) ) ( not ( = ?auto_23526 ?auto_23522 ) ) ( not ( = ?auto_23530 ?auto_23522 ) ) ( TRUCK-AT ?auto_23529 ?auto_23527 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23517 ?auto_23518 ?auto_23519 )
      ( MAKE-3CRATE-VERIFY ?auto_23516 ?auto_23517 ?auto_23518 ?auto_23519 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23534 - SURFACE
      ?auto_23535 - SURFACE
      ?auto_23536 - SURFACE
      ?auto_23537 - SURFACE
      ?auto_23538 - SURFACE
    )
    :vars
    (
      ?auto_23547 - HOIST
      ?auto_23546 - PLACE
      ?auto_23550 - PLACE
      ?auto_23539 - HOIST
      ?auto_23542 - SURFACE
      ?auto_23544 - PLACE
      ?auto_23551 - HOIST
      ?auto_23543 - SURFACE
      ?auto_23545 - SURFACE
      ?auto_23540 - PLACE
      ?auto_23549 - HOIST
      ?auto_23541 - SURFACE
      ?auto_23548 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23547 ?auto_23546 ) ( IS-CRATE ?auto_23538 ) ( not ( = ?auto_23537 ?auto_23538 ) ) ( not ( = ?auto_23536 ?auto_23537 ) ) ( not ( = ?auto_23536 ?auto_23538 ) ) ( not ( = ?auto_23550 ?auto_23546 ) ) ( HOIST-AT ?auto_23539 ?auto_23550 ) ( not ( = ?auto_23547 ?auto_23539 ) ) ( AVAILABLE ?auto_23539 ) ( SURFACE-AT ?auto_23538 ?auto_23550 ) ( ON ?auto_23538 ?auto_23542 ) ( CLEAR ?auto_23538 ) ( not ( = ?auto_23537 ?auto_23542 ) ) ( not ( = ?auto_23538 ?auto_23542 ) ) ( not ( = ?auto_23536 ?auto_23542 ) ) ( IS-CRATE ?auto_23537 ) ( not ( = ?auto_23544 ?auto_23546 ) ) ( not ( = ?auto_23550 ?auto_23544 ) ) ( HOIST-AT ?auto_23551 ?auto_23544 ) ( not ( = ?auto_23547 ?auto_23551 ) ) ( not ( = ?auto_23539 ?auto_23551 ) ) ( SURFACE-AT ?auto_23537 ?auto_23544 ) ( ON ?auto_23537 ?auto_23543 ) ( CLEAR ?auto_23537 ) ( not ( = ?auto_23537 ?auto_23543 ) ) ( not ( = ?auto_23538 ?auto_23543 ) ) ( not ( = ?auto_23536 ?auto_23543 ) ) ( not ( = ?auto_23542 ?auto_23543 ) ) ( IS-CRATE ?auto_23536 ) ( not ( = ?auto_23535 ?auto_23536 ) ) ( not ( = ?auto_23537 ?auto_23535 ) ) ( not ( = ?auto_23538 ?auto_23535 ) ) ( not ( = ?auto_23542 ?auto_23535 ) ) ( not ( = ?auto_23543 ?auto_23535 ) ) ( AVAILABLE ?auto_23551 ) ( SURFACE-AT ?auto_23536 ?auto_23544 ) ( ON ?auto_23536 ?auto_23545 ) ( CLEAR ?auto_23536 ) ( not ( = ?auto_23537 ?auto_23545 ) ) ( not ( = ?auto_23538 ?auto_23545 ) ) ( not ( = ?auto_23536 ?auto_23545 ) ) ( not ( = ?auto_23542 ?auto_23545 ) ) ( not ( = ?auto_23543 ?auto_23545 ) ) ( not ( = ?auto_23535 ?auto_23545 ) ) ( SURFACE-AT ?auto_23534 ?auto_23546 ) ( CLEAR ?auto_23534 ) ( IS-CRATE ?auto_23535 ) ( not ( = ?auto_23534 ?auto_23535 ) ) ( not ( = ?auto_23537 ?auto_23534 ) ) ( not ( = ?auto_23538 ?auto_23534 ) ) ( not ( = ?auto_23536 ?auto_23534 ) ) ( not ( = ?auto_23542 ?auto_23534 ) ) ( not ( = ?auto_23543 ?auto_23534 ) ) ( not ( = ?auto_23545 ?auto_23534 ) ) ( AVAILABLE ?auto_23547 ) ( not ( = ?auto_23540 ?auto_23546 ) ) ( not ( = ?auto_23550 ?auto_23540 ) ) ( not ( = ?auto_23544 ?auto_23540 ) ) ( HOIST-AT ?auto_23549 ?auto_23540 ) ( not ( = ?auto_23547 ?auto_23549 ) ) ( not ( = ?auto_23539 ?auto_23549 ) ) ( not ( = ?auto_23551 ?auto_23549 ) ) ( AVAILABLE ?auto_23549 ) ( SURFACE-AT ?auto_23535 ?auto_23540 ) ( ON ?auto_23535 ?auto_23541 ) ( CLEAR ?auto_23535 ) ( not ( = ?auto_23537 ?auto_23541 ) ) ( not ( = ?auto_23538 ?auto_23541 ) ) ( not ( = ?auto_23536 ?auto_23541 ) ) ( not ( = ?auto_23542 ?auto_23541 ) ) ( not ( = ?auto_23543 ?auto_23541 ) ) ( not ( = ?auto_23535 ?auto_23541 ) ) ( not ( = ?auto_23545 ?auto_23541 ) ) ( not ( = ?auto_23534 ?auto_23541 ) ) ( TRUCK-AT ?auto_23548 ?auto_23546 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23536 ?auto_23537 ?auto_23538 )
      ( MAKE-4CRATE-VERIFY ?auto_23534 ?auto_23535 ?auto_23536 ?auto_23537 ?auto_23538 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23552 - SURFACE
      ?auto_23553 - SURFACE
      ?auto_23554 - SURFACE
      ?auto_23555 - SURFACE
      ?auto_23556 - SURFACE
      ?auto_23557 - SURFACE
    )
    :vars
    (
      ?auto_23566 - HOIST
      ?auto_23565 - PLACE
      ?auto_23569 - PLACE
      ?auto_23558 - HOIST
      ?auto_23561 - SURFACE
      ?auto_23563 - PLACE
      ?auto_23570 - HOIST
      ?auto_23562 - SURFACE
      ?auto_23564 - SURFACE
      ?auto_23559 - PLACE
      ?auto_23568 - HOIST
      ?auto_23560 - SURFACE
      ?auto_23567 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23566 ?auto_23565 ) ( IS-CRATE ?auto_23557 ) ( not ( = ?auto_23556 ?auto_23557 ) ) ( not ( = ?auto_23555 ?auto_23556 ) ) ( not ( = ?auto_23555 ?auto_23557 ) ) ( not ( = ?auto_23569 ?auto_23565 ) ) ( HOIST-AT ?auto_23558 ?auto_23569 ) ( not ( = ?auto_23566 ?auto_23558 ) ) ( AVAILABLE ?auto_23558 ) ( SURFACE-AT ?auto_23557 ?auto_23569 ) ( ON ?auto_23557 ?auto_23561 ) ( CLEAR ?auto_23557 ) ( not ( = ?auto_23556 ?auto_23561 ) ) ( not ( = ?auto_23557 ?auto_23561 ) ) ( not ( = ?auto_23555 ?auto_23561 ) ) ( IS-CRATE ?auto_23556 ) ( not ( = ?auto_23563 ?auto_23565 ) ) ( not ( = ?auto_23569 ?auto_23563 ) ) ( HOIST-AT ?auto_23570 ?auto_23563 ) ( not ( = ?auto_23566 ?auto_23570 ) ) ( not ( = ?auto_23558 ?auto_23570 ) ) ( SURFACE-AT ?auto_23556 ?auto_23563 ) ( ON ?auto_23556 ?auto_23562 ) ( CLEAR ?auto_23556 ) ( not ( = ?auto_23556 ?auto_23562 ) ) ( not ( = ?auto_23557 ?auto_23562 ) ) ( not ( = ?auto_23555 ?auto_23562 ) ) ( not ( = ?auto_23561 ?auto_23562 ) ) ( IS-CRATE ?auto_23555 ) ( not ( = ?auto_23554 ?auto_23555 ) ) ( not ( = ?auto_23556 ?auto_23554 ) ) ( not ( = ?auto_23557 ?auto_23554 ) ) ( not ( = ?auto_23561 ?auto_23554 ) ) ( not ( = ?auto_23562 ?auto_23554 ) ) ( AVAILABLE ?auto_23570 ) ( SURFACE-AT ?auto_23555 ?auto_23563 ) ( ON ?auto_23555 ?auto_23564 ) ( CLEAR ?auto_23555 ) ( not ( = ?auto_23556 ?auto_23564 ) ) ( not ( = ?auto_23557 ?auto_23564 ) ) ( not ( = ?auto_23555 ?auto_23564 ) ) ( not ( = ?auto_23561 ?auto_23564 ) ) ( not ( = ?auto_23562 ?auto_23564 ) ) ( not ( = ?auto_23554 ?auto_23564 ) ) ( SURFACE-AT ?auto_23553 ?auto_23565 ) ( CLEAR ?auto_23553 ) ( IS-CRATE ?auto_23554 ) ( not ( = ?auto_23553 ?auto_23554 ) ) ( not ( = ?auto_23556 ?auto_23553 ) ) ( not ( = ?auto_23557 ?auto_23553 ) ) ( not ( = ?auto_23555 ?auto_23553 ) ) ( not ( = ?auto_23561 ?auto_23553 ) ) ( not ( = ?auto_23562 ?auto_23553 ) ) ( not ( = ?auto_23564 ?auto_23553 ) ) ( AVAILABLE ?auto_23566 ) ( not ( = ?auto_23559 ?auto_23565 ) ) ( not ( = ?auto_23569 ?auto_23559 ) ) ( not ( = ?auto_23563 ?auto_23559 ) ) ( HOIST-AT ?auto_23568 ?auto_23559 ) ( not ( = ?auto_23566 ?auto_23568 ) ) ( not ( = ?auto_23558 ?auto_23568 ) ) ( not ( = ?auto_23570 ?auto_23568 ) ) ( AVAILABLE ?auto_23568 ) ( SURFACE-AT ?auto_23554 ?auto_23559 ) ( ON ?auto_23554 ?auto_23560 ) ( CLEAR ?auto_23554 ) ( not ( = ?auto_23556 ?auto_23560 ) ) ( not ( = ?auto_23557 ?auto_23560 ) ) ( not ( = ?auto_23555 ?auto_23560 ) ) ( not ( = ?auto_23561 ?auto_23560 ) ) ( not ( = ?auto_23562 ?auto_23560 ) ) ( not ( = ?auto_23554 ?auto_23560 ) ) ( not ( = ?auto_23564 ?auto_23560 ) ) ( not ( = ?auto_23553 ?auto_23560 ) ) ( TRUCK-AT ?auto_23567 ?auto_23565 ) ( ON ?auto_23553 ?auto_23552 ) ( not ( = ?auto_23552 ?auto_23553 ) ) ( not ( = ?auto_23552 ?auto_23554 ) ) ( not ( = ?auto_23552 ?auto_23555 ) ) ( not ( = ?auto_23552 ?auto_23556 ) ) ( not ( = ?auto_23552 ?auto_23557 ) ) ( not ( = ?auto_23552 ?auto_23561 ) ) ( not ( = ?auto_23552 ?auto_23562 ) ) ( not ( = ?auto_23552 ?auto_23564 ) ) ( not ( = ?auto_23552 ?auto_23560 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23555 ?auto_23556 ?auto_23557 )
      ( MAKE-5CRATE-VERIFY ?auto_23552 ?auto_23553 ?auto_23554 ?auto_23555 ?auto_23556 ?auto_23557 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23571 - SURFACE
      ?auto_23572 - SURFACE
    )
    :vars
    (
      ?auto_23581 - HOIST
      ?auto_23580 - PLACE
      ?auto_23586 - SURFACE
      ?auto_23585 - PLACE
      ?auto_23573 - HOIST
      ?auto_23576 - SURFACE
      ?auto_23578 - PLACE
      ?auto_23587 - HOIST
      ?auto_23577 - SURFACE
      ?auto_23588 - SURFACE
      ?auto_23579 - SURFACE
      ?auto_23583 - SURFACE
      ?auto_23574 - PLACE
      ?auto_23584 - HOIST
      ?auto_23575 - SURFACE
      ?auto_23582 - TRUCK
      ?auto_23589 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23581 ?auto_23580 ) ( IS-CRATE ?auto_23572 ) ( not ( = ?auto_23571 ?auto_23572 ) ) ( not ( = ?auto_23586 ?auto_23571 ) ) ( not ( = ?auto_23586 ?auto_23572 ) ) ( not ( = ?auto_23585 ?auto_23580 ) ) ( HOIST-AT ?auto_23573 ?auto_23585 ) ( not ( = ?auto_23581 ?auto_23573 ) ) ( AVAILABLE ?auto_23573 ) ( SURFACE-AT ?auto_23572 ?auto_23585 ) ( ON ?auto_23572 ?auto_23576 ) ( CLEAR ?auto_23572 ) ( not ( = ?auto_23571 ?auto_23576 ) ) ( not ( = ?auto_23572 ?auto_23576 ) ) ( not ( = ?auto_23586 ?auto_23576 ) ) ( IS-CRATE ?auto_23571 ) ( not ( = ?auto_23578 ?auto_23580 ) ) ( not ( = ?auto_23585 ?auto_23578 ) ) ( HOIST-AT ?auto_23587 ?auto_23578 ) ( not ( = ?auto_23581 ?auto_23587 ) ) ( not ( = ?auto_23573 ?auto_23587 ) ) ( SURFACE-AT ?auto_23571 ?auto_23578 ) ( ON ?auto_23571 ?auto_23577 ) ( CLEAR ?auto_23571 ) ( not ( = ?auto_23571 ?auto_23577 ) ) ( not ( = ?auto_23572 ?auto_23577 ) ) ( not ( = ?auto_23586 ?auto_23577 ) ) ( not ( = ?auto_23576 ?auto_23577 ) ) ( IS-CRATE ?auto_23586 ) ( not ( = ?auto_23588 ?auto_23586 ) ) ( not ( = ?auto_23571 ?auto_23588 ) ) ( not ( = ?auto_23572 ?auto_23588 ) ) ( not ( = ?auto_23576 ?auto_23588 ) ) ( not ( = ?auto_23577 ?auto_23588 ) ) ( AVAILABLE ?auto_23587 ) ( SURFACE-AT ?auto_23586 ?auto_23578 ) ( ON ?auto_23586 ?auto_23579 ) ( CLEAR ?auto_23586 ) ( not ( = ?auto_23571 ?auto_23579 ) ) ( not ( = ?auto_23572 ?auto_23579 ) ) ( not ( = ?auto_23586 ?auto_23579 ) ) ( not ( = ?auto_23576 ?auto_23579 ) ) ( not ( = ?auto_23577 ?auto_23579 ) ) ( not ( = ?auto_23588 ?auto_23579 ) ) ( IS-CRATE ?auto_23588 ) ( not ( = ?auto_23583 ?auto_23588 ) ) ( not ( = ?auto_23571 ?auto_23583 ) ) ( not ( = ?auto_23572 ?auto_23583 ) ) ( not ( = ?auto_23586 ?auto_23583 ) ) ( not ( = ?auto_23576 ?auto_23583 ) ) ( not ( = ?auto_23577 ?auto_23583 ) ) ( not ( = ?auto_23579 ?auto_23583 ) ) ( not ( = ?auto_23574 ?auto_23580 ) ) ( not ( = ?auto_23585 ?auto_23574 ) ) ( not ( = ?auto_23578 ?auto_23574 ) ) ( HOIST-AT ?auto_23584 ?auto_23574 ) ( not ( = ?auto_23581 ?auto_23584 ) ) ( not ( = ?auto_23573 ?auto_23584 ) ) ( not ( = ?auto_23587 ?auto_23584 ) ) ( AVAILABLE ?auto_23584 ) ( SURFACE-AT ?auto_23588 ?auto_23574 ) ( ON ?auto_23588 ?auto_23575 ) ( CLEAR ?auto_23588 ) ( not ( = ?auto_23571 ?auto_23575 ) ) ( not ( = ?auto_23572 ?auto_23575 ) ) ( not ( = ?auto_23586 ?auto_23575 ) ) ( not ( = ?auto_23576 ?auto_23575 ) ) ( not ( = ?auto_23577 ?auto_23575 ) ) ( not ( = ?auto_23588 ?auto_23575 ) ) ( not ( = ?auto_23579 ?auto_23575 ) ) ( not ( = ?auto_23583 ?auto_23575 ) ) ( TRUCK-AT ?auto_23582 ?auto_23580 ) ( SURFACE-AT ?auto_23589 ?auto_23580 ) ( CLEAR ?auto_23589 ) ( LIFTING ?auto_23581 ?auto_23583 ) ( IS-CRATE ?auto_23583 ) ( not ( = ?auto_23589 ?auto_23583 ) ) ( not ( = ?auto_23571 ?auto_23589 ) ) ( not ( = ?auto_23572 ?auto_23589 ) ) ( not ( = ?auto_23586 ?auto_23589 ) ) ( not ( = ?auto_23576 ?auto_23589 ) ) ( not ( = ?auto_23577 ?auto_23589 ) ) ( not ( = ?auto_23588 ?auto_23589 ) ) ( not ( = ?auto_23579 ?auto_23589 ) ) ( not ( = ?auto_23575 ?auto_23589 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23589 ?auto_23583 )
      ( MAKE-2CRATE ?auto_23586 ?auto_23571 ?auto_23572 )
      ( MAKE-1CRATE-VERIFY ?auto_23571 ?auto_23572 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23590 - SURFACE
      ?auto_23591 - SURFACE
      ?auto_23592 - SURFACE
    )
    :vars
    (
      ?auto_23606 - HOIST
      ?auto_23593 - PLACE
      ?auto_23601 - PLACE
      ?auto_23599 - HOIST
      ?auto_23605 - SURFACE
      ?auto_23602 - PLACE
      ?auto_23604 - HOIST
      ?auto_23608 - SURFACE
      ?auto_23600 - SURFACE
      ?auto_23603 - SURFACE
      ?auto_23607 - SURFACE
      ?auto_23598 - PLACE
      ?auto_23594 - HOIST
      ?auto_23595 - SURFACE
      ?auto_23596 - TRUCK
      ?auto_23597 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23606 ?auto_23593 ) ( IS-CRATE ?auto_23592 ) ( not ( = ?auto_23591 ?auto_23592 ) ) ( not ( = ?auto_23590 ?auto_23591 ) ) ( not ( = ?auto_23590 ?auto_23592 ) ) ( not ( = ?auto_23601 ?auto_23593 ) ) ( HOIST-AT ?auto_23599 ?auto_23601 ) ( not ( = ?auto_23606 ?auto_23599 ) ) ( AVAILABLE ?auto_23599 ) ( SURFACE-AT ?auto_23592 ?auto_23601 ) ( ON ?auto_23592 ?auto_23605 ) ( CLEAR ?auto_23592 ) ( not ( = ?auto_23591 ?auto_23605 ) ) ( not ( = ?auto_23592 ?auto_23605 ) ) ( not ( = ?auto_23590 ?auto_23605 ) ) ( IS-CRATE ?auto_23591 ) ( not ( = ?auto_23602 ?auto_23593 ) ) ( not ( = ?auto_23601 ?auto_23602 ) ) ( HOIST-AT ?auto_23604 ?auto_23602 ) ( not ( = ?auto_23606 ?auto_23604 ) ) ( not ( = ?auto_23599 ?auto_23604 ) ) ( SURFACE-AT ?auto_23591 ?auto_23602 ) ( ON ?auto_23591 ?auto_23608 ) ( CLEAR ?auto_23591 ) ( not ( = ?auto_23591 ?auto_23608 ) ) ( not ( = ?auto_23592 ?auto_23608 ) ) ( not ( = ?auto_23590 ?auto_23608 ) ) ( not ( = ?auto_23605 ?auto_23608 ) ) ( IS-CRATE ?auto_23590 ) ( not ( = ?auto_23600 ?auto_23590 ) ) ( not ( = ?auto_23591 ?auto_23600 ) ) ( not ( = ?auto_23592 ?auto_23600 ) ) ( not ( = ?auto_23605 ?auto_23600 ) ) ( not ( = ?auto_23608 ?auto_23600 ) ) ( AVAILABLE ?auto_23604 ) ( SURFACE-AT ?auto_23590 ?auto_23602 ) ( ON ?auto_23590 ?auto_23603 ) ( CLEAR ?auto_23590 ) ( not ( = ?auto_23591 ?auto_23603 ) ) ( not ( = ?auto_23592 ?auto_23603 ) ) ( not ( = ?auto_23590 ?auto_23603 ) ) ( not ( = ?auto_23605 ?auto_23603 ) ) ( not ( = ?auto_23608 ?auto_23603 ) ) ( not ( = ?auto_23600 ?auto_23603 ) ) ( IS-CRATE ?auto_23600 ) ( not ( = ?auto_23607 ?auto_23600 ) ) ( not ( = ?auto_23591 ?auto_23607 ) ) ( not ( = ?auto_23592 ?auto_23607 ) ) ( not ( = ?auto_23590 ?auto_23607 ) ) ( not ( = ?auto_23605 ?auto_23607 ) ) ( not ( = ?auto_23608 ?auto_23607 ) ) ( not ( = ?auto_23603 ?auto_23607 ) ) ( not ( = ?auto_23598 ?auto_23593 ) ) ( not ( = ?auto_23601 ?auto_23598 ) ) ( not ( = ?auto_23602 ?auto_23598 ) ) ( HOIST-AT ?auto_23594 ?auto_23598 ) ( not ( = ?auto_23606 ?auto_23594 ) ) ( not ( = ?auto_23599 ?auto_23594 ) ) ( not ( = ?auto_23604 ?auto_23594 ) ) ( AVAILABLE ?auto_23594 ) ( SURFACE-AT ?auto_23600 ?auto_23598 ) ( ON ?auto_23600 ?auto_23595 ) ( CLEAR ?auto_23600 ) ( not ( = ?auto_23591 ?auto_23595 ) ) ( not ( = ?auto_23592 ?auto_23595 ) ) ( not ( = ?auto_23590 ?auto_23595 ) ) ( not ( = ?auto_23605 ?auto_23595 ) ) ( not ( = ?auto_23608 ?auto_23595 ) ) ( not ( = ?auto_23600 ?auto_23595 ) ) ( not ( = ?auto_23603 ?auto_23595 ) ) ( not ( = ?auto_23607 ?auto_23595 ) ) ( TRUCK-AT ?auto_23596 ?auto_23593 ) ( SURFACE-AT ?auto_23597 ?auto_23593 ) ( CLEAR ?auto_23597 ) ( LIFTING ?auto_23606 ?auto_23607 ) ( IS-CRATE ?auto_23607 ) ( not ( = ?auto_23597 ?auto_23607 ) ) ( not ( = ?auto_23591 ?auto_23597 ) ) ( not ( = ?auto_23592 ?auto_23597 ) ) ( not ( = ?auto_23590 ?auto_23597 ) ) ( not ( = ?auto_23605 ?auto_23597 ) ) ( not ( = ?auto_23608 ?auto_23597 ) ) ( not ( = ?auto_23600 ?auto_23597 ) ) ( not ( = ?auto_23603 ?auto_23597 ) ) ( not ( = ?auto_23595 ?auto_23597 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23591 ?auto_23592 )
      ( MAKE-2CRATE-VERIFY ?auto_23590 ?auto_23591 ?auto_23592 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23609 - SURFACE
      ?auto_23610 - SURFACE
      ?auto_23611 - SURFACE
      ?auto_23612 - SURFACE
    )
    :vars
    (
      ?auto_23622 - HOIST
      ?auto_23623 - PLACE
      ?auto_23614 - PLACE
      ?auto_23624 - HOIST
      ?auto_23616 - SURFACE
      ?auto_23626 - PLACE
      ?auto_23620 - HOIST
      ?auto_23613 - SURFACE
      ?auto_23619 - SURFACE
      ?auto_23621 - SURFACE
      ?auto_23625 - PLACE
      ?auto_23615 - HOIST
      ?auto_23618 - SURFACE
      ?auto_23627 - TRUCK
      ?auto_23617 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23622 ?auto_23623 ) ( IS-CRATE ?auto_23612 ) ( not ( = ?auto_23611 ?auto_23612 ) ) ( not ( = ?auto_23610 ?auto_23611 ) ) ( not ( = ?auto_23610 ?auto_23612 ) ) ( not ( = ?auto_23614 ?auto_23623 ) ) ( HOIST-AT ?auto_23624 ?auto_23614 ) ( not ( = ?auto_23622 ?auto_23624 ) ) ( AVAILABLE ?auto_23624 ) ( SURFACE-AT ?auto_23612 ?auto_23614 ) ( ON ?auto_23612 ?auto_23616 ) ( CLEAR ?auto_23612 ) ( not ( = ?auto_23611 ?auto_23616 ) ) ( not ( = ?auto_23612 ?auto_23616 ) ) ( not ( = ?auto_23610 ?auto_23616 ) ) ( IS-CRATE ?auto_23611 ) ( not ( = ?auto_23626 ?auto_23623 ) ) ( not ( = ?auto_23614 ?auto_23626 ) ) ( HOIST-AT ?auto_23620 ?auto_23626 ) ( not ( = ?auto_23622 ?auto_23620 ) ) ( not ( = ?auto_23624 ?auto_23620 ) ) ( SURFACE-AT ?auto_23611 ?auto_23626 ) ( ON ?auto_23611 ?auto_23613 ) ( CLEAR ?auto_23611 ) ( not ( = ?auto_23611 ?auto_23613 ) ) ( not ( = ?auto_23612 ?auto_23613 ) ) ( not ( = ?auto_23610 ?auto_23613 ) ) ( not ( = ?auto_23616 ?auto_23613 ) ) ( IS-CRATE ?auto_23610 ) ( not ( = ?auto_23609 ?auto_23610 ) ) ( not ( = ?auto_23611 ?auto_23609 ) ) ( not ( = ?auto_23612 ?auto_23609 ) ) ( not ( = ?auto_23616 ?auto_23609 ) ) ( not ( = ?auto_23613 ?auto_23609 ) ) ( AVAILABLE ?auto_23620 ) ( SURFACE-AT ?auto_23610 ?auto_23626 ) ( ON ?auto_23610 ?auto_23619 ) ( CLEAR ?auto_23610 ) ( not ( = ?auto_23611 ?auto_23619 ) ) ( not ( = ?auto_23612 ?auto_23619 ) ) ( not ( = ?auto_23610 ?auto_23619 ) ) ( not ( = ?auto_23616 ?auto_23619 ) ) ( not ( = ?auto_23613 ?auto_23619 ) ) ( not ( = ?auto_23609 ?auto_23619 ) ) ( IS-CRATE ?auto_23609 ) ( not ( = ?auto_23621 ?auto_23609 ) ) ( not ( = ?auto_23611 ?auto_23621 ) ) ( not ( = ?auto_23612 ?auto_23621 ) ) ( not ( = ?auto_23610 ?auto_23621 ) ) ( not ( = ?auto_23616 ?auto_23621 ) ) ( not ( = ?auto_23613 ?auto_23621 ) ) ( not ( = ?auto_23619 ?auto_23621 ) ) ( not ( = ?auto_23625 ?auto_23623 ) ) ( not ( = ?auto_23614 ?auto_23625 ) ) ( not ( = ?auto_23626 ?auto_23625 ) ) ( HOIST-AT ?auto_23615 ?auto_23625 ) ( not ( = ?auto_23622 ?auto_23615 ) ) ( not ( = ?auto_23624 ?auto_23615 ) ) ( not ( = ?auto_23620 ?auto_23615 ) ) ( AVAILABLE ?auto_23615 ) ( SURFACE-AT ?auto_23609 ?auto_23625 ) ( ON ?auto_23609 ?auto_23618 ) ( CLEAR ?auto_23609 ) ( not ( = ?auto_23611 ?auto_23618 ) ) ( not ( = ?auto_23612 ?auto_23618 ) ) ( not ( = ?auto_23610 ?auto_23618 ) ) ( not ( = ?auto_23616 ?auto_23618 ) ) ( not ( = ?auto_23613 ?auto_23618 ) ) ( not ( = ?auto_23609 ?auto_23618 ) ) ( not ( = ?auto_23619 ?auto_23618 ) ) ( not ( = ?auto_23621 ?auto_23618 ) ) ( TRUCK-AT ?auto_23627 ?auto_23623 ) ( SURFACE-AT ?auto_23617 ?auto_23623 ) ( CLEAR ?auto_23617 ) ( LIFTING ?auto_23622 ?auto_23621 ) ( IS-CRATE ?auto_23621 ) ( not ( = ?auto_23617 ?auto_23621 ) ) ( not ( = ?auto_23611 ?auto_23617 ) ) ( not ( = ?auto_23612 ?auto_23617 ) ) ( not ( = ?auto_23610 ?auto_23617 ) ) ( not ( = ?auto_23616 ?auto_23617 ) ) ( not ( = ?auto_23613 ?auto_23617 ) ) ( not ( = ?auto_23609 ?auto_23617 ) ) ( not ( = ?auto_23619 ?auto_23617 ) ) ( not ( = ?auto_23618 ?auto_23617 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23610 ?auto_23611 ?auto_23612 )
      ( MAKE-3CRATE-VERIFY ?auto_23609 ?auto_23610 ?auto_23611 ?auto_23612 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23628 - SURFACE
      ?auto_23629 - SURFACE
      ?auto_23630 - SURFACE
      ?auto_23631 - SURFACE
      ?auto_23632 - SURFACE
    )
    :vars
    (
      ?auto_23641 - HOIST
      ?auto_23642 - PLACE
      ?auto_23634 - PLACE
      ?auto_23643 - HOIST
      ?auto_23636 - SURFACE
      ?auto_23645 - PLACE
      ?auto_23640 - HOIST
      ?auto_23633 - SURFACE
      ?auto_23639 - SURFACE
      ?auto_23644 - PLACE
      ?auto_23635 - HOIST
      ?auto_23638 - SURFACE
      ?auto_23646 - TRUCK
      ?auto_23637 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23641 ?auto_23642 ) ( IS-CRATE ?auto_23632 ) ( not ( = ?auto_23631 ?auto_23632 ) ) ( not ( = ?auto_23630 ?auto_23631 ) ) ( not ( = ?auto_23630 ?auto_23632 ) ) ( not ( = ?auto_23634 ?auto_23642 ) ) ( HOIST-AT ?auto_23643 ?auto_23634 ) ( not ( = ?auto_23641 ?auto_23643 ) ) ( AVAILABLE ?auto_23643 ) ( SURFACE-AT ?auto_23632 ?auto_23634 ) ( ON ?auto_23632 ?auto_23636 ) ( CLEAR ?auto_23632 ) ( not ( = ?auto_23631 ?auto_23636 ) ) ( not ( = ?auto_23632 ?auto_23636 ) ) ( not ( = ?auto_23630 ?auto_23636 ) ) ( IS-CRATE ?auto_23631 ) ( not ( = ?auto_23645 ?auto_23642 ) ) ( not ( = ?auto_23634 ?auto_23645 ) ) ( HOIST-AT ?auto_23640 ?auto_23645 ) ( not ( = ?auto_23641 ?auto_23640 ) ) ( not ( = ?auto_23643 ?auto_23640 ) ) ( SURFACE-AT ?auto_23631 ?auto_23645 ) ( ON ?auto_23631 ?auto_23633 ) ( CLEAR ?auto_23631 ) ( not ( = ?auto_23631 ?auto_23633 ) ) ( not ( = ?auto_23632 ?auto_23633 ) ) ( not ( = ?auto_23630 ?auto_23633 ) ) ( not ( = ?auto_23636 ?auto_23633 ) ) ( IS-CRATE ?auto_23630 ) ( not ( = ?auto_23629 ?auto_23630 ) ) ( not ( = ?auto_23631 ?auto_23629 ) ) ( not ( = ?auto_23632 ?auto_23629 ) ) ( not ( = ?auto_23636 ?auto_23629 ) ) ( not ( = ?auto_23633 ?auto_23629 ) ) ( AVAILABLE ?auto_23640 ) ( SURFACE-AT ?auto_23630 ?auto_23645 ) ( ON ?auto_23630 ?auto_23639 ) ( CLEAR ?auto_23630 ) ( not ( = ?auto_23631 ?auto_23639 ) ) ( not ( = ?auto_23632 ?auto_23639 ) ) ( not ( = ?auto_23630 ?auto_23639 ) ) ( not ( = ?auto_23636 ?auto_23639 ) ) ( not ( = ?auto_23633 ?auto_23639 ) ) ( not ( = ?auto_23629 ?auto_23639 ) ) ( IS-CRATE ?auto_23629 ) ( not ( = ?auto_23628 ?auto_23629 ) ) ( not ( = ?auto_23631 ?auto_23628 ) ) ( not ( = ?auto_23632 ?auto_23628 ) ) ( not ( = ?auto_23630 ?auto_23628 ) ) ( not ( = ?auto_23636 ?auto_23628 ) ) ( not ( = ?auto_23633 ?auto_23628 ) ) ( not ( = ?auto_23639 ?auto_23628 ) ) ( not ( = ?auto_23644 ?auto_23642 ) ) ( not ( = ?auto_23634 ?auto_23644 ) ) ( not ( = ?auto_23645 ?auto_23644 ) ) ( HOIST-AT ?auto_23635 ?auto_23644 ) ( not ( = ?auto_23641 ?auto_23635 ) ) ( not ( = ?auto_23643 ?auto_23635 ) ) ( not ( = ?auto_23640 ?auto_23635 ) ) ( AVAILABLE ?auto_23635 ) ( SURFACE-AT ?auto_23629 ?auto_23644 ) ( ON ?auto_23629 ?auto_23638 ) ( CLEAR ?auto_23629 ) ( not ( = ?auto_23631 ?auto_23638 ) ) ( not ( = ?auto_23632 ?auto_23638 ) ) ( not ( = ?auto_23630 ?auto_23638 ) ) ( not ( = ?auto_23636 ?auto_23638 ) ) ( not ( = ?auto_23633 ?auto_23638 ) ) ( not ( = ?auto_23629 ?auto_23638 ) ) ( not ( = ?auto_23639 ?auto_23638 ) ) ( not ( = ?auto_23628 ?auto_23638 ) ) ( TRUCK-AT ?auto_23646 ?auto_23642 ) ( SURFACE-AT ?auto_23637 ?auto_23642 ) ( CLEAR ?auto_23637 ) ( LIFTING ?auto_23641 ?auto_23628 ) ( IS-CRATE ?auto_23628 ) ( not ( = ?auto_23637 ?auto_23628 ) ) ( not ( = ?auto_23631 ?auto_23637 ) ) ( not ( = ?auto_23632 ?auto_23637 ) ) ( not ( = ?auto_23630 ?auto_23637 ) ) ( not ( = ?auto_23636 ?auto_23637 ) ) ( not ( = ?auto_23633 ?auto_23637 ) ) ( not ( = ?auto_23629 ?auto_23637 ) ) ( not ( = ?auto_23639 ?auto_23637 ) ) ( not ( = ?auto_23638 ?auto_23637 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23630 ?auto_23631 ?auto_23632 )
      ( MAKE-4CRATE-VERIFY ?auto_23628 ?auto_23629 ?auto_23630 ?auto_23631 ?auto_23632 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23647 - SURFACE
      ?auto_23648 - SURFACE
      ?auto_23649 - SURFACE
      ?auto_23650 - SURFACE
      ?auto_23651 - SURFACE
      ?auto_23652 - SURFACE
    )
    :vars
    (
      ?auto_23660 - HOIST
      ?auto_23661 - PLACE
      ?auto_23654 - PLACE
      ?auto_23662 - HOIST
      ?auto_23656 - SURFACE
      ?auto_23664 - PLACE
      ?auto_23659 - HOIST
      ?auto_23653 - SURFACE
      ?auto_23658 - SURFACE
      ?auto_23663 - PLACE
      ?auto_23655 - HOIST
      ?auto_23657 - SURFACE
      ?auto_23665 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23660 ?auto_23661 ) ( IS-CRATE ?auto_23652 ) ( not ( = ?auto_23651 ?auto_23652 ) ) ( not ( = ?auto_23650 ?auto_23651 ) ) ( not ( = ?auto_23650 ?auto_23652 ) ) ( not ( = ?auto_23654 ?auto_23661 ) ) ( HOIST-AT ?auto_23662 ?auto_23654 ) ( not ( = ?auto_23660 ?auto_23662 ) ) ( AVAILABLE ?auto_23662 ) ( SURFACE-AT ?auto_23652 ?auto_23654 ) ( ON ?auto_23652 ?auto_23656 ) ( CLEAR ?auto_23652 ) ( not ( = ?auto_23651 ?auto_23656 ) ) ( not ( = ?auto_23652 ?auto_23656 ) ) ( not ( = ?auto_23650 ?auto_23656 ) ) ( IS-CRATE ?auto_23651 ) ( not ( = ?auto_23664 ?auto_23661 ) ) ( not ( = ?auto_23654 ?auto_23664 ) ) ( HOIST-AT ?auto_23659 ?auto_23664 ) ( not ( = ?auto_23660 ?auto_23659 ) ) ( not ( = ?auto_23662 ?auto_23659 ) ) ( SURFACE-AT ?auto_23651 ?auto_23664 ) ( ON ?auto_23651 ?auto_23653 ) ( CLEAR ?auto_23651 ) ( not ( = ?auto_23651 ?auto_23653 ) ) ( not ( = ?auto_23652 ?auto_23653 ) ) ( not ( = ?auto_23650 ?auto_23653 ) ) ( not ( = ?auto_23656 ?auto_23653 ) ) ( IS-CRATE ?auto_23650 ) ( not ( = ?auto_23649 ?auto_23650 ) ) ( not ( = ?auto_23651 ?auto_23649 ) ) ( not ( = ?auto_23652 ?auto_23649 ) ) ( not ( = ?auto_23656 ?auto_23649 ) ) ( not ( = ?auto_23653 ?auto_23649 ) ) ( AVAILABLE ?auto_23659 ) ( SURFACE-AT ?auto_23650 ?auto_23664 ) ( ON ?auto_23650 ?auto_23658 ) ( CLEAR ?auto_23650 ) ( not ( = ?auto_23651 ?auto_23658 ) ) ( not ( = ?auto_23652 ?auto_23658 ) ) ( not ( = ?auto_23650 ?auto_23658 ) ) ( not ( = ?auto_23656 ?auto_23658 ) ) ( not ( = ?auto_23653 ?auto_23658 ) ) ( not ( = ?auto_23649 ?auto_23658 ) ) ( IS-CRATE ?auto_23649 ) ( not ( = ?auto_23648 ?auto_23649 ) ) ( not ( = ?auto_23651 ?auto_23648 ) ) ( not ( = ?auto_23652 ?auto_23648 ) ) ( not ( = ?auto_23650 ?auto_23648 ) ) ( not ( = ?auto_23656 ?auto_23648 ) ) ( not ( = ?auto_23653 ?auto_23648 ) ) ( not ( = ?auto_23658 ?auto_23648 ) ) ( not ( = ?auto_23663 ?auto_23661 ) ) ( not ( = ?auto_23654 ?auto_23663 ) ) ( not ( = ?auto_23664 ?auto_23663 ) ) ( HOIST-AT ?auto_23655 ?auto_23663 ) ( not ( = ?auto_23660 ?auto_23655 ) ) ( not ( = ?auto_23662 ?auto_23655 ) ) ( not ( = ?auto_23659 ?auto_23655 ) ) ( AVAILABLE ?auto_23655 ) ( SURFACE-AT ?auto_23649 ?auto_23663 ) ( ON ?auto_23649 ?auto_23657 ) ( CLEAR ?auto_23649 ) ( not ( = ?auto_23651 ?auto_23657 ) ) ( not ( = ?auto_23652 ?auto_23657 ) ) ( not ( = ?auto_23650 ?auto_23657 ) ) ( not ( = ?auto_23656 ?auto_23657 ) ) ( not ( = ?auto_23653 ?auto_23657 ) ) ( not ( = ?auto_23649 ?auto_23657 ) ) ( not ( = ?auto_23658 ?auto_23657 ) ) ( not ( = ?auto_23648 ?auto_23657 ) ) ( TRUCK-AT ?auto_23665 ?auto_23661 ) ( SURFACE-AT ?auto_23647 ?auto_23661 ) ( CLEAR ?auto_23647 ) ( LIFTING ?auto_23660 ?auto_23648 ) ( IS-CRATE ?auto_23648 ) ( not ( = ?auto_23647 ?auto_23648 ) ) ( not ( = ?auto_23651 ?auto_23647 ) ) ( not ( = ?auto_23652 ?auto_23647 ) ) ( not ( = ?auto_23650 ?auto_23647 ) ) ( not ( = ?auto_23656 ?auto_23647 ) ) ( not ( = ?auto_23653 ?auto_23647 ) ) ( not ( = ?auto_23649 ?auto_23647 ) ) ( not ( = ?auto_23658 ?auto_23647 ) ) ( not ( = ?auto_23657 ?auto_23647 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23650 ?auto_23651 ?auto_23652 )
      ( MAKE-5CRATE-VERIFY ?auto_23647 ?auto_23648 ?auto_23649 ?auto_23650 ?auto_23651 ?auto_23652 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23666 - SURFACE
      ?auto_23667 - SURFACE
    )
    :vars
    (
      ?auto_23677 - HOIST
      ?auto_23679 - PLACE
      ?auto_23678 - SURFACE
      ?auto_23669 - PLACE
      ?auto_23680 - HOIST
      ?auto_23671 - SURFACE
      ?auto_23683 - PLACE
      ?auto_23675 - HOIST
      ?auto_23668 - SURFACE
      ?auto_23682 - SURFACE
      ?auto_23674 - SURFACE
      ?auto_23676 - SURFACE
      ?auto_23681 - PLACE
      ?auto_23670 - HOIST
      ?auto_23673 - SURFACE
      ?auto_23684 - TRUCK
      ?auto_23672 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23677 ?auto_23679 ) ( IS-CRATE ?auto_23667 ) ( not ( = ?auto_23666 ?auto_23667 ) ) ( not ( = ?auto_23678 ?auto_23666 ) ) ( not ( = ?auto_23678 ?auto_23667 ) ) ( not ( = ?auto_23669 ?auto_23679 ) ) ( HOIST-AT ?auto_23680 ?auto_23669 ) ( not ( = ?auto_23677 ?auto_23680 ) ) ( AVAILABLE ?auto_23680 ) ( SURFACE-AT ?auto_23667 ?auto_23669 ) ( ON ?auto_23667 ?auto_23671 ) ( CLEAR ?auto_23667 ) ( not ( = ?auto_23666 ?auto_23671 ) ) ( not ( = ?auto_23667 ?auto_23671 ) ) ( not ( = ?auto_23678 ?auto_23671 ) ) ( IS-CRATE ?auto_23666 ) ( not ( = ?auto_23683 ?auto_23679 ) ) ( not ( = ?auto_23669 ?auto_23683 ) ) ( HOIST-AT ?auto_23675 ?auto_23683 ) ( not ( = ?auto_23677 ?auto_23675 ) ) ( not ( = ?auto_23680 ?auto_23675 ) ) ( SURFACE-AT ?auto_23666 ?auto_23683 ) ( ON ?auto_23666 ?auto_23668 ) ( CLEAR ?auto_23666 ) ( not ( = ?auto_23666 ?auto_23668 ) ) ( not ( = ?auto_23667 ?auto_23668 ) ) ( not ( = ?auto_23678 ?auto_23668 ) ) ( not ( = ?auto_23671 ?auto_23668 ) ) ( IS-CRATE ?auto_23678 ) ( not ( = ?auto_23682 ?auto_23678 ) ) ( not ( = ?auto_23666 ?auto_23682 ) ) ( not ( = ?auto_23667 ?auto_23682 ) ) ( not ( = ?auto_23671 ?auto_23682 ) ) ( not ( = ?auto_23668 ?auto_23682 ) ) ( AVAILABLE ?auto_23675 ) ( SURFACE-AT ?auto_23678 ?auto_23683 ) ( ON ?auto_23678 ?auto_23674 ) ( CLEAR ?auto_23678 ) ( not ( = ?auto_23666 ?auto_23674 ) ) ( not ( = ?auto_23667 ?auto_23674 ) ) ( not ( = ?auto_23678 ?auto_23674 ) ) ( not ( = ?auto_23671 ?auto_23674 ) ) ( not ( = ?auto_23668 ?auto_23674 ) ) ( not ( = ?auto_23682 ?auto_23674 ) ) ( IS-CRATE ?auto_23682 ) ( not ( = ?auto_23676 ?auto_23682 ) ) ( not ( = ?auto_23666 ?auto_23676 ) ) ( not ( = ?auto_23667 ?auto_23676 ) ) ( not ( = ?auto_23678 ?auto_23676 ) ) ( not ( = ?auto_23671 ?auto_23676 ) ) ( not ( = ?auto_23668 ?auto_23676 ) ) ( not ( = ?auto_23674 ?auto_23676 ) ) ( not ( = ?auto_23681 ?auto_23679 ) ) ( not ( = ?auto_23669 ?auto_23681 ) ) ( not ( = ?auto_23683 ?auto_23681 ) ) ( HOIST-AT ?auto_23670 ?auto_23681 ) ( not ( = ?auto_23677 ?auto_23670 ) ) ( not ( = ?auto_23680 ?auto_23670 ) ) ( not ( = ?auto_23675 ?auto_23670 ) ) ( AVAILABLE ?auto_23670 ) ( SURFACE-AT ?auto_23682 ?auto_23681 ) ( ON ?auto_23682 ?auto_23673 ) ( CLEAR ?auto_23682 ) ( not ( = ?auto_23666 ?auto_23673 ) ) ( not ( = ?auto_23667 ?auto_23673 ) ) ( not ( = ?auto_23678 ?auto_23673 ) ) ( not ( = ?auto_23671 ?auto_23673 ) ) ( not ( = ?auto_23668 ?auto_23673 ) ) ( not ( = ?auto_23682 ?auto_23673 ) ) ( not ( = ?auto_23674 ?auto_23673 ) ) ( not ( = ?auto_23676 ?auto_23673 ) ) ( TRUCK-AT ?auto_23684 ?auto_23679 ) ( SURFACE-AT ?auto_23672 ?auto_23679 ) ( CLEAR ?auto_23672 ) ( IS-CRATE ?auto_23676 ) ( not ( = ?auto_23672 ?auto_23676 ) ) ( not ( = ?auto_23666 ?auto_23672 ) ) ( not ( = ?auto_23667 ?auto_23672 ) ) ( not ( = ?auto_23678 ?auto_23672 ) ) ( not ( = ?auto_23671 ?auto_23672 ) ) ( not ( = ?auto_23668 ?auto_23672 ) ) ( not ( = ?auto_23682 ?auto_23672 ) ) ( not ( = ?auto_23674 ?auto_23672 ) ) ( not ( = ?auto_23673 ?auto_23672 ) ) ( AVAILABLE ?auto_23677 ) ( IN ?auto_23676 ?auto_23684 ) )
    :subtasks
    ( ( !UNLOAD ?auto_23677 ?auto_23676 ?auto_23684 ?auto_23679 )
      ( MAKE-2CRATE ?auto_23678 ?auto_23666 ?auto_23667 )
      ( MAKE-1CRATE-VERIFY ?auto_23666 ?auto_23667 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23685 - SURFACE
      ?auto_23686 - SURFACE
      ?auto_23687 - SURFACE
    )
    :vars
    (
      ?auto_23693 - HOIST
      ?auto_23702 - PLACE
      ?auto_23694 - PLACE
      ?auto_23696 - HOIST
      ?auto_23691 - SURFACE
      ?auto_23699 - PLACE
      ?auto_23690 - HOIST
      ?auto_23700 - SURFACE
      ?auto_23695 - SURFACE
      ?auto_23703 - SURFACE
      ?auto_23697 - SURFACE
      ?auto_23689 - PLACE
      ?auto_23701 - HOIST
      ?auto_23688 - SURFACE
      ?auto_23698 - TRUCK
      ?auto_23692 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23693 ?auto_23702 ) ( IS-CRATE ?auto_23687 ) ( not ( = ?auto_23686 ?auto_23687 ) ) ( not ( = ?auto_23685 ?auto_23686 ) ) ( not ( = ?auto_23685 ?auto_23687 ) ) ( not ( = ?auto_23694 ?auto_23702 ) ) ( HOIST-AT ?auto_23696 ?auto_23694 ) ( not ( = ?auto_23693 ?auto_23696 ) ) ( AVAILABLE ?auto_23696 ) ( SURFACE-AT ?auto_23687 ?auto_23694 ) ( ON ?auto_23687 ?auto_23691 ) ( CLEAR ?auto_23687 ) ( not ( = ?auto_23686 ?auto_23691 ) ) ( not ( = ?auto_23687 ?auto_23691 ) ) ( not ( = ?auto_23685 ?auto_23691 ) ) ( IS-CRATE ?auto_23686 ) ( not ( = ?auto_23699 ?auto_23702 ) ) ( not ( = ?auto_23694 ?auto_23699 ) ) ( HOIST-AT ?auto_23690 ?auto_23699 ) ( not ( = ?auto_23693 ?auto_23690 ) ) ( not ( = ?auto_23696 ?auto_23690 ) ) ( SURFACE-AT ?auto_23686 ?auto_23699 ) ( ON ?auto_23686 ?auto_23700 ) ( CLEAR ?auto_23686 ) ( not ( = ?auto_23686 ?auto_23700 ) ) ( not ( = ?auto_23687 ?auto_23700 ) ) ( not ( = ?auto_23685 ?auto_23700 ) ) ( not ( = ?auto_23691 ?auto_23700 ) ) ( IS-CRATE ?auto_23685 ) ( not ( = ?auto_23695 ?auto_23685 ) ) ( not ( = ?auto_23686 ?auto_23695 ) ) ( not ( = ?auto_23687 ?auto_23695 ) ) ( not ( = ?auto_23691 ?auto_23695 ) ) ( not ( = ?auto_23700 ?auto_23695 ) ) ( AVAILABLE ?auto_23690 ) ( SURFACE-AT ?auto_23685 ?auto_23699 ) ( ON ?auto_23685 ?auto_23703 ) ( CLEAR ?auto_23685 ) ( not ( = ?auto_23686 ?auto_23703 ) ) ( not ( = ?auto_23687 ?auto_23703 ) ) ( not ( = ?auto_23685 ?auto_23703 ) ) ( not ( = ?auto_23691 ?auto_23703 ) ) ( not ( = ?auto_23700 ?auto_23703 ) ) ( not ( = ?auto_23695 ?auto_23703 ) ) ( IS-CRATE ?auto_23695 ) ( not ( = ?auto_23697 ?auto_23695 ) ) ( not ( = ?auto_23686 ?auto_23697 ) ) ( not ( = ?auto_23687 ?auto_23697 ) ) ( not ( = ?auto_23685 ?auto_23697 ) ) ( not ( = ?auto_23691 ?auto_23697 ) ) ( not ( = ?auto_23700 ?auto_23697 ) ) ( not ( = ?auto_23703 ?auto_23697 ) ) ( not ( = ?auto_23689 ?auto_23702 ) ) ( not ( = ?auto_23694 ?auto_23689 ) ) ( not ( = ?auto_23699 ?auto_23689 ) ) ( HOIST-AT ?auto_23701 ?auto_23689 ) ( not ( = ?auto_23693 ?auto_23701 ) ) ( not ( = ?auto_23696 ?auto_23701 ) ) ( not ( = ?auto_23690 ?auto_23701 ) ) ( AVAILABLE ?auto_23701 ) ( SURFACE-AT ?auto_23695 ?auto_23689 ) ( ON ?auto_23695 ?auto_23688 ) ( CLEAR ?auto_23695 ) ( not ( = ?auto_23686 ?auto_23688 ) ) ( not ( = ?auto_23687 ?auto_23688 ) ) ( not ( = ?auto_23685 ?auto_23688 ) ) ( not ( = ?auto_23691 ?auto_23688 ) ) ( not ( = ?auto_23700 ?auto_23688 ) ) ( not ( = ?auto_23695 ?auto_23688 ) ) ( not ( = ?auto_23703 ?auto_23688 ) ) ( not ( = ?auto_23697 ?auto_23688 ) ) ( TRUCK-AT ?auto_23698 ?auto_23702 ) ( SURFACE-AT ?auto_23692 ?auto_23702 ) ( CLEAR ?auto_23692 ) ( IS-CRATE ?auto_23697 ) ( not ( = ?auto_23692 ?auto_23697 ) ) ( not ( = ?auto_23686 ?auto_23692 ) ) ( not ( = ?auto_23687 ?auto_23692 ) ) ( not ( = ?auto_23685 ?auto_23692 ) ) ( not ( = ?auto_23691 ?auto_23692 ) ) ( not ( = ?auto_23700 ?auto_23692 ) ) ( not ( = ?auto_23695 ?auto_23692 ) ) ( not ( = ?auto_23703 ?auto_23692 ) ) ( not ( = ?auto_23688 ?auto_23692 ) ) ( AVAILABLE ?auto_23693 ) ( IN ?auto_23697 ?auto_23698 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23686 ?auto_23687 )
      ( MAKE-2CRATE-VERIFY ?auto_23685 ?auto_23686 ?auto_23687 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23704 - SURFACE
      ?auto_23705 - SURFACE
      ?auto_23706 - SURFACE
      ?auto_23707 - SURFACE
    )
    :vars
    (
      ?auto_23715 - HOIST
      ?auto_23719 - PLACE
      ?auto_23711 - PLACE
      ?auto_23710 - HOIST
      ?auto_23717 - SURFACE
      ?auto_23714 - PLACE
      ?auto_23712 - HOIST
      ?auto_23709 - SURFACE
      ?auto_23718 - SURFACE
      ?auto_23716 - SURFACE
      ?auto_23713 - PLACE
      ?auto_23708 - HOIST
      ?auto_23722 - SURFACE
      ?auto_23720 - TRUCK
      ?auto_23721 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23715 ?auto_23719 ) ( IS-CRATE ?auto_23707 ) ( not ( = ?auto_23706 ?auto_23707 ) ) ( not ( = ?auto_23705 ?auto_23706 ) ) ( not ( = ?auto_23705 ?auto_23707 ) ) ( not ( = ?auto_23711 ?auto_23719 ) ) ( HOIST-AT ?auto_23710 ?auto_23711 ) ( not ( = ?auto_23715 ?auto_23710 ) ) ( AVAILABLE ?auto_23710 ) ( SURFACE-AT ?auto_23707 ?auto_23711 ) ( ON ?auto_23707 ?auto_23717 ) ( CLEAR ?auto_23707 ) ( not ( = ?auto_23706 ?auto_23717 ) ) ( not ( = ?auto_23707 ?auto_23717 ) ) ( not ( = ?auto_23705 ?auto_23717 ) ) ( IS-CRATE ?auto_23706 ) ( not ( = ?auto_23714 ?auto_23719 ) ) ( not ( = ?auto_23711 ?auto_23714 ) ) ( HOIST-AT ?auto_23712 ?auto_23714 ) ( not ( = ?auto_23715 ?auto_23712 ) ) ( not ( = ?auto_23710 ?auto_23712 ) ) ( SURFACE-AT ?auto_23706 ?auto_23714 ) ( ON ?auto_23706 ?auto_23709 ) ( CLEAR ?auto_23706 ) ( not ( = ?auto_23706 ?auto_23709 ) ) ( not ( = ?auto_23707 ?auto_23709 ) ) ( not ( = ?auto_23705 ?auto_23709 ) ) ( not ( = ?auto_23717 ?auto_23709 ) ) ( IS-CRATE ?auto_23705 ) ( not ( = ?auto_23704 ?auto_23705 ) ) ( not ( = ?auto_23706 ?auto_23704 ) ) ( not ( = ?auto_23707 ?auto_23704 ) ) ( not ( = ?auto_23717 ?auto_23704 ) ) ( not ( = ?auto_23709 ?auto_23704 ) ) ( AVAILABLE ?auto_23712 ) ( SURFACE-AT ?auto_23705 ?auto_23714 ) ( ON ?auto_23705 ?auto_23718 ) ( CLEAR ?auto_23705 ) ( not ( = ?auto_23706 ?auto_23718 ) ) ( not ( = ?auto_23707 ?auto_23718 ) ) ( not ( = ?auto_23705 ?auto_23718 ) ) ( not ( = ?auto_23717 ?auto_23718 ) ) ( not ( = ?auto_23709 ?auto_23718 ) ) ( not ( = ?auto_23704 ?auto_23718 ) ) ( IS-CRATE ?auto_23704 ) ( not ( = ?auto_23716 ?auto_23704 ) ) ( not ( = ?auto_23706 ?auto_23716 ) ) ( not ( = ?auto_23707 ?auto_23716 ) ) ( not ( = ?auto_23705 ?auto_23716 ) ) ( not ( = ?auto_23717 ?auto_23716 ) ) ( not ( = ?auto_23709 ?auto_23716 ) ) ( not ( = ?auto_23718 ?auto_23716 ) ) ( not ( = ?auto_23713 ?auto_23719 ) ) ( not ( = ?auto_23711 ?auto_23713 ) ) ( not ( = ?auto_23714 ?auto_23713 ) ) ( HOIST-AT ?auto_23708 ?auto_23713 ) ( not ( = ?auto_23715 ?auto_23708 ) ) ( not ( = ?auto_23710 ?auto_23708 ) ) ( not ( = ?auto_23712 ?auto_23708 ) ) ( AVAILABLE ?auto_23708 ) ( SURFACE-AT ?auto_23704 ?auto_23713 ) ( ON ?auto_23704 ?auto_23722 ) ( CLEAR ?auto_23704 ) ( not ( = ?auto_23706 ?auto_23722 ) ) ( not ( = ?auto_23707 ?auto_23722 ) ) ( not ( = ?auto_23705 ?auto_23722 ) ) ( not ( = ?auto_23717 ?auto_23722 ) ) ( not ( = ?auto_23709 ?auto_23722 ) ) ( not ( = ?auto_23704 ?auto_23722 ) ) ( not ( = ?auto_23718 ?auto_23722 ) ) ( not ( = ?auto_23716 ?auto_23722 ) ) ( TRUCK-AT ?auto_23720 ?auto_23719 ) ( SURFACE-AT ?auto_23721 ?auto_23719 ) ( CLEAR ?auto_23721 ) ( IS-CRATE ?auto_23716 ) ( not ( = ?auto_23721 ?auto_23716 ) ) ( not ( = ?auto_23706 ?auto_23721 ) ) ( not ( = ?auto_23707 ?auto_23721 ) ) ( not ( = ?auto_23705 ?auto_23721 ) ) ( not ( = ?auto_23717 ?auto_23721 ) ) ( not ( = ?auto_23709 ?auto_23721 ) ) ( not ( = ?auto_23704 ?auto_23721 ) ) ( not ( = ?auto_23718 ?auto_23721 ) ) ( not ( = ?auto_23722 ?auto_23721 ) ) ( AVAILABLE ?auto_23715 ) ( IN ?auto_23716 ?auto_23720 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23705 ?auto_23706 ?auto_23707 )
      ( MAKE-3CRATE-VERIFY ?auto_23704 ?auto_23705 ?auto_23706 ?auto_23707 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23723 - SURFACE
      ?auto_23724 - SURFACE
      ?auto_23725 - SURFACE
      ?auto_23726 - SURFACE
      ?auto_23727 - SURFACE
    )
    :vars
    (
      ?auto_23735 - HOIST
      ?auto_23738 - PLACE
      ?auto_23731 - PLACE
      ?auto_23730 - HOIST
      ?auto_23736 - SURFACE
      ?auto_23734 - PLACE
      ?auto_23732 - HOIST
      ?auto_23729 - SURFACE
      ?auto_23737 - SURFACE
      ?auto_23733 - PLACE
      ?auto_23728 - HOIST
      ?auto_23741 - SURFACE
      ?auto_23739 - TRUCK
      ?auto_23740 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23735 ?auto_23738 ) ( IS-CRATE ?auto_23727 ) ( not ( = ?auto_23726 ?auto_23727 ) ) ( not ( = ?auto_23725 ?auto_23726 ) ) ( not ( = ?auto_23725 ?auto_23727 ) ) ( not ( = ?auto_23731 ?auto_23738 ) ) ( HOIST-AT ?auto_23730 ?auto_23731 ) ( not ( = ?auto_23735 ?auto_23730 ) ) ( AVAILABLE ?auto_23730 ) ( SURFACE-AT ?auto_23727 ?auto_23731 ) ( ON ?auto_23727 ?auto_23736 ) ( CLEAR ?auto_23727 ) ( not ( = ?auto_23726 ?auto_23736 ) ) ( not ( = ?auto_23727 ?auto_23736 ) ) ( not ( = ?auto_23725 ?auto_23736 ) ) ( IS-CRATE ?auto_23726 ) ( not ( = ?auto_23734 ?auto_23738 ) ) ( not ( = ?auto_23731 ?auto_23734 ) ) ( HOIST-AT ?auto_23732 ?auto_23734 ) ( not ( = ?auto_23735 ?auto_23732 ) ) ( not ( = ?auto_23730 ?auto_23732 ) ) ( SURFACE-AT ?auto_23726 ?auto_23734 ) ( ON ?auto_23726 ?auto_23729 ) ( CLEAR ?auto_23726 ) ( not ( = ?auto_23726 ?auto_23729 ) ) ( not ( = ?auto_23727 ?auto_23729 ) ) ( not ( = ?auto_23725 ?auto_23729 ) ) ( not ( = ?auto_23736 ?auto_23729 ) ) ( IS-CRATE ?auto_23725 ) ( not ( = ?auto_23724 ?auto_23725 ) ) ( not ( = ?auto_23726 ?auto_23724 ) ) ( not ( = ?auto_23727 ?auto_23724 ) ) ( not ( = ?auto_23736 ?auto_23724 ) ) ( not ( = ?auto_23729 ?auto_23724 ) ) ( AVAILABLE ?auto_23732 ) ( SURFACE-AT ?auto_23725 ?auto_23734 ) ( ON ?auto_23725 ?auto_23737 ) ( CLEAR ?auto_23725 ) ( not ( = ?auto_23726 ?auto_23737 ) ) ( not ( = ?auto_23727 ?auto_23737 ) ) ( not ( = ?auto_23725 ?auto_23737 ) ) ( not ( = ?auto_23736 ?auto_23737 ) ) ( not ( = ?auto_23729 ?auto_23737 ) ) ( not ( = ?auto_23724 ?auto_23737 ) ) ( IS-CRATE ?auto_23724 ) ( not ( = ?auto_23723 ?auto_23724 ) ) ( not ( = ?auto_23726 ?auto_23723 ) ) ( not ( = ?auto_23727 ?auto_23723 ) ) ( not ( = ?auto_23725 ?auto_23723 ) ) ( not ( = ?auto_23736 ?auto_23723 ) ) ( not ( = ?auto_23729 ?auto_23723 ) ) ( not ( = ?auto_23737 ?auto_23723 ) ) ( not ( = ?auto_23733 ?auto_23738 ) ) ( not ( = ?auto_23731 ?auto_23733 ) ) ( not ( = ?auto_23734 ?auto_23733 ) ) ( HOIST-AT ?auto_23728 ?auto_23733 ) ( not ( = ?auto_23735 ?auto_23728 ) ) ( not ( = ?auto_23730 ?auto_23728 ) ) ( not ( = ?auto_23732 ?auto_23728 ) ) ( AVAILABLE ?auto_23728 ) ( SURFACE-AT ?auto_23724 ?auto_23733 ) ( ON ?auto_23724 ?auto_23741 ) ( CLEAR ?auto_23724 ) ( not ( = ?auto_23726 ?auto_23741 ) ) ( not ( = ?auto_23727 ?auto_23741 ) ) ( not ( = ?auto_23725 ?auto_23741 ) ) ( not ( = ?auto_23736 ?auto_23741 ) ) ( not ( = ?auto_23729 ?auto_23741 ) ) ( not ( = ?auto_23724 ?auto_23741 ) ) ( not ( = ?auto_23737 ?auto_23741 ) ) ( not ( = ?auto_23723 ?auto_23741 ) ) ( TRUCK-AT ?auto_23739 ?auto_23738 ) ( SURFACE-AT ?auto_23740 ?auto_23738 ) ( CLEAR ?auto_23740 ) ( IS-CRATE ?auto_23723 ) ( not ( = ?auto_23740 ?auto_23723 ) ) ( not ( = ?auto_23726 ?auto_23740 ) ) ( not ( = ?auto_23727 ?auto_23740 ) ) ( not ( = ?auto_23725 ?auto_23740 ) ) ( not ( = ?auto_23736 ?auto_23740 ) ) ( not ( = ?auto_23729 ?auto_23740 ) ) ( not ( = ?auto_23724 ?auto_23740 ) ) ( not ( = ?auto_23737 ?auto_23740 ) ) ( not ( = ?auto_23741 ?auto_23740 ) ) ( AVAILABLE ?auto_23735 ) ( IN ?auto_23723 ?auto_23739 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23725 ?auto_23726 ?auto_23727 )
      ( MAKE-4CRATE-VERIFY ?auto_23723 ?auto_23724 ?auto_23725 ?auto_23726 ?auto_23727 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23742 - SURFACE
      ?auto_23743 - SURFACE
      ?auto_23744 - SURFACE
      ?auto_23745 - SURFACE
      ?auto_23746 - SURFACE
      ?auto_23747 - SURFACE
    )
    :vars
    (
      ?auto_23755 - HOIST
      ?auto_23758 - PLACE
      ?auto_23751 - PLACE
      ?auto_23750 - HOIST
      ?auto_23756 - SURFACE
      ?auto_23754 - PLACE
      ?auto_23752 - HOIST
      ?auto_23749 - SURFACE
      ?auto_23757 - SURFACE
      ?auto_23753 - PLACE
      ?auto_23748 - HOIST
      ?auto_23760 - SURFACE
      ?auto_23759 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23755 ?auto_23758 ) ( IS-CRATE ?auto_23747 ) ( not ( = ?auto_23746 ?auto_23747 ) ) ( not ( = ?auto_23745 ?auto_23746 ) ) ( not ( = ?auto_23745 ?auto_23747 ) ) ( not ( = ?auto_23751 ?auto_23758 ) ) ( HOIST-AT ?auto_23750 ?auto_23751 ) ( not ( = ?auto_23755 ?auto_23750 ) ) ( AVAILABLE ?auto_23750 ) ( SURFACE-AT ?auto_23747 ?auto_23751 ) ( ON ?auto_23747 ?auto_23756 ) ( CLEAR ?auto_23747 ) ( not ( = ?auto_23746 ?auto_23756 ) ) ( not ( = ?auto_23747 ?auto_23756 ) ) ( not ( = ?auto_23745 ?auto_23756 ) ) ( IS-CRATE ?auto_23746 ) ( not ( = ?auto_23754 ?auto_23758 ) ) ( not ( = ?auto_23751 ?auto_23754 ) ) ( HOIST-AT ?auto_23752 ?auto_23754 ) ( not ( = ?auto_23755 ?auto_23752 ) ) ( not ( = ?auto_23750 ?auto_23752 ) ) ( SURFACE-AT ?auto_23746 ?auto_23754 ) ( ON ?auto_23746 ?auto_23749 ) ( CLEAR ?auto_23746 ) ( not ( = ?auto_23746 ?auto_23749 ) ) ( not ( = ?auto_23747 ?auto_23749 ) ) ( not ( = ?auto_23745 ?auto_23749 ) ) ( not ( = ?auto_23756 ?auto_23749 ) ) ( IS-CRATE ?auto_23745 ) ( not ( = ?auto_23744 ?auto_23745 ) ) ( not ( = ?auto_23746 ?auto_23744 ) ) ( not ( = ?auto_23747 ?auto_23744 ) ) ( not ( = ?auto_23756 ?auto_23744 ) ) ( not ( = ?auto_23749 ?auto_23744 ) ) ( AVAILABLE ?auto_23752 ) ( SURFACE-AT ?auto_23745 ?auto_23754 ) ( ON ?auto_23745 ?auto_23757 ) ( CLEAR ?auto_23745 ) ( not ( = ?auto_23746 ?auto_23757 ) ) ( not ( = ?auto_23747 ?auto_23757 ) ) ( not ( = ?auto_23745 ?auto_23757 ) ) ( not ( = ?auto_23756 ?auto_23757 ) ) ( not ( = ?auto_23749 ?auto_23757 ) ) ( not ( = ?auto_23744 ?auto_23757 ) ) ( IS-CRATE ?auto_23744 ) ( not ( = ?auto_23743 ?auto_23744 ) ) ( not ( = ?auto_23746 ?auto_23743 ) ) ( not ( = ?auto_23747 ?auto_23743 ) ) ( not ( = ?auto_23745 ?auto_23743 ) ) ( not ( = ?auto_23756 ?auto_23743 ) ) ( not ( = ?auto_23749 ?auto_23743 ) ) ( not ( = ?auto_23757 ?auto_23743 ) ) ( not ( = ?auto_23753 ?auto_23758 ) ) ( not ( = ?auto_23751 ?auto_23753 ) ) ( not ( = ?auto_23754 ?auto_23753 ) ) ( HOIST-AT ?auto_23748 ?auto_23753 ) ( not ( = ?auto_23755 ?auto_23748 ) ) ( not ( = ?auto_23750 ?auto_23748 ) ) ( not ( = ?auto_23752 ?auto_23748 ) ) ( AVAILABLE ?auto_23748 ) ( SURFACE-AT ?auto_23744 ?auto_23753 ) ( ON ?auto_23744 ?auto_23760 ) ( CLEAR ?auto_23744 ) ( not ( = ?auto_23746 ?auto_23760 ) ) ( not ( = ?auto_23747 ?auto_23760 ) ) ( not ( = ?auto_23745 ?auto_23760 ) ) ( not ( = ?auto_23756 ?auto_23760 ) ) ( not ( = ?auto_23749 ?auto_23760 ) ) ( not ( = ?auto_23744 ?auto_23760 ) ) ( not ( = ?auto_23757 ?auto_23760 ) ) ( not ( = ?auto_23743 ?auto_23760 ) ) ( TRUCK-AT ?auto_23759 ?auto_23758 ) ( SURFACE-AT ?auto_23742 ?auto_23758 ) ( CLEAR ?auto_23742 ) ( IS-CRATE ?auto_23743 ) ( not ( = ?auto_23742 ?auto_23743 ) ) ( not ( = ?auto_23746 ?auto_23742 ) ) ( not ( = ?auto_23747 ?auto_23742 ) ) ( not ( = ?auto_23745 ?auto_23742 ) ) ( not ( = ?auto_23756 ?auto_23742 ) ) ( not ( = ?auto_23749 ?auto_23742 ) ) ( not ( = ?auto_23744 ?auto_23742 ) ) ( not ( = ?auto_23757 ?auto_23742 ) ) ( not ( = ?auto_23760 ?auto_23742 ) ) ( AVAILABLE ?auto_23755 ) ( IN ?auto_23743 ?auto_23759 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23745 ?auto_23746 ?auto_23747 )
      ( MAKE-5CRATE-VERIFY ?auto_23742 ?auto_23743 ?auto_23744 ?auto_23745 ?auto_23746 ?auto_23747 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23761 - SURFACE
      ?auto_23762 - SURFACE
    )
    :vars
    (
      ?auto_23770 - HOIST
      ?auto_23776 - PLACE
      ?auto_23774 - SURFACE
      ?auto_23766 - PLACE
      ?auto_23765 - HOIST
      ?auto_23772 - SURFACE
      ?auto_23769 - PLACE
      ?auto_23767 - HOIST
      ?auto_23764 - SURFACE
      ?auto_23773 - SURFACE
      ?auto_23775 - SURFACE
      ?auto_23771 - SURFACE
      ?auto_23768 - PLACE
      ?auto_23763 - HOIST
      ?auto_23779 - SURFACE
      ?auto_23778 - SURFACE
      ?auto_23777 - TRUCK
      ?auto_23780 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23770 ?auto_23776 ) ( IS-CRATE ?auto_23762 ) ( not ( = ?auto_23761 ?auto_23762 ) ) ( not ( = ?auto_23774 ?auto_23761 ) ) ( not ( = ?auto_23774 ?auto_23762 ) ) ( not ( = ?auto_23766 ?auto_23776 ) ) ( HOIST-AT ?auto_23765 ?auto_23766 ) ( not ( = ?auto_23770 ?auto_23765 ) ) ( AVAILABLE ?auto_23765 ) ( SURFACE-AT ?auto_23762 ?auto_23766 ) ( ON ?auto_23762 ?auto_23772 ) ( CLEAR ?auto_23762 ) ( not ( = ?auto_23761 ?auto_23772 ) ) ( not ( = ?auto_23762 ?auto_23772 ) ) ( not ( = ?auto_23774 ?auto_23772 ) ) ( IS-CRATE ?auto_23761 ) ( not ( = ?auto_23769 ?auto_23776 ) ) ( not ( = ?auto_23766 ?auto_23769 ) ) ( HOIST-AT ?auto_23767 ?auto_23769 ) ( not ( = ?auto_23770 ?auto_23767 ) ) ( not ( = ?auto_23765 ?auto_23767 ) ) ( SURFACE-AT ?auto_23761 ?auto_23769 ) ( ON ?auto_23761 ?auto_23764 ) ( CLEAR ?auto_23761 ) ( not ( = ?auto_23761 ?auto_23764 ) ) ( not ( = ?auto_23762 ?auto_23764 ) ) ( not ( = ?auto_23774 ?auto_23764 ) ) ( not ( = ?auto_23772 ?auto_23764 ) ) ( IS-CRATE ?auto_23774 ) ( not ( = ?auto_23773 ?auto_23774 ) ) ( not ( = ?auto_23761 ?auto_23773 ) ) ( not ( = ?auto_23762 ?auto_23773 ) ) ( not ( = ?auto_23772 ?auto_23773 ) ) ( not ( = ?auto_23764 ?auto_23773 ) ) ( AVAILABLE ?auto_23767 ) ( SURFACE-AT ?auto_23774 ?auto_23769 ) ( ON ?auto_23774 ?auto_23775 ) ( CLEAR ?auto_23774 ) ( not ( = ?auto_23761 ?auto_23775 ) ) ( not ( = ?auto_23762 ?auto_23775 ) ) ( not ( = ?auto_23774 ?auto_23775 ) ) ( not ( = ?auto_23772 ?auto_23775 ) ) ( not ( = ?auto_23764 ?auto_23775 ) ) ( not ( = ?auto_23773 ?auto_23775 ) ) ( IS-CRATE ?auto_23773 ) ( not ( = ?auto_23771 ?auto_23773 ) ) ( not ( = ?auto_23761 ?auto_23771 ) ) ( not ( = ?auto_23762 ?auto_23771 ) ) ( not ( = ?auto_23774 ?auto_23771 ) ) ( not ( = ?auto_23772 ?auto_23771 ) ) ( not ( = ?auto_23764 ?auto_23771 ) ) ( not ( = ?auto_23775 ?auto_23771 ) ) ( not ( = ?auto_23768 ?auto_23776 ) ) ( not ( = ?auto_23766 ?auto_23768 ) ) ( not ( = ?auto_23769 ?auto_23768 ) ) ( HOIST-AT ?auto_23763 ?auto_23768 ) ( not ( = ?auto_23770 ?auto_23763 ) ) ( not ( = ?auto_23765 ?auto_23763 ) ) ( not ( = ?auto_23767 ?auto_23763 ) ) ( AVAILABLE ?auto_23763 ) ( SURFACE-AT ?auto_23773 ?auto_23768 ) ( ON ?auto_23773 ?auto_23779 ) ( CLEAR ?auto_23773 ) ( not ( = ?auto_23761 ?auto_23779 ) ) ( not ( = ?auto_23762 ?auto_23779 ) ) ( not ( = ?auto_23774 ?auto_23779 ) ) ( not ( = ?auto_23772 ?auto_23779 ) ) ( not ( = ?auto_23764 ?auto_23779 ) ) ( not ( = ?auto_23773 ?auto_23779 ) ) ( not ( = ?auto_23775 ?auto_23779 ) ) ( not ( = ?auto_23771 ?auto_23779 ) ) ( SURFACE-AT ?auto_23778 ?auto_23776 ) ( CLEAR ?auto_23778 ) ( IS-CRATE ?auto_23771 ) ( not ( = ?auto_23778 ?auto_23771 ) ) ( not ( = ?auto_23761 ?auto_23778 ) ) ( not ( = ?auto_23762 ?auto_23778 ) ) ( not ( = ?auto_23774 ?auto_23778 ) ) ( not ( = ?auto_23772 ?auto_23778 ) ) ( not ( = ?auto_23764 ?auto_23778 ) ) ( not ( = ?auto_23773 ?auto_23778 ) ) ( not ( = ?auto_23775 ?auto_23778 ) ) ( not ( = ?auto_23779 ?auto_23778 ) ) ( AVAILABLE ?auto_23770 ) ( IN ?auto_23771 ?auto_23777 ) ( TRUCK-AT ?auto_23777 ?auto_23780 ) ( not ( = ?auto_23780 ?auto_23776 ) ) ( not ( = ?auto_23766 ?auto_23780 ) ) ( not ( = ?auto_23769 ?auto_23780 ) ) ( not ( = ?auto_23768 ?auto_23780 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23777 ?auto_23780 ?auto_23776 )
      ( MAKE-2CRATE ?auto_23774 ?auto_23761 ?auto_23762 )
      ( MAKE-1CRATE-VERIFY ?auto_23761 ?auto_23762 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23781 - SURFACE
      ?auto_23782 - SURFACE
      ?auto_23783 - SURFACE
    )
    :vars
    (
      ?auto_23786 - HOIST
      ?auto_23794 - PLACE
      ?auto_23788 - PLACE
      ?auto_23784 - HOIST
      ?auto_23792 - SURFACE
      ?auto_23799 - PLACE
      ?auto_23793 - HOIST
      ?auto_23795 - SURFACE
      ?auto_23791 - SURFACE
      ?auto_23800 - SURFACE
      ?auto_23796 - SURFACE
      ?auto_23790 - PLACE
      ?auto_23798 - HOIST
      ?auto_23797 - SURFACE
      ?auto_23785 - SURFACE
      ?auto_23787 - TRUCK
      ?auto_23789 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23786 ?auto_23794 ) ( IS-CRATE ?auto_23783 ) ( not ( = ?auto_23782 ?auto_23783 ) ) ( not ( = ?auto_23781 ?auto_23782 ) ) ( not ( = ?auto_23781 ?auto_23783 ) ) ( not ( = ?auto_23788 ?auto_23794 ) ) ( HOIST-AT ?auto_23784 ?auto_23788 ) ( not ( = ?auto_23786 ?auto_23784 ) ) ( AVAILABLE ?auto_23784 ) ( SURFACE-AT ?auto_23783 ?auto_23788 ) ( ON ?auto_23783 ?auto_23792 ) ( CLEAR ?auto_23783 ) ( not ( = ?auto_23782 ?auto_23792 ) ) ( not ( = ?auto_23783 ?auto_23792 ) ) ( not ( = ?auto_23781 ?auto_23792 ) ) ( IS-CRATE ?auto_23782 ) ( not ( = ?auto_23799 ?auto_23794 ) ) ( not ( = ?auto_23788 ?auto_23799 ) ) ( HOIST-AT ?auto_23793 ?auto_23799 ) ( not ( = ?auto_23786 ?auto_23793 ) ) ( not ( = ?auto_23784 ?auto_23793 ) ) ( SURFACE-AT ?auto_23782 ?auto_23799 ) ( ON ?auto_23782 ?auto_23795 ) ( CLEAR ?auto_23782 ) ( not ( = ?auto_23782 ?auto_23795 ) ) ( not ( = ?auto_23783 ?auto_23795 ) ) ( not ( = ?auto_23781 ?auto_23795 ) ) ( not ( = ?auto_23792 ?auto_23795 ) ) ( IS-CRATE ?auto_23781 ) ( not ( = ?auto_23791 ?auto_23781 ) ) ( not ( = ?auto_23782 ?auto_23791 ) ) ( not ( = ?auto_23783 ?auto_23791 ) ) ( not ( = ?auto_23792 ?auto_23791 ) ) ( not ( = ?auto_23795 ?auto_23791 ) ) ( AVAILABLE ?auto_23793 ) ( SURFACE-AT ?auto_23781 ?auto_23799 ) ( ON ?auto_23781 ?auto_23800 ) ( CLEAR ?auto_23781 ) ( not ( = ?auto_23782 ?auto_23800 ) ) ( not ( = ?auto_23783 ?auto_23800 ) ) ( not ( = ?auto_23781 ?auto_23800 ) ) ( not ( = ?auto_23792 ?auto_23800 ) ) ( not ( = ?auto_23795 ?auto_23800 ) ) ( not ( = ?auto_23791 ?auto_23800 ) ) ( IS-CRATE ?auto_23791 ) ( not ( = ?auto_23796 ?auto_23791 ) ) ( not ( = ?auto_23782 ?auto_23796 ) ) ( not ( = ?auto_23783 ?auto_23796 ) ) ( not ( = ?auto_23781 ?auto_23796 ) ) ( not ( = ?auto_23792 ?auto_23796 ) ) ( not ( = ?auto_23795 ?auto_23796 ) ) ( not ( = ?auto_23800 ?auto_23796 ) ) ( not ( = ?auto_23790 ?auto_23794 ) ) ( not ( = ?auto_23788 ?auto_23790 ) ) ( not ( = ?auto_23799 ?auto_23790 ) ) ( HOIST-AT ?auto_23798 ?auto_23790 ) ( not ( = ?auto_23786 ?auto_23798 ) ) ( not ( = ?auto_23784 ?auto_23798 ) ) ( not ( = ?auto_23793 ?auto_23798 ) ) ( AVAILABLE ?auto_23798 ) ( SURFACE-AT ?auto_23791 ?auto_23790 ) ( ON ?auto_23791 ?auto_23797 ) ( CLEAR ?auto_23791 ) ( not ( = ?auto_23782 ?auto_23797 ) ) ( not ( = ?auto_23783 ?auto_23797 ) ) ( not ( = ?auto_23781 ?auto_23797 ) ) ( not ( = ?auto_23792 ?auto_23797 ) ) ( not ( = ?auto_23795 ?auto_23797 ) ) ( not ( = ?auto_23791 ?auto_23797 ) ) ( not ( = ?auto_23800 ?auto_23797 ) ) ( not ( = ?auto_23796 ?auto_23797 ) ) ( SURFACE-AT ?auto_23785 ?auto_23794 ) ( CLEAR ?auto_23785 ) ( IS-CRATE ?auto_23796 ) ( not ( = ?auto_23785 ?auto_23796 ) ) ( not ( = ?auto_23782 ?auto_23785 ) ) ( not ( = ?auto_23783 ?auto_23785 ) ) ( not ( = ?auto_23781 ?auto_23785 ) ) ( not ( = ?auto_23792 ?auto_23785 ) ) ( not ( = ?auto_23795 ?auto_23785 ) ) ( not ( = ?auto_23791 ?auto_23785 ) ) ( not ( = ?auto_23800 ?auto_23785 ) ) ( not ( = ?auto_23797 ?auto_23785 ) ) ( AVAILABLE ?auto_23786 ) ( IN ?auto_23796 ?auto_23787 ) ( TRUCK-AT ?auto_23787 ?auto_23789 ) ( not ( = ?auto_23789 ?auto_23794 ) ) ( not ( = ?auto_23788 ?auto_23789 ) ) ( not ( = ?auto_23799 ?auto_23789 ) ) ( not ( = ?auto_23790 ?auto_23789 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23782 ?auto_23783 )
      ( MAKE-2CRATE-VERIFY ?auto_23781 ?auto_23782 ?auto_23783 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23801 - SURFACE
      ?auto_23802 - SURFACE
      ?auto_23803 - SURFACE
      ?auto_23804 - SURFACE
    )
    :vars
    (
      ?auto_23815 - HOIST
      ?auto_23808 - PLACE
      ?auto_23805 - PLACE
      ?auto_23809 - HOIST
      ?auto_23820 - SURFACE
      ?auto_23813 - PLACE
      ?auto_23816 - HOIST
      ?auto_23806 - SURFACE
      ?auto_23818 - SURFACE
      ?auto_23819 - SURFACE
      ?auto_23811 - PLACE
      ?auto_23814 - HOIST
      ?auto_23807 - SURFACE
      ?auto_23812 - SURFACE
      ?auto_23810 - TRUCK
      ?auto_23817 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23815 ?auto_23808 ) ( IS-CRATE ?auto_23804 ) ( not ( = ?auto_23803 ?auto_23804 ) ) ( not ( = ?auto_23802 ?auto_23803 ) ) ( not ( = ?auto_23802 ?auto_23804 ) ) ( not ( = ?auto_23805 ?auto_23808 ) ) ( HOIST-AT ?auto_23809 ?auto_23805 ) ( not ( = ?auto_23815 ?auto_23809 ) ) ( AVAILABLE ?auto_23809 ) ( SURFACE-AT ?auto_23804 ?auto_23805 ) ( ON ?auto_23804 ?auto_23820 ) ( CLEAR ?auto_23804 ) ( not ( = ?auto_23803 ?auto_23820 ) ) ( not ( = ?auto_23804 ?auto_23820 ) ) ( not ( = ?auto_23802 ?auto_23820 ) ) ( IS-CRATE ?auto_23803 ) ( not ( = ?auto_23813 ?auto_23808 ) ) ( not ( = ?auto_23805 ?auto_23813 ) ) ( HOIST-AT ?auto_23816 ?auto_23813 ) ( not ( = ?auto_23815 ?auto_23816 ) ) ( not ( = ?auto_23809 ?auto_23816 ) ) ( SURFACE-AT ?auto_23803 ?auto_23813 ) ( ON ?auto_23803 ?auto_23806 ) ( CLEAR ?auto_23803 ) ( not ( = ?auto_23803 ?auto_23806 ) ) ( not ( = ?auto_23804 ?auto_23806 ) ) ( not ( = ?auto_23802 ?auto_23806 ) ) ( not ( = ?auto_23820 ?auto_23806 ) ) ( IS-CRATE ?auto_23802 ) ( not ( = ?auto_23801 ?auto_23802 ) ) ( not ( = ?auto_23803 ?auto_23801 ) ) ( not ( = ?auto_23804 ?auto_23801 ) ) ( not ( = ?auto_23820 ?auto_23801 ) ) ( not ( = ?auto_23806 ?auto_23801 ) ) ( AVAILABLE ?auto_23816 ) ( SURFACE-AT ?auto_23802 ?auto_23813 ) ( ON ?auto_23802 ?auto_23818 ) ( CLEAR ?auto_23802 ) ( not ( = ?auto_23803 ?auto_23818 ) ) ( not ( = ?auto_23804 ?auto_23818 ) ) ( not ( = ?auto_23802 ?auto_23818 ) ) ( not ( = ?auto_23820 ?auto_23818 ) ) ( not ( = ?auto_23806 ?auto_23818 ) ) ( not ( = ?auto_23801 ?auto_23818 ) ) ( IS-CRATE ?auto_23801 ) ( not ( = ?auto_23819 ?auto_23801 ) ) ( not ( = ?auto_23803 ?auto_23819 ) ) ( not ( = ?auto_23804 ?auto_23819 ) ) ( not ( = ?auto_23802 ?auto_23819 ) ) ( not ( = ?auto_23820 ?auto_23819 ) ) ( not ( = ?auto_23806 ?auto_23819 ) ) ( not ( = ?auto_23818 ?auto_23819 ) ) ( not ( = ?auto_23811 ?auto_23808 ) ) ( not ( = ?auto_23805 ?auto_23811 ) ) ( not ( = ?auto_23813 ?auto_23811 ) ) ( HOIST-AT ?auto_23814 ?auto_23811 ) ( not ( = ?auto_23815 ?auto_23814 ) ) ( not ( = ?auto_23809 ?auto_23814 ) ) ( not ( = ?auto_23816 ?auto_23814 ) ) ( AVAILABLE ?auto_23814 ) ( SURFACE-AT ?auto_23801 ?auto_23811 ) ( ON ?auto_23801 ?auto_23807 ) ( CLEAR ?auto_23801 ) ( not ( = ?auto_23803 ?auto_23807 ) ) ( not ( = ?auto_23804 ?auto_23807 ) ) ( not ( = ?auto_23802 ?auto_23807 ) ) ( not ( = ?auto_23820 ?auto_23807 ) ) ( not ( = ?auto_23806 ?auto_23807 ) ) ( not ( = ?auto_23801 ?auto_23807 ) ) ( not ( = ?auto_23818 ?auto_23807 ) ) ( not ( = ?auto_23819 ?auto_23807 ) ) ( SURFACE-AT ?auto_23812 ?auto_23808 ) ( CLEAR ?auto_23812 ) ( IS-CRATE ?auto_23819 ) ( not ( = ?auto_23812 ?auto_23819 ) ) ( not ( = ?auto_23803 ?auto_23812 ) ) ( not ( = ?auto_23804 ?auto_23812 ) ) ( not ( = ?auto_23802 ?auto_23812 ) ) ( not ( = ?auto_23820 ?auto_23812 ) ) ( not ( = ?auto_23806 ?auto_23812 ) ) ( not ( = ?auto_23801 ?auto_23812 ) ) ( not ( = ?auto_23818 ?auto_23812 ) ) ( not ( = ?auto_23807 ?auto_23812 ) ) ( AVAILABLE ?auto_23815 ) ( IN ?auto_23819 ?auto_23810 ) ( TRUCK-AT ?auto_23810 ?auto_23817 ) ( not ( = ?auto_23817 ?auto_23808 ) ) ( not ( = ?auto_23805 ?auto_23817 ) ) ( not ( = ?auto_23813 ?auto_23817 ) ) ( not ( = ?auto_23811 ?auto_23817 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23802 ?auto_23803 ?auto_23804 )
      ( MAKE-3CRATE-VERIFY ?auto_23801 ?auto_23802 ?auto_23803 ?auto_23804 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23821 - SURFACE
      ?auto_23822 - SURFACE
      ?auto_23823 - SURFACE
      ?auto_23824 - SURFACE
      ?auto_23825 - SURFACE
    )
    :vars
    (
      ?auto_23836 - HOIST
      ?auto_23829 - PLACE
      ?auto_23826 - PLACE
      ?auto_23830 - HOIST
      ?auto_23840 - SURFACE
      ?auto_23834 - PLACE
      ?auto_23837 - HOIST
      ?auto_23827 - SURFACE
      ?auto_23839 - SURFACE
      ?auto_23832 - PLACE
      ?auto_23835 - HOIST
      ?auto_23828 - SURFACE
      ?auto_23833 - SURFACE
      ?auto_23831 - TRUCK
      ?auto_23838 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23836 ?auto_23829 ) ( IS-CRATE ?auto_23825 ) ( not ( = ?auto_23824 ?auto_23825 ) ) ( not ( = ?auto_23823 ?auto_23824 ) ) ( not ( = ?auto_23823 ?auto_23825 ) ) ( not ( = ?auto_23826 ?auto_23829 ) ) ( HOIST-AT ?auto_23830 ?auto_23826 ) ( not ( = ?auto_23836 ?auto_23830 ) ) ( AVAILABLE ?auto_23830 ) ( SURFACE-AT ?auto_23825 ?auto_23826 ) ( ON ?auto_23825 ?auto_23840 ) ( CLEAR ?auto_23825 ) ( not ( = ?auto_23824 ?auto_23840 ) ) ( not ( = ?auto_23825 ?auto_23840 ) ) ( not ( = ?auto_23823 ?auto_23840 ) ) ( IS-CRATE ?auto_23824 ) ( not ( = ?auto_23834 ?auto_23829 ) ) ( not ( = ?auto_23826 ?auto_23834 ) ) ( HOIST-AT ?auto_23837 ?auto_23834 ) ( not ( = ?auto_23836 ?auto_23837 ) ) ( not ( = ?auto_23830 ?auto_23837 ) ) ( SURFACE-AT ?auto_23824 ?auto_23834 ) ( ON ?auto_23824 ?auto_23827 ) ( CLEAR ?auto_23824 ) ( not ( = ?auto_23824 ?auto_23827 ) ) ( not ( = ?auto_23825 ?auto_23827 ) ) ( not ( = ?auto_23823 ?auto_23827 ) ) ( not ( = ?auto_23840 ?auto_23827 ) ) ( IS-CRATE ?auto_23823 ) ( not ( = ?auto_23822 ?auto_23823 ) ) ( not ( = ?auto_23824 ?auto_23822 ) ) ( not ( = ?auto_23825 ?auto_23822 ) ) ( not ( = ?auto_23840 ?auto_23822 ) ) ( not ( = ?auto_23827 ?auto_23822 ) ) ( AVAILABLE ?auto_23837 ) ( SURFACE-AT ?auto_23823 ?auto_23834 ) ( ON ?auto_23823 ?auto_23839 ) ( CLEAR ?auto_23823 ) ( not ( = ?auto_23824 ?auto_23839 ) ) ( not ( = ?auto_23825 ?auto_23839 ) ) ( not ( = ?auto_23823 ?auto_23839 ) ) ( not ( = ?auto_23840 ?auto_23839 ) ) ( not ( = ?auto_23827 ?auto_23839 ) ) ( not ( = ?auto_23822 ?auto_23839 ) ) ( IS-CRATE ?auto_23822 ) ( not ( = ?auto_23821 ?auto_23822 ) ) ( not ( = ?auto_23824 ?auto_23821 ) ) ( not ( = ?auto_23825 ?auto_23821 ) ) ( not ( = ?auto_23823 ?auto_23821 ) ) ( not ( = ?auto_23840 ?auto_23821 ) ) ( not ( = ?auto_23827 ?auto_23821 ) ) ( not ( = ?auto_23839 ?auto_23821 ) ) ( not ( = ?auto_23832 ?auto_23829 ) ) ( not ( = ?auto_23826 ?auto_23832 ) ) ( not ( = ?auto_23834 ?auto_23832 ) ) ( HOIST-AT ?auto_23835 ?auto_23832 ) ( not ( = ?auto_23836 ?auto_23835 ) ) ( not ( = ?auto_23830 ?auto_23835 ) ) ( not ( = ?auto_23837 ?auto_23835 ) ) ( AVAILABLE ?auto_23835 ) ( SURFACE-AT ?auto_23822 ?auto_23832 ) ( ON ?auto_23822 ?auto_23828 ) ( CLEAR ?auto_23822 ) ( not ( = ?auto_23824 ?auto_23828 ) ) ( not ( = ?auto_23825 ?auto_23828 ) ) ( not ( = ?auto_23823 ?auto_23828 ) ) ( not ( = ?auto_23840 ?auto_23828 ) ) ( not ( = ?auto_23827 ?auto_23828 ) ) ( not ( = ?auto_23822 ?auto_23828 ) ) ( not ( = ?auto_23839 ?auto_23828 ) ) ( not ( = ?auto_23821 ?auto_23828 ) ) ( SURFACE-AT ?auto_23833 ?auto_23829 ) ( CLEAR ?auto_23833 ) ( IS-CRATE ?auto_23821 ) ( not ( = ?auto_23833 ?auto_23821 ) ) ( not ( = ?auto_23824 ?auto_23833 ) ) ( not ( = ?auto_23825 ?auto_23833 ) ) ( not ( = ?auto_23823 ?auto_23833 ) ) ( not ( = ?auto_23840 ?auto_23833 ) ) ( not ( = ?auto_23827 ?auto_23833 ) ) ( not ( = ?auto_23822 ?auto_23833 ) ) ( not ( = ?auto_23839 ?auto_23833 ) ) ( not ( = ?auto_23828 ?auto_23833 ) ) ( AVAILABLE ?auto_23836 ) ( IN ?auto_23821 ?auto_23831 ) ( TRUCK-AT ?auto_23831 ?auto_23838 ) ( not ( = ?auto_23838 ?auto_23829 ) ) ( not ( = ?auto_23826 ?auto_23838 ) ) ( not ( = ?auto_23834 ?auto_23838 ) ) ( not ( = ?auto_23832 ?auto_23838 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23823 ?auto_23824 ?auto_23825 )
      ( MAKE-4CRATE-VERIFY ?auto_23821 ?auto_23822 ?auto_23823 ?auto_23824 ?auto_23825 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23841 - SURFACE
      ?auto_23842 - SURFACE
      ?auto_23843 - SURFACE
      ?auto_23844 - SURFACE
      ?auto_23845 - SURFACE
      ?auto_23846 - SURFACE
    )
    :vars
    (
      ?auto_23856 - HOIST
      ?auto_23850 - PLACE
      ?auto_23847 - PLACE
      ?auto_23851 - HOIST
      ?auto_23860 - SURFACE
      ?auto_23854 - PLACE
      ?auto_23857 - HOIST
      ?auto_23848 - SURFACE
      ?auto_23859 - SURFACE
      ?auto_23853 - PLACE
      ?auto_23855 - HOIST
      ?auto_23849 - SURFACE
      ?auto_23852 - TRUCK
      ?auto_23858 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23856 ?auto_23850 ) ( IS-CRATE ?auto_23846 ) ( not ( = ?auto_23845 ?auto_23846 ) ) ( not ( = ?auto_23844 ?auto_23845 ) ) ( not ( = ?auto_23844 ?auto_23846 ) ) ( not ( = ?auto_23847 ?auto_23850 ) ) ( HOIST-AT ?auto_23851 ?auto_23847 ) ( not ( = ?auto_23856 ?auto_23851 ) ) ( AVAILABLE ?auto_23851 ) ( SURFACE-AT ?auto_23846 ?auto_23847 ) ( ON ?auto_23846 ?auto_23860 ) ( CLEAR ?auto_23846 ) ( not ( = ?auto_23845 ?auto_23860 ) ) ( not ( = ?auto_23846 ?auto_23860 ) ) ( not ( = ?auto_23844 ?auto_23860 ) ) ( IS-CRATE ?auto_23845 ) ( not ( = ?auto_23854 ?auto_23850 ) ) ( not ( = ?auto_23847 ?auto_23854 ) ) ( HOIST-AT ?auto_23857 ?auto_23854 ) ( not ( = ?auto_23856 ?auto_23857 ) ) ( not ( = ?auto_23851 ?auto_23857 ) ) ( SURFACE-AT ?auto_23845 ?auto_23854 ) ( ON ?auto_23845 ?auto_23848 ) ( CLEAR ?auto_23845 ) ( not ( = ?auto_23845 ?auto_23848 ) ) ( not ( = ?auto_23846 ?auto_23848 ) ) ( not ( = ?auto_23844 ?auto_23848 ) ) ( not ( = ?auto_23860 ?auto_23848 ) ) ( IS-CRATE ?auto_23844 ) ( not ( = ?auto_23843 ?auto_23844 ) ) ( not ( = ?auto_23845 ?auto_23843 ) ) ( not ( = ?auto_23846 ?auto_23843 ) ) ( not ( = ?auto_23860 ?auto_23843 ) ) ( not ( = ?auto_23848 ?auto_23843 ) ) ( AVAILABLE ?auto_23857 ) ( SURFACE-AT ?auto_23844 ?auto_23854 ) ( ON ?auto_23844 ?auto_23859 ) ( CLEAR ?auto_23844 ) ( not ( = ?auto_23845 ?auto_23859 ) ) ( not ( = ?auto_23846 ?auto_23859 ) ) ( not ( = ?auto_23844 ?auto_23859 ) ) ( not ( = ?auto_23860 ?auto_23859 ) ) ( not ( = ?auto_23848 ?auto_23859 ) ) ( not ( = ?auto_23843 ?auto_23859 ) ) ( IS-CRATE ?auto_23843 ) ( not ( = ?auto_23842 ?auto_23843 ) ) ( not ( = ?auto_23845 ?auto_23842 ) ) ( not ( = ?auto_23846 ?auto_23842 ) ) ( not ( = ?auto_23844 ?auto_23842 ) ) ( not ( = ?auto_23860 ?auto_23842 ) ) ( not ( = ?auto_23848 ?auto_23842 ) ) ( not ( = ?auto_23859 ?auto_23842 ) ) ( not ( = ?auto_23853 ?auto_23850 ) ) ( not ( = ?auto_23847 ?auto_23853 ) ) ( not ( = ?auto_23854 ?auto_23853 ) ) ( HOIST-AT ?auto_23855 ?auto_23853 ) ( not ( = ?auto_23856 ?auto_23855 ) ) ( not ( = ?auto_23851 ?auto_23855 ) ) ( not ( = ?auto_23857 ?auto_23855 ) ) ( AVAILABLE ?auto_23855 ) ( SURFACE-AT ?auto_23843 ?auto_23853 ) ( ON ?auto_23843 ?auto_23849 ) ( CLEAR ?auto_23843 ) ( not ( = ?auto_23845 ?auto_23849 ) ) ( not ( = ?auto_23846 ?auto_23849 ) ) ( not ( = ?auto_23844 ?auto_23849 ) ) ( not ( = ?auto_23860 ?auto_23849 ) ) ( not ( = ?auto_23848 ?auto_23849 ) ) ( not ( = ?auto_23843 ?auto_23849 ) ) ( not ( = ?auto_23859 ?auto_23849 ) ) ( not ( = ?auto_23842 ?auto_23849 ) ) ( SURFACE-AT ?auto_23841 ?auto_23850 ) ( CLEAR ?auto_23841 ) ( IS-CRATE ?auto_23842 ) ( not ( = ?auto_23841 ?auto_23842 ) ) ( not ( = ?auto_23845 ?auto_23841 ) ) ( not ( = ?auto_23846 ?auto_23841 ) ) ( not ( = ?auto_23844 ?auto_23841 ) ) ( not ( = ?auto_23860 ?auto_23841 ) ) ( not ( = ?auto_23848 ?auto_23841 ) ) ( not ( = ?auto_23843 ?auto_23841 ) ) ( not ( = ?auto_23859 ?auto_23841 ) ) ( not ( = ?auto_23849 ?auto_23841 ) ) ( AVAILABLE ?auto_23856 ) ( IN ?auto_23842 ?auto_23852 ) ( TRUCK-AT ?auto_23852 ?auto_23858 ) ( not ( = ?auto_23858 ?auto_23850 ) ) ( not ( = ?auto_23847 ?auto_23858 ) ) ( not ( = ?auto_23854 ?auto_23858 ) ) ( not ( = ?auto_23853 ?auto_23858 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23844 ?auto_23845 ?auto_23846 )
      ( MAKE-5CRATE-VERIFY ?auto_23841 ?auto_23842 ?auto_23843 ?auto_23844 ?auto_23845 ?auto_23846 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23861 - SURFACE
      ?auto_23862 - SURFACE
    )
    :vars
    (
      ?auto_23874 - HOIST
      ?auto_23867 - PLACE
      ?auto_23877 - SURFACE
      ?auto_23863 - PLACE
      ?auto_23868 - HOIST
      ?auto_23880 - SURFACE
      ?auto_23872 - PLACE
      ?auto_23875 - HOIST
      ?auto_23865 - SURFACE
      ?auto_23864 - SURFACE
      ?auto_23878 - SURFACE
      ?auto_23879 - SURFACE
      ?auto_23870 - PLACE
      ?auto_23873 - HOIST
      ?auto_23866 - SURFACE
      ?auto_23871 - SURFACE
      ?auto_23869 - TRUCK
      ?auto_23876 - PLACE
      ?auto_23881 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_23874 ?auto_23867 ) ( IS-CRATE ?auto_23862 ) ( not ( = ?auto_23861 ?auto_23862 ) ) ( not ( = ?auto_23877 ?auto_23861 ) ) ( not ( = ?auto_23877 ?auto_23862 ) ) ( not ( = ?auto_23863 ?auto_23867 ) ) ( HOIST-AT ?auto_23868 ?auto_23863 ) ( not ( = ?auto_23874 ?auto_23868 ) ) ( AVAILABLE ?auto_23868 ) ( SURFACE-AT ?auto_23862 ?auto_23863 ) ( ON ?auto_23862 ?auto_23880 ) ( CLEAR ?auto_23862 ) ( not ( = ?auto_23861 ?auto_23880 ) ) ( not ( = ?auto_23862 ?auto_23880 ) ) ( not ( = ?auto_23877 ?auto_23880 ) ) ( IS-CRATE ?auto_23861 ) ( not ( = ?auto_23872 ?auto_23867 ) ) ( not ( = ?auto_23863 ?auto_23872 ) ) ( HOIST-AT ?auto_23875 ?auto_23872 ) ( not ( = ?auto_23874 ?auto_23875 ) ) ( not ( = ?auto_23868 ?auto_23875 ) ) ( SURFACE-AT ?auto_23861 ?auto_23872 ) ( ON ?auto_23861 ?auto_23865 ) ( CLEAR ?auto_23861 ) ( not ( = ?auto_23861 ?auto_23865 ) ) ( not ( = ?auto_23862 ?auto_23865 ) ) ( not ( = ?auto_23877 ?auto_23865 ) ) ( not ( = ?auto_23880 ?auto_23865 ) ) ( IS-CRATE ?auto_23877 ) ( not ( = ?auto_23864 ?auto_23877 ) ) ( not ( = ?auto_23861 ?auto_23864 ) ) ( not ( = ?auto_23862 ?auto_23864 ) ) ( not ( = ?auto_23880 ?auto_23864 ) ) ( not ( = ?auto_23865 ?auto_23864 ) ) ( AVAILABLE ?auto_23875 ) ( SURFACE-AT ?auto_23877 ?auto_23872 ) ( ON ?auto_23877 ?auto_23878 ) ( CLEAR ?auto_23877 ) ( not ( = ?auto_23861 ?auto_23878 ) ) ( not ( = ?auto_23862 ?auto_23878 ) ) ( not ( = ?auto_23877 ?auto_23878 ) ) ( not ( = ?auto_23880 ?auto_23878 ) ) ( not ( = ?auto_23865 ?auto_23878 ) ) ( not ( = ?auto_23864 ?auto_23878 ) ) ( IS-CRATE ?auto_23864 ) ( not ( = ?auto_23879 ?auto_23864 ) ) ( not ( = ?auto_23861 ?auto_23879 ) ) ( not ( = ?auto_23862 ?auto_23879 ) ) ( not ( = ?auto_23877 ?auto_23879 ) ) ( not ( = ?auto_23880 ?auto_23879 ) ) ( not ( = ?auto_23865 ?auto_23879 ) ) ( not ( = ?auto_23878 ?auto_23879 ) ) ( not ( = ?auto_23870 ?auto_23867 ) ) ( not ( = ?auto_23863 ?auto_23870 ) ) ( not ( = ?auto_23872 ?auto_23870 ) ) ( HOIST-AT ?auto_23873 ?auto_23870 ) ( not ( = ?auto_23874 ?auto_23873 ) ) ( not ( = ?auto_23868 ?auto_23873 ) ) ( not ( = ?auto_23875 ?auto_23873 ) ) ( AVAILABLE ?auto_23873 ) ( SURFACE-AT ?auto_23864 ?auto_23870 ) ( ON ?auto_23864 ?auto_23866 ) ( CLEAR ?auto_23864 ) ( not ( = ?auto_23861 ?auto_23866 ) ) ( not ( = ?auto_23862 ?auto_23866 ) ) ( not ( = ?auto_23877 ?auto_23866 ) ) ( not ( = ?auto_23880 ?auto_23866 ) ) ( not ( = ?auto_23865 ?auto_23866 ) ) ( not ( = ?auto_23864 ?auto_23866 ) ) ( not ( = ?auto_23878 ?auto_23866 ) ) ( not ( = ?auto_23879 ?auto_23866 ) ) ( SURFACE-AT ?auto_23871 ?auto_23867 ) ( CLEAR ?auto_23871 ) ( IS-CRATE ?auto_23879 ) ( not ( = ?auto_23871 ?auto_23879 ) ) ( not ( = ?auto_23861 ?auto_23871 ) ) ( not ( = ?auto_23862 ?auto_23871 ) ) ( not ( = ?auto_23877 ?auto_23871 ) ) ( not ( = ?auto_23880 ?auto_23871 ) ) ( not ( = ?auto_23865 ?auto_23871 ) ) ( not ( = ?auto_23864 ?auto_23871 ) ) ( not ( = ?auto_23878 ?auto_23871 ) ) ( not ( = ?auto_23866 ?auto_23871 ) ) ( AVAILABLE ?auto_23874 ) ( TRUCK-AT ?auto_23869 ?auto_23876 ) ( not ( = ?auto_23876 ?auto_23867 ) ) ( not ( = ?auto_23863 ?auto_23876 ) ) ( not ( = ?auto_23872 ?auto_23876 ) ) ( not ( = ?auto_23870 ?auto_23876 ) ) ( HOIST-AT ?auto_23881 ?auto_23876 ) ( LIFTING ?auto_23881 ?auto_23879 ) ( not ( = ?auto_23874 ?auto_23881 ) ) ( not ( = ?auto_23868 ?auto_23881 ) ) ( not ( = ?auto_23875 ?auto_23881 ) ) ( not ( = ?auto_23873 ?auto_23881 ) ) )
    :subtasks
    ( ( !LOAD ?auto_23881 ?auto_23879 ?auto_23869 ?auto_23876 )
      ( MAKE-2CRATE ?auto_23877 ?auto_23861 ?auto_23862 )
      ( MAKE-1CRATE-VERIFY ?auto_23861 ?auto_23862 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23882 - SURFACE
      ?auto_23883 - SURFACE
      ?auto_23884 - SURFACE
    )
    :vars
    (
      ?auto_23885 - HOIST
      ?auto_23900 - PLACE
      ?auto_23892 - PLACE
      ?auto_23901 - HOIST
      ?auto_23896 - SURFACE
      ?auto_23887 - PLACE
      ?auto_23890 - HOIST
      ?auto_23891 - SURFACE
      ?auto_23895 - SURFACE
      ?auto_23897 - SURFACE
      ?auto_23893 - SURFACE
      ?auto_23894 - PLACE
      ?auto_23888 - HOIST
      ?auto_23889 - SURFACE
      ?auto_23899 - SURFACE
      ?auto_23898 - TRUCK
      ?auto_23886 - PLACE
      ?auto_23902 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_23885 ?auto_23900 ) ( IS-CRATE ?auto_23884 ) ( not ( = ?auto_23883 ?auto_23884 ) ) ( not ( = ?auto_23882 ?auto_23883 ) ) ( not ( = ?auto_23882 ?auto_23884 ) ) ( not ( = ?auto_23892 ?auto_23900 ) ) ( HOIST-AT ?auto_23901 ?auto_23892 ) ( not ( = ?auto_23885 ?auto_23901 ) ) ( AVAILABLE ?auto_23901 ) ( SURFACE-AT ?auto_23884 ?auto_23892 ) ( ON ?auto_23884 ?auto_23896 ) ( CLEAR ?auto_23884 ) ( not ( = ?auto_23883 ?auto_23896 ) ) ( not ( = ?auto_23884 ?auto_23896 ) ) ( not ( = ?auto_23882 ?auto_23896 ) ) ( IS-CRATE ?auto_23883 ) ( not ( = ?auto_23887 ?auto_23900 ) ) ( not ( = ?auto_23892 ?auto_23887 ) ) ( HOIST-AT ?auto_23890 ?auto_23887 ) ( not ( = ?auto_23885 ?auto_23890 ) ) ( not ( = ?auto_23901 ?auto_23890 ) ) ( SURFACE-AT ?auto_23883 ?auto_23887 ) ( ON ?auto_23883 ?auto_23891 ) ( CLEAR ?auto_23883 ) ( not ( = ?auto_23883 ?auto_23891 ) ) ( not ( = ?auto_23884 ?auto_23891 ) ) ( not ( = ?auto_23882 ?auto_23891 ) ) ( not ( = ?auto_23896 ?auto_23891 ) ) ( IS-CRATE ?auto_23882 ) ( not ( = ?auto_23895 ?auto_23882 ) ) ( not ( = ?auto_23883 ?auto_23895 ) ) ( not ( = ?auto_23884 ?auto_23895 ) ) ( not ( = ?auto_23896 ?auto_23895 ) ) ( not ( = ?auto_23891 ?auto_23895 ) ) ( AVAILABLE ?auto_23890 ) ( SURFACE-AT ?auto_23882 ?auto_23887 ) ( ON ?auto_23882 ?auto_23897 ) ( CLEAR ?auto_23882 ) ( not ( = ?auto_23883 ?auto_23897 ) ) ( not ( = ?auto_23884 ?auto_23897 ) ) ( not ( = ?auto_23882 ?auto_23897 ) ) ( not ( = ?auto_23896 ?auto_23897 ) ) ( not ( = ?auto_23891 ?auto_23897 ) ) ( not ( = ?auto_23895 ?auto_23897 ) ) ( IS-CRATE ?auto_23895 ) ( not ( = ?auto_23893 ?auto_23895 ) ) ( not ( = ?auto_23883 ?auto_23893 ) ) ( not ( = ?auto_23884 ?auto_23893 ) ) ( not ( = ?auto_23882 ?auto_23893 ) ) ( not ( = ?auto_23896 ?auto_23893 ) ) ( not ( = ?auto_23891 ?auto_23893 ) ) ( not ( = ?auto_23897 ?auto_23893 ) ) ( not ( = ?auto_23894 ?auto_23900 ) ) ( not ( = ?auto_23892 ?auto_23894 ) ) ( not ( = ?auto_23887 ?auto_23894 ) ) ( HOIST-AT ?auto_23888 ?auto_23894 ) ( not ( = ?auto_23885 ?auto_23888 ) ) ( not ( = ?auto_23901 ?auto_23888 ) ) ( not ( = ?auto_23890 ?auto_23888 ) ) ( AVAILABLE ?auto_23888 ) ( SURFACE-AT ?auto_23895 ?auto_23894 ) ( ON ?auto_23895 ?auto_23889 ) ( CLEAR ?auto_23895 ) ( not ( = ?auto_23883 ?auto_23889 ) ) ( not ( = ?auto_23884 ?auto_23889 ) ) ( not ( = ?auto_23882 ?auto_23889 ) ) ( not ( = ?auto_23896 ?auto_23889 ) ) ( not ( = ?auto_23891 ?auto_23889 ) ) ( not ( = ?auto_23895 ?auto_23889 ) ) ( not ( = ?auto_23897 ?auto_23889 ) ) ( not ( = ?auto_23893 ?auto_23889 ) ) ( SURFACE-AT ?auto_23899 ?auto_23900 ) ( CLEAR ?auto_23899 ) ( IS-CRATE ?auto_23893 ) ( not ( = ?auto_23899 ?auto_23893 ) ) ( not ( = ?auto_23883 ?auto_23899 ) ) ( not ( = ?auto_23884 ?auto_23899 ) ) ( not ( = ?auto_23882 ?auto_23899 ) ) ( not ( = ?auto_23896 ?auto_23899 ) ) ( not ( = ?auto_23891 ?auto_23899 ) ) ( not ( = ?auto_23895 ?auto_23899 ) ) ( not ( = ?auto_23897 ?auto_23899 ) ) ( not ( = ?auto_23889 ?auto_23899 ) ) ( AVAILABLE ?auto_23885 ) ( TRUCK-AT ?auto_23898 ?auto_23886 ) ( not ( = ?auto_23886 ?auto_23900 ) ) ( not ( = ?auto_23892 ?auto_23886 ) ) ( not ( = ?auto_23887 ?auto_23886 ) ) ( not ( = ?auto_23894 ?auto_23886 ) ) ( HOIST-AT ?auto_23902 ?auto_23886 ) ( LIFTING ?auto_23902 ?auto_23893 ) ( not ( = ?auto_23885 ?auto_23902 ) ) ( not ( = ?auto_23901 ?auto_23902 ) ) ( not ( = ?auto_23890 ?auto_23902 ) ) ( not ( = ?auto_23888 ?auto_23902 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23883 ?auto_23884 )
      ( MAKE-2CRATE-VERIFY ?auto_23882 ?auto_23883 ?auto_23884 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23903 - SURFACE
      ?auto_23904 - SURFACE
      ?auto_23905 - SURFACE
      ?auto_23906 - SURFACE
    )
    :vars
    (
      ?auto_23922 - HOIST
      ?auto_23921 - PLACE
      ?auto_23916 - PLACE
      ?auto_23911 - HOIST
      ?auto_23910 - SURFACE
      ?auto_23918 - PLACE
      ?auto_23907 - HOIST
      ?auto_23914 - SURFACE
      ?auto_23913 - SURFACE
      ?auto_23908 - SURFACE
      ?auto_23920 - PLACE
      ?auto_23909 - HOIST
      ?auto_23915 - SURFACE
      ?auto_23923 - SURFACE
      ?auto_23917 - TRUCK
      ?auto_23919 - PLACE
      ?auto_23912 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_23922 ?auto_23921 ) ( IS-CRATE ?auto_23906 ) ( not ( = ?auto_23905 ?auto_23906 ) ) ( not ( = ?auto_23904 ?auto_23905 ) ) ( not ( = ?auto_23904 ?auto_23906 ) ) ( not ( = ?auto_23916 ?auto_23921 ) ) ( HOIST-AT ?auto_23911 ?auto_23916 ) ( not ( = ?auto_23922 ?auto_23911 ) ) ( AVAILABLE ?auto_23911 ) ( SURFACE-AT ?auto_23906 ?auto_23916 ) ( ON ?auto_23906 ?auto_23910 ) ( CLEAR ?auto_23906 ) ( not ( = ?auto_23905 ?auto_23910 ) ) ( not ( = ?auto_23906 ?auto_23910 ) ) ( not ( = ?auto_23904 ?auto_23910 ) ) ( IS-CRATE ?auto_23905 ) ( not ( = ?auto_23918 ?auto_23921 ) ) ( not ( = ?auto_23916 ?auto_23918 ) ) ( HOIST-AT ?auto_23907 ?auto_23918 ) ( not ( = ?auto_23922 ?auto_23907 ) ) ( not ( = ?auto_23911 ?auto_23907 ) ) ( SURFACE-AT ?auto_23905 ?auto_23918 ) ( ON ?auto_23905 ?auto_23914 ) ( CLEAR ?auto_23905 ) ( not ( = ?auto_23905 ?auto_23914 ) ) ( not ( = ?auto_23906 ?auto_23914 ) ) ( not ( = ?auto_23904 ?auto_23914 ) ) ( not ( = ?auto_23910 ?auto_23914 ) ) ( IS-CRATE ?auto_23904 ) ( not ( = ?auto_23903 ?auto_23904 ) ) ( not ( = ?auto_23905 ?auto_23903 ) ) ( not ( = ?auto_23906 ?auto_23903 ) ) ( not ( = ?auto_23910 ?auto_23903 ) ) ( not ( = ?auto_23914 ?auto_23903 ) ) ( AVAILABLE ?auto_23907 ) ( SURFACE-AT ?auto_23904 ?auto_23918 ) ( ON ?auto_23904 ?auto_23913 ) ( CLEAR ?auto_23904 ) ( not ( = ?auto_23905 ?auto_23913 ) ) ( not ( = ?auto_23906 ?auto_23913 ) ) ( not ( = ?auto_23904 ?auto_23913 ) ) ( not ( = ?auto_23910 ?auto_23913 ) ) ( not ( = ?auto_23914 ?auto_23913 ) ) ( not ( = ?auto_23903 ?auto_23913 ) ) ( IS-CRATE ?auto_23903 ) ( not ( = ?auto_23908 ?auto_23903 ) ) ( not ( = ?auto_23905 ?auto_23908 ) ) ( not ( = ?auto_23906 ?auto_23908 ) ) ( not ( = ?auto_23904 ?auto_23908 ) ) ( not ( = ?auto_23910 ?auto_23908 ) ) ( not ( = ?auto_23914 ?auto_23908 ) ) ( not ( = ?auto_23913 ?auto_23908 ) ) ( not ( = ?auto_23920 ?auto_23921 ) ) ( not ( = ?auto_23916 ?auto_23920 ) ) ( not ( = ?auto_23918 ?auto_23920 ) ) ( HOIST-AT ?auto_23909 ?auto_23920 ) ( not ( = ?auto_23922 ?auto_23909 ) ) ( not ( = ?auto_23911 ?auto_23909 ) ) ( not ( = ?auto_23907 ?auto_23909 ) ) ( AVAILABLE ?auto_23909 ) ( SURFACE-AT ?auto_23903 ?auto_23920 ) ( ON ?auto_23903 ?auto_23915 ) ( CLEAR ?auto_23903 ) ( not ( = ?auto_23905 ?auto_23915 ) ) ( not ( = ?auto_23906 ?auto_23915 ) ) ( not ( = ?auto_23904 ?auto_23915 ) ) ( not ( = ?auto_23910 ?auto_23915 ) ) ( not ( = ?auto_23914 ?auto_23915 ) ) ( not ( = ?auto_23903 ?auto_23915 ) ) ( not ( = ?auto_23913 ?auto_23915 ) ) ( not ( = ?auto_23908 ?auto_23915 ) ) ( SURFACE-AT ?auto_23923 ?auto_23921 ) ( CLEAR ?auto_23923 ) ( IS-CRATE ?auto_23908 ) ( not ( = ?auto_23923 ?auto_23908 ) ) ( not ( = ?auto_23905 ?auto_23923 ) ) ( not ( = ?auto_23906 ?auto_23923 ) ) ( not ( = ?auto_23904 ?auto_23923 ) ) ( not ( = ?auto_23910 ?auto_23923 ) ) ( not ( = ?auto_23914 ?auto_23923 ) ) ( not ( = ?auto_23903 ?auto_23923 ) ) ( not ( = ?auto_23913 ?auto_23923 ) ) ( not ( = ?auto_23915 ?auto_23923 ) ) ( AVAILABLE ?auto_23922 ) ( TRUCK-AT ?auto_23917 ?auto_23919 ) ( not ( = ?auto_23919 ?auto_23921 ) ) ( not ( = ?auto_23916 ?auto_23919 ) ) ( not ( = ?auto_23918 ?auto_23919 ) ) ( not ( = ?auto_23920 ?auto_23919 ) ) ( HOIST-AT ?auto_23912 ?auto_23919 ) ( LIFTING ?auto_23912 ?auto_23908 ) ( not ( = ?auto_23922 ?auto_23912 ) ) ( not ( = ?auto_23911 ?auto_23912 ) ) ( not ( = ?auto_23907 ?auto_23912 ) ) ( not ( = ?auto_23909 ?auto_23912 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23904 ?auto_23905 ?auto_23906 )
      ( MAKE-3CRATE-VERIFY ?auto_23903 ?auto_23904 ?auto_23905 ?auto_23906 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23924 - SURFACE
      ?auto_23925 - SURFACE
      ?auto_23926 - SURFACE
      ?auto_23927 - SURFACE
      ?auto_23928 - SURFACE
    )
    :vars
    (
      ?auto_23943 - HOIST
      ?auto_23942 - PLACE
      ?auto_23937 - PLACE
      ?auto_23932 - HOIST
      ?auto_23931 - SURFACE
      ?auto_23939 - PLACE
      ?auto_23929 - HOIST
      ?auto_23935 - SURFACE
      ?auto_23934 - SURFACE
      ?auto_23941 - PLACE
      ?auto_23930 - HOIST
      ?auto_23936 - SURFACE
      ?auto_23944 - SURFACE
      ?auto_23938 - TRUCK
      ?auto_23940 - PLACE
      ?auto_23933 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_23943 ?auto_23942 ) ( IS-CRATE ?auto_23928 ) ( not ( = ?auto_23927 ?auto_23928 ) ) ( not ( = ?auto_23926 ?auto_23927 ) ) ( not ( = ?auto_23926 ?auto_23928 ) ) ( not ( = ?auto_23937 ?auto_23942 ) ) ( HOIST-AT ?auto_23932 ?auto_23937 ) ( not ( = ?auto_23943 ?auto_23932 ) ) ( AVAILABLE ?auto_23932 ) ( SURFACE-AT ?auto_23928 ?auto_23937 ) ( ON ?auto_23928 ?auto_23931 ) ( CLEAR ?auto_23928 ) ( not ( = ?auto_23927 ?auto_23931 ) ) ( not ( = ?auto_23928 ?auto_23931 ) ) ( not ( = ?auto_23926 ?auto_23931 ) ) ( IS-CRATE ?auto_23927 ) ( not ( = ?auto_23939 ?auto_23942 ) ) ( not ( = ?auto_23937 ?auto_23939 ) ) ( HOIST-AT ?auto_23929 ?auto_23939 ) ( not ( = ?auto_23943 ?auto_23929 ) ) ( not ( = ?auto_23932 ?auto_23929 ) ) ( SURFACE-AT ?auto_23927 ?auto_23939 ) ( ON ?auto_23927 ?auto_23935 ) ( CLEAR ?auto_23927 ) ( not ( = ?auto_23927 ?auto_23935 ) ) ( not ( = ?auto_23928 ?auto_23935 ) ) ( not ( = ?auto_23926 ?auto_23935 ) ) ( not ( = ?auto_23931 ?auto_23935 ) ) ( IS-CRATE ?auto_23926 ) ( not ( = ?auto_23925 ?auto_23926 ) ) ( not ( = ?auto_23927 ?auto_23925 ) ) ( not ( = ?auto_23928 ?auto_23925 ) ) ( not ( = ?auto_23931 ?auto_23925 ) ) ( not ( = ?auto_23935 ?auto_23925 ) ) ( AVAILABLE ?auto_23929 ) ( SURFACE-AT ?auto_23926 ?auto_23939 ) ( ON ?auto_23926 ?auto_23934 ) ( CLEAR ?auto_23926 ) ( not ( = ?auto_23927 ?auto_23934 ) ) ( not ( = ?auto_23928 ?auto_23934 ) ) ( not ( = ?auto_23926 ?auto_23934 ) ) ( not ( = ?auto_23931 ?auto_23934 ) ) ( not ( = ?auto_23935 ?auto_23934 ) ) ( not ( = ?auto_23925 ?auto_23934 ) ) ( IS-CRATE ?auto_23925 ) ( not ( = ?auto_23924 ?auto_23925 ) ) ( not ( = ?auto_23927 ?auto_23924 ) ) ( not ( = ?auto_23928 ?auto_23924 ) ) ( not ( = ?auto_23926 ?auto_23924 ) ) ( not ( = ?auto_23931 ?auto_23924 ) ) ( not ( = ?auto_23935 ?auto_23924 ) ) ( not ( = ?auto_23934 ?auto_23924 ) ) ( not ( = ?auto_23941 ?auto_23942 ) ) ( not ( = ?auto_23937 ?auto_23941 ) ) ( not ( = ?auto_23939 ?auto_23941 ) ) ( HOIST-AT ?auto_23930 ?auto_23941 ) ( not ( = ?auto_23943 ?auto_23930 ) ) ( not ( = ?auto_23932 ?auto_23930 ) ) ( not ( = ?auto_23929 ?auto_23930 ) ) ( AVAILABLE ?auto_23930 ) ( SURFACE-AT ?auto_23925 ?auto_23941 ) ( ON ?auto_23925 ?auto_23936 ) ( CLEAR ?auto_23925 ) ( not ( = ?auto_23927 ?auto_23936 ) ) ( not ( = ?auto_23928 ?auto_23936 ) ) ( not ( = ?auto_23926 ?auto_23936 ) ) ( not ( = ?auto_23931 ?auto_23936 ) ) ( not ( = ?auto_23935 ?auto_23936 ) ) ( not ( = ?auto_23925 ?auto_23936 ) ) ( not ( = ?auto_23934 ?auto_23936 ) ) ( not ( = ?auto_23924 ?auto_23936 ) ) ( SURFACE-AT ?auto_23944 ?auto_23942 ) ( CLEAR ?auto_23944 ) ( IS-CRATE ?auto_23924 ) ( not ( = ?auto_23944 ?auto_23924 ) ) ( not ( = ?auto_23927 ?auto_23944 ) ) ( not ( = ?auto_23928 ?auto_23944 ) ) ( not ( = ?auto_23926 ?auto_23944 ) ) ( not ( = ?auto_23931 ?auto_23944 ) ) ( not ( = ?auto_23935 ?auto_23944 ) ) ( not ( = ?auto_23925 ?auto_23944 ) ) ( not ( = ?auto_23934 ?auto_23944 ) ) ( not ( = ?auto_23936 ?auto_23944 ) ) ( AVAILABLE ?auto_23943 ) ( TRUCK-AT ?auto_23938 ?auto_23940 ) ( not ( = ?auto_23940 ?auto_23942 ) ) ( not ( = ?auto_23937 ?auto_23940 ) ) ( not ( = ?auto_23939 ?auto_23940 ) ) ( not ( = ?auto_23941 ?auto_23940 ) ) ( HOIST-AT ?auto_23933 ?auto_23940 ) ( LIFTING ?auto_23933 ?auto_23924 ) ( not ( = ?auto_23943 ?auto_23933 ) ) ( not ( = ?auto_23932 ?auto_23933 ) ) ( not ( = ?auto_23929 ?auto_23933 ) ) ( not ( = ?auto_23930 ?auto_23933 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23926 ?auto_23927 ?auto_23928 )
      ( MAKE-4CRATE-VERIFY ?auto_23924 ?auto_23925 ?auto_23926 ?auto_23927 ?auto_23928 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23945 - SURFACE
      ?auto_23946 - SURFACE
      ?auto_23947 - SURFACE
      ?auto_23948 - SURFACE
      ?auto_23949 - SURFACE
      ?auto_23950 - SURFACE
    )
    :vars
    (
      ?auto_23965 - HOIST
      ?auto_23964 - PLACE
      ?auto_23959 - PLACE
      ?auto_23954 - HOIST
      ?auto_23953 - SURFACE
      ?auto_23961 - PLACE
      ?auto_23951 - HOIST
      ?auto_23957 - SURFACE
      ?auto_23956 - SURFACE
      ?auto_23963 - PLACE
      ?auto_23952 - HOIST
      ?auto_23958 - SURFACE
      ?auto_23960 - TRUCK
      ?auto_23962 - PLACE
      ?auto_23955 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_23965 ?auto_23964 ) ( IS-CRATE ?auto_23950 ) ( not ( = ?auto_23949 ?auto_23950 ) ) ( not ( = ?auto_23948 ?auto_23949 ) ) ( not ( = ?auto_23948 ?auto_23950 ) ) ( not ( = ?auto_23959 ?auto_23964 ) ) ( HOIST-AT ?auto_23954 ?auto_23959 ) ( not ( = ?auto_23965 ?auto_23954 ) ) ( AVAILABLE ?auto_23954 ) ( SURFACE-AT ?auto_23950 ?auto_23959 ) ( ON ?auto_23950 ?auto_23953 ) ( CLEAR ?auto_23950 ) ( not ( = ?auto_23949 ?auto_23953 ) ) ( not ( = ?auto_23950 ?auto_23953 ) ) ( not ( = ?auto_23948 ?auto_23953 ) ) ( IS-CRATE ?auto_23949 ) ( not ( = ?auto_23961 ?auto_23964 ) ) ( not ( = ?auto_23959 ?auto_23961 ) ) ( HOIST-AT ?auto_23951 ?auto_23961 ) ( not ( = ?auto_23965 ?auto_23951 ) ) ( not ( = ?auto_23954 ?auto_23951 ) ) ( SURFACE-AT ?auto_23949 ?auto_23961 ) ( ON ?auto_23949 ?auto_23957 ) ( CLEAR ?auto_23949 ) ( not ( = ?auto_23949 ?auto_23957 ) ) ( not ( = ?auto_23950 ?auto_23957 ) ) ( not ( = ?auto_23948 ?auto_23957 ) ) ( not ( = ?auto_23953 ?auto_23957 ) ) ( IS-CRATE ?auto_23948 ) ( not ( = ?auto_23947 ?auto_23948 ) ) ( not ( = ?auto_23949 ?auto_23947 ) ) ( not ( = ?auto_23950 ?auto_23947 ) ) ( not ( = ?auto_23953 ?auto_23947 ) ) ( not ( = ?auto_23957 ?auto_23947 ) ) ( AVAILABLE ?auto_23951 ) ( SURFACE-AT ?auto_23948 ?auto_23961 ) ( ON ?auto_23948 ?auto_23956 ) ( CLEAR ?auto_23948 ) ( not ( = ?auto_23949 ?auto_23956 ) ) ( not ( = ?auto_23950 ?auto_23956 ) ) ( not ( = ?auto_23948 ?auto_23956 ) ) ( not ( = ?auto_23953 ?auto_23956 ) ) ( not ( = ?auto_23957 ?auto_23956 ) ) ( not ( = ?auto_23947 ?auto_23956 ) ) ( IS-CRATE ?auto_23947 ) ( not ( = ?auto_23946 ?auto_23947 ) ) ( not ( = ?auto_23949 ?auto_23946 ) ) ( not ( = ?auto_23950 ?auto_23946 ) ) ( not ( = ?auto_23948 ?auto_23946 ) ) ( not ( = ?auto_23953 ?auto_23946 ) ) ( not ( = ?auto_23957 ?auto_23946 ) ) ( not ( = ?auto_23956 ?auto_23946 ) ) ( not ( = ?auto_23963 ?auto_23964 ) ) ( not ( = ?auto_23959 ?auto_23963 ) ) ( not ( = ?auto_23961 ?auto_23963 ) ) ( HOIST-AT ?auto_23952 ?auto_23963 ) ( not ( = ?auto_23965 ?auto_23952 ) ) ( not ( = ?auto_23954 ?auto_23952 ) ) ( not ( = ?auto_23951 ?auto_23952 ) ) ( AVAILABLE ?auto_23952 ) ( SURFACE-AT ?auto_23947 ?auto_23963 ) ( ON ?auto_23947 ?auto_23958 ) ( CLEAR ?auto_23947 ) ( not ( = ?auto_23949 ?auto_23958 ) ) ( not ( = ?auto_23950 ?auto_23958 ) ) ( not ( = ?auto_23948 ?auto_23958 ) ) ( not ( = ?auto_23953 ?auto_23958 ) ) ( not ( = ?auto_23957 ?auto_23958 ) ) ( not ( = ?auto_23947 ?auto_23958 ) ) ( not ( = ?auto_23956 ?auto_23958 ) ) ( not ( = ?auto_23946 ?auto_23958 ) ) ( SURFACE-AT ?auto_23945 ?auto_23964 ) ( CLEAR ?auto_23945 ) ( IS-CRATE ?auto_23946 ) ( not ( = ?auto_23945 ?auto_23946 ) ) ( not ( = ?auto_23949 ?auto_23945 ) ) ( not ( = ?auto_23950 ?auto_23945 ) ) ( not ( = ?auto_23948 ?auto_23945 ) ) ( not ( = ?auto_23953 ?auto_23945 ) ) ( not ( = ?auto_23957 ?auto_23945 ) ) ( not ( = ?auto_23947 ?auto_23945 ) ) ( not ( = ?auto_23956 ?auto_23945 ) ) ( not ( = ?auto_23958 ?auto_23945 ) ) ( AVAILABLE ?auto_23965 ) ( TRUCK-AT ?auto_23960 ?auto_23962 ) ( not ( = ?auto_23962 ?auto_23964 ) ) ( not ( = ?auto_23959 ?auto_23962 ) ) ( not ( = ?auto_23961 ?auto_23962 ) ) ( not ( = ?auto_23963 ?auto_23962 ) ) ( HOIST-AT ?auto_23955 ?auto_23962 ) ( LIFTING ?auto_23955 ?auto_23946 ) ( not ( = ?auto_23965 ?auto_23955 ) ) ( not ( = ?auto_23954 ?auto_23955 ) ) ( not ( = ?auto_23951 ?auto_23955 ) ) ( not ( = ?auto_23952 ?auto_23955 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23948 ?auto_23949 ?auto_23950 )
      ( MAKE-5CRATE-VERIFY ?auto_23945 ?auto_23946 ?auto_23947 ?auto_23948 ?auto_23949 ?auto_23950 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23966 - SURFACE
      ?auto_23967 - SURFACE
    )
    :vars
    (
      ?auto_23985 - HOIST
      ?auto_23984 - PLACE
      ?auto_23976 - SURFACE
      ?auto_23979 - PLACE
      ?auto_23973 - HOIST
      ?auto_23972 - SURFACE
      ?auto_23981 - PLACE
      ?auto_23968 - HOIST
      ?auto_23977 - SURFACE
      ?auto_23971 - SURFACE
      ?auto_23975 - SURFACE
      ?auto_23969 - SURFACE
      ?auto_23983 - PLACE
      ?auto_23970 - HOIST
      ?auto_23978 - SURFACE
      ?auto_23986 - SURFACE
      ?auto_23980 - TRUCK
      ?auto_23982 - PLACE
      ?auto_23974 - HOIST
      ?auto_23987 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23985 ?auto_23984 ) ( IS-CRATE ?auto_23967 ) ( not ( = ?auto_23966 ?auto_23967 ) ) ( not ( = ?auto_23976 ?auto_23966 ) ) ( not ( = ?auto_23976 ?auto_23967 ) ) ( not ( = ?auto_23979 ?auto_23984 ) ) ( HOIST-AT ?auto_23973 ?auto_23979 ) ( not ( = ?auto_23985 ?auto_23973 ) ) ( AVAILABLE ?auto_23973 ) ( SURFACE-AT ?auto_23967 ?auto_23979 ) ( ON ?auto_23967 ?auto_23972 ) ( CLEAR ?auto_23967 ) ( not ( = ?auto_23966 ?auto_23972 ) ) ( not ( = ?auto_23967 ?auto_23972 ) ) ( not ( = ?auto_23976 ?auto_23972 ) ) ( IS-CRATE ?auto_23966 ) ( not ( = ?auto_23981 ?auto_23984 ) ) ( not ( = ?auto_23979 ?auto_23981 ) ) ( HOIST-AT ?auto_23968 ?auto_23981 ) ( not ( = ?auto_23985 ?auto_23968 ) ) ( not ( = ?auto_23973 ?auto_23968 ) ) ( SURFACE-AT ?auto_23966 ?auto_23981 ) ( ON ?auto_23966 ?auto_23977 ) ( CLEAR ?auto_23966 ) ( not ( = ?auto_23966 ?auto_23977 ) ) ( not ( = ?auto_23967 ?auto_23977 ) ) ( not ( = ?auto_23976 ?auto_23977 ) ) ( not ( = ?auto_23972 ?auto_23977 ) ) ( IS-CRATE ?auto_23976 ) ( not ( = ?auto_23971 ?auto_23976 ) ) ( not ( = ?auto_23966 ?auto_23971 ) ) ( not ( = ?auto_23967 ?auto_23971 ) ) ( not ( = ?auto_23972 ?auto_23971 ) ) ( not ( = ?auto_23977 ?auto_23971 ) ) ( AVAILABLE ?auto_23968 ) ( SURFACE-AT ?auto_23976 ?auto_23981 ) ( ON ?auto_23976 ?auto_23975 ) ( CLEAR ?auto_23976 ) ( not ( = ?auto_23966 ?auto_23975 ) ) ( not ( = ?auto_23967 ?auto_23975 ) ) ( not ( = ?auto_23976 ?auto_23975 ) ) ( not ( = ?auto_23972 ?auto_23975 ) ) ( not ( = ?auto_23977 ?auto_23975 ) ) ( not ( = ?auto_23971 ?auto_23975 ) ) ( IS-CRATE ?auto_23971 ) ( not ( = ?auto_23969 ?auto_23971 ) ) ( not ( = ?auto_23966 ?auto_23969 ) ) ( not ( = ?auto_23967 ?auto_23969 ) ) ( not ( = ?auto_23976 ?auto_23969 ) ) ( not ( = ?auto_23972 ?auto_23969 ) ) ( not ( = ?auto_23977 ?auto_23969 ) ) ( not ( = ?auto_23975 ?auto_23969 ) ) ( not ( = ?auto_23983 ?auto_23984 ) ) ( not ( = ?auto_23979 ?auto_23983 ) ) ( not ( = ?auto_23981 ?auto_23983 ) ) ( HOIST-AT ?auto_23970 ?auto_23983 ) ( not ( = ?auto_23985 ?auto_23970 ) ) ( not ( = ?auto_23973 ?auto_23970 ) ) ( not ( = ?auto_23968 ?auto_23970 ) ) ( AVAILABLE ?auto_23970 ) ( SURFACE-AT ?auto_23971 ?auto_23983 ) ( ON ?auto_23971 ?auto_23978 ) ( CLEAR ?auto_23971 ) ( not ( = ?auto_23966 ?auto_23978 ) ) ( not ( = ?auto_23967 ?auto_23978 ) ) ( not ( = ?auto_23976 ?auto_23978 ) ) ( not ( = ?auto_23972 ?auto_23978 ) ) ( not ( = ?auto_23977 ?auto_23978 ) ) ( not ( = ?auto_23971 ?auto_23978 ) ) ( not ( = ?auto_23975 ?auto_23978 ) ) ( not ( = ?auto_23969 ?auto_23978 ) ) ( SURFACE-AT ?auto_23986 ?auto_23984 ) ( CLEAR ?auto_23986 ) ( IS-CRATE ?auto_23969 ) ( not ( = ?auto_23986 ?auto_23969 ) ) ( not ( = ?auto_23966 ?auto_23986 ) ) ( not ( = ?auto_23967 ?auto_23986 ) ) ( not ( = ?auto_23976 ?auto_23986 ) ) ( not ( = ?auto_23972 ?auto_23986 ) ) ( not ( = ?auto_23977 ?auto_23986 ) ) ( not ( = ?auto_23971 ?auto_23986 ) ) ( not ( = ?auto_23975 ?auto_23986 ) ) ( not ( = ?auto_23978 ?auto_23986 ) ) ( AVAILABLE ?auto_23985 ) ( TRUCK-AT ?auto_23980 ?auto_23982 ) ( not ( = ?auto_23982 ?auto_23984 ) ) ( not ( = ?auto_23979 ?auto_23982 ) ) ( not ( = ?auto_23981 ?auto_23982 ) ) ( not ( = ?auto_23983 ?auto_23982 ) ) ( HOIST-AT ?auto_23974 ?auto_23982 ) ( not ( = ?auto_23985 ?auto_23974 ) ) ( not ( = ?auto_23973 ?auto_23974 ) ) ( not ( = ?auto_23968 ?auto_23974 ) ) ( not ( = ?auto_23970 ?auto_23974 ) ) ( AVAILABLE ?auto_23974 ) ( SURFACE-AT ?auto_23969 ?auto_23982 ) ( ON ?auto_23969 ?auto_23987 ) ( CLEAR ?auto_23969 ) ( not ( = ?auto_23966 ?auto_23987 ) ) ( not ( = ?auto_23967 ?auto_23987 ) ) ( not ( = ?auto_23976 ?auto_23987 ) ) ( not ( = ?auto_23972 ?auto_23987 ) ) ( not ( = ?auto_23977 ?auto_23987 ) ) ( not ( = ?auto_23971 ?auto_23987 ) ) ( not ( = ?auto_23975 ?auto_23987 ) ) ( not ( = ?auto_23969 ?auto_23987 ) ) ( not ( = ?auto_23978 ?auto_23987 ) ) ( not ( = ?auto_23986 ?auto_23987 ) ) )
    :subtasks
    ( ( !LIFT ?auto_23974 ?auto_23969 ?auto_23987 ?auto_23982 )
      ( MAKE-2CRATE ?auto_23976 ?auto_23966 ?auto_23967 )
      ( MAKE-1CRATE-VERIFY ?auto_23966 ?auto_23967 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23988 - SURFACE
      ?auto_23989 - SURFACE
      ?auto_23990 - SURFACE
    )
    :vars
    (
      ?auto_23995 - HOIST
      ?auto_23994 - PLACE
      ?auto_23998 - PLACE
      ?auto_24005 - HOIST
      ?auto_23999 - SURFACE
      ?auto_24001 - PLACE
      ?auto_24008 - HOIST
      ?auto_23992 - SURFACE
      ?auto_24006 - SURFACE
      ?auto_23997 - SURFACE
      ?auto_23996 - SURFACE
      ?auto_24007 - PLACE
      ?auto_24000 - HOIST
      ?auto_24004 - SURFACE
      ?auto_24003 - SURFACE
      ?auto_23993 - TRUCK
      ?auto_24002 - PLACE
      ?auto_23991 - HOIST
      ?auto_24009 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23995 ?auto_23994 ) ( IS-CRATE ?auto_23990 ) ( not ( = ?auto_23989 ?auto_23990 ) ) ( not ( = ?auto_23988 ?auto_23989 ) ) ( not ( = ?auto_23988 ?auto_23990 ) ) ( not ( = ?auto_23998 ?auto_23994 ) ) ( HOIST-AT ?auto_24005 ?auto_23998 ) ( not ( = ?auto_23995 ?auto_24005 ) ) ( AVAILABLE ?auto_24005 ) ( SURFACE-AT ?auto_23990 ?auto_23998 ) ( ON ?auto_23990 ?auto_23999 ) ( CLEAR ?auto_23990 ) ( not ( = ?auto_23989 ?auto_23999 ) ) ( not ( = ?auto_23990 ?auto_23999 ) ) ( not ( = ?auto_23988 ?auto_23999 ) ) ( IS-CRATE ?auto_23989 ) ( not ( = ?auto_24001 ?auto_23994 ) ) ( not ( = ?auto_23998 ?auto_24001 ) ) ( HOIST-AT ?auto_24008 ?auto_24001 ) ( not ( = ?auto_23995 ?auto_24008 ) ) ( not ( = ?auto_24005 ?auto_24008 ) ) ( SURFACE-AT ?auto_23989 ?auto_24001 ) ( ON ?auto_23989 ?auto_23992 ) ( CLEAR ?auto_23989 ) ( not ( = ?auto_23989 ?auto_23992 ) ) ( not ( = ?auto_23990 ?auto_23992 ) ) ( not ( = ?auto_23988 ?auto_23992 ) ) ( not ( = ?auto_23999 ?auto_23992 ) ) ( IS-CRATE ?auto_23988 ) ( not ( = ?auto_24006 ?auto_23988 ) ) ( not ( = ?auto_23989 ?auto_24006 ) ) ( not ( = ?auto_23990 ?auto_24006 ) ) ( not ( = ?auto_23999 ?auto_24006 ) ) ( not ( = ?auto_23992 ?auto_24006 ) ) ( AVAILABLE ?auto_24008 ) ( SURFACE-AT ?auto_23988 ?auto_24001 ) ( ON ?auto_23988 ?auto_23997 ) ( CLEAR ?auto_23988 ) ( not ( = ?auto_23989 ?auto_23997 ) ) ( not ( = ?auto_23990 ?auto_23997 ) ) ( not ( = ?auto_23988 ?auto_23997 ) ) ( not ( = ?auto_23999 ?auto_23997 ) ) ( not ( = ?auto_23992 ?auto_23997 ) ) ( not ( = ?auto_24006 ?auto_23997 ) ) ( IS-CRATE ?auto_24006 ) ( not ( = ?auto_23996 ?auto_24006 ) ) ( not ( = ?auto_23989 ?auto_23996 ) ) ( not ( = ?auto_23990 ?auto_23996 ) ) ( not ( = ?auto_23988 ?auto_23996 ) ) ( not ( = ?auto_23999 ?auto_23996 ) ) ( not ( = ?auto_23992 ?auto_23996 ) ) ( not ( = ?auto_23997 ?auto_23996 ) ) ( not ( = ?auto_24007 ?auto_23994 ) ) ( not ( = ?auto_23998 ?auto_24007 ) ) ( not ( = ?auto_24001 ?auto_24007 ) ) ( HOIST-AT ?auto_24000 ?auto_24007 ) ( not ( = ?auto_23995 ?auto_24000 ) ) ( not ( = ?auto_24005 ?auto_24000 ) ) ( not ( = ?auto_24008 ?auto_24000 ) ) ( AVAILABLE ?auto_24000 ) ( SURFACE-AT ?auto_24006 ?auto_24007 ) ( ON ?auto_24006 ?auto_24004 ) ( CLEAR ?auto_24006 ) ( not ( = ?auto_23989 ?auto_24004 ) ) ( not ( = ?auto_23990 ?auto_24004 ) ) ( not ( = ?auto_23988 ?auto_24004 ) ) ( not ( = ?auto_23999 ?auto_24004 ) ) ( not ( = ?auto_23992 ?auto_24004 ) ) ( not ( = ?auto_24006 ?auto_24004 ) ) ( not ( = ?auto_23997 ?auto_24004 ) ) ( not ( = ?auto_23996 ?auto_24004 ) ) ( SURFACE-AT ?auto_24003 ?auto_23994 ) ( CLEAR ?auto_24003 ) ( IS-CRATE ?auto_23996 ) ( not ( = ?auto_24003 ?auto_23996 ) ) ( not ( = ?auto_23989 ?auto_24003 ) ) ( not ( = ?auto_23990 ?auto_24003 ) ) ( not ( = ?auto_23988 ?auto_24003 ) ) ( not ( = ?auto_23999 ?auto_24003 ) ) ( not ( = ?auto_23992 ?auto_24003 ) ) ( not ( = ?auto_24006 ?auto_24003 ) ) ( not ( = ?auto_23997 ?auto_24003 ) ) ( not ( = ?auto_24004 ?auto_24003 ) ) ( AVAILABLE ?auto_23995 ) ( TRUCK-AT ?auto_23993 ?auto_24002 ) ( not ( = ?auto_24002 ?auto_23994 ) ) ( not ( = ?auto_23998 ?auto_24002 ) ) ( not ( = ?auto_24001 ?auto_24002 ) ) ( not ( = ?auto_24007 ?auto_24002 ) ) ( HOIST-AT ?auto_23991 ?auto_24002 ) ( not ( = ?auto_23995 ?auto_23991 ) ) ( not ( = ?auto_24005 ?auto_23991 ) ) ( not ( = ?auto_24008 ?auto_23991 ) ) ( not ( = ?auto_24000 ?auto_23991 ) ) ( AVAILABLE ?auto_23991 ) ( SURFACE-AT ?auto_23996 ?auto_24002 ) ( ON ?auto_23996 ?auto_24009 ) ( CLEAR ?auto_23996 ) ( not ( = ?auto_23989 ?auto_24009 ) ) ( not ( = ?auto_23990 ?auto_24009 ) ) ( not ( = ?auto_23988 ?auto_24009 ) ) ( not ( = ?auto_23999 ?auto_24009 ) ) ( not ( = ?auto_23992 ?auto_24009 ) ) ( not ( = ?auto_24006 ?auto_24009 ) ) ( not ( = ?auto_23997 ?auto_24009 ) ) ( not ( = ?auto_23996 ?auto_24009 ) ) ( not ( = ?auto_24004 ?auto_24009 ) ) ( not ( = ?auto_24003 ?auto_24009 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23989 ?auto_23990 )
      ( MAKE-2CRATE-VERIFY ?auto_23988 ?auto_23989 ?auto_23990 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24010 - SURFACE
      ?auto_24011 - SURFACE
      ?auto_24012 - SURFACE
      ?auto_24013 - SURFACE
    )
    :vars
    (
      ?auto_24024 - HOIST
      ?auto_24031 - PLACE
      ?auto_24014 - PLACE
      ?auto_24019 - HOIST
      ?auto_24028 - SURFACE
      ?auto_24018 - PLACE
      ?auto_24026 - HOIST
      ?auto_24020 - SURFACE
      ?auto_24029 - SURFACE
      ?auto_24015 - SURFACE
      ?auto_24021 - PLACE
      ?auto_24030 - HOIST
      ?auto_24022 - SURFACE
      ?auto_24027 - SURFACE
      ?auto_24023 - TRUCK
      ?auto_24017 - PLACE
      ?auto_24016 - HOIST
      ?auto_24025 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24024 ?auto_24031 ) ( IS-CRATE ?auto_24013 ) ( not ( = ?auto_24012 ?auto_24013 ) ) ( not ( = ?auto_24011 ?auto_24012 ) ) ( not ( = ?auto_24011 ?auto_24013 ) ) ( not ( = ?auto_24014 ?auto_24031 ) ) ( HOIST-AT ?auto_24019 ?auto_24014 ) ( not ( = ?auto_24024 ?auto_24019 ) ) ( AVAILABLE ?auto_24019 ) ( SURFACE-AT ?auto_24013 ?auto_24014 ) ( ON ?auto_24013 ?auto_24028 ) ( CLEAR ?auto_24013 ) ( not ( = ?auto_24012 ?auto_24028 ) ) ( not ( = ?auto_24013 ?auto_24028 ) ) ( not ( = ?auto_24011 ?auto_24028 ) ) ( IS-CRATE ?auto_24012 ) ( not ( = ?auto_24018 ?auto_24031 ) ) ( not ( = ?auto_24014 ?auto_24018 ) ) ( HOIST-AT ?auto_24026 ?auto_24018 ) ( not ( = ?auto_24024 ?auto_24026 ) ) ( not ( = ?auto_24019 ?auto_24026 ) ) ( SURFACE-AT ?auto_24012 ?auto_24018 ) ( ON ?auto_24012 ?auto_24020 ) ( CLEAR ?auto_24012 ) ( not ( = ?auto_24012 ?auto_24020 ) ) ( not ( = ?auto_24013 ?auto_24020 ) ) ( not ( = ?auto_24011 ?auto_24020 ) ) ( not ( = ?auto_24028 ?auto_24020 ) ) ( IS-CRATE ?auto_24011 ) ( not ( = ?auto_24010 ?auto_24011 ) ) ( not ( = ?auto_24012 ?auto_24010 ) ) ( not ( = ?auto_24013 ?auto_24010 ) ) ( not ( = ?auto_24028 ?auto_24010 ) ) ( not ( = ?auto_24020 ?auto_24010 ) ) ( AVAILABLE ?auto_24026 ) ( SURFACE-AT ?auto_24011 ?auto_24018 ) ( ON ?auto_24011 ?auto_24029 ) ( CLEAR ?auto_24011 ) ( not ( = ?auto_24012 ?auto_24029 ) ) ( not ( = ?auto_24013 ?auto_24029 ) ) ( not ( = ?auto_24011 ?auto_24029 ) ) ( not ( = ?auto_24028 ?auto_24029 ) ) ( not ( = ?auto_24020 ?auto_24029 ) ) ( not ( = ?auto_24010 ?auto_24029 ) ) ( IS-CRATE ?auto_24010 ) ( not ( = ?auto_24015 ?auto_24010 ) ) ( not ( = ?auto_24012 ?auto_24015 ) ) ( not ( = ?auto_24013 ?auto_24015 ) ) ( not ( = ?auto_24011 ?auto_24015 ) ) ( not ( = ?auto_24028 ?auto_24015 ) ) ( not ( = ?auto_24020 ?auto_24015 ) ) ( not ( = ?auto_24029 ?auto_24015 ) ) ( not ( = ?auto_24021 ?auto_24031 ) ) ( not ( = ?auto_24014 ?auto_24021 ) ) ( not ( = ?auto_24018 ?auto_24021 ) ) ( HOIST-AT ?auto_24030 ?auto_24021 ) ( not ( = ?auto_24024 ?auto_24030 ) ) ( not ( = ?auto_24019 ?auto_24030 ) ) ( not ( = ?auto_24026 ?auto_24030 ) ) ( AVAILABLE ?auto_24030 ) ( SURFACE-AT ?auto_24010 ?auto_24021 ) ( ON ?auto_24010 ?auto_24022 ) ( CLEAR ?auto_24010 ) ( not ( = ?auto_24012 ?auto_24022 ) ) ( not ( = ?auto_24013 ?auto_24022 ) ) ( not ( = ?auto_24011 ?auto_24022 ) ) ( not ( = ?auto_24028 ?auto_24022 ) ) ( not ( = ?auto_24020 ?auto_24022 ) ) ( not ( = ?auto_24010 ?auto_24022 ) ) ( not ( = ?auto_24029 ?auto_24022 ) ) ( not ( = ?auto_24015 ?auto_24022 ) ) ( SURFACE-AT ?auto_24027 ?auto_24031 ) ( CLEAR ?auto_24027 ) ( IS-CRATE ?auto_24015 ) ( not ( = ?auto_24027 ?auto_24015 ) ) ( not ( = ?auto_24012 ?auto_24027 ) ) ( not ( = ?auto_24013 ?auto_24027 ) ) ( not ( = ?auto_24011 ?auto_24027 ) ) ( not ( = ?auto_24028 ?auto_24027 ) ) ( not ( = ?auto_24020 ?auto_24027 ) ) ( not ( = ?auto_24010 ?auto_24027 ) ) ( not ( = ?auto_24029 ?auto_24027 ) ) ( not ( = ?auto_24022 ?auto_24027 ) ) ( AVAILABLE ?auto_24024 ) ( TRUCK-AT ?auto_24023 ?auto_24017 ) ( not ( = ?auto_24017 ?auto_24031 ) ) ( not ( = ?auto_24014 ?auto_24017 ) ) ( not ( = ?auto_24018 ?auto_24017 ) ) ( not ( = ?auto_24021 ?auto_24017 ) ) ( HOIST-AT ?auto_24016 ?auto_24017 ) ( not ( = ?auto_24024 ?auto_24016 ) ) ( not ( = ?auto_24019 ?auto_24016 ) ) ( not ( = ?auto_24026 ?auto_24016 ) ) ( not ( = ?auto_24030 ?auto_24016 ) ) ( AVAILABLE ?auto_24016 ) ( SURFACE-AT ?auto_24015 ?auto_24017 ) ( ON ?auto_24015 ?auto_24025 ) ( CLEAR ?auto_24015 ) ( not ( = ?auto_24012 ?auto_24025 ) ) ( not ( = ?auto_24013 ?auto_24025 ) ) ( not ( = ?auto_24011 ?auto_24025 ) ) ( not ( = ?auto_24028 ?auto_24025 ) ) ( not ( = ?auto_24020 ?auto_24025 ) ) ( not ( = ?auto_24010 ?auto_24025 ) ) ( not ( = ?auto_24029 ?auto_24025 ) ) ( not ( = ?auto_24015 ?auto_24025 ) ) ( not ( = ?auto_24022 ?auto_24025 ) ) ( not ( = ?auto_24027 ?auto_24025 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24011 ?auto_24012 ?auto_24013 )
      ( MAKE-3CRATE-VERIFY ?auto_24010 ?auto_24011 ?auto_24012 ?auto_24013 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_24032 - SURFACE
      ?auto_24033 - SURFACE
      ?auto_24034 - SURFACE
      ?auto_24035 - SURFACE
      ?auto_24036 - SURFACE
    )
    :vars
    (
      ?auto_24046 - HOIST
      ?auto_24053 - PLACE
      ?auto_24037 - PLACE
      ?auto_24041 - HOIST
      ?auto_24050 - SURFACE
      ?auto_24040 - PLACE
      ?auto_24048 - HOIST
      ?auto_24042 - SURFACE
      ?auto_24051 - SURFACE
      ?auto_24043 - PLACE
      ?auto_24052 - HOIST
      ?auto_24044 - SURFACE
      ?auto_24049 - SURFACE
      ?auto_24045 - TRUCK
      ?auto_24039 - PLACE
      ?auto_24038 - HOIST
      ?auto_24047 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24046 ?auto_24053 ) ( IS-CRATE ?auto_24036 ) ( not ( = ?auto_24035 ?auto_24036 ) ) ( not ( = ?auto_24034 ?auto_24035 ) ) ( not ( = ?auto_24034 ?auto_24036 ) ) ( not ( = ?auto_24037 ?auto_24053 ) ) ( HOIST-AT ?auto_24041 ?auto_24037 ) ( not ( = ?auto_24046 ?auto_24041 ) ) ( AVAILABLE ?auto_24041 ) ( SURFACE-AT ?auto_24036 ?auto_24037 ) ( ON ?auto_24036 ?auto_24050 ) ( CLEAR ?auto_24036 ) ( not ( = ?auto_24035 ?auto_24050 ) ) ( not ( = ?auto_24036 ?auto_24050 ) ) ( not ( = ?auto_24034 ?auto_24050 ) ) ( IS-CRATE ?auto_24035 ) ( not ( = ?auto_24040 ?auto_24053 ) ) ( not ( = ?auto_24037 ?auto_24040 ) ) ( HOIST-AT ?auto_24048 ?auto_24040 ) ( not ( = ?auto_24046 ?auto_24048 ) ) ( not ( = ?auto_24041 ?auto_24048 ) ) ( SURFACE-AT ?auto_24035 ?auto_24040 ) ( ON ?auto_24035 ?auto_24042 ) ( CLEAR ?auto_24035 ) ( not ( = ?auto_24035 ?auto_24042 ) ) ( not ( = ?auto_24036 ?auto_24042 ) ) ( not ( = ?auto_24034 ?auto_24042 ) ) ( not ( = ?auto_24050 ?auto_24042 ) ) ( IS-CRATE ?auto_24034 ) ( not ( = ?auto_24033 ?auto_24034 ) ) ( not ( = ?auto_24035 ?auto_24033 ) ) ( not ( = ?auto_24036 ?auto_24033 ) ) ( not ( = ?auto_24050 ?auto_24033 ) ) ( not ( = ?auto_24042 ?auto_24033 ) ) ( AVAILABLE ?auto_24048 ) ( SURFACE-AT ?auto_24034 ?auto_24040 ) ( ON ?auto_24034 ?auto_24051 ) ( CLEAR ?auto_24034 ) ( not ( = ?auto_24035 ?auto_24051 ) ) ( not ( = ?auto_24036 ?auto_24051 ) ) ( not ( = ?auto_24034 ?auto_24051 ) ) ( not ( = ?auto_24050 ?auto_24051 ) ) ( not ( = ?auto_24042 ?auto_24051 ) ) ( not ( = ?auto_24033 ?auto_24051 ) ) ( IS-CRATE ?auto_24033 ) ( not ( = ?auto_24032 ?auto_24033 ) ) ( not ( = ?auto_24035 ?auto_24032 ) ) ( not ( = ?auto_24036 ?auto_24032 ) ) ( not ( = ?auto_24034 ?auto_24032 ) ) ( not ( = ?auto_24050 ?auto_24032 ) ) ( not ( = ?auto_24042 ?auto_24032 ) ) ( not ( = ?auto_24051 ?auto_24032 ) ) ( not ( = ?auto_24043 ?auto_24053 ) ) ( not ( = ?auto_24037 ?auto_24043 ) ) ( not ( = ?auto_24040 ?auto_24043 ) ) ( HOIST-AT ?auto_24052 ?auto_24043 ) ( not ( = ?auto_24046 ?auto_24052 ) ) ( not ( = ?auto_24041 ?auto_24052 ) ) ( not ( = ?auto_24048 ?auto_24052 ) ) ( AVAILABLE ?auto_24052 ) ( SURFACE-AT ?auto_24033 ?auto_24043 ) ( ON ?auto_24033 ?auto_24044 ) ( CLEAR ?auto_24033 ) ( not ( = ?auto_24035 ?auto_24044 ) ) ( not ( = ?auto_24036 ?auto_24044 ) ) ( not ( = ?auto_24034 ?auto_24044 ) ) ( not ( = ?auto_24050 ?auto_24044 ) ) ( not ( = ?auto_24042 ?auto_24044 ) ) ( not ( = ?auto_24033 ?auto_24044 ) ) ( not ( = ?auto_24051 ?auto_24044 ) ) ( not ( = ?auto_24032 ?auto_24044 ) ) ( SURFACE-AT ?auto_24049 ?auto_24053 ) ( CLEAR ?auto_24049 ) ( IS-CRATE ?auto_24032 ) ( not ( = ?auto_24049 ?auto_24032 ) ) ( not ( = ?auto_24035 ?auto_24049 ) ) ( not ( = ?auto_24036 ?auto_24049 ) ) ( not ( = ?auto_24034 ?auto_24049 ) ) ( not ( = ?auto_24050 ?auto_24049 ) ) ( not ( = ?auto_24042 ?auto_24049 ) ) ( not ( = ?auto_24033 ?auto_24049 ) ) ( not ( = ?auto_24051 ?auto_24049 ) ) ( not ( = ?auto_24044 ?auto_24049 ) ) ( AVAILABLE ?auto_24046 ) ( TRUCK-AT ?auto_24045 ?auto_24039 ) ( not ( = ?auto_24039 ?auto_24053 ) ) ( not ( = ?auto_24037 ?auto_24039 ) ) ( not ( = ?auto_24040 ?auto_24039 ) ) ( not ( = ?auto_24043 ?auto_24039 ) ) ( HOIST-AT ?auto_24038 ?auto_24039 ) ( not ( = ?auto_24046 ?auto_24038 ) ) ( not ( = ?auto_24041 ?auto_24038 ) ) ( not ( = ?auto_24048 ?auto_24038 ) ) ( not ( = ?auto_24052 ?auto_24038 ) ) ( AVAILABLE ?auto_24038 ) ( SURFACE-AT ?auto_24032 ?auto_24039 ) ( ON ?auto_24032 ?auto_24047 ) ( CLEAR ?auto_24032 ) ( not ( = ?auto_24035 ?auto_24047 ) ) ( not ( = ?auto_24036 ?auto_24047 ) ) ( not ( = ?auto_24034 ?auto_24047 ) ) ( not ( = ?auto_24050 ?auto_24047 ) ) ( not ( = ?auto_24042 ?auto_24047 ) ) ( not ( = ?auto_24033 ?auto_24047 ) ) ( not ( = ?auto_24051 ?auto_24047 ) ) ( not ( = ?auto_24032 ?auto_24047 ) ) ( not ( = ?auto_24044 ?auto_24047 ) ) ( not ( = ?auto_24049 ?auto_24047 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24034 ?auto_24035 ?auto_24036 )
      ( MAKE-4CRATE-VERIFY ?auto_24032 ?auto_24033 ?auto_24034 ?auto_24035 ?auto_24036 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_24054 - SURFACE
      ?auto_24055 - SURFACE
      ?auto_24056 - SURFACE
      ?auto_24057 - SURFACE
      ?auto_24058 - SURFACE
      ?auto_24059 - SURFACE
    )
    :vars
    (
      ?auto_24069 - HOIST
      ?auto_24075 - PLACE
      ?auto_24060 - PLACE
      ?auto_24064 - HOIST
      ?auto_24072 - SURFACE
      ?auto_24063 - PLACE
      ?auto_24071 - HOIST
      ?auto_24065 - SURFACE
      ?auto_24073 - SURFACE
      ?auto_24066 - PLACE
      ?auto_24074 - HOIST
      ?auto_24067 - SURFACE
      ?auto_24068 - TRUCK
      ?auto_24062 - PLACE
      ?auto_24061 - HOIST
      ?auto_24070 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24069 ?auto_24075 ) ( IS-CRATE ?auto_24059 ) ( not ( = ?auto_24058 ?auto_24059 ) ) ( not ( = ?auto_24057 ?auto_24058 ) ) ( not ( = ?auto_24057 ?auto_24059 ) ) ( not ( = ?auto_24060 ?auto_24075 ) ) ( HOIST-AT ?auto_24064 ?auto_24060 ) ( not ( = ?auto_24069 ?auto_24064 ) ) ( AVAILABLE ?auto_24064 ) ( SURFACE-AT ?auto_24059 ?auto_24060 ) ( ON ?auto_24059 ?auto_24072 ) ( CLEAR ?auto_24059 ) ( not ( = ?auto_24058 ?auto_24072 ) ) ( not ( = ?auto_24059 ?auto_24072 ) ) ( not ( = ?auto_24057 ?auto_24072 ) ) ( IS-CRATE ?auto_24058 ) ( not ( = ?auto_24063 ?auto_24075 ) ) ( not ( = ?auto_24060 ?auto_24063 ) ) ( HOIST-AT ?auto_24071 ?auto_24063 ) ( not ( = ?auto_24069 ?auto_24071 ) ) ( not ( = ?auto_24064 ?auto_24071 ) ) ( SURFACE-AT ?auto_24058 ?auto_24063 ) ( ON ?auto_24058 ?auto_24065 ) ( CLEAR ?auto_24058 ) ( not ( = ?auto_24058 ?auto_24065 ) ) ( not ( = ?auto_24059 ?auto_24065 ) ) ( not ( = ?auto_24057 ?auto_24065 ) ) ( not ( = ?auto_24072 ?auto_24065 ) ) ( IS-CRATE ?auto_24057 ) ( not ( = ?auto_24056 ?auto_24057 ) ) ( not ( = ?auto_24058 ?auto_24056 ) ) ( not ( = ?auto_24059 ?auto_24056 ) ) ( not ( = ?auto_24072 ?auto_24056 ) ) ( not ( = ?auto_24065 ?auto_24056 ) ) ( AVAILABLE ?auto_24071 ) ( SURFACE-AT ?auto_24057 ?auto_24063 ) ( ON ?auto_24057 ?auto_24073 ) ( CLEAR ?auto_24057 ) ( not ( = ?auto_24058 ?auto_24073 ) ) ( not ( = ?auto_24059 ?auto_24073 ) ) ( not ( = ?auto_24057 ?auto_24073 ) ) ( not ( = ?auto_24072 ?auto_24073 ) ) ( not ( = ?auto_24065 ?auto_24073 ) ) ( not ( = ?auto_24056 ?auto_24073 ) ) ( IS-CRATE ?auto_24056 ) ( not ( = ?auto_24055 ?auto_24056 ) ) ( not ( = ?auto_24058 ?auto_24055 ) ) ( not ( = ?auto_24059 ?auto_24055 ) ) ( not ( = ?auto_24057 ?auto_24055 ) ) ( not ( = ?auto_24072 ?auto_24055 ) ) ( not ( = ?auto_24065 ?auto_24055 ) ) ( not ( = ?auto_24073 ?auto_24055 ) ) ( not ( = ?auto_24066 ?auto_24075 ) ) ( not ( = ?auto_24060 ?auto_24066 ) ) ( not ( = ?auto_24063 ?auto_24066 ) ) ( HOIST-AT ?auto_24074 ?auto_24066 ) ( not ( = ?auto_24069 ?auto_24074 ) ) ( not ( = ?auto_24064 ?auto_24074 ) ) ( not ( = ?auto_24071 ?auto_24074 ) ) ( AVAILABLE ?auto_24074 ) ( SURFACE-AT ?auto_24056 ?auto_24066 ) ( ON ?auto_24056 ?auto_24067 ) ( CLEAR ?auto_24056 ) ( not ( = ?auto_24058 ?auto_24067 ) ) ( not ( = ?auto_24059 ?auto_24067 ) ) ( not ( = ?auto_24057 ?auto_24067 ) ) ( not ( = ?auto_24072 ?auto_24067 ) ) ( not ( = ?auto_24065 ?auto_24067 ) ) ( not ( = ?auto_24056 ?auto_24067 ) ) ( not ( = ?auto_24073 ?auto_24067 ) ) ( not ( = ?auto_24055 ?auto_24067 ) ) ( SURFACE-AT ?auto_24054 ?auto_24075 ) ( CLEAR ?auto_24054 ) ( IS-CRATE ?auto_24055 ) ( not ( = ?auto_24054 ?auto_24055 ) ) ( not ( = ?auto_24058 ?auto_24054 ) ) ( not ( = ?auto_24059 ?auto_24054 ) ) ( not ( = ?auto_24057 ?auto_24054 ) ) ( not ( = ?auto_24072 ?auto_24054 ) ) ( not ( = ?auto_24065 ?auto_24054 ) ) ( not ( = ?auto_24056 ?auto_24054 ) ) ( not ( = ?auto_24073 ?auto_24054 ) ) ( not ( = ?auto_24067 ?auto_24054 ) ) ( AVAILABLE ?auto_24069 ) ( TRUCK-AT ?auto_24068 ?auto_24062 ) ( not ( = ?auto_24062 ?auto_24075 ) ) ( not ( = ?auto_24060 ?auto_24062 ) ) ( not ( = ?auto_24063 ?auto_24062 ) ) ( not ( = ?auto_24066 ?auto_24062 ) ) ( HOIST-AT ?auto_24061 ?auto_24062 ) ( not ( = ?auto_24069 ?auto_24061 ) ) ( not ( = ?auto_24064 ?auto_24061 ) ) ( not ( = ?auto_24071 ?auto_24061 ) ) ( not ( = ?auto_24074 ?auto_24061 ) ) ( AVAILABLE ?auto_24061 ) ( SURFACE-AT ?auto_24055 ?auto_24062 ) ( ON ?auto_24055 ?auto_24070 ) ( CLEAR ?auto_24055 ) ( not ( = ?auto_24058 ?auto_24070 ) ) ( not ( = ?auto_24059 ?auto_24070 ) ) ( not ( = ?auto_24057 ?auto_24070 ) ) ( not ( = ?auto_24072 ?auto_24070 ) ) ( not ( = ?auto_24065 ?auto_24070 ) ) ( not ( = ?auto_24056 ?auto_24070 ) ) ( not ( = ?auto_24073 ?auto_24070 ) ) ( not ( = ?auto_24055 ?auto_24070 ) ) ( not ( = ?auto_24067 ?auto_24070 ) ) ( not ( = ?auto_24054 ?auto_24070 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24057 ?auto_24058 ?auto_24059 )
      ( MAKE-5CRATE-VERIFY ?auto_24054 ?auto_24055 ?auto_24056 ?auto_24057 ?auto_24058 ?auto_24059 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24076 - SURFACE
      ?auto_24077 - SURFACE
    )
    :vars
    (
      ?auto_24090 - HOIST
      ?auto_24097 - PLACE
      ?auto_24088 - SURFACE
      ?auto_24078 - PLACE
      ?auto_24083 - HOIST
      ?auto_24094 - SURFACE
      ?auto_24082 - PLACE
      ?auto_24092 - HOIST
      ?auto_24084 - SURFACE
      ?auto_24087 - SURFACE
      ?auto_24095 - SURFACE
      ?auto_24079 - SURFACE
      ?auto_24085 - PLACE
      ?auto_24096 - HOIST
      ?auto_24086 - SURFACE
      ?auto_24093 - SURFACE
      ?auto_24081 - PLACE
      ?auto_24080 - HOIST
      ?auto_24091 - SURFACE
      ?auto_24089 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24090 ?auto_24097 ) ( IS-CRATE ?auto_24077 ) ( not ( = ?auto_24076 ?auto_24077 ) ) ( not ( = ?auto_24088 ?auto_24076 ) ) ( not ( = ?auto_24088 ?auto_24077 ) ) ( not ( = ?auto_24078 ?auto_24097 ) ) ( HOIST-AT ?auto_24083 ?auto_24078 ) ( not ( = ?auto_24090 ?auto_24083 ) ) ( AVAILABLE ?auto_24083 ) ( SURFACE-AT ?auto_24077 ?auto_24078 ) ( ON ?auto_24077 ?auto_24094 ) ( CLEAR ?auto_24077 ) ( not ( = ?auto_24076 ?auto_24094 ) ) ( not ( = ?auto_24077 ?auto_24094 ) ) ( not ( = ?auto_24088 ?auto_24094 ) ) ( IS-CRATE ?auto_24076 ) ( not ( = ?auto_24082 ?auto_24097 ) ) ( not ( = ?auto_24078 ?auto_24082 ) ) ( HOIST-AT ?auto_24092 ?auto_24082 ) ( not ( = ?auto_24090 ?auto_24092 ) ) ( not ( = ?auto_24083 ?auto_24092 ) ) ( SURFACE-AT ?auto_24076 ?auto_24082 ) ( ON ?auto_24076 ?auto_24084 ) ( CLEAR ?auto_24076 ) ( not ( = ?auto_24076 ?auto_24084 ) ) ( not ( = ?auto_24077 ?auto_24084 ) ) ( not ( = ?auto_24088 ?auto_24084 ) ) ( not ( = ?auto_24094 ?auto_24084 ) ) ( IS-CRATE ?auto_24088 ) ( not ( = ?auto_24087 ?auto_24088 ) ) ( not ( = ?auto_24076 ?auto_24087 ) ) ( not ( = ?auto_24077 ?auto_24087 ) ) ( not ( = ?auto_24094 ?auto_24087 ) ) ( not ( = ?auto_24084 ?auto_24087 ) ) ( AVAILABLE ?auto_24092 ) ( SURFACE-AT ?auto_24088 ?auto_24082 ) ( ON ?auto_24088 ?auto_24095 ) ( CLEAR ?auto_24088 ) ( not ( = ?auto_24076 ?auto_24095 ) ) ( not ( = ?auto_24077 ?auto_24095 ) ) ( not ( = ?auto_24088 ?auto_24095 ) ) ( not ( = ?auto_24094 ?auto_24095 ) ) ( not ( = ?auto_24084 ?auto_24095 ) ) ( not ( = ?auto_24087 ?auto_24095 ) ) ( IS-CRATE ?auto_24087 ) ( not ( = ?auto_24079 ?auto_24087 ) ) ( not ( = ?auto_24076 ?auto_24079 ) ) ( not ( = ?auto_24077 ?auto_24079 ) ) ( not ( = ?auto_24088 ?auto_24079 ) ) ( not ( = ?auto_24094 ?auto_24079 ) ) ( not ( = ?auto_24084 ?auto_24079 ) ) ( not ( = ?auto_24095 ?auto_24079 ) ) ( not ( = ?auto_24085 ?auto_24097 ) ) ( not ( = ?auto_24078 ?auto_24085 ) ) ( not ( = ?auto_24082 ?auto_24085 ) ) ( HOIST-AT ?auto_24096 ?auto_24085 ) ( not ( = ?auto_24090 ?auto_24096 ) ) ( not ( = ?auto_24083 ?auto_24096 ) ) ( not ( = ?auto_24092 ?auto_24096 ) ) ( AVAILABLE ?auto_24096 ) ( SURFACE-AT ?auto_24087 ?auto_24085 ) ( ON ?auto_24087 ?auto_24086 ) ( CLEAR ?auto_24087 ) ( not ( = ?auto_24076 ?auto_24086 ) ) ( not ( = ?auto_24077 ?auto_24086 ) ) ( not ( = ?auto_24088 ?auto_24086 ) ) ( not ( = ?auto_24094 ?auto_24086 ) ) ( not ( = ?auto_24084 ?auto_24086 ) ) ( not ( = ?auto_24087 ?auto_24086 ) ) ( not ( = ?auto_24095 ?auto_24086 ) ) ( not ( = ?auto_24079 ?auto_24086 ) ) ( SURFACE-AT ?auto_24093 ?auto_24097 ) ( CLEAR ?auto_24093 ) ( IS-CRATE ?auto_24079 ) ( not ( = ?auto_24093 ?auto_24079 ) ) ( not ( = ?auto_24076 ?auto_24093 ) ) ( not ( = ?auto_24077 ?auto_24093 ) ) ( not ( = ?auto_24088 ?auto_24093 ) ) ( not ( = ?auto_24094 ?auto_24093 ) ) ( not ( = ?auto_24084 ?auto_24093 ) ) ( not ( = ?auto_24087 ?auto_24093 ) ) ( not ( = ?auto_24095 ?auto_24093 ) ) ( not ( = ?auto_24086 ?auto_24093 ) ) ( AVAILABLE ?auto_24090 ) ( not ( = ?auto_24081 ?auto_24097 ) ) ( not ( = ?auto_24078 ?auto_24081 ) ) ( not ( = ?auto_24082 ?auto_24081 ) ) ( not ( = ?auto_24085 ?auto_24081 ) ) ( HOIST-AT ?auto_24080 ?auto_24081 ) ( not ( = ?auto_24090 ?auto_24080 ) ) ( not ( = ?auto_24083 ?auto_24080 ) ) ( not ( = ?auto_24092 ?auto_24080 ) ) ( not ( = ?auto_24096 ?auto_24080 ) ) ( AVAILABLE ?auto_24080 ) ( SURFACE-AT ?auto_24079 ?auto_24081 ) ( ON ?auto_24079 ?auto_24091 ) ( CLEAR ?auto_24079 ) ( not ( = ?auto_24076 ?auto_24091 ) ) ( not ( = ?auto_24077 ?auto_24091 ) ) ( not ( = ?auto_24088 ?auto_24091 ) ) ( not ( = ?auto_24094 ?auto_24091 ) ) ( not ( = ?auto_24084 ?auto_24091 ) ) ( not ( = ?auto_24087 ?auto_24091 ) ) ( not ( = ?auto_24095 ?auto_24091 ) ) ( not ( = ?auto_24079 ?auto_24091 ) ) ( not ( = ?auto_24086 ?auto_24091 ) ) ( not ( = ?auto_24093 ?auto_24091 ) ) ( TRUCK-AT ?auto_24089 ?auto_24097 ) )
    :subtasks
    ( ( !DRIVE ?auto_24089 ?auto_24097 ?auto_24081 )
      ( MAKE-2CRATE ?auto_24088 ?auto_24076 ?auto_24077 )
      ( MAKE-1CRATE-VERIFY ?auto_24076 ?auto_24077 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24098 - SURFACE
      ?auto_24099 - SURFACE
      ?auto_24100 - SURFACE
    )
    :vars
    (
      ?auto_24114 - HOIST
      ?auto_24108 - PLACE
      ?auto_24116 - PLACE
      ?auto_24110 - HOIST
      ?auto_24117 - SURFACE
      ?auto_24104 - PLACE
      ?auto_24118 - HOIST
      ?auto_24111 - SURFACE
      ?auto_24102 - SURFACE
      ?auto_24101 - SURFACE
      ?auto_24115 - SURFACE
      ?auto_24103 - PLACE
      ?auto_24106 - HOIST
      ?auto_24113 - SURFACE
      ?auto_24107 - SURFACE
      ?auto_24112 - PLACE
      ?auto_24109 - HOIST
      ?auto_24105 - SURFACE
      ?auto_24119 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24114 ?auto_24108 ) ( IS-CRATE ?auto_24100 ) ( not ( = ?auto_24099 ?auto_24100 ) ) ( not ( = ?auto_24098 ?auto_24099 ) ) ( not ( = ?auto_24098 ?auto_24100 ) ) ( not ( = ?auto_24116 ?auto_24108 ) ) ( HOIST-AT ?auto_24110 ?auto_24116 ) ( not ( = ?auto_24114 ?auto_24110 ) ) ( AVAILABLE ?auto_24110 ) ( SURFACE-AT ?auto_24100 ?auto_24116 ) ( ON ?auto_24100 ?auto_24117 ) ( CLEAR ?auto_24100 ) ( not ( = ?auto_24099 ?auto_24117 ) ) ( not ( = ?auto_24100 ?auto_24117 ) ) ( not ( = ?auto_24098 ?auto_24117 ) ) ( IS-CRATE ?auto_24099 ) ( not ( = ?auto_24104 ?auto_24108 ) ) ( not ( = ?auto_24116 ?auto_24104 ) ) ( HOIST-AT ?auto_24118 ?auto_24104 ) ( not ( = ?auto_24114 ?auto_24118 ) ) ( not ( = ?auto_24110 ?auto_24118 ) ) ( SURFACE-AT ?auto_24099 ?auto_24104 ) ( ON ?auto_24099 ?auto_24111 ) ( CLEAR ?auto_24099 ) ( not ( = ?auto_24099 ?auto_24111 ) ) ( not ( = ?auto_24100 ?auto_24111 ) ) ( not ( = ?auto_24098 ?auto_24111 ) ) ( not ( = ?auto_24117 ?auto_24111 ) ) ( IS-CRATE ?auto_24098 ) ( not ( = ?auto_24102 ?auto_24098 ) ) ( not ( = ?auto_24099 ?auto_24102 ) ) ( not ( = ?auto_24100 ?auto_24102 ) ) ( not ( = ?auto_24117 ?auto_24102 ) ) ( not ( = ?auto_24111 ?auto_24102 ) ) ( AVAILABLE ?auto_24118 ) ( SURFACE-AT ?auto_24098 ?auto_24104 ) ( ON ?auto_24098 ?auto_24101 ) ( CLEAR ?auto_24098 ) ( not ( = ?auto_24099 ?auto_24101 ) ) ( not ( = ?auto_24100 ?auto_24101 ) ) ( not ( = ?auto_24098 ?auto_24101 ) ) ( not ( = ?auto_24117 ?auto_24101 ) ) ( not ( = ?auto_24111 ?auto_24101 ) ) ( not ( = ?auto_24102 ?auto_24101 ) ) ( IS-CRATE ?auto_24102 ) ( not ( = ?auto_24115 ?auto_24102 ) ) ( not ( = ?auto_24099 ?auto_24115 ) ) ( not ( = ?auto_24100 ?auto_24115 ) ) ( not ( = ?auto_24098 ?auto_24115 ) ) ( not ( = ?auto_24117 ?auto_24115 ) ) ( not ( = ?auto_24111 ?auto_24115 ) ) ( not ( = ?auto_24101 ?auto_24115 ) ) ( not ( = ?auto_24103 ?auto_24108 ) ) ( not ( = ?auto_24116 ?auto_24103 ) ) ( not ( = ?auto_24104 ?auto_24103 ) ) ( HOIST-AT ?auto_24106 ?auto_24103 ) ( not ( = ?auto_24114 ?auto_24106 ) ) ( not ( = ?auto_24110 ?auto_24106 ) ) ( not ( = ?auto_24118 ?auto_24106 ) ) ( AVAILABLE ?auto_24106 ) ( SURFACE-AT ?auto_24102 ?auto_24103 ) ( ON ?auto_24102 ?auto_24113 ) ( CLEAR ?auto_24102 ) ( not ( = ?auto_24099 ?auto_24113 ) ) ( not ( = ?auto_24100 ?auto_24113 ) ) ( not ( = ?auto_24098 ?auto_24113 ) ) ( not ( = ?auto_24117 ?auto_24113 ) ) ( not ( = ?auto_24111 ?auto_24113 ) ) ( not ( = ?auto_24102 ?auto_24113 ) ) ( not ( = ?auto_24101 ?auto_24113 ) ) ( not ( = ?auto_24115 ?auto_24113 ) ) ( SURFACE-AT ?auto_24107 ?auto_24108 ) ( CLEAR ?auto_24107 ) ( IS-CRATE ?auto_24115 ) ( not ( = ?auto_24107 ?auto_24115 ) ) ( not ( = ?auto_24099 ?auto_24107 ) ) ( not ( = ?auto_24100 ?auto_24107 ) ) ( not ( = ?auto_24098 ?auto_24107 ) ) ( not ( = ?auto_24117 ?auto_24107 ) ) ( not ( = ?auto_24111 ?auto_24107 ) ) ( not ( = ?auto_24102 ?auto_24107 ) ) ( not ( = ?auto_24101 ?auto_24107 ) ) ( not ( = ?auto_24113 ?auto_24107 ) ) ( AVAILABLE ?auto_24114 ) ( not ( = ?auto_24112 ?auto_24108 ) ) ( not ( = ?auto_24116 ?auto_24112 ) ) ( not ( = ?auto_24104 ?auto_24112 ) ) ( not ( = ?auto_24103 ?auto_24112 ) ) ( HOIST-AT ?auto_24109 ?auto_24112 ) ( not ( = ?auto_24114 ?auto_24109 ) ) ( not ( = ?auto_24110 ?auto_24109 ) ) ( not ( = ?auto_24118 ?auto_24109 ) ) ( not ( = ?auto_24106 ?auto_24109 ) ) ( AVAILABLE ?auto_24109 ) ( SURFACE-AT ?auto_24115 ?auto_24112 ) ( ON ?auto_24115 ?auto_24105 ) ( CLEAR ?auto_24115 ) ( not ( = ?auto_24099 ?auto_24105 ) ) ( not ( = ?auto_24100 ?auto_24105 ) ) ( not ( = ?auto_24098 ?auto_24105 ) ) ( not ( = ?auto_24117 ?auto_24105 ) ) ( not ( = ?auto_24111 ?auto_24105 ) ) ( not ( = ?auto_24102 ?auto_24105 ) ) ( not ( = ?auto_24101 ?auto_24105 ) ) ( not ( = ?auto_24115 ?auto_24105 ) ) ( not ( = ?auto_24113 ?auto_24105 ) ) ( not ( = ?auto_24107 ?auto_24105 ) ) ( TRUCK-AT ?auto_24119 ?auto_24108 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24099 ?auto_24100 )
      ( MAKE-2CRATE-VERIFY ?auto_24098 ?auto_24099 ?auto_24100 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24120 - SURFACE
      ?auto_24121 - SURFACE
      ?auto_24122 - SURFACE
      ?auto_24123 - SURFACE
    )
    :vars
    (
      ?auto_24134 - HOIST
      ?auto_24132 - PLACE
      ?auto_24128 - PLACE
      ?auto_24135 - HOIST
      ?auto_24129 - SURFACE
      ?auto_24141 - PLACE
      ?auto_24137 - HOIST
      ?auto_24133 - SURFACE
      ?auto_24140 - SURFACE
      ?auto_24138 - SURFACE
      ?auto_24130 - PLACE
      ?auto_24125 - HOIST
      ?auto_24131 - SURFACE
      ?auto_24126 - SURFACE
      ?auto_24136 - PLACE
      ?auto_24127 - HOIST
      ?auto_24124 - SURFACE
      ?auto_24139 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24134 ?auto_24132 ) ( IS-CRATE ?auto_24123 ) ( not ( = ?auto_24122 ?auto_24123 ) ) ( not ( = ?auto_24121 ?auto_24122 ) ) ( not ( = ?auto_24121 ?auto_24123 ) ) ( not ( = ?auto_24128 ?auto_24132 ) ) ( HOIST-AT ?auto_24135 ?auto_24128 ) ( not ( = ?auto_24134 ?auto_24135 ) ) ( AVAILABLE ?auto_24135 ) ( SURFACE-AT ?auto_24123 ?auto_24128 ) ( ON ?auto_24123 ?auto_24129 ) ( CLEAR ?auto_24123 ) ( not ( = ?auto_24122 ?auto_24129 ) ) ( not ( = ?auto_24123 ?auto_24129 ) ) ( not ( = ?auto_24121 ?auto_24129 ) ) ( IS-CRATE ?auto_24122 ) ( not ( = ?auto_24141 ?auto_24132 ) ) ( not ( = ?auto_24128 ?auto_24141 ) ) ( HOIST-AT ?auto_24137 ?auto_24141 ) ( not ( = ?auto_24134 ?auto_24137 ) ) ( not ( = ?auto_24135 ?auto_24137 ) ) ( SURFACE-AT ?auto_24122 ?auto_24141 ) ( ON ?auto_24122 ?auto_24133 ) ( CLEAR ?auto_24122 ) ( not ( = ?auto_24122 ?auto_24133 ) ) ( not ( = ?auto_24123 ?auto_24133 ) ) ( not ( = ?auto_24121 ?auto_24133 ) ) ( not ( = ?auto_24129 ?auto_24133 ) ) ( IS-CRATE ?auto_24121 ) ( not ( = ?auto_24120 ?auto_24121 ) ) ( not ( = ?auto_24122 ?auto_24120 ) ) ( not ( = ?auto_24123 ?auto_24120 ) ) ( not ( = ?auto_24129 ?auto_24120 ) ) ( not ( = ?auto_24133 ?auto_24120 ) ) ( AVAILABLE ?auto_24137 ) ( SURFACE-AT ?auto_24121 ?auto_24141 ) ( ON ?auto_24121 ?auto_24140 ) ( CLEAR ?auto_24121 ) ( not ( = ?auto_24122 ?auto_24140 ) ) ( not ( = ?auto_24123 ?auto_24140 ) ) ( not ( = ?auto_24121 ?auto_24140 ) ) ( not ( = ?auto_24129 ?auto_24140 ) ) ( not ( = ?auto_24133 ?auto_24140 ) ) ( not ( = ?auto_24120 ?auto_24140 ) ) ( IS-CRATE ?auto_24120 ) ( not ( = ?auto_24138 ?auto_24120 ) ) ( not ( = ?auto_24122 ?auto_24138 ) ) ( not ( = ?auto_24123 ?auto_24138 ) ) ( not ( = ?auto_24121 ?auto_24138 ) ) ( not ( = ?auto_24129 ?auto_24138 ) ) ( not ( = ?auto_24133 ?auto_24138 ) ) ( not ( = ?auto_24140 ?auto_24138 ) ) ( not ( = ?auto_24130 ?auto_24132 ) ) ( not ( = ?auto_24128 ?auto_24130 ) ) ( not ( = ?auto_24141 ?auto_24130 ) ) ( HOIST-AT ?auto_24125 ?auto_24130 ) ( not ( = ?auto_24134 ?auto_24125 ) ) ( not ( = ?auto_24135 ?auto_24125 ) ) ( not ( = ?auto_24137 ?auto_24125 ) ) ( AVAILABLE ?auto_24125 ) ( SURFACE-AT ?auto_24120 ?auto_24130 ) ( ON ?auto_24120 ?auto_24131 ) ( CLEAR ?auto_24120 ) ( not ( = ?auto_24122 ?auto_24131 ) ) ( not ( = ?auto_24123 ?auto_24131 ) ) ( not ( = ?auto_24121 ?auto_24131 ) ) ( not ( = ?auto_24129 ?auto_24131 ) ) ( not ( = ?auto_24133 ?auto_24131 ) ) ( not ( = ?auto_24120 ?auto_24131 ) ) ( not ( = ?auto_24140 ?auto_24131 ) ) ( not ( = ?auto_24138 ?auto_24131 ) ) ( SURFACE-AT ?auto_24126 ?auto_24132 ) ( CLEAR ?auto_24126 ) ( IS-CRATE ?auto_24138 ) ( not ( = ?auto_24126 ?auto_24138 ) ) ( not ( = ?auto_24122 ?auto_24126 ) ) ( not ( = ?auto_24123 ?auto_24126 ) ) ( not ( = ?auto_24121 ?auto_24126 ) ) ( not ( = ?auto_24129 ?auto_24126 ) ) ( not ( = ?auto_24133 ?auto_24126 ) ) ( not ( = ?auto_24120 ?auto_24126 ) ) ( not ( = ?auto_24140 ?auto_24126 ) ) ( not ( = ?auto_24131 ?auto_24126 ) ) ( AVAILABLE ?auto_24134 ) ( not ( = ?auto_24136 ?auto_24132 ) ) ( not ( = ?auto_24128 ?auto_24136 ) ) ( not ( = ?auto_24141 ?auto_24136 ) ) ( not ( = ?auto_24130 ?auto_24136 ) ) ( HOIST-AT ?auto_24127 ?auto_24136 ) ( not ( = ?auto_24134 ?auto_24127 ) ) ( not ( = ?auto_24135 ?auto_24127 ) ) ( not ( = ?auto_24137 ?auto_24127 ) ) ( not ( = ?auto_24125 ?auto_24127 ) ) ( AVAILABLE ?auto_24127 ) ( SURFACE-AT ?auto_24138 ?auto_24136 ) ( ON ?auto_24138 ?auto_24124 ) ( CLEAR ?auto_24138 ) ( not ( = ?auto_24122 ?auto_24124 ) ) ( not ( = ?auto_24123 ?auto_24124 ) ) ( not ( = ?auto_24121 ?auto_24124 ) ) ( not ( = ?auto_24129 ?auto_24124 ) ) ( not ( = ?auto_24133 ?auto_24124 ) ) ( not ( = ?auto_24120 ?auto_24124 ) ) ( not ( = ?auto_24140 ?auto_24124 ) ) ( not ( = ?auto_24138 ?auto_24124 ) ) ( not ( = ?auto_24131 ?auto_24124 ) ) ( not ( = ?auto_24126 ?auto_24124 ) ) ( TRUCK-AT ?auto_24139 ?auto_24132 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24121 ?auto_24122 ?auto_24123 )
      ( MAKE-3CRATE-VERIFY ?auto_24120 ?auto_24121 ?auto_24122 ?auto_24123 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_24142 - SURFACE
      ?auto_24143 - SURFACE
      ?auto_24144 - SURFACE
      ?auto_24145 - SURFACE
      ?auto_24146 - SURFACE
    )
    :vars
    (
      ?auto_24157 - HOIST
      ?auto_24155 - PLACE
      ?auto_24151 - PLACE
      ?auto_24158 - HOIST
      ?auto_24152 - SURFACE
      ?auto_24163 - PLACE
      ?auto_24160 - HOIST
      ?auto_24156 - SURFACE
      ?auto_24162 - SURFACE
      ?auto_24153 - PLACE
      ?auto_24148 - HOIST
      ?auto_24154 - SURFACE
      ?auto_24149 - SURFACE
      ?auto_24159 - PLACE
      ?auto_24150 - HOIST
      ?auto_24147 - SURFACE
      ?auto_24161 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24157 ?auto_24155 ) ( IS-CRATE ?auto_24146 ) ( not ( = ?auto_24145 ?auto_24146 ) ) ( not ( = ?auto_24144 ?auto_24145 ) ) ( not ( = ?auto_24144 ?auto_24146 ) ) ( not ( = ?auto_24151 ?auto_24155 ) ) ( HOIST-AT ?auto_24158 ?auto_24151 ) ( not ( = ?auto_24157 ?auto_24158 ) ) ( AVAILABLE ?auto_24158 ) ( SURFACE-AT ?auto_24146 ?auto_24151 ) ( ON ?auto_24146 ?auto_24152 ) ( CLEAR ?auto_24146 ) ( not ( = ?auto_24145 ?auto_24152 ) ) ( not ( = ?auto_24146 ?auto_24152 ) ) ( not ( = ?auto_24144 ?auto_24152 ) ) ( IS-CRATE ?auto_24145 ) ( not ( = ?auto_24163 ?auto_24155 ) ) ( not ( = ?auto_24151 ?auto_24163 ) ) ( HOIST-AT ?auto_24160 ?auto_24163 ) ( not ( = ?auto_24157 ?auto_24160 ) ) ( not ( = ?auto_24158 ?auto_24160 ) ) ( SURFACE-AT ?auto_24145 ?auto_24163 ) ( ON ?auto_24145 ?auto_24156 ) ( CLEAR ?auto_24145 ) ( not ( = ?auto_24145 ?auto_24156 ) ) ( not ( = ?auto_24146 ?auto_24156 ) ) ( not ( = ?auto_24144 ?auto_24156 ) ) ( not ( = ?auto_24152 ?auto_24156 ) ) ( IS-CRATE ?auto_24144 ) ( not ( = ?auto_24143 ?auto_24144 ) ) ( not ( = ?auto_24145 ?auto_24143 ) ) ( not ( = ?auto_24146 ?auto_24143 ) ) ( not ( = ?auto_24152 ?auto_24143 ) ) ( not ( = ?auto_24156 ?auto_24143 ) ) ( AVAILABLE ?auto_24160 ) ( SURFACE-AT ?auto_24144 ?auto_24163 ) ( ON ?auto_24144 ?auto_24162 ) ( CLEAR ?auto_24144 ) ( not ( = ?auto_24145 ?auto_24162 ) ) ( not ( = ?auto_24146 ?auto_24162 ) ) ( not ( = ?auto_24144 ?auto_24162 ) ) ( not ( = ?auto_24152 ?auto_24162 ) ) ( not ( = ?auto_24156 ?auto_24162 ) ) ( not ( = ?auto_24143 ?auto_24162 ) ) ( IS-CRATE ?auto_24143 ) ( not ( = ?auto_24142 ?auto_24143 ) ) ( not ( = ?auto_24145 ?auto_24142 ) ) ( not ( = ?auto_24146 ?auto_24142 ) ) ( not ( = ?auto_24144 ?auto_24142 ) ) ( not ( = ?auto_24152 ?auto_24142 ) ) ( not ( = ?auto_24156 ?auto_24142 ) ) ( not ( = ?auto_24162 ?auto_24142 ) ) ( not ( = ?auto_24153 ?auto_24155 ) ) ( not ( = ?auto_24151 ?auto_24153 ) ) ( not ( = ?auto_24163 ?auto_24153 ) ) ( HOIST-AT ?auto_24148 ?auto_24153 ) ( not ( = ?auto_24157 ?auto_24148 ) ) ( not ( = ?auto_24158 ?auto_24148 ) ) ( not ( = ?auto_24160 ?auto_24148 ) ) ( AVAILABLE ?auto_24148 ) ( SURFACE-AT ?auto_24143 ?auto_24153 ) ( ON ?auto_24143 ?auto_24154 ) ( CLEAR ?auto_24143 ) ( not ( = ?auto_24145 ?auto_24154 ) ) ( not ( = ?auto_24146 ?auto_24154 ) ) ( not ( = ?auto_24144 ?auto_24154 ) ) ( not ( = ?auto_24152 ?auto_24154 ) ) ( not ( = ?auto_24156 ?auto_24154 ) ) ( not ( = ?auto_24143 ?auto_24154 ) ) ( not ( = ?auto_24162 ?auto_24154 ) ) ( not ( = ?auto_24142 ?auto_24154 ) ) ( SURFACE-AT ?auto_24149 ?auto_24155 ) ( CLEAR ?auto_24149 ) ( IS-CRATE ?auto_24142 ) ( not ( = ?auto_24149 ?auto_24142 ) ) ( not ( = ?auto_24145 ?auto_24149 ) ) ( not ( = ?auto_24146 ?auto_24149 ) ) ( not ( = ?auto_24144 ?auto_24149 ) ) ( not ( = ?auto_24152 ?auto_24149 ) ) ( not ( = ?auto_24156 ?auto_24149 ) ) ( not ( = ?auto_24143 ?auto_24149 ) ) ( not ( = ?auto_24162 ?auto_24149 ) ) ( not ( = ?auto_24154 ?auto_24149 ) ) ( AVAILABLE ?auto_24157 ) ( not ( = ?auto_24159 ?auto_24155 ) ) ( not ( = ?auto_24151 ?auto_24159 ) ) ( not ( = ?auto_24163 ?auto_24159 ) ) ( not ( = ?auto_24153 ?auto_24159 ) ) ( HOIST-AT ?auto_24150 ?auto_24159 ) ( not ( = ?auto_24157 ?auto_24150 ) ) ( not ( = ?auto_24158 ?auto_24150 ) ) ( not ( = ?auto_24160 ?auto_24150 ) ) ( not ( = ?auto_24148 ?auto_24150 ) ) ( AVAILABLE ?auto_24150 ) ( SURFACE-AT ?auto_24142 ?auto_24159 ) ( ON ?auto_24142 ?auto_24147 ) ( CLEAR ?auto_24142 ) ( not ( = ?auto_24145 ?auto_24147 ) ) ( not ( = ?auto_24146 ?auto_24147 ) ) ( not ( = ?auto_24144 ?auto_24147 ) ) ( not ( = ?auto_24152 ?auto_24147 ) ) ( not ( = ?auto_24156 ?auto_24147 ) ) ( not ( = ?auto_24143 ?auto_24147 ) ) ( not ( = ?auto_24162 ?auto_24147 ) ) ( not ( = ?auto_24142 ?auto_24147 ) ) ( not ( = ?auto_24154 ?auto_24147 ) ) ( not ( = ?auto_24149 ?auto_24147 ) ) ( TRUCK-AT ?auto_24161 ?auto_24155 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24144 ?auto_24145 ?auto_24146 )
      ( MAKE-4CRATE-VERIFY ?auto_24142 ?auto_24143 ?auto_24144 ?auto_24145 ?auto_24146 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_24164 - SURFACE
      ?auto_24165 - SURFACE
      ?auto_24166 - SURFACE
      ?auto_24167 - SURFACE
      ?auto_24168 - SURFACE
      ?auto_24169 - SURFACE
    )
    :vars
    (
      ?auto_24179 - HOIST
      ?auto_24177 - PLACE
      ?auto_24173 - PLACE
      ?auto_24180 - HOIST
      ?auto_24174 - SURFACE
      ?auto_24185 - PLACE
      ?auto_24182 - HOIST
      ?auto_24178 - SURFACE
      ?auto_24184 - SURFACE
      ?auto_24175 - PLACE
      ?auto_24171 - HOIST
      ?auto_24176 - SURFACE
      ?auto_24181 - PLACE
      ?auto_24172 - HOIST
      ?auto_24170 - SURFACE
      ?auto_24183 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24179 ?auto_24177 ) ( IS-CRATE ?auto_24169 ) ( not ( = ?auto_24168 ?auto_24169 ) ) ( not ( = ?auto_24167 ?auto_24168 ) ) ( not ( = ?auto_24167 ?auto_24169 ) ) ( not ( = ?auto_24173 ?auto_24177 ) ) ( HOIST-AT ?auto_24180 ?auto_24173 ) ( not ( = ?auto_24179 ?auto_24180 ) ) ( AVAILABLE ?auto_24180 ) ( SURFACE-AT ?auto_24169 ?auto_24173 ) ( ON ?auto_24169 ?auto_24174 ) ( CLEAR ?auto_24169 ) ( not ( = ?auto_24168 ?auto_24174 ) ) ( not ( = ?auto_24169 ?auto_24174 ) ) ( not ( = ?auto_24167 ?auto_24174 ) ) ( IS-CRATE ?auto_24168 ) ( not ( = ?auto_24185 ?auto_24177 ) ) ( not ( = ?auto_24173 ?auto_24185 ) ) ( HOIST-AT ?auto_24182 ?auto_24185 ) ( not ( = ?auto_24179 ?auto_24182 ) ) ( not ( = ?auto_24180 ?auto_24182 ) ) ( SURFACE-AT ?auto_24168 ?auto_24185 ) ( ON ?auto_24168 ?auto_24178 ) ( CLEAR ?auto_24168 ) ( not ( = ?auto_24168 ?auto_24178 ) ) ( not ( = ?auto_24169 ?auto_24178 ) ) ( not ( = ?auto_24167 ?auto_24178 ) ) ( not ( = ?auto_24174 ?auto_24178 ) ) ( IS-CRATE ?auto_24167 ) ( not ( = ?auto_24166 ?auto_24167 ) ) ( not ( = ?auto_24168 ?auto_24166 ) ) ( not ( = ?auto_24169 ?auto_24166 ) ) ( not ( = ?auto_24174 ?auto_24166 ) ) ( not ( = ?auto_24178 ?auto_24166 ) ) ( AVAILABLE ?auto_24182 ) ( SURFACE-AT ?auto_24167 ?auto_24185 ) ( ON ?auto_24167 ?auto_24184 ) ( CLEAR ?auto_24167 ) ( not ( = ?auto_24168 ?auto_24184 ) ) ( not ( = ?auto_24169 ?auto_24184 ) ) ( not ( = ?auto_24167 ?auto_24184 ) ) ( not ( = ?auto_24174 ?auto_24184 ) ) ( not ( = ?auto_24178 ?auto_24184 ) ) ( not ( = ?auto_24166 ?auto_24184 ) ) ( IS-CRATE ?auto_24166 ) ( not ( = ?auto_24165 ?auto_24166 ) ) ( not ( = ?auto_24168 ?auto_24165 ) ) ( not ( = ?auto_24169 ?auto_24165 ) ) ( not ( = ?auto_24167 ?auto_24165 ) ) ( not ( = ?auto_24174 ?auto_24165 ) ) ( not ( = ?auto_24178 ?auto_24165 ) ) ( not ( = ?auto_24184 ?auto_24165 ) ) ( not ( = ?auto_24175 ?auto_24177 ) ) ( not ( = ?auto_24173 ?auto_24175 ) ) ( not ( = ?auto_24185 ?auto_24175 ) ) ( HOIST-AT ?auto_24171 ?auto_24175 ) ( not ( = ?auto_24179 ?auto_24171 ) ) ( not ( = ?auto_24180 ?auto_24171 ) ) ( not ( = ?auto_24182 ?auto_24171 ) ) ( AVAILABLE ?auto_24171 ) ( SURFACE-AT ?auto_24166 ?auto_24175 ) ( ON ?auto_24166 ?auto_24176 ) ( CLEAR ?auto_24166 ) ( not ( = ?auto_24168 ?auto_24176 ) ) ( not ( = ?auto_24169 ?auto_24176 ) ) ( not ( = ?auto_24167 ?auto_24176 ) ) ( not ( = ?auto_24174 ?auto_24176 ) ) ( not ( = ?auto_24178 ?auto_24176 ) ) ( not ( = ?auto_24166 ?auto_24176 ) ) ( not ( = ?auto_24184 ?auto_24176 ) ) ( not ( = ?auto_24165 ?auto_24176 ) ) ( SURFACE-AT ?auto_24164 ?auto_24177 ) ( CLEAR ?auto_24164 ) ( IS-CRATE ?auto_24165 ) ( not ( = ?auto_24164 ?auto_24165 ) ) ( not ( = ?auto_24168 ?auto_24164 ) ) ( not ( = ?auto_24169 ?auto_24164 ) ) ( not ( = ?auto_24167 ?auto_24164 ) ) ( not ( = ?auto_24174 ?auto_24164 ) ) ( not ( = ?auto_24178 ?auto_24164 ) ) ( not ( = ?auto_24166 ?auto_24164 ) ) ( not ( = ?auto_24184 ?auto_24164 ) ) ( not ( = ?auto_24176 ?auto_24164 ) ) ( AVAILABLE ?auto_24179 ) ( not ( = ?auto_24181 ?auto_24177 ) ) ( not ( = ?auto_24173 ?auto_24181 ) ) ( not ( = ?auto_24185 ?auto_24181 ) ) ( not ( = ?auto_24175 ?auto_24181 ) ) ( HOIST-AT ?auto_24172 ?auto_24181 ) ( not ( = ?auto_24179 ?auto_24172 ) ) ( not ( = ?auto_24180 ?auto_24172 ) ) ( not ( = ?auto_24182 ?auto_24172 ) ) ( not ( = ?auto_24171 ?auto_24172 ) ) ( AVAILABLE ?auto_24172 ) ( SURFACE-AT ?auto_24165 ?auto_24181 ) ( ON ?auto_24165 ?auto_24170 ) ( CLEAR ?auto_24165 ) ( not ( = ?auto_24168 ?auto_24170 ) ) ( not ( = ?auto_24169 ?auto_24170 ) ) ( not ( = ?auto_24167 ?auto_24170 ) ) ( not ( = ?auto_24174 ?auto_24170 ) ) ( not ( = ?auto_24178 ?auto_24170 ) ) ( not ( = ?auto_24166 ?auto_24170 ) ) ( not ( = ?auto_24184 ?auto_24170 ) ) ( not ( = ?auto_24165 ?auto_24170 ) ) ( not ( = ?auto_24176 ?auto_24170 ) ) ( not ( = ?auto_24164 ?auto_24170 ) ) ( TRUCK-AT ?auto_24183 ?auto_24177 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24167 ?auto_24168 ?auto_24169 )
      ( MAKE-5CRATE-VERIFY ?auto_24164 ?auto_24165 ?auto_24166 ?auto_24167 ?auto_24168 ?auto_24169 ) )
  )

)

