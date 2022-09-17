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

  ( :method MAKE-16CRATE-VERIFY
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
      ?c16 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( ON ?c16 ?c15 ) ( CLEAR ?c16 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2525131 - SURFACE
      ?auto_2525132 - SURFACE
    )
    :vars
    (
      ?auto_2525133 - HOIST
      ?auto_2525134 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525133 ?auto_2525134 ) ( SURFACE-AT ?auto_2525131 ?auto_2525134 ) ( CLEAR ?auto_2525131 ) ( LIFTING ?auto_2525133 ?auto_2525132 ) ( IS-CRATE ?auto_2525132 ) ( not ( = ?auto_2525131 ?auto_2525132 ) ) )
    :subtasks
    ( ( !DROP ?auto_2525133 ?auto_2525132 ?auto_2525131 ?auto_2525134 )
      ( MAKE-1CRATE-VERIFY ?auto_2525131 ?auto_2525132 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2525135 - SURFACE
      ?auto_2525136 - SURFACE
    )
    :vars
    (
      ?auto_2525138 - HOIST
      ?auto_2525137 - PLACE
      ?auto_2525139 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525138 ?auto_2525137 ) ( SURFACE-AT ?auto_2525135 ?auto_2525137 ) ( CLEAR ?auto_2525135 ) ( IS-CRATE ?auto_2525136 ) ( not ( = ?auto_2525135 ?auto_2525136 ) ) ( TRUCK-AT ?auto_2525139 ?auto_2525137 ) ( AVAILABLE ?auto_2525138 ) ( IN ?auto_2525136 ?auto_2525139 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2525138 ?auto_2525136 ?auto_2525139 ?auto_2525137 )
      ( MAKE-1CRATE ?auto_2525135 ?auto_2525136 )
      ( MAKE-1CRATE-VERIFY ?auto_2525135 ?auto_2525136 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2525140 - SURFACE
      ?auto_2525141 - SURFACE
    )
    :vars
    (
      ?auto_2525143 - HOIST
      ?auto_2525144 - PLACE
      ?auto_2525142 - TRUCK
      ?auto_2525145 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525143 ?auto_2525144 ) ( SURFACE-AT ?auto_2525140 ?auto_2525144 ) ( CLEAR ?auto_2525140 ) ( IS-CRATE ?auto_2525141 ) ( not ( = ?auto_2525140 ?auto_2525141 ) ) ( AVAILABLE ?auto_2525143 ) ( IN ?auto_2525141 ?auto_2525142 ) ( TRUCK-AT ?auto_2525142 ?auto_2525145 ) ( not ( = ?auto_2525145 ?auto_2525144 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2525142 ?auto_2525145 ?auto_2525144 )
      ( MAKE-1CRATE ?auto_2525140 ?auto_2525141 )
      ( MAKE-1CRATE-VERIFY ?auto_2525140 ?auto_2525141 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2525146 - SURFACE
      ?auto_2525147 - SURFACE
    )
    :vars
    (
      ?auto_2525151 - HOIST
      ?auto_2525150 - PLACE
      ?auto_2525148 - TRUCK
      ?auto_2525149 - PLACE
      ?auto_2525152 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525151 ?auto_2525150 ) ( SURFACE-AT ?auto_2525146 ?auto_2525150 ) ( CLEAR ?auto_2525146 ) ( IS-CRATE ?auto_2525147 ) ( not ( = ?auto_2525146 ?auto_2525147 ) ) ( AVAILABLE ?auto_2525151 ) ( TRUCK-AT ?auto_2525148 ?auto_2525149 ) ( not ( = ?auto_2525149 ?auto_2525150 ) ) ( HOIST-AT ?auto_2525152 ?auto_2525149 ) ( LIFTING ?auto_2525152 ?auto_2525147 ) ( not ( = ?auto_2525151 ?auto_2525152 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2525152 ?auto_2525147 ?auto_2525148 ?auto_2525149 )
      ( MAKE-1CRATE ?auto_2525146 ?auto_2525147 )
      ( MAKE-1CRATE-VERIFY ?auto_2525146 ?auto_2525147 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2525153 - SURFACE
      ?auto_2525154 - SURFACE
    )
    :vars
    (
      ?auto_2525156 - HOIST
      ?auto_2525157 - PLACE
      ?auto_2525155 - TRUCK
      ?auto_2525159 - PLACE
      ?auto_2525158 - HOIST
      ?auto_2525160 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525156 ?auto_2525157 ) ( SURFACE-AT ?auto_2525153 ?auto_2525157 ) ( CLEAR ?auto_2525153 ) ( IS-CRATE ?auto_2525154 ) ( not ( = ?auto_2525153 ?auto_2525154 ) ) ( AVAILABLE ?auto_2525156 ) ( TRUCK-AT ?auto_2525155 ?auto_2525159 ) ( not ( = ?auto_2525159 ?auto_2525157 ) ) ( HOIST-AT ?auto_2525158 ?auto_2525159 ) ( not ( = ?auto_2525156 ?auto_2525158 ) ) ( AVAILABLE ?auto_2525158 ) ( SURFACE-AT ?auto_2525154 ?auto_2525159 ) ( ON ?auto_2525154 ?auto_2525160 ) ( CLEAR ?auto_2525154 ) ( not ( = ?auto_2525153 ?auto_2525160 ) ) ( not ( = ?auto_2525154 ?auto_2525160 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2525158 ?auto_2525154 ?auto_2525160 ?auto_2525159 )
      ( MAKE-1CRATE ?auto_2525153 ?auto_2525154 )
      ( MAKE-1CRATE-VERIFY ?auto_2525153 ?auto_2525154 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2525161 - SURFACE
      ?auto_2525162 - SURFACE
    )
    :vars
    (
      ?auto_2525166 - HOIST
      ?auto_2525167 - PLACE
      ?auto_2525165 - PLACE
      ?auto_2525163 - HOIST
      ?auto_2525168 - SURFACE
      ?auto_2525164 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525166 ?auto_2525167 ) ( SURFACE-AT ?auto_2525161 ?auto_2525167 ) ( CLEAR ?auto_2525161 ) ( IS-CRATE ?auto_2525162 ) ( not ( = ?auto_2525161 ?auto_2525162 ) ) ( AVAILABLE ?auto_2525166 ) ( not ( = ?auto_2525165 ?auto_2525167 ) ) ( HOIST-AT ?auto_2525163 ?auto_2525165 ) ( not ( = ?auto_2525166 ?auto_2525163 ) ) ( AVAILABLE ?auto_2525163 ) ( SURFACE-AT ?auto_2525162 ?auto_2525165 ) ( ON ?auto_2525162 ?auto_2525168 ) ( CLEAR ?auto_2525162 ) ( not ( = ?auto_2525161 ?auto_2525168 ) ) ( not ( = ?auto_2525162 ?auto_2525168 ) ) ( TRUCK-AT ?auto_2525164 ?auto_2525167 ) )
    :subtasks
    ( ( !DRIVE ?auto_2525164 ?auto_2525167 ?auto_2525165 )
      ( MAKE-1CRATE ?auto_2525161 ?auto_2525162 )
      ( MAKE-1CRATE-VERIFY ?auto_2525161 ?auto_2525162 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2525178 - SURFACE
      ?auto_2525179 - SURFACE
      ?auto_2525180 - SURFACE
    )
    :vars
    (
      ?auto_2525182 - HOIST
      ?auto_2525181 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525182 ?auto_2525181 ) ( SURFACE-AT ?auto_2525179 ?auto_2525181 ) ( CLEAR ?auto_2525179 ) ( LIFTING ?auto_2525182 ?auto_2525180 ) ( IS-CRATE ?auto_2525180 ) ( not ( = ?auto_2525179 ?auto_2525180 ) ) ( ON ?auto_2525179 ?auto_2525178 ) ( not ( = ?auto_2525178 ?auto_2525179 ) ) ( not ( = ?auto_2525178 ?auto_2525180 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2525179 ?auto_2525180 )
      ( MAKE-2CRATE-VERIFY ?auto_2525178 ?auto_2525179 ?auto_2525180 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2525188 - SURFACE
      ?auto_2525189 - SURFACE
      ?auto_2525190 - SURFACE
    )
    :vars
    (
      ?auto_2525191 - HOIST
      ?auto_2525192 - PLACE
      ?auto_2525193 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525191 ?auto_2525192 ) ( SURFACE-AT ?auto_2525189 ?auto_2525192 ) ( CLEAR ?auto_2525189 ) ( IS-CRATE ?auto_2525190 ) ( not ( = ?auto_2525189 ?auto_2525190 ) ) ( TRUCK-AT ?auto_2525193 ?auto_2525192 ) ( AVAILABLE ?auto_2525191 ) ( IN ?auto_2525190 ?auto_2525193 ) ( ON ?auto_2525189 ?auto_2525188 ) ( not ( = ?auto_2525188 ?auto_2525189 ) ) ( not ( = ?auto_2525188 ?auto_2525190 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2525189 ?auto_2525190 )
      ( MAKE-2CRATE-VERIFY ?auto_2525188 ?auto_2525189 ?auto_2525190 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2525194 - SURFACE
      ?auto_2525195 - SURFACE
    )
    :vars
    (
      ?auto_2525196 - HOIST
      ?auto_2525199 - PLACE
      ?auto_2525197 - TRUCK
      ?auto_2525198 - SURFACE
      ?auto_2525200 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525196 ?auto_2525199 ) ( SURFACE-AT ?auto_2525194 ?auto_2525199 ) ( CLEAR ?auto_2525194 ) ( IS-CRATE ?auto_2525195 ) ( not ( = ?auto_2525194 ?auto_2525195 ) ) ( AVAILABLE ?auto_2525196 ) ( IN ?auto_2525195 ?auto_2525197 ) ( ON ?auto_2525194 ?auto_2525198 ) ( not ( = ?auto_2525198 ?auto_2525194 ) ) ( not ( = ?auto_2525198 ?auto_2525195 ) ) ( TRUCK-AT ?auto_2525197 ?auto_2525200 ) ( not ( = ?auto_2525200 ?auto_2525199 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2525197 ?auto_2525200 ?auto_2525199 )
      ( MAKE-2CRATE ?auto_2525198 ?auto_2525194 ?auto_2525195 )
      ( MAKE-1CRATE-VERIFY ?auto_2525194 ?auto_2525195 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2525201 - SURFACE
      ?auto_2525202 - SURFACE
      ?auto_2525203 - SURFACE
    )
    :vars
    (
      ?auto_2525206 - HOIST
      ?auto_2525205 - PLACE
      ?auto_2525204 - TRUCK
      ?auto_2525207 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525206 ?auto_2525205 ) ( SURFACE-AT ?auto_2525202 ?auto_2525205 ) ( CLEAR ?auto_2525202 ) ( IS-CRATE ?auto_2525203 ) ( not ( = ?auto_2525202 ?auto_2525203 ) ) ( AVAILABLE ?auto_2525206 ) ( IN ?auto_2525203 ?auto_2525204 ) ( ON ?auto_2525202 ?auto_2525201 ) ( not ( = ?auto_2525201 ?auto_2525202 ) ) ( not ( = ?auto_2525201 ?auto_2525203 ) ) ( TRUCK-AT ?auto_2525204 ?auto_2525207 ) ( not ( = ?auto_2525207 ?auto_2525205 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2525202 ?auto_2525203 )
      ( MAKE-2CRATE-VERIFY ?auto_2525201 ?auto_2525202 ?auto_2525203 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2525208 - SURFACE
      ?auto_2525209 - SURFACE
    )
    :vars
    (
      ?auto_2525211 - HOIST
      ?auto_2525213 - PLACE
      ?auto_2525214 - SURFACE
      ?auto_2525212 - TRUCK
      ?auto_2525210 - PLACE
      ?auto_2525215 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525211 ?auto_2525213 ) ( SURFACE-AT ?auto_2525208 ?auto_2525213 ) ( CLEAR ?auto_2525208 ) ( IS-CRATE ?auto_2525209 ) ( not ( = ?auto_2525208 ?auto_2525209 ) ) ( AVAILABLE ?auto_2525211 ) ( ON ?auto_2525208 ?auto_2525214 ) ( not ( = ?auto_2525214 ?auto_2525208 ) ) ( not ( = ?auto_2525214 ?auto_2525209 ) ) ( TRUCK-AT ?auto_2525212 ?auto_2525210 ) ( not ( = ?auto_2525210 ?auto_2525213 ) ) ( HOIST-AT ?auto_2525215 ?auto_2525210 ) ( LIFTING ?auto_2525215 ?auto_2525209 ) ( not ( = ?auto_2525211 ?auto_2525215 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2525215 ?auto_2525209 ?auto_2525212 ?auto_2525210 )
      ( MAKE-2CRATE ?auto_2525214 ?auto_2525208 ?auto_2525209 )
      ( MAKE-1CRATE-VERIFY ?auto_2525208 ?auto_2525209 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2525216 - SURFACE
      ?auto_2525217 - SURFACE
      ?auto_2525218 - SURFACE
    )
    :vars
    (
      ?auto_2525221 - HOIST
      ?auto_2525220 - PLACE
      ?auto_2525222 - TRUCK
      ?auto_2525223 - PLACE
      ?auto_2525219 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525221 ?auto_2525220 ) ( SURFACE-AT ?auto_2525217 ?auto_2525220 ) ( CLEAR ?auto_2525217 ) ( IS-CRATE ?auto_2525218 ) ( not ( = ?auto_2525217 ?auto_2525218 ) ) ( AVAILABLE ?auto_2525221 ) ( ON ?auto_2525217 ?auto_2525216 ) ( not ( = ?auto_2525216 ?auto_2525217 ) ) ( not ( = ?auto_2525216 ?auto_2525218 ) ) ( TRUCK-AT ?auto_2525222 ?auto_2525223 ) ( not ( = ?auto_2525223 ?auto_2525220 ) ) ( HOIST-AT ?auto_2525219 ?auto_2525223 ) ( LIFTING ?auto_2525219 ?auto_2525218 ) ( not ( = ?auto_2525221 ?auto_2525219 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2525217 ?auto_2525218 )
      ( MAKE-2CRATE-VERIFY ?auto_2525216 ?auto_2525217 ?auto_2525218 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2525224 - SURFACE
      ?auto_2525225 - SURFACE
    )
    :vars
    (
      ?auto_2525229 - HOIST
      ?auto_2525228 - PLACE
      ?auto_2525226 - SURFACE
      ?auto_2525231 - TRUCK
      ?auto_2525230 - PLACE
      ?auto_2525227 - HOIST
      ?auto_2525232 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525229 ?auto_2525228 ) ( SURFACE-AT ?auto_2525224 ?auto_2525228 ) ( CLEAR ?auto_2525224 ) ( IS-CRATE ?auto_2525225 ) ( not ( = ?auto_2525224 ?auto_2525225 ) ) ( AVAILABLE ?auto_2525229 ) ( ON ?auto_2525224 ?auto_2525226 ) ( not ( = ?auto_2525226 ?auto_2525224 ) ) ( not ( = ?auto_2525226 ?auto_2525225 ) ) ( TRUCK-AT ?auto_2525231 ?auto_2525230 ) ( not ( = ?auto_2525230 ?auto_2525228 ) ) ( HOIST-AT ?auto_2525227 ?auto_2525230 ) ( not ( = ?auto_2525229 ?auto_2525227 ) ) ( AVAILABLE ?auto_2525227 ) ( SURFACE-AT ?auto_2525225 ?auto_2525230 ) ( ON ?auto_2525225 ?auto_2525232 ) ( CLEAR ?auto_2525225 ) ( not ( = ?auto_2525224 ?auto_2525232 ) ) ( not ( = ?auto_2525225 ?auto_2525232 ) ) ( not ( = ?auto_2525226 ?auto_2525232 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2525227 ?auto_2525225 ?auto_2525232 ?auto_2525230 )
      ( MAKE-2CRATE ?auto_2525226 ?auto_2525224 ?auto_2525225 )
      ( MAKE-1CRATE-VERIFY ?auto_2525224 ?auto_2525225 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2525233 - SURFACE
      ?auto_2525234 - SURFACE
      ?auto_2525235 - SURFACE
    )
    :vars
    (
      ?auto_2525236 - HOIST
      ?auto_2525237 - PLACE
      ?auto_2525240 - TRUCK
      ?auto_2525241 - PLACE
      ?auto_2525239 - HOIST
      ?auto_2525238 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525236 ?auto_2525237 ) ( SURFACE-AT ?auto_2525234 ?auto_2525237 ) ( CLEAR ?auto_2525234 ) ( IS-CRATE ?auto_2525235 ) ( not ( = ?auto_2525234 ?auto_2525235 ) ) ( AVAILABLE ?auto_2525236 ) ( ON ?auto_2525234 ?auto_2525233 ) ( not ( = ?auto_2525233 ?auto_2525234 ) ) ( not ( = ?auto_2525233 ?auto_2525235 ) ) ( TRUCK-AT ?auto_2525240 ?auto_2525241 ) ( not ( = ?auto_2525241 ?auto_2525237 ) ) ( HOIST-AT ?auto_2525239 ?auto_2525241 ) ( not ( = ?auto_2525236 ?auto_2525239 ) ) ( AVAILABLE ?auto_2525239 ) ( SURFACE-AT ?auto_2525235 ?auto_2525241 ) ( ON ?auto_2525235 ?auto_2525238 ) ( CLEAR ?auto_2525235 ) ( not ( = ?auto_2525234 ?auto_2525238 ) ) ( not ( = ?auto_2525235 ?auto_2525238 ) ) ( not ( = ?auto_2525233 ?auto_2525238 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2525234 ?auto_2525235 )
      ( MAKE-2CRATE-VERIFY ?auto_2525233 ?auto_2525234 ?auto_2525235 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2525242 - SURFACE
      ?auto_2525243 - SURFACE
    )
    :vars
    (
      ?auto_2525247 - HOIST
      ?auto_2525246 - PLACE
      ?auto_2525250 - SURFACE
      ?auto_2525244 - PLACE
      ?auto_2525248 - HOIST
      ?auto_2525245 - SURFACE
      ?auto_2525249 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525247 ?auto_2525246 ) ( SURFACE-AT ?auto_2525242 ?auto_2525246 ) ( CLEAR ?auto_2525242 ) ( IS-CRATE ?auto_2525243 ) ( not ( = ?auto_2525242 ?auto_2525243 ) ) ( AVAILABLE ?auto_2525247 ) ( ON ?auto_2525242 ?auto_2525250 ) ( not ( = ?auto_2525250 ?auto_2525242 ) ) ( not ( = ?auto_2525250 ?auto_2525243 ) ) ( not ( = ?auto_2525244 ?auto_2525246 ) ) ( HOIST-AT ?auto_2525248 ?auto_2525244 ) ( not ( = ?auto_2525247 ?auto_2525248 ) ) ( AVAILABLE ?auto_2525248 ) ( SURFACE-AT ?auto_2525243 ?auto_2525244 ) ( ON ?auto_2525243 ?auto_2525245 ) ( CLEAR ?auto_2525243 ) ( not ( = ?auto_2525242 ?auto_2525245 ) ) ( not ( = ?auto_2525243 ?auto_2525245 ) ) ( not ( = ?auto_2525250 ?auto_2525245 ) ) ( TRUCK-AT ?auto_2525249 ?auto_2525246 ) )
    :subtasks
    ( ( !DRIVE ?auto_2525249 ?auto_2525246 ?auto_2525244 )
      ( MAKE-2CRATE ?auto_2525250 ?auto_2525242 ?auto_2525243 )
      ( MAKE-1CRATE-VERIFY ?auto_2525242 ?auto_2525243 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2525251 - SURFACE
      ?auto_2525252 - SURFACE
      ?auto_2525253 - SURFACE
    )
    :vars
    (
      ?auto_2525258 - HOIST
      ?auto_2525259 - PLACE
      ?auto_2525255 - PLACE
      ?auto_2525256 - HOIST
      ?auto_2525257 - SURFACE
      ?auto_2525254 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525258 ?auto_2525259 ) ( SURFACE-AT ?auto_2525252 ?auto_2525259 ) ( CLEAR ?auto_2525252 ) ( IS-CRATE ?auto_2525253 ) ( not ( = ?auto_2525252 ?auto_2525253 ) ) ( AVAILABLE ?auto_2525258 ) ( ON ?auto_2525252 ?auto_2525251 ) ( not ( = ?auto_2525251 ?auto_2525252 ) ) ( not ( = ?auto_2525251 ?auto_2525253 ) ) ( not ( = ?auto_2525255 ?auto_2525259 ) ) ( HOIST-AT ?auto_2525256 ?auto_2525255 ) ( not ( = ?auto_2525258 ?auto_2525256 ) ) ( AVAILABLE ?auto_2525256 ) ( SURFACE-AT ?auto_2525253 ?auto_2525255 ) ( ON ?auto_2525253 ?auto_2525257 ) ( CLEAR ?auto_2525253 ) ( not ( = ?auto_2525252 ?auto_2525257 ) ) ( not ( = ?auto_2525253 ?auto_2525257 ) ) ( not ( = ?auto_2525251 ?auto_2525257 ) ) ( TRUCK-AT ?auto_2525254 ?auto_2525259 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2525252 ?auto_2525253 )
      ( MAKE-2CRATE-VERIFY ?auto_2525251 ?auto_2525252 ?auto_2525253 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2525260 - SURFACE
      ?auto_2525261 - SURFACE
    )
    :vars
    (
      ?auto_2525266 - HOIST
      ?auto_2525268 - PLACE
      ?auto_2525267 - SURFACE
      ?auto_2525264 - PLACE
      ?auto_2525265 - HOIST
      ?auto_2525263 - SURFACE
      ?auto_2525262 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525266 ?auto_2525268 ) ( IS-CRATE ?auto_2525261 ) ( not ( = ?auto_2525260 ?auto_2525261 ) ) ( not ( = ?auto_2525267 ?auto_2525260 ) ) ( not ( = ?auto_2525267 ?auto_2525261 ) ) ( not ( = ?auto_2525264 ?auto_2525268 ) ) ( HOIST-AT ?auto_2525265 ?auto_2525264 ) ( not ( = ?auto_2525266 ?auto_2525265 ) ) ( AVAILABLE ?auto_2525265 ) ( SURFACE-AT ?auto_2525261 ?auto_2525264 ) ( ON ?auto_2525261 ?auto_2525263 ) ( CLEAR ?auto_2525261 ) ( not ( = ?auto_2525260 ?auto_2525263 ) ) ( not ( = ?auto_2525261 ?auto_2525263 ) ) ( not ( = ?auto_2525267 ?auto_2525263 ) ) ( TRUCK-AT ?auto_2525262 ?auto_2525268 ) ( SURFACE-AT ?auto_2525267 ?auto_2525268 ) ( CLEAR ?auto_2525267 ) ( LIFTING ?auto_2525266 ?auto_2525260 ) ( IS-CRATE ?auto_2525260 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2525267 ?auto_2525260 )
      ( MAKE-2CRATE ?auto_2525267 ?auto_2525260 ?auto_2525261 )
      ( MAKE-1CRATE-VERIFY ?auto_2525260 ?auto_2525261 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2525269 - SURFACE
      ?auto_2525270 - SURFACE
      ?auto_2525271 - SURFACE
    )
    :vars
    (
      ?auto_2525277 - HOIST
      ?auto_2525272 - PLACE
      ?auto_2525276 - PLACE
      ?auto_2525274 - HOIST
      ?auto_2525275 - SURFACE
      ?auto_2525273 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525277 ?auto_2525272 ) ( IS-CRATE ?auto_2525271 ) ( not ( = ?auto_2525270 ?auto_2525271 ) ) ( not ( = ?auto_2525269 ?auto_2525270 ) ) ( not ( = ?auto_2525269 ?auto_2525271 ) ) ( not ( = ?auto_2525276 ?auto_2525272 ) ) ( HOIST-AT ?auto_2525274 ?auto_2525276 ) ( not ( = ?auto_2525277 ?auto_2525274 ) ) ( AVAILABLE ?auto_2525274 ) ( SURFACE-AT ?auto_2525271 ?auto_2525276 ) ( ON ?auto_2525271 ?auto_2525275 ) ( CLEAR ?auto_2525271 ) ( not ( = ?auto_2525270 ?auto_2525275 ) ) ( not ( = ?auto_2525271 ?auto_2525275 ) ) ( not ( = ?auto_2525269 ?auto_2525275 ) ) ( TRUCK-AT ?auto_2525273 ?auto_2525272 ) ( SURFACE-AT ?auto_2525269 ?auto_2525272 ) ( CLEAR ?auto_2525269 ) ( LIFTING ?auto_2525277 ?auto_2525270 ) ( IS-CRATE ?auto_2525270 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2525270 ?auto_2525271 )
      ( MAKE-2CRATE-VERIFY ?auto_2525269 ?auto_2525270 ?auto_2525271 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2525278 - SURFACE
      ?auto_2525279 - SURFACE
    )
    :vars
    (
      ?auto_2525280 - HOIST
      ?auto_2525281 - PLACE
      ?auto_2525283 - SURFACE
      ?auto_2525286 - PLACE
      ?auto_2525284 - HOIST
      ?auto_2525285 - SURFACE
      ?auto_2525282 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525280 ?auto_2525281 ) ( IS-CRATE ?auto_2525279 ) ( not ( = ?auto_2525278 ?auto_2525279 ) ) ( not ( = ?auto_2525283 ?auto_2525278 ) ) ( not ( = ?auto_2525283 ?auto_2525279 ) ) ( not ( = ?auto_2525286 ?auto_2525281 ) ) ( HOIST-AT ?auto_2525284 ?auto_2525286 ) ( not ( = ?auto_2525280 ?auto_2525284 ) ) ( AVAILABLE ?auto_2525284 ) ( SURFACE-AT ?auto_2525279 ?auto_2525286 ) ( ON ?auto_2525279 ?auto_2525285 ) ( CLEAR ?auto_2525279 ) ( not ( = ?auto_2525278 ?auto_2525285 ) ) ( not ( = ?auto_2525279 ?auto_2525285 ) ) ( not ( = ?auto_2525283 ?auto_2525285 ) ) ( TRUCK-AT ?auto_2525282 ?auto_2525281 ) ( SURFACE-AT ?auto_2525283 ?auto_2525281 ) ( CLEAR ?auto_2525283 ) ( IS-CRATE ?auto_2525278 ) ( AVAILABLE ?auto_2525280 ) ( IN ?auto_2525278 ?auto_2525282 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2525280 ?auto_2525278 ?auto_2525282 ?auto_2525281 )
      ( MAKE-2CRATE ?auto_2525283 ?auto_2525278 ?auto_2525279 )
      ( MAKE-1CRATE-VERIFY ?auto_2525278 ?auto_2525279 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2525287 - SURFACE
      ?auto_2525288 - SURFACE
      ?auto_2525289 - SURFACE
    )
    :vars
    (
      ?auto_2525292 - HOIST
      ?auto_2525295 - PLACE
      ?auto_2525294 - PLACE
      ?auto_2525290 - HOIST
      ?auto_2525291 - SURFACE
      ?auto_2525293 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525292 ?auto_2525295 ) ( IS-CRATE ?auto_2525289 ) ( not ( = ?auto_2525288 ?auto_2525289 ) ) ( not ( = ?auto_2525287 ?auto_2525288 ) ) ( not ( = ?auto_2525287 ?auto_2525289 ) ) ( not ( = ?auto_2525294 ?auto_2525295 ) ) ( HOIST-AT ?auto_2525290 ?auto_2525294 ) ( not ( = ?auto_2525292 ?auto_2525290 ) ) ( AVAILABLE ?auto_2525290 ) ( SURFACE-AT ?auto_2525289 ?auto_2525294 ) ( ON ?auto_2525289 ?auto_2525291 ) ( CLEAR ?auto_2525289 ) ( not ( = ?auto_2525288 ?auto_2525291 ) ) ( not ( = ?auto_2525289 ?auto_2525291 ) ) ( not ( = ?auto_2525287 ?auto_2525291 ) ) ( TRUCK-AT ?auto_2525293 ?auto_2525295 ) ( SURFACE-AT ?auto_2525287 ?auto_2525295 ) ( CLEAR ?auto_2525287 ) ( IS-CRATE ?auto_2525288 ) ( AVAILABLE ?auto_2525292 ) ( IN ?auto_2525288 ?auto_2525293 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2525288 ?auto_2525289 )
      ( MAKE-2CRATE-VERIFY ?auto_2525287 ?auto_2525288 ?auto_2525289 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2525332 - SURFACE
      ?auto_2525333 - SURFACE
    )
    :vars
    (
      ?auto_2525339 - HOIST
      ?auto_2525337 - PLACE
      ?auto_2525338 - SURFACE
      ?auto_2525334 - PLACE
      ?auto_2525335 - HOIST
      ?auto_2525336 - SURFACE
      ?auto_2525340 - TRUCK
      ?auto_2525341 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525339 ?auto_2525337 ) ( SURFACE-AT ?auto_2525332 ?auto_2525337 ) ( CLEAR ?auto_2525332 ) ( IS-CRATE ?auto_2525333 ) ( not ( = ?auto_2525332 ?auto_2525333 ) ) ( AVAILABLE ?auto_2525339 ) ( ON ?auto_2525332 ?auto_2525338 ) ( not ( = ?auto_2525338 ?auto_2525332 ) ) ( not ( = ?auto_2525338 ?auto_2525333 ) ) ( not ( = ?auto_2525334 ?auto_2525337 ) ) ( HOIST-AT ?auto_2525335 ?auto_2525334 ) ( not ( = ?auto_2525339 ?auto_2525335 ) ) ( AVAILABLE ?auto_2525335 ) ( SURFACE-AT ?auto_2525333 ?auto_2525334 ) ( ON ?auto_2525333 ?auto_2525336 ) ( CLEAR ?auto_2525333 ) ( not ( = ?auto_2525332 ?auto_2525336 ) ) ( not ( = ?auto_2525333 ?auto_2525336 ) ) ( not ( = ?auto_2525338 ?auto_2525336 ) ) ( TRUCK-AT ?auto_2525340 ?auto_2525341 ) ( not ( = ?auto_2525341 ?auto_2525337 ) ) ( not ( = ?auto_2525334 ?auto_2525341 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2525340 ?auto_2525341 ?auto_2525337 )
      ( MAKE-1CRATE ?auto_2525332 ?auto_2525333 )
      ( MAKE-1CRATE-VERIFY ?auto_2525332 ?auto_2525333 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2525372 - SURFACE
      ?auto_2525373 - SURFACE
      ?auto_2525374 - SURFACE
      ?auto_2525371 - SURFACE
    )
    :vars
    (
      ?auto_2525376 - HOIST
      ?auto_2525375 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525376 ?auto_2525375 ) ( SURFACE-AT ?auto_2525374 ?auto_2525375 ) ( CLEAR ?auto_2525374 ) ( LIFTING ?auto_2525376 ?auto_2525371 ) ( IS-CRATE ?auto_2525371 ) ( not ( = ?auto_2525374 ?auto_2525371 ) ) ( ON ?auto_2525373 ?auto_2525372 ) ( ON ?auto_2525374 ?auto_2525373 ) ( not ( = ?auto_2525372 ?auto_2525373 ) ) ( not ( = ?auto_2525372 ?auto_2525374 ) ) ( not ( = ?auto_2525372 ?auto_2525371 ) ) ( not ( = ?auto_2525373 ?auto_2525374 ) ) ( not ( = ?auto_2525373 ?auto_2525371 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2525374 ?auto_2525371 )
      ( MAKE-3CRATE-VERIFY ?auto_2525372 ?auto_2525373 ?auto_2525374 ?auto_2525371 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2525389 - SURFACE
      ?auto_2525390 - SURFACE
      ?auto_2525391 - SURFACE
      ?auto_2525388 - SURFACE
    )
    :vars
    (
      ?auto_2525394 - HOIST
      ?auto_2525392 - PLACE
      ?auto_2525393 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525394 ?auto_2525392 ) ( SURFACE-AT ?auto_2525391 ?auto_2525392 ) ( CLEAR ?auto_2525391 ) ( IS-CRATE ?auto_2525388 ) ( not ( = ?auto_2525391 ?auto_2525388 ) ) ( TRUCK-AT ?auto_2525393 ?auto_2525392 ) ( AVAILABLE ?auto_2525394 ) ( IN ?auto_2525388 ?auto_2525393 ) ( ON ?auto_2525391 ?auto_2525390 ) ( not ( = ?auto_2525390 ?auto_2525391 ) ) ( not ( = ?auto_2525390 ?auto_2525388 ) ) ( ON ?auto_2525390 ?auto_2525389 ) ( not ( = ?auto_2525389 ?auto_2525390 ) ) ( not ( = ?auto_2525389 ?auto_2525391 ) ) ( not ( = ?auto_2525389 ?auto_2525388 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2525390 ?auto_2525391 ?auto_2525388 )
      ( MAKE-3CRATE-VERIFY ?auto_2525389 ?auto_2525390 ?auto_2525391 ?auto_2525388 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2525410 - SURFACE
      ?auto_2525411 - SURFACE
      ?auto_2525412 - SURFACE
      ?auto_2525409 - SURFACE
    )
    :vars
    (
      ?auto_2525415 - HOIST
      ?auto_2525416 - PLACE
      ?auto_2525414 - TRUCK
      ?auto_2525413 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525415 ?auto_2525416 ) ( SURFACE-AT ?auto_2525412 ?auto_2525416 ) ( CLEAR ?auto_2525412 ) ( IS-CRATE ?auto_2525409 ) ( not ( = ?auto_2525412 ?auto_2525409 ) ) ( AVAILABLE ?auto_2525415 ) ( IN ?auto_2525409 ?auto_2525414 ) ( ON ?auto_2525412 ?auto_2525411 ) ( not ( = ?auto_2525411 ?auto_2525412 ) ) ( not ( = ?auto_2525411 ?auto_2525409 ) ) ( TRUCK-AT ?auto_2525414 ?auto_2525413 ) ( not ( = ?auto_2525413 ?auto_2525416 ) ) ( ON ?auto_2525411 ?auto_2525410 ) ( not ( = ?auto_2525410 ?auto_2525411 ) ) ( not ( = ?auto_2525410 ?auto_2525412 ) ) ( not ( = ?auto_2525410 ?auto_2525409 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2525411 ?auto_2525412 ?auto_2525409 )
      ( MAKE-3CRATE-VERIFY ?auto_2525410 ?auto_2525411 ?auto_2525412 ?auto_2525409 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2525434 - SURFACE
      ?auto_2525435 - SURFACE
      ?auto_2525436 - SURFACE
      ?auto_2525433 - SURFACE
    )
    :vars
    (
      ?auto_2525437 - HOIST
      ?auto_2525441 - PLACE
      ?auto_2525440 - TRUCK
      ?auto_2525438 - PLACE
      ?auto_2525439 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525437 ?auto_2525441 ) ( SURFACE-AT ?auto_2525436 ?auto_2525441 ) ( CLEAR ?auto_2525436 ) ( IS-CRATE ?auto_2525433 ) ( not ( = ?auto_2525436 ?auto_2525433 ) ) ( AVAILABLE ?auto_2525437 ) ( ON ?auto_2525436 ?auto_2525435 ) ( not ( = ?auto_2525435 ?auto_2525436 ) ) ( not ( = ?auto_2525435 ?auto_2525433 ) ) ( TRUCK-AT ?auto_2525440 ?auto_2525438 ) ( not ( = ?auto_2525438 ?auto_2525441 ) ) ( HOIST-AT ?auto_2525439 ?auto_2525438 ) ( LIFTING ?auto_2525439 ?auto_2525433 ) ( not ( = ?auto_2525437 ?auto_2525439 ) ) ( ON ?auto_2525435 ?auto_2525434 ) ( not ( = ?auto_2525434 ?auto_2525435 ) ) ( not ( = ?auto_2525434 ?auto_2525436 ) ) ( not ( = ?auto_2525434 ?auto_2525433 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2525435 ?auto_2525436 ?auto_2525433 )
      ( MAKE-3CRATE-VERIFY ?auto_2525434 ?auto_2525435 ?auto_2525436 ?auto_2525433 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2525461 - SURFACE
      ?auto_2525462 - SURFACE
      ?auto_2525463 - SURFACE
      ?auto_2525460 - SURFACE
    )
    :vars
    (
      ?auto_2525468 - HOIST
      ?auto_2525467 - PLACE
      ?auto_2525466 - TRUCK
      ?auto_2525465 - PLACE
      ?auto_2525464 - HOIST
      ?auto_2525469 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525468 ?auto_2525467 ) ( SURFACE-AT ?auto_2525463 ?auto_2525467 ) ( CLEAR ?auto_2525463 ) ( IS-CRATE ?auto_2525460 ) ( not ( = ?auto_2525463 ?auto_2525460 ) ) ( AVAILABLE ?auto_2525468 ) ( ON ?auto_2525463 ?auto_2525462 ) ( not ( = ?auto_2525462 ?auto_2525463 ) ) ( not ( = ?auto_2525462 ?auto_2525460 ) ) ( TRUCK-AT ?auto_2525466 ?auto_2525465 ) ( not ( = ?auto_2525465 ?auto_2525467 ) ) ( HOIST-AT ?auto_2525464 ?auto_2525465 ) ( not ( = ?auto_2525468 ?auto_2525464 ) ) ( AVAILABLE ?auto_2525464 ) ( SURFACE-AT ?auto_2525460 ?auto_2525465 ) ( ON ?auto_2525460 ?auto_2525469 ) ( CLEAR ?auto_2525460 ) ( not ( = ?auto_2525463 ?auto_2525469 ) ) ( not ( = ?auto_2525460 ?auto_2525469 ) ) ( not ( = ?auto_2525462 ?auto_2525469 ) ) ( ON ?auto_2525462 ?auto_2525461 ) ( not ( = ?auto_2525461 ?auto_2525462 ) ) ( not ( = ?auto_2525461 ?auto_2525463 ) ) ( not ( = ?auto_2525461 ?auto_2525460 ) ) ( not ( = ?auto_2525461 ?auto_2525469 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2525462 ?auto_2525463 ?auto_2525460 )
      ( MAKE-3CRATE-VERIFY ?auto_2525461 ?auto_2525462 ?auto_2525463 ?auto_2525460 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2525489 - SURFACE
      ?auto_2525490 - SURFACE
      ?auto_2525491 - SURFACE
      ?auto_2525488 - SURFACE
    )
    :vars
    (
      ?auto_2525492 - HOIST
      ?auto_2525497 - PLACE
      ?auto_2525496 - PLACE
      ?auto_2525493 - HOIST
      ?auto_2525495 - SURFACE
      ?auto_2525494 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525492 ?auto_2525497 ) ( SURFACE-AT ?auto_2525491 ?auto_2525497 ) ( CLEAR ?auto_2525491 ) ( IS-CRATE ?auto_2525488 ) ( not ( = ?auto_2525491 ?auto_2525488 ) ) ( AVAILABLE ?auto_2525492 ) ( ON ?auto_2525491 ?auto_2525490 ) ( not ( = ?auto_2525490 ?auto_2525491 ) ) ( not ( = ?auto_2525490 ?auto_2525488 ) ) ( not ( = ?auto_2525496 ?auto_2525497 ) ) ( HOIST-AT ?auto_2525493 ?auto_2525496 ) ( not ( = ?auto_2525492 ?auto_2525493 ) ) ( AVAILABLE ?auto_2525493 ) ( SURFACE-AT ?auto_2525488 ?auto_2525496 ) ( ON ?auto_2525488 ?auto_2525495 ) ( CLEAR ?auto_2525488 ) ( not ( = ?auto_2525491 ?auto_2525495 ) ) ( not ( = ?auto_2525488 ?auto_2525495 ) ) ( not ( = ?auto_2525490 ?auto_2525495 ) ) ( TRUCK-AT ?auto_2525494 ?auto_2525497 ) ( ON ?auto_2525490 ?auto_2525489 ) ( not ( = ?auto_2525489 ?auto_2525490 ) ) ( not ( = ?auto_2525489 ?auto_2525491 ) ) ( not ( = ?auto_2525489 ?auto_2525488 ) ) ( not ( = ?auto_2525489 ?auto_2525495 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2525490 ?auto_2525491 ?auto_2525488 )
      ( MAKE-3CRATE-VERIFY ?auto_2525489 ?auto_2525490 ?auto_2525491 ?auto_2525488 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2525517 - SURFACE
      ?auto_2525518 - SURFACE
      ?auto_2525519 - SURFACE
      ?auto_2525516 - SURFACE
    )
    :vars
    (
      ?auto_2525523 - HOIST
      ?auto_2525520 - PLACE
      ?auto_2525522 - PLACE
      ?auto_2525524 - HOIST
      ?auto_2525521 - SURFACE
      ?auto_2525525 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525523 ?auto_2525520 ) ( IS-CRATE ?auto_2525516 ) ( not ( = ?auto_2525519 ?auto_2525516 ) ) ( not ( = ?auto_2525518 ?auto_2525519 ) ) ( not ( = ?auto_2525518 ?auto_2525516 ) ) ( not ( = ?auto_2525522 ?auto_2525520 ) ) ( HOIST-AT ?auto_2525524 ?auto_2525522 ) ( not ( = ?auto_2525523 ?auto_2525524 ) ) ( AVAILABLE ?auto_2525524 ) ( SURFACE-AT ?auto_2525516 ?auto_2525522 ) ( ON ?auto_2525516 ?auto_2525521 ) ( CLEAR ?auto_2525516 ) ( not ( = ?auto_2525519 ?auto_2525521 ) ) ( not ( = ?auto_2525516 ?auto_2525521 ) ) ( not ( = ?auto_2525518 ?auto_2525521 ) ) ( TRUCK-AT ?auto_2525525 ?auto_2525520 ) ( SURFACE-AT ?auto_2525518 ?auto_2525520 ) ( CLEAR ?auto_2525518 ) ( LIFTING ?auto_2525523 ?auto_2525519 ) ( IS-CRATE ?auto_2525519 ) ( ON ?auto_2525518 ?auto_2525517 ) ( not ( = ?auto_2525517 ?auto_2525518 ) ) ( not ( = ?auto_2525517 ?auto_2525519 ) ) ( not ( = ?auto_2525517 ?auto_2525516 ) ) ( not ( = ?auto_2525517 ?auto_2525521 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2525518 ?auto_2525519 ?auto_2525516 )
      ( MAKE-3CRATE-VERIFY ?auto_2525517 ?auto_2525518 ?auto_2525519 ?auto_2525516 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2525545 - SURFACE
      ?auto_2525546 - SURFACE
      ?auto_2525547 - SURFACE
      ?auto_2525544 - SURFACE
    )
    :vars
    (
      ?auto_2525551 - HOIST
      ?auto_2525553 - PLACE
      ?auto_2525548 - PLACE
      ?auto_2525552 - HOIST
      ?auto_2525549 - SURFACE
      ?auto_2525550 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525551 ?auto_2525553 ) ( IS-CRATE ?auto_2525544 ) ( not ( = ?auto_2525547 ?auto_2525544 ) ) ( not ( = ?auto_2525546 ?auto_2525547 ) ) ( not ( = ?auto_2525546 ?auto_2525544 ) ) ( not ( = ?auto_2525548 ?auto_2525553 ) ) ( HOIST-AT ?auto_2525552 ?auto_2525548 ) ( not ( = ?auto_2525551 ?auto_2525552 ) ) ( AVAILABLE ?auto_2525552 ) ( SURFACE-AT ?auto_2525544 ?auto_2525548 ) ( ON ?auto_2525544 ?auto_2525549 ) ( CLEAR ?auto_2525544 ) ( not ( = ?auto_2525547 ?auto_2525549 ) ) ( not ( = ?auto_2525544 ?auto_2525549 ) ) ( not ( = ?auto_2525546 ?auto_2525549 ) ) ( TRUCK-AT ?auto_2525550 ?auto_2525553 ) ( SURFACE-AT ?auto_2525546 ?auto_2525553 ) ( CLEAR ?auto_2525546 ) ( IS-CRATE ?auto_2525547 ) ( AVAILABLE ?auto_2525551 ) ( IN ?auto_2525547 ?auto_2525550 ) ( ON ?auto_2525546 ?auto_2525545 ) ( not ( = ?auto_2525545 ?auto_2525546 ) ) ( not ( = ?auto_2525545 ?auto_2525547 ) ) ( not ( = ?auto_2525545 ?auto_2525544 ) ) ( not ( = ?auto_2525545 ?auto_2525549 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2525546 ?auto_2525547 ?auto_2525544 )
      ( MAKE-3CRATE-VERIFY ?auto_2525545 ?auto_2525546 ?auto_2525547 ?auto_2525544 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2525836 - SURFACE
      ?auto_2525837 - SURFACE
      ?auto_2525838 - SURFACE
      ?auto_2525835 - SURFACE
      ?auto_2525839 - SURFACE
    )
    :vars
    (
      ?auto_2525841 - HOIST
      ?auto_2525840 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525841 ?auto_2525840 ) ( SURFACE-AT ?auto_2525835 ?auto_2525840 ) ( CLEAR ?auto_2525835 ) ( LIFTING ?auto_2525841 ?auto_2525839 ) ( IS-CRATE ?auto_2525839 ) ( not ( = ?auto_2525835 ?auto_2525839 ) ) ( ON ?auto_2525837 ?auto_2525836 ) ( ON ?auto_2525838 ?auto_2525837 ) ( ON ?auto_2525835 ?auto_2525838 ) ( not ( = ?auto_2525836 ?auto_2525837 ) ) ( not ( = ?auto_2525836 ?auto_2525838 ) ) ( not ( = ?auto_2525836 ?auto_2525835 ) ) ( not ( = ?auto_2525836 ?auto_2525839 ) ) ( not ( = ?auto_2525837 ?auto_2525838 ) ) ( not ( = ?auto_2525837 ?auto_2525835 ) ) ( not ( = ?auto_2525837 ?auto_2525839 ) ) ( not ( = ?auto_2525838 ?auto_2525835 ) ) ( not ( = ?auto_2525838 ?auto_2525839 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2525835 ?auto_2525839 )
      ( MAKE-4CRATE-VERIFY ?auto_2525836 ?auto_2525837 ?auto_2525838 ?auto_2525835 ?auto_2525839 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2525861 - SURFACE
      ?auto_2525862 - SURFACE
      ?auto_2525863 - SURFACE
      ?auto_2525860 - SURFACE
      ?auto_2525864 - SURFACE
    )
    :vars
    (
      ?auto_2525865 - HOIST
      ?auto_2525866 - PLACE
      ?auto_2525867 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525865 ?auto_2525866 ) ( SURFACE-AT ?auto_2525860 ?auto_2525866 ) ( CLEAR ?auto_2525860 ) ( IS-CRATE ?auto_2525864 ) ( not ( = ?auto_2525860 ?auto_2525864 ) ) ( TRUCK-AT ?auto_2525867 ?auto_2525866 ) ( AVAILABLE ?auto_2525865 ) ( IN ?auto_2525864 ?auto_2525867 ) ( ON ?auto_2525860 ?auto_2525863 ) ( not ( = ?auto_2525863 ?auto_2525860 ) ) ( not ( = ?auto_2525863 ?auto_2525864 ) ) ( ON ?auto_2525862 ?auto_2525861 ) ( ON ?auto_2525863 ?auto_2525862 ) ( not ( = ?auto_2525861 ?auto_2525862 ) ) ( not ( = ?auto_2525861 ?auto_2525863 ) ) ( not ( = ?auto_2525861 ?auto_2525860 ) ) ( not ( = ?auto_2525861 ?auto_2525864 ) ) ( not ( = ?auto_2525862 ?auto_2525863 ) ) ( not ( = ?auto_2525862 ?auto_2525860 ) ) ( not ( = ?auto_2525862 ?auto_2525864 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2525863 ?auto_2525860 ?auto_2525864 )
      ( MAKE-4CRATE-VERIFY ?auto_2525861 ?auto_2525862 ?auto_2525863 ?auto_2525860 ?auto_2525864 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2525891 - SURFACE
      ?auto_2525892 - SURFACE
      ?auto_2525893 - SURFACE
      ?auto_2525890 - SURFACE
      ?auto_2525894 - SURFACE
    )
    :vars
    (
      ?auto_2525898 - HOIST
      ?auto_2525897 - PLACE
      ?auto_2525896 - TRUCK
      ?auto_2525895 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525898 ?auto_2525897 ) ( SURFACE-AT ?auto_2525890 ?auto_2525897 ) ( CLEAR ?auto_2525890 ) ( IS-CRATE ?auto_2525894 ) ( not ( = ?auto_2525890 ?auto_2525894 ) ) ( AVAILABLE ?auto_2525898 ) ( IN ?auto_2525894 ?auto_2525896 ) ( ON ?auto_2525890 ?auto_2525893 ) ( not ( = ?auto_2525893 ?auto_2525890 ) ) ( not ( = ?auto_2525893 ?auto_2525894 ) ) ( TRUCK-AT ?auto_2525896 ?auto_2525895 ) ( not ( = ?auto_2525895 ?auto_2525897 ) ) ( ON ?auto_2525892 ?auto_2525891 ) ( ON ?auto_2525893 ?auto_2525892 ) ( not ( = ?auto_2525891 ?auto_2525892 ) ) ( not ( = ?auto_2525891 ?auto_2525893 ) ) ( not ( = ?auto_2525891 ?auto_2525890 ) ) ( not ( = ?auto_2525891 ?auto_2525894 ) ) ( not ( = ?auto_2525892 ?auto_2525893 ) ) ( not ( = ?auto_2525892 ?auto_2525890 ) ) ( not ( = ?auto_2525892 ?auto_2525894 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2525893 ?auto_2525890 ?auto_2525894 )
      ( MAKE-4CRATE-VERIFY ?auto_2525891 ?auto_2525892 ?auto_2525893 ?auto_2525890 ?auto_2525894 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2525925 - SURFACE
      ?auto_2525926 - SURFACE
      ?auto_2525927 - SURFACE
      ?auto_2525924 - SURFACE
      ?auto_2525928 - SURFACE
    )
    :vars
    (
      ?auto_2525930 - HOIST
      ?auto_2525931 - PLACE
      ?auto_2525933 - TRUCK
      ?auto_2525932 - PLACE
      ?auto_2525929 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525930 ?auto_2525931 ) ( SURFACE-AT ?auto_2525924 ?auto_2525931 ) ( CLEAR ?auto_2525924 ) ( IS-CRATE ?auto_2525928 ) ( not ( = ?auto_2525924 ?auto_2525928 ) ) ( AVAILABLE ?auto_2525930 ) ( ON ?auto_2525924 ?auto_2525927 ) ( not ( = ?auto_2525927 ?auto_2525924 ) ) ( not ( = ?auto_2525927 ?auto_2525928 ) ) ( TRUCK-AT ?auto_2525933 ?auto_2525932 ) ( not ( = ?auto_2525932 ?auto_2525931 ) ) ( HOIST-AT ?auto_2525929 ?auto_2525932 ) ( LIFTING ?auto_2525929 ?auto_2525928 ) ( not ( = ?auto_2525930 ?auto_2525929 ) ) ( ON ?auto_2525926 ?auto_2525925 ) ( ON ?auto_2525927 ?auto_2525926 ) ( not ( = ?auto_2525925 ?auto_2525926 ) ) ( not ( = ?auto_2525925 ?auto_2525927 ) ) ( not ( = ?auto_2525925 ?auto_2525924 ) ) ( not ( = ?auto_2525925 ?auto_2525928 ) ) ( not ( = ?auto_2525926 ?auto_2525927 ) ) ( not ( = ?auto_2525926 ?auto_2525924 ) ) ( not ( = ?auto_2525926 ?auto_2525928 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2525927 ?auto_2525924 ?auto_2525928 )
      ( MAKE-4CRATE-VERIFY ?auto_2525925 ?auto_2525926 ?auto_2525927 ?auto_2525924 ?auto_2525928 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2525963 - SURFACE
      ?auto_2525964 - SURFACE
      ?auto_2525965 - SURFACE
      ?auto_2525962 - SURFACE
      ?auto_2525966 - SURFACE
    )
    :vars
    (
      ?auto_2525971 - HOIST
      ?auto_2525969 - PLACE
      ?auto_2525967 - TRUCK
      ?auto_2525968 - PLACE
      ?auto_2525972 - HOIST
      ?auto_2525970 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525971 ?auto_2525969 ) ( SURFACE-AT ?auto_2525962 ?auto_2525969 ) ( CLEAR ?auto_2525962 ) ( IS-CRATE ?auto_2525966 ) ( not ( = ?auto_2525962 ?auto_2525966 ) ) ( AVAILABLE ?auto_2525971 ) ( ON ?auto_2525962 ?auto_2525965 ) ( not ( = ?auto_2525965 ?auto_2525962 ) ) ( not ( = ?auto_2525965 ?auto_2525966 ) ) ( TRUCK-AT ?auto_2525967 ?auto_2525968 ) ( not ( = ?auto_2525968 ?auto_2525969 ) ) ( HOIST-AT ?auto_2525972 ?auto_2525968 ) ( not ( = ?auto_2525971 ?auto_2525972 ) ) ( AVAILABLE ?auto_2525972 ) ( SURFACE-AT ?auto_2525966 ?auto_2525968 ) ( ON ?auto_2525966 ?auto_2525970 ) ( CLEAR ?auto_2525966 ) ( not ( = ?auto_2525962 ?auto_2525970 ) ) ( not ( = ?auto_2525966 ?auto_2525970 ) ) ( not ( = ?auto_2525965 ?auto_2525970 ) ) ( ON ?auto_2525964 ?auto_2525963 ) ( ON ?auto_2525965 ?auto_2525964 ) ( not ( = ?auto_2525963 ?auto_2525964 ) ) ( not ( = ?auto_2525963 ?auto_2525965 ) ) ( not ( = ?auto_2525963 ?auto_2525962 ) ) ( not ( = ?auto_2525963 ?auto_2525966 ) ) ( not ( = ?auto_2525963 ?auto_2525970 ) ) ( not ( = ?auto_2525964 ?auto_2525965 ) ) ( not ( = ?auto_2525964 ?auto_2525962 ) ) ( not ( = ?auto_2525964 ?auto_2525966 ) ) ( not ( = ?auto_2525964 ?auto_2525970 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2525965 ?auto_2525962 ?auto_2525966 )
      ( MAKE-4CRATE-VERIFY ?auto_2525963 ?auto_2525964 ?auto_2525965 ?auto_2525962 ?auto_2525966 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2526002 - SURFACE
      ?auto_2526003 - SURFACE
      ?auto_2526004 - SURFACE
      ?auto_2526001 - SURFACE
      ?auto_2526005 - SURFACE
    )
    :vars
    (
      ?auto_2526006 - HOIST
      ?auto_2526007 - PLACE
      ?auto_2526011 - PLACE
      ?auto_2526009 - HOIST
      ?auto_2526008 - SURFACE
      ?auto_2526010 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2526006 ?auto_2526007 ) ( SURFACE-AT ?auto_2526001 ?auto_2526007 ) ( CLEAR ?auto_2526001 ) ( IS-CRATE ?auto_2526005 ) ( not ( = ?auto_2526001 ?auto_2526005 ) ) ( AVAILABLE ?auto_2526006 ) ( ON ?auto_2526001 ?auto_2526004 ) ( not ( = ?auto_2526004 ?auto_2526001 ) ) ( not ( = ?auto_2526004 ?auto_2526005 ) ) ( not ( = ?auto_2526011 ?auto_2526007 ) ) ( HOIST-AT ?auto_2526009 ?auto_2526011 ) ( not ( = ?auto_2526006 ?auto_2526009 ) ) ( AVAILABLE ?auto_2526009 ) ( SURFACE-AT ?auto_2526005 ?auto_2526011 ) ( ON ?auto_2526005 ?auto_2526008 ) ( CLEAR ?auto_2526005 ) ( not ( = ?auto_2526001 ?auto_2526008 ) ) ( not ( = ?auto_2526005 ?auto_2526008 ) ) ( not ( = ?auto_2526004 ?auto_2526008 ) ) ( TRUCK-AT ?auto_2526010 ?auto_2526007 ) ( ON ?auto_2526003 ?auto_2526002 ) ( ON ?auto_2526004 ?auto_2526003 ) ( not ( = ?auto_2526002 ?auto_2526003 ) ) ( not ( = ?auto_2526002 ?auto_2526004 ) ) ( not ( = ?auto_2526002 ?auto_2526001 ) ) ( not ( = ?auto_2526002 ?auto_2526005 ) ) ( not ( = ?auto_2526002 ?auto_2526008 ) ) ( not ( = ?auto_2526003 ?auto_2526004 ) ) ( not ( = ?auto_2526003 ?auto_2526001 ) ) ( not ( = ?auto_2526003 ?auto_2526005 ) ) ( not ( = ?auto_2526003 ?auto_2526008 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2526004 ?auto_2526001 ?auto_2526005 )
      ( MAKE-4CRATE-VERIFY ?auto_2526002 ?auto_2526003 ?auto_2526004 ?auto_2526001 ?auto_2526005 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2526041 - SURFACE
      ?auto_2526042 - SURFACE
      ?auto_2526043 - SURFACE
      ?auto_2526040 - SURFACE
      ?auto_2526044 - SURFACE
    )
    :vars
    (
      ?auto_2526046 - HOIST
      ?auto_2526050 - PLACE
      ?auto_2526047 - PLACE
      ?auto_2526048 - HOIST
      ?auto_2526045 - SURFACE
      ?auto_2526049 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2526046 ?auto_2526050 ) ( IS-CRATE ?auto_2526044 ) ( not ( = ?auto_2526040 ?auto_2526044 ) ) ( not ( = ?auto_2526043 ?auto_2526040 ) ) ( not ( = ?auto_2526043 ?auto_2526044 ) ) ( not ( = ?auto_2526047 ?auto_2526050 ) ) ( HOIST-AT ?auto_2526048 ?auto_2526047 ) ( not ( = ?auto_2526046 ?auto_2526048 ) ) ( AVAILABLE ?auto_2526048 ) ( SURFACE-AT ?auto_2526044 ?auto_2526047 ) ( ON ?auto_2526044 ?auto_2526045 ) ( CLEAR ?auto_2526044 ) ( not ( = ?auto_2526040 ?auto_2526045 ) ) ( not ( = ?auto_2526044 ?auto_2526045 ) ) ( not ( = ?auto_2526043 ?auto_2526045 ) ) ( TRUCK-AT ?auto_2526049 ?auto_2526050 ) ( SURFACE-AT ?auto_2526043 ?auto_2526050 ) ( CLEAR ?auto_2526043 ) ( LIFTING ?auto_2526046 ?auto_2526040 ) ( IS-CRATE ?auto_2526040 ) ( ON ?auto_2526042 ?auto_2526041 ) ( ON ?auto_2526043 ?auto_2526042 ) ( not ( = ?auto_2526041 ?auto_2526042 ) ) ( not ( = ?auto_2526041 ?auto_2526043 ) ) ( not ( = ?auto_2526041 ?auto_2526040 ) ) ( not ( = ?auto_2526041 ?auto_2526044 ) ) ( not ( = ?auto_2526041 ?auto_2526045 ) ) ( not ( = ?auto_2526042 ?auto_2526043 ) ) ( not ( = ?auto_2526042 ?auto_2526040 ) ) ( not ( = ?auto_2526042 ?auto_2526044 ) ) ( not ( = ?auto_2526042 ?auto_2526045 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2526043 ?auto_2526040 ?auto_2526044 )
      ( MAKE-4CRATE-VERIFY ?auto_2526041 ?auto_2526042 ?auto_2526043 ?auto_2526040 ?auto_2526044 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2526080 - SURFACE
      ?auto_2526081 - SURFACE
      ?auto_2526082 - SURFACE
      ?auto_2526079 - SURFACE
      ?auto_2526083 - SURFACE
    )
    :vars
    (
      ?auto_2526087 - HOIST
      ?auto_2526085 - PLACE
      ?auto_2526089 - PLACE
      ?auto_2526086 - HOIST
      ?auto_2526084 - SURFACE
      ?auto_2526088 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2526087 ?auto_2526085 ) ( IS-CRATE ?auto_2526083 ) ( not ( = ?auto_2526079 ?auto_2526083 ) ) ( not ( = ?auto_2526082 ?auto_2526079 ) ) ( not ( = ?auto_2526082 ?auto_2526083 ) ) ( not ( = ?auto_2526089 ?auto_2526085 ) ) ( HOIST-AT ?auto_2526086 ?auto_2526089 ) ( not ( = ?auto_2526087 ?auto_2526086 ) ) ( AVAILABLE ?auto_2526086 ) ( SURFACE-AT ?auto_2526083 ?auto_2526089 ) ( ON ?auto_2526083 ?auto_2526084 ) ( CLEAR ?auto_2526083 ) ( not ( = ?auto_2526079 ?auto_2526084 ) ) ( not ( = ?auto_2526083 ?auto_2526084 ) ) ( not ( = ?auto_2526082 ?auto_2526084 ) ) ( TRUCK-AT ?auto_2526088 ?auto_2526085 ) ( SURFACE-AT ?auto_2526082 ?auto_2526085 ) ( CLEAR ?auto_2526082 ) ( IS-CRATE ?auto_2526079 ) ( AVAILABLE ?auto_2526087 ) ( IN ?auto_2526079 ?auto_2526088 ) ( ON ?auto_2526081 ?auto_2526080 ) ( ON ?auto_2526082 ?auto_2526081 ) ( not ( = ?auto_2526080 ?auto_2526081 ) ) ( not ( = ?auto_2526080 ?auto_2526082 ) ) ( not ( = ?auto_2526080 ?auto_2526079 ) ) ( not ( = ?auto_2526080 ?auto_2526083 ) ) ( not ( = ?auto_2526080 ?auto_2526084 ) ) ( not ( = ?auto_2526081 ?auto_2526082 ) ) ( not ( = ?auto_2526081 ?auto_2526079 ) ) ( not ( = ?auto_2526081 ?auto_2526083 ) ) ( not ( = ?auto_2526081 ?auto_2526084 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2526082 ?auto_2526079 ?auto_2526083 )
      ( MAKE-4CRATE-VERIFY ?auto_2526080 ?auto_2526081 ?auto_2526082 ?auto_2526079 ?auto_2526083 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2526740 - SURFACE
      ?auto_2526741 - SURFACE
      ?auto_2526742 - SURFACE
      ?auto_2526739 - SURFACE
      ?auto_2526743 - SURFACE
      ?auto_2526744 - SURFACE
    )
    :vars
    (
      ?auto_2526745 - HOIST
      ?auto_2526746 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2526745 ?auto_2526746 ) ( SURFACE-AT ?auto_2526743 ?auto_2526746 ) ( CLEAR ?auto_2526743 ) ( LIFTING ?auto_2526745 ?auto_2526744 ) ( IS-CRATE ?auto_2526744 ) ( not ( = ?auto_2526743 ?auto_2526744 ) ) ( ON ?auto_2526741 ?auto_2526740 ) ( ON ?auto_2526742 ?auto_2526741 ) ( ON ?auto_2526739 ?auto_2526742 ) ( ON ?auto_2526743 ?auto_2526739 ) ( not ( = ?auto_2526740 ?auto_2526741 ) ) ( not ( = ?auto_2526740 ?auto_2526742 ) ) ( not ( = ?auto_2526740 ?auto_2526739 ) ) ( not ( = ?auto_2526740 ?auto_2526743 ) ) ( not ( = ?auto_2526740 ?auto_2526744 ) ) ( not ( = ?auto_2526741 ?auto_2526742 ) ) ( not ( = ?auto_2526741 ?auto_2526739 ) ) ( not ( = ?auto_2526741 ?auto_2526743 ) ) ( not ( = ?auto_2526741 ?auto_2526744 ) ) ( not ( = ?auto_2526742 ?auto_2526739 ) ) ( not ( = ?auto_2526742 ?auto_2526743 ) ) ( not ( = ?auto_2526742 ?auto_2526744 ) ) ( not ( = ?auto_2526739 ?auto_2526743 ) ) ( not ( = ?auto_2526739 ?auto_2526744 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2526743 ?auto_2526744 )
      ( MAKE-5CRATE-VERIFY ?auto_2526740 ?auto_2526741 ?auto_2526742 ?auto_2526739 ?auto_2526743 ?auto_2526744 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2526774 - SURFACE
      ?auto_2526775 - SURFACE
      ?auto_2526776 - SURFACE
      ?auto_2526773 - SURFACE
      ?auto_2526777 - SURFACE
      ?auto_2526778 - SURFACE
    )
    :vars
    (
      ?auto_2526781 - HOIST
      ?auto_2526779 - PLACE
      ?auto_2526780 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2526781 ?auto_2526779 ) ( SURFACE-AT ?auto_2526777 ?auto_2526779 ) ( CLEAR ?auto_2526777 ) ( IS-CRATE ?auto_2526778 ) ( not ( = ?auto_2526777 ?auto_2526778 ) ) ( TRUCK-AT ?auto_2526780 ?auto_2526779 ) ( AVAILABLE ?auto_2526781 ) ( IN ?auto_2526778 ?auto_2526780 ) ( ON ?auto_2526777 ?auto_2526773 ) ( not ( = ?auto_2526773 ?auto_2526777 ) ) ( not ( = ?auto_2526773 ?auto_2526778 ) ) ( ON ?auto_2526775 ?auto_2526774 ) ( ON ?auto_2526776 ?auto_2526775 ) ( ON ?auto_2526773 ?auto_2526776 ) ( not ( = ?auto_2526774 ?auto_2526775 ) ) ( not ( = ?auto_2526774 ?auto_2526776 ) ) ( not ( = ?auto_2526774 ?auto_2526773 ) ) ( not ( = ?auto_2526774 ?auto_2526777 ) ) ( not ( = ?auto_2526774 ?auto_2526778 ) ) ( not ( = ?auto_2526775 ?auto_2526776 ) ) ( not ( = ?auto_2526775 ?auto_2526773 ) ) ( not ( = ?auto_2526775 ?auto_2526777 ) ) ( not ( = ?auto_2526775 ?auto_2526778 ) ) ( not ( = ?auto_2526776 ?auto_2526773 ) ) ( not ( = ?auto_2526776 ?auto_2526777 ) ) ( not ( = ?auto_2526776 ?auto_2526778 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2526773 ?auto_2526777 ?auto_2526778 )
      ( MAKE-5CRATE-VERIFY ?auto_2526774 ?auto_2526775 ?auto_2526776 ?auto_2526773 ?auto_2526777 ?auto_2526778 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2526814 - SURFACE
      ?auto_2526815 - SURFACE
      ?auto_2526816 - SURFACE
      ?auto_2526813 - SURFACE
      ?auto_2526817 - SURFACE
      ?auto_2526818 - SURFACE
    )
    :vars
    (
      ?auto_2526822 - HOIST
      ?auto_2526819 - PLACE
      ?auto_2526821 - TRUCK
      ?auto_2526820 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2526822 ?auto_2526819 ) ( SURFACE-AT ?auto_2526817 ?auto_2526819 ) ( CLEAR ?auto_2526817 ) ( IS-CRATE ?auto_2526818 ) ( not ( = ?auto_2526817 ?auto_2526818 ) ) ( AVAILABLE ?auto_2526822 ) ( IN ?auto_2526818 ?auto_2526821 ) ( ON ?auto_2526817 ?auto_2526813 ) ( not ( = ?auto_2526813 ?auto_2526817 ) ) ( not ( = ?auto_2526813 ?auto_2526818 ) ) ( TRUCK-AT ?auto_2526821 ?auto_2526820 ) ( not ( = ?auto_2526820 ?auto_2526819 ) ) ( ON ?auto_2526815 ?auto_2526814 ) ( ON ?auto_2526816 ?auto_2526815 ) ( ON ?auto_2526813 ?auto_2526816 ) ( not ( = ?auto_2526814 ?auto_2526815 ) ) ( not ( = ?auto_2526814 ?auto_2526816 ) ) ( not ( = ?auto_2526814 ?auto_2526813 ) ) ( not ( = ?auto_2526814 ?auto_2526817 ) ) ( not ( = ?auto_2526814 ?auto_2526818 ) ) ( not ( = ?auto_2526815 ?auto_2526816 ) ) ( not ( = ?auto_2526815 ?auto_2526813 ) ) ( not ( = ?auto_2526815 ?auto_2526817 ) ) ( not ( = ?auto_2526815 ?auto_2526818 ) ) ( not ( = ?auto_2526816 ?auto_2526813 ) ) ( not ( = ?auto_2526816 ?auto_2526817 ) ) ( not ( = ?auto_2526816 ?auto_2526818 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2526813 ?auto_2526817 ?auto_2526818 )
      ( MAKE-5CRATE-VERIFY ?auto_2526814 ?auto_2526815 ?auto_2526816 ?auto_2526813 ?auto_2526817 ?auto_2526818 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2526859 - SURFACE
      ?auto_2526860 - SURFACE
      ?auto_2526861 - SURFACE
      ?auto_2526858 - SURFACE
      ?auto_2526862 - SURFACE
      ?auto_2526863 - SURFACE
    )
    :vars
    (
      ?auto_2526864 - HOIST
      ?auto_2526866 - PLACE
      ?auto_2526868 - TRUCK
      ?auto_2526867 - PLACE
      ?auto_2526865 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2526864 ?auto_2526866 ) ( SURFACE-AT ?auto_2526862 ?auto_2526866 ) ( CLEAR ?auto_2526862 ) ( IS-CRATE ?auto_2526863 ) ( not ( = ?auto_2526862 ?auto_2526863 ) ) ( AVAILABLE ?auto_2526864 ) ( ON ?auto_2526862 ?auto_2526858 ) ( not ( = ?auto_2526858 ?auto_2526862 ) ) ( not ( = ?auto_2526858 ?auto_2526863 ) ) ( TRUCK-AT ?auto_2526868 ?auto_2526867 ) ( not ( = ?auto_2526867 ?auto_2526866 ) ) ( HOIST-AT ?auto_2526865 ?auto_2526867 ) ( LIFTING ?auto_2526865 ?auto_2526863 ) ( not ( = ?auto_2526864 ?auto_2526865 ) ) ( ON ?auto_2526860 ?auto_2526859 ) ( ON ?auto_2526861 ?auto_2526860 ) ( ON ?auto_2526858 ?auto_2526861 ) ( not ( = ?auto_2526859 ?auto_2526860 ) ) ( not ( = ?auto_2526859 ?auto_2526861 ) ) ( not ( = ?auto_2526859 ?auto_2526858 ) ) ( not ( = ?auto_2526859 ?auto_2526862 ) ) ( not ( = ?auto_2526859 ?auto_2526863 ) ) ( not ( = ?auto_2526860 ?auto_2526861 ) ) ( not ( = ?auto_2526860 ?auto_2526858 ) ) ( not ( = ?auto_2526860 ?auto_2526862 ) ) ( not ( = ?auto_2526860 ?auto_2526863 ) ) ( not ( = ?auto_2526861 ?auto_2526858 ) ) ( not ( = ?auto_2526861 ?auto_2526862 ) ) ( not ( = ?auto_2526861 ?auto_2526863 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2526858 ?auto_2526862 ?auto_2526863 )
      ( MAKE-5CRATE-VERIFY ?auto_2526859 ?auto_2526860 ?auto_2526861 ?auto_2526858 ?auto_2526862 ?auto_2526863 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2526909 - SURFACE
      ?auto_2526910 - SURFACE
      ?auto_2526911 - SURFACE
      ?auto_2526908 - SURFACE
      ?auto_2526912 - SURFACE
      ?auto_2526913 - SURFACE
    )
    :vars
    (
      ?auto_2526916 - HOIST
      ?auto_2526915 - PLACE
      ?auto_2526918 - TRUCK
      ?auto_2526917 - PLACE
      ?auto_2526914 - HOIST
      ?auto_2526919 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2526916 ?auto_2526915 ) ( SURFACE-AT ?auto_2526912 ?auto_2526915 ) ( CLEAR ?auto_2526912 ) ( IS-CRATE ?auto_2526913 ) ( not ( = ?auto_2526912 ?auto_2526913 ) ) ( AVAILABLE ?auto_2526916 ) ( ON ?auto_2526912 ?auto_2526908 ) ( not ( = ?auto_2526908 ?auto_2526912 ) ) ( not ( = ?auto_2526908 ?auto_2526913 ) ) ( TRUCK-AT ?auto_2526918 ?auto_2526917 ) ( not ( = ?auto_2526917 ?auto_2526915 ) ) ( HOIST-AT ?auto_2526914 ?auto_2526917 ) ( not ( = ?auto_2526916 ?auto_2526914 ) ) ( AVAILABLE ?auto_2526914 ) ( SURFACE-AT ?auto_2526913 ?auto_2526917 ) ( ON ?auto_2526913 ?auto_2526919 ) ( CLEAR ?auto_2526913 ) ( not ( = ?auto_2526912 ?auto_2526919 ) ) ( not ( = ?auto_2526913 ?auto_2526919 ) ) ( not ( = ?auto_2526908 ?auto_2526919 ) ) ( ON ?auto_2526910 ?auto_2526909 ) ( ON ?auto_2526911 ?auto_2526910 ) ( ON ?auto_2526908 ?auto_2526911 ) ( not ( = ?auto_2526909 ?auto_2526910 ) ) ( not ( = ?auto_2526909 ?auto_2526911 ) ) ( not ( = ?auto_2526909 ?auto_2526908 ) ) ( not ( = ?auto_2526909 ?auto_2526912 ) ) ( not ( = ?auto_2526909 ?auto_2526913 ) ) ( not ( = ?auto_2526909 ?auto_2526919 ) ) ( not ( = ?auto_2526910 ?auto_2526911 ) ) ( not ( = ?auto_2526910 ?auto_2526908 ) ) ( not ( = ?auto_2526910 ?auto_2526912 ) ) ( not ( = ?auto_2526910 ?auto_2526913 ) ) ( not ( = ?auto_2526910 ?auto_2526919 ) ) ( not ( = ?auto_2526911 ?auto_2526908 ) ) ( not ( = ?auto_2526911 ?auto_2526912 ) ) ( not ( = ?auto_2526911 ?auto_2526913 ) ) ( not ( = ?auto_2526911 ?auto_2526919 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2526908 ?auto_2526912 ?auto_2526913 )
      ( MAKE-5CRATE-VERIFY ?auto_2526909 ?auto_2526910 ?auto_2526911 ?auto_2526908 ?auto_2526912 ?auto_2526913 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2526960 - SURFACE
      ?auto_2526961 - SURFACE
      ?auto_2526962 - SURFACE
      ?auto_2526959 - SURFACE
      ?auto_2526963 - SURFACE
      ?auto_2526964 - SURFACE
    )
    :vars
    (
      ?auto_2526970 - HOIST
      ?auto_2526968 - PLACE
      ?auto_2526969 - PLACE
      ?auto_2526966 - HOIST
      ?auto_2526965 - SURFACE
      ?auto_2526967 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2526970 ?auto_2526968 ) ( SURFACE-AT ?auto_2526963 ?auto_2526968 ) ( CLEAR ?auto_2526963 ) ( IS-CRATE ?auto_2526964 ) ( not ( = ?auto_2526963 ?auto_2526964 ) ) ( AVAILABLE ?auto_2526970 ) ( ON ?auto_2526963 ?auto_2526959 ) ( not ( = ?auto_2526959 ?auto_2526963 ) ) ( not ( = ?auto_2526959 ?auto_2526964 ) ) ( not ( = ?auto_2526969 ?auto_2526968 ) ) ( HOIST-AT ?auto_2526966 ?auto_2526969 ) ( not ( = ?auto_2526970 ?auto_2526966 ) ) ( AVAILABLE ?auto_2526966 ) ( SURFACE-AT ?auto_2526964 ?auto_2526969 ) ( ON ?auto_2526964 ?auto_2526965 ) ( CLEAR ?auto_2526964 ) ( not ( = ?auto_2526963 ?auto_2526965 ) ) ( not ( = ?auto_2526964 ?auto_2526965 ) ) ( not ( = ?auto_2526959 ?auto_2526965 ) ) ( TRUCK-AT ?auto_2526967 ?auto_2526968 ) ( ON ?auto_2526961 ?auto_2526960 ) ( ON ?auto_2526962 ?auto_2526961 ) ( ON ?auto_2526959 ?auto_2526962 ) ( not ( = ?auto_2526960 ?auto_2526961 ) ) ( not ( = ?auto_2526960 ?auto_2526962 ) ) ( not ( = ?auto_2526960 ?auto_2526959 ) ) ( not ( = ?auto_2526960 ?auto_2526963 ) ) ( not ( = ?auto_2526960 ?auto_2526964 ) ) ( not ( = ?auto_2526960 ?auto_2526965 ) ) ( not ( = ?auto_2526961 ?auto_2526962 ) ) ( not ( = ?auto_2526961 ?auto_2526959 ) ) ( not ( = ?auto_2526961 ?auto_2526963 ) ) ( not ( = ?auto_2526961 ?auto_2526964 ) ) ( not ( = ?auto_2526961 ?auto_2526965 ) ) ( not ( = ?auto_2526962 ?auto_2526959 ) ) ( not ( = ?auto_2526962 ?auto_2526963 ) ) ( not ( = ?auto_2526962 ?auto_2526964 ) ) ( not ( = ?auto_2526962 ?auto_2526965 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2526959 ?auto_2526963 ?auto_2526964 )
      ( MAKE-5CRATE-VERIFY ?auto_2526960 ?auto_2526961 ?auto_2526962 ?auto_2526959 ?auto_2526963 ?auto_2526964 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2527011 - SURFACE
      ?auto_2527012 - SURFACE
      ?auto_2527013 - SURFACE
      ?auto_2527010 - SURFACE
      ?auto_2527014 - SURFACE
      ?auto_2527015 - SURFACE
    )
    :vars
    (
      ?auto_2527018 - HOIST
      ?auto_2527019 - PLACE
      ?auto_2527016 - PLACE
      ?auto_2527021 - HOIST
      ?auto_2527020 - SURFACE
      ?auto_2527017 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2527018 ?auto_2527019 ) ( IS-CRATE ?auto_2527015 ) ( not ( = ?auto_2527014 ?auto_2527015 ) ) ( not ( = ?auto_2527010 ?auto_2527014 ) ) ( not ( = ?auto_2527010 ?auto_2527015 ) ) ( not ( = ?auto_2527016 ?auto_2527019 ) ) ( HOIST-AT ?auto_2527021 ?auto_2527016 ) ( not ( = ?auto_2527018 ?auto_2527021 ) ) ( AVAILABLE ?auto_2527021 ) ( SURFACE-AT ?auto_2527015 ?auto_2527016 ) ( ON ?auto_2527015 ?auto_2527020 ) ( CLEAR ?auto_2527015 ) ( not ( = ?auto_2527014 ?auto_2527020 ) ) ( not ( = ?auto_2527015 ?auto_2527020 ) ) ( not ( = ?auto_2527010 ?auto_2527020 ) ) ( TRUCK-AT ?auto_2527017 ?auto_2527019 ) ( SURFACE-AT ?auto_2527010 ?auto_2527019 ) ( CLEAR ?auto_2527010 ) ( LIFTING ?auto_2527018 ?auto_2527014 ) ( IS-CRATE ?auto_2527014 ) ( ON ?auto_2527012 ?auto_2527011 ) ( ON ?auto_2527013 ?auto_2527012 ) ( ON ?auto_2527010 ?auto_2527013 ) ( not ( = ?auto_2527011 ?auto_2527012 ) ) ( not ( = ?auto_2527011 ?auto_2527013 ) ) ( not ( = ?auto_2527011 ?auto_2527010 ) ) ( not ( = ?auto_2527011 ?auto_2527014 ) ) ( not ( = ?auto_2527011 ?auto_2527015 ) ) ( not ( = ?auto_2527011 ?auto_2527020 ) ) ( not ( = ?auto_2527012 ?auto_2527013 ) ) ( not ( = ?auto_2527012 ?auto_2527010 ) ) ( not ( = ?auto_2527012 ?auto_2527014 ) ) ( not ( = ?auto_2527012 ?auto_2527015 ) ) ( not ( = ?auto_2527012 ?auto_2527020 ) ) ( not ( = ?auto_2527013 ?auto_2527010 ) ) ( not ( = ?auto_2527013 ?auto_2527014 ) ) ( not ( = ?auto_2527013 ?auto_2527015 ) ) ( not ( = ?auto_2527013 ?auto_2527020 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2527010 ?auto_2527014 ?auto_2527015 )
      ( MAKE-5CRATE-VERIFY ?auto_2527011 ?auto_2527012 ?auto_2527013 ?auto_2527010 ?auto_2527014 ?auto_2527015 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2527062 - SURFACE
      ?auto_2527063 - SURFACE
      ?auto_2527064 - SURFACE
      ?auto_2527061 - SURFACE
      ?auto_2527065 - SURFACE
      ?auto_2527066 - SURFACE
    )
    :vars
    (
      ?auto_2527068 - HOIST
      ?auto_2527072 - PLACE
      ?auto_2527070 - PLACE
      ?auto_2527067 - HOIST
      ?auto_2527071 - SURFACE
      ?auto_2527069 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2527068 ?auto_2527072 ) ( IS-CRATE ?auto_2527066 ) ( not ( = ?auto_2527065 ?auto_2527066 ) ) ( not ( = ?auto_2527061 ?auto_2527065 ) ) ( not ( = ?auto_2527061 ?auto_2527066 ) ) ( not ( = ?auto_2527070 ?auto_2527072 ) ) ( HOIST-AT ?auto_2527067 ?auto_2527070 ) ( not ( = ?auto_2527068 ?auto_2527067 ) ) ( AVAILABLE ?auto_2527067 ) ( SURFACE-AT ?auto_2527066 ?auto_2527070 ) ( ON ?auto_2527066 ?auto_2527071 ) ( CLEAR ?auto_2527066 ) ( not ( = ?auto_2527065 ?auto_2527071 ) ) ( not ( = ?auto_2527066 ?auto_2527071 ) ) ( not ( = ?auto_2527061 ?auto_2527071 ) ) ( TRUCK-AT ?auto_2527069 ?auto_2527072 ) ( SURFACE-AT ?auto_2527061 ?auto_2527072 ) ( CLEAR ?auto_2527061 ) ( IS-CRATE ?auto_2527065 ) ( AVAILABLE ?auto_2527068 ) ( IN ?auto_2527065 ?auto_2527069 ) ( ON ?auto_2527063 ?auto_2527062 ) ( ON ?auto_2527064 ?auto_2527063 ) ( ON ?auto_2527061 ?auto_2527064 ) ( not ( = ?auto_2527062 ?auto_2527063 ) ) ( not ( = ?auto_2527062 ?auto_2527064 ) ) ( not ( = ?auto_2527062 ?auto_2527061 ) ) ( not ( = ?auto_2527062 ?auto_2527065 ) ) ( not ( = ?auto_2527062 ?auto_2527066 ) ) ( not ( = ?auto_2527062 ?auto_2527071 ) ) ( not ( = ?auto_2527063 ?auto_2527064 ) ) ( not ( = ?auto_2527063 ?auto_2527061 ) ) ( not ( = ?auto_2527063 ?auto_2527065 ) ) ( not ( = ?auto_2527063 ?auto_2527066 ) ) ( not ( = ?auto_2527063 ?auto_2527071 ) ) ( not ( = ?auto_2527064 ?auto_2527061 ) ) ( not ( = ?auto_2527064 ?auto_2527065 ) ) ( not ( = ?auto_2527064 ?auto_2527066 ) ) ( not ( = ?auto_2527064 ?auto_2527071 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2527061 ?auto_2527065 ?auto_2527066 )
      ( MAKE-5CRATE-VERIFY ?auto_2527062 ?auto_2527063 ?auto_2527064 ?auto_2527061 ?auto_2527065 ?auto_2527066 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2528271 - SURFACE
      ?auto_2528272 - SURFACE
      ?auto_2528273 - SURFACE
      ?auto_2528270 - SURFACE
      ?auto_2528274 - SURFACE
      ?auto_2528276 - SURFACE
      ?auto_2528275 - SURFACE
    )
    :vars
    (
      ?auto_2528278 - HOIST
      ?auto_2528277 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2528278 ?auto_2528277 ) ( SURFACE-AT ?auto_2528276 ?auto_2528277 ) ( CLEAR ?auto_2528276 ) ( LIFTING ?auto_2528278 ?auto_2528275 ) ( IS-CRATE ?auto_2528275 ) ( not ( = ?auto_2528276 ?auto_2528275 ) ) ( ON ?auto_2528272 ?auto_2528271 ) ( ON ?auto_2528273 ?auto_2528272 ) ( ON ?auto_2528270 ?auto_2528273 ) ( ON ?auto_2528274 ?auto_2528270 ) ( ON ?auto_2528276 ?auto_2528274 ) ( not ( = ?auto_2528271 ?auto_2528272 ) ) ( not ( = ?auto_2528271 ?auto_2528273 ) ) ( not ( = ?auto_2528271 ?auto_2528270 ) ) ( not ( = ?auto_2528271 ?auto_2528274 ) ) ( not ( = ?auto_2528271 ?auto_2528276 ) ) ( not ( = ?auto_2528271 ?auto_2528275 ) ) ( not ( = ?auto_2528272 ?auto_2528273 ) ) ( not ( = ?auto_2528272 ?auto_2528270 ) ) ( not ( = ?auto_2528272 ?auto_2528274 ) ) ( not ( = ?auto_2528272 ?auto_2528276 ) ) ( not ( = ?auto_2528272 ?auto_2528275 ) ) ( not ( = ?auto_2528273 ?auto_2528270 ) ) ( not ( = ?auto_2528273 ?auto_2528274 ) ) ( not ( = ?auto_2528273 ?auto_2528276 ) ) ( not ( = ?auto_2528273 ?auto_2528275 ) ) ( not ( = ?auto_2528270 ?auto_2528274 ) ) ( not ( = ?auto_2528270 ?auto_2528276 ) ) ( not ( = ?auto_2528270 ?auto_2528275 ) ) ( not ( = ?auto_2528274 ?auto_2528276 ) ) ( not ( = ?auto_2528274 ?auto_2528275 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2528276 ?auto_2528275 )
      ( MAKE-6CRATE-VERIFY ?auto_2528271 ?auto_2528272 ?auto_2528273 ?auto_2528270 ?auto_2528274 ?auto_2528276 ?auto_2528275 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2528315 - SURFACE
      ?auto_2528316 - SURFACE
      ?auto_2528317 - SURFACE
      ?auto_2528314 - SURFACE
      ?auto_2528318 - SURFACE
      ?auto_2528320 - SURFACE
      ?auto_2528319 - SURFACE
    )
    :vars
    (
      ?auto_2528323 - HOIST
      ?auto_2528321 - PLACE
      ?auto_2528322 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2528323 ?auto_2528321 ) ( SURFACE-AT ?auto_2528320 ?auto_2528321 ) ( CLEAR ?auto_2528320 ) ( IS-CRATE ?auto_2528319 ) ( not ( = ?auto_2528320 ?auto_2528319 ) ) ( TRUCK-AT ?auto_2528322 ?auto_2528321 ) ( AVAILABLE ?auto_2528323 ) ( IN ?auto_2528319 ?auto_2528322 ) ( ON ?auto_2528320 ?auto_2528318 ) ( not ( = ?auto_2528318 ?auto_2528320 ) ) ( not ( = ?auto_2528318 ?auto_2528319 ) ) ( ON ?auto_2528316 ?auto_2528315 ) ( ON ?auto_2528317 ?auto_2528316 ) ( ON ?auto_2528314 ?auto_2528317 ) ( ON ?auto_2528318 ?auto_2528314 ) ( not ( = ?auto_2528315 ?auto_2528316 ) ) ( not ( = ?auto_2528315 ?auto_2528317 ) ) ( not ( = ?auto_2528315 ?auto_2528314 ) ) ( not ( = ?auto_2528315 ?auto_2528318 ) ) ( not ( = ?auto_2528315 ?auto_2528320 ) ) ( not ( = ?auto_2528315 ?auto_2528319 ) ) ( not ( = ?auto_2528316 ?auto_2528317 ) ) ( not ( = ?auto_2528316 ?auto_2528314 ) ) ( not ( = ?auto_2528316 ?auto_2528318 ) ) ( not ( = ?auto_2528316 ?auto_2528320 ) ) ( not ( = ?auto_2528316 ?auto_2528319 ) ) ( not ( = ?auto_2528317 ?auto_2528314 ) ) ( not ( = ?auto_2528317 ?auto_2528318 ) ) ( not ( = ?auto_2528317 ?auto_2528320 ) ) ( not ( = ?auto_2528317 ?auto_2528319 ) ) ( not ( = ?auto_2528314 ?auto_2528318 ) ) ( not ( = ?auto_2528314 ?auto_2528320 ) ) ( not ( = ?auto_2528314 ?auto_2528319 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2528318 ?auto_2528320 ?auto_2528319 )
      ( MAKE-6CRATE-VERIFY ?auto_2528315 ?auto_2528316 ?auto_2528317 ?auto_2528314 ?auto_2528318 ?auto_2528320 ?auto_2528319 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2528366 - SURFACE
      ?auto_2528367 - SURFACE
      ?auto_2528368 - SURFACE
      ?auto_2528365 - SURFACE
      ?auto_2528369 - SURFACE
      ?auto_2528371 - SURFACE
      ?auto_2528370 - SURFACE
    )
    :vars
    (
      ?auto_2528374 - HOIST
      ?auto_2528373 - PLACE
      ?auto_2528372 - TRUCK
      ?auto_2528375 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2528374 ?auto_2528373 ) ( SURFACE-AT ?auto_2528371 ?auto_2528373 ) ( CLEAR ?auto_2528371 ) ( IS-CRATE ?auto_2528370 ) ( not ( = ?auto_2528371 ?auto_2528370 ) ) ( AVAILABLE ?auto_2528374 ) ( IN ?auto_2528370 ?auto_2528372 ) ( ON ?auto_2528371 ?auto_2528369 ) ( not ( = ?auto_2528369 ?auto_2528371 ) ) ( not ( = ?auto_2528369 ?auto_2528370 ) ) ( TRUCK-AT ?auto_2528372 ?auto_2528375 ) ( not ( = ?auto_2528375 ?auto_2528373 ) ) ( ON ?auto_2528367 ?auto_2528366 ) ( ON ?auto_2528368 ?auto_2528367 ) ( ON ?auto_2528365 ?auto_2528368 ) ( ON ?auto_2528369 ?auto_2528365 ) ( not ( = ?auto_2528366 ?auto_2528367 ) ) ( not ( = ?auto_2528366 ?auto_2528368 ) ) ( not ( = ?auto_2528366 ?auto_2528365 ) ) ( not ( = ?auto_2528366 ?auto_2528369 ) ) ( not ( = ?auto_2528366 ?auto_2528371 ) ) ( not ( = ?auto_2528366 ?auto_2528370 ) ) ( not ( = ?auto_2528367 ?auto_2528368 ) ) ( not ( = ?auto_2528367 ?auto_2528365 ) ) ( not ( = ?auto_2528367 ?auto_2528369 ) ) ( not ( = ?auto_2528367 ?auto_2528371 ) ) ( not ( = ?auto_2528367 ?auto_2528370 ) ) ( not ( = ?auto_2528368 ?auto_2528365 ) ) ( not ( = ?auto_2528368 ?auto_2528369 ) ) ( not ( = ?auto_2528368 ?auto_2528371 ) ) ( not ( = ?auto_2528368 ?auto_2528370 ) ) ( not ( = ?auto_2528365 ?auto_2528369 ) ) ( not ( = ?auto_2528365 ?auto_2528371 ) ) ( not ( = ?auto_2528365 ?auto_2528370 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2528369 ?auto_2528371 ?auto_2528370 )
      ( MAKE-6CRATE-VERIFY ?auto_2528366 ?auto_2528367 ?auto_2528368 ?auto_2528365 ?auto_2528369 ?auto_2528371 ?auto_2528370 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2528423 - SURFACE
      ?auto_2528424 - SURFACE
      ?auto_2528425 - SURFACE
      ?auto_2528422 - SURFACE
      ?auto_2528426 - SURFACE
      ?auto_2528428 - SURFACE
      ?auto_2528427 - SURFACE
    )
    :vars
    (
      ?auto_2528430 - HOIST
      ?auto_2528429 - PLACE
      ?auto_2528432 - TRUCK
      ?auto_2528431 - PLACE
      ?auto_2528433 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2528430 ?auto_2528429 ) ( SURFACE-AT ?auto_2528428 ?auto_2528429 ) ( CLEAR ?auto_2528428 ) ( IS-CRATE ?auto_2528427 ) ( not ( = ?auto_2528428 ?auto_2528427 ) ) ( AVAILABLE ?auto_2528430 ) ( ON ?auto_2528428 ?auto_2528426 ) ( not ( = ?auto_2528426 ?auto_2528428 ) ) ( not ( = ?auto_2528426 ?auto_2528427 ) ) ( TRUCK-AT ?auto_2528432 ?auto_2528431 ) ( not ( = ?auto_2528431 ?auto_2528429 ) ) ( HOIST-AT ?auto_2528433 ?auto_2528431 ) ( LIFTING ?auto_2528433 ?auto_2528427 ) ( not ( = ?auto_2528430 ?auto_2528433 ) ) ( ON ?auto_2528424 ?auto_2528423 ) ( ON ?auto_2528425 ?auto_2528424 ) ( ON ?auto_2528422 ?auto_2528425 ) ( ON ?auto_2528426 ?auto_2528422 ) ( not ( = ?auto_2528423 ?auto_2528424 ) ) ( not ( = ?auto_2528423 ?auto_2528425 ) ) ( not ( = ?auto_2528423 ?auto_2528422 ) ) ( not ( = ?auto_2528423 ?auto_2528426 ) ) ( not ( = ?auto_2528423 ?auto_2528428 ) ) ( not ( = ?auto_2528423 ?auto_2528427 ) ) ( not ( = ?auto_2528424 ?auto_2528425 ) ) ( not ( = ?auto_2528424 ?auto_2528422 ) ) ( not ( = ?auto_2528424 ?auto_2528426 ) ) ( not ( = ?auto_2528424 ?auto_2528428 ) ) ( not ( = ?auto_2528424 ?auto_2528427 ) ) ( not ( = ?auto_2528425 ?auto_2528422 ) ) ( not ( = ?auto_2528425 ?auto_2528426 ) ) ( not ( = ?auto_2528425 ?auto_2528428 ) ) ( not ( = ?auto_2528425 ?auto_2528427 ) ) ( not ( = ?auto_2528422 ?auto_2528426 ) ) ( not ( = ?auto_2528422 ?auto_2528428 ) ) ( not ( = ?auto_2528422 ?auto_2528427 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2528426 ?auto_2528428 ?auto_2528427 )
      ( MAKE-6CRATE-VERIFY ?auto_2528423 ?auto_2528424 ?auto_2528425 ?auto_2528422 ?auto_2528426 ?auto_2528428 ?auto_2528427 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2528486 - SURFACE
      ?auto_2528487 - SURFACE
      ?auto_2528488 - SURFACE
      ?auto_2528485 - SURFACE
      ?auto_2528489 - SURFACE
      ?auto_2528491 - SURFACE
      ?auto_2528490 - SURFACE
    )
    :vars
    (
      ?auto_2528492 - HOIST
      ?auto_2528496 - PLACE
      ?auto_2528493 - TRUCK
      ?auto_2528494 - PLACE
      ?auto_2528497 - HOIST
      ?auto_2528495 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2528492 ?auto_2528496 ) ( SURFACE-AT ?auto_2528491 ?auto_2528496 ) ( CLEAR ?auto_2528491 ) ( IS-CRATE ?auto_2528490 ) ( not ( = ?auto_2528491 ?auto_2528490 ) ) ( AVAILABLE ?auto_2528492 ) ( ON ?auto_2528491 ?auto_2528489 ) ( not ( = ?auto_2528489 ?auto_2528491 ) ) ( not ( = ?auto_2528489 ?auto_2528490 ) ) ( TRUCK-AT ?auto_2528493 ?auto_2528494 ) ( not ( = ?auto_2528494 ?auto_2528496 ) ) ( HOIST-AT ?auto_2528497 ?auto_2528494 ) ( not ( = ?auto_2528492 ?auto_2528497 ) ) ( AVAILABLE ?auto_2528497 ) ( SURFACE-AT ?auto_2528490 ?auto_2528494 ) ( ON ?auto_2528490 ?auto_2528495 ) ( CLEAR ?auto_2528490 ) ( not ( = ?auto_2528491 ?auto_2528495 ) ) ( not ( = ?auto_2528490 ?auto_2528495 ) ) ( not ( = ?auto_2528489 ?auto_2528495 ) ) ( ON ?auto_2528487 ?auto_2528486 ) ( ON ?auto_2528488 ?auto_2528487 ) ( ON ?auto_2528485 ?auto_2528488 ) ( ON ?auto_2528489 ?auto_2528485 ) ( not ( = ?auto_2528486 ?auto_2528487 ) ) ( not ( = ?auto_2528486 ?auto_2528488 ) ) ( not ( = ?auto_2528486 ?auto_2528485 ) ) ( not ( = ?auto_2528486 ?auto_2528489 ) ) ( not ( = ?auto_2528486 ?auto_2528491 ) ) ( not ( = ?auto_2528486 ?auto_2528490 ) ) ( not ( = ?auto_2528486 ?auto_2528495 ) ) ( not ( = ?auto_2528487 ?auto_2528488 ) ) ( not ( = ?auto_2528487 ?auto_2528485 ) ) ( not ( = ?auto_2528487 ?auto_2528489 ) ) ( not ( = ?auto_2528487 ?auto_2528491 ) ) ( not ( = ?auto_2528487 ?auto_2528490 ) ) ( not ( = ?auto_2528487 ?auto_2528495 ) ) ( not ( = ?auto_2528488 ?auto_2528485 ) ) ( not ( = ?auto_2528488 ?auto_2528489 ) ) ( not ( = ?auto_2528488 ?auto_2528491 ) ) ( not ( = ?auto_2528488 ?auto_2528490 ) ) ( not ( = ?auto_2528488 ?auto_2528495 ) ) ( not ( = ?auto_2528485 ?auto_2528489 ) ) ( not ( = ?auto_2528485 ?auto_2528491 ) ) ( not ( = ?auto_2528485 ?auto_2528490 ) ) ( not ( = ?auto_2528485 ?auto_2528495 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2528489 ?auto_2528491 ?auto_2528490 )
      ( MAKE-6CRATE-VERIFY ?auto_2528486 ?auto_2528487 ?auto_2528488 ?auto_2528485 ?auto_2528489 ?auto_2528491 ?auto_2528490 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2528550 - SURFACE
      ?auto_2528551 - SURFACE
      ?auto_2528552 - SURFACE
      ?auto_2528549 - SURFACE
      ?auto_2528553 - SURFACE
      ?auto_2528555 - SURFACE
      ?auto_2528554 - SURFACE
    )
    :vars
    (
      ?auto_2528558 - HOIST
      ?auto_2528559 - PLACE
      ?auto_2528561 - PLACE
      ?auto_2528560 - HOIST
      ?auto_2528556 - SURFACE
      ?auto_2528557 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2528558 ?auto_2528559 ) ( SURFACE-AT ?auto_2528555 ?auto_2528559 ) ( CLEAR ?auto_2528555 ) ( IS-CRATE ?auto_2528554 ) ( not ( = ?auto_2528555 ?auto_2528554 ) ) ( AVAILABLE ?auto_2528558 ) ( ON ?auto_2528555 ?auto_2528553 ) ( not ( = ?auto_2528553 ?auto_2528555 ) ) ( not ( = ?auto_2528553 ?auto_2528554 ) ) ( not ( = ?auto_2528561 ?auto_2528559 ) ) ( HOIST-AT ?auto_2528560 ?auto_2528561 ) ( not ( = ?auto_2528558 ?auto_2528560 ) ) ( AVAILABLE ?auto_2528560 ) ( SURFACE-AT ?auto_2528554 ?auto_2528561 ) ( ON ?auto_2528554 ?auto_2528556 ) ( CLEAR ?auto_2528554 ) ( not ( = ?auto_2528555 ?auto_2528556 ) ) ( not ( = ?auto_2528554 ?auto_2528556 ) ) ( not ( = ?auto_2528553 ?auto_2528556 ) ) ( TRUCK-AT ?auto_2528557 ?auto_2528559 ) ( ON ?auto_2528551 ?auto_2528550 ) ( ON ?auto_2528552 ?auto_2528551 ) ( ON ?auto_2528549 ?auto_2528552 ) ( ON ?auto_2528553 ?auto_2528549 ) ( not ( = ?auto_2528550 ?auto_2528551 ) ) ( not ( = ?auto_2528550 ?auto_2528552 ) ) ( not ( = ?auto_2528550 ?auto_2528549 ) ) ( not ( = ?auto_2528550 ?auto_2528553 ) ) ( not ( = ?auto_2528550 ?auto_2528555 ) ) ( not ( = ?auto_2528550 ?auto_2528554 ) ) ( not ( = ?auto_2528550 ?auto_2528556 ) ) ( not ( = ?auto_2528551 ?auto_2528552 ) ) ( not ( = ?auto_2528551 ?auto_2528549 ) ) ( not ( = ?auto_2528551 ?auto_2528553 ) ) ( not ( = ?auto_2528551 ?auto_2528555 ) ) ( not ( = ?auto_2528551 ?auto_2528554 ) ) ( not ( = ?auto_2528551 ?auto_2528556 ) ) ( not ( = ?auto_2528552 ?auto_2528549 ) ) ( not ( = ?auto_2528552 ?auto_2528553 ) ) ( not ( = ?auto_2528552 ?auto_2528555 ) ) ( not ( = ?auto_2528552 ?auto_2528554 ) ) ( not ( = ?auto_2528552 ?auto_2528556 ) ) ( not ( = ?auto_2528549 ?auto_2528553 ) ) ( not ( = ?auto_2528549 ?auto_2528555 ) ) ( not ( = ?auto_2528549 ?auto_2528554 ) ) ( not ( = ?auto_2528549 ?auto_2528556 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2528553 ?auto_2528555 ?auto_2528554 )
      ( MAKE-6CRATE-VERIFY ?auto_2528550 ?auto_2528551 ?auto_2528552 ?auto_2528549 ?auto_2528553 ?auto_2528555 ?auto_2528554 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2528614 - SURFACE
      ?auto_2528615 - SURFACE
      ?auto_2528616 - SURFACE
      ?auto_2528613 - SURFACE
      ?auto_2528617 - SURFACE
      ?auto_2528619 - SURFACE
      ?auto_2528618 - SURFACE
    )
    :vars
    (
      ?auto_2528621 - HOIST
      ?auto_2528620 - PLACE
      ?auto_2528624 - PLACE
      ?auto_2528623 - HOIST
      ?auto_2528625 - SURFACE
      ?auto_2528622 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2528621 ?auto_2528620 ) ( IS-CRATE ?auto_2528618 ) ( not ( = ?auto_2528619 ?auto_2528618 ) ) ( not ( = ?auto_2528617 ?auto_2528619 ) ) ( not ( = ?auto_2528617 ?auto_2528618 ) ) ( not ( = ?auto_2528624 ?auto_2528620 ) ) ( HOIST-AT ?auto_2528623 ?auto_2528624 ) ( not ( = ?auto_2528621 ?auto_2528623 ) ) ( AVAILABLE ?auto_2528623 ) ( SURFACE-AT ?auto_2528618 ?auto_2528624 ) ( ON ?auto_2528618 ?auto_2528625 ) ( CLEAR ?auto_2528618 ) ( not ( = ?auto_2528619 ?auto_2528625 ) ) ( not ( = ?auto_2528618 ?auto_2528625 ) ) ( not ( = ?auto_2528617 ?auto_2528625 ) ) ( TRUCK-AT ?auto_2528622 ?auto_2528620 ) ( SURFACE-AT ?auto_2528617 ?auto_2528620 ) ( CLEAR ?auto_2528617 ) ( LIFTING ?auto_2528621 ?auto_2528619 ) ( IS-CRATE ?auto_2528619 ) ( ON ?auto_2528615 ?auto_2528614 ) ( ON ?auto_2528616 ?auto_2528615 ) ( ON ?auto_2528613 ?auto_2528616 ) ( ON ?auto_2528617 ?auto_2528613 ) ( not ( = ?auto_2528614 ?auto_2528615 ) ) ( not ( = ?auto_2528614 ?auto_2528616 ) ) ( not ( = ?auto_2528614 ?auto_2528613 ) ) ( not ( = ?auto_2528614 ?auto_2528617 ) ) ( not ( = ?auto_2528614 ?auto_2528619 ) ) ( not ( = ?auto_2528614 ?auto_2528618 ) ) ( not ( = ?auto_2528614 ?auto_2528625 ) ) ( not ( = ?auto_2528615 ?auto_2528616 ) ) ( not ( = ?auto_2528615 ?auto_2528613 ) ) ( not ( = ?auto_2528615 ?auto_2528617 ) ) ( not ( = ?auto_2528615 ?auto_2528619 ) ) ( not ( = ?auto_2528615 ?auto_2528618 ) ) ( not ( = ?auto_2528615 ?auto_2528625 ) ) ( not ( = ?auto_2528616 ?auto_2528613 ) ) ( not ( = ?auto_2528616 ?auto_2528617 ) ) ( not ( = ?auto_2528616 ?auto_2528619 ) ) ( not ( = ?auto_2528616 ?auto_2528618 ) ) ( not ( = ?auto_2528616 ?auto_2528625 ) ) ( not ( = ?auto_2528613 ?auto_2528617 ) ) ( not ( = ?auto_2528613 ?auto_2528619 ) ) ( not ( = ?auto_2528613 ?auto_2528618 ) ) ( not ( = ?auto_2528613 ?auto_2528625 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2528617 ?auto_2528619 ?auto_2528618 )
      ( MAKE-6CRATE-VERIFY ?auto_2528614 ?auto_2528615 ?auto_2528616 ?auto_2528613 ?auto_2528617 ?auto_2528619 ?auto_2528618 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2528678 - SURFACE
      ?auto_2528679 - SURFACE
      ?auto_2528680 - SURFACE
      ?auto_2528677 - SURFACE
      ?auto_2528681 - SURFACE
      ?auto_2528683 - SURFACE
      ?auto_2528682 - SURFACE
    )
    :vars
    (
      ?auto_2528687 - HOIST
      ?auto_2528686 - PLACE
      ?auto_2528689 - PLACE
      ?auto_2528688 - HOIST
      ?auto_2528685 - SURFACE
      ?auto_2528684 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2528687 ?auto_2528686 ) ( IS-CRATE ?auto_2528682 ) ( not ( = ?auto_2528683 ?auto_2528682 ) ) ( not ( = ?auto_2528681 ?auto_2528683 ) ) ( not ( = ?auto_2528681 ?auto_2528682 ) ) ( not ( = ?auto_2528689 ?auto_2528686 ) ) ( HOIST-AT ?auto_2528688 ?auto_2528689 ) ( not ( = ?auto_2528687 ?auto_2528688 ) ) ( AVAILABLE ?auto_2528688 ) ( SURFACE-AT ?auto_2528682 ?auto_2528689 ) ( ON ?auto_2528682 ?auto_2528685 ) ( CLEAR ?auto_2528682 ) ( not ( = ?auto_2528683 ?auto_2528685 ) ) ( not ( = ?auto_2528682 ?auto_2528685 ) ) ( not ( = ?auto_2528681 ?auto_2528685 ) ) ( TRUCK-AT ?auto_2528684 ?auto_2528686 ) ( SURFACE-AT ?auto_2528681 ?auto_2528686 ) ( CLEAR ?auto_2528681 ) ( IS-CRATE ?auto_2528683 ) ( AVAILABLE ?auto_2528687 ) ( IN ?auto_2528683 ?auto_2528684 ) ( ON ?auto_2528679 ?auto_2528678 ) ( ON ?auto_2528680 ?auto_2528679 ) ( ON ?auto_2528677 ?auto_2528680 ) ( ON ?auto_2528681 ?auto_2528677 ) ( not ( = ?auto_2528678 ?auto_2528679 ) ) ( not ( = ?auto_2528678 ?auto_2528680 ) ) ( not ( = ?auto_2528678 ?auto_2528677 ) ) ( not ( = ?auto_2528678 ?auto_2528681 ) ) ( not ( = ?auto_2528678 ?auto_2528683 ) ) ( not ( = ?auto_2528678 ?auto_2528682 ) ) ( not ( = ?auto_2528678 ?auto_2528685 ) ) ( not ( = ?auto_2528679 ?auto_2528680 ) ) ( not ( = ?auto_2528679 ?auto_2528677 ) ) ( not ( = ?auto_2528679 ?auto_2528681 ) ) ( not ( = ?auto_2528679 ?auto_2528683 ) ) ( not ( = ?auto_2528679 ?auto_2528682 ) ) ( not ( = ?auto_2528679 ?auto_2528685 ) ) ( not ( = ?auto_2528680 ?auto_2528677 ) ) ( not ( = ?auto_2528680 ?auto_2528681 ) ) ( not ( = ?auto_2528680 ?auto_2528683 ) ) ( not ( = ?auto_2528680 ?auto_2528682 ) ) ( not ( = ?auto_2528680 ?auto_2528685 ) ) ( not ( = ?auto_2528677 ?auto_2528681 ) ) ( not ( = ?auto_2528677 ?auto_2528683 ) ) ( not ( = ?auto_2528677 ?auto_2528682 ) ) ( not ( = ?auto_2528677 ?auto_2528685 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2528681 ?auto_2528683 ?auto_2528682 )
      ( MAKE-6CRATE-VERIFY ?auto_2528678 ?auto_2528679 ?auto_2528680 ?auto_2528677 ?auto_2528681 ?auto_2528683 ?auto_2528682 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2530634 - SURFACE
      ?auto_2530635 - SURFACE
      ?auto_2530636 - SURFACE
      ?auto_2530633 - SURFACE
      ?auto_2530637 - SURFACE
      ?auto_2530639 - SURFACE
      ?auto_2530638 - SURFACE
      ?auto_2530640 - SURFACE
    )
    :vars
    (
      ?auto_2530642 - HOIST
      ?auto_2530641 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2530642 ?auto_2530641 ) ( SURFACE-AT ?auto_2530638 ?auto_2530641 ) ( CLEAR ?auto_2530638 ) ( LIFTING ?auto_2530642 ?auto_2530640 ) ( IS-CRATE ?auto_2530640 ) ( not ( = ?auto_2530638 ?auto_2530640 ) ) ( ON ?auto_2530635 ?auto_2530634 ) ( ON ?auto_2530636 ?auto_2530635 ) ( ON ?auto_2530633 ?auto_2530636 ) ( ON ?auto_2530637 ?auto_2530633 ) ( ON ?auto_2530639 ?auto_2530637 ) ( ON ?auto_2530638 ?auto_2530639 ) ( not ( = ?auto_2530634 ?auto_2530635 ) ) ( not ( = ?auto_2530634 ?auto_2530636 ) ) ( not ( = ?auto_2530634 ?auto_2530633 ) ) ( not ( = ?auto_2530634 ?auto_2530637 ) ) ( not ( = ?auto_2530634 ?auto_2530639 ) ) ( not ( = ?auto_2530634 ?auto_2530638 ) ) ( not ( = ?auto_2530634 ?auto_2530640 ) ) ( not ( = ?auto_2530635 ?auto_2530636 ) ) ( not ( = ?auto_2530635 ?auto_2530633 ) ) ( not ( = ?auto_2530635 ?auto_2530637 ) ) ( not ( = ?auto_2530635 ?auto_2530639 ) ) ( not ( = ?auto_2530635 ?auto_2530638 ) ) ( not ( = ?auto_2530635 ?auto_2530640 ) ) ( not ( = ?auto_2530636 ?auto_2530633 ) ) ( not ( = ?auto_2530636 ?auto_2530637 ) ) ( not ( = ?auto_2530636 ?auto_2530639 ) ) ( not ( = ?auto_2530636 ?auto_2530638 ) ) ( not ( = ?auto_2530636 ?auto_2530640 ) ) ( not ( = ?auto_2530633 ?auto_2530637 ) ) ( not ( = ?auto_2530633 ?auto_2530639 ) ) ( not ( = ?auto_2530633 ?auto_2530638 ) ) ( not ( = ?auto_2530633 ?auto_2530640 ) ) ( not ( = ?auto_2530637 ?auto_2530639 ) ) ( not ( = ?auto_2530637 ?auto_2530638 ) ) ( not ( = ?auto_2530637 ?auto_2530640 ) ) ( not ( = ?auto_2530639 ?auto_2530638 ) ) ( not ( = ?auto_2530639 ?auto_2530640 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2530638 ?auto_2530640 )
      ( MAKE-7CRATE-VERIFY ?auto_2530634 ?auto_2530635 ?auto_2530636 ?auto_2530633 ?auto_2530637 ?auto_2530639 ?auto_2530638 ?auto_2530640 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2530689 - SURFACE
      ?auto_2530690 - SURFACE
      ?auto_2530691 - SURFACE
      ?auto_2530688 - SURFACE
      ?auto_2530692 - SURFACE
      ?auto_2530694 - SURFACE
      ?auto_2530693 - SURFACE
      ?auto_2530695 - SURFACE
    )
    :vars
    (
      ?auto_2530697 - HOIST
      ?auto_2530698 - PLACE
      ?auto_2530696 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2530697 ?auto_2530698 ) ( SURFACE-AT ?auto_2530693 ?auto_2530698 ) ( CLEAR ?auto_2530693 ) ( IS-CRATE ?auto_2530695 ) ( not ( = ?auto_2530693 ?auto_2530695 ) ) ( TRUCK-AT ?auto_2530696 ?auto_2530698 ) ( AVAILABLE ?auto_2530697 ) ( IN ?auto_2530695 ?auto_2530696 ) ( ON ?auto_2530693 ?auto_2530694 ) ( not ( = ?auto_2530694 ?auto_2530693 ) ) ( not ( = ?auto_2530694 ?auto_2530695 ) ) ( ON ?auto_2530690 ?auto_2530689 ) ( ON ?auto_2530691 ?auto_2530690 ) ( ON ?auto_2530688 ?auto_2530691 ) ( ON ?auto_2530692 ?auto_2530688 ) ( ON ?auto_2530694 ?auto_2530692 ) ( not ( = ?auto_2530689 ?auto_2530690 ) ) ( not ( = ?auto_2530689 ?auto_2530691 ) ) ( not ( = ?auto_2530689 ?auto_2530688 ) ) ( not ( = ?auto_2530689 ?auto_2530692 ) ) ( not ( = ?auto_2530689 ?auto_2530694 ) ) ( not ( = ?auto_2530689 ?auto_2530693 ) ) ( not ( = ?auto_2530689 ?auto_2530695 ) ) ( not ( = ?auto_2530690 ?auto_2530691 ) ) ( not ( = ?auto_2530690 ?auto_2530688 ) ) ( not ( = ?auto_2530690 ?auto_2530692 ) ) ( not ( = ?auto_2530690 ?auto_2530694 ) ) ( not ( = ?auto_2530690 ?auto_2530693 ) ) ( not ( = ?auto_2530690 ?auto_2530695 ) ) ( not ( = ?auto_2530691 ?auto_2530688 ) ) ( not ( = ?auto_2530691 ?auto_2530692 ) ) ( not ( = ?auto_2530691 ?auto_2530694 ) ) ( not ( = ?auto_2530691 ?auto_2530693 ) ) ( not ( = ?auto_2530691 ?auto_2530695 ) ) ( not ( = ?auto_2530688 ?auto_2530692 ) ) ( not ( = ?auto_2530688 ?auto_2530694 ) ) ( not ( = ?auto_2530688 ?auto_2530693 ) ) ( not ( = ?auto_2530688 ?auto_2530695 ) ) ( not ( = ?auto_2530692 ?auto_2530694 ) ) ( not ( = ?auto_2530692 ?auto_2530693 ) ) ( not ( = ?auto_2530692 ?auto_2530695 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2530694 ?auto_2530693 ?auto_2530695 )
      ( MAKE-7CRATE-VERIFY ?auto_2530689 ?auto_2530690 ?auto_2530691 ?auto_2530688 ?auto_2530692 ?auto_2530694 ?auto_2530693 ?auto_2530695 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2530752 - SURFACE
      ?auto_2530753 - SURFACE
      ?auto_2530754 - SURFACE
      ?auto_2530751 - SURFACE
      ?auto_2530755 - SURFACE
      ?auto_2530757 - SURFACE
      ?auto_2530756 - SURFACE
      ?auto_2530758 - SURFACE
    )
    :vars
    (
      ?auto_2530761 - HOIST
      ?auto_2530759 - PLACE
      ?auto_2530762 - TRUCK
      ?auto_2530760 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2530761 ?auto_2530759 ) ( SURFACE-AT ?auto_2530756 ?auto_2530759 ) ( CLEAR ?auto_2530756 ) ( IS-CRATE ?auto_2530758 ) ( not ( = ?auto_2530756 ?auto_2530758 ) ) ( AVAILABLE ?auto_2530761 ) ( IN ?auto_2530758 ?auto_2530762 ) ( ON ?auto_2530756 ?auto_2530757 ) ( not ( = ?auto_2530757 ?auto_2530756 ) ) ( not ( = ?auto_2530757 ?auto_2530758 ) ) ( TRUCK-AT ?auto_2530762 ?auto_2530760 ) ( not ( = ?auto_2530760 ?auto_2530759 ) ) ( ON ?auto_2530753 ?auto_2530752 ) ( ON ?auto_2530754 ?auto_2530753 ) ( ON ?auto_2530751 ?auto_2530754 ) ( ON ?auto_2530755 ?auto_2530751 ) ( ON ?auto_2530757 ?auto_2530755 ) ( not ( = ?auto_2530752 ?auto_2530753 ) ) ( not ( = ?auto_2530752 ?auto_2530754 ) ) ( not ( = ?auto_2530752 ?auto_2530751 ) ) ( not ( = ?auto_2530752 ?auto_2530755 ) ) ( not ( = ?auto_2530752 ?auto_2530757 ) ) ( not ( = ?auto_2530752 ?auto_2530756 ) ) ( not ( = ?auto_2530752 ?auto_2530758 ) ) ( not ( = ?auto_2530753 ?auto_2530754 ) ) ( not ( = ?auto_2530753 ?auto_2530751 ) ) ( not ( = ?auto_2530753 ?auto_2530755 ) ) ( not ( = ?auto_2530753 ?auto_2530757 ) ) ( not ( = ?auto_2530753 ?auto_2530756 ) ) ( not ( = ?auto_2530753 ?auto_2530758 ) ) ( not ( = ?auto_2530754 ?auto_2530751 ) ) ( not ( = ?auto_2530754 ?auto_2530755 ) ) ( not ( = ?auto_2530754 ?auto_2530757 ) ) ( not ( = ?auto_2530754 ?auto_2530756 ) ) ( not ( = ?auto_2530754 ?auto_2530758 ) ) ( not ( = ?auto_2530751 ?auto_2530755 ) ) ( not ( = ?auto_2530751 ?auto_2530757 ) ) ( not ( = ?auto_2530751 ?auto_2530756 ) ) ( not ( = ?auto_2530751 ?auto_2530758 ) ) ( not ( = ?auto_2530755 ?auto_2530757 ) ) ( not ( = ?auto_2530755 ?auto_2530756 ) ) ( not ( = ?auto_2530755 ?auto_2530758 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2530757 ?auto_2530756 ?auto_2530758 )
      ( MAKE-7CRATE-VERIFY ?auto_2530752 ?auto_2530753 ?auto_2530754 ?auto_2530751 ?auto_2530755 ?auto_2530757 ?auto_2530756 ?auto_2530758 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2530822 - SURFACE
      ?auto_2530823 - SURFACE
      ?auto_2530824 - SURFACE
      ?auto_2530821 - SURFACE
      ?auto_2530825 - SURFACE
      ?auto_2530827 - SURFACE
      ?auto_2530826 - SURFACE
      ?auto_2530828 - SURFACE
    )
    :vars
    (
      ?auto_2530832 - HOIST
      ?auto_2530830 - PLACE
      ?auto_2530829 - TRUCK
      ?auto_2530833 - PLACE
      ?auto_2530831 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2530832 ?auto_2530830 ) ( SURFACE-AT ?auto_2530826 ?auto_2530830 ) ( CLEAR ?auto_2530826 ) ( IS-CRATE ?auto_2530828 ) ( not ( = ?auto_2530826 ?auto_2530828 ) ) ( AVAILABLE ?auto_2530832 ) ( ON ?auto_2530826 ?auto_2530827 ) ( not ( = ?auto_2530827 ?auto_2530826 ) ) ( not ( = ?auto_2530827 ?auto_2530828 ) ) ( TRUCK-AT ?auto_2530829 ?auto_2530833 ) ( not ( = ?auto_2530833 ?auto_2530830 ) ) ( HOIST-AT ?auto_2530831 ?auto_2530833 ) ( LIFTING ?auto_2530831 ?auto_2530828 ) ( not ( = ?auto_2530832 ?auto_2530831 ) ) ( ON ?auto_2530823 ?auto_2530822 ) ( ON ?auto_2530824 ?auto_2530823 ) ( ON ?auto_2530821 ?auto_2530824 ) ( ON ?auto_2530825 ?auto_2530821 ) ( ON ?auto_2530827 ?auto_2530825 ) ( not ( = ?auto_2530822 ?auto_2530823 ) ) ( not ( = ?auto_2530822 ?auto_2530824 ) ) ( not ( = ?auto_2530822 ?auto_2530821 ) ) ( not ( = ?auto_2530822 ?auto_2530825 ) ) ( not ( = ?auto_2530822 ?auto_2530827 ) ) ( not ( = ?auto_2530822 ?auto_2530826 ) ) ( not ( = ?auto_2530822 ?auto_2530828 ) ) ( not ( = ?auto_2530823 ?auto_2530824 ) ) ( not ( = ?auto_2530823 ?auto_2530821 ) ) ( not ( = ?auto_2530823 ?auto_2530825 ) ) ( not ( = ?auto_2530823 ?auto_2530827 ) ) ( not ( = ?auto_2530823 ?auto_2530826 ) ) ( not ( = ?auto_2530823 ?auto_2530828 ) ) ( not ( = ?auto_2530824 ?auto_2530821 ) ) ( not ( = ?auto_2530824 ?auto_2530825 ) ) ( not ( = ?auto_2530824 ?auto_2530827 ) ) ( not ( = ?auto_2530824 ?auto_2530826 ) ) ( not ( = ?auto_2530824 ?auto_2530828 ) ) ( not ( = ?auto_2530821 ?auto_2530825 ) ) ( not ( = ?auto_2530821 ?auto_2530827 ) ) ( not ( = ?auto_2530821 ?auto_2530826 ) ) ( not ( = ?auto_2530821 ?auto_2530828 ) ) ( not ( = ?auto_2530825 ?auto_2530827 ) ) ( not ( = ?auto_2530825 ?auto_2530826 ) ) ( not ( = ?auto_2530825 ?auto_2530828 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2530827 ?auto_2530826 ?auto_2530828 )
      ( MAKE-7CRATE-VERIFY ?auto_2530822 ?auto_2530823 ?auto_2530824 ?auto_2530821 ?auto_2530825 ?auto_2530827 ?auto_2530826 ?auto_2530828 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2530899 - SURFACE
      ?auto_2530900 - SURFACE
      ?auto_2530901 - SURFACE
      ?auto_2530898 - SURFACE
      ?auto_2530902 - SURFACE
      ?auto_2530904 - SURFACE
      ?auto_2530903 - SURFACE
      ?auto_2530905 - SURFACE
    )
    :vars
    (
      ?auto_2530908 - HOIST
      ?auto_2530906 - PLACE
      ?auto_2530909 - TRUCK
      ?auto_2530910 - PLACE
      ?auto_2530907 - HOIST
      ?auto_2530911 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2530908 ?auto_2530906 ) ( SURFACE-AT ?auto_2530903 ?auto_2530906 ) ( CLEAR ?auto_2530903 ) ( IS-CRATE ?auto_2530905 ) ( not ( = ?auto_2530903 ?auto_2530905 ) ) ( AVAILABLE ?auto_2530908 ) ( ON ?auto_2530903 ?auto_2530904 ) ( not ( = ?auto_2530904 ?auto_2530903 ) ) ( not ( = ?auto_2530904 ?auto_2530905 ) ) ( TRUCK-AT ?auto_2530909 ?auto_2530910 ) ( not ( = ?auto_2530910 ?auto_2530906 ) ) ( HOIST-AT ?auto_2530907 ?auto_2530910 ) ( not ( = ?auto_2530908 ?auto_2530907 ) ) ( AVAILABLE ?auto_2530907 ) ( SURFACE-AT ?auto_2530905 ?auto_2530910 ) ( ON ?auto_2530905 ?auto_2530911 ) ( CLEAR ?auto_2530905 ) ( not ( = ?auto_2530903 ?auto_2530911 ) ) ( not ( = ?auto_2530905 ?auto_2530911 ) ) ( not ( = ?auto_2530904 ?auto_2530911 ) ) ( ON ?auto_2530900 ?auto_2530899 ) ( ON ?auto_2530901 ?auto_2530900 ) ( ON ?auto_2530898 ?auto_2530901 ) ( ON ?auto_2530902 ?auto_2530898 ) ( ON ?auto_2530904 ?auto_2530902 ) ( not ( = ?auto_2530899 ?auto_2530900 ) ) ( not ( = ?auto_2530899 ?auto_2530901 ) ) ( not ( = ?auto_2530899 ?auto_2530898 ) ) ( not ( = ?auto_2530899 ?auto_2530902 ) ) ( not ( = ?auto_2530899 ?auto_2530904 ) ) ( not ( = ?auto_2530899 ?auto_2530903 ) ) ( not ( = ?auto_2530899 ?auto_2530905 ) ) ( not ( = ?auto_2530899 ?auto_2530911 ) ) ( not ( = ?auto_2530900 ?auto_2530901 ) ) ( not ( = ?auto_2530900 ?auto_2530898 ) ) ( not ( = ?auto_2530900 ?auto_2530902 ) ) ( not ( = ?auto_2530900 ?auto_2530904 ) ) ( not ( = ?auto_2530900 ?auto_2530903 ) ) ( not ( = ?auto_2530900 ?auto_2530905 ) ) ( not ( = ?auto_2530900 ?auto_2530911 ) ) ( not ( = ?auto_2530901 ?auto_2530898 ) ) ( not ( = ?auto_2530901 ?auto_2530902 ) ) ( not ( = ?auto_2530901 ?auto_2530904 ) ) ( not ( = ?auto_2530901 ?auto_2530903 ) ) ( not ( = ?auto_2530901 ?auto_2530905 ) ) ( not ( = ?auto_2530901 ?auto_2530911 ) ) ( not ( = ?auto_2530898 ?auto_2530902 ) ) ( not ( = ?auto_2530898 ?auto_2530904 ) ) ( not ( = ?auto_2530898 ?auto_2530903 ) ) ( not ( = ?auto_2530898 ?auto_2530905 ) ) ( not ( = ?auto_2530898 ?auto_2530911 ) ) ( not ( = ?auto_2530902 ?auto_2530904 ) ) ( not ( = ?auto_2530902 ?auto_2530903 ) ) ( not ( = ?auto_2530902 ?auto_2530905 ) ) ( not ( = ?auto_2530902 ?auto_2530911 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2530904 ?auto_2530903 ?auto_2530905 )
      ( MAKE-7CRATE-VERIFY ?auto_2530899 ?auto_2530900 ?auto_2530901 ?auto_2530898 ?auto_2530902 ?auto_2530904 ?auto_2530903 ?auto_2530905 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2530977 - SURFACE
      ?auto_2530978 - SURFACE
      ?auto_2530979 - SURFACE
      ?auto_2530976 - SURFACE
      ?auto_2530980 - SURFACE
      ?auto_2530982 - SURFACE
      ?auto_2530981 - SURFACE
      ?auto_2530983 - SURFACE
    )
    :vars
    (
      ?auto_2530984 - HOIST
      ?auto_2530986 - PLACE
      ?auto_2530988 - PLACE
      ?auto_2530985 - HOIST
      ?auto_2530987 - SURFACE
      ?auto_2530989 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2530984 ?auto_2530986 ) ( SURFACE-AT ?auto_2530981 ?auto_2530986 ) ( CLEAR ?auto_2530981 ) ( IS-CRATE ?auto_2530983 ) ( not ( = ?auto_2530981 ?auto_2530983 ) ) ( AVAILABLE ?auto_2530984 ) ( ON ?auto_2530981 ?auto_2530982 ) ( not ( = ?auto_2530982 ?auto_2530981 ) ) ( not ( = ?auto_2530982 ?auto_2530983 ) ) ( not ( = ?auto_2530988 ?auto_2530986 ) ) ( HOIST-AT ?auto_2530985 ?auto_2530988 ) ( not ( = ?auto_2530984 ?auto_2530985 ) ) ( AVAILABLE ?auto_2530985 ) ( SURFACE-AT ?auto_2530983 ?auto_2530988 ) ( ON ?auto_2530983 ?auto_2530987 ) ( CLEAR ?auto_2530983 ) ( not ( = ?auto_2530981 ?auto_2530987 ) ) ( not ( = ?auto_2530983 ?auto_2530987 ) ) ( not ( = ?auto_2530982 ?auto_2530987 ) ) ( TRUCK-AT ?auto_2530989 ?auto_2530986 ) ( ON ?auto_2530978 ?auto_2530977 ) ( ON ?auto_2530979 ?auto_2530978 ) ( ON ?auto_2530976 ?auto_2530979 ) ( ON ?auto_2530980 ?auto_2530976 ) ( ON ?auto_2530982 ?auto_2530980 ) ( not ( = ?auto_2530977 ?auto_2530978 ) ) ( not ( = ?auto_2530977 ?auto_2530979 ) ) ( not ( = ?auto_2530977 ?auto_2530976 ) ) ( not ( = ?auto_2530977 ?auto_2530980 ) ) ( not ( = ?auto_2530977 ?auto_2530982 ) ) ( not ( = ?auto_2530977 ?auto_2530981 ) ) ( not ( = ?auto_2530977 ?auto_2530983 ) ) ( not ( = ?auto_2530977 ?auto_2530987 ) ) ( not ( = ?auto_2530978 ?auto_2530979 ) ) ( not ( = ?auto_2530978 ?auto_2530976 ) ) ( not ( = ?auto_2530978 ?auto_2530980 ) ) ( not ( = ?auto_2530978 ?auto_2530982 ) ) ( not ( = ?auto_2530978 ?auto_2530981 ) ) ( not ( = ?auto_2530978 ?auto_2530983 ) ) ( not ( = ?auto_2530978 ?auto_2530987 ) ) ( not ( = ?auto_2530979 ?auto_2530976 ) ) ( not ( = ?auto_2530979 ?auto_2530980 ) ) ( not ( = ?auto_2530979 ?auto_2530982 ) ) ( not ( = ?auto_2530979 ?auto_2530981 ) ) ( not ( = ?auto_2530979 ?auto_2530983 ) ) ( not ( = ?auto_2530979 ?auto_2530987 ) ) ( not ( = ?auto_2530976 ?auto_2530980 ) ) ( not ( = ?auto_2530976 ?auto_2530982 ) ) ( not ( = ?auto_2530976 ?auto_2530981 ) ) ( not ( = ?auto_2530976 ?auto_2530983 ) ) ( not ( = ?auto_2530976 ?auto_2530987 ) ) ( not ( = ?auto_2530980 ?auto_2530982 ) ) ( not ( = ?auto_2530980 ?auto_2530981 ) ) ( not ( = ?auto_2530980 ?auto_2530983 ) ) ( not ( = ?auto_2530980 ?auto_2530987 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2530982 ?auto_2530981 ?auto_2530983 )
      ( MAKE-7CRATE-VERIFY ?auto_2530977 ?auto_2530978 ?auto_2530979 ?auto_2530976 ?auto_2530980 ?auto_2530982 ?auto_2530981 ?auto_2530983 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2531055 - SURFACE
      ?auto_2531056 - SURFACE
      ?auto_2531057 - SURFACE
      ?auto_2531054 - SURFACE
      ?auto_2531058 - SURFACE
      ?auto_2531060 - SURFACE
      ?auto_2531059 - SURFACE
      ?auto_2531061 - SURFACE
    )
    :vars
    (
      ?auto_2531066 - HOIST
      ?auto_2531067 - PLACE
      ?auto_2531065 - PLACE
      ?auto_2531063 - HOIST
      ?auto_2531062 - SURFACE
      ?auto_2531064 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2531066 ?auto_2531067 ) ( IS-CRATE ?auto_2531061 ) ( not ( = ?auto_2531059 ?auto_2531061 ) ) ( not ( = ?auto_2531060 ?auto_2531059 ) ) ( not ( = ?auto_2531060 ?auto_2531061 ) ) ( not ( = ?auto_2531065 ?auto_2531067 ) ) ( HOIST-AT ?auto_2531063 ?auto_2531065 ) ( not ( = ?auto_2531066 ?auto_2531063 ) ) ( AVAILABLE ?auto_2531063 ) ( SURFACE-AT ?auto_2531061 ?auto_2531065 ) ( ON ?auto_2531061 ?auto_2531062 ) ( CLEAR ?auto_2531061 ) ( not ( = ?auto_2531059 ?auto_2531062 ) ) ( not ( = ?auto_2531061 ?auto_2531062 ) ) ( not ( = ?auto_2531060 ?auto_2531062 ) ) ( TRUCK-AT ?auto_2531064 ?auto_2531067 ) ( SURFACE-AT ?auto_2531060 ?auto_2531067 ) ( CLEAR ?auto_2531060 ) ( LIFTING ?auto_2531066 ?auto_2531059 ) ( IS-CRATE ?auto_2531059 ) ( ON ?auto_2531056 ?auto_2531055 ) ( ON ?auto_2531057 ?auto_2531056 ) ( ON ?auto_2531054 ?auto_2531057 ) ( ON ?auto_2531058 ?auto_2531054 ) ( ON ?auto_2531060 ?auto_2531058 ) ( not ( = ?auto_2531055 ?auto_2531056 ) ) ( not ( = ?auto_2531055 ?auto_2531057 ) ) ( not ( = ?auto_2531055 ?auto_2531054 ) ) ( not ( = ?auto_2531055 ?auto_2531058 ) ) ( not ( = ?auto_2531055 ?auto_2531060 ) ) ( not ( = ?auto_2531055 ?auto_2531059 ) ) ( not ( = ?auto_2531055 ?auto_2531061 ) ) ( not ( = ?auto_2531055 ?auto_2531062 ) ) ( not ( = ?auto_2531056 ?auto_2531057 ) ) ( not ( = ?auto_2531056 ?auto_2531054 ) ) ( not ( = ?auto_2531056 ?auto_2531058 ) ) ( not ( = ?auto_2531056 ?auto_2531060 ) ) ( not ( = ?auto_2531056 ?auto_2531059 ) ) ( not ( = ?auto_2531056 ?auto_2531061 ) ) ( not ( = ?auto_2531056 ?auto_2531062 ) ) ( not ( = ?auto_2531057 ?auto_2531054 ) ) ( not ( = ?auto_2531057 ?auto_2531058 ) ) ( not ( = ?auto_2531057 ?auto_2531060 ) ) ( not ( = ?auto_2531057 ?auto_2531059 ) ) ( not ( = ?auto_2531057 ?auto_2531061 ) ) ( not ( = ?auto_2531057 ?auto_2531062 ) ) ( not ( = ?auto_2531054 ?auto_2531058 ) ) ( not ( = ?auto_2531054 ?auto_2531060 ) ) ( not ( = ?auto_2531054 ?auto_2531059 ) ) ( not ( = ?auto_2531054 ?auto_2531061 ) ) ( not ( = ?auto_2531054 ?auto_2531062 ) ) ( not ( = ?auto_2531058 ?auto_2531060 ) ) ( not ( = ?auto_2531058 ?auto_2531059 ) ) ( not ( = ?auto_2531058 ?auto_2531061 ) ) ( not ( = ?auto_2531058 ?auto_2531062 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2531060 ?auto_2531059 ?auto_2531061 )
      ( MAKE-7CRATE-VERIFY ?auto_2531055 ?auto_2531056 ?auto_2531057 ?auto_2531054 ?auto_2531058 ?auto_2531060 ?auto_2531059 ?auto_2531061 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2531133 - SURFACE
      ?auto_2531134 - SURFACE
      ?auto_2531135 - SURFACE
      ?auto_2531132 - SURFACE
      ?auto_2531136 - SURFACE
      ?auto_2531138 - SURFACE
      ?auto_2531137 - SURFACE
      ?auto_2531139 - SURFACE
    )
    :vars
    (
      ?auto_2531140 - HOIST
      ?auto_2531143 - PLACE
      ?auto_2531144 - PLACE
      ?auto_2531142 - HOIST
      ?auto_2531145 - SURFACE
      ?auto_2531141 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2531140 ?auto_2531143 ) ( IS-CRATE ?auto_2531139 ) ( not ( = ?auto_2531137 ?auto_2531139 ) ) ( not ( = ?auto_2531138 ?auto_2531137 ) ) ( not ( = ?auto_2531138 ?auto_2531139 ) ) ( not ( = ?auto_2531144 ?auto_2531143 ) ) ( HOIST-AT ?auto_2531142 ?auto_2531144 ) ( not ( = ?auto_2531140 ?auto_2531142 ) ) ( AVAILABLE ?auto_2531142 ) ( SURFACE-AT ?auto_2531139 ?auto_2531144 ) ( ON ?auto_2531139 ?auto_2531145 ) ( CLEAR ?auto_2531139 ) ( not ( = ?auto_2531137 ?auto_2531145 ) ) ( not ( = ?auto_2531139 ?auto_2531145 ) ) ( not ( = ?auto_2531138 ?auto_2531145 ) ) ( TRUCK-AT ?auto_2531141 ?auto_2531143 ) ( SURFACE-AT ?auto_2531138 ?auto_2531143 ) ( CLEAR ?auto_2531138 ) ( IS-CRATE ?auto_2531137 ) ( AVAILABLE ?auto_2531140 ) ( IN ?auto_2531137 ?auto_2531141 ) ( ON ?auto_2531134 ?auto_2531133 ) ( ON ?auto_2531135 ?auto_2531134 ) ( ON ?auto_2531132 ?auto_2531135 ) ( ON ?auto_2531136 ?auto_2531132 ) ( ON ?auto_2531138 ?auto_2531136 ) ( not ( = ?auto_2531133 ?auto_2531134 ) ) ( not ( = ?auto_2531133 ?auto_2531135 ) ) ( not ( = ?auto_2531133 ?auto_2531132 ) ) ( not ( = ?auto_2531133 ?auto_2531136 ) ) ( not ( = ?auto_2531133 ?auto_2531138 ) ) ( not ( = ?auto_2531133 ?auto_2531137 ) ) ( not ( = ?auto_2531133 ?auto_2531139 ) ) ( not ( = ?auto_2531133 ?auto_2531145 ) ) ( not ( = ?auto_2531134 ?auto_2531135 ) ) ( not ( = ?auto_2531134 ?auto_2531132 ) ) ( not ( = ?auto_2531134 ?auto_2531136 ) ) ( not ( = ?auto_2531134 ?auto_2531138 ) ) ( not ( = ?auto_2531134 ?auto_2531137 ) ) ( not ( = ?auto_2531134 ?auto_2531139 ) ) ( not ( = ?auto_2531134 ?auto_2531145 ) ) ( not ( = ?auto_2531135 ?auto_2531132 ) ) ( not ( = ?auto_2531135 ?auto_2531136 ) ) ( not ( = ?auto_2531135 ?auto_2531138 ) ) ( not ( = ?auto_2531135 ?auto_2531137 ) ) ( not ( = ?auto_2531135 ?auto_2531139 ) ) ( not ( = ?auto_2531135 ?auto_2531145 ) ) ( not ( = ?auto_2531132 ?auto_2531136 ) ) ( not ( = ?auto_2531132 ?auto_2531138 ) ) ( not ( = ?auto_2531132 ?auto_2531137 ) ) ( not ( = ?auto_2531132 ?auto_2531139 ) ) ( not ( = ?auto_2531132 ?auto_2531145 ) ) ( not ( = ?auto_2531136 ?auto_2531138 ) ) ( not ( = ?auto_2531136 ?auto_2531137 ) ) ( not ( = ?auto_2531136 ?auto_2531139 ) ) ( not ( = ?auto_2531136 ?auto_2531145 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2531138 ?auto_2531137 ?auto_2531139 )
      ( MAKE-7CRATE-VERIFY ?auto_2531133 ?auto_2531134 ?auto_2531135 ?auto_2531132 ?auto_2531136 ?auto_2531138 ?auto_2531137 ?auto_2531139 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2534052 - SURFACE
      ?auto_2534053 - SURFACE
      ?auto_2534054 - SURFACE
      ?auto_2534051 - SURFACE
      ?auto_2534055 - SURFACE
      ?auto_2534057 - SURFACE
      ?auto_2534056 - SURFACE
      ?auto_2534058 - SURFACE
      ?auto_2534059 - SURFACE
    )
    :vars
    (
      ?auto_2534061 - HOIST
      ?auto_2534060 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534061 ?auto_2534060 ) ( SURFACE-AT ?auto_2534058 ?auto_2534060 ) ( CLEAR ?auto_2534058 ) ( LIFTING ?auto_2534061 ?auto_2534059 ) ( IS-CRATE ?auto_2534059 ) ( not ( = ?auto_2534058 ?auto_2534059 ) ) ( ON ?auto_2534053 ?auto_2534052 ) ( ON ?auto_2534054 ?auto_2534053 ) ( ON ?auto_2534051 ?auto_2534054 ) ( ON ?auto_2534055 ?auto_2534051 ) ( ON ?auto_2534057 ?auto_2534055 ) ( ON ?auto_2534056 ?auto_2534057 ) ( ON ?auto_2534058 ?auto_2534056 ) ( not ( = ?auto_2534052 ?auto_2534053 ) ) ( not ( = ?auto_2534052 ?auto_2534054 ) ) ( not ( = ?auto_2534052 ?auto_2534051 ) ) ( not ( = ?auto_2534052 ?auto_2534055 ) ) ( not ( = ?auto_2534052 ?auto_2534057 ) ) ( not ( = ?auto_2534052 ?auto_2534056 ) ) ( not ( = ?auto_2534052 ?auto_2534058 ) ) ( not ( = ?auto_2534052 ?auto_2534059 ) ) ( not ( = ?auto_2534053 ?auto_2534054 ) ) ( not ( = ?auto_2534053 ?auto_2534051 ) ) ( not ( = ?auto_2534053 ?auto_2534055 ) ) ( not ( = ?auto_2534053 ?auto_2534057 ) ) ( not ( = ?auto_2534053 ?auto_2534056 ) ) ( not ( = ?auto_2534053 ?auto_2534058 ) ) ( not ( = ?auto_2534053 ?auto_2534059 ) ) ( not ( = ?auto_2534054 ?auto_2534051 ) ) ( not ( = ?auto_2534054 ?auto_2534055 ) ) ( not ( = ?auto_2534054 ?auto_2534057 ) ) ( not ( = ?auto_2534054 ?auto_2534056 ) ) ( not ( = ?auto_2534054 ?auto_2534058 ) ) ( not ( = ?auto_2534054 ?auto_2534059 ) ) ( not ( = ?auto_2534051 ?auto_2534055 ) ) ( not ( = ?auto_2534051 ?auto_2534057 ) ) ( not ( = ?auto_2534051 ?auto_2534056 ) ) ( not ( = ?auto_2534051 ?auto_2534058 ) ) ( not ( = ?auto_2534051 ?auto_2534059 ) ) ( not ( = ?auto_2534055 ?auto_2534057 ) ) ( not ( = ?auto_2534055 ?auto_2534056 ) ) ( not ( = ?auto_2534055 ?auto_2534058 ) ) ( not ( = ?auto_2534055 ?auto_2534059 ) ) ( not ( = ?auto_2534057 ?auto_2534056 ) ) ( not ( = ?auto_2534057 ?auto_2534058 ) ) ( not ( = ?auto_2534057 ?auto_2534059 ) ) ( not ( = ?auto_2534056 ?auto_2534058 ) ) ( not ( = ?auto_2534056 ?auto_2534059 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2534058 ?auto_2534059 )
      ( MAKE-8CRATE-VERIFY ?auto_2534052 ?auto_2534053 ?auto_2534054 ?auto_2534051 ?auto_2534055 ?auto_2534057 ?auto_2534056 ?auto_2534058 ?auto_2534059 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2534119 - SURFACE
      ?auto_2534120 - SURFACE
      ?auto_2534121 - SURFACE
      ?auto_2534118 - SURFACE
      ?auto_2534122 - SURFACE
      ?auto_2534124 - SURFACE
      ?auto_2534123 - SURFACE
      ?auto_2534125 - SURFACE
      ?auto_2534126 - SURFACE
    )
    :vars
    (
      ?auto_2534127 - HOIST
      ?auto_2534129 - PLACE
      ?auto_2534128 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534127 ?auto_2534129 ) ( SURFACE-AT ?auto_2534125 ?auto_2534129 ) ( CLEAR ?auto_2534125 ) ( IS-CRATE ?auto_2534126 ) ( not ( = ?auto_2534125 ?auto_2534126 ) ) ( TRUCK-AT ?auto_2534128 ?auto_2534129 ) ( AVAILABLE ?auto_2534127 ) ( IN ?auto_2534126 ?auto_2534128 ) ( ON ?auto_2534125 ?auto_2534123 ) ( not ( = ?auto_2534123 ?auto_2534125 ) ) ( not ( = ?auto_2534123 ?auto_2534126 ) ) ( ON ?auto_2534120 ?auto_2534119 ) ( ON ?auto_2534121 ?auto_2534120 ) ( ON ?auto_2534118 ?auto_2534121 ) ( ON ?auto_2534122 ?auto_2534118 ) ( ON ?auto_2534124 ?auto_2534122 ) ( ON ?auto_2534123 ?auto_2534124 ) ( not ( = ?auto_2534119 ?auto_2534120 ) ) ( not ( = ?auto_2534119 ?auto_2534121 ) ) ( not ( = ?auto_2534119 ?auto_2534118 ) ) ( not ( = ?auto_2534119 ?auto_2534122 ) ) ( not ( = ?auto_2534119 ?auto_2534124 ) ) ( not ( = ?auto_2534119 ?auto_2534123 ) ) ( not ( = ?auto_2534119 ?auto_2534125 ) ) ( not ( = ?auto_2534119 ?auto_2534126 ) ) ( not ( = ?auto_2534120 ?auto_2534121 ) ) ( not ( = ?auto_2534120 ?auto_2534118 ) ) ( not ( = ?auto_2534120 ?auto_2534122 ) ) ( not ( = ?auto_2534120 ?auto_2534124 ) ) ( not ( = ?auto_2534120 ?auto_2534123 ) ) ( not ( = ?auto_2534120 ?auto_2534125 ) ) ( not ( = ?auto_2534120 ?auto_2534126 ) ) ( not ( = ?auto_2534121 ?auto_2534118 ) ) ( not ( = ?auto_2534121 ?auto_2534122 ) ) ( not ( = ?auto_2534121 ?auto_2534124 ) ) ( not ( = ?auto_2534121 ?auto_2534123 ) ) ( not ( = ?auto_2534121 ?auto_2534125 ) ) ( not ( = ?auto_2534121 ?auto_2534126 ) ) ( not ( = ?auto_2534118 ?auto_2534122 ) ) ( not ( = ?auto_2534118 ?auto_2534124 ) ) ( not ( = ?auto_2534118 ?auto_2534123 ) ) ( not ( = ?auto_2534118 ?auto_2534125 ) ) ( not ( = ?auto_2534118 ?auto_2534126 ) ) ( not ( = ?auto_2534122 ?auto_2534124 ) ) ( not ( = ?auto_2534122 ?auto_2534123 ) ) ( not ( = ?auto_2534122 ?auto_2534125 ) ) ( not ( = ?auto_2534122 ?auto_2534126 ) ) ( not ( = ?auto_2534124 ?auto_2534123 ) ) ( not ( = ?auto_2534124 ?auto_2534125 ) ) ( not ( = ?auto_2534124 ?auto_2534126 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2534123 ?auto_2534125 ?auto_2534126 )
      ( MAKE-8CRATE-VERIFY ?auto_2534119 ?auto_2534120 ?auto_2534121 ?auto_2534118 ?auto_2534122 ?auto_2534124 ?auto_2534123 ?auto_2534125 ?auto_2534126 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2534195 - SURFACE
      ?auto_2534196 - SURFACE
      ?auto_2534197 - SURFACE
      ?auto_2534194 - SURFACE
      ?auto_2534198 - SURFACE
      ?auto_2534200 - SURFACE
      ?auto_2534199 - SURFACE
      ?auto_2534201 - SURFACE
      ?auto_2534202 - SURFACE
    )
    :vars
    (
      ?auto_2534203 - HOIST
      ?auto_2534205 - PLACE
      ?auto_2534206 - TRUCK
      ?auto_2534204 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534203 ?auto_2534205 ) ( SURFACE-AT ?auto_2534201 ?auto_2534205 ) ( CLEAR ?auto_2534201 ) ( IS-CRATE ?auto_2534202 ) ( not ( = ?auto_2534201 ?auto_2534202 ) ) ( AVAILABLE ?auto_2534203 ) ( IN ?auto_2534202 ?auto_2534206 ) ( ON ?auto_2534201 ?auto_2534199 ) ( not ( = ?auto_2534199 ?auto_2534201 ) ) ( not ( = ?auto_2534199 ?auto_2534202 ) ) ( TRUCK-AT ?auto_2534206 ?auto_2534204 ) ( not ( = ?auto_2534204 ?auto_2534205 ) ) ( ON ?auto_2534196 ?auto_2534195 ) ( ON ?auto_2534197 ?auto_2534196 ) ( ON ?auto_2534194 ?auto_2534197 ) ( ON ?auto_2534198 ?auto_2534194 ) ( ON ?auto_2534200 ?auto_2534198 ) ( ON ?auto_2534199 ?auto_2534200 ) ( not ( = ?auto_2534195 ?auto_2534196 ) ) ( not ( = ?auto_2534195 ?auto_2534197 ) ) ( not ( = ?auto_2534195 ?auto_2534194 ) ) ( not ( = ?auto_2534195 ?auto_2534198 ) ) ( not ( = ?auto_2534195 ?auto_2534200 ) ) ( not ( = ?auto_2534195 ?auto_2534199 ) ) ( not ( = ?auto_2534195 ?auto_2534201 ) ) ( not ( = ?auto_2534195 ?auto_2534202 ) ) ( not ( = ?auto_2534196 ?auto_2534197 ) ) ( not ( = ?auto_2534196 ?auto_2534194 ) ) ( not ( = ?auto_2534196 ?auto_2534198 ) ) ( not ( = ?auto_2534196 ?auto_2534200 ) ) ( not ( = ?auto_2534196 ?auto_2534199 ) ) ( not ( = ?auto_2534196 ?auto_2534201 ) ) ( not ( = ?auto_2534196 ?auto_2534202 ) ) ( not ( = ?auto_2534197 ?auto_2534194 ) ) ( not ( = ?auto_2534197 ?auto_2534198 ) ) ( not ( = ?auto_2534197 ?auto_2534200 ) ) ( not ( = ?auto_2534197 ?auto_2534199 ) ) ( not ( = ?auto_2534197 ?auto_2534201 ) ) ( not ( = ?auto_2534197 ?auto_2534202 ) ) ( not ( = ?auto_2534194 ?auto_2534198 ) ) ( not ( = ?auto_2534194 ?auto_2534200 ) ) ( not ( = ?auto_2534194 ?auto_2534199 ) ) ( not ( = ?auto_2534194 ?auto_2534201 ) ) ( not ( = ?auto_2534194 ?auto_2534202 ) ) ( not ( = ?auto_2534198 ?auto_2534200 ) ) ( not ( = ?auto_2534198 ?auto_2534199 ) ) ( not ( = ?auto_2534198 ?auto_2534201 ) ) ( not ( = ?auto_2534198 ?auto_2534202 ) ) ( not ( = ?auto_2534200 ?auto_2534199 ) ) ( not ( = ?auto_2534200 ?auto_2534201 ) ) ( not ( = ?auto_2534200 ?auto_2534202 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2534199 ?auto_2534201 ?auto_2534202 )
      ( MAKE-8CRATE-VERIFY ?auto_2534195 ?auto_2534196 ?auto_2534197 ?auto_2534194 ?auto_2534198 ?auto_2534200 ?auto_2534199 ?auto_2534201 ?auto_2534202 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2534279 - SURFACE
      ?auto_2534280 - SURFACE
      ?auto_2534281 - SURFACE
      ?auto_2534278 - SURFACE
      ?auto_2534282 - SURFACE
      ?auto_2534284 - SURFACE
      ?auto_2534283 - SURFACE
      ?auto_2534285 - SURFACE
      ?auto_2534286 - SURFACE
    )
    :vars
    (
      ?auto_2534287 - HOIST
      ?auto_2534288 - PLACE
      ?auto_2534289 - TRUCK
      ?auto_2534290 - PLACE
      ?auto_2534291 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534287 ?auto_2534288 ) ( SURFACE-AT ?auto_2534285 ?auto_2534288 ) ( CLEAR ?auto_2534285 ) ( IS-CRATE ?auto_2534286 ) ( not ( = ?auto_2534285 ?auto_2534286 ) ) ( AVAILABLE ?auto_2534287 ) ( ON ?auto_2534285 ?auto_2534283 ) ( not ( = ?auto_2534283 ?auto_2534285 ) ) ( not ( = ?auto_2534283 ?auto_2534286 ) ) ( TRUCK-AT ?auto_2534289 ?auto_2534290 ) ( not ( = ?auto_2534290 ?auto_2534288 ) ) ( HOIST-AT ?auto_2534291 ?auto_2534290 ) ( LIFTING ?auto_2534291 ?auto_2534286 ) ( not ( = ?auto_2534287 ?auto_2534291 ) ) ( ON ?auto_2534280 ?auto_2534279 ) ( ON ?auto_2534281 ?auto_2534280 ) ( ON ?auto_2534278 ?auto_2534281 ) ( ON ?auto_2534282 ?auto_2534278 ) ( ON ?auto_2534284 ?auto_2534282 ) ( ON ?auto_2534283 ?auto_2534284 ) ( not ( = ?auto_2534279 ?auto_2534280 ) ) ( not ( = ?auto_2534279 ?auto_2534281 ) ) ( not ( = ?auto_2534279 ?auto_2534278 ) ) ( not ( = ?auto_2534279 ?auto_2534282 ) ) ( not ( = ?auto_2534279 ?auto_2534284 ) ) ( not ( = ?auto_2534279 ?auto_2534283 ) ) ( not ( = ?auto_2534279 ?auto_2534285 ) ) ( not ( = ?auto_2534279 ?auto_2534286 ) ) ( not ( = ?auto_2534280 ?auto_2534281 ) ) ( not ( = ?auto_2534280 ?auto_2534278 ) ) ( not ( = ?auto_2534280 ?auto_2534282 ) ) ( not ( = ?auto_2534280 ?auto_2534284 ) ) ( not ( = ?auto_2534280 ?auto_2534283 ) ) ( not ( = ?auto_2534280 ?auto_2534285 ) ) ( not ( = ?auto_2534280 ?auto_2534286 ) ) ( not ( = ?auto_2534281 ?auto_2534278 ) ) ( not ( = ?auto_2534281 ?auto_2534282 ) ) ( not ( = ?auto_2534281 ?auto_2534284 ) ) ( not ( = ?auto_2534281 ?auto_2534283 ) ) ( not ( = ?auto_2534281 ?auto_2534285 ) ) ( not ( = ?auto_2534281 ?auto_2534286 ) ) ( not ( = ?auto_2534278 ?auto_2534282 ) ) ( not ( = ?auto_2534278 ?auto_2534284 ) ) ( not ( = ?auto_2534278 ?auto_2534283 ) ) ( not ( = ?auto_2534278 ?auto_2534285 ) ) ( not ( = ?auto_2534278 ?auto_2534286 ) ) ( not ( = ?auto_2534282 ?auto_2534284 ) ) ( not ( = ?auto_2534282 ?auto_2534283 ) ) ( not ( = ?auto_2534282 ?auto_2534285 ) ) ( not ( = ?auto_2534282 ?auto_2534286 ) ) ( not ( = ?auto_2534284 ?auto_2534283 ) ) ( not ( = ?auto_2534284 ?auto_2534285 ) ) ( not ( = ?auto_2534284 ?auto_2534286 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2534283 ?auto_2534285 ?auto_2534286 )
      ( MAKE-8CRATE-VERIFY ?auto_2534279 ?auto_2534280 ?auto_2534281 ?auto_2534278 ?auto_2534282 ?auto_2534284 ?auto_2534283 ?auto_2534285 ?auto_2534286 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2534371 - SURFACE
      ?auto_2534372 - SURFACE
      ?auto_2534373 - SURFACE
      ?auto_2534370 - SURFACE
      ?auto_2534374 - SURFACE
      ?auto_2534376 - SURFACE
      ?auto_2534375 - SURFACE
      ?auto_2534377 - SURFACE
      ?auto_2534378 - SURFACE
    )
    :vars
    (
      ?auto_2534383 - HOIST
      ?auto_2534381 - PLACE
      ?auto_2534379 - TRUCK
      ?auto_2534380 - PLACE
      ?auto_2534382 - HOIST
      ?auto_2534384 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534383 ?auto_2534381 ) ( SURFACE-AT ?auto_2534377 ?auto_2534381 ) ( CLEAR ?auto_2534377 ) ( IS-CRATE ?auto_2534378 ) ( not ( = ?auto_2534377 ?auto_2534378 ) ) ( AVAILABLE ?auto_2534383 ) ( ON ?auto_2534377 ?auto_2534375 ) ( not ( = ?auto_2534375 ?auto_2534377 ) ) ( not ( = ?auto_2534375 ?auto_2534378 ) ) ( TRUCK-AT ?auto_2534379 ?auto_2534380 ) ( not ( = ?auto_2534380 ?auto_2534381 ) ) ( HOIST-AT ?auto_2534382 ?auto_2534380 ) ( not ( = ?auto_2534383 ?auto_2534382 ) ) ( AVAILABLE ?auto_2534382 ) ( SURFACE-AT ?auto_2534378 ?auto_2534380 ) ( ON ?auto_2534378 ?auto_2534384 ) ( CLEAR ?auto_2534378 ) ( not ( = ?auto_2534377 ?auto_2534384 ) ) ( not ( = ?auto_2534378 ?auto_2534384 ) ) ( not ( = ?auto_2534375 ?auto_2534384 ) ) ( ON ?auto_2534372 ?auto_2534371 ) ( ON ?auto_2534373 ?auto_2534372 ) ( ON ?auto_2534370 ?auto_2534373 ) ( ON ?auto_2534374 ?auto_2534370 ) ( ON ?auto_2534376 ?auto_2534374 ) ( ON ?auto_2534375 ?auto_2534376 ) ( not ( = ?auto_2534371 ?auto_2534372 ) ) ( not ( = ?auto_2534371 ?auto_2534373 ) ) ( not ( = ?auto_2534371 ?auto_2534370 ) ) ( not ( = ?auto_2534371 ?auto_2534374 ) ) ( not ( = ?auto_2534371 ?auto_2534376 ) ) ( not ( = ?auto_2534371 ?auto_2534375 ) ) ( not ( = ?auto_2534371 ?auto_2534377 ) ) ( not ( = ?auto_2534371 ?auto_2534378 ) ) ( not ( = ?auto_2534371 ?auto_2534384 ) ) ( not ( = ?auto_2534372 ?auto_2534373 ) ) ( not ( = ?auto_2534372 ?auto_2534370 ) ) ( not ( = ?auto_2534372 ?auto_2534374 ) ) ( not ( = ?auto_2534372 ?auto_2534376 ) ) ( not ( = ?auto_2534372 ?auto_2534375 ) ) ( not ( = ?auto_2534372 ?auto_2534377 ) ) ( not ( = ?auto_2534372 ?auto_2534378 ) ) ( not ( = ?auto_2534372 ?auto_2534384 ) ) ( not ( = ?auto_2534373 ?auto_2534370 ) ) ( not ( = ?auto_2534373 ?auto_2534374 ) ) ( not ( = ?auto_2534373 ?auto_2534376 ) ) ( not ( = ?auto_2534373 ?auto_2534375 ) ) ( not ( = ?auto_2534373 ?auto_2534377 ) ) ( not ( = ?auto_2534373 ?auto_2534378 ) ) ( not ( = ?auto_2534373 ?auto_2534384 ) ) ( not ( = ?auto_2534370 ?auto_2534374 ) ) ( not ( = ?auto_2534370 ?auto_2534376 ) ) ( not ( = ?auto_2534370 ?auto_2534375 ) ) ( not ( = ?auto_2534370 ?auto_2534377 ) ) ( not ( = ?auto_2534370 ?auto_2534378 ) ) ( not ( = ?auto_2534370 ?auto_2534384 ) ) ( not ( = ?auto_2534374 ?auto_2534376 ) ) ( not ( = ?auto_2534374 ?auto_2534375 ) ) ( not ( = ?auto_2534374 ?auto_2534377 ) ) ( not ( = ?auto_2534374 ?auto_2534378 ) ) ( not ( = ?auto_2534374 ?auto_2534384 ) ) ( not ( = ?auto_2534376 ?auto_2534375 ) ) ( not ( = ?auto_2534376 ?auto_2534377 ) ) ( not ( = ?auto_2534376 ?auto_2534378 ) ) ( not ( = ?auto_2534376 ?auto_2534384 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2534375 ?auto_2534377 ?auto_2534378 )
      ( MAKE-8CRATE-VERIFY ?auto_2534371 ?auto_2534372 ?auto_2534373 ?auto_2534370 ?auto_2534374 ?auto_2534376 ?auto_2534375 ?auto_2534377 ?auto_2534378 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2534464 - SURFACE
      ?auto_2534465 - SURFACE
      ?auto_2534466 - SURFACE
      ?auto_2534463 - SURFACE
      ?auto_2534467 - SURFACE
      ?auto_2534469 - SURFACE
      ?auto_2534468 - SURFACE
      ?auto_2534470 - SURFACE
      ?auto_2534471 - SURFACE
    )
    :vars
    (
      ?auto_2534477 - HOIST
      ?auto_2534473 - PLACE
      ?auto_2534472 - PLACE
      ?auto_2534475 - HOIST
      ?auto_2534474 - SURFACE
      ?auto_2534476 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534477 ?auto_2534473 ) ( SURFACE-AT ?auto_2534470 ?auto_2534473 ) ( CLEAR ?auto_2534470 ) ( IS-CRATE ?auto_2534471 ) ( not ( = ?auto_2534470 ?auto_2534471 ) ) ( AVAILABLE ?auto_2534477 ) ( ON ?auto_2534470 ?auto_2534468 ) ( not ( = ?auto_2534468 ?auto_2534470 ) ) ( not ( = ?auto_2534468 ?auto_2534471 ) ) ( not ( = ?auto_2534472 ?auto_2534473 ) ) ( HOIST-AT ?auto_2534475 ?auto_2534472 ) ( not ( = ?auto_2534477 ?auto_2534475 ) ) ( AVAILABLE ?auto_2534475 ) ( SURFACE-AT ?auto_2534471 ?auto_2534472 ) ( ON ?auto_2534471 ?auto_2534474 ) ( CLEAR ?auto_2534471 ) ( not ( = ?auto_2534470 ?auto_2534474 ) ) ( not ( = ?auto_2534471 ?auto_2534474 ) ) ( not ( = ?auto_2534468 ?auto_2534474 ) ) ( TRUCK-AT ?auto_2534476 ?auto_2534473 ) ( ON ?auto_2534465 ?auto_2534464 ) ( ON ?auto_2534466 ?auto_2534465 ) ( ON ?auto_2534463 ?auto_2534466 ) ( ON ?auto_2534467 ?auto_2534463 ) ( ON ?auto_2534469 ?auto_2534467 ) ( ON ?auto_2534468 ?auto_2534469 ) ( not ( = ?auto_2534464 ?auto_2534465 ) ) ( not ( = ?auto_2534464 ?auto_2534466 ) ) ( not ( = ?auto_2534464 ?auto_2534463 ) ) ( not ( = ?auto_2534464 ?auto_2534467 ) ) ( not ( = ?auto_2534464 ?auto_2534469 ) ) ( not ( = ?auto_2534464 ?auto_2534468 ) ) ( not ( = ?auto_2534464 ?auto_2534470 ) ) ( not ( = ?auto_2534464 ?auto_2534471 ) ) ( not ( = ?auto_2534464 ?auto_2534474 ) ) ( not ( = ?auto_2534465 ?auto_2534466 ) ) ( not ( = ?auto_2534465 ?auto_2534463 ) ) ( not ( = ?auto_2534465 ?auto_2534467 ) ) ( not ( = ?auto_2534465 ?auto_2534469 ) ) ( not ( = ?auto_2534465 ?auto_2534468 ) ) ( not ( = ?auto_2534465 ?auto_2534470 ) ) ( not ( = ?auto_2534465 ?auto_2534471 ) ) ( not ( = ?auto_2534465 ?auto_2534474 ) ) ( not ( = ?auto_2534466 ?auto_2534463 ) ) ( not ( = ?auto_2534466 ?auto_2534467 ) ) ( not ( = ?auto_2534466 ?auto_2534469 ) ) ( not ( = ?auto_2534466 ?auto_2534468 ) ) ( not ( = ?auto_2534466 ?auto_2534470 ) ) ( not ( = ?auto_2534466 ?auto_2534471 ) ) ( not ( = ?auto_2534466 ?auto_2534474 ) ) ( not ( = ?auto_2534463 ?auto_2534467 ) ) ( not ( = ?auto_2534463 ?auto_2534469 ) ) ( not ( = ?auto_2534463 ?auto_2534468 ) ) ( not ( = ?auto_2534463 ?auto_2534470 ) ) ( not ( = ?auto_2534463 ?auto_2534471 ) ) ( not ( = ?auto_2534463 ?auto_2534474 ) ) ( not ( = ?auto_2534467 ?auto_2534469 ) ) ( not ( = ?auto_2534467 ?auto_2534468 ) ) ( not ( = ?auto_2534467 ?auto_2534470 ) ) ( not ( = ?auto_2534467 ?auto_2534471 ) ) ( not ( = ?auto_2534467 ?auto_2534474 ) ) ( not ( = ?auto_2534469 ?auto_2534468 ) ) ( not ( = ?auto_2534469 ?auto_2534470 ) ) ( not ( = ?auto_2534469 ?auto_2534471 ) ) ( not ( = ?auto_2534469 ?auto_2534474 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2534468 ?auto_2534470 ?auto_2534471 )
      ( MAKE-8CRATE-VERIFY ?auto_2534464 ?auto_2534465 ?auto_2534466 ?auto_2534463 ?auto_2534467 ?auto_2534469 ?auto_2534468 ?auto_2534470 ?auto_2534471 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2534557 - SURFACE
      ?auto_2534558 - SURFACE
      ?auto_2534559 - SURFACE
      ?auto_2534556 - SURFACE
      ?auto_2534560 - SURFACE
      ?auto_2534562 - SURFACE
      ?auto_2534561 - SURFACE
      ?auto_2534563 - SURFACE
      ?auto_2534564 - SURFACE
    )
    :vars
    (
      ?auto_2534565 - HOIST
      ?auto_2534569 - PLACE
      ?auto_2534570 - PLACE
      ?auto_2534568 - HOIST
      ?auto_2534567 - SURFACE
      ?auto_2534566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534565 ?auto_2534569 ) ( IS-CRATE ?auto_2534564 ) ( not ( = ?auto_2534563 ?auto_2534564 ) ) ( not ( = ?auto_2534561 ?auto_2534563 ) ) ( not ( = ?auto_2534561 ?auto_2534564 ) ) ( not ( = ?auto_2534570 ?auto_2534569 ) ) ( HOIST-AT ?auto_2534568 ?auto_2534570 ) ( not ( = ?auto_2534565 ?auto_2534568 ) ) ( AVAILABLE ?auto_2534568 ) ( SURFACE-AT ?auto_2534564 ?auto_2534570 ) ( ON ?auto_2534564 ?auto_2534567 ) ( CLEAR ?auto_2534564 ) ( not ( = ?auto_2534563 ?auto_2534567 ) ) ( not ( = ?auto_2534564 ?auto_2534567 ) ) ( not ( = ?auto_2534561 ?auto_2534567 ) ) ( TRUCK-AT ?auto_2534566 ?auto_2534569 ) ( SURFACE-AT ?auto_2534561 ?auto_2534569 ) ( CLEAR ?auto_2534561 ) ( LIFTING ?auto_2534565 ?auto_2534563 ) ( IS-CRATE ?auto_2534563 ) ( ON ?auto_2534558 ?auto_2534557 ) ( ON ?auto_2534559 ?auto_2534558 ) ( ON ?auto_2534556 ?auto_2534559 ) ( ON ?auto_2534560 ?auto_2534556 ) ( ON ?auto_2534562 ?auto_2534560 ) ( ON ?auto_2534561 ?auto_2534562 ) ( not ( = ?auto_2534557 ?auto_2534558 ) ) ( not ( = ?auto_2534557 ?auto_2534559 ) ) ( not ( = ?auto_2534557 ?auto_2534556 ) ) ( not ( = ?auto_2534557 ?auto_2534560 ) ) ( not ( = ?auto_2534557 ?auto_2534562 ) ) ( not ( = ?auto_2534557 ?auto_2534561 ) ) ( not ( = ?auto_2534557 ?auto_2534563 ) ) ( not ( = ?auto_2534557 ?auto_2534564 ) ) ( not ( = ?auto_2534557 ?auto_2534567 ) ) ( not ( = ?auto_2534558 ?auto_2534559 ) ) ( not ( = ?auto_2534558 ?auto_2534556 ) ) ( not ( = ?auto_2534558 ?auto_2534560 ) ) ( not ( = ?auto_2534558 ?auto_2534562 ) ) ( not ( = ?auto_2534558 ?auto_2534561 ) ) ( not ( = ?auto_2534558 ?auto_2534563 ) ) ( not ( = ?auto_2534558 ?auto_2534564 ) ) ( not ( = ?auto_2534558 ?auto_2534567 ) ) ( not ( = ?auto_2534559 ?auto_2534556 ) ) ( not ( = ?auto_2534559 ?auto_2534560 ) ) ( not ( = ?auto_2534559 ?auto_2534562 ) ) ( not ( = ?auto_2534559 ?auto_2534561 ) ) ( not ( = ?auto_2534559 ?auto_2534563 ) ) ( not ( = ?auto_2534559 ?auto_2534564 ) ) ( not ( = ?auto_2534559 ?auto_2534567 ) ) ( not ( = ?auto_2534556 ?auto_2534560 ) ) ( not ( = ?auto_2534556 ?auto_2534562 ) ) ( not ( = ?auto_2534556 ?auto_2534561 ) ) ( not ( = ?auto_2534556 ?auto_2534563 ) ) ( not ( = ?auto_2534556 ?auto_2534564 ) ) ( not ( = ?auto_2534556 ?auto_2534567 ) ) ( not ( = ?auto_2534560 ?auto_2534562 ) ) ( not ( = ?auto_2534560 ?auto_2534561 ) ) ( not ( = ?auto_2534560 ?auto_2534563 ) ) ( not ( = ?auto_2534560 ?auto_2534564 ) ) ( not ( = ?auto_2534560 ?auto_2534567 ) ) ( not ( = ?auto_2534562 ?auto_2534561 ) ) ( not ( = ?auto_2534562 ?auto_2534563 ) ) ( not ( = ?auto_2534562 ?auto_2534564 ) ) ( not ( = ?auto_2534562 ?auto_2534567 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2534561 ?auto_2534563 ?auto_2534564 )
      ( MAKE-8CRATE-VERIFY ?auto_2534557 ?auto_2534558 ?auto_2534559 ?auto_2534556 ?auto_2534560 ?auto_2534562 ?auto_2534561 ?auto_2534563 ?auto_2534564 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2534650 - SURFACE
      ?auto_2534651 - SURFACE
      ?auto_2534652 - SURFACE
      ?auto_2534649 - SURFACE
      ?auto_2534653 - SURFACE
      ?auto_2534655 - SURFACE
      ?auto_2534654 - SURFACE
      ?auto_2534656 - SURFACE
      ?auto_2534657 - SURFACE
    )
    :vars
    (
      ?auto_2534659 - HOIST
      ?auto_2534663 - PLACE
      ?auto_2534662 - PLACE
      ?auto_2534661 - HOIST
      ?auto_2534658 - SURFACE
      ?auto_2534660 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534659 ?auto_2534663 ) ( IS-CRATE ?auto_2534657 ) ( not ( = ?auto_2534656 ?auto_2534657 ) ) ( not ( = ?auto_2534654 ?auto_2534656 ) ) ( not ( = ?auto_2534654 ?auto_2534657 ) ) ( not ( = ?auto_2534662 ?auto_2534663 ) ) ( HOIST-AT ?auto_2534661 ?auto_2534662 ) ( not ( = ?auto_2534659 ?auto_2534661 ) ) ( AVAILABLE ?auto_2534661 ) ( SURFACE-AT ?auto_2534657 ?auto_2534662 ) ( ON ?auto_2534657 ?auto_2534658 ) ( CLEAR ?auto_2534657 ) ( not ( = ?auto_2534656 ?auto_2534658 ) ) ( not ( = ?auto_2534657 ?auto_2534658 ) ) ( not ( = ?auto_2534654 ?auto_2534658 ) ) ( TRUCK-AT ?auto_2534660 ?auto_2534663 ) ( SURFACE-AT ?auto_2534654 ?auto_2534663 ) ( CLEAR ?auto_2534654 ) ( IS-CRATE ?auto_2534656 ) ( AVAILABLE ?auto_2534659 ) ( IN ?auto_2534656 ?auto_2534660 ) ( ON ?auto_2534651 ?auto_2534650 ) ( ON ?auto_2534652 ?auto_2534651 ) ( ON ?auto_2534649 ?auto_2534652 ) ( ON ?auto_2534653 ?auto_2534649 ) ( ON ?auto_2534655 ?auto_2534653 ) ( ON ?auto_2534654 ?auto_2534655 ) ( not ( = ?auto_2534650 ?auto_2534651 ) ) ( not ( = ?auto_2534650 ?auto_2534652 ) ) ( not ( = ?auto_2534650 ?auto_2534649 ) ) ( not ( = ?auto_2534650 ?auto_2534653 ) ) ( not ( = ?auto_2534650 ?auto_2534655 ) ) ( not ( = ?auto_2534650 ?auto_2534654 ) ) ( not ( = ?auto_2534650 ?auto_2534656 ) ) ( not ( = ?auto_2534650 ?auto_2534657 ) ) ( not ( = ?auto_2534650 ?auto_2534658 ) ) ( not ( = ?auto_2534651 ?auto_2534652 ) ) ( not ( = ?auto_2534651 ?auto_2534649 ) ) ( not ( = ?auto_2534651 ?auto_2534653 ) ) ( not ( = ?auto_2534651 ?auto_2534655 ) ) ( not ( = ?auto_2534651 ?auto_2534654 ) ) ( not ( = ?auto_2534651 ?auto_2534656 ) ) ( not ( = ?auto_2534651 ?auto_2534657 ) ) ( not ( = ?auto_2534651 ?auto_2534658 ) ) ( not ( = ?auto_2534652 ?auto_2534649 ) ) ( not ( = ?auto_2534652 ?auto_2534653 ) ) ( not ( = ?auto_2534652 ?auto_2534655 ) ) ( not ( = ?auto_2534652 ?auto_2534654 ) ) ( not ( = ?auto_2534652 ?auto_2534656 ) ) ( not ( = ?auto_2534652 ?auto_2534657 ) ) ( not ( = ?auto_2534652 ?auto_2534658 ) ) ( not ( = ?auto_2534649 ?auto_2534653 ) ) ( not ( = ?auto_2534649 ?auto_2534655 ) ) ( not ( = ?auto_2534649 ?auto_2534654 ) ) ( not ( = ?auto_2534649 ?auto_2534656 ) ) ( not ( = ?auto_2534649 ?auto_2534657 ) ) ( not ( = ?auto_2534649 ?auto_2534658 ) ) ( not ( = ?auto_2534653 ?auto_2534655 ) ) ( not ( = ?auto_2534653 ?auto_2534654 ) ) ( not ( = ?auto_2534653 ?auto_2534656 ) ) ( not ( = ?auto_2534653 ?auto_2534657 ) ) ( not ( = ?auto_2534653 ?auto_2534658 ) ) ( not ( = ?auto_2534655 ?auto_2534654 ) ) ( not ( = ?auto_2534655 ?auto_2534656 ) ) ( not ( = ?auto_2534655 ?auto_2534657 ) ) ( not ( = ?auto_2534655 ?auto_2534658 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2534654 ?auto_2534656 ?auto_2534657 )
      ( MAKE-8CRATE-VERIFY ?auto_2534650 ?auto_2534651 ?auto_2534652 ?auto_2534649 ?auto_2534653 ?auto_2534655 ?auto_2534654 ?auto_2534656 ?auto_2534657 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2534664 - SURFACE
      ?auto_2534665 - SURFACE
    )
    :vars
    (
      ?auto_2534667 - HOIST
      ?auto_2534672 - PLACE
      ?auto_2534669 - SURFACE
      ?auto_2534671 - PLACE
      ?auto_2534670 - HOIST
      ?auto_2534666 - SURFACE
      ?auto_2534668 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534667 ?auto_2534672 ) ( IS-CRATE ?auto_2534665 ) ( not ( = ?auto_2534664 ?auto_2534665 ) ) ( not ( = ?auto_2534669 ?auto_2534664 ) ) ( not ( = ?auto_2534669 ?auto_2534665 ) ) ( not ( = ?auto_2534671 ?auto_2534672 ) ) ( HOIST-AT ?auto_2534670 ?auto_2534671 ) ( not ( = ?auto_2534667 ?auto_2534670 ) ) ( AVAILABLE ?auto_2534670 ) ( SURFACE-AT ?auto_2534665 ?auto_2534671 ) ( ON ?auto_2534665 ?auto_2534666 ) ( CLEAR ?auto_2534665 ) ( not ( = ?auto_2534664 ?auto_2534666 ) ) ( not ( = ?auto_2534665 ?auto_2534666 ) ) ( not ( = ?auto_2534669 ?auto_2534666 ) ) ( SURFACE-AT ?auto_2534669 ?auto_2534672 ) ( CLEAR ?auto_2534669 ) ( IS-CRATE ?auto_2534664 ) ( AVAILABLE ?auto_2534667 ) ( IN ?auto_2534664 ?auto_2534668 ) ( TRUCK-AT ?auto_2534668 ?auto_2534671 ) )
    :subtasks
    ( ( !DRIVE ?auto_2534668 ?auto_2534671 ?auto_2534672 )
      ( MAKE-2CRATE ?auto_2534669 ?auto_2534664 ?auto_2534665 )
      ( MAKE-1CRATE-VERIFY ?auto_2534664 ?auto_2534665 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2534673 - SURFACE
      ?auto_2534674 - SURFACE
      ?auto_2534675 - SURFACE
    )
    :vars
    (
      ?auto_2534680 - HOIST
      ?auto_2534679 - PLACE
      ?auto_2534676 - PLACE
      ?auto_2534677 - HOIST
      ?auto_2534681 - SURFACE
      ?auto_2534678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534680 ?auto_2534679 ) ( IS-CRATE ?auto_2534675 ) ( not ( = ?auto_2534674 ?auto_2534675 ) ) ( not ( = ?auto_2534673 ?auto_2534674 ) ) ( not ( = ?auto_2534673 ?auto_2534675 ) ) ( not ( = ?auto_2534676 ?auto_2534679 ) ) ( HOIST-AT ?auto_2534677 ?auto_2534676 ) ( not ( = ?auto_2534680 ?auto_2534677 ) ) ( AVAILABLE ?auto_2534677 ) ( SURFACE-AT ?auto_2534675 ?auto_2534676 ) ( ON ?auto_2534675 ?auto_2534681 ) ( CLEAR ?auto_2534675 ) ( not ( = ?auto_2534674 ?auto_2534681 ) ) ( not ( = ?auto_2534675 ?auto_2534681 ) ) ( not ( = ?auto_2534673 ?auto_2534681 ) ) ( SURFACE-AT ?auto_2534673 ?auto_2534679 ) ( CLEAR ?auto_2534673 ) ( IS-CRATE ?auto_2534674 ) ( AVAILABLE ?auto_2534680 ) ( IN ?auto_2534674 ?auto_2534678 ) ( TRUCK-AT ?auto_2534678 ?auto_2534676 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2534674 ?auto_2534675 )
      ( MAKE-2CRATE-VERIFY ?auto_2534673 ?auto_2534674 ?auto_2534675 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2534683 - SURFACE
      ?auto_2534684 - SURFACE
      ?auto_2534685 - SURFACE
      ?auto_2534682 - SURFACE
    )
    :vars
    (
      ?auto_2534689 - HOIST
      ?auto_2534690 - PLACE
      ?auto_2534687 - PLACE
      ?auto_2534691 - HOIST
      ?auto_2534686 - SURFACE
      ?auto_2534688 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534689 ?auto_2534690 ) ( IS-CRATE ?auto_2534682 ) ( not ( = ?auto_2534685 ?auto_2534682 ) ) ( not ( = ?auto_2534684 ?auto_2534685 ) ) ( not ( = ?auto_2534684 ?auto_2534682 ) ) ( not ( = ?auto_2534687 ?auto_2534690 ) ) ( HOIST-AT ?auto_2534691 ?auto_2534687 ) ( not ( = ?auto_2534689 ?auto_2534691 ) ) ( AVAILABLE ?auto_2534691 ) ( SURFACE-AT ?auto_2534682 ?auto_2534687 ) ( ON ?auto_2534682 ?auto_2534686 ) ( CLEAR ?auto_2534682 ) ( not ( = ?auto_2534685 ?auto_2534686 ) ) ( not ( = ?auto_2534682 ?auto_2534686 ) ) ( not ( = ?auto_2534684 ?auto_2534686 ) ) ( SURFACE-AT ?auto_2534684 ?auto_2534690 ) ( CLEAR ?auto_2534684 ) ( IS-CRATE ?auto_2534685 ) ( AVAILABLE ?auto_2534689 ) ( IN ?auto_2534685 ?auto_2534688 ) ( TRUCK-AT ?auto_2534688 ?auto_2534687 ) ( ON ?auto_2534684 ?auto_2534683 ) ( not ( = ?auto_2534683 ?auto_2534684 ) ) ( not ( = ?auto_2534683 ?auto_2534685 ) ) ( not ( = ?auto_2534683 ?auto_2534682 ) ) ( not ( = ?auto_2534683 ?auto_2534686 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2534684 ?auto_2534685 ?auto_2534682 )
      ( MAKE-3CRATE-VERIFY ?auto_2534683 ?auto_2534684 ?auto_2534685 ?auto_2534682 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2534693 - SURFACE
      ?auto_2534694 - SURFACE
      ?auto_2534695 - SURFACE
      ?auto_2534692 - SURFACE
      ?auto_2534696 - SURFACE
    )
    :vars
    (
      ?auto_2534700 - HOIST
      ?auto_2534701 - PLACE
      ?auto_2534698 - PLACE
      ?auto_2534702 - HOIST
      ?auto_2534697 - SURFACE
      ?auto_2534699 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534700 ?auto_2534701 ) ( IS-CRATE ?auto_2534696 ) ( not ( = ?auto_2534692 ?auto_2534696 ) ) ( not ( = ?auto_2534695 ?auto_2534692 ) ) ( not ( = ?auto_2534695 ?auto_2534696 ) ) ( not ( = ?auto_2534698 ?auto_2534701 ) ) ( HOIST-AT ?auto_2534702 ?auto_2534698 ) ( not ( = ?auto_2534700 ?auto_2534702 ) ) ( AVAILABLE ?auto_2534702 ) ( SURFACE-AT ?auto_2534696 ?auto_2534698 ) ( ON ?auto_2534696 ?auto_2534697 ) ( CLEAR ?auto_2534696 ) ( not ( = ?auto_2534692 ?auto_2534697 ) ) ( not ( = ?auto_2534696 ?auto_2534697 ) ) ( not ( = ?auto_2534695 ?auto_2534697 ) ) ( SURFACE-AT ?auto_2534695 ?auto_2534701 ) ( CLEAR ?auto_2534695 ) ( IS-CRATE ?auto_2534692 ) ( AVAILABLE ?auto_2534700 ) ( IN ?auto_2534692 ?auto_2534699 ) ( TRUCK-AT ?auto_2534699 ?auto_2534698 ) ( ON ?auto_2534694 ?auto_2534693 ) ( ON ?auto_2534695 ?auto_2534694 ) ( not ( = ?auto_2534693 ?auto_2534694 ) ) ( not ( = ?auto_2534693 ?auto_2534695 ) ) ( not ( = ?auto_2534693 ?auto_2534692 ) ) ( not ( = ?auto_2534693 ?auto_2534696 ) ) ( not ( = ?auto_2534693 ?auto_2534697 ) ) ( not ( = ?auto_2534694 ?auto_2534695 ) ) ( not ( = ?auto_2534694 ?auto_2534692 ) ) ( not ( = ?auto_2534694 ?auto_2534696 ) ) ( not ( = ?auto_2534694 ?auto_2534697 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2534695 ?auto_2534692 ?auto_2534696 )
      ( MAKE-4CRATE-VERIFY ?auto_2534693 ?auto_2534694 ?auto_2534695 ?auto_2534692 ?auto_2534696 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2534704 - SURFACE
      ?auto_2534705 - SURFACE
      ?auto_2534706 - SURFACE
      ?auto_2534703 - SURFACE
      ?auto_2534707 - SURFACE
      ?auto_2534708 - SURFACE
    )
    :vars
    (
      ?auto_2534712 - HOIST
      ?auto_2534713 - PLACE
      ?auto_2534710 - PLACE
      ?auto_2534714 - HOIST
      ?auto_2534709 - SURFACE
      ?auto_2534711 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534712 ?auto_2534713 ) ( IS-CRATE ?auto_2534708 ) ( not ( = ?auto_2534707 ?auto_2534708 ) ) ( not ( = ?auto_2534703 ?auto_2534707 ) ) ( not ( = ?auto_2534703 ?auto_2534708 ) ) ( not ( = ?auto_2534710 ?auto_2534713 ) ) ( HOIST-AT ?auto_2534714 ?auto_2534710 ) ( not ( = ?auto_2534712 ?auto_2534714 ) ) ( AVAILABLE ?auto_2534714 ) ( SURFACE-AT ?auto_2534708 ?auto_2534710 ) ( ON ?auto_2534708 ?auto_2534709 ) ( CLEAR ?auto_2534708 ) ( not ( = ?auto_2534707 ?auto_2534709 ) ) ( not ( = ?auto_2534708 ?auto_2534709 ) ) ( not ( = ?auto_2534703 ?auto_2534709 ) ) ( SURFACE-AT ?auto_2534703 ?auto_2534713 ) ( CLEAR ?auto_2534703 ) ( IS-CRATE ?auto_2534707 ) ( AVAILABLE ?auto_2534712 ) ( IN ?auto_2534707 ?auto_2534711 ) ( TRUCK-AT ?auto_2534711 ?auto_2534710 ) ( ON ?auto_2534705 ?auto_2534704 ) ( ON ?auto_2534706 ?auto_2534705 ) ( ON ?auto_2534703 ?auto_2534706 ) ( not ( = ?auto_2534704 ?auto_2534705 ) ) ( not ( = ?auto_2534704 ?auto_2534706 ) ) ( not ( = ?auto_2534704 ?auto_2534703 ) ) ( not ( = ?auto_2534704 ?auto_2534707 ) ) ( not ( = ?auto_2534704 ?auto_2534708 ) ) ( not ( = ?auto_2534704 ?auto_2534709 ) ) ( not ( = ?auto_2534705 ?auto_2534706 ) ) ( not ( = ?auto_2534705 ?auto_2534703 ) ) ( not ( = ?auto_2534705 ?auto_2534707 ) ) ( not ( = ?auto_2534705 ?auto_2534708 ) ) ( not ( = ?auto_2534705 ?auto_2534709 ) ) ( not ( = ?auto_2534706 ?auto_2534703 ) ) ( not ( = ?auto_2534706 ?auto_2534707 ) ) ( not ( = ?auto_2534706 ?auto_2534708 ) ) ( not ( = ?auto_2534706 ?auto_2534709 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2534703 ?auto_2534707 ?auto_2534708 )
      ( MAKE-5CRATE-VERIFY ?auto_2534704 ?auto_2534705 ?auto_2534706 ?auto_2534703 ?auto_2534707 ?auto_2534708 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2534716 - SURFACE
      ?auto_2534717 - SURFACE
      ?auto_2534718 - SURFACE
      ?auto_2534715 - SURFACE
      ?auto_2534719 - SURFACE
      ?auto_2534721 - SURFACE
      ?auto_2534720 - SURFACE
    )
    :vars
    (
      ?auto_2534725 - HOIST
      ?auto_2534726 - PLACE
      ?auto_2534723 - PLACE
      ?auto_2534727 - HOIST
      ?auto_2534722 - SURFACE
      ?auto_2534724 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534725 ?auto_2534726 ) ( IS-CRATE ?auto_2534720 ) ( not ( = ?auto_2534721 ?auto_2534720 ) ) ( not ( = ?auto_2534719 ?auto_2534721 ) ) ( not ( = ?auto_2534719 ?auto_2534720 ) ) ( not ( = ?auto_2534723 ?auto_2534726 ) ) ( HOIST-AT ?auto_2534727 ?auto_2534723 ) ( not ( = ?auto_2534725 ?auto_2534727 ) ) ( AVAILABLE ?auto_2534727 ) ( SURFACE-AT ?auto_2534720 ?auto_2534723 ) ( ON ?auto_2534720 ?auto_2534722 ) ( CLEAR ?auto_2534720 ) ( not ( = ?auto_2534721 ?auto_2534722 ) ) ( not ( = ?auto_2534720 ?auto_2534722 ) ) ( not ( = ?auto_2534719 ?auto_2534722 ) ) ( SURFACE-AT ?auto_2534719 ?auto_2534726 ) ( CLEAR ?auto_2534719 ) ( IS-CRATE ?auto_2534721 ) ( AVAILABLE ?auto_2534725 ) ( IN ?auto_2534721 ?auto_2534724 ) ( TRUCK-AT ?auto_2534724 ?auto_2534723 ) ( ON ?auto_2534717 ?auto_2534716 ) ( ON ?auto_2534718 ?auto_2534717 ) ( ON ?auto_2534715 ?auto_2534718 ) ( ON ?auto_2534719 ?auto_2534715 ) ( not ( = ?auto_2534716 ?auto_2534717 ) ) ( not ( = ?auto_2534716 ?auto_2534718 ) ) ( not ( = ?auto_2534716 ?auto_2534715 ) ) ( not ( = ?auto_2534716 ?auto_2534719 ) ) ( not ( = ?auto_2534716 ?auto_2534721 ) ) ( not ( = ?auto_2534716 ?auto_2534720 ) ) ( not ( = ?auto_2534716 ?auto_2534722 ) ) ( not ( = ?auto_2534717 ?auto_2534718 ) ) ( not ( = ?auto_2534717 ?auto_2534715 ) ) ( not ( = ?auto_2534717 ?auto_2534719 ) ) ( not ( = ?auto_2534717 ?auto_2534721 ) ) ( not ( = ?auto_2534717 ?auto_2534720 ) ) ( not ( = ?auto_2534717 ?auto_2534722 ) ) ( not ( = ?auto_2534718 ?auto_2534715 ) ) ( not ( = ?auto_2534718 ?auto_2534719 ) ) ( not ( = ?auto_2534718 ?auto_2534721 ) ) ( not ( = ?auto_2534718 ?auto_2534720 ) ) ( not ( = ?auto_2534718 ?auto_2534722 ) ) ( not ( = ?auto_2534715 ?auto_2534719 ) ) ( not ( = ?auto_2534715 ?auto_2534721 ) ) ( not ( = ?auto_2534715 ?auto_2534720 ) ) ( not ( = ?auto_2534715 ?auto_2534722 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2534719 ?auto_2534721 ?auto_2534720 )
      ( MAKE-6CRATE-VERIFY ?auto_2534716 ?auto_2534717 ?auto_2534718 ?auto_2534715 ?auto_2534719 ?auto_2534721 ?auto_2534720 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2534729 - SURFACE
      ?auto_2534730 - SURFACE
      ?auto_2534731 - SURFACE
      ?auto_2534728 - SURFACE
      ?auto_2534732 - SURFACE
      ?auto_2534734 - SURFACE
      ?auto_2534733 - SURFACE
      ?auto_2534735 - SURFACE
    )
    :vars
    (
      ?auto_2534739 - HOIST
      ?auto_2534740 - PLACE
      ?auto_2534737 - PLACE
      ?auto_2534741 - HOIST
      ?auto_2534736 - SURFACE
      ?auto_2534738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534739 ?auto_2534740 ) ( IS-CRATE ?auto_2534735 ) ( not ( = ?auto_2534733 ?auto_2534735 ) ) ( not ( = ?auto_2534734 ?auto_2534733 ) ) ( not ( = ?auto_2534734 ?auto_2534735 ) ) ( not ( = ?auto_2534737 ?auto_2534740 ) ) ( HOIST-AT ?auto_2534741 ?auto_2534737 ) ( not ( = ?auto_2534739 ?auto_2534741 ) ) ( AVAILABLE ?auto_2534741 ) ( SURFACE-AT ?auto_2534735 ?auto_2534737 ) ( ON ?auto_2534735 ?auto_2534736 ) ( CLEAR ?auto_2534735 ) ( not ( = ?auto_2534733 ?auto_2534736 ) ) ( not ( = ?auto_2534735 ?auto_2534736 ) ) ( not ( = ?auto_2534734 ?auto_2534736 ) ) ( SURFACE-AT ?auto_2534734 ?auto_2534740 ) ( CLEAR ?auto_2534734 ) ( IS-CRATE ?auto_2534733 ) ( AVAILABLE ?auto_2534739 ) ( IN ?auto_2534733 ?auto_2534738 ) ( TRUCK-AT ?auto_2534738 ?auto_2534737 ) ( ON ?auto_2534730 ?auto_2534729 ) ( ON ?auto_2534731 ?auto_2534730 ) ( ON ?auto_2534728 ?auto_2534731 ) ( ON ?auto_2534732 ?auto_2534728 ) ( ON ?auto_2534734 ?auto_2534732 ) ( not ( = ?auto_2534729 ?auto_2534730 ) ) ( not ( = ?auto_2534729 ?auto_2534731 ) ) ( not ( = ?auto_2534729 ?auto_2534728 ) ) ( not ( = ?auto_2534729 ?auto_2534732 ) ) ( not ( = ?auto_2534729 ?auto_2534734 ) ) ( not ( = ?auto_2534729 ?auto_2534733 ) ) ( not ( = ?auto_2534729 ?auto_2534735 ) ) ( not ( = ?auto_2534729 ?auto_2534736 ) ) ( not ( = ?auto_2534730 ?auto_2534731 ) ) ( not ( = ?auto_2534730 ?auto_2534728 ) ) ( not ( = ?auto_2534730 ?auto_2534732 ) ) ( not ( = ?auto_2534730 ?auto_2534734 ) ) ( not ( = ?auto_2534730 ?auto_2534733 ) ) ( not ( = ?auto_2534730 ?auto_2534735 ) ) ( not ( = ?auto_2534730 ?auto_2534736 ) ) ( not ( = ?auto_2534731 ?auto_2534728 ) ) ( not ( = ?auto_2534731 ?auto_2534732 ) ) ( not ( = ?auto_2534731 ?auto_2534734 ) ) ( not ( = ?auto_2534731 ?auto_2534733 ) ) ( not ( = ?auto_2534731 ?auto_2534735 ) ) ( not ( = ?auto_2534731 ?auto_2534736 ) ) ( not ( = ?auto_2534728 ?auto_2534732 ) ) ( not ( = ?auto_2534728 ?auto_2534734 ) ) ( not ( = ?auto_2534728 ?auto_2534733 ) ) ( not ( = ?auto_2534728 ?auto_2534735 ) ) ( not ( = ?auto_2534728 ?auto_2534736 ) ) ( not ( = ?auto_2534732 ?auto_2534734 ) ) ( not ( = ?auto_2534732 ?auto_2534733 ) ) ( not ( = ?auto_2534732 ?auto_2534735 ) ) ( not ( = ?auto_2534732 ?auto_2534736 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2534734 ?auto_2534733 ?auto_2534735 )
      ( MAKE-7CRATE-VERIFY ?auto_2534729 ?auto_2534730 ?auto_2534731 ?auto_2534728 ?auto_2534732 ?auto_2534734 ?auto_2534733 ?auto_2534735 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2534743 - SURFACE
      ?auto_2534744 - SURFACE
      ?auto_2534745 - SURFACE
      ?auto_2534742 - SURFACE
      ?auto_2534746 - SURFACE
      ?auto_2534748 - SURFACE
      ?auto_2534747 - SURFACE
      ?auto_2534749 - SURFACE
      ?auto_2534750 - SURFACE
    )
    :vars
    (
      ?auto_2534754 - HOIST
      ?auto_2534755 - PLACE
      ?auto_2534752 - PLACE
      ?auto_2534756 - HOIST
      ?auto_2534751 - SURFACE
      ?auto_2534753 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534754 ?auto_2534755 ) ( IS-CRATE ?auto_2534750 ) ( not ( = ?auto_2534749 ?auto_2534750 ) ) ( not ( = ?auto_2534747 ?auto_2534749 ) ) ( not ( = ?auto_2534747 ?auto_2534750 ) ) ( not ( = ?auto_2534752 ?auto_2534755 ) ) ( HOIST-AT ?auto_2534756 ?auto_2534752 ) ( not ( = ?auto_2534754 ?auto_2534756 ) ) ( AVAILABLE ?auto_2534756 ) ( SURFACE-AT ?auto_2534750 ?auto_2534752 ) ( ON ?auto_2534750 ?auto_2534751 ) ( CLEAR ?auto_2534750 ) ( not ( = ?auto_2534749 ?auto_2534751 ) ) ( not ( = ?auto_2534750 ?auto_2534751 ) ) ( not ( = ?auto_2534747 ?auto_2534751 ) ) ( SURFACE-AT ?auto_2534747 ?auto_2534755 ) ( CLEAR ?auto_2534747 ) ( IS-CRATE ?auto_2534749 ) ( AVAILABLE ?auto_2534754 ) ( IN ?auto_2534749 ?auto_2534753 ) ( TRUCK-AT ?auto_2534753 ?auto_2534752 ) ( ON ?auto_2534744 ?auto_2534743 ) ( ON ?auto_2534745 ?auto_2534744 ) ( ON ?auto_2534742 ?auto_2534745 ) ( ON ?auto_2534746 ?auto_2534742 ) ( ON ?auto_2534748 ?auto_2534746 ) ( ON ?auto_2534747 ?auto_2534748 ) ( not ( = ?auto_2534743 ?auto_2534744 ) ) ( not ( = ?auto_2534743 ?auto_2534745 ) ) ( not ( = ?auto_2534743 ?auto_2534742 ) ) ( not ( = ?auto_2534743 ?auto_2534746 ) ) ( not ( = ?auto_2534743 ?auto_2534748 ) ) ( not ( = ?auto_2534743 ?auto_2534747 ) ) ( not ( = ?auto_2534743 ?auto_2534749 ) ) ( not ( = ?auto_2534743 ?auto_2534750 ) ) ( not ( = ?auto_2534743 ?auto_2534751 ) ) ( not ( = ?auto_2534744 ?auto_2534745 ) ) ( not ( = ?auto_2534744 ?auto_2534742 ) ) ( not ( = ?auto_2534744 ?auto_2534746 ) ) ( not ( = ?auto_2534744 ?auto_2534748 ) ) ( not ( = ?auto_2534744 ?auto_2534747 ) ) ( not ( = ?auto_2534744 ?auto_2534749 ) ) ( not ( = ?auto_2534744 ?auto_2534750 ) ) ( not ( = ?auto_2534744 ?auto_2534751 ) ) ( not ( = ?auto_2534745 ?auto_2534742 ) ) ( not ( = ?auto_2534745 ?auto_2534746 ) ) ( not ( = ?auto_2534745 ?auto_2534748 ) ) ( not ( = ?auto_2534745 ?auto_2534747 ) ) ( not ( = ?auto_2534745 ?auto_2534749 ) ) ( not ( = ?auto_2534745 ?auto_2534750 ) ) ( not ( = ?auto_2534745 ?auto_2534751 ) ) ( not ( = ?auto_2534742 ?auto_2534746 ) ) ( not ( = ?auto_2534742 ?auto_2534748 ) ) ( not ( = ?auto_2534742 ?auto_2534747 ) ) ( not ( = ?auto_2534742 ?auto_2534749 ) ) ( not ( = ?auto_2534742 ?auto_2534750 ) ) ( not ( = ?auto_2534742 ?auto_2534751 ) ) ( not ( = ?auto_2534746 ?auto_2534748 ) ) ( not ( = ?auto_2534746 ?auto_2534747 ) ) ( not ( = ?auto_2534746 ?auto_2534749 ) ) ( not ( = ?auto_2534746 ?auto_2534750 ) ) ( not ( = ?auto_2534746 ?auto_2534751 ) ) ( not ( = ?auto_2534748 ?auto_2534747 ) ) ( not ( = ?auto_2534748 ?auto_2534749 ) ) ( not ( = ?auto_2534748 ?auto_2534750 ) ) ( not ( = ?auto_2534748 ?auto_2534751 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2534747 ?auto_2534749 ?auto_2534750 )
      ( MAKE-8CRATE-VERIFY ?auto_2534743 ?auto_2534744 ?auto_2534745 ?auto_2534742 ?auto_2534746 ?auto_2534748 ?auto_2534747 ?auto_2534749 ?auto_2534750 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2534757 - SURFACE
      ?auto_2534758 - SURFACE
    )
    :vars
    (
      ?auto_2534763 - HOIST
      ?auto_2534764 - PLACE
      ?auto_2534761 - SURFACE
      ?auto_2534760 - PLACE
      ?auto_2534765 - HOIST
      ?auto_2534759 - SURFACE
      ?auto_2534762 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534763 ?auto_2534764 ) ( IS-CRATE ?auto_2534758 ) ( not ( = ?auto_2534757 ?auto_2534758 ) ) ( not ( = ?auto_2534761 ?auto_2534757 ) ) ( not ( = ?auto_2534761 ?auto_2534758 ) ) ( not ( = ?auto_2534760 ?auto_2534764 ) ) ( HOIST-AT ?auto_2534765 ?auto_2534760 ) ( not ( = ?auto_2534763 ?auto_2534765 ) ) ( SURFACE-AT ?auto_2534758 ?auto_2534760 ) ( ON ?auto_2534758 ?auto_2534759 ) ( CLEAR ?auto_2534758 ) ( not ( = ?auto_2534757 ?auto_2534759 ) ) ( not ( = ?auto_2534758 ?auto_2534759 ) ) ( not ( = ?auto_2534761 ?auto_2534759 ) ) ( SURFACE-AT ?auto_2534761 ?auto_2534764 ) ( CLEAR ?auto_2534761 ) ( IS-CRATE ?auto_2534757 ) ( AVAILABLE ?auto_2534763 ) ( TRUCK-AT ?auto_2534762 ?auto_2534760 ) ( LIFTING ?auto_2534765 ?auto_2534757 ) )
    :subtasks
    ( ( !LOAD ?auto_2534765 ?auto_2534757 ?auto_2534762 ?auto_2534760 )
      ( MAKE-2CRATE ?auto_2534761 ?auto_2534757 ?auto_2534758 )
      ( MAKE-1CRATE-VERIFY ?auto_2534757 ?auto_2534758 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2534766 - SURFACE
      ?auto_2534767 - SURFACE
      ?auto_2534768 - SURFACE
    )
    :vars
    (
      ?auto_2534772 - HOIST
      ?auto_2534773 - PLACE
      ?auto_2534770 - PLACE
      ?auto_2534771 - HOIST
      ?auto_2534774 - SURFACE
      ?auto_2534769 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534772 ?auto_2534773 ) ( IS-CRATE ?auto_2534768 ) ( not ( = ?auto_2534767 ?auto_2534768 ) ) ( not ( = ?auto_2534766 ?auto_2534767 ) ) ( not ( = ?auto_2534766 ?auto_2534768 ) ) ( not ( = ?auto_2534770 ?auto_2534773 ) ) ( HOIST-AT ?auto_2534771 ?auto_2534770 ) ( not ( = ?auto_2534772 ?auto_2534771 ) ) ( SURFACE-AT ?auto_2534768 ?auto_2534770 ) ( ON ?auto_2534768 ?auto_2534774 ) ( CLEAR ?auto_2534768 ) ( not ( = ?auto_2534767 ?auto_2534774 ) ) ( not ( = ?auto_2534768 ?auto_2534774 ) ) ( not ( = ?auto_2534766 ?auto_2534774 ) ) ( SURFACE-AT ?auto_2534766 ?auto_2534773 ) ( CLEAR ?auto_2534766 ) ( IS-CRATE ?auto_2534767 ) ( AVAILABLE ?auto_2534772 ) ( TRUCK-AT ?auto_2534769 ?auto_2534770 ) ( LIFTING ?auto_2534771 ?auto_2534767 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2534767 ?auto_2534768 )
      ( MAKE-2CRATE-VERIFY ?auto_2534766 ?auto_2534767 ?auto_2534768 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2534776 - SURFACE
      ?auto_2534777 - SURFACE
      ?auto_2534778 - SURFACE
      ?auto_2534775 - SURFACE
    )
    :vars
    (
      ?auto_2534783 - HOIST
      ?auto_2534779 - PLACE
      ?auto_2534782 - PLACE
      ?auto_2534784 - HOIST
      ?auto_2534781 - SURFACE
      ?auto_2534780 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534783 ?auto_2534779 ) ( IS-CRATE ?auto_2534775 ) ( not ( = ?auto_2534778 ?auto_2534775 ) ) ( not ( = ?auto_2534777 ?auto_2534778 ) ) ( not ( = ?auto_2534777 ?auto_2534775 ) ) ( not ( = ?auto_2534782 ?auto_2534779 ) ) ( HOIST-AT ?auto_2534784 ?auto_2534782 ) ( not ( = ?auto_2534783 ?auto_2534784 ) ) ( SURFACE-AT ?auto_2534775 ?auto_2534782 ) ( ON ?auto_2534775 ?auto_2534781 ) ( CLEAR ?auto_2534775 ) ( not ( = ?auto_2534778 ?auto_2534781 ) ) ( not ( = ?auto_2534775 ?auto_2534781 ) ) ( not ( = ?auto_2534777 ?auto_2534781 ) ) ( SURFACE-AT ?auto_2534777 ?auto_2534779 ) ( CLEAR ?auto_2534777 ) ( IS-CRATE ?auto_2534778 ) ( AVAILABLE ?auto_2534783 ) ( TRUCK-AT ?auto_2534780 ?auto_2534782 ) ( LIFTING ?auto_2534784 ?auto_2534778 ) ( ON ?auto_2534777 ?auto_2534776 ) ( not ( = ?auto_2534776 ?auto_2534777 ) ) ( not ( = ?auto_2534776 ?auto_2534778 ) ) ( not ( = ?auto_2534776 ?auto_2534775 ) ) ( not ( = ?auto_2534776 ?auto_2534781 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2534777 ?auto_2534778 ?auto_2534775 )
      ( MAKE-3CRATE-VERIFY ?auto_2534776 ?auto_2534777 ?auto_2534778 ?auto_2534775 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2534786 - SURFACE
      ?auto_2534787 - SURFACE
      ?auto_2534788 - SURFACE
      ?auto_2534785 - SURFACE
      ?auto_2534789 - SURFACE
    )
    :vars
    (
      ?auto_2534794 - HOIST
      ?auto_2534790 - PLACE
      ?auto_2534793 - PLACE
      ?auto_2534795 - HOIST
      ?auto_2534792 - SURFACE
      ?auto_2534791 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534794 ?auto_2534790 ) ( IS-CRATE ?auto_2534789 ) ( not ( = ?auto_2534785 ?auto_2534789 ) ) ( not ( = ?auto_2534788 ?auto_2534785 ) ) ( not ( = ?auto_2534788 ?auto_2534789 ) ) ( not ( = ?auto_2534793 ?auto_2534790 ) ) ( HOIST-AT ?auto_2534795 ?auto_2534793 ) ( not ( = ?auto_2534794 ?auto_2534795 ) ) ( SURFACE-AT ?auto_2534789 ?auto_2534793 ) ( ON ?auto_2534789 ?auto_2534792 ) ( CLEAR ?auto_2534789 ) ( not ( = ?auto_2534785 ?auto_2534792 ) ) ( not ( = ?auto_2534789 ?auto_2534792 ) ) ( not ( = ?auto_2534788 ?auto_2534792 ) ) ( SURFACE-AT ?auto_2534788 ?auto_2534790 ) ( CLEAR ?auto_2534788 ) ( IS-CRATE ?auto_2534785 ) ( AVAILABLE ?auto_2534794 ) ( TRUCK-AT ?auto_2534791 ?auto_2534793 ) ( LIFTING ?auto_2534795 ?auto_2534785 ) ( ON ?auto_2534787 ?auto_2534786 ) ( ON ?auto_2534788 ?auto_2534787 ) ( not ( = ?auto_2534786 ?auto_2534787 ) ) ( not ( = ?auto_2534786 ?auto_2534788 ) ) ( not ( = ?auto_2534786 ?auto_2534785 ) ) ( not ( = ?auto_2534786 ?auto_2534789 ) ) ( not ( = ?auto_2534786 ?auto_2534792 ) ) ( not ( = ?auto_2534787 ?auto_2534788 ) ) ( not ( = ?auto_2534787 ?auto_2534785 ) ) ( not ( = ?auto_2534787 ?auto_2534789 ) ) ( not ( = ?auto_2534787 ?auto_2534792 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2534788 ?auto_2534785 ?auto_2534789 )
      ( MAKE-4CRATE-VERIFY ?auto_2534786 ?auto_2534787 ?auto_2534788 ?auto_2534785 ?auto_2534789 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2534797 - SURFACE
      ?auto_2534798 - SURFACE
      ?auto_2534799 - SURFACE
      ?auto_2534796 - SURFACE
      ?auto_2534800 - SURFACE
      ?auto_2534801 - SURFACE
    )
    :vars
    (
      ?auto_2534806 - HOIST
      ?auto_2534802 - PLACE
      ?auto_2534805 - PLACE
      ?auto_2534807 - HOIST
      ?auto_2534804 - SURFACE
      ?auto_2534803 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534806 ?auto_2534802 ) ( IS-CRATE ?auto_2534801 ) ( not ( = ?auto_2534800 ?auto_2534801 ) ) ( not ( = ?auto_2534796 ?auto_2534800 ) ) ( not ( = ?auto_2534796 ?auto_2534801 ) ) ( not ( = ?auto_2534805 ?auto_2534802 ) ) ( HOIST-AT ?auto_2534807 ?auto_2534805 ) ( not ( = ?auto_2534806 ?auto_2534807 ) ) ( SURFACE-AT ?auto_2534801 ?auto_2534805 ) ( ON ?auto_2534801 ?auto_2534804 ) ( CLEAR ?auto_2534801 ) ( not ( = ?auto_2534800 ?auto_2534804 ) ) ( not ( = ?auto_2534801 ?auto_2534804 ) ) ( not ( = ?auto_2534796 ?auto_2534804 ) ) ( SURFACE-AT ?auto_2534796 ?auto_2534802 ) ( CLEAR ?auto_2534796 ) ( IS-CRATE ?auto_2534800 ) ( AVAILABLE ?auto_2534806 ) ( TRUCK-AT ?auto_2534803 ?auto_2534805 ) ( LIFTING ?auto_2534807 ?auto_2534800 ) ( ON ?auto_2534798 ?auto_2534797 ) ( ON ?auto_2534799 ?auto_2534798 ) ( ON ?auto_2534796 ?auto_2534799 ) ( not ( = ?auto_2534797 ?auto_2534798 ) ) ( not ( = ?auto_2534797 ?auto_2534799 ) ) ( not ( = ?auto_2534797 ?auto_2534796 ) ) ( not ( = ?auto_2534797 ?auto_2534800 ) ) ( not ( = ?auto_2534797 ?auto_2534801 ) ) ( not ( = ?auto_2534797 ?auto_2534804 ) ) ( not ( = ?auto_2534798 ?auto_2534799 ) ) ( not ( = ?auto_2534798 ?auto_2534796 ) ) ( not ( = ?auto_2534798 ?auto_2534800 ) ) ( not ( = ?auto_2534798 ?auto_2534801 ) ) ( not ( = ?auto_2534798 ?auto_2534804 ) ) ( not ( = ?auto_2534799 ?auto_2534796 ) ) ( not ( = ?auto_2534799 ?auto_2534800 ) ) ( not ( = ?auto_2534799 ?auto_2534801 ) ) ( not ( = ?auto_2534799 ?auto_2534804 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2534796 ?auto_2534800 ?auto_2534801 )
      ( MAKE-5CRATE-VERIFY ?auto_2534797 ?auto_2534798 ?auto_2534799 ?auto_2534796 ?auto_2534800 ?auto_2534801 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2534809 - SURFACE
      ?auto_2534810 - SURFACE
      ?auto_2534811 - SURFACE
      ?auto_2534808 - SURFACE
      ?auto_2534812 - SURFACE
      ?auto_2534814 - SURFACE
      ?auto_2534813 - SURFACE
    )
    :vars
    (
      ?auto_2534819 - HOIST
      ?auto_2534815 - PLACE
      ?auto_2534818 - PLACE
      ?auto_2534820 - HOIST
      ?auto_2534817 - SURFACE
      ?auto_2534816 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534819 ?auto_2534815 ) ( IS-CRATE ?auto_2534813 ) ( not ( = ?auto_2534814 ?auto_2534813 ) ) ( not ( = ?auto_2534812 ?auto_2534814 ) ) ( not ( = ?auto_2534812 ?auto_2534813 ) ) ( not ( = ?auto_2534818 ?auto_2534815 ) ) ( HOIST-AT ?auto_2534820 ?auto_2534818 ) ( not ( = ?auto_2534819 ?auto_2534820 ) ) ( SURFACE-AT ?auto_2534813 ?auto_2534818 ) ( ON ?auto_2534813 ?auto_2534817 ) ( CLEAR ?auto_2534813 ) ( not ( = ?auto_2534814 ?auto_2534817 ) ) ( not ( = ?auto_2534813 ?auto_2534817 ) ) ( not ( = ?auto_2534812 ?auto_2534817 ) ) ( SURFACE-AT ?auto_2534812 ?auto_2534815 ) ( CLEAR ?auto_2534812 ) ( IS-CRATE ?auto_2534814 ) ( AVAILABLE ?auto_2534819 ) ( TRUCK-AT ?auto_2534816 ?auto_2534818 ) ( LIFTING ?auto_2534820 ?auto_2534814 ) ( ON ?auto_2534810 ?auto_2534809 ) ( ON ?auto_2534811 ?auto_2534810 ) ( ON ?auto_2534808 ?auto_2534811 ) ( ON ?auto_2534812 ?auto_2534808 ) ( not ( = ?auto_2534809 ?auto_2534810 ) ) ( not ( = ?auto_2534809 ?auto_2534811 ) ) ( not ( = ?auto_2534809 ?auto_2534808 ) ) ( not ( = ?auto_2534809 ?auto_2534812 ) ) ( not ( = ?auto_2534809 ?auto_2534814 ) ) ( not ( = ?auto_2534809 ?auto_2534813 ) ) ( not ( = ?auto_2534809 ?auto_2534817 ) ) ( not ( = ?auto_2534810 ?auto_2534811 ) ) ( not ( = ?auto_2534810 ?auto_2534808 ) ) ( not ( = ?auto_2534810 ?auto_2534812 ) ) ( not ( = ?auto_2534810 ?auto_2534814 ) ) ( not ( = ?auto_2534810 ?auto_2534813 ) ) ( not ( = ?auto_2534810 ?auto_2534817 ) ) ( not ( = ?auto_2534811 ?auto_2534808 ) ) ( not ( = ?auto_2534811 ?auto_2534812 ) ) ( not ( = ?auto_2534811 ?auto_2534814 ) ) ( not ( = ?auto_2534811 ?auto_2534813 ) ) ( not ( = ?auto_2534811 ?auto_2534817 ) ) ( not ( = ?auto_2534808 ?auto_2534812 ) ) ( not ( = ?auto_2534808 ?auto_2534814 ) ) ( not ( = ?auto_2534808 ?auto_2534813 ) ) ( not ( = ?auto_2534808 ?auto_2534817 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2534812 ?auto_2534814 ?auto_2534813 )
      ( MAKE-6CRATE-VERIFY ?auto_2534809 ?auto_2534810 ?auto_2534811 ?auto_2534808 ?auto_2534812 ?auto_2534814 ?auto_2534813 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2534822 - SURFACE
      ?auto_2534823 - SURFACE
      ?auto_2534824 - SURFACE
      ?auto_2534821 - SURFACE
      ?auto_2534825 - SURFACE
      ?auto_2534827 - SURFACE
      ?auto_2534826 - SURFACE
      ?auto_2534828 - SURFACE
    )
    :vars
    (
      ?auto_2534833 - HOIST
      ?auto_2534829 - PLACE
      ?auto_2534832 - PLACE
      ?auto_2534834 - HOIST
      ?auto_2534831 - SURFACE
      ?auto_2534830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534833 ?auto_2534829 ) ( IS-CRATE ?auto_2534828 ) ( not ( = ?auto_2534826 ?auto_2534828 ) ) ( not ( = ?auto_2534827 ?auto_2534826 ) ) ( not ( = ?auto_2534827 ?auto_2534828 ) ) ( not ( = ?auto_2534832 ?auto_2534829 ) ) ( HOIST-AT ?auto_2534834 ?auto_2534832 ) ( not ( = ?auto_2534833 ?auto_2534834 ) ) ( SURFACE-AT ?auto_2534828 ?auto_2534832 ) ( ON ?auto_2534828 ?auto_2534831 ) ( CLEAR ?auto_2534828 ) ( not ( = ?auto_2534826 ?auto_2534831 ) ) ( not ( = ?auto_2534828 ?auto_2534831 ) ) ( not ( = ?auto_2534827 ?auto_2534831 ) ) ( SURFACE-AT ?auto_2534827 ?auto_2534829 ) ( CLEAR ?auto_2534827 ) ( IS-CRATE ?auto_2534826 ) ( AVAILABLE ?auto_2534833 ) ( TRUCK-AT ?auto_2534830 ?auto_2534832 ) ( LIFTING ?auto_2534834 ?auto_2534826 ) ( ON ?auto_2534823 ?auto_2534822 ) ( ON ?auto_2534824 ?auto_2534823 ) ( ON ?auto_2534821 ?auto_2534824 ) ( ON ?auto_2534825 ?auto_2534821 ) ( ON ?auto_2534827 ?auto_2534825 ) ( not ( = ?auto_2534822 ?auto_2534823 ) ) ( not ( = ?auto_2534822 ?auto_2534824 ) ) ( not ( = ?auto_2534822 ?auto_2534821 ) ) ( not ( = ?auto_2534822 ?auto_2534825 ) ) ( not ( = ?auto_2534822 ?auto_2534827 ) ) ( not ( = ?auto_2534822 ?auto_2534826 ) ) ( not ( = ?auto_2534822 ?auto_2534828 ) ) ( not ( = ?auto_2534822 ?auto_2534831 ) ) ( not ( = ?auto_2534823 ?auto_2534824 ) ) ( not ( = ?auto_2534823 ?auto_2534821 ) ) ( not ( = ?auto_2534823 ?auto_2534825 ) ) ( not ( = ?auto_2534823 ?auto_2534827 ) ) ( not ( = ?auto_2534823 ?auto_2534826 ) ) ( not ( = ?auto_2534823 ?auto_2534828 ) ) ( not ( = ?auto_2534823 ?auto_2534831 ) ) ( not ( = ?auto_2534824 ?auto_2534821 ) ) ( not ( = ?auto_2534824 ?auto_2534825 ) ) ( not ( = ?auto_2534824 ?auto_2534827 ) ) ( not ( = ?auto_2534824 ?auto_2534826 ) ) ( not ( = ?auto_2534824 ?auto_2534828 ) ) ( not ( = ?auto_2534824 ?auto_2534831 ) ) ( not ( = ?auto_2534821 ?auto_2534825 ) ) ( not ( = ?auto_2534821 ?auto_2534827 ) ) ( not ( = ?auto_2534821 ?auto_2534826 ) ) ( not ( = ?auto_2534821 ?auto_2534828 ) ) ( not ( = ?auto_2534821 ?auto_2534831 ) ) ( not ( = ?auto_2534825 ?auto_2534827 ) ) ( not ( = ?auto_2534825 ?auto_2534826 ) ) ( not ( = ?auto_2534825 ?auto_2534828 ) ) ( not ( = ?auto_2534825 ?auto_2534831 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2534827 ?auto_2534826 ?auto_2534828 )
      ( MAKE-7CRATE-VERIFY ?auto_2534822 ?auto_2534823 ?auto_2534824 ?auto_2534821 ?auto_2534825 ?auto_2534827 ?auto_2534826 ?auto_2534828 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2534836 - SURFACE
      ?auto_2534837 - SURFACE
      ?auto_2534838 - SURFACE
      ?auto_2534835 - SURFACE
      ?auto_2534839 - SURFACE
      ?auto_2534841 - SURFACE
      ?auto_2534840 - SURFACE
      ?auto_2534842 - SURFACE
      ?auto_2534843 - SURFACE
    )
    :vars
    (
      ?auto_2534848 - HOIST
      ?auto_2534844 - PLACE
      ?auto_2534847 - PLACE
      ?auto_2534849 - HOIST
      ?auto_2534846 - SURFACE
      ?auto_2534845 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534848 ?auto_2534844 ) ( IS-CRATE ?auto_2534843 ) ( not ( = ?auto_2534842 ?auto_2534843 ) ) ( not ( = ?auto_2534840 ?auto_2534842 ) ) ( not ( = ?auto_2534840 ?auto_2534843 ) ) ( not ( = ?auto_2534847 ?auto_2534844 ) ) ( HOIST-AT ?auto_2534849 ?auto_2534847 ) ( not ( = ?auto_2534848 ?auto_2534849 ) ) ( SURFACE-AT ?auto_2534843 ?auto_2534847 ) ( ON ?auto_2534843 ?auto_2534846 ) ( CLEAR ?auto_2534843 ) ( not ( = ?auto_2534842 ?auto_2534846 ) ) ( not ( = ?auto_2534843 ?auto_2534846 ) ) ( not ( = ?auto_2534840 ?auto_2534846 ) ) ( SURFACE-AT ?auto_2534840 ?auto_2534844 ) ( CLEAR ?auto_2534840 ) ( IS-CRATE ?auto_2534842 ) ( AVAILABLE ?auto_2534848 ) ( TRUCK-AT ?auto_2534845 ?auto_2534847 ) ( LIFTING ?auto_2534849 ?auto_2534842 ) ( ON ?auto_2534837 ?auto_2534836 ) ( ON ?auto_2534838 ?auto_2534837 ) ( ON ?auto_2534835 ?auto_2534838 ) ( ON ?auto_2534839 ?auto_2534835 ) ( ON ?auto_2534841 ?auto_2534839 ) ( ON ?auto_2534840 ?auto_2534841 ) ( not ( = ?auto_2534836 ?auto_2534837 ) ) ( not ( = ?auto_2534836 ?auto_2534838 ) ) ( not ( = ?auto_2534836 ?auto_2534835 ) ) ( not ( = ?auto_2534836 ?auto_2534839 ) ) ( not ( = ?auto_2534836 ?auto_2534841 ) ) ( not ( = ?auto_2534836 ?auto_2534840 ) ) ( not ( = ?auto_2534836 ?auto_2534842 ) ) ( not ( = ?auto_2534836 ?auto_2534843 ) ) ( not ( = ?auto_2534836 ?auto_2534846 ) ) ( not ( = ?auto_2534837 ?auto_2534838 ) ) ( not ( = ?auto_2534837 ?auto_2534835 ) ) ( not ( = ?auto_2534837 ?auto_2534839 ) ) ( not ( = ?auto_2534837 ?auto_2534841 ) ) ( not ( = ?auto_2534837 ?auto_2534840 ) ) ( not ( = ?auto_2534837 ?auto_2534842 ) ) ( not ( = ?auto_2534837 ?auto_2534843 ) ) ( not ( = ?auto_2534837 ?auto_2534846 ) ) ( not ( = ?auto_2534838 ?auto_2534835 ) ) ( not ( = ?auto_2534838 ?auto_2534839 ) ) ( not ( = ?auto_2534838 ?auto_2534841 ) ) ( not ( = ?auto_2534838 ?auto_2534840 ) ) ( not ( = ?auto_2534838 ?auto_2534842 ) ) ( not ( = ?auto_2534838 ?auto_2534843 ) ) ( not ( = ?auto_2534838 ?auto_2534846 ) ) ( not ( = ?auto_2534835 ?auto_2534839 ) ) ( not ( = ?auto_2534835 ?auto_2534841 ) ) ( not ( = ?auto_2534835 ?auto_2534840 ) ) ( not ( = ?auto_2534835 ?auto_2534842 ) ) ( not ( = ?auto_2534835 ?auto_2534843 ) ) ( not ( = ?auto_2534835 ?auto_2534846 ) ) ( not ( = ?auto_2534839 ?auto_2534841 ) ) ( not ( = ?auto_2534839 ?auto_2534840 ) ) ( not ( = ?auto_2534839 ?auto_2534842 ) ) ( not ( = ?auto_2534839 ?auto_2534843 ) ) ( not ( = ?auto_2534839 ?auto_2534846 ) ) ( not ( = ?auto_2534841 ?auto_2534840 ) ) ( not ( = ?auto_2534841 ?auto_2534842 ) ) ( not ( = ?auto_2534841 ?auto_2534843 ) ) ( not ( = ?auto_2534841 ?auto_2534846 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2534840 ?auto_2534842 ?auto_2534843 )
      ( MAKE-8CRATE-VERIFY ?auto_2534836 ?auto_2534837 ?auto_2534838 ?auto_2534835 ?auto_2534839 ?auto_2534841 ?auto_2534840 ?auto_2534842 ?auto_2534843 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2534850 - SURFACE
      ?auto_2534851 - SURFACE
    )
    :vars
    (
      ?auto_2534856 - HOIST
      ?auto_2534852 - PLACE
      ?auto_2534858 - SURFACE
      ?auto_2534855 - PLACE
      ?auto_2534857 - HOIST
      ?auto_2534854 - SURFACE
      ?auto_2534853 - TRUCK
      ?auto_2534859 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534856 ?auto_2534852 ) ( IS-CRATE ?auto_2534851 ) ( not ( = ?auto_2534850 ?auto_2534851 ) ) ( not ( = ?auto_2534858 ?auto_2534850 ) ) ( not ( = ?auto_2534858 ?auto_2534851 ) ) ( not ( = ?auto_2534855 ?auto_2534852 ) ) ( HOIST-AT ?auto_2534857 ?auto_2534855 ) ( not ( = ?auto_2534856 ?auto_2534857 ) ) ( SURFACE-AT ?auto_2534851 ?auto_2534855 ) ( ON ?auto_2534851 ?auto_2534854 ) ( CLEAR ?auto_2534851 ) ( not ( = ?auto_2534850 ?auto_2534854 ) ) ( not ( = ?auto_2534851 ?auto_2534854 ) ) ( not ( = ?auto_2534858 ?auto_2534854 ) ) ( SURFACE-AT ?auto_2534858 ?auto_2534852 ) ( CLEAR ?auto_2534858 ) ( IS-CRATE ?auto_2534850 ) ( AVAILABLE ?auto_2534856 ) ( TRUCK-AT ?auto_2534853 ?auto_2534855 ) ( AVAILABLE ?auto_2534857 ) ( SURFACE-AT ?auto_2534850 ?auto_2534855 ) ( ON ?auto_2534850 ?auto_2534859 ) ( CLEAR ?auto_2534850 ) ( not ( = ?auto_2534850 ?auto_2534859 ) ) ( not ( = ?auto_2534851 ?auto_2534859 ) ) ( not ( = ?auto_2534858 ?auto_2534859 ) ) ( not ( = ?auto_2534854 ?auto_2534859 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2534857 ?auto_2534850 ?auto_2534859 ?auto_2534855 )
      ( MAKE-2CRATE ?auto_2534858 ?auto_2534850 ?auto_2534851 )
      ( MAKE-1CRATE-VERIFY ?auto_2534850 ?auto_2534851 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2534860 - SURFACE
      ?auto_2534861 - SURFACE
      ?auto_2534862 - SURFACE
    )
    :vars
    (
      ?auto_2534863 - HOIST
      ?auto_2534868 - PLACE
      ?auto_2534869 - PLACE
      ?auto_2534864 - HOIST
      ?auto_2534866 - SURFACE
      ?auto_2534867 - TRUCK
      ?auto_2534865 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534863 ?auto_2534868 ) ( IS-CRATE ?auto_2534862 ) ( not ( = ?auto_2534861 ?auto_2534862 ) ) ( not ( = ?auto_2534860 ?auto_2534861 ) ) ( not ( = ?auto_2534860 ?auto_2534862 ) ) ( not ( = ?auto_2534869 ?auto_2534868 ) ) ( HOIST-AT ?auto_2534864 ?auto_2534869 ) ( not ( = ?auto_2534863 ?auto_2534864 ) ) ( SURFACE-AT ?auto_2534862 ?auto_2534869 ) ( ON ?auto_2534862 ?auto_2534866 ) ( CLEAR ?auto_2534862 ) ( not ( = ?auto_2534861 ?auto_2534866 ) ) ( not ( = ?auto_2534862 ?auto_2534866 ) ) ( not ( = ?auto_2534860 ?auto_2534866 ) ) ( SURFACE-AT ?auto_2534860 ?auto_2534868 ) ( CLEAR ?auto_2534860 ) ( IS-CRATE ?auto_2534861 ) ( AVAILABLE ?auto_2534863 ) ( TRUCK-AT ?auto_2534867 ?auto_2534869 ) ( AVAILABLE ?auto_2534864 ) ( SURFACE-AT ?auto_2534861 ?auto_2534869 ) ( ON ?auto_2534861 ?auto_2534865 ) ( CLEAR ?auto_2534861 ) ( not ( = ?auto_2534861 ?auto_2534865 ) ) ( not ( = ?auto_2534862 ?auto_2534865 ) ) ( not ( = ?auto_2534860 ?auto_2534865 ) ) ( not ( = ?auto_2534866 ?auto_2534865 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2534861 ?auto_2534862 )
      ( MAKE-2CRATE-VERIFY ?auto_2534860 ?auto_2534861 ?auto_2534862 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2534871 - SURFACE
      ?auto_2534872 - SURFACE
      ?auto_2534873 - SURFACE
      ?auto_2534870 - SURFACE
    )
    :vars
    (
      ?auto_2534874 - HOIST
      ?auto_2534879 - PLACE
      ?auto_2534878 - PLACE
      ?auto_2534877 - HOIST
      ?auto_2534875 - SURFACE
      ?auto_2534880 - TRUCK
      ?auto_2534876 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534874 ?auto_2534879 ) ( IS-CRATE ?auto_2534870 ) ( not ( = ?auto_2534873 ?auto_2534870 ) ) ( not ( = ?auto_2534872 ?auto_2534873 ) ) ( not ( = ?auto_2534872 ?auto_2534870 ) ) ( not ( = ?auto_2534878 ?auto_2534879 ) ) ( HOIST-AT ?auto_2534877 ?auto_2534878 ) ( not ( = ?auto_2534874 ?auto_2534877 ) ) ( SURFACE-AT ?auto_2534870 ?auto_2534878 ) ( ON ?auto_2534870 ?auto_2534875 ) ( CLEAR ?auto_2534870 ) ( not ( = ?auto_2534873 ?auto_2534875 ) ) ( not ( = ?auto_2534870 ?auto_2534875 ) ) ( not ( = ?auto_2534872 ?auto_2534875 ) ) ( SURFACE-AT ?auto_2534872 ?auto_2534879 ) ( CLEAR ?auto_2534872 ) ( IS-CRATE ?auto_2534873 ) ( AVAILABLE ?auto_2534874 ) ( TRUCK-AT ?auto_2534880 ?auto_2534878 ) ( AVAILABLE ?auto_2534877 ) ( SURFACE-AT ?auto_2534873 ?auto_2534878 ) ( ON ?auto_2534873 ?auto_2534876 ) ( CLEAR ?auto_2534873 ) ( not ( = ?auto_2534873 ?auto_2534876 ) ) ( not ( = ?auto_2534870 ?auto_2534876 ) ) ( not ( = ?auto_2534872 ?auto_2534876 ) ) ( not ( = ?auto_2534875 ?auto_2534876 ) ) ( ON ?auto_2534872 ?auto_2534871 ) ( not ( = ?auto_2534871 ?auto_2534872 ) ) ( not ( = ?auto_2534871 ?auto_2534873 ) ) ( not ( = ?auto_2534871 ?auto_2534870 ) ) ( not ( = ?auto_2534871 ?auto_2534875 ) ) ( not ( = ?auto_2534871 ?auto_2534876 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2534872 ?auto_2534873 ?auto_2534870 )
      ( MAKE-3CRATE-VERIFY ?auto_2534871 ?auto_2534872 ?auto_2534873 ?auto_2534870 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2534882 - SURFACE
      ?auto_2534883 - SURFACE
      ?auto_2534884 - SURFACE
      ?auto_2534881 - SURFACE
      ?auto_2534885 - SURFACE
    )
    :vars
    (
      ?auto_2534886 - HOIST
      ?auto_2534891 - PLACE
      ?auto_2534890 - PLACE
      ?auto_2534889 - HOIST
      ?auto_2534887 - SURFACE
      ?auto_2534892 - TRUCK
      ?auto_2534888 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534886 ?auto_2534891 ) ( IS-CRATE ?auto_2534885 ) ( not ( = ?auto_2534881 ?auto_2534885 ) ) ( not ( = ?auto_2534884 ?auto_2534881 ) ) ( not ( = ?auto_2534884 ?auto_2534885 ) ) ( not ( = ?auto_2534890 ?auto_2534891 ) ) ( HOIST-AT ?auto_2534889 ?auto_2534890 ) ( not ( = ?auto_2534886 ?auto_2534889 ) ) ( SURFACE-AT ?auto_2534885 ?auto_2534890 ) ( ON ?auto_2534885 ?auto_2534887 ) ( CLEAR ?auto_2534885 ) ( not ( = ?auto_2534881 ?auto_2534887 ) ) ( not ( = ?auto_2534885 ?auto_2534887 ) ) ( not ( = ?auto_2534884 ?auto_2534887 ) ) ( SURFACE-AT ?auto_2534884 ?auto_2534891 ) ( CLEAR ?auto_2534884 ) ( IS-CRATE ?auto_2534881 ) ( AVAILABLE ?auto_2534886 ) ( TRUCK-AT ?auto_2534892 ?auto_2534890 ) ( AVAILABLE ?auto_2534889 ) ( SURFACE-AT ?auto_2534881 ?auto_2534890 ) ( ON ?auto_2534881 ?auto_2534888 ) ( CLEAR ?auto_2534881 ) ( not ( = ?auto_2534881 ?auto_2534888 ) ) ( not ( = ?auto_2534885 ?auto_2534888 ) ) ( not ( = ?auto_2534884 ?auto_2534888 ) ) ( not ( = ?auto_2534887 ?auto_2534888 ) ) ( ON ?auto_2534883 ?auto_2534882 ) ( ON ?auto_2534884 ?auto_2534883 ) ( not ( = ?auto_2534882 ?auto_2534883 ) ) ( not ( = ?auto_2534882 ?auto_2534884 ) ) ( not ( = ?auto_2534882 ?auto_2534881 ) ) ( not ( = ?auto_2534882 ?auto_2534885 ) ) ( not ( = ?auto_2534882 ?auto_2534887 ) ) ( not ( = ?auto_2534882 ?auto_2534888 ) ) ( not ( = ?auto_2534883 ?auto_2534884 ) ) ( not ( = ?auto_2534883 ?auto_2534881 ) ) ( not ( = ?auto_2534883 ?auto_2534885 ) ) ( not ( = ?auto_2534883 ?auto_2534887 ) ) ( not ( = ?auto_2534883 ?auto_2534888 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2534884 ?auto_2534881 ?auto_2534885 )
      ( MAKE-4CRATE-VERIFY ?auto_2534882 ?auto_2534883 ?auto_2534884 ?auto_2534881 ?auto_2534885 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2534894 - SURFACE
      ?auto_2534895 - SURFACE
      ?auto_2534896 - SURFACE
      ?auto_2534893 - SURFACE
      ?auto_2534897 - SURFACE
      ?auto_2534898 - SURFACE
    )
    :vars
    (
      ?auto_2534899 - HOIST
      ?auto_2534904 - PLACE
      ?auto_2534903 - PLACE
      ?auto_2534902 - HOIST
      ?auto_2534900 - SURFACE
      ?auto_2534905 - TRUCK
      ?auto_2534901 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534899 ?auto_2534904 ) ( IS-CRATE ?auto_2534898 ) ( not ( = ?auto_2534897 ?auto_2534898 ) ) ( not ( = ?auto_2534893 ?auto_2534897 ) ) ( not ( = ?auto_2534893 ?auto_2534898 ) ) ( not ( = ?auto_2534903 ?auto_2534904 ) ) ( HOIST-AT ?auto_2534902 ?auto_2534903 ) ( not ( = ?auto_2534899 ?auto_2534902 ) ) ( SURFACE-AT ?auto_2534898 ?auto_2534903 ) ( ON ?auto_2534898 ?auto_2534900 ) ( CLEAR ?auto_2534898 ) ( not ( = ?auto_2534897 ?auto_2534900 ) ) ( not ( = ?auto_2534898 ?auto_2534900 ) ) ( not ( = ?auto_2534893 ?auto_2534900 ) ) ( SURFACE-AT ?auto_2534893 ?auto_2534904 ) ( CLEAR ?auto_2534893 ) ( IS-CRATE ?auto_2534897 ) ( AVAILABLE ?auto_2534899 ) ( TRUCK-AT ?auto_2534905 ?auto_2534903 ) ( AVAILABLE ?auto_2534902 ) ( SURFACE-AT ?auto_2534897 ?auto_2534903 ) ( ON ?auto_2534897 ?auto_2534901 ) ( CLEAR ?auto_2534897 ) ( not ( = ?auto_2534897 ?auto_2534901 ) ) ( not ( = ?auto_2534898 ?auto_2534901 ) ) ( not ( = ?auto_2534893 ?auto_2534901 ) ) ( not ( = ?auto_2534900 ?auto_2534901 ) ) ( ON ?auto_2534895 ?auto_2534894 ) ( ON ?auto_2534896 ?auto_2534895 ) ( ON ?auto_2534893 ?auto_2534896 ) ( not ( = ?auto_2534894 ?auto_2534895 ) ) ( not ( = ?auto_2534894 ?auto_2534896 ) ) ( not ( = ?auto_2534894 ?auto_2534893 ) ) ( not ( = ?auto_2534894 ?auto_2534897 ) ) ( not ( = ?auto_2534894 ?auto_2534898 ) ) ( not ( = ?auto_2534894 ?auto_2534900 ) ) ( not ( = ?auto_2534894 ?auto_2534901 ) ) ( not ( = ?auto_2534895 ?auto_2534896 ) ) ( not ( = ?auto_2534895 ?auto_2534893 ) ) ( not ( = ?auto_2534895 ?auto_2534897 ) ) ( not ( = ?auto_2534895 ?auto_2534898 ) ) ( not ( = ?auto_2534895 ?auto_2534900 ) ) ( not ( = ?auto_2534895 ?auto_2534901 ) ) ( not ( = ?auto_2534896 ?auto_2534893 ) ) ( not ( = ?auto_2534896 ?auto_2534897 ) ) ( not ( = ?auto_2534896 ?auto_2534898 ) ) ( not ( = ?auto_2534896 ?auto_2534900 ) ) ( not ( = ?auto_2534896 ?auto_2534901 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2534893 ?auto_2534897 ?auto_2534898 )
      ( MAKE-5CRATE-VERIFY ?auto_2534894 ?auto_2534895 ?auto_2534896 ?auto_2534893 ?auto_2534897 ?auto_2534898 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2534907 - SURFACE
      ?auto_2534908 - SURFACE
      ?auto_2534909 - SURFACE
      ?auto_2534906 - SURFACE
      ?auto_2534910 - SURFACE
      ?auto_2534912 - SURFACE
      ?auto_2534911 - SURFACE
    )
    :vars
    (
      ?auto_2534913 - HOIST
      ?auto_2534918 - PLACE
      ?auto_2534917 - PLACE
      ?auto_2534916 - HOIST
      ?auto_2534914 - SURFACE
      ?auto_2534919 - TRUCK
      ?auto_2534915 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534913 ?auto_2534918 ) ( IS-CRATE ?auto_2534911 ) ( not ( = ?auto_2534912 ?auto_2534911 ) ) ( not ( = ?auto_2534910 ?auto_2534912 ) ) ( not ( = ?auto_2534910 ?auto_2534911 ) ) ( not ( = ?auto_2534917 ?auto_2534918 ) ) ( HOIST-AT ?auto_2534916 ?auto_2534917 ) ( not ( = ?auto_2534913 ?auto_2534916 ) ) ( SURFACE-AT ?auto_2534911 ?auto_2534917 ) ( ON ?auto_2534911 ?auto_2534914 ) ( CLEAR ?auto_2534911 ) ( not ( = ?auto_2534912 ?auto_2534914 ) ) ( not ( = ?auto_2534911 ?auto_2534914 ) ) ( not ( = ?auto_2534910 ?auto_2534914 ) ) ( SURFACE-AT ?auto_2534910 ?auto_2534918 ) ( CLEAR ?auto_2534910 ) ( IS-CRATE ?auto_2534912 ) ( AVAILABLE ?auto_2534913 ) ( TRUCK-AT ?auto_2534919 ?auto_2534917 ) ( AVAILABLE ?auto_2534916 ) ( SURFACE-AT ?auto_2534912 ?auto_2534917 ) ( ON ?auto_2534912 ?auto_2534915 ) ( CLEAR ?auto_2534912 ) ( not ( = ?auto_2534912 ?auto_2534915 ) ) ( not ( = ?auto_2534911 ?auto_2534915 ) ) ( not ( = ?auto_2534910 ?auto_2534915 ) ) ( not ( = ?auto_2534914 ?auto_2534915 ) ) ( ON ?auto_2534908 ?auto_2534907 ) ( ON ?auto_2534909 ?auto_2534908 ) ( ON ?auto_2534906 ?auto_2534909 ) ( ON ?auto_2534910 ?auto_2534906 ) ( not ( = ?auto_2534907 ?auto_2534908 ) ) ( not ( = ?auto_2534907 ?auto_2534909 ) ) ( not ( = ?auto_2534907 ?auto_2534906 ) ) ( not ( = ?auto_2534907 ?auto_2534910 ) ) ( not ( = ?auto_2534907 ?auto_2534912 ) ) ( not ( = ?auto_2534907 ?auto_2534911 ) ) ( not ( = ?auto_2534907 ?auto_2534914 ) ) ( not ( = ?auto_2534907 ?auto_2534915 ) ) ( not ( = ?auto_2534908 ?auto_2534909 ) ) ( not ( = ?auto_2534908 ?auto_2534906 ) ) ( not ( = ?auto_2534908 ?auto_2534910 ) ) ( not ( = ?auto_2534908 ?auto_2534912 ) ) ( not ( = ?auto_2534908 ?auto_2534911 ) ) ( not ( = ?auto_2534908 ?auto_2534914 ) ) ( not ( = ?auto_2534908 ?auto_2534915 ) ) ( not ( = ?auto_2534909 ?auto_2534906 ) ) ( not ( = ?auto_2534909 ?auto_2534910 ) ) ( not ( = ?auto_2534909 ?auto_2534912 ) ) ( not ( = ?auto_2534909 ?auto_2534911 ) ) ( not ( = ?auto_2534909 ?auto_2534914 ) ) ( not ( = ?auto_2534909 ?auto_2534915 ) ) ( not ( = ?auto_2534906 ?auto_2534910 ) ) ( not ( = ?auto_2534906 ?auto_2534912 ) ) ( not ( = ?auto_2534906 ?auto_2534911 ) ) ( not ( = ?auto_2534906 ?auto_2534914 ) ) ( not ( = ?auto_2534906 ?auto_2534915 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2534910 ?auto_2534912 ?auto_2534911 )
      ( MAKE-6CRATE-VERIFY ?auto_2534907 ?auto_2534908 ?auto_2534909 ?auto_2534906 ?auto_2534910 ?auto_2534912 ?auto_2534911 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2534921 - SURFACE
      ?auto_2534922 - SURFACE
      ?auto_2534923 - SURFACE
      ?auto_2534920 - SURFACE
      ?auto_2534924 - SURFACE
      ?auto_2534926 - SURFACE
      ?auto_2534925 - SURFACE
      ?auto_2534927 - SURFACE
    )
    :vars
    (
      ?auto_2534928 - HOIST
      ?auto_2534933 - PLACE
      ?auto_2534932 - PLACE
      ?auto_2534931 - HOIST
      ?auto_2534929 - SURFACE
      ?auto_2534934 - TRUCK
      ?auto_2534930 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534928 ?auto_2534933 ) ( IS-CRATE ?auto_2534927 ) ( not ( = ?auto_2534925 ?auto_2534927 ) ) ( not ( = ?auto_2534926 ?auto_2534925 ) ) ( not ( = ?auto_2534926 ?auto_2534927 ) ) ( not ( = ?auto_2534932 ?auto_2534933 ) ) ( HOIST-AT ?auto_2534931 ?auto_2534932 ) ( not ( = ?auto_2534928 ?auto_2534931 ) ) ( SURFACE-AT ?auto_2534927 ?auto_2534932 ) ( ON ?auto_2534927 ?auto_2534929 ) ( CLEAR ?auto_2534927 ) ( not ( = ?auto_2534925 ?auto_2534929 ) ) ( not ( = ?auto_2534927 ?auto_2534929 ) ) ( not ( = ?auto_2534926 ?auto_2534929 ) ) ( SURFACE-AT ?auto_2534926 ?auto_2534933 ) ( CLEAR ?auto_2534926 ) ( IS-CRATE ?auto_2534925 ) ( AVAILABLE ?auto_2534928 ) ( TRUCK-AT ?auto_2534934 ?auto_2534932 ) ( AVAILABLE ?auto_2534931 ) ( SURFACE-AT ?auto_2534925 ?auto_2534932 ) ( ON ?auto_2534925 ?auto_2534930 ) ( CLEAR ?auto_2534925 ) ( not ( = ?auto_2534925 ?auto_2534930 ) ) ( not ( = ?auto_2534927 ?auto_2534930 ) ) ( not ( = ?auto_2534926 ?auto_2534930 ) ) ( not ( = ?auto_2534929 ?auto_2534930 ) ) ( ON ?auto_2534922 ?auto_2534921 ) ( ON ?auto_2534923 ?auto_2534922 ) ( ON ?auto_2534920 ?auto_2534923 ) ( ON ?auto_2534924 ?auto_2534920 ) ( ON ?auto_2534926 ?auto_2534924 ) ( not ( = ?auto_2534921 ?auto_2534922 ) ) ( not ( = ?auto_2534921 ?auto_2534923 ) ) ( not ( = ?auto_2534921 ?auto_2534920 ) ) ( not ( = ?auto_2534921 ?auto_2534924 ) ) ( not ( = ?auto_2534921 ?auto_2534926 ) ) ( not ( = ?auto_2534921 ?auto_2534925 ) ) ( not ( = ?auto_2534921 ?auto_2534927 ) ) ( not ( = ?auto_2534921 ?auto_2534929 ) ) ( not ( = ?auto_2534921 ?auto_2534930 ) ) ( not ( = ?auto_2534922 ?auto_2534923 ) ) ( not ( = ?auto_2534922 ?auto_2534920 ) ) ( not ( = ?auto_2534922 ?auto_2534924 ) ) ( not ( = ?auto_2534922 ?auto_2534926 ) ) ( not ( = ?auto_2534922 ?auto_2534925 ) ) ( not ( = ?auto_2534922 ?auto_2534927 ) ) ( not ( = ?auto_2534922 ?auto_2534929 ) ) ( not ( = ?auto_2534922 ?auto_2534930 ) ) ( not ( = ?auto_2534923 ?auto_2534920 ) ) ( not ( = ?auto_2534923 ?auto_2534924 ) ) ( not ( = ?auto_2534923 ?auto_2534926 ) ) ( not ( = ?auto_2534923 ?auto_2534925 ) ) ( not ( = ?auto_2534923 ?auto_2534927 ) ) ( not ( = ?auto_2534923 ?auto_2534929 ) ) ( not ( = ?auto_2534923 ?auto_2534930 ) ) ( not ( = ?auto_2534920 ?auto_2534924 ) ) ( not ( = ?auto_2534920 ?auto_2534926 ) ) ( not ( = ?auto_2534920 ?auto_2534925 ) ) ( not ( = ?auto_2534920 ?auto_2534927 ) ) ( not ( = ?auto_2534920 ?auto_2534929 ) ) ( not ( = ?auto_2534920 ?auto_2534930 ) ) ( not ( = ?auto_2534924 ?auto_2534926 ) ) ( not ( = ?auto_2534924 ?auto_2534925 ) ) ( not ( = ?auto_2534924 ?auto_2534927 ) ) ( not ( = ?auto_2534924 ?auto_2534929 ) ) ( not ( = ?auto_2534924 ?auto_2534930 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2534926 ?auto_2534925 ?auto_2534927 )
      ( MAKE-7CRATE-VERIFY ?auto_2534921 ?auto_2534922 ?auto_2534923 ?auto_2534920 ?auto_2534924 ?auto_2534926 ?auto_2534925 ?auto_2534927 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2534936 - SURFACE
      ?auto_2534937 - SURFACE
      ?auto_2534938 - SURFACE
      ?auto_2534935 - SURFACE
      ?auto_2534939 - SURFACE
      ?auto_2534941 - SURFACE
      ?auto_2534940 - SURFACE
      ?auto_2534942 - SURFACE
      ?auto_2534943 - SURFACE
    )
    :vars
    (
      ?auto_2534944 - HOIST
      ?auto_2534949 - PLACE
      ?auto_2534948 - PLACE
      ?auto_2534947 - HOIST
      ?auto_2534945 - SURFACE
      ?auto_2534950 - TRUCK
      ?auto_2534946 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534944 ?auto_2534949 ) ( IS-CRATE ?auto_2534943 ) ( not ( = ?auto_2534942 ?auto_2534943 ) ) ( not ( = ?auto_2534940 ?auto_2534942 ) ) ( not ( = ?auto_2534940 ?auto_2534943 ) ) ( not ( = ?auto_2534948 ?auto_2534949 ) ) ( HOIST-AT ?auto_2534947 ?auto_2534948 ) ( not ( = ?auto_2534944 ?auto_2534947 ) ) ( SURFACE-AT ?auto_2534943 ?auto_2534948 ) ( ON ?auto_2534943 ?auto_2534945 ) ( CLEAR ?auto_2534943 ) ( not ( = ?auto_2534942 ?auto_2534945 ) ) ( not ( = ?auto_2534943 ?auto_2534945 ) ) ( not ( = ?auto_2534940 ?auto_2534945 ) ) ( SURFACE-AT ?auto_2534940 ?auto_2534949 ) ( CLEAR ?auto_2534940 ) ( IS-CRATE ?auto_2534942 ) ( AVAILABLE ?auto_2534944 ) ( TRUCK-AT ?auto_2534950 ?auto_2534948 ) ( AVAILABLE ?auto_2534947 ) ( SURFACE-AT ?auto_2534942 ?auto_2534948 ) ( ON ?auto_2534942 ?auto_2534946 ) ( CLEAR ?auto_2534942 ) ( not ( = ?auto_2534942 ?auto_2534946 ) ) ( not ( = ?auto_2534943 ?auto_2534946 ) ) ( not ( = ?auto_2534940 ?auto_2534946 ) ) ( not ( = ?auto_2534945 ?auto_2534946 ) ) ( ON ?auto_2534937 ?auto_2534936 ) ( ON ?auto_2534938 ?auto_2534937 ) ( ON ?auto_2534935 ?auto_2534938 ) ( ON ?auto_2534939 ?auto_2534935 ) ( ON ?auto_2534941 ?auto_2534939 ) ( ON ?auto_2534940 ?auto_2534941 ) ( not ( = ?auto_2534936 ?auto_2534937 ) ) ( not ( = ?auto_2534936 ?auto_2534938 ) ) ( not ( = ?auto_2534936 ?auto_2534935 ) ) ( not ( = ?auto_2534936 ?auto_2534939 ) ) ( not ( = ?auto_2534936 ?auto_2534941 ) ) ( not ( = ?auto_2534936 ?auto_2534940 ) ) ( not ( = ?auto_2534936 ?auto_2534942 ) ) ( not ( = ?auto_2534936 ?auto_2534943 ) ) ( not ( = ?auto_2534936 ?auto_2534945 ) ) ( not ( = ?auto_2534936 ?auto_2534946 ) ) ( not ( = ?auto_2534937 ?auto_2534938 ) ) ( not ( = ?auto_2534937 ?auto_2534935 ) ) ( not ( = ?auto_2534937 ?auto_2534939 ) ) ( not ( = ?auto_2534937 ?auto_2534941 ) ) ( not ( = ?auto_2534937 ?auto_2534940 ) ) ( not ( = ?auto_2534937 ?auto_2534942 ) ) ( not ( = ?auto_2534937 ?auto_2534943 ) ) ( not ( = ?auto_2534937 ?auto_2534945 ) ) ( not ( = ?auto_2534937 ?auto_2534946 ) ) ( not ( = ?auto_2534938 ?auto_2534935 ) ) ( not ( = ?auto_2534938 ?auto_2534939 ) ) ( not ( = ?auto_2534938 ?auto_2534941 ) ) ( not ( = ?auto_2534938 ?auto_2534940 ) ) ( not ( = ?auto_2534938 ?auto_2534942 ) ) ( not ( = ?auto_2534938 ?auto_2534943 ) ) ( not ( = ?auto_2534938 ?auto_2534945 ) ) ( not ( = ?auto_2534938 ?auto_2534946 ) ) ( not ( = ?auto_2534935 ?auto_2534939 ) ) ( not ( = ?auto_2534935 ?auto_2534941 ) ) ( not ( = ?auto_2534935 ?auto_2534940 ) ) ( not ( = ?auto_2534935 ?auto_2534942 ) ) ( not ( = ?auto_2534935 ?auto_2534943 ) ) ( not ( = ?auto_2534935 ?auto_2534945 ) ) ( not ( = ?auto_2534935 ?auto_2534946 ) ) ( not ( = ?auto_2534939 ?auto_2534941 ) ) ( not ( = ?auto_2534939 ?auto_2534940 ) ) ( not ( = ?auto_2534939 ?auto_2534942 ) ) ( not ( = ?auto_2534939 ?auto_2534943 ) ) ( not ( = ?auto_2534939 ?auto_2534945 ) ) ( not ( = ?auto_2534939 ?auto_2534946 ) ) ( not ( = ?auto_2534941 ?auto_2534940 ) ) ( not ( = ?auto_2534941 ?auto_2534942 ) ) ( not ( = ?auto_2534941 ?auto_2534943 ) ) ( not ( = ?auto_2534941 ?auto_2534945 ) ) ( not ( = ?auto_2534941 ?auto_2534946 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2534940 ?auto_2534942 ?auto_2534943 )
      ( MAKE-8CRATE-VERIFY ?auto_2534936 ?auto_2534937 ?auto_2534938 ?auto_2534935 ?auto_2534939 ?auto_2534941 ?auto_2534940 ?auto_2534942 ?auto_2534943 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2534951 - SURFACE
      ?auto_2534952 - SURFACE
    )
    :vars
    (
      ?auto_2534953 - HOIST
      ?auto_2534959 - PLACE
      ?auto_2534954 - SURFACE
      ?auto_2534958 - PLACE
      ?auto_2534957 - HOIST
      ?auto_2534955 - SURFACE
      ?auto_2534956 - SURFACE
      ?auto_2534960 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534953 ?auto_2534959 ) ( IS-CRATE ?auto_2534952 ) ( not ( = ?auto_2534951 ?auto_2534952 ) ) ( not ( = ?auto_2534954 ?auto_2534951 ) ) ( not ( = ?auto_2534954 ?auto_2534952 ) ) ( not ( = ?auto_2534958 ?auto_2534959 ) ) ( HOIST-AT ?auto_2534957 ?auto_2534958 ) ( not ( = ?auto_2534953 ?auto_2534957 ) ) ( SURFACE-AT ?auto_2534952 ?auto_2534958 ) ( ON ?auto_2534952 ?auto_2534955 ) ( CLEAR ?auto_2534952 ) ( not ( = ?auto_2534951 ?auto_2534955 ) ) ( not ( = ?auto_2534952 ?auto_2534955 ) ) ( not ( = ?auto_2534954 ?auto_2534955 ) ) ( SURFACE-AT ?auto_2534954 ?auto_2534959 ) ( CLEAR ?auto_2534954 ) ( IS-CRATE ?auto_2534951 ) ( AVAILABLE ?auto_2534953 ) ( AVAILABLE ?auto_2534957 ) ( SURFACE-AT ?auto_2534951 ?auto_2534958 ) ( ON ?auto_2534951 ?auto_2534956 ) ( CLEAR ?auto_2534951 ) ( not ( = ?auto_2534951 ?auto_2534956 ) ) ( not ( = ?auto_2534952 ?auto_2534956 ) ) ( not ( = ?auto_2534954 ?auto_2534956 ) ) ( not ( = ?auto_2534955 ?auto_2534956 ) ) ( TRUCK-AT ?auto_2534960 ?auto_2534959 ) )
    :subtasks
    ( ( !DRIVE ?auto_2534960 ?auto_2534959 ?auto_2534958 )
      ( MAKE-2CRATE ?auto_2534954 ?auto_2534951 ?auto_2534952 )
      ( MAKE-1CRATE-VERIFY ?auto_2534951 ?auto_2534952 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2534961 - SURFACE
      ?auto_2534962 - SURFACE
      ?auto_2534963 - SURFACE
    )
    :vars
    (
      ?auto_2534966 - HOIST
      ?auto_2534969 - PLACE
      ?auto_2534967 - PLACE
      ?auto_2534968 - HOIST
      ?auto_2534970 - SURFACE
      ?auto_2534965 - SURFACE
      ?auto_2534964 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534966 ?auto_2534969 ) ( IS-CRATE ?auto_2534963 ) ( not ( = ?auto_2534962 ?auto_2534963 ) ) ( not ( = ?auto_2534961 ?auto_2534962 ) ) ( not ( = ?auto_2534961 ?auto_2534963 ) ) ( not ( = ?auto_2534967 ?auto_2534969 ) ) ( HOIST-AT ?auto_2534968 ?auto_2534967 ) ( not ( = ?auto_2534966 ?auto_2534968 ) ) ( SURFACE-AT ?auto_2534963 ?auto_2534967 ) ( ON ?auto_2534963 ?auto_2534970 ) ( CLEAR ?auto_2534963 ) ( not ( = ?auto_2534962 ?auto_2534970 ) ) ( not ( = ?auto_2534963 ?auto_2534970 ) ) ( not ( = ?auto_2534961 ?auto_2534970 ) ) ( SURFACE-AT ?auto_2534961 ?auto_2534969 ) ( CLEAR ?auto_2534961 ) ( IS-CRATE ?auto_2534962 ) ( AVAILABLE ?auto_2534966 ) ( AVAILABLE ?auto_2534968 ) ( SURFACE-AT ?auto_2534962 ?auto_2534967 ) ( ON ?auto_2534962 ?auto_2534965 ) ( CLEAR ?auto_2534962 ) ( not ( = ?auto_2534962 ?auto_2534965 ) ) ( not ( = ?auto_2534963 ?auto_2534965 ) ) ( not ( = ?auto_2534961 ?auto_2534965 ) ) ( not ( = ?auto_2534970 ?auto_2534965 ) ) ( TRUCK-AT ?auto_2534964 ?auto_2534969 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2534962 ?auto_2534963 )
      ( MAKE-2CRATE-VERIFY ?auto_2534961 ?auto_2534962 ?auto_2534963 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2534972 - SURFACE
      ?auto_2534973 - SURFACE
      ?auto_2534974 - SURFACE
      ?auto_2534971 - SURFACE
    )
    :vars
    (
      ?auto_2534977 - HOIST
      ?auto_2534976 - PLACE
      ?auto_2534978 - PLACE
      ?auto_2534975 - HOIST
      ?auto_2534981 - SURFACE
      ?auto_2534980 - SURFACE
      ?auto_2534979 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534977 ?auto_2534976 ) ( IS-CRATE ?auto_2534971 ) ( not ( = ?auto_2534974 ?auto_2534971 ) ) ( not ( = ?auto_2534973 ?auto_2534974 ) ) ( not ( = ?auto_2534973 ?auto_2534971 ) ) ( not ( = ?auto_2534978 ?auto_2534976 ) ) ( HOIST-AT ?auto_2534975 ?auto_2534978 ) ( not ( = ?auto_2534977 ?auto_2534975 ) ) ( SURFACE-AT ?auto_2534971 ?auto_2534978 ) ( ON ?auto_2534971 ?auto_2534981 ) ( CLEAR ?auto_2534971 ) ( not ( = ?auto_2534974 ?auto_2534981 ) ) ( not ( = ?auto_2534971 ?auto_2534981 ) ) ( not ( = ?auto_2534973 ?auto_2534981 ) ) ( SURFACE-AT ?auto_2534973 ?auto_2534976 ) ( CLEAR ?auto_2534973 ) ( IS-CRATE ?auto_2534974 ) ( AVAILABLE ?auto_2534977 ) ( AVAILABLE ?auto_2534975 ) ( SURFACE-AT ?auto_2534974 ?auto_2534978 ) ( ON ?auto_2534974 ?auto_2534980 ) ( CLEAR ?auto_2534974 ) ( not ( = ?auto_2534974 ?auto_2534980 ) ) ( not ( = ?auto_2534971 ?auto_2534980 ) ) ( not ( = ?auto_2534973 ?auto_2534980 ) ) ( not ( = ?auto_2534981 ?auto_2534980 ) ) ( TRUCK-AT ?auto_2534979 ?auto_2534976 ) ( ON ?auto_2534973 ?auto_2534972 ) ( not ( = ?auto_2534972 ?auto_2534973 ) ) ( not ( = ?auto_2534972 ?auto_2534974 ) ) ( not ( = ?auto_2534972 ?auto_2534971 ) ) ( not ( = ?auto_2534972 ?auto_2534981 ) ) ( not ( = ?auto_2534972 ?auto_2534980 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2534973 ?auto_2534974 ?auto_2534971 )
      ( MAKE-3CRATE-VERIFY ?auto_2534972 ?auto_2534973 ?auto_2534974 ?auto_2534971 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2534983 - SURFACE
      ?auto_2534984 - SURFACE
      ?auto_2534985 - SURFACE
      ?auto_2534982 - SURFACE
      ?auto_2534986 - SURFACE
    )
    :vars
    (
      ?auto_2534989 - HOIST
      ?auto_2534988 - PLACE
      ?auto_2534990 - PLACE
      ?auto_2534987 - HOIST
      ?auto_2534993 - SURFACE
      ?auto_2534992 - SURFACE
      ?auto_2534991 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2534989 ?auto_2534988 ) ( IS-CRATE ?auto_2534986 ) ( not ( = ?auto_2534982 ?auto_2534986 ) ) ( not ( = ?auto_2534985 ?auto_2534982 ) ) ( not ( = ?auto_2534985 ?auto_2534986 ) ) ( not ( = ?auto_2534990 ?auto_2534988 ) ) ( HOIST-AT ?auto_2534987 ?auto_2534990 ) ( not ( = ?auto_2534989 ?auto_2534987 ) ) ( SURFACE-AT ?auto_2534986 ?auto_2534990 ) ( ON ?auto_2534986 ?auto_2534993 ) ( CLEAR ?auto_2534986 ) ( not ( = ?auto_2534982 ?auto_2534993 ) ) ( not ( = ?auto_2534986 ?auto_2534993 ) ) ( not ( = ?auto_2534985 ?auto_2534993 ) ) ( SURFACE-AT ?auto_2534985 ?auto_2534988 ) ( CLEAR ?auto_2534985 ) ( IS-CRATE ?auto_2534982 ) ( AVAILABLE ?auto_2534989 ) ( AVAILABLE ?auto_2534987 ) ( SURFACE-AT ?auto_2534982 ?auto_2534990 ) ( ON ?auto_2534982 ?auto_2534992 ) ( CLEAR ?auto_2534982 ) ( not ( = ?auto_2534982 ?auto_2534992 ) ) ( not ( = ?auto_2534986 ?auto_2534992 ) ) ( not ( = ?auto_2534985 ?auto_2534992 ) ) ( not ( = ?auto_2534993 ?auto_2534992 ) ) ( TRUCK-AT ?auto_2534991 ?auto_2534988 ) ( ON ?auto_2534984 ?auto_2534983 ) ( ON ?auto_2534985 ?auto_2534984 ) ( not ( = ?auto_2534983 ?auto_2534984 ) ) ( not ( = ?auto_2534983 ?auto_2534985 ) ) ( not ( = ?auto_2534983 ?auto_2534982 ) ) ( not ( = ?auto_2534983 ?auto_2534986 ) ) ( not ( = ?auto_2534983 ?auto_2534993 ) ) ( not ( = ?auto_2534983 ?auto_2534992 ) ) ( not ( = ?auto_2534984 ?auto_2534985 ) ) ( not ( = ?auto_2534984 ?auto_2534982 ) ) ( not ( = ?auto_2534984 ?auto_2534986 ) ) ( not ( = ?auto_2534984 ?auto_2534993 ) ) ( not ( = ?auto_2534984 ?auto_2534992 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2534985 ?auto_2534982 ?auto_2534986 )
      ( MAKE-4CRATE-VERIFY ?auto_2534983 ?auto_2534984 ?auto_2534985 ?auto_2534982 ?auto_2534986 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2534995 - SURFACE
      ?auto_2534996 - SURFACE
      ?auto_2534997 - SURFACE
      ?auto_2534994 - SURFACE
      ?auto_2534998 - SURFACE
      ?auto_2534999 - SURFACE
    )
    :vars
    (
      ?auto_2535002 - HOIST
      ?auto_2535001 - PLACE
      ?auto_2535003 - PLACE
      ?auto_2535000 - HOIST
      ?auto_2535006 - SURFACE
      ?auto_2535005 - SURFACE
      ?auto_2535004 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2535002 ?auto_2535001 ) ( IS-CRATE ?auto_2534999 ) ( not ( = ?auto_2534998 ?auto_2534999 ) ) ( not ( = ?auto_2534994 ?auto_2534998 ) ) ( not ( = ?auto_2534994 ?auto_2534999 ) ) ( not ( = ?auto_2535003 ?auto_2535001 ) ) ( HOIST-AT ?auto_2535000 ?auto_2535003 ) ( not ( = ?auto_2535002 ?auto_2535000 ) ) ( SURFACE-AT ?auto_2534999 ?auto_2535003 ) ( ON ?auto_2534999 ?auto_2535006 ) ( CLEAR ?auto_2534999 ) ( not ( = ?auto_2534998 ?auto_2535006 ) ) ( not ( = ?auto_2534999 ?auto_2535006 ) ) ( not ( = ?auto_2534994 ?auto_2535006 ) ) ( SURFACE-AT ?auto_2534994 ?auto_2535001 ) ( CLEAR ?auto_2534994 ) ( IS-CRATE ?auto_2534998 ) ( AVAILABLE ?auto_2535002 ) ( AVAILABLE ?auto_2535000 ) ( SURFACE-AT ?auto_2534998 ?auto_2535003 ) ( ON ?auto_2534998 ?auto_2535005 ) ( CLEAR ?auto_2534998 ) ( not ( = ?auto_2534998 ?auto_2535005 ) ) ( not ( = ?auto_2534999 ?auto_2535005 ) ) ( not ( = ?auto_2534994 ?auto_2535005 ) ) ( not ( = ?auto_2535006 ?auto_2535005 ) ) ( TRUCK-AT ?auto_2535004 ?auto_2535001 ) ( ON ?auto_2534996 ?auto_2534995 ) ( ON ?auto_2534997 ?auto_2534996 ) ( ON ?auto_2534994 ?auto_2534997 ) ( not ( = ?auto_2534995 ?auto_2534996 ) ) ( not ( = ?auto_2534995 ?auto_2534997 ) ) ( not ( = ?auto_2534995 ?auto_2534994 ) ) ( not ( = ?auto_2534995 ?auto_2534998 ) ) ( not ( = ?auto_2534995 ?auto_2534999 ) ) ( not ( = ?auto_2534995 ?auto_2535006 ) ) ( not ( = ?auto_2534995 ?auto_2535005 ) ) ( not ( = ?auto_2534996 ?auto_2534997 ) ) ( not ( = ?auto_2534996 ?auto_2534994 ) ) ( not ( = ?auto_2534996 ?auto_2534998 ) ) ( not ( = ?auto_2534996 ?auto_2534999 ) ) ( not ( = ?auto_2534996 ?auto_2535006 ) ) ( not ( = ?auto_2534996 ?auto_2535005 ) ) ( not ( = ?auto_2534997 ?auto_2534994 ) ) ( not ( = ?auto_2534997 ?auto_2534998 ) ) ( not ( = ?auto_2534997 ?auto_2534999 ) ) ( not ( = ?auto_2534997 ?auto_2535006 ) ) ( not ( = ?auto_2534997 ?auto_2535005 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2534994 ?auto_2534998 ?auto_2534999 )
      ( MAKE-5CRATE-VERIFY ?auto_2534995 ?auto_2534996 ?auto_2534997 ?auto_2534994 ?auto_2534998 ?auto_2534999 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2535008 - SURFACE
      ?auto_2535009 - SURFACE
      ?auto_2535010 - SURFACE
      ?auto_2535007 - SURFACE
      ?auto_2535011 - SURFACE
      ?auto_2535013 - SURFACE
      ?auto_2535012 - SURFACE
    )
    :vars
    (
      ?auto_2535016 - HOIST
      ?auto_2535015 - PLACE
      ?auto_2535017 - PLACE
      ?auto_2535014 - HOIST
      ?auto_2535020 - SURFACE
      ?auto_2535019 - SURFACE
      ?auto_2535018 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2535016 ?auto_2535015 ) ( IS-CRATE ?auto_2535012 ) ( not ( = ?auto_2535013 ?auto_2535012 ) ) ( not ( = ?auto_2535011 ?auto_2535013 ) ) ( not ( = ?auto_2535011 ?auto_2535012 ) ) ( not ( = ?auto_2535017 ?auto_2535015 ) ) ( HOIST-AT ?auto_2535014 ?auto_2535017 ) ( not ( = ?auto_2535016 ?auto_2535014 ) ) ( SURFACE-AT ?auto_2535012 ?auto_2535017 ) ( ON ?auto_2535012 ?auto_2535020 ) ( CLEAR ?auto_2535012 ) ( not ( = ?auto_2535013 ?auto_2535020 ) ) ( not ( = ?auto_2535012 ?auto_2535020 ) ) ( not ( = ?auto_2535011 ?auto_2535020 ) ) ( SURFACE-AT ?auto_2535011 ?auto_2535015 ) ( CLEAR ?auto_2535011 ) ( IS-CRATE ?auto_2535013 ) ( AVAILABLE ?auto_2535016 ) ( AVAILABLE ?auto_2535014 ) ( SURFACE-AT ?auto_2535013 ?auto_2535017 ) ( ON ?auto_2535013 ?auto_2535019 ) ( CLEAR ?auto_2535013 ) ( not ( = ?auto_2535013 ?auto_2535019 ) ) ( not ( = ?auto_2535012 ?auto_2535019 ) ) ( not ( = ?auto_2535011 ?auto_2535019 ) ) ( not ( = ?auto_2535020 ?auto_2535019 ) ) ( TRUCK-AT ?auto_2535018 ?auto_2535015 ) ( ON ?auto_2535009 ?auto_2535008 ) ( ON ?auto_2535010 ?auto_2535009 ) ( ON ?auto_2535007 ?auto_2535010 ) ( ON ?auto_2535011 ?auto_2535007 ) ( not ( = ?auto_2535008 ?auto_2535009 ) ) ( not ( = ?auto_2535008 ?auto_2535010 ) ) ( not ( = ?auto_2535008 ?auto_2535007 ) ) ( not ( = ?auto_2535008 ?auto_2535011 ) ) ( not ( = ?auto_2535008 ?auto_2535013 ) ) ( not ( = ?auto_2535008 ?auto_2535012 ) ) ( not ( = ?auto_2535008 ?auto_2535020 ) ) ( not ( = ?auto_2535008 ?auto_2535019 ) ) ( not ( = ?auto_2535009 ?auto_2535010 ) ) ( not ( = ?auto_2535009 ?auto_2535007 ) ) ( not ( = ?auto_2535009 ?auto_2535011 ) ) ( not ( = ?auto_2535009 ?auto_2535013 ) ) ( not ( = ?auto_2535009 ?auto_2535012 ) ) ( not ( = ?auto_2535009 ?auto_2535020 ) ) ( not ( = ?auto_2535009 ?auto_2535019 ) ) ( not ( = ?auto_2535010 ?auto_2535007 ) ) ( not ( = ?auto_2535010 ?auto_2535011 ) ) ( not ( = ?auto_2535010 ?auto_2535013 ) ) ( not ( = ?auto_2535010 ?auto_2535012 ) ) ( not ( = ?auto_2535010 ?auto_2535020 ) ) ( not ( = ?auto_2535010 ?auto_2535019 ) ) ( not ( = ?auto_2535007 ?auto_2535011 ) ) ( not ( = ?auto_2535007 ?auto_2535013 ) ) ( not ( = ?auto_2535007 ?auto_2535012 ) ) ( not ( = ?auto_2535007 ?auto_2535020 ) ) ( not ( = ?auto_2535007 ?auto_2535019 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2535011 ?auto_2535013 ?auto_2535012 )
      ( MAKE-6CRATE-VERIFY ?auto_2535008 ?auto_2535009 ?auto_2535010 ?auto_2535007 ?auto_2535011 ?auto_2535013 ?auto_2535012 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2535022 - SURFACE
      ?auto_2535023 - SURFACE
      ?auto_2535024 - SURFACE
      ?auto_2535021 - SURFACE
      ?auto_2535025 - SURFACE
      ?auto_2535027 - SURFACE
      ?auto_2535026 - SURFACE
      ?auto_2535028 - SURFACE
    )
    :vars
    (
      ?auto_2535031 - HOIST
      ?auto_2535030 - PLACE
      ?auto_2535032 - PLACE
      ?auto_2535029 - HOIST
      ?auto_2535035 - SURFACE
      ?auto_2535034 - SURFACE
      ?auto_2535033 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2535031 ?auto_2535030 ) ( IS-CRATE ?auto_2535028 ) ( not ( = ?auto_2535026 ?auto_2535028 ) ) ( not ( = ?auto_2535027 ?auto_2535026 ) ) ( not ( = ?auto_2535027 ?auto_2535028 ) ) ( not ( = ?auto_2535032 ?auto_2535030 ) ) ( HOIST-AT ?auto_2535029 ?auto_2535032 ) ( not ( = ?auto_2535031 ?auto_2535029 ) ) ( SURFACE-AT ?auto_2535028 ?auto_2535032 ) ( ON ?auto_2535028 ?auto_2535035 ) ( CLEAR ?auto_2535028 ) ( not ( = ?auto_2535026 ?auto_2535035 ) ) ( not ( = ?auto_2535028 ?auto_2535035 ) ) ( not ( = ?auto_2535027 ?auto_2535035 ) ) ( SURFACE-AT ?auto_2535027 ?auto_2535030 ) ( CLEAR ?auto_2535027 ) ( IS-CRATE ?auto_2535026 ) ( AVAILABLE ?auto_2535031 ) ( AVAILABLE ?auto_2535029 ) ( SURFACE-AT ?auto_2535026 ?auto_2535032 ) ( ON ?auto_2535026 ?auto_2535034 ) ( CLEAR ?auto_2535026 ) ( not ( = ?auto_2535026 ?auto_2535034 ) ) ( not ( = ?auto_2535028 ?auto_2535034 ) ) ( not ( = ?auto_2535027 ?auto_2535034 ) ) ( not ( = ?auto_2535035 ?auto_2535034 ) ) ( TRUCK-AT ?auto_2535033 ?auto_2535030 ) ( ON ?auto_2535023 ?auto_2535022 ) ( ON ?auto_2535024 ?auto_2535023 ) ( ON ?auto_2535021 ?auto_2535024 ) ( ON ?auto_2535025 ?auto_2535021 ) ( ON ?auto_2535027 ?auto_2535025 ) ( not ( = ?auto_2535022 ?auto_2535023 ) ) ( not ( = ?auto_2535022 ?auto_2535024 ) ) ( not ( = ?auto_2535022 ?auto_2535021 ) ) ( not ( = ?auto_2535022 ?auto_2535025 ) ) ( not ( = ?auto_2535022 ?auto_2535027 ) ) ( not ( = ?auto_2535022 ?auto_2535026 ) ) ( not ( = ?auto_2535022 ?auto_2535028 ) ) ( not ( = ?auto_2535022 ?auto_2535035 ) ) ( not ( = ?auto_2535022 ?auto_2535034 ) ) ( not ( = ?auto_2535023 ?auto_2535024 ) ) ( not ( = ?auto_2535023 ?auto_2535021 ) ) ( not ( = ?auto_2535023 ?auto_2535025 ) ) ( not ( = ?auto_2535023 ?auto_2535027 ) ) ( not ( = ?auto_2535023 ?auto_2535026 ) ) ( not ( = ?auto_2535023 ?auto_2535028 ) ) ( not ( = ?auto_2535023 ?auto_2535035 ) ) ( not ( = ?auto_2535023 ?auto_2535034 ) ) ( not ( = ?auto_2535024 ?auto_2535021 ) ) ( not ( = ?auto_2535024 ?auto_2535025 ) ) ( not ( = ?auto_2535024 ?auto_2535027 ) ) ( not ( = ?auto_2535024 ?auto_2535026 ) ) ( not ( = ?auto_2535024 ?auto_2535028 ) ) ( not ( = ?auto_2535024 ?auto_2535035 ) ) ( not ( = ?auto_2535024 ?auto_2535034 ) ) ( not ( = ?auto_2535021 ?auto_2535025 ) ) ( not ( = ?auto_2535021 ?auto_2535027 ) ) ( not ( = ?auto_2535021 ?auto_2535026 ) ) ( not ( = ?auto_2535021 ?auto_2535028 ) ) ( not ( = ?auto_2535021 ?auto_2535035 ) ) ( not ( = ?auto_2535021 ?auto_2535034 ) ) ( not ( = ?auto_2535025 ?auto_2535027 ) ) ( not ( = ?auto_2535025 ?auto_2535026 ) ) ( not ( = ?auto_2535025 ?auto_2535028 ) ) ( not ( = ?auto_2535025 ?auto_2535035 ) ) ( not ( = ?auto_2535025 ?auto_2535034 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2535027 ?auto_2535026 ?auto_2535028 )
      ( MAKE-7CRATE-VERIFY ?auto_2535022 ?auto_2535023 ?auto_2535024 ?auto_2535021 ?auto_2535025 ?auto_2535027 ?auto_2535026 ?auto_2535028 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2535037 - SURFACE
      ?auto_2535038 - SURFACE
      ?auto_2535039 - SURFACE
      ?auto_2535036 - SURFACE
      ?auto_2535040 - SURFACE
      ?auto_2535042 - SURFACE
      ?auto_2535041 - SURFACE
      ?auto_2535043 - SURFACE
      ?auto_2535044 - SURFACE
    )
    :vars
    (
      ?auto_2535047 - HOIST
      ?auto_2535046 - PLACE
      ?auto_2535048 - PLACE
      ?auto_2535045 - HOIST
      ?auto_2535051 - SURFACE
      ?auto_2535050 - SURFACE
      ?auto_2535049 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2535047 ?auto_2535046 ) ( IS-CRATE ?auto_2535044 ) ( not ( = ?auto_2535043 ?auto_2535044 ) ) ( not ( = ?auto_2535041 ?auto_2535043 ) ) ( not ( = ?auto_2535041 ?auto_2535044 ) ) ( not ( = ?auto_2535048 ?auto_2535046 ) ) ( HOIST-AT ?auto_2535045 ?auto_2535048 ) ( not ( = ?auto_2535047 ?auto_2535045 ) ) ( SURFACE-AT ?auto_2535044 ?auto_2535048 ) ( ON ?auto_2535044 ?auto_2535051 ) ( CLEAR ?auto_2535044 ) ( not ( = ?auto_2535043 ?auto_2535051 ) ) ( not ( = ?auto_2535044 ?auto_2535051 ) ) ( not ( = ?auto_2535041 ?auto_2535051 ) ) ( SURFACE-AT ?auto_2535041 ?auto_2535046 ) ( CLEAR ?auto_2535041 ) ( IS-CRATE ?auto_2535043 ) ( AVAILABLE ?auto_2535047 ) ( AVAILABLE ?auto_2535045 ) ( SURFACE-AT ?auto_2535043 ?auto_2535048 ) ( ON ?auto_2535043 ?auto_2535050 ) ( CLEAR ?auto_2535043 ) ( not ( = ?auto_2535043 ?auto_2535050 ) ) ( not ( = ?auto_2535044 ?auto_2535050 ) ) ( not ( = ?auto_2535041 ?auto_2535050 ) ) ( not ( = ?auto_2535051 ?auto_2535050 ) ) ( TRUCK-AT ?auto_2535049 ?auto_2535046 ) ( ON ?auto_2535038 ?auto_2535037 ) ( ON ?auto_2535039 ?auto_2535038 ) ( ON ?auto_2535036 ?auto_2535039 ) ( ON ?auto_2535040 ?auto_2535036 ) ( ON ?auto_2535042 ?auto_2535040 ) ( ON ?auto_2535041 ?auto_2535042 ) ( not ( = ?auto_2535037 ?auto_2535038 ) ) ( not ( = ?auto_2535037 ?auto_2535039 ) ) ( not ( = ?auto_2535037 ?auto_2535036 ) ) ( not ( = ?auto_2535037 ?auto_2535040 ) ) ( not ( = ?auto_2535037 ?auto_2535042 ) ) ( not ( = ?auto_2535037 ?auto_2535041 ) ) ( not ( = ?auto_2535037 ?auto_2535043 ) ) ( not ( = ?auto_2535037 ?auto_2535044 ) ) ( not ( = ?auto_2535037 ?auto_2535051 ) ) ( not ( = ?auto_2535037 ?auto_2535050 ) ) ( not ( = ?auto_2535038 ?auto_2535039 ) ) ( not ( = ?auto_2535038 ?auto_2535036 ) ) ( not ( = ?auto_2535038 ?auto_2535040 ) ) ( not ( = ?auto_2535038 ?auto_2535042 ) ) ( not ( = ?auto_2535038 ?auto_2535041 ) ) ( not ( = ?auto_2535038 ?auto_2535043 ) ) ( not ( = ?auto_2535038 ?auto_2535044 ) ) ( not ( = ?auto_2535038 ?auto_2535051 ) ) ( not ( = ?auto_2535038 ?auto_2535050 ) ) ( not ( = ?auto_2535039 ?auto_2535036 ) ) ( not ( = ?auto_2535039 ?auto_2535040 ) ) ( not ( = ?auto_2535039 ?auto_2535042 ) ) ( not ( = ?auto_2535039 ?auto_2535041 ) ) ( not ( = ?auto_2535039 ?auto_2535043 ) ) ( not ( = ?auto_2535039 ?auto_2535044 ) ) ( not ( = ?auto_2535039 ?auto_2535051 ) ) ( not ( = ?auto_2535039 ?auto_2535050 ) ) ( not ( = ?auto_2535036 ?auto_2535040 ) ) ( not ( = ?auto_2535036 ?auto_2535042 ) ) ( not ( = ?auto_2535036 ?auto_2535041 ) ) ( not ( = ?auto_2535036 ?auto_2535043 ) ) ( not ( = ?auto_2535036 ?auto_2535044 ) ) ( not ( = ?auto_2535036 ?auto_2535051 ) ) ( not ( = ?auto_2535036 ?auto_2535050 ) ) ( not ( = ?auto_2535040 ?auto_2535042 ) ) ( not ( = ?auto_2535040 ?auto_2535041 ) ) ( not ( = ?auto_2535040 ?auto_2535043 ) ) ( not ( = ?auto_2535040 ?auto_2535044 ) ) ( not ( = ?auto_2535040 ?auto_2535051 ) ) ( not ( = ?auto_2535040 ?auto_2535050 ) ) ( not ( = ?auto_2535042 ?auto_2535041 ) ) ( not ( = ?auto_2535042 ?auto_2535043 ) ) ( not ( = ?auto_2535042 ?auto_2535044 ) ) ( not ( = ?auto_2535042 ?auto_2535051 ) ) ( not ( = ?auto_2535042 ?auto_2535050 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2535041 ?auto_2535043 ?auto_2535044 )
      ( MAKE-8CRATE-VERIFY ?auto_2535037 ?auto_2535038 ?auto_2535039 ?auto_2535036 ?auto_2535040 ?auto_2535042 ?auto_2535041 ?auto_2535043 ?auto_2535044 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2535052 - SURFACE
      ?auto_2535053 - SURFACE
    )
    :vars
    (
      ?auto_2535056 - HOIST
      ?auto_2535055 - PLACE
      ?auto_2535059 - SURFACE
      ?auto_2535057 - PLACE
      ?auto_2535054 - HOIST
      ?auto_2535061 - SURFACE
      ?auto_2535060 - SURFACE
      ?auto_2535058 - TRUCK
      ?auto_2535062 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2535056 ?auto_2535055 ) ( IS-CRATE ?auto_2535053 ) ( not ( = ?auto_2535052 ?auto_2535053 ) ) ( not ( = ?auto_2535059 ?auto_2535052 ) ) ( not ( = ?auto_2535059 ?auto_2535053 ) ) ( not ( = ?auto_2535057 ?auto_2535055 ) ) ( HOIST-AT ?auto_2535054 ?auto_2535057 ) ( not ( = ?auto_2535056 ?auto_2535054 ) ) ( SURFACE-AT ?auto_2535053 ?auto_2535057 ) ( ON ?auto_2535053 ?auto_2535061 ) ( CLEAR ?auto_2535053 ) ( not ( = ?auto_2535052 ?auto_2535061 ) ) ( not ( = ?auto_2535053 ?auto_2535061 ) ) ( not ( = ?auto_2535059 ?auto_2535061 ) ) ( IS-CRATE ?auto_2535052 ) ( AVAILABLE ?auto_2535054 ) ( SURFACE-AT ?auto_2535052 ?auto_2535057 ) ( ON ?auto_2535052 ?auto_2535060 ) ( CLEAR ?auto_2535052 ) ( not ( = ?auto_2535052 ?auto_2535060 ) ) ( not ( = ?auto_2535053 ?auto_2535060 ) ) ( not ( = ?auto_2535059 ?auto_2535060 ) ) ( not ( = ?auto_2535061 ?auto_2535060 ) ) ( TRUCK-AT ?auto_2535058 ?auto_2535055 ) ( SURFACE-AT ?auto_2535062 ?auto_2535055 ) ( CLEAR ?auto_2535062 ) ( LIFTING ?auto_2535056 ?auto_2535059 ) ( IS-CRATE ?auto_2535059 ) ( not ( = ?auto_2535062 ?auto_2535059 ) ) ( not ( = ?auto_2535052 ?auto_2535062 ) ) ( not ( = ?auto_2535053 ?auto_2535062 ) ) ( not ( = ?auto_2535061 ?auto_2535062 ) ) ( not ( = ?auto_2535060 ?auto_2535062 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2535062 ?auto_2535059 )
      ( MAKE-2CRATE ?auto_2535059 ?auto_2535052 ?auto_2535053 )
      ( MAKE-1CRATE-VERIFY ?auto_2535052 ?auto_2535053 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2535063 - SURFACE
      ?auto_2535064 - SURFACE
      ?auto_2535065 - SURFACE
    )
    :vars
    (
      ?auto_2535073 - HOIST
      ?auto_2535069 - PLACE
      ?auto_2535072 - PLACE
      ?auto_2535067 - HOIST
      ?auto_2535066 - SURFACE
      ?auto_2535068 - SURFACE
      ?auto_2535070 - TRUCK
      ?auto_2535071 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2535073 ?auto_2535069 ) ( IS-CRATE ?auto_2535065 ) ( not ( = ?auto_2535064 ?auto_2535065 ) ) ( not ( = ?auto_2535063 ?auto_2535064 ) ) ( not ( = ?auto_2535063 ?auto_2535065 ) ) ( not ( = ?auto_2535072 ?auto_2535069 ) ) ( HOIST-AT ?auto_2535067 ?auto_2535072 ) ( not ( = ?auto_2535073 ?auto_2535067 ) ) ( SURFACE-AT ?auto_2535065 ?auto_2535072 ) ( ON ?auto_2535065 ?auto_2535066 ) ( CLEAR ?auto_2535065 ) ( not ( = ?auto_2535064 ?auto_2535066 ) ) ( not ( = ?auto_2535065 ?auto_2535066 ) ) ( not ( = ?auto_2535063 ?auto_2535066 ) ) ( IS-CRATE ?auto_2535064 ) ( AVAILABLE ?auto_2535067 ) ( SURFACE-AT ?auto_2535064 ?auto_2535072 ) ( ON ?auto_2535064 ?auto_2535068 ) ( CLEAR ?auto_2535064 ) ( not ( = ?auto_2535064 ?auto_2535068 ) ) ( not ( = ?auto_2535065 ?auto_2535068 ) ) ( not ( = ?auto_2535063 ?auto_2535068 ) ) ( not ( = ?auto_2535066 ?auto_2535068 ) ) ( TRUCK-AT ?auto_2535070 ?auto_2535069 ) ( SURFACE-AT ?auto_2535071 ?auto_2535069 ) ( CLEAR ?auto_2535071 ) ( LIFTING ?auto_2535073 ?auto_2535063 ) ( IS-CRATE ?auto_2535063 ) ( not ( = ?auto_2535071 ?auto_2535063 ) ) ( not ( = ?auto_2535064 ?auto_2535071 ) ) ( not ( = ?auto_2535065 ?auto_2535071 ) ) ( not ( = ?auto_2535066 ?auto_2535071 ) ) ( not ( = ?auto_2535068 ?auto_2535071 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2535064 ?auto_2535065 )
      ( MAKE-2CRATE-VERIFY ?auto_2535063 ?auto_2535064 ?auto_2535065 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2535075 - SURFACE
      ?auto_2535076 - SURFACE
      ?auto_2535077 - SURFACE
      ?auto_2535074 - SURFACE
    )
    :vars
    (
      ?auto_2535081 - HOIST
      ?auto_2535084 - PLACE
      ?auto_2535083 - PLACE
      ?auto_2535079 - HOIST
      ?auto_2535080 - SURFACE
      ?auto_2535078 - SURFACE
      ?auto_2535082 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2535081 ?auto_2535084 ) ( IS-CRATE ?auto_2535074 ) ( not ( = ?auto_2535077 ?auto_2535074 ) ) ( not ( = ?auto_2535076 ?auto_2535077 ) ) ( not ( = ?auto_2535076 ?auto_2535074 ) ) ( not ( = ?auto_2535083 ?auto_2535084 ) ) ( HOIST-AT ?auto_2535079 ?auto_2535083 ) ( not ( = ?auto_2535081 ?auto_2535079 ) ) ( SURFACE-AT ?auto_2535074 ?auto_2535083 ) ( ON ?auto_2535074 ?auto_2535080 ) ( CLEAR ?auto_2535074 ) ( not ( = ?auto_2535077 ?auto_2535080 ) ) ( not ( = ?auto_2535074 ?auto_2535080 ) ) ( not ( = ?auto_2535076 ?auto_2535080 ) ) ( IS-CRATE ?auto_2535077 ) ( AVAILABLE ?auto_2535079 ) ( SURFACE-AT ?auto_2535077 ?auto_2535083 ) ( ON ?auto_2535077 ?auto_2535078 ) ( CLEAR ?auto_2535077 ) ( not ( = ?auto_2535077 ?auto_2535078 ) ) ( not ( = ?auto_2535074 ?auto_2535078 ) ) ( not ( = ?auto_2535076 ?auto_2535078 ) ) ( not ( = ?auto_2535080 ?auto_2535078 ) ) ( TRUCK-AT ?auto_2535082 ?auto_2535084 ) ( SURFACE-AT ?auto_2535075 ?auto_2535084 ) ( CLEAR ?auto_2535075 ) ( LIFTING ?auto_2535081 ?auto_2535076 ) ( IS-CRATE ?auto_2535076 ) ( not ( = ?auto_2535075 ?auto_2535076 ) ) ( not ( = ?auto_2535077 ?auto_2535075 ) ) ( not ( = ?auto_2535074 ?auto_2535075 ) ) ( not ( = ?auto_2535080 ?auto_2535075 ) ) ( not ( = ?auto_2535078 ?auto_2535075 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2535076 ?auto_2535077 ?auto_2535074 )
      ( MAKE-3CRATE-VERIFY ?auto_2535075 ?auto_2535076 ?auto_2535077 ?auto_2535074 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2535086 - SURFACE
      ?auto_2535087 - SURFACE
      ?auto_2535088 - SURFACE
      ?auto_2535085 - SURFACE
      ?auto_2535089 - SURFACE
    )
    :vars
    (
      ?auto_2535093 - HOIST
      ?auto_2535096 - PLACE
      ?auto_2535095 - PLACE
      ?auto_2535091 - HOIST
      ?auto_2535092 - SURFACE
      ?auto_2535090 - SURFACE
      ?auto_2535094 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2535093 ?auto_2535096 ) ( IS-CRATE ?auto_2535089 ) ( not ( = ?auto_2535085 ?auto_2535089 ) ) ( not ( = ?auto_2535088 ?auto_2535085 ) ) ( not ( = ?auto_2535088 ?auto_2535089 ) ) ( not ( = ?auto_2535095 ?auto_2535096 ) ) ( HOIST-AT ?auto_2535091 ?auto_2535095 ) ( not ( = ?auto_2535093 ?auto_2535091 ) ) ( SURFACE-AT ?auto_2535089 ?auto_2535095 ) ( ON ?auto_2535089 ?auto_2535092 ) ( CLEAR ?auto_2535089 ) ( not ( = ?auto_2535085 ?auto_2535092 ) ) ( not ( = ?auto_2535089 ?auto_2535092 ) ) ( not ( = ?auto_2535088 ?auto_2535092 ) ) ( IS-CRATE ?auto_2535085 ) ( AVAILABLE ?auto_2535091 ) ( SURFACE-AT ?auto_2535085 ?auto_2535095 ) ( ON ?auto_2535085 ?auto_2535090 ) ( CLEAR ?auto_2535085 ) ( not ( = ?auto_2535085 ?auto_2535090 ) ) ( not ( = ?auto_2535089 ?auto_2535090 ) ) ( not ( = ?auto_2535088 ?auto_2535090 ) ) ( not ( = ?auto_2535092 ?auto_2535090 ) ) ( TRUCK-AT ?auto_2535094 ?auto_2535096 ) ( SURFACE-AT ?auto_2535087 ?auto_2535096 ) ( CLEAR ?auto_2535087 ) ( LIFTING ?auto_2535093 ?auto_2535088 ) ( IS-CRATE ?auto_2535088 ) ( not ( = ?auto_2535087 ?auto_2535088 ) ) ( not ( = ?auto_2535085 ?auto_2535087 ) ) ( not ( = ?auto_2535089 ?auto_2535087 ) ) ( not ( = ?auto_2535092 ?auto_2535087 ) ) ( not ( = ?auto_2535090 ?auto_2535087 ) ) ( ON ?auto_2535087 ?auto_2535086 ) ( not ( = ?auto_2535086 ?auto_2535087 ) ) ( not ( = ?auto_2535086 ?auto_2535088 ) ) ( not ( = ?auto_2535086 ?auto_2535085 ) ) ( not ( = ?auto_2535086 ?auto_2535089 ) ) ( not ( = ?auto_2535086 ?auto_2535092 ) ) ( not ( = ?auto_2535086 ?auto_2535090 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2535088 ?auto_2535085 ?auto_2535089 )
      ( MAKE-4CRATE-VERIFY ?auto_2535086 ?auto_2535087 ?auto_2535088 ?auto_2535085 ?auto_2535089 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2535098 - SURFACE
      ?auto_2535099 - SURFACE
      ?auto_2535100 - SURFACE
      ?auto_2535097 - SURFACE
      ?auto_2535101 - SURFACE
      ?auto_2535102 - SURFACE
    )
    :vars
    (
      ?auto_2535106 - HOIST
      ?auto_2535109 - PLACE
      ?auto_2535108 - PLACE
      ?auto_2535104 - HOIST
      ?auto_2535105 - SURFACE
      ?auto_2535103 - SURFACE
      ?auto_2535107 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2535106 ?auto_2535109 ) ( IS-CRATE ?auto_2535102 ) ( not ( = ?auto_2535101 ?auto_2535102 ) ) ( not ( = ?auto_2535097 ?auto_2535101 ) ) ( not ( = ?auto_2535097 ?auto_2535102 ) ) ( not ( = ?auto_2535108 ?auto_2535109 ) ) ( HOIST-AT ?auto_2535104 ?auto_2535108 ) ( not ( = ?auto_2535106 ?auto_2535104 ) ) ( SURFACE-AT ?auto_2535102 ?auto_2535108 ) ( ON ?auto_2535102 ?auto_2535105 ) ( CLEAR ?auto_2535102 ) ( not ( = ?auto_2535101 ?auto_2535105 ) ) ( not ( = ?auto_2535102 ?auto_2535105 ) ) ( not ( = ?auto_2535097 ?auto_2535105 ) ) ( IS-CRATE ?auto_2535101 ) ( AVAILABLE ?auto_2535104 ) ( SURFACE-AT ?auto_2535101 ?auto_2535108 ) ( ON ?auto_2535101 ?auto_2535103 ) ( CLEAR ?auto_2535101 ) ( not ( = ?auto_2535101 ?auto_2535103 ) ) ( not ( = ?auto_2535102 ?auto_2535103 ) ) ( not ( = ?auto_2535097 ?auto_2535103 ) ) ( not ( = ?auto_2535105 ?auto_2535103 ) ) ( TRUCK-AT ?auto_2535107 ?auto_2535109 ) ( SURFACE-AT ?auto_2535100 ?auto_2535109 ) ( CLEAR ?auto_2535100 ) ( LIFTING ?auto_2535106 ?auto_2535097 ) ( IS-CRATE ?auto_2535097 ) ( not ( = ?auto_2535100 ?auto_2535097 ) ) ( not ( = ?auto_2535101 ?auto_2535100 ) ) ( not ( = ?auto_2535102 ?auto_2535100 ) ) ( not ( = ?auto_2535105 ?auto_2535100 ) ) ( not ( = ?auto_2535103 ?auto_2535100 ) ) ( ON ?auto_2535099 ?auto_2535098 ) ( ON ?auto_2535100 ?auto_2535099 ) ( not ( = ?auto_2535098 ?auto_2535099 ) ) ( not ( = ?auto_2535098 ?auto_2535100 ) ) ( not ( = ?auto_2535098 ?auto_2535097 ) ) ( not ( = ?auto_2535098 ?auto_2535101 ) ) ( not ( = ?auto_2535098 ?auto_2535102 ) ) ( not ( = ?auto_2535098 ?auto_2535105 ) ) ( not ( = ?auto_2535098 ?auto_2535103 ) ) ( not ( = ?auto_2535099 ?auto_2535100 ) ) ( not ( = ?auto_2535099 ?auto_2535097 ) ) ( not ( = ?auto_2535099 ?auto_2535101 ) ) ( not ( = ?auto_2535099 ?auto_2535102 ) ) ( not ( = ?auto_2535099 ?auto_2535105 ) ) ( not ( = ?auto_2535099 ?auto_2535103 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2535097 ?auto_2535101 ?auto_2535102 )
      ( MAKE-5CRATE-VERIFY ?auto_2535098 ?auto_2535099 ?auto_2535100 ?auto_2535097 ?auto_2535101 ?auto_2535102 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2535111 - SURFACE
      ?auto_2535112 - SURFACE
      ?auto_2535113 - SURFACE
      ?auto_2535110 - SURFACE
      ?auto_2535114 - SURFACE
      ?auto_2535116 - SURFACE
      ?auto_2535115 - SURFACE
    )
    :vars
    (
      ?auto_2535120 - HOIST
      ?auto_2535123 - PLACE
      ?auto_2535122 - PLACE
      ?auto_2535118 - HOIST
      ?auto_2535119 - SURFACE
      ?auto_2535117 - SURFACE
      ?auto_2535121 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2535120 ?auto_2535123 ) ( IS-CRATE ?auto_2535115 ) ( not ( = ?auto_2535116 ?auto_2535115 ) ) ( not ( = ?auto_2535114 ?auto_2535116 ) ) ( not ( = ?auto_2535114 ?auto_2535115 ) ) ( not ( = ?auto_2535122 ?auto_2535123 ) ) ( HOIST-AT ?auto_2535118 ?auto_2535122 ) ( not ( = ?auto_2535120 ?auto_2535118 ) ) ( SURFACE-AT ?auto_2535115 ?auto_2535122 ) ( ON ?auto_2535115 ?auto_2535119 ) ( CLEAR ?auto_2535115 ) ( not ( = ?auto_2535116 ?auto_2535119 ) ) ( not ( = ?auto_2535115 ?auto_2535119 ) ) ( not ( = ?auto_2535114 ?auto_2535119 ) ) ( IS-CRATE ?auto_2535116 ) ( AVAILABLE ?auto_2535118 ) ( SURFACE-AT ?auto_2535116 ?auto_2535122 ) ( ON ?auto_2535116 ?auto_2535117 ) ( CLEAR ?auto_2535116 ) ( not ( = ?auto_2535116 ?auto_2535117 ) ) ( not ( = ?auto_2535115 ?auto_2535117 ) ) ( not ( = ?auto_2535114 ?auto_2535117 ) ) ( not ( = ?auto_2535119 ?auto_2535117 ) ) ( TRUCK-AT ?auto_2535121 ?auto_2535123 ) ( SURFACE-AT ?auto_2535110 ?auto_2535123 ) ( CLEAR ?auto_2535110 ) ( LIFTING ?auto_2535120 ?auto_2535114 ) ( IS-CRATE ?auto_2535114 ) ( not ( = ?auto_2535110 ?auto_2535114 ) ) ( not ( = ?auto_2535116 ?auto_2535110 ) ) ( not ( = ?auto_2535115 ?auto_2535110 ) ) ( not ( = ?auto_2535119 ?auto_2535110 ) ) ( not ( = ?auto_2535117 ?auto_2535110 ) ) ( ON ?auto_2535112 ?auto_2535111 ) ( ON ?auto_2535113 ?auto_2535112 ) ( ON ?auto_2535110 ?auto_2535113 ) ( not ( = ?auto_2535111 ?auto_2535112 ) ) ( not ( = ?auto_2535111 ?auto_2535113 ) ) ( not ( = ?auto_2535111 ?auto_2535110 ) ) ( not ( = ?auto_2535111 ?auto_2535114 ) ) ( not ( = ?auto_2535111 ?auto_2535116 ) ) ( not ( = ?auto_2535111 ?auto_2535115 ) ) ( not ( = ?auto_2535111 ?auto_2535119 ) ) ( not ( = ?auto_2535111 ?auto_2535117 ) ) ( not ( = ?auto_2535112 ?auto_2535113 ) ) ( not ( = ?auto_2535112 ?auto_2535110 ) ) ( not ( = ?auto_2535112 ?auto_2535114 ) ) ( not ( = ?auto_2535112 ?auto_2535116 ) ) ( not ( = ?auto_2535112 ?auto_2535115 ) ) ( not ( = ?auto_2535112 ?auto_2535119 ) ) ( not ( = ?auto_2535112 ?auto_2535117 ) ) ( not ( = ?auto_2535113 ?auto_2535110 ) ) ( not ( = ?auto_2535113 ?auto_2535114 ) ) ( not ( = ?auto_2535113 ?auto_2535116 ) ) ( not ( = ?auto_2535113 ?auto_2535115 ) ) ( not ( = ?auto_2535113 ?auto_2535119 ) ) ( not ( = ?auto_2535113 ?auto_2535117 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2535114 ?auto_2535116 ?auto_2535115 )
      ( MAKE-6CRATE-VERIFY ?auto_2535111 ?auto_2535112 ?auto_2535113 ?auto_2535110 ?auto_2535114 ?auto_2535116 ?auto_2535115 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2535125 - SURFACE
      ?auto_2535126 - SURFACE
      ?auto_2535127 - SURFACE
      ?auto_2535124 - SURFACE
      ?auto_2535128 - SURFACE
      ?auto_2535130 - SURFACE
      ?auto_2535129 - SURFACE
      ?auto_2535131 - SURFACE
    )
    :vars
    (
      ?auto_2535135 - HOIST
      ?auto_2535138 - PLACE
      ?auto_2535137 - PLACE
      ?auto_2535133 - HOIST
      ?auto_2535134 - SURFACE
      ?auto_2535132 - SURFACE
      ?auto_2535136 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2535135 ?auto_2535138 ) ( IS-CRATE ?auto_2535131 ) ( not ( = ?auto_2535129 ?auto_2535131 ) ) ( not ( = ?auto_2535130 ?auto_2535129 ) ) ( not ( = ?auto_2535130 ?auto_2535131 ) ) ( not ( = ?auto_2535137 ?auto_2535138 ) ) ( HOIST-AT ?auto_2535133 ?auto_2535137 ) ( not ( = ?auto_2535135 ?auto_2535133 ) ) ( SURFACE-AT ?auto_2535131 ?auto_2535137 ) ( ON ?auto_2535131 ?auto_2535134 ) ( CLEAR ?auto_2535131 ) ( not ( = ?auto_2535129 ?auto_2535134 ) ) ( not ( = ?auto_2535131 ?auto_2535134 ) ) ( not ( = ?auto_2535130 ?auto_2535134 ) ) ( IS-CRATE ?auto_2535129 ) ( AVAILABLE ?auto_2535133 ) ( SURFACE-AT ?auto_2535129 ?auto_2535137 ) ( ON ?auto_2535129 ?auto_2535132 ) ( CLEAR ?auto_2535129 ) ( not ( = ?auto_2535129 ?auto_2535132 ) ) ( not ( = ?auto_2535131 ?auto_2535132 ) ) ( not ( = ?auto_2535130 ?auto_2535132 ) ) ( not ( = ?auto_2535134 ?auto_2535132 ) ) ( TRUCK-AT ?auto_2535136 ?auto_2535138 ) ( SURFACE-AT ?auto_2535128 ?auto_2535138 ) ( CLEAR ?auto_2535128 ) ( LIFTING ?auto_2535135 ?auto_2535130 ) ( IS-CRATE ?auto_2535130 ) ( not ( = ?auto_2535128 ?auto_2535130 ) ) ( not ( = ?auto_2535129 ?auto_2535128 ) ) ( not ( = ?auto_2535131 ?auto_2535128 ) ) ( not ( = ?auto_2535134 ?auto_2535128 ) ) ( not ( = ?auto_2535132 ?auto_2535128 ) ) ( ON ?auto_2535126 ?auto_2535125 ) ( ON ?auto_2535127 ?auto_2535126 ) ( ON ?auto_2535124 ?auto_2535127 ) ( ON ?auto_2535128 ?auto_2535124 ) ( not ( = ?auto_2535125 ?auto_2535126 ) ) ( not ( = ?auto_2535125 ?auto_2535127 ) ) ( not ( = ?auto_2535125 ?auto_2535124 ) ) ( not ( = ?auto_2535125 ?auto_2535128 ) ) ( not ( = ?auto_2535125 ?auto_2535130 ) ) ( not ( = ?auto_2535125 ?auto_2535129 ) ) ( not ( = ?auto_2535125 ?auto_2535131 ) ) ( not ( = ?auto_2535125 ?auto_2535134 ) ) ( not ( = ?auto_2535125 ?auto_2535132 ) ) ( not ( = ?auto_2535126 ?auto_2535127 ) ) ( not ( = ?auto_2535126 ?auto_2535124 ) ) ( not ( = ?auto_2535126 ?auto_2535128 ) ) ( not ( = ?auto_2535126 ?auto_2535130 ) ) ( not ( = ?auto_2535126 ?auto_2535129 ) ) ( not ( = ?auto_2535126 ?auto_2535131 ) ) ( not ( = ?auto_2535126 ?auto_2535134 ) ) ( not ( = ?auto_2535126 ?auto_2535132 ) ) ( not ( = ?auto_2535127 ?auto_2535124 ) ) ( not ( = ?auto_2535127 ?auto_2535128 ) ) ( not ( = ?auto_2535127 ?auto_2535130 ) ) ( not ( = ?auto_2535127 ?auto_2535129 ) ) ( not ( = ?auto_2535127 ?auto_2535131 ) ) ( not ( = ?auto_2535127 ?auto_2535134 ) ) ( not ( = ?auto_2535127 ?auto_2535132 ) ) ( not ( = ?auto_2535124 ?auto_2535128 ) ) ( not ( = ?auto_2535124 ?auto_2535130 ) ) ( not ( = ?auto_2535124 ?auto_2535129 ) ) ( not ( = ?auto_2535124 ?auto_2535131 ) ) ( not ( = ?auto_2535124 ?auto_2535134 ) ) ( not ( = ?auto_2535124 ?auto_2535132 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2535130 ?auto_2535129 ?auto_2535131 )
      ( MAKE-7CRATE-VERIFY ?auto_2535125 ?auto_2535126 ?auto_2535127 ?auto_2535124 ?auto_2535128 ?auto_2535130 ?auto_2535129 ?auto_2535131 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2535140 - SURFACE
      ?auto_2535141 - SURFACE
      ?auto_2535142 - SURFACE
      ?auto_2535139 - SURFACE
      ?auto_2535143 - SURFACE
      ?auto_2535145 - SURFACE
      ?auto_2535144 - SURFACE
      ?auto_2535146 - SURFACE
      ?auto_2535147 - SURFACE
    )
    :vars
    (
      ?auto_2535151 - HOIST
      ?auto_2535154 - PLACE
      ?auto_2535153 - PLACE
      ?auto_2535149 - HOIST
      ?auto_2535150 - SURFACE
      ?auto_2535148 - SURFACE
      ?auto_2535152 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2535151 ?auto_2535154 ) ( IS-CRATE ?auto_2535147 ) ( not ( = ?auto_2535146 ?auto_2535147 ) ) ( not ( = ?auto_2535144 ?auto_2535146 ) ) ( not ( = ?auto_2535144 ?auto_2535147 ) ) ( not ( = ?auto_2535153 ?auto_2535154 ) ) ( HOIST-AT ?auto_2535149 ?auto_2535153 ) ( not ( = ?auto_2535151 ?auto_2535149 ) ) ( SURFACE-AT ?auto_2535147 ?auto_2535153 ) ( ON ?auto_2535147 ?auto_2535150 ) ( CLEAR ?auto_2535147 ) ( not ( = ?auto_2535146 ?auto_2535150 ) ) ( not ( = ?auto_2535147 ?auto_2535150 ) ) ( not ( = ?auto_2535144 ?auto_2535150 ) ) ( IS-CRATE ?auto_2535146 ) ( AVAILABLE ?auto_2535149 ) ( SURFACE-AT ?auto_2535146 ?auto_2535153 ) ( ON ?auto_2535146 ?auto_2535148 ) ( CLEAR ?auto_2535146 ) ( not ( = ?auto_2535146 ?auto_2535148 ) ) ( not ( = ?auto_2535147 ?auto_2535148 ) ) ( not ( = ?auto_2535144 ?auto_2535148 ) ) ( not ( = ?auto_2535150 ?auto_2535148 ) ) ( TRUCK-AT ?auto_2535152 ?auto_2535154 ) ( SURFACE-AT ?auto_2535145 ?auto_2535154 ) ( CLEAR ?auto_2535145 ) ( LIFTING ?auto_2535151 ?auto_2535144 ) ( IS-CRATE ?auto_2535144 ) ( not ( = ?auto_2535145 ?auto_2535144 ) ) ( not ( = ?auto_2535146 ?auto_2535145 ) ) ( not ( = ?auto_2535147 ?auto_2535145 ) ) ( not ( = ?auto_2535150 ?auto_2535145 ) ) ( not ( = ?auto_2535148 ?auto_2535145 ) ) ( ON ?auto_2535141 ?auto_2535140 ) ( ON ?auto_2535142 ?auto_2535141 ) ( ON ?auto_2535139 ?auto_2535142 ) ( ON ?auto_2535143 ?auto_2535139 ) ( ON ?auto_2535145 ?auto_2535143 ) ( not ( = ?auto_2535140 ?auto_2535141 ) ) ( not ( = ?auto_2535140 ?auto_2535142 ) ) ( not ( = ?auto_2535140 ?auto_2535139 ) ) ( not ( = ?auto_2535140 ?auto_2535143 ) ) ( not ( = ?auto_2535140 ?auto_2535145 ) ) ( not ( = ?auto_2535140 ?auto_2535144 ) ) ( not ( = ?auto_2535140 ?auto_2535146 ) ) ( not ( = ?auto_2535140 ?auto_2535147 ) ) ( not ( = ?auto_2535140 ?auto_2535150 ) ) ( not ( = ?auto_2535140 ?auto_2535148 ) ) ( not ( = ?auto_2535141 ?auto_2535142 ) ) ( not ( = ?auto_2535141 ?auto_2535139 ) ) ( not ( = ?auto_2535141 ?auto_2535143 ) ) ( not ( = ?auto_2535141 ?auto_2535145 ) ) ( not ( = ?auto_2535141 ?auto_2535144 ) ) ( not ( = ?auto_2535141 ?auto_2535146 ) ) ( not ( = ?auto_2535141 ?auto_2535147 ) ) ( not ( = ?auto_2535141 ?auto_2535150 ) ) ( not ( = ?auto_2535141 ?auto_2535148 ) ) ( not ( = ?auto_2535142 ?auto_2535139 ) ) ( not ( = ?auto_2535142 ?auto_2535143 ) ) ( not ( = ?auto_2535142 ?auto_2535145 ) ) ( not ( = ?auto_2535142 ?auto_2535144 ) ) ( not ( = ?auto_2535142 ?auto_2535146 ) ) ( not ( = ?auto_2535142 ?auto_2535147 ) ) ( not ( = ?auto_2535142 ?auto_2535150 ) ) ( not ( = ?auto_2535142 ?auto_2535148 ) ) ( not ( = ?auto_2535139 ?auto_2535143 ) ) ( not ( = ?auto_2535139 ?auto_2535145 ) ) ( not ( = ?auto_2535139 ?auto_2535144 ) ) ( not ( = ?auto_2535139 ?auto_2535146 ) ) ( not ( = ?auto_2535139 ?auto_2535147 ) ) ( not ( = ?auto_2535139 ?auto_2535150 ) ) ( not ( = ?auto_2535139 ?auto_2535148 ) ) ( not ( = ?auto_2535143 ?auto_2535145 ) ) ( not ( = ?auto_2535143 ?auto_2535144 ) ) ( not ( = ?auto_2535143 ?auto_2535146 ) ) ( not ( = ?auto_2535143 ?auto_2535147 ) ) ( not ( = ?auto_2535143 ?auto_2535150 ) ) ( not ( = ?auto_2535143 ?auto_2535148 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2535144 ?auto_2535146 ?auto_2535147 )
      ( MAKE-8CRATE-VERIFY ?auto_2535140 ?auto_2535141 ?auto_2535142 ?auto_2535139 ?auto_2535143 ?auto_2535145 ?auto_2535144 ?auto_2535146 ?auto_2535147 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2538701 - SURFACE
      ?auto_2538702 - SURFACE
      ?auto_2538703 - SURFACE
      ?auto_2538700 - SURFACE
      ?auto_2538704 - SURFACE
      ?auto_2538706 - SURFACE
      ?auto_2538705 - SURFACE
      ?auto_2538707 - SURFACE
      ?auto_2538708 - SURFACE
      ?auto_2538709 - SURFACE
    )
    :vars
    (
      ?auto_2538710 - HOIST
      ?auto_2538711 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2538710 ?auto_2538711 ) ( SURFACE-AT ?auto_2538708 ?auto_2538711 ) ( CLEAR ?auto_2538708 ) ( LIFTING ?auto_2538710 ?auto_2538709 ) ( IS-CRATE ?auto_2538709 ) ( not ( = ?auto_2538708 ?auto_2538709 ) ) ( ON ?auto_2538702 ?auto_2538701 ) ( ON ?auto_2538703 ?auto_2538702 ) ( ON ?auto_2538700 ?auto_2538703 ) ( ON ?auto_2538704 ?auto_2538700 ) ( ON ?auto_2538706 ?auto_2538704 ) ( ON ?auto_2538705 ?auto_2538706 ) ( ON ?auto_2538707 ?auto_2538705 ) ( ON ?auto_2538708 ?auto_2538707 ) ( not ( = ?auto_2538701 ?auto_2538702 ) ) ( not ( = ?auto_2538701 ?auto_2538703 ) ) ( not ( = ?auto_2538701 ?auto_2538700 ) ) ( not ( = ?auto_2538701 ?auto_2538704 ) ) ( not ( = ?auto_2538701 ?auto_2538706 ) ) ( not ( = ?auto_2538701 ?auto_2538705 ) ) ( not ( = ?auto_2538701 ?auto_2538707 ) ) ( not ( = ?auto_2538701 ?auto_2538708 ) ) ( not ( = ?auto_2538701 ?auto_2538709 ) ) ( not ( = ?auto_2538702 ?auto_2538703 ) ) ( not ( = ?auto_2538702 ?auto_2538700 ) ) ( not ( = ?auto_2538702 ?auto_2538704 ) ) ( not ( = ?auto_2538702 ?auto_2538706 ) ) ( not ( = ?auto_2538702 ?auto_2538705 ) ) ( not ( = ?auto_2538702 ?auto_2538707 ) ) ( not ( = ?auto_2538702 ?auto_2538708 ) ) ( not ( = ?auto_2538702 ?auto_2538709 ) ) ( not ( = ?auto_2538703 ?auto_2538700 ) ) ( not ( = ?auto_2538703 ?auto_2538704 ) ) ( not ( = ?auto_2538703 ?auto_2538706 ) ) ( not ( = ?auto_2538703 ?auto_2538705 ) ) ( not ( = ?auto_2538703 ?auto_2538707 ) ) ( not ( = ?auto_2538703 ?auto_2538708 ) ) ( not ( = ?auto_2538703 ?auto_2538709 ) ) ( not ( = ?auto_2538700 ?auto_2538704 ) ) ( not ( = ?auto_2538700 ?auto_2538706 ) ) ( not ( = ?auto_2538700 ?auto_2538705 ) ) ( not ( = ?auto_2538700 ?auto_2538707 ) ) ( not ( = ?auto_2538700 ?auto_2538708 ) ) ( not ( = ?auto_2538700 ?auto_2538709 ) ) ( not ( = ?auto_2538704 ?auto_2538706 ) ) ( not ( = ?auto_2538704 ?auto_2538705 ) ) ( not ( = ?auto_2538704 ?auto_2538707 ) ) ( not ( = ?auto_2538704 ?auto_2538708 ) ) ( not ( = ?auto_2538704 ?auto_2538709 ) ) ( not ( = ?auto_2538706 ?auto_2538705 ) ) ( not ( = ?auto_2538706 ?auto_2538707 ) ) ( not ( = ?auto_2538706 ?auto_2538708 ) ) ( not ( = ?auto_2538706 ?auto_2538709 ) ) ( not ( = ?auto_2538705 ?auto_2538707 ) ) ( not ( = ?auto_2538705 ?auto_2538708 ) ) ( not ( = ?auto_2538705 ?auto_2538709 ) ) ( not ( = ?auto_2538707 ?auto_2538708 ) ) ( not ( = ?auto_2538707 ?auto_2538709 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2538708 ?auto_2538709 )
      ( MAKE-9CRATE-VERIFY ?auto_2538701 ?auto_2538702 ?auto_2538703 ?auto_2538700 ?auto_2538704 ?auto_2538706 ?auto_2538705 ?auto_2538707 ?auto_2538708 ?auto_2538709 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2538781 - SURFACE
      ?auto_2538782 - SURFACE
      ?auto_2538783 - SURFACE
      ?auto_2538780 - SURFACE
      ?auto_2538784 - SURFACE
      ?auto_2538786 - SURFACE
      ?auto_2538785 - SURFACE
      ?auto_2538787 - SURFACE
      ?auto_2538788 - SURFACE
      ?auto_2538789 - SURFACE
    )
    :vars
    (
      ?auto_2538792 - HOIST
      ?auto_2538790 - PLACE
      ?auto_2538791 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2538792 ?auto_2538790 ) ( SURFACE-AT ?auto_2538788 ?auto_2538790 ) ( CLEAR ?auto_2538788 ) ( IS-CRATE ?auto_2538789 ) ( not ( = ?auto_2538788 ?auto_2538789 ) ) ( TRUCK-AT ?auto_2538791 ?auto_2538790 ) ( AVAILABLE ?auto_2538792 ) ( IN ?auto_2538789 ?auto_2538791 ) ( ON ?auto_2538788 ?auto_2538787 ) ( not ( = ?auto_2538787 ?auto_2538788 ) ) ( not ( = ?auto_2538787 ?auto_2538789 ) ) ( ON ?auto_2538782 ?auto_2538781 ) ( ON ?auto_2538783 ?auto_2538782 ) ( ON ?auto_2538780 ?auto_2538783 ) ( ON ?auto_2538784 ?auto_2538780 ) ( ON ?auto_2538786 ?auto_2538784 ) ( ON ?auto_2538785 ?auto_2538786 ) ( ON ?auto_2538787 ?auto_2538785 ) ( not ( = ?auto_2538781 ?auto_2538782 ) ) ( not ( = ?auto_2538781 ?auto_2538783 ) ) ( not ( = ?auto_2538781 ?auto_2538780 ) ) ( not ( = ?auto_2538781 ?auto_2538784 ) ) ( not ( = ?auto_2538781 ?auto_2538786 ) ) ( not ( = ?auto_2538781 ?auto_2538785 ) ) ( not ( = ?auto_2538781 ?auto_2538787 ) ) ( not ( = ?auto_2538781 ?auto_2538788 ) ) ( not ( = ?auto_2538781 ?auto_2538789 ) ) ( not ( = ?auto_2538782 ?auto_2538783 ) ) ( not ( = ?auto_2538782 ?auto_2538780 ) ) ( not ( = ?auto_2538782 ?auto_2538784 ) ) ( not ( = ?auto_2538782 ?auto_2538786 ) ) ( not ( = ?auto_2538782 ?auto_2538785 ) ) ( not ( = ?auto_2538782 ?auto_2538787 ) ) ( not ( = ?auto_2538782 ?auto_2538788 ) ) ( not ( = ?auto_2538782 ?auto_2538789 ) ) ( not ( = ?auto_2538783 ?auto_2538780 ) ) ( not ( = ?auto_2538783 ?auto_2538784 ) ) ( not ( = ?auto_2538783 ?auto_2538786 ) ) ( not ( = ?auto_2538783 ?auto_2538785 ) ) ( not ( = ?auto_2538783 ?auto_2538787 ) ) ( not ( = ?auto_2538783 ?auto_2538788 ) ) ( not ( = ?auto_2538783 ?auto_2538789 ) ) ( not ( = ?auto_2538780 ?auto_2538784 ) ) ( not ( = ?auto_2538780 ?auto_2538786 ) ) ( not ( = ?auto_2538780 ?auto_2538785 ) ) ( not ( = ?auto_2538780 ?auto_2538787 ) ) ( not ( = ?auto_2538780 ?auto_2538788 ) ) ( not ( = ?auto_2538780 ?auto_2538789 ) ) ( not ( = ?auto_2538784 ?auto_2538786 ) ) ( not ( = ?auto_2538784 ?auto_2538785 ) ) ( not ( = ?auto_2538784 ?auto_2538787 ) ) ( not ( = ?auto_2538784 ?auto_2538788 ) ) ( not ( = ?auto_2538784 ?auto_2538789 ) ) ( not ( = ?auto_2538786 ?auto_2538785 ) ) ( not ( = ?auto_2538786 ?auto_2538787 ) ) ( not ( = ?auto_2538786 ?auto_2538788 ) ) ( not ( = ?auto_2538786 ?auto_2538789 ) ) ( not ( = ?auto_2538785 ?auto_2538787 ) ) ( not ( = ?auto_2538785 ?auto_2538788 ) ) ( not ( = ?auto_2538785 ?auto_2538789 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2538787 ?auto_2538788 ?auto_2538789 )
      ( MAKE-9CRATE-VERIFY ?auto_2538781 ?auto_2538782 ?auto_2538783 ?auto_2538780 ?auto_2538784 ?auto_2538786 ?auto_2538785 ?auto_2538787 ?auto_2538788 ?auto_2538789 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2538871 - SURFACE
      ?auto_2538872 - SURFACE
      ?auto_2538873 - SURFACE
      ?auto_2538870 - SURFACE
      ?auto_2538874 - SURFACE
      ?auto_2538876 - SURFACE
      ?auto_2538875 - SURFACE
      ?auto_2538877 - SURFACE
      ?auto_2538878 - SURFACE
      ?auto_2538879 - SURFACE
    )
    :vars
    (
      ?auto_2538880 - HOIST
      ?auto_2538882 - PLACE
      ?auto_2538881 - TRUCK
      ?auto_2538883 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2538880 ?auto_2538882 ) ( SURFACE-AT ?auto_2538878 ?auto_2538882 ) ( CLEAR ?auto_2538878 ) ( IS-CRATE ?auto_2538879 ) ( not ( = ?auto_2538878 ?auto_2538879 ) ) ( AVAILABLE ?auto_2538880 ) ( IN ?auto_2538879 ?auto_2538881 ) ( ON ?auto_2538878 ?auto_2538877 ) ( not ( = ?auto_2538877 ?auto_2538878 ) ) ( not ( = ?auto_2538877 ?auto_2538879 ) ) ( TRUCK-AT ?auto_2538881 ?auto_2538883 ) ( not ( = ?auto_2538883 ?auto_2538882 ) ) ( ON ?auto_2538872 ?auto_2538871 ) ( ON ?auto_2538873 ?auto_2538872 ) ( ON ?auto_2538870 ?auto_2538873 ) ( ON ?auto_2538874 ?auto_2538870 ) ( ON ?auto_2538876 ?auto_2538874 ) ( ON ?auto_2538875 ?auto_2538876 ) ( ON ?auto_2538877 ?auto_2538875 ) ( not ( = ?auto_2538871 ?auto_2538872 ) ) ( not ( = ?auto_2538871 ?auto_2538873 ) ) ( not ( = ?auto_2538871 ?auto_2538870 ) ) ( not ( = ?auto_2538871 ?auto_2538874 ) ) ( not ( = ?auto_2538871 ?auto_2538876 ) ) ( not ( = ?auto_2538871 ?auto_2538875 ) ) ( not ( = ?auto_2538871 ?auto_2538877 ) ) ( not ( = ?auto_2538871 ?auto_2538878 ) ) ( not ( = ?auto_2538871 ?auto_2538879 ) ) ( not ( = ?auto_2538872 ?auto_2538873 ) ) ( not ( = ?auto_2538872 ?auto_2538870 ) ) ( not ( = ?auto_2538872 ?auto_2538874 ) ) ( not ( = ?auto_2538872 ?auto_2538876 ) ) ( not ( = ?auto_2538872 ?auto_2538875 ) ) ( not ( = ?auto_2538872 ?auto_2538877 ) ) ( not ( = ?auto_2538872 ?auto_2538878 ) ) ( not ( = ?auto_2538872 ?auto_2538879 ) ) ( not ( = ?auto_2538873 ?auto_2538870 ) ) ( not ( = ?auto_2538873 ?auto_2538874 ) ) ( not ( = ?auto_2538873 ?auto_2538876 ) ) ( not ( = ?auto_2538873 ?auto_2538875 ) ) ( not ( = ?auto_2538873 ?auto_2538877 ) ) ( not ( = ?auto_2538873 ?auto_2538878 ) ) ( not ( = ?auto_2538873 ?auto_2538879 ) ) ( not ( = ?auto_2538870 ?auto_2538874 ) ) ( not ( = ?auto_2538870 ?auto_2538876 ) ) ( not ( = ?auto_2538870 ?auto_2538875 ) ) ( not ( = ?auto_2538870 ?auto_2538877 ) ) ( not ( = ?auto_2538870 ?auto_2538878 ) ) ( not ( = ?auto_2538870 ?auto_2538879 ) ) ( not ( = ?auto_2538874 ?auto_2538876 ) ) ( not ( = ?auto_2538874 ?auto_2538875 ) ) ( not ( = ?auto_2538874 ?auto_2538877 ) ) ( not ( = ?auto_2538874 ?auto_2538878 ) ) ( not ( = ?auto_2538874 ?auto_2538879 ) ) ( not ( = ?auto_2538876 ?auto_2538875 ) ) ( not ( = ?auto_2538876 ?auto_2538877 ) ) ( not ( = ?auto_2538876 ?auto_2538878 ) ) ( not ( = ?auto_2538876 ?auto_2538879 ) ) ( not ( = ?auto_2538875 ?auto_2538877 ) ) ( not ( = ?auto_2538875 ?auto_2538878 ) ) ( not ( = ?auto_2538875 ?auto_2538879 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2538877 ?auto_2538878 ?auto_2538879 )
      ( MAKE-9CRATE-VERIFY ?auto_2538871 ?auto_2538872 ?auto_2538873 ?auto_2538870 ?auto_2538874 ?auto_2538876 ?auto_2538875 ?auto_2538877 ?auto_2538878 ?auto_2538879 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2538970 - SURFACE
      ?auto_2538971 - SURFACE
      ?auto_2538972 - SURFACE
      ?auto_2538969 - SURFACE
      ?auto_2538973 - SURFACE
      ?auto_2538975 - SURFACE
      ?auto_2538974 - SURFACE
      ?auto_2538976 - SURFACE
      ?auto_2538977 - SURFACE
      ?auto_2538978 - SURFACE
    )
    :vars
    (
      ?auto_2538983 - HOIST
      ?auto_2538980 - PLACE
      ?auto_2538982 - TRUCK
      ?auto_2538981 - PLACE
      ?auto_2538979 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2538983 ?auto_2538980 ) ( SURFACE-AT ?auto_2538977 ?auto_2538980 ) ( CLEAR ?auto_2538977 ) ( IS-CRATE ?auto_2538978 ) ( not ( = ?auto_2538977 ?auto_2538978 ) ) ( AVAILABLE ?auto_2538983 ) ( ON ?auto_2538977 ?auto_2538976 ) ( not ( = ?auto_2538976 ?auto_2538977 ) ) ( not ( = ?auto_2538976 ?auto_2538978 ) ) ( TRUCK-AT ?auto_2538982 ?auto_2538981 ) ( not ( = ?auto_2538981 ?auto_2538980 ) ) ( HOIST-AT ?auto_2538979 ?auto_2538981 ) ( LIFTING ?auto_2538979 ?auto_2538978 ) ( not ( = ?auto_2538983 ?auto_2538979 ) ) ( ON ?auto_2538971 ?auto_2538970 ) ( ON ?auto_2538972 ?auto_2538971 ) ( ON ?auto_2538969 ?auto_2538972 ) ( ON ?auto_2538973 ?auto_2538969 ) ( ON ?auto_2538975 ?auto_2538973 ) ( ON ?auto_2538974 ?auto_2538975 ) ( ON ?auto_2538976 ?auto_2538974 ) ( not ( = ?auto_2538970 ?auto_2538971 ) ) ( not ( = ?auto_2538970 ?auto_2538972 ) ) ( not ( = ?auto_2538970 ?auto_2538969 ) ) ( not ( = ?auto_2538970 ?auto_2538973 ) ) ( not ( = ?auto_2538970 ?auto_2538975 ) ) ( not ( = ?auto_2538970 ?auto_2538974 ) ) ( not ( = ?auto_2538970 ?auto_2538976 ) ) ( not ( = ?auto_2538970 ?auto_2538977 ) ) ( not ( = ?auto_2538970 ?auto_2538978 ) ) ( not ( = ?auto_2538971 ?auto_2538972 ) ) ( not ( = ?auto_2538971 ?auto_2538969 ) ) ( not ( = ?auto_2538971 ?auto_2538973 ) ) ( not ( = ?auto_2538971 ?auto_2538975 ) ) ( not ( = ?auto_2538971 ?auto_2538974 ) ) ( not ( = ?auto_2538971 ?auto_2538976 ) ) ( not ( = ?auto_2538971 ?auto_2538977 ) ) ( not ( = ?auto_2538971 ?auto_2538978 ) ) ( not ( = ?auto_2538972 ?auto_2538969 ) ) ( not ( = ?auto_2538972 ?auto_2538973 ) ) ( not ( = ?auto_2538972 ?auto_2538975 ) ) ( not ( = ?auto_2538972 ?auto_2538974 ) ) ( not ( = ?auto_2538972 ?auto_2538976 ) ) ( not ( = ?auto_2538972 ?auto_2538977 ) ) ( not ( = ?auto_2538972 ?auto_2538978 ) ) ( not ( = ?auto_2538969 ?auto_2538973 ) ) ( not ( = ?auto_2538969 ?auto_2538975 ) ) ( not ( = ?auto_2538969 ?auto_2538974 ) ) ( not ( = ?auto_2538969 ?auto_2538976 ) ) ( not ( = ?auto_2538969 ?auto_2538977 ) ) ( not ( = ?auto_2538969 ?auto_2538978 ) ) ( not ( = ?auto_2538973 ?auto_2538975 ) ) ( not ( = ?auto_2538973 ?auto_2538974 ) ) ( not ( = ?auto_2538973 ?auto_2538976 ) ) ( not ( = ?auto_2538973 ?auto_2538977 ) ) ( not ( = ?auto_2538973 ?auto_2538978 ) ) ( not ( = ?auto_2538975 ?auto_2538974 ) ) ( not ( = ?auto_2538975 ?auto_2538976 ) ) ( not ( = ?auto_2538975 ?auto_2538977 ) ) ( not ( = ?auto_2538975 ?auto_2538978 ) ) ( not ( = ?auto_2538974 ?auto_2538976 ) ) ( not ( = ?auto_2538974 ?auto_2538977 ) ) ( not ( = ?auto_2538974 ?auto_2538978 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2538976 ?auto_2538977 ?auto_2538978 )
      ( MAKE-9CRATE-VERIFY ?auto_2538970 ?auto_2538971 ?auto_2538972 ?auto_2538969 ?auto_2538973 ?auto_2538975 ?auto_2538974 ?auto_2538976 ?auto_2538977 ?auto_2538978 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2539078 - SURFACE
      ?auto_2539079 - SURFACE
      ?auto_2539080 - SURFACE
      ?auto_2539077 - SURFACE
      ?auto_2539081 - SURFACE
      ?auto_2539083 - SURFACE
      ?auto_2539082 - SURFACE
      ?auto_2539084 - SURFACE
      ?auto_2539085 - SURFACE
      ?auto_2539086 - SURFACE
    )
    :vars
    (
      ?auto_2539090 - HOIST
      ?auto_2539091 - PLACE
      ?auto_2539092 - TRUCK
      ?auto_2539088 - PLACE
      ?auto_2539087 - HOIST
      ?auto_2539089 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2539090 ?auto_2539091 ) ( SURFACE-AT ?auto_2539085 ?auto_2539091 ) ( CLEAR ?auto_2539085 ) ( IS-CRATE ?auto_2539086 ) ( not ( = ?auto_2539085 ?auto_2539086 ) ) ( AVAILABLE ?auto_2539090 ) ( ON ?auto_2539085 ?auto_2539084 ) ( not ( = ?auto_2539084 ?auto_2539085 ) ) ( not ( = ?auto_2539084 ?auto_2539086 ) ) ( TRUCK-AT ?auto_2539092 ?auto_2539088 ) ( not ( = ?auto_2539088 ?auto_2539091 ) ) ( HOIST-AT ?auto_2539087 ?auto_2539088 ) ( not ( = ?auto_2539090 ?auto_2539087 ) ) ( AVAILABLE ?auto_2539087 ) ( SURFACE-AT ?auto_2539086 ?auto_2539088 ) ( ON ?auto_2539086 ?auto_2539089 ) ( CLEAR ?auto_2539086 ) ( not ( = ?auto_2539085 ?auto_2539089 ) ) ( not ( = ?auto_2539086 ?auto_2539089 ) ) ( not ( = ?auto_2539084 ?auto_2539089 ) ) ( ON ?auto_2539079 ?auto_2539078 ) ( ON ?auto_2539080 ?auto_2539079 ) ( ON ?auto_2539077 ?auto_2539080 ) ( ON ?auto_2539081 ?auto_2539077 ) ( ON ?auto_2539083 ?auto_2539081 ) ( ON ?auto_2539082 ?auto_2539083 ) ( ON ?auto_2539084 ?auto_2539082 ) ( not ( = ?auto_2539078 ?auto_2539079 ) ) ( not ( = ?auto_2539078 ?auto_2539080 ) ) ( not ( = ?auto_2539078 ?auto_2539077 ) ) ( not ( = ?auto_2539078 ?auto_2539081 ) ) ( not ( = ?auto_2539078 ?auto_2539083 ) ) ( not ( = ?auto_2539078 ?auto_2539082 ) ) ( not ( = ?auto_2539078 ?auto_2539084 ) ) ( not ( = ?auto_2539078 ?auto_2539085 ) ) ( not ( = ?auto_2539078 ?auto_2539086 ) ) ( not ( = ?auto_2539078 ?auto_2539089 ) ) ( not ( = ?auto_2539079 ?auto_2539080 ) ) ( not ( = ?auto_2539079 ?auto_2539077 ) ) ( not ( = ?auto_2539079 ?auto_2539081 ) ) ( not ( = ?auto_2539079 ?auto_2539083 ) ) ( not ( = ?auto_2539079 ?auto_2539082 ) ) ( not ( = ?auto_2539079 ?auto_2539084 ) ) ( not ( = ?auto_2539079 ?auto_2539085 ) ) ( not ( = ?auto_2539079 ?auto_2539086 ) ) ( not ( = ?auto_2539079 ?auto_2539089 ) ) ( not ( = ?auto_2539080 ?auto_2539077 ) ) ( not ( = ?auto_2539080 ?auto_2539081 ) ) ( not ( = ?auto_2539080 ?auto_2539083 ) ) ( not ( = ?auto_2539080 ?auto_2539082 ) ) ( not ( = ?auto_2539080 ?auto_2539084 ) ) ( not ( = ?auto_2539080 ?auto_2539085 ) ) ( not ( = ?auto_2539080 ?auto_2539086 ) ) ( not ( = ?auto_2539080 ?auto_2539089 ) ) ( not ( = ?auto_2539077 ?auto_2539081 ) ) ( not ( = ?auto_2539077 ?auto_2539083 ) ) ( not ( = ?auto_2539077 ?auto_2539082 ) ) ( not ( = ?auto_2539077 ?auto_2539084 ) ) ( not ( = ?auto_2539077 ?auto_2539085 ) ) ( not ( = ?auto_2539077 ?auto_2539086 ) ) ( not ( = ?auto_2539077 ?auto_2539089 ) ) ( not ( = ?auto_2539081 ?auto_2539083 ) ) ( not ( = ?auto_2539081 ?auto_2539082 ) ) ( not ( = ?auto_2539081 ?auto_2539084 ) ) ( not ( = ?auto_2539081 ?auto_2539085 ) ) ( not ( = ?auto_2539081 ?auto_2539086 ) ) ( not ( = ?auto_2539081 ?auto_2539089 ) ) ( not ( = ?auto_2539083 ?auto_2539082 ) ) ( not ( = ?auto_2539083 ?auto_2539084 ) ) ( not ( = ?auto_2539083 ?auto_2539085 ) ) ( not ( = ?auto_2539083 ?auto_2539086 ) ) ( not ( = ?auto_2539083 ?auto_2539089 ) ) ( not ( = ?auto_2539082 ?auto_2539084 ) ) ( not ( = ?auto_2539082 ?auto_2539085 ) ) ( not ( = ?auto_2539082 ?auto_2539086 ) ) ( not ( = ?auto_2539082 ?auto_2539089 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2539084 ?auto_2539085 ?auto_2539086 )
      ( MAKE-9CRATE-VERIFY ?auto_2539078 ?auto_2539079 ?auto_2539080 ?auto_2539077 ?auto_2539081 ?auto_2539083 ?auto_2539082 ?auto_2539084 ?auto_2539085 ?auto_2539086 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2539187 - SURFACE
      ?auto_2539188 - SURFACE
      ?auto_2539189 - SURFACE
      ?auto_2539186 - SURFACE
      ?auto_2539190 - SURFACE
      ?auto_2539192 - SURFACE
      ?auto_2539191 - SURFACE
      ?auto_2539193 - SURFACE
      ?auto_2539194 - SURFACE
      ?auto_2539195 - SURFACE
    )
    :vars
    (
      ?auto_2539201 - HOIST
      ?auto_2539199 - PLACE
      ?auto_2539197 - PLACE
      ?auto_2539198 - HOIST
      ?auto_2539196 - SURFACE
      ?auto_2539200 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2539201 ?auto_2539199 ) ( SURFACE-AT ?auto_2539194 ?auto_2539199 ) ( CLEAR ?auto_2539194 ) ( IS-CRATE ?auto_2539195 ) ( not ( = ?auto_2539194 ?auto_2539195 ) ) ( AVAILABLE ?auto_2539201 ) ( ON ?auto_2539194 ?auto_2539193 ) ( not ( = ?auto_2539193 ?auto_2539194 ) ) ( not ( = ?auto_2539193 ?auto_2539195 ) ) ( not ( = ?auto_2539197 ?auto_2539199 ) ) ( HOIST-AT ?auto_2539198 ?auto_2539197 ) ( not ( = ?auto_2539201 ?auto_2539198 ) ) ( AVAILABLE ?auto_2539198 ) ( SURFACE-AT ?auto_2539195 ?auto_2539197 ) ( ON ?auto_2539195 ?auto_2539196 ) ( CLEAR ?auto_2539195 ) ( not ( = ?auto_2539194 ?auto_2539196 ) ) ( not ( = ?auto_2539195 ?auto_2539196 ) ) ( not ( = ?auto_2539193 ?auto_2539196 ) ) ( TRUCK-AT ?auto_2539200 ?auto_2539199 ) ( ON ?auto_2539188 ?auto_2539187 ) ( ON ?auto_2539189 ?auto_2539188 ) ( ON ?auto_2539186 ?auto_2539189 ) ( ON ?auto_2539190 ?auto_2539186 ) ( ON ?auto_2539192 ?auto_2539190 ) ( ON ?auto_2539191 ?auto_2539192 ) ( ON ?auto_2539193 ?auto_2539191 ) ( not ( = ?auto_2539187 ?auto_2539188 ) ) ( not ( = ?auto_2539187 ?auto_2539189 ) ) ( not ( = ?auto_2539187 ?auto_2539186 ) ) ( not ( = ?auto_2539187 ?auto_2539190 ) ) ( not ( = ?auto_2539187 ?auto_2539192 ) ) ( not ( = ?auto_2539187 ?auto_2539191 ) ) ( not ( = ?auto_2539187 ?auto_2539193 ) ) ( not ( = ?auto_2539187 ?auto_2539194 ) ) ( not ( = ?auto_2539187 ?auto_2539195 ) ) ( not ( = ?auto_2539187 ?auto_2539196 ) ) ( not ( = ?auto_2539188 ?auto_2539189 ) ) ( not ( = ?auto_2539188 ?auto_2539186 ) ) ( not ( = ?auto_2539188 ?auto_2539190 ) ) ( not ( = ?auto_2539188 ?auto_2539192 ) ) ( not ( = ?auto_2539188 ?auto_2539191 ) ) ( not ( = ?auto_2539188 ?auto_2539193 ) ) ( not ( = ?auto_2539188 ?auto_2539194 ) ) ( not ( = ?auto_2539188 ?auto_2539195 ) ) ( not ( = ?auto_2539188 ?auto_2539196 ) ) ( not ( = ?auto_2539189 ?auto_2539186 ) ) ( not ( = ?auto_2539189 ?auto_2539190 ) ) ( not ( = ?auto_2539189 ?auto_2539192 ) ) ( not ( = ?auto_2539189 ?auto_2539191 ) ) ( not ( = ?auto_2539189 ?auto_2539193 ) ) ( not ( = ?auto_2539189 ?auto_2539194 ) ) ( not ( = ?auto_2539189 ?auto_2539195 ) ) ( not ( = ?auto_2539189 ?auto_2539196 ) ) ( not ( = ?auto_2539186 ?auto_2539190 ) ) ( not ( = ?auto_2539186 ?auto_2539192 ) ) ( not ( = ?auto_2539186 ?auto_2539191 ) ) ( not ( = ?auto_2539186 ?auto_2539193 ) ) ( not ( = ?auto_2539186 ?auto_2539194 ) ) ( not ( = ?auto_2539186 ?auto_2539195 ) ) ( not ( = ?auto_2539186 ?auto_2539196 ) ) ( not ( = ?auto_2539190 ?auto_2539192 ) ) ( not ( = ?auto_2539190 ?auto_2539191 ) ) ( not ( = ?auto_2539190 ?auto_2539193 ) ) ( not ( = ?auto_2539190 ?auto_2539194 ) ) ( not ( = ?auto_2539190 ?auto_2539195 ) ) ( not ( = ?auto_2539190 ?auto_2539196 ) ) ( not ( = ?auto_2539192 ?auto_2539191 ) ) ( not ( = ?auto_2539192 ?auto_2539193 ) ) ( not ( = ?auto_2539192 ?auto_2539194 ) ) ( not ( = ?auto_2539192 ?auto_2539195 ) ) ( not ( = ?auto_2539192 ?auto_2539196 ) ) ( not ( = ?auto_2539191 ?auto_2539193 ) ) ( not ( = ?auto_2539191 ?auto_2539194 ) ) ( not ( = ?auto_2539191 ?auto_2539195 ) ) ( not ( = ?auto_2539191 ?auto_2539196 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2539193 ?auto_2539194 ?auto_2539195 )
      ( MAKE-9CRATE-VERIFY ?auto_2539187 ?auto_2539188 ?auto_2539189 ?auto_2539186 ?auto_2539190 ?auto_2539192 ?auto_2539191 ?auto_2539193 ?auto_2539194 ?auto_2539195 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2539296 - SURFACE
      ?auto_2539297 - SURFACE
      ?auto_2539298 - SURFACE
      ?auto_2539295 - SURFACE
      ?auto_2539299 - SURFACE
      ?auto_2539301 - SURFACE
      ?auto_2539300 - SURFACE
      ?auto_2539302 - SURFACE
      ?auto_2539303 - SURFACE
      ?auto_2539304 - SURFACE
    )
    :vars
    (
      ?auto_2539307 - HOIST
      ?auto_2539308 - PLACE
      ?auto_2539310 - PLACE
      ?auto_2539309 - HOIST
      ?auto_2539305 - SURFACE
      ?auto_2539306 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2539307 ?auto_2539308 ) ( IS-CRATE ?auto_2539304 ) ( not ( = ?auto_2539303 ?auto_2539304 ) ) ( not ( = ?auto_2539302 ?auto_2539303 ) ) ( not ( = ?auto_2539302 ?auto_2539304 ) ) ( not ( = ?auto_2539310 ?auto_2539308 ) ) ( HOIST-AT ?auto_2539309 ?auto_2539310 ) ( not ( = ?auto_2539307 ?auto_2539309 ) ) ( AVAILABLE ?auto_2539309 ) ( SURFACE-AT ?auto_2539304 ?auto_2539310 ) ( ON ?auto_2539304 ?auto_2539305 ) ( CLEAR ?auto_2539304 ) ( not ( = ?auto_2539303 ?auto_2539305 ) ) ( not ( = ?auto_2539304 ?auto_2539305 ) ) ( not ( = ?auto_2539302 ?auto_2539305 ) ) ( TRUCK-AT ?auto_2539306 ?auto_2539308 ) ( SURFACE-AT ?auto_2539302 ?auto_2539308 ) ( CLEAR ?auto_2539302 ) ( LIFTING ?auto_2539307 ?auto_2539303 ) ( IS-CRATE ?auto_2539303 ) ( ON ?auto_2539297 ?auto_2539296 ) ( ON ?auto_2539298 ?auto_2539297 ) ( ON ?auto_2539295 ?auto_2539298 ) ( ON ?auto_2539299 ?auto_2539295 ) ( ON ?auto_2539301 ?auto_2539299 ) ( ON ?auto_2539300 ?auto_2539301 ) ( ON ?auto_2539302 ?auto_2539300 ) ( not ( = ?auto_2539296 ?auto_2539297 ) ) ( not ( = ?auto_2539296 ?auto_2539298 ) ) ( not ( = ?auto_2539296 ?auto_2539295 ) ) ( not ( = ?auto_2539296 ?auto_2539299 ) ) ( not ( = ?auto_2539296 ?auto_2539301 ) ) ( not ( = ?auto_2539296 ?auto_2539300 ) ) ( not ( = ?auto_2539296 ?auto_2539302 ) ) ( not ( = ?auto_2539296 ?auto_2539303 ) ) ( not ( = ?auto_2539296 ?auto_2539304 ) ) ( not ( = ?auto_2539296 ?auto_2539305 ) ) ( not ( = ?auto_2539297 ?auto_2539298 ) ) ( not ( = ?auto_2539297 ?auto_2539295 ) ) ( not ( = ?auto_2539297 ?auto_2539299 ) ) ( not ( = ?auto_2539297 ?auto_2539301 ) ) ( not ( = ?auto_2539297 ?auto_2539300 ) ) ( not ( = ?auto_2539297 ?auto_2539302 ) ) ( not ( = ?auto_2539297 ?auto_2539303 ) ) ( not ( = ?auto_2539297 ?auto_2539304 ) ) ( not ( = ?auto_2539297 ?auto_2539305 ) ) ( not ( = ?auto_2539298 ?auto_2539295 ) ) ( not ( = ?auto_2539298 ?auto_2539299 ) ) ( not ( = ?auto_2539298 ?auto_2539301 ) ) ( not ( = ?auto_2539298 ?auto_2539300 ) ) ( not ( = ?auto_2539298 ?auto_2539302 ) ) ( not ( = ?auto_2539298 ?auto_2539303 ) ) ( not ( = ?auto_2539298 ?auto_2539304 ) ) ( not ( = ?auto_2539298 ?auto_2539305 ) ) ( not ( = ?auto_2539295 ?auto_2539299 ) ) ( not ( = ?auto_2539295 ?auto_2539301 ) ) ( not ( = ?auto_2539295 ?auto_2539300 ) ) ( not ( = ?auto_2539295 ?auto_2539302 ) ) ( not ( = ?auto_2539295 ?auto_2539303 ) ) ( not ( = ?auto_2539295 ?auto_2539304 ) ) ( not ( = ?auto_2539295 ?auto_2539305 ) ) ( not ( = ?auto_2539299 ?auto_2539301 ) ) ( not ( = ?auto_2539299 ?auto_2539300 ) ) ( not ( = ?auto_2539299 ?auto_2539302 ) ) ( not ( = ?auto_2539299 ?auto_2539303 ) ) ( not ( = ?auto_2539299 ?auto_2539304 ) ) ( not ( = ?auto_2539299 ?auto_2539305 ) ) ( not ( = ?auto_2539301 ?auto_2539300 ) ) ( not ( = ?auto_2539301 ?auto_2539302 ) ) ( not ( = ?auto_2539301 ?auto_2539303 ) ) ( not ( = ?auto_2539301 ?auto_2539304 ) ) ( not ( = ?auto_2539301 ?auto_2539305 ) ) ( not ( = ?auto_2539300 ?auto_2539302 ) ) ( not ( = ?auto_2539300 ?auto_2539303 ) ) ( not ( = ?auto_2539300 ?auto_2539304 ) ) ( not ( = ?auto_2539300 ?auto_2539305 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2539302 ?auto_2539303 ?auto_2539304 )
      ( MAKE-9CRATE-VERIFY ?auto_2539296 ?auto_2539297 ?auto_2539298 ?auto_2539295 ?auto_2539299 ?auto_2539301 ?auto_2539300 ?auto_2539302 ?auto_2539303 ?auto_2539304 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2539405 - SURFACE
      ?auto_2539406 - SURFACE
      ?auto_2539407 - SURFACE
      ?auto_2539404 - SURFACE
      ?auto_2539408 - SURFACE
      ?auto_2539410 - SURFACE
      ?auto_2539409 - SURFACE
      ?auto_2539411 - SURFACE
      ?auto_2539412 - SURFACE
      ?auto_2539413 - SURFACE
    )
    :vars
    (
      ?auto_2539416 - HOIST
      ?auto_2539415 - PLACE
      ?auto_2539419 - PLACE
      ?auto_2539414 - HOIST
      ?auto_2539418 - SURFACE
      ?auto_2539417 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2539416 ?auto_2539415 ) ( IS-CRATE ?auto_2539413 ) ( not ( = ?auto_2539412 ?auto_2539413 ) ) ( not ( = ?auto_2539411 ?auto_2539412 ) ) ( not ( = ?auto_2539411 ?auto_2539413 ) ) ( not ( = ?auto_2539419 ?auto_2539415 ) ) ( HOIST-AT ?auto_2539414 ?auto_2539419 ) ( not ( = ?auto_2539416 ?auto_2539414 ) ) ( AVAILABLE ?auto_2539414 ) ( SURFACE-AT ?auto_2539413 ?auto_2539419 ) ( ON ?auto_2539413 ?auto_2539418 ) ( CLEAR ?auto_2539413 ) ( not ( = ?auto_2539412 ?auto_2539418 ) ) ( not ( = ?auto_2539413 ?auto_2539418 ) ) ( not ( = ?auto_2539411 ?auto_2539418 ) ) ( TRUCK-AT ?auto_2539417 ?auto_2539415 ) ( SURFACE-AT ?auto_2539411 ?auto_2539415 ) ( CLEAR ?auto_2539411 ) ( IS-CRATE ?auto_2539412 ) ( AVAILABLE ?auto_2539416 ) ( IN ?auto_2539412 ?auto_2539417 ) ( ON ?auto_2539406 ?auto_2539405 ) ( ON ?auto_2539407 ?auto_2539406 ) ( ON ?auto_2539404 ?auto_2539407 ) ( ON ?auto_2539408 ?auto_2539404 ) ( ON ?auto_2539410 ?auto_2539408 ) ( ON ?auto_2539409 ?auto_2539410 ) ( ON ?auto_2539411 ?auto_2539409 ) ( not ( = ?auto_2539405 ?auto_2539406 ) ) ( not ( = ?auto_2539405 ?auto_2539407 ) ) ( not ( = ?auto_2539405 ?auto_2539404 ) ) ( not ( = ?auto_2539405 ?auto_2539408 ) ) ( not ( = ?auto_2539405 ?auto_2539410 ) ) ( not ( = ?auto_2539405 ?auto_2539409 ) ) ( not ( = ?auto_2539405 ?auto_2539411 ) ) ( not ( = ?auto_2539405 ?auto_2539412 ) ) ( not ( = ?auto_2539405 ?auto_2539413 ) ) ( not ( = ?auto_2539405 ?auto_2539418 ) ) ( not ( = ?auto_2539406 ?auto_2539407 ) ) ( not ( = ?auto_2539406 ?auto_2539404 ) ) ( not ( = ?auto_2539406 ?auto_2539408 ) ) ( not ( = ?auto_2539406 ?auto_2539410 ) ) ( not ( = ?auto_2539406 ?auto_2539409 ) ) ( not ( = ?auto_2539406 ?auto_2539411 ) ) ( not ( = ?auto_2539406 ?auto_2539412 ) ) ( not ( = ?auto_2539406 ?auto_2539413 ) ) ( not ( = ?auto_2539406 ?auto_2539418 ) ) ( not ( = ?auto_2539407 ?auto_2539404 ) ) ( not ( = ?auto_2539407 ?auto_2539408 ) ) ( not ( = ?auto_2539407 ?auto_2539410 ) ) ( not ( = ?auto_2539407 ?auto_2539409 ) ) ( not ( = ?auto_2539407 ?auto_2539411 ) ) ( not ( = ?auto_2539407 ?auto_2539412 ) ) ( not ( = ?auto_2539407 ?auto_2539413 ) ) ( not ( = ?auto_2539407 ?auto_2539418 ) ) ( not ( = ?auto_2539404 ?auto_2539408 ) ) ( not ( = ?auto_2539404 ?auto_2539410 ) ) ( not ( = ?auto_2539404 ?auto_2539409 ) ) ( not ( = ?auto_2539404 ?auto_2539411 ) ) ( not ( = ?auto_2539404 ?auto_2539412 ) ) ( not ( = ?auto_2539404 ?auto_2539413 ) ) ( not ( = ?auto_2539404 ?auto_2539418 ) ) ( not ( = ?auto_2539408 ?auto_2539410 ) ) ( not ( = ?auto_2539408 ?auto_2539409 ) ) ( not ( = ?auto_2539408 ?auto_2539411 ) ) ( not ( = ?auto_2539408 ?auto_2539412 ) ) ( not ( = ?auto_2539408 ?auto_2539413 ) ) ( not ( = ?auto_2539408 ?auto_2539418 ) ) ( not ( = ?auto_2539410 ?auto_2539409 ) ) ( not ( = ?auto_2539410 ?auto_2539411 ) ) ( not ( = ?auto_2539410 ?auto_2539412 ) ) ( not ( = ?auto_2539410 ?auto_2539413 ) ) ( not ( = ?auto_2539410 ?auto_2539418 ) ) ( not ( = ?auto_2539409 ?auto_2539411 ) ) ( not ( = ?auto_2539409 ?auto_2539412 ) ) ( not ( = ?auto_2539409 ?auto_2539413 ) ) ( not ( = ?auto_2539409 ?auto_2539418 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2539411 ?auto_2539412 ?auto_2539413 )
      ( MAKE-9CRATE-VERIFY ?auto_2539405 ?auto_2539406 ?auto_2539407 ?auto_2539404 ?auto_2539408 ?auto_2539410 ?auto_2539409 ?auto_2539411 ?auto_2539412 ?auto_2539413 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2540222 - SURFACE
      ?auto_2540223 - SURFACE
    )
    :vars
    (
      ?auto_2540228 - HOIST
      ?auto_2540229 - PLACE
      ?auto_2540226 - SURFACE
      ?auto_2540224 - PLACE
      ?auto_2540230 - HOIST
      ?auto_2540225 - SURFACE
      ?auto_2540227 - TRUCK
      ?auto_2540231 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2540228 ?auto_2540229 ) ( SURFACE-AT ?auto_2540222 ?auto_2540229 ) ( CLEAR ?auto_2540222 ) ( IS-CRATE ?auto_2540223 ) ( not ( = ?auto_2540222 ?auto_2540223 ) ) ( ON ?auto_2540222 ?auto_2540226 ) ( not ( = ?auto_2540226 ?auto_2540222 ) ) ( not ( = ?auto_2540226 ?auto_2540223 ) ) ( not ( = ?auto_2540224 ?auto_2540229 ) ) ( HOIST-AT ?auto_2540230 ?auto_2540224 ) ( not ( = ?auto_2540228 ?auto_2540230 ) ) ( AVAILABLE ?auto_2540230 ) ( SURFACE-AT ?auto_2540223 ?auto_2540224 ) ( ON ?auto_2540223 ?auto_2540225 ) ( CLEAR ?auto_2540223 ) ( not ( = ?auto_2540222 ?auto_2540225 ) ) ( not ( = ?auto_2540223 ?auto_2540225 ) ) ( not ( = ?auto_2540226 ?auto_2540225 ) ) ( TRUCK-AT ?auto_2540227 ?auto_2540229 ) ( LIFTING ?auto_2540228 ?auto_2540231 ) ( IS-CRATE ?auto_2540231 ) ( not ( = ?auto_2540222 ?auto_2540231 ) ) ( not ( = ?auto_2540223 ?auto_2540231 ) ) ( not ( = ?auto_2540226 ?auto_2540231 ) ) ( not ( = ?auto_2540225 ?auto_2540231 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2540228 ?auto_2540231 ?auto_2540227 ?auto_2540229 )
      ( MAKE-1CRATE ?auto_2540222 ?auto_2540223 )
      ( MAKE-1CRATE-VERIFY ?auto_2540222 ?auto_2540223 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2542330 - SURFACE
      ?auto_2542331 - SURFACE
    )
    :vars
    (
      ?auto_2542334 - HOIST
      ?auto_2542333 - PLACE
      ?auto_2542336 - SURFACE
      ?auto_2542338 - TRUCK
      ?auto_2542332 - PLACE
      ?auto_2542337 - HOIST
      ?auto_2542335 - SURFACE
      ?auto_2542339 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2542334 ?auto_2542333 ) ( SURFACE-AT ?auto_2542330 ?auto_2542333 ) ( CLEAR ?auto_2542330 ) ( IS-CRATE ?auto_2542331 ) ( not ( = ?auto_2542330 ?auto_2542331 ) ) ( AVAILABLE ?auto_2542334 ) ( ON ?auto_2542330 ?auto_2542336 ) ( not ( = ?auto_2542336 ?auto_2542330 ) ) ( not ( = ?auto_2542336 ?auto_2542331 ) ) ( TRUCK-AT ?auto_2542338 ?auto_2542332 ) ( not ( = ?auto_2542332 ?auto_2542333 ) ) ( HOIST-AT ?auto_2542337 ?auto_2542332 ) ( not ( = ?auto_2542334 ?auto_2542337 ) ) ( SURFACE-AT ?auto_2542331 ?auto_2542332 ) ( ON ?auto_2542331 ?auto_2542335 ) ( CLEAR ?auto_2542331 ) ( not ( = ?auto_2542330 ?auto_2542335 ) ) ( not ( = ?auto_2542331 ?auto_2542335 ) ) ( not ( = ?auto_2542336 ?auto_2542335 ) ) ( LIFTING ?auto_2542337 ?auto_2542339 ) ( IS-CRATE ?auto_2542339 ) ( not ( = ?auto_2542330 ?auto_2542339 ) ) ( not ( = ?auto_2542331 ?auto_2542339 ) ) ( not ( = ?auto_2542336 ?auto_2542339 ) ) ( not ( = ?auto_2542335 ?auto_2542339 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2542337 ?auto_2542339 ?auto_2542338 ?auto_2542332 )
      ( MAKE-1CRATE ?auto_2542330 ?auto_2542331 )
      ( MAKE-1CRATE-VERIFY ?auto_2542330 ?auto_2542331 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2544941 - SURFACE
      ?auto_2544942 - SURFACE
      ?auto_2544943 - SURFACE
      ?auto_2544940 - SURFACE
      ?auto_2544944 - SURFACE
      ?auto_2544946 - SURFACE
      ?auto_2544945 - SURFACE
      ?auto_2544947 - SURFACE
      ?auto_2544948 - SURFACE
      ?auto_2544949 - SURFACE
      ?auto_2544950 - SURFACE
    )
    :vars
    (
      ?auto_2544951 - HOIST
      ?auto_2544952 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2544951 ?auto_2544952 ) ( SURFACE-AT ?auto_2544949 ?auto_2544952 ) ( CLEAR ?auto_2544949 ) ( LIFTING ?auto_2544951 ?auto_2544950 ) ( IS-CRATE ?auto_2544950 ) ( not ( = ?auto_2544949 ?auto_2544950 ) ) ( ON ?auto_2544942 ?auto_2544941 ) ( ON ?auto_2544943 ?auto_2544942 ) ( ON ?auto_2544940 ?auto_2544943 ) ( ON ?auto_2544944 ?auto_2544940 ) ( ON ?auto_2544946 ?auto_2544944 ) ( ON ?auto_2544945 ?auto_2544946 ) ( ON ?auto_2544947 ?auto_2544945 ) ( ON ?auto_2544948 ?auto_2544947 ) ( ON ?auto_2544949 ?auto_2544948 ) ( not ( = ?auto_2544941 ?auto_2544942 ) ) ( not ( = ?auto_2544941 ?auto_2544943 ) ) ( not ( = ?auto_2544941 ?auto_2544940 ) ) ( not ( = ?auto_2544941 ?auto_2544944 ) ) ( not ( = ?auto_2544941 ?auto_2544946 ) ) ( not ( = ?auto_2544941 ?auto_2544945 ) ) ( not ( = ?auto_2544941 ?auto_2544947 ) ) ( not ( = ?auto_2544941 ?auto_2544948 ) ) ( not ( = ?auto_2544941 ?auto_2544949 ) ) ( not ( = ?auto_2544941 ?auto_2544950 ) ) ( not ( = ?auto_2544942 ?auto_2544943 ) ) ( not ( = ?auto_2544942 ?auto_2544940 ) ) ( not ( = ?auto_2544942 ?auto_2544944 ) ) ( not ( = ?auto_2544942 ?auto_2544946 ) ) ( not ( = ?auto_2544942 ?auto_2544945 ) ) ( not ( = ?auto_2544942 ?auto_2544947 ) ) ( not ( = ?auto_2544942 ?auto_2544948 ) ) ( not ( = ?auto_2544942 ?auto_2544949 ) ) ( not ( = ?auto_2544942 ?auto_2544950 ) ) ( not ( = ?auto_2544943 ?auto_2544940 ) ) ( not ( = ?auto_2544943 ?auto_2544944 ) ) ( not ( = ?auto_2544943 ?auto_2544946 ) ) ( not ( = ?auto_2544943 ?auto_2544945 ) ) ( not ( = ?auto_2544943 ?auto_2544947 ) ) ( not ( = ?auto_2544943 ?auto_2544948 ) ) ( not ( = ?auto_2544943 ?auto_2544949 ) ) ( not ( = ?auto_2544943 ?auto_2544950 ) ) ( not ( = ?auto_2544940 ?auto_2544944 ) ) ( not ( = ?auto_2544940 ?auto_2544946 ) ) ( not ( = ?auto_2544940 ?auto_2544945 ) ) ( not ( = ?auto_2544940 ?auto_2544947 ) ) ( not ( = ?auto_2544940 ?auto_2544948 ) ) ( not ( = ?auto_2544940 ?auto_2544949 ) ) ( not ( = ?auto_2544940 ?auto_2544950 ) ) ( not ( = ?auto_2544944 ?auto_2544946 ) ) ( not ( = ?auto_2544944 ?auto_2544945 ) ) ( not ( = ?auto_2544944 ?auto_2544947 ) ) ( not ( = ?auto_2544944 ?auto_2544948 ) ) ( not ( = ?auto_2544944 ?auto_2544949 ) ) ( not ( = ?auto_2544944 ?auto_2544950 ) ) ( not ( = ?auto_2544946 ?auto_2544945 ) ) ( not ( = ?auto_2544946 ?auto_2544947 ) ) ( not ( = ?auto_2544946 ?auto_2544948 ) ) ( not ( = ?auto_2544946 ?auto_2544949 ) ) ( not ( = ?auto_2544946 ?auto_2544950 ) ) ( not ( = ?auto_2544945 ?auto_2544947 ) ) ( not ( = ?auto_2544945 ?auto_2544948 ) ) ( not ( = ?auto_2544945 ?auto_2544949 ) ) ( not ( = ?auto_2544945 ?auto_2544950 ) ) ( not ( = ?auto_2544947 ?auto_2544948 ) ) ( not ( = ?auto_2544947 ?auto_2544949 ) ) ( not ( = ?auto_2544947 ?auto_2544950 ) ) ( not ( = ?auto_2544948 ?auto_2544949 ) ) ( not ( = ?auto_2544948 ?auto_2544950 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2544949 ?auto_2544950 )
      ( MAKE-10CRATE-VERIFY ?auto_2544941 ?auto_2544942 ?auto_2544943 ?auto_2544940 ?auto_2544944 ?auto_2544946 ?auto_2544945 ?auto_2544947 ?auto_2544948 ?auto_2544949 ?auto_2544950 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2545035 - SURFACE
      ?auto_2545036 - SURFACE
      ?auto_2545037 - SURFACE
      ?auto_2545034 - SURFACE
      ?auto_2545038 - SURFACE
      ?auto_2545040 - SURFACE
      ?auto_2545039 - SURFACE
      ?auto_2545041 - SURFACE
      ?auto_2545042 - SURFACE
      ?auto_2545043 - SURFACE
      ?auto_2545044 - SURFACE
    )
    :vars
    (
      ?auto_2545045 - HOIST
      ?auto_2545047 - PLACE
      ?auto_2545046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2545045 ?auto_2545047 ) ( SURFACE-AT ?auto_2545043 ?auto_2545047 ) ( CLEAR ?auto_2545043 ) ( IS-CRATE ?auto_2545044 ) ( not ( = ?auto_2545043 ?auto_2545044 ) ) ( TRUCK-AT ?auto_2545046 ?auto_2545047 ) ( AVAILABLE ?auto_2545045 ) ( IN ?auto_2545044 ?auto_2545046 ) ( ON ?auto_2545043 ?auto_2545042 ) ( not ( = ?auto_2545042 ?auto_2545043 ) ) ( not ( = ?auto_2545042 ?auto_2545044 ) ) ( ON ?auto_2545036 ?auto_2545035 ) ( ON ?auto_2545037 ?auto_2545036 ) ( ON ?auto_2545034 ?auto_2545037 ) ( ON ?auto_2545038 ?auto_2545034 ) ( ON ?auto_2545040 ?auto_2545038 ) ( ON ?auto_2545039 ?auto_2545040 ) ( ON ?auto_2545041 ?auto_2545039 ) ( ON ?auto_2545042 ?auto_2545041 ) ( not ( = ?auto_2545035 ?auto_2545036 ) ) ( not ( = ?auto_2545035 ?auto_2545037 ) ) ( not ( = ?auto_2545035 ?auto_2545034 ) ) ( not ( = ?auto_2545035 ?auto_2545038 ) ) ( not ( = ?auto_2545035 ?auto_2545040 ) ) ( not ( = ?auto_2545035 ?auto_2545039 ) ) ( not ( = ?auto_2545035 ?auto_2545041 ) ) ( not ( = ?auto_2545035 ?auto_2545042 ) ) ( not ( = ?auto_2545035 ?auto_2545043 ) ) ( not ( = ?auto_2545035 ?auto_2545044 ) ) ( not ( = ?auto_2545036 ?auto_2545037 ) ) ( not ( = ?auto_2545036 ?auto_2545034 ) ) ( not ( = ?auto_2545036 ?auto_2545038 ) ) ( not ( = ?auto_2545036 ?auto_2545040 ) ) ( not ( = ?auto_2545036 ?auto_2545039 ) ) ( not ( = ?auto_2545036 ?auto_2545041 ) ) ( not ( = ?auto_2545036 ?auto_2545042 ) ) ( not ( = ?auto_2545036 ?auto_2545043 ) ) ( not ( = ?auto_2545036 ?auto_2545044 ) ) ( not ( = ?auto_2545037 ?auto_2545034 ) ) ( not ( = ?auto_2545037 ?auto_2545038 ) ) ( not ( = ?auto_2545037 ?auto_2545040 ) ) ( not ( = ?auto_2545037 ?auto_2545039 ) ) ( not ( = ?auto_2545037 ?auto_2545041 ) ) ( not ( = ?auto_2545037 ?auto_2545042 ) ) ( not ( = ?auto_2545037 ?auto_2545043 ) ) ( not ( = ?auto_2545037 ?auto_2545044 ) ) ( not ( = ?auto_2545034 ?auto_2545038 ) ) ( not ( = ?auto_2545034 ?auto_2545040 ) ) ( not ( = ?auto_2545034 ?auto_2545039 ) ) ( not ( = ?auto_2545034 ?auto_2545041 ) ) ( not ( = ?auto_2545034 ?auto_2545042 ) ) ( not ( = ?auto_2545034 ?auto_2545043 ) ) ( not ( = ?auto_2545034 ?auto_2545044 ) ) ( not ( = ?auto_2545038 ?auto_2545040 ) ) ( not ( = ?auto_2545038 ?auto_2545039 ) ) ( not ( = ?auto_2545038 ?auto_2545041 ) ) ( not ( = ?auto_2545038 ?auto_2545042 ) ) ( not ( = ?auto_2545038 ?auto_2545043 ) ) ( not ( = ?auto_2545038 ?auto_2545044 ) ) ( not ( = ?auto_2545040 ?auto_2545039 ) ) ( not ( = ?auto_2545040 ?auto_2545041 ) ) ( not ( = ?auto_2545040 ?auto_2545042 ) ) ( not ( = ?auto_2545040 ?auto_2545043 ) ) ( not ( = ?auto_2545040 ?auto_2545044 ) ) ( not ( = ?auto_2545039 ?auto_2545041 ) ) ( not ( = ?auto_2545039 ?auto_2545042 ) ) ( not ( = ?auto_2545039 ?auto_2545043 ) ) ( not ( = ?auto_2545039 ?auto_2545044 ) ) ( not ( = ?auto_2545041 ?auto_2545042 ) ) ( not ( = ?auto_2545041 ?auto_2545043 ) ) ( not ( = ?auto_2545041 ?auto_2545044 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2545042 ?auto_2545043 ?auto_2545044 )
      ( MAKE-10CRATE-VERIFY ?auto_2545035 ?auto_2545036 ?auto_2545037 ?auto_2545034 ?auto_2545038 ?auto_2545040 ?auto_2545039 ?auto_2545041 ?auto_2545042 ?auto_2545043 ?auto_2545044 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2545140 - SURFACE
      ?auto_2545141 - SURFACE
      ?auto_2545142 - SURFACE
      ?auto_2545139 - SURFACE
      ?auto_2545143 - SURFACE
      ?auto_2545145 - SURFACE
      ?auto_2545144 - SURFACE
      ?auto_2545146 - SURFACE
      ?auto_2545147 - SURFACE
      ?auto_2545148 - SURFACE
      ?auto_2545149 - SURFACE
    )
    :vars
    (
      ?auto_2545153 - HOIST
      ?auto_2545151 - PLACE
      ?auto_2545150 - TRUCK
      ?auto_2545152 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2545153 ?auto_2545151 ) ( SURFACE-AT ?auto_2545148 ?auto_2545151 ) ( CLEAR ?auto_2545148 ) ( IS-CRATE ?auto_2545149 ) ( not ( = ?auto_2545148 ?auto_2545149 ) ) ( AVAILABLE ?auto_2545153 ) ( IN ?auto_2545149 ?auto_2545150 ) ( ON ?auto_2545148 ?auto_2545147 ) ( not ( = ?auto_2545147 ?auto_2545148 ) ) ( not ( = ?auto_2545147 ?auto_2545149 ) ) ( TRUCK-AT ?auto_2545150 ?auto_2545152 ) ( not ( = ?auto_2545152 ?auto_2545151 ) ) ( ON ?auto_2545141 ?auto_2545140 ) ( ON ?auto_2545142 ?auto_2545141 ) ( ON ?auto_2545139 ?auto_2545142 ) ( ON ?auto_2545143 ?auto_2545139 ) ( ON ?auto_2545145 ?auto_2545143 ) ( ON ?auto_2545144 ?auto_2545145 ) ( ON ?auto_2545146 ?auto_2545144 ) ( ON ?auto_2545147 ?auto_2545146 ) ( not ( = ?auto_2545140 ?auto_2545141 ) ) ( not ( = ?auto_2545140 ?auto_2545142 ) ) ( not ( = ?auto_2545140 ?auto_2545139 ) ) ( not ( = ?auto_2545140 ?auto_2545143 ) ) ( not ( = ?auto_2545140 ?auto_2545145 ) ) ( not ( = ?auto_2545140 ?auto_2545144 ) ) ( not ( = ?auto_2545140 ?auto_2545146 ) ) ( not ( = ?auto_2545140 ?auto_2545147 ) ) ( not ( = ?auto_2545140 ?auto_2545148 ) ) ( not ( = ?auto_2545140 ?auto_2545149 ) ) ( not ( = ?auto_2545141 ?auto_2545142 ) ) ( not ( = ?auto_2545141 ?auto_2545139 ) ) ( not ( = ?auto_2545141 ?auto_2545143 ) ) ( not ( = ?auto_2545141 ?auto_2545145 ) ) ( not ( = ?auto_2545141 ?auto_2545144 ) ) ( not ( = ?auto_2545141 ?auto_2545146 ) ) ( not ( = ?auto_2545141 ?auto_2545147 ) ) ( not ( = ?auto_2545141 ?auto_2545148 ) ) ( not ( = ?auto_2545141 ?auto_2545149 ) ) ( not ( = ?auto_2545142 ?auto_2545139 ) ) ( not ( = ?auto_2545142 ?auto_2545143 ) ) ( not ( = ?auto_2545142 ?auto_2545145 ) ) ( not ( = ?auto_2545142 ?auto_2545144 ) ) ( not ( = ?auto_2545142 ?auto_2545146 ) ) ( not ( = ?auto_2545142 ?auto_2545147 ) ) ( not ( = ?auto_2545142 ?auto_2545148 ) ) ( not ( = ?auto_2545142 ?auto_2545149 ) ) ( not ( = ?auto_2545139 ?auto_2545143 ) ) ( not ( = ?auto_2545139 ?auto_2545145 ) ) ( not ( = ?auto_2545139 ?auto_2545144 ) ) ( not ( = ?auto_2545139 ?auto_2545146 ) ) ( not ( = ?auto_2545139 ?auto_2545147 ) ) ( not ( = ?auto_2545139 ?auto_2545148 ) ) ( not ( = ?auto_2545139 ?auto_2545149 ) ) ( not ( = ?auto_2545143 ?auto_2545145 ) ) ( not ( = ?auto_2545143 ?auto_2545144 ) ) ( not ( = ?auto_2545143 ?auto_2545146 ) ) ( not ( = ?auto_2545143 ?auto_2545147 ) ) ( not ( = ?auto_2545143 ?auto_2545148 ) ) ( not ( = ?auto_2545143 ?auto_2545149 ) ) ( not ( = ?auto_2545145 ?auto_2545144 ) ) ( not ( = ?auto_2545145 ?auto_2545146 ) ) ( not ( = ?auto_2545145 ?auto_2545147 ) ) ( not ( = ?auto_2545145 ?auto_2545148 ) ) ( not ( = ?auto_2545145 ?auto_2545149 ) ) ( not ( = ?auto_2545144 ?auto_2545146 ) ) ( not ( = ?auto_2545144 ?auto_2545147 ) ) ( not ( = ?auto_2545144 ?auto_2545148 ) ) ( not ( = ?auto_2545144 ?auto_2545149 ) ) ( not ( = ?auto_2545146 ?auto_2545147 ) ) ( not ( = ?auto_2545146 ?auto_2545148 ) ) ( not ( = ?auto_2545146 ?auto_2545149 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2545147 ?auto_2545148 ?auto_2545149 )
      ( MAKE-10CRATE-VERIFY ?auto_2545140 ?auto_2545141 ?auto_2545142 ?auto_2545139 ?auto_2545143 ?auto_2545145 ?auto_2545144 ?auto_2545146 ?auto_2545147 ?auto_2545148 ?auto_2545149 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2545255 - SURFACE
      ?auto_2545256 - SURFACE
      ?auto_2545257 - SURFACE
      ?auto_2545254 - SURFACE
      ?auto_2545258 - SURFACE
      ?auto_2545260 - SURFACE
      ?auto_2545259 - SURFACE
      ?auto_2545261 - SURFACE
      ?auto_2545262 - SURFACE
      ?auto_2545263 - SURFACE
      ?auto_2545264 - SURFACE
    )
    :vars
    (
      ?auto_2545266 - HOIST
      ?auto_2545268 - PLACE
      ?auto_2545265 - TRUCK
      ?auto_2545267 - PLACE
      ?auto_2545269 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2545266 ?auto_2545268 ) ( SURFACE-AT ?auto_2545263 ?auto_2545268 ) ( CLEAR ?auto_2545263 ) ( IS-CRATE ?auto_2545264 ) ( not ( = ?auto_2545263 ?auto_2545264 ) ) ( AVAILABLE ?auto_2545266 ) ( ON ?auto_2545263 ?auto_2545262 ) ( not ( = ?auto_2545262 ?auto_2545263 ) ) ( not ( = ?auto_2545262 ?auto_2545264 ) ) ( TRUCK-AT ?auto_2545265 ?auto_2545267 ) ( not ( = ?auto_2545267 ?auto_2545268 ) ) ( HOIST-AT ?auto_2545269 ?auto_2545267 ) ( LIFTING ?auto_2545269 ?auto_2545264 ) ( not ( = ?auto_2545266 ?auto_2545269 ) ) ( ON ?auto_2545256 ?auto_2545255 ) ( ON ?auto_2545257 ?auto_2545256 ) ( ON ?auto_2545254 ?auto_2545257 ) ( ON ?auto_2545258 ?auto_2545254 ) ( ON ?auto_2545260 ?auto_2545258 ) ( ON ?auto_2545259 ?auto_2545260 ) ( ON ?auto_2545261 ?auto_2545259 ) ( ON ?auto_2545262 ?auto_2545261 ) ( not ( = ?auto_2545255 ?auto_2545256 ) ) ( not ( = ?auto_2545255 ?auto_2545257 ) ) ( not ( = ?auto_2545255 ?auto_2545254 ) ) ( not ( = ?auto_2545255 ?auto_2545258 ) ) ( not ( = ?auto_2545255 ?auto_2545260 ) ) ( not ( = ?auto_2545255 ?auto_2545259 ) ) ( not ( = ?auto_2545255 ?auto_2545261 ) ) ( not ( = ?auto_2545255 ?auto_2545262 ) ) ( not ( = ?auto_2545255 ?auto_2545263 ) ) ( not ( = ?auto_2545255 ?auto_2545264 ) ) ( not ( = ?auto_2545256 ?auto_2545257 ) ) ( not ( = ?auto_2545256 ?auto_2545254 ) ) ( not ( = ?auto_2545256 ?auto_2545258 ) ) ( not ( = ?auto_2545256 ?auto_2545260 ) ) ( not ( = ?auto_2545256 ?auto_2545259 ) ) ( not ( = ?auto_2545256 ?auto_2545261 ) ) ( not ( = ?auto_2545256 ?auto_2545262 ) ) ( not ( = ?auto_2545256 ?auto_2545263 ) ) ( not ( = ?auto_2545256 ?auto_2545264 ) ) ( not ( = ?auto_2545257 ?auto_2545254 ) ) ( not ( = ?auto_2545257 ?auto_2545258 ) ) ( not ( = ?auto_2545257 ?auto_2545260 ) ) ( not ( = ?auto_2545257 ?auto_2545259 ) ) ( not ( = ?auto_2545257 ?auto_2545261 ) ) ( not ( = ?auto_2545257 ?auto_2545262 ) ) ( not ( = ?auto_2545257 ?auto_2545263 ) ) ( not ( = ?auto_2545257 ?auto_2545264 ) ) ( not ( = ?auto_2545254 ?auto_2545258 ) ) ( not ( = ?auto_2545254 ?auto_2545260 ) ) ( not ( = ?auto_2545254 ?auto_2545259 ) ) ( not ( = ?auto_2545254 ?auto_2545261 ) ) ( not ( = ?auto_2545254 ?auto_2545262 ) ) ( not ( = ?auto_2545254 ?auto_2545263 ) ) ( not ( = ?auto_2545254 ?auto_2545264 ) ) ( not ( = ?auto_2545258 ?auto_2545260 ) ) ( not ( = ?auto_2545258 ?auto_2545259 ) ) ( not ( = ?auto_2545258 ?auto_2545261 ) ) ( not ( = ?auto_2545258 ?auto_2545262 ) ) ( not ( = ?auto_2545258 ?auto_2545263 ) ) ( not ( = ?auto_2545258 ?auto_2545264 ) ) ( not ( = ?auto_2545260 ?auto_2545259 ) ) ( not ( = ?auto_2545260 ?auto_2545261 ) ) ( not ( = ?auto_2545260 ?auto_2545262 ) ) ( not ( = ?auto_2545260 ?auto_2545263 ) ) ( not ( = ?auto_2545260 ?auto_2545264 ) ) ( not ( = ?auto_2545259 ?auto_2545261 ) ) ( not ( = ?auto_2545259 ?auto_2545262 ) ) ( not ( = ?auto_2545259 ?auto_2545263 ) ) ( not ( = ?auto_2545259 ?auto_2545264 ) ) ( not ( = ?auto_2545261 ?auto_2545262 ) ) ( not ( = ?auto_2545261 ?auto_2545263 ) ) ( not ( = ?auto_2545261 ?auto_2545264 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2545262 ?auto_2545263 ?auto_2545264 )
      ( MAKE-10CRATE-VERIFY ?auto_2545255 ?auto_2545256 ?auto_2545257 ?auto_2545254 ?auto_2545258 ?auto_2545260 ?auto_2545259 ?auto_2545261 ?auto_2545262 ?auto_2545263 ?auto_2545264 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2545380 - SURFACE
      ?auto_2545381 - SURFACE
      ?auto_2545382 - SURFACE
      ?auto_2545379 - SURFACE
      ?auto_2545383 - SURFACE
      ?auto_2545385 - SURFACE
      ?auto_2545384 - SURFACE
      ?auto_2545386 - SURFACE
      ?auto_2545387 - SURFACE
      ?auto_2545388 - SURFACE
      ?auto_2545389 - SURFACE
    )
    :vars
    (
      ?auto_2545391 - HOIST
      ?auto_2545390 - PLACE
      ?auto_2545392 - TRUCK
      ?auto_2545393 - PLACE
      ?auto_2545394 - HOIST
      ?auto_2545395 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2545391 ?auto_2545390 ) ( SURFACE-AT ?auto_2545388 ?auto_2545390 ) ( CLEAR ?auto_2545388 ) ( IS-CRATE ?auto_2545389 ) ( not ( = ?auto_2545388 ?auto_2545389 ) ) ( AVAILABLE ?auto_2545391 ) ( ON ?auto_2545388 ?auto_2545387 ) ( not ( = ?auto_2545387 ?auto_2545388 ) ) ( not ( = ?auto_2545387 ?auto_2545389 ) ) ( TRUCK-AT ?auto_2545392 ?auto_2545393 ) ( not ( = ?auto_2545393 ?auto_2545390 ) ) ( HOIST-AT ?auto_2545394 ?auto_2545393 ) ( not ( = ?auto_2545391 ?auto_2545394 ) ) ( AVAILABLE ?auto_2545394 ) ( SURFACE-AT ?auto_2545389 ?auto_2545393 ) ( ON ?auto_2545389 ?auto_2545395 ) ( CLEAR ?auto_2545389 ) ( not ( = ?auto_2545388 ?auto_2545395 ) ) ( not ( = ?auto_2545389 ?auto_2545395 ) ) ( not ( = ?auto_2545387 ?auto_2545395 ) ) ( ON ?auto_2545381 ?auto_2545380 ) ( ON ?auto_2545382 ?auto_2545381 ) ( ON ?auto_2545379 ?auto_2545382 ) ( ON ?auto_2545383 ?auto_2545379 ) ( ON ?auto_2545385 ?auto_2545383 ) ( ON ?auto_2545384 ?auto_2545385 ) ( ON ?auto_2545386 ?auto_2545384 ) ( ON ?auto_2545387 ?auto_2545386 ) ( not ( = ?auto_2545380 ?auto_2545381 ) ) ( not ( = ?auto_2545380 ?auto_2545382 ) ) ( not ( = ?auto_2545380 ?auto_2545379 ) ) ( not ( = ?auto_2545380 ?auto_2545383 ) ) ( not ( = ?auto_2545380 ?auto_2545385 ) ) ( not ( = ?auto_2545380 ?auto_2545384 ) ) ( not ( = ?auto_2545380 ?auto_2545386 ) ) ( not ( = ?auto_2545380 ?auto_2545387 ) ) ( not ( = ?auto_2545380 ?auto_2545388 ) ) ( not ( = ?auto_2545380 ?auto_2545389 ) ) ( not ( = ?auto_2545380 ?auto_2545395 ) ) ( not ( = ?auto_2545381 ?auto_2545382 ) ) ( not ( = ?auto_2545381 ?auto_2545379 ) ) ( not ( = ?auto_2545381 ?auto_2545383 ) ) ( not ( = ?auto_2545381 ?auto_2545385 ) ) ( not ( = ?auto_2545381 ?auto_2545384 ) ) ( not ( = ?auto_2545381 ?auto_2545386 ) ) ( not ( = ?auto_2545381 ?auto_2545387 ) ) ( not ( = ?auto_2545381 ?auto_2545388 ) ) ( not ( = ?auto_2545381 ?auto_2545389 ) ) ( not ( = ?auto_2545381 ?auto_2545395 ) ) ( not ( = ?auto_2545382 ?auto_2545379 ) ) ( not ( = ?auto_2545382 ?auto_2545383 ) ) ( not ( = ?auto_2545382 ?auto_2545385 ) ) ( not ( = ?auto_2545382 ?auto_2545384 ) ) ( not ( = ?auto_2545382 ?auto_2545386 ) ) ( not ( = ?auto_2545382 ?auto_2545387 ) ) ( not ( = ?auto_2545382 ?auto_2545388 ) ) ( not ( = ?auto_2545382 ?auto_2545389 ) ) ( not ( = ?auto_2545382 ?auto_2545395 ) ) ( not ( = ?auto_2545379 ?auto_2545383 ) ) ( not ( = ?auto_2545379 ?auto_2545385 ) ) ( not ( = ?auto_2545379 ?auto_2545384 ) ) ( not ( = ?auto_2545379 ?auto_2545386 ) ) ( not ( = ?auto_2545379 ?auto_2545387 ) ) ( not ( = ?auto_2545379 ?auto_2545388 ) ) ( not ( = ?auto_2545379 ?auto_2545389 ) ) ( not ( = ?auto_2545379 ?auto_2545395 ) ) ( not ( = ?auto_2545383 ?auto_2545385 ) ) ( not ( = ?auto_2545383 ?auto_2545384 ) ) ( not ( = ?auto_2545383 ?auto_2545386 ) ) ( not ( = ?auto_2545383 ?auto_2545387 ) ) ( not ( = ?auto_2545383 ?auto_2545388 ) ) ( not ( = ?auto_2545383 ?auto_2545389 ) ) ( not ( = ?auto_2545383 ?auto_2545395 ) ) ( not ( = ?auto_2545385 ?auto_2545384 ) ) ( not ( = ?auto_2545385 ?auto_2545386 ) ) ( not ( = ?auto_2545385 ?auto_2545387 ) ) ( not ( = ?auto_2545385 ?auto_2545388 ) ) ( not ( = ?auto_2545385 ?auto_2545389 ) ) ( not ( = ?auto_2545385 ?auto_2545395 ) ) ( not ( = ?auto_2545384 ?auto_2545386 ) ) ( not ( = ?auto_2545384 ?auto_2545387 ) ) ( not ( = ?auto_2545384 ?auto_2545388 ) ) ( not ( = ?auto_2545384 ?auto_2545389 ) ) ( not ( = ?auto_2545384 ?auto_2545395 ) ) ( not ( = ?auto_2545386 ?auto_2545387 ) ) ( not ( = ?auto_2545386 ?auto_2545388 ) ) ( not ( = ?auto_2545386 ?auto_2545389 ) ) ( not ( = ?auto_2545386 ?auto_2545395 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2545387 ?auto_2545388 ?auto_2545389 )
      ( MAKE-10CRATE-VERIFY ?auto_2545380 ?auto_2545381 ?auto_2545382 ?auto_2545379 ?auto_2545383 ?auto_2545385 ?auto_2545384 ?auto_2545386 ?auto_2545387 ?auto_2545388 ?auto_2545389 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2545506 - SURFACE
      ?auto_2545507 - SURFACE
      ?auto_2545508 - SURFACE
      ?auto_2545505 - SURFACE
      ?auto_2545509 - SURFACE
      ?auto_2545511 - SURFACE
      ?auto_2545510 - SURFACE
      ?auto_2545512 - SURFACE
      ?auto_2545513 - SURFACE
      ?auto_2545514 - SURFACE
      ?auto_2545515 - SURFACE
    )
    :vars
    (
      ?auto_2545520 - HOIST
      ?auto_2545519 - PLACE
      ?auto_2545521 - PLACE
      ?auto_2545516 - HOIST
      ?auto_2545517 - SURFACE
      ?auto_2545518 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2545520 ?auto_2545519 ) ( SURFACE-AT ?auto_2545514 ?auto_2545519 ) ( CLEAR ?auto_2545514 ) ( IS-CRATE ?auto_2545515 ) ( not ( = ?auto_2545514 ?auto_2545515 ) ) ( AVAILABLE ?auto_2545520 ) ( ON ?auto_2545514 ?auto_2545513 ) ( not ( = ?auto_2545513 ?auto_2545514 ) ) ( not ( = ?auto_2545513 ?auto_2545515 ) ) ( not ( = ?auto_2545521 ?auto_2545519 ) ) ( HOIST-AT ?auto_2545516 ?auto_2545521 ) ( not ( = ?auto_2545520 ?auto_2545516 ) ) ( AVAILABLE ?auto_2545516 ) ( SURFACE-AT ?auto_2545515 ?auto_2545521 ) ( ON ?auto_2545515 ?auto_2545517 ) ( CLEAR ?auto_2545515 ) ( not ( = ?auto_2545514 ?auto_2545517 ) ) ( not ( = ?auto_2545515 ?auto_2545517 ) ) ( not ( = ?auto_2545513 ?auto_2545517 ) ) ( TRUCK-AT ?auto_2545518 ?auto_2545519 ) ( ON ?auto_2545507 ?auto_2545506 ) ( ON ?auto_2545508 ?auto_2545507 ) ( ON ?auto_2545505 ?auto_2545508 ) ( ON ?auto_2545509 ?auto_2545505 ) ( ON ?auto_2545511 ?auto_2545509 ) ( ON ?auto_2545510 ?auto_2545511 ) ( ON ?auto_2545512 ?auto_2545510 ) ( ON ?auto_2545513 ?auto_2545512 ) ( not ( = ?auto_2545506 ?auto_2545507 ) ) ( not ( = ?auto_2545506 ?auto_2545508 ) ) ( not ( = ?auto_2545506 ?auto_2545505 ) ) ( not ( = ?auto_2545506 ?auto_2545509 ) ) ( not ( = ?auto_2545506 ?auto_2545511 ) ) ( not ( = ?auto_2545506 ?auto_2545510 ) ) ( not ( = ?auto_2545506 ?auto_2545512 ) ) ( not ( = ?auto_2545506 ?auto_2545513 ) ) ( not ( = ?auto_2545506 ?auto_2545514 ) ) ( not ( = ?auto_2545506 ?auto_2545515 ) ) ( not ( = ?auto_2545506 ?auto_2545517 ) ) ( not ( = ?auto_2545507 ?auto_2545508 ) ) ( not ( = ?auto_2545507 ?auto_2545505 ) ) ( not ( = ?auto_2545507 ?auto_2545509 ) ) ( not ( = ?auto_2545507 ?auto_2545511 ) ) ( not ( = ?auto_2545507 ?auto_2545510 ) ) ( not ( = ?auto_2545507 ?auto_2545512 ) ) ( not ( = ?auto_2545507 ?auto_2545513 ) ) ( not ( = ?auto_2545507 ?auto_2545514 ) ) ( not ( = ?auto_2545507 ?auto_2545515 ) ) ( not ( = ?auto_2545507 ?auto_2545517 ) ) ( not ( = ?auto_2545508 ?auto_2545505 ) ) ( not ( = ?auto_2545508 ?auto_2545509 ) ) ( not ( = ?auto_2545508 ?auto_2545511 ) ) ( not ( = ?auto_2545508 ?auto_2545510 ) ) ( not ( = ?auto_2545508 ?auto_2545512 ) ) ( not ( = ?auto_2545508 ?auto_2545513 ) ) ( not ( = ?auto_2545508 ?auto_2545514 ) ) ( not ( = ?auto_2545508 ?auto_2545515 ) ) ( not ( = ?auto_2545508 ?auto_2545517 ) ) ( not ( = ?auto_2545505 ?auto_2545509 ) ) ( not ( = ?auto_2545505 ?auto_2545511 ) ) ( not ( = ?auto_2545505 ?auto_2545510 ) ) ( not ( = ?auto_2545505 ?auto_2545512 ) ) ( not ( = ?auto_2545505 ?auto_2545513 ) ) ( not ( = ?auto_2545505 ?auto_2545514 ) ) ( not ( = ?auto_2545505 ?auto_2545515 ) ) ( not ( = ?auto_2545505 ?auto_2545517 ) ) ( not ( = ?auto_2545509 ?auto_2545511 ) ) ( not ( = ?auto_2545509 ?auto_2545510 ) ) ( not ( = ?auto_2545509 ?auto_2545512 ) ) ( not ( = ?auto_2545509 ?auto_2545513 ) ) ( not ( = ?auto_2545509 ?auto_2545514 ) ) ( not ( = ?auto_2545509 ?auto_2545515 ) ) ( not ( = ?auto_2545509 ?auto_2545517 ) ) ( not ( = ?auto_2545511 ?auto_2545510 ) ) ( not ( = ?auto_2545511 ?auto_2545512 ) ) ( not ( = ?auto_2545511 ?auto_2545513 ) ) ( not ( = ?auto_2545511 ?auto_2545514 ) ) ( not ( = ?auto_2545511 ?auto_2545515 ) ) ( not ( = ?auto_2545511 ?auto_2545517 ) ) ( not ( = ?auto_2545510 ?auto_2545512 ) ) ( not ( = ?auto_2545510 ?auto_2545513 ) ) ( not ( = ?auto_2545510 ?auto_2545514 ) ) ( not ( = ?auto_2545510 ?auto_2545515 ) ) ( not ( = ?auto_2545510 ?auto_2545517 ) ) ( not ( = ?auto_2545512 ?auto_2545513 ) ) ( not ( = ?auto_2545512 ?auto_2545514 ) ) ( not ( = ?auto_2545512 ?auto_2545515 ) ) ( not ( = ?auto_2545512 ?auto_2545517 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2545513 ?auto_2545514 ?auto_2545515 )
      ( MAKE-10CRATE-VERIFY ?auto_2545506 ?auto_2545507 ?auto_2545508 ?auto_2545505 ?auto_2545509 ?auto_2545511 ?auto_2545510 ?auto_2545512 ?auto_2545513 ?auto_2545514 ?auto_2545515 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2545632 - SURFACE
      ?auto_2545633 - SURFACE
      ?auto_2545634 - SURFACE
      ?auto_2545631 - SURFACE
      ?auto_2545635 - SURFACE
      ?auto_2545637 - SURFACE
      ?auto_2545636 - SURFACE
      ?auto_2545638 - SURFACE
      ?auto_2545639 - SURFACE
      ?auto_2545640 - SURFACE
      ?auto_2545641 - SURFACE
    )
    :vars
    (
      ?auto_2545643 - HOIST
      ?auto_2545645 - PLACE
      ?auto_2545644 - PLACE
      ?auto_2545646 - HOIST
      ?auto_2545642 - SURFACE
      ?auto_2545647 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2545643 ?auto_2545645 ) ( IS-CRATE ?auto_2545641 ) ( not ( = ?auto_2545640 ?auto_2545641 ) ) ( not ( = ?auto_2545639 ?auto_2545640 ) ) ( not ( = ?auto_2545639 ?auto_2545641 ) ) ( not ( = ?auto_2545644 ?auto_2545645 ) ) ( HOIST-AT ?auto_2545646 ?auto_2545644 ) ( not ( = ?auto_2545643 ?auto_2545646 ) ) ( AVAILABLE ?auto_2545646 ) ( SURFACE-AT ?auto_2545641 ?auto_2545644 ) ( ON ?auto_2545641 ?auto_2545642 ) ( CLEAR ?auto_2545641 ) ( not ( = ?auto_2545640 ?auto_2545642 ) ) ( not ( = ?auto_2545641 ?auto_2545642 ) ) ( not ( = ?auto_2545639 ?auto_2545642 ) ) ( TRUCK-AT ?auto_2545647 ?auto_2545645 ) ( SURFACE-AT ?auto_2545639 ?auto_2545645 ) ( CLEAR ?auto_2545639 ) ( LIFTING ?auto_2545643 ?auto_2545640 ) ( IS-CRATE ?auto_2545640 ) ( ON ?auto_2545633 ?auto_2545632 ) ( ON ?auto_2545634 ?auto_2545633 ) ( ON ?auto_2545631 ?auto_2545634 ) ( ON ?auto_2545635 ?auto_2545631 ) ( ON ?auto_2545637 ?auto_2545635 ) ( ON ?auto_2545636 ?auto_2545637 ) ( ON ?auto_2545638 ?auto_2545636 ) ( ON ?auto_2545639 ?auto_2545638 ) ( not ( = ?auto_2545632 ?auto_2545633 ) ) ( not ( = ?auto_2545632 ?auto_2545634 ) ) ( not ( = ?auto_2545632 ?auto_2545631 ) ) ( not ( = ?auto_2545632 ?auto_2545635 ) ) ( not ( = ?auto_2545632 ?auto_2545637 ) ) ( not ( = ?auto_2545632 ?auto_2545636 ) ) ( not ( = ?auto_2545632 ?auto_2545638 ) ) ( not ( = ?auto_2545632 ?auto_2545639 ) ) ( not ( = ?auto_2545632 ?auto_2545640 ) ) ( not ( = ?auto_2545632 ?auto_2545641 ) ) ( not ( = ?auto_2545632 ?auto_2545642 ) ) ( not ( = ?auto_2545633 ?auto_2545634 ) ) ( not ( = ?auto_2545633 ?auto_2545631 ) ) ( not ( = ?auto_2545633 ?auto_2545635 ) ) ( not ( = ?auto_2545633 ?auto_2545637 ) ) ( not ( = ?auto_2545633 ?auto_2545636 ) ) ( not ( = ?auto_2545633 ?auto_2545638 ) ) ( not ( = ?auto_2545633 ?auto_2545639 ) ) ( not ( = ?auto_2545633 ?auto_2545640 ) ) ( not ( = ?auto_2545633 ?auto_2545641 ) ) ( not ( = ?auto_2545633 ?auto_2545642 ) ) ( not ( = ?auto_2545634 ?auto_2545631 ) ) ( not ( = ?auto_2545634 ?auto_2545635 ) ) ( not ( = ?auto_2545634 ?auto_2545637 ) ) ( not ( = ?auto_2545634 ?auto_2545636 ) ) ( not ( = ?auto_2545634 ?auto_2545638 ) ) ( not ( = ?auto_2545634 ?auto_2545639 ) ) ( not ( = ?auto_2545634 ?auto_2545640 ) ) ( not ( = ?auto_2545634 ?auto_2545641 ) ) ( not ( = ?auto_2545634 ?auto_2545642 ) ) ( not ( = ?auto_2545631 ?auto_2545635 ) ) ( not ( = ?auto_2545631 ?auto_2545637 ) ) ( not ( = ?auto_2545631 ?auto_2545636 ) ) ( not ( = ?auto_2545631 ?auto_2545638 ) ) ( not ( = ?auto_2545631 ?auto_2545639 ) ) ( not ( = ?auto_2545631 ?auto_2545640 ) ) ( not ( = ?auto_2545631 ?auto_2545641 ) ) ( not ( = ?auto_2545631 ?auto_2545642 ) ) ( not ( = ?auto_2545635 ?auto_2545637 ) ) ( not ( = ?auto_2545635 ?auto_2545636 ) ) ( not ( = ?auto_2545635 ?auto_2545638 ) ) ( not ( = ?auto_2545635 ?auto_2545639 ) ) ( not ( = ?auto_2545635 ?auto_2545640 ) ) ( not ( = ?auto_2545635 ?auto_2545641 ) ) ( not ( = ?auto_2545635 ?auto_2545642 ) ) ( not ( = ?auto_2545637 ?auto_2545636 ) ) ( not ( = ?auto_2545637 ?auto_2545638 ) ) ( not ( = ?auto_2545637 ?auto_2545639 ) ) ( not ( = ?auto_2545637 ?auto_2545640 ) ) ( not ( = ?auto_2545637 ?auto_2545641 ) ) ( not ( = ?auto_2545637 ?auto_2545642 ) ) ( not ( = ?auto_2545636 ?auto_2545638 ) ) ( not ( = ?auto_2545636 ?auto_2545639 ) ) ( not ( = ?auto_2545636 ?auto_2545640 ) ) ( not ( = ?auto_2545636 ?auto_2545641 ) ) ( not ( = ?auto_2545636 ?auto_2545642 ) ) ( not ( = ?auto_2545638 ?auto_2545639 ) ) ( not ( = ?auto_2545638 ?auto_2545640 ) ) ( not ( = ?auto_2545638 ?auto_2545641 ) ) ( not ( = ?auto_2545638 ?auto_2545642 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2545639 ?auto_2545640 ?auto_2545641 )
      ( MAKE-10CRATE-VERIFY ?auto_2545632 ?auto_2545633 ?auto_2545634 ?auto_2545631 ?auto_2545635 ?auto_2545637 ?auto_2545636 ?auto_2545638 ?auto_2545639 ?auto_2545640 ?auto_2545641 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2545758 - SURFACE
      ?auto_2545759 - SURFACE
      ?auto_2545760 - SURFACE
      ?auto_2545757 - SURFACE
      ?auto_2545761 - SURFACE
      ?auto_2545763 - SURFACE
      ?auto_2545762 - SURFACE
      ?auto_2545764 - SURFACE
      ?auto_2545765 - SURFACE
      ?auto_2545766 - SURFACE
      ?auto_2545767 - SURFACE
    )
    :vars
    (
      ?auto_2545773 - HOIST
      ?auto_2545768 - PLACE
      ?auto_2545769 - PLACE
      ?auto_2545772 - HOIST
      ?auto_2545771 - SURFACE
      ?auto_2545770 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2545773 ?auto_2545768 ) ( IS-CRATE ?auto_2545767 ) ( not ( = ?auto_2545766 ?auto_2545767 ) ) ( not ( = ?auto_2545765 ?auto_2545766 ) ) ( not ( = ?auto_2545765 ?auto_2545767 ) ) ( not ( = ?auto_2545769 ?auto_2545768 ) ) ( HOIST-AT ?auto_2545772 ?auto_2545769 ) ( not ( = ?auto_2545773 ?auto_2545772 ) ) ( AVAILABLE ?auto_2545772 ) ( SURFACE-AT ?auto_2545767 ?auto_2545769 ) ( ON ?auto_2545767 ?auto_2545771 ) ( CLEAR ?auto_2545767 ) ( not ( = ?auto_2545766 ?auto_2545771 ) ) ( not ( = ?auto_2545767 ?auto_2545771 ) ) ( not ( = ?auto_2545765 ?auto_2545771 ) ) ( TRUCK-AT ?auto_2545770 ?auto_2545768 ) ( SURFACE-AT ?auto_2545765 ?auto_2545768 ) ( CLEAR ?auto_2545765 ) ( IS-CRATE ?auto_2545766 ) ( AVAILABLE ?auto_2545773 ) ( IN ?auto_2545766 ?auto_2545770 ) ( ON ?auto_2545759 ?auto_2545758 ) ( ON ?auto_2545760 ?auto_2545759 ) ( ON ?auto_2545757 ?auto_2545760 ) ( ON ?auto_2545761 ?auto_2545757 ) ( ON ?auto_2545763 ?auto_2545761 ) ( ON ?auto_2545762 ?auto_2545763 ) ( ON ?auto_2545764 ?auto_2545762 ) ( ON ?auto_2545765 ?auto_2545764 ) ( not ( = ?auto_2545758 ?auto_2545759 ) ) ( not ( = ?auto_2545758 ?auto_2545760 ) ) ( not ( = ?auto_2545758 ?auto_2545757 ) ) ( not ( = ?auto_2545758 ?auto_2545761 ) ) ( not ( = ?auto_2545758 ?auto_2545763 ) ) ( not ( = ?auto_2545758 ?auto_2545762 ) ) ( not ( = ?auto_2545758 ?auto_2545764 ) ) ( not ( = ?auto_2545758 ?auto_2545765 ) ) ( not ( = ?auto_2545758 ?auto_2545766 ) ) ( not ( = ?auto_2545758 ?auto_2545767 ) ) ( not ( = ?auto_2545758 ?auto_2545771 ) ) ( not ( = ?auto_2545759 ?auto_2545760 ) ) ( not ( = ?auto_2545759 ?auto_2545757 ) ) ( not ( = ?auto_2545759 ?auto_2545761 ) ) ( not ( = ?auto_2545759 ?auto_2545763 ) ) ( not ( = ?auto_2545759 ?auto_2545762 ) ) ( not ( = ?auto_2545759 ?auto_2545764 ) ) ( not ( = ?auto_2545759 ?auto_2545765 ) ) ( not ( = ?auto_2545759 ?auto_2545766 ) ) ( not ( = ?auto_2545759 ?auto_2545767 ) ) ( not ( = ?auto_2545759 ?auto_2545771 ) ) ( not ( = ?auto_2545760 ?auto_2545757 ) ) ( not ( = ?auto_2545760 ?auto_2545761 ) ) ( not ( = ?auto_2545760 ?auto_2545763 ) ) ( not ( = ?auto_2545760 ?auto_2545762 ) ) ( not ( = ?auto_2545760 ?auto_2545764 ) ) ( not ( = ?auto_2545760 ?auto_2545765 ) ) ( not ( = ?auto_2545760 ?auto_2545766 ) ) ( not ( = ?auto_2545760 ?auto_2545767 ) ) ( not ( = ?auto_2545760 ?auto_2545771 ) ) ( not ( = ?auto_2545757 ?auto_2545761 ) ) ( not ( = ?auto_2545757 ?auto_2545763 ) ) ( not ( = ?auto_2545757 ?auto_2545762 ) ) ( not ( = ?auto_2545757 ?auto_2545764 ) ) ( not ( = ?auto_2545757 ?auto_2545765 ) ) ( not ( = ?auto_2545757 ?auto_2545766 ) ) ( not ( = ?auto_2545757 ?auto_2545767 ) ) ( not ( = ?auto_2545757 ?auto_2545771 ) ) ( not ( = ?auto_2545761 ?auto_2545763 ) ) ( not ( = ?auto_2545761 ?auto_2545762 ) ) ( not ( = ?auto_2545761 ?auto_2545764 ) ) ( not ( = ?auto_2545761 ?auto_2545765 ) ) ( not ( = ?auto_2545761 ?auto_2545766 ) ) ( not ( = ?auto_2545761 ?auto_2545767 ) ) ( not ( = ?auto_2545761 ?auto_2545771 ) ) ( not ( = ?auto_2545763 ?auto_2545762 ) ) ( not ( = ?auto_2545763 ?auto_2545764 ) ) ( not ( = ?auto_2545763 ?auto_2545765 ) ) ( not ( = ?auto_2545763 ?auto_2545766 ) ) ( not ( = ?auto_2545763 ?auto_2545767 ) ) ( not ( = ?auto_2545763 ?auto_2545771 ) ) ( not ( = ?auto_2545762 ?auto_2545764 ) ) ( not ( = ?auto_2545762 ?auto_2545765 ) ) ( not ( = ?auto_2545762 ?auto_2545766 ) ) ( not ( = ?auto_2545762 ?auto_2545767 ) ) ( not ( = ?auto_2545762 ?auto_2545771 ) ) ( not ( = ?auto_2545764 ?auto_2545765 ) ) ( not ( = ?auto_2545764 ?auto_2545766 ) ) ( not ( = ?auto_2545764 ?auto_2545767 ) ) ( not ( = ?auto_2545764 ?auto_2545771 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2545765 ?auto_2545766 ?auto_2545767 )
      ( MAKE-10CRATE-VERIFY ?auto_2545758 ?auto_2545759 ?auto_2545760 ?auto_2545757 ?auto_2545761 ?auto_2545763 ?auto_2545762 ?auto_2545764 ?auto_2545765 ?auto_2545766 ?auto_2545767 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2553019 - SURFACE
      ?auto_2553020 - SURFACE
      ?auto_2553021 - SURFACE
      ?auto_2553018 - SURFACE
      ?auto_2553022 - SURFACE
      ?auto_2553024 - SURFACE
      ?auto_2553023 - SURFACE
      ?auto_2553025 - SURFACE
      ?auto_2553026 - SURFACE
      ?auto_2553027 - SURFACE
      ?auto_2553028 - SURFACE
      ?auto_2553029 - SURFACE
    )
    :vars
    (
      ?auto_2553030 - HOIST
      ?auto_2553031 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2553030 ?auto_2553031 ) ( SURFACE-AT ?auto_2553028 ?auto_2553031 ) ( CLEAR ?auto_2553028 ) ( LIFTING ?auto_2553030 ?auto_2553029 ) ( IS-CRATE ?auto_2553029 ) ( not ( = ?auto_2553028 ?auto_2553029 ) ) ( ON ?auto_2553020 ?auto_2553019 ) ( ON ?auto_2553021 ?auto_2553020 ) ( ON ?auto_2553018 ?auto_2553021 ) ( ON ?auto_2553022 ?auto_2553018 ) ( ON ?auto_2553024 ?auto_2553022 ) ( ON ?auto_2553023 ?auto_2553024 ) ( ON ?auto_2553025 ?auto_2553023 ) ( ON ?auto_2553026 ?auto_2553025 ) ( ON ?auto_2553027 ?auto_2553026 ) ( ON ?auto_2553028 ?auto_2553027 ) ( not ( = ?auto_2553019 ?auto_2553020 ) ) ( not ( = ?auto_2553019 ?auto_2553021 ) ) ( not ( = ?auto_2553019 ?auto_2553018 ) ) ( not ( = ?auto_2553019 ?auto_2553022 ) ) ( not ( = ?auto_2553019 ?auto_2553024 ) ) ( not ( = ?auto_2553019 ?auto_2553023 ) ) ( not ( = ?auto_2553019 ?auto_2553025 ) ) ( not ( = ?auto_2553019 ?auto_2553026 ) ) ( not ( = ?auto_2553019 ?auto_2553027 ) ) ( not ( = ?auto_2553019 ?auto_2553028 ) ) ( not ( = ?auto_2553019 ?auto_2553029 ) ) ( not ( = ?auto_2553020 ?auto_2553021 ) ) ( not ( = ?auto_2553020 ?auto_2553018 ) ) ( not ( = ?auto_2553020 ?auto_2553022 ) ) ( not ( = ?auto_2553020 ?auto_2553024 ) ) ( not ( = ?auto_2553020 ?auto_2553023 ) ) ( not ( = ?auto_2553020 ?auto_2553025 ) ) ( not ( = ?auto_2553020 ?auto_2553026 ) ) ( not ( = ?auto_2553020 ?auto_2553027 ) ) ( not ( = ?auto_2553020 ?auto_2553028 ) ) ( not ( = ?auto_2553020 ?auto_2553029 ) ) ( not ( = ?auto_2553021 ?auto_2553018 ) ) ( not ( = ?auto_2553021 ?auto_2553022 ) ) ( not ( = ?auto_2553021 ?auto_2553024 ) ) ( not ( = ?auto_2553021 ?auto_2553023 ) ) ( not ( = ?auto_2553021 ?auto_2553025 ) ) ( not ( = ?auto_2553021 ?auto_2553026 ) ) ( not ( = ?auto_2553021 ?auto_2553027 ) ) ( not ( = ?auto_2553021 ?auto_2553028 ) ) ( not ( = ?auto_2553021 ?auto_2553029 ) ) ( not ( = ?auto_2553018 ?auto_2553022 ) ) ( not ( = ?auto_2553018 ?auto_2553024 ) ) ( not ( = ?auto_2553018 ?auto_2553023 ) ) ( not ( = ?auto_2553018 ?auto_2553025 ) ) ( not ( = ?auto_2553018 ?auto_2553026 ) ) ( not ( = ?auto_2553018 ?auto_2553027 ) ) ( not ( = ?auto_2553018 ?auto_2553028 ) ) ( not ( = ?auto_2553018 ?auto_2553029 ) ) ( not ( = ?auto_2553022 ?auto_2553024 ) ) ( not ( = ?auto_2553022 ?auto_2553023 ) ) ( not ( = ?auto_2553022 ?auto_2553025 ) ) ( not ( = ?auto_2553022 ?auto_2553026 ) ) ( not ( = ?auto_2553022 ?auto_2553027 ) ) ( not ( = ?auto_2553022 ?auto_2553028 ) ) ( not ( = ?auto_2553022 ?auto_2553029 ) ) ( not ( = ?auto_2553024 ?auto_2553023 ) ) ( not ( = ?auto_2553024 ?auto_2553025 ) ) ( not ( = ?auto_2553024 ?auto_2553026 ) ) ( not ( = ?auto_2553024 ?auto_2553027 ) ) ( not ( = ?auto_2553024 ?auto_2553028 ) ) ( not ( = ?auto_2553024 ?auto_2553029 ) ) ( not ( = ?auto_2553023 ?auto_2553025 ) ) ( not ( = ?auto_2553023 ?auto_2553026 ) ) ( not ( = ?auto_2553023 ?auto_2553027 ) ) ( not ( = ?auto_2553023 ?auto_2553028 ) ) ( not ( = ?auto_2553023 ?auto_2553029 ) ) ( not ( = ?auto_2553025 ?auto_2553026 ) ) ( not ( = ?auto_2553025 ?auto_2553027 ) ) ( not ( = ?auto_2553025 ?auto_2553028 ) ) ( not ( = ?auto_2553025 ?auto_2553029 ) ) ( not ( = ?auto_2553026 ?auto_2553027 ) ) ( not ( = ?auto_2553026 ?auto_2553028 ) ) ( not ( = ?auto_2553026 ?auto_2553029 ) ) ( not ( = ?auto_2553027 ?auto_2553028 ) ) ( not ( = ?auto_2553027 ?auto_2553029 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2553028 ?auto_2553029 )
      ( MAKE-11CRATE-VERIFY ?auto_2553019 ?auto_2553020 ?auto_2553021 ?auto_2553018 ?auto_2553022 ?auto_2553024 ?auto_2553023 ?auto_2553025 ?auto_2553026 ?auto_2553027 ?auto_2553028 ?auto_2553029 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2553128 - SURFACE
      ?auto_2553129 - SURFACE
      ?auto_2553130 - SURFACE
      ?auto_2553127 - SURFACE
      ?auto_2553131 - SURFACE
      ?auto_2553133 - SURFACE
      ?auto_2553132 - SURFACE
      ?auto_2553134 - SURFACE
      ?auto_2553135 - SURFACE
      ?auto_2553136 - SURFACE
      ?auto_2553137 - SURFACE
      ?auto_2553138 - SURFACE
    )
    :vars
    (
      ?auto_2553139 - HOIST
      ?auto_2553141 - PLACE
      ?auto_2553140 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2553139 ?auto_2553141 ) ( SURFACE-AT ?auto_2553137 ?auto_2553141 ) ( CLEAR ?auto_2553137 ) ( IS-CRATE ?auto_2553138 ) ( not ( = ?auto_2553137 ?auto_2553138 ) ) ( TRUCK-AT ?auto_2553140 ?auto_2553141 ) ( AVAILABLE ?auto_2553139 ) ( IN ?auto_2553138 ?auto_2553140 ) ( ON ?auto_2553137 ?auto_2553136 ) ( not ( = ?auto_2553136 ?auto_2553137 ) ) ( not ( = ?auto_2553136 ?auto_2553138 ) ) ( ON ?auto_2553129 ?auto_2553128 ) ( ON ?auto_2553130 ?auto_2553129 ) ( ON ?auto_2553127 ?auto_2553130 ) ( ON ?auto_2553131 ?auto_2553127 ) ( ON ?auto_2553133 ?auto_2553131 ) ( ON ?auto_2553132 ?auto_2553133 ) ( ON ?auto_2553134 ?auto_2553132 ) ( ON ?auto_2553135 ?auto_2553134 ) ( ON ?auto_2553136 ?auto_2553135 ) ( not ( = ?auto_2553128 ?auto_2553129 ) ) ( not ( = ?auto_2553128 ?auto_2553130 ) ) ( not ( = ?auto_2553128 ?auto_2553127 ) ) ( not ( = ?auto_2553128 ?auto_2553131 ) ) ( not ( = ?auto_2553128 ?auto_2553133 ) ) ( not ( = ?auto_2553128 ?auto_2553132 ) ) ( not ( = ?auto_2553128 ?auto_2553134 ) ) ( not ( = ?auto_2553128 ?auto_2553135 ) ) ( not ( = ?auto_2553128 ?auto_2553136 ) ) ( not ( = ?auto_2553128 ?auto_2553137 ) ) ( not ( = ?auto_2553128 ?auto_2553138 ) ) ( not ( = ?auto_2553129 ?auto_2553130 ) ) ( not ( = ?auto_2553129 ?auto_2553127 ) ) ( not ( = ?auto_2553129 ?auto_2553131 ) ) ( not ( = ?auto_2553129 ?auto_2553133 ) ) ( not ( = ?auto_2553129 ?auto_2553132 ) ) ( not ( = ?auto_2553129 ?auto_2553134 ) ) ( not ( = ?auto_2553129 ?auto_2553135 ) ) ( not ( = ?auto_2553129 ?auto_2553136 ) ) ( not ( = ?auto_2553129 ?auto_2553137 ) ) ( not ( = ?auto_2553129 ?auto_2553138 ) ) ( not ( = ?auto_2553130 ?auto_2553127 ) ) ( not ( = ?auto_2553130 ?auto_2553131 ) ) ( not ( = ?auto_2553130 ?auto_2553133 ) ) ( not ( = ?auto_2553130 ?auto_2553132 ) ) ( not ( = ?auto_2553130 ?auto_2553134 ) ) ( not ( = ?auto_2553130 ?auto_2553135 ) ) ( not ( = ?auto_2553130 ?auto_2553136 ) ) ( not ( = ?auto_2553130 ?auto_2553137 ) ) ( not ( = ?auto_2553130 ?auto_2553138 ) ) ( not ( = ?auto_2553127 ?auto_2553131 ) ) ( not ( = ?auto_2553127 ?auto_2553133 ) ) ( not ( = ?auto_2553127 ?auto_2553132 ) ) ( not ( = ?auto_2553127 ?auto_2553134 ) ) ( not ( = ?auto_2553127 ?auto_2553135 ) ) ( not ( = ?auto_2553127 ?auto_2553136 ) ) ( not ( = ?auto_2553127 ?auto_2553137 ) ) ( not ( = ?auto_2553127 ?auto_2553138 ) ) ( not ( = ?auto_2553131 ?auto_2553133 ) ) ( not ( = ?auto_2553131 ?auto_2553132 ) ) ( not ( = ?auto_2553131 ?auto_2553134 ) ) ( not ( = ?auto_2553131 ?auto_2553135 ) ) ( not ( = ?auto_2553131 ?auto_2553136 ) ) ( not ( = ?auto_2553131 ?auto_2553137 ) ) ( not ( = ?auto_2553131 ?auto_2553138 ) ) ( not ( = ?auto_2553133 ?auto_2553132 ) ) ( not ( = ?auto_2553133 ?auto_2553134 ) ) ( not ( = ?auto_2553133 ?auto_2553135 ) ) ( not ( = ?auto_2553133 ?auto_2553136 ) ) ( not ( = ?auto_2553133 ?auto_2553137 ) ) ( not ( = ?auto_2553133 ?auto_2553138 ) ) ( not ( = ?auto_2553132 ?auto_2553134 ) ) ( not ( = ?auto_2553132 ?auto_2553135 ) ) ( not ( = ?auto_2553132 ?auto_2553136 ) ) ( not ( = ?auto_2553132 ?auto_2553137 ) ) ( not ( = ?auto_2553132 ?auto_2553138 ) ) ( not ( = ?auto_2553134 ?auto_2553135 ) ) ( not ( = ?auto_2553134 ?auto_2553136 ) ) ( not ( = ?auto_2553134 ?auto_2553137 ) ) ( not ( = ?auto_2553134 ?auto_2553138 ) ) ( not ( = ?auto_2553135 ?auto_2553136 ) ) ( not ( = ?auto_2553135 ?auto_2553137 ) ) ( not ( = ?auto_2553135 ?auto_2553138 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2553136 ?auto_2553137 ?auto_2553138 )
      ( MAKE-11CRATE-VERIFY ?auto_2553128 ?auto_2553129 ?auto_2553130 ?auto_2553127 ?auto_2553131 ?auto_2553133 ?auto_2553132 ?auto_2553134 ?auto_2553135 ?auto_2553136 ?auto_2553137 ?auto_2553138 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2553249 - SURFACE
      ?auto_2553250 - SURFACE
      ?auto_2553251 - SURFACE
      ?auto_2553248 - SURFACE
      ?auto_2553252 - SURFACE
      ?auto_2553254 - SURFACE
      ?auto_2553253 - SURFACE
      ?auto_2553255 - SURFACE
      ?auto_2553256 - SURFACE
      ?auto_2553257 - SURFACE
      ?auto_2553258 - SURFACE
      ?auto_2553259 - SURFACE
    )
    :vars
    (
      ?auto_2553263 - HOIST
      ?auto_2553262 - PLACE
      ?auto_2553260 - TRUCK
      ?auto_2553261 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2553263 ?auto_2553262 ) ( SURFACE-AT ?auto_2553258 ?auto_2553262 ) ( CLEAR ?auto_2553258 ) ( IS-CRATE ?auto_2553259 ) ( not ( = ?auto_2553258 ?auto_2553259 ) ) ( AVAILABLE ?auto_2553263 ) ( IN ?auto_2553259 ?auto_2553260 ) ( ON ?auto_2553258 ?auto_2553257 ) ( not ( = ?auto_2553257 ?auto_2553258 ) ) ( not ( = ?auto_2553257 ?auto_2553259 ) ) ( TRUCK-AT ?auto_2553260 ?auto_2553261 ) ( not ( = ?auto_2553261 ?auto_2553262 ) ) ( ON ?auto_2553250 ?auto_2553249 ) ( ON ?auto_2553251 ?auto_2553250 ) ( ON ?auto_2553248 ?auto_2553251 ) ( ON ?auto_2553252 ?auto_2553248 ) ( ON ?auto_2553254 ?auto_2553252 ) ( ON ?auto_2553253 ?auto_2553254 ) ( ON ?auto_2553255 ?auto_2553253 ) ( ON ?auto_2553256 ?auto_2553255 ) ( ON ?auto_2553257 ?auto_2553256 ) ( not ( = ?auto_2553249 ?auto_2553250 ) ) ( not ( = ?auto_2553249 ?auto_2553251 ) ) ( not ( = ?auto_2553249 ?auto_2553248 ) ) ( not ( = ?auto_2553249 ?auto_2553252 ) ) ( not ( = ?auto_2553249 ?auto_2553254 ) ) ( not ( = ?auto_2553249 ?auto_2553253 ) ) ( not ( = ?auto_2553249 ?auto_2553255 ) ) ( not ( = ?auto_2553249 ?auto_2553256 ) ) ( not ( = ?auto_2553249 ?auto_2553257 ) ) ( not ( = ?auto_2553249 ?auto_2553258 ) ) ( not ( = ?auto_2553249 ?auto_2553259 ) ) ( not ( = ?auto_2553250 ?auto_2553251 ) ) ( not ( = ?auto_2553250 ?auto_2553248 ) ) ( not ( = ?auto_2553250 ?auto_2553252 ) ) ( not ( = ?auto_2553250 ?auto_2553254 ) ) ( not ( = ?auto_2553250 ?auto_2553253 ) ) ( not ( = ?auto_2553250 ?auto_2553255 ) ) ( not ( = ?auto_2553250 ?auto_2553256 ) ) ( not ( = ?auto_2553250 ?auto_2553257 ) ) ( not ( = ?auto_2553250 ?auto_2553258 ) ) ( not ( = ?auto_2553250 ?auto_2553259 ) ) ( not ( = ?auto_2553251 ?auto_2553248 ) ) ( not ( = ?auto_2553251 ?auto_2553252 ) ) ( not ( = ?auto_2553251 ?auto_2553254 ) ) ( not ( = ?auto_2553251 ?auto_2553253 ) ) ( not ( = ?auto_2553251 ?auto_2553255 ) ) ( not ( = ?auto_2553251 ?auto_2553256 ) ) ( not ( = ?auto_2553251 ?auto_2553257 ) ) ( not ( = ?auto_2553251 ?auto_2553258 ) ) ( not ( = ?auto_2553251 ?auto_2553259 ) ) ( not ( = ?auto_2553248 ?auto_2553252 ) ) ( not ( = ?auto_2553248 ?auto_2553254 ) ) ( not ( = ?auto_2553248 ?auto_2553253 ) ) ( not ( = ?auto_2553248 ?auto_2553255 ) ) ( not ( = ?auto_2553248 ?auto_2553256 ) ) ( not ( = ?auto_2553248 ?auto_2553257 ) ) ( not ( = ?auto_2553248 ?auto_2553258 ) ) ( not ( = ?auto_2553248 ?auto_2553259 ) ) ( not ( = ?auto_2553252 ?auto_2553254 ) ) ( not ( = ?auto_2553252 ?auto_2553253 ) ) ( not ( = ?auto_2553252 ?auto_2553255 ) ) ( not ( = ?auto_2553252 ?auto_2553256 ) ) ( not ( = ?auto_2553252 ?auto_2553257 ) ) ( not ( = ?auto_2553252 ?auto_2553258 ) ) ( not ( = ?auto_2553252 ?auto_2553259 ) ) ( not ( = ?auto_2553254 ?auto_2553253 ) ) ( not ( = ?auto_2553254 ?auto_2553255 ) ) ( not ( = ?auto_2553254 ?auto_2553256 ) ) ( not ( = ?auto_2553254 ?auto_2553257 ) ) ( not ( = ?auto_2553254 ?auto_2553258 ) ) ( not ( = ?auto_2553254 ?auto_2553259 ) ) ( not ( = ?auto_2553253 ?auto_2553255 ) ) ( not ( = ?auto_2553253 ?auto_2553256 ) ) ( not ( = ?auto_2553253 ?auto_2553257 ) ) ( not ( = ?auto_2553253 ?auto_2553258 ) ) ( not ( = ?auto_2553253 ?auto_2553259 ) ) ( not ( = ?auto_2553255 ?auto_2553256 ) ) ( not ( = ?auto_2553255 ?auto_2553257 ) ) ( not ( = ?auto_2553255 ?auto_2553258 ) ) ( not ( = ?auto_2553255 ?auto_2553259 ) ) ( not ( = ?auto_2553256 ?auto_2553257 ) ) ( not ( = ?auto_2553256 ?auto_2553258 ) ) ( not ( = ?auto_2553256 ?auto_2553259 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2553257 ?auto_2553258 ?auto_2553259 )
      ( MAKE-11CRATE-VERIFY ?auto_2553249 ?auto_2553250 ?auto_2553251 ?auto_2553248 ?auto_2553252 ?auto_2553254 ?auto_2553253 ?auto_2553255 ?auto_2553256 ?auto_2553257 ?auto_2553258 ?auto_2553259 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2553381 - SURFACE
      ?auto_2553382 - SURFACE
      ?auto_2553383 - SURFACE
      ?auto_2553380 - SURFACE
      ?auto_2553384 - SURFACE
      ?auto_2553386 - SURFACE
      ?auto_2553385 - SURFACE
      ?auto_2553387 - SURFACE
      ?auto_2553388 - SURFACE
      ?auto_2553389 - SURFACE
      ?auto_2553390 - SURFACE
      ?auto_2553391 - SURFACE
    )
    :vars
    (
      ?auto_2553393 - HOIST
      ?auto_2553392 - PLACE
      ?auto_2553395 - TRUCK
      ?auto_2553396 - PLACE
      ?auto_2553394 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2553393 ?auto_2553392 ) ( SURFACE-AT ?auto_2553390 ?auto_2553392 ) ( CLEAR ?auto_2553390 ) ( IS-CRATE ?auto_2553391 ) ( not ( = ?auto_2553390 ?auto_2553391 ) ) ( AVAILABLE ?auto_2553393 ) ( ON ?auto_2553390 ?auto_2553389 ) ( not ( = ?auto_2553389 ?auto_2553390 ) ) ( not ( = ?auto_2553389 ?auto_2553391 ) ) ( TRUCK-AT ?auto_2553395 ?auto_2553396 ) ( not ( = ?auto_2553396 ?auto_2553392 ) ) ( HOIST-AT ?auto_2553394 ?auto_2553396 ) ( LIFTING ?auto_2553394 ?auto_2553391 ) ( not ( = ?auto_2553393 ?auto_2553394 ) ) ( ON ?auto_2553382 ?auto_2553381 ) ( ON ?auto_2553383 ?auto_2553382 ) ( ON ?auto_2553380 ?auto_2553383 ) ( ON ?auto_2553384 ?auto_2553380 ) ( ON ?auto_2553386 ?auto_2553384 ) ( ON ?auto_2553385 ?auto_2553386 ) ( ON ?auto_2553387 ?auto_2553385 ) ( ON ?auto_2553388 ?auto_2553387 ) ( ON ?auto_2553389 ?auto_2553388 ) ( not ( = ?auto_2553381 ?auto_2553382 ) ) ( not ( = ?auto_2553381 ?auto_2553383 ) ) ( not ( = ?auto_2553381 ?auto_2553380 ) ) ( not ( = ?auto_2553381 ?auto_2553384 ) ) ( not ( = ?auto_2553381 ?auto_2553386 ) ) ( not ( = ?auto_2553381 ?auto_2553385 ) ) ( not ( = ?auto_2553381 ?auto_2553387 ) ) ( not ( = ?auto_2553381 ?auto_2553388 ) ) ( not ( = ?auto_2553381 ?auto_2553389 ) ) ( not ( = ?auto_2553381 ?auto_2553390 ) ) ( not ( = ?auto_2553381 ?auto_2553391 ) ) ( not ( = ?auto_2553382 ?auto_2553383 ) ) ( not ( = ?auto_2553382 ?auto_2553380 ) ) ( not ( = ?auto_2553382 ?auto_2553384 ) ) ( not ( = ?auto_2553382 ?auto_2553386 ) ) ( not ( = ?auto_2553382 ?auto_2553385 ) ) ( not ( = ?auto_2553382 ?auto_2553387 ) ) ( not ( = ?auto_2553382 ?auto_2553388 ) ) ( not ( = ?auto_2553382 ?auto_2553389 ) ) ( not ( = ?auto_2553382 ?auto_2553390 ) ) ( not ( = ?auto_2553382 ?auto_2553391 ) ) ( not ( = ?auto_2553383 ?auto_2553380 ) ) ( not ( = ?auto_2553383 ?auto_2553384 ) ) ( not ( = ?auto_2553383 ?auto_2553386 ) ) ( not ( = ?auto_2553383 ?auto_2553385 ) ) ( not ( = ?auto_2553383 ?auto_2553387 ) ) ( not ( = ?auto_2553383 ?auto_2553388 ) ) ( not ( = ?auto_2553383 ?auto_2553389 ) ) ( not ( = ?auto_2553383 ?auto_2553390 ) ) ( not ( = ?auto_2553383 ?auto_2553391 ) ) ( not ( = ?auto_2553380 ?auto_2553384 ) ) ( not ( = ?auto_2553380 ?auto_2553386 ) ) ( not ( = ?auto_2553380 ?auto_2553385 ) ) ( not ( = ?auto_2553380 ?auto_2553387 ) ) ( not ( = ?auto_2553380 ?auto_2553388 ) ) ( not ( = ?auto_2553380 ?auto_2553389 ) ) ( not ( = ?auto_2553380 ?auto_2553390 ) ) ( not ( = ?auto_2553380 ?auto_2553391 ) ) ( not ( = ?auto_2553384 ?auto_2553386 ) ) ( not ( = ?auto_2553384 ?auto_2553385 ) ) ( not ( = ?auto_2553384 ?auto_2553387 ) ) ( not ( = ?auto_2553384 ?auto_2553388 ) ) ( not ( = ?auto_2553384 ?auto_2553389 ) ) ( not ( = ?auto_2553384 ?auto_2553390 ) ) ( not ( = ?auto_2553384 ?auto_2553391 ) ) ( not ( = ?auto_2553386 ?auto_2553385 ) ) ( not ( = ?auto_2553386 ?auto_2553387 ) ) ( not ( = ?auto_2553386 ?auto_2553388 ) ) ( not ( = ?auto_2553386 ?auto_2553389 ) ) ( not ( = ?auto_2553386 ?auto_2553390 ) ) ( not ( = ?auto_2553386 ?auto_2553391 ) ) ( not ( = ?auto_2553385 ?auto_2553387 ) ) ( not ( = ?auto_2553385 ?auto_2553388 ) ) ( not ( = ?auto_2553385 ?auto_2553389 ) ) ( not ( = ?auto_2553385 ?auto_2553390 ) ) ( not ( = ?auto_2553385 ?auto_2553391 ) ) ( not ( = ?auto_2553387 ?auto_2553388 ) ) ( not ( = ?auto_2553387 ?auto_2553389 ) ) ( not ( = ?auto_2553387 ?auto_2553390 ) ) ( not ( = ?auto_2553387 ?auto_2553391 ) ) ( not ( = ?auto_2553388 ?auto_2553389 ) ) ( not ( = ?auto_2553388 ?auto_2553390 ) ) ( not ( = ?auto_2553388 ?auto_2553391 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2553389 ?auto_2553390 ?auto_2553391 )
      ( MAKE-11CRATE-VERIFY ?auto_2553381 ?auto_2553382 ?auto_2553383 ?auto_2553380 ?auto_2553384 ?auto_2553386 ?auto_2553385 ?auto_2553387 ?auto_2553388 ?auto_2553389 ?auto_2553390 ?auto_2553391 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2553524 - SURFACE
      ?auto_2553525 - SURFACE
      ?auto_2553526 - SURFACE
      ?auto_2553523 - SURFACE
      ?auto_2553527 - SURFACE
      ?auto_2553529 - SURFACE
      ?auto_2553528 - SURFACE
      ?auto_2553530 - SURFACE
      ?auto_2553531 - SURFACE
      ?auto_2553532 - SURFACE
      ?auto_2553533 - SURFACE
      ?auto_2553534 - SURFACE
    )
    :vars
    (
      ?auto_2553538 - HOIST
      ?auto_2553535 - PLACE
      ?auto_2553539 - TRUCK
      ?auto_2553536 - PLACE
      ?auto_2553537 - HOIST
      ?auto_2553540 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2553538 ?auto_2553535 ) ( SURFACE-AT ?auto_2553533 ?auto_2553535 ) ( CLEAR ?auto_2553533 ) ( IS-CRATE ?auto_2553534 ) ( not ( = ?auto_2553533 ?auto_2553534 ) ) ( AVAILABLE ?auto_2553538 ) ( ON ?auto_2553533 ?auto_2553532 ) ( not ( = ?auto_2553532 ?auto_2553533 ) ) ( not ( = ?auto_2553532 ?auto_2553534 ) ) ( TRUCK-AT ?auto_2553539 ?auto_2553536 ) ( not ( = ?auto_2553536 ?auto_2553535 ) ) ( HOIST-AT ?auto_2553537 ?auto_2553536 ) ( not ( = ?auto_2553538 ?auto_2553537 ) ) ( AVAILABLE ?auto_2553537 ) ( SURFACE-AT ?auto_2553534 ?auto_2553536 ) ( ON ?auto_2553534 ?auto_2553540 ) ( CLEAR ?auto_2553534 ) ( not ( = ?auto_2553533 ?auto_2553540 ) ) ( not ( = ?auto_2553534 ?auto_2553540 ) ) ( not ( = ?auto_2553532 ?auto_2553540 ) ) ( ON ?auto_2553525 ?auto_2553524 ) ( ON ?auto_2553526 ?auto_2553525 ) ( ON ?auto_2553523 ?auto_2553526 ) ( ON ?auto_2553527 ?auto_2553523 ) ( ON ?auto_2553529 ?auto_2553527 ) ( ON ?auto_2553528 ?auto_2553529 ) ( ON ?auto_2553530 ?auto_2553528 ) ( ON ?auto_2553531 ?auto_2553530 ) ( ON ?auto_2553532 ?auto_2553531 ) ( not ( = ?auto_2553524 ?auto_2553525 ) ) ( not ( = ?auto_2553524 ?auto_2553526 ) ) ( not ( = ?auto_2553524 ?auto_2553523 ) ) ( not ( = ?auto_2553524 ?auto_2553527 ) ) ( not ( = ?auto_2553524 ?auto_2553529 ) ) ( not ( = ?auto_2553524 ?auto_2553528 ) ) ( not ( = ?auto_2553524 ?auto_2553530 ) ) ( not ( = ?auto_2553524 ?auto_2553531 ) ) ( not ( = ?auto_2553524 ?auto_2553532 ) ) ( not ( = ?auto_2553524 ?auto_2553533 ) ) ( not ( = ?auto_2553524 ?auto_2553534 ) ) ( not ( = ?auto_2553524 ?auto_2553540 ) ) ( not ( = ?auto_2553525 ?auto_2553526 ) ) ( not ( = ?auto_2553525 ?auto_2553523 ) ) ( not ( = ?auto_2553525 ?auto_2553527 ) ) ( not ( = ?auto_2553525 ?auto_2553529 ) ) ( not ( = ?auto_2553525 ?auto_2553528 ) ) ( not ( = ?auto_2553525 ?auto_2553530 ) ) ( not ( = ?auto_2553525 ?auto_2553531 ) ) ( not ( = ?auto_2553525 ?auto_2553532 ) ) ( not ( = ?auto_2553525 ?auto_2553533 ) ) ( not ( = ?auto_2553525 ?auto_2553534 ) ) ( not ( = ?auto_2553525 ?auto_2553540 ) ) ( not ( = ?auto_2553526 ?auto_2553523 ) ) ( not ( = ?auto_2553526 ?auto_2553527 ) ) ( not ( = ?auto_2553526 ?auto_2553529 ) ) ( not ( = ?auto_2553526 ?auto_2553528 ) ) ( not ( = ?auto_2553526 ?auto_2553530 ) ) ( not ( = ?auto_2553526 ?auto_2553531 ) ) ( not ( = ?auto_2553526 ?auto_2553532 ) ) ( not ( = ?auto_2553526 ?auto_2553533 ) ) ( not ( = ?auto_2553526 ?auto_2553534 ) ) ( not ( = ?auto_2553526 ?auto_2553540 ) ) ( not ( = ?auto_2553523 ?auto_2553527 ) ) ( not ( = ?auto_2553523 ?auto_2553529 ) ) ( not ( = ?auto_2553523 ?auto_2553528 ) ) ( not ( = ?auto_2553523 ?auto_2553530 ) ) ( not ( = ?auto_2553523 ?auto_2553531 ) ) ( not ( = ?auto_2553523 ?auto_2553532 ) ) ( not ( = ?auto_2553523 ?auto_2553533 ) ) ( not ( = ?auto_2553523 ?auto_2553534 ) ) ( not ( = ?auto_2553523 ?auto_2553540 ) ) ( not ( = ?auto_2553527 ?auto_2553529 ) ) ( not ( = ?auto_2553527 ?auto_2553528 ) ) ( not ( = ?auto_2553527 ?auto_2553530 ) ) ( not ( = ?auto_2553527 ?auto_2553531 ) ) ( not ( = ?auto_2553527 ?auto_2553532 ) ) ( not ( = ?auto_2553527 ?auto_2553533 ) ) ( not ( = ?auto_2553527 ?auto_2553534 ) ) ( not ( = ?auto_2553527 ?auto_2553540 ) ) ( not ( = ?auto_2553529 ?auto_2553528 ) ) ( not ( = ?auto_2553529 ?auto_2553530 ) ) ( not ( = ?auto_2553529 ?auto_2553531 ) ) ( not ( = ?auto_2553529 ?auto_2553532 ) ) ( not ( = ?auto_2553529 ?auto_2553533 ) ) ( not ( = ?auto_2553529 ?auto_2553534 ) ) ( not ( = ?auto_2553529 ?auto_2553540 ) ) ( not ( = ?auto_2553528 ?auto_2553530 ) ) ( not ( = ?auto_2553528 ?auto_2553531 ) ) ( not ( = ?auto_2553528 ?auto_2553532 ) ) ( not ( = ?auto_2553528 ?auto_2553533 ) ) ( not ( = ?auto_2553528 ?auto_2553534 ) ) ( not ( = ?auto_2553528 ?auto_2553540 ) ) ( not ( = ?auto_2553530 ?auto_2553531 ) ) ( not ( = ?auto_2553530 ?auto_2553532 ) ) ( not ( = ?auto_2553530 ?auto_2553533 ) ) ( not ( = ?auto_2553530 ?auto_2553534 ) ) ( not ( = ?auto_2553530 ?auto_2553540 ) ) ( not ( = ?auto_2553531 ?auto_2553532 ) ) ( not ( = ?auto_2553531 ?auto_2553533 ) ) ( not ( = ?auto_2553531 ?auto_2553534 ) ) ( not ( = ?auto_2553531 ?auto_2553540 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2553532 ?auto_2553533 ?auto_2553534 )
      ( MAKE-11CRATE-VERIFY ?auto_2553524 ?auto_2553525 ?auto_2553526 ?auto_2553523 ?auto_2553527 ?auto_2553529 ?auto_2553528 ?auto_2553530 ?auto_2553531 ?auto_2553532 ?auto_2553533 ?auto_2553534 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2553668 - SURFACE
      ?auto_2553669 - SURFACE
      ?auto_2553670 - SURFACE
      ?auto_2553667 - SURFACE
      ?auto_2553671 - SURFACE
      ?auto_2553673 - SURFACE
      ?auto_2553672 - SURFACE
      ?auto_2553674 - SURFACE
      ?auto_2553675 - SURFACE
      ?auto_2553676 - SURFACE
      ?auto_2553677 - SURFACE
      ?auto_2553678 - SURFACE
    )
    :vars
    (
      ?auto_2553679 - HOIST
      ?auto_2553680 - PLACE
      ?auto_2553682 - PLACE
      ?auto_2553683 - HOIST
      ?auto_2553681 - SURFACE
      ?auto_2553684 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2553679 ?auto_2553680 ) ( SURFACE-AT ?auto_2553677 ?auto_2553680 ) ( CLEAR ?auto_2553677 ) ( IS-CRATE ?auto_2553678 ) ( not ( = ?auto_2553677 ?auto_2553678 ) ) ( AVAILABLE ?auto_2553679 ) ( ON ?auto_2553677 ?auto_2553676 ) ( not ( = ?auto_2553676 ?auto_2553677 ) ) ( not ( = ?auto_2553676 ?auto_2553678 ) ) ( not ( = ?auto_2553682 ?auto_2553680 ) ) ( HOIST-AT ?auto_2553683 ?auto_2553682 ) ( not ( = ?auto_2553679 ?auto_2553683 ) ) ( AVAILABLE ?auto_2553683 ) ( SURFACE-AT ?auto_2553678 ?auto_2553682 ) ( ON ?auto_2553678 ?auto_2553681 ) ( CLEAR ?auto_2553678 ) ( not ( = ?auto_2553677 ?auto_2553681 ) ) ( not ( = ?auto_2553678 ?auto_2553681 ) ) ( not ( = ?auto_2553676 ?auto_2553681 ) ) ( TRUCK-AT ?auto_2553684 ?auto_2553680 ) ( ON ?auto_2553669 ?auto_2553668 ) ( ON ?auto_2553670 ?auto_2553669 ) ( ON ?auto_2553667 ?auto_2553670 ) ( ON ?auto_2553671 ?auto_2553667 ) ( ON ?auto_2553673 ?auto_2553671 ) ( ON ?auto_2553672 ?auto_2553673 ) ( ON ?auto_2553674 ?auto_2553672 ) ( ON ?auto_2553675 ?auto_2553674 ) ( ON ?auto_2553676 ?auto_2553675 ) ( not ( = ?auto_2553668 ?auto_2553669 ) ) ( not ( = ?auto_2553668 ?auto_2553670 ) ) ( not ( = ?auto_2553668 ?auto_2553667 ) ) ( not ( = ?auto_2553668 ?auto_2553671 ) ) ( not ( = ?auto_2553668 ?auto_2553673 ) ) ( not ( = ?auto_2553668 ?auto_2553672 ) ) ( not ( = ?auto_2553668 ?auto_2553674 ) ) ( not ( = ?auto_2553668 ?auto_2553675 ) ) ( not ( = ?auto_2553668 ?auto_2553676 ) ) ( not ( = ?auto_2553668 ?auto_2553677 ) ) ( not ( = ?auto_2553668 ?auto_2553678 ) ) ( not ( = ?auto_2553668 ?auto_2553681 ) ) ( not ( = ?auto_2553669 ?auto_2553670 ) ) ( not ( = ?auto_2553669 ?auto_2553667 ) ) ( not ( = ?auto_2553669 ?auto_2553671 ) ) ( not ( = ?auto_2553669 ?auto_2553673 ) ) ( not ( = ?auto_2553669 ?auto_2553672 ) ) ( not ( = ?auto_2553669 ?auto_2553674 ) ) ( not ( = ?auto_2553669 ?auto_2553675 ) ) ( not ( = ?auto_2553669 ?auto_2553676 ) ) ( not ( = ?auto_2553669 ?auto_2553677 ) ) ( not ( = ?auto_2553669 ?auto_2553678 ) ) ( not ( = ?auto_2553669 ?auto_2553681 ) ) ( not ( = ?auto_2553670 ?auto_2553667 ) ) ( not ( = ?auto_2553670 ?auto_2553671 ) ) ( not ( = ?auto_2553670 ?auto_2553673 ) ) ( not ( = ?auto_2553670 ?auto_2553672 ) ) ( not ( = ?auto_2553670 ?auto_2553674 ) ) ( not ( = ?auto_2553670 ?auto_2553675 ) ) ( not ( = ?auto_2553670 ?auto_2553676 ) ) ( not ( = ?auto_2553670 ?auto_2553677 ) ) ( not ( = ?auto_2553670 ?auto_2553678 ) ) ( not ( = ?auto_2553670 ?auto_2553681 ) ) ( not ( = ?auto_2553667 ?auto_2553671 ) ) ( not ( = ?auto_2553667 ?auto_2553673 ) ) ( not ( = ?auto_2553667 ?auto_2553672 ) ) ( not ( = ?auto_2553667 ?auto_2553674 ) ) ( not ( = ?auto_2553667 ?auto_2553675 ) ) ( not ( = ?auto_2553667 ?auto_2553676 ) ) ( not ( = ?auto_2553667 ?auto_2553677 ) ) ( not ( = ?auto_2553667 ?auto_2553678 ) ) ( not ( = ?auto_2553667 ?auto_2553681 ) ) ( not ( = ?auto_2553671 ?auto_2553673 ) ) ( not ( = ?auto_2553671 ?auto_2553672 ) ) ( not ( = ?auto_2553671 ?auto_2553674 ) ) ( not ( = ?auto_2553671 ?auto_2553675 ) ) ( not ( = ?auto_2553671 ?auto_2553676 ) ) ( not ( = ?auto_2553671 ?auto_2553677 ) ) ( not ( = ?auto_2553671 ?auto_2553678 ) ) ( not ( = ?auto_2553671 ?auto_2553681 ) ) ( not ( = ?auto_2553673 ?auto_2553672 ) ) ( not ( = ?auto_2553673 ?auto_2553674 ) ) ( not ( = ?auto_2553673 ?auto_2553675 ) ) ( not ( = ?auto_2553673 ?auto_2553676 ) ) ( not ( = ?auto_2553673 ?auto_2553677 ) ) ( not ( = ?auto_2553673 ?auto_2553678 ) ) ( not ( = ?auto_2553673 ?auto_2553681 ) ) ( not ( = ?auto_2553672 ?auto_2553674 ) ) ( not ( = ?auto_2553672 ?auto_2553675 ) ) ( not ( = ?auto_2553672 ?auto_2553676 ) ) ( not ( = ?auto_2553672 ?auto_2553677 ) ) ( not ( = ?auto_2553672 ?auto_2553678 ) ) ( not ( = ?auto_2553672 ?auto_2553681 ) ) ( not ( = ?auto_2553674 ?auto_2553675 ) ) ( not ( = ?auto_2553674 ?auto_2553676 ) ) ( not ( = ?auto_2553674 ?auto_2553677 ) ) ( not ( = ?auto_2553674 ?auto_2553678 ) ) ( not ( = ?auto_2553674 ?auto_2553681 ) ) ( not ( = ?auto_2553675 ?auto_2553676 ) ) ( not ( = ?auto_2553675 ?auto_2553677 ) ) ( not ( = ?auto_2553675 ?auto_2553678 ) ) ( not ( = ?auto_2553675 ?auto_2553681 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2553676 ?auto_2553677 ?auto_2553678 )
      ( MAKE-11CRATE-VERIFY ?auto_2553668 ?auto_2553669 ?auto_2553670 ?auto_2553667 ?auto_2553671 ?auto_2553673 ?auto_2553672 ?auto_2553674 ?auto_2553675 ?auto_2553676 ?auto_2553677 ?auto_2553678 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2553812 - SURFACE
      ?auto_2553813 - SURFACE
      ?auto_2553814 - SURFACE
      ?auto_2553811 - SURFACE
      ?auto_2553815 - SURFACE
      ?auto_2553817 - SURFACE
      ?auto_2553816 - SURFACE
      ?auto_2553818 - SURFACE
      ?auto_2553819 - SURFACE
      ?auto_2553820 - SURFACE
      ?auto_2553821 - SURFACE
      ?auto_2553822 - SURFACE
    )
    :vars
    (
      ?auto_2553828 - HOIST
      ?auto_2553827 - PLACE
      ?auto_2553824 - PLACE
      ?auto_2553825 - HOIST
      ?auto_2553826 - SURFACE
      ?auto_2553823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2553828 ?auto_2553827 ) ( IS-CRATE ?auto_2553822 ) ( not ( = ?auto_2553821 ?auto_2553822 ) ) ( not ( = ?auto_2553820 ?auto_2553821 ) ) ( not ( = ?auto_2553820 ?auto_2553822 ) ) ( not ( = ?auto_2553824 ?auto_2553827 ) ) ( HOIST-AT ?auto_2553825 ?auto_2553824 ) ( not ( = ?auto_2553828 ?auto_2553825 ) ) ( AVAILABLE ?auto_2553825 ) ( SURFACE-AT ?auto_2553822 ?auto_2553824 ) ( ON ?auto_2553822 ?auto_2553826 ) ( CLEAR ?auto_2553822 ) ( not ( = ?auto_2553821 ?auto_2553826 ) ) ( not ( = ?auto_2553822 ?auto_2553826 ) ) ( not ( = ?auto_2553820 ?auto_2553826 ) ) ( TRUCK-AT ?auto_2553823 ?auto_2553827 ) ( SURFACE-AT ?auto_2553820 ?auto_2553827 ) ( CLEAR ?auto_2553820 ) ( LIFTING ?auto_2553828 ?auto_2553821 ) ( IS-CRATE ?auto_2553821 ) ( ON ?auto_2553813 ?auto_2553812 ) ( ON ?auto_2553814 ?auto_2553813 ) ( ON ?auto_2553811 ?auto_2553814 ) ( ON ?auto_2553815 ?auto_2553811 ) ( ON ?auto_2553817 ?auto_2553815 ) ( ON ?auto_2553816 ?auto_2553817 ) ( ON ?auto_2553818 ?auto_2553816 ) ( ON ?auto_2553819 ?auto_2553818 ) ( ON ?auto_2553820 ?auto_2553819 ) ( not ( = ?auto_2553812 ?auto_2553813 ) ) ( not ( = ?auto_2553812 ?auto_2553814 ) ) ( not ( = ?auto_2553812 ?auto_2553811 ) ) ( not ( = ?auto_2553812 ?auto_2553815 ) ) ( not ( = ?auto_2553812 ?auto_2553817 ) ) ( not ( = ?auto_2553812 ?auto_2553816 ) ) ( not ( = ?auto_2553812 ?auto_2553818 ) ) ( not ( = ?auto_2553812 ?auto_2553819 ) ) ( not ( = ?auto_2553812 ?auto_2553820 ) ) ( not ( = ?auto_2553812 ?auto_2553821 ) ) ( not ( = ?auto_2553812 ?auto_2553822 ) ) ( not ( = ?auto_2553812 ?auto_2553826 ) ) ( not ( = ?auto_2553813 ?auto_2553814 ) ) ( not ( = ?auto_2553813 ?auto_2553811 ) ) ( not ( = ?auto_2553813 ?auto_2553815 ) ) ( not ( = ?auto_2553813 ?auto_2553817 ) ) ( not ( = ?auto_2553813 ?auto_2553816 ) ) ( not ( = ?auto_2553813 ?auto_2553818 ) ) ( not ( = ?auto_2553813 ?auto_2553819 ) ) ( not ( = ?auto_2553813 ?auto_2553820 ) ) ( not ( = ?auto_2553813 ?auto_2553821 ) ) ( not ( = ?auto_2553813 ?auto_2553822 ) ) ( not ( = ?auto_2553813 ?auto_2553826 ) ) ( not ( = ?auto_2553814 ?auto_2553811 ) ) ( not ( = ?auto_2553814 ?auto_2553815 ) ) ( not ( = ?auto_2553814 ?auto_2553817 ) ) ( not ( = ?auto_2553814 ?auto_2553816 ) ) ( not ( = ?auto_2553814 ?auto_2553818 ) ) ( not ( = ?auto_2553814 ?auto_2553819 ) ) ( not ( = ?auto_2553814 ?auto_2553820 ) ) ( not ( = ?auto_2553814 ?auto_2553821 ) ) ( not ( = ?auto_2553814 ?auto_2553822 ) ) ( not ( = ?auto_2553814 ?auto_2553826 ) ) ( not ( = ?auto_2553811 ?auto_2553815 ) ) ( not ( = ?auto_2553811 ?auto_2553817 ) ) ( not ( = ?auto_2553811 ?auto_2553816 ) ) ( not ( = ?auto_2553811 ?auto_2553818 ) ) ( not ( = ?auto_2553811 ?auto_2553819 ) ) ( not ( = ?auto_2553811 ?auto_2553820 ) ) ( not ( = ?auto_2553811 ?auto_2553821 ) ) ( not ( = ?auto_2553811 ?auto_2553822 ) ) ( not ( = ?auto_2553811 ?auto_2553826 ) ) ( not ( = ?auto_2553815 ?auto_2553817 ) ) ( not ( = ?auto_2553815 ?auto_2553816 ) ) ( not ( = ?auto_2553815 ?auto_2553818 ) ) ( not ( = ?auto_2553815 ?auto_2553819 ) ) ( not ( = ?auto_2553815 ?auto_2553820 ) ) ( not ( = ?auto_2553815 ?auto_2553821 ) ) ( not ( = ?auto_2553815 ?auto_2553822 ) ) ( not ( = ?auto_2553815 ?auto_2553826 ) ) ( not ( = ?auto_2553817 ?auto_2553816 ) ) ( not ( = ?auto_2553817 ?auto_2553818 ) ) ( not ( = ?auto_2553817 ?auto_2553819 ) ) ( not ( = ?auto_2553817 ?auto_2553820 ) ) ( not ( = ?auto_2553817 ?auto_2553821 ) ) ( not ( = ?auto_2553817 ?auto_2553822 ) ) ( not ( = ?auto_2553817 ?auto_2553826 ) ) ( not ( = ?auto_2553816 ?auto_2553818 ) ) ( not ( = ?auto_2553816 ?auto_2553819 ) ) ( not ( = ?auto_2553816 ?auto_2553820 ) ) ( not ( = ?auto_2553816 ?auto_2553821 ) ) ( not ( = ?auto_2553816 ?auto_2553822 ) ) ( not ( = ?auto_2553816 ?auto_2553826 ) ) ( not ( = ?auto_2553818 ?auto_2553819 ) ) ( not ( = ?auto_2553818 ?auto_2553820 ) ) ( not ( = ?auto_2553818 ?auto_2553821 ) ) ( not ( = ?auto_2553818 ?auto_2553822 ) ) ( not ( = ?auto_2553818 ?auto_2553826 ) ) ( not ( = ?auto_2553819 ?auto_2553820 ) ) ( not ( = ?auto_2553819 ?auto_2553821 ) ) ( not ( = ?auto_2553819 ?auto_2553822 ) ) ( not ( = ?auto_2553819 ?auto_2553826 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2553820 ?auto_2553821 ?auto_2553822 )
      ( MAKE-11CRATE-VERIFY ?auto_2553812 ?auto_2553813 ?auto_2553814 ?auto_2553811 ?auto_2553815 ?auto_2553817 ?auto_2553816 ?auto_2553818 ?auto_2553819 ?auto_2553820 ?auto_2553821 ?auto_2553822 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2553956 - SURFACE
      ?auto_2553957 - SURFACE
      ?auto_2553958 - SURFACE
      ?auto_2553955 - SURFACE
      ?auto_2553959 - SURFACE
      ?auto_2553961 - SURFACE
      ?auto_2553960 - SURFACE
      ?auto_2553962 - SURFACE
      ?auto_2553963 - SURFACE
      ?auto_2553964 - SURFACE
      ?auto_2553965 - SURFACE
      ?auto_2553966 - SURFACE
    )
    :vars
    (
      ?auto_2553967 - HOIST
      ?auto_2553970 - PLACE
      ?auto_2553971 - PLACE
      ?auto_2553969 - HOIST
      ?auto_2553972 - SURFACE
      ?auto_2553968 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2553967 ?auto_2553970 ) ( IS-CRATE ?auto_2553966 ) ( not ( = ?auto_2553965 ?auto_2553966 ) ) ( not ( = ?auto_2553964 ?auto_2553965 ) ) ( not ( = ?auto_2553964 ?auto_2553966 ) ) ( not ( = ?auto_2553971 ?auto_2553970 ) ) ( HOIST-AT ?auto_2553969 ?auto_2553971 ) ( not ( = ?auto_2553967 ?auto_2553969 ) ) ( AVAILABLE ?auto_2553969 ) ( SURFACE-AT ?auto_2553966 ?auto_2553971 ) ( ON ?auto_2553966 ?auto_2553972 ) ( CLEAR ?auto_2553966 ) ( not ( = ?auto_2553965 ?auto_2553972 ) ) ( not ( = ?auto_2553966 ?auto_2553972 ) ) ( not ( = ?auto_2553964 ?auto_2553972 ) ) ( TRUCK-AT ?auto_2553968 ?auto_2553970 ) ( SURFACE-AT ?auto_2553964 ?auto_2553970 ) ( CLEAR ?auto_2553964 ) ( IS-CRATE ?auto_2553965 ) ( AVAILABLE ?auto_2553967 ) ( IN ?auto_2553965 ?auto_2553968 ) ( ON ?auto_2553957 ?auto_2553956 ) ( ON ?auto_2553958 ?auto_2553957 ) ( ON ?auto_2553955 ?auto_2553958 ) ( ON ?auto_2553959 ?auto_2553955 ) ( ON ?auto_2553961 ?auto_2553959 ) ( ON ?auto_2553960 ?auto_2553961 ) ( ON ?auto_2553962 ?auto_2553960 ) ( ON ?auto_2553963 ?auto_2553962 ) ( ON ?auto_2553964 ?auto_2553963 ) ( not ( = ?auto_2553956 ?auto_2553957 ) ) ( not ( = ?auto_2553956 ?auto_2553958 ) ) ( not ( = ?auto_2553956 ?auto_2553955 ) ) ( not ( = ?auto_2553956 ?auto_2553959 ) ) ( not ( = ?auto_2553956 ?auto_2553961 ) ) ( not ( = ?auto_2553956 ?auto_2553960 ) ) ( not ( = ?auto_2553956 ?auto_2553962 ) ) ( not ( = ?auto_2553956 ?auto_2553963 ) ) ( not ( = ?auto_2553956 ?auto_2553964 ) ) ( not ( = ?auto_2553956 ?auto_2553965 ) ) ( not ( = ?auto_2553956 ?auto_2553966 ) ) ( not ( = ?auto_2553956 ?auto_2553972 ) ) ( not ( = ?auto_2553957 ?auto_2553958 ) ) ( not ( = ?auto_2553957 ?auto_2553955 ) ) ( not ( = ?auto_2553957 ?auto_2553959 ) ) ( not ( = ?auto_2553957 ?auto_2553961 ) ) ( not ( = ?auto_2553957 ?auto_2553960 ) ) ( not ( = ?auto_2553957 ?auto_2553962 ) ) ( not ( = ?auto_2553957 ?auto_2553963 ) ) ( not ( = ?auto_2553957 ?auto_2553964 ) ) ( not ( = ?auto_2553957 ?auto_2553965 ) ) ( not ( = ?auto_2553957 ?auto_2553966 ) ) ( not ( = ?auto_2553957 ?auto_2553972 ) ) ( not ( = ?auto_2553958 ?auto_2553955 ) ) ( not ( = ?auto_2553958 ?auto_2553959 ) ) ( not ( = ?auto_2553958 ?auto_2553961 ) ) ( not ( = ?auto_2553958 ?auto_2553960 ) ) ( not ( = ?auto_2553958 ?auto_2553962 ) ) ( not ( = ?auto_2553958 ?auto_2553963 ) ) ( not ( = ?auto_2553958 ?auto_2553964 ) ) ( not ( = ?auto_2553958 ?auto_2553965 ) ) ( not ( = ?auto_2553958 ?auto_2553966 ) ) ( not ( = ?auto_2553958 ?auto_2553972 ) ) ( not ( = ?auto_2553955 ?auto_2553959 ) ) ( not ( = ?auto_2553955 ?auto_2553961 ) ) ( not ( = ?auto_2553955 ?auto_2553960 ) ) ( not ( = ?auto_2553955 ?auto_2553962 ) ) ( not ( = ?auto_2553955 ?auto_2553963 ) ) ( not ( = ?auto_2553955 ?auto_2553964 ) ) ( not ( = ?auto_2553955 ?auto_2553965 ) ) ( not ( = ?auto_2553955 ?auto_2553966 ) ) ( not ( = ?auto_2553955 ?auto_2553972 ) ) ( not ( = ?auto_2553959 ?auto_2553961 ) ) ( not ( = ?auto_2553959 ?auto_2553960 ) ) ( not ( = ?auto_2553959 ?auto_2553962 ) ) ( not ( = ?auto_2553959 ?auto_2553963 ) ) ( not ( = ?auto_2553959 ?auto_2553964 ) ) ( not ( = ?auto_2553959 ?auto_2553965 ) ) ( not ( = ?auto_2553959 ?auto_2553966 ) ) ( not ( = ?auto_2553959 ?auto_2553972 ) ) ( not ( = ?auto_2553961 ?auto_2553960 ) ) ( not ( = ?auto_2553961 ?auto_2553962 ) ) ( not ( = ?auto_2553961 ?auto_2553963 ) ) ( not ( = ?auto_2553961 ?auto_2553964 ) ) ( not ( = ?auto_2553961 ?auto_2553965 ) ) ( not ( = ?auto_2553961 ?auto_2553966 ) ) ( not ( = ?auto_2553961 ?auto_2553972 ) ) ( not ( = ?auto_2553960 ?auto_2553962 ) ) ( not ( = ?auto_2553960 ?auto_2553963 ) ) ( not ( = ?auto_2553960 ?auto_2553964 ) ) ( not ( = ?auto_2553960 ?auto_2553965 ) ) ( not ( = ?auto_2553960 ?auto_2553966 ) ) ( not ( = ?auto_2553960 ?auto_2553972 ) ) ( not ( = ?auto_2553962 ?auto_2553963 ) ) ( not ( = ?auto_2553962 ?auto_2553964 ) ) ( not ( = ?auto_2553962 ?auto_2553965 ) ) ( not ( = ?auto_2553962 ?auto_2553966 ) ) ( not ( = ?auto_2553962 ?auto_2553972 ) ) ( not ( = ?auto_2553963 ?auto_2553964 ) ) ( not ( = ?auto_2553963 ?auto_2553965 ) ) ( not ( = ?auto_2553963 ?auto_2553966 ) ) ( not ( = ?auto_2553963 ?auto_2553972 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2553964 ?auto_2553965 ?auto_2553966 )
      ( MAKE-11CRATE-VERIFY ?auto_2553956 ?auto_2553957 ?auto_2553958 ?auto_2553955 ?auto_2553959 ?auto_2553961 ?auto_2553960 ?auto_2553962 ?auto_2553963 ?auto_2553964 ?auto_2553965 ?auto_2553966 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2563247 - SURFACE
      ?auto_2563248 - SURFACE
      ?auto_2563249 - SURFACE
      ?auto_2563246 - SURFACE
      ?auto_2563250 - SURFACE
      ?auto_2563252 - SURFACE
      ?auto_2563251 - SURFACE
      ?auto_2563253 - SURFACE
      ?auto_2563254 - SURFACE
      ?auto_2563255 - SURFACE
      ?auto_2563256 - SURFACE
      ?auto_2563257 - SURFACE
      ?auto_2563258 - SURFACE
    )
    :vars
    (
      ?auto_2563259 - HOIST
      ?auto_2563260 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2563259 ?auto_2563260 ) ( SURFACE-AT ?auto_2563257 ?auto_2563260 ) ( CLEAR ?auto_2563257 ) ( LIFTING ?auto_2563259 ?auto_2563258 ) ( IS-CRATE ?auto_2563258 ) ( not ( = ?auto_2563257 ?auto_2563258 ) ) ( ON ?auto_2563248 ?auto_2563247 ) ( ON ?auto_2563249 ?auto_2563248 ) ( ON ?auto_2563246 ?auto_2563249 ) ( ON ?auto_2563250 ?auto_2563246 ) ( ON ?auto_2563252 ?auto_2563250 ) ( ON ?auto_2563251 ?auto_2563252 ) ( ON ?auto_2563253 ?auto_2563251 ) ( ON ?auto_2563254 ?auto_2563253 ) ( ON ?auto_2563255 ?auto_2563254 ) ( ON ?auto_2563256 ?auto_2563255 ) ( ON ?auto_2563257 ?auto_2563256 ) ( not ( = ?auto_2563247 ?auto_2563248 ) ) ( not ( = ?auto_2563247 ?auto_2563249 ) ) ( not ( = ?auto_2563247 ?auto_2563246 ) ) ( not ( = ?auto_2563247 ?auto_2563250 ) ) ( not ( = ?auto_2563247 ?auto_2563252 ) ) ( not ( = ?auto_2563247 ?auto_2563251 ) ) ( not ( = ?auto_2563247 ?auto_2563253 ) ) ( not ( = ?auto_2563247 ?auto_2563254 ) ) ( not ( = ?auto_2563247 ?auto_2563255 ) ) ( not ( = ?auto_2563247 ?auto_2563256 ) ) ( not ( = ?auto_2563247 ?auto_2563257 ) ) ( not ( = ?auto_2563247 ?auto_2563258 ) ) ( not ( = ?auto_2563248 ?auto_2563249 ) ) ( not ( = ?auto_2563248 ?auto_2563246 ) ) ( not ( = ?auto_2563248 ?auto_2563250 ) ) ( not ( = ?auto_2563248 ?auto_2563252 ) ) ( not ( = ?auto_2563248 ?auto_2563251 ) ) ( not ( = ?auto_2563248 ?auto_2563253 ) ) ( not ( = ?auto_2563248 ?auto_2563254 ) ) ( not ( = ?auto_2563248 ?auto_2563255 ) ) ( not ( = ?auto_2563248 ?auto_2563256 ) ) ( not ( = ?auto_2563248 ?auto_2563257 ) ) ( not ( = ?auto_2563248 ?auto_2563258 ) ) ( not ( = ?auto_2563249 ?auto_2563246 ) ) ( not ( = ?auto_2563249 ?auto_2563250 ) ) ( not ( = ?auto_2563249 ?auto_2563252 ) ) ( not ( = ?auto_2563249 ?auto_2563251 ) ) ( not ( = ?auto_2563249 ?auto_2563253 ) ) ( not ( = ?auto_2563249 ?auto_2563254 ) ) ( not ( = ?auto_2563249 ?auto_2563255 ) ) ( not ( = ?auto_2563249 ?auto_2563256 ) ) ( not ( = ?auto_2563249 ?auto_2563257 ) ) ( not ( = ?auto_2563249 ?auto_2563258 ) ) ( not ( = ?auto_2563246 ?auto_2563250 ) ) ( not ( = ?auto_2563246 ?auto_2563252 ) ) ( not ( = ?auto_2563246 ?auto_2563251 ) ) ( not ( = ?auto_2563246 ?auto_2563253 ) ) ( not ( = ?auto_2563246 ?auto_2563254 ) ) ( not ( = ?auto_2563246 ?auto_2563255 ) ) ( not ( = ?auto_2563246 ?auto_2563256 ) ) ( not ( = ?auto_2563246 ?auto_2563257 ) ) ( not ( = ?auto_2563246 ?auto_2563258 ) ) ( not ( = ?auto_2563250 ?auto_2563252 ) ) ( not ( = ?auto_2563250 ?auto_2563251 ) ) ( not ( = ?auto_2563250 ?auto_2563253 ) ) ( not ( = ?auto_2563250 ?auto_2563254 ) ) ( not ( = ?auto_2563250 ?auto_2563255 ) ) ( not ( = ?auto_2563250 ?auto_2563256 ) ) ( not ( = ?auto_2563250 ?auto_2563257 ) ) ( not ( = ?auto_2563250 ?auto_2563258 ) ) ( not ( = ?auto_2563252 ?auto_2563251 ) ) ( not ( = ?auto_2563252 ?auto_2563253 ) ) ( not ( = ?auto_2563252 ?auto_2563254 ) ) ( not ( = ?auto_2563252 ?auto_2563255 ) ) ( not ( = ?auto_2563252 ?auto_2563256 ) ) ( not ( = ?auto_2563252 ?auto_2563257 ) ) ( not ( = ?auto_2563252 ?auto_2563258 ) ) ( not ( = ?auto_2563251 ?auto_2563253 ) ) ( not ( = ?auto_2563251 ?auto_2563254 ) ) ( not ( = ?auto_2563251 ?auto_2563255 ) ) ( not ( = ?auto_2563251 ?auto_2563256 ) ) ( not ( = ?auto_2563251 ?auto_2563257 ) ) ( not ( = ?auto_2563251 ?auto_2563258 ) ) ( not ( = ?auto_2563253 ?auto_2563254 ) ) ( not ( = ?auto_2563253 ?auto_2563255 ) ) ( not ( = ?auto_2563253 ?auto_2563256 ) ) ( not ( = ?auto_2563253 ?auto_2563257 ) ) ( not ( = ?auto_2563253 ?auto_2563258 ) ) ( not ( = ?auto_2563254 ?auto_2563255 ) ) ( not ( = ?auto_2563254 ?auto_2563256 ) ) ( not ( = ?auto_2563254 ?auto_2563257 ) ) ( not ( = ?auto_2563254 ?auto_2563258 ) ) ( not ( = ?auto_2563255 ?auto_2563256 ) ) ( not ( = ?auto_2563255 ?auto_2563257 ) ) ( not ( = ?auto_2563255 ?auto_2563258 ) ) ( not ( = ?auto_2563256 ?auto_2563257 ) ) ( not ( = ?auto_2563256 ?auto_2563258 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2563257 ?auto_2563258 )
      ( MAKE-12CRATE-VERIFY ?auto_2563247 ?auto_2563248 ?auto_2563249 ?auto_2563246 ?auto_2563250 ?auto_2563252 ?auto_2563251 ?auto_2563253 ?auto_2563254 ?auto_2563255 ?auto_2563256 ?auto_2563257 ?auto_2563258 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2563372 - SURFACE
      ?auto_2563373 - SURFACE
      ?auto_2563374 - SURFACE
      ?auto_2563371 - SURFACE
      ?auto_2563375 - SURFACE
      ?auto_2563377 - SURFACE
      ?auto_2563376 - SURFACE
      ?auto_2563378 - SURFACE
      ?auto_2563379 - SURFACE
      ?auto_2563380 - SURFACE
      ?auto_2563381 - SURFACE
      ?auto_2563382 - SURFACE
      ?auto_2563383 - SURFACE
    )
    :vars
    (
      ?auto_2563386 - HOIST
      ?auto_2563385 - PLACE
      ?auto_2563384 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2563386 ?auto_2563385 ) ( SURFACE-AT ?auto_2563382 ?auto_2563385 ) ( CLEAR ?auto_2563382 ) ( IS-CRATE ?auto_2563383 ) ( not ( = ?auto_2563382 ?auto_2563383 ) ) ( TRUCK-AT ?auto_2563384 ?auto_2563385 ) ( AVAILABLE ?auto_2563386 ) ( IN ?auto_2563383 ?auto_2563384 ) ( ON ?auto_2563382 ?auto_2563381 ) ( not ( = ?auto_2563381 ?auto_2563382 ) ) ( not ( = ?auto_2563381 ?auto_2563383 ) ) ( ON ?auto_2563373 ?auto_2563372 ) ( ON ?auto_2563374 ?auto_2563373 ) ( ON ?auto_2563371 ?auto_2563374 ) ( ON ?auto_2563375 ?auto_2563371 ) ( ON ?auto_2563377 ?auto_2563375 ) ( ON ?auto_2563376 ?auto_2563377 ) ( ON ?auto_2563378 ?auto_2563376 ) ( ON ?auto_2563379 ?auto_2563378 ) ( ON ?auto_2563380 ?auto_2563379 ) ( ON ?auto_2563381 ?auto_2563380 ) ( not ( = ?auto_2563372 ?auto_2563373 ) ) ( not ( = ?auto_2563372 ?auto_2563374 ) ) ( not ( = ?auto_2563372 ?auto_2563371 ) ) ( not ( = ?auto_2563372 ?auto_2563375 ) ) ( not ( = ?auto_2563372 ?auto_2563377 ) ) ( not ( = ?auto_2563372 ?auto_2563376 ) ) ( not ( = ?auto_2563372 ?auto_2563378 ) ) ( not ( = ?auto_2563372 ?auto_2563379 ) ) ( not ( = ?auto_2563372 ?auto_2563380 ) ) ( not ( = ?auto_2563372 ?auto_2563381 ) ) ( not ( = ?auto_2563372 ?auto_2563382 ) ) ( not ( = ?auto_2563372 ?auto_2563383 ) ) ( not ( = ?auto_2563373 ?auto_2563374 ) ) ( not ( = ?auto_2563373 ?auto_2563371 ) ) ( not ( = ?auto_2563373 ?auto_2563375 ) ) ( not ( = ?auto_2563373 ?auto_2563377 ) ) ( not ( = ?auto_2563373 ?auto_2563376 ) ) ( not ( = ?auto_2563373 ?auto_2563378 ) ) ( not ( = ?auto_2563373 ?auto_2563379 ) ) ( not ( = ?auto_2563373 ?auto_2563380 ) ) ( not ( = ?auto_2563373 ?auto_2563381 ) ) ( not ( = ?auto_2563373 ?auto_2563382 ) ) ( not ( = ?auto_2563373 ?auto_2563383 ) ) ( not ( = ?auto_2563374 ?auto_2563371 ) ) ( not ( = ?auto_2563374 ?auto_2563375 ) ) ( not ( = ?auto_2563374 ?auto_2563377 ) ) ( not ( = ?auto_2563374 ?auto_2563376 ) ) ( not ( = ?auto_2563374 ?auto_2563378 ) ) ( not ( = ?auto_2563374 ?auto_2563379 ) ) ( not ( = ?auto_2563374 ?auto_2563380 ) ) ( not ( = ?auto_2563374 ?auto_2563381 ) ) ( not ( = ?auto_2563374 ?auto_2563382 ) ) ( not ( = ?auto_2563374 ?auto_2563383 ) ) ( not ( = ?auto_2563371 ?auto_2563375 ) ) ( not ( = ?auto_2563371 ?auto_2563377 ) ) ( not ( = ?auto_2563371 ?auto_2563376 ) ) ( not ( = ?auto_2563371 ?auto_2563378 ) ) ( not ( = ?auto_2563371 ?auto_2563379 ) ) ( not ( = ?auto_2563371 ?auto_2563380 ) ) ( not ( = ?auto_2563371 ?auto_2563381 ) ) ( not ( = ?auto_2563371 ?auto_2563382 ) ) ( not ( = ?auto_2563371 ?auto_2563383 ) ) ( not ( = ?auto_2563375 ?auto_2563377 ) ) ( not ( = ?auto_2563375 ?auto_2563376 ) ) ( not ( = ?auto_2563375 ?auto_2563378 ) ) ( not ( = ?auto_2563375 ?auto_2563379 ) ) ( not ( = ?auto_2563375 ?auto_2563380 ) ) ( not ( = ?auto_2563375 ?auto_2563381 ) ) ( not ( = ?auto_2563375 ?auto_2563382 ) ) ( not ( = ?auto_2563375 ?auto_2563383 ) ) ( not ( = ?auto_2563377 ?auto_2563376 ) ) ( not ( = ?auto_2563377 ?auto_2563378 ) ) ( not ( = ?auto_2563377 ?auto_2563379 ) ) ( not ( = ?auto_2563377 ?auto_2563380 ) ) ( not ( = ?auto_2563377 ?auto_2563381 ) ) ( not ( = ?auto_2563377 ?auto_2563382 ) ) ( not ( = ?auto_2563377 ?auto_2563383 ) ) ( not ( = ?auto_2563376 ?auto_2563378 ) ) ( not ( = ?auto_2563376 ?auto_2563379 ) ) ( not ( = ?auto_2563376 ?auto_2563380 ) ) ( not ( = ?auto_2563376 ?auto_2563381 ) ) ( not ( = ?auto_2563376 ?auto_2563382 ) ) ( not ( = ?auto_2563376 ?auto_2563383 ) ) ( not ( = ?auto_2563378 ?auto_2563379 ) ) ( not ( = ?auto_2563378 ?auto_2563380 ) ) ( not ( = ?auto_2563378 ?auto_2563381 ) ) ( not ( = ?auto_2563378 ?auto_2563382 ) ) ( not ( = ?auto_2563378 ?auto_2563383 ) ) ( not ( = ?auto_2563379 ?auto_2563380 ) ) ( not ( = ?auto_2563379 ?auto_2563381 ) ) ( not ( = ?auto_2563379 ?auto_2563382 ) ) ( not ( = ?auto_2563379 ?auto_2563383 ) ) ( not ( = ?auto_2563380 ?auto_2563381 ) ) ( not ( = ?auto_2563380 ?auto_2563382 ) ) ( not ( = ?auto_2563380 ?auto_2563383 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2563381 ?auto_2563382 ?auto_2563383 )
      ( MAKE-12CRATE-VERIFY ?auto_2563372 ?auto_2563373 ?auto_2563374 ?auto_2563371 ?auto_2563375 ?auto_2563377 ?auto_2563376 ?auto_2563378 ?auto_2563379 ?auto_2563380 ?auto_2563381 ?auto_2563382 ?auto_2563383 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2563510 - SURFACE
      ?auto_2563511 - SURFACE
      ?auto_2563512 - SURFACE
      ?auto_2563509 - SURFACE
      ?auto_2563513 - SURFACE
      ?auto_2563515 - SURFACE
      ?auto_2563514 - SURFACE
      ?auto_2563516 - SURFACE
      ?auto_2563517 - SURFACE
      ?auto_2563518 - SURFACE
      ?auto_2563519 - SURFACE
      ?auto_2563520 - SURFACE
      ?auto_2563521 - SURFACE
    )
    :vars
    (
      ?auto_2563522 - HOIST
      ?auto_2563523 - PLACE
      ?auto_2563525 - TRUCK
      ?auto_2563524 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2563522 ?auto_2563523 ) ( SURFACE-AT ?auto_2563520 ?auto_2563523 ) ( CLEAR ?auto_2563520 ) ( IS-CRATE ?auto_2563521 ) ( not ( = ?auto_2563520 ?auto_2563521 ) ) ( AVAILABLE ?auto_2563522 ) ( IN ?auto_2563521 ?auto_2563525 ) ( ON ?auto_2563520 ?auto_2563519 ) ( not ( = ?auto_2563519 ?auto_2563520 ) ) ( not ( = ?auto_2563519 ?auto_2563521 ) ) ( TRUCK-AT ?auto_2563525 ?auto_2563524 ) ( not ( = ?auto_2563524 ?auto_2563523 ) ) ( ON ?auto_2563511 ?auto_2563510 ) ( ON ?auto_2563512 ?auto_2563511 ) ( ON ?auto_2563509 ?auto_2563512 ) ( ON ?auto_2563513 ?auto_2563509 ) ( ON ?auto_2563515 ?auto_2563513 ) ( ON ?auto_2563514 ?auto_2563515 ) ( ON ?auto_2563516 ?auto_2563514 ) ( ON ?auto_2563517 ?auto_2563516 ) ( ON ?auto_2563518 ?auto_2563517 ) ( ON ?auto_2563519 ?auto_2563518 ) ( not ( = ?auto_2563510 ?auto_2563511 ) ) ( not ( = ?auto_2563510 ?auto_2563512 ) ) ( not ( = ?auto_2563510 ?auto_2563509 ) ) ( not ( = ?auto_2563510 ?auto_2563513 ) ) ( not ( = ?auto_2563510 ?auto_2563515 ) ) ( not ( = ?auto_2563510 ?auto_2563514 ) ) ( not ( = ?auto_2563510 ?auto_2563516 ) ) ( not ( = ?auto_2563510 ?auto_2563517 ) ) ( not ( = ?auto_2563510 ?auto_2563518 ) ) ( not ( = ?auto_2563510 ?auto_2563519 ) ) ( not ( = ?auto_2563510 ?auto_2563520 ) ) ( not ( = ?auto_2563510 ?auto_2563521 ) ) ( not ( = ?auto_2563511 ?auto_2563512 ) ) ( not ( = ?auto_2563511 ?auto_2563509 ) ) ( not ( = ?auto_2563511 ?auto_2563513 ) ) ( not ( = ?auto_2563511 ?auto_2563515 ) ) ( not ( = ?auto_2563511 ?auto_2563514 ) ) ( not ( = ?auto_2563511 ?auto_2563516 ) ) ( not ( = ?auto_2563511 ?auto_2563517 ) ) ( not ( = ?auto_2563511 ?auto_2563518 ) ) ( not ( = ?auto_2563511 ?auto_2563519 ) ) ( not ( = ?auto_2563511 ?auto_2563520 ) ) ( not ( = ?auto_2563511 ?auto_2563521 ) ) ( not ( = ?auto_2563512 ?auto_2563509 ) ) ( not ( = ?auto_2563512 ?auto_2563513 ) ) ( not ( = ?auto_2563512 ?auto_2563515 ) ) ( not ( = ?auto_2563512 ?auto_2563514 ) ) ( not ( = ?auto_2563512 ?auto_2563516 ) ) ( not ( = ?auto_2563512 ?auto_2563517 ) ) ( not ( = ?auto_2563512 ?auto_2563518 ) ) ( not ( = ?auto_2563512 ?auto_2563519 ) ) ( not ( = ?auto_2563512 ?auto_2563520 ) ) ( not ( = ?auto_2563512 ?auto_2563521 ) ) ( not ( = ?auto_2563509 ?auto_2563513 ) ) ( not ( = ?auto_2563509 ?auto_2563515 ) ) ( not ( = ?auto_2563509 ?auto_2563514 ) ) ( not ( = ?auto_2563509 ?auto_2563516 ) ) ( not ( = ?auto_2563509 ?auto_2563517 ) ) ( not ( = ?auto_2563509 ?auto_2563518 ) ) ( not ( = ?auto_2563509 ?auto_2563519 ) ) ( not ( = ?auto_2563509 ?auto_2563520 ) ) ( not ( = ?auto_2563509 ?auto_2563521 ) ) ( not ( = ?auto_2563513 ?auto_2563515 ) ) ( not ( = ?auto_2563513 ?auto_2563514 ) ) ( not ( = ?auto_2563513 ?auto_2563516 ) ) ( not ( = ?auto_2563513 ?auto_2563517 ) ) ( not ( = ?auto_2563513 ?auto_2563518 ) ) ( not ( = ?auto_2563513 ?auto_2563519 ) ) ( not ( = ?auto_2563513 ?auto_2563520 ) ) ( not ( = ?auto_2563513 ?auto_2563521 ) ) ( not ( = ?auto_2563515 ?auto_2563514 ) ) ( not ( = ?auto_2563515 ?auto_2563516 ) ) ( not ( = ?auto_2563515 ?auto_2563517 ) ) ( not ( = ?auto_2563515 ?auto_2563518 ) ) ( not ( = ?auto_2563515 ?auto_2563519 ) ) ( not ( = ?auto_2563515 ?auto_2563520 ) ) ( not ( = ?auto_2563515 ?auto_2563521 ) ) ( not ( = ?auto_2563514 ?auto_2563516 ) ) ( not ( = ?auto_2563514 ?auto_2563517 ) ) ( not ( = ?auto_2563514 ?auto_2563518 ) ) ( not ( = ?auto_2563514 ?auto_2563519 ) ) ( not ( = ?auto_2563514 ?auto_2563520 ) ) ( not ( = ?auto_2563514 ?auto_2563521 ) ) ( not ( = ?auto_2563516 ?auto_2563517 ) ) ( not ( = ?auto_2563516 ?auto_2563518 ) ) ( not ( = ?auto_2563516 ?auto_2563519 ) ) ( not ( = ?auto_2563516 ?auto_2563520 ) ) ( not ( = ?auto_2563516 ?auto_2563521 ) ) ( not ( = ?auto_2563517 ?auto_2563518 ) ) ( not ( = ?auto_2563517 ?auto_2563519 ) ) ( not ( = ?auto_2563517 ?auto_2563520 ) ) ( not ( = ?auto_2563517 ?auto_2563521 ) ) ( not ( = ?auto_2563518 ?auto_2563519 ) ) ( not ( = ?auto_2563518 ?auto_2563520 ) ) ( not ( = ?auto_2563518 ?auto_2563521 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2563519 ?auto_2563520 ?auto_2563521 )
      ( MAKE-12CRATE-VERIFY ?auto_2563510 ?auto_2563511 ?auto_2563512 ?auto_2563509 ?auto_2563513 ?auto_2563515 ?auto_2563514 ?auto_2563516 ?auto_2563517 ?auto_2563518 ?auto_2563519 ?auto_2563520 ?auto_2563521 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2563660 - SURFACE
      ?auto_2563661 - SURFACE
      ?auto_2563662 - SURFACE
      ?auto_2563659 - SURFACE
      ?auto_2563663 - SURFACE
      ?auto_2563665 - SURFACE
      ?auto_2563664 - SURFACE
      ?auto_2563666 - SURFACE
      ?auto_2563667 - SURFACE
      ?auto_2563668 - SURFACE
      ?auto_2563669 - SURFACE
      ?auto_2563670 - SURFACE
      ?auto_2563671 - SURFACE
    )
    :vars
    (
      ?auto_2563673 - HOIST
      ?auto_2563672 - PLACE
      ?auto_2563674 - TRUCK
      ?auto_2563676 - PLACE
      ?auto_2563675 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2563673 ?auto_2563672 ) ( SURFACE-AT ?auto_2563670 ?auto_2563672 ) ( CLEAR ?auto_2563670 ) ( IS-CRATE ?auto_2563671 ) ( not ( = ?auto_2563670 ?auto_2563671 ) ) ( AVAILABLE ?auto_2563673 ) ( ON ?auto_2563670 ?auto_2563669 ) ( not ( = ?auto_2563669 ?auto_2563670 ) ) ( not ( = ?auto_2563669 ?auto_2563671 ) ) ( TRUCK-AT ?auto_2563674 ?auto_2563676 ) ( not ( = ?auto_2563676 ?auto_2563672 ) ) ( HOIST-AT ?auto_2563675 ?auto_2563676 ) ( LIFTING ?auto_2563675 ?auto_2563671 ) ( not ( = ?auto_2563673 ?auto_2563675 ) ) ( ON ?auto_2563661 ?auto_2563660 ) ( ON ?auto_2563662 ?auto_2563661 ) ( ON ?auto_2563659 ?auto_2563662 ) ( ON ?auto_2563663 ?auto_2563659 ) ( ON ?auto_2563665 ?auto_2563663 ) ( ON ?auto_2563664 ?auto_2563665 ) ( ON ?auto_2563666 ?auto_2563664 ) ( ON ?auto_2563667 ?auto_2563666 ) ( ON ?auto_2563668 ?auto_2563667 ) ( ON ?auto_2563669 ?auto_2563668 ) ( not ( = ?auto_2563660 ?auto_2563661 ) ) ( not ( = ?auto_2563660 ?auto_2563662 ) ) ( not ( = ?auto_2563660 ?auto_2563659 ) ) ( not ( = ?auto_2563660 ?auto_2563663 ) ) ( not ( = ?auto_2563660 ?auto_2563665 ) ) ( not ( = ?auto_2563660 ?auto_2563664 ) ) ( not ( = ?auto_2563660 ?auto_2563666 ) ) ( not ( = ?auto_2563660 ?auto_2563667 ) ) ( not ( = ?auto_2563660 ?auto_2563668 ) ) ( not ( = ?auto_2563660 ?auto_2563669 ) ) ( not ( = ?auto_2563660 ?auto_2563670 ) ) ( not ( = ?auto_2563660 ?auto_2563671 ) ) ( not ( = ?auto_2563661 ?auto_2563662 ) ) ( not ( = ?auto_2563661 ?auto_2563659 ) ) ( not ( = ?auto_2563661 ?auto_2563663 ) ) ( not ( = ?auto_2563661 ?auto_2563665 ) ) ( not ( = ?auto_2563661 ?auto_2563664 ) ) ( not ( = ?auto_2563661 ?auto_2563666 ) ) ( not ( = ?auto_2563661 ?auto_2563667 ) ) ( not ( = ?auto_2563661 ?auto_2563668 ) ) ( not ( = ?auto_2563661 ?auto_2563669 ) ) ( not ( = ?auto_2563661 ?auto_2563670 ) ) ( not ( = ?auto_2563661 ?auto_2563671 ) ) ( not ( = ?auto_2563662 ?auto_2563659 ) ) ( not ( = ?auto_2563662 ?auto_2563663 ) ) ( not ( = ?auto_2563662 ?auto_2563665 ) ) ( not ( = ?auto_2563662 ?auto_2563664 ) ) ( not ( = ?auto_2563662 ?auto_2563666 ) ) ( not ( = ?auto_2563662 ?auto_2563667 ) ) ( not ( = ?auto_2563662 ?auto_2563668 ) ) ( not ( = ?auto_2563662 ?auto_2563669 ) ) ( not ( = ?auto_2563662 ?auto_2563670 ) ) ( not ( = ?auto_2563662 ?auto_2563671 ) ) ( not ( = ?auto_2563659 ?auto_2563663 ) ) ( not ( = ?auto_2563659 ?auto_2563665 ) ) ( not ( = ?auto_2563659 ?auto_2563664 ) ) ( not ( = ?auto_2563659 ?auto_2563666 ) ) ( not ( = ?auto_2563659 ?auto_2563667 ) ) ( not ( = ?auto_2563659 ?auto_2563668 ) ) ( not ( = ?auto_2563659 ?auto_2563669 ) ) ( not ( = ?auto_2563659 ?auto_2563670 ) ) ( not ( = ?auto_2563659 ?auto_2563671 ) ) ( not ( = ?auto_2563663 ?auto_2563665 ) ) ( not ( = ?auto_2563663 ?auto_2563664 ) ) ( not ( = ?auto_2563663 ?auto_2563666 ) ) ( not ( = ?auto_2563663 ?auto_2563667 ) ) ( not ( = ?auto_2563663 ?auto_2563668 ) ) ( not ( = ?auto_2563663 ?auto_2563669 ) ) ( not ( = ?auto_2563663 ?auto_2563670 ) ) ( not ( = ?auto_2563663 ?auto_2563671 ) ) ( not ( = ?auto_2563665 ?auto_2563664 ) ) ( not ( = ?auto_2563665 ?auto_2563666 ) ) ( not ( = ?auto_2563665 ?auto_2563667 ) ) ( not ( = ?auto_2563665 ?auto_2563668 ) ) ( not ( = ?auto_2563665 ?auto_2563669 ) ) ( not ( = ?auto_2563665 ?auto_2563670 ) ) ( not ( = ?auto_2563665 ?auto_2563671 ) ) ( not ( = ?auto_2563664 ?auto_2563666 ) ) ( not ( = ?auto_2563664 ?auto_2563667 ) ) ( not ( = ?auto_2563664 ?auto_2563668 ) ) ( not ( = ?auto_2563664 ?auto_2563669 ) ) ( not ( = ?auto_2563664 ?auto_2563670 ) ) ( not ( = ?auto_2563664 ?auto_2563671 ) ) ( not ( = ?auto_2563666 ?auto_2563667 ) ) ( not ( = ?auto_2563666 ?auto_2563668 ) ) ( not ( = ?auto_2563666 ?auto_2563669 ) ) ( not ( = ?auto_2563666 ?auto_2563670 ) ) ( not ( = ?auto_2563666 ?auto_2563671 ) ) ( not ( = ?auto_2563667 ?auto_2563668 ) ) ( not ( = ?auto_2563667 ?auto_2563669 ) ) ( not ( = ?auto_2563667 ?auto_2563670 ) ) ( not ( = ?auto_2563667 ?auto_2563671 ) ) ( not ( = ?auto_2563668 ?auto_2563669 ) ) ( not ( = ?auto_2563668 ?auto_2563670 ) ) ( not ( = ?auto_2563668 ?auto_2563671 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2563669 ?auto_2563670 ?auto_2563671 )
      ( MAKE-12CRATE-VERIFY ?auto_2563660 ?auto_2563661 ?auto_2563662 ?auto_2563659 ?auto_2563663 ?auto_2563665 ?auto_2563664 ?auto_2563666 ?auto_2563667 ?auto_2563668 ?auto_2563669 ?auto_2563670 ?auto_2563671 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2563822 - SURFACE
      ?auto_2563823 - SURFACE
      ?auto_2563824 - SURFACE
      ?auto_2563821 - SURFACE
      ?auto_2563825 - SURFACE
      ?auto_2563827 - SURFACE
      ?auto_2563826 - SURFACE
      ?auto_2563828 - SURFACE
      ?auto_2563829 - SURFACE
      ?auto_2563830 - SURFACE
      ?auto_2563831 - SURFACE
      ?auto_2563832 - SURFACE
      ?auto_2563833 - SURFACE
    )
    :vars
    (
      ?auto_2563834 - HOIST
      ?auto_2563836 - PLACE
      ?auto_2563837 - TRUCK
      ?auto_2563839 - PLACE
      ?auto_2563835 - HOIST
      ?auto_2563838 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2563834 ?auto_2563836 ) ( SURFACE-AT ?auto_2563832 ?auto_2563836 ) ( CLEAR ?auto_2563832 ) ( IS-CRATE ?auto_2563833 ) ( not ( = ?auto_2563832 ?auto_2563833 ) ) ( AVAILABLE ?auto_2563834 ) ( ON ?auto_2563832 ?auto_2563831 ) ( not ( = ?auto_2563831 ?auto_2563832 ) ) ( not ( = ?auto_2563831 ?auto_2563833 ) ) ( TRUCK-AT ?auto_2563837 ?auto_2563839 ) ( not ( = ?auto_2563839 ?auto_2563836 ) ) ( HOIST-AT ?auto_2563835 ?auto_2563839 ) ( not ( = ?auto_2563834 ?auto_2563835 ) ) ( AVAILABLE ?auto_2563835 ) ( SURFACE-AT ?auto_2563833 ?auto_2563839 ) ( ON ?auto_2563833 ?auto_2563838 ) ( CLEAR ?auto_2563833 ) ( not ( = ?auto_2563832 ?auto_2563838 ) ) ( not ( = ?auto_2563833 ?auto_2563838 ) ) ( not ( = ?auto_2563831 ?auto_2563838 ) ) ( ON ?auto_2563823 ?auto_2563822 ) ( ON ?auto_2563824 ?auto_2563823 ) ( ON ?auto_2563821 ?auto_2563824 ) ( ON ?auto_2563825 ?auto_2563821 ) ( ON ?auto_2563827 ?auto_2563825 ) ( ON ?auto_2563826 ?auto_2563827 ) ( ON ?auto_2563828 ?auto_2563826 ) ( ON ?auto_2563829 ?auto_2563828 ) ( ON ?auto_2563830 ?auto_2563829 ) ( ON ?auto_2563831 ?auto_2563830 ) ( not ( = ?auto_2563822 ?auto_2563823 ) ) ( not ( = ?auto_2563822 ?auto_2563824 ) ) ( not ( = ?auto_2563822 ?auto_2563821 ) ) ( not ( = ?auto_2563822 ?auto_2563825 ) ) ( not ( = ?auto_2563822 ?auto_2563827 ) ) ( not ( = ?auto_2563822 ?auto_2563826 ) ) ( not ( = ?auto_2563822 ?auto_2563828 ) ) ( not ( = ?auto_2563822 ?auto_2563829 ) ) ( not ( = ?auto_2563822 ?auto_2563830 ) ) ( not ( = ?auto_2563822 ?auto_2563831 ) ) ( not ( = ?auto_2563822 ?auto_2563832 ) ) ( not ( = ?auto_2563822 ?auto_2563833 ) ) ( not ( = ?auto_2563822 ?auto_2563838 ) ) ( not ( = ?auto_2563823 ?auto_2563824 ) ) ( not ( = ?auto_2563823 ?auto_2563821 ) ) ( not ( = ?auto_2563823 ?auto_2563825 ) ) ( not ( = ?auto_2563823 ?auto_2563827 ) ) ( not ( = ?auto_2563823 ?auto_2563826 ) ) ( not ( = ?auto_2563823 ?auto_2563828 ) ) ( not ( = ?auto_2563823 ?auto_2563829 ) ) ( not ( = ?auto_2563823 ?auto_2563830 ) ) ( not ( = ?auto_2563823 ?auto_2563831 ) ) ( not ( = ?auto_2563823 ?auto_2563832 ) ) ( not ( = ?auto_2563823 ?auto_2563833 ) ) ( not ( = ?auto_2563823 ?auto_2563838 ) ) ( not ( = ?auto_2563824 ?auto_2563821 ) ) ( not ( = ?auto_2563824 ?auto_2563825 ) ) ( not ( = ?auto_2563824 ?auto_2563827 ) ) ( not ( = ?auto_2563824 ?auto_2563826 ) ) ( not ( = ?auto_2563824 ?auto_2563828 ) ) ( not ( = ?auto_2563824 ?auto_2563829 ) ) ( not ( = ?auto_2563824 ?auto_2563830 ) ) ( not ( = ?auto_2563824 ?auto_2563831 ) ) ( not ( = ?auto_2563824 ?auto_2563832 ) ) ( not ( = ?auto_2563824 ?auto_2563833 ) ) ( not ( = ?auto_2563824 ?auto_2563838 ) ) ( not ( = ?auto_2563821 ?auto_2563825 ) ) ( not ( = ?auto_2563821 ?auto_2563827 ) ) ( not ( = ?auto_2563821 ?auto_2563826 ) ) ( not ( = ?auto_2563821 ?auto_2563828 ) ) ( not ( = ?auto_2563821 ?auto_2563829 ) ) ( not ( = ?auto_2563821 ?auto_2563830 ) ) ( not ( = ?auto_2563821 ?auto_2563831 ) ) ( not ( = ?auto_2563821 ?auto_2563832 ) ) ( not ( = ?auto_2563821 ?auto_2563833 ) ) ( not ( = ?auto_2563821 ?auto_2563838 ) ) ( not ( = ?auto_2563825 ?auto_2563827 ) ) ( not ( = ?auto_2563825 ?auto_2563826 ) ) ( not ( = ?auto_2563825 ?auto_2563828 ) ) ( not ( = ?auto_2563825 ?auto_2563829 ) ) ( not ( = ?auto_2563825 ?auto_2563830 ) ) ( not ( = ?auto_2563825 ?auto_2563831 ) ) ( not ( = ?auto_2563825 ?auto_2563832 ) ) ( not ( = ?auto_2563825 ?auto_2563833 ) ) ( not ( = ?auto_2563825 ?auto_2563838 ) ) ( not ( = ?auto_2563827 ?auto_2563826 ) ) ( not ( = ?auto_2563827 ?auto_2563828 ) ) ( not ( = ?auto_2563827 ?auto_2563829 ) ) ( not ( = ?auto_2563827 ?auto_2563830 ) ) ( not ( = ?auto_2563827 ?auto_2563831 ) ) ( not ( = ?auto_2563827 ?auto_2563832 ) ) ( not ( = ?auto_2563827 ?auto_2563833 ) ) ( not ( = ?auto_2563827 ?auto_2563838 ) ) ( not ( = ?auto_2563826 ?auto_2563828 ) ) ( not ( = ?auto_2563826 ?auto_2563829 ) ) ( not ( = ?auto_2563826 ?auto_2563830 ) ) ( not ( = ?auto_2563826 ?auto_2563831 ) ) ( not ( = ?auto_2563826 ?auto_2563832 ) ) ( not ( = ?auto_2563826 ?auto_2563833 ) ) ( not ( = ?auto_2563826 ?auto_2563838 ) ) ( not ( = ?auto_2563828 ?auto_2563829 ) ) ( not ( = ?auto_2563828 ?auto_2563830 ) ) ( not ( = ?auto_2563828 ?auto_2563831 ) ) ( not ( = ?auto_2563828 ?auto_2563832 ) ) ( not ( = ?auto_2563828 ?auto_2563833 ) ) ( not ( = ?auto_2563828 ?auto_2563838 ) ) ( not ( = ?auto_2563829 ?auto_2563830 ) ) ( not ( = ?auto_2563829 ?auto_2563831 ) ) ( not ( = ?auto_2563829 ?auto_2563832 ) ) ( not ( = ?auto_2563829 ?auto_2563833 ) ) ( not ( = ?auto_2563829 ?auto_2563838 ) ) ( not ( = ?auto_2563830 ?auto_2563831 ) ) ( not ( = ?auto_2563830 ?auto_2563832 ) ) ( not ( = ?auto_2563830 ?auto_2563833 ) ) ( not ( = ?auto_2563830 ?auto_2563838 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2563831 ?auto_2563832 ?auto_2563833 )
      ( MAKE-12CRATE-VERIFY ?auto_2563822 ?auto_2563823 ?auto_2563824 ?auto_2563821 ?auto_2563825 ?auto_2563827 ?auto_2563826 ?auto_2563828 ?auto_2563829 ?auto_2563830 ?auto_2563831 ?auto_2563832 ?auto_2563833 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2563985 - SURFACE
      ?auto_2563986 - SURFACE
      ?auto_2563987 - SURFACE
      ?auto_2563984 - SURFACE
      ?auto_2563988 - SURFACE
      ?auto_2563990 - SURFACE
      ?auto_2563989 - SURFACE
      ?auto_2563991 - SURFACE
      ?auto_2563992 - SURFACE
      ?auto_2563993 - SURFACE
      ?auto_2563994 - SURFACE
      ?auto_2563995 - SURFACE
      ?auto_2563996 - SURFACE
    )
    :vars
    (
      ?auto_2563999 - HOIST
      ?auto_2563998 - PLACE
      ?auto_2564000 - PLACE
      ?auto_2564002 - HOIST
      ?auto_2564001 - SURFACE
      ?auto_2563997 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2563999 ?auto_2563998 ) ( SURFACE-AT ?auto_2563995 ?auto_2563998 ) ( CLEAR ?auto_2563995 ) ( IS-CRATE ?auto_2563996 ) ( not ( = ?auto_2563995 ?auto_2563996 ) ) ( AVAILABLE ?auto_2563999 ) ( ON ?auto_2563995 ?auto_2563994 ) ( not ( = ?auto_2563994 ?auto_2563995 ) ) ( not ( = ?auto_2563994 ?auto_2563996 ) ) ( not ( = ?auto_2564000 ?auto_2563998 ) ) ( HOIST-AT ?auto_2564002 ?auto_2564000 ) ( not ( = ?auto_2563999 ?auto_2564002 ) ) ( AVAILABLE ?auto_2564002 ) ( SURFACE-AT ?auto_2563996 ?auto_2564000 ) ( ON ?auto_2563996 ?auto_2564001 ) ( CLEAR ?auto_2563996 ) ( not ( = ?auto_2563995 ?auto_2564001 ) ) ( not ( = ?auto_2563996 ?auto_2564001 ) ) ( not ( = ?auto_2563994 ?auto_2564001 ) ) ( TRUCK-AT ?auto_2563997 ?auto_2563998 ) ( ON ?auto_2563986 ?auto_2563985 ) ( ON ?auto_2563987 ?auto_2563986 ) ( ON ?auto_2563984 ?auto_2563987 ) ( ON ?auto_2563988 ?auto_2563984 ) ( ON ?auto_2563990 ?auto_2563988 ) ( ON ?auto_2563989 ?auto_2563990 ) ( ON ?auto_2563991 ?auto_2563989 ) ( ON ?auto_2563992 ?auto_2563991 ) ( ON ?auto_2563993 ?auto_2563992 ) ( ON ?auto_2563994 ?auto_2563993 ) ( not ( = ?auto_2563985 ?auto_2563986 ) ) ( not ( = ?auto_2563985 ?auto_2563987 ) ) ( not ( = ?auto_2563985 ?auto_2563984 ) ) ( not ( = ?auto_2563985 ?auto_2563988 ) ) ( not ( = ?auto_2563985 ?auto_2563990 ) ) ( not ( = ?auto_2563985 ?auto_2563989 ) ) ( not ( = ?auto_2563985 ?auto_2563991 ) ) ( not ( = ?auto_2563985 ?auto_2563992 ) ) ( not ( = ?auto_2563985 ?auto_2563993 ) ) ( not ( = ?auto_2563985 ?auto_2563994 ) ) ( not ( = ?auto_2563985 ?auto_2563995 ) ) ( not ( = ?auto_2563985 ?auto_2563996 ) ) ( not ( = ?auto_2563985 ?auto_2564001 ) ) ( not ( = ?auto_2563986 ?auto_2563987 ) ) ( not ( = ?auto_2563986 ?auto_2563984 ) ) ( not ( = ?auto_2563986 ?auto_2563988 ) ) ( not ( = ?auto_2563986 ?auto_2563990 ) ) ( not ( = ?auto_2563986 ?auto_2563989 ) ) ( not ( = ?auto_2563986 ?auto_2563991 ) ) ( not ( = ?auto_2563986 ?auto_2563992 ) ) ( not ( = ?auto_2563986 ?auto_2563993 ) ) ( not ( = ?auto_2563986 ?auto_2563994 ) ) ( not ( = ?auto_2563986 ?auto_2563995 ) ) ( not ( = ?auto_2563986 ?auto_2563996 ) ) ( not ( = ?auto_2563986 ?auto_2564001 ) ) ( not ( = ?auto_2563987 ?auto_2563984 ) ) ( not ( = ?auto_2563987 ?auto_2563988 ) ) ( not ( = ?auto_2563987 ?auto_2563990 ) ) ( not ( = ?auto_2563987 ?auto_2563989 ) ) ( not ( = ?auto_2563987 ?auto_2563991 ) ) ( not ( = ?auto_2563987 ?auto_2563992 ) ) ( not ( = ?auto_2563987 ?auto_2563993 ) ) ( not ( = ?auto_2563987 ?auto_2563994 ) ) ( not ( = ?auto_2563987 ?auto_2563995 ) ) ( not ( = ?auto_2563987 ?auto_2563996 ) ) ( not ( = ?auto_2563987 ?auto_2564001 ) ) ( not ( = ?auto_2563984 ?auto_2563988 ) ) ( not ( = ?auto_2563984 ?auto_2563990 ) ) ( not ( = ?auto_2563984 ?auto_2563989 ) ) ( not ( = ?auto_2563984 ?auto_2563991 ) ) ( not ( = ?auto_2563984 ?auto_2563992 ) ) ( not ( = ?auto_2563984 ?auto_2563993 ) ) ( not ( = ?auto_2563984 ?auto_2563994 ) ) ( not ( = ?auto_2563984 ?auto_2563995 ) ) ( not ( = ?auto_2563984 ?auto_2563996 ) ) ( not ( = ?auto_2563984 ?auto_2564001 ) ) ( not ( = ?auto_2563988 ?auto_2563990 ) ) ( not ( = ?auto_2563988 ?auto_2563989 ) ) ( not ( = ?auto_2563988 ?auto_2563991 ) ) ( not ( = ?auto_2563988 ?auto_2563992 ) ) ( not ( = ?auto_2563988 ?auto_2563993 ) ) ( not ( = ?auto_2563988 ?auto_2563994 ) ) ( not ( = ?auto_2563988 ?auto_2563995 ) ) ( not ( = ?auto_2563988 ?auto_2563996 ) ) ( not ( = ?auto_2563988 ?auto_2564001 ) ) ( not ( = ?auto_2563990 ?auto_2563989 ) ) ( not ( = ?auto_2563990 ?auto_2563991 ) ) ( not ( = ?auto_2563990 ?auto_2563992 ) ) ( not ( = ?auto_2563990 ?auto_2563993 ) ) ( not ( = ?auto_2563990 ?auto_2563994 ) ) ( not ( = ?auto_2563990 ?auto_2563995 ) ) ( not ( = ?auto_2563990 ?auto_2563996 ) ) ( not ( = ?auto_2563990 ?auto_2564001 ) ) ( not ( = ?auto_2563989 ?auto_2563991 ) ) ( not ( = ?auto_2563989 ?auto_2563992 ) ) ( not ( = ?auto_2563989 ?auto_2563993 ) ) ( not ( = ?auto_2563989 ?auto_2563994 ) ) ( not ( = ?auto_2563989 ?auto_2563995 ) ) ( not ( = ?auto_2563989 ?auto_2563996 ) ) ( not ( = ?auto_2563989 ?auto_2564001 ) ) ( not ( = ?auto_2563991 ?auto_2563992 ) ) ( not ( = ?auto_2563991 ?auto_2563993 ) ) ( not ( = ?auto_2563991 ?auto_2563994 ) ) ( not ( = ?auto_2563991 ?auto_2563995 ) ) ( not ( = ?auto_2563991 ?auto_2563996 ) ) ( not ( = ?auto_2563991 ?auto_2564001 ) ) ( not ( = ?auto_2563992 ?auto_2563993 ) ) ( not ( = ?auto_2563992 ?auto_2563994 ) ) ( not ( = ?auto_2563992 ?auto_2563995 ) ) ( not ( = ?auto_2563992 ?auto_2563996 ) ) ( not ( = ?auto_2563992 ?auto_2564001 ) ) ( not ( = ?auto_2563993 ?auto_2563994 ) ) ( not ( = ?auto_2563993 ?auto_2563995 ) ) ( not ( = ?auto_2563993 ?auto_2563996 ) ) ( not ( = ?auto_2563993 ?auto_2564001 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2563994 ?auto_2563995 ?auto_2563996 )
      ( MAKE-12CRATE-VERIFY ?auto_2563985 ?auto_2563986 ?auto_2563987 ?auto_2563984 ?auto_2563988 ?auto_2563990 ?auto_2563989 ?auto_2563991 ?auto_2563992 ?auto_2563993 ?auto_2563994 ?auto_2563995 ?auto_2563996 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2564148 - SURFACE
      ?auto_2564149 - SURFACE
      ?auto_2564150 - SURFACE
      ?auto_2564147 - SURFACE
      ?auto_2564151 - SURFACE
      ?auto_2564153 - SURFACE
      ?auto_2564152 - SURFACE
      ?auto_2564154 - SURFACE
      ?auto_2564155 - SURFACE
      ?auto_2564156 - SURFACE
      ?auto_2564157 - SURFACE
      ?auto_2564158 - SURFACE
      ?auto_2564159 - SURFACE
    )
    :vars
    (
      ?auto_2564160 - HOIST
      ?auto_2564162 - PLACE
      ?auto_2564165 - PLACE
      ?auto_2564164 - HOIST
      ?auto_2564163 - SURFACE
      ?auto_2564161 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2564160 ?auto_2564162 ) ( IS-CRATE ?auto_2564159 ) ( not ( = ?auto_2564158 ?auto_2564159 ) ) ( not ( = ?auto_2564157 ?auto_2564158 ) ) ( not ( = ?auto_2564157 ?auto_2564159 ) ) ( not ( = ?auto_2564165 ?auto_2564162 ) ) ( HOIST-AT ?auto_2564164 ?auto_2564165 ) ( not ( = ?auto_2564160 ?auto_2564164 ) ) ( AVAILABLE ?auto_2564164 ) ( SURFACE-AT ?auto_2564159 ?auto_2564165 ) ( ON ?auto_2564159 ?auto_2564163 ) ( CLEAR ?auto_2564159 ) ( not ( = ?auto_2564158 ?auto_2564163 ) ) ( not ( = ?auto_2564159 ?auto_2564163 ) ) ( not ( = ?auto_2564157 ?auto_2564163 ) ) ( TRUCK-AT ?auto_2564161 ?auto_2564162 ) ( SURFACE-AT ?auto_2564157 ?auto_2564162 ) ( CLEAR ?auto_2564157 ) ( LIFTING ?auto_2564160 ?auto_2564158 ) ( IS-CRATE ?auto_2564158 ) ( ON ?auto_2564149 ?auto_2564148 ) ( ON ?auto_2564150 ?auto_2564149 ) ( ON ?auto_2564147 ?auto_2564150 ) ( ON ?auto_2564151 ?auto_2564147 ) ( ON ?auto_2564153 ?auto_2564151 ) ( ON ?auto_2564152 ?auto_2564153 ) ( ON ?auto_2564154 ?auto_2564152 ) ( ON ?auto_2564155 ?auto_2564154 ) ( ON ?auto_2564156 ?auto_2564155 ) ( ON ?auto_2564157 ?auto_2564156 ) ( not ( = ?auto_2564148 ?auto_2564149 ) ) ( not ( = ?auto_2564148 ?auto_2564150 ) ) ( not ( = ?auto_2564148 ?auto_2564147 ) ) ( not ( = ?auto_2564148 ?auto_2564151 ) ) ( not ( = ?auto_2564148 ?auto_2564153 ) ) ( not ( = ?auto_2564148 ?auto_2564152 ) ) ( not ( = ?auto_2564148 ?auto_2564154 ) ) ( not ( = ?auto_2564148 ?auto_2564155 ) ) ( not ( = ?auto_2564148 ?auto_2564156 ) ) ( not ( = ?auto_2564148 ?auto_2564157 ) ) ( not ( = ?auto_2564148 ?auto_2564158 ) ) ( not ( = ?auto_2564148 ?auto_2564159 ) ) ( not ( = ?auto_2564148 ?auto_2564163 ) ) ( not ( = ?auto_2564149 ?auto_2564150 ) ) ( not ( = ?auto_2564149 ?auto_2564147 ) ) ( not ( = ?auto_2564149 ?auto_2564151 ) ) ( not ( = ?auto_2564149 ?auto_2564153 ) ) ( not ( = ?auto_2564149 ?auto_2564152 ) ) ( not ( = ?auto_2564149 ?auto_2564154 ) ) ( not ( = ?auto_2564149 ?auto_2564155 ) ) ( not ( = ?auto_2564149 ?auto_2564156 ) ) ( not ( = ?auto_2564149 ?auto_2564157 ) ) ( not ( = ?auto_2564149 ?auto_2564158 ) ) ( not ( = ?auto_2564149 ?auto_2564159 ) ) ( not ( = ?auto_2564149 ?auto_2564163 ) ) ( not ( = ?auto_2564150 ?auto_2564147 ) ) ( not ( = ?auto_2564150 ?auto_2564151 ) ) ( not ( = ?auto_2564150 ?auto_2564153 ) ) ( not ( = ?auto_2564150 ?auto_2564152 ) ) ( not ( = ?auto_2564150 ?auto_2564154 ) ) ( not ( = ?auto_2564150 ?auto_2564155 ) ) ( not ( = ?auto_2564150 ?auto_2564156 ) ) ( not ( = ?auto_2564150 ?auto_2564157 ) ) ( not ( = ?auto_2564150 ?auto_2564158 ) ) ( not ( = ?auto_2564150 ?auto_2564159 ) ) ( not ( = ?auto_2564150 ?auto_2564163 ) ) ( not ( = ?auto_2564147 ?auto_2564151 ) ) ( not ( = ?auto_2564147 ?auto_2564153 ) ) ( not ( = ?auto_2564147 ?auto_2564152 ) ) ( not ( = ?auto_2564147 ?auto_2564154 ) ) ( not ( = ?auto_2564147 ?auto_2564155 ) ) ( not ( = ?auto_2564147 ?auto_2564156 ) ) ( not ( = ?auto_2564147 ?auto_2564157 ) ) ( not ( = ?auto_2564147 ?auto_2564158 ) ) ( not ( = ?auto_2564147 ?auto_2564159 ) ) ( not ( = ?auto_2564147 ?auto_2564163 ) ) ( not ( = ?auto_2564151 ?auto_2564153 ) ) ( not ( = ?auto_2564151 ?auto_2564152 ) ) ( not ( = ?auto_2564151 ?auto_2564154 ) ) ( not ( = ?auto_2564151 ?auto_2564155 ) ) ( not ( = ?auto_2564151 ?auto_2564156 ) ) ( not ( = ?auto_2564151 ?auto_2564157 ) ) ( not ( = ?auto_2564151 ?auto_2564158 ) ) ( not ( = ?auto_2564151 ?auto_2564159 ) ) ( not ( = ?auto_2564151 ?auto_2564163 ) ) ( not ( = ?auto_2564153 ?auto_2564152 ) ) ( not ( = ?auto_2564153 ?auto_2564154 ) ) ( not ( = ?auto_2564153 ?auto_2564155 ) ) ( not ( = ?auto_2564153 ?auto_2564156 ) ) ( not ( = ?auto_2564153 ?auto_2564157 ) ) ( not ( = ?auto_2564153 ?auto_2564158 ) ) ( not ( = ?auto_2564153 ?auto_2564159 ) ) ( not ( = ?auto_2564153 ?auto_2564163 ) ) ( not ( = ?auto_2564152 ?auto_2564154 ) ) ( not ( = ?auto_2564152 ?auto_2564155 ) ) ( not ( = ?auto_2564152 ?auto_2564156 ) ) ( not ( = ?auto_2564152 ?auto_2564157 ) ) ( not ( = ?auto_2564152 ?auto_2564158 ) ) ( not ( = ?auto_2564152 ?auto_2564159 ) ) ( not ( = ?auto_2564152 ?auto_2564163 ) ) ( not ( = ?auto_2564154 ?auto_2564155 ) ) ( not ( = ?auto_2564154 ?auto_2564156 ) ) ( not ( = ?auto_2564154 ?auto_2564157 ) ) ( not ( = ?auto_2564154 ?auto_2564158 ) ) ( not ( = ?auto_2564154 ?auto_2564159 ) ) ( not ( = ?auto_2564154 ?auto_2564163 ) ) ( not ( = ?auto_2564155 ?auto_2564156 ) ) ( not ( = ?auto_2564155 ?auto_2564157 ) ) ( not ( = ?auto_2564155 ?auto_2564158 ) ) ( not ( = ?auto_2564155 ?auto_2564159 ) ) ( not ( = ?auto_2564155 ?auto_2564163 ) ) ( not ( = ?auto_2564156 ?auto_2564157 ) ) ( not ( = ?auto_2564156 ?auto_2564158 ) ) ( not ( = ?auto_2564156 ?auto_2564159 ) ) ( not ( = ?auto_2564156 ?auto_2564163 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2564157 ?auto_2564158 ?auto_2564159 )
      ( MAKE-12CRATE-VERIFY ?auto_2564148 ?auto_2564149 ?auto_2564150 ?auto_2564147 ?auto_2564151 ?auto_2564153 ?auto_2564152 ?auto_2564154 ?auto_2564155 ?auto_2564156 ?auto_2564157 ?auto_2564158 ?auto_2564159 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2564311 - SURFACE
      ?auto_2564312 - SURFACE
      ?auto_2564313 - SURFACE
      ?auto_2564310 - SURFACE
      ?auto_2564314 - SURFACE
      ?auto_2564316 - SURFACE
      ?auto_2564315 - SURFACE
      ?auto_2564317 - SURFACE
      ?auto_2564318 - SURFACE
      ?auto_2564319 - SURFACE
      ?auto_2564320 - SURFACE
      ?auto_2564321 - SURFACE
      ?auto_2564322 - SURFACE
    )
    :vars
    (
      ?auto_2564325 - HOIST
      ?auto_2564324 - PLACE
      ?auto_2564323 - PLACE
      ?auto_2564326 - HOIST
      ?auto_2564327 - SURFACE
      ?auto_2564328 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2564325 ?auto_2564324 ) ( IS-CRATE ?auto_2564322 ) ( not ( = ?auto_2564321 ?auto_2564322 ) ) ( not ( = ?auto_2564320 ?auto_2564321 ) ) ( not ( = ?auto_2564320 ?auto_2564322 ) ) ( not ( = ?auto_2564323 ?auto_2564324 ) ) ( HOIST-AT ?auto_2564326 ?auto_2564323 ) ( not ( = ?auto_2564325 ?auto_2564326 ) ) ( AVAILABLE ?auto_2564326 ) ( SURFACE-AT ?auto_2564322 ?auto_2564323 ) ( ON ?auto_2564322 ?auto_2564327 ) ( CLEAR ?auto_2564322 ) ( not ( = ?auto_2564321 ?auto_2564327 ) ) ( not ( = ?auto_2564322 ?auto_2564327 ) ) ( not ( = ?auto_2564320 ?auto_2564327 ) ) ( TRUCK-AT ?auto_2564328 ?auto_2564324 ) ( SURFACE-AT ?auto_2564320 ?auto_2564324 ) ( CLEAR ?auto_2564320 ) ( IS-CRATE ?auto_2564321 ) ( AVAILABLE ?auto_2564325 ) ( IN ?auto_2564321 ?auto_2564328 ) ( ON ?auto_2564312 ?auto_2564311 ) ( ON ?auto_2564313 ?auto_2564312 ) ( ON ?auto_2564310 ?auto_2564313 ) ( ON ?auto_2564314 ?auto_2564310 ) ( ON ?auto_2564316 ?auto_2564314 ) ( ON ?auto_2564315 ?auto_2564316 ) ( ON ?auto_2564317 ?auto_2564315 ) ( ON ?auto_2564318 ?auto_2564317 ) ( ON ?auto_2564319 ?auto_2564318 ) ( ON ?auto_2564320 ?auto_2564319 ) ( not ( = ?auto_2564311 ?auto_2564312 ) ) ( not ( = ?auto_2564311 ?auto_2564313 ) ) ( not ( = ?auto_2564311 ?auto_2564310 ) ) ( not ( = ?auto_2564311 ?auto_2564314 ) ) ( not ( = ?auto_2564311 ?auto_2564316 ) ) ( not ( = ?auto_2564311 ?auto_2564315 ) ) ( not ( = ?auto_2564311 ?auto_2564317 ) ) ( not ( = ?auto_2564311 ?auto_2564318 ) ) ( not ( = ?auto_2564311 ?auto_2564319 ) ) ( not ( = ?auto_2564311 ?auto_2564320 ) ) ( not ( = ?auto_2564311 ?auto_2564321 ) ) ( not ( = ?auto_2564311 ?auto_2564322 ) ) ( not ( = ?auto_2564311 ?auto_2564327 ) ) ( not ( = ?auto_2564312 ?auto_2564313 ) ) ( not ( = ?auto_2564312 ?auto_2564310 ) ) ( not ( = ?auto_2564312 ?auto_2564314 ) ) ( not ( = ?auto_2564312 ?auto_2564316 ) ) ( not ( = ?auto_2564312 ?auto_2564315 ) ) ( not ( = ?auto_2564312 ?auto_2564317 ) ) ( not ( = ?auto_2564312 ?auto_2564318 ) ) ( not ( = ?auto_2564312 ?auto_2564319 ) ) ( not ( = ?auto_2564312 ?auto_2564320 ) ) ( not ( = ?auto_2564312 ?auto_2564321 ) ) ( not ( = ?auto_2564312 ?auto_2564322 ) ) ( not ( = ?auto_2564312 ?auto_2564327 ) ) ( not ( = ?auto_2564313 ?auto_2564310 ) ) ( not ( = ?auto_2564313 ?auto_2564314 ) ) ( not ( = ?auto_2564313 ?auto_2564316 ) ) ( not ( = ?auto_2564313 ?auto_2564315 ) ) ( not ( = ?auto_2564313 ?auto_2564317 ) ) ( not ( = ?auto_2564313 ?auto_2564318 ) ) ( not ( = ?auto_2564313 ?auto_2564319 ) ) ( not ( = ?auto_2564313 ?auto_2564320 ) ) ( not ( = ?auto_2564313 ?auto_2564321 ) ) ( not ( = ?auto_2564313 ?auto_2564322 ) ) ( not ( = ?auto_2564313 ?auto_2564327 ) ) ( not ( = ?auto_2564310 ?auto_2564314 ) ) ( not ( = ?auto_2564310 ?auto_2564316 ) ) ( not ( = ?auto_2564310 ?auto_2564315 ) ) ( not ( = ?auto_2564310 ?auto_2564317 ) ) ( not ( = ?auto_2564310 ?auto_2564318 ) ) ( not ( = ?auto_2564310 ?auto_2564319 ) ) ( not ( = ?auto_2564310 ?auto_2564320 ) ) ( not ( = ?auto_2564310 ?auto_2564321 ) ) ( not ( = ?auto_2564310 ?auto_2564322 ) ) ( not ( = ?auto_2564310 ?auto_2564327 ) ) ( not ( = ?auto_2564314 ?auto_2564316 ) ) ( not ( = ?auto_2564314 ?auto_2564315 ) ) ( not ( = ?auto_2564314 ?auto_2564317 ) ) ( not ( = ?auto_2564314 ?auto_2564318 ) ) ( not ( = ?auto_2564314 ?auto_2564319 ) ) ( not ( = ?auto_2564314 ?auto_2564320 ) ) ( not ( = ?auto_2564314 ?auto_2564321 ) ) ( not ( = ?auto_2564314 ?auto_2564322 ) ) ( not ( = ?auto_2564314 ?auto_2564327 ) ) ( not ( = ?auto_2564316 ?auto_2564315 ) ) ( not ( = ?auto_2564316 ?auto_2564317 ) ) ( not ( = ?auto_2564316 ?auto_2564318 ) ) ( not ( = ?auto_2564316 ?auto_2564319 ) ) ( not ( = ?auto_2564316 ?auto_2564320 ) ) ( not ( = ?auto_2564316 ?auto_2564321 ) ) ( not ( = ?auto_2564316 ?auto_2564322 ) ) ( not ( = ?auto_2564316 ?auto_2564327 ) ) ( not ( = ?auto_2564315 ?auto_2564317 ) ) ( not ( = ?auto_2564315 ?auto_2564318 ) ) ( not ( = ?auto_2564315 ?auto_2564319 ) ) ( not ( = ?auto_2564315 ?auto_2564320 ) ) ( not ( = ?auto_2564315 ?auto_2564321 ) ) ( not ( = ?auto_2564315 ?auto_2564322 ) ) ( not ( = ?auto_2564315 ?auto_2564327 ) ) ( not ( = ?auto_2564317 ?auto_2564318 ) ) ( not ( = ?auto_2564317 ?auto_2564319 ) ) ( not ( = ?auto_2564317 ?auto_2564320 ) ) ( not ( = ?auto_2564317 ?auto_2564321 ) ) ( not ( = ?auto_2564317 ?auto_2564322 ) ) ( not ( = ?auto_2564317 ?auto_2564327 ) ) ( not ( = ?auto_2564318 ?auto_2564319 ) ) ( not ( = ?auto_2564318 ?auto_2564320 ) ) ( not ( = ?auto_2564318 ?auto_2564321 ) ) ( not ( = ?auto_2564318 ?auto_2564322 ) ) ( not ( = ?auto_2564318 ?auto_2564327 ) ) ( not ( = ?auto_2564319 ?auto_2564320 ) ) ( not ( = ?auto_2564319 ?auto_2564321 ) ) ( not ( = ?auto_2564319 ?auto_2564322 ) ) ( not ( = ?auto_2564319 ?auto_2564327 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2564320 ?auto_2564321 ?auto_2564322 )
      ( MAKE-12CRATE-VERIFY ?auto_2564311 ?auto_2564312 ?auto_2564313 ?auto_2564310 ?auto_2564314 ?auto_2564316 ?auto_2564315 ?auto_2564317 ?auto_2564318 ?auto_2564319 ?auto_2564320 ?auto_2564321 ?auto_2564322 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2575915 - SURFACE
      ?auto_2575916 - SURFACE
      ?auto_2575917 - SURFACE
      ?auto_2575914 - SURFACE
      ?auto_2575918 - SURFACE
      ?auto_2575920 - SURFACE
      ?auto_2575919 - SURFACE
      ?auto_2575921 - SURFACE
      ?auto_2575922 - SURFACE
      ?auto_2575923 - SURFACE
      ?auto_2575924 - SURFACE
      ?auto_2575925 - SURFACE
      ?auto_2575926 - SURFACE
      ?auto_2575927 - SURFACE
    )
    :vars
    (
      ?auto_2575928 - HOIST
      ?auto_2575929 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2575928 ?auto_2575929 ) ( SURFACE-AT ?auto_2575926 ?auto_2575929 ) ( CLEAR ?auto_2575926 ) ( LIFTING ?auto_2575928 ?auto_2575927 ) ( IS-CRATE ?auto_2575927 ) ( not ( = ?auto_2575926 ?auto_2575927 ) ) ( ON ?auto_2575916 ?auto_2575915 ) ( ON ?auto_2575917 ?auto_2575916 ) ( ON ?auto_2575914 ?auto_2575917 ) ( ON ?auto_2575918 ?auto_2575914 ) ( ON ?auto_2575920 ?auto_2575918 ) ( ON ?auto_2575919 ?auto_2575920 ) ( ON ?auto_2575921 ?auto_2575919 ) ( ON ?auto_2575922 ?auto_2575921 ) ( ON ?auto_2575923 ?auto_2575922 ) ( ON ?auto_2575924 ?auto_2575923 ) ( ON ?auto_2575925 ?auto_2575924 ) ( ON ?auto_2575926 ?auto_2575925 ) ( not ( = ?auto_2575915 ?auto_2575916 ) ) ( not ( = ?auto_2575915 ?auto_2575917 ) ) ( not ( = ?auto_2575915 ?auto_2575914 ) ) ( not ( = ?auto_2575915 ?auto_2575918 ) ) ( not ( = ?auto_2575915 ?auto_2575920 ) ) ( not ( = ?auto_2575915 ?auto_2575919 ) ) ( not ( = ?auto_2575915 ?auto_2575921 ) ) ( not ( = ?auto_2575915 ?auto_2575922 ) ) ( not ( = ?auto_2575915 ?auto_2575923 ) ) ( not ( = ?auto_2575915 ?auto_2575924 ) ) ( not ( = ?auto_2575915 ?auto_2575925 ) ) ( not ( = ?auto_2575915 ?auto_2575926 ) ) ( not ( = ?auto_2575915 ?auto_2575927 ) ) ( not ( = ?auto_2575916 ?auto_2575917 ) ) ( not ( = ?auto_2575916 ?auto_2575914 ) ) ( not ( = ?auto_2575916 ?auto_2575918 ) ) ( not ( = ?auto_2575916 ?auto_2575920 ) ) ( not ( = ?auto_2575916 ?auto_2575919 ) ) ( not ( = ?auto_2575916 ?auto_2575921 ) ) ( not ( = ?auto_2575916 ?auto_2575922 ) ) ( not ( = ?auto_2575916 ?auto_2575923 ) ) ( not ( = ?auto_2575916 ?auto_2575924 ) ) ( not ( = ?auto_2575916 ?auto_2575925 ) ) ( not ( = ?auto_2575916 ?auto_2575926 ) ) ( not ( = ?auto_2575916 ?auto_2575927 ) ) ( not ( = ?auto_2575917 ?auto_2575914 ) ) ( not ( = ?auto_2575917 ?auto_2575918 ) ) ( not ( = ?auto_2575917 ?auto_2575920 ) ) ( not ( = ?auto_2575917 ?auto_2575919 ) ) ( not ( = ?auto_2575917 ?auto_2575921 ) ) ( not ( = ?auto_2575917 ?auto_2575922 ) ) ( not ( = ?auto_2575917 ?auto_2575923 ) ) ( not ( = ?auto_2575917 ?auto_2575924 ) ) ( not ( = ?auto_2575917 ?auto_2575925 ) ) ( not ( = ?auto_2575917 ?auto_2575926 ) ) ( not ( = ?auto_2575917 ?auto_2575927 ) ) ( not ( = ?auto_2575914 ?auto_2575918 ) ) ( not ( = ?auto_2575914 ?auto_2575920 ) ) ( not ( = ?auto_2575914 ?auto_2575919 ) ) ( not ( = ?auto_2575914 ?auto_2575921 ) ) ( not ( = ?auto_2575914 ?auto_2575922 ) ) ( not ( = ?auto_2575914 ?auto_2575923 ) ) ( not ( = ?auto_2575914 ?auto_2575924 ) ) ( not ( = ?auto_2575914 ?auto_2575925 ) ) ( not ( = ?auto_2575914 ?auto_2575926 ) ) ( not ( = ?auto_2575914 ?auto_2575927 ) ) ( not ( = ?auto_2575918 ?auto_2575920 ) ) ( not ( = ?auto_2575918 ?auto_2575919 ) ) ( not ( = ?auto_2575918 ?auto_2575921 ) ) ( not ( = ?auto_2575918 ?auto_2575922 ) ) ( not ( = ?auto_2575918 ?auto_2575923 ) ) ( not ( = ?auto_2575918 ?auto_2575924 ) ) ( not ( = ?auto_2575918 ?auto_2575925 ) ) ( not ( = ?auto_2575918 ?auto_2575926 ) ) ( not ( = ?auto_2575918 ?auto_2575927 ) ) ( not ( = ?auto_2575920 ?auto_2575919 ) ) ( not ( = ?auto_2575920 ?auto_2575921 ) ) ( not ( = ?auto_2575920 ?auto_2575922 ) ) ( not ( = ?auto_2575920 ?auto_2575923 ) ) ( not ( = ?auto_2575920 ?auto_2575924 ) ) ( not ( = ?auto_2575920 ?auto_2575925 ) ) ( not ( = ?auto_2575920 ?auto_2575926 ) ) ( not ( = ?auto_2575920 ?auto_2575927 ) ) ( not ( = ?auto_2575919 ?auto_2575921 ) ) ( not ( = ?auto_2575919 ?auto_2575922 ) ) ( not ( = ?auto_2575919 ?auto_2575923 ) ) ( not ( = ?auto_2575919 ?auto_2575924 ) ) ( not ( = ?auto_2575919 ?auto_2575925 ) ) ( not ( = ?auto_2575919 ?auto_2575926 ) ) ( not ( = ?auto_2575919 ?auto_2575927 ) ) ( not ( = ?auto_2575921 ?auto_2575922 ) ) ( not ( = ?auto_2575921 ?auto_2575923 ) ) ( not ( = ?auto_2575921 ?auto_2575924 ) ) ( not ( = ?auto_2575921 ?auto_2575925 ) ) ( not ( = ?auto_2575921 ?auto_2575926 ) ) ( not ( = ?auto_2575921 ?auto_2575927 ) ) ( not ( = ?auto_2575922 ?auto_2575923 ) ) ( not ( = ?auto_2575922 ?auto_2575924 ) ) ( not ( = ?auto_2575922 ?auto_2575925 ) ) ( not ( = ?auto_2575922 ?auto_2575926 ) ) ( not ( = ?auto_2575922 ?auto_2575927 ) ) ( not ( = ?auto_2575923 ?auto_2575924 ) ) ( not ( = ?auto_2575923 ?auto_2575925 ) ) ( not ( = ?auto_2575923 ?auto_2575926 ) ) ( not ( = ?auto_2575923 ?auto_2575927 ) ) ( not ( = ?auto_2575924 ?auto_2575925 ) ) ( not ( = ?auto_2575924 ?auto_2575926 ) ) ( not ( = ?auto_2575924 ?auto_2575927 ) ) ( not ( = ?auto_2575925 ?auto_2575926 ) ) ( not ( = ?auto_2575925 ?auto_2575927 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2575926 ?auto_2575927 )
      ( MAKE-13CRATE-VERIFY ?auto_2575915 ?auto_2575916 ?auto_2575917 ?auto_2575914 ?auto_2575918 ?auto_2575920 ?auto_2575919 ?auto_2575921 ?auto_2575922 ?auto_2575923 ?auto_2575924 ?auto_2575925 ?auto_2575926 ?auto_2575927 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2576057 - SURFACE
      ?auto_2576058 - SURFACE
      ?auto_2576059 - SURFACE
      ?auto_2576056 - SURFACE
      ?auto_2576060 - SURFACE
      ?auto_2576062 - SURFACE
      ?auto_2576061 - SURFACE
      ?auto_2576063 - SURFACE
      ?auto_2576064 - SURFACE
      ?auto_2576065 - SURFACE
      ?auto_2576066 - SURFACE
      ?auto_2576067 - SURFACE
      ?auto_2576068 - SURFACE
      ?auto_2576069 - SURFACE
    )
    :vars
    (
      ?auto_2576070 - HOIST
      ?auto_2576071 - PLACE
      ?auto_2576072 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2576070 ?auto_2576071 ) ( SURFACE-AT ?auto_2576068 ?auto_2576071 ) ( CLEAR ?auto_2576068 ) ( IS-CRATE ?auto_2576069 ) ( not ( = ?auto_2576068 ?auto_2576069 ) ) ( TRUCK-AT ?auto_2576072 ?auto_2576071 ) ( AVAILABLE ?auto_2576070 ) ( IN ?auto_2576069 ?auto_2576072 ) ( ON ?auto_2576068 ?auto_2576067 ) ( not ( = ?auto_2576067 ?auto_2576068 ) ) ( not ( = ?auto_2576067 ?auto_2576069 ) ) ( ON ?auto_2576058 ?auto_2576057 ) ( ON ?auto_2576059 ?auto_2576058 ) ( ON ?auto_2576056 ?auto_2576059 ) ( ON ?auto_2576060 ?auto_2576056 ) ( ON ?auto_2576062 ?auto_2576060 ) ( ON ?auto_2576061 ?auto_2576062 ) ( ON ?auto_2576063 ?auto_2576061 ) ( ON ?auto_2576064 ?auto_2576063 ) ( ON ?auto_2576065 ?auto_2576064 ) ( ON ?auto_2576066 ?auto_2576065 ) ( ON ?auto_2576067 ?auto_2576066 ) ( not ( = ?auto_2576057 ?auto_2576058 ) ) ( not ( = ?auto_2576057 ?auto_2576059 ) ) ( not ( = ?auto_2576057 ?auto_2576056 ) ) ( not ( = ?auto_2576057 ?auto_2576060 ) ) ( not ( = ?auto_2576057 ?auto_2576062 ) ) ( not ( = ?auto_2576057 ?auto_2576061 ) ) ( not ( = ?auto_2576057 ?auto_2576063 ) ) ( not ( = ?auto_2576057 ?auto_2576064 ) ) ( not ( = ?auto_2576057 ?auto_2576065 ) ) ( not ( = ?auto_2576057 ?auto_2576066 ) ) ( not ( = ?auto_2576057 ?auto_2576067 ) ) ( not ( = ?auto_2576057 ?auto_2576068 ) ) ( not ( = ?auto_2576057 ?auto_2576069 ) ) ( not ( = ?auto_2576058 ?auto_2576059 ) ) ( not ( = ?auto_2576058 ?auto_2576056 ) ) ( not ( = ?auto_2576058 ?auto_2576060 ) ) ( not ( = ?auto_2576058 ?auto_2576062 ) ) ( not ( = ?auto_2576058 ?auto_2576061 ) ) ( not ( = ?auto_2576058 ?auto_2576063 ) ) ( not ( = ?auto_2576058 ?auto_2576064 ) ) ( not ( = ?auto_2576058 ?auto_2576065 ) ) ( not ( = ?auto_2576058 ?auto_2576066 ) ) ( not ( = ?auto_2576058 ?auto_2576067 ) ) ( not ( = ?auto_2576058 ?auto_2576068 ) ) ( not ( = ?auto_2576058 ?auto_2576069 ) ) ( not ( = ?auto_2576059 ?auto_2576056 ) ) ( not ( = ?auto_2576059 ?auto_2576060 ) ) ( not ( = ?auto_2576059 ?auto_2576062 ) ) ( not ( = ?auto_2576059 ?auto_2576061 ) ) ( not ( = ?auto_2576059 ?auto_2576063 ) ) ( not ( = ?auto_2576059 ?auto_2576064 ) ) ( not ( = ?auto_2576059 ?auto_2576065 ) ) ( not ( = ?auto_2576059 ?auto_2576066 ) ) ( not ( = ?auto_2576059 ?auto_2576067 ) ) ( not ( = ?auto_2576059 ?auto_2576068 ) ) ( not ( = ?auto_2576059 ?auto_2576069 ) ) ( not ( = ?auto_2576056 ?auto_2576060 ) ) ( not ( = ?auto_2576056 ?auto_2576062 ) ) ( not ( = ?auto_2576056 ?auto_2576061 ) ) ( not ( = ?auto_2576056 ?auto_2576063 ) ) ( not ( = ?auto_2576056 ?auto_2576064 ) ) ( not ( = ?auto_2576056 ?auto_2576065 ) ) ( not ( = ?auto_2576056 ?auto_2576066 ) ) ( not ( = ?auto_2576056 ?auto_2576067 ) ) ( not ( = ?auto_2576056 ?auto_2576068 ) ) ( not ( = ?auto_2576056 ?auto_2576069 ) ) ( not ( = ?auto_2576060 ?auto_2576062 ) ) ( not ( = ?auto_2576060 ?auto_2576061 ) ) ( not ( = ?auto_2576060 ?auto_2576063 ) ) ( not ( = ?auto_2576060 ?auto_2576064 ) ) ( not ( = ?auto_2576060 ?auto_2576065 ) ) ( not ( = ?auto_2576060 ?auto_2576066 ) ) ( not ( = ?auto_2576060 ?auto_2576067 ) ) ( not ( = ?auto_2576060 ?auto_2576068 ) ) ( not ( = ?auto_2576060 ?auto_2576069 ) ) ( not ( = ?auto_2576062 ?auto_2576061 ) ) ( not ( = ?auto_2576062 ?auto_2576063 ) ) ( not ( = ?auto_2576062 ?auto_2576064 ) ) ( not ( = ?auto_2576062 ?auto_2576065 ) ) ( not ( = ?auto_2576062 ?auto_2576066 ) ) ( not ( = ?auto_2576062 ?auto_2576067 ) ) ( not ( = ?auto_2576062 ?auto_2576068 ) ) ( not ( = ?auto_2576062 ?auto_2576069 ) ) ( not ( = ?auto_2576061 ?auto_2576063 ) ) ( not ( = ?auto_2576061 ?auto_2576064 ) ) ( not ( = ?auto_2576061 ?auto_2576065 ) ) ( not ( = ?auto_2576061 ?auto_2576066 ) ) ( not ( = ?auto_2576061 ?auto_2576067 ) ) ( not ( = ?auto_2576061 ?auto_2576068 ) ) ( not ( = ?auto_2576061 ?auto_2576069 ) ) ( not ( = ?auto_2576063 ?auto_2576064 ) ) ( not ( = ?auto_2576063 ?auto_2576065 ) ) ( not ( = ?auto_2576063 ?auto_2576066 ) ) ( not ( = ?auto_2576063 ?auto_2576067 ) ) ( not ( = ?auto_2576063 ?auto_2576068 ) ) ( not ( = ?auto_2576063 ?auto_2576069 ) ) ( not ( = ?auto_2576064 ?auto_2576065 ) ) ( not ( = ?auto_2576064 ?auto_2576066 ) ) ( not ( = ?auto_2576064 ?auto_2576067 ) ) ( not ( = ?auto_2576064 ?auto_2576068 ) ) ( not ( = ?auto_2576064 ?auto_2576069 ) ) ( not ( = ?auto_2576065 ?auto_2576066 ) ) ( not ( = ?auto_2576065 ?auto_2576067 ) ) ( not ( = ?auto_2576065 ?auto_2576068 ) ) ( not ( = ?auto_2576065 ?auto_2576069 ) ) ( not ( = ?auto_2576066 ?auto_2576067 ) ) ( not ( = ?auto_2576066 ?auto_2576068 ) ) ( not ( = ?auto_2576066 ?auto_2576069 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2576067 ?auto_2576068 ?auto_2576069 )
      ( MAKE-13CRATE-VERIFY ?auto_2576057 ?auto_2576058 ?auto_2576059 ?auto_2576056 ?auto_2576060 ?auto_2576062 ?auto_2576061 ?auto_2576063 ?auto_2576064 ?auto_2576065 ?auto_2576066 ?auto_2576067 ?auto_2576068 ?auto_2576069 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2576213 - SURFACE
      ?auto_2576214 - SURFACE
      ?auto_2576215 - SURFACE
      ?auto_2576212 - SURFACE
      ?auto_2576216 - SURFACE
      ?auto_2576218 - SURFACE
      ?auto_2576217 - SURFACE
      ?auto_2576219 - SURFACE
      ?auto_2576220 - SURFACE
      ?auto_2576221 - SURFACE
      ?auto_2576222 - SURFACE
      ?auto_2576223 - SURFACE
      ?auto_2576224 - SURFACE
      ?auto_2576225 - SURFACE
    )
    :vars
    (
      ?auto_2576226 - HOIST
      ?auto_2576227 - PLACE
      ?auto_2576228 - TRUCK
      ?auto_2576229 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2576226 ?auto_2576227 ) ( SURFACE-AT ?auto_2576224 ?auto_2576227 ) ( CLEAR ?auto_2576224 ) ( IS-CRATE ?auto_2576225 ) ( not ( = ?auto_2576224 ?auto_2576225 ) ) ( AVAILABLE ?auto_2576226 ) ( IN ?auto_2576225 ?auto_2576228 ) ( ON ?auto_2576224 ?auto_2576223 ) ( not ( = ?auto_2576223 ?auto_2576224 ) ) ( not ( = ?auto_2576223 ?auto_2576225 ) ) ( TRUCK-AT ?auto_2576228 ?auto_2576229 ) ( not ( = ?auto_2576229 ?auto_2576227 ) ) ( ON ?auto_2576214 ?auto_2576213 ) ( ON ?auto_2576215 ?auto_2576214 ) ( ON ?auto_2576212 ?auto_2576215 ) ( ON ?auto_2576216 ?auto_2576212 ) ( ON ?auto_2576218 ?auto_2576216 ) ( ON ?auto_2576217 ?auto_2576218 ) ( ON ?auto_2576219 ?auto_2576217 ) ( ON ?auto_2576220 ?auto_2576219 ) ( ON ?auto_2576221 ?auto_2576220 ) ( ON ?auto_2576222 ?auto_2576221 ) ( ON ?auto_2576223 ?auto_2576222 ) ( not ( = ?auto_2576213 ?auto_2576214 ) ) ( not ( = ?auto_2576213 ?auto_2576215 ) ) ( not ( = ?auto_2576213 ?auto_2576212 ) ) ( not ( = ?auto_2576213 ?auto_2576216 ) ) ( not ( = ?auto_2576213 ?auto_2576218 ) ) ( not ( = ?auto_2576213 ?auto_2576217 ) ) ( not ( = ?auto_2576213 ?auto_2576219 ) ) ( not ( = ?auto_2576213 ?auto_2576220 ) ) ( not ( = ?auto_2576213 ?auto_2576221 ) ) ( not ( = ?auto_2576213 ?auto_2576222 ) ) ( not ( = ?auto_2576213 ?auto_2576223 ) ) ( not ( = ?auto_2576213 ?auto_2576224 ) ) ( not ( = ?auto_2576213 ?auto_2576225 ) ) ( not ( = ?auto_2576214 ?auto_2576215 ) ) ( not ( = ?auto_2576214 ?auto_2576212 ) ) ( not ( = ?auto_2576214 ?auto_2576216 ) ) ( not ( = ?auto_2576214 ?auto_2576218 ) ) ( not ( = ?auto_2576214 ?auto_2576217 ) ) ( not ( = ?auto_2576214 ?auto_2576219 ) ) ( not ( = ?auto_2576214 ?auto_2576220 ) ) ( not ( = ?auto_2576214 ?auto_2576221 ) ) ( not ( = ?auto_2576214 ?auto_2576222 ) ) ( not ( = ?auto_2576214 ?auto_2576223 ) ) ( not ( = ?auto_2576214 ?auto_2576224 ) ) ( not ( = ?auto_2576214 ?auto_2576225 ) ) ( not ( = ?auto_2576215 ?auto_2576212 ) ) ( not ( = ?auto_2576215 ?auto_2576216 ) ) ( not ( = ?auto_2576215 ?auto_2576218 ) ) ( not ( = ?auto_2576215 ?auto_2576217 ) ) ( not ( = ?auto_2576215 ?auto_2576219 ) ) ( not ( = ?auto_2576215 ?auto_2576220 ) ) ( not ( = ?auto_2576215 ?auto_2576221 ) ) ( not ( = ?auto_2576215 ?auto_2576222 ) ) ( not ( = ?auto_2576215 ?auto_2576223 ) ) ( not ( = ?auto_2576215 ?auto_2576224 ) ) ( not ( = ?auto_2576215 ?auto_2576225 ) ) ( not ( = ?auto_2576212 ?auto_2576216 ) ) ( not ( = ?auto_2576212 ?auto_2576218 ) ) ( not ( = ?auto_2576212 ?auto_2576217 ) ) ( not ( = ?auto_2576212 ?auto_2576219 ) ) ( not ( = ?auto_2576212 ?auto_2576220 ) ) ( not ( = ?auto_2576212 ?auto_2576221 ) ) ( not ( = ?auto_2576212 ?auto_2576222 ) ) ( not ( = ?auto_2576212 ?auto_2576223 ) ) ( not ( = ?auto_2576212 ?auto_2576224 ) ) ( not ( = ?auto_2576212 ?auto_2576225 ) ) ( not ( = ?auto_2576216 ?auto_2576218 ) ) ( not ( = ?auto_2576216 ?auto_2576217 ) ) ( not ( = ?auto_2576216 ?auto_2576219 ) ) ( not ( = ?auto_2576216 ?auto_2576220 ) ) ( not ( = ?auto_2576216 ?auto_2576221 ) ) ( not ( = ?auto_2576216 ?auto_2576222 ) ) ( not ( = ?auto_2576216 ?auto_2576223 ) ) ( not ( = ?auto_2576216 ?auto_2576224 ) ) ( not ( = ?auto_2576216 ?auto_2576225 ) ) ( not ( = ?auto_2576218 ?auto_2576217 ) ) ( not ( = ?auto_2576218 ?auto_2576219 ) ) ( not ( = ?auto_2576218 ?auto_2576220 ) ) ( not ( = ?auto_2576218 ?auto_2576221 ) ) ( not ( = ?auto_2576218 ?auto_2576222 ) ) ( not ( = ?auto_2576218 ?auto_2576223 ) ) ( not ( = ?auto_2576218 ?auto_2576224 ) ) ( not ( = ?auto_2576218 ?auto_2576225 ) ) ( not ( = ?auto_2576217 ?auto_2576219 ) ) ( not ( = ?auto_2576217 ?auto_2576220 ) ) ( not ( = ?auto_2576217 ?auto_2576221 ) ) ( not ( = ?auto_2576217 ?auto_2576222 ) ) ( not ( = ?auto_2576217 ?auto_2576223 ) ) ( not ( = ?auto_2576217 ?auto_2576224 ) ) ( not ( = ?auto_2576217 ?auto_2576225 ) ) ( not ( = ?auto_2576219 ?auto_2576220 ) ) ( not ( = ?auto_2576219 ?auto_2576221 ) ) ( not ( = ?auto_2576219 ?auto_2576222 ) ) ( not ( = ?auto_2576219 ?auto_2576223 ) ) ( not ( = ?auto_2576219 ?auto_2576224 ) ) ( not ( = ?auto_2576219 ?auto_2576225 ) ) ( not ( = ?auto_2576220 ?auto_2576221 ) ) ( not ( = ?auto_2576220 ?auto_2576222 ) ) ( not ( = ?auto_2576220 ?auto_2576223 ) ) ( not ( = ?auto_2576220 ?auto_2576224 ) ) ( not ( = ?auto_2576220 ?auto_2576225 ) ) ( not ( = ?auto_2576221 ?auto_2576222 ) ) ( not ( = ?auto_2576221 ?auto_2576223 ) ) ( not ( = ?auto_2576221 ?auto_2576224 ) ) ( not ( = ?auto_2576221 ?auto_2576225 ) ) ( not ( = ?auto_2576222 ?auto_2576223 ) ) ( not ( = ?auto_2576222 ?auto_2576224 ) ) ( not ( = ?auto_2576222 ?auto_2576225 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2576223 ?auto_2576224 ?auto_2576225 )
      ( MAKE-13CRATE-VERIFY ?auto_2576213 ?auto_2576214 ?auto_2576215 ?auto_2576212 ?auto_2576216 ?auto_2576218 ?auto_2576217 ?auto_2576219 ?auto_2576220 ?auto_2576221 ?auto_2576222 ?auto_2576223 ?auto_2576224 ?auto_2576225 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2576382 - SURFACE
      ?auto_2576383 - SURFACE
      ?auto_2576384 - SURFACE
      ?auto_2576381 - SURFACE
      ?auto_2576385 - SURFACE
      ?auto_2576387 - SURFACE
      ?auto_2576386 - SURFACE
      ?auto_2576388 - SURFACE
      ?auto_2576389 - SURFACE
      ?auto_2576390 - SURFACE
      ?auto_2576391 - SURFACE
      ?auto_2576392 - SURFACE
      ?auto_2576393 - SURFACE
      ?auto_2576394 - SURFACE
    )
    :vars
    (
      ?auto_2576396 - HOIST
      ?auto_2576399 - PLACE
      ?auto_2576397 - TRUCK
      ?auto_2576398 - PLACE
      ?auto_2576395 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2576396 ?auto_2576399 ) ( SURFACE-AT ?auto_2576393 ?auto_2576399 ) ( CLEAR ?auto_2576393 ) ( IS-CRATE ?auto_2576394 ) ( not ( = ?auto_2576393 ?auto_2576394 ) ) ( AVAILABLE ?auto_2576396 ) ( ON ?auto_2576393 ?auto_2576392 ) ( not ( = ?auto_2576392 ?auto_2576393 ) ) ( not ( = ?auto_2576392 ?auto_2576394 ) ) ( TRUCK-AT ?auto_2576397 ?auto_2576398 ) ( not ( = ?auto_2576398 ?auto_2576399 ) ) ( HOIST-AT ?auto_2576395 ?auto_2576398 ) ( LIFTING ?auto_2576395 ?auto_2576394 ) ( not ( = ?auto_2576396 ?auto_2576395 ) ) ( ON ?auto_2576383 ?auto_2576382 ) ( ON ?auto_2576384 ?auto_2576383 ) ( ON ?auto_2576381 ?auto_2576384 ) ( ON ?auto_2576385 ?auto_2576381 ) ( ON ?auto_2576387 ?auto_2576385 ) ( ON ?auto_2576386 ?auto_2576387 ) ( ON ?auto_2576388 ?auto_2576386 ) ( ON ?auto_2576389 ?auto_2576388 ) ( ON ?auto_2576390 ?auto_2576389 ) ( ON ?auto_2576391 ?auto_2576390 ) ( ON ?auto_2576392 ?auto_2576391 ) ( not ( = ?auto_2576382 ?auto_2576383 ) ) ( not ( = ?auto_2576382 ?auto_2576384 ) ) ( not ( = ?auto_2576382 ?auto_2576381 ) ) ( not ( = ?auto_2576382 ?auto_2576385 ) ) ( not ( = ?auto_2576382 ?auto_2576387 ) ) ( not ( = ?auto_2576382 ?auto_2576386 ) ) ( not ( = ?auto_2576382 ?auto_2576388 ) ) ( not ( = ?auto_2576382 ?auto_2576389 ) ) ( not ( = ?auto_2576382 ?auto_2576390 ) ) ( not ( = ?auto_2576382 ?auto_2576391 ) ) ( not ( = ?auto_2576382 ?auto_2576392 ) ) ( not ( = ?auto_2576382 ?auto_2576393 ) ) ( not ( = ?auto_2576382 ?auto_2576394 ) ) ( not ( = ?auto_2576383 ?auto_2576384 ) ) ( not ( = ?auto_2576383 ?auto_2576381 ) ) ( not ( = ?auto_2576383 ?auto_2576385 ) ) ( not ( = ?auto_2576383 ?auto_2576387 ) ) ( not ( = ?auto_2576383 ?auto_2576386 ) ) ( not ( = ?auto_2576383 ?auto_2576388 ) ) ( not ( = ?auto_2576383 ?auto_2576389 ) ) ( not ( = ?auto_2576383 ?auto_2576390 ) ) ( not ( = ?auto_2576383 ?auto_2576391 ) ) ( not ( = ?auto_2576383 ?auto_2576392 ) ) ( not ( = ?auto_2576383 ?auto_2576393 ) ) ( not ( = ?auto_2576383 ?auto_2576394 ) ) ( not ( = ?auto_2576384 ?auto_2576381 ) ) ( not ( = ?auto_2576384 ?auto_2576385 ) ) ( not ( = ?auto_2576384 ?auto_2576387 ) ) ( not ( = ?auto_2576384 ?auto_2576386 ) ) ( not ( = ?auto_2576384 ?auto_2576388 ) ) ( not ( = ?auto_2576384 ?auto_2576389 ) ) ( not ( = ?auto_2576384 ?auto_2576390 ) ) ( not ( = ?auto_2576384 ?auto_2576391 ) ) ( not ( = ?auto_2576384 ?auto_2576392 ) ) ( not ( = ?auto_2576384 ?auto_2576393 ) ) ( not ( = ?auto_2576384 ?auto_2576394 ) ) ( not ( = ?auto_2576381 ?auto_2576385 ) ) ( not ( = ?auto_2576381 ?auto_2576387 ) ) ( not ( = ?auto_2576381 ?auto_2576386 ) ) ( not ( = ?auto_2576381 ?auto_2576388 ) ) ( not ( = ?auto_2576381 ?auto_2576389 ) ) ( not ( = ?auto_2576381 ?auto_2576390 ) ) ( not ( = ?auto_2576381 ?auto_2576391 ) ) ( not ( = ?auto_2576381 ?auto_2576392 ) ) ( not ( = ?auto_2576381 ?auto_2576393 ) ) ( not ( = ?auto_2576381 ?auto_2576394 ) ) ( not ( = ?auto_2576385 ?auto_2576387 ) ) ( not ( = ?auto_2576385 ?auto_2576386 ) ) ( not ( = ?auto_2576385 ?auto_2576388 ) ) ( not ( = ?auto_2576385 ?auto_2576389 ) ) ( not ( = ?auto_2576385 ?auto_2576390 ) ) ( not ( = ?auto_2576385 ?auto_2576391 ) ) ( not ( = ?auto_2576385 ?auto_2576392 ) ) ( not ( = ?auto_2576385 ?auto_2576393 ) ) ( not ( = ?auto_2576385 ?auto_2576394 ) ) ( not ( = ?auto_2576387 ?auto_2576386 ) ) ( not ( = ?auto_2576387 ?auto_2576388 ) ) ( not ( = ?auto_2576387 ?auto_2576389 ) ) ( not ( = ?auto_2576387 ?auto_2576390 ) ) ( not ( = ?auto_2576387 ?auto_2576391 ) ) ( not ( = ?auto_2576387 ?auto_2576392 ) ) ( not ( = ?auto_2576387 ?auto_2576393 ) ) ( not ( = ?auto_2576387 ?auto_2576394 ) ) ( not ( = ?auto_2576386 ?auto_2576388 ) ) ( not ( = ?auto_2576386 ?auto_2576389 ) ) ( not ( = ?auto_2576386 ?auto_2576390 ) ) ( not ( = ?auto_2576386 ?auto_2576391 ) ) ( not ( = ?auto_2576386 ?auto_2576392 ) ) ( not ( = ?auto_2576386 ?auto_2576393 ) ) ( not ( = ?auto_2576386 ?auto_2576394 ) ) ( not ( = ?auto_2576388 ?auto_2576389 ) ) ( not ( = ?auto_2576388 ?auto_2576390 ) ) ( not ( = ?auto_2576388 ?auto_2576391 ) ) ( not ( = ?auto_2576388 ?auto_2576392 ) ) ( not ( = ?auto_2576388 ?auto_2576393 ) ) ( not ( = ?auto_2576388 ?auto_2576394 ) ) ( not ( = ?auto_2576389 ?auto_2576390 ) ) ( not ( = ?auto_2576389 ?auto_2576391 ) ) ( not ( = ?auto_2576389 ?auto_2576392 ) ) ( not ( = ?auto_2576389 ?auto_2576393 ) ) ( not ( = ?auto_2576389 ?auto_2576394 ) ) ( not ( = ?auto_2576390 ?auto_2576391 ) ) ( not ( = ?auto_2576390 ?auto_2576392 ) ) ( not ( = ?auto_2576390 ?auto_2576393 ) ) ( not ( = ?auto_2576390 ?auto_2576394 ) ) ( not ( = ?auto_2576391 ?auto_2576392 ) ) ( not ( = ?auto_2576391 ?auto_2576393 ) ) ( not ( = ?auto_2576391 ?auto_2576394 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2576392 ?auto_2576393 ?auto_2576394 )
      ( MAKE-13CRATE-VERIFY ?auto_2576382 ?auto_2576383 ?auto_2576384 ?auto_2576381 ?auto_2576385 ?auto_2576387 ?auto_2576386 ?auto_2576388 ?auto_2576389 ?auto_2576390 ?auto_2576391 ?auto_2576392 ?auto_2576393 ?auto_2576394 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2576564 - SURFACE
      ?auto_2576565 - SURFACE
      ?auto_2576566 - SURFACE
      ?auto_2576563 - SURFACE
      ?auto_2576567 - SURFACE
      ?auto_2576569 - SURFACE
      ?auto_2576568 - SURFACE
      ?auto_2576570 - SURFACE
      ?auto_2576571 - SURFACE
      ?auto_2576572 - SURFACE
      ?auto_2576573 - SURFACE
      ?auto_2576574 - SURFACE
      ?auto_2576575 - SURFACE
      ?auto_2576576 - SURFACE
    )
    :vars
    (
      ?auto_2576577 - HOIST
      ?auto_2576580 - PLACE
      ?auto_2576581 - TRUCK
      ?auto_2576578 - PLACE
      ?auto_2576582 - HOIST
      ?auto_2576579 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2576577 ?auto_2576580 ) ( SURFACE-AT ?auto_2576575 ?auto_2576580 ) ( CLEAR ?auto_2576575 ) ( IS-CRATE ?auto_2576576 ) ( not ( = ?auto_2576575 ?auto_2576576 ) ) ( AVAILABLE ?auto_2576577 ) ( ON ?auto_2576575 ?auto_2576574 ) ( not ( = ?auto_2576574 ?auto_2576575 ) ) ( not ( = ?auto_2576574 ?auto_2576576 ) ) ( TRUCK-AT ?auto_2576581 ?auto_2576578 ) ( not ( = ?auto_2576578 ?auto_2576580 ) ) ( HOIST-AT ?auto_2576582 ?auto_2576578 ) ( not ( = ?auto_2576577 ?auto_2576582 ) ) ( AVAILABLE ?auto_2576582 ) ( SURFACE-AT ?auto_2576576 ?auto_2576578 ) ( ON ?auto_2576576 ?auto_2576579 ) ( CLEAR ?auto_2576576 ) ( not ( = ?auto_2576575 ?auto_2576579 ) ) ( not ( = ?auto_2576576 ?auto_2576579 ) ) ( not ( = ?auto_2576574 ?auto_2576579 ) ) ( ON ?auto_2576565 ?auto_2576564 ) ( ON ?auto_2576566 ?auto_2576565 ) ( ON ?auto_2576563 ?auto_2576566 ) ( ON ?auto_2576567 ?auto_2576563 ) ( ON ?auto_2576569 ?auto_2576567 ) ( ON ?auto_2576568 ?auto_2576569 ) ( ON ?auto_2576570 ?auto_2576568 ) ( ON ?auto_2576571 ?auto_2576570 ) ( ON ?auto_2576572 ?auto_2576571 ) ( ON ?auto_2576573 ?auto_2576572 ) ( ON ?auto_2576574 ?auto_2576573 ) ( not ( = ?auto_2576564 ?auto_2576565 ) ) ( not ( = ?auto_2576564 ?auto_2576566 ) ) ( not ( = ?auto_2576564 ?auto_2576563 ) ) ( not ( = ?auto_2576564 ?auto_2576567 ) ) ( not ( = ?auto_2576564 ?auto_2576569 ) ) ( not ( = ?auto_2576564 ?auto_2576568 ) ) ( not ( = ?auto_2576564 ?auto_2576570 ) ) ( not ( = ?auto_2576564 ?auto_2576571 ) ) ( not ( = ?auto_2576564 ?auto_2576572 ) ) ( not ( = ?auto_2576564 ?auto_2576573 ) ) ( not ( = ?auto_2576564 ?auto_2576574 ) ) ( not ( = ?auto_2576564 ?auto_2576575 ) ) ( not ( = ?auto_2576564 ?auto_2576576 ) ) ( not ( = ?auto_2576564 ?auto_2576579 ) ) ( not ( = ?auto_2576565 ?auto_2576566 ) ) ( not ( = ?auto_2576565 ?auto_2576563 ) ) ( not ( = ?auto_2576565 ?auto_2576567 ) ) ( not ( = ?auto_2576565 ?auto_2576569 ) ) ( not ( = ?auto_2576565 ?auto_2576568 ) ) ( not ( = ?auto_2576565 ?auto_2576570 ) ) ( not ( = ?auto_2576565 ?auto_2576571 ) ) ( not ( = ?auto_2576565 ?auto_2576572 ) ) ( not ( = ?auto_2576565 ?auto_2576573 ) ) ( not ( = ?auto_2576565 ?auto_2576574 ) ) ( not ( = ?auto_2576565 ?auto_2576575 ) ) ( not ( = ?auto_2576565 ?auto_2576576 ) ) ( not ( = ?auto_2576565 ?auto_2576579 ) ) ( not ( = ?auto_2576566 ?auto_2576563 ) ) ( not ( = ?auto_2576566 ?auto_2576567 ) ) ( not ( = ?auto_2576566 ?auto_2576569 ) ) ( not ( = ?auto_2576566 ?auto_2576568 ) ) ( not ( = ?auto_2576566 ?auto_2576570 ) ) ( not ( = ?auto_2576566 ?auto_2576571 ) ) ( not ( = ?auto_2576566 ?auto_2576572 ) ) ( not ( = ?auto_2576566 ?auto_2576573 ) ) ( not ( = ?auto_2576566 ?auto_2576574 ) ) ( not ( = ?auto_2576566 ?auto_2576575 ) ) ( not ( = ?auto_2576566 ?auto_2576576 ) ) ( not ( = ?auto_2576566 ?auto_2576579 ) ) ( not ( = ?auto_2576563 ?auto_2576567 ) ) ( not ( = ?auto_2576563 ?auto_2576569 ) ) ( not ( = ?auto_2576563 ?auto_2576568 ) ) ( not ( = ?auto_2576563 ?auto_2576570 ) ) ( not ( = ?auto_2576563 ?auto_2576571 ) ) ( not ( = ?auto_2576563 ?auto_2576572 ) ) ( not ( = ?auto_2576563 ?auto_2576573 ) ) ( not ( = ?auto_2576563 ?auto_2576574 ) ) ( not ( = ?auto_2576563 ?auto_2576575 ) ) ( not ( = ?auto_2576563 ?auto_2576576 ) ) ( not ( = ?auto_2576563 ?auto_2576579 ) ) ( not ( = ?auto_2576567 ?auto_2576569 ) ) ( not ( = ?auto_2576567 ?auto_2576568 ) ) ( not ( = ?auto_2576567 ?auto_2576570 ) ) ( not ( = ?auto_2576567 ?auto_2576571 ) ) ( not ( = ?auto_2576567 ?auto_2576572 ) ) ( not ( = ?auto_2576567 ?auto_2576573 ) ) ( not ( = ?auto_2576567 ?auto_2576574 ) ) ( not ( = ?auto_2576567 ?auto_2576575 ) ) ( not ( = ?auto_2576567 ?auto_2576576 ) ) ( not ( = ?auto_2576567 ?auto_2576579 ) ) ( not ( = ?auto_2576569 ?auto_2576568 ) ) ( not ( = ?auto_2576569 ?auto_2576570 ) ) ( not ( = ?auto_2576569 ?auto_2576571 ) ) ( not ( = ?auto_2576569 ?auto_2576572 ) ) ( not ( = ?auto_2576569 ?auto_2576573 ) ) ( not ( = ?auto_2576569 ?auto_2576574 ) ) ( not ( = ?auto_2576569 ?auto_2576575 ) ) ( not ( = ?auto_2576569 ?auto_2576576 ) ) ( not ( = ?auto_2576569 ?auto_2576579 ) ) ( not ( = ?auto_2576568 ?auto_2576570 ) ) ( not ( = ?auto_2576568 ?auto_2576571 ) ) ( not ( = ?auto_2576568 ?auto_2576572 ) ) ( not ( = ?auto_2576568 ?auto_2576573 ) ) ( not ( = ?auto_2576568 ?auto_2576574 ) ) ( not ( = ?auto_2576568 ?auto_2576575 ) ) ( not ( = ?auto_2576568 ?auto_2576576 ) ) ( not ( = ?auto_2576568 ?auto_2576579 ) ) ( not ( = ?auto_2576570 ?auto_2576571 ) ) ( not ( = ?auto_2576570 ?auto_2576572 ) ) ( not ( = ?auto_2576570 ?auto_2576573 ) ) ( not ( = ?auto_2576570 ?auto_2576574 ) ) ( not ( = ?auto_2576570 ?auto_2576575 ) ) ( not ( = ?auto_2576570 ?auto_2576576 ) ) ( not ( = ?auto_2576570 ?auto_2576579 ) ) ( not ( = ?auto_2576571 ?auto_2576572 ) ) ( not ( = ?auto_2576571 ?auto_2576573 ) ) ( not ( = ?auto_2576571 ?auto_2576574 ) ) ( not ( = ?auto_2576571 ?auto_2576575 ) ) ( not ( = ?auto_2576571 ?auto_2576576 ) ) ( not ( = ?auto_2576571 ?auto_2576579 ) ) ( not ( = ?auto_2576572 ?auto_2576573 ) ) ( not ( = ?auto_2576572 ?auto_2576574 ) ) ( not ( = ?auto_2576572 ?auto_2576575 ) ) ( not ( = ?auto_2576572 ?auto_2576576 ) ) ( not ( = ?auto_2576572 ?auto_2576579 ) ) ( not ( = ?auto_2576573 ?auto_2576574 ) ) ( not ( = ?auto_2576573 ?auto_2576575 ) ) ( not ( = ?auto_2576573 ?auto_2576576 ) ) ( not ( = ?auto_2576573 ?auto_2576579 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2576574 ?auto_2576575 ?auto_2576576 )
      ( MAKE-13CRATE-VERIFY ?auto_2576564 ?auto_2576565 ?auto_2576566 ?auto_2576563 ?auto_2576567 ?auto_2576569 ?auto_2576568 ?auto_2576570 ?auto_2576571 ?auto_2576572 ?auto_2576573 ?auto_2576574 ?auto_2576575 ?auto_2576576 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2576747 - SURFACE
      ?auto_2576748 - SURFACE
      ?auto_2576749 - SURFACE
      ?auto_2576746 - SURFACE
      ?auto_2576750 - SURFACE
      ?auto_2576752 - SURFACE
      ?auto_2576751 - SURFACE
      ?auto_2576753 - SURFACE
      ?auto_2576754 - SURFACE
      ?auto_2576755 - SURFACE
      ?auto_2576756 - SURFACE
      ?auto_2576757 - SURFACE
      ?auto_2576758 - SURFACE
      ?auto_2576759 - SURFACE
    )
    :vars
    (
      ?auto_2576760 - HOIST
      ?auto_2576764 - PLACE
      ?auto_2576765 - PLACE
      ?auto_2576763 - HOIST
      ?auto_2576761 - SURFACE
      ?auto_2576762 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2576760 ?auto_2576764 ) ( SURFACE-AT ?auto_2576758 ?auto_2576764 ) ( CLEAR ?auto_2576758 ) ( IS-CRATE ?auto_2576759 ) ( not ( = ?auto_2576758 ?auto_2576759 ) ) ( AVAILABLE ?auto_2576760 ) ( ON ?auto_2576758 ?auto_2576757 ) ( not ( = ?auto_2576757 ?auto_2576758 ) ) ( not ( = ?auto_2576757 ?auto_2576759 ) ) ( not ( = ?auto_2576765 ?auto_2576764 ) ) ( HOIST-AT ?auto_2576763 ?auto_2576765 ) ( not ( = ?auto_2576760 ?auto_2576763 ) ) ( AVAILABLE ?auto_2576763 ) ( SURFACE-AT ?auto_2576759 ?auto_2576765 ) ( ON ?auto_2576759 ?auto_2576761 ) ( CLEAR ?auto_2576759 ) ( not ( = ?auto_2576758 ?auto_2576761 ) ) ( not ( = ?auto_2576759 ?auto_2576761 ) ) ( not ( = ?auto_2576757 ?auto_2576761 ) ) ( TRUCK-AT ?auto_2576762 ?auto_2576764 ) ( ON ?auto_2576748 ?auto_2576747 ) ( ON ?auto_2576749 ?auto_2576748 ) ( ON ?auto_2576746 ?auto_2576749 ) ( ON ?auto_2576750 ?auto_2576746 ) ( ON ?auto_2576752 ?auto_2576750 ) ( ON ?auto_2576751 ?auto_2576752 ) ( ON ?auto_2576753 ?auto_2576751 ) ( ON ?auto_2576754 ?auto_2576753 ) ( ON ?auto_2576755 ?auto_2576754 ) ( ON ?auto_2576756 ?auto_2576755 ) ( ON ?auto_2576757 ?auto_2576756 ) ( not ( = ?auto_2576747 ?auto_2576748 ) ) ( not ( = ?auto_2576747 ?auto_2576749 ) ) ( not ( = ?auto_2576747 ?auto_2576746 ) ) ( not ( = ?auto_2576747 ?auto_2576750 ) ) ( not ( = ?auto_2576747 ?auto_2576752 ) ) ( not ( = ?auto_2576747 ?auto_2576751 ) ) ( not ( = ?auto_2576747 ?auto_2576753 ) ) ( not ( = ?auto_2576747 ?auto_2576754 ) ) ( not ( = ?auto_2576747 ?auto_2576755 ) ) ( not ( = ?auto_2576747 ?auto_2576756 ) ) ( not ( = ?auto_2576747 ?auto_2576757 ) ) ( not ( = ?auto_2576747 ?auto_2576758 ) ) ( not ( = ?auto_2576747 ?auto_2576759 ) ) ( not ( = ?auto_2576747 ?auto_2576761 ) ) ( not ( = ?auto_2576748 ?auto_2576749 ) ) ( not ( = ?auto_2576748 ?auto_2576746 ) ) ( not ( = ?auto_2576748 ?auto_2576750 ) ) ( not ( = ?auto_2576748 ?auto_2576752 ) ) ( not ( = ?auto_2576748 ?auto_2576751 ) ) ( not ( = ?auto_2576748 ?auto_2576753 ) ) ( not ( = ?auto_2576748 ?auto_2576754 ) ) ( not ( = ?auto_2576748 ?auto_2576755 ) ) ( not ( = ?auto_2576748 ?auto_2576756 ) ) ( not ( = ?auto_2576748 ?auto_2576757 ) ) ( not ( = ?auto_2576748 ?auto_2576758 ) ) ( not ( = ?auto_2576748 ?auto_2576759 ) ) ( not ( = ?auto_2576748 ?auto_2576761 ) ) ( not ( = ?auto_2576749 ?auto_2576746 ) ) ( not ( = ?auto_2576749 ?auto_2576750 ) ) ( not ( = ?auto_2576749 ?auto_2576752 ) ) ( not ( = ?auto_2576749 ?auto_2576751 ) ) ( not ( = ?auto_2576749 ?auto_2576753 ) ) ( not ( = ?auto_2576749 ?auto_2576754 ) ) ( not ( = ?auto_2576749 ?auto_2576755 ) ) ( not ( = ?auto_2576749 ?auto_2576756 ) ) ( not ( = ?auto_2576749 ?auto_2576757 ) ) ( not ( = ?auto_2576749 ?auto_2576758 ) ) ( not ( = ?auto_2576749 ?auto_2576759 ) ) ( not ( = ?auto_2576749 ?auto_2576761 ) ) ( not ( = ?auto_2576746 ?auto_2576750 ) ) ( not ( = ?auto_2576746 ?auto_2576752 ) ) ( not ( = ?auto_2576746 ?auto_2576751 ) ) ( not ( = ?auto_2576746 ?auto_2576753 ) ) ( not ( = ?auto_2576746 ?auto_2576754 ) ) ( not ( = ?auto_2576746 ?auto_2576755 ) ) ( not ( = ?auto_2576746 ?auto_2576756 ) ) ( not ( = ?auto_2576746 ?auto_2576757 ) ) ( not ( = ?auto_2576746 ?auto_2576758 ) ) ( not ( = ?auto_2576746 ?auto_2576759 ) ) ( not ( = ?auto_2576746 ?auto_2576761 ) ) ( not ( = ?auto_2576750 ?auto_2576752 ) ) ( not ( = ?auto_2576750 ?auto_2576751 ) ) ( not ( = ?auto_2576750 ?auto_2576753 ) ) ( not ( = ?auto_2576750 ?auto_2576754 ) ) ( not ( = ?auto_2576750 ?auto_2576755 ) ) ( not ( = ?auto_2576750 ?auto_2576756 ) ) ( not ( = ?auto_2576750 ?auto_2576757 ) ) ( not ( = ?auto_2576750 ?auto_2576758 ) ) ( not ( = ?auto_2576750 ?auto_2576759 ) ) ( not ( = ?auto_2576750 ?auto_2576761 ) ) ( not ( = ?auto_2576752 ?auto_2576751 ) ) ( not ( = ?auto_2576752 ?auto_2576753 ) ) ( not ( = ?auto_2576752 ?auto_2576754 ) ) ( not ( = ?auto_2576752 ?auto_2576755 ) ) ( not ( = ?auto_2576752 ?auto_2576756 ) ) ( not ( = ?auto_2576752 ?auto_2576757 ) ) ( not ( = ?auto_2576752 ?auto_2576758 ) ) ( not ( = ?auto_2576752 ?auto_2576759 ) ) ( not ( = ?auto_2576752 ?auto_2576761 ) ) ( not ( = ?auto_2576751 ?auto_2576753 ) ) ( not ( = ?auto_2576751 ?auto_2576754 ) ) ( not ( = ?auto_2576751 ?auto_2576755 ) ) ( not ( = ?auto_2576751 ?auto_2576756 ) ) ( not ( = ?auto_2576751 ?auto_2576757 ) ) ( not ( = ?auto_2576751 ?auto_2576758 ) ) ( not ( = ?auto_2576751 ?auto_2576759 ) ) ( not ( = ?auto_2576751 ?auto_2576761 ) ) ( not ( = ?auto_2576753 ?auto_2576754 ) ) ( not ( = ?auto_2576753 ?auto_2576755 ) ) ( not ( = ?auto_2576753 ?auto_2576756 ) ) ( not ( = ?auto_2576753 ?auto_2576757 ) ) ( not ( = ?auto_2576753 ?auto_2576758 ) ) ( not ( = ?auto_2576753 ?auto_2576759 ) ) ( not ( = ?auto_2576753 ?auto_2576761 ) ) ( not ( = ?auto_2576754 ?auto_2576755 ) ) ( not ( = ?auto_2576754 ?auto_2576756 ) ) ( not ( = ?auto_2576754 ?auto_2576757 ) ) ( not ( = ?auto_2576754 ?auto_2576758 ) ) ( not ( = ?auto_2576754 ?auto_2576759 ) ) ( not ( = ?auto_2576754 ?auto_2576761 ) ) ( not ( = ?auto_2576755 ?auto_2576756 ) ) ( not ( = ?auto_2576755 ?auto_2576757 ) ) ( not ( = ?auto_2576755 ?auto_2576758 ) ) ( not ( = ?auto_2576755 ?auto_2576759 ) ) ( not ( = ?auto_2576755 ?auto_2576761 ) ) ( not ( = ?auto_2576756 ?auto_2576757 ) ) ( not ( = ?auto_2576756 ?auto_2576758 ) ) ( not ( = ?auto_2576756 ?auto_2576759 ) ) ( not ( = ?auto_2576756 ?auto_2576761 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2576757 ?auto_2576758 ?auto_2576759 )
      ( MAKE-13CRATE-VERIFY ?auto_2576747 ?auto_2576748 ?auto_2576749 ?auto_2576746 ?auto_2576750 ?auto_2576752 ?auto_2576751 ?auto_2576753 ?auto_2576754 ?auto_2576755 ?auto_2576756 ?auto_2576757 ?auto_2576758 ?auto_2576759 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2576930 - SURFACE
      ?auto_2576931 - SURFACE
      ?auto_2576932 - SURFACE
      ?auto_2576929 - SURFACE
      ?auto_2576933 - SURFACE
      ?auto_2576935 - SURFACE
      ?auto_2576934 - SURFACE
      ?auto_2576936 - SURFACE
      ?auto_2576937 - SURFACE
      ?auto_2576938 - SURFACE
      ?auto_2576939 - SURFACE
      ?auto_2576940 - SURFACE
      ?auto_2576941 - SURFACE
      ?auto_2576942 - SURFACE
    )
    :vars
    (
      ?auto_2576943 - HOIST
      ?auto_2576944 - PLACE
      ?auto_2576948 - PLACE
      ?auto_2576947 - HOIST
      ?auto_2576945 - SURFACE
      ?auto_2576946 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2576943 ?auto_2576944 ) ( IS-CRATE ?auto_2576942 ) ( not ( = ?auto_2576941 ?auto_2576942 ) ) ( not ( = ?auto_2576940 ?auto_2576941 ) ) ( not ( = ?auto_2576940 ?auto_2576942 ) ) ( not ( = ?auto_2576948 ?auto_2576944 ) ) ( HOIST-AT ?auto_2576947 ?auto_2576948 ) ( not ( = ?auto_2576943 ?auto_2576947 ) ) ( AVAILABLE ?auto_2576947 ) ( SURFACE-AT ?auto_2576942 ?auto_2576948 ) ( ON ?auto_2576942 ?auto_2576945 ) ( CLEAR ?auto_2576942 ) ( not ( = ?auto_2576941 ?auto_2576945 ) ) ( not ( = ?auto_2576942 ?auto_2576945 ) ) ( not ( = ?auto_2576940 ?auto_2576945 ) ) ( TRUCK-AT ?auto_2576946 ?auto_2576944 ) ( SURFACE-AT ?auto_2576940 ?auto_2576944 ) ( CLEAR ?auto_2576940 ) ( LIFTING ?auto_2576943 ?auto_2576941 ) ( IS-CRATE ?auto_2576941 ) ( ON ?auto_2576931 ?auto_2576930 ) ( ON ?auto_2576932 ?auto_2576931 ) ( ON ?auto_2576929 ?auto_2576932 ) ( ON ?auto_2576933 ?auto_2576929 ) ( ON ?auto_2576935 ?auto_2576933 ) ( ON ?auto_2576934 ?auto_2576935 ) ( ON ?auto_2576936 ?auto_2576934 ) ( ON ?auto_2576937 ?auto_2576936 ) ( ON ?auto_2576938 ?auto_2576937 ) ( ON ?auto_2576939 ?auto_2576938 ) ( ON ?auto_2576940 ?auto_2576939 ) ( not ( = ?auto_2576930 ?auto_2576931 ) ) ( not ( = ?auto_2576930 ?auto_2576932 ) ) ( not ( = ?auto_2576930 ?auto_2576929 ) ) ( not ( = ?auto_2576930 ?auto_2576933 ) ) ( not ( = ?auto_2576930 ?auto_2576935 ) ) ( not ( = ?auto_2576930 ?auto_2576934 ) ) ( not ( = ?auto_2576930 ?auto_2576936 ) ) ( not ( = ?auto_2576930 ?auto_2576937 ) ) ( not ( = ?auto_2576930 ?auto_2576938 ) ) ( not ( = ?auto_2576930 ?auto_2576939 ) ) ( not ( = ?auto_2576930 ?auto_2576940 ) ) ( not ( = ?auto_2576930 ?auto_2576941 ) ) ( not ( = ?auto_2576930 ?auto_2576942 ) ) ( not ( = ?auto_2576930 ?auto_2576945 ) ) ( not ( = ?auto_2576931 ?auto_2576932 ) ) ( not ( = ?auto_2576931 ?auto_2576929 ) ) ( not ( = ?auto_2576931 ?auto_2576933 ) ) ( not ( = ?auto_2576931 ?auto_2576935 ) ) ( not ( = ?auto_2576931 ?auto_2576934 ) ) ( not ( = ?auto_2576931 ?auto_2576936 ) ) ( not ( = ?auto_2576931 ?auto_2576937 ) ) ( not ( = ?auto_2576931 ?auto_2576938 ) ) ( not ( = ?auto_2576931 ?auto_2576939 ) ) ( not ( = ?auto_2576931 ?auto_2576940 ) ) ( not ( = ?auto_2576931 ?auto_2576941 ) ) ( not ( = ?auto_2576931 ?auto_2576942 ) ) ( not ( = ?auto_2576931 ?auto_2576945 ) ) ( not ( = ?auto_2576932 ?auto_2576929 ) ) ( not ( = ?auto_2576932 ?auto_2576933 ) ) ( not ( = ?auto_2576932 ?auto_2576935 ) ) ( not ( = ?auto_2576932 ?auto_2576934 ) ) ( not ( = ?auto_2576932 ?auto_2576936 ) ) ( not ( = ?auto_2576932 ?auto_2576937 ) ) ( not ( = ?auto_2576932 ?auto_2576938 ) ) ( not ( = ?auto_2576932 ?auto_2576939 ) ) ( not ( = ?auto_2576932 ?auto_2576940 ) ) ( not ( = ?auto_2576932 ?auto_2576941 ) ) ( not ( = ?auto_2576932 ?auto_2576942 ) ) ( not ( = ?auto_2576932 ?auto_2576945 ) ) ( not ( = ?auto_2576929 ?auto_2576933 ) ) ( not ( = ?auto_2576929 ?auto_2576935 ) ) ( not ( = ?auto_2576929 ?auto_2576934 ) ) ( not ( = ?auto_2576929 ?auto_2576936 ) ) ( not ( = ?auto_2576929 ?auto_2576937 ) ) ( not ( = ?auto_2576929 ?auto_2576938 ) ) ( not ( = ?auto_2576929 ?auto_2576939 ) ) ( not ( = ?auto_2576929 ?auto_2576940 ) ) ( not ( = ?auto_2576929 ?auto_2576941 ) ) ( not ( = ?auto_2576929 ?auto_2576942 ) ) ( not ( = ?auto_2576929 ?auto_2576945 ) ) ( not ( = ?auto_2576933 ?auto_2576935 ) ) ( not ( = ?auto_2576933 ?auto_2576934 ) ) ( not ( = ?auto_2576933 ?auto_2576936 ) ) ( not ( = ?auto_2576933 ?auto_2576937 ) ) ( not ( = ?auto_2576933 ?auto_2576938 ) ) ( not ( = ?auto_2576933 ?auto_2576939 ) ) ( not ( = ?auto_2576933 ?auto_2576940 ) ) ( not ( = ?auto_2576933 ?auto_2576941 ) ) ( not ( = ?auto_2576933 ?auto_2576942 ) ) ( not ( = ?auto_2576933 ?auto_2576945 ) ) ( not ( = ?auto_2576935 ?auto_2576934 ) ) ( not ( = ?auto_2576935 ?auto_2576936 ) ) ( not ( = ?auto_2576935 ?auto_2576937 ) ) ( not ( = ?auto_2576935 ?auto_2576938 ) ) ( not ( = ?auto_2576935 ?auto_2576939 ) ) ( not ( = ?auto_2576935 ?auto_2576940 ) ) ( not ( = ?auto_2576935 ?auto_2576941 ) ) ( not ( = ?auto_2576935 ?auto_2576942 ) ) ( not ( = ?auto_2576935 ?auto_2576945 ) ) ( not ( = ?auto_2576934 ?auto_2576936 ) ) ( not ( = ?auto_2576934 ?auto_2576937 ) ) ( not ( = ?auto_2576934 ?auto_2576938 ) ) ( not ( = ?auto_2576934 ?auto_2576939 ) ) ( not ( = ?auto_2576934 ?auto_2576940 ) ) ( not ( = ?auto_2576934 ?auto_2576941 ) ) ( not ( = ?auto_2576934 ?auto_2576942 ) ) ( not ( = ?auto_2576934 ?auto_2576945 ) ) ( not ( = ?auto_2576936 ?auto_2576937 ) ) ( not ( = ?auto_2576936 ?auto_2576938 ) ) ( not ( = ?auto_2576936 ?auto_2576939 ) ) ( not ( = ?auto_2576936 ?auto_2576940 ) ) ( not ( = ?auto_2576936 ?auto_2576941 ) ) ( not ( = ?auto_2576936 ?auto_2576942 ) ) ( not ( = ?auto_2576936 ?auto_2576945 ) ) ( not ( = ?auto_2576937 ?auto_2576938 ) ) ( not ( = ?auto_2576937 ?auto_2576939 ) ) ( not ( = ?auto_2576937 ?auto_2576940 ) ) ( not ( = ?auto_2576937 ?auto_2576941 ) ) ( not ( = ?auto_2576937 ?auto_2576942 ) ) ( not ( = ?auto_2576937 ?auto_2576945 ) ) ( not ( = ?auto_2576938 ?auto_2576939 ) ) ( not ( = ?auto_2576938 ?auto_2576940 ) ) ( not ( = ?auto_2576938 ?auto_2576941 ) ) ( not ( = ?auto_2576938 ?auto_2576942 ) ) ( not ( = ?auto_2576938 ?auto_2576945 ) ) ( not ( = ?auto_2576939 ?auto_2576940 ) ) ( not ( = ?auto_2576939 ?auto_2576941 ) ) ( not ( = ?auto_2576939 ?auto_2576942 ) ) ( not ( = ?auto_2576939 ?auto_2576945 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2576940 ?auto_2576941 ?auto_2576942 )
      ( MAKE-13CRATE-VERIFY ?auto_2576930 ?auto_2576931 ?auto_2576932 ?auto_2576929 ?auto_2576933 ?auto_2576935 ?auto_2576934 ?auto_2576936 ?auto_2576937 ?auto_2576938 ?auto_2576939 ?auto_2576940 ?auto_2576941 ?auto_2576942 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2577113 - SURFACE
      ?auto_2577114 - SURFACE
      ?auto_2577115 - SURFACE
      ?auto_2577112 - SURFACE
      ?auto_2577116 - SURFACE
      ?auto_2577118 - SURFACE
      ?auto_2577117 - SURFACE
      ?auto_2577119 - SURFACE
      ?auto_2577120 - SURFACE
      ?auto_2577121 - SURFACE
      ?auto_2577122 - SURFACE
      ?auto_2577123 - SURFACE
      ?auto_2577124 - SURFACE
      ?auto_2577125 - SURFACE
    )
    :vars
    (
      ?auto_2577128 - HOIST
      ?auto_2577129 - PLACE
      ?auto_2577131 - PLACE
      ?auto_2577126 - HOIST
      ?auto_2577127 - SURFACE
      ?auto_2577130 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2577128 ?auto_2577129 ) ( IS-CRATE ?auto_2577125 ) ( not ( = ?auto_2577124 ?auto_2577125 ) ) ( not ( = ?auto_2577123 ?auto_2577124 ) ) ( not ( = ?auto_2577123 ?auto_2577125 ) ) ( not ( = ?auto_2577131 ?auto_2577129 ) ) ( HOIST-AT ?auto_2577126 ?auto_2577131 ) ( not ( = ?auto_2577128 ?auto_2577126 ) ) ( AVAILABLE ?auto_2577126 ) ( SURFACE-AT ?auto_2577125 ?auto_2577131 ) ( ON ?auto_2577125 ?auto_2577127 ) ( CLEAR ?auto_2577125 ) ( not ( = ?auto_2577124 ?auto_2577127 ) ) ( not ( = ?auto_2577125 ?auto_2577127 ) ) ( not ( = ?auto_2577123 ?auto_2577127 ) ) ( TRUCK-AT ?auto_2577130 ?auto_2577129 ) ( SURFACE-AT ?auto_2577123 ?auto_2577129 ) ( CLEAR ?auto_2577123 ) ( IS-CRATE ?auto_2577124 ) ( AVAILABLE ?auto_2577128 ) ( IN ?auto_2577124 ?auto_2577130 ) ( ON ?auto_2577114 ?auto_2577113 ) ( ON ?auto_2577115 ?auto_2577114 ) ( ON ?auto_2577112 ?auto_2577115 ) ( ON ?auto_2577116 ?auto_2577112 ) ( ON ?auto_2577118 ?auto_2577116 ) ( ON ?auto_2577117 ?auto_2577118 ) ( ON ?auto_2577119 ?auto_2577117 ) ( ON ?auto_2577120 ?auto_2577119 ) ( ON ?auto_2577121 ?auto_2577120 ) ( ON ?auto_2577122 ?auto_2577121 ) ( ON ?auto_2577123 ?auto_2577122 ) ( not ( = ?auto_2577113 ?auto_2577114 ) ) ( not ( = ?auto_2577113 ?auto_2577115 ) ) ( not ( = ?auto_2577113 ?auto_2577112 ) ) ( not ( = ?auto_2577113 ?auto_2577116 ) ) ( not ( = ?auto_2577113 ?auto_2577118 ) ) ( not ( = ?auto_2577113 ?auto_2577117 ) ) ( not ( = ?auto_2577113 ?auto_2577119 ) ) ( not ( = ?auto_2577113 ?auto_2577120 ) ) ( not ( = ?auto_2577113 ?auto_2577121 ) ) ( not ( = ?auto_2577113 ?auto_2577122 ) ) ( not ( = ?auto_2577113 ?auto_2577123 ) ) ( not ( = ?auto_2577113 ?auto_2577124 ) ) ( not ( = ?auto_2577113 ?auto_2577125 ) ) ( not ( = ?auto_2577113 ?auto_2577127 ) ) ( not ( = ?auto_2577114 ?auto_2577115 ) ) ( not ( = ?auto_2577114 ?auto_2577112 ) ) ( not ( = ?auto_2577114 ?auto_2577116 ) ) ( not ( = ?auto_2577114 ?auto_2577118 ) ) ( not ( = ?auto_2577114 ?auto_2577117 ) ) ( not ( = ?auto_2577114 ?auto_2577119 ) ) ( not ( = ?auto_2577114 ?auto_2577120 ) ) ( not ( = ?auto_2577114 ?auto_2577121 ) ) ( not ( = ?auto_2577114 ?auto_2577122 ) ) ( not ( = ?auto_2577114 ?auto_2577123 ) ) ( not ( = ?auto_2577114 ?auto_2577124 ) ) ( not ( = ?auto_2577114 ?auto_2577125 ) ) ( not ( = ?auto_2577114 ?auto_2577127 ) ) ( not ( = ?auto_2577115 ?auto_2577112 ) ) ( not ( = ?auto_2577115 ?auto_2577116 ) ) ( not ( = ?auto_2577115 ?auto_2577118 ) ) ( not ( = ?auto_2577115 ?auto_2577117 ) ) ( not ( = ?auto_2577115 ?auto_2577119 ) ) ( not ( = ?auto_2577115 ?auto_2577120 ) ) ( not ( = ?auto_2577115 ?auto_2577121 ) ) ( not ( = ?auto_2577115 ?auto_2577122 ) ) ( not ( = ?auto_2577115 ?auto_2577123 ) ) ( not ( = ?auto_2577115 ?auto_2577124 ) ) ( not ( = ?auto_2577115 ?auto_2577125 ) ) ( not ( = ?auto_2577115 ?auto_2577127 ) ) ( not ( = ?auto_2577112 ?auto_2577116 ) ) ( not ( = ?auto_2577112 ?auto_2577118 ) ) ( not ( = ?auto_2577112 ?auto_2577117 ) ) ( not ( = ?auto_2577112 ?auto_2577119 ) ) ( not ( = ?auto_2577112 ?auto_2577120 ) ) ( not ( = ?auto_2577112 ?auto_2577121 ) ) ( not ( = ?auto_2577112 ?auto_2577122 ) ) ( not ( = ?auto_2577112 ?auto_2577123 ) ) ( not ( = ?auto_2577112 ?auto_2577124 ) ) ( not ( = ?auto_2577112 ?auto_2577125 ) ) ( not ( = ?auto_2577112 ?auto_2577127 ) ) ( not ( = ?auto_2577116 ?auto_2577118 ) ) ( not ( = ?auto_2577116 ?auto_2577117 ) ) ( not ( = ?auto_2577116 ?auto_2577119 ) ) ( not ( = ?auto_2577116 ?auto_2577120 ) ) ( not ( = ?auto_2577116 ?auto_2577121 ) ) ( not ( = ?auto_2577116 ?auto_2577122 ) ) ( not ( = ?auto_2577116 ?auto_2577123 ) ) ( not ( = ?auto_2577116 ?auto_2577124 ) ) ( not ( = ?auto_2577116 ?auto_2577125 ) ) ( not ( = ?auto_2577116 ?auto_2577127 ) ) ( not ( = ?auto_2577118 ?auto_2577117 ) ) ( not ( = ?auto_2577118 ?auto_2577119 ) ) ( not ( = ?auto_2577118 ?auto_2577120 ) ) ( not ( = ?auto_2577118 ?auto_2577121 ) ) ( not ( = ?auto_2577118 ?auto_2577122 ) ) ( not ( = ?auto_2577118 ?auto_2577123 ) ) ( not ( = ?auto_2577118 ?auto_2577124 ) ) ( not ( = ?auto_2577118 ?auto_2577125 ) ) ( not ( = ?auto_2577118 ?auto_2577127 ) ) ( not ( = ?auto_2577117 ?auto_2577119 ) ) ( not ( = ?auto_2577117 ?auto_2577120 ) ) ( not ( = ?auto_2577117 ?auto_2577121 ) ) ( not ( = ?auto_2577117 ?auto_2577122 ) ) ( not ( = ?auto_2577117 ?auto_2577123 ) ) ( not ( = ?auto_2577117 ?auto_2577124 ) ) ( not ( = ?auto_2577117 ?auto_2577125 ) ) ( not ( = ?auto_2577117 ?auto_2577127 ) ) ( not ( = ?auto_2577119 ?auto_2577120 ) ) ( not ( = ?auto_2577119 ?auto_2577121 ) ) ( not ( = ?auto_2577119 ?auto_2577122 ) ) ( not ( = ?auto_2577119 ?auto_2577123 ) ) ( not ( = ?auto_2577119 ?auto_2577124 ) ) ( not ( = ?auto_2577119 ?auto_2577125 ) ) ( not ( = ?auto_2577119 ?auto_2577127 ) ) ( not ( = ?auto_2577120 ?auto_2577121 ) ) ( not ( = ?auto_2577120 ?auto_2577122 ) ) ( not ( = ?auto_2577120 ?auto_2577123 ) ) ( not ( = ?auto_2577120 ?auto_2577124 ) ) ( not ( = ?auto_2577120 ?auto_2577125 ) ) ( not ( = ?auto_2577120 ?auto_2577127 ) ) ( not ( = ?auto_2577121 ?auto_2577122 ) ) ( not ( = ?auto_2577121 ?auto_2577123 ) ) ( not ( = ?auto_2577121 ?auto_2577124 ) ) ( not ( = ?auto_2577121 ?auto_2577125 ) ) ( not ( = ?auto_2577121 ?auto_2577127 ) ) ( not ( = ?auto_2577122 ?auto_2577123 ) ) ( not ( = ?auto_2577122 ?auto_2577124 ) ) ( not ( = ?auto_2577122 ?auto_2577125 ) ) ( not ( = ?auto_2577122 ?auto_2577127 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2577123 ?auto_2577124 ?auto_2577125 )
      ( MAKE-13CRATE-VERIFY ?auto_2577113 ?auto_2577114 ?auto_2577115 ?auto_2577112 ?auto_2577116 ?auto_2577118 ?auto_2577117 ?auto_2577119 ?auto_2577120 ?auto_2577121 ?auto_2577122 ?auto_2577123 ?auto_2577124 ?auto_2577125 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2591354 - SURFACE
      ?auto_2591355 - SURFACE
      ?auto_2591356 - SURFACE
      ?auto_2591353 - SURFACE
      ?auto_2591357 - SURFACE
      ?auto_2591359 - SURFACE
      ?auto_2591358 - SURFACE
      ?auto_2591360 - SURFACE
      ?auto_2591361 - SURFACE
      ?auto_2591362 - SURFACE
      ?auto_2591363 - SURFACE
      ?auto_2591364 - SURFACE
      ?auto_2591365 - SURFACE
      ?auto_2591366 - SURFACE
      ?auto_2591367 - SURFACE
    )
    :vars
    (
      ?auto_2591368 - HOIST
      ?auto_2591369 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2591368 ?auto_2591369 ) ( SURFACE-AT ?auto_2591366 ?auto_2591369 ) ( CLEAR ?auto_2591366 ) ( LIFTING ?auto_2591368 ?auto_2591367 ) ( IS-CRATE ?auto_2591367 ) ( not ( = ?auto_2591366 ?auto_2591367 ) ) ( ON ?auto_2591355 ?auto_2591354 ) ( ON ?auto_2591356 ?auto_2591355 ) ( ON ?auto_2591353 ?auto_2591356 ) ( ON ?auto_2591357 ?auto_2591353 ) ( ON ?auto_2591359 ?auto_2591357 ) ( ON ?auto_2591358 ?auto_2591359 ) ( ON ?auto_2591360 ?auto_2591358 ) ( ON ?auto_2591361 ?auto_2591360 ) ( ON ?auto_2591362 ?auto_2591361 ) ( ON ?auto_2591363 ?auto_2591362 ) ( ON ?auto_2591364 ?auto_2591363 ) ( ON ?auto_2591365 ?auto_2591364 ) ( ON ?auto_2591366 ?auto_2591365 ) ( not ( = ?auto_2591354 ?auto_2591355 ) ) ( not ( = ?auto_2591354 ?auto_2591356 ) ) ( not ( = ?auto_2591354 ?auto_2591353 ) ) ( not ( = ?auto_2591354 ?auto_2591357 ) ) ( not ( = ?auto_2591354 ?auto_2591359 ) ) ( not ( = ?auto_2591354 ?auto_2591358 ) ) ( not ( = ?auto_2591354 ?auto_2591360 ) ) ( not ( = ?auto_2591354 ?auto_2591361 ) ) ( not ( = ?auto_2591354 ?auto_2591362 ) ) ( not ( = ?auto_2591354 ?auto_2591363 ) ) ( not ( = ?auto_2591354 ?auto_2591364 ) ) ( not ( = ?auto_2591354 ?auto_2591365 ) ) ( not ( = ?auto_2591354 ?auto_2591366 ) ) ( not ( = ?auto_2591354 ?auto_2591367 ) ) ( not ( = ?auto_2591355 ?auto_2591356 ) ) ( not ( = ?auto_2591355 ?auto_2591353 ) ) ( not ( = ?auto_2591355 ?auto_2591357 ) ) ( not ( = ?auto_2591355 ?auto_2591359 ) ) ( not ( = ?auto_2591355 ?auto_2591358 ) ) ( not ( = ?auto_2591355 ?auto_2591360 ) ) ( not ( = ?auto_2591355 ?auto_2591361 ) ) ( not ( = ?auto_2591355 ?auto_2591362 ) ) ( not ( = ?auto_2591355 ?auto_2591363 ) ) ( not ( = ?auto_2591355 ?auto_2591364 ) ) ( not ( = ?auto_2591355 ?auto_2591365 ) ) ( not ( = ?auto_2591355 ?auto_2591366 ) ) ( not ( = ?auto_2591355 ?auto_2591367 ) ) ( not ( = ?auto_2591356 ?auto_2591353 ) ) ( not ( = ?auto_2591356 ?auto_2591357 ) ) ( not ( = ?auto_2591356 ?auto_2591359 ) ) ( not ( = ?auto_2591356 ?auto_2591358 ) ) ( not ( = ?auto_2591356 ?auto_2591360 ) ) ( not ( = ?auto_2591356 ?auto_2591361 ) ) ( not ( = ?auto_2591356 ?auto_2591362 ) ) ( not ( = ?auto_2591356 ?auto_2591363 ) ) ( not ( = ?auto_2591356 ?auto_2591364 ) ) ( not ( = ?auto_2591356 ?auto_2591365 ) ) ( not ( = ?auto_2591356 ?auto_2591366 ) ) ( not ( = ?auto_2591356 ?auto_2591367 ) ) ( not ( = ?auto_2591353 ?auto_2591357 ) ) ( not ( = ?auto_2591353 ?auto_2591359 ) ) ( not ( = ?auto_2591353 ?auto_2591358 ) ) ( not ( = ?auto_2591353 ?auto_2591360 ) ) ( not ( = ?auto_2591353 ?auto_2591361 ) ) ( not ( = ?auto_2591353 ?auto_2591362 ) ) ( not ( = ?auto_2591353 ?auto_2591363 ) ) ( not ( = ?auto_2591353 ?auto_2591364 ) ) ( not ( = ?auto_2591353 ?auto_2591365 ) ) ( not ( = ?auto_2591353 ?auto_2591366 ) ) ( not ( = ?auto_2591353 ?auto_2591367 ) ) ( not ( = ?auto_2591357 ?auto_2591359 ) ) ( not ( = ?auto_2591357 ?auto_2591358 ) ) ( not ( = ?auto_2591357 ?auto_2591360 ) ) ( not ( = ?auto_2591357 ?auto_2591361 ) ) ( not ( = ?auto_2591357 ?auto_2591362 ) ) ( not ( = ?auto_2591357 ?auto_2591363 ) ) ( not ( = ?auto_2591357 ?auto_2591364 ) ) ( not ( = ?auto_2591357 ?auto_2591365 ) ) ( not ( = ?auto_2591357 ?auto_2591366 ) ) ( not ( = ?auto_2591357 ?auto_2591367 ) ) ( not ( = ?auto_2591359 ?auto_2591358 ) ) ( not ( = ?auto_2591359 ?auto_2591360 ) ) ( not ( = ?auto_2591359 ?auto_2591361 ) ) ( not ( = ?auto_2591359 ?auto_2591362 ) ) ( not ( = ?auto_2591359 ?auto_2591363 ) ) ( not ( = ?auto_2591359 ?auto_2591364 ) ) ( not ( = ?auto_2591359 ?auto_2591365 ) ) ( not ( = ?auto_2591359 ?auto_2591366 ) ) ( not ( = ?auto_2591359 ?auto_2591367 ) ) ( not ( = ?auto_2591358 ?auto_2591360 ) ) ( not ( = ?auto_2591358 ?auto_2591361 ) ) ( not ( = ?auto_2591358 ?auto_2591362 ) ) ( not ( = ?auto_2591358 ?auto_2591363 ) ) ( not ( = ?auto_2591358 ?auto_2591364 ) ) ( not ( = ?auto_2591358 ?auto_2591365 ) ) ( not ( = ?auto_2591358 ?auto_2591366 ) ) ( not ( = ?auto_2591358 ?auto_2591367 ) ) ( not ( = ?auto_2591360 ?auto_2591361 ) ) ( not ( = ?auto_2591360 ?auto_2591362 ) ) ( not ( = ?auto_2591360 ?auto_2591363 ) ) ( not ( = ?auto_2591360 ?auto_2591364 ) ) ( not ( = ?auto_2591360 ?auto_2591365 ) ) ( not ( = ?auto_2591360 ?auto_2591366 ) ) ( not ( = ?auto_2591360 ?auto_2591367 ) ) ( not ( = ?auto_2591361 ?auto_2591362 ) ) ( not ( = ?auto_2591361 ?auto_2591363 ) ) ( not ( = ?auto_2591361 ?auto_2591364 ) ) ( not ( = ?auto_2591361 ?auto_2591365 ) ) ( not ( = ?auto_2591361 ?auto_2591366 ) ) ( not ( = ?auto_2591361 ?auto_2591367 ) ) ( not ( = ?auto_2591362 ?auto_2591363 ) ) ( not ( = ?auto_2591362 ?auto_2591364 ) ) ( not ( = ?auto_2591362 ?auto_2591365 ) ) ( not ( = ?auto_2591362 ?auto_2591366 ) ) ( not ( = ?auto_2591362 ?auto_2591367 ) ) ( not ( = ?auto_2591363 ?auto_2591364 ) ) ( not ( = ?auto_2591363 ?auto_2591365 ) ) ( not ( = ?auto_2591363 ?auto_2591366 ) ) ( not ( = ?auto_2591363 ?auto_2591367 ) ) ( not ( = ?auto_2591364 ?auto_2591365 ) ) ( not ( = ?auto_2591364 ?auto_2591366 ) ) ( not ( = ?auto_2591364 ?auto_2591367 ) ) ( not ( = ?auto_2591365 ?auto_2591366 ) ) ( not ( = ?auto_2591365 ?auto_2591367 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2591366 ?auto_2591367 )
      ( MAKE-14CRATE-VERIFY ?auto_2591354 ?auto_2591355 ?auto_2591356 ?auto_2591353 ?auto_2591357 ?auto_2591359 ?auto_2591358 ?auto_2591360 ?auto_2591361 ?auto_2591362 ?auto_2591363 ?auto_2591364 ?auto_2591365 ?auto_2591366 ?auto_2591367 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2591514 - SURFACE
      ?auto_2591515 - SURFACE
      ?auto_2591516 - SURFACE
      ?auto_2591513 - SURFACE
      ?auto_2591517 - SURFACE
      ?auto_2591519 - SURFACE
      ?auto_2591518 - SURFACE
      ?auto_2591520 - SURFACE
      ?auto_2591521 - SURFACE
      ?auto_2591522 - SURFACE
      ?auto_2591523 - SURFACE
      ?auto_2591524 - SURFACE
      ?auto_2591525 - SURFACE
      ?auto_2591526 - SURFACE
      ?auto_2591527 - SURFACE
    )
    :vars
    (
      ?auto_2591528 - HOIST
      ?auto_2591529 - PLACE
      ?auto_2591530 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2591528 ?auto_2591529 ) ( SURFACE-AT ?auto_2591526 ?auto_2591529 ) ( CLEAR ?auto_2591526 ) ( IS-CRATE ?auto_2591527 ) ( not ( = ?auto_2591526 ?auto_2591527 ) ) ( TRUCK-AT ?auto_2591530 ?auto_2591529 ) ( AVAILABLE ?auto_2591528 ) ( IN ?auto_2591527 ?auto_2591530 ) ( ON ?auto_2591526 ?auto_2591525 ) ( not ( = ?auto_2591525 ?auto_2591526 ) ) ( not ( = ?auto_2591525 ?auto_2591527 ) ) ( ON ?auto_2591515 ?auto_2591514 ) ( ON ?auto_2591516 ?auto_2591515 ) ( ON ?auto_2591513 ?auto_2591516 ) ( ON ?auto_2591517 ?auto_2591513 ) ( ON ?auto_2591519 ?auto_2591517 ) ( ON ?auto_2591518 ?auto_2591519 ) ( ON ?auto_2591520 ?auto_2591518 ) ( ON ?auto_2591521 ?auto_2591520 ) ( ON ?auto_2591522 ?auto_2591521 ) ( ON ?auto_2591523 ?auto_2591522 ) ( ON ?auto_2591524 ?auto_2591523 ) ( ON ?auto_2591525 ?auto_2591524 ) ( not ( = ?auto_2591514 ?auto_2591515 ) ) ( not ( = ?auto_2591514 ?auto_2591516 ) ) ( not ( = ?auto_2591514 ?auto_2591513 ) ) ( not ( = ?auto_2591514 ?auto_2591517 ) ) ( not ( = ?auto_2591514 ?auto_2591519 ) ) ( not ( = ?auto_2591514 ?auto_2591518 ) ) ( not ( = ?auto_2591514 ?auto_2591520 ) ) ( not ( = ?auto_2591514 ?auto_2591521 ) ) ( not ( = ?auto_2591514 ?auto_2591522 ) ) ( not ( = ?auto_2591514 ?auto_2591523 ) ) ( not ( = ?auto_2591514 ?auto_2591524 ) ) ( not ( = ?auto_2591514 ?auto_2591525 ) ) ( not ( = ?auto_2591514 ?auto_2591526 ) ) ( not ( = ?auto_2591514 ?auto_2591527 ) ) ( not ( = ?auto_2591515 ?auto_2591516 ) ) ( not ( = ?auto_2591515 ?auto_2591513 ) ) ( not ( = ?auto_2591515 ?auto_2591517 ) ) ( not ( = ?auto_2591515 ?auto_2591519 ) ) ( not ( = ?auto_2591515 ?auto_2591518 ) ) ( not ( = ?auto_2591515 ?auto_2591520 ) ) ( not ( = ?auto_2591515 ?auto_2591521 ) ) ( not ( = ?auto_2591515 ?auto_2591522 ) ) ( not ( = ?auto_2591515 ?auto_2591523 ) ) ( not ( = ?auto_2591515 ?auto_2591524 ) ) ( not ( = ?auto_2591515 ?auto_2591525 ) ) ( not ( = ?auto_2591515 ?auto_2591526 ) ) ( not ( = ?auto_2591515 ?auto_2591527 ) ) ( not ( = ?auto_2591516 ?auto_2591513 ) ) ( not ( = ?auto_2591516 ?auto_2591517 ) ) ( not ( = ?auto_2591516 ?auto_2591519 ) ) ( not ( = ?auto_2591516 ?auto_2591518 ) ) ( not ( = ?auto_2591516 ?auto_2591520 ) ) ( not ( = ?auto_2591516 ?auto_2591521 ) ) ( not ( = ?auto_2591516 ?auto_2591522 ) ) ( not ( = ?auto_2591516 ?auto_2591523 ) ) ( not ( = ?auto_2591516 ?auto_2591524 ) ) ( not ( = ?auto_2591516 ?auto_2591525 ) ) ( not ( = ?auto_2591516 ?auto_2591526 ) ) ( not ( = ?auto_2591516 ?auto_2591527 ) ) ( not ( = ?auto_2591513 ?auto_2591517 ) ) ( not ( = ?auto_2591513 ?auto_2591519 ) ) ( not ( = ?auto_2591513 ?auto_2591518 ) ) ( not ( = ?auto_2591513 ?auto_2591520 ) ) ( not ( = ?auto_2591513 ?auto_2591521 ) ) ( not ( = ?auto_2591513 ?auto_2591522 ) ) ( not ( = ?auto_2591513 ?auto_2591523 ) ) ( not ( = ?auto_2591513 ?auto_2591524 ) ) ( not ( = ?auto_2591513 ?auto_2591525 ) ) ( not ( = ?auto_2591513 ?auto_2591526 ) ) ( not ( = ?auto_2591513 ?auto_2591527 ) ) ( not ( = ?auto_2591517 ?auto_2591519 ) ) ( not ( = ?auto_2591517 ?auto_2591518 ) ) ( not ( = ?auto_2591517 ?auto_2591520 ) ) ( not ( = ?auto_2591517 ?auto_2591521 ) ) ( not ( = ?auto_2591517 ?auto_2591522 ) ) ( not ( = ?auto_2591517 ?auto_2591523 ) ) ( not ( = ?auto_2591517 ?auto_2591524 ) ) ( not ( = ?auto_2591517 ?auto_2591525 ) ) ( not ( = ?auto_2591517 ?auto_2591526 ) ) ( not ( = ?auto_2591517 ?auto_2591527 ) ) ( not ( = ?auto_2591519 ?auto_2591518 ) ) ( not ( = ?auto_2591519 ?auto_2591520 ) ) ( not ( = ?auto_2591519 ?auto_2591521 ) ) ( not ( = ?auto_2591519 ?auto_2591522 ) ) ( not ( = ?auto_2591519 ?auto_2591523 ) ) ( not ( = ?auto_2591519 ?auto_2591524 ) ) ( not ( = ?auto_2591519 ?auto_2591525 ) ) ( not ( = ?auto_2591519 ?auto_2591526 ) ) ( not ( = ?auto_2591519 ?auto_2591527 ) ) ( not ( = ?auto_2591518 ?auto_2591520 ) ) ( not ( = ?auto_2591518 ?auto_2591521 ) ) ( not ( = ?auto_2591518 ?auto_2591522 ) ) ( not ( = ?auto_2591518 ?auto_2591523 ) ) ( not ( = ?auto_2591518 ?auto_2591524 ) ) ( not ( = ?auto_2591518 ?auto_2591525 ) ) ( not ( = ?auto_2591518 ?auto_2591526 ) ) ( not ( = ?auto_2591518 ?auto_2591527 ) ) ( not ( = ?auto_2591520 ?auto_2591521 ) ) ( not ( = ?auto_2591520 ?auto_2591522 ) ) ( not ( = ?auto_2591520 ?auto_2591523 ) ) ( not ( = ?auto_2591520 ?auto_2591524 ) ) ( not ( = ?auto_2591520 ?auto_2591525 ) ) ( not ( = ?auto_2591520 ?auto_2591526 ) ) ( not ( = ?auto_2591520 ?auto_2591527 ) ) ( not ( = ?auto_2591521 ?auto_2591522 ) ) ( not ( = ?auto_2591521 ?auto_2591523 ) ) ( not ( = ?auto_2591521 ?auto_2591524 ) ) ( not ( = ?auto_2591521 ?auto_2591525 ) ) ( not ( = ?auto_2591521 ?auto_2591526 ) ) ( not ( = ?auto_2591521 ?auto_2591527 ) ) ( not ( = ?auto_2591522 ?auto_2591523 ) ) ( not ( = ?auto_2591522 ?auto_2591524 ) ) ( not ( = ?auto_2591522 ?auto_2591525 ) ) ( not ( = ?auto_2591522 ?auto_2591526 ) ) ( not ( = ?auto_2591522 ?auto_2591527 ) ) ( not ( = ?auto_2591523 ?auto_2591524 ) ) ( not ( = ?auto_2591523 ?auto_2591525 ) ) ( not ( = ?auto_2591523 ?auto_2591526 ) ) ( not ( = ?auto_2591523 ?auto_2591527 ) ) ( not ( = ?auto_2591524 ?auto_2591525 ) ) ( not ( = ?auto_2591524 ?auto_2591526 ) ) ( not ( = ?auto_2591524 ?auto_2591527 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2591525 ?auto_2591526 ?auto_2591527 )
      ( MAKE-14CRATE-VERIFY ?auto_2591514 ?auto_2591515 ?auto_2591516 ?auto_2591513 ?auto_2591517 ?auto_2591519 ?auto_2591518 ?auto_2591520 ?auto_2591521 ?auto_2591522 ?auto_2591523 ?auto_2591524 ?auto_2591525 ?auto_2591526 ?auto_2591527 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2591689 - SURFACE
      ?auto_2591690 - SURFACE
      ?auto_2591691 - SURFACE
      ?auto_2591688 - SURFACE
      ?auto_2591692 - SURFACE
      ?auto_2591694 - SURFACE
      ?auto_2591693 - SURFACE
      ?auto_2591695 - SURFACE
      ?auto_2591696 - SURFACE
      ?auto_2591697 - SURFACE
      ?auto_2591698 - SURFACE
      ?auto_2591699 - SURFACE
      ?auto_2591700 - SURFACE
      ?auto_2591701 - SURFACE
      ?auto_2591702 - SURFACE
    )
    :vars
    (
      ?auto_2591706 - HOIST
      ?auto_2591704 - PLACE
      ?auto_2591705 - TRUCK
      ?auto_2591703 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2591706 ?auto_2591704 ) ( SURFACE-AT ?auto_2591701 ?auto_2591704 ) ( CLEAR ?auto_2591701 ) ( IS-CRATE ?auto_2591702 ) ( not ( = ?auto_2591701 ?auto_2591702 ) ) ( AVAILABLE ?auto_2591706 ) ( IN ?auto_2591702 ?auto_2591705 ) ( ON ?auto_2591701 ?auto_2591700 ) ( not ( = ?auto_2591700 ?auto_2591701 ) ) ( not ( = ?auto_2591700 ?auto_2591702 ) ) ( TRUCK-AT ?auto_2591705 ?auto_2591703 ) ( not ( = ?auto_2591703 ?auto_2591704 ) ) ( ON ?auto_2591690 ?auto_2591689 ) ( ON ?auto_2591691 ?auto_2591690 ) ( ON ?auto_2591688 ?auto_2591691 ) ( ON ?auto_2591692 ?auto_2591688 ) ( ON ?auto_2591694 ?auto_2591692 ) ( ON ?auto_2591693 ?auto_2591694 ) ( ON ?auto_2591695 ?auto_2591693 ) ( ON ?auto_2591696 ?auto_2591695 ) ( ON ?auto_2591697 ?auto_2591696 ) ( ON ?auto_2591698 ?auto_2591697 ) ( ON ?auto_2591699 ?auto_2591698 ) ( ON ?auto_2591700 ?auto_2591699 ) ( not ( = ?auto_2591689 ?auto_2591690 ) ) ( not ( = ?auto_2591689 ?auto_2591691 ) ) ( not ( = ?auto_2591689 ?auto_2591688 ) ) ( not ( = ?auto_2591689 ?auto_2591692 ) ) ( not ( = ?auto_2591689 ?auto_2591694 ) ) ( not ( = ?auto_2591689 ?auto_2591693 ) ) ( not ( = ?auto_2591689 ?auto_2591695 ) ) ( not ( = ?auto_2591689 ?auto_2591696 ) ) ( not ( = ?auto_2591689 ?auto_2591697 ) ) ( not ( = ?auto_2591689 ?auto_2591698 ) ) ( not ( = ?auto_2591689 ?auto_2591699 ) ) ( not ( = ?auto_2591689 ?auto_2591700 ) ) ( not ( = ?auto_2591689 ?auto_2591701 ) ) ( not ( = ?auto_2591689 ?auto_2591702 ) ) ( not ( = ?auto_2591690 ?auto_2591691 ) ) ( not ( = ?auto_2591690 ?auto_2591688 ) ) ( not ( = ?auto_2591690 ?auto_2591692 ) ) ( not ( = ?auto_2591690 ?auto_2591694 ) ) ( not ( = ?auto_2591690 ?auto_2591693 ) ) ( not ( = ?auto_2591690 ?auto_2591695 ) ) ( not ( = ?auto_2591690 ?auto_2591696 ) ) ( not ( = ?auto_2591690 ?auto_2591697 ) ) ( not ( = ?auto_2591690 ?auto_2591698 ) ) ( not ( = ?auto_2591690 ?auto_2591699 ) ) ( not ( = ?auto_2591690 ?auto_2591700 ) ) ( not ( = ?auto_2591690 ?auto_2591701 ) ) ( not ( = ?auto_2591690 ?auto_2591702 ) ) ( not ( = ?auto_2591691 ?auto_2591688 ) ) ( not ( = ?auto_2591691 ?auto_2591692 ) ) ( not ( = ?auto_2591691 ?auto_2591694 ) ) ( not ( = ?auto_2591691 ?auto_2591693 ) ) ( not ( = ?auto_2591691 ?auto_2591695 ) ) ( not ( = ?auto_2591691 ?auto_2591696 ) ) ( not ( = ?auto_2591691 ?auto_2591697 ) ) ( not ( = ?auto_2591691 ?auto_2591698 ) ) ( not ( = ?auto_2591691 ?auto_2591699 ) ) ( not ( = ?auto_2591691 ?auto_2591700 ) ) ( not ( = ?auto_2591691 ?auto_2591701 ) ) ( not ( = ?auto_2591691 ?auto_2591702 ) ) ( not ( = ?auto_2591688 ?auto_2591692 ) ) ( not ( = ?auto_2591688 ?auto_2591694 ) ) ( not ( = ?auto_2591688 ?auto_2591693 ) ) ( not ( = ?auto_2591688 ?auto_2591695 ) ) ( not ( = ?auto_2591688 ?auto_2591696 ) ) ( not ( = ?auto_2591688 ?auto_2591697 ) ) ( not ( = ?auto_2591688 ?auto_2591698 ) ) ( not ( = ?auto_2591688 ?auto_2591699 ) ) ( not ( = ?auto_2591688 ?auto_2591700 ) ) ( not ( = ?auto_2591688 ?auto_2591701 ) ) ( not ( = ?auto_2591688 ?auto_2591702 ) ) ( not ( = ?auto_2591692 ?auto_2591694 ) ) ( not ( = ?auto_2591692 ?auto_2591693 ) ) ( not ( = ?auto_2591692 ?auto_2591695 ) ) ( not ( = ?auto_2591692 ?auto_2591696 ) ) ( not ( = ?auto_2591692 ?auto_2591697 ) ) ( not ( = ?auto_2591692 ?auto_2591698 ) ) ( not ( = ?auto_2591692 ?auto_2591699 ) ) ( not ( = ?auto_2591692 ?auto_2591700 ) ) ( not ( = ?auto_2591692 ?auto_2591701 ) ) ( not ( = ?auto_2591692 ?auto_2591702 ) ) ( not ( = ?auto_2591694 ?auto_2591693 ) ) ( not ( = ?auto_2591694 ?auto_2591695 ) ) ( not ( = ?auto_2591694 ?auto_2591696 ) ) ( not ( = ?auto_2591694 ?auto_2591697 ) ) ( not ( = ?auto_2591694 ?auto_2591698 ) ) ( not ( = ?auto_2591694 ?auto_2591699 ) ) ( not ( = ?auto_2591694 ?auto_2591700 ) ) ( not ( = ?auto_2591694 ?auto_2591701 ) ) ( not ( = ?auto_2591694 ?auto_2591702 ) ) ( not ( = ?auto_2591693 ?auto_2591695 ) ) ( not ( = ?auto_2591693 ?auto_2591696 ) ) ( not ( = ?auto_2591693 ?auto_2591697 ) ) ( not ( = ?auto_2591693 ?auto_2591698 ) ) ( not ( = ?auto_2591693 ?auto_2591699 ) ) ( not ( = ?auto_2591693 ?auto_2591700 ) ) ( not ( = ?auto_2591693 ?auto_2591701 ) ) ( not ( = ?auto_2591693 ?auto_2591702 ) ) ( not ( = ?auto_2591695 ?auto_2591696 ) ) ( not ( = ?auto_2591695 ?auto_2591697 ) ) ( not ( = ?auto_2591695 ?auto_2591698 ) ) ( not ( = ?auto_2591695 ?auto_2591699 ) ) ( not ( = ?auto_2591695 ?auto_2591700 ) ) ( not ( = ?auto_2591695 ?auto_2591701 ) ) ( not ( = ?auto_2591695 ?auto_2591702 ) ) ( not ( = ?auto_2591696 ?auto_2591697 ) ) ( not ( = ?auto_2591696 ?auto_2591698 ) ) ( not ( = ?auto_2591696 ?auto_2591699 ) ) ( not ( = ?auto_2591696 ?auto_2591700 ) ) ( not ( = ?auto_2591696 ?auto_2591701 ) ) ( not ( = ?auto_2591696 ?auto_2591702 ) ) ( not ( = ?auto_2591697 ?auto_2591698 ) ) ( not ( = ?auto_2591697 ?auto_2591699 ) ) ( not ( = ?auto_2591697 ?auto_2591700 ) ) ( not ( = ?auto_2591697 ?auto_2591701 ) ) ( not ( = ?auto_2591697 ?auto_2591702 ) ) ( not ( = ?auto_2591698 ?auto_2591699 ) ) ( not ( = ?auto_2591698 ?auto_2591700 ) ) ( not ( = ?auto_2591698 ?auto_2591701 ) ) ( not ( = ?auto_2591698 ?auto_2591702 ) ) ( not ( = ?auto_2591699 ?auto_2591700 ) ) ( not ( = ?auto_2591699 ?auto_2591701 ) ) ( not ( = ?auto_2591699 ?auto_2591702 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2591700 ?auto_2591701 ?auto_2591702 )
      ( MAKE-14CRATE-VERIFY ?auto_2591689 ?auto_2591690 ?auto_2591691 ?auto_2591688 ?auto_2591692 ?auto_2591694 ?auto_2591693 ?auto_2591695 ?auto_2591696 ?auto_2591697 ?auto_2591698 ?auto_2591699 ?auto_2591700 ?auto_2591701 ?auto_2591702 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2591878 - SURFACE
      ?auto_2591879 - SURFACE
      ?auto_2591880 - SURFACE
      ?auto_2591877 - SURFACE
      ?auto_2591881 - SURFACE
      ?auto_2591883 - SURFACE
      ?auto_2591882 - SURFACE
      ?auto_2591884 - SURFACE
      ?auto_2591885 - SURFACE
      ?auto_2591886 - SURFACE
      ?auto_2591887 - SURFACE
      ?auto_2591888 - SURFACE
      ?auto_2591889 - SURFACE
      ?auto_2591890 - SURFACE
      ?auto_2591891 - SURFACE
    )
    :vars
    (
      ?auto_2591892 - HOIST
      ?auto_2591895 - PLACE
      ?auto_2591894 - TRUCK
      ?auto_2591896 - PLACE
      ?auto_2591893 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2591892 ?auto_2591895 ) ( SURFACE-AT ?auto_2591890 ?auto_2591895 ) ( CLEAR ?auto_2591890 ) ( IS-CRATE ?auto_2591891 ) ( not ( = ?auto_2591890 ?auto_2591891 ) ) ( AVAILABLE ?auto_2591892 ) ( ON ?auto_2591890 ?auto_2591889 ) ( not ( = ?auto_2591889 ?auto_2591890 ) ) ( not ( = ?auto_2591889 ?auto_2591891 ) ) ( TRUCK-AT ?auto_2591894 ?auto_2591896 ) ( not ( = ?auto_2591896 ?auto_2591895 ) ) ( HOIST-AT ?auto_2591893 ?auto_2591896 ) ( LIFTING ?auto_2591893 ?auto_2591891 ) ( not ( = ?auto_2591892 ?auto_2591893 ) ) ( ON ?auto_2591879 ?auto_2591878 ) ( ON ?auto_2591880 ?auto_2591879 ) ( ON ?auto_2591877 ?auto_2591880 ) ( ON ?auto_2591881 ?auto_2591877 ) ( ON ?auto_2591883 ?auto_2591881 ) ( ON ?auto_2591882 ?auto_2591883 ) ( ON ?auto_2591884 ?auto_2591882 ) ( ON ?auto_2591885 ?auto_2591884 ) ( ON ?auto_2591886 ?auto_2591885 ) ( ON ?auto_2591887 ?auto_2591886 ) ( ON ?auto_2591888 ?auto_2591887 ) ( ON ?auto_2591889 ?auto_2591888 ) ( not ( = ?auto_2591878 ?auto_2591879 ) ) ( not ( = ?auto_2591878 ?auto_2591880 ) ) ( not ( = ?auto_2591878 ?auto_2591877 ) ) ( not ( = ?auto_2591878 ?auto_2591881 ) ) ( not ( = ?auto_2591878 ?auto_2591883 ) ) ( not ( = ?auto_2591878 ?auto_2591882 ) ) ( not ( = ?auto_2591878 ?auto_2591884 ) ) ( not ( = ?auto_2591878 ?auto_2591885 ) ) ( not ( = ?auto_2591878 ?auto_2591886 ) ) ( not ( = ?auto_2591878 ?auto_2591887 ) ) ( not ( = ?auto_2591878 ?auto_2591888 ) ) ( not ( = ?auto_2591878 ?auto_2591889 ) ) ( not ( = ?auto_2591878 ?auto_2591890 ) ) ( not ( = ?auto_2591878 ?auto_2591891 ) ) ( not ( = ?auto_2591879 ?auto_2591880 ) ) ( not ( = ?auto_2591879 ?auto_2591877 ) ) ( not ( = ?auto_2591879 ?auto_2591881 ) ) ( not ( = ?auto_2591879 ?auto_2591883 ) ) ( not ( = ?auto_2591879 ?auto_2591882 ) ) ( not ( = ?auto_2591879 ?auto_2591884 ) ) ( not ( = ?auto_2591879 ?auto_2591885 ) ) ( not ( = ?auto_2591879 ?auto_2591886 ) ) ( not ( = ?auto_2591879 ?auto_2591887 ) ) ( not ( = ?auto_2591879 ?auto_2591888 ) ) ( not ( = ?auto_2591879 ?auto_2591889 ) ) ( not ( = ?auto_2591879 ?auto_2591890 ) ) ( not ( = ?auto_2591879 ?auto_2591891 ) ) ( not ( = ?auto_2591880 ?auto_2591877 ) ) ( not ( = ?auto_2591880 ?auto_2591881 ) ) ( not ( = ?auto_2591880 ?auto_2591883 ) ) ( not ( = ?auto_2591880 ?auto_2591882 ) ) ( not ( = ?auto_2591880 ?auto_2591884 ) ) ( not ( = ?auto_2591880 ?auto_2591885 ) ) ( not ( = ?auto_2591880 ?auto_2591886 ) ) ( not ( = ?auto_2591880 ?auto_2591887 ) ) ( not ( = ?auto_2591880 ?auto_2591888 ) ) ( not ( = ?auto_2591880 ?auto_2591889 ) ) ( not ( = ?auto_2591880 ?auto_2591890 ) ) ( not ( = ?auto_2591880 ?auto_2591891 ) ) ( not ( = ?auto_2591877 ?auto_2591881 ) ) ( not ( = ?auto_2591877 ?auto_2591883 ) ) ( not ( = ?auto_2591877 ?auto_2591882 ) ) ( not ( = ?auto_2591877 ?auto_2591884 ) ) ( not ( = ?auto_2591877 ?auto_2591885 ) ) ( not ( = ?auto_2591877 ?auto_2591886 ) ) ( not ( = ?auto_2591877 ?auto_2591887 ) ) ( not ( = ?auto_2591877 ?auto_2591888 ) ) ( not ( = ?auto_2591877 ?auto_2591889 ) ) ( not ( = ?auto_2591877 ?auto_2591890 ) ) ( not ( = ?auto_2591877 ?auto_2591891 ) ) ( not ( = ?auto_2591881 ?auto_2591883 ) ) ( not ( = ?auto_2591881 ?auto_2591882 ) ) ( not ( = ?auto_2591881 ?auto_2591884 ) ) ( not ( = ?auto_2591881 ?auto_2591885 ) ) ( not ( = ?auto_2591881 ?auto_2591886 ) ) ( not ( = ?auto_2591881 ?auto_2591887 ) ) ( not ( = ?auto_2591881 ?auto_2591888 ) ) ( not ( = ?auto_2591881 ?auto_2591889 ) ) ( not ( = ?auto_2591881 ?auto_2591890 ) ) ( not ( = ?auto_2591881 ?auto_2591891 ) ) ( not ( = ?auto_2591883 ?auto_2591882 ) ) ( not ( = ?auto_2591883 ?auto_2591884 ) ) ( not ( = ?auto_2591883 ?auto_2591885 ) ) ( not ( = ?auto_2591883 ?auto_2591886 ) ) ( not ( = ?auto_2591883 ?auto_2591887 ) ) ( not ( = ?auto_2591883 ?auto_2591888 ) ) ( not ( = ?auto_2591883 ?auto_2591889 ) ) ( not ( = ?auto_2591883 ?auto_2591890 ) ) ( not ( = ?auto_2591883 ?auto_2591891 ) ) ( not ( = ?auto_2591882 ?auto_2591884 ) ) ( not ( = ?auto_2591882 ?auto_2591885 ) ) ( not ( = ?auto_2591882 ?auto_2591886 ) ) ( not ( = ?auto_2591882 ?auto_2591887 ) ) ( not ( = ?auto_2591882 ?auto_2591888 ) ) ( not ( = ?auto_2591882 ?auto_2591889 ) ) ( not ( = ?auto_2591882 ?auto_2591890 ) ) ( not ( = ?auto_2591882 ?auto_2591891 ) ) ( not ( = ?auto_2591884 ?auto_2591885 ) ) ( not ( = ?auto_2591884 ?auto_2591886 ) ) ( not ( = ?auto_2591884 ?auto_2591887 ) ) ( not ( = ?auto_2591884 ?auto_2591888 ) ) ( not ( = ?auto_2591884 ?auto_2591889 ) ) ( not ( = ?auto_2591884 ?auto_2591890 ) ) ( not ( = ?auto_2591884 ?auto_2591891 ) ) ( not ( = ?auto_2591885 ?auto_2591886 ) ) ( not ( = ?auto_2591885 ?auto_2591887 ) ) ( not ( = ?auto_2591885 ?auto_2591888 ) ) ( not ( = ?auto_2591885 ?auto_2591889 ) ) ( not ( = ?auto_2591885 ?auto_2591890 ) ) ( not ( = ?auto_2591885 ?auto_2591891 ) ) ( not ( = ?auto_2591886 ?auto_2591887 ) ) ( not ( = ?auto_2591886 ?auto_2591888 ) ) ( not ( = ?auto_2591886 ?auto_2591889 ) ) ( not ( = ?auto_2591886 ?auto_2591890 ) ) ( not ( = ?auto_2591886 ?auto_2591891 ) ) ( not ( = ?auto_2591887 ?auto_2591888 ) ) ( not ( = ?auto_2591887 ?auto_2591889 ) ) ( not ( = ?auto_2591887 ?auto_2591890 ) ) ( not ( = ?auto_2591887 ?auto_2591891 ) ) ( not ( = ?auto_2591888 ?auto_2591889 ) ) ( not ( = ?auto_2591888 ?auto_2591890 ) ) ( not ( = ?auto_2591888 ?auto_2591891 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2591889 ?auto_2591890 ?auto_2591891 )
      ( MAKE-14CRATE-VERIFY ?auto_2591878 ?auto_2591879 ?auto_2591880 ?auto_2591877 ?auto_2591881 ?auto_2591883 ?auto_2591882 ?auto_2591884 ?auto_2591885 ?auto_2591886 ?auto_2591887 ?auto_2591888 ?auto_2591889 ?auto_2591890 ?auto_2591891 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2592081 - SURFACE
      ?auto_2592082 - SURFACE
      ?auto_2592083 - SURFACE
      ?auto_2592080 - SURFACE
      ?auto_2592084 - SURFACE
      ?auto_2592086 - SURFACE
      ?auto_2592085 - SURFACE
      ?auto_2592087 - SURFACE
      ?auto_2592088 - SURFACE
      ?auto_2592089 - SURFACE
      ?auto_2592090 - SURFACE
      ?auto_2592091 - SURFACE
      ?auto_2592092 - SURFACE
      ?auto_2592093 - SURFACE
      ?auto_2592094 - SURFACE
    )
    :vars
    (
      ?auto_2592099 - HOIST
      ?auto_2592100 - PLACE
      ?auto_2592096 - TRUCK
      ?auto_2592095 - PLACE
      ?auto_2592097 - HOIST
      ?auto_2592098 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2592099 ?auto_2592100 ) ( SURFACE-AT ?auto_2592093 ?auto_2592100 ) ( CLEAR ?auto_2592093 ) ( IS-CRATE ?auto_2592094 ) ( not ( = ?auto_2592093 ?auto_2592094 ) ) ( AVAILABLE ?auto_2592099 ) ( ON ?auto_2592093 ?auto_2592092 ) ( not ( = ?auto_2592092 ?auto_2592093 ) ) ( not ( = ?auto_2592092 ?auto_2592094 ) ) ( TRUCK-AT ?auto_2592096 ?auto_2592095 ) ( not ( = ?auto_2592095 ?auto_2592100 ) ) ( HOIST-AT ?auto_2592097 ?auto_2592095 ) ( not ( = ?auto_2592099 ?auto_2592097 ) ) ( AVAILABLE ?auto_2592097 ) ( SURFACE-AT ?auto_2592094 ?auto_2592095 ) ( ON ?auto_2592094 ?auto_2592098 ) ( CLEAR ?auto_2592094 ) ( not ( = ?auto_2592093 ?auto_2592098 ) ) ( not ( = ?auto_2592094 ?auto_2592098 ) ) ( not ( = ?auto_2592092 ?auto_2592098 ) ) ( ON ?auto_2592082 ?auto_2592081 ) ( ON ?auto_2592083 ?auto_2592082 ) ( ON ?auto_2592080 ?auto_2592083 ) ( ON ?auto_2592084 ?auto_2592080 ) ( ON ?auto_2592086 ?auto_2592084 ) ( ON ?auto_2592085 ?auto_2592086 ) ( ON ?auto_2592087 ?auto_2592085 ) ( ON ?auto_2592088 ?auto_2592087 ) ( ON ?auto_2592089 ?auto_2592088 ) ( ON ?auto_2592090 ?auto_2592089 ) ( ON ?auto_2592091 ?auto_2592090 ) ( ON ?auto_2592092 ?auto_2592091 ) ( not ( = ?auto_2592081 ?auto_2592082 ) ) ( not ( = ?auto_2592081 ?auto_2592083 ) ) ( not ( = ?auto_2592081 ?auto_2592080 ) ) ( not ( = ?auto_2592081 ?auto_2592084 ) ) ( not ( = ?auto_2592081 ?auto_2592086 ) ) ( not ( = ?auto_2592081 ?auto_2592085 ) ) ( not ( = ?auto_2592081 ?auto_2592087 ) ) ( not ( = ?auto_2592081 ?auto_2592088 ) ) ( not ( = ?auto_2592081 ?auto_2592089 ) ) ( not ( = ?auto_2592081 ?auto_2592090 ) ) ( not ( = ?auto_2592081 ?auto_2592091 ) ) ( not ( = ?auto_2592081 ?auto_2592092 ) ) ( not ( = ?auto_2592081 ?auto_2592093 ) ) ( not ( = ?auto_2592081 ?auto_2592094 ) ) ( not ( = ?auto_2592081 ?auto_2592098 ) ) ( not ( = ?auto_2592082 ?auto_2592083 ) ) ( not ( = ?auto_2592082 ?auto_2592080 ) ) ( not ( = ?auto_2592082 ?auto_2592084 ) ) ( not ( = ?auto_2592082 ?auto_2592086 ) ) ( not ( = ?auto_2592082 ?auto_2592085 ) ) ( not ( = ?auto_2592082 ?auto_2592087 ) ) ( not ( = ?auto_2592082 ?auto_2592088 ) ) ( not ( = ?auto_2592082 ?auto_2592089 ) ) ( not ( = ?auto_2592082 ?auto_2592090 ) ) ( not ( = ?auto_2592082 ?auto_2592091 ) ) ( not ( = ?auto_2592082 ?auto_2592092 ) ) ( not ( = ?auto_2592082 ?auto_2592093 ) ) ( not ( = ?auto_2592082 ?auto_2592094 ) ) ( not ( = ?auto_2592082 ?auto_2592098 ) ) ( not ( = ?auto_2592083 ?auto_2592080 ) ) ( not ( = ?auto_2592083 ?auto_2592084 ) ) ( not ( = ?auto_2592083 ?auto_2592086 ) ) ( not ( = ?auto_2592083 ?auto_2592085 ) ) ( not ( = ?auto_2592083 ?auto_2592087 ) ) ( not ( = ?auto_2592083 ?auto_2592088 ) ) ( not ( = ?auto_2592083 ?auto_2592089 ) ) ( not ( = ?auto_2592083 ?auto_2592090 ) ) ( not ( = ?auto_2592083 ?auto_2592091 ) ) ( not ( = ?auto_2592083 ?auto_2592092 ) ) ( not ( = ?auto_2592083 ?auto_2592093 ) ) ( not ( = ?auto_2592083 ?auto_2592094 ) ) ( not ( = ?auto_2592083 ?auto_2592098 ) ) ( not ( = ?auto_2592080 ?auto_2592084 ) ) ( not ( = ?auto_2592080 ?auto_2592086 ) ) ( not ( = ?auto_2592080 ?auto_2592085 ) ) ( not ( = ?auto_2592080 ?auto_2592087 ) ) ( not ( = ?auto_2592080 ?auto_2592088 ) ) ( not ( = ?auto_2592080 ?auto_2592089 ) ) ( not ( = ?auto_2592080 ?auto_2592090 ) ) ( not ( = ?auto_2592080 ?auto_2592091 ) ) ( not ( = ?auto_2592080 ?auto_2592092 ) ) ( not ( = ?auto_2592080 ?auto_2592093 ) ) ( not ( = ?auto_2592080 ?auto_2592094 ) ) ( not ( = ?auto_2592080 ?auto_2592098 ) ) ( not ( = ?auto_2592084 ?auto_2592086 ) ) ( not ( = ?auto_2592084 ?auto_2592085 ) ) ( not ( = ?auto_2592084 ?auto_2592087 ) ) ( not ( = ?auto_2592084 ?auto_2592088 ) ) ( not ( = ?auto_2592084 ?auto_2592089 ) ) ( not ( = ?auto_2592084 ?auto_2592090 ) ) ( not ( = ?auto_2592084 ?auto_2592091 ) ) ( not ( = ?auto_2592084 ?auto_2592092 ) ) ( not ( = ?auto_2592084 ?auto_2592093 ) ) ( not ( = ?auto_2592084 ?auto_2592094 ) ) ( not ( = ?auto_2592084 ?auto_2592098 ) ) ( not ( = ?auto_2592086 ?auto_2592085 ) ) ( not ( = ?auto_2592086 ?auto_2592087 ) ) ( not ( = ?auto_2592086 ?auto_2592088 ) ) ( not ( = ?auto_2592086 ?auto_2592089 ) ) ( not ( = ?auto_2592086 ?auto_2592090 ) ) ( not ( = ?auto_2592086 ?auto_2592091 ) ) ( not ( = ?auto_2592086 ?auto_2592092 ) ) ( not ( = ?auto_2592086 ?auto_2592093 ) ) ( not ( = ?auto_2592086 ?auto_2592094 ) ) ( not ( = ?auto_2592086 ?auto_2592098 ) ) ( not ( = ?auto_2592085 ?auto_2592087 ) ) ( not ( = ?auto_2592085 ?auto_2592088 ) ) ( not ( = ?auto_2592085 ?auto_2592089 ) ) ( not ( = ?auto_2592085 ?auto_2592090 ) ) ( not ( = ?auto_2592085 ?auto_2592091 ) ) ( not ( = ?auto_2592085 ?auto_2592092 ) ) ( not ( = ?auto_2592085 ?auto_2592093 ) ) ( not ( = ?auto_2592085 ?auto_2592094 ) ) ( not ( = ?auto_2592085 ?auto_2592098 ) ) ( not ( = ?auto_2592087 ?auto_2592088 ) ) ( not ( = ?auto_2592087 ?auto_2592089 ) ) ( not ( = ?auto_2592087 ?auto_2592090 ) ) ( not ( = ?auto_2592087 ?auto_2592091 ) ) ( not ( = ?auto_2592087 ?auto_2592092 ) ) ( not ( = ?auto_2592087 ?auto_2592093 ) ) ( not ( = ?auto_2592087 ?auto_2592094 ) ) ( not ( = ?auto_2592087 ?auto_2592098 ) ) ( not ( = ?auto_2592088 ?auto_2592089 ) ) ( not ( = ?auto_2592088 ?auto_2592090 ) ) ( not ( = ?auto_2592088 ?auto_2592091 ) ) ( not ( = ?auto_2592088 ?auto_2592092 ) ) ( not ( = ?auto_2592088 ?auto_2592093 ) ) ( not ( = ?auto_2592088 ?auto_2592094 ) ) ( not ( = ?auto_2592088 ?auto_2592098 ) ) ( not ( = ?auto_2592089 ?auto_2592090 ) ) ( not ( = ?auto_2592089 ?auto_2592091 ) ) ( not ( = ?auto_2592089 ?auto_2592092 ) ) ( not ( = ?auto_2592089 ?auto_2592093 ) ) ( not ( = ?auto_2592089 ?auto_2592094 ) ) ( not ( = ?auto_2592089 ?auto_2592098 ) ) ( not ( = ?auto_2592090 ?auto_2592091 ) ) ( not ( = ?auto_2592090 ?auto_2592092 ) ) ( not ( = ?auto_2592090 ?auto_2592093 ) ) ( not ( = ?auto_2592090 ?auto_2592094 ) ) ( not ( = ?auto_2592090 ?auto_2592098 ) ) ( not ( = ?auto_2592091 ?auto_2592092 ) ) ( not ( = ?auto_2592091 ?auto_2592093 ) ) ( not ( = ?auto_2592091 ?auto_2592094 ) ) ( not ( = ?auto_2592091 ?auto_2592098 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2592092 ?auto_2592093 ?auto_2592094 )
      ( MAKE-14CRATE-VERIFY ?auto_2592081 ?auto_2592082 ?auto_2592083 ?auto_2592080 ?auto_2592084 ?auto_2592086 ?auto_2592085 ?auto_2592087 ?auto_2592088 ?auto_2592089 ?auto_2592090 ?auto_2592091 ?auto_2592092 ?auto_2592093 ?auto_2592094 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2592285 - SURFACE
      ?auto_2592286 - SURFACE
      ?auto_2592287 - SURFACE
      ?auto_2592284 - SURFACE
      ?auto_2592288 - SURFACE
      ?auto_2592290 - SURFACE
      ?auto_2592289 - SURFACE
      ?auto_2592291 - SURFACE
      ?auto_2592292 - SURFACE
      ?auto_2592293 - SURFACE
      ?auto_2592294 - SURFACE
      ?auto_2592295 - SURFACE
      ?auto_2592296 - SURFACE
      ?auto_2592297 - SURFACE
      ?auto_2592298 - SURFACE
    )
    :vars
    (
      ?auto_2592301 - HOIST
      ?auto_2592299 - PLACE
      ?auto_2592300 - PLACE
      ?auto_2592303 - HOIST
      ?auto_2592304 - SURFACE
      ?auto_2592302 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2592301 ?auto_2592299 ) ( SURFACE-AT ?auto_2592297 ?auto_2592299 ) ( CLEAR ?auto_2592297 ) ( IS-CRATE ?auto_2592298 ) ( not ( = ?auto_2592297 ?auto_2592298 ) ) ( AVAILABLE ?auto_2592301 ) ( ON ?auto_2592297 ?auto_2592296 ) ( not ( = ?auto_2592296 ?auto_2592297 ) ) ( not ( = ?auto_2592296 ?auto_2592298 ) ) ( not ( = ?auto_2592300 ?auto_2592299 ) ) ( HOIST-AT ?auto_2592303 ?auto_2592300 ) ( not ( = ?auto_2592301 ?auto_2592303 ) ) ( AVAILABLE ?auto_2592303 ) ( SURFACE-AT ?auto_2592298 ?auto_2592300 ) ( ON ?auto_2592298 ?auto_2592304 ) ( CLEAR ?auto_2592298 ) ( not ( = ?auto_2592297 ?auto_2592304 ) ) ( not ( = ?auto_2592298 ?auto_2592304 ) ) ( not ( = ?auto_2592296 ?auto_2592304 ) ) ( TRUCK-AT ?auto_2592302 ?auto_2592299 ) ( ON ?auto_2592286 ?auto_2592285 ) ( ON ?auto_2592287 ?auto_2592286 ) ( ON ?auto_2592284 ?auto_2592287 ) ( ON ?auto_2592288 ?auto_2592284 ) ( ON ?auto_2592290 ?auto_2592288 ) ( ON ?auto_2592289 ?auto_2592290 ) ( ON ?auto_2592291 ?auto_2592289 ) ( ON ?auto_2592292 ?auto_2592291 ) ( ON ?auto_2592293 ?auto_2592292 ) ( ON ?auto_2592294 ?auto_2592293 ) ( ON ?auto_2592295 ?auto_2592294 ) ( ON ?auto_2592296 ?auto_2592295 ) ( not ( = ?auto_2592285 ?auto_2592286 ) ) ( not ( = ?auto_2592285 ?auto_2592287 ) ) ( not ( = ?auto_2592285 ?auto_2592284 ) ) ( not ( = ?auto_2592285 ?auto_2592288 ) ) ( not ( = ?auto_2592285 ?auto_2592290 ) ) ( not ( = ?auto_2592285 ?auto_2592289 ) ) ( not ( = ?auto_2592285 ?auto_2592291 ) ) ( not ( = ?auto_2592285 ?auto_2592292 ) ) ( not ( = ?auto_2592285 ?auto_2592293 ) ) ( not ( = ?auto_2592285 ?auto_2592294 ) ) ( not ( = ?auto_2592285 ?auto_2592295 ) ) ( not ( = ?auto_2592285 ?auto_2592296 ) ) ( not ( = ?auto_2592285 ?auto_2592297 ) ) ( not ( = ?auto_2592285 ?auto_2592298 ) ) ( not ( = ?auto_2592285 ?auto_2592304 ) ) ( not ( = ?auto_2592286 ?auto_2592287 ) ) ( not ( = ?auto_2592286 ?auto_2592284 ) ) ( not ( = ?auto_2592286 ?auto_2592288 ) ) ( not ( = ?auto_2592286 ?auto_2592290 ) ) ( not ( = ?auto_2592286 ?auto_2592289 ) ) ( not ( = ?auto_2592286 ?auto_2592291 ) ) ( not ( = ?auto_2592286 ?auto_2592292 ) ) ( not ( = ?auto_2592286 ?auto_2592293 ) ) ( not ( = ?auto_2592286 ?auto_2592294 ) ) ( not ( = ?auto_2592286 ?auto_2592295 ) ) ( not ( = ?auto_2592286 ?auto_2592296 ) ) ( not ( = ?auto_2592286 ?auto_2592297 ) ) ( not ( = ?auto_2592286 ?auto_2592298 ) ) ( not ( = ?auto_2592286 ?auto_2592304 ) ) ( not ( = ?auto_2592287 ?auto_2592284 ) ) ( not ( = ?auto_2592287 ?auto_2592288 ) ) ( not ( = ?auto_2592287 ?auto_2592290 ) ) ( not ( = ?auto_2592287 ?auto_2592289 ) ) ( not ( = ?auto_2592287 ?auto_2592291 ) ) ( not ( = ?auto_2592287 ?auto_2592292 ) ) ( not ( = ?auto_2592287 ?auto_2592293 ) ) ( not ( = ?auto_2592287 ?auto_2592294 ) ) ( not ( = ?auto_2592287 ?auto_2592295 ) ) ( not ( = ?auto_2592287 ?auto_2592296 ) ) ( not ( = ?auto_2592287 ?auto_2592297 ) ) ( not ( = ?auto_2592287 ?auto_2592298 ) ) ( not ( = ?auto_2592287 ?auto_2592304 ) ) ( not ( = ?auto_2592284 ?auto_2592288 ) ) ( not ( = ?auto_2592284 ?auto_2592290 ) ) ( not ( = ?auto_2592284 ?auto_2592289 ) ) ( not ( = ?auto_2592284 ?auto_2592291 ) ) ( not ( = ?auto_2592284 ?auto_2592292 ) ) ( not ( = ?auto_2592284 ?auto_2592293 ) ) ( not ( = ?auto_2592284 ?auto_2592294 ) ) ( not ( = ?auto_2592284 ?auto_2592295 ) ) ( not ( = ?auto_2592284 ?auto_2592296 ) ) ( not ( = ?auto_2592284 ?auto_2592297 ) ) ( not ( = ?auto_2592284 ?auto_2592298 ) ) ( not ( = ?auto_2592284 ?auto_2592304 ) ) ( not ( = ?auto_2592288 ?auto_2592290 ) ) ( not ( = ?auto_2592288 ?auto_2592289 ) ) ( not ( = ?auto_2592288 ?auto_2592291 ) ) ( not ( = ?auto_2592288 ?auto_2592292 ) ) ( not ( = ?auto_2592288 ?auto_2592293 ) ) ( not ( = ?auto_2592288 ?auto_2592294 ) ) ( not ( = ?auto_2592288 ?auto_2592295 ) ) ( not ( = ?auto_2592288 ?auto_2592296 ) ) ( not ( = ?auto_2592288 ?auto_2592297 ) ) ( not ( = ?auto_2592288 ?auto_2592298 ) ) ( not ( = ?auto_2592288 ?auto_2592304 ) ) ( not ( = ?auto_2592290 ?auto_2592289 ) ) ( not ( = ?auto_2592290 ?auto_2592291 ) ) ( not ( = ?auto_2592290 ?auto_2592292 ) ) ( not ( = ?auto_2592290 ?auto_2592293 ) ) ( not ( = ?auto_2592290 ?auto_2592294 ) ) ( not ( = ?auto_2592290 ?auto_2592295 ) ) ( not ( = ?auto_2592290 ?auto_2592296 ) ) ( not ( = ?auto_2592290 ?auto_2592297 ) ) ( not ( = ?auto_2592290 ?auto_2592298 ) ) ( not ( = ?auto_2592290 ?auto_2592304 ) ) ( not ( = ?auto_2592289 ?auto_2592291 ) ) ( not ( = ?auto_2592289 ?auto_2592292 ) ) ( not ( = ?auto_2592289 ?auto_2592293 ) ) ( not ( = ?auto_2592289 ?auto_2592294 ) ) ( not ( = ?auto_2592289 ?auto_2592295 ) ) ( not ( = ?auto_2592289 ?auto_2592296 ) ) ( not ( = ?auto_2592289 ?auto_2592297 ) ) ( not ( = ?auto_2592289 ?auto_2592298 ) ) ( not ( = ?auto_2592289 ?auto_2592304 ) ) ( not ( = ?auto_2592291 ?auto_2592292 ) ) ( not ( = ?auto_2592291 ?auto_2592293 ) ) ( not ( = ?auto_2592291 ?auto_2592294 ) ) ( not ( = ?auto_2592291 ?auto_2592295 ) ) ( not ( = ?auto_2592291 ?auto_2592296 ) ) ( not ( = ?auto_2592291 ?auto_2592297 ) ) ( not ( = ?auto_2592291 ?auto_2592298 ) ) ( not ( = ?auto_2592291 ?auto_2592304 ) ) ( not ( = ?auto_2592292 ?auto_2592293 ) ) ( not ( = ?auto_2592292 ?auto_2592294 ) ) ( not ( = ?auto_2592292 ?auto_2592295 ) ) ( not ( = ?auto_2592292 ?auto_2592296 ) ) ( not ( = ?auto_2592292 ?auto_2592297 ) ) ( not ( = ?auto_2592292 ?auto_2592298 ) ) ( not ( = ?auto_2592292 ?auto_2592304 ) ) ( not ( = ?auto_2592293 ?auto_2592294 ) ) ( not ( = ?auto_2592293 ?auto_2592295 ) ) ( not ( = ?auto_2592293 ?auto_2592296 ) ) ( not ( = ?auto_2592293 ?auto_2592297 ) ) ( not ( = ?auto_2592293 ?auto_2592298 ) ) ( not ( = ?auto_2592293 ?auto_2592304 ) ) ( not ( = ?auto_2592294 ?auto_2592295 ) ) ( not ( = ?auto_2592294 ?auto_2592296 ) ) ( not ( = ?auto_2592294 ?auto_2592297 ) ) ( not ( = ?auto_2592294 ?auto_2592298 ) ) ( not ( = ?auto_2592294 ?auto_2592304 ) ) ( not ( = ?auto_2592295 ?auto_2592296 ) ) ( not ( = ?auto_2592295 ?auto_2592297 ) ) ( not ( = ?auto_2592295 ?auto_2592298 ) ) ( not ( = ?auto_2592295 ?auto_2592304 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2592296 ?auto_2592297 ?auto_2592298 )
      ( MAKE-14CRATE-VERIFY ?auto_2592285 ?auto_2592286 ?auto_2592287 ?auto_2592284 ?auto_2592288 ?auto_2592290 ?auto_2592289 ?auto_2592291 ?auto_2592292 ?auto_2592293 ?auto_2592294 ?auto_2592295 ?auto_2592296 ?auto_2592297 ?auto_2592298 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2592489 - SURFACE
      ?auto_2592490 - SURFACE
      ?auto_2592491 - SURFACE
      ?auto_2592488 - SURFACE
      ?auto_2592492 - SURFACE
      ?auto_2592494 - SURFACE
      ?auto_2592493 - SURFACE
      ?auto_2592495 - SURFACE
      ?auto_2592496 - SURFACE
      ?auto_2592497 - SURFACE
      ?auto_2592498 - SURFACE
      ?auto_2592499 - SURFACE
      ?auto_2592500 - SURFACE
      ?auto_2592501 - SURFACE
      ?auto_2592502 - SURFACE
    )
    :vars
    (
      ?auto_2592503 - HOIST
      ?auto_2592504 - PLACE
      ?auto_2592506 - PLACE
      ?auto_2592508 - HOIST
      ?auto_2592505 - SURFACE
      ?auto_2592507 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2592503 ?auto_2592504 ) ( IS-CRATE ?auto_2592502 ) ( not ( = ?auto_2592501 ?auto_2592502 ) ) ( not ( = ?auto_2592500 ?auto_2592501 ) ) ( not ( = ?auto_2592500 ?auto_2592502 ) ) ( not ( = ?auto_2592506 ?auto_2592504 ) ) ( HOIST-AT ?auto_2592508 ?auto_2592506 ) ( not ( = ?auto_2592503 ?auto_2592508 ) ) ( AVAILABLE ?auto_2592508 ) ( SURFACE-AT ?auto_2592502 ?auto_2592506 ) ( ON ?auto_2592502 ?auto_2592505 ) ( CLEAR ?auto_2592502 ) ( not ( = ?auto_2592501 ?auto_2592505 ) ) ( not ( = ?auto_2592502 ?auto_2592505 ) ) ( not ( = ?auto_2592500 ?auto_2592505 ) ) ( TRUCK-AT ?auto_2592507 ?auto_2592504 ) ( SURFACE-AT ?auto_2592500 ?auto_2592504 ) ( CLEAR ?auto_2592500 ) ( LIFTING ?auto_2592503 ?auto_2592501 ) ( IS-CRATE ?auto_2592501 ) ( ON ?auto_2592490 ?auto_2592489 ) ( ON ?auto_2592491 ?auto_2592490 ) ( ON ?auto_2592488 ?auto_2592491 ) ( ON ?auto_2592492 ?auto_2592488 ) ( ON ?auto_2592494 ?auto_2592492 ) ( ON ?auto_2592493 ?auto_2592494 ) ( ON ?auto_2592495 ?auto_2592493 ) ( ON ?auto_2592496 ?auto_2592495 ) ( ON ?auto_2592497 ?auto_2592496 ) ( ON ?auto_2592498 ?auto_2592497 ) ( ON ?auto_2592499 ?auto_2592498 ) ( ON ?auto_2592500 ?auto_2592499 ) ( not ( = ?auto_2592489 ?auto_2592490 ) ) ( not ( = ?auto_2592489 ?auto_2592491 ) ) ( not ( = ?auto_2592489 ?auto_2592488 ) ) ( not ( = ?auto_2592489 ?auto_2592492 ) ) ( not ( = ?auto_2592489 ?auto_2592494 ) ) ( not ( = ?auto_2592489 ?auto_2592493 ) ) ( not ( = ?auto_2592489 ?auto_2592495 ) ) ( not ( = ?auto_2592489 ?auto_2592496 ) ) ( not ( = ?auto_2592489 ?auto_2592497 ) ) ( not ( = ?auto_2592489 ?auto_2592498 ) ) ( not ( = ?auto_2592489 ?auto_2592499 ) ) ( not ( = ?auto_2592489 ?auto_2592500 ) ) ( not ( = ?auto_2592489 ?auto_2592501 ) ) ( not ( = ?auto_2592489 ?auto_2592502 ) ) ( not ( = ?auto_2592489 ?auto_2592505 ) ) ( not ( = ?auto_2592490 ?auto_2592491 ) ) ( not ( = ?auto_2592490 ?auto_2592488 ) ) ( not ( = ?auto_2592490 ?auto_2592492 ) ) ( not ( = ?auto_2592490 ?auto_2592494 ) ) ( not ( = ?auto_2592490 ?auto_2592493 ) ) ( not ( = ?auto_2592490 ?auto_2592495 ) ) ( not ( = ?auto_2592490 ?auto_2592496 ) ) ( not ( = ?auto_2592490 ?auto_2592497 ) ) ( not ( = ?auto_2592490 ?auto_2592498 ) ) ( not ( = ?auto_2592490 ?auto_2592499 ) ) ( not ( = ?auto_2592490 ?auto_2592500 ) ) ( not ( = ?auto_2592490 ?auto_2592501 ) ) ( not ( = ?auto_2592490 ?auto_2592502 ) ) ( not ( = ?auto_2592490 ?auto_2592505 ) ) ( not ( = ?auto_2592491 ?auto_2592488 ) ) ( not ( = ?auto_2592491 ?auto_2592492 ) ) ( not ( = ?auto_2592491 ?auto_2592494 ) ) ( not ( = ?auto_2592491 ?auto_2592493 ) ) ( not ( = ?auto_2592491 ?auto_2592495 ) ) ( not ( = ?auto_2592491 ?auto_2592496 ) ) ( not ( = ?auto_2592491 ?auto_2592497 ) ) ( not ( = ?auto_2592491 ?auto_2592498 ) ) ( not ( = ?auto_2592491 ?auto_2592499 ) ) ( not ( = ?auto_2592491 ?auto_2592500 ) ) ( not ( = ?auto_2592491 ?auto_2592501 ) ) ( not ( = ?auto_2592491 ?auto_2592502 ) ) ( not ( = ?auto_2592491 ?auto_2592505 ) ) ( not ( = ?auto_2592488 ?auto_2592492 ) ) ( not ( = ?auto_2592488 ?auto_2592494 ) ) ( not ( = ?auto_2592488 ?auto_2592493 ) ) ( not ( = ?auto_2592488 ?auto_2592495 ) ) ( not ( = ?auto_2592488 ?auto_2592496 ) ) ( not ( = ?auto_2592488 ?auto_2592497 ) ) ( not ( = ?auto_2592488 ?auto_2592498 ) ) ( not ( = ?auto_2592488 ?auto_2592499 ) ) ( not ( = ?auto_2592488 ?auto_2592500 ) ) ( not ( = ?auto_2592488 ?auto_2592501 ) ) ( not ( = ?auto_2592488 ?auto_2592502 ) ) ( not ( = ?auto_2592488 ?auto_2592505 ) ) ( not ( = ?auto_2592492 ?auto_2592494 ) ) ( not ( = ?auto_2592492 ?auto_2592493 ) ) ( not ( = ?auto_2592492 ?auto_2592495 ) ) ( not ( = ?auto_2592492 ?auto_2592496 ) ) ( not ( = ?auto_2592492 ?auto_2592497 ) ) ( not ( = ?auto_2592492 ?auto_2592498 ) ) ( not ( = ?auto_2592492 ?auto_2592499 ) ) ( not ( = ?auto_2592492 ?auto_2592500 ) ) ( not ( = ?auto_2592492 ?auto_2592501 ) ) ( not ( = ?auto_2592492 ?auto_2592502 ) ) ( not ( = ?auto_2592492 ?auto_2592505 ) ) ( not ( = ?auto_2592494 ?auto_2592493 ) ) ( not ( = ?auto_2592494 ?auto_2592495 ) ) ( not ( = ?auto_2592494 ?auto_2592496 ) ) ( not ( = ?auto_2592494 ?auto_2592497 ) ) ( not ( = ?auto_2592494 ?auto_2592498 ) ) ( not ( = ?auto_2592494 ?auto_2592499 ) ) ( not ( = ?auto_2592494 ?auto_2592500 ) ) ( not ( = ?auto_2592494 ?auto_2592501 ) ) ( not ( = ?auto_2592494 ?auto_2592502 ) ) ( not ( = ?auto_2592494 ?auto_2592505 ) ) ( not ( = ?auto_2592493 ?auto_2592495 ) ) ( not ( = ?auto_2592493 ?auto_2592496 ) ) ( not ( = ?auto_2592493 ?auto_2592497 ) ) ( not ( = ?auto_2592493 ?auto_2592498 ) ) ( not ( = ?auto_2592493 ?auto_2592499 ) ) ( not ( = ?auto_2592493 ?auto_2592500 ) ) ( not ( = ?auto_2592493 ?auto_2592501 ) ) ( not ( = ?auto_2592493 ?auto_2592502 ) ) ( not ( = ?auto_2592493 ?auto_2592505 ) ) ( not ( = ?auto_2592495 ?auto_2592496 ) ) ( not ( = ?auto_2592495 ?auto_2592497 ) ) ( not ( = ?auto_2592495 ?auto_2592498 ) ) ( not ( = ?auto_2592495 ?auto_2592499 ) ) ( not ( = ?auto_2592495 ?auto_2592500 ) ) ( not ( = ?auto_2592495 ?auto_2592501 ) ) ( not ( = ?auto_2592495 ?auto_2592502 ) ) ( not ( = ?auto_2592495 ?auto_2592505 ) ) ( not ( = ?auto_2592496 ?auto_2592497 ) ) ( not ( = ?auto_2592496 ?auto_2592498 ) ) ( not ( = ?auto_2592496 ?auto_2592499 ) ) ( not ( = ?auto_2592496 ?auto_2592500 ) ) ( not ( = ?auto_2592496 ?auto_2592501 ) ) ( not ( = ?auto_2592496 ?auto_2592502 ) ) ( not ( = ?auto_2592496 ?auto_2592505 ) ) ( not ( = ?auto_2592497 ?auto_2592498 ) ) ( not ( = ?auto_2592497 ?auto_2592499 ) ) ( not ( = ?auto_2592497 ?auto_2592500 ) ) ( not ( = ?auto_2592497 ?auto_2592501 ) ) ( not ( = ?auto_2592497 ?auto_2592502 ) ) ( not ( = ?auto_2592497 ?auto_2592505 ) ) ( not ( = ?auto_2592498 ?auto_2592499 ) ) ( not ( = ?auto_2592498 ?auto_2592500 ) ) ( not ( = ?auto_2592498 ?auto_2592501 ) ) ( not ( = ?auto_2592498 ?auto_2592502 ) ) ( not ( = ?auto_2592498 ?auto_2592505 ) ) ( not ( = ?auto_2592499 ?auto_2592500 ) ) ( not ( = ?auto_2592499 ?auto_2592501 ) ) ( not ( = ?auto_2592499 ?auto_2592502 ) ) ( not ( = ?auto_2592499 ?auto_2592505 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2592500 ?auto_2592501 ?auto_2592502 )
      ( MAKE-14CRATE-VERIFY ?auto_2592489 ?auto_2592490 ?auto_2592491 ?auto_2592488 ?auto_2592492 ?auto_2592494 ?auto_2592493 ?auto_2592495 ?auto_2592496 ?auto_2592497 ?auto_2592498 ?auto_2592499 ?auto_2592500 ?auto_2592501 ?auto_2592502 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2592693 - SURFACE
      ?auto_2592694 - SURFACE
      ?auto_2592695 - SURFACE
      ?auto_2592692 - SURFACE
      ?auto_2592696 - SURFACE
      ?auto_2592698 - SURFACE
      ?auto_2592697 - SURFACE
      ?auto_2592699 - SURFACE
      ?auto_2592700 - SURFACE
      ?auto_2592701 - SURFACE
      ?auto_2592702 - SURFACE
      ?auto_2592703 - SURFACE
      ?auto_2592704 - SURFACE
      ?auto_2592705 - SURFACE
      ?auto_2592706 - SURFACE
    )
    :vars
    (
      ?auto_2592710 - HOIST
      ?auto_2592711 - PLACE
      ?auto_2592709 - PLACE
      ?auto_2592707 - HOIST
      ?auto_2592712 - SURFACE
      ?auto_2592708 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2592710 ?auto_2592711 ) ( IS-CRATE ?auto_2592706 ) ( not ( = ?auto_2592705 ?auto_2592706 ) ) ( not ( = ?auto_2592704 ?auto_2592705 ) ) ( not ( = ?auto_2592704 ?auto_2592706 ) ) ( not ( = ?auto_2592709 ?auto_2592711 ) ) ( HOIST-AT ?auto_2592707 ?auto_2592709 ) ( not ( = ?auto_2592710 ?auto_2592707 ) ) ( AVAILABLE ?auto_2592707 ) ( SURFACE-AT ?auto_2592706 ?auto_2592709 ) ( ON ?auto_2592706 ?auto_2592712 ) ( CLEAR ?auto_2592706 ) ( not ( = ?auto_2592705 ?auto_2592712 ) ) ( not ( = ?auto_2592706 ?auto_2592712 ) ) ( not ( = ?auto_2592704 ?auto_2592712 ) ) ( TRUCK-AT ?auto_2592708 ?auto_2592711 ) ( SURFACE-AT ?auto_2592704 ?auto_2592711 ) ( CLEAR ?auto_2592704 ) ( IS-CRATE ?auto_2592705 ) ( AVAILABLE ?auto_2592710 ) ( IN ?auto_2592705 ?auto_2592708 ) ( ON ?auto_2592694 ?auto_2592693 ) ( ON ?auto_2592695 ?auto_2592694 ) ( ON ?auto_2592692 ?auto_2592695 ) ( ON ?auto_2592696 ?auto_2592692 ) ( ON ?auto_2592698 ?auto_2592696 ) ( ON ?auto_2592697 ?auto_2592698 ) ( ON ?auto_2592699 ?auto_2592697 ) ( ON ?auto_2592700 ?auto_2592699 ) ( ON ?auto_2592701 ?auto_2592700 ) ( ON ?auto_2592702 ?auto_2592701 ) ( ON ?auto_2592703 ?auto_2592702 ) ( ON ?auto_2592704 ?auto_2592703 ) ( not ( = ?auto_2592693 ?auto_2592694 ) ) ( not ( = ?auto_2592693 ?auto_2592695 ) ) ( not ( = ?auto_2592693 ?auto_2592692 ) ) ( not ( = ?auto_2592693 ?auto_2592696 ) ) ( not ( = ?auto_2592693 ?auto_2592698 ) ) ( not ( = ?auto_2592693 ?auto_2592697 ) ) ( not ( = ?auto_2592693 ?auto_2592699 ) ) ( not ( = ?auto_2592693 ?auto_2592700 ) ) ( not ( = ?auto_2592693 ?auto_2592701 ) ) ( not ( = ?auto_2592693 ?auto_2592702 ) ) ( not ( = ?auto_2592693 ?auto_2592703 ) ) ( not ( = ?auto_2592693 ?auto_2592704 ) ) ( not ( = ?auto_2592693 ?auto_2592705 ) ) ( not ( = ?auto_2592693 ?auto_2592706 ) ) ( not ( = ?auto_2592693 ?auto_2592712 ) ) ( not ( = ?auto_2592694 ?auto_2592695 ) ) ( not ( = ?auto_2592694 ?auto_2592692 ) ) ( not ( = ?auto_2592694 ?auto_2592696 ) ) ( not ( = ?auto_2592694 ?auto_2592698 ) ) ( not ( = ?auto_2592694 ?auto_2592697 ) ) ( not ( = ?auto_2592694 ?auto_2592699 ) ) ( not ( = ?auto_2592694 ?auto_2592700 ) ) ( not ( = ?auto_2592694 ?auto_2592701 ) ) ( not ( = ?auto_2592694 ?auto_2592702 ) ) ( not ( = ?auto_2592694 ?auto_2592703 ) ) ( not ( = ?auto_2592694 ?auto_2592704 ) ) ( not ( = ?auto_2592694 ?auto_2592705 ) ) ( not ( = ?auto_2592694 ?auto_2592706 ) ) ( not ( = ?auto_2592694 ?auto_2592712 ) ) ( not ( = ?auto_2592695 ?auto_2592692 ) ) ( not ( = ?auto_2592695 ?auto_2592696 ) ) ( not ( = ?auto_2592695 ?auto_2592698 ) ) ( not ( = ?auto_2592695 ?auto_2592697 ) ) ( not ( = ?auto_2592695 ?auto_2592699 ) ) ( not ( = ?auto_2592695 ?auto_2592700 ) ) ( not ( = ?auto_2592695 ?auto_2592701 ) ) ( not ( = ?auto_2592695 ?auto_2592702 ) ) ( not ( = ?auto_2592695 ?auto_2592703 ) ) ( not ( = ?auto_2592695 ?auto_2592704 ) ) ( not ( = ?auto_2592695 ?auto_2592705 ) ) ( not ( = ?auto_2592695 ?auto_2592706 ) ) ( not ( = ?auto_2592695 ?auto_2592712 ) ) ( not ( = ?auto_2592692 ?auto_2592696 ) ) ( not ( = ?auto_2592692 ?auto_2592698 ) ) ( not ( = ?auto_2592692 ?auto_2592697 ) ) ( not ( = ?auto_2592692 ?auto_2592699 ) ) ( not ( = ?auto_2592692 ?auto_2592700 ) ) ( not ( = ?auto_2592692 ?auto_2592701 ) ) ( not ( = ?auto_2592692 ?auto_2592702 ) ) ( not ( = ?auto_2592692 ?auto_2592703 ) ) ( not ( = ?auto_2592692 ?auto_2592704 ) ) ( not ( = ?auto_2592692 ?auto_2592705 ) ) ( not ( = ?auto_2592692 ?auto_2592706 ) ) ( not ( = ?auto_2592692 ?auto_2592712 ) ) ( not ( = ?auto_2592696 ?auto_2592698 ) ) ( not ( = ?auto_2592696 ?auto_2592697 ) ) ( not ( = ?auto_2592696 ?auto_2592699 ) ) ( not ( = ?auto_2592696 ?auto_2592700 ) ) ( not ( = ?auto_2592696 ?auto_2592701 ) ) ( not ( = ?auto_2592696 ?auto_2592702 ) ) ( not ( = ?auto_2592696 ?auto_2592703 ) ) ( not ( = ?auto_2592696 ?auto_2592704 ) ) ( not ( = ?auto_2592696 ?auto_2592705 ) ) ( not ( = ?auto_2592696 ?auto_2592706 ) ) ( not ( = ?auto_2592696 ?auto_2592712 ) ) ( not ( = ?auto_2592698 ?auto_2592697 ) ) ( not ( = ?auto_2592698 ?auto_2592699 ) ) ( not ( = ?auto_2592698 ?auto_2592700 ) ) ( not ( = ?auto_2592698 ?auto_2592701 ) ) ( not ( = ?auto_2592698 ?auto_2592702 ) ) ( not ( = ?auto_2592698 ?auto_2592703 ) ) ( not ( = ?auto_2592698 ?auto_2592704 ) ) ( not ( = ?auto_2592698 ?auto_2592705 ) ) ( not ( = ?auto_2592698 ?auto_2592706 ) ) ( not ( = ?auto_2592698 ?auto_2592712 ) ) ( not ( = ?auto_2592697 ?auto_2592699 ) ) ( not ( = ?auto_2592697 ?auto_2592700 ) ) ( not ( = ?auto_2592697 ?auto_2592701 ) ) ( not ( = ?auto_2592697 ?auto_2592702 ) ) ( not ( = ?auto_2592697 ?auto_2592703 ) ) ( not ( = ?auto_2592697 ?auto_2592704 ) ) ( not ( = ?auto_2592697 ?auto_2592705 ) ) ( not ( = ?auto_2592697 ?auto_2592706 ) ) ( not ( = ?auto_2592697 ?auto_2592712 ) ) ( not ( = ?auto_2592699 ?auto_2592700 ) ) ( not ( = ?auto_2592699 ?auto_2592701 ) ) ( not ( = ?auto_2592699 ?auto_2592702 ) ) ( not ( = ?auto_2592699 ?auto_2592703 ) ) ( not ( = ?auto_2592699 ?auto_2592704 ) ) ( not ( = ?auto_2592699 ?auto_2592705 ) ) ( not ( = ?auto_2592699 ?auto_2592706 ) ) ( not ( = ?auto_2592699 ?auto_2592712 ) ) ( not ( = ?auto_2592700 ?auto_2592701 ) ) ( not ( = ?auto_2592700 ?auto_2592702 ) ) ( not ( = ?auto_2592700 ?auto_2592703 ) ) ( not ( = ?auto_2592700 ?auto_2592704 ) ) ( not ( = ?auto_2592700 ?auto_2592705 ) ) ( not ( = ?auto_2592700 ?auto_2592706 ) ) ( not ( = ?auto_2592700 ?auto_2592712 ) ) ( not ( = ?auto_2592701 ?auto_2592702 ) ) ( not ( = ?auto_2592701 ?auto_2592703 ) ) ( not ( = ?auto_2592701 ?auto_2592704 ) ) ( not ( = ?auto_2592701 ?auto_2592705 ) ) ( not ( = ?auto_2592701 ?auto_2592706 ) ) ( not ( = ?auto_2592701 ?auto_2592712 ) ) ( not ( = ?auto_2592702 ?auto_2592703 ) ) ( not ( = ?auto_2592702 ?auto_2592704 ) ) ( not ( = ?auto_2592702 ?auto_2592705 ) ) ( not ( = ?auto_2592702 ?auto_2592706 ) ) ( not ( = ?auto_2592702 ?auto_2592712 ) ) ( not ( = ?auto_2592703 ?auto_2592704 ) ) ( not ( = ?auto_2592703 ?auto_2592705 ) ) ( not ( = ?auto_2592703 ?auto_2592706 ) ) ( not ( = ?auto_2592703 ?auto_2592712 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2592704 ?auto_2592705 ?auto_2592706 )
      ( MAKE-14CRATE-VERIFY ?auto_2592693 ?auto_2592694 ?auto_2592695 ?auto_2592692 ?auto_2592696 ?auto_2592698 ?auto_2592697 ?auto_2592699 ?auto_2592700 ?auto_2592701 ?auto_2592702 ?auto_2592703 ?auto_2592704 ?auto_2592705 ?auto_2592706 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2609884 - SURFACE
      ?auto_2609885 - SURFACE
      ?auto_2609886 - SURFACE
      ?auto_2609883 - SURFACE
      ?auto_2609887 - SURFACE
      ?auto_2609889 - SURFACE
      ?auto_2609888 - SURFACE
      ?auto_2609890 - SURFACE
      ?auto_2609891 - SURFACE
      ?auto_2609892 - SURFACE
      ?auto_2609893 - SURFACE
      ?auto_2609894 - SURFACE
      ?auto_2609895 - SURFACE
      ?auto_2609896 - SURFACE
      ?auto_2609897 - SURFACE
      ?auto_2609898 - SURFACE
    )
    :vars
    (
      ?auto_2609900 - HOIST
      ?auto_2609899 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2609900 ?auto_2609899 ) ( SURFACE-AT ?auto_2609897 ?auto_2609899 ) ( CLEAR ?auto_2609897 ) ( LIFTING ?auto_2609900 ?auto_2609898 ) ( IS-CRATE ?auto_2609898 ) ( not ( = ?auto_2609897 ?auto_2609898 ) ) ( ON ?auto_2609885 ?auto_2609884 ) ( ON ?auto_2609886 ?auto_2609885 ) ( ON ?auto_2609883 ?auto_2609886 ) ( ON ?auto_2609887 ?auto_2609883 ) ( ON ?auto_2609889 ?auto_2609887 ) ( ON ?auto_2609888 ?auto_2609889 ) ( ON ?auto_2609890 ?auto_2609888 ) ( ON ?auto_2609891 ?auto_2609890 ) ( ON ?auto_2609892 ?auto_2609891 ) ( ON ?auto_2609893 ?auto_2609892 ) ( ON ?auto_2609894 ?auto_2609893 ) ( ON ?auto_2609895 ?auto_2609894 ) ( ON ?auto_2609896 ?auto_2609895 ) ( ON ?auto_2609897 ?auto_2609896 ) ( not ( = ?auto_2609884 ?auto_2609885 ) ) ( not ( = ?auto_2609884 ?auto_2609886 ) ) ( not ( = ?auto_2609884 ?auto_2609883 ) ) ( not ( = ?auto_2609884 ?auto_2609887 ) ) ( not ( = ?auto_2609884 ?auto_2609889 ) ) ( not ( = ?auto_2609884 ?auto_2609888 ) ) ( not ( = ?auto_2609884 ?auto_2609890 ) ) ( not ( = ?auto_2609884 ?auto_2609891 ) ) ( not ( = ?auto_2609884 ?auto_2609892 ) ) ( not ( = ?auto_2609884 ?auto_2609893 ) ) ( not ( = ?auto_2609884 ?auto_2609894 ) ) ( not ( = ?auto_2609884 ?auto_2609895 ) ) ( not ( = ?auto_2609884 ?auto_2609896 ) ) ( not ( = ?auto_2609884 ?auto_2609897 ) ) ( not ( = ?auto_2609884 ?auto_2609898 ) ) ( not ( = ?auto_2609885 ?auto_2609886 ) ) ( not ( = ?auto_2609885 ?auto_2609883 ) ) ( not ( = ?auto_2609885 ?auto_2609887 ) ) ( not ( = ?auto_2609885 ?auto_2609889 ) ) ( not ( = ?auto_2609885 ?auto_2609888 ) ) ( not ( = ?auto_2609885 ?auto_2609890 ) ) ( not ( = ?auto_2609885 ?auto_2609891 ) ) ( not ( = ?auto_2609885 ?auto_2609892 ) ) ( not ( = ?auto_2609885 ?auto_2609893 ) ) ( not ( = ?auto_2609885 ?auto_2609894 ) ) ( not ( = ?auto_2609885 ?auto_2609895 ) ) ( not ( = ?auto_2609885 ?auto_2609896 ) ) ( not ( = ?auto_2609885 ?auto_2609897 ) ) ( not ( = ?auto_2609885 ?auto_2609898 ) ) ( not ( = ?auto_2609886 ?auto_2609883 ) ) ( not ( = ?auto_2609886 ?auto_2609887 ) ) ( not ( = ?auto_2609886 ?auto_2609889 ) ) ( not ( = ?auto_2609886 ?auto_2609888 ) ) ( not ( = ?auto_2609886 ?auto_2609890 ) ) ( not ( = ?auto_2609886 ?auto_2609891 ) ) ( not ( = ?auto_2609886 ?auto_2609892 ) ) ( not ( = ?auto_2609886 ?auto_2609893 ) ) ( not ( = ?auto_2609886 ?auto_2609894 ) ) ( not ( = ?auto_2609886 ?auto_2609895 ) ) ( not ( = ?auto_2609886 ?auto_2609896 ) ) ( not ( = ?auto_2609886 ?auto_2609897 ) ) ( not ( = ?auto_2609886 ?auto_2609898 ) ) ( not ( = ?auto_2609883 ?auto_2609887 ) ) ( not ( = ?auto_2609883 ?auto_2609889 ) ) ( not ( = ?auto_2609883 ?auto_2609888 ) ) ( not ( = ?auto_2609883 ?auto_2609890 ) ) ( not ( = ?auto_2609883 ?auto_2609891 ) ) ( not ( = ?auto_2609883 ?auto_2609892 ) ) ( not ( = ?auto_2609883 ?auto_2609893 ) ) ( not ( = ?auto_2609883 ?auto_2609894 ) ) ( not ( = ?auto_2609883 ?auto_2609895 ) ) ( not ( = ?auto_2609883 ?auto_2609896 ) ) ( not ( = ?auto_2609883 ?auto_2609897 ) ) ( not ( = ?auto_2609883 ?auto_2609898 ) ) ( not ( = ?auto_2609887 ?auto_2609889 ) ) ( not ( = ?auto_2609887 ?auto_2609888 ) ) ( not ( = ?auto_2609887 ?auto_2609890 ) ) ( not ( = ?auto_2609887 ?auto_2609891 ) ) ( not ( = ?auto_2609887 ?auto_2609892 ) ) ( not ( = ?auto_2609887 ?auto_2609893 ) ) ( not ( = ?auto_2609887 ?auto_2609894 ) ) ( not ( = ?auto_2609887 ?auto_2609895 ) ) ( not ( = ?auto_2609887 ?auto_2609896 ) ) ( not ( = ?auto_2609887 ?auto_2609897 ) ) ( not ( = ?auto_2609887 ?auto_2609898 ) ) ( not ( = ?auto_2609889 ?auto_2609888 ) ) ( not ( = ?auto_2609889 ?auto_2609890 ) ) ( not ( = ?auto_2609889 ?auto_2609891 ) ) ( not ( = ?auto_2609889 ?auto_2609892 ) ) ( not ( = ?auto_2609889 ?auto_2609893 ) ) ( not ( = ?auto_2609889 ?auto_2609894 ) ) ( not ( = ?auto_2609889 ?auto_2609895 ) ) ( not ( = ?auto_2609889 ?auto_2609896 ) ) ( not ( = ?auto_2609889 ?auto_2609897 ) ) ( not ( = ?auto_2609889 ?auto_2609898 ) ) ( not ( = ?auto_2609888 ?auto_2609890 ) ) ( not ( = ?auto_2609888 ?auto_2609891 ) ) ( not ( = ?auto_2609888 ?auto_2609892 ) ) ( not ( = ?auto_2609888 ?auto_2609893 ) ) ( not ( = ?auto_2609888 ?auto_2609894 ) ) ( not ( = ?auto_2609888 ?auto_2609895 ) ) ( not ( = ?auto_2609888 ?auto_2609896 ) ) ( not ( = ?auto_2609888 ?auto_2609897 ) ) ( not ( = ?auto_2609888 ?auto_2609898 ) ) ( not ( = ?auto_2609890 ?auto_2609891 ) ) ( not ( = ?auto_2609890 ?auto_2609892 ) ) ( not ( = ?auto_2609890 ?auto_2609893 ) ) ( not ( = ?auto_2609890 ?auto_2609894 ) ) ( not ( = ?auto_2609890 ?auto_2609895 ) ) ( not ( = ?auto_2609890 ?auto_2609896 ) ) ( not ( = ?auto_2609890 ?auto_2609897 ) ) ( not ( = ?auto_2609890 ?auto_2609898 ) ) ( not ( = ?auto_2609891 ?auto_2609892 ) ) ( not ( = ?auto_2609891 ?auto_2609893 ) ) ( not ( = ?auto_2609891 ?auto_2609894 ) ) ( not ( = ?auto_2609891 ?auto_2609895 ) ) ( not ( = ?auto_2609891 ?auto_2609896 ) ) ( not ( = ?auto_2609891 ?auto_2609897 ) ) ( not ( = ?auto_2609891 ?auto_2609898 ) ) ( not ( = ?auto_2609892 ?auto_2609893 ) ) ( not ( = ?auto_2609892 ?auto_2609894 ) ) ( not ( = ?auto_2609892 ?auto_2609895 ) ) ( not ( = ?auto_2609892 ?auto_2609896 ) ) ( not ( = ?auto_2609892 ?auto_2609897 ) ) ( not ( = ?auto_2609892 ?auto_2609898 ) ) ( not ( = ?auto_2609893 ?auto_2609894 ) ) ( not ( = ?auto_2609893 ?auto_2609895 ) ) ( not ( = ?auto_2609893 ?auto_2609896 ) ) ( not ( = ?auto_2609893 ?auto_2609897 ) ) ( not ( = ?auto_2609893 ?auto_2609898 ) ) ( not ( = ?auto_2609894 ?auto_2609895 ) ) ( not ( = ?auto_2609894 ?auto_2609896 ) ) ( not ( = ?auto_2609894 ?auto_2609897 ) ) ( not ( = ?auto_2609894 ?auto_2609898 ) ) ( not ( = ?auto_2609895 ?auto_2609896 ) ) ( not ( = ?auto_2609895 ?auto_2609897 ) ) ( not ( = ?auto_2609895 ?auto_2609898 ) ) ( not ( = ?auto_2609896 ?auto_2609897 ) ) ( not ( = ?auto_2609896 ?auto_2609898 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2609897 ?auto_2609898 )
      ( MAKE-15CRATE-VERIFY ?auto_2609884 ?auto_2609885 ?auto_2609886 ?auto_2609883 ?auto_2609887 ?auto_2609889 ?auto_2609888 ?auto_2609890 ?auto_2609891 ?auto_2609892 ?auto_2609893 ?auto_2609894 ?auto_2609895 ?auto_2609896 ?auto_2609897 ?auto_2609898 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2610063 - SURFACE
      ?auto_2610064 - SURFACE
      ?auto_2610065 - SURFACE
      ?auto_2610062 - SURFACE
      ?auto_2610066 - SURFACE
      ?auto_2610068 - SURFACE
      ?auto_2610067 - SURFACE
      ?auto_2610069 - SURFACE
      ?auto_2610070 - SURFACE
      ?auto_2610071 - SURFACE
      ?auto_2610072 - SURFACE
      ?auto_2610073 - SURFACE
      ?auto_2610074 - SURFACE
      ?auto_2610075 - SURFACE
      ?auto_2610076 - SURFACE
      ?auto_2610077 - SURFACE
    )
    :vars
    (
      ?auto_2610079 - HOIST
      ?auto_2610078 - PLACE
      ?auto_2610080 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2610079 ?auto_2610078 ) ( SURFACE-AT ?auto_2610076 ?auto_2610078 ) ( CLEAR ?auto_2610076 ) ( IS-CRATE ?auto_2610077 ) ( not ( = ?auto_2610076 ?auto_2610077 ) ) ( TRUCK-AT ?auto_2610080 ?auto_2610078 ) ( AVAILABLE ?auto_2610079 ) ( IN ?auto_2610077 ?auto_2610080 ) ( ON ?auto_2610076 ?auto_2610075 ) ( not ( = ?auto_2610075 ?auto_2610076 ) ) ( not ( = ?auto_2610075 ?auto_2610077 ) ) ( ON ?auto_2610064 ?auto_2610063 ) ( ON ?auto_2610065 ?auto_2610064 ) ( ON ?auto_2610062 ?auto_2610065 ) ( ON ?auto_2610066 ?auto_2610062 ) ( ON ?auto_2610068 ?auto_2610066 ) ( ON ?auto_2610067 ?auto_2610068 ) ( ON ?auto_2610069 ?auto_2610067 ) ( ON ?auto_2610070 ?auto_2610069 ) ( ON ?auto_2610071 ?auto_2610070 ) ( ON ?auto_2610072 ?auto_2610071 ) ( ON ?auto_2610073 ?auto_2610072 ) ( ON ?auto_2610074 ?auto_2610073 ) ( ON ?auto_2610075 ?auto_2610074 ) ( not ( = ?auto_2610063 ?auto_2610064 ) ) ( not ( = ?auto_2610063 ?auto_2610065 ) ) ( not ( = ?auto_2610063 ?auto_2610062 ) ) ( not ( = ?auto_2610063 ?auto_2610066 ) ) ( not ( = ?auto_2610063 ?auto_2610068 ) ) ( not ( = ?auto_2610063 ?auto_2610067 ) ) ( not ( = ?auto_2610063 ?auto_2610069 ) ) ( not ( = ?auto_2610063 ?auto_2610070 ) ) ( not ( = ?auto_2610063 ?auto_2610071 ) ) ( not ( = ?auto_2610063 ?auto_2610072 ) ) ( not ( = ?auto_2610063 ?auto_2610073 ) ) ( not ( = ?auto_2610063 ?auto_2610074 ) ) ( not ( = ?auto_2610063 ?auto_2610075 ) ) ( not ( = ?auto_2610063 ?auto_2610076 ) ) ( not ( = ?auto_2610063 ?auto_2610077 ) ) ( not ( = ?auto_2610064 ?auto_2610065 ) ) ( not ( = ?auto_2610064 ?auto_2610062 ) ) ( not ( = ?auto_2610064 ?auto_2610066 ) ) ( not ( = ?auto_2610064 ?auto_2610068 ) ) ( not ( = ?auto_2610064 ?auto_2610067 ) ) ( not ( = ?auto_2610064 ?auto_2610069 ) ) ( not ( = ?auto_2610064 ?auto_2610070 ) ) ( not ( = ?auto_2610064 ?auto_2610071 ) ) ( not ( = ?auto_2610064 ?auto_2610072 ) ) ( not ( = ?auto_2610064 ?auto_2610073 ) ) ( not ( = ?auto_2610064 ?auto_2610074 ) ) ( not ( = ?auto_2610064 ?auto_2610075 ) ) ( not ( = ?auto_2610064 ?auto_2610076 ) ) ( not ( = ?auto_2610064 ?auto_2610077 ) ) ( not ( = ?auto_2610065 ?auto_2610062 ) ) ( not ( = ?auto_2610065 ?auto_2610066 ) ) ( not ( = ?auto_2610065 ?auto_2610068 ) ) ( not ( = ?auto_2610065 ?auto_2610067 ) ) ( not ( = ?auto_2610065 ?auto_2610069 ) ) ( not ( = ?auto_2610065 ?auto_2610070 ) ) ( not ( = ?auto_2610065 ?auto_2610071 ) ) ( not ( = ?auto_2610065 ?auto_2610072 ) ) ( not ( = ?auto_2610065 ?auto_2610073 ) ) ( not ( = ?auto_2610065 ?auto_2610074 ) ) ( not ( = ?auto_2610065 ?auto_2610075 ) ) ( not ( = ?auto_2610065 ?auto_2610076 ) ) ( not ( = ?auto_2610065 ?auto_2610077 ) ) ( not ( = ?auto_2610062 ?auto_2610066 ) ) ( not ( = ?auto_2610062 ?auto_2610068 ) ) ( not ( = ?auto_2610062 ?auto_2610067 ) ) ( not ( = ?auto_2610062 ?auto_2610069 ) ) ( not ( = ?auto_2610062 ?auto_2610070 ) ) ( not ( = ?auto_2610062 ?auto_2610071 ) ) ( not ( = ?auto_2610062 ?auto_2610072 ) ) ( not ( = ?auto_2610062 ?auto_2610073 ) ) ( not ( = ?auto_2610062 ?auto_2610074 ) ) ( not ( = ?auto_2610062 ?auto_2610075 ) ) ( not ( = ?auto_2610062 ?auto_2610076 ) ) ( not ( = ?auto_2610062 ?auto_2610077 ) ) ( not ( = ?auto_2610066 ?auto_2610068 ) ) ( not ( = ?auto_2610066 ?auto_2610067 ) ) ( not ( = ?auto_2610066 ?auto_2610069 ) ) ( not ( = ?auto_2610066 ?auto_2610070 ) ) ( not ( = ?auto_2610066 ?auto_2610071 ) ) ( not ( = ?auto_2610066 ?auto_2610072 ) ) ( not ( = ?auto_2610066 ?auto_2610073 ) ) ( not ( = ?auto_2610066 ?auto_2610074 ) ) ( not ( = ?auto_2610066 ?auto_2610075 ) ) ( not ( = ?auto_2610066 ?auto_2610076 ) ) ( not ( = ?auto_2610066 ?auto_2610077 ) ) ( not ( = ?auto_2610068 ?auto_2610067 ) ) ( not ( = ?auto_2610068 ?auto_2610069 ) ) ( not ( = ?auto_2610068 ?auto_2610070 ) ) ( not ( = ?auto_2610068 ?auto_2610071 ) ) ( not ( = ?auto_2610068 ?auto_2610072 ) ) ( not ( = ?auto_2610068 ?auto_2610073 ) ) ( not ( = ?auto_2610068 ?auto_2610074 ) ) ( not ( = ?auto_2610068 ?auto_2610075 ) ) ( not ( = ?auto_2610068 ?auto_2610076 ) ) ( not ( = ?auto_2610068 ?auto_2610077 ) ) ( not ( = ?auto_2610067 ?auto_2610069 ) ) ( not ( = ?auto_2610067 ?auto_2610070 ) ) ( not ( = ?auto_2610067 ?auto_2610071 ) ) ( not ( = ?auto_2610067 ?auto_2610072 ) ) ( not ( = ?auto_2610067 ?auto_2610073 ) ) ( not ( = ?auto_2610067 ?auto_2610074 ) ) ( not ( = ?auto_2610067 ?auto_2610075 ) ) ( not ( = ?auto_2610067 ?auto_2610076 ) ) ( not ( = ?auto_2610067 ?auto_2610077 ) ) ( not ( = ?auto_2610069 ?auto_2610070 ) ) ( not ( = ?auto_2610069 ?auto_2610071 ) ) ( not ( = ?auto_2610069 ?auto_2610072 ) ) ( not ( = ?auto_2610069 ?auto_2610073 ) ) ( not ( = ?auto_2610069 ?auto_2610074 ) ) ( not ( = ?auto_2610069 ?auto_2610075 ) ) ( not ( = ?auto_2610069 ?auto_2610076 ) ) ( not ( = ?auto_2610069 ?auto_2610077 ) ) ( not ( = ?auto_2610070 ?auto_2610071 ) ) ( not ( = ?auto_2610070 ?auto_2610072 ) ) ( not ( = ?auto_2610070 ?auto_2610073 ) ) ( not ( = ?auto_2610070 ?auto_2610074 ) ) ( not ( = ?auto_2610070 ?auto_2610075 ) ) ( not ( = ?auto_2610070 ?auto_2610076 ) ) ( not ( = ?auto_2610070 ?auto_2610077 ) ) ( not ( = ?auto_2610071 ?auto_2610072 ) ) ( not ( = ?auto_2610071 ?auto_2610073 ) ) ( not ( = ?auto_2610071 ?auto_2610074 ) ) ( not ( = ?auto_2610071 ?auto_2610075 ) ) ( not ( = ?auto_2610071 ?auto_2610076 ) ) ( not ( = ?auto_2610071 ?auto_2610077 ) ) ( not ( = ?auto_2610072 ?auto_2610073 ) ) ( not ( = ?auto_2610072 ?auto_2610074 ) ) ( not ( = ?auto_2610072 ?auto_2610075 ) ) ( not ( = ?auto_2610072 ?auto_2610076 ) ) ( not ( = ?auto_2610072 ?auto_2610077 ) ) ( not ( = ?auto_2610073 ?auto_2610074 ) ) ( not ( = ?auto_2610073 ?auto_2610075 ) ) ( not ( = ?auto_2610073 ?auto_2610076 ) ) ( not ( = ?auto_2610073 ?auto_2610077 ) ) ( not ( = ?auto_2610074 ?auto_2610075 ) ) ( not ( = ?auto_2610074 ?auto_2610076 ) ) ( not ( = ?auto_2610074 ?auto_2610077 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2610075 ?auto_2610076 ?auto_2610077 )
      ( MAKE-15CRATE-VERIFY ?auto_2610063 ?auto_2610064 ?auto_2610065 ?auto_2610062 ?auto_2610066 ?auto_2610068 ?auto_2610067 ?auto_2610069 ?auto_2610070 ?auto_2610071 ?auto_2610072 ?auto_2610073 ?auto_2610074 ?auto_2610075 ?auto_2610076 ?auto_2610077 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2610258 - SURFACE
      ?auto_2610259 - SURFACE
      ?auto_2610260 - SURFACE
      ?auto_2610257 - SURFACE
      ?auto_2610261 - SURFACE
      ?auto_2610263 - SURFACE
      ?auto_2610262 - SURFACE
      ?auto_2610264 - SURFACE
      ?auto_2610265 - SURFACE
      ?auto_2610266 - SURFACE
      ?auto_2610267 - SURFACE
      ?auto_2610268 - SURFACE
      ?auto_2610269 - SURFACE
      ?auto_2610270 - SURFACE
      ?auto_2610271 - SURFACE
      ?auto_2610272 - SURFACE
    )
    :vars
    (
      ?auto_2610276 - HOIST
      ?auto_2610275 - PLACE
      ?auto_2610274 - TRUCK
      ?auto_2610273 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2610276 ?auto_2610275 ) ( SURFACE-AT ?auto_2610271 ?auto_2610275 ) ( CLEAR ?auto_2610271 ) ( IS-CRATE ?auto_2610272 ) ( not ( = ?auto_2610271 ?auto_2610272 ) ) ( AVAILABLE ?auto_2610276 ) ( IN ?auto_2610272 ?auto_2610274 ) ( ON ?auto_2610271 ?auto_2610270 ) ( not ( = ?auto_2610270 ?auto_2610271 ) ) ( not ( = ?auto_2610270 ?auto_2610272 ) ) ( TRUCK-AT ?auto_2610274 ?auto_2610273 ) ( not ( = ?auto_2610273 ?auto_2610275 ) ) ( ON ?auto_2610259 ?auto_2610258 ) ( ON ?auto_2610260 ?auto_2610259 ) ( ON ?auto_2610257 ?auto_2610260 ) ( ON ?auto_2610261 ?auto_2610257 ) ( ON ?auto_2610263 ?auto_2610261 ) ( ON ?auto_2610262 ?auto_2610263 ) ( ON ?auto_2610264 ?auto_2610262 ) ( ON ?auto_2610265 ?auto_2610264 ) ( ON ?auto_2610266 ?auto_2610265 ) ( ON ?auto_2610267 ?auto_2610266 ) ( ON ?auto_2610268 ?auto_2610267 ) ( ON ?auto_2610269 ?auto_2610268 ) ( ON ?auto_2610270 ?auto_2610269 ) ( not ( = ?auto_2610258 ?auto_2610259 ) ) ( not ( = ?auto_2610258 ?auto_2610260 ) ) ( not ( = ?auto_2610258 ?auto_2610257 ) ) ( not ( = ?auto_2610258 ?auto_2610261 ) ) ( not ( = ?auto_2610258 ?auto_2610263 ) ) ( not ( = ?auto_2610258 ?auto_2610262 ) ) ( not ( = ?auto_2610258 ?auto_2610264 ) ) ( not ( = ?auto_2610258 ?auto_2610265 ) ) ( not ( = ?auto_2610258 ?auto_2610266 ) ) ( not ( = ?auto_2610258 ?auto_2610267 ) ) ( not ( = ?auto_2610258 ?auto_2610268 ) ) ( not ( = ?auto_2610258 ?auto_2610269 ) ) ( not ( = ?auto_2610258 ?auto_2610270 ) ) ( not ( = ?auto_2610258 ?auto_2610271 ) ) ( not ( = ?auto_2610258 ?auto_2610272 ) ) ( not ( = ?auto_2610259 ?auto_2610260 ) ) ( not ( = ?auto_2610259 ?auto_2610257 ) ) ( not ( = ?auto_2610259 ?auto_2610261 ) ) ( not ( = ?auto_2610259 ?auto_2610263 ) ) ( not ( = ?auto_2610259 ?auto_2610262 ) ) ( not ( = ?auto_2610259 ?auto_2610264 ) ) ( not ( = ?auto_2610259 ?auto_2610265 ) ) ( not ( = ?auto_2610259 ?auto_2610266 ) ) ( not ( = ?auto_2610259 ?auto_2610267 ) ) ( not ( = ?auto_2610259 ?auto_2610268 ) ) ( not ( = ?auto_2610259 ?auto_2610269 ) ) ( not ( = ?auto_2610259 ?auto_2610270 ) ) ( not ( = ?auto_2610259 ?auto_2610271 ) ) ( not ( = ?auto_2610259 ?auto_2610272 ) ) ( not ( = ?auto_2610260 ?auto_2610257 ) ) ( not ( = ?auto_2610260 ?auto_2610261 ) ) ( not ( = ?auto_2610260 ?auto_2610263 ) ) ( not ( = ?auto_2610260 ?auto_2610262 ) ) ( not ( = ?auto_2610260 ?auto_2610264 ) ) ( not ( = ?auto_2610260 ?auto_2610265 ) ) ( not ( = ?auto_2610260 ?auto_2610266 ) ) ( not ( = ?auto_2610260 ?auto_2610267 ) ) ( not ( = ?auto_2610260 ?auto_2610268 ) ) ( not ( = ?auto_2610260 ?auto_2610269 ) ) ( not ( = ?auto_2610260 ?auto_2610270 ) ) ( not ( = ?auto_2610260 ?auto_2610271 ) ) ( not ( = ?auto_2610260 ?auto_2610272 ) ) ( not ( = ?auto_2610257 ?auto_2610261 ) ) ( not ( = ?auto_2610257 ?auto_2610263 ) ) ( not ( = ?auto_2610257 ?auto_2610262 ) ) ( not ( = ?auto_2610257 ?auto_2610264 ) ) ( not ( = ?auto_2610257 ?auto_2610265 ) ) ( not ( = ?auto_2610257 ?auto_2610266 ) ) ( not ( = ?auto_2610257 ?auto_2610267 ) ) ( not ( = ?auto_2610257 ?auto_2610268 ) ) ( not ( = ?auto_2610257 ?auto_2610269 ) ) ( not ( = ?auto_2610257 ?auto_2610270 ) ) ( not ( = ?auto_2610257 ?auto_2610271 ) ) ( not ( = ?auto_2610257 ?auto_2610272 ) ) ( not ( = ?auto_2610261 ?auto_2610263 ) ) ( not ( = ?auto_2610261 ?auto_2610262 ) ) ( not ( = ?auto_2610261 ?auto_2610264 ) ) ( not ( = ?auto_2610261 ?auto_2610265 ) ) ( not ( = ?auto_2610261 ?auto_2610266 ) ) ( not ( = ?auto_2610261 ?auto_2610267 ) ) ( not ( = ?auto_2610261 ?auto_2610268 ) ) ( not ( = ?auto_2610261 ?auto_2610269 ) ) ( not ( = ?auto_2610261 ?auto_2610270 ) ) ( not ( = ?auto_2610261 ?auto_2610271 ) ) ( not ( = ?auto_2610261 ?auto_2610272 ) ) ( not ( = ?auto_2610263 ?auto_2610262 ) ) ( not ( = ?auto_2610263 ?auto_2610264 ) ) ( not ( = ?auto_2610263 ?auto_2610265 ) ) ( not ( = ?auto_2610263 ?auto_2610266 ) ) ( not ( = ?auto_2610263 ?auto_2610267 ) ) ( not ( = ?auto_2610263 ?auto_2610268 ) ) ( not ( = ?auto_2610263 ?auto_2610269 ) ) ( not ( = ?auto_2610263 ?auto_2610270 ) ) ( not ( = ?auto_2610263 ?auto_2610271 ) ) ( not ( = ?auto_2610263 ?auto_2610272 ) ) ( not ( = ?auto_2610262 ?auto_2610264 ) ) ( not ( = ?auto_2610262 ?auto_2610265 ) ) ( not ( = ?auto_2610262 ?auto_2610266 ) ) ( not ( = ?auto_2610262 ?auto_2610267 ) ) ( not ( = ?auto_2610262 ?auto_2610268 ) ) ( not ( = ?auto_2610262 ?auto_2610269 ) ) ( not ( = ?auto_2610262 ?auto_2610270 ) ) ( not ( = ?auto_2610262 ?auto_2610271 ) ) ( not ( = ?auto_2610262 ?auto_2610272 ) ) ( not ( = ?auto_2610264 ?auto_2610265 ) ) ( not ( = ?auto_2610264 ?auto_2610266 ) ) ( not ( = ?auto_2610264 ?auto_2610267 ) ) ( not ( = ?auto_2610264 ?auto_2610268 ) ) ( not ( = ?auto_2610264 ?auto_2610269 ) ) ( not ( = ?auto_2610264 ?auto_2610270 ) ) ( not ( = ?auto_2610264 ?auto_2610271 ) ) ( not ( = ?auto_2610264 ?auto_2610272 ) ) ( not ( = ?auto_2610265 ?auto_2610266 ) ) ( not ( = ?auto_2610265 ?auto_2610267 ) ) ( not ( = ?auto_2610265 ?auto_2610268 ) ) ( not ( = ?auto_2610265 ?auto_2610269 ) ) ( not ( = ?auto_2610265 ?auto_2610270 ) ) ( not ( = ?auto_2610265 ?auto_2610271 ) ) ( not ( = ?auto_2610265 ?auto_2610272 ) ) ( not ( = ?auto_2610266 ?auto_2610267 ) ) ( not ( = ?auto_2610266 ?auto_2610268 ) ) ( not ( = ?auto_2610266 ?auto_2610269 ) ) ( not ( = ?auto_2610266 ?auto_2610270 ) ) ( not ( = ?auto_2610266 ?auto_2610271 ) ) ( not ( = ?auto_2610266 ?auto_2610272 ) ) ( not ( = ?auto_2610267 ?auto_2610268 ) ) ( not ( = ?auto_2610267 ?auto_2610269 ) ) ( not ( = ?auto_2610267 ?auto_2610270 ) ) ( not ( = ?auto_2610267 ?auto_2610271 ) ) ( not ( = ?auto_2610267 ?auto_2610272 ) ) ( not ( = ?auto_2610268 ?auto_2610269 ) ) ( not ( = ?auto_2610268 ?auto_2610270 ) ) ( not ( = ?auto_2610268 ?auto_2610271 ) ) ( not ( = ?auto_2610268 ?auto_2610272 ) ) ( not ( = ?auto_2610269 ?auto_2610270 ) ) ( not ( = ?auto_2610269 ?auto_2610271 ) ) ( not ( = ?auto_2610269 ?auto_2610272 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2610270 ?auto_2610271 ?auto_2610272 )
      ( MAKE-15CRATE-VERIFY ?auto_2610258 ?auto_2610259 ?auto_2610260 ?auto_2610257 ?auto_2610261 ?auto_2610263 ?auto_2610262 ?auto_2610264 ?auto_2610265 ?auto_2610266 ?auto_2610267 ?auto_2610268 ?auto_2610269 ?auto_2610270 ?auto_2610271 ?auto_2610272 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2610468 - SURFACE
      ?auto_2610469 - SURFACE
      ?auto_2610470 - SURFACE
      ?auto_2610467 - SURFACE
      ?auto_2610471 - SURFACE
      ?auto_2610473 - SURFACE
      ?auto_2610472 - SURFACE
      ?auto_2610474 - SURFACE
      ?auto_2610475 - SURFACE
      ?auto_2610476 - SURFACE
      ?auto_2610477 - SURFACE
      ?auto_2610478 - SURFACE
      ?auto_2610479 - SURFACE
      ?auto_2610480 - SURFACE
      ?auto_2610481 - SURFACE
      ?auto_2610482 - SURFACE
    )
    :vars
    (
      ?auto_2610486 - HOIST
      ?auto_2610483 - PLACE
      ?auto_2610487 - TRUCK
      ?auto_2610484 - PLACE
      ?auto_2610485 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2610486 ?auto_2610483 ) ( SURFACE-AT ?auto_2610481 ?auto_2610483 ) ( CLEAR ?auto_2610481 ) ( IS-CRATE ?auto_2610482 ) ( not ( = ?auto_2610481 ?auto_2610482 ) ) ( AVAILABLE ?auto_2610486 ) ( ON ?auto_2610481 ?auto_2610480 ) ( not ( = ?auto_2610480 ?auto_2610481 ) ) ( not ( = ?auto_2610480 ?auto_2610482 ) ) ( TRUCK-AT ?auto_2610487 ?auto_2610484 ) ( not ( = ?auto_2610484 ?auto_2610483 ) ) ( HOIST-AT ?auto_2610485 ?auto_2610484 ) ( LIFTING ?auto_2610485 ?auto_2610482 ) ( not ( = ?auto_2610486 ?auto_2610485 ) ) ( ON ?auto_2610469 ?auto_2610468 ) ( ON ?auto_2610470 ?auto_2610469 ) ( ON ?auto_2610467 ?auto_2610470 ) ( ON ?auto_2610471 ?auto_2610467 ) ( ON ?auto_2610473 ?auto_2610471 ) ( ON ?auto_2610472 ?auto_2610473 ) ( ON ?auto_2610474 ?auto_2610472 ) ( ON ?auto_2610475 ?auto_2610474 ) ( ON ?auto_2610476 ?auto_2610475 ) ( ON ?auto_2610477 ?auto_2610476 ) ( ON ?auto_2610478 ?auto_2610477 ) ( ON ?auto_2610479 ?auto_2610478 ) ( ON ?auto_2610480 ?auto_2610479 ) ( not ( = ?auto_2610468 ?auto_2610469 ) ) ( not ( = ?auto_2610468 ?auto_2610470 ) ) ( not ( = ?auto_2610468 ?auto_2610467 ) ) ( not ( = ?auto_2610468 ?auto_2610471 ) ) ( not ( = ?auto_2610468 ?auto_2610473 ) ) ( not ( = ?auto_2610468 ?auto_2610472 ) ) ( not ( = ?auto_2610468 ?auto_2610474 ) ) ( not ( = ?auto_2610468 ?auto_2610475 ) ) ( not ( = ?auto_2610468 ?auto_2610476 ) ) ( not ( = ?auto_2610468 ?auto_2610477 ) ) ( not ( = ?auto_2610468 ?auto_2610478 ) ) ( not ( = ?auto_2610468 ?auto_2610479 ) ) ( not ( = ?auto_2610468 ?auto_2610480 ) ) ( not ( = ?auto_2610468 ?auto_2610481 ) ) ( not ( = ?auto_2610468 ?auto_2610482 ) ) ( not ( = ?auto_2610469 ?auto_2610470 ) ) ( not ( = ?auto_2610469 ?auto_2610467 ) ) ( not ( = ?auto_2610469 ?auto_2610471 ) ) ( not ( = ?auto_2610469 ?auto_2610473 ) ) ( not ( = ?auto_2610469 ?auto_2610472 ) ) ( not ( = ?auto_2610469 ?auto_2610474 ) ) ( not ( = ?auto_2610469 ?auto_2610475 ) ) ( not ( = ?auto_2610469 ?auto_2610476 ) ) ( not ( = ?auto_2610469 ?auto_2610477 ) ) ( not ( = ?auto_2610469 ?auto_2610478 ) ) ( not ( = ?auto_2610469 ?auto_2610479 ) ) ( not ( = ?auto_2610469 ?auto_2610480 ) ) ( not ( = ?auto_2610469 ?auto_2610481 ) ) ( not ( = ?auto_2610469 ?auto_2610482 ) ) ( not ( = ?auto_2610470 ?auto_2610467 ) ) ( not ( = ?auto_2610470 ?auto_2610471 ) ) ( not ( = ?auto_2610470 ?auto_2610473 ) ) ( not ( = ?auto_2610470 ?auto_2610472 ) ) ( not ( = ?auto_2610470 ?auto_2610474 ) ) ( not ( = ?auto_2610470 ?auto_2610475 ) ) ( not ( = ?auto_2610470 ?auto_2610476 ) ) ( not ( = ?auto_2610470 ?auto_2610477 ) ) ( not ( = ?auto_2610470 ?auto_2610478 ) ) ( not ( = ?auto_2610470 ?auto_2610479 ) ) ( not ( = ?auto_2610470 ?auto_2610480 ) ) ( not ( = ?auto_2610470 ?auto_2610481 ) ) ( not ( = ?auto_2610470 ?auto_2610482 ) ) ( not ( = ?auto_2610467 ?auto_2610471 ) ) ( not ( = ?auto_2610467 ?auto_2610473 ) ) ( not ( = ?auto_2610467 ?auto_2610472 ) ) ( not ( = ?auto_2610467 ?auto_2610474 ) ) ( not ( = ?auto_2610467 ?auto_2610475 ) ) ( not ( = ?auto_2610467 ?auto_2610476 ) ) ( not ( = ?auto_2610467 ?auto_2610477 ) ) ( not ( = ?auto_2610467 ?auto_2610478 ) ) ( not ( = ?auto_2610467 ?auto_2610479 ) ) ( not ( = ?auto_2610467 ?auto_2610480 ) ) ( not ( = ?auto_2610467 ?auto_2610481 ) ) ( not ( = ?auto_2610467 ?auto_2610482 ) ) ( not ( = ?auto_2610471 ?auto_2610473 ) ) ( not ( = ?auto_2610471 ?auto_2610472 ) ) ( not ( = ?auto_2610471 ?auto_2610474 ) ) ( not ( = ?auto_2610471 ?auto_2610475 ) ) ( not ( = ?auto_2610471 ?auto_2610476 ) ) ( not ( = ?auto_2610471 ?auto_2610477 ) ) ( not ( = ?auto_2610471 ?auto_2610478 ) ) ( not ( = ?auto_2610471 ?auto_2610479 ) ) ( not ( = ?auto_2610471 ?auto_2610480 ) ) ( not ( = ?auto_2610471 ?auto_2610481 ) ) ( not ( = ?auto_2610471 ?auto_2610482 ) ) ( not ( = ?auto_2610473 ?auto_2610472 ) ) ( not ( = ?auto_2610473 ?auto_2610474 ) ) ( not ( = ?auto_2610473 ?auto_2610475 ) ) ( not ( = ?auto_2610473 ?auto_2610476 ) ) ( not ( = ?auto_2610473 ?auto_2610477 ) ) ( not ( = ?auto_2610473 ?auto_2610478 ) ) ( not ( = ?auto_2610473 ?auto_2610479 ) ) ( not ( = ?auto_2610473 ?auto_2610480 ) ) ( not ( = ?auto_2610473 ?auto_2610481 ) ) ( not ( = ?auto_2610473 ?auto_2610482 ) ) ( not ( = ?auto_2610472 ?auto_2610474 ) ) ( not ( = ?auto_2610472 ?auto_2610475 ) ) ( not ( = ?auto_2610472 ?auto_2610476 ) ) ( not ( = ?auto_2610472 ?auto_2610477 ) ) ( not ( = ?auto_2610472 ?auto_2610478 ) ) ( not ( = ?auto_2610472 ?auto_2610479 ) ) ( not ( = ?auto_2610472 ?auto_2610480 ) ) ( not ( = ?auto_2610472 ?auto_2610481 ) ) ( not ( = ?auto_2610472 ?auto_2610482 ) ) ( not ( = ?auto_2610474 ?auto_2610475 ) ) ( not ( = ?auto_2610474 ?auto_2610476 ) ) ( not ( = ?auto_2610474 ?auto_2610477 ) ) ( not ( = ?auto_2610474 ?auto_2610478 ) ) ( not ( = ?auto_2610474 ?auto_2610479 ) ) ( not ( = ?auto_2610474 ?auto_2610480 ) ) ( not ( = ?auto_2610474 ?auto_2610481 ) ) ( not ( = ?auto_2610474 ?auto_2610482 ) ) ( not ( = ?auto_2610475 ?auto_2610476 ) ) ( not ( = ?auto_2610475 ?auto_2610477 ) ) ( not ( = ?auto_2610475 ?auto_2610478 ) ) ( not ( = ?auto_2610475 ?auto_2610479 ) ) ( not ( = ?auto_2610475 ?auto_2610480 ) ) ( not ( = ?auto_2610475 ?auto_2610481 ) ) ( not ( = ?auto_2610475 ?auto_2610482 ) ) ( not ( = ?auto_2610476 ?auto_2610477 ) ) ( not ( = ?auto_2610476 ?auto_2610478 ) ) ( not ( = ?auto_2610476 ?auto_2610479 ) ) ( not ( = ?auto_2610476 ?auto_2610480 ) ) ( not ( = ?auto_2610476 ?auto_2610481 ) ) ( not ( = ?auto_2610476 ?auto_2610482 ) ) ( not ( = ?auto_2610477 ?auto_2610478 ) ) ( not ( = ?auto_2610477 ?auto_2610479 ) ) ( not ( = ?auto_2610477 ?auto_2610480 ) ) ( not ( = ?auto_2610477 ?auto_2610481 ) ) ( not ( = ?auto_2610477 ?auto_2610482 ) ) ( not ( = ?auto_2610478 ?auto_2610479 ) ) ( not ( = ?auto_2610478 ?auto_2610480 ) ) ( not ( = ?auto_2610478 ?auto_2610481 ) ) ( not ( = ?auto_2610478 ?auto_2610482 ) ) ( not ( = ?auto_2610479 ?auto_2610480 ) ) ( not ( = ?auto_2610479 ?auto_2610481 ) ) ( not ( = ?auto_2610479 ?auto_2610482 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2610480 ?auto_2610481 ?auto_2610482 )
      ( MAKE-15CRATE-VERIFY ?auto_2610468 ?auto_2610469 ?auto_2610470 ?auto_2610467 ?auto_2610471 ?auto_2610473 ?auto_2610472 ?auto_2610474 ?auto_2610475 ?auto_2610476 ?auto_2610477 ?auto_2610478 ?auto_2610479 ?auto_2610480 ?auto_2610481 ?auto_2610482 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2610693 - SURFACE
      ?auto_2610694 - SURFACE
      ?auto_2610695 - SURFACE
      ?auto_2610692 - SURFACE
      ?auto_2610696 - SURFACE
      ?auto_2610698 - SURFACE
      ?auto_2610697 - SURFACE
      ?auto_2610699 - SURFACE
      ?auto_2610700 - SURFACE
      ?auto_2610701 - SURFACE
      ?auto_2610702 - SURFACE
      ?auto_2610703 - SURFACE
      ?auto_2610704 - SURFACE
      ?auto_2610705 - SURFACE
      ?auto_2610706 - SURFACE
      ?auto_2610707 - SURFACE
    )
    :vars
    (
      ?auto_2610712 - HOIST
      ?auto_2610710 - PLACE
      ?auto_2610708 - TRUCK
      ?auto_2610713 - PLACE
      ?auto_2610711 - HOIST
      ?auto_2610709 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2610712 ?auto_2610710 ) ( SURFACE-AT ?auto_2610706 ?auto_2610710 ) ( CLEAR ?auto_2610706 ) ( IS-CRATE ?auto_2610707 ) ( not ( = ?auto_2610706 ?auto_2610707 ) ) ( AVAILABLE ?auto_2610712 ) ( ON ?auto_2610706 ?auto_2610705 ) ( not ( = ?auto_2610705 ?auto_2610706 ) ) ( not ( = ?auto_2610705 ?auto_2610707 ) ) ( TRUCK-AT ?auto_2610708 ?auto_2610713 ) ( not ( = ?auto_2610713 ?auto_2610710 ) ) ( HOIST-AT ?auto_2610711 ?auto_2610713 ) ( not ( = ?auto_2610712 ?auto_2610711 ) ) ( AVAILABLE ?auto_2610711 ) ( SURFACE-AT ?auto_2610707 ?auto_2610713 ) ( ON ?auto_2610707 ?auto_2610709 ) ( CLEAR ?auto_2610707 ) ( not ( = ?auto_2610706 ?auto_2610709 ) ) ( not ( = ?auto_2610707 ?auto_2610709 ) ) ( not ( = ?auto_2610705 ?auto_2610709 ) ) ( ON ?auto_2610694 ?auto_2610693 ) ( ON ?auto_2610695 ?auto_2610694 ) ( ON ?auto_2610692 ?auto_2610695 ) ( ON ?auto_2610696 ?auto_2610692 ) ( ON ?auto_2610698 ?auto_2610696 ) ( ON ?auto_2610697 ?auto_2610698 ) ( ON ?auto_2610699 ?auto_2610697 ) ( ON ?auto_2610700 ?auto_2610699 ) ( ON ?auto_2610701 ?auto_2610700 ) ( ON ?auto_2610702 ?auto_2610701 ) ( ON ?auto_2610703 ?auto_2610702 ) ( ON ?auto_2610704 ?auto_2610703 ) ( ON ?auto_2610705 ?auto_2610704 ) ( not ( = ?auto_2610693 ?auto_2610694 ) ) ( not ( = ?auto_2610693 ?auto_2610695 ) ) ( not ( = ?auto_2610693 ?auto_2610692 ) ) ( not ( = ?auto_2610693 ?auto_2610696 ) ) ( not ( = ?auto_2610693 ?auto_2610698 ) ) ( not ( = ?auto_2610693 ?auto_2610697 ) ) ( not ( = ?auto_2610693 ?auto_2610699 ) ) ( not ( = ?auto_2610693 ?auto_2610700 ) ) ( not ( = ?auto_2610693 ?auto_2610701 ) ) ( not ( = ?auto_2610693 ?auto_2610702 ) ) ( not ( = ?auto_2610693 ?auto_2610703 ) ) ( not ( = ?auto_2610693 ?auto_2610704 ) ) ( not ( = ?auto_2610693 ?auto_2610705 ) ) ( not ( = ?auto_2610693 ?auto_2610706 ) ) ( not ( = ?auto_2610693 ?auto_2610707 ) ) ( not ( = ?auto_2610693 ?auto_2610709 ) ) ( not ( = ?auto_2610694 ?auto_2610695 ) ) ( not ( = ?auto_2610694 ?auto_2610692 ) ) ( not ( = ?auto_2610694 ?auto_2610696 ) ) ( not ( = ?auto_2610694 ?auto_2610698 ) ) ( not ( = ?auto_2610694 ?auto_2610697 ) ) ( not ( = ?auto_2610694 ?auto_2610699 ) ) ( not ( = ?auto_2610694 ?auto_2610700 ) ) ( not ( = ?auto_2610694 ?auto_2610701 ) ) ( not ( = ?auto_2610694 ?auto_2610702 ) ) ( not ( = ?auto_2610694 ?auto_2610703 ) ) ( not ( = ?auto_2610694 ?auto_2610704 ) ) ( not ( = ?auto_2610694 ?auto_2610705 ) ) ( not ( = ?auto_2610694 ?auto_2610706 ) ) ( not ( = ?auto_2610694 ?auto_2610707 ) ) ( not ( = ?auto_2610694 ?auto_2610709 ) ) ( not ( = ?auto_2610695 ?auto_2610692 ) ) ( not ( = ?auto_2610695 ?auto_2610696 ) ) ( not ( = ?auto_2610695 ?auto_2610698 ) ) ( not ( = ?auto_2610695 ?auto_2610697 ) ) ( not ( = ?auto_2610695 ?auto_2610699 ) ) ( not ( = ?auto_2610695 ?auto_2610700 ) ) ( not ( = ?auto_2610695 ?auto_2610701 ) ) ( not ( = ?auto_2610695 ?auto_2610702 ) ) ( not ( = ?auto_2610695 ?auto_2610703 ) ) ( not ( = ?auto_2610695 ?auto_2610704 ) ) ( not ( = ?auto_2610695 ?auto_2610705 ) ) ( not ( = ?auto_2610695 ?auto_2610706 ) ) ( not ( = ?auto_2610695 ?auto_2610707 ) ) ( not ( = ?auto_2610695 ?auto_2610709 ) ) ( not ( = ?auto_2610692 ?auto_2610696 ) ) ( not ( = ?auto_2610692 ?auto_2610698 ) ) ( not ( = ?auto_2610692 ?auto_2610697 ) ) ( not ( = ?auto_2610692 ?auto_2610699 ) ) ( not ( = ?auto_2610692 ?auto_2610700 ) ) ( not ( = ?auto_2610692 ?auto_2610701 ) ) ( not ( = ?auto_2610692 ?auto_2610702 ) ) ( not ( = ?auto_2610692 ?auto_2610703 ) ) ( not ( = ?auto_2610692 ?auto_2610704 ) ) ( not ( = ?auto_2610692 ?auto_2610705 ) ) ( not ( = ?auto_2610692 ?auto_2610706 ) ) ( not ( = ?auto_2610692 ?auto_2610707 ) ) ( not ( = ?auto_2610692 ?auto_2610709 ) ) ( not ( = ?auto_2610696 ?auto_2610698 ) ) ( not ( = ?auto_2610696 ?auto_2610697 ) ) ( not ( = ?auto_2610696 ?auto_2610699 ) ) ( not ( = ?auto_2610696 ?auto_2610700 ) ) ( not ( = ?auto_2610696 ?auto_2610701 ) ) ( not ( = ?auto_2610696 ?auto_2610702 ) ) ( not ( = ?auto_2610696 ?auto_2610703 ) ) ( not ( = ?auto_2610696 ?auto_2610704 ) ) ( not ( = ?auto_2610696 ?auto_2610705 ) ) ( not ( = ?auto_2610696 ?auto_2610706 ) ) ( not ( = ?auto_2610696 ?auto_2610707 ) ) ( not ( = ?auto_2610696 ?auto_2610709 ) ) ( not ( = ?auto_2610698 ?auto_2610697 ) ) ( not ( = ?auto_2610698 ?auto_2610699 ) ) ( not ( = ?auto_2610698 ?auto_2610700 ) ) ( not ( = ?auto_2610698 ?auto_2610701 ) ) ( not ( = ?auto_2610698 ?auto_2610702 ) ) ( not ( = ?auto_2610698 ?auto_2610703 ) ) ( not ( = ?auto_2610698 ?auto_2610704 ) ) ( not ( = ?auto_2610698 ?auto_2610705 ) ) ( not ( = ?auto_2610698 ?auto_2610706 ) ) ( not ( = ?auto_2610698 ?auto_2610707 ) ) ( not ( = ?auto_2610698 ?auto_2610709 ) ) ( not ( = ?auto_2610697 ?auto_2610699 ) ) ( not ( = ?auto_2610697 ?auto_2610700 ) ) ( not ( = ?auto_2610697 ?auto_2610701 ) ) ( not ( = ?auto_2610697 ?auto_2610702 ) ) ( not ( = ?auto_2610697 ?auto_2610703 ) ) ( not ( = ?auto_2610697 ?auto_2610704 ) ) ( not ( = ?auto_2610697 ?auto_2610705 ) ) ( not ( = ?auto_2610697 ?auto_2610706 ) ) ( not ( = ?auto_2610697 ?auto_2610707 ) ) ( not ( = ?auto_2610697 ?auto_2610709 ) ) ( not ( = ?auto_2610699 ?auto_2610700 ) ) ( not ( = ?auto_2610699 ?auto_2610701 ) ) ( not ( = ?auto_2610699 ?auto_2610702 ) ) ( not ( = ?auto_2610699 ?auto_2610703 ) ) ( not ( = ?auto_2610699 ?auto_2610704 ) ) ( not ( = ?auto_2610699 ?auto_2610705 ) ) ( not ( = ?auto_2610699 ?auto_2610706 ) ) ( not ( = ?auto_2610699 ?auto_2610707 ) ) ( not ( = ?auto_2610699 ?auto_2610709 ) ) ( not ( = ?auto_2610700 ?auto_2610701 ) ) ( not ( = ?auto_2610700 ?auto_2610702 ) ) ( not ( = ?auto_2610700 ?auto_2610703 ) ) ( not ( = ?auto_2610700 ?auto_2610704 ) ) ( not ( = ?auto_2610700 ?auto_2610705 ) ) ( not ( = ?auto_2610700 ?auto_2610706 ) ) ( not ( = ?auto_2610700 ?auto_2610707 ) ) ( not ( = ?auto_2610700 ?auto_2610709 ) ) ( not ( = ?auto_2610701 ?auto_2610702 ) ) ( not ( = ?auto_2610701 ?auto_2610703 ) ) ( not ( = ?auto_2610701 ?auto_2610704 ) ) ( not ( = ?auto_2610701 ?auto_2610705 ) ) ( not ( = ?auto_2610701 ?auto_2610706 ) ) ( not ( = ?auto_2610701 ?auto_2610707 ) ) ( not ( = ?auto_2610701 ?auto_2610709 ) ) ( not ( = ?auto_2610702 ?auto_2610703 ) ) ( not ( = ?auto_2610702 ?auto_2610704 ) ) ( not ( = ?auto_2610702 ?auto_2610705 ) ) ( not ( = ?auto_2610702 ?auto_2610706 ) ) ( not ( = ?auto_2610702 ?auto_2610707 ) ) ( not ( = ?auto_2610702 ?auto_2610709 ) ) ( not ( = ?auto_2610703 ?auto_2610704 ) ) ( not ( = ?auto_2610703 ?auto_2610705 ) ) ( not ( = ?auto_2610703 ?auto_2610706 ) ) ( not ( = ?auto_2610703 ?auto_2610707 ) ) ( not ( = ?auto_2610703 ?auto_2610709 ) ) ( not ( = ?auto_2610704 ?auto_2610705 ) ) ( not ( = ?auto_2610704 ?auto_2610706 ) ) ( not ( = ?auto_2610704 ?auto_2610707 ) ) ( not ( = ?auto_2610704 ?auto_2610709 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2610705 ?auto_2610706 ?auto_2610707 )
      ( MAKE-15CRATE-VERIFY ?auto_2610693 ?auto_2610694 ?auto_2610695 ?auto_2610692 ?auto_2610696 ?auto_2610698 ?auto_2610697 ?auto_2610699 ?auto_2610700 ?auto_2610701 ?auto_2610702 ?auto_2610703 ?auto_2610704 ?auto_2610705 ?auto_2610706 ?auto_2610707 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2610919 - SURFACE
      ?auto_2610920 - SURFACE
      ?auto_2610921 - SURFACE
      ?auto_2610918 - SURFACE
      ?auto_2610922 - SURFACE
      ?auto_2610924 - SURFACE
      ?auto_2610923 - SURFACE
      ?auto_2610925 - SURFACE
      ?auto_2610926 - SURFACE
      ?auto_2610927 - SURFACE
      ?auto_2610928 - SURFACE
      ?auto_2610929 - SURFACE
      ?auto_2610930 - SURFACE
      ?auto_2610931 - SURFACE
      ?auto_2610932 - SURFACE
      ?auto_2610933 - SURFACE
    )
    :vars
    (
      ?auto_2610937 - HOIST
      ?auto_2610934 - PLACE
      ?auto_2610935 - PLACE
      ?auto_2610936 - HOIST
      ?auto_2610938 - SURFACE
      ?auto_2610939 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2610937 ?auto_2610934 ) ( SURFACE-AT ?auto_2610932 ?auto_2610934 ) ( CLEAR ?auto_2610932 ) ( IS-CRATE ?auto_2610933 ) ( not ( = ?auto_2610932 ?auto_2610933 ) ) ( AVAILABLE ?auto_2610937 ) ( ON ?auto_2610932 ?auto_2610931 ) ( not ( = ?auto_2610931 ?auto_2610932 ) ) ( not ( = ?auto_2610931 ?auto_2610933 ) ) ( not ( = ?auto_2610935 ?auto_2610934 ) ) ( HOIST-AT ?auto_2610936 ?auto_2610935 ) ( not ( = ?auto_2610937 ?auto_2610936 ) ) ( AVAILABLE ?auto_2610936 ) ( SURFACE-AT ?auto_2610933 ?auto_2610935 ) ( ON ?auto_2610933 ?auto_2610938 ) ( CLEAR ?auto_2610933 ) ( not ( = ?auto_2610932 ?auto_2610938 ) ) ( not ( = ?auto_2610933 ?auto_2610938 ) ) ( not ( = ?auto_2610931 ?auto_2610938 ) ) ( TRUCK-AT ?auto_2610939 ?auto_2610934 ) ( ON ?auto_2610920 ?auto_2610919 ) ( ON ?auto_2610921 ?auto_2610920 ) ( ON ?auto_2610918 ?auto_2610921 ) ( ON ?auto_2610922 ?auto_2610918 ) ( ON ?auto_2610924 ?auto_2610922 ) ( ON ?auto_2610923 ?auto_2610924 ) ( ON ?auto_2610925 ?auto_2610923 ) ( ON ?auto_2610926 ?auto_2610925 ) ( ON ?auto_2610927 ?auto_2610926 ) ( ON ?auto_2610928 ?auto_2610927 ) ( ON ?auto_2610929 ?auto_2610928 ) ( ON ?auto_2610930 ?auto_2610929 ) ( ON ?auto_2610931 ?auto_2610930 ) ( not ( = ?auto_2610919 ?auto_2610920 ) ) ( not ( = ?auto_2610919 ?auto_2610921 ) ) ( not ( = ?auto_2610919 ?auto_2610918 ) ) ( not ( = ?auto_2610919 ?auto_2610922 ) ) ( not ( = ?auto_2610919 ?auto_2610924 ) ) ( not ( = ?auto_2610919 ?auto_2610923 ) ) ( not ( = ?auto_2610919 ?auto_2610925 ) ) ( not ( = ?auto_2610919 ?auto_2610926 ) ) ( not ( = ?auto_2610919 ?auto_2610927 ) ) ( not ( = ?auto_2610919 ?auto_2610928 ) ) ( not ( = ?auto_2610919 ?auto_2610929 ) ) ( not ( = ?auto_2610919 ?auto_2610930 ) ) ( not ( = ?auto_2610919 ?auto_2610931 ) ) ( not ( = ?auto_2610919 ?auto_2610932 ) ) ( not ( = ?auto_2610919 ?auto_2610933 ) ) ( not ( = ?auto_2610919 ?auto_2610938 ) ) ( not ( = ?auto_2610920 ?auto_2610921 ) ) ( not ( = ?auto_2610920 ?auto_2610918 ) ) ( not ( = ?auto_2610920 ?auto_2610922 ) ) ( not ( = ?auto_2610920 ?auto_2610924 ) ) ( not ( = ?auto_2610920 ?auto_2610923 ) ) ( not ( = ?auto_2610920 ?auto_2610925 ) ) ( not ( = ?auto_2610920 ?auto_2610926 ) ) ( not ( = ?auto_2610920 ?auto_2610927 ) ) ( not ( = ?auto_2610920 ?auto_2610928 ) ) ( not ( = ?auto_2610920 ?auto_2610929 ) ) ( not ( = ?auto_2610920 ?auto_2610930 ) ) ( not ( = ?auto_2610920 ?auto_2610931 ) ) ( not ( = ?auto_2610920 ?auto_2610932 ) ) ( not ( = ?auto_2610920 ?auto_2610933 ) ) ( not ( = ?auto_2610920 ?auto_2610938 ) ) ( not ( = ?auto_2610921 ?auto_2610918 ) ) ( not ( = ?auto_2610921 ?auto_2610922 ) ) ( not ( = ?auto_2610921 ?auto_2610924 ) ) ( not ( = ?auto_2610921 ?auto_2610923 ) ) ( not ( = ?auto_2610921 ?auto_2610925 ) ) ( not ( = ?auto_2610921 ?auto_2610926 ) ) ( not ( = ?auto_2610921 ?auto_2610927 ) ) ( not ( = ?auto_2610921 ?auto_2610928 ) ) ( not ( = ?auto_2610921 ?auto_2610929 ) ) ( not ( = ?auto_2610921 ?auto_2610930 ) ) ( not ( = ?auto_2610921 ?auto_2610931 ) ) ( not ( = ?auto_2610921 ?auto_2610932 ) ) ( not ( = ?auto_2610921 ?auto_2610933 ) ) ( not ( = ?auto_2610921 ?auto_2610938 ) ) ( not ( = ?auto_2610918 ?auto_2610922 ) ) ( not ( = ?auto_2610918 ?auto_2610924 ) ) ( not ( = ?auto_2610918 ?auto_2610923 ) ) ( not ( = ?auto_2610918 ?auto_2610925 ) ) ( not ( = ?auto_2610918 ?auto_2610926 ) ) ( not ( = ?auto_2610918 ?auto_2610927 ) ) ( not ( = ?auto_2610918 ?auto_2610928 ) ) ( not ( = ?auto_2610918 ?auto_2610929 ) ) ( not ( = ?auto_2610918 ?auto_2610930 ) ) ( not ( = ?auto_2610918 ?auto_2610931 ) ) ( not ( = ?auto_2610918 ?auto_2610932 ) ) ( not ( = ?auto_2610918 ?auto_2610933 ) ) ( not ( = ?auto_2610918 ?auto_2610938 ) ) ( not ( = ?auto_2610922 ?auto_2610924 ) ) ( not ( = ?auto_2610922 ?auto_2610923 ) ) ( not ( = ?auto_2610922 ?auto_2610925 ) ) ( not ( = ?auto_2610922 ?auto_2610926 ) ) ( not ( = ?auto_2610922 ?auto_2610927 ) ) ( not ( = ?auto_2610922 ?auto_2610928 ) ) ( not ( = ?auto_2610922 ?auto_2610929 ) ) ( not ( = ?auto_2610922 ?auto_2610930 ) ) ( not ( = ?auto_2610922 ?auto_2610931 ) ) ( not ( = ?auto_2610922 ?auto_2610932 ) ) ( not ( = ?auto_2610922 ?auto_2610933 ) ) ( not ( = ?auto_2610922 ?auto_2610938 ) ) ( not ( = ?auto_2610924 ?auto_2610923 ) ) ( not ( = ?auto_2610924 ?auto_2610925 ) ) ( not ( = ?auto_2610924 ?auto_2610926 ) ) ( not ( = ?auto_2610924 ?auto_2610927 ) ) ( not ( = ?auto_2610924 ?auto_2610928 ) ) ( not ( = ?auto_2610924 ?auto_2610929 ) ) ( not ( = ?auto_2610924 ?auto_2610930 ) ) ( not ( = ?auto_2610924 ?auto_2610931 ) ) ( not ( = ?auto_2610924 ?auto_2610932 ) ) ( not ( = ?auto_2610924 ?auto_2610933 ) ) ( not ( = ?auto_2610924 ?auto_2610938 ) ) ( not ( = ?auto_2610923 ?auto_2610925 ) ) ( not ( = ?auto_2610923 ?auto_2610926 ) ) ( not ( = ?auto_2610923 ?auto_2610927 ) ) ( not ( = ?auto_2610923 ?auto_2610928 ) ) ( not ( = ?auto_2610923 ?auto_2610929 ) ) ( not ( = ?auto_2610923 ?auto_2610930 ) ) ( not ( = ?auto_2610923 ?auto_2610931 ) ) ( not ( = ?auto_2610923 ?auto_2610932 ) ) ( not ( = ?auto_2610923 ?auto_2610933 ) ) ( not ( = ?auto_2610923 ?auto_2610938 ) ) ( not ( = ?auto_2610925 ?auto_2610926 ) ) ( not ( = ?auto_2610925 ?auto_2610927 ) ) ( not ( = ?auto_2610925 ?auto_2610928 ) ) ( not ( = ?auto_2610925 ?auto_2610929 ) ) ( not ( = ?auto_2610925 ?auto_2610930 ) ) ( not ( = ?auto_2610925 ?auto_2610931 ) ) ( not ( = ?auto_2610925 ?auto_2610932 ) ) ( not ( = ?auto_2610925 ?auto_2610933 ) ) ( not ( = ?auto_2610925 ?auto_2610938 ) ) ( not ( = ?auto_2610926 ?auto_2610927 ) ) ( not ( = ?auto_2610926 ?auto_2610928 ) ) ( not ( = ?auto_2610926 ?auto_2610929 ) ) ( not ( = ?auto_2610926 ?auto_2610930 ) ) ( not ( = ?auto_2610926 ?auto_2610931 ) ) ( not ( = ?auto_2610926 ?auto_2610932 ) ) ( not ( = ?auto_2610926 ?auto_2610933 ) ) ( not ( = ?auto_2610926 ?auto_2610938 ) ) ( not ( = ?auto_2610927 ?auto_2610928 ) ) ( not ( = ?auto_2610927 ?auto_2610929 ) ) ( not ( = ?auto_2610927 ?auto_2610930 ) ) ( not ( = ?auto_2610927 ?auto_2610931 ) ) ( not ( = ?auto_2610927 ?auto_2610932 ) ) ( not ( = ?auto_2610927 ?auto_2610933 ) ) ( not ( = ?auto_2610927 ?auto_2610938 ) ) ( not ( = ?auto_2610928 ?auto_2610929 ) ) ( not ( = ?auto_2610928 ?auto_2610930 ) ) ( not ( = ?auto_2610928 ?auto_2610931 ) ) ( not ( = ?auto_2610928 ?auto_2610932 ) ) ( not ( = ?auto_2610928 ?auto_2610933 ) ) ( not ( = ?auto_2610928 ?auto_2610938 ) ) ( not ( = ?auto_2610929 ?auto_2610930 ) ) ( not ( = ?auto_2610929 ?auto_2610931 ) ) ( not ( = ?auto_2610929 ?auto_2610932 ) ) ( not ( = ?auto_2610929 ?auto_2610933 ) ) ( not ( = ?auto_2610929 ?auto_2610938 ) ) ( not ( = ?auto_2610930 ?auto_2610931 ) ) ( not ( = ?auto_2610930 ?auto_2610932 ) ) ( not ( = ?auto_2610930 ?auto_2610933 ) ) ( not ( = ?auto_2610930 ?auto_2610938 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2610931 ?auto_2610932 ?auto_2610933 )
      ( MAKE-15CRATE-VERIFY ?auto_2610919 ?auto_2610920 ?auto_2610921 ?auto_2610918 ?auto_2610922 ?auto_2610924 ?auto_2610923 ?auto_2610925 ?auto_2610926 ?auto_2610927 ?auto_2610928 ?auto_2610929 ?auto_2610930 ?auto_2610931 ?auto_2610932 ?auto_2610933 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2611145 - SURFACE
      ?auto_2611146 - SURFACE
      ?auto_2611147 - SURFACE
      ?auto_2611144 - SURFACE
      ?auto_2611148 - SURFACE
      ?auto_2611150 - SURFACE
      ?auto_2611149 - SURFACE
      ?auto_2611151 - SURFACE
      ?auto_2611152 - SURFACE
      ?auto_2611153 - SURFACE
      ?auto_2611154 - SURFACE
      ?auto_2611155 - SURFACE
      ?auto_2611156 - SURFACE
      ?auto_2611157 - SURFACE
      ?auto_2611158 - SURFACE
      ?auto_2611159 - SURFACE
    )
    :vars
    (
      ?auto_2611162 - HOIST
      ?auto_2611165 - PLACE
      ?auto_2611164 - PLACE
      ?auto_2611160 - HOIST
      ?auto_2611163 - SURFACE
      ?auto_2611161 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2611162 ?auto_2611165 ) ( IS-CRATE ?auto_2611159 ) ( not ( = ?auto_2611158 ?auto_2611159 ) ) ( not ( = ?auto_2611157 ?auto_2611158 ) ) ( not ( = ?auto_2611157 ?auto_2611159 ) ) ( not ( = ?auto_2611164 ?auto_2611165 ) ) ( HOIST-AT ?auto_2611160 ?auto_2611164 ) ( not ( = ?auto_2611162 ?auto_2611160 ) ) ( AVAILABLE ?auto_2611160 ) ( SURFACE-AT ?auto_2611159 ?auto_2611164 ) ( ON ?auto_2611159 ?auto_2611163 ) ( CLEAR ?auto_2611159 ) ( not ( = ?auto_2611158 ?auto_2611163 ) ) ( not ( = ?auto_2611159 ?auto_2611163 ) ) ( not ( = ?auto_2611157 ?auto_2611163 ) ) ( TRUCK-AT ?auto_2611161 ?auto_2611165 ) ( SURFACE-AT ?auto_2611157 ?auto_2611165 ) ( CLEAR ?auto_2611157 ) ( LIFTING ?auto_2611162 ?auto_2611158 ) ( IS-CRATE ?auto_2611158 ) ( ON ?auto_2611146 ?auto_2611145 ) ( ON ?auto_2611147 ?auto_2611146 ) ( ON ?auto_2611144 ?auto_2611147 ) ( ON ?auto_2611148 ?auto_2611144 ) ( ON ?auto_2611150 ?auto_2611148 ) ( ON ?auto_2611149 ?auto_2611150 ) ( ON ?auto_2611151 ?auto_2611149 ) ( ON ?auto_2611152 ?auto_2611151 ) ( ON ?auto_2611153 ?auto_2611152 ) ( ON ?auto_2611154 ?auto_2611153 ) ( ON ?auto_2611155 ?auto_2611154 ) ( ON ?auto_2611156 ?auto_2611155 ) ( ON ?auto_2611157 ?auto_2611156 ) ( not ( = ?auto_2611145 ?auto_2611146 ) ) ( not ( = ?auto_2611145 ?auto_2611147 ) ) ( not ( = ?auto_2611145 ?auto_2611144 ) ) ( not ( = ?auto_2611145 ?auto_2611148 ) ) ( not ( = ?auto_2611145 ?auto_2611150 ) ) ( not ( = ?auto_2611145 ?auto_2611149 ) ) ( not ( = ?auto_2611145 ?auto_2611151 ) ) ( not ( = ?auto_2611145 ?auto_2611152 ) ) ( not ( = ?auto_2611145 ?auto_2611153 ) ) ( not ( = ?auto_2611145 ?auto_2611154 ) ) ( not ( = ?auto_2611145 ?auto_2611155 ) ) ( not ( = ?auto_2611145 ?auto_2611156 ) ) ( not ( = ?auto_2611145 ?auto_2611157 ) ) ( not ( = ?auto_2611145 ?auto_2611158 ) ) ( not ( = ?auto_2611145 ?auto_2611159 ) ) ( not ( = ?auto_2611145 ?auto_2611163 ) ) ( not ( = ?auto_2611146 ?auto_2611147 ) ) ( not ( = ?auto_2611146 ?auto_2611144 ) ) ( not ( = ?auto_2611146 ?auto_2611148 ) ) ( not ( = ?auto_2611146 ?auto_2611150 ) ) ( not ( = ?auto_2611146 ?auto_2611149 ) ) ( not ( = ?auto_2611146 ?auto_2611151 ) ) ( not ( = ?auto_2611146 ?auto_2611152 ) ) ( not ( = ?auto_2611146 ?auto_2611153 ) ) ( not ( = ?auto_2611146 ?auto_2611154 ) ) ( not ( = ?auto_2611146 ?auto_2611155 ) ) ( not ( = ?auto_2611146 ?auto_2611156 ) ) ( not ( = ?auto_2611146 ?auto_2611157 ) ) ( not ( = ?auto_2611146 ?auto_2611158 ) ) ( not ( = ?auto_2611146 ?auto_2611159 ) ) ( not ( = ?auto_2611146 ?auto_2611163 ) ) ( not ( = ?auto_2611147 ?auto_2611144 ) ) ( not ( = ?auto_2611147 ?auto_2611148 ) ) ( not ( = ?auto_2611147 ?auto_2611150 ) ) ( not ( = ?auto_2611147 ?auto_2611149 ) ) ( not ( = ?auto_2611147 ?auto_2611151 ) ) ( not ( = ?auto_2611147 ?auto_2611152 ) ) ( not ( = ?auto_2611147 ?auto_2611153 ) ) ( not ( = ?auto_2611147 ?auto_2611154 ) ) ( not ( = ?auto_2611147 ?auto_2611155 ) ) ( not ( = ?auto_2611147 ?auto_2611156 ) ) ( not ( = ?auto_2611147 ?auto_2611157 ) ) ( not ( = ?auto_2611147 ?auto_2611158 ) ) ( not ( = ?auto_2611147 ?auto_2611159 ) ) ( not ( = ?auto_2611147 ?auto_2611163 ) ) ( not ( = ?auto_2611144 ?auto_2611148 ) ) ( not ( = ?auto_2611144 ?auto_2611150 ) ) ( not ( = ?auto_2611144 ?auto_2611149 ) ) ( not ( = ?auto_2611144 ?auto_2611151 ) ) ( not ( = ?auto_2611144 ?auto_2611152 ) ) ( not ( = ?auto_2611144 ?auto_2611153 ) ) ( not ( = ?auto_2611144 ?auto_2611154 ) ) ( not ( = ?auto_2611144 ?auto_2611155 ) ) ( not ( = ?auto_2611144 ?auto_2611156 ) ) ( not ( = ?auto_2611144 ?auto_2611157 ) ) ( not ( = ?auto_2611144 ?auto_2611158 ) ) ( not ( = ?auto_2611144 ?auto_2611159 ) ) ( not ( = ?auto_2611144 ?auto_2611163 ) ) ( not ( = ?auto_2611148 ?auto_2611150 ) ) ( not ( = ?auto_2611148 ?auto_2611149 ) ) ( not ( = ?auto_2611148 ?auto_2611151 ) ) ( not ( = ?auto_2611148 ?auto_2611152 ) ) ( not ( = ?auto_2611148 ?auto_2611153 ) ) ( not ( = ?auto_2611148 ?auto_2611154 ) ) ( not ( = ?auto_2611148 ?auto_2611155 ) ) ( not ( = ?auto_2611148 ?auto_2611156 ) ) ( not ( = ?auto_2611148 ?auto_2611157 ) ) ( not ( = ?auto_2611148 ?auto_2611158 ) ) ( not ( = ?auto_2611148 ?auto_2611159 ) ) ( not ( = ?auto_2611148 ?auto_2611163 ) ) ( not ( = ?auto_2611150 ?auto_2611149 ) ) ( not ( = ?auto_2611150 ?auto_2611151 ) ) ( not ( = ?auto_2611150 ?auto_2611152 ) ) ( not ( = ?auto_2611150 ?auto_2611153 ) ) ( not ( = ?auto_2611150 ?auto_2611154 ) ) ( not ( = ?auto_2611150 ?auto_2611155 ) ) ( not ( = ?auto_2611150 ?auto_2611156 ) ) ( not ( = ?auto_2611150 ?auto_2611157 ) ) ( not ( = ?auto_2611150 ?auto_2611158 ) ) ( not ( = ?auto_2611150 ?auto_2611159 ) ) ( not ( = ?auto_2611150 ?auto_2611163 ) ) ( not ( = ?auto_2611149 ?auto_2611151 ) ) ( not ( = ?auto_2611149 ?auto_2611152 ) ) ( not ( = ?auto_2611149 ?auto_2611153 ) ) ( not ( = ?auto_2611149 ?auto_2611154 ) ) ( not ( = ?auto_2611149 ?auto_2611155 ) ) ( not ( = ?auto_2611149 ?auto_2611156 ) ) ( not ( = ?auto_2611149 ?auto_2611157 ) ) ( not ( = ?auto_2611149 ?auto_2611158 ) ) ( not ( = ?auto_2611149 ?auto_2611159 ) ) ( not ( = ?auto_2611149 ?auto_2611163 ) ) ( not ( = ?auto_2611151 ?auto_2611152 ) ) ( not ( = ?auto_2611151 ?auto_2611153 ) ) ( not ( = ?auto_2611151 ?auto_2611154 ) ) ( not ( = ?auto_2611151 ?auto_2611155 ) ) ( not ( = ?auto_2611151 ?auto_2611156 ) ) ( not ( = ?auto_2611151 ?auto_2611157 ) ) ( not ( = ?auto_2611151 ?auto_2611158 ) ) ( not ( = ?auto_2611151 ?auto_2611159 ) ) ( not ( = ?auto_2611151 ?auto_2611163 ) ) ( not ( = ?auto_2611152 ?auto_2611153 ) ) ( not ( = ?auto_2611152 ?auto_2611154 ) ) ( not ( = ?auto_2611152 ?auto_2611155 ) ) ( not ( = ?auto_2611152 ?auto_2611156 ) ) ( not ( = ?auto_2611152 ?auto_2611157 ) ) ( not ( = ?auto_2611152 ?auto_2611158 ) ) ( not ( = ?auto_2611152 ?auto_2611159 ) ) ( not ( = ?auto_2611152 ?auto_2611163 ) ) ( not ( = ?auto_2611153 ?auto_2611154 ) ) ( not ( = ?auto_2611153 ?auto_2611155 ) ) ( not ( = ?auto_2611153 ?auto_2611156 ) ) ( not ( = ?auto_2611153 ?auto_2611157 ) ) ( not ( = ?auto_2611153 ?auto_2611158 ) ) ( not ( = ?auto_2611153 ?auto_2611159 ) ) ( not ( = ?auto_2611153 ?auto_2611163 ) ) ( not ( = ?auto_2611154 ?auto_2611155 ) ) ( not ( = ?auto_2611154 ?auto_2611156 ) ) ( not ( = ?auto_2611154 ?auto_2611157 ) ) ( not ( = ?auto_2611154 ?auto_2611158 ) ) ( not ( = ?auto_2611154 ?auto_2611159 ) ) ( not ( = ?auto_2611154 ?auto_2611163 ) ) ( not ( = ?auto_2611155 ?auto_2611156 ) ) ( not ( = ?auto_2611155 ?auto_2611157 ) ) ( not ( = ?auto_2611155 ?auto_2611158 ) ) ( not ( = ?auto_2611155 ?auto_2611159 ) ) ( not ( = ?auto_2611155 ?auto_2611163 ) ) ( not ( = ?auto_2611156 ?auto_2611157 ) ) ( not ( = ?auto_2611156 ?auto_2611158 ) ) ( not ( = ?auto_2611156 ?auto_2611159 ) ) ( not ( = ?auto_2611156 ?auto_2611163 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2611157 ?auto_2611158 ?auto_2611159 )
      ( MAKE-15CRATE-VERIFY ?auto_2611145 ?auto_2611146 ?auto_2611147 ?auto_2611144 ?auto_2611148 ?auto_2611150 ?auto_2611149 ?auto_2611151 ?auto_2611152 ?auto_2611153 ?auto_2611154 ?auto_2611155 ?auto_2611156 ?auto_2611157 ?auto_2611158 ?auto_2611159 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2611371 - SURFACE
      ?auto_2611372 - SURFACE
      ?auto_2611373 - SURFACE
      ?auto_2611370 - SURFACE
      ?auto_2611374 - SURFACE
      ?auto_2611376 - SURFACE
      ?auto_2611375 - SURFACE
      ?auto_2611377 - SURFACE
      ?auto_2611378 - SURFACE
      ?auto_2611379 - SURFACE
      ?auto_2611380 - SURFACE
      ?auto_2611381 - SURFACE
      ?auto_2611382 - SURFACE
      ?auto_2611383 - SURFACE
      ?auto_2611384 - SURFACE
      ?auto_2611385 - SURFACE
    )
    :vars
    (
      ?auto_2611387 - HOIST
      ?auto_2611390 - PLACE
      ?auto_2611391 - PLACE
      ?auto_2611386 - HOIST
      ?auto_2611388 - SURFACE
      ?auto_2611389 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2611387 ?auto_2611390 ) ( IS-CRATE ?auto_2611385 ) ( not ( = ?auto_2611384 ?auto_2611385 ) ) ( not ( = ?auto_2611383 ?auto_2611384 ) ) ( not ( = ?auto_2611383 ?auto_2611385 ) ) ( not ( = ?auto_2611391 ?auto_2611390 ) ) ( HOIST-AT ?auto_2611386 ?auto_2611391 ) ( not ( = ?auto_2611387 ?auto_2611386 ) ) ( AVAILABLE ?auto_2611386 ) ( SURFACE-AT ?auto_2611385 ?auto_2611391 ) ( ON ?auto_2611385 ?auto_2611388 ) ( CLEAR ?auto_2611385 ) ( not ( = ?auto_2611384 ?auto_2611388 ) ) ( not ( = ?auto_2611385 ?auto_2611388 ) ) ( not ( = ?auto_2611383 ?auto_2611388 ) ) ( TRUCK-AT ?auto_2611389 ?auto_2611390 ) ( SURFACE-AT ?auto_2611383 ?auto_2611390 ) ( CLEAR ?auto_2611383 ) ( IS-CRATE ?auto_2611384 ) ( AVAILABLE ?auto_2611387 ) ( IN ?auto_2611384 ?auto_2611389 ) ( ON ?auto_2611372 ?auto_2611371 ) ( ON ?auto_2611373 ?auto_2611372 ) ( ON ?auto_2611370 ?auto_2611373 ) ( ON ?auto_2611374 ?auto_2611370 ) ( ON ?auto_2611376 ?auto_2611374 ) ( ON ?auto_2611375 ?auto_2611376 ) ( ON ?auto_2611377 ?auto_2611375 ) ( ON ?auto_2611378 ?auto_2611377 ) ( ON ?auto_2611379 ?auto_2611378 ) ( ON ?auto_2611380 ?auto_2611379 ) ( ON ?auto_2611381 ?auto_2611380 ) ( ON ?auto_2611382 ?auto_2611381 ) ( ON ?auto_2611383 ?auto_2611382 ) ( not ( = ?auto_2611371 ?auto_2611372 ) ) ( not ( = ?auto_2611371 ?auto_2611373 ) ) ( not ( = ?auto_2611371 ?auto_2611370 ) ) ( not ( = ?auto_2611371 ?auto_2611374 ) ) ( not ( = ?auto_2611371 ?auto_2611376 ) ) ( not ( = ?auto_2611371 ?auto_2611375 ) ) ( not ( = ?auto_2611371 ?auto_2611377 ) ) ( not ( = ?auto_2611371 ?auto_2611378 ) ) ( not ( = ?auto_2611371 ?auto_2611379 ) ) ( not ( = ?auto_2611371 ?auto_2611380 ) ) ( not ( = ?auto_2611371 ?auto_2611381 ) ) ( not ( = ?auto_2611371 ?auto_2611382 ) ) ( not ( = ?auto_2611371 ?auto_2611383 ) ) ( not ( = ?auto_2611371 ?auto_2611384 ) ) ( not ( = ?auto_2611371 ?auto_2611385 ) ) ( not ( = ?auto_2611371 ?auto_2611388 ) ) ( not ( = ?auto_2611372 ?auto_2611373 ) ) ( not ( = ?auto_2611372 ?auto_2611370 ) ) ( not ( = ?auto_2611372 ?auto_2611374 ) ) ( not ( = ?auto_2611372 ?auto_2611376 ) ) ( not ( = ?auto_2611372 ?auto_2611375 ) ) ( not ( = ?auto_2611372 ?auto_2611377 ) ) ( not ( = ?auto_2611372 ?auto_2611378 ) ) ( not ( = ?auto_2611372 ?auto_2611379 ) ) ( not ( = ?auto_2611372 ?auto_2611380 ) ) ( not ( = ?auto_2611372 ?auto_2611381 ) ) ( not ( = ?auto_2611372 ?auto_2611382 ) ) ( not ( = ?auto_2611372 ?auto_2611383 ) ) ( not ( = ?auto_2611372 ?auto_2611384 ) ) ( not ( = ?auto_2611372 ?auto_2611385 ) ) ( not ( = ?auto_2611372 ?auto_2611388 ) ) ( not ( = ?auto_2611373 ?auto_2611370 ) ) ( not ( = ?auto_2611373 ?auto_2611374 ) ) ( not ( = ?auto_2611373 ?auto_2611376 ) ) ( not ( = ?auto_2611373 ?auto_2611375 ) ) ( not ( = ?auto_2611373 ?auto_2611377 ) ) ( not ( = ?auto_2611373 ?auto_2611378 ) ) ( not ( = ?auto_2611373 ?auto_2611379 ) ) ( not ( = ?auto_2611373 ?auto_2611380 ) ) ( not ( = ?auto_2611373 ?auto_2611381 ) ) ( not ( = ?auto_2611373 ?auto_2611382 ) ) ( not ( = ?auto_2611373 ?auto_2611383 ) ) ( not ( = ?auto_2611373 ?auto_2611384 ) ) ( not ( = ?auto_2611373 ?auto_2611385 ) ) ( not ( = ?auto_2611373 ?auto_2611388 ) ) ( not ( = ?auto_2611370 ?auto_2611374 ) ) ( not ( = ?auto_2611370 ?auto_2611376 ) ) ( not ( = ?auto_2611370 ?auto_2611375 ) ) ( not ( = ?auto_2611370 ?auto_2611377 ) ) ( not ( = ?auto_2611370 ?auto_2611378 ) ) ( not ( = ?auto_2611370 ?auto_2611379 ) ) ( not ( = ?auto_2611370 ?auto_2611380 ) ) ( not ( = ?auto_2611370 ?auto_2611381 ) ) ( not ( = ?auto_2611370 ?auto_2611382 ) ) ( not ( = ?auto_2611370 ?auto_2611383 ) ) ( not ( = ?auto_2611370 ?auto_2611384 ) ) ( not ( = ?auto_2611370 ?auto_2611385 ) ) ( not ( = ?auto_2611370 ?auto_2611388 ) ) ( not ( = ?auto_2611374 ?auto_2611376 ) ) ( not ( = ?auto_2611374 ?auto_2611375 ) ) ( not ( = ?auto_2611374 ?auto_2611377 ) ) ( not ( = ?auto_2611374 ?auto_2611378 ) ) ( not ( = ?auto_2611374 ?auto_2611379 ) ) ( not ( = ?auto_2611374 ?auto_2611380 ) ) ( not ( = ?auto_2611374 ?auto_2611381 ) ) ( not ( = ?auto_2611374 ?auto_2611382 ) ) ( not ( = ?auto_2611374 ?auto_2611383 ) ) ( not ( = ?auto_2611374 ?auto_2611384 ) ) ( not ( = ?auto_2611374 ?auto_2611385 ) ) ( not ( = ?auto_2611374 ?auto_2611388 ) ) ( not ( = ?auto_2611376 ?auto_2611375 ) ) ( not ( = ?auto_2611376 ?auto_2611377 ) ) ( not ( = ?auto_2611376 ?auto_2611378 ) ) ( not ( = ?auto_2611376 ?auto_2611379 ) ) ( not ( = ?auto_2611376 ?auto_2611380 ) ) ( not ( = ?auto_2611376 ?auto_2611381 ) ) ( not ( = ?auto_2611376 ?auto_2611382 ) ) ( not ( = ?auto_2611376 ?auto_2611383 ) ) ( not ( = ?auto_2611376 ?auto_2611384 ) ) ( not ( = ?auto_2611376 ?auto_2611385 ) ) ( not ( = ?auto_2611376 ?auto_2611388 ) ) ( not ( = ?auto_2611375 ?auto_2611377 ) ) ( not ( = ?auto_2611375 ?auto_2611378 ) ) ( not ( = ?auto_2611375 ?auto_2611379 ) ) ( not ( = ?auto_2611375 ?auto_2611380 ) ) ( not ( = ?auto_2611375 ?auto_2611381 ) ) ( not ( = ?auto_2611375 ?auto_2611382 ) ) ( not ( = ?auto_2611375 ?auto_2611383 ) ) ( not ( = ?auto_2611375 ?auto_2611384 ) ) ( not ( = ?auto_2611375 ?auto_2611385 ) ) ( not ( = ?auto_2611375 ?auto_2611388 ) ) ( not ( = ?auto_2611377 ?auto_2611378 ) ) ( not ( = ?auto_2611377 ?auto_2611379 ) ) ( not ( = ?auto_2611377 ?auto_2611380 ) ) ( not ( = ?auto_2611377 ?auto_2611381 ) ) ( not ( = ?auto_2611377 ?auto_2611382 ) ) ( not ( = ?auto_2611377 ?auto_2611383 ) ) ( not ( = ?auto_2611377 ?auto_2611384 ) ) ( not ( = ?auto_2611377 ?auto_2611385 ) ) ( not ( = ?auto_2611377 ?auto_2611388 ) ) ( not ( = ?auto_2611378 ?auto_2611379 ) ) ( not ( = ?auto_2611378 ?auto_2611380 ) ) ( not ( = ?auto_2611378 ?auto_2611381 ) ) ( not ( = ?auto_2611378 ?auto_2611382 ) ) ( not ( = ?auto_2611378 ?auto_2611383 ) ) ( not ( = ?auto_2611378 ?auto_2611384 ) ) ( not ( = ?auto_2611378 ?auto_2611385 ) ) ( not ( = ?auto_2611378 ?auto_2611388 ) ) ( not ( = ?auto_2611379 ?auto_2611380 ) ) ( not ( = ?auto_2611379 ?auto_2611381 ) ) ( not ( = ?auto_2611379 ?auto_2611382 ) ) ( not ( = ?auto_2611379 ?auto_2611383 ) ) ( not ( = ?auto_2611379 ?auto_2611384 ) ) ( not ( = ?auto_2611379 ?auto_2611385 ) ) ( not ( = ?auto_2611379 ?auto_2611388 ) ) ( not ( = ?auto_2611380 ?auto_2611381 ) ) ( not ( = ?auto_2611380 ?auto_2611382 ) ) ( not ( = ?auto_2611380 ?auto_2611383 ) ) ( not ( = ?auto_2611380 ?auto_2611384 ) ) ( not ( = ?auto_2611380 ?auto_2611385 ) ) ( not ( = ?auto_2611380 ?auto_2611388 ) ) ( not ( = ?auto_2611381 ?auto_2611382 ) ) ( not ( = ?auto_2611381 ?auto_2611383 ) ) ( not ( = ?auto_2611381 ?auto_2611384 ) ) ( not ( = ?auto_2611381 ?auto_2611385 ) ) ( not ( = ?auto_2611381 ?auto_2611388 ) ) ( not ( = ?auto_2611382 ?auto_2611383 ) ) ( not ( = ?auto_2611382 ?auto_2611384 ) ) ( not ( = ?auto_2611382 ?auto_2611385 ) ) ( not ( = ?auto_2611382 ?auto_2611388 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2611383 ?auto_2611384 ?auto_2611385 )
      ( MAKE-15CRATE-VERIFY ?auto_2611371 ?auto_2611372 ?auto_2611373 ?auto_2611370 ?auto_2611374 ?auto_2611376 ?auto_2611375 ?auto_2611377 ?auto_2611378 ?auto_2611379 ?auto_2611380 ?auto_2611381 ?auto_2611382 ?auto_2611383 ?auto_2611384 ?auto_2611385 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2631836 - SURFACE
      ?auto_2631837 - SURFACE
      ?auto_2631838 - SURFACE
      ?auto_2631835 - SURFACE
      ?auto_2631839 - SURFACE
      ?auto_2631841 - SURFACE
      ?auto_2631840 - SURFACE
      ?auto_2631842 - SURFACE
      ?auto_2631843 - SURFACE
      ?auto_2631844 - SURFACE
      ?auto_2631845 - SURFACE
      ?auto_2631846 - SURFACE
      ?auto_2631847 - SURFACE
      ?auto_2631848 - SURFACE
      ?auto_2631849 - SURFACE
      ?auto_2631850 - SURFACE
      ?auto_2631851 - SURFACE
    )
    :vars
    (
      ?auto_2631853 - HOIST
      ?auto_2631852 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2631853 ?auto_2631852 ) ( SURFACE-AT ?auto_2631850 ?auto_2631852 ) ( CLEAR ?auto_2631850 ) ( LIFTING ?auto_2631853 ?auto_2631851 ) ( IS-CRATE ?auto_2631851 ) ( not ( = ?auto_2631850 ?auto_2631851 ) ) ( ON ?auto_2631837 ?auto_2631836 ) ( ON ?auto_2631838 ?auto_2631837 ) ( ON ?auto_2631835 ?auto_2631838 ) ( ON ?auto_2631839 ?auto_2631835 ) ( ON ?auto_2631841 ?auto_2631839 ) ( ON ?auto_2631840 ?auto_2631841 ) ( ON ?auto_2631842 ?auto_2631840 ) ( ON ?auto_2631843 ?auto_2631842 ) ( ON ?auto_2631844 ?auto_2631843 ) ( ON ?auto_2631845 ?auto_2631844 ) ( ON ?auto_2631846 ?auto_2631845 ) ( ON ?auto_2631847 ?auto_2631846 ) ( ON ?auto_2631848 ?auto_2631847 ) ( ON ?auto_2631849 ?auto_2631848 ) ( ON ?auto_2631850 ?auto_2631849 ) ( not ( = ?auto_2631836 ?auto_2631837 ) ) ( not ( = ?auto_2631836 ?auto_2631838 ) ) ( not ( = ?auto_2631836 ?auto_2631835 ) ) ( not ( = ?auto_2631836 ?auto_2631839 ) ) ( not ( = ?auto_2631836 ?auto_2631841 ) ) ( not ( = ?auto_2631836 ?auto_2631840 ) ) ( not ( = ?auto_2631836 ?auto_2631842 ) ) ( not ( = ?auto_2631836 ?auto_2631843 ) ) ( not ( = ?auto_2631836 ?auto_2631844 ) ) ( not ( = ?auto_2631836 ?auto_2631845 ) ) ( not ( = ?auto_2631836 ?auto_2631846 ) ) ( not ( = ?auto_2631836 ?auto_2631847 ) ) ( not ( = ?auto_2631836 ?auto_2631848 ) ) ( not ( = ?auto_2631836 ?auto_2631849 ) ) ( not ( = ?auto_2631836 ?auto_2631850 ) ) ( not ( = ?auto_2631836 ?auto_2631851 ) ) ( not ( = ?auto_2631837 ?auto_2631838 ) ) ( not ( = ?auto_2631837 ?auto_2631835 ) ) ( not ( = ?auto_2631837 ?auto_2631839 ) ) ( not ( = ?auto_2631837 ?auto_2631841 ) ) ( not ( = ?auto_2631837 ?auto_2631840 ) ) ( not ( = ?auto_2631837 ?auto_2631842 ) ) ( not ( = ?auto_2631837 ?auto_2631843 ) ) ( not ( = ?auto_2631837 ?auto_2631844 ) ) ( not ( = ?auto_2631837 ?auto_2631845 ) ) ( not ( = ?auto_2631837 ?auto_2631846 ) ) ( not ( = ?auto_2631837 ?auto_2631847 ) ) ( not ( = ?auto_2631837 ?auto_2631848 ) ) ( not ( = ?auto_2631837 ?auto_2631849 ) ) ( not ( = ?auto_2631837 ?auto_2631850 ) ) ( not ( = ?auto_2631837 ?auto_2631851 ) ) ( not ( = ?auto_2631838 ?auto_2631835 ) ) ( not ( = ?auto_2631838 ?auto_2631839 ) ) ( not ( = ?auto_2631838 ?auto_2631841 ) ) ( not ( = ?auto_2631838 ?auto_2631840 ) ) ( not ( = ?auto_2631838 ?auto_2631842 ) ) ( not ( = ?auto_2631838 ?auto_2631843 ) ) ( not ( = ?auto_2631838 ?auto_2631844 ) ) ( not ( = ?auto_2631838 ?auto_2631845 ) ) ( not ( = ?auto_2631838 ?auto_2631846 ) ) ( not ( = ?auto_2631838 ?auto_2631847 ) ) ( not ( = ?auto_2631838 ?auto_2631848 ) ) ( not ( = ?auto_2631838 ?auto_2631849 ) ) ( not ( = ?auto_2631838 ?auto_2631850 ) ) ( not ( = ?auto_2631838 ?auto_2631851 ) ) ( not ( = ?auto_2631835 ?auto_2631839 ) ) ( not ( = ?auto_2631835 ?auto_2631841 ) ) ( not ( = ?auto_2631835 ?auto_2631840 ) ) ( not ( = ?auto_2631835 ?auto_2631842 ) ) ( not ( = ?auto_2631835 ?auto_2631843 ) ) ( not ( = ?auto_2631835 ?auto_2631844 ) ) ( not ( = ?auto_2631835 ?auto_2631845 ) ) ( not ( = ?auto_2631835 ?auto_2631846 ) ) ( not ( = ?auto_2631835 ?auto_2631847 ) ) ( not ( = ?auto_2631835 ?auto_2631848 ) ) ( not ( = ?auto_2631835 ?auto_2631849 ) ) ( not ( = ?auto_2631835 ?auto_2631850 ) ) ( not ( = ?auto_2631835 ?auto_2631851 ) ) ( not ( = ?auto_2631839 ?auto_2631841 ) ) ( not ( = ?auto_2631839 ?auto_2631840 ) ) ( not ( = ?auto_2631839 ?auto_2631842 ) ) ( not ( = ?auto_2631839 ?auto_2631843 ) ) ( not ( = ?auto_2631839 ?auto_2631844 ) ) ( not ( = ?auto_2631839 ?auto_2631845 ) ) ( not ( = ?auto_2631839 ?auto_2631846 ) ) ( not ( = ?auto_2631839 ?auto_2631847 ) ) ( not ( = ?auto_2631839 ?auto_2631848 ) ) ( not ( = ?auto_2631839 ?auto_2631849 ) ) ( not ( = ?auto_2631839 ?auto_2631850 ) ) ( not ( = ?auto_2631839 ?auto_2631851 ) ) ( not ( = ?auto_2631841 ?auto_2631840 ) ) ( not ( = ?auto_2631841 ?auto_2631842 ) ) ( not ( = ?auto_2631841 ?auto_2631843 ) ) ( not ( = ?auto_2631841 ?auto_2631844 ) ) ( not ( = ?auto_2631841 ?auto_2631845 ) ) ( not ( = ?auto_2631841 ?auto_2631846 ) ) ( not ( = ?auto_2631841 ?auto_2631847 ) ) ( not ( = ?auto_2631841 ?auto_2631848 ) ) ( not ( = ?auto_2631841 ?auto_2631849 ) ) ( not ( = ?auto_2631841 ?auto_2631850 ) ) ( not ( = ?auto_2631841 ?auto_2631851 ) ) ( not ( = ?auto_2631840 ?auto_2631842 ) ) ( not ( = ?auto_2631840 ?auto_2631843 ) ) ( not ( = ?auto_2631840 ?auto_2631844 ) ) ( not ( = ?auto_2631840 ?auto_2631845 ) ) ( not ( = ?auto_2631840 ?auto_2631846 ) ) ( not ( = ?auto_2631840 ?auto_2631847 ) ) ( not ( = ?auto_2631840 ?auto_2631848 ) ) ( not ( = ?auto_2631840 ?auto_2631849 ) ) ( not ( = ?auto_2631840 ?auto_2631850 ) ) ( not ( = ?auto_2631840 ?auto_2631851 ) ) ( not ( = ?auto_2631842 ?auto_2631843 ) ) ( not ( = ?auto_2631842 ?auto_2631844 ) ) ( not ( = ?auto_2631842 ?auto_2631845 ) ) ( not ( = ?auto_2631842 ?auto_2631846 ) ) ( not ( = ?auto_2631842 ?auto_2631847 ) ) ( not ( = ?auto_2631842 ?auto_2631848 ) ) ( not ( = ?auto_2631842 ?auto_2631849 ) ) ( not ( = ?auto_2631842 ?auto_2631850 ) ) ( not ( = ?auto_2631842 ?auto_2631851 ) ) ( not ( = ?auto_2631843 ?auto_2631844 ) ) ( not ( = ?auto_2631843 ?auto_2631845 ) ) ( not ( = ?auto_2631843 ?auto_2631846 ) ) ( not ( = ?auto_2631843 ?auto_2631847 ) ) ( not ( = ?auto_2631843 ?auto_2631848 ) ) ( not ( = ?auto_2631843 ?auto_2631849 ) ) ( not ( = ?auto_2631843 ?auto_2631850 ) ) ( not ( = ?auto_2631843 ?auto_2631851 ) ) ( not ( = ?auto_2631844 ?auto_2631845 ) ) ( not ( = ?auto_2631844 ?auto_2631846 ) ) ( not ( = ?auto_2631844 ?auto_2631847 ) ) ( not ( = ?auto_2631844 ?auto_2631848 ) ) ( not ( = ?auto_2631844 ?auto_2631849 ) ) ( not ( = ?auto_2631844 ?auto_2631850 ) ) ( not ( = ?auto_2631844 ?auto_2631851 ) ) ( not ( = ?auto_2631845 ?auto_2631846 ) ) ( not ( = ?auto_2631845 ?auto_2631847 ) ) ( not ( = ?auto_2631845 ?auto_2631848 ) ) ( not ( = ?auto_2631845 ?auto_2631849 ) ) ( not ( = ?auto_2631845 ?auto_2631850 ) ) ( not ( = ?auto_2631845 ?auto_2631851 ) ) ( not ( = ?auto_2631846 ?auto_2631847 ) ) ( not ( = ?auto_2631846 ?auto_2631848 ) ) ( not ( = ?auto_2631846 ?auto_2631849 ) ) ( not ( = ?auto_2631846 ?auto_2631850 ) ) ( not ( = ?auto_2631846 ?auto_2631851 ) ) ( not ( = ?auto_2631847 ?auto_2631848 ) ) ( not ( = ?auto_2631847 ?auto_2631849 ) ) ( not ( = ?auto_2631847 ?auto_2631850 ) ) ( not ( = ?auto_2631847 ?auto_2631851 ) ) ( not ( = ?auto_2631848 ?auto_2631849 ) ) ( not ( = ?auto_2631848 ?auto_2631850 ) ) ( not ( = ?auto_2631848 ?auto_2631851 ) ) ( not ( = ?auto_2631849 ?auto_2631850 ) ) ( not ( = ?auto_2631849 ?auto_2631851 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2631850 ?auto_2631851 )
      ( MAKE-16CRATE-VERIFY ?auto_2631836 ?auto_2631837 ?auto_2631838 ?auto_2631835 ?auto_2631839 ?auto_2631841 ?auto_2631840 ?auto_2631842 ?auto_2631843 ?auto_2631844 ?auto_2631845 ?auto_2631846 ?auto_2631847 ?auto_2631848 ?auto_2631849 ?auto_2631850 ?auto_2631851 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2632035 - SURFACE
      ?auto_2632036 - SURFACE
      ?auto_2632037 - SURFACE
      ?auto_2632034 - SURFACE
      ?auto_2632038 - SURFACE
      ?auto_2632040 - SURFACE
      ?auto_2632039 - SURFACE
      ?auto_2632041 - SURFACE
      ?auto_2632042 - SURFACE
      ?auto_2632043 - SURFACE
      ?auto_2632044 - SURFACE
      ?auto_2632045 - SURFACE
      ?auto_2632046 - SURFACE
      ?auto_2632047 - SURFACE
      ?auto_2632048 - SURFACE
      ?auto_2632049 - SURFACE
      ?auto_2632050 - SURFACE
    )
    :vars
    (
      ?auto_2632052 - HOIST
      ?auto_2632051 - PLACE
      ?auto_2632053 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2632052 ?auto_2632051 ) ( SURFACE-AT ?auto_2632049 ?auto_2632051 ) ( CLEAR ?auto_2632049 ) ( IS-CRATE ?auto_2632050 ) ( not ( = ?auto_2632049 ?auto_2632050 ) ) ( TRUCK-AT ?auto_2632053 ?auto_2632051 ) ( AVAILABLE ?auto_2632052 ) ( IN ?auto_2632050 ?auto_2632053 ) ( ON ?auto_2632049 ?auto_2632048 ) ( not ( = ?auto_2632048 ?auto_2632049 ) ) ( not ( = ?auto_2632048 ?auto_2632050 ) ) ( ON ?auto_2632036 ?auto_2632035 ) ( ON ?auto_2632037 ?auto_2632036 ) ( ON ?auto_2632034 ?auto_2632037 ) ( ON ?auto_2632038 ?auto_2632034 ) ( ON ?auto_2632040 ?auto_2632038 ) ( ON ?auto_2632039 ?auto_2632040 ) ( ON ?auto_2632041 ?auto_2632039 ) ( ON ?auto_2632042 ?auto_2632041 ) ( ON ?auto_2632043 ?auto_2632042 ) ( ON ?auto_2632044 ?auto_2632043 ) ( ON ?auto_2632045 ?auto_2632044 ) ( ON ?auto_2632046 ?auto_2632045 ) ( ON ?auto_2632047 ?auto_2632046 ) ( ON ?auto_2632048 ?auto_2632047 ) ( not ( = ?auto_2632035 ?auto_2632036 ) ) ( not ( = ?auto_2632035 ?auto_2632037 ) ) ( not ( = ?auto_2632035 ?auto_2632034 ) ) ( not ( = ?auto_2632035 ?auto_2632038 ) ) ( not ( = ?auto_2632035 ?auto_2632040 ) ) ( not ( = ?auto_2632035 ?auto_2632039 ) ) ( not ( = ?auto_2632035 ?auto_2632041 ) ) ( not ( = ?auto_2632035 ?auto_2632042 ) ) ( not ( = ?auto_2632035 ?auto_2632043 ) ) ( not ( = ?auto_2632035 ?auto_2632044 ) ) ( not ( = ?auto_2632035 ?auto_2632045 ) ) ( not ( = ?auto_2632035 ?auto_2632046 ) ) ( not ( = ?auto_2632035 ?auto_2632047 ) ) ( not ( = ?auto_2632035 ?auto_2632048 ) ) ( not ( = ?auto_2632035 ?auto_2632049 ) ) ( not ( = ?auto_2632035 ?auto_2632050 ) ) ( not ( = ?auto_2632036 ?auto_2632037 ) ) ( not ( = ?auto_2632036 ?auto_2632034 ) ) ( not ( = ?auto_2632036 ?auto_2632038 ) ) ( not ( = ?auto_2632036 ?auto_2632040 ) ) ( not ( = ?auto_2632036 ?auto_2632039 ) ) ( not ( = ?auto_2632036 ?auto_2632041 ) ) ( not ( = ?auto_2632036 ?auto_2632042 ) ) ( not ( = ?auto_2632036 ?auto_2632043 ) ) ( not ( = ?auto_2632036 ?auto_2632044 ) ) ( not ( = ?auto_2632036 ?auto_2632045 ) ) ( not ( = ?auto_2632036 ?auto_2632046 ) ) ( not ( = ?auto_2632036 ?auto_2632047 ) ) ( not ( = ?auto_2632036 ?auto_2632048 ) ) ( not ( = ?auto_2632036 ?auto_2632049 ) ) ( not ( = ?auto_2632036 ?auto_2632050 ) ) ( not ( = ?auto_2632037 ?auto_2632034 ) ) ( not ( = ?auto_2632037 ?auto_2632038 ) ) ( not ( = ?auto_2632037 ?auto_2632040 ) ) ( not ( = ?auto_2632037 ?auto_2632039 ) ) ( not ( = ?auto_2632037 ?auto_2632041 ) ) ( not ( = ?auto_2632037 ?auto_2632042 ) ) ( not ( = ?auto_2632037 ?auto_2632043 ) ) ( not ( = ?auto_2632037 ?auto_2632044 ) ) ( not ( = ?auto_2632037 ?auto_2632045 ) ) ( not ( = ?auto_2632037 ?auto_2632046 ) ) ( not ( = ?auto_2632037 ?auto_2632047 ) ) ( not ( = ?auto_2632037 ?auto_2632048 ) ) ( not ( = ?auto_2632037 ?auto_2632049 ) ) ( not ( = ?auto_2632037 ?auto_2632050 ) ) ( not ( = ?auto_2632034 ?auto_2632038 ) ) ( not ( = ?auto_2632034 ?auto_2632040 ) ) ( not ( = ?auto_2632034 ?auto_2632039 ) ) ( not ( = ?auto_2632034 ?auto_2632041 ) ) ( not ( = ?auto_2632034 ?auto_2632042 ) ) ( not ( = ?auto_2632034 ?auto_2632043 ) ) ( not ( = ?auto_2632034 ?auto_2632044 ) ) ( not ( = ?auto_2632034 ?auto_2632045 ) ) ( not ( = ?auto_2632034 ?auto_2632046 ) ) ( not ( = ?auto_2632034 ?auto_2632047 ) ) ( not ( = ?auto_2632034 ?auto_2632048 ) ) ( not ( = ?auto_2632034 ?auto_2632049 ) ) ( not ( = ?auto_2632034 ?auto_2632050 ) ) ( not ( = ?auto_2632038 ?auto_2632040 ) ) ( not ( = ?auto_2632038 ?auto_2632039 ) ) ( not ( = ?auto_2632038 ?auto_2632041 ) ) ( not ( = ?auto_2632038 ?auto_2632042 ) ) ( not ( = ?auto_2632038 ?auto_2632043 ) ) ( not ( = ?auto_2632038 ?auto_2632044 ) ) ( not ( = ?auto_2632038 ?auto_2632045 ) ) ( not ( = ?auto_2632038 ?auto_2632046 ) ) ( not ( = ?auto_2632038 ?auto_2632047 ) ) ( not ( = ?auto_2632038 ?auto_2632048 ) ) ( not ( = ?auto_2632038 ?auto_2632049 ) ) ( not ( = ?auto_2632038 ?auto_2632050 ) ) ( not ( = ?auto_2632040 ?auto_2632039 ) ) ( not ( = ?auto_2632040 ?auto_2632041 ) ) ( not ( = ?auto_2632040 ?auto_2632042 ) ) ( not ( = ?auto_2632040 ?auto_2632043 ) ) ( not ( = ?auto_2632040 ?auto_2632044 ) ) ( not ( = ?auto_2632040 ?auto_2632045 ) ) ( not ( = ?auto_2632040 ?auto_2632046 ) ) ( not ( = ?auto_2632040 ?auto_2632047 ) ) ( not ( = ?auto_2632040 ?auto_2632048 ) ) ( not ( = ?auto_2632040 ?auto_2632049 ) ) ( not ( = ?auto_2632040 ?auto_2632050 ) ) ( not ( = ?auto_2632039 ?auto_2632041 ) ) ( not ( = ?auto_2632039 ?auto_2632042 ) ) ( not ( = ?auto_2632039 ?auto_2632043 ) ) ( not ( = ?auto_2632039 ?auto_2632044 ) ) ( not ( = ?auto_2632039 ?auto_2632045 ) ) ( not ( = ?auto_2632039 ?auto_2632046 ) ) ( not ( = ?auto_2632039 ?auto_2632047 ) ) ( not ( = ?auto_2632039 ?auto_2632048 ) ) ( not ( = ?auto_2632039 ?auto_2632049 ) ) ( not ( = ?auto_2632039 ?auto_2632050 ) ) ( not ( = ?auto_2632041 ?auto_2632042 ) ) ( not ( = ?auto_2632041 ?auto_2632043 ) ) ( not ( = ?auto_2632041 ?auto_2632044 ) ) ( not ( = ?auto_2632041 ?auto_2632045 ) ) ( not ( = ?auto_2632041 ?auto_2632046 ) ) ( not ( = ?auto_2632041 ?auto_2632047 ) ) ( not ( = ?auto_2632041 ?auto_2632048 ) ) ( not ( = ?auto_2632041 ?auto_2632049 ) ) ( not ( = ?auto_2632041 ?auto_2632050 ) ) ( not ( = ?auto_2632042 ?auto_2632043 ) ) ( not ( = ?auto_2632042 ?auto_2632044 ) ) ( not ( = ?auto_2632042 ?auto_2632045 ) ) ( not ( = ?auto_2632042 ?auto_2632046 ) ) ( not ( = ?auto_2632042 ?auto_2632047 ) ) ( not ( = ?auto_2632042 ?auto_2632048 ) ) ( not ( = ?auto_2632042 ?auto_2632049 ) ) ( not ( = ?auto_2632042 ?auto_2632050 ) ) ( not ( = ?auto_2632043 ?auto_2632044 ) ) ( not ( = ?auto_2632043 ?auto_2632045 ) ) ( not ( = ?auto_2632043 ?auto_2632046 ) ) ( not ( = ?auto_2632043 ?auto_2632047 ) ) ( not ( = ?auto_2632043 ?auto_2632048 ) ) ( not ( = ?auto_2632043 ?auto_2632049 ) ) ( not ( = ?auto_2632043 ?auto_2632050 ) ) ( not ( = ?auto_2632044 ?auto_2632045 ) ) ( not ( = ?auto_2632044 ?auto_2632046 ) ) ( not ( = ?auto_2632044 ?auto_2632047 ) ) ( not ( = ?auto_2632044 ?auto_2632048 ) ) ( not ( = ?auto_2632044 ?auto_2632049 ) ) ( not ( = ?auto_2632044 ?auto_2632050 ) ) ( not ( = ?auto_2632045 ?auto_2632046 ) ) ( not ( = ?auto_2632045 ?auto_2632047 ) ) ( not ( = ?auto_2632045 ?auto_2632048 ) ) ( not ( = ?auto_2632045 ?auto_2632049 ) ) ( not ( = ?auto_2632045 ?auto_2632050 ) ) ( not ( = ?auto_2632046 ?auto_2632047 ) ) ( not ( = ?auto_2632046 ?auto_2632048 ) ) ( not ( = ?auto_2632046 ?auto_2632049 ) ) ( not ( = ?auto_2632046 ?auto_2632050 ) ) ( not ( = ?auto_2632047 ?auto_2632048 ) ) ( not ( = ?auto_2632047 ?auto_2632049 ) ) ( not ( = ?auto_2632047 ?auto_2632050 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2632048 ?auto_2632049 ?auto_2632050 )
      ( MAKE-16CRATE-VERIFY ?auto_2632035 ?auto_2632036 ?auto_2632037 ?auto_2632034 ?auto_2632038 ?auto_2632040 ?auto_2632039 ?auto_2632041 ?auto_2632042 ?auto_2632043 ?auto_2632044 ?auto_2632045 ?auto_2632046 ?auto_2632047 ?auto_2632048 ?auto_2632049 ?auto_2632050 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2632251 - SURFACE
      ?auto_2632252 - SURFACE
      ?auto_2632253 - SURFACE
      ?auto_2632250 - SURFACE
      ?auto_2632254 - SURFACE
      ?auto_2632256 - SURFACE
      ?auto_2632255 - SURFACE
      ?auto_2632257 - SURFACE
      ?auto_2632258 - SURFACE
      ?auto_2632259 - SURFACE
      ?auto_2632260 - SURFACE
      ?auto_2632261 - SURFACE
      ?auto_2632262 - SURFACE
      ?auto_2632263 - SURFACE
      ?auto_2632264 - SURFACE
      ?auto_2632265 - SURFACE
      ?auto_2632266 - SURFACE
    )
    :vars
    (
      ?auto_2632269 - HOIST
      ?auto_2632270 - PLACE
      ?auto_2632268 - TRUCK
      ?auto_2632267 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2632269 ?auto_2632270 ) ( SURFACE-AT ?auto_2632265 ?auto_2632270 ) ( CLEAR ?auto_2632265 ) ( IS-CRATE ?auto_2632266 ) ( not ( = ?auto_2632265 ?auto_2632266 ) ) ( AVAILABLE ?auto_2632269 ) ( IN ?auto_2632266 ?auto_2632268 ) ( ON ?auto_2632265 ?auto_2632264 ) ( not ( = ?auto_2632264 ?auto_2632265 ) ) ( not ( = ?auto_2632264 ?auto_2632266 ) ) ( TRUCK-AT ?auto_2632268 ?auto_2632267 ) ( not ( = ?auto_2632267 ?auto_2632270 ) ) ( ON ?auto_2632252 ?auto_2632251 ) ( ON ?auto_2632253 ?auto_2632252 ) ( ON ?auto_2632250 ?auto_2632253 ) ( ON ?auto_2632254 ?auto_2632250 ) ( ON ?auto_2632256 ?auto_2632254 ) ( ON ?auto_2632255 ?auto_2632256 ) ( ON ?auto_2632257 ?auto_2632255 ) ( ON ?auto_2632258 ?auto_2632257 ) ( ON ?auto_2632259 ?auto_2632258 ) ( ON ?auto_2632260 ?auto_2632259 ) ( ON ?auto_2632261 ?auto_2632260 ) ( ON ?auto_2632262 ?auto_2632261 ) ( ON ?auto_2632263 ?auto_2632262 ) ( ON ?auto_2632264 ?auto_2632263 ) ( not ( = ?auto_2632251 ?auto_2632252 ) ) ( not ( = ?auto_2632251 ?auto_2632253 ) ) ( not ( = ?auto_2632251 ?auto_2632250 ) ) ( not ( = ?auto_2632251 ?auto_2632254 ) ) ( not ( = ?auto_2632251 ?auto_2632256 ) ) ( not ( = ?auto_2632251 ?auto_2632255 ) ) ( not ( = ?auto_2632251 ?auto_2632257 ) ) ( not ( = ?auto_2632251 ?auto_2632258 ) ) ( not ( = ?auto_2632251 ?auto_2632259 ) ) ( not ( = ?auto_2632251 ?auto_2632260 ) ) ( not ( = ?auto_2632251 ?auto_2632261 ) ) ( not ( = ?auto_2632251 ?auto_2632262 ) ) ( not ( = ?auto_2632251 ?auto_2632263 ) ) ( not ( = ?auto_2632251 ?auto_2632264 ) ) ( not ( = ?auto_2632251 ?auto_2632265 ) ) ( not ( = ?auto_2632251 ?auto_2632266 ) ) ( not ( = ?auto_2632252 ?auto_2632253 ) ) ( not ( = ?auto_2632252 ?auto_2632250 ) ) ( not ( = ?auto_2632252 ?auto_2632254 ) ) ( not ( = ?auto_2632252 ?auto_2632256 ) ) ( not ( = ?auto_2632252 ?auto_2632255 ) ) ( not ( = ?auto_2632252 ?auto_2632257 ) ) ( not ( = ?auto_2632252 ?auto_2632258 ) ) ( not ( = ?auto_2632252 ?auto_2632259 ) ) ( not ( = ?auto_2632252 ?auto_2632260 ) ) ( not ( = ?auto_2632252 ?auto_2632261 ) ) ( not ( = ?auto_2632252 ?auto_2632262 ) ) ( not ( = ?auto_2632252 ?auto_2632263 ) ) ( not ( = ?auto_2632252 ?auto_2632264 ) ) ( not ( = ?auto_2632252 ?auto_2632265 ) ) ( not ( = ?auto_2632252 ?auto_2632266 ) ) ( not ( = ?auto_2632253 ?auto_2632250 ) ) ( not ( = ?auto_2632253 ?auto_2632254 ) ) ( not ( = ?auto_2632253 ?auto_2632256 ) ) ( not ( = ?auto_2632253 ?auto_2632255 ) ) ( not ( = ?auto_2632253 ?auto_2632257 ) ) ( not ( = ?auto_2632253 ?auto_2632258 ) ) ( not ( = ?auto_2632253 ?auto_2632259 ) ) ( not ( = ?auto_2632253 ?auto_2632260 ) ) ( not ( = ?auto_2632253 ?auto_2632261 ) ) ( not ( = ?auto_2632253 ?auto_2632262 ) ) ( not ( = ?auto_2632253 ?auto_2632263 ) ) ( not ( = ?auto_2632253 ?auto_2632264 ) ) ( not ( = ?auto_2632253 ?auto_2632265 ) ) ( not ( = ?auto_2632253 ?auto_2632266 ) ) ( not ( = ?auto_2632250 ?auto_2632254 ) ) ( not ( = ?auto_2632250 ?auto_2632256 ) ) ( not ( = ?auto_2632250 ?auto_2632255 ) ) ( not ( = ?auto_2632250 ?auto_2632257 ) ) ( not ( = ?auto_2632250 ?auto_2632258 ) ) ( not ( = ?auto_2632250 ?auto_2632259 ) ) ( not ( = ?auto_2632250 ?auto_2632260 ) ) ( not ( = ?auto_2632250 ?auto_2632261 ) ) ( not ( = ?auto_2632250 ?auto_2632262 ) ) ( not ( = ?auto_2632250 ?auto_2632263 ) ) ( not ( = ?auto_2632250 ?auto_2632264 ) ) ( not ( = ?auto_2632250 ?auto_2632265 ) ) ( not ( = ?auto_2632250 ?auto_2632266 ) ) ( not ( = ?auto_2632254 ?auto_2632256 ) ) ( not ( = ?auto_2632254 ?auto_2632255 ) ) ( not ( = ?auto_2632254 ?auto_2632257 ) ) ( not ( = ?auto_2632254 ?auto_2632258 ) ) ( not ( = ?auto_2632254 ?auto_2632259 ) ) ( not ( = ?auto_2632254 ?auto_2632260 ) ) ( not ( = ?auto_2632254 ?auto_2632261 ) ) ( not ( = ?auto_2632254 ?auto_2632262 ) ) ( not ( = ?auto_2632254 ?auto_2632263 ) ) ( not ( = ?auto_2632254 ?auto_2632264 ) ) ( not ( = ?auto_2632254 ?auto_2632265 ) ) ( not ( = ?auto_2632254 ?auto_2632266 ) ) ( not ( = ?auto_2632256 ?auto_2632255 ) ) ( not ( = ?auto_2632256 ?auto_2632257 ) ) ( not ( = ?auto_2632256 ?auto_2632258 ) ) ( not ( = ?auto_2632256 ?auto_2632259 ) ) ( not ( = ?auto_2632256 ?auto_2632260 ) ) ( not ( = ?auto_2632256 ?auto_2632261 ) ) ( not ( = ?auto_2632256 ?auto_2632262 ) ) ( not ( = ?auto_2632256 ?auto_2632263 ) ) ( not ( = ?auto_2632256 ?auto_2632264 ) ) ( not ( = ?auto_2632256 ?auto_2632265 ) ) ( not ( = ?auto_2632256 ?auto_2632266 ) ) ( not ( = ?auto_2632255 ?auto_2632257 ) ) ( not ( = ?auto_2632255 ?auto_2632258 ) ) ( not ( = ?auto_2632255 ?auto_2632259 ) ) ( not ( = ?auto_2632255 ?auto_2632260 ) ) ( not ( = ?auto_2632255 ?auto_2632261 ) ) ( not ( = ?auto_2632255 ?auto_2632262 ) ) ( not ( = ?auto_2632255 ?auto_2632263 ) ) ( not ( = ?auto_2632255 ?auto_2632264 ) ) ( not ( = ?auto_2632255 ?auto_2632265 ) ) ( not ( = ?auto_2632255 ?auto_2632266 ) ) ( not ( = ?auto_2632257 ?auto_2632258 ) ) ( not ( = ?auto_2632257 ?auto_2632259 ) ) ( not ( = ?auto_2632257 ?auto_2632260 ) ) ( not ( = ?auto_2632257 ?auto_2632261 ) ) ( not ( = ?auto_2632257 ?auto_2632262 ) ) ( not ( = ?auto_2632257 ?auto_2632263 ) ) ( not ( = ?auto_2632257 ?auto_2632264 ) ) ( not ( = ?auto_2632257 ?auto_2632265 ) ) ( not ( = ?auto_2632257 ?auto_2632266 ) ) ( not ( = ?auto_2632258 ?auto_2632259 ) ) ( not ( = ?auto_2632258 ?auto_2632260 ) ) ( not ( = ?auto_2632258 ?auto_2632261 ) ) ( not ( = ?auto_2632258 ?auto_2632262 ) ) ( not ( = ?auto_2632258 ?auto_2632263 ) ) ( not ( = ?auto_2632258 ?auto_2632264 ) ) ( not ( = ?auto_2632258 ?auto_2632265 ) ) ( not ( = ?auto_2632258 ?auto_2632266 ) ) ( not ( = ?auto_2632259 ?auto_2632260 ) ) ( not ( = ?auto_2632259 ?auto_2632261 ) ) ( not ( = ?auto_2632259 ?auto_2632262 ) ) ( not ( = ?auto_2632259 ?auto_2632263 ) ) ( not ( = ?auto_2632259 ?auto_2632264 ) ) ( not ( = ?auto_2632259 ?auto_2632265 ) ) ( not ( = ?auto_2632259 ?auto_2632266 ) ) ( not ( = ?auto_2632260 ?auto_2632261 ) ) ( not ( = ?auto_2632260 ?auto_2632262 ) ) ( not ( = ?auto_2632260 ?auto_2632263 ) ) ( not ( = ?auto_2632260 ?auto_2632264 ) ) ( not ( = ?auto_2632260 ?auto_2632265 ) ) ( not ( = ?auto_2632260 ?auto_2632266 ) ) ( not ( = ?auto_2632261 ?auto_2632262 ) ) ( not ( = ?auto_2632261 ?auto_2632263 ) ) ( not ( = ?auto_2632261 ?auto_2632264 ) ) ( not ( = ?auto_2632261 ?auto_2632265 ) ) ( not ( = ?auto_2632261 ?auto_2632266 ) ) ( not ( = ?auto_2632262 ?auto_2632263 ) ) ( not ( = ?auto_2632262 ?auto_2632264 ) ) ( not ( = ?auto_2632262 ?auto_2632265 ) ) ( not ( = ?auto_2632262 ?auto_2632266 ) ) ( not ( = ?auto_2632263 ?auto_2632264 ) ) ( not ( = ?auto_2632263 ?auto_2632265 ) ) ( not ( = ?auto_2632263 ?auto_2632266 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2632264 ?auto_2632265 ?auto_2632266 )
      ( MAKE-16CRATE-VERIFY ?auto_2632251 ?auto_2632252 ?auto_2632253 ?auto_2632250 ?auto_2632254 ?auto_2632256 ?auto_2632255 ?auto_2632257 ?auto_2632258 ?auto_2632259 ?auto_2632260 ?auto_2632261 ?auto_2632262 ?auto_2632263 ?auto_2632264 ?auto_2632265 ?auto_2632266 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2632483 - SURFACE
      ?auto_2632484 - SURFACE
      ?auto_2632485 - SURFACE
      ?auto_2632482 - SURFACE
      ?auto_2632486 - SURFACE
      ?auto_2632488 - SURFACE
      ?auto_2632487 - SURFACE
      ?auto_2632489 - SURFACE
      ?auto_2632490 - SURFACE
      ?auto_2632491 - SURFACE
      ?auto_2632492 - SURFACE
      ?auto_2632493 - SURFACE
      ?auto_2632494 - SURFACE
      ?auto_2632495 - SURFACE
      ?auto_2632496 - SURFACE
      ?auto_2632497 - SURFACE
      ?auto_2632498 - SURFACE
    )
    :vars
    (
      ?auto_2632501 - HOIST
      ?auto_2632500 - PLACE
      ?auto_2632503 - TRUCK
      ?auto_2632499 - PLACE
      ?auto_2632502 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2632501 ?auto_2632500 ) ( SURFACE-AT ?auto_2632497 ?auto_2632500 ) ( CLEAR ?auto_2632497 ) ( IS-CRATE ?auto_2632498 ) ( not ( = ?auto_2632497 ?auto_2632498 ) ) ( AVAILABLE ?auto_2632501 ) ( ON ?auto_2632497 ?auto_2632496 ) ( not ( = ?auto_2632496 ?auto_2632497 ) ) ( not ( = ?auto_2632496 ?auto_2632498 ) ) ( TRUCK-AT ?auto_2632503 ?auto_2632499 ) ( not ( = ?auto_2632499 ?auto_2632500 ) ) ( HOIST-AT ?auto_2632502 ?auto_2632499 ) ( LIFTING ?auto_2632502 ?auto_2632498 ) ( not ( = ?auto_2632501 ?auto_2632502 ) ) ( ON ?auto_2632484 ?auto_2632483 ) ( ON ?auto_2632485 ?auto_2632484 ) ( ON ?auto_2632482 ?auto_2632485 ) ( ON ?auto_2632486 ?auto_2632482 ) ( ON ?auto_2632488 ?auto_2632486 ) ( ON ?auto_2632487 ?auto_2632488 ) ( ON ?auto_2632489 ?auto_2632487 ) ( ON ?auto_2632490 ?auto_2632489 ) ( ON ?auto_2632491 ?auto_2632490 ) ( ON ?auto_2632492 ?auto_2632491 ) ( ON ?auto_2632493 ?auto_2632492 ) ( ON ?auto_2632494 ?auto_2632493 ) ( ON ?auto_2632495 ?auto_2632494 ) ( ON ?auto_2632496 ?auto_2632495 ) ( not ( = ?auto_2632483 ?auto_2632484 ) ) ( not ( = ?auto_2632483 ?auto_2632485 ) ) ( not ( = ?auto_2632483 ?auto_2632482 ) ) ( not ( = ?auto_2632483 ?auto_2632486 ) ) ( not ( = ?auto_2632483 ?auto_2632488 ) ) ( not ( = ?auto_2632483 ?auto_2632487 ) ) ( not ( = ?auto_2632483 ?auto_2632489 ) ) ( not ( = ?auto_2632483 ?auto_2632490 ) ) ( not ( = ?auto_2632483 ?auto_2632491 ) ) ( not ( = ?auto_2632483 ?auto_2632492 ) ) ( not ( = ?auto_2632483 ?auto_2632493 ) ) ( not ( = ?auto_2632483 ?auto_2632494 ) ) ( not ( = ?auto_2632483 ?auto_2632495 ) ) ( not ( = ?auto_2632483 ?auto_2632496 ) ) ( not ( = ?auto_2632483 ?auto_2632497 ) ) ( not ( = ?auto_2632483 ?auto_2632498 ) ) ( not ( = ?auto_2632484 ?auto_2632485 ) ) ( not ( = ?auto_2632484 ?auto_2632482 ) ) ( not ( = ?auto_2632484 ?auto_2632486 ) ) ( not ( = ?auto_2632484 ?auto_2632488 ) ) ( not ( = ?auto_2632484 ?auto_2632487 ) ) ( not ( = ?auto_2632484 ?auto_2632489 ) ) ( not ( = ?auto_2632484 ?auto_2632490 ) ) ( not ( = ?auto_2632484 ?auto_2632491 ) ) ( not ( = ?auto_2632484 ?auto_2632492 ) ) ( not ( = ?auto_2632484 ?auto_2632493 ) ) ( not ( = ?auto_2632484 ?auto_2632494 ) ) ( not ( = ?auto_2632484 ?auto_2632495 ) ) ( not ( = ?auto_2632484 ?auto_2632496 ) ) ( not ( = ?auto_2632484 ?auto_2632497 ) ) ( not ( = ?auto_2632484 ?auto_2632498 ) ) ( not ( = ?auto_2632485 ?auto_2632482 ) ) ( not ( = ?auto_2632485 ?auto_2632486 ) ) ( not ( = ?auto_2632485 ?auto_2632488 ) ) ( not ( = ?auto_2632485 ?auto_2632487 ) ) ( not ( = ?auto_2632485 ?auto_2632489 ) ) ( not ( = ?auto_2632485 ?auto_2632490 ) ) ( not ( = ?auto_2632485 ?auto_2632491 ) ) ( not ( = ?auto_2632485 ?auto_2632492 ) ) ( not ( = ?auto_2632485 ?auto_2632493 ) ) ( not ( = ?auto_2632485 ?auto_2632494 ) ) ( not ( = ?auto_2632485 ?auto_2632495 ) ) ( not ( = ?auto_2632485 ?auto_2632496 ) ) ( not ( = ?auto_2632485 ?auto_2632497 ) ) ( not ( = ?auto_2632485 ?auto_2632498 ) ) ( not ( = ?auto_2632482 ?auto_2632486 ) ) ( not ( = ?auto_2632482 ?auto_2632488 ) ) ( not ( = ?auto_2632482 ?auto_2632487 ) ) ( not ( = ?auto_2632482 ?auto_2632489 ) ) ( not ( = ?auto_2632482 ?auto_2632490 ) ) ( not ( = ?auto_2632482 ?auto_2632491 ) ) ( not ( = ?auto_2632482 ?auto_2632492 ) ) ( not ( = ?auto_2632482 ?auto_2632493 ) ) ( not ( = ?auto_2632482 ?auto_2632494 ) ) ( not ( = ?auto_2632482 ?auto_2632495 ) ) ( not ( = ?auto_2632482 ?auto_2632496 ) ) ( not ( = ?auto_2632482 ?auto_2632497 ) ) ( not ( = ?auto_2632482 ?auto_2632498 ) ) ( not ( = ?auto_2632486 ?auto_2632488 ) ) ( not ( = ?auto_2632486 ?auto_2632487 ) ) ( not ( = ?auto_2632486 ?auto_2632489 ) ) ( not ( = ?auto_2632486 ?auto_2632490 ) ) ( not ( = ?auto_2632486 ?auto_2632491 ) ) ( not ( = ?auto_2632486 ?auto_2632492 ) ) ( not ( = ?auto_2632486 ?auto_2632493 ) ) ( not ( = ?auto_2632486 ?auto_2632494 ) ) ( not ( = ?auto_2632486 ?auto_2632495 ) ) ( not ( = ?auto_2632486 ?auto_2632496 ) ) ( not ( = ?auto_2632486 ?auto_2632497 ) ) ( not ( = ?auto_2632486 ?auto_2632498 ) ) ( not ( = ?auto_2632488 ?auto_2632487 ) ) ( not ( = ?auto_2632488 ?auto_2632489 ) ) ( not ( = ?auto_2632488 ?auto_2632490 ) ) ( not ( = ?auto_2632488 ?auto_2632491 ) ) ( not ( = ?auto_2632488 ?auto_2632492 ) ) ( not ( = ?auto_2632488 ?auto_2632493 ) ) ( not ( = ?auto_2632488 ?auto_2632494 ) ) ( not ( = ?auto_2632488 ?auto_2632495 ) ) ( not ( = ?auto_2632488 ?auto_2632496 ) ) ( not ( = ?auto_2632488 ?auto_2632497 ) ) ( not ( = ?auto_2632488 ?auto_2632498 ) ) ( not ( = ?auto_2632487 ?auto_2632489 ) ) ( not ( = ?auto_2632487 ?auto_2632490 ) ) ( not ( = ?auto_2632487 ?auto_2632491 ) ) ( not ( = ?auto_2632487 ?auto_2632492 ) ) ( not ( = ?auto_2632487 ?auto_2632493 ) ) ( not ( = ?auto_2632487 ?auto_2632494 ) ) ( not ( = ?auto_2632487 ?auto_2632495 ) ) ( not ( = ?auto_2632487 ?auto_2632496 ) ) ( not ( = ?auto_2632487 ?auto_2632497 ) ) ( not ( = ?auto_2632487 ?auto_2632498 ) ) ( not ( = ?auto_2632489 ?auto_2632490 ) ) ( not ( = ?auto_2632489 ?auto_2632491 ) ) ( not ( = ?auto_2632489 ?auto_2632492 ) ) ( not ( = ?auto_2632489 ?auto_2632493 ) ) ( not ( = ?auto_2632489 ?auto_2632494 ) ) ( not ( = ?auto_2632489 ?auto_2632495 ) ) ( not ( = ?auto_2632489 ?auto_2632496 ) ) ( not ( = ?auto_2632489 ?auto_2632497 ) ) ( not ( = ?auto_2632489 ?auto_2632498 ) ) ( not ( = ?auto_2632490 ?auto_2632491 ) ) ( not ( = ?auto_2632490 ?auto_2632492 ) ) ( not ( = ?auto_2632490 ?auto_2632493 ) ) ( not ( = ?auto_2632490 ?auto_2632494 ) ) ( not ( = ?auto_2632490 ?auto_2632495 ) ) ( not ( = ?auto_2632490 ?auto_2632496 ) ) ( not ( = ?auto_2632490 ?auto_2632497 ) ) ( not ( = ?auto_2632490 ?auto_2632498 ) ) ( not ( = ?auto_2632491 ?auto_2632492 ) ) ( not ( = ?auto_2632491 ?auto_2632493 ) ) ( not ( = ?auto_2632491 ?auto_2632494 ) ) ( not ( = ?auto_2632491 ?auto_2632495 ) ) ( not ( = ?auto_2632491 ?auto_2632496 ) ) ( not ( = ?auto_2632491 ?auto_2632497 ) ) ( not ( = ?auto_2632491 ?auto_2632498 ) ) ( not ( = ?auto_2632492 ?auto_2632493 ) ) ( not ( = ?auto_2632492 ?auto_2632494 ) ) ( not ( = ?auto_2632492 ?auto_2632495 ) ) ( not ( = ?auto_2632492 ?auto_2632496 ) ) ( not ( = ?auto_2632492 ?auto_2632497 ) ) ( not ( = ?auto_2632492 ?auto_2632498 ) ) ( not ( = ?auto_2632493 ?auto_2632494 ) ) ( not ( = ?auto_2632493 ?auto_2632495 ) ) ( not ( = ?auto_2632493 ?auto_2632496 ) ) ( not ( = ?auto_2632493 ?auto_2632497 ) ) ( not ( = ?auto_2632493 ?auto_2632498 ) ) ( not ( = ?auto_2632494 ?auto_2632495 ) ) ( not ( = ?auto_2632494 ?auto_2632496 ) ) ( not ( = ?auto_2632494 ?auto_2632497 ) ) ( not ( = ?auto_2632494 ?auto_2632498 ) ) ( not ( = ?auto_2632495 ?auto_2632496 ) ) ( not ( = ?auto_2632495 ?auto_2632497 ) ) ( not ( = ?auto_2632495 ?auto_2632498 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2632496 ?auto_2632497 ?auto_2632498 )
      ( MAKE-16CRATE-VERIFY ?auto_2632483 ?auto_2632484 ?auto_2632485 ?auto_2632482 ?auto_2632486 ?auto_2632488 ?auto_2632487 ?auto_2632489 ?auto_2632490 ?auto_2632491 ?auto_2632492 ?auto_2632493 ?auto_2632494 ?auto_2632495 ?auto_2632496 ?auto_2632497 ?auto_2632498 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2632731 - SURFACE
      ?auto_2632732 - SURFACE
      ?auto_2632733 - SURFACE
      ?auto_2632730 - SURFACE
      ?auto_2632734 - SURFACE
      ?auto_2632736 - SURFACE
      ?auto_2632735 - SURFACE
      ?auto_2632737 - SURFACE
      ?auto_2632738 - SURFACE
      ?auto_2632739 - SURFACE
      ?auto_2632740 - SURFACE
      ?auto_2632741 - SURFACE
      ?auto_2632742 - SURFACE
      ?auto_2632743 - SURFACE
      ?auto_2632744 - SURFACE
      ?auto_2632745 - SURFACE
      ?auto_2632746 - SURFACE
    )
    :vars
    (
      ?auto_2632750 - HOIST
      ?auto_2632747 - PLACE
      ?auto_2632752 - TRUCK
      ?auto_2632748 - PLACE
      ?auto_2632751 - HOIST
      ?auto_2632749 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2632750 ?auto_2632747 ) ( SURFACE-AT ?auto_2632745 ?auto_2632747 ) ( CLEAR ?auto_2632745 ) ( IS-CRATE ?auto_2632746 ) ( not ( = ?auto_2632745 ?auto_2632746 ) ) ( AVAILABLE ?auto_2632750 ) ( ON ?auto_2632745 ?auto_2632744 ) ( not ( = ?auto_2632744 ?auto_2632745 ) ) ( not ( = ?auto_2632744 ?auto_2632746 ) ) ( TRUCK-AT ?auto_2632752 ?auto_2632748 ) ( not ( = ?auto_2632748 ?auto_2632747 ) ) ( HOIST-AT ?auto_2632751 ?auto_2632748 ) ( not ( = ?auto_2632750 ?auto_2632751 ) ) ( AVAILABLE ?auto_2632751 ) ( SURFACE-AT ?auto_2632746 ?auto_2632748 ) ( ON ?auto_2632746 ?auto_2632749 ) ( CLEAR ?auto_2632746 ) ( not ( = ?auto_2632745 ?auto_2632749 ) ) ( not ( = ?auto_2632746 ?auto_2632749 ) ) ( not ( = ?auto_2632744 ?auto_2632749 ) ) ( ON ?auto_2632732 ?auto_2632731 ) ( ON ?auto_2632733 ?auto_2632732 ) ( ON ?auto_2632730 ?auto_2632733 ) ( ON ?auto_2632734 ?auto_2632730 ) ( ON ?auto_2632736 ?auto_2632734 ) ( ON ?auto_2632735 ?auto_2632736 ) ( ON ?auto_2632737 ?auto_2632735 ) ( ON ?auto_2632738 ?auto_2632737 ) ( ON ?auto_2632739 ?auto_2632738 ) ( ON ?auto_2632740 ?auto_2632739 ) ( ON ?auto_2632741 ?auto_2632740 ) ( ON ?auto_2632742 ?auto_2632741 ) ( ON ?auto_2632743 ?auto_2632742 ) ( ON ?auto_2632744 ?auto_2632743 ) ( not ( = ?auto_2632731 ?auto_2632732 ) ) ( not ( = ?auto_2632731 ?auto_2632733 ) ) ( not ( = ?auto_2632731 ?auto_2632730 ) ) ( not ( = ?auto_2632731 ?auto_2632734 ) ) ( not ( = ?auto_2632731 ?auto_2632736 ) ) ( not ( = ?auto_2632731 ?auto_2632735 ) ) ( not ( = ?auto_2632731 ?auto_2632737 ) ) ( not ( = ?auto_2632731 ?auto_2632738 ) ) ( not ( = ?auto_2632731 ?auto_2632739 ) ) ( not ( = ?auto_2632731 ?auto_2632740 ) ) ( not ( = ?auto_2632731 ?auto_2632741 ) ) ( not ( = ?auto_2632731 ?auto_2632742 ) ) ( not ( = ?auto_2632731 ?auto_2632743 ) ) ( not ( = ?auto_2632731 ?auto_2632744 ) ) ( not ( = ?auto_2632731 ?auto_2632745 ) ) ( not ( = ?auto_2632731 ?auto_2632746 ) ) ( not ( = ?auto_2632731 ?auto_2632749 ) ) ( not ( = ?auto_2632732 ?auto_2632733 ) ) ( not ( = ?auto_2632732 ?auto_2632730 ) ) ( not ( = ?auto_2632732 ?auto_2632734 ) ) ( not ( = ?auto_2632732 ?auto_2632736 ) ) ( not ( = ?auto_2632732 ?auto_2632735 ) ) ( not ( = ?auto_2632732 ?auto_2632737 ) ) ( not ( = ?auto_2632732 ?auto_2632738 ) ) ( not ( = ?auto_2632732 ?auto_2632739 ) ) ( not ( = ?auto_2632732 ?auto_2632740 ) ) ( not ( = ?auto_2632732 ?auto_2632741 ) ) ( not ( = ?auto_2632732 ?auto_2632742 ) ) ( not ( = ?auto_2632732 ?auto_2632743 ) ) ( not ( = ?auto_2632732 ?auto_2632744 ) ) ( not ( = ?auto_2632732 ?auto_2632745 ) ) ( not ( = ?auto_2632732 ?auto_2632746 ) ) ( not ( = ?auto_2632732 ?auto_2632749 ) ) ( not ( = ?auto_2632733 ?auto_2632730 ) ) ( not ( = ?auto_2632733 ?auto_2632734 ) ) ( not ( = ?auto_2632733 ?auto_2632736 ) ) ( not ( = ?auto_2632733 ?auto_2632735 ) ) ( not ( = ?auto_2632733 ?auto_2632737 ) ) ( not ( = ?auto_2632733 ?auto_2632738 ) ) ( not ( = ?auto_2632733 ?auto_2632739 ) ) ( not ( = ?auto_2632733 ?auto_2632740 ) ) ( not ( = ?auto_2632733 ?auto_2632741 ) ) ( not ( = ?auto_2632733 ?auto_2632742 ) ) ( not ( = ?auto_2632733 ?auto_2632743 ) ) ( not ( = ?auto_2632733 ?auto_2632744 ) ) ( not ( = ?auto_2632733 ?auto_2632745 ) ) ( not ( = ?auto_2632733 ?auto_2632746 ) ) ( not ( = ?auto_2632733 ?auto_2632749 ) ) ( not ( = ?auto_2632730 ?auto_2632734 ) ) ( not ( = ?auto_2632730 ?auto_2632736 ) ) ( not ( = ?auto_2632730 ?auto_2632735 ) ) ( not ( = ?auto_2632730 ?auto_2632737 ) ) ( not ( = ?auto_2632730 ?auto_2632738 ) ) ( not ( = ?auto_2632730 ?auto_2632739 ) ) ( not ( = ?auto_2632730 ?auto_2632740 ) ) ( not ( = ?auto_2632730 ?auto_2632741 ) ) ( not ( = ?auto_2632730 ?auto_2632742 ) ) ( not ( = ?auto_2632730 ?auto_2632743 ) ) ( not ( = ?auto_2632730 ?auto_2632744 ) ) ( not ( = ?auto_2632730 ?auto_2632745 ) ) ( not ( = ?auto_2632730 ?auto_2632746 ) ) ( not ( = ?auto_2632730 ?auto_2632749 ) ) ( not ( = ?auto_2632734 ?auto_2632736 ) ) ( not ( = ?auto_2632734 ?auto_2632735 ) ) ( not ( = ?auto_2632734 ?auto_2632737 ) ) ( not ( = ?auto_2632734 ?auto_2632738 ) ) ( not ( = ?auto_2632734 ?auto_2632739 ) ) ( not ( = ?auto_2632734 ?auto_2632740 ) ) ( not ( = ?auto_2632734 ?auto_2632741 ) ) ( not ( = ?auto_2632734 ?auto_2632742 ) ) ( not ( = ?auto_2632734 ?auto_2632743 ) ) ( not ( = ?auto_2632734 ?auto_2632744 ) ) ( not ( = ?auto_2632734 ?auto_2632745 ) ) ( not ( = ?auto_2632734 ?auto_2632746 ) ) ( not ( = ?auto_2632734 ?auto_2632749 ) ) ( not ( = ?auto_2632736 ?auto_2632735 ) ) ( not ( = ?auto_2632736 ?auto_2632737 ) ) ( not ( = ?auto_2632736 ?auto_2632738 ) ) ( not ( = ?auto_2632736 ?auto_2632739 ) ) ( not ( = ?auto_2632736 ?auto_2632740 ) ) ( not ( = ?auto_2632736 ?auto_2632741 ) ) ( not ( = ?auto_2632736 ?auto_2632742 ) ) ( not ( = ?auto_2632736 ?auto_2632743 ) ) ( not ( = ?auto_2632736 ?auto_2632744 ) ) ( not ( = ?auto_2632736 ?auto_2632745 ) ) ( not ( = ?auto_2632736 ?auto_2632746 ) ) ( not ( = ?auto_2632736 ?auto_2632749 ) ) ( not ( = ?auto_2632735 ?auto_2632737 ) ) ( not ( = ?auto_2632735 ?auto_2632738 ) ) ( not ( = ?auto_2632735 ?auto_2632739 ) ) ( not ( = ?auto_2632735 ?auto_2632740 ) ) ( not ( = ?auto_2632735 ?auto_2632741 ) ) ( not ( = ?auto_2632735 ?auto_2632742 ) ) ( not ( = ?auto_2632735 ?auto_2632743 ) ) ( not ( = ?auto_2632735 ?auto_2632744 ) ) ( not ( = ?auto_2632735 ?auto_2632745 ) ) ( not ( = ?auto_2632735 ?auto_2632746 ) ) ( not ( = ?auto_2632735 ?auto_2632749 ) ) ( not ( = ?auto_2632737 ?auto_2632738 ) ) ( not ( = ?auto_2632737 ?auto_2632739 ) ) ( not ( = ?auto_2632737 ?auto_2632740 ) ) ( not ( = ?auto_2632737 ?auto_2632741 ) ) ( not ( = ?auto_2632737 ?auto_2632742 ) ) ( not ( = ?auto_2632737 ?auto_2632743 ) ) ( not ( = ?auto_2632737 ?auto_2632744 ) ) ( not ( = ?auto_2632737 ?auto_2632745 ) ) ( not ( = ?auto_2632737 ?auto_2632746 ) ) ( not ( = ?auto_2632737 ?auto_2632749 ) ) ( not ( = ?auto_2632738 ?auto_2632739 ) ) ( not ( = ?auto_2632738 ?auto_2632740 ) ) ( not ( = ?auto_2632738 ?auto_2632741 ) ) ( not ( = ?auto_2632738 ?auto_2632742 ) ) ( not ( = ?auto_2632738 ?auto_2632743 ) ) ( not ( = ?auto_2632738 ?auto_2632744 ) ) ( not ( = ?auto_2632738 ?auto_2632745 ) ) ( not ( = ?auto_2632738 ?auto_2632746 ) ) ( not ( = ?auto_2632738 ?auto_2632749 ) ) ( not ( = ?auto_2632739 ?auto_2632740 ) ) ( not ( = ?auto_2632739 ?auto_2632741 ) ) ( not ( = ?auto_2632739 ?auto_2632742 ) ) ( not ( = ?auto_2632739 ?auto_2632743 ) ) ( not ( = ?auto_2632739 ?auto_2632744 ) ) ( not ( = ?auto_2632739 ?auto_2632745 ) ) ( not ( = ?auto_2632739 ?auto_2632746 ) ) ( not ( = ?auto_2632739 ?auto_2632749 ) ) ( not ( = ?auto_2632740 ?auto_2632741 ) ) ( not ( = ?auto_2632740 ?auto_2632742 ) ) ( not ( = ?auto_2632740 ?auto_2632743 ) ) ( not ( = ?auto_2632740 ?auto_2632744 ) ) ( not ( = ?auto_2632740 ?auto_2632745 ) ) ( not ( = ?auto_2632740 ?auto_2632746 ) ) ( not ( = ?auto_2632740 ?auto_2632749 ) ) ( not ( = ?auto_2632741 ?auto_2632742 ) ) ( not ( = ?auto_2632741 ?auto_2632743 ) ) ( not ( = ?auto_2632741 ?auto_2632744 ) ) ( not ( = ?auto_2632741 ?auto_2632745 ) ) ( not ( = ?auto_2632741 ?auto_2632746 ) ) ( not ( = ?auto_2632741 ?auto_2632749 ) ) ( not ( = ?auto_2632742 ?auto_2632743 ) ) ( not ( = ?auto_2632742 ?auto_2632744 ) ) ( not ( = ?auto_2632742 ?auto_2632745 ) ) ( not ( = ?auto_2632742 ?auto_2632746 ) ) ( not ( = ?auto_2632742 ?auto_2632749 ) ) ( not ( = ?auto_2632743 ?auto_2632744 ) ) ( not ( = ?auto_2632743 ?auto_2632745 ) ) ( not ( = ?auto_2632743 ?auto_2632746 ) ) ( not ( = ?auto_2632743 ?auto_2632749 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2632744 ?auto_2632745 ?auto_2632746 )
      ( MAKE-16CRATE-VERIFY ?auto_2632731 ?auto_2632732 ?auto_2632733 ?auto_2632730 ?auto_2632734 ?auto_2632736 ?auto_2632735 ?auto_2632737 ?auto_2632738 ?auto_2632739 ?auto_2632740 ?auto_2632741 ?auto_2632742 ?auto_2632743 ?auto_2632744 ?auto_2632745 ?auto_2632746 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2632980 - SURFACE
      ?auto_2632981 - SURFACE
      ?auto_2632982 - SURFACE
      ?auto_2632979 - SURFACE
      ?auto_2632983 - SURFACE
      ?auto_2632985 - SURFACE
      ?auto_2632984 - SURFACE
      ?auto_2632986 - SURFACE
      ?auto_2632987 - SURFACE
      ?auto_2632988 - SURFACE
      ?auto_2632989 - SURFACE
      ?auto_2632990 - SURFACE
      ?auto_2632991 - SURFACE
      ?auto_2632992 - SURFACE
      ?auto_2632993 - SURFACE
      ?auto_2632994 - SURFACE
      ?auto_2632995 - SURFACE
    )
    :vars
    (
      ?auto_2633000 - HOIST
      ?auto_2632996 - PLACE
      ?auto_2633001 - PLACE
      ?auto_2632999 - HOIST
      ?auto_2632997 - SURFACE
      ?auto_2632998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2633000 ?auto_2632996 ) ( SURFACE-AT ?auto_2632994 ?auto_2632996 ) ( CLEAR ?auto_2632994 ) ( IS-CRATE ?auto_2632995 ) ( not ( = ?auto_2632994 ?auto_2632995 ) ) ( AVAILABLE ?auto_2633000 ) ( ON ?auto_2632994 ?auto_2632993 ) ( not ( = ?auto_2632993 ?auto_2632994 ) ) ( not ( = ?auto_2632993 ?auto_2632995 ) ) ( not ( = ?auto_2633001 ?auto_2632996 ) ) ( HOIST-AT ?auto_2632999 ?auto_2633001 ) ( not ( = ?auto_2633000 ?auto_2632999 ) ) ( AVAILABLE ?auto_2632999 ) ( SURFACE-AT ?auto_2632995 ?auto_2633001 ) ( ON ?auto_2632995 ?auto_2632997 ) ( CLEAR ?auto_2632995 ) ( not ( = ?auto_2632994 ?auto_2632997 ) ) ( not ( = ?auto_2632995 ?auto_2632997 ) ) ( not ( = ?auto_2632993 ?auto_2632997 ) ) ( TRUCK-AT ?auto_2632998 ?auto_2632996 ) ( ON ?auto_2632981 ?auto_2632980 ) ( ON ?auto_2632982 ?auto_2632981 ) ( ON ?auto_2632979 ?auto_2632982 ) ( ON ?auto_2632983 ?auto_2632979 ) ( ON ?auto_2632985 ?auto_2632983 ) ( ON ?auto_2632984 ?auto_2632985 ) ( ON ?auto_2632986 ?auto_2632984 ) ( ON ?auto_2632987 ?auto_2632986 ) ( ON ?auto_2632988 ?auto_2632987 ) ( ON ?auto_2632989 ?auto_2632988 ) ( ON ?auto_2632990 ?auto_2632989 ) ( ON ?auto_2632991 ?auto_2632990 ) ( ON ?auto_2632992 ?auto_2632991 ) ( ON ?auto_2632993 ?auto_2632992 ) ( not ( = ?auto_2632980 ?auto_2632981 ) ) ( not ( = ?auto_2632980 ?auto_2632982 ) ) ( not ( = ?auto_2632980 ?auto_2632979 ) ) ( not ( = ?auto_2632980 ?auto_2632983 ) ) ( not ( = ?auto_2632980 ?auto_2632985 ) ) ( not ( = ?auto_2632980 ?auto_2632984 ) ) ( not ( = ?auto_2632980 ?auto_2632986 ) ) ( not ( = ?auto_2632980 ?auto_2632987 ) ) ( not ( = ?auto_2632980 ?auto_2632988 ) ) ( not ( = ?auto_2632980 ?auto_2632989 ) ) ( not ( = ?auto_2632980 ?auto_2632990 ) ) ( not ( = ?auto_2632980 ?auto_2632991 ) ) ( not ( = ?auto_2632980 ?auto_2632992 ) ) ( not ( = ?auto_2632980 ?auto_2632993 ) ) ( not ( = ?auto_2632980 ?auto_2632994 ) ) ( not ( = ?auto_2632980 ?auto_2632995 ) ) ( not ( = ?auto_2632980 ?auto_2632997 ) ) ( not ( = ?auto_2632981 ?auto_2632982 ) ) ( not ( = ?auto_2632981 ?auto_2632979 ) ) ( not ( = ?auto_2632981 ?auto_2632983 ) ) ( not ( = ?auto_2632981 ?auto_2632985 ) ) ( not ( = ?auto_2632981 ?auto_2632984 ) ) ( not ( = ?auto_2632981 ?auto_2632986 ) ) ( not ( = ?auto_2632981 ?auto_2632987 ) ) ( not ( = ?auto_2632981 ?auto_2632988 ) ) ( not ( = ?auto_2632981 ?auto_2632989 ) ) ( not ( = ?auto_2632981 ?auto_2632990 ) ) ( not ( = ?auto_2632981 ?auto_2632991 ) ) ( not ( = ?auto_2632981 ?auto_2632992 ) ) ( not ( = ?auto_2632981 ?auto_2632993 ) ) ( not ( = ?auto_2632981 ?auto_2632994 ) ) ( not ( = ?auto_2632981 ?auto_2632995 ) ) ( not ( = ?auto_2632981 ?auto_2632997 ) ) ( not ( = ?auto_2632982 ?auto_2632979 ) ) ( not ( = ?auto_2632982 ?auto_2632983 ) ) ( not ( = ?auto_2632982 ?auto_2632985 ) ) ( not ( = ?auto_2632982 ?auto_2632984 ) ) ( not ( = ?auto_2632982 ?auto_2632986 ) ) ( not ( = ?auto_2632982 ?auto_2632987 ) ) ( not ( = ?auto_2632982 ?auto_2632988 ) ) ( not ( = ?auto_2632982 ?auto_2632989 ) ) ( not ( = ?auto_2632982 ?auto_2632990 ) ) ( not ( = ?auto_2632982 ?auto_2632991 ) ) ( not ( = ?auto_2632982 ?auto_2632992 ) ) ( not ( = ?auto_2632982 ?auto_2632993 ) ) ( not ( = ?auto_2632982 ?auto_2632994 ) ) ( not ( = ?auto_2632982 ?auto_2632995 ) ) ( not ( = ?auto_2632982 ?auto_2632997 ) ) ( not ( = ?auto_2632979 ?auto_2632983 ) ) ( not ( = ?auto_2632979 ?auto_2632985 ) ) ( not ( = ?auto_2632979 ?auto_2632984 ) ) ( not ( = ?auto_2632979 ?auto_2632986 ) ) ( not ( = ?auto_2632979 ?auto_2632987 ) ) ( not ( = ?auto_2632979 ?auto_2632988 ) ) ( not ( = ?auto_2632979 ?auto_2632989 ) ) ( not ( = ?auto_2632979 ?auto_2632990 ) ) ( not ( = ?auto_2632979 ?auto_2632991 ) ) ( not ( = ?auto_2632979 ?auto_2632992 ) ) ( not ( = ?auto_2632979 ?auto_2632993 ) ) ( not ( = ?auto_2632979 ?auto_2632994 ) ) ( not ( = ?auto_2632979 ?auto_2632995 ) ) ( not ( = ?auto_2632979 ?auto_2632997 ) ) ( not ( = ?auto_2632983 ?auto_2632985 ) ) ( not ( = ?auto_2632983 ?auto_2632984 ) ) ( not ( = ?auto_2632983 ?auto_2632986 ) ) ( not ( = ?auto_2632983 ?auto_2632987 ) ) ( not ( = ?auto_2632983 ?auto_2632988 ) ) ( not ( = ?auto_2632983 ?auto_2632989 ) ) ( not ( = ?auto_2632983 ?auto_2632990 ) ) ( not ( = ?auto_2632983 ?auto_2632991 ) ) ( not ( = ?auto_2632983 ?auto_2632992 ) ) ( not ( = ?auto_2632983 ?auto_2632993 ) ) ( not ( = ?auto_2632983 ?auto_2632994 ) ) ( not ( = ?auto_2632983 ?auto_2632995 ) ) ( not ( = ?auto_2632983 ?auto_2632997 ) ) ( not ( = ?auto_2632985 ?auto_2632984 ) ) ( not ( = ?auto_2632985 ?auto_2632986 ) ) ( not ( = ?auto_2632985 ?auto_2632987 ) ) ( not ( = ?auto_2632985 ?auto_2632988 ) ) ( not ( = ?auto_2632985 ?auto_2632989 ) ) ( not ( = ?auto_2632985 ?auto_2632990 ) ) ( not ( = ?auto_2632985 ?auto_2632991 ) ) ( not ( = ?auto_2632985 ?auto_2632992 ) ) ( not ( = ?auto_2632985 ?auto_2632993 ) ) ( not ( = ?auto_2632985 ?auto_2632994 ) ) ( not ( = ?auto_2632985 ?auto_2632995 ) ) ( not ( = ?auto_2632985 ?auto_2632997 ) ) ( not ( = ?auto_2632984 ?auto_2632986 ) ) ( not ( = ?auto_2632984 ?auto_2632987 ) ) ( not ( = ?auto_2632984 ?auto_2632988 ) ) ( not ( = ?auto_2632984 ?auto_2632989 ) ) ( not ( = ?auto_2632984 ?auto_2632990 ) ) ( not ( = ?auto_2632984 ?auto_2632991 ) ) ( not ( = ?auto_2632984 ?auto_2632992 ) ) ( not ( = ?auto_2632984 ?auto_2632993 ) ) ( not ( = ?auto_2632984 ?auto_2632994 ) ) ( not ( = ?auto_2632984 ?auto_2632995 ) ) ( not ( = ?auto_2632984 ?auto_2632997 ) ) ( not ( = ?auto_2632986 ?auto_2632987 ) ) ( not ( = ?auto_2632986 ?auto_2632988 ) ) ( not ( = ?auto_2632986 ?auto_2632989 ) ) ( not ( = ?auto_2632986 ?auto_2632990 ) ) ( not ( = ?auto_2632986 ?auto_2632991 ) ) ( not ( = ?auto_2632986 ?auto_2632992 ) ) ( not ( = ?auto_2632986 ?auto_2632993 ) ) ( not ( = ?auto_2632986 ?auto_2632994 ) ) ( not ( = ?auto_2632986 ?auto_2632995 ) ) ( not ( = ?auto_2632986 ?auto_2632997 ) ) ( not ( = ?auto_2632987 ?auto_2632988 ) ) ( not ( = ?auto_2632987 ?auto_2632989 ) ) ( not ( = ?auto_2632987 ?auto_2632990 ) ) ( not ( = ?auto_2632987 ?auto_2632991 ) ) ( not ( = ?auto_2632987 ?auto_2632992 ) ) ( not ( = ?auto_2632987 ?auto_2632993 ) ) ( not ( = ?auto_2632987 ?auto_2632994 ) ) ( not ( = ?auto_2632987 ?auto_2632995 ) ) ( not ( = ?auto_2632987 ?auto_2632997 ) ) ( not ( = ?auto_2632988 ?auto_2632989 ) ) ( not ( = ?auto_2632988 ?auto_2632990 ) ) ( not ( = ?auto_2632988 ?auto_2632991 ) ) ( not ( = ?auto_2632988 ?auto_2632992 ) ) ( not ( = ?auto_2632988 ?auto_2632993 ) ) ( not ( = ?auto_2632988 ?auto_2632994 ) ) ( not ( = ?auto_2632988 ?auto_2632995 ) ) ( not ( = ?auto_2632988 ?auto_2632997 ) ) ( not ( = ?auto_2632989 ?auto_2632990 ) ) ( not ( = ?auto_2632989 ?auto_2632991 ) ) ( not ( = ?auto_2632989 ?auto_2632992 ) ) ( not ( = ?auto_2632989 ?auto_2632993 ) ) ( not ( = ?auto_2632989 ?auto_2632994 ) ) ( not ( = ?auto_2632989 ?auto_2632995 ) ) ( not ( = ?auto_2632989 ?auto_2632997 ) ) ( not ( = ?auto_2632990 ?auto_2632991 ) ) ( not ( = ?auto_2632990 ?auto_2632992 ) ) ( not ( = ?auto_2632990 ?auto_2632993 ) ) ( not ( = ?auto_2632990 ?auto_2632994 ) ) ( not ( = ?auto_2632990 ?auto_2632995 ) ) ( not ( = ?auto_2632990 ?auto_2632997 ) ) ( not ( = ?auto_2632991 ?auto_2632992 ) ) ( not ( = ?auto_2632991 ?auto_2632993 ) ) ( not ( = ?auto_2632991 ?auto_2632994 ) ) ( not ( = ?auto_2632991 ?auto_2632995 ) ) ( not ( = ?auto_2632991 ?auto_2632997 ) ) ( not ( = ?auto_2632992 ?auto_2632993 ) ) ( not ( = ?auto_2632992 ?auto_2632994 ) ) ( not ( = ?auto_2632992 ?auto_2632995 ) ) ( not ( = ?auto_2632992 ?auto_2632997 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2632993 ?auto_2632994 ?auto_2632995 )
      ( MAKE-16CRATE-VERIFY ?auto_2632980 ?auto_2632981 ?auto_2632982 ?auto_2632979 ?auto_2632983 ?auto_2632985 ?auto_2632984 ?auto_2632986 ?auto_2632987 ?auto_2632988 ?auto_2632989 ?auto_2632990 ?auto_2632991 ?auto_2632992 ?auto_2632993 ?auto_2632994 ?auto_2632995 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2633229 - SURFACE
      ?auto_2633230 - SURFACE
      ?auto_2633231 - SURFACE
      ?auto_2633228 - SURFACE
      ?auto_2633232 - SURFACE
      ?auto_2633234 - SURFACE
      ?auto_2633233 - SURFACE
      ?auto_2633235 - SURFACE
      ?auto_2633236 - SURFACE
      ?auto_2633237 - SURFACE
      ?auto_2633238 - SURFACE
      ?auto_2633239 - SURFACE
      ?auto_2633240 - SURFACE
      ?auto_2633241 - SURFACE
      ?auto_2633242 - SURFACE
      ?auto_2633243 - SURFACE
      ?auto_2633244 - SURFACE
    )
    :vars
    (
      ?auto_2633246 - HOIST
      ?auto_2633245 - PLACE
      ?auto_2633248 - PLACE
      ?auto_2633247 - HOIST
      ?auto_2633249 - SURFACE
      ?auto_2633250 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2633246 ?auto_2633245 ) ( IS-CRATE ?auto_2633244 ) ( not ( = ?auto_2633243 ?auto_2633244 ) ) ( not ( = ?auto_2633242 ?auto_2633243 ) ) ( not ( = ?auto_2633242 ?auto_2633244 ) ) ( not ( = ?auto_2633248 ?auto_2633245 ) ) ( HOIST-AT ?auto_2633247 ?auto_2633248 ) ( not ( = ?auto_2633246 ?auto_2633247 ) ) ( AVAILABLE ?auto_2633247 ) ( SURFACE-AT ?auto_2633244 ?auto_2633248 ) ( ON ?auto_2633244 ?auto_2633249 ) ( CLEAR ?auto_2633244 ) ( not ( = ?auto_2633243 ?auto_2633249 ) ) ( not ( = ?auto_2633244 ?auto_2633249 ) ) ( not ( = ?auto_2633242 ?auto_2633249 ) ) ( TRUCK-AT ?auto_2633250 ?auto_2633245 ) ( SURFACE-AT ?auto_2633242 ?auto_2633245 ) ( CLEAR ?auto_2633242 ) ( LIFTING ?auto_2633246 ?auto_2633243 ) ( IS-CRATE ?auto_2633243 ) ( ON ?auto_2633230 ?auto_2633229 ) ( ON ?auto_2633231 ?auto_2633230 ) ( ON ?auto_2633228 ?auto_2633231 ) ( ON ?auto_2633232 ?auto_2633228 ) ( ON ?auto_2633234 ?auto_2633232 ) ( ON ?auto_2633233 ?auto_2633234 ) ( ON ?auto_2633235 ?auto_2633233 ) ( ON ?auto_2633236 ?auto_2633235 ) ( ON ?auto_2633237 ?auto_2633236 ) ( ON ?auto_2633238 ?auto_2633237 ) ( ON ?auto_2633239 ?auto_2633238 ) ( ON ?auto_2633240 ?auto_2633239 ) ( ON ?auto_2633241 ?auto_2633240 ) ( ON ?auto_2633242 ?auto_2633241 ) ( not ( = ?auto_2633229 ?auto_2633230 ) ) ( not ( = ?auto_2633229 ?auto_2633231 ) ) ( not ( = ?auto_2633229 ?auto_2633228 ) ) ( not ( = ?auto_2633229 ?auto_2633232 ) ) ( not ( = ?auto_2633229 ?auto_2633234 ) ) ( not ( = ?auto_2633229 ?auto_2633233 ) ) ( not ( = ?auto_2633229 ?auto_2633235 ) ) ( not ( = ?auto_2633229 ?auto_2633236 ) ) ( not ( = ?auto_2633229 ?auto_2633237 ) ) ( not ( = ?auto_2633229 ?auto_2633238 ) ) ( not ( = ?auto_2633229 ?auto_2633239 ) ) ( not ( = ?auto_2633229 ?auto_2633240 ) ) ( not ( = ?auto_2633229 ?auto_2633241 ) ) ( not ( = ?auto_2633229 ?auto_2633242 ) ) ( not ( = ?auto_2633229 ?auto_2633243 ) ) ( not ( = ?auto_2633229 ?auto_2633244 ) ) ( not ( = ?auto_2633229 ?auto_2633249 ) ) ( not ( = ?auto_2633230 ?auto_2633231 ) ) ( not ( = ?auto_2633230 ?auto_2633228 ) ) ( not ( = ?auto_2633230 ?auto_2633232 ) ) ( not ( = ?auto_2633230 ?auto_2633234 ) ) ( not ( = ?auto_2633230 ?auto_2633233 ) ) ( not ( = ?auto_2633230 ?auto_2633235 ) ) ( not ( = ?auto_2633230 ?auto_2633236 ) ) ( not ( = ?auto_2633230 ?auto_2633237 ) ) ( not ( = ?auto_2633230 ?auto_2633238 ) ) ( not ( = ?auto_2633230 ?auto_2633239 ) ) ( not ( = ?auto_2633230 ?auto_2633240 ) ) ( not ( = ?auto_2633230 ?auto_2633241 ) ) ( not ( = ?auto_2633230 ?auto_2633242 ) ) ( not ( = ?auto_2633230 ?auto_2633243 ) ) ( not ( = ?auto_2633230 ?auto_2633244 ) ) ( not ( = ?auto_2633230 ?auto_2633249 ) ) ( not ( = ?auto_2633231 ?auto_2633228 ) ) ( not ( = ?auto_2633231 ?auto_2633232 ) ) ( not ( = ?auto_2633231 ?auto_2633234 ) ) ( not ( = ?auto_2633231 ?auto_2633233 ) ) ( not ( = ?auto_2633231 ?auto_2633235 ) ) ( not ( = ?auto_2633231 ?auto_2633236 ) ) ( not ( = ?auto_2633231 ?auto_2633237 ) ) ( not ( = ?auto_2633231 ?auto_2633238 ) ) ( not ( = ?auto_2633231 ?auto_2633239 ) ) ( not ( = ?auto_2633231 ?auto_2633240 ) ) ( not ( = ?auto_2633231 ?auto_2633241 ) ) ( not ( = ?auto_2633231 ?auto_2633242 ) ) ( not ( = ?auto_2633231 ?auto_2633243 ) ) ( not ( = ?auto_2633231 ?auto_2633244 ) ) ( not ( = ?auto_2633231 ?auto_2633249 ) ) ( not ( = ?auto_2633228 ?auto_2633232 ) ) ( not ( = ?auto_2633228 ?auto_2633234 ) ) ( not ( = ?auto_2633228 ?auto_2633233 ) ) ( not ( = ?auto_2633228 ?auto_2633235 ) ) ( not ( = ?auto_2633228 ?auto_2633236 ) ) ( not ( = ?auto_2633228 ?auto_2633237 ) ) ( not ( = ?auto_2633228 ?auto_2633238 ) ) ( not ( = ?auto_2633228 ?auto_2633239 ) ) ( not ( = ?auto_2633228 ?auto_2633240 ) ) ( not ( = ?auto_2633228 ?auto_2633241 ) ) ( not ( = ?auto_2633228 ?auto_2633242 ) ) ( not ( = ?auto_2633228 ?auto_2633243 ) ) ( not ( = ?auto_2633228 ?auto_2633244 ) ) ( not ( = ?auto_2633228 ?auto_2633249 ) ) ( not ( = ?auto_2633232 ?auto_2633234 ) ) ( not ( = ?auto_2633232 ?auto_2633233 ) ) ( not ( = ?auto_2633232 ?auto_2633235 ) ) ( not ( = ?auto_2633232 ?auto_2633236 ) ) ( not ( = ?auto_2633232 ?auto_2633237 ) ) ( not ( = ?auto_2633232 ?auto_2633238 ) ) ( not ( = ?auto_2633232 ?auto_2633239 ) ) ( not ( = ?auto_2633232 ?auto_2633240 ) ) ( not ( = ?auto_2633232 ?auto_2633241 ) ) ( not ( = ?auto_2633232 ?auto_2633242 ) ) ( not ( = ?auto_2633232 ?auto_2633243 ) ) ( not ( = ?auto_2633232 ?auto_2633244 ) ) ( not ( = ?auto_2633232 ?auto_2633249 ) ) ( not ( = ?auto_2633234 ?auto_2633233 ) ) ( not ( = ?auto_2633234 ?auto_2633235 ) ) ( not ( = ?auto_2633234 ?auto_2633236 ) ) ( not ( = ?auto_2633234 ?auto_2633237 ) ) ( not ( = ?auto_2633234 ?auto_2633238 ) ) ( not ( = ?auto_2633234 ?auto_2633239 ) ) ( not ( = ?auto_2633234 ?auto_2633240 ) ) ( not ( = ?auto_2633234 ?auto_2633241 ) ) ( not ( = ?auto_2633234 ?auto_2633242 ) ) ( not ( = ?auto_2633234 ?auto_2633243 ) ) ( not ( = ?auto_2633234 ?auto_2633244 ) ) ( not ( = ?auto_2633234 ?auto_2633249 ) ) ( not ( = ?auto_2633233 ?auto_2633235 ) ) ( not ( = ?auto_2633233 ?auto_2633236 ) ) ( not ( = ?auto_2633233 ?auto_2633237 ) ) ( not ( = ?auto_2633233 ?auto_2633238 ) ) ( not ( = ?auto_2633233 ?auto_2633239 ) ) ( not ( = ?auto_2633233 ?auto_2633240 ) ) ( not ( = ?auto_2633233 ?auto_2633241 ) ) ( not ( = ?auto_2633233 ?auto_2633242 ) ) ( not ( = ?auto_2633233 ?auto_2633243 ) ) ( not ( = ?auto_2633233 ?auto_2633244 ) ) ( not ( = ?auto_2633233 ?auto_2633249 ) ) ( not ( = ?auto_2633235 ?auto_2633236 ) ) ( not ( = ?auto_2633235 ?auto_2633237 ) ) ( not ( = ?auto_2633235 ?auto_2633238 ) ) ( not ( = ?auto_2633235 ?auto_2633239 ) ) ( not ( = ?auto_2633235 ?auto_2633240 ) ) ( not ( = ?auto_2633235 ?auto_2633241 ) ) ( not ( = ?auto_2633235 ?auto_2633242 ) ) ( not ( = ?auto_2633235 ?auto_2633243 ) ) ( not ( = ?auto_2633235 ?auto_2633244 ) ) ( not ( = ?auto_2633235 ?auto_2633249 ) ) ( not ( = ?auto_2633236 ?auto_2633237 ) ) ( not ( = ?auto_2633236 ?auto_2633238 ) ) ( not ( = ?auto_2633236 ?auto_2633239 ) ) ( not ( = ?auto_2633236 ?auto_2633240 ) ) ( not ( = ?auto_2633236 ?auto_2633241 ) ) ( not ( = ?auto_2633236 ?auto_2633242 ) ) ( not ( = ?auto_2633236 ?auto_2633243 ) ) ( not ( = ?auto_2633236 ?auto_2633244 ) ) ( not ( = ?auto_2633236 ?auto_2633249 ) ) ( not ( = ?auto_2633237 ?auto_2633238 ) ) ( not ( = ?auto_2633237 ?auto_2633239 ) ) ( not ( = ?auto_2633237 ?auto_2633240 ) ) ( not ( = ?auto_2633237 ?auto_2633241 ) ) ( not ( = ?auto_2633237 ?auto_2633242 ) ) ( not ( = ?auto_2633237 ?auto_2633243 ) ) ( not ( = ?auto_2633237 ?auto_2633244 ) ) ( not ( = ?auto_2633237 ?auto_2633249 ) ) ( not ( = ?auto_2633238 ?auto_2633239 ) ) ( not ( = ?auto_2633238 ?auto_2633240 ) ) ( not ( = ?auto_2633238 ?auto_2633241 ) ) ( not ( = ?auto_2633238 ?auto_2633242 ) ) ( not ( = ?auto_2633238 ?auto_2633243 ) ) ( not ( = ?auto_2633238 ?auto_2633244 ) ) ( not ( = ?auto_2633238 ?auto_2633249 ) ) ( not ( = ?auto_2633239 ?auto_2633240 ) ) ( not ( = ?auto_2633239 ?auto_2633241 ) ) ( not ( = ?auto_2633239 ?auto_2633242 ) ) ( not ( = ?auto_2633239 ?auto_2633243 ) ) ( not ( = ?auto_2633239 ?auto_2633244 ) ) ( not ( = ?auto_2633239 ?auto_2633249 ) ) ( not ( = ?auto_2633240 ?auto_2633241 ) ) ( not ( = ?auto_2633240 ?auto_2633242 ) ) ( not ( = ?auto_2633240 ?auto_2633243 ) ) ( not ( = ?auto_2633240 ?auto_2633244 ) ) ( not ( = ?auto_2633240 ?auto_2633249 ) ) ( not ( = ?auto_2633241 ?auto_2633242 ) ) ( not ( = ?auto_2633241 ?auto_2633243 ) ) ( not ( = ?auto_2633241 ?auto_2633244 ) ) ( not ( = ?auto_2633241 ?auto_2633249 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2633242 ?auto_2633243 ?auto_2633244 )
      ( MAKE-16CRATE-VERIFY ?auto_2633229 ?auto_2633230 ?auto_2633231 ?auto_2633228 ?auto_2633232 ?auto_2633234 ?auto_2633233 ?auto_2633235 ?auto_2633236 ?auto_2633237 ?auto_2633238 ?auto_2633239 ?auto_2633240 ?auto_2633241 ?auto_2633242 ?auto_2633243 ?auto_2633244 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2633478 - SURFACE
      ?auto_2633479 - SURFACE
      ?auto_2633480 - SURFACE
      ?auto_2633477 - SURFACE
      ?auto_2633481 - SURFACE
      ?auto_2633483 - SURFACE
      ?auto_2633482 - SURFACE
      ?auto_2633484 - SURFACE
      ?auto_2633485 - SURFACE
      ?auto_2633486 - SURFACE
      ?auto_2633487 - SURFACE
      ?auto_2633488 - SURFACE
      ?auto_2633489 - SURFACE
      ?auto_2633490 - SURFACE
      ?auto_2633491 - SURFACE
      ?auto_2633492 - SURFACE
      ?auto_2633493 - SURFACE
    )
    :vars
    (
      ?auto_2633495 - HOIST
      ?auto_2633497 - PLACE
      ?auto_2633496 - PLACE
      ?auto_2633499 - HOIST
      ?auto_2633498 - SURFACE
      ?auto_2633494 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2633495 ?auto_2633497 ) ( IS-CRATE ?auto_2633493 ) ( not ( = ?auto_2633492 ?auto_2633493 ) ) ( not ( = ?auto_2633491 ?auto_2633492 ) ) ( not ( = ?auto_2633491 ?auto_2633493 ) ) ( not ( = ?auto_2633496 ?auto_2633497 ) ) ( HOIST-AT ?auto_2633499 ?auto_2633496 ) ( not ( = ?auto_2633495 ?auto_2633499 ) ) ( AVAILABLE ?auto_2633499 ) ( SURFACE-AT ?auto_2633493 ?auto_2633496 ) ( ON ?auto_2633493 ?auto_2633498 ) ( CLEAR ?auto_2633493 ) ( not ( = ?auto_2633492 ?auto_2633498 ) ) ( not ( = ?auto_2633493 ?auto_2633498 ) ) ( not ( = ?auto_2633491 ?auto_2633498 ) ) ( TRUCK-AT ?auto_2633494 ?auto_2633497 ) ( SURFACE-AT ?auto_2633491 ?auto_2633497 ) ( CLEAR ?auto_2633491 ) ( IS-CRATE ?auto_2633492 ) ( AVAILABLE ?auto_2633495 ) ( IN ?auto_2633492 ?auto_2633494 ) ( ON ?auto_2633479 ?auto_2633478 ) ( ON ?auto_2633480 ?auto_2633479 ) ( ON ?auto_2633477 ?auto_2633480 ) ( ON ?auto_2633481 ?auto_2633477 ) ( ON ?auto_2633483 ?auto_2633481 ) ( ON ?auto_2633482 ?auto_2633483 ) ( ON ?auto_2633484 ?auto_2633482 ) ( ON ?auto_2633485 ?auto_2633484 ) ( ON ?auto_2633486 ?auto_2633485 ) ( ON ?auto_2633487 ?auto_2633486 ) ( ON ?auto_2633488 ?auto_2633487 ) ( ON ?auto_2633489 ?auto_2633488 ) ( ON ?auto_2633490 ?auto_2633489 ) ( ON ?auto_2633491 ?auto_2633490 ) ( not ( = ?auto_2633478 ?auto_2633479 ) ) ( not ( = ?auto_2633478 ?auto_2633480 ) ) ( not ( = ?auto_2633478 ?auto_2633477 ) ) ( not ( = ?auto_2633478 ?auto_2633481 ) ) ( not ( = ?auto_2633478 ?auto_2633483 ) ) ( not ( = ?auto_2633478 ?auto_2633482 ) ) ( not ( = ?auto_2633478 ?auto_2633484 ) ) ( not ( = ?auto_2633478 ?auto_2633485 ) ) ( not ( = ?auto_2633478 ?auto_2633486 ) ) ( not ( = ?auto_2633478 ?auto_2633487 ) ) ( not ( = ?auto_2633478 ?auto_2633488 ) ) ( not ( = ?auto_2633478 ?auto_2633489 ) ) ( not ( = ?auto_2633478 ?auto_2633490 ) ) ( not ( = ?auto_2633478 ?auto_2633491 ) ) ( not ( = ?auto_2633478 ?auto_2633492 ) ) ( not ( = ?auto_2633478 ?auto_2633493 ) ) ( not ( = ?auto_2633478 ?auto_2633498 ) ) ( not ( = ?auto_2633479 ?auto_2633480 ) ) ( not ( = ?auto_2633479 ?auto_2633477 ) ) ( not ( = ?auto_2633479 ?auto_2633481 ) ) ( not ( = ?auto_2633479 ?auto_2633483 ) ) ( not ( = ?auto_2633479 ?auto_2633482 ) ) ( not ( = ?auto_2633479 ?auto_2633484 ) ) ( not ( = ?auto_2633479 ?auto_2633485 ) ) ( not ( = ?auto_2633479 ?auto_2633486 ) ) ( not ( = ?auto_2633479 ?auto_2633487 ) ) ( not ( = ?auto_2633479 ?auto_2633488 ) ) ( not ( = ?auto_2633479 ?auto_2633489 ) ) ( not ( = ?auto_2633479 ?auto_2633490 ) ) ( not ( = ?auto_2633479 ?auto_2633491 ) ) ( not ( = ?auto_2633479 ?auto_2633492 ) ) ( not ( = ?auto_2633479 ?auto_2633493 ) ) ( not ( = ?auto_2633479 ?auto_2633498 ) ) ( not ( = ?auto_2633480 ?auto_2633477 ) ) ( not ( = ?auto_2633480 ?auto_2633481 ) ) ( not ( = ?auto_2633480 ?auto_2633483 ) ) ( not ( = ?auto_2633480 ?auto_2633482 ) ) ( not ( = ?auto_2633480 ?auto_2633484 ) ) ( not ( = ?auto_2633480 ?auto_2633485 ) ) ( not ( = ?auto_2633480 ?auto_2633486 ) ) ( not ( = ?auto_2633480 ?auto_2633487 ) ) ( not ( = ?auto_2633480 ?auto_2633488 ) ) ( not ( = ?auto_2633480 ?auto_2633489 ) ) ( not ( = ?auto_2633480 ?auto_2633490 ) ) ( not ( = ?auto_2633480 ?auto_2633491 ) ) ( not ( = ?auto_2633480 ?auto_2633492 ) ) ( not ( = ?auto_2633480 ?auto_2633493 ) ) ( not ( = ?auto_2633480 ?auto_2633498 ) ) ( not ( = ?auto_2633477 ?auto_2633481 ) ) ( not ( = ?auto_2633477 ?auto_2633483 ) ) ( not ( = ?auto_2633477 ?auto_2633482 ) ) ( not ( = ?auto_2633477 ?auto_2633484 ) ) ( not ( = ?auto_2633477 ?auto_2633485 ) ) ( not ( = ?auto_2633477 ?auto_2633486 ) ) ( not ( = ?auto_2633477 ?auto_2633487 ) ) ( not ( = ?auto_2633477 ?auto_2633488 ) ) ( not ( = ?auto_2633477 ?auto_2633489 ) ) ( not ( = ?auto_2633477 ?auto_2633490 ) ) ( not ( = ?auto_2633477 ?auto_2633491 ) ) ( not ( = ?auto_2633477 ?auto_2633492 ) ) ( not ( = ?auto_2633477 ?auto_2633493 ) ) ( not ( = ?auto_2633477 ?auto_2633498 ) ) ( not ( = ?auto_2633481 ?auto_2633483 ) ) ( not ( = ?auto_2633481 ?auto_2633482 ) ) ( not ( = ?auto_2633481 ?auto_2633484 ) ) ( not ( = ?auto_2633481 ?auto_2633485 ) ) ( not ( = ?auto_2633481 ?auto_2633486 ) ) ( not ( = ?auto_2633481 ?auto_2633487 ) ) ( not ( = ?auto_2633481 ?auto_2633488 ) ) ( not ( = ?auto_2633481 ?auto_2633489 ) ) ( not ( = ?auto_2633481 ?auto_2633490 ) ) ( not ( = ?auto_2633481 ?auto_2633491 ) ) ( not ( = ?auto_2633481 ?auto_2633492 ) ) ( not ( = ?auto_2633481 ?auto_2633493 ) ) ( not ( = ?auto_2633481 ?auto_2633498 ) ) ( not ( = ?auto_2633483 ?auto_2633482 ) ) ( not ( = ?auto_2633483 ?auto_2633484 ) ) ( not ( = ?auto_2633483 ?auto_2633485 ) ) ( not ( = ?auto_2633483 ?auto_2633486 ) ) ( not ( = ?auto_2633483 ?auto_2633487 ) ) ( not ( = ?auto_2633483 ?auto_2633488 ) ) ( not ( = ?auto_2633483 ?auto_2633489 ) ) ( not ( = ?auto_2633483 ?auto_2633490 ) ) ( not ( = ?auto_2633483 ?auto_2633491 ) ) ( not ( = ?auto_2633483 ?auto_2633492 ) ) ( not ( = ?auto_2633483 ?auto_2633493 ) ) ( not ( = ?auto_2633483 ?auto_2633498 ) ) ( not ( = ?auto_2633482 ?auto_2633484 ) ) ( not ( = ?auto_2633482 ?auto_2633485 ) ) ( not ( = ?auto_2633482 ?auto_2633486 ) ) ( not ( = ?auto_2633482 ?auto_2633487 ) ) ( not ( = ?auto_2633482 ?auto_2633488 ) ) ( not ( = ?auto_2633482 ?auto_2633489 ) ) ( not ( = ?auto_2633482 ?auto_2633490 ) ) ( not ( = ?auto_2633482 ?auto_2633491 ) ) ( not ( = ?auto_2633482 ?auto_2633492 ) ) ( not ( = ?auto_2633482 ?auto_2633493 ) ) ( not ( = ?auto_2633482 ?auto_2633498 ) ) ( not ( = ?auto_2633484 ?auto_2633485 ) ) ( not ( = ?auto_2633484 ?auto_2633486 ) ) ( not ( = ?auto_2633484 ?auto_2633487 ) ) ( not ( = ?auto_2633484 ?auto_2633488 ) ) ( not ( = ?auto_2633484 ?auto_2633489 ) ) ( not ( = ?auto_2633484 ?auto_2633490 ) ) ( not ( = ?auto_2633484 ?auto_2633491 ) ) ( not ( = ?auto_2633484 ?auto_2633492 ) ) ( not ( = ?auto_2633484 ?auto_2633493 ) ) ( not ( = ?auto_2633484 ?auto_2633498 ) ) ( not ( = ?auto_2633485 ?auto_2633486 ) ) ( not ( = ?auto_2633485 ?auto_2633487 ) ) ( not ( = ?auto_2633485 ?auto_2633488 ) ) ( not ( = ?auto_2633485 ?auto_2633489 ) ) ( not ( = ?auto_2633485 ?auto_2633490 ) ) ( not ( = ?auto_2633485 ?auto_2633491 ) ) ( not ( = ?auto_2633485 ?auto_2633492 ) ) ( not ( = ?auto_2633485 ?auto_2633493 ) ) ( not ( = ?auto_2633485 ?auto_2633498 ) ) ( not ( = ?auto_2633486 ?auto_2633487 ) ) ( not ( = ?auto_2633486 ?auto_2633488 ) ) ( not ( = ?auto_2633486 ?auto_2633489 ) ) ( not ( = ?auto_2633486 ?auto_2633490 ) ) ( not ( = ?auto_2633486 ?auto_2633491 ) ) ( not ( = ?auto_2633486 ?auto_2633492 ) ) ( not ( = ?auto_2633486 ?auto_2633493 ) ) ( not ( = ?auto_2633486 ?auto_2633498 ) ) ( not ( = ?auto_2633487 ?auto_2633488 ) ) ( not ( = ?auto_2633487 ?auto_2633489 ) ) ( not ( = ?auto_2633487 ?auto_2633490 ) ) ( not ( = ?auto_2633487 ?auto_2633491 ) ) ( not ( = ?auto_2633487 ?auto_2633492 ) ) ( not ( = ?auto_2633487 ?auto_2633493 ) ) ( not ( = ?auto_2633487 ?auto_2633498 ) ) ( not ( = ?auto_2633488 ?auto_2633489 ) ) ( not ( = ?auto_2633488 ?auto_2633490 ) ) ( not ( = ?auto_2633488 ?auto_2633491 ) ) ( not ( = ?auto_2633488 ?auto_2633492 ) ) ( not ( = ?auto_2633488 ?auto_2633493 ) ) ( not ( = ?auto_2633488 ?auto_2633498 ) ) ( not ( = ?auto_2633489 ?auto_2633490 ) ) ( not ( = ?auto_2633489 ?auto_2633491 ) ) ( not ( = ?auto_2633489 ?auto_2633492 ) ) ( not ( = ?auto_2633489 ?auto_2633493 ) ) ( not ( = ?auto_2633489 ?auto_2633498 ) ) ( not ( = ?auto_2633490 ?auto_2633491 ) ) ( not ( = ?auto_2633490 ?auto_2633492 ) ) ( not ( = ?auto_2633490 ?auto_2633493 ) ) ( not ( = ?auto_2633490 ?auto_2633498 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2633491 ?auto_2633492 ?auto_2633493 )
      ( MAKE-16CRATE-VERIFY ?auto_2633478 ?auto_2633479 ?auto_2633480 ?auto_2633477 ?auto_2633481 ?auto_2633483 ?auto_2633482 ?auto_2633484 ?auto_2633485 ?auto_2633486 ?auto_2633487 ?auto_2633488 ?auto_2633489 ?auto_2633490 ?auto_2633491 ?auto_2633492 ?auto_2633493 ) )
  )

)

