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

  ( :method MAKE-14CRATE-VERIFY
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
      ?c14 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( CLEAR ?c14 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-15CRATE-VERIFY
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
      ?c14 - SURFACE
      ?c15 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( CLEAR ?c15 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22088 - SURFACE
      ?auto_22089 - SURFACE
    )
    :vars
    (
      ?auto_22090 - HOIST
      ?auto_22091 - PLACE
      ?auto_22093 - PLACE
      ?auto_22094 - HOIST
      ?auto_22095 - SURFACE
      ?auto_22092 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22090 ?auto_22091 ) ( SURFACE-AT ?auto_22088 ?auto_22091 ) ( CLEAR ?auto_22088 ) ( IS-CRATE ?auto_22089 ) ( AVAILABLE ?auto_22090 ) ( not ( = ?auto_22093 ?auto_22091 ) ) ( HOIST-AT ?auto_22094 ?auto_22093 ) ( AVAILABLE ?auto_22094 ) ( SURFACE-AT ?auto_22089 ?auto_22093 ) ( ON ?auto_22089 ?auto_22095 ) ( CLEAR ?auto_22089 ) ( TRUCK-AT ?auto_22092 ?auto_22091 ) ( not ( = ?auto_22088 ?auto_22089 ) ) ( not ( = ?auto_22088 ?auto_22095 ) ) ( not ( = ?auto_22089 ?auto_22095 ) ) ( not ( = ?auto_22090 ?auto_22094 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22092 ?auto_22091 ?auto_22093 )
      ( !LIFT ?auto_22094 ?auto_22089 ?auto_22095 ?auto_22093 )
      ( !LOAD ?auto_22094 ?auto_22089 ?auto_22092 ?auto_22093 )
      ( !DRIVE ?auto_22092 ?auto_22093 ?auto_22091 )
      ( !UNLOAD ?auto_22090 ?auto_22089 ?auto_22092 ?auto_22091 )
      ( !DROP ?auto_22090 ?auto_22089 ?auto_22088 ?auto_22091 )
      ( MAKE-1CRATE-VERIFY ?auto_22088 ?auto_22089 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22109 - SURFACE
      ?auto_22110 - SURFACE
      ?auto_22111 - SURFACE
    )
    :vars
    (
      ?auto_22117 - HOIST
      ?auto_22115 - PLACE
      ?auto_22114 - PLACE
      ?auto_22112 - HOIST
      ?auto_22116 - SURFACE
      ?auto_22120 - PLACE
      ?auto_22118 - HOIST
      ?auto_22119 - SURFACE
      ?auto_22113 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22117 ?auto_22115 ) ( IS-CRATE ?auto_22111 ) ( not ( = ?auto_22114 ?auto_22115 ) ) ( HOIST-AT ?auto_22112 ?auto_22114 ) ( AVAILABLE ?auto_22112 ) ( SURFACE-AT ?auto_22111 ?auto_22114 ) ( ON ?auto_22111 ?auto_22116 ) ( CLEAR ?auto_22111 ) ( not ( = ?auto_22110 ?auto_22111 ) ) ( not ( = ?auto_22110 ?auto_22116 ) ) ( not ( = ?auto_22111 ?auto_22116 ) ) ( not ( = ?auto_22117 ?auto_22112 ) ) ( SURFACE-AT ?auto_22109 ?auto_22115 ) ( CLEAR ?auto_22109 ) ( IS-CRATE ?auto_22110 ) ( AVAILABLE ?auto_22117 ) ( not ( = ?auto_22120 ?auto_22115 ) ) ( HOIST-AT ?auto_22118 ?auto_22120 ) ( AVAILABLE ?auto_22118 ) ( SURFACE-AT ?auto_22110 ?auto_22120 ) ( ON ?auto_22110 ?auto_22119 ) ( CLEAR ?auto_22110 ) ( TRUCK-AT ?auto_22113 ?auto_22115 ) ( not ( = ?auto_22109 ?auto_22110 ) ) ( not ( = ?auto_22109 ?auto_22119 ) ) ( not ( = ?auto_22110 ?auto_22119 ) ) ( not ( = ?auto_22117 ?auto_22118 ) ) ( not ( = ?auto_22109 ?auto_22111 ) ) ( not ( = ?auto_22109 ?auto_22116 ) ) ( not ( = ?auto_22111 ?auto_22119 ) ) ( not ( = ?auto_22114 ?auto_22120 ) ) ( not ( = ?auto_22112 ?auto_22118 ) ) ( not ( = ?auto_22116 ?auto_22119 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22109 ?auto_22110 )
      ( MAKE-1CRATE ?auto_22110 ?auto_22111 )
      ( MAKE-2CRATE-VERIFY ?auto_22109 ?auto_22110 ?auto_22111 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22135 - SURFACE
      ?auto_22136 - SURFACE
      ?auto_22137 - SURFACE
      ?auto_22138 - SURFACE
    )
    :vars
    (
      ?auto_22140 - HOIST
      ?auto_22142 - PLACE
      ?auto_22141 - PLACE
      ?auto_22143 - HOIST
      ?auto_22144 - SURFACE
      ?auto_22147 - PLACE
      ?auto_22145 - HOIST
      ?auto_22146 - SURFACE
      ?auto_22150 - PLACE
      ?auto_22149 - HOIST
      ?auto_22148 - SURFACE
      ?auto_22139 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22140 ?auto_22142 ) ( IS-CRATE ?auto_22138 ) ( not ( = ?auto_22141 ?auto_22142 ) ) ( HOIST-AT ?auto_22143 ?auto_22141 ) ( AVAILABLE ?auto_22143 ) ( SURFACE-AT ?auto_22138 ?auto_22141 ) ( ON ?auto_22138 ?auto_22144 ) ( CLEAR ?auto_22138 ) ( not ( = ?auto_22137 ?auto_22138 ) ) ( not ( = ?auto_22137 ?auto_22144 ) ) ( not ( = ?auto_22138 ?auto_22144 ) ) ( not ( = ?auto_22140 ?auto_22143 ) ) ( IS-CRATE ?auto_22137 ) ( not ( = ?auto_22147 ?auto_22142 ) ) ( HOIST-AT ?auto_22145 ?auto_22147 ) ( AVAILABLE ?auto_22145 ) ( SURFACE-AT ?auto_22137 ?auto_22147 ) ( ON ?auto_22137 ?auto_22146 ) ( CLEAR ?auto_22137 ) ( not ( = ?auto_22136 ?auto_22137 ) ) ( not ( = ?auto_22136 ?auto_22146 ) ) ( not ( = ?auto_22137 ?auto_22146 ) ) ( not ( = ?auto_22140 ?auto_22145 ) ) ( SURFACE-AT ?auto_22135 ?auto_22142 ) ( CLEAR ?auto_22135 ) ( IS-CRATE ?auto_22136 ) ( AVAILABLE ?auto_22140 ) ( not ( = ?auto_22150 ?auto_22142 ) ) ( HOIST-AT ?auto_22149 ?auto_22150 ) ( AVAILABLE ?auto_22149 ) ( SURFACE-AT ?auto_22136 ?auto_22150 ) ( ON ?auto_22136 ?auto_22148 ) ( CLEAR ?auto_22136 ) ( TRUCK-AT ?auto_22139 ?auto_22142 ) ( not ( = ?auto_22135 ?auto_22136 ) ) ( not ( = ?auto_22135 ?auto_22148 ) ) ( not ( = ?auto_22136 ?auto_22148 ) ) ( not ( = ?auto_22140 ?auto_22149 ) ) ( not ( = ?auto_22135 ?auto_22137 ) ) ( not ( = ?auto_22135 ?auto_22146 ) ) ( not ( = ?auto_22137 ?auto_22148 ) ) ( not ( = ?auto_22147 ?auto_22150 ) ) ( not ( = ?auto_22145 ?auto_22149 ) ) ( not ( = ?auto_22146 ?auto_22148 ) ) ( not ( = ?auto_22135 ?auto_22138 ) ) ( not ( = ?auto_22135 ?auto_22144 ) ) ( not ( = ?auto_22136 ?auto_22138 ) ) ( not ( = ?auto_22136 ?auto_22144 ) ) ( not ( = ?auto_22138 ?auto_22146 ) ) ( not ( = ?auto_22138 ?auto_22148 ) ) ( not ( = ?auto_22141 ?auto_22147 ) ) ( not ( = ?auto_22141 ?auto_22150 ) ) ( not ( = ?auto_22143 ?auto_22145 ) ) ( not ( = ?auto_22143 ?auto_22149 ) ) ( not ( = ?auto_22144 ?auto_22146 ) ) ( not ( = ?auto_22144 ?auto_22148 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22135 ?auto_22136 ?auto_22137 )
      ( MAKE-1CRATE ?auto_22137 ?auto_22138 )
      ( MAKE-3CRATE-VERIFY ?auto_22135 ?auto_22136 ?auto_22137 ?auto_22138 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22166 - SURFACE
      ?auto_22167 - SURFACE
      ?auto_22168 - SURFACE
      ?auto_22169 - SURFACE
      ?auto_22170 - SURFACE
    )
    :vars
    (
      ?auto_22175 - HOIST
      ?auto_22174 - PLACE
      ?auto_22173 - PLACE
      ?auto_22176 - HOIST
      ?auto_22172 - SURFACE
      ?auto_22179 - PLACE
      ?auto_22180 - HOIST
      ?auto_22184 - SURFACE
      ?auto_22182 - PLACE
      ?auto_22177 - HOIST
      ?auto_22181 - SURFACE
      ?auto_22185 - PLACE
      ?auto_22183 - HOIST
      ?auto_22178 - SURFACE
      ?auto_22171 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22175 ?auto_22174 ) ( IS-CRATE ?auto_22170 ) ( not ( = ?auto_22173 ?auto_22174 ) ) ( HOIST-AT ?auto_22176 ?auto_22173 ) ( AVAILABLE ?auto_22176 ) ( SURFACE-AT ?auto_22170 ?auto_22173 ) ( ON ?auto_22170 ?auto_22172 ) ( CLEAR ?auto_22170 ) ( not ( = ?auto_22169 ?auto_22170 ) ) ( not ( = ?auto_22169 ?auto_22172 ) ) ( not ( = ?auto_22170 ?auto_22172 ) ) ( not ( = ?auto_22175 ?auto_22176 ) ) ( IS-CRATE ?auto_22169 ) ( not ( = ?auto_22179 ?auto_22174 ) ) ( HOIST-AT ?auto_22180 ?auto_22179 ) ( AVAILABLE ?auto_22180 ) ( SURFACE-AT ?auto_22169 ?auto_22179 ) ( ON ?auto_22169 ?auto_22184 ) ( CLEAR ?auto_22169 ) ( not ( = ?auto_22168 ?auto_22169 ) ) ( not ( = ?auto_22168 ?auto_22184 ) ) ( not ( = ?auto_22169 ?auto_22184 ) ) ( not ( = ?auto_22175 ?auto_22180 ) ) ( IS-CRATE ?auto_22168 ) ( not ( = ?auto_22182 ?auto_22174 ) ) ( HOIST-AT ?auto_22177 ?auto_22182 ) ( AVAILABLE ?auto_22177 ) ( SURFACE-AT ?auto_22168 ?auto_22182 ) ( ON ?auto_22168 ?auto_22181 ) ( CLEAR ?auto_22168 ) ( not ( = ?auto_22167 ?auto_22168 ) ) ( not ( = ?auto_22167 ?auto_22181 ) ) ( not ( = ?auto_22168 ?auto_22181 ) ) ( not ( = ?auto_22175 ?auto_22177 ) ) ( SURFACE-AT ?auto_22166 ?auto_22174 ) ( CLEAR ?auto_22166 ) ( IS-CRATE ?auto_22167 ) ( AVAILABLE ?auto_22175 ) ( not ( = ?auto_22185 ?auto_22174 ) ) ( HOIST-AT ?auto_22183 ?auto_22185 ) ( AVAILABLE ?auto_22183 ) ( SURFACE-AT ?auto_22167 ?auto_22185 ) ( ON ?auto_22167 ?auto_22178 ) ( CLEAR ?auto_22167 ) ( TRUCK-AT ?auto_22171 ?auto_22174 ) ( not ( = ?auto_22166 ?auto_22167 ) ) ( not ( = ?auto_22166 ?auto_22178 ) ) ( not ( = ?auto_22167 ?auto_22178 ) ) ( not ( = ?auto_22175 ?auto_22183 ) ) ( not ( = ?auto_22166 ?auto_22168 ) ) ( not ( = ?auto_22166 ?auto_22181 ) ) ( not ( = ?auto_22168 ?auto_22178 ) ) ( not ( = ?auto_22182 ?auto_22185 ) ) ( not ( = ?auto_22177 ?auto_22183 ) ) ( not ( = ?auto_22181 ?auto_22178 ) ) ( not ( = ?auto_22166 ?auto_22169 ) ) ( not ( = ?auto_22166 ?auto_22184 ) ) ( not ( = ?auto_22167 ?auto_22169 ) ) ( not ( = ?auto_22167 ?auto_22184 ) ) ( not ( = ?auto_22169 ?auto_22181 ) ) ( not ( = ?auto_22169 ?auto_22178 ) ) ( not ( = ?auto_22179 ?auto_22182 ) ) ( not ( = ?auto_22179 ?auto_22185 ) ) ( not ( = ?auto_22180 ?auto_22177 ) ) ( not ( = ?auto_22180 ?auto_22183 ) ) ( not ( = ?auto_22184 ?auto_22181 ) ) ( not ( = ?auto_22184 ?auto_22178 ) ) ( not ( = ?auto_22166 ?auto_22170 ) ) ( not ( = ?auto_22166 ?auto_22172 ) ) ( not ( = ?auto_22167 ?auto_22170 ) ) ( not ( = ?auto_22167 ?auto_22172 ) ) ( not ( = ?auto_22168 ?auto_22170 ) ) ( not ( = ?auto_22168 ?auto_22172 ) ) ( not ( = ?auto_22170 ?auto_22184 ) ) ( not ( = ?auto_22170 ?auto_22181 ) ) ( not ( = ?auto_22170 ?auto_22178 ) ) ( not ( = ?auto_22173 ?auto_22179 ) ) ( not ( = ?auto_22173 ?auto_22182 ) ) ( not ( = ?auto_22173 ?auto_22185 ) ) ( not ( = ?auto_22176 ?auto_22180 ) ) ( not ( = ?auto_22176 ?auto_22177 ) ) ( not ( = ?auto_22176 ?auto_22183 ) ) ( not ( = ?auto_22172 ?auto_22184 ) ) ( not ( = ?auto_22172 ?auto_22181 ) ) ( not ( = ?auto_22172 ?auto_22178 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_22166 ?auto_22167 ?auto_22168 ?auto_22169 )
      ( MAKE-1CRATE ?auto_22169 ?auto_22170 )
      ( MAKE-4CRATE-VERIFY ?auto_22166 ?auto_22167 ?auto_22168 ?auto_22169 ?auto_22170 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22202 - SURFACE
      ?auto_22203 - SURFACE
      ?auto_22204 - SURFACE
      ?auto_22205 - SURFACE
      ?auto_22206 - SURFACE
      ?auto_22207 - SURFACE
    )
    :vars
    (
      ?auto_22209 - HOIST
      ?auto_22211 - PLACE
      ?auto_22208 - PLACE
      ?auto_22213 - HOIST
      ?auto_22212 - SURFACE
      ?auto_22220 - PLACE
      ?auto_22218 - HOIST
      ?auto_22214 - SURFACE
      ?auto_22221 - PLACE
      ?auto_22216 - HOIST
      ?auto_22217 - SURFACE
      ?auto_22223 - SURFACE
      ?auto_22219 - PLACE
      ?auto_22215 - HOIST
      ?auto_22222 - SURFACE
      ?auto_22210 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22209 ?auto_22211 ) ( IS-CRATE ?auto_22207 ) ( not ( = ?auto_22208 ?auto_22211 ) ) ( HOIST-AT ?auto_22213 ?auto_22208 ) ( SURFACE-AT ?auto_22207 ?auto_22208 ) ( ON ?auto_22207 ?auto_22212 ) ( CLEAR ?auto_22207 ) ( not ( = ?auto_22206 ?auto_22207 ) ) ( not ( = ?auto_22206 ?auto_22212 ) ) ( not ( = ?auto_22207 ?auto_22212 ) ) ( not ( = ?auto_22209 ?auto_22213 ) ) ( IS-CRATE ?auto_22206 ) ( not ( = ?auto_22220 ?auto_22211 ) ) ( HOIST-AT ?auto_22218 ?auto_22220 ) ( AVAILABLE ?auto_22218 ) ( SURFACE-AT ?auto_22206 ?auto_22220 ) ( ON ?auto_22206 ?auto_22214 ) ( CLEAR ?auto_22206 ) ( not ( = ?auto_22205 ?auto_22206 ) ) ( not ( = ?auto_22205 ?auto_22214 ) ) ( not ( = ?auto_22206 ?auto_22214 ) ) ( not ( = ?auto_22209 ?auto_22218 ) ) ( IS-CRATE ?auto_22205 ) ( not ( = ?auto_22221 ?auto_22211 ) ) ( HOIST-AT ?auto_22216 ?auto_22221 ) ( AVAILABLE ?auto_22216 ) ( SURFACE-AT ?auto_22205 ?auto_22221 ) ( ON ?auto_22205 ?auto_22217 ) ( CLEAR ?auto_22205 ) ( not ( = ?auto_22204 ?auto_22205 ) ) ( not ( = ?auto_22204 ?auto_22217 ) ) ( not ( = ?auto_22205 ?auto_22217 ) ) ( not ( = ?auto_22209 ?auto_22216 ) ) ( IS-CRATE ?auto_22204 ) ( AVAILABLE ?auto_22213 ) ( SURFACE-AT ?auto_22204 ?auto_22208 ) ( ON ?auto_22204 ?auto_22223 ) ( CLEAR ?auto_22204 ) ( not ( = ?auto_22203 ?auto_22204 ) ) ( not ( = ?auto_22203 ?auto_22223 ) ) ( not ( = ?auto_22204 ?auto_22223 ) ) ( SURFACE-AT ?auto_22202 ?auto_22211 ) ( CLEAR ?auto_22202 ) ( IS-CRATE ?auto_22203 ) ( AVAILABLE ?auto_22209 ) ( not ( = ?auto_22219 ?auto_22211 ) ) ( HOIST-AT ?auto_22215 ?auto_22219 ) ( AVAILABLE ?auto_22215 ) ( SURFACE-AT ?auto_22203 ?auto_22219 ) ( ON ?auto_22203 ?auto_22222 ) ( CLEAR ?auto_22203 ) ( TRUCK-AT ?auto_22210 ?auto_22211 ) ( not ( = ?auto_22202 ?auto_22203 ) ) ( not ( = ?auto_22202 ?auto_22222 ) ) ( not ( = ?auto_22203 ?auto_22222 ) ) ( not ( = ?auto_22209 ?auto_22215 ) ) ( not ( = ?auto_22202 ?auto_22204 ) ) ( not ( = ?auto_22202 ?auto_22223 ) ) ( not ( = ?auto_22204 ?auto_22222 ) ) ( not ( = ?auto_22208 ?auto_22219 ) ) ( not ( = ?auto_22213 ?auto_22215 ) ) ( not ( = ?auto_22223 ?auto_22222 ) ) ( not ( = ?auto_22202 ?auto_22205 ) ) ( not ( = ?auto_22202 ?auto_22217 ) ) ( not ( = ?auto_22203 ?auto_22205 ) ) ( not ( = ?auto_22203 ?auto_22217 ) ) ( not ( = ?auto_22205 ?auto_22223 ) ) ( not ( = ?auto_22205 ?auto_22222 ) ) ( not ( = ?auto_22221 ?auto_22208 ) ) ( not ( = ?auto_22221 ?auto_22219 ) ) ( not ( = ?auto_22216 ?auto_22213 ) ) ( not ( = ?auto_22216 ?auto_22215 ) ) ( not ( = ?auto_22217 ?auto_22223 ) ) ( not ( = ?auto_22217 ?auto_22222 ) ) ( not ( = ?auto_22202 ?auto_22206 ) ) ( not ( = ?auto_22202 ?auto_22214 ) ) ( not ( = ?auto_22203 ?auto_22206 ) ) ( not ( = ?auto_22203 ?auto_22214 ) ) ( not ( = ?auto_22204 ?auto_22206 ) ) ( not ( = ?auto_22204 ?auto_22214 ) ) ( not ( = ?auto_22206 ?auto_22217 ) ) ( not ( = ?auto_22206 ?auto_22223 ) ) ( not ( = ?auto_22206 ?auto_22222 ) ) ( not ( = ?auto_22220 ?auto_22221 ) ) ( not ( = ?auto_22220 ?auto_22208 ) ) ( not ( = ?auto_22220 ?auto_22219 ) ) ( not ( = ?auto_22218 ?auto_22216 ) ) ( not ( = ?auto_22218 ?auto_22213 ) ) ( not ( = ?auto_22218 ?auto_22215 ) ) ( not ( = ?auto_22214 ?auto_22217 ) ) ( not ( = ?auto_22214 ?auto_22223 ) ) ( not ( = ?auto_22214 ?auto_22222 ) ) ( not ( = ?auto_22202 ?auto_22207 ) ) ( not ( = ?auto_22202 ?auto_22212 ) ) ( not ( = ?auto_22203 ?auto_22207 ) ) ( not ( = ?auto_22203 ?auto_22212 ) ) ( not ( = ?auto_22204 ?auto_22207 ) ) ( not ( = ?auto_22204 ?auto_22212 ) ) ( not ( = ?auto_22205 ?auto_22207 ) ) ( not ( = ?auto_22205 ?auto_22212 ) ) ( not ( = ?auto_22207 ?auto_22214 ) ) ( not ( = ?auto_22207 ?auto_22217 ) ) ( not ( = ?auto_22207 ?auto_22223 ) ) ( not ( = ?auto_22207 ?auto_22222 ) ) ( not ( = ?auto_22212 ?auto_22214 ) ) ( not ( = ?auto_22212 ?auto_22217 ) ) ( not ( = ?auto_22212 ?auto_22223 ) ) ( not ( = ?auto_22212 ?auto_22222 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_22202 ?auto_22203 ?auto_22204 ?auto_22205 ?auto_22206 )
      ( MAKE-1CRATE ?auto_22206 ?auto_22207 )
      ( MAKE-5CRATE-VERIFY ?auto_22202 ?auto_22203 ?auto_22204 ?auto_22205 ?auto_22206 ?auto_22207 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_22241 - SURFACE
      ?auto_22242 - SURFACE
      ?auto_22243 - SURFACE
      ?auto_22244 - SURFACE
      ?auto_22245 - SURFACE
      ?auto_22246 - SURFACE
      ?auto_22247 - SURFACE
    )
    :vars
    (
      ?auto_22249 - HOIST
      ?auto_22248 - PLACE
      ?auto_22253 - PLACE
      ?auto_22252 - HOIST
      ?auto_22251 - SURFACE
      ?auto_22263 - PLACE
      ?auto_22262 - HOIST
      ?auto_22264 - SURFACE
      ?auto_22258 - PLACE
      ?auto_22259 - HOIST
      ?auto_22261 - SURFACE
      ?auto_22266 - PLACE
      ?auto_22256 - HOIST
      ?auto_22260 - SURFACE
      ?auto_22254 - SURFACE
      ?auto_22257 - PLACE
      ?auto_22255 - HOIST
      ?auto_22265 - SURFACE
      ?auto_22250 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22249 ?auto_22248 ) ( IS-CRATE ?auto_22247 ) ( not ( = ?auto_22253 ?auto_22248 ) ) ( HOIST-AT ?auto_22252 ?auto_22253 ) ( AVAILABLE ?auto_22252 ) ( SURFACE-AT ?auto_22247 ?auto_22253 ) ( ON ?auto_22247 ?auto_22251 ) ( CLEAR ?auto_22247 ) ( not ( = ?auto_22246 ?auto_22247 ) ) ( not ( = ?auto_22246 ?auto_22251 ) ) ( not ( = ?auto_22247 ?auto_22251 ) ) ( not ( = ?auto_22249 ?auto_22252 ) ) ( IS-CRATE ?auto_22246 ) ( not ( = ?auto_22263 ?auto_22248 ) ) ( HOIST-AT ?auto_22262 ?auto_22263 ) ( SURFACE-AT ?auto_22246 ?auto_22263 ) ( ON ?auto_22246 ?auto_22264 ) ( CLEAR ?auto_22246 ) ( not ( = ?auto_22245 ?auto_22246 ) ) ( not ( = ?auto_22245 ?auto_22264 ) ) ( not ( = ?auto_22246 ?auto_22264 ) ) ( not ( = ?auto_22249 ?auto_22262 ) ) ( IS-CRATE ?auto_22245 ) ( not ( = ?auto_22258 ?auto_22248 ) ) ( HOIST-AT ?auto_22259 ?auto_22258 ) ( AVAILABLE ?auto_22259 ) ( SURFACE-AT ?auto_22245 ?auto_22258 ) ( ON ?auto_22245 ?auto_22261 ) ( CLEAR ?auto_22245 ) ( not ( = ?auto_22244 ?auto_22245 ) ) ( not ( = ?auto_22244 ?auto_22261 ) ) ( not ( = ?auto_22245 ?auto_22261 ) ) ( not ( = ?auto_22249 ?auto_22259 ) ) ( IS-CRATE ?auto_22244 ) ( not ( = ?auto_22266 ?auto_22248 ) ) ( HOIST-AT ?auto_22256 ?auto_22266 ) ( AVAILABLE ?auto_22256 ) ( SURFACE-AT ?auto_22244 ?auto_22266 ) ( ON ?auto_22244 ?auto_22260 ) ( CLEAR ?auto_22244 ) ( not ( = ?auto_22243 ?auto_22244 ) ) ( not ( = ?auto_22243 ?auto_22260 ) ) ( not ( = ?auto_22244 ?auto_22260 ) ) ( not ( = ?auto_22249 ?auto_22256 ) ) ( IS-CRATE ?auto_22243 ) ( AVAILABLE ?auto_22262 ) ( SURFACE-AT ?auto_22243 ?auto_22263 ) ( ON ?auto_22243 ?auto_22254 ) ( CLEAR ?auto_22243 ) ( not ( = ?auto_22242 ?auto_22243 ) ) ( not ( = ?auto_22242 ?auto_22254 ) ) ( not ( = ?auto_22243 ?auto_22254 ) ) ( SURFACE-AT ?auto_22241 ?auto_22248 ) ( CLEAR ?auto_22241 ) ( IS-CRATE ?auto_22242 ) ( AVAILABLE ?auto_22249 ) ( not ( = ?auto_22257 ?auto_22248 ) ) ( HOIST-AT ?auto_22255 ?auto_22257 ) ( AVAILABLE ?auto_22255 ) ( SURFACE-AT ?auto_22242 ?auto_22257 ) ( ON ?auto_22242 ?auto_22265 ) ( CLEAR ?auto_22242 ) ( TRUCK-AT ?auto_22250 ?auto_22248 ) ( not ( = ?auto_22241 ?auto_22242 ) ) ( not ( = ?auto_22241 ?auto_22265 ) ) ( not ( = ?auto_22242 ?auto_22265 ) ) ( not ( = ?auto_22249 ?auto_22255 ) ) ( not ( = ?auto_22241 ?auto_22243 ) ) ( not ( = ?auto_22241 ?auto_22254 ) ) ( not ( = ?auto_22243 ?auto_22265 ) ) ( not ( = ?auto_22263 ?auto_22257 ) ) ( not ( = ?auto_22262 ?auto_22255 ) ) ( not ( = ?auto_22254 ?auto_22265 ) ) ( not ( = ?auto_22241 ?auto_22244 ) ) ( not ( = ?auto_22241 ?auto_22260 ) ) ( not ( = ?auto_22242 ?auto_22244 ) ) ( not ( = ?auto_22242 ?auto_22260 ) ) ( not ( = ?auto_22244 ?auto_22254 ) ) ( not ( = ?auto_22244 ?auto_22265 ) ) ( not ( = ?auto_22266 ?auto_22263 ) ) ( not ( = ?auto_22266 ?auto_22257 ) ) ( not ( = ?auto_22256 ?auto_22262 ) ) ( not ( = ?auto_22256 ?auto_22255 ) ) ( not ( = ?auto_22260 ?auto_22254 ) ) ( not ( = ?auto_22260 ?auto_22265 ) ) ( not ( = ?auto_22241 ?auto_22245 ) ) ( not ( = ?auto_22241 ?auto_22261 ) ) ( not ( = ?auto_22242 ?auto_22245 ) ) ( not ( = ?auto_22242 ?auto_22261 ) ) ( not ( = ?auto_22243 ?auto_22245 ) ) ( not ( = ?auto_22243 ?auto_22261 ) ) ( not ( = ?auto_22245 ?auto_22260 ) ) ( not ( = ?auto_22245 ?auto_22254 ) ) ( not ( = ?auto_22245 ?auto_22265 ) ) ( not ( = ?auto_22258 ?auto_22266 ) ) ( not ( = ?auto_22258 ?auto_22263 ) ) ( not ( = ?auto_22258 ?auto_22257 ) ) ( not ( = ?auto_22259 ?auto_22256 ) ) ( not ( = ?auto_22259 ?auto_22262 ) ) ( not ( = ?auto_22259 ?auto_22255 ) ) ( not ( = ?auto_22261 ?auto_22260 ) ) ( not ( = ?auto_22261 ?auto_22254 ) ) ( not ( = ?auto_22261 ?auto_22265 ) ) ( not ( = ?auto_22241 ?auto_22246 ) ) ( not ( = ?auto_22241 ?auto_22264 ) ) ( not ( = ?auto_22242 ?auto_22246 ) ) ( not ( = ?auto_22242 ?auto_22264 ) ) ( not ( = ?auto_22243 ?auto_22246 ) ) ( not ( = ?auto_22243 ?auto_22264 ) ) ( not ( = ?auto_22244 ?auto_22246 ) ) ( not ( = ?auto_22244 ?auto_22264 ) ) ( not ( = ?auto_22246 ?auto_22261 ) ) ( not ( = ?auto_22246 ?auto_22260 ) ) ( not ( = ?auto_22246 ?auto_22254 ) ) ( not ( = ?auto_22246 ?auto_22265 ) ) ( not ( = ?auto_22264 ?auto_22261 ) ) ( not ( = ?auto_22264 ?auto_22260 ) ) ( not ( = ?auto_22264 ?auto_22254 ) ) ( not ( = ?auto_22264 ?auto_22265 ) ) ( not ( = ?auto_22241 ?auto_22247 ) ) ( not ( = ?auto_22241 ?auto_22251 ) ) ( not ( = ?auto_22242 ?auto_22247 ) ) ( not ( = ?auto_22242 ?auto_22251 ) ) ( not ( = ?auto_22243 ?auto_22247 ) ) ( not ( = ?auto_22243 ?auto_22251 ) ) ( not ( = ?auto_22244 ?auto_22247 ) ) ( not ( = ?auto_22244 ?auto_22251 ) ) ( not ( = ?auto_22245 ?auto_22247 ) ) ( not ( = ?auto_22245 ?auto_22251 ) ) ( not ( = ?auto_22247 ?auto_22264 ) ) ( not ( = ?auto_22247 ?auto_22261 ) ) ( not ( = ?auto_22247 ?auto_22260 ) ) ( not ( = ?auto_22247 ?auto_22254 ) ) ( not ( = ?auto_22247 ?auto_22265 ) ) ( not ( = ?auto_22253 ?auto_22263 ) ) ( not ( = ?auto_22253 ?auto_22258 ) ) ( not ( = ?auto_22253 ?auto_22266 ) ) ( not ( = ?auto_22253 ?auto_22257 ) ) ( not ( = ?auto_22252 ?auto_22262 ) ) ( not ( = ?auto_22252 ?auto_22259 ) ) ( not ( = ?auto_22252 ?auto_22256 ) ) ( not ( = ?auto_22252 ?auto_22255 ) ) ( not ( = ?auto_22251 ?auto_22264 ) ) ( not ( = ?auto_22251 ?auto_22261 ) ) ( not ( = ?auto_22251 ?auto_22260 ) ) ( not ( = ?auto_22251 ?auto_22254 ) ) ( not ( = ?auto_22251 ?auto_22265 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_22241 ?auto_22242 ?auto_22243 ?auto_22244 ?auto_22245 ?auto_22246 )
      ( MAKE-1CRATE ?auto_22246 ?auto_22247 )
      ( MAKE-6CRATE-VERIFY ?auto_22241 ?auto_22242 ?auto_22243 ?auto_22244 ?auto_22245 ?auto_22246 ?auto_22247 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_22285 - SURFACE
      ?auto_22286 - SURFACE
      ?auto_22287 - SURFACE
      ?auto_22288 - SURFACE
      ?auto_22289 - SURFACE
      ?auto_22290 - SURFACE
      ?auto_22291 - SURFACE
      ?auto_22292 - SURFACE
    )
    :vars
    (
      ?auto_22293 - HOIST
      ?auto_22295 - PLACE
      ?auto_22298 - PLACE
      ?auto_22294 - HOIST
      ?auto_22296 - SURFACE
      ?auto_22313 - PLACE
      ?auto_22305 - HOIST
      ?auto_22304 - SURFACE
      ?auto_22300 - PLACE
      ?auto_22310 - HOIST
      ?auto_22299 - SURFACE
      ?auto_22303 - PLACE
      ?auto_22302 - HOIST
      ?auto_22309 - SURFACE
      ?auto_22308 - PLACE
      ?auto_22311 - HOIST
      ?auto_22301 - SURFACE
      ?auto_22306 - SURFACE
      ?auto_22314 - PLACE
      ?auto_22312 - HOIST
      ?auto_22307 - SURFACE
      ?auto_22297 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22293 ?auto_22295 ) ( IS-CRATE ?auto_22292 ) ( not ( = ?auto_22298 ?auto_22295 ) ) ( HOIST-AT ?auto_22294 ?auto_22298 ) ( AVAILABLE ?auto_22294 ) ( SURFACE-AT ?auto_22292 ?auto_22298 ) ( ON ?auto_22292 ?auto_22296 ) ( CLEAR ?auto_22292 ) ( not ( = ?auto_22291 ?auto_22292 ) ) ( not ( = ?auto_22291 ?auto_22296 ) ) ( not ( = ?auto_22292 ?auto_22296 ) ) ( not ( = ?auto_22293 ?auto_22294 ) ) ( IS-CRATE ?auto_22291 ) ( not ( = ?auto_22313 ?auto_22295 ) ) ( HOIST-AT ?auto_22305 ?auto_22313 ) ( AVAILABLE ?auto_22305 ) ( SURFACE-AT ?auto_22291 ?auto_22313 ) ( ON ?auto_22291 ?auto_22304 ) ( CLEAR ?auto_22291 ) ( not ( = ?auto_22290 ?auto_22291 ) ) ( not ( = ?auto_22290 ?auto_22304 ) ) ( not ( = ?auto_22291 ?auto_22304 ) ) ( not ( = ?auto_22293 ?auto_22305 ) ) ( IS-CRATE ?auto_22290 ) ( not ( = ?auto_22300 ?auto_22295 ) ) ( HOIST-AT ?auto_22310 ?auto_22300 ) ( SURFACE-AT ?auto_22290 ?auto_22300 ) ( ON ?auto_22290 ?auto_22299 ) ( CLEAR ?auto_22290 ) ( not ( = ?auto_22289 ?auto_22290 ) ) ( not ( = ?auto_22289 ?auto_22299 ) ) ( not ( = ?auto_22290 ?auto_22299 ) ) ( not ( = ?auto_22293 ?auto_22310 ) ) ( IS-CRATE ?auto_22289 ) ( not ( = ?auto_22303 ?auto_22295 ) ) ( HOIST-AT ?auto_22302 ?auto_22303 ) ( AVAILABLE ?auto_22302 ) ( SURFACE-AT ?auto_22289 ?auto_22303 ) ( ON ?auto_22289 ?auto_22309 ) ( CLEAR ?auto_22289 ) ( not ( = ?auto_22288 ?auto_22289 ) ) ( not ( = ?auto_22288 ?auto_22309 ) ) ( not ( = ?auto_22289 ?auto_22309 ) ) ( not ( = ?auto_22293 ?auto_22302 ) ) ( IS-CRATE ?auto_22288 ) ( not ( = ?auto_22308 ?auto_22295 ) ) ( HOIST-AT ?auto_22311 ?auto_22308 ) ( AVAILABLE ?auto_22311 ) ( SURFACE-AT ?auto_22288 ?auto_22308 ) ( ON ?auto_22288 ?auto_22301 ) ( CLEAR ?auto_22288 ) ( not ( = ?auto_22287 ?auto_22288 ) ) ( not ( = ?auto_22287 ?auto_22301 ) ) ( not ( = ?auto_22288 ?auto_22301 ) ) ( not ( = ?auto_22293 ?auto_22311 ) ) ( IS-CRATE ?auto_22287 ) ( AVAILABLE ?auto_22310 ) ( SURFACE-AT ?auto_22287 ?auto_22300 ) ( ON ?auto_22287 ?auto_22306 ) ( CLEAR ?auto_22287 ) ( not ( = ?auto_22286 ?auto_22287 ) ) ( not ( = ?auto_22286 ?auto_22306 ) ) ( not ( = ?auto_22287 ?auto_22306 ) ) ( SURFACE-AT ?auto_22285 ?auto_22295 ) ( CLEAR ?auto_22285 ) ( IS-CRATE ?auto_22286 ) ( AVAILABLE ?auto_22293 ) ( not ( = ?auto_22314 ?auto_22295 ) ) ( HOIST-AT ?auto_22312 ?auto_22314 ) ( AVAILABLE ?auto_22312 ) ( SURFACE-AT ?auto_22286 ?auto_22314 ) ( ON ?auto_22286 ?auto_22307 ) ( CLEAR ?auto_22286 ) ( TRUCK-AT ?auto_22297 ?auto_22295 ) ( not ( = ?auto_22285 ?auto_22286 ) ) ( not ( = ?auto_22285 ?auto_22307 ) ) ( not ( = ?auto_22286 ?auto_22307 ) ) ( not ( = ?auto_22293 ?auto_22312 ) ) ( not ( = ?auto_22285 ?auto_22287 ) ) ( not ( = ?auto_22285 ?auto_22306 ) ) ( not ( = ?auto_22287 ?auto_22307 ) ) ( not ( = ?auto_22300 ?auto_22314 ) ) ( not ( = ?auto_22310 ?auto_22312 ) ) ( not ( = ?auto_22306 ?auto_22307 ) ) ( not ( = ?auto_22285 ?auto_22288 ) ) ( not ( = ?auto_22285 ?auto_22301 ) ) ( not ( = ?auto_22286 ?auto_22288 ) ) ( not ( = ?auto_22286 ?auto_22301 ) ) ( not ( = ?auto_22288 ?auto_22306 ) ) ( not ( = ?auto_22288 ?auto_22307 ) ) ( not ( = ?auto_22308 ?auto_22300 ) ) ( not ( = ?auto_22308 ?auto_22314 ) ) ( not ( = ?auto_22311 ?auto_22310 ) ) ( not ( = ?auto_22311 ?auto_22312 ) ) ( not ( = ?auto_22301 ?auto_22306 ) ) ( not ( = ?auto_22301 ?auto_22307 ) ) ( not ( = ?auto_22285 ?auto_22289 ) ) ( not ( = ?auto_22285 ?auto_22309 ) ) ( not ( = ?auto_22286 ?auto_22289 ) ) ( not ( = ?auto_22286 ?auto_22309 ) ) ( not ( = ?auto_22287 ?auto_22289 ) ) ( not ( = ?auto_22287 ?auto_22309 ) ) ( not ( = ?auto_22289 ?auto_22301 ) ) ( not ( = ?auto_22289 ?auto_22306 ) ) ( not ( = ?auto_22289 ?auto_22307 ) ) ( not ( = ?auto_22303 ?auto_22308 ) ) ( not ( = ?auto_22303 ?auto_22300 ) ) ( not ( = ?auto_22303 ?auto_22314 ) ) ( not ( = ?auto_22302 ?auto_22311 ) ) ( not ( = ?auto_22302 ?auto_22310 ) ) ( not ( = ?auto_22302 ?auto_22312 ) ) ( not ( = ?auto_22309 ?auto_22301 ) ) ( not ( = ?auto_22309 ?auto_22306 ) ) ( not ( = ?auto_22309 ?auto_22307 ) ) ( not ( = ?auto_22285 ?auto_22290 ) ) ( not ( = ?auto_22285 ?auto_22299 ) ) ( not ( = ?auto_22286 ?auto_22290 ) ) ( not ( = ?auto_22286 ?auto_22299 ) ) ( not ( = ?auto_22287 ?auto_22290 ) ) ( not ( = ?auto_22287 ?auto_22299 ) ) ( not ( = ?auto_22288 ?auto_22290 ) ) ( not ( = ?auto_22288 ?auto_22299 ) ) ( not ( = ?auto_22290 ?auto_22309 ) ) ( not ( = ?auto_22290 ?auto_22301 ) ) ( not ( = ?auto_22290 ?auto_22306 ) ) ( not ( = ?auto_22290 ?auto_22307 ) ) ( not ( = ?auto_22299 ?auto_22309 ) ) ( not ( = ?auto_22299 ?auto_22301 ) ) ( not ( = ?auto_22299 ?auto_22306 ) ) ( not ( = ?auto_22299 ?auto_22307 ) ) ( not ( = ?auto_22285 ?auto_22291 ) ) ( not ( = ?auto_22285 ?auto_22304 ) ) ( not ( = ?auto_22286 ?auto_22291 ) ) ( not ( = ?auto_22286 ?auto_22304 ) ) ( not ( = ?auto_22287 ?auto_22291 ) ) ( not ( = ?auto_22287 ?auto_22304 ) ) ( not ( = ?auto_22288 ?auto_22291 ) ) ( not ( = ?auto_22288 ?auto_22304 ) ) ( not ( = ?auto_22289 ?auto_22291 ) ) ( not ( = ?auto_22289 ?auto_22304 ) ) ( not ( = ?auto_22291 ?auto_22299 ) ) ( not ( = ?auto_22291 ?auto_22309 ) ) ( not ( = ?auto_22291 ?auto_22301 ) ) ( not ( = ?auto_22291 ?auto_22306 ) ) ( not ( = ?auto_22291 ?auto_22307 ) ) ( not ( = ?auto_22313 ?auto_22300 ) ) ( not ( = ?auto_22313 ?auto_22303 ) ) ( not ( = ?auto_22313 ?auto_22308 ) ) ( not ( = ?auto_22313 ?auto_22314 ) ) ( not ( = ?auto_22305 ?auto_22310 ) ) ( not ( = ?auto_22305 ?auto_22302 ) ) ( not ( = ?auto_22305 ?auto_22311 ) ) ( not ( = ?auto_22305 ?auto_22312 ) ) ( not ( = ?auto_22304 ?auto_22299 ) ) ( not ( = ?auto_22304 ?auto_22309 ) ) ( not ( = ?auto_22304 ?auto_22301 ) ) ( not ( = ?auto_22304 ?auto_22306 ) ) ( not ( = ?auto_22304 ?auto_22307 ) ) ( not ( = ?auto_22285 ?auto_22292 ) ) ( not ( = ?auto_22285 ?auto_22296 ) ) ( not ( = ?auto_22286 ?auto_22292 ) ) ( not ( = ?auto_22286 ?auto_22296 ) ) ( not ( = ?auto_22287 ?auto_22292 ) ) ( not ( = ?auto_22287 ?auto_22296 ) ) ( not ( = ?auto_22288 ?auto_22292 ) ) ( not ( = ?auto_22288 ?auto_22296 ) ) ( not ( = ?auto_22289 ?auto_22292 ) ) ( not ( = ?auto_22289 ?auto_22296 ) ) ( not ( = ?auto_22290 ?auto_22292 ) ) ( not ( = ?auto_22290 ?auto_22296 ) ) ( not ( = ?auto_22292 ?auto_22304 ) ) ( not ( = ?auto_22292 ?auto_22299 ) ) ( not ( = ?auto_22292 ?auto_22309 ) ) ( not ( = ?auto_22292 ?auto_22301 ) ) ( not ( = ?auto_22292 ?auto_22306 ) ) ( not ( = ?auto_22292 ?auto_22307 ) ) ( not ( = ?auto_22298 ?auto_22313 ) ) ( not ( = ?auto_22298 ?auto_22300 ) ) ( not ( = ?auto_22298 ?auto_22303 ) ) ( not ( = ?auto_22298 ?auto_22308 ) ) ( not ( = ?auto_22298 ?auto_22314 ) ) ( not ( = ?auto_22294 ?auto_22305 ) ) ( not ( = ?auto_22294 ?auto_22310 ) ) ( not ( = ?auto_22294 ?auto_22302 ) ) ( not ( = ?auto_22294 ?auto_22311 ) ) ( not ( = ?auto_22294 ?auto_22312 ) ) ( not ( = ?auto_22296 ?auto_22304 ) ) ( not ( = ?auto_22296 ?auto_22299 ) ) ( not ( = ?auto_22296 ?auto_22309 ) ) ( not ( = ?auto_22296 ?auto_22301 ) ) ( not ( = ?auto_22296 ?auto_22306 ) ) ( not ( = ?auto_22296 ?auto_22307 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_22285 ?auto_22286 ?auto_22287 ?auto_22288 ?auto_22289 ?auto_22290 ?auto_22291 )
      ( MAKE-1CRATE ?auto_22291 ?auto_22292 )
      ( MAKE-7CRATE-VERIFY ?auto_22285 ?auto_22286 ?auto_22287 ?auto_22288 ?auto_22289 ?auto_22290 ?auto_22291 ?auto_22292 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_22334 - SURFACE
      ?auto_22335 - SURFACE
      ?auto_22336 - SURFACE
      ?auto_22337 - SURFACE
      ?auto_22338 - SURFACE
      ?auto_22339 - SURFACE
      ?auto_22340 - SURFACE
      ?auto_22341 - SURFACE
      ?auto_22342 - SURFACE
    )
    :vars
    (
      ?auto_22347 - HOIST
      ?auto_22346 - PLACE
      ?auto_22348 - PLACE
      ?auto_22343 - HOIST
      ?auto_22344 - SURFACE
      ?auto_22352 - PLACE
      ?auto_22362 - HOIST
      ?auto_22358 - SURFACE
      ?auto_22354 - PLACE
      ?auto_22351 - HOIST
      ?auto_22367 - SURFACE
      ?auto_22355 - PLACE
      ?auto_22361 - HOIST
      ?auto_22364 - SURFACE
      ?auto_22357 - PLACE
      ?auto_22366 - HOIST
      ?auto_22360 - SURFACE
      ?auto_22353 - PLACE
      ?auto_22350 - HOIST
      ?auto_22349 - SURFACE
      ?auto_22356 - SURFACE
      ?auto_22365 - PLACE
      ?auto_22359 - HOIST
      ?auto_22363 - SURFACE
      ?auto_22345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22347 ?auto_22346 ) ( IS-CRATE ?auto_22342 ) ( not ( = ?auto_22348 ?auto_22346 ) ) ( HOIST-AT ?auto_22343 ?auto_22348 ) ( AVAILABLE ?auto_22343 ) ( SURFACE-AT ?auto_22342 ?auto_22348 ) ( ON ?auto_22342 ?auto_22344 ) ( CLEAR ?auto_22342 ) ( not ( = ?auto_22341 ?auto_22342 ) ) ( not ( = ?auto_22341 ?auto_22344 ) ) ( not ( = ?auto_22342 ?auto_22344 ) ) ( not ( = ?auto_22347 ?auto_22343 ) ) ( IS-CRATE ?auto_22341 ) ( not ( = ?auto_22352 ?auto_22346 ) ) ( HOIST-AT ?auto_22362 ?auto_22352 ) ( AVAILABLE ?auto_22362 ) ( SURFACE-AT ?auto_22341 ?auto_22352 ) ( ON ?auto_22341 ?auto_22358 ) ( CLEAR ?auto_22341 ) ( not ( = ?auto_22340 ?auto_22341 ) ) ( not ( = ?auto_22340 ?auto_22358 ) ) ( not ( = ?auto_22341 ?auto_22358 ) ) ( not ( = ?auto_22347 ?auto_22362 ) ) ( IS-CRATE ?auto_22340 ) ( not ( = ?auto_22354 ?auto_22346 ) ) ( HOIST-AT ?auto_22351 ?auto_22354 ) ( AVAILABLE ?auto_22351 ) ( SURFACE-AT ?auto_22340 ?auto_22354 ) ( ON ?auto_22340 ?auto_22367 ) ( CLEAR ?auto_22340 ) ( not ( = ?auto_22339 ?auto_22340 ) ) ( not ( = ?auto_22339 ?auto_22367 ) ) ( not ( = ?auto_22340 ?auto_22367 ) ) ( not ( = ?auto_22347 ?auto_22351 ) ) ( IS-CRATE ?auto_22339 ) ( not ( = ?auto_22355 ?auto_22346 ) ) ( HOIST-AT ?auto_22361 ?auto_22355 ) ( SURFACE-AT ?auto_22339 ?auto_22355 ) ( ON ?auto_22339 ?auto_22364 ) ( CLEAR ?auto_22339 ) ( not ( = ?auto_22338 ?auto_22339 ) ) ( not ( = ?auto_22338 ?auto_22364 ) ) ( not ( = ?auto_22339 ?auto_22364 ) ) ( not ( = ?auto_22347 ?auto_22361 ) ) ( IS-CRATE ?auto_22338 ) ( not ( = ?auto_22357 ?auto_22346 ) ) ( HOIST-AT ?auto_22366 ?auto_22357 ) ( AVAILABLE ?auto_22366 ) ( SURFACE-AT ?auto_22338 ?auto_22357 ) ( ON ?auto_22338 ?auto_22360 ) ( CLEAR ?auto_22338 ) ( not ( = ?auto_22337 ?auto_22338 ) ) ( not ( = ?auto_22337 ?auto_22360 ) ) ( not ( = ?auto_22338 ?auto_22360 ) ) ( not ( = ?auto_22347 ?auto_22366 ) ) ( IS-CRATE ?auto_22337 ) ( not ( = ?auto_22353 ?auto_22346 ) ) ( HOIST-AT ?auto_22350 ?auto_22353 ) ( AVAILABLE ?auto_22350 ) ( SURFACE-AT ?auto_22337 ?auto_22353 ) ( ON ?auto_22337 ?auto_22349 ) ( CLEAR ?auto_22337 ) ( not ( = ?auto_22336 ?auto_22337 ) ) ( not ( = ?auto_22336 ?auto_22349 ) ) ( not ( = ?auto_22337 ?auto_22349 ) ) ( not ( = ?auto_22347 ?auto_22350 ) ) ( IS-CRATE ?auto_22336 ) ( AVAILABLE ?auto_22361 ) ( SURFACE-AT ?auto_22336 ?auto_22355 ) ( ON ?auto_22336 ?auto_22356 ) ( CLEAR ?auto_22336 ) ( not ( = ?auto_22335 ?auto_22336 ) ) ( not ( = ?auto_22335 ?auto_22356 ) ) ( not ( = ?auto_22336 ?auto_22356 ) ) ( SURFACE-AT ?auto_22334 ?auto_22346 ) ( CLEAR ?auto_22334 ) ( IS-CRATE ?auto_22335 ) ( AVAILABLE ?auto_22347 ) ( not ( = ?auto_22365 ?auto_22346 ) ) ( HOIST-AT ?auto_22359 ?auto_22365 ) ( AVAILABLE ?auto_22359 ) ( SURFACE-AT ?auto_22335 ?auto_22365 ) ( ON ?auto_22335 ?auto_22363 ) ( CLEAR ?auto_22335 ) ( TRUCK-AT ?auto_22345 ?auto_22346 ) ( not ( = ?auto_22334 ?auto_22335 ) ) ( not ( = ?auto_22334 ?auto_22363 ) ) ( not ( = ?auto_22335 ?auto_22363 ) ) ( not ( = ?auto_22347 ?auto_22359 ) ) ( not ( = ?auto_22334 ?auto_22336 ) ) ( not ( = ?auto_22334 ?auto_22356 ) ) ( not ( = ?auto_22336 ?auto_22363 ) ) ( not ( = ?auto_22355 ?auto_22365 ) ) ( not ( = ?auto_22361 ?auto_22359 ) ) ( not ( = ?auto_22356 ?auto_22363 ) ) ( not ( = ?auto_22334 ?auto_22337 ) ) ( not ( = ?auto_22334 ?auto_22349 ) ) ( not ( = ?auto_22335 ?auto_22337 ) ) ( not ( = ?auto_22335 ?auto_22349 ) ) ( not ( = ?auto_22337 ?auto_22356 ) ) ( not ( = ?auto_22337 ?auto_22363 ) ) ( not ( = ?auto_22353 ?auto_22355 ) ) ( not ( = ?auto_22353 ?auto_22365 ) ) ( not ( = ?auto_22350 ?auto_22361 ) ) ( not ( = ?auto_22350 ?auto_22359 ) ) ( not ( = ?auto_22349 ?auto_22356 ) ) ( not ( = ?auto_22349 ?auto_22363 ) ) ( not ( = ?auto_22334 ?auto_22338 ) ) ( not ( = ?auto_22334 ?auto_22360 ) ) ( not ( = ?auto_22335 ?auto_22338 ) ) ( not ( = ?auto_22335 ?auto_22360 ) ) ( not ( = ?auto_22336 ?auto_22338 ) ) ( not ( = ?auto_22336 ?auto_22360 ) ) ( not ( = ?auto_22338 ?auto_22349 ) ) ( not ( = ?auto_22338 ?auto_22356 ) ) ( not ( = ?auto_22338 ?auto_22363 ) ) ( not ( = ?auto_22357 ?auto_22353 ) ) ( not ( = ?auto_22357 ?auto_22355 ) ) ( not ( = ?auto_22357 ?auto_22365 ) ) ( not ( = ?auto_22366 ?auto_22350 ) ) ( not ( = ?auto_22366 ?auto_22361 ) ) ( not ( = ?auto_22366 ?auto_22359 ) ) ( not ( = ?auto_22360 ?auto_22349 ) ) ( not ( = ?auto_22360 ?auto_22356 ) ) ( not ( = ?auto_22360 ?auto_22363 ) ) ( not ( = ?auto_22334 ?auto_22339 ) ) ( not ( = ?auto_22334 ?auto_22364 ) ) ( not ( = ?auto_22335 ?auto_22339 ) ) ( not ( = ?auto_22335 ?auto_22364 ) ) ( not ( = ?auto_22336 ?auto_22339 ) ) ( not ( = ?auto_22336 ?auto_22364 ) ) ( not ( = ?auto_22337 ?auto_22339 ) ) ( not ( = ?auto_22337 ?auto_22364 ) ) ( not ( = ?auto_22339 ?auto_22360 ) ) ( not ( = ?auto_22339 ?auto_22349 ) ) ( not ( = ?auto_22339 ?auto_22356 ) ) ( not ( = ?auto_22339 ?auto_22363 ) ) ( not ( = ?auto_22364 ?auto_22360 ) ) ( not ( = ?auto_22364 ?auto_22349 ) ) ( not ( = ?auto_22364 ?auto_22356 ) ) ( not ( = ?auto_22364 ?auto_22363 ) ) ( not ( = ?auto_22334 ?auto_22340 ) ) ( not ( = ?auto_22334 ?auto_22367 ) ) ( not ( = ?auto_22335 ?auto_22340 ) ) ( not ( = ?auto_22335 ?auto_22367 ) ) ( not ( = ?auto_22336 ?auto_22340 ) ) ( not ( = ?auto_22336 ?auto_22367 ) ) ( not ( = ?auto_22337 ?auto_22340 ) ) ( not ( = ?auto_22337 ?auto_22367 ) ) ( not ( = ?auto_22338 ?auto_22340 ) ) ( not ( = ?auto_22338 ?auto_22367 ) ) ( not ( = ?auto_22340 ?auto_22364 ) ) ( not ( = ?auto_22340 ?auto_22360 ) ) ( not ( = ?auto_22340 ?auto_22349 ) ) ( not ( = ?auto_22340 ?auto_22356 ) ) ( not ( = ?auto_22340 ?auto_22363 ) ) ( not ( = ?auto_22354 ?auto_22355 ) ) ( not ( = ?auto_22354 ?auto_22357 ) ) ( not ( = ?auto_22354 ?auto_22353 ) ) ( not ( = ?auto_22354 ?auto_22365 ) ) ( not ( = ?auto_22351 ?auto_22361 ) ) ( not ( = ?auto_22351 ?auto_22366 ) ) ( not ( = ?auto_22351 ?auto_22350 ) ) ( not ( = ?auto_22351 ?auto_22359 ) ) ( not ( = ?auto_22367 ?auto_22364 ) ) ( not ( = ?auto_22367 ?auto_22360 ) ) ( not ( = ?auto_22367 ?auto_22349 ) ) ( not ( = ?auto_22367 ?auto_22356 ) ) ( not ( = ?auto_22367 ?auto_22363 ) ) ( not ( = ?auto_22334 ?auto_22341 ) ) ( not ( = ?auto_22334 ?auto_22358 ) ) ( not ( = ?auto_22335 ?auto_22341 ) ) ( not ( = ?auto_22335 ?auto_22358 ) ) ( not ( = ?auto_22336 ?auto_22341 ) ) ( not ( = ?auto_22336 ?auto_22358 ) ) ( not ( = ?auto_22337 ?auto_22341 ) ) ( not ( = ?auto_22337 ?auto_22358 ) ) ( not ( = ?auto_22338 ?auto_22341 ) ) ( not ( = ?auto_22338 ?auto_22358 ) ) ( not ( = ?auto_22339 ?auto_22341 ) ) ( not ( = ?auto_22339 ?auto_22358 ) ) ( not ( = ?auto_22341 ?auto_22367 ) ) ( not ( = ?auto_22341 ?auto_22364 ) ) ( not ( = ?auto_22341 ?auto_22360 ) ) ( not ( = ?auto_22341 ?auto_22349 ) ) ( not ( = ?auto_22341 ?auto_22356 ) ) ( not ( = ?auto_22341 ?auto_22363 ) ) ( not ( = ?auto_22352 ?auto_22354 ) ) ( not ( = ?auto_22352 ?auto_22355 ) ) ( not ( = ?auto_22352 ?auto_22357 ) ) ( not ( = ?auto_22352 ?auto_22353 ) ) ( not ( = ?auto_22352 ?auto_22365 ) ) ( not ( = ?auto_22362 ?auto_22351 ) ) ( not ( = ?auto_22362 ?auto_22361 ) ) ( not ( = ?auto_22362 ?auto_22366 ) ) ( not ( = ?auto_22362 ?auto_22350 ) ) ( not ( = ?auto_22362 ?auto_22359 ) ) ( not ( = ?auto_22358 ?auto_22367 ) ) ( not ( = ?auto_22358 ?auto_22364 ) ) ( not ( = ?auto_22358 ?auto_22360 ) ) ( not ( = ?auto_22358 ?auto_22349 ) ) ( not ( = ?auto_22358 ?auto_22356 ) ) ( not ( = ?auto_22358 ?auto_22363 ) ) ( not ( = ?auto_22334 ?auto_22342 ) ) ( not ( = ?auto_22334 ?auto_22344 ) ) ( not ( = ?auto_22335 ?auto_22342 ) ) ( not ( = ?auto_22335 ?auto_22344 ) ) ( not ( = ?auto_22336 ?auto_22342 ) ) ( not ( = ?auto_22336 ?auto_22344 ) ) ( not ( = ?auto_22337 ?auto_22342 ) ) ( not ( = ?auto_22337 ?auto_22344 ) ) ( not ( = ?auto_22338 ?auto_22342 ) ) ( not ( = ?auto_22338 ?auto_22344 ) ) ( not ( = ?auto_22339 ?auto_22342 ) ) ( not ( = ?auto_22339 ?auto_22344 ) ) ( not ( = ?auto_22340 ?auto_22342 ) ) ( not ( = ?auto_22340 ?auto_22344 ) ) ( not ( = ?auto_22342 ?auto_22358 ) ) ( not ( = ?auto_22342 ?auto_22367 ) ) ( not ( = ?auto_22342 ?auto_22364 ) ) ( not ( = ?auto_22342 ?auto_22360 ) ) ( not ( = ?auto_22342 ?auto_22349 ) ) ( not ( = ?auto_22342 ?auto_22356 ) ) ( not ( = ?auto_22342 ?auto_22363 ) ) ( not ( = ?auto_22348 ?auto_22352 ) ) ( not ( = ?auto_22348 ?auto_22354 ) ) ( not ( = ?auto_22348 ?auto_22355 ) ) ( not ( = ?auto_22348 ?auto_22357 ) ) ( not ( = ?auto_22348 ?auto_22353 ) ) ( not ( = ?auto_22348 ?auto_22365 ) ) ( not ( = ?auto_22343 ?auto_22362 ) ) ( not ( = ?auto_22343 ?auto_22351 ) ) ( not ( = ?auto_22343 ?auto_22361 ) ) ( not ( = ?auto_22343 ?auto_22366 ) ) ( not ( = ?auto_22343 ?auto_22350 ) ) ( not ( = ?auto_22343 ?auto_22359 ) ) ( not ( = ?auto_22344 ?auto_22358 ) ) ( not ( = ?auto_22344 ?auto_22367 ) ) ( not ( = ?auto_22344 ?auto_22364 ) ) ( not ( = ?auto_22344 ?auto_22360 ) ) ( not ( = ?auto_22344 ?auto_22349 ) ) ( not ( = ?auto_22344 ?auto_22356 ) ) ( not ( = ?auto_22344 ?auto_22363 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_22334 ?auto_22335 ?auto_22336 ?auto_22337 ?auto_22338 ?auto_22339 ?auto_22340 ?auto_22341 )
      ( MAKE-1CRATE ?auto_22341 ?auto_22342 )
      ( MAKE-8CRATE-VERIFY ?auto_22334 ?auto_22335 ?auto_22336 ?auto_22337 ?auto_22338 ?auto_22339 ?auto_22340 ?auto_22341 ?auto_22342 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_22388 - SURFACE
      ?auto_22389 - SURFACE
      ?auto_22390 - SURFACE
      ?auto_22391 - SURFACE
      ?auto_22392 - SURFACE
      ?auto_22393 - SURFACE
      ?auto_22394 - SURFACE
      ?auto_22395 - SURFACE
      ?auto_22396 - SURFACE
      ?auto_22397 - SURFACE
    )
    :vars
    (
      ?auto_22401 - HOIST
      ?auto_22403 - PLACE
      ?auto_22402 - PLACE
      ?auto_22400 - HOIST
      ?auto_22398 - SURFACE
      ?auto_22405 - PLACE
      ?auto_22404 - HOIST
      ?auto_22412 - SURFACE
      ?auto_22414 - PLACE
      ?auto_22421 - HOIST
      ?auto_22411 - SURFACE
      ?auto_22423 - PLACE
      ?auto_22416 - HOIST
      ?auto_22420 - SURFACE
      ?auto_22406 - PLACE
      ?auto_22417 - HOIST
      ?auto_22410 - SURFACE
      ?auto_22409 - PLACE
      ?auto_22419 - HOIST
      ?auto_22422 - SURFACE
      ?auto_22408 - PLACE
      ?auto_22418 - HOIST
      ?auto_22407 - SURFACE
      ?auto_22415 - SURFACE
      ?auto_22413 - SURFACE
      ?auto_22399 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22401 ?auto_22403 ) ( IS-CRATE ?auto_22397 ) ( not ( = ?auto_22402 ?auto_22403 ) ) ( HOIST-AT ?auto_22400 ?auto_22402 ) ( SURFACE-AT ?auto_22397 ?auto_22402 ) ( ON ?auto_22397 ?auto_22398 ) ( CLEAR ?auto_22397 ) ( not ( = ?auto_22396 ?auto_22397 ) ) ( not ( = ?auto_22396 ?auto_22398 ) ) ( not ( = ?auto_22397 ?auto_22398 ) ) ( not ( = ?auto_22401 ?auto_22400 ) ) ( IS-CRATE ?auto_22396 ) ( not ( = ?auto_22405 ?auto_22403 ) ) ( HOIST-AT ?auto_22404 ?auto_22405 ) ( AVAILABLE ?auto_22404 ) ( SURFACE-AT ?auto_22396 ?auto_22405 ) ( ON ?auto_22396 ?auto_22412 ) ( CLEAR ?auto_22396 ) ( not ( = ?auto_22395 ?auto_22396 ) ) ( not ( = ?auto_22395 ?auto_22412 ) ) ( not ( = ?auto_22396 ?auto_22412 ) ) ( not ( = ?auto_22401 ?auto_22404 ) ) ( IS-CRATE ?auto_22395 ) ( not ( = ?auto_22414 ?auto_22403 ) ) ( HOIST-AT ?auto_22421 ?auto_22414 ) ( AVAILABLE ?auto_22421 ) ( SURFACE-AT ?auto_22395 ?auto_22414 ) ( ON ?auto_22395 ?auto_22411 ) ( CLEAR ?auto_22395 ) ( not ( = ?auto_22394 ?auto_22395 ) ) ( not ( = ?auto_22394 ?auto_22411 ) ) ( not ( = ?auto_22395 ?auto_22411 ) ) ( not ( = ?auto_22401 ?auto_22421 ) ) ( IS-CRATE ?auto_22394 ) ( not ( = ?auto_22423 ?auto_22403 ) ) ( HOIST-AT ?auto_22416 ?auto_22423 ) ( AVAILABLE ?auto_22416 ) ( SURFACE-AT ?auto_22394 ?auto_22423 ) ( ON ?auto_22394 ?auto_22420 ) ( CLEAR ?auto_22394 ) ( not ( = ?auto_22393 ?auto_22394 ) ) ( not ( = ?auto_22393 ?auto_22420 ) ) ( not ( = ?auto_22394 ?auto_22420 ) ) ( not ( = ?auto_22401 ?auto_22416 ) ) ( IS-CRATE ?auto_22393 ) ( not ( = ?auto_22406 ?auto_22403 ) ) ( HOIST-AT ?auto_22417 ?auto_22406 ) ( SURFACE-AT ?auto_22393 ?auto_22406 ) ( ON ?auto_22393 ?auto_22410 ) ( CLEAR ?auto_22393 ) ( not ( = ?auto_22392 ?auto_22393 ) ) ( not ( = ?auto_22392 ?auto_22410 ) ) ( not ( = ?auto_22393 ?auto_22410 ) ) ( not ( = ?auto_22401 ?auto_22417 ) ) ( IS-CRATE ?auto_22392 ) ( not ( = ?auto_22409 ?auto_22403 ) ) ( HOIST-AT ?auto_22419 ?auto_22409 ) ( AVAILABLE ?auto_22419 ) ( SURFACE-AT ?auto_22392 ?auto_22409 ) ( ON ?auto_22392 ?auto_22422 ) ( CLEAR ?auto_22392 ) ( not ( = ?auto_22391 ?auto_22392 ) ) ( not ( = ?auto_22391 ?auto_22422 ) ) ( not ( = ?auto_22392 ?auto_22422 ) ) ( not ( = ?auto_22401 ?auto_22419 ) ) ( IS-CRATE ?auto_22391 ) ( not ( = ?auto_22408 ?auto_22403 ) ) ( HOIST-AT ?auto_22418 ?auto_22408 ) ( AVAILABLE ?auto_22418 ) ( SURFACE-AT ?auto_22391 ?auto_22408 ) ( ON ?auto_22391 ?auto_22407 ) ( CLEAR ?auto_22391 ) ( not ( = ?auto_22390 ?auto_22391 ) ) ( not ( = ?auto_22390 ?auto_22407 ) ) ( not ( = ?auto_22391 ?auto_22407 ) ) ( not ( = ?auto_22401 ?auto_22418 ) ) ( IS-CRATE ?auto_22390 ) ( AVAILABLE ?auto_22417 ) ( SURFACE-AT ?auto_22390 ?auto_22406 ) ( ON ?auto_22390 ?auto_22415 ) ( CLEAR ?auto_22390 ) ( not ( = ?auto_22389 ?auto_22390 ) ) ( not ( = ?auto_22389 ?auto_22415 ) ) ( not ( = ?auto_22390 ?auto_22415 ) ) ( SURFACE-AT ?auto_22388 ?auto_22403 ) ( CLEAR ?auto_22388 ) ( IS-CRATE ?auto_22389 ) ( AVAILABLE ?auto_22401 ) ( AVAILABLE ?auto_22400 ) ( SURFACE-AT ?auto_22389 ?auto_22402 ) ( ON ?auto_22389 ?auto_22413 ) ( CLEAR ?auto_22389 ) ( TRUCK-AT ?auto_22399 ?auto_22403 ) ( not ( = ?auto_22388 ?auto_22389 ) ) ( not ( = ?auto_22388 ?auto_22413 ) ) ( not ( = ?auto_22389 ?auto_22413 ) ) ( not ( = ?auto_22388 ?auto_22390 ) ) ( not ( = ?auto_22388 ?auto_22415 ) ) ( not ( = ?auto_22390 ?auto_22413 ) ) ( not ( = ?auto_22406 ?auto_22402 ) ) ( not ( = ?auto_22417 ?auto_22400 ) ) ( not ( = ?auto_22415 ?auto_22413 ) ) ( not ( = ?auto_22388 ?auto_22391 ) ) ( not ( = ?auto_22388 ?auto_22407 ) ) ( not ( = ?auto_22389 ?auto_22391 ) ) ( not ( = ?auto_22389 ?auto_22407 ) ) ( not ( = ?auto_22391 ?auto_22415 ) ) ( not ( = ?auto_22391 ?auto_22413 ) ) ( not ( = ?auto_22408 ?auto_22406 ) ) ( not ( = ?auto_22408 ?auto_22402 ) ) ( not ( = ?auto_22418 ?auto_22417 ) ) ( not ( = ?auto_22418 ?auto_22400 ) ) ( not ( = ?auto_22407 ?auto_22415 ) ) ( not ( = ?auto_22407 ?auto_22413 ) ) ( not ( = ?auto_22388 ?auto_22392 ) ) ( not ( = ?auto_22388 ?auto_22422 ) ) ( not ( = ?auto_22389 ?auto_22392 ) ) ( not ( = ?auto_22389 ?auto_22422 ) ) ( not ( = ?auto_22390 ?auto_22392 ) ) ( not ( = ?auto_22390 ?auto_22422 ) ) ( not ( = ?auto_22392 ?auto_22407 ) ) ( not ( = ?auto_22392 ?auto_22415 ) ) ( not ( = ?auto_22392 ?auto_22413 ) ) ( not ( = ?auto_22409 ?auto_22408 ) ) ( not ( = ?auto_22409 ?auto_22406 ) ) ( not ( = ?auto_22409 ?auto_22402 ) ) ( not ( = ?auto_22419 ?auto_22418 ) ) ( not ( = ?auto_22419 ?auto_22417 ) ) ( not ( = ?auto_22419 ?auto_22400 ) ) ( not ( = ?auto_22422 ?auto_22407 ) ) ( not ( = ?auto_22422 ?auto_22415 ) ) ( not ( = ?auto_22422 ?auto_22413 ) ) ( not ( = ?auto_22388 ?auto_22393 ) ) ( not ( = ?auto_22388 ?auto_22410 ) ) ( not ( = ?auto_22389 ?auto_22393 ) ) ( not ( = ?auto_22389 ?auto_22410 ) ) ( not ( = ?auto_22390 ?auto_22393 ) ) ( not ( = ?auto_22390 ?auto_22410 ) ) ( not ( = ?auto_22391 ?auto_22393 ) ) ( not ( = ?auto_22391 ?auto_22410 ) ) ( not ( = ?auto_22393 ?auto_22422 ) ) ( not ( = ?auto_22393 ?auto_22407 ) ) ( not ( = ?auto_22393 ?auto_22415 ) ) ( not ( = ?auto_22393 ?auto_22413 ) ) ( not ( = ?auto_22410 ?auto_22422 ) ) ( not ( = ?auto_22410 ?auto_22407 ) ) ( not ( = ?auto_22410 ?auto_22415 ) ) ( not ( = ?auto_22410 ?auto_22413 ) ) ( not ( = ?auto_22388 ?auto_22394 ) ) ( not ( = ?auto_22388 ?auto_22420 ) ) ( not ( = ?auto_22389 ?auto_22394 ) ) ( not ( = ?auto_22389 ?auto_22420 ) ) ( not ( = ?auto_22390 ?auto_22394 ) ) ( not ( = ?auto_22390 ?auto_22420 ) ) ( not ( = ?auto_22391 ?auto_22394 ) ) ( not ( = ?auto_22391 ?auto_22420 ) ) ( not ( = ?auto_22392 ?auto_22394 ) ) ( not ( = ?auto_22392 ?auto_22420 ) ) ( not ( = ?auto_22394 ?auto_22410 ) ) ( not ( = ?auto_22394 ?auto_22422 ) ) ( not ( = ?auto_22394 ?auto_22407 ) ) ( not ( = ?auto_22394 ?auto_22415 ) ) ( not ( = ?auto_22394 ?auto_22413 ) ) ( not ( = ?auto_22423 ?auto_22406 ) ) ( not ( = ?auto_22423 ?auto_22409 ) ) ( not ( = ?auto_22423 ?auto_22408 ) ) ( not ( = ?auto_22423 ?auto_22402 ) ) ( not ( = ?auto_22416 ?auto_22417 ) ) ( not ( = ?auto_22416 ?auto_22419 ) ) ( not ( = ?auto_22416 ?auto_22418 ) ) ( not ( = ?auto_22416 ?auto_22400 ) ) ( not ( = ?auto_22420 ?auto_22410 ) ) ( not ( = ?auto_22420 ?auto_22422 ) ) ( not ( = ?auto_22420 ?auto_22407 ) ) ( not ( = ?auto_22420 ?auto_22415 ) ) ( not ( = ?auto_22420 ?auto_22413 ) ) ( not ( = ?auto_22388 ?auto_22395 ) ) ( not ( = ?auto_22388 ?auto_22411 ) ) ( not ( = ?auto_22389 ?auto_22395 ) ) ( not ( = ?auto_22389 ?auto_22411 ) ) ( not ( = ?auto_22390 ?auto_22395 ) ) ( not ( = ?auto_22390 ?auto_22411 ) ) ( not ( = ?auto_22391 ?auto_22395 ) ) ( not ( = ?auto_22391 ?auto_22411 ) ) ( not ( = ?auto_22392 ?auto_22395 ) ) ( not ( = ?auto_22392 ?auto_22411 ) ) ( not ( = ?auto_22393 ?auto_22395 ) ) ( not ( = ?auto_22393 ?auto_22411 ) ) ( not ( = ?auto_22395 ?auto_22420 ) ) ( not ( = ?auto_22395 ?auto_22410 ) ) ( not ( = ?auto_22395 ?auto_22422 ) ) ( not ( = ?auto_22395 ?auto_22407 ) ) ( not ( = ?auto_22395 ?auto_22415 ) ) ( not ( = ?auto_22395 ?auto_22413 ) ) ( not ( = ?auto_22414 ?auto_22423 ) ) ( not ( = ?auto_22414 ?auto_22406 ) ) ( not ( = ?auto_22414 ?auto_22409 ) ) ( not ( = ?auto_22414 ?auto_22408 ) ) ( not ( = ?auto_22414 ?auto_22402 ) ) ( not ( = ?auto_22421 ?auto_22416 ) ) ( not ( = ?auto_22421 ?auto_22417 ) ) ( not ( = ?auto_22421 ?auto_22419 ) ) ( not ( = ?auto_22421 ?auto_22418 ) ) ( not ( = ?auto_22421 ?auto_22400 ) ) ( not ( = ?auto_22411 ?auto_22420 ) ) ( not ( = ?auto_22411 ?auto_22410 ) ) ( not ( = ?auto_22411 ?auto_22422 ) ) ( not ( = ?auto_22411 ?auto_22407 ) ) ( not ( = ?auto_22411 ?auto_22415 ) ) ( not ( = ?auto_22411 ?auto_22413 ) ) ( not ( = ?auto_22388 ?auto_22396 ) ) ( not ( = ?auto_22388 ?auto_22412 ) ) ( not ( = ?auto_22389 ?auto_22396 ) ) ( not ( = ?auto_22389 ?auto_22412 ) ) ( not ( = ?auto_22390 ?auto_22396 ) ) ( not ( = ?auto_22390 ?auto_22412 ) ) ( not ( = ?auto_22391 ?auto_22396 ) ) ( not ( = ?auto_22391 ?auto_22412 ) ) ( not ( = ?auto_22392 ?auto_22396 ) ) ( not ( = ?auto_22392 ?auto_22412 ) ) ( not ( = ?auto_22393 ?auto_22396 ) ) ( not ( = ?auto_22393 ?auto_22412 ) ) ( not ( = ?auto_22394 ?auto_22396 ) ) ( not ( = ?auto_22394 ?auto_22412 ) ) ( not ( = ?auto_22396 ?auto_22411 ) ) ( not ( = ?auto_22396 ?auto_22420 ) ) ( not ( = ?auto_22396 ?auto_22410 ) ) ( not ( = ?auto_22396 ?auto_22422 ) ) ( not ( = ?auto_22396 ?auto_22407 ) ) ( not ( = ?auto_22396 ?auto_22415 ) ) ( not ( = ?auto_22396 ?auto_22413 ) ) ( not ( = ?auto_22405 ?auto_22414 ) ) ( not ( = ?auto_22405 ?auto_22423 ) ) ( not ( = ?auto_22405 ?auto_22406 ) ) ( not ( = ?auto_22405 ?auto_22409 ) ) ( not ( = ?auto_22405 ?auto_22408 ) ) ( not ( = ?auto_22405 ?auto_22402 ) ) ( not ( = ?auto_22404 ?auto_22421 ) ) ( not ( = ?auto_22404 ?auto_22416 ) ) ( not ( = ?auto_22404 ?auto_22417 ) ) ( not ( = ?auto_22404 ?auto_22419 ) ) ( not ( = ?auto_22404 ?auto_22418 ) ) ( not ( = ?auto_22404 ?auto_22400 ) ) ( not ( = ?auto_22412 ?auto_22411 ) ) ( not ( = ?auto_22412 ?auto_22420 ) ) ( not ( = ?auto_22412 ?auto_22410 ) ) ( not ( = ?auto_22412 ?auto_22422 ) ) ( not ( = ?auto_22412 ?auto_22407 ) ) ( not ( = ?auto_22412 ?auto_22415 ) ) ( not ( = ?auto_22412 ?auto_22413 ) ) ( not ( = ?auto_22388 ?auto_22397 ) ) ( not ( = ?auto_22388 ?auto_22398 ) ) ( not ( = ?auto_22389 ?auto_22397 ) ) ( not ( = ?auto_22389 ?auto_22398 ) ) ( not ( = ?auto_22390 ?auto_22397 ) ) ( not ( = ?auto_22390 ?auto_22398 ) ) ( not ( = ?auto_22391 ?auto_22397 ) ) ( not ( = ?auto_22391 ?auto_22398 ) ) ( not ( = ?auto_22392 ?auto_22397 ) ) ( not ( = ?auto_22392 ?auto_22398 ) ) ( not ( = ?auto_22393 ?auto_22397 ) ) ( not ( = ?auto_22393 ?auto_22398 ) ) ( not ( = ?auto_22394 ?auto_22397 ) ) ( not ( = ?auto_22394 ?auto_22398 ) ) ( not ( = ?auto_22395 ?auto_22397 ) ) ( not ( = ?auto_22395 ?auto_22398 ) ) ( not ( = ?auto_22397 ?auto_22412 ) ) ( not ( = ?auto_22397 ?auto_22411 ) ) ( not ( = ?auto_22397 ?auto_22420 ) ) ( not ( = ?auto_22397 ?auto_22410 ) ) ( not ( = ?auto_22397 ?auto_22422 ) ) ( not ( = ?auto_22397 ?auto_22407 ) ) ( not ( = ?auto_22397 ?auto_22415 ) ) ( not ( = ?auto_22397 ?auto_22413 ) ) ( not ( = ?auto_22398 ?auto_22412 ) ) ( not ( = ?auto_22398 ?auto_22411 ) ) ( not ( = ?auto_22398 ?auto_22420 ) ) ( not ( = ?auto_22398 ?auto_22410 ) ) ( not ( = ?auto_22398 ?auto_22422 ) ) ( not ( = ?auto_22398 ?auto_22407 ) ) ( not ( = ?auto_22398 ?auto_22415 ) ) ( not ( = ?auto_22398 ?auto_22413 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_22388 ?auto_22389 ?auto_22390 ?auto_22391 ?auto_22392 ?auto_22393 ?auto_22394 ?auto_22395 ?auto_22396 )
      ( MAKE-1CRATE ?auto_22396 ?auto_22397 )
      ( MAKE-9CRATE-VERIFY ?auto_22388 ?auto_22389 ?auto_22390 ?auto_22391 ?auto_22392 ?auto_22393 ?auto_22394 ?auto_22395 ?auto_22396 ?auto_22397 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_22445 - SURFACE
      ?auto_22446 - SURFACE
      ?auto_22447 - SURFACE
      ?auto_22448 - SURFACE
      ?auto_22449 - SURFACE
      ?auto_22450 - SURFACE
      ?auto_22451 - SURFACE
      ?auto_22452 - SURFACE
      ?auto_22453 - SURFACE
      ?auto_22454 - SURFACE
      ?auto_22455 - SURFACE
    )
    :vars
    (
      ?auto_22461 - HOIST
      ?auto_22456 - PLACE
      ?auto_22458 - PLACE
      ?auto_22460 - HOIST
      ?auto_22459 - SURFACE
      ?auto_22464 - PLACE
      ?auto_22477 - HOIST
      ?auto_22476 - SURFACE
      ?auto_22466 - PLACE
      ?auto_22465 - HOIST
      ?auto_22480 - SURFACE
      ?auto_22469 - PLACE
      ?auto_22473 - HOIST
      ?auto_22467 - SURFACE
      ?auto_22475 - SURFACE
      ?auto_22472 - PLACE
      ?auto_22468 - HOIST
      ?auto_22470 - SURFACE
      ?auto_22482 - PLACE
      ?auto_22471 - HOIST
      ?auto_22474 - SURFACE
      ?auto_22479 - PLACE
      ?auto_22463 - HOIST
      ?auto_22478 - SURFACE
      ?auto_22481 - SURFACE
      ?auto_22462 - SURFACE
      ?auto_22457 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22461 ?auto_22456 ) ( IS-CRATE ?auto_22455 ) ( not ( = ?auto_22458 ?auto_22456 ) ) ( HOIST-AT ?auto_22460 ?auto_22458 ) ( SURFACE-AT ?auto_22455 ?auto_22458 ) ( ON ?auto_22455 ?auto_22459 ) ( CLEAR ?auto_22455 ) ( not ( = ?auto_22454 ?auto_22455 ) ) ( not ( = ?auto_22454 ?auto_22459 ) ) ( not ( = ?auto_22455 ?auto_22459 ) ) ( not ( = ?auto_22461 ?auto_22460 ) ) ( IS-CRATE ?auto_22454 ) ( not ( = ?auto_22464 ?auto_22456 ) ) ( HOIST-AT ?auto_22477 ?auto_22464 ) ( SURFACE-AT ?auto_22454 ?auto_22464 ) ( ON ?auto_22454 ?auto_22476 ) ( CLEAR ?auto_22454 ) ( not ( = ?auto_22453 ?auto_22454 ) ) ( not ( = ?auto_22453 ?auto_22476 ) ) ( not ( = ?auto_22454 ?auto_22476 ) ) ( not ( = ?auto_22461 ?auto_22477 ) ) ( IS-CRATE ?auto_22453 ) ( not ( = ?auto_22466 ?auto_22456 ) ) ( HOIST-AT ?auto_22465 ?auto_22466 ) ( AVAILABLE ?auto_22465 ) ( SURFACE-AT ?auto_22453 ?auto_22466 ) ( ON ?auto_22453 ?auto_22480 ) ( CLEAR ?auto_22453 ) ( not ( = ?auto_22452 ?auto_22453 ) ) ( not ( = ?auto_22452 ?auto_22480 ) ) ( not ( = ?auto_22453 ?auto_22480 ) ) ( not ( = ?auto_22461 ?auto_22465 ) ) ( IS-CRATE ?auto_22452 ) ( not ( = ?auto_22469 ?auto_22456 ) ) ( HOIST-AT ?auto_22473 ?auto_22469 ) ( AVAILABLE ?auto_22473 ) ( SURFACE-AT ?auto_22452 ?auto_22469 ) ( ON ?auto_22452 ?auto_22467 ) ( CLEAR ?auto_22452 ) ( not ( = ?auto_22451 ?auto_22452 ) ) ( not ( = ?auto_22451 ?auto_22467 ) ) ( not ( = ?auto_22452 ?auto_22467 ) ) ( not ( = ?auto_22461 ?auto_22473 ) ) ( IS-CRATE ?auto_22451 ) ( AVAILABLE ?auto_22460 ) ( SURFACE-AT ?auto_22451 ?auto_22458 ) ( ON ?auto_22451 ?auto_22475 ) ( CLEAR ?auto_22451 ) ( not ( = ?auto_22450 ?auto_22451 ) ) ( not ( = ?auto_22450 ?auto_22475 ) ) ( not ( = ?auto_22451 ?auto_22475 ) ) ( IS-CRATE ?auto_22450 ) ( not ( = ?auto_22472 ?auto_22456 ) ) ( HOIST-AT ?auto_22468 ?auto_22472 ) ( SURFACE-AT ?auto_22450 ?auto_22472 ) ( ON ?auto_22450 ?auto_22470 ) ( CLEAR ?auto_22450 ) ( not ( = ?auto_22449 ?auto_22450 ) ) ( not ( = ?auto_22449 ?auto_22470 ) ) ( not ( = ?auto_22450 ?auto_22470 ) ) ( not ( = ?auto_22461 ?auto_22468 ) ) ( IS-CRATE ?auto_22449 ) ( not ( = ?auto_22482 ?auto_22456 ) ) ( HOIST-AT ?auto_22471 ?auto_22482 ) ( AVAILABLE ?auto_22471 ) ( SURFACE-AT ?auto_22449 ?auto_22482 ) ( ON ?auto_22449 ?auto_22474 ) ( CLEAR ?auto_22449 ) ( not ( = ?auto_22448 ?auto_22449 ) ) ( not ( = ?auto_22448 ?auto_22474 ) ) ( not ( = ?auto_22449 ?auto_22474 ) ) ( not ( = ?auto_22461 ?auto_22471 ) ) ( IS-CRATE ?auto_22448 ) ( not ( = ?auto_22479 ?auto_22456 ) ) ( HOIST-AT ?auto_22463 ?auto_22479 ) ( AVAILABLE ?auto_22463 ) ( SURFACE-AT ?auto_22448 ?auto_22479 ) ( ON ?auto_22448 ?auto_22478 ) ( CLEAR ?auto_22448 ) ( not ( = ?auto_22447 ?auto_22448 ) ) ( not ( = ?auto_22447 ?auto_22478 ) ) ( not ( = ?auto_22448 ?auto_22478 ) ) ( not ( = ?auto_22461 ?auto_22463 ) ) ( IS-CRATE ?auto_22447 ) ( AVAILABLE ?auto_22468 ) ( SURFACE-AT ?auto_22447 ?auto_22472 ) ( ON ?auto_22447 ?auto_22481 ) ( CLEAR ?auto_22447 ) ( not ( = ?auto_22446 ?auto_22447 ) ) ( not ( = ?auto_22446 ?auto_22481 ) ) ( not ( = ?auto_22447 ?auto_22481 ) ) ( SURFACE-AT ?auto_22445 ?auto_22456 ) ( CLEAR ?auto_22445 ) ( IS-CRATE ?auto_22446 ) ( AVAILABLE ?auto_22461 ) ( AVAILABLE ?auto_22477 ) ( SURFACE-AT ?auto_22446 ?auto_22464 ) ( ON ?auto_22446 ?auto_22462 ) ( CLEAR ?auto_22446 ) ( TRUCK-AT ?auto_22457 ?auto_22456 ) ( not ( = ?auto_22445 ?auto_22446 ) ) ( not ( = ?auto_22445 ?auto_22462 ) ) ( not ( = ?auto_22446 ?auto_22462 ) ) ( not ( = ?auto_22445 ?auto_22447 ) ) ( not ( = ?auto_22445 ?auto_22481 ) ) ( not ( = ?auto_22447 ?auto_22462 ) ) ( not ( = ?auto_22472 ?auto_22464 ) ) ( not ( = ?auto_22468 ?auto_22477 ) ) ( not ( = ?auto_22481 ?auto_22462 ) ) ( not ( = ?auto_22445 ?auto_22448 ) ) ( not ( = ?auto_22445 ?auto_22478 ) ) ( not ( = ?auto_22446 ?auto_22448 ) ) ( not ( = ?auto_22446 ?auto_22478 ) ) ( not ( = ?auto_22448 ?auto_22481 ) ) ( not ( = ?auto_22448 ?auto_22462 ) ) ( not ( = ?auto_22479 ?auto_22472 ) ) ( not ( = ?auto_22479 ?auto_22464 ) ) ( not ( = ?auto_22463 ?auto_22468 ) ) ( not ( = ?auto_22463 ?auto_22477 ) ) ( not ( = ?auto_22478 ?auto_22481 ) ) ( not ( = ?auto_22478 ?auto_22462 ) ) ( not ( = ?auto_22445 ?auto_22449 ) ) ( not ( = ?auto_22445 ?auto_22474 ) ) ( not ( = ?auto_22446 ?auto_22449 ) ) ( not ( = ?auto_22446 ?auto_22474 ) ) ( not ( = ?auto_22447 ?auto_22449 ) ) ( not ( = ?auto_22447 ?auto_22474 ) ) ( not ( = ?auto_22449 ?auto_22478 ) ) ( not ( = ?auto_22449 ?auto_22481 ) ) ( not ( = ?auto_22449 ?auto_22462 ) ) ( not ( = ?auto_22482 ?auto_22479 ) ) ( not ( = ?auto_22482 ?auto_22472 ) ) ( not ( = ?auto_22482 ?auto_22464 ) ) ( not ( = ?auto_22471 ?auto_22463 ) ) ( not ( = ?auto_22471 ?auto_22468 ) ) ( not ( = ?auto_22471 ?auto_22477 ) ) ( not ( = ?auto_22474 ?auto_22478 ) ) ( not ( = ?auto_22474 ?auto_22481 ) ) ( not ( = ?auto_22474 ?auto_22462 ) ) ( not ( = ?auto_22445 ?auto_22450 ) ) ( not ( = ?auto_22445 ?auto_22470 ) ) ( not ( = ?auto_22446 ?auto_22450 ) ) ( not ( = ?auto_22446 ?auto_22470 ) ) ( not ( = ?auto_22447 ?auto_22450 ) ) ( not ( = ?auto_22447 ?auto_22470 ) ) ( not ( = ?auto_22448 ?auto_22450 ) ) ( not ( = ?auto_22448 ?auto_22470 ) ) ( not ( = ?auto_22450 ?auto_22474 ) ) ( not ( = ?auto_22450 ?auto_22478 ) ) ( not ( = ?auto_22450 ?auto_22481 ) ) ( not ( = ?auto_22450 ?auto_22462 ) ) ( not ( = ?auto_22470 ?auto_22474 ) ) ( not ( = ?auto_22470 ?auto_22478 ) ) ( not ( = ?auto_22470 ?auto_22481 ) ) ( not ( = ?auto_22470 ?auto_22462 ) ) ( not ( = ?auto_22445 ?auto_22451 ) ) ( not ( = ?auto_22445 ?auto_22475 ) ) ( not ( = ?auto_22446 ?auto_22451 ) ) ( not ( = ?auto_22446 ?auto_22475 ) ) ( not ( = ?auto_22447 ?auto_22451 ) ) ( not ( = ?auto_22447 ?auto_22475 ) ) ( not ( = ?auto_22448 ?auto_22451 ) ) ( not ( = ?auto_22448 ?auto_22475 ) ) ( not ( = ?auto_22449 ?auto_22451 ) ) ( not ( = ?auto_22449 ?auto_22475 ) ) ( not ( = ?auto_22451 ?auto_22470 ) ) ( not ( = ?auto_22451 ?auto_22474 ) ) ( not ( = ?auto_22451 ?auto_22478 ) ) ( not ( = ?auto_22451 ?auto_22481 ) ) ( not ( = ?auto_22451 ?auto_22462 ) ) ( not ( = ?auto_22458 ?auto_22472 ) ) ( not ( = ?auto_22458 ?auto_22482 ) ) ( not ( = ?auto_22458 ?auto_22479 ) ) ( not ( = ?auto_22458 ?auto_22464 ) ) ( not ( = ?auto_22460 ?auto_22468 ) ) ( not ( = ?auto_22460 ?auto_22471 ) ) ( not ( = ?auto_22460 ?auto_22463 ) ) ( not ( = ?auto_22460 ?auto_22477 ) ) ( not ( = ?auto_22475 ?auto_22470 ) ) ( not ( = ?auto_22475 ?auto_22474 ) ) ( not ( = ?auto_22475 ?auto_22478 ) ) ( not ( = ?auto_22475 ?auto_22481 ) ) ( not ( = ?auto_22475 ?auto_22462 ) ) ( not ( = ?auto_22445 ?auto_22452 ) ) ( not ( = ?auto_22445 ?auto_22467 ) ) ( not ( = ?auto_22446 ?auto_22452 ) ) ( not ( = ?auto_22446 ?auto_22467 ) ) ( not ( = ?auto_22447 ?auto_22452 ) ) ( not ( = ?auto_22447 ?auto_22467 ) ) ( not ( = ?auto_22448 ?auto_22452 ) ) ( not ( = ?auto_22448 ?auto_22467 ) ) ( not ( = ?auto_22449 ?auto_22452 ) ) ( not ( = ?auto_22449 ?auto_22467 ) ) ( not ( = ?auto_22450 ?auto_22452 ) ) ( not ( = ?auto_22450 ?auto_22467 ) ) ( not ( = ?auto_22452 ?auto_22475 ) ) ( not ( = ?auto_22452 ?auto_22470 ) ) ( not ( = ?auto_22452 ?auto_22474 ) ) ( not ( = ?auto_22452 ?auto_22478 ) ) ( not ( = ?auto_22452 ?auto_22481 ) ) ( not ( = ?auto_22452 ?auto_22462 ) ) ( not ( = ?auto_22469 ?auto_22458 ) ) ( not ( = ?auto_22469 ?auto_22472 ) ) ( not ( = ?auto_22469 ?auto_22482 ) ) ( not ( = ?auto_22469 ?auto_22479 ) ) ( not ( = ?auto_22469 ?auto_22464 ) ) ( not ( = ?auto_22473 ?auto_22460 ) ) ( not ( = ?auto_22473 ?auto_22468 ) ) ( not ( = ?auto_22473 ?auto_22471 ) ) ( not ( = ?auto_22473 ?auto_22463 ) ) ( not ( = ?auto_22473 ?auto_22477 ) ) ( not ( = ?auto_22467 ?auto_22475 ) ) ( not ( = ?auto_22467 ?auto_22470 ) ) ( not ( = ?auto_22467 ?auto_22474 ) ) ( not ( = ?auto_22467 ?auto_22478 ) ) ( not ( = ?auto_22467 ?auto_22481 ) ) ( not ( = ?auto_22467 ?auto_22462 ) ) ( not ( = ?auto_22445 ?auto_22453 ) ) ( not ( = ?auto_22445 ?auto_22480 ) ) ( not ( = ?auto_22446 ?auto_22453 ) ) ( not ( = ?auto_22446 ?auto_22480 ) ) ( not ( = ?auto_22447 ?auto_22453 ) ) ( not ( = ?auto_22447 ?auto_22480 ) ) ( not ( = ?auto_22448 ?auto_22453 ) ) ( not ( = ?auto_22448 ?auto_22480 ) ) ( not ( = ?auto_22449 ?auto_22453 ) ) ( not ( = ?auto_22449 ?auto_22480 ) ) ( not ( = ?auto_22450 ?auto_22453 ) ) ( not ( = ?auto_22450 ?auto_22480 ) ) ( not ( = ?auto_22451 ?auto_22453 ) ) ( not ( = ?auto_22451 ?auto_22480 ) ) ( not ( = ?auto_22453 ?auto_22467 ) ) ( not ( = ?auto_22453 ?auto_22475 ) ) ( not ( = ?auto_22453 ?auto_22470 ) ) ( not ( = ?auto_22453 ?auto_22474 ) ) ( not ( = ?auto_22453 ?auto_22478 ) ) ( not ( = ?auto_22453 ?auto_22481 ) ) ( not ( = ?auto_22453 ?auto_22462 ) ) ( not ( = ?auto_22466 ?auto_22469 ) ) ( not ( = ?auto_22466 ?auto_22458 ) ) ( not ( = ?auto_22466 ?auto_22472 ) ) ( not ( = ?auto_22466 ?auto_22482 ) ) ( not ( = ?auto_22466 ?auto_22479 ) ) ( not ( = ?auto_22466 ?auto_22464 ) ) ( not ( = ?auto_22465 ?auto_22473 ) ) ( not ( = ?auto_22465 ?auto_22460 ) ) ( not ( = ?auto_22465 ?auto_22468 ) ) ( not ( = ?auto_22465 ?auto_22471 ) ) ( not ( = ?auto_22465 ?auto_22463 ) ) ( not ( = ?auto_22465 ?auto_22477 ) ) ( not ( = ?auto_22480 ?auto_22467 ) ) ( not ( = ?auto_22480 ?auto_22475 ) ) ( not ( = ?auto_22480 ?auto_22470 ) ) ( not ( = ?auto_22480 ?auto_22474 ) ) ( not ( = ?auto_22480 ?auto_22478 ) ) ( not ( = ?auto_22480 ?auto_22481 ) ) ( not ( = ?auto_22480 ?auto_22462 ) ) ( not ( = ?auto_22445 ?auto_22454 ) ) ( not ( = ?auto_22445 ?auto_22476 ) ) ( not ( = ?auto_22446 ?auto_22454 ) ) ( not ( = ?auto_22446 ?auto_22476 ) ) ( not ( = ?auto_22447 ?auto_22454 ) ) ( not ( = ?auto_22447 ?auto_22476 ) ) ( not ( = ?auto_22448 ?auto_22454 ) ) ( not ( = ?auto_22448 ?auto_22476 ) ) ( not ( = ?auto_22449 ?auto_22454 ) ) ( not ( = ?auto_22449 ?auto_22476 ) ) ( not ( = ?auto_22450 ?auto_22454 ) ) ( not ( = ?auto_22450 ?auto_22476 ) ) ( not ( = ?auto_22451 ?auto_22454 ) ) ( not ( = ?auto_22451 ?auto_22476 ) ) ( not ( = ?auto_22452 ?auto_22454 ) ) ( not ( = ?auto_22452 ?auto_22476 ) ) ( not ( = ?auto_22454 ?auto_22480 ) ) ( not ( = ?auto_22454 ?auto_22467 ) ) ( not ( = ?auto_22454 ?auto_22475 ) ) ( not ( = ?auto_22454 ?auto_22470 ) ) ( not ( = ?auto_22454 ?auto_22474 ) ) ( not ( = ?auto_22454 ?auto_22478 ) ) ( not ( = ?auto_22454 ?auto_22481 ) ) ( not ( = ?auto_22454 ?auto_22462 ) ) ( not ( = ?auto_22476 ?auto_22480 ) ) ( not ( = ?auto_22476 ?auto_22467 ) ) ( not ( = ?auto_22476 ?auto_22475 ) ) ( not ( = ?auto_22476 ?auto_22470 ) ) ( not ( = ?auto_22476 ?auto_22474 ) ) ( not ( = ?auto_22476 ?auto_22478 ) ) ( not ( = ?auto_22476 ?auto_22481 ) ) ( not ( = ?auto_22476 ?auto_22462 ) ) ( not ( = ?auto_22445 ?auto_22455 ) ) ( not ( = ?auto_22445 ?auto_22459 ) ) ( not ( = ?auto_22446 ?auto_22455 ) ) ( not ( = ?auto_22446 ?auto_22459 ) ) ( not ( = ?auto_22447 ?auto_22455 ) ) ( not ( = ?auto_22447 ?auto_22459 ) ) ( not ( = ?auto_22448 ?auto_22455 ) ) ( not ( = ?auto_22448 ?auto_22459 ) ) ( not ( = ?auto_22449 ?auto_22455 ) ) ( not ( = ?auto_22449 ?auto_22459 ) ) ( not ( = ?auto_22450 ?auto_22455 ) ) ( not ( = ?auto_22450 ?auto_22459 ) ) ( not ( = ?auto_22451 ?auto_22455 ) ) ( not ( = ?auto_22451 ?auto_22459 ) ) ( not ( = ?auto_22452 ?auto_22455 ) ) ( not ( = ?auto_22452 ?auto_22459 ) ) ( not ( = ?auto_22453 ?auto_22455 ) ) ( not ( = ?auto_22453 ?auto_22459 ) ) ( not ( = ?auto_22455 ?auto_22476 ) ) ( not ( = ?auto_22455 ?auto_22480 ) ) ( not ( = ?auto_22455 ?auto_22467 ) ) ( not ( = ?auto_22455 ?auto_22475 ) ) ( not ( = ?auto_22455 ?auto_22470 ) ) ( not ( = ?auto_22455 ?auto_22474 ) ) ( not ( = ?auto_22455 ?auto_22478 ) ) ( not ( = ?auto_22455 ?auto_22481 ) ) ( not ( = ?auto_22455 ?auto_22462 ) ) ( not ( = ?auto_22459 ?auto_22476 ) ) ( not ( = ?auto_22459 ?auto_22480 ) ) ( not ( = ?auto_22459 ?auto_22467 ) ) ( not ( = ?auto_22459 ?auto_22475 ) ) ( not ( = ?auto_22459 ?auto_22470 ) ) ( not ( = ?auto_22459 ?auto_22474 ) ) ( not ( = ?auto_22459 ?auto_22478 ) ) ( not ( = ?auto_22459 ?auto_22481 ) ) ( not ( = ?auto_22459 ?auto_22462 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_22445 ?auto_22446 ?auto_22447 ?auto_22448 ?auto_22449 ?auto_22450 ?auto_22451 ?auto_22452 ?auto_22453 ?auto_22454 )
      ( MAKE-1CRATE ?auto_22454 ?auto_22455 )
      ( MAKE-10CRATE-VERIFY ?auto_22445 ?auto_22446 ?auto_22447 ?auto_22448 ?auto_22449 ?auto_22450 ?auto_22451 ?auto_22452 ?auto_22453 ?auto_22454 ?auto_22455 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_22505 - SURFACE
      ?auto_22506 - SURFACE
      ?auto_22507 - SURFACE
      ?auto_22508 - SURFACE
      ?auto_22509 - SURFACE
      ?auto_22510 - SURFACE
      ?auto_22511 - SURFACE
      ?auto_22512 - SURFACE
      ?auto_22513 - SURFACE
      ?auto_22514 - SURFACE
      ?auto_22515 - SURFACE
      ?auto_22516 - SURFACE
    )
    :vars
    (
      ?auto_22521 - HOIST
      ?auto_22519 - PLACE
      ?auto_22522 - PLACE
      ?auto_22520 - HOIST
      ?auto_22517 - SURFACE
      ?auto_22527 - PLACE
      ?auto_22540 - HOIST
      ?auto_22543 - SURFACE
      ?auto_22541 - PLACE
      ?auto_22530 - HOIST
      ?auto_22544 - SURFACE
      ?auto_22523 - PLACE
      ?auto_22538 - HOIST
      ?auto_22534 - SURFACE
      ?auto_22524 - PLACE
      ?auto_22535 - HOIST
      ?auto_22533 - SURFACE
      ?auto_22529 - SURFACE
      ?auto_22528 - PLACE
      ?auto_22539 - HOIST
      ?auto_22537 - SURFACE
      ?auto_22536 - PLACE
      ?auto_22526 - HOIST
      ?auto_22542 - SURFACE
      ?auto_22525 - SURFACE
      ?auto_22531 - SURFACE
      ?auto_22532 - SURFACE
      ?auto_22518 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22521 ?auto_22519 ) ( IS-CRATE ?auto_22516 ) ( not ( = ?auto_22522 ?auto_22519 ) ) ( HOIST-AT ?auto_22520 ?auto_22522 ) ( SURFACE-AT ?auto_22516 ?auto_22522 ) ( ON ?auto_22516 ?auto_22517 ) ( CLEAR ?auto_22516 ) ( not ( = ?auto_22515 ?auto_22516 ) ) ( not ( = ?auto_22515 ?auto_22517 ) ) ( not ( = ?auto_22516 ?auto_22517 ) ) ( not ( = ?auto_22521 ?auto_22520 ) ) ( IS-CRATE ?auto_22515 ) ( not ( = ?auto_22527 ?auto_22519 ) ) ( HOIST-AT ?auto_22540 ?auto_22527 ) ( SURFACE-AT ?auto_22515 ?auto_22527 ) ( ON ?auto_22515 ?auto_22543 ) ( CLEAR ?auto_22515 ) ( not ( = ?auto_22514 ?auto_22515 ) ) ( not ( = ?auto_22514 ?auto_22543 ) ) ( not ( = ?auto_22515 ?auto_22543 ) ) ( not ( = ?auto_22521 ?auto_22540 ) ) ( IS-CRATE ?auto_22514 ) ( not ( = ?auto_22541 ?auto_22519 ) ) ( HOIST-AT ?auto_22530 ?auto_22541 ) ( SURFACE-AT ?auto_22514 ?auto_22541 ) ( ON ?auto_22514 ?auto_22544 ) ( CLEAR ?auto_22514 ) ( not ( = ?auto_22513 ?auto_22514 ) ) ( not ( = ?auto_22513 ?auto_22544 ) ) ( not ( = ?auto_22514 ?auto_22544 ) ) ( not ( = ?auto_22521 ?auto_22530 ) ) ( IS-CRATE ?auto_22513 ) ( not ( = ?auto_22523 ?auto_22519 ) ) ( HOIST-AT ?auto_22538 ?auto_22523 ) ( AVAILABLE ?auto_22538 ) ( SURFACE-AT ?auto_22513 ?auto_22523 ) ( ON ?auto_22513 ?auto_22534 ) ( CLEAR ?auto_22513 ) ( not ( = ?auto_22512 ?auto_22513 ) ) ( not ( = ?auto_22512 ?auto_22534 ) ) ( not ( = ?auto_22513 ?auto_22534 ) ) ( not ( = ?auto_22521 ?auto_22538 ) ) ( IS-CRATE ?auto_22512 ) ( not ( = ?auto_22524 ?auto_22519 ) ) ( HOIST-AT ?auto_22535 ?auto_22524 ) ( AVAILABLE ?auto_22535 ) ( SURFACE-AT ?auto_22512 ?auto_22524 ) ( ON ?auto_22512 ?auto_22533 ) ( CLEAR ?auto_22512 ) ( not ( = ?auto_22511 ?auto_22512 ) ) ( not ( = ?auto_22511 ?auto_22533 ) ) ( not ( = ?auto_22512 ?auto_22533 ) ) ( not ( = ?auto_22521 ?auto_22535 ) ) ( IS-CRATE ?auto_22511 ) ( AVAILABLE ?auto_22540 ) ( SURFACE-AT ?auto_22511 ?auto_22527 ) ( ON ?auto_22511 ?auto_22529 ) ( CLEAR ?auto_22511 ) ( not ( = ?auto_22510 ?auto_22511 ) ) ( not ( = ?auto_22510 ?auto_22529 ) ) ( not ( = ?auto_22511 ?auto_22529 ) ) ( IS-CRATE ?auto_22510 ) ( not ( = ?auto_22528 ?auto_22519 ) ) ( HOIST-AT ?auto_22539 ?auto_22528 ) ( SURFACE-AT ?auto_22510 ?auto_22528 ) ( ON ?auto_22510 ?auto_22537 ) ( CLEAR ?auto_22510 ) ( not ( = ?auto_22509 ?auto_22510 ) ) ( not ( = ?auto_22509 ?auto_22537 ) ) ( not ( = ?auto_22510 ?auto_22537 ) ) ( not ( = ?auto_22521 ?auto_22539 ) ) ( IS-CRATE ?auto_22509 ) ( not ( = ?auto_22536 ?auto_22519 ) ) ( HOIST-AT ?auto_22526 ?auto_22536 ) ( AVAILABLE ?auto_22526 ) ( SURFACE-AT ?auto_22509 ?auto_22536 ) ( ON ?auto_22509 ?auto_22542 ) ( CLEAR ?auto_22509 ) ( not ( = ?auto_22508 ?auto_22509 ) ) ( not ( = ?auto_22508 ?auto_22542 ) ) ( not ( = ?auto_22509 ?auto_22542 ) ) ( not ( = ?auto_22521 ?auto_22526 ) ) ( IS-CRATE ?auto_22508 ) ( AVAILABLE ?auto_22520 ) ( SURFACE-AT ?auto_22508 ?auto_22522 ) ( ON ?auto_22508 ?auto_22525 ) ( CLEAR ?auto_22508 ) ( not ( = ?auto_22507 ?auto_22508 ) ) ( not ( = ?auto_22507 ?auto_22525 ) ) ( not ( = ?auto_22508 ?auto_22525 ) ) ( IS-CRATE ?auto_22507 ) ( AVAILABLE ?auto_22539 ) ( SURFACE-AT ?auto_22507 ?auto_22528 ) ( ON ?auto_22507 ?auto_22531 ) ( CLEAR ?auto_22507 ) ( not ( = ?auto_22506 ?auto_22507 ) ) ( not ( = ?auto_22506 ?auto_22531 ) ) ( not ( = ?auto_22507 ?auto_22531 ) ) ( SURFACE-AT ?auto_22505 ?auto_22519 ) ( CLEAR ?auto_22505 ) ( IS-CRATE ?auto_22506 ) ( AVAILABLE ?auto_22521 ) ( AVAILABLE ?auto_22530 ) ( SURFACE-AT ?auto_22506 ?auto_22541 ) ( ON ?auto_22506 ?auto_22532 ) ( CLEAR ?auto_22506 ) ( TRUCK-AT ?auto_22518 ?auto_22519 ) ( not ( = ?auto_22505 ?auto_22506 ) ) ( not ( = ?auto_22505 ?auto_22532 ) ) ( not ( = ?auto_22506 ?auto_22532 ) ) ( not ( = ?auto_22505 ?auto_22507 ) ) ( not ( = ?auto_22505 ?auto_22531 ) ) ( not ( = ?auto_22507 ?auto_22532 ) ) ( not ( = ?auto_22528 ?auto_22541 ) ) ( not ( = ?auto_22539 ?auto_22530 ) ) ( not ( = ?auto_22531 ?auto_22532 ) ) ( not ( = ?auto_22505 ?auto_22508 ) ) ( not ( = ?auto_22505 ?auto_22525 ) ) ( not ( = ?auto_22506 ?auto_22508 ) ) ( not ( = ?auto_22506 ?auto_22525 ) ) ( not ( = ?auto_22508 ?auto_22531 ) ) ( not ( = ?auto_22508 ?auto_22532 ) ) ( not ( = ?auto_22522 ?auto_22528 ) ) ( not ( = ?auto_22522 ?auto_22541 ) ) ( not ( = ?auto_22520 ?auto_22539 ) ) ( not ( = ?auto_22520 ?auto_22530 ) ) ( not ( = ?auto_22525 ?auto_22531 ) ) ( not ( = ?auto_22525 ?auto_22532 ) ) ( not ( = ?auto_22505 ?auto_22509 ) ) ( not ( = ?auto_22505 ?auto_22542 ) ) ( not ( = ?auto_22506 ?auto_22509 ) ) ( not ( = ?auto_22506 ?auto_22542 ) ) ( not ( = ?auto_22507 ?auto_22509 ) ) ( not ( = ?auto_22507 ?auto_22542 ) ) ( not ( = ?auto_22509 ?auto_22525 ) ) ( not ( = ?auto_22509 ?auto_22531 ) ) ( not ( = ?auto_22509 ?auto_22532 ) ) ( not ( = ?auto_22536 ?auto_22522 ) ) ( not ( = ?auto_22536 ?auto_22528 ) ) ( not ( = ?auto_22536 ?auto_22541 ) ) ( not ( = ?auto_22526 ?auto_22520 ) ) ( not ( = ?auto_22526 ?auto_22539 ) ) ( not ( = ?auto_22526 ?auto_22530 ) ) ( not ( = ?auto_22542 ?auto_22525 ) ) ( not ( = ?auto_22542 ?auto_22531 ) ) ( not ( = ?auto_22542 ?auto_22532 ) ) ( not ( = ?auto_22505 ?auto_22510 ) ) ( not ( = ?auto_22505 ?auto_22537 ) ) ( not ( = ?auto_22506 ?auto_22510 ) ) ( not ( = ?auto_22506 ?auto_22537 ) ) ( not ( = ?auto_22507 ?auto_22510 ) ) ( not ( = ?auto_22507 ?auto_22537 ) ) ( not ( = ?auto_22508 ?auto_22510 ) ) ( not ( = ?auto_22508 ?auto_22537 ) ) ( not ( = ?auto_22510 ?auto_22542 ) ) ( not ( = ?auto_22510 ?auto_22525 ) ) ( not ( = ?auto_22510 ?auto_22531 ) ) ( not ( = ?auto_22510 ?auto_22532 ) ) ( not ( = ?auto_22537 ?auto_22542 ) ) ( not ( = ?auto_22537 ?auto_22525 ) ) ( not ( = ?auto_22537 ?auto_22531 ) ) ( not ( = ?auto_22537 ?auto_22532 ) ) ( not ( = ?auto_22505 ?auto_22511 ) ) ( not ( = ?auto_22505 ?auto_22529 ) ) ( not ( = ?auto_22506 ?auto_22511 ) ) ( not ( = ?auto_22506 ?auto_22529 ) ) ( not ( = ?auto_22507 ?auto_22511 ) ) ( not ( = ?auto_22507 ?auto_22529 ) ) ( not ( = ?auto_22508 ?auto_22511 ) ) ( not ( = ?auto_22508 ?auto_22529 ) ) ( not ( = ?auto_22509 ?auto_22511 ) ) ( not ( = ?auto_22509 ?auto_22529 ) ) ( not ( = ?auto_22511 ?auto_22537 ) ) ( not ( = ?auto_22511 ?auto_22542 ) ) ( not ( = ?auto_22511 ?auto_22525 ) ) ( not ( = ?auto_22511 ?auto_22531 ) ) ( not ( = ?auto_22511 ?auto_22532 ) ) ( not ( = ?auto_22527 ?auto_22528 ) ) ( not ( = ?auto_22527 ?auto_22536 ) ) ( not ( = ?auto_22527 ?auto_22522 ) ) ( not ( = ?auto_22527 ?auto_22541 ) ) ( not ( = ?auto_22540 ?auto_22539 ) ) ( not ( = ?auto_22540 ?auto_22526 ) ) ( not ( = ?auto_22540 ?auto_22520 ) ) ( not ( = ?auto_22540 ?auto_22530 ) ) ( not ( = ?auto_22529 ?auto_22537 ) ) ( not ( = ?auto_22529 ?auto_22542 ) ) ( not ( = ?auto_22529 ?auto_22525 ) ) ( not ( = ?auto_22529 ?auto_22531 ) ) ( not ( = ?auto_22529 ?auto_22532 ) ) ( not ( = ?auto_22505 ?auto_22512 ) ) ( not ( = ?auto_22505 ?auto_22533 ) ) ( not ( = ?auto_22506 ?auto_22512 ) ) ( not ( = ?auto_22506 ?auto_22533 ) ) ( not ( = ?auto_22507 ?auto_22512 ) ) ( not ( = ?auto_22507 ?auto_22533 ) ) ( not ( = ?auto_22508 ?auto_22512 ) ) ( not ( = ?auto_22508 ?auto_22533 ) ) ( not ( = ?auto_22509 ?auto_22512 ) ) ( not ( = ?auto_22509 ?auto_22533 ) ) ( not ( = ?auto_22510 ?auto_22512 ) ) ( not ( = ?auto_22510 ?auto_22533 ) ) ( not ( = ?auto_22512 ?auto_22529 ) ) ( not ( = ?auto_22512 ?auto_22537 ) ) ( not ( = ?auto_22512 ?auto_22542 ) ) ( not ( = ?auto_22512 ?auto_22525 ) ) ( not ( = ?auto_22512 ?auto_22531 ) ) ( not ( = ?auto_22512 ?auto_22532 ) ) ( not ( = ?auto_22524 ?auto_22527 ) ) ( not ( = ?auto_22524 ?auto_22528 ) ) ( not ( = ?auto_22524 ?auto_22536 ) ) ( not ( = ?auto_22524 ?auto_22522 ) ) ( not ( = ?auto_22524 ?auto_22541 ) ) ( not ( = ?auto_22535 ?auto_22540 ) ) ( not ( = ?auto_22535 ?auto_22539 ) ) ( not ( = ?auto_22535 ?auto_22526 ) ) ( not ( = ?auto_22535 ?auto_22520 ) ) ( not ( = ?auto_22535 ?auto_22530 ) ) ( not ( = ?auto_22533 ?auto_22529 ) ) ( not ( = ?auto_22533 ?auto_22537 ) ) ( not ( = ?auto_22533 ?auto_22542 ) ) ( not ( = ?auto_22533 ?auto_22525 ) ) ( not ( = ?auto_22533 ?auto_22531 ) ) ( not ( = ?auto_22533 ?auto_22532 ) ) ( not ( = ?auto_22505 ?auto_22513 ) ) ( not ( = ?auto_22505 ?auto_22534 ) ) ( not ( = ?auto_22506 ?auto_22513 ) ) ( not ( = ?auto_22506 ?auto_22534 ) ) ( not ( = ?auto_22507 ?auto_22513 ) ) ( not ( = ?auto_22507 ?auto_22534 ) ) ( not ( = ?auto_22508 ?auto_22513 ) ) ( not ( = ?auto_22508 ?auto_22534 ) ) ( not ( = ?auto_22509 ?auto_22513 ) ) ( not ( = ?auto_22509 ?auto_22534 ) ) ( not ( = ?auto_22510 ?auto_22513 ) ) ( not ( = ?auto_22510 ?auto_22534 ) ) ( not ( = ?auto_22511 ?auto_22513 ) ) ( not ( = ?auto_22511 ?auto_22534 ) ) ( not ( = ?auto_22513 ?auto_22533 ) ) ( not ( = ?auto_22513 ?auto_22529 ) ) ( not ( = ?auto_22513 ?auto_22537 ) ) ( not ( = ?auto_22513 ?auto_22542 ) ) ( not ( = ?auto_22513 ?auto_22525 ) ) ( not ( = ?auto_22513 ?auto_22531 ) ) ( not ( = ?auto_22513 ?auto_22532 ) ) ( not ( = ?auto_22523 ?auto_22524 ) ) ( not ( = ?auto_22523 ?auto_22527 ) ) ( not ( = ?auto_22523 ?auto_22528 ) ) ( not ( = ?auto_22523 ?auto_22536 ) ) ( not ( = ?auto_22523 ?auto_22522 ) ) ( not ( = ?auto_22523 ?auto_22541 ) ) ( not ( = ?auto_22538 ?auto_22535 ) ) ( not ( = ?auto_22538 ?auto_22540 ) ) ( not ( = ?auto_22538 ?auto_22539 ) ) ( not ( = ?auto_22538 ?auto_22526 ) ) ( not ( = ?auto_22538 ?auto_22520 ) ) ( not ( = ?auto_22538 ?auto_22530 ) ) ( not ( = ?auto_22534 ?auto_22533 ) ) ( not ( = ?auto_22534 ?auto_22529 ) ) ( not ( = ?auto_22534 ?auto_22537 ) ) ( not ( = ?auto_22534 ?auto_22542 ) ) ( not ( = ?auto_22534 ?auto_22525 ) ) ( not ( = ?auto_22534 ?auto_22531 ) ) ( not ( = ?auto_22534 ?auto_22532 ) ) ( not ( = ?auto_22505 ?auto_22514 ) ) ( not ( = ?auto_22505 ?auto_22544 ) ) ( not ( = ?auto_22506 ?auto_22514 ) ) ( not ( = ?auto_22506 ?auto_22544 ) ) ( not ( = ?auto_22507 ?auto_22514 ) ) ( not ( = ?auto_22507 ?auto_22544 ) ) ( not ( = ?auto_22508 ?auto_22514 ) ) ( not ( = ?auto_22508 ?auto_22544 ) ) ( not ( = ?auto_22509 ?auto_22514 ) ) ( not ( = ?auto_22509 ?auto_22544 ) ) ( not ( = ?auto_22510 ?auto_22514 ) ) ( not ( = ?auto_22510 ?auto_22544 ) ) ( not ( = ?auto_22511 ?auto_22514 ) ) ( not ( = ?auto_22511 ?auto_22544 ) ) ( not ( = ?auto_22512 ?auto_22514 ) ) ( not ( = ?auto_22512 ?auto_22544 ) ) ( not ( = ?auto_22514 ?auto_22534 ) ) ( not ( = ?auto_22514 ?auto_22533 ) ) ( not ( = ?auto_22514 ?auto_22529 ) ) ( not ( = ?auto_22514 ?auto_22537 ) ) ( not ( = ?auto_22514 ?auto_22542 ) ) ( not ( = ?auto_22514 ?auto_22525 ) ) ( not ( = ?auto_22514 ?auto_22531 ) ) ( not ( = ?auto_22514 ?auto_22532 ) ) ( not ( = ?auto_22544 ?auto_22534 ) ) ( not ( = ?auto_22544 ?auto_22533 ) ) ( not ( = ?auto_22544 ?auto_22529 ) ) ( not ( = ?auto_22544 ?auto_22537 ) ) ( not ( = ?auto_22544 ?auto_22542 ) ) ( not ( = ?auto_22544 ?auto_22525 ) ) ( not ( = ?auto_22544 ?auto_22531 ) ) ( not ( = ?auto_22544 ?auto_22532 ) ) ( not ( = ?auto_22505 ?auto_22515 ) ) ( not ( = ?auto_22505 ?auto_22543 ) ) ( not ( = ?auto_22506 ?auto_22515 ) ) ( not ( = ?auto_22506 ?auto_22543 ) ) ( not ( = ?auto_22507 ?auto_22515 ) ) ( not ( = ?auto_22507 ?auto_22543 ) ) ( not ( = ?auto_22508 ?auto_22515 ) ) ( not ( = ?auto_22508 ?auto_22543 ) ) ( not ( = ?auto_22509 ?auto_22515 ) ) ( not ( = ?auto_22509 ?auto_22543 ) ) ( not ( = ?auto_22510 ?auto_22515 ) ) ( not ( = ?auto_22510 ?auto_22543 ) ) ( not ( = ?auto_22511 ?auto_22515 ) ) ( not ( = ?auto_22511 ?auto_22543 ) ) ( not ( = ?auto_22512 ?auto_22515 ) ) ( not ( = ?auto_22512 ?auto_22543 ) ) ( not ( = ?auto_22513 ?auto_22515 ) ) ( not ( = ?auto_22513 ?auto_22543 ) ) ( not ( = ?auto_22515 ?auto_22544 ) ) ( not ( = ?auto_22515 ?auto_22534 ) ) ( not ( = ?auto_22515 ?auto_22533 ) ) ( not ( = ?auto_22515 ?auto_22529 ) ) ( not ( = ?auto_22515 ?auto_22537 ) ) ( not ( = ?auto_22515 ?auto_22542 ) ) ( not ( = ?auto_22515 ?auto_22525 ) ) ( not ( = ?auto_22515 ?auto_22531 ) ) ( not ( = ?auto_22515 ?auto_22532 ) ) ( not ( = ?auto_22543 ?auto_22544 ) ) ( not ( = ?auto_22543 ?auto_22534 ) ) ( not ( = ?auto_22543 ?auto_22533 ) ) ( not ( = ?auto_22543 ?auto_22529 ) ) ( not ( = ?auto_22543 ?auto_22537 ) ) ( not ( = ?auto_22543 ?auto_22542 ) ) ( not ( = ?auto_22543 ?auto_22525 ) ) ( not ( = ?auto_22543 ?auto_22531 ) ) ( not ( = ?auto_22543 ?auto_22532 ) ) ( not ( = ?auto_22505 ?auto_22516 ) ) ( not ( = ?auto_22505 ?auto_22517 ) ) ( not ( = ?auto_22506 ?auto_22516 ) ) ( not ( = ?auto_22506 ?auto_22517 ) ) ( not ( = ?auto_22507 ?auto_22516 ) ) ( not ( = ?auto_22507 ?auto_22517 ) ) ( not ( = ?auto_22508 ?auto_22516 ) ) ( not ( = ?auto_22508 ?auto_22517 ) ) ( not ( = ?auto_22509 ?auto_22516 ) ) ( not ( = ?auto_22509 ?auto_22517 ) ) ( not ( = ?auto_22510 ?auto_22516 ) ) ( not ( = ?auto_22510 ?auto_22517 ) ) ( not ( = ?auto_22511 ?auto_22516 ) ) ( not ( = ?auto_22511 ?auto_22517 ) ) ( not ( = ?auto_22512 ?auto_22516 ) ) ( not ( = ?auto_22512 ?auto_22517 ) ) ( not ( = ?auto_22513 ?auto_22516 ) ) ( not ( = ?auto_22513 ?auto_22517 ) ) ( not ( = ?auto_22514 ?auto_22516 ) ) ( not ( = ?auto_22514 ?auto_22517 ) ) ( not ( = ?auto_22516 ?auto_22543 ) ) ( not ( = ?auto_22516 ?auto_22544 ) ) ( not ( = ?auto_22516 ?auto_22534 ) ) ( not ( = ?auto_22516 ?auto_22533 ) ) ( not ( = ?auto_22516 ?auto_22529 ) ) ( not ( = ?auto_22516 ?auto_22537 ) ) ( not ( = ?auto_22516 ?auto_22542 ) ) ( not ( = ?auto_22516 ?auto_22525 ) ) ( not ( = ?auto_22516 ?auto_22531 ) ) ( not ( = ?auto_22516 ?auto_22532 ) ) ( not ( = ?auto_22517 ?auto_22543 ) ) ( not ( = ?auto_22517 ?auto_22544 ) ) ( not ( = ?auto_22517 ?auto_22534 ) ) ( not ( = ?auto_22517 ?auto_22533 ) ) ( not ( = ?auto_22517 ?auto_22529 ) ) ( not ( = ?auto_22517 ?auto_22537 ) ) ( not ( = ?auto_22517 ?auto_22542 ) ) ( not ( = ?auto_22517 ?auto_22525 ) ) ( not ( = ?auto_22517 ?auto_22531 ) ) ( not ( = ?auto_22517 ?auto_22532 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_22505 ?auto_22506 ?auto_22507 ?auto_22508 ?auto_22509 ?auto_22510 ?auto_22511 ?auto_22512 ?auto_22513 ?auto_22514 ?auto_22515 )
      ( MAKE-1CRATE ?auto_22515 ?auto_22516 )
      ( MAKE-11CRATE-VERIFY ?auto_22505 ?auto_22506 ?auto_22507 ?auto_22508 ?auto_22509 ?auto_22510 ?auto_22511 ?auto_22512 ?auto_22513 ?auto_22514 ?auto_22515 ?auto_22516 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_22568 - SURFACE
      ?auto_22569 - SURFACE
      ?auto_22570 - SURFACE
      ?auto_22571 - SURFACE
      ?auto_22572 - SURFACE
      ?auto_22573 - SURFACE
      ?auto_22574 - SURFACE
      ?auto_22575 - SURFACE
      ?auto_22576 - SURFACE
      ?auto_22577 - SURFACE
      ?auto_22578 - SURFACE
      ?auto_22579 - SURFACE
      ?auto_22580 - SURFACE
    )
    :vars
    (
      ?auto_22583 - HOIST
      ?auto_22585 - PLACE
      ?auto_22584 - PLACE
      ?auto_22582 - HOIST
      ?auto_22586 - SURFACE
      ?auto_22593 - PLACE
      ?auto_22597 - HOIST
      ?auto_22600 - SURFACE
      ?auto_22590 - PLACE
      ?auto_22606 - HOIST
      ?auto_22601 - SURFACE
      ?auto_22604 - PLACE
      ?auto_22596 - HOIST
      ?auto_22605 - SURFACE
      ?auto_22594 - PLACE
      ?auto_22602 - HOIST
      ?auto_22609 - SURFACE
      ?auto_22608 - PLACE
      ?auto_22587 - HOIST
      ?auto_22598 - SURFACE
      ?auto_22603 - SURFACE
      ?auto_22595 - PLACE
      ?auto_22589 - HOIST
      ?auto_22591 - SURFACE
      ?auto_22592 - SURFACE
      ?auto_22588 - SURFACE
      ?auto_22607 - SURFACE
      ?auto_22599 - SURFACE
      ?auto_22581 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22583 ?auto_22585 ) ( IS-CRATE ?auto_22580 ) ( not ( = ?auto_22584 ?auto_22585 ) ) ( HOIST-AT ?auto_22582 ?auto_22584 ) ( SURFACE-AT ?auto_22580 ?auto_22584 ) ( ON ?auto_22580 ?auto_22586 ) ( CLEAR ?auto_22580 ) ( not ( = ?auto_22579 ?auto_22580 ) ) ( not ( = ?auto_22579 ?auto_22586 ) ) ( not ( = ?auto_22580 ?auto_22586 ) ) ( not ( = ?auto_22583 ?auto_22582 ) ) ( IS-CRATE ?auto_22579 ) ( not ( = ?auto_22593 ?auto_22585 ) ) ( HOIST-AT ?auto_22597 ?auto_22593 ) ( SURFACE-AT ?auto_22579 ?auto_22593 ) ( ON ?auto_22579 ?auto_22600 ) ( CLEAR ?auto_22579 ) ( not ( = ?auto_22578 ?auto_22579 ) ) ( not ( = ?auto_22578 ?auto_22600 ) ) ( not ( = ?auto_22579 ?auto_22600 ) ) ( not ( = ?auto_22583 ?auto_22597 ) ) ( IS-CRATE ?auto_22578 ) ( not ( = ?auto_22590 ?auto_22585 ) ) ( HOIST-AT ?auto_22606 ?auto_22590 ) ( SURFACE-AT ?auto_22578 ?auto_22590 ) ( ON ?auto_22578 ?auto_22601 ) ( CLEAR ?auto_22578 ) ( not ( = ?auto_22577 ?auto_22578 ) ) ( not ( = ?auto_22577 ?auto_22601 ) ) ( not ( = ?auto_22578 ?auto_22601 ) ) ( not ( = ?auto_22583 ?auto_22606 ) ) ( IS-CRATE ?auto_22577 ) ( not ( = ?auto_22604 ?auto_22585 ) ) ( HOIST-AT ?auto_22596 ?auto_22604 ) ( SURFACE-AT ?auto_22577 ?auto_22604 ) ( ON ?auto_22577 ?auto_22605 ) ( CLEAR ?auto_22577 ) ( not ( = ?auto_22576 ?auto_22577 ) ) ( not ( = ?auto_22576 ?auto_22605 ) ) ( not ( = ?auto_22577 ?auto_22605 ) ) ( not ( = ?auto_22583 ?auto_22596 ) ) ( IS-CRATE ?auto_22576 ) ( not ( = ?auto_22594 ?auto_22585 ) ) ( HOIST-AT ?auto_22602 ?auto_22594 ) ( AVAILABLE ?auto_22602 ) ( SURFACE-AT ?auto_22576 ?auto_22594 ) ( ON ?auto_22576 ?auto_22609 ) ( CLEAR ?auto_22576 ) ( not ( = ?auto_22575 ?auto_22576 ) ) ( not ( = ?auto_22575 ?auto_22609 ) ) ( not ( = ?auto_22576 ?auto_22609 ) ) ( not ( = ?auto_22583 ?auto_22602 ) ) ( IS-CRATE ?auto_22575 ) ( not ( = ?auto_22608 ?auto_22585 ) ) ( HOIST-AT ?auto_22587 ?auto_22608 ) ( AVAILABLE ?auto_22587 ) ( SURFACE-AT ?auto_22575 ?auto_22608 ) ( ON ?auto_22575 ?auto_22598 ) ( CLEAR ?auto_22575 ) ( not ( = ?auto_22574 ?auto_22575 ) ) ( not ( = ?auto_22574 ?auto_22598 ) ) ( not ( = ?auto_22575 ?auto_22598 ) ) ( not ( = ?auto_22583 ?auto_22587 ) ) ( IS-CRATE ?auto_22574 ) ( AVAILABLE ?auto_22606 ) ( SURFACE-AT ?auto_22574 ?auto_22590 ) ( ON ?auto_22574 ?auto_22603 ) ( CLEAR ?auto_22574 ) ( not ( = ?auto_22573 ?auto_22574 ) ) ( not ( = ?auto_22573 ?auto_22603 ) ) ( not ( = ?auto_22574 ?auto_22603 ) ) ( IS-CRATE ?auto_22573 ) ( not ( = ?auto_22595 ?auto_22585 ) ) ( HOIST-AT ?auto_22589 ?auto_22595 ) ( SURFACE-AT ?auto_22573 ?auto_22595 ) ( ON ?auto_22573 ?auto_22591 ) ( CLEAR ?auto_22573 ) ( not ( = ?auto_22572 ?auto_22573 ) ) ( not ( = ?auto_22572 ?auto_22591 ) ) ( not ( = ?auto_22573 ?auto_22591 ) ) ( not ( = ?auto_22583 ?auto_22589 ) ) ( IS-CRATE ?auto_22572 ) ( AVAILABLE ?auto_22582 ) ( SURFACE-AT ?auto_22572 ?auto_22584 ) ( ON ?auto_22572 ?auto_22592 ) ( CLEAR ?auto_22572 ) ( not ( = ?auto_22571 ?auto_22572 ) ) ( not ( = ?auto_22571 ?auto_22592 ) ) ( not ( = ?auto_22572 ?auto_22592 ) ) ( IS-CRATE ?auto_22571 ) ( AVAILABLE ?auto_22597 ) ( SURFACE-AT ?auto_22571 ?auto_22593 ) ( ON ?auto_22571 ?auto_22588 ) ( CLEAR ?auto_22571 ) ( not ( = ?auto_22570 ?auto_22571 ) ) ( not ( = ?auto_22570 ?auto_22588 ) ) ( not ( = ?auto_22571 ?auto_22588 ) ) ( IS-CRATE ?auto_22570 ) ( AVAILABLE ?auto_22589 ) ( SURFACE-AT ?auto_22570 ?auto_22595 ) ( ON ?auto_22570 ?auto_22607 ) ( CLEAR ?auto_22570 ) ( not ( = ?auto_22569 ?auto_22570 ) ) ( not ( = ?auto_22569 ?auto_22607 ) ) ( not ( = ?auto_22570 ?auto_22607 ) ) ( SURFACE-AT ?auto_22568 ?auto_22585 ) ( CLEAR ?auto_22568 ) ( IS-CRATE ?auto_22569 ) ( AVAILABLE ?auto_22583 ) ( AVAILABLE ?auto_22596 ) ( SURFACE-AT ?auto_22569 ?auto_22604 ) ( ON ?auto_22569 ?auto_22599 ) ( CLEAR ?auto_22569 ) ( TRUCK-AT ?auto_22581 ?auto_22585 ) ( not ( = ?auto_22568 ?auto_22569 ) ) ( not ( = ?auto_22568 ?auto_22599 ) ) ( not ( = ?auto_22569 ?auto_22599 ) ) ( not ( = ?auto_22568 ?auto_22570 ) ) ( not ( = ?auto_22568 ?auto_22607 ) ) ( not ( = ?auto_22570 ?auto_22599 ) ) ( not ( = ?auto_22595 ?auto_22604 ) ) ( not ( = ?auto_22589 ?auto_22596 ) ) ( not ( = ?auto_22607 ?auto_22599 ) ) ( not ( = ?auto_22568 ?auto_22571 ) ) ( not ( = ?auto_22568 ?auto_22588 ) ) ( not ( = ?auto_22569 ?auto_22571 ) ) ( not ( = ?auto_22569 ?auto_22588 ) ) ( not ( = ?auto_22571 ?auto_22607 ) ) ( not ( = ?auto_22571 ?auto_22599 ) ) ( not ( = ?auto_22593 ?auto_22595 ) ) ( not ( = ?auto_22593 ?auto_22604 ) ) ( not ( = ?auto_22597 ?auto_22589 ) ) ( not ( = ?auto_22597 ?auto_22596 ) ) ( not ( = ?auto_22588 ?auto_22607 ) ) ( not ( = ?auto_22588 ?auto_22599 ) ) ( not ( = ?auto_22568 ?auto_22572 ) ) ( not ( = ?auto_22568 ?auto_22592 ) ) ( not ( = ?auto_22569 ?auto_22572 ) ) ( not ( = ?auto_22569 ?auto_22592 ) ) ( not ( = ?auto_22570 ?auto_22572 ) ) ( not ( = ?auto_22570 ?auto_22592 ) ) ( not ( = ?auto_22572 ?auto_22588 ) ) ( not ( = ?auto_22572 ?auto_22607 ) ) ( not ( = ?auto_22572 ?auto_22599 ) ) ( not ( = ?auto_22584 ?auto_22593 ) ) ( not ( = ?auto_22584 ?auto_22595 ) ) ( not ( = ?auto_22584 ?auto_22604 ) ) ( not ( = ?auto_22582 ?auto_22597 ) ) ( not ( = ?auto_22582 ?auto_22589 ) ) ( not ( = ?auto_22582 ?auto_22596 ) ) ( not ( = ?auto_22592 ?auto_22588 ) ) ( not ( = ?auto_22592 ?auto_22607 ) ) ( not ( = ?auto_22592 ?auto_22599 ) ) ( not ( = ?auto_22568 ?auto_22573 ) ) ( not ( = ?auto_22568 ?auto_22591 ) ) ( not ( = ?auto_22569 ?auto_22573 ) ) ( not ( = ?auto_22569 ?auto_22591 ) ) ( not ( = ?auto_22570 ?auto_22573 ) ) ( not ( = ?auto_22570 ?auto_22591 ) ) ( not ( = ?auto_22571 ?auto_22573 ) ) ( not ( = ?auto_22571 ?auto_22591 ) ) ( not ( = ?auto_22573 ?auto_22592 ) ) ( not ( = ?auto_22573 ?auto_22588 ) ) ( not ( = ?auto_22573 ?auto_22607 ) ) ( not ( = ?auto_22573 ?auto_22599 ) ) ( not ( = ?auto_22591 ?auto_22592 ) ) ( not ( = ?auto_22591 ?auto_22588 ) ) ( not ( = ?auto_22591 ?auto_22607 ) ) ( not ( = ?auto_22591 ?auto_22599 ) ) ( not ( = ?auto_22568 ?auto_22574 ) ) ( not ( = ?auto_22568 ?auto_22603 ) ) ( not ( = ?auto_22569 ?auto_22574 ) ) ( not ( = ?auto_22569 ?auto_22603 ) ) ( not ( = ?auto_22570 ?auto_22574 ) ) ( not ( = ?auto_22570 ?auto_22603 ) ) ( not ( = ?auto_22571 ?auto_22574 ) ) ( not ( = ?auto_22571 ?auto_22603 ) ) ( not ( = ?auto_22572 ?auto_22574 ) ) ( not ( = ?auto_22572 ?auto_22603 ) ) ( not ( = ?auto_22574 ?auto_22591 ) ) ( not ( = ?auto_22574 ?auto_22592 ) ) ( not ( = ?auto_22574 ?auto_22588 ) ) ( not ( = ?auto_22574 ?auto_22607 ) ) ( not ( = ?auto_22574 ?auto_22599 ) ) ( not ( = ?auto_22590 ?auto_22595 ) ) ( not ( = ?auto_22590 ?auto_22584 ) ) ( not ( = ?auto_22590 ?auto_22593 ) ) ( not ( = ?auto_22590 ?auto_22604 ) ) ( not ( = ?auto_22606 ?auto_22589 ) ) ( not ( = ?auto_22606 ?auto_22582 ) ) ( not ( = ?auto_22606 ?auto_22597 ) ) ( not ( = ?auto_22606 ?auto_22596 ) ) ( not ( = ?auto_22603 ?auto_22591 ) ) ( not ( = ?auto_22603 ?auto_22592 ) ) ( not ( = ?auto_22603 ?auto_22588 ) ) ( not ( = ?auto_22603 ?auto_22607 ) ) ( not ( = ?auto_22603 ?auto_22599 ) ) ( not ( = ?auto_22568 ?auto_22575 ) ) ( not ( = ?auto_22568 ?auto_22598 ) ) ( not ( = ?auto_22569 ?auto_22575 ) ) ( not ( = ?auto_22569 ?auto_22598 ) ) ( not ( = ?auto_22570 ?auto_22575 ) ) ( not ( = ?auto_22570 ?auto_22598 ) ) ( not ( = ?auto_22571 ?auto_22575 ) ) ( not ( = ?auto_22571 ?auto_22598 ) ) ( not ( = ?auto_22572 ?auto_22575 ) ) ( not ( = ?auto_22572 ?auto_22598 ) ) ( not ( = ?auto_22573 ?auto_22575 ) ) ( not ( = ?auto_22573 ?auto_22598 ) ) ( not ( = ?auto_22575 ?auto_22603 ) ) ( not ( = ?auto_22575 ?auto_22591 ) ) ( not ( = ?auto_22575 ?auto_22592 ) ) ( not ( = ?auto_22575 ?auto_22588 ) ) ( not ( = ?auto_22575 ?auto_22607 ) ) ( not ( = ?auto_22575 ?auto_22599 ) ) ( not ( = ?auto_22608 ?auto_22590 ) ) ( not ( = ?auto_22608 ?auto_22595 ) ) ( not ( = ?auto_22608 ?auto_22584 ) ) ( not ( = ?auto_22608 ?auto_22593 ) ) ( not ( = ?auto_22608 ?auto_22604 ) ) ( not ( = ?auto_22587 ?auto_22606 ) ) ( not ( = ?auto_22587 ?auto_22589 ) ) ( not ( = ?auto_22587 ?auto_22582 ) ) ( not ( = ?auto_22587 ?auto_22597 ) ) ( not ( = ?auto_22587 ?auto_22596 ) ) ( not ( = ?auto_22598 ?auto_22603 ) ) ( not ( = ?auto_22598 ?auto_22591 ) ) ( not ( = ?auto_22598 ?auto_22592 ) ) ( not ( = ?auto_22598 ?auto_22588 ) ) ( not ( = ?auto_22598 ?auto_22607 ) ) ( not ( = ?auto_22598 ?auto_22599 ) ) ( not ( = ?auto_22568 ?auto_22576 ) ) ( not ( = ?auto_22568 ?auto_22609 ) ) ( not ( = ?auto_22569 ?auto_22576 ) ) ( not ( = ?auto_22569 ?auto_22609 ) ) ( not ( = ?auto_22570 ?auto_22576 ) ) ( not ( = ?auto_22570 ?auto_22609 ) ) ( not ( = ?auto_22571 ?auto_22576 ) ) ( not ( = ?auto_22571 ?auto_22609 ) ) ( not ( = ?auto_22572 ?auto_22576 ) ) ( not ( = ?auto_22572 ?auto_22609 ) ) ( not ( = ?auto_22573 ?auto_22576 ) ) ( not ( = ?auto_22573 ?auto_22609 ) ) ( not ( = ?auto_22574 ?auto_22576 ) ) ( not ( = ?auto_22574 ?auto_22609 ) ) ( not ( = ?auto_22576 ?auto_22598 ) ) ( not ( = ?auto_22576 ?auto_22603 ) ) ( not ( = ?auto_22576 ?auto_22591 ) ) ( not ( = ?auto_22576 ?auto_22592 ) ) ( not ( = ?auto_22576 ?auto_22588 ) ) ( not ( = ?auto_22576 ?auto_22607 ) ) ( not ( = ?auto_22576 ?auto_22599 ) ) ( not ( = ?auto_22594 ?auto_22608 ) ) ( not ( = ?auto_22594 ?auto_22590 ) ) ( not ( = ?auto_22594 ?auto_22595 ) ) ( not ( = ?auto_22594 ?auto_22584 ) ) ( not ( = ?auto_22594 ?auto_22593 ) ) ( not ( = ?auto_22594 ?auto_22604 ) ) ( not ( = ?auto_22602 ?auto_22587 ) ) ( not ( = ?auto_22602 ?auto_22606 ) ) ( not ( = ?auto_22602 ?auto_22589 ) ) ( not ( = ?auto_22602 ?auto_22582 ) ) ( not ( = ?auto_22602 ?auto_22597 ) ) ( not ( = ?auto_22602 ?auto_22596 ) ) ( not ( = ?auto_22609 ?auto_22598 ) ) ( not ( = ?auto_22609 ?auto_22603 ) ) ( not ( = ?auto_22609 ?auto_22591 ) ) ( not ( = ?auto_22609 ?auto_22592 ) ) ( not ( = ?auto_22609 ?auto_22588 ) ) ( not ( = ?auto_22609 ?auto_22607 ) ) ( not ( = ?auto_22609 ?auto_22599 ) ) ( not ( = ?auto_22568 ?auto_22577 ) ) ( not ( = ?auto_22568 ?auto_22605 ) ) ( not ( = ?auto_22569 ?auto_22577 ) ) ( not ( = ?auto_22569 ?auto_22605 ) ) ( not ( = ?auto_22570 ?auto_22577 ) ) ( not ( = ?auto_22570 ?auto_22605 ) ) ( not ( = ?auto_22571 ?auto_22577 ) ) ( not ( = ?auto_22571 ?auto_22605 ) ) ( not ( = ?auto_22572 ?auto_22577 ) ) ( not ( = ?auto_22572 ?auto_22605 ) ) ( not ( = ?auto_22573 ?auto_22577 ) ) ( not ( = ?auto_22573 ?auto_22605 ) ) ( not ( = ?auto_22574 ?auto_22577 ) ) ( not ( = ?auto_22574 ?auto_22605 ) ) ( not ( = ?auto_22575 ?auto_22577 ) ) ( not ( = ?auto_22575 ?auto_22605 ) ) ( not ( = ?auto_22577 ?auto_22609 ) ) ( not ( = ?auto_22577 ?auto_22598 ) ) ( not ( = ?auto_22577 ?auto_22603 ) ) ( not ( = ?auto_22577 ?auto_22591 ) ) ( not ( = ?auto_22577 ?auto_22592 ) ) ( not ( = ?auto_22577 ?auto_22588 ) ) ( not ( = ?auto_22577 ?auto_22607 ) ) ( not ( = ?auto_22577 ?auto_22599 ) ) ( not ( = ?auto_22605 ?auto_22609 ) ) ( not ( = ?auto_22605 ?auto_22598 ) ) ( not ( = ?auto_22605 ?auto_22603 ) ) ( not ( = ?auto_22605 ?auto_22591 ) ) ( not ( = ?auto_22605 ?auto_22592 ) ) ( not ( = ?auto_22605 ?auto_22588 ) ) ( not ( = ?auto_22605 ?auto_22607 ) ) ( not ( = ?auto_22605 ?auto_22599 ) ) ( not ( = ?auto_22568 ?auto_22578 ) ) ( not ( = ?auto_22568 ?auto_22601 ) ) ( not ( = ?auto_22569 ?auto_22578 ) ) ( not ( = ?auto_22569 ?auto_22601 ) ) ( not ( = ?auto_22570 ?auto_22578 ) ) ( not ( = ?auto_22570 ?auto_22601 ) ) ( not ( = ?auto_22571 ?auto_22578 ) ) ( not ( = ?auto_22571 ?auto_22601 ) ) ( not ( = ?auto_22572 ?auto_22578 ) ) ( not ( = ?auto_22572 ?auto_22601 ) ) ( not ( = ?auto_22573 ?auto_22578 ) ) ( not ( = ?auto_22573 ?auto_22601 ) ) ( not ( = ?auto_22574 ?auto_22578 ) ) ( not ( = ?auto_22574 ?auto_22601 ) ) ( not ( = ?auto_22575 ?auto_22578 ) ) ( not ( = ?auto_22575 ?auto_22601 ) ) ( not ( = ?auto_22576 ?auto_22578 ) ) ( not ( = ?auto_22576 ?auto_22601 ) ) ( not ( = ?auto_22578 ?auto_22605 ) ) ( not ( = ?auto_22578 ?auto_22609 ) ) ( not ( = ?auto_22578 ?auto_22598 ) ) ( not ( = ?auto_22578 ?auto_22603 ) ) ( not ( = ?auto_22578 ?auto_22591 ) ) ( not ( = ?auto_22578 ?auto_22592 ) ) ( not ( = ?auto_22578 ?auto_22588 ) ) ( not ( = ?auto_22578 ?auto_22607 ) ) ( not ( = ?auto_22578 ?auto_22599 ) ) ( not ( = ?auto_22601 ?auto_22605 ) ) ( not ( = ?auto_22601 ?auto_22609 ) ) ( not ( = ?auto_22601 ?auto_22598 ) ) ( not ( = ?auto_22601 ?auto_22603 ) ) ( not ( = ?auto_22601 ?auto_22591 ) ) ( not ( = ?auto_22601 ?auto_22592 ) ) ( not ( = ?auto_22601 ?auto_22588 ) ) ( not ( = ?auto_22601 ?auto_22607 ) ) ( not ( = ?auto_22601 ?auto_22599 ) ) ( not ( = ?auto_22568 ?auto_22579 ) ) ( not ( = ?auto_22568 ?auto_22600 ) ) ( not ( = ?auto_22569 ?auto_22579 ) ) ( not ( = ?auto_22569 ?auto_22600 ) ) ( not ( = ?auto_22570 ?auto_22579 ) ) ( not ( = ?auto_22570 ?auto_22600 ) ) ( not ( = ?auto_22571 ?auto_22579 ) ) ( not ( = ?auto_22571 ?auto_22600 ) ) ( not ( = ?auto_22572 ?auto_22579 ) ) ( not ( = ?auto_22572 ?auto_22600 ) ) ( not ( = ?auto_22573 ?auto_22579 ) ) ( not ( = ?auto_22573 ?auto_22600 ) ) ( not ( = ?auto_22574 ?auto_22579 ) ) ( not ( = ?auto_22574 ?auto_22600 ) ) ( not ( = ?auto_22575 ?auto_22579 ) ) ( not ( = ?auto_22575 ?auto_22600 ) ) ( not ( = ?auto_22576 ?auto_22579 ) ) ( not ( = ?auto_22576 ?auto_22600 ) ) ( not ( = ?auto_22577 ?auto_22579 ) ) ( not ( = ?auto_22577 ?auto_22600 ) ) ( not ( = ?auto_22579 ?auto_22601 ) ) ( not ( = ?auto_22579 ?auto_22605 ) ) ( not ( = ?auto_22579 ?auto_22609 ) ) ( not ( = ?auto_22579 ?auto_22598 ) ) ( not ( = ?auto_22579 ?auto_22603 ) ) ( not ( = ?auto_22579 ?auto_22591 ) ) ( not ( = ?auto_22579 ?auto_22592 ) ) ( not ( = ?auto_22579 ?auto_22588 ) ) ( not ( = ?auto_22579 ?auto_22607 ) ) ( not ( = ?auto_22579 ?auto_22599 ) ) ( not ( = ?auto_22600 ?auto_22601 ) ) ( not ( = ?auto_22600 ?auto_22605 ) ) ( not ( = ?auto_22600 ?auto_22609 ) ) ( not ( = ?auto_22600 ?auto_22598 ) ) ( not ( = ?auto_22600 ?auto_22603 ) ) ( not ( = ?auto_22600 ?auto_22591 ) ) ( not ( = ?auto_22600 ?auto_22592 ) ) ( not ( = ?auto_22600 ?auto_22588 ) ) ( not ( = ?auto_22600 ?auto_22607 ) ) ( not ( = ?auto_22600 ?auto_22599 ) ) ( not ( = ?auto_22568 ?auto_22580 ) ) ( not ( = ?auto_22568 ?auto_22586 ) ) ( not ( = ?auto_22569 ?auto_22580 ) ) ( not ( = ?auto_22569 ?auto_22586 ) ) ( not ( = ?auto_22570 ?auto_22580 ) ) ( not ( = ?auto_22570 ?auto_22586 ) ) ( not ( = ?auto_22571 ?auto_22580 ) ) ( not ( = ?auto_22571 ?auto_22586 ) ) ( not ( = ?auto_22572 ?auto_22580 ) ) ( not ( = ?auto_22572 ?auto_22586 ) ) ( not ( = ?auto_22573 ?auto_22580 ) ) ( not ( = ?auto_22573 ?auto_22586 ) ) ( not ( = ?auto_22574 ?auto_22580 ) ) ( not ( = ?auto_22574 ?auto_22586 ) ) ( not ( = ?auto_22575 ?auto_22580 ) ) ( not ( = ?auto_22575 ?auto_22586 ) ) ( not ( = ?auto_22576 ?auto_22580 ) ) ( not ( = ?auto_22576 ?auto_22586 ) ) ( not ( = ?auto_22577 ?auto_22580 ) ) ( not ( = ?auto_22577 ?auto_22586 ) ) ( not ( = ?auto_22578 ?auto_22580 ) ) ( not ( = ?auto_22578 ?auto_22586 ) ) ( not ( = ?auto_22580 ?auto_22600 ) ) ( not ( = ?auto_22580 ?auto_22601 ) ) ( not ( = ?auto_22580 ?auto_22605 ) ) ( not ( = ?auto_22580 ?auto_22609 ) ) ( not ( = ?auto_22580 ?auto_22598 ) ) ( not ( = ?auto_22580 ?auto_22603 ) ) ( not ( = ?auto_22580 ?auto_22591 ) ) ( not ( = ?auto_22580 ?auto_22592 ) ) ( not ( = ?auto_22580 ?auto_22588 ) ) ( not ( = ?auto_22580 ?auto_22607 ) ) ( not ( = ?auto_22580 ?auto_22599 ) ) ( not ( = ?auto_22586 ?auto_22600 ) ) ( not ( = ?auto_22586 ?auto_22601 ) ) ( not ( = ?auto_22586 ?auto_22605 ) ) ( not ( = ?auto_22586 ?auto_22609 ) ) ( not ( = ?auto_22586 ?auto_22598 ) ) ( not ( = ?auto_22586 ?auto_22603 ) ) ( not ( = ?auto_22586 ?auto_22591 ) ) ( not ( = ?auto_22586 ?auto_22592 ) ) ( not ( = ?auto_22586 ?auto_22588 ) ) ( not ( = ?auto_22586 ?auto_22607 ) ) ( not ( = ?auto_22586 ?auto_22599 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_22568 ?auto_22569 ?auto_22570 ?auto_22571 ?auto_22572 ?auto_22573 ?auto_22574 ?auto_22575 ?auto_22576 ?auto_22577 ?auto_22578 ?auto_22579 )
      ( MAKE-1CRATE ?auto_22579 ?auto_22580 )
      ( MAKE-12CRATE-VERIFY ?auto_22568 ?auto_22569 ?auto_22570 ?auto_22571 ?auto_22572 ?auto_22573 ?auto_22574 ?auto_22575 ?auto_22576 ?auto_22577 ?auto_22578 ?auto_22579 ?auto_22580 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_22634 - SURFACE
      ?auto_22635 - SURFACE
      ?auto_22636 - SURFACE
      ?auto_22637 - SURFACE
      ?auto_22638 - SURFACE
      ?auto_22639 - SURFACE
      ?auto_22640 - SURFACE
      ?auto_22641 - SURFACE
      ?auto_22642 - SURFACE
      ?auto_22643 - SURFACE
      ?auto_22644 - SURFACE
      ?auto_22645 - SURFACE
      ?auto_22646 - SURFACE
      ?auto_22647 - SURFACE
    )
    :vars
    (
      ?auto_22648 - HOIST
      ?auto_22650 - PLACE
      ?auto_22653 - PLACE
      ?auto_22652 - HOIST
      ?auto_22651 - SURFACE
      ?auto_22663 - PLACE
      ?auto_22658 - HOIST
      ?auto_22676 - SURFACE
      ?auto_22654 - PLACE
      ?auto_22675 - HOIST
      ?auto_22656 - SURFACE
      ?auto_22670 - PLACE
      ?auto_22657 - HOIST
      ?auto_22671 - SURFACE
      ?auto_22672 - PLACE
      ?auto_22669 - HOIST
      ?auto_22678 - SURFACE
      ?auto_22679 - PLACE
      ?auto_22659 - HOIST
      ?auto_22664 - SURFACE
      ?auto_22677 - PLACE
      ?auto_22655 - HOIST
      ?auto_22660 - SURFACE
      ?auto_22673 - SURFACE
      ?auto_22662 - PLACE
      ?auto_22668 - HOIST
      ?auto_22674 - SURFACE
      ?auto_22667 - SURFACE
      ?auto_22666 - SURFACE
      ?auto_22661 - SURFACE
      ?auto_22665 - SURFACE
      ?auto_22649 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22648 ?auto_22650 ) ( IS-CRATE ?auto_22647 ) ( not ( = ?auto_22653 ?auto_22650 ) ) ( HOIST-AT ?auto_22652 ?auto_22653 ) ( AVAILABLE ?auto_22652 ) ( SURFACE-AT ?auto_22647 ?auto_22653 ) ( ON ?auto_22647 ?auto_22651 ) ( CLEAR ?auto_22647 ) ( not ( = ?auto_22646 ?auto_22647 ) ) ( not ( = ?auto_22646 ?auto_22651 ) ) ( not ( = ?auto_22647 ?auto_22651 ) ) ( not ( = ?auto_22648 ?auto_22652 ) ) ( IS-CRATE ?auto_22646 ) ( not ( = ?auto_22663 ?auto_22650 ) ) ( HOIST-AT ?auto_22658 ?auto_22663 ) ( SURFACE-AT ?auto_22646 ?auto_22663 ) ( ON ?auto_22646 ?auto_22676 ) ( CLEAR ?auto_22646 ) ( not ( = ?auto_22645 ?auto_22646 ) ) ( not ( = ?auto_22645 ?auto_22676 ) ) ( not ( = ?auto_22646 ?auto_22676 ) ) ( not ( = ?auto_22648 ?auto_22658 ) ) ( IS-CRATE ?auto_22645 ) ( not ( = ?auto_22654 ?auto_22650 ) ) ( HOIST-AT ?auto_22675 ?auto_22654 ) ( SURFACE-AT ?auto_22645 ?auto_22654 ) ( ON ?auto_22645 ?auto_22656 ) ( CLEAR ?auto_22645 ) ( not ( = ?auto_22644 ?auto_22645 ) ) ( not ( = ?auto_22644 ?auto_22656 ) ) ( not ( = ?auto_22645 ?auto_22656 ) ) ( not ( = ?auto_22648 ?auto_22675 ) ) ( IS-CRATE ?auto_22644 ) ( not ( = ?auto_22670 ?auto_22650 ) ) ( HOIST-AT ?auto_22657 ?auto_22670 ) ( SURFACE-AT ?auto_22644 ?auto_22670 ) ( ON ?auto_22644 ?auto_22671 ) ( CLEAR ?auto_22644 ) ( not ( = ?auto_22643 ?auto_22644 ) ) ( not ( = ?auto_22643 ?auto_22671 ) ) ( not ( = ?auto_22644 ?auto_22671 ) ) ( not ( = ?auto_22648 ?auto_22657 ) ) ( IS-CRATE ?auto_22643 ) ( not ( = ?auto_22672 ?auto_22650 ) ) ( HOIST-AT ?auto_22669 ?auto_22672 ) ( SURFACE-AT ?auto_22643 ?auto_22672 ) ( ON ?auto_22643 ?auto_22678 ) ( CLEAR ?auto_22643 ) ( not ( = ?auto_22642 ?auto_22643 ) ) ( not ( = ?auto_22642 ?auto_22678 ) ) ( not ( = ?auto_22643 ?auto_22678 ) ) ( not ( = ?auto_22648 ?auto_22669 ) ) ( IS-CRATE ?auto_22642 ) ( not ( = ?auto_22679 ?auto_22650 ) ) ( HOIST-AT ?auto_22659 ?auto_22679 ) ( AVAILABLE ?auto_22659 ) ( SURFACE-AT ?auto_22642 ?auto_22679 ) ( ON ?auto_22642 ?auto_22664 ) ( CLEAR ?auto_22642 ) ( not ( = ?auto_22641 ?auto_22642 ) ) ( not ( = ?auto_22641 ?auto_22664 ) ) ( not ( = ?auto_22642 ?auto_22664 ) ) ( not ( = ?auto_22648 ?auto_22659 ) ) ( IS-CRATE ?auto_22641 ) ( not ( = ?auto_22677 ?auto_22650 ) ) ( HOIST-AT ?auto_22655 ?auto_22677 ) ( AVAILABLE ?auto_22655 ) ( SURFACE-AT ?auto_22641 ?auto_22677 ) ( ON ?auto_22641 ?auto_22660 ) ( CLEAR ?auto_22641 ) ( not ( = ?auto_22640 ?auto_22641 ) ) ( not ( = ?auto_22640 ?auto_22660 ) ) ( not ( = ?auto_22641 ?auto_22660 ) ) ( not ( = ?auto_22648 ?auto_22655 ) ) ( IS-CRATE ?auto_22640 ) ( AVAILABLE ?auto_22657 ) ( SURFACE-AT ?auto_22640 ?auto_22670 ) ( ON ?auto_22640 ?auto_22673 ) ( CLEAR ?auto_22640 ) ( not ( = ?auto_22639 ?auto_22640 ) ) ( not ( = ?auto_22639 ?auto_22673 ) ) ( not ( = ?auto_22640 ?auto_22673 ) ) ( IS-CRATE ?auto_22639 ) ( not ( = ?auto_22662 ?auto_22650 ) ) ( HOIST-AT ?auto_22668 ?auto_22662 ) ( SURFACE-AT ?auto_22639 ?auto_22662 ) ( ON ?auto_22639 ?auto_22674 ) ( CLEAR ?auto_22639 ) ( not ( = ?auto_22638 ?auto_22639 ) ) ( not ( = ?auto_22638 ?auto_22674 ) ) ( not ( = ?auto_22639 ?auto_22674 ) ) ( not ( = ?auto_22648 ?auto_22668 ) ) ( IS-CRATE ?auto_22638 ) ( AVAILABLE ?auto_22658 ) ( SURFACE-AT ?auto_22638 ?auto_22663 ) ( ON ?auto_22638 ?auto_22667 ) ( CLEAR ?auto_22638 ) ( not ( = ?auto_22637 ?auto_22638 ) ) ( not ( = ?auto_22637 ?auto_22667 ) ) ( not ( = ?auto_22638 ?auto_22667 ) ) ( IS-CRATE ?auto_22637 ) ( AVAILABLE ?auto_22675 ) ( SURFACE-AT ?auto_22637 ?auto_22654 ) ( ON ?auto_22637 ?auto_22666 ) ( CLEAR ?auto_22637 ) ( not ( = ?auto_22636 ?auto_22637 ) ) ( not ( = ?auto_22636 ?auto_22666 ) ) ( not ( = ?auto_22637 ?auto_22666 ) ) ( IS-CRATE ?auto_22636 ) ( AVAILABLE ?auto_22668 ) ( SURFACE-AT ?auto_22636 ?auto_22662 ) ( ON ?auto_22636 ?auto_22661 ) ( CLEAR ?auto_22636 ) ( not ( = ?auto_22635 ?auto_22636 ) ) ( not ( = ?auto_22635 ?auto_22661 ) ) ( not ( = ?auto_22636 ?auto_22661 ) ) ( SURFACE-AT ?auto_22634 ?auto_22650 ) ( CLEAR ?auto_22634 ) ( IS-CRATE ?auto_22635 ) ( AVAILABLE ?auto_22648 ) ( AVAILABLE ?auto_22669 ) ( SURFACE-AT ?auto_22635 ?auto_22672 ) ( ON ?auto_22635 ?auto_22665 ) ( CLEAR ?auto_22635 ) ( TRUCK-AT ?auto_22649 ?auto_22650 ) ( not ( = ?auto_22634 ?auto_22635 ) ) ( not ( = ?auto_22634 ?auto_22665 ) ) ( not ( = ?auto_22635 ?auto_22665 ) ) ( not ( = ?auto_22634 ?auto_22636 ) ) ( not ( = ?auto_22634 ?auto_22661 ) ) ( not ( = ?auto_22636 ?auto_22665 ) ) ( not ( = ?auto_22662 ?auto_22672 ) ) ( not ( = ?auto_22668 ?auto_22669 ) ) ( not ( = ?auto_22661 ?auto_22665 ) ) ( not ( = ?auto_22634 ?auto_22637 ) ) ( not ( = ?auto_22634 ?auto_22666 ) ) ( not ( = ?auto_22635 ?auto_22637 ) ) ( not ( = ?auto_22635 ?auto_22666 ) ) ( not ( = ?auto_22637 ?auto_22661 ) ) ( not ( = ?auto_22637 ?auto_22665 ) ) ( not ( = ?auto_22654 ?auto_22662 ) ) ( not ( = ?auto_22654 ?auto_22672 ) ) ( not ( = ?auto_22675 ?auto_22668 ) ) ( not ( = ?auto_22675 ?auto_22669 ) ) ( not ( = ?auto_22666 ?auto_22661 ) ) ( not ( = ?auto_22666 ?auto_22665 ) ) ( not ( = ?auto_22634 ?auto_22638 ) ) ( not ( = ?auto_22634 ?auto_22667 ) ) ( not ( = ?auto_22635 ?auto_22638 ) ) ( not ( = ?auto_22635 ?auto_22667 ) ) ( not ( = ?auto_22636 ?auto_22638 ) ) ( not ( = ?auto_22636 ?auto_22667 ) ) ( not ( = ?auto_22638 ?auto_22666 ) ) ( not ( = ?auto_22638 ?auto_22661 ) ) ( not ( = ?auto_22638 ?auto_22665 ) ) ( not ( = ?auto_22663 ?auto_22654 ) ) ( not ( = ?auto_22663 ?auto_22662 ) ) ( not ( = ?auto_22663 ?auto_22672 ) ) ( not ( = ?auto_22658 ?auto_22675 ) ) ( not ( = ?auto_22658 ?auto_22668 ) ) ( not ( = ?auto_22658 ?auto_22669 ) ) ( not ( = ?auto_22667 ?auto_22666 ) ) ( not ( = ?auto_22667 ?auto_22661 ) ) ( not ( = ?auto_22667 ?auto_22665 ) ) ( not ( = ?auto_22634 ?auto_22639 ) ) ( not ( = ?auto_22634 ?auto_22674 ) ) ( not ( = ?auto_22635 ?auto_22639 ) ) ( not ( = ?auto_22635 ?auto_22674 ) ) ( not ( = ?auto_22636 ?auto_22639 ) ) ( not ( = ?auto_22636 ?auto_22674 ) ) ( not ( = ?auto_22637 ?auto_22639 ) ) ( not ( = ?auto_22637 ?auto_22674 ) ) ( not ( = ?auto_22639 ?auto_22667 ) ) ( not ( = ?auto_22639 ?auto_22666 ) ) ( not ( = ?auto_22639 ?auto_22661 ) ) ( not ( = ?auto_22639 ?auto_22665 ) ) ( not ( = ?auto_22674 ?auto_22667 ) ) ( not ( = ?auto_22674 ?auto_22666 ) ) ( not ( = ?auto_22674 ?auto_22661 ) ) ( not ( = ?auto_22674 ?auto_22665 ) ) ( not ( = ?auto_22634 ?auto_22640 ) ) ( not ( = ?auto_22634 ?auto_22673 ) ) ( not ( = ?auto_22635 ?auto_22640 ) ) ( not ( = ?auto_22635 ?auto_22673 ) ) ( not ( = ?auto_22636 ?auto_22640 ) ) ( not ( = ?auto_22636 ?auto_22673 ) ) ( not ( = ?auto_22637 ?auto_22640 ) ) ( not ( = ?auto_22637 ?auto_22673 ) ) ( not ( = ?auto_22638 ?auto_22640 ) ) ( not ( = ?auto_22638 ?auto_22673 ) ) ( not ( = ?auto_22640 ?auto_22674 ) ) ( not ( = ?auto_22640 ?auto_22667 ) ) ( not ( = ?auto_22640 ?auto_22666 ) ) ( not ( = ?auto_22640 ?auto_22661 ) ) ( not ( = ?auto_22640 ?auto_22665 ) ) ( not ( = ?auto_22670 ?auto_22662 ) ) ( not ( = ?auto_22670 ?auto_22663 ) ) ( not ( = ?auto_22670 ?auto_22654 ) ) ( not ( = ?auto_22670 ?auto_22672 ) ) ( not ( = ?auto_22657 ?auto_22668 ) ) ( not ( = ?auto_22657 ?auto_22658 ) ) ( not ( = ?auto_22657 ?auto_22675 ) ) ( not ( = ?auto_22657 ?auto_22669 ) ) ( not ( = ?auto_22673 ?auto_22674 ) ) ( not ( = ?auto_22673 ?auto_22667 ) ) ( not ( = ?auto_22673 ?auto_22666 ) ) ( not ( = ?auto_22673 ?auto_22661 ) ) ( not ( = ?auto_22673 ?auto_22665 ) ) ( not ( = ?auto_22634 ?auto_22641 ) ) ( not ( = ?auto_22634 ?auto_22660 ) ) ( not ( = ?auto_22635 ?auto_22641 ) ) ( not ( = ?auto_22635 ?auto_22660 ) ) ( not ( = ?auto_22636 ?auto_22641 ) ) ( not ( = ?auto_22636 ?auto_22660 ) ) ( not ( = ?auto_22637 ?auto_22641 ) ) ( not ( = ?auto_22637 ?auto_22660 ) ) ( not ( = ?auto_22638 ?auto_22641 ) ) ( not ( = ?auto_22638 ?auto_22660 ) ) ( not ( = ?auto_22639 ?auto_22641 ) ) ( not ( = ?auto_22639 ?auto_22660 ) ) ( not ( = ?auto_22641 ?auto_22673 ) ) ( not ( = ?auto_22641 ?auto_22674 ) ) ( not ( = ?auto_22641 ?auto_22667 ) ) ( not ( = ?auto_22641 ?auto_22666 ) ) ( not ( = ?auto_22641 ?auto_22661 ) ) ( not ( = ?auto_22641 ?auto_22665 ) ) ( not ( = ?auto_22677 ?auto_22670 ) ) ( not ( = ?auto_22677 ?auto_22662 ) ) ( not ( = ?auto_22677 ?auto_22663 ) ) ( not ( = ?auto_22677 ?auto_22654 ) ) ( not ( = ?auto_22677 ?auto_22672 ) ) ( not ( = ?auto_22655 ?auto_22657 ) ) ( not ( = ?auto_22655 ?auto_22668 ) ) ( not ( = ?auto_22655 ?auto_22658 ) ) ( not ( = ?auto_22655 ?auto_22675 ) ) ( not ( = ?auto_22655 ?auto_22669 ) ) ( not ( = ?auto_22660 ?auto_22673 ) ) ( not ( = ?auto_22660 ?auto_22674 ) ) ( not ( = ?auto_22660 ?auto_22667 ) ) ( not ( = ?auto_22660 ?auto_22666 ) ) ( not ( = ?auto_22660 ?auto_22661 ) ) ( not ( = ?auto_22660 ?auto_22665 ) ) ( not ( = ?auto_22634 ?auto_22642 ) ) ( not ( = ?auto_22634 ?auto_22664 ) ) ( not ( = ?auto_22635 ?auto_22642 ) ) ( not ( = ?auto_22635 ?auto_22664 ) ) ( not ( = ?auto_22636 ?auto_22642 ) ) ( not ( = ?auto_22636 ?auto_22664 ) ) ( not ( = ?auto_22637 ?auto_22642 ) ) ( not ( = ?auto_22637 ?auto_22664 ) ) ( not ( = ?auto_22638 ?auto_22642 ) ) ( not ( = ?auto_22638 ?auto_22664 ) ) ( not ( = ?auto_22639 ?auto_22642 ) ) ( not ( = ?auto_22639 ?auto_22664 ) ) ( not ( = ?auto_22640 ?auto_22642 ) ) ( not ( = ?auto_22640 ?auto_22664 ) ) ( not ( = ?auto_22642 ?auto_22660 ) ) ( not ( = ?auto_22642 ?auto_22673 ) ) ( not ( = ?auto_22642 ?auto_22674 ) ) ( not ( = ?auto_22642 ?auto_22667 ) ) ( not ( = ?auto_22642 ?auto_22666 ) ) ( not ( = ?auto_22642 ?auto_22661 ) ) ( not ( = ?auto_22642 ?auto_22665 ) ) ( not ( = ?auto_22679 ?auto_22677 ) ) ( not ( = ?auto_22679 ?auto_22670 ) ) ( not ( = ?auto_22679 ?auto_22662 ) ) ( not ( = ?auto_22679 ?auto_22663 ) ) ( not ( = ?auto_22679 ?auto_22654 ) ) ( not ( = ?auto_22679 ?auto_22672 ) ) ( not ( = ?auto_22659 ?auto_22655 ) ) ( not ( = ?auto_22659 ?auto_22657 ) ) ( not ( = ?auto_22659 ?auto_22668 ) ) ( not ( = ?auto_22659 ?auto_22658 ) ) ( not ( = ?auto_22659 ?auto_22675 ) ) ( not ( = ?auto_22659 ?auto_22669 ) ) ( not ( = ?auto_22664 ?auto_22660 ) ) ( not ( = ?auto_22664 ?auto_22673 ) ) ( not ( = ?auto_22664 ?auto_22674 ) ) ( not ( = ?auto_22664 ?auto_22667 ) ) ( not ( = ?auto_22664 ?auto_22666 ) ) ( not ( = ?auto_22664 ?auto_22661 ) ) ( not ( = ?auto_22664 ?auto_22665 ) ) ( not ( = ?auto_22634 ?auto_22643 ) ) ( not ( = ?auto_22634 ?auto_22678 ) ) ( not ( = ?auto_22635 ?auto_22643 ) ) ( not ( = ?auto_22635 ?auto_22678 ) ) ( not ( = ?auto_22636 ?auto_22643 ) ) ( not ( = ?auto_22636 ?auto_22678 ) ) ( not ( = ?auto_22637 ?auto_22643 ) ) ( not ( = ?auto_22637 ?auto_22678 ) ) ( not ( = ?auto_22638 ?auto_22643 ) ) ( not ( = ?auto_22638 ?auto_22678 ) ) ( not ( = ?auto_22639 ?auto_22643 ) ) ( not ( = ?auto_22639 ?auto_22678 ) ) ( not ( = ?auto_22640 ?auto_22643 ) ) ( not ( = ?auto_22640 ?auto_22678 ) ) ( not ( = ?auto_22641 ?auto_22643 ) ) ( not ( = ?auto_22641 ?auto_22678 ) ) ( not ( = ?auto_22643 ?auto_22664 ) ) ( not ( = ?auto_22643 ?auto_22660 ) ) ( not ( = ?auto_22643 ?auto_22673 ) ) ( not ( = ?auto_22643 ?auto_22674 ) ) ( not ( = ?auto_22643 ?auto_22667 ) ) ( not ( = ?auto_22643 ?auto_22666 ) ) ( not ( = ?auto_22643 ?auto_22661 ) ) ( not ( = ?auto_22643 ?auto_22665 ) ) ( not ( = ?auto_22678 ?auto_22664 ) ) ( not ( = ?auto_22678 ?auto_22660 ) ) ( not ( = ?auto_22678 ?auto_22673 ) ) ( not ( = ?auto_22678 ?auto_22674 ) ) ( not ( = ?auto_22678 ?auto_22667 ) ) ( not ( = ?auto_22678 ?auto_22666 ) ) ( not ( = ?auto_22678 ?auto_22661 ) ) ( not ( = ?auto_22678 ?auto_22665 ) ) ( not ( = ?auto_22634 ?auto_22644 ) ) ( not ( = ?auto_22634 ?auto_22671 ) ) ( not ( = ?auto_22635 ?auto_22644 ) ) ( not ( = ?auto_22635 ?auto_22671 ) ) ( not ( = ?auto_22636 ?auto_22644 ) ) ( not ( = ?auto_22636 ?auto_22671 ) ) ( not ( = ?auto_22637 ?auto_22644 ) ) ( not ( = ?auto_22637 ?auto_22671 ) ) ( not ( = ?auto_22638 ?auto_22644 ) ) ( not ( = ?auto_22638 ?auto_22671 ) ) ( not ( = ?auto_22639 ?auto_22644 ) ) ( not ( = ?auto_22639 ?auto_22671 ) ) ( not ( = ?auto_22640 ?auto_22644 ) ) ( not ( = ?auto_22640 ?auto_22671 ) ) ( not ( = ?auto_22641 ?auto_22644 ) ) ( not ( = ?auto_22641 ?auto_22671 ) ) ( not ( = ?auto_22642 ?auto_22644 ) ) ( not ( = ?auto_22642 ?auto_22671 ) ) ( not ( = ?auto_22644 ?auto_22678 ) ) ( not ( = ?auto_22644 ?auto_22664 ) ) ( not ( = ?auto_22644 ?auto_22660 ) ) ( not ( = ?auto_22644 ?auto_22673 ) ) ( not ( = ?auto_22644 ?auto_22674 ) ) ( not ( = ?auto_22644 ?auto_22667 ) ) ( not ( = ?auto_22644 ?auto_22666 ) ) ( not ( = ?auto_22644 ?auto_22661 ) ) ( not ( = ?auto_22644 ?auto_22665 ) ) ( not ( = ?auto_22671 ?auto_22678 ) ) ( not ( = ?auto_22671 ?auto_22664 ) ) ( not ( = ?auto_22671 ?auto_22660 ) ) ( not ( = ?auto_22671 ?auto_22673 ) ) ( not ( = ?auto_22671 ?auto_22674 ) ) ( not ( = ?auto_22671 ?auto_22667 ) ) ( not ( = ?auto_22671 ?auto_22666 ) ) ( not ( = ?auto_22671 ?auto_22661 ) ) ( not ( = ?auto_22671 ?auto_22665 ) ) ( not ( = ?auto_22634 ?auto_22645 ) ) ( not ( = ?auto_22634 ?auto_22656 ) ) ( not ( = ?auto_22635 ?auto_22645 ) ) ( not ( = ?auto_22635 ?auto_22656 ) ) ( not ( = ?auto_22636 ?auto_22645 ) ) ( not ( = ?auto_22636 ?auto_22656 ) ) ( not ( = ?auto_22637 ?auto_22645 ) ) ( not ( = ?auto_22637 ?auto_22656 ) ) ( not ( = ?auto_22638 ?auto_22645 ) ) ( not ( = ?auto_22638 ?auto_22656 ) ) ( not ( = ?auto_22639 ?auto_22645 ) ) ( not ( = ?auto_22639 ?auto_22656 ) ) ( not ( = ?auto_22640 ?auto_22645 ) ) ( not ( = ?auto_22640 ?auto_22656 ) ) ( not ( = ?auto_22641 ?auto_22645 ) ) ( not ( = ?auto_22641 ?auto_22656 ) ) ( not ( = ?auto_22642 ?auto_22645 ) ) ( not ( = ?auto_22642 ?auto_22656 ) ) ( not ( = ?auto_22643 ?auto_22645 ) ) ( not ( = ?auto_22643 ?auto_22656 ) ) ( not ( = ?auto_22645 ?auto_22671 ) ) ( not ( = ?auto_22645 ?auto_22678 ) ) ( not ( = ?auto_22645 ?auto_22664 ) ) ( not ( = ?auto_22645 ?auto_22660 ) ) ( not ( = ?auto_22645 ?auto_22673 ) ) ( not ( = ?auto_22645 ?auto_22674 ) ) ( not ( = ?auto_22645 ?auto_22667 ) ) ( not ( = ?auto_22645 ?auto_22666 ) ) ( not ( = ?auto_22645 ?auto_22661 ) ) ( not ( = ?auto_22645 ?auto_22665 ) ) ( not ( = ?auto_22656 ?auto_22671 ) ) ( not ( = ?auto_22656 ?auto_22678 ) ) ( not ( = ?auto_22656 ?auto_22664 ) ) ( not ( = ?auto_22656 ?auto_22660 ) ) ( not ( = ?auto_22656 ?auto_22673 ) ) ( not ( = ?auto_22656 ?auto_22674 ) ) ( not ( = ?auto_22656 ?auto_22667 ) ) ( not ( = ?auto_22656 ?auto_22666 ) ) ( not ( = ?auto_22656 ?auto_22661 ) ) ( not ( = ?auto_22656 ?auto_22665 ) ) ( not ( = ?auto_22634 ?auto_22646 ) ) ( not ( = ?auto_22634 ?auto_22676 ) ) ( not ( = ?auto_22635 ?auto_22646 ) ) ( not ( = ?auto_22635 ?auto_22676 ) ) ( not ( = ?auto_22636 ?auto_22646 ) ) ( not ( = ?auto_22636 ?auto_22676 ) ) ( not ( = ?auto_22637 ?auto_22646 ) ) ( not ( = ?auto_22637 ?auto_22676 ) ) ( not ( = ?auto_22638 ?auto_22646 ) ) ( not ( = ?auto_22638 ?auto_22676 ) ) ( not ( = ?auto_22639 ?auto_22646 ) ) ( not ( = ?auto_22639 ?auto_22676 ) ) ( not ( = ?auto_22640 ?auto_22646 ) ) ( not ( = ?auto_22640 ?auto_22676 ) ) ( not ( = ?auto_22641 ?auto_22646 ) ) ( not ( = ?auto_22641 ?auto_22676 ) ) ( not ( = ?auto_22642 ?auto_22646 ) ) ( not ( = ?auto_22642 ?auto_22676 ) ) ( not ( = ?auto_22643 ?auto_22646 ) ) ( not ( = ?auto_22643 ?auto_22676 ) ) ( not ( = ?auto_22644 ?auto_22646 ) ) ( not ( = ?auto_22644 ?auto_22676 ) ) ( not ( = ?auto_22646 ?auto_22656 ) ) ( not ( = ?auto_22646 ?auto_22671 ) ) ( not ( = ?auto_22646 ?auto_22678 ) ) ( not ( = ?auto_22646 ?auto_22664 ) ) ( not ( = ?auto_22646 ?auto_22660 ) ) ( not ( = ?auto_22646 ?auto_22673 ) ) ( not ( = ?auto_22646 ?auto_22674 ) ) ( not ( = ?auto_22646 ?auto_22667 ) ) ( not ( = ?auto_22646 ?auto_22666 ) ) ( not ( = ?auto_22646 ?auto_22661 ) ) ( not ( = ?auto_22646 ?auto_22665 ) ) ( not ( = ?auto_22676 ?auto_22656 ) ) ( not ( = ?auto_22676 ?auto_22671 ) ) ( not ( = ?auto_22676 ?auto_22678 ) ) ( not ( = ?auto_22676 ?auto_22664 ) ) ( not ( = ?auto_22676 ?auto_22660 ) ) ( not ( = ?auto_22676 ?auto_22673 ) ) ( not ( = ?auto_22676 ?auto_22674 ) ) ( not ( = ?auto_22676 ?auto_22667 ) ) ( not ( = ?auto_22676 ?auto_22666 ) ) ( not ( = ?auto_22676 ?auto_22661 ) ) ( not ( = ?auto_22676 ?auto_22665 ) ) ( not ( = ?auto_22634 ?auto_22647 ) ) ( not ( = ?auto_22634 ?auto_22651 ) ) ( not ( = ?auto_22635 ?auto_22647 ) ) ( not ( = ?auto_22635 ?auto_22651 ) ) ( not ( = ?auto_22636 ?auto_22647 ) ) ( not ( = ?auto_22636 ?auto_22651 ) ) ( not ( = ?auto_22637 ?auto_22647 ) ) ( not ( = ?auto_22637 ?auto_22651 ) ) ( not ( = ?auto_22638 ?auto_22647 ) ) ( not ( = ?auto_22638 ?auto_22651 ) ) ( not ( = ?auto_22639 ?auto_22647 ) ) ( not ( = ?auto_22639 ?auto_22651 ) ) ( not ( = ?auto_22640 ?auto_22647 ) ) ( not ( = ?auto_22640 ?auto_22651 ) ) ( not ( = ?auto_22641 ?auto_22647 ) ) ( not ( = ?auto_22641 ?auto_22651 ) ) ( not ( = ?auto_22642 ?auto_22647 ) ) ( not ( = ?auto_22642 ?auto_22651 ) ) ( not ( = ?auto_22643 ?auto_22647 ) ) ( not ( = ?auto_22643 ?auto_22651 ) ) ( not ( = ?auto_22644 ?auto_22647 ) ) ( not ( = ?auto_22644 ?auto_22651 ) ) ( not ( = ?auto_22645 ?auto_22647 ) ) ( not ( = ?auto_22645 ?auto_22651 ) ) ( not ( = ?auto_22647 ?auto_22676 ) ) ( not ( = ?auto_22647 ?auto_22656 ) ) ( not ( = ?auto_22647 ?auto_22671 ) ) ( not ( = ?auto_22647 ?auto_22678 ) ) ( not ( = ?auto_22647 ?auto_22664 ) ) ( not ( = ?auto_22647 ?auto_22660 ) ) ( not ( = ?auto_22647 ?auto_22673 ) ) ( not ( = ?auto_22647 ?auto_22674 ) ) ( not ( = ?auto_22647 ?auto_22667 ) ) ( not ( = ?auto_22647 ?auto_22666 ) ) ( not ( = ?auto_22647 ?auto_22661 ) ) ( not ( = ?auto_22647 ?auto_22665 ) ) ( not ( = ?auto_22653 ?auto_22663 ) ) ( not ( = ?auto_22653 ?auto_22654 ) ) ( not ( = ?auto_22653 ?auto_22670 ) ) ( not ( = ?auto_22653 ?auto_22672 ) ) ( not ( = ?auto_22653 ?auto_22679 ) ) ( not ( = ?auto_22653 ?auto_22677 ) ) ( not ( = ?auto_22653 ?auto_22662 ) ) ( not ( = ?auto_22652 ?auto_22658 ) ) ( not ( = ?auto_22652 ?auto_22675 ) ) ( not ( = ?auto_22652 ?auto_22657 ) ) ( not ( = ?auto_22652 ?auto_22669 ) ) ( not ( = ?auto_22652 ?auto_22659 ) ) ( not ( = ?auto_22652 ?auto_22655 ) ) ( not ( = ?auto_22652 ?auto_22668 ) ) ( not ( = ?auto_22651 ?auto_22676 ) ) ( not ( = ?auto_22651 ?auto_22656 ) ) ( not ( = ?auto_22651 ?auto_22671 ) ) ( not ( = ?auto_22651 ?auto_22678 ) ) ( not ( = ?auto_22651 ?auto_22664 ) ) ( not ( = ?auto_22651 ?auto_22660 ) ) ( not ( = ?auto_22651 ?auto_22673 ) ) ( not ( = ?auto_22651 ?auto_22674 ) ) ( not ( = ?auto_22651 ?auto_22667 ) ) ( not ( = ?auto_22651 ?auto_22666 ) ) ( not ( = ?auto_22651 ?auto_22661 ) ) ( not ( = ?auto_22651 ?auto_22665 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_22634 ?auto_22635 ?auto_22636 ?auto_22637 ?auto_22638 ?auto_22639 ?auto_22640 ?auto_22641 ?auto_22642 ?auto_22643 ?auto_22644 ?auto_22645 ?auto_22646 )
      ( MAKE-1CRATE ?auto_22646 ?auto_22647 )
      ( MAKE-13CRATE-VERIFY ?auto_22634 ?auto_22635 ?auto_22636 ?auto_22637 ?auto_22638 ?auto_22639 ?auto_22640 ?auto_22641 ?auto_22642 ?auto_22643 ?auto_22644 ?auto_22645 ?auto_22646 ?auto_22647 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_22705 - SURFACE
      ?auto_22706 - SURFACE
      ?auto_22707 - SURFACE
      ?auto_22708 - SURFACE
      ?auto_22709 - SURFACE
      ?auto_22710 - SURFACE
      ?auto_22711 - SURFACE
      ?auto_22712 - SURFACE
      ?auto_22713 - SURFACE
      ?auto_22714 - SURFACE
      ?auto_22715 - SURFACE
      ?auto_22716 - SURFACE
      ?auto_22717 - SURFACE
      ?auto_22718 - SURFACE
      ?auto_22719 - SURFACE
    )
    :vars
    (
      ?auto_22720 - HOIST
      ?auto_22724 - PLACE
      ?auto_22721 - PLACE
      ?auto_22723 - HOIST
      ?auto_22725 - SURFACE
      ?auto_22738 - PLACE
      ?auto_22726 - HOIST
      ?auto_22750 - SURFACE
      ?auto_22727 - PLACE
      ?auto_22737 - HOIST
      ?auto_22742 - SURFACE
      ?auto_22748 - PLACE
      ?auto_22729 - HOIST
      ?auto_22743 - SURFACE
      ?auto_22747 - PLACE
      ?auto_22746 - HOIST
      ?auto_22734 - SURFACE
      ?auto_22754 - PLACE
      ?auto_22751 - HOIST
      ?auto_22739 - SURFACE
      ?auto_22752 - PLACE
      ?auto_22733 - HOIST
      ?auto_22740 - SURFACE
      ?auto_22736 - PLACE
      ?auto_22745 - HOIST
      ?auto_22731 - SURFACE
      ?auto_22735 - SURFACE
      ?auto_22753 - PLACE
      ?auto_22744 - HOIST
      ?auto_22749 - SURFACE
      ?auto_22741 - SURFACE
      ?auto_22730 - SURFACE
      ?auto_22732 - SURFACE
      ?auto_22728 - SURFACE
      ?auto_22722 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22720 ?auto_22724 ) ( IS-CRATE ?auto_22719 ) ( not ( = ?auto_22721 ?auto_22724 ) ) ( HOIST-AT ?auto_22723 ?auto_22721 ) ( AVAILABLE ?auto_22723 ) ( SURFACE-AT ?auto_22719 ?auto_22721 ) ( ON ?auto_22719 ?auto_22725 ) ( CLEAR ?auto_22719 ) ( not ( = ?auto_22718 ?auto_22719 ) ) ( not ( = ?auto_22718 ?auto_22725 ) ) ( not ( = ?auto_22719 ?auto_22725 ) ) ( not ( = ?auto_22720 ?auto_22723 ) ) ( IS-CRATE ?auto_22718 ) ( not ( = ?auto_22738 ?auto_22724 ) ) ( HOIST-AT ?auto_22726 ?auto_22738 ) ( AVAILABLE ?auto_22726 ) ( SURFACE-AT ?auto_22718 ?auto_22738 ) ( ON ?auto_22718 ?auto_22750 ) ( CLEAR ?auto_22718 ) ( not ( = ?auto_22717 ?auto_22718 ) ) ( not ( = ?auto_22717 ?auto_22750 ) ) ( not ( = ?auto_22718 ?auto_22750 ) ) ( not ( = ?auto_22720 ?auto_22726 ) ) ( IS-CRATE ?auto_22717 ) ( not ( = ?auto_22727 ?auto_22724 ) ) ( HOIST-AT ?auto_22737 ?auto_22727 ) ( SURFACE-AT ?auto_22717 ?auto_22727 ) ( ON ?auto_22717 ?auto_22742 ) ( CLEAR ?auto_22717 ) ( not ( = ?auto_22716 ?auto_22717 ) ) ( not ( = ?auto_22716 ?auto_22742 ) ) ( not ( = ?auto_22717 ?auto_22742 ) ) ( not ( = ?auto_22720 ?auto_22737 ) ) ( IS-CRATE ?auto_22716 ) ( not ( = ?auto_22748 ?auto_22724 ) ) ( HOIST-AT ?auto_22729 ?auto_22748 ) ( SURFACE-AT ?auto_22716 ?auto_22748 ) ( ON ?auto_22716 ?auto_22743 ) ( CLEAR ?auto_22716 ) ( not ( = ?auto_22715 ?auto_22716 ) ) ( not ( = ?auto_22715 ?auto_22743 ) ) ( not ( = ?auto_22716 ?auto_22743 ) ) ( not ( = ?auto_22720 ?auto_22729 ) ) ( IS-CRATE ?auto_22715 ) ( not ( = ?auto_22747 ?auto_22724 ) ) ( HOIST-AT ?auto_22746 ?auto_22747 ) ( SURFACE-AT ?auto_22715 ?auto_22747 ) ( ON ?auto_22715 ?auto_22734 ) ( CLEAR ?auto_22715 ) ( not ( = ?auto_22714 ?auto_22715 ) ) ( not ( = ?auto_22714 ?auto_22734 ) ) ( not ( = ?auto_22715 ?auto_22734 ) ) ( not ( = ?auto_22720 ?auto_22746 ) ) ( IS-CRATE ?auto_22714 ) ( not ( = ?auto_22754 ?auto_22724 ) ) ( HOIST-AT ?auto_22751 ?auto_22754 ) ( SURFACE-AT ?auto_22714 ?auto_22754 ) ( ON ?auto_22714 ?auto_22739 ) ( CLEAR ?auto_22714 ) ( not ( = ?auto_22713 ?auto_22714 ) ) ( not ( = ?auto_22713 ?auto_22739 ) ) ( not ( = ?auto_22714 ?auto_22739 ) ) ( not ( = ?auto_22720 ?auto_22751 ) ) ( IS-CRATE ?auto_22713 ) ( not ( = ?auto_22752 ?auto_22724 ) ) ( HOIST-AT ?auto_22733 ?auto_22752 ) ( AVAILABLE ?auto_22733 ) ( SURFACE-AT ?auto_22713 ?auto_22752 ) ( ON ?auto_22713 ?auto_22740 ) ( CLEAR ?auto_22713 ) ( not ( = ?auto_22712 ?auto_22713 ) ) ( not ( = ?auto_22712 ?auto_22740 ) ) ( not ( = ?auto_22713 ?auto_22740 ) ) ( not ( = ?auto_22720 ?auto_22733 ) ) ( IS-CRATE ?auto_22712 ) ( not ( = ?auto_22736 ?auto_22724 ) ) ( HOIST-AT ?auto_22745 ?auto_22736 ) ( AVAILABLE ?auto_22745 ) ( SURFACE-AT ?auto_22712 ?auto_22736 ) ( ON ?auto_22712 ?auto_22731 ) ( CLEAR ?auto_22712 ) ( not ( = ?auto_22711 ?auto_22712 ) ) ( not ( = ?auto_22711 ?auto_22731 ) ) ( not ( = ?auto_22712 ?auto_22731 ) ) ( not ( = ?auto_22720 ?auto_22745 ) ) ( IS-CRATE ?auto_22711 ) ( AVAILABLE ?auto_22746 ) ( SURFACE-AT ?auto_22711 ?auto_22747 ) ( ON ?auto_22711 ?auto_22735 ) ( CLEAR ?auto_22711 ) ( not ( = ?auto_22710 ?auto_22711 ) ) ( not ( = ?auto_22710 ?auto_22735 ) ) ( not ( = ?auto_22711 ?auto_22735 ) ) ( IS-CRATE ?auto_22710 ) ( not ( = ?auto_22753 ?auto_22724 ) ) ( HOIST-AT ?auto_22744 ?auto_22753 ) ( SURFACE-AT ?auto_22710 ?auto_22753 ) ( ON ?auto_22710 ?auto_22749 ) ( CLEAR ?auto_22710 ) ( not ( = ?auto_22709 ?auto_22710 ) ) ( not ( = ?auto_22709 ?auto_22749 ) ) ( not ( = ?auto_22710 ?auto_22749 ) ) ( not ( = ?auto_22720 ?auto_22744 ) ) ( IS-CRATE ?auto_22709 ) ( AVAILABLE ?auto_22737 ) ( SURFACE-AT ?auto_22709 ?auto_22727 ) ( ON ?auto_22709 ?auto_22741 ) ( CLEAR ?auto_22709 ) ( not ( = ?auto_22708 ?auto_22709 ) ) ( not ( = ?auto_22708 ?auto_22741 ) ) ( not ( = ?auto_22709 ?auto_22741 ) ) ( IS-CRATE ?auto_22708 ) ( AVAILABLE ?auto_22729 ) ( SURFACE-AT ?auto_22708 ?auto_22748 ) ( ON ?auto_22708 ?auto_22730 ) ( CLEAR ?auto_22708 ) ( not ( = ?auto_22707 ?auto_22708 ) ) ( not ( = ?auto_22707 ?auto_22730 ) ) ( not ( = ?auto_22708 ?auto_22730 ) ) ( IS-CRATE ?auto_22707 ) ( AVAILABLE ?auto_22744 ) ( SURFACE-AT ?auto_22707 ?auto_22753 ) ( ON ?auto_22707 ?auto_22732 ) ( CLEAR ?auto_22707 ) ( not ( = ?auto_22706 ?auto_22707 ) ) ( not ( = ?auto_22706 ?auto_22732 ) ) ( not ( = ?auto_22707 ?auto_22732 ) ) ( SURFACE-AT ?auto_22705 ?auto_22724 ) ( CLEAR ?auto_22705 ) ( IS-CRATE ?auto_22706 ) ( AVAILABLE ?auto_22720 ) ( AVAILABLE ?auto_22751 ) ( SURFACE-AT ?auto_22706 ?auto_22754 ) ( ON ?auto_22706 ?auto_22728 ) ( CLEAR ?auto_22706 ) ( TRUCK-AT ?auto_22722 ?auto_22724 ) ( not ( = ?auto_22705 ?auto_22706 ) ) ( not ( = ?auto_22705 ?auto_22728 ) ) ( not ( = ?auto_22706 ?auto_22728 ) ) ( not ( = ?auto_22705 ?auto_22707 ) ) ( not ( = ?auto_22705 ?auto_22732 ) ) ( not ( = ?auto_22707 ?auto_22728 ) ) ( not ( = ?auto_22753 ?auto_22754 ) ) ( not ( = ?auto_22744 ?auto_22751 ) ) ( not ( = ?auto_22732 ?auto_22728 ) ) ( not ( = ?auto_22705 ?auto_22708 ) ) ( not ( = ?auto_22705 ?auto_22730 ) ) ( not ( = ?auto_22706 ?auto_22708 ) ) ( not ( = ?auto_22706 ?auto_22730 ) ) ( not ( = ?auto_22708 ?auto_22732 ) ) ( not ( = ?auto_22708 ?auto_22728 ) ) ( not ( = ?auto_22748 ?auto_22753 ) ) ( not ( = ?auto_22748 ?auto_22754 ) ) ( not ( = ?auto_22729 ?auto_22744 ) ) ( not ( = ?auto_22729 ?auto_22751 ) ) ( not ( = ?auto_22730 ?auto_22732 ) ) ( not ( = ?auto_22730 ?auto_22728 ) ) ( not ( = ?auto_22705 ?auto_22709 ) ) ( not ( = ?auto_22705 ?auto_22741 ) ) ( not ( = ?auto_22706 ?auto_22709 ) ) ( not ( = ?auto_22706 ?auto_22741 ) ) ( not ( = ?auto_22707 ?auto_22709 ) ) ( not ( = ?auto_22707 ?auto_22741 ) ) ( not ( = ?auto_22709 ?auto_22730 ) ) ( not ( = ?auto_22709 ?auto_22732 ) ) ( not ( = ?auto_22709 ?auto_22728 ) ) ( not ( = ?auto_22727 ?auto_22748 ) ) ( not ( = ?auto_22727 ?auto_22753 ) ) ( not ( = ?auto_22727 ?auto_22754 ) ) ( not ( = ?auto_22737 ?auto_22729 ) ) ( not ( = ?auto_22737 ?auto_22744 ) ) ( not ( = ?auto_22737 ?auto_22751 ) ) ( not ( = ?auto_22741 ?auto_22730 ) ) ( not ( = ?auto_22741 ?auto_22732 ) ) ( not ( = ?auto_22741 ?auto_22728 ) ) ( not ( = ?auto_22705 ?auto_22710 ) ) ( not ( = ?auto_22705 ?auto_22749 ) ) ( not ( = ?auto_22706 ?auto_22710 ) ) ( not ( = ?auto_22706 ?auto_22749 ) ) ( not ( = ?auto_22707 ?auto_22710 ) ) ( not ( = ?auto_22707 ?auto_22749 ) ) ( not ( = ?auto_22708 ?auto_22710 ) ) ( not ( = ?auto_22708 ?auto_22749 ) ) ( not ( = ?auto_22710 ?auto_22741 ) ) ( not ( = ?auto_22710 ?auto_22730 ) ) ( not ( = ?auto_22710 ?auto_22732 ) ) ( not ( = ?auto_22710 ?auto_22728 ) ) ( not ( = ?auto_22749 ?auto_22741 ) ) ( not ( = ?auto_22749 ?auto_22730 ) ) ( not ( = ?auto_22749 ?auto_22732 ) ) ( not ( = ?auto_22749 ?auto_22728 ) ) ( not ( = ?auto_22705 ?auto_22711 ) ) ( not ( = ?auto_22705 ?auto_22735 ) ) ( not ( = ?auto_22706 ?auto_22711 ) ) ( not ( = ?auto_22706 ?auto_22735 ) ) ( not ( = ?auto_22707 ?auto_22711 ) ) ( not ( = ?auto_22707 ?auto_22735 ) ) ( not ( = ?auto_22708 ?auto_22711 ) ) ( not ( = ?auto_22708 ?auto_22735 ) ) ( not ( = ?auto_22709 ?auto_22711 ) ) ( not ( = ?auto_22709 ?auto_22735 ) ) ( not ( = ?auto_22711 ?auto_22749 ) ) ( not ( = ?auto_22711 ?auto_22741 ) ) ( not ( = ?auto_22711 ?auto_22730 ) ) ( not ( = ?auto_22711 ?auto_22732 ) ) ( not ( = ?auto_22711 ?auto_22728 ) ) ( not ( = ?auto_22747 ?auto_22753 ) ) ( not ( = ?auto_22747 ?auto_22727 ) ) ( not ( = ?auto_22747 ?auto_22748 ) ) ( not ( = ?auto_22747 ?auto_22754 ) ) ( not ( = ?auto_22746 ?auto_22744 ) ) ( not ( = ?auto_22746 ?auto_22737 ) ) ( not ( = ?auto_22746 ?auto_22729 ) ) ( not ( = ?auto_22746 ?auto_22751 ) ) ( not ( = ?auto_22735 ?auto_22749 ) ) ( not ( = ?auto_22735 ?auto_22741 ) ) ( not ( = ?auto_22735 ?auto_22730 ) ) ( not ( = ?auto_22735 ?auto_22732 ) ) ( not ( = ?auto_22735 ?auto_22728 ) ) ( not ( = ?auto_22705 ?auto_22712 ) ) ( not ( = ?auto_22705 ?auto_22731 ) ) ( not ( = ?auto_22706 ?auto_22712 ) ) ( not ( = ?auto_22706 ?auto_22731 ) ) ( not ( = ?auto_22707 ?auto_22712 ) ) ( not ( = ?auto_22707 ?auto_22731 ) ) ( not ( = ?auto_22708 ?auto_22712 ) ) ( not ( = ?auto_22708 ?auto_22731 ) ) ( not ( = ?auto_22709 ?auto_22712 ) ) ( not ( = ?auto_22709 ?auto_22731 ) ) ( not ( = ?auto_22710 ?auto_22712 ) ) ( not ( = ?auto_22710 ?auto_22731 ) ) ( not ( = ?auto_22712 ?auto_22735 ) ) ( not ( = ?auto_22712 ?auto_22749 ) ) ( not ( = ?auto_22712 ?auto_22741 ) ) ( not ( = ?auto_22712 ?auto_22730 ) ) ( not ( = ?auto_22712 ?auto_22732 ) ) ( not ( = ?auto_22712 ?auto_22728 ) ) ( not ( = ?auto_22736 ?auto_22747 ) ) ( not ( = ?auto_22736 ?auto_22753 ) ) ( not ( = ?auto_22736 ?auto_22727 ) ) ( not ( = ?auto_22736 ?auto_22748 ) ) ( not ( = ?auto_22736 ?auto_22754 ) ) ( not ( = ?auto_22745 ?auto_22746 ) ) ( not ( = ?auto_22745 ?auto_22744 ) ) ( not ( = ?auto_22745 ?auto_22737 ) ) ( not ( = ?auto_22745 ?auto_22729 ) ) ( not ( = ?auto_22745 ?auto_22751 ) ) ( not ( = ?auto_22731 ?auto_22735 ) ) ( not ( = ?auto_22731 ?auto_22749 ) ) ( not ( = ?auto_22731 ?auto_22741 ) ) ( not ( = ?auto_22731 ?auto_22730 ) ) ( not ( = ?auto_22731 ?auto_22732 ) ) ( not ( = ?auto_22731 ?auto_22728 ) ) ( not ( = ?auto_22705 ?auto_22713 ) ) ( not ( = ?auto_22705 ?auto_22740 ) ) ( not ( = ?auto_22706 ?auto_22713 ) ) ( not ( = ?auto_22706 ?auto_22740 ) ) ( not ( = ?auto_22707 ?auto_22713 ) ) ( not ( = ?auto_22707 ?auto_22740 ) ) ( not ( = ?auto_22708 ?auto_22713 ) ) ( not ( = ?auto_22708 ?auto_22740 ) ) ( not ( = ?auto_22709 ?auto_22713 ) ) ( not ( = ?auto_22709 ?auto_22740 ) ) ( not ( = ?auto_22710 ?auto_22713 ) ) ( not ( = ?auto_22710 ?auto_22740 ) ) ( not ( = ?auto_22711 ?auto_22713 ) ) ( not ( = ?auto_22711 ?auto_22740 ) ) ( not ( = ?auto_22713 ?auto_22731 ) ) ( not ( = ?auto_22713 ?auto_22735 ) ) ( not ( = ?auto_22713 ?auto_22749 ) ) ( not ( = ?auto_22713 ?auto_22741 ) ) ( not ( = ?auto_22713 ?auto_22730 ) ) ( not ( = ?auto_22713 ?auto_22732 ) ) ( not ( = ?auto_22713 ?auto_22728 ) ) ( not ( = ?auto_22752 ?auto_22736 ) ) ( not ( = ?auto_22752 ?auto_22747 ) ) ( not ( = ?auto_22752 ?auto_22753 ) ) ( not ( = ?auto_22752 ?auto_22727 ) ) ( not ( = ?auto_22752 ?auto_22748 ) ) ( not ( = ?auto_22752 ?auto_22754 ) ) ( not ( = ?auto_22733 ?auto_22745 ) ) ( not ( = ?auto_22733 ?auto_22746 ) ) ( not ( = ?auto_22733 ?auto_22744 ) ) ( not ( = ?auto_22733 ?auto_22737 ) ) ( not ( = ?auto_22733 ?auto_22729 ) ) ( not ( = ?auto_22733 ?auto_22751 ) ) ( not ( = ?auto_22740 ?auto_22731 ) ) ( not ( = ?auto_22740 ?auto_22735 ) ) ( not ( = ?auto_22740 ?auto_22749 ) ) ( not ( = ?auto_22740 ?auto_22741 ) ) ( not ( = ?auto_22740 ?auto_22730 ) ) ( not ( = ?auto_22740 ?auto_22732 ) ) ( not ( = ?auto_22740 ?auto_22728 ) ) ( not ( = ?auto_22705 ?auto_22714 ) ) ( not ( = ?auto_22705 ?auto_22739 ) ) ( not ( = ?auto_22706 ?auto_22714 ) ) ( not ( = ?auto_22706 ?auto_22739 ) ) ( not ( = ?auto_22707 ?auto_22714 ) ) ( not ( = ?auto_22707 ?auto_22739 ) ) ( not ( = ?auto_22708 ?auto_22714 ) ) ( not ( = ?auto_22708 ?auto_22739 ) ) ( not ( = ?auto_22709 ?auto_22714 ) ) ( not ( = ?auto_22709 ?auto_22739 ) ) ( not ( = ?auto_22710 ?auto_22714 ) ) ( not ( = ?auto_22710 ?auto_22739 ) ) ( not ( = ?auto_22711 ?auto_22714 ) ) ( not ( = ?auto_22711 ?auto_22739 ) ) ( not ( = ?auto_22712 ?auto_22714 ) ) ( not ( = ?auto_22712 ?auto_22739 ) ) ( not ( = ?auto_22714 ?auto_22740 ) ) ( not ( = ?auto_22714 ?auto_22731 ) ) ( not ( = ?auto_22714 ?auto_22735 ) ) ( not ( = ?auto_22714 ?auto_22749 ) ) ( not ( = ?auto_22714 ?auto_22741 ) ) ( not ( = ?auto_22714 ?auto_22730 ) ) ( not ( = ?auto_22714 ?auto_22732 ) ) ( not ( = ?auto_22714 ?auto_22728 ) ) ( not ( = ?auto_22739 ?auto_22740 ) ) ( not ( = ?auto_22739 ?auto_22731 ) ) ( not ( = ?auto_22739 ?auto_22735 ) ) ( not ( = ?auto_22739 ?auto_22749 ) ) ( not ( = ?auto_22739 ?auto_22741 ) ) ( not ( = ?auto_22739 ?auto_22730 ) ) ( not ( = ?auto_22739 ?auto_22732 ) ) ( not ( = ?auto_22739 ?auto_22728 ) ) ( not ( = ?auto_22705 ?auto_22715 ) ) ( not ( = ?auto_22705 ?auto_22734 ) ) ( not ( = ?auto_22706 ?auto_22715 ) ) ( not ( = ?auto_22706 ?auto_22734 ) ) ( not ( = ?auto_22707 ?auto_22715 ) ) ( not ( = ?auto_22707 ?auto_22734 ) ) ( not ( = ?auto_22708 ?auto_22715 ) ) ( not ( = ?auto_22708 ?auto_22734 ) ) ( not ( = ?auto_22709 ?auto_22715 ) ) ( not ( = ?auto_22709 ?auto_22734 ) ) ( not ( = ?auto_22710 ?auto_22715 ) ) ( not ( = ?auto_22710 ?auto_22734 ) ) ( not ( = ?auto_22711 ?auto_22715 ) ) ( not ( = ?auto_22711 ?auto_22734 ) ) ( not ( = ?auto_22712 ?auto_22715 ) ) ( not ( = ?auto_22712 ?auto_22734 ) ) ( not ( = ?auto_22713 ?auto_22715 ) ) ( not ( = ?auto_22713 ?auto_22734 ) ) ( not ( = ?auto_22715 ?auto_22739 ) ) ( not ( = ?auto_22715 ?auto_22740 ) ) ( not ( = ?auto_22715 ?auto_22731 ) ) ( not ( = ?auto_22715 ?auto_22735 ) ) ( not ( = ?auto_22715 ?auto_22749 ) ) ( not ( = ?auto_22715 ?auto_22741 ) ) ( not ( = ?auto_22715 ?auto_22730 ) ) ( not ( = ?auto_22715 ?auto_22732 ) ) ( not ( = ?auto_22715 ?auto_22728 ) ) ( not ( = ?auto_22734 ?auto_22739 ) ) ( not ( = ?auto_22734 ?auto_22740 ) ) ( not ( = ?auto_22734 ?auto_22731 ) ) ( not ( = ?auto_22734 ?auto_22735 ) ) ( not ( = ?auto_22734 ?auto_22749 ) ) ( not ( = ?auto_22734 ?auto_22741 ) ) ( not ( = ?auto_22734 ?auto_22730 ) ) ( not ( = ?auto_22734 ?auto_22732 ) ) ( not ( = ?auto_22734 ?auto_22728 ) ) ( not ( = ?auto_22705 ?auto_22716 ) ) ( not ( = ?auto_22705 ?auto_22743 ) ) ( not ( = ?auto_22706 ?auto_22716 ) ) ( not ( = ?auto_22706 ?auto_22743 ) ) ( not ( = ?auto_22707 ?auto_22716 ) ) ( not ( = ?auto_22707 ?auto_22743 ) ) ( not ( = ?auto_22708 ?auto_22716 ) ) ( not ( = ?auto_22708 ?auto_22743 ) ) ( not ( = ?auto_22709 ?auto_22716 ) ) ( not ( = ?auto_22709 ?auto_22743 ) ) ( not ( = ?auto_22710 ?auto_22716 ) ) ( not ( = ?auto_22710 ?auto_22743 ) ) ( not ( = ?auto_22711 ?auto_22716 ) ) ( not ( = ?auto_22711 ?auto_22743 ) ) ( not ( = ?auto_22712 ?auto_22716 ) ) ( not ( = ?auto_22712 ?auto_22743 ) ) ( not ( = ?auto_22713 ?auto_22716 ) ) ( not ( = ?auto_22713 ?auto_22743 ) ) ( not ( = ?auto_22714 ?auto_22716 ) ) ( not ( = ?auto_22714 ?auto_22743 ) ) ( not ( = ?auto_22716 ?auto_22734 ) ) ( not ( = ?auto_22716 ?auto_22739 ) ) ( not ( = ?auto_22716 ?auto_22740 ) ) ( not ( = ?auto_22716 ?auto_22731 ) ) ( not ( = ?auto_22716 ?auto_22735 ) ) ( not ( = ?auto_22716 ?auto_22749 ) ) ( not ( = ?auto_22716 ?auto_22741 ) ) ( not ( = ?auto_22716 ?auto_22730 ) ) ( not ( = ?auto_22716 ?auto_22732 ) ) ( not ( = ?auto_22716 ?auto_22728 ) ) ( not ( = ?auto_22743 ?auto_22734 ) ) ( not ( = ?auto_22743 ?auto_22739 ) ) ( not ( = ?auto_22743 ?auto_22740 ) ) ( not ( = ?auto_22743 ?auto_22731 ) ) ( not ( = ?auto_22743 ?auto_22735 ) ) ( not ( = ?auto_22743 ?auto_22749 ) ) ( not ( = ?auto_22743 ?auto_22741 ) ) ( not ( = ?auto_22743 ?auto_22730 ) ) ( not ( = ?auto_22743 ?auto_22732 ) ) ( not ( = ?auto_22743 ?auto_22728 ) ) ( not ( = ?auto_22705 ?auto_22717 ) ) ( not ( = ?auto_22705 ?auto_22742 ) ) ( not ( = ?auto_22706 ?auto_22717 ) ) ( not ( = ?auto_22706 ?auto_22742 ) ) ( not ( = ?auto_22707 ?auto_22717 ) ) ( not ( = ?auto_22707 ?auto_22742 ) ) ( not ( = ?auto_22708 ?auto_22717 ) ) ( not ( = ?auto_22708 ?auto_22742 ) ) ( not ( = ?auto_22709 ?auto_22717 ) ) ( not ( = ?auto_22709 ?auto_22742 ) ) ( not ( = ?auto_22710 ?auto_22717 ) ) ( not ( = ?auto_22710 ?auto_22742 ) ) ( not ( = ?auto_22711 ?auto_22717 ) ) ( not ( = ?auto_22711 ?auto_22742 ) ) ( not ( = ?auto_22712 ?auto_22717 ) ) ( not ( = ?auto_22712 ?auto_22742 ) ) ( not ( = ?auto_22713 ?auto_22717 ) ) ( not ( = ?auto_22713 ?auto_22742 ) ) ( not ( = ?auto_22714 ?auto_22717 ) ) ( not ( = ?auto_22714 ?auto_22742 ) ) ( not ( = ?auto_22715 ?auto_22717 ) ) ( not ( = ?auto_22715 ?auto_22742 ) ) ( not ( = ?auto_22717 ?auto_22743 ) ) ( not ( = ?auto_22717 ?auto_22734 ) ) ( not ( = ?auto_22717 ?auto_22739 ) ) ( not ( = ?auto_22717 ?auto_22740 ) ) ( not ( = ?auto_22717 ?auto_22731 ) ) ( not ( = ?auto_22717 ?auto_22735 ) ) ( not ( = ?auto_22717 ?auto_22749 ) ) ( not ( = ?auto_22717 ?auto_22741 ) ) ( not ( = ?auto_22717 ?auto_22730 ) ) ( not ( = ?auto_22717 ?auto_22732 ) ) ( not ( = ?auto_22717 ?auto_22728 ) ) ( not ( = ?auto_22742 ?auto_22743 ) ) ( not ( = ?auto_22742 ?auto_22734 ) ) ( not ( = ?auto_22742 ?auto_22739 ) ) ( not ( = ?auto_22742 ?auto_22740 ) ) ( not ( = ?auto_22742 ?auto_22731 ) ) ( not ( = ?auto_22742 ?auto_22735 ) ) ( not ( = ?auto_22742 ?auto_22749 ) ) ( not ( = ?auto_22742 ?auto_22741 ) ) ( not ( = ?auto_22742 ?auto_22730 ) ) ( not ( = ?auto_22742 ?auto_22732 ) ) ( not ( = ?auto_22742 ?auto_22728 ) ) ( not ( = ?auto_22705 ?auto_22718 ) ) ( not ( = ?auto_22705 ?auto_22750 ) ) ( not ( = ?auto_22706 ?auto_22718 ) ) ( not ( = ?auto_22706 ?auto_22750 ) ) ( not ( = ?auto_22707 ?auto_22718 ) ) ( not ( = ?auto_22707 ?auto_22750 ) ) ( not ( = ?auto_22708 ?auto_22718 ) ) ( not ( = ?auto_22708 ?auto_22750 ) ) ( not ( = ?auto_22709 ?auto_22718 ) ) ( not ( = ?auto_22709 ?auto_22750 ) ) ( not ( = ?auto_22710 ?auto_22718 ) ) ( not ( = ?auto_22710 ?auto_22750 ) ) ( not ( = ?auto_22711 ?auto_22718 ) ) ( not ( = ?auto_22711 ?auto_22750 ) ) ( not ( = ?auto_22712 ?auto_22718 ) ) ( not ( = ?auto_22712 ?auto_22750 ) ) ( not ( = ?auto_22713 ?auto_22718 ) ) ( not ( = ?auto_22713 ?auto_22750 ) ) ( not ( = ?auto_22714 ?auto_22718 ) ) ( not ( = ?auto_22714 ?auto_22750 ) ) ( not ( = ?auto_22715 ?auto_22718 ) ) ( not ( = ?auto_22715 ?auto_22750 ) ) ( not ( = ?auto_22716 ?auto_22718 ) ) ( not ( = ?auto_22716 ?auto_22750 ) ) ( not ( = ?auto_22718 ?auto_22742 ) ) ( not ( = ?auto_22718 ?auto_22743 ) ) ( not ( = ?auto_22718 ?auto_22734 ) ) ( not ( = ?auto_22718 ?auto_22739 ) ) ( not ( = ?auto_22718 ?auto_22740 ) ) ( not ( = ?auto_22718 ?auto_22731 ) ) ( not ( = ?auto_22718 ?auto_22735 ) ) ( not ( = ?auto_22718 ?auto_22749 ) ) ( not ( = ?auto_22718 ?auto_22741 ) ) ( not ( = ?auto_22718 ?auto_22730 ) ) ( not ( = ?auto_22718 ?auto_22732 ) ) ( not ( = ?auto_22718 ?auto_22728 ) ) ( not ( = ?auto_22738 ?auto_22727 ) ) ( not ( = ?auto_22738 ?auto_22748 ) ) ( not ( = ?auto_22738 ?auto_22747 ) ) ( not ( = ?auto_22738 ?auto_22754 ) ) ( not ( = ?auto_22738 ?auto_22752 ) ) ( not ( = ?auto_22738 ?auto_22736 ) ) ( not ( = ?auto_22738 ?auto_22753 ) ) ( not ( = ?auto_22726 ?auto_22737 ) ) ( not ( = ?auto_22726 ?auto_22729 ) ) ( not ( = ?auto_22726 ?auto_22746 ) ) ( not ( = ?auto_22726 ?auto_22751 ) ) ( not ( = ?auto_22726 ?auto_22733 ) ) ( not ( = ?auto_22726 ?auto_22745 ) ) ( not ( = ?auto_22726 ?auto_22744 ) ) ( not ( = ?auto_22750 ?auto_22742 ) ) ( not ( = ?auto_22750 ?auto_22743 ) ) ( not ( = ?auto_22750 ?auto_22734 ) ) ( not ( = ?auto_22750 ?auto_22739 ) ) ( not ( = ?auto_22750 ?auto_22740 ) ) ( not ( = ?auto_22750 ?auto_22731 ) ) ( not ( = ?auto_22750 ?auto_22735 ) ) ( not ( = ?auto_22750 ?auto_22749 ) ) ( not ( = ?auto_22750 ?auto_22741 ) ) ( not ( = ?auto_22750 ?auto_22730 ) ) ( not ( = ?auto_22750 ?auto_22732 ) ) ( not ( = ?auto_22750 ?auto_22728 ) ) ( not ( = ?auto_22705 ?auto_22719 ) ) ( not ( = ?auto_22705 ?auto_22725 ) ) ( not ( = ?auto_22706 ?auto_22719 ) ) ( not ( = ?auto_22706 ?auto_22725 ) ) ( not ( = ?auto_22707 ?auto_22719 ) ) ( not ( = ?auto_22707 ?auto_22725 ) ) ( not ( = ?auto_22708 ?auto_22719 ) ) ( not ( = ?auto_22708 ?auto_22725 ) ) ( not ( = ?auto_22709 ?auto_22719 ) ) ( not ( = ?auto_22709 ?auto_22725 ) ) ( not ( = ?auto_22710 ?auto_22719 ) ) ( not ( = ?auto_22710 ?auto_22725 ) ) ( not ( = ?auto_22711 ?auto_22719 ) ) ( not ( = ?auto_22711 ?auto_22725 ) ) ( not ( = ?auto_22712 ?auto_22719 ) ) ( not ( = ?auto_22712 ?auto_22725 ) ) ( not ( = ?auto_22713 ?auto_22719 ) ) ( not ( = ?auto_22713 ?auto_22725 ) ) ( not ( = ?auto_22714 ?auto_22719 ) ) ( not ( = ?auto_22714 ?auto_22725 ) ) ( not ( = ?auto_22715 ?auto_22719 ) ) ( not ( = ?auto_22715 ?auto_22725 ) ) ( not ( = ?auto_22716 ?auto_22719 ) ) ( not ( = ?auto_22716 ?auto_22725 ) ) ( not ( = ?auto_22717 ?auto_22719 ) ) ( not ( = ?auto_22717 ?auto_22725 ) ) ( not ( = ?auto_22719 ?auto_22750 ) ) ( not ( = ?auto_22719 ?auto_22742 ) ) ( not ( = ?auto_22719 ?auto_22743 ) ) ( not ( = ?auto_22719 ?auto_22734 ) ) ( not ( = ?auto_22719 ?auto_22739 ) ) ( not ( = ?auto_22719 ?auto_22740 ) ) ( not ( = ?auto_22719 ?auto_22731 ) ) ( not ( = ?auto_22719 ?auto_22735 ) ) ( not ( = ?auto_22719 ?auto_22749 ) ) ( not ( = ?auto_22719 ?auto_22741 ) ) ( not ( = ?auto_22719 ?auto_22730 ) ) ( not ( = ?auto_22719 ?auto_22732 ) ) ( not ( = ?auto_22719 ?auto_22728 ) ) ( not ( = ?auto_22721 ?auto_22738 ) ) ( not ( = ?auto_22721 ?auto_22727 ) ) ( not ( = ?auto_22721 ?auto_22748 ) ) ( not ( = ?auto_22721 ?auto_22747 ) ) ( not ( = ?auto_22721 ?auto_22754 ) ) ( not ( = ?auto_22721 ?auto_22752 ) ) ( not ( = ?auto_22721 ?auto_22736 ) ) ( not ( = ?auto_22721 ?auto_22753 ) ) ( not ( = ?auto_22723 ?auto_22726 ) ) ( not ( = ?auto_22723 ?auto_22737 ) ) ( not ( = ?auto_22723 ?auto_22729 ) ) ( not ( = ?auto_22723 ?auto_22746 ) ) ( not ( = ?auto_22723 ?auto_22751 ) ) ( not ( = ?auto_22723 ?auto_22733 ) ) ( not ( = ?auto_22723 ?auto_22745 ) ) ( not ( = ?auto_22723 ?auto_22744 ) ) ( not ( = ?auto_22725 ?auto_22750 ) ) ( not ( = ?auto_22725 ?auto_22742 ) ) ( not ( = ?auto_22725 ?auto_22743 ) ) ( not ( = ?auto_22725 ?auto_22734 ) ) ( not ( = ?auto_22725 ?auto_22739 ) ) ( not ( = ?auto_22725 ?auto_22740 ) ) ( not ( = ?auto_22725 ?auto_22731 ) ) ( not ( = ?auto_22725 ?auto_22735 ) ) ( not ( = ?auto_22725 ?auto_22749 ) ) ( not ( = ?auto_22725 ?auto_22741 ) ) ( not ( = ?auto_22725 ?auto_22730 ) ) ( not ( = ?auto_22725 ?auto_22732 ) ) ( not ( = ?auto_22725 ?auto_22728 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_22705 ?auto_22706 ?auto_22707 ?auto_22708 ?auto_22709 ?auto_22710 ?auto_22711 ?auto_22712 ?auto_22713 ?auto_22714 ?auto_22715 ?auto_22716 ?auto_22717 ?auto_22718 )
      ( MAKE-1CRATE ?auto_22718 ?auto_22719 )
      ( MAKE-14CRATE-VERIFY ?auto_22705 ?auto_22706 ?auto_22707 ?auto_22708 ?auto_22709 ?auto_22710 ?auto_22711 ?auto_22712 ?auto_22713 ?auto_22714 ?auto_22715 ?auto_22716 ?auto_22717 ?auto_22718 ?auto_22719 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_22781 - SURFACE
      ?auto_22782 - SURFACE
      ?auto_22783 - SURFACE
      ?auto_22784 - SURFACE
      ?auto_22785 - SURFACE
      ?auto_22786 - SURFACE
      ?auto_22787 - SURFACE
      ?auto_22788 - SURFACE
      ?auto_22789 - SURFACE
      ?auto_22790 - SURFACE
      ?auto_22791 - SURFACE
      ?auto_22792 - SURFACE
      ?auto_22793 - SURFACE
      ?auto_22794 - SURFACE
      ?auto_22795 - SURFACE
      ?auto_22796 - SURFACE
    )
    :vars
    (
      ?auto_22798 - HOIST
      ?auto_22799 - PLACE
      ?auto_22800 - PLACE
      ?auto_22802 - HOIST
      ?auto_22797 - SURFACE
      ?auto_22817 - PLACE
      ?auto_22818 - HOIST
      ?auto_22825 - SURFACE
      ?auto_22809 - SURFACE
      ?auto_22830 - PLACE
      ?auto_22806 - HOIST
      ?auto_22808 - SURFACE
      ?auto_22828 - PLACE
      ?auto_22826 - HOIST
      ?auto_22819 - SURFACE
      ?auto_22827 - PLACE
      ?auto_22810 - HOIST
      ?auto_22822 - SURFACE
      ?auto_22824 - PLACE
      ?auto_22807 - HOIST
      ?auto_22820 - SURFACE
      ?auto_22823 - PLACE
      ?auto_22812 - HOIST
      ?auto_22805 - SURFACE
      ?auto_22815 - PLACE
      ?auto_22814 - HOIST
      ?auto_22821 - SURFACE
      ?auto_22803 - SURFACE
      ?auto_22811 - PLACE
      ?auto_22816 - HOIST
      ?auto_22831 - SURFACE
      ?auto_22829 - SURFACE
      ?auto_22813 - SURFACE
      ?auto_22804 - SURFACE
      ?auto_22832 - SURFACE
      ?auto_22801 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22798 ?auto_22799 ) ( IS-CRATE ?auto_22796 ) ( not ( = ?auto_22800 ?auto_22799 ) ) ( HOIST-AT ?auto_22802 ?auto_22800 ) ( SURFACE-AT ?auto_22796 ?auto_22800 ) ( ON ?auto_22796 ?auto_22797 ) ( CLEAR ?auto_22796 ) ( not ( = ?auto_22795 ?auto_22796 ) ) ( not ( = ?auto_22795 ?auto_22797 ) ) ( not ( = ?auto_22796 ?auto_22797 ) ) ( not ( = ?auto_22798 ?auto_22802 ) ) ( IS-CRATE ?auto_22795 ) ( not ( = ?auto_22817 ?auto_22799 ) ) ( HOIST-AT ?auto_22818 ?auto_22817 ) ( AVAILABLE ?auto_22818 ) ( SURFACE-AT ?auto_22795 ?auto_22817 ) ( ON ?auto_22795 ?auto_22825 ) ( CLEAR ?auto_22795 ) ( not ( = ?auto_22794 ?auto_22795 ) ) ( not ( = ?auto_22794 ?auto_22825 ) ) ( not ( = ?auto_22795 ?auto_22825 ) ) ( not ( = ?auto_22798 ?auto_22818 ) ) ( IS-CRATE ?auto_22794 ) ( AVAILABLE ?auto_22802 ) ( SURFACE-AT ?auto_22794 ?auto_22800 ) ( ON ?auto_22794 ?auto_22809 ) ( CLEAR ?auto_22794 ) ( not ( = ?auto_22793 ?auto_22794 ) ) ( not ( = ?auto_22793 ?auto_22809 ) ) ( not ( = ?auto_22794 ?auto_22809 ) ) ( IS-CRATE ?auto_22793 ) ( not ( = ?auto_22830 ?auto_22799 ) ) ( HOIST-AT ?auto_22806 ?auto_22830 ) ( SURFACE-AT ?auto_22793 ?auto_22830 ) ( ON ?auto_22793 ?auto_22808 ) ( CLEAR ?auto_22793 ) ( not ( = ?auto_22792 ?auto_22793 ) ) ( not ( = ?auto_22792 ?auto_22808 ) ) ( not ( = ?auto_22793 ?auto_22808 ) ) ( not ( = ?auto_22798 ?auto_22806 ) ) ( IS-CRATE ?auto_22792 ) ( not ( = ?auto_22828 ?auto_22799 ) ) ( HOIST-AT ?auto_22826 ?auto_22828 ) ( SURFACE-AT ?auto_22792 ?auto_22828 ) ( ON ?auto_22792 ?auto_22819 ) ( CLEAR ?auto_22792 ) ( not ( = ?auto_22791 ?auto_22792 ) ) ( not ( = ?auto_22791 ?auto_22819 ) ) ( not ( = ?auto_22792 ?auto_22819 ) ) ( not ( = ?auto_22798 ?auto_22826 ) ) ( IS-CRATE ?auto_22791 ) ( not ( = ?auto_22827 ?auto_22799 ) ) ( HOIST-AT ?auto_22810 ?auto_22827 ) ( SURFACE-AT ?auto_22791 ?auto_22827 ) ( ON ?auto_22791 ?auto_22822 ) ( CLEAR ?auto_22791 ) ( not ( = ?auto_22790 ?auto_22791 ) ) ( not ( = ?auto_22790 ?auto_22822 ) ) ( not ( = ?auto_22791 ?auto_22822 ) ) ( not ( = ?auto_22798 ?auto_22810 ) ) ( IS-CRATE ?auto_22790 ) ( not ( = ?auto_22824 ?auto_22799 ) ) ( HOIST-AT ?auto_22807 ?auto_22824 ) ( SURFACE-AT ?auto_22790 ?auto_22824 ) ( ON ?auto_22790 ?auto_22820 ) ( CLEAR ?auto_22790 ) ( not ( = ?auto_22789 ?auto_22790 ) ) ( not ( = ?auto_22789 ?auto_22820 ) ) ( not ( = ?auto_22790 ?auto_22820 ) ) ( not ( = ?auto_22798 ?auto_22807 ) ) ( IS-CRATE ?auto_22789 ) ( not ( = ?auto_22823 ?auto_22799 ) ) ( HOIST-AT ?auto_22812 ?auto_22823 ) ( AVAILABLE ?auto_22812 ) ( SURFACE-AT ?auto_22789 ?auto_22823 ) ( ON ?auto_22789 ?auto_22805 ) ( CLEAR ?auto_22789 ) ( not ( = ?auto_22788 ?auto_22789 ) ) ( not ( = ?auto_22788 ?auto_22805 ) ) ( not ( = ?auto_22789 ?auto_22805 ) ) ( not ( = ?auto_22798 ?auto_22812 ) ) ( IS-CRATE ?auto_22788 ) ( not ( = ?auto_22815 ?auto_22799 ) ) ( HOIST-AT ?auto_22814 ?auto_22815 ) ( AVAILABLE ?auto_22814 ) ( SURFACE-AT ?auto_22788 ?auto_22815 ) ( ON ?auto_22788 ?auto_22821 ) ( CLEAR ?auto_22788 ) ( not ( = ?auto_22787 ?auto_22788 ) ) ( not ( = ?auto_22787 ?auto_22821 ) ) ( not ( = ?auto_22788 ?auto_22821 ) ) ( not ( = ?auto_22798 ?auto_22814 ) ) ( IS-CRATE ?auto_22787 ) ( AVAILABLE ?auto_22810 ) ( SURFACE-AT ?auto_22787 ?auto_22827 ) ( ON ?auto_22787 ?auto_22803 ) ( CLEAR ?auto_22787 ) ( not ( = ?auto_22786 ?auto_22787 ) ) ( not ( = ?auto_22786 ?auto_22803 ) ) ( not ( = ?auto_22787 ?auto_22803 ) ) ( IS-CRATE ?auto_22786 ) ( not ( = ?auto_22811 ?auto_22799 ) ) ( HOIST-AT ?auto_22816 ?auto_22811 ) ( SURFACE-AT ?auto_22786 ?auto_22811 ) ( ON ?auto_22786 ?auto_22831 ) ( CLEAR ?auto_22786 ) ( not ( = ?auto_22785 ?auto_22786 ) ) ( not ( = ?auto_22785 ?auto_22831 ) ) ( not ( = ?auto_22786 ?auto_22831 ) ) ( not ( = ?auto_22798 ?auto_22816 ) ) ( IS-CRATE ?auto_22785 ) ( AVAILABLE ?auto_22806 ) ( SURFACE-AT ?auto_22785 ?auto_22830 ) ( ON ?auto_22785 ?auto_22829 ) ( CLEAR ?auto_22785 ) ( not ( = ?auto_22784 ?auto_22785 ) ) ( not ( = ?auto_22784 ?auto_22829 ) ) ( not ( = ?auto_22785 ?auto_22829 ) ) ( IS-CRATE ?auto_22784 ) ( AVAILABLE ?auto_22826 ) ( SURFACE-AT ?auto_22784 ?auto_22828 ) ( ON ?auto_22784 ?auto_22813 ) ( CLEAR ?auto_22784 ) ( not ( = ?auto_22783 ?auto_22784 ) ) ( not ( = ?auto_22783 ?auto_22813 ) ) ( not ( = ?auto_22784 ?auto_22813 ) ) ( IS-CRATE ?auto_22783 ) ( AVAILABLE ?auto_22816 ) ( SURFACE-AT ?auto_22783 ?auto_22811 ) ( ON ?auto_22783 ?auto_22804 ) ( CLEAR ?auto_22783 ) ( not ( = ?auto_22782 ?auto_22783 ) ) ( not ( = ?auto_22782 ?auto_22804 ) ) ( not ( = ?auto_22783 ?auto_22804 ) ) ( SURFACE-AT ?auto_22781 ?auto_22799 ) ( CLEAR ?auto_22781 ) ( IS-CRATE ?auto_22782 ) ( AVAILABLE ?auto_22798 ) ( AVAILABLE ?auto_22807 ) ( SURFACE-AT ?auto_22782 ?auto_22824 ) ( ON ?auto_22782 ?auto_22832 ) ( CLEAR ?auto_22782 ) ( TRUCK-AT ?auto_22801 ?auto_22799 ) ( not ( = ?auto_22781 ?auto_22782 ) ) ( not ( = ?auto_22781 ?auto_22832 ) ) ( not ( = ?auto_22782 ?auto_22832 ) ) ( not ( = ?auto_22781 ?auto_22783 ) ) ( not ( = ?auto_22781 ?auto_22804 ) ) ( not ( = ?auto_22783 ?auto_22832 ) ) ( not ( = ?auto_22811 ?auto_22824 ) ) ( not ( = ?auto_22816 ?auto_22807 ) ) ( not ( = ?auto_22804 ?auto_22832 ) ) ( not ( = ?auto_22781 ?auto_22784 ) ) ( not ( = ?auto_22781 ?auto_22813 ) ) ( not ( = ?auto_22782 ?auto_22784 ) ) ( not ( = ?auto_22782 ?auto_22813 ) ) ( not ( = ?auto_22784 ?auto_22804 ) ) ( not ( = ?auto_22784 ?auto_22832 ) ) ( not ( = ?auto_22828 ?auto_22811 ) ) ( not ( = ?auto_22828 ?auto_22824 ) ) ( not ( = ?auto_22826 ?auto_22816 ) ) ( not ( = ?auto_22826 ?auto_22807 ) ) ( not ( = ?auto_22813 ?auto_22804 ) ) ( not ( = ?auto_22813 ?auto_22832 ) ) ( not ( = ?auto_22781 ?auto_22785 ) ) ( not ( = ?auto_22781 ?auto_22829 ) ) ( not ( = ?auto_22782 ?auto_22785 ) ) ( not ( = ?auto_22782 ?auto_22829 ) ) ( not ( = ?auto_22783 ?auto_22785 ) ) ( not ( = ?auto_22783 ?auto_22829 ) ) ( not ( = ?auto_22785 ?auto_22813 ) ) ( not ( = ?auto_22785 ?auto_22804 ) ) ( not ( = ?auto_22785 ?auto_22832 ) ) ( not ( = ?auto_22830 ?auto_22828 ) ) ( not ( = ?auto_22830 ?auto_22811 ) ) ( not ( = ?auto_22830 ?auto_22824 ) ) ( not ( = ?auto_22806 ?auto_22826 ) ) ( not ( = ?auto_22806 ?auto_22816 ) ) ( not ( = ?auto_22806 ?auto_22807 ) ) ( not ( = ?auto_22829 ?auto_22813 ) ) ( not ( = ?auto_22829 ?auto_22804 ) ) ( not ( = ?auto_22829 ?auto_22832 ) ) ( not ( = ?auto_22781 ?auto_22786 ) ) ( not ( = ?auto_22781 ?auto_22831 ) ) ( not ( = ?auto_22782 ?auto_22786 ) ) ( not ( = ?auto_22782 ?auto_22831 ) ) ( not ( = ?auto_22783 ?auto_22786 ) ) ( not ( = ?auto_22783 ?auto_22831 ) ) ( not ( = ?auto_22784 ?auto_22786 ) ) ( not ( = ?auto_22784 ?auto_22831 ) ) ( not ( = ?auto_22786 ?auto_22829 ) ) ( not ( = ?auto_22786 ?auto_22813 ) ) ( not ( = ?auto_22786 ?auto_22804 ) ) ( not ( = ?auto_22786 ?auto_22832 ) ) ( not ( = ?auto_22831 ?auto_22829 ) ) ( not ( = ?auto_22831 ?auto_22813 ) ) ( not ( = ?auto_22831 ?auto_22804 ) ) ( not ( = ?auto_22831 ?auto_22832 ) ) ( not ( = ?auto_22781 ?auto_22787 ) ) ( not ( = ?auto_22781 ?auto_22803 ) ) ( not ( = ?auto_22782 ?auto_22787 ) ) ( not ( = ?auto_22782 ?auto_22803 ) ) ( not ( = ?auto_22783 ?auto_22787 ) ) ( not ( = ?auto_22783 ?auto_22803 ) ) ( not ( = ?auto_22784 ?auto_22787 ) ) ( not ( = ?auto_22784 ?auto_22803 ) ) ( not ( = ?auto_22785 ?auto_22787 ) ) ( not ( = ?auto_22785 ?auto_22803 ) ) ( not ( = ?auto_22787 ?auto_22831 ) ) ( not ( = ?auto_22787 ?auto_22829 ) ) ( not ( = ?auto_22787 ?auto_22813 ) ) ( not ( = ?auto_22787 ?auto_22804 ) ) ( not ( = ?auto_22787 ?auto_22832 ) ) ( not ( = ?auto_22827 ?auto_22811 ) ) ( not ( = ?auto_22827 ?auto_22830 ) ) ( not ( = ?auto_22827 ?auto_22828 ) ) ( not ( = ?auto_22827 ?auto_22824 ) ) ( not ( = ?auto_22810 ?auto_22816 ) ) ( not ( = ?auto_22810 ?auto_22806 ) ) ( not ( = ?auto_22810 ?auto_22826 ) ) ( not ( = ?auto_22810 ?auto_22807 ) ) ( not ( = ?auto_22803 ?auto_22831 ) ) ( not ( = ?auto_22803 ?auto_22829 ) ) ( not ( = ?auto_22803 ?auto_22813 ) ) ( not ( = ?auto_22803 ?auto_22804 ) ) ( not ( = ?auto_22803 ?auto_22832 ) ) ( not ( = ?auto_22781 ?auto_22788 ) ) ( not ( = ?auto_22781 ?auto_22821 ) ) ( not ( = ?auto_22782 ?auto_22788 ) ) ( not ( = ?auto_22782 ?auto_22821 ) ) ( not ( = ?auto_22783 ?auto_22788 ) ) ( not ( = ?auto_22783 ?auto_22821 ) ) ( not ( = ?auto_22784 ?auto_22788 ) ) ( not ( = ?auto_22784 ?auto_22821 ) ) ( not ( = ?auto_22785 ?auto_22788 ) ) ( not ( = ?auto_22785 ?auto_22821 ) ) ( not ( = ?auto_22786 ?auto_22788 ) ) ( not ( = ?auto_22786 ?auto_22821 ) ) ( not ( = ?auto_22788 ?auto_22803 ) ) ( not ( = ?auto_22788 ?auto_22831 ) ) ( not ( = ?auto_22788 ?auto_22829 ) ) ( not ( = ?auto_22788 ?auto_22813 ) ) ( not ( = ?auto_22788 ?auto_22804 ) ) ( not ( = ?auto_22788 ?auto_22832 ) ) ( not ( = ?auto_22815 ?auto_22827 ) ) ( not ( = ?auto_22815 ?auto_22811 ) ) ( not ( = ?auto_22815 ?auto_22830 ) ) ( not ( = ?auto_22815 ?auto_22828 ) ) ( not ( = ?auto_22815 ?auto_22824 ) ) ( not ( = ?auto_22814 ?auto_22810 ) ) ( not ( = ?auto_22814 ?auto_22816 ) ) ( not ( = ?auto_22814 ?auto_22806 ) ) ( not ( = ?auto_22814 ?auto_22826 ) ) ( not ( = ?auto_22814 ?auto_22807 ) ) ( not ( = ?auto_22821 ?auto_22803 ) ) ( not ( = ?auto_22821 ?auto_22831 ) ) ( not ( = ?auto_22821 ?auto_22829 ) ) ( not ( = ?auto_22821 ?auto_22813 ) ) ( not ( = ?auto_22821 ?auto_22804 ) ) ( not ( = ?auto_22821 ?auto_22832 ) ) ( not ( = ?auto_22781 ?auto_22789 ) ) ( not ( = ?auto_22781 ?auto_22805 ) ) ( not ( = ?auto_22782 ?auto_22789 ) ) ( not ( = ?auto_22782 ?auto_22805 ) ) ( not ( = ?auto_22783 ?auto_22789 ) ) ( not ( = ?auto_22783 ?auto_22805 ) ) ( not ( = ?auto_22784 ?auto_22789 ) ) ( not ( = ?auto_22784 ?auto_22805 ) ) ( not ( = ?auto_22785 ?auto_22789 ) ) ( not ( = ?auto_22785 ?auto_22805 ) ) ( not ( = ?auto_22786 ?auto_22789 ) ) ( not ( = ?auto_22786 ?auto_22805 ) ) ( not ( = ?auto_22787 ?auto_22789 ) ) ( not ( = ?auto_22787 ?auto_22805 ) ) ( not ( = ?auto_22789 ?auto_22821 ) ) ( not ( = ?auto_22789 ?auto_22803 ) ) ( not ( = ?auto_22789 ?auto_22831 ) ) ( not ( = ?auto_22789 ?auto_22829 ) ) ( not ( = ?auto_22789 ?auto_22813 ) ) ( not ( = ?auto_22789 ?auto_22804 ) ) ( not ( = ?auto_22789 ?auto_22832 ) ) ( not ( = ?auto_22823 ?auto_22815 ) ) ( not ( = ?auto_22823 ?auto_22827 ) ) ( not ( = ?auto_22823 ?auto_22811 ) ) ( not ( = ?auto_22823 ?auto_22830 ) ) ( not ( = ?auto_22823 ?auto_22828 ) ) ( not ( = ?auto_22823 ?auto_22824 ) ) ( not ( = ?auto_22812 ?auto_22814 ) ) ( not ( = ?auto_22812 ?auto_22810 ) ) ( not ( = ?auto_22812 ?auto_22816 ) ) ( not ( = ?auto_22812 ?auto_22806 ) ) ( not ( = ?auto_22812 ?auto_22826 ) ) ( not ( = ?auto_22812 ?auto_22807 ) ) ( not ( = ?auto_22805 ?auto_22821 ) ) ( not ( = ?auto_22805 ?auto_22803 ) ) ( not ( = ?auto_22805 ?auto_22831 ) ) ( not ( = ?auto_22805 ?auto_22829 ) ) ( not ( = ?auto_22805 ?auto_22813 ) ) ( not ( = ?auto_22805 ?auto_22804 ) ) ( not ( = ?auto_22805 ?auto_22832 ) ) ( not ( = ?auto_22781 ?auto_22790 ) ) ( not ( = ?auto_22781 ?auto_22820 ) ) ( not ( = ?auto_22782 ?auto_22790 ) ) ( not ( = ?auto_22782 ?auto_22820 ) ) ( not ( = ?auto_22783 ?auto_22790 ) ) ( not ( = ?auto_22783 ?auto_22820 ) ) ( not ( = ?auto_22784 ?auto_22790 ) ) ( not ( = ?auto_22784 ?auto_22820 ) ) ( not ( = ?auto_22785 ?auto_22790 ) ) ( not ( = ?auto_22785 ?auto_22820 ) ) ( not ( = ?auto_22786 ?auto_22790 ) ) ( not ( = ?auto_22786 ?auto_22820 ) ) ( not ( = ?auto_22787 ?auto_22790 ) ) ( not ( = ?auto_22787 ?auto_22820 ) ) ( not ( = ?auto_22788 ?auto_22790 ) ) ( not ( = ?auto_22788 ?auto_22820 ) ) ( not ( = ?auto_22790 ?auto_22805 ) ) ( not ( = ?auto_22790 ?auto_22821 ) ) ( not ( = ?auto_22790 ?auto_22803 ) ) ( not ( = ?auto_22790 ?auto_22831 ) ) ( not ( = ?auto_22790 ?auto_22829 ) ) ( not ( = ?auto_22790 ?auto_22813 ) ) ( not ( = ?auto_22790 ?auto_22804 ) ) ( not ( = ?auto_22790 ?auto_22832 ) ) ( not ( = ?auto_22820 ?auto_22805 ) ) ( not ( = ?auto_22820 ?auto_22821 ) ) ( not ( = ?auto_22820 ?auto_22803 ) ) ( not ( = ?auto_22820 ?auto_22831 ) ) ( not ( = ?auto_22820 ?auto_22829 ) ) ( not ( = ?auto_22820 ?auto_22813 ) ) ( not ( = ?auto_22820 ?auto_22804 ) ) ( not ( = ?auto_22820 ?auto_22832 ) ) ( not ( = ?auto_22781 ?auto_22791 ) ) ( not ( = ?auto_22781 ?auto_22822 ) ) ( not ( = ?auto_22782 ?auto_22791 ) ) ( not ( = ?auto_22782 ?auto_22822 ) ) ( not ( = ?auto_22783 ?auto_22791 ) ) ( not ( = ?auto_22783 ?auto_22822 ) ) ( not ( = ?auto_22784 ?auto_22791 ) ) ( not ( = ?auto_22784 ?auto_22822 ) ) ( not ( = ?auto_22785 ?auto_22791 ) ) ( not ( = ?auto_22785 ?auto_22822 ) ) ( not ( = ?auto_22786 ?auto_22791 ) ) ( not ( = ?auto_22786 ?auto_22822 ) ) ( not ( = ?auto_22787 ?auto_22791 ) ) ( not ( = ?auto_22787 ?auto_22822 ) ) ( not ( = ?auto_22788 ?auto_22791 ) ) ( not ( = ?auto_22788 ?auto_22822 ) ) ( not ( = ?auto_22789 ?auto_22791 ) ) ( not ( = ?auto_22789 ?auto_22822 ) ) ( not ( = ?auto_22791 ?auto_22820 ) ) ( not ( = ?auto_22791 ?auto_22805 ) ) ( not ( = ?auto_22791 ?auto_22821 ) ) ( not ( = ?auto_22791 ?auto_22803 ) ) ( not ( = ?auto_22791 ?auto_22831 ) ) ( not ( = ?auto_22791 ?auto_22829 ) ) ( not ( = ?auto_22791 ?auto_22813 ) ) ( not ( = ?auto_22791 ?auto_22804 ) ) ( not ( = ?auto_22791 ?auto_22832 ) ) ( not ( = ?auto_22822 ?auto_22820 ) ) ( not ( = ?auto_22822 ?auto_22805 ) ) ( not ( = ?auto_22822 ?auto_22821 ) ) ( not ( = ?auto_22822 ?auto_22803 ) ) ( not ( = ?auto_22822 ?auto_22831 ) ) ( not ( = ?auto_22822 ?auto_22829 ) ) ( not ( = ?auto_22822 ?auto_22813 ) ) ( not ( = ?auto_22822 ?auto_22804 ) ) ( not ( = ?auto_22822 ?auto_22832 ) ) ( not ( = ?auto_22781 ?auto_22792 ) ) ( not ( = ?auto_22781 ?auto_22819 ) ) ( not ( = ?auto_22782 ?auto_22792 ) ) ( not ( = ?auto_22782 ?auto_22819 ) ) ( not ( = ?auto_22783 ?auto_22792 ) ) ( not ( = ?auto_22783 ?auto_22819 ) ) ( not ( = ?auto_22784 ?auto_22792 ) ) ( not ( = ?auto_22784 ?auto_22819 ) ) ( not ( = ?auto_22785 ?auto_22792 ) ) ( not ( = ?auto_22785 ?auto_22819 ) ) ( not ( = ?auto_22786 ?auto_22792 ) ) ( not ( = ?auto_22786 ?auto_22819 ) ) ( not ( = ?auto_22787 ?auto_22792 ) ) ( not ( = ?auto_22787 ?auto_22819 ) ) ( not ( = ?auto_22788 ?auto_22792 ) ) ( not ( = ?auto_22788 ?auto_22819 ) ) ( not ( = ?auto_22789 ?auto_22792 ) ) ( not ( = ?auto_22789 ?auto_22819 ) ) ( not ( = ?auto_22790 ?auto_22792 ) ) ( not ( = ?auto_22790 ?auto_22819 ) ) ( not ( = ?auto_22792 ?auto_22822 ) ) ( not ( = ?auto_22792 ?auto_22820 ) ) ( not ( = ?auto_22792 ?auto_22805 ) ) ( not ( = ?auto_22792 ?auto_22821 ) ) ( not ( = ?auto_22792 ?auto_22803 ) ) ( not ( = ?auto_22792 ?auto_22831 ) ) ( not ( = ?auto_22792 ?auto_22829 ) ) ( not ( = ?auto_22792 ?auto_22813 ) ) ( not ( = ?auto_22792 ?auto_22804 ) ) ( not ( = ?auto_22792 ?auto_22832 ) ) ( not ( = ?auto_22819 ?auto_22822 ) ) ( not ( = ?auto_22819 ?auto_22820 ) ) ( not ( = ?auto_22819 ?auto_22805 ) ) ( not ( = ?auto_22819 ?auto_22821 ) ) ( not ( = ?auto_22819 ?auto_22803 ) ) ( not ( = ?auto_22819 ?auto_22831 ) ) ( not ( = ?auto_22819 ?auto_22829 ) ) ( not ( = ?auto_22819 ?auto_22813 ) ) ( not ( = ?auto_22819 ?auto_22804 ) ) ( not ( = ?auto_22819 ?auto_22832 ) ) ( not ( = ?auto_22781 ?auto_22793 ) ) ( not ( = ?auto_22781 ?auto_22808 ) ) ( not ( = ?auto_22782 ?auto_22793 ) ) ( not ( = ?auto_22782 ?auto_22808 ) ) ( not ( = ?auto_22783 ?auto_22793 ) ) ( not ( = ?auto_22783 ?auto_22808 ) ) ( not ( = ?auto_22784 ?auto_22793 ) ) ( not ( = ?auto_22784 ?auto_22808 ) ) ( not ( = ?auto_22785 ?auto_22793 ) ) ( not ( = ?auto_22785 ?auto_22808 ) ) ( not ( = ?auto_22786 ?auto_22793 ) ) ( not ( = ?auto_22786 ?auto_22808 ) ) ( not ( = ?auto_22787 ?auto_22793 ) ) ( not ( = ?auto_22787 ?auto_22808 ) ) ( not ( = ?auto_22788 ?auto_22793 ) ) ( not ( = ?auto_22788 ?auto_22808 ) ) ( not ( = ?auto_22789 ?auto_22793 ) ) ( not ( = ?auto_22789 ?auto_22808 ) ) ( not ( = ?auto_22790 ?auto_22793 ) ) ( not ( = ?auto_22790 ?auto_22808 ) ) ( not ( = ?auto_22791 ?auto_22793 ) ) ( not ( = ?auto_22791 ?auto_22808 ) ) ( not ( = ?auto_22793 ?auto_22819 ) ) ( not ( = ?auto_22793 ?auto_22822 ) ) ( not ( = ?auto_22793 ?auto_22820 ) ) ( not ( = ?auto_22793 ?auto_22805 ) ) ( not ( = ?auto_22793 ?auto_22821 ) ) ( not ( = ?auto_22793 ?auto_22803 ) ) ( not ( = ?auto_22793 ?auto_22831 ) ) ( not ( = ?auto_22793 ?auto_22829 ) ) ( not ( = ?auto_22793 ?auto_22813 ) ) ( not ( = ?auto_22793 ?auto_22804 ) ) ( not ( = ?auto_22793 ?auto_22832 ) ) ( not ( = ?auto_22808 ?auto_22819 ) ) ( not ( = ?auto_22808 ?auto_22822 ) ) ( not ( = ?auto_22808 ?auto_22820 ) ) ( not ( = ?auto_22808 ?auto_22805 ) ) ( not ( = ?auto_22808 ?auto_22821 ) ) ( not ( = ?auto_22808 ?auto_22803 ) ) ( not ( = ?auto_22808 ?auto_22831 ) ) ( not ( = ?auto_22808 ?auto_22829 ) ) ( not ( = ?auto_22808 ?auto_22813 ) ) ( not ( = ?auto_22808 ?auto_22804 ) ) ( not ( = ?auto_22808 ?auto_22832 ) ) ( not ( = ?auto_22781 ?auto_22794 ) ) ( not ( = ?auto_22781 ?auto_22809 ) ) ( not ( = ?auto_22782 ?auto_22794 ) ) ( not ( = ?auto_22782 ?auto_22809 ) ) ( not ( = ?auto_22783 ?auto_22794 ) ) ( not ( = ?auto_22783 ?auto_22809 ) ) ( not ( = ?auto_22784 ?auto_22794 ) ) ( not ( = ?auto_22784 ?auto_22809 ) ) ( not ( = ?auto_22785 ?auto_22794 ) ) ( not ( = ?auto_22785 ?auto_22809 ) ) ( not ( = ?auto_22786 ?auto_22794 ) ) ( not ( = ?auto_22786 ?auto_22809 ) ) ( not ( = ?auto_22787 ?auto_22794 ) ) ( not ( = ?auto_22787 ?auto_22809 ) ) ( not ( = ?auto_22788 ?auto_22794 ) ) ( not ( = ?auto_22788 ?auto_22809 ) ) ( not ( = ?auto_22789 ?auto_22794 ) ) ( not ( = ?auto_22789 ?auto_22809 ) ) ( not ( = ?auto_22790 ?auto_22794 ) ) ( not ( = ?auto_22790 ?auto_22809 ) ) ( not ( = ?auto_22791 ?auto_22794 ) ) ( not ( = ?auto_22791 ?auto_22809 ) ) ( not ( = ?auto_22792 ?auto_22794 ) ) ( not ( = ?auto_22792 ?auto_22809 ) ) ( not ( = ?auto_22794 ?auto_22808 ) ) ( not ( = ?auto_22794 ?auto_22819 ) ) ( not ( = ?auto_22794 ?auto_22822 ) ) ( not ( = ?auto_22794 ?auto_22820 ) ) ( not ( = ?auto_22794 ?auto_22805 ) ) ( not ( = ?auto_22794 ?auto_22821 ) ) ( not ( = ?auto_22794 ?auto_22803 ) ) ( not ( = ?auto_22794 ?auto_22831 ) ) ( not ( = ?auto_22794 ?auto_22829 ) ) ( not ( = ?auto_22794 ?auto_22813 ) ) ( not ( = ?auto_22794 ?auto_22804 ) ) ( not ( = ?auto_22794 ?auto_22832 ) ) ( not ( = ?auto_22800 ?auto_22830 ) ) ( not ( = ?auto_22800 ?auto_22828 ) ) ( not ( = ?auto_22800 ?auto_22827 ) ) ( not ( = ?auto_22800 ?auto_22824 ) ) ( not ( = ?auto_22800 ?auto_22823 ) ) ( not ( = ?auto_22800 ?auto_22815 ) ) ( not ( = ?auto_22800 ?auto_22811 ) ) ( not ( = ?auto_22802 ?auto_22806 ) ) ( not ( = ?auto_22802 ?auto_22826 ) ) ( not ( = ?auto_22802 ?auto_22810 ) ) ( not ( = ?auto_22802 ?auto_22807 ) ) ( not ( = ?auto_22802 ?auto_22812 ) ) ( not ( = ?auto_22802 ?auto_22814 ) ) ( not ( = ?auto_22802 ?auto_22816 ) ) ( not ( = ?auto_22809 ?auto_22808 ) ) ( not ( = ?auto_22809 ?auto_22819 ) ) ( not ( = ?auto_22809 ?auto_22822 ) ) ( not ( = ?auto_22809 ?auto_22820 ) ) ( not ( = ?auto_22809 ?auto_22805 ) ) ( not ( = ?auto_22809 ?auto_22821 ) ) ( not ( = ?auto_22809 ?auto_22803 ) ) ( not ( = ?auto_22809 ?auto_22831 ) ) ( not ( = ?auto_22809 ?auto_22829 ) ) ( not ( = ?auto_22809 ?auto_22813 ) ) ( not ( = ?auto_22809 ?auto_22804 ) ) ( not ( = ?auto_22809 ?auto_22832 ) ) ( not ( = ?auto_22781 ?auto_22795 ) ) ( not ( = ?auto_22781 ?auto_22825 ) ) ( not ( = ?auto_22782 ?auto_22795 ) ) ( not ( = ?auto_22782 ?auto_22825 ) ) ( not ( = ?auto_22783 ?auto_22795 ) ) ( not ( = ?auto_22783 ?auto_22825 ) ) ( not ( = ?auto_22784 ?auto_22795 ) ) ( not ( = ?auto_22784 ?auto_22825 ) ) ( not ( = ?auto_22785 ?auto_22795 ) ) ( not ( = ?auto_22785 ?auto_22825 ) ) ( not ( = ?auto_22786 ?auto_22795 ) ) ( not ( = ?auto_22786 ?auto_22825 ) ) ( not ( = ?auto_22787 ?auto_22795 ) ) ( not ( = ?auto_22787 ?auto_22825 ) ) ( not ( = ?auto_22788 ?auto_22795 ) ) ( not ( = ?auto_22788 ?auto_22825 ) ) ( not ( = ?auto_22789 ?auto_22795 ) ) ( not ( = ?auto_22789 ?auto_22825 ) ) ( not ( = ?auto_22790 ?auto_22795 ) ) ( not ( = ?auto_22790 ?auto_22825 ) ) ( not ( = ?auto_22791 ?auto_22795 ) ) ( not ( = ?auto_22791 ?auto_22825 ) ) ( not ( = ?auto_22792 ?auto_22795 ) ) ( not ( = ?auto_22792 ?auto_22825 ) ) ( not ( = ?auto_22793 ?auto_22795 ) ) ( not ( = ?auto_22793 ?auto_22825 ) ) ( not ( = ?auto_22795 ?auto_22809 ) ) ( not ( = ?auto_22795 ?auto_22808 ) ) ( not ( = ?auto_22795 ?auto_22819 ) ) ( not ( = ?auto_22795 ?auto_22822 ) ) ( not ( = ?auto_22795 ?auto_22820 ) ) ( not ( = ?auto_22795 ?auto_22805 ) ) ( not ( = ?auto_22795 ?auto_22821 ) ) ( not ( = ?auto_22795 ?auto_22803 ) ) ( not ( = ?auto_22795 ?auto_22831 ) ) ( not ( = ?auto_22795 ?auto_22829 ) ) ( not ( = ?auto_22795 ?auto_22813 ) ) ( not ( = ?auto_22795 ?auto_22804 ) ) ( not ( = ?auto_22795 ?auto_22832 ) ) ( not ( = ?auto_22817 ?auto_22800 ) ) ( not ( = ?auto_22817 ?auto_22830 ) ) ( not ( = ?auto_22817 ?auto_22828 ) ) ( not ( = ?auto_22817 ?auto_22827 ) ) ( not ( = ?auto_22817 ?auto_22824 ) ) ( not ( = ?auto_22817 ?auto_22823 ) ) ( not ( = ?auto_22817 ?auto_22815 ) ) ( not ( = ?auto_22817 ?auto_22811 ) ) ( not ( = ?auto_22818 ?auto_22802 ) ) ( not ( = ?auto_22818 ?auto_22806 ) ) ( not ( = ?auto_22818 ?auto_22826 ) ) ( not ( = ?auto_22818 ?auto_22810 ) ) ( not ( = ?auto_22818 ?auto_22807 ) ) ( not ( = ?auto_22818 ?auto_22812 ) ) ( not ( = ?auto_22818 ?auto_22814 ) ) ( not ( = ?auto_22818 ?auto_22816 ) ) ( not ( = ?auto_22825 ?auto_22809 ) ) ( not ( = ?auto_22825 ?auto_22808 ) ) ( not ( = ?auto_22825 ?auto_22819 ) ) ( not ( = ?auto_22825 ?auto_22822 ) ) ( not ( = ?auto_22825 ?auto_22820 ) ) ( not ( = ?auto_22825 ?auto_22805 ) ) ( not ( = ?auto_22825 ?auto_22821 ) ) ( not ( = ?auto_22825 ?auto_22803 ) ) ( not ( = ?auto_22825 ?auto_22831 ) ) ( not ( = ?auto_22825 ?auto_22829 ) ) ( not ( = ?auto_22825 ?auto_22813 ) ) ( not ( = ?auto_22825 ?auto_22804 ) ) ( not ( = ?auto_22825 ?auto_22832 ) ) ( not ( = ?auto_22781 ?auto_22796 ) ) ( not ( = ?auto_22781 ?auto_22797 ) ) ( not ( = ?auto_22782 ?auto_22796 ) ) ( not ( = ?auto_22782 ?auto_22797 ) ) ( not ( = ?auto_22783 ?auto_22796 ) ) ( not ( = ?auto_22783 ?auto_22797 ) ) ( not ( = ?auto_22784 ?auto_22796 ) ) ( not ( = ?auto_22784 ?auto_22797 ) ) ( not ( = ?auto_22785 ?auto_22796 ) ) ( not ( = ?auto_22785 ?auto_22797 ) ) ( not ( = ?auto_22786 ?auto_22796 ) ) ( not ( = ?auto_22786 ?auto_22797 ) ) ( not ( = ?auto_22787 ?auto_22796 ) ) ( not ( = ?auto_22787 ?auto_22797 ) ) ( not ( = ?auto_22788 ?auto_22796 ) ) ( not ( = ?auto_22788 ?auto_22797 ) ) ( not ( = ?auto_22789 ?auto_22796 ) ) ( not ( = ?auto_22789 ?auto_22797 ) ) ( not ( = ?auto_22790 ?auto_22796 ) ) ( not ( = ?auto_22790 ?auto_22797 ) ) ( not ( = ?auto_22791 ?auto_22796 ) ) ( not ( = ?auto_22791 ?auto_22797 ) ) ( not ( = ?auto_22792 ?auto_22796 ) ) ( not ( = ?auto_22792 ?auto_22797 ) ) ( not ( = ?auto_22793 ?auto_22796 ) ) ( not ( = ?auto_22793 ?auto_22797 ) ) ( not ( = ?auto_22794 ?auto_22796 ) ) ( not ( = ?auto_22794 ?auto_22797 ) ) ( not ( = ?auto_22796 ?auto_22825 ) ) ( not ( = ?auto_22796 ?auto_22809 ) ) ( not ( = ?auto_22796 ?auto_22808 ) ) ( not ( = ?auto_22796 ?auto_22819 ) ) ( not ( = ?auto_22796 ?auto_22822 ) ) ( not ( = ?auto_22796 ?auto_22820 ) ) ( not ( = ?auto_22796 ?auto_22805 ) ) ( not ( = ?auto_22796 ?auto_22821 ) ) ( not ( = ?auto_22796 ?auto_22803 ) ) ( not ( = ?auto_22796 ?auto_22831 ) ) ( not ( = ?auto_22796 ?auto_22829 ) ) ( not ( = ?auto_22796 ?auto_22813 ) ) ( not ( = ?auto_22796 ?auto_22804 ) ) ( not ( = ?auto_22796 ?auto_22832 ) ) ( not ( = ?auto_22797 ?auto_22825 ) ) ( not ( = ?auto_22797 ?auto_22809 ) ) ( not ( = ?auto_22797 ?auto_22808 ) ) ( not ( = ?auto_22797 ?auto_22819 ) ) ( not ( = ?auto_22797 ?auto_22822 ) ) ( not ( = ?auto_22797 ?auto_22820 ) ) ( not ( = ?auto_22797 ?auto_22805 ) ) ( not ( = ?auto_22797 ?auto_22821 ) ) ( not ( = ?auto_22797 ?auto_22803 ) ) ( not ( = ?auto_22797 ?auto_22831 ) ) ( not ( = ?auto_22797 ?auto_22829 ) ) ( not ( = ?auto_22797 ?auto_22813 ) ) ( not ( = ?auto_22797 ?auto_22804 ) ) ( not ( = ?auto_22797 ?auto_22832 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_22781 ?auto_22782 ?auto_22783 ?auto_22784 ?auto_22785 ?auto_22786 ?auto_22787 ?auto_22788 ?auto_22789 ?auto_22790 ?auto_22791 ?auto_22792 ?auto_22793 ?auto_22794 ?auto_22795 )
      ( MAKE-1CRATE ?auto_22795 ?auto_22796 )
      ( MAKE-15CRATE-VERIFY ?auto_22781 ?auto_22782 ?auto_22783 ?auto_22784 ?auto_22785 ?auto_22786 ?auto_22787 ?auto_22788 ?auto_22789 ?auto_22790 ?auto_22791 ?auto_22792 ?auto_22793 ?auto_22794 ?auto_22795 ?auto_22796 ) )
  )

)

