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
      ?auto_26190 - SURFACE
      ?auto_26191 - SURFACE
    )
    :vars
    (
      ?auto_26192 - HOIST
      ?auto_26193 - PLACE
      ?auto_26195 - PLACE
      ?auto_26196 - HOIST
      ?auto_26197 - SURFACE
      ?auto_26194 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26192 ?auto_26193 ) ( SURFACE-AT ?auto_26190 ?auto_26193 ) ( CLEAR ?auto_26190 ) ( IS-CRATE ?auto_26191 ) ( AVAILABLE ?auto_26192 ) ( not ( = ?auto_26195 ?auto_26193 ) ) ( HOIST-AT ?auto_26196 ?auto_26195 ) ( AVAILABLE ?auto_26196 ) ( SURFACE-AT ?auto_26191 ?auto_26195 ) ( ON ?auto_26191 ?auto_26197 ) ( CLEAR ?auto_26191 ) ( TRUCK-AT ?auto_26194 ?auto_26193 ) ( not ( = ?auto_26190 ?auto_26191 ) ) ( not ( = ?auto_26190 ?auto_26197 ) ) ( not ( = ?auto_26191 ?auto_26197 ) ) ( not ( = ?auto_26192 ?auto_26196 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26194 ?auto_26193 ?auto_26195 )
      ( !LIFT ?auto_26196 ?auto_26191 ?auto_26197 ?auto_26195 )
      ( !LOAD ?auto_26196 ?auto_26191 ?auto_26194 ?auto_26195 )
      ( !DRIVE ?auto_26194 ?auto_26195 ?auto_26193 )
      ( !UNLOAD ?auto_26192 ?auto_26191 ?auto_26194 ?auto_26193 )
      ( !DROP ?auto_26192 ?auto_26191 ?auto_26190 ?auto_26193 )
      ( MAKE-1CRATE-VERIFY ?auto_26190 ?auto_26191 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26200 - SURFACE
      ?auto_26201 - SURFACE
    )
    :vars
    (
      ?auto_26202 - HOIST
      ?auto_26203 - PLACE
      ?auto_26205 - PLACE
      ?auto_26206 - HOIST
      ?auto_26207 - SURFACE
      ?auto_26204 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26202 ?auto_26203 ) ( SURFACE-AT ?auto_26200 ?auto_26203 ) ( CLEAR ?auto_26200 ) ( IS-CRATE ?auto_26201 ) ( AVAILABLE ?auto_26202 ) ( not ( = ?auto_26205 ?auto_26203 ) ) ( HOIST-AT ?auto_26206 ?auto_26205 ) ( AVAILABLE ?auto_26206 ) ( SURFACE-AT ?auto_26201 ?auto_26205 ) ( ON ?auto_26201 ?auto_26207 ) ( CLEAR ?auto_26201 ) ( TRUCK-AT ?auto_26204 ?auto_26203 ) ( not ( = ?auto_26200 ?auto_26201 ) ) ( not ( = ?auto_26200 ?auto_26207 ) ) ( not ( = ?auto_26201 ?auto_26207 ) ) ( not ( = ?auto_26202 ?auto_26206 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26204 ?auto_26203 ?auto_26205 )
      ( !LIFT ?auto_26206 ?auto_26201 ?auto_26207 ?auto_26205 )
      ( !LOAD ?auto_26206 ?auto_26201 ?auto_26204 ?auto_26205 )
      ( !DRIVE ?auto_26204 ?auto_26205 ?auto_26203 )
      ( !UNLOAD ?auto_26202 ?auto_26201 ?auto_26204 ?auto_26203 )
      ( !DROP ?auto_26202 ?auto_26201 ?auto_26200 ?auto_26203 )
      ( MAKE-1CRATE-VERIFY ?auto_26200 ?auto_26201 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26211 - SURFACE
      ?auto_26212 - SURFACE
      ?auto_26213 - SURFACE
    )
    :vars
    (
      ?auto_26218 - HOIST
      ?auto_26215 - PLACE
      ?auto_26214 - PLACE
      ?auto_26217 - HOIST
      ?auto_26219 - SURFACE
      ?auto_26221 - PLACE
      ?auto_26220 - HOIST
      ?auto_26222 - SURFACE
      ?auto_26216 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26218 ?auto_26215 ) ( IS-CRATE ?auto_26213 ) ( not ( = ?auto_26214 ?auto_26215 ) ) ( HOIST-AT ?auto_26217 ?auto_26214 ) ( AVAILABLE ?auto_26217 ) ( SURFACE-AT ?auto_26213 ?auto_26214 ) ( ON ?auto_26213 ?auto_26219 ) ( CLEAR ?auto_26213 ) ( not ( = ?auto_26212 ?auto_26213 ) ) ( not ( = ?auto_26212 ?auto_26219 ) ) ( not ( = ?auto_26213 ?auto_26219 ) ) ( not ( = ?auto_26218 ?auto_26217 ) ) ( SURFACE-AT ?auto_26211 ?auto_26215 ) ( CLEAR ?auto_26211 ) ( IS-CRATE ?auto_26212 ) ( AVAILABLE ?auto_26218 ) ( not ( = ?auto_26221 ?auto_26215 ) ) ( HOIST-AT ?auto_26220 ?auto_26221 ) ( AVAILABLE ?auto_26220 ) ( SURFACE-AT ?auto_26212 ?auto_26221 ) ( ON ?auto_26212 ?auto_26222 ) ( CLEAR ?auto_26212 ) ( TRUCK-AT ?auto_26216 ?auto_26215 ) ( not ( = ?auto_26211 ?auto_26212 ) ) ( not ( = ?auto_26211 ?auto_26222 ) ) ( not ( = ?auto_26212 ?auto_26222 ) ) ( not ( = ?auto_26218 ?auto_26220 ) ) ( not ( = ?auto_26211 ?auto_26213 ) ) ( not ( = ?auto_26211 ?auto_26219 ) ) ( not ( = ?auto_26213 ?auto_26222 ) ) ( not ( = ?auto_26214 ?auto_26221 ) ) ( not ( = ?auto_26217 ?auto_26220 ) ) ( not ( = ?auto_26219 ?auto_26222 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26211 ?auto_26212 )
      ( MAKE-1CRATE ?auto_26212 ?auto_26213 )
      ( MAKE-2CRATE-VERIFY ?auto_26211 ?auto_26212 ?auto_26213 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26225 - SURFACE
      ?auto_26226 - SURFACE
    )
    :vars
    (
      ?auto_26227 - HOIST
      ?auto_26228 - PLACE
      ?auto_26230 - PLACE
      ?auto_26231 - HOIST
      ?auto_26232 - SURFACE
      ?auto_26229 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26227 ?auto_26228 ) ( SURFACE-AT ?auto_26225 ?auto_26228 ) ( CLEAR ?auto_26225 ) ( IS-CRATE ?auto_26226 ) ( AVAILABLE ?auto_26227 ) ( not ( = ?auto_26230 ?auto_26228 ) ) ( HOIST-AT ?auto_26231 ?auto_26230 ) ( AVAILABLE ?auto_26231 ) ( SURFACE-AT ?auto_26226 ?auto_26230 ) ( ON ?auto_26226 ?auto_26232 ) ( CLEAR ?auto_26226 ) ( TRUCK-AT ?auto_26229 ?auto_26228 ) ( not ( = ?auto_26225 ?auto_26226 ) ) ( not ( = ?auto_26225 ?auto_26232 ) ) ( not ( = ?auto_26226 ?auto_26232 ) ) ( not ( = ?auto_26227 ?auto_26231 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26229 ?auto_26228 ?auto_26230 )
      ( !LIFT ?auto_26231 ?auto_26226 ?auto_26232 ?auto_26230 )
      ( !LOAD ?auto_26231 ?auto_26226 ?auto_26229 ?auto_26230 )
      ( !DRIVE ?auto_26229 ?auto_26230 ?auto_26228 )
      ( !UNLOAD ?auto_26227 ?auto_26226 ?auto_26229 ?auto_26228 )
      ( !DROP ?auto_26227 ?auto_26226 ?auto_26225 ?auto_26228 )
      ( MAKE-1CRATE-VERIFY ?auto_26225 ?auto_26226 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26237 - SURFACE
      ?auto_26238 - SURFACE
      ?auto_26239 - SURFACE
      ?auto_26240 - SURFACE
    )
    :vars
    (
      ?auto_26243 - HOIST
      ?auto_26246 - PLACE
      ?auto_26244 - PLACE
      ?auto_26241 - HOIST
      ?auto_26242 - SURFACE
      ?auto_26248 - PLACE
      ?auto_26250 - HOIST
      ?auto_26249 - SURFACE
      ?auto_26251 - PLACE
      ?auto_26252 - HOIST
      ?auto_26247 - SURFACE
      ?auto_26245 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26243 ?auto_26246 ) ( IS-CRATE ?auto_26240 ) ( not ( = ?auto_26244 ?auto_26246 ) ) ( HOIST-AT ?auto_26241 ?auto_26244 ) ( AVAILABLE ?auto_26241 ) ( SURFACE-AT ?auto_26240 ?auto_26244 ) ( ON ?auto_26240 ?auto_26242 ) ( CLEAR ?auto_26240 ) ( not ( = ?auto_26239 ?auto_26240 ) ) ( not ( = ?auto_26239 ?auto_26242 ) ) ( not ( = ?auto_26240 ?auto_26242 ) ) ( not ( = ?auto_26243 ?auto_26241 ) ) ( IS-CRATE ?auto_26239 ) ( not ( = ?auto_26248 ?auto_26246 ) ) ( HOIST-AT ?auto_26250 ?auto_26248 ) ( AVAILABLE ?auto_26250 ) ( SURFACE-AT ?auto_26239 ?auto_26248 ) ( ON ?auto_26239 ?auto_26249 ) ( CLEAR ?auto_26239 ) ( not ( = ?auto_26238 ?auto_26239 ) ) ( not ( = ?auto_26238 ?auto_26249 ) ) ( not ( = ?auto_26239 ?auto_26249 ) ) ( not ( = ?auto_26243 ?auto_26250 ) ) ( SURFACE-AT ?auto_26237 ?auto_26246 ) ( CLEAR ?auto_26237 ) ( IS-CRATE ?auto_26238 ) ( AVAILABLE ?auto_26243 ) ( not ( = ?auto_26251 ?auto_26246 ) ) ( HOIST-AT ?auto_26252 ?auto_26251 ) ( AVAILABLE ?auto_26252 ) ( SURFACE-AT ?auto_26238 ?auto_26251 ) ( ON ?auto_26238 ?auto_26247 ) ( CLEAR ?auto_26238 ) ( TRUCK-AT ?auto_26245 ?auto_26246 ) ( not ( = ?auto_26237 ?auto_26238 ) ) ( not ( = ?auto_26237 ?auto_26247 ) ) ( not ( = ?auto_26238 ?auto_26247 ) ) ( not ( = ?auto_26243 ?auto_26252 ) ) ( not ( = ?auto_26237 ?auto_26239 ) ) ( not ( = ?auto_26237 ?auto_26249 ) ) ( not ( = ?auto_26239 ?auto_26247 ) ) ( not ( = ?auto_26248 ?auto_26251 ) ) ( not ( = ?auto_26250 ?auto_26252 ) ) ( not ( = ?auto_26249 ?auto_26247 ) ) ( not ( = ?auto_26237 ?auto_26240 ) ) ( not ( = ?auto_26237 ?auto_26242 ) ) ( not ( = ?auto_26238 ?auto_26240 ) ) ( not ( = ?auto_26238 ?auto_26242 ) ) ( not ( = ?auto_26240 ?auto_26249 ) ) ( not ( = ?auto_26240 ?auto_26247 ) ) ( not ( = ?auto_26244 ?auto_26248 ) ) ( not ( = ?auto_26244 ?auto_26251 ) ) ( not ( = ?auto_26241 ?auto_26250 ) ) ( not ( = ?auto_26241 ?auto_26252 ) ) ( not ( = ?auto_26242 ?auto_26249 ) ) ( not ( = ?auto_26242 ?auto_26247 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26237 ?auto_26238 ?auto_26239 )
      ( MAKE-1CRATE ?auto_26239 ?auto_26240 )
      ( MAKE-3CRATE-VERIFY ?auto_26237 ?auto_26238 ?auto_26239 ?auto_26240 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26255 - SURFACE
      ?auto_26256 - SURFACE
    )
    :vars
    (
      ?auto_26257 - HOIST
      ?auto_26258 - PLACE
      ?auto_26260 - PLACE
      ?auto_26261 - HOIST
      ?auto_26262 - SURFACE
      ?auto_26259 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26257 ?auto_26258 ) ( SURFACE-AT ?auto_26255 ?auto_26258 ) ( CLEAR ?auto_26255 ) ( IS-CRATE ?auto_26256 ) ( AVAILABLE ?auto_26257 ) ( not ( = ?auto_26260 ?auto_26258 ) ) ( HOIST-AT ?auto_26261 ?auto_26260 ) ( AVAILABLE ?auto_26261 ) ( SURFACE-AT ?auto_26256 ?auto_26260 ) ( ON ?auto_26256 ?auto_26262 ) ( CLEAR ?auto_26256 ) ( TRUCK-AT ?auto_26259 ?auto_26258 ) ( not ( = ?auto_26255 ?auto_26256 ) ) ( not ( = ?auto_26255 ?auto_26262 ) ) ( not ( = ?auto_26256 ?auto_26262 ) ) ( not ( = ?auto_26257 ?auto_26261 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26259 ?auto_26258 ?auto_26260 )
      ( !LIFT ?auto_26261 ?auto_26256 ?auto_26262 ?auto_26260 )
      ( !LOAD ?auto_26261 ?auto_26256 ?auto_26259 ?auto_26260 )
      ( !DRIVE ?auto_26259 ?auto_26260 ?auto_26258 )
      ( !UNLOAD ?auto_26257 ?auto_26256 ?auto_26259 ?auto_26258 )
      ( !DROP ?auto_26257 ?auto_26256 ?auto_26255 ?auto_26258 )
      ( MAKE-1CRATE-VERIFY ?auto_26255 ?auto_26256 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26268 - SURFACE
      ?auto_26269 - SURFACE
      ?auto_26270 - SURFACE
      ?auto_26271 - SURFACE
      ?auto_26272 - SURFACE
    )
    :vars
    (
      ?auto_26278 - HOIST
      ?auto_26277 - PLACE
      ?auto_26274 - PLACE
      ?auto_26275 - HOIST
      ?auto_26276 - SURFACE
      ?auto_26279 - PLACE
      ?auto_26284 - HOIST
      ?auto_26280 - SURFACE
      ?auto_26287 - PLACE
      ?auto_26283 - HOIST
      ?auto_26282 - SURFACE
      ?auto_26286 - PLACE
      ?auto_26281 - HOIST
      ?auto_26285 - SURFACE
      ?auto_26273 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26278 ?auto_26277 ) ( IS-CRATE ?auto_26272 ) ( not ( = ?auto_26274 ?auto_26277 ) ) ( HOIST-AT ?auto_26275 ?auto_26274 ) ( AVAILABLE ?auto_26275 ) ( SURFACE-AT ?auto_26272 ?auto_26274 ) ( ON ?auto_26272 ?auto_26276 ) ( CLEAR ?auto_26272 ) ( not ( = ?auto_26271 ?auto_26272 ) ) ( not ( = ?auto_26271 ?auto_26276 ) ) ( not ( = ?auto_26272 ?auto_26276 ) ) ( not ( = ?auto_26278 ?auto_26275 ) ) ( IS-CRATE ?auto_26271 ) ( not ( = ?auto_26279 ?auto_26277 ) ) ( HOIST-AT ?auto_26284 ?auto_26279 ) ( AVAILABLE ?auto_26284 ) ( SURFACE-AT ?auto_26271 ?auto_26279 ) ( ON ?auto_26271 ?auto_26280 ) ( CLEAR ?auto_26271 ) ( not ( = ?auto_26270 ?auto_26271 ) ) ( not ( = ?auto_26270 ?auto_26280 ) ) ( not ( = ?auto_26271 ?auto_26280 ) ) ( not ( = ?auto_26278 ?auto_26284 ) ) ( IS-CRATE ?auto_26270 ) ( not ( = ?auto_26287 ?auto_26277 ) ) ( HOIST-AT ?auto_26283 ?auto_26287 ) ( AVAILABLE ?auto_26283 ) ( SURFACE-AT ?auto_26270 ?auto_26287 ) ( ON ?auto_26270 ?auto_26282 ) ( CLEAR ?auto_26270 ) ( not ( = ?auto_26269 ?auto_26270 ) ) ( not ( = ?auto_26269 ?auto_26282 ) ) ( not ( = ?auto_26270 ?auto_26282 ) ) ( not ( = ?auto_26278 ?auto_26283 ) ) ( SURFACE-AT ?auto_26268 ?auto_26277 ) ( CLEAR ?auto_26268 ) ( IS-CRATE ?auto_26269 ) ( AVAILABLE ?auto_26278 ) ( not ( = ?auto_26286 ?auto_26277 ) ) ( HOIST-AT ?auto_26281 ?auto_26286 ) ( AVAILABLE ?auto_26281 ) ( SURFACE-AT ?auto_26269 ?auto_26286 ) ( ON ?auto_26269 ?auto_26285 ) ( CLEAR ?auto_26269 ) ( TRUCK-AT ?auto_26273 ?auto_26277 ) ( not ( = ?auto_26268 ?auto_26269 ) ) ( not ( = ?auto_26268 ?auto_26285 ) ) ( not ( = ?auto_26269 ?auto_26285 ) ) ( not ( = ?auto_26278 ?auto_26281 ) ) ( not ( = ?auto_26268 ?auto_26270 ) ) ( not ( = ?auto_26268 ?auto_26282 ) ) ( not ( = ?auto_26270 ?auto_26285 ) ) ( not ( = ?auto_26287 ?auto_26286 ) ) ( not ( = ?auto_26283 ?auto_26281 ) ) ( not ( = ?auto_26282 ?auto_26285 ) ) ( not ( = ?auto_26268 ?auto_26271 ) ) ( not ( = ?auto_26268 ?auto_26280 ) ) ( not ( = ?auto_26269 ?auto_26271 ) ) ( not ( = ?auto_26269 ?auto_26280 ) ) ( not ( = ?auto_26271 ?auto_26282 ) ) ( not ( = ?auto_26271 ?auto_26285 ) ) ( not ( = ?auto_26279 ?auto_26287 ) ) ( not ( = ?auto_26279 ?auto_26286 ) ) ( not ( = ?auto_26284 ?auto_26283 ) ) ( not ( = ?auto_26284 ?auto_26281 ) ) ( not ( = ?auto_26280 ?auto_26282 ) ) ( not ( = ?auto_26280 ?auto_26285 ) ) ( not ( = ?auto_26268 ?auto_26272 ) ) ( not ( = ?auto_26268 ?auto_26276 ) ) ( not ( = ?auto_26269 ?auto_26272 ) ) ( not ( = ?auto_26269 ?auto_26276 ) ) ( not ( = ?auto_26270 ?auto_26272 ) ) ( not ( = ?auto_26270 ?auto_26276 ) ) ( not ( = ?auto_26272 ?auto_26280 ) ) ( not ( = ?auto_26272 ?auto_26282 ) ) ( not ( = ?auto_26272 ?auto_26285 ) ) ( not ( = ?auto_26274 ?auto_26279 ) ) ( not ( = ?auto_26274 ?auto_26287 ) ) ( not ( = ?auto_26274 ?auto_26286 ) ) ( not ( = ?auto_26275 ?auto_26284 ) ) ( not ( = ?auto_26275 ?auto_26283 ) ) ( not ( = ?auto_26275 ?auto_26281 ) ) ( not ( = ?auto_26276 ?auto_26280 ) ) ( not ( = ?auto_26276 ?auto_26282 ) ) ( not ( = ?auto_26276 ?auto_26285 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_26268 ?auto_26269 ?auto_26270 ?auto_26271 )
      ( MAKE-1CRATE ?auto_26271 ?auto_26272 )
      ( MAKE-4CRATE-VERIFY ?auto_26268 ?auto_26269 ?auto_26270 ?auto_26271 ?auto_26272 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26290 - SURFACE
      ?auto_26291 - SURFACE
    )
    :vars
    (
      ?auto_26292 - HOIST
      ?auto_26293 - PLACE
      ?auto_26295 - PLACE
      ?auto_26296 - HOIST
      ?auto_26297 - SURFACE
      ?auto_26294 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26292 ?auto_26293 ) ( SURFACE-AT ?auto_26290 ?auto_26293 ) ( CLEAR ?auto_26290 ) ( IS-CRATE ?auto_26291 ) ( AVAILABLE ?auto_26292 ) ( not ( = ?auto_26295 ?auto_26293 ) ) ( HOIST-AT ?auto_26296 ?auto_26295 ) ( AVAILABLE ?auto_26296 ) ( SURFACE-AT ?auto_26291 ?auto_26295 ) ( ON ?auto_26291 ?auto_26297 ) ( CLEAR ?auto_26291 ) ( TRUCK-AT ?auto_26294 ?auto_26293 ) ( not ( = ?auto_26290 ?auto_26291 ) ) ( not ( = ?auto_26290 ?auto_26297 ) ) ( not ( = ?auto_26291 ?auto_26297 ) ) ( not ( = ?auto_26292 ?auto_26296 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26294 ?auto_26293 ?auto_26295 )
      ( !LIFT ?auto_26296 ?auto_26291 ?auto_26297 ?auto_26295 )
      ( !LOAD ?auto_26296 ?auto_26291 ?auto_26294 ?auto_26295 )
      ( !DRIVE ?auto_26294 ?auto_26295 ?auto_26293 )
      ( !UNLOAD ?auto_26292 ?auto_26291 ?auto_26294 ?auto_26293 )
      ( !DROP ?auto_26292 ?auto_26291 ?auto_26290 ?auto_26293 )
      ( MAKE-1CRATE-VERIFY ?auto_26290 ?auto_26291 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26304 - SURFACE
      ?auto_26305 - SURFACE
      ?auto_26306 - SURFACE
      ?auto_26307 - SURFACE
      ?auto_26308 - SURFACE
      ?auto_26309 - SURFACE
    )
    :vars
    (
      ?auto_26313 - HOIST
      ?auto_26315 - PLACE
      ?auto_26311 - PLACE
      ?auto_26310 - HOIST
      ?auto_26312 - SURFACE
      ?auto_26323 - PLACE
      ?auto_26322 - HOIST
      ?auto_26326 - SURFACE
      ?auto_26325 - PLACE
      ?auto_26319 - HOIST
      ?auto_26318 - SURFACE
      ?auto_26316 - PLACE
      ?auto_26327 - HOIST
      ?auto_26320 - SURFACE
      ?auto_26317 - PLACE
      ?auto_26321 - HOIST
      ?auto_26324 - SURFACE
      ?auto_26314 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26313 ?auto_26315 ) ( IS-CRATE ?auto_26309 ) ( not ( = ?auto_26311 ?auto_26315 ) ) ( HOIST-AT ?auto_26310 ?auto_26311 ) ( AVAILABLE ?auto_26310 ) ( SURFACE-AT ?auto_26309 ?auto_26311 ) ( ON ?auto_26309 ?auto_26312 ) ( CLEAR ?auto_26309 ) ( not ( = ?auto_26308 ?auto_26309 ) ) ( not ( = ?auto_26308 ?auto_26312 ) ) ( not ( = ?auto_26309 ?auto_26312 ) ) ( not ( = ?auto_26313 ?auto_26310 ) ) ( IS-CRATE ?auto_26308 ) ( not ( = ?auto_26323 ?auto_26315 ) ) ( HOIST-AT ?auto_26322 ?auto_26323 ) ( AVAILABLE ?auto_26322 ) ( SURFACE-AT ?auto_26308 ?auto_26323 ) ( ON ?auto_26308 ?auto_26326 ) ( CLEAR ?auto_26308 ) ( not ( = ?auto_26307 ?auto_26308 ) ) ( not ( = ?auto_26307 ?auto_26326 ) ) ( not ( = ?auto_26308 ?auto_26326 ) ) ( not ( = ?auto_26313 ?auto_26322 ) ) ( IS-CRATE ?auto_26307 ) ( not ( = ?auto_26325 ?auto_26315 ) ) ( HOIST-AT ?auto_26319 ?auto_26325 ) ( AVAILABLE ?auto_26319 ) ( SURFACE-AT ?auto_26307 ?auto_26325 ) ( ON ?auto_26307 ?auto_26318 ) ( CLEAR ?auto_26307 ) ( not ( = ?auto_26306 ?auto_26307 ) ) ( not ( = ?auto_26306 ?auto_26318 ) ) ( not ( = ?auto_26307 ?auto_26318 ) ) ( not ( = ?auto_26313 ?auto_26319 ) ) ( IS-CRATE ?auto_26306 ) ( not ( = ?auto_26316 ?auto_26315 ) ) ( HOIST-AT ?auto_26327 ?auto_26316 ) ( AVAILABLE ?auto_26327 ) ( SURFACE-AT ?auto_26306 ?auto_26316 ) ( ON ?auto_26306 ?auto_26320 ) ( CLEAR ?auto_26306 ) ( not ( = ?auto_26305 ?auto_26306 ) ) ( not ( = ?auto_26305 ?auto_26320 ) ) ( not ( = ?auto_26306 ?auto_26320 ) ) ( not ( = ?auto_26313 ?auto_26327 ) ) ( SURFACE-AT ?auto_26304 ?auto_26315 ) ( CLEAR ?auto_26304 ) ( IS-CRATE ?auto_26305 ) ( AVAILABLE ?auto_26313 ) ( not ( = ?auto_26317 ?auto_26315 ) ) ( HOIST-AT ?auto_26321 ?auto_26317 ) ( AVAILABLE ?auto_26321 ) ( SURFACE-AT ?auto_26305 ?auto_26317 ) ( ON ?auto_26305 ?auto_26324 ) ( CLEAR ?auto_26305 ) ( TRUCK-AT ?auto_26314 ?auto_26315 ) ( not ( = ?auto_26304 ?auto_26305 ) ) ( not ( = ?auto_26304 ?auto_26324 ) ) ( not ( = ?auto_26305 ?auto_26324 ) ) ( not ( = ?auto_26313 ?auto_26321 ) ) ( not ( = ?auto_26304 ?auto_26306 ) ) ( not ( = ?auto_26304 ?auto_26320 ) ) ( not ( = ?auto_26306 ?auto_26324 ) ) ( not ( = ?auto_26316 ?auto_26317 ) ) ( not ( = ?auto_26327 ?auto_26321 ) ) ( not ( = ?auto_26320 ?auto_26324 ) ) ( not ( = ?auto_26304 ?auto_26307 ) ) ( not ( = ?auto_26304 ?auto_26318 ) ) ( not ( = ?auto_26305 ?auto_26307 ) ) ( not ( = ?auto_26305 ?auto_26318 ) ) ( not ( = ?auto_26307 ?auto_26320 ) ) ( not ( = ?auto_26307 ?auto_26324 ) ) ( not ( = ?auto_26325 ?auto_26316 ) ) ( not ( = ?auto_26325 ?auto_26317 ) ) ( not ( = ?auto_26319 ?auto_26327 ) ) ( not ( = ?auto_26319 ?auto_26321 ) ) ( not ( = ?auto_26318 ?auto_26320 ) ) ( not ( = ?auto_26318 ?auto_26324 ) ) ( not ( = ?auto_26304 ?auto_26308 ) ) ( not ( = ?auto_26304 ?auto_26326 ) ) ( not ( = ?auto_26305 ?auto_26308 ) ) ( not ( = ?auto_26305 ?auto_26326 ) ) ( not ( = ?auto_26306 ?auto_26308 ) ) ( not ( = ?auto_26306 ?auto_26326 ) ) ( not ( = ?auto_26308 ?auto_26318 ) ) ( not ( = ?auto_26308 ?auto_26320 ) ) ( not ( = ?auto_26308 ?auto_26324 ) ) ( not ( = ?auto_26323 ?auto_26325 ) ) ( not ( = ?auto_26323 ?auto_26316 ) ) ( not ( = ?auto_26323 ?auto_26317 ) ) ( not ( = ?auto_26322 ?auto_26319 ) ) ( not ( = ?auto_26322 ?auto_26327 ) ) ( not ( = ?auto_26322 ?auto_26321 ) ) ( not ( = ?auto_26326 ?auto_26318 ) ) ( not ( = ?auto_26326 ?auto_26320 ) ) ( not ( = ?auto_26326 ?auto_26324 ) ) ( not ( = ?auto_26304 ?auto_26309 ) ) ( not ( = ?auto_26304 ?auto_26312 ) ) ( not ( = ?auto_26305 ?auto_26309 ) ) ( not ( = ?auto_26305 ?auto_26312 ) ) ( not ( = ?auto_26306 ?auto_26309 ) ) ( not ( = ?auto_26306 ?auto_26312 ) ) ( not ( = ?auto_26307 ?auto_26309 ) ) ( not ( = ?auto_26307 ?auto_26312 ) ) ( not ( = ?auto_26309 ?auto_26326 ) ) ( not ( = ?auto_26309 ?auto_26318 ) ) ( not ( = ?auto_26309 ?auto_26320 ) ) ( not ( = ?auto_26309 ?auto_26324 ) ) ( not ( = ?auto_26311 ?auto_26323 ) ) ( not ( = ?auto_26311 ?auto_26325 ) ) ( not ( = ?auto_26311 ?auto_26316 ) ) ( not ( = ?auto_26311 ?auto_26317 ) ) ( not ( = ?auto_26310 ?auto_26322 ) ) ( not ( = ?auto_26310 ?auto_26319 ) ) ( not ( = ?auto_26310 ?auto_26327 ) ) ( not ( = ?auto_26310 ?auto_26321 ) ) ( not ( = ?auto_26312 ?auto_26326 ) ) ( not ( = ?auto_26312 ?auto_26318 ) ) ( not ( = ?auto_26312 ?auto_26320 ) ) ( not ( = ?auto_26312 ?auto_26324 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_26304 ?auto_26305 ?auto_26306 ?auto_26307 ?auto_26308 )
      ( MAKE-1CRATE ?auto_26308 ?auto_26309 )
      ( MAKE-5CRATE-VERIFY ?auto_26304 ?auto_26305 ?auto_26306 ?auto_26307 ?auto_26308 ?auto_26309 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26330 - SURFACE
      ?auto_26331 - SURFACE
    )
    :vars
    (
      ?auto_26332 - HOIST
      ?auto_26333 - PLACE
      ?auto_26335 - PLACE
      ?auto_26336 - HOIST
      ?auto_26337 - SURFACE
      ?auto_26334 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26332 ?auto_26333 ) ( SURFACE-AT ?auto_26330 ?auto_26333 ) ( CLEAR ?auto_26330 ) ( IS-CRATE ?auto_26331 ) ( AVAILABLE ?auto_26332 ) ( not ( = ?auto_26335 ?auto_26333 ) ) ( HOIST-AT ?auto_26336 ?auto_26335 ) ( AVAILABLE ?auto_26336 ) ( SURFACE-AT ?auto_26331 ?auto_26335 ) ( ON ?auto_26331 ?auto_26337 ) ( CLEAR ?auto_26331 ) ( TRUCK-AT ?auto_26334 ?auto_26333 ) ( not ( = ?auto_26330 ?auto_26331 ) ) ( not ( = ?auto_26330 ?auto_26337 ) ) ( not ( = ?auto_26331 ?auto_26337 ) ) ( not ( = ?auto_26332 ?auto_26336 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26334 ?auto_26333 ?auto_26335 )
      ( !LIFT ?auto_26336 ?auto_26331 ?auto_26337 ?auto_26335 )
      ( !LOAD ?auto_26336 ?auto_26331 ?auto_26334 ?auto_26335 )
      ( !DRIVE ?auto_26334 ?auto_26335 ?auto_26333 )
      ( !UNLOAD ?auto_26332 ?auto_26331 ?auto_26334 ?auto_26333 )
      ( !DROP ?auto_26332 ?auto_26331 ?auto_26330 ?auto_26333 )
      ( MAKE-1CRATE-VERIFY ?auto_26330 ?auto_26331 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_26345 - SURFACE
      ?auto_26346 - SURFACE
      ?auto_26347 - SURFACE
      ?auto_26348 - SURFACE
      ?auto_26349 - SURFACE
      ?auto_26351 - SURFACE
      ?auto_26350 - SURFACE
    )
    :vars
    (
      ?auto_26353 - HOIST
      ?auto_26352 - PLACE
      ?auto_26356 - PLACE
      ?auto_26355 - HOIST
      ?auto_26357 - SURFACE
      ?auto_26361 - PLACE
      ?auto_26360 - HOIST
      ?auto_26363 - SURFACE
      ?auto_26368 - PLACE
      ?auto_26364 - HOIST
      ?auto_26362 - SURFACE
      ?auto_26371 - PLACE
      ?auto_26367 - HOIST
      ?auto_26369 - SURFACE
      ?auto_26372 - PLACE
      ?auto_26365 - HOIST
      ?auto_26359 - SURFACE
      ?auto_26366 - PLACE
      ?auto_26358 - HOIST
      ?auto_26370 - SURFACE
      ?auto_26354 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26353 ?auto_26352 ) ( IS-CRATE ?auto_26350 ) ( not ( = ?auto_26356 ?auto_26352 ) ) ( HOIST-AT ?auto_26355 ?auto_26356 ) ( AVAILABLE ?auto_26355 ) ( SURFACE-AT ?auto_26350 ?auto_26356 ) ( ON ?auto_26350 ?auto_26357 ) ( CLEAR ?auto_26350 ) ( not ( = ?auto_26351 ?auto_26350 ) ) ( not ( = ?auto_26351 ?auto_26357 ) ) ( not ( = ?auto_26350 ?auto_26357 ) ) ( not ( = ?auto_26353 ?auto_26355 ) ) ( IS-CRATE ?auto_26351 ) ( not ( = ?auto_26361 ?auto_26352 ) ) ( HOIST-AT ?auto_26360 ?auto_26361 ) ( AVAILABLE ?auto_26360 ) ( SURFACE-AT ?auto_26351 ?auto_26361 ) ( ON ?auto_26351 ?auto_26363 ) ( CLEAR ?auto_26351 ) ( not ( = ?auto_26349 ?auto_26351 ) ) ( not ( = ?auto_26349 ?auto_26363 ) ) ( not ( = ?auto_26351 ?auto_26363 ) ) ( not ( = ?auto_26353 ?auto_26360 ) ) ( IS-CRATE ?auto_26349 ) ( not ( = ?auto_26368 ?auto_26352 ) ) ( HOIST-AT ?auto_26364 ?auto_26368 ) ( AVAILABLE ?auto_26364 ) ( SURFACE-AT ?auto_26349 ?auto_26368 ) ( ON ?auto_26349 ?auto_26362 ) ( CLEAR ?auto_26349 ) ( not ( = ?auto_26348 ?auto_26349 ) ) ( not ( = ?auto_26348 ?auto_26362 ) ) ( not ( = ?auto_26349 ?auto_26362 ) ) ( not ( = ?auto_26353 ?auto_26364 ) ) ( IS-CRATE ?auto_26348 ) ( not ( = ?auto_26371 ?auto_26352 ) ) ( HOIST-AT ?auto_26367 ?auto_26371 ) ( AVAILABLE ?auto_26367 ) ( SURFACE-AT ?auto_26348 ?auto_26371 ) ( ON ?auto_26348 ?auto_26369 ) ( CLEAR ?auto_26348 ) ( not ( = ?auto_26347 ?auto_26348 ) ) ( not ( = ?auto_26347 ?auto_26369 ) ) ( not ( = ?auto_26348 ?auto_26369 ) ) ( not ( = ?auto_26353 ?auto_26367 ) ) ( IS-CRATE ?auto_26347 ) ( not ( = ?auto_26372 ?auto_26352 ) ) ( HOIST-AT ?auto_26365 ?auto_26372 ) ( AVAILABLE ?auto_26365 ) ( SURFACE-AT ?auto_26347 ?auto_26372 ) ( ON ?auto_26347 ?auto_26359 ) ( CLEAR ?auto_26347 ) ( not ( = ?auto_26346 ?auto_26347 ) ) ( not ( = ?auto_26346 ?auto_26359 ) ) ( not ( = ?auto_26347 ?auto_26359 ) ) ( not ( = ?auto_26353 ?auto_26365 ) ) ( SURFACE-AT ?auto_26345 ?auto_26352 ) ( CLEAR ?auto_26345 ) ( IS-CRATE ?auto_26346 ) ( AVAILABLE ?auto_26353 ) ( not ( = ?auto_26366 ?auto_26352 ) ) ( HOIST-AT ?auto_26358 ?auto_26366 ) ( AVAILABLE ?auto_26358 ) ( SURFACE-AT ?auto_26346 ?auto_26366 ) ( ON ?auto_26346 ?auto_26370 ) ( CLEAR ?auto_26346 ) ( TRUCK-AT ?auto_26354 ?auto_26352 ) ( not ( = ?auto_26345 ?auto_26346 ) ) ( not ( = ?auto_26345 ?auto_26370 ) ) ( not ( = ?auto_26346 ?auto_26370 ) ) ( not ( = ?auto_26353 ?auto_26358 ) ) ( not ( = ?auto_26345 ?auto_26347 ) ) ( not ( = ?auto_26345 ?auto_26359 ) ) ( not ( = ?auto_26347 ?auto_26370 ) ) ( not ( = ?auto_26372 ?auto_26366 ) ) ( not ( = ?auto_26365 ?auto_26358 ) ) ( not ( = ?auto_26359 ?auto_26370 ) ) ( not ( = ?auto_26345 ?auto_26348 ) ) ( not ( = ?auto_26345 ?auto_26369 ) ) ( not ( = ?auto_26346 ?auto_26348 ) ) ( not ( = ?auto_26346 ?auto_26369 ) ) ( not ( = ?auto_26348 ?auto_26359 ) ) ( not ( = ?auto_26348 ?auto_26370 ) ) ( not ( = ?auto_26371 ?auto_26372 ) ) ( not ( = ?auto_26371 ?auto_26366 ) ) ( not ( = ?auto_26367 ?auto_26365 ) ) ( not ( = ?auto_26367 ?auto_26358 ) ) ( not ( = ?auto_26369 ?auto_26359 ) ) ( not ( = ?auto_26369 ?auto_26370 ) ) ( not ( = ?auto_26345 ?auto_26349 ) ) ( not ( = ?auto_26345 ?auto_26362 ) ) ( not ( = ?auto_26346 ?auto_26349 ) ) ( not ( = ?auto_26346 ?auto_26362 ) ) ( not ( = ?auto_26347 ?auto_26349 ) ) ( not ( = ?auto_26347 ?auto_26362 ) ) ( not ( = ?auto_26349 ?auto_26369 ) ) ( not ( = ?auto_26349 ?auto_26359 ) ) ( not ( = ?auto_26349 ?auto_26370 ) ) ( not ( = ?auto_26368 ?auto_26371 ) ) ( not ( = ?auto_26368 ?auto_26372 ) ) ( not ( = ?auto_26368 ?auto_26366 ) ) ( not ( = ?auto_26364 ?auto_26367 ) ) ( not ( = ?auto_26364 ?auto_26365 ) ) ( not ( = ?auto_26364 ?auto_26358 ) ) ( not ( = ?auto_26362 ?auto_26369 ) ) ( not ( = ?auto_26362 ?auto_26359 ) ) ( not ( = ?auto_26362 ?auto_26370 ) ) ( not ( = ?auto_26345 ?auto_26351 ) ) ( not ( = ?auto_26345 ?auto_26363 ) ) ( not ( = ?auto_26346 ?auto_26351 ) ) ( not ( = ?auto_26346 ?auto_26363 ) ) ( not ( = ?auto_26347 ?auto_26351 ) ) ( not ( = ?auto_26347 ?auto_26363 ) ) ( not ( = ?auto_26348 ?auto_26351 ) ) ( not ( = ?auto_26348 ?auto_26363 ) ) ( not ( = ?auto_26351 ?auto_26362 ) ) ( not ( = ?auto_26351 ?auto_26369 ) ) ( not ( = ?auto_26351 ?auto_26359 ) ) ( not ( = ?auto_26351 ?auto_26370 ) ) ( not ( = ?auto_26361 ?auto_26368 ) ) ( not ( = ?auto_26361 ?auto_26371 ) ) ( not ( = ?auto_26361 ?auto_26372 ) ) ( not ( = ?auto_26361 ?auto_26366 ) ) ( not ( = ?auto_26360 ?auto_26364 ) ) ( not ( = ?auto_26360 ?auto_26367 ) ) ( not ( = ?auto_26360 ?auto_26365 ) ) ( not ( = ?auto_26360 ?auto_26358 ) ) ( not ( = ?auto_26363 ?auto_26362 ) ) ( not ( = ?auto_26363 ?auto_26369 ) ) ( not ( = ?auto_26363 ?auto_26359 ) ) ( not ( = ?auto_26363 ?auto_26370 ) ) ( not ( = ?auto_26345 ?auto_26350 ) ) ( not ( = ?auto_26345 ?auto_26357 ) ) ( not ( = ?auto_26346 ?auto_26350 ) ) ( not ( = ?auto_26346 ?auto_26357 ) ) ( not ( = ?auto_26347 ?auto_26350 ) ) ( not ( = ?auto_26347 ?auto_26357 ) ) ( not ( = ?auto_26348 ?auto_26350 ) ) ( not ( = ?auto_26348 ?auto_26357 ) ) ( not ( = ?auto_26349 ?auto_26350 ) ) ( not ( = ?auto_26349 ?auto_26357 ) ) ( not ( = ?auto_26350 ?auto_26363 ) ) ( not ( = ?auto_26350 ?auto_26362 ) ) ( not ( = ?auto_26350 ?auto_26369 ) ) ( not ( = ?auto_26350 ?auto_26359 ) ) ( not ( = ?auto_26350 ?auto_26370 ) ) ( not ( = ?auto_26356 ?auto_26361 ) ) ( not ( = ?auto_26356 ?auto_26368 ) ) ( not ( = ?auto_26356 ?auto_26371 ) ) ( not ( = ?auto_26356 ?auto_26372 ) ) ( not ( = ?auto_26356 ?auto_26366 ) ) ( not ( = ?auto_26355 ?auto_26360 ) ) ( not ( = ?auto_26355 ?auto_26364 ) ) ( not ( = ?auto_26355 ?auto_26367 ) ) ( not ( = ?auto_26355 ?auto_26365 ) ) ( not ( = ?auto_26355 ?auto_26358 ) ) ( not ( = ?auto_26357 ?auto_26363 ) ) ( not ( = ?auto_26357 ?auto_26362 ) ) ( not ( = ?auto_26357 ?auto_26369 ) ) ( not ( = ?auto_26357 ?auto_26359 ) ) ( not ( = ?auto_26357 ?auto_26370 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_26345 ?auto_26346 ?auto_26347 ?auto_26348 ?auto_26349 ?auto_26351 )
      ( MAKE-1CRATE ?auto_26351 ?auto_26350 )
      ( MAKE-6CRATE-VERIFY ?auto_26345 ?auto_26346 ?auto_26347 ?auto_26348 ?auto_26349 ?auto_26351 ?auto_26350 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26375 - SURFACE
      ?auto_26376 - SURFACE
    )
    :vars
    (
      ?auto_26377 - HOIST
      ?auto_26378 - PLACE
      ?auto_26380 - PLACE
      ?auto_26381 - HOIST
      ?auto_26382 - SURFACE
      ?auto_26379 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26377 ?auto_26378 ) ( SURFACE-AT ?auto_26375 ?auto_26378 ) ( CLEAR ?auto_26375 ) ( IS-CRATE ?auto_26376 ) ( AVAILABLE ?auto_26377 ) ( not ( = ?auto_26380 ?auto_26378 ) ) ( HOIST-AT ?auto_26381 ?auto_26380 ) ( AVAILABLE ?auto_26381 ) ( SURFACE-AT ?auto_26376 ?auto_26380 ) ( ON ?auto_26376 ?auto_26382 ) ( CLEAR ?auto_26376 ) ( TRUCK-AT ?auto_26379 ?auto_26378 ) ( not ( = ?auto_26375 ?auto_26376 ) ) ( not ( = ?auto_26375 ?auto_26382 ) ) ( not ( = ?auto_26376 ?auto_26382 ) ) ( not ( = ?auto_26377 ?auto_26381 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26379 ?auto_26378 ?auto_26380 )
      ( !LIFT ?auto_26381 ?auto_26376 ?auto_26382 ?auto_26380 )
      ( !LOAD ?auto_26381 ?auto_26376 ?auto_26379 ?auto_26380 )
      ( !DRIVE ?auto_26379 ?auto_26380 ?auto_26378 )
      ( !UNLOAD ?auto_26377 ?auto_26376 ?auto_26379 ?auto_26378 )
      ( !DROP ?auto_26377 ?auto_26376 ?auto_26375 ?auto_26378 )
      ( MAKE-1CRATE-VERIFY ?auto_26375 ?auto_26376 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_26391 - SURFACE
      ?auto_26392 - SURFACE
      ?auto_26393 - SURFACE
      ?auto_26394 - SURFACE
      ?auto_26395 - SURFACE
      ?auto_26397 - SURFACE
      ?auto_26396 - SURFACE
      ?auto_26398 - SURFACE
    )
    :vars
    (
      ?auto_26403 - HOIST
      ?auto_26402 - PLACE
      ?auto_26401 - PLACE
      ?auto_26404 - HOIST
      ?auto_26400 - SURFACE
      ?auto_26411 - PLACE
      ?auto_26412 - HOIST
      ?auto_26413 - SURFACE
      ?auto_26418 - PLACE
      ?auto_26417 - HOIST
      ?auto_26419 - SURFACE
      ?auto_26406 - PLACE
      ?auto_26410 - HOIST
      ?auto_26420 - SURFACE
      ?auto_26408 - PLACE
      ?auto_26405 - HOIST
      ?auto_26421 - SURFACE
      ?auto_26416 - PLACE
      ?auto_26409 - HOIST
      ?auto_26414 - SURFACE
      ?auto_26415 - PLACE
      ?auto_26407 - HOIST
      ?auto_26422 - SURFACE
      ?auto_26399 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26403 ?auto_26402 ) ( IS-CRATE ?auto_26398 ) ( not ( = ?auto_26401 ?auto_26402 ) ) ( HOIST-AT ?auto_26404 ?auto_26401 ) ( AVAILABLE ?auto_26404 ) ( SURFACE-AT ?auto_26398 ?auto_26401 ) ( ON ?auto_26398 ?auto_26400 ) ( CLEAR ?auto_26398 ) ( not ( = ?auto_26396 ?auto_26398 ) ) ( not ( = ?auto_26396 ?auto_26400 ) ) ( not ( = ?auto_26398 ?auto_26400 ) ) ( not ( = ?auto_26403 ?auto_26404 ) ) ( IS-CRATE ?auto_26396 ) ( not ( = ?auto_26411 ?auto_26402 ) ) ( HOIST-AT ?auto_26412 ?auto_26411 ) ( AVAILABLE ?auto_26412 ) ( SURFACE-AT ?auto_26396 ?auto_26411 ) ( ON ?auto_26396 ?auto_26413 ) ( CLEAR ?auto_26396 ) ( not ( = ?auto_26397 ?auto_26396 ) ) ( not ( = ?auto_26397 ?auto_26413 ) ) ( not ( = ?auto_26396 ?auto_26413 ) ) ( not ( = ?auto_26403 ?auto_26412 ) ) ( IS-CRATE ?auto_26397 ) ( not ( = ?auto_26418 ?auto_26402 ) ) ( HOIST-AT ?auto_26417 ?auto_26418 ) ( AVAILABLE ?auto_26417 ) ( SURFACE-AT ?auto_26397 ?auto_26418 ) ( ON ?auto_26397 ?auto_26419 ) ( CLEAR ?auto_26397 ) ( not ( = ?auto_26395 ?auto_26397 ) ) ( not ( = ?auto_26395 ?auto_26419 ) ) ( not ( = ?auto_26397 ?auto_26419 ) ) ( not ( = ?auto_26403 ?auto_26417 ) ) ( IS-CRATE ?auto_26395 ) ( not ( = ?auto_26406 ?auto_26402 ) ) ( HOIST-AT ?auto_26410 ?auto_26406 ) ( AVAILABLE ?auto_26410 ) ( SURFACE-AT ?auto_26395 ?auto_26406 ) ( ON ?auto_26395 ?auto_26420 ) ( CLEAR ?auto_26395 ) ( not ( = ?auto_26394 ?auto_26395 ) ) ( not ( = ?auto_26394 ?auto_26420 ) ) ( not ( = ?auto_26395 ?auto_26420 ) ) ( not ( = ?auto_26403 ?auto_26410 ) ) ( IS-CRATE ?auto_26394 ) ( not ( = ?auto_26408 ?auto_26402 ) ) ( HOIST-AT ?auto_26405 ?auto_26408 ) ( AVAILABLE ?auto_26405 ) ( SURFACE-AT ?auto_26394 ?auto_26408 ) ( ON ?auto_26394 ?auto_26421 ) ( CLEAR ?auto_26394 ) ( not ( = ?auto_26393 ?auto_26394 ) ) ( not ( = ?auto_26393 ?auto_26421 ) ) ( not ( = ?auto_26394 ?auto_26421 ) ) ( not ( = ?auto_26403 ?auto_26405 ) ) ( IS-CRATE ?auto_26393 ) ( not ( = ?auto_26416 ?auto_26402 ) ) ( HOIST-AT ?auto_26409 ?auto_26416 ) ( AVAILABLE ?auto_26409 ) ( SURFACE-AT ?auto_26393 ?auto_26416 ) ( ON ?auto_26393 ?auto_26414 ) ( CLEAR ?auto_26393 ) ( not ( = ?auto_26392 ?auto_26393 ) ) ( not ( = ?auto_26392 ?auto_26414 ) ) ( not ( = ?auto_26393 ?auto_26414 ) ) ( not ( = ?auto_26403 ?auto_26409 ) ) ( SURFACE-AT ?auto_26391 ?auto_26402 ) ( CLEAR ?auto_26391 ) ( IS-CRATE ?auto_26392 ) ( AVAILABLE ?auto_26403 ) ( not ( = ?auto_26415 ?auto_26402 ) ) ( HOIST-AT ?auto_26407 ?auto_26415 ) ( AVAILABLE ?auto_26407 ) ( SURFACE-AT ?auto_26392 ?auto_26415 ) ( ON ?auto_26392 ?auto_26422 ) ( CLEAR ?auto_26392 ) ( TRUCK-AT ?auto_26399 ?auto_26402 ) ( not ( = ?auto_26391 ?auto_26392 ) ) ( not ( = ?auto_26391 ?auto_26422 ) ) ( not ( = ?auto_26392 ?auto_26422 ) ) ( not ( = ?auto_26403 ?auto_26407 ) ) ( not ( = ?auto_26391 ?auto_26393 ) ) ( not ( = ?auto_26391 ?auto_26414 ) ) ( not ( = ?auto_26393 ?auto_26422 ) ) ( not ( = ?auto_26416 ?auto_26415 ) ) ( not ( = ?auto_26409 ?auto_26407 ) ) ( not ( = ?auto_26414 ?auto_26422 ) ) ( not ( = ?auto_26391 ?auto_26394 ) ) ( not ( = ?auto_26391 ?auto_26421 ) ) ( not ( = ?auto_26392 ?auto_26394 ) ) ( not ( = ?auto_26392 ?auto_26421 ) ) ( not ( = ?auto_26394 ?auto_26414 ) ) ( not ( = ?auto_26394 ?auto_26422 ) ) ( not ( = ?auto_26408 ?auto_26416 ) ) ( not ( = ?auto_26408 ?auto_26415 ) ) ( not ( = ?auto_26405 ?auto_26409 ) ) ( not ( = ?auto_26405 ?auto_26407 ) ) ( not ( = ?auto_26421 ?auto_26414 ) ) ( not ( = ?auto_26421 ?auto_26422 ) ) ( not ( = ?auto_26391 ?auto_26395 ) ) ( not ( = ?auto_26391 ?auto_26420 ) ) ( not ( = ?auto_26392 ?auto_26395 ) ) ( not ( = ?auto_26392 ?auto_26420 ) ) ( not ( = ?auto_26393 ?auto_26395 ) ) ( not ( = ?auto_26393 ?auto_26420 ) ) ( not ( = ?auto_26395 ?auto_26421 ) ) ( not ( = ?auto_26395 ?auto_26414 ) ) ( not ( = ?auto_26395 ?auto_26422 ) ) ( not ( = ?auto_26406 ?auto_26408 ) ) ( not ( = ?auto_26406 ?auto_26416 ) ) ( not ( = ?auto_26406 ?auto_26415 ) ) ( not ( = ?auto_26410 ?auto_26405 ) ) ( not ( = ?auto_26410 ?auto_26409 ) ) ( not ( = ?auto_26410 ?auto_26407 ) ) ( not ( = ?auto_26420 ?auto_26421 ) ) ( not ( = ?auto_26420 ?auto_26414 ) ) ( not ( = ?auto_26420 ?auto_26422 ) ) ( not ( = ?auto_26391 ?auto_26397 ) ) ( not ( = ?auto_26391 ?auto_26419 ) ) ( not ( = ?auto_26392 ?auto_26397 ) ) ( not ( = ?auto_26392 ?auto_26419 ) ) ( not ( = ?auto_26393 ?auto_26397 ) ) ( not ( = ?auto_26393 ?auto_26419 ) ) ( not ( = ?auto_26394 ?auto_26397 ) ) ( not ( = ?auto_26394 ?auto_26419 ) ) ( not ( = ?auto_26397 ?auto_26420 ) ) ( not ( = ?auto_26397 ?auto_26421 ) ) ( not ( = ?auto_26397 ?auto_26414 ) ) ( not ( = ?auto_26397 ?auto_26422 ) ) ( not ( = ?auto_26418 ?auto_26406 ) ) ( not ( = ?auto_26418 ?auto_26408 ) ) ( not ( = ?auto_26418 ?auto_26416 ) ) ( not ( = ?auto_26418 ?auto_26415 ) ) ( not ( = ?auto_26417 ?auto_26410 ) ) ( not ( = ?auto_26417 ?auto_26405 ) ) ( not ( = ?auto_26417 ?auto_26409 ) ) ( not ( = ?auto_26417 ?auto_26407 ) ) ( not ( = ?auto_26419 ?auto_26420 ) ) ( not ( = ?auto_26419 ?auto_26421 ) ) ( not ( = ?auto_26419 ?auto_26414 ) ) ( not ( = ?auto_26419 ?auto_26422 ) ) ( not ( = ?auto_26391 ?auto_26396 ) ) ( not ( = ?auto_26391 ?auto_26413 ) ) ( not ( = ?auto_26392 ?auto_26396 ) ) ( not ( = ?auto_26392 ?auto_26413 ) ) ( not ( = ?auto_26393 ?auto_26396 ) ) ( not ( = ?auto_26393 ?auto_26413 ) ) ( not ( = ?auto_26394 ?auto_26396 ) ) ( not ( = ?auto_26394 ?auto_26413 ) ) ( not ( = ?auto_26395 ?auto_26396 ) ) ( not ( = ?auto_26395 ?auto_26413 ) ) ( not ( = ?auto_26396 ?auto_26419 ) ) ( not ( = ?auto_26396 ?auto_26420 ) ) ( not ( = ?auto_26396 ?auto_26421 ) ) ( not ( = ?auto_26396 ?auto_26414 ) ) ( not ( = ?auto_26396 ?auto_26422 ) ) ( not ( = ?auto_26411 ?auto_26418 ) ) ( not ( = ?auto_26411 ?auto_26406 ) ) ( not ( = ?auto_26411 ?auto_26408 ) ) ( not ( = ?auto_26411 ?auto_26416 ) ) ( not ( = ?auto_26411 ?auto_26415 ) ) ( not ( = ?auto_26412 ?auto_26417 ) ) ( not ( = ?auto_26412 ?auto_26410 ) ) ( not ( = ?auto_26412 ?auto_26405 ) ) ( not ( = ?auto_26412 ?auto_26409 ) ) ( not ( = ?auto_26412 ?auto_26407 ) ) ( not ( = ?auto_26413 ?auto_26419 ) ) ( not ( = ?auto_26413 ?auto_26420 ) ) ( not ( = ?auto_26413 ?auto_26421 ) ) ( not ( = ?auto_26413 ?auto_26414 ) ) ( not ( = ?auto_26413 ?auto_26422 ) ) ( not ( = ?auto_26391 ?auto_26398 ) ) ( not ( = ?auto_26391 ?auto_26400 ) ) ( not ( = ?auto_26392 ?auto_26398 ) ) ( not ( = ?auto_26392 ?auto_26400 ) ) ( not ( = ?auto_26393 ?auto_26398 ) ) ( not ( = ?auto_26393 ?auto_26400 ) ) ( not ( = ?auto_26394 ?auto_26398 ) ) ( not ( = ?auto_26394 ?auto_26400 ) ) ( not ( = ?auto_26395 ?auto_26398 ) ) ( not ( = ?auto_26395 ?auto_26400 ) ) ( not ( = ?auto_26397 ?auto_26398 ) ) ( not ( = ?auto_26397 ?auto_26400 ) ) ( not ( = ?auto_26398 ?auto_26413 ) ) ( not ( = ?auto_26398 ?auto_26419 ) ) ( not ( = ?auto_26398 ?auto_26420 ) ) ( not ( = ?auto_26398 ?auto_26421 ) ) ( not ( = ?auto_26398 ?auto_26414 ) ) ( not ( = ?auto_26398 ?auto_26422 ) ) ( not ( = ?auto_26401 ?auto_26411 ) ) ( not ( = ?auto_26401 ?auto_26418 ) ) ( not ( = ?auto_26401 ?auto_26406 ) ) ( not ( = ?auto_26401 ?auto_26408 ) ) ( not ( = ?auto_26401 ?auto_26416 ) ) ( not ( = ?auto_26401 ?auto_26415 ) ) ( not ( = ?auto_26404 ?auto_26412 ) ) ( not ( = ?auto_26404 ?auto_26417 ) ) ( not ( = ?auto_26404 ?auto_26410 ) ) ( not ( = ?auto_26404 ?auto_26405 ) ) ( not ( = ?auto_26404 ?auto_26409 ) ) ( not ( = ?auto_26404 ?auto_26407 ) ) ( not ( = ?auto_26400 ?auto_26413 ) ) ( not ( = ?auto_26400 ?auto_26419 ) ) ( not ( = ?auto_26400 ?auto_26420 ) ) ( not ( = ?auto_26400 ?auto_26421 ) ) ( not ( = ?auto_26400 ?auto_26414 ) ) ( not ( = ?auto_26400 ?auto_26422 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_26391 ?auto_26392 ?auto_26393 ?auto_26394 ?auto_26395 ?auto_26397 ?auto_26396 )
      ( MAKE-1CRATE ?auto_26396 ?auto_26398 )
      ( MAKE-7CRATE-VERIFY ?auto_26391 ?auto_26392 ?auto_26393 ?auto_26394 ?auto_26395 ?auto_26397 ?auto_26396 ?auto_26398 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26425 - SURFACE
      ?auto_26426 - SURFACE
    )
    :vars
    (
      ?auto_26427 - HOIST
      ?auto_26428 - PLACE
      ?auto_26430 - PLACE
      ?auto_26431 - HOIST
      ?auto_26432 - SURFACE
      ?auto_26429 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26427 ?auto_26428 ) ( SURFACE-AT ?auto_26425 ?auto_26428 ) ( CLEAR ?auto_26425 ) ( IS-CRATE ?auto_26426 ) ( AVAILABLE ?auto_26427 ) ( not ( = ?auto_26430 ?auto_26428 ) ) ( HOIST-AT ?auto_26431 ?auto_26430 ) ( AVAILABLE ?auto_26431 ) ( SURFACE-AT ?auto_26426 ?auto_26430 ) ( ON ?auto_26426 ?auto_26432 ) ( CLEAR ?auto_26426 ) ( TRUCK-AT ?auto_26429 ?auto_26428 ) ( not ( = ?auto_26425 ?auto_26426 ) ) ( not ( = ?auto_26425 ?auto_26432 ) ) ( not ( = ?auto_26426 ?auto_26432 ) ) ( not ( = ?auto_26427 ?auto_26431 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26429 ?auto_26428 ?auto_26430 )
      ( !LIFT ?auto_26431 ?auto_26426 ?auto_26432 ?auto_26430 )
      ( !LOAD ?auto_26431 ?auto_26426 ?auto_26429 ?auto_26430 )
      ( !DRIVE ?auto_26429 ?auto_26430 ?auto_26428 )
      ( !UNLOAD ?auto_26427 ?auto_26426 ?auto_26429 ?auto_26428 )
      ( !DROP ?auto_26427 ?auto_26426 ?auto_26425 ?auto_26428 )
      ( MAKE-1CRATE-VERIFY ?auto_26425 ?auto_26426 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_26442 - SURFACE
      ?auto_26443 - SURFACE
      ?auto_26444 - SURFACE
      ?auto_26445 - SURFACE
      ?auto_26446 - SURFACE
      ?auto_26448 - SURFACE
      ?auto_26447 - SURFACE
      ?auto_26450 - SURFACE
      ?auto_26449 - SURFACE
    )
    :vars
    (
      ?auto_26454 - HOIST
      ?auto_26455 - PLACE
      ?auto_26453 - PLACE
      ?auto_26452 - HOIST
      ?auto_26451 - SURFACE
      ?auto_26459 - SURFACE
      ?auto_26472 - PLACE
      ?auto_26460 - HOIST
      ?auto_26461 - SURFACE
      ?auto_26458 - PLACE
      ?auto_26457 - HOIST
      ?auto_26467 - SURFACE
      ?auto_26469 - PLACE
      ?auto_26473 - HOIST
      ?auto_26462 - SURFACE
      ?auto_26470 - PLACE
      ?auto_26475 - HOIST
      ?auto_26466 - SURFACE
      ?auto_26464 - PLACE
      ?auto_26474 - HOIST
      ?auto_26463 - SURFACE
      ?auto_26465 - PLACE
      ?auto_26468 - HOIST
      ?auto_26471 - SURFACE
      ?auto_26456 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26454 ?auto_26455 ) ( IS-CRATE ?auto_26449 ) ( not ( = ?auto_26453 ?auto_26455 ) ) ( HOIST-AT ?auto_26452 ?auto_26453 ) ( SURFACE-AT ?auto_26449 ?auto_26453 ) ( ON ?auto_26449 ?auto_26451 ) ( CLEAR ?auto_26449 ) ( not ( = ?auto_26450 ?auto_26449 ) ) ( not ( = ?auto_26450 ?auto_26451 ) ) ( not ( = ?auto_26449 ?auto_26451 ) ) ( not ( = ?auto_26454 ?auto_26452 ) ) ( IS-CRATE ?auto_26450 ) ( AVAILABLE ?auto_26452 ) ( SURFACE-AT ?auto_26450 ?auto_26453 ) ( ON ?auto_26450 ?auto_26459 ) ( CLEAR ?auto_26450 ) ( not ( = ?auto_26447 ?auto_26450 ) ) ( not ( = ?auto_26447 ?auto_26459 ) ) ( not ( = ?auto_26450 ?auto_26459 ) ) ( IS-CRATE ?auto_26447 ) ( not ( = ?auto_26472 ?auto_26455 ) ) ( HOIST-AT ?auto_26460 ?auto_26472 ) ( AVAILABLE ?auto_26460 ) ( SURFACE-AT ?auto_26447 ?auto_26472 ) ( ON ?auto_26447 ?auto_26461 ) ( CLEAR ?auto_26447 ) ( not ( = ?auto_26448 ?auto_26447 ) ) ( not ( = ?auto_26448 ?auto_26461 ) ) ( not ( = ?auto_26447 ?auto_26461 ) ) ( not ( = ?auto_26454 ?auto_26460 ) ) ( IS-CRATE ?auto_26448 ) ( not ( = ?auto_26458 ?auto_26455 ) ) ( HOIST-AT ?auto_26457 ?auto_26458 ) ( AVAILABLE ?auto_26457 ) ( SURFACE-AT ?auto_26448 ?auto_26458 ) ( ON ?auto_26448 ?auto_26467 ) ( CLEAR ?auto_26448 ) ( not ( = ?auto_26446 ?auto_26448 ) ) ( not ( = ?auto_26446 ?auto_26467 ) ) ( not ( = ?auto_26448 ?auto_26467 ) ) ( not ( = ?auto_26454 ?auto_26457 ) ) ( IS-CRATE ?auto_26446 ) ( not ( = ?auto_26469 ?auto_26455 ) ) ( HOIST-AT ?auto_26473 ?auto_26469 ) ( AVAILABLE ?auto_26473 ) ( SURFACE-AT ?auto_26446 ?auto_26469 ) ( ON ?auto_26446 ?auto_26462 ) ( CLEAR ?auto_26446 ) ( not ( = ?auto_26445 ?auto_26446 ) ) ( not ( = ?auto_26445 ?auto_26462 ) ) ( not ( = ?auto_26446 ?auto_26462 ) ) ( not ( = ?auto_26454 ?auto_26473 ) ) ( IS-CRATE ?auto_26445 ) ( not ( = ?auto_26470 ?auto_26455 ) ) ( HOIST-AT ?auto_26475 ?auto_26470 ) ( AVAILABLE ?auto_26475 ) ( SURFACE-AT ?auto_26445 ?auto_26470 ) ( ON ?auto_26445 ?auto_26466 ) ( CLEAR ?auto_26445 ) ( not ( = ?auto_26444 ?auto_26445 ) ) ( not ( = ?auto_26444 ?auto_26466 ) ) ( not ( = ?auto_26445 ?auto_26466 ) ) ( not ( = ?auto_26454 ?auto_26475 ) ) ( IS-CRATE ?auto_26444 ) ( not ( = ?auto_26464 ?auto_26455 ) ) ( HOIST-AT ?auto_26474 ?auto_26464 ) ( AVAILABLE ?auto_26474 ) ( SURFACE-AT ?auto_26444 ?auto_26464 ) ( ON ?auto_26444 ?auto_26463 ) ( CLEAR ?auto_26444 ) ( not ( = ?auto_26443 ?auto_26444 ) ) ( not ( = ?auto_26443 ?auto_26463 ) ) ( not ( = ?auto_26444 ?auto_26463 ) ) ( not ( = ?auto_26454 ?auto_26474 ) ) ( SURFACE-AT ?auto_26442 ?auto_26455 ) ( CLEAR ?auto_26442 ) ( IS-CRATE ?auto_26443 ) ( AVAILABLE ?auto_26454 ) ( not ( = ?auto_26465 ?auto_26455 ) ) ( HOIST-AT ?auto_26468 ?auto_26465 ) ( AVAILABLE ?auto_26468 ) ( SURFACE-AT ?auto_26443 ?auto_26465 ) ( ON ?auto_26443 ?auto_26471 ) ( CLEAR ?auto_26443 ) ( TRUCK-AT ?auto_26456 ?auto_26455 ) ( not ( = ?auto_26442 ?auto_26443 ) ) ( not ( = ?auto_26442 ?auto_26471 ) ) ( not ( = ?auto_26443 ?auto_26471 ) ) ( not ( = ?auto_26454 ?auto_26468 ) ) ( not ( = ?auto_26442 ?auto_26444 ) ) ( not ( = ?auto_26442 ?auto_26463 ) ) ( not ( = ?auto_26444 ?auto_26471 ) ) ( not ( = ?auto_26464 ?auto_26465 ) ) ( not ( = ?auto_26474 ?auto_26468 ) ) ( not ( = ?auto_26463 ?auto_26471 ) ) ( not ( = ?auto_26442 ?auto_26445 ) ) ( not ( = ?auto_26442 ?auto_26466 ) ) ( not ( = ?auto_26443 ?auto_26445 ) ) ( not ( = ?auto_26443 ?auto_26466 ) ) ( not ( = ?auto_26445 ?auto_26463 ) ) ( not ( = ?auto_26445 ?auto_26471 ) ) ( not ( = ?auto_26470 ?auto_26464 ) ) ( not ( = ?auto_26470 ?auto_26465 ) ) ( not ( = ?auto_26475 ?auto_26474 ) ) ( not ( = ?auto_26475 ?auto_26468 ) ) ( not ( = ?auto_26466 ?auto_26463 ) ) ( not ( = ?auto_26466 ?auto_26471 ) ) ( not ( = ?auto_26442 ?auto_26446 ) ) ( not ( = ?auto_26442 ?auto_26462 ) ) ( not ( = ?auto_26443 ?auto_26446 ) ) ( not ( = ?auto_26443 ?auto_26462 ) ) ( not ( = ?auto_26444 ?auto_26446 ) ) ( not ( = ?auto_26444 ?auto_26462 ) ) ( not ( = ?auto_26446 ?auto_26466 ) ) ( not ( = ?auto_26446 ?auto_26463 ) ) ( not ( = ?auto_26446 ?auto_26471 ) ) ( not ( = ?auto_26469 ?auto_26470 ) ) ( not ( = ?auto_26469 ?auto_26464 ) ) ( not ( = ?auto_26469 ?auto_26465 ) ) ( not ( = ?auto_26473 ?auto_26475 ) ) ( not ( = ?auto_26473 ?auto_26474 ) ) ( not ( = ?auto_26473 ?auto_26468 ) ) ( not ( = ?auto_26462 ?auto_26466 ) ) ( not ( = ?auto_26462 ?auto_26463 ) ) ( not ( = ?auto_26462 ?auto_26471 ) ) ( not ( = ?auto_26442 ?auto_26448 ) ) ( not ( = ?auto_26442 ?auto_26467 ) ) ( not ( = ?auto_26443 ?auto_26448 ) ) ( not ( = ?auto_26443 ?auto_26467 ) ) ( not ( = ?auto_26444 ?auto_26448 ) ) ( not ( = ?auto_26444 ?auto_26467 ) ) ( not ( = ?auto_26445 ?auto_26448 ) ) ( not ( = ?auto_26445 ?auto_26467 ) ) ( not ( = ?auto_26448 ?auto_26462 ) ) ( not ( = ?auto_26448 ?auto_26466 ) ) ( not ( = ?auto_26448 ?auto_26463 ) ) ( not ( = ?auto_26448 ?auto_26471 ) ) ( not ( = ?auto_26458 ?auto_26469 ) ) ( not ( = ?auto_26458 ?auto_26470 ) ) ( not ( = ?auto_26458 ?auto_26464 ) ) ( not ( = ?auto_26458 ?auto_26465 ) ) ( not ( = ?auto_26457 ?auto_26473 ) ) ( not ( = ?auto_26457 ?auto_26475 ) ) ( not ( = ?auto_26457 ?auto_26474 ) ) ( not ( = ?auto_26457 ?auto_26468 ) ) ( not ( = ?auto_26467 ?auto_26462 ) ) ( not ( = ?auto_26467 ?auto_26466 ) ) ( not ( = ?auto_26467 ?auto_26463 ) ) ( not ( = ?auto_26467 ?auto_26471 ) ) ( not ( = ?auto_26442 ?auto_26447 ) ) ( not ( = ?auto_26442 ?auto_26461 ) ) ( not ( = ?auto_26443 ?auto_26447 ) ) ( not ( = ?auto_26443 ?auto_26461 ) ) ( not ( = ?auto_26444 ?auto_26447 ) ) ( not ( = ?auto_26444 ?auto_26461 ) ) ( not ( = ?auto_26445 ?auto_26447 ) ) ( not ( = ?auto_26445 ?auto_26461 ) ) ( not ( = ?auto_26446 ?auto_26447 ) ) ( not ( = ?auto_26446 ?auto_26461 ) ) ( not ( = ?auto_26447 ?auto_26467 ) ) ( not ( = ?auto_26447 ?auto_26462 ) ) ( not ( = ?auto_26447 ?auto_26466 ) ) ( not ( = ?auto_26447 ?auto_26463 ) ) ( not ( = ?auto_26447 ?auto_26471 ) ) ( not ( = ?auto_26472 ?auto_26458 ) ) ( not ( = ?auto_26472 ?auto_26469 ) ) ( not ( = ?auto_26472 ?auto_26470 ) ) ( not ( = ?auto_26472 ?auto_26464 ) ) ( not ( = ?auto_26472 ?auto_26465 ) ) ( not ( = ?auto_26460 ?auto_26457 ) ) ( not ( = ?auto_26460 ?auto_26473 ) ) ( not ( = ?auto_26460 ?auto_26475 ) ) ( not ( = ?auto_26460 ?auto_26474 ) ) ( not ( = ?auto_26460 ?auto_26468 ) ) ( not ( = ?auto_26461 ?auto_26467 ) ) ( not ( = ?auto_26461 ?auto_26462 ) ) ( not ( = ?auto_26461 ?auto_26466 ) ) ( not ( = ?auto_26461 ?auto_26463 ) ) ( not ( = ?auto_26461 ?auto_26471 ) ) ( not ( = ?auto_26442 ?auto_26450 ) ) ( not ( = ?auto_26442 ?auto_26459 ) ) ( not ( = ?auto_26443 ?auto_26450 ) ) ( not ( = ?auto_26443 ?auto_26459 ) ) ( not ( = ?auto_26444 ?auto_26450 ) ) ( not ( = ?auto_26444 ?auto_26459 ) ) ( not ( = ?auto_26445 ?auto_26450 ) ) ( not ( = ?auto_26445 ?auto_26459 ) ) ( not ( = ?auto_26446 ?auto_26450 ) ) ( not ( = ?auto_26446 ?auto_26459 ) ) ( not ( = ?auto_26448 ?auto_26450 ) ) ( not ( = ?auto_26448 ?auto_26459 ) ) ( not ( = ?auto_26450 ?auto_26461 ) ) ( not ( = ?auto_26450 ?auto_26467 ) ) ( not ( = ?auto_26450 ?auto_26462 ) ) ( not ( = ?auto_26450 ?auto_26466 ) ) ( not ( = ?auto_26450 ?auto_26463 ) ) ( not ( = ?auto_26450 ?auto_26471 ) ) ( not ( = ?auto_26453 ?auto_26472 ) ) ( not ( = ?auto_26453 ?auto_26458 ) ) ( not ( = ?auto_26453 ?auto_26469 ) ) ( not ( = ?auto_26453 ?auto_26470 ) ) ( not ( = ?auto_26453 ?auto_26464 ) ) ( not ( = ?auto_26453 ?auto_26465 ) ) ( not ( = ?auto_26452 ?auto_26460 ) ) ( not ( = ?auto_26452 ?auto_26457 ) ) ( not ( = ?auto_26452 ?auto_26473 ) ) ( not ( = ?auto_26452 ?auto_26475 ) ) ( not ( = ?auto_26452 ?auto_26474 ) ) ( not ( = ?auto_26452 ?auto_26468 ) ) ( not ( = ?auto_26459 ?auto_26461 ) ) ( not ( = ?auto_26459 ?auto_26467 ) ) ( not ( = ?auto_26459 ?auto_26462 ) ) ( not ( = ?auto_26459 ?auto_26466 ) ) ( not ( = ?auto_26459 ?auto_26463 ) ) ( not ( = ?auto_26459 ?auto_26471 ) ) ( not ( = ?auto_26442 ?auto_26449 ) ) ( not ( = ?auto_26442 ?auto_26451 ) ) ( not ( = ?auto_26443 ?auto_26449 ) ) ( not ( = ?auto_26443 ?auto_26451 ) ) ( not ( = ?auto_26444 ?auto_26449 ) ) ( not ( = ?auto_26444 ?auto_26451 ) ) ( not ( = ?auto_26445 ?auto_26449 ) ) ( not ( = ?auto_26445 ?auto_26451 ) ) ( not ( = ?auto_26446 ?auto_26449 ) ) ( not ( = ?auto_26446 ?auto_26451 ) ) ( not ( = ?auto_26448 ?auto_26449 ) ) ( not ( = ?auto_26448 ?auto_26451 ) ) ( not ( = ?auto_26447 ?auto_26449 ) ) ( not ( = ?auto_26447 ?auto_26451 ) ) ( not ( = ?auto_26449 ?auto_26459 ) ) ( not ( = ?auto_26449 ?auto_26461 ) ) ( not ( = ?auto_26449 ?auto_26467 ) ) ( not ( = ?auto_26449 ?auto_26462 ) ) ( not ( = ?auto_26449 ?auto_26466 ) ) ( not ( = ?auto_26449 ?auto_26463 ) ) ( not ( = ?auto_26449 ?auto_26471 ) ) ( not ( = ?auto_26451 ?auto_26459 ) ) ( not ( = ?auto_26451 ?auto_26461 ) ) ( not ( = ?auto_26451 ?auto_26467 ) ) ( not ( = ?auto_26451 ?auto_26462 ) ) ( not ( = ?auto_26451 ?auto_26466 ) ) ( not ( = ?auto_26451 ?auto_26463 ) ) ( not ( = ?auto_26451 ?auto_26471 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_26442 ?auto_26443 ?auto_26444 ?auto_26445 ?auto_26446 ?auto_26448 ?auto_26447 ?auto_26450 )
      ( MAKE-1CRATE ?auto_26450 ?auto_26449 )
      ( MAKE-8CRATE-VERIFY ?auto_26442 ?auto_26443 ?auto_26444 ?auto_26445 ?auto_26446 ?auto_26448 ?auto_26447 ?auto_26450 ?auto_26449 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26478 - SURFACE
      ?auto_26479 - SURFACE
    )
    :vars
    (
      ?auto_26480 - HOIST
      ?auto_26481 - PLACE
      ?auto_26483 - PLACE
      ?auto_26484 - HOIST
      ?auto_26485 - SURFACE
      ?auto_26482 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26480 ?auto_26481 ) ( SURFACE-AT ?auto_26478 ?auto_26481 ) ( CLEAR ?auto_26478 ) ( IS-CRATE ?auto_26479 ) ( AVAILABLE ?auto_26480 ) ( not ( = ?auto_26483 ?auto_26481 ) ) ( HOIST-AT ?auto_26484 ?auto_26483 ) ( AVAILABLE ?auto_26484 ) ( SURFACE-AT ?auto_26479 ?auto_26483 ) ( ON ?auto_26479 ?auto_26485 ) ( CLEAR ?auto_26479 ) ( TRUCK-AT ?auto_26482 ?auto_26481 ) ( not ( = ?auto_26478 ?auto_26479 ) ) ( not ( = ?auto_26478 ?auto_26485 ) ) ( not ( = ?auto_26479 ?auto_26485 ) ) ( not ( = ?auto_26480 ?auto_26484 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26482 ?auto_26481 ?auto_26483 )
      ( !LIFT ?auto_26484 ?auto_26479 ?auto_26485 ?auto_26483 )
      ( !LOAD ?auto_26484 ?auto_26479 ?auto_26482 ?auto_26483 )
      ( !DRIVE ?auto_26482 ?auto_26483 ?auto_26481 )
      ( !UNLOAD ?auto_26480 ?auto_26479 ?auto_26482 ?auto_26481 )
      ( !DROP ?auto_26480 ?auto_26479 ?auto_26478 ?auto_26481 )
      ( MAKE-1CRATE-VERIFY ?auto_26478 ?auto_26479 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_26496 - SURFACE
      ?auto_26497 - SURFACE
      ?auto_26498 - SURFACE
      ?auto_26499 - SURFACE
      ?auto_26500 - SURFACE
      ?auto_26503 - SURFACE
      ?auto_26501 - SURFACE
      ?auto_26505 - SURFACE
      ?auto_26504 - SURFACE
      ?auto_26502 - SURFACE
    )
    :vars
    (
      ?auto_26509 - HOIST
      ?auto_26506 - PLACE
      ?auto_26507 - PLACE
      ?auto_26508 - HOIST
      ?auto_26510 - SURFACE
      ?auto_26517 - PLACE
      ?auto_26522 - HOIST
      ?auto_26523 - SURFACE
      ?auto_26520 - SURFACE
      ?auto_26530 - PLACE
      ?auto_26519 - HOIST
      ?auto_26516 - SURFACE
      ?auto_26518 - PLACE
      ?auto_26524 - HOIST
      ?auto_26528 - SURFACE
      ?auto_26515 - SURFACE
      ?auto_26512 - PLACE
      ?auto_26525 - HOIST
      ?auto_26531 - SURFACE
      ?auto_26513 - PLACE
      ?auto_26526 - HOIST
      ?auto_26514 - SURFACE
      ?auto_26529 - PLACE
      ?auto_26527 - HOIST
      ?auto_26521 - SURFACE
      ?auto_26511 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26509 ?auto_26506 ) ( IS-CRATE ?auto_26502 ) ( not ( = ?auto_26507 ?auto_26506 ) ) ( HOIST-AT ?auto_26508 ?auto_26507 ) ( SURFACE-AT ?auto_26502 ?auto_26507 ) ( ON ?auto_26502 ?auto_26510 ) ( CLEAR ?auto_26502 ) ( not ( = ?auto_26504 ?auto_26502 ) ) ( not ( = ?auto_26504 ?auto_26510 ) ) ( not ( = ?auto_26502 ?auto_26510 ) ) ( not ( = ?auto_26509 ?auto_26508 ) ) ( IS-CRATE ?auto_26504 ) ( not ( = ?auto_26517 ?auto_26506 ) ) ( HOIST-AT ?auto_26522 ?auto_26517 ) ( SURFACE-AT ?auto_26504 ?auto_26517 ) ( ON ?auto_26504 ?auto_26523 ) ( CLEAR ?auto_26504 ) ( not ( = ?auto_26505 ?auto_26504 ) ) ( not ( = ?auto_26505 ?auto_26523 ) ) ( not ( = ?auto_26504 ?auto_26523 ) ) ( not ( = ?auto_26509 ?auto_26522 ) ) ( IS-CRATE ?auto_26505 ) ( AVAILABLE ?auto_26522 ) ( SURFACE-AT ?auto_26505 ?auto_26517 ) ( ON ?auto_26505 ?auto_26520 ) ( CLEAR ?auto_26505 ) ( not ( = ?auto_26501 ?auto_26505 ) ) ( not ( = ?auto_26501 ?auto_26520 ) ) ( not ( = ?auto_26505 ?auto_26520 ) ) ( IS-CRATE ?auto_26501 ) ( not ( = ?auto_26530 ?auto_26506 ) ) ( HOIST-AT ?auto_26519 ?auto_26530 ) ( AVAILABLE ?auto_26519 ) ( SURFACE-AT ?auto_26501 ?auto_26530 ) ( ON ?auto_26501 ?auto_26516 ) ( CLEAR ?auto_26501 ) ( not ( = ?auto_26503 ?auto_26501 ) ) ( not ( = ?auto_26503 ?auto_26516 ) ) ( not ( = ?auto_26501 ?auto_26516 ) ) ( not ( = ?auto_26509 ?auto_26519 ) ) ( IS-CRATE ?auto_26503 ) ( not ( = ?auto_26518 ?auto_26506 ) ) ( HOIST-AT ?auto_26524 ?auto_26518 ) ( AVAILABLE ?auto_26524 ) ( SURFACE-AT ?auto_26503 ?auto_26518 ) ( ON ?auto_26503 ?auto_26528 ) ( CLEAR ?auto_26503 ) ( not ( = ?auto_26500 ?auto_26503 ) ) ( not ( = ?auto_26500 ?auto_26528 ) ) ( not ( = ?auto_26503 ?auto_26528 ) ) ( not ( = ?auto_26509 ?auto_26524 ) ) ( IS-CRATE ?auto_26500 ) ( AVAILABLE ?auto_26508 ) ( SURFACE-AT ?auto_26500 ?auto_26507 ) ( ON ?auto_26500 ?auto_26515 ) ( CLEAR ?auto_26500 ) ( not ( = ?auto_26499 ?auto_26500 ) ) ( not ( = ?auto_26499 ?auto_26515 ) ) ( not ( = ?auto_26500 ?auto_26515 ) ) ( IS-CRATE ?auto_26499 ) ( not ( = ?auto_26512 ?auto_26506 ) ) ( HOIST-AT ?auto_26525 ?auto_26512 ) ( AVAILABLE ?auto_26525 ) ( SURFACE-AT ?auto_26499 ?auto_26512 ) ( ON ?auto_26499 ?auto_26531 ) ( CLEAR ?auto_26499 ) ( not ( = ?auto_26498 ?auto_26499 ) ) ( not ( = ?auto_26498 ?auto_26531 ) ) ( not ( = ?auto_26499 ?auto_26531 ) ) ( not ( = ?auto_26509 ?auto_26525 ) ) ( IS-CRATE ?auto_26498 ) ( not ( = ?auto_26513 ?auto_26506 ) ) ( HOIST-AT ?auto_26526 ?auto_26513 ) ( AVAILABLE ?auto_26526 ) ( SURFACE-AT ?auto_26498 ?auto_26513 ) ( ON ?auto_26498 ?auto_26514 ) ( CLEAR ?auto_26498 ) ( not ( = ?auto_26497 ?auto_26498 ) ) ( not ( = ?auto_26497 ?auto_26514 ) ) ( not ( = ?auto_26498 ?auto_26514 ) ) ( not ( = ?auto_26509 ?auto_26526 ) ) ( SURFACE-AT ?auto_26496 ?auto_26506 ) ( CLEAR ?auto_26496 ) ( IS-CRATE ?auto_26497 ) ( AVAILABLE ?auto_26509 ) ( not ( = ?auto_26529 ?auto_26506 ) ) ( HOIST-AT ?auto_26527 ?auto_26529 ) ( AVAILABLE ?auto_26527 ) ( SURFACE-AT ?auto_26497 ?auto_26529 ) ( ON ?auto_26497 ?auto_26521 ) ( CLEAR ?auto_26497 ) ( TRUCK-AT ?auto_26511 ?auto_26506 ) ( not ( = ?auto_26496 ?auto_26497 ) ) ( not ( = ?auto_26496 ?auto_26521 ) ) ( not ( = ?auto_26497 ?auto_26521 ) ) ( not ( = ?auto_26509 ?auto_26527 ) ) ( not ( = ?auto_26496 ?auto_26498 ) ) ( not ( = ?auto_26496 ?auto_26514 ) ) ( not ( = ?auto_26498 ?auto_26521 ) ) ( not ( = ?auto_26513 ?auto_26529 ) ) ( not ( = ?auto_26526 ?auto_26527 ) ) ( not ( = ?auto_26514 ?auto_26521 ) ) ( not ( = ?auto_26496 ?auto_26499 ) ) ( not ( = ?auto_26496 ?auto_26531 ) ) ( not ( = ?auto_26497 ?auto_26499 ) ) ( not ( = ?auto_26497 ?auto_26531 ) ) ( not ( = ?auto_26499 ?auto_26514 ) ) ( not ( = ?auto_26499 ?auto_26521 ) ) ( not ( = ?auto_26512 ?auto_26513 ) ) ( not ( = ?auto_26512 ?auto_26529 ) ) ( not ( = ?auto_26525 ?auto_26526 ) ) ( not ( = ?auto_26525 ?auto_26527 ) ) ( not ( = ?auto_26531 ?auto_26514 ) ) ( not ( = ?auto_26531 ?auto_26521 ) ) ( not ( = ?auto_26496 ?auto_26500 ) ) ( not ( = ?auto_26496 ?auto_26515 ) ) ( not ( = ?auto_26497 ?auto_26500 ) ) ( not ( = ?auto_26497 ?auto_26515 ) ) ( not ( = ?auto_26498 ?auto_26500 ) ) ( not ( = ?auto_26498 ?auto_26515 ) ) ( not ( = ?auto_26500 ?auto_26531 ) ) ( not ( = ?auto_26500 ?auto_26514 ) ) ( not ( = ?auto_26500 ?auto_26521 ) ) ( not ( = ?auto_26507 ?auto_26512 ) ) ( not ( = ?auto_26507 ?auto_26513 ) ) ( not ( = ?auto_26507 ?auto_26529 ) ) ( not ( = ?auto_26508 ?auto_26525 ) ) ( not ( = ?auto_26508 ?auto_26526 ) ) ( not ( = ?auto_26508 ?auto_26527 ) ) ( not ( = ?auto_26515 ?auto_26531 ) ) ( not ( = ?auto_26515 ?auto_26514 ) ) ( not ( = ?auto_26515 ?auto_26521 ) ) ( not ( = ?auto_26496 ?auto_26503 ) ) ( not ( = ?auto_26496 ?auto_26528 ) ) ( not ( = ?auto_26497 ?auto_26503 ) ) ( not ( = ?auto_26497 ?auto_26528 ) ) ( not ( = ?auto_26498 ?auto_26503 ) ) ( not ( = ?auto_26498 ?auto_26528 ) ) ( not ( = ?auto_26499 ?auto_26503 ) ) ( not ( = ?auto_26499 ?auto_26528 ) ) ( not ( = ?auto_26503 ?auto_26515 ) ) ( not ( = ?auto_26503 ?auto_26531 ) ) ( not ( = ?auto_26503 ?auto_26514 ) ) ( not ( = ?auto_26503 ?auto_26521 ) ) ( not ( = ?auto_26518 ?auto_26507 ) ) ( not ( = ?auto_26518 ?auto_26512 ) ) ( not ( = ?auto_26518 ?auto_26513 ) ) ( not ( = ?auto_26518 ?auto_26529 ) ) ( not ( = ?auto_26524 ?auto_26508 ) ) ( not ( = ?auto_26524 ?auto_26525 ) ) ( not ( = ?auto_26524 ?auto_26526 ) ) ( not ( = ?auto_26524 ?auto_26527 ) ) ( not ( = ?auto_26528 ?auto_26515 ) ) ( not ( = ?auto_26528 ?auto_26531 ) ) ( not ( = ?auto_26528 ?auto_26514 ) ) ( not ( = ?auto_26528 ?auto_26521 ) ) ( not ( = ?auto_26496 ?auto_26501 ) ) ( not ( = ?auto_26496 ?auto_26516 ) ) ( not ( = ?auto_26497 ?auto_26501 ) ) ( not ( = ?auto_26497 ?auto_26516 ) ) ( not ( = ?auto_26498 ?auto_26501 ) ) ( not ( = ?auto_26498 ?auto_26516 ) ) ( not ( = ?auto_26499 ?auto_26501 ) ) ( not ( = ?auto_26499 ?auto_26516 ) ) ( not ( = ?auto_26500 ?auto_26501 ) ) ( not ( = ?auto_26500 ?auto_26516 ) ) ( not ( = ?auto_26501 ?auto_26528 ) ) ( not ( = ?auto_26501 ?auto_26515 ) ) ( not ( = ?auto_26501 ?auto_26531 ) ) ( not ( = ?auto_26501 ?auto_26514 ) ) ( not ( = ?auto_26501 ?auto_26521 ) ) ( not ( = ?auto_26530 ?auto_26518 ) ) ( not ( = ?auto_26530 ?auto_26507 ) ) ( not ( = ?auto_26530 ?auto_26512 ) ) ( not ( = ?auto_26530 ?auto_26513 ) ) ( not ( = ?auto_26530 ?auto_26529 ) ) ( not ( = ?auto_26519 ?auto_26524 ) ) ( not ( = ?auto_26519 ?auto_26508 ) ) ( not ( = ?auto_26519 ?auto_26525 ) ) ( not ( = ?auto_26519 ?auto_26526 ) ) ( not ( = ?auto_26519 ?auto_26527 ) ) ( not ( = ?auto_26516 ?auto_26528 ) ) ( not ( = ?auto_26516 ?auto_26515 ) ) ( not ( = ?auto_26516 ?auto_26531 ) ) ( not ( = ?auto_26516 ?auto_26514 ) ) ( not ( = ?auto_26516 ?auto_26521 ) ) ( not ( = ?auto_26496 ?auto_26505 ) ) ( not ( = ?auto_26496 ?auto_26520 ) ) ( not ( = ?auto_26497 ?auto_26505 ) ) ( not ( = ?auto_26497 ?auto_26520 ) ) ( not ( = ?auto_26498 ?auto_26505 ) ) ( not ( = ?auto_26498 ?auto_26520 ) ) ( not ( = ?auto_26499 ?auto_26505 ) ) ( not ( = ?auto_26499 ?auto_26520 ) ) ( not ( = ?auto_26500 ?auto_26505 ) ) ( not ( = ?auto_26500 ?auto_26520 ) ) ( not ( = ?auto_26503 ?auto_26505 ) ) ( not ( = ?auto_26503 ?auto_26520 ) ) ( not ( = ?auto_26505 ?auto_26516 ) ) ( not ( = ?auto_26505 ?auto_26528 ) ) ( not ( = ?auto_26505 ?auto_26515 ) ) ( not ( = ?auto_26505 ?auto_26531 ) ) ( not ( = ?auto_26505 ?auto_26514 ) ) ( not ( = ?auto_26505 ?auto_26521 ) ) ( not ( = ?auto_26517 ?auto_26530 ) ) ( not ( = ?auto_26517 ?auto_26518 ) ) ( not ( = ?auto_26517 ?auto_26507 ) ) ( not ( = ?auto_26517 ?auto_26512 ) ) ( not ( = ?auto_26517 ?auto_26513 ) ) ( not ( = ?auto_26517 ?auto_26529 ) ) ( not ( = ?auto_26522 ?auto_26519 ) ) ( not ( = ?auto_26522 ?auto_26524 ) ) ( not ( = ?auto_26522 ?auto_26508 ) ) ( not ( = ?auto_26522 ?auto_26525 ) ) ( not ( = ?auto_26522 ?auto_26526 ) ) ( not ( = ?auto_26522 ?auto_26527 ) ) ( not ( = ?auto_26520 ?auto_26516 ) ) ( not ( = ?auto_26520 ?auto_26528 ) ) ( not ( = ?auto_26520 ?auto_26515 ) ) ( not ( = ?auto_26520 ?auto_26531 ) ) ( not ( = ?auto_26520 ?auto_26514 ) ) ( not ( = ?auto_26520 ?auto_26521 ) ) ( not ( = ?auto_26496 ?auto_26504 ) ) ( not ( = ?auto_26496 ?auto_26523 ) ) ( not ( = ?auto_26497 ?auto_26504 ) ) ( not ( = ?auto_26497 ?auto_26523 ) ) ( not ( = ?auto_26498 ?auto_26504 ) ) ( not ( = ?auto_26498 ?auto_26523 ) ) ( not ( = ?auto_26499 ?auto_26504 ) ) ( not ( = ?auto_26499 ?auto_26523 ) ) ( not ( = ?auto_26500 ?auto_26504 ) ) ( not ( = ?auto_26500 ?auto_26523 ) ) ( not ( = ?auto_26503 ?auto_26504 ) ) ( not ( = ?auto_26503 ?auto_26523 ) ) ( not ( = ?auto_26501 ?auto_26504 ) ) ( not ( = ?auto_26501 ?auto_26523 ) ) ( not ( = ?auto_26504 ?auto_26520 ) ) ( not ( = ?auto_26504 ?auto_26516 ) ) ( not ( = ?auto_26504 ?auto_26528 ) ) ( not ( = ?auto_26504 ?auto_26515 ) ) ( not ( = ?auto_26504 ?auto_26531 ) ) ( not ( = ?auto_26504 ?auto_26514 ) ) ( not ( = ?auto_26504 ?auto_26521 ) ) ( not ( = ?auto_26523 ?auto_26520 ) ) ( not ( = ?auto_26523 ?auto_26516 ) ) ( not ( = ?auto_26523 ?auto_26528 ) ) ( not ( = ?auto_26523 ?auto_26515 ) ) ( not ( = ?auto_26523 ?auto_26531 ) ) ( not ( = ?auto_26523 ?auto_26514 ) ) ( not ( = ?auto_26523 ?auto_26521 ) ) ( not ( = ?auto_26496 ?auto_26502 ) ) ( not ( = ?auto_26496 ?auto_26510 ) ) ( not ( = ?auto_26497 ?auto_26502 ) ) ( not ( = ?auto_26497 ?auto_26510 ) ) ( not ( = ?auto_26498 ?auto_26502 ) ) ( not ( = ?auto_26498 ?auto_26510 ) ) ( not ( = ?auto_26499 ?auto_26502 ) ) ( not ( = ?auto_26499 ?auto_26510 ) ) ( not ( = ?auto_26500 ?auto_26502 ) ) ( not ( = ?auto_26500 ?auto_26510 ) ) ( not ( = ?auto_26503 ?auto_26502 ) ) ( not ( = ?auto_26503 ?auto_26510 ) ) ( not ( = ?auto_26501 ?auto_26502 ) ) ( not ( = ?auto_26501 ?auto_26510 ) ) ( not ( = ?auto_26505 ?auto_26502 ) ) ( not ( = ?auto_26505 ?auto_26510 ) ) ( not ( = ?auto_26502 ?auto_26523 ) ) ( not ( = ?auto_26502 ?auto_26520 ) ) ( not ( = ?auto_26502 ?auto_26516 ) ) ( not ( = ?auto_26502 ?auto_26528 ) ) ( not ( = ?auto_26502 ?auto_26515 ) ) ( not ( = ?auto_26502 ?auto_26531 ) ) ( not ( = ?auto_26502 ?auto_26514 ) ) ( not ( = ?auto_26502 ?auto_26521 ) ) ( not ( = ?auto_26510 ?auto_26523 ) ) ( not ( = ?auto_26510 ?auto_26520 ) ) ( not ( = ?auto_26510 ?auto_26516 ) ) ( not ( = ?auto_26510 ?auto_26528 ) ) ( not ( = ?auto_26510 ?auto_26515 ) ) ( not ( = ?auto_26510 ?auto_26531 ) ) ( not ( = ?auto_26510 ?auto_26514 ) ) ( not ( = ?auto_26510 ?auto_26521 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_26496 ?auto_26497 ?auto_26498 ?auto_26499 ?auto_26500 ?auto_26503 ?auto_26501 ?auto_26505 ?auto_26504 )
      ( MAKE-1CRATE ?auto_26504 ?auto_26502 )
      ( MAKE-9CRATE-VERIFY ?auto_26496 ?auto_26497 ?auto_26498 ?auto_26499 ?auto_26500 ?auto_26503 ?auto_26501 ?auto_26505 ?auto_26504 ?auto_26502 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26534 - SURFACE
      ?auto_26535 - SURFACE
    )
    :vars
    (
      ?auto_26536 - HOIST
      ?auto_26537 - PLACE
      ?auto_26539 - PLACE
      ?auto_26540 - HOIST
      ?auto_26541 - SURFACE
      ?auto_26538 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26536 ?auto_26537 ) ( SURFACE-AT ?auto_26534 ?auto_26537 ) ( CLEAR ?auto_26534 ) ( IS-CRATE ?auto_26535 ) ( AVAILABLE ?auto_26536 ) ( not ( = ?auto_26539 ?auto_26537 ) ) ( HOIST-AT ?auto_26540 ?auto_26539 ) ( AVAILABLE ?auto_26540 ) ( SURFACE-AT ?auto_26535 ?auto_26539 ) ( ON ?auto_26535 ?auto_26541 ) ( CLEAR ?auto_26535 ) ( TRUCK-AT ?auto_26538 ?auto_26537 ) ( not ( = ?auto_26534 ?auto_26535 ) ) ( not ( = ?auto_26534 ?auto_26541 ) ) ( not ( = ?auto_26535 ?auto_26541 ) ) ( not ( = ?auto_26536 ?auto_26540 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26538 ?auto_26537 ?auto_26539 )
      ( !LIFT ?auto_26540 ?auto_26535 ?auto_26541 ?auto_26539 )
      ( !LOAD ?auto_26540 ?auto_26535 ?auto_26538 ?auto_26539 )
      ( !DRIVE ?auto_26538 ?auto_26539 ?auto_26537 )
      ( !UNLOAD ?auto_26536 ?auto_26535 ?auto_26538 ?auto_26537 )
      ( !DROP ?auto_26536 ?auto_26535 ?auto_26534 ?auto_26537 )
      ( MAKE-1CRATE-VERIFY ?auto_26534 ?auto_26535 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_26553 - SURFACE
      ?auto_26554 - SURFACE
      ?auto_26555 - SURFACE
      ?auto_26556 - SURFACE
      ?auto_26557 - SURFACE
      ?auto_26560 - SURFACE
      ?auto_26558 - SURFACE
      ?auto_26562 - SURFACE
      ?auto_26561 - SURFACE
      ?auto_26559 - SURFACE
      ?auto_26563 - SURFACE
    )
    :vars
    (
      ?auto_26569 - HOIST
      ?auto_26566 - PLACE
      ?auto_26564 - PLACE
      ?auto_26565 - HOIST
      ?auto_26567 - SURFACE
      ?auto_26580 - PLACE
      ?auto_26571 - HOIST
      ?auto_26590 - SURFACE
      ?auto_26577 - PLACE
      ?auto_26584 - HOIST
      ?auto_26591 - SURFACE
      ?auto_26587 - SURFACE
      ?auto_26582 - PLACE
      ?auto_26575 - HOIST
      ?auto_26578 - SURFACE
      ?auto_26576 - PLACE
      ?auto_26572 - HOIST
      ?auto_26585 - SURFACE
      ?auto_26592 - SURFACE
      ?auto_26581 - PLACE
      ?auto_26583 - HOIST
      ?auto_26589 - SURFACE
      ?auto_26573 - PLACE
      ?auto_26579 - HOIST
      ?auto_26588 - SURFACE
      ?auto_26570 - PLACE
      ?auto_26574 - HOIST
      ?auto_26586 - SURFACE
      ?auto_26568 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26569 ?auto_26566 ) ( IS-CRATE ?auto_26563 ) ( not ( = ?auto_26564 ?auto_26566 ) ) ( HOIST-AT ?auto_26565 ?auto_26564 ) ( AVAILABLE ?auto_26565 ) ( SURFACE-AT ?auto_26563 ?auto_26564 ) ( ON ?auto_26563 ?auto_26567 ) ( CLEAR ?auto_26563 ) ( not ( = ?auto_26559 ?auto_26563 ) ) ( not ( = ?auto_26559 ?auto_26567 ) ) ( not ( = ?auto_26563 ?auto_26567 ) ) ( not ( = ?auto_26569 ?auto_26565 ) ) ( IS-CRATE ?auto_26559 ) ( not ( = ?auto_26580 ?auto_26566 ) ) ( HOIST-AT ?auto_26571 ?auto_26580 ) ( SURFACE-AT ?auto_26559 ?auto_26580 ) ( ON ?auto_26559 ?auto_26590 ) ( CLEAR ?auto_26559 ) ( not ( = ?auto_26561 ?auto_26559 ) ) ( not ( = ?auto_26561 ?auto_26590 ) ) ( not ( = ?auto_26559 ?auto_26590 ) ) ( not ( = ?auto_26569 ?auto_26571 ) ) ( IS-CRATE ?auto_26561 ) ( not ( = ?auto_26577 ?auto_26566 ) ) ( HOIST-AT ?auto_26584 ?auto_26577 ) ( SURFACE-AT ?auto_26561 ?auto_26577 ) ( ON ?auto_26561 ?auto_26591 ) ( CLEAR ?auto_26561 ) ( not ( = ?auto_26562 ?auto_26561 ) ) ( not ( = ?auto_26562 ?auto_26591 ) ) ( not ( = ?auto_26561 ?auto_26591 ) ) ( not ( = ?auto_26569 ?auto_26584 ) ) ( IS-CRATE ?auto_26562 ) ( AVAILABLE ?auto_26584 ) ( SURFACE-AT ?auto_26562 ?auto_26577 ) ( ON ?auto_26562 ?auto_26587 ) ( CLEAR ?auto_26562 ) ( not ( = ?auto_26558 ?auto_26562 ) ) ( not ( = ?auto_26558 ?auto_26587 ) ) ( not ( = ?auto_26562 ?auto_26587 ) ) ( IS-CRATE ?auto_26558 ) ( not ( = ?auto_26582 ?auto_26566 ) ) ( HOIST-AT ?auto_26575 ?auto_26582 ) ( AVAILABLE ?auto_26575 ) ( SURFACE-AT ?auto_26558 ?auto_26582 ) ( ON ?auto_26558 ?auto_26578 ) ( CLEAR ?auto_26558 ) ( not ( = ?auto_26560 ?auto_26558 ) ) ( not ( = ?auto_26560 ?auto_26578 ) ) ( not ( = ?auto_26558 ?auto_26578 ) ) ( not ( = ?auto_26569 ?auto_26575 ) ) ( IS-CRATE ?auto_26560 ) ( not ( = ?auto_26576 ?auto_26566 ) ) ( HOIST-AT ?auto_26572 ?auto_26576 ) ( AVAILABLE ?auto_26572 ) ( SURFACE-AT ?auto_26560 ?auto_26576 ) ( ON ?auto_26560 ?auto_26585 ) ( CLEAR ?auto_26560 ) ( not ( = ?auto_26557 ?auto_26560 ) ) ( not ( = ?auto_26557 ?auto_26585 ) ) ( not ( = ?auto_26560 ?auto_26585 ) ) ( not ( = ?auto_26569 ?auto_26572 ) ) ( IS-CRATE ?auto_26557 ) ( AVAILABLE ?auto_26571 ) ( SURFACE-AT ?auto_26557 ?auto_26580 ) ( ON ?auto_26557 ?auto_26592 ) ( CLEAR ?auto_26557 ) ( not ( = ?auto_26556 ?auto_26557 ) ) ( not ( = ?auto_26556 ?auto_26592 ) ) ( not ( = ?auto_26557 ?auto_26592 ) ) ( IS-CRATE ?auto_26556 ) ( not ( = ?auto_26581 ?auto_26566 ) ) ( HOIST-AT ?auto_26583 ?auto_26581 ) ( AVAILABLE ?auto_26583 ) ( SURFACE-AT ?auto_26556 ?auto_26581 ) ( ON ?auto_26556 ?auto_26589 ) ( CLEAR ?auto_26556 ) ( not ( = ?auto_26555 ?auto_26556 ) ) ( not ( = ?auto_26555 ?auto_26589 ) ) ( not ( = ?auto_26556 ?auto_26589 ) ) ( not ( = ?auto_26569 ?auto_26583 ) ) ( IS-CRATE ?auto_26555 ) ( not ( = ?auto_26573 ?auto_26566 ) ) ( HOIST-AT ?auto_26579 ?auto_26573 ) ( AVAILABLE ?auto_26579 ) ( SURFACE-AT ?auto_26555 ?auto_26573 ) ( ON ?auto_26555 ?auto_26588 ) ( CLEAR ?auto_26555 ) ( not ( = ?auto_26554 ?auto_26555 ) ) ( not ( = ?auto_26554 ?auto_26588 ) ) ( not ( = ?auto_26555 ?auto_26588 ) ) ( not ( = ?auto_26569 ?auto_26579 ) ) ( SURFACE-AT ?auto_26553 ?auto_26566 ) ( CLEAR ?auto_26553 ) ( IS-CRATE ?auto_26554 ) ( AVAILABLE ?auto_26569 ) ( not ( = ?auto_26570 ?auto_26566 ) ) ( HOIST-AT ?auto_26574 ?auto_26570 ) ( AVAILABLE ?auto_26574 ) ( SURFACE-AT ?auto_26554 ?auto_26570 ) ( ON ?auto_26554 ?auto_26586 ) ( CLEAR ?auto_26554 ) ( TRUCK-AT ?auto_26568 ?auto_26566 ) ( not ( = ?auto_26553 ?auto_26554 ) ) ( not ( = ?auto_26553 ?auto_26586 ) ) ( not ( = ?auto_26554 ?auto_26586 ) ) ( not ( = ?auto_26569 ?auto_26574 ) ) ( not ( = ?auto_26553 ?auto_26555 ) ) ( not ( = ?auto_26553 ?auto_26588 ) ) ( not ( = ?auto_26555 ?auto_26586 ) ) ( not ( = ?auto_26573 ?auto_26570 ) ) ( not ( = ?auto_26579 ?auto_26574 ) ) ( not ( = ?auto_26588 ?auto_26586 ) ) ( not ( = ?auto_26553 ?auto_26556 ) ) ( not ( = ?auto_26553 ?auto_26589 ) ) ( not ( = ?auto_26554 ?auto_26556 ) ) ( not ( = ?auto_26554 ?auto_26589 ) ) ( not ( = ?auto_26556 ?auto_26588 ) ) ( not ( = ?auto_26556 ?auto_26586 ) ) ( not ( = ?auto_26581 ?auto_26573 ) ) ( not ( = ?auto_26581 ?auto_26570 ) ) ( not ( = ?auto_26583 ?auto_26579 ) ) ( not ( = ?auto_26583 ?auto_26574 ) ) ( not ( = ?auto_26589 ?auto_26588 ) ) ( not ( = ?auto_26589 ?auto_26586 ) ) ( not ( = ?auto_26553 ?auto_26557 ) ) ( not ( = ?auto_26553 ?auto_26592 ) ) ( not ( = ?auto_26554 ?auto_26557 ) ) ( not ( = ?auto_26554 ?auto_26592 ) ) ( not ( = ?auto_26555 ?auto_26557 ) ) ( not ( = ?auto_26555 ?auto_26592 ) ) ( not ( = ?auto_26557 ?auto_26589 ) ) ( not ( = ?auto_26557 ?auto_26588 ) ) ( not ( = ?auto_26557 ?auto_26586 ) ) ( not ( = ?auto_26580 ?auto_26581 ) ) ( not ( = ?auto_26580 ?auto_26573 ) ) ( not ( = ?auto_26580 ?auto_26570 ) ) ( not ( = ?auto_26571 ?auto_26583 ) ) ( not ( = ?auto_26571 ?auto_26579 ) ) ( not ( = ?auto_26571 ?auto_26574 ) ) ( not ( = ?auto_26592 ?auto_26589 ) ) ( not ( = ?auto_26592 ?auto_26588 ) ) ( not ( = ?auto_26592 ?auto_26586 ) ) ( not ( = ?auto_26553 ?auto_26560 ) ) ( not ( = ?auto_26553 ?auto_26585 ) ) ( not ( = ?auto_26554 ?auto_26560 ) ) ( not ( = ?auto_26554 ?auto_26585 ) ) ( not ( = ?auto_26555 ?auto_26560 ) ) ( not ( = ?auto_26555 ?auto_26585 ) ) ( not ( = ?auto_26556 ?auto_26560 ) ) ( not ( = ?auto_26556 ?auto_26585 ) ) ( not ( = ?auto_26560 ?auto_26592 ) ) ( not ( = ?auto_26560 ?auto_26589 ) ) ( not ( = ?auto_26560 ?auto_26588 ) ) ( not ( = ?auto_26560 ?auto_26586 ) ) ( not ( = ?auto_26576 ?auto_26580 ) ) ( not ( = ?auto_26576 ?auto_26581 ) ) ( not ( = ?auto_26576 ?auto_26573 ) ) ( not ( = ?auto_26576 ?auto_26570 ) ) ( not ( = ?auto_26572 ?auto_26571 ) ) ( not ( = ?auto_26572 ?auto_26583 ) ) ( not ( = ?auto_26572 ?auto_26579 ) ) ( not ( = ?auto_26572 ?auto_26574 ) ) ( not ( = ?auto_26585 ?auto_26592 ) ) ( not ( = ?auto_26585 ?auto_26589 ) ) ( not ( = ?auto_26585 ?auto_26588 ) ) ( not ( = ?auto_26585 ?auto_26586 ) ) ( not ( = ?auto_26553 ?auto_26558 ) ) ( not ( = ?auto_26553 ?auto_26578 ) ) ( not ( = ?auto_26554 ?auto_26558 ) ) ( not ( = ?auto_26554 ?auto_26578 ) ) ( not ( = ?auto_26555 ?auto_26558 ) ) ( not ( = ?auto_26555 ?auto_26578 ) ) ( not ( = ?auto_26556 ?auto_26558 ) ) ( not ( = ?auto_26556 ?auto_26578 ) ) ( not ( = ?auto_26557 ?auto_26558 ) ) ( not ( = ?auto_26557 ?auto_26578 ) ) ( not ( = ?auto_26558 ?auto_26585 ) ) ( not ( = ?auto_26558 ?auto_26592 ) ) ( not ( = ?auto_26558 ?auto_26589 ) ) ( not ( = ?auto_26558 ?auto_26588 ) ) ( not ( = ?auto_26558 ?auto_26586 ) ) ( not ( = ?auto_26582 ?auto_26576 ) ) ( not ( = ?auto_26582 ?auto_26580 ) ) ( not ( = ?auto_26582 ?auto_26581 ) ) ( not ( = ?auto_26582 ?auto_26573 ) ) ( not ( = ?auto_26582 ?auto_26570 ) ) ( not ( = ?auto_26575 ?auto_26572 ) ) ( not ( = ?auto_26575 ?auto_26571 ) ) ( not ( = ?auto_26575 ?auto_26583 ) ) ( not ( = ?auto_26575 ?auto_26579 ) ) ( not ( = ?auto_26575 ?auto_26574 ) ) ( not ( = ?auto_26578 ?auto_26585 ) ) ( not ( = ?auto_26578 ?auto_26592 ) ) ( not ( = ?auto_26578 ?auto_26589 ) ) ( not ( = ?auto_26578 ?auto_26588 ) ) ( not ( = ?auto_26578 ?auto_26586 ) ) ( not ( = ?auto_26553 ?auto_26562 ) ) ( not ( = ?auto_26553 ?auto_26587 ) ) ( not ( = ?auto_26554 ?auto_26562 ) ) ( not ( = ?auto_26554 ?auto_26587 ) ) ( not ( = ?auto_26555 ?auto_26562 ) ) ( not ( = ?auto_26555 ?auto_26587 ) ) ( not ( = ?auto_26556 ?auto_26562 ) ) ( not ( = ?auto_26556 ?auto_26587 ) ) ( not ( = ?auto_26557 ?auto_26562 ) ) ( not ( = ?auto_26557 ?auto_26587 ) ) ( not ( = ?auto_26560 ?auto_26562 ) ) ( not ( = ?auto_26560 ?auto_26587 ) ) ( not ( = ?auto_26562 ?auto_26578 ) ) ( not ( = ?auto_26562 ?auto_26585 ) ) ( not ( = ?auto_26562 ?auto_26592 ) ) ( not ( = ?auto_26562 ?auto_26589 ) ) ( not ( = ?auto_26562 ?auto_26588 ) ) ( not ( = ?auto_26562 ?auto_26586 ) ) ( not ( = ?auto_26577 ?auto_26582 ) ) ( not ( = ?auto_26577 ?auto_26576 ) ) ( not ( = ?auto_26577 ?auto_26580 ) ) ( not ( = ?auto_26577 ?auto_26581 ) ) ( not ( = ?auto_26577 ?auto_26573 ) ) ( not ( = ?auto_26577 ?auto_26570 ) ) ( not ( = ?auto_26584 ?auto_26575 ) ) ( not ( = ?auto_26584 ?auto_26572 ) ) ( not ( = ?auto_26584 ?auto_26571 ) ) ( not ( = ?auto_26584 ?auto_26583 ) ) ( not ( = ?auto_26584 ?auto_26579 ) ) ( not ( = ?auto_26584 ?auto_26574 ) ) ( not ( = ?auto_26587 ?auto_26578 ) ) ( not ( = ?auto_26587 ?auto_26585 ) ) ( not ( = ?auto_26587 ?auto_26592 ) ) ( not ( = ?auto_26587 ?auto_26589 ) ) ( not ( = ?auto_26587 ?auto_26588 ) ) ( not ( = ?auto_26587 ?auto_26586 ) ) ( not ( = ?auto_26553 ?auto_26561 ) ) ( not ( = ?auto_26553 ?auto_26591 ) ) ( not ( = ?auto_26554 ?auto_26561 ) ) ( not ( = ?auto_26554 ?auto_26591 ) ) ( not ( = ?auto_26555 ?auto_26561 ) ) ( not ( = ?auto_26555 ?auto_26591 ) ) ( not ( = ?auto_26556 ?auto_26561 ) ) ( not ( = ?auto_26556 ?auto_26591 ) ) ( not ( = ?auto_26557 ?auto_26561 ) ) ( not ( = ?auto_26557 ?auto_26591 ) ) ( not ( = ?auto_26560 ?auto_26561 ) ) ( not ( = ?auto_26560 ?auto_26591 ) ) ( not ( = ?auto_26558 ?auto_26561 ) ) ( not ( = ?auto_26558 ?auto_26591 ) ) ( not ( = ?auto_26561 ?auto_26587 ) ) ( not ( = ?auto_26561 ?auto_26578 ) ) ( not ( = ?auto_26561 ?auto_26585 ) ) ( not ( = ?auto_26561 ?auto_26592 ) ) ( not ( = ?auto_26561 ?auto_26589 ) ) ( not ( = ?auto_26561 ?auto_26588 ) ) ( not ( = ?auto_26561 ?auto_26586 ) ) ( not ( = ?auto_26591 ?auto_26587 ) ) ( not ( = ?auto_26591 ?auto_26578 ) ) ( not ( = ?auto_26591 ?auto_26585 ) ) ( not ( = ?auto_26591 ?auto_26592 ) ) ( not ( = ?auto_26591 ?auto_26589 ) ) ( not ( = ?auto_26591 ?auto_26588 ) ) ( not ( = ?auto_26591 ?auto_26586 ) ) ( not ( = ?auto_26553 ?auto_26559 ) ) ( not ( = ?auto_26553 ?auto_26590 ) ) ( not ( = ?auto_26554 ?auto_26559 ) ) ( not ( = ?auto_26554 ?auto_26590 ) ) ( not ( = ?auto_26555 ?auto_26559 ) ) ( not ( = ?auto_26555 ?auto_26590 ) ) ( not ( = ?auto_26556 ?auto_26559 ) ) ( not ( = ?auto_26556 ?auto_26590 ) ) ( not ( = ?auto_26557 ?auto_26559 ) ) ( not ( = ?auto_26557 ?auto_26590 ) ) ( not ( = ?auto_26560 ?auto_26559 ) ) ( not ( = ?auto_26560 ?auto_26590 ) ) ( not ( = ?auto_26558 ?auto_26559 ) ) ( not ( = ?auto_26558 ?auto_26590 ) ) ( not ( = ?auto_26562 ?auto_26559 ) ) ( not ( = ?auto_26562 ?auto_26590 ) ) ( not ( = ?auto_26559 ?auto_26591 ) ) ( not ( = ?auto_26559 ?auto_26587 ) ) ( not ( = ?auto_26559 ?auto_26578 ) ) ( not ( = ?auto_26559 ?auto_26585 ) ) ( not ( = ?auto_26559 ?auto_26592 ) ) ( not ( = ?auto_26559 ?auto_26589 ) ) ( not ( = ?auto_26559 ?auto_26588 ) ) ( not ( = ?auto_26559 ?auto_26586 ) ) ( not ( = ?auto_26590 ?auto_26591 ) ) ( not ( = ?auto_26590 ?auto_26587 ) ) ( not ( = ?auto_26590 ?auto_26578 ) ) ( not ( = ?auto_26590 ?auto_26585 ) ) ( not ( = ?auto_26590 ?auto_26592 ) ) ( not ( = ?auto_26590 ?auto_26589 ) ) ( not ( = ?auto_26590 ?auto_26588 ) ) ( not ( = ?auto_26590 ?auto_26586 ) ) ( not ( = ?auto_26553 ?auto_26563 ) ) ( not ( = ?auto_26553 ?auto_26567 ) ) ( not ( = ?auto_26554 ?auto_26563 ) ) ( not ( = ?auto_26554 ?auto_26567 ) ) ( not ( = ?auto_26555 ?auto_26563 ) ) ( not ( = ?auto_26555 ?auto_26567 ) ) ( not ( = ?auto_26556 ?auto_26563 ) ) ( not ( = ?auto_26556 ?auto_26567 ) ) ( not ( = ?auto_26557 ?auto_26563 ) ) ( not ( = ?auto_26557 ?auto_26567 ) ) ( not ( = ?auto_26560 ?auto_26563 ) ) ( not ( = ?auto_26560 ?auto_26567 ) ) ( not ( = ?auto_26558 ?auto_26563 ) ) ( not ( = ?auto_26558 ?auto_26567 ) ) ( not ( = ?auto_26562 ?auto_26563 ) ) ( not ( = ?auto_26562 ?auto_26567 ) ) ( not ( = ?auto_26561 ?auto_26563 ) ) ( not ( = ?auto_26561 ?auto_26567 ) ) ( not ( = ?auto_26563 ?auto_26590 ) ) ( not ( = ?auto_26563 ?auto_26591 ) ) ( not ( = ?auto_26563 ?auto_26587 ) ) ( not ( = ?auto_26563 ?auto_26578 ) ) ( not ( = ?auto_26563 ?auto_26585 ) ) ( not ( = ?auto_26563 ?auto_26592 ) ) ( not ( = ?auto_26563 ?auto_26589 ) ) ( not ( = ?auto_26563 ?auto_26588 ) ) ( not ( = ?auto_26563 ?auto_26586 ) ) ( not ( = ?auto_26564 ?auto_26580 ) ) ( not ( = ?auto_26564 ?auto_26577 ) ) ( not ( = ?auto_26564 ?auto_26582 ) ) ( not ( = ?auto_26564 ?auto_26576 ) ) ( not ( = ?auto_26564 ?auto_26581 ) ) ( not ( = ?auto_26564 ?auto_26573 ) ) ( not ( = ?auto_26564 ?auto_26570 ) ) ( not ( = ?auto_26565 ?auto_26571 ) ) ( not ( = ?auto_26565 ?auto_26584 ) ) ( not ( = ?auto_26565 ?auto_26575 ) ) ( not ( = ?auto_26565 ?auto_26572 ) ) ( not ( = ?auto_26565 ?auto_26583 ) ) ( not ( = ?auto_26565 ?auto_26579 ) ) ( not ( = ?auto_26565 ?auto_26574 ) ) ( not ( = ?auto_26567 ?auto_26590 ) ) ( not ( = ?auto_26567 ?auto_26591 ) ) ( not ( = ?auto_26567 ?auto_26587 ) ) ( not ( = ?auto_26567 ?auto_26578 ) ) ( not ( = ?auto_26567 ?auto_26585 ) ) ( not ( = ?auto_26567 ?auto_26592 ) ) ( not ( = ?auto_26567 ?auto_26589 ) ) ( not ( = ?auto_26567 ?auto_26588 ) ) ( not ( = ?auto_26567 ?auto_26586 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_26553 ?auto_26554 ?auto_26555 ?auto_26556 ?auto_26557 ?auto_26560 ?auto_26558 ?auto_26562 ?auto_26561 ?auto_26559 )
      ( MAKE-1CRATE ?auto_26559 ?auto_26563 )
      ( MAKE-10CRATE-VERIFY ?auto_26553 ?auto_26554 ?auto_26555 ?auto_26556 ?auto_26557 ?auto_26560 ?auto_26558 ?auto_26562 ?auto_26561 ?auto_26559 ?auto_26563 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26595 - SURFACE
      ?auto_26596 - SURFACE
    )
    :vars
    (
      ?auto_26597 - HOIST
      ?auto_26598 - PLACE
      ?auto_26600 - PLACE
      ?auto_26601 - HOIST
      ?auto_26602 - SURFACE
      ?auto_26599 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26597 ?auto_26598 ) ( SURFACE-AT ?auto_26595 ?auto_26598 ) ( CLEAR ?auto_26595 ) ( IS-CRATE ?auto_26596 ) ( AVAILABLE ?auto_26597 ) ( not ( = ?auto_26600 ?auto_26598 ) ) ( HOIST-AT ?auto_26601 ?auto_26600 ) ( AVAILABLE ?auto_26601 ) ( SURFACE-AT ?auto_26596 ?auto_26600 ) ( ON ?auto_26596 ?auto_26602 ) ( CLEAR ?auto_26596 ) ( TRUCK-AT ?auto_26599 ?auto_26598 ) ( not ( = ?auto_26595 ?auto_26596 ) ) ( not ( = ?auto_26595 ?auto_26602 ) ) ( not ( = ?auto_26596 ?auto_26602 ) ) ( not ( = ?auto_26597 ?auto_26601 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26599 ?auto_26598 ?auto_26600 )
      ( !LIFT ?auto_26601 ?auto_26596 ?auto_26602 ?auto_26600 )
      ( !LOAD ?auto_26601 ?auto_26596 ?auto_26599 ?auto_26600 )
      ( !DRIVE ?auto_26599 ?auto_26600 ?auto_26598 )
      ( !UNLOAD ?auto_26597 ?auto_26596 ?auto_26599 ?auto_26598 )
      ( !DROP ?auto_26597 ?auto_26596 ?auto_26595 ?auto_26598 )
      ( MAKE-1CRATE-VERIFY ?auto_26595 ?auto_26596 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_26615 - SURFACE
      ?auto_26616 - SURFACE
      ?auto_26617 - SURFACE
      ?auto_26618 - SURFACE
      ?auto_26619 - SURFACE
      ?auto_26622 - SURFACE
      ?auto_26620 - SURFACE
      ?auto_26624 - SURFACE
      ?auto_26623 - SURFACE
      ?auto_26621 - SURFACE
      ?auto_26626 - SURFACE
      ?auto_26625 - SURFACE
    )
    :vars
    (
      ?auto_26630 - HOIST
      ?auto_26629 - PLACE
      ?auto_26628 - PLACE
      ?auto_26632 - HOIST
      ?auto_26627 - SURFACE
      ?auto_26643 - PLACE
      ?auto_26633 - HOIST
      ?auto_26658 - SURFACE
      ?auto_26650 - PLACE
      ?auto_26656 - HOIST
      ?auto_26647 - SURFACE
      ?auto_26646 - PLACE
      ?auto_26657 - HOIST
      ?auto_26648 - SURFACE
      ?auto_26641 - SURFACE
      ?auto_26652 - PLACE
      ?auto_26634 - HOIST
      ?auto_26649 - SURFACE
      ?auto_26654 - PLACE
      ?auto_26637 - HOIST
      ?auto_26655 - SURFACE
      ?auto_26644 - SURFACE
      ?auto_26640 - PLACE
      ?auto_26653 - HOIST
      ?auto_26645 - SURFACE
      ?auto_26635 - PLACE
      ?auto_26651 - HOIST
      ?auto_26639 - SURFACE
      ?auto_26636 - PLACE
      ?auto_26642 - HOIST
      ?auto_26638 - SURFACE
      ?auto_26631 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26630 ?auto_26629 ) ( IS-CRATE ?auto_26625 ) ( not ( = ?auto_26628 ?auto_26629 ) ) ( HOIST-AT ?auto_26632 ?auto_26628 ) ( AVAILABLE ?auto_26632 ) ( SURFACE-AT ?auto_26625 ?auto_26628 ) ( ON ?auto_26625 ?auto_26627 ) ( CLEAR ?auto_26625 ) ( not ( = ?auto_26626 ?auto_26625 ) ) ( not ( = ?auto_26626 ?auto_26627 ) ) ( not ( = ?auto_26625 ?auto_26627 ) ) ( not ( = ?auto_26630 ?auto_26632 ) ) ( IS-CRATE ?auto_26626 ) ( not ( = ?auto_26643 ?auto_26629 ) ) ( HOIST-AT ?auto_26633 ?auto_26643 ) ( AVAILABLE ?auto_26633 ) ( SURFACE-AT ?auto_26626 ?auto_26643 ) ( ON ?auto_26626 ?auto_26658 ) ( CLEAR ?auto_26626 ) ( not ( = ?auto_26621 ?auto_26626 ) ) ( not ( = ?auto_26621 ?auto_26658 ) ) ( not ( = ?auto_26626 ?auto_26658 ) ) ( not ( = ?auto_26630 ?auto_26633 ) ) ( IS-CRATE ?auto_26621 ) ( not ( = ?auto_26650 ?auto_26629 ) ) ( HOIST-AT ?auto_26656 ?auto_26650 ) ( SURFACE-AT ?auto_26621 ?auto_26650 ) ( ON ?auto_26621 ?auto_26647 ) ( CLEAR ?auto_26621 ) ( not ( = ?auto_26623 ?auto_26621 ) ) ( not ( = ?auto_26623 ?auto_26647 ) ) ( not ( = ?auto_26621 ?auto_26647 ) ) ( not ( = ?auto_26630 ?auto_26656 ) ) ( IS-CRATE ?auto_26623 ) ( not ( = ?auto_26646 ?auto_26629 ) ) ( HOIST-AT ?auto_26657 ?auto_26646 ) ( SURFACE-AT ?auto_26623 ?auto_26646 ) ( ON ?auto_26623 ?auto_26648 ) ( CLEAR ?auto_26623 ) ( not ( = ?auto_26624 ?auto_26623 ) ) ( not ( = ?auto_26624 ?auto_26648 ) ) ( not ( = ?auto_26623 ?auto_26648 ) ) ( not ( = ?auto_26630 ?auto_26657 ) ) ( IS-CRATE ?auto_26624 ) ( AVAILABLE ?auto_26657 ) ( SURFACE-AT ?auto_26624 ?auto_26646 ) ( ON ?auto_26624 ?auto_26641 ) ( CLEAR ?auto_26624 ) ( not ( = ?auto_26620 ?auto_26624 ) ) ( not ( = ?auto_26620 ?auto_26641 ) ) ( not ( = ?auto_26624 ?auto_26641 ) ) ( IS-CRATE ?auto_26620 ) ( not ( = ?auto_26652 ?auto_26629 ) ) ( HOIST-AT ?auto_26634 ?auto_26652 ) ( AVAILABLE ?auto_26634 ) ( SURFACE-AT ?auto_26620 ?auto_26652 ) ( ON ?auto_26620 ?auto_26649 ) ( CLEAR ?auto_26620 ) ( not ( = ?auto_26622 ?auto_26620 ) ) ( not ( = ?auto_26622 ?auto_26649 ) ) ( not ( = ?auto_26620 ?auto_26649 ) ) ( not ( = ?auto_26630 ?auto_26634 ) ) ( IS-CRATE ?auto_26622 ) ( not ( = ?auto_26654 ?auto_26629 ) ) ( HOIST-AT ?auto_26637 ?auto_26654 ) ( AVAILABLE ?auto_26637 ) ( SURFACE-AT ?auto_26622 ?auto_26654 ) ( ON ?auto_26622 ?auto_26655 ) ( CLEAR ?auto_26622 ) ( not ( = ?auto_26619 ?auto_26622 ) ) ( not ( = ?auto_26619 ?auto_26655 ) ) ( not ( = ?auto_26622 ?auto_26655 ) ) ( not ( = ?auto_26630 ?auto_26637 ) ) ( IS-CRATE ?auto_26619 ) ( AVAILABLE ?auto_26656 ) ( SURFACE-AT ?auto_26619 ?auto_26650 ) ( ON ?auto_26619 ?auto_26644 ) ( CLEAR ?auto_26619 ) ( not ( = ?auto_26618 ?auto_26619 ) ) ( not ( = ?auto_26618 ?auto_26644 ) ) ( not ( = ?auto_26619 ?auto_26644 ) ) ( IS-CRATE ?auto_26618 ) ( not ( = ?auto_26640 ?auto_26629 ) ) ( HOIST-AT ?auto_26653 ?auto_26640 ) ( AVAILABLE ?auto_26653 ) ( SURFACE-AT ?auto_26618 ?auto_26640 ) ( ON ?auto_26618 ?auto_26645 ) ( CLEAR ?auto_26618 ) ( not ( = ?auto_26617 ?auto_26618 ) ) ( not ( = ?auto_26617 ?auto_26645 ) ) ( not ( = ?auto_26618 ?auto_26645 ) ) ( not ( = ?auto_26630 ?auto_26653 ) ) ( IS-CRATE ?auto_26617 ) ( not ( = ?auto_26635 ?auto_26629 ) ) ( HOIST-AT ?auto_26651 ?auto_26635 ) ( AVAILABLE ?auto_26651 ) ( SURFACE-AT ?auto_26617 ?auto_26635 ) ( ON ?auto_26617 ?auto_26639 ) ( CLEAR ?auto_26617 ) ( not ( = ?auto_26616 ?auto_26617 ) ) ( not ( = ?auto_26616 ?auto_26639 ) ) ( not ( = ?auto_26617 ?auto_26639 ) ) ( not ( = ?auto_26630 ?auto_26651 ) ) ( SURFACE-AT ?auto_26615 ?auto_26629 ) ( CLEAR ?auto_26615 ) ( IS-CRATE ?auto_26616 ) ( AVAILABLE ?auto_26630 ) ( not ( = ?auto_26636 ?auto_26629 ) ) ( HOIST-AT ?auto_26642 ?auto_26636 ) ( AVAILABLE ?auto_26642 ) ( SURFACE-AT ?auto_26616 ?auto_26636 ) ( ON ?auto_26616 ?auto_26638 ) ( CLEAR ?auto_26616 ) ( TRUCK-AT ?auto_26631 ?auto_26629 ) ( not ( = ?auto_26615 ?auto_26616 ) ) ( not ( = ?auto_26615 ?auto_26638 ) ) ( not ( = ?auto_26616 ?auto_26638 ) ) ( not ( = ?auto_26630 ?auto_26642 ) ) ( not ( = ?auto_26615 ?auto_26617 ) ) ( not ( = ?auto_26615 ?auto_26639 ) ) ( not ( = ?auto_26617 ?auto_26638 ) ) ( not ( = ?auto_26635 ?auto_26636 ) ) ( not ( = ?auto_26651 ?auto_26642 ) ) ( not ( = ?auto_26639 ?auto_26638 ) ) ( not ( = ?auto_26615 ?auto_26618 ) ) ( not ( = ?auto_26615 ?auto_26645 ) ) ( not ( = ?auto_26616 ?auto_26618 ) ) ( not ( = ?auto_26616 ?auto_26645 ) ) ( not ( = ?auto_26618 ?auto_26639 ) ) ( not ( = ?auto_26618 ?auto_26638 ) ) ( not ( = ?auto_26640 ?auto_26635 ) ) ( not ( = ?auto_26640 ?auto_26636 ) ) ( not ( = ?auto_26653 ?auto_26651 ) ) ( not ( = ?auto_26653 ?auto_26642 ) ) ( not ( = ?auto_26645 ?auto_26639 ) ) ( not ( = ?auto_26645 ?auto_26638 ) ) ( not ( = ?auto_26615 ?auto_26619 ) ) ( not ( = ?auto_26615 ?auto_26644 ) ) ( not ( = ?auto_26616 ?auto_26619 ) ) ( not ( = ?auto_26616 ?auto_26644 ) ) ( not ( = ?auto_26617 ?auto_26619 ) ) ( not ( = ?auto_26617 ?auto_26644 ) ) ( not ( = ?auto_26619 ?auto_26645 ) ) ( not ( = ?auto_26619 ?auto_26639 ) ) ( not ( = ?auto_26619 ?auto_26638 ) ) ( not ( = ?auto_26650 ?auto_26640 ) ) ( not ( = ?auto_26650 ?auto_26635 ) ) ( not ( = ?auto_26650 ?auto_26636 ) ) ( not ( = ?auto_26656 ?auto_26653 ) ) ( not ( = ?auto_26656 ?auto_26651 ) ) ( not ( = ?auto_26656 ?auto_26642 ) ) ( not ( = ?auto_26644 ?auto_26645 ) ) ( not ( = ?auto_26644 ?auto_26639 ) ) ( not ( = ?auto_26644 ?auto_26638 ) ) ( not ( = ?auto_26615 ?auto_26622 ) ) ( not ( = ?auto_26615 ?auto_26655 ) ) ( not ( = ?auto_26616 ?auto_26622 ) ) ( not ( = ?auto_26616 ?auto_26655 ) ) ( not ( = ?auto_26617 ?auto_26622 ) ) ( not ( = ?auto_26617 ?auto_26655 ) ) ( not ( = ?auto_26618 ?auto_26622 ) ) ( not ( = ?auto_26618 ?auto_26655 ) ) ( not ( = ?auto_26622 ?auto_26644 ) ) ( not ( = ?auto_26622 ?auto_26645 ) ) ( not ( = ?auto_26622 ?auto_26639 ) ) ( not ( = ?auto_26622 ?auto_26638 ) ) ( not ( = ?auto_26654 ?auto_26650 ) ) ( not ( = ?auto_26654 ?auto_26640 ) ) ( not ( = ?auto_26654 ?auto_26635 ) ) ( not ( = ?auto_26654 ?auto_26636 ) ) ( not ( = ?auto_26637 ?auto_26656 ) ) ( not ( = ?auto_26637 ?auto_26653 ) ) ( not ( = ?auto_26637 ?auto_26651 ) ) ( not ( = ?auto_26637 ?auto_26642 ) ) ( not ( = ?auto_26655 ?auto_26644 ) ) ( not ( = ?auto_26655 ?auto_26645 ) ) ( not ( = ?auto_26655 ?auto_26639 ) ) ( not ( = ?auto_26655 ?auto_26638 ) ) ( not ( = ?auto_26615 ?auto_26620 ) ) ( not ( = ?auto_26615 ?auto_26649 ) ) ( not ( = ?auto_26616 ?auto_26620 ) ) ( not ( = ?auto_26616 ?auto_26649 ) ) ( not ( = ?auto_26617 ?auto_26620 ) ) ( not ( = ?auto_26617 ?auto_26649 ) ) ( not ( = ?auto_26618 ?auto_26620 ) ) ( not ( = ?auto_26618 ?auto_26649 ) ) ( not ( = ?auto_26619 ?auto_26620 ) ) ( not ( = ?auto_26619 ?auto_26649 ) ) ( not ( = ?auto_26620 ?auto_26655 ) ) ( not ( = ?auto_26620 ?auto_26644 ) ) ( not ( = ?auto_26620 ?auto_26645 ) ) ( not ( = ?auto_26620 ?auto_26639 ) ) ( not ( = ?auto_26620 ?auto_26638 ) ) ( not ( = ?auto_26652 ?auto_26654 ) ) ( not ( = ?auto_26652 ?auto_26650 ) ) ( not ( = ?auto_26652 ?auto_26640 ) ) ( not ( = ?auto_26652 ?auto_26635 ) ) ( not ( = ?auto_26652 ?auto_26636 ) ) ( not ( = ?auto_26634 ?auto_26637 ) ) ( not ( = ?auto_26634 ?auto_26656 ) ) ( not ( = ?auto_26634 ?auto_26653 ) ) ( not ( = ?auto_26634 ?auto_26651 ) ) ( not ( = ?auto_26634 ?auto_26642 ) ) ( not ( = ?auto_26649 ?auto_26655 ) ) ( not ( = ?auto_26649 ?auto_26644 ) ) ( not ( = ?auto_26649 ?auto_26645 ) ) ( not ( = ?auto_26649 ?auto_26639 ) ) ( not ( = ?auto_26649 ?auto_26638 ) ) ( not ( = ?auto_26615 ?auto_26624 ) ) ( not ( = ?auto_26615 ?auto_26641 ) ) ( not ( = ?auto_26616 ?auto_26624 ) ) ( not ( = ?auto_26616 ?auto_26641 ) ) ( not ( = ?auto_26617 ?auto_26624 ) ) ( not ( = ?auto_26617 ?auto_26641 ) ) ( not ( = ?auto_26618 ?auto_26624 ) ) ( not ( = ?auto_26618 ?auto_26641 ) ) ( not ( = ?auto_26619 ?auto_26624 ) ) ( not ( = ?auto_26619 ?auto_26641 ) ) ( not ( = ?auto_26622 ?auto_26624 ) ) ( not ( = ?auto_26622 ?auto_26641 ) ) ( not ( = ?auto_26624 ?auto_26649 ) ) ( not ( = ?auto_26624 ?auto_26655 ) ) ( not ( = ?auto_26624 ?auto_26644 ) ) ( not ( = ?auto_26624 ?auto_26645 ) ) ( not ( = ?auto_26624 ?auto_26639 ) ) ( not ( = ?auto_26624 ?auto_26638 ) ) ( not ( = ?auto_26646 ?auto_26652 ) ) ( not ( = ?auto_26646 ?auto_26654 ) ) ( not ( = ?auto_26646 ?auto_26650 ) ) ( not ( = ?auto_26646 ?auto_26640 ) ) ( not ( = ?auto_26646 ?auto_26635 ) ) ( not ( = ?auto_26646 ?auto_26636 ) ) ( not ( = ?auto_26657 ?auto_26634 ) ) ( not ( = ?auto_26657 ?auto_26637 ) ) ( not ( = ?auto_26657 ?auto_26656 ) ) ( not ( = ?auto_26657 ?auto_26653 ) ) ( not ( = ?auto_26657 ?auto_26651 ) ) ( not ( = ?auto_26657 ?auto_26642 ) ) ( not ( = ?auto_26641 ?auto_26649 ) ) ( not ( = ?auto_26641 ?auto_26655 ) ) ( not ( = ?auto_26641 ?auto_26644 ) ) ( not ( = ?auto_26641 ?auto_26645 ) ) ( not ( = ?auto_26641 ?auto_26639 ) ) ( not ( = ?auto_26641 ?auto_26638 ) ) ( not ( = ?auto_26615 ?auto_26623 ) ) ( not ( = ?auto_26615 ?auto_26648 ) ) ( not ( = ?auto_26616 ?auto_26623 ) ) ( not ( = ?auto_26616 ?auto_26648 ) ) ( not ( = ?auto_26617 ?auto_26623 ) ) ( not ( = ?auto_26617 ?auto_26648 ) ) ( not ( = ?auto_26618 ?auto_26623 ) ) ( not ( = ?auto_26618 ?auto_26648 ) ) ( not ( = ?auto_26619 ?auto_26623 ) ) ( not ( = ?auto_26619 ?auto_26648 ) ) ( not ( = ?auto_26622 ?auto_26623 ) ) ( not ( = ?auto_26622 ?auto_26648 ) ) ( not ( = ?auto_26620 ?auto_26623 ) ) ( not ( = ?auto_26620 ?auto_26648 ) ) ( not ( = ?auto_26623 ?auto_26641 ) ) ( not ( = ?auto_26623 ?auto_26649 ) ) ( not ( = ?auto_26623 ?auto_26655 ) ) ( not ( = ?auto_26623 ?auto_26644 ) ) ( not ( = ?auto_26623 ?auto_26645 ) ) ( not ( = ?auto_26623 ?auto_26639 ) ) ( not ( = ?auto_26623 ?auto_26638 ) ) ( not ( = ?auto_26648 ?auto_26641 ) ) ( not ( = ?auto_26648 ?auto_26649 ) ) ( not ( = ?auto_26648 ?auto_26655 ) ) ( not ( = ?auto_26648 ?auto_26644 ) ) ( not ( = ?auto_26648 ?auto_26645 ) ) ( not ( = ?auto_26648 ?auto_26639 ) ) ( not ( = ?auto_26648 ?auto_26638 ) ) ( not ( = ?auto_26615 ?auto_26621 ) ) ( not ( = ?auto_26615 ?auto_26647 ) ) ( not ( = ?auto_26616 ?auto_26621 ) ) ( not ( = ?auto_26616 ?auto_26647 ) ) ( not ( = ?auto_26617 ?auto_26621 ) ) ( not ( = ?auto_26617 ?auto_26647 ) ) ( not ( = ?auto_26618 ?auto_26621 ) ) ( not ( = ?auto_26618 ?auto_26647 ) ) ( not ( = ?auto_26619 ?auto_26621 ) ) ( not ( = ?auto_26619 ?auto_26647 ) ) ( not ( = ?auto_26622 ?auto_26621 ) ) ( not ( = ?auto_26622 ?auto_26647 ) ) ( not ( = ?auto_26620 ?auto_26621 ) ) ( not ( = ?auto_26620 ?auto_26647 ) ) ( not ( = ?auto_26624 ?auto_26621 ) ) ( not ( = ?auto_26624 ?auto_26647 ) ) ( not ( = ?auto_26621 ?auto_26648 ) ) ( not ( = ?auto_26621 ?auto_26641 ) ) ( not ( = ?auto_26621 ?auto_26649 ) ) ( not ( = ?auto_26621 ?auto_26655 ) ) ( not ( = ?auto_26621 ?auto_26644 ) ) ( not ( = ?auto_26621 ?auto_26645 ) ) ( not ( = ?auto_26621 ?auto_26639 ) ) ( not ( = ?auto_26621 ?auto_26638 ) ) ( not ( = ?auto_26647 ?auto_26648 ) ) ( not ( = ?auto_26647 ?auto_26641 ) ) ( not ( = ?auto_26647 ?auto_26649 ) ) ( not ( = ?auto_26647 ?auto_26655 ) ) ( not ( = ?auto_26647 ?auto_26644 ) ) ( not ( = ?auto_26647 ?auto_26645 ) ) ( not ( = ?auto_26647 ?auto_26639 ) ) ( not ( = ?auto_26647 ?auto_26638 ) ) ( not ( = ?auto_26615 ?auto_26626 ) ) ( not ( = ?auto_26615 ?auto_26658 ) ) ( not ( = ?auto_26616 ?auto_26626 ) ) ( not ( = ?auto_26616 ?auto_26658 ) ) ( not ( = ?auto_26617 ?auto_26626 ) ) ( not ( = ?auto_26617 ?auto_26658 ) ) ( not ( = ?auto_26618 ?auto_26626 ) ) ( not ( = ?auto_26618 ?auto_26658 ) ) ( not ( = ?auto_26619 ?auto_26626 ) ) ( not ( = ?auto_26619 ?auto_26658 ) ) ( not ( = ?auto_26622 ?auto_26626 ) ) ( not ( = ?auto_26622 ?auto_26658 ) ) ( not ( = ?auto_26620 ?auto_26626 ) ) ( not ( = ?auto_26620 ?auto_26658 ) ) ( not ( = ?auto_26624 ?auto_26626 ) ) ( not ( = ?auto_26624 ?auto_26658 ) ) ( not ( = ?auto_26623 ?auto_26626 ) ) ( not ( = ?auto_26623 ?auto_26658 ) ) ( not ( = ?auto_26626 ?auto_26647 ) ) ( not ( = ?auto_26626 ?auto_26648 ) ) ( not ( = ?auto_26626 ?auto_26641 ) ) ( not ( = ?auto_26626 ?auto_26649 ) ) ( not ( = ?auto_26626 ?auto_26655 ) ) ( not ( = ?auto_26626 ?auto_26644 ) ) ( not ( = ?auto_26626 ?auto_26645 ) ) ( not ( = ?auto_26626 ?auto_26639 ) ) ( not ( = ?auto_26626 ?auto_26638 ) ) ( not ( = ?auto_26643 ?auto_26650 ) ) ( not ( = ?auto_26643 ?auto_26646 ) ) ( not ( = ?auto_26643 ?auto_26652 ) ) ( not ( = ?auto_26643 ?auto_26654 ) ) ( not ( = ?auto_26643 ?auto_26640 ) ) ( not ( = ?auto_26643 ?auto_26635 ) ) ( not ( = ?auto_26643 ?auto_26636 ) ) ( not ( = ?auto_26633 ?auto_26656 ) ) ( not ( = ?auto_26633 ?auto_26657 ) ) ( not ( = ?auto_26633 ?auto_26634 ) ) ( not ( = ?auto_26633 ?auto_26637 ) ) ( not ( = ?auto_26633 ?auto_26653 ) ) ( not ( = ?auto_26633 ?auto_26651 ) ) ( not ( = ?auto_26633 ?auto_26642 ) ) ( not ( = ?auto_26658 ?auto_26647 ) ) ( not ( = ?auto_26658 ?auto_26648 ) ) ( not ( = ?auto_26658 ?auto_26641 ) ) ( not ( = ?auto_26658 ?auto_26649 ) ) ( not ( = ?auto_26658 ?auto_26655 ) ) ( not ( = ?auto_26658 ?auto_26644 ) ) ( not ( = ?auto_26658 ?auto_26645 ) ) ( not ( = ?auto_26658 ?auto_26639 ) ) ( not ( = ?auto_26658 ?auto_26638 ) ) ( not ( = ?auto_26615 ?auto_26625 ) ) ( not ( = ?auto_26615 ?auto_26627 ) ) ( not ( = ?auto_26616 ?auto_26625 ) ) ( not ( = ?auto_26616 ?auto_26627 ) ) ( not ( = ?auto_26617 ?auto_26625 ) ) ( not ( = ?auto_26617 ?auto_26627 ) ) ( not ( = ?auto_26618 ?auto_26625 ) ) ( not ( = ?auto_26618 ?auto_26627 ) ) ( not ( = ?auto_26619 ?auto_26625 ) ) ( not ( = ?auto_26619 ?auto_26627 ) ) ( not ( = ?auto_26622 ?auto_26625 ) ) ( not ( = ?auto_26622 ?auto_26627 ) ) ( not ( = ?auto_26620 ?auto_26625 ) ) ( not ( = ?auto_26620 ?auto_26627 ) ) ( not ( = ?auto_26624 ?auto_26625 ) ) ( not ( = ?auto_26624 ?auto_26627 ) ) ( not ( = ?auto_26623 ?auto_26625 ) ) ( not ( = ?auto_26623 ?auto_26627 ) ) ( not ( = ?auto_26621 ?auto_26625 ) ) ( not ( = ?auto_26621 ?auto_26627 ) ) ( not ( = ?auto_26625 ?auto_26658 ) ) ( not ( = ?auto_26625 ?auto_26647 ) ) ( not ( = ?auto_26625 ?auto_26648 ) ) ( not ( = ?auto_26625 ?auto_26641 ) ) ( not ( = ?auto_26625 ?auto_26649 ) ) ( not ( = ?auto_26625 ?auto_26655 ) ) ( not ( = ?auto_26625 ?auto_26644 ) ) ( not ( = ?auto_26625 ?auto_26645 ) ) ( not ( = ?auto_26625 ?auto_26639 ) ) ( not ( = ?auto_26625 ?auto_26638 ) ) ( not ( = ?auto_26628 ?auto_26643 ) ) ( not ( = ?auto_26628 ?auto_26650 ) ) ( not ( = ?auto_26628 ?auto_26646 ) ) ( not ( = ?auto_26628 ?auto_26652 ) ) ( not ( = ?auto_26628 ?auto_26654 ) ) ( not ( = ?auto_26628 ?auto_26640 ) ) ( not ( = ?auto_26628 ?auto_26635 ) ) ( not ( = ?auto_26628 ?auto_26636 ) ) ( not ( = ?auto_26632 ?auto_26633 ) ) ( not ( = ?auto_26632 ?auto_26656 ) ) ( not ( = ?auto_26632 ?auto_26657 ) ) ( not ( = ?auto_26632 ?auto_26634 ) ) ( not ( = ?auto_26632 ?auto_26637 ) ) ( not ( = ?auto_26632 ?auto_26653 ) ) ( not ( = ?auto_26632 ?auto_26651 ) ) ( not ( = ?auto_26632 ?auto_26642 ) ) ( not ( = ?auto_26627 ?auto_26658 ) ) ( not ( = ?auto_26627 ?auto_26647 ) ) ( not ( = ?auto_26627 ?auto_26648 ) ) ( not ( = ?auto_26627 ?auto_26641 ) ) ( not ( = ?auto_26627 ?auto_26649 ) ) ( not ( = ?auto_26627 ?auto_26655 ) ) ( not ( = ?auto_26627 ?auto_26644 ) ) ( not ( = ?auto_26627 ?auto_26645 ) ) ( not ( = ?auto_26627 ?auto_26639 ) ) ( not ( = ?auto_26627 ?auto_26638 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_26615 ?auto_26616 ?auto_26617 ?auto_26618 ?auto_26619 ?auto_26622 ?auto_26620 ?auto_26624 ?auto_26623 ?auto_26621 ?auto_26626 )
      ( MAKE-1CRATE ?auto_26626 ?auto_26625 )
      ( MAKE-11CRATE-VERIFY ?auto_26615 ?auto_26616 ?auto_26617 ?auto_26618 ?auto_26619 ?auto_26622 ?auto_26620 ?auto_26624 ?auto_26623 ?auto_26621 ?auto_26626 ?auto_26625 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26661 - SURFACE
      ?auto_26662 - SURFACE
    )
    :vars
    (
      ?auto_26663 - HOIST
      ?auto_26664 - PLACE
      ?auto_26666 - PLACE
      ?auto_26667 - HOIST
      ?auto_26668 - SURFACE
      ?auto_26665 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26663 ?auto_26664 ) ( SURFACE-AT ?auto_26661 ?auto_26664 ) ( CLEAR ?auto_26661 ) ( IS-CRATE ?auto_26662 ) ( AVAILABLE ?auto_26663 ) ( not ( = ?auto_26666 ?auto_26664 ) ) ( HOIST-AT ?auto_26667 ?auto_26666 ) ( AVAILABLE ?auto_26667 ) ( SURFACE-AT ?auto_26662 ?auto_26666 ) ( ON ?auto_26662 ?auto_26668 ) ( CLEAR ?auto_26662 ) ( TRUCK-AT ?auto_26665 ?auto_26664 ) ( not ( = ?auto_26661 ?auto_26662 ) ) ( not ( = ?auto_26661 ?auto_26668 ) ) ( not ( = ?auto_26662 ?auto_26668 ) ) ( not ( = ?auto_26663 ?auto_26667 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26665 ?auto_26664 ?auto_26666 )
      ( !LIFT ?auto_26667 ?auto_26662 ?auto_26668 ?auto_26666 )
      ( !LOAD ?auto_26667 ?auto_26662 ?auto_26665 ?auto_26666 )
      ( !DRIVE ?auto_26665 ?auto_26666 ?auto_26664 )
      ( !UNLOAD ?auto_26663 ?auto_26662 ?auto_26665 ?auto_26664 )
      ( !DROP ?auto_26663 ?auto_26662 ?auto_26661 ?auto_26664 )
      ( MAKE-1CRATE-VERIFY ?auto_26661 ?auto_26662 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_26682 - SURFACE
      ?auto_26683 - SURFACE
      ?auto_26684 - SURFACE
      ?auto_26685 - SURFACE
      ?auto_26686 - SURFACE
      ?auto_26689 - SURFACE
      ?auto_26687 - SURFACE
      ?auto_26691 - SURFACE
      ?auto_26690 - SURFACE
      ?auto_26688 - SURFACE
      ?auto_26693 - SURFACE
      ?auto_26692 - SURFACE
      ?auto_26694 - SURFACE
    )
    :vars
    (
      ?auto_26695 - HOIST
      ?auto_26699 - PLACE
      ?auto_26700 - PLACE
      ?auto_26697 - HOIST
      ?auto_26698 - SURFACE
      ?auto_26725 - PLACE
      ?auto_26704 - HOIST
      ?auto_26729 - SURFACE
      ?auto_26724 - PLACE
      ?auto_26716 - HOIST
      ?auto_26708 - SURFACE
      ?auto_26706 - PLACE
      ?auto_26714 - HOIST
      ?auto_26710 - SURFACE
      ?auto_26703 - PLACE
      ?auto_26718 - HOIST
      ?auto_26720 - SURFACE
      ?auto_26702 - SURFACE
      ?auto_26722 - PLACE
      ?auto_26712 - HOIST
      ?auto_26721 - SURFACE
      ?auto_26713 - PLACE
      ?auto_26726 - HOIST
      ?auto_26728 - SURFACE
      ?auto_26727 - SURFACE
      ?auto_26705 - PLACE
      ?auto_26723 - HOIST
      ?auto_26709 - SURFACE
      ?auto_26719 - PLACE
      ?auto_26711 - HOIST
      ?auto_26707 - SURFACE
      ?auto_26715 - PLACE
      ?auto_26717 - HOIST
      ?auto_26701 - SURFACE
      ?auto_26696 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26695 ?auto_26699 ) ( IS-CRATE ?auto_26694 ) ( not ( = ?auto_26700 ?auto_26699 ) ) ( HOIST-AT ?auto_26697 ?auto_26700 ) ( AVAILABLE ?auto_26697 ) ( SURFACE-AT ?auto_26694 ?auto_26700 ) ( ON ?auto_26694 ?auto_26698 ) ( CLEAR ?auto_26694 ) ( not ( = ?auto_26692 ?auto_26694 ) ) ( not ( = ?auto_26692 ?auto_26698 ) ) ( not ( = ?auto_26694 ?auto_26698 ) ) ( not ( = ?auto_26695 ?auto_26697 ) ) ( IS-CRATE ?auto_26692 ) ( not ( = ?auto_26725 ?auto_26699 ) ) ( HOIST-AT ?auto_26704 ?auto_26725 ) ( AVAILABLE ?auto_26704 ) ( SURFACE-AT ?auto_26692 ?auto_26725 ) ( ON ?auto_26692 ?auto_26729 ) ( CLEAR ?auto_26692 ) ( not ( = ?auto_26693 ?auto_26692 ) ) ( not ( = ?auto_26693 ?auto_26729 ) ) ( not ( = ?auto_26692 ?auto_26729 ) ) ( not ( = ?auto_26695 ?auto_26704 ) ) ( IS-CRATE ?auto_26693 ) ( not ( = ?auto_26724 ?auto_26699 ) ) ( HOIST-AT ?auto_26716 ?auto_26724 ) ( AVAILABLE ?auto_26716 ) ( SURFACE-AT ?auto_26693 ?auto_26724 ) ( ON ?auto_26693 ?auto_26708 ) ( CLEAR ?auto_26693 ) ( not ( = ?auto_26688 ?auto_26693 ) ) ( not ( = ?auto_26688 ?auto_26708 ) ) ( not ( = ?auto_26693 ?auto_26708 ) ) ( not ( = ?auto_26695 ?auto_26716 ) ) ( IS-CRATE ?auto_26688 ) ( not ( = ?auto_26706 ?auto_26699 ) ) ( HOIST-AT ?auto_26714 ?auto_26706 ) ( SURFACE-AT ?auto_26688 ?auto_26706 ) ( ON ?auto_26688 ?auto_26710 ) ( CLEAR ?auto_26688 ) ( not ( = ?auto_26690 ?auto_26688 ) ) ( not ( = ?auto_26690 ?auto_26710 ) ) ( not ( = ?auto_26688 ?auto_26710 ) ) ( not ( = ?auto_26695 ?auto_26714 ) ) ( IS-CRATE ?auto_26690 ) ( not ( = ?auto_26703 ?auto_26699 ) ) ( HOIST-AT ?auto_26718 ?auto_26703 ) ( SURFACE-AT ?auto_26690 ?auto_26703 ) ( ON ?auto_26690 ?auto_26720 ) ( CLEAR ?auto_26690 ) ( not ( = ?auto_26691 ?auto_26690 ) ) ( not ( = ?auto_26691 ?auto_26720 ) ) ( not ( = ?auto_26690 ?auto_26720 ) ) ( not ( = ?auto_26695 ?auto_26718 ) ) ( IS-CRATE ?auto_26691 ) ( AVAILABLE ?auto_26718 ) ( SURFACE-AT ?auto_26691 ?auto_26703 ) ( ON ?auto_26691 ?auto_26702 ) ( CLEAR ?auto_26691 ) ( not ( = ?auto_26687 ?auto_26691 ) ) ( not ( = ?auto_26687 ?auto_26702 ) ) ( not ( = ?auto_26691 ?auto_26702 ) ) ( IS-CRATE ?auto_26687 ) ( not ( = ?auto_26722 ?auto_26699 ) ) ( HOIST-AT ?auto_26712 ?auto_26722 ) ( AVAILABLE ?auto_26712 ) ( SURFACE-AT ?auto_26687 ?auto_26722 ) ( ON ?auto_26687 ?auto_26721 ) ( CLEAR ?auto_26687 ) ( not ( = ?auto_26689 ?auto_26687 ) ) ( not ( = ?auto_26689 ?auto_26721 ) ) ( not ( = ?auto_26687 ?auto_26721 ) ) ( not ( = ?auto_26695 ?auto_26712 ) ) ( IS-CRATE ?auto_26689 ) ( not ( = ?auto_26713 ?auto_26699 ) ) ( HOIST-AT ?auto_26726 ?auto_26713 ) ( AVAILABLE ?auto_26726 ) ( SURFACE-AT ?auto_26689 ?auto_26713 ) ( ON ?auto_26689 ?auto_26728 ) ( CLEAR ?auto_26689 ) ( not ( = ?auto_26686 ?auto_26689 ) ) ( not ( = ?auto_26686 ?auto_26728 ) ) ( not ( = ?auto_26689 ?auto_26728 ) ) ( not ( = ?auto_26695 ?auto_26726 ) ) ( IS-CRATE ?auto_26686 ) ( AVAILABLE ?auto_26714 ) ( SURFACE-AT ?auto_26686 ?auto_26706 ) ( ON ?auto_26686 ?auto_26727 ) ( CLEAR ?auto_26686 ) ( not ( = ?auto_26685 ?auto_26686 ) ) ( not ( = ?auto_26685 ?auto_26727 ) ) ( not ( = ?auto_26686 ?auto_26727 ) ) ( IS-CRATE ?auto_26685 ) ( not ( = ?auto_26705 ?auto_26699 ) ) ( HOIST-AT ?auto_26723 ?auto_26705 ) ( AVAILABLE ?auto_26723 ) ( SURFACE-AT ?auto_26685 ?auto_26705 ) ( ON ?auto_26685 ?auto_26709 ) ( CLEAR ?auto_26685 ) ( not ( = ?auto_26684 ?auto_26685 ) ) ( not ( = ?auto_26684 ?auto_26709 ) ) ( not ( = ?auto_26685 ?auto_26709 ) ) ( not ( = ?auto_26695 ?auto_26723 ) ) ( IS-CRATE ?auto_26684 ) ( not ( = ?auto_26719 ?auto_26699 ) ) ( HOIST-AT ?auto_26711 ?auto_26719 ) ( AVAILABLE ?auto_26711 ) ( SURFACE-AT ?auto_26684 ?auto_26719 ) ( ON ?auto_26684 ?auto_26707 ) ( CLEAR ?auto_26684 ) ( not ( = ?auto_26683 ?auto_26684 ) ) ( not ( = ?auto_26683 ?auto_26707 ) ) ( not ( = ?auto_26684 ?auto_26707 ) ) ( not ( = ?auto_26695 ?auto_26711 ) ) ( SURFACE-AT ?auto_26682 ?auto_26699 ) ( CLEAR ?auto_26682 ) ( IS-CRATE ?auto_26683 ) ( AVAILABLE ?auto_26695 ) ( not ( = ?auto_26715 ?auto_26699 ) ) ( HOIST-AT ?auto_26717 ?auto_26715 ) ( AVAILABLE ?auto_26717 ) ( SURFACE-AT ?auto_26683 ?auto_26715 ) ( ON ?auto_26683 ?auto_26701 ) ( CLEAR ?auto_26683 ) ( TRUCK-AT ?auto_26696 ?auto_26699 ) ( not ( = ?auto_26682 ?auto_26683 ) ) ( not ( = ?auto_26682 ?auto_26701 ) ) ( not ( = ?auto_26683 ?auto_26701 ) ) ( not ( = ?auto_26695 ?auto_26717 ) ) ( not ( = ?auto_26682 ?auto_26684 ) ) ( not ( = ?auto_26682 ?auto_26707 ) ) ( not ( = ?auto_26684 ?auto_26701 ) ) ( not ( = ?auto_26719 ?auto_26715 ) ) ( not ( = ?auto_26711 ?auto_26717 ) ) ( not ( = ?auto_26707 ?auto_26701 ) ) ( not ( = ?auto_26682 ?auto_26685 ) ) ( not ( = ?auto_26682 ?auto_26709 ) ) ( not ( = ?auto_26683 ?auto_26685 ) ) ( not ( = ?auto_26683 ?auto_26709 ) ) ( not ( = ?auto_26685 ?auto_26707 ) ) ( not ( = ?auto_26685 ?auto_26701 ) ) ( not ( = ?auto_26705 ?auto_26719 ) ) ( not ( = ?auto_26705 ?auto_26715 ) ) ( not ( = ?auto_26723 ?auto_26711 ) ) ( not ( = ?auto_26723 ?auto_26717 ) ) ( not ( = ?auto_26709 ?auto_26707 ) ) ( not ( = ?auto_26709 ?auto_26701 ) ) ( not ( = ?auto_26682 ?auto_26686 ) ) ( not ( = ?auto_26682 ?auto_26727 ) ) ( not ( = ?auto_26683 ?auto_26686 ) ) ( not ( = ?auto_26683 ?auto_26727 ) ) ( not ( = ?auto_26684 ?auto_26686 ) ) ( not ( = ?auto_26684 ?auto_26727 ) ) ( not ( = ?auto_26686 ?auto_26709 ) ) ( not ( = ?auto_26686 ?auto_26707 ) ) ( not ( = ?auto_26686 ?auto_26701 ) ) ( not ( = ?auto_26706 ?auto_26705 ) ) ( not ( = ?auto_26706 ?auto_26719 ) ) ( not ( = ?auto_26706 ?auto_26715 ) ) ( not ( = ?auto_26714 ?auto_26723 ) ) ( not ( = ?auto_26714 ?auto_26711 ) ) ( not ( = ?auto_26714 ?auto_26717 ) ) ( not ( = ?auto_26727 ?auto_26709 ) ) ( not ( = ?auto_26727 ?auto_26707 ) ) ( not ( = ?auto_26727 ?auto_26701 ) ) ( not ( = ?auto_26682 ?auto_26689 ) ) ( not ( = ?auto_26682 ?auto_26728 ) ) ( not ( = ?auto_26683 ?auto_26689 ) ) ( not ( = ?auto_26683 ?auto_26728 ) ) ( not ( = ?auto_26684 ?auto_26689 ) ) ( not ( = ?auto_26684 ?auto_26728 ) ) ( not ( = ?auto_26685 ?auto_26689 ) ) ( not ( = ?auto_26685 ?auto_26728 ) ) ( not ( = ?auto_26689 ?auto_26727 ) ) ( not ( = ?auto_26689 ?auto_26709 ) ) ( not ( = ?auto_26689 ?auto_26707 ) ) ( not ( = ?auto_26689 ?auto_26701 ) ) ( not ( = ?auto_26713 ?auto_26706 ) ) ( not ( = ?auto_26713 ?auto_26705 ) ) ( not ( = ?auto_26713 ?auto_26719 ) ) ( not ( = ?auto_26713 ?auto_26715 ) ) ( not ( = ?auto_26726 ?auto_26714 ) ) ( not ( = ?auto_26726 ?auto_26723 ) ) ( not ( = ?auto_26726 ?auto_26711 ) ) ( not ( = ?auto_26726 ?auto_26717 ) ) ( not ( = ?auto_26728 ?auto_26727 ) ) ( not ( = ?auto_26728 ?auto_26709 ) ) ( not ( = ?auto_26728 ?auto_26707 ) ) ( not ( = ?auto_26728 ?auto_26701 ) ) ( not ( = ?auto_26682 ?auto_26687 ) ) ( not ( = ?auto_26682 ?auto_26721 ) ) ( not ( = ?auto_26683 ?auto_26687 ) ) ( not ( = ?auto_26683 ?auto_26721 ) ) ( not ( = ?auto_26684 ?auto_26687 ) ) ( not ( = ?auto_26684 ?auto_26721 ) ) ( not ( = ?auto_26685 ?auto_26687 ) ) ( not ( = ?auto_26685 ?auto_26721 ) ) ( not ( = ?auto_26686 ?auto_26687 ) ) ( not ( = ?auto_26686 ?auto_26721 ) ) ( not ( = ?auto_26687 ?auto_26728 ) ) ( not ( = ?auto_26687 ?auto_26727 ) ) ( not ( = ?auto_26687 ?auto_26709 ) ) ( not ( = ?auto_26687 ?auto_26707 ) ) ( not ( = ?auto_26687 ?auto_26701 ) ) ( not ( = ?auto_26722 ?auto_26713 ) ) ( not ( = ?auto_26722 ?auto_26706 ) ) ( not ( = ?auto_26722 ?auto_26705 ) ) ( not ( = ?auto_26722 ?auto_26719 ) ) ( not ( = ?auto_26722 ?auto_26715 ) ) ( not ( = ?auto_26712 ?auto_26726 ) ) ( not ( = ?auto_26712 ?auto_26714 ) ) ( not ( = ?auto_26712 ?auto_26723 ) ) ( not ( = ?auto_26712 ?auto_26711 ) ) ( not ( = ?auto_26712 ?auto_26717 ) ) ( not ( = ?auto_26721 ?auto_26728 ) ) ( not ( = ?auto_26721 ?auto_26727 ) ) ( not ( = ?auto_26721 ?auto_26709 ) ) ( not ( = ?auto_26721 ?auto_26707 ) ) ( not ( = ?auto_26721 ?auto_26701 ) ) ( not ( = ?auto_26682 ?auto_26691 ) ) ( not ( = ?auto_26682 ?auto_26702 ) ) ( not ( = ?auto_26683 ?auto_26691 ) ) ( not ( = ?auto_26683 ?auto_26702 ) ) ( not ( = ?auto_26684 ?auto_26691 ) ) ( not ( = ?auto_26684 ?auto_26702 ) ) ( not ( = ?auto_26685 ?auto_26691 ) ) ( not ( = ?auto_26685 ?auto_26702 ) ) ( not ( = ?auto_26686 ?auto_26691 ) ) ( not ( = ?auto_26686 ?auto_26702 ) ) ( not ( = ?auto_26689 ?auto_26691 ) ) ( not ( = ?auto_26689 ?auto_26702 ) ) ( not ( = ?auto_26691 ?auto_26721 ) ) ( not ( = ?auto_26691 ?auto_26728 ) ) ( not ( = ?auto_26691 ?auto_26727 ) ) ( not ( = ?auto_26691 ?auto_26709 ) ) ( not ( = ?auto_26691 ?auto_26707 ) ) ( not ( = ?auto_26691 ?auto_26701 ) ) ( not ( = ?auto_26703 ?auto_26722 ) ) ( not ( = ?auto_26703 ?auto_26713 ) ) ( not ( = ?auto_26703 ?auto_26706 ) ) ( not ( = ?auto_26703 ?auto_26705 ) ) ( not ( = ?auto_26703 ?auto_26719 ) ) ( not ( = ?auto_26703 ?auto_26715 ) ) ( not ( = ?auto_26718 ?auto_26712 ) ) ( not ( = ?auto_26718 ?auto_26726 ) ) ( not ( = ?auto_26718 ?auto_26714 ) ) ( not ( = ?auto_26718 ?auto_26723 ) ) ( not ( = ?auto_26718 ?auto_26711 ) ) ( not ( = ?auto_26718 ?auto_26717 ) ) ( not ( = ?auto_26702 ?auto_26721 ) ) ( not ( = ?auto_26702 ?auto_26728 ) ) ( not ( = ?auto_26702 ?auto_26727 ) ) ( not ( = ?auto_26702 ?auto_26709 ) ) ( not ( = ?auto_26702 ?auto_26707 ) ) ( not ( = ?auto_26702 ?auto_26701 ) ) ( not ( = ?auto_26682 ?auto_26690 ) ) ( not ( = ?auto_26682 ?auto_26720 ) ) ( not ( = ?auto_26683 ?auto_26690 ) ) ( not ( = ?auto_26683 ?auto_26720 ) ) ( not ( = ?auto_26684 ?auto_26690 ) ) ( not ( = ?auto_26684 ?auto_26720 ) ) ( not ( = ?auto_26685 ?auto_26690 ) ) ( not ( = ?auto_26685 ?auto_26720 ) ) ( not ( = ?auto_26686 ?auto_26690 ) ) ( not ( = ?auto_26686 ?auto_26720 ) ) ( not ( = ?auto_26689 ?auto_26690 ) ) ( not ( = ?auto_26689 ?auto_26720 ) ) ( not ( = ?auto_26687 ?auto_26690 ) ) ( not ( = ?auto_26687 ?auto_26720 ) ) ( not ( = ?auto_26690 ?auto_26702 ) ) ( not ( = ?auto_26690 ?auto_26721 ) ) ( not ( = ?auto_26690 ?auto_26728 ) ) ( not ( = ?auto_26690 ?auto_26727 ) ) ( not ( = ?auto_26690 ?auto_26709 ) ) ( not ( = ?auto_26690 ?auto_26707 ) ) ( not ( = ?auto_26690 ?auto_26701 ) ) ( not ( = ?auto_26720 ?auto_26702 ) ) ( not ( = ?auto_26720 ?auto_26721 ) ) ( not ( = ?auto_26720 ?auto_26728 ) ) ( not ( = ?auto_26720 ?auto_26727 ) ) ( not ( = ?auto_26720 ?auto_26709 ) ) ( not ( = ?auto_26720 ?auto_26707 ) ) ( not ( = ?auto_26720 ?auto_26701 ) ) ( not ( = ?auto_26682 ?auto_26688 ) ) ( not ( = ?auto_26682 ?auto_26710 ) ) ( not ( = ?auto_26683 ?auto_26688 ) ) ( not ( = ?auto_26683 ?auto_26710 ) ) ( not ( = ?auto_26684 ?auto_26688 ) ) ( not ( = ?auto_26684 ?auto_26710 ) ) ( not ( = ?auto_26685 ?auto_26688 ) ) ( not ( = ?auto_26685 ?auto_26710 ) ) ( not ( = ?auto_26686 ?auto_26688 ) ) ( not ( = ?auto_26686 ?auto_26710 ) ) ( not ( = ?auto_26689 ?auto_26688 ) ) ( not ( = ?auto_26689 ?auto_26710 ) ) ( not ( = ?auto_26687 ?auto_26688 ) ) ( not ( = ?auto_26687 ?auto_26710 ) ) ( not ( = ?auto_26691 ?auto_26688 ) ) ( not ( = ?auto_26691 ?auto_26710 ) ) ( not ( = ?auto_26688 ?auto_26720 ) ) ( not ( = ?auto_26688 ?auto_26702 ) ) ( not ( = ?auto_26688 ?auto_26721 ) ) ( not ( = ?auto_26688 ?auto_26728 ) ) ( not ( = ?auto_26688 ?auto_26727 ) ) ( not ( = ?auto_26688 ?auto_26709 ) ) ( not ( = ?auto_26688 ?auto_26707 ) ) ( not ( = ?auto_26688 ?auto_26701 ) ) ( not ( = ?auto_26710 ?auto_26720 ) ) ( not ( = ?auto_26710 ?auto_26702 ) ) ( not ( = ?auto_26710 ?auto_26721 ) ) ( not ( = ?auto_26710 ?auto_26728 ) ) ( not ( = ?auto_26710 ?auto_26727 ) ) ( not ( = ?auto_26710 ?auto_26709 ) ) ( not ( = ?auto_26710 ?auto_26707 ) ) ( not ( = ?auto_26710 ?auto_26701 ) ) ( not ( = ?auto_26682 ?auto_26693 ) ) ( not ( = ?auto_26682 ?auto_26708 ) ) ( not ( = ?auto_26683 ?auto_26693 ) ) ( not ( = ?auto_26683 ?auto_26708 ) ) ( not ( = ?auto_26684 ?auto_26693 ) ) ( not ( = ?auto_26684 ?auto_26708 ) ) ( not ( = ?auto_26685 ?auto_26693 ) ) ( not ( = ?auto_26685 ?auto_26708 ) ) ( not ( = ?auto_26686 ?auto_26693 ) ) ( not ( = ?auto_26686 ?auto_26708 ) ) ( not ( = ?auto_26689 ?auto_26693 ) ) ( not ( = ?auto_26689 ?auto_26708 ) ) ( not ( = ?auto_26687 ?auto_26693 ) ) ( not ( = ?auto_26687 ?auto_26708 ) ) ( not ( = ?auto_26691 ?auto_26693 ) ) ( not ( = ?auto_26691 ?auto_26708 ) ) ( not ( = ?auto_26690 ?auto_26693 ) ) ( not ( = ?auto_26690 ?auto_26708 ) ) ( not ( = ?auto_26693 ?auto_26710 ) ) ( not ( = ?auto_26693 ?auto_26720 ) ) ( not ( = ?auto_26693 ?auto_26702 ) ) ( not ( = ?auto_26693 ?auto_26721 ) ) ( not ( = ?auto_26693 ?auto_26728 ) ) ( not ( = ?auto_26693 ?auto_26727 ) ) ( not ( = ?auto_26693 ?auto_26709 ) ) ( not ( = ?auto_26693 ?auto_26707 ) ) ( not ( = ?auto_26693 ?auto_26701 ) ) ( not ( = ?auto_26724 ?auto_26706 ) ) ( not ( = ?auto_26724 ?auto_26703 ) ) ( not ( = ?auto_26724 ?auto_26722 ) ) ( not ( = ?auto_26724 ?auto_26713 ) ) ( not ( = ?auto_26724 ?auto_26705 ) ) ( not ( = ?auto_26724 ?auto_26719 ) ) ( not ( = ?auto_26724 ?auto_26715 ) ) ( not ( = ?auto_26716 ?auto_26714 ) ) ( not ( = ?auto_26716 ?auto_26718 ) ) ( not ( = ?auto_26716 ?auto_26712 ) ) ( not ( = ?auto_26716 ?auto_26726 ) ) ( not ( = ?auto_26716 ?auto_26723 ) ) ( not ( = ?auto_26716 ?auto_26711 ) ) ( not ( = ?auto_26716 ?auto_26717 ) ) ( not ( = ?auto_26708 ?auto_26710 ) ) ( not ( = ?auto_26708 ?auto_26720 ) ) ( not ( = ?auto_26708 ?auto_26702 ) ) ( not ( = ?auto_26708 ?auto_26721 ) ) ( not ( = ?auto_26708 ?auto_26728 ) ) ( not ( = ?auto_26708 ?auto_26727 ) ) ( not ( = ?auto_26708 ?auto_26709 ) ) ( not ( = ?auto_26708 ?auto_26707 ) ) ( not ( = ?auto_26708 ?auto_26701 ) ) ( not ( = ?auto_26682 ?auto_26692 ) ) ( not ( = ?auto_26682 ?auto_26729 ) ) ( not ( = ?auto_26683 ?auto_26692 ) ) ( not ( = ?auto_26683 ?auto_26729 ) ) ( not ( = ?auto_26684 ?auto_26692 ) ) ( not ( = ?auto_26684 ?auto_26729 ) ) ( not ( = ?auto_26685 ?auto_26692 ) ) ( not ( = ?auto_26685 ?auto_26729 ) ) ( not ( = ?auto_26686 ?auto_26692 ) ) ( not ( = ?auto_26686 ?auto_26729 ) ) ( not ( = ?auto_26689 ?auto_26692 ) ) ( not ( = ?auto_26689 ?auto_26729 ) ) ( not ( = ?auto_26687 ?auto_26692 ) ) ( not ( = ?auto_26687 ?auto_26729 ) ) ( not ( = ?auto_26691 ?auto_26692 ) ) ( not ( = ?auto_26691 ?auto_26729 ) ) ( not ( = ?auto_26690 ?auto_26692 ) ) ( not ( = ?auto_26690 ?auto_26729 ) ) ( not ( = ?auto_26688 ?auto_26692 ) ) ( not ( = ?auto_26688 ?auto_26729 ) ) ( not ( = ?auto_26692 ?auto_26708 ) ) ( not ( = ?auto_26692 ?auto_26710 ) ) ( not ( = ?auto_26692 ?auto_26720 ) ) ( not ( = ?auto_26692 ?auto_26702 ) ) ( not ( = ?auto_26692 ?auto_26721 ) ) ( not ( = ?auto_26692 ?auto_26728 ) ) ( not ( = ?auto_26692 ?auto_26727 ) ) ( not ( = ?auto_26692 ?auto_26709 ) ) ( not ( = ?auto_26692 ?auto_26707 ) ) ( not ( = ?auto_26692 ?auto_26701 ) ) ( not ( = ?auto_26725 ?auto_26724 ) ) ( not ( = ?auto_26725 ?auto_26706 ) ) ( not ( = ?auto_26725 ?auto_26703 ) ) ( not ( = ?auto_26725 ?auto_26722 ) ) ( not ( = ?auto_26725 ?auto_26713 ) ) ( not ( = ?auto_26725 ?auto_26705 ) ) ( not ( = ?auto_26725 ?auto_26719 ) ) ( not ( = ?auto_26725 ?auto_26715 ) ) ( not ( = ?auto_26704 ?auto_26716 ) ) ( not ( = ?auto_26704 ?auto_26714 ) ) ( not ( = ?auto_26704 ?auto_26718 ) ) ( not ( = ?auto_26704 ?auto_26712 ) ) ( not ( = ?auto_26704 ?auto_26726 ) ) ( not ( = ?auto_26704 ?auto_26723 ) ) ( not ( = ?auto_26704 ?auto_26711 ) ) ( not ( = ?auto_26704 ?auto_26717 ) ) ( not ( = ?auto_26729 ?auto_26708 ) ) ( not ( = ?auto_26729 ?auto_26710 ) ) ( not ( = ?auto_26729 ?auto_26720 ) ) ( not ( = ?auto_26729 ?auto_26702 ) ) ( not ( = ?auto_26729 ?auto_26721 ) ) ( not ( = ?auto_26729 ?auto_26728 ) ) ( not ( = ?auto_26729 ?auto_26727 ) ) ( not ( = ?auto_26729 ?auto_26709 ) ) ( not ( = ?auto_26729 ?auto_26707 ) ) ( not ( = ?auto_26729 ?auto_26701 ) ) ( not ( = ?auto_26682 ?auto_26694 ) ) ( not ( = ?auto_26682 ?auto_26698 ) ) ( not ( = ?auto_26683 ?auto_26694 ) ) ( not ( = ?auto_26683 ?auto_26698 ) ) ( not ( = ?auto_26684 ?auto_26694 ) ) ( not ( = ?auto_26684 ?auto_26698 ) ) ( not ( = ?auto_26685 ?auto_26694 ) ) ( not ( = ?auto_26685 ?auto_26698 ) ) ( not ( = ?auto_26686 ?auto_26694 ) ) ( not ( = ?auto_26686 ?auto_26698 ) ) ( not ( = ?auto_26689 ?auto_26694 ) ) ( not ( = ?auto_26689 ?auto_26698 ) ) ( not ( = ?auto_26687 ?auto_26694 ) ) ( not ( = ?auto_26687 ?auto_26698 ) ) ( not ( = ?auto_26691 ?auto_26694 ) ) ( not ( = ?auto_26691 ?auto_26698 ) ) ( not ( = ?auto_26690 ?auto_26694 ) ) ( not ( = ?auto_26690 ?auto_26698 ) ) ( not ( = ?auto_26688 ?auto_26694 ) ) ( not ( = ?auto_26688 ?auto_26698 ) ) ( not ( = ?auto_26693 ?auto_26694 ) ) ( not ( = ?auto_26693 ?auto_26698 ) ) ( not ( = ?auto_26694 ?auto_26729 ) ) ( not ( = ?auto_26694 ?auto_26708 ) ) ( not ( = ?auto_26694 ?auto_26710 ) ) ( not ( = ?auto_26694 ?auto_26720 ) ) ( not ( = ?auto_26694 ?auto_26702 ) ) ( not ( = ?auto_26694 ?auto_26721 ) ) ( not ( = ?auto_26694 ?auto_26728 ) ) ( not ( = ?auto_26694 ?auto_26727 ) ) ( not ( = ?auto_26694 ?auto_26709 ) ) ( not ( = ?auto_26694 ?auto_26707 ) ) ( not ( = ?auto_26694 ?auto_26701 ) ) ( not ( = ?auto_26700 ?auto_26725 ) ) ( not ( = ?auto_26700 ?auto_26724 ) ) ( not ( = ?auto_26700 ?auto_26706 ) ) ( not ( = ?auto_26700 ?auto_26703 ) ) ( not ( = ?auto_26700 ?auto_26722 ) ) ( not ( = ?auto_26700 ?auto_26713 ) ) ( not ( = ?auto_26700 ?auto_26705 ) ) ( not ( = ?auto_26700 ?auto_26719 ) ) ( not ( = ?auto_26700 ?auto_26715 ) ) ( not ( = ?auto_26697 ?auto_26704 ) ) ( not ( = ?auto_26697 ?auto_26716 ) ) ( not ( = ?auto_26697 ?auto_26714 ) ) ( not ( = ?auto_26697 ?auto_26718 ) ) ( not ( = ?auto_26697 ?auto_26712 ) ) ( not ( = ?auto_26697 ?auto_26726 ) ) ( not ( = ?auto_26697 ?auto_26723 ) ) ( not ( = ?auto_26697 ?auto_26711 ) ) ( not ( = ?auto_26697 ?auto_26717 ) ) ( not ( = ?auto_26698 ?auto_26729 ) ) ( not ( = ?auto_26698 ?auto_26708 ) ) ( not ( = ?auto_26698 ?auto_26710 ) ) ( not ( = ?auto_26698 ?auto_26720 ) ) ( not ( = ?auto_26698 ?auto_26702 ) ) ( not ( = ?auto_26698 ?auto_26721 ) ) ( not ( = ?auto_26698 ?auto_26728 ) ) ( not ( = ?auto_26698 ?auto_26727 ) ) ( not ( = ?auto_26698 ?auto_26709 ) ) ( not ( = ?auto_26698 ?auto_26707 ) ) ( not ( = ?auto_26698 ?auto_26701 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_26682 ?auto_26683 ?auto_26684 ?auto_26685 ?auto_26686 ?auto_26689 ?auto_26687 ?auto_26691 ?auto_26690 ?auto_26688 ?auto_26693 ?auto_26692 )
      ( MAKE-1CRATE ?auto_26692 ?auto_26694 )
      ( MAKE-12CRATE-VERIFY ?auto_26682 ?auto_26683 ?auto_26684 ?auto_26685 ?auto_26686 ?auto_26689 ?auto_26687 ?auto_26691 ?auto_26690 ?auto_26688 ?auto_26693 ?auto_26692 ?auto_26694 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26732 - SURFACE
      ?auto_26733 - SURFACE
    )
    :vars
    (
      ?auto_26734 - HOIST
      ?auto_26735 - PLACE
      ?auto_26737 - PLACE
      ?auto_26738 - HOIST
      ?auto_26739 - SURFACE
      ?auto_26736 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26734 ?auto_26735 ) ( SURFACE-AT ?auto_26732 ?auto_26735 ) ( CLEAR ?auto_26732 ) ( IS-CRATE ?auto_26733 ) ( AVAILABLE ?auto_26734 ) ( not ( = ?auto_26737 ?auto_26735 ) ) ( HOIST-AT ?auto_26738 ?auto_26737 ) ( AVAILABLE ?auto_26738 ) ( SURFACE-AT ?auto_26733 ?auto_26737 ) ( ON ?auto_26733 ?auto_26739 ) ( CLEAR ?auto_26733 ) ( TRUCK-AT ?auto_26736 ?auto_26735 ) ( not ( = ?auto_26732 ?auto_26733 ) ) ( not ( = ?auto_26732 ?auto_26739 ) ) ( not ( = ?auto_26733 ?auto_26739 ) ) ( not ( = ?auto_26734 ?auto_26738 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26736 ?auto_26735 ?auto_26737 )
      ( !LIFT ?auto_26738 ?auto_26733 ?auto_26739 ?auto_26737 )
      ( !LOAD ?auto_26738 ?auto_26733 ?auto_26736 ?auto_26737 )
      ( !DRIVE ?auto_26736 ?auto_26737 ?auto_26735 )
      ( !UNLOAD ?auto_26734 ?auto_26733 ?auto_26736 ?auto_26735 )
      ( !DROP ?auto_26734 ?auto_26733 ?auto_26732 ?auto_26735 )
      ( MAKE-1CRATE-VERIFY ?auto_26732 ?auto_26733 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_26754 - SURFACE
      ?auto_26755 - SURFACE
      ?auto_26756 - SURFACE
      ?auto_26757 - SURFACE
      ?auto_26758 - SURFACE
      ?auto_26761 - SURFACE
      ?auto_26759 - SURFACE
      ?auto_26763 - SURFACE
      ?auto_26762 - SURFACE
      ?auto_26760 - SURFACE
      ?auto_26765 - SURFACE
      ?auto_26764 - SURFACE
      ?auto_26766 - SURFACE
      ?auto_26767 - SURFACE
    )
    :vars
    (
      ?auto_26770 - HOIST
      ?auto_26769 - PLACE
      ?auto_26771 - PLACE
      ?auto_26773 - HOIST
      ?auto_26772 - SURFACE
      ?auto_26801 - PLACE
      ?auto_26804 - HOIST
      ?auto_26781 - SURFACE
      ?auto_26785 - PLACE
      ?auto_26787 - HOIST
      ?auto_26797 - SURFACE
      ?auto_26775 - PLACE
      ?auto_26799 - HOIST
      ?auto_26793 - SURFACE
      ?auto_26788 - PLACE
      ?auto_26776 - HOIST
      ?auto_26790 - SURFACE
      ?auto_26789 - PLACE
      ?auto_26792 - HOIST
      ?auto_26783 - SURFACE
      ?auto_26778 - SURFACE
      ?auto_26791 - PLACE
      ?auto_26798 - HOIST
      ?auto_26800 - SURFACE
      ?auto_26794 - PLACE
      ?auto_26796 - HOIST
      ?auto_26779 - SURFACE
      ?auto_26795 - SURFACE
      ?auto_26774 - PLACE
      ?auto_26782 - HOIST
      ?auto_26777 - SURFACE
      ?auto_26784 - PLACE
      ?auto_26802 - HOIST
      ?auto_26780 - SURFACE
      ?auto_26803 - PLACE
      ?auto_26786 - HOIST
      ?auto_26805 - SURFACE
      ?auto_26768 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26770 ?auto_26769 ) ( IS-CRATE ?auto_26767 ) ( not ( = ?auto_26771 ?auto_26769 ) ) ( HOIST-AT ?auto_26773 ?auto_26771 ) ( AVAILABLE ?auto_26773 ) ( SURFACE-AT ?auto_26767 ?auto_26771 ) ( ON ?auto_26767 ?auto_26772 ) ( CLEAR ?auto_26767 ) ( not ( = ?auto_26766 ?auto_26767 ) ) ( not ( = ?auto_26766 ?auto_26772 ) ) ( not ( = ?auto_26767 ?auto_26772 ) ) ( not ( = ?auto_26770 ?auto_26773 ) ) ( IS-CRATE ?auto_26766 ) ( not ( = ?auto_26801 ?auto_26769 ) ) ( HOIST-AT ?auto_26804 ?auto_26801 ) ( AVAILABLE ?auto_26804 ) ( SURFACE-AT ?auto_26766 ?auto_26801 ) ( ON ?auto_26766 ?auto_26781 ) ( CLEAR ?auto_26766 ) ( not ( = ?auto_26764 ?auto_26766 ) ) ( not ( = ?auto_26764 ?auto_26781 ) ) ( not ( = ?auto_26766 ?auto_26781 ) ) ( not ( = ?auto_26770 ?auto_26804 ) ) ( IS-CRATE ?auto_26764 ) ( not ( = ?auto_26785 ?auto_26769 ) ) ( HOIST-AT ?auto_26787 ?auto_26785 ) ( AVAILABLE ?auto_26787 ) ( SURFACE-AT ?auto_26764 ?auto_26785 ) ( ON ?auto_26764 ?auto_26797 ) ( CLEAR ?auto_26764 ) ( not ( = ?auto_26765 ?auto_26764 ) ) ( not ( = ?auto_26765 ?auto_26797 ) ) ( not ( = ?auto_26764 ?auto_26797 ) ) ( not ( = ?auto_26770 ?auto_26787 ) ) ( IS-CRATE ?auto_26765 ) ( not ( = ?auto_26775 ?auto_26769 ) ) ( HOIST-AT ?auto_26799 ?auto_26775 ) ( AVAILABLE ?auto_26799 ) ( SURFACE-AT ?auto_26765 ?auto_26775 ) ( ON ?auto_26765 ?auto_26793 ) ( CLEAR ?auto_26765 ) ( not ( = ?auto_26760 ?auto_26765 ) ) ( not ( = ?auto_26760 ?auto_26793 ) ) ( not ( = ?auto_26765 ?auto_26793 ) ) ( not ( = ?auto_26770 ?auto_26799 ) ) ( IS-CRATE ?auto_26760 ) ( not ( = ?auto_26788 ?auto_26769 ) ) ( HOIST-AT ?auto_26776 ?auto_26788 ) ( SURFACE-AT ?auto_26760 ?auto_26788 ) ( ON ?auto_26760 ?auto_26790 ) ( CLEAR ?auto_26760 ) ( not ( = ?auto_26762 ?auto_26760 ) ) ( not ( = ?auto_26762 ?auto_26790 ) ) ( not ( = ?auto_26760 ?auto_26790 ) ) ( not ( = ?auto_26770 ?auto_26776 ) ) ( IS-CRATE ?auto_26762 ) ( not ( = ?auto_26789 ?auto_26769 ) ) ( HOIST-AT ?auto_26792 ?auto_26789 ) ( SURFACE-AT ?auto_26762 ?auto_26789 ) ( ON ?auto_26762 ?auto_26783 ) ( CLEAR ?auto_26762 ) ( not ( = ?auto_26763 ?auto_26762 ) ) ( not ( = ?auto_26763 ?auto_26783 ) ) ( not ( = ?auto_26762 ?auto_26783 ) ) ( not ( = ?auto_26770 ?auto_26792 ) ) ( IS-CRATE ?auto_26763 ) ( AVAILABLE ?auto_26792 ) ( SURFACE-AT ?auto_26763 ?auto_26789 ) ( ON ?auto_26763 ?auto_26778 ) ( CLEAR ?auto_26763 ) ( not ( = ?auto_26759 ?auto_26763 ) ) ( not ( = ?auto_26759 ?auto_26778 ) ) ( not ( = ?auto_26763 ?auto_26778 ) ) ( IS-CRATE ?auto_26759 ) ( not ( = ?auto_26791 ?auto_26769 ) ) ( HOIST-AT ?auto_26798 ?auto_26791 ) ( AVAILABLE ?auto_26798 ) ( SURFACE-AT ?auto_26759 ?auto_26791 ) ( ON ?auto_26759 ?auto_26800 ) ( CLEAR ?auto_26759 ) ( not ( = ?auto_26761 ?auto_26759 ) ) ( not ( = ?auto_26761 ?auto_26800 ) ) ( not ( = ?auto_26759 ?auto_26800 ) ) ( not ( = ?auto_26770 ?auto_26798 ) ) ( IS-CRATE ?auto_26761 ) ( not ( = ?auto_26794 ?auto_26769 ) ) ( HOIST-AT ?auto_26796 ?auto_26794 ) ( AVAILABLE ?auto_26796 ) ( SURFACE-AT ?auto_26761 ?auto_26794 ) ( ON ?auto_26761 ?auto_26779 ) ( CLEAR ?auto_26761 ) ( not ( = ?auto_26758 ?auto_26761 ) ) ( not ( = ?auto_26758 ?auto_26779 ) ) ( not ( = ?auto_26761 ?auto_26779 ) ) ( not ( = ?auto_26770 ?auto_26796 ) ) ( IS-CRATE ?auto_26758 ) ( AVAILABLE ?auto_26776 ) ( SURFACE-AT ?auto_26758 ?auto_26788 ) ( ON ?auto_26758 ?auto_26795 ) ( CLEAR ?auto_26758 ) ( not ( = ?auto_26757 ?auto_26758 ) ) ( not ( = ?auto_26757 ?auto_26795 ) ) ( not ( = ?auto_26758 ?auto_26795 ) ) ( IS-CRATE ?auto_26757 ) ( not ( = ?auto_26774 ?auto_26769 ) ) ( HOIST-AT ?auto_26782 ?auto_26774 ) ( AVAILABLE ?auto_26782 ) ( SURFACE-AT ?auto_26757 ?auto_26774 ) ( ON ?auto_26757 ?auto_26777 ) ( CLEAR ?auto_26757 ) ( not ( = ?auto_26756 ?auto_26757 ) ) ( not ( = ?auto_26756 ?auto_26777 ) ) ( not ( = ?auto_26757 ?auto_26777 ) ) ( not ( = ?auto_26770 ?auto_26782 ) ) ( IS-CRATE ?auto_26756 ) ( not ( = ?auto_26784 ?auto_26769 ) ) ( HOIST-AT ?auto_26802 ?auto_26784 ) ( AVAILABLE ?auto_26802 ) ( SURFACE-AT ?auto_26756 ?auto_26784 ) ( ON ?auto_26756 ?auto_26780 ) ( CLEAR ?auto_26756 ) ( not ( = ?auto_26755 ?auto_26756 ) ) ( not ( = ?auto_26755 ?auto_26780 ) ) ( not ( = ?auto_26756 ?auto_26780 ) ) ( not ( = ?auto_26770 ?auto_26802 ) ) ( SURFACE-AT ?auto_26754 ?auto_26769 ) ( CLEAR ?auto_26754 ) ( IS-CRATE ?auto_26755 ) ( AVAILABLE ?auto_26770 ) ( not ( = ?auto_26803 ?auto_26769 ) ) ( HOIST-AT ?auto_26786 ?auto_26803 ) ( AVAILABLE ?auto_26786 ) ( SURFACE-AT ?auto_26755 ?auto_26803 ) ( ON ?auto_26755 ?auto_26805 ) ( CLEAR ?auto_26755 ) ( TRUCK-AT ?auto_26768 ?auto_26769 ) ( not ( = ?auto_26754 ?auto_26755 ) ) ( not ( = ?auto_26754 ?auto_26805 ) ) ( not ( = ?auto_26755 ?auto_26805 ) ) ( not ( = ?auto_26770 ?auto_26786 ) ) ( not ( = ?auto_26754 ?auto_26756 ) ) ( not ( = ?auto_26754 ?auto_26780 ) ) ( not ( = ?auto_26756 ?auto_26805 ) ) ( not ( = ?auto_26784 ?auto_26803 ) ) ( not ( = ?auto_26802 ?auto_26786 ) ) ( not ( = ?auto_26780 ?auto_26805 ) ) ( not ( = ?auto_26754 ?auto_26757 ) ) ( not ( = ?auto_26754 ?auto_26777 ) ) ( not ( = ?auto_26755 ?auto_26757 ) ) ( not ( = ?auto_26755 ?auto_26777 ) ) ( not ( = ?auto_26757 ?auto_26780 ) ) ( not ( = ?auto_26757 ?auto_26805 ) ) ( not ( = ?auto_26774 ?auto_26784 ) ) ( not ( = ?auto_26774 ?auto_26803 ) ) ( not ( = ?auto_26782 ?auto_26802 ) ) ( not ( = ?auto_26782 ?auto_26786 ) ) ( not ( = ?auto_26777 ?auto_26780 ) ) ( not ( = ?auto_26777 ?auto_26805 ) ) ( not ( = ?auto_26754 ?auto_26758 ) ) ( not ( = ?auto_26754 ?auto_26795 ) ) ( not ( = ?auto_26755 ?auto_26758 ) ) ( not ( = ?auto_26755 ?auto_26795 ) ) ( not ( = ?auto_26756 ?auto_26758 ) ) ( not ( = ?auto_26756 ?auto_26795 ) ) ( not ( = ?auto_26758 ?auto_26777 ) ) ( not ( = ?auto_26758 ?auto_26780 ) ) ( not ( = ?auto_26758 ?auto_26805 ) ) ( not ( = ?auto_26788 ?auto_26774 ) ) ( not ( = ?auto_26788 ?auto_26784 ) ) ( not ( = ?auto_26788 ?auto_26803 ) ) ( not ( = ?auto_26776 ?auto_26782 ) ) ( not ( = ?auto_26776 ?auto_26802 ) ) ( not ( = ?auto_26776 ?auto_26786 ) ) ( not ( = ?auto_26795 ?auto_26777 ) ) ( not ( = ?auto_26795 ?auto_26780 ) ) ( not ( = ?auto_26795 ?auto_26805 ) ) ( not ( = ?auto_26754 ?auto_26761 ) ) ( not ( = ?auto_26754 ?auto_26779 ) ) ( not ( = ?auto_26755 ?auto_26761 ) ) ( not ( = ?auto_26755 ?auto_26779 ) ) ( not ( = ?auto_26756 ?auto_26761 ) ) ( not ( = ?auto_26756 ?auto_26779 ) ) ( not ( = ?auto_26757 ?auto_26761 ) ) ( not ( = ?auto_26757 ?auto_26779 ) ) ( not ( = ?auto_26761 ?auto_26795 ) ) ( not ( = ?auto_26761 ?auto_26777 ) ) ( not ( = ?auto_26761 ?auto_26780 ) ) ( not ( = ?auto_26761 ?auto_26805 ) ) ( not ( = ?auto_26794 ?auto_26788 ) ) ( not ( = ?auto_26794 ?auto_26774 ) ) ( not ( = ?auto_26794 ?auto_26784 ) ) ( not ( = ?auto_26794 ?auto_26803 ) ) ( not ( = ?auto_26796 ?auto_26776 ) ) ( not ( = ?auto_26796 ?auto_26782 ) ) ( not ( = ?auto_26796 ?auto_26802 ) ) ( not ( = ?auto_26796 ?auto_26786 ) ) ( not ( = ?auto_26779 ?auto_26795 ) ) ( not ( = ?auto_26779 ?auto_26777 ) ) ( not ( = ?auto_26779 ?auto_26780 ) ) ( not ( = ?auto_26779 ?auto_26805 ) ) ( not ( = ?auto_26754 ?auto_26759 ) ) ( not ( = ?auto_26754 ?auto_26800 ) ) ( not ( = ?auto_26755 ?auto_26759 ) ) ( not ( = ?auto_26755 ?auto_26800 ) ) ( not ( = ?auto_26756 ?auto_26759 ) ) ( not ( = ?auto_26756 ?auto_26800 ) ) ( not ( = ?auto_26757 ?auto_26759 ) ) ( not ( = ?auto_26757 ?auto_26800 ) ) ( not ( = ?auto_26758 ?auto_26759 ) ) ( not ( = ?auto_26758 ?auto_26800 ) ) ( not ( = ?auto_26759 ?auto_26779 ) ) ( not ( = ?auto_26759 ?auto_26795 ) ) ( not ( = ?auto_26759 ?auto_26777 ) ) ( not ( = ?auto_26759 ?auto_26780 ) ) ( not ( = ?auto_26759 ?auto_26805 ) ) ( not ( = ?auto_26791 ?auto_26794 ) ) ( not ( = ?auto_26791 ?auto_26788 ) ) ( not ( = ?auto_26791 ?auto_26774 ) ) ( not ( = ?auto_26791 ?auto_26784 ) ) ( not ( = ?auto_26791 ?auto_26803 ) ) ( not ( = ?auto_26798 ?auto_26796 ) ) ( not ( = ?auto_26798 ?auto_26776 ) ) ( not ( = ?auto_26798 ?auto_26782 ) ) ( not ( = ?auto_26798 ?auto_26802 ) ) ( not ( = ?auto_26798 ?auto_26786 ) ) ( not ( = ?auto_26800 ?auto_26779 ) ) ( not ( = ?auto_26800 ?auto_26795 ) ) ( not ( = ?auto_26800 ?auto_26777 ) ) ( not ( = ?auto_26800 ?auto_26780 ) ) ( not ( = ?auto_26800 ?auto_26805 ) ) ( not ( = ?auto_26754 ?auto_26763 ) ) ( not ( = ?auto_26754 ?auto_26778 ) ) ( not ( = ?auto_26755 ?auto_26763 ) ) ( not ( = ?auto_26755 ?auto_26778 ) ) ( not ( = ?auto_26756 ?auto_26763 ) ) ( not ( = ?auto_26756 ?auto_26778 ) ) ( not ( = ?auto_26757 ?auto_26763 ) ) ( not ( = ?auto_26757 ?auto_26778 ) ) ( not ( = ?auto_26758 ?auto_26763 ) ) ( not ( = ?auto_26758 ?auto_26778 ) ) ( not ( = ?auto_26761 ?auto_26763 ) ) ( not ( = ?auto_26761 ?auto_26778 ) ) ( not ( = ?auto_26763 ?auto_26800 ) ) ( not ( = ?auto_26763 ?auto_26779 ) ) ( not ( = ?auto_26763 ?auto_26795 ) ) ( not ( = ?auto_26763 ?auto_26777 ) ) ( not ( = ?auto_26763 ?auto_26780 ) ) ( not ( = ?auto_26763 ?auto_26805 ) ) ( not ( = ?auto_26789 ?auto_26791 ) ) ( not ( = ?auto_26789 ?auto_26794 ) ) ( not ( = ?auto_26789 ?auto_26788 ) ) ( not ( = ?auto_26789 ?auto_26774 ) ) ( not ( = ?auto_26789 ?auto_26784 ) ) ( not ( = ?auto_26789 ?auto_26803 ) ) ( not ( = ?auto_26792 ?auto_26798 ) ) ( not ( = ?auto_26792 ?auto_26796 ) ) ( not ( = ?auto_26792 ?auto_26776 ) ) ( not ( = ?auto_26792 ?auto_26782 ) ) ( not ( = ?auto_26792 ?auto_26802 ) ) ( not ( = ?auto_26792 ?auto_26786 ) ) ( not ( = ?auto_26778 ?auto_26800 ) ) ( not ( = ?auto_26778 ?auto_26779 ) ) ( not ( = ?auto_26778 ?auto_26795 ) ) ( not ( = ?auto_26778 ?auto_26777 ) ) ( not ( = ?auto_26778 ?auto_26780 ) ) ( not ( = ?auto_26778 ?auto_26805 ) ) ( not ( = ?auto_26754 ?auto_26762 ) ) ( not ( = ?auto_26754 ?auto_26783 ) ) ( not ( = ?auto_26755 ?auto_26762 ) ) ( not ( = ?auto_26755 ?auto_26783 ) ) ( not ( = ?auto_26756 ?auto_26762 ) ) ( not ( = ?auto_26756 ?auto_26783 ) ) ( not ( = ?auto_26757 ?auto_26762 ) ) ( not ( = ?auto_26757 ?auto_26783 ) ) ( not ( = ?auto_26758 ?auto_26762 ) ) ( not ( = ?auto_26758 ?auto_26783 ) ) ( not ( = ?auto_26761 ?auto_26762 ) ) ( not ( = ?auto_26761 ?auto_26783 ) ) ( not ( = ?auto_26759 ?auto_26762 ) ) ( not ( = ?auto_26759 ?auto_26783 ) ) ( not ( = ?auto_26762 ?auto_26778 ) ) ( not ( = ?auto_26762 ?auto_26800 ) ) ( not ( = ?auto_26762 ?auto_26779 ) ) ( not ( = ?auto_26762 ?auto_26795 ) ) ( not ( = ?auto_26762 ?auto_26777 ) ) ( not ( = ?auto_26762 ?auto_26780 ) ) ( not ( = ?auto_26762 ?auto_26805 ) ) ( not ( = ?auto_26783 ?auto_26778 ) ) ( not ( = ?auto_26783 ?auto_26800 ) ) ( not ( = ?auto_26783 ?auto_26779 ) ) ( not ( = ?auto_26783 ?auto_26795 ) ) ( not ( = ?auto_26783 ?auto_26777 ) ) ( not ( = ?auto_26783 ?auto_26780 ) ) ( not ( = ?auto_26783 ?auto_26805 ) ) ( not ( = ?auto_26754 ?auto_26760 ) ) ( not ( = ?auto_26754 ?auto_26790 ) ) ( not ( = ?auto_26755 ?auto_26760 ) ) ( not ( = ?auto_26755 ?auto_26790 ) ) ( not ( = ?auto_26756 ?auto_26760 ) ) ( not ( = ?auto_26756 ?auto_26790 ) ) ( not ( = ?auto_26757 ?auto_26760 ) ) ( not ( = ?auto_26757 ?auto_26790 ) ) ( not ( = ?auto_26758 ?auto_26760 ) ) ( not ( = ?auto_26758 ?auto_26790 ) ) ( not ( = ?auto_26761 ?auto_26760 ) ) ( not ( = ?auto_26761 ?auto_26790 ) ) ( not ( = ?auto_26759 ?auto_26760 ) ) ( not ( = ?auto_26759 ?auto_26790 ) ) ( not ( = ?auto_26763 ?auto_26760 ) ) ( not ( = ?auto_26763 ?auto_26790 ) ) ( not ( = ?auto_26760 ?auto_26783 ) ) ( not ( = ?auto_26760 ?auto_26778 ) ) ( not ( = ?auto_26760 ?auto_26800 ) ) ( not ( = ?auto_26760 ?auto_26779 ) ) ( not ( = ?auto_26760 ?auto_26795 ) ) ( not ( = ?auto_26760 ?auto_26777 ) ) ( not ( = ?auto_26760 ?auto_26780 ) ) ( not ( = ?auto_26760 ?auto_26805 ) ) ( not ( = ?auto_26790 ?auto_26783 ) ) ( not ( = ?auto_26790 ?auto_26778 ) ) ( not ( = ?auto_26790 ?auto_26800 ) ) ( not ( = ?auto_26790 ?auto_26779 ) ) ( not ( = ?auto_26790 ?auto_26795 ) ) ( not ( = ?auto_26790 ?auto_26777 ) ) ( not ( = ?auto_26790 ?auto_26780 ) ) ( not ( = ?auto_26790 ?auto_26805 ) ) ( not ( = ?auto_26754 ?auto_26765 ) ) ( not ( = ?auto_26754 ?auto_26793 ) ) ( not ( = ?auto_26755 ?auto_26765 ) ) ( not ( = ?auto_26755 ?auto_26793 ) ) ( not ( = ?auto_26756 ?auto_26765 ) ) ( not ( = ?auto_26756 ?auto_26793 ) ) ( not ( = ?auto_26757 ?auto_26765 ) ) ( not ( = ?auto_26757 ?auto_26793 ) ) ( not ( = ?auto_26758 ?auto_26765 ) ) ( not ( = ?auto_26758 ?auto_26793 ) ) ( not ( = ?auto_26761 ?auto_26765 ) ) ( not ( = ?auto_26761 ?auto_26793 ) ) ( not ( = ?auto_26759 ?auto_26765 ) ) ( not ( = ?auto_26759 ?auto_26793 ) ) ( not ( = ?auto_26763 ?auto_26765 ) ) ( not ( = ?auto_26763 ?auto_26793 ) ) ( not ( = ?auto_26762 ?auto_26765 ) ) ( not ( = ?auto_26762 ?auto_26793 ) ) ( not ( = ?auto_26765 ?auto_26790 ) ) ( not ( = ?auto_26765 ?auto_26783 ) ) ( not ( = ?auto_26765 ?auto_26778 ) ) ( not ( = ?auto_26765 ?auto_26800 ) ) ( not ( = ?auto_26765 ?auto_26779 ) ) ( not ( = ?auto_26765 ?auto_26795 ) ) ( not ( = ?auto_26765 ?auto_26777 ) ) ( not ( = ?auto_26765 ?auto_26780 ) ) ( not ( = ?auto_26765 ?auto_26805 ) ) ( not ( = ?auto_26775 ?auto_26788 ) ) ( not ( = ?auto_26775 ?auto_26789 ) ) ( not ( = ?auto_26775 ?auto_26791 ) ) ( not ( = ?auto_26775 ?auto_26794 ) ) ( not ( = ?auto_26775 ?auto_26774 ) ) ( not ( = ?auto_26775 ?auto_26784 ) ) ( not ( = ?auto_26775 ?auto_26803 ) ) ( not ( = ?auto_26799 ?auto_26776 ) ) ( not ( = ?auto_26799 ?auto_26792 ) ) ( not ( = ?auto_26799 ?auto_26798 ) ) ( not ( = ?auto_26799 ?auto_26796 ) ) ( not ( = ?auto_26799 ?auto_26782 ) ) ( not ( = ?auto_26799 ?auto_26802 ) ) ( not ( = ?auto_26799 ?auto_26786 ) ) ( not ( = ?auto_26793 ?auto_26790 ) ) ( not ( = ?auto_26793 ?auto_26783 ) ) ( not ( = ?auto_26793 ?auto_26778 ) ) ( not ( = ?auto_26793 ?auto_26800 ) ) ( not ( = ?auto_26793 ?auto_26779 ) ) ( not ( = ?auto_26793 ?auto_26795 ) ) ( not ( = ?auto_26793 ?auto_26777 ) ) ( not ( = ?auto_26793 ?auto_26780 ) ) ( not ( = ?auto_26793 ?auto_26805 ) ) ( not ( = ?auto_26754 ?auto_26764 ) ) ( not ( = ?auto_26754 ?auto_26797 ) ) ( not ( = ?auto_26755 ?auto_26764 ) ) ( not ( = ?auto_26755 ?auto_26797 ) ) ( not ( = ?auto_26756 ?auto_26764 ) ) ( not ( = ?auto_26756 ?auto_26797 ) ) ( not ( = ?auto_26757 ?auto_26764 ) ) ( not ( = ?auto_26757 ?auto_26797 ) ) ( not ( = ?auto_26758 ?auto_26764 ) ) ( not ( = ?auto_26758 ?auto_26797 ) ) ( not ( = ?auto_26761 ?auto_26764 ) ) ( not ( = ?auto_26761 ?auto_26797 ) ) ( not ( = ?auto_26759 ?auto_26764 ) ) ( not ( = ?auto_26759 ?auto_26797 ) ) ( not ( = ?auto_26763 ?auto_26764 ) ) ( not ( = ?auto_26763 ?auto_26797 ) ) ( not ( = ?auto_26762 ?auto_26764 ) ) ( not ( = ?auto_26762 ?auto_26797 ) ) ( not ( = ?auto_26760 ?auto_26764 ) ) ( not ( = ?auto_26760 ?auto_26797 ) ) ( not ( = ?auto_26764 ?auto_26793 ) ) ( not ( = ?auto_26764 ?auto_26790 ) ) ( not ( = ?auto_26764 ?auto_26783 ) ) ( not ( = ?auto_26764 ?auto_26778 ) ) ( not ( = ?auto_26764 ?auto_26800 ) ) ( not ( = ?auto_26764 ?auto_26779 ) ) ( not ( = ?auto_26764 ?auto_26795 ) ) ( not ( = ?auto_26764 ?auto_26777 ) ) ( not ( = ?auto_26764 ?auto_26780 ) ) ( not ( = ?auto_26764 ?auto_26805 ) ) ( not ( = ?auto_26785 ?auto_26775 ) ) ( not ( = ?auto_26785 ?auto_26788 ) ) ( not ( = ?auto_26785 ?auto_26789 ) ) ( not ( = ?auto_26785 ?auto_26791 ) ) ( not ( = ?auto_26785 ?auto_26794 ) ) ( not ( = ?auto_26785 ?auto_26774 ) ) ( not ( = ?auto_26785 ?auto_26784 ) ) ( not ( = ?auto_26785 ?auto_26803 ) ) ( not ( = ?auto_26787 ?auto_26799 ) ) ( not ( = ?auto_26787 ?auto_26776 ) ) ( not ( = ?auto_26787 ?auto_26792 ) ) ( not ( = ?auto_26787 ?auto_26798 ) ) ( not ( = ?auto_26787 ?auto_26796 ) ) ( not ( = ?auto_26787 ?auto_26782 ) ) ( not ( = ?auto_26787 ?auto_26802 ) ) ( not ( = ?auto_26787 ?auto_26786 ) ) ( not ( = ?auto_26797 ?auto_26793 ) ) ( not ( = ?auto_26797 ?auto_26790 ) ) ( not ( = ?auto_26797 ?auto_26783 ) ) ( not ( = ?auto_26797 ?auto_26778 ) ) ( not ( = ?auto_26797 ?auto_26800 ) ) ( not ( = ?auto_26797 ?auto_26779 ) ) ( not ( = ?auto_26797 ?auto_26795 ) ) ( not ( = ?auto_26797 ?auto_26777 ) ) ( not ( = ?auto_26797 ?auto_26780 ) ) ( not ( = ?auto_26797 ?auto_26805 ) ) ( not ( = ?auto_26754 ?auto_26766 ) ) ( not ( = ?auto_26754 ?auto_26781 ) ) ( not ( = ?auto_26755 ?auto_26766 ) ) ( not ( = ?auto_26755 ?auto_26781 ) ) ( not ( = ?auto_26756 ?auto_26766 ) ) ( not ( = ?auto_26756 ?auto_26781 ) ) ( not ( = ?auto_26757 ?auto_26766 ) ) ( not ( = ?auto_26757 ?auto_26781 ) ) ( not ( = ?auto_26758 ?auto_26766 ) ) ( not ( = ?auto_26758 ?auto_26781 ) ) ( not ( = ?auto_26761 ?auto_26766 ) ) ( not ( = ?auto_26761 ?auto_26781 ) ) ( not ( = ?auto_26759 ?auto_26766 ) ) ( not ( = ?auto_26759 ?auto_26781 ) ) ( not ( = ?auto_26763 ?auto_26766 ) ) ( not ( = ?auto_26763 ?auto_26781 ) ) ( not ( = ?auto_26762 ?auto_26766 ) ) ( not ( = ?auto_26762 ?auto_26781 ) ) ( not ( = ?auto_26760 ?auto_26766 ) ) ( not ( = ?auto_26760 ?auto_26781 ) ) ( not ( = ?auto_26765 ?auto_26766 ) ) ( not ( = ?auto_26765 ?auto_26781 ) ) ( not ( = ?auto_26766 ?auto_26797 ) ) ( not ( = ?auto_26766 ?auto_26793 ) ) ( not ( = ?auto_26766 ?auto_26790 ) ) ( not ( = ?auto_26766 ?auto_26783 ) ) ( not ( = ?auto_26766 ?auto_26778 ) ) ( not ( = ?auto_26766 ?auto_26800 ) ) ( not ( = ?auto_26766 ?auto_26779 ) ) ( not ( = ?auto_26766 ?auto_26795 ) ) ( not ( = ?auto_26766 ?auto_26777 ) ) ( not ( = ?auto_26766 ?auto_26780 ) ) ( not ( = ?auto_26766 ?auto_26805 ) ) ( not ( = ?auto_26801 ?auto_26785 ) ) ( not ( = ?auto_26801 ?auto_26775 ) ) ( not ( = ?auto_26801 ?auto_26788 ) ) ( not ( = ?auto_26801 ?auto_26789 ) ) ( not ( = ?auto_26801 ?auto_26791 ) ) ( not ( = ?auto_26801 ?auto_26794 ) ) ( not ( = ?auto_26801 ?auto_26774 ) ) ( not ( = ?auto_26801 ?auto_26784 ) ) ( not ( = ?auto_26801 ?auto_26803 ) ) ( not ( = ?auto_26804 ?auto_26787 ) ) ( not ( = ?auto_26804 ?auto_26799 ) ) ( not ( = ?auto_26804 ?auto_26776 ) ) ( not ( = ?auto_26804 ?auto_26792 ) ) ( not ( = ?auto_26804 ?auto_26798 ) ) ( not ( = ?auto_26804 ?auto_26796 ) ) ( not ( = ?auto_26804 ?auto_26782 ) ) ( not ( = ?auto_26804 ?auto_26802 ) ) ( not ( = ?auto_26804 ?auto_26786 ) ) ( not ( = ?auto_26781 ?auto_26797 ) ) ( not ( = ?auto_26781 ?auto_26793 ) ) ( not ( = ?auto_26781 ?auto_26790 ) ) ( not ( = ?auto_26781 ?auto_26783 ) ) ( not ( = ?auto_26781 ?auto_26778 ) ) ( not ( = ?auto_26781 ?auto_26800 ) ) ( not ( = ?auto_26781 ?auto_26779 ) ) ( not ( = ?auto_26781 ?auto_26795 ) ) ( not ( = ?auto_26781 ?auto_26777 ) ) ( not ( = ?auto_26781 ?auto_26780 ) ) ( not ( = ?auto_26781 ?auto_26805 ) ) ( not ( = ?auto_26754 ?auto_26767 ) ) ( not ( = ?auto_26754 ?auto_26772 ) ) ( not ( = ?auto_26755 ?auto_26767 ) ) ( not ( = ?auto_26755 ?auto_26772 ) ) ( not ( = ?auto_26756 ?auto_26767 ) ) ( not ( = ?auto_26756 ?auto_26772 ) ) ( not ( = ?auto_26757 ?auto_26767 ) ) ( not ( = ?auto_26757 ?auto_26772 ) ) ( not ( = ?auto_26758 ?auto_26767 ) ) ( not ( = ?auto_26758 ?auto_26772 ) ) ( not ( = ?auto_26761 ?auto_26767 ) ) ( not ( = ?auto_26761 ?auto_26772 ) ) ( not ( = ?auto_26759 ?auto_26767 ) ) ( not ( = ?auto_26759 ?auto_26772 ) ) ( not ( = ?auto_26763 ?auto_26767 ) ) ( not ( = ?auto_26763 ?auto_26772 ) ) ( not ( = ?auto_26762 ?auto_26767 ) ) ( not ( = ?auto_26762 ?auto_26772 ) ) ( not ( = ?auto_26760 ?auto_26767 ) ) ( not ( = ?auto_26760 ?auto_26772 ) ) ( not ( = ?auto_26765 ?auto_26767 ) ) ( not ( = ?auto_26765 ?auto_26772 ) ) ( not ( = ?auto_26764 ?auto_26767 ) ) ( not ( = ?auto_26764 ?auto_26772 ) ) ( not ( = ?auto_26767 ?auto_26781 ) ) ( not ( = ?auto_26767 ?auto_26797 ) ) ( not ( = ?auto_26767 ?auto_26793 ) ) ( not ( = ?auto_26767 ?auto_26790 ) ) ( not ( = ?auto_26767 ?auto_26783 ) ) ( not ( = ?auto_26767 ?auto_26778 ) ) ( not ( = ?auto_26767 ?auto_26800 ) ) ( not ( = ?auto_26767 ?auto_26779 ) ) ( not ( = ?auto_26767 ?auto_26795 ) ) ( not ( = ?auto_26767 ?auto_26777 ) ) ( not ( = ?auto_26767 ?auto_26780 ) ) ( not ( = ?auto_26767 ?auto_26805 ) ) ( not ( = ?auto_26771 ?auto_26801 ) ) ( not ( = ?auto_26771 ?auto_26785 ) ) ( not ( = ?auto_26771 ?auto_26775 ) ) ( not ( = ?auto_26771 ?auto_26788 ) ) ( not ( = ?auto_26771 ?auto_26789 ) ) ( not ( = ?auto_26771 ?auto_26791 ) ) ( not ( = ?auto_26771 ?auto_26794 ) ) ( not ( = ?auto_26771 ?auto_26774 ) ) ( not ( = ?auto_26771 ?auto_26784 ) ) ( not ( = ?auto_26771 ?auto_26803 ) ) ( not ( = ?auto_26773 ?auto_26804 ) ) ( not ( = ?auto_26773 ?auto_26787 ) ) ( not ( = ?auto_26773 ?auto_26799 ) ) ( not ( = ?auto_26773 ?auto_26776 ) ) ( not ( = ?auto_26773 ?auto_26792 ) ) ( not ( = ?auto_26773 ?auto_26798 ) ) ( not ( = ?auto_26773 ?auto_26796 ) ) ( not ( = ?auto_26773 ?auto_26782 ) ) ( not ( = ?auto_26773 ?auto_26802 ) ) ( not ( = ?auto_26773 ?auto_26786 ) ) ( not ( = ?auto_26772 ?auto_26781 ) ) ( not ( = ?auto_26772 ?auto_26797 ) ) ( not ( = ?auto_26772 ?auto_26793 ) ) ( not ( = ?auto_26772 ?auto_26790 ) ) ( not ( = ?auto_26772 ?auto_26783 ) ) ( not ( = ?auto_26772 ?auto_26778 ) ) ( not ( = ?auto_26772 ?auto_26800 ) ) ( not ( = ?auto_26772 ?auto_26779 ) ) ( not ( = ?auto_26772 ?auto_26795 ) ) ( not ( = ?auto_26772 ?auto_26777 ) ) ( not ( = ?auto_26772 ?auto_26780 ) ) ( not ( = ?auto_26772 ?auto_26805 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_26754 ?auto_26755 ?auto_26756 ?auto_26757 ?auto_26758 ?auto_26761 ?auto_26759 ?auto_26763 ?auto_26762 ?auto_26760 ?auto_26765 ?auto_26764 ?auto_26766 )
      ( MAKE-1CRATE ?auto_26766 ?auto_26767 )
      ( MAKE-13CRATE-VERIFY ?auto_26754 ?auto_26755 ?auto_26756 ?auto_26757 ?auto_26758 ?auto_26761 ?auto_26759 ?auto_26763 ?auto_26762 ?auto_26760 ?auto_26765 ?auto_26764 ?auto_26766 ?auto_26767 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26808 - SURFACE
      ?auto_26809 - SURFACE
    )
    :vars
    (
      ?auto_26810 - HOIST
      ?auto_26811 - PLACE
      ?auto_26813 - PLACE
      ?auto_26814 - HOIST
      ?auto_26815 - SURFACE
      ?auto_26812 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26810 ?auto_26811 ) ( SURFACE-AT ?auto_26808 ?auto_26811 ) ( CLEAR ?auto_26808 ) ( IS-CRATE ?auto_26809 ) ( AVAILABLE ?auto_26810 ) ( not ( = ?auto_26813 ?auto_26811 ) ) ( HOIST-AT ?auto_26814 ?auto_26813 ) ( AVAILABLE ?auto_26814 ) ( SURFACE-AT ?auto_26809 ?auto_26813 ) ( ON ?auto_26809 ?auto_26815 ) ( CLEAR ?auto_26809 ) ( TRUCK-AT ?auto_26812 ?auto_26811 ) ( not ( = ?auto_26808 ?auto_26809 ) ) ( not ( = ?auto_26808 ?auto_26815 ) ) ( not ( = ?auto_26809 ?auto_26815 ) ) ( not ( = ?auto_26810 ?auto_26814 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26812 ?auto_26811 ?auto_26813 )
      ( !LIFT ?auto_26814 ?auto_26809 ?auto_26815 ?auto_26813 )
      ( !LOAD ?auto_26814 ?auto_26809 ?auto_26812 ?auto_26813 )
      ( !DRIVE ?auto_26812 ?auto_26813 ?auto_26811 )
      ( !UNLOAD ?auto_26810 ?auto_26809 ?auto_26812 ?auto_26811 )
      ( !DROP ?auto_26810 ?auto_26809 ?auto_26808 ?auto_26811 )
      ( MAKE-1CRATE-VERIFY ?auto_26808 ?auto_26809 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_26831 - SURFACE
      ?auto_26832 - SURFACE
      ?auto_26833 - SURFACE
      ?auto_26834 - SURFACE
      ?auto_26835 - SURFACE
      ?auto_26838 - SURFACE
      ?auto_26836 - SURFACE
      ?auto_26840 - SURFACE
      ?auto_26839 - SURFACE
      ?auto_26837 - SURFACE
      ?auto_26842 - SURFACE
      ?auto_26841 - SURFACE
      ?auto_26843 - SURFACE
      ?auto_26844 - SURFACE
      ?auto_26845 - SURFACE
    )
    :vars
    (
      ?auto_26850 - HOIST
      ?auto_26851 - PLACE
      ?auto_26847 - PLACE
      ?auto_26848 - HOIST
      ?auto_26849 - SURFACE
      ?auto_26866 - PLACE
      ?auto_26869 - HOIST
      ?auto_26880 - SURFACE
      ?auto_26867 - PLACE
      ?auto_26871 - HOIST
      ?auto_26870 - SURFACE
      ?auto_26865 - PLACE
      ?auto_26883 - HOIST
      ?auto_26859 - SURFACE
      ?auto_26855 - PLACE
      ?auto_26882 - HOIST
      ?auto_26877 - SURFACE
      ?auto_26857 - PLACE
      ?auto_26872 - HOIST
      ?auto_26862 - SURFACE
      ?auto_26863 - PLACE
      ?auto_26876 - HOIST
      ?auto_26852 - SURFACE
      ?auto_26854 - SURFACE
      ?auto_26860 - PLACE
      ?auto_26875 - HOIST
      ?auto_26858 - SURFACE
      ?auto_26878 - PLACE
      ?auto_26879 - HOIST
      ?auto_26861 - SURFACE
      ?auto_26874 - SURFACE
      ?auto_26868 - PLACE
      ?auto_26884 - HOIST
      ?auto_26853 - SURFACE
      ?auto_26873 - SURFACE
      ?auto_26881 - PLACE
      ?auto_26864 - HOIST
      ?auto_26856 - SURFACE
      ?auto_26846 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26850 ?auto_26851 ) ( IS-CRATE ?auto_26845 ) ( not ( = ?auto_26847 ?auto_26851 ) ) ( HOIST-AT ?auto_26848 ?auto_26847 ) ( SURFACE-AT ?auto_26845 ?auto_26847 ) ( ON ?auto_26845 ?auto_26849 ) ( CLEAR ?auto_26845 ) ( not ( = ?auto_26844 ?auto_26845 ) ) ( not ( = ?auto_26844 ?auto_26849 ) ) ( not ( = ?auto_26845 ?auto_26849 ) ) ( not ( = ?auto_26850 ?auto_26848 ) ) ( IS-CRATE ?auto_26844 ) ( not ( = ?auto_26866 ?auto_26851 ) ) ( HOIST-AT ?auto_26869 ?auto_26866 ) ( AVAILABLE ?auto_26869 ) ( SURFACE-AT ?auto_26844 ?auto_26866 ) ( ON ?auto_26844 ?auto_26880 ) ( CLEAR ?auto_26844 ) ( not ( = ?auto_26843 ?auto_26844 ) ) ( not ( = ?auto_26843 ?auto_26880 ) ) ( not ( = ?auto_26844 ?auto_26880 ) ) ( not ( = ?auto_26850 ?auto_26869 ) ) ( IS-CRATE ?auto_26843 ) ( not ( = ?auto_26867 ?auto_26851 ) ) ( HOIST-AT ?auto_26871 ?auto_26867 ) ( AVAILABLE ?auto_26871 ) ( SURFACE-AT ?auto_26843 ?auto_26867 ) ( ON ?auto_26843 ?auto_26870 ) ( CLEAR ?auto_26843 ) ( not ( = ?auto_26841 ?auto_26843 ) ) ( not ( = ?auto_26841 ?auto_26870 ) ) ( not ( = ?auto_26843 ?auto_26870 ) ) ( not ( = ?auto_26850 ?auto_26871 ) ) ( IS-CRATE ?auto_26841 ) ( not ( = ?auto_26865 ?auto_26851 ) ) ( HOIST-AT ?auto_26883 ?auto_26865 ) ( AVAILABLE ?auto_26883 ) ( SURFACE-AT ?auto_26841 ?auto_26865 ) ( ON ?auto_26841 ?auto_26859 ) ( CLEAR ?auto_26841 ) ( not ( = ?auto_26842 ?auto_26841 ) ) ( not ( = ?auto_26842 ?auto_26859 ) ) ( not ( = ?auto_26841 ?auto_26859 ) ) ( not ( = ?auto_26850 ?auto_26883 ) ) ( IS-CRATE ?auto_26842 ) ( not ( = ?auto_26855 ?auto_26851 ) ) ( HOIST-AT ?auto_26882 ?auto_26855 ) ( AVAILABLE ?auto_26882 ) ( SURFACE-AT ?auto_26842 ?auto_26855 ) ( ON ?auto_26842 ?auto_26877 ) ( CLEAR ?auto_26842 ) ( not ( = ?auto_26837 ?auto_26842 ) ) ( not ( = ?auto_26837 ?auto_26877 ) ) ( not ( = ?auto_26842 ?auto_26877 ) ) ( not ( = ?auto_26850 ?auto_26882 ) ) ( IS-CRATE ?auto_26837 ) ( not ( = ?auto_26857 ?auto_26851 ) ) ( HOIST-AT ?auto_26872 ?auto_26857 ) ( SURFACE-AT ?auto_26837 ?auto_26857 ) ( ON ?auto_26837 ?auto_26862 ) ( CLEAR ?auto_26837 ) ( not ( = ?auto_26839 ?auto_26837 ) ) ( not ( = ?auto_26839 ?auto_26862 ) ) ( not ( = ?auto_26837 ?auto_26862 ) ) ( not ( = ?auto_26850 ?auto_26872 ) ) ( IS-CRATE ?auto_26839 ) ( not ( = ?auto_26863 ?auto_26851 ) ) ( HOIST-AT ?auto_26876 ?auto_26863 ) ( SURFACE-AT ?auto_26839 ?auto_26863 ) ( ON ?auto_26839 ?auto_26852 ) ( CLEAR ?auto_26839 ) ( not ( = ?auto_26840 ?auto_26839 ) ) ( not ( = ?auto_26840 ?auto_26852 ) ) ( not ( = ?auto_26839 ?auto_26852 ) ) ( not ( = ?auto_26850 ?auto_26876 ) ) ( IS-CRATE ?auto_26840 ) ( AVAILABLE ?auto_26876 ) ( SURFACE-AT ?auto_26840 ?auto_26863 ) ( ON ?auto_26840 ?auto_26854 ) ( CLEAR ?auto_26840 ) ( not ( = ?auto_26836 ?auto_26840 ) ) ( not ( = ?auto_26836 ?auto_26854 ) ) ( not ( = ?auto_26840 ?auto_26854 ) ) ( IS-CRATE ?auto_26836 ) ( not ( = ?auto_26860 ?auto_26851 ) ) ( HOIST-AT ?auto_26875 ?auto_26860 ) ( AVAILABLE ?auto_26875 ) ( SURFACE-AT ?auto_26836 ?auto_26860 ) ( ON ?auto_26836 ?auto_26858 ) ( CLEAR ?auto_26836 ) ( not ( = ?auto_26838 ?auto_26836 ) ) ( not ( = ?auto_26838 ?auto_26858 ) ) ( not ( = ?auto_26836 ?auto_26858 ) ) ( not ( = ?auto_26850 ?auto_26875 ) ) ( IS-CRATE ?auto_26838 ) ( not ( = ?auto_26878 ?auto_26851 ) ) ( HOIST-AT ?auto_26879 ?auto_26878 ) ( AVAILABLE ?auto_26879 ) ( SURFACE-AT ?auto_26838 ?auto_26878 ) ( ON ?auto_26838 ?auto_26861 ) ( CLEAR ?auto_26838 ) ( not ( = ?auto_26835 ?auto_26838 ) ) ( not ( = ?auto_26835 ?auto_26861 ) ) ( not ( = ?auto_26838 ?auto_26861 ) ) ( not ( = ?auto_26850 ?auto_26879 ) ) ( IS-CRATE ?auto_26835 ) ( AVAILABLE ?auto_26872 ) ( SURFACE-AT ?auto_26835 ?auto_26857 ) ( ON ?auto_26835 ?auto_26874 ) ( CLEAR ?auto_26835 ) ( not ( = ?auto_26834 ?auto_26835 ) ) ( not ( = ?auto_26834 ?auto_26874 ) ) ( not ( = ?auto_26835 ?auto_26874 ) ) ( IS-CRATE ?auto_26834 ) ( not ( = ?auto_26868 ?auto_26851 ) ) ( HOIST-AT ?auto_26884 ?auto_26868 ) ( AVAILABLE ?auto_26884 ) ( SURFACE-AT ?auto_26834 ?auto_26868 ) ( ON ?auto_26834 ?auto_26853 ) ( CLEAR ?auto_26834 ) ( not ( = ?auto_26833 ?auto_26834 ) ) ( not ( = ?auto_26833 ?auto_26853 ) ) ( not ( = ?auto_26834 ?auto_26853 ) ) ( not ( = ?auto_26850 ?auto_26884 ) ) ( IS-CRATE ?auto_26833 ) ( AVAILABLE ?auto_26848 ) ( SURFACE-AT ?auto_26833 ?auto_26847 ) ( ON ?auto_26833 ?auto_26873 ) ( CLEAR ?auto_26833 ) ( not ( = ?auto_26832 ?auto_26833 ) ) ( not ( = ?auto_26832 ?auto_26873 ) ) ( not ( = ?auto_26833 ?auto_26873 ) ) ( SURFACE-AT ?auto_26831 ?auto_26851 ) ( CLEAR ?auto_26831 ) ( IS-CRATE ?auto_26832 ) ( AVAILABLE ?auto_26850 ) ( not ( = ?auto_26881 ?auto_26851 ) ) ( HOIST-AT ?auto_26864 ?auto_26881 ) ( AVAILABLE ?auto_26864 ) ( SURFACE-AT ?auto_26832 ?auto_26881 ) ( ON ?auto_26832 ?auto_26856 ) ( CLEAR ?auto_26832 ) ( TRUCK-AT ?auto_26846 ?auto_26851 ) ( not ( = ?auto_26831 ?auto_26832 ) ) ( not ( = ?auto_26831 ?auto_26856 ) ) ( not ( = ?auto_26832 ?auto_26856 ) ) ( not ( = ?auto_26850 ?auto_26864 ) ) ( not ( = ?auto_26831 ?auto_26833 ) ) ( not ( = ?auto_26831 ?auto_26873 ) ) ( not ( = ?auto_26833 ?auto_26856 ) ) ( not ( = ?auto_26847 ?auto_26881 ) ) ( not ( = ?auto_26848 ?auto_26864 ) ) ( not ( = ?auto_26873 ?auto_26856 ) ) ( not ( = ?auto_26831 ?auto_26834 ) ) ( not ( = ?auto_26831 ?auto_26853 ) ) ( not ( = ?auto_26832 ?auto_26834 ) ) ( not ( = ?auto_26832 ?auto_26853 ) ) ( not ( = ?auto_26834 ?auto_26873 ) ) ( not ( = ?auto_26834 ?auto_26856 ) ) ( not ( = ?auto_26868 ?auto_26847 ) ) ( not ( = ?auto_26868 ?auto_26881 ) ) ( not ( = ?auto_26884 ?auto_26848 ) ) ( not ( = ?auto_26884 ?auto_26864 ) ) ( not ( = ?auto_26853 ?auto_26873 ) ) ( not ( = ?auto_26853 ?auto_26856 ) ) ( not ( = ?auto_26831 ?auto_26835 ) ) ( not ( = ?auto_26831 ?auto_26874 ) ) ( not ( = ?auto_26832 ?auto_26835 ) ) ( not ( = ?auto_26832 ?auto_26874 ) ) ( not ( = ?auto_26833 ?auto_26835 ) ) ( not ( = ?auto_26833 ?auto_26874 ) ) ( not ( = ?auto_26835 ?auto_26853 ) ) ( not ( = ?auto_26835 ?auto_26873 ) ) ( not ( = ?auto_26835 ?auto_26856 ) ) ( not ( = ?auto_26857 ?auto_26868 ) ) ( not ( = ?auto_26857 ?auto_26847 ) ) ( not ( = ?auto_26857 ?auto_26881 ) ) ( not ( = ?auto_26872 ?auto_26884 ) ) ( not ( = ?auto_26872 ?auto_26848 ) ) ( not ( = ?auto_26872 ?auto_26864 ) ) ( not ( = ?auto_26874 ?auto_26853 ) ) ( not ( = ?auto_26874 ?auto_26873 ) ) ( not ( = ?auto_26874 ?auto_26856 ) ) ( not ( = ?auto_26831 ?auto_26838 ) ) ( not ( = ?auto_26831 ?auto_26861 ) ) ( not ( = ?auto_26832 ?auto_26838 ) ) ( not ( = ?auto_26832 ?auto_26861 ) ) ( not ( = ?auto_26833 ?auto_26838 ) ) ( not ( = ?auto_26833 ?auto_26861 ) ) ( not ( = ?auto_26834 ?auto_26838 ) ) ( not ( = ?auto_26834 ?auto_26861 ) ) ( not ( = ?auto_26838 ?auto_26874 ) ) ( not ( = ?auto_26838 ?auto_26853 ) ) ( not ( = ?auto_26838 ?auto_26873 ) ) ( not ( = ?auto_26838 ?auto_26856 ) ) ( not ( = ?auto_26878 ?auto_26857 ) ) ( not ( = ?auto_26878 ?auto_26868 ) ) ( not ( = ?auto_26878 ?auto_26847 ) ) ( not ( = ?auto_26878 ?auto_26881 ) ) ( not ( = ?auto_26879 ?auto_26872 ) ) ( not ( = ?auto_26879 ?auto_26884 ) ) ( not ( = ?auto_26879 ?auto_26848 ) ) ( not ( = ?auto_26879 ?auto_26864 ) ) ( not ( = ?auto_26861 ?auto_26874 ) ) ( not ( = ?auto_26861 ?auto_26853 ) ) ( not ( = ?auto_26861 ?auto_26873 ) ) ( not ( = ?auto_26861 ?auto_26856 ) ) ( not ( = ?auto_26831 ?auto_26836 ) ) ( not ( = ?auto_26831 ?auto_26858 ) ) ( not ( = ?auto_26832 ?auto_26836 ) ) ( not ( = ?auto_26832 ?auto_26858 ) ) ( not ( = ?auto_26833 ?auto_26836 ) ) ( not ( = ?auto_26833 ?auto_26858 ) ) ( not ( = ?auto_26834 ?auto_26836 ) ) ( not ( = ?auto_26834 ?auto_26858 ) ) ( not ( = ?auto_26835 ?auto_26836 ) ) ( not ( = ?auto_26835 ?auto_26858 ) ) ( not ( = ?auto_26836 ?auto_26861 ) ) ( not ( = ?auto_26836 ?auto_26874 ) ) ( not ( = ?auto_26836 ?auto_26853 ) ) ( not ( = ?auto_26836 ?auto_26873 ) ) ( not ( = ?auto_26836 ?auto_26856 ) ) ( not ( = ?auto_26860 ?auto_26878 ) ) ( not ( = ?auto_26860 ?auto_26857 ) ) ( not ( = ?auto_26860 ?auto_26868 ) ) ( not ( = ?auto_26860 ?auto_26847 ) ) ( not ( = ?auto_26860 ?auto_26881 ) ) ( not ( = ?auto_26875 ?auto_26879 ) ) ( not ( = ?auto_26875 ?auto_26872 ) ) ( not ( = ?auto_26875 ?auto_26884 ) ) ( not ( = ?auto_26875 ?auto_26848 ) ) ( not ( = ?auto_26875 ?auto_26864 ) ) ( not ( = ?auto_26858 ?auto_26861 ) ) ( not ( = ?auto_26858 ?auto_26874 ) ) ( not ( = ?auto_26858 ?auto_26853 ) ) ( not ( = ?auto_26858 ?auto_26873 ) ) ( not ( = ?auto_26858 ?auto_26856 ) ) ( not ( = ?auto_26831 ?auto_26840 ) ) ( not ( = ?auto_26831 ?auto_26854 ) ) ( not ( = ?auto_26832 ?auto_26840 ) ) ( not ( = ?auto_26832 ?auto_26854 ) ) ( not ( = ?auto_26833 ?auto_26840 ) ) ( not ( = ?auto_26833 ?auto_26854 ) ) ( not ( = ?auto_26834 ?auto_26840 ) ) ( not ( = ?auto_26834 ?auto_26854 ) ) ( not ( = ?auto_26835 ?auto_26840 ) ) ( not ( = ?auto_26835 ?auto_26854 ) ) ( not ( = ?auto_26838 ?auto_26840 ) ) ( not ( = ?auto_26838 ?auto_26854 ) ) ( not ( = ?auto_26840 ?auto_26858 ) ) ( not ( = ?auto_26840 ?auto_26861 ) ) ( not ( = ?auto_26840 ?auto_26874 ) ) ( not ( = ?auto_26840 ?auto_26853 ) ) ( not ( = ?auto_26840 ?auto_26873 ) ) ( not ( = ?auto_26840 ?auto_26856 ) ) ( not ( = ?auto_26863 ?auto_26860 ) ) ( not ( = ?auto_26863 ?auto_26878 ) ) ( not ( = ?auto_26863 ?auto_26857 ) ) ( not ( = ?auto_26863 ?auto_26868 ) ) ( not ( = ?auto_26863 ?auto_26847 ) ) ( not ( = ?auto_26863 ?auto_26881 ) ) ( not ( = ?auto_26876 ?auto_26875 ) ) ( not ( = ?auto_26876 ?auto_26879 ) ) ( not ( = ?auto_26876 ?auto_26872 ) ) ( not ( = ?auto_26876 ?auto_26884 ) ) ( not ( = ?auto_26876 ?auto_26848 ) ) ( not ( = ?auto_26876 ?auto_26864 ) ) ( not ( = ?auto_26854 ?auto_26858 ) ) ( not ( = ?auto_26854 ?auto_26861 ) ) ( not ( = ?auto_26854 ?auto_26874 ) ) ( not ( = ?auto_26854 ?auto_26853 ) ) ( not ( = ?auto_26854 ?auto_26873 ) ) ( not ( = ?auto_26854 ?auto_26856 ) ) ( not ( = ?auto_26831 ?auto_26839 ) ) ( not ( = ?auto_26831 ?auto_26852 ) ) ( not ( = ?auto_26832 ?auto_26839 ) ) ( not ( = ?auto_26832 ?auto_26852 ) ) ( not ( = ?auto_26833 ?auto_26839 ) ) ( not ( = ?auto_26833 ?auto_26852 ) ) ( not ( = ?auto_26834 ?auto_26839 ) ) ( not ( = ?auto_26834 ?auto_26852 ) ) ( not ( = ?auto_26835 ?auto_26839 ) ) ( not ( = ?auto_26835 ?auto_26852 ) ) ( not ( = ?auto_26838 ?auto_26839 ) ) ( not ( = ?auto_26838 ?auto_26852 ) ) ( not ( = ?auto_26836 ?auto_26839 ) ) ( not ( = ?auto_26836 ?auto_26852 ) ) ( not ( = ?auto_26839 ?auto_26854 ) ) ( not ( = ?auto_26839 ?auto_26858 ) ) ( not ( = ?auto_26839 ?auto_26861 ) ) ( not ( = ?auto_26839 ?auto_26874 ) ) ( not ( = ?auto_26839 ?auto_26853 ) ) ( not ( = ?auto_26839 ?auto_26873 ) ) ( not ( = ?auto_26839 ?auto_26856 ) ) ( not ( = ?auto_26852 ?auto_26854 ) ) ( not ( = ?auto_26852 ?auto_26858 ) ) ( not ( = ?auto_26852 ?auto_26861 ) ) ( not ( = ?auto_26852 ?auto_26874 ) ) ( not ( = ?auto_26852 ?auto_26853 ) ) ( not ( = ?auto_26852 ?auto_26873 ) ) ( not ( = ?auto_26852 ?auto_26856 ) ) ( not ( = ?auto_26831 ?auto_26837 ) ) ( not ( = ?auto_26831 ?auto_26862 ) ) ( not ( = ?auto_26832 ?auto_26837 ) ) ( not ( = ?auto_26832 ?auto_26862 ) ) ( not ( = ?auto_26833 ?auto_26837 ) ) ( not ( = ?auto_26833 ?auto_26862 ) ) ( not ( = ?auto_26834 ?auto_26837 ) ) ( not ( = ?auto_26834 ?auto_26862 ) ) ( not ( = ?auto_26835 ?auto_26837 ) ) ( not ( = ?auto_26835 ?auto_26862 ) ) ( not ( = ?auto_26838 ?auto_26837 ) ) ( not ( = ?auto_26838 ?auto_26862 ) ) ( not ( = ?auto_26836 ?auto_26837 ) ) ( not ( = ?auto_26836 ?auto_26862 ) ) ( not ( = ?auto_26840 ?auto_26837 ) ) ( not ( = ?auto_26840 ?auto_26862 ) ) ( not ( = ?auto_26837 ?auto_26852 ) ) ( not ( = ?auto_26837 ?auto_26854 ) ) ( not ( = ?auto_26837 ?auto_26858 ) ) ( not ( = ?auto_26837 ?auto_26861 ) ) ( not ( = ?auto_26837 ?auto_26874 ) ) ( not ( = ?auto_26837 ?auto_26853 ) ) ( not ( = ?auto_26837 ?auto_26873 ) ) ( not ( = ?auto_26837 ?auto_26856 ) ) ( not ( = ?auto_26862 ?auto_26852 ) ) ( not ( = ?auto_26862 ?auto_26854 ) ) ( not ( = ?auto_26862 ?auto_26858 ) ) ( not ( = ?auto_26862 ?auto_26861 ) ) ( not ( = ?auto_26862 ?auto_26874 ) ) ( not ( = ?auto_26862 ?auto_26853 ) ) ( not ( = ?auto_26862 ?auto_26873 ) ) ( not ( = ?auto_26862 ?auto_26856 ) ) ( not ( = ?auto_26831 ?auto_26842 ) ) ( not ( = ?auto_26831 ?auto_26877 ) ) ( not ( = ?auto_26832 ?auto_26842 ) ) ( not ( = ?auto_26832 ?auto_26877 ) ) ( not ( = ?auto_26833 ?auto_26842 ) ) ( not ( = ?auto_26833 ?auto_26877 ) ) ( not ( = ?auto_26834 ?auto_26842 ) ) ( not ( = ?auto_26834 ?auto_26877 ) ) ( not ( = ?auto_26835 ?auto_26842 ) ) ( not ( = ?auto_26835 ?auto_26877 ) ) ( not ( = ?auto_26838 ?auto_26842 ) ) ( not ( = ?auto_26838 ?auto_26877 ) ) ( not ( = ?auto_26836 ?auto_26842 ) ) ( not ( = ?auto_26836 ?auto_26877 ) ) ( not ( = ?auto_26840 ?auto_26842 ) ) ( not ( = ?auto_26840 ?auto_26877 ) ) ( not ( = ?auto_26839 ?auto_26842 ) ) ( not ( = ?auto_26839 ?auto_26877 ) ) ( not ( = ?auto_26842 ?auto_26862 ) ) ( not ( = ?auto_26842 ?auto_26852 ) ) ( not ( = ?auto_26842 ?auto_26854 ) ) ( not ( = ?auto_26842 ?auto_26858 ) ) ( not ( = ?auto_26842 ?auto_26861 ) ) ( not ( = ?auto_26842 ?auto_26874 ) ) ( not ( = ?auto_26842 ?auto_26853 ) ) ( not ( = ?auto_26842 ?auto_26873 ) ) ( not ( = ?auto_26842 ?auto_26856 ) ) ( not ( = ?auto_26855 ?auto_26857 ) ) ( not ( = ?auto_26855 ?auto_26863 ) ) ( not ( = ?auto_26855 ?auto_26860 ) ) ( not ( = ?auto_26855 ?auto_26878 ) ) ( not ( = ?auto_26855 ?auto_26868 ) ) ( not ( = ?auto_26855 ?auto_26847 ) ) ( not ( = ?auto_26855 ?auto_26881 ) ) ( not ( = ?auto_26882 ?auto_26872 ) ) ( not ( = ?auto_26882 ?auto_26876 ) ) ( not ( = ?auto_26882 ?auto_26875 ) ) ( not ( = ?auto_26882 ?auto_26879 ) ) ( not ( = ?auto_26882 ?auto_26884 ) ) ( not ( = ?auto_26882 ?auto_26848 ) ) ( not ( = ?auto_26882 ?auto_26864 ) ) ( not ( = ?auto_26877 ?auto_26862 ) ) ( not ( = ?auto_26877 ?auto_26852 ) ) ( not ( = ?auto_26877 ?auto_26854 ) ) ( not ( = ?auto_26877 ?auto_26858 ) ) ( not ( = ?auto_26877 ?auto_26861 ) ) ( not ( = ?auto_26877 ?auto_26874 ) ) ( not ( = ?auto_26877 ?auto_26853 ) ) ( not ( = ?auto_26877 ?auto_26873 ) ) ( not ( = ?auto_26877 ?auto_26856 ) ) ( not ( = ?auto_26831 ?auto_26841 ) ) ( not ( = ?auto_26831 ?auto_26859 ) ) ( not ( = ?auto_26832 ?auto_26841 ) ) ( not ( = ?auto_26832 ?auto_26859 ) ) ( not ( = ?auto_26833 ?auto_26841 ) ) ( not ( = ?auto_26833 ?auto_26859 ) ) ( not ( = ?auto_26834 ?auto_26841 ) ) ( not ( = ?auto_26834 ?auto_26859 ) ) ( not ( = ?auto_26835 ?auto_26841 ) ) ( not ( = ?auto_26835 ?auto_26859 ) ) ( not ( = ?auto_26838 ?auto_26841 ) ) ( not ( = ?auto_26838 ?auto_26859 ) ) ( not ( = ?auto_26836 ?auto_26841 ) ) ( not ( = ?auto_26836 ?auto_26859 ) ) ( not ( = ?auto_26840 ?auto_26841 ) ) ( not ( = ?auto_26840 ?auto_26859 ) ) ( not ( = ?auto_26839 ?auto_26841 ) ) ( not ( = ?auto_26839 ?auto_26859 ) ) ( not ( = ?auto_26837 ?auto_26841 ) ) ( not ( = ?auto_26837 ?auto_26859 ) ) ( not ( = ?auto_26841 ?auto_26877 ) ) ( not ( = ?auto_26841 ?auto_26862 ) ) ( not ( = ?auto_26841 ?auto_26852 ) ) ( not ( = ?auto_26841 ?auto_26854 ) ) ( not ( = ?auto_26841 ?auto_26858 ) ) ( not ( = ?auto_26841 ?auto_26861 ) ) ( not ( = ?auto_26841 ?auto_26874 ) ) ( not ( = ?auto_26841 ?auto_26853 ) ) ( not ( = ?auto_26841 ?auto_26873 ) ) ( not ( = ?auto_26841 ?auto_26856 ) ) ( not ( = ?auto_26865 ?auto_26855 ) ) ( not ( = ?auto_26865 ?auto_26857 ) ) ( not ( = ?auto_26865 ?auto_26863 ) ) ( not ( = ?auto_26865 ?auto_26860 ) ) ( not ( = ?auto_26865 ?auto_26878 ) ) ( not ( = ?auto_26865 ?auto_26868 ) ) ( not ( = ?auto_26865 ?auto_26847 ) ) ( not ( = ?auto_26865 ?auto_26881 ) ) ( not ( = ?auto_26883 ?auto_26882 ) ) ( not ( = ?auto_26883 ?auto_26872 ) ) ( not ( = ?auto_26883 ?auto_26876 ) ) ( not ( = ?auto_26883 ?auto_26875 ) ) ( not ( = ?auto_26883 ?auto_26879 ) ) ( not ( = ?auto_26883 ?auto_26884 ) ) ( not ( = ?auto_26883 ?auto_26848 ) ) ( not ( = ?auto_26883 ?auto_26864 ) ) ( not ( = ?auto_26859 ?auto_26877 ) ) ( not ( = ?auto_26859 ?auto_26862 ) ) ( not ( = ?auto_26859 ?auto_26852 ) ) ( not ( = ?auto_26859 ?auto_26854 ) ) ( not ( = ?auto_26859 ?auto_26858 ) ) ( not ( = ?auto_26859 ?auto_26861 ) ) ( not ( = ?auto_26859 ?auto_26874 ) ) ( not ( = ?auto_26859 ?auto_26853 ) ) ( not ( = ?auto_26859 ?auto_26873 ) ) ( not ( = ?auto_26859 ?auto_26856 ) ) ( not ( = ?auto_26831 ?auto_26843 ) ) ( not ( = ?auto_26831 ?auto_26870 ) ) ( not ( = ?auto_26832 ?auto_26843 ) ) ( not ( = ?auto_26832 ?auto_26870 ) ) ( not ( = ?auto_26833 ?auto_26843 ) ) ( not ( = ?auto_26833 ?auto_26870 ) ) ( not ( = ?auto_26834 ?auto_26843 ) ) ( not ( = ?auto_26834 ?auto_26870 ) ) ( not ( = ?auto_26835 ?auto_26843 ) ) ( not ( = ?auto_26835 ?auto_26870 ) ) ( not ( = ?auto_26838 ?auto_26843 ) ) ( not ( = ?auto_26838 ?auto_26870 ) ) ( not ( = ?auto_26836 ?auto_26843 ) ) ( not ( = ?auto_26836 ?auto_26870 ) ) ( not ( = ?auto_26840 ?auto_26843 ) ) ( not ( = ?auto_26840 ?auto_26870 ) ) ( not ( = ?auto_26839 ?auto_26843 ) ) ( not ( = ?auto_26839 ?auto_26870 ) ) ( not ( = ?auto_26837 ?auto_26843 ) ) ( not ( = ?auto_26837 ?auto_26870 ) ) ( not ( = ?auto_26842 ?auto_26843 ) ) ( not ( = ?auto_26842 ?auto_26870 ) ) ( not ( = ?auto_26843 ?auto_26859 ) ) ( not ( = ?auto_26843 ?auto_26877 ) ) ( not ( = ?auto_26843 ?auto_26862 ) ) ( not ( = ?auto_26843 ?auto_26852 ) ) ( not ( = ?auto_26843 ?auto_26854 ) ) ( not ( = ?auto_26843 ?auto_26858 ) ) ( not ( = ?auto_26843 ?auto_26861 ) ) ( not ( = ?auto_26843 ?auto_26874 ) ) ( not ( = ?auto_26843 ?auto_26853 ) ) ( not ( = ?auto_26843 ?auto_26873 ) ) ( not ( = ?auto_26843 ?auto_26856 ) ) ( not ( = ?auto_26867 ?auto_26865 ) ) ( not ( = ?auto_26867 ?auto_26855 ) ) ( not ( = ?auto_26867 ?auto_26857 ) ) ( not ( = ?auto_26867 ?auto_26863 ) ) ( not ( = ?auto_26867 ?auto_26860 ) ) ( not ( = ?auto_26867 ?auto_26878 ) ) ( not ( = ?auto_26867 ?auto_26868 ) ) ( not ( = ?auto_26867 ?auto_26847 ) ) ( not ( = ?auto_26867 ?auto_26881 ) ) ( not ( = ?auto_26871 ?auto_26883 ) ) ( not ( = ?auto_26871 ?auto_26882 ) ) ( not ( = ?auto_26871 ?auto_26872 ) ) ( not ( = ?auto_26871 ?auto_26876 ) ) ( not ( = ?auto_26871 ?auto_26875 ) ) ( not ( = ?auto_26871 ?auto_26879 ) ) ( not ( = ?auto_26871 ?auto_26884 ) ) ( not ( = ?auto_26871 ?auto_26848 ) ) ( not ( = ?auto_26871 ?auto_26864 ) ) ( not ( = ?auto_26870 ?auto_26859 ) ) ( not ( = ?auto_26870 ?auto_26877 ) ) ( not ( = ?auto_26870 ?auto_26862 ) ) ( not ( = ?auto_26870 ?auto_26852 ) ) ( not ( = ?auto_26870 ?auto_26854 ) ) ( not ( = ?auto_26870 ?auto_26858 ) ) ( not ( = ?auto_26870 ?auto_26861 ) ) ( not ( = ?auto_26870 ?auto_26874 ) ) ( not ( = ?auto_26870 ?auto_26853 ) ) ( not ( = ?auto_26870 ?auto_26873 ) ) ( not ( = ?auto_26870 ?auto_26856 ) ) ( not ( = ?auto_26831 ?auto_26844 ) ) ( not ( = ?auto_26831 ?auto_26880 ) ) ( not ( = ?auto_26832 ?auto_26844 ) ) ( not ( = ?auto_26832 ?auto_26880 ) ) ( not ( = ?auto_26833 ?auto_26844 ) ) ( not ( = ?auto_26833 ?auto_26880 ) ) ( not ( = ?auto_26834 ?auto_26844 ) ) ( not ( = ?auto_26834 ?auto_26880 ) ) ( not ( = ?auto_26835 ?auto_26844 ) ) ( not ( = ?auto_26835 ?auto_26880 ) ) ( not ( = ?auto_26838 ?auto_26844 ) ) ( not ( = ?auto_26838 ?auto_26880 ) ) ( not ( = ?auto_26836 ?auto_26844 ) ) ( not ( = ?auto_26836 ?auto_26880 ) ) ( not ( = ?auto_26840 ?auto_26844 ) ) ( not ( = ?auto_26840 ?auto_26880 ) ) ( not ( = ?auto_26839 ?auto_26844 ) ) ( not ( = ?auto_26839 ?auto_26880 ) ) ( not ( = ?auto_26837 ?auto_26844 ) ) ( not ( = ?auto_26837 ?auto_26880 ) ) ( not ( = ?auto_26842 ?auto_26844 ) ) ( not ( = ?auto_26842 ?auto_26880 ) ) ( not ( = ?auto_26841 ?auto_26844 ) ) ( not ( = ?auto_26841 ?auto_26880 ) ) ( not ( = ?auto_26844 ?auto_26870 ) ) ( not ( = ?auto_26844 ?auto_26859 ) ) ( not ( = ?auto_26844 ?auto_26877 ) ) ( not ( = ?auto_26844 ?auto_26862 ) ) ( not ( = ?auto_26844 ?auto_26852 ) ) ( not ( = ?auto_26844 ?auto_26854 ) ) ( not ( = ?auto_26844 ?auto_26858 ) ) ( not ( = ?auto_26844 ?auto_26861 ) ) ( not ( = ?auto_26844 ?auto_26874 ) ) ( not ( = ?auto_26844 ?auto_26853 ) ) ( not ( = ?auto_26844 ?auto_26873 ) ) ( not ( = ?auto_26844 ?auto_26856 ) ) ( not ( = ?auto_26866 ?auto_26867 ) ) ( not ( = ?auto_26866 ?auto_26865 ) ) ( not ( = ?auto_26866 ?auto_26855 ) ) ( not ( = ?auto_26866 ?auto_26857 ) ) ( not ( = ?auto_26866 ?auto_26863 ) ) ( not ( = ?auto_26866 ?auto_26860 ) ) ( not ( = ?auto_26866 ?auto_26878 ) ) ( not ( = ?auto_26866 ?auto_26868 ) ) ( not ( = ?auto_26866 ?auto_26847 ) ) ( not ( = ?auto_26866 ?auto_26881 ) ) ( not ( = ?auto_26869 ?auto_26871 ) ) ( not ( = ?auto_26869 ?auto_26883 ) ) ( not ( = ?auto_26869 ?auto_26882 ) ) ( not ( = ?auto_26869 ?auto_26872 ) ) ( not ( = ?auto_26869 ?auto_26876 ) ) ( not ( = ?auto_26869 ?auto_26875 ) ) ( not ( = ?auto_26869 ?auto_26879 ) ) ( not ( = ?auto_26869 ?auto_26884 ) ) ( not ( = ?auto_26869 ?auto_26848 ) ) ( not ( = ?auto_26869 ?auto_26864 ) ) ( not ( = ?auto_26880 ?auto_26870 ) ) ( not ( = ?auto_26880 ?auto_26859 ) ) ( not ( = ?auto_26880 ?auto_26877 ) ) ( not ( = ?auto_26880 ?auto_26862 ) ) ( not ( = ?auto_26880 ?auto_26852 ) ) ( not ( = ?auto_26880 ?auto_26854 ) ) ( not ( = ?auto_26880 ?auto_26858 ) ) ( not ( = ?auto_26880 ?auto_26861 ) ) ( not ( = ?auto_26880 ?auto_26874 ) ) ( not ( = ?auto_26880 ?auto_26853 ) ) ( not ( = ?auto_26880 ?auto_26873 ) ) ( not ( = ?auto_26880 ?auto_26856 ) ) ( not ( = ?auto_26831 ?auto_26845 ) ) ( not ( = ?auto_26831 ?auto_26849 ) ) ( not ( = ?auto_26832 ?auto_26845 ) ) ( not ( = ?auto_26832 ?auto_26849 ) ) ( not ( = ?auto_26833 ?auto_26845 ) ) ( not ( = ?auto_26833 ?auto_26849 ) ) ( not ( = ?auto_26834 ?auto_26845 ) ) ( not ( = ?auto_26834 ?auto_26849 ) ) ( not ( = ?auto_26835 ?auto_26845 ) ) ( not ( = ?auto_26835 ?auto_26849 ) ) ( not ( = ?auto_26838 ?auto_26845 ) ) ( not ( = ?auto_26838 ?auto_26849 ) ) ( not ( = ?auto_26836 ?auto_26845 ) ) ( not ( = ?auto_26836 ?auto_26849 ) ) ( not ( = ?auto_26840 ?auto_26845 ) ) ( not ( = ?auto_26840 ?auto_26849 ) ) ( not ( = ?auto_26839 ?auto_26845 ) ) ( not ( = ?auto_26839 ?auto_26849 ) ) ( not ( = ?auto_26837 ?auto_26845 ) ) ( not ( = ?auto_26837 ?auto_26849 ) ) ( not ( = ?auto_26842 ?auto_26845 ) ) ( not ( = ?auto_26842 ?auto_26849 ) ) ( not ( = ?auto_26841 ?auto_26845 ) ) ( not ( = ?auto_26841 ?auto_26849 ) ) ( not ( = ?auto_26843 ?auto_26845 ) ) ( not ( = ?auto_26843 ?auto_26849 ) ) ( not ( = ?auto_26845 ?auto_26880 ) ) ( not ( = ?auto_26845 ?auto_26870 ) ) ( not ( = ?auto_26845 ?auto_26859 ) ) ( not ( = ?auto_26845 ?auto_26877 ) ) ( not ( = ?auto_26845 ?auto_26862 ) ) ( not ( = ?auto_26845 ?auto_26852 ) ) ( not ( = ?auto_26845 ?auto_26854 ) ) ( not ( = ?auto_26845 ?auto_26858 ) ) ( not ( = ?auto_26845 ?auto_26861 ) ) ( not ( = ?auto_26845 ?auto_26874 ) ) ( not ( = ?auto_26845 ?auto_26853 ) ) ( not ( = ?auto_26845 ?auto_26873 ) ) ( not ( = ?auto_26845 ?auto_26856 ) ) ( not ( = ?auto_26849 ?auto_26880 ) ) ( not ( = ?auto_26849 ?auto_26870 ) ) ( not ( = ?auto_26849 ?auto_26859 ) ) ( not ( = ?auto_26849 ?auto_26877 ) ) ( not ( = ?auto_26849 ?auto_26862 ) ) ( not ( = ?auto_26849 ?auto_26852 ) ) ( not ( = ?auto_26849 ?auto_26854 ) ) ( not ( = ?auto_26849 ?auto_26858 ) ) ( not ( = ?auto_26849 ?auto_26861 ) ) ( not ( = ?auto_26849 ?auto_26874 ) ) ( not ( = ?auto_26849 ?auto_26853 ) ) ( not ( = ?auto_26849 ?auto_26873 ) ) ( not ( = ?auto_26849 ?auto_26856 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_26831 ?auto_26832 ?auto_26833 ?auto_26834 ?auto_26835 ?auto_26838 ?auto_26836 ?auto_26840 ?auto_26839 ?auto_26837 ?auto_26842 ?auto_26841 ?auto_26843 ?auto_26844 )
      ( MAKE-1CRATE ?auto_26844 ?auto_26845 )
      ( MAKE-14CRATE-VERIFY ?auto_26831 ?auto_26832 ?auto_26833 ?auto_26834 ?auto_26835 ?auto_26838 ?auto_26836 ?auto_26840 ?auto_26839 ?auto_26837 ?auto_26842 ?auto_26841 ?auto_26843 ?auto_26844 ?auto_26845 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26887 - SURFACE
      ?auto_26888 - SURFACE
    )
    :vars
    (
      ?auto_26889 - HOIST
      ?auto_26890 - PLACE
      ?auto_26892 - PLACE
      ?auto_26893 - HOIST
      ?auto_26894 - SURFACE
      ?auto_26891 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26889 ?auto_26890 ) ( SURFACE-AT ?auto_26887 ?auto_26890 ) ( CLEAR ?auto_26887 ) ( IS-CRATE ?auto_26888 ) ( AVAILABLE ?auto_26889 ) ( not ( = ?auto_26892 ?auto_26890 ) ) ( HOIST-AT ?auto_26893 ?auto_26892 ) ( AVAILABLE ?auto_26893 ) ( SURFACE-AT ?auto_26888 ?auto_26892 ) ( ON ?auto_26888 ?auto_26894 ) ( CLEAR ?auto_26888 ) ( TRUCK-AT ?auto_26891 ?auto_26890 ) ( not ( = ?auto_26887 ?auto_26888 ) ) ( not ( = ?auto_26887 ?auto_26894 ) ) ( not ( = ?auto_26888 ?auto_26894 ) ) ( not ( = ?auto_26889 ?auto_26893 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26891 ?auto_26890 ?auto_26892 )
      ( !LIFT ?auto_26893 ?auto_26888 ?auto_26894 ?auto_26892 )
      ( !LOAD ?auto_26893 ?auto_26888 ?auto_26891 ?auto_26892 )
      ( !DRIVE ?auto_26891 ?auto_26892 ?auto_26890 )
      ( !UNLOAD ?auto_26889 ?auto_26888 ?auto_26891 ?auto_26890 )
      ( !DROP ?auto_26889 ?auto_26888 ?auto_26887 ?auto_26890 )
      ( MAKE-1CRATE-VERIFY ?auto_26887 ?auto_26888 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_26911 - SURFACE
      ?auto_26912 - SURFACE
      ?auto_26913 - SURFACE
      ?auto_26914 - SURFACE
      ?auto_26915 - SURFACE
      ?auto_26918 - SURFACE
      ?auto_26916 - SURFACE
      ?auto_26920 - SURFACE
      ?auto_26919 - SURFACE
      ?auto_26917 - SURFACE
      ?auto_26922 - SURFACE
      ?auto_26921 - SURFACE
      ?auto_26923 - SURFACE
      ?auto_26925 - SURFACE
      ?auto_26926 - SURFACE
      ?auto_26924 - SURFACE
    )
    :vars
    (
      ?auto_26930 - HOIST
      ?auto_26927 - PLACE
      ?auto_26931 - PLACE
      ?auto_26929 - HOIST
      ?auto_26932 - SURFACE
      ?auto_26951 - PLACE
      ?auto_26938 - HOIST
      ?auto_26963 - SURFACE
      ?auto_26956 - PLACE
      ?auto_26962 - HOIST
      ?auto_26953 - SURFACE
      ?auto_26960 - PLACE
      ?auto_26945 - HOIST
      ?auto_26943 - SURFACE
      ?auto_26966 - PLACE
      ?auto_26935 - HOIST
      ?auto_26944 - SURFACE
      ?auto_26955 - PLACE
      ?auto_26948 - HOIST
      ?auto_26933 - SURFACE
      ?auto_26965 - SURFACE
      ?auto_26954 - PLACE
      ?auto_26937 - HOIST
      ?auto_26939 - SURFACE
      ?auto_26958 - SURFACE
      ?auto_26941 - PLACE
      ?auto_26934 - HOIST
      ?auto_26940 - SURFACE
      ?auto_26959 - PLACE
      ?auto_26952 - HOIST
      ?auto_26942 - SURFACE
      ?auto_26949 - SURFACE
      ?auto_26936 - PLACE
      ?auto_26961 - HOIST
      ?auto_26957 - SURFACE
      ?auto_26946 - SURFACE
      ?auto_26950 - PLACE
      ?auto_26964 - HOIST
      ?auto_26947 - SURFACE
      ?auto_26928 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26930 ?auto_26927 ) ( IS-CRATE ?auto_26924 ) ( not ( = ?auto_26931 ?auto_26927 ) ) ( HOIST-AT ?auto_26929 ?auto_26931 ) ( SURFACE-AT ?auto_26924 ?auto_26931 ) ( ON ?auto_26924 ?auto_26932 ) ( CLEAR ?auto_26924 ) ( not ( = ?auto_26926 ?auto_26924 ) ) ( not ( = ?auto_26926 ?auto_26932 ) ) ( not ( = ?auto_26924 ?auto_26932 ) ) ( not ( = ?auto_26930 ?auto_26929 ) ) ( IS-CRATE ?auto_26926 ) ( not ( = ?auto_26951 ?auto_26927 ) ) ( HOIST-AT ?auto_26938 ?auto_26951 ) ( SURFACE-AT ?auto_26926 ?auto_26951 ) ( ON ?auto_26926 ?auto_26963 ) ( CLEAR ?auto_26926 ) ( not ( = ?auto_26925 ?auto_26926 ) ) ( not ( = ?auto_26925 ?auto_26963 ) ) ( not ( = ?auto_26926 ?auto_26963 ) ) ( not ( = ?auto_26930 ?auto_26938 ) ) ( IS-CRATE ?auto_26925 ) ( not ( = ?auto_26956 ?auto_26927 ) ) ( HOIST-AT ?auto_26962 ?auto_26956 ) ( AVAILABLE ?auto_26962 ) ( SURFACE-AT ?auto_26925 ?auto_26956 ) ( ON ?auto_26925 ?auto_26953 ) ( CLEAR ?auto_26925 ) ( not ( = ?auto_26923 ?auto_26925 ) ) ( not ( = ?auto_26923 ?auto_26953 ) ) ( not ( = ?auto_26925 ?auto_26953 ) ) ( not ( = ?auto_26930 ?auto_26962 ) ) ( IS-CRATE ?auto_26923 ) ( not ( = ?auto_26960 ?auto_26927 ) ) ( HOIST-AT ?auto_26945 ?auto_26960 ) ( AVAILABLE ?auto_26945 ) ( SURFACE-AT ?auto_26923 ?auto_26960 ) ( ON ?auto_26923 ?auto_26943 ) ( CLEAR ?auto_26923 ) ( not ( = ?auto_26921 ?auto_26923 ) ) ( not ( = ?auto_26921 ?auto_26943 ) ) ( not ( = ?auto_26923 ?auto_26943 ) ) ( not ( = ?auto_26930 ?auto_26945 ) ) ( IS-CRATE ?auto_26921 ) ( not ( = ?auto_26966 ?auto_26927 ) ) ( HOIST-AT ?auto_26935 ?auto_26966 ) ( AVAILABLE ?auto_26935 ) ( SURFACE-AT ?auto_26921 ?auto_26966 ) ( ON ?auto_26921 ?auto_26944 ) ( CLEAR ?auto_26921 ) ( not ( = ?auto_26922 ?auto_26921 ) ) ( not ( = ?auto_26922 ?auto_26944 ) ) ( not ( = ?auto_26921 ?auto_26944 ) ) ( not ( = ?auto_26930 ?auto_26935 ) ) ( IS-CRATE ?auto_26922 ) ( not ( = ?auto_26955 ?auto_26927 ) ) ( HOIST-AT ?auto_26948 ?auto_26955 ) ( AVAILABLE ?auto_26948 ) ( SURFACE-AT ?auto_26922 ?auto_26955 ) ( ON ?auto_26922 ?auto_26933 ) ( CLEAR ?auto_26922 ) ( not ( = ?auto_26917 ?auto_26922 ) ) ( not ( = ?auto_26917 ?auto_26933 ) ) ( not ( = ?auto_26922 ?auto_26933 ) ) ( not ( = ?auto_26930 ?auto_26948 ) ) ( IS-CRATE ?auto_26917 ) ( SURFACE-AT ?auto_26917 ?auto_26931 ) ( ON ?auto_26917 ?auto_26965 ) ( CLEAR ?auto_26917 ) ( not ( = ?auto_26919 ?auto_26917 ) ) ( not ( = ?auto_26919 ?auto_26965 ) ) ( not ( = ?auto_26917 ?auto_26965 ) ) ( IS-CRATE ?auto_26919 ) ( not ( = ?auto_26954 ?auto_26927 ) ) ( HOIST-AT ?auto_26937 ?auto_26954 ) ( SURFACE-AT ?auto_26919 ?auto_26954 ) ( ON ?auto_26919 ?auto_26939 ) ( CLEAR ?auto_26919 ) ( not ( = ?auto_26920 ?auto_26919 ) ) ( not ( = ?auto_26920 ?auto_26939 ) ) ( not ( = ?auto_26919 ?auto_26939 ) ) ( not ( = ?auto_26930 ?auto_26937 ) ) ( IS-CRATE ?auto_26920 ) ( AVAILABLE ?auto_26937 ) ( SURFACE-AT ?auto_26920 ?auto_26954 ) ( ON ?auto_26920 ?auto_26958 ) ( CLEAR ?auto_26920 ) ( not ( = ?auto_26916 ?auto_26920 ) ) ( not ( = ?auto_26916 ?auto_26958 ) ) ( not ( = ?auto_26920 ?auto_26958 ) ) ( IS-CRATE ?auto_26916 ) ( not ( = ?auto_26941 ?auto_26927 ) ) ( HOIST-AT ?auto_26934 ?auto_26941 ) ( AVAILABLE ?auto_26934 ) ( SURFACE-AT ?auto_26916 ?auto_26941 ) ( ON ?auto_26916 ?auto_26940 ) ( CLEAR ?auto_26916 ) ( not ( = ?auto_26918 ?auto_26916 ) ) ( not ( = ?auto_26918 ?auto_26940 ) ) ( not ( = ?auto_26916 ?auto_26940 ) ) ( not ( = ?auto_26930 ?auto_26934 ) ) ( IS-CRATE ?auto_26918 ) ( not ( = ?auto_26959 ?auto_26927 ) ) ( HOIST-AT ?auto_26952 ?auto_26959 ) ( AVAILABLE ?auto_26952 ) ( SURFACE-AT ?auto_26918 ?auto_26959 ) ( ON ?auto_26918 ?auto_26942 ) ( CLEAR ?auto_26918 ) ( not ( = ?auto_26915 ?auto_26918 ) ) ( not ( = ?auto_26915 ?auto_26942 ) ) ( not ( = ?auto_26918 ?auto_26942 ) ) ( not ( = ?auto_26930 ?auto_26952 ) ) ( IS-CRATE ?auto_26915 ) ( AVAILABLE ?auto_26929 ) ( SURFACE-AT ?auto_26915 ?auto_26931 ) ( ON ?auto_26915 ?auto_26949 ) ( CLEAR ?auto_26915 ) ( not ( = ?auto_26914 ?auto_26915 ) ) ( not ( = ?auto_26914 ?auto_26949 ) ) ( not ( = ?auto_26915 ?auto_26949 ) ) ( IS-CRATE ?auto_26914 ) ( not ( = ?auto_26936 ?auto_26927 ) ) ( HOIST-AT ?auto_26961 ?auto_26936 ) ( AVAILABLE ?auto_26961 ) ( SURFACE-AT ?auto_26914 ?auto_26936 ) ( ON ?auto_26914 ?auto_26957 ) ( CLEAR ?auto_26914 ) ( not ( = ?auto_26913 ?auto_26914 ) ) ( not ( = ?auto_26913 ?auto_26957 ) ) ( not ( = ?auto_26914 ?auto_26957 ) ) ( not ( = ?auto_26930 ?auto_26961 ) ) ( IS-CRATE ?auto_26913 ) ( AVAILABLE ?auto_26938 ) ( SURFACE-AT ?auto_26913 ?auto_26951 ) ( ON ?auto_26913 ?auto_26946 ) ( CLEAR ?auto_26913 ) ( not ( = ?auto_26912 ?auto_26913 ) ) ( not ( = ?auto_26912 ?auto_26946 ) ) ( not ( = ?auto_26913 ?auto_26946 ) ) ( SURFACE-AT ?auto_26911 ?auto_26927 ) ( CLEAR ?auto_26911 ) ( IS-CRATE ?auto_26912 ) ( AVAILABLE ?auto_26930 ) ( not ( = ?auto_26950 ?auto_26927 ) ) ( HOIST-AT ?auto_26964 ?auto_26950 ) ( AVAILABLE ?auto_26964 ) ( SURFACE-AT ?auto_26912 ?auto_26950 ) ( ON ?auto_26912 ?auto_26947 ) ( CLEAR ?auto_26912 ) ( TRUCK-AT ?auto_26928 ?auto_26927 ) ( not ( = ?auto_26911 ?auto_26912 ) ) ( not ( = ?auto_26911 ?auto_26947 ) ) ( not ( = ?auto_26912 ?auto_26947 ) ) ( not ( = ?auto_26930 ?auto_26964 ) ) ( not ( = ?auto_26911 ?auto_26913 ) ) ( not ( = ?auto_26911 ?auto_26946 ) ) ( not ( = ?auto_26913 ?auto_26947 ) ) ( not ( = ?auto_26951 ?auto_26950 ) ) ( not ( = ?auto_26938 ?auto_26964 ) ) ( not ( = ?auto_26946 ?auto_26947 ) ) ( not ( = ?auto_26911 ?auto_26914 ) ) ( not ( = ?auto_26911 ?auto_26957 ) ) ( not ( = ?auto_26912 ?auto_26914 ) ) ( not ( = ?auto_26912 ?auto_26957 ) ) ( not ( = ?auto_26914 ?auto_26946 ) ) ( not ( = ?auto_26914 ?auto_26947 ) ) ( not ( = ?auto_26936 ?auto_26951 ) ) ( not ( = ?auto_26936 ?auto_26950 ) ) ( not ( = ?auto_26961 ?auto_26938 ) ) ( not ( = ?auto_26961 ?auto_26964 ) ) ( not ( = ?auto_26957 ?auto_26946 ) ) ( not ( = ?auto_26957 ?auto_26947 ) ) ( not ( = ?auto_26911 ?auto_26915 ) ) ( not ( = ?auto_26911 ?auto_26949 ) ) ( not ( = ?auto_26912 ?auto_26915 ) ) ( not ( = ?auto_26912 ?auto_26949 ) ) ( not ( = ?auto_26913 ?auto_26915 ) ) ( not ( = ?auto_26913 ?auto_26949 ) ) ( not ( = ?auto_26915 ?auto_26957 ) ) ( not ( = ?auto_26915 ?auto_26946 ) ) ( not ( = ?auto_26915 ?auto_26947 ) ) ( not ( = ?auto_26931 ?auto_26936 ) ) ( not ( = ?auto_26931 ?auto_26951 ) ) ( not ( = ?auto_26931 ?auto_26950 ) ) ( not ( = ?auto_26929 ?auto_26961 ) ) ( not ( = ?auto_26929 ?auto_26938 ) ) ( not ( = ?auto_26929 ?auto_26964 ) ) ( not ( = ?auto_26949 ?auto_26957 ) ) ( not ( = ?auto_26949 ?auto_26946 ) ) ( not ( = ?auto_26949 ?auto_26947 ) ) ( not ( = ?auto_26911 ?auto_26918 ) ) ( not ( = ?auto_26911 ?auto_26942 ) ) ( not ( = ?auto_26912 ?auto_26918 ) ) ( not ( = ?auto_26912 ?auto_26942 ) ) ( not ( = ?auto_26913 ?auto_26918 ) ) ( not ( = ?auto_26913 ?auto_26942 ) ) ( not ( = ?auto_26914 ?auto_26918 ) ) ( not ( = ?auto_26914 ?auto_26942 ) ) ( not ( = ?auto_26918 ?auto_26949 ) ) ( not ( = ?auto_26918 ?auto_26957 ) ) ( not ( = ?auto_26918 ?auto_26946 ) ) ( not ( = ?auto_26918 ?auto_26947 ) ) ( not ( = ?auto_26959 ?auto_26931 ) ) ( not ( = ?auto_26959 ?auto_26936 ) ) ( not ( = ?auto_26959 ?auto_26951 ) ) ( not ( = ?auto_26959 ?auto_26950 ) ) ( not ( = ?auto_26952 ?auto_26929 ) ) ( not ( = ?auto_26952 ?auto_26961 ) ) ( not ( = ?auto_26952 ?auto_26938 ) ) ( not ( = ?auto_26952 ?auto_26964 ) ) ( not ( = ?auto_26942 ?auto_26949 ) ) ( not ( = ?auto_26942 ?auto_26957 ) ) ( not ( = ?auto_26942 ?auto_26946 ) ) ( not ( = ?auto_26942 ?auto_26947 ) ) ( not ( = ?auto_26911 ?auto_26916 ) ) ( not ( = ?auto_26911 ?auto_26940 ) ) ( not ( = ?auto_26912 ?auto_26916 ) ) ( not ( = ?auto_26912 ?auto_26940 ) ) ( not ( = ?auto_26913 ?auto_26916 ) ) ( not ( = ?auto_26913 ?auto_26940 ) ) ( not ( = ?auto_26914 ?auto_26916 ) ) ( not ( = ?auto_26914 ?auto_26940 ) ) ( not ( = ?auto_26915 ?auto_26916 ) ) ( not ( = ?auto_26915 ?auto_26940 ) ) ( not ( = ?auto_26916 ?auto_26942 ) ) ( not ( = ?auto_26916 ?auto_26949 ) ) ( not ( = ?auto_26916 ?auto_26957 ) ) ( not ( = ?auto_26916 ?auto_26946 ) ) ( not ( = ?auto_26916 ?auto_26947 ) ) ( not ( = ?auto_26941 ?auto_26959 ) ) ( not ( = ?auto_26941 ?auto_26931 ) ) ( not ( = ?auto_26941 ?auto_26936 ) ) ( not ( = ?auto_26941 ?auto_26951 ) ) ( not ( = ?auto_26941 ?auto_26950 ) ) ( not ( = ?auto_26934 ?auto_26952 ) ) ( not ( = ?auto_26934 ?auto_26929 ) ) ( not ( = ?auto_26934 ?auto_26961 ) ) ( not ( = ?auto_26934 ?auto_26938 ) ) ( not ( = ?auto_26934 ?auto_26964 ) ) ( not ( = ?auto_26940 ?auto_26942 ) ) ( not ( = ?auto_26940 ?auto_26949 ) ) ( not ( = ?auto_26940 ?auto_26957 ) ) ( not ( = ?auto_26940 ?auto_26946 ) ) ( not ( = ?auto_26940 ?auto_26947 ) ) ( not ( = ?auto_26911 ?auto_26920 ) ) ( not ( = ?auto_26911 ?auto_26958 ) ) ( not ( = ?auto_26912 ?auto_26920 ) ) ( not ( = ?auto_26912 ?auto_26958 ) ) ( not ( = ?auto_26913 ?auto_26920 ) ) ( not ( = ?auto_26913 ?auto_26958 ) ) ( not ( = ?auto_26914 ?auto_26920 ) ) ( not ( = ?auto_26914 ?auto_26958 ) ) ( not ( = ?auto_26915 ?auto_26920 ) ) ( not ( = ?auto_26915 ?auto_26958 ) ) ( not ( = ?auto_26918 ?auto_26920 ) ) ( not ( = ?auto_26918 ?auto_26958 ) ) ( not ( = ?auto_26920 ?auto_26940 ) ) ( not ( = ?auto_26920 ?auto_26942 ) ) ( not ( = ?auto_26920 ?auto_26949 ) ) ( not ( = ?auto_26920 ?auto_26957 ) ) ( not ( = ?auto_26920 ?auto_26946 ) ) ( not ( = ?auto_26920 ?auto_26947 ) ) ( not ( = ?auto_26954 ?auto_26941 ) ) ( not ( = ?auto_26954 ?auto_26959 ) ) ( not ( = ?auto_26954 ?auto_26931 ) ) ( not ( = ?auto_26954 ?auto_26936 ) ) ( not ( = ?auto_26954 ?auto_26951 ) ) ( not ( = ?auto_26954 ?auto_26950 ) ) ( not ( = ?auto_26937 ?auto_26934 ) ) ( not ( = ?auto_26937 ?auto_26952 ) ) ( not ( = ?auto_26937 ?auto_26929 ) ) ( not ( = ?auto_26937 ?auto_26961 ) ) ( not ( = ?auto_26937 ?auto_26938 ) ) ( not ( = ?auto_26937 ?auto_26964 ) ) ( not ( = ?auto_26958 ?auto_26940 ) ) ( not ( = ?auto_26958 ?auto_26942 ) ) ( not ( = ?auto_26958 ?auto_26949 ) ) ( not ( = ?auto_26958 ?auto_26957 ) ) ( not ( = ?auto_26958 ?auto_26946 ) ) ( not ( = ?auto_26958 ?auto_26947 ) ) ( not ( = ?auto_26911 ?auto_26919 ) ) ( not ( = ?auto_26911 ?auto_26939 ) ) ( not ( = ?auto_26912 ?auto_26919 ) ) ( not ( = ?auto_26912 ?auto_26939 ) ) ( not ( = ?auto_26913 ?auto_26919 ) ) ( not ( = ?auto_26913 ?auto_26939 ) ) ( not ( = ?auto_26914 ?auto_26919 ) ) ( not ( = ?auto_26914 ?auto_26939 ) ) ( not ( = ?auto_26915 ?auto_26919 ) ) ( not ( = ?auto_26915 ?auto_26939 ) ) ( not ( = ?auto_26918 ?auto_26919 ) ) ( not ( = ?auto_26918 ?auto_26939 ) ) ( not ( = ?auto_26916 ?auto_26919 ) ) ( not ( = ?auto_26916 ?auto_26939 ) ) ( not ( = ?auto_26919 ?auto_26958 ) ) ( not ( = ?auto_26919 ?auto_26940 ) ) ( not ( = ?auto_26919 ?auto_26942 ) ) ( not ( = ?auto_26919 ?auto_26949 ) ) ( not ( = ?auto_26919 ?auto_26957 ) ) ( not ( = ?auto_26919 ?auto_26946 ) ) ( not ( = ?auto_26919 ?auto_26947 ) ) ( not ( = ?auto_26939 ?auto_26958 ) ) ( not ( = ?auto_26939 ?auto_26940 ) ) ( not ( = ?auto_26939 ?auto_26942 ) ) ( not ( = ?auto_26939 ?auto_26949 ) ) ( not ( = ?auto_26939 ?auto_26957 ) ) ( not ( = ?auto_26939 ?auto_26946 ) ) ( not ( = ?auto_26939 ?auto_26947 ) ) ( not ( = ?auto_26911 ?auto_26917 ) ) ( not ( = ?auto_26911 ?auto_26965 ) ) ( not ( = ?auto_26912 ?auto_26917 ) ) ( not ( = ?auto_26912 ?auto_26965 ) ) ( not ( = ?auto_26913 ?auto_26917 ) ) ( not ( = ?auto_26913 ?auto_26965 ) ) ( not ( = ?auto_26914 ?auto_26917 ) ) ( not ( = ?auto_26914 ?auto_26965 ) ) ( not ( = ?auto_26915 ?auto_26917 ) ) ( not ( = ?auto_26915 ?auto_26965 ) ) ( not ( = ?auto_26918 ?auto_26917 ) ) ( not ( = ?auto_26918 ?auto_26965 ) ) ( not ( = ?auto_26916 ?auto_26917 ) ) ( not ( = ?auto_26916 ?auto_26965 ) ) ( not ( = ?auto_26920 ?auto_26917 ) ) ( not ( = ?auto_26920 ?auto_26965 ) ) ( not ( = ?auto_26917 ?auto_26939 ) ) ( not ( = ?auto_26917 ?auto_26958 ) ) ( not ( = ?auto_26917 ?auto_26940 ) ) ( not ( = ?auto_26917 ?auto_26942 ) ) ( not ( = ?auto_26917 ?auto_26949 ) ) ( not ( = ?auto_26917 ?auto_26957 ) ) ( not ( = ?auto_26917 ?auto_26946 ) ) ( not ( = ?auto_26917 ?auto_26947 ) ) ( not ( = ?auto_26965 ?auto_26939 ) ) ( not ( = ?auto_26965 ?auto_26958 ) ) ( not ( = ?auto_26965 ?auto_26940 ) ) ( not ( = ?auto_26965 ?auto_26942 ) ) ( not ( = ?auto_26965 ?auto_26949 ) ) ( not ( = ?auto_26965 ?auto_26957 ) ) ( not ( = ?auto_26965 ?auto_26946 ) ) ( not ( = ?auto_26965 ?auto_26947 ) ) ( not ( = ?auto_26911 ?auto_26922 ) ) ( not ( = ?auto_26911 ?auto_26933 ) ) ( not ( = ?auto_26912 ?auto_26922 ) ) ( not ( = ?auto_26912 ?auto_26933 ) ) ( not ( = ?auto_26913 ?auto_26922 ) ) ( not ( = ?auto_26913 ?auto_26933 ) ) ( not ( = ?auto_26914 ?auto_26922 ) ) ( not ( = ?auto_26914 ?auto_26933 ) ) ( not ( = ?auto_26915 ?auto_26922 ) ) ( not ( = ?auto_26915 ?auto_26933 ) ) ( not ( = ?auto_26918 ?auto_26922 ) ) ( not ( = ?auto_26918 ?auto_26933 ) ) ( not ( = ?auto_26916 ?auto_26922 ) ) ( not ( = ?auto_26916 ?auto_26933 ) ) ( not ( = ?auto_26920 ?auto_26922 ) ) ( not ( = ?auto_26920 ?auto_26933 ) ) ( not ( = ?auto_26919 ?auto_26922 ) ) ( not ( = ?auto_26919 ?auto_26933 ) ) ( not ( = ?auto_26922 ?auto_26965 ) ) ( not ( = ?auto_26922 ?auto_26939 ) ) ( not ( = ?auto_26922 ?auto_26958 ) ) ( not ( = ?auto_26922 ?auto_26940 ) ) ( not ( = ?auto_26922 ?auto_26942 ) ) ( not ( = ?auto_26922 ?auto_26949 ) ) ( not ( = ?auto_26922 ?auto_26957 ) ) ( not ( = ?auto_26922 ?auto_26946 ) ) ( not ( = ?auto_26922 ?auto_26947 ) ) ( not ( = ?auto_26955 ?auto_26931 ) ) ( not ( = ?auto_26955 ?auto_26954 ) ) ( not ( = ?auto_26955 ?auto_26941 ) ) ( not ( = ?auto_26955 ?auto_26959 ) ) ( not ( = ?auto_26955 ?auto_26936 ) ) ( not ( = ?auto_26955 ?auto_26951 ) ) ( not ( = ?auto_26955 ?auto_26950 ) ) ( not ( = ?auto_26948 ?auto_26929 ) ) ( not ( = ?auto_26948 ?auto_26937 ) ) ( not ( = ?auto_26948 ?auto_26934 ) ) ( not ( = ?auto_26948 ?auto_26952 ) ) ( not ( = ?auto_26948 ?auto_26961 ) ) ( not ( = ?auto_26948 ?auto_26938 ) ) ( not ( = ?auto_26948 ?auto_26964 ) ) ( not ( = ?auto_26933 ?auto_26965 ) ) ( not ( = ?auto_26933 ?auto_26939 ) ) ( not ( = ?auto_26933 ?auto_26958 ) ) ( not ( = ?auto_26933 ?auto_26940 ) ) ( not ( = ?auto_26933 ?auto_26942 ) ) ( not ( = ?auto_26933 ?auto_26949 ) ) ( not ( = ?auto_26933 ?auto_26957 ) ) ( not ( = ?auto_26933 ?auto_26946 ) ) ( not ( = ?auto_26933 ?auto_26947 ) ) ( not ( = ?auto_26911 ?auto_26921 ) ) ( not ( = ?auto_26911 ?auto_26944 ) ) ( not ( = ?auto_26912 ?auto_26921 ) ) ( not ( = ?auto_26912 ?auto_26944 ) ) ( not ( = ?auto_26913 ?auto_26921 ) ) ( not ( = ?auto_26913 ?auto_26944 ) ) ( not ( = ?auto_26914 ?auto_26921 ) ) ( not ( = ?auto_26914 ?auto_26944 ) ) ( not ( = ?auto_26915 ?auto_26921 ) ) ( not ( = ?auto_26915 ?auto_26944 ) ) ( not ( = ?auto_26918 ?auto_26921 ) ) ( not ( = ?auto_26918 ?auto_26944 ) ) ( not ( = ?auto_26916 ?auto_26921 ) ) ( not ( = ?auto_26916 ?auto_26944 ) ) ( not ( = ?auto_26920 ?auto_26921 ) ) ( not ( = ?auto_26920 ?auto_26944 ) ) ( not ( = ?auto_26919 ?auto_26921 ) ) ( not ( = ?auto_26919 ?auto_26944 ) ) ( not ( = ?auto_26917 ?auto_26921 ) ) ( not ( = ?auto_26917 ?auto_26944 ) ) ( not ( = ?auto_26921 ?auto_26933 ) ) ( not ( = ?auto_26921 ?auto_26965 ) ) ( not ( = ?auto_26921 ?auto_26939 ) ) ( not ( = ?auto_26921 ?auto_26958 ) ) ( not ( = ?auto_26921 ?auto_26940 ) ) ( not ( = ?auto_26921 ?auto_26942 ) ) ( not ( = ?auto_26921 ?auto_26949 ) ) ( not ( = ?auto_26921 ?auto_26957 ) ) ( not ( = ?auto_26921 ?auto_26946 ) ) ( not ( = ?auto_26921 ?auto_26947 ) ) ( not ( = ?auto_26966 ?auto_26955 ) ) ( not ( = ?auto_26966 ?auto_26931 ) ) ( not ( = ?auto_26966 ?auto_26954 ) ) ( not ( = ?auto_26966 ?auto_26941 ) ) ( not ( = ?auto_26966 ?auto_26959 ) ) ( not ( = ?auto_26966 ?auto_26936 ) ) ( not ( = ?auto_26966 ?auto_26951 ) ) ( not ( = ?auto_26966 ?auto_26950 ) ) ( not ( = ?auto_26935 ?auto_26948 ) ) ( not ( = ?auto_26935 ?auto_26929 ) ) ( not ( = ?auto_26935 ?auto_26937 ) ) ( not ( = ?auto_26935 ?auto_26934 ) ) ( not ( = ?auto_26935 ?auto_26952 ) ) ( not ( = ?auto_26935 ?auto_26961 ) ) ( not ( = ?auto_26935 ?auto_26938 ) ) ( not ( = ?auto_26935 ?auto_26964 ) ) ( not ( = ?auto_26944 ?auto_26933 ) ) ( not ( = ?auto_26944 ?auto_26965 ) ) ( not ( = ?auto_26944 ?auto_26939 ) ) ( not ( = ?auto_26944 ?auto_26958 ) ) ( not ( = ?auto_26944 ?auto_26940 ) ) ( not ( = ?auto_26944 ?auto_26942 ) ) ( not ( = ?auto_26944 ?auto_26949 ) ) ( not ( = ?auto_26944 ?auto_26957 ) ) ( not ( = ?auto_26944 ?auto_26946 ) ) ( not ( = ?auto_26944 ?auto_26947 ) ) ( not ( = ?auto_26911 ?auto_26923 ) ) ( not ( = ?auto_26911 ?auto_26943 ) ) ( not ( = ?auto_26912 ?auto_26923 ) ) ( not ( = ?auto_26912 ?auto_26943 ) ) ( not ( = ?auto_26913 ?auto_26923 ) ) ( not ( = ?auto_26913 ?auto_26943 ) ) ( not ( = ?auto_26914 ?auto_26923 ) ) ( not ( = ?auto_26914 ?auto_26943 ) ) ( not ( = ?auto_26915 ?auto_26923 ) ) ( not ( = ?auto_26915 ?auto_26943 ) ) ( not ( = ?auto_26918 ?auto_26923 ) ) ( not ( = ?auto_26918 ?auto_26943 ) ) ( not ( = ?auto_26916 ?auto_26923 ) ) ( not ( = ?auto_26916 ?auto_26943 ) ) ( not ( = ?auto_26920 ?auto_26923 ) ) ( not ( = ?auto_26920 ?auto_26943 ) ) ( not ( = ?auto_26919 ?auto_26923 ) ) ( not ( = ?auto_26919 ?auto_26943 ) ) ( not ( = ?auto_26917 ?auto_26923 ) ) ( not ( = ?auto_26917 ?auto_26943 ) ) ( not ( = ?auto_26922 ?auto_26923 ) ) ( not ( = ?auto_26922 ?auto_26943 ) ) ( not ( = ?auto_26923 ?auto_26944 ) ) ( not ( = ?auto_26923 ?auto_26933 ) ) ( not ( = ?auto_26923 ?auto_26965 ) ) ( not ( = ?auto_26923 ?auto_26939 ) ) ( not ( = ?auto_26923 ?auto_26958 ) ) ( not ( = ?auto_26923 ?auto_26940 ) ) ( not ( = ?auto_26923 ?auto_26942 ) ) ( not ( = ?auto_26923 ?auto_26949 ) ) ( not ( = ?auto_26923 ?auto_26957 ) ) ( not ( = ?auto_26923 ?auto_26946 ) ) ( not ( = ?auto_26923 ?auto_26947 ) ) ( not ( = ?auto_26960 ?auto_26966 ) ) ( not ( = ?auto_26960 ?auto_26955 ) ) ( not ( = ?auto_26960 ?auto_26931 ) ) ( not ( = ?auto_26960 ?auto_26954 ) ) ( not ( = ?auto_26960 ?auto_26941 ) ) ( not ( = ?auto_26960 ?auto_26959 ) ) ( not ( = ?auto_26960 ?auto_26936 ) ) ( not ( = ?auto_26960 ?auto_26951 ) ) ( not ( = ?auto_26960 ?auto_26950 ) ) ( not ( = ?auto_26945 ?auto_26935 ) ) ( not ( = ?auto_26945 ?auto_26948 ) ) ( not ( = ?auto_26945 ?auto_26929 ) ) ( not ( = ?auto_26945 ?auto_26937 ) ) ( not ( = ?auto_26945 ?auto_26934 ) ) ( not ( = ?auto_26945 ?auto_26952 ) ) ( not ( = ?auto_26945 ?auto_26961 ) ) ( not ( = ?auto_26945 ?auto_26938 ) ) ( not ( = ?auto_26945 ?auto_26964 ) ) ( not ( = ?auto_26943 ?auto_26944 ) ) ( not ( = ?auto_26943 ?auto_26933 ) ) ( not ( = ?auto_26943 ?auto_26965 ) ) ( not ( = ?auto_26943 ?auto_26939 ) ) ( not ( = ?auto_26943 ?auto_26958 ) ) ( not ( = ?auto_26943 ?auto_26940 ) ) ( not ( = ?auto_26943 ?auto_26942 ) ) ( not ( = ?auto_26943 ?auto_26949 ) ) ( not ( = ?auto_26943 ?auto_26957 ) ) ( not ( = ?auto_26943 ?auto_26946 ) ) ( not ( = ?auto_26943 ?auto_26947 ) ) ( not ( = ?auto_26911 ?auto_26925 ) ) ( not ( = ?auto_26911 ?auto_26953 ) ) ( not ( = ?auto_26912 ?auto_26925 ) ) ( not ( = ?auto_26912 ?auto_26953 ) ) ( not ( = ?auto_26913 ?auto_26925 ) ) ( not ( = ?auto_26913 ?auto_26953 ) ) ( not ( = ?auto_26914 ?auto_26925 ) ) ( not ( = ?auto_26914 ?auto_26953 ) ) ( not ( = ?auto_26915 ?auto_26925 ) ) ( not ( = ?auto_26915 ?auto_26953 ) ) ( not ( = ?auto_26918 ?auto_26925 ) ) ( not ( = ?auto_26918 ?auto_26953 ) ) ( not ( = ?auto_26916 ?auto_26925 ) ) ( not ( = ?auto_26916 ?auto_26953 ) ) ( not ( = ?auto_26920 ?auto_26925 ) ) ( not ( = ?auto_26920 ?auto_26953 ) ) ( not ( = ?auto_26919 ?auto_26925 ) ) ( not ( = ?auto_26919 ?auto_26953 ) ) ( not ( = ?auto_26917 ?auto_26925 ) ) ( not ( = ?auto_26917 ?auto_26953 ) ) ( not ( = ?auto_26922 ?auto_26925 ) ) ( not ( = ?auto_26922 ?auto_26953 ) ) ( not ( = ?auto_26921 ?auto_26925 ) ) ( not ( = ?auto_26921 ?auto_26953 ) ) ( not ( = ?auto_26925 ?auto_26943 ) ) ( not ( = ?auto_26925 ?auto_26944 ) ) ( not ( = ?auto_26925 ?auto_26933 ) ) ( not ( = ?auto_26925 ?auto_26965 ) ) ( not ( = ?auto_26925 ?auto_26939 ) ) ( not ( = ?auto_26925 ?auto_26958 ) ) ( not ( = ?auto_26925 ?auto_26940 ) ) ( not ( = ?auto_26925 ?auto_26942 ) ) ( not ( = ?auto_26925 ?auto_26949 ) ) ( not ( = ?auto_26925 ?auto_26957 ) ) ( not ( = ?auto_26925 ?auto_26946 ) ) ( not ( = ?auto_26925 ?auto_26947 ) ) ( not ( = ?auto_26956 ?auto_26960 ) ) ( not ( = ?auto_26956 ?auto_26966 ) ) ( not ( = ?auto_26956 ?auto_26955 ) ) ( not ( = ?auto_26956 ?auto_26931 ) ) ( not ( = ?auto_26956 ?auto_26954 ) ) ( not ( = ?auto_26956 ?auto_26941 ) ) ( not ( = ?auto_26956 ?auto_26959 ) ) ( not ( = ?auto_26956 ?auto_26936 ) ) ( not ( = ?auto_26956 ?auto_26951 ) ) ( not ( = ?auto_26956 ?auto_26950 ) ) ( not ( = ?auto_26962 ?auto_26945 ) ) ( not ( = ?auto_26962 ?auto_26935 ) ) ( not ( = ?auto_26962 ?auto_26948 ) ) ( not ( = ?auto_26962 ?auto_26929 ) ) ( not ( = ?auto_26962 ?auto_26937 ) ) ( not ( = ?auto_26962 ?auto_26934 ) ) ( not ( = ?auto_26962 ?auto_26952 ) ) ( not ( = ?auto_26962 ?auto_26961 ) ) ( not ( = ?auto_26962 ?auto_26938 ) ) ( not ( = ?auto_26962 ?auto_26964 ) ) ( not ( = ?auto_26953 ?auto_26943 ) ) ( not ( = ?auto_26953 ?auto_26944 ) ) ( not ( = ?auto_26953 ?auto_26933 ) ) ( not ( = ?auto_26953 ?auto_26965 ) ) ( not ( = ?auto_26953 ?auto_26939 ) ) ( not ( = ?auto_26953 ?auto_26958 ) ) ( not ( = ?auto_26953 ?auto_26940 ) ) ( not ( = ?auto_26953 ?auto_26942 ) ) ( not ( = ?auto_26953 ?auto_26949 ) ) ( not ( = ?auto_26953 ?auto_26957 ) ) ( not ( = ?auto_26953 ?auto_26946 ) ) ( not ( = ?auto_26953 ?auto_26947 ) ) ( not ( = ?auto_26911 ?auto_26926 ) ) ( not ( = ?auto_26911 ?auto_26963 ) ) ( not ( = ?auto_26912 ?auto_26926 ) ) ( not ( = ?auto_26912 ?auto_26963 ) ) ( not ( = ?auto_26913 ?auto_26926 ) ) ( not ( = ?auto_26913 ?auto_26963 ) ) ( not ( = ?auto_26914 ?auto_26926 ) ) ( not ( = ?auto_26914 ?auto_26963 ) ) ( not ( = ?auto_26915 ?auto_26926 ) ) ( not ( = ?auto_26915 ?auto_26963 ) ) ( not ( = ?auto_26918 ?auto_26926 ) ) ( not ( = ?auto_26918 ?auto_26963 ) ) ( not ( = ?auto_26916 ?auto_26926 ) ) ( not ( = ?auto_26916 ?auto_26963 ) ) ( not ( = ?auto_26920 ?auto_26926 ) ) ( not ( = ?auto_26920 ?auto_26963 ) ) ( not ( = ?auto_26919 ?auto_26926 ) ) ( not ( = ?auto_26919 ?auto_26963 ) ) ( not ( = ?auto_26917 ?auto_26926 ) ) ( not ( = ?auto_26917 ?auto_26963 ) ) ( not ( = ?auto_26922 ?auto_26926 ) ) ( not ( = ?auto_26922 ?auto_26963 ) ) ( not ( = ?auto_26921 ?auto_26926 ) ) ( not ( = ?auto_26921 ?auto_26963 ) ) ( not ( = ?auto_26923 ?auto_26926 ) ) ( not ( = ?auto_26923 ?auto_26963 ) ) ( not ( = ?auto_26926 ?auto_26953 ) ) ( not ( = ?auto_26926 ?auto_26943 ) ) ( not ( = ?auto_26926 ?auto_26944 ) ) ( not ( = ?auto_26926 ?auto_26933 ) ) ( not ( = ?auto_26926 ?auto_26965 ) ) ( not ( = ?auto_26926 ?auto_26939 ) ) ( not ( = ?auto_26926 ?auto_26958 ) ) ( not ( = ?auto_26926 ?auto_26940 ) ) ( not ( = ?auto_26926 ?auto_26942 ) ) ( not ( = ?auto_26926 ?auto_26949 ) ) ( not ( = ?auto_26926 ?auto_26957 ) ) ( not ( = ?auto_26926 ?auto_26946 ) ) ( not ( = ?auto_26926 ?auto_26947 ) ) ( not ( = ?auto_26963 ?auto_26953 ) ) ( not ( = ?auto_26963 ?auto_26943 ) ) ( not ( = ?auto_26963 ?auto_26944 ) ) ( not ( = ?auto_26963 ?auto_26933 ) ) ( not ( = ?auto_26963 ?auto_26965 ) ) ( not ( = ?auto_26963 ?auto_26939 ) ) ( not ( = ?auto_26963 ?auto_26958 ) ) ( not ( = ?auto_26963 ?auto_26940 ) ) ( not ( = ?auto_26963 ?auto_26942 ) ) ( not ( = ?auto_26963 ?auto_26949 ) ) ( not ( = ?auto_26963 ?auto_26957 ) ) ( not ( = ?auto_26963 ?auto_26946 ) ) ( not ( = ?auto_26963 ?auto_26947 ) ) ( not ( = ?auto_26911 ?auto_26924 ) ) ( not ( = ?auto_26911 ?auto_26932 ) ) ( not ( = ?auto_26912 ?auto_26924 ) ) ( not ( = ?auto_26912 ?auto_26932 ) ) ( not ( = ?auto_26913 ?auto_26924 ) ) ( not ( = ?auto_26913 ?auto_26932 ) ) ( not ( = ?auto_26914 ?auto_26924 ) ) ( not ( = ?auto_26914 ?auto_26932 ) ) ( not ( = ?auto_26915 ?auto_26924 ) ) ( not ( = ?auto_26915 ?auto_26932 ) ) ( not ( = ?auto_26918 ?auto_26924 ) ) ( not ( = ?auto_26918 ?auto_26932 ) ) ( not ( = ?auto_26916 ?auto_26924 ) ) ( not ( = ?auto_26916 ?auto_26932 ) ) ( not ( = ?auto_26920 ?auto_26924 ) ) ( not ( = ?auto_26920 ?auto_26932 ) ) ( not ( = ?auto_26919 ?auto_26924 ) ) ( not ( = ?auto_26919 ?auto_26932 ) ) ( not ( = ?auto_26917 ?auto_26924 ) ) ( not ( = ?auto_26917 ?auto_26932 ) ) ( not ( = ?auto_26922 ?auto_26924 ) ) ( not ( = ?auto_26922 ?auto_26932 ) ) ( not ( = ?auto_26921 ?auto_26924 ) ) ( not ( = ?auto_26921 ?auto_26932 ) ) ( not ( = ?auto_26923 ?auto_26924 ) ) ( not ( = ?auto_26923 ?auto_26932 ) ) ( not ( = ?auto_26925 ?auto_26924 ) ) ( not ( = ?auto_26925 ?auto_26932 ) ) ( not ( = ?auto_26924 ?auto_26963 ) ) ( not ( = ?auto_26924 ?auto_26953 ) ) ( not ( = ?auto_26924 ?auto_26943 ) ) ( not ( = ?auto_26924 ?auto_26944 ) ) ( not ( = ?auto_26924 ?auto_26933 ) ) ( not ( = ?auto_26924 ?auto_26965 ) ) ( not ( = ?auto_26924 ?auto_26939 ) ) ( not ( = ?auto_26924 ?auto_26958 ) ) ( not ( = ?auto_26924 ?auto_26940 ) ) ( not ( = ?auto_26924 ?auto_26942 ) ) ( not ( = ?auto_26924 ?auto_26949 ) ) ( not ( = ?auto_26924 ?auto_26957 ) ) ( not ( = ?auto_26924 ?auto_26946 ) ) ( not ( = ?auto_26924 ?auto_26947 ) ) ( not ( = ?auto_26932 ?auto_26963 ) ) ( not ( = ?auto_26932 ?auto_26953 ) ) ( not ( = ?auto_26932 ?auto_26943 ) ) ( not ( = ?auto_26932 ?auto_26944 ) ) ( not ( = ?auto_26932 ?auto_26933 ) ) ( not ( = ?auto_26932 ?auto_26965 ) ) ( not ( = ?auto_26932 ?auto_26939 ) ) ( not ( = ?auto_26932 ?auto_26958 ) ) ( not ( = ?auto_26932 ?auto_26940 ) ) ( not ( = ?auto_26932 ?auto_26942 ) ) ( not ( = ?auto_26932 ?auto_26949 ) ) ( not ( = ?auto_26932 ?auto_26957 ) ) ( not ( = ?auto_26932 ?auto_26946 ) ) ( not ( = ?auto_26932 ?auto_26947 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_26911 ?auto_26912 ?auto_26913 ?auto_26914 ?auto_26915 ?auto_26918 ?auto_26916 ?auto_26920 ?auto_26919 ?auto_26917 ?auto_26922 ?auto_26921 ?auto_26923 ?auto_26925 ?auto_26926 )
      ( MAKE-1CRATE ?auto_26926 ?auto_26924 )
      ( MAKE-15CRATE-VERIFY ?auto_26911 ?auto_26912 ?auto_26913 ?auto_26914 ?auto_26915 ?auto_26918 ?auto_26916 ?auto_26920 ?auto_26919 ?auto_26917 ?auto_26922 ?auto_26921 ?auto_26923 ?auto_26925 ?auto_26926 ?auto_26924 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26969 - SURFACE
      ?auto_26970 - SURFACE
    )
    :vars
    (
      ?auto_26971 - HOIST
      ?auto_26972 - PLACE
      ?auto_26974 - PLACE
      ?auto_26975 - HOIST
      ?auto_26976 - SURFACE
      ?auto_26973 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26971 ?auto_26972 ) ( SURFACE-AT ?auto_26969 ?auto_26972 ) ( CLEAR ?auto_26969 ) ( IS-CRATE ?auto_26970 ) ( AVAILABLE ?auto_26971 ) ( not ( = ?auto_26974 ?auto_26972 ) ) ( HOIST-AT ?auto_26975 ?auto_26974 ) ( AVAILABLE ?auto_26975 ) ( SURFACE-AT ?auto_26970 ?auto_26974 ) ( ON ?auto_26970 ?auto_26976 ) ( CLEAR ?auto_26970 ) ( TRUCK-AT ?auto_26973 ?auto_26972 ) ( not ( = ?auto_26969 ?auto_26970 ) ) ( not ( = ?auto_26969 ?auto_26976 ) ) ( not ( = ?auto_26970 ?auto_26976 ) ) ( not ( = ?auto_26971 ?auto_26975 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26973 ?auto_26972 ?auto_26974 )
      ( !LIFT ?auto_26975 ?auto_26970 ?auto_26976 ?auto_26974 )
      ( !LOAD ?auto_26975 ?auto_26970 ?auto_26973 ?auto_26974 )
      ( !DRIVE ?auto_26973 ?auto_26974 ?auto_26972 )
      ( !UNLOAD ?auto_26971 ?auto_26970 ?auto_26973 ?auto_26972 )
      ( !DROP ?auto_26971 ?auto_26970 ?auto_26969 ?auto_26972 )
      ( MAKE-1CRATE-VERIFY ?auto_26969 ?auto_26970 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_26994 - SURFACE
      ?auto_26995 - SURFACE
      ?auto_26996 - SURFACE
      ?auto_26997 - SURFACE
      ?auto_26998 - SURFACE
      ?auto_27001 - SURFACE
      ?auto_26999 - SURFACE
      ?auto_27003 - SURFACE
      ?auto_27002 - SURFACE
      ?auto_27000 - SURFACE
      ?auto_27005 - SURFACE
      ?auto_27004 - SURFACE
      ?auto_27006 - SURFACE
      ?auto_27008 - SURFACE
      ?auto_27009 - SURFACE
      ?auto_27007 - SURFACE
      ?auto_27010 - SURFACE
    )
    :vars
    (
      ?auto_27013 - HOIST
      ?auto_27012 - PLACE
      ?auto_27016 - PLACE
      ?auto_27014 - HOIST
      ?auto_27015 - SURFACE
      ?auto_27023 - PLACE
      ?auto_27037 - HOIST
      ?auto_27048 - SURFACE
      ?auto_27044 - PLACE
      ?auto_27038 - HOIST
      ?auto_27026 - SURFACE
      ?auto_27033 - PLACE
      ?auto_27043 - HOIST
      ?auto_27042 - SURFACE
      ?auto_27050 - PLACE
      ?auto_27040 - HOIST
      ?auto_27036 - SURFACE
      ?auto_27046 - SURFACE
      ?auto_27035 - PLACE
      ?auto_27030 - HOIST
      ?auto_27027 - SURFACE
      ?auto_27031 - SURFACE
      ?auto_27025 - PLACE
      ?auto_27045 - HOIST
      ?auto_27018 - SURFACE
      ?auto_27041 - SURFACE
      ?auto_27020 - PLACE
      ?auto_27017 - HOIST
      ?auto_27022 - SURFACE
      ?auto_27024 - PLACE
      ?auto_27021 - HOIST
      ?auto_27051 - SURFACE
      ?auto_27019 - SURFACE
      ?auto_27032 - PLACE
      ?auto_27034 - HOIST
      ?auto_27039 - SURFACE
      ?auto_27029 - SURFACE
      ?auto_27047 - PLACE
      ?auto_27028 - HOIST
      ?auto_27049 - SURFACE
      ?auto_27011 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27013 ?auto_27012 ) ( IS-CRATE ?auto_27010 ) ( not ( = ?auto_27016 ?auto_27012 ) ) ( HOIST-AT ?auto_27014 ?auto_27016 ) ( SURFACE-AT ?auto_27010 ?auto_27016 ) ( ON ?auto_27010 ?auto_27015 ) ( CLEAR ?auto_27010 ) ( not ( = ?auto_27007 ?auto_27010 ) ) ( not ( = ?auto_27007 ?auto_27015 ) ) ( not ( = ?auto_27010 ?auto_27015 ) ) ( not ( = ?auto_27013 ?auto_27014 ) ) ( IS-CRATE ?auto_27007 ) ( not ( = ?auto_27023 ?auto_27012 ) ) ( HOIST-AT ?auto_27037 ?auto_27023 ) ( SURFACE-AT ?auto_27007 ?auto_27023 ) ( ON ?auto_27007 ?auto_27048 ) ( CLEAR ?auto_27007 ) ( not ( = ?auto_27009 ?auto_27007 ) ) ( not ( = ?auto_27009 ?auto_27048 ) ) ( not ( = ?auto_27007 ?auto_27048 ) ) ( not ( = ?auto_27013 ?auto_27037 ) ) ( IS-CRATE ?auto_27009 ) ( not ( = ?auto_27044 ?auto_27012 ) ) ( HOIST-AT ?auto_27038 ?auto_27044 ) ( SURFACE-AT ?auto_27009 ?auto_27044 ) ( ON ?auto_27009 ?auto_27026 ) ( CLEAR ?auto_27009 ) ( not ( = ?auto_27008 ?auto_27009 ) ) ( not ( = ?auto_27008 ?auto_27026 ) ) ( not ( = ?auto_27009 ?auto_27026 ) ) ( not ( = ?auto_27013 ?auto_27038 ) ) ( IS-CRATE ?auto_27008 ) ( not ( = ?auto_27033 ?auto_27012 ) ) ( HOIST-AT ?auto_27043 ?auto_27033 ) ( AVAILABLE ?auto_27043 ) ( SURFACE-AT ?auto_27008 ?auto_27033 ) ( ON ?auto_27008 ?auto_27042 ) ( CLEAR ?auto_27008 ) ( not ( = ?auto_27006 ?auto_27008 ) ) ( not ( = ?auto_27006 ?auto_27042 ) ) ( not ( = ?auto_27008 ?auto_27042 ) ) ( not ( = ?auto_27013 ?auto_27043 ) ) ( IS-CRATE ?auto_27006 ) ( not ( = ?auto_27050 ?auto_27012 ) ) ( HOIST-AT ?auto_27040 ?auto_27050 ) ( AVAILABLE ?auto_27040 ) ( SURFACE-AT ?auto_27006 ?auto_27050 ) ( ON ?auto_27006 ?auto_27036 ) ( CLEAR ?auto_27006 ) ( not ( = ?auto_27004 ?auto_27006 ) ) ( not ( = ?auto_27004 ?auto_27036 ) ) ( not ( = ?auto_27006 ?auto_27036 ) ) ( not ( = ?auto_27013 ?auto_27040 ) ) ( IS-CRATE ?auto_27004 ) ( AVAILABLE ?auto_27014 ) ( SURFACE-AT ?auto_27004 ?auto_27016 ) ( ON ?auto_27004 ?auto_27046 ) ( CLEAR ?auto_27004 ) ( not ( = ?auto_27005 ?auto_27004 ) ) ( not ( = ?auto_27005 ?auto_27046 ) ) ( not ( = ?auto_27004 ?auto_27046 ) ) ( IS-CRATE ?auto_27005 ) ( not ( = ?auto_27035 ?auto_27012 ) ) ( HOIST-AT ?auto_27030 ?auto_27035 ) ( AVAILABLE ?auto_27030 ) ( SURFACE-AT ?auto_27005 ?auto_27035 ) ( ON ?auto_27005 ?auto_27027 ) ( CLEAR ?auto_27005 ) ( not ( = ?auto_27000 ?auto_27005 ) ) ( not ( = ?auto_27000 ?auto_27027 ) ) ( not ( = ?auto_27005 ?auto_27027 ) ) ( not ( = ?auto_27013 ?auto_27030 ) ) ( IS-CRATE ?auto_27000 ) ( SURFACE-AT ?auto_27000 ?auto_27023 ) ( ON ?auto_27000 ?auto_27031 ) ( CLEAR ?auto_27000 ) ( not ( = ?auto_27002 ?auto_27000 ) ) ( not ( = ?auto_27002 ?auto_27031 ) ) ( not ( = ?auto_27000 ?auto_27031 ) ) ( IS-CRATE ?auto_27002 ) ( not ( = ?auto_27025 ?auto_27012 ) ) ( HOIST-AT ?auto_27045 ?auto_27025 ) ( SURFACE-AT ?auto_27002 ?auto_27025 ) ( ON ?auto_27002 ?auto_27018 ) ( CLEAR ?auto_27002 ) ( not ( = ?auto_27003 ?auto_27002 ) ) ( not ( = ?auto_27003 ?auto_27018 ) ) ( not ( = ?auto_27002 ?auto_27018 ) ) ( not ( = ?auto_27013 ?auto_27045 ) ) ( IS-CRATE ?auto_27003 ) ( AVAILABLE ?auto_27045 ) ( SURFACE-AT ?auto_27003 ?auto_27025 ) ( ON ?auto_27003 ?auto_27041 ) ( CLEAR ?auto_27003 ) ( not ( = ?auto_26999 ?auto_27003 ) ) ( not ( = ?auto_26999 ?auto_27041 ) ) ( not ( = ?auto_27003 ?auto_27041 ) ) ( IS-CRATE ?auto_26999 ) ( not ( = ?auto_27020 ?auto_27012 ) ) ( HOIST-AT ?auto_27017 ?auto_27020 ) ( AVAILABLE ?auto_27017 ) ( SURFACE-AT ?auto_26999 ?auto_27020 ) ( ON ?auto_26999 ?auto_27022 ) ( CLEAR ?auto_26999 ) ( not ( = ?auto_27001 ?auto_26999 ) ) ( not ( = ?auto_27001 ?auto_27022 ) ) ( not ( = ?auto_26999 ?auto_27022 ) ) ( not ( = ?auto_27013 ?auto_27017 ) ) ( IS-CRATE ?auto_27001 ) ( not ( = ?auto_27024 ?auto_27012 ) ) ( HOIST-AT ?auto_27021 ?auto_27024 ) ( AVAILABLE ?auto_27021 ) ( SURFACE-AT ?auto_27001 ?auto_27024 ) ( ON ?auto_27001 ?auto_27051 ) ( CLEAR ?auto_27001 ) ( not ( = ?auto_26998 ?auto_27001 ) ) ( not ( = ?auto_26998 ?auto_27051 ) ) ( not ( = ?auto_27001 ?auto_27051 ) ) ( not ( = ?auto_27013 ?auto_27021 ) ) ( IS-CRATE ?auto_26998 ) ( AVAILABLE ?auto_27037 ) ( SURFACE-AT ?auto_26998 ?auto_27023 ) ( ON ?auto_26998 ?auto_27019 ) ( CLEAR ?auto_26998 ) ( not ( = ?auto_26997 ?auto_26998 ) ) ( not ( = ?auto_26997 ?auto_27019 ) ) ( not ( = ?auto_26998 ?auto_27019 ) ) ( IS-CRATE ?auto_26997 ) ( not ( = ?auto_27032 ?auto_27012 ) ) ( HOIST-AT ?auto_27034 ?auto_27032 ) ( AVAILABLE ?auto_27034 ) ( SURFACE-AT ?auto_26997 ?auto_27032 ) ( ON ?auto_26997 ?auto_27039 ) ( CLEAR ?auto_26997 ) ( not ( = ?auto_26996 ?auto_26997 ) ) ( not ( = ?auto_26996 ?auto_27039 ) ) ( not ( = ?auto_26997 ?auto_27039 ) ) ( not ( = ?auto_27013 ?auto_27034 ) ) ( IS-CRATE ?auto_26996 ) ( AVAILABLE ?auto_27038 ) ( SURFACE-AT ?auto_26996 ?auto_27044 ) ( ON ?auto_26996 ?auto_27029 ) ( CLEAR ?auto_26996 ) ( not ( = ?auto_26995 ?auto_26996 ) ) ( not ( = ?auto_26995 ?auto_27029 ) ) ( not ( = ?auto_26996 ?auto_27029 ) ) ( SURFACE-AT ?auto_26994 ?auto_27012 ) ( CLEAR ?auto_26994 ) ( IS-CRATE ?auto_26995 ) ( AVAILABLE ?auto_27013 ) ( not ( = ?auto_27047 ?auto_27012 ) ) ( HOIST-AT ?auto_27028 ?auto_27047 ) ( AVAILABLE ?auto_27028 ) ( SURFACE-AT ?auto_26995 ?auto_27047 ) ( ON ?auto_26995 ?auto_27049 ) ( CLEAR ?auto_26995 ) ( TRUCK-AT ?auto_27011 ?auto_27012 ) ( not ( = ?auto_26994 ?auto_26995 ) ) ( not ( = ?auto_26994 ?auto_27049 ) ) ( not ( = ?auto_26995 ?auto_27049 ) ) ( not ( = ?auto_27013 ?auto_27028 ) ) ( not ( = ?auto_26994 ?auto_26996 ) ) ( not ( = ?auto_26994 ?auto_27029 ) ) ( not ( = ?auto_26996 ?auto_27049 ) ) ( not ( = ?auto_27044 ?auto_27047 ) ) ( not ( = ?auto_27038 ?auto_27028 ) ) ( not ( = ?auto_27029 ?auto_27049 ) ) ( not ( = ?auto_26994 ?auto_26997 ) ) ( not ( = ?auto_26994 ?auto_27039 ) ) ( not ( = ?auto_26995 ?auto_26997 ) ) ( not ( = ?auto_26995 ?auto_27039 ) ) ( not ( = ?auto_26997 ?auto_27029 ) ) ( not ( = ?auto_26997 ?auto_27049 ) ) ( not ( = ?auto_27032 ?auto_27044 ) ) ( not ( = ?auto_27032 ?auto_27047 ) ) ( not ( = ?auto_27034 ?auto_27038 ) ) ( not ( = ?auto_27034 ?auto_27028 ) ) ( not ( = ?auto_27039 ?auto_27029 ) ) ( not ( = ?auto_27039 ?auto_27049 ) ) ( not ( = ?auto_26994 ?auto_26998 ) ) ( not ( = ?auto_26994 ?auto_27019 ) ) ( not ( = ?auto_26995 ?auto_26998 ) ) ( not ( = ?auto_26995 ?auto_27019 ) ) ( not ( = ?auto_26996 ?auto_26998 ) ) ( not ( = ?auto_26996 ?auto_27019 ) ) ( not ( = ?auto_26998 ?auto_27039 ) ) ( not ( = ?auto_26998 ?auto_27029 ) ) ( not ( = ?auto_26998 ?auto_27049 ) ) ( not ( = ?auto_27023 ?auto_27032 ) ) ( not ( = ?auto_27023 ?auto_27044 ) ) ( not ( = ?auto_27023 ?auto_27047 ) ) ( not ( = ?auto_27037 ?auto_27034 ) ) ( not ( = ?auto_27037 ?auto_27038 ) ) ( not ( = ?auto_27037 ?auto_27028 ) ) ( not ( = ?auto_27019 ?auto_27039 ) ) ( not ( = ?auto_27019 ?auto_27029 ) ) ( not ( = ?auto_27019 ?auto_27049 ) ) ( not ( = ?auto_26994 ?auto_27001 ) ) ( not ( = ?auto_26994 ?auto_27051 ) ) ( not ( = ?auto_26995 ?auto_27001 ) ) ( not ( = ?auto_26995 ?auto_27051 ) ) ( not ( = ?auto_26996 ?auto_27001 ) ) ( not ( = ?auto_26996 ?auto_27051 ) ) ( not ( = ?auto_26997 ?auto_27001 ) ) ( not ( = ?auto_26997 ?auto_27051 ) ) ( not ( = ?auto_27001 ?auto_27019 ) ) ( not ( = ?auto_27001 ?auto_27039 ) ) ( not ( = ?auto_27001 ?auto_27029 ) ) ( not ( = ?auto_27001 ?auto_27049 ) ) ( not ( = ?auto_27024 ?auto_27023 ) ) ( not ( = ?auto_27024 ?auto_27032 ) ) ( not ( = ?auto_27024 ?auto_27044 ) ) ( not ( = ?auto_27024 ?auto_27047 ) ) ( not ( = ?auto_27021 ?auto_27037 ) ) ( not ( = ?auto_27021 ?auto_27034 ) ) ( not ( = ?auto_27021 ?auto_27038 ) ) ( not ( = ?auto_27021 ?auto_27028 ) ) ( not ( = ?auto_27051 ?auto_27019 ) ) ( not ( = ?auto_27051 ?auto_27039 ) ) ( not ( = ?auto_27051 ?auto_27029 ) ) ( not ( = ?auto_27051 ?auto_27049 ) ) ( not ( = ?auto_26994 ?auto_26999 ) ) ( not ( = ?auto_26994 ?auto_27022 ) ) ( not ( = ?auto_26995 ?auto_26999 ) ) ( not ( = ?auto_26995 ?auto_27022 ) ) ( not ( = ?auto_26996 ?auto_26999 ) ) ( not ( = ?auto_26996 ?auto_27022 ) ) ( not ( = ?auto_26997 ?auto_26999 ) ) ( not ( = ?auto_26997 ?auto_27022 ) ) ( not ( = ?auto_26998 ?auto_26999 ) ) ( not ( = ?auto_26998 ?auto_27022 ) ) ( not ( = ?auto_26999 ?auto_27051 ) ) ( not ( = ?auto_26999 ?auto_27019 ) ) ( not ( = ?auto_26999 ?auto_27039 ) ) ( not ( = ?auto_26999 ?auto_27029 ) ) ( not ( = ?auto_26999 ?auto_27049 ) ) ( not ( = ?auto_27020 ?auto_27024 ) ) ( not ( = ?auto_27020 ?auto_27023 ) ) ( not ( = ?auto_27020 ?auto_27032 ) ) ( not ( = ?auto_27020 ?auto_27044 ) ) ( not ( = ?auto_27020 ?auto_27047 ) ) ( not ( = ?auto_27017 ?auto_27021 ) ) ( not ( = ?auto_27017 ?auto_27037 ) ) ( not ( = ?auto_27017 ?auto_27034 ) ) ( not ( = ?auto_27017 ?auto_27038 ) ) ( not ( = ?auto_27017 ?auto_27028 ) ) ( not ( = ?auto_27022 ?auto_27051 ) ) ( not ( = ?auto_27022 ?auto_27019 ) ) ( not ( = ?auto_27022 ?auto_27039 ) ) ( not ( = ?auto_27022 ?auto_27029 ) ) ( not ( = ?auto_27022 ?auto_27049 ) ) ( not ( = ?auto_26994 ?auto_27003 ) ) ( not ( = ?auto_26994 ?auto_27041 ) ) ( not ( = ?auto_26995 ?auto_27003 ) ) ( not ( = ?auto_26995 ?auto_27041 ) ) ( not ( = ?auto_26996 ?auto_27003 ) ) ( not ( = ?auto_26996 ?auto_27041 ) ) ( not ( = ?auto_26997 ?auto_27003 ) ) ( not ( = ?auto_26997 ?auto_27041 ) ) ( not ( = ?auto_26998 ?auto_27003 ) ) ( not ( = ?auto_26998 ?auto_27041 ) ) ( not ( = ?auto_27001 ?auto_27003 ) ) ( not ( = ?auto_27001 ?auto_27041 ) ) ( not ( = ?auto_27003 ?auto_27022 ) ) ( not ( = ?auto_27003 ?auto_27051 ) ) ( not ( = ?auto_27003 ?auto_27019 ) ) ( not ( = ?auto_27003 ?auto_27039 ) ) ( not ( = ?auto_27003 ?auto_27029 ) ) ( not ( = ?auto_27003 ?auto_27049 ) ) ( not ( = ?auto_27025 ?auto_27020 ) ) ( not ( = ?auto_27025 ?auto_27024 ) ) ( not ( = ?auto_27025 ?auto_27023 ) ) ( not ( = ?auto_27025 ?auto_27032 ) ) ( not ( = ?auto_27025 ?auto_27044 ) ) ( not ( = ?auto_27025 ?auto_27047 ) ) ( not ( = ?auto_27045 ?auto_27017 ) ) ( not ( = ?auto_27045 ?auto_27021 ) ) ( not ( = ?auto_27045 ?auto_27037 ) ) ( not ( = ?auto_27045 ?auto_27034 ) ) ( not ( = ?auto_27045 ?auto_27038 ) ) ( not ( = ?auto_27045 ?auto_27028 ) ) ( not ( = ?auto_27041 ?auto_27022 ) ) ( not ( = ?auto_27041 ?auto_27051 ) ) ( not ( = ?auto_27041 ?auto_27019 ) ) ( not ( = ?auto_27041 ?auto_27039 ) ) ( not ( = ?auto_27041 ?auto_27029 ) ) ( not ( = ?auto_27041 ?auto_27049 ) ) ( not ( = ?auto_26994 ?auto_27002 ) ) ( not ( = ?auto_26994 ?auto_27018 ) ) ( not ( = ?auto_26995 ?auto_27002 ) ) ( not ( = ?auto_26995 ?auto_27018 ) ) ( not ( = ?auto_26996 ?auto_27002 ) ) ( not ( = ?auto_26996 ?auto_27018 ) ) ( not ( = ?auto_26997 ?auto_27002 ) ) ( not ( = ?auto_26997 ?auto_27018 ) ) ( not ( = ?auto_26998 ?auto_27002 ) ) ( not ( = ?auto_26998 ?auto_27018 ) ) ( not ( = ?auto_27001 ?auto_27002 ) ) ( not ( = ?auto_27001 ?auto_27018 ) ) ( not ( = ?auto_26999 ?auto_27002 ) ) ( not ( = ?auto_26999 ?auto_27018 ) ) ( not ( = ?auto_27002 ?auto_27041 ) ) ( not ( = ?auto_27002 ?auto_27022 ) ) ( not ( = ?auto_27002 ?auto_27051 ) ) ( not ( = ?auto_27002 ?auto_27019 ) ) ( not ( = ?auto_27002 ?auto_27039 ) ) ( not ( = ?auto_27002 ?auto_27029 ) ) ( not ( = ?auto_27002 ?auto_27049 ) ) ( not ( = ?auto_27018 ?auto_27041 ) ) ( not ( = ?auto_27018 ?auto_27022 ) ) ( not ( = ?auto_27018 ?auto_27051 ) ) ( not ( = ?auto_27018 ?auto_27019 ) ) ( not ( = ?auto_27018 ?auto_27039 ) ) ( not ( = ?auto_27018 ?auto_27029 ) ) ( not ( = ?auto_27018 ?auto_27049 ) ) ( not ( = ?auto_26994 ?auto_27000 ) ) ( not ( = ?auto_26994 ?auto_27031 ) ) ( not ( = ?auto_26995 ?auto_27000 ) ) ( not ( = ?auto_26995 ?auto_27031 ) ) ( not ( = ?auto_26996 ?auto_27000 ) ) ( not ( = ?auto_26996 ?auto_27031 ) ) ( not ( = ?auto_26997 ?auto_27000 ) ) ( not ( = ?auto_26997 ?auto_27031 ) ) ( not ( = ?auto_26998 ?auto_27000 ) ) ( not ( = ?auto_26998 ?auto_27031 ) ) ( not ( = ?auto_27001 ?auto_27000 ) ) ( not ( = ?auto_27001 ?auto_27031 ) ) ( not ( = ?auto_26999 ?auto_27000 ) ) ( not ( = ?auto_26999 ?auto_27031 ) ) ( not ( = ?auto_27003 ?auto_27000 ) ) ( not ( = ?auto_27003 ?auto_27031 ) ) ( not ( = ?auto_27000 ?auto_27018 ) ) ( not ( = ?auto_27000 ?auto_27041 ) ) ( not ( = ?auto_27000 ?auto_27022 ) ) ( not ( = ?auto_27000 ?auto_27051 ) ) ( not ( = ?auto_27000 ?auto_27019 ) ) ( not ( = ?auto_27000 ?auto_27039 ) ) ( not ( = ?auto_27000 ?auto_27029 ) ) ( not ( = ?auto_27000 ?auto_27049 ) ) ( not ( = ?auto_27031 ?auto_27018 ) ) ( not ( = ?auto_27031 ?auto_27041 ) ) ( not ( = ?auto_27031 ?auto_27022 ) ) ( not ( = ?auto_27031 ?auto_27051 ) ) ( not ( = ?auto_27031 ?auto_27019 ) ) ( not ( = ?auto_27031 ?auto_27039 ) ) ( not ( = ?auto_27031 ?auto_27029 ) ) ( not ( = ?auto_27031 ?auto_27049 ) ) ( not ( = ?auto_26994 ?auto_27005 ) ) ( not ( = ?auto_26994 ?auto_27027 ) ) ( not ( = ?auto_26995 ?auto_27005 ) ) ( not ( = ?auto_26995 ?auto_27027 ) ) ( not ( = ?auto_26996 ?auto_27005 ) ) ( not ( = ?auto_26996 ?auto_27027 ) ) ( not ( = ?auto_26997 ?auto_27005 ) ) ( not ( = ?auto_26997 ?auto_27027 ) ) ( not ( = ?auto_26998 ?auto_27005 ) ) ( not ( = ?auto_26998 ?auto_27027 ) ) ( not ( = ?auto_27001 ?auto_27005 ) ) ( not ( = ?auto_27001 ?auto_27027 ) ) ( not ( = ?auto_26999 ?auto_27005 ) ) ( not ( = ?auto_26999 ?auto_27027 ) ) ( not ( = ?auto_27003 ?auto_27005 ) ) ( not ( = ?auto_27003 ?auto_27027 ) ) ( not ( = ?auto_27002 ?auto_27005 ) ) ( not ( = ?auto_27002 ?auto_27027 ) ) ( not ( = ?auto_27005 ?auto_27031 ) ) ( not ( = ?auto_27005 ?auto_27018 ) ) ( not ( = ?auto_27005 ?auto_27041 ) ) ( not ( = ?auto_27005 ?auto_27022 ) ) ( not ( = ?auto_27005 ?auto_27051 ) ) ( not ( = ?auto_27005 ?auto_27019 ) ) ( not ( = ?auto_27005 ?auto_27039 ) ) ( not ( = ?auto_27005 ?auto_27029 ) ) ( not ( = ?auto_27005 ?auto_27049 ) ) ( not ( = ?auto_27035 ?auto_27023 ) ) ( not ( = ?auto_27035 ?auto_27025 ) ) ( not ( = ?auto_27035 ?auto_27020 ) ) ( not ( = ?auto_27035 ?auto_27024 ) ) ( not ( = ?auto_27035 ?auto_27032 ) ) ( not ( = ?auto_27035 ?auto_27044 ) ) ( not ( = ?auto_27035 ?auto_27047 ) ) ( not ( = ?auto_27030 ?auto_27037 ) ) ( not ( = ?auto_27030 ?auto_27045 ) ) ( not ( = ?auto_27030 ?auto_27017 ) ) ( not ( = ?auto_27030 ?auto_27021 ) ) ( not ( = ?auto_27030 ?auto_27034 ) ) ( not ( = ?auto_27030 ?auto_27038 ) ) ( not ( = ?auto_27030 ?auto_27028 ) ) ( not ( = ?auto_27027 ?auto_27031 ) ) ( not ( = ?auto_27027 ?auto_27018 ) ) ( not ( = ?auto_27027 ?auto_27041 ) ) ( not ( = ?auto_27027 ?auto_27022 ) ) ( not ( = ?auto_27027 ?auto_27051 ) ) ( not ( = ?auto_27027 ?auto_27019 ) ) ( not ( = ?auto_27027 ?auto_27039 ) ) ( not ( = ?auto_27027 ?auto_27029 ) ) ( not ( = ?auto_27027 ?auto_27049 ) ) ( not ( = ?auto_26994 ?auto_27004 ) ) ( not ( = ?auto_26994 ?auto_27046 ) ) ( not ( = ?auto_26995 ?auto_27004 ) ) ( not ( = ?auto_26995 ?auto_27046 ) ) ( not ( = ?auto_26996 ?auto_27004 ) ) ( not ( = ?auto_26996 ?auto_27046 ) ) ( not ( = ?auto_26997 ?auto_27004 ) ) ( not ( = ?auto_26997 ?auto_27046 ) ) ( not ( = ?auto_26998 ?auto_27004 ) ) ( not ( = ?auto_26998 ?auto_27046 ) ) ( not ( = ?auto_27001 ?auto_27004 ) ) ( not ( = ?auto_27001 ?auto_27046 ) ) ( not ( = ?auto_26999 ?auto_27004 ) ) ( not ( = ?auto_26999 ?auto_27046 ) ) ( not ( = ?auto_27003 ?auto_27004 ) ) ( not ( = ?auto_27003 ?auto_27046 ) ) ( not ( = ?auto_27002 ?auto_27004 ) ) ( not ( = ?auto_27002 ?auto_27046 ) ) ( not ( = ?auto_27000 ?auto_27004 ) ) ( not ( = ?auto_27000 ?auto_27046 ) ) ( not ( = ?auto_27004 ?auto_27027 ) ) ( not ( = ?auto_27004 ?auto_27031 ) ) ( not ( = ?auto_27004 ?auto_27018 ) ) ( not ( = ?auto_27004 ?auto_27041 ) ) ( not ( = ?auto_27004 ?auto_27022 ) ) ( not ( = ?auto_27004 ?auto_27051 ) ) ( not ( = ?auto_27004 ?auto_27019 ) ) ( not ( = ?auto_27004 ?auto_27039 ) ) ( not ( = ?auto_27004 ?auto_27029 ) ) ( not ( = ?auto_27004 ?auto_27049 ) ) ( not ( = ?auto_27016 ?auto_27035 ) ) ( not ( = ?auto_27016 ?auto_27023 ) ) ( not ( = ?auto_27016 ?auto_27025 ) ) ( not ( = ?auto_27016 ?auto_27020 ) ) ( not ( = ?auto_27016 ?auto_27024 ) ) ( not ( = ?auto_27016 ?auto_27032 ) ) ( not ( = ?auto_27016 ?auto_27044 ) ) ( not ( = ?auto_27016 ?auto_27047 ) ) ( not ( = ?auto_27014 ?auto_27030 ) ) ( not ( = ?auto_27014 ?auto_27037 ) ) ( not ( = ?auto_27014 ?auto_27045 ) ) ( not ( = ?auto_27014 ?auto_27017 ) ) ( not ( = ?auto_27014 ?auto_27021 ) ) ( not ( = ?auto_27014 ?auto_27034 ) ) ( not ( = ?auto_27014 ?auto_27038 ) ) ( not ( = ?auto_27014 ?auto_27028 ) ) ( not ( = ?auto_27046 ?auto_27027 ) ) ( not ( = ?auto_27046 ?auto_27031 ) ) ( not ( = ?auto_27046 ?auto_27018 ) ) ( not ( = ?auto_27046 ?auto_27041 ) ) ( not ( = ?auto_27046 ?auto_27022 ) ) ( not ( = ?auto_27046 ?auto_27051 ) ) ( not ( = ?auto_27046 ?auto_27019 ) ) ( not ( = ?auto_27046 ?auto_27039 ) ) ( not ( = ?auto_27046 ?auto_27029 ) ) ( not ( = ?auto_27046 ?auto_27049 ) ) ( not ( = ?auto_26994 ?auto_27006 ) ) ( not ( = ?auto_26994 ?auto_27036 ) ) ( not ( = ?auto_26995 ?auto_27006 ) ) ( not ( = ?auto_26995 ?auto_27036 ) ) ( not ( = ?auto_26996 ?auto_27006 ) ) ( not ( = ?auto_26996 ?auto_27036 ) ) ( not ( = ?auto_26997 ?auto_27006 ) ) ( not ( = ?auto_26997 ?auto_27036 ) ) ( not ( = ?auto_26998 ?auto_27006 ) ) ( not ( = ?auto_26998 ?auto_27036 ) ) ( not ( = ?auto_27001 ?auto_27006 ) ) ( not ( = ?auto_27001 ?auto_27036 ) ) ( not ( = ?auto_26999 ?auto_27006 ) ) ( not ( = ?auto_26999 ?auto_27036 ) ) ( not ( = ?auto_27003 ?auto_27006 ) ) ( not ( = ?auto_27003 ?auto_27036 ) ) ( not ( = ?auto_27002 ?auto_27006 ) ) ( not ( = ?auto_27002 ?auto_27036 ) ) ( not ( = ?auto_27000 ?auto_27006 ) ) ( not ( = ?auto_27000 ?auto_27036 ) ) ( not ( = ?auto_27005 ?auto_27006 ) ) ( not ( = ?auto_27005 ?auto_27036 ) ) ( not ( = ?auto_27006 ?auto_27046 ) ) ( not ( = ?auto_27006 ?auto_27027 ) ) ( not ( = ?auto_27006 ?auto_27031 ) ) ( not ( = ?auto_27006 ?auto_27018 ) ) ( not ( = ?auto_27006 ?auto_27041 ) ) ( not ( = ?auto_27006 ?auto_27022 ) ) ( not ( = ?auto_27006 ?auto_27051 ) ) ( not ( = ?auto_27006 ?auto_27019 ) ) ( not ( = ?auto_27006 ?auto_27039 ) ) ( not ( = ?auto_27006 ?auto_27029 ) ) ( not ( = ?auto_27006 ?auto_27049 ) ) ( not ( = ?auto_27050 ?auto_27016 ) ) ( not ( = ?auto_27050 ?auto_27035 ) ) ( not ( = ?auto_27050 ?auto_27023 ) ) ( not ( = ?auto_27050 ?auto_27025 ) ) ( not ( = ?auto_27050 ?auto_27020 ) ) ( not ( = ?auto_27050 ?auto_27024 ) ) ( not ( = ?auto_27050 ?auto_27032 ) ) ( not ( = ?auto_27050 ?auto_27044 ) ) ( not ( = ?auto_27050 ?auto_27047 ) ) ( not ( = ?auto_27040 ?auto_27014 ) ) ( not ( = ?auto_27040 ?auto_27030 ) ) ( not ( = ?auto_27040 ?auto_27037 ) ) ( not ( = ?auto_27040 ?auto_27045 ) ) ( not ( = ?auto_27040 ?auto_27017 ) ) ( not ( = ?auto_27040 ?auto_27021 ) ) ( not ( = ?auto_27040 ?auto_27034 ) ) ( not ( = ?auto_27040 ?auto_27038 ) ) ( not ( = ?auto_27040 ?auto_27028 ) ) ( not ( = ?auto_27036 ?auto_27046 ) ) ( not ( = ?auto_27036 ?auto_27027 ) ) ( not ( = ?auto_27036 ?auto_27031 ) ) ( not ( = ?auto_27036 ?auto_27018 ) ) ( not ( = ?auto_27036 ?auto_27041 ) ) ( not ( = ?auto_27036 ?auto_27022 ) ) ( not ( = ?auto_27036 ?auto_27051 ) ) ( not ( = ?auto_27036 ?auto_27019 ) ) ( not ( = ?auto_27036 ?auto_27039 ) ) ( not ( = ?auto_27036 ?auto_27029 ) ) ( not ( = ?auto_27036 ?auto_27049 ) ) ( not ( = ?auto_26994 ?auto_27008 ) ) ( not ( = ?auto_26994 ?auto_27042 ) ) ( not ( = ?auto_26995 ?auto_27008 ) ) ( not ( = ?auto_26995 ?auto_27042 ) ) ( not ( = ?auto_26996 ?auto_27008 ) ) ( not ( = ?auto_26996 ?auto_27042 ) ) ( not ( = ?auto_26997 ?auto_27008 ) ) ( not ( = ?auto_26997 ?auto_27042 ) ) ( not ( = ?auto_26998 ?auto_27008 ) ) ( not ( = ?auto_26998 ?auto_27042 ) ) ( not ( = ?auto_27001 ?auto_27008 ) ) ( not ( = ?auto_27001 ?auto_27042 ) ) ( not ( = ?auto_26999 ?auto_27008 ) ) ( not ( = ?auto_26999 ?auto_27042 ) ) ( not ( = ?auto_27003 ?auto_27008 ) ) ( not ( = ?auto_27003 ?auto_27042 ) ) ( not ( = ?auto_27002 ?auto_27008 ) ) ( not ( = ?auto_27002 ?auto_27042 ) ) ( not ( = ?auto_27000 ?auto_27008 ) ) ( not ( = ?auto_27000 ?auto_27042 ) ) ( not ( = ?auto_27005 ?auto_27008 ) ) ( not ( = ?auto_27005 ?auto_27042 ) ) ( not ( = ?auto_27004 ?auto_27008 ) ) ( not ( = ?auto_27004 ?auto_27042 ) ) ( not ( = ?auto_27008 ?auto_27036 ) ) ( not ( = ?auto_27008 ?auto_27046 ) ) ( not ( = ?auto_27008 ?auto_27027 ) ) ( not ( = ?auto_27008 ?auto_27031 ) ) ( not ( = ?auto_27008 ?auto_27018 ) ) ( not ( = ?auto_27008 ?auto_27041 ) ) ( not ( = ?auto_27008 ?auto_27022 ) ) ( not ( = ?auto_27008 ?auto_27051 ) ) ( not ( = ?auto_27008 ?auto_27019 ) ) ( not ( = ?auto_27008 ?auto_27039 ) ) ( not ( = ?auto_27008 ?auto_27029 ) ) ( not ( = ?auto_27008 ?auto_27049 ) ) ( not ( = ?auto_27033 ?auto_27050 ) ) ( not ( = ?auto_27033 ?auto_27016 ) ) ( not ( = ?auto_27033 ?auto_27035 ) ) ( not ( = ?auto_27033 ?auto_27023 ) ) ( not ( = ?auto_27033 ?auto_27025 ) ) ( not ( = ?auto_27033 ?auto_27020 ) ) ( not ( = ?auto_27033 ?auto_27024 ) ) ( not ( = ?auto_27033 ?auto_27032 ) ) ( not ( = ?auto_27033 ?auto_27044 ) ) ( not ( = ?auto_27033 ?auto_27047 ) ) ( not ( = ?auto_27043 ?auto_27040 ) ) ( not ( = ?auto_27043 ?auto_27014 ) ) ( not ( = ?auto_27043 ?auto_27030 ) ) ( not ( = ?auto_27043 ?auto_27037 ) ) ( not ( = ?auto_27043 ?auto_27045 ) ) ( not ( = ?auto_27043 ?auto_27017 ) ) ( not ( = ?auto_27043 ?auto_27021 ) ) ( not ( = ?auto_27043 ?auto_27034 ) ) ( not ( = ?auto_27043 ?auto_27038 ) ) ( not ( = ?auto_27043 ?auto_27028 ) ) ( not ( = ?auto_27042 ?auto_27036 ) ) ( not ( = ?auto_27042 ?auto_27046 ) ) ( not ( = ?auto_27042 ?auto_27027 ) ) ( not ( = ?auto_27042 ?auto_27031 ) ) ( not ( = ?auto_27042 ?auto_27018 ) ) ( not ( = ?auto_27042 ?auto_27041 ) ) ( not ( = ?auto_27042 ?auto_27022 ) ) ( not ( = ?auto_27042 ?auto_27051 ) ) ( not ( = ?auto_27042 ?auto_27019 ) ) ( not ( = ?auto_27042 ?auto_27039 ) ) ( not ( = ?auto_27042 ?auto_27029 ) ) ( not ( = ?auto_27042 ?auto_27049 ) ) ( not ( = ?auto_26994 ?auto_27009 ) ) ( not ( = ?auto_26994 ?auto_27026 ) ) ( not ( = ?auto_26995 ?auto_27009 ) ) ( not ( = ?auto_26995 ?auto_27026 ) ) ( not ( = ?auto_26996 ?auto_27009 ) ) ( not ( = ?auto_26996 ?auto_27026 ) ) ( not ( = ?auto_26997 ?auto_27009 ) ) ( not ( = ?auto_26997 ?auto_27026 ) ) ( not ( = ?auto_26998 ?auto_27009 ) ) ( not ( = ?auto_26998 ?auto_27026 ) ) ( not ( = ?auto_27001 ?auto_27009 ) ) ( not ( = ?auto_27001 ?auto_27026 ) ) ( not ( = ?auto_26999 ?auto_27009 ) ) ( not ( = ?auto_26999 ?auto_27026 ) ) ( not ( = ?auto_27003 ?auto_27009 ) ) ( not ( = ?auto_27003 ?auto_27026 ) ) ( not ( = ?auto_27002 ?auto_27009 ) ) ( not ( = ?auto_27002 ?auto_27026 ) ) ( not ( = ?auto_27000 ?auto_27009 ) ) ( not ( = ?auto_27000 ?auto_27026 ) ) ( not ( = ?auto_27005 ?auto_27009 ) ) ( not ( = ?auto_27005 ?auto_27026 ) ) ( not ( = ?auto_27004 ?auto_27009 ) ) ( not ( = ?auto_27004 ?auto_27026 ) ) ( not ( = ?auto_27006 ?auto_27009 ) ) ( not ( = ?auto_27006 ?auto_27026 ) ) ( not ( = ?auto_27009 ?auto_27042 ) ) ( not ( = ?auto_27009 ?auto_27036 ) ) ( not ( = ?auto_27009 ?auto_27046 ) ) ( not ( = ?auto_27009 ?auto_27027 ) ) ( not ( = ?auto_27009 ?auto_27031 ) ) ( not ( = ?auto_27009 ?auto_27018 ) ) ( not ( = ?auto_27009 ?auto_27041 ) ) ( not ( = ?auto_27009 ?auto_27022 ) ) ( not ( = ?auto_27009 ?auto_27051 ) ) ( not ( = ?auto_27009 ?auto_27019 ) ) ( not ( = ?auto_27009 ?auto_27039 ) ) ( not ( = ?auto_27009 ?auto_27029 ) ) ( not ( = ?auto_27009 ?auto_27049 ) ) ( not ( = ?auto_27026 ?auto_27042 ) ) ( not ( = ?auto_27026 ?auto_27036 ) ) ( not ( = ?auto_27026 ?auto_27046 ) ) ( not ( = ?auto_27026 ?auto_27027 ) ) ( not ( = ?auto_27026 ?auto_27031 ) ) ( not ( = ?auto_27026 ?auto_27018 ) ) ( not ( = ?auto_27026 ?auto_27041 ) ) ( not ( = ?auto_27026 ?auto_27022 ) ) ( not ( = ?auto_27026 ?auto_27051 ) ) ( not ( = ?auto_27026 ?auto_27019 ) ) ( not ( = ?auto_27026 ?auto_27039 ) ) ( not ( = ?auto_27026 ?auto_27029 ) ) ( not ( = ?auto_27026 ?auto_27049 ) ) ( not ( = ?auto_26994 ?auto_27007 ) ) ( not ( = ?auto_26994 ?auto_27048 ) ) ( not ( = ?auto_26995 ?auto_27007 ) ) ( not ( = ?auto_26995 ?auto_27048 ) ) ( not ( = ?auto_26996 ?auto_27007 ) ) ( not ( = ?auto_26996 ?auto_27048 ) ) ( not ( = ?auto_26997 ?auto_27007 ) ) ( not ( = ?auto_26997 ?auto_27048 ) ) ( not ( = ?auto_26998 ?auto_27007 ) ) ( not ( = ?auto_26998 ?auto_27048 ) ) ( not ( = ?auto_27001 ?auto_27007 ) ) ( not ( = ?auto_27001 ?auto_27048 ) ) ( not ( = ?auto_26999 ?auto_27007 ) ) ( not ( = ?auto_26999 ?auto_27048 ) ) ( not ( = ?auto_27003 ?auto_27007 ) ) ( not ( = ?auto_27003 ?auto_27048 ) ) ( not ( = ?auto_27002 ?auto_27007 ) ) ( not ( = ?auto_27002 ?auto_27048 ) ) ( not ( = ?auto_27000 ?auto_27007 ) ) ( not ( = ?auto_27000 ?auto_27048 ) ) ( not ( = ?auto_27005 ?auto_27007 ) ) ( not ( = ?auto_27005 ?auto_27048 ) ) ( not ( = ?auto_27004 ?auto_27007 ) ) ( not ( = ?auto_27004 ?auto_27048 ) ) ( not ( = ?auto_27006 ?auto_27007 ) ) ( not ( = ?auto_27006 ?auto_27048 ) ) ( not ( = ?auto_27008 ?auto_27007 ) ) ( not ( = ?auto_27008 ?auto_27048 ) ) ( not ( = ?auto_27007 ?auto_27026 ) ) ( not ( = ?auto_27007 ?auto_27042 ) ) ( not ( = ?auto_27007 ?auto_27036 ) ) ( not ( = ?auto_27007 ?auto_27046 ) ) ( not ( = ?auto_27007 ?auto_27027 ) ) ( not ( = ?auto_27007 ?auto_27031 ) ) ( not ( = ?auto_27007 ?auto_27018 ) ) ( not ( = ?auto_27007 ?auto_27041 ) ) ( not ( = ?auto_27007 ?auto_27022 ) ) ( not ( = ?auto_27007 ?auto_27051 ) ) ( not ( = ?auto_27007 ?auto_27019 ) ) ( not ( = ?auto_27007 ?auto_27039 ) ) ( not ( = ?auto_27007 ?auto_27029 ) ) ( not ( = ?auto_27007 ?auto_27049 ) ) ( not ( = ?auto_27048 ?auto_27026 ) ) ( not ( = ?auto_27048 ?auto_27042 ) ) ( not ( = ?auto_27048 ?auto_27036 ) ) ( not ( = ?auto_27048 ?auto_27046 ) ) ( not ( = ?auto_27048 ?auto_27027 ) ) ( not ( = ?auto_27048 ?auto_27031 ) ) ( not ( = ?auto_27048 ?auto_27018 ) ) ( not ( = ?auto_27048 ?auto_27041 ) ) ( not ( = ?auto_27048 ?auto_27022 ) ) ( not ( = ?auto_27048 ?auto_27051 ) ) ( not ( = ?auto_27048 ?auto_27019 ) ) ( not ( = ?auto_27048 ?auto_27039 ) ) ( not ( = ?auto_27048 ?auto_27029 ) ) ( not ( = ?auto_27048 ?auto_27049 ) ) ( not ( = ?auto_26994 ?auto_27010 ) ) ( not ( = ?auto_26994 ?auto_27015 ) ) ( not ( = ?auto_26995 ?auto_27010 ) ) ( not ( = ?auto_26995 ?auto_27015 ) ) ( not ( = ?auto_26996 ?auto_27010 ) ) ( not ( = ?auto_26996 ?auto_27015 ) ) ( not ( = ?auto_26997 ?auto_27010 ) ) ( not ( = ?auto_26997 ?auto_27015 ) ) ( not ( = ?auto_26998 ?auto_27010 ) ) ( not ( = ?auto_26998 ?auto_27015 ) ) ( not ( = ?auto_27001 ?auto_27010 ) ) ( not ( = ?auto_27001 ?auto_27015 ) ) ( not ( = ?auto_26999 ?auto_27010 ) ) ( not ( = ?auto_26999 ?auto_27015 ) ) ( not ( = ?auto_27003 ?auto_27010 ) ) ( not ( = ?auto_27003 ?auto_27015 ) ) ( not ( = ?auto_27002 ?auto_27010 ) ) ( not ( = ?auto_27002 ?auto_27015 ) ) ( not ( = ?auto_27000 ?auto_27010 ) ) ( not ( = ?auto_27000 ?auto_27015 ) ) ( not ( = ?auto_27005 ?auto_27010 ) ) ( not ( = ?auto_27005 ?auto_27015 ) ) ( not ( = ?auto_27004 ?auto_27010 ) ) ( not ( = ?auto_27004 ?auto_27015 ) ) ( not ( = ?auto_27006 ?auto_27010 ) ) ( not ( = ?auto_27006 ?auto_27015 ) ) ( not ( = ?auto_27008 ?auto_27010 ) ) ( not ( = ?auto_27008 ?auto_27015 ) ) ( not ( = ?auto_27009 ?auto_27010 ) ) ( not ( = ?auto_27009 ?auto_27015 ) ) ( not ( = ?auto_27010 ?auto_27048 ) ) ( not ( = ?auto_27010 ?auto_27026 ) ) ( not ( = ?auto_27010 ?auto_27042 ) ) ( not ( = ?auto_27010 ?auto_27036 ) ) ( not ( = ?auto_27010 ?auto_27046 ) ) ( not ( = ?auto_27010 ?auto_27027 ) ) ( not ( = ?auto_27010 ?auto_27031 ) ) ( not ( = ?auto_27010 ?auto_27018 ) ) ( not ( = ?auto_27010 ?auto_27041 ) ) ( not ( = ?auto_27010 ?auto_27022 ) ) ( not ( = ?auto_27010 ?auto_27051 ) ) ( not ( = ?auto_27010 ?auto_27019 ) ) ( not ( = ?auto_27010 ?auto_27039 ) ) ( not ( = ?auto_27010 ?auto_27029 ) ) ( not ( = ?auto_27010 ?auto_27049 ) ) ( not ( = ?auto_27015 ?auto_27048 ) ) ( not ( = ?auto_27015 ?auto_27026 ) ) ( not ( = ?auto_27015 ?auto_27042 ) ) ( not ( = ?auto_27015 ?auto_27036 ) ) ( not ( = ?auto_27015 ?auto_27046 ) ) ( not ( = ?auto_27015 ?auto_27027 ) ) ( not ( = ?auto_27015 ?auto_27031 ) ) ( not ( = ?auto_27015 ?auto_27018 ) ) ( not ( = ?auto_27015 ?auto_27041 ) ) ( not ( = ?auto_27015 ?auto_27022 ) ) ( not ( = ?auto_27015 ?auto_27051 ) ) ( not ( = ?auto_27015 ?auto_27019 ) ) ( not ( = ?auto_27015 ?auto_27039 ) ) ( not ( = ?auto_27015 ?auto_27029 ) ) ( not ( = ?auto_27015 ?auto_27049 ) ) )
    :subtasks
    ( ( MAKE-15CRATE ?auto_26994 ?auto_26995 ?auto_26996 ?auto_26997 ?auto_26998 ?auto_27001 ?auto_26999 ?auto_27003 ?auto_27002 ?auto_27000 ?auto_27005 ?auto_27004 ?auto_27006 ?auto_27008 ?auto_27009 ?auto_27007 )
      ( MAKE-1CRATE ?auto_27007 ?auto_27010 )
      ( MAKE-16CRATE-VERIFY ?auto_26994 ?auto_26995 ?auto_26996 ?auto_26997 ?auto_26998 ?auto_27001 ?auto_26999 ?auto_27003 ?auto_27002 ?auto_27000 ?auto_27005 ?auto_27004 ?auto_27006 ?auto_27008 ?auto_27009 ?auto_27007 ?auto_27010 ) )
  )

)

