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
      ?auto_17074 - SURFACE
      ?auto_17075 - SURFACE
    )
    :vars
    (
      ?auto_17076 - HOIST
      ?auto_17077 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17076 ?auto_17077 ) ( SURFACE-AT ?auto_17075 ?auto_17077 ) ( CLEAR ?auto_17075 ) ( LIFTING ?auto_17076 ?auto_17074 ) ( IS-CRATE ?auto_17074 ) ( not ( = ?auto_17074 ?auto_17075 ) ) )
    :subtasks
    ( ( !DROP ?auto_17076 ?auto_17074 ?auto_17075 ?auto_17077 )
      ( MAKE-ON-VERIFY ?auto_17074 ?auto_17075 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17078 - SURFACE
      ?auto_17079 - SURFACE
    )
    :vars
    (
      ?auto_17080 - HOIST
      ?auto_17081 - PLACE
      ?auto_17082 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17080 ?auto_17081 ) ( SURFACE-AT ?auto_17079 ?auto_17081 ) ( CLEAR ?auto_17079 ) ( IS-CRATE ?auto_17078 ) ( not ( = ?auto_17078 ?auto_17079 ) ) ( TRUCK-AT ?auto_17082 ?auto_17081 ) ( AVAILABLE ?auto_17080 ) ( IN ?auto_17078 ?auto_17082 ) )
    :subtasks
    ( ( !UNLOAD ?auto_17080 ?auto_17078 ?auto_17082 ?auto_17081 )
      ( MAKE-ON ?auto_17078 ?auto_17079 )
      ( MAKE-ON-VERIFY ?auto_17078 ?auto_17079 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17083 - SURFACE
      ?auto_17084 - SURFACE
    )
    :vars
    (
      ?auto_17087 - HOIST
      ?auto_17085 - PLACE
      ?auto_17086 - TRUCK
      ?auto_17088 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17087 ?auto_17085 ) ( SURFACE-AT ?auto_17084 ?auto_17085 ) ( CLEAR ?auto_17084 ) ( IS-CRATE ?auto_17083 ) ( not ( = ?auto_17083 ?auto_17084 ) ) ( AVAILABLE ?auto_17087 ) ( IN ?auto_17083 ?auto_17086 ) ( TRUCK-AT ?auto_17086 ?auto_17088 ) ( not ( = ?auto_17088 ?auto_17085 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17086 ?auto_17088 ?auto_17085 )
      ( MAKE-ON ?auto_17083 ?auto_17084 )
      ( MAKE-ON-VERIFY ?auto_17083 ?auto_17084 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17089 - SURFACE
      ?auto_17090 - SURFACE
    )
    :vars
    (
      ?auto_17093 - HOIST
      ?auto_17094 - PLACE
      ?auto_17091 - TRUCK
      ?auto_17092 - PLACE
      ?auto_17095 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17093 ?auto_17094 ) ( SURFACE-AT ?auto_17090 ?auto_17094 ) ( CLEAR ?auto_17090 ) ( IS-CRATE ?auto_17089 ) ( not ( = ?auto_17089 ?auto_17090 ) ) ( AVAILABLE ?auto_17093 ) ( TRUCK-AT ?auto_17091 ?auto_17092 ) ( not ( = ?auto_17092 ?auto_17094 ) ) ( HOIST-AT ?auto_17095 ?auto_17092 ) ( LIFTING ?auto_17095 ?auto_17089 ) ( not ( = ?auto_17093 ?auto_17095 ) ) )
    :subtasks
    ( ( !LOAD ?auto_17095 ?auto_17089 ?auto_17091 ?auto_17092 )
      ( MAKE-ON ?auto_17089 ?auto_17090 )
      ( MAKE-ON-VERIFY ?auto_17089 ?auto_17090 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17096 - SURFACE
      ?auto_17097 - SURFACE
    )
    :vars
    (
      ?auto_17099 - HOIST
      ?auto_17101 - PLACE
      ?auto_17102 - TRUCK
      ?auto_17098 - PLACE
      ?auto_17100 - HOIST
      ?auto_17103 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17099 ?auto_17101 ) ( SURFACE-AT ?auto_17097 ?auto_17101 ) ( CLEAR ?auto_17097 ) ( IS-CRATE ?auto_17096 ) ( not ( = ?auto_17096 ?auto_17097 ) ) ( AVAILABLE ?auto_17099 ) ( TRUCK-AT ?auto_17102 ?auto_17098 ) ( not ( = ?auto_17098 ?auto_17101 ) ) ( HOIST-AT ?auto_17100 ?auto_17098 ) ( not ( = ?auto_17099 ?auto_17100 ) ) ( AVAILABLE ?auto_17100 ) ( SURFACE-AT ?auto_17096 ?auto_17098 ) ( ON ?auto_17096 ?auto_17103 ) ( CLEAR ?auto_17096 ) ( not ( = ?auto_17096 ?auto_17103 ) ) ( not ( = ?auto_17097 ?auto_17103 ) ) )
    :subtasks
    ( ( !LIFT ?auto_17100 ?auto_17096 ?auto_17103 ?auto_17098 )
      ( MAKE-ON ?auto_17096 ?auto_17097 )
      ( MAKE-ON-VERIFY ?auto_17096 ?auto_17097 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17104 - SURFACE
      ?auto_17105 - SURFACE
    )
    :vars
    (
      ?auto_17107 - HOIST
      ?auto_17109 - PLACE
      ?auto_17108 - PLACE
      ?auto_17111 - HOIST
      ?auto_17110 - SURFACE
      ?auto_17106 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17107 ?auto_17109 ) ( SURFACE-AT ?auto_17105 ?auto_17109 ) ( CLEAR ?auto_17105 ) ( IS-CRATE ?auto_17104 ) ( not ( = ?auto_17104 ?auto_17105 ) ) ( AVAILABLE ?auto_17107 ) ( not ( = ?auto_17108 ?auto_17109 ) ) ( HOIST-AT ?auto_17111 ?auto_17108 ) ( not ( = ?auto_17107 ?auto_17111 ) ) ( AVAILABLE ?auto_17111 ) ( SURFACE-AT ?auto_17104 ?auto_17108 ) ( ON ?auto_17104 ?auto_17110 ) ( CLEAR ?auto_17104 ) ( not ( = ?auto_17104 ?auto_17110 ) ) ( not ( = ?auto_17105 ?auto_17110 ) ) ( TRUCK-AT ?auto_17106 ?auto_17109 ) )
    :subtasks
    ( ( !DRIVE ?auto_17106 ?auto_17109 ?auto_17108 )
      ( MAKE-ON ?auto_17104 ?auto_17105 )
      ( MAKE-ON-VERIFY ?auto_17104 ?auto_17105 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17152 - SURFACE
      ?auto_17153 - SURFACE
    )
    :vars
    (
      ?auto_17155 - HOIST
      ?auto_17158 - PLACE
      ?auto_17156 - PLACE
      ?auto_17157 - HOIST
      ?auto_17154 - SURFACE
      ?auto_17159 - TRUCK
      ?auto_17160 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17155 ?auto_17158 ) ( IS-CRATE ?auto_17152 ) ( not ( = ?auto_17152 ?auto_17153 ) ) ( not ( = ?auto_17156 ?auto_17158 ) ) ( HOIST-AT ?auto_17157 ?auto_17156 ) ( not ( = ?auto_17155 ?auto_17157 ) ) ( AVAILABLE ?auto_17157 ) ( SURFACE-AT ?auto_17152 ?auto_17156 ) ( ON ?auto_17152 ?auto_17154 ) ( CLEAR ?auto_17152 ) ( not ( = ?auto_17152 ?auto_17154 ) ) ( not ( = ?auto_17153 ?auto_17154 ) ) ( TRUCK-AT ?auto_17159 ?auto_17158 ) ( SURFACE-AT ?auto_17160 ?auto_17158 ) ( CLEAR ?auto_17160 ) ( LIFTING ?auto_17155 ?auto_17153 ) ( IS-CRATE ?auto_17153 ) ( not ( = ?auto_17152 ?auto_17160 ) ) ( not ( = ?auto_17153 ?auto_17160 ) ) ( not ( = ?auto_17154 ?auto_17160 ) ) )
    :subtasks
    ( ( !DROP ?auto_17155 ?auto_17153 ?auto_17160 ?auto_17158 )
      ( MAKE-ON ?auto_17152 ?auto_17153 )
      ( MAKE-ON-VERIFY ?auto_17152 ?auto_17153 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17161 - SURFACE
      ?auto_17162 - SURFACE
    )
    :vars
    (
      ?auto_17166 - HOIST
      ?auto_17163 - PLACE
      ?auto_17164 - PLACE
      ?auto_17167 - HOIST
      ?auto_17165 - SURFACE
      ?auto_17168 - TRUCK
      ?auto_17169 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17166 ?auto_17163 ) ( IS-CRATE ?auto_17161 ) ( not ( = ?auto_17161 ?auto_17162 ) ) ( not ( = ?auto_17164 ?auto_17163 ) ) ( HOIST-AT ?auto_17167 ?auto_17164 ) ( not ( = ?auto_17166 ?auto_17167 ) ) ( AVAILABLE ?auto_17167 ) ( SURFACE-AT ?auto_17161 ?auto_17164 ) ( ON ?auto_17161 ?auto_17165 ) ( CLEAR ?auto_17161 ) ( not ( = ?auto_17161 ?auto_17165 ) ) ( not ( = ?auto_17162 ?auto_17165 ) ) ( TRUCK-AT ?auto_17168 ?auto_17163 ) ( SURFACE-AT ?auto_17169 ?auto_17163 ) ( CLEAR ?auto_17169 ) ( IS-CRATE ?auto_17162 ) ( not ( = ?auto_17161 ?auto_17169 ) ) ( not ( = ?auto_17162 ?auto_17169 ) ) ( not ( = ?auto_17165 ?auto_17169 ) ) ( AVAILABLE ?auto_17166 ) ( IN ?auto_17162 ?auto_17168 ) )
    :subtasks
    ( ( !UNLOAD ?auto_17166 ?auto_17162 ?auto_17168 ?auto_17163 )
      ( MAKE-ON ?auto_17161 ?auto_17162 )
      ( MAKE-ON-VERIFY ?auto_17161 ?auto_17162 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17176 - SURFACE
      ?auto_17177 - SURFACE
    )
    :vars
    (
      ?auto_17178 - HOIST
      ?auto_17179 - PLACE
      ?auto_17182 - PLACE
      ?auto_17180 - HOIST
      ?auto_17181 - SURFACE
      ?auto_17183 - TRUCK
      ?auto_17184 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17178 ?auto_17179 ) ( SURFACE-AT ?auto_17177 ?auto_17179 ) ( CLEAR ?auto_17177 ) ( IS-CRATE ?auto_17176 ) ( not ( = ?auto_17176 ?auto_17177 ) ) ( AVAILABLE ?auto_17178 ) ( not ( = ?auto_17182 ?auto_17179 ) ) ( HOIST-AT ?auto_17180 ?auto_17182 ) ( not ( = ?auto_17178 ?auto_17180 ) ) ( AVAILABLE ?auto_17180 ) ( SURFACE-AT ?auto_17176 ?auto_17182 ) ( ON ?auto_17176 ?auto_17181 ) ( CLEAR ?auto_17176 ) ( not ( = ?auto_17176 ?auto_17181 ) ) ( not ( = ?auto_17177 ?auto_17181 ) ) ( TRUCK-AT ?auto_17183 ?auto_17184 ) ( not ( = ?auto_17184 ?auto_17179 ) ) ( not ( = ?auto_17182 ?auto_17184 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17183 ?auto_17184 ?auto_17179 )
      ( MAKE-ON ?auto_17176 ?auto_17177 )
      ( MAKE-ON-VERIFY ?auto_17176 ?auto_17177 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17821 - SURFACE
      ?auto_17822 - SURFACE
    )
    :vars
    (
      ?auto_17824 - HOIST
      ?auto_17823 - PLACE
      ?auto_17828 - TRUCK
      ?auto_17826 - PLACE
      ?auto_17825 - HOIST
      ?auto_17827 - SURFACE
      ?auto_17829 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17824 ?auto_17823 ) ( SURFACE-AT ?auto_17822 ?auto_17823 ) ( CLEAR ?auto_17822 ) ( IS-CRATE ?auto_17821 ) ( not ( = ?auto_17821 ?auto_17822 ) ) ( AVAILABLE ?auto_17824 ) ( TRUCK-AT ?auto_17828 ?auto_17826 ) ( not ( = ?auto_17826 ?auto_17823 ) ) ( HOIST-AT ?auto_17825 ?auto_17826 ) ( not ( = ?auto_17824 ?auto_17825 ) ) ( SURFACE-AT ?auto_17821 ?auto_17826 ) ( ON ?auto_17821 ?auto_17827 ) ( CLEAR ?auto_17821 ) ( not ( = ?auto_17821 ?auto_17827 ) ) ( not ( = ?auto_17822 ?auto_17827 ) ) ( LIFTING ?auto_17825 ?auto_17829 ) ( IS-CRATE ?auto_17829 ) ( not ( = ?auto_17821 ?auto_17829 ) ) ( not ( = ?auto_17822 ?auto_17829 ) ) ( not ( = ?auto_17827 ?auto_17829 ) ) )
    :subtasks
    ( ( !LOAD ?auto_17825 ?auto_17829 ?auto_17828 ?auto_17826 )
      ( MAKE-ON ?auto_17821 ?auto_17822 )
      ( MAKE-ON-VERIFY ?auto_17821 ?auto_17822 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17985 - SURFACE
      ?auto_17986 - SURFACE
    )
    :vars
    (
      ?auto_17988 - HOIST
      ?auto_17991 - PLACE
      ?auto_17987 - PLACE
      ?auto_17989 - HOIST
      ?auto_17990 - SURFACE
      ?auto_17992 - TRUCK
      ?auto_17993 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17988 ?auto_17991 ) ( SURFACE-AT ?auto_17986 ?auto_17991 ) ( CLEAR ?auto_17986 ) ( IS-CRATE ?auto_17985 ) ( not ( = ?auto_17985 ?auto_17986 ) ) ( not ( = ?auto_17987 ?auto_17991 ) ) ( HOIST-AT ?auto_17989 ?auto_17987 ) ( not ( = ?auto_17988 ?auto_17989 ) ) ( AVAILABLE ?auto_17989 ) ( SURFACE-AT ?auto_17985 ?auto_17987 ) ( ON ?auto_17985 ?auto_17990 ) ( CLEAR ?auto_17985 ) ( not ( = ?auto_17985 ?auto_17990 ) ) ( not ( = ?auto_17986 ?auto_17990 ) ) ( TRUCK-AT ?auto_17992 ?auto_17991 ) ( LIFTING ?auto_17988 ?auto_17993 ) ( IS-CRATE ?auto_17993 ) ( not ( = ?auto_17985 ?auto_17993 ) ) ( not ( = ?auto_17986 ?auto_17993 ) ) ( not ( = ?auto_17990 ?auto_17993 ) ) )
    :subtasks
    ( ( !LOAD ?auto_17988 ?auto_17993 ?auto_17992 ?auto_17991 )
      ( MAKE-ON ?auto_17985 ?auto_17986 )
      ( MAKE-ON-VERIFY ?auto_17985 ?auto_17986 ) )
  )

)

