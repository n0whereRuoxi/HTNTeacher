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
      ?auto_1809148 - SURFACE
      ?auto_1809149 - SURFACE
    )
    :vars
    (
      ?auto_1809150 - HOIST
      ?auto_1809151 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809150 ?auto_1809151 ) ( SURFACE-AT ?auto_1809148 ?auto_1809151 ) ( CLEAR ?auto_1809148 ) ( LIFTING ?auto_1809150 ?auto_1809149 ) ( IS-CRATE ?auto_1809149 ) ( not ( = ?auto_1809148 ?auto_1809149 ) ) )
    :subtasks
    ( ( !DROP ?auto_1809150 ?auto_1809149 ?auto_1809148 ?auto_1809151 )
      ( MAKE-1CRATE-VERIFY ?auto_1809148 ?auto_1809149 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1809152 - SURFACE
      ?auto_1809153 - SURFACE
    )
    :vars
    (
      ?auto_1809154 - HOIST
      ?auto_1809155 - PLACE
      ?auto_1809156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809154 ?auto_1809155 ) ( SURFACE-AT ?auto_1809152 ?auto_1809155 ) ( CLEAR ?auto_1809152 ) ( IS-CRATE ?auto_1809153 ) ( not ( = ?auto_1809152 ?auto_1809153 ) ) ( TRUCK-AT ?auto_1809156 ?auto_1809155 ) ( AVAILABLE ?auto_1809154 ) ( IN ?auto_1809153 ?auto_1809156 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1809154 ?auto_1809153 ?auto_1809156 ?auto_1809155 )
      ( MAKE-1CRATE ?auto_1809152 ?auto_1809153 )
      ( MAKE-1CRATE-VERIFY ?auto_1809152 ?auto_1809153 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1809157 - SURFACE
      ?auto_1809158 - SURFACE
    )
    :vars
    (
      ?auto_1809161 - HOIST
      ?auto_1809160 - PLACE
      ?auto_1809159 - TRUCK
      ?auto_1809162 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809161 ?auto_1809160 ) ( SURFACE-AT ?auto_1809157 ?auto_1809160 ) ( CLEAR ?auto_1809157 ) ( IS-CRATE ?auto_1809158 ) ( not ( = ?auto_1809157 ?auto_1809158 ) ) ( AVAILABLE ?auto_1809161 ) ( IN ?auto_1809158 ?auto_1809159 ) ( TRUCK-AT ?auto_1809159 ?auto_1809162 ) ( not ( = ?auto_1809162 ?auto_1809160 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1809159 ?auto_1809162 ?auto_1809160 )
      ( MAKE-1CRATE ?auto_1809157 ?auto_1809158 )
      ( MAKE-1CRATE-VERIFY ?auto_1809157 ?auto_1809158 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1809163 - SURFACE
      ?auto_1809164 - SURFACE
    )
    :vars
    (
      ?auto_1809165 - HOIST
      ?auto_1809168 - PLACE
      ?auto_1809166 - TRUCK
      ?auto_1809167 - PLACE
      ?auto_1809169 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809165 ?auto_1809168 ) ( SURFACE-AT ?auto_1809163 ?auto_1809168 ) ( CLEAR ?auto_1809163 ) ( IS-CRATE ?auto_1809164 ) ( not ( = ?auto_1809163 ?auto_1809164 ) ) ( AVAILABLE ?auto_1809165 ) ( TRUCK-AT ?auto_1809166 ?auto_1809167 ) ( not ( = ?auto_1809167 ?auto_1809168 ) ) ( HOIST-AT ?auto_1809169 ?auto_1809167 ) ( LIFTING ?auto_1809169 ?auto_1809164 ) ( not ( = ?auto_1809165 ?auto_1809169 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1809169 ?auto_1809164 ?auto_1809166 ?auto_1809167 )
      ( MAKE-1CRATE ?auto_1809163 ?auto_1809164 )
      ( MAKE-1CRATE-VERIFY ?auto_1809163 ?auto_1809164 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1809170 - SURFACE
      ?auto_1809171 - SURFACE
    )
    :vars
    (
      ?auto_1809176 - HOIST
      ?auto_1809175 - PLACE
      ?auto_1809173 - TRUCK
      ?auto_1809172 - PLACE
      ?auto_1809174 - HOIST
      ?auto_1809177 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809176 ?auto_1809175 ) ( SURFACE-AT ?auto_1809170 ?auto_1809175 ) ( CLEAR ?auto_1809170 ) ( IS-CRATE ?auto_1809171 ) ( not ( = ?auto_1809170 ?auto_1809171 ) ) ( AVAILABLE ?auto_1809176 ) ( TRUCK-AT ?auto_1809173 ?auto_1809172 ) ( not ( = ?auto_1809172 ?auto_1809175 ) ) ( HOIST-AT ?auto_1809174 ?auto_1809172 ) ( not ( = ?auto_1809176 ?auto_1809174 ) ) ( AVAILABLE ?auto_1809174 ) ( SURFACE-AT ?auto_1809171 ?auto_1809172 ) ( ON ?auto_1809171 ?auto_1809177 ) ( CLEAR ?auto_1809171 ) ( not ( = ?auto_1809170 ?auto_1809177 ) ) ( not ( = ?auto_1809171 ?auto_1809177 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1809174 ?auto_1809171 ?auto_1809177 ?auto_1809172 )
      ( MAKE-1CRATE ?auto_1809170 ?auto_1809171 )
      ( MAKE-1CRATE-VERIFY ?auto_1809170 ?auto_1809171 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1809178 - SURFACE
      ?auto_1809179 - SURFACE
    )
    :vars
    (
      ?auto_1809184 - HOIST
      ?auto_1809181 - PLACE
      ?auto_1809180 - PLACE
      ?auto_1809185 - HOIST
      ?auto_1809183 - SURFACE
      ?auto_1809182 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809184 ?auto_1809181 ) ( SURFACE-AT ?auto_1809178 ?auto_1809181 ) ( CLEAR ?auto_1809178 ) ( IS-CRATE ?auto_1809179 ) ( not ( = ?auto_1809178 ?auto_1809179 ) ) ( AVAILABLE ?auto_1809184 ) ( not ( = ?auto_1809180 ?auto_1809181 ) ) ( HOIST-AT ?auto_1809185 ?auto_1809180 ) ( not ( = ?auto_1809184 ?auto_1809185 ) ) ( AVAILABLE ?auto_1809185 ) ( SURFACE-AT ?auto_1809179 ?auto_1809180 ) ( ON ?auto_1809179 ?auto_1809183 ) ( CLEAR ?auto_1809179 ) ( not ( = ?auto_1809178 ?auto_1809183 ) ) ( not ( = ?auto_1809179 ?auto_1809183 ) ) ( TRUCK-AT ?auto_1809182 ?auto_1809181 ) )
    :subtasks
    ( ( !DRIVE ?auto_1809182 ?auto_1809181 ?auto_1809180 )
      ( MAKE-1CRATE ?auto_1809178 ?auto_1809179 )
      ( MAKE-1CRATE-VERIFY ?auto_1809178 ?auto_1809179 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1809195 - SURFACE
      ?auto_1809196 - SURFACE
      ?auto_1809197 - SURFACE
    )
    :vars
    (
      ?auto_1809199 - HOIST
      ?auto_1809198 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809199 ?auto_1809198 ) ( SURFACE-AT ?auto_1809196 ?auto_1809198 ) ( CLEAR ?auto_1809196 ) ( LIFTING ?auto_1809199 ?auto_1809197 ) ( IS-CRATE ?auto_1809197 ) ( not ( = ?auto_1809196 ?auto_1809197 ) ) ( ON ?auto_1809196 ?auto_1809195 ) ( not ( = ?auto_1809195 ?auto_1809196 ) ) ( not ( = ?auto_1809195 ?auto_1809197 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1809196 ?auto_1809197 )
      ( MAKE-2CRATE-VERIFY ?auto_1809195 ?auto_1809196 ?auto_1809197 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1809205 - SURFACE
      ?auto_1809206 - SURFACE
      ?auto_1809207 - SURFACE
    )
    :vars
    (
      ?auto_1809209 - HOIST
      ?auto_1809208 - PLACE
      ?auto_1809210 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809209 ?auto_1809208 ) ( SURFACE-AT ?auto_1809206 ?auto_1809208 ) ( CLEAR ?auto_1809206 ) ( IS-CRATE ?auto_1809207 ) ( not ( = ?auto_1809206 ?auto_1809207 ) ) ( TRUCK-AT ?auto_1809210 ?auto_1809208 ) ( AVAILABLE ?auto_1809209 ) ( IN ?auto_1809207 ?auto_1809210 ) ( ON ?auto_1809206 ?auto_1809205 ) ( not ( = ?auto_1809205 ?auto_1809206 ) ) ( not ( = ?auto_1809205 ?auto_1809207 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1809206 ?auto_1809207 )
      ( MAKE-2CRATE-VERIFY ?auto_1809205 ?auto_1809206 ?auto_1809207 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1809211 - SURFACE
      ?auto_1809212 - SURFACE
    )
    :vars
    (
      ?auto_1809214 - HOIST
      ?auto_1809213 - PLACE
      ?auto_1809215 - TRUCK
      ?auto_1809216 - SURFACE
      ?auto_1809217 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809214 ?auto_1809213 ) ( SURFACE-AT ?auto_1809211 ?auto_1809213 ) ( CLEAR ?auto_1809211 ) ( IS-CRATE ?auto_1809212 ) ( not ( = ?auto_1809211 ?auto_1809212 ) ) ( AVAILABLE ?auto_1809214 ) ( IN ?auto_1809212 ?auto_1809215 ) ( ON ?auto_1809211 ?auto_1809216 ) ( not ( = ?auto_1809216 ?auto_1809211 ) ) ( not ( = ?auto_1809216 ?auto_1809212 ) ) ( TRUCK-AT ?auto_1809215 ?auto_1809217 ) ( not ( = ?auto_1809217 ?auto_1809213 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1809215 ?auto_1809217 ?auto_1809213 )
      ( MAKE-2CRATE ?auto_1809216 ?auto_1809211 ?auto_1809212 )
      ( MAKE-1CRATE-VERIFY ?auto_1809211 ?auto_1809212 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1809218 - SURFACE
      ?auto_1809219 - SURFACE
      ?auto_1809220 - SURFACE
    )
    :vars
    (
      ?auto_1809224 - HOIST
      ?auto_1809222 - PLACE
      ?auto_1809223 - TRUCK
      ?auto_1809221 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809224 ?auto_1809222 ) ( SURFACE-AT ?auto_1809219 ?auto_1809222 ) ( CLEAR ?auto_1809219 ) ( IS-CRATE ?auto_1809220 ) ( not ( = ?auto_1809219 ?auto_1809220 ) ) ( AVAILABLE ?auto_1809224 ) ( IN ?auto_1809220 ?auto_1809223 ) ( ON ?auto_1809219 ?auto_1809218 ) ( not ( = ?auto_1809218 ?auto_1809219 ) ) ( not ( = ?auto_1809218 ?auto_1809220 ) ) ( TRUCK-AT ?auto_1809223 ?auto_1809221 ) ( not ( = ?auto_1809221 ?auto_1809222 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1809219 ?auto_1809220 )
      ( MAKE-2CRATE-VERIFY ?auto_1809218 ?auto_1809219 ?auto_1809220 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1809225 - SURFACE
      ?auto_1809226 - SURFACE
    )
    :vars
    (
      ?auto_1809231 - HOIST
      ?auto_1809229 - PLACE
      ?auto_1809228 - SURFACE
      ?auto_1809230 - TRUCK
      ?auto_1809227 - PLACE
      ?auto_1809232 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809231 ?auto_1809229 ) ( SURFACE-AT ?auto_1809225 ?auto_1809229 ) ( CLEAR ?auto_1809225 ) ( IS-CRATE ?auto_1809226 ) ( not ( = ?auto_1809225 ?auto_1809226 ) ) ( AVAILABLE ?auto_1809231 ) ( ON ?auto_1809225 ?auto_1809228 ) ( not ( = ?auto_1809228 ?auto_1809225 ) ) ( not ( = ?auto_1809228 ?auto_1809226 ) ) ( TRUCK-AT ?auto_1809230 ?auto_1809227 ) ( not ( = ?auto_1809227 ?auto_1809229 ) ) ( HOIST-AT ?auto_1809232 ?auto_1809227 ) ( LIFTING ?auto_1809232 ?auto_1809226 ) ( not ( = ?auto_1809231 ?auto_1809232 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1809232 ?auto_1809226 ?auto_1809230 ?auto_1809227 )
      ( MAKE-2CRATE ?auto_1809228 ?auto_1809225 ?auto_1809226 )
      ( MAKE-1CRATE-VERIFY ?auto_1809225 ?auto_1809226 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1809233 - SURFACE
      ?auto_1809234 - SURFACE
      ?auto_1809235 - SURFACE
    )
    :vars
    (
      ?auto_1809236 - HOIST
      ?auto_1809239 - PLACE
      ?auto_1809240 - TRUCK
      ?auto_1809237 - PLACE
      ?auto_1809238 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809236 ?auto_1809239 ) ( SURFACE-AT ?auto_1809234 ?auto_1809239 ) ( CLEAR ?auto_1809234 ) ( IS-CRATE ?auto_1809235 ) ( not ( = ?auto_1809234 ?auto_1809235 ) ) ( AVAILABLE ?auto_1809236 ) ( ON ?auto_1809234 ?auto_1809233 ) ( not ( = ?auto_1809233 ?auto_1809234 ) ) ( not ( = ?auto_1809233 ?auto_1809235 ) ) ( TRUCK-AT ?auto_1809240 ?auto_1809237 ) ( not ( = ?auto_1809237 ?auto_1809239 ) ) ( HOIST-AT ?auto_1809238 ?auto_1809237 ) ( LIFTING ?auto_1809238 ?auto_1809235 ) ( not ( = ?auto_1809236 ?auto_1809238 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1809234 ?auto_1809235 )
      ( MAKE-2CRATE-VERIFY ?auto_1809233 ?auto_1809234 ?auto_1809235 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1809241 - SURFACE
      ?auto_1809242 - SURFACE
    )
    :vars
    (
      ?auto_1809246 - HOIST
      ?auto_1809243 - PLACE
      ?auto_1809248 - SURFACE
      ?auto_1809247 - TRUCK
      ?auto_1809245 - PLACE
      ?auto_1809244 - HOIST
      ?auto_1809249 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809246 ?auto_1809243 ) ( SURFACE-AT ?auto_1809241 ?auto_1809243 ) ( CLEAR ?auto_1809241 ) ( IS-CRATE ?auto_1809242 ) ( not ( = ?auto_1809241 ?auto_1809242 ) ) ( AVAILABLE ?auto_1809246 ) ( ON ?auto_1809241 ?auto_1809248 ) ( not ( = ?auto_1809248 ?auto_1809241 ) ) ( not ( = ?auto_1809248 ?auto_1809242 ) ) ( TRUCK-AT ?auto_1809247 ?auto_1809245 ) ( not ( = ?auto_1809245 ?auto_1809243 ) ) ( HOIST-AT ?auto_1809244 ?auto_1809245 ) ( not ( = ?auto_1809246 ?auto_1809244 ) ) ( AVAILABLE ?auto_1809244 ) ( SURFACE-AT ?auto_1809242 ?auto_1809245 ) ( ON ?auto_1809242 ?auto_1809249 ) ( CLEAR ?auto_1809242 ) ( not ( = ?auto_1809241 ?auto_1809249 ) ) ( not ( = ?auto_1809242 ?auto_1809249 ) ) ( not ( = ?auto_1809248 ?auto_1809249 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1809244 ?auto_1809242 ?auto_1809249 ?auto_1809245 )
      ( MAKE-2CRATE ?auto_1809248 ?auto_1809241 ?auto_1809242 )
      ( MAKE-1CRATE-VERIFY ?auto_1809241 ?auto_1809242 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1809250 - SURFACE
      ?auto_1809251 - SURFACE
      ?auto_1809252 - SURFACE
    )
    :vars
    (
      ?auto_1809257 - HOIST
      ?auto_1809255 - PLACE
      ?auto_1809254 - TRUCK
      ?auto_1809256 - PLACE
      ?auto_1809253 - HOIST
      ?auto_1809258 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809257 ?auto_1809255 ) ( SURFACE-AT ?auto_1809251 ?auto_1809255 ) ( CLEAR ?auto_1809251 ) ( IS-CRATE ?auto_1809252 ) ( not ( = ?auto_1809251 ?auto_1809252 ) ) ( AVAILABLE ?auto_1809257 ) ( ON ?auto_1809251 ?auto_1809250 ) ( not ( = ?auto_1809250 ?auto_1809251 ) ) ( not ( = ?auto_1809250 ?auto_1809252 ) ) ( TRUCK-AT ?auto_1809254 ?auto_1809256 ) ( not ( = ?auto_1809256 ?auto_1809255 ) ) ( HOIST-AT ?auto_1809253 ?auto_1809256 ) ( not ( = ?auto_1809257 ?auto_1809253 ) ) ( AVAILABLE ?auto_1809253 ) ( SURFACE-AT ?auto_1809252 ?auto_1809256 ) ( ON ?auto_1809252 ?auto_1809258 ) ( CLEAR ?auto_1809252 ) ( not ( = ?auto_1809251 ?auto_1809258 ) ) ( not ( = ?auto_1809252 ?auto_1809258 ) ) ( not ( = ?auto_1809250 ?auto_1809258 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1809251 ?auto_1809252 )
      ( MAKE-2CRATE-VERIFY ?auto_1809250 ?auto_1809251 ?auto_1809252 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1809259 - SURFACE
      ?auto_1809260 - SURFACE
    )
    :vars
    (
      ?auto_1809267 - HOIST
      ?auto_1809262 - PLACE
      ?auto_1809265 - SURFACE
      ?auto_1809261 - PLACE
      ?auto_1809264 - HOIST
      ?auto_1809263 - SURFACE
      ?auto_1809266 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809267 ?auto_1809262 ) ( SURFACE-AT ?auto_1809259 ?auto_1809262 ) ( CLEAR ?auto_1809259 ) ( IS-CRATE ?auto_1809260 ) ( not ( = ?auto_1809259 ?auto_1809260 ) ) ( AVAILABLE ?auto_1809267 ) ( ON ?auto_1809259 ?auto_1809265 ) ( not ( = ?auto_1809265 ?auto_1809259 ) ) ( not ( = ?auto_1809265 ?auto_1809260 ) ) ( not ( = ?auto_1809261 ?auto_1809262 ) ) ( HOIST-AT ?auto_1809264 ?auto_1809261 ) ( not ( = ?auto_1809267 ?auto_1809264 ) ) ( AVAILABLE ?auto_1809264 ) ( SURFACE-AT ?auto_1809260 ?auto_1809261 ) ( ON ?auto_1809260 ?auto_1809263 ) ( CLEAR ?auto_1809260 ) ( not ( = ?auto_1809259 ?auto_1809263 ) ) ( not ( = ?auto_1809260 ?auto_1809263 ) ) ( not ( = ?auto_1809265 ?auto_1809263 ) ) ( TRUCK-AT ?auto_1809266 ?auto_1809262 ) )
    :subtasks
    ( ( !DRIVE ?auto_1809266 ?auto_1809262 ?auto_1809261 )
      ( MAKE-2CRATE ?auto_1809265 ?auto_1809259 ?auto_1809260 )
      ( MAKE-1CRATE-VERIFY ?auto_1809259 ?auto_1809260 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1809268 - SURFACE
      ?auto_1809269 - SURFACE
      ?auto_1809270 - SURFACE
    )
    :vars
    (
      ?auto_1809273 - HOIST
      ?auto_1809271 - PLACE
      ?auto_1809274 - PLACE
      ?auto_1809276 - HOIST
      ?auto_1809272 - SURFACE
      ?auto_1809275 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809273 ?auto_1809271 ) ( SURFACE-AT ?auto_1809269 ?auto_1809271 ) ( CLEAR ?auto_1809269 ) ( IS-CRATE ?auto_1809270 ) ( not ( = ?auto_1809269 ?auto_1809270 ) ) ( AVAILABLE ?auto_1809273 ) ( ON ?auto_1809269 ?auto_1809268 ) ( not ( = ?auto_1809268 ?auto_1809269 ) ) ( not ( = ?auto_1809268 ?auto_1809270 ) ) ( not ( = ?auto_1809274 ?auto_1809271 ) ) ( HOIST-AT ?auto_1809276 ?auto_1809274 ) ( not ( = ?auto_1809273 ?auto_1809276 ) ) ( AVAILABLE ?auto_1809276 ) ( SURFACE-AT ?auto_1809270 ?auto_1809274 ) ( ON ?auto_1809270 ?auto_1809272 ) ( CLEAR ?auto_1809270 ) ( not ( = ?auto_1809269 ?auto_1809272 ) ) ( not ( = ?auto_1809270 ?auto_1809272 ) ) ( not ( = ?auto_1809268 ?auto_1809272 ) ) ( TRUCK-AT ?auto_1809275 ?auto_1809271 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1809269 ?auto_1809270 )
      ( MAKE-2CRATE-VERIFY ?auto_1809268 ?auto_1809269 ?auto_1809270 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1809277 - SURFACE
      ?auto_1809278 - SURFACE
    )
    :vars
    (
      ?auto_1809279 - HOIST
      ?auto_1809285 - PLACE
      ?auto_1809282 - SURFACE
      ?auto_1809280 - PLACE
      ?auto_1809283 - HOIST
      ?auto_1809284 - SURFACE
      ?auto_1809281 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809279 ?auto_1809285 ) ( IS-CRATE ?auto_1809278 ) ( not ( = ?auto_1809277 ?auto_1809278 ) ) ( not ( = ?auto_1809282 ?auto_1809277 ) ) ( not ( = ?auto_1809282 ?auto_1809278 ) ) ( not ( = ?auto_1809280 ?auto_1809285 ) ) ( HOIST-AT ?auto_1809283 ?auto_1809280 ) ( not ( = ?auto_1809279 ?auto_1809283 ) ) ( AVAILABLE ?auto_1809283 ) ( SURFACE-AT ?auto_1809278 ?auto_1809280 ) ( ON ?auto_1809278 ?auto_1809284 ) ( CLEAR ?auto_1809278 ) ( not ( = ?auto_1809277 ?auto_1809284 ) ) ( not ( = ?auto_1809278 ?auto_1809284 ) ) ( not ( = ?auto_1809282 ?auto_1809284 ) ) ( TRUCK-AT ?auto_1809281 ?auto_1809285 ) ( SURFACE-AT ?auto_1809282 ?auto_1809285 ) ( CLEAR ?auto_1809282 ) ( LIFTING ?auto_1809279 ?auto_1809277 ) ( IS-CRATE ?auto_1809277 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1809282 ?auto_1809277 )
      ( MAKE-2CRATE ?auto_1809282 ?auto_1809277 ?auto_1809278 )
      ( MAKE-1CRATE-VERIFY ?auto_1809277 ?auto_1809278 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1809286 - SURFACE
      ?auto_1809287 - SURFACE
      ?auto_1809288 - SURFACE
    )
    :vars
    (
      ?auto_1809293 - HOIST
      ?auto_1809290 - PLACE
      ?auto_1809291 - PLACE
      ?auto_1809292 - HOIST
      ?auto_1809294 - SURFACE
      ?auto_1809289 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809293 ?auto_1809290 ) ( IS-CRATE ?auto_1809288 ) ( not ( = ?auto_1809287 ?auto_1809288 ) ) ( not ( = ?auto_1809286 ?auto_1809287 ) ) ( not ( = ?auto_1809286 ?auto_1809288 ) ) ( not ( = ?auto_1809291 ?auto_1809290 ) ) ( HOIST-AT ?auto_1809292 ?auto_1809291 ) ( not ( = ?auto_1809293 ?auto_1809292 ) ) ( AVAILABLE ?auto_1809292 ) ( SURFACE-AT ?auto_1809288 ?auto_1809291 ) ( ON ?auto_1809288 ?auto_1809294 ) ( CLEAR ?auto_1809288 ) ( not ( = ?auto_1809287 ?auto_1809294 ) ) ( not ( = ?auto_1809288 ?auto_1809294 ) ) ( not ( = ?auto_1809286 ?auto_1809294 ) ) ( TRUCK-AT ?auto_1809289 ?auto_1809290 ) ( SURFACE-AT ?auto_1809286 ?auto_1809290 ) ( CLEAR ?auto_1809286 ) ( LIFTING ?auto_1809293 ?auto_1809287 ) ( IS-CRATE ?auto_1809287 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1809287 ?auto_1809288 )
      ( MAKE-2CRATE-VERIFY ?auto_1809286 ?auto_1809287 ?auto_1809288 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1809295 - SURFACE
      ?auto_1809296 - SURFACE
    )
    :vars
    (
      ?auto_1809303 - HOIST
      ?auto_1809299 - PLACE
      ?auto_1809300 - SURFACE
      ?auto_1809297 - PLACE
      ?auto_1809298 - HOIST
      ?auto_1809302 - SURFACE
      ?auto_1809301 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809303 ?auto_1809299 ) ( IS-CRATE ?auto_1809296 ) ( not ( = ?auto_1809295 ?auto_1809296 ) ) ( not ( = ?auto_1809300 ?auto_1809295 ) ) ( not ( = ?auto_1809300 ?auto_1809296 ) ) ( not ( = ?auto_1809297 ?auto_1809299 ) ) ( HOIST-AT ?auto_1809298 ?auto_1809297 ) ( not ( = ?auto_1809303 ?auto_1809298 ) ) ( AVAILABLE ?auto_1809298 ) ( SURFACE-AT ?auto_1809296 ?auto_1809297 ) ( ON ?auto_1809296 ?auto_1809302 ) ( CLEAR ?auto_1809296 ) ( not ( = ?auto_1809295 ?auto_1809302 ) ) ( not ( = ?auto_1809296 ?auto_1809302 ) ) ( not ( = ?auto_1809300 ?auto_1809302 ) ) ( TRUCK-AT ?auto_1809301 ?auto_1809299 ) ( SURFACE-AT ?auto_1809300 ?auto_1809299 ) ( CLEAR ?auto_1809300 ) ( IS-CRATE ?auto_1809295 ) ( AVAILABLE ?auto_1809303 ) ( IN ?auto_1809295 ?auto_1809301 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1809303 ?auto_1809295 ?auto_1809301 ?auto_1809299 )
      ( MAKE-2CRATE ?auto_1809300 ?auto_1809295 ?auto_1809296 )
      ( MAKE-1CRATE-VERIFY ?auto_1809295 ?auto_1809296 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1809304 - SURFACE
      ?auto_1809305 - SURFACE
      ?auto_1809306 - SURFACE
    )
    :vars
    (
      ?auto_1809308 - HOIST
      ?auto_1809312 - PLACE
      ?auto_1809311 - PLACE
      ?auto_1809307 - HOIST
      ?auto_1809309 - SURFACE
      ?auto_1809310 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809308 ?auto_1809312 ) ( IS-CRATE ?auto_1809306 ) ( not ( = ?auto_1809305 ?auto_1809306 ) ) ( not ( = ?auto_1809304 ?auto_1809305 ) ) ( not ( = ?auto_1809304 ?auto_1809306 ) ) ( not ( = ?auto_1809311 ?auto_1809312 ) ) ( HOIST-AT ?auto_1809307 ?auto_1809311 ) ( not ( = ?auto_1809308 ?auto_1809307 ) ) ( AVAILABLE ?auto_1809307 ) ( SURFACE-AT ?auto_1809306 ?auto_1809311 ) ( ON ?auto_1809306 ?auto_1809309 ) ( CLEAR ?auto_1809306 ) ( not ( = ?auto_1809305 ?auto_1809309 ) ) ( not ( = ?auto_1809306 ?auto_1809309 ) ) ( not ( = ?auto_1809304 ?auto_1809309 ) ) ( TRUCK-AT ?auto_1809310 ?auto_1809312 ) ( SURFACE-AT ?auto_1809304 ?auto_1809312 ) ( CLEAR ?auto_1809304 ) ( IS-CRATE ?auto_1809305 ) ( AVAILABLE ?auto_1809308 ) ( IN ?auto_1809305 ?auto_1809310 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1809305 ?auto_1809306 )
      ( MAKE-2CRATE-VERIFY ?auto_1809304 ?auto_1809305 ?auto_1809306 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1809349 - SURFACE
      ?auto_1809350 - SURFACE
    )
    :vars
    (
      ?auto_1809352 - HOIST
      ?auto_1809353 - PLACE
      ?auto_1809355 - SURFACE
      ?auto_1809351 - PLACE
      ?auto_1809357 - HOIST
      ?auto_1809354 - SURFACE
      ?auto_1809356 - TRUCK
      ?auto_1809358 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809352 ?auto_1809353 ) ( SURFACE-AT ?auto_1809349 ?auto_1809353 ) ( CLEAR ?auto_1809349 ) ( IS-CRATE ?auto_1809350 ) ( not ( = ?auto_1809349 ?auto_1809350 ) ) ( AVAILABLE ?auto_1809352 ) ( ON ?auto_1809349 ?auto_1809355 ) ( not ( = ?auto_1809355 ?auto_1809349 ) ) ( not ( = ?auto_1809355 ?auto_1809350 ) ) ( not ( = ?auto_1809351 ?auto_1809353 ) ) ( HOIST-AT ?auto_1809357 ?auto_1809351 ) ( not ( = ?auto_1809352 ?auto_1809357 ) ) ( AVAILABLE ?auto_1809357 ) ( SURFACE-AT ?auto_1809350 ?auto_1809351 ) ( ON ?auto_1809350 ?auto_1809354 ) ( CLEAR ?auto_1809350 ) ( not ( = ?auto_1809349 ?auto_1809354 ) ) ( not ( = ?auto_1809350 ?auto_1809354 ) ) ( not ( = ?auto_1809355 ?auto_1809354 ) ) ( TRUCK-AT ?auto_1809356 ?auto_1809358 ) ( not ( = ?auto_1809358 ?auto_1809353 ) ) ( not ( = ?auto_1809351 ?auto_1809358 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1809356 ?auto_1809358 ?auto_1809353 )
      ( MAKE-1CRATE ?auto_1809349 ?auto_1809350 )
      ( MAKE-1CRATE-VERIFY ?auto_1809349 ?auto_1809350 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1809389 - SURFACE
      ?auto_1809390 - SURFACE
      ?auto_1809391 - SURFACE
      ?auto_1809388 - SURFACE
    )
    :vars
    (
      ?auto_1809392 - HOIST
      ?auto_1809393 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809392 ?auto_1809393 ) ( SURFACE-AT ?auto_1809391 ?auto_1809393 ) ( CLEAR ?auto_1809391 ) ( LIFTING ?auto_1809392 ?auto_1809388 ) ( IS-CRATE ?auto_1809388 ) ( not ( = ?auto_1809391 ?auto_1809388 ) ) ( ON ?auto_1809390 ?auto_1809389 ) ( ON ?auto_1809391 ?auto_1809390 ) ( not ( = ?auto_1809389 ?auto_1809390 ) ) ( not ( = ?auto_1809389 ?auto_1809391 ) ) ( not ( = ?auto_1809389 ?auto_1809388 ) ) ( not ( = ?auto_1809390 ?auto_1809391 ) ) ( not ( = ?auto_1809390 ?auto_1809388 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1809391 ?auto_1809388 )
      ( MAKE-3CRATE-VERIFY ?auto_1809389 ?auto_1809390 ?auto_1809391 ?auto_1809388 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1809406 - SURFACE
      ?auto_1809407 - SURFACE
      ?auto_1809408 - SURFACE
      ?auto_1809405 - SURFACE
    )
    :vars
    (
      ?auto_1809409 - HOIST
      ?auto_1809410 - PLACE
      ?auto_1809411 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809409 ?auto_1809410 ) ( SURFACE-AT ?auto_1809408 ?auto_1809410 ) ( CLEAR ?auto_1809408 ) ( IS-CRATE ?auto_1809405 ) ( not ( = ?auto_1809408 ?auto_1809405 ) ) ( TRUCK-AT ?auto_1809411 ?auto_1809410 ) ( AVAILABLE ?auto_1809409 ) ( IN ?auto_1809405 ?auto_1809411 ) ( ON ?auto_1809408 ?auto_1809407 ) ( not ( = ?auto_1809407 ?auto_1809408 ) ) ( not ( = ?auto_1809407 ?auto_1809405 ) ) ( ON ?auto_1809407 ?auto_1809406 ) ( not ( = ?auto_1809406 ?auto_1809407 ) ) ( not ( = ?auto_1809406 ?auto_1809408 ) ) ( not ( = ?auto_1809406 ?auto_1809405 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809407 ?auto_1809408 ?auto_1809405 )
      ( MAKE-3CRATE-VERIFY ?auto_1809406 ?auto_1809407 ?auto_1809408 ?auto_1809405 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1809427 - SURFACE
      ?auto_1809428 - SURFACE
      ?auto_1809429 - SURFACE
      ?auto_1809426 - SURFACE
    )
    :vars
    (
      ?auto_1809431 - HOIST
      ?auto_1809432 - PLACE
      ?auto_1809430 - TRUCK
      ?auto_1809433 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809431 ?auto_1809432 ) ( SURFACE-AT ?auto_1809429 ?auto_1809432 ) ( CLEAR ?auto_1809429 ) ( IS-CRATE ?auto_1809426 ) ( not ( = ?auto_1809429 ?auto_1809426 ) ) ( AVAILABLE ?auto_1809431 ) ( IN ?auto_1809426 ?auto_1809430 ) ( ON ?auto_1809429 ?auto_1809428 ) ( not ( = ?auto_1809428 ?auto_1809429 ) ) ( not ( = ?auto_1809428 ?auto_1809426 ) ) ( TRUCK-AT ?auto_1809430 ?auto_1809433 ) ( not ( = ?auto_1809433 ?auto_1809432 ) ) ( ON ?auto_1809428 ?auto_1809427 ) ( not ( = ?auto_1809427 ?auto_1809428 ) ) ( not ( = ?auto_1809427 ?auto_1809429 ) ) ( not ( = ?auto_1809427 ?auto_1809426 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809428 ?auto_1809429 ?auto_1809426 )
      ( MAKE-3CRATE-VERIFY ?auto_1809427 ?auto_1809428 ?auto_1809429 ?auto_1809426 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1809451 - SURFACE
      ?auto_1809452 - SURFACE
      ?auto_1809453 - SURFACE
      ?auto_1809450 - SURFACE
    )
    :vars
    (
      ?auto_1809458 - HOIST
      ?auto_1809455 - PLACE
      ?auto_1809454 - TRUCK
      ?auto_1809457 - PLACE
      ?auto_1809456 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809458 ?auto_1809455 ) ( SURFACE-AT ?auto_1809453 ?auto_1809455 ) ( CLEAR ?auto_1809453 ) ( IS-CRATE ?auto_1809450 ) ( not ( = ?auto_1809453 ?auto_1809450 ) ) ( AVAILABLE ?auto_1809458 ) ( ON ?auto_1809453 ?auto_1809452 ) ( not ( = ?auto_1809452 ?auto_1809453 ) ) ( not ( = ?auto_1809452 ?auto_1809450 ) ) ( TRUCK-AT ?auto_1809454 ?auto_1809457 ) ( not ( = ?auto_1809457 ?auto_1809455 ) ) ( HOIST-AT ?auto_1809456 ?auto_1809457 ) ( LIFTING ?auto_1809456 ?auto_1809450 ) ( not ( = ?auto_1809458 ?auto_1809456 ) ) ( ON ?auto_1809452 ?auto_1809451 ) ( not ( = ?auto_1809451 ?auto_1809452 ) ) ( not ( = ?auto_1809451 ?auto_1809453 ) ) ( not ( = ?auto_1809451 ?auto_1809450 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809452 ?auto_1809453 ?auto_1809450 )
      ( MAKE-3CRATE-VERIFY ?auto_1809451 ?auto_1809452 ?auto_1809453 ?auto_1809450 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1809478 - SURFACE
      ?auto_1809479 - SURFACE
      ?auto_1809480 - SURFACE
      ?auto_1809477 - SURFACE
    )
    :vars
    (
      ?auto_1809482 - HOIST
      ?auto_1809483 - PLACE
      ?auto_1809485 - TRUCK
      ?auto_1809484 - PLACE
      ?auto_1809481 - HOIST
      ?auto_1809486 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809482 ?auto_1809483 ) ( SURFACE-AT ?auto_1809480 ?auto_1809483 ) ( CLEAR ?auto_1809480 ) ( IS-CRATE ?auto_1809477 ) ( not ( = ?auto_1809480 ?auto_1809477 ) ) ( AVAILABLE ?auto_1809482 ) ( ON ?auto_1809480 ?auto_1809479 ) ( not ( = ?auto_1809479 ?auto_1809480 ) ) ( not ( = ?auto_1809479 ?auto_1809477 ) ) ( TRUCK-AT ?auto_1809485 ?auto_1809484 ) ( not ( = ?auto_1809484 ?auto_1809483 ) ) ( HOIST-AT ?auto_1809481 ?auto_1809484 ) ( not ( = ?auto_1809482 ?auto_1809481 ) ) ( AVAILABLE ?auto_1809481 ) ( SURFACE-AT ?auto_1809477 ?auto_1809484 ) ( ON ?auto_1809477 ?auto_1809486 ) ( CLEAR ?auto_1809477 ) ( not ( = ?auto_1809480 ?auto_1809486 ) ) ( not ( = ?auto_1809477 ?auto_1809486 ) ) ( not ( = ?auto_1809479 ?auto_1809486 ) ) ( ON ?auto_1809479 ?auto_1809478 ) ( not ( = ?auto_1809478 ?auto_1809479 ) ) ( not ( = ?auto_1809478 ?auto_1809480 ) ) ( not ( = ?auto_1809478 ?auto_1809477 ) ) ( not ( = ?auto_1809478 ?auto_1809486 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809479 ?auto_1809480 ?auto_1809477 )
      ( MAKE-3CRATE-VERIFY ?auto_1809478 ?auto_1809479 ?auto_1809480 ?auto_1809477 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1809506 - SURFACE
      ?auto_1809507 - SURFACE
      ?auto_1809508 - SURFACE
      ?auto_1809505 - SURFACE
    )
    :vars
    (
      ?auto_1809510 - HOIST
      ?auto_1809514 - PLACE
      ?auto_1809509 - PLACE
      ?auto_1809512 - HOIST
      ?auto_1809513 - SURFACE
      ?auto_1809511 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809510 ?auto_1809514 ) ( SURFACE-AT ?auto_1809508 ?auto_1809514 ) ( CLEAR ?auto_1809508 ) ( IS-CRATE ?auto_1809505 ) ( not ( = ?auto_1809508 ?auto_1809505 ) ) ( AVAILABLE ?auto_1809510 ) ( ON ?auto_1809508 ?auto_1809507 ) ( not ( = ?auto_1809507 ?auto_1809508 ) ) ( not ( = ?auto_1809507 ?auto_1809505 ) ) ( not ( = ?auto_1809509 ?auto_1809514 ) ) ( HOIST-AT ?auto_1809512 ?auto_1809509 ) ( not ( = ?auto_1809510 ?auto_1809512 ) ) ( AVAILABLE ?auto_1809512 ) ( SURFACE-AT ?auto_1809505 ?auto_1809509 ) ( ON ?auto_1809505 ?auto_1809513 ) ( CLEAR ?auto_1809505 ) ( not ( = ?auto_1809508 ?auto_1809513 ) ) ( not ( = ?auto_1809505 ?auto_1809513 ) ) ( not ( = ?auto_1809507 ?auto_1809513 ) ) ( TRUCK-AT ?auto_1809511 ?auto_1809514 ) ( ON ?auto_1809507 ?auto_1809506 ) ( not ( = ?auto_1809506 ?auto_1809507 ) ) ( not ( = ?auto_1809506 ?auto_1809508 ) ) ( not ( = ?auto_1809506 ?auto_1809505 ) ) ( not ( = ?auto_1809506 ?auto_1809513 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809507 ?auto_1809508 ?auto_1809505 )
      ( MAKE-3CRATE-VERIFY ?auto_1809506 ?auto_1809507 ?auto_1809508 ?auto_1809505 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1809534 - SURFACE
      ?auto_1809535 - SURFACE
      ?auto_1809536 - SURFACE
      ?auto_1809533 - SURFACE
    )
    :vars
    (
      ?auto_1809540 - HOIST
      ?auto_1809542 - PLACE
      ?auto_1809541 - PLACE
      ?auto_1809538 - HOIST
      ?auto_1809537 - SURFACE
      ?auto_1809539 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809540 ?auto_1809542 ) ( IS-CRATE ?auto_1809533 ) ( not ( = ?auto_1809536 ?auto_1809533 ) ) ( not ( = ?auto_1809535 ?auto_1809536 ) ) ( not ( = ?auto_1809535 ?auto_1809533 ) ) ( not ( = ?auto_1809541 ?auto_1809542 ) ) ( HOIST-AT ?auto_1809538 ?auto_1809541 ) ( not ( = ?auto_1809540 ?auto_1809538 ) ) ( AVAILABLE ?auto_1809538 ) ( SURFACE-AT ?auto_1809533 ?auto_1809541 ) ( ON ?auto_1809533 ?auto_1809537 ) ( CLEAR ?auto_1809533 ) ( not ( = ?auto_1809536 ?auto_1809537 ) ) ( not ( = ?auto_1809533 ?auto_1809537 ) ) ( not ( = ?auto_1809535 ?auto_1809537 ) ) ( TRUCK-AT ?auto_1809539 ?auto_1809542 ) ( SURFACE-AT ?auto_1809535 ?auto_1809542 ) ( CLEAR ?auto_1809535 ) ( LIFTING ?auto_1809540 ?auto_1809536 ) ( IS-CRATE ?auto_1809536 ) ( ON ?auto_1809535 ?auto_1809534 ) ( not ( = ?auto_1809534 ?auto_1809535 ) ) ( not ( = ?auto_1809534 ?auto_1809536 ) ) ( not ( = ?auto_1809534 ?auto_1809533 ) ) ( not ( = ?auto_1809534 ?auto_1809537 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809535 ?auto_1809536 ?auto_1809533 )
      ( MAKE-3CRATE-VERIFY ?auto_1809534 ?auto_1809535 ?auto_1809536 ?auto_1809533 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1809562 - SURFACE
      ?auto_1809563 - SURFACE
      ?auto_1809564 - SURFACE
      ?auto_1809561 - SURFACE
    )
    :vars
    (
      ?auto_1809565 - HOIST
      ?auto_1809570 - PLACE
      ?auto_1809568 - PLACE
      ?auto_1809567 - HOIST
      ?auto_1809566 - SURFACE
      ?auto_1809569 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809565 ?auto_1809570 ) ( IS-CRATE ?auto_1809561 ) ( not ( = ?auto_1809564 ?auto_1809561 ) ) ( not ( = ?auto_1809563 ?auto_1809564 ) ) ( not ( = ?auto_1809563 ?auto_1809561 ) ) ( not ( = ?auto_1809568 ?auto_1809570 ) ) ( HOIST-AT ?auto_1809567 ?auto_1809568 ) ( not ( = ?auto_1809565 ?auto_1809567 ) ) ( AVAILABLE ?auto_1809567 ) ( SURFACE-AT ?auto_1809561 ?auto_1809568 ) ( ON ?auto_1809561 ?auto_1809566 ) ( CLEAR ?auto_1809561 ) ( not ( = ?auto_1809564 ?auto_1809566 ) ) ( not ( = ?auto_1809561 ?auto_1809566 ) ) ( not ( = ?auto_1809563 ?auto_1809566 ) ) ( TRUCK-AT ?auto_1809569 ?auto_1809570 ) ( SURFACE-AT ?auto_1809563 ?auto_1809570 ) ( CLEAR ?auto_1809563 ) ( IS-CRATE ?auto_1809564 ) ( AVAILABLE ?auto_1809565 ) ( IN ?auto_1809564 ?auto_1809569 ) ( ON ?auto_1809563 ?auto_1809562 ) ( not ( = ?auto_1809562 ?auto_1809563 ) ) ( not ( = ?auto_1809562 ?auto_1809564 ) ) ( not ( = ?auto_1809562 ?auto_1809561 ) ) ( not ( = ?auto_1809562 ?auto_1809566 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809563 ?auto_1809564 ?auto_1809561 )
      ( MAKE-3CRATE-VERIFY ?auto_1809562 ?auto_1809563 ?auto_1809564 ?auto_1809561 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1809571 - SURFACE
      ?auto_1809572 - SURFACE
    )
    :vars
    (
      ?auto_1809573 - HOIST
      ?auto_1809579 - PLACE
      ?auto_1809577 - SURFACE
      ?auto_1809576 - PLACE
      ?auto_1809575 - HOIST
      ?auto_1809574 - SURFACE
      ?auto_1809578 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809573 ?auto_1809579 ) ( IS-CRATE ?auto_1809572 ) ( not ( = ?auto_1809571 ?auto_1809572 ) ) ( not ( = ?auto_1809577 ?auto_1809571 ) ) ( not ( = ?auto_1809577 ?auto_1809572 ) ) ( not ( = ?auto_1809576 ?auto_1809579 ) ) ( HOIST-AT ?auto_1809575 ?auto_1809576 ) ( not ( = ?auto_1809573 ?auto_1809575 ) ) ( AVAILABLE ?auto_1809575 ) ( SURFACE-AT ?auto_1809572 ?auto_1809576 ) ( ON ?auto_1809572 ?auto_1809574 ) ( CLEAR ?auto_1809572 ) ( not ( = ?auto_1809571 ?auto_1809574 ) ) ( not ( = ?auto_1809572 ?auto_1809574 ) ) ( not ( = ?auto_1809577 ?auto_1809574 ) ) ( SURFACE-AT ?auto_1809577 ?auto_1809579 ) ( CLEAR ?auto_1809577 ) ( IS-CRATE ?auto_1809571 ) ( AVAILABLE ?auto_1809573 ) ( IN ?auto_1809571 ?auto_1809578 ) ( TRUCK-AT ?auto_1809578 ?auto_1809576 ) )
    :subtasks
    ( ( !DRIVE ?auto_1809578 ?auto_1809576 ?auto_1809579 )
      ( MAKE-2CRATE ?auto_1809577 ?auto_1809571 ?auto_1809572 )
      ( MAKE-1CRATE-VERIFY ?auto_1809571 ?auto_1809572 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1809580 - SURFACE
      ?auto_1809581 - SURFACE
      ?auto_1809582 - SURFACE
    )
    :vars
    (
      ?auto_1809586 - HOIST
      ?auto_1809584 - PLACE
      ?auto_1809587 - PLACE
      ?auto_1809588 - HOIST
      ?auto_1809583 - SURFACE
      ?auto_1809585 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809586 ?auto_1809584 ) ( IS-CRATE ?auto_1809582 ) ( not ( = ?auto_1809581 ?auto_1809582 ) ) ( not ( = ?auto_1809580 ?auto_1809581 ) ) ( not ( = ?auto_1809580 ?auto_1809582 ) ) ( not ( = ?auto_1809587 ?auto_1809584 ) ) ( HOIST-AT ?auto_1809588 ?auto_1809587 ) ( not ( = ?auto_1809586 ?auto_1809588 ) ) ( AVAILABLE ?auto_1809588 ) ( SURFACE-AT ?auto_1809582 ?auto_1809587 ) ( ON ?auto_1809582 ?auto_1809583 ) ( CLEAR ?auto_1809582 ) ( not ( = ?auto_1809581 ?auto_1809583 ) ) ( not ( = ?auto_1809582 ?auto_1809583 ) ) ( not ( = ?auto_1809580 ?auto_1809583 ) ) ( SURFACE-AT ?auto_1809580 ?auto_1809584 ) ( CLEAR ?auto_1809580 ) ( IS-CRATE ?auto_1809581 ) ( AVAILABLE ?auto_1809586 ) ( IN ?auto_1809581 ?auto_1809585 ) ( TRUCK-AT ?auto_1809585 ?auto_1809587 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1809581 ?auto_1809582 )
      ( MAKE-2CRATE-VERIFY ?auto_1809580 ?auto_1809581 ?auto_1809582 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1809590 - SURFACE
      ?auto_1809591 - SURFACE
      ?auto_1809592 - SURFACE
      ?auto_1809589 - SURFACE
    )
    :vars
    (
      ?auto_1809593 - HOIST
      ?auto_1809595 - PLACE
      ?auto_1809596 - PLACE
      ?auto_1809598 - HOIST
      ?auto_1809594 - SURFACE
      ?auto_1809597 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809593 ?auto_1809595 ) ( IS-CRATE ?auto_1809589 ) ( not ( = ?auto_1809592 ?auto_1809589 ) ) ( not ( = ?auto_1809591 ?auto_1809592 ) ) ( not ( = ?auto_1809591 ?auto_1809589 ) ) ( not ( = ?auto_1809596 ?auto_1809595 ) ) ( HOIST-AT ?auto_1809598 ?auto_1809596 ) ( not ( = ?auto_1809593 ?auto_1809598 ) ) ( AVAILABLE ?auto_1809598 ) ( SURFACE-AT ?auto_1809589 ?auto_1809596 ) ( ON ?auto_1809589 ?auto_1809594 ) ( CLEAR ?auto_1809589 ) ( not ( = ?auto_1809592 ?auto_1809594 ) ) ( not ( = ?auto_1809589 ?auto_1809594 ) ) ( not ( = ?auto_1809591 ?auto_1809594 ) ) ( SURFACE-AT ?auto_1809591 ?auto_1809595 ) ( CLEAR ?auto_1809591 ) ( IS-CRATE ?auto_1809592 ) ( AVAILABLE ?auto_1809593 ) ( IN ?auto_1809592 ?auto_1809597 ) ( TRUCK-AT ?auto_1809597 ?auto_1809596 ) ( ON ?auto_1809591 ?auto_1809590 ) ( not ( = ?auto_1809590 ?auto_1809591 ) ) ( not ( = ?auto_1809590 ?auto_1809592 ) ) ( not ( = ?auto_1809590 ?auto_1809589 ) ) ( not ( = ?auto_1809590 ?auto_1809594 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809591 ?auto_1809592 ?auto_1809589 )
      ( MAKE-3CRATE-VERIFY ?auto_1809590 ?auto_1809591 ?auto_1809592 ?auto_1809589 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1809599 - SURFACE
      ?auto_1809600 - SURFACE
    )
    :vars
    (
      ?auto_1809601 - HOIST
      ?auto_1809603 - PLACE
      ?auto_1809604 - SURFACE
      ?auto_1809605 - PLACE
      ?auto_1809607 - HOIST
      ?auto_1809602 - SURFACE
      ?auto_1809606 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809601 ?auto_1809603 ) ( IS-CRATE ?auto_1809600 ) ( not ( = ?auto_1809599 ?auto_1809600 ) ) ( not ( = ?auto_1809604 ?auto_1809599 ) ) ( not ( = ?auto_1809604 ?auto_1809600 ) ) ( not ( = ?auto_1809605 ?auto_1809603 ) ) ( HOIST-AT ?auto_1809607 ?auto_1809605 ) ( not ( = ?auto_1809601 ?auto_1809607 ) ) ( SURFACE-AT ?auto_1809600 ?auto_1809605 ) ( ON ?auto_1809600 ?auto_1809602 ) ( CLEAR ?auto_1809600 ) ( not ( = ?auto_1809599 ?auto_1809602 ) ) ( not ( = ?auto_1809600 ?auto_1809602 ) ) ( not ( = ?auto_1809604 ?auto_1809602 ) ) ( SURFACE-AT ?auto_1809604 ?auto_1809603 ) ( CLEAR ?auto_1809604 ) ( IS-CRATE ?auto_1809599 ) ( AVAILABLE ?auto_1809601 ) ( TRUCK-AT ?auto_1809606 ?auto_1809605 ) ( LIFTING ?auto_1809607 ?auto_1809599 ) )
    :subtasks
    ( ( !LOAD ?auto_1809607 ?auto_1809599 ?auto_1809606 ?auto_1809605 )
      ( MAKE-2CRATE ?auto_1809604 ?auto_1809599 ?auto_1809600 )
      ( MAKE-1CRATE-VERIFY ?auto_1809599 ?auto_1809600 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1809608 - SURFACE
      ?auto_1809609 - SURFACE
      ?auto_1809610 - SURFACE
    )
    :vars
    (
      ?auto_1809612 - HOIST
      ?auto_1809615 - PLACE
      ?auto_1809613 - PLACE
      ?auto_1809614 - HOIST
      ?auto_1809611 - SURFACE
      ?auto_1809616 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809612 ?auto_1809615 ) ( IS-CRATE ?auto_1809610 ) ( not ( = ?auto_1809609 ?auto_1809610 ) ) ( not ( = ?auto_1809608 ?auto_1809609 ) ) ( not ( = ?auto_1809608 ?auto_1809610 ) ) ( not ( = ?auto_1809613 ?auto_1809615 ) ) ( HOIST-AT ?auto_1809614 ?auto_1809613 ) ( not ( = ?auto_1809612 ?auto_1809614 ) ) ( SURFACE-AT ?auto_1809610 ?auto_1809613 ) ( ON ?auto_1809610 ?auto_1809611 ) ( CLEAR ?auto_1809610 ) ( not ( = ?auto_1809609 ?auto_1809611 ) ) ( not ( = ?auto_1809610 ?auto_1809611 ) ) ( not ( = ?auto_1809608 ?auto_1809611 ) ) ( SURFACE-AT ?auto_1809608 ?auto_1809615 ) ( CLEAR ?auto_1809608 ) ( IS-CRATE ?auto_1809609 ) ( AVAILABLE ?auto_1809612 ) ( TRUCK-AT ?auto_1809616 ?auto_1809613 ) ( LIFTING ?auto_1809614 ?auto_1809609 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1809609 ?auto_1809610 )
      ( MAKE-2CRATE-VERIFY ?auto_1809608 ?auto_1809609 ?auto_1809610 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1809618 - SURFACE
      ?auto_1809619 - SURFACE
      ?auto_1809620 - SURFACE
      ?auto_1809617 - SURFACE
    )
    :vars
    (
      ?auto_1809623 - HOIST
      ?auto_1809624 - PLACE
      ?auto_1809621 - PLACE
      ?auto_1809622 - HOIST
      ?auto_1809625 - SURFACE
      ?auto_1809626 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809623 ?auto_1809624 ) ( IS-CRATE ?auto_1809617 ) ( not ( = ?auto_1809620 ?auto_1809617 ) ) ( not ( = ?auto_1809619 ?auto_1809620 ) ) ( not ( = ?auto_1809619 ?auto_1809617 ) ) ( not ( = ?auto_1809621 ?auto_1809624 ) ) ( HOIST-AT ?auto_1809622 ?auto_1809621 ) ( not ( = ?auto_1809623 ?auto_1809622 ) ) ( SURFACE-AT ?auto_1809617 ?auto_1809621 ) ( ON ?auto_1809617 ?auto_1809625 ) ( CLEAR ?auto_1809617 ) ( not ( = ?auto_1809620 ?auto_1809625 ) ) ( not ( = ?auto_1809617 ?auto_1809625 ) ) ( not ( = ?auto_1809619 ?auto_1809625 ) ) ( SURFACE-AT ?auto_1809619 ?auto_1809624 ) ( CLEAR ?auto_1809619 ) ( IS-CRATE ?auto_1809620 ) ( AVAILABLE ?auto_1809623 ) ( TRUCK-AT ?auto_1809626 ?auto_1809621 ) ( LIFTING ?auto_1809622 ?auto_1809620 ) ( ON ?auto_1809619 ?auto_1809618 ) ( not ( = ?auto_1809618 ?auto_1809619 ) ) ( not ( = ?auto_1809618 ?auto_1809620 ) ) ( not ( = ?auto_1809618 ?auto_1809617 ) ) ( not ( = ?auto_1809618 ?auto_1809625 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809619 ?auto_1809620 ?auto_1809617 )
      ( MAKE-3CRATE-VERIFY ?auto_1809618 ?auto_1809619 ?auto_1809620 ?auto_1809617 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1809627 - SURFACE
      ?auto_1809628 - SURFACE
    )
    :vars
    (
      ?auto_1809632 - HOIST
      ?auto_1809633 - PLACE
      ?auto_1809629 - SURFACE
      ?auto_1809630 - PLACE
      ?auto_1809631 - HOIST
      ?auto_1809634 - SURFACE
      ?auto_1809635 - TRUCK
      ?auto_1809636 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809632 ?auto_1809633 ) ( IS-CRATE ?auto_1809628 ) ( not ( = ?auto_1809627 ?auto_1809628 ) ) ( not ( = ?auto_1809629 ?auto_1809627 ) ) ( not ( = ?auto_1809629 ?auto_1809628 ) ) ( not ( = ?auto_1809630 ?auto_1809633 ) ) ( HOIST-AT ?auto_1809631 ?auto_1809630 ) ( not ( = ?auto_1809632 ?auto_1809631 ) ) ( SURFACE-AT ?auto_1809628 ?auto_1809630 ) ( ON ?auto_1809628 ?auto_1809634 ) ( CLEAR ?auto_1809628 ) ( not ( = ?auto_1809627 ?auto_1809634 ) ) ( not ( = ?auto_1809628 ?auto_1809634 ) ) ( not ( = ?auto_1809629 ?auto_1809634 ) ) ( SURFACE-AT ?auto_1809629 ?auto_1809633 ) ( CLEAR ?auto_1809629 ) ( IS-CRATE ?auto_1809627 ) ( AVAILABLE ?auto_1809632 ) ( TRUCK-AT ?auto_1809635 ?auto_1809630 ) ( AVAILABLE ?auto_1809631 ) ( SURFACE-AT ?auto_1809627 ?auto_1809630 ) ( ON ?auto_1809627 ?auto_1809636 ) ( CLEAR ?auto_1809627 ) ( not ( = ?auto_1809627 ?auto_1809636 ) ) ( not ( = ?auto_1809628 ?auto_1809636 ) ) ( not ( = ?auto_1809629 ?auto_1809636 ) ) ( not ( = ?auto_1809634 ?auto_1809636 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1809631 ?auto_1809627 ?auto_1809636 ?auto_1809630 )
      ( MAKE-2CRATE ?auto_1809629 ?auto_1809627 ?auto_1809628 )
      ( MAKE-1CRATE-VERIFY ?auto_1809627 ?auto_1809628 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1809637 - SURFACE
      ?auto_1809638 - SURFACE
      ?auto_1809639 - SURFACE
    )
    :vars
    (
      ?auto_1809641 - HOIST
      ?auto_1809642 - PLACE
      ?auto_1809645 - PLACE
      ?auto_1809640 - HOIST
      ?auto_1809646 - SURFACE
      ?auto_1809644 - TRUCK
      ?auto_1809643 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809641 ?auto_1809642 ) ( IS-CRATE ?auto_1809639 ) ( not ( = ?auto_1809638 ?auto_1809639 ) ) ( not ( = ?auto_1809637 ?auto_1809638 ) ) ( not ( = ?auto_1809637 ?auto_1809639 ) ) ( not ( = ?auto_1809645 ?auto_1809642 ) ) ( HOIST-AT ?auto_1809640 ?auto_1809645 ) ( not ( = ?auto_1809641 ?auto_1809640 ) ) ( SURFACE-AT ?auto_1809639 ?auto_1809645 ) ( ON ?auto_1809639 ?auto_1809646 ) ( CLEAR ?auto_1809639 ) ( not ( = ?auto_1809638 ?auto_1809646 ) ) ( not ( = ?auto_1809639 ?auto_1809646 ) ) ( not ( = ?auto_1809637 ?auto_1809646 ) ) ( SURFACE-AT ?auto_1809637 ?auto_1809642 ) ( CLEAR ?auto_1809637 ) ( IS-CRATE ?auto_1809638 ) ( AVAILABLE ?auto_1809641 ) ( TRUCK-AT ?auto_1809644 ?auto_1809645 ) ( AVAILABLE ?auto_1809640 ) ( SURFACE-AT ?auto_1809638 ?auto_1809645 ) ( ON ?auto_1809638 ?auto_1809643 ) ( CLEAR ?auto_1809638 ) ( not ( = ?auto_1809638 ?auto_1809643 ) ) ( not ( = ?auto_1809639 ?auto_1809643 ) ) ( not ( = ?auto_1809637 ?auto_1809643 ) ) ( not ( = ?auto_1809646 ?auto_1809643 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1809638 ?auto_1809639 )
      ( MAKE-2CRATE-VERIFY ?auto_1809637 ?auto_1809638 ?auto_1809639 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1809648 - SURFACE
      ?auto_1809649 - SURFACE
      ?auto_1809650 - SURFACE
      ?auto_1809647 - SURFACE
    )
    :vars
    (
      ?auto_1809657 - HOIST
      ?auto_1809654 - PLACE
      ?auto_1809655 - PLACE
      ?auto_1809651 - HOIST
      ?auto_1809656 - SURFACE
      ?auto_1809652 - TRUCK
      ?auto_1809653 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809657 ?auto_1809654 ) ( IS-CRATE ?auto_1809647 ) ( not ( = ?auto_1809650 ?auto_1809647 ) ) ( not ( = ?auto_1809649 ?auto_1809650 ) ) ( not ( = ?auto_1809649 ?auto_1809647 ) ) ( not ( = ?auto_1809655 ?auto_1809654 ) ) ( HOIST-AT ?auto_1809651 ?auto_1809655 ) ( not ( = ?auto_1809657 ?auto_1809651 ) ) ( SURFACE-AT ?auto_1809647 ?auto_1809655 ) ( ON ?auto_1809647 ?auto_1809656 ) ( CLEAR ?auto_1809647 ) ( not ( = ?auto_1809650 ?auto_1809656 ) ) ( not ( = ?auto_1809647 ?auto_1809656 ) ) ( not ( = ?auto_1809649 ?auto_1809656 ) ) ( SURFACE-AT ?auto_1809649 ?auto_1809654 ) ( CLEAR ?auto_1809649 ) ( IS-CRATE ?auto_1809650 ) ( AVAILABLE ?auto_1809657 ) ( TRUCK-AT ?auto_1809652 ?auto_1809655 ) ( AVAILABLE ?auto_1809651 ) ( SURFACE-AT ?auto_1809650 ?auto_1809655 ) ( ON ?auto_1809650 ?auto_1809653 ) ( CLEAR ?auto_1809650 ) ( not ( = ?auto_1809650 ?auto_1809653 ) ) ( not ( = ?auto_1809647 ?auto_1809653 ) ) ( not ( = ?auto_1809649 ?auto_1809653 ) ) ( not ( = ?auto_1809656 ?auto_1809653 ) ) ( ON ?auto_1809649 ?auto_1809648 ) ( not ( = ?auto_1809648 ?auto_1809649 ) ) ( not ( = ?auto_1809648 ?auto_1809650 ) ) ( not ( = ?auto_1809648 ?auto_1809647 ) ) ( not ( = ?auto_1809648 ?auto_1809656 ) ) ( not ( = ?auto_1809648 ?auto_1809653 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809649 ?auto_1809650 ?auto_1809647 )
      ( MAKE-3CRATE-VERIFY ?auto_1809648 ?auto_1809649 ?auto_1809650 ?auto_1809647 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1809658 - SURFACE
      ?auto_1809659 - SURFACE
    )
    :vars
    (
      ?auto_1809667 - HOIST
      ?auto_1809664 - PLACE
      ?auto_1809661 - SURFACE
      ?auto_1809665 - PLACE
      ?auto_1809660 - HOIST
      ?auto_1809666 - SURFACE
      ?auto_1809663 - SURFACE
      ?auto_1809662 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809667 ?auto_1809664 ) ( IS-CRATE ?auto_1809659 ) ( not ( = ?auto_1809658 ?auto_1809659 ) ) ( not ( = ?auto_1809661 ?auto_1809658 ) ) ( not ( = ?auto_1809661 ?auto_1809659 ) ) ( not ( = ?auto_1809665 ?auto_1809664 ) ) ( HOIST-AT ?auto_1809660 ?auto_1809665 ) ( not ( = ?auto_1809667 ?auto_1809660 ) ) ( SURFACE-AT ?auto_1809659 ?auto_1809665 ) ( ON ?auto_1809659 ?auto_1809666 ) ( CLEAR ?auto_1809659 ) ( not ( = ?auto_1809658 ?auto_1809666 ) ) ( not ( = ?auto_1809659 ?auto_1809666 ) ) ( not ( = ?auto_1809661 ?auto_1809666 ) ) ( SURFACE-AT ?auto_1809661 ?auto_1809664 ) ( CLEAR ?auto_1809661 ) ( IS-CRATE ?auto_1809658 ) ( AVAILABLE ?auto_1809667 ) ( AVAILABLE ?auto_1809660 ) ( SURFACE-AT ?auto_1809658 ?auto_1809665 ) ( ON ?auto_1809658 ?auto_1809663 ) ( CLEAR ?auto_1809658 ) ( not ( = ?auto_1809658 ?auto_1809663 ) ) ( not ( = ?auto_1809659 ?auto_1809663 ) ) ( not ( = ?auto_1809661 ?auto_1809663 ) ) ( not ( = ?auto_1809666 ?auto_1809663 ) ) ( TRUCK-AT ?auto_1809662 ?auto_1809664 ) )
    :subtasks
    ( ( !DRIVE ?auto_1809662 ?auto_1809664 ?auto_1809665 )
      ( MAKE-2CRATE ?auto_1809661 ?auto_1809658 ?auto_1809659 )
      ( MAKE-1CRATE-VERIFY ?auto_1809658 ?auto_1809659 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1809668 - SURFACE
      ?auto_1809669 - SURFACE
      ?auto_1809670 - SURFACE
    )
    :vars
    (
      ?auto_1809671 - HOIST
      ?auto_1809676 - PLACE
      ?auto_1809675 - PLACE
      ?auto_1809677 - HOIST
      ?auto_1809673 - SURFACE
      ?auto_1809674 - SURFACE
      ?auto_1809672 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809671 ?auto_1809676 ) ( IS-CRATE ?auto_1809670 ) ( not ( = ?auto_1809669 ?auto_1809670 ) ) ( not ( = ?auto_1809668 ?auto_1809669 ) ) ( not ( = ?auto_1809668 ?auto_1809670 ) ) ( not ( = ?auto_1809675 ?auto_1809676 ) ) ( HOIST-AT ?auto_1809677 ?auto_1809675 ) ( not ( = ?auto_1809671 ?auto_1809677 ) ) ( SURFACE-AT ?auto_1809670 ?auto_1809675 ) ( ON ?auto_1809670 ?auto_1809673 ) ( CLEAR ?auto_1809670 ) ( not ( = ?auto_1809669 ?auto_1809673 ) ) ( not ( = ?auto_1809670 ?auto_1809673 ) ) ( not ( = ?auto_1809668 ?auto_1809673 ) ) ( SURFACE-AT ?auto_1809668 ?auto_1809676 ) ( CLEAR ?auto_1809668 ) ( IS-CRATE ?auto_1809669 ) ( AVAILABLE ?auto_1809671 ) ( AVAILABLE ?auto_1809677 ) ( SURFACE-AT ?auto_1809669 ?auto_1809675 ) ( ON ?auto_1809669 ?auto_1809674 ) ( CLEAR ?auto_1809669 ) ( not ( = ?auto_1809669 ?auto_1809674 ) ) ( not ( = ?auto_1809670 ?auto_1809674 ) ) ( not ( = ?auto_1809668 ?auto_1809674 ) ) ( not ( = ?auto_1809673 ?auto_1809674 ) ) ( TRUCK-AT ?auto_1809672 ?auto_1809676 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1809669 ?auto_1809670 )
      ( MAKE-2CRATE-VERIFY ?auto_1809668 ?auto_1809669 ?auto_1809670 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1809679 - SURFACE
      ?auto_1809680 - SURFACE
      ?auto_1809681 - SURFACE
      ?auto_1809678 - SURFACE
    )
    :vars
    (
      ?auto_1809683 - HOIST
      ?auto_1809686 - PLACE
      ?auto_1809687 - PLACE
      ?auto_1809685 - HOIST
      ?auto_1809682 - SURFACE
      ?auto_1809688 - SURFACE
      ?auto_1809684 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809683 ?auto_1809686 ) ( IS-CRATE ?auto_1809678 ) ( not ( = ?auto_1809681 ?auto_1809678 ) ) ( not ( = ?auto_1809680 ?auto_1809681 ) ) ( not ( = ?auto_1809680 ?auto_1809678 ) ) ( not ( = ?auto_1809687 ?auto_1809686 ) ) ( HOIST-AT ?auto_1809685 ?auto_1809687 ) ( not ( = ?auto_1809683 ?auto_1809685 ) ) ( SURFACE-AT ?auto_1809678 ?auto_1809687 ) ( ON ?auto_1809678 ?auto_1809682 ) ( CLEAR ?auto_1809678 ) ( not ( = ?auto_1809681 ?auto_1809682 ) ) ( not ( = ?auto_1809678 ?auto_1809682 ) ) ( not ( = ?auto_1809680 ?auto_1809682 ) ) ( SURFACE-AT ?auto_1809680 ?auto_1809686 ) ( CLEAR ?auto_1809680 ) ( IS-CRATE ?auto_1809681 ) ( AVAILABLE ?auto_1809683 ) ( AVAILABLE ?auto_1809685 ) ( SURFACE-AT ?auto_1809681 ?auto_1809687 ) ( ON ?auto_1809681 ?auto_1809688 ) ( CLEAR ?auto_1809681 ) ( not ( = ?auto_1809681 ?auto_1809688 ) ) ( not ( = ?auto_1809678 ?auto_1809688 ) ) ( not ( = ?auto_1809680 ?auto_1809688 ) ) ( not ( = ?auto_1809682 ?auto_1809688 ) ) ( TRUCK-AT ?auto_1809684 ?auto_1809686 ) ( ON ?auto_1809680 ?auto_1809679 ) ( not ( = ?auto_1809679 ?auto_1809680 ) ) ( not ( = ?auto_1809679 ?auto_1809681 ) ) ( not ( = ?auto_1809679 ?auto_1809678 ) ) ( not ( = ?auto_1809679 ?auto_1809682 ) ) ( not ( = ?auto_1809679 ?auto_1809688 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809680 ?auto_1809681 ?auto_1809678 )
      ( MAKE-3CRATE-VERIFY ?auto_1809679 ?auto_1809680 ?auto_1809681 ?auto_1809678 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1809689 - SURFACE
      ?auto_1809690 - SURFACE
    )
    :vars
    (
      ?auto_1809692 - HOIST
      ?auto_1809696 - PLACE
      ?auto_1809694 - SURFACE
      ?auto_1809697 - PLACE
      ?auto_1809695 - HOIST
      ?auto_1809691 - SURFACE
      ?auto_1809698 - SURFACE
      ?auto_1809693 - TRUCK
      ?auto_1809699 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809692 ?auto_1809696 ) ( IS-CRATE ?auto_1809690 ) ( not ( = ?auto_1809689 ?auto_1809690 ) ) ( not ( = ?auto_1809694 ?auto_1809689 ) ) ( not ( = ?auto_1809694 ?auto_1809690 ) ) ( not ( = ?auto_1809697 ?auto_1809696 ) ) ( HOIST-AT ?auto_1809695 ?auto_1809697 ) ( not ( = ?auto_1809692 ?auto_1809695 ) ) ( SURFACE-AT ?auto_1809690 ?auto_1809697 ) ( ON ?auto_1809690 ?auto_1809691 ) ( CLEAR ?auto_1809690 ) ( not ( = ?auto_1809689 ?auto_1809691 ) ) ( not ( = ?auto_1809690 ?auto_1809691 ) ) ( not ( = ?auto_1809694 ?auto_1809691 ) ) ( IS-CRATE ?auto_1809689 ) ( AVAILABLE ?auto_1809695 ) ( SURFACE-AT ?auto_1809689 ?auto_1809697 ) ( ON ?auto_1809689 ?auto_1809698 ) ( CLEAR ?auto_1809689 ) ( not ( = ?auto_1809689 ?auto_1809698 ) ) ( not ( = ?auto_1809690 ?auto_1809698 ) ) ( not ( = ?auto_1809694 ?auto_1809698 ) ) ( not ( = ?auto_1809691 ?auto_1809698 ) ) ( TRUCK-AT ?auto_1809693 ?auto_1809696 ) ( SURFACE-AT ?auto_1809699 ?auto_1809696 ) ( CLEAR ?auto_1809699 ) ( LIFTING ?auto_1809692 ?auto_1809694 ) ( IS-CRATE ?auto_1809694 ) ( not ( = ?auto_1809699 ?auto_1809694 ) ) ( not ( = ?auto_1809689 ?auto_1809699 ) ) ( not ( = ?auto_1809690 ?auto_1809699 ) ) ( not ( = ?auto_1809691 ?auto_1809699 ) ) ( not ( = ?auto_1809698 ?auto_1809699 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1809699 ?auto_1809694 )
      ( MAKE-2CRATE ?auto_1809694 ?auto_1809689 ?auto_1809690 )
      ( MAKE-1CRATE-VERIFY ?auto_1809689 ?auto_1809690 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1809700 - SURFACE
      ?auto_1809701 - SURFACE
      ?auto_1809702 - SURFACE
    )
    :vars
    (
      ?auto_1809707 - HOIST
      ?auto_1809703 - PLACE
      ?auto_1809706 - PLACE
      ?auto_1809709 - HOIST
      ?auto_1809708 - SURFACE
      ?auto_1809710 - SURFACE
      ?auto_1809705 - TRUCK
      ?auto_1809704 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809707 ?auto_1809703 ) ( IS-CRATE ?auto_1809702 ) ( not ( = ?auto_1809701 ?auto_1809702 ) ) ( not ( = ?auto_1809700 ?auto_1809701 ) ) ( not ( = ?auto_1809700 ?auto_1809702 ) ) ( not ( = ?auto_1809706 ?auto_1809703 ) ) ( HOIST-AT ?auto_1809709 ?auto_1809706 ) ( not ( = ?auto_1809707 ?auto_1809709 ) ) ( SURFACE-AT ?auto_1809702 ?auto_1809706 ) ( ON ?auto_1809702 ?auto_1809708 ) ( CLEAR ?auto_1809702 ) ( not ( = ?auto_1809701 ?auto_1809708 ) ) ( not ( = ?auto_1809702 ?auto_1809708 ) ) ( not ( = ?auto_1809700 ?auto_1809708 ) ) ( IS-CRATE ?auto_1809701 ) ( AVAILABLE ?auto_1809709 ) ( SURFACE-AT ?auto_1809701 ?auto_1809706 ) ( ON ?auto_1809701 ?auto_1809710 ) ( CLEAR ?auto_1809701 ) ( not ( = ?auto_1809701 ?auto_1809710 ) ) ( not ( = ?auto_1809702 ?auto_1809710 ) ) ( not ( = ?auto_1809700 ?auto_1809710 ) ) ( not ( = ?auto_1809708 ?auto_1809710 ) ) ( TRUCK-AT ?auto_1809705 ?auto_1809703 ) ( SURFACE-AT ?auto_1809704 ?auto_1809703 ) ( CLEAR ?auto_1809704 ) ( LIFTING ?auto_1809707 ?auto_1809700 ) ( IS-CRATE ?auto_1809700 ) ( not ( = ?auto_1809704 ?auto_1809700 ) ) ( not ( = ?auto_1809701 ?auto_1809704 ) ) ( not ( = ?auto_1809702 ?auto_1809704 ) ) ( not ( = ?auto_1809708 ?auto_1809704 ) ) ( not ( = ?auto_1809710 ?auto_1809704 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1809701 ?auto_1809702 )
      ( MAKE-2CRATE-VERIFY ?auto_1809700 ?auto_1809701 ?auto_1809702 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1809712 - SURFACE
      ?auto_1809713 - SURFACE
      ?auto_1809714 - SURFACE
      ?auto_1809711 - SURFACE
    )
    :vars
    (
      ?auto_1809715 - HOIST
      ?auto_1809721 - PLACE
      ?auto_1809719 - PLACE
      ?auto_1809718 - HOIST
      ?auto_1809720 - SURFACE
      ?auto_1809716 - SURFACE
      ?auto_1809717 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809715 ?auto_1809721 ) ( IS-CRATE ?auto_1809711 ) ( not ( = ?auto_1809714 ?auto_1809711 ) ) ( not ( = ?auto_1809713 ?auto_1809714 ) ) ( not ( = ?auto_1809713 ?auto_1809711 ) ) ( not ( = ?auto_1809719 ?auto_1809721 ) ) ( HOIST-AT ?auto_1809718 ?auto_1809719 ) ( not ( = ?auto_1809715 ?auto_1809718 ) ) ( SURFACE-AT ?auto_1809711 ?auto_1809719 ) ( ON ?auto_1809711 ?auto_1809720 ) ( CLEAR ?auto_1809711 ) ( not ( = ?auto_1809714 ?auto_1809720 ) ) ( not ( = ?auto_1809711 ?auto_1809720 ) ) ( not ( = ?auto_1809713 ?auto_1809720 ) ) ( IS-CRATE ?auto_1809714 ) ( AVAILABLE ?auto_1809718 ) ( SURFACE-AT ?auto_1809714 ?auto_1809719 ) ( ON ?auto_1809714 ?auto_1809716 ) ( CLEAR ?auto_1809714 ) ( not ( = ?auto_1809714 ?auto_1809716 ) ) ( not ( = ?auto_1809711 ?auto_1809716 ) ) ( not ( = ?auto_1809713 ?auto_1809716 ) ) ( not ( = ?auto_1809720 ?auto_1809716 ) ) ( TRUCK-AT ?auto_1809717 ?auto_1809721 ) ( SURFACE-AT ?auto_1809712 ?auto_1809721 ) ( CLEAR ?auto_1809712 ) ( LIFTING ?auto_1809715 ?auto_1809713 ) ( IS-CRATE ?auto_1809713 ) ( not ( = ?auto_1809712 ?auto_1809713 ) ) ( not ( = ?auto_1809714 ?auto_1809712 ) ) ( not ( = ?auto_1809711 ?auto_1809712 ) ) ( not ( = ?auto_1809720 ?auto_1809712 ) ) ( not ( = ?auto_1809716 ?auto_1809712 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809713 ?auto_1809714 ?auto_1809711 )
      ( MAKE-3CRATE-VERIFY ?auto_1809712 ?auto_1809713 ?auto_1809714 ?auto_1809711 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1809858 - SURFACE
      ?auto_1809859 - SURFACE
      ?auto_1809860 - SURFACE
      ?auto_1809857 - SURFACE
      ?auto_1809861 - SURFACE
    )
    :vars
    (
      ?auto_1809863 - HOIST
      ?auto_1809862 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809863 ?auto_1809862 ) ( SURFACE-AT ?auto_1809857 ?auto_1809862 ) ( CLEAR ?auto_1809857 ) ( LIFTING ?auto_1809863 ?auto_1809861 ) ( IS-CRATE ?auto_1809861 ) ( not ( = ?auto_1809857 ?auto_1809861 ) ) ( ON ?auto_1809859 ?auto_1809858 ) ( ON ?auto_1809860 ?auto_1809859 ) ( ON ?auto_1809857 ?auto_1809860 ) ( not ( = ?auto_1809858 ?auto_1809859 ) ) ( not ( = ?auto_1809858 ?auto_1809860 ) ) ( not ( = ?auto_1809858 ?auto_1809857 ) ) ( not ( = ?auto_1809858 ?auto_1809861 ) ) ( not ( = ?auto_1809859 ?auto_1809860 ) ) ( not ( = ?auto_1809859 ?auto_1809857 ) ) ( not ( = ?auto_1809859 ?auto_1809861 ) ) ( not ( = ?auto_1809860 ?auto_1809857 ) ) ( not ( = ?auto_1809860 ?auto_1809861 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1809857 ?auto_1809861 )
      ( MAKE-4CRATE-VERIFY ?auto_1809858 ?auto_1809859 ?auto_1809860 ?auto_1809857 ?auto_1809861 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1809883 - SURFACE
      ?auto_1809884 - SURFACE
      ?auto_1809885 - SURFACE
      ?auto_1809882 - SURFACE
      ?auto_1809886 - SURFACE
    )
    :vars
    (
      ?auto_1809887 - HOIST
      ?auto_1809889 - PLACE
      ?auto_1809888 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809887 ?auto_1809889 ) ( SURFACE-AT ?auto_1809882 ?auto_1809889 ) ( CLEAR ?auto_1809882 ) ( IS-CRATE ?auto_1809886 ) ( not ( = ?auto_1809882 ?auto_1809886 ) ) ( TRUCK-AT ?auto_1809888 ?auto_1809889 ) ( AVAILABLE ?auto_1809887 ) ( IN ?auto_1809886 ?auto_1809888 ) ( ON ?auto_1809882 ?auto_1809885 ) ( not ( = ?auto_1809885 ?auto_1809882 ) ) ( not ( = ?auto_1809885 ?auto_1809886 ) ) ( ON ?auto_1809884 ?auto_1809883 ) ( ON ?auto_1809885 ?auto_1809884 ) ( not ( = ?auto_1809883 ?auto_1809884 ) ) ( not ( = ?auto_1809883 ?auto_1809885 ) ) ( not ( = ?auto_1809883 ?auto_1809882 ) ) ( not ( = ?auto_1809883 ?auto_1809886 ) ) ( not ( = ?auto_1809884 ?auto_1809885 ) ) ( not ( = ?auto_1809884 ?auto_1809882 ) ) ( not ( = ?auto_1809884 ?auto_1809886 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809885 ?auto_1809882 ?auto_1809886 )
      ( MAKE-4CRATE-VERIFY ?auto_1809883 ?auto_1809884 ?auto_1809885 ?auto_1809882 ?auto_1809886 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1809913 - SURFACE
      ?auto_1809914 - SURFACE
      ?auto_1809915 - SURFACE
      ?auto_1809912 - SURFACE
      ?auto_1809916 - SURFACE
    )
    :vars
    (
      ?auto_1809920 - HOIST
      ?auto_1809917 - PLACE
      ?auto_1809919 - TRUCK
      ?auto_1809918 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809920 ?auto_1809917 ) ( SURFACE-AT ?auto_1809912 ?auto_1809917 ) ( CLEAR ?auto_1809912 ) ( IS-CRATE ?auto_1809916 ) ( not ( = ?auto_1809912 ?auto_1809916 ) ) ( AVAILABLE ?auto_1809920 ) ( IN ?auto_1809916 ?auto_1809919 ) ( ON ?auto_1809912 ?auto_1809915 ) ( not ( = ?auto_1809915 ?auto_1809912 ) ) ( not ( = ?auto_1809915 ?auto_1809916 ) ) ( TRUCK-AT ?auto_1809919 ?auto_1809918 ) ( not ( = ?auto_1809918 ?auto_1809917 ) ) ( ON ?auto_1809914 ?auto_1809913 ) ( ON ?auto_1809915 ?auto_1809914 ) ( not ( = ?auto_1809913 ?auto_1809914 ) ) ( not ( = ?auto_1809913 ?auto_1809915 ) ) ( not ( = ?auto_1809913 ?auto_1809912 ) ) ( not ( = ?auto_1809913 ?auto_1809916 ) ) ( not ( = ?auto_1809914 ?auto_1809915 ) ) ( not ( = ?auto_1809914 ?auto_1809912 ) ) ( not ( = ?auto_1809914 ?auto_1809916 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809915 ?auto_1809912 ?auto_1809916 )
      ( MAKE-4CRATE-VERIFY ?auto_1809913 ?auto_1809914 ?auto_1809915 ?auto_1809912 ?auto_1809916 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1809947 - SURFACE
      ?auto_1809948 - SURFACE
      ?auto_1809949 - SURFACE
      ?auto_1809946 - SURFACE
      ?auto_1809950 - SURFACE
    )
    :vars
    (
      ?auto_1809952 - HOIST
      ?auto_1809951 - PLACE
      ?auto_1809953 - TRUCK
      ?auto_1809954 - PLACE
      ?auto_1809955 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809952 ?auto_1809951 ) ( SURFACE-AT ?auto_1809946 ?auto_1809951 ) ( CLEAR ?auto_1809946 ) ( IS-CRATE ?auto_1809950 ) ( not ( = ?auto_1809946 ?auto_1809950 ) ) ( AVAILABLE ?auto_1809952 ) ( ON ?auto_1809946 ?auto_1809949 ) ( not ( = ?auto_1809949 ?auto_1809946 ) ) ( not ( = ?auto_1809949 ?auto_1809950 ) ) ( TRUCK-AT ?auto_1809953 ?auto_1809954 ) ( not ( = ?auto_1809954 ?auto_1809951 ) ) ( HOIST-AT ?auto_1809955 ?auto_1809954 ) ( LIFTING ?auto_1809955 ?auto_1809950 ) ( not ( = ?auto_1809952 ?auto_1809955 ) ) ( ON ?auto_1809948 ?auto_1809947 ) ( ON ?auto_1809949 ?auto_1809948 ) ( not ( = ?auto_1809947 ?auto_1809948 ) ) ( not ( = ?auto_1809947 ?auto_1809949 ) ) ( not ( = ?auto_1809947 ?auto_1809946 ) ) ( not ( = ?auto_1809947 ?auto_1809950 ) ) ( not ( = ?auto_1809948 ?auto_1809949 ) ) ( not ( = ?auto_1809948 ?auto_1809946 ) ) ( not ( = ?auto_1809948 ?auto_1809950 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809949 ?auto_1809946 ?auto_1809950 )
      ( MAKE-4CRATE-VERIFY ?auto_1809947 ?auto_1809948 ?auto_1809949 ?auto_1809946 ?auto_1809950 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1809985 - SURFACE
      ?auto_1809986 - SURFACE
      ?auto_1809987 - SURFACE
      ?auto_1809984 - SURFACE
      ?auto_1809988 - SURFACE
    )
    :vars
    (
      ?auto_1809993 - HOIST
      ?auto_1809989 - PLACE
      ?auto_1809992 - TRUCK
      ?auto_1809994 - PLACE
      ?auto_1809990 - HOIST
      ?auto_1809991 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809993 ?auto_1809989 ) ( SURFACE-AT ?auto_1809984 ?auto_1809989 ) ( CLEAR ?auto_1809984 ) ( IS-CRATE ?auto_1809988 ) ( not ( = ?auto_1809984 ?auto_1809988 ) ) ( AVAILABLE ?auto_1809993 ) ( ON ?auto_1809984 ?auto_1809987 ) ( not ( = ?auto_1809987 ?auto_1809984 ) ) ( not ( = ?auto_1809987 ?auto_1809988 ) ) ( TRUCK-AT ?auto_1809992 ?auto_1809994 ) ( not ( = ?auto_1809994 ?auto_1809989 ) ) ( HOIST-AT ?auto_1809990 ?auto_1809994 ) ( not ( = ?auto_1809993 ?auto_1809990 ) ) ( AVAILABLE ?auto_1809990 ) ( SURFACE-AT ?auto_1809988 ?auto_1809994 ) ( ON ?auto_1809988 ?auto_1809991 ) ( CLEAR ?auto_1809988 ) ( not ( = ?auto_1809984 ?auto_1809991 ) ) ( not ( = ?auto_1809988 ?auto_1809991 ) ) ( not ( = ?auto_1809987 ?auto_1809991 ) ) ( ON ?auto_1809986 ?auto_1809985 ) ( ON ?auto_1809987 ?auto_1809986 ) ( not ( = ?auto_1809985 ?auto_1809986 ) ) ( not ( = ?auto_1809985 ?auto_1809987 ) ) ( not ( = ?auto_1809985 ?auto_1809984 ) ) ( not ( = ?auto_1809985 ?auto_1809988 ) ) ( not ( = ?auto_1809985 ?auto_1809991 ) ) ( not ( = ?auto_1809986 ?auto_1809987 ) ) ( not ( = ?auto_1809986 ?auto_1809984 ) ) ( not ( = ?auto_1809986 ?auto_1809988 ) ) ( not ( = ?auto_1809986 ?auto_1809991 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809987 ?auto_1809984 ?auto_1809988 )
      ( MAKE-4CRATE-VERIFY ?auto_1809985 ?auto_1809986 ?auto_1809987 ?auto_1809984 ?auto_1809988 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1810024 - SURFACE
      ?auto_1810025 - SURFACE
      ?auto_1810026 - SURFACE
      ?auto_1810023 - SURFACE
      ?auto_1810027 - SURFACE
    )
    :vars
    (
      ?auto_1810032 - HOIST
      ?auto_1810033 - PLACE
      ?auto_1810030 - PLACE
      ?auto_1810028 - HOIST
      ?auto_1810031 - SURFACE
      ?auto_1810029 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1810032 ?auto_1810033 ) ( SURFACE-AT ?auto_1810023 ?auto_1810033 ) ( CLEAR ?auto_1810023 ) ( IS-CRATE ?auto_1810027 ) ( not ( = ?auto_1810023 ?auto_1810027 ) ) ( AVAILABLE ?auto_1810032 ) ( ON ?auto_1810023 ?auto_1810026 ) ( not ( = ?auto_1810026 ?auto_1810023 ) ) ( not ( = ?auto_1810026 ?auto_1810027 ) ) ( not ( = ?auto_1810030 ?auto_1810033 ) ) ( HOIST-AT ?auto_1810028 ?auto_1810030 ) ( not ( = ?auto_1810032 ?auto_1810028 ) ) ( AVAILABLE ?auto_1810028 ) ( SURFACE-AT ?auto_1810027 ?auto_1810030 ) ( ON ?auto_1810027 ?auto_1810031 ) ( CLEAR ?auto_1810027 ) ( not ( = ?auto_1810023 ?auto_1810031 ) ) ( not ( = ?auto_1810027 ?auto_1810031 ) ) ( not ( = ?auto_1810026 ?auto_1810031 ) ) ( TRUCK-AT ?auto_1810029 ?auto_1810033 ) ( ON ?auto_1810025 ?auto_1810024 ) ( ON ?auto_1810026 ?auto_1810025 ) ( not ( = ?auto_1810024 ?auto_1810025 ) ) ( not ( = ?auto_1810024 ?auto_1810026 ) ) ( not ( = ?auto_1810024 ?auto_1810023 ) ) ( not ( = ?auto_1810024 ?auto_1810027 ) ) ( not ( = ?auto_1810024 ?auto_1810031 ) ) ( not ( = ?auto_1810025 ?auto_1810026 ) ) ( not ( = ?auto_1810025 ?auto_1810023 ) ) ( not ( = ?auto_1810025 ?auto_1810027 ) ) ( not ( = ?auto_1810025 ?auto_1810031 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1810026 ?auto_1810023 ?auto_1810027 )
      ( MAKE-4CRATE-VERIFY ?auto_1810024 ?auto_1810025 ?auto_1810026 ?auto_1810023 ?auto_1810027 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1810063 - SURFACE
      ?auto_1810064 - SURFACE
      ?auto_1810065 - SURFACE
      ?auto_1810062 - SURFACE
      ?auto_1810066 - SURFACE
    )
    :vars
    (
      ?auto_1810071 - HOIST
      ?auto_1810070 - PLACE
      ?auto_1810069 - PLACE
      ?auto_1810072 - HOIST
      ?auto_1810068 - SURFACE
      ?auto_1810067 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1810071 ?auto_1810070 ) ( IS-CRATE ?auto_1810066 ) ( not ( = ?auto_1810062 ?auto_1810066 ) ) ( not ( = ?auto_1810065 ?auto_1810062 ) ) ( not ( = ?auto_1810065 ?auto_1810066 ) ) ( not ( = ?auto_1810069 ?auto_1810070 ) ) ( HOIST-AT ?auto_1810072 ?auto_1810069 ) ( not ( = ?auto_1810071 ?auto_1810072 ) ) ( AVAILABLE ?auto_1810072 ) ( SURFACE-AT ?auto_1810066 ?auto_1810069 ) ( ON ?auto_1810066 ?auto_1810068 ) ( CLEAR ?auto_1810066 ) ( not ( = ?auto_1810062 ?auto_1810068 ) ) ( not ( = ?auto_1810066 ?auto_1810068 ) ) ( not ( = ?auto_1810065 ?auto_1810068 ) ) ( TRUCK-AT ?auto_1810067 ?auto_1810070 ) ( SURFACE-AT ?auto_1810065 ?auto_1810070 ) ( CLEAR ?auto_1810065 ) ( LIFTING ?auto_1810071 ?auto_1810062 ) ( IS-CRATE ?auto_1810062 ) ( ON ?auto_1810064 ?auto_1810063 ) ( ON ?auto_1810065 ?auto_1810064 ) ( not ( = ?auto_1810063 ?auto_1810064 ) ) ( not ( = ?auto_1810063 ?auto_1810065 ) ) ( not ( = ?auto_1810063 ?auto_1810062 ) ) ( not ( = ?auto_1810063 ?auto_1810066 ) ) ( not ( = ?auto_1810063 ?auto_1810068 ) ) ( not ( = ?auto_1810064 ?auto_1810065 ) ) ( not ( = ?auto_1810064 ?auto_1810062 ) ) ( not ( = ?auto_1810064 ?auto_1810066 ) ) ( not ( = ?auto_1810064 ?auto_1810068 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1810065 ?auto_1810062 ?auto_1810066 )
      ( MAKE-4CRATE-VERIFY ?auto_1810063 ?auto_1810064 ?auto_1810065 ?auto_1810062 ?auto_1810066 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1810102 - SURFACE
      ?auto_1810103 - SURFACE
      ?auto_1810104 - SURFACE
      ?auto_1810101 - SURFACE
      ?auto_1810105 - SURFACE
    )
    :vars
    (
      ?auto_1810109 - HOIST
      ?auto_1810106 - PLACE
      ?auto_1810107 - PLACE
      ?auto_1810110 - HOIST
      ?auto_1810108 - SURFACE
      ?auto_1810111 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1810109 ?auto_1810106 ) ( IS-CRATE ?auto_1810105 ) ( not ( = ?auto_1810101 ?auto_1810105 ) ) ( not ( = ?auto_1810104 ?auto_1810101 ) ) ( not ( = ?auto_1810104 ?auto_1810105 ) ) ( not ( = ?auto_1810107 ?auto_1810106 ) ) ( HOIST-AT ?auto_1810110 ?auto_1810107 ) ( not ( = ?auto_1810109 ?auto_1810110 ) ) ( AVAILABLE ?auto_1810110 ) ( SURFACE-AT ?auto_1810105 ?auto_1810107 ) ( ON ?auto_1810105 ?auto_1810108 ) ( CLEAR ?auto_1810105 ) ( not ( = ?auto_1810101 ?auto_1810108 ) ) ( not ( = ?auto_1810105 ?auto_1810108 ) ) ( not ( = ?auto_1810104 ?auto_1810108 ) ) ( TRUCK-AT ?auto_1810111 ?auto_1810106 ) ( SURFACE-AT ?auto_1810104 ?auto_1810106 ) ( CLEAR ?auto_1810104 ) ( IS-CRATE ?auto_1810101 ) ( AVAILABLE ?auto_1810109 ) ( IN ?auto_1810101 ?auto_1810111 ) ( ON ?auto_1810103 ?auto_1810102 ) ( ON ?auto_1810104 ?auto_1810103 ) ( not ( = ?auto_1810102 ?auto_1810103 ) ) ( not ( = ?auto_1810102 ?auto_1810104 ) ) ( not ( = ?auto_1810102 ?auto_1810101 ) ) ( not ( = ?auto_1810102 ?auto_1810105 ) ) ( not ( = ?auto_1810102 ?auto_1810108 ) ) ( not ( = ?auto_1810103 ?auto_1810104 ) ) ( not ( = ?auto_1810103 ?auto_1810101 ) ) ( not ( = ?auto_1810103 ?auto_1810105 ) ) ( not ( = ?auto_1810103 ?auto_1810108 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1810104 ?auto_1810101 ?auto_1810105 )
      ( MAKE-4CRATE-VERIFY ?auto_1810102 ?auto_1810103 ?auto_1810104 ?auto_1810101 ?auto_1810105 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1810374 - SURFACE
      ?auto_1810375 - SURFACE
    )
    :vars
    (
      ?auto_1810381 - HOIST
      ?auto_1810380 - PLACE
      ?auto_1810382 - SURFACE
      ?auto_1810376 - PLACE
      ?auto_1810377 - HOIST
      ?auto_1810379 - SURFACE
      ?auto_1810378 - TRUCK
      ?auto_1810383 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1810381 ?auto_1810380 ) ( SURFACE-AT ?auto_1810374 ?auto_1810380 ) ( CLEAR ?auto_1810374 ) ( IS-CRATE ?auto_1810375 ) ( not ( = ?auto_1810374 ?auto_1810375 ) ) ( ON ?auto_1810374 ?auto_1810382 ) ( not ( = ?auto_1810382 ?auto_1810374 ) ) ( not ( = ?auto_1810382 ?auto_1810375 ) ) ( not ( = ?auto_1810376 ?auto_1810380 ) ) ( HOIST-AT ?auto_1810377 ?auto_1810376 ) ( not ( = ?auto_1810381 ?auto_1810377 ) ) ( AVAILABLE ?auto_1810377 ) ( SURFACE-AT ?auto_1810375 ?auto_1810376 ) ( ON ?auto_1810375 ?auto_1810379 ) ( CLEAR ?auto_1810375 ) ( not ( = ?auto_1810374 ?auto_1810379 ) ) ( not ( = ?auto_1810375 ?auto_1810379 ) ) ( not ( = ?auto_1810382 ?auto_1810379 ) ) ( TRUCK-AT ?auto_1810378 ?auto_1810380 ) ( LIFTING ?auto_1810381 ?auto_1810383 ) ( IS-CRATE ?auto_1810383 ) ( not ( = ?auto_1810374 ?auto_1810383 ) ) ( not ( = ?auto_1810375 ?auto_1810383 ) ) ( not ( = ?auto_1810382 ?auto_1810383 ) ) ( not ( = ?auto_1810379 ?auto_1810383 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1810381 ?auto_1810383 ?auto_1810378 ?auto_1810380 )
      ( MAKE-1CRATE ?auto_1810374 ?auto_1810375 )
      ( MAKE-1CRATE-VERIFY ?auto_1810374 ?auto_1810375 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1810761 - SURFACE
      ?auto_1810762 - SURFACE
      ?auto_1810763 - SURFACE
      ?auto_1810760 - SURFACE
      ?auto_1810764 - SURFACE
      ?auto_1810765 - SURFACE
    )
    :vars
    (
      ?auto_1810767 - HOIST
      ?auto_1810766 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1810767 ?auto_1810766 ) ( SURFACE-AT ?auto_1810764 ?auto_1810766 ) ( CLEAR ?auto_1810764 ) ( LIFTING ?auto_1810767 ?auto_1810765 ) ( IS-CRATE ?auto_1810765 ) ( not ( = ?auto_1810764 ?auto_1810765 ) ) ( ON ?auto_1810762 ?auto_1810761 ) ( ON ?auto_1810763 ?auto_1810762 ) ( ON ?auto_1810760 ?auto_1810763 ) ( ON ?auto_1810764 ?auto_1810760 ) ( not ( = ?auto_1810761 ?auto_1810762 ) ) ( not ( = ?auto_1810761 ?auto_1810763 ) ) ( not ( = ?auto_1810761 ?auto_1810760 ) ) ( not ( = ?auto_1810761 ?auto_1810764 ) ) ( not ( = ?auto_1810761 ?auto_1810765 ) ) ( not ( = ?auto_1810762 ?auto_1810763 ) ) ( not ( = ?auto_1810762 ?auto_1810760 ) ) ( not ( = ?auto_1810762 ?auto_1810764 ) ) ( not ( = ?auto_1810762 ?auto_1810765 ) ) ( not ( = ?auto_1810763 ?auto_1810760 ) ) ( not ( = ?auto_1810763 ?auto_1810764 ) ) ( not ( = ?auto_1810763 ?auto_1810765 ) ) ( not ( = ?auto_1810760 ?auto_1810764 ) ) ( not ( = ?auto_1810760 ?auto_1810765 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1810764 ?auto_1810765 )
      ( MAKE-5CRATE-VERIFY ?auto_1810761 ?auto_1810762 ?auto_1810763 ?auto_1810760 ?auto_1810764 ?auto_1810765 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1810795 - SURFACE
      ?auto_1810796 - SURFACE
      ?auto_1810797 - SURFACE
      ?auto_1810794 - SURFACE
      ?auto_1810798 - SURFACE
      ?auto_1810799 - SURFACE
    )
    :vars
    (
      ?auto_1810800 - HOIST
      ?auto_1810801 - PLACE
      ?auto_1810802 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1810800 ?auto_1810801 ) ( SURFACE-AT ?auto_1810798 ?auto_1810801 ) ( CLEAR ?auto_1810798 ) ( IS-CRATE ?auto_1810799 ) ( not ( = ?auto_1810798 ?auto_1810799 ) ) ( TRUCK-AT ?auto_1810802 ?auto_1810801 ) ( AVAILABLE ?auto_1810800 ) ( IN ?auto_1810799 ?auto_1810802 ) ( ON ?auto_1810798 ?auto_1810794 ) ( not ( = ?auto_1810794 ?auto_1810798 ) ) ( not ( = ?auto_1810794 ?auto_1810799 ) ) ( ON ?auto_1810796 ?auto_1810795 ) ( ON ?auto_1810797 ?auto_1810796 ) ( ON ?auto_1810794 ?auto_1810797 ) ( not ( = ?auto_1810795 ?auto_1810796 ) ) ( not ( = ?auto_1810795 ?auto_1810797 ) ) ( not ( = ?auto_1810795 ?auto_1810794 ) ) ( not ( = ?auto_1810795 ?auto_1810798 ) ) ( not ( = ?auto_1810795 ?auto_1810799 ) ) ( not ( = ?auto_1810796 ?auto_1810797 ) ) ( not ( = ?auto_1810796 ?auto_1810794 ) ) ( not ( = ?auto_1810796 ?auto_1810798 ) ) ( not ( = ?auto_1810796 ?auto_1810799 ) ) ( not ( = ?auto_1810797 ?auto_1810794 ) ) ( not ( = ?auto_1810797 ?auto_1810798 ) ) ( not ( = ?auto_1810797 ?auto_1810799 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1810794 ?auto_1810798 ?auto_1810799 )
      ( MAKE-5CRATE-VERIFY ?auto_1810795 ?auto_1810796 ?auto_1810797 ?auto_1810794 ?auto_1810798 ?auto_1810799 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1810835 - SURFACE
      ?auto_1810836 - SURFACE
      ?auto_1810837 - SURFACE
      ?auto_1810834 - SURFACE
      ?auto_1810838 - SURFACE
      ?auto_1810839 - SURFACE
    )
    :vars
    (
      ?auto_1810842 - HOIST
      ?auto_1810843 - PLACE
      ?auto_1810841 - TRUCK
      ?auto_1810840 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1810842 ?auto_1810843 ) ( SURFACE-AT ?auto_1810838 ?auto_1810843 ) ( CLEAR ?auto_1810838 ) ( IS-CRATE ?auto_1810839 ) ( not ( = ?auto_1810838 ?auto_1810839 ) ) ( AVAILABLE ?auto_1810842 ) ( IN ?auto_1810839 ?auto_1810841 ) ( ON ?auto_1810838 ?auto_1810834 ) ( not ( = ?auto_1810834 ?auto_1810838 ) ) ( not ( = ?auto_1810834 ?auto_1810839 ) ) ( TRUCK-AT ?auto_1810841 ?auto_1810840 ) ( not ( = ?auto_1810840 ?auto_1810843 ) ) ( ON ?auto_1810836 ?auto_1810835 ) ( ON ?auto_1810837 ?auto_1810836 ) ( ON ?auto_1810834 ?auto_1810837 ) ( not ( = ?auto_1810835 ?auto_1810836 ) ) ( not ( = ?auto_1810835 ?auto_1810837 ) ) ( not ( = ?auto_1810835 ?auto_1810834 ) ) ( not ( = ?auto_1810835 ?auto_1810838 ) ) ( not ( = ?auto_1810835 ?auto_1810839 ) ) ( not ( = ?auto_1810836 ?auto_1810837 ) ) ( not ( = ?auto_1810836 ?auto_1810834 ) ) ( not ( = ?auto_1810836 ?auto_1810838 ) ) ( not ( = ?auto_1810836 ?auto_1810839 ) ) ( not ( = ?auto_1810837 ?auto_1810834 ) ) ( not ( = ?auto_1810837 ?auto_1810838 ) ) ( not ( = ?auto_1810837 ?auto_1810839 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1810834 ?auto_1810838 ?auto_1810839 )
      ( MAKE-5CRATE-VERIFY ?auto_1810835 ?auto_1810836 ?auto_1810837 ?auto_1810834 ?auto_1810838 ?auto_1810839 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1810880 - SURFACE
      ?auto_1810881 - SURFACE
      ?auto_1810882 - SURFACE
      ?auto_1810879 - SURFACE
      ?auto_1810883 - SURFACE
      ?auto_1810884 - SURFACE
    )
    :vars
    (
      ?auto_1810888 - HOIST
      ?auto_1810887 - PLACE
      ?auto_1810886 - TRUCK
      ?auto_1810889 - PLACE
      ?auto_1810885 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1810888 ?auto_1810887 ) ( SURFACE-AT ?auto_1810883 ?auto_1810887 ) ( CLEAR ?auto_1810883 ) ( IS-CRATE ?auto_1810884 ) ( not ( = ?auto_1810883 ?auto_1810884 ) ) ( AVAILABLE ?auto_1810888 ) ( ON ?auto_1810883 ?auto_1810879 ) ( not ( = ?auto_1810879 ?auto_1810883 ) ) ( not ( = ?auto_1810879 ?auto_1810884 ) ) ( TRUCK-AT ?auto_1810886 ?auto_1810889 ) ( not ( = ?auto_1810889 ?auto_1810887 ) ) ( HOIST-AT ?auto_1810885 ?auto_1810889 ) ( LIFTING ?auto_1810885 ?auto_1810884 ) ( not ( = ?auto_1810888 ?auto_1810885 ) ) ( ON ?auto_1810881 ?auto_1810880 ) ( ON ?auto_1810882 ?auto_1810881 ) ( ON ?auto_1810879 ?auto_1810882 ) ( not ( = ?auto_1810880 ?auto_1810881 ) ) ( not ( = ?auto_1810880 ?auto_1810882 ) ) ( not ( = ?auto_1810880 ?auto_1810879 ) ) ( not ( = ?auto_1810880 ?auto_1810883 ) ) ( not ( = ?auto_1810880 ?auto_1810884 ) ) ( not ( = ?auto_1810881 ?auto_1810882 ) ) ( not ( = ?auto_1810881 ?auto_1810879 ) ) ( not ( = ?auto_1810881 ?auto_1810883 ) ) ( not ( = ?auto_1810881 ?auto_1810884 ) ) ( not ( = ?auto_1810882 ?auto_1810879 ) ) ( not ( = ?auto_1810882 ?auto_1810883 ) ) ( not ( = ?auto_1810882 ?auto_1810884 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1810879 ?auto_1810883 ?auto_1810884 )
      ( MAKE-5CRATE-VERIFY ?auto_1810880 ?auto_1810881 ?auto_1810882 ?auto_1810879 ?auto_1810883 ?auto_1810884 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1810930 - SURFACE
      ?auto_1810931 - SURFACE
      ?auto_1810932 - SURFACE
      ?auto_1810929 - SURFACE
      ?auto_1810933 - SURFACE
      ?auto_1810934 - SURFACE
    )
    :vars
    (
      ?auto_1810936 - HOIST
      ?auto_1810940 - PLACE
      ?auto_1810938 - TRUCK
      ?auto_1810935 - PLACE
      ?auto_1810937 - HOIST
      ?auto_1810939 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1810936 ?auto_1810940 ) ( SURFACE-AT ?auto_1810933 ?auto_1810940 ) ( CLEAR ?auto_1810933 ) ( IS-CRATE ?auto_1810934 ) ( not ( = ?auto_1810933 ?auto_1810934 ) ) ( AVAILABLE ?auto_1810936 ) ( ON ?auto_1810933 ?auto_1810929 ) ( not ( = ?auto_1810929 ?auto_1810933 ) ) ( not ( = ?auto_1810929 ?auto_1810934 ) ) ( TRUCK-AT ?auto_1810938 ?auto_1810935 ) ( not ( = ?auto_1810935 ?auto_1810940 ) ) ( HOIST-AT ?auto_1810937 ?auto_1810935 ) ( not ( = ?auto_1810936 ?auto_1810937 ) ) ( AVAILABLE ?auto_1810937 ) ( SURFACE-AT ?auto_1810934 ?auto_1810935 ) ( ON ?auto_1810934 ?auto_1810939 ) ( CLEAR ?auto_1810934 ) ( not ( = ?auto_1810933 ?auto_1810939 ) ) ( not ( = ?auto_1810934 ?auto_1810939 ) ) ( not ( = ?auto_1810929 ?auto_1810939 ) ) ( ON ?auto_1810931 ?auto_1810930 ) ( ON ?auto_1810932 ?auto_1810931 ) ( ON ?auto_1810929 ?auto_1810932 ) ( not ( = ?auto_1810930 ?auto_1810931 ) ) ( not ( = ?auto_1810930 ?auto_1810932 ) ) ( not ( = ?auto_1810930 ?auto_1810929 ) ) ( not ( = ?auto_1810930 ?auto_1810933 ) ) ( not ( = ?auto_1810930 ?auto_1810934 ) ) ( not ( = ?auto_1810930 ?auto_1810939 ) ) ( not ( = ?auto_1810931 ?auto_1810932 ) ) ( not ( = ?auto_1810931 ?auto_1810929 ) ) ( not ( = ?auto_1810931 ?auto_1810933 ) ) ( not ( = ?auto_1810931 ?auto_1810934 ) ) ( not ( = ?auto_1810931 ?auto_1810939 ) ) ( not ( = ?auto_1810932 ?auto_1810929 ) ) ( not ( = ?auto_1810932 ?auto_1810933 ) ) ( not ( = ?auto_1810932 ?auto_1810934 ) ) ( not ( = ?auto_1810932 ?auto_1810939 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1810929 ?auto_1810933 ?auto_1810934 )
      ( MAKE-5CRATE-VERIFY ?auto_1810930 ?auto_1810931 ?auto_1810932 ?auto_1810929 ?auto_1810933 ?auto_1810934 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1810981 - SURFACE
      ?auto_1810982 - SURFACE
      ?auto_1810983 - SURFACE
      ?auto_1810980 - SURFACE
      ?auto_1810984 - SURFACE
      ?auto_1810985 - SURFACE
    )
    :vars
    (
      ?auto_1810990 - HOIST
      ?auto_1810989 - PLACE
      ?auto_1810987 - PLACE
      ?auto_1810991 - HOIST
      ?auto_1810988 - SURFACE
      ?auto_1810986 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1810990 ?auto_1810989 ) ( SURFACE-AT ?auto_1810984 ?auto_1810989 ) ( CLEAR ?auto_1810984 ) ( IS-CRATE ?auto_1810985 ) ( not ( = ?auto_1810984 ?auto_1810985 ) ) ( AVAILABLE ?auto_1810990 ) ( ON ?auto_1810984 ?auto_1810980 ) ( not ( = ?auto_1810980 ?auto_1810984 ) ) ( not ( = ?auto_1810980 ?auto_1810985 ) ) ( not ( = ?auto_1810987 ?auto_1810989 ) ) ( HOIST-AT ?auto_1810991 ?auto_1810987 ) ( not ( = ?auto_1810990 ?auto_1810991 ) ) ( AVAILABLE ?auto_1810991 ) ( SURFACE-AT ?auto_1810985 ?auto_1810987 ) ( ON ?auto_1810985 ?auto_1810988 ) ( CLEAR ?auto_1810985 ) ( not ( = ?auto_1810984 ?auto_1810988 ) ) ( not ( = ?auto_1810985 ?auto_1810988 ) ) ( not ( = ?auto_1810980 ?auto_1810988 ) ) ( TRUCK-AT ?auto_1810986 ?auto_1810989 ) ( ON ?auto_1810982 ?auto_1810981 ) ( ON ?auto_1810983 ?auto_1810982 ) ( ON ?auto_1810980 ?auto_1810983 ) ( not ( = ?auto_1810981 ?auto_1810982 ) ) ( not ( = ?auto_1810981 ?auto_1810983 ) ) ( not ( = ?auto_1810981 ?auto_1810980 ) ) ( not ( = ?auto_1810981 ?auto_1810984 ) ) ( not ( = ?auto_1810981 ?auto_1810985 ) ) ( not ( = ?auto_1810981 ?auto_1810988 ) ) ( not ( = ?auto_1810982 ?auto_1810983 ) ) ( not ( = ?auto_1810982 ?auto_1810980 ) ) ( not ( = ?auto_1810982 ?auto_1810984 ) ) ( not ( = ?auto_1810982 ?auto_1810985 ) ) ( not ( = ?auto_1810982 ?auto_1810988 ) ) ( not ( = ?auto_1810983 ?auto_1810980 ) ) ( not ( = ?auto_1810983 ?auto_1810984 ) ) ( not ( = ?auto_1810983 ?auto_1810985 ) ) ( not ( = ?auto_1810983 ?auto_1810988 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1810980 ?auto_1810984 ?auto_1810985 )
      ( MAKE-5CRATE-VERIFY ?auto_1810981 ?auto_1810982 ?auto_1810983 ?auto_1810980 ?auto_1810984 ?auto_1810985 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1811032 - SURFACE
      ?auto_1811033 - SURFACE
      ?auto_1811034 - SURFACE
      ?auto_1811031 - SURFACE
      ?auto_1811035 - SURFACE
      ?auto_1811036 - SURFACE
    )
    :vars
    (
      ?auto_1811042 - HOIST
      ?auto_1811040 - PLACE
      ?auto_1811039 - PLACE
      ?auto_1811041 - HOIST
      ?auto_1811038 - SURFACE
      ?auto_1811037 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1811042 ?auto_1811040 ) ( IS-CRATE ?auto_1811036 ) ( not ( = ?auto_1811035 ?auto_1811036 ) ) ( not ( = ?auto_1811031 ?auto_1811035 ) ) ( not ( = ?auto_1811031 ?auto_1811036 ) ) ( not ( = ?auto_1811039 ?auto_1811040 ) ) ( HOIST-AT ?auto_1811041 ?auto_1811039 ) ( not ( = ?auto_1811042 ?auto_1811041 ) ) ( AVAILABLE ?auto_1811041 ) ( SURFACE-AT ?auto_1811036 ?auto_1811039 ) ( ON ?auto_1811036 ?auto_1811038 ) ( CLEAR ?auto_1811036 ) ( not ( = ?auto_1811035 ?auto_1811038 ) ) ( not ( = ?auto_1811036 ?auto_1811038 ) ) ( not ( = ?auto_1811031 ?auto_1811038 ) ) ( TRUCK-AT ?auto_1811037 ?auto_1811040 ) ( SURFACE-AT ?auto_1811031 ?auto_1811040 ) ( CLEAR ?auto_1811031 ) ( LIFTING ?auto_1811042 ?auto_1811035 ) ( IS-CRATE ?auto_1811035 ) ( ON ?auto_1811033 ?auto_1811032 ) ( ON ?auto_1811034 ?auto_1811033 ) ( ON ?auto_1811031 ?auto_1811034 ) ( not ( = ?auto_1811032 ?auto_1811033 ) ) ( not ( = ?auto_1811032 ?auto_1811034 ) ) ( not ( = ?auto_1811032 ?auto_1811031 ) ) ( not ( = ?auto_1811032 ?auto_1811035 ) ) ( not ( = ?auto_1811032 ?auto_1811036 ) ) ( not ( = ?auto_1811032 ?auto_1811038 ) ) ( not ( = ?auto_1811033 ?auto_1811034 ) ) ( not ( = ?auto_1811033 ?auto_1811031 ) ) ( not ( = ?auto_1811033 ?auto_1811035 ) ) ( not ( = ?auto_1811033 ?auto_1811036 ) ) ( not ( = ?auto_1811033 ?auto_1811038 ) ) ( not ( = ?auto_1811034 ?auto_1811031 ) ) ( not ( = ?auto_1811034 ?auto_1811035 ) ) ( not ( = ?auto_1811034 ?auto_1811036 ) ) ( not ( = ?auto_1811034 ?auto_1811038 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1811031 ?auto_1811035 ?auto_1811036 )
      ( MAKE-5CRATE-VERIFY ?auto_1811032 ?auto_1811033 ?auto_1811034 ?auto_1811031 ?auto_1811035 ?auto_1811036 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1811083 - SURFACE
      ?auto_1811084 - SURFACE
      ?auto_1811085 - SURFACE
      ?auto_1811082 - SURFACE
      ?auto_1811086 - SURFACE
      ?auto_1811087 - SURFACE
    )
    :vars
    (
      ?auto_1811088 - HOIST
      ?auto_1811089 - PLACE
      ?auto_1811093 - PLACE
      ?auto_1811091 - HOIST
      ?auto_1811090 - SURFACE
      ?auto_1811092 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1811088 ?auto_1811089 ) ( IS-CRATE ?auto_1811087 ) ( not ( = ?auto_1811086 ?auto_1811087 ) ) ( not ( = ?auto_1811082 ?auto_1811086 ) ) ( not ( = ?auto_1811082 ?auto_1811087 ) ) ( not ( = ?auto_1811093 ?auto_1811089 ) ) ( HOIST-AT ?auto_1811091 ?auto_1811093 ) ( not ( = ?auto_1811088 ?auto_1811091 ) ) ( AVAILABLE ?auto_1811091 ) ( SURFACE-AT ?auto_1811087 ?auto_1811093 ) ( ON ?auto_1811087 ?auto_1811090 ) ( CLEAR ?auto_1811087 ) ( not ( = ?auto_1811086 ?auto_1811090 ) ) ( not ( = ?auto_1811087 ?auto_1811090 ) ) ( not ( = ?auto_1811082 ?auto_1811090 ) ) ( TRUCK-AT ?auto_1811092 ?auto_1811089 ) ( SURFACE-AT ?auto_1811082 ?auto_1811089 ) ( CLEAR ?auto_1811082 ) ( IS-CRATE ?auto_1811086 ) ( AVAILABLE ?auto_1811088 ) ( IN ?auto_1811086 ?auto_1811092 ) ( ON ?auto_1811084 ?auto_1811083 ) ( ON ?auto_1811085 ?auto_1811084 ) ( ON ?auto_1811082 ?auto_1811085 ) ( not ( = ?auto_1811083 ?auto_1811084 ) ) ( not ( = ?auto_1811083 ?auto_1811085 ) ) ( not ( = ?auto_1811083 ?auto_1811082 ) ) ( not ( = ?auto_1811083 ?auto_1811086 ) ) ( not ( = ?auto_1811083 ?auto_1811087 ) ) ( not ( = ?auto_1811083 ?auto_1811090 ) ) ( not ( = ?auto_1811084 ?auto_1811085 ) ) ( not ( = ?auto_1811084 ?auto_1811082 ) ) ( not ( = ?auto_1811084 ?auto_1811086 ) ) ( not ( = ?auto_1811084 ?auto_1811087 ) ) ( not ( = ?auto_1811084 ?auto_1811090 ) ) ( not ( = ?auto_1811085 ?auto_1811082 ) ) ( not ( = ?auto_1811085 ?auto_1811086 ) ) ( not ( = ?auto_1811085 ?auto_1811087 ) ) ( not ( = ?auto_1811085 ?auto_1811090 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1811082 ?auto_1811086 ?auto_1811087 )
      ( MAKE-5CRATE-VERIFY ?auto_1811083 ?auto_1811084 ?auto_1811085 ?auto_1811082 ?auto_1811086 ?auto_1811087 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1812292 - SURFACE
      ?auto_1812293 - SURFACE
      ?auto_1812294 - SURFACE
      ?auto_1812291 - SURFACE
      ?auto_1812295 - SURFACE
      ?auto_1812297 - SURFACE
      ?auto_1812296 - SURFACE
    )
    :vars
    (
      ?auto_1812299 - HOIST
      ?auto_1812298 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1812299 ?auto_1812298 ) ( SURFACE-AT ?auto_1812297 ?auto_1812298 ) ( CLEAR ?auto_1812297 ) ( LIFTING ?auto_1812299 ?auto_1812296 ) ( IS-CRATE ?auto_1812296 ) ( not ( = ?auto_1812297 ?auto_1812296 ) ) ( ON ?auto_1812293 ?auto_1812292 ) ( ON ?auto_1812294 ?auto_1812293 ) ( ON ?auto_1812291 ?auto_1812294 ) ( ON ?auto_1812295 ?auto_1812291 ) ( ON ?auto_1812297 ?auto_1812295 ) ( not ( = ?auto_1812292 ?auto_1812293 ) ) ( not ( = ?auto_1812292 ?auto_1812294 ) ) ( not ( = ?auto_1812292 ?auto_1812291 ) ) ( not ( = ?auto_1812292 ?auto_1812295 ) ) ( not ( = ?auto_1812292 ?auto_1812297 ) ) ( not ( = ?auto_1812292 ?auto_1812296 ) ) ( not ( = ?auto_1812293 ?auto_1812294 ) ) ( not ( = ?auto_1812293 ?auto_1812291 ) ) ( not ( = ?auto_1812293 ?auto_1812295 ) ) ( not ( = ?auto_1812293 ?auto_1812297 ) ) ( not ( = ?auto_1812293 ?auto_1812296 ) ) ( not ( = ?auto_1812294 ?auto_1812291 ) ) ( not ( = ?auto_1812294 ?auto_1812295 ) ) ( not ( = ?auto_1812294 ?auto_1812297 ) ) ( not ( = ?auto_1812294 ?auto_1812296 ) ) ( not ( = ?auto_1812291 ?auto_1812295 ) ) ( not ( = ?auto_1812291 ?auto_1812297 ) ) ( not ( = ?auto_1812291 ?auto_1812296 ) ) ( not ( = ?auto_1812295 ?auto_1812297 ) ) ( not ( = ?auto_1812295 ?auto_1812296 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1812297 ?auto_1812296 )
      ( MAKE-6CRATE-VERIFY ?auto_1812292 ?auto_1812293 ?auto_1812294 ?auto_1812291 ?auto_1812295 ?auto_1812297 ?auto_1812296 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1812336 - SURFACE
      ?auto_1812337 - SURFACE
      ?auto_1812338 - SURFACE
      ?auto_1812335 - SURFACE
      ?auto_1812339 - SURFACE
      ?auto_1812341 - SURFACE
      ?auto_1812340 - SURFACE
    )
    :vars
    (
      ?auto_1812342 - HOIST
      ?auto_1812344 - PLACE
      ?auto_1812343 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1812342 ?auto_1812344 ) ( SURFACE-AT ?auto_1812341 ?auto_1812344 ) ( CLEAR ?auto_1812341 ) ( IS-CRATE ?auto_1812340 ) ( not ( = ?auto_1812341 ?auto_1812340 ) ) ( TRUCK-AT ?auto_1812343 ?auto_1812344 ) ( AVAILABLE ?auto_1812342 ) ( IN ?auto_1812340 ?auto_1812343 ) ( ON ?auto_1812341 ?auto_1812339 ) ( not ( = ?auto_1812339 ?auto_1812341 ) ) ( not ( = ?auto_1812339 ?auto_1812340 ) ) ( ON ?auto_1812337 ?auto_1812336 ) ( ON ?auto_1812338 ?auto_1812337 ) ( ON ?auto_1812335 ?auto_1812338 ) ( ON ?auto_1812339 ?auto_1812335 ) ( not ( = ?auto_1812336 ?auto_1812337 ) ) ( not ( = ?auto_1812336 ?auto_1812338 ) ) ( not ( = ?auto_1812336 ?auto_1812335 ) ) ( not ( = ?auto_1812336 ?auto_1812339 ) ) ( not ( = ?auto_1812336 ?auto_1812341 ) ) ( not ( = ?auto_1812336 ?auto_1812340 ) ) ( not ( = ?auto_1812337 ?auto_1812338 ) ) ( not ( = ?auto_1812337 ?auto_1812335 ) ) ( not ( = ?auto_1812337 ?auto_1812339 ) ) ( not ( = ?auto_1812337 ?auto_1812341 ) ) ( not ( = ?auto_1812337 ?auto_1812340 ) ) ( not ( = ?auto_1812338 ?auto_1812335 ) ) ( not ( = ?auto_1812338 ?auto_1812339 ) ) ( not ( = ?auto_1812338 ?auto_1812341 ) ) ( not ( = ?auto_1812338 ?auto_1812340 ) ) ( not ( = ?auto_1812335 ?auto_1812339 ) ) ( not ( = ?auto_1812335 ?auto_1812341 ) ) ( not ( = ?auto_1812335 ?auto_1812340 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1812339 ?auto_1812341 ?auto_1812340 )
      ( MAKE-6CRATE-VERIFY ?auto_1812336 ?auto_1812337 ?auto_1812338 ?auto_1812335 ?auto_1812339 ?auto_1812341 ?auto_1812340 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1812387 - SURFACE
      ?auto_1812388 - SURFACE
      ?auto_1812389 - SURFACE
      ?auto_1812386 - SURFACE
      ?auto_1812390 - SURFACE
      ?auto_1812392 - SURFACE
      ?auto_1812391 - SURFACE
    )
    :vars
    (
      ?auto_1812395 - HOIST
      ?auto_1812393 - PLACE
      ?auto_1812394 - TRUCK
      ?auto_1812396 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1812395 ?auto_1812393 ) ( SURFACE-AT ?auto_1812392 ?auto_1812393 ) ( CLEAR ?auto_1812392 ) ( IS-CRATE ?auto_1812391 ) ( not ( = ?auto_1812392 ?auto_1812391 ) ) ( AVAILABLE ?auto_1812395 ) ( IN ?auto_1812391 ?auto_1812394 ) ( ON ?auto_1812392 ?auto_1812390 ) ( not ( = ?auto_1812390 ?auto_1812392 ) ) ( not ( = ?auto_1812390 ?auto_1812391 ) ) ( TRUCK-AT ?auto_1812394 ?auto_1812396 ) ( not ( = ?auto_1812396 ?auto_1812393 ) ) ( ON ?auto_1812388 ?auto_1812387 ) ( ON ?auto_1812389 ?auto_1812388 ) ( ON ?auto_1812386 ?auto_1812389 ) ( ON ?auto_1812390 ?auto_1812386 ) ( not ( = ?auto_1812387 ?auto_1812388 ) ) ( not ( = ?auto_1812387 ?auto_1812389 ) ) ( not ( = ?auto_1812387 ?auto_1812386 ) ) ( not ( = ?auto_1812387 ?auto_1812390 ) ) ( not ( = ?auto_1812387 ?auto_1812392 ) ) ( not ( = ?auto_1812387 ?auto_1812391 ) ) ( not ( = ?auto_1812388 ?auto_1812389 ) ) ( not ( = ?auto_1812388 ?auto_1812386 ) ) ( not ( = ?auto_1812388 ?auto_1812390 ) ) ( not ( = ?auto_1812388 ?auto_1812392 ) ) ( not ( = ?auto_1812388 ?auto_1812391 ) ) ( not ( = ?auto_1812389 ?auto_1812386 ) ) ( not ( = ?auto_1812389 ?auto_1812390 ) ) ( not ( = ?auto_1812389 ?auto_1812392 ) ) ( not ( = ?auto_1812389 ?auto_1812391 ) ) ( not ( = ?auto_1812386 ?auto_1812390 ) ) ( not ( = ?auto_1812386 ?auto_1812392 ) ) ( not ( = ?auto_1812386 ?auto_1812391 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1812390 ?auto_1812392 ?auto_1812391 )
      ( MAKE-6CRATE-VERIFY ?auto_1812387 ?auto_1812388 ?auto_1812389 ?auto_1812386 ?auto_1812390 ?auto_1812392 ?auto_1812391 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1812444 - SURFACE
      ?auto_1812445 - SURFACE
      ?auto_1812446 - SURFACE
      ?auto_1812443 - SURFACE
      ?auto_1812447 - SURFACE
      ?auto_1812449 - SURFACE
      ?auto_1812448 - SURFACE
    )
    :vars
    (
      ?auto_1812450 - HOIST
      ?auto_1812454 - PLACE
      ?auto_1812452 - TRUCK
      ?auto_1812453 - PLACE
      ?auto_1812451 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1812450 ?auto_1812454 ) ( SURFACE-AT ?auto_1812449 ?auto_1812454 ) ( CLEAR ?auto_1812449 ) ( IS-CRATE ?auto_1812448 ) ( not ( = ?auto_1812449 ?auto_1812448 ) ) ( AVAILABLE ?auto_1812450 ) ( ON ?auto_1812449 ?auto_1812447 ) ( not ( = ?auto_1812447 ?auto_1812449 ) ) ( not ( = ?auto_1812447 ?auto_1812448 ) ) ( TRUCK-AT ?auto_1812452 ?auto_1812453 ) ( not ( = ?auto_1812453 ?auto_1812454 ) ) ( HOIST-AT ?auto_1812451 ?auto_1812453 ) ( LIFTING ?auto_1812451 ?auto_1812448 ) ( not ( = ?auto_1812450 ?auto_1812451 ) ) ( ON ?auto_1812445 ?auto_1812444 ) ( ON ?auto_1812446 ?auto_1812445 ) ( ON ?auto_1812443 ?auto_1812446 ) ( ON ?auto_1812447 ?auto_1812443 ) ( not ( = ?auto_1812444 ?auto_1812445 ) ) ( not ( = ?auto_1812444 ?auto_1812446 ) ) ( not ( = ?auto_1812444 ?auto_1812443 ) ) ( not ( = ?auto_1812444 ?auto_1812447 ) ) ( not ( = ?auto_1812444 ?auto_1812449 ) ) ( not ( = ?auto_1812444 ?auto_1812448 ) ) ( not ( = ?auto_1812445 ?auto_1812446 ) ) ( not ( = ?auto_1812445 ?auto_1812443 ) ) ( not ( = ?auto_1812445 ?auto_1812447 ) ) ( not ( = ?auto_1812445 ?auto_1812449 ) ) ( not ( = ?auto_1812445 ?auto_1812448 ) ) ( not ( = ?auto_1812446 ?auto_1812443 ) ) ( not ( = ?auto_1812446 ?auto_1812447 ) ) ( not ( = ?auto_1812446 ?auto_1812449 ) ) ( not ( = ?auto_1812446 ?auto_1812448 ) ) ( not ( = ?auto_1812443 ?auto_1812447 ) ) ( not ( = ?auto_1812443 ?auto_1812449 ) ) ( not ( = ?auto_1812443 ?auto_1812448 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1812447 ?auto_1812449 ?auto_1812448 )
      ( MAKE-6CRATE-VERIFY ?auto_1812444 ?auto_1812445 ?auto_1812446 ?auto_1812443 ?auto_1812447 ?auto_1812449 ?auto_1812448 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1812507 - SURFACE
      ?auto_1812508 - SURFACE
      ?auto_1812509 - SURFACE
      ?auto_1812506 - SURFACE
      ?auto_1812510 - SURFACE
      ?auto_1812512 - SURFACE
      ?auto_1812511 - SURFACE
    )
    :vars
    (
      ?auto_1812513 - HOIST
      ?auto_1812515 - PLACE
      ?auto_1812518 - TRUCK
      ?auto_1812514 - PLACE
      ?auto_1812516 - HOIST
      ?auto_1812517 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1812513 ?auto_1812515 ) ( SURFACE-AT ?auto_1812512 ?auto_1812515 ) ( CLEAR ?auto_1812512 ) ( IS-CRATE ?auto_1812511 ) ( not ( = ?auto_1812512 ?auto_1812511 ) ) ( AVAILABLE ?auto_1812513 ) ( ON ?auto_1812512 ?auto_1812510 ) ( not ( = ?auto_1812510 ?auto_1812512 ) ) ( not ( = ?auto_1812510 ?auto_1812511 ) ) ( TRUCK-AT ?auto_1812518 ?auto_1812514 ) ( not ( = ?auto_1812514 ?auto_1812515 ) ) ( HOIST-AT ?auto_1812516 ?auto_1812514 ) ( not ( = ?auto_1812513 ?auto_1812516 ) ) ( AVAILABLE ?auto_1812516 ) ( SURFACE-AT ?auto_1812511 ?auto_1812514 ) ( ON ?auto_1812511 ?auto_1812517 ) ( CLEAR ?auto_1812511 ) ( not ( = ?auto_1812512 ?auto_1812517 ) ) ( not ( = ?auto_1812511 ?auto_1812517 ) ) ( not ( = ?auto_1812510 ?auto_1812517 ) ) ( ON ?auto_1812508 ?auto_1812507 ) ( ON ?auto_1812509 ?auto_1812508 ) ( ON ?auto_1812506 ?auto_1812509 ) ( ON ?auto_1812510 ?auto_1812506 ) ( not ( = ?auto_1812507 ?auto_1812508 ) ) ( not ( = ?auto_1812507 ?auto_1812509 ) ) ( not ( = ?auto_1812507 ?auto_1812506 ) ) ( not ( = ?auto_1812507 ?auto_1812510 ) ) ( not ( = ?auto_1812507 ?auto_1812512 ) ) ( not ( = ?auto_1812507 ?auto_1812511 ) ) ( not ( = ?auto_1812507 ?auto_1812517 ) ) ( not ( = ?auto_1812508 ?auto_1812509 ) ) ( not ( = ?auto_1812508 ?auto_1812506 ) ) ( not ( = ?auto_1812508 ?auto_1812510 ) ) ( not ( = ?auto_1812508 ?auto_1812512 ) ) ( not ( = ?auto_1812508 ?auto_1812511 ) ) ( not ( = ?auto_1812508 ?auto_1812517 ) ) ( not ( = ?auto_1812509 ?auto_1812506 ) ) ( not ( = ?auto_1812509 ?auto_1812510 ) ) ( not ( = ?auto_1812509 ?auto_1812512 ) ) ( not ( = ?auto_1812509 ?auto_1812511 ) ) ( not ( = ?auto_1812509 ?auto_1812517 ) ) ( not ( = ?auto_1812506 ?auto_1812510 ) ) ( not ( = ?auto_1812506 ?auto_1812512 ) ) ( not ( = ?auto_1812506 ?auto_1812511 ) ) ( not ( = ?auto_1812506 ?auto_1812517 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1812510 ?auto_1812512 ?auto_1812511 )
      ( MAKE-6CRATE-VERIFY ?auto_1812507 ?auto_1812508 ?auto_1812509 ?auto_1812506 ?auto_1812510 ?auto_1812512 ?auto_1812511 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1812571 - SURFACE
      ?auto_1812572 - SURFACE
      ?auto_1812573 - SURFACE
      ?auto_1812570 - SURFACE
      ?auto_1812574 - SURFACE
      ?auto_1812576 - SURFACE
      ?auto_1812575 - SURFACE
    )
    :vars
    (
      ?auto_1812578 - HOIST
      ?auto_1812581 - PLACE
      ?auto_1812579 - PLACE
      ?auto_1812582 - HOIST
      ?auto_1812577 - SURFACE
      ?auto_1812580 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1812578 ?auto_1812581 ) ( SURFACE-AT ?auto_1812576 ?auto_1812581 ) ( CLEAR ?auto_1812576 ) ( IS-CRATE ?auto_1812575 ) ( not ( = ?auto_1812576 ?auto_1812575 ) ) ( AVAILABLE ?auto_1812578 ) ( ON ?auto_1812576 ?auto_1812574 ) ( not ( = ?auto_1812574 ?auto_1812576 ) ) ( not ( = ?auto_1812574 ?auto_1812575 ) ) ( not ( = ?auto_1812579 ?auto_1812581 ) ) ( HOIST-AT ?auto_1812582 ?auto_1812579 ) ( not ( = ?auto_1812578 ?auto_1812582 ) ) ( AVAILABLE ?auto_1812582 ) ( SURFACE-AT ?auto_1812575 ?auto_1812579 ) ( ON ?auto_1812575 ?auto_1812577 ) ( CLEAR ?auto_1812575 ) ( not ( = ?auto_1812576 ?auto_1812577 ) ) ( not ( = ?auto_1812575 ?auto_1812577 ) ) ( not ( = ?auto_1812574 ?auto_1812577 ) ) ( TRUCK-AT ?auto_1812580 ?auto_1812581 ) ( ON ?auto_1812572 ?auto_1812571 ) ( ON ?auto_1812573 ?auto_1812572 ) ( ON ?auto_1812570 ?auto_1812573 ) ( ON ?auto_1812574 ?auto_1812570 ) ( not ( = ?auto_1812571 ?auto_1812572 ) ) ( not ( = ?auto_1812571 ?auto_1812573 ) ) ( not ( = ?auto_1812571 ?auto_1812570 ) ) ( not ( = ?auto_1812571 ?auto_1812574 ) ) ( not ( = ?auto_1812571 ?auto_1812576 ) ) ( not ( = ?auto_1812571 ?auto_1812575 ) ) ( not ( = ?auto_1812571 ?auto_1812577 ) ) ( not ( = ?auto_1812572 ?auto_1812573 ) ) ( not ( = ?auto_1812572 ?auto_1812570 ) ) ( not ( = ?auto_1812572 ?auto_1812574 ) ) ( not ( = ?auto_1812572 ?auto_1812576 ) ) ( not ( = ?auto_1812572 ?auto_1812575 ) ) ( not ( = ?auto_1812572 ?auto_1812577 ) ) ( not ( = ?auto_1812573 ?auto_1812570 ) ) ( not ( = ?auto_1812573 ?auto_1812574 ) ) ( not ( = ?auto_1812573 ?auto_1812576 ) ) ( not ( = ?auto_1812573 ?auto_1812575 ) ) ( not ( = ?auto_1812573 ?auto_1812577 ) ) ( not ( = ?auto_1812570 ?auto_1812574 ) ) ( not ( = ?auto_1812570 ?auto_1812576 ) ) ( not ( = ?auto_1812570 ?auto_1812575 ) ) ( not ( = ?auto_1812570 ?auto_1812577 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1812574 ?auto_1812576 ?auto_1812575 )
      ( MAKE-6CRATE-VERIFY ?auto_1812571 ?auto_1812572 ?auto_1812573 ?auto_1812570 ?auto_1812574 ?auto_1812576 ?auto_1812575 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1812635 - SURFACE
      ?auto_1812636 - SURFACE
      ?auto_1812637 - SURFACE
      ?auto_1812634 - SURFACE
      ?auto_1812638 - SURFACE
      ?auto_1812640 - SURFACE
      ?auto_1812639 - SURFACE
    )
    :vars
    (
      ?auto_1812643 - HOIST
      ?auto_1812644 - PLACE
      ?auto_1812641 - PLACE
      ?auto_1812646 - HOIST
      ?auto_1812645 - SURFACE
      ?auto_1812642 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1812643 ?auto_1812644 ) ( IS-CRATE ?auto_1812639 ) ( not ( = ?auto_1812640 ?auto_1812639 ) ) ( not ( = ?auto_1812638 ?auto_1812640 ) ) ( not ( = ?auto_1812638 ?auto_1812639 ) ) ( not ( = ?auto_1812641 ?auto_1812644 ) ) ( HOIST-AT ?auto_1812646 ?auto_1812641 ) ( not ( = ?auto_1812643 ?auto_1812646 ) ) ( AVAILABLE ?auto_1812646 ) ( SURFACE-AT ?auto_1812639 ?auto_1812641 ) ( ON ?auto_1812639 ?auto_1812645 ) ( CLEAR ?auto_1812639 ) ( not ( = ?auto_1812640 ?auto_1812645 ) ) ( not ( = ?auto_1812639 ?auto_1812645 ) ) ( not ( = ?auto_1812638 ?auto_1812645 ) ) ( TRUCK-AT ?auto_1812642 ?auto_1812644 ) ( SURFACE-AT ?auto_1812638 ?auto_1812644 ) ( CLEAR ?auto_1812638 ) ( LIFTING ?auto_1812643 ?auto_1812640 ) ( IS-CRATE ?auto_1812640 ) ( ON ?auto_1812636 ?auto_1812635 ) ( ON ?auto_1812637 ?auto_1812636 ) ( ON ?auto_1812634 ?auto_1812637 ) ( ON ?auto_1812638 ?auto_1812634 ) ( not ( = ?auto_1812635 ?auto_1812636 ) ) ( not ( = ?auto_1812635 ?auto_1812637 ) ) ( not ( = ?auto_1812635 ?auto_1812634 ) ) ( not ( = ?auto_1812635 ?auto_1812638 ) ) ( not ( = ?auto_1812635 ?auto_1812640 ) ) ( not ( = ?auto_1812635 ?auto_1812639 ) ) ( not ( = ?auto_1812635 ?auto_1812645 ) ) ( not ( = ?auto_1812636 ?auto_1812637 ) ) ( not ( = ?auto_1812636 ?auto_1812634 ) ) ( not ( = ?auto_1812636 ?auto_1812638 ) ) ( not ( = ?auto_1812636 ?auto_1812640 ) ) ( not ( = ?auto_1812636 ?auto_1812639 ) ) ( not ( = ?auto_1812636 ?auto_1812645 ) ) ( not ( = ?auto_1812637 ?auto_1812634 ) ) ( not ( = ?auto_1812637 ?auto_1812638 ) ) ( not ( = ?auto_1812637 ?auto_1812640 ) ) ( not ( = ?auto_1812637 ?auto_1812639 ) ) ( not ( = ?auto_1812637 ?auto_1812645 ) ) ( not ( = ?auto_1812634 ?auto_1812638 ) ) ( not ( = ?auto_1812634 ?auto_1812640 ) ) ( not ( = ?auto_1812634 ?auto_1812639 ) ) ( not ( = ?auto_1812634 ?auto_1812645 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1812638 ?auto_1812640 ?auto_1812639 )
      ( MAKE-6CRATE-VERIFY ?auto_1812635 ?auto_1812636 ?auto_1812637 ?auto_1812634 ?auto_1812638 ?auto_1812640 ?auto_1812639 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1812699 - SURFACE
      ?auto_1812700 - SURFACE
      ?auto_1812701 - SURFACE
      ?auto_1812698 - SURFACE
      ?auto_1812702 - SURFACE
      ?auto_1812704 - SURFACE
      ?auto_1812703 - SURFACE
    )
    :vars
    (
      ?auto_1812710 - HOIST
      ?auto_1812707 - PLACE
      ?auto_1812705 - PLACE
      ?auto_1812709 - HOIST
      ?auto_1812708 - SURFACE
      ?auto_1812706 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1812710 ?auto_1812707 ) ( IS-CRATE ?auto_1812703 ) ( not ( = ?auto_1812704 ?auto_1812703 ) ) ( not ( = ?auto_1812702 ?auto_1812704 ) ) ( not ( = ?auto_1812702 ?auto_1812703 ) ) ( not ( = ?auto_1812705 ?auto_1812707 ) ) ( HOIST-AT ?auto_1812709 ?auto_1812705 ) ( not ( = ?auto_1812710 ?auto_1812709 ) ) ( AVAILABLE ?auto_1812709 ) ( SURFACE-AT ?auto_1812703 ?auto_1812705 ) ( ON ?auto_1812703 ?auto_1812708 ) ( CLEAR ?auto_1812703 ) ( not ( = ?auto_1812704 ?auto_1812708 ) ) ( not ( = ?auto_1812703 ?auto_1812708 ) ) ( not ( = ?auto_1812702 ?auto_1812708 ) ) ( TRUCK-AT ?auto_1812706 ?auto_1812707 ) ( SURFACE-AT ?auto_1812702 ?auto_1812707 ) ( CLEAR ?auto_1812702 ) ( IS-CRATE ?auto_1812704 ) ( AVAILABLE ?auto_1812710 ) ( IN ?auto_1812704 ?auto_1812706 ) ( ON ?auto_1812700 ?auto_1812699 ) ( ON ?auto_1812701 ?auto_1812700 ) ( ON ?auto_1812698 ?auto_1812701 ) ( ON ?auto_1812702 ?auto_1812698 ) ( not ( = ?auto_1812699 ?auto_1812700 ) ) ( not ( = ?auto_1812699 ?auto_1812701 ) ) ( not ( = ?auto_1812699 ?auto_1812698 ) ) ( not ( = ?auto_1812699 ?auto_1812702 ) ) ( not ( = ?auto_1812699 ?auto_1812704 ) ) ( not ( = ?auto_1812699 ?auto_1812703 ) ) ( not ( = ?auto_1812699 ?auto_1812708 ) ) ( not ( = ?auto_1812700 ?auto_1812701 ) ) ( not ( = ?auto_1812700 ?auto_1812698 ) ) ( not ( = ?auto_1812700 ?auto_1812702 ) ) ( not ( = ?auto_1812700 ?auto_1812704 ) ) ( not ( = ?auto_1812700 ?auto_1812703 ) ) ( not ( = ?auto_1812700 ?auto_1812708 ) ) ( not ( = ?auto_1812701 ?auto_1812698 ) ) ( not ( = ?auto_1812701 ?auto_1812702 ) ) ( not ( = ?auto_1812701 ?auto_1812704 ) ) ( not ( = ?auto_1812701 ?auto_1812703 ) ) ( not ( = ?auto_1812701 ?auto_1812708 ) ) ( not ( = ?auto_1812698 ?auto_1812702 ) ) ( not ( = ?auto_1812698 ?auto_1812704 ) ) ( not ( = ?auto_1812698 ?auto_1812703 ) ) ( not ( = ?auto_1812698 ?auto_1812708 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1812702 ?auto_1812704 ?auto_1812703 )
      ( MAKE-6CRATE-VERIFY ?auto_1812699 ?auto_1812700 ?auto_1812701 ?auto_1812698 ?auto_1812702 ?auto_1812704 ?auto_1812703 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1813168 - SURFACE
      ?auto_1813169 - SURFACE
    )
    :vars
    (
      ?auto_1813174 - HOIST
      ?auto_1813175 - PLACE
      ?auto_1813170 - SURFACE
      ?auto_1813171 - TRUCK
      ?auto_1813173 - PLACE
      ?auto_1813176 - HOIST
      ?auto_1813172 - SURFACE
      ?auto_1813177 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1813174 ?auto_1813175 ) ( SURFACE-AT ?auto_1813168 ?auto_1813175 ) ( CLEAR ?auto_1813168 ) ( IS-CRATE ?auto_1813169 ) ( not ( = ?auto_1813168 ?auto_1813169 ) ) ( AVAILABLE ?auto_1813174 ) ( ON ?auto_1813168 ?auto_1813170 ) ( not ( = ?auto_1813170 ?auto_1813168 ) ) ( not ( = ?auto_1813170 ?auto_1813169 ) ) ( TRUCK-AT ?auto_1813171 ?auto_1813173 ) ( not ( = ?auto_1813173 ?auto_1813175 ) ) ( HOIST-AT ?auto_1813176 ?auto_1813173 ) ( not ( = ?auto_1813174 ?auto_1813176 ) ) ( SURFACE-AT ?auto_1813169 ?auto_1813173 ) ( ON ?auto_1813169 ?auto_1813172 ) ( CLEAR ?auto_1813169 ) ( not ( = ?auto_1813168 ?auto_1813172 ) ) ( not ( = ?auto_1813169 ?auto_1813172 ) ) ( not ( = ?auto_1813170 ?auto_1813172 ) ) ( LIFTING ?auto_1813176 ?auto_1813177 ) ( IS-CRATE ?auto_1813177 ) ( not ( = ?auto_1813168 ?auto_1813177 ) ) ( not ( = ?auto_1813169 ?auto_1813177 ) ) ( not ( = ?auto_1813170 ?auto_1813177 ) ) ( not ( = ?auto_1813172 ?auto_1813177 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1813176 ?auto_1813177 ?auto_1813171 ?auto_1813173 )
      ( MAKE-1CRATE ?auto_1813168 ?auto_1813169 )
      ( MAKE-1CRATE-VERIFY ?auto_1813168 ?auto_1813169 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1814648 - SURFACE
      ?auto_1814649 - SURFACE
      ?auto_1814650 - SURFACE
      ?auto_1814647 - SURFACE
      ?auto_1814651 - SURFACE
      ?auto_1814653 - SURFACE
      ?auto_1814652 - SURFACE
      ?auto_1814654 - SURFACE
    )
    :vars
    (
      ?auto_1814655 - HOIST
      ?auto_1814656 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1814655 ?auto_1814656 ) ( SURFACE-AT ?auto_1814652 ?auto_1814656 ) ( CLEAR ?auto_1814652 ) ( LIFTING ?auto_1814655 ?auto_1814654 ) ( IS-CRATE ?auto_1814654 ) ( not ( = ?auto_1814652 ?auto_1814654 ) ) ( ON ?auto_1814649 ?auto_1814648 ) ( ON ?auto_1814650 ?auto_1814649 ) ( ON ?auto_1814647 ?auto_1814650 ) ( ON ?auto_1814651 ?auto_1814647 ) ( ON ?auto_1814653 ?auto_1814651 ) ( ON ?auto_1814652 ?auto_1814653 ) ( not ( = ?auto_1814648 ?auto_1814649 ) ) ( not ( = ?auto_1814648 ?auto_1814650 ) ) ( not ( = ?auto_1814648 ?auto_1814647 ) ) ( not ( = ?auto_1814648 ?auto_1814651 ) ) ( not ( = ?auto_1814648 ?auto_1814653 ) ) ( not ( = ?auto_1814648 ?auto_1814652 ) ) ( not ( = ?auto_1814648 ?auto_1814654 ) ) ( not ( = ?auto_1814649 ?auto_1814650 ) ) ( not ( = ?auto_1814649 ?auto_1814647 ) ) ( not ( = ?auto_1814649 ?auto_1814651 ) ) ( not ( = ?auto_1814649 ?auto_1814653 ) ) ( not ( = ?auto_1814649 ?auto_1814652 ) ) ( not ( = ?auto_1814649 ?auto_1814654 ) ) ( not ( = ?auto_1814650 ?auto_1814647 ) ) ( not ( = ?auto_1814650 ?auto_1814651 ) ) ( not ( = ?auto_1814650 ?auto_1814653 ) ) ( not ( = ?auto_1814650 ?auto_1814652 ) ) ( not ( = ?auto_1814650 ?auto_1814654 ) ) ( not ( = ?auto_1814647 ?auto_1814651 ) ) ( not ( = ?auto_1814647 ?auto_1814653 ) ) ( not ( = ?auto_1814647 ?auto_1814652 ) ) ( not ( = ?auto_1814647 ?auto_1814654 ) ) ( not ( = ?auto_1814651 ?auto_1814653 ) ) ( not ( = ?auto_1814651 ?auto_1814652 ) ) ( not ( = ?auto_1814651 ?auto_1814654 ) ) ( not ( = ?auto_1814653 ?auto_1814652 ) ) ( not ( = ?auto_1814653 ?auto_1814654 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1814652 ?auto_1814654 )
      ( MAKE-7CRATE-VERIFY ?auto_1814648 ?auto_1814649 ?auto_1814650 ?auto_1814647 ?auto_1814651 ?auto_1814653 ?auto_1814652 ?auto_1814654 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1814703 - SURFACE
      ?auto_1814704 - SURFACE
      ?auto_1814705 - SURFACE
      ?auto_1814702 - SURFACE
      ?auto_1814706 - SURFACE
      ?auto_1814708 - SURFACE
      ?auto_1814707 - SURFACE
      ?auto_1814709 - SURFACE
    )
    :vars
    (
      ?auto_1814711 - HOIST
      ?auto_1814710 - PLACE
      ?auto_1814712 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1814711 ?auto_1814710 ) ( SURFACE-AT ?auto_1814707 ?auto_1814710 ) ( CLEAR ?auto_1814707 ) ( IS-CRATE ?auto_1814709 ) ( not ( = ?auto_1814707 ?auto_1814709 ) ) ( TRUCK-AT ?auto_1814712 ?auto_1814710 ) ( AVAILABLE ?auto_1814711 ) ( IN ?auto_1814709 ?auto_1814712 ) ( ON ?auto_1814707 ?auto_1814708 ) ( not ( = ?auto_1814708 ?auto_1814707 ) ) ( not ( = ?auto_1814708 ?auto_1814709 ) ) ( ON ?auto_1814704 ?auto_1814703 ) ( ON ?auto_1814705 ?auto_1814704 ) ( ON ?auto_1814702 ?auto_1814705 ) ( ON ?auto_1814706 ?auto_1814702 ) ( ON ?auto_1814708 ?auto_1814706 ) ( not ( = ?auto_1814703 ?auto_1814704 ) ) ( not ( = ?auto_1814703 ?auto_1814705 ) ) ( not ( = ?auto_1814703 ?auto_1814702 ) ) ( not ( = ?auto_1814703 ?auto_1814706 ) ) ( not ( = ?auto_1814703 ?auto_1814708 ) ) ( not ( = ?auto_1814703 ?auto_1814707 ) ) ( not ( = ?auto_1814703 ?auto_1814709 ) ) ( not ( = ?auto_1814704 ?auto_1814705 ) ) ( not ( = ?auto_1814704 ?auto_1814702 ) ) ( not ( = ?auto_1814704 ?auto_1814706 ) ) ( not ( = ?auto_1814704 ?auto_1814708 ) ) ( not ( = ?auto_1814704 ?auto_1814707 ) ) ( not ( = ?auto_1814704 ?auto_1814709 ) ) ( not ( = ?auto_1814705 ?auto_1814702 ) ) ( not ( = ?auto_1814705 ?auto_1814706 ) ) ( not ( = ?auto_1814705 ?auto_1814708 ) ) ( not ( = ?auto_1814705 ?auto_1814707 ) ) ( not ( = ?auto_1814705 ?auto_1814709 ) ) ( not ( = ?auto_1814702 ?auto_1814706 ) ) ( not ( = ?auto_1814702 ?auto_1814708 ) ) ( not ( = ?auto_1814702 ?auto_1814707 ) ) ( not ( = ?auto_1814702 ?auto_1814709 ) ) ( not ( = ?auto_1814706 ?auto_1814708 ) ) ( not ( = ?auto_1814706 ?auto_1814707 ) ) ( not ( = ?auto_1814706 ?auto_1814709 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1814708 ?auto_1814707 ?auto_1814709 )
      ( MAKE-7CRATE-VERIFY ?auto_1814703 ?auto_1814704 ?auto_1814705 ?auto_1814702 ?auto_1814706 ?auto_1814708 ?auto_1814707 ?auto_1814709 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1814766 - SURFACE
      ?auto_1814767 - SURFACE
      ?auto_1814768 - SURFACE
      ?auto_1814765 - SURFACE
      ?auto_1814769 - SURFACE
      ?auto_1814771 - SURFACE
      ?auto_1814770 - SURFACE
      ?auto_1814772 - SURFACE
    )
    :vars
    (
      ?auto_1814774 - HOIST
      ?auto_1814776 - PLACE
      ?auto_1814773 - TRUCK
      ?auto_1814775 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1814774 ?auto_1814776 ) ( SURFACE-AT ?auto_1814770 ?auto_1814776 ) ( CLEAR ?auto_1814770 ) ( IS-CRATE ?auto_1814772 ) ( not ( = ?auto_1814770 ?auto_1814772 ) ) ( AVAILABLE ?auto_1814774 ) ( IN ?auto_1814772 ?auto_1814773 ) ( ON ?auto_1814770 ?auto_1814771 ) ( not ( = ?auto_1814771 ?auto_1814770 ) ) ( not ( = ?auto_1814771 ?auto_1814772 ) ) ( TRUCK-AT ?auto_1814773 ?auto_1814775 ) ( not ( = ?auto_1814775 ?auto_1814776 ) ) ( ON ?auto_1814767 ?auto_1814766 ) ( ON ?auto_1814768 ?auto_1814767 ) ( ON ?auto_1814765 ?auto_1814768 ) ( ON ?auto_1814769 ?auto_1814765 ) ( ON ?auto_1814771 ?auto_1814769 ) ( not ( = ?auto_1814766 ?auto_1814767 ) ) ( not ( = ?auto_1814766 ?auto_1814768 ) ) ( not ( = ?auto_1814766 ?auto_1814765 ) ) ( not ( = ?auto_1814766 ?auto_1814769 ) ) ( not ( = ?auto_1814766 ?auto_1814771 ) ) ( not ( = ?auto_1814766 ?auto_1814770 ) ) ( not ( = ?auto_1814766 ?auto_1814772 ) ) ( not ( = ?auto_1814767 ?auto_1814768 ) ) ( not ( = ?auto_1814767 ?auto_1814765 ) ) ( not ( = ?auto_1814767 ?auto_1814769 ) ) ( not ( = ?auto_1814767 ?auto_1814771 ) ) ( not ( = ?auto_1814767 ?auto_1814770 ) ) ( not ( = ?auto_1814767 ?auto_1814772 ) ) ( not ( = ?auto_1814768 ?auto_1814765 ) ) ( not ( = ?auto_1814768 ?auto_1814769 ) ) ( not ( = ?auto_1814768 ?auto_1814771 ) ) ( not ( = ?auto_1814768 ?auto_1814770 ) ) ( not ( = ?auto_1814768 ?auto_1814772 ) ) ( not ( = ?auto_1814765 ?auto_1814769 ) ) ( not ( = ?auto_1814765 ?auto_1814771 ) ) ( not ( = ?auto_1814765 ?auto_1814770 ) ) ( not ( = ?auto_1814765 ?auto_1814772 ) ) ( not ( = ?auto_1814769 ?auto_1814771 ) ) ( not ( = ?auto_1814769 ?auto_1814770 ) ) ( not ( = ?auto_1814769 ?auto_1814772 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1814771 ?auto_1814770 ?auto_1814772 )
      ( MAKE-7CRATE-VERIFY ?auto_1814766 ?auto_1814767 ?auto_1814768 ?auto_1814765 ?auto_1814769 ?auto_1814771 ?auto_1814770 ?auto_1814772 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1814836 - SURFACE
      ?auto_1814837 - SURFACE
      ?auto_1814838 - SURFACE
      ?auto_1814835 - SURFACE
      ?auto_1814839 - SURFACE
      ?auto_1814841 - SURFACE
      ?auto_1814840 - SURFACE
      ?auto_1814842 - SURFACE
    )
    :vars
    (
      ?auto_1814847 - HOIST
      ?auto_1814844 - PLACE
      ?auto_1814843 - TRUCK
      ?auto_1814845 - PLACE
      ?auto_1814846 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1814847 ?auto_1814844 ) ( SURFACE-AT ?auto_1814840 ?auto_1814844 ) ( CLEAR ?auto_1814840 ) ( IS-CRATE ?auto_1814842 ) ( not ( = ?auto_1814840 ?auto_1814842 ) ) ( AVAILABLE ?auto_1814847 ) ( ON ?auto_1814840 ?auto_1814841 ) ( not ( = ?auto_1814841 ?auto_1814840 ) ) ( not ( = ?auto_1814841 ?auto_1814842 ) ) ( TRUCK-AT ?auto_1814843 ?auto_1814845 ) ( not ( = ?auto_1814845 ?auto_1814844 ) ) ( HOIST-AT ?auto_1814846 ?auto_1814845 ) ( LIFTING ?auto_1814846 ?auto_1814842 ) ( not ( = ?auto_1814847 ?auto_1814846 ) ) ( ON ?auto_1814837 ?auto_1814836 ) ( ON ?auto_1814838 ?auto_1814837 ) ( ON ?auto_1814835 ?auto_1814838 ) ( ON ?auto_1814839 ?auto_1814835 ) ( ON ?auto_1814841 ?auto_1814839 ) ( not ( = ?auto_1814836 ?auto_1814837 ) ) ( not ( = ?auto_1814836 ?auto_1814838 ) ) ( not ( = ?auto_1814836 ?auto_1814835 ) ) ( not ( = ?auto_1814836 ?auto_1814839 ) ) ( not ( = ?auto_1814836 ?auto_1814841 ) ) ( not ( = ?auto_1814836 ?auto_1814840 ) ) ( not ( = ?auto_1814836 ?auto_1814842 ) ) ( not ( = ?auto_1814837 ?auto_1814838 ) ) ( not ( = ?auto_1814837 ?auto_1814835 ) ) ( not ( = ?auto_1814837 ?auto_1814839 ) ) ( not ( = ?auto_1814837 ?auto_1814841 ) ) ( not ( = ?auto_1814837 ?auto_1814840 ) ) ( not ( = ?auto_1814837 ?auto_1814842 ) ) ( not ( = ?auto_1814838 ?auto_1814835 ) ) ( not ( = ?auto_1814838 ?auto_1814839 ) ) ( not ( = ?auto_1814838 ?auto_1814841 ) ) ( not ( = ?auto_1814838 ?auto_1814840 ) ) ( not ( = ?auto_1814838 ?auto_1814842 ) ) ( not ( = ?auto_1814835 ?auto_1814839 ) ) ( not ( = ?auto_1814835 ?auto_1814841 ) ) ( not ( = ?auto_1814835 ?auto_1814840 ) ) ( not ( = ?auto_1814835 ?auto_1814842 ) ) ( not ( = ?auto_1814839 ?auto_1814841 ) ) ( not ( = ?auto_1814839 ?auto_1814840 ) ) ( not ( = ?auto_1814839 ?auto_1814842 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1814841 ?auto_1814840 ?auto_1814842 )
      ( MAKE-7CRATE-VERIFY ?auto_1814836 ?auto_1814837 ?auto_1814838 ?auto_1814835 ?auto_1814839 ?auto_1814841 ?auto_1814840 ?auto_1814842 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1814913 - SURFACE
      ?auto_1814914 - SURFACE
      ?auto_1814915 - SURFACE
      ?auto_1814912 - SURFACE
      ?auto_1814916 - SURFACE
      ?auto_1814918 - SURFACE
      ?auto_1814917 - SURFACE
      ?auto_1814919 - SURFACE
    )
    :vars
    (
      ?auto_1814924 - HOIST
      ?auto_1814921 - PLACE
      ?auto_1814920 - TRUCK
      ?auto_1814923 - PLACE
      ?auto_1814922 - HOIST
      ?auto_1814925 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1814924 ?auto_1814921 ) ( SURFACE-AT ?auto_1814917 ?auto_1814921 ) ( CLEAR ?auto_1814917 ) ( IS-CRATE ?auto_1814919 ) ( not ( = ?auto_1814917 ?auto_1814919 ) ) ( AVAILABLE ?auto_1814924 ) ( ON ?auto_1814917 ?auto_1814918 ) ( not ( = ?auto_1814918 ?auto_1814917 ) ) ( not ( = ?auto_1814918 ?auto_1814919 ) ) ( TRUCK-AT ?auto_1814920 ?auto_1814923 ) ( not ( = ?auto_1814923 ?auto_1814921 ) ) ( HOIST-AT ?auto_1814922 ?auto_1814923 ) ( not ( = ?auto_1814924 ?auto_1814922 ) ) ( AVAILABLE ?auto_1814922 ) ( SURFACE-AT ?auto_1814919 ?auto_1814923 ) ( ON ?auto_1814919 ?auto_1814925 ) ( CLEAR ?auto_1814919 ) ( not ( = ?auto_1814917 ?auto_1814925 ) ) ( not ( = ?auto_1814919 ?auto_1814925 ) ) ( not ( = ?auto_1814918 ?auto_1814925 ) ) ( ON ?auto_1814914 ?auto_1814913 ) ( ON ?auto_1814915 ?auto_1814914 ) ( ON ?auto_1814912 ?auto_1814915 ) ( ON ?auto_1814916 ?auto_1814912 ) ( ON ?auto_1814918 ?auto_1814916 ) ( not ( = ?auto_1814913 ?auto_1814914 ) ) ( not ( = ?auto_1814913 ?auto_1814915 ) ) ( not ( = ?auto_1814913 ?auto_1814912 ) ) ( not ( = ?auto_1814913 ?auto_1814916 ) ) ( not ( = ?auto_1814913 ?auto_1814918 ) ) ( not ( = ?auto_1814913 ?auto_1814917 ) ) ( not ( = ?auto_1814913 ?auto_1814919 ) ) ( not ( = ?auto_1814913 ?auto_1814925 ) ) ( not ( = ?auto_1814914 ?auto_1814915 ) ) ( not ( = ?auto_1814914 ?auto_1814912 ) ) ( not ( = ?auto_1814914 ?auto_1814916 ) ) ( not ( = ?auto_1814914 ?auto_1814918 ) ) ( not ( = ?auto_1814914 ?auto_1814917 ) ) ( not ( = ?auto_1814914 ?auto_1814919 ) ) ( not ( = ?auto_1814914 ?auto_1814925 ) ) ( not ( = ?auto_1814915 ?auto_1814912 ) ) ( not ( = ?auto_1814915 ?auto_1814916 ) ) ( not ( = ?auto_1814915 ?auto_1814918 ) ) ( not ( = ?auto_1814915 ?auto_1814917 ) ) ( not ( = ?auto_1814915 ?auto_1814919 ) ) ( not ( = ?auto_1814915 ?auto_1814925 ) ) ( not ( = ?auto_1814912 ?auto_1814916 ) ) ( not ( = ?auto_1814912 ?auto_1814918 ) ) ( not ( = ?auto_1814912 ?auto_1814917 ) ) ( not ( = ?auto_1814912 ?auto_1814919 ) ) ( not ( = ?auto_1814912 ?auto_1814925 ) ) ( not ( = ?auto_1814916 ?auto_1814918 ) ) ( not ( = ?auto_1814916 ?auto_1814917 ) ) ( not ( = ?auto_1814916 ?auto_1814919 ) ) ( not ( = ?auto_1814916 ?auto_1814925 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1814918 ?auto_1814917 ?auto_1814919 )
      ( MAKE-7CRATE-VERIFY ?auto_1814913 ?auto_1814914 ?auto_1814915 ?auto_1814912 ?auto_1814916 ?auto_1814918 ?auto_1814917 ?auto_1814919 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1814991 - SURFACE
      ?auto_1814992 - SURFACE
      ?auto_1814993 - SURFACE
      ?auto_1814990 - SURFACE
      ?auto_1814994 - SURFACE
      ?auto_1814996 - SURFACE
      ?auto_1814995 - SURFACE
      ?auto_1814997 - SURFACE
    )
    :vars
    (
      ?auto_1815001 - HOIST
      ?auto_1815000 - PLACE
      ?auto_1815003 - PLACE
      ?auto_1815002 - HOIST
      ?auto_1814999 - SURFACE
      ?auto_1814998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1815001 ?auto_1815000 ) ( SURFACE-AT ?auto_1814995 ?auto_1815000 ) ( CLEAR ?auto_1814995 ) ( IS-CRATE ?auto_1814997 ) ( not ( = ?auto_1814995 ?auto_1814997 ) ) ( AVAILABLE ?auto_1815001 ) ( ON ?auto_1814995 ?auto_1814996 ) ( not ( = ?auto_1814996 ?auto_1814995 ) ) ( not ( = ?auto_1814996 ?auto_1814997 ) ) ( not ( = ?auto_1815003 ?auto_1815000 ) ) ( HOIST-AT ?auto_1815002 ?auto_1815003 ) ( not ( = ?auto_1815001 ?auto_1815002 ) ) ( AVAILABLE ?auto_1815002 ) ( SURFACE-AT ?auto_1814997 ?auto_1815003 ) ( ON ?auto_1814997 ?auto_1814999 ) ( CLEAR ?auto_1814997 ) ( not ( = ?auto_1814995 ?auto_1814999 ) ) ( not ( = ?auto_1814997 ?auto_1814999 ) ) ( not ( = ?auto_1814996 ?auto_1814999 ) ) ( TRUCK-AT ?auto_1814998 ?auto_1815000 ) ( ON ?auto_1814992 ?auto_1814991 ) ( ON ?auto_1814993 ?auto_1814992 ) ( ON ?auto_1814990 ?auto_1814993 ) ( ON ?auto_1814994 ?auto_1814990 ) ( ON ?auto_1814996 ?auto_1814994 ) ( not ( = ?auto_1814991 ?auto_1814992 ) ) ( not ( = ?auto_1814991 ?auto_1814993 ) ) ( not ( = ?auto_1814991 ?auto_1814990 ) ) ( not ( = ?auto_1814991 ?auto_1814994 ) ) ( not ( = ?auto_1814991 ?auto_1814996 ) ) ( not ( = ?auto_1814991 ?auto_1814995 ) ) ( not ( = ?auto_1814991 ?auto_1814997 ) ) ( not ( = ?auto_1814991 ?auto_1814999 ) ) ( not ( = ?auto_1814992 ?auto_1814993 ) ) ( not ( = ?auto_1814992 ?auto_1814990 ) ) ( not ( = ?auto_1814992 ?auto_1814994 ) ) ( not ( = ?auto_1814992 ?auto_1814996 ) ) ( not ( = ?auto_1814992 ?auto_1814995 ) ) ( not ( = ?auto_1814992 ?auto_1814997 ) ) ( not ( = ?auto_1814992 ?auto_1814999 ) ) ( not ( = ?auto_1814993 ?auto_1814990 ) ) ( not ( = ?auto_1814993 ?auto_1814994 ) ) ( not ( = ?auto_1814993 ?auto_1814996 ) ) ( not ( = ?auto_1814993 ?auto_1814995 ) ) ( not ( = ?auto_1814993 ?auto_1814997 ) ) ( not ( = ?auto_1814993 ?auto_1814999 ) ) ( not ( = ?auto_1814990 ?auto_1814994 ) ) ( not ( = ?auto_1814990 ?auto_1814996 ) ) ( not ( = ?auto_1814990 ?auto_1814995 ) ) ( not ( = ?auto_1814990 ?auto_1814997 ) ) ( not ( = ?auto_1814990 ?auto_1814999 ) ) ( not ( = ?auto_1814994 ?auto_1814996 ) ) ( not ( = ?auto_1814994 ?auto_1814995 ) ) ( not ( = ?auto_1814994 ?auto_1814997 ) ) ( not ( = ?auto_1814994 ?auto_1814999 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1814996 ?auto_1814995 ?auto_1814997 )
      ( MAKE-7CRATE-VERIFY ?auto_1814991 ?auto_1814992 ?auto_1814993 ?auto_1814990 ?auto_1814994 ?auto_1814996 ?auto_1814995 ?auto_1814997 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1815069 - SURFACE
      ?auto_1815070 - SURFACE
      ?auto_1815071 - SURFACE
      ?auto_1815068 - SURFACE
      ?auto_1815072 - SURFACE
      ?auto_1815074 - SURFACE
      ?auto_1815073 - SURFACE
      ?auto_1815075 - SURFACE
    )
    :vars
    (
      ?auto_1815076 - HOIST
      ?auto_1815079 - PLACE
      ?auto_1815077 - PLACE
      ?auto_1815081 - HOIST
      ?auto_1815080 - SURFACE
      ?auto_1815078 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1815076 ?auto_1815079 ) ( IS-CRATE ?auto_1815075 ) ( not ( = ?auto_1815073 ?auto_1815075 ) ) ( not ( = ?auto_1815074 ?auto_1815073 ) ) ( not ( = ?auto_1815074 ?auto_1815075 ) ) ( not ( = ?auto_1815077 ?auto_1815079 ) ) ( HOIST-AT ?auto_1815081 ?auto_1815077 ) ( not ( = ?auto_1815076 ?auto_1815081 ) ) ( AVAILABLE ?auto_1815081 ) ( SURFACE-AT ?auto_1815075 ?auto_1815077 ) ( ON ?auto_1815075 ?auto_1815080 ) ( CLEAR ?auto_1815075 ) ( not ( = ?auto_1815073 ?auto_1815080 ) ) ( not ( = ?auto_1815075 ?auto_1815080 ) ) ( not ( = ?auto_1815074 ?auto_1815080 ) ) ( TRUCK-AT ?auto_1815078 ?auto_1815079 ) ( SURFACE-AT ?auto_1815074 ?auto_1815079 ) ( CLEAR ?auto_1815074 ) ( LIFTING ?auto_1815076 ?auto_1815073 ) ( IS-CRATE ?auto_1815073 ) ( ON ?auto_1815070 ?auto_1815069 ) ( ON ?auto_1815071 ?auto_1815070 ) ( ON ?auto_1815068 ?auto_1815071 ) ( ON ?auto_1815072 ?auto_1815068 ) ( ON ?auto_1815074 ?auto_1815072 ) ( not ( = ?auto_1815069 ?auto_1815070 ) ) ( not ( = ?auto_1815069 ?auto_1815071 ) ) ( not ( = ?auto_1815069 ?auto_1815068 ) ) ( not ( = ?auto_1815069 ?auto_1815072 ) ) ( not ( = ?auto_1815069 ?auto_1815074 ) ) ( not ( = ?auto_1815069 ?auto_1815073 ) ) ( not ( = ?auto_1815069 ?auto_1815075 ) ) ( not ( = ?auto_1815069 ?auto_1815080 ) ) ( not ( = ?auto_1815070 ?auto_1815071 ) ) ( not ( = ?auto_1815070 ?auto_1815068 ) ) ( not ( = ?auto_1815070 ?auto_1815072 ) ) ( not ( = ?auto_1815070 ?auto_1815074 ) ) ( not ( = ?auto_1815070 ?auto_1815073 ) ) ( not ( = ?auto_1815070 ?auto_1815075 ) ) ( not ( = ?auto_1815070 ?auto_1815080 ) ) ( not ( = ?auto_1815071 ?auto_1815068 ) ) ( not ( = ?auto_1815071 ?auto_1815072 ) ) ( not ( = ?auto_1815071 ?auto_1815074 ) ) ( not ( = ?auto_1815071 ?auto_1815073 ) ) ( not ( = ?auto_1815071 ?auto_1815075 ) ) ( not ( = ?auto_1815071 ?auto_1815080 ) ) ( not ( = ?auto_1815068 ?auto_1815072 ) ) ( not ( = ?auto_1815068 ?auto_1815074 ) ) ( not ( = ?auto_1815068 ?auto_1815073 ) ) ( not ( = ?auto_1815068 ?auto_1815075 ) ) ( not ( = ?auto_1815068 ?auto_1815080 ) ) ( not ( = ?auto_1815072 ?auto_1815074 ) ) ( not ( = ?auto_1815072 ?auto_1815073 ) ) ( not ( = ?auto_1815072 ?auto_1815075 ) ) ( not ( = ?auto_1815072 ?auto_1815080 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1815074 ?auto_1815073 ?auto_1815075 )
      ( MAKE-7CRATE-VERIFY ?auto_1815069 ?auto_1815070 ?auto_1815071 ?auto_1815068 ?auto_1815072 ?auto_1815074 ?auto_1815073 ?auto_1815075 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1815147 - SURFACE
      ?auto_1815148 - SURFACE
      ?auto_1815149 - SURFACE
      ?auto_1815146 - SURFACE
      ?auto_1815150 - SURFACE
      ?auto_1815152 - SURFACE
      ?auto_1815151 - SURFACE
      ?auto_1815153 - SURFACE
    )
    :vars
    (
      ?auto_1815157 - HOIST
      ?auto_1815154 - PLACE
      ?auto_1815159 - PLACE
      ?auto_1815158 - HOIST
      ?auto_1815155 - SURFACE
      ?auto_1815156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1815157 ?auto_1815154 ) ( IS-CRATE ?auto_1815153 ) ( not ( = ?auto_1815151 ?auto_1815153 ) ) ( not ( = ?auto_1815152 ?auto_1815151 ) ) ( not ( = ?auto_1815152 ?auto_1815153 ) ) ( not ( = ?auto_1815159 ?auto_1815154 ) ) ( HOIST-AT ?auto_1815158 ?auto_1815159 ) ( not ( = ?auto_1815157 ?auto_1815158 ) ) ( AVAILABLE ?auto_1815158 ) ( SURFACE-AT ?auto_1815153 ?auto_1815159 ) ( ON ?auto_1815153 ?auto_1815155 ) ( CLEAR ?auto_1815153 ) ( not ( = ?auto_1815151 ?auto_1815155 ) ) ( not ( = ?auto_1815153 ?auto_1815155 ) ) ( not ( = ?auto_1815152 ?auto_1815155 ) ) ( TRUCK-AT ?auto_1815156 ?auto_1815154 ) ( SURFACE-AT ?auto_1815152 ?auto_1815154 ) ( CLEAR ?auto_1815152 ) ( IS-CRATE ?auto_1815151 ) ( AVAILABLE ?auto_1815157 ) ( IN ?auto_1815151 ?auto_1815156 ) ( ON ?auto_1815148 ?auto_1815147 ) ( ON ?auto_1815149 ?auto_1815148 ) ( ON ?auto_1815146 ?auto_1815149 ) ( ON ?auto_1815150 ?auto_1815146 ) ( ON ?auto_1815152 ?auto_1815150 ) ( not ( = ?auto_1815147 ?auto_1815148 ) ) ( not ( = ?auto_1815147 ?auto_1815149 ) ) ( not ( = ?auto_1815147 ?auto_1815146 ) ) ( not ( = ?auto_1815147 ?auto_1815150 ) ) ( not ( = ?auto_1815147 ?auto_1815152 ) ) ( not ( = ?auto_1815147 ?auto_1815151 ) ) ( not ( = ?auto_1815147 ?auto_1815153 ) ) ( not ( = ?auto_1815147 ?auto_1815155 ) ) ( not ( = ?auto_1815148 ?auto_1815149 ) ) ( not ( = ?auto_1815148 ?auto_1815146 ) ) ( not ( = ?auto_1815148 ?auto_1815150 ) ) ( not ( = ?auto_1815148 ?auto_1815152 ) ) ( not ( = ?auto_1815148 ?auto_1815151 ) ) ( not ( = ?auto_1815148 ?auto_1815153 ) ) ( not ( = ?auto_1815148 ?auto_1815155 ) ) ( not ( = ?auto_1815149 ?auto_1815146 ) ) ( not ( = ?auto_1815149 ?auto_1815150 ) ) ( not ( = ?auto_1815149 ?auto_1815152 ) ) ( not ( = ?auto_1815149 ?auto_1815151 ) ) ( not ( = ?auto_1815149 ?auto_1815153 ) ) ( not ( = ?auto_1815149 ?auto_1815155 ) ) ( not ( = ?auto_1815146 ?auto_1815150 ) ) ( not ( = ?auto_1815146 ?auto_1815152 ) ) ( not ( = ?auto_1815146 ?auto_1815151 ) ) ( not ( = ?auto_1815146 ?auto_1815153 ) ) ( not ( = ?auto_1815146 ?auto_1815155 ) ) ( not ( = ?auto_1815150 ?auto_1815152 ) ) ( not ( = ?auto_1815150 ?auto_1815151 ) ) ( not ( = ?auto_1815150 ?auto_1815153 ) ) ( not ( = ?auto_1815150 ?auto_1815155 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1815152 ?auto_1815151 ?auto_1815153 )
      ( MAKE-7CRATE-VERIFY ?auto_1815147 ?auto_1815148 ?auto_1815149 ?auto_1815146 ?auto_1815150 ?auto_1815152 ?auto_1815151 ?auto_1815153 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1818057 - SURFACE
      ?auto_1818058 - SURFACE
      ?auto_1818059 - SURFACE
      ?auto_1818056 - SURFACE
      ?auto_1818060 - SURFACE
      ?auto_1818062 - SURFACE
      ?auto_1818061 - SURFACE
      ?auto_1818063 - SURFACE
      ?auto_1818064 - SURFACE
    )
    :vars
    (
      ?auto_1818065 - HOIST
      ?auto_1818066 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1818065 ?auto_1818066 ) ( SURFACE-AT ?auto_1818063 ?auto_1818066 ) ( CLEAR ?auto_1818063 ) ( LIFTING ?auto_1818065 ?auto_1818064 ) ( IS-CRATE ?auto_1818064 ) ( not ( = ?auto_1818063 ?auto_1818064 ) ) ( ON ?auto_1818058 ?auto_1818057 ) ( ON ?auto_1818059 ?auto_1818058 ) ( ON ?auto_1818056 ?auto_1818059 ) ( ON ?auto_1818060 ?auto_1818056 ) ( ON ?auto_1818062 ?auto_1818060 ) ( ON ?auto_1818061 ?auto_1818062 ) ( ON ?auto_1818063 ?auto_1818061 ) ( not ( = ?auto_1818057 ?auto_1818058 ) ) ( not ( = ?auto_1818057 ?auto_1818059 ) ) ( not ( = ?auto_1818057 ?auto_1818056 ) ) ( not ( = ?auto_1818057 ?auto_1818060 ) ) ( not ( = ?auto_1818057 ?auto_1818062 ) ) ( not ( = ?auto_1818057 ?auto_1818061 ) ) ( not ( = ?auto_1818057 ?auto_1818063 ) ) ( not ( = ?auto_1818057 ?auto_1818064 ) ) ( not ( = ?auto_1818058 ?auto_1818059 ) ) ( not ( = ?auto_1818058 ?auto_1818056 ) ) ( not ( = ?auto_1818058 ?auto_1818060 ) ) ( not ( = ?auto_1818058 ?auto_1818062 ) ) ( not ( = ?auto_1818058 ?auto_1818061 ) ) ( not ( = ?auto_1818058 ?auto_1818063 ) ) ( not ( = ?auto_1818058 ?auto_1818064 ) ) ( not ( = ?auto_1818059 ?auto_1818056 ) ) ( not ( = ?auto_1818059 ?auto_1818060 ) ) ( not ( = ?auto_1818059 ?auto_1818062 ) ) ( not ( = ?auto_1818059 ?auto_1818061 ) ) ( not ( = ?auto_1818059 ?auto_1818063 ) ) ( not ( = ?auto_1818059 ?auto_1818064 ) ) ( not ( = ?auto_1818056 ?auto_1818060 ) ) ( not ( = ?auto_1818056 ?auto_1818062 ) ) ( not ( = ?auto_1818056 ?auto_1818061 ) ) ( not ( = ?auto_1818056 ?auto_1818063 ) ) ( not ( = ?auto_1818056 ?auto_1818064 ) ) ( not ( = ?auto_1818060 ?auto_1818062 ) ) ( not ( = ?auto_1818060 ?auto_1818061 ) ) ( not ( = ?auto_1818060 ?auto_1818063 ) ) ( not ( = ?auto_1818060 ?auto_1818064 ) ) ( not ( = ?auto_1818062 ?auto_1818061 ) ) ( not ( = ?auto_1818062 ?auto_1818063 ) ) ( not ( = ?auto_1818062 ?auto_1818064 ) ) ( not ( = ?auto_1818061 ?auto_1818063 ) ) ( not ( = ?auto_1818061 ?auto_1818064 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1818063 ?auto_1818064 )
      ( MAKE-8CRATE-VERIFY ?auto_1818057 ?auto_1818058 ?auto_1818059 ?auto_1818056 ?auto_1818060 ?auto_1818062 ?auto_1818061 ?auto_1818063 ?auto_1818064 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1818124 - SURFACE
      ?auto_1818125 - SURFACE
      ?auto_1818126 - SURFACE
      ?auto_1818123 - SURFACE
      ?auto_1818127 - SURFACE
      ?auto_1818129 - SURFACE
      ?auto_1818128 - SURFACE
      ?auto_1818130 - SURFACE
      ?auto_1818131 - SURFACE
    )
    :vars
    (
      ?auto_1818133 - HOIST
      ?auto_1818132 - PLACE
      ?auto_1818134 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1818133 ?auto_1818132 ) ( SURFACE-AT ?auto_1818130 ?auto_1818132 ) ( CLEAR ?auto_1818130 ) ( IS-CRATE ?auto_1818131 ) ( not ( = ?auto_1818130 ?auto_1818131 ) ) ( TRUCK-AT ?auto_1818134 ?auto_1818132 ) ( AVAILABLE ?auto_1818133 ) ( IN ?auto_1818131 ?auto_1818134 ) ( ON ?auto_1818130 ?auto_1818128 ) ( not ( = ?auto_1818128 ?auto_1818130 ) ) ( not ( = ?auto_1818128 ?auto_1818131 ) ) ( ON ?auto_1818125 ?auto_1818124 ) ( ON ?auto_1818126 ?auto_1818125 ) ( ON ?auto_1818123 ?auto_1818126 ) ( ON ?auto_1818127 ?auto_1818123 ) ( ON ?auto_1818129 ?auto_1818127 ) ( ON ?auto_1818128 ?auto_1818129 ) ( not ( = ?auto_1818124 ?auto_1818125 ) ) ( not ( = ?auto_1818124 ?auto_1818126 ) ) ( not ( = ?auto_1818124 ?auto_1818123 ) ) ( not ( = ?auto_1818124 ?auto_1818127 ) ) ( not ( = ?auto_1818124 ?auto_1818129 ) ) ( not ( = ?auto_1818124 ?auto_1818128 ) ) ( not ( = ?auto_1818124 ?auto_1818130 ) ) ( not ( = ?auto_1818124 ?auto_1818131 ) ) ( not ( = ?auto_1818125 ?auto_1818126 ) ) ( not ( = ?auto_1818125 ?auto_1818123 ) ) ( not ( = ?auto_1818125 ?auto_1818127 ) ) ( not ( = ?auto_1818125 ?auto_1818129 ) ) ( not ( = ?auto_1818125 ?auto_1818128 ) ) ( not ( = ?auto_1818125 ?auto_1818130 ) ) ( not ( = ?auto_1818125 ?auto_1818131 ) ) ( not ( = ?auto_1818126 ?auto_1818123 ) ) ( not ( = ?auto_1818126 ?auto_1818127 ) ) ( not ( = ?auto_1818126 ?auto_1818129 ) ) ( not ( = ?auto_1818126 ?auto_1818128 ) ) ( not ( = ?auto_1818126 ?auto_1818130 ) ) ( not ( = ?auto_1818126 ?auto_1818131 ) ) ( not ( = ?auto_1818123 ?auto_1818127 ) ) ( not ( = ?auto_1818123 ?auto_1818129 ) ) ( not ( = ?auto_1818123 ?auto_1818128 ) ) ( not ( = ?auto_1818123 ?auto_1818130 ) ) ( not ( = ?auto_1818123 ?auto_1818131 ) ) ( not ( = ?auto_1818127 ?auto_1818129 ) ) ( not ( = ?auto_1818127 ?auto_1818128 ) ) ( not ( = ?auto_1818127 ?auto_1818130 ) ) ( not ( = ?auto_1818127 ?auto_1818131 ) ) ( not ( = ?auto_1818129 ?auto_1818128 ) ) ( not ( = ?auto_1818129 ?auto_1818130 ) ) ( not ( = ?auto_1818129 ?auto_1818131 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1818128 ?auto_1818130 ?auto_1818131 )
      ( MAKE-8CRATE-VERIFY ?auto_1818124 ?auto_1818125 ?auto_1818126 ?auto_1818123 ?auto_1818127 ?auto_1818129 ?auto_1818128 ?auto_1818130 ?auto_1818131 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1818200 - SURFACE
      ?auto_1818201 - SURFACE
      ?auto_1818202 - SURFACE
      ?auto_1818199 - SURFACE
      ?auto_1818203 - SURFACE
      ?auto_1818205 - SURFACE
      ?auto_1818204 - SURFACE
      ?auto_1818206 - SURFACE
      ?auto_1818207 - SURFACE
    )
    :vars
    (
      ?auto_1818209 - HOIST
      ?auto_1818208 - PLACE
      ?auto_1818211 - TRUCK
      ?auto_1818210 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1818209 ?auto_1818208 ) ( SURFACE-AT ?auto_1818206 ?auto_1818208 ) ( CLEAR ?auto_1818206 ) ( IS-CRATE ?auto_1818207 ) ( not ( = ?auto_1818206 ?auto_1818207 ) ) ( AVAILABLE ?auto_1818209 ) ( IN ?auto_1818207 ?auto_1818211 ) ( ON ?auto_1818206 ?auto_1818204 ) ( not ( = ?auto_1818204 ?auto_1818206 ) ) ( not ( = ?auto_1818204 ?auto_1818207 ) ) ( TRUCK-AT ?auto_1818211 ?auto_1818210 ) ( not ( = ?auto_1818210 ?auto_1818208 ) ) ( ON ?auto_1818201 ?auto_1818200 ) ( ON ?auto_1818202 ?auto_1818201 ) ( ON ?auto_1818199 ?auto_1818202 ) ( ON ?auto_1818203 ?auto_1818199 ) ( ON ?auto_1818205 ?auto_1818203 ) ( ON ?auto_1818204 ?auto_1818205 ) ( not ( = ?auto_1818200 ?auto_1818201 ) ) ( not ( = ?auto_1818200 ?auto_1818202 ) ) ( not ( = ?auto_1818200 ?auto_1818199 ) ) ( not ( = ?auto_1818200 ?auto_1818203 ) ) ( not ( = ?auto_1818200 ?auto_1818205 ) ) ( not ( = ?auto_1818200 ?auto_1818204 ) ) ( not ( = ?auto_1818200 ?auto_1818206 ) ) ( not ( = ?auto_1818200 ?auto_1818207 ) ) ( not ( = ?auto_1818201 ?auto_1818202 ) ) ( not ( = ?auto_1818201 ?auto_1818199 ) ) ( not ( = ?auto_1818201 ?auto_1818203 ) ) ( not ( = ?auto_1818201 ?auto_1818205 ) ) ( not ( = ?auto_1818201 ?auto_1818204 ) ) ( not ( = ?auto_1818201 ?auto_1818206 ) ) ( not ( = ?auto_1818201 ?auto_1818207 ) ) ( not ( = ?auto_1818202 ?auto_1818199 ) ) ( not ( = ?auto_1818202 ?auto_1818203 ) ) ( not ( = ?auto_1818202 ?auto_1818205 ) ) ( not ( = ?auto_1818202 ?auto_1818204 ) ) ( not ( = ?auto_1818202 ?auto_1818206 ) ) ( not ( = ?auto_1818202 ?auto_1818207 ) ) ( not ( = ?auto_1818199 ?auto_1818203 ) ) ( not ( = ?auto_1818199 ?auto_1818205 ) ) ( not ( = ?auto_1818199 ?auto_1818204 ) ) ( not ( = ?auto_1818199 ?auto_1818206 ) ) ( not ( = ?auto_1818199 ?auto_1818207 ) ) ( not ( = ?auto_1818203 ?auto_1818205 ) ) ( not ( = ?auto_1818203 ?auto_1818204 ) ) ( not ( = ?auto_1818203 ?auto_1818206 ) ) ( not ( = ?auto_1818203 ?auto_1818207 ) ) ( not ( = ?auto_1818205 ?auto_1818204 ) ) ( not ( = ?auto_1818205 ?auto_1818206 ) ) ( not ( = ?auto_1818205 ?auto_1818207 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1818204 ?auto_1818206 ?auto_1818207 )
      ( MAKE-8CRATE-VERIFY ?auto_1818200 ?auto_1818201 ?auto_1818202 ?auto_1818199 ?auto_1818203 ?auto_1818205 ?auto_1818204 ?auto_1818206 ?auto_1818207 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1818284 - SURFACE
      ?auto_1818285 - SURFACE
      ?auto_1818286 - SURFACE
      ?auto_1818283 - SURFACE
      ?auto_1818287 - SURFACE
      ?auto_1818289 - SURFACE
      ?auto_1818288 - SURFACE
      ?auto_1818290 - SURFACE
      ?auto_1818291 - SURFACE
    )
    :vars
    (
      ?auto_1818295 - HOIST
      ?auto_1818292 - PLACE
      ?auto_1818293 - TRUCK
      ?auto_1818296 - PLACE
      ?auto_1818294 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1818295 ?auto_1818292 ) ( SURFACE-AT ?auto_1818290 ?auto_1818292 ) ( CLEAR ?auto_1818290 ) ( IS-CRATE ?auto_1818291 ) ( not ( = ?auto_1818290 ?auto_1818291 ) ) ( AVAILABLE ?auto_1818295 ) ( ON ?auto_1818290 ?auto_1818288 ) ( not ( = ?auto_1818288 ?auto_1818290 ) ) ( not ( = ?auto_1818288 ?auto_1818291 ) ) ( TRUCK-AT ?auto_1818293 ?auto_1818296 ) ( not ( = ?auto_1818296 ?auto_1818292 ) ) ( HOIST-AT ?auto_1818294 ?auto_1818296 ) ( LIFTING ?auto_1818294 ?auto_1818291 ) ( not ( = ?auto_1818295 ?auto_1818294 ) ) ( ON ?auto_1818285 ?auto_1818284 ) ( ON ?auto_1818286 ?auto_1818285 ) ( ON ?auto_1818283 ?auto_1818286 ) ( ON ?auto_1818287 ?auto_1818283 ) ( ON ?auto_1818289 ?auto_1818287 ) ( ON ?auto_1818288 ?auto_1818289 ) ( not ( = ?auto_1818284 ?auto_1818285 ) ) ( not ( = ?auto_1818284 ?auto_1818286 ) ) ( not ( = ?auto_1818284 ?auto_1818283 ) ) ( not ( = ?auto_1818284 ?auto_1818287 ) ) ( not ( = ?auto_1818284 ?auto_1818289 ) ) ( not ( = ?auto_1818284 ?auto_1818288 ) ) ( not ( = ?auto_1818284 ?auto_1818290 ) ) ( not ( = ?auto_1818284 ?auto_1818291 ) ) ( not ( = ?auto_1818285 ?auto_1818286 ) ) ( not ( = ?auto_1818285 ?auto_1818283 ) ) ( not ( = ?auto_1818285 ?auto_1818287 ) ) ( not ( = ?auto_1818285 ?auto_1818289 ) ) ( not ( = ?auto_1818285 ?auto_1818288 ) ) ( not ( = ?auto_1818285 ?auto_1818290 ) ) ( not ( = ?auto_1818285 ?auto_1818291 ) ) ( not ( = ?auto_1818286 ?auto_1818283 ) ) ( not ( = ?auto_1818286 ?auto_1818287 ) ) ( not ( = ?auto_1818286 ?auto_1818289 ) ) ( not ( = ?auto_1818286 ?auto_1818288 ) ) ( not ( = ?auto_1818286 ?auto_1818290 ) ) ( not ( = ?auto_1818286 ?auto_1818291 ) ) ( not ( = ?auto_1818283 ?auto_1818287 ) ) ( not ( = ?auto_1818283 ?auto_1818289 ) ) ( not ( = ?auto_1818283 ?auto_1818288 ) ) ( not ( = ?auto_1818283 ?auto_1818290 ) ) ( not ( = ?auto_1818283 ?auto_1818291 ) ) ( not ( = ?auto_1818287 ?auto_1818289 ) ) ( not ( = ?auto_1818287 ?auto_1818288 ) ) ( not ( = ?auto_1818287 ?auto_1818290 ) ) ( not ( = ?auto_1818287 ?auto_1818291 ) ) ( not ( = ?auto_1818289 ?auto_1818288 ) ) ( not ( = ?auto_1818289 ?auto_1818290 ) ) ( not ( = ?auto_1818289 ?auto_1818291 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1818288 ?auto_1818290 ?auto_1818291 )
      ( MAKE-8CRATE-VERIFY ?auto_1818284 ?auto_1818285 ?auto_1818286 ?auto_1818283 ?auto_1818287 ?auto_1818289 ?auto_1818288 ?auto_1818290 ?auto_1818291 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1818376 - SURFACE
      ?auto_1818377 - SURFACE
      ?auto_1818378 - SURFACE
      ?auto_1818375 - SURFACE
      ?auto_1818379 - SURFACE
      ?auto_1818381 - SURFACE
      ?auto_1818380 - SURFACE
      ?auto_1818382 - SURFACE
      ?auto_1818383 - SURFACE
    )
    :vars
    (
      ?auto_1818388 - HOIST
      ?auto_1818384 - PLACE
      ?auto_1818386 - TRUCK
      ?auto_1818389 - PLACE
      ?auto_1818387 - HOIST
      ?auto_1818385 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1818388 ?auto_1818384 ) ( SURFACE-AT ?auto_1818382 ?auto_1818384 ) ( CLEAR ?auto_1818382 ) ( IS-CRATE ?auto_1818383 ) ( not ( = ?auto_1818382 ?auto_1818383 ) ) ( AVAILABLE ?auto_1818388 ) ( ON ?auto_1818382 ?auto_1818380 ) ( not ( = ?auto_1818380 ?auto_1818382 ) ) ( not ( = ?auto_1818380 ?auto_1818383 ) ) ( TRUCK-AT ?auto_1818386 ?auto_1818389 ) ( not ( = ?auto_1818389 ?auto_1818384 ) ) ( HOIST-AT ?auto_1818387 ?auto_1818389 ) ( not ( = ?auto_1818388 ?auto_1818387 ) ) ( AVAILABLE ?auto_1818387 ) ( SURFACE-AT ?auto_1818383 ?auto_1818389 ) ( ON ?auto_1818383 ?auto_1818385 ) ( CLEAR ?auto_1818383 ) ( not ( = ?auto_1818382 ?auto_1818385 ) ) ( not ( = ?auto_1818383 ?auto_1818385 ) ) ( not ( = ?auto_1818380 ?auto_1818385 ) ) ( ON ?auto_1818377 ?auto_1818376 ) ( ON ?auto_1818378 ?auto_1818377 ) ( ON ?auto_1818375 ?auto_1818378 ) ( ON ?auto_1818379 ?auto_1818375 ) ( ON ?auto_1818381 ?auto_1818379 ) ( ON ?auto_1818380 ?auto_1818381 ) ( not ( = ?auto_1818376 ?auto_1818377 ) ) ( not ( = ?auto_1818376 ?auto_1818378 ) ) ( not ( = ?auto_1818376 ?auto_1818375 ) ) ( not ( = ?auto_1818376 ?auto_1818379 ) ) ( not ( = ?auto_1818376 ?auto_1818381 ) ) ( not ( = ?auto_1818376 ?auto_1818380 ) ) ( not ( = ?auto_1818376 ?auto_1818382 ) ) ( not ( = ?auto_1818376 ?auto_1818383 ) ) ( not ( = ?auto_1818376 ?auto_1818385 ) ) ( not ( = ?auto_1818377 ?auto_1818378 ) ) ( not ( = ?auto_1818377 ?auto_1818375 ) ) ( not ( = ?auto_1818377 ?auto_1818379 ) ) ( not ( = ?auto_1818377 ?auto_1818381 ) ) ( not ( = ?auto_1818377 ?auto_1818380 ) ) ( not ( = ?auto_1818377 ?auto_1818382 ) ) ( not ( = ?auto_1818377 ?auto_1818383 ) ) ( not ( = ?auto_1818377 ?auto_1818385 ) ) ( not ( = ?auto_1818378 ?auto_1818375 ) ) ( not ( = ?auto_1818378 ?auto_1818379 ) ) ( not ( = ?auto_1818378 ?auto_1818381 ) ) ( not ( = ?auto_1818378 ?auto_1818380 ) ) ( not ( = ?auto_1818378 ?auto_1818382 ) ) ( not ( = ?auto_1818378 ?auto_1818383 ) ) ( not ( = ?auto_1818378 ?auto_1818385 ) ) ( not ( = ?auto_1818375 ?auto_1818379 ) ) ( not ( = ?auto_1818375 ?auto_1818381 ) ) ( not ( = ?auto_1818375 ?auto_1818380 ) ) ( not ( = ?auto_1818375 ?auto_1818382 ) ) ( not ( = ?auto_1818375 ?auto_1818383 ) ) ( not ( = ?auto_1818375 ?auto_1818385 ) ) ( not ( = ?auto_1818379 ?auto_1818381 ) ) ( not ( = ?auto_1818379 ?auto_1818380 ) ) ( not ( = ?auto_1818379 ?auto_1818382 ) ) ( not ( = ?auto_1818379 ?auto_1818383 ) ) ( not ( = ?auto_1818379 ?auto_1818385 ) ) ( not ( = ?auto_1818381 ?auto_1818380 ) ) ( not ( = ?auto_1818381 ?auto_1818382 ) ) ( not ( = ?auto_1818381 ?auto_1818383 ) ) ( not ( = ?auto_1818381 ?auto_1818385 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1818380 ?auto_1818382 ?auto_1818383 )
      ( MAKE-8CRATE-VERIFY ?auto_1818376 ?auto_1818377 ?auto_1818378 ?auto_1818375 ?auto_1818379 ?auto_1818381 ?auto_1818380 ?auto_1818382 ?auto_1818383 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1818469 - SURFACE
      ?auto_1818470 - SURFACE
      ?auto_1818471 - SURFACE
      ?auto_1818468 - SURFACE
      ?auto_1818472 - SURFACE
      ?auto_1818474 - SURFACE
      ?auto_1818473 - SURFACE
      ?auto_1818475 - SURFACE
      ?auto_1818476 - SURFACE
    )
    :vars
    (
      ?auto_1818481 - HOIST
      ?auto_1818480 - PLACE
      ?auto_1818482 - PLACE
      ?auto_1818477 - HOIST
      ?auto_1818478 - SURFACE
      ?auto_1818479 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1818481 ?auto_1818480 ) ( SURFACE-AT ?auto_1818475 ?auto_1818480 ) ( CLEAR ?auto_1818475 ) ( IS-CRATE ?auto_1818476 ) ( not ( = ?auto_1818475 ?auto_1818476 ) ) ( AVAILABLE ?auto_1818481 ) ( ON ?auto_1818475 ?auto_1818473 ) ( not ( = ?auto_1818473 ?auto_1818475 ) ) ( not ( = ?auto_1818473 ?auto_1818476 ) ) ( not ( = ?auto_1818482 ?auto_1818480 ) ) ( HOIST-AT ?auto_1818477 ?auto_1818482 ) ( not ( = ?auto_1818481 ?auto_1818477 ) ) ( AVAILABLE ?auto_1818477 ) ( SURFACE-AT ?auto_1818476 ?auto_1818482 ) ( ON ?auto_1818476 ?auto_1818478 ) ( CLEAR ?auto_1818476 ) ( not ( = ?auto_1818475 ?auto_1818478 ) ) ( not ( = ?auto_1818476 ?auto_1818478 ) ) ( not ( = ?auto_1818473 ?auto_1818478 ) ) ( TRUCK-AT ?auto_1818479 ?auto_1818480 ) ( ON ?auto_1818470 ?auto_1818469 ) ( ON ?auto_1818471 ?auto_1818470 ) ( ON ?auto_1818468 ?auto_1818471 ) ( ON ?auto_1818472 ?auto_1818468 ) ( ON ?auto_1818474 ?auto_1818472 ) ( ON ?auto_1818473 ?auto_1818474 ) ( not ( = ?auto_1818469 ?auto_1818470 ) ) ( not ( = ?auto_1818469 ?auto_1818471 ) ) ( not ( = ?auto_1818469 ?auto_1818468 ) ) ( not ( = ?auto_1818469 ?auto_1818472 ) ) ( not ( = ?auto_1818469 ?auto_1818474 ) ) ( not ( = ?auto_1818469 ?auto_1818473 ) ) ( not ( = ?auto_1818469 ?auto_1818475 ) ) ( not ( = ?auto_1818469 ?auto_1818476 ) ) ( not ( = ?auto_1818469 ?auto_1818478 ) ) ( not ( = ?auto_1818470 ?auto_1818471 ) ) ( not ( = ?auto_1818470 ?auto_1818468 ) ) ( not ( = ?auto_1818470 ?auto_1818472 ) ) ( not ( = ?auto_1818470 ?auto_1818474 ) ) ( not ( = ?auto_1818470 ?auto_1818473 ) ) ( not ( = ?auto_1818470 ?auto_1818475 ) ) ( not ( = ?auto_1818470 ?auto_1818476 ) ) ( not ( = ?auto_1818470 ?auto_1818478 ) ) ( not ( = ?auto_1818471 ?auto_1818468 ) ) ( not ( = ?auto_1818471 ?auto_1818472 ) ) ( not ( = ?auto_1818471 ?auto_1818474 ) ) ( not ( = ?auto_1818471 ?auto_1818473 ) ) ( not ( = ?auto_1818471 ?auto_1818475 ) ) ( not ( = ?auto_1818471 ?auto_1818476 ) ) ( not ( = ?auto_1818471 ?auto_1818478 ) ) ( not ( = ?auto_1818468 ?auto_1818472 ) ) ( not ( = ?auto_1818468 ?auto_1818474 ) ) ( not ( = ?auto_1818468 ?auto_1818473 ) ) ( not ( = ?auto_1818468 ?auto_1818475 ) ) ( not ( = ?auto_1818468 ?auto_1818476 ) ) ( not ( = ?auto_1818468 ?auto_1818478 ) ) ( not ( = ?auto_1818472 ?auto_1818474 ) ) ( not ( = ?auto_1818472 ?auto_1818473 ) ) ( not ( = ?auto_1818472 ?auto_1818475 ) ) ( not ( = ?auto_1818472 ?auto_1818476 ) ) ( not ( = ?auto_1818472 ?auto_1818478 ) ) ( not ( = ?auto_1818474 ?auto_1818473 ) ) ( not ( = ?auto_1818474 ?auto_1818475 ) ) ( not ( = ?auto_1818474 ?auto_1818476 ) ) ( not ( = ?auto_1818474 ?auto_1818478 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1818473 ?auto_1818475 ?auto_1818476 )
      ( MAKE-8CRATE-VERIFY ?auto_1818469 ?auto_1818470 ?auto_1818471 ?auto_1818468 ?auto_1818472 ?auto_1818474 ?auto_1818473 ?auto_1818475 ?auto_1818476 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1818562 - SURFACE
      ?auto_1818563 - SURFACE
      ?auto_1818564 - SURFACE
      ?auto_1818561 - SURFACE
      ?auto_1818565 - SURFACE
      ?auto_1818567 - SURFACE
      ?auto_1818566 - SURFACE
      ?auto_1818568 - SURFACE
      ?auto_1818569 - SURFACE
    )
    :vars
    (
      ?auto_1818572 - HOIST
      ?auto_1818573 - PLACE
      ?auto_1818571 - PLACE
      ?auto_1818574 - HOIST
      ?auto_1818570 - SURFACE
      ?auto_1818575 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1818572 ?auto_1818573 ) ( IS-CRATE ?auto_1818569 ) ( not ( = ?auto_1818568 ?auto_1818569 ) ) ( not ( = ?auto_1818566 ?auto_1818568 ) ) ( not ( = ?auto_1818566 ?auto_1818569 ) ) ( not ( = ?auto_1818571 ?auto_1818573 ) ) ( HOIST-AT ?auto_1818574 ?auto_1818571 ) ( not ( = ?auto_1818572 ?auto_1818574 ) ) ( AVAILABLE ?auto_1818574 ) ( SURFACE-AT ?auto_1818569 ?auto_1818571 ) ( ON ?auto_1818569 ?auto_1818570 ) ( CLEAR ?auto_1818569 ) ( not ( = ?auto_1818568 ?auto_1818570 ) ) ( not ( = ?auto_1818569 ?auto_1818570 ) ) ( not ( = ?auto_1818566 ?auto_1818570 ) ) ( TRUCK-AT ?auto_1818575 ?auto_1818573 ) ( SURFACE-AT ?auto_1818566 ?auto_1818573 ) ( CLEAR ?auto_1818566 ) ( LIFTING ?auto_1818572 ?auto_1818568 ) ( IS-CRATE ?auto_1818568 ) ( ON ?auto_1818563 ?auto_1818562 ) ( ON ?auto_1818564 ?auto_1818563 ) ( ON ?auto_1818561 ?auto_1818564 ) ( ON ?auto_1818565 ?auto_1818561 ) ( ON ?auto_1818567 ?auto_1818565 ) ( ON ?auto_1818566 ?auto_1818567 ) ( not ( = ?auto_1818562 ?auto_1818563 ) ) ( not ( = ?auto_1818562 ?auto_1818564 ) ) ( not ( = ?auto_1818562 ?auto_1818561 ) ) ( not ( = ?auto_1818562 ?auto_1818565 ) ) ( not ( = ?auto_1818562 ?auto_1818567 ) ) ( not ( = ?auto_1818562 ?auto_1818566 ) ) ( not ( = ?auto_1818562 ?auto_1818568 ) ) ( not ( = ?auto_1818562 ?auto_1818569 ) ) ( not ( = ?auto_1818562 ?auto_1818570 ) ) ( not ( = ?auto_1818563 ?auto_1818564 ) ) ( not ( = ?auto_1818563 ?auto_1818561 ) ) ( not ( = ?auto_1818563 ?auto_1818565 ) ) ( not ( = ?auto_1818563 ?auto_1818567 ) ) ( not ( = ?auto_1818563 ?auto_1818566 ) ) ( not ( = ?auto_1818563 ?auto_1818568 ) ) ( not ( = ?auto_1818563 ?auto_1818569 ) ) ( not ( = ?auto_1818563 ?auto_1818570 ) ) ( not ( = ?auto_1818564 ?auto_1818561 ) ) ( not ( = ?auto_1818564 ?auto_1818565 ) ) ( not ( = ?auto_1818564 ?auto_1818567 ) ) ( not ( = ?auto_1818564 ?auto_1818566 ) ) ( not ( = ?auto_1818564 ?auto_1818568 ) ) ( not ( = ?auto_1818564 ?auto_1818569 ) ) ( not ( = ?auto_1818564 ?auto_1818570 ) ) ( not ( = ?auto_1818561 ?auto_1818565 ) ) ( not ( = ?auto_1818561 ?auto_1818567 ) ) ( not ( = ?auto_1818561 ?auto_1818566 ) ) ( not ( = ?auto_1818561 ?auto_1818568 ) ) ( not ( = ?auto_1818561 ?auto_1818569 ) ) ( not ( = ?auto_1818561 ?auto_1818570 ) ) ( not ( = ?auto_1818565 ?auto_1818567 ) ) ( not ( = ?auto_1818565 ?auto_1818566 ) ) ( not ( = ?auto_1818565 ?auto_1818568 ) ) ( not ( = ?auto_1818565 ?auto_1818569 ) ) ( not ( = ?auto_1818565 ?auto_1818570 ) ) ( not ( = ?auto_1818567 ?auto_1818566 ) ) ( not ( = ?auto_1818567 ?auto_1818568 ) ) ( not ( = ?auto_1818567 ?auto_1818569 ) ) ( not ( = ?auto_1818567 ?auto_1818570 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1818566 ?auto_1818568 ?auto_1818569 )
      ( MAKE-8CRATE-VERIFY ?auto_1818562 ?auto_1818563 ?auto_1818564 ?auto_1818561 ?auto_1818565 ?auto_1818567 ?auto_1818566 ?auto_1818568 ?auto_1818569 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1818655 - SURFACE
      ?auto_1818656 - SURFACE
      ?auto_1818657 - SURFACE
      ?auto_1818654 - SURFACE
      ?auto_1818658 - SURFACE
      ?auto_1818660 - SURFACE
      ?auto_1818659 - SURFACE
      ?auto_1818661 - SURFACE
      ?auto_1818662 - SURFACE
    )
    :vars
    (
      ?auto_1818665 - HOIST
      ?auto_1818663 - PLACE
      ?auto_1818666 - PLACE
      ?auto_1818667 - HOIST
      ?auto_1818668 - SURFACE
      ?auto_1818664 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1818665 ?auto_1818663 ) ( IS-CRATE ?auto_1818662 ) ( not ( = ?auto_1818661 ?auto_1818662 ) ) ( not ( = ?auto_1818659 ?auto_1818661 ) ) ( not ( = ?auto_1818659 ?auto_1818662 ) ) ( not ( = ?auto_1818666 ?auto_1818663 ) ) ( HOIST-AT ?auto_1818667 ?auto_1818666 ) ( not ( = ?auto_1818665 ?auto_1818667 ) ) ( AVAILABLE ?auto_1818667 ) ( SURFACE-AT ?auto_1818662 ?auto_1818666 ) ( ON ?auto_1818662 ?auto_1818668 ) ( CLEAR ?auto_1818662 ) ( not ( = ?auto_1818661 ?auto_1818668 ) ) ( not ( = ?auto_1818662 ?auto_1818668 ) ) ( not ( = ?auto_1818659 ?auto_1818668 ) ) ( TRUCK-AT ?auto_1818664 ?auto_1818663 ) ( SURFACE-AT ?auto_1818659 ?auto_1818663 ) ( CLEAR ?auto_1818659 ) ( IS-CRATE ?auto_1818661 ) ( AVAILABLE ?auto_1818665 ) ( IN ?auto_1818661 ?auto_1818664 ) ( ON ?auto_1818656 ?auto_1818655 ) ( ON ?auto_1818657 ?auto_1818656 ) ( ON ?auto_1818654 ?auto_1818657 ) ( ON ?auto_1818658 ?auto_1818654 ) ( ON ?auto_1818660 ?auto_1818658 ) ( ON ?auto_1818659 ?auto_1818660 ) ( not ( = ?auto_1818655 ?auto_1818656 ) ) ( not ( = ?auto_1818655 ?auto_1818657 ) ) ( not ( = ?auto_1818655 ?auto_1818654 ) ) ( not ( = ?auto_1818655 ?auto_1818658 ) ) ( not ( = ?auto_1818655 ?auto_1818660 ) ) ( not ( = ?auto_1818655 ?auto_1818659 ) ) ( not ( = ?auto_1818655 ?auto_1818661 ) ) ( not ( = ?auto_1818655 ?auto_1818662 ) ) ( not ( = ?auto_1818655 ?auto_1818668 ) ) ( not ( = ?auto_1818656 ?auto_1818657 ) ) ( not ( = ?auto_1818656 ?auto_1818654 ) ) ( not ( = ?auto_1818656 ?auto_1818658 ) ) ( not ( = ?auto_1818656 ?auto_1818660 ) ) ( not ( = ?auto_1818656 ?auto_1818659 ) ) ( not ( = ?auto_1818656 ?auto_1818661 ) ) ( not ( = ?auto_1818656 ?auto_1818662 ) ) ( not ( = ?auto_1818656 ?auto_1818668 ) ) ( not ( = ?auto_1818657 ?auto_1818654 ) ) ( not ( = ?auto_1818657 ?auto_1818658 ) ) ( not ( = ?auto_1818657 ?auto_1818660 ) ) ( not ( = ?auto_1818657 ?auto_1818659 ) ) ( not ( = ?auto_1818657 ?auto_1818661 ) ) ( not ( = ?auto_1818657 ?auto_1818662 ) ) ( not ( = ?auto_1818657 ?auto_1818668 ) ) ( not ( = ?auto_1818654 ?auto_1818658 ) ) ( not ( = ?auto_1818654 ?auto_1818660 ) ) ( not ( = ?auto_1818654 ?auto_1818659 ) ) ( not ( = ?auto_1818654 ?auto_1818661 ) ) ( not ( = ?auto_1818654 ?auto_1818662 ) ) ( not ( = ?auto_1818654 ?auto_1818668 ) ) ( not ( = ?auto_1818658 ?auto_1818660 ) ) ( not ( = ?auto_1818658 ?auto_1818659 ) ) ( not ( = ?auto_1818658 ?auto_1818661 ) ) ( not ( = ?auto_1818658 ?auto_1818662 ) ) ( not ( = ?auto_1818658 ?auto_1818668 ) ) ( not ( = ?auto_1818660 ?auto_1818659 ) ) ( not ( = ?auto_1818660 ?auto_1818661 ) ) ( not ( = ?auto_1818660 ?auto_1818662 ) ) ( not ( = ?auto_1818660 ?auto_1818668 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1818659 ?auto_1818661 ?auto_1818662 )
      ( MAKE-8CRATE-VERIFY ?auto_1818655 ?auto_1818656 ?auto_1818657 ?auto_1818654 ?auto_1818658 ?auto_1818660 ?auto_1818659 ?auto_1818661 ?auto_1818662 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1822771 - SURFACE
      ?auto_1822772 - SURFACE
      ?auto_1822773 - SURFACE
      ?auto_1822770 - SURFACE
      ?auto_1822774 - SURFACE
      ?auto_1822776 - SURFACE
      ?auto_1822775 - SURFACE
      ?auto_1822777 - SURFACE
      ?auto_1822778 - SURFACE
      ?auto_1822779 - SURFACE
    )
    :vars
    (
      ?auto_1822781 - HOIST
      ?auto_1822780 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1822781 ?auto_1822780 ) ( SURFACE-AT ?auto_1822778 ?auto_1822780 ) ( CLEAR ?auto_1822778 ) ( LIFTING ?auto_1822781 ?auto_1822779 ) ( IS-CRATE ?auto_1822779 ) ( not ( = ?auto_1822778 ?auto_1822779 ) ) ( ON ?auto_1822772 ?auto_1822771 ) ( ON ?auto_1822773 ?auto_1822772 ) ( ON ?auto_1822770 ?auto_1822773 ) ( ON ?auto_1822774 ?auto_1822770 ) ( ON ?auto_1822776 ?auto_1822774 ) ( ON ?auto_1822775 ?auto_1822776 ) ( ON ?auto_1822777 ?auto_1822775 ) ( ON ?auto_1822778 ?auto_1822777 ) ( not ( = ?auto_1822771 ?auto_1822772 ) ) ( not ( = ?auto_1822771 ?auto_1822773 ) ) ( not ( = ?auto_1822771 ?auto_1822770 ) ) ( not ( = ?auto_1822771 ?auto_1822774 ) ) ( not ( = ?auto_1822771 ?auto_1822776 ) ) ( not ( = ?auto_1822771 ?auto_1822775 ) ) ( not ( = ?auto_1822771 ?auto_1822777 ) ) ( not ( = ?auto_1822771 ?auto_1822778 ) ) ( not ( = ?auto_1822771 ?auto_1822779 ) ) ( not ( = ?auto_1822772 ?auto_1822773 ) ) ( not ( = ?auto_1822772 ?auto_1822770 ) ) ( not ( = ?auto_1822772 ?auto_1822774 ) ) ( not ( = ?auto_1822772 ?auto_1822776 ) ) ( not ( = ?auto_1822772 ?auto_1822775 ) ) ( not ( = ?auto_1822772 ?auto_1822777 ) ) ( not ( = ?auto_1822772 ?auto_1822778 ) ) ( not ( = ?auto_1822772 ?auto_1822779 ) ) ( not ( = ?auto_1822773 ?auto_1822770 ) ) ( not ( = ?auto_1822773 ?auto_1822774 ) ) ( not ( = ?auto_1822773 ?auto_1822776 ) ) ( not ( = ?auto_1822773 ?auto_1822775 ) ) ( not ( = ?auto_1822773 ?auto_1822777 ) ) ( not ( = ?auto_1822773 ?auto_1822778 ) ) ( not ( = ?auto_1822773 ?auto_1822779 ) ) ( not ( = ?auto_1822770 ?auto_1822774 ) ) ( not ( = ?auto_1822770 ?auto_1822776 ) ) ( not ( = ?auto_1822770 ?auto_1822775 ) ) ( not ( = ?auto_1822770 ?auto_1822777 ) ) ( not ( = ?auto_1822770 ?auto_1822778 ) ) ( not ( = ?auto_1822770 ?auto_1822779 ) ) ( not ( = ?auto_1822774 ?auto_1822776 ) ) ( not ( = ?auto_1822774 ?auto_1822775 ) ) ( not ( = ?auto_1822774 ?auto_1822777 ) ) ( not ( = ?auto_1822774 ?auto_1822778 ) ) ( not ( = ?auto_1822774 ?auto_1822779 ) ) ( not ( = ?auto_1822776 ?auto_1822775 ) ) ( not ( = ?auto_1822776 ?auto_1822777 ) ) ( not ( = ?auto_1822776 ?auto_1822778 ) ) ( not ( = ?auto_1822776 ?auto_1822779 ) ) ( not ( = ?auto_1822775 ?auto_1822777 ) ) ( not ( = ?auto_1822775 ?auto_1822778 ) ) ( not ( = ?auto_1822775 ?auto_1822779 ) ) ( not ( = ?auto_1822777 ?auto_1822778 ) ) ( not ( = ?auto_1822777 ?auto_1822779 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1822778 ?auto_1822779 )
      ( MAKE-9CRATE-VERIFY ?auto_1822771 ?auto_1822772 ?auto_1822773 ?auto_1822770 ?auto_1822774 ?auto_1822776 ?auto_1822775 ?auto_1822777 ?auto_1822778 ?auto_1822779 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1822851 - SURFACE
      ?auto_1822852 - SURFACE
      ?auto_1822853 - SURFACE
      ?auto_1822850 - SURFACE
      ?auto_1822854 - SURFACE
      ?auto_1822856 - SURFACE
      ?auto_1822855 - SURFACE
      ?auto_1822857 - SURFACE
      ?auto_1822858 - SURFACE
      ?auto_1822859 - SURFACE
    )
    :vars
    (
      ?auto_1822862 - HOIST
      ?auto_1822860 - PLACE
      ?auto_1822861 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1822862 ?auto_1822860 ) ( SURFACE-AT ?auto_1822858 ?auto_1822860 ) ( CLEAR ?auto_1822858 ) ( IS-CRATE ?auto_1822859 ) ( not ( = ?auto_1822858 ?auto_1822859 ) ) ( TRUCK-AT ?auto_1822861 ?auto_1822860 ) ( AVAILABLE ?auto_1822862 ) ( IN ?auto_1822859 ?auto_1822861 ) ( ON ?auto_1822858 ?auto_1822857 ) ( not ( = ?auto_1822857 ?auto_1822858 ) ) ( not ( = ?auto_1822857 ?auto_1822859 ) ) ( ON ?auto_1822852 ?auto_1822851 ) ( ON ?auto_1822853 ?auto_1822852 ) ( ON ?auto_1822850 ?auto_1822853 ) ( ON ?auto_1822854 ?auto_1822850 ) ( ON ?auto_1822856 ?auto_1822854 ) ( ON ?auto_1822855 ?auto_1822856 ) ( ON ?auto_1822857 ?auto_1822855 ) ( not ( = ?auto_1822851 ?auto_1822852 ) ) ( not ( = ?auto_1822851 ?auto_1822853 ) ) ( not ( = ?auto_1822851 ?auto_1822850 ) ) ( not ( = ?auto_1822851 ?auto_1822854 ) ) ( not ( = ?auto_1822851 ?auto_1822856 ) ) ( not ( = ?auto_1822851 ?auto_1822855 ) ) ( not ( = ?auto_1822851 ?auto_1822857 ) ) ( not ( = ?auto_1822851 ?auto_1822858 ) ) ( not ( = ?auto_1822851 ?auto_1822859 ) ) ( not ( = ?auto_1822852 ?auto_1822853 ) ) ( not ( = ?auto_1822852 ?auto_1822850 ) ) ( not ( = ?auto_1822852 ?auto_1822854 ) ) ( not ( = ?auto_1822852 ?auto_1822856 ) ) ( not ( = ?auto_1822852 ?auto_1822855 ) ) ( not ( = ?auto_1822852 ?auto_1822857 ) ) ( not ( = ?auto_1822852 ?auto_1822858 ) ) ( not ( = ?auto_1822852 ?auto_1822859 ) ) ( not ( = ?auto_1822853 ?auto_1822850 ) ) ( not ( = ?auto_1822853 ?auto_1822854 ) ) ( not ( = ?auto_1822853 ?auto_1822856 ) ) ( not ( = ?auto_1822853 ?auto_1822855 ) ) ( not ( = ?auto_1822853 ?auto_1822857 ) ) ( not ( = ?auto_1822853 ?auto_1822858 ) ) ( not ( = ?auto_1822853 ?auto_1822859 ) ) ( not ( = ?auto_1822850 ?auto_1822854 ) ) ( not ( = ?auto_1822850 ?auto_1822856 ) ) ( not ( = ?auto_1822850 ?auto_1822855 ) ) ( not ( = ?auto_1822850 ?auto_1822857 ) ) ( not ( = ?auto_1822850 ?auto_1822858 ) ) ( not ( = ?auto_1822850 ?auto_1822859 ) ) ( not ( = ?auto_1822854 ?auto_1822856 ) ) ( not ( = ?auto_1822854 ?auto_1822855 ) ) ( not ( = ?auto_1822854 ?auto_1822857 ) ) ( not ( = ?auto_1822854 ?auto_1822858 ) ) ( not ( = ?auto_1822854 ?auto_1822859 ) ) ( not ( = ?auto_1822856 ?auto_1822855 ) ) ( not ( = ?auto_1822856 ?auto_1822857 ) ) ( not ( = ?auto_1822856 ?auto_1822858 ) ) ( not ( = ?auto_1822856 ?auto_1822859 ) ) ( not ( = ?auto_1822855 ?auto_1822857 ) ) ( not ( = ?auto_1822855 ?auto_1822858 ) ) ( not ( = ?auto_1822855 ?auto_1822859 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1822857 ?auto_1822858 ?auto_1822859 )
      ( MAKE-9CRATE-VERIFY ?auto_1822851 ?auto_1822852 ?auto_1822853 ?auto_1822850 ?auto_1822854 ?auto_1822856 ?auto_1822855 ?auto_1822857 ?auto_1822858 ?auto_1822859 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1822941 - SURFACE
      ?auto_1822942 - SURFACE
      ?auto_1822943 - SURFACE
      ?auto_1822940 - SURFACE
      ?auto_1822944 - SURFACE
      ?auto_1822946 - SURFACE
      ?auto_1822945 - SURFACE
      ?auto_1822947 - SURFACE
      ?auto_1822948 - SURFACE
      ?auto_1822949 - SURFACE
    )
    :vars
    (
      ?auto_1822951 - HOIST
      ?auto_1822952 - PLACE
      ?auto_1822950 - TRUCK
      ?auto_1822953 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1822951 ?auto_1822952 ) ( SURFACE-AT ?auto_1822948 ?auto_1822952 ) ( CLEAR ?auto_1822948 ) ( IS-CRATE ?auto_1822949 ) ( not ( = ?auto_1822948 ?auto_1822949 ) ) ( AVAILABLE ?auto_1822951 ) ( IN ?auto_1822949 ?auto_1822950 ) ( ON ?auto_1822948 ?auto_1822947 ) ( not ( = ?auto_1822947 ?auto_1822948 ) ) ( not ( = ?auto_1822947 ?auto_1822949 ) ) ( TRUCK-AT ?auto_1822950 ?auto_1822953 ) ( not ( = ?auto_1822953 ?auto_1822952 ) ) ( ON ?auto_1822942 ?auto_1822941 ) ( ON ?auto_1822943 ?auto_1822942 ) ( ON ?auto_1822940 ?auto_1822943 ) ( ON ?auto_1822944 ?auto_1822940 ) ( ON ?auto_1822946 ?auto_1822944 ) ( ON ?auto_1822945 ?auto_1822946 ) ( ON ?auto_1822947 ?auto_1822945 ) ( not ( = ?auto_1822941 ?auto_1822942 ) ) ( not ( = ?auto_1822941 ?auto_1822943 ) ) ( not ( = ?auto_1822941 ?auto_1822940 ) ) ( not ( = ?auto_1822941 ?auto_1822944 ) ) ( not ( = ?auto_1822941 ?auto_1822946 ) ) ( not ( = ?auto_1822941 ?auto_1822945 ) ) ( not ( = ?auto_1822941 ?auto_1822947 ) ) ( not ( = ?auto_1822941 ?auto_1822948 ) ) ( not ( = ?auto_1822941 ?auto_1822949 ) ) ( not ( = ?auto_1822942 ?auto_1822943 ) ) ( not ( = ?auto_1822942 ?auto_1822940 ) ) ( not ( = ?auto_1822942 ?auto_1822944 ) ) ( not ( = ?auto_1822942 ?auto_1822946 ) ) ( not ( = ?auto_1822942 ?auto_1822945 ) ) ( not ( = ?auto_1822942 ?auto_1822947 ) ) ( not ( = ?auto_1822942 ?auto_1822948 ) ) ( not ( = ?auto_1822942 ?auto_1822949 ) ) ( not ( = ?auto_1822943 ?auto_1822940 ) ) ( not ( = ?auto_1822943 ?auto_1822944 ) ) ( not ( = ?auto_1822943 ?auto_1822946 ) ) ( not ( = ?auto_1822943 ?auto_1822945 ) ) ( not ( = ?auto_1822943 ?auto_1822947 ) ) ( not ( = ?auto_1822943 ?auto_1822948 ) ) ( not ( = ?auto_1822943 ?auto_1822949 ) ) ( not ( = ?auto_1822940 ?auto_1822944 ) ) ( not ( = ?auto_1822940 ?auto_1822946 ) ) ( not ( = ?auto_1822940 ?auto_1822945 ) ) ( not ( = ?auto_1822940 ?auto_1822947 ) ) ( not ( = ?auto_1822940 ?auto_1822948 ) ) ( not ( = ?auto_1822940 ?auto_1822949 ) ) ( not ( = ?auto_1822944 ?auto_1822946 ) ) ( not ( = ?auto_1822944 ?auto_1822945 ) ) ( not ( = ?auto_1822944 ?auto_1822947 ) ) ( not ( = ?auto_1822944 ?auto_1822948 ) ) ( not ( = ?auto_1822944 ?auto_1822949 ) ) ( not ( = ?auto_1822946 ?auto_1822945 ) ) ( not ( = ?auto_1822946 ?auto_1822947 ) ) ( not ( = ?auto_1822946 ?auto_1822948 ) ) ( not ( = ?auto_1822946 ?auto_1822949 ) ) ( not ( = ?auto_1822945 ?auto_1822947 ) ) ( not ( = ?auto_1822945 ?auto_1822948 ) ) ( not ( = ?auto_1822945 ?auto_1822949 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1822947 ?auto_1822948 ?auto_1822949 )
      ( MAKE-9CRATE-VERIFY ?auto_1822941 ?auto_1822942 ?auto_1822943 ?auto_1822940 ?auto_1822944 ?auto_1822946 ?auto_1822945 ?auto_1822947 ?auto_1822948 ?auto_1822949 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1823040 - SURFACE
      ?auto_1823041 - SURFACE
      ?auto_1823042 - SURFACE
      ?auto_1823039 - SURFACE
      ?auto_1823043 - SURFACE
      ?auto_1823045 - SURFACE
      ?auto_1823044 - SURFACE
      ?auto_1823046 - SURFACE
      ?auto_1823047 - SURFACE
      ?auto_1823048 - SURFACE
    )
    :vars
    (
      ?auto_1823049 - HOIST
      ?auto_1823053 - PLACE
      ?auto_1823052 - TRUCK
      ?auto_1823050 - PLACE
      ?auto_1823051 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1823049 ?auto_1823053 ) ( SURFACE-AT ?auto_1823047 ?auto_1823053 ) ( CLEAR ?auto_1823047 ) ( IS-CRATE ?auto_1823048 ) ( not ( = ?auto_1823047 ?auto_1823048 ) ) ( AVAILABLE ?auto_1823049 ) ( ON ?auto_1823047 ?auto_1823046 ) ( not ( = ?auto_1823046 ?auto_1823047 ) ) ( not ( = ?auto_1823046 ?auto_1823048 ) ) ( TRUCK-AT ?auto_1823052 ?auto_1823050 ) ( not ( = ?auto_1823050 ?auto_1823053 ) ) ( HOIST-AT ?auto_1823051 ?auto_1823050 ) ( LIFTING ?auto_1823051 ?auto_1823048 ) ( not ( = ?auto_1823049 ?auto_1823051 ) ) ( ON ?auto_1823041 ?auto_1823040 ) ( ON ?auto_1823042 ?auto_1823041 ) ( ON ?auto_1823039 ?auto_1823042 ) ( ON ?auto_1823043 ?auto_1823039 ) ( ON ?auto_1823045 ?auto_1823043 ) ( ON ?auto_1823044 ?auto_1823045 ) ( ON ?auto_1823046 ?auto_1823044 ) ( not ( = ?auto_1823040 ?auto_1823041 ) ) ( not ( = ?auto_1823040 ?auto_1823042 ) ) ( not ( = ?auto_1823040 ?auto_1823039 ) ) ( not ( = ?auto_1823040 ?auto_1823043 ) ) ( not ( = ?auto_1823040 ?auto_1823045 ) ) ( not ( = ?auto_1823040 ?auto_1823044 ) ) ( not ( = ?auto_1823040 ?auto_1823046 ) ) ( not ( = ?auto_1823040 ?auto_1823047 ) ) ( not ( = ?auto_1823040 ?auto_1823048 ) ) ( not ( = ?auto_1823041 ?auto_1823042 ) ) ( not ( = ?auto_1823041 ?auto_1823039 ) ) ( not ( = ?auto_1823041 ?auto_1823043 ) ) ( not ( = ?auto_1823041 ?auto_1823045 ) ) ( not ( = ?auto_1823041 ?auto_1823044 ) ) ( not ( = ?auto_1823041 ?auto_1823046 ) ) ( not ( = ?auto_1823041 ?auto_1823047 ) ) ( not ( = ?auto_1823041 ?auto_1823048 ) ) ( not ( = ?auto_1823042 ?auto_1823039 ) ) ( not ( = ?auto_1823042 ?auto_1823043 ) ) ( not ( = ?auto_1823042 ?auto_1823045 ) ) ( not ( = ?auto_1823042 ?auto_1823044 ) ) ( not ( = ?auto_1823042 ?auto_1823046 ) ) ( not ( = ?auto_1823042 ?auto_1823047 ) ) ( not ( = ?auto_1823042 ?auto_1823048 ) ) ( not ( = ?auto_1823039 ?auto_1823043 ) ) ( not ( = ?auto_1823039 ?auto_1823045 ) ) ( not ( = ?auto_1823039 ?auto_1823044 ) ) ( not ( = ?auto_1823039 ?auto_1823046 ) ) ( not ( = ?auto_1823039 ?auto_1823047 ) ) ( not ( = ?auto_1823039 ?auto_1823048 ) ) ( not ( = ?auto_1823043 ?auto_1823045 ) ) ( not ( = ?auto_1823043 ?auto_1823044 ) ) ( not ( = ?auto_1823043 ?auto_1823046 ) ) ( not ( = ?auto_1823043 ?auto_1823047 ) ) ( not ( = ?auto_1823043 ?auto_1823048 ) ) ( not ( = ?auto_1823045 ?auto_1823044 ) ) ( not ( = ?auto_1823045 ?auto_1823046 ) ) ( not ( = ?auto_1823045 ?auto_1823047 ) ) ( not ( = ?auto_1823045 ?auto_1823048 ) ) ( not ( = ?auto_1823044 ?auto_1823046 ) ) ( not ( = ?auto_1823044 ?auto_1823047 ) ) ( not ( = ?auto_1823044 ?auto_1823048 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1823046 ?auto_1823047 ?auto_1823048 )
      ( MAKE-9CRATE-VERIFY ?auto_1823040 ?auto_1823041 ?auto_1823042 ?auto_1823039 ?auto_1823043 ?auto_1823045 ?auto_1823044 ?auto_1823046 ?auto_1823047 ?auto_1823048 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1823148 - SURFACE
      ?auto_1823149 - SURFACE
      ?auto_1823150 - SURFACE
      ?auto_1823147 - SURFACE
      ?auto_1823151 - SURFACE
      ?auto_1823153 - SURFACE
      ?auto_1823152 - SURFACE
      ?auto_1823154 - SURFACE
      ?auto_1823155 - SURFACE
      ?auto_1823156 - SURFACE
    )
    :vars
    (
      ?auto_1823160 - HOIST
      ?auto_1823159 - PLACE
      ?auto_1823157 - TRUCK
      ?auto_1823161 - PLACE
      ?auto_1823162 - HOIST
      ?auto_1823158 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1823160 ?auto_1823159 ) ( SURFACE-AT ?auto_1823155 ?auto_1823159 ) ( CLEAR ?auto_1823155 ) ( IS-CRATE ?auto_1823156 ) ( not ( = ?auto_1823155 ?auto_1823156 ) ) ( AVAILABLE ?auto_1823160 ) ( ON ?auto_1823155 ?auto_1823154 ) ( not ( = ?auto_1823154 ?auto_1823155 ) ) ( not ( = ?auto_1823154 ?auto_1823156 ) ) ( TRUCK-AT ?auto_1823157 ?auto_1823161 ) ( not ( = ?auto_1823161 ?auto_1823159 ) ) ( HOIST-AT ?auto_1823162 ?auto_1823161 ) ( not ( = ?auto_1823160 ?auto_1823162 ) ) ( AVAILABLE ?auto_1823162 ) ( SURFACE-AT ?auto_1823156 ?auto_1823161 ) ( ON ?auto_1823156 ?auto_1823158 ) ( CLEAR ?auto_1823156 ) ( not ( = ?auto_1823155 ?auto_1823158 ) ) ( not ( = ?auto_1823156 ?auto_1823158 ) ) ( not ( = ?auto_1823154 ?auto_1823158 ) ) ( ON ?auto_1823149 ?auto_1823148 ) ( ON ?auto_1823150 ?auto_1823149 ) ( ON ?auto_1823147 ?auto_1823150 ) ( ON ?auto_1823151 ?auto_1823147 ) ( ON ?auto_1823153 ?auto_1823151 ) ( ON ?auto_1823152 ?auto_1823153 ) ( ON ?auto_1823154 ?auto_1823152 ) ( not ( = ?auto_1823148 ?auto_1823149 ) ) ( not ( = ?auto_1823148 ?auto_1823150 ) ) ( not ( = ?auto_1823148 ?auto_1823147 ) ) ( not ( = ?auto_1823148 ?auto_1823151 ) ) ( not ( = ?auto_1823148 ?auto_1823153 ) ) ( not ( = ?auto_1823148 ?auto_1823152 ) ) ( not ( = ?auto_1823148 ?auto_1823154 ) ) ( not ( = ?auto_1823148 ?auto_1823155 ) ) ( not ( = ?auto_1823148 ?auto_1823156 ) ) ( not ( = ?auto_1823148 ?auto_1823158 ) ) ( not ( = ?auto_1823149 ?auto_1823150 ) ) ( not ( = ?auto_1823149 ?auto_1823147 ) ) ( not ( = ?auto_1823149 ?auto_1823151 ) ) ( not ( = ?auto_1823149 ?auto_1823153 ) ) ( not ( = ?auto_1823149 ?auto_1823152 ) ) ( not ( = ?auto_1823149 ?auto_1823154 ) ) ( not ( = ?auto_1823149 ?auto_1823155 ) ) ( not ( = ?auto_1823149 ?auto_1823156 ) ) ( not ( = ?auto_1823149 ?auto_1823158 ) ) ( not ( = ?auto_1823150 ?auto_1823147 ) ) ( not ( = ?auto_1823150 ?auto_1823151 ) ) ( not ( = ?auto_1823150 ?auto_1823153 ) ) ( not ( = ?auto_1823150 ?auto_1823152 ) ) ( not ( = ?auto_1823150 ?auto_1823154 ) ) ( not ( = ?auto_1823150 ?auto_1823155 ) ) ( not ( = ?auto_1823150 ?auto_1823156 ) ) ( not ( = ?auto_1823150 ?auto_1823158 ) ) ( not ( = ?auto_1823147 ?auto_1823151 ) ) ( not ( = ?auto_1823147 ?auto_1823153 ) ) ( not ( = ?auto_1823147 ?auto_1823152 ) ) ( not ( = ?auto_1823147 ?auto_1823154 ) ) ( not ( = ?auto_1823147 ?auto_1823155 ) ) ( not ( = ?auto_1823147 ?auto_1823156 ) ) ( not ( = ?auto_1823147 ?auto_1823158 ) ) ( not ( = ?auto_1823151 ?auto_1823153 ) ) ( not ( = ?auto_1823151 ?auto_1823152 ) ) ( not ( = ?auto_1823151 ?auto_1823154 ) ) ( not ( = ?auto_1823151 ?auto_1823155 ) ) ( not ( = ?auto_1823151 ?auto_1823156 ) ) ( not ( = ?auto_1823151 ?auto_1823158 ) ) ( not ( = ?auto_1823153 ?auto_1823152 ) ) ( not ( = ?auto_1823153 ?auto_1823154 ) ) ( not ( = ?auto_1823153 ?auto_1823155 ) ) ( not ( = ?auto_1823153 ?auto_1823156 ) ) ( not ( = ?auto_1823153 ?auto_1823158 ) ) ( not ( = ?auto_1823152 ?auto_1823154 ) ) ( not ( = ?auto_1823152 ?auto_1823155 ) ) ( not ( = ?auto_1823152 ?auto_1823156 ) ) ( not ( = ?auto_1823152 ?auto_1823158 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1823154 ?auto_1823155 ?auto_1823156 )
      ( MAKE-9CRATE-VERIFY ?auto_1823148 ?auto_1823149 ?auto_1823150 ?auto_1823147 ?auto_1823151 ?auto_1823153 ?auto_1823152 ?auto_1823154 ?auto_1823155 ?auto_1823156 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1823257 - SURFACE
      ?auto_1823258 - SURFACE
      ?auto_1823259 - SURFACE
      ?auto_1823256 - SURFACE
      ?auto_1823260 - SURFACE
      ?auto_1823262 - SURFACE
      ?auto_1823261 - SURFACE
      ?auto_1823263 - SURFACE
      ?auto_1823264 - SURFACE
      ?auto_1823265 - SURFACE
    )
    :vars
    (
      ?auto_1823268 - HOIST
      ?auto_1823266 - PLACE
      ?auto_1823271 - PLACE
      ?auto_1823270 - HOIST
      ?auto_1823267 - SURFACE
      ?auto_1823269 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1823268 ?auto_1823266 ) ( SURFACE-AT ?auto_1823264 ?auto_1823266 ) ( CLEAR ?auto_1823264 ) ( IS-CRATE ?auto_1823265 ) ( not ( = ?auto_1823264 ?auto_1823265 ) ) ( AVAILABLE ?auto_1823268 ) ( ON ?auto_1823264 ?auto_1823263 ) ( not ( = ?auto_1823263 ?auto_1823264 ) ) ( not ( = ?auto_1823263 ?auto_1823265 ) ) ( not ( = ?auto_1823271 ?auto_1823266 ) ) ( HOIST-AT ?auto_1823270 ?auto_1823271 ) ( not ( = ?auto_1823268 ?auto_1823270 ) ) ( AVAILABLE ?auto_1823270 ) ( SURFACE-AT ?auto_1823265 ?auto_1823271 ) ( ON ?auto_1823265 ?auto_1823267 ) ( CLEAR ?auto_1823265 ) ( not ( = ?auto_1823264 ?auto_1823267 ) ) ( not ( = ?auto_1823265 ?auto_1823267 ) ) ( not ( = ?auto_1823263 ?auto_1823267 ) ) ( TRUCK-AT ?auto_1823269 ?auto_1823266 ) ( ON ?auto_1823258 ?auto_1823257 ) ( ON ?auto_1823259 ?auto_1823258 ) ( ON ?auto_1823256 ?auto_1823259 ) ( ON ?auto_1823260 ?auto_1823256 ) ( ON ?auto_1823262 ?auto_1823260 ) ( ON ?auto_1823261 ?auto_1823262 ) ( ON ?auto_1823263 ?auto_1823261 ) ( not ( = ?auto_1823257 ?auto_1823258 ) ) ( not ( = ?auto_1823257 ?auto_1823259 ) ) ( not ( = ?auto_1823257 ?auto_1823256 ) ) ( not ( = ?auto_1823257 ?auto_1823260 ) ) ( not ( = ?auto_1823257 ?auto_1823262 ) ) ( not ( = ?auto_1823257 ?auto_1823261 ) ) ( not ( = ?auto_1823257 ?auto_1823263 ) ) ( not ( = ?auto_1823257 ?auto_1823264 ) ) ( not ( = ?auto_1823257 ?auto_1823265 ) ) ( not ( = ?auto_1823257 ?auto_1823267 ) ) ( not ( = ?auto_1823258 ?auto_1823259 ) ) ( not ( = ?auto_1823258 ?auto_1823256 ) ) ( not ( = ?auto_1823258 ?auto_1823260 ) ) ( not ( = ?auto_1823258 ?auto_1823262 ) ) ( not ( = ?auto_1823258 ?auto_1823261 ) ) ( not ( = ?auto_1823258 ?auto_1823263 ) ) ( not ( = ?auto_1823258 ?auto_1823264 ) ) ( not ( = ?auto_1823258 ?auto_1823265 ) ) ( not ( = ?auto_1823258 ?auto_1823267 ) ) ( not ( = ?auto_1823259 ?auto_1823256 ) ) ( not ( = ?auto_1823259 ?auto_1823260 ) ) ( not ( = ?auto_1823259 ?auto_1823262 ) ) ( not ( = ?auto_1823259 ?auto_1823261 ) ) ( not ( = ?auto_1823259 ?auto_1823263 ) ) ( not ( = ?auto_1823259 ?auto_1823264 ) ) ( not ( = ?auto_1823259 ?auto_1823265 ) ) ( not ( = ?auto_1823259 ?auto_1823267 ) ) ( not ( = ?auto_1823256 ?auto_1823260 ) ) ( not ( = ?auto_1823256 ?auto_1823262 ) ) ( not ( = ?auto_1823256 ?auto_1823261 ) ) ( not ( = ?auto_1823256 ?auto_1823263 ) ) ( not ( = ?auto_1823256 ?auto_1823264 ) ) ( not ( = ?auto_1823256 ?auto_1823265 ) ) ( not ( = ?auto_1823256 ?auto_1823267 ) ) ( not ( = ?auto_1823260 ?auto_1823262 ) ) ( not ( = ?auto_1823260 ?auto_1823261 ) ) ( not ( = ?auto_1823260 ?auto_1823263 ) ) ( not ( = ?auto_1823260 ?auto_1823264 ) ) ( not ( = ?auto_1823260 ?auto_1823265 ) ) ( not ( = ?auto_1823260 ?auto_1823267 ) ) ( not ( = ?auto_1823262 ?auto_1823261 ) ) ( not ( = ?auto_1823262 ?auto_1823263 ) ) ( not ( = ?auto_1823262 ?auto_1823264 ) ) ( not ( = ?auto_1823262 ?auto_1823265 ) ) ( not ( = ?auto_1823262 ?auto_1823267 ) ) ( not ( = ?auto_1823261 ?auto_1823263 ) ) ( not ( = ?auto_1823261 ?auto_1823264 ) ) ( not ( = ?auto_1823261 ?auto_1823265 ) ) ( not ( = ?auto_1823261 ?auto_1823267 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1823263 ?auto_1823264 ?auto_1823265 )
      ( MAKE-9CRATE-VERIFY ?auto_1823257 ?auto_1823258 ?auto_1823259 ?auto_1823256 ?auto_1823260 ?auto_1823262 ?auto_1823261 ?auto_1823263 ?auto_1823264 ?auto_1823265 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1823366 - SURFACE
      ?auto_1823367 - SURFACE
      ?auto_1823368 - SURFACE
      ?auto_1823365 - SURFACE
      ?auto_1823369 - SURFACE
      ?auto_1823371 - SURFACE
      ?auto_1823370 - SURFACE
      ?auto_1823372 - SURFACE
      ?auto_1823373 - SURFACE
      ?auto_1823374 - SURFACE
    )
    :vars
    (
      ?auto_1823377 - HOIST
      ?auto_1823380 - PLACE
      ?auto_1823375 - PLACE
      ?auto_1823378 - HOIST
      ?auto_1823376 - SURFACE
      ?auto_1823379 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1823377 ?auto_1823380 ) ( IS-CRATE ?auto_1823374 ) ( not ( = ?auto_1823373 ?auto_1823374 ) ) ( not ( = ?auto_1823372 ?auto_1823373 ) ) ( not ( = ?auto_1823372 ?auto_1823374 ) ) ( not ( = ?auto_1823375 ?auto_1823380 ) ) ( HOIST-AT ?auto_1823378 ?auto_1823375 ) ( not ( = ?auto_1823377 ?auto_1823378 ) ) ( AVAILABLE ?auto_1823378 ) ( SURFACE-AT ?auto_1823374 ?auto_1823375 ) ( ON ?auto_1823374 ?auto_1823376 ) ( CLEAR ?auto_1823374 ) ( not ( = ?auto_1823373 ?auto_1823376 ) ) ( not ( = ?auto_1823374 ?auto_1823376 ) ) ( not ( = ?auto_1823372 ?auto_1823376 ) ) ( TRUCK-AT ?auto_1823379 ?auto_1823380 ) ( SURFACE-AT ?auto_1823372 ?auto_1823380 ) ( CLEAR ?auto_1823372 ) ( LIFTING ?auto_1823377 ?auto_1823373 ) ( IS-CRATE ?auto_1823373 ) ( ON ?auto_1823367 ?auto_1823366 ) ( ON ?auto_1823368 ?auto_1823367 ) ( ON ?auto_1823365 ?auto_1823368 ) ( ON ?auto_1823369 ?auto_1823365 ) ( ON ?auto_1823371 ?auto_1823369 ) ( ON ?auto_1823370 ?auto_1823371 ) ( ON ?auto_1823372 ?auto_1823370 ) ( not ( = ?auto_1823366 ?auto_1823367 ) ) ( not ( = ?auto_1823366 ?auto_1823368 ) ) ( not ( = ?auto_1823366 ?auto_1823365 ) ) ( not ( = ?auto_1823366 ?auto_1823369 ) ) ( not ( = ?auto_1823366 ?auto_1823371 ) ) ( not ( = ?auto_1823366 ?auto_1823370 ) ) ( not ( = ?auto_1823366 ?auto_1823372 ) ) ( not ( = ?auto_1823366 ?auto_1823373 ) ) ( not ( = ?auto_1823366 ?auto_1823374 ) ) ( not ( = ?auto_1823366 ?auto_1823376 ) ) ( not ( = ?auto_1823367 ?auto_1823368 ) ) ( not ( = ?auto_1823367 ?auto_1823365 ) ) ( not ( = ?auto_1823367 ?auto_1823369 ) ) ( not ( = ?auto_1823367 ?auto_1823371 ) ) ( not ( = ?auto_1823367 ?auto_1823370 ) ) ( not ( = ?auto_1823367 ?auto_1823372 ) ) ( not ( = ?auto_1823367 ?auto_1823373 ) ) ( not ( = ?auto_1823367 ?auto_1823374 ) ) ( not ( = ?auto_1823367 ?auto_1823376 ) ) ( not ( = ?auto_1823368 ?auto_1823365 ) ) ( not ( = ?auto_1823368 ?auto_1823369 ) ) ( not ( = ?auto_1823368 ?auto_1823371 ) ) ( not ( = ?auto_1823368 ?auto_1823370 ) ) ( not ( = ?auto_1823368 ?auto_1823372 ) ) ( not ( = ?auto_1823368 ?auto_1823373 ) ) ( not ( = ?auto_1823368 ?auto_1823374 ) ) ( not ( = ?auto_1823368 ?auto_1823376 ) ) ( not ( = ?auto_1823365 ?auto_1823369 ) ) ( not ( = ?auto_1823365 ?auto_1823371 ) ) ( not ( = ?auto_1823365 ?auto_1823370 ) ) ( not ( = ?auto_1823365 ?auto_1823372 ) ) ( not ( = ?auto_1823365 ?auto_1823373 ) ) ( not ( = ?auto_1823365 ?auto_1823374 ) ) ( not ( = ?auto_1823365 ?auto_1823376 ) ) ( not ( = ?auto_1823369 ?auto_1823371 ) ) ( not ( = ?auto_1823369 ?auto_1823370 ) ) ( not ( = ?auto_1823369 ?auto_1823372 ) ) ( not ( = ?auto_1823369 ?auto_1823373 ) ) ( not ( = ?auto_1823369 ?auto_1823374 ) ) ( not ( = ?auto_1823369 ?auto_1823376 ) ) ( not ( = ?auto_1823371 ?auto_1823370 ) ) ( not ( = ?auto_1823371 ?auto_1823372 ) ) ( not ( = ?auto_1823371 ?auto_1823373 ) ) ( not ( = ?auto_1823371 ?auto_1823374 ) ) ( not ( = ?auto_1823371 ?auto_1823376 ) ) ( not ( = ?auto_1823370 ?auto_1823372 ) ) ( not ( = ?auto_1823370 ?auto_1823373 ) ) ( not ( = ?auto_1823370 ?auto_1823374 ) ) ( not ( = ?auto_1823370 ?auto_1823376 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1823372 ?auto_1823373 ?auto_1823374 )
      ( MAKE-9CRATE-VERIFY ?auto_1823366 ?auto_1823367 ?auto_1823368 ?auto_1823365 ?auto_1823369 ?auto_1823371 ?auto_1823370 ?auto_1823372 ?auto_1823373 ?auto_1823374 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1823475 - SURFACE
      ?auto_1823476 - SURFACE
      ?auto_1823477 - SURFACE
      ?auto_1823474 - SURFACE
      ?auto_1823478 - SURFACE
      ?auto_1823480 - SURFACE
      ?auto_1823479 - SURFACE
      ?auto_1823481 - SURFACE
      ?auto_1823482 - SURFACE
      ?auto_1823483 - SURFACE
    )
    :vars
    (
      ?auto_1823489 - HOIST
      ?auto_1823485 - PLACE
      ?auto_1823486 - PLACE
      ?auto_1823488 - HOIST
      ?auto_1823487 - SURFACE
      ?auto_1823484 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1823489 ?auto_1823485 ) ( IS-CRATE ?auto_1823483 ) ( not ( = ?auto_1823482 ?auto_1823483 ) ) ( not ( = ?auto_1823481 ?auto_1823482 ) ) ( not ( = ?auto_1823481 ?auto_1823483 ) ) ( not ( = ?auto_1823486 ?auto_1823485 ) ) ( HOIST-AT ?auto_1823488 ?auto_1823486 ) ( not ( = ?auto_1823489 ?auto_1823488 ) ) ( AVAILABLE ?auto_1823488 ) ( SURFACE-AT ?auto_1823483 ?auto_1823486 ) ( ON ?auto_1823483 ?auto_1823487 ) ( CLEAR ?auto_1823483 ) ( not ( = ?auto_1823482 ?auto_1823487 ) ) ( not ( = ?auto_1823483 ?auto_1823487 ) ) ( not ( = ?auto_1823481 ?auto_1823487 ) ) ( TRUCK-AT ?auto_1823484 ?auto_1823485 ) ( SURFACE-AT ?auto_1823481 ?auto_1823485 ) ( CLEAR ?auto_1823481 ) ( IS-CRATE ?auto_1823482 ) ( AVAILABLE ?auto_1823489 ) ( IN ?auto_1823482 ?auto_1823484 ) ( ON ?auto_1823476 ?auto_1823475 ) ( ON ?auto_1823477 ?auto_1823476 ) ( ON ?auto_1823474 ?auto_1823477 ) ( ON ?auto_1823478 ?auto_1823474 ) ( ON ?auto_1823480 ?auto_1823478 ) ( ON ?auto_1823479 ?auto_1823480 ) ( ON ?auto_1823481 ?auto_1823479 ) ( not ( = ?auto_1823475 ?auto_1823476 ) ) ( not ( = ?auto_1823475 ?auto_1823477 ) ) ( not ( = ?auto_1823475 ?auto_1823474 ) ) ( not ( = ?auto_1823475 ?auto_1823478 ) ) ( not ( = ?auto_1823475 ?auto_1823480 ) ) ( not ( = ?auto_1823475 ?auto_1823479 ) ) ( not ( = ?auto_1823475 ?auto_1823481 ) ) ( not ( = ?auto_1823475 ?auto_1823482 ) ) ( not ( = ?auto_1823475 ?auto_1823483 ) ) ( not ( = ?auto_1823475 ?auto_1823487 ) ) ( not ( = ?auto_1823476 ?auto_1823477 ) ) ( not ( = ?auto_1823476 ?auto_1823474 ) ) ( not ( = ?auto_1823476 ?auto_1823478 ) ) ( not ( = ?auto_1823476 ?auto_1823480 ) ) ( not ( = ?auto_1823476 ?auto_1823479 ) ) ( not ( = ?auto_1823476 ?auto_1823481 ) ) ( not ( = ?auto_1823476 ?auto_1823482 ) ) ( not ( = ?auto_1823476 ?auto_1823483 ) ) ( not ( = ?auto_1823476 ?auto_1823487 ) ) ( not ( = ?auto_1823477 ?auto_1823474 ) ) ( not ( = ?auto_1823477 ?auto_1823478 ) ) ( not ( = ?auto_1823477 ?auto_1823480 ) ) ( not ( = ?auto_1823477 ?auto_1823479 ) ) ( not ( = ?auto_1823477 ?auto_1823481 ) ) ( not ( = ?auto_1823477 ?auto_1823482 ) ) ( not ( = ?auto_1823477 ?auto_1823483 ) ) ( not ( = ?auto_1823477 ?auto_1823487 ) ) ( not ( = ?auto_1823474 ?auto_1823478 ) ) ( not ( = ?auto_1823474 ?auto_1823480 ) ) ( not ( = ?auto_1823474 ?auto_1823479 ) ) ( not ( = ?auto_1823474 ?auto_1823481 ) ) ( not ( = ?auto_1823474 ?auto_1823482 ) ) ( not ( = ?auto_1823474 ?auto_1823483 ) ) ( not ( = ?auto_1823474 ?auto_1823487 ) ) ( not ( = ?auto_1823478 ?auto_1823480 ) ) ( not ( = ?auto_1823478 ?auto_1823479 ) ) ( not ( = ?auto_1823478 ?auto_1823481 ) ) ( not ( = ?auto_1823478 ?auto_1823482 ) ) ( not ( = ?auto_1823478 ?auto_1823483 ) ) ( not ( = ?auto_1823478 ?auto_1823487 ) ) ( not ( = ?auto_1823480 ?auto_1823479 ) ) ( not ( = ?auto_1823480 ?auto_1823481 ) ) ( not ( = ?auto_1823480 ?auto_1823482 ) ) ( not ( = ?auto_1823480 ?auto_1823483 ) ) ( not ( = ?auto_1823480 ?auto_1823487 ) ) ( not ( = ?auto_1823479 ?auto_1823481 ) ) ( not ( = ?auto_1823479 ?auto_1823482 ) ) ( not ( = ?auto_1823479 ?auto_1823483 ) ) ( not ( = ?auto_1823479 ?auto_1823487 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1823481 ?auto_1823482 ?auto_1823483 )
      ( MAKE-9CRATE-VERIFY ?auto_1823475 ?auto_1823476 ?auto_1823477 ?auto_1823474 ?auto_1823478 ?auto_1823480 ?auto_1823479 ?auto_1823481 ?auto_1823482 ?auto_1823483 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1829040 - SURFACE
      ?auto_1829041 - SURFACE
      ?auto_1829042 - SURFACE
      ?auto_1829039 - SURFACE
      ?auto_1829043 - SURFACE
      ?auto_1829045 - SURFACE
      ?auto_1829044 - SURFACE
      ?auto_1829046 - SURFACE
      ?auto_1829047 - SURFACE
      ?auto_1829048 - SURFACE
      ?auto_1829049 - SURFACE
    )
    :vars
    (
      ?auto_1829050 - HOIST
      ?auto_1829051 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1829050 ?auto_1829051 ) ( SURFACE-AT ?auto_1829048 ?auto_1829051 ) ( CLEAR ?auto_1829048 ) ( LIFTING ?auto_1829050 ?auto_1829049 ) ( IS-CRATE ?auto_1829049 ) ( not ( = ?auto_1829048 ?auto_1829049 ) ) ( ON ?auto_1829041 ?auto_1829040 ) ( ON ?auto_1829042 ?auto_1829041 ) ( ON ?auto_1829039 ?auto_1829042 ) ( ON ?auto_1829043 ?auto_1829039 ) ( ON ?auto_1829045 ?auto_1829043 ) ( ON ?auto_1829044 ?auto_1829045 ) ( ON ?auto_1829046 ?auto_1829044 ) ( ON ?auto_1829047 ?auto_1829046 ) ( ON ?auto_1829048 ?auto_1829047 ) ( not ( = ?auto_1829040 ?auto_1829041 ) ) ( not ( = ?auto_1829040 ?auto_1829042 ) ) ( not ( = ?auto_1829040 ?auto_1829039 ) ) ( not ( = ?auto_1829040 ?auto_1829043 ) ) ( not ( = ?auto_1829040 ?auto_1829045 ) ) ( not ( = ?auto_1829040 ?auto_1829044 ) ) ( not ( = ?auto_1829040 ?auto_1829046 ) ) ( not ( = ?auto_1829040 ?auto_1829047 ) ) ( not ( = ?auto_1829040 ?auto_1829048 ) ) ( not ( = ?auto_1829040 ?auto_1829049 ) ) ( not ( = ?auto_1829041 ?auto_1829042 ) ) ( not ( = ?auto_1829041 ?auto_1829039 ) ) ( not ( = ?auto_1829041 ?auto_1829043 ) ) ( not ( = ?auto_1829041 ?auto_1829045 ) ) ( not ( = ?auto_1829041 ?auto_1829044 ) ) ( not ( = ?auto_1829041 ?auto_1829046 ) ) ( not ( = ?auto_1829041 ?auto_1829047 ) ) ( not ( = ?auto_1829041 ?auto_1829048 ) ) ( not ( = ?auto_1829041 ?auto_1829049 ) ) ( not ( = ?auto_1829042 ?auto_1829039 ) ) ( not ( = ?auto_1829042 ?auto_1829043 ) ) ( not ( = ?auto_1829042 ?auto_1829045 ) ) ( not ( = ?auto_1829042 ?auto_1829044 ) ) ( not ( = ?auto_1829042 ?auto_1829046 ) ) ( not ( = ?auto_1829042 ?auto_1829047 ) ) ( not ( = ?auto_1829042 ?auto_1829048 ) ) ( not ( = ?auto_1829042 ?auto_1829049 ) ) ( not ( = ?auto_1829039 ?auto_1829043 ) ) ( not ( = ?auto_1829039 ?auto_1829045 ) ) ( not ( = ?auto_1829039 ?auto_1829044 ) ) ( not ( = ?auto_1829039 ?auto_1829046 ) ) ( not ( = ?auto_1829039 ?auto_1829047 ) ) ( not ( = ?auto_1829039 ?auto_1829048 ) ) ( not ( = ?auto_1829039 ?auto_1829049 ) ) ( not ( = ?auto_1829043 ?auto_1829045 ) ) ( not ( = ?auto_1829043 ?auto_1829044 ) ) ( not ( = ?auto_1829043 ?auto_1829046 ) ) ( not ( = ?auto_1829043 ?auto_1829047 ) ) ( not ( = ?auto_1829043 ?auto_1829048 ) ) ( not ( = ?auto_1829043 ?auto_1829049 ) ) ( not ( = ?auto_1829045 ?auto_1829044 ) ) ( not ( = ?auto_1829045 ?auto_1829046 ) ) ( not ( = ?auto_1829045 ?auto_1829047 ) ) ( not ( = ?auto_1829045 ?auto_1829048 ) ) ( not ( = ?auto_1829045 ?auto_1829049 ) ) ( not ( = ?auto_1829044 ?auto_1829046 ) ) ( not ( = ?auto_1829044 ?auto_1829047 ) ) ( not ( = ?auto_1829044 ?auto_1829048 ) ) ( not ( = ?auto_1829044 ?auto_1829049 ) ) ( not ( = ?auto_1829046 ?auto_1829047 ) ) ( not ( = ?auto_1829046 ?auto_1829048 ) ) ( not ( = ?auto_1829046 ?auto_1829049 ) ) ( not ( = ?auto_1829047 ?auto_1829048 ) ) ( not ( = ?auto_1829047 ?auto_1829049 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1829048 ?auto_1829049 )
      ( MAKE-10CRATE-VERIFY ?auto_1829040 ?auto_1829041 ?auto_1829042 ?auto_1829039 ?auto_1829043 ?auto_1829045 ?auto_1829044 ?auto_1829046 ?auto_1829047 ?auto_1829048 ?auto_1829049 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1829134 - SURFACE
      ?auto_1829135 - SURFACE
      ?auto_1829136 - SURFACE
      ?auto_1829133 - SURFACE
      ?auto_1829137 - SURFACE
      ?auto_1829139 - SURFACE
      ?auto_1829138 - SURFACE
      ?auto_1829140 - SURFACE
      ?auto_1829141 - SURFACE
      ?auto_1829142 - SURFACE
      ?auto_1829143 - SURFACE
    )
    :vars
    (
      ?auto_1829145 - HOIST
      ?auto_1829144 - PLACE
      ?auto_1829146 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1829145 ?auto_1829144 ) ( SURFACE-AT ?auto_1829142 ?auto_1829144 ) ( CLEAR ?auto_1829142 ) ( IS-CRATE ?auto_1829143 ) ( not ( = ?auto_1829142 ?auto_1829143 ) ) ( TRUCK-AT ?auto_1829146 ?auto_1829144 ) ( AVAILABLE ?auto_1829145 ) ( IN ?auto_1829143 ?auto_1829146 ) ( ON ?auto_1829142 ?auto_1829141 ) ( not ( = ?auto_1829141 ?auto_1829142 ) ) ( not ( = ?auto_1829141 ?auto_1829143 ) ) ( ON ?auto_1829135 ?auto_1829134 ) ( ON ?auto_1829136 ?auto_1829135 ) ( ON ?auto_1829133 ?auto_1829136 ) ( ON ?auto_1829137 ?auto_1829133 ) ( ON ?auto_1829139 ?auto_1829137 ) ( ON ?auto_1829138 ?auto_1829139 ) ( ON ?auto_1829140 ?auto_1829138 ) ( ON ?auto_1829141 ?auto_1829140 ) ( not ( = ?auto_1829134 ?auto_1829135 ) ) ( not ( = ?auto_1829134 ?auto_1829136 ) ) ( not ( = ?auto_1829134 ?auto_1829133 ) ) ( not ( = ?auto_1829134 ?auto_1829137 ) ) ( not ( = ?auto_1829134 ?auto_1829139 ) ) ( not ( = ?auto_1829134 ?auto_1829138 ) ) ( not ( = ?auto_1829134 ?auto_1829140 ) ) ( not ( = ?auto_1829134 ?auto_1829141 ) ) ( not ( = ?auto_1829134 ?auto_1829142 ) ) ( not ( = ?auto_1829134 ?auto_1829143 ) ) ( not ( = ?auto_1829135 ?auto_1829136 ) ) ( not ( = ?auto_1829135 ?auto_1829133 ) ) ( not ( = ?auto_1829135 ?auto_1829137 ) ) ( not ( = ?auto_1829135 ?auto_1829139 ) ) ( not ( = ?auto_1829135 ?auto_1829138 ) ) ( not ( = ?auto_1829135 ?auto_1829140 ) ) ( not ( = ?auto_1829135 ?auto_1829141 ) ) ( not ( = ?auto_1829135 ?auto_1829142 ) ) ( not ( = ?auto_1829135 ?auto_1829143 ) ) ( not ( = ?auto_1829136 ?auto_1829133 ) ) ( not ( = ?auto_1829136 ?auto_1829137 ) ) ( not ( = ?auto_1829136 ?auto_1829139 ) ) ( not ( = ?auto_1829136 ?auto_1829138 ) ) ( not ( = ?auto_1829136 ?auto_1829140 ) ) ( not ( = ?auto_1829136 ?auto_1829141 ) ) ( not ( = ?auto_1829136 ?auto_1829142 ) ) ( not ( = ?auto_1829136 ?auto_1829143 ) ) ( not ( = ?auto_1829133 ?auto_1829137 ) ) ( not ( = ?auto_1829133 ?auto_1829139 ) ) ( not ( = ?auto_1829133 ?auto_1829138 ) ) ( not ( = ?auto_1829133 ?auto_1829140 ) ) ( not ( = ?auto_1829133 ?auto_1829141 ) ) ( not ( = ?auto_1829133 ?auto_1829142 ) ) ( not ( = ?auto_1829133 ?auto_1829143 ) ) ( not ( = ?auto_1829137 ?auto_1829139 ) ) ( not ( = ?auto_1829137 ?auto_1829138 ) ) ( not ( = ?auto_1829137 ?auto_1829140 ) ) ( not ( = ?auto_1829137 ?auto_1829141 ) ) ( not ( = ?auto_1829137 ?auto_1829142 ) ) ( not ( = ?auto_1829137 ?auto_1829143 ) ) ( not ( = ?auto_1829139 ?auto_1829138 ) ) ( not ( = ?auto_1829139 ?auto_1829140 ) ) ( not ( = ?auto_1829139 ?auto_1829141 ) ) ( not ( = ?auto_1829139 ?auto_1829142 ) ) ( not ( = ?auto_1829139 ?auto_1829143 ) ) ( not ( = ?auto_1829138 ?auto_1829140 ) ) ( not ( = ?auto_1829138 ?auto_1829141 ) ) ( not ( = ?auto_1829138 ?auto_1829142 ) ) ( not ( = ?auto_1829138 ?auto_1829143 ) ) ( not ( = ?auto_1829140 ?auto_1829141 ) ) ( not ( = ?auto_1829140 ?auto_1829142 ) ) ( not ( = ?auto_1829140 ?auto_1829143 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1829141 ?auto_1829142 ?auto_1829143 )
      ( MAKE-10CRATE-VERIFY ?auto_1829134 ?auto_1829135 ?auto_1829136 ?auto_1829133 ?auto_1829137 ?auto_1829139 ?auto_1829138 ?auto_1829140 ?auto_1829141 ?auto_1829142 ?auto_1829143 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1829239 - SURFACE
      ?auto_1829240 - SURFACE
      ?auto_1829241 - SURFACE
      ?auto_1829238 - SURFACE
      ?auto_1829242 - SURFACE
      ?auto_1829244 - SURFACE
      ?auto_1829243 - SURFACE
      ?auto_1829245 - SURFACE
      ?auto_1829246 - SURFACE
      ?auto_1829247 - SURFACE
      ?auto_1829248 - SURFACE
    )
    :vars
    (
      ?auto_1829249 - HOIST
      ?auto_1829250 - PLACE
      ?auto_1829251 - TRUCK
      ?auto_1829252 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1829249 ?auto_1829250 ) ( SURFACE-AT ?auto_1829247 ?auto_1829250 ) ( CLEAR ?auto_1829247 ) ( IS-CRATE ?auto_1829248 ) ( not ( = ?auto_1829247 ?auto_1829248 ) ) ( AVAILABLE ?auto_1829249 ) ( IN ?auto_1829248 ?auto_1829251 ) ( ON ?auto_1829247 ?auto_1829246 ) ( not ( = ?auto_1829246 ?auto_1829247 ) ) ( not ( = ?auto_1829246 ?auto_1829248 ) ) ( TRUCK-AT ?auto_1829251 ?auto_1829252 ) ( not ( = ?auto_1829252 ?auto_1829250 ) ) ( ON ?auto_1829240 ?auto_1829239 ) ( ON ?auto_1829241 ?auto_1829240 ) ( ON ?auto_1829238 ?auto_1829241 ) ( ON ?auto_1829242 ?auto_1829238 ) ( ON ?auto_1829244 ?auto_1829242 ) ( ON ?auto_1829243 ?auto_1829244 ) ( ON ?auto_1829245 ?auto_1829243 ) ( ON ?auto_1829246 ?auto_1829245 ) ( not ( = ?auto_1829239 ?auto_1829240 ) ) ( not ( = ?auto_1829239 ?auto_1829241 ) ) ( not ( = ?auto_1829239 ?auto_1829238 ) ) ( not ( = ?auto_1829239 ?auto_1829242 ) ) ( not ( = ?auto_1829239 ?auto_1829244 ) ) ( not ( = ?auto_1829239 ?auto_1829243 ) ) ( not ( = ?auto_1829239 ?auto_1829245 ) ) ( not ( = ?auto_1829239 ?auto_1829246 ) ) ( not ( = ?auto_1829239 ?auto_1829247 ) ) ( not ( = ?auto_1829239 ?auto_1829248 ) ) ( not ( = ?auto_1829240 ?auto_1829241 ) ) ( not ( = ?auto_1829240 ?auto_1829238 ) ) ( not ( = ?auto_1829240 ?auto_1829242 ) ) ( not ( = ?auto_1829240 ?auto_1829244 ) ) ( not ( = ?auto_1829240 ?auto_1829243 ) ) ( not ( = ?auto_1829240 ?auto_1829245 ) ) ( not ( = ?auto_1829240 ?auto_1829246 ) ) ( not ( = ?auto_1829240 ?auto_1829247 ) ) ( not ( = ?auto_1829240 ?auto_1829248 ) ) ( not ( = ?auto_1829241 ?auto_1829238 ) ) ( not ( = ?auto_1829241 ?auto_1829242 ) ) ( not ( = ?auto_1829241 ?auto_1829244 ) ) ( not ( = ?auto_1829241 ?auto_1829243 ) ) ( not ( = ?auto_1829241 ?auto_1829245 ) ) ( not ( = ?auto_1829241 ?auto_1829246 ) ) ( not ( = ?auto_1829241 ?auto_1829247 ) ) ( not ( = ?auto_1829241 ?auto_1829248 ) ) ( not ( = ?auto_1829238 ?auto_1829242 ) ) ( not ( = ?auto_1829238 ?auto_1829244 ) ) ( not ( = ?auto_1829238 ?auto_1829243 ) ) ( not ( = ?auto_1829238 ?auto_1829245 ) ) ( not ( = ?auto_1829238 ?auto_1829246 ) ) ( not ( = ?auto_1829238 ?auto_1829247 ) ) ( not ( = ?auto_1829238 ?auto_1829248 ) ) ( not ( = ?auto_1829242 ?auto_1829244 ) ) ( not ( = ?auto_1829242 ?auto_1829243 ) ) ( not ( = ?auto_1829242 ?auto_1829245 ) ) ( not ( = ?auto_1829242 ?auto_1829246 ) ) ( not ( = ?auto_1829242 ?auto_1829247 ) ) ( not ( = ?auto_1829242 ?auto_1829248 ) ) ( not ( = ?auto_1829244 ?auto_1829243 ) ) ( not ( = ?auto_1829244 ?auto_1829245 ) ) ( not ( = ?auto_1829244 ?auto_1829246 ) ) ( not ( = ?auto_1829244 ?auto_1829247 ) ) ( not ( = ?auto_1829244 ?auto_1829248 ) ) ( not ( = ?auto_1829243 ?auto_1829245 ) ) ( not ( = ?auto_1829243 ?auto_1829246 ) ) ( not ( = ?auto_1829243 ?auto_1829247 ) ) ( not ( = ?auto_1829243 ?auto_1829248 ) ) ( not ( = ?auto_1829245 ?auto_1829246 ) ) ( not ( = ?auto_1829245 ?auto_1829247 ) ) ( not ( = ?auto_1829245 ?auto_1829248 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1829246 ?auto_1829247 ?auto_1829248 )
      ( MAKE-10CRATE-VERIFY ?auto_1829239 ?auto_1829240 ?auto_1829241 ?auto_1829238 ?auto_1829242 ?auto_1829244 ?auto_1829243 ?auto_1829245 ?auto_1829246 ?auto_1829247 ?auto_1829248 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1829354 - SURFACE
      ?auto_1829355 - SURFACE
      ?auto_1829356 - SURFACE
      ?auto_1829353 - SURFACE
      ?auto_1829357 - SURFACE
      ?auto_1829359 - SURFACE
      ?auto_1829358 - SURFACE
      ?auto_1829360 - SURFACE
      ?auto_1829361 - SURFACE
      ?auto_1829362 - SURFACE
      ?auto_1829363 - SURFACE
    )
    :vars
    (
      ?auto_1829364 - HOIST
      ?auto_1829365 - PLACE
      ?auto_1829366 - TRUCK
      ?auto_1829367 - PLACE
      ?auto_1829368 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1829364 ?auto_1829365 ) ( SURFACE-AT ?auto_1829362 ?auto_1829365 ) ( CLEAR ?auto_1829362 ) ( IS-CRATE ?auto_1829363 ) ( not ( = ?auto_1829362 ?auto_1829363 ) ) ( AVAILABLE ?auto_1829364 ) ( ON ?auto_1829362 ?auto_1829361 ) ( not ( = ?auto_1829361 ?auto_1829362 ) ) ( not ( = ?auto_1829361 ?auto_1829363 ) ) ( TRUCK-AT ?auto_1829366 ?auto_1829367 ) ( not ( = ?auto_1829367 ?auto_1829365 ) ) ( HOIST-AT ?auto_1829368 ?auto_1829367 ) ( LIFTING ?auto_1829368 ?auto_1829363 ) ( not ( = ?auto_1829364 ?auto_1829368 ) ) ( ON ?auto_1829355 ?auto_1829354 ) ( ON ?auto_1829356 ?auto_1829355 ) ( ON ?auto_1829353 ?auto_1829356 ) ( ON ?auto_1829357 ?auto_1829353 ) ( ON ?auto_1829359 ?auto_1829357 ) ( ON ?auto_1829358 ?auto_1829359 ) ( ON ?auto_1829360 ?auto_1829358 ) ( ON ?auto_1829361 ?auto_1829360 ) ( not ( = ?auto_1829354 ?auto_1829355 ) ) ( not ( = ?auto_1829354 ?auto_1829356 ) ) ( not ( = ?auto_1829354 ?auto_1829353 ) ) ( not ( = ?auto_1829354 ?auto_1829357 ) ) ( not ( = ?auto_1829354 ?auto_1829359 ) ) ( not ( = ?auto_1829354 ?auto_1829358 ) ) ( not ( = ?auto_1829354 ?auto_1829360 ) ) ( not ( = ?auto_1829354 ?auto_1829361 ) ) ( not ( = ?auto_1829354 ?auto_1829362 ) ) ( not ( = ?auto_1829354 ?auto_1829363 ) ) ( not ( = ?auto_1829355 ?auto_1829356 ) ) ( not ( = ?auto_1829355 ?auto_1829353 ) ) ( not ( = ?auto_1829355 ?auto_1829357 ) ) ( not ( = ?auto_1829355 ?auto_1829359 ) ) ( not ( = ?auto_1829355 ?auto_1829358 ) ) ( not ( = ?auto_1829355 ?auto_1829360 ) ) ( not ( = ?auto_1829355 ?auto_1829361 ) ) ( not ( = ?auto_1829355 ?auto_1829362 ) ) ( not ( = ?auto_1829355 ?auto_1829363 ) ) ( not ( = ?auto_1829356 ?auto_1829353 ) ) ( not ( = ?auto_1829356 ?auto_1829357 ) ) ( not ( = ?auto_1829356 ?auto_1829359 ) ) ( not ( = ?auto_1829356 ?auto_1829358 ) ) ( not ( = ?auto_1829356 ?auto_1829360 ) ) ( not ( = ?auto_1829356 ?auto_1829361 ) ) ( not ( = ?auto_1829356 ?auto_1829362 ) ) ( not ( = ?auto_1829356 ?auto_1829363 ) ) ( not ( = ?auto_1829353 ?auto_1829357 ) ) ( not ( = ?auto_1829353 ?auto_1829359 ) ) ( not ( = ?auto_1829353 ?auto_1829358 ) ) ( not ( = ?auto_1829353 ?auto_1829360 ) ) ( not ( = ?auto_1829353 ?auto_1829361 ) ) ( not ( = ?auto_1829353 ?auto_1829362 ) ) ( not ( = ?auto_1829353 ?auto_1829363 ) ) ( not ( = ?auto_1829357 ?auto_1829359 ) ) ( not ( = ?auto_1829357 ?auto_1829358 ) ) ( not ( = ?auto_1829357 ?auto_1829360 ) ) ( not ( = ?auto_1829357 ?auto_1829361 ) ) ( not ( = ?auto_1829357 ?auto_1829362 ) ) ( not ( = ?auto_1829357 ?auto_1829363 ) ) ( not ( = ?auto_1829359 ?auto_1829358 ) ) ( not ( = ?auto_1829359 ?auto_1829360 ) ) ( not ( = ?auto_1829359 ?auto_1829361 ) ) ( not ( = ?auto_1829359 ?auto_1829362 ) ) ( not ( = ?auto_1829359 ?auto_1829363 ) ) ( not ( = ?auto_1829358 ?auto_1829360 ) ) ( not ( = ?auto_1829358 ?auto_1829361 ) ) ( not ( = ?auto_1829358 ?auto_1829362 ) ) ( not ( = ?auto_1829358 ?auto_1829363 ) ) ( not ( = ?auto_1829360 ?auto_1829361 ) ) ( not ( = ?auto_1829360 ?auto_1829362 ) ) ( not ( = ?auto_1829360 ?auto_1829363 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1829361 ?auto_1829362 ?auto_1829363 )
      ( MAKE-10CRATE-VERIFY ?auto_1829354 ?auto_1829355 ?auto_1829356 ?auto_1829353 ?auto_1829357 ?auto_1829359 ?auto_1829358 ?auto_1829360 ?auto_1829361 ?auto_1829362 ?auto_1829363 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1829479 - SURFACE
      ?auto_1829480 - SURFACE
      ?auto_1829481 - SURFACE
      ?auto_1829478 - SURFACE
      ?auto_1829482 - SURFACE
      ?auto_1829484 - SURFACE
      ?auto_1829483 - SURFACE
      ?auto_1829485 - SURFACE
      ?auto_1829486 - SURFACE
      ?auto_1829487 - SURFACE
      ?auto_1829488 - SURFACE
    )
    :vars
    (
      ?auto_1829492 - HOIST
      ?auto_1829491 - PLACE
      ?auto_1829493 - TRUCK
      ?auto_1829490 - PLACE
      ?auto_1829494 - HOIST
      ?auto_1829489 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1829492 ?auto_1829491 ) ( SURFACE-AT ?auto_1829487 ?auto_1829491 ) ( CLEAR ?auto_1829487 ) ( IS-CRATE ?auto_1829488 ) ( not ( = ?auto_1829487 ?auto_1829488 ) ) ( AVAILABLE ?auto_1829492 ) ( ON ?auto_1829487 ?auto_1829486 ) ( not ( = ?auto_1829486 ?auto_1829487 ) ) ( not ( = ?auto_1829486 ?auto_1829488 ) ) ( TRUCK-AT ?auto_1829493 ?auto_1829490 ) ( not ( = ?auto_1829490 ?auto_1829491 ) ) ( HOIST-AT ?auto_1829494 ?auto_1829490 ) ( not ( = ?auto_1829492 ?auto_1829494 ) ) ( AVAILABLE ?auto_1829494 ) ( SURFACE-AT ?auto_1829488 ?auto_1829490 ) ( ON ?auto_1829488 ?auto_1829489 ) ( CLEAR ?auto_1829488 ) ( not ( = ?auto_1829487 ?auto_1829489 ) ) ( not ( = ?auto_1829488 ?auto_1829489 ) ) ( not ( = ?auto_1829486 ?auto_1829489 ) ) ( ON ?auto_1829480 ?auto_1829479 ) ( ON ?auto_1829481 ?auto_1829480 ) ( ON ?auto_1829478 ?auto_1829481 ) ( ON ?auto_1829482 ?auto_1829478 ) ( ON ?auto_1829484 ?auto_1829482 ) ( ON ?auto_1829483 ?auto_1829484 ) ( ON ?auto_1829485 ?auto_1829483 ) ( ON ?auto_1829486 ?auto_1829485 ) ( not ( = ?auto_1829479 ?auto_1829480 ) ) ( not ( = ?auto_1829479 ?auto_1829481 ) ) ( not ( = ?auto_1829479 ?auto_1829478 ) ) ( not ( = ?auto_1829479 ?auto_1829482 ) ) ( not ( = ?auto_1829479 ?auto_1829484 ) ) ( not ( = ?auto_1829479 ?auto_1829483 ) ) ( not ( = ?auto_1829479 ?auto_1829485 ) ) ( not ( = ?auto_1829479 ?auto_1829486 ) ) ( not ( = ?auto_1829479 ?auto_1829487 ) ) ( not ( = ?auto_1829479 ?auto_1829488 ) ) ( not ( = ?auto_1829479 ?auto_1829489 ) ) ( not ( = ?auto_1829480 ?auto_1829481 ) ) ( not ( = ?auto_1829480 ?auto_1829478 ) ) ( not ( = ?auto_1829480 ?auto_1829482 ) ) ( not ( = ?auto_1829480 ?auto_1829484 ) ) ( not ( = ?auto_1829480 ?auto_1829483 ) ) ( not ( = ?auto_1829480 ?auto_1829485 ) ) ( not ( = ?auto_1829480 ?auto_1829486 ) ) ( not ( = ?auto_1829480 ?auto_1829487 ) ) ( not ( = ?auto_1829480 ?auto_1829488 ) ) ( not ( = ?auto_1829480 ?auto_1829489 ) ) ( not ( = ?auto_1829481 ?auto_1829478 ) ) ( not ( = ?auto_1829481 ?auto_1829482 ) ) ( not ( = ?auto_1829481 ?auto_1829484 ) ) ( not ( = ?auto_1829481 ?auto_1829483 ) ) ( not ( = ?auto_1829481 ?auto_1829485 ) ) ( not ( = ?auto_1829481 ?auto_1829486 ) ) ( not ( = ?auto_1829481 ?auto_1829487 ) ) ( not ( = ?auto_1829481 ?auto_1829488 ) ) ( not ( = ?auto_1829481 ?auto_1829489 ) ) ( not ( = ?auto_1829478 ?auto_1829482 ) ) ( not ( = ?auto_1829478 ?auto_1829484 ) ) ( not ( = ?auto_1829478 ?auto_1829483 ) ) ( not ( = ?auto_1829478 ?auto_1829485 ) ) ( not ( = ?auto_1829478 ?auto_1829486 ) ) ( not ( = ?auto_1829478 ?auto_1829487 ) ) ( not ( = ?auto_1829478 ?auto_1829488 ) ) ( not ( = ?auto_1829478 ?auto_1829489 ) ) ( not ( = ?auto_1829482 ?auto_1829484 ) ) ( not ( = ?auto_1829482 ?auto_1829483 ) ) ( not ( = ?auto_1829482 ?auto_1829485 ) ) ( not ( = ?auto_1829482 ?auto_1829486 ) ) ( not ( = ?auto_1829482 ?auto_1829487 ) ) ( not ( = ?auto_1829482 ?auto_1829488 ) ) ( not ( = ?auto_1829482 ?auto_1829489 ) ) ( not ( = ?auto_1829484 ?auto_1829483 ) ) ( not ( = ?auto_1829484 ?auto_1829485 ) ) ( not ( = ?auto_1829484 ?auto_1829486 ) ) ( not ( = ?auto_1829484 ?auto_1829487 ) ) ( not ( = ?auto_1829484 ?auto_1829488 ) ) ( not ( = ?auto_1829484 ?auto_1829489 ) ) ( not ( = ?auto_1829483 ?auto_1829485 ) ) ( not ( = ?auto_1829483 ?auto_1829486 ) ) ( not ( = ?auto_1829483 ?auto_1829487 ) ) ( not ( = ?auto_1829483 ?auto_1829488 ) ) ( not ( = ?auto_1829483 ?auto_1829489 ) ) ( not ( = ?auto_1829485 ?auto_1829486 ) ) ( not ( = ?auto_1829485 ?auto_1829487 ) ) ( not ( = ?auto_1829485 ?auto_1829488 ) ) ( not ( = ?auto_1829485 ?auto_1829489 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1829486 ?auto_1829487 ?auto_1829488 )
      ( MAKE-10CRATE-VERIFY ?auto_1829479 ?auto_1829480 ?auto_1829481 ?auto_1829478 ?auto_1829482 ?auto_1829484 ?auto_1829483 ?auto_1829485 ?auto_1829486 ?auto_1829487 ?auto_1829488 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1829605 - SURFACE
      ?auto_1829606 - SURFACE
      ?auto_1829607 - SURFACE
      ?auto_1829604 - SURFACE
      ?auto_1829608 - SURFACE
      ?auto_1829610 - SURFACE
      ?auto_1829609 - SURFACE
      ?auto_1829611 - SURFACE
      ?auto_1829612 - SURFACE
      ?auto_1829613 - SURFACE
      ?auto_1829614 - SURFACE
    )
    :vars
    (
      ?auto_1829617 - HOIST
      ?auto_1829619 - PLACE
      ?auto_1829616 - PLACE
      ?auto_1829618 - HOIST
      ?auto_1829620 - SURFACE
      ?auto_1829615 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1829617 ?auto_1829619 ) ( SURFACE-AT ?auto_1829613 ?auto_1829619 ) ( CLEAR ?auto_1829613 ) ( IS-CRATE ?auto_1829614 ) ( not ( = ?auto_1829613 ?auto_1829614 ) ) ( AVAILABLE ?auto_1829617 ) ( ON ?auto_1829613 ?auto_1829612 ) ( not ( = ?auto_1829612 ?auto_1829613 ) ) ( not ( = ?auto_1829612 ?auto_1829614 ) ) ( not ( = ?auto_1829616 ?auto_1829619 ) ) ( HOIST-AT ?auto_1829618 ?auto_1829616 ) ( not ( = ?auto_1829617 ?auto_1829618 ) ) ( AVAILABLE ?auto_1829618 ) ( SURFACE-AT ?auto_1829614 ?auto_1829616 ) ( ON ?auto_1829614 ?auto_1829620 ) ( CLEAR ?auto_1829614 ) ( not ( = ?auto_1829613 ?auto_1829620 ) ) ( not ( = ?auto_1829614 ?auto_1829620 ) ) ( not ( = ?auto_1829612 ?auto_1829620 ) ) ( TRUCK-AT ?auto_1829615 ?auto_1829619 ) ( ON ?auto_1829606 ?auto_1829605 ) ( ON ?auto_1829607 ?auto_1829606 ) ( ON ?auto_1829604 ?auto_1829607 ) ( ON ?auto_1829608 ?auto_1829604 ) ( ON ?auto_1829610 ?auto_1829608 ) ( ON ?auto_1829609 ?auto_1829610 ) ( ON ?auto_1829611 ?auto_1829609 ) ( ON ?auto_1829612 ?auto_1829611 ) ( not ( = ?auto_1829605 ?auto_1829606 ) ) ( not ( = ?auto_1829605 ?auto_1829607 ) ) ( not ( = ?auto_1829605 ?auto_1829604 ) ) ( not ( = ?auto_1829605 ?auto_1829608 ) ) ( not ( = ?auto_1829605 ?auto_1829610 ) ) ( not ( = ?auto_1829605 ?auto_1829609 ) ) ( not ( = ?auto_1829605 ?auto_1829611 ) ) ( not ( = ?auto_1829605 ?auto_1829612 ) ) ( not ( = ?auto_1829605 ?auto_1829613 ) ) ( not ( = ?auto_1829605 ?auto_1829614 ) ) ( not ( = ?auto_1829605 ?auto_1829620 ) ) ( not ( = ?auto_1829606 ?auto_1829607 ) ) ( not ( = ?auto_1829606 ?auto_1829604 ) ) ( not ( = ?auto_1829606 ?auto_1829608 ) ) ( not ( = ?auto_1829606 ?auto_1829610 ) ) ( not ( = ?auto_1829606 ?auto_1829609 ) ) ( not ( = ?auto_1829606 ?auto_1829611 ) ) ( not ( = ?auto_1829606 ?auto_1829612 ) ) ( not ( = ?auto_1829606 ?auto_1829613 ) ) ( not ( = ?auto_1829606 ?auto_1829614 ) ) ( not ( = ?auto_1829606 ?auto_1829620 ) ) ( not ( = ?auto_1829607 ?auto_1829604 ) ) ( not ( = ?auto_1829607 ?auto_1829608 ) ) ( not ( = ?auto_1829607 ?auto_1829610 ) ) ( not ( = ?auto_1829607 ?auto_1829609 ) ) ( not ( = ?auto_1829607 ?auto_1829611 ) ) ( not ( = ?auto_1829607 ?auto_1829612 ) ) ( not ( = ?auto_1829607 ?auto_1829613 ) ) ( not ( = ?auto_1829607 ?auto_1829614 ) ) ( not ( = ?auto_1829607 ?auto_1829620 ) ) ( not ( = ?auto_1829604 ?auto_1829608 ) ) ( not ( = ?auto_1829604 ?auto_1829610 ) ) ( not ( = ?auto_1829604 ?auto_1829609 ) ) ( not ( = ?auto_1829604 ?auto_1829611 ) ) ( not ( = ?auto_1829604 ?auto_1829612 ) ) ( not ( = ?auto_1829604 ?auto_1829613 ) ) ( not ( = ?auto_1829604 ?auto_1829614 ) ) ( not ( = ?auto_1829604 ?auto_1829620 ) ) ( not ( = ?auto_1829608 ?auto_1829610 ) ) ( not ( = ?auto_1829608 ?auto_1829609 ) ) ( not ( = ?auto_1829608 ?auto_1829611 ) ) ( not ( = ?auto_1829608 ?auto_1829612 ) ) ( not ( = ?auto_1829608 ?auto_1829613 ) ) ( not ( = ?auto_1829608 ?auto_1829614 ) ) ( not ( = ?auto_1829608 ?auto_1829620 ) ) ( not ( = ?auto_1829610 ?auto_1829609 ) ) ( not ( = ?auto_1829610 ?auto_1829611 ) ) ( not ( = ?auto_1829610 ?auto_1829612 ) ) ( not ( = ?auto_1829610 ?auto_1829613 ) ) ( not ( = ?auto_1829610 ?auto_1829614 ) ) ( not ( = ?auto_1829610 ?auto_1829620 ) ) ( not ( = ?auto_1829609 ?auto_1829611 ) ) ( not ( = ?auto_1829609 ?auto_1829612 ) ) ( not ( = ?auto_1829609 ?auto_1829613 ) ) ( not ( = ?auto_1829609 ?auto_1829614 ) ) ( not ( = ?auto_1829609 ?auto_1829620 ) ) ( not ( = ?auto_1829611 ?auto_1829612 ) ) ( not ( = ?auto_1829611 ?auto_1829613 ) ) ( not ( = ?auto_1829611 ?auto_1829614 ) ) ( not ( = ?auto_1829611 ?auto_1829620 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1829612 ?auto_1829613 ?auto_1829614 )
      ( MAKE-10CRATE-VERIFY ?auto_1829605 ?auto_1829606 ?auto_1829607 ?auto_1829604 ?auto_1829608 ?auto_1829610 ?auto_1829609 ?auto_1829611 ?auto_1829612 ?auto_1829613 ?auto_1829614 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1829731 - SURFACE
      ?auto_1829732 - SURFACE
      ?auto_1829733 - SURFACE
      ?auto_1829730 - SURFACE
      ?auto_1829734 - SURFACE
      ?auto_1829736 - SURFACE
      ?auto_1829735 - SURFACE
      ?auto_1829737 - SURFACE
      ?auto_1829738 - SURFACE
      ?auto_1829739 - SURFACE
      ?auto_1829740 - SURFACE
    )
    :vars
    (
      ?auto_1829746 - HOIST
      ?auto_1829743 - PLACE
      ?auto_1829744 - PLACE
      ?auto_1829741 - HOIST
      ?auto_1829745 - SURFACE
      ?auto_1829742 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1829746 ?auto_1829743 ) ( IS-CRATE ?auto_1829740 ) ( not ( = ?auto_1829739 ?auto_1829740 ) ) ( not ( = ?auto_1829738 ?auto_1829739 ) ) ( not ( = ?auto_1829738 ?auto_1829740 ) ) ( not ( = ?auto_1829744 ?auto_1829743 ) ) ( HOIST-AT ?auto_1829741 ?auto_1829744 ) ( not ( = ?auto_1829746 ?auto_1829741 ) ) ( AVAILABLE ?auto_1829741 ) ( SURFACE-AT ?auto_1829740 ?auto_1829744 ) ( ON ?auto_1829740 ?auto_1829745 ) ( CLEAR ?auto_1829740 ) ( not ( = ?auto_1829739 ?auto_1829745 ) ) ( not ( = ?auto_1829740 ?auto_1829745 ) ) ( not ( = ?auto_1829738 ?auto_1829745 ) ) ( TRUCK-AT ?auto_1829742 ?auto_1829743 ) ( SURFACE-AT ?auto_1829738 ?auto_1829743 ) ( CLEAR ?auto_1829738 ) ( LIFTING ?auto_1829746 ?auto_1829739 ) ( IS-CRATE ?auto_1829739 ) ( ON ?auto_1829732 ?auto_1829731 ) ( ON ?auto_1829733 ?auto_1829732 ) ( ON ?auto_1829730 ?auto_1829733 ) ( ON ?auto_1829734 ?auto_1829730 ) ( ON ?auto_1829736 ?auto_1829734 ) ( ON ?auto_1829735 ?auto_1829736 ) ( ON ?auto_1829737 ?auto_1829735 ) ( ON ?auto_1829738 ?auto_1829737 ) ( not ( = ?auto_1829731 ?auto_1829732 ) ) ( not ( = ?auto_1829731 ?auto_1829733 ) ) ( not ( = ?auto_1829731 ?auto_1829730 ) ) ( not ( = ?auto_1829731 ?auto_1829734 ) ) ( not ( = ?auto_1829731 ?auto_1829736 ) ) ( not ( = ?auto_1829731 ?auto_1829735 ) ) ( not ( = ?auto_1829731 ?auto_1829737 ) ) ( not ( = ?auto_1829731 ?auto_1829738 ) ) ( not ( = ?auto_1829731 ?auto_1829739 ) ) ( not ( = ?auto_1829731 ?auto_1829740 ) ) ( not ( = ?auto_1829731 ?auto_1829745 ) ) ( not ( = ?auto_1829732 ?auto_1829733 ) ) ( not ( = ?auto_1829732 ?auto_1829730 ) ) ( not ( = ?auto_1829732 ?auto_1829734 ) ) ( not ( = ?auto_1829732 ?auto_1829736 ) ) ( not ( = ?auto_1829732 ?auto_1829735 ) ) ( not ( = ?auto_1829732 ?auto_1829737 ) ) ( not ( = ?auto_1829732 ?auto_1829738 ) ) ( not ( = ?auto_1829732 ?auto_1829739 ) ) ( not ( = ?auto_1829732 ?auto_1829740 ) ) ( not ( = ?auto_1829732 ?auto_1829745 ) ) ( not ( = ?auto_1829733 ?auto_1829730 ) ) ( not ( = ?auto_1829733 ?auto_1829734 ) ) ( not ( = ?auto_1829733 ?auto_1829736 ) ) ( not ( = ?auto_1829733 ?auto_1829735 ) ) ( not ( = ?auto_1829733 ?auto_1829737 ) ) ( not ( = ?auto_1829733 ?auto_1829738 ) ) ( not ( = ?auto_1829733 ?auto_1829739 ) ) ( not ( = ?auto_1829733 ?auto_1829740 ) ) ( not ( = ?auto_1829733 ?auto_1829745 ) ) ( not ( = ?auto_1829730 ?auto_1829734 ) ) ( not ( = ?auto_1829730 ?auto_1829736 ) ) ( not ( = ?auto_1829730 ?auto_1829735 ) ) ( not ( = ?auto_1829730 ?auto_1829737 ) ) ( not ( = ?auto_1829730 ?auto_1829738 ) ) ( not ( = ?auto_1829730 ?auto_1829739 ) ) ( not ( = ?auto_1829730 ?auto_1829740 ) ) ( not ( = ?auto_1829730 ?auto_1829745 ) ) ( not ( = ?auto_1829734 ?auto_1829736 ) ) ( not ( = ?auto_1829734 ?auto_1829735 ) ) ( not ( = ?auto_1829734 ?auto_1829737 ) ) ( not ( = ?auto_1829734 ?auto_1829738 ) ) ( not ( = ?auto_1829734 ?auto_1829739 ) ) ( not ( = ?auto_1829734 ?auto_1829740 ) ) ( not ( = ?auto_1829734 ?auto_1829745 ) ) ( not ( = ?auto_1829736 ?auto_1829735 ) ) ( not ( = ?auto_1829736 ?auto_1829737 ) ) ( not ( = ?auto_1829736 ?auto_1829738 ) ) ( not ( = ?auto_1829736 ?auto_1829739 ) ) ( not ( = ?auto_1829736 ?auto_1829740 ) ) ( not ( = ?auto_1829736 ?auto_1829745 ) ) ( not ( = ?auto_1829735 ?auto_1829737 ) ) ( not ( = ?auto_1829735 ?auto_1829738 ) ) ( not ( = ?auto_1829735 ?auto_1829739 ) ) ( not ( = ?auto_1829735 ?auto_1829740 ) ) ( not ( = ?auto_1829735 ?auto_1829745 ) ) ( not ( = ?auto_1829737 ?auto_1829738 ) ) ( not ( = ?auto_1829737 ?auto_1829739 ) ) ( not ( = ?auto_1829737 ?auto_1829740 ) ) ( not ( = ?auto_1829737 ?auto_1829745 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1829738 ?auto_1829739 ?auto_1829740 )
      ( MAKE-10CRATE-VERIFY ?auto_1829731 ?auto_1829732 ?auto_1829733 ?auto_1829730 ?auto_1829734 ?auto_1829736 ?auto_1829735 ?auto_1829737 ?auto_1829738 ?auto_1829739 ?auto_1829740 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1829857 - SURFACE
      ?auto_1829858 - SURFACE
      ?auto_1829859 - SURFACE
      ?auto_1829856 - SURFACE
      ?auto_1829860 - SURFACE
      ?auto_1829862 - SURFACE
      ?auto_1829861 - SURFACE
      ?auto_1829863 - SURFACE
      ?auto_1829864 - SURFACE
      ?auto_1829865 - SURFACE
      ?auto_1829866 - SURFACE
    )
    :vars
    (
      ?auto_1829867 - HOIST
      ?auto_1829868 - PLACE
      ?auto_1829870 - PLACE
      ?auto_1829869 - HOIST
      ?auto_1829871 - SURFACE
      ?auto_1829872 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1829867 ?auto_1829868 ) ( IS-CRATE ?auto_1829866 ) ( not ( = ?auto_1829865 ?auto_1829866 ) ) ( not ( = ?auto_1829864 ?auto_1829865 ) ) ( not ( = ?auto_1829864 ?auto_1829866 ) ) ( not ( = ?auto_1829870 ?auto_1829868 ) ) ( HOIST-AT ?auto_1829869 ?auto_1829870 ) ( not ( = ?auto_1829867 ?auto_1829869 ) ) ( AVAILABLE ?auto_1829869 ) ( SURFACE-AT ?auto_1829866 ?auto_1829870 ) ( ON ?auto_1829866 ?auto_1829871 ) ( CLEAR ?auto_1829866 ) ( not ( = ?auto_1829865 ?auto_1829871 ) ) ( not ( = ?auto_1829866 ?auto_1829871 ) ) ( not ( = ?auto_1829864 ?auto_1829871 ) ) ( TRUCK-AT ?auto_1829872 ?auto_1829868 ) ( SURFACE-AT ?auto_1829864 ?auto_1829868 ) ( CLEAR ?auto_1829864 ) ( IS-CRATE ?auto_1829865 ) ( AVAILABLE ?auto_1829867 ) ( IN ?auto_1829865 ?auto_1829872 ) ( ON ?auto_1829858 ?auto_1829857 ) ( ON ?auto_1829859 ?auto_1829858 ) ( ON ?auto_1829856 ?auto_1829859 ) ( ON ?auto_1829860 ?auto_1829856 ) ( ON ?auto_1829862 ?auto_1829860 ) ( ON ?auto_1829861 ?auto_1829862 ) ( ON ?auto_1829863 ?auto_1829861 ) ( ON ?auto_1829864 ?auto_1829863 ) ( not ( = ?auto_1829857 ?auto_1829858 ) ) ( not ( = ?auto_1829857 ?auto_1829859 ) ) ( not ( = ?auto_1829857 ?auto_1829856 ) ) ( not ( = ?auto_1829857 ?auto_1829860 ) ) ( not ( = ?auto_1829857 ?auto_1829862 ) ) ( not ( = ?auto_1829857 ?auto_1829861 ) ) ( not ( = ?auto_1829857 ?auto_1829863 ) ) ( not ( = ?auto_1829857 ?auto_1829864 ) ) ( not ( = ?auto_1829857 ?auto_1829865 ) ) ( not ( = ?auto_1829857 ?auto_1829866 ) ) ( not ( = ?auto_1829857 ?auto_1829871 ) ) ( not ( = ?auto_1829858 ?auto_1829859 ) ) ( not ( = ?auto_1829858 ?auto_1829856 ) ) ( not ( = ?auto_1829858 ?auto_1829860 ) ) ( not ( = ?auto_1829858 ?auto_1829862 ) ) ( not ( = ?auto_1829858 ?auto_1829861 ) ) ( not ( = ?auto_1829858 ?auto_1829863 ) ) ( not ( = ?auto_1829858 ?auto_1829864 ) ) ( not ( = ?auto_1829858 ?auto_1829865 ) ) ( not ( = ?auto_1829858 ?auto_1829866 ) ) ( not ( = ?auto_1829858 ?auto_1829871 ) ) ( not ( = ?auto_1829859 ?auto_1829856 ) ) ( not ( = ?auto_1829859 ?auto_1829860 ) ) ( not ( = ?auto_1829859 ?auto_1829862 ) ) ( not ( = ?auto_1829859 ?auto_1829861 ) ) ( not ( = ?auto_1829859 ?auto_1829863 ) ) ( not ( = ?auto_1829859 ?auto_1829864 ) ) ( not ( = ?auto_1829859 ?auto_1829865 ) ) ( not ( = ?auto_1829859 ?auto_1829866 ) ) ( not ( = ?auto_1829859 ?auto_1829871 ) ) ( not ( = ?auto_1829856 ?auto_1829860 ) ) ( not ( = ?auto_1829856 ?auto_1829862 ) ) ( not ( = ?auto_1829856 ?auto_1829861 ) ) ( not ( = ?auto_1829856 ?auto_1829863 ) ) ( not ( = ?auto_1829856 ?auto_1829864 ) ) ( not ( = ?auto_1829856 ?auto_1829865 ) ) ( not ( = ?auto_1829856 ?auto_1829866 ) ) ( not ( = ?auto_1829856 ?auto_1829871 ) ) ( not ( = ?auto_1829860 ?auto_1829862 ) ) ( not ( = ?auto_1829860 ?auto_1829861 ) ) ( not ( = ?auto_1829860 ?auto_1829863 ) ) ( not ( = ?auto_1829860 ?auto_1829864 ) ) ( not ( = ?auto_1829860 ?auto_1829865 ) ) ( not ( = ?auto_1829860 ?auto_1829866 ) ) ( not ( = ?auto_1829860 ?auto_1829871 ) ) ( not ( = ?auto_1829862 ?auto_1829861 ) ) ( not ( = ?auto_1829862 ?auto_1829863 ) ) ( not ( = ?auto_1829862 ?auto_1829864 ) ) ( not ( = ?auto_1829862 ?auto_1829865 ) ) ( not ( = ?auto_1829862 ?auto_1829866 ) ) ( not ( = ?auto_1829862 ?auto_1829871 ) ) ( not ( = ?auto_1829861 ?auto_1829863 ) ) ( not ( = ?auto_1829861 ?auto_1829864 ) ) ( not ( = ?auto_1829861 ?auto_1829865 ) ) ( not ( = ?auto_1829861 ?auto_1829866 ) ) ( not ( = ?auto_1829861 ?auto_1829871 ) ) ( not ( = ?auto_1829863 ?auto_1829864 ) ) ( not ( = ?auto_1829863 ?auto_1829865 ) ) ( not ( = ?auto_1829863 ?auto_1829866 ) ) ( not ( = ?auto_1829863 ?auto_1829871 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1829864 ?auto_1829865 ?auto_1829866 )
      ( MAKE-10CRATE-VERIFY ?auto_1829857 ?auto_1829858 ?auto_1829859 ?auto_1829856 ?auto_1829860 ?auto_1829862 ?auto_1829861 ?auto_1829863 ?auto_1829864 ?auto_1829865 ?auto_1829866 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1837141 - SURFACE
      ?auto_1837142 - SURFACE
      ?auto_1837143 - SURFACE
      ?auto_1837140 - SURFACE
      ?auto_1837144 - SURFACE
      ?auto_1837146 - SURFACE
      ?auto_1837145 - SURFACE
      ?auto_1837147 - SURFACE
      ?auto_1837148 - SURFACE
      ?auto_1837149 - SURFACE
      ?auto_1837150 - SURFACE
      ?auto_1837151 - SURFACE
    )
    :vars
    (
      ?auto_1837152 - HOIST
      ?auto_1837153 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1837152 ?auto_1837153 ) ( SURFACE-AT ?auto_1837150 ?auto_1837153 ) ( CLEAR ?auto_1837150 ) ( LIFTING ?auto_1837152 ?auto_1837151 ) ( IS-CRATE ?auto_1837151 ) ( not ( = ?auto_1837150 ?auto_1837151 ) ) ( ON ?auto_1837142 ?auto_1837141 ) ( ON ?auto_1837143 ?auto_1837142 ) ( ON ?auto_1837140 ?auto_1837143 ) ( ON ?auto_1837144 ?auto_1837140 ) ( ON ?auto_1837146 ?auto_1837144 ) ( ON ?auto_1837145 ?auto_1837146 ) ( ON ?auto_1837147 ?auto_1837145 ) ( ON ?auto_1837148 ?auto_1837147 ) ( ON ?auto_1837149 ?auto_1837148 ) ( ON ?auto_1837150 ?auto_1837149 ) ( not ( = ?auto_1837141 ?auto_1837142 ) ) ( not ( = ?auto_1837141 ?auto_1837143 ) ) ( not ( = ?auto_1837141 ?auto_1837140 ) ) ( not ( = ?auto_1837141 ?auto_1837144 ) ) ( not ( = ?auto_1837141 ?auto_1837146 ) ) ( not ( = ?auto_1837141 ?auto_1837145 ) ) ( not ( = ?auto_1837141 ?auto_1837147 ) ) ( not ( = ?auto_1837141 ?auto_1837148 ) ) ( not ( = ?auto_1837141 ?auto_1837149 ) ) ( not ( = ?auto_1837141 ?auto_1837150 ) ) ( not ( = ?auto_1837141 ?auto_1837151 ) ) ( not ( = ?auto_1837142 ?auto_1837143 ) ) ( not ( = ?auto_1837142 ?auto_1837140 ) ) ( not ( = ?auto_1837142 ?auto_1837144 ) ) ( not ( = ?auto_1837142 ?auto_1837146 ) ) ( not ( = ?auto_1837142 ?auto_1837145 ) ) ( not ( = ?auto_1837142 ?auto_1837147 ) ) ( not ( = ?auto_1837142 ?auto_1837148 ) ) ( not ( = ?auto_1837142 ?auto_1837149 ) ) ( not ( = ?auto_1837142 ?auto_1837150 ) ) ( not ( = ?auto_1837142 ?auto_1837151 ) ) ( not ( = ?auto_1837143 ?auto_1837140 ) ) ( not ( = ?auto_1837143 ?auto_1837144 ) ) ( not ( = ?auto_1837143 ?auto_1837146 ) ) ( not ( = ?auto_1837143 ?auto_1837145 ) ) ( not ( = ?auto_1837143 ?auto_1837147 ) ) ( not ( = ?auto_1837143 ?auto_1837148 ) ) ( not ( = ?auto_1837143 ?auto_1837149 ) ) ( not ( = ?auto_1837143 ?auto_1837150 ) ) ( not ( = ?auto_1837143 ?auto_1837151 ) ) ( not ( = ?auto_1837140 ?auto_1837144 ) ) ( not ( = ?auto_1837140 ?auto_1837146 ) ) ( not ( = ?auto_1837140 ?auto_1837145 ) ) ( not ( = ?auto_1837140 ?auto_1837147 ) ) ( not ( = ?auto_1837140 ?auto_1837148 ) ) ( not ( = ?auto_1837140 ?auto_1837149 ) ) ( not ( = ?auto_1837140 ?auto_1837150 ) ) ( not ( = ?auto_1837140 ?auto_1837151 ) ) ( not ( = ?auto_1837144 ?auto_1837146 ) ) ( not ( = ?auto_1837144 ?auto_1837145 ) ) ( not ( = ?auto_1837144 ?auto_1837147 ) ) ( not ( = ?auto_1837144 ?auto_1837148 ) ) ( not ( = ?auto_1837144 ?auto_1837149 ) ) ( not ( = ?auto_1837144 ?auto_1837150 ) ) ( not ( = ?auto_1837144 ?auto_1837151 ) ) ( not ( = ?auto_1837146 ?auto_1837145 ) ) ( not ( = ?auto_1837146 ?auto_1837147 ) ) ( not ( = ?auto_1837146 ?auto_1837148 ) ) ( not ( = ?auto_1837146 ?auto_1837149 ) ) ( not ( = ?auto_1837146 ?auto_1837150 ) ) ( not ( = ?auto_1837146 ?auto_1837151 ) ) ( not ( = ?auto_1837145 ?auto_1837147 ) ) ( not ( = ?auto_1837145 ?auto_1837148 ) ) ( not ( = ?auto_1837145 ?auto_1837149 ) ) ( not ( = ?auto_1837145 ?auto_1837150 ) ) ( not ( = ?auto_1837145 ?auto_1837151 ) ) ( not ( = ?auto_1837147 ?auto_1837148 ) ) ( not ( = ?auto_1837147 ?auto_1837149 ) ) ( not ( = ?auto_1837147 ?auto_1837150 ) ) ( not ( = ?auto_1837147 ?auto_1837151 ) ) ( not ( = ?auto_1837148 ?auto_1837149 ) ) ( not ( = ?auto_1837148 ?auto_1837150 ) ) ( not ( = ?auto_1837148 ?auto_1837151 ) ) ( not ( = ?auto_1837149 ?auto_1837150 ) ) ( not ( = ?auto_1837149 ?auto_1837151 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1837150 ?auto_1837151 )
      ( MAKE-11CRATE-VERIFY ?auto_1837141 ?auto_1837142 ?auto_1837143 ?auto_1837140 ?auto_1837144 ?auto_1837146 ?auto_1837145 ?auto_1837147 ?auto_1837148 ?auto_1837149 ?auto_1837150 ?auto_1837151 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1837250 - SURFACE
      ?auto_1837251 - SURFACE
      ?auto_1837252 - SURFACE
      ?auto_1837249 - SURFACE
      ?auto_1837253 - SURFACE
      ?auto_1837255 - SURFACE
      ?auto_1837254 - SURFACE
      ?auto_1837256 - SURFACE
      ?auto_1837257 - SURFACE
      ?auto_1837258 - SURFACE
      ?auto_1837259 - SURFACE
      ?auto_1837260 - SURFACE
    )
    :vars
    (
      ?auto_1837261 - HOIST
      ?auto_1837262 - PLACE
      ?auto_1837263 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1837261 ?auto_1837262 ) ( SURFACE-AT ?auto_1837259 ?auto_1837262 ) ( CLEAR ?auto_1837259 ) ( IS-CRATE ?auto_1837260 ) ( not ( = ?auto_1837259 ?auto_1837260 ) ) ( TRUCK-AT ?auto_1837263 ?auto_1837262 ) ( AVAILABLE ?auto_1837261 ) ( IN ?auto_1837260 ?auto_1837263 ) ( ON ?auto_1837259 ?auto_1837258 ) ( not ( = ?auto_1837258 ?auto_1837259 ) ) ( not ( = ?auto_1837258 ?auto_1837260 ) ) ( ON ?auto_1837251 ?auto_1837250 ) ( ON ?auto_1837252 ?auto_1837251 ) ( ON ?auto_1837249 ?auto_1837252 ) ( ON ?auto_1837253 ?auto_1837249 ) ( ON ?auto_1837255 ?auto_1837253 ) ( ON ?auto_1837254 ?auto_1837255 ) ( ON ?auto_1837256 ?auto_1837254 ) ( ON ?auto_1837257 ?auto_1837256 ) ( ON ?auto_1837258 ?auto_1837257 ) ( not ( = ?auto_1837250 ?auto_1837251 ) ) ( not ( = ?auto_1837250 ?auto_1837252 ) ) ( not ( = ?auto_1837250 ?auto_1837249 ) ) ( not ( = ?auto_1837250 ?auto_1837253 ) ) ( not ( = ?auto_1837250 ?auto_1837255 ) ) ( not ( = ?auto_1837250 ?auto_1837254 ) ) ( not ( = ?auto_1837250 ?auto_1837256 ) ) ( not ( = ?auto_1837250 ?auto_1837257 ) ) ( not ( = ?auto_1837250 ?auto_1837258 ) ) ( not ( = ?auto_1837250 ?auto_1837259 ) ) ( not ( = ?auto_1837250 ?auto_1837260 ) ) ( not ( = ?auto_1837251 ?auto_1837252 ) ) ( not ( = ?auto_1837251 ?auto_1837249 ) ) ( not ( = ?auto_1837251 ?auto_1837253 ) ) ( not ( = ?auto_1837251 ?auto_1837255 ) ) ( not ( = ?auto_1837251 ?auto_1837254 ) ) ( not ( = ?auto_1837251 ?auto_1837256 ) ) ( not ( = ?auto_1837251 ?auto_1837257 ) ) ( not ( = ?auto_1837251 ?auto_1837258 ) ) ( not ( = ?auto_1837251 ?auto_1837259 ) ) ( not ( = ?auto_1837251 ?auto_1837260 ) ) ( not ( = ?auto_1837252 ?auto_1837249 ) ) ( not ( = ?auto_1837252 ?auto_1837253 ) ) ( not ( = ?auto_1837252 ?auto_1837255 ) ) ( not ( = ?auto_1837252 ?auto_1837254 ) ) ( not ( = ?auto_1837252 ?auto_1837256 ) ) ( not ( = ?auto_1837252 ?auto_1837257 ) ) ( not ( = ?auto_1837252 ?auto_1837258 ) ) ( not ( = ?auto_1837252 ?auto_1837259 ) ) ( not ( = ?auto_1837252 ?auto_1837260 ) ) ( not ( = ?auto_1837249 ?auto_1837253 ) ) ( not ( = ?auto_1837249 ?auto_1837255 ) ) ( not ( = ?auto_1837249 ?auto_1837254 ) ) ( not ( = ?auto_1837249 ?auto_1837256 ) ) ( not ( = ?auto_1837249 ?auto_1837257 ) ) ( not ( = ?auto_1837249 ?auto_1837258 ) ) ( not ( = ?auto_1837249 ?auto_1837259 ) ) ( not ( = ?auto_1837249 ?auto_1837260 ) ) ( not ( = ?auto_1837253 ?auto_1837255 ) ) ( not ( = ?auto_1837253 ?auto_1837254 ) ) ( not ( = ?auto_1837253 ?auto_1837256 ) ) ( not ( = ?auto_1837253 ?auto_1837257 ) ) ( not ( = ?auto_1837253 ?auto_1837258 ) ) ( not ( = ?auto_1837253 ?auto_1837259 ) ) ( not ( = ?auto_1837253 ?auto_1837260 ) ) ( not ( = ?auto_1837255 ?auto_1837254 ) ) ( not ( = ?auto_1837255 ?auto_1837256 ) ) ( not ( = ?auto_1837255 ?auto_1837257 ) ) ( not ( = ?auto_1837255 ?auto_1837258 ) ) ( not ( = ?auto_1837255 ?auto_1837259 ) ) ( not ( = ?auto_1837255 ?auto_1837260 ) ) ( not ( = ?auto_1837254 ?auto_1837256 ) ) ( not ( = ?auto_1837254 ?auto_1837257 ) ) ( not ( = ?auto_1837254 ?auto_1837258 ) ) ( not ( = ?auto_1837254 ?auto_1837259 ) ) ( not ( = ?auto_1837254 ?auto_1837260 ) ) ( not ( = ?auto_1837256 ?auto_1837257 ) ) ( not ( = ?auto_1837256 ?auto_1837258 ) ) ( not ( = ?auto_1837256 ?auto_1837259 ) ) ( not ( = ?auto_1837256 ?auto_1837260 ) ) ( not ( = ?auto_1837257 ?auto_1837258 ) ) ( not ( = ?auto_1837257 ?auto_1837259 ) ) ( not ( = ?auto_1837257 ?auto_1837260 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1837258 ?auto_1837259 ?auto_1837260 )
      ( MAKE-11CRATE-VERIFY ?auto_1837250 ?auto_1837251 ?auto_1837252 ?auto_1837249 ?auto_1837253 ?auto_1837255 ?auto_1837254 ?auto_1837256 ?auto_1837257 ?auto_1837258 ?auto_1837259 ?auto_1837260 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1837371 - SURFACE
      ?auto_1837372 - SURFACE
      ?auto_1837373 - SURFACE
      ?auto_1837370 - SURFACE
      ?auto_1837374 - SURFACE
      ?auto_1837376 - SURFACE
      ?auto_1837375 - SURFACE
      ?auto_1837377 - SURFACE
      ?auto_1837378 - SURFACE
      ?auto_1837379 - SURFACE
      ?auto_1837380 - SURFACE
      ?auto_1837381 - SURFACE
    )
    :vars
    (
      ?auto_1837384 - HOIST
      ?auto_1837383 - PLACE
      ?auto_1837385 - TRUCK
      ?auto_1837382 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1837384 ?auto_1837383 ) ( SURFACE-AT ?auto_1837380 ?auto_1837383 ) ( CLEAR ?auto_1837380 ) ( IS-CRATE ?auto_1837381 ) ( not ( = ?auto_1837380 ?auto_1837381 ) ) ( AVAILABLE ?auto_1837384 ) ( IN ?auto_1837381 ?auto_1837385 ) ( ON ?auto_1837380 ?auto_1837379 ) ( not ( = ?auto_1837379 ?auto_1837380 ) ) ( not ( = ?auto_1837379 ?auto_1837381 ) ) ( TRUCK-AT ?auto_1837385 ?auto_1837382 ) ( not ( = ?auto_1837382 ?auto_1837383 ) ) ( ON ?auto_1837372 ?auto_1837371 ) ( ON ?auto_1837373 ?auto_1837372 ) ( ON ?auto_1837370 ?auto_1837373 ) ( ON ?auto_1837374 ?auto_1837370 ) ( ON ?auto_1837376 ?auto_1837374 ) ( ON ?auto_1837375 ?auto_1837376 ) ( ON ?auto_1837377 ?auto_1837375 ) ( ON ?auto_1837378 ?auto_1837377 ) ( ON ?auto_1837379 ?auto_1837378 ) ( not ( = ?auto_1837371 ?auto_1837372 ) ) ( not ( = ?auto_1837371 ?auto_1837373 ) ) ( not ( = ?auto_1837371 ?auto_1837370 ) ) ( not ( = ?auto_1837371 ?auto_1837374 ) ) ( not ( = ?auto_1837371 ?auto_1837376 ) ) ( not ( = ?auto_1837371 ?auto_1837375 ) ) ( not ( = ?auto_1837371 ?auto_1837377 ) ) ( not ( = ?auto_1837371 ?auto_1837378 ) ) ( not ( = ?auto_1837371 ?auto_1837379 ) ) ( not ( = ?auto_1837371 ?auto_1837380 ) ) ( not ( = ?auto_1837371 ?auto_1837381 ) ) ( not ( = ?auto_1837372 ?auto_1837373 ) ) ( not ( = ?auto_1837372 ?auto_1837370 ) ) ( not ( = ?auto_1837372 ?auto_1837374 ) ) ( not ( = ?auto_1837372 ?auto_1837376 ) ) ( not ( = ?auto_1837372 ?auto_1837375 ) ) ( not ( = ?auto_1837372 ?auto_1837377 ) ) ( not ( = ?auto_1837372 ?auto_1837378 ) ) ( not ( = ?auto_1837372 ?auto_1837379 ) ) ( not ( = ?auto_1837372 ?auto_1837380 ) ) ( not ( = ?auto_1837372 ?auto_1837381 ) ) ( not ( = ?auto_1837373 ?auto_1837370 ) ) ( not ( = ?auto_1837373 ?auto_1837374 ) ) ( not ( = ?auto_1837373 ?auto_1837376 ) ) ( not ( = ?auto_1837373 ?auto_1837375 ) ) ( not ( = ?auto_1837373 ?auto_1837377 ) ) ( not ( = ?auto_1837373 ?auto_1837378 ) ) ( not ( = ?auto_1837373 ?auto_1837379 ) ) ( not ( = ?auto_1837373 ?auto_1837380 ) ) ( not ( = ?auto_1837373 ?auto_1837381 ) ) ( not ( = ?auto_1837370 ?auto_1837374 ) ) ( not ( = ?auto_1837370 ?auto_1837376 ) ) ( not ( = ?auto_1837370 ?auto_1837375 ) ) ( not ( = ?auto_1837370 ?auto_1837377 ) ) ( not ( = ?auto_1837370 ?auto_1837378 ) ) ( not ( = ?auto_1837370 ?auto_1837379 ) ) ( not ( = ?auto_1837370 ?auto_1837380 ) ) ( not ( = ?auto_1837370 ?auto_1837381 ) ) ( not ( = ?auto_1837374 ?auto_1837376 ) ) ( not ( = ?auto_1837374 ?auto_1837375 ) ) ( not ( = ?auto_1837374 ?auto_1837377 ) ) ( not ( = ?auto_1837374 ?auto_1837378 ) ) ( not ( = ?auto_1837374 ?auto_1837379 ) ) ( not ( = ?auto_1837374 ?auto_1837380 ) ) ( not ( = ?auto_1837374 ?auto_1837381 ) ) ( not ( = ?auto_1837376 ?auto_1837375 ) ) ( not ( = ?auto_1837376 ?auto_1837377 ) ) ( not ( = ?auto_1837376 ?auto_1837378 ) ) ( not ( = ?auto_1837376 ?auto_1837379 ) ) ( not ( = ?auto_1837376 ?auto_1837380 ) ) ( not ( = ?auto_1837376 ?auto_1837381 ) ) ( not ( = ?auto_1837375 ?auto_1837377 ) ) ( not ( = ?auto_1837375 ?auto_1837378 ) ) ( not ( = ?auto_1837375 ?auto_1837379 ) ) ( not ( = ?auto_1837375 ?auto_1837380 ) ) ( not ( = ?auto_1837375 ?auto_1837381 ) ) ( not ( = ?auto_1837377 ?auto_1837378 ) ) ( not ( = ?auto_1837377 ?auto_1837379 ) ) ( not ( = ?auto_1837377 ?auto_1837380 ) ) ( not ( = ?auto_1837377 ?auto_1837381 ) ) ( not ( = ?auto_1837378 ?auto_1837379 ) ) ( not ( = ?auto_1837378 ?auto_1837380 ) ) ( not ( = ?auto_1837378 ?auto_1837381 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1837379 ?auto_1837380 ?auto_1837381 )
      ( MAKE-11CRATE-VERIFY ?auto_1837371 ?auto_1837372 ?auto_1837373 ?auto_1837370 ?auto_1837374 ?auto_1837376 ?auto_1837375 ?auto_1837377 ?auto_1837378 ?auto_1837379 ?auto_1837380 ?auto_1837381 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1837503 - SURFACE
      ?auto_1837504 - SURFACE
      ?auto_1837505 - SURFACE
      ?auto_1837502 - SURFACE
      ?auto_1837506 - SURFACE
      ?auto_1837508 - SURFACE
      ?auto_1837507 - SURFACE
      ?auto_1837509 - SURFACE
      ?auto_1837510 - SURFACE
      ?auto_1837511 - SURFACE
      ?auto_1837512 - SURFACE
      ?auto_1837513 - SURFACE
    )
    :vars
    (
      ?auto_1837517 - HOIST
      ?auto_1837514 - PLACE
      ?auto_1837515 - TRUCK
      ?auto_1837518 - PLACE
      ?auto_1837516 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1837517 ?auto_1837514 ) ( SURFACE-AT ?auto_1837512 ?auto_1837514 ) ( CLEAR ?auto_1837512 ) ( IS-CRATE ?auto_1837513 ) ( not ( = ?auto_1837512 ?auto_1837513 ) ) ( AVAILABLE ?auto_1837517 ) ( ON ?auto_1837512 ?auto_1837511 ) ( not ( = ?auto_1837511 ?auto_1837512 ) ) ( not ( = ?auto_1837511 ?auto_1837513 ) ) ( TRUCK-AT ?auto_1837515 ?auto_1837518 ) ( not ( = ?auto_1837518 ?auto_1837514 ) ) ( HOIST-AT ?auto_1837516 ?auto_1837518 ) ( LIFTING ?auto_1837516 ?auto_1837513 ) ( not ( = ?auto_1837517 ?auto_1837516 ) ) ( ON ?auto_1837504 ?auto_1837503 ) ( ON ?auto_1837505 ?auto_1837504 ) ( ON ?auto_1837502 ?auto_1837505 ) ( ON ?auto_1837506 ?auto_1837502 ) ( ON ?auto_1837508 ?auto_1837506 ) ( ON ?auto_1837507 ?auto_1837508 ) ( ON ?auto_1837509 ?auto_1837507 ) ( ON ?auto_1837510 ?auto_1837509 ) ( ON ?auto_1837511 ?auto_1837510 ) ( not ( = ?auto_1837503 ?auto_1837504 ) ) ( not ( = ?auto_1837503 ?auto_1837505 ) ) ( not ( = ?auto_1837503 ?auto_1837502 ) ) ( not ( = ?auto_1837503 ?auto_1837506 ) ) ( not ( = ?auto_1837503 ?auto_1837508 ) ) ( not ( = ?auto_1837503 ?auto_1837507 ) ) ( not ( = ?auto_1837503 ?auto_1837509 ) ) ( not ( = ?auto_1837503 ?auto_1837510 ) ) ( not ( = ?auto_1837503 ?auto_1837511 ) ) ( not ( = ?auto_1837503 ?auto_1837512 ) ) ( not ( = ?auto_1837503 ?auto_1837513 ) ) ( not ( = ?auto_1837504 ?auto_1837505 ) ) ( not ( = ?auto_1837504 ?auto_1837502 ) ) ( not ( = ?auto_1837504 ?auto_1837506 ) ) ( not ( = ?auto_1837504 ?auto_1837508 ) ) ( not ( = ?auto_1837504 ?auto_1837507 ) ) ( not ( = ?auto_1837504 ?auto_1837509 ) ) ( not ( = ?auto_1837504 ?auto_1837510 ) ) ( not ( = ?auto_1837504 ?auto_1837511 ) ) ( not ( = ?auto_1837504 ?auto_1837512 ) ) ( not ( = ?auto_1837504 ?auto_1837513 ) ) ( not ( = ?auto_1837505 ?auto_1837502 ) ) ( not ( = ?auto_1837505 ?auto_1837506 ) ) ( not ( = ?auto_1837505 ?auto_1837508 ) ) ( not ( = ?auto_1837505 ?auto_1837507 ) ) ( not ( = ?auto_1837505 ?auto_1837509 ) ) ( not ( = ?auto_1837505 ?auto_1837510 ) ) ( not ( = ?auto_1837505 ?auto_1837511 ) ) ( not ( = ?auto_1837505 ?auto_1837512 ) ) ( not ( = ?auto_1837505 ?auto_1837513 ) ) ( not ( = ?auto_1837502 ?auto_1837506 ) ) ( not ( = ?auto_1837502 ?auto_1837508 ) ) ( not ( = ?auto_1837502 ?auto_1837507 ) ) ( not ( = ?auto_1837502 ?auto_1837509 ) ) ( not ( = ?auto_1837502 ?auto_1837510 ) ) ( not ( = ?auto_1837502 ?auto_1837511 ) ) ( not ( = ?auto_1837502 ?auto_1837512 ) ) ( not ( = ?auto_1837502 ?auto_1837513 ) ) ( not ( = ?auto_1837506 ?auto_1837508 ) ) ( not ( = ?auto_1837506 ?auto_1837507 ) ) ( not ( = ?auto_1837506 ?auto_1837509 ) ) ( not ( = ?auto_1837506 ?auto_1837510 ) ) ( not ( = ?auto_1837506 ?auto_1837511 ) ) ( not ( = ?auto_1837506 ?auto_1837512 ) ) ( not ( = ?auto_1837506 ?auto_1837513 ) ) ( not ( = ?auto_1837508 ?auto_1837507 ) ) ( not ( = ?auto_1837508 ?auto_1837509 ) ) ( not ( = ?auto_1837508 ?auto_1837510 ) ) ( not ( = ?auto_1837508 ?auto_1837511 ) ) ( not ( = ?auto_1837508 ?auto_1837512 ) ) ( not ( = ?auto_1837508 ?auto_1837513 ) ) ( not ( = ?auto_1837507 ?auto_1837509 ) ) ( not ( = ?auto_1837507 ?auto_1837510 ) ) ( not ( = ?auto_1837507 ?auto_1837511 ) ) ( not ( = ?auto_1837507 ?auto_1837512 ) ) ( not ( = ?auto_1837507 ?auto_1837513 ) ) ( not ( = ?auto_1837509 ?auto_1837510 ) ) ( not ( = ?auto_1837509 ?auto_1837511 ) ) ( not ( = ?auto_1837509 ?auto_1837512 ) ) ( not ( = ?auto_1837509 ?auto_1837513 ) ) ( not ( = ?auto_1837510 ?auto_1837511 ) ) ( not ( = ?auto_1837510 ?auto_1837512 ) ) ( not ( = ?auto_1837510 ?auto_1837513 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1837511 ?auto_1837512 ?auto_1837513 )
      ( MAKE-11CRATE-VERIFY ?auto_1837503 ?auto_1837504 ?auto_1837505 ?auto_1837502 ?auto_1837506 ?auto_1837508 ?auto_1837507 ?auto_1837509 ?auto_1837510 ?auto_1837511 ?auto_1837512 ?auto_1837513 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1837646 - SURFACE
      ?auto_1837647 - SURFACE
      ?auto_1837648 - SURFACE
      ?auto_1837645 - SURFACE
      ?auto_1837649 - SURFACE
      ?auto_1837651 - SURFACE
      ?auto_1837650 - SURFACE
      ?auto_1837652 - SURFACE
      ?auto_1837653 - SURFACE
      ?auto_1837654 - SURFACE
      ?auto_1837655 - SURFACE
      ?auto_1837656 - SURFACE
    )
    :vars
    (
      ?auto_1837657 - HOIST
      ?auto_1837662 - PLACE
      ?auto_1837658 - TRUCK
      ?auto_1837661 - PLACE
      ?auto_1837660 - HOIST
      ?auto_1837659 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1837657 ?auto_1837662 ) ( SURFACE-AT ?auto_1837655 ?auto_1837662 ) ( CLEAR ?auto_1837655 ) ( IS-CRATE ?auto_1837656 ) ( not ( = ?auto_1837655 ?auto_1837656 ) ) ( AVAILABLE ?auto_1837657 ) ( ON ?auto_1837655 ?auto_1837654 ) ( not ( = ?auto_1837654 ?auto_1837655 ) ) ( not ( = ?auto_1837654 ?auto_1837656 ) ) ( TRUCK-AT ?auto_1837658 ?auto_1837661 ) ( not ( = ?auto_1837661 ?auto_1837662 ) ) ( HOIST-AT ?auto_1837660 ?auto_1837661 ) ( not ( = ?auto_1837657 ?auto_1837660 ) ) ( AVAILABLE ?auto_1837660 ) ( SURFACE-AT ?auto_1837656 ?auto_1837661 ) ( ON ?auto_1837656 ?auto_1837659 ) ( CLEAR ?auto_1837656 ) ( not ( = ?auto_1837655 ?auto_1837659 ) ) ( not ( = ?auto_1837656 ?auto_1837659 ) ) ( not ( = ?auto_1837654 ?auto_1837659 ) ) ( ON ?auto_1837647 ?auto_1837646 ) ( ON ?auto_1837648 ?auto_1837647 ) ( ON ?auto_1837645 ?auto_1837648 ) ( ON ?auto_1837649 ?auto_1837645 ) ( ON ?auto_1837651 ?auto_1837649 ) ( ON ?auto_1837650 ?auto_1837651 ) ( ON ?auto_1837652 ?auto_1837650 ) ( ON ?auto_1837653 ?auto_1837652 ) ( ON ?auto_1837654 ?auto_1837653 ) ( not ( = ?auto_1837646 ?auto_1837647 ) ) ( not ( = ?auto_1837646 ?auto_1837648 ) ) ( not ( = ?auto_1837646 ?auto_1837645 ) ) ( not ( = ?auto_1837646 ?auto_1837649 ) ) ( not ( = ?auto_1837646 ?auto_1837651 ) ) ( not ( = ?auto_1837646 ?auto_1837650 ) ) ( not ( = ?auto_1837646 ?auto_1837652 ) ) ( not ( = ?auto_1837646 ?auto_1837653 ) ) ( not ( = ?auto_1837646 ?auto_1837654 ) ) ( not ( = ?auto_1837646 ?auto_1837655 ) ) ( not ( = ?auto_1837646 ?auto_1837656 ) ) ( not ( = ?auto_1837646 ?auto_1837659 ) ) ( not ( = ?auto_1837647 ?auto_1837648 ) ) ( not ( = ?auto_1837647 ?auto_1837645 ) ) ( not ( = ?auto_1837647 ?auto_1837649 ) ) ( not ( = ?auto_1837647 ?auto_1837651 ) ) ( not ( = ?auto_1837647 ?auto_1837650 ) ) ( not ( = ?auto_1837647 ?auto_1837652 ) ) ( not ( = ?auto_1837647 ?auto_1837653 ) ) ( not ( = ?auto_1837647 ?auto_1837654 ) ) ( not ( = ?auto_1837647 ?auto_1837655 ) ) ( not ( = ?auto_1837647 ?auto_1837656 ) ) ( not ( = ?auto_1837647 ?auto_1837659 ) ) ( not ( = ?auto_1837648 ?auto_1837645 ) ) ( not ( = ?auto_1837648 ?auto_1837649 ) ) ( not ( = ?auto_1837648 ?auto_1837651 ) ) ( not ( = ?auto_1837648 ?auto_1837650 ) ) ( not ( = ?auto_1837648 ?auto_1837652 ) ) ( not ( = ?auto_1837648 ?auto_1837653 ) ) ( not ( = ?auto_1837648 ?auto_1837654 ) ) ( not ( = ?auto_1837648 ?auto_1837655 ) ) ( not ( = ?auto_1837648 ?auto_1837656 ) ) ( not ( = ?auto_1837648 ?auto_1837659 ) ) ( not ( = ?auto_1837645 ?auto_1837649 ) ) ( not ( = ?auto_1837645 ?auto_1837651 ) ) ( not ( = ?auto_1837645 ?auto_1837650 ) ) ( not ( = ?auto_1837645 ?auto_1837652 ) ) ( not ( = ?auto_1837645 ?auto_1837653 ) ) ( not ( = ?auto_1837645 ?auto_1837654 ) ) ( not ( = ?auto_1837645 ?auto_1837655 ) ) ( not ( = ?auto_1837645 ?auto_1837656 ) ) ( not ( = ?auto_1837645 ?auto_1837659 ) ) ( not ( = ?auto_1837649 ?auto_1837651 ) ) ( not ( = ?auto_1837649 ?auto_1837650 ) ) ( not ( = ?auto_1837649 ?auto_1837652 ) ) ( not ( = ?auto_1837649 ?auto_1837653 ) ) ( not ( = ?auto_1837649 ?auto_1837654 ) ) ( not ( = ?auto_1837649 ?auto_1837655 ) ) ( not ( = ?auto_1837649 ?auto_1837656 ) ) ( not ( = ?auto_1837649 ?auto_1837659 ) ) ( not ( = ?auto_1837651 ?auto_1837650 ) ) ( not ( = ?auto_1837651 ?auto_1837652 ) ) ( not ( = ?auto_1837651 ?auto_1837653 ) ) ( not ( = ?auto_1837651 ?auto_1837654 ) ) ( not ( = ?auto_1837651 ?auto_1837655 ) ) ( not ( = ?auto_1837651 ?auto_1837656 ) ) ( not ( = ?auto_1837651 ?auto_1837659 ) ) ( not ( = ?auto_1837650 ?auto_1837652 ) ) ( not ( = ?auto_1837650 ?auto_1837653 ) ) ( not ( = ?auto_1837650 ?auto_1837654 ) ) ( not ( = ?auto_1837650 ?auto_1837655 ) ) ( not ( = ?auto_1837650 ?auto_1837656 ) ) ( not ( = ?auto_1837650 ?auto_1837659 ) ) ( not ( = ?auto_1837652 ?auto_1837653 ) ) ( not ( = ?auto_1837652 ?auto_1837654 ) ) ( not ( = ?auto_1837652 ?auto_1837655 ) ) ( not ( = ?auto_1837652 ?auto_1837656 ) ) ( not ( = ?auto_1837652 ?auto_1837659 ) ) ( not ( = ?auto_1837653 ?auto_1837654 ) ) ( not ( = ?auto_1837653 ?auto_1837655 ) ) ( not ( = ?auto_1837653 ?auto_1837656 ) ) ( not ( = ?auto_1837653 ?auto_1837659 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1837654 ?auto_1837655 ?auto_1837656 )
      ( MAKE-11CRATE-VERIFY ?auto_1837646 ?auto_1837647 ?auto_1837648 ?auto_1837645 ?auto_1837649 ?auto_1837651 ?auto_1837650 ?auto_1837652 ?auto_1837653 ?auto_1837654 ?auto_1837655 ?auto_1837656 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1837790 - SURFACE
      ?auto_1837791 - SURFACE
      ?auto_1837792 - SURFACE
      ?auto_1837789 - SURFACE
      ?auto_1837793 - SURFACE
      ?auto_1837795 - SURFACE
      ?auto_1837794 - SURFACE
      ?auto_1837796 - SURFACE
      ?auto_1837797 - SURFACE
      ?auto_1837798 - SURFACE
      ?auto_1837799 - SURFACE
      ?auto_1837800 - SURFACE
    )
    :vars
    (
      ?auto_1837802 - HOIST
      ?auto_1837805 - PLACE
      ?auto_1837801 - PLACE
      ?auto_1837804 - HOIST
      ?auto_1837806 - SURFACE
      ?auto_1837803 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1837802 ?auto_1837805 ) ( SURFACE-AT ?auto_1837799 ?auto_1837805 ) ( CLEAR ?auto_1837799 ) ( IS-CRATE ?auto_1837800 ) ( not ( = ?auto_1837799 ?auto_1837800 ) ) ( AVAILABLE ?auto_1837802 ) ( ON ?auto_1837799 ?auto_1837798 ) ( not ( = ?auto_1837798 ?auto_1837799 ) ) ( not ( = ?auto_1837798 ?auto_1837800 ) ) ( not ( = ?auto_1837801 ?auto_1837805 ) ) ( HOIST-AT ?auto_1837804 ?auto_1837801 ) ( not ( = ?auto_1837802 ?auto_1837804 ) ) ( AVAILABLE ?auto_1837804 ) ( SURFACE-AT ?auto_1837800 ?auto_1837801 ) ( ON ?auto_1837800 ?auto_1837806 ) ( CLEAR ?auto_1837800 ) ( not ( = ?auto_1837799 ?auto_1837806 ) ) ( not ( = ?auto_1837800 ?auto_1837806 ) ) ( not ( = ?auto_1837798 ?auto_1837806 ) ) ( TRUCK-AT ?auto_1837803 ?auto_1837805 ) ( ON ?auto_1837791 ?auto_1837790 ) ( ON ?auto_1837792 ?auto_1837791 ) ( ON ?auto_1837789 ?auto_1837792 ) ( ON ?auto_1837793 ?auto_1837789 ) ( ON ?auto_1837795 ?auto_1837793 ) ( ON ?auto_1837794 ?auto_1837795 ) ( ON ?auto_1837796 ?auto_1837794 ) ( ON ?auto_1837797 ?auto_1837796 ) ( ON ?auto_1837798 ?auto_1837797 ) ( not ( = ?auto_1837790 ?auto_1837791 ) ) ( not ( = ?auto_1837790 ?auto_1837792 ) ) ( not ( = ?auto_1837790 ?auto_1837789 ) ) ( not ( = ?auto_1837790 ?auto_1837793 ) ) ( not ( = ?auto_1837790 ?auto_1837795 ) ) ( not ( = ?auto_1837790 ?auto_1837794 ) ) ( not ( = ?auto_1837790 ?auto_1837796 ) ) ( not ( = ?auto_1837790 ?auto_1837797 ) ) ( not ( = ?auto_1837790 ?auto_1837798 ) ) ( not ( = ?auto_1837790 ?auto_1837799 ) ) ( not ( = ?auto_1837790 ?auto_1837800 ) ) ( not ( = ?auto_1837790 ?auto_1837806 ) ) ( not ( = ?auto_1837791 ?auto_1837792 ) ) ( not ( = ?auto_1837791 ?auto_1837789 ) ) ( not ( = ?auto_1837791 ?auto_1837793 ) ) ( not ( = ?auto_1837791 ?auto_1837795 ) ) ( not ( = ?auto_1837791 ?auto_1837794 ) ) ( not ( = ?auto_1837791 ?auto_1837796 ) ) ( not ( = ?auto_1837791 ?auto_1837797 ) ) ( not ( = ?auto_1837791 ?auto_1837798 ) ) ( not ( = ?auto_1837791 ?auto_1837799 ) ) ( not ( = ?auto_1837791 ?auto_1837800 ) ) ( not ( = ?auto_1837791 ?auto_1837806 ) ) ( not ( = ?auto_1837792 ?auto_1837789 ) ) ( not ( = ?auto_1837792 ?auto_1837793 ) ) ( not ( = ?auto_1837792 ?auto_1837795 ) ) ( not ( = ?auto_1837792 ?auto_1837794 ) ) ( not ( = ?auto_1837792 ?auto_1837796 ) ) ( not ( = ?auto_1837792 ?auto_1837797 ) ) ( not ( = ?auto_1837792 ?auto_1837798 ) ) ( not ( = ?auto_1837792 ?auto_1837799 ) ) ( not ( = ?auto_1837792 ?auto_1837800 ) ) ( not ( = ?auto_1837792 ?auto_1837806 ) ) ( not ( = ?auto_1837789 ?auto_1837793 ) ) ( not ( = ?auto_1837789 ?auto_1837795 ) ) ( not ( = ?auto_1837789 ?auto_1837794 ) ) ( not ( = ?auto_1837789 ?auto_1837796 ) ) ( not ( = ?auto_1837789 ?auto_1837797 ) ) ( not ( = ?auto_1837789 ?auto_1837798 ) ) ( not ( = ?auto_1837789 ?auto_1837799 ) ) ( not ( = ?auto_1837789 ?auto_1837800 ) ) ( not ( = ?auto_1837789 ?auto_1837806 ) ) ( not ( = ?auto_1837793 ?auto_1837795 ) ) ( not ( = ?auto_1837793 ?auto_1837794 ) ) ( not ( = ?auto_1837793 ?auto_1837796 ) ) ( not ( = ?auto_1837793 ?auto_1837797 ) ) ( not ( = ?auto_1837793 ?auto_1837798 ) ) ( not ( = ?auto_1837793 ?auto_1837799 ) ) ( not ( = ?auto_1837793 ?auto_1837800 ) ) ( not ( = ?auto_1837793 ?auto_1837806 ) ) ( not ( = ?auto_1837795 ?auto_1837794 ) ) ( not ( = ?auto_1837795 ?auto_1837796 ) ) ( not ( = ?auto_1837795 ?auto_1837797 ) ) ( not ( = ?auto_1837795 ?auto_1837798 ) ) ( not ( = ?auto_1837795 ?auto_1837799 ) ) ( not ( = ?auto_1837795 ?auto_1837800 ) ) ( not ( = ?auto_1837795 ?auto_1837806 ) ) ( not ( = ?auto_1837794 ?auto_1837796 ) ) ( not ( = ?auto_1837794 ?auto_1837797 ) ) ( not ( = ?auto_1837794 ?auto_1837798 ) ) ( not ( = ?auto_1837794 ?auto_1837799 ) ) ( not ( = ?auto_1837794 ?auto_1837800 ) ) ( not ( = ?auto_1837794 ?auto_1837806 ) ) ( not ( = ?auto_1837796 ?auto_1837797 ) ) ( not ( = ?auto_1837796 ?auto_1837798 ) ) ( not ( = ?auto_1837796 ?auto_1837799 ) ) ( not ( = ?auto_1837796 ?auto_1837800 ) ) ( not ( = ?auto_1837796 ?auto_1837806 ) ) ( not ( = ?auto_1837797 ?auto_1837798 ) ) ( not ( = ?auto_1837797 ?auto_1837799 ) ) ( not ( = ?auto_1837797 ?auto_1837800 ) ) ( not ( = ?auto_1837797 ?auto_1837806 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1837798 ?auto_1837799 ?auto_1837800 )
      ( MAKE-11CRATE-VERIFY ?auto_1837790 ?auto_1837791 ?auto_1837792 ?auto_1837789 ?auto_1837793 ?auto_1837795 ?auto_1837794 ?auto_1837796 ?auto_1837797 ?auto_1837798 ?auto_1837799 ?auto_1837800 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1837934 - SURFACE
      ?auto_1837935 - SURFACE
      ?auto_1837936 - SURFACE
      ?auto_1837933 - SURFACE
      ?auto_1837937 - SURFACE
      ?auto_1837939 - SURFACE
      ?auto_1837938 - SURFACE
      ?auto_1837940 - SURFACE
      ?auto_1837941 - SURFACE
      ?auto_1837942 - SURFACE
      ?auto_1837943 - SURFACE
      ?auto_1837944 - SURFACE
    )
    :vars
    (
      ?auto_1837947 - HOIST
      ?auto_1837948 - PLACE
      ?auto_1837950 - PLACE
      ?auto_1837946 - HOIST
      ?auto_1837945 - SURFACE
      ?auto_1837949 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1837947 ?auto_1837948 ) ( IS-CRATE ?auto_1837944 ) ( not ( = ?auto_1837943 ?auto_1837944 ) ) ( not ( = ?auto_1837942 ?auto_1837943 ) ) ( not ( = ?auto_1837942 ?auto_1837944 ) ) ( not ( = ?auto_1837950 ?auto_1837948 ) ) ( HOIST-AT ?auto_1837946 ?auto_1837950 ) ( not ( = ?auto_1837947 ?auto_1837946 ) ) ( AVAILABLE ?auto_1837946 ) ( SURFACE-AT ?auto_1837944 ?auto_1837950 ) ( ON ?auto_1837944 ?auto_1837945 ) ( CLEAR ?auto_1837944 ) ( not ( = ?auto_1837943 ?auto_1837945 ) ) ( not ( = ?auto_1837944 ?auto_1837945 ) ) ( not ( = ?auto_1837942 ?auto_1837945 ) ) ( TRUCK-AT ?auto_1837949 ?auto_1837948 ) ( SURFACE-AT ?auto_1837942 ?auto_1837948 ) ( CLEAR ?auto_1837942 ) ( LIFTING ?auto_1837947 ?auto_1837943 ) ( IS-CRATE ?auto_1837943 ) ( ON ?auto_1837935 ?auto_1837934 ) ( ON ?auto_1837936 ?auto_1837935 ) ( ON ?auto_1837933 ?auto_1837936 ) ( ON ?auto_1837937 ?auto_1837933 ) ( ON ?auto_1837939 ?auto_1837937 ) ( ON ?auto_1837938 ?auto_1837939 ) ( ON ?auto_1837940 ?auto_1837938 ) ( ON ?auto_1837941 ?auto_1837940 ) ( ON ?auto_1837942 ?auto_1837941 ) ( not ( = ?auto_1837934 ?auto_1837935 ) ) ( not ( = ?auto_1837934 ?auto_1837936 ) ) ( not ( = ?auto_1837934 ?auto_1837933 ) ) ( not ( = ?auto_1837934 ?auto_1837937 ) ) ( not ( = ?auto_1837934 ?auto_1837939 ) ) ( not ( = ?auto_1837934 ?auto_1837938 ) ) ( not ( = ?auto_1837934 ?auto_1837940 ) ) ( not ( = ?auto_1837934 ?auto_1837941 ) ) ( not ( = ?auto_1837934 ?auto_1837942 ) ) ( not ( = ?auto_1837934 ?auto_1837943 ) ) ( not ( = ?auto_1837934 ?auto_1837944 ) ) ( not ( = ?auto_1837934 ?auto_1837945 ) ) ( not ( = ?auto_1837935 ?auto_1837936 ) ) ( not ( = ?auto_1837935 ?auto_1837933 ) ) ( not ( = ?auto_1837935 ?auto_1837937 ) ) ( not ( = ?auto_1837935 ?auto_1837939 ) ) ( not ( = ?auto_1837935 ?auto_1837938 ) ) ( not ( = ?auto_1837935 ?auto_1837940 ) ) ( not ( = ?auto_1837935 ?auto_1837941 ) ) ( not ( = ?auto_1837935 ?auto_1837942 ) ) ( not ( = ?auto_1837935 ?auto_1837943 ) ) ( not ( = ?auto_1837935 ?auto_1837944 ) ) ( not ( = ?auto_1837935 ?auto_1837945 ) ) ( not ( = ?auto_1837936 ?auto_1837933 ) ) ( not ( = ?auto_1837936 ?auto_1837937 ) ) ( not ( = ?auto_1837936 ?auto_1837939 ) ) ( not ( = ?auto_1837936 ?auto_1837938 ) ) ( not ( = ?auto_1837936 ?auto_1837940 ) ) ( not ( = ?auto_1837936 ?auto_1837941 ) ) ( not ( = ?auto_1837936 ?auto_1837942 ) ) ( not ( = ?auto_1837936 ?auto_1837943 ) ) ( not ( = ?auto_1837936 ?auto_1837944 ) ) ( not ( = ?auto_1837936 ?auto_1837945 ) ) ( not ( = ?auto_1837933 ?auto_1837937 ) ) ( not ( = ?auto_1837933 ?auto_1837939 ) ) ( not ( = ?auto_1837933 ?auto_1837938 ) ) ( not ( = ?auto_1837933 ?auto_1837940 ) ) ( not ( = ?auto_1837933 ?auto_1837941 ) ) ( not ( = ?auto_1837933 ?auto_1837942 ) ) ( not ( = ?auto_1837933 ?auto_1837943 ) ) ( not ( = ?auto_1837933 ?auto_1837944 ) ) ( not ( = ?auto_1837933 ?auto_1837945 ) ) ( not ( = ?auto_1837937 ?auto_1837939 ) ) ( not ( = ?auto_1837937 ?auto_1837938 ) ) ( not ( = ?auto_1837937 ?auto_1837940 ) ) ( not ( = ?auto_1837937 ?auto_1837941 ) ) ( not ( = ?auto_1837937 ?auto_1837942 ) ) ( not ( = ?auto_1837937 ?auto_1837943 ) ) ( not ( = ?auto_1837937 ?auto_1837944 ) ) ( not ( = ?auto_1837937 ?auto_1837945 ) ) ( not ( = ?auto_1837939 ?auto_1837938 ) ) ( not ( = ?auto_1837939 ?auto_1837940 ) ) ( not ( = ?auto_1837939 ?auto_1837941 ) ) ( not ( = ?auto_1837939 ?auto_1837942 ) ) ( not ( = ?auto_1837939 ?auto_1837943 ) ) ( not ( = ?auto_1837939 ?auto_1837944 ) ) ( not ( = ?auto_1837939 ?auto_1837945 ) ) ( not ( = ?auto_1837938 ?auto_1837940 ) ) ( not ( = ?auto_1837938 ?auto_1837941 ) ) ( not ( = ?auto_1837938 ?auto_1837942 ) ) ( not ( = ?auto_1837938 ?auto_1837943 ) ) ( not ( = ?auto_1837938 ?auto_1837944 ) ) ( not ( = ?auto_1837938 ?auto_1837945 ) ) ( not ( = ?auto_1837940 ?auto_1837941 ) ) ( not ( = ?auto_1837940 ?auto_1837942 ) ) ( not ( = ?auto_1837940 ?auto_1837943 ) ) ( not ( = ?auto_1837940 ?auto_1837944 ) ) ( not ( = ?auto_1837940 ?auto_1837945 ) ) ( not ( = ?auto_1837941 ?auto_1837942 ) ) ( not ( = ?auto_1837941 ?auto_1837943 ) ) ( not ( = ?auto_1837941 ?auto_1837944 ) ) ( not ( = ?auto_1837941 ?auto_1837945 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1837942 ?auto_1837943 ?auto_1837944 )
      ( MAKE-11CRATE-VERIFY ?auto_1837934 ?auto_1837935 ?auto_1837936 ?auto_1837933 ?auto_1837937 ?auto_1837939 ?auto_1837938 ?auto_1837940 ?auto_1837941 ?auto_1837942 ?auto_1837943 ?auto_1837944 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1838078 - SURFACE
      ?auto_1838079 - SURFACE
      ?auto_1838080 - SURFACE
      ?auto_1838077 - SURFACE
      ?auto_1838081 - SURFACE
      ?auto_1838083 - SURFACE
      ?auto_1838082 - SURFACE
      ?auto_1838084 - SURFACE
      ?auto_1838085 - SURFACE
      ?auto_1838086 - SURFACE
      ?auto_1838087 - SURFACE
      ?auto_1838088 - SURFACE
    )
    :vars
    (
      ?auto_1838092 - HOIST
      ?auto_1838094 - PLACE
      ?auto_1838093 - PLACE
      ?auto_1838089 - HOIST
      ?auto_1838090 - SURFACE
      ?auto_1838091 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1838092 ?auto_1838094 ) ( IS-CRATE ?auto_1838088 ) ( not ( = ?auto_1838087 ?auto_1838088 ) ) ( not ( = ?auto_1838086 ?auto_1838087 ) ) ( not ( = ?auto_1838086 ?auto_1838088 ) ) ( not ( = ?auto_1838093 ?auto_1838094 ) ) ( HOIST-AT ?auto_1838089 ?auto_1838093 ) ( not ( = ?auto_1838092 ?auto_1838089 ) ) ( AVAILABLE ?auto_1838089 ) ( SURFACE-AT ?auto_1838088 ?auto_1838093 ) ( ON ?auto_1838088 ?auto_1838090 ) ( CLEAR ?auto_1838088 ) ( not ( = ?auto_1838087 ?auto_1838090 ) ) ( not ( = ?auto_1838088 ?auto_1838090 ) ) ( not ( = ?auto_1838086 ?auto_1838090 ) ) ( TRUCK-AT ?auto_1838091 ?auto_1838094 ) ( SURFACE-AT ?auto_1838086 ?auto_1838094 ) ( CLEAR ?auto_1838086 ) ( IS-CRATE ?auto_1838087 ) ( AVAILABLE ?auto_1838092 ) ( IN ?auto_1838087 ?auto_1838091 ) ( ON ?auto_1838079 ?auto_1838078 ) ( ON ?auto_1838080 ?auto_1838079 ) ( ON ?auto_1838077 ?auto_1838080 ) ( ON ?auto_1838081 ?auto_1838077 ) ( ON ?auto_1838083 ?auto_1838081 ) ( ON ?auto_1838082 ?auto_1838083 ) ( ON ?auto_1838084 ?auto_1838082 ) ( ON ?auto_1838085 ?auto_1838084 ) ( ON ?auto_1838086 ?auto_1838085 ) ( not ( = ?auto_1838078 ?auto_1838079 ) ) ( not ( = ?auto_1838078 ?auto_1838080 ) ) ( not ( = ?auto_1838078 ?auto_1838077 ) ) ( not ( = ?auto_1838078 ?auto_1838081 ) ) ( not ( = ?auto_1838078 ?auto_1838083 ) ) ( not ( = ?auto_1838078 ?auto_1838082 ) ) ( not ( = ?auto_1838078 ?auto_1838084 ) ) ( not ( = ?auto_1838078 ?auto_1838085 ) ) ( not ( = ?auto_1838078 ?auto_1838086 ) ) ( not ( = ?auto_1838078 ?auto_1838087 ) ) ( not ( = ?auto_1838078 ?auto_1838088 ) ) ( not ( = ?auto_1838078 ?auto_1838090 ) ) ( not ( = ?auto_1838079 ?auto_1838080 ) ) ( not ( = ?auto_1838079 ?auto_1838077 ) ) ( not ( = ?auto_1838079 ?auto_1838081 ) ) ( not ( = ?auto_1838079 ?auto_1838083 ) ) ( not ( = ?auto_1838079 ?auto_1838082 ) ) ( not ( = ?auto_1838079 ?auto_1838084 ) ) ( not ( = ?auto_1838079 ?auto_1838085 ) ) ( not ( = ?auto_1838079 ?auto_1838086 ) ) ( not ( = ?auto_1838079 ?auto_1838087 ) ) ( not ( = ?auto_1838079 ?auto_1838088 ) ) ( not ( = ?auto_1838079 ?auto_1838090 ) ) ( not ( = ?auto_1838080 ?auto_1838077 ) ) ( not ( = ?auto_1838080 ?auto_1838081 ) ) ( not ( = ?auto_1838080 ?auto_1838083 ) ) ( not ( = ?auto_1838080 ?auto_1838082 ) ) ( not ( = ?auto_1838080 ?auto_1838084 ) ) ( not ( = ?auto_1838080 ?auto_1838085 ) ) ( not ( = ?auto_1838080 ?auto_1838086 ) ) ( not ( = ?auto_1838080 ?auto_1838087 ) ) ( not ( = ?auto_1838080 ?auto_1838088 ) ) ( not ( = ?auto_1838080 ?auto_1838090 ) ) ( not ( = ?auto_1838077 ?auto_1838081 ) ) ( not ( = ?auto_1838077 ?auto_1838083 ) ) ( not ( = ?auto_1838077 ?auto_1838082 ) ) ( not ( = ?auto_1838077 ?auto_1838084 ) ) ( not ( = ?auto_1838077 ?auto_1838085 ) ) ( not ( = ?auto_1838077 ?auto_1838086 ) ) ( not ( = ?auto_1838077 ?auto_1838087 ) ) ( not ( = ?auto_1838077 ?auto_1838088 ) ) ( not ( = ?auto_1838077 ?auto_1838090 ) ) ( not ( = ?auto_1838081 ?auto_1838083 ) ) ( not ( = ?auto_1838081 ?auto_1838082 ) ) ( not ( = ?auto_1838081 ?auto_1838084 ) ) ( not ( = ?auto_1838081 ?auto_1838085 ) ) ( not ( = ?auto_1838081 ?auto_1838086 ) ) ( not ( = ?auto_1838081 ?auto_1838087 ) ) ( not ( = ?auto_1838081 ?auto_1838088 ) ) ( not ( = ?auto_1838081 ?auto_1838090 ) ) ( not ( = ?auto_1838083 ?auto_1838082 ) ) ( not ( = ?auto_1838083 ?auto_1838084 ) ) ( not ( = ?auto_1838083 ?auto_1838085 ) ) ( not ( = ?auto_1838083 ?auto_1838086 ) ) ( not ( = ?auto_1838083 ?auto_1838087 ) ) ( not ( = ?auto_1838083 ?auto_1838088 ) ) ( not ( = ?auto_1838083 ?auto_1838090 ) ) ( not ( = ?auto_1838082 ?auto_1838084 ) ) ( not ( = ?auto_1838082 ?auto_1838085 ) ) ( not ( = ?auto_1838082 ?auto_1838086 ) ) ( not ( = ?auto_1838082 ?auto_1838087 ) ) ( not ( = ?auto_1838082 ?auto_1838088 ) ) ( not ( = ?auto_1838082 ?auto_1838090 ) ) ( not ( = ?auto_1838084 ?auto_1838085 ) ) ( not ( = ?auto_1838084 ?auto_1838086 ) ) ( not ( = ?auto_1838084 ?auto_1838087 ) ) ( not ( = ?auto_1838084 ?auto_1838088 ) ) ( not ( = ?auto_1838084 ?auto_1838090 ) ) ( not ( = ?auto_1838085 ?auto_1838086 ) ) ( not ( = ?auto_1838085 ?auto_1838087 ) ) ( not ( = ?auto_1838085 ?auto_1838088 ) ) ( not ( = ?auto_1838085 ?auto_1838090 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1838086 ?auto_1838087 ?auto_1838088 )
      ( MAKE-11CRATE-VERIFY ?auto_1838078 ?auto_1838079 ?auto_1838080 ?auto_1838077 ?auto_1838081 ?auto_1838083 ?auto_1838082 ?auto_1838084 ?auto_1838085 ?auto_1838086 ?auto_1838087 ?auto_1838088 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1847369 - SURFACE
      ?auto_1847370 - SURFACE
      ?auto_1847371 - SURFACE
      ?auto_1847368 - SURFACE
      ?auto_1847372 - SURFACE
      ?auto_1847374 - SURFACE
      ?auto_1847373 - SURFACE
      ?auto_1847375 - SURFACE
      ?auto_1847376 - SURFACE
      ?auto_1847377 - SURFACE
      ?auto_1847378 - SURFACE
      ?auto_1847379 - SURFACE
      ?auto_1847380 - SURFACE
    )
    :vars
    (
      ?auto_1847381 - HOIST
      ?auto_1847382 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1847381 ?auto_1847382 ) ( SURFACE-AT ?auto_1847379 ?auto_1847382 ) ( CLEAR ?auto_1847379 ) ( LIFTING ?auto_1847381 ?auto_1847380 ) ( IS-CRATE ?auto_1847380 ) ( not ( = ?auto_1847379 ?auto_1847380 ) ) ( ON ?auto_1847370 ?auto_1847369 ) ( ON ?auto_1847371 ?auto_1847370 ) ( ON ?auto_1847368 ?auto_1847371 ) ( ON ?auto_1847372 ?auto_1847368 ) ( ON ?auto_1847374 ?auto_1847372 ) ( ON ?auto_1847373 ?auto_1847374 ) ( ON ?auto_1847375 ?auto_1847373 ) ( ON ?auto_1847376 ?auto_1847375 ) ( ON ?auto_1847377 ?auto_1847376 ) ( ON ?auto_1847378 ?auto_1847377 ) ( ON ?auto_1847379 ?auto_1847378 ) ( not ( = ?auto_1847369 ?auto_1847370 ) ) ( not ( = ?auto_1847369 ?auto_1847371 ) ) ( not ( = ?auto_1847369 ?auto_1847368 ) ) ( not ( = ?auto_1847369 ?auto_1847372 ) ) ( not ( = ?auto_1847369 ?auto_1847374 ) ) ( not ( = ?auto_1847369 ?auto_1847373 ) ) ( not ( = ?auto_1847369 ?auto_1847375 ) ) ( not ( = ?auto_1847369 ?auto_1847376 ) ) ( not ( = ?auto_1847369 ?auto_1847377 ) ) ( not ( = ?auto_1847369 ?auto_1847378 ) ) ( not ( = ?auto_1847369 ?auto_1847379 ) ) ( not ( = ?auto_1847369 ?auto_1847380 ) ) ( not ( = ?auto_1847370 ?auto_1847371 ) ) ( not ( = ?auto_1847370 ?auto_1847368 ) ) ( not ( = ?auto_1847370 ?auto_1847372 ) ) ( not ( = ?auto_1847370 ?auto_1847374 ) ) ( not ( = ?auto_1847370 ?auto_1847373 ) ) ( not ( = ?auto_1847370 ?auto_1847375 ) ) ( not ( = ?auto_1847370 ?auto_1847376 ) ) ( not ( = ?auto_1847370 ?auto_1847377 ) ) ( not ( = ?auto_1847370 ?auto_1847378 ) ) ( not ( = ?auto_1847370 ?auto_1847379 ) ) ( not ( = ?auto_1847370 ?auto_1847380 ) ) ( not ( = ?auto_1847371 ?auto_1847368 ) ) ( not ( = ?auto_1847371 ?auto_1847372 ) ) ( not ( = ?auto_1847371 ?auto_1847374 ) ) ( not ( = ?auto_1847371 ?auto_1847373 ) ) ( not ( = ?auto_1847371 ?auto_1847375 ) ) ( not ( = ?auto_1847371 ?auto_1847376 ) ) ( not ( = ?auto_1847371 ?auto_1847377 ) ) ( not ( = ?auto_1847371 ?auto_1847378 ) ) ( not ( = ?auto_1847371 ?auto_1847379 ) ) ( not ( = ?auto_1847371 ?auto_1847380 ) ) ( not ( = ?auto_1847368 ?auto_1847372 ) ) ( not ( = ?auto_1847368 ?auto_1847374 ) ) ( not ( = ?auto_1847368 ?auto_1847373 ) ) ( not ( = ?auto_1847368 ?auto_1847375 ) ) ( not ( = ?auto_1847368 ?auto_1847376 ) ) ( not ( = ?auto_1847368 ?auto_1847377 ) ) ( not ( = ?auto_1847368 ?auto_1847378 ) ) ( not ( = ?auto_1847368 ?auto_1847379 ) ) ( not ( = ?auto_1847368 ?auto_1847380 ) ) ( not ( = ?auto_1847372 ?auto_1847374 ) ) ( not ( = ?auto_1847372 ?auto_1847373 ) ) ( not ( = ?auto_1847372 ?auto_1847375 ) ) ( not ( = ?auto_1847372 ?auto_1847376 ) ) ( not ( = ?auto_1847372 ?auto_1847377 ) ) ( not ( = ?auto_1847372 ?auto_1847378 ) ) ( not ( = ?auto_1847372 ?auto_1847379 ) ) ( not ( = ?auto_1847372 ?auto_1847380 ) ) ( not ( = ?auto_1847374 ?auto_1847373 ) ) ( not ( = ?auto_1847374 ?auto_1847375 ) ) ( not ( = ?auto_1847374 ?auto_1847376 ) ) ( not ( = ?auto_1847374 ?auto_1847377 ) ) ( not ( = ?auto_1847374 ?auto_1847378 ) ) ( not ( = ?auto_1847374 ?auto_1847379 ) ) ( not ( = ?auto_1847374 ?auto_1847380 ) ) ( not ( = ?auto_1847373 ?auto_1847375 ) ) ( not ( = ?auto_1847373 ?auto_1847376 ) ) ( not ( = ?auto_1847373 ?auto_1847377 ) ) ( not ( = ?auto_1847373 ?auto_1847378 ) ) ( not ( = ?auto_1847373 ?auto_1847379 ) ) ( not ( = ?auto_1847373 ?auto_1847380 ) ) ( not ( = ?auto_1847375 ?auto_1847376 ) ) ( not ( = ?auto_1847375 ?auto_1847377 ) ) ( not ( = ?auto_1847375 ?auto_1847378 ) ) ( not ( = ?auto_1847375 ?auto_1847379 ) ) ( not ( = ?auto_1847375 ?auto_1847380 ) ) ( not ( = ?auto_1847376 ?auto_1847377 ) ) ( not ( = ?auto_1847376 ?auto_1847378 ) ) ( not ( = ?auto_1847376 ?auto_1847379 ) ) ( not ( = ?auto_1847376 ?auto_1847380 ) ) ( not ( = ?auto_1847377 ?auto_1847378 ) ) ( not ( = ?auto_1847377 ?auto_1847379 ) ) ( not ( = ?auto_1847377 ?auto_1847380 ) ) ( not ( = ?auto_1847378 ?auto_1847379 ) ) ( not ( = ?auto_1847378 ?auto_1847380 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1847379 ?auto_1847380 )
      ( MAKE-12CRATE-VERIFY ?auto_1847369 ?auto_1847370 ?auto_1847371 ?auto_1847368 ?auto_1847372 ?auto_1847374 ?auto_1847373 ?auto_1847375 ?auto_1847376 ?auto_1847377 ?auto_1847378 ?auto_1847379 ?auto_1847380 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1847494 - SURFACE
      ?auto_1847495 - SURFACE
      ?auto_1847496 - SURFACE
      ?auto_1847493 - SURFACE
      ?auto_1847497 - SURFACE
      ?auto_1847499 - SURFACE
      ?auto_1847498 - SURFACE
      ?auto_1847500 - SURFACE
      ?auto_1847501 - SURFACE
      ?auto_1847502 - SURFACE
      ?auto_1847503 - SURFACE
      ?auto_1847504 - SURFACE
      ?auto_1847505 - SURFACE
    )
    :vars
    (
      ?auto_1847507 - HOIST
      ?auto_1847506 - PLACE
      ?auto_1847508 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1847507 ?auto_1847506 ) ( SURFACE-AT ?auto_1847504 ?auto_1847506 ) ( CLEAR ?auto_1847504 ) ( IS-CRATE ?auto_1847505 ) ( not ( = ?auto_1847504 ?auto_1847505 ) ) ( TRUCK-AT ?auto_1847508 ?auto_1847506 ) ( AVAILABLE ?auto_1847507 ) ( IN ?auto_1847505 ?auto_1847508 ) ( ON ?auto_1847504 ?auto_1847503 ) ( not ( = ?auto_1847503 ?auto_1847504 ) ) ( not ( = ?auto_1847503 ?auto_1847505 ) ) ( ON ?auto_1847495 ?auto_1847494 ) ( ON ?auto_1847496 ?auto_1847495 ) ( ON ?auto_1847493 ?auto_1847496 ) ( ON ?auto_1847497 ?auto_1847493 ) ( ON ?auto_1847499 ?auto_1847497 ) ( ON ?auto_1847498 ?auto_1847499 ) ( ON ?auto_1847500 ?auto_1847498 ) ( ON ?auto_1847501 ?auto_1847500 ) ( ON ?auto_1847502 ?auto_1847501 ) ( ON ?auto_1847503 ?auto_1847502 ) ( not ( = ?auto_1847494 ?auto_1847495 ) ) ( not ( = ?auto_1847494 ?auto_1847496 ) ) ( not ( = ?auto_1847494 ?auto_1847493 ) ) ( not ( = ?auto_1847494 ?auto_1847497 ) ) ( not ( = ?auto_1847494 ?auto_1847499 ) ) ( not ( = ?auto_1847494 ?auto_1847498 ) ) ( not ( = ?auto_1847494 ?auto_1847500 ) ) ( not ( = ?auto_1847494 ?auto_1847501 ) ) ( not ( = ?auto_1847494 ?auto_1847502 ) ) ( not ( = ?auto_1847494 ?auto_1847503 ) ) ( not ( = ?auto_1847494 ?auto_1847504 ) ) ( not ( = ?auto_1847494 ?auto_1847505 ) ) ( not ( = ?auto_1847495 ?auto_1847496 ) ) ( not ( = ?auto_1847495 ?auto_1847493 ) ) ( not ( = ?auto_1847495 ?auto_1847497 ) ) ( not ( = ?auto_1847495 ?auto_1847499 ) ) ( not ( = ?auto_1847495 ?auto_1847498 ) ) ( not ( = ?auto_1847495 ?auto_1847500 ) ) ( not ( = ?auto_1847495 ?auto_1847501 ) ) ( not ( = ?auto_1847495 ?auto_1847502 ) ) ( not ( = ?auto_1847495 ?auto_1847503 ) ) ( not ( = ?auto_1847495 ?auto_1847504 ) ) ( not ( = ?auto_1847495 ?auto_1847505 ) ) ( not ( = ?auto_1847496 ?auto_1847493 ) ) ( not ( = ?auto_1847496 ?auto_1847497 ) ) ( not ( = ?auto_1847496 ?auto_1847499 ) ) ( not ( = ?auto_1847496 ?auto_1847498 ) ) ( not ( = ?auto_1847496 ?auto_1847500 ) ) ( not ( = ?auto_1847496 ?auto_1847501 ) ) ( not ( = ?auto_1847496 ?auto_1847502 ) ) ( not ( = ?auto_1847496 ?auto_1847503 ) ) ( not ( = ?auto_1847496 ?auto_1847504 ) ) ( not ( = ?auto_1847496 ?auto_1847505 ) ) ( not ( = ?auto_1847493 ?auto_1847497 ) ) ( not ( = ?auto_1847493 ?auto_1847499 ) ) ( not ( = ?auto_1847493 ?auto_1847498 ) ) ( not ( = ?auto_1847493 ?auto_1847500 ) ) ( not ( = ?auto_1847493 ?auto_1847501 ) ) ( not ( = ?auto_1847493 ?auto_1847502 ) ) ( not ( = ?auto_1847493 ?auto_1847503 ) ) ( not ( = ?auto_1847493 ?auto_1847504 ) ) ( not ( = ?auto_1847493 ?auto_1847505 ) ) ( not ( = ?auto_1847497 ?auto_1847499 ) ) ( not ( = ?auto_1847497 ?auto_1847498 ) ) ( not ( = ?auto_1847497 ?auto_1847500 ) ) ( not ( = ?auto_1847497 ?auto_1847501 ) ) ( not ( = ?auto_1847497 ?auto_1847502 ) ) ( not ( = ?auto_1847497 ?auto_1847503 ) ) ( not ( = ?auto_1847497 ?auto_1847504 ) ) ( not ( = ?auto_1847497 ?auto_1847505 ) ) ( not ( = ?auto_1847499 ?auto_1847498 ) ) ( not ( = ?auto_1847499 ?auto_1847500 ) ) ( not ( = ?auto_1847499 ?auto_1847501 ) ) ( not ( = ?auto_1847499 ?auto_1847502 ) ) ( not ( = ?auto_1847499 ?auto_1847503 ) ) ( not ( = ?auto_1847499 ?auto_1847504 ) ) ( not ( = ?auto_1847499 ?auto_1847505 ) ) ( not ( = ?auto_1847498 ?auto_1847500 ) ) ( not ( = ?auto_1847498 ?auto_1847501 ) ) ( not ( = ?auto_1847498 ?auto_1847502 ) ) ( not ( = ?auto_1847498 ?auto_1847503 ) ) ( not ( = ?auto_1847498 ?auto_1847504 ) ) ( not ( = ?auto_1847498 ?auto_1847505 ) ) ( not ( = ?auto_1847500 ?auto_1847501 ) ) ( not ( = ?auto_1847500 ?auto_1847502 ) ) ( not ( = ?auto_1847500 ?auto_1847503 ) ) ( not ( = ?auto_1847500 ?auto_1847504 ) ) ( not ( = ?auto_1847500 ?auto_1847505 ) ) ( not ( = ?auto_1847501 ?auto_1847502 ) ) ( not ( = ?auto_1847501 ?auto_1847503 ) ) ( not ( = ?auto_1847501 ?auto_1847504 ) ) ( not ( = ?auto_1847501 ?auto_1847505 ) ) ( not ( = ?auto_1847502 ?auto_1847503 ) ) ( not ( = ?auto_1847502 ?auto_1847504 ) ) ( not ( = ?auto_1847502 ?auto_1847505 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1847503 ?auto_1847504 ?auto_1847505 )
      ( MAKE-12CRATE-VERIFY ?auto_1847494 ?auto_1847495 ?auto_1847496 ?auto_1847493 ?auto_1847497 ?auto_1847499 ?auto_1847498 ?auto_1847500 ?auto_1847501 ?auto_1847502 ?auto_1847503 ?auto_1847504 ?auto_1847505 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1847632 - SURFACE
      ?auto_1847633 - SURFACE
      ?auto_1847634 - SURFACE
      ?auto_1847631 - SURFACE
      ?auto_1847635 - SURFACE
      ?auto_1847637 - SURFACE
      ?auto_1847636 - SURFACE
      ?auto_1847638 - SURFACE
      ?auto_1847639 - SURFACE
      ?auto_1847640 - SURFACE
      ?auto_1847641 - SURFACE
      ?auto_1847642 - SURFACE
      ?auto_1847643 - SURFACE
    )
    :vars
    (
      ?auto_1847644 - HOIST
      ?auto_1847647 - PLACE
      ?auto_1847645 - TRUCK
      ?auto_1847646 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1847644 ?auto_1847647 ) ( SURFACE-AT ?auto_1847642 ?auto_1847647 ) ( CLEAR ?auto_1847642 ) ( IS-CRATE ?auto_1847643 ) ( not ( = ?auto_1847642 ?auto_1847643 ) ) ( AVAILABLE ?auto_1847644 ) ( IN ?auto_1847643 ?auto_1847645 ) ( ON ?auto_1847642 ?auto_1847641 ) ( not ( = ?auto_1847641 ?auto_1847642 ) ) ( not ( = ?auto_1847641 ?auto_1847643 ) ) ( TRUCK-AT ?auto_1847645 ?auto_1847646 ) ( not ( = ?auto_1847646 ?auto_1847647 ) ) ( ON ?auto_1847633 ?auto_1847632 ) ( ON ?auto_1847634 ?auto_1847633 ) ( ON ?auto_1847631 ?auto_1847634 ) ( ON ?auto_1847635 ?auto_1847631 ) ( ON ?auto_1847637 ?auto_1847635 ) ( ON ?auto_1847636 ?auto_1847637 ) ( ON ?auto_1847638 ?auto_1847636 ) ( ON ?auto_1847639 ?auto_1847638 ) ( ON ?auto_1847640 ?auto_1847639 ) ( ON ?auto_1847641 ?auto_1847640 ) ( not ( = ?auto_1847632 ?auto_1847633 ) ) ( not ( = ?auto_1847632 ?auto_1847634 ) ) ( not ( = ?auto_1847632 ?auto_1847631 ) ) ( not ( = ?auto_1847632 ?auto_1847635 ) ) ( not ( = ?auto_1847632 ?auto_1847637 ) ) ( not ( = ?auto_1847632 ?auto_1847636 ) ) ( not ( = ?auto_1847632 ?auto_1847638 ) ) ( not ( = ?auto_1847632 ?auto_1847639 ) ) ( not ( = ?auto_1847632 ?auto_1847640 ) ) ( not ( = ?auto_1847632 ?auto_1847641 ) ) ( not ( = ?auto_1847632 ?auto_1847642 ) ) ( not ( = ?auto_1847632 ?auto_1847643 ) ) ( not ( = ?auto_1847633 ?auto_1847634 ) ) ( not ( = ?auto_1847633 ?auto_1847631 ) ) ( not ( = ?auto_1847633 ?auto_1847635 ) ) ( not ( = ?auto_1847633 ?auto_1847637 ) ) ( not ( = ?auto_1847633 ?auto_1847636 ) ) ( not ( = ?auto_1847633 ?auto_1847638 ) ) ( not ( = ?auto_1847633 ?auto_1847639 ) ) ( not ( = ?auto_1847633 ?auto_1847640 ) ) ( not ( = ?auto_1847633 ?auto_1847641 ) ) ( not ( = ?auto_1847633 ?auto_1847642 ) ) ( not ( = ?auto_1847633 ?auto_1847643 ) ) ( not ( = ?auto_1847634 ?auto_1847631 ) ) ( not ( = ?auto_1847634 ?auto_1847635 ) ) ( not ( = ?auto_1847634 ?auto_1847637 ) ) ( not ( = ?auto_1847634 ?auto_1847636 ) ) ( not ( = ?auto_1847634 ?auto_1847638 ) ) ( not ( = ?auto_1847634 ?auto_1847639 ) ) ( not ( = ?auto_1847634 ?auto_1847640 ) ) ( not ( = ?auto_1847634 ?auto_1847641 ) ) ( not ( = ?auto_1847634 ?auto_1847642 ) ) ( not ( = ?auto_1847634 ?auto_1847643 ) ) ( not ( = ?auto_1847631 ?auto_1847635 ) ) ( not ( = ?auto_1847631 ?auto_1847637 ) ) ( not ( = ?auto_1847631 ?auto_1847636 ) ) ( not ( = ?auto_1847631 ?auto_1847638 ) ) ( not ( = ?auto_1847631 ?auto_1847639 ) ) ( not ( = ?auto_1847631 ?auto_1847640 ) ) ( not ( = ?auto_1847631 ?auto_1847641 ) ) ( not ( = ?auto_1847631 ?auto_1847642 ) ) ( not ( = ?auto_1847631 ?auto_1847643 ) ) ( not ( = ?auto_1847635 ?auto_1847637 ) ) ( not ( = ?auto_1847635 ?auto_1847636 ) ) ( not ( = ?auto_1847635 ?auto_1847638 ) ) ( not ( = ?auto_1847635 ?auto_1847639 ) ) ( not ( = ?auto_1847635 ?auto_1847640 ) ) ( not ( = ?auto_1847635 ?auto_1847641 ) ) ( not ( = ?auto_1847635 ?auto_1847642 ) ) ( not ( = ?auto_1847635 ?auto_1847643 ) ) ( not ( = ?auto_1847637 ?auto_1847636 ) ) ( not ( = ?auto_1847637 ?auto_1847638 ) ) ( not ( = ?auto_1847637 ?auto_1847639 ) ) ( not ( = ?auto_1847637 ?auto_1847640 ) ) ( not ( = ?auto_1847637 ?auto_1847641 ) ) ( not ( = ?auto_1847637 ?auto_1847642 ) ) ( not ( = ?auto_1847637 ?auto_1847643 ) ) ( not ( = ?auto_1847636 ?auto_1847638 ) ) ( not ( = ?auto_1847636 ?auto_1847639 ) ) ( not ( = ?auto_1847636 ?auto_1847640 ) ) ( not ( = ?auto_1847636 ?auto_1847641 ) ) ( not ( = ?auto_1847636 ?auto_1847642 ) ) ( not ( = ?auto_1847636 ?auto_1847643 ) ) ( not ( = ?auto_1847638 ?auto_1847639 ) ) ( not ( = ?auto_1847638 ?auto_1847640 ) ) ( not ( = ?auto_1847638 ?auto_1847641 ) ) ( not ( = ?auto_1847638 ?auto_1847642 ) ) ( not ( = ?auto_1847638 ?auto_1847643 ) ) ( not ( = ?auto_1847639 ?auto_1847640 ) ) ( not ( = ?auto_1847639 ?auto_1847641 ) ) ( not ( = ?auto_1847639 ?auto_1847642 ) ) ( not ( = ?auto_1847639 ?auto_1847643 ) ) ( not ( = ?auto_1847640 ?auto_1847641 ) ) ( not ( = ?auto_1847640 ?auto_1847642 ) ) ( not ( = ?auto_1847640 ?auto_1847643 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1847641 ?auto_1847642 ?auto_1847643 )
      ( MAKE-12CRATE-VERIFY ?auto_1847632 ?auto_1847633 ?auto_1847634 ?auto_1847631 ?auto_1847635 ?auto_1847637 ?auto_1847636 ?auto_1847638 ?auto_1847639 ?auto_1847640 ?auto_1847641 ?auto_1847642 ?auto_1847643 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1847782 - SURFACE
      ?auto_1847783 - SURFACE
      ?auto_1847784 - SURFACE
      ?auto_1847781 - SURFACE
      ?auto_1847785 - SURFACE
      ?auto_1847787 - SURFACE
      ?auto_1847786 - SURFACE
      ?auto_1847788 - SURFACE
      ?auto_1847789 - SURFACE
      ?auto_1847790 - SURFACE
      ?auto_1847791 - SURFACE
      ?auto_1847792 - SURFACE
      ?auto_1847793 - SURFACE
    )
    :vars
    (
      ?auto_1847796 - HOIST
      ?auto_1847797 - PLACE
      ?auto_1847794 - TRUCK
      ?auto_1847795 - PLACE
      ?auto_1847798 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1847796 ?auto_1847797 ) ( SURFACE-AT ?auto_1847792 ?auto_1847797 ) ( CLEAR ?auto_1847792 ) ( IS-CRATE ?auto_1847793 ) ( not ( = ?auto_1847792 ?auto_1847793 ) ) ( AVAILABLE ?auto_1847796 ) ( ON ?auto_1847792 ?auto_1847791 ) ( not ( = ?auto_1847791 ?auto_1847792 ) ) ( not ( = ?auto_1847791 ?auto_1847793 ) ) ( TRUCK-AT ?auto_1847794 ?auto_1847795 ) ( not ( = ?auto_1847795 ?auto_1847797 ) ) ( HOIST-AT ?auto_1847798 ?auto_1847795 ) ( LIFTING ?auto_1847798 ?auto_1847793 ) ( not ( = ?auto_1847796 ?auto_1847798 ) ) ( ON ?auto_1847783 ?auto_1847782 ) ( ON ?auto_1847784 ?auto_1847783 ) ( ON ?auto_1847781 ?auto_1847784 ) ( ON ?auto_1847785 ?auto_1847781 ) ( ON ?auto_1847787 ?auto_1847785 ) ( ON ?auto_1847786 ?auto_1847787 ) ( ON ?auto_1847788 ?auto_1847786 ) ( ON ?auto_1847789 ?auto_1847788 ) ( ON ?auto_1847790 ?auto_1847789 ) ( ON ?auto_1847791 ?auto_1847790 ) ( not ( = ?auto_1847782 ?auto_1847783 ) ) ( not ( = ?auto_1847782 ?auto_1847784 ) ) ( not ( = ?auto_1847782 ?auto_1847781 ) ) ( not ( = ?auto_1847782 ?auto_1847785 ) ) ( not ( = ?auto_1847782 ?auto_1847787 ) ) ( not ( = ?auto_1847782 ?auto_1847786 ) ) ( not ( = ?auto_1847782 ?auto_1847788 ) ) ( not ( = ?auto_1847782 ?auto_1847789 ) ) ( not ( = ?auto_1847782 ?auto_1847790 ) ) ( not ( = ?auto_1847782 ?auto_1847791 ) ) ( not ( = ?auto_1847782 ?auto_1847792 ) ) ( not ( = ?auto_1847782 ?auto_1847793 ) ) ( not ( = ?auto_1847783 ?auto_1847784 ) ) ( not ( = ?auto_1847783 ?auto_1847781 ) ) ( not ( = ?auto_1847783 ?auto_1847785 ) ) ( not ( = ?auto_1847783 ?auto_1847787 ) ) ( not ( = ?auto_1847783 ?auto_1847786 ) ) ( not ( = ?auto_1847783 ?auto_1847788 ) ) ( not ( = ?auto_1847783 ?auto_1847789 ) ) ( not ( = ?auto_1847783 ?auto_1847790 ) ) ( not ( = ?auto_1847783 ?auto_1847791 ) ) ( not ( = ?auto_1847783 ?auto_1847792 ) ) ( not ( = ?auto_1847783 ?auto_1847793 ) ) ( not ( = ?auto_1847784 ?auto_1847781 ) ) ( not ( = ?auto_1847784 ?auto_1847785 ) ) ( not ( = ?auto_1847784 ?auto_1847787 ) ) ( not ( = ?auto_1847784 ?auto_1847786 ) ) ( not ( = ?auto_1847784 ?auto_1847788 ) ) ( not ( = ?auto_1847784 ?auto_1847789 ) ) ( not ( = ?auto_1847784 ?auto_1847790 ) ) ( not ( = ?auto_1847784 ?auto_1847791 ) ) ( not ( = ?auto_1847784 ?auto_1847792 ) ) ( not ( = ?auto_1847784 ?auto_1847793 ) ) ( not ( = ?auto_1847781 ?auto_1847785 ) ) ( not ( = ?auto_1847781 ?auto_1847787 ) ) ( not ( = ?auto_1847781 ?auto_1847786 ) ) ( not ( = ?auto_1847781 ?auto_1847788 ) ) ( not ( = ?auto_1847781 ?auto_1847789 ) ) ( not ( = ?auto_1847781 ?auto_1847790 ) ) ( not ( = ?auto_1847781 ?auto_1847791 ) ) ( not ( = ?auto_1847781 ?auto_1847792 ) ) ( not ( = ?auto_1847781 ?auto_1847793 ) ) ( not ( = ?auto_1847785 ?auto_1847787 ) ) ( not ( = ?auto_1847785 ?auto_1847786 ) ) ( not ( = ?auto_1847785 ?auto_1847788 ) ) ( not ( = ?auto_1847785 ?auto_1847789 ) ) ( not ( = ?auto_1847785 ?auto_1847790 ) ) ( not ( = ?auto_1847785 ?auto_1847791 ) ) ( not ( = ?auto_1847785 ?auto_1847792 ) ) ( not ( = ?auto_1847785 ?auto_1847793 ) ) ( not ( = ?auto_1847787 ?auto_1847786 ) ) ( not ( = ?auto_1847787 ?auto_1847788 ) ) ( not ( = ?auto_1847787 ?auto_1847789 ) ) ( not ( = ?auto_1847787 ?auto_1847790 ) ) ( not ( = ?auto_1847787 ?auto_1847791 ) ) ( not ( = ?auto_1847787 ?auto_1847792 ) ) ( not ( = ?auto_1847787 ?auto_1847793 ) ) ( not ( = ?auto_1847786 ?auto_1847788 ) ) ( not ( = ?auto_1847786 ?auto_1847789 ) ) ( not ( = ?auto_1847786 ?auto_1847790 ) ) ( not ( = ?auto_1847786 ?auto_1847791 ) ) ( not ( = ?auto_1847786 ?auto_1847792 ) ) ( not ( = ?auto_1847786 ?auto_1847793 ) ) ( not ( = ?auto_1847788 ?auto_1847789 ) ) ( not ( = ?auto_1847788 ?auto_1847790 ) ) ( not ( = ?auto_1847788 ?auto_1847791 ) ) ( not ( = ?auto_1847788 ?auto_1847792 ) ) ( not ( = ?auto_1847788 ?auto_1847793 ) ) ( not ( = ?auto_1847789 ?auto_1847790 ) ) ( not ( = ?auto_1847789 ?auto_1847791 ) ) ( not ( = ?auto_1847789 ?auto_1847792 ) ) ( not ( = ?auto_1847789 ?auto_1847793 ) ) ( not ( = ?auto_1847790 ?auto_1847791 ) ) ( not ( = ?auto_1847790 ?auto_1847792 ) ) ( not ( = ?auto_1847790 ?auto_1847793 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1847791 ?auto_1847792 ?auto_1847793 )
      ( MAKE-12CRATE-VERIFY ?auto_1847782 ?auto_1847783 ?auto_1847784 ?auto_1847781 ?auto_1847785 ?auto_1847787 ?auto_1847786 ?auto_1847788 ?auto_1847789 ?auto_1847790 ?auto_1847791 ?auto_1847792 ?auto_1847793 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1847944 - SURFACE
      ?auto_1847945 - SURFACE
      ?auto_1847946 - SURFACE
      ?auto_1847943 - SURFACE
      ?auto_1847947 - SURFACE
      ?auto_1847949 - SURFACE
      ?auto_1847948 - SURFACE
      ?auto_1847950 - SURFACE
      ?auto_1847951 - SURFACE
      ?auto_1847952 - SURFACE
      ?auto_1847953 - SURFACE
      ?auto_1847954 - SURFACE
      ?auto_1847955 - SURFACE
    )
    :vars
    (
      ?auto_1847960 - HOIST
      ?auto_1847959 - PLACE
      ?auto_1847957 - TRUCK
      ?auto_1847961 - PLACE
      ?auto_1847958 - HOIST
      ?auto_1847956 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1847960 ?auto_1847959 ) ( SURFACE-AT ?auto_1847954 ?auto_1847959 ) ( CLEAR ?auto_1847954 ) ( IS-CRATE ?auto_1847955 ) ( not ( = ?auto_1847954 ?auto_1847955 ) ) ( AVAILABLE ?auto_1847960 ) ( ON ?auto_1847954 ?auto_1847953 ) ( not ( = ?auto_1847953 ?auto_1847954 ) ) ( not ( = ?auto_1847953 ?auto_1847955 ) ) ( TRUCK-AT ?auto_1847957 ?auto_1847961 ) ( not ( = ?auto_1847961 ?auto_1847959 ) ) ( HOIST-AT ?auto_1847958 ?auto_1847961 ) ( not ( = ?auto_1847960 ?auto_1847958 ) ) ( AVAILABLE ?auto_1847958 ) ( SURFACE-AT ?auto_1847955 ?auto_1847961 ) ( ON ?auto_1847955 ?auto_1847956 ) ( CLEAR ?auto_1847955 ) ( not ( = ?auto_1847954 ?auto_1847956 ) ) ( not ( = ?auto_1847955 ?auto_1847956 ) ) ( not ( = ?auto_1847953 ?auto_1847956 ) ) ( ON ?auto_1847945 ?auto_1847944 ) ( ON ?auto_1847946 ?auto_1847945 ) ( ON ?auto_1847943 ?auto_1847946 ) ( ON ?auto_1847947 ?auto_1847943 ) ( ON ?auto_1847949 ?auto_1847947 ) ( ON ?auto_1847948 ?auto_1847949 ) ( ON ?auto_1847950 ?auto_1847948 ) ( ON ?auto_1847951 ?auto_1847950 ) ( ON ?auto_1847952 ?auto_1847951 ) ( ON ?auto_1847953 ?auto_1847952 ) ( not ( = ?auto_1847944 ?auto_1847945 ) ) ( not ( = ?auto_1847944 ?auto_1847946 ) ) ( not ( = ?auto_1847944 ?auto_1847943 ) ) ( not ( = ?auto_1847944 ?auto_1847947 ) ) ( not ( = ?auto_1847944 ?auto_1847949 ) ) ( not ( = ?auto_1847944 ?auto_1847948 ) ) ( not ( = ?auto_1847944 ?auto_1847950 ) ) ( not ( = ?auto_1847944 ?auto_1847951 ) ) ( not ( = ?auto_1847944 ?auto_1847952 ) ) ( not ( = ?auto_1847944 ?auto_1847953 ) ) ( not ( = ?auto_1847944 ?auto_1847954 ) ) ( not ( = ?auto_1847944 ?auto_1847955 ) ) ( not ( = ?auto_1847944 ?auto_1847956 ) ) ( not ( = ?auto_1847945 ?auto_1847946 ) ) ( not ( = ?auto_1847945 ?auto_1847943 ) ) ( not ( = ?auto_1847945 ?auto_1847947 ) ) ( not ( = ?auto_1847945 ?auto_1847949 ) ) ( not ( = ?auto_1847945 ?auto_1847948 ) ) ( not ( = ?auto_1847945 ?auto_1847950 ) ) ( not ( = ?auto_1847945 ?auto_1847951 ) ) ( not ( = ?auto_1847945 ?auto_1847952 ) ) ( not ( = ?auto_1847945 ?auto_1847953 ) ) ( not ( = ?auto_1847945 ?auto_1847954 ) ) ( not ( = ?auto_1847945 ?auto_1847955 ) ) ( not ( = ?auto_1847945 ?auto_1847956 ) ) ( not ( = ?auto_1847946 ?auto_1847943 ) ) ( not ( = ?auto_1847946 ?auto_1847947 ) ) ( not ( = ?auto_1847946 ?auto_1847949 ) ) ( not ( = ?auto_1847946 ?auto_1847948 ) ) ( not ( = ?auto_1847946 ?auto_1847950 ) ) ( not ( = ?auto_1847946 ?auto_1847951 ) ) ( not ( = ?auto_1847946 ?auto_1847952 ) ) ( not ( = ?auto_1847946 ?auto_1847953 ) ) ( not ( = ?auto_1847946 ?auto_1847954 ) ) ( not ( = ?auto_1847946 ?auto_1847955 ) ) ( not ( = ?auto_1847946 ?auto_1847956 ) ) ( not ( = ?auto_1847943 ?auto_1847947 ) ) ( not ( = ?auto_1847943 ?auto_1847949 ) ) ( not ( = ?auto_1847943 ?auto_1847948 ) ) ( not ( = ?auto_1847943 ?auto_1847950 ) ) ( not ( = ?auto_1847943 ?auto_1847951 ) ) ( not ( = ?auto_1847943 ?auto_1847952 ) ) ( not ( = ?auto_1847943 ?auto_1847953 ) ) ( not ( = ?auto_1847943 ?auto_1847954 ) ) ( not ( = ?auto_1847943 ?auto_1847955 ) ) ( not ( = ?auto_1847943 ?auto_1847956 ) ) ( not ( = ?auto_1847947 ?auto_1847949 ) ) ( not ( = ?auto_1847947 ?auto_1847948 ) ) ( not ( = ?auto_1847947 ?auto_1847950 ) ) ( not ( = ?auto_1847947 ?auto_1847951 ) ) ( not ( = ?auto_1847947 ?auto_1847952 ) ) ( not ( = ?auto_1847947 ?auto_1847953 ) ) ( not ( = ?auto_1847947 ?auto_1847954 ) ) ( not ( = ?auto_1847947 ?auto_1847955 ) ) ( not ( = ?auto_1847947 ?auto_1847956 ) ) ( not ( = ?auto_1847949 ?auto_1847948 ) ) ( not ( = ?auto_1847949 ?auto_1847950 ) ) ( not ( = ?auto_1847949 ?auto_1847951 ) ) ( not ( = ?auto_1847949 ?auto_1847952 ) ) ( not ( = ?auto_1847949 ?auto_1847953 ) ) ( not ( = ?auto_1847949 ?auto_1847954 ) ) ( not ( = ?auto_1847949 ?auto_1847955 ) ) ( not ( = ?auto_1847949 ?auto_1847956 ) ) ( not ( = ?auto_1847948 ?auto_1847950 ) ) ( not ( = ?auto_1847948 ?auto_1847951 ) ) ( not ( = ?auto_1847948 ?auto_1847952 ) ) ( not ( = ?auto_1847948 ?auto_1847953 ) ) ( not ( = ?auto_1847948 ?auto_1847954 ) ) ( not ( = ?auto_1847948 ?auto_1847955 ) ) ( not ( = ?auto_1847948 ?auto_1847956 ) ) ( not ( = ?auto_1847950 ?auto_1847951 ) ) ( not ( = ?auto_1847950 ?auto_1847952 ) ) ( not ( = ?auto_1847950 ?auto_1847953 ) ) ( not ( = ?auto_1847950 ?auto_1847954 ) ) ( not ( = ?auto_1847950 ?auto_1847955 ) ) ( not ( = ?auto_1847950 ?auto_1847956 ) ) ( not ( = ?auto_1847951 ?auto_1847952 ) ) ( not ( = ?auto_1847951 ?auto_1847953 ) ) ( not ( = ?auto_1847951 ?auto_1847954 ) ) ( not ( = ?auto_1847951 ?auto_1847955 ) ) ( not ( = ?auto_1847951 ?auto_1847956 ) ) ( not ( = ?auto_1847952 ?auto_1847953 ) ) ( not ( = ?auto_1847952 ?auto_1847954 ) ) ( not ( = ?auto_1847952 ?auto_1847955 ) ) ( not ( = ?auto_1847952 ?auto_1847956 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1847953 ?auto_1847954 ?auto_1847955 )
      ( MAKE-12CRATE-VERIFY ?auto_1847944 ?auto_1847945 ?auto_1847946 ?auto_1847943 ?auto_1847947 ?auto_1847949 ?auto_1847948 ?auto_1847950 ?auto_1847951 ?auto_1847952 ?auto_1847953 ?auto_1847954 ?auto_1847955 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1848107 - SURFACE
      ?auto_1848108 - SURFACE
      ?auto_1848109 - SURFACE
      ?auto_1848106 - SURFACE
      ?auto_1848110 - SURFACE
      ?auto_1848112 - SURFACE
      ?auto_1848111 - SURFACE
      ?auto_1848113 - SURFACE
      ?auto_1848114 - SURFACE
      ?auto_1848115 - SURFACE
      ?auto_1848116 - SURFACE
      ?auto_1848117 - SURFACE
      ?auto_1848118 - SURFACE
    )
    :vars
    (
      ?auto_1848120 - HOIST
      ?auto_1848121 - PLACE
      ?auto_1848124 - PLACE
      ?auto_1848123 - HOIST
      ?auto_1848122 - SURFACE
      ?auto_1848119 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1848120 ?auto_1848121 ) ( SURFACE-AT ?auto_1848117 ?auto_1848121 ) ( CLEAR ?auto_1848117 ) ( IS-CRATE ?auto_1848118 ) ( not ( = ?auto_1848117 ?auto_1848118 ) ) ( AVAILABLE ?auto_1848120 ) ( ON ?auto_1848117 ?auto_1848116 ) ( not ( = ?auto_1848116 ?auto_1848117 ) ) ( not ( = ?auto_1848116 ?auto_1848118 ) ) ( not ( = ?auto_1848124 ?auto_1848121 ) ) ( HOIST-AT ?auto_1848123 ?auto_1848124 ) ( not ( = ?auto_1848120 ?auto_1848123 ) ) ( AVAILABLE ?auto_1848123 ) ( SURFACE-AT ?auto_1848118 ?auto_1848124 ) ( ON ?auto_1848118 ?auto_1848122 ) ( CLEAR ?auto_1848118 ) ( not ( = ?auto_1848117 ?auto_1848122 ) ) ( not ( = ?auto_1848118 ?auto_1848122 ) ) ( not ( = ?auto_1848116 ?auto_1848122 ) ) ( TRUCK-AT ?auto_1848119 ?auto_1848121 ) ( ON ?auto_1848108 ?auto_1848107 ) ( ON ?auto_1848109 ?auto_1848108 ) ( ON ?auto_1848106 ?auto_1848109 ) ( ON ?auto_1848110 ?auto_1848106 ) ( ON ?auto_1848112 ?auto_1848110 ) ( ON ?auto_1848111 ?auto_1848112 ) ( ON ?auto_1848113 ?auto_1848111 ) ( ON ?auto_1848114 ?auto_1848113 ) ( ON ?auto_1848115 ?auto_1848114 ) ( ON ?auto_1848116 ?auto_1848115 ) ( not ( = ?auto_1848107 ?auto_1848108 ) ) ( not ( = ?auto_1848107 ?auto_1848109 ) ) ( not ( = ?auto_1848107 ?auto_1848106 ) ) ( not ( = ?auto_1848107 ?auto_1848110 ) ) ( not ( = ?auto_1848107 ?auto_1848112 ) ) ( not ( = ?auto_1848107 ?auto_1848111 ) ) ( not ( = ?auto_1848107 ?auto_1848113 ) ) ( not ( = ?auto_1848107 ?auto_1848114 ) ) ( not ( = ?auto_1848107 ?auto_1848115 ) ) ( not ( = ?auto_1848107 ?auto_1848116 ) ) ( not ( = ?auto_1848107 ?auto_1848117 ) ) ( not ( = ?auto_1848107 ?auto_1848118 ) ) ( not ( = ?auto_1848107 ?auto_1848122 ) ) ( not ( = ?auto_1848108 ?auto_1848109 ) ) ( not ( = ?auto_1848108 ?auto_1848106 ) ) ( not ( = ?auto_1848108 ?auto_1848110 ) ) ( not ( = ?auto_1848108 ?auto_1848112 ) ) ( not ( = ?auto_1848108 ?auto_1848111 ) ) ( not ( = ?auto_1848108 ?auto_1848113 ) ) ( not ( = ?auto_1848108 ?auto_1848114 ) ) ( not ( = ?auto_1848108 ?auto_1848115 ) ) ( not ( = ?auto_1848108 ?auto_1848116 ) ) ( not ( = ?auto_1848108 ?auto_1848117 ) ) ( not ( = ?auto_1848108 ?auto_1848118 ) ) ( not ( = ?auto_1848108 ?auto_1848122 ) ) ( not ( = ?auto_1848109 ?auto_1848106 ) ) ( not ( = ?auto_1848109 ?auto_1848110 ) ) ( not ( = ?auto_1848109 ?auto_1848112 ) ) ( not ( = ?auto_1848109 ?auto_1848111 ) ) ( not ( = ?auto_1848109 ?auto_1848113 ) ) ( not ( = ?auto_1848109 ?auto_1848114 ) ) ( not ( = ?auto_1848109 ?auto_1848115 ) ) ( not ( = ?auto_1848109 ?auto_1848116 ) ) ( not ( = ?auto_1848109 ?auto_1848117 ) ) ( not ( = ?auto_1848109 ?auto_1848118 ) ) ( not ( = ?auto_1848109 ?auto_1848122 ) ) ( not ( = ?auto_1848106 ?auto_1848110 ) ) ( not ( = ?auto_1848106 ?auto_1848112 ) ) ( not ( = ?auto_1848106 ?auto_1848111 ) ) ( not ( = ?auto_1848106 ?auto_1848113 ) ) ( not ( = ?auto_1848106 ?auto_1848114 ) ) ( not ( = ?auto_1848106 ?auto_1848115 ) ) ( not ( = ?auto_1848106 ?auto_1848116 ) ) ( not ( = ?auto_1848106 ?auto_1848117 ) ) ( not ( = ?auto_1848106 ?auto_1848118 ) ) ( not ( = ?auto_1848106 ?auto_1848122 ) ) ( not ( = ?auto_1848110 ?auto_1848112 ) ) ( not ( = ?auto_1848110 ?auto_1848111 ) ) ( not ( = ?auto_1848110 ?auto_1848113 ) ) ( not ( = ?auto_1848110 ?auto_1848114 ) ) ( not ( = ?auto_1848110 ?auto_1848115 ) ) ( not ( = ?auto_1848110 ?auto_1848116 ) ) ( not ( = ?auto_1848110 ?auto_1848117 ) ) ( not ( = ?auto_1848110 ?auto_1848118 ) ) ( not ( = ?auto_1848110 ?auto_1848122 ) ) ( not ( = ?auto_1848112 ?auto_1848111 ) ) ( not ( = ?auto_1848112 ?auto_1848113 ) ) ( not ( = ?auto_1848112 ?auto_1848114 ) ) ( not ( = ?auto_1848112 ?auto_1848115 ) ) ( not ( = ?auto_1848112 ?auto_1848116 ) ) ( not ( = ?auto_1848112 ?auto_1848117 ) ) ( not ( = ?auto_1848112 ?auto_1848118 ) ) ( not ( = ?auto_1848112 ?auto_1848122 ) ) ( not ( = ?auto_1848111 ?auto_1848113 ) ) ( not ( = ?auto_1848111 ?auto_1848114 ) ) ( not ( = ?auto_1848111 ?auto_1848115 ) ) ( not ( = ?auto_1848111 ?auto_1848116 ) ) ( not ( = ?auto_1848111 ?auto_1848117 ) ) ( not ( = ?auto_1848111 ?auto_1848118 ) ) ( not ( = ?auto_1848111 ?auto_1848122 ) ) ( not ( = ?auto_1848113 ?auto_1848114 ) ) ( not ( = ?auto_1848113 ?auto_1848115 ) ) ( not ( = ?auto_1848113 ?auto_1848116 ) ) ( not ( = ?auto_1848113 ?auto_1848117 ) ) ( not ( = ?auto_1848113 ?auto_1848118 ) ) ( not ( = ?auto_1848113 ?auto_1848122 ) ) ( not ( = ?auto_1848114 ?auto_1848115 ) ) ( not ( = ?auto_1848114 ?auto_1848116 ) ) ( not ( = ?auto_1848114 ?auto_1848117 ) ) ( not ( = ?auto_1848114 ?auto_1848118 ) ) ( not ( = ?auto_1848114 ?auto_1848122 ) ) ( not ( = ?auto_1848115 ?auto_1848116 ) ) ( not ( = ?auto_1848115 ?auto_1848117 ) ) ( not ( = ?auto_1848115 ?auto_1848118 ) ) ( not ( = ?auto_1848115 ?auto_1848122 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1848116 ?auto_1848117 ?auto_1848118 )
      ( MAKE-12CRATE-VERIFY ?auto_1848107 ?auto_1848108 ?auto_1848109 ?auto_1848106 ?auto_1848110 ?auto_1848112 ?auto_1848111 ?auto_1848113 ?auto_1848114 ?auto_1848115 ?auto_1848116 ?auto_1848117 ?auto_1848118 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1848270 - SURFACE
      ?auto_1848271 - SURFACE
      ?auto_1848272 - SURFACE
      ?auto_1848269 - SURFACE
      ?auto_1848273 - SURFACE
      ?auto_1848275 - SURFACE
      ?auto_1848274 - SURFACE
      ?auto_1848276 - SURFACE
      ?auto_1848277 - SURFACE
      ?auto_1848278 - SURFACE
      ?auto_1848279 - SURFACE
      ?auto_1848280 - SURFACE
      ?auto_1848281 - SURFACE
    )
    :vars
    (
      ?auto_1848285 - HOIST
      ?auto_1848287 - PLACE
      ?auto_1848283 - PLACE
      ?auto_1848286 - HOIST
      ?auto_1848282 - SURFACE
      ?auto_1848284 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1848285 ?auto_1848287 ) ( IS-CRATE ?auto_1848281 ) ( not ( = ?auto_1848280 ?auto_1848281 ) ) ( not ( = ?auto_1848279 ?auto_1848280 ) ) ( not ( = ?auto_1848279 ?auto_1848281 ) ) ( not ( = ?auto_1848283 ?auto_1848287 ) ) ( HOIST-AT ?auto_1848286 ?auto_1848283 ) ( not ( = ?auto_1848285 ?auto_1848286 ) ) ( AVAILABLE ?auto_1848286 ) ( SURFACE-AT ?auto_1848281 ?auto_1848283 ) ( ON ?auto_1848281 ?auto_1848282 ) ( CLEAR ?auto_1848281 ) ( not ( = ?auto_1848280 ?auto_1848282 ) ) ( not ( = ?auto_1848281 ?auto_1848282 ) ) ( not ( = ?auto_1848279 ?auto_1848282 ) ) ( TRUCK-AT ?auto_1848284 ?auto_1848287 ) ( SURFACE-AT ?auto_1848279 ?auto_1848287 ) ( CLEAR ?auto_1848279 ) ( LIFTING ?auto_1848285 ?auto_1848280 ) ( IS-CRATE ?auto_1848280 ) ( ON ?auto_1848271 ?auto_1848270 ) ( ON ?auto_1848272 ?auto_1848271 ) ( ON ?auto_1848269 ?auto_1848272 ) ( ON ?auto_1848273 ?auto_1848269 ) ( ON ?auto_1848275 ?auto_1848273 ) ( ON ?auto_1848274 ?auto_1848275 ) ( ON ?auto_1848276 ?auto_1848274 ) ( ON ?auto_1848277 ?auto_1848276 ) ( ON ?auto_1848278 ?auto_1848277 ) ( ON ?auto_1848279 ?auto_1848278 ) ( not ( = ?auto_1848270 ?auto_1848271 ) ) ( not ( = ?auto_1848270 ?auto_1848272 ) ) ( not ( = ?auto_1848270 ?auto_1848269 ) ) ( not ( = ?auto_1848270 ?auto_1848273 ) ) ( not ( = ?auto_1848270 ?auto_1848275 ) ) ( not ( = ?auto_1848270 ?auto_1848274 ) ) ( not ( = ?auto_1848270 ?auto_1848276 ) ) ( not ( = ?auto_1848270 ?auto_1848277 ) ) ( not ( = ?auto_1848270 ?auto_1848278 ) ) ( not ( = ?auto_1848270 ?auto_1848279 ) ) ( not ( = ?auto_1848270 ?auto_1848280 ) ) ( not ( = ?auto_1848270 ?auto_1848281 ) ) ( not ( = ?auto_1848270 ?auto_1848282 ) ) ( not ( = ?auto_1848271 ?auto_1848272 ) ) ( not ( = ?auto_1848271 ?auto_1848269 ) ) ( not ( = ?auto_1848271 ?auto_1848273 ) ) ( not ( = ?auto_1848271 ?auto_1848275 ) ) ( not ( = ?auto_1848271 ?auto_1848274 ) ) ( not ( = ?auto_1848271 ?auto_1848276 ) ) ( not ( = ?auto_1848271 ?auto_1848277 ) ) ( not ( = ?auto_1848271 ?auto_1848278 ) ) ( not ( = ?auto_1848271 ?auto_1848279 ) ) ( not ( = ?auto_1848271 ?auto_1848280 ) ) ( not ( = ?auto_1848271 ?auto_1848281 ) ) ( not ( = ?auto_1848271 ?auto_1848282 ) ) ( not ( = ?auto_1848272 ?auto_1848269 ) ) ( not ( = ?auto_1848272 ?auto_1848273 ) ) ( not ( = ?auto_1848272 ?auto_1848275 ) ) ( not ( = ?auto_1848272 ?auto_1848274 ) ) ( not ( = ?auto_1848272 ?auto_1848276 ) ) ( not ( = ?auto_1848272 ?auto_1848277 ) ) ( not ( = ?auto_1848272 ?auto_1848278 ) ) ( not ( = ?auto_1848272 ?auto_1848279 ) ) ( not ( = ?auto_1848272 ?auto_1848280 ) ) ( not ( = ?auto_1848272 ?auto_1848281 ) ) ( not ( = ?auto_1848272 ?auto_1848282 ) ) ( not ( = ?auto_1848269 ?auto_1848273 ) ) ( not ( = ?auto_1848269 ?auto_1848275 ) ) ( not ( = ?auto_1848269 ?auto_1848274 ) ) ( not ( = ?auto_1848269 ?auto_1848276 ) ) ( not ( = ?auto_1848269 ?auto_1848277 ) ) ( not ( = ?auto_1848269 ?auto_1848278 ) ) ( not ( = ?auto_1848269 ?auto_1848279 ) ) ( not ( = ?auto_1848269 ?auto_1848280 ) ) ( not ( = ?auto_1848269 ?auto_1848281 ) ) ( not ( = ?auto_1848269 ?auto_1848282 ) ) ( not ( = ?auto_1848273 ?auto_1848275 ) ) ( not ( = ?auto_1848273 ?auto_1848274 ) ) ( not ( = ?auto_1848273 ?auto_1848276 ) ) ( not ( = ?auto_1848273 ?auto_1848277 ) ) ( not ( = ?auto_1848273 ?auto_1848278 ) ) ( not ( = ?auto_1848273 ?auto_1848279 ) ) ( not ( = ?auto_1848273 ?auto_1848280 ) ) ( not ( = ?auto_1848273 ?auto_1848281 ) ) ( not ( = ?auto_1848273 ?auto_1848282 ) ) ( not ( = ?auto_1848275 ?auto_1848274 ) ) ( not ( = ?auto_1848275 ?auto_1848276 ) ) ( not ( = ?auto_1848275 ?auto_1848277 ) ) ( not ( = ?auto_1848275 ?auto_1848278 ) ) ( not ( = ?auto_1848275 ?auto_1848279 ) ) ( not ( = ?auto_1848275 ?auto_1848280 ) ) ( not ( = ?auto_1848275 ?auto_1848281 ) ) ( not ( = ?auto_1848275 ?auto_1848282 ) ) ( not ( = ?auto_1848274 ?auto_1848276 ) ) ( not ( = ?auto_1848274 ?auto_1848277 ) ) ( not ( = ?auto_1848274 ?auto_1848278 ) ) ( not ( = ?auto_1848274 ?auto_1848279 ) ) ( not ( = ?auto_1848274 ?auto_1848280 ) ) ( not ( = ?auto_1848274 ?auto_1848281 ) ) ( not ( = ?auto_1848274 ?auto_1848282 ) ) ( not ( = ?auto_1848276 ?auto_1848277 ) ) ( not ( = ?auto_1848276 ?auto_1848278 ) ) ( not ( = ?auto_1848276 ?auto_1848279 ) ) ( not ( = ?auto_1848276 ?auto_1848280 ) ) ( not ( = ?auto_1848276 ?auto_1848281 ) ) ( not ( = ?auto_1848276 ?auto_1848282 ) ) ( not ( = ?auto_1848277 ?auto_1848278 ) ) ( not ( = ?auto_1848277 ?auto_1848279 ) ) ( not ( = ?auto_1848277 ?auto_1848280 ) ) ( not ( = ?auto_1848277 ?auto_1848281 ) ) ( not ( = ?auto_1848277 ?auto_1848282 ) ) ( not ( = ?auto_1848278 ?auto_1848279 ) ) ( not ( = ?auto_1848278 ?auto_1848280 ) ) ( not ( = ?auto_1848278 ?auto_1848281 ) ) ( not ( = ?auto_1848278 ?auto_1848282 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1848279 ?auto_1848280 ?auto_1848281 )
      ( MAKE-12CRATE-VERIFY ?auto_1848270 ?auto_1848271 ?auto_1848272 ?auto_1848269 ?auto_1848273 ?auto_1848275 ?auto_1848274 ?auto_1848276 ?auto_1848277 ?auto_1848278 ?auto_1848279 ?auto_1848280 ?auto_1848281 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1848433 - SURFACE
      ?auto_1848434 - SURFACE
      ?auto_1848435 - SURFACE
      ?auto_1848432 - SURFACE
      ?auto_1848436 - SURFACE
      ?auto_1848438 - SURFACE
      ?auto_1848437 - SURFACE
      ?auto_1848439 - SURFACE
      ?auto_1848440 - SURFACE
      ?auto_1848441 - SURFACE
      ?auto_1848442 - SURFACE
      ?auto_1848443 - SURFACE
      ?auto_1848444 - SURFACE
    )
    :vars
    (
      ?auto_1848450 - HOIST
      ?auto_1848449 - PLACE
      ?auto_1848445 - PLACE
      ?auto_1848446 - HOIST
      ?auto_1848447 - SURFACE
      ?auto_1848448 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1848450 ?auto_1848449 ) ( IS-CRATE ?auto_1848444 ) ( not ( = ?auto_1848443 ?auto_1848444 ) ) ( not ( = ?auto_1848442 ?auto_1848443 ) ) ( not ( = ?auto_1848442 ?auto_1848444 ) ) ( not ( = ?auto_1848445 ?auto_1848449 ) ) ( HOIST-AT ?auto_1848446 ?auto_1848445 ) ( not ( = ?auto_1848450 ?auto_1848446 ) ) ( AVAILABLE ?auto_1848446 ) ( SURFACE-AT ?auto_1848444 ?auto_1848445 ) ( ON ?auto_1848444 ?auto_1848447 ) ( CLEAR ?auto_1848444 ) ( not ( = ?auto_1848443 ?auto_1848447 ) ) ( not ( = ?auto_1848444 ?auto_1848447 ) ) ( not ( = ?auto_1848442 ?auto_1848447 ) ) ( TRUCK-AT ?auto_1848448 ?auto_1848449 ) ( SURFACE-AT ?auto_1848442 ?auto_1848449 ) ( CLEAR ?auto_1848442 ) ( IS-CRATE ?auto_1848443 ) ( AVAILABLE ?auto_1848450 ) ( IN ?auto_1848443 ?auto_1848448 ) ( ON ?auto_1848434 ?auto_1848433 ) ( ON ?auto_1848435 ?auto_1848434 ) ( ON ?auto_1848432 ?auto_1848435 ) ( ON ?auto_1848436 ?auto_1848432 ) ( ON ?auto_1848438 ?auto_1848436 ) ( ON ?auto_1848437 ?auto_1848438 ) ( ON ?auto_1848439 ?auto_1848437 ) ( ON ?auto_1848440 ?auto_1848439 ) ( ON ?auto_1848441 ?auto_1848440 ) ( ON ?auto_1848442 ?auto_1848441 ) ( not ( = ?auto_1848433 ?auto_1848434 ) ) ( not ( = ?auto_1848433 ?auto_1848435 ) ) ( not ( = ?auto_1848433 ?auto_1848432 ) ) ( not ( = ?auto_1848433 ?auto_1848436 ) ) ( not ( = ?auto_1848433 ?auto_1848438 ) ) ( not ( = ?auto_1848433 ?auto_1848437 ) ) ( not ( = ?auto_1848433 ?auto_1848439 ) ) ( not ( = ?auto_1848433 ?auto_1848440 ) ) ( not ( = ?auto_1848433 ?auto_1848441 ) ) ( not ( = ?auto_1848433 ?auto_1848442 ) ) ( not ( = ?auto_1848433 ?auto_1848443 ) ) ( not ( = ?auto_1848433 ?auto_1848444 ) ) ( not ( = ?auto_1848433 ?auto_1848447 ) ) ( not ( = ?auto_1848434 ?auto_1848435 ) ) ( not ( = ?auto_1848434 ?auto_1848432 ) ) ( not ( = ?auto_1848434 ?auto_1848436 ) ) ( not ( = ?auto_1848434 ?auto_1848438 ) ) ( not ( = ?auto_1848434 ?auto_1848437 ) ) ( not ( = ?auto_1848434 ?auto_1848439 ) ) ( not ( = ?auto_1848434 ?auto_1848440 ) ) ( not ( = ?auto_1848434 ?auto_1848441 ) ) ( not ( = ?auto_1848434 ?auto_1848442 ) ) ( not ( = ?auto_1848434 ?auto_1848443 ) ) ( not ( = ?auto_1848434 ?auto_1848444 ) ) ( not ( = ?auto_1848434 ?auto_1848447 ) ) ( not ( = ?auto_1848435 ?auto_1848432 ) ) ( not ( = ?auto_1848435 ?auto_1848436 ) ) ( not ( = ?auto_1848435 ?auto_1848438 ) ) ( not ( = ?auto_1848435 ?auto_1848437 ) ) ( not ( = ?auto_1848435 ?auto_1848439 ) ) ( not ( = ?auto_1848435 ?auto_1848440 ) ) ( not ( = ?auto_1848435 ?auto_1848441 ) ) ( not ( = ?auto_1848435 ?auto_1848442 ) ) ( not ( = ?auto_1848435 ?auto_1848443 ) ) ( not ( = ?auto_1848435 ?auto_1848444 ) ) ( not ( = ?auto_1848435 ?auto_1848447 ) ) ( not ( = ?auto_1848432 ?auto_1848436 ) ) ( not ( = ?auto_1848432 ?auto_1848438 ) ) ( not ( = ?auto_1848432 ?auto_1848437 ) ) ( not ( = ?auto_1848432 ?auto_1848439 ) ) ( not ( = ?auto_1848432 ?auto_1848440 ) ) ( not ( = ?auto_1848432 ?auto_1848441 ) ) ( not ( = ?auto_1848432 ?auto_1848442 ) ) ( not ( = ?auto_1848432 ?auto_1848443 ) ) ( not ( = ?auto_1848432 ?auto_1848444 ) ) ( not ( = ?auto_1848432 ?auto_1848447 ) ) ( not ( = ?auto_1848436 ?auto_1848438 ) ) ( not ( = ?auto_1848436 ?auto_1848437 ) ) ( not ( = ?auto_1848436 ?auto_1848439 ) ) ( not ( = ?auto_1848436 ?auto_1848440 ) ) ( not ( = ?auto_1848436 ?auto_1848441 ) ) ( not ( = ?auto_1848436 ?auto_1848442 ) ) ( not ( = ?auto_1848436 ?auto_1848443 ) ) ( not ( = ?auto_1848436 ?auto_1848444 ) ) ( not ( = ?auto_1848436 ?auto_1848447 ) ) ( not ( = ?auto_1848438 ?auto_1848437 ) ) ( not ( = ?auto_1848438 ?auto_1848439 ) ) ( not ( = ?auto_1848438 ?auto_1848440 ) ) ( not ( = ?auto_1848438 ?auto_1848441 ) ) ( not ( = ?auto_1848438 ?auto_1848442 ) ) ( not ( = ?auto_1848438 ?auto_1848443 ) ) ( not ( = ?auto_1848438 ?auto_1848444 ) ) ( not ( = ?auto_1848438 ?auto_1848447 ) ) ( not ( = ?auto_1848437 ?auto_1848439 ) ) ( not ( = ?auto_1848437 ?auto_1848440 ) ) ( not ( = ?auto_1848437 ?auto_1848441 ) ) ( not ( = ?auto_1848437 ?auto_1848442 ) ) ( not ( = ?auto_1848437 ?auto_1848443 ) ) ( not ( = ?auto_1848437 ?auto_1848444 ) ) ( not ( = ?auto_1848437 ?auto_1848447 ) ) ( not ( = ?auto_1848439 ?auto_1848440 ) ) ( not ( = ?auto_1848439 ?auto_1848441 ) ) ( not ( = ?auto_1848439 ?auto_1848442 ) ) ( not ( = ?auto_1848439 ?auto_1848443 ) ) ( not ( = ?auto_1848439 ?auto_1848444 ) ) ( not ( = ?auto_1848439 ?auto_1848447 ) ) ( not ( = ?auto_1848440 ?auto_1848441 ) ) ( not ( = ?auto_1848440 ?auto_1848442 ) ) ( not ( = ?auto_1848440 ?auto_1848443 ) ) ( not ( = ?auto_1848440 ?auto_1848444 ) ) ( not ( = ?auto_1848440 ?auto_1848447 ) ) ( not ( = ?auto_1848441 ?auto_1848442 ) ) ( not ( = ?auto_1848441 ?auto_1848443 ) ) ( not ( = ?auto_1848441 ?auto_1848444 ) ) ( not ( = ?auto_1848441 ?auto_1848447 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1848442 ?auto_1848443 ?auto_1848444 )
      ( MAKE-12CRATE-VERIFY ?auto_1848433 ?auto_1848434 ?auto_1848435 ?auto_1848432 ?auto_1848436 ?auto_1848438 ?auto_1848437 ?auto_1848439 ?auto_1848440 ?auto_1848441 ?auto_1848442 ?auto_1848443 ?auto_1848444 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1860014 - SURFACE
      ?auto_1860015 - SURFACE
      ?auto_1860016 - SURFACE
      ?auto_1860013 - SURFACE
      ?auto_1860017 - SURFACE
      ?auto_1860019 - SURFACE
      ?auto_1860018 - SURFACE
      ?auto_1860020 - SURFACE
      ?auto_1860021 - SURFACE
      ?auto_1860022 - SURFACE
      ?auto_1860023 - SURFACE
      ?auto_1860024 - SURFACE
      ?auto_1860025 - SURFACE
      ?auto_1860026 - SURFACE
    )
    :vars
    (
      ?auto_1860027 - HOIST
      ?auto_1860028 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1860027 ?auto_1860028 ) ( SURFACE-AT ?auto_1860025 ?auto_1860028 ) ( CLEAR ?auto_1860025 ) ( LIFTING ?auto_1860027 ?auto_1860026 ) ( IS-CRATE ?auto_1860026 ) ( not ( = ?auto_1860025 ?auto_1860026 ) ) ( ON ?auto_1860015 ?auto_1860014 ) ( ON ?auto_1860016 ?auto_1860015 ) ( ON ?auto_1860013 ?auto_1860016 ) ( ON ?auto_1860017 ?auto_1860013 ) ( ON ?auto_1860019 ?auto_1860017 ) ( ON ?auto_1860018 ?auto_1860019 ) ( ON ?auto_1860020 ?auto_1860018 ) ( ON ?auto_1860021 ?auto_1860020 ) ( ON ?auto_1860022 ?auto_1860021 ) ( ON ?auto_1860023 ?auto_1860022 ) ( ON ?auto_1860024 ?auto_1860023 ) ( ON ?auto_1860025 ?auto_1860024 ) ( not ( = ?auto_1860014 ?auto_1860015 ) ) ( not ( = ?auto_1860014 ?auto_1860016 ) ) ( not ( = ?auto_1860014 ?auto_1860013 ) ) ( not ( = ?auto_1860014 ?auto_1860017 ) ) ( not ( = ?auto_1860014 ?auto_1860019 ) ) ( not ( = ?auto_1860014 ?auto_1860018 ) ) ( not ( = ?auto_1860014 ?auto_1860020 ) ) ( not ( = ?auto_1860014 ?auto_1860021 ) ) ( not ( = ?auto_1860014 ?auto_1860022 ) ) ( not ( = ?auto_1860014 ?auto_1860023 ) ) ( not ( = ?auto_1860014 ?auto_1860024 ) ) ( not ( = ?auto_1860014 ?auto_1860025 ) ) ( not ( = ?auto_1860014 ?auto_1860026 ) ) ( not ( = ?auto_1860015 ?auto_1860016 ) ) ( not ( = ?auto_1860015 ?auto_1860013 ) ) ( not ( = ?auto_1860015 ?auto_1860017 ) ) ( not ( = ?auto_1860015 ?auto_1860019 ) ) ( not ( = ?auto_1860015 ?auto_1860018 ) ) ( not ( = ?auto_1860015 ?auto_1860020 ) ) ( not ( = ?auto_1860015 ?auto_1860021 ) ) ( not ( = ?auto_1860015 ?auto_1860022 ) ) ( not ( = ?auto_1860015 ?auto_1860023 ) ) ( not ( = ?auto_1860015 ?auto_1860024 ) ) ( not ( = ?auto_1860015 ?auto_1860025 ) ) ( not ( = ?auto_1860015 ?auto_1860026 ) ) ( not ( = ?auto_1860016 ?auto_1860013 ) ) ( not ( = ?auto_1860016 ?auto_1860017 ) ) ( not ( = ?auto_1860016 ?auto_1860019 ) ) ( not ( = ?auto_1860016 ?auto_1860018 ) ) ( not ( = ?auto_1860016 ?auto_1860020 ) ) ( not ( = ?auto_1860016 ?auto_1860021 ) ) ( not ( = ?auto_1860016 ?auto_1860022 ) ) ( not ( = ?auto_1860016 ?auto_1860023 ) ) ( not ( = ?auto_1860016 ?auto_1860024 ) ) ( not ( = ?auto_1860016 ?auto_1860025 ) ) ( not ( = ?auto_1860016 ?auto_1860026 ) ) ( not ( = ?auto_1860013 ?auto_1860017 ) ) ( not ( = ?auto_1860013 ?auto_1860019 ) ) ( not ( = ?auto_1860013 ?auto_1860018 ) ) ( not ( = ?auto_1860013 ?auto_1860020 ) ) ( not ( = ?auto_1860013 ?auto_1860021 ) ) ( not ( = ?auto_1860013 ?auto_1860022 ) ) ( not ( = ?auto_1860013 ?auto_1860023 ) ) ( not ( = ?auto_1860013 ?auto_1860024 ) ) ( not ( = ?auto_1860013 ?auto_1860025 ) ) ( not ( = ?auto_1860013 ?auto_1860026 ) ) ( not ( = ?auto_1860017 ?auto_1860019 ) ) ( not ( = ?auto_1860017 ?auto_1860018 ) ) ( not ( = ?auto_1860017 ?auto_1860020 ) ) ( not ( = ?auto_1860017 ?auto_1860021 ) ) ( not ( = ?auto_1860017 ?auto_1860022 ) ) ( not ( = ?auto_1860017 ?auto_1860023 ) ) ( not ( = ?auto_1860017 ?auto_1860024 ) ) ( not ( = ?auto_1860017 ?auto_1860025 ) ) ( not ( = ?auto_1860017 ?auto_1860026 ) ) ( not ( = ?auto_1860019 ?auto_1860018 ) ) ( not ( = ?auto_1860019 ?auto_1860020 ) ) ( not ( = ?auto_1860019 ?auto_1860021 ) ) ( not ( = ?auto_1860019 ?auto_1860022 ) ) ( not ( = ?auto_1860019 ?auto_1860023 ) ) ( not ( = ?auto_1860019 ?auto_1860024 ) ) ( not ( = ?auto_1860019 ?auto_1860025 ) ) ( not ( = ?auto_1860019 ?auto_1860026 ) ) ( not ( = ?auto_1860018 ?auto_1860020 ) ) ( not ( = ?auto_1860018 ?auto_1860021 ) ) ( not ( = ?auto_1860018 ?auto_1860022 ) ) ( not ( = ?auto_1860018 ?auto_1860023 ) ) ( not ( = ?auto_1860018 ?auto_1860024 ) ) ( not ( = ?auto_1860018 ?auto_1860025 ) ) ( not ( = ?auto_1860018 ?auto_1860026 ) ) ( not ( = ?auto_1860020 ?auto_1860021 ) ) ( not ( = ?auto_1860020 ?auto_1860022 ) ) ( not ( = ?auto_1860020 ?auto_1860023 ) ) ( not ( = ?auto_1860020 ?auto_1860024 ) ) ( not ( = ?auto_1860020 ?auto_1860025 ) ) ( not ( = ?auto_1860020 ?auto_1860026 ) ) ( not ( = ?auto_1860021 ?auto_1860022 ) ) ( not ( = ?auto_1860021 ?auto_1860023 ) ) ( not ( = ?auto_1860021 ?auto_1860024 ) ) ( not ( = ?auto_1860021 ?auto_1860025 ) ) ( not ( = ?auto_1860021 ?auto_1860026 ) ) ( not ( = ?auto_1860022 ?auto_1860023 ) ) ( not ( = ?auto_1860022 ?auto_1860024 ) ) ( not ( = ?auto_1860022 ?auto_1860025 ) ) ( not ( = ?auto_1860022 ?auto_1860026 ) ) ( not ( = ?auto_1860023 ?auto_1860024 ) ) ( not ( = ?auto_1860023 ?auto_1860025 ) ) ( not ( = ?auto_1860023 ?auto_1860026 ) ) ( not ( = ?auto_1860024 ?auto_1860025 ) ) ( not ( = ?auto_1860024 ?auto_1860026 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1860025 ?auto_1860026 )
      ( MAKE-13CRATE-VERIFY ?auto_1860014 ?auto_1860015 ?auto_1860016 ?auto_1860013 ?auto_1860017 ?auto_1860019 ?auto_1860018 ?auto_1860020 ?auto_1860021 ?auto_1860022 ?auto_1860023 ?auto_1860024 ?auto_1860025 ?auto_1860026 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1860156 - SURFACE
      ?auto_1860157 - SURFACE
      ?auto_1860158 - SURFACE
      ?auto_1860155 - SURFACE
      ?auto_1860159 - SURFACE
      ?auto_1860161 - SURFACE
      ?auto_1860160 - SURFACE
      ?auto_1860162 - SURFACE
      ?auto_1860163 - SURFACE
      ?auto_1860164 - SURFACE
      ?auto_1860165 - SURFACE
      ?auto_1860166 - SURFACE
      ?auto_1860167 - SURFACE
      ?auto_1860168 - SURFACE
    )
    :vars
    (
      ?auto_1860170 - HOIST
      ?auto_1860171 - PLACE
      ?auto_1860169 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1860170 ?auto_1860171 ) ( SURFACE-AT ?auto_1860167 ?auto_1860171 ) ( CLEAR ?auto_1860167 ) ( IS-CRATE ?auto_1860168 ) ( not ( = ?auto_1860167 ?auto_1860168 ) ) ( TRUCK-AT ?auto_1860169 ?auto_1860171 ) ( AVAILABLE ?auto_1860170 ) ( IN ?auto_1860168 ?auto_1860169 ) ( ON ?auto_1860167 ?auto_1860166 ) ( not ( = ?auto_1860166 ?auto_1860167 ) ) ( not ( = ?auto_1860166 ?auto_1860168 ) ) ( ON ?auto_1860157 ?auto_1860156 ) ( ON ?auto_1860158 ?auto_1860157 ) ( ON ?auto_1860155 ?auto_1860158 ) ( ON ?auto_1860159 ?auto_1860155 ) ( ON ?auto_1860161 ?auto_1860159 ) ( ON ?auto_1860160 ?auto_1860161 ) ( ON ?auto_1860162 ?auto_1860160 ) ( ON ?auto_1860163 ?auto_1860162 ) ( ON ?auto_1860164 ?auto_1860163 ) ( ON ?auto_1860165 ?auto_1860164 ) ( ON ?auto_1860166 ?auto_1860165 ) ( not ( = ?auto_1860156 ?auto_1860157 ) ) ( not ( = ?auto_1860156 ?auto_1860158 ) ) ( not ( = ?auto_1860156 ?auto_1860155 ) ) ( not ( = ?auto_1860156 ?auto_1860159 ) ) ( not ( = ?auto_1860156 ?auto_1860161 ) ) ( not ( = ?auto_1860156 ?auto_1860160 ) ) ( not ( = ?auto_1860156 ?auto_1860162 ) ) ( not ( = ?auto_1860156 ?auto_1860163 ) ) ( not ( = ?auto_1860156 ?auto_1860164 ) ) ( not ( = ?auto_1860156 ?auto_1860165 ) ) ( not ( = ?auto_1860156 ?auto_1860166 ) ) ( not ( = ?auto_1860156 ?auto_1860167 ) ) ( not ( = ?auto_1860156 ?auto_1860168 ) ) ( not ( = ?auto_1860157 ?auto_1860158 ) ) ( not ( = ?auto_1860157 ?auto_1860155 ) ) ( not ( = ?auto_1860157 ?auto_1860159 ) ) ( not ( = ?auto_1860157 ?auto_1860161 ) ) ( not ( = ?auto_1860157 ?auto_1860160 ) ) ( not ( = ?auto_1860157 ?auto_1860162 ) ) ( not ( = ?auto_1860157 ?auto_1860163 ) ) ( not ( = ?auto_1860157 ?auto_1860164 ) ) ( not ( = ?auto_1860157 ?auto_1860165 ) ) ( not ( = ?auto_1860157 ?auto_1860166 ) ) ( not ( = ?auto_1860157 ?auto_1860167 ) ) ( not ( = ?auto_1860157 ?auto_1860168 ) ) ( not ( = ?auto_1860158 ?auto_1860155 ) ) ( not ( = ?auto_1860158 ?auto_1860159 ) ) ( not ( = ?auto_1860158 ?auto_1860161 ) ) ( not ( = ?auto_1860158 ?auto_1860160 ) ) ( not ( = ?auto_1860158 ?auto_1860162 ) ) ( not ( = ?auto_1860158 ?auto_1860163 ) ) ( not ( = ?auto_1860158 ?auto_1860164 ) ) ( not ( = ?auto_1860158 ?auto_1860165 ) ) ( not ( = ?auto_1860158 ?auto_1860166 ) ) ( not ( = ?auto_1860158 ?auto_1860167 ) ) ( not ( = ?auto_1860158 ?auto_1860168 ) ) ( not ( = ?auto_1860155 ?auto_1860159 ) ) ( not ( = ?auto_1860155 ?auto_1860161 ) ) ( not ( = ?auto_1860155 ?auto_1860160 ) ) ( not ( = ?auto_1860155 ?auto_1860162 ) ) ( not ( = ?auto_1860155 ?auto_1860163 ) ) ( not ( = ?auto_1860155 ?auto_1860164 ) ) ( not ( = ?auto_1860155 ?auto_1860165 ) ) ( not ( = ?auto_1860155 ?auto_1860166 ) ) ( not ( = ?auto_1860155 ?auto_1860167 ) ) ( not ( = ?auto_1860155 ?auto_1860168 ) ) ( not ( = ?auto_1860159 ?auto_1860161 ) ) ( not ( = ?auto_1860159 ?auto_1860160 ) ) ( not ( = ?auto_1860159 ?auto_1860162 ) ) ( not ( = ?auto_1860159 ?auto_1860163 ) ) ( not ( = ?auto_1860159 ?auto_1860164 ) ) ( not ( = ?auto_1860159 ?auto_1860165 ) ) ( not ( = ?auto_1860159 ?auto_1860166 ) ) ( not ( = ?auto_1860159 ?auto_1860167 ) ) ( not ( = ?auto_1860159 ?auto_1860168 ) ) ( not ( = ?auto_1860161 ?auto_1860160 ) ) ( not ( = ?auto_1860161 ?auto_1860162 ) ) ( not ( = ?auto_1860161 ?auto_1860163 ) ) ( not ( = ?auto_1860161 ?auto_1860164 ) ) ( not ( = ?auto_1860161 ?auto_1860165 ) ) ( not ( = ?auto_1860161 ?auto_1860166 ) ) ( not ( = ?auto_1860161 ?auto_1860167 ) ) ( not ( = ?auto_1860161 ?auto_1860168 ) ) ( not ( = ?auto_1860160 ?auto_1860162 ) ) ( not ( = ?auto_1860160 ?auto_1860163 ) ) ( not ( = ?auto_1860160 ?auto_1860164 ) ) ( not ( = ?auto_1860160 ?auto_1860165 ) ) ( not ( = ?auto_1860160 ?auto_1860166 ) ) ( not ( = ?auto_1860160 ?auto_1860167 ) ) ( not ( = ?auto_1860160 ?auto_1860168 ) ) ( not ( = ?auto_1860162 ?auto_1860163 ) ) ( not ( = ?auto_1860162 ?auto_1860164 ) ) ( not ( = ?auto_1860162 ?auto_1860165 ) ) ( not ( = ?auto_1860162 ?auto_1860166 ) ) ( not ( = ?auto_1860162 ?auto_1860167 ) ) ( not ( = ?auto_1860162 ?auto_1860168 ) ) ( not ( = ?auto_1860163 ?auto_1860164 ) ) ( not ( = ?auto_1860163 ?auto_1860165 ) ) ( not ( = ?auto_1860163 ?auto_1860166 ) ) ( not ( = ?auto_1860163 ?auto_1860167 ) ) ( not ( = ?auto_1860163 ?auto_1860168 ) ) ( not ( = ?auto_1860164 ?auto_1860165 ) ) ( not ( = ?auto_1860164 ?auto_1860166 ) ) ( not ( = ?auto_1860164 ?auto_1860167 ) ) ( not ( = ?auto_1860164 ?auto_1860168 ) ) ( not ( = ?auto_1860165 ?auto_1860166 ) ) ( not ( = ?auto_1860165 ?auto_1860167 ) ) ( not ( = ?auto_1860165 ?auto_1860168 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1860166 ?auto_1860167 ?auto_1860168 )
      ( MAKE-13CRATE-VERIFY ?auto_1860156 ?auto_1860157 ?auto_1860158 ?auto_1860155 ?auto_1860159 ?auto_1860161 ?auto_1860160 ?auto_1860162 ?auto_1860163 ?auto_1860164 ?auto_1860165 ?auto_1860166 ?auto_1860167 ?auto_1860168 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1860312 - SURFACE
      ?auto_1860313 - SURFACE
      ?auto_1860314 - SURFACE
      ?auto_1860311 - SURFACE
      ?auto_1860315 - SURFACE
      ?auto_1860317 - SURFACE
      ?auto_1860316 - SURFACE
      ?auto_1860318 - SURFACE
      ?auto_1860319 - SURFACE
      ?auto_1860320 - SURFACE
      ?auto_1860321 - SURFACE
      ?auto_1860322 - SURFACE
      ?auto_1860323 - SURFACE
      ?auto_1860324 - SURFACE
    )
    :vars
    (
      ?auto_1860326 - HOIST
      ?auto_1860325 - PLACE
      ?auto_1860327 - TRUCK
      ?auto_1860328 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1860326 ?auto_1860325 ) ( SURFACE-AT ?auto_1860323 ?auto_1860325 ) ( CLEAR ?auto_1860323 ) ( IS-CRATE ?auto_1860324 ) ( not ( = ?auto_1860323 ?auto_1860324 ) ) ( AVAILABLE ?auto_1860326 ) ( IN ?auto_1860324 ?auto_1860327 ) ( ON ?auto_1860323 ?auto_1860322 ) ( not ( = ?auto_1860322 ?auto_1860323 ) ) ( not ( = ?auto_1860322 ?auto_1860324 ) ) ( TRUCK-AT ?auto_1860327 ?auto_1860328 ) ( not ( = ?auto_1860328 ?auto_1860325 ) ) ( ON ?auto_1860313 ?auto_1860312 ) ( ON ?auto_1860314 ?auto_1860313 ) ( ON ?auto_1860311 ?auto_1860314 ) ( ON ?auto_1860315 ?auto_1860311 ) ( ON ?auto_1860317 ?auto_1860315 ) ( ON ?auto_1860316 ?auto_1860317 ) ( ON ?auto_1860318 ?auto_1860316 ) ( ON ?auto_1860319 ?auto_1860318 ) ( ON ?auto_1860320 ?auto_1860319 ) ( ON ?auto_1860321 ?auto_1860320 ) ( ON ?auto_1860322 ?auto_1860321 ) ( not ( = ?auto_1860312 ?auto_1860313 ) ) ( not ( = ?auto_1860312 ?auto_1860314 ) ) ( not ( = ?auto_1860312 ?auto_1860311 ) ) ( not ( = ?auto_1860312 ?auto_1860315 ) ) ( not ( = ?auto_1860312 ?auto_1860317 ) ) ( not ( = ?auto_1860312 ?auto_1860316 ) ) ( not ( = ?auto_1860312 ?auto_1860318 ) ) ( not ( = ?auto_1860312 ?auto_1860319 ) ) ( not ( = ?auto_1860312 ?auto_1860320 ) ) ( not ( = ?auto_1860312 ?auto_1860321 ) ) ( not ( = ?auto_1860312 ?auto_1860322 ) ) ( not ( = ?auto_1860312 ?auto_1860323 ) ) ( not ( = ?auto_1860312 ?auto_1860324 ) ) ( not ( = ?auto_1860313 ?auto_1860314 ) ) ( not ( = ?auto_1860313 ?auto_1860311 ) ) ( not ( = ?auto_1860313 ?auto_1860315 ) ) ( not ( = ?auto_1860313 ?auto_1860317 ) ) ( not ( = ?auto_1860313 ?auto_1860316 ) ) ( not ( = ?auto_1860313 ?auto_1860318 ) ) ( not ( = ?auto_1860313 ?auto_1860319 ) ) ( not ( = ?auto_1860313 ?auto_1860320 ) ) ( not ( = ?auto_1860313 ?auto_1860321 ) ) ( not ( = ?auto_1860313 ?auto_1860322 ) ) ( not ( = ?auto_1860313 ?auto_1860323 ) ) ( not ( = ?auto_1860313 ?auto_1860324 ) ) ( not ( = ?auto_1860314 ?auto_1860311 ) ) ( not ( = ?auto_1860314 ?auto_1860315 ) ) ( not ( = ?auto_1860314 ?auto_1860317 ) ) ( not ( = ?auto_1860314 ?auto_1860316 ) ) ( not ( = ?auto_1860314 ?auto_1860318 ) ) ( not ( = ?auto_1860314 ?auto_1860319 ) ) ( not ( = ?auto_1860314 ?auto_1860320 ) ) ( not ( = ?auto_1860314 ?auto_1860321 ) ) ( not ( = ?auto_1860314 ?auto_1860322 ) ) ( not ( = ?auto_1860314 ?auto_1860323 ) ) ( not ( = ?auto_1860314 ?auto_1860324 ) ) ( not ( = ?auto_1860311 ?auto_1860315 ) ) ( not ( = ?auto_1860311 ?auto_1860317 ) ) ( not ( = ?auto_1860311 ?auto_1860316 ) ) ( not ( = ?auto_1860311 ?auto_1860318 ) ) ( not ( = ?auto_1860311 ?auto_1860319 ) ) ( not ( = ?auto_1860311 ?auto_1860320 ) ) ( not ( = ?auto_1860311 ?auto_1860321 ) ) ( not ( = ?auto_1860311 ?auto_1860322 ) ) ( not ( = ?auto_1860311 ?auto_1860323 ) ) ( not ( = ?auto_1860311 ?auto_1860324 ) ) ( not ( = ?auto_1860315 ?auto_1860317 ) ) ( not ( = ?auto_1860315 ?auto_1860316 ) ) ( not ( = ?auto_1860315 ?auto_1860318 ) ) ( not ( = ?auto_1860315 ?auto_1860319 ) ) ( not ( = ?auto_1860315 ?auto_1860320 ) ) ( not ( = ?auto_1860315 ?auto_1860321 ) ) ( not ( = ?auto_1860315 ?auto_1860322 ) ) ( not ( = ?auto_1860315 ?auto_1860323 ) ) ( not ( = ?auto_1860315 ?auto_1860324 ) ) ( not ( = ?auto_1860317 ?auto_1860316 ) ) ( not ( = ?auto_1860317 ?auto_1860318 ) ) ( not ( = ?auto_1860317 ?auto_1860319 ) ) ( not ( = ?auto_1860317 ?auto_1860320 ) ) ( not ( = ?auto_1860317 ?auto_1860321 ) ) ( not ( = ?auto_1860317 ?auto_1860322 ) ) ( not ( = ?auto_1860317 ?auto_1860323 ) ) ( not ( = ?auto_1860317 ?auto_1860324 ) ) ( not ( = ?auto_1860316 ?auto_1860318 ) ) ( not ( = ?auto_1860316 ?auto_1860319 ) ) ( not ( = ?auto_1860316 ?auto_1860320 ) ) ( not ( = ?auto_1860316 ?auto_1860321 ) ) ( not ( = ?auto_1860316 ?auto_1860322 ) ) ( not ( = ?auto_1860316 ?auto_1860323 ) ) ( not ( = ?auto_1860316 ?auto_1860324 ) ) ( not ( = ?auto_1860318 ?auto_1860319 ) ) ( not ( = ?auto_1860318 ?auto_1860320 ) ) ( not ( = ?auto_1860318 ?auto_1860321 ) ) ( not ( = ?auto_1860318 ?auto_1860322 ) ) ( not ( = ?auto_1860318 ?auto_1860323 ) ) ( not ( = ?auto_1860318 ?auto_1860324 ) ) ( not ( = ?auto_1860319 ?auto_1860320 ) ) ( not ( = ?auto_1860319 ?auto_1860321 ) ) ( not ( = ?auto_1860319 ?auto_1860322 ) ) ( not ( = ?auto_1860319 ?auto_1860323 ) ) ( not ( = ?auto_1860319 ?auto_1860324 ) ) ( not ( = ?auto_1860320 ?auto_1860321 ) ) ( not ( = ?auto_1860320 ?auto_1860322 ) ) ( not ( = ?auto_1860320 ?auto_1860323 ) ) ( not ( = ?auto_1860320 ?auto_1860324 ) ) ( not ( = ?auto_1860321 ?auto_1860322 ) ) ( not ( = ?auto_1860321 ?auto_1860323 ) ) ( not ( = ?auto_1860321 ?auto_1860324 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1860322 ?auto_1860323 ?auto_1860324 )
      ( MAKE-13CRATE-VERIFY ?auto_1860312 ?auto_1860313 ?auto_1860314 ?auto_1860311 ?auto_1860315 ?auto_1860317 ?auto_1860316 ?auto_1860318 ?auto_1860319 ?auto_1860320 ?auto_1860321 ?auto_1860322 ?auto_1860323 ?auto_1860324 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1860481 - SURFACE
      ?auto_1860482 - SURFACE
      ?auto_1860483 - SURFACE
      ?auto_1860480 - SURFACE
      ?auto_1860484 - SURFACE
      ?auto_1860486 - SURFACE
      ?auto_1860485 - SURFACE
      ?auto_1860487 - SURFACE
      ?auto_1860488 - SURFACE
      ?auto_1860489 - SURFACE
      ?auto_1860490 - SURFACE
      ?auto_1860491 - SURFACE
      ?auto_1860492 - SURFACE
      ?auto_1860493 - SURFACE
    )
    :vars
    (
      ?auto_1860497 - HOIST
      ?auto_1860498 - PLACE
      ?auto_1860496 - TRUCK
      ?auto_1860495 - PLACE
      ?auto_1860494 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1860497 ?auto_1860498 ) ( SURFACE-AT ?auto_1860492 ?auto_1860498 ) ( CLEAR ?auto_1860492 ) ( IS-CRATE ?auto_1860493 ) ( not ( = ?auto_1860492 ?auto_1860493 ) ) ( AVAILABLE ?auto_1860497 ) ( ON ?auto_1860492 ?auto_1860491 ) ( not ( = ?auto_1860491 ?auto_1860492 ) ) ( not ( = ?auto_1860491 ?auto_1860493 ) ) ( TRUCK-AT ?auto_1860496 ?auto_1860495 ) ( not ( = ?auto_1860495 ?auto_1860498 ) ) ( HOIST-AT ?auto_1860494 ?auto_1860495 ) ( LIFTING ?auto_1860494 ?auto_1860493 ) ( not ( = ?auto_1860497 ?auto_1860494 ) ) ( ON ?auto_1860482 ?auto_1860481 ) ( ON ?auto_1860483 ?auto_1860482 ) ( ON ?auto_1860480 ?auto_1860483 ) ( ON ?auto_1860484 ?auto_1860480 ) ( ON ?auto_1860486 ?auto_1860484 ) ( ON ?auto_1860485 ?auto_1860486 ) ( ON ?auto_1860487 ?auto_1860485 ) ( ON ?auto_1860488 ?auto_1860487 ) ( ON ?auto_1860489 ?auto_1860488 ) ( ON ?auto_1860490 ?auto_1860489 ) ( ON ?auto_1860491 ?auto_1860490 ) ( not ( = ?auto_1860481 ?auto_1860482 ) ) ( not ( = ?auto_1860481 ?auto_1860483 ) ) ( not ( = ?auto_1860481 ?auto_1860480 ) ) ( not ( = ?auto_1860481 ?auto_1860484 ) ) ( not ( = ?auto_1860481 ?auto_1860486 ) ) ( not ( = ?auto_1860481 ?auto_1860485 ) ) ( not ( = ?auto_1860481 ?auto_1860487 ) ) ( not ( = ?auto_1860481 ?auto_1860488 ) ) ( not ( = ?auto_1860481 ?auto_1860489 ) ) ( not ( = ?auto_1860481 ?auto_1860490 ) ) ( not ( = ?auto_1860481 ?auto_1860491 ) ) ( not ( = ?auto_1860481 ?auto_1860492 ) ) ( not ( = ?auto_1860481 ?auto_1860493 ) ) ( not ( = ?auto_1860482 ?auto_1860483 ) ) ( not ( = ?auto_1860482 ?auto_1860480 ) ) ( not ( = ?auto_1860482 ?auto_1860484 ) ) ( not ( = ?auto_1860482 ?auto_1860486 ) ) ( not ( = ?auto_1860482 ?auto_1860485 ) ) ( not ( = ?auto_1860482 ?auto_1860487 ) ) ( not ( = ?auto_1860482 ?auto_1860488 ) ) ( not ( = ?auto_1860482 ?auto_1860489 ) ) ( not ( = ?auto_1860482 ?auto_1860490 ) ) ( not ( = ?auto_1860482 ?auto_1860491 ) ) ( not ( = ?auto_1860482 ?auto_1860492 ) ) ( not ( = ?auto_1860482 ?auto_1860493 ) ) ( not ( = ?auto_1860483 ?auto_1860480 ) ) ( not ( = ?auto_1860483 ?auto_1860484 ) ) ( not ( = ?auto_1860483 ?auto_1860486 ) ) ( not ( = ?auto_1860483 ?auto_1860485 ) ) ( not ( = ?auto_1860483 ?auto_1860487 ) ) ( not ( = ?auto_1860483 ?auto_1860488 ) ) ( not ( = ?auto_1860483 ?auto_1860489 ) ) ( not ( = ?auto_1860483 ?auto_1860490 ) ) ( not ( = ?auto_1860483 ?auto_1860491 ) ) ( not ( = ?auto_1860483 ?auto_1860492 ) ) ( not ( = ?auto_1860483 ?auto_1860493 ) ) ( not ( = ?auto_1860480 ?auto_1860484 ) ) ( not ( = ?auto_1860480 ?auto_1860486 ) ) ( not ( = ?auto_1860480 ?auto_1860485 ) ) ( not ( = ?auto_1860480 ?auto_1860487 ) ) ( not ( = ?auto_1860480 ?auto_1860488 ) ) ( not ( = ?auto_1860480 ?auto_1860489 ) ) ( not ( = ?auto_1860480 ?auto_1860490 ) ) ( not ( = ?auto_1860480 ?auto_1860491 ) ) ( not ( = ?auto_1860480 ?auto_1860492 ) ) ( not ( = ?auto_1860480 ?auto_1860493 ) ) ( not ( = ?auto_1860484 ?auto_1860486 ) ) ( not ( = ?auto_1860484 ?auto_1860485 ) ) ( not ( = ?auto_1860484 ?auto_1860487 ) ) ( not ( = ?auto_1860484 ?auto_1860488 ) ) ( not ( = ?auto_1860484 ?auto_1860489 ) ) ( not ( = ?auto_1860484 ?auto_1860490 ) ) ( not ( = ?auto_1860484 ?auto_1860491 ) ) ( not ( = ?auto_1860484 ?auto_1860492 ) ) ( not ( = ?auto_1860484 ?auto_1860493 ) ) ( not ( = ?auto_1860486 ?auto_1860485 ) ) ( not ( = ?auto_1860486 ?auto_1860487 ) ) ( not ( = ?auto_1860486 ?auto_1860488 ) ) ( not ( = ?auto_1860486 ?auto_1860489 ) ) ( not ( = ?auto_1860486 ?auto_1860490 ) ) ( not ( = ?auto_1860486 ?auto_1860491 ) ) ( not ( = ?auto_1860486 ?auto_1860492 ) ) ( not ( = ?auto_1860486 ?auto_1860493 ) ) ( not ( = ?auto_1860485 ?auto_1860487 ) ) ( not ( = ?auto_1860485 ?auto_1860488 ) ) ( not ( = ?auto_1860485 ?auto_1860489 ) ) ( not ( = ?auto_1860485 ?auto_1860490 ) ) ( not ( = ?auto_1860485 ?auto_1860491 ) ) ( not ( = ?auto_1860485 ?auto_1860492 ) ) ( not ( = ?auto_1860485 ?auto_1860493 ) ) ( not ( = ?auto_1860487 ?auto_1860488 ) ) ( not ( = ?auto_1860487 ?auto_1860489 ) ) ( not ( = ?auto_1860487 ?auto_1860490 ) ) ( not ( = ?auto_1860487 ?auto_1860491 ) ) ( not ( = ?auto_1860487 ?auto_1860492 ) ) ( not ( = ?auto_1860487 ?auto_1860493 ) ) ( not ( = ?auto_1860488 ?auto_1860489 ) ) ( not ( = ?auto_1860488 ?auto_1860490 ) ) ( not ( = ?auto_1860488 ?auto_1860491 ) ) ( not ( = ?auto_1860488 ?auto_1860492 ) ) ( not ( = ?auto_1860488 ?auto_1860493 ) ) ( not ( = ?auto_1860489 ?auto_1860490 ) ) ( not ( = ?auto_1860489 ?auto_1860491 ) ) ( not ( = ?auto_1860489 ?auto_1860492 ) ) ( not ( = ?auto_1860489 ?auto_1860493 ) ) ( not ( = ?auto_1860490 ?auto_1860491 ) ) ( not ( = ?auto_1860490 ?auto_1860492 ) ) ( not ( = ?auto_1860490 ?auto_1860493 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1860491 ?auto_1860492 ?auto_1860493 )
      ( MAKE-13CRATE-VERIFY ?auto_1860481 ?auto_1860482 ?auto_1860483 ?auto_1860480 ?auto_1860484 ?auto_1860486 ?auto_1860485 ?auto_1860487 ?auto_1860488 ?auto_1860489 ?auto_1860490 ?auto_1860491 ?auto_1860492 ?auto_1860493 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1860663 - SURFACE
      ?auto_1860664 - SURFACE
      ?auto_1860665 - SURFACE
      ?auto_1860662 - SURFACE
      ?auto_1860666 - SURFACE
      ?auto_1860668 - SURFACE
      ?auto_1860667 - SURFACE
      ?auto_1860669 - SURFACE
      ?auto_1860670 - SURFACE
      ?auto_1860671 - SURFACE
      ?auto_1860672 - SURFACE
      ?auto_1860673 - SURFACE
      ?auto_1860674 - SURFACE
      ?auto_1860675 - SURFACE
    )
    :vars
    (
      ?auto_1860678 - HOIST
      ?auto_1860677 - PLACE
      ?auto_1860676 - TRUCK
      ?auto_1860679 - PLACE
      ?auto_1860680 - HOIST
      ?auto_1860681 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1860678 ?auto_1860677 ) ( SURFACE-AT ?auto_1860674 ?auto_1860677 ) ( CLEAR ?auto_1860674 ) ( IS-CRATE ?auto_1860675 ) ( not ( = ?auto_1860674 ?auto_1860675 ) ) ( AVAILABLE ?auto_1860678 ) ( ON ?auto_1860674 ?auto_1860673 ) ( not ( = ?auto_1860673 ?auto_1860674 ) ) ( not ( = ?auto_1860673 ?auto_1860675 ) ) ( TRUCK-AT ?auto_1860676 ?auto_1860679 ) ( not ( = ?auto_1860679 ?auto_1860677 ) ) ( HOIST-AT ?auto_1860680 ?auto_1860679 ) ( not ( = ?auto_1860678 ?auto_1860680 ) ) ( AVAILABLE ?auto_1860680 ) ( SURFACE-AT ?auto_1860675 ?auto_1860679 ) ( ON ?auto_1860675 ?auto_1860681 ) ( CLEAR ?auto_1860675 ) ( not ( = ?auto_1860674 ?auto_1860681 ) ) ( not ( = ?auto_1860675 ?auto_1860681 ) ) ( not ( = ?auto_1860673 ?auto_1860681 ) ) ( ON ?auto_1860664 ?auto_1860663 ) ( ON ?auto_1860665 ?auto_1860664 ) ( ON ?auto_1860662 ?auto_1860665 ) ( ON ?auto_1860666 ?auto_1860662 ) ( ON ?auto_1860668 ?auto_1860666 ) ( ON ?auto_1860667 ?auto_1860668 ) ( ON ?auto_1860669 ?auto_1860667 ) ( ON ?auto_1860670 ?auto_1860669 ) ( ON ?auto_1860671 ?auto_1860670 ) ( ON ?auto_1860672 ?auto_1860671 ) ( ON ?auto_1860673 ?auto_1860672 ) ( not ( = ?auto_1860663 ?auto_1860664 ) ) ( not ( = ?auto_1860663 ?auto_1860665 ) ) ( not ( = ?auto_1860663 ?auto_1860662 ) ) ( not ( = ?auto_1860663 ?auto_1860666 ) ) ( not ( = ?auto_1860663 ?auto_1860668 ) ) ( not ( = ?auto_1860663 ?auto_1860667 ) ) ( not ( = ?auto_1860663 ?auto_1860669 ) ) ( not ( = ?auto_1860663 ?auto_1860670 ) ) ( not ( = ?auto_1860663 ?auto_1860671 ) ) ( not ( = ?auto_1860663 ?auto_1860672 ) ) ( not ( = ?auto_1860663 ?auto_1860673 ) ) ( not ( = ?auto_1860663 ?auto_1860674 ) ) ( not ( = ?auto_1860663 ?auto_1860675 ) ) ( not ( = ?auto_1860663 ?auto_1860681 ) ) ( not ( = ?auto_1860664 ?auto_1860665 ) ) ( not ( = ?auto_1860664 ?auto_1860662 ) ) ( not ( = ?auto_1860664 ?auto_1860666 ) ) ( not ( = ?auto_1860664 ?auto_1860668 ) ) ( not ( = ?auto_1860664 ?auto_1860667 ) ) ( not ( = ?auto_1860664 ?auto_1860669 ) ) ( not ( = ?auto_1860664 ?auto_1860670 ) ) ( not ( = ?auto_1860664 ?auto_1860671 ) ) ( not ( = ?auto_1860664 ?auto_1860672 ) ) ( not ( = ?auto_1860664 ?auto_1860673 ) ) ( not ( = ?auto_1860664 ?auto_1860674 ) ) ( not ( = ?auto_1860664 ?auto_1860675 ) ) ( not ( = ?auto_1860664 ?auto_1860681 ) ) ( not ( = ?auto_1860665 ?auto_1860662 ) ) ( not ( = ?auto_1860665 ?auto_1860666 ) ) ( not ( = ?auto_1860665 ?auto_1860668 ) ) ( not ( = ?auto_1860665 ?auto_1860667 ) ) ( not ( = ?auto_1860665 ?auto_1860669 ) ) ( not ( = ?auto_1860665 ?auto_1860670 ) ) ( not ( = ?auto_1860665 ?auto_1860671 ) ) ( not ( = ?auto_1860665 ?auto_1860672 ) ) ( not ( = ?auto_1860665 ?auto_1860673 ) ) ( not ( = ?auto_1860665 ?auto_1860674 ) ) ( not ( = ?auto_1860665 ?auto_1860675 ) ) ( not ( = ?auto_1860665 ?auto_1860681 ) ) ( not ( = ?auto_1860662 ?auto_1860666 ) ) ( not ( = ?auto_1860662 ?auto_1860668 ) ) ( not ( = ?auto_1860662 ?auto_1860667 ) ) ( not ( = ?auto_1860662 ?auto_1860669 ) ) ( not ( = ?auto_1860662 ?auto_1860670 ) ) ( not ( = ?auto_1860662 ?auto_1860671 ) ) ( not ( = ?auto_1860662 ?auto_1860672 ) ) ( not ( = ?auto_1860662 ?auto_1860673 ) ) ( not ( = ?auto_1860662 ?auto_1860674 ) ) ( not ( = ?auto_1860662 ?auto_1860675 ) ) ( not ( = ?auto_1860662 ?auto_1860681 ) ) ( not ( = ?auto_1860666 ?auto_1860668 ) ) ( not ( = ?auto_1860666 ?auto_1860667 ) ) ( not ( = ?auto_1860666 ?auto_1860669 ) ) ( not ( = ?auto_1860666 ?auto_1860670 ) ) ( not ( = ?auto_1860666 ?auto_1860671 ) ) ( not ( = ?auto_1860666 ?auto_1860672 ) ) ( not ( = ?auto_1860666 ?auto_1860673 ) ) ( not ( = ?auto_1860666 ?auto_1860674 ) ) ( not ( = ?auto_1860666 ?auto_1860675 ) ) ( not ( = ?auto_1860666 ?auto_1860681 ) ) ( not ( = ?auto_1860668 ?auto_1860667 ) ) ( not ( = ?auto_1860668 ?auto_1860669 ) ) ( not ( = ?auto_1860668 ?auto_1860670 ) ) ( not ( = ?auto_1860668 ?auto_1860671 ) ) ( not ( = ?auto_1860668 ?auto_1860672 ) ) ( not ( = ?auto_1860668 ?auto_1860673 ) ) ( not ( = ?auto_1860668 ?auto_1860674 ) ) ( not ( = ?auto_1860668 ?auto_1860675 ) ) ( not ( = ?auto_1860668 ?auto_1860681 ) ) ( not ( = ?auto_1860667 ?auto_1860669 ) ) ( not ( = ?auto_1860667 ?auto_1860670 ) ) ( not ( = ?auto_1860667 ?auto_1860671 ) ) ( not ( = ?auto_1860667 ?auto_1860672 ) ) ( not ( = ?auto_1860667 ?auto_1860673 ) ) ( not ( = ?auto_1860667 ?auto_1860674 ) ) ( not ( = ?auto_1860667 ?auto_1860675 ) ) ( not ( = ?auto_1860667 ?auto_1860681 ) ) ( not ( = ?auto_1860669 ?auto_1860670 ) ) ( not ( = ?auto_1860669 ?auto_1860671 ) ) ( not ( = ?auto_1860669 ?auto_1860672 ) ) ( not ( = ?auto_1860669 ?auto_1860673 ) ) ( not ( = ?auto_1860669 ?auto_1860674 ) ) ( not ( = ?auto_1860669 ?auto_1860675 ) ) ( not ( = ?auto_1860669 ?auto_1860681 ) ) ( not ( = ?auto_1860670 ?auto_1860671 ) ) ( not ( = ?auto_1860670 ?auto_1860672 ) ) ( not ( = ?auto_1860670 ?auto_1860673 ) ) ( not ( = ?auto_1860670 ?auto_1860674 ) ) ( not ( = ?auto_1860670 ?auto_1860675 ) ) ( not ( = ?auto_1860670 ?auto_1860681 ) ) ( not ( = ?auto_1860671 ?auto_1860672 ) ) ( not ( = ?auto_1860671 ?auto_1860673 ) ) ( not ( = ?auto_1860671 ?auto_1860674 ) ) ( not ( = ?auto_1860671 ?auto_1860675 ) ) ( not ( = ?auto_1860671 ?auto_1860681 ) ) ( not ( = ?auto_1860672 ?auto_1860673 ) ) ( not ( = ?auto_1860672 ?auto_1860674 ) ) ( not ( = ?auto_1860672 ?auto_1860675 ) ) ( not ( = ?auto_1860672 ?auto_1860681 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1860673 ?auto_1860674 ?auto_1860675 )
      ( MAKE-13CRATE-VERIFY ?auto_1860663 ?auto_1860664 ?auto_1860665 ?auto_1860662 ?auto_1860666 ?auto_1860668 ?auto_1860667 ?auto_1860669 ?auto_1860670 ?auto_1860671 ?auto_1860672 ?auto_1860673 ?auto_1860674 ?auto_1860675 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1860846 - SURFACE
      ?auto_1860847 - SURFACE
      ?auto_1860848 - SURFACE
      ?auto_1860845 - SURFACE
      ?auto_1860849 - SURFACE
      ?auto_1860851 - SURFACE
      ?auto_1860850 - SURFACE
      ?auto_1860852 - SURFACE
      ?auto_1860853 - SURFACE
      ?auto_1860854 - SURFACE
      ?auto_1860855 - SURFACE
      ?auto_1860856 - SURFACE
      ?auto_1860857 - SURFACE
      ?auto_1860858 - SURFACE
    )
    :vars
    (
      ?auto_1860863 - HOIST
      ?auto_1860861 - PLACE
      ?auto_1860864 - PLACE
      ?auto_1860862 - HOIST
      ?auto_1860860 - SURFACE
      ?auto_1860859 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1860863 ?auto_1860861 ) ( SURFACE-AT ?auto_1860857 ?auto_1860861 ) ( CLEAR ?auto_1860857 ) ( IS-CRATE ?auto_1860858 ) ( not ( = ?auto_1860857 ?auto_1860858 ) ) ( AVAILABLE ?auto_1860863 ) ( ON ?auto_1860857 ?auto_1860856 ) ( not ( = ?auto_1860856 ?auto_1860857 ) ) ( not ( = ?auto_1860856 ?auto_1860858 ) ) ( not ( = ?auto_1860864 ?auto_1860861 ) ) ( HOIST-AT ?auto_1860862 ?auto_1860864 ) ( not ( = ?auto_1860863 ?auto_1860862 ) ) ( AVAILABLE ?auto_1860862 ) ( SURFACE-AT ?auto_1860858 ?auto_1860864 ) ( ON ?auto_1860858 ?auto_1860860 ) ( CLEAR ?auto_1860858 ) ( not ( = ?auto_1860857 ?auto_1860860 ) ) ( not ( = ?auto_1860858 ?auto_1860860 ) ) ( not ( = ?auto_1860856 ?auto_1860860 ) ) ( TRUCK-AT ?auto_1860859 ?auto_1860861 ) ( ON ?auto_1860847 ?auto_1860846 ) ( ON ?auto_1860848 ?auto_1860847 ) ( ON ?auto_1860845 ?auto_1860848 ) ( ON ?auto_1860849 ?auto_1860845 ) ( ON ?auto_1860851 ?auto_1860849 ) ( ON ?auto_1860850 ?auto_1860851 ) ( ON ?auto_1860852 ?auto_1860850 ) ( ON ?auto_1860853 ?auto_1860852 ) ( ON ?auto_1860854 ?auto_1860853 ) ( ON ?auto_1860855 ?auto_1860854 ) ( ON ?auto_1860856 ?auto_1860855 ) ( not ( = ?auto_1860846 ?auto_1860847 ) ) ( not ( = ?auto_1860846 ?auto_1860848 ) ) ( not ( = ?auto_1860846 ?auto_1860845 ) ) ( not ( = ?auto_1860846 ?auto_1860849 ) ) ( not ( = ?auto_1860846 ?auto_1860851 ) ) ( not ( = ?auto_1860846 ?auto_1860850 ) ) ( not ( = ?auto_1860846 ?auto_1860852 ) ) ( not ( = ?auto_1860846 ?auto_1860853 ) ) ( not ( = ?auto_1860846 ?auto_1860854 ) ) ( not ( = ?auto_1860846 ?auto_1860855 ) ) ( not ( = ?auto_1860846 ?auto_1860856 ) ) ( not ( = ?auto_1860846 ?auto_1860857 ) ) ( not ( = ?auto_1860846 ?auto_1860858 ) ) ( not ( = ?auto_1860846 ?auto_1860860 ) ) ( not ( = ?auto_1860847 ?auto_1860848 ) ) ( not ( = ?auto_1860847 ?auto_1860845 ) ) ( not ( = ?auto_1860847 ?auto_1860849 ) ) ( not ( = ?auto_1860847 ?auto_1860851 ) ) ( not ( = ?auto_1860847 ?auto_1860850 ) ) ( not ( = ?auto_1860847 ?auto_1860852 ) ) ( not ( = ?auto_1860847 ?auto_1860853 ) ) ( not ( = ?auto_1860847 ?auto_1860854 ) ) ( not ( = ?auto_1860847 ?auto_1860855 ) ) ( not ( = ?auto_1860847 ?auto_1860856 ) ) ( not ( = ?auto_1860847 ?auto_1860857 ) ) ( not ( = ?auto_1860847 ?auto_1860858 ) ) ( not ( = ?auto_1860847 ?auto_1860860 ) ) ( not ( = ?auto_1860848 ?auto_1860845 ) ) ( not ( = ?auto_1860848 ?auto_1860849 ) ) ( not ( = ?auto_1860848 ?auto_1860851 ) ) ( not ( = ?auto_1860848 ?auto_1860850 ) ) ( not ( = ?auto_1860848 ?auto_1860852 ) ) ( not ( = ?auto_1860848 ?auto_1860853 ) ) ( not ( = ?auto_1860848 ?auto_1860854 ) ) ( not ( = ?auto_1860848 ?auto_1860855 ) ) ( not ( = ?auto_1860848 ?auto_1860856 ) ) ( not ( = ?auto_1860848 ?auto_1860857 ) ) ( not ( = ?auto_1860848 ?auto_1860858 ) ) ( not ( = ?auto_1860848 ?auto_1860860 ) ) ( not ( = ?auto_1860845 ?auto_1860849 ) ) ( not ( = ?auto_1860845 ?auto_1860851 ) ) ( not ( = ?auto_1860845 ?auto_1860850 ) ) ( not ( = ?auto_1860845 ?auto_1860852 ) ) ( not ( = ?auto_1860845 ?auto_1860853 ) ) ( not ( = ?auto_1860845 ?auto_1860854 ) ) ( not ( = ?auto_1860845 ?auto_1860855 ) ) ( not ( = ?auto_1860845 ?auto_1860856 ) ) ( not ( = ?auto_1860845 ?auto_1860857 ) ) ( not ( = ?auto_1860845 ?auto_1860858 ) ) ( not ( = ?auto_1860845 ?auto_1860860 ) ) ( not ( = ?auto_1860849 ?auto_1860851 ) ) ( not ( = ?auto_1860849 ?auto_1860850 ) ) ( not ( = ?auto_1860849 ?auto_1860852 ) ) ( not ( = ?auto_1860849 ?auto_1860853 ) ) ( not ( = ?auto_1860849 ?auto_1860854 ) ) ( not ( = ?auto_1860849 ?auto_1860855 ) ) ( not ( = ?auto_1860849 ?auto_1860856 ) ) ( not ( = ?auto_1860849 ?auto_1860857 ) ) ( not ( = ?auto_1860849 ?auto_1860858 ) ) ( not ( = ?auto_1860849 ?auto_1860860 ) ) ( not ( = ?auto_1860851 ?auto_1860850 ) ) ( not ( = ?auto_1860851 ?auto_1860852 ) ) ( not ( = ?auto_1860851 ?auto_1860853 ) ) ( not ( = ?auto_1860851 ?auto_1860854 ) ) ( not ( = ?auto_1860851 ?auto_1860855 ) ) ( not ( = ?auto_1860851 ?auto_1860856 ) ) ( not ( = ?auto_1860851 ?auto_1860857 ) ) ( not ( = ?auto_1860851 ?auto_1860858 ) ) ( not ( = ?auto_1860851 ?auto_1860860 ) ) ( not ( = ?auto_1860850 ?auto_1860852 ) ) ( not ( = ?auto_1860850 ?auto_1860853 ) ) ( not ( = ?auto_1860850 ?auto_1860854 ) ) ( not ( = ?auto_1860850 ?auto_1860855 ) ) ( not ( = ?auto_1860850 ?auto_1860856 ) ) ( not ( = ?auto_1860850 ?auto_1860857 ) ) ( not ( = ?auto_1860850 ?auto_1860858 ) ) ( not ( = ?auto_1860850 ?auto_1860860 ) ) ( not ( = ?auto_1860852 ?auto_1860853 ) ) ( not ( = ?auto_1860852 ?auto_1860854 ) ) ( not ( = ?auto_1860852 ?auto_1860855 ) ) ( not ( = ?auto_1860852 ?auto_1860856 ) ) ( not ( = ?auto_1860852 ?auto_1860857 ) ) ( not ( = ?auto_1860852 ?auto_1860858 ) ) ( not ( = ?auto_1860852 ?auto_1860860 ) ) ( not ( = ?auto_1860853 ?auto_1860854 ) ) ( not ( = ?auto_1860853 ?auto_1860855 ) ) ( not ( = ?auto_1860853 ?auto_1860856 ) ) ( not ( = ?auto_1860853 ?auto_1860857 ) ) ( not ( = ?auto_1860853 ?auto_1860858 ) ) ( not ( = ?auto_1860853 ?auto_1860860 ) ) ( not ( = ?auto_1860854 ?auto_1860855 ) ) ( not ( = ?auto_1860854 ?auto_1860856 ) ) ( not ( = ?auto_1860854 ?auto_1860857 ) ) ( not ( = ?auto_1860854 ?auto_1860858 ) ) ( not ( = ?auto_1860854 ?auto_1860860 ) ) ( not ( = ?auto_1860855 ?auto_1860856 ) ) ( not ( = ?auto_1860855 ?auto_1860857 ) ) ( not ( = ?auto_1860855 ?auto_1860858 ) ) ( not ( = ?auto_1860855 ?auto_1860860 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1860856 ?auto_1860857 ?auto_1860858 )
      ( MAKE-13CRATE-VERIFY ?auto_1860846 ?auto_1860847 ?auto_1860848 ?auto_1860845 ?auto_1860849 ?auto_1860851 ?auto_1860850 ?auto_1860852 ?auto_1860853 ?auto_1860854 ?auto_1860855 ?auto_1860856 ?auto_1860857 ?auto_1860858 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1861029 - SURFACE
      ?auto_1861030 - SURFACE
      ?auto_1861031 - SURFACE
      ?auto_1861028 - SURFACE
      ?auto_1861032 - SURFACE
      ?auto_1861034 - SURFACE
      ?auto_1861033 - SURFACE
      ?auto_1861035 - SURFACE
      ?auto_1861036 - SURFACE
      ?auto_1861037 - SURFACE
      ?auto_1861038 - SURFACE
      ?auto_1861039 - SURFACE
      ?auto_1861040 - SURFACE
      ?auto_1861041 - SURFACE
    )
    :vars
    (
      ?auto_1861044 - HOIST
      ?auto_1861046 - PLACE
      ?auto_1861047 - PLACE
      ?auto_1861043 - HOIST
      ?auto_1861045 - SURFACE
      ?auto_1861042 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861044 ?auto_1861046 ) ( IS-CRATE ?auto_1861041 ) ( not ( = ?auto_1861040 ?auto_1861041 ) ) ( not ( = ?auto_1861039 ?auto_1861040 ) ) ( not ( = ?auto_1861039 ?auto_1861041 ) ) ( not ( = ?auto_1861047 ?auto_1861046 ) ) ( HOIST-AT ?auto_1861043 ?auto_1861047 ) ( not ( = ?auto_1861044 ?auto_1861043 ) ) ( AVAILABLE ?auto_1861043 ) ( SURFACE-AT ?auto_1861041 ?auto_1861047 ) ( ON ?auto_1861041 ?auto_1861045 ) ( CLEAR ?auto_1861041 ) ( not ( = ?auto_1861040 ?auto_1861045 ) ) ( not ( = ?auto_1861041 ?auto_1861045 ) ) ( not ( = ?auto_1861039 ?auto_1861045 ) ) ( TRUCK-AT ?auto_1861042 ?auto_1861046 ) ( SURFACE-AT ?auto_1861039 ?auto_1861046 ) ( CLEAR ?auto_1861039 ) ( LIFTING ?auto_1861044 ?auto_1861040 ) ( IS-CRATE ?auto_1861040 ) ( ON ?auto_1861030 ?auto_1861029 ) ( ON ?auto_1861031 ?auto_1861030 ) ( ON ?auto_1861028 ?auto_1861031 ) ( ON ?auto_1861032 ?auto_1861028 ) ( ON ?auto_1861034 ?auto_1861032 ) ( ON ?auto_1861033 ?auto_1861034 ) ( ON ?auto_1861035 ?auto_1861033 ) ( ON ?auto_1861036 ?auto_1861035 ) ( ON ?auto_1861037 ?auto_1861036 ) ( ON ?auto_1861038 ?auto_1861037 ) ( ON ?auto_1861039 ?auto_1861038 ) ( not ( = ?auto_1861029 ?auto_1861030 ) ) ( not ( = ?auto_1861029 ?auto_1861031 ) ) ( not ( = ?auto_1861029 ?auto_1861028 ) ) ( not ( = ?auto_1861029 ?auto_1861032 ) ) ( not ( = ?auto_1861029 ?auto_1861034 ) ) ( not ( = ?auto_1861029 ?auto_1861033 ) ) ( not ( = ?auto_1861029 ?auto_1861035 ) ) ( not ( = ?auto_1861029 ?auto_1861036 ) ) ( not ( = ?auto_1861029 ?auto_1861037 ) ) ( not ( = ?auto_1861029 ?auto_1861038 ) ) ( not ( = ?auto_1861029 ?auto_1861039 ) ) ( not ( = ?auto_1861029 ?auto_1861040 ) ) ( not ( = ?auto_1861029 ?auto_1861041 ) ) ( not ( = ?auto_1861029 ?auto_1861045 ) ) ( not ( = ?auto_1861030 ?auto_1861031 ) ) ( not ( = ?auto_1861030 ?auto_1861028 ) ) ( not ( = ?auto_1861030 ?auto_1861032 ) ) ( not ( = ?auto_1861030 ?auto_1861034 ) ) ( not ( = ?auto_1861030 ?auto_1861033 ) ) ( not ( = ?auto_1861030 ?auto_1861035 ) ) ( not ( = ?auto_1861030 ?auto_1861036 ) ) ( not ( = ?auto_1861030 ?auto_1861037 ) ) ( not ( = ?auto_1861030 ?auto_1861038 ) ) ( not ( = ?auto_1861030 ?auto_1861039 ) ) ( not ( = ?auto_1861030 ?auto_1861040 ) ) ( not ( = ?auto_1861030 ?auto_1861041 ) ) ( not ( = ?auto_1861030 ?auto_1861045 ) ) ( not ( = ?auto_1861031 ?auto_1861028 ) ) ( not ( = ?auto_1861031 ?auto_1861032 ) ) ( not ( = ?auto_1861031 ?auto_1861034 ) ) ( not ( = ?auto_1861031 ?auto_1861033 ) ) ( not ( = ?auto_1861031 ?auto_1861035 ) ) ( not ( = ?auto_1861031 ?auto_1861036 ) ) ( not ( = ?auto_1861031 ?auto_1861037 ) ) ( not ( = ?auto_1861031 ?auto_1861038 ) ) ( not ( = ?auto_1861031 ?auto_1861039 ) ) ( not ( = ?auto_1861031 ?auto_1861040 ) ) ( not ( = ?auto_1861031 ?auto_1861041 ) ) ( not ( = ?auto_1861031 ?auto_1861045 ) ) ( not ( = ?auto_1861028 ?auto_1861032 ) ) ( not ( = ?auto_1861028 ?auto_1861034 ) ) ( not ( = ?auto_1861028 ?auto_1861033 ) ) ( not ( = ?auto_1861028 ?auto_1861035 ) ) ( not ( = ?auto_1861028 ?auto_1861036 ) ) ( not ( = ?auto_1861028 ?auto_1861037 ) ) ( not ( = ?auto_1861028 ?auto_1861038 ) ) ( not ( = ?auto_1861028 ?auto_1861039 ) ) ( not ( = ?auto_1861028 ?auto_1861040 ) ) ( not ( = ?auto_1861028 ?auto_1861041 ) ) ( not ( = ?auto_1861028 ?auto_1861045 ) ) ( not ( = ?auto_1861032 ?auto_1861034 ) ) ( not ( = ?auto_1861032 ?auto_1861033 ) ) ( not ( = ?auto_1861032 ?auto_1861035 ) ) ( not ( = ?auto_1861032 ?auto_1861036 ) ) ( not ( = ?auto_1861032 ?auto_1861037 ) ) ( not ( = ?auto_1861032 ?auto_1861038 ) ) ( not ( = ?auto_1861032 ?auto_1861039 ) ) ( not ( = ?auto_1861032 ?auto_1861040 ) ) ( not ( = ?auto_1861032 ?auto_1861041 ) ) ( not ( = ?auto_1861032 ?auto_1861045 ) ) ( not ( = ?auto_1861034 ?auto_1861033 ) ) ( not ( = ?auto_1861034 ?auto_1861035 ) ) ( not ( = ?auto_1861034 ?auto_1861036 ) ) ( not ( = ?auto_1861034 ?auto_1861037 ) ) ( not ( = ?auto_1861034 ?auto_1861038 ) ) ( not ( = ?auto_1861034 ?auto_1861039 ) ) ( not ( = ?auto_1861034 ?auto_1861040 ) ) ( not ( = ?auto_1861034 ?auto_1861041 ) ) ( not ( = ?auto_1861034 ?auto_1861045 ) ) ( not ( = ?auto_1861033 ?auto_1861035 ) ) ( not ( = ?auto_1861033 ?auto_1861036 ) ) ( not ( = ?auto_1861033 ?auto_1861037 ) ) ( not ( = ?auto_1861033 ?auto_1861038 ) ) ( not ( = ?auto_1861033 ?auto_1861039 ) ) ( not ( = ?auto_1861033 ?auto_1861040 ) ) ( not ( = ?auto_1861033 ?auto_1861041 ) ) ( not ( = ?auto_1861033 ?auto_1861045 ) ) ( not ( = ?auto_1861035 ?auto_1861036 ) ) ( not ( = ?auto_1861035 ?auto_1861037 ) ) ( not ( = ?auto_1861035 ?auto_1861038 ) ) ( not ( = ?auto_1861035 ?auto_1861039 ) ) ( not ( = ?auto_1861035 ?auto_1861040 ) ) ( not ( = ?auto_1861035 ?auto_1861041 ) ) ( not ( = ?auto_1861035 ?auto_1861045 ) ) ( not ( = ?auto_1861036 ?auto_1861037 ) ) ( not ( = ?auto_1861036 ?auto_1861038 ) ) ( not ( = ?auto_1861036 ?auto_1861039 ) ) ( not ( = ?auto_1861036 ?auto_1861040 ) ) ( not ( = ?auto_1861036 ?auto_1861041 ) ) ( not ( = ?auto_1861036 ?auto_1861045 ) ) ( not ( = ?auto_1861037 ?auto_1861038 ) ) ( not ( = ?auto_1861037 ?auto_1861039 ) ) ( not ( = ?auto_1861037 ?auto_1861040 ) ) ( not ( = ?auto_1861037 ?auto_1861041 ) ) ( not ( = ?auto_1861037 ?auto_1861045 ) ) ( not ( = ?auto_1861038 ?auto_1861039 ) ) ( not ( = ?auto_1861038 ?auto_1861040 ) ) ( not ( = ?auto_1861038 ?auto_1861041 ) ) ( not ( = ?auto_1861038 ?auto_1861045 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861039 ?auto_1861040 ?auto_1861041 )
      ( MAKE-13CRATE-VERIFY ?auto_1861029 ?auto_1861030 ?auto_1861031 ?auto_1861028 ?auto_1861032 ?auto_1861034 ?auto_1861033 ?auto_1861035 ?auto_1861036 ?auto_1861037 ?auto_1861038 ?auto_1861039 ?auto_1861040 ?auto_1861041 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1861212 - SURFACE
      ?auto_1861213 - SURFACE
      ?auto_1861214 - SURFACE
      ?auto_1861211 - SURFACE
      ?auto_1861215 - SURFACE
      ?auto_1861217 - SURFACE
      ?auto_1861216 - SURFACE
      ?auto_1861218 - SURFACE
      ?auto_1861219 - SURFACE
      ?auto_1861220 - SURFACE
      ?auto_1861221 - SURFACE
      ?auto_1861222 - SURFACE
      ?auto_1861223 - SURFACE
      ?auto_1861224 - SURFACE
    )
    :vars
    (
      ?auto_1861228 - HOIST
      ?auto_1861226 - PLACE
      ?auto_1861227 - PLACE
      ?auto_1861225 - HOIST
      ?auto_1861229 - SURFACE
      ?auto_1861230 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861228 ?auto_1861226 ) ( IS-CRATE ?auto_1861224 ) ( not ( = ?auto_1861223 ?auto_1861224 ) ) ( not ( = ?auto_1861222 ?auto_1861223 ) ) ( not ( = ?auto_1861222 ?auto_1861224 ) ) ( not ( = ?auto_1861227 ?auto_1861226 ) ) ( HOIST-AT ?auto_1861225 ?auto_1861227 ) ( not ( = ?auto_1861228 ?auto_1861225 ) ) ( AVAILABLE ?auto_1861225 ) ( SURFACE-AT ?auto_1861224 ?auto_1861227 ) ( ON ?auto_1861224 ?auto_1861229 ) ( CLEAR ?auto_1861224 ) ( not ( = ?auto_1861223 ?auto_1861229 ) ) ( not ( = ?auto_1861224 ?auto_1861229 ) ) ( not ( = ?auto_1861222 ?auto_1861229 ) ) ( TRUCK-AT ?auto_1861230 ?auto_1861226 ) ( SURFACE-AT ?auto_1861222 ?auto_1861226 ) ( CLEAR ?auto_1861222 ) ( IS-CRATE ?auto_1861223 ) ( AVAILABLE ?auto_1861228 ) ( IN ?auto_1861223 ?auto_1861230 ) ( ON ?auto_1861213 ?auto_1861212 ) ( ON ?auto_1861214 ?auto_1861213 ) ( ON ?auto_1861211 ?auto_1861214 ) ( ON ?auto_1861215 ?auto_1861211 ) ( ON ?auto_1861217 ?auto_1861215 ) ( ON ?auto_1861216 ?auto_1861217 ) ( ON ?auto_1861218 ?auto_1861216 ) ( ON ?auto_1861219 ?auto_1861218 ) ( ON ?auto_1861220 ?auto_1861219 ) ( ON ?auto_1861221 ?auto_1861220 ) ( ON ?auto_1861222 ?auto_1861221 ) ( not ( = ?auto_1861212 ?auto_1861213 ) ) ( not ( = ?auto_1861212 ?auto_1861214 ) ) ( not ( = ?auto_1861212 ?auto_1861211 ) ) ( not ( = ?auto_1861212 ?auto_1861215 ) ) ( not ( = ?auto_1861212 ?auto_1861217 ) ) ( not ( = ?auto_1861212 ?auto_1861216 ) ) ( not ( = ?auto_1861212 ?auto_1861218 ) ) ( not ( = ?auto_1861212 ?auto_1861219 ) ) ( not ( = ?auto_1861212 ?auto_1861220 ) ) ( not ( = ?auto_1861212 ?auto_1861221 ) ) ( not ( = ?auto_1861212 ?auto_1861222 ) ) ( not ( = ?auto_1861212 ?auto_1861223 ) ) ( not ( = ?auto_1861212 ?auto_1861224 ) ) ( not ( = ?auto_1861212 ?auto_1861229 ) ) ( not ( = ?auto_1861213 ?auto_1861214 ) ) ( not ( = ?auto_1861213 ?auto_1861211 ) ) ( not ( = ?auto_1861213 ?auto_1861215 ) ) ( not ( = ?auto_1861213 ?auto_1861217 ) ) ( not ( = ?auto_1861213 ?auto_1861216 ) ) ( not ( = ?auto_1861213 ?auto_1861218 ) ) ( not ( = ?auto_1861213 ?auto_1861219 ) ) ( not ( = ?auto_1861213 ?auto_1861220 ) ) ( not ( = ?auto_1861213 ?auto_1861221 ) ) ( not ( = ?auto_1861213 ?auto_1861222 ) ) ( not ( = ?auto_1861213 ?auto_1861223 ) ) ( not ( = ?auto_1861213 ?auto_1861224 ) ) ( not ( = ?auto_1861213 ?auto_1861229 ) ) ( not ( = ?auto_1861214 ?auto_1861211 ) ) ( not ( = ?auto_1861214 ?auto_1861215 ) ) ( not ( = ?auto_1861214 ?auto_1861217 ) ) ( not ( = ?auto_1861214 ?auto_1861216 ) ) ( not ( = ?auto_1861214 ?auto_1861218 ) ) ( not ( = ?auto_1861214 ?auto_1861219 ) ) ( not ( = ?auto_1861214 ?auto_1861220 ) ) ( not ( = ?auto_1861214 ?auto_1861221 ) ) ( not ( = ?auto_1861214 ?auto_1861222 ) ) ( not ( = ?auto_1861214 ?auto_1861223 ) ) ( not ( = ?auto_1861214 ?auto_1861224 ) ) ( not ( = ?auto_1861214 ?auto_1861229 ) ) ( not ( = ?auto_1861211 ?auto_1861215 ) ) ( not ( = ?auto_1861211 ?auto_1861217 ) ) ( not ( = ?auto_1861211 ?auto_1861216 ) ) ( not ( = ?auto_1861211 ?auto_1861218 ) ) ( not ( = ?auto_1861211 ?auto_1861219 ) ) ( not ( = ?auto_1861211 ?auto_1861220 ) ) ( not ( = ?auto_1861211 ?auto_1861221 ) ) ( not ( = ?auto_1861211 ?auto_1861222 ) ) ( not ( = ?auto_1861211 ?auto_1861223 ) ) ( not ( = ?auto_1861211 ?auto_1861224 ) ) ( not ( = ?auto_1861211 ?auto_1861229 ) ) ( not ( = ?auto_1861215 ?auto_1861217 ) ) ( not ( = ?auto_1861215 ?auto_1861216 ) ) ( not ( = ?auto_1861215 ?auto_1861218 ) ) ( not ( = ?auto_1861215 ?auto_1861219 ) ) ( not ( = ?auto_1861215 ?auto_1861220 ) ) ( not ( = ?auto_1861215 ?auto_1861221 ) ) ( not ( = ?auto_1861215 ?auto_1861222 ) ) ( not ( = ?auto_1861215 ?auto_1861223 ) ) ( not ( = ?auto_1861215 ?auto_1861224 ) ) ( not ( = ?auto_1861215 ?auto_1861229 ) ) ( not ( = ?auto_1861217 ?auto_1861216 ) ) ( not ( = ?auto_1861217 ?auto_1861218 ) ) ( not ( = ?auto_1861217 ?auto_1861219 ) ) ( not ( = ?auto_1861217 ?auto_1861220 ) ) ( not ( = ?auto_1861217 ?auto_1861221 ) ) ( not ( = ?auto_1861217 ?auto_1861222 ) ) ( not ( = ?auto_1861217 ?auto_1861223 ) ) ( not ( = ?auto_1861217 ?auto_1861224 ) ) ( not ( = ?auto_1861217 ?auto_1861229 ) ) ( not ( = ?auto_1861216 ?auto_1861218 ) ) ( not ( = ?auto_1861216 ?auto_1861219 ) ) ( not ( = ?auto_1861216 ?auto_1861220 ) ) ( not ( = ?auto_1861216 ?auto_1861221 ) ) ( not ( = ?auto_1861216 ?auto_1861222 ) ) ( not ( = ?auto_1861216 ?auto_1861223 ) ) ( not ( = ?auto_1861216 ?auto_1861224 ) ) ( not ( = ?auto_1861216 ?auto_1861229 ) ) ( not ( = ?auto_1861218 ?auto_1861219 ) ) ( not ( = ?auto_1861218 ?auto_1861220 ) ) ( not ( = ?auto_1861218 ?auto_1861221 ) ) ( not ( = ?auto_1861218 ?auto_1861222 ) ) ( not ( = ?auto_1861218 ?auto_1861223 ) ) ( not ( = ?auto_1861218 ?auto_1861224 ) ) ( not ( = ?auto_1861218 ?auto_1861229 ) ) ( not ( = ?auto_1861219 ?auto_1861220 ) ) ( not ( = ?auto_1861219 ?auto_1861221 ) ) ( not ( = ?auto_1861219 ?auto_1861222 ) ) ( not ( = ?auto_1861219 ?auto_1861223 ) ) ( not ( = ?auto_1861219 ?auto_1861224 ) ) ( not ( = ?auto_1861219 ?auto_1861229 ) ) ( not ( = ?auto_1861220 ?auto_1861221 ) ) ( not ( = ?auto_1861220 ?auto_1861222 ) ) ( not ( = ?auto_1861220 ?auto_1861223 ) ) ( not ( = ?auto_1861220 ?auto_1861224 ) ) ( not ( = ?auto_1861220 ?auto_1861229 ) ) ( not ( = ?auto_1861221 ?auto_1861222 ) ) ( not ( = ?auto_1861221 ?auto_1861223 ) ) ( not ( = ?auto_1861221 ?auto_1861224 ) ) ( not ( = ?auto_1861221 ?auto_1861229 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861222 ?auto_1861223 ?auto_1861224 )
      ( MAKE-13CRATE-VERIFY ?auto_1861212 ?auto_1861213 ?auto_1861214 ?auto_1861211 ?auto_1861215 ?auto_1861217 ?auto_1861216 ?auto_1861218 ?auto_1861219 ?auto_1861220 ?auto_1861221 ?auto_1861222 ?auto_1861223 ?auto_1861224 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1861260 - SURFACE
      ?auto_1861261 - SURFACE
      ?auto_1861262 - SURFACE
      ?auto_1861259 - SURFACE
      ?auto_1861263 - SURFACE
    )
    :vars
    (
      ?auto_1861266 - HOIST
      ?auto_1861264 - PLACE
      ?auto_1861268 - PLACE
      ?auto_1861267 - HOIST
      ?auto_1861265 - SURFACE
      ?auto_1861269 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861266 ?auto_1861264 ) ( IS-CRATE ?auto_1861263 ) ( not ( = ?auto_1861259 ?auto_1861263 ) ) ( not ( = ?auto_1861262 ?auto_1861259 ) ) ( not ( = ?auto_1861262 ?auto_1861263 ) ) ( not ( = ?auto_1861268 ?auto_1861264 ) ) ( HOIST-AT ?auto_1861267 ?auto_1861268 ) ( not ( = ?auto_1861266 ?auto_1861267 ) ) ( AVAILABLE ?auto_1861267 ) ( SURFACE-AT ?auto_1861263 ?auto_1861268 ) ( ON ?auto_1861263 ?auto_1861265 ) ( CLEAR ?auto_1861263 ) ( not ( = ?auto_1861259 ?auto_1861265 ) ) ( not ( = ?auto_1861263 ?auto_1861265 ) ) ( not ( = ?auto_1861262 ?auto_1861265 ) ) ( SURFACE-AT ?auto_1861262 ?auto_1861264 ) ( CLEAR ?auto_1861262 ) ( IS-CRATE ?auto_1861259 ) ( AVAILABLE ?auto_1861266 ) ( IN ?auto_1861259 ?auto_1861269 ) ( TRUCK-AT ?auto_1861269 ?auto_1861268 ) ( ON ?auto_1861261 ?auto_1861260 ) ( ON ?auto_1861262 ?auto_1861261 ) ( not ( = ?auto_1861260 ?auto_1861261 ) ) ( not ( = ?auto_1861260 ?auto_1861262 ) ) ( not ( = ?auto_1861260 ?auto_1861259 ) ) ( not ( = ?auto_1861260 ?auto_1861263 ) ) ( not ( = ?auto_1861260 ?auto_1861265 ) ) ( not ( = ?auto_1861261 ?auto_1861262 ) ) ( not ( = ?auto_1861261 ?auto_1861259 ) ) ( not ( = ?auto_1861261 ?auto_1861263 ) ) ( not ( = ?auto_1861261 ?auto_1861265 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861262 ?auto_1861259 ?auto_1861263 )
      ( MAKE-4CRATE-VERIFY ?auto_1861260 ?auto_1861261 ?auto_1861262 ?auto_1861259 ?auto_1861263 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1861271 - SURFACE
      ?auto_1861272 - SURFACE
      ?auto_1861273 - SURFACE
      ?auto_1861270 - SURFACE
      ?auto_1861274 - SURFACE
      ?auto_1861275 - SURFACE
    )
    :vars
    (
      ?auto_1861278 - HOIST
      ?auto_1861276 - PLACE
      ?auto_1861280 - PLACE
      ?auto_1861279 - HOIST
      ?auto_1861277 - SURFACE
      ?auto_1861281 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861278 ?auto_1861276 ) ( IS-CRATE ?auto_1861275 ) ( not ( = ?auto_1861274 ?auto_1861275 ) ) ( not ( = ?auto_1861270 ?auto_1861274 ) ) ( not ( = ?auto_1861270 ?auto_1861275 ) ) ( not ( = ?auto_1861280 ?auto_1861276 ) ) ( HOIST-AT ?auto_1861279 ?auto_1861280 ) ( not ( = ?auto_1861278 ?auto_1861279 ) ) ( AVAILABLE ?auto_1861279 ) ( SURFACE-AT ?auto_1861275 ?auto_1861280 ) ( ON ?auto_1861275 ?auto_1861277 ) ( CLEAR ?auto_1861275 ) ( not ( = ?auto_1861274 ?auto_1861277 ) ) ( not ( = ?auto_1861275 ?auto_1861277 ) ) ( not ( = ?auto_1861270 ?auto_1861277 ) ) ( SURFACE-AT ?auto_1861270 ?auto_1861276 ) ( CLEAR ?auto_1861270 ) ( IS-CRATE ?auto_1861274 ) ( AVAILABLE ?auto_1861278 ) ( IN ?auto_1861274 ?auto_1861281 ) ( TRUCK-AT ?auto_1861281 ?auto_1861280 ) ( ON ?auto_1861272 ?auto_1861271 ) ( ON ?auto_1861273 ?auto_1861272 ) ( ON ?auto_1861270 ?auto_1861273 ) ( not ( = ?auto_1861271 ?auto_1861272 ) ) ( not ( = ?auto_1861271 ?auto_1861273 ) ) ( not ( = ?auto_1861271 ?auto_1861270 ) ) ( not ( = ?auto_1861271 ?auto_1861274 ) ) ( not ( = ?auto_1861271 ?auto_1861275 ) ) ( not ( = ?auto_1861271 ?auto_1861277 ) ) ( not ( = ?auto_1861272 ?auto_1861273 ) ) ( not ( = ?auto_1861272 ?auto_1861270 ) ) ( not ( = ?auto_1861272 ?auto_1861274 ) ) ( not ( = ?auto_1861272 ?auto_1861275 ) ) ( not ( = ?auto_1861272 ?auto_1861277 ) ) ( not ( = ?auto_1861273 ?auto_1861270 ) ) ( not ( = ?auto_1861273 ?auto_1861274 ) ) ( not ( = ?auto_1861273 ?auto_1861275 ) ) ( not ( = ?auto_1861273 ?auto_1861277 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861270 ?auto_1861274 ?auto_1861275 )
      ( MAKE-5CRATE-VERIFY ?auto_1861271 ?auto_1861272 ?auto_1861273 ?auto_1861270 ?auto_1861274 ?auto_1861275 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1861283 - SURFACE
      ?auto_1861284 - SURFACE
      ?auto_1861285 - SURFACE
      ?auto_1861282 - SURFACE
      ?auto_1861286 - SURFACE
      ?auto_1861288 - SURFACE
      ?auto_1861287 - SURFACE
    )
    :vars
    (
      ?auto_1861291 - HOIST
      ?auto_1861289 - PLACE
      ?auto_1861293 - PLACE
      ?auto_1861292 - HOIST
      ?auto_1861290 - SURFACE
      ?auto_1861294 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861291 ?auto_1861289 ) ( IS-CRATE ?auto_1861287 ) ( not ( = ?auto_1861288 ?auto_1861287 ) ) ( not ( = ?auto_1861286 ?auto_1861288 ) ) ( not ( = ?auto_1861286 ?auto_1861287 ) ) ( not ( = ?auto_1861293 ?auto_1861289 ) ) ( HOIST-AT ?auto_1861292 ?auto_1861293 ) ( not ( = ?auto_1861291 ?auto_1861292 ) ) ( AVAILABLE ?auto_1861292 ) ( SURFACE-AT ?auto_1861287 ?auto_1861293 ) ( ON ?auto_1861287 ?auto_1861290 ) ( CLEAR ?auto_1861287 ) ( not ( = ?auto_1861288 ?auto_1861290 ) ) ( not ( = ?auto_1861287 ?auto_1861290 ) ) ( not ( = ?auto_1861286 ?auto_1861290 ) ) ( SURFACE-AT ?auto_1861286 ?auto_1861289 ) ( CLEAR ?auto_1861286 ) ( IS-CRATE ?auto_1861288 ) ( AVAILABLE ?auto_1861291 ) ( IN ?auto_1861288 ?auto_1861294 ) ( TRUCK-AT ?auto_1861294 ?auto_1861293 ) ( ON ?auto_1861284 ?auto_1861283 ) ( ON ?auto_1861285 ?auto_1861284 ) ( ON ?auto_1861282 ?auto_1861285 ) ( ON ?auto_1861286 ?auto_1861282 ) ( not ( = ?auto_1861283 ?auto_1861284 ) ) ( not ( = ?auto_1861283 ?auto_1861285 ) ) ( not ( = ?auto_1861283 ?auto_1861282 ) ) ( not ( = ?auto_1861283 ?auto_1861286 ) ) ( not ( = ?auto_1861283 ?auto_1861288 ) ) ( not ( = ?auto_1861283 ?auto_1861287 ) ) ( not ( = ?auto_1861283 ?auto_1861290 ) ) ( not ( = ?auto_1861284 ?auto_1861285 ) ) ( not ( = ?auto_1861284 ?auto_1861282 ) ) ( not ( = ?auto_1861284 ?auto_1861286 ) ) ( not ( = ?auto_1861284 ?auto_1861288 ) ) ( not ( = ?auto_1861284 ?auto_1861287 ) ) ( not ( = ?auto_1861284 ?auto_1861290 ) ) ( not ( = ?auto_1861285 ?auto_1861282 ) ) ( not ( = ?auto_1861285 ?auto_1861286 ) ) ( not ( = ?auto_1861285 ?auto_1861288 ) ) ( not ( = ?auto_1861285 ?auto_1861287 ) ) ( not ( = ?auto_1861285 ?auto_1861290 ) ) ( not ( = ?auto_1861282 ?auto_1861286 ) ) ( not ( = ?auto_1861282 ?auto_1861288 ) ) ( not ( = ?auto_1861282 ?auto_1861287 ) ) ( not ( = ?auto_1861282 ?auto_1861290 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861286 ?auto_1861288 ?auto_1861287 )
      ( MAKE-6CRATE-VERIFY ?auto_1861283 ?auto_1861284 ?auto_1861285 ?auto_1861282 ?auto_1861286 ?auto_1861288 ?auto_1861287 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1861296 - SURFACE
      ?auto_1861297 - SURFACE
      ?auto_1861298 - SURFACE
      ?auto_1861295 - SURFACE
      ?auto_1861299 - SURFACE
      ?auto_1861301 - SURFACE
      ?auto_1861300 - SURFACE
      ?auto_1861302 - SURFACE
    )
    :vars
    (
      ?auto_1861305 - HOIST
      ?auto_1861303 - PLACE
      ?auto_1861307 - PLACE
      ?auto_1861306 - HOIST
      ?auto_1861304 - SURFACE
      ?auto_1861308 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861305 ?auto_1861303 ) ( IS-CRATE ?auto_1861302 ) ( not ( = ?auto_1861300 ?auto_1861302 ) ) ( not ( = ?auto_1861301 ?auto_1861300 ) ) ( not ( = ?auto_1861301 ?auto_1861302 ) ) ( not ( = ?auto_1861307 ?auto_1861303 ) ) ( HOIST-AT ?auto_1861306 ?auto_1861307 ) ( not ( = ?auto_1861305 ?auto_1861306 ) ) ( AVAILABLE ?auto_1861306 ) ( SURFACE-AT ?auto_1861302 ?auto_1861307 ) ( ON ?auto_1861302 ?auto_1861304 ) ( CLEAR ?auto_1861302 ) ( not ( = ?auto_1861300 ?auto_1861304 ) ) ( not ( = ?auto_1861302 ?auto_1861304 ) ) ( not ( = ?auto_1861301 ?auto_1861304 ) ) ( SURFACE-AT ?auto_1861301 ?auto_1861303 ) ( CLEAR ?auto_1861301 ) ( IS-CRATE ?auto_1861300 ) ( AVAILABLE ?auto_1861305 ) ( IN ?auto_1861300 ?auto_1861308 ) ( TRUCK-AT ?auto_1861308 ?auto_1861307 ) ( ON ?auto_1861297 ?auto_1861296 ) ( ON ?auto_1861298 ?auto_1861297 ) ( ON ?auto_1861295 ?auto_1861298 ) ( ON ?auto_1861299 ?auto_1861295 ) ( ON ?auto_1861301 ?auto_1861299 ) ( not ( = ?auto_1861296 ?auto_1861297 ) ) ( not ( = ?auto_1861296 ?auto_1861298 ) ) ( not ( = ?auto_1861296 ?auto_1861295 ) ) ( not ( = ?auto_1861296 ?auto_1861299 ) ) ( not ( = ?auto_1861296 ?auto_1861301 ) ) ( not ( = ?auto_1861296 ?auto_1861300 ) ) ( not ( = ?auto_1861296 ?auto_1861302 ) ) ( not ( = ?auto_1861296 ?auto_1861304 ) ) ( not ( = ?auto_1861297 ?auto_1861298 ) ) ( not ( = ?auto_1861297 ?auto_1861295 ) ) ( not ( = ?auto_1861297 ?auto_1861299 ) ) ( not ( = ?auto_1861297 ?auto_1861301 ) ) ( not ( = ?auto_1861297 ?auto_1861300 ) ) ( not ( = ?auto_1861297 ?auto_1861302 ) ) ( not ( = ?auto_1861297 ?auto_1861304 ) ) ( not ( = ?auto_1861298 ?auto_1861295 ) ) ( not ( = ?auto_1861298 ?auto_1861299 ) ) ( not ( = ?auto_1861298 ?auto_1861301 ) ) ( not ( = ?auto_1861298 ?auto_1861300 ) ) ( not ( = ?auto_1861298 ?auto_1861302 ) ) ( not ( = ?auto_1861298 ?auto_1861304 ) ) ( not ( = ?auto_1861295 ?auto_1861299 ) ) ( not ( = ?auto_1861295 ?auto_1861301 ) ) ( not ( = ?auto_1861295 ?auto_1861300 ) ) ( not ( = ?auto_1861295 ?auto_1861302 ) ) ( not ( = ?auto_1861295 ?auto_1861304 ) ) ( not ( = ?auto_1861299 ?auto_1861301 ) ) ( not ( = ?auto_1861299 ?auto_1861300 ) ) ( not ( = ?auto_1861299 ?auto_1861302 ) ) ( not ( = ?auto_1861299 ?auto_1861304 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861301 ?auto_1861300 ?auto_1861302 )
      ( MAKE-7CRATE-VERIFY ?auto_1861296 ?auto_1861297 ?auto_1861298 ?auto_1861295 ?auto_1861299 ?auto_1861301 ?auto_1861300 ?auto_1861302 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1861310 - SURFACE
      ?auto_1861311 - SURFACE
      ?auto_1861312 - SURFACE
      ?auto_1861309 - SURFACE
      ?auto_1861313 - SURFACE
      ?auto_1861315 - SURFACE
      ?auto_1861314 - SURFACE
      ?auto_1861316 - SURFACE
      ?auto_1861317 - SURFACE
    )
    :vars
    (
      ?auto_1861320 - HOIST
      ?auto_1861318 - PLACE
      ?auto_1861322 - PLACE
      ?auto_1861321 - HOIST
      ?auto_1861319 - SURFACE
      ?auto_1861323 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861320 ?auto_1861318 ) ( IS-CRATE ?auto_1861317 ) ( not ( = ?auto_1861316 ?auto_1861317 ) ) ( not ( = ?auto_1861314 ?auto_1861316 ) ) ( not ( = ?auto_1861314 ?auto_1861317 ) ) ( not ( = ?auto_1861322 ?auto_1861318 ) ) ( HOIST-AT ?auto_1861321 ?auto_1861322 ) ( not ( = ?auto_1861320 ?auto_1861321 ) ) ( AVAILABLE ?auto_1861321 ) ( SURFACE-AT ?auto_1861317 ?auto_1861322 ) ( ON ?auto_1861317 ?auto_1861319 ) ( CLEAR ?auto_1861317 ) ( not ( = ?auto_1861316 ?auto_1861319 ) ) ( not ( = ?auto_1861317 ?auto_1861319 ) ) ( not ( = ?auto_1861314 ?auto_1861319 ) ) ( SURFACE-AT ?auto_1861314 ?auto_1861318 ) ( CLEAR ?auto_1861314 ) ( IS-CRATE ?auto_1861316 ) ( AVAILABLE ?auto_1861320 ) ( IN ?auto_1861316 ?auto_1861323 ) ( TRUCK-AT ?auto_1861323 ?auto_1861322 ) ( ON ?auto_1861311 ?auto_1861310 ) ( ON ?auto_1861312 ?auto_1861311 ) ( ON ?auto_1861309 ?auto_1861312 ) ( ON ?auto_1861313 ?auto_1861309 ) ( ON ?auto_1861315 ?auto_1861313 ) ( ON ?auto_1861314 ?auto_1861315 ) ( not ( = ?auto_1861310 ?auto_1861311 ) ) ( not ( = ?auto_1861310 ?auto_1861312 ) ) ( not ( = ?auto_1861310 ?auto_1861309 ) ) ( not ( = ?auto_1861310 ?auto_1861313 ) ) ( not ( = ?auto_1861310 ?auto_1861315 ) ) ( not ( = ?auto_1861310 ?auto_1861314 ) ) ( not ( = ?auto_1861310 ?auto_1861316 ) ) ( not ( = ?auto_1861310 ?auto_1861317 ) ) ( not ( = ?auto_1861310 ?auto_1861319 ) ) ( not ( = ?auto_1861311 ?auto_1861312 ) ) ( not ( = ?auto_1861311 ?auto_1861309 ) ) ( not ( = ?auto_1861311 ?auto_1861313 ) ) ( not ( = ?auto_1861311 ?auto_1861315 ) ) ( not ( = ?auto_1861311 ?auto_1861314 ) ) ( not ( = ?auto_1861311 ?auto_1861316 ) ) ( not ( = ?auto_1861311 ?auto_1861317 ) ) ( not ( = ?auto_1861311 ?auto_1861319 ) ) ( not ( = ?auto_1861312 ?auto_1861309 ) ) ( not ( = ?auto_1861312 ?auto_1861313 ) ) ( not ( = ?auto_1861312 ?auto_1861315 ) ) ( not ( = ?auto_1861312 ?auto_1861314 ) ) ( not ( = ?auto_1861312 ?auto_1861316 ) ) ( not ( = ?auto_1861312 ?auto_1861317 ) ) ( not ( = ?auto_1861312 ?auto_1861319 ) ) ( not ( = ?auto_1861309 ?auto_1861313 ) ) ( not ( = ?auto_1861309 ?auto_1861315 ) ) ( not ( = ?auto_1861309 ?auto_1861314 ) ) ( not ( = ?auto_1861309 ?auto_1861316 ) ) ( not ( = ?auto_1861309 ?auto_1861317 ) ) ( not ( = ?auto_1861309 ?auto_1861319 ) ) ( not ( = ?auto_1861313 ?auto_1861315 ) ) ( not ( = ?auto_1861313 ?auto_1861314 ) ) ( not ( = ?auto_1861313 ?auto_1861316 ) ) ( not ( = ?auto_1861313 ?auto_1861317 ) ) ( not ( = ?auto_1861313 ?auto_1861319 ) ) ( not ( = ?auto_1861315 ?auto_1861314 ) ) ( not ( = ?auto_1861315 ?auto_1861316 ) ) ( not ( = ?auto_1861315 ?auto_1861317 ) ) ( not ( = ?auto_1861315 ?auto_1861319 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861314 ?auto_1861316 ?auto_1861317 )
      ( MAKE-8CRATE-VERIFY ?auto_1861310 ?auto_1861311 ?auto_1861312 ?auto_1861309 ?auto_1861313 ?auto_1861315 ?auto_1861314 ?auto_1861316 ?auto_1861317 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1861325 - SURFACE
      ?auto_1861326 - SURFACE
      ?auto_1861327 - SURFACE
      ?auto_1861324 - SURFACE
      ?auto_1861328 - SURFACE
      ?auto_1861330 - SURFACE
      ?auto_1861329 - SURFACE
      ?auto_1861331 - SURFACE
      ?auto_1861332 - SURFACE
      ?auto_1861333 - SURFACE
    )
    :vars
    (
      ?auto_1861336 - HOIST
      ?auto_1861334 - PLACE
      ?auto_1861338 - PLACE
      ?auto_1861337 - HOIST
      ?auto_1861335 - SURFACE
      ?auto_1861339 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861336 ?auto_1861334 ) ( IS-CRATE ?auto_1861333 ) ( not ( = ?auto_1861332 ?auto_1861333 ) ) ( not ( = ?auto_1861331 ?auto_1861332 ) ) ( not ( = ?auto_1861331 ?auto_1861333 ) ) ( not ( = ?auto_1861338 ?auto_1861334 ) ) ( HOIST-AT ?auto_1861337 ?auto_1861338 ) ( not ( = ?auto_1861336 ?auto_1861337 ) ) ( AVAILABLE ?auto_1861337 ) ( SURFACE-AT ?auto_1861333 ?auto_1861338 ) ( ON ?auto_1861333 ?auto_1861335 ) ( CLEAR ?auto_1861333 ) ( not ( = ?auto_1861332 ?auto_1861335 ) ) ( not ( = ?auto_1861333 ?auto_1861335 ) ) ( not ( = ?auto_1861331 ?auto_1861335 ) ) ( SURFACE-AT ?auto_1861331 ?auto_1861334 ) ( CLEAR ?auto_1861331 ) ( IS-CRATE ?auto_1861332 ) ( AVAILABLE ?auto_1861336 ) ( IN ?auto_1861332 ?auto_1861339 ) ( TRUCK-AT ?auto_1861339 ?auto_1861338 ) ( ON ?auto_1861326 ?auto_1861325 ) ( ON ?auto_1861327 ?auto_1861326 ) ( ON ?auto_1861324 ?auto_1861327 ) ( ON ?auto_1861328 ?auto_1861324 ) ( ON ?auto_1861330 ?auto_1861328 ) ( ON ?auto_1861329 ?auto_1861330 ) ( ON ?auto_1861331 ?auto_1861329 ) ( not ( = ?auto_1861325 ?auto_1861326 ) ) ( not ( = ?auto_1861325 ?auto_1861327 ) ) ( not ( = ?auto_1861325 ?auto_1861324 ) ) ( not ( = ?auto_1861325 ?auto_1861328 ) ) ( not ( = ?auto_1861325 ?auto_1861330 ) ) ( not ( = ?auto_1861325 ?auto_1861329 ) ) ( not ( = ?auto_1861325 ?auto_1861331 ) ) ( not ( = ?auto_1861325 ?auto_1861332 ) ) ( not ( = ?auto_1861325 ?auto_1861333 ) ) ( not ( = ?auto_1861325 ?auto_1861335 ) ) ( not ( = ?auto_1861326 ?auto_1861327 ) ) ( not ( = ?auto_1861326 ?auto_1861324 ) ) ( not ( = ?auto_1861326 ?auto_1861328 ) ) ( not ( = ?auto_1861326 ?auto_1861330 ) ) ( not ( = ?auto_1861326 ?auto_1861329 ) ) ( not ( = ?auto_1861326 ?auto_1861331 ) ) ( not ( = ?auto_1861326 ?auto_1861332 ) ) ( not ( = ?auto_1861326 ?auto_1861333 ) ) ( not ( = ?auto_1861326 ?auto_1861335 ) ) ( not ( = ?auto_1861327 ?auto_1861324 ) ) ( not ( = ?auto_1861327 ?auto_1861328 ) ) ( not ( = ?auto_1861327 ?auto_1861330 ) ) ( not ( = ?auto_1861327 ?auto_1861329 ) ) ( not ( = ?auto_1861327 ?auto_1861331 ) ) ( not ( = ?auto_1861327 ?auto_1861332 ) ) ( not ( = ?auto_1861327 ?auto_1861333 ) ) ( not ( = ?auto_1861327 ?auto_1861335 ) ) ( not ( = ?auto_1861324 ?auto_1861328 ) ) ( not ( = ?auto_1861324 ?auto_1861330 ) ) ( not ( = ?auto_1861324 ?auto_1861329 ) ) ( not ( = ?auto_1861324 ?auto_1861331 ) ) ( not ( = ?auto_1861324 ?auto_1861332 ) ) ( not ( = ?auto_1861324 ?auto_1861333 ) ) ( not ( = ?auto_1861324 ?auto_1861335 ) ) ( not ( = ?auto_1861328 ?auto_1861330 ) ) ( not ( = ?auto_1861328 ?auto_1861329 ) ) ( not ( = ?auto_1861328 ?auto_1861331 ) ) ( not ( = ?auto_1861328 ?auto_1861332 ) ) ( not ( = ?auto_1861328 ?auto_1861333 ) ) ( not ( = ?auto_1861328 ?auto_1861335 ) ) ( not ( = ?auto_1861330 ?auto_1861329 ) ) ( not ( = ?auto_1861330 ?auto_1861331 ) ) ( not ( = ?auto_1861330 ?auto_1861332 ) ) ( not ( = ?auto_1861330 ?auto_1861333 ) ) ( not ( = ?auto_1861330 ?auto_1861335 ) ) ( not ( = ?auto_1861329 ?auto_1861331 ) ) ( not ( = ?auto_1861329 ?auto_1861332 ) ) ( not ( = ?auto_1861329 ?auto_1861333 ) ) ( not ( = ?auto_1861329 ?auto_1861335 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861331 ?auto_1861332 ?auto_1861333 )
      ( MAKE-9CRATE-VERIFY ?auto_1861325 ?auto_1861326 ?auto_1861327 ?auto_1861324 ?auto_1861328 ?auto_1861330 ?auto_1861329 ?auto_1861331 ?auto_1861332 ?auto_1861333 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1861341 - SURFACE
      ?auto_1861342 - SURFACE
      ?auto_1861343 - SURFACE
      ?auto_1861340 - SURFACE
      ?auto_1861344 - SURFACE
      ?auto_1861346 - SURFACE
      ?auto_1861345 - SURFACE
      ?auto_1861347 - SURFACE
      ?auto_1861348 - SURFACE
      ?auto_1861349 - SURFACE
      ?auto_1861350 - SURFACE
    )
    :vars
    (
      ?auto_1861353 - HOIST
      ?auto_1861351 - PLACE
      ?auto_1861355 - PLACE
      ?auto_1861354 - HOIST
      ?auto_1861352 - SURFACE
      ?auto_1861356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861353 ?auto_1861351 ) ( IS-CRATE ?auto_1861350 ) ( not ( = ?auto_1861349 ?auto_1861350 ) ) ( not ( = ?auto_1861348 ?auto_1861349 ) ) ( not ( = ?auto_1861348 ?auto_1861350 ) ) ( not ( = ?auto_1861355 ?auto_1861351 ) ) ( HOIST-AT ?auto_1861354 ?auto_1861355 ) ( not ( = ?auto_1861353 ?auto_1861354 ) ) ( AVAILABLE ?auto_1861354 ) ( SURFACE-AT ?auto_1861350 ?auto_1861355 ) ( ON ?auto_1861350 ?auto_1861352 ) ( CLEAR ?auto_1861350 ) ( not ( = ?auto_1861349 ?auto_1861352 ) ) ( not ( = ?auto_1861350 ?auto_1861352 ) ) ( not ( = ?auto_1861348 ?auto_1861352 ) ) ( SURFACE-AT ?auto_1861348 ?auto_1861351 ) ( CLEAR ?auto_1861348 ) ( IS-CRATE ?auto_1861349 ) ( AVAILABLE ?auto_1861353 ) ( IN ?auto_1861349 ?auto_1861356 ) ( TRUCK-AT ?auto_1861356 ?auto_1861355 ) ( ON ?auto_1861342 ?auto_1861341 ) ( ON ?auto_1861343 ?auto_1861342 ) ( ON ?auto_1861340 ?auto_1861343 ) ( ON ?auto_1861344 ?auto_1861340 ) ( ON ?auto_1861346 ?auto_1861344 ) ( ON ?auto_1861345 ?auto_1861346 ) ( ON ?auto_1861347 ?auto_1861345 ) ( ON ?auto_1861348 ?auto_1861347 ) ( not ( = ?auto_1861341 ?auto_1861342 ) ) ( not ( = ?auto_1861341 ?auto_1861343 ) ) ( not ( = ?auto_1861341 ?auto_1861340 ) ) ( not ( = ?auto_1861341 ?auto_1861344 ) ) ( not ( = ?auto_1861341 ?auto_1861346 ) ) ( not ( = ?auto_1861341 ?auto_1861345 ) ) ( not ( = ?auto_1861341 ?auto_1861347 ) ) ( not ( = ?auto_1861341 ?auto_1861348 ) ) ( not ( = ?auto_1861341 ?auto_1861349 ) ) ( not ( = ?auto_1861341 ?auto_1861350 ) ) ( not ( = ?auto_1861341 ?auto_1861352 ) ) ( not ( = ?auto_1861342 ?auto_1861343 ) ) ( not ( = ?auto_1861342 ?auto_1861340 ) ) ( not ( = ?auto_1861342 ?auto_1861344 ) ) ( not ( = ?auto_1861342 ?auto_1861346 ) ) ( not ( = ?auto_1861342 ?auto_1861345 ) ) ( not ( = ?auto_1861342 ?auto_1861347 ) ) ( not ( = ?auto_1861342 ?auto_1861348 ) ) ( not ( = ?auto_1861342 ?auto_1861349 ) ) ( not ( = ?auto_1861342 ?auto_1861350 ) ) ( not ( = ?auto_1861342 ?auto_1861352 ) ) ( not ( = ?auto_1861343 ?auto_1861340 ) ) ( not ( = ?auto_1861343 ?auto_1861344 ) ) ( not ( = ?auto_1861343 ?auto_1861346 ) ) ( not ( = ?auto_1861343 ?auto_1861345 ) ) ( not ( = ?auto_1861343 ?auto_1861347 ) ) ( not ( = ?auto_1861343 ?auto_1861348 ) ) ( not ( = ?auto_1861343 ?auto_1861349 ) ) ( not ( = ?auto_1861343 ?auto_1861350 ) ) ( not ( = ?auto_1861343 ?auto_1861352 ) ) ( not ( = ?auto_1861340 ?auto_1861344 ) ) ( not ( = ?auto_1861340 ?auto_1861346 ) ) ( not ( = ?auto_1861340 ?auto_1861345 ) ) ( not ( = ?auto_1861340 ?auto_1861347 ) ) ( not ( = ?auto_1861340 ?auto_1861348 ) ) ( not ( = ?auto_1861340 ?auto_1861349 ) ) ( not ( = ?auto_1861340 ?auto_1861350 ) ) ( not ( = ?auto_1861340 ?auto_1861352 ) ) ( not ( = ?auto_1861344 ?auto_1861346 ) ) ( not ( = ?auto_1861344 ?auto_1861345 ) ) ( not ( = ?auto_1861344 ?auto_1861347 ) ) ( not ( = ?auto_1861344 ?auto_1861348 ) ) ( not ( = ?auto_1861344 ?auto_1861349 ) ) ( not ( = ?auto_1861344 ?auto_1861350 ) ) ( not ( = ?auto_1861344 ?auto_1861352 ) ) ( not ( = ?auto_1861346 ?auto_1861345 ) ) ( not ( = ?auto_1861346 ?auto_1861347 ) ) ( not ( = ?auto_1861346 ?auto_1861348 ) ) ( not ( = ?auto_1861346 ?auto_1861349 ) ) ( not ( = ?auto_1861346 ?auto_1861350 ) ) ( not ( = ?auto_1861346 ?auto_1861352 ) ) ( not ( = ?auto_1861345 ?auto_1861347 ) ) ( not ( = ?auto_1861345 ?auto_1861348 ) ) ( not ( = ?auto_1861345 ?auto_1861349 ) ) ( not ( = ?auto_1861345 ?auto_1861350 ) ) ( not ( = ?auto_1861345 ?auto_1861352 ) ) ( not ( = ?auto_1861347 ?auto_1861348 ) ) ( not ( = ?auto_1861347 ?auto_1861349 ) ) ( not ( = ?auto_1861347 ?auto_1861350 ) ) ( not ( = ?auto_1861347 ?auto_1861352 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861348 ?auto_1861349 ?auto_1861350 )
      ( MAKE-10CRATE-VERIFY ?auto_1861341 ?auto_1861342 ?auto_1861343 ?auto_1861340 ?auto_1861344 ?auto_1861346 ?auto_1861345 ?auto_1861347 ?auto_1861348 ?auto_1861349 ?auto_1861350 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1861358 - SURFACE
      ?auto_1861359 - SURFACE
      ?auto_1861360 - SURFACE
      ?auto_1861357 - SURFACE
      ?auto_1861361 - SURFACE
      ?auto_1861363 - SURFACE
      ?auto_1861362 - SURFACE
      ?auto_1861364 - SURFACE
      ?auto_1861365 - SURFACE
      ?auto_1861366 - SURFACE
      ?auto_1861367 - SURFACE
      ?auto_1861368 - SURFACE
    )
    :vars
    (
      ?auto_1861371 - HOIST
      ?auto_1861369 - PLACE
      ?auto_1861373 - PLACE
      ?auto_1861372 - HOIST
      ?auto_1861370 - SURFACE
      ?auto_1861374 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861371 ?auto_1861369 ) ( IS-CRATE ?auto_1861368 ) ( not ( = ?auto_1861367 ?auto_1861368 ) ) ( not ( = ?auto_1861366 ?auto_1861367 ) ) ( not ( = ?auto_1861366 ?auto_1861368 ) ) ( not ( = ?auto_1861373 ?auto_1861369 ) ) ( HOIST-AT ?auto_1861372 ?auto_1861373 ) ( not ( = ?auto_1861371 ?auto_1861372 ) ) ( AVAILABLE ?auto_1861372 ) ( SURFACE-AT ?auto_1861368 ?auto_1861373 ) ( ON ?auto_1861368 ?auto_1861370 ) ( CLEAR ?auto_1861368 ) ( not ( = ?auto_1861367 ?auto_1861370 ) ) ( not ( = ?auto_1861368 ?auto_1861370 ) ) ( not ( = ?auto_1861366 ?auto_1861370 ) ) ( SURFACE-AT ?auto_1861366 ?auto_1861369 ) ( CLEAR ?auto_1861366 ) ( IS-CRATE ?auto_1861367 ) ( AVAILABLE ?auto_1861371 ) ( IN ?auto_1861367 ?auto_1861374 ) ( TRUCK-AT ?auto_1861374 ?auto_1861373 ) ( ON ?auto_1861359 ?auto_1861358 ) ( ON ?auto_1861360 ?auto_1861359 ) ( ON ?auto_1861357 ?auto_1861360 ) ( ON ?auto_1861361 ?auto_1861357 ) ( ON ?auto_1861363 ?auto_1861361 ) ( ON ?auto_1861362 ?auto_1861363 ) ( ON ?auto_1861364 ?auto_1861362 ) ( ON ?auto_1861365 ?auto_1861364 ) ( ON ?auto_1861366 ?auto_1861365 ) ( not ( = ?auto_1861358 ?auto_1861359 ) ) ( not ( = ?auto_1861358 ?auto_1861360 ) ) ( not ( = ?auto_1861358 ?auto_1861357 ) ) ( not ( = ?auto_1861358 ?auto_1861361 ) ) ( not ( = ?auto_1861358 ?auto_1861363 ) ) ( not ( = ?auto_1861358 ?auto_1861362 ) ) ( not ( = ?auto_1861358 ?auto_1861364 ) ) ( not ( = ?auto_1861358 ?auto_1861365 ) ) ( not ( = ?auto_1861358 ?auto_1861366 ) ) ( not ( = ?auto_1861358 ?auto_1861367 ) ) ( not ( = ?auto_1861358 ?auto_1861368 ) ) ( not ( = ?auto_1861358 ?auto_1861370 ) ) ( not ( = ?auto_1861359 ?auto_1861360 ) ) ( not ( = ?auto_1861359 ?auto_1861357 ) ) ( not ( = ?auto_1861359 ?auto_1861361 ) ) ( not ( = ?auto_1861359 ?auto_1861363 ) ) ( not ( = ?auto_1861359 ?auto_1861362 ) ) ( not ( = ?auto_1861359 ?auto_1861364 ) ) ( not ( = ?auto_1861359 ?auto_1861365 ) ) ( not ( = ?auto_1861359 ?auto_1861366 ) ) ( not ( = ?auto_1861359 ?auto_1861367 ) ) ( not ( = ?auto_1861359 ?auto_1861368 ) ) ( not ( = ?auto_1861359 ?auto_1861370 ) ) ( not ( = ?auto_1861360 ?auto_1861357 ) ) ( not ( = ?auto_1861360 ?auto_1861361 ) ) ( not ( = ?auto_1861360 ?auto_1861363 ) ) ( not ( = ?auto_1861360 ?auto_1861362 ) ) ( not ( = ?auto_1861360 ?auto_1861364 ) ) ( not ( = ?auto_1861360 ?auto_1861365 ) ) ( not ( = ?auto_1861360 ?auto_1861366 ) ) ( not ( = ?auto_1861360 ?auto_1861367 ) ) ( not ( = ?auto_1861360 ?auto_1861368 ) ) ( not ( = ?auto_1861360 ?auto_1861370 ) ) ( not ( = ?auto_1861357 ?auto_1861361 ) ) ( not ( = ?auto_1861357 ?auto_1861363 ) ) ( not ( = ?auto_1861357 ?auto_1861362 ) ) ( not ( = ?auto_1861357 ?auto_1861364 ) ) ( not ( = ?auto_1861357 ?auto_1861365 ) ) ( not ( = ?auto_1861357 ?auto_1861366 ) ) ( not ( = ?auto_1861357 ?auto_1861367 ) ) ( not ( = ?auto_1861357 ?auto_1861368 ) ) ( not ( = ?auto_1861357 ?auto_1861370 ) ) ( not ( = ?auto_1861361 ?auto_1861363 ) ) ( not ( = ?auto_1861361 ?auto_1861362 ) ) ( not ( = ?auto_1861361 ?auto_1861364 ) ) ( not ( = ?auto_1861361 ?auto_1861365 ) ) ( not ( = ?auto_1861361 ?auto_1861366 ) ) ( not ( = ?auto_1861361 ?auto_1861367 ) ) ( not ( = ?auto_1861361 ?auto_1861368 ) ) ( not ( = ?auto_1861361 ?auto_1861370 ) ) ( not ( = ?auto_1861363 ?auto_1861362 ) ) ( not ( = ?auto_1861363 ?auto_1861364 ) ) ( not ( = ?auto_1861363 ?auto_1861365 ) ) ( not ( = ?auto_1861363 ?auto_1861366 ) ) ( not ( = ?auto_1861363 ?auto_1861367 ) ) ( not ( = ?auto_1861363 ?auto_1861368 ) ) ( not ( = ?auto_1861363 ?auto_1861370 ) ) ( not ( = ?auto_1861362 ?auto_1861364 ) ) ( not ( = ?auto_1861362 ?auto_1861365 ) ) ( not ( = ?auto_1861362 ?auto_1861366 ) ) ( not ( = ?auto_1861362 ?auto_1861367 ) ) ( not ( = ?auto_1861362 ?auto_1861368 ) ) ( not ( = ?auto_1861362 ?auto_1861370 ) ) ( not ( = ?auto_1861364 ?auto_1861365 ) ) ( not ( = ?auto_1861364 ?auto_1861366 ) ) ( not ( = ?auto_1861364 ?auto_1861367 ) ) ( not ( = ?auto_1861364 ?auto_1861368 ) ) ( not ( = ?auto_1861364 ?auto_1861370 ) ) ( not ( = ?auto_1861365 ?auto_1861366 ) ) ( not ( = ?auto_1861365 ?auto_1861367 ) ) ( not ( = ?auto_1861365 ?auto_1861368 ) ) ( not ( = ?auto_1861365 ?auto_1861370 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861366 ?auto_1861367 ?auto_1861368 )
      ( MAKE-11CRATE-VERIFY ?auto_1861358 ?auto_1861359 ?auto_1861360 ?auto_1861357 ?auto_1861361 ?auto_1861363 ?auto_1861362 ?auto_1861364 ?auto_1861365 ?auto_1861366 ?auto_1861367 ?auto_1861368 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1861376 - SURFACE
      ?auto_1861377 - SURFACE
      ?auto_1861378 - SURFACE
      ?auto_1861375 - SURFACE
      ?auto_1861379 - SURFACE
      ?auto_1861381 - SURFACE
      ?auto_1861380 - SURFACE
      ?auto_1861382 - SURFACE
      ?auto_1861383 - SURFACE
      ?auto_1861384 - SURFACE
      ?auto_1861385 - SURFACE
      ?auto_1861386 - SURFACE
      ?auto_1861387 - SURFACE
    )
    :vars
    (
      ?auto_1861390 - HOIST
      ?auto_1861388 - PLACE
      ?auto_1861392 - PLACE
      ?auto_1861391 - HOIST
      ?auto_1861389 - SURFACE
      ?auto_1861393 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861390 ?auto_1861388 ) ( IS-CRATE ?auto_1861387 ) ( not ( = ?auto_1861386 ?auto_1861387 ) ) ( not ( = ?auto_1861385 ?auto_1861386 ) ) ( not ( = ?auto_1861385 ?auto_1861387 ) ) ( not ( = ?auto_1861392 ?auto_1861388 ) ) ( HOIST-AT ?auto_1861391 ?auto_1861392 ) ( not ( = ?auto_1861390 ?auto_1861391 ) ) ( AVAILABLE ?auto_1861391 ) ( SURFACE-AT ?auto_1861387 ?auto_1861392 ) ( ON ?auto_1861387 ?auto_1861389 ) ( CLEAR ?auto_1861387 ) ( not ( = ?auto_1861386 ?auto_1861389 ) ) ( not ( = ?auto_1861387 ?auto_1861389 ) ) ( not ( = ?auto_1861385 ?auto_1861389 ) ) ( SURFACE-AT ?auto_1861385 ?auto_1861388 ) ( CLEAR ?auto_1861385 ) ( IS-CRATE ?auto_1861386 ) ( AVAILABLE ?auto_1861390 ) ( IN ?auto_1861386 ?auto_1861393 ) ( TRUCK-AT ?auto_1861393 ?auto_1861392 ) ( ON ?auto_1861377 ?auto_1861376 ) ( ON ?auto_1861378 ?auto_1861377 ) ( ON ?auto_1861375 ?auto_1861378 ) ( ON ?auto_1861379 ?auto_1861375 ) ( ON ?auto_1861381 ?auto_1861379 ) ( ON ?auto_1861380 ?auto_1861381 ) ( ON ?auto_1861382 ?auto_1861380 ) ( ON ?auto_1861383 ?auto_1861382 ) ( ON ?auto_1861384 ?auto_1861383 ) ( ON ?auto_1861385 ?auto_1861384 ) ( not ( = ?auto_1861376 ?auto_1861377 ) ) ( not ( = ?auto_1861376 ?auto_1861378 ) ) ( not ( = ?auto_1861376 ?auto_1861375 ) ) ( not ( = ?auto_1861376 ?auto_1861379 ) ) ( not ( = ?auto_1861376 ?auto_1861381 ) ) ( not ( = ?auto_1861376 ?auto_1861380 ) ) ( not ( = ?auto_1861376 ?auto_1861382 ) ) ( not ( = ?auto_1861376 ?auto_1861383 ) ) ( not ( = ?auto_1861376 ?auto_1861384 ) ) ( not ( = ?auto_1861376 ?auto_1861385 ) ) ( not ( = ?auto_1861376 ?auto_1861386 ) ) ( not ( = ?auto_1861376 ?auto_1861387 ) ) ( not ( = ?auto_1861376 ?auto_1861389 ) ) ( not ( = ?auto_1861377 ?auto_1861378 ) ) ( not ( = ?auto_1861377 ?auto_1861375 ) ) ( not ( = ?auto_1861377 ?auto_1861379 ) ) ( not ( = ?auto_1861377 ?auto_1861381 ) ) ( not ( = ?auto_1861377 ?auto_1861380 ) ) ( not ( = ?auto_1861377 ?auto_1861382 ) ) ( not ( = ?auto_1861377 ?auto_1861383 ) ) ( not ( = ?auto_1861377 ?auto_1861384 ) ) ( not ( = ?auto_1861377 ?auto_1861385 ) ) ( not ( = ?auto_1861377 ?auto_1861386 ) ) ( not ( = ?auto_1861377 ?auto_1861387 ) ) ( not ( = ?auto_1861377 ?auto_1861389 ) ) ( not ( = ?auto_1861378 ?auto_1861375 ) ) ( not ( = ?auto_1861378 ?auto_1861379 ) ) ( not ( = ?auto_1861378 ?auto_1861381 ) ) ( not ( = ?auto_1861378 ?auto_1861380 ) ) ( not ( = ?auto_1861378 ?auto_1861382 ) ) ( not ( = ?auto_1861378 ?auto_1861383 ) ) ( not ( = ?auto_1861378 ?auto_1861384 ) ) ( not ( = ?auto_1861378 ?auto_1861385 ) ) ( not ( = ?auto_1861378 ?auto_1861386 ) ) ( not ( = ?auto_1861378 ?auto_1861387 ) ) ( not ( = ?auto_1861378 ?auto_1861389 ) ) ( not ( = ?auto_1861375 ?auto_1861379 ) ) ( not ( = ?auto_1861375 ?auto_1861381 ) ) ( not ( = ?auto_1861375 ?auto_1861380 ) ) ( not ( = ?auto_1861375 ?auto_1861382 ) ) ( not ( = ?auto_1861375 ?auto_1861383 ) ) ( not ( = ?auto_1861375 ?auto_1861384 ) ) ( not ( = ?auto_1861375 ?auto_1861385 ) ) ( not ( = ?auto_1861375 ?auto_1861386 ) ) ( not ( = ?auto_1861375 ?auto_1861387 ) ) ( not ( = ?auto_1861375 ?auto_1861389 ) ) ( not ( = ?auto_1861379 ?auto_1861381 ) ) ( not ( = ?auto_1861379 ?auto_1861380 ) ) ( not ( = ?auto_1861379 ?auto_1861382 ) ) ( not ( = ?auto_1861379 ?auto_1861383 ) ) ( not ( = ?auto_1861379 ?auto_1861384 ) ) ( not ( = ?auto_1861379 ?auto_1861385 ) ) ( not ( = ?auto_1861379 ?auto_1861386 ) ) ( not ( = ?auto_1861379 ?auto_1861387 ) ) ( not ( = ?auto_1861379 ?auto_1861389 ) ) ( not ( = ?auto_1861381 ?auto_1861380 ) ) ( not ( = ?auto_1861381 ?auto_1861382 ) ) ( not ( = ?auto_1861381 ?auto_1861383 ) ) ( not ( = ?auto_1861381 ?auto_1861384 ) ) ( not ( = ?auto_1861381 ?auto_1861385 ) ) ( not ( = ?auto_1861381 ?auto_1861386 ) ) ( not ( = ?auto_1861381 ?auto_1861387 ) ) ( not ( = ?auto_1861381 ?auto_1861389 ) ) ( not ( = ?auto_1861380 ?auto_1861382 ) ) ( not ( = ?auto_1861380 ?auto_1861383 ) ) ( not ( = ?auto_1861380 ?auto_1861384 ) ) ( not ( = ?auto_1861380 ?auto_1861385 ) ) ( not ( = ?auto_1861380 ?auto_1861386 ) ) ( not ( = ?auto_1861380 ?auto_1861387 ) ) ( not ( = ?auto_1861380 ?auto_1861389 ) ) ( not ( = ?auto_1861382 ?auto_1861383 ) ) ( not ( = ?auto_1861382 ?auto_1861384 ) ) ( not ( = ?auto_1861382 ?auto_1861385 ) ) ( not ( = ?auto_1861382 ?auto_1861386 ) ) ( not ( = ?auto_1861382 ?auto_1861387 ) ) ( not ( = ?auto_1861382 ?auto_1861389 ) ) ( not ( = ?auto_1861383 ?auto_1861384 ) ) ( not ( = ?auto_1861383 ?auto_1861385 ) ) ( not ( = ?auto_1861383 ?auto_1861386 ) ) ( not ( = ?auto_1861383 ?auto_1861387 ) ) ( not ( = ?auto_1861383 ?auto_1861389 ) ) ( not ( = ?auto_1861384 ?auto_1861385 ) ) ( not ( = ?auto_1861384 ?auto_1861386 ) ) ( not ( = ?auto_1861384 ?auto_1861387 ) ) ( not ( = ?auto_1861384 ?auto_1861389 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861385 ?auto_1861386 ?auto_1861387 )
      ( MAKE-12CRATE-VERIFY ?auto_1861376 ?auto_1861377 ?auto_1861378 ?auto_1861375 ?auto_1861379 ?auto_1861381 ?auto_1861380 ?auto_1861382 ?auto_1861383 ?auto_1861384 ?auto_1861385 ?auto_1861386 ?auto_1861387 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1861395 - SURFACE
      ?auto_1861396 - SURFACE
      ?auto_1861397 - SURFACE
      ?auto_1861394 - SURFACE
      ?auto_1861398 - SURFACE
      ?auto_1861400 - SURFACE
      ?auto_1861399 - SURFACE
      ?auto_1861401 - SURFACE
      ?auto_1861402 - SURFACE
      ?auto_1861403 - SURFACE
      ?auto_1861404 - SURFACE
      ?auto_1861405 - SURFACE
      ?auto_1861406 - SURFACE
      ?auto_1861407 - SURFACE
    )
    :vars
    (
      ?auto_1861410 - HOIST
      ?auto_1861408 - PLACE
      ?auto_1861412 - PLACE
      ?auto_1861411 - HOIST
      ?auto_1861409 - SURFACE
      ?auto_1861413 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861410 ?auto_1861408 ) ( IS-CRATE ?auto_1861407 ) ( not ( = ?auto_1861406 ?auto_1861407 ) ) ( not ( = ?auto_1861405 ?auto_1861406 ) ) ( not ( = ?auto_1861405 ?auto_1861407 ) ) ( not ( = ?auto_1861412 ?auto_1861408 ) ) ( HOIST-AT ?auto_1861411 ?auto_1861412 ) ( not ( = ?auto_1861410 ?auto_1861411 ) ) ( AVAILABLE ?auto_1861411 ) ( SURFACE-AT ?auto_1861407 ?auto_1861412 ) ( ON ?auto_1861407 ?auto_1861409 ) ( CLEAR ?auto_1861407 ) ( not ( = ?auto_1861406 ?auto_1861409 ) ) ( not ( = ?auto_1861407 ?auto_1861409 ) ) ( not ( = ?auto_1861405 ?auto_1861409 ) ) ( SURFACE-AT ?auto_1861405 ?auto_1861408 ) ( CLEAR ?auto_1861405 ) ( IS-CRATE ?auto_1861406 ) ( AVAILABLE ?auto_1861410 ) ( IN ?auto_1861406 ?auto_1861413 ) ( TRUCK-AT ?auto_1861413 ?auto_1861412 ) ( ON ?auto_1861396 ?auto_1861395 ) ( ON ?auto_1861397 ?auto_1861396 ) ( ON ?auto_1861394 ?auto_1861397 ) ( ON ?auto_1861398 ?auto_1861394 ) ( ON ?auto_1861400 ?auto_1861398 ) ( ON ?auto_1861399 ?auto_1861400 ) ( ON ?auto_1861401 ?auto_1861399 ) ( ON ?auto_1861402 ?auto_1861401 ) ( ON ?auto_1861403 ?auto_1861402 ) ( ON ?auto_1861404 ?auto_1861403 ) ( ON ?auto_1861405 ?auto_1861404 ) ( not ( = ?auto_1861395 ?auto_1861396 ) ) ( not ( = ?auto_1861395 ?auto_1861397 ) ) ( not ( = ?auto_1861395 ?auto_1861394 ) ) ( not ( = ?auto_1861395 ?auto_1861398 ) ) ( not ( = ?auto_1861395 ?auto_1861400 ) ) ( not ( = ?auto_1861395 ?auto_1861399 ) ) ( not ( = ?auto_1861395 ?auto_1861401 ) ) ( not ( = ?auto_1861395 ?auto_1861402 ) ) ( not ( = ?auto_1861395 ?auto_1861403 ) ) ( not ( = ?auto_1861395 ?auto_1861404 ) ) ( not ( = ?auto_1861395 ?auto_1861405 ) ) ( not ( = ?auto_1861395 ?auto_1861406 ) ) ( not ( = ?auto_1861395 ?auto_1861407 ) ) ( not ( = ?auto_1861395 ?auto_1861409 ) ) ( not ( = ?auto_1861396 ?auto_1861397 ) ) ( not ( = ?auto_1861396 ?auto_1861394 ) ) ( not ( = ?auto_1861396 ?auto_1861398 ) ) ( not ( = ?auto_1861396 ?auto_1861400 ) ) ( not ( = ?auto_1861396 ?auto_1861399 ) ) ( not ( = ?auto_1861396 ?auto_1861401 ) ) ( not ( = ?auto_1861396 ?auto_1861402 ) ) ( not ( = ?auto_1861396 ?auto_1861403 ) ) ( not ( = ?auto_1861396 ?auto_1861404 ) ) ( not ( = ?auto_1861396 ?auto_1861405 ) ) ( not ( = ?auto_1861396 ?auto_1861406 ) ) ( not ( = ?auto_1861396 ?auto_1861407 ) ) ( not ( = ?auto_1861396 ?auto_1861409 ) ) ( not ( = ?auto_1861397 ?auto_1861394 ) ) ( not ( = ?auto_1861397 ?auto_1861398 ) ) ( not ( = ?auto_1861397 ?auto_1861400 ) ) ( not ( = ?auto_1861397 ?auto_1861399 ) ) ( not ( = ?auto_1861397 ?auto_1861401 ) ) ( not ( = ?auto_1861397 ?auto_1861402 ) ) ( not ( = ?auto_1861397 ?auto_1861403 ) ) ( not ( = ?auto_1861397 ?auto_1861404 ) ) ( not ( = ?auto_1861397 ?auto_1861405 ) ) ( not ( = ?auto_1861397 ?auto_1861406 ) ) ( not ( = ?auto_1861397 ?auto_1861407 ) ) ( not ( = ?auto_1861397 ?auto_1861409 ) ) ( not ( = ?auto_1861394 ?auto_1861398 ) ) ( not ( = ?auto_1861394 ?auto_1861400 ) ) ( not ( = ?auto_1861394 ?auto_1861399 ) ) ( not ( = ?auto_1861394 ?auto_1861401 ) ) ( not ( = ?auto_1861394 ?auto_1861402 ) ) ( not ( = ?auto_1861394 ?auto_1861403 ) ) ( not ( = ?auto_1861394 ?auto_1861404 ) ) ( not ( = ?auto_1861394 ?auto_1861405 ) ) ( not ( = ?auto_1861394 ?auto_1861406 ) ) ( not ( = ?auto_1861394 ?auto_1861407 ) ) ( not ( = ?auto_1861394 ?auto_1861409 ) ) ( not ( = ?auto_1861398 ?auto_1861400 ) ) ( not ( = ?auto_1861398 ?auto_1861399 ) ) ( not ( = ?auto_1861398 ?auto_1861401 ) ) ( not ( = ?auto_1861398 ?auto_1861402 ) ) ( not ( = ?auto_1861398 ?auto_1861403 ) ) ( not ( = ?auto_1861398 ?auto_1861404 ) ) ( not ( = ?auto_1861398 ?auto_1861405 ) ) ( not ( = ?auto_1861398 ?auto_1861406 ) ) ( not ( = ?auto_1861398 ?auto_1861407 ) ) ( not ( = ?auto_1861398 ?auto_1861409 ) ) ( not ( = ?auto_1861400 ?auto_1861399 ) ) ( not ( = ?auto_1861400 ?auto_1861401 ) ) ( not ( = ?auto_1861400 ?auto_1861402 ) ) ( not ( = ?auto_1861400 ?auto_1861403 ) ) ( not ( = ?auto_1861400 ?auto_1861404 ) ) ( not ( = ?auto_1861400 ?auto_1861405 ) ) ( not ( = ?auto_1861400 ?auto_1861406 ) ) ( not ( = ?auto_1861400 ?auto_1861407 ) ) ( not ( = ?auto_1861400 ?auto_1861409 ) ) ( not ( = ?auto_1861399 ?auto_1861401 ) ) ( not ( = ?auto_1861399 ?auto_1861402 ) ) ( not ( = ?auto_1861399 ?auto_1861403 ) ) ( not ( = ?auto_1861399 ?auto_1861404 ) ) ( not ( = ?auto_1861399 ?auto_1861405 ) ) ( not ( = ?auto_1861399 ?auto_1861406 ) ) ( not ( = ?auto_1861399 ?auto_1861407 ) ) ( not ( = ?auto_1861399 ?auto_1861409 ) ) ( not ( = ?auto_1861401 ?auto_1861402 ) ) ( not ( = ?auto_1861401 ?auto_1861403 ) ) ( not ( = ?auto_1861401 ?auto_1861404 ) ) ( not ( = ?auto_1861401 ?auto_1861405 ) ) ( not ( = ?auto_1861401 ?auto_1861406 ) ) ( not ( = ?auto_1861401 ?auto_1861407 ) ) ( not ( = ?auto_1861401 ?auto_1861409 ) ) ( not ( = ?auto_1861402 ?auto_1861403 ) ) ( not ( = ?auto_1861402 ?auto_1861404 ) ) ( not ( = ?auto_1861402 ?auto_1861405 ) ) ( not ( = ?auto_1861402 ?auto_1861406 ) ) ( not ( = ?auto_1861402 ?auto_1861407 ) ) ( not ( = ?auto_1861402 ?auto_1861409 ) ) ( not ( = ?auto_1861403 ?auto_1861404 ) ) ( not ( = ?auto_1861403 ?auto_1861405 ) ) ( not ( = ?auto_1861403 ?auto_1861406 ) ) ( not ( = ?auto_1861403 ?auto_1861407 ) ) ( not ( = ?auto_1861403 ?auto_1861409 ) ) ( not ( = ?auto_1861404 ?auto_1861405 ) ) ( not ( = ?auto_1861404 ?auto_1861406 ) ) ( not ( = ?auto_1861404 ?auto_1861407 ) ) ( not ( = ?auto_1861404 ?auto_1861409 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861405 ?auto_1861406 ?auto_1861407 )
      ( MAKE-13CRATE-VERIFY ?auto_1861395 ?auto_1861396 ?auto_1861397 ?auto_1861394 ?auto_1861398 ?auto_1861400 ?auto_1861399 ?auto_1861401 ?auto_1861402 ?auto_1861403 ?auto_1861404 ?auto_1861405 ?auto_1861406 ?auto_1861407 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1861443 - SURFACE
      ?auto_1861444 - SURFACE
      ?auto_1861445 - SURFACE
      ?auto_1861442 - SURFACE
      ?auto_1861446 - SURFACE
    )
    :vars
    (
      ?auto_1861450 - HOIST
      ?auto_1861451 - PLACE
      ?auto_1861447 - PLACE
      ?auto_1861449 - HOIST
      ?auto_1861452 - SURFACE
      ?auto_1861448 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861450 ?auto_1861451 ) ( IS-CRATE ?auto_1861446 ) ( not ( = ?auto_1861442 ?auto_1861446 ) ) ( not ( = ?auto_1861445 ?auto_1861442 ) ) ( not ( = ?auto_1861445 ?auto_1861446 ) ) ( not ( = ?auto_1861447 ?auto_1861451 ) ) ( HOIST-AT ?auto_1861449 ?auto_1861447 ) ( not ( = ?auto_1861450 ?auto_1861449 ) ) ( SURFACE-AT ?auto_1861446 ?auto_1861447 ) ( ON ?auto_1861446 ?auto_1861452 ) ( CLEAR ?auto_1861446 ) ( not ( = ?auto_1861442 ?auto_1861452 ) ) ( not ( = ?auto_1861446 ?auto_1861452 ) ) ( not ( = ?auto_1861445 ?auto_1861452 ) ) ( SURFACE-AT ?auto_1861445 ?auto_1861451 ) ( CLEAR ?auto_1861445 ) ( IS-CRATE ?auto_1861442 ) ( AVAILABLE ?auto_1861450 ) ( TRUCK-AT ?auto_1861448 ?auto_1861447 ) ( LIFTING ?auto_1861449 ?auto_1861442 ) ( ON ?auto_1861444 ?auto_1861443 ) ( ON ?auto_1861445 ?auto_1861444 ) ( not ( = ?auto_1861443 ?auto_1861444 ) ) ( not ( = ?auto_1861443 ?auto_1861445 ) ) ( not ( = ?auto_1861443 ?auto_1861442 ) ) ( not ( = ?auto_1861443 ?auto_1861446 ) ) ( not ( = ?auto_1861443 ?auto_1861452 ) ) ( not ( = ?auto_1861444 ?auto_1861445 ) ) ( not ( = ?auto_1861444 ?auto_1861442 ) ) ( not ( = ?auto_1861444 ?auto_1861446 ) ) ( not ( = ?auto_1861444 ?auto_1861452 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861445 ?auto_1861442 ?auto_1861446 )
      ( MAKE-4CRATE-VERIFY ?auto_1861443 ?auto_1861444 ?auto_1861445 ?auto_1861442 ?auto_1861446 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1861454 - SURFACE
      ?auto_1861455 - SURFACE
      ?auto_1861456 - SURFACE
      ?auto_1861453 - SURFACE
      ?auto_1861457 - SURFACE
      ?auto_1861458 - SURFACE
    )
    :vars
    (
      ?auto_1861462 - HOIST
      ?auto_1861463 - PLACE
      ?auto_1861459 - PLACE
      ?auto_1861461 - HOIST
      ?auto_1861464 - SURFACE
      ?auto_1861460 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861462 ?auto_1861463 ) ( IS-CRATE ?auto_1861458 ) ( not ( = ?auto_1861457 ?auto_1861458 ) ) ( not ( = ?auto_1861453 ?auto_1861457 ) ) ( not ( = ?auto_1861453 ?auto_1861458 ) ) ( not ( = ?auto_1861459 ?auto_1861463 ) ) ( HOIST-AT ?auto_1861461 ?auto_1861459 ) ( not ( = ?auto_1861462 ?auto_1861461 ) ) ( SURFACE-AT ?auto_1861458 ?auto_1861459 ) ( ON ?auto_1861458 ?auto_1861464 ) ( CLEAR ?auto_1861458 ) ( not ( = ?auto_1861457 ?auto_1861464 ) ) ( not ( = ?auto_1861458 ?auto_1861464 ) ) ( not ( = ?auto_1861453 ?auto_1861464 ) ) ( SURFACE-AT ?auto_1861453 ?auto_1861463 ) ( CLEAR ?auto_1861453 ) ( IS-CRATE ?auto_1861457 ) ( AVAILABLE ?auto_1861462 ) ( TRUCK-AT ?auto_1861460 ?auto_1861459 ) ( LIFTING ?auto_1861461 ?auto_1861457 ) ( ON ?auto_1861455 ?auto_1861454 ) ( ON ?auto_1861456 ?auto_1861455 ) ( ON ?auto_1861453 ?auto_1861456 ) ( not ( = ?auto_1861454 ?auto_1861455 ) ) ( not ( = ?auto_1861454 ?auto_1861456 ) ) ( not ( = ?auto_1861454 ?auto_1861453 ) ) ( not ( = ?auto_1861454 ?auto_1861457 ) ) ( not ( = ?auto_1861454 ?auto_1861458 ) ) ( not ( = ?auto_1861454 ?auto_1861464 ) ) ( not ( = ?auto_1861455 ?auto_1861456 ) ) ( not ( = ?auto_1861455 ?auto_1861453 ) ) ( not ( = ?auto_1861455 ?auto_1861457 ) ) ( not ( = ?auto_1861455 ?auto_1861458 ) ) ( not ( = ?auto_1861455 ?auto_1861464 ) ) ( not ( = ?auto_1861456 ?auto_1861453 ) ) ( not ( = ?auto_1861456 ?auto_1861457 ) ) ( not ( = ?auto_1861456 ?auto_1861458 ) ) ( not ( = ?auto_1861456 ?auto_1861464 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861453 ?auto_1861457 ?auto_1861458 )
      ( MAKE-5CRATE-VERIFY ?auto_1861454 ?auto_1861455 ?auto_1861456 ?auto_1861453 ?auto_1861457 ?auto_1861458 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1861466 - SURFACE
      ?auto_1861467 - SURFACE
      ?auto_1861468 - SURFACE
      ?auto_1861465 - SURFACE
      ?auto_1861469 - SURFACE
      ?auto_1861471 - SURFACE
      ?auto_1861470 - SURFACE
    )
    :vars
    (
      ?auto_1861475 - HOIST
      ?auto_1861476 - PLACE
      ?auto_1861472 - PLACE
      ?auto_1861474 - HOIST
      ?auto_1861477 - SURFACE
      ?auto_1861473 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861475 ?auto_1861476 ) ( IS-CRATE ?auto_1861470 ) ( not ( = ?auto_1861471 ?auto_1861470 ) ) ( not ( = ?auto_1861469 ?auto_1861471 ) ) ( not ( = ?auto_1861469 ?auto_1861470 ) ) ( not ( = ?auto_1861472 ?auto_1861476 ) ) ( HOIST-AT ?auto_1861474 ?auto_1861472 ) ( not ( = ?auto_1861475 ?auto_1861474 ) ) ( SURFACE-AT ?auto_1861470 ?auto_1861472 ) ( ON ?auto_1861470 ?auto_1861477 ) ( CLEAR ?auto_1861470 ) ( not ( = ?auto_1861471 ?auto_1861477 ) ) ( not ( = ?auto_1861470 ?auto_1861477 ) ) ( not ( = ?auto_1861469 ?auto_1861477 ) ) ( SURFACE-AT ?auto_1861469 ?auto_1861476 ) ( CLEAR ?auto_1861469 ) ( IS-CRATE ?auto_1861471 ) ( AVAILABLE ?auto_1861475 ) ( TRUCK-AT ?auto_1861473 ?auto_1861472 ) ( LIFTING ?auto_1861474 ?auto_1861471 ) ( ON ?auto_1861467 ?auto_1861466 ) ( ON ?auto_1861468 ?auto_1861467 ) ( ON ?auto_1861465 ?auto_1861468 ) ( ON ?auto_1861469 ?auto_1861465 ) ( not ( = ?auto_1861466 ?auto_1861467 ) ) ( not ( = ?auto_1861466 ?auto_1861468 ) ) ( not ( = ?auto_1861466 ?auto_1861465 ) ) ( not ( = ?auto_1861466 ?auto_1861469 ) ) ( not ( = ?auto_1861466 ?auto_1861471 ) ) ( not ( = ?auto_1861466 ?auto_1861470 ) ) ( not ( = ?auto_1861466 ?auto_1861477 ) ) ( not ( = ?auto_1861467 ?auto_1861468 ) ) ( not ( = ?auto_1861467 ?auto_1861465 ) ) ( not ( = ?auto_1861467 ?auto_1861469 ) ) ( not ( = ?auto_1861467 ?auto_1861471 ) ) ( not ( = ?auto_1861467 ?auto_1861470 ) ) ( not ( = ?auto_1861467 ?auto_1861477 ) ) ( not ( = ?auto_1861468 ?auto_1861465 ) ) ( not ( = ?auto_1861468 ?auto_1861469 ) ) ( not ( = ?auto_1861468 ?auto_1861471 ) ) ( not ( = ?auto_1861468 ?auto_1861470 ) ) ( not ( = ?auto_1861468 ?auto_1861477 ) ) ( not ( = ?auto_1861465 ?auto_1861469 ) ) ( not ( = ?auto_1861465 ?auto_1861471 ) ) ( not ( = ?auto_1861465 ?auto_1861470 ) ) ( not ( = ?auto_1861465 ?auto_1861477 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861469 ?auto_1861471 ?auto_1861470 )
      ( MAKE-6CRATE-VERIFY ?auto_1861466 ?auto_1861467 ?auto_1861468 ?auto_1861465 ?auto_1861469 ?auto_1861471 ?auto_1861470 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1861479 - SURFACE
      ?auto_1861480 - SURFACE
      ?auto_1861481 - SURFACE
      ?auto_1861478 - SURFACE
      ?auto_1861482 - SURFACE
      ?auto_1861484 - SURFACE
      ?auto_1861483 - SURFACE
      ?auto_1861485 - SURFACE
    )
    :vars
    (
      ?auto_1861489 - HOIST
      ?auto_1861490 - PLACE
      ?auto_1861486 - PLACE
      ?auto_1861488 - HOIST
      ?auto_1861491 - SURFACE
      ?auto_1861487 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861489 ?auto_1861490 ) ( IS-CRATE ?auto_1861485 ) ( not ( = ?auto_1861483 ?auto_1861485 ) ) ( not ( = ?auto_1861484 ?auto_1861483 ) ) ( not ( = ?auto_1861484 ?auto_1861485 ) ) ( not ( = ?auto_1861486 ?auto_1861490 ) ) ( HOIST-AT ?auto_1861488 ?auto_1861486 ) ( not ( = ?auto_1861489 ?auto_1861488 ) ) ( SURFACE-AT ?auto_1861485 ?auto_1861486 ) ( ON ?auto_1861485 ?auto_1861491 ) ( CLEAR ?auto_1861485 ) ( not ( = ?auto_1861483 ?auto_1861491 ) ) ( not ( = ?auto_1861485 ?auto_1861491 ) ) ( not ( = ?auto_1861484 ?auto_1861491 ) ) ( SURFACE-AT ?auto_1861484 ?auto_1861490 ) ( CLEAR ?auto_1861484 ) ( IS-CRATE ?auto_1861483 ) ( AVAILABLE ?auto_1861489 ) ( TRUCK-AT ?auto_1861487 ?auto_1861486 ) ( LIFTING ?auto_1861488 ?auto_1861483 ) ( ON ?auto_1861480 ?auto_1861479 ) ( ON ?auto_1861481 ?auto_1861480 ) ( ON ?auto_1861478 ?auto_1861481 ) ( ON ?auto_1861482 ?auto_1861478 ) ( ON ?auto_1861484 ?auto_1861482 ) ( not ( = ?auto_1861479 ?auto_1861480 ) ) ( not ( = ?auto_1861479 ?auto_1861481 ) ) ( not ( = ?auto_1861479 ?auto_1861478 ) ) ( not ( = ?auto_1861479 ?auto_1861482 ) ) ( not ( = ?auto_1861479 ?auto_1861484 ) ) ( not ( = ?auto_1861479 ?auto_1861483 ) ) ( not ( = ?auto_1861479 ?auto_1861485 ) ) ( not ( = ?auto_1861479 ?auto_1861491 ) ) ( not ( = ?auto_1861480 ?auto_1861481 ) ) ( not ( = ?auto_1861480 ?auto_1861478 ) ) ( not ( = ?auto_1861480 ?auto_1861482 ) ) ( not ( = ?auto_1861480 ?auto_1861484 ) ) ( not ( = ?auto_1861480 ?auto_1861483 ) ) ( not ( = ?auto_1861480 ?auto_1861485 ) ) ( not ( = ?auto_1861480 ?auto_1861491 ) ) ( not ( = ?auto_1861481 ?auto_1861478 ) ) ( not ( = ?auto_1861481 ?auto_1861482 ) ) ( not ( = ?auto_1861481 ?auto_1861484 ) ) ( not ( = ?auto_1861481 ?auto_1861483 ) ) ( not ( = ?auto_1861481 ?auto_1861485 ) ) ( not ( = ?auto_1861481 ?auto_1861491 ) ) ( not ( = ?auto_1861478 ?auto_1861482 ) ) ( not ( = ?auto_1861478 ?auto_1861484 ) ) ( not ( = ?auto_1861478 ?auto_1861483 ) ) ( not ( = ?auto_1861478 ?auto_1861485 ) ) ( not ( = ?auto_1861478 ?auto_1861491 ) ) ( not ( = ?auto_1861482 ?auto_1861484 ) ) ( not ( = ?auto_1861482 ?auto_1861483 ) ) ( not ( = ?auto_1861482 ?auto_1861485 ) ) ( not ( = ?auto_1861482 ?auto_1861491 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861484 ?auto_1861483 ?auto_1861485 )
      ( MAKE-7CRATE-VERIFY ?auto_1861479 ?auto_1861480 ?auto_1861481 ?auto_1861478 ?auto_1861482 ?auto_1861484 ?auto_1861483 ?auto_1861485 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1861493 - SURFACE
      ?auto_1861494 - SURFACE
      ?auto_1861495 - SURFACE
      ?auto_1861492 - SURFACE
      ?auto_1861496 - SURFACE
      ?auto_1861498 - SURFACE
      ?auto_1861497 - SURFACE
      ?auto_1861499 - SURFACE
      ?auto_1861500 - SURFACE
    )
    :vars
    (
      ?auto_1861504 - HOIST
      ?auto_1861505 - PLACE
      ?auto_1861501 - PLACE
      ?auto_1861503 - HOIST
      ?auto_1861506 - SURFACE
      ?auto_1861502 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861504 ?auto_1861505 ) ( IS-CRATE ?auto_1861500 ) ( not ( = ?auto_1861499 ?auto_1861500 ) ) ( not ( = ?auto_1861497 ?auto_1861499 ) ) ( not ( = ?auto_1861497 ?auto_1861500 ) ) ( not ( = ?auto_1861501 ?auto_1861505 ) ) ( HOIST-AT ?auto_1861503 ?auto_1861501 ) ( not ( = ?auto_1861504 ?auto_1861503 ) ) ( SURFACE-AT ?auto_1861500 ?auto_1861501 ) ( ON ?auto_1861500 ?auto_1861506 ) ( CLEAR ?auto_1861500 ) ( not ( = ?auto_1861499 ?auto_1861506 ) ) ( not ( = ?auto_1861500 ?auto_1861506 ) ) ( not ( = ?auto_1861497 ?auto_1861506 ) ) ( SURFACE-AT ?auto_1861497 ?auto_1861505 ) ( CLEAR ?auto_1861497 ) ( IS-CRATE ?auto_1861499 ) ( AVAILABLE ?auto_1861504 ) ( TRUCK-AT ?auto_1861502 ?auto_1861501 ) ( LIFTING ?auto_1861503 ?auto_1861499 ) ( ON ?auto_1861494 ?auto_1861493 ) ( ON ?auto_1861495 ?auto_1861494 ) ( ON ?auto_1861492 ?auto_1861495 ) ( ON ?auto_1861496 ?auto_1861492 ) ( ON ?auto_1861498 ?auto_1861496 ) ( ON ?auto_1861497 ?auto_1861498 ) ( not ( = ?auto_1861493 ?auto_1861494 ) ) ( not ( = ?auto_1861493 ?auto_1861495 ) ) ( not ( = ?auto_1861493 ?auto_1861492 ) ) ( not ( = ?auto_1861493 ?auto_1861496 ) ) ( not ( = ?auto_1861493 ?auto_1861498 ) ) ( not ( = ?auto_1861493 ?auto_1861497 ) ) ( not ( = ?auto_1861493 ?auto_1861499 ) ) ( not ( = ?auto_1861493 ?auto_1861500 ) ) ( not ( = ?auto_1861493 ?auto_1861506 ) ) ( not ( = ?auto_1861494 ?auto_1861495 ) ) ( not ( = ?auto_1861494 ?auto_1861492 ) ) ( not ( = ?auto_1861494 ?auto_1861496 ) ) ( not ( = ?auto_1861494 ?auto_1861498 ) ) ( not ( = ?auto_1861494 ?auto_1861497 ) ) ( not ( = ?auto_1861494 ?auto_1861499 ) ) ( not ( = ?auto_1861494 ?auto_1861500 ) ) ( not ( = ?auto_1861494 ?auto_1861506 ) ) ( not ( = ?auto_1861495 ?auto_1861492 ) ) ( not ( = ?auto_1861495 ?auto_1861496 ) ) ( not ( = ?auto_1861495 ?auto_1861498 ) ) ( not ( = ?auto_1861495 ?auto_1861497 ) ) ( not ( = ?auto_1861495 ?auto_1861499 ) ) ( not ( = ?auto_1861495 ?auto_1861500 ) ) ( not ( = ?auto_1861495 ?auto_1861506 ) ) ( not ( = ?auto_1861492 ?auto_1861496 ) ) ( not ( = ?auto_1861492 ?auto_1861498 ) ) ( not ( = ?auto_1861492 ?auto_1861497 ) ) ( not ( = ?auto_1861492 ?auto_1861499 ) ) ( not ( = ?auto_1861492 ?auto_1861500 ) ) ( not ( = ?auto_1861492 ?auto_1861506 ) ) ( not ( = ?auto_1861496 ?auto_1861498 ) ) ( not ( = ?auto_1861496 ?auto_1861497 ) ) ( not ( = ?auto_1861496 ?auto_1861499 ) ) ( not ( = ?auto_1861496 ?auto_1861500 ) ) ( not ( = ?auto_1861496 ?auto_1861506 ) ) ( not ( = ?auto_1861498 ?auto_1861497 ) ) ( not ( = ?auto_1861498 ?auto_1861499 ) ) ( not ( = ?auto_1861498 ?auto_1861500 ) ) ( not ( = ?auto_1861498 ?auto_1861506 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861497 ?auto_1861499 ?auto_1861500 )
      ( MAKE-8CRATE-VERIFY ?auto_1861493 ?auto_1861494 ?auto_1861495 ?auto_1861492 ?auto_1861496 ?auto_1861498 ?auto_1861497 ?auto_1861499 ?auto_1861500 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1861508 - SURFACE
      ?auto_1861509 - SURFACE
      ?auto_1861510 - SURFACE
      ?auto_1861507 - SURFACE
      ?auto_1861511 - SURFACE
      ?auto_1861513 - SURFACE
      ?auto_1861512 - SURFACE
      ?auto_1861514 - SURFACE
      ?auto_1861515 - SURFACE
      ?auto_1861516 - SURFACE
    )
    :vars
    (
      ?auto_1861520 - HOIST
      ?auto_1861521 - PLACE
      ?auto_1861517 - PLACE
      ?auto_1861519 - HOIST
      ?auto_1861522 - SURFACE
      ?auto_1861518 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861520 ?auto_1861521 ) ( IS-CRATE ?auto_1861516 ) ( not ( = ?auto_1861515 ?auto_1861516 ) ) ( not ( = ?auto_1861514 ?auto_1861515 ) ) ( not ( = ?auto_1861514 ?auto_1861516 ) ) ( not ( = ?auto_1861517 ?auto_1861521 ) ) ( HOIST-AT ?auto_1861519 ?auto_1861517 ) ( not ( = ?auto_1861520 ?auto_1861519 ) ) ( SURFACE-AT ?auto_1861516 ?auto_1861517 ) ( ON ?auto_1861516 ?auto_1861522 ) ( CLEAR ?auto_1861516 ) ( not ( = ?auto_1861515 ?auto_1861522 ) ) ( not ( = ?auto_1861516 ?auto_1861522 ) ) ( not ( = ?auto_1861514 ?auto_1861522 ) ) ( SURFACE-AT ?auto_1861514 ?auto_1861521 ) ( CLEAR ?auto_1861514 ) ( IS-CRATE ?auto_1861515 ) ( AVAILABLE ?auto_1861520 ) ( TRUCK-AT ?auto_1861518 ?auto_1861517 ) ( LIFTING ?auto_1861519 ?auto_1861515 ) ( ON ?auto_1861509 ?auto_1861508 ) ( ON ?auto_1861510 ?auto_1861509 ) ( ON ?auto_1861507 ?auto_1861510 ) ( ON ?auto_1861511 ?auto_1861507 ) ( ON ?auto_1861513 ?auto_1861511 ) ( ON ?auto_1861512 ?auto_1861513 ) ( ON ?auto_1861514 ?auto_1861512 ) ( not ( = ?auto_1861508 ?auto_1861509 ) ) ( not ( = ?auto_1861508 ?auto_1861510 ) ) ( not ( = ?auto_1861508 ?auto_1861507 ) ) ( not ( = ?auto_1861508 ?auto_1861511 ) ) ( not ( = ?auto_1861508 ?auto_1861513 ) ) ( not ( = ?auto_1861508 ?auto_1861512 ) ) ( not ( = ?auto_1861508 ?auto_1861514 ) ) ( not ( = ?auto_1861508 ?auto_1861515 ) ) ( not ( = ?auto_1861508 ?auto_1861516 ) ) ( not ( = ?auto_1861508 ?auto_1861522 ) ) ( not ( = ?auto_1861509 ?auto_1861510 ) ) ( not ( = ?auto_1861509 ?auto_1861507 ) ) ( not ( = ?auto_1861509 ?auto_1861511 ) ) ( not ( = ?auto_1861509 ?auto_1861513 ) ) ( not ( = ?auto_1861509 ?auto_1861512 ) ) ( not ( = ?auto_1861509 ?auto_1861514 ) ) ( not ( = ?auto_1861509 ?auto_1861515 ) ) ( not ( = ?auto_1861509 ?auto_1861516 ) ) ( not ( = ?auto_1861509 ?auto_1861522 ) ) ( not ( = ?auto_1861510 ?auto_1861507 ) ) ( not ( = ?auto_1861510 ?auto_1861511 ) ) ( not ( = ?auto_1861510 ?auto_1861513 ) ) ( not ( = ?auto_1861510 ?auto_1861512 ) ) ( not ( = ?auto_1861510 ?auto_1861514 ) ) ( not ( = ?auto_1861510 ?auto_1861515 ) ) ( not ( = ?auto_1861510 ?auto_1861516 ) ) ( not ( = ?auto_1861510 ?auto_1861522 ) ) ( not ( = ?auto_1861507 ?auto_1861511 ) ) ( not ( = ?auto_1861507 ?auto_1861513 ) ) ( not ( = ?auto_1861507 ?auto_1861512 ) ) ( not ( = ?auto_1861507 ?auto_1861514 ) ) ( not ( = ?auto_1861507 ?auto_1861515 ) ) ( not ( = ?auto_1861507 ?auto_1861516 ) ) ( not ( = ?auto_1861507 ?auto_1861522 ) ) ( not ( = ?auto_1861511 ?auto_1861513 ) ) ( not ( = ?auto_1861511 ?auto_1861512 ) ) ( not ( = ?auto_1861511 ?auto_1861514 ) ) ( not ( = ?auto_1861511 ?auto_1861515 ) ) ( not ( = ?auto_1861511 ?auto_1861516 ) ) ( not ( = ?auto_1861511 ?auto_1861522 ) ) ( not ( = ?auto_1861513 ?auto_1861512 ) ) ( not ( = ?auto_1861513 ?auto_1861514 ) ) ( not ( = ?auto_1861513 ?auto_1861515 ) ) ( not ( = ?auto_1861513 ?auto_1861516 ) ) ( not ( = ?auto_1861513 ?auto_1861522 ) ) ( not ( = ?auto_1861512 ?auto_1861514 ) ) ( not ( = ?auto_1861512 ?auto_1861515 ) ) ( not ( = ?auto_1861512 ?auto_1861516 ) ) ( not ( = ?auto_1861512 ?auto_1861522 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861514 ?auto_1861515 ?auto_1861516 )
      ( MAKE-9CRATE-VERIFY ?auto_1861508 ?auto_1861509 ?auto_1861510 ?auto_1861507 ?auto_1861511 ?auto_1861513 ?auto_1861512 ?auto_1861514 ?auto_1861515 ?auto_1861516 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1861524 - SURFACE
      ?auto_1861525 - SURFACE
      ?auto_1861526 - SURFACE
      ?auto_1861523 - SURFACE
      ?auto_1861527 - SURFACE
      ?auto_1861529 - SURFACE
      ?auto_1861528 - SURFACE
      ?auto_1861530 - SURFACE
      ?auto_1861531 - SURFACE
      ?auto_1861532 - SURFACE
      ?auto_1861533 - SURFACE
    )
    :vars
    (
      ?auto_1861537 - HOIST
      ?auto_1861538 - PLACE
      ?auto_1861534 - PLACE
      ?auto_1861536 - HOIST
      ?auto_1861539 - SURFACE
      ?auto_1861535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861537 ?auto_1861538 ) ( IS-CRATE ?auto_1861533 ) ( not ( = ?auto_1861532 ?auto_1861533 ) ) ( not ( = ?auto_1861531 ?auto_1861532 ) ) ( not ( = ?auto_1861531 ?auto_1861533 ) ) ( not ( = ?auto_1861534 ?auto_1861538 ) ) ( HOIST-AT ?auto_1861536 ?auto_1861534 ) ( not ( = ?auto_1861537 ?auto_1861536 ) ) ( SURFACE-AT ?auto_1861533 ?auto_1861534 ) ( ON ?auto_1861533 ?auto_1861539 ) ( CLEAR ?auto_1861533 ) ( not ( = ?auto_1861532 ?auto_1861539 ) ) ( not ( = ?auto_1861533 ?auto_1861539 ) ) ( not ( = ?auto_1861531 ?auto_1861539 ) ) ( SURFACE-AT ?auto_1861531 ?auto_1861538 ) ( CLEAR ?auto_1861531 ) ( IS-CRATE ?auto_1861532 ) ( AVAILABLE ?auto_1861537 ) ( TRUCK-AT ?auto_1861535 ?auto_1861534 ) ( LIFTING ?auto_1861536 ?auto_1861532 ) ( ON ?auto_1861525 ?auto_1861524 ) ( ON ?auto_1861526 ?auto_1861525 ) ( ON ?auto_1861523 ?auto_1861526 ) ( ON ?auto_1861527 ?auto_1861523 ) ( ON ?auto_1861529 ?auto_1861527 ) ( ON ?auto_1861528 ?auto_1861529 ) ( ON ?auto_1861530 ?auto_1861528 ) ( ON ?auto_1861531 ?auto_1861530 ) ( not ( = ?auto_1861524 ?auto_1861525 ) ) ( not ( = ?auto_1861524 ?auto_1861526 ) ) ( not ( = ?auto_1861524 ?auto_1861523 ) ) ( not ( = ?auto_1861524 ?auto_1861527 ) ) ( not ( = ?auto_1861524 ?auto_1861529 ) ) ( not ( = ?auto_1861524 ?auto_1861528 ) ) ( not ( = ?auto_1861524 ?auto_1861530 ) ) ( not ( = ?auto_1861524 ?auto_1861531 ) ) ( not ( = ?auto_1861524 ?auto_1861532 ) ) ( not ( = ?auto_1861524 ?auto_1861533 ) ) ( not ( = ?auto_1861524 ?auto_1861539 ) ) ( not ( = ?auto_1861525 ?auto_1861526 ) ) ( not ( = ?auto_1861525 ?auto_1861523 ) ) ( not ( = ?auto_1861525 ?auto_1861527 ) ) ( not ( = ?auto_1861525 ?auto_1861529 ) ) ( not ( = ?auto_1861525 ?auto_1861528 ) ) ( not ( = ?auto_1861525 ?auto_1861530 ) ) ( not ( = ?auto_1861525 ?auto_1861531 ) ) ( not ( = ?auto_1861525 ?auto_1861532 ) ) ( not ( = ?auto_1861525 ?auto_1861533 ) ) ( not ( = ?auto_1861525 ?auto_1861539 ) ) ( not ( = ?auto_1861526 ?auto_1861523 ) ) ( not ( = ?auto_1861526 ?auto_1861527 ) ) ( not ( = ?auto_1861526 ?auto_1861529 ) ) ( not ( = ?auto_1861526 ?auto_1861528 ) ) ( not ( = ?auto_1861526 ?auto_1861530 ) ) ( not ( = ?auto_1861526 ?auto_1861531 ) ) ( not ( = ?auto_1861526 ?auto_1861532 ) ) ( not ( = ?auto_1861526 ?auto_1861533 ) ) ( not ( = ?auto_1861526 ?auto_1861539 ) ) ( not ( = ?auto_1861523 ?auto_1861527 ) ) ( not ( = ?auto_1861523 ?auto_1861529 ) ) ( not ( = ?auto_1861523 ?auto_1861528 ) ) ( not ( = ?auto_1861523 ?auto_1861530 ) ) ( not ( = ?auto_1861523 ?auto_1861531 ) ) ( not ( = ?auto_1861523 ?auto_1861532 ) ) ( not ( = ?auto_1861523 ?auto_1861533 ) ) ( not ( = ?auto_1861523 ?auto_1861539 ) ) ( not ( = ?auto_1861527 ?auto_1861529 ) ) ( not ( = ?auto_1861527 ?auto_1861528 ) ) ( not ( = ?auto_1861527 ?auto_1861530 ) ) ( not ( = ?auto_1861527 ?auto_1861531 ) ) ( not ( = ?auto_1861527 ?auto_1861532 ) ) ( not ( = ?auto_1861527 ?auto_1861533 ) ) ( not ( = ?auto_1861527 ?auto_1861539 ) ) ( not ( = ?auto_1861529 ?auto_1861528 ) ) ( not ( = ?auto_1861529 ?auto_1861530 ) ) ( not ( = ?auto_1861529 ?auto_1861531 ) ) ( not ( = ?auto_1861529 ?auto_1861532 ) ) ( not ( = ?auto_1861529 ?auto_1861533 ) ) ( not ( = ?auto_1861529 ?auto_1861539 ) ) ( not ( = ?auto_1861528 ?auto_1861530 ) ) ( not ( = ?auto_1861528 ?auto_1861531 ) ) ( not ( = ?auto_1861528 ?auto_1861532 ) ) ( not ( = ?auto_1861528 ?auto_1861533 ) ) ( not ( = ?auto_1861528 ?auto_1861539 ) ) ( not ( = ?auto_1861530 ?auto_1861531 ) ) ( not ( = ?auto_1861530 ?auto_1861532 ) ) ( not ( = ?auto_1861530 ?auto_1861533 ) ) ( not ( = ?auto_1861530 ?auto_1861539 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861531 ?auto_1861532 ?auto_1861533 )
      ( MAKE-10CRATE-VERIFY ?auto_1861524 ?auto_1861525 ?auto_1861526 ?auto_1861523 ?auto_1861527 ?auto_1861529 ?auto_1861528 ?auto_1861530 ?auto_1861531 ?auto_1861532 ?auto_1861533 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1861541 - SURFACE
      ?auto_1861542 - SURFACE
      ?auto_1861543 - SURFACE
      ?auto_1861540 - SURFACE
      ?auto_1861544 - SURFACE
      ?auto_1861546 - SURFACE
      ?auto_1861545 - SURFACE
      ?auto_1861547 - SURFACE
      ?auto_1861548 - SURFACE
      ?auto_1861549 - SURFACE
      ?auto_1861550 - SURFACE
      ?auto_1861551 - SURFACE
    )
    :vars
    (
      ?auto_1861555 - HOIST
      ?auto_1861556 - PLACE
      ?auto_1861552 - PLACE
      ?auto_1861554 - HOIST
      ?auto_1861557 - SURFACE
      ?auto_1861553 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861555 ?auto_1861556 ) ( IS-CRATE ?auto_1861551 ) ( not ( = ?auto_1861550 ?auto_1861551 ) ) ( not ( = ?auto_1861549 ?auto_1861550 ) ) ( not ( = ?auto_1861549 ?auto_1861551 ) ) ( not ( = ?auto_1861552 ?auto_1861556 ) ) ( HOIST-AT ?auto_1861554 ?auto_1861552 ) ( not ( = ?auto_1861555 ?auto_1861554 ) ) ( SURFACE-AT ?auto_1861551 ?auto_1861552 ) ( ON ?auto_1861551 ?auto_1861557 ) ( CLEAR ?auto_1861551 ) ( not ( = ?auto_1861550 ?auto_1861557 ) ) ( not ( = ?auto_1861551 ?auto_1861557 ) ) ( not ( = ?auto_1861549 ?auto_1861557 ) ) ( SURFACE-AT ?auto_1861549 ?auto_1861556 ) ( CLEAR ?auto_1861549 ) ( IS-CRATE ?auto_1861550 ) ( AVAILABLE ?auto_1861555 ) ( TRUCK-AT ?auto_1861553 ?auto_1861552 ) ( LIFTING ?auto_1861554 ?auto_1861550 ) ( ON ?auto_1861542 ?auto_1861541 ) ( ON ?auto_1861543 ?auto_1861542 ) ( ON ?auto_1861540 ?auto_1861543 ) ( ON ?auto_1861544 ?auto_1861540 ) ( ON ?auto_1861546 ?auto_1861544 ) ( ON ?auto_1861545 ?auto_1861546 ) ( ON ?auto_1861547 ?auto_1861545 ) ( ON ?auto_1861548 ?auto_1861547 ) ( ON ?auto_1861549 ?auto_1861548 ) ( not ( = ?auto_1861541 ?auto_1861542 ) ) ( not ( = ?auto_1861541 ?auto_1861543 ) ) ( not ( = ?auto_1861541 ?auto_1861540 ) ) ( not ( = ?auto_1861541 ?auto_1861544 ) ) ( not ( = ?auto_1861541 ?auto_1861546 ) ) ( not ( = ?auto_1861541 ?auto_1861545 ) ) ( not ( = ?auto_1861541 ?auto_1861547 ) ) ( not ( = ?auto_1861541 ?auto_1861548 ) ) ( not ( = ?auto_1861541 ?auto_1861549 ) ) ( not ( = ?auto_1861541 ?auto_1861550 ) ) ( not ( = ?auto_1861541 ?auto_1861551 ) ) ( not ( = ?auto_1861541 ?auto_1861557 ) ) ( not ( = ?auto_1861542 ?auto_1861543 ) ) ( not ( = ?auto_1861542 ?auto_1861540 ) ) ( not ( = ?auto_1861542 ?auto_1861544 ) ) ( not ( = ?auto_1861542 ?auto_1861546 ) ) ( not ( = ?auto_1861542 ?auto_1861545 ) ) ( not ( = ?auto_1861542 ?auto_1861547 ) ) ( not ( = ?auto_1861542 ?auto_1861548 ) ) ( not ( = ?auto_1861542 ?auto_1861549 ) ) ( not ( = ?auto_1861542 ?auto_1861550 ) ) ( not ( = ?auto_1861542 ?auto_1861551 ) ) ( not ( = ?auto_1861542 ?auto_1861557 ) ) ( not ( = ?auto_1861543 ?auto_1861540 ) ) ( not ( = ?auto_1861543 ?auto_1861544 ) ) ( not ( = ?auto_1861543 ?auto_1861546 ) ) ( not ( = ?auto_1861543 ?auto_1861545 ) ) ( not ( = ?auto_1861543 ?auto_1861547 ) ) ( not ( = ?auto_1861543 ?auto_1861548 ) ) ( not ( = ?auto_1861543 ?auto_1861549 ) ) ( not ( = ?auto_1861543 ?auto_1861550 ) ) ( not ( = ?auto_1861543 ?auto_1861551 ) ) ( not ( = ?auto_1861543 ?auto_1861557 ) ) ( not ( = ?auto_1861540 ?auto_1861544 ) ) ( not ( = ?auto_1861540 ?auto_1861546 ) ) ( not ( = ?auto_1861540 ?auto_1861545 ) ) ( not ( = ?auto_1861540 ?auto_1861547 ) ) ( not ( = ?auto_1861540 ?auto_1861548 ) ) ( not ( = ?auto_1861540 ?auto_1861549 ) ) ( not ( = ?auto_1861540 ?auto_1861550 ) ) ( not ( = ?auto_1861540 ?auto_1861551 ) ) ( not ( = ?auto_1861540 ?auto_1861557 ) ) ( not ( = ?auto_1861544 ?auto_1861546 ) ) ( not ( = ?auto_1861544 ?auto_1861545 ) ) ( not ( = ?auto_1861544 ?auto_1861547 ) ) ( not ( = ?auto_1861544 ?auto_1861548 ) ) ( not ( = ?auto_1861544 ?auto_1861549 ) ) ( not ( = ?auto_1861544 ?auto_1861550 ) ) ( not ( = ?auto_1861544 ?auto_1861551 ) ) ( not ( = ?auto_1861544 ?auto_1861557 ) ) ( not ( = ?auto_1861546 ?auto_1861545 ) ) ( not ( = ?auto_1861546 ?auto_1861547 ) ) ( not ( = ?auto_1861546 ?auto_1861548 ) ) ( not ( = ?auto_1861546 ?auto_1861549 ) ) ( not ( = ?auto_1861546 ?auto_1861550 ) ) ( not ( = ?auto_1861546 ?auto_1861551 ) ) ( not ( = ?auto_1861546 ?auto_1861557 ) ) ( not ( = ?auto_1861545 ?auto_1861547 ) ) ( not ( = ?auto_1861545 ?auto_1861548 ) ) ( not ( = ?auto_1861545 ?auto_1861549 ) ) ( not ( = ?auto_1861545 ?auto_1861550 ) ) ( not ( = ?auto_1861545 ?auto_1861551 ) ) ( not ( = ?auto_1861545 ?auto_1861557 ) ) ( not ( = ?auto_1861547 ?auto_1861548 ) ) ( not ( = ?auto_1861547 ?auto_1861549 ) ) ( not ( = ?auto_1861547 ?auto_1861550 ) ) ( not ( = ?auto_1861547 ?auto_1861551 ) ) ( not ( = ?auto_1861547 ?auto_1861557 ) ) ( not ( = ?auto_1861548 ?auto_1861549 ) ) ( not ( = ?auto_1861548 ?auto_1861550 ) ) ( not ( = ?auto_1861548 ?auto_1861551 ) ) ( not ( = ?auto_1861548 ?auto_1861557 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861549 ?auto_1861550 ?auto_1861551 )
      ( MAKE-11CRATE-VERIFY ?auto_1861541 ?auto_1861542 ?auto_1861543 ?auto_1861540 ?auto_1861544 ?auto_1861546 ?auto_1861545 ?auto_1861547 ?auto_1861548 ?auto_1861549 ?auto_1861550 ?auto_1861551 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1861559 - SURFACE
      ?auto_1861560 - SURFACE
      ?auto_1861561 - SURFACE
      ?auto_1861558 - SURFACE
      ?auto_1861562 - SURFACE
      ?auto_1861564 - SURFACE
      ?auto_1861563 - SURFACE
      ?auto_1861565 - SURFACE
      ?auto_1861566 - SURFACE
      ?auto_1861567 - SURFACE
      ?auto_1861568 - SURFACE
      ?auto_1861569 - SURFACE
      ?auto_1861570 - SURFACE
    )
    :vars
    (
      ?auto_1861574 - HOIST
      ?auto_1861575 - PLACE
      ?auto_1861571 - PLACE
      ?auto_1861573 - HOIST
      ?auto_1861576 - SURFACE
      ?auto_1861572 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861574 ?auto_1861575 ) ( IS-CRATE ?auto_1861570 ) ( not ( = ?auto_1861569 ?auto_1861570 ) ) ( not ( = ?auto_1861568 ?auto_1861569 ) ) ( not ( = ?auto_1861568 ?auto_1861570 ) ) ( not ( = ?auto_1861571 ?auto_1861575 ) ) ( HOIST-AT ?auto_1861573 ?auto_1861571 ) ( not ( = ?auto_1861574 ?auto_1861573 ) ) ( SURFACE-AT ?auto_1861570 ?auto_1861571 ) ( ON ?auto_1861570 ?auto_1861576 ) ( CLEAR ?auto_1861570 ) ( not ( = ?auto_1861569 ?auto_1861576 ) ) ( not ( = ?auto_1861570 ?auto_1861576 ) ) ( not ( = ?auto_1861568 ?auto_1861576 ) ) ( SURFACE-AT ?auto_1861568 ?auto_1861575 ) ( CLEAR ?auto_1861568 ) ( IS-CRATE ?auto_1861569 ) ( AVAILABLE ?auto_1861574 ) ( TRUCK-AT ?auto_1861572 ?auto_1861571 ) ( LIFTING ?auto_1861573 ?auto_1861569 ) ( ON ?auto_1861560 ?auto_1861559 ) ( ON ?auto_1861561 ?auto_1861560 ) ( ON ?auto_1861558 ?auto_1861561 ) ( ON ?auto_1861562 ?auto_1861558 ) ( ON ?auto_1861564 ?auto_1861562 ) ( ON ?auto_1861563 ?auto_1861564 ) ( ON ?auto_1861565 ?auto_1861563 ) ( ON ?auto_1861566 ?auto_1861565 ) ( ON ?auto_1861567 ?auto_1861566 ) ( ON ?auto_1861568 ?auto_1861567 ) ( not ( = ?auto_1861559 ?auto_1861560 ) ) ( not ( = ?auto_1861559 ?auto_1861561 ) ) ( not ( = ?auto_1861559 ?auto_1861558 ) ) ( not ( = ?auto_1861559 ?auto_1861562 ) ) ( not ( = ?auto_1861559 ?auto_1861564 ) ) ( not ( = ?auto_1861559 ?auto_1861563 ) ) ( not ( = ?auto_1861559 ?auto_1861565 ) ) ( not ( = ?auto_1861559 ?auto_1861566 ) ) ( not ( = ?auto_1861559 ?auto_1861567 ) ) ( not ( = ?auto_1861559 ?auto_1861568 ) ) ( not ( = ?auto_1861559 ?auto_1861569 ) ) ( not ( = ?auto_1861559 ?auto_1861570 ) ) ( not ( = ?auto_1861559 ?auto_1861576 ) ) ( not ( = ?auto_1861560 ?auto_1861561 ) ) ( not ( = ?auto_1861560 ?auto_1861558 ) ) ( not ( = ?auto_1861560 ?auto_1861562 ) ) ( not ( = ?auto_1861560 ?auto_1861564 ) ) ( not ( = ?auto_1861560 ?auto_1861563 ) ) ( not ( = ?auto_1861560 ?auto_1861565 ) ) ( not ( = ?auto_1861560 ?auto_1861566 ) ) ( not ( = ?auto_1861560 ?auto_1861567 ) ) ( not ( = ?auto_1861560 ?auto_1861568 ) ) ( not ( = ?auto_1861560 ?auto_1861569 ) ) ( not ( = ?auto_1861560 ?auto_1861570 ) ) ( not ( = ?auto_1861560 ?auto_1861576 ) ) ( not ( = ?auto_1861561 ?auto_1861558 ) ) ( not ( = ?auto_1861561 ?auto_1861562 ) ) ( not ( = ?auto_1861561 ?auto_1861564 ) ) ( not ( = ?auto_1861561 ?auto_1861563 ) ) ( not ( = ?auto_1861561 ?auto_1861565 ) ) ( not ( = ?auto_1861561 ?auto_1861566 ) ) ( not ( = ?auto_1861561 ?auto_1861567 ) ) ( not ( = ?auto_1861561 ?auto_1861568 ) ) ( not ( = ?auto_1861561 ?auto_1861569 ) ) ( not ( = ?auto_1861561 ?auto_1861570 ) ) ( not ( = ?auto_1861561 ?auto_1861576 ) ) ( not ( = ?auto_1861558 ?auto_1861562 ) ) ( not ( = ?auto_1861558 ?auto_1861564 ) ) ( not ( = ?auto_1861558 ?auto_1861563 ) ) ( not ( = ?auto_1861558 ?auto_1861565 ) ) ( not ( = ?auto_1861558 ?auto_1861566 ) ) ( not ( = ?auto_1861558 ?auto_1861567 ) ) ( not ( = ?auto_1861558 ?auto_1861568 ) ) ( not ( = ?auto_1861558 ?auto_1861569 ) ) ( not ( = ?auto_1861558 ?auto_1861570 ) ) ( not ( = ?auto_1861558 ?auto_1861576 ) ) ( not ( = ?auto_1861562 ?auto_1861564 ) ) ( not ( = ?auto_1861562 ?auto_1861563 ) ) ( not ( = ?auto_1861562 ?auto_1861565 ) ) ( not ( = ?auto_1861562 ?auto_1861566 ) ) ( not ( = ?auto_1861562 ?auto_1861567 ) ) ( not ( = ?auto_1861562 ?auto_1861568 ) ) ( not ( = ?auto_1861562 ?auto_1861569 ) ) ( not ( = ?auto_1861562 ?auto_1861570 ) ) ( not ( = ?auto_1861562 ?auto_1861576 ) ) ( not ( = ?auto_1861564 ?auto_1861563 ) ) ( not ( = ?auto_1861564 ?auto_1861565 ) ) ( not ( = ?auto_1861564 ?auto_1861566 ) ) ( not ( = ?auto_1861564 ?auto_1861567 ) ) ( not ( = ?auto_1861564 ?auto_1861568 ) ) ( not ( = ?auto_1861564 ?auto_1861569 ) ) ( not ( = ?auto_1861564 ?auto_1861570 ) ) ( not ( = ?auto_1861564 ?auto_1861576 ) ) ( not ( = ?auto_1861563 ?auto_1861565 ) ) ( not ( = ?auto_1861563 ?auto_1861566 ) ) ( not ( = ?auto_1861563 ?auto_1861567 ) ) ( not ( = ?auto_1861563 ?auto_1861568 ) ) ( not ( = ?auto_1861563 ?auto_1861569 ) ) ( not ( = ?auto_1861563 ?auto_1861570 ) ) ( not ( = ?auto_1861563 ?auto_1861576 ) ) ( not ( = ?auto_1861565 ?auto_1861566 ) ) ( not ( = ?auto_1861565 ?auto_1861567 ) ) ( not ( = ?auto_1861565 ?auto_1861568 ) ) ( not ( = ?auto_1861565 ?auto_1861569 ) ) ( not ( = ?auto_1861565 ?auto_1861570 ) ) ( not ( = ?auto_1861565 ?auto_1861576 ) ) ( not ( = ?auto_1861566 ?auto_1861567 ) ) ( not ( = ?auto_1861566 ?auto_1861568 ) ) ( not ( = ?auto_1861566 ?auto_1861569 ) ) ( not ( = ?auto_1861566 ?auto_1861570 ) ) ( not ( = ?auto_1861566 ?auto_1861576 ) ) ( not ( = ?auto_1861567 ?auto_1861568 ) ) ( not ( = ?auto_1861567 ?auto_1861569 ) ) ( not ( = ?auto_1861567 ?auto_1861570 ) ) ( not ( = ?auto_1861567 ?auto_1861576 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861568 ?auto_1861569 ?auto_1861570 )
      ( MAKE-12CRATE-VERIFY ?auto_1861559 ?auto_1861560 ?auto_1861561 ?auto_1861558 ?auto_1861562 ?auto_1861564 ?auto_1861563 ?auto_1861565 ?auto_1861566 ?auto_1861567 ?auto_1861568 ?auto_1861569 ?auto_1861570 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1861578 - SURFACE
      ?auto_1861579 - SURFACE
      ?auto_1861580 - SURFACE
      ?auto_1861577 - SURFACE
      ?auto_1861581 - SURFACE
      ?auto_1861583 - SURFACE
      ?auto_1861582 - SURFACE
      ?auto_1861584 - SURFACE
      ?auto_1861585 - SURFACE
      ?auto_1861586 - SURFACE
      ?auto_1861587 - SURFACE
      ?auto_1861588 - SURFACE
      ?auto_1861589 - SURFACE
      ?auto_1861590 - SURFACE
    )
    :vars
    (
      ?auto_1861594 - HOIST
      ?auto_1861595 - PLACE
      ?auto_1861591 - PLACE
      ?auto_1861593 - HOIST
      ?auto_1861596 - SURFACE
      ?auto_1861592 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861594 ?auto_1861595 ) ( IS-CRATE ?auto_1861590 ) ( not ( = ?auto_1861589 ?auto_1861590 ) ) ( not ( = ?auto_1861588 ?auto_1861589 ) ) ( not ( = ?auto_1861588 ?auto_1861590 ) ) ( not ( = ?auto_1861591 ?auto_1861595 ) ) ( HOIST-AT ?auto_1861593 ?auto_1861591 ) ( not ( = ?auto_1861594 ?auto_1861593 ) ) ( SURFACE-AT ?auto_1861590 ?auto_1861591 ) ( ON ?auto_1861590 ?auto_1861596 ) ( CLEAR ?auto_1861590 ) ( not ( = ?auto_1861589 ?auto_1861596 ) ) ( not ( = ?auto_1861590 ?auto_1861596 ) ) ( not ( = ?auto_1861588 ?auto_1861596 ) ) ( SURFACE-AT ?auto_1861588 ?auto_1861595 ) ( CLEAR ?auto_1861588 ) ( IS-CRATE ?auto_1861589 ) ( AVAILABLE ?auto_1861594 ) ( TRUCK-AT ?auto_1861592 ?auto_1861591 ) ( LIFTING ?auto_1861593 ?auto_1861589 ) ( ON ?auto_1861579 ?auto_1861578 ) ( ON ?auto_1861580 ?auto_1861579 ) ( ON ?auto_1861577 ?auto_1861580 ) ( ON ?auto_1861581 ?auto_1861577 ) ( ON ?auto_1861583 ?auto_1861581 ) ( ON ?auto_1861582 ?auto_1861583 ) ( ON ?auto_1861584 ?auto_1861582 ) ( ON ?auto_1861585 ?auto_1861584 ) ( ON ?auto_1861586 ?auto_1861585 ) ( ON ?auto_1861587 ?auto_1861586 ) ( ON ?auto_1861588 ?auto_1861587 ) ( not ( = ?auto_1861578 ?auto_1861579 ) ) ( not ( = ?auto_1861578 ?auto_1861580 ) ) ( not ( = ?auto_1861578 ?auto_1861577 ) ) ( not ( = ?auto_1861578 ?auto_1861581 ) ) ( not ( = ?auto_1861578 ?auto_1861583 ) ) ( not ( = ?auto_1861578 ?auto_1861582 ) ) ( not ( = ?auto_1861578 ?auto_1861584 ) ) ( not ( = ?auto_1861578 ?auto_1861585 ) ) ( not ( = ?auto_1861578 ?auto_1861586 ) ) ( not ( = ?auto_1861578 ?auto_1861587 ) ) ( not ( = ?auto_1861578 ?auto_1861588 ) ) ( not ( = ?auto_1861578 ?auto_1861589 ) ) ( not ( = ?auto_1861578 ?auto_1861590 ) ) ( not ( = ?auto_1861578 ?auto_1861596 ) ) ( not ( = ?auto_1861579 ?auto_1861580 ) ) ( not ( = ?auto_1861579 ?auto_1861577 ) ) ( not ( = ?auto_1861579 ?auto_1861581 ) ) ( not ( = ?auto_1861579 ?auto_1861583 ) ) ( not ( = ?auto_1861579 ?auto_1861582 ) ) ( not ( = ?auto_1861579 ?auto_1861584 ) ) ( not ( = ?auto_1861579 ?auto_1861585 ) ) ( not ( = ?auto_1861579 ?auto_1861586 ) ) ( not ( = ?auto_1861579 ?auto_1861587 ) ) ( not ( = ?auto_1861579 ?auto_1861588 ) ) ( not ( = ?auto_1861579 ?auto_1861589 ) ) ( not ( = ?auto_1861579 ?auto_1861590 ) ) ( not ( = ?auto_1861579 ?auto_1861596 ) ) ( not ( = ?auto_1861580 ?auto_1861577 ) ) ( not ( = ?auto_1861580 ?auto_1861581 ) ) ( not ( = ?auto_1861580 ?auto_1861583 ) ) ( not ( = ?auto_1861580 ?auto_1861582 ) ) ( not ( = ?auto_1861580 ?auto_1861584 ) ) ( not ( = ?auto_1861580 ?auto_1861585 ) ) ( not ( = ?auto_1861580 ?auto_1861586 ) ) ( not ( = ?auto_1861580 ?auto_1861587 ) ) ( not ( = ?auto_1861580 ?auto_1861588 ) ) ( not ( = ?auto_1861580 ?auto_1861589 ) ) ( not ( = ?auto_1861580 ?auto_1861590 ) ) ( not ( = ?auto_1861580 ?auto_1861596 ) ) ( not ( = ?auto_1861577 ?auto_1861581 ) ) ( not ( = ?auto_1861577 ?auto_1861583 ) ) ( not ( = ?auto_1861577 ?auto_1861582 ) ) ( not ( = ?auto_1861577 ?auto_1861584 ) ) ( not ( = ?auto_1861577 ?auto_1861585 ) ) ( not ( = ?auto_1861577 ?auto_1861586 ) ) ( not ( = ?auto_1861577 ?auto_1861587 ) ) ( not ( = ?auto_1861577 ?auto_1861588 ) ) ( not ( = ?auto_1861577 ?auto_1861589 ) ) ( not ( = ?auto_1861577 ?auto_1861590 ) ) ( not ( = ?auto_1861577 ?auto_1861596 ) ) ( not ( = ?auto_1861581 ?auto_1861583 ) ) ( not ( = ?auto_1861581 ?auto_1861582 ) ) ( not ( = ?auto_1861581 ?auto_1861584 ) ) ( not ( = ?auto_1861581 ?auto_1861585 ) ) ( not ( = ?auto_1861581 ?auto_1861586 ) ) ( not ( = ?auto_1861581 ?auto_1861587 ) ) ( not ( = ?auto_1861581 ?auto_1861588 ) ) ( not ( = ?auto_1861581 ?auto_1861589 ) ) ( not ( = ?auto_1861581 ?auto_1861590 ) ) ( not ( = ?auto_1861581 ?auto_1861596 ) ) ( not ( = ?auto_1861583 ?auto_1861582 ) ) ( not ( = ?auto_1861583 ?auto_1861584 ) ) ( not ( = ?auto_1861583 ?auto_1861585 ) ) ( not ( = ?auto_1861583 ?auto_1861586 ) ) ( not ( = ?auto_1861583 ?auto_1861587 ) ) ( not ( = ?auto_1861583 ?auto_1861588 ) ) ( not ( = ?auto_1861583 ?auto_1861589 ) ) ( not ( = ?auto_1861583 ?auto_1861590 ) ) ( not ( = ?auto_1861583 ?auto_1861596 ) ) ( not ( = ?auto_1861582 ?auto_1861584 ) ) ( not ( = ?auto_1861582 ?auto_1861585 ) ) ( not ( = ?auto_1861582 ?auto_1861586 ) ) ( not ( = ?auto_1861582 ?auto_1861587 ) ) ( not ( = ?auto_1861582 ?auto_1861588 ) ) ( not ( = ?auto_1861582 ?auto_1861589 ) ) ( not ( = ?auto_1861582 ?auto_1861590 ) ) ( not ( = ?auto_1861582 ?auto_1861596 ) ) ( not ( = ?auto_1861584 ?auto_1861585 ) ) ( not ( = ?auto_1861584 ?auto_1861586 ) ) ( not ( = ?auto_1861584 ?auto_1861587 ) ) ( not ( = ?auto_1861584 ?auto_1861588 ) ) ( not ( = ?auto_1861584 ?auto_1861589 ) ) ( not ( = ?auto_1861584 ?auto_1861590 ) ) ( not ( = ?auto_1861584 ?auto_1861596 ) ) ( not ( = ?auto_1861585 ?auto_1861586 ) ) ( not ( = ?auto_1861585 ?auto_1861587 ) ) ( not ( = ?auto_1861585 ?auto_1861588 ) ) ( not ( = ?auto_1861585 ?auto_1861589 ) ) ( not ( = ?auto_1861585 ?auto_1861590 ) ) ( not ( = ?auto_1861585 ?auto_1861596 ) ) ( not ( = ?auto_1861586 ?auto_1861587 ) ) ( not ( = ?auto_1861586 ?auto_1861588 ) ) ( not ( = ?auto_1861586 ?auto_1861589 ) ) ( not ( = ?auto_1861586 ?auto_1861590 ) ) ( not ( = ?auto_1861586 ?auto_1861596 ) ) ( not ( = ?auto_1861587 ?auto_1861588 ) ) ( not ( = ?auto_1861587 ?auto_1861589 ) ) ( not ( = ?auto_1861587 ?auto_1861590 ) ) ( not ( = ?auto_1861587 ?auto_1861596 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861588 ?auto_1861589 ?auto_1861590 )
      ( MAKE-13CRATE-VERIFY ?auto_1861578 ?auto_1861579 ?auto_1861580 ?auto_1861577 ?auto_1861581 ?auto_1861583 ?auto_1861582 ?auto_1861584 ?auto_1861585 ?auto_1861586 ?auto_1861587 ?auto_1861588 ?auto_1861589 ?auto_1861590 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1861629 - SURFACE
      ?auto_1861630 - SURFACE
      ?auto_1861631 - SURFACE
      ?auto_1861628 - SURFACE
      ?auto_1861632 - SURFACE
    )
    :vars
    (
      ?auto_1861637 - HOIST
      ?auto_1861636 - PLACE
      ?auto_1861638 - PLACE
      ?auto_1861635 - HOIST
      ?auto_1861633 - SURFACE
      ?auto_1861634 - TRUCK
      ?auto_1861639 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861637 ?auto_1861636 ) ( IS-CRATE ?auto_1861632 ) ( not ( = ?auto_1861628 ?auto_1861632 ) ) ( not ( = ?auto_1861631 ?auto_1861628 ) ) ( not ( = ?auto_1861631 ?auto_1861632 ) ) ( not ( = ?auto_1861638 ?auto_1861636 ) ) ( HOIST-AT ?auto_1861635 ?auto_1861638 ) ( not ( = ?auto_1861637 ?auto_1861635 ) ) ( SURFACE-AT ?auto_1861632 ?auto_1861638 ) ( ON ?auto_1861632 ?auto_1861633 ) ( CLEAR ?auto_1861632 ) ( not ( = ?auto_1861628 ?auto_1861633 ) ) ( not ( = ?auto_1861632 ?auto_1861633 ) ) ( not ( = ?auto_1861631 ?auto_1861633 ) ) ( SURFACE-AT ?auto_1861631 ?auto_1861636 ) ( CLEAR ?auto_1861631 ) ( IS-CRATE ?auto_1861628 ) ( AVAILABLE ?auto_1861637 ) ( TRUCK-AT ?auto_1861634 ?auto_1861638 ) ( AVAILABLE ?auto_1861635 ) ( SURFACE-AT ?auto_1861628 ?auto_1861638 ) ( ON ?auto_1861628 ?auto_1861639 ) ( CLEAR ?auto_1861628 ) ( not ( = ?auto_1861628 ?auto_1861639 ) ) ( not ( = ?auto_1861632 ?auto_1861639 ) ) ( not ( = ?auto_1861631 ?auto_1861639 ) ) ( not ( = ?auto_1861633 ?auto_1861639 ) ) ( ON ?auto_1861630 ?auto_1861629 ) ( ON ?auto_1861631 ?auto_1861630 ) ( not ( = ?auto_1861629 ?auto_1861630 ) ) ( not ( = ?auto_1861629 ?auto_1861631 ) ) ( not ( = ?auto_1861629 ?auto_1861628 ) ) ( not ( = ?auto_1861629 ?auto_1861632 ) ) ( not ( = ?auto_1861629 ?auto_1861633 ) ) ( not ( = ?auto_1861629 ?auto_1861639 ) ) ( not ( = ?auto_1861630 ?auto_1861631 ) ) ( not ( = ?auto_1861630 ?auto_1861628 ) ) ( not ( = ?auto_1861630 ?auto_1861632 ) ) ( not ( = ?auto_1861630 ?auto_1861633 ) ) ( not ( = ?auto_1861630 ?auto_1861639 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861631 ?auto_1861628 ?auto_1861632 )
      ( MAKE-4CRATE-VERIFY ?auto_1861629 ?auto_1861630 ?auto_1861631 ?auto_1861628 ?auto_1861632 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1861641 - SURFACE
      ?auto_1861642 - SURFACE
      ?auto_1861643 - SURFACE
      ?auto_1861640 - SURFACE
      ?auto_1861644 - SURFACE
      ?auto_1861645 - SURFACE
    )
    :vars
    (
      ?auto_1861650 - HOIST
      ?auto_1861649 - PLACE
      ?auto_1861651 - PLACE
      ?auto_1861648 - HOIST
      ?auto_1861646 - SURFACE
      ?auto_1861647 - TRUCK
      ?auto_1861652 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861650 ?auto_1861649 ) ( IS-CRATE ?auto_1861645 ) ( not ( = ?auto_1861644 ?auto_1861645 ) ) ( not ( = ?auto_1861640 ?auto_1861644 ) ) ( not ( = ?auto_1861640 ?auto_1861645 ) ) ( not ( = ?auto_1861651 ?auto_1861649 ) ) ( HOIST-AT ?auto_1861648 ?auto_1861651 ) ( not ( = ?auto_1861650 ?auto_1861648 ) ) ( SURFACE-AT ?auto_1861645 ?auto_1861651 ) ( ON ?auto_1861645 ?auto_1861646 ) ( CLEAR ?auto_1861645 ) ( not ( = ?auto_1861644 ?auto_1861646 ) ) ( not ( = ?auto_1861645 ?auto_1861646 ) ) ( not ( = ?auto_1861640 ?auto_1861646 ) ) ( SURFACE-AT ?auto_1861640 ?auto_1861649 ) ( CLEAR ?auto_1861640 ) ( IS-CRATE ?auto_1861644 ) ( AVAILABLE ?auto_1861650 ) ( TRUCK-AT ?auto_1861647 ?auto_1861651 ) ( AVAILABLE ?auto_1861648 ) ( SURFACE-AT ?auto_1861644 ?auto_1861651 ) ( ON ?auto_1861644 ?auto_1861652 ) ( CLEAR ?auto_1861644 ) ( not ( = ?auto_1861644 ?auto_1861652 ) ) ( not ( = ?auto_1861645 ?auto_1861652 ) ) ( not ( = ?auto_1861640 ?auto_1861652 ) ) ( not ( = ?auto_1861646 ?auto_1861652 ) ) ( ON ?auto_1861642 ?auto_1861641 ) ( ON ?auto_1861643 ?auto_1861642 ) ( ON ?auto_1861640 ?auto_1861643 ) ( not ( = ?auto_1861641 ?auto_1861642 ) ) ( not ( = ?auto_1861641 ?auto_1861643 ) ) ( not ( = ?auto_1861641 ?auto_1861640 ) ) ( not ( = ?auto_1861641 ?auto_1861644 ) ) ( not ( = ?auto_1861641 ?auto_1861645 ) ) ( not ( = ?auto_1861641 ?auto_1861646 ) ) ( not ( = ?auto_1861641 ?auto_1861652 ) ) ( not ( = ?auto_1861642 ?auto_1861643 ) ) ( not ( = ?auto_1861642 ?auto_1861640 ) ) ( not ( = ?auto_1861642 ?auto_1861644 ) ) ( not ( = ?auto_1861642 ?auto_1861645 ) ) ( not ( = ?auto_1861642 ?auto_1861646 ) ) ( not ( = ?auto_1861642 ?auto_1861652 ) ) ( not ( = ?auto_1861643 ?auto_1861640 ) ) ( not ( = ?auto_1861643 ?auto_1861644 ) ) ( not ( = ?auto_1861643 ?auto_1861645 ) ) ( not ( = ?auto_1861643 ?auto_1861646 ) ) ( not ( = ?auto_1861643 ?auto_1861652 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861640 ?auto_1861644 ?auto_1861645 )
      ( MAKE-5CRATE-VERIFY ?auto_1861641 ?auto_1861642 ?auto_1861643 ?auto_1861640 ?auto_1861644 ?auto_1861645 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1861654 - SURFACE
      ?auto_1861655 - SURFACE
      ?auto_1861656 - SURFACE
      ?auto_1861653 - SURFACE
      ?auto_1861657 - SURFACE
      ?auto_1861659 - SURFACE
      ?auto_1861658 - SURFACE
    )
    :vars
    (
      ?auto_1861664 - HOIST
      ?auto_1861663 - PLACE
      ?auto_1861665 - PLACE
      ?auto_1861662 - HOIST
      ?auto_1861660 - SURFACE
      ?auto_1861661 - TRUCK
      ?auto_1861666 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861664 ?auto_1861663 ) ( IS-CRATE ?auto_1861658 ) ( not ( = ?auto_1861659 ?auto_1861658 ) ) ( not ( = ?auto_1861657 ?auto_1861659 ) ) ( not ( = ?auto_1861657 ?auto_1861658 ) ) ( not ( = ?auto_1861665 ?auto_1861663 ) ) ( HOIST-AT ?auto_1861662 ?auto_1861665 ) ( not ( = ?auto_1861664 ?auto_1861662 ) ) ( SURFACE-AT ?auto_1861658 ?auto_1861665 ) ( ON ?auto_1861658 ?auto_1861660 ) ( CLEAR ?auto_1861658 ) ( not ( = ?auto_1861659 ?auto_1861660 ) ) ( not ( = ?auto_1861658 ?auto_1861660 ) ) ( not ( = ?auto_1861657 ?auto_1861660 ) ) ( SURFACE-AT ?auto_1861657 ?auto_1861663 ) ( CLEAR ?auto_1861657 ) ( IS-CRATE ?auto_1861659 ) ( AVAILABLE ?auto_1861664 ) ( TRUCK-AT ?auto_1861661 ?auto_1861665 ) ( AVAILABLE ?auto_1861662 ) ( SURFACE-AT ?auto_1861659 ?auto_1861665 ) ( ON ?auto_1861659 ?auto_1861666 ) ( CLEAR ?auto_1861659 ) ( not ( = ?auto_1861659 ?auto_1861666 ) ) ( not ( = ?auto_1861658 ?auto_1861666 ) ) ( not ( = ?auto_1861657 ?auto_1861666 ) ) ( not ( = ?auto_1861660 ?auto_1861666 ) ) ( ON ?auto_1861655 ?auto_1861654 ) ( ON ?auto_1861656 ?auto_1861655 ) ( ON ?auto_1861653 ?auto_1861656 ) ( ON ?auto_1861657 ?auto_1861653 ) ( not ( = ?auto_1861654 ?auto_1861655 ) ) ( not ( = ?auto_1861654 ?auto_1861656 ) ) ( not ( = ?auto_1861654 ?auto_1861653 ) ) ( not ( = ?auto_1861654 ?auto_1861657 ) ) ( not ( = ?auto_1861654 ?auto_1861659 ) ) ( not ( = ?auto_1861654 ?auto_1861658 ) ) ( not ( = ?auto_1861654 ?auto_1861660 ) ) ( not ( = ?auto_1861654 ?auto_1861666 ) ) ( not ( = ?auto_1861655 ?auto_1861656 ) ) ( not ( = ?auto_1861655 ?auto_1861653 ) ) ( not ( = ?auto_1861655 ?auto_1861657 ) ) ( not ( = ?auto_1861655 ?auto_1861659 ) ) ( not ( = ?auto_1861655 ?auto_1861658 ) ) ( not ( = ?auto_1861655 ?auto_1861660 ) ) ( not ( = ?auto_1861655 ?auto_1861666 ) ) ( not ( = ?auto_1861656 ?auto_1861653 ) ) ( not ( = ?auto_1861656 ?auto_1861657 ) ) ( not ( = ?auto_1861656 ?auto_1861659 ) ) ( not ( = ?auto_1861656 ?auto_1861658 ) ) ( not ( = ?auto_1861656 ?auto_1861660 ) ) ( not ( = ?auto_1861656 ?auto_1861666 ) ) ( not ( = ?auto_1861653 ?auto_1861657 ) ) ( not ( = ?auto_1861653 ?auto_1861659 ) ) ( not ( = ?auto_1861653 ?auto_1861658 ) ) ( not ( = ?auto_1861653 ?auto_1861660 ) ) ( not ( = ?auto_1861653 ?auto_1861666 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861657 ?auto_1861659 ?auto_1861658 )
      ( MAKE-6CRATE-VERIFY ?auto_1861654 ?auto_1861655 ?auto_1861656 ?auto_1861653 ?auto_1861657 ?auto_1861659 ?auto_1861658 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1861668 - SURFACE
      ?auto_1861669 - SURFACE
      ?auto_1861670 - SURFACE
      ?auto_1861667 - SURFACE
      ?auto_1861671 - SURFACE
      ?auto_1861673 - SURFACE
      ?auto_1861672 - SURFACE
      ?auto_1861674 - SURFACE
    )
    :vars
    (
      ?auto_1861679 - HOIST
      ?auto_1861678 - PLACE
      ?auto_1861680 - PLACE
      ?auto_1861677 - HOIST
      ?auto_1861675 - SURFACE
      ?auto_1861676 - TRUCK
      ?auto_1861681 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861679 ?auto_1861678 ) ( IS-CRATE ?auto_1861674 ) ( not ( = ?auto_1861672 ?auto_1861674 ) ) ( not ( = ?auto_1861673 ?auto_1861672 ) ) ( not ( = ?auto_1861673 ?auto_1861674 ) ) ( not ( = ?auto_1861680 ?auto_1861678 ) ) ( HOIST-AT ?auto_1861677 ?auto_1861680 ) ( not ( = ?auto_1861679 ?auto_1861677 ) ) ( SURFACE-AT ?auto_1861674 ?auto_1861680 ) ( ON ?auto_1861674 ?auto_1861675 ) ( CLEAR ?auto_1861674 ) ( not ( = ?auto_1861672 ?auto_1861675 ) ) ( not ( = ?auto_1861674 ?auto_1861675 ) ) ( not ( = ?auto_1861673 ?auto_1861675 ) ) ( SURFACE-AT ?auto_1861673 ?auto_1861678 ) ( CLEAR ?auto_1861673 ) ( IS-CRATE ?auto_1861672 ) ( AVAILABLE ?auto_1861679 ) ( TRUCK-AT ?auto_1861676 ?auto_1861680 ) ( AVAILABLE ?auto_1861677 ) ( SURFACE-AT ?auto_1861672 ?auto_1861680 ) ( ON ?auto_1861672 ?auto_1861681 ) ( CLEAR ?auto_1861672 ) ( not ( = ?auto_1861672 ?auto_1861681 ) ) ( not ( = ?auto_1861674 ?auto_1861681 ) ) ( not ( = ?auto_1861673 ?auto_1861681 ) ) ( not ( = ?auto_1861675 ?auto_1861681 ) ) ( ON ?auto_1861669 ?auto_1861668 ) ( ON ?auto_1861670 ?auto_1861669 ) ( ON ?auto_1861667 ?auto_1861670 ) ( ON ?auto_1861671 ?auto_1861667 ) ( ON ?auto_1861673 ?auto_1861671 ) ( not ( = ?auto_1861668 ?auto_1861669 ) ) ( not ( = ?auto_1861668 ?auto_1861670 ) ) ( not ( = ?auto_1861668 ?auto_1861667 ) ) ( not ( = ?auto_1861668 ?auto_1861671 ) ) ( not ( = ?auto_1861668 ?auto_1861673 ) ) ( not ( = ?auto_1861668 ?auto_1861672 ) ) ( not ( = ?auto_1861668 ?auto_1861674 ) ) ( not ( = ?auto_1861668 ?auto_1861675 ) ) ( not ( = ?auto_1861668 ?auto_1861681 ) ) ( not ( = ?auto_1861669 ?auto_1861670 ) ) ( not ( = ?auto_1861669 ?auto_1861667 ) ) ( not ( = ?auto_1861669 ?auto_1861671 ) ) ( not ( = ?auto_1861669 ?auto_1861673 ) ) ( not ( = ?auto_1861669 ?auto_1861672 ) ) ( not ( = ?auto_1861669 ?auto_1861674 ) ) ( not ( = ?auto_1861669 ?auto_1861675 ) ) ( not ( = ?auto_1861669 ?auto_1861681 ) ) ( not ( = ?auto_1861670 ?auto_1861667 ) ) ( not ( = ?auto_1861670 ?auto_1861671 ) ) ( not ( = ?auto_1861670 ?auto_1861673 ) ) ( not ( = ?auto_1861670 ?auto_1861672 ) ) ( not ( = ?auto_1861670 ?auto_1861674 ) ) ( not ( = ?auto_1861670 ?auto_1861675 ) ) ( not ( = ?auto_1861670 ?auto_1861681 ) ) ( not ( = ?auto_1861667 ?auto_1861671 ) ) ( not ( = ?auto_1861667 ?auto_1861673 ) ) ( not ( = ?auto_1861667 ?auto_1861672 ) ) ( not ( = ?auto_1861667 ?auto_1861674 ) ) ( not ( = ?auto_1861667 ?auto_1861675 ) ) ( not ( = ?auto_1861667 ?auto_1861681 ) ) ( not ( = ?auto_1861671 ?auto_1861673 ) ) ( not ( = ?auto_1861671 ?auto_1861672 ) ) ( not ( = ?auto_1861671 ?auto_1861674 ) ) ( not ( = ?auto_1861671 ?auto_1861675 ) ) ( not ( = ?auto_1861671 ?auto_1861681 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861673 ?auto_1861672 ?auto_1861674 )
      ( MAKE-7CRATE-VERIFY ?auto_1861668 ?auto_1861669 ?auto_1861670 ?auto_1861667 ?auto_1861671 ?auto_1861673 ?auto_1861672 ?auto_1861674 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1861683 - SURFACE
      ?auto_1861684 - SURFACE
      ?auto_1861685 - SURFACE
      ?auto_1861682 - SURFACE
      ?auto_1861686 - SURFACE
      ?auto_1861688 - SURFACE
      ?auto_1861687 - SURFACE
      ?auto_1861689 - SURFACE
      ?auto_1861690 - SURFACE
    )
    :vars
    (
      ?auto_1861695 - HOIST
      ?auto_1861694 - PLACE
      ?auto_1861696 - PLACE
      ?auto_1861693 - HOIST
      ?auto_1861691 - SURFACE
      ?auto_1861692 - TRUCK
      ?auto_1861697 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861695 ?auto_1861694 ) ( IS-CRATE ?auto_1861690 ) ( not ( = ?auto_1861689 ?auto_1861690 ) ) ( not ( = ?auto_1861687 ?auto_1861689 ) ) ( not ( = ?auto_1861687 ?auto_1861690 ) ) ( not ( = ?auto_1861696 ?auto_1861694 ) ) ( HOIST-AT ?auto_1861693 ?auto_1861696 ) ( not ( = ?auto_1861695 ?auto_1861693 ) ) ( SURFACE-AT ?auto_1861690 ?auto_1861696 ) ( ON ?auto_1861690 ?auto_1861691 ) ( CLEAR ?auto_1861690 ) ( not ( = ?auto_1861689 ?auto_1861691 ) ) ( not ( = ?auto_1861690 ?auto_1861691 ) ) ( not ( = ?auto_1861687 ?auto_1861691 ) ) ( SURFACE-AT ?auto_1861687 ?auto_1861694 ) ( CLEAR ?auto_1861687 ) ( IS-CRATE ?auto_1861689 ) ( AVAILABLE ?auto_1861695 ) ( TRUCK-AT ?auto_1861692 ?auto_1861696 ) ( AVAILABLE ?auto_1861693 ) ( SURFACE-AT ?auto_1861689 ?auto_1861696 ) ( ON ?auto_1861689 ?auto_1861697 ) ( CLEAR ?auto_1861689 ) ( not ( = ?auto_1861689 ?auto_1861697 ) ) ( not ( = ?auto_1861690 ?auto_1861697 ) ) ( not ( = ?auto_1861687 ?auto_1861697 ) ) ( not ( = ?auto_1861691 ?auto_1861697 ) ) ( ON ?auto_1861684 ?auto_1861683 ) ( ON ?auto_1861685 ?auto_1861684 ) ( ON ?auto_1861682 ?auto_1861685 ) ( ON ?auto_1861686 ?auto_1861682 ) ( ON ?auto_1861688 ?auto_1861686 ) ( ON ?auto_1861687 ?auto_1861688 ) ( not ( = ?auto_1861683 ?auto_1861684 ) ) ( not ( = ?auto_1861683 ?auto_1861685 ) ) ( not ( = ?auto_1861683 ?auto_1861682 ) ) ( not ( = ?auto_1861683 ?auto_1861686 ) ) ( not ( = ?auto_1861683 ?auto_1861688 ) ) ( not ( = ?auto_1861683 ?auto_1861687 ) ) ( not ( = ?auto_1861683 ?auto_1861689 ) ) ( not ( = ?auto_1861683 ?auto_1861690 ) ) ( not ( = ?auto_1861683 ?auto_1861691 ) ) ( not ( = ?auto_1861683 ?auto_1861697 ) ) ( not ( = ?auto_1861684 ?auto_1861685 ) ) ( not ( = ?auto_1861684 ?auto_1861682 ) ) ( not ( = ?auto_1861684 ?auto_1861686 ) ) ( not ( = ?auto_1861684 ?auto_1861688 ) ) ( not ( = ?auto_1861684 ?auto_1861687 ) ) ( not ( = ?auto_1861684 ?auto_1861689 ) ) ( not ( = ?auto_1861684 ?auto_1861690 ) ) ( not ( = ?auto_1861684 ?auto_1861691 ) ) ( not ( = ?auto_1861684 ?auto_1861697 ) ) ( not ( = ?auto_1861685 ?auto_1861682 ) ) ( not ( = ?auto_1861685 ?auto_1861686 ) ) ( not ( = ?auto_1861685 ?auto_1861688 ) ) ( not ( = ?auto_1861685 ?auto_1861687 ) ) ( not ( = ?auto_1861685 ?auto_1861689 ) ) ( not ( = ?auto_1861685 ?auto_1861690 ) ) ( not ( = ?auto_1861685 ?auto_1861691 ) ) ( not ( = ?auto_1861685 ?auto_1861697 ) ) ( not ( = ?auto_1861682 ?auto_1861686 ) ) ( not ( = ?auto_1861682 ?auto_1861688 ) ) ( not ( = ?auto_1861682 ?auto_1861687 ) ) ( not ( = ?auto_1861682 ?auto_1861689 ) ) ( not ( = ?auto_1861682 ?auto_1861690 ) ) ( not ( = ?auto_1861682 ?auto_1861691 ) ) ( not ( = ?auto_1861682 ?auto_1861697 ) ) ( not ( = ?auto_1861686 ?auto_1861688 ) ) ( not ( = ?auto_1861686 ?auto_1861687 ) ) ( not ( = ?auto_1861686 ?auto_1861689 ) ) ( not ( = ?auto_1861686 ?auto_1861690 ) ) ( not ( = ?auto_1861686 ?auto_1861691 ) ) ( not ( = ?auto_1861686 ?auto_1861697 ) ) ( not ( = ?auto_1861688 ?auto_1861687 ) ) ( not ( = ?auto_1861688 ?auto_1861689 ) ) ( not ( = ?auto_1861688 ?auto_1861690 ) ) ( not ( = ?auto_1861688 ?auto_1861691 ) ) ( not ( = ?auto_1861688 ?auto_1861697 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861687 ?auto_1861689 ?auto_1861690 )
      ( MAKE-8CRATE-VERIFY ?auto_1861683 ?auto_1861684 ?auto_1861685 ?auto_1861682 ?auto_1861686 ?auto_1861688 ?auto_1861687 ?auto_1861689 ?auto_1861690 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1861699 - SURFACE
      ?auto_1861700 - SURFACE
      ?auto_1861701 - SURFACE
      ?auto_1861698 - SURFACE
      ?auto_1861702 - SURFACE
      ?auto_1861704 - SURFACE
      ?auto_1861703 - SURFACE
      ?auto_1861705 - SURFACE
      ?auto_1861706 - SURFACE
      ?auto_1861707 - SURFACE
    )
    :vars
    (
      ?auto_1861712 - HOIST
      ?auto_1861711 - PLACE
      ?auto_1861713 - PLACE
      ?auto_1861710 - HOIST
      ?auto_1861708 - SURFACE
      ?auto_1861709 - TRUCK
      ?auto_1861714 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861712 ?auto_1861711 ) ( IS-CRATE ?auto_1861707 ) ( not ( = ?auto_1861706 ?auto_1861707 ) ) ( not ( = ?auto_1861705 ?auto_1861706 ) ) ( not ( = ?auto_1861705 ?auto_1861707 ) ) ( not ( = ?auto_1861713 ?auto_1861711 ) ) ( HOIST-AT ?auto_1861710 ?auto_1861713 ) ( not ( = ?auto_1861712 ?auto_1861710 ) ) ( SURFACE-AT ?auto_1861707 ?auto_1861713 ) ( ON ?auto_1861707 ?auto_1861708 ) ( CLEAR ?auto_1861707 ) ( not ( = ?auto_1861706 ?auto_1861708 ) ) ( not ( = ?auto_1861707 ?auto_1861708 ) ) ( not ( = ?auto_1861705 ?auto_1861708 ) ) ( SURFACE-AT ?auto_1861705 ?auto_1861711 ) ( CLEAR ?auto_1861705 ) ( IS-CRATE ?auto_1861706 ) ( AVAILABLE ?auto_1861712 ) ( TRUCK-AT ?auto_1861709 ?auto_1861713 ) ( AVAILABLE ?auto_1861710 ) ( SURFACE-AT ?auto_1861706 ?auto_1861713 ) ( ON ?auto_1861706 ?auto_1861714 ) ( CLEAR ?auto_1861706 ) ( not ( = ?auto_1861706 ?auto_1861714 ) ) ( not ( = ?auto_1861707 ?auto_1861714 ) ) ( not ( = ?auto_1861705 ?auto_1861714 ) ) ( not ( = ?auto_1861708 ?auto_1861714 ) ) ( ON ?auto_1861700 ?auto_1861699 ) ( ON ?auto_1861701 ?auto_1861700 ) ( ON ?auto_1861698 ?auto_1861701 ) ( ON ?auto_1861702 ?auto_1861698 ) ( ON ?auto_1861704 ?auto_1861702 ) ( ON ?auto_1861703 ?auto_1861704 ) ( ON ?auto_1861705 ?auto_1861703 ) ( not ( = ?auto_1861699 ?auto_1861700 ) ) ( not ( = ?auto_1861699 ?auto_1861701 ) ) ( not ( = ?auto_1861699 ?auto_1861698 ) ) ( not ( = ?auto_1861699 ?auto_1861702 ) ) ( not ( = ?auto_1861699 ?auto_1861704 ) ) ( not ( = ?auto_1861699 ?auto_1861703 ) ) ( not ( = ?auto_1861699 ?auto_1861705 ) ) ( not ( = ?auto_1861699 ?auto_1861706 ) ) ( not ( = ?auto_1861699 ?auto_1861707 ) ) ( not ( = ?auto_1861699 ?auto_1861708 ) ) ( not ( = ?auto_1861699 ?auto_1861714 ) ) ( not ( = ?auto_1861700 ?auto_1861701 ) ) ( not ( = ?auto_1861700 ?auto_1861698 ) ) ( not ( = ?auto_1861700 ?auto_1861702 ) ) ( not ( = ?auto_1861700 ?auto_1861704 ) ) ( not ( = ?auto_1861700 ?auto_1861703 ) ) ( not ( = ?auto_1861700 ?auto_1861705 ) ) ( not ( = ?auto_1861700 ?auto_1861706 ) ) ( not ( = ?auto_1861700 ?auto_1861707 ) ) ( not ( = ?auto_1861700 ?auto_1861708 ) ) ( not ( = ?auto_1861700 ?auto_1861714 ) ) ( not ( = ?auto_1861701 ?auto_1861698 ) ) ( not ( = ?auto_1861701 ?auto_1861702 ) ) ( not ( = ?auto_1861701 ?auto_1861704 ) ) ( not ( = ?auto_1861701 ?auto_1861703 ) ) ( not ( = ?auto_1861701 ?auto_1861705 ) ) ( not ( = ?auto_1861701 ?auto_1861706 ) ) ( not ( = ?auto_1861701 ?auto_1861707 ) ) ( not ( = ?auto_1861701 ?auto_1861708 ) ) ( not ( = ?auto_1861701 ?auto_1861714 ) ) ( not ( = ?auto_1861698 ?auto_1861702 ) ) ( not ( = ?auto_1861698 ?auto_1861704 ) ) ( not ( = ?auto_1861698 ?auto_1861703 ) ) ( not ( = ?auto_1861698 ?auto_1861705 ) ) ( not ( = ?auto_1861698 ?auto_1861706 ) ) ( not ( = ?auto_1861698 ?auto_1861707 ) ) ( not ( = ?auto_1861698 ?auto_1861708 ) ) ( not ( = ?auto_1861698 ?auto_1861714 ) ) ( not ( = ?auto_1861702 ?auto_1861704 ) ) ( not ( = ?auto_1861702 ?auto_1861703 ) ) ( not ( = ?auto_1861702 ?auto_1861705 ) ) ( not ( = ?auto_1861702 ?auto_1861706 ) ) ( not ( = ?auto_1861702 ?auto_1861707 ) ) ( not ( = ?auto_1861702 ?auto_1861708 ) ) ( not ( = ?auto_1861702 ?auto_1861714 ) ) ( not ( = ?auto_1861704 ?auto_1861703 ) ) ( not ( = ?auto_1861704 ?auto_1861705 ) ) ( not ( = ?auto_1861704 ?auto_1861706 ) ) ( not ( = ?auto_1861704 ?auto_1861707 ) ) ( not ( = ?auto_1861704 ?auto_1861708 ) ) ( not ( = ?auto_1861704 ?auto_1861714 ) ) ( not ( = ?auto_1861703 ?auto_1861705 ) ) ( not ( = ?auto_1861703 ?auto_1861706 ) ) ( not ( = ?auto_1861703 ?auto_1861707 ) ) ( not ( = ?auto_1861703 ?auto_1861708 ) ) ( not ( = ?auto_1861703 ?auto_1861714 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861705 ?auto_1861706 ?auto_1861707 )
      ( MAKE-9CRATE-VERIFY ?auto_1861699 ?auto_1861700 ?auto_1861701 ?auto_1861698 ?auto_1861702 ?auto_1861704 ?auto_1861703 ?auto_1861705 ?auto_1861706 ?auto_1861707 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1861716 - SURFACE
      ?auto_1861717 - SURFACE
      ?auto_1861718 - SURFACE
      ?auto_1861715 - SURFACE
      ?auto_1861719 - SURFACE
      ?auto_1861721 - SURFACE
      ?auto_1861720 - SURFACE
      ?auto_1861722 - SURFACE
      ?auto_1861723 - SURFACE
      ?auto_1861724 - SURFACE
      ?auto_1861725 - SURFACE
    )
    :vars
    (
      ?auto_1861730 - HOIST
      ?auto_1861729 - PLACE
      ?auto_1861731 - PLACE
      ?auto_1861728 - HOIST
      ?auto_1861726 - SURFACE
      ?auto_1861727 - TRUCK
      ?auto_1861732 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861730 ?auto_1861729 ) ( IS-CRATE ?auto_1861725 ) ( not ( = ?auto_1861724 ?auto_1861725 ) ) ( not ( = ?auto_1861723 ?auto_1861724 ) ) ( not ( = ?auto_1861723 ?auto_1861725 ) ) ( not ( = ?auto_1861731 ?auto_1861729 ) ) ( HOIST-AT ?auto_1861728 ?auto_1861731 ) ( not ( = ?auto_1861730 ?auto_1861728 ) ) ( SURFACE-AT ?auto_1861725 ?auto_1861731 ) ( ON ?auto_1861725 ?auto_1861726 ) ( CLEAR ?auto_1861725 ) ( not ( = ?auto_1861724 ?auto_1861726 ) ) ( not ( = ?auto_1861725 ?auto_1861726 ) ) ( not ( = ?auto_1861723 ?auto_1861726 ) ) ( SURFACE-AT ?auto_1861723 ?auto_1861729 ) ( CLEAR ?auto_1861723 ) ( IS-CRATE ?auto_1861724 ) ( AVAILABLE ?auto_1861730 ) ( TRUCK-AT ?auto_1861727 ?auto_1861731 ) ( AVAILABLE ?auto_1861728 ) ( SURFACE-AT ?auto_1861724 ?auto_1861731 ) ( ON ?auto_1861724 ?auto_1861732 ) ( CLEAR ?auto_1861724 ) ( not ( = ?auto_1861724 ?auto_1861732 ) ) ( not ( = ?auto_1861725 ?auto_1861732 ) ) ( not ( = ?auto_1861723 ?auto_1861732 ) ) ( not ( = ?auto_1861726 ?auto_1861732 ) ) ( ON ?auto_1861717 ?auto_1861716 ) ( ON ?auto_1861718 ?auto_1861717 ) ( ON ?auto_1861715 ?auto_1861718 ) ( ON ?auto_1861719 ?auto_1861715 ) ( ON ?auto_1861721 ?auto_1861719 ) ( ON ?auto_1861720 ?auto_1861721 ) ( ON ?auto_1861722 ?auto_1861720 ) ( ON ?auto_1861723 ?auto_1861722 ) ( not ( = ?auto_1861716 ?auto_1861717 ) ) ( not ( = ?auto_1861716 ?auto_1861718 ) ) ( not ( = ?auto_1861716 ?auto_1861715 ) ) ( not ( = ?auto_1861716 ?auto_1861719 ) ) ( not ( = ?auto_1861716 ?auto_1861721 ) ) ( not ( = ?auto_1861716 ?auto_1861720 ) ) ( not ( = ?auto_1861716 ?auto_1861722 ) ) ( not ( = ?auto_1861716 ?auto_1861723 ) ) ( not ( = ?auto_1861716 ?auto_1861724 ) ) ( not ( = ?auto_1861716 ?auto_1861725 ) ) ( not ( = ?auto_1861716 ?auto_1861726 ) ) ( not ( = ?auto_1861716 ?auto_1861732 ) ) ( not ( = ?auto_1861717 ?auto_1861718 ) ) ( not ( = ?auto_1861717 ?auto_1861715 ) ) ( not ( = ?auto_1861717 ?auto_1861719 ) ) ( not ( = ?auto_1861717 ?auto_1861721 ) ) ( not ( = ?auto_1861717 ?auto_1861720 ) ) ( not ( = ?auto_1861717 ?auto_1861722 ) ) ( not ( = ?auto_1861717 ?auto_1861723 ) ) ( not ( = ?auto_1861717 ?auto_1861724 ) ) ( not ( = ?auto_1861717 ?auto_1861725 ) ) ( not ( = ?auto_1861717 ?auto_1861726 ) ) ( not ( = ?auto_1861717 ?auto_1861732 ) ) ( not ( = ?auto_1861718 ?auto_1861715 ) ) ( not ( = ?auto_1861718 ?auto_1861719 ) ) ( not ( = ?auto_1861718 ?auto_1861721 ) ) ( not ( = ?auto_1861718 ?auto_1861720 ) ) ( not ( = ?auto_1861718 ?auto_1861722 ) ) ( not ( = ?auto_1861718 ?auto_1861723 ) ) ( not ( = ?auto_1861718 ?auto_1861724 ) ) ( not ( = ?auto_1861718 ?auto_1861725 ) ) ( not ( = ?auto_1861718 ?auto_1861726 ) ) ( not ( = ?auto_1861718 ?auto_1861732 ) ) ( not ( = ?auto_1861715 ?auto_1861719 ) ) ( not ( = ?auto_1861715 ?auto_1861721 ) ) ( not ( = ?auto_1861715 ?auto_1861720 ) ) ( not ( = ?auto_1861715 ?auto_1861722 ) ) ( not ( = ?auto_1861715 ?auto_1861723 ) ) ( not ( = ?auto_1861715 ?auto_1861724 ) ) ( not ( = ?auto_1861715 ?auto_1861725 ) ) ( not ( = ?auto_1861715 ?auto_1861726 ) ) ( not ( = ?auto_1861715 ?auto_1861732 ) ) ( not ( = ?auto_1861719 ?auto_1861721 ) ) ( not ( = ?auto_1861719 ?auto_1861720 ) ) ( not ( = ?auto_1861719 ?auto_1861722 ) ) ( not ( = ?auto_1861719 ?auto_1861723 ) ) ( not ( = ?auto_1861719 ?auto_1861724 ) ) ( not ( = ?auto_1861719 ?auto_1861725 ) ) ( not ( = ?auto_1861719 ?auto_1861726 ) ) ( not ( = ?auto_1861719 ?auto_1861732 ) ) ( not ( = ?auto_1861721 ?auto_1861720 ) ) ( not ( = ?auto_1861721 ?auto_1861722 ) ) ( not ( = ?auto_1861721 ?auto_1861723 ) ) ( not ( = ?auto_1861721 ?auto_1861724 ) ) ( not ( = ?auto_1861721 ?auto_1861725 ) ) ( not ( = ?auto_1861721 ?auto_1861726 ) ) ( not ( = ?auto_1861721 ?auto_1861732 ) ) ( not ( = ?auto_1861720 ?auto_1861722 ) ) ( not ( = ?auto_1861720 ?auto_1861723 ) ) ( not ( = ?auto_1861720 ?auto_1861724 ) ) ( not ( = ?auto_1861720 ?auto_1861725 ) ) ( not ( = ?auto_1861720 ?auto_1861726 ) ) ( not ( = ?auto_1861720 ?auto_1861732 ) ) ( not ( = ?auto_1861722 ?auto_1861723 ) ) ( not ( = ?auto_1861722 ?auto_1861724 ) ) ( not ( = ?auto_1861722 ?auto_1861725 ) ) ( not ( = ?auto_1861722 ?auto_1861726 ) ) ( not ( = ?auto_1861722 ?auto_1861732 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861723 ?auto_1861724 ?auto_1861725 )
      ( MAKE-10CRATE-VERIFY ?auto_1861716 ?auto_1861717 ?auto_1861718 ?auto_1861715 ?auto_1861719 ?auto_1861721 ?auto_1861720 ?auto_1861722 ?auto_1861723 ?auto_1861724 ?auto_1861725 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1861734 - SURFACE
      ?auto_1861735 - SURFACE
      ?auto_1861736 - SURFACE
      ?auto_1861733 - SURFACE
      ?auto_1861737 - SURFACE
      ?auto_1861739 - SURFACE
      ?auto_1861738 - SURFACE
      ?auto_1861740 - SURFACE
      ?auto_1861741 - SURFACE
      ?auto_1861742 - SURFACE
      ?auto_1861743 - SURFACE
      ?auto_1861744 - SURFACE
    )
    :vars
    (
      ?auto_1861749 - HOIST
      ?auto_1861748 - PLACE
      ?auto_1861750 - PLACE
      ?auto_1861747 - HOIST
      ?auto_1861745 - SURFACE
      ?auto_1861746 - TRUCK
      ?auto_1861751 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861749 ?auto_1861748 ) ( IS-CRATE ?auto_1861744 ) ( not ( = ?auto_1861743 ?auto_1861744 ) ) ( not ( = ?auto_1861742 ?auto_1861743 ) ) ( not ( = ?auto_1861742 ?auto_1861744 ) ) ( not ( = ?auto_1861750 ?auto_1861748 ) ) ( HOIST-AT ?auto_1861747 ?auto_1861750 ) ( not ( = ?auto_1861749 ?auto_1861747 ) ) ( SURFACE-AT ?auto_1861744 ?auto_1861750 ) ( ON ?auto_1861744 ?auto_1861745 ) ( CLEAR ?auto_1861744 ) ( not ( = ?auto_1861743 ?auto_1861745 ) ) ( not ( = ?auto_1861744 ?auto_1861745 ) ) ( not ( = ?auto_1861742 ?auto_1861745 ) ) ( SURFACE-AT ?auto_1861742 ?auto_1861748 ) ( CLEAR ?auto_1861742 ) ( IS-CRATE ?auto_1861743 ) ( AVAILABLE ?auto_1861749 ) ( TRUCK-AT ?auto_1861746 ?auto_1861750 ) ( AVAILABLE ?auto_1861747 ) ( SURFACE-AT ?auto_1861743 ?auto_1861750 ) ( ON ?auto_1861743 ?auto_1861751 ) ( CLEAR ?auto_1861743 ) ( not ( = ?auto_1861743 ?auto_1861751 ) ) ( not ( = ?auto_1861744 ?auto_1861751 ) ) ( not ( = ?auto_1861742 ?auto_1861751 ) ) ( not ( = ?auto_1861745 ?auto_1861751 ) ) ( ON ?auto_1861735 ?auto_1861734 ) ( ON ?auto_1861736 ?auto_1861735 ) ( ON ?auto_1861733 ?auto_1861736 ) ( ON ?auto_1861737 ?auto_1861733 ) ( ON ?auto_1861739 ?auto_1861737 ) ( ON ?auto_1861738 ?auto_1861739 ) ( ON ?auto_1861740 ?auto_1861738 ) ( ON ?auto_1861741 ?auto_1861740 ) ( ON ?auto_1861742 ?auto_1861741 ) ( not ( = ?auto_1861734 ?auto_1861735 ) ) ( not ( = ?auto_1861734 ?auto_1861736 ) ) ( not ( = ?auto_1861734 ?auto_1861733 ) ) ( not ( = ?auto_1861734 ?auto_1861737 ) ) ( not ( = ?auto_1861734 ?auto_1861739 ) ) ( not ( = ?auto_1861734 ?auto_1861738 ) ) ( not ( = ?auto_1861734 ?auto_1861740 ) ) ( not ( = ?auto_1861734 ?auto_1861741 ) ) ( not ( = ?auto_1861734 ?auto_1861742 ) ) ( not ( = ?auto_1861734 ?auto_1861743 ) ) ( not ( = ?auto_1861734 ?auto_1861744 ) ) ( not ( = ?auto_1861734 ?auto_1861745 ) ) ( not ( = ?auto_1861734 ?auto_1861751 ) ) ( not ( = ?auto_1861735 ?auto_1861736 ) ) ( not ( = ?auto_1861735 ?auto_1861733 ) ) ( not ( = ?auto_1861735 ?auto_1861737 ) ) ( not ( = ?auto_1861735 ?auto_1861739 ) ) ( not ( = ?auto_1861735 ?auto_1861738 ) ) ( not ( = ?auto_1861735 ?auto_1861740 ) ) ( not ( = ?auto_1861735 ?auto_1861741 ) ) ( not ( = ?auto_1861735 ?auto_1861742 ) ) ( not ( = ?auto_1861735 ?auto_1861743 ) ) ( not ( = ?auto_1861735 ?auto_1861744 ) ) ( not ( = ?auto_1861735 ?auto_1861745 ) ) ( not ( = ?auto_1861735 ?auto_1861751 ) ) ( not ( = ?auto_1861736 ?auto_1861733 ) ) ( not ( = ?auto_1861736 ?auto_1861737 ) ) ( not ( = ?auto_1861736 ?auto_1861739 ) ) ( not ( = ?auto_1861736 ?auto_1861738 ) ) ( not ( = ?auto_1861736 ?auto_1861740 ) ) ( not ( = ?auto_1861736 ?auto_1861741 ) ) ( not ( = ?auto_1861736 ?auto_1861742 ) ) ( not ( = ?auto_1861736 ?auto_1861743 ) ) ( not ( = ?auto_1861736 ?auto_1861744 ) ) ( not ( = ?auto_1861736 ?auto_1861745 ) ) ( not ( = ?auto_1861736 ?auto_1861751 ) ) ( not ( = ?auto_1861733 ?auto_1861737 ) ) ( not ( = ?auto_1861733 ?auto_1861739 ) ) ( not ( = ?auto_1861733 ?auto_1861738 ) ) ( not ( = ?auto_1861733 ?auto_1861740 ) ) ( not ( = ?auto_1861733 ?auto_1861741 ) ) ( not ( = ?auto_1861733 ?auto_1861742 ) ) ( not ( = ?auto_1861733 ?auto_1861743 ) ) ( not ( = ?auto_1861733 ?auto_1861744 ) ) ( not ( = ?auto_1861733 ?auto_1861745 ) ) ( not ( = ?auto_1861733 ?auto_1861751 ) ) ( not ( = ?auto_1861737 ?auto_1861739 ) ) ( not ( = ?auto_1861737 ?auto_1861738 ) ) ( not ( = ?auto_1861737 ?auto_1861740 ) ) ( not ( = ?auto_1861737 ?auto_1861741 ) ) ( not ( = ?auto_1861737 ?auto_1861742 ) ) ( not ( = ?auto_1861737 ?auto_1861743 ) ) ( not ( = ?auto_1861737 ?auto_1861744 ) ) ( not ( = ?auto_1861737 ?auto_1861745 ) ) ( not ( = ?auto_1861737 ?auto_1861751 ) ) ( not ( = ?auto_1861739 ?auto_1861738 ) ) ( not ( = ?auto_1861739 ?auto_1861740 ) ) ( not ( = ?auto_1861739 ?auto_1861741 ) ) ( not ( = ?auto_1861739 ?auto_1861742 ) ) ( not ( = ?auto_1861739 ?auto_1861743 ) ) ( not ( = ?auto_1861739 ?auto_1861744 ) ) ( not ( = ?auto_1861739 ?auto_1861745 ) ) ( not ( = ?auto_1861739 ?auto_1861751 ) ) ( not ( = ?auto_1861738 ?auto_1861740 ) ) ( not ( = ?auto_1861738 ?auto_1861741 ) ) ( not ( = ?auto_1861738 ?auto_1861742 ) ) ( not ( = ?auto_1861738 ?auto_1861743 ) ) ( not ( = ?auto_1861738 ?auto_1861744 ) ) ( not ( = ?auto_1861738 ?auto_1861745 ) ) ( not ( = ?auto_1861738 ?auto_1861751 ) ) ( not ( = ?auto_1861740 ?auto_1861741 ) ) ( not ( = ?auto_1861740 ?auto_1861742 ) ) ( not ( = ?auto_1861740 ?auto_1861743 ) ) ( not ( = ?auto_1861740 ?auto_1861744 ) ) ( not ( = ?auto_1861740 ?auto_1861745 ) ) ( not ( = ?auto_1861740 ?auto_1861751 ) ) ( not ( = ?auto_1861741 ?auto_1861742 ) ) ( not ( = ?auto_1861741 ?auto_1861743 ) ) ( not ( = ?auto_1861741 ?auto_1861744 ) ) ( not ( = ?auto_1861741 ?auto_1861745 ) ) ( not ( = ?auto_1861741 ?auto_1861751 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861742 ?auto_1861743 ?auto_1861744 )
      ( MAKE-11CRATE-VERIFY ?auto_1861734 ?auto_1861735 ?auto_1861736 ?auto_1861733 ?auto_1861737 ?auto_1861739 ?auto_1861738 ?auto_1861740 ?auto_1861741 ?auto_1861742 ?auto_1861743 ?auto_1861744 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1861753 - SURFACE
      ?auto_1861754 - SURFACE
      ?auto_1861755 - SURFACE
      ?auto_1861752 - SURFACE
      ?auto_1861756 - SURFACE
      ?auto_1861758 - SURFACE
      ?auto_1861757 - SURFACE
      ?auto_1861759 - SURFACE
      ?auto_1861760 - SURFACE
      ?auto_1861761 - SURFACE
      ?auto_1861762 - SURFACE
      ?auto_1861763 - SURFACE
      ?auto_1861764 - SURFACE
    )
    :vars
    (
      ?auto_1861769 - HOIST
      ?auto_1861768 - PLACE
      ?auto_1861770 - PLACE
      ?auto_1861767 - HOIST
      ?auto_1861765 - SURFACE
      ?auto_1861766 - TRUCK
      ?auto_1861771 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861769 ?auto_1861768 ) ( IS-CRATE ?auto_1861764 ) ( not ( = ?auto_1861763 ?auto_1861764 ) ) ( not ( = ?auto_1861762 ?auto_1861763 ) ) ( not ( = ?auto_1861762 ?auto_1861764 ) ) ( not ( = ?auto_1861770 ?auto_1861768 ) ) ( HOIST-AT ?auto_1861767 ?auto_1861770 ) ( not ( = ?auto_1861769 ?auto_1861767 ) ) ( SURFACE-AT ?auto_1861764 ?auto_1861770 ) ( ON ?auto_1861764 ?auto_1861765 ) ( CLEAR ?auto_1861764 ) ( not ( = ?auto_1861763 ?auto_1861765 ) ) ( not ( = ?auto_1861764 ?auto_1861765 ) ) ( not ( = ?auto_1861762 ?auto_1861765 ) ) ( SURFACE-AT ?auto_1861762 ?auto_1861768 ) ( CLEAR ?auto_1861762 ) ( IS-CRATE ?auto_1861763 ) ( AVAILABLE ?auto_1861769 ) ( TRUCK-AT ?auto_1861766 ?auto_1861770 ) ( AVAILABLE ?auto_1861767 ) ( SURFACE-AT ?auto_1861763 ?auto_1861770 ) ( ON ?auto_1861763 ?auto_1861771 ) ( CLEAR ?auto_1861763 ) ( not ( = ?auto_1861763 ?auto_1861771 ) ) ( not ( = ?auto_1861764 ?auto_1861771 ) ) ( not ( = ?auto_1861762 ?auto_1861771 ) ) ( not ( = ?auto_1861765 ?auto_1861771 ) ) ( ON ?auto_1861754 ?auto_1861753 ) ( ON ?auto_1861755 ?auto_1861754 ) ( ON ?auto_1861752 ?auto_1861755 ) ( ON ?auto_1861756 ?auto_1861752 ) ( ON ?auto_1861758 ?auto_1861756 ) ( ON ?auto_1861757 ?auto_1861758 ) ( ON ?auto_1861759 ?auto_1861757 ) ( ON ?auto_1861760 ?auto_1861759 ) ( ON ?auto_1861761 ?auto_1861760 ) ( ON ?auto_1861762 ?auto_1861761 ) ( not ( = ?auto_1861753 ?auto_1861754 ) ) ( not ( = ?auto_1861753 ?auto_1861755 ) ) ( not ( = ?auto_1861753 ?auto_1861752 ) ) ( not ( = ?auto_1861753 ?auto_1861756 ) ) ( not ( = ?auto_1861753 ?auto_1861758 ) ) ( not ( = ?auto_1861753 ?auto_1861757 ) ) ( not ( = ?auto_1861753 ?auto_1861759 ) ) ( not ( = ?auto_1861753 ?auto_1861760 ) ) ( not ( = ?auto_1861753 ?auto_1861761 ) ) ( not ( = ?auto_1861753 ?auto_1861762 ) ) ( not ( = ?auto_1861753 ?auto_1861763 ) ) ( not ( = ?auto_1861753 ?auto_1861764 ) ) ( not ( = ?auto_1861753 ?auto_1861765 ) ) ( not ( = ?auto_1861753 ?auto_1861771 ) ) ( not ( = ?auto_1861754 ?auto_1861755 ) ) ( not ( = ?auto_1861754 ?auto_1861752 ) ) ( not ( = ?auto_1861754 ?auto_1861756 ) ) ( not ( = ?auto_1861754 ?auto_1861758 ) ) ( not ( = ?auto_1861754 ?auto_1861757 ) ) ( not ( = ?auto_1861754 ?auto_1861759 ) ) ( not ( = ?auto_1861754 ?auto_1861760 ) ) ( not ( = ?auto_1861754 ?auto_1861761 ) ) ( not ( = ?auto_1861754 ?auto_1861762 ) ) ( not ( = ?auto_1861754 ?auto_1861763 ) ) ( not ( = ?auto_1861754 ?auto_1861764 ) ) ( not ( = ?auto_1861754 ?auto_1861765 ) ) ( not ( = ?auto_1861754 ?auto_1861771 ) ) ( not ( = ?auto_1861755 ?auto_1861752 ) ) ( not ( = ?auto_1861755 ?auto_1861756 ) ) ( not ( = ?auto_1861755 ?auto_1861758 ) ) ( not ( = ?auto_1861755 ?auto_1861757 ) ) ( not ( = ?auto_1861755 ?auto_1861759 ) ) ( not ( = ?auto_1861755 ?auto_1861760 ) ) ( not ( = ?auto_1861755 ?auto_1861761 ) ) ( not ( = ?auto_1861755 ?auto_1861762 ) ) ( not ( = ?auto_1861755 ?auto_1861763 ) ) ( not ( = ?auto_1861755 ?auto_1861764 ) ) ( not ( = ?auto_1861755 ?auto_1861765 ) ) ( not ( = ?auto_1861755 ?auto_1861771 ) ) ( not ( = ?auto_1861752 ?auto_1861756 ) ) ( not ( = ?auto_1861752 ?auto_1861758 ) ) ( not ( = ?auto_1861752 ?auto_1861757 ) ) ( not ( = ?auto_1861752 ?auto_1861759 ) ) ( not ( = ?auto_1861752 ?auto_1861760 ) ) ( not ( = ?auto_1861752 ?auto_1861761 ) ) ( not ( = ?auto_1861752 ?auto_1861762 ) ) ( not ( = ?auto_1861752 ?auto_1861763 ) ) ( not ( = ?auto_1861752 ?auto_1861764 ) ) ( not ( = ?auto_1861752 ?auto_1861765 ) ) ( not ( = ?auto_1861752 ?auto_1861771 ) ) ( not ( = ?auto_1861756 ?auto_1861758 ) ) ( not ( = ?auto_1861756 ?auto_1861757 ) ) ( not ( = ?auto_1861756 ?auto_1861759 ) ) ( not ( = ?auto_1861756 ?auto_1861760 ) ) ( not ( = ?auto_1861756 ?auto_1861761 ) ) ( not ( = ?auto_1861756 ?auto_1861762 ) ) ( not ( = ?auto_1861756 ?auto_1861763 ) ) ( not ( = ?auto_1861756 ?auto_1861764 ) ) ( not ( = ?auto_1861756 ?auto_1861765 ) ) ( not ( = ?auto_1861756 ?auto_1861771 ) ) ( not ( = ?auto_1861758 ?auto_1861757 ) ) ( not ( = ?auto_1861758 ?auto_1861759 ) ) ( not ( = ?auto_1861758 ?auto_1861760 ) ) ( not ( = ?auto_1861758 ?auto_1861761 ) ) ( not ( = ?auto_1861758 ?auto_1861762 ) ) ( not ( = ?auto_1861758 ?auto_1861763 ) ) ( not ( = ?auto_1861758 ?auto_1861764 ) ) ( not ( = ?auto_1861758 ?auto_1861765 ) ) ( not ( = ?auto_1861758 ?auto_1861771 ) ) ( not ( = ?auto_1861757 ?auto_1861759 ) ) ( not ( = ?auto_1861757 ?auto_1861760 ) ) ( not ( = ?auto_1861757 ?auto_1861761 ) ) ( not ( = ?auto_1861757 ?auto_1861762 ) ) ( not ( = ?auto_1861757 ?auto_1861763 ) ) ( not ( = ?auto_1861757 ?auto_1861764 ) ) ( not ( = ?auto_1861757 ?auto_1861765 ) ) ( not ( = ?auto_1861757 ?auto_1861771 ) ) ( not ( = ?auto_1861759 ?auto_1861760 ) ) ( not ( = ?auto_1861759 ?auto_1861761 ) ) ( not ( = ?auto_1861759 ?auto_1861762 ) ) ( not ( = ?auto_1861759 ?auto_1861763 ) ) ( not ( = ?auto_1861759 ?auto_1861764 ) ) ( not ( = ?auto_1861759 ?auto_1861765 ) ) ( not ( = ?auto_1861759 ?auto_1861771 ) ) ( not ( = ?auto_1861760 ?auto_1861761 ) ) ( not ( = ?auto_1861760 ?auto_1861762 ) ) ( not ( = ?auto_1861760 ?auto_1861763 ) ) ( not ( = ?auto_1861760 ?auto_1861764 ) ) ( not ( = ?auto_1861760 ?auto_1861765 ) ) ( not ( = ?auto_1861760 ?auto_1861771 ) ) ( not ( = ?auto_1861761 ?auto_1861762 ) ) ( not ( = ?auto_1861761 ?auto_1861763 ) ) ( not ( = ?auto_1861761 ?auto_1861764 ) ) ( not ( = ?auto_1861761 ?auto_1861765 ) ) ( not ( = ?auto_1861761 ?auto_1861771 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861762 ?auto_1861763 ?auto_1861764 )
      ( MAKE-12CRATE-VERIFY ?auto_1861753 ?auto_1861754 ?auto_1861755 ?auto_1861752 ?auto_1861756 ?auto_1861758 ?auto_1861757 ?auto_1861759 ?auto_1861760 ?auto_1861761 ?auto_1861762 ?auto_1861763 ?auto_1861764 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1861773 - SURFACE
      ?auto_1861774 - SURFACE
      ?auto_1861775 - SURFACE
      ?auto_1861772 - SURFACE
      ?auto_1861776 - SURFACE
      ?auto_1861778 - SURFACE
      ?auto_1861777 - SURFACE
      ?auto_1861779 - SURFACE
      ?auto_1861780 - SURFACE
      ?auto_1861781 - SURFACE
      ?auto_1861782 - SURFACE
      ?auto_1861783 - SURFACE
      ?auto_1861784 - SURFACE
      ?auto_1861785 - SURFACE
    )
    :vars
    (
      ?auto_1861790 - HOIST
      ?auto_1861789 - PLACE
      ?auto_1861791 - PLACE
      ?auto_1861788 - HOIST
      ?auto_1861786 - SURFACE
      ?auto_1861787 - TRUCK
      ?auto_1861792 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861790 ?auto_1861789 ) ( IS-CRATE ?auto_1861785 ) ( not ( = ?auto_1861784 ?auto_1861785 ) ) ( not ( = ?auto_1861783 ?auto_1861784 ) ) ( not ( = ?auto_1861783 ?auto_1861785 ) ) ( not ( = ?auto_1861791 ?auto_1861789 ) ) ( HOIST-AT ?auto_1861788 ?auto_1861791 ) ( not ( = ?auto_1861790 ?auto_1861788 ) ) ( SURFACE-AT ?auto_1861785 ?auto_1861791 ) ( ON ?auto_1861785 ?auto_1861786 ) ( CLEAR ?auto_1861785 ) ( not ( = ?auto_1861784 ?auto_1861786 ) ) ( not ( = ?auto_1861785 ?auto_1861786 ) ) ( not ( = ?auto_1861783 ?auto_1861786 ) ) ( SURFACE-AT ?auto_1861783 ?auto_1861789 ) ( CLEAR ?auto_1861783 ) ( IS-CRATE ?auto_1861784 ) ( AVAILABLE ?auto_1861790 ) ( TRUCK-AT ?auto_1861787 ?auto_1861791 ) ( AVAILABLE ?auto_1861788 ) ( SURFACE-AT ?auto_1861784 ?auto_1861791 ) ( ON ?auto_1861784 ?auto_1861792 ) ( CLEAR ?auto_1861784 ) ( not ( = ?auto_1861784 ?auto_1861792 ) ) ( not ( = ?auto_1861785 ?auto_1861792 ) ) ( not ( = ?auto_1861783 ?auto_1861792 ) ) ( not ( = ?auto_1861786 ?auto_1861792 ) ) ( ON ?auto_1861774 ?auto_1861773 ) ( ON ?auto_1861775 ?auto_1861774 ) ( ON ?auto_1861772 ?auto_1861775 ) ( ON ?auto_1861776 ?auto_1861772 ) ( ON ?auto_1861778 ?auto_1861776 ) ( ON ?auto_1861777 ?auto_1861778 ) ( ON ?auto_1861779 ?auto_1861777 ) ( ON ?auto_1861780 ?auto_1861779 ) ( ON ?auto_1861781 ?auto_1861780 ) ( ON ?auto_1861782 ?auto_1861781 ) ( ON ?auto_1861783 ?auto_1861782 ) ( not ( = ?auto_1861773 ?auto_1861774 ) ) ( not ( = ?auto_1861773 ?auto_1861775 ) ) ( not ( = ?auto_1861773 ?auto_1861772 ) ) ( not ( = ?auto_1861773 ?auto_1861776 ) ) ( not ( = ?auto_1861773 ?auto_1861778 ) ) ( not ( = ?auto_1861773 ?auto_1861777 ) ) ( not ( = ?auto_1861773 ?auto_1861779 ) ) ( not ( = ?auto_1861773 ?auto_1861780 ) ) ( not ( = ?auto_1861773 ?auto_1861781 ) ) ( not ( = ?auto_1861773 ?auto_1861782 ) ) ( not ( = ?auto_1861773 ?auto_1861783 ) ) ( not ( = ?auto_1861773 ?auto_1861784 ) ) ( not ( = ?auto_1861773 ?auto_1861785 ) ) ( not ( = ?auto_1861773 ?auto_1861786 ) ) ( not ( = ?auto_1861773 ?auto_1861792 ) ) ( not ( = ?auto_1861774 ?auto_1861775 ) ) ( not ( = ?auto_1861774 ?auto_1861772 ) ) ( not ( = ?auto_1861774 ?auto_1861776 ) ) ( not ( = ?auto_1861774 ?auto_1861778 ) ) ( not ( = ?auto_1861774 ?auto_1861777 ) ) ( not ( = ?auto_1861774 ?auto_1861779 ) ) ( not ( = ?auto_1861774 ?auto_1861780 ) ) ( not ( = ?auto_1861774 ?auto_1861781 ) ) ( not ( = ?auto_1861774 ?auto_1861782 ) ) ( not ( = ?auto_1861774 ?auto_1861783 ) ) ( not ( = ?auto_1861774 ?auto_1861784 ) ) ( not ( = ?auto_1861774 ?auto_1861785 ) ) ( not ( = ?auto_1861774 ?auto_1861786 ) ) ( not ( = ?auto_1861774 ?auto_1861792 ) ) ( not ( = ?auto_1861775 ?auto_1861772 ) ) ( not ( = ?auto_1861775 ?auto_1861776 ) ) ( not ( = ?auto_1861775 ?auto_1861778 ) ) ( not ( = ?auto_1861775 ?auto_1861777 ) ) ( not ( = ?auto_1861775 ?auto_1861779 ) ) ( not ( = ?auto_1861775 ?auto_1861780 ) ) ( not ( = ?auto_1861775 ?auto_1861781 ) ) ( not ( = ?auto_1861775 ?auto_1861782 ) ) ( not ( = ?auto_1861775 ?auto_1861783 ) ) ( not ( = ?auto_1861775 ?auto_1861784 ) ) ( not ( = ?auto_1861775 ?auto_1861785 ) ) ( not ( = ?auto_1861775 ?auto_1861786 ) ) ( not ( = ?auto_1861775 ?auto_1861792 ) ) ( not ( = ?auto_1861772 ?auto_1861776 ) ) ( not ( = ?auto_1861772 ?auto_1861778 ) ) ( not ( = ?auto_1861772 ?auto_1861777 ) ) ( not ( = ?auto_1861772 ?auto_1861779 ) ) ( not ( = ?auto_1861772 ?auto_1861780 ) ) ( not ( = ?auto_1861772 ?auto_1861781 ) ) ( not ( = ?auto_1861772 ?auto_1861782 ) ) ( not ( = ?auto_1861772 ?auto_1861783 ) ) ( not ( = ?auto_1861772 ?auto_1861784 ) ) ( not ( = ?auto_1861772 ?auto_1861785 ) ) ( not ( = ?auto_1861772 ?auto_1861786 ) ) ( not ( = ?auto_1861772 ?auto_1861792 ) ) ( not ( = ?auto_1861776 ?auto_1861778 ) ) ( not ( = ?auto_1861776 ?auto_1861777 ) ) ( not ( = ?auto_1861776 ?auto_1861779 ) ) ( not ( = ?auto_1861776 ?auto_1861780 ) ) ( not ( = ?auto_1861776 ?auto_1861781 ) ) ( not ( = ?auto_1861776 ?auto_1861782 ) ) ( not ( = ?auto_1861776 ?auto_1861783 ) ) ( not ( = ?auto_1861776 ?auto_1861784 ) ) ( not ( = ?auto_1861776 ?auto_1861785 ) ) ( not ( = ?auto_1861776 ?auto_1861786 ) ) ( not ( = ?auto_1861776 ?auto_1861792 ) ) ( not ( = ?auto_1861778 ?auto_1861777 ) ) ( not ( = ?auto_1861778 ?auto_1861779 ) ) ( not ( = ?auto_1861778 ?auto_1861780 ) ) ( not ( = ?auto_1861778 ?auto_1861781 ) ) ( not ( = ?auto_1861778 ?auto_1861782 ) ) ( not ( = ?auto_1861778 ?auto_1861783 ) ) ( not ( = ?auto_1861778 ?auto_1861784 ) ) ( not ( = ?auto_1861778 ?auto_1861785 ) ) ( not ( = ?auto_1861778 ?auto_1861786 ) ) ( not ( = ?auto_1861778 ?auto_1861792 ) ) ( not ( = ?auto_1861777 ?auto_1861779 ) ) ( not ( = ?auto_1861777 ?auto_1861780 ) ) ( not ( = ?auto_1861777 ?auto_1861781 ) ) ( not ( = ?auto_1861777 ?auto_1861782 ) ) ( not ( = ?auto_1861777 ?auto_1861783 ) ) ( not ( = ?auto_1861777 ?auto_1861784 ) ) ( not ( = ?auto_1861777 ?auto_1861785 ) ) ( not ( = ?auto_1861777 ?auto_1861786 ) ) ( not ( = ?auto_1861777 ?auto_1861792 ) ) ( not ( = ?auto_1861779 ?auto_1861780 ) ) ( not ( = ?auto_1861779 ?auto_1861781 ) ) ( not ( = ?auto_1861779 ?auto_1861782 ) ) ( not ( = ?auto_1861779 ?auto_1861783 ) ) ( not ( = ?auto_1861779 ?auto_1861784 ) ) ( not ( = ?auto_1861779 ?auto_1861785 ) ) ( not ( = ?auto_1861779 ?auto_1861786 ) ) ( not ( = ?auto_1861779 ?auto_1861792 ) ) ( not ( = ?auto_1861780 ?auto_1861781 ) ) ( not ( = ?auto_1861780 ?auto_1861782 ) ) ( not ( = ?auto_1861780 ?auto_1861783 ) ) ( not ( = ?auto_1861780 ?auto_1861784 ) ) ( not ( = ?auto_1861780 ?auto_1861785 ) ) ( not ( = ?auto_1861780 ?auto_1861786 ) ) ( not ( = ?auto_1861780 ?auto_1861792 ) ) ( not ( = ?auto_1861781 ?auto_1861782 ) ) ( not ( = ?auto_1861781 ?auto_1861783 ) ) ( not ( = ?auto_1861781 ?auto_1861784 ) ) ( not ( = ?auto_1861781 ?auto_1861785 ) ) ( not ( = ?auto_1861781 ?auto_1861786 ) ) ( not ( = ?auto_1861781 ?auto_1861792 ) ) ( not ( = ?auto_1861782 ?auto_1861783 ) ) ( not ( = ?auto_1861782 ?auto_1861784 ) ) ( not ( = ?auto_1861782 ?auto_1861785 ) ) ( not ( = ?auto_1861782 ?auto_1861786 ) ) ( not ( = ?auto_1861782 ?auto_1861792 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861783 ?auto_1861784 ?auto_1861785 )
      ( MAKE-13CRATE-VERIFY ?auto_1861773 ?auto_1861774 ?auto_1861775 ?auto_1861772 ?auto_1861776 ?auto_1861778 ?auto_1861777 ?auto_1861779 ?auto_1861780 ?auto_1861781 ?auto_1861782 ?auto_1861783 ?auto_1861784 ?auto_1861785 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1861825 - SURFACE
      ?auto_1861826 - SURFACE
      ?auto_1861827 - SURFACE
      ?auto_1861824 - SURFACE
      ?auto_1861828 - SURFACE
    )
    :vars
    (
      ?auto_1861831 - HOIST
      ?auto_1861835 - PLACE
      ?auto_1861833 - PLACE
      ?auto_1861832 - HOIST
      ?auto_1861834 - SURFACE
      ?auto_1861829 - SURFACE
      ?auto_1861830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861831 ?auto_1861835 ) ( IS-CRATE ?auto_1861828 ) ( not ( = ?auto_1861824 ?auto_1861828 ) ) ( not ( = ?auto_1861827 ?auto_1861824 ) ) ( not ( = ?auto_1861827 ?auto_1861828 ) ) ( not ( = ?auto_1861833 ?auto_1861835 ) ) ( HOIST-AT ?auto_1861832 ?auto_1861833 ) ( not ( = ?auto_1861831 ?auto_1861832 ) ) ( SURFACE-AT ?auto_1861828 ?auto_1861833 ) ( ON ?auto_1861828 ?auto_1861834 ) ( CLEAR ?auto_1861828 ) ( not ( = ?auto_1861824 ?auto_1861834 ) ) ( not ( = ?auto_1861828 ?auto_1861834 ) ) ( not ( = ?auto_1861827 ?auto_1861834 ) ) ( SURFACE-AT ?auto_1861827 ?auto_1861835 ) ( CLEAR ?auto_1861827 ) ( IS-CRATE ?auto_1861824 ) ( AVAILABLE ?auto_1861831 ) ( AVAILABLE ?auto_1861832 ) ( SURFACE-AT ?auto_1861824 ?auto_1861833 ) ( ON ?auto_1861824 ?auto_1861829 ) ( CLEAR ?auto_1861824 ) ( not ( = ?auto_1861824 ?auto_1861829 ) ) ( not ( = ?auto_1861828 ?auto_1861829 ) ) ( not ( = ?auto_1861827 ?auto_1861829 ) ) ( not ( = ?auto_1861834 ?auto_1861829 ) ) ( TRUCK-AT ?auto_1861830 ?auto_1861835 ) ( ON ?auto_1861826 ?auto_1861825 ) ( ON ?auto_1861827 ?auto_1861826 ) ( not ( = ?auto_1861825 ?auto_1861826 ) ) ( not ( = ?auto_1861825 ?auto_1861827 ) ) ( not ( = ?auto_1861825 ?auto_1861824 ) ) ( not ( = ?auto_1861825 ?auto_1861828 ) ) ( not ( = ?auto_1861825 ?auto_1861834 ) ) ( not ( = ?auto_1861825 ?auto_1861829 ) ) ( not ( = ?auto_1861826 ?auto_1861827 ) ) ( not ( = ?auto_1861826 ?auto_1861824 ) ) ( not ( = ?auto_1861826 ?auto_1861828 ) ) ( not ( = ?auto_1861826 ?auto_1861834 ) ) ( not ( = ?auto_1861826 ?auto_1861829 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861827 ?auto_1861824 ?auto_1861828 )
      ( MAKE-4CRATE-VERIFY ?auto_1861825 ?auto_1861826 ?auto_1861827 ?auto_1861824 ?auto_1861828 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1861837 - SURFACE
      ?auto_1861838 - SURFACE
      ?auto_1861839 - SURFACE
      ?auto_1861836 - SURFACE
      ?auto_1861840 - SURFACE
      ?auto_1861841 - SURFACE
    )
    :vars
    (
      ?auto_1861844 - HOIST
      ?auto_1861848 - PLACE
      ?auto_1861846 - PLACE
      ?auto_1861845 - HOIST
      ?auto_1861847 - SURFACE
      ?auto_1861842 - SURFACE
      ?auto_1861843 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861844 ?auto_1861848 ) ( IS-CRATE ?auto_1861841 ) ( not ( = ?auto_1861840 ?auto_1861841 ) ) ( not ( = ?auto_1861836 ?auto_1861840 ) ) ( not ( = ?auto_1861836 ?auto_1861841 ) ) ( not ( = ?auto_1861846 ?auto_1861848 ) ) ( HOIST-AT ?auto_1861845 ?auto_1861846 ) ( not ( = ?auto_1861844 ?auto_1861845 ) ) ( SURFACE-AT ?auto_1861841 ?auto_1861846 ) ( ON ?auto_1861841 ?auto_1861847 ) ( CLEAR ?auto_1861841 ) ( not ( = ?auto_1861840 ?auto_1861847 ) ) ( not ( = ?auto_1861841 ?auto_1861847 ) ) ( not ( = ?auto_1861836 ?auto_1861847 ) ) ( SURFACE-AT ?auto_1861836 ?auto_1861848 ) ( CLEAR ?auto_1861836 ) ( IS-CRATE ?auto_1861840 ) ( AVAILABLE ?auto_1861844 ) ( AVAILABLE ?auto_1861845 ) ( SURFACE-AT ?auto_1861840 ?auto_1861846 ) ( ON ?auto_1861840 ?auto_1861842 ) ( CLEAR ?auto_1861840 ) ( not ( = ?auto_1861840 ?auto_1861842 ) ) ( not ( = ?auto_1861841 ?auto_1861842 ) ) ( not ( = ?auto_1861836 ?auto_1861842 ) ) ( not ( = ?auto_1861847 ?auto_1861842 ) ) ( TRUCK-AT ?auto_1861843 ?auto_1861848 ) ( ON ?auto_1861838 ?auto_1861837 ) ( ON ?auto_1861839 ?auto_1861838 ) ( ON ?auto_1861836 ?auto_1861839 ) ( not ( = ?auto_1861837 ?auto_1861838 ) ) ( not ( = ?auto_1861837 ?auto_1861839 ) ) ( not ( = ?auto_1861837 ?auto_1861836 ) ) ( not ( = ?auto_1861837 ?auto_1861840 ) ) ( not ( = ?auto_1861837 ?auto_1861841 ) ) ( not ( = ?auto_1861837 ?auto_1861847 ) ) ( not ( = ?auto_1861837 ?auto_1861842 ) ) ( not ( = ?auto_1861838 ?auto_1861839 ) ) ( not ( = ?auto_1861838 ?auto_1861836 ) ) ( not ( = ?auto_1861838 ?auto_1861840 ) ) ( not ( = ?auto_1861838 ?auto_1861841 ) ) ( not ( = ?auto_1861838 ?auto_1861847 ) ) ( not ( = ?auto_1861838 ?auto_1861842 ) ) ( not ( = ?auto_1861839 ?auto_1861836 ) ) ( not ( = ?auto_1861839 ?auto_1861840 ) ) ( not ( = ?auto_1861839 ?auto_1861841 ) ) ( not ( = ?auto_1861839 ?auto_1861847 ) ) ( not ( = ?auto_1861839 ?auto_1861842 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861836 ?auto_1861840 ?auto_1861841 )
      ( MAKE-5CRATE-VERIFY ?auto_1861837 ?auto_1861838 ?auto_1861839 ?auto_1861836 ?auto_1861840 ?auto_1861841 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1861850 - SURFACE
      ?auto_1861851 - SURFACE
      ?auto_1861852 - SURFACE
      ?auto_1861849 - SURFACE
      ?auto_1861853 - SURFACE
      ?auto_1861855 - SURFACE
      ?auto_1861854 - SURFACE
    )
    :vars
    (
      ?auto_1861858 - HOIST
      ?auto_1861862 - PLACE
      ?auto_1861860 - PLACE
      ?auto_1861859 - HOIST
      ?auto_1861861 - SURFACE
      ?auto_1861856 - SURFACE
      ?auto_1861857 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861858 ?auto_1861862 ) ( IS-CRATE ?auto_1861854 ) ( not ( = ?auto_1861855 ?auto_1861854 ) ) ( not ( = ?auto_1861853 ?auto_1861855 ) ) ( not ( = ?auto_1861853 ?auto_1861854 ) ) ( not ( = ?auto_1861860 ?auto_1861862 ) ) ( HOIST-AT ?auto_1861859 ?auto_1861860 ) ( not ( = ?auto_1861858 ?auto_1861859 ) ) ( SURFACE-AT ?auto_1861854 ?auto_1861860 ) ( ON ?auto_1861854 ?auto_1861861 ) ( CLEAR ?auto_1861854 ) ( not ( = ?auto_1861855 ?auto_1861861 ) ) ( not ( = ?auto_1861854 ?auto_1861861 ) ) ( not ( = ?auto_1861853 ?auto_1861861 ) ) ( SURFACE-AT ?auto_1861853 ?auto_1861862 ) ( CLEAR ?auto_1861853 ) ( IS-CRATE ?auto_1861855 ) ( AVAILABLE ?auto_1861858 ) ( AVAILABLE ?auto_1861859 ) ( SURFACE-AT ?auto_1861855 ?auto_1861860 ) ( ON ?auto_1861855 ?auto_1861856 ) ( CLEAR ?auto_1861855 ) ( not ( = ?auto_1861855 ?auto_1861856 ) ) ( not ( = ?auto_1861854 ?auto_1861856 ) ) ( not ( = ?auto_1861853 ?auto_1861856 ) ) ( not ( = ?auto_1861861 ?auto_1861856 ) ) ( TRUCK-AT ?auto_1861857 ?auto_1861862 ) ( ON ?auto_1861851 ?auto_1861850 ) ( ON ?auto_1861852 ?auto_1861851 ) ( ON ?auto_1861849 ?auto_1861852 ) ( ON ?auto_1861853 ?auto_1861849 ) ( not ( = ?auto_1861850 ?auto_1861851 ) ) ( not ( = ?auto_1861850 ?auto_1861852 ) ) ( not ( = ?auto_1861850 ?auto_1861849 ) ) ( not ( = ?auto_1861850 ?auto_1861853 ) ) ( not ( = ?auto_1861850 ?auto_1861855 ) ) ( not ( = ?auto_1861850 ?auto_1861854 ) ) ( not ( = ?auto_1861850 ?auto_1861861 ) ) ( not ( = ?auto_1861850 ?auto_1861856 ) ) ( not ( = ?auto_1861851 ?auto_1861852 ) ) ( not ( = ?auto_1861851 ?auto_1861849 ) ) ( not ( = ?auto_1861851 ?auto_1861853 ) ) ( not ( = ?auto_1861851 ?auto_1861855 ) ) ( not ( = ?auto_1861851 ?auto_1861854 ) ) ( not ( = ?auto_1861851 ?auto_1861861 ) ) ( not ( = ?auto_1861851 ?auto_1861856 ) ) ( not ( = ?auto_1861852 ?auto_1861849 ) ) ( not ( = ?auto_1861852 ?auto_1861853 ) ) ( not ( = ?auto_1861852 ?auto_1861855 ) ) ( not ( = ?auto_1861852 ?auto_1861854 ) ) ( not ( = ?auto_1861852 ?auto_1861861 ) ) ( not ( = ?auto_1861852 ?auto_1861856 ) ) ( not ( = ?auto_1861849 ?auto_1861853 ) ) ( not ( = ?auto_1861849 ?auto_1861855 ) ) ( not ( = ?auto_1861849 ?auto_1861854 ) ) ( not ( = ?auto_1861849 ?auto_1861861 ) ) ( not ( = ?auto_1861849 ?auto_1861856 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861853 ?auto_1861855 ?auto_1861854 )
      ( MAKE-6CRATE-VERIFY ?auto_1861850 ?auto_1861851 ?auto_1861852 ?auto_1861849 ?auto_1861853 ?auto_1861855 ?auto_1861854 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1861864 - SURFACE
      ?auto_1861865 - SURFACE
      ?auto_1861866 - SURFACE
      ?auto_1861863 - SURFACE
      ?auto_1861867 - SURFACE
      ?auto_1861869 - SURFACE
      ?auto_1861868 - SURFACE
      ?auto_1861870 - SURFACE
    )
    :vars
    (
      ?auto_1861873 - HOIST
      ?auto_1861877 - PLACE
      ?auto_1861875 - PLACE
      ?auto_1861874 - HOIST
      ?auto_1861876 - SURFACE
      ?auto_1861871 - SURFACE
      ?auto_1861872 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861873 ?auto_1861877 ) ( IS-CRATE ?auto_1861870 ) ( not ( = ?auto_1861868 ?auto_1861870 ) ) ( not ( = ?auto_1861869 ?auto_1861868 ) ) ( not ( = ?auto_1861869 ?auto_1861870 ) ) ( not ( = ?auto_1861875 ?auto_1861877 ) ) ( HOIST-AT ?auto_1861874 ?auto_1861875 ) ( not ( = ?auto_1861873 ?auto_1861874 ) ) ( SURFACE-AT ?auto_1861870 ?auto_1861875 ) ( ON ?auto_1861870 ?auto_1861876 ) ( CLEAR ?auto_1861870 ) ( not ( = ?auto_1861868 ?auto_1861876 ) ) ( not ( = ?auto_1861870 ?auto_1861876 ) ) ( not ( = ?auto_1861869 ?auto_1861876 ) ) ( SURFACE-AT ?auto_1861869 ?auto_1861877 ) ( CLEAR ?auto_1861869 ) ( IS-CRATE ?auto_1861868 ) ( AVAILABLE ?auto_1861873 ) ( AVAILABLE ?auto_1861874 ) ( SURFACE-AT ?auto_1861868 ?auto_1861875 ) ( ON ?auto_1861868 ?auto_1861871 ) ( CLEAR ?auto_1861868 ) ( not ( = ?auto_1861868 ?auto_1861871 ) ) ( not ( = ?auto_1861870 ?auto_1861871 ) ) ( not ( = ?auto_1861869 ?auto_1861871 ) ) ( not ( = ?auto_1861876 ?auto_1861871 ) ) ( TRUCK-AT ?auto_1861872 ?auto_1861877 ) ( ON ?auto_1861865 ?auto_1861864 ) ( ON ?auto_1861866 ?auto_1861865 ) ( ON ?auto_1861863 ?auto_1861866 ) ( ON ?auto_1861867 ?auto_1861863 ) ( ON ?auto_1861869 ?auto_1861867 ) ( not ( = ?auto_1861864 ?auto_1861865 ) ) ( not ( = ?auto_1861864 ?auto_1861866 ) ) ( not ( = ?auto_1861864 ?auto_1861863 ) ) ( not ( = ?auto_1861864 ?auto_1861867 ) ) ( not ( = ?auto_1861864 ?auto_1861869 ) ) ( not ( = ?auto_1861864 ?auto_1861868 ) ) ( not ( = ?auto_1861864 ?auto_1861870 ) ) ( not ( = ?auto_1861864 ?auto_1861876 ) ) ( not ( = ?auto_1861864 ?auto_1861871 ) ) ( not ( = ?auto_1861865 ?auto_1861866 ) ) ( not ( = ?auto_1861865 ?auto_1861863 ) ) ( not ( = ?auto_1861865 ?auto_1861867 ) ) ( not ( = ?auto_1861865 ?auto_1861869 ) ) ( not ( = ?auto_1861865 ?auto_1861868 ) ) ( not ( = ?auto_1861865 ?auto_1861870 ) ) ( not ( = ?auto_1861865 ?auto_1861876 ) ) ( not ( = ?auto_1861865 ?auto_1861871 ) ) ( not ( = ?auto_1861866 ?auto_1861863 ) ) ( not ( = ?auto_1861866 ?auto_1861867 ) ) ( not ( = ?auto_1861866 ?auto_1861869 ) ) ( not ( = ?auto_1861866 ?auto_1861868 ) ) ( not ( = ?auto_1861866 ?auto_1861870 ) ) ( not ( = ?auto_1861866 ?auto_1861876 ) ) ( not ( = ?auto_1861866 ?auto_1861871 ) ) ( not ( = ?auto_1861863 ?auto_1861867 ) ) ( not ( = ?auto_1861863 ?auto_1861869 ) ) ( not ( = ?auto_1861863 ?auto_1861868 ) ) ( not ( = ?auto_1861863 ?auto_1861870 ) ) ( not ( = ?auto_1861863 ?auto_1861876 ) ) ( not ( = ?auto_1861863 ?auto_1861871 ) ) ( not ( = ?auto_1861867 ?auto_1861869 ) ) ( not ( = ?auto_1861867 ?auto_1861868 ) ) ( not ( = ?auto_1861867 ?auto_1861870 ) ) ( not ( = ?auto_1861867 ?auto_1861876 ) ) ( not ( = ?auto_1861867 ?auto_1861871 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861869 ?auto_1861868 ?auto_1861870 )
      ( MAKE-7CRATE-VERIFY ?auto_1861864 ?auto_1861865 ?auto_1861866 ?auto_1861863 ?auto_1861867 ?auto_1861869 ?auto_1861868 ?auto_1861870 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1861879 - SURFACE
      ?auto_1861880 - SURFACE
      ?auto_1861881 - SURFACE
      ?auto_1861878 - SURFACE
      ?auto_1861882 - SURFACE
      ?auto_1861884 - SURFACE
      ?auto_1861883 - SURFACE
      ?auto_1861885 - SURFACE
      ?auto_1861886 - SURFACE
    )
    :vars
    (
      ?auto_1861889 - HOIST
      ?auto_1861893 - PLACE
      ?auto_1861891 - PLACE
      ?auto_1861890 - HOIST
      ?auto_1861892 - SURFACE
      ?auto_1861887 - SURFACE
      ?auto_1861888 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861889 ?auto_1861893 ) ( IS-CRATE ?auto_1861886 ) ( not ( = ?auto_1861885 ?auto_1861886 ) ) ( not ( = ?auto_1861883 ?auto_1861885 ) ) ( not ( = ?auto_1861883 ?auto_1861886 ) ) ( not ( = ?auto_1861891 ?auto_1861893 ) ) ( HOIST-AT ?auto_1861890 ?auto_1861891 ) ( not ( = ?auto_1861889 ?auto_1861890 ) ) ( SURFACE-AT ?auto_1861886 ?auto_1861891 ) ( ON ?auto_1861886 ?auto_1861892 ) ( CLEAR ?auto_1861886 ) ( not ( = ?auto_1861885 ?auto_1861892 ) ) ( not ( = ?auto_1861886 ?auto_1861892 ) ) ( not ( = ?auto_1861883 ?auto_1861892 ) ) ( SURFACE-AT ?auto_1861883 ?auto_1861893 ) ( CLEAR ?auto_1861883 ) ( IS-CRATE ?auto_1861885 ) ( AVAILABLE ?auto_1861889 ) ( AVAILABLE ?auto_1861890 ) ( SURFACE-AT ?auto_1861885 ?auto_1861891 ) ( ON ?auto_1861885 ?auto_1861887 ) ( CLEAR ?auto_1861885 ) ( not ( = ?auto_1861885 ?auto_1861887 ) ) ( not ( = ?auto_1861886 ?auto_1861887 ) ) ( not ( = ?auto_1861883 ?auto_1861887 ) ) ( not ( = ?auto_1861892 ?auto_1861887 ) ) ( TRUCK-AT ?auto_1861888 ?auto_1861893 ) ( ON ?auto_1861880 ?auto_1861879 ) ( ON ?auto_1861881 ?auto_1861880 ) ( ON ?auto_1861878 ?auto_1861881 ) ( ON ?auto_1861882 ?auto_1861878 ) ( ON ?auto_1861884 ?auto_1861882 ) ( ON ?auto_1861883 ?auto_1861884 ) ( not ( = ?auto_1861879 ?auto_1861880 ) ) ( not ( = ?auto_1861879 ?auto_1861881 ) ) ( not ( = ?auto_1861879 ?auto_1861878 ) ) ( not ( = ?auto_1861879 ?auto_1861882 ) ) ( not ( = ?auto_1861879 ?auto_1861884 ) ) ( not ( = ?auto_1861879 ?auto_1861883 ) ) ( not ( = ?auto_1861879 ?auto_1861885 ) ) ( not ( = ?auto_1861879 ?auto_1861886 ) ) ( not ( = ?auto_1861879 ?auto_1861892 ) ) ( not ( = ?auto_1861879 ?auto_1861887 ) ) ( not ( = ?auto_1861880 ?auto_1861881 ) ) ( not ( = ?auto_1861880 ?auto_1861878 ) ) ( not ( = ?auto_1861880 ?auto_1861882 ) ) ( not ( = ?auto_1861880 ?auto_1861884 ) ) ( not ( = ?auto_1861880 ?auto_1861883 ) ) ( not ( = ?auto_1861880 ?auto_1861885 ) ) ( not ( = ?auto_1861880 ?auto_1861886 ) ) ( not ( = ?auto_1861880 ?auto_1861892 ) ) ( not ( = ?auto_1861880 ?auto_1861887 ) ) ( not ( = ?auto_1861881 ?auto_1861878 ) ) ( not ( = ?auto_1861881 ?auto_1861882 ) ) ( not ( = ?auto_1861881 ?auto_1861884 ) ) ( not ( = ?auto_1861881 ?auto_1861883 ) ) ( not ( = ?auto_1861881 ?auto_1861885 ) ) ( not ( = ?auto_1861881 ?auto_1861886 ) ) ( not ( = ?auto_1861881 ?auto_1861892 ) ) ( not ( = ?auto_1861881 ?auto_1861887 ) ) ( not ( = ?auto_1861878 ?auto_1861882 ) ) ( not ( = ?auto_1861878 ?auto_1861884 ) ) ( not ( = ?auto_1861878 ?auto_1861883 ) ) ( not ( = ?auto_1861878 ?auto_1861885 ) ) ( not ( = ?auto_1861878 ?auto_1861886 ) ) ( not ( = ?auto_1861878 ?auto_1861892 ) ) ( not ( = ?auto_1861878 ?auto_1861887 ) ) ( not ( = ?auto_1861882 ?auto_1861884 ) ) ( not ( = ?auto_1861882 ?auto_1861883 ) ) ( not ( = ?auto_1861882 ?auto_1861885 ) ) ( not ( = ?auto_1861882 ?auto_1861886 ) ) ( not ( = ?auto_1861882 ?auto_1861892 ) ) ( not ( = ?auto_1861882 ?auto_1861887 ) ) ( not ( = ?auto_1861884 ?auto_1861883 ) ) ( not ( = ?auto_1861884 ?auto_1861885 ) ) ( not ( = ?auto_1861884 ?auto_1861886 ) ) ( not ( = ?auto_1861884 ?auto_1861892 ) ) ( not ( = ?auto_1861884 ?auto_1861887 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861883 ?auto_1861885 ?auto_1861886 )
      ( MAKE-8CRATE-VERIFY ?auto_1861879 ?auto_1861880 ?auto_1861881 ?auto_1861878 ?auto_1861882 ?auto_1861884 ?auto_1861883 ?auto_1861885 ?auto_1861886 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1861895 - SURFACE
      ?auto_1861896 - SURFACE
      ?auto_1861897 - SURFACE
      ?auto_1861894 - SURFACE
      ?auto_1861898 - SURFACE
      ?auto_1861900 - SURFACE
      ?auto_1861899 - SURFACE
      ?auto_1861901 - SURFACE
      ?auto_1861902 - SURFACE
      ?auto_1861903 - SURFACE
    )
    :vars
    (
      ?auto_1861906 - HOIST
      ?auto_1861910 - PLACE
      ?auto_1861908 - PLACE
      ?auto_1861907 - HOIST
      ?auto_1861909 - SURFACE
      ?auto_1861904 - SURFACE
      ?auto_1861905 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861906 ?auto_1861910 ) ( IS-CRATE ?auto_1861903 ) ( not ( = ?auto_1861902 ?auto_1861903 ) ) ( not ( = ?auto_1861901 ?auto_1861902 ) ) ( not ( = ?auto_1861901 ?auto_1861903 ) ) ( not ( = ?auto_1861908 ?auto_1861910 ) ) ( HOIST-AT ?auto_1861907 ?auto_1861908 ) ( not ( = ?auto_1861906 ?auto_1861907 ) ) ( SURFACE-AT ?auto_1861903 ?auto_1861908 ) ( ON ?auto_1861903 ?auto_1861909 ) ( CLEAR ?auto_1861903 ) ( not ( = ?auto_1861902 ?auto_1861909 ) ) ( not ( = ?auto_1861903 ?auto_1861909 ) ) ( not ( = ?auto_1861901 ?auto_1861909 ) ) ( SURFACE-AT ?auto_1861901 ?auto_1861910 ) ( CLEAR ?auto_1861901 ) ( IS-CRATE ?auto_1861902 ) ( AVAILABLE ?auto_1861906 ) ( AVAILABLE ?auto_1861907 ) ( SURFACE-AT ?auto_1861902 ?auto_1861908 ) ( ON ?auto_1861902 ?auto_1861904 ) ( CLEAR ?auto_1861902 ) ( not ( = ?auto_1861902 ?auto_1861904 ) ) ( not ( = ?auto_1861903 ?auto_1861904 ) ) ( not ( = ?auto_1861901 ?auto_1861904 ) ) ( not ( = ?auto_1861909 ?auto_1861904 ) ) ( TRUCK-AT ?auto_1861905 ?auto_1861910 ) ( ON ?auto_1861896 ?auto_1861895 ) ( ON ?auto_1861897 ?auto_1861896 ) ( ON ?auto_1861894 ?auto_1861897 ) ( ON ?auto_1861898 ?auto_1861894 ) ( ON ?auto_1861900 ?auto_1861898 ) ( ON ?auto_1861899 ?auto_1861900 ) ( ON ?auto_1861901 ?auto_1861899 ) ( not ( = ?auto_1861895 ?auto_1861896 ) ) ( not ( = ?auto_1861895 ?auto_1861897 ) ) ( not ( = ?auto_1861895 ?auto_1861894 ) ) ( not ( = ?auto_1861895 ?auto_1861898 ) ) ( not ( = ?auto_1861895 ?auto_1861900 ) ) ( not ( = ?auto_1861895 ?auto_1861899 ) ) ( not ( = ?auto_1861895 ?auto_1861901 ) ) ( not ( = ?auto_1861895 ?auto_1861902 ) ) ( not ( = ?auto_1861895 ?auto_1861903 ) ) ( not ( = ?auto_1861895 ?auto_1861909 ) ) ( not ( = ?auto_1861895 ?auto_1861904 ) ) ( not ( = ?auto_1861896 ?auto_1861897 ) ) ( not ( = ?auto_1861896 ?auto_1861894 ) ) ( not ( = ?auto_1861896 ?auto_1861898 ) ) ( not ( = ?auto_1861896 ?auto_1861900 ) ) ( not ( = ?auto_1861896 ?auto_1861899 ) ) ( not ( = ?auto_1861896 ?auto_1861901 ) ) ( not ( = ?auto_1861896 ?auto_1861902 ) ) ( not ( = ?auto_1861896 ?auto_1861903 ) ) ( not ( = ?auto_1861896 ?auto_1861909 ) ) ( not ( = ?auto_1861896 ?auto_1861904 ) ) ( not ( = ?auto_1861897 ?auto_1861894 ) ) ( not ( = ?auto_1861897 ?auto_1861898 ) ) ( not ( = ?auto_1861897 ?auto_1861900 ) ) ( not ( = ?auto_1861897 ?auto_1861899 ) ) ( not ( = ?auto_1861897 ?auto_1861901 ) ) ( not ( = ?auto_1861897 ?auto_1861902 ) ) ( not ( = ?auto_1861897 ?auto_1861903 ) ) ( not ( = ?auto_1861897 ?auto_1861909 ) ) ( not ( = ?auto_1861897 ?auto_1861904 ) ) ( not ( = ?auto_1861894 ?auto_1861898 ) ) ( not ( = ?auto_1861894 ?auto_1861900 ) ) ( not ( = ?auto_1861894 ?auto_1861899 ) ) ( not ( = ?auto_1861894 ?auto_1861901 ) ) ( not ( = ?auto_1861894 ?auto_1861902 ) ) ( not ( = ?auto_1861894 ?auto_1861903 ) ) ( not ( = ?auto_1861894 ?auto_1861909 ) ) ( not ( = ?auto_1861894 ?auto_1861904 ) ) ( not ( = ?auto_1861898 ?auto_1861900 ) ) ( not ( = ?auto_1861898 ?auto_1861899 ) ) ( not ( = ?auto_1861898 ?auto_1861901 ) ) ( not ( = ?auto_1861898 ?auto_1861902 ) ) ( not ( = ?auto_1861898 ?auto_1861903 ) ) ( not ( = ?auto_1861898 ?auto_1861909 ) ) ( not ( = ?auto_1861898 ?auto_1861904 ) ) ( not ( = ?auto_1861900 ?auto_1861899 ) ) ( not ( = ?auto_1861900 ?auto_1861901 ) ) ( not ( = ?auto_1861900 ?auto_1861902 ) ) ( not ( = ?auto_1861900 ?auto_1861903 ) ) ( not ( = ?auto_1861900 ?auto_1861909 ) ) ( not ( = ?auto_1861900 ?auto_1861904 ) ) ( not ( = ?auto_1861899 ?auto_1861901 ) ) ( not ( = ?auto_1861899 ?auto_1861902 ) ) ( not ( = ?auto_1861899 ?auto_1861903 ) ) ( not ( = ?auto_1861899 ?auto_1861909 ) ) ( not ( = ?auto_1861899 ?auto_1861904 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861901 ?auto_1861902 ?auto_1861903 )
      ( MAKE-9CRATE-VERIFY ?auto_1861895 ?auto_1861896 ?auto_1861897 ?auto_1861894 ?auto_1861898 ?auto_1861900 ?auto_1861899 ?auto_1861901 ?auto_1861902 ?auto_1861903 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1861912 - SURFACE
      ?auto_1861913 - SURFACE
      ?auto_1861914 - SURFACE
      ?auto_1861911 - SURFACE
      ?auto_1861915 - SURFACE
      ?auto_1861917 - SURFACE
      ?auto_1861916 - SURFACE
      ?auto_1861918 - SURFACE
      ?auto_1861919 - SURFACE
      ?auto_1861920 - SURFACE
      ?auto_1861921 - SURFACE
    )
    :vars
    (
      ?auto_1861924 - HOIST
      ?auto_1861928 - PLACE
      ?auto_1861926 - PLACE
      ?auto_1861925 - HOIST
      ?auto_1861927 - SURFACE
      ?auto_1861922 - SURFACE
      ?auto_1861923 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861924 ?auto_1861928 ) ( IS-CRATE ?auto_1861921 ) ( not ( = ?auto_1861920 ?auto_1861921 ) ) ( not ( = ?auto_1861919 ?auto_1861920 ) ) ( not ( = ?auto_1861919 ?auto_1861921 ) ) ( not ( = ?auto_1861926 ?auto_1861928 ) ) ( HOIST-AT ?auto_1861925 ?auto_1861926 ) ( not ( = ?auto_1861924 ?auto_1861925 ) ) ( SURFACE-AT ?auto_1861921 ?auto_1861926 ) ( ON ?auto_1861921 ?auto_1861927 ) ( CLEAR ?auto_1861921 ) ( not ( = ?auto_1861920 ?auto_1861927 ) ) ( not ( = ?auto_1861921 ?auto_1861927 ) ) ( not ( = ?auto_1861919 ?auto_1861927 ) ) ( SURFACE-AT ?auto_1861919 ?auto_1861928 ) ( CLEAR ?auto_1861919 ) ( IS-CRATE ?auto_1861920 ) ( AVAILABLE ?auto_1861924 ) ( AVAILABLE ?auto_1861925 ) ( SURFACE-AT ?auto_1861920 ?auto_1861926 ) ( ON ?auto_1861920 ?auto_1861922 ) ( CLEAR ?auto_1861920 ) ( not ( = ?auto_1861920 ?auto_1861922 ) ) ( not ( = ?auto_1861921 ?auto_1861922 ) ) ( not ( = ?auto_1861919 ?auto_1861922 ) ) ( not ( = ?auto_1861927 ?auto_1861922 ) ) ( TRUCK-AT ?auto_1861923 ?auto_1861928 ) ( ON ?auto_1861913 ?auto_1861912 ) ( ON ?auto_1861914 ?auto_1861913 ) ( ON ?auto_1861911 ?auto_1861914 ) ( ON ?auto_1861915 ?auto_1861911 ) ( ON ?auto_1861917 ?auto_1861915 ) ( ON ?auto_1861916 ?auto_1861917 ) ( ON ?auto_1861918 ?auto_1861916 ) ( ON ?auto_1861919 ?auto_1861918 ) ( not ( = ?auto_1861912 ?auto_1861913 ) ) ( not ( = ?auto_1861912 ?auto_1861914 ) ) ( not ( = ?auto_1861912 ?auto_1861911 ) ) ( not ( = ?auto_1861912 ?auto_1861915 ) ) ( not ( = ?auto_1861912 ?auto_1861917 ) ) ( not ( = ?auto_1861912 ?auto_1861916 ) ) ( not ( = ?auto_1861912 ?auto_1861918 ) ) ( not ( = ?auto_1861912 ?auto_1861919 ) ) ( not ( = ?auto_1861912 ?auto_1861920 ) ) ( not ( = ?auto_1861912 ?auto_1861921 ) ) ( not ( = ?auto_1861912 ?auto_1861927 ) ) ( not ( = ?auto_1861912 ?auto_1861922 ) ) ( not ( = ?auto_1861913 ?auto_1861914 ) ) ( not ( = ?auto_1861913 ?auto_1861911 ) ) ( not ( = ?auto_1861913 ?auto_1861915 ) ) ( not ( = ?auto_1861913 ?auto_1861917 ) ) ( not ( = ?auto_1861913 ?auto_1861916 ) ) ( not ( = ?auto_1861913 ?auto_1861918 ) ) ( not ( = ?auto_1861913 ?auto_1861919 ) ) ( not ( = ?auto_1861913 ?auto_1861920 ) ) ( not ( = ?auto_1861913 ?auto_1861921 ) ) ( not ( = ?auto_1861913 ?auto_1861927 ) ) ( not ( = ?auto_1861913 ?auto_1861922 ) ) ( not ( = ?auto_1861914 ?auto_1861911 ) ) ( not ( = ?auto_1861914 ?auto_1861915 ) ) ( not ( = ?auto_1861914 ?auto_1861917 ) ) ( not ( = ?auto_1861914 ?auto_1861916 ) ) ( not ( = ?auto_1861914 ?auto_1861918 ) ) ( not ( = ?auto_1861914 ?auto_1861919 ) ) ( not ( = ?auto_1861914 ?auto_1861920 ) ) ( not ( = ?auto_1861914 ?auto_1861921 ) ) ( not ( = ?auto_1861914 ?auto_1861927 ) ) ( not ( = ?auto_1861914 ?auto_1861922 ) ) ( not ( = ?auto_1861911 ?auto_1861915 ) ) ( not ( = ?auto_1861911 ?auto_1861917 ) ) ( not ( = ?auto_1861911 ?auto_1861916 ) ) ( not ( = ?auto_1861911 ?auto_1861918 ) ) ( not ( = ?auto_1861911 ?auto_1861919 ) ) ( not ( = ?auto_1861911 ?auto_1861920 ) ) ( not ( = ?auto_1861911 ?auto_1861921 ) ) ( not ( = ?auto_1861911 ?auto_1861927 ) ) ( not ( = ?auto_1861911 ?auto_1861922 ) ) ( not ( = ?auto_1861915 ?auto_1861917 ) ) ( not ( = ?auto_1861915 ?auto_1861916 ) ) ( not ( = ?auto_1861915 ?auto_1861918 ) ) ( not ( = ?auto_1861915 ?auto_1861919 ) ) ( not ( = ?auto_1861915 ?auto_1861920 ) ) ( not ( = ?auto_1861915 ?auto_1861921 ) ) ( not ( = ?auto_1861915 ?auto_1861927 ) ) ( not ( = ?auto_1861915 ?auto_1861922 ) ) ( not ( = ?auto_1861917 ?auto_1861916 ) ) ( not ( = ?auto_1861917 ?auto_1861918 ) ) ( not ( = ?auto_1861917 ?auto_1861919 ) ) ( not ( = ?auto_1861917 ?auto_1861920 ) ) ( not ( = ?auto_1861917 ?auto_1861921 ) ) ( not ( = ?auto_1861917 ?auto_1861927 ) ) ( not ( = ?auto_1861917 ?auto_1861922 ) ) ( not ( = ?auto_1861916 ?auto_1861918 ) ) ( not ( = ?auto_1861916 ?auto_1861919 ) ) ( not ( = ?auto_1861916 ?auto_1861920 ) ) ( not ( = ?auto_1861916 ?auto_1861921 ) ) ( not ( = ?auto_1861916 ?auto_1861927 ) ) ( not ( = ?auto_1861916 ?auto_1861922 ) ) ( not ( = ?auto_1861918 ?auto_1861919 ) ) ( not ( = ?auto_1861918 ?auto_1861920 ) ) ( not ( = ?auto_1861918 ?auto_1861921 ) ) ( not ( = ?auto_1861918 ?auto_1861927 ) ) ( not ( = ?auto_1861918 ?auto_1861922 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861919 ?auto_1861920 ?auto_1861921 )
      ( MAKE-10CRATE-VERIFY ?auto_1861912 ?auto_1861913 ?auto_1861914 ?auto_1861911 ?auto_1861915 ?auto_1861917 ?auto_1861916 ?auto_1861918 ?auto_1861919 ?auto_1861920 ?auto_1861921 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1861930 - SURFACE
      ?auto_1861931 - SURFACE
      ?auto_1861932 - SURFACE
      ?auto_1861929 - SURFACE
      ?auto_1861933 - SURFACE
      ?auto_1861935 - SURFACE
      ?auto_1861934 - SURFACE
      ?auto_1861936 - SURFACE
      ?auto_1861937 - SURFACE
      ?auto_1861938 - SURFACE
      ?auto_1861939 - SURFACE
      ?auto_1861940 - SURFACE
    )
    :vars
    (
      ?auto_1861943 - HOIST
      ?auto_1861947 - PLACE
      ?auto_1861945 - PLACE
      ?auto_1861944 - HOIST
      ?auto_1861946 - SURFACE
      ?auto_1861941 - SURFACE
      ?auto_1861942 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861943 ?auto_1861947 ) ( IS-CRATE ?auto_1861940 ) ( not ( = ?auto_1861939 ?auto_1861940 ) ) ( not ( = ?auto_1861938 ?auto_1861939 ) ) ( not ( = ?auto_1861938 ?auto_1861940 ) ) ( not ( = ?auto_1861945 ?auto_1861947 ) ) ( HOIST-AT ?auto_1861944 ?auto_1861945 ) ( not ( = ?auto_1861943 ?auto_1861944 ) ) ( SURFACE-AT ?auto_1861940 ?auto_1861945 ) ( ON ?auto_1861940 ?auto_1861946 ) ( CLEAR ?auto_1861940 ) ( not ( = ?auto_1861939 ?auto_1861946 ) ) ( not ( = ?auto_1861940 ?auto_1861946 ) ) ( not ( = ?auto_1861938 ?auto_1861946 ) ) ( SURFACE-AT ?auto_1861938 ?auto_1861947 ) ( CLEAR ?auto_1861938 ) ( IS-CRATE ?auto_1861939 ) ( AVAILABLE ?auto_1861943 ) ( AVAILABLE ?auto_1861944 ) ( SURFACE-AT ?auto_1861939 ?auto_1861945 ) ( ON ?auto_1861939 ?auto_1861941 ) ( CLEAR ?auto_1861939 ) ( not ( = ?auto_1861939 ?auto_1861941 ) ) ( not ( = ?auto_1861940 ?auto_1861941 ) ) ( not ( = ?auto_1861938 ?auto_1861941 ) ) ( not ( = ?auto_1861946 ?auto_1861941 ) ) ( TRUCK-AT ?auto_1861942 ?auto_1861947 ) ( ON ?auto_1861931 ?auto_1861930 ) ( ON ?auto_1861932 ?auto_1861931 ) ( ON ?auto_1861929 ?auto_1861932 ) ( ON ?auto_1861933 ?auto_1861929 ) ( ON ?auto_1861935 ?auto_1861933 ) ( ON ?auto_1861934 ?auto_1861935 ) ( ON ?auto_1861936 ?auto_1861934 ) ( ON ?auto_1861937 ?auto_1861936 ) ( ON ?auto_1861938 ?auto_1861937 ) ( not ( = ?auto_1861930 ?auto_1861931 ) ) ( not ( = ?auto_1861930 ?auto_1861932 ) ) ( not ( = ?auto_1861930 ?auto_1861929 ) ) ( not ( = ?auto_1861930 ?auto_1861933 ) ) ( not ( = ?auto_1861930 ?auto_1861935 ) ) ( not ( = ?auto_1861930 ?auto_1861934 ) ) ( not ( = ?auto_1861930 ?auto_1861936 ) ) ( not ( = ?auto_1861930 ?auto_1861937 ) ) ( not ( = ?auto_1861930 ?auto_1861938 ) ) ( not ( = ?auto_1861930 ?auto_1861939 ) ) ( not ( = ?auto_1861930 ?auto_1861940 ) ) ( not ( = ?auto_1861930 ?auto_1861946 ) ) ( not ( = ?auto_1861930 ?auto_1861941 ) ) ( not ( = ?auto_1861931 ?auto_1861932 ) ) ( not ( = ?auto_1861931 ?auto_1861929 ) ) ( not ( = ?auto_1861931 ?auto_1861933 ) ) ( not ( = ?auto_1861931 ?auto_1861935 ) ) ( not ( = ?auto_1861931 ?auto_1861934 ) ) ( not ( = ?auto_1861931 ?auto_1861936 ) ) ( not ( = ?auto_1861931 ?auto_1861937 ) ) ( not ( = ?auto_1861931 ?auto_1861938 ) ) ( not ( = ?auto_1861931 ?auto_1861939 ) ) ( not ( = ?auto_1861931 ?auto_1861940 ) ) ( not ( = ?auto_1861931 ?auto_1861946 ) ) ( not ( = ?auto_1861931 ?auto_1861941 ) ) ( not ( = ?auto_1861932 ?auto_1861929 ) ) ( not ( = ?auto_1861932 ?auto_1861933 ) ) ( not ( = ?auto_1861932 ?auto_1861935 ) ) ( not ( = ?auto_1861932 ?auto_1861934 ) ) ( not ( = ?auto_1861932 ?auto_1861936 ) ) ( not ( = ?auto_1861932 ?auto_1861937 ) ) ( not ( = ?auto_1861932 ?auto_1861938 ) ) ( not ( = ?auto_1861932 ?auto_1861939 ) ) ( not ( = ?auto_1861932 ?auto_1861940 ) ) ( not ( = ?auto_1861932 ?auto_1861946 ) ) ( not ( = ?auto_1861932 ?auto_1861941 ) ) ( not ( = ?auto_1861929 ?auto_1861933 ) ) ( not ( = ?auto_1861929 ?auto_1861935 ) ) ( not ( = ?auto_1861929 ?auto_1861934 ) ) ( not ( = ?auto_1861929 ?auto_1861936 ) ) ( not ( = ?auto_1861929 ?auto_1861937 ) ) ( not ( = ?auto_1861929 ?auto_1861938 ) ) ( not ( = ?auto_1861929 ?auto_1861939 ) ) ( not ( = ?auto_1861929 ?auto_1861940 ) ) ( not ( = ?auto_1861929 ?auto_1861946 ) ) ( not ( = ?auto_1861929 ?auto_1861941 ) ) ( not ( = ?auto_1861933 ?auto_1861935 ) ) ( not ( = ?auto_1861933 ?auto_1861934 ) ) ( not ( = ?auto_1861933 ?auto_1861936 ) ) ( not ( = ?auto_1861933 ?auto_1861937 ) ) ( not ( = ?auto_1861933 ?auto_1861938 ) ) ( not ( = ?auto_1861933 ?auto_1861939 ) ) ( not ( = ?auto_1861933 ?auto_1861940 ) ) ( not ( = ?auto_1861933 ?auto_1861946 ) ) ( not ( = ?auto_1861933 ?auto_1861941 ) ) ( not ( = ?auto_1861935 ?auto_1861934 ) ) ( not ( = ?auto_1861935 ?auto_1861936 ) ) ( not ( = ?auto_1861935 ?auto_1861937 ) ) ( not ( = ?auto_1861935 ?auto_1861938 ) ) ( not ( = ?auto_1861935 ?auto_1861939 ) ) ( not ( = ?auto_1861935 ?auto_1861940 ) ) ( not ( = ?auto_1861935 ?auto_1861946 ) ) ( not ( = ?auto_1861935 ?auto_1861941 ) ) ( not ( = ?auto_1861934 ?auto_1861936 ) ) ( not ( = ?auto_1861934 ?auto_1861937 ) ) ( not ( = ?auto_1861934 ?auto_1861938 ) ) ( not ( = ?auto_1861934 ?auto_1861939 ) ) ( not ( = ?auto_1861934 ?auto_1861940 ) ) ( not ( = ?auto_1861934 ?auto_1861946 ) ) ( not ( = ?auto_1861934 ?auto_1861941 ) ) ( not ( = ?auto_1861936 ?auto_1861937 ) ) ( not ( = ?auto_1861936 ?auto_1861938 ) ) ( not ( = ?auto_1861936 ?auto_1861939 ) ) ( not ( = ?auto_1861936 ?auto_1861940 ) ) ( not ( = ?auto_1861936 ?auto_1861946 ) ) ( not ( = ?auto_1861936 ?auto_1861941 ) ) ( not ( = ?auto_1861937 ?auto_1861938 ) ) ( not ( = ?auto_1861937 ?auto_1861939 ) ) ( not ( = ?auto_1861937 ?auto_1861940 ) ) ( not ( = ?auto_1861937 ?auto_1861946 ) ) ( not ( = ?auto_1861937 ?auto_1861941 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861938 ?auto_1861939 ?auto_1861940 )
      ( MAKE-11CRATE-VERIFY ?auto_1861930 ?auto_1861931 ?auto_1861932 ?auto_1861929 ?auto_1861933 ?auto_1861935 ?auto_1861934 ?auto_1861936 ?auto_1861937 ?auto_1861938 ?auto_1861939 ?auto_1861940 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1861949 - SURFACE
      ?auto_1861950 - SURFACE
      ?auto_1861951 - SURFACE
      ?auto_1861948 - SURFACE
      ?auto_1861952 - SURFACE
      ?auto_1861954 - SURFACE
      ?auto_1861953 - SURFACE
      ?auto_1861955 - SURFACE
      ?auto_1861956 - SURFACE
      ?auto_1861957 - SURFACE
      ?auto_1861958 - SURFACE
      ?auto_1861959 - SURFACE
      ?auto_1861960 - SURFACE
    )
    :vars
    (
      ?auto_1861963 - HOIST
      ?auto_1861967 - PLACE
      ?auto_1861965 - PLACE
      ?auto_1861964 - HOIST
      ?auto_1861966 - SURFACE
      ?auto_1861961 - SURFACE
      ?auto_1861962 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861963 ?auto_1861967 ) ( IS-CRATE ?auto_1861960 ) ( not ( = ?auto_1861959 ?auto_1861960 ) ) ( not ( = ?auto_1861958 ?auto_1861959 ) ) ( not ( = ?auto_1861958 ?auto_1861960 ) ) ( not ( = ?auto_1861965 ?auto_1861967 ) ) ( HOIST-AT ?auto_1861964 ?auto_1861965 ) ( not ( = ?auto_1861963 ?auto_1861964 ) ) ( SURFACE-AT ?auto_1861960 ?auto_1861965 ) ( ON ?auto_1861960 ?auto_1861966 ) ( CLEAR ?auto_1861960 ) ( not ( = ?auto_1861959 ?auto_1861966 ) ) ( not ( = ?auto_1861960 ?auto_1861966 ) ) ( not ( = ?auto_1861958 ?auto_1861966 ) ) ( SURFACE-AT ?auto_1861958 ?auto_1861967 ) ( CLEAR ?auto_1861958 ) ( IS-CRATE ?auto_1861959 ) ( AVAILABLE ?auto_1861963 ) ( AVAILABLE ?auto_1861964 ) ( SURFACE-AT ?auto_1861959 ?auto_1861965 ) ( ON ?auto_1861959 ?auto_1861961 ) ( CLEAR ?auto_1861959 ) ( not ( = ?auto_1861959 ?auto_1861961 ) ) ( not ( = ?auto_1861960 ?auto_1861961 ) ) ( not ( = ?auto_1861958 ?auto_1861961 ) ) ( not ( = ?auto_1861966 ?auto_1861961 ) ) ( TRUCK-AT ?auto_1861962 ?auto_1861967 ) ( ON ?auto_1861950 ?auto_1861949 ) ( ON ?auto_1861951 ?auto_1861950 ) ( ON ?auto_1861948 ?auto_1861951 ) ( ON ?auto_1861952 ?auto_1861948 ) ( ON ?auto_1861954 ?auto_1861952 ) ( ON ?auto_1861953 ?auto_1861954 ) ( ON ?auto_1861955 ?auto_1861953 ) ( ON ?auto_1861956 ?auto_1861955 ) ( ON ?auto_1861957 ?auto_1861956 ) ( ON ?auto_1861958 ?auto_1861957 ) ( not ( = ?auto_1861949 ?auto_1861950 ) ) ( not ( = ?auto_1861949 ?auto_1861951 ) ) ( not ( = ?auto_1861949 ?auto_1861948 ) ) ( not ( = ?auto_1861949 ?auto_1861952 ) ) ( not ( = ?auto_1861949 ?auto_1861954 ) ) ( not ( = ?auto_1861949 ?auto_1861953 ) ) ( not ( = ?auto_1861949 ?auto_1861955 ) ) ( not ( = ?auto_1861949 ?auto_1861956 ) ) ( not ( = ?auto_1861949 ?auto_1861957 ) ) ( not ( = ?auto_1861949 ?auto_1861958 ) ) ( not ( = ?auto_1861949 ?auto_1861959 ) ) ( not ( = ?auto_1861949 ?auto_1861960 ) ) ( not ( = ?auto_1861949 ?auto_1861966 ) ) ( not ( = ?auto_1861949 ?auto_1861961 ) ) ( not ( = ?auto_1861950 ?auto_1861951 ) ) ( not ( = ?auto_1861950 ?auto_1861948 ) ) ( not ( = ?auto_1861950 ?auto_1861952 ) ) ( not ( = ?auto_1861950 ?auto_1861954 ) ) ( not ( = ?auto_1861950 ?auto_1861953 ) ) ( not ( = ?auto_1861950 ?auto_1861955 ) ) ( not ( = ?auto_1861950 ?auto_1861956 ) ) ( not ( = ?auto_1861950 ?auto_1861957 ) ) ( not ( = ?auto_1861950 ?auto_1861958 ) ) ( not ( = ?auto_1861950 ?auto_1861959 ) ) ( not ( = ?auto_1861950 ?auto_1861960 ) ) ( not ( = ?auto_1861950 ?auto_1861966 ) ) ( not ( = ?auto_1861950 ?auto_1861961 ) ) ( not ( = ?auto_1861951 ?auto_1861948 ) ) ( not ( = ?auto_1861951 ?auto_1861952 ) ) ( not ( = ?auto_1861951 ?auto_1861954 ) ) ( not ( = ?auto_1861951 ?auto_1861953 ) ) ( not ( = ?auto_1861951 ?auto_1861955 ) ) ( not ( = ?auto_1861951 ?auto_1861956 ) ) ( not ( = ?auto_1861951 ?auto_1861957 ) ) ( not ( = ?auto_1861951 ?auto_1861958 ) ) ( not ( = ?auto_1861951 ?auto_1861959 ) ) ( not ( = ?auto_1861951 ?auto_1861960 ) ) ( not ( = ?auto_1861951 ?auto_1861966 ) ) ( not ( = ?auto_1861951 ?auto_1861961 ) ) ( not ( = ?auto_1861948 ?auto_1861952 ) ) ( not ( = ?auto_1861948 ?auto_1861954 ) ) ( not ( = ?auto_1861948 ?auto_1861953 ) ) ( not ( = ?auto_1861948 ?auto_1861955 ) ) ( not ( = ?auto_1861948 ?auto_1861956 ) ) ( not ( = ?auto_1861948 ?auto_1861957 ) ) ( not ( = ?auto_1861948 ?auto_1861958 ) ) ( not ( = ?auto_1861948 ?auto_1861959 ) ) ( not ( = ?auto_1861948 ?auto_1861960 ) ) ( not ( = ?auto_1861948 ?auto_1861966 ) ) ( not ( = ?auto_1861948 ?auto_1861961 ) ) ( not ( = ?auto_1861952 ?auto_1861954 ) ) ( not ( = ?auto_1861952 ?auto_1861953 ) ) ( not ( = ?auto_1861952 ?auto_1861955 ) ) ( not ( = ?auto_1861952 ?auto_1861956 ) ) ( not ( = ?auto_1861952 ?auto_1861957 ) ) ( not ( = ?auto_1861952 ?auto_1861958 ) ) ( not ( = ?auto_1861952 ?auto_1861959 ) ) ( not ( = ?auto_1861952 ?auto_1861960 ) ) ( not ( = ?auto_1861952 ?auto_1861966 ) ) ( not ( = ?auto_1861952 ?auto_1861961 ) ) ( not ( = ?auto_1861954 ?auto_1861953 ) ) ( not ( = ?auto_1861954 ?auto_1861955 ) ) ( not ( = ?auto_1861954 ?auto_1861956 ) ) ( not ( = ?auto_1861954 ?auto_1861957 ) ) ( not ( = ?auto_1861954 ?auto_1861958 ) ) ( not ( = ?auto_1861954 ?auto_1861959 ) ) ( not ( = ?auto_1861954 ?auto_1861960 ) ) ( not ( = ?auto_1861954 ?auto_1861966 ) ) ( not ( = ?auto_1861954 ?auto_1861961 ) ) ( not ( = ?auto_1861953 ?auto_1861955 ) ) ( not ( = ?auto_1861953 ?auto_1861956 ) ) ( not ( = ?auto_1861953 ?auto_1861957 ) ) ( not ( = ?auto_1861953 ?auto_1861958 ) ) ( not ( = ?auto_1861953 ?auto_1861959 ) ) ( not ( = ?auto_1861953 ?auto_1861960 ) ) ( not ( = ?auto_1861953 ?auto_1861966 ) ) ( not ( = ?auto_1861953 ?auto_1861961 ) ) ( not ( = ?auto_1861955 ?auto_1861956 ) ) ( not ( = ?auto_1861955 ?auto_1861957 ) ) ( not ( = ?auto_1861955 ?auto_1861958 ) ) ( not ( = ?auto_1861955 ?auto_1861959 ) ) ( not ( = ?auto_1861955 ?auto_1861960 ) ) ( not ( = ?auto_1861955 ?auto_1861966 ) ) ( not ( = ?auto_1861955 ?auto_1861961 ) ) ( not ( = ?auto_1861956 ?auto_1861957 ) ) ( not ( = ?auto_1861956 ?auto_1861958 ) ) ( not ( = ?auto_1861956 ?auto_1861959 ) ) ( not ( = ?auto_1861956 ?auto_1861960 ) ) ( not ( = ?auto_1861956 ?auto_1861966 ) ) ( not ( = ?auto_1861956 ?auto_1861961 ) ) ( not ( = ?auto_1861957 ?auto_1861958 ) ) ( not ( = ?auto_1861957 ?auto_1861959 ) ) ( not ( = ?auto_1861957 ?auto_1861960 ) ) ( not ( = ?auto_1861957 ?auto_1861966 ) ) ( not ( = ?auto_1861957 ?auto_1861961 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861958 ?auto_1861959 ?auto_1861960 )
      ( MAKE-12CRATE-VERIFY ?auto_1861949 ?auto_1861950 ?auto_1861951 ?auto_1861948 ?auto_1861952 ?auto_1861954 ?auto_1861953 ?auto_1861955 ?auto_1861956 ?auto_1861957 ?auto_1861958 ?auto_1861959 ?auto_1861960 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1861969 - SURFACE
      ?auto_1861970 - SURFACE
      ?auto_1861971 - SURFACE
      ?auto_1861968 - SURFACE
      ?auto_1861972 - SURFACE
      ?auto_1861974 - SURFACE
      ?auto_1861973 - SURFACE
      ?auto_1861975 - SURFACE
      ?auto_1861976 - SURFACE
      ?auto_1861977 - SURFACE
      ?auto_1861978 - SURFACE
      ?auto_1861979 - SURFACE
      ?auto_1861980 - SURFACE
      ?auto_1861981 - SURFACE
    )
    :vars
    (
      ?auto_1861984 - HOIST
      ?auto_1861988 - PLACE
      ?auto_1861986 - PLACE
      ?auto_1861985 - HOIST
      ?auto_1861987 - SURFACE
      ?auto_1861982 - SURFACE
      ?auto_1861983 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861984 ?auto_1861988 ) ( IS-CRATE ?auto_1861981 ) ( not ( = ?auto_1861980 ?auto_1861981 ) ) ( not ( = ?auto_1861979 ?auto_1861980 ) ) ( not ( = ?auto_1861979 ?auto_1861981 ) ) ( not ( = ?auto_1861986 ?auto_1861988 ) ) ( HOIST-AT ?auto_1861985 ?auto_1861986 ) ( not ( = ?auto_1861984 ?auto_1861985 ) ) ( SURFACE-AT ?auto_1861981 ?auto_1861986 ) ( ON ?auto_1861981 ?auto_1861987 ) ( CLEAR ?auto_1861981 ) ( not ( = ?auto_1861980 ?auto_1861987 ) ) ( not ( = ?auto_1861981 ?auto_1861987 ) ) ( not ( = ?auto_1861979 ?auto_1861987 ) ) ( SURFACE-AT ?auto_1861979 ?auto_1861988 ) ( CLEAR ?auto_1861979 ) ( IS-CRATE ?auto_1861980 ) ( AVAILABLE ?auto_1861984 ) ( AVAILABLE ?auto_1861985 ) ( SURFACE-AT ?auto_1861980 ?auto_1861986 ) ( ON ?auto_1861980 ?auto_1861982 ) ( CLEAR ?auto_1861980 ) ( not ( = ?auto_1861980 ?auto_1861982 ) ) ( not ( = ?auto_1861981 ?auto_1861982 ) ) ( not ( = ?auto_1861979 ?auto_1861982 ) ) ( not ( = ?auto_1861987 ?auto_1861982 ) ) ( TRUCK-AT ?auto_1861983 ?auto_1861988 ) ( ON ?auto_1861970 ?auto_1861969 ) ( ON ?auto_1861971 ?auto_1861970 ) ( ON ?auto_1861968 ?auto_1861971 ) ( ON ?auto_1861972 ?auto_1861968 ) ( ON ?auto_1861974 ?auto_1861972 ) ( ON ?auto_1861973 ?auto_1861974 ) ( ON ?auto_1861975 ?auto_1861973 ) ( ON ?auto_1861976 ?auto_1861975 ) ( ON ?auto_1861977 ?auto_1861976 ) ( ON ?auto_1861978 ?auto_1861977 ) ( ON ?auto_1861979 ?auto_1861978 ) ( not ( = ?auto_1861969 ?auto_1861970 ) ) ( not ( = ?auto_1861969 ?auto_1861971 ) ) ( not ( = ?auto_1861969 ?auto_1861968 ) ) ( not ( = ?auto_1861969 ?auto_1861972 ) ) ( not ( = ?auto_1861969 ?auto_1861974 ) ) ( not ( = ?auto_1861969 ?auto_1861973 ) ) ( not ( = ?auto_1861969 ?auto_1861975 ) ) ( not ( = ?auto_1861969 ?auto_1861976 ) ) ( not ( = ?auto_1861969 ?auto_1861977 ) ) ( not ( = ?auto_1861969 ?auto_1861978 ) ) ( not ( = ?auto_1861969 ?auto_1861979 ) ) ( not ( = ?auto_1861969 ?auto_1861980 ) ) ( not ( = ?auto_1861969 ?auto_1861981 ) ) ( not ( = ?auto_1861969 ?auto_1861987 ) ) ( not ( = ?auto_1861969 ?auto_1861982 ) ) ( not ( = ?auto_1861970 ?auto_1861971 ) ) ( not ( = ?auto_1861970 ?auto_1861968 ) ) ( not ( = ?auto_1861970 ?auto_1861972 ) ) ( not ( = ?auto_1861970 ?auto_1861974 ) ) ( not ( = ?auto_1861970 ?auto_1861973 ) ) ( not ( = ?auto_1861970 ?auto_1861975 ) ) ( not ( = ?auto_1861970 ?auto_1861976 ) ) ( not ( = ?auto_1861970 ?auto_1861977 ) ) ( not ( = ?auto_1861970 ?auto_1861978 ) ) ( not ( = ?auto_1861970 ?auto_1861979 ) ) ( not ( = ?auto_1861970 ?auto_1861980 ) ) ( not ( = ?auto_1861970 ?auto_1861981 ) ) ( not ( = ?auto_1861970 ?auto_1861987 ) ) ( not ( = ?auto_1861970 ?auto_1861982 ) ) ( not ( = ?auto_1861971 ?auto_1861968 ) ) ( not ( = ?auto_1861971 ?auto_1861972 ) ) ( not ( = ?auto_1861971 ?auto_1861974 ) ) ( not ( = ?auto_1861971 ?auto_1861973 ) ) ( not ( = ?auto_1861971 ?auto_1861975 ) ) ( not ( = ?auto_1861971 ?auto_1861976 ) ) ( not ( = ?auto_1861971 ?auto_1861977 ) ) ( not ( = ?auto_1861971 ?auto_1861978 ) ) ( not ( = ?auto_1861971 ?auto_1861979 ) ) ( not ( = ?auto_1861971 ?auto_1861980 ) ) ( not ( = ?auto_1861971 ?auto_1861981 ) ) ( not ( = ?auto_1861971 ?auto_1861987 ) ) ( not ( = ?auto_1861971 ?auto_1861982 ) ) ( not ( = ?auto_1861968 ?auto_1861972 ) ) ( not ( = ?auto_1861968 ?auto_1861974 ) ) ( not ( = ?auto_1861968 ?auto_1861973 ) ) ( not ( = ?auto_1861968 ?auto_1861975 ) ) ( not ( = ?auto_1861968 ?auto_1861976 ) ) ( not ( = ?auto_1861968 ?auto_1861977 ) ) ( not ( = ?auto_1861968 ?auto_1861978 ) ) ( not ( = ?auto_1861968 ?auto_1861979 ) ) ( not ( = ?auto_1861968 ?auto_1861980 ) ) ( not ( = ?auto_1861968 ?auto_1861981 ) ) ( not ( = ?auto_1861968 ?auto_1861987 ) ) ( not ( = ?auto_1861968 ?auto_1861982 ) ) ( not ( = ?auto_1861972 ?auto_1861974 ) ) ( not ( = ?auto_1861972 ?auto_1861973 ) ) ( not ( = ?auto_1861972 ?auto_1861975 ) ) ( not ( = ?auto_1861972 ?auto_1861976 ) ) ( not ( = ?auto_1861972 ?auto_1861977 ) ) ( not ( = ?auto_1861972 ?auto_1861978 ) ) ( not ( = ?auto_1861972 ?auto_1861979 ) ) ( not ( = ?auto_1861972 ?auto_1861980 ) ) ( not ( = ?auto_1861972 ?auto_1861981 ) ) ( not ( = ?auto_1861972 ?auto_1861987 ) ) ( not ( = ?auto_1861972 ?auto_1861982 ) ) ( not ( = ?auto_1861974 ?auto_1861973 ) ) ( not ( = ?auto_1861974 ?auto_1861975 ) ) ( not ( = ?auto_1861974 ?auto_1861976 ) ) ( not ( = ?auto_1861974 ?auto_1861977 ) ) ( not ( = ?auto_1861974 ?auto_1861978 ) ) ( not ( = ?auto_1861974 ?auto_1861979 ) ) ( not ( = ?auto_1861974 ?auto_1861980 ) ) ( not ( = ?auto_1861974 ?auto_1861981 ) ) ( not ( = ?auto_1861974 ?auto_1861987 ) ) ( not ( = ?auto_1861974 ?auto_1861982 ) ) ( not ( = ?auto_1861973 ?auto_1861975 ) ) ( not ( = ?auto_1861973 ?auto_1861976 ) ) ( not ( = ?auto_1861973 ?auto_1861977 ) ) ( not ( = ?auto_1861973 ?auto_1861978 ) ) ( not ( = ?auto_1861973 ?auto_1861979 ) ) ( not ( = ?auto_1861973 ?auto_1861980 ) ) ( not ( = ?auto_1861973 ?auto_1861981 ) ) ( not ( = ?auto_1861973 ?auto_1861987 ) ) ( not ( = ?auto_1861973 ?auto_1861982 ) ) ( not ( = ?auto_1861975 ?auto_1861976 ) ) ( not ( = ?auto_1861975 ?auto_1861977 ) ) ( not ( = ?auto_1861975 ?auto_1861978 ) ) ( not ( = ?auto_1861975 ?auto_1861979 ) ) ( not ( = ?auto_1861975 ?auto_1861980 ) ) ( not ( = ?auto_1861975 ?auto_1861981 ) ) ( not ( = ?auto_1861975 ?auto_1861987 ) ) ( not ( = ?auto_1861975 ?auto_1861982 ) ) ( not ( = ?auto_1861976 ?auto_1861977 ) ) ( not ( = ?auto_1861976 ?auto_1861978 ) ) ( not ( = ?auto_1861976 ?auto_1861979 ) ) ( not ( = ?auto_1861976 ?auto_1861980 ) ) ( not ( = ?auto_1861976 ?auto_1861981 ) ) ( not ( = ?auto_1861976 ?auto_1861987 ) ) ( not ( = ?auto_1861976 ?auto_1861982 ) ) ( not ( = ?auto_1861977 ?auto_1861978 ) ) ( not ( = ?auto_1861977 ?auto_1861979 ) ) ( not ( = ?auto_1861977 ?auto_1861980 ) ) ( not ( = ?auto_1861977 ?auto_1861981 ) ) ( not ( = ?auto_1861977 ?auto_1861987 ) ) ( not ( = ?auto_1861977 ?auto_1861982 ) ) ( not ( = ?auto_1861978 ?auto_1861979 ) ) ( not ( = ?auto_1861978 ?auto_1861980 ) ) ( not ( = ?auto_1861978 ?auto_1861981 ) ) ( not ( = ?auto_1861978 ?auto_1861987 ) ) ( not ( = ?auto_1861978 ?auto_1861982 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1861979 ?auto_1861980 ?auto_1861981 )
      ( MAKE-13CRATE-VERIFY ?auto_1861969 ?auto_1861970 ?auto_1861971 ?auto_1861968 ?auto_1861972 ?auto_1861974 ?auto_1861973 ?auto_1861975 ?auto_1861976 ?auto_1861977 ?auto_1861978 ?auto_1861979 ?auto_1861980 ?auto_1861981 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1862023 - SURFACE
      ?auto_1862024 - SURFACE
      ?auto_1862025 - SURFACE
      ?auto_1862022 - SURFACE
      ?auto_1862026 - SURFACE
    )
    :vars
    (
      ?auto_1862027 - HOIST
      ?auto_1862031 - PLACE
      ?auto_1862029 - PLACE
      ?auto_1862028 - HOIST
      ?auto_1862030 - SURFACE
      ?auto_1862033 - SURFACE
      ?auto_1862032 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1862027 ?auto_1862031 ) ( IS-CRATE ?auto_1862026 ) ( not ( = ?auto_1862022 ?auto_1862026 ) ) ( not ( = ?auto_1862025 ?auto_1862022 ) ) ( not ( = ?auto_1862025 ?auto_1862026 ) ) ( not ( = ?auto_1862029 ?auto_1862031 ) ) ( HOIST-AT ?auto_1862028 ?auto_1862029 ) ( not ( = ?auto_1862027 ?auto_1862028 ) ) ( SURFACE-AT ?auto_1862026 ?auto_1862029 ) ( ON ?auto_1862026 ?auto_1862030 ) ( CLEAR ?auto_1862026 ) ( not ( = ?auto_1862022 ?auto_1862030 ) ) ( not ( = ?auto_1862026 ?auto_1862030 ) ) ( not ( = ?auto_1862025 ?auto_1862030 ) ) ( IS-CRATE ?auto_1862022 ) ( AVAILABLE ?auto_1862028 ) ( SURFACE-AT ?auto_1862022 ?auto_1862029 ) ( ON ?auto_1862022 ?auto_1862033 ) ( CLEAR ?auto_1862022 ) ( not ( = ?auto_1862022 ?auto_1862033 ) ) ( not ( = ?auto_1862026 ?auto_1862033 ) ) ( not ( = ?auto_1862025 ?auto_1862033 ) ) ( not ( = ?auto_1862030 ?auto_1862033 ) ) ( TRUCK-AT ?auto_1862032 ?auto_1862031 ) ( SURFACE-AT ?auto_1862024 ?auto_1862031 ) ( CLEAR ?auto_1862024 ) ( LIFTING ?auto_1862027 ?auto_1862025 ) ( IS-CRATE ?auto_1862025 ) ( not ( = ?auto_1862024 ?auto_1862025 ) ) ( not ( = ?auto_1862022 ?auto_1862024 ) ) ( not ( = ?auto_1862026 ?auto_1862024 ) ) ( not ( = ?auto_1862030 ?auto_1862024 ) ) ( not ( = ?auto_1862033 ?auto_1862024 ) ) ( ON ?auto_1862024 ?auto_1862023 ) ( not ( = ?auto_1862023 ?auto_1862024 ) ) ( not ( = ?auto_1862023 ?auto_1862025 ) ) ( not ( = ?auto_1862023 ?auto_1862022 ) ) ( not ( = ?auto_1862023 ?auto_1862026 ) ) ( not ( = ?auto_1862023 ?auto_1862030 ) ) ( not ( = ?auto_1862023 ?auto_1862033 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1862025 ?auto_1862022 ?auto_1862026 )
      ( MAKE-4CRATE-VERIFY ?auto_1862023 ?auto_1862024 ?auto_1862025 ?auto_1862022 ?auto_1862026 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1862035 - SURFACE
      ?auto_1862036 - SURFACE
      ?auto_1862037 - SURFACE
      ?auto_1862034 - SURFACE
      ?auto_1862038 - SURFACE
      ?auto_1862039 - SURFACE
    )
    :vars
    (
      ?auto_1862040 - HOIST
      ?auto_1862044 - PLACE
      ?auto_1862042 - PLACE
      ?auto_1862041 - HOIST
      ?auto_1862043 - SURFACE
      ?auto_1862046 - SURFACE
      ?auto_1862045 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1862040 ?auto_1862044 ) ( IS-CRATE ?auto_1862039 ) ( not ( = ?auto_1862038 ?auto_1862039 ) ) ( not ( = ?auto_1862034 ?auto_1862038 ) ) ( not ( = ?auto_1862034 ?auto_1862039 ) ) ( not ( = ?auto_1862042 ?auto_1862044 ) ) ( HOIST-AT ?auto_1862041 ?auto_1862042 ) ( not ( = ?auto_1862040 ?auto_1862041 ) ) ( SURFACE-AT ?auto_1862039 ?auto_1862042 ) ( ON ?auto_1862039 ?auto_1862043 ) ( CLEAR ?auto_1862039 ) ( not ( = ?auto_1862038 ?auto_1862043 ) ) ( not ( = ?auto_1862039 ?auto_1862043 ) ) ( not ( = ?auto_1862034 ?auto_1862043 ) ) ( IS-CRATE ?auto_1862038 ) ( AVAILABLE ?auto_1862041 ) ( SURFACE-AT ?auto_1862038 ?auto_1862042 ) ( ON ?auto_1862038 ?auto_1862046 ) ( CLEAR ?auto_1862038 ) ( not ( = ?auto_1862038 ?auto_1862046 ) ) ( not ( = ?auto_1862039 ?auto_1862046 ) ) ( not ( = ?auto_1862034 ?auto_1862046 ) ) ( not ( = ?auto_1862043 ?auto_1862046 ) ) ( TRUCK-AT ?auto_1862045 ?auto_1862044 ) ( SURFACE-AT ?auto_1862037 ?auto_1862044 ) ( CLEAR ?auto_1862037 ) ( LIFTING ?auto_1862040 ?auto_1862034 ) ( IS-CRATE ?auto_1862034 ) ( not ( = ?auto_1862037 ?auto_1862034 ) ) ( not ( = ?auto_1862038 ?auto_1862037 ) ) ( not ( = ?auto_1862039 ?auto_1862037 ) ) ( not ( = ?auto_1862043 ?auto_1862037 ) ) ( not ( = ?auto_1862046 ?auto_1862037 ) ) ( ON ?auto_1862036 ?auto_1862035 ) ( ON ?auto_1862037 ?auto_1862036 ) ( not ( = ?auto_1862035 ?auto_1862036 ) ) ( not ( = ?auto_1862035 ?auto_1862037 ) ) ( not ( = ?auto_1862035 ?auto_1862034 ) ) ( not ( = ?auto_1862035 ?auto_1862038 ) ) ( not ( = ?auto_1862035 ?auto_1862039 ) ) ( not ( = ?auto_1862035 ?auto_1862043 ) ) ( not ( = ?auto_1862035 ?auto_1862046 ) ) ( not ( = ?auto_1862036 ?auto_1862037 ) ) ( not ( = ?auto_1862036 ?auto_1862034 ) ) ( not ( = ?auto_1862036 ?auto_1862038 ) ) ( not ( = ?auto_1862036 ?auto_1862039 ) ) ( not ( = ?auto_1862036 ?auto_1862043 ) ) ( not ( = ?auto_1862036 ?auto_1862046 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1862034 ?auto_1862038 ?auto_1862039 )
      ( MAKE-5CRATE-VERIFY ?auto_1862035 ?auto_1862036 ?auto_1862037 ?auto_1862034 ?auto_1862038 ?auto_1862039 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1862048 - SURFACE
      ?auto_1862049 - SURFACE
      ?auto_1862050 - SURFACE
      ?auto_1862047 - SURFACE
      ?auto_1862051 - SURFACE
      ?auto_1862053 - SURFACE
      ?auto_1862052 - SURFACE
    )
    :vars
    (
      ?auto_1862054 - HOIST
      ?auto_1862058 - PLACE
      ?auto_1862056 - PLACE
      ?auto_1862055 - HOIST
      ?auto_1862057 - SURFACE
      ?auto_1862060 - SURFACE
      ?auto_1862059 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1862054 ?auto_1862058 ) ( IS-CRATE ?auto_1862052 ) ( not ( = ?auto_1862053 ?auto_1862052 ) ) ( not ( = ?auto_1862051 ?auto_1862053 ) ) ( not ( = ?auto_1862051 ?auto_1862052 ) ) ( not ( = ?auto_1862056 ?auto_1862058 ) ) ( HOIST-AT ?auto_1862055 ?auto_1862056 ) ( not ( = ?auto_1862054 ?auto_1862055 ) ) ( SURFACE-AT ?auto_1862052 ?auto_1862056 ) ( ON ?auto_1862052 ?auto_1862057 ) ( CLEAR ?auto_1862052 ) ( not ( = ?auto_1862053 ?auto_1862057 ) ) ( not ( = ?auto_1862052 ?auto_1862057 ) ) ( not ( = ?auto_1862051 ?auto_1862057 ) ) ( IS-CRATE ?auto_1862053 ) ( AVAILABLE ?auto_1862055 ) ( SURFACE-AT ?auto_1862053 ?auto_1862056 ) ( ON ?auto_1862053 ?auto_1862060 ) ( CLEAR ?auto_1862053 ) ( not ( = ?auto_1862053 ?auto_1862060 ) ) ( not ( = ?auto_1862052 ?auto_1862060 ) ) ( not ( = ?auto_1862051 ?auto_1862060 ) ) ( not ( = ?auto_1862057 ?auto_1862060 ) ) ( TRUCK-AT ?auto_1862059 ?auto_1862058 ) ( SURFACE-AT ?auto_1862047 ?auto_1862058 ) ( CLEAR ?auto_1862047 ) ( LIFTING ?auto_1862054 ?auto_1862051 ) ( IS-CRATE ?auto_1862051 ) ( not ( = ?auto_1862047 ?auto_1862051 ) ) ( not ( = ?auto_1862053 ?auto_1862047 ) ) ( not ( = ?auto_1862052 ?auto_1862047 ) ) ( not ( = ?auto_1862057 ?auto_1862047 ) ) ( not ( = ?auto_1862060 ?auto_1862047 ) ) ( ON ?auto_1862049 ?auto_1862048 ) ( ON ?auto_1862050 ?auto_1862049 ) ( ON ?auto_1862047 ?auto_1862050 ) ( not ( = ?auto_1862048 ?auto_1862049 ) ) ( not ( = ?auto_1862048 ?auto_1862050 ) ) ( not ( = ?auto_1862048 ?auto_1862047 ) ) ( not ( = ?auto_1862048 ?auto_1862051 ) ) ( not ( = ?auto_1862048 ?auto_1862053 ) ) ( not ( = ?auto_1862048 ?auto_1862052 ) ) ( not ( = ?auto_1862048 ?auto_1862057 ) ) ( not ( = ?auto_1862048 ?auto_1862060 ) ) ( not ( = ?auto_1862049 ?auto_1862050 ) ) ( not ( = ?auto_1862049 ?auto_1862047 ) ) ( not ( = ?auto_1862049 ?auto_1862051 ) ) ( not ( = ?auto_1862049 ?auto_1862053 ) ) ( not ( = ?auto_1862049 ?auto_1862052 ) ) ( not ( = ?auto_1862049 ?auto_1862057 ) ) ( not ( = ?auto_1862049 ?auto_1862060 ) ) ( not ( = ?auto_1862050 ?auto_1862047 ) ) ( not ( = ?auto_1862050 ?auto_1862051 ) ) ( not ( = ?auto_1862050 ?auto_1862053 ) ) ( not ( = ?auto_1862050 ?auto_1862052 ) ) ( not ( = ?auto_1862050 ?auto_1862057 ) ) ( not ( = ?auto_1862050 ?auto_1862060 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1862051 ?auto_1862053 ?auto_1862052 )
      ( MAKE-6CRATE-VERIFY ?auto_1862048 ?auto_1862049 ?auto_1862050 ?auto_1862047 ?auto_1862051 ?auto_1862053 ?auto_1862052 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1862062 - SURFACE
      ?auto_1862063 - SURFACE
      ?auto_1862064 - SURFACE
      ?auto_1862061 - SURFACE
      ?auto_1862065 - SURFACE
      ?auto_1862067 - SURFACE
      ?auto_1862066 - SURFACE
      ?auto_1862068 - SURFACE
    )
    :vars
    (
      ?auto_1862069 - HOIST
      ?auto_1862073 - PLACE
      ?auto_1862071 - PLACE
      ?auto_1862070 - HOIST
      ?auto_1862072 - SURFACE
      ?auto_1862075 - SURFACE
      ?auto_1862074 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1862069 ?auto_1862073 ) ( IS-CRATE ?auto_1862068 ) ( not ( = ?auto_1862066 ?auto_1862068 ) ) ( not ( = ?auto_1862067 ?auto_1862066 ) ) ( not ( = ?auto_1862067 ?auto_1862068 ) ) ( not ( = ?auto_1862071 ?auto_1862073 ) ) ( HOIST-AT ?auto_1862070 ?auto_1862071 ) ( not ( = ?auto_1862069 ?auto_1862070 ) ) ( SURFACE-AT ?auto_1862068 ?auto_1862071 ) ( ON ?auto_1862068 ?auto_1862072 ) ( CLEAR ?auto_1862068 ) ( not ( = ?auto_1862066 ?auto_1862072 ) ) ( not ( = ?auto_1862068 ?auto_1862072 ) ) ( not ( = ?auto_1862067 ?auto_1862072 ) ) ( IS-CRATE ?auto_1862066 ) ( AVAILABLE ?auto_1862070 ) ( SURFACE-AT ?auto_1862066 ?auto_1862071 ) ( ON ?auto_1862066 ?auto_1862075 ) ( CLEAR ?auto_1862066 ) ( not ( = ?auto_1862066 ?auto_1862075 ) ) ( not ( = ?auto_1862068 ?auto_1862075 ) ) ( not ( = ?auto_1862067 ?auto_1862075 ) ) ( not ( = ?auto_1862072 ?auto_1862075 ) ) ( TRUCK-AT ?auto_1862074 ?auto_1862073 ) ( SURFACE-AT ?auto_1862065 ?auto_1862073 ) ( CLEAR ?auto_1862065 ) ( LIFTING ?auto_1862069 ?auto_1862067 ) ( IS-CRATE ?auto_1862067 ) ( not ( = ?auto_1862065 ?auto_1862067 ) ) ( not ( = ?auto_1862066 ?auto_1862065 ) ) ( not ( = ?auto_1862068 ?auto_1862065 ) ) ( not ( = ?auto_1862072 ?auto_1862065 ) ) ( not ( = ?auto_1862075 ?auto_1862065 ) ) ( ON ?auto_1862063 ?auto_1862062 ) ( ON ?auto_1862064 ?auto_1862063 ) ( ON ?auto_1862061 ?auto_1862064 ) ( ON ?auto_1862065 ?auto_1862061 ) ( not ( = ?auto_1862062 ?auto_1862063 ) ) ( not ( = ?auto_1862062 ?auto_1862064 ) ) ( not ( = ?auto_1862062 ?auto_1862061 ) ) ( not ( = ?auto_1862062 ?auto_1862065 ) ) ( not ( = ?auto_1862062 ?auto_1862067 ) ) ( not ( = ?auto_1862062 ?auto_1862066 ) ) ( not ( = ?auto_1862062 ?auto_1862068 ) ) ( not ( = ?auto_1862062 ?auto_1862072 ) ) ( not ( = ?auto_1862062 ?auto_1862075 ) ) ( not ( = ?auto_1862063 ?auto_1862064 ) ) ( not ( = ?auto_1862063 ?auto_1862061 ) ) ( not ( = ?auto_1862063 ?auto_1862065 ) ) ( not ( = ?auto_1862063 ?auto_1862067 ) ) ( not ( = ?auto_1862063 ?auto_1862066 ) ) ( not ( = ?auto_1862063 ?auto_1862068 ) ) ( not ( = ?auto_1862063 ?auto_1862072 ) ) ( not ( = ?auto_1862063 ?auto_1862075 ) ) ( not ( = ?auto_1862064 ?auto_1862061 ) ) ( not ( = ?auto_1862064 ?auto_1862065 ) ) ( not ( = ?auto_1862064 ?auto_1862067 ) ) ( not ( = ?auto_1862064 ?auto_1862066 ) ) ( not ( = ?auto_1862064 ?auto_1862068 ) ) ( not ( = ?auto_1862064 ?auto_1862072 ) ) ( not ( = ?auto_1862064 ?auto_1862075 ) ) ( not ( = ?auto_1862061 ?auto_1862065 ) ) ( not ( = ?auto_1862061 ?auto_1862067 ) ) ( not ( = ?auto_1862061 ?auto_1862066 ) ) ( not ( = ?auto_1862061 ?auto_1862068 ) ) ( not ( = ?auto_1862061 ?auto_1862072 ) ) ( not ( = ?auto_1862061 ?auto_1862075 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1862067 ?auto_1862066 ?auto_1862068 )
      ( MAKE-7CRATE-VERIFY ?auto_1862062 ?auto_1862063 ?auto_1862064 ?auto_1862061 ?auto_1862065 ?auto_1862067 ?auto_1862066 ?auto_1862068 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1862077 - SURFACE
      ?auto_1862078 - SURFACE
      ?auto_1862079 - SURFACE
      ?auto_1862076 - SURFACE
      ?auto_1862080 - SURFACE
      ?auto_1862082 - SURFACE
      ?auto_1862081 - SURFACE
      ?auto_1862083 - SURFACE
      ?auto_1862084 - SURFACE
    )
    :vars
    (
      ?auto_1862085 - HOIST
      ?auto_1862089 - PLACE
      ?auto_1862087 - PLACE
      ?auto_1862086 - HOIST
      ?auto_1862088 - SURFACE
      ?auto_1862091 - SURFACE
      ?auto_1862090 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1862085 ?auto_1862089 ) ( IS-CRATE ?auto_1862084 ) ( not ( = ?auto_1862083 ?auto_1862084 ) ) ( not ( = ?auto_1862081 ?auto_1862083 ) ) ( not ( = ?auto_1862081 ?auto_1862084 ) ) ( not ( = ?auto_1862087 ?auto_1862089 ) ) ( HOIST-AT ?auto_1862086 ?auto_1862087 ) ( not ( = ?auto_1862085 ?auto_1862086 ) ) ( SURFACE-AT ?auto_1862084 ?auto_1862087 ) ( ON ?auto_1862084 ?auto_1862088 ) ( CLEAR ?auto_1862084 ) ( not ( = ?auto_1862083 ?auto_1862088 ) ) ( not ( = ?auto_1862084 ?auto_1862088 ) ) ( not ( = ?auto_1862081 ?auto_1862088 ) ) ( IS-CRATE ?auto_1862083 ) ( AVAILABLE ?auto_1862086 ) ( SURFACE-AT ?auto_1862083 ?auto_1862087 ) ( ON ?auto_1862083 ?auto_1862091 ) ( CLEAR ?auto_1862083 ) ( not ( = ?auto_1862083 ?auto_1862091 ) ) ( not ( = ?auto_1862084 ?auto_1862091 ) ) ( not ( = ?auto_1862081 ?auto_1862091 ) ) ( not ( = ?auto_1862088 ?auto_1862091 ) ) ( TRUCK-AT ?auto_1862090 ?auto_1862089 ) ( SURFACE-AT ?auto_1862082 ?auto_1862089 ) ( CLEAR ?auto_1862082 ) ( LIFTING ?auto_1862085 ?auto_1862081 ) ( IS-CRATE ?auto_1862081 ) ( not ( = ?auto_1862082 ?auto_1862081 ) ) ( not ( = ?auto_1862083 ?auto_1862082 ) ) ( not ( = ?auto_1862084 ?auto_1862082 ) ) ( not ( = ?auto_1862088 ?auto_1862082 ) ) ( not ( = ?auto_1862091 ?auto_1862082 ) ) ( ON ?auto_1862078 ?auto_1862077 ) ( ON ?auto_1862079 ?auto_1862078 ) ( ON ?auto_1862076 ?auto_1862079 ) ( ON ?auto_1862080 ?auto_1862076 ) ( ON ?auto_1862082 ?auto_1862080 ) ( not ( = ?auto_1862077 ?auto_1862078 ) ) ( not ( = ?auto_1862077 ?auto_1862079 ) ) ( not ( = ?auto_1862077 ?auto_1862076 ) ) ( not ( = ?auto_1862077 ?auto_1862080 ) ) ( not ( = ?auto_1862077 ?auto_1862082 ) ) ( not ( = ?auto_1862077 ?auto_1862081 ) ) ( not ( = ?auto_1862077 ?auto_1862083 ) ) ( not ( = ?auto_1862077 ?auto_1862084 ) ) ( not ( = ?auto_1862077 ?auto_1862088 ) ) ( not ( = ?auto_1862077 ?auto_1862091 ) ) ( not ( = ?auto_1862078 ?auto_1862079 ) ) ( not ( = ?auto_1862078 ?auto_1862076 ) ) ( not ( = ?auto_1862078 ?auto_1862080 ) ) ( not ( = ?auto_1862078 ?auto_1862082 ) ) ( not ( = ?auto_1862078 ?auto_1862081 ) ) ( not ( = ?auto_1862078 ?auto_1862083 ) ) ( not ( = ?auto_1862078 ?auto_1862084 ) ) ( not ( = ?auto_1862078 ?auto_1862088 ) ) ( not ( = ?auto_1862078 ?auto_1862091 ) ) ( not ( = ?auto_1862079 ?auto_1862076 ) ) ( not ( = ?auto_1862079 ?auto_1862080 ) ) ( not ( = ?auto_1862079 ?auto_1862082 ) ) ( not ( = ?auto_1862079 ?auto_1862081 ) ) ( not ( = ?auto_1862079 ?auto_1862083 ) ) ( not ( = ?auto_1862079 ?auto_1862084 ) ) ( not ( = ?auto_1862079 ?auto_1862088 ) ) ( not ( = ?auto_1862079 ?auto_1862091 ) ) ( not ( = ?auto_1862076 ?auto_1862080 ) ) ( not ( = ?auto_1862076 ?auto_1862082 ) ) ( not ( = ?auto_1862076 ?auto_1862081 ) ) ( not ( = ?auto_1862076 ?auto_1862083 ) ) ( not ( = ?auto_1862076 ?auto_1862084 ) ) ( not ( = ?auto_1862076 ?auto_1862088 ) ) ( not ( = ?auto_1862076 ?auto_1862091 ) ) ( not ( = ?auto_1862080 ?auto_1862082 ) ) ( not ( = ?auto_1862080 ?auto_1862081 ) ) ( not ( = ?auto_1862080 ?auto_1862083 ) ) ( not ( = ?auto_1862080 ?auto_1862084 ) ) ( not ( = ?auto_1862080 ?auto_1862088 ) ) ( not ( = ?auto_1862080 ?auto_1862091 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1862081 ?auto_1862083 ?auto_1862084 )
      ( MAKE-8CRATE-VERIFY ?auto_1862077 ?auto_1862078 ?auto_1862079 ?auto_1862076 ?auto_1862080 ?auto_1862082 ?auto_1862081 ?auto_1862083 ?auto_1862084 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1862093 - SURFACE
      ?auto_1862094 - SURFACE
      ?auto_1862095 - SURFACE
      ?auto_1862092 - SURFACE
      ?auto_1862096 - SURFACE
      ?auto_1862098 - SURFACE
      ?auto_1862097 - SURFACE
      ?auto_1862099 - SURFACE
      ?auto_1862100 - SURFACE
      ?auto_1862101 - SURFACE
    )
    :vars
    (
      ?auto_1862102 - HOIST
      ?auto_1862106 - PLACE
      ?auto_1862104 - PLACE
      ?auto_1862103 - HOIST
      ?auto_1862105 - SURFACE
      ?auto_1862108 - SURFACE
      ?auto_1862107 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1862102 ?auto_1862106 ) ( IS-CRATE ?auto_1862101 ) ( not ( = ?auto_1862100 ?auto_1862101 ) ) ( not ( = ?auto_1862099 ?auto_1862100 ) ) ( not ( = ?auto_1862099 ?auto_1862101 ) ) ( not ( = ?auto_1862104 ?auto_1862106 ) ) ( HOIST-AT ?auto_1862103 ?auto_1862104 ) ( not ( = ?auto_1862102 ?auto_1862103 ) ) ( SURFACE-AT ?auto_1862101 ?auto_1862104 ) ( ON ?auto_1862101 ?auto_1862105 ) ( CLEAR ?auto_1862101 ) ( not ( = ?auto_1862100 ?auto_1862105 ) ) ( not ( = ?auto_1862101 ?auto_1862105 ) ) ( not ( = ?auto_1862099 ?auto_1862105 ) ) ( IS-CRATE ?auto_1862100 ) ( AVAILABLE ?auto_1862103 ) ( SURFACE-AT ?auto_1862100 ?auto_1862104 ) ( ON ?auto_1862100 ?auto_1862108 ) ( CLEAR ?auto_1862100 ) ( not ( = ?auto_1862100 ?auto_1862108 ) ) ( not ( = ?auto_1862101 ?auto_1862108 ) ) ( not ( = ?auto_1862099 ?auto_1862108 ) ) ( not ( = ?auto_1862105 ?auto_1862108 ) ) ( TRUCK-AT ?auto_1862107 ?auto_1862106 ) ( SURFACE-AT ?auto_1862097 ?auto_1862106 ) ( CLEAR ?auto_1862097 ) ( LIFTING ?auto_1862102 ?auto_1862099 ) ( IS-CRATE ?auto_1862099 ) ( not ( = ?auto_1862097 ?auto_1862099 ) ) ( not ( = ?auto_1862100 ?auto_1862097 ) ) ( not ( = ?auto_1862101 ?auto_1862097 ) ) ( not ( = ?auto_1862105 ?auto_1862097 ) ) ( not ( = ?auto_1862108 ?auto_1862097 ) ) ( ON ?auto_1862094 ?auto_1862093 ) ( ON ?auto_1862095 ?auto_1862094 ) ( ON ?auto_1862092 ?auto_1862095 ) ( ON ?auto_1862096 ?auto_1862092 ) ( ON ?auto_1862098 ?auto_1862096 ) ( ON ?auto_1862097 ?auto_1862098 ) ( not ( = ?auto_1862093 ?auto_1862094 ) ) ( not ( = ?auto_1862093 ?auto_1862095 ) ) ( not ( = ?auto_1862093 ?auto_1862092 ) ) ( not ( = ?auto_1862093 ?auto_1862096 ) ) ( not ( = ?auto_1862093 ?auto_1862098 ) ) ( not ( = ?auto_1862093 ?auto_1862097 ) ) ( not ( = ?auto_1862093 ?auto_1862099 ) ) ( not ( = ?auto_1862093 ?auto_1862100 ) ) ( not ( = ?auto_1862093 ?auto_1862101 ) ) ( not ( = ?auto_1862093 ?auto_1862105 ) ) ( not ( = ?auto_1862093 ?auto_1862108 ) ) ( not ( = ?auto_1862094 ?auto_1862095 ) ) ( not ( = ?auto_1862094 ?auto_1862092 ) ) ( not ( = ?auto_1862094 ?auto_1862096 ) ) ( not ( = ?auto_1862094 ?auto_1862098 ) ) ( not ( = ?auto_1862094 ?auto_1862097 ) ) ( not ( = ?auto_1862094 ?auto_1862099 ) ) ( not ( = ?auto_1862094 ?auto_1862100 ) ) ( not ( = ?auto_1862094 ?auto_1862101 ) ) ( not ( = ?auto_1862094 ?auto_1862105 ) ) ( not ( = ?auto_1862094 ?auto_1862108 ) ) ( not ( = ?auto_1862095 ?auto_1862092 ) ) ( not ( = ?auto_1862095 ?auto_1862096 ) ) ( not ( = ?auto_1862095 ?auto_1862098 ) ) ( not ( = ?auto_1862095 ?auto_1862097 ) ) ( not ( = ?auto_1862095 ?auto_1862099 ) ) ( not ( = ?auto_1862095 ?auto_1862100 ) ) ( not ( = ?auto_1862095 ?auto_1862101 ) ) ( not ( = ?auto_1862095 ?auto_1862105 ) ) ( not ( = ?auto_1862095 ?auto_1862108 ) ) ( not ( = ?auto_1862092 ?auto_1862096 ) ) ( not ( = ?auto_1862092 ?auto_1862098 ) ) ( not ( = ?auto_1862092 ?auto_1862097 ) ) ( not ( = ?auto_1862092 ?auto_1862099 ) ) ( not ( = ?auto_1862092 ?auto_1862100 ) ) ( not ( = ?auto_1862092 ?auto_1862101 ) ) ( not ( = ?auto_1862092 ?auto_1862105 ) ) ( not ( = ?auto_1862092 ?auto_1862108 ) ) ( not ( = ?auto_1862096 ?auto_1862098 ) ) ( not ( = ?auto_1862096 ?auto_1862097 ) ) ( not ( = ?auto_1862096 ?auto_1862099 ) ) ( not ( = ?auto_1862096 ?auto_1862100 ) ) ( not ( = ?auto_1862096 ?auto_1862101 ) ) ( not ( = ?auto_1862096 ?auto_1862105 ) ) ( not ( = ?auto_1862096 ?auto_1862108 ) ) ( not ( = ?auto_1862098 ?auto_1862097 ) ) ( not ( = ?auto_1862098 ?auto_1862099 ) ) ( not ( = ?auto_1862098 ?auto_1862100 ) ) ( not ( = ?auto_1862098 ?auto_1862101 ) ) ( not ( = ?auto_1862098 ?auto_1862105 ) ) ( not ( = ?auto_1862098 ?auto_1862108 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1862099 ?auto_1862100 ?auto_1862101 )
      ( MAKE-9CRATE-VERIFY ?auto_1862093 ?auto_1862094 ?auto_1862095 ?auto_1862092 ?auto_1862096 ?auto_1862098 ?auto_1862097 ?auto_1862099 ?auto_1862100 ?auto_1862101 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1862110 - SURFACE
      ?auto_1862111 - SURFACE
      ?auto_1862112 - SURFACE
      ?auto_1862109 - SURFACE
      ?auto_1862113 - SURFACE
      ?auto_1862115 - SURFACE
      ?auto_1862114 - SURFACE
      ?auto_1862116 - SURFACE
      ?auto_1862117 - SURFACE
      ?auto_1862118 - SURFACE
      ?auto_1862119 - SURFACE
    )
    :vars
    (
      ?auto_1862120 - HOIST
      ?auto_1862124 - PLACE
      ?auto_1862122 - PLACE
      ?auto_1862121 - HOIST
      ?auto_1862123 - SURFACE
      ?auto_1862126 - SURFACE
      ?auto_1862125 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1862120 ?auto_1862124 ) ( IS-CRATE ?auto_1862119 ) ( not ( = ?auto_1862118 ?auto_1862119 ) ) ( not ( = ?auto_1862117 ?auto_1862118 ) ) ( not ( = ?auto_1862117 ?auto_1862119 ) ) ( not ( = ?auto_1862122 ?auto_1862124 ) ) ( HOIST-AT ?auto_1862121 ?auto_1862122 ) ( not ( = ?auto_1862120 ?auto_1862121 ) ) ( SURFACE-AT ?auto_1862119 ?auto_1862122 ) ( ON ?auto_1862119 ?auto_1862123 ) ( CLEAR ?auto_1862119 ) ( not ( = ?auto_1862118 ?auto_1862123 ) ) ( not ( = ?auto_1862119 ?auto_1862123 ) ) ( not ( = ?auto_1862117 ?auto_1862123 ) ) ( IS-CRATE ?auto_1862118 ) ( AVAILABLE ?auto_1862121 ) ( SURFACE-AT ?auto_1862118 ?auto_1862122 ) ( ON ?auto_1862118 ?auto_1862126 ) ( CLEAR ?auto_1862118 ) ( not ( = ?auto_1862118 ?auto_1862126 ) ) ( not ( = ?auto_1862119 ?auto_1862126 ) ) ( not ( = ?auto_1862117 ?auto_1862126 ) ) ( not ( = ?auto_1862123 ?auto_1862126 ) ) ( TRUCK-AT ?auto_1862125 ?auto_1862124 ) ( SURFACE-AT ?auto_1862116 ?auto_1862124 ) ( CLEAR ?auto_1862116 ) ( LIFTING ?auto_1862120 ?auto_1862117 ) ( IS-CRATE ?auto_1862117 ) ( not ( = ?auto_1862116 ?auto_1862117 ) ) ( not ( = ?auto_1862118 ?auto_1862116 ) ) ( not ( = ?auto_1862119 ?auto_1862116 ) ) ( not ( = ?auto_1862123 ?auto_1862116 ) ) ( not ( = ?auto_1862126 ?auto_1862116 ) ) ( ON ?auto_1862111 ?auto_1862110 ) ( ON ?auto_1862112 ?auto_1862111 ) ( ON ?auto_1862109 ?auto_1862112 ) ( ON ?auto_1862113 ?auto_1862109 ) ( ON ?auto_1862115 ?auto_1862113 ) ( ON ?auto_1862114 ?auto_1862115 ) ( ON ?auto_1862116 ?auto_1862114 ) ( not ( = ?auto_1862110 ?auto_1862111 ) ) ( not ( = ?auto_1862110 ?auto_1862112 ) ) ( not ( = ?auto_1862110 ?auto_1862109 ) ) ( not ( = ?auto_1862110 ?auto_1862113 ) ) ( not ( = ?auto_1862110 ?auto_1862115 ) ) ( not ( = ?auto_1862110 ?auto_1862114 ) ) ( not ( = ?auto_1862110 ?auto_1862116 ) ) ( not ( = ?auto_1862110 ?auto_1862117 ) ) ( not ( = ?auto_1862110 ?auto_1862118 ) ) ( not ( = ?auto_1862110 ?auto_1862119 ) ) ( not ( = ?auto_1862110 ?auto_1862123 ) ) ( not ( = ?auto_1862110 ?auto_1862126 ) ) ( not ( = ?auto_1862111 ?auto_1862112 ) ) ( not ( = ?auto_1862111 ?auto_1862109 ) ) ( not ( = ?auto_1862111 ?auto_1862113 ) ) ( not ( = ?auto_1862111 ?auto_1862115 ) ) ( not ( = ?auto_1862111 ?auto_1862114 ) ) ( not ( = ?auto_1862111 ?auto_1862116 ) ) ( not ( = ?auto_1862111 ?auto_1862117 ) ) ( not ( = ?auto_1862111 ?auto_1862118 ) ) ( not ( = ?auto_1862111 ?auto_1862119 ) ) ( not ( = ?auto_1862111 ?auto_1862123 ) ) ( not ( = ?auto_1862111 ?auto_1862126 ) ) ( not ( = ?auto_1862112 ?auto_1862109 ) ) ( not ( = ?auto_1862112 ?auto_1862113 ) ) ( not ( = ?auto_1862112 ?auto_1862115 ) ) ( not ( = ?auto_1862112 ?auto_1862114 ) ) ( not ( = ?auto_1862112 ?auto_1862116 ) ) ( not ( = ?auto_1862112 ?auto_1862117 ) ) ( not ( = ?auto_1862112 ?auto_1862118 ) ) ( not ( = ?auto_1862112 ?auto_1862119 ) ) ( not ( = ?auto_1862112 ?auto_1862123 ) ) ( not ( = ?auto_1862112 ?auto_1862126 ) ) ( not ( = ?auto_1862109 ?auto_1862113 ) ) ( not ( = ?auto_1862109 ?auto_1862115 ) ) ( not ( = ?auto_1862109 ?auto_1862114 ) ) ( not ( = ?auto_1862109 ?auto_1862116 ) ) ( not ( = ?auto_1862109 ?auto_1862117 ) ) ( not ( = ?auto_1862109 ?auto_1862118 ) ) ( not ( = ?auto_1862109 ?auto_1862119 ) ) ( not ( = ?auto_1862109 ?auto_1862123 ) ) ( not ( = ?auto_1862109 ?auto_1862126 ) ) ( not ( = ?auto_1862113 ?auto_1862115 ) ) ( not ( = ?auto_1862113 ?auto_1862114 ) ) ( not ( = ?auto_1862113 ?auto_1862116 ) ) ( not ( = ?auto_1862113 ?auto_1862117 ) ) ( not ( = ?auto_1862113 ?auto_1862118 ) ) ( not ( = ?auto_1862113 ?auto_1862119 ) ) ( not ( = ?auto_1862113 ?auto_1862123 ) ) ( not ( = ?auto_1862113 ?auto_1862126 ) ) ( not ( = ?auto_1862115 ?auto_1862114 ) ) ( not ( = ?auto_1862115 ?auto_1862116 ) ) ( not ( = ?auto_1862115 ?auto_1862117 ) ) ( not ( = ?auto_1862115 ?auto_1862118 ) ) ( not ( = ?auto_1862115 ?auto_1862119 ) ) ( not ( = ?auto_1862115 ?auto_1862123 ) ) ( not ( = ?auto_1862115 ?auto_1862126 ) ) ( not ( = ?auto_1862114 ?auto_1862116 ) ) ( not ( = ?auto_1862114 ?auto_1862117 ) ) ( not ( = ?auto_1862114 ?auto_1862118 ) ) ( not ( = ?auto_1862114 ?auto_1862119 ) ) ( not ( = ?auto_1862114 ?auto_1862123 ) ) ( not ( = ?auto_1862114 ?auto_1862126 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1862117 ?auto_1862118 ?auto_1862119 )
      ( MAKE-10CRATE-VERIFY ?auto_1862110 ?auto_1862111 ?auto_1862112 ?auto_1862109 ?auto_1862113 ?auto_1862115 ?auto_1862114 ?auto_1862116 ?auto_1862117 ?auto_1862118 ?auto_1862119 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1862128 - SURFACE
      ?auto_1862129 - SURFACE
      ?auto_1862130 - SURFACE
      ?auto_1862127 - SURFACE
      ?auto_1862131 - SURFACE
      ?auto_1862133 - SURFACE
      ?auto_1862132 - SURFACE
      ?auto_1862134 - SURFACE
      ?auto_1862135 - SURFACE
      ?auto_1862136 - SURFACE
      ?auto_1862137 - SURFACE
      ?auto_1862138 - SURFACE
    )
    :vars
    (
      ?auto_1862139 - HOIST
      ?auto_1862143 - PLACE
      ?auto_1862141 - PLACE
      ?auto_1862140 - HOIST
      ?auto_1862142 - SURFACE
      ?auto_1862145 - SURFACE
      ?auto_1862144 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1862139 ?auto_1862143 ) ( IS-CRATE ?auto_1862138 ) ( not ( = ?auto_1862137 ?auto_1862138 ) ) ( not ( = ?auto_1862136 ?auto_1862137 ) ) ( not ( = ?auto_1862136 ?auto_1862138 ) ) ( not ( = ?auto_1862141 ?auto_1862143 ) ) ( HOIST-AT ?auto_1862140 ?auto_1862141 ) ( not ( = ?auto_1862139 ?auto_1862140 ) ) ( SURFACE-AT ?auto_1862138 ?auto_1862141 ) ( ON ?auto_1862138 ?auto_1862142 ) ( CLEAR ?auto_1862138 ) ( not ( = ?auto_1862137 ?auto_1862142 ) ) ( not ( = ?auto_1862138 ?auto_1862142 ) ) ( not ( = ?auto_1862136 ?auto_1862142 ) ) ( IS-CRATE ?auto_1862137 ) ( AVAILABLE ?auto_1862140 ) ( SURFACE-AT ?auto_1862137 ?auto_1862141 ) ( ON ?auto_1862137 ?auto_1862145 ) ( CLEAR ?auto_1862137 ) ( not ( = ?auto_1862137 ?auto_1862145 ) ) ( not ( = ?auto_1862138 ?auto_1862145 ) ) ( not ( = ?auto_1862136 ?auto_1862145 ) ) ( not ( = ?auto_1862142 ?auto_1862145 ) ) ( TRUCK-AT ?auto_1862144 ?auto_1862143 ) ( SURFACE-AT ?auto_1862135 ?auto_1862143 ) ( CLEAR ?auto_1862135 ) ( LIFTING ?auto_1862139 ?auto_1862136 ) ( IS-CRATE ?auto_1862136 ) ( not ( = ?auto_1862135 ?auto_1862136 ) ) ( not ( = ?auto_1862137 ?auto_1862135 ) ) ( not ( = ?auto_1862138 ?auto_1862135 ) ) ( not ( = ?auto_1862142 ?auto_1862135 ) ) ( not ( = ?auto_1862145 ?auto_1862135 ) ) ( ON ?auto_1862129 ?auto_1862128 ) ( ON ?auto_1862130 ?auto_1862129 ) ( ON ?auto_1862127 ?auto_1862130 ) ( ON ?auto_1862131 ?auto_1862127 ) ( ON ?auto_1862133 ?auto_1862131 ) ( ON ?auto_1862132 ?auto_1862133 ) ( ON ?auto_1862134 ?auto_1862132 ) ( ON ?auto_1862135 ?auto_1862134 ) ( not ( = ?auto_1862128 ?auto_1862129 ) ) ( not ( = ?auto_1862128 ?auto_1862130 ) ) ( not ( = ?auto_1862128 ?auto_1862127 ) ) ( not ( = ?auto_1862128 ?auto_1862131 ) ) ( not ( = ?auto_1862128 ?auto_1862133 ) ) ( not ( = ?auto_1862128 ?auto_1862132 ) ) ( not ( = ?auto_1862128 ?auto_1862134 ) ) ( not ( = ?auto_1862128 ?auto_1862135 ) ) ( not ( = ?auto_1862128 ?auto_1862136 ) ) ( not ( = ?auto_1862128 ?auto_1862137 ) ) ( not ( = ?auto_1862128 ?auto_1862138 ) ) ( not ( = ?auto_1862128 ?auto_1862142 ) ) ( not ( = ?auto_1862128 ?auto_1862145 ) ) ( not ( = ?auto_1862129 ?auto_1862130 ) ) ( not ( = ?auto_1862129 ?auto_1862127 ) ) ( not ( = ?auto_1862129 ?auto_1862131 ) ) ( not ( = ?auto_1862129 ?auto_1862133 ) ) ( not ( = ?auto_1862129 ?auto_1862132 ) ) ( not ( = ?auto_1862129 ?auto_1862134 ) ) ( not ( = ?auto_1862129 ?auto_1862135 ) ) ( not ( = ?auto_1862129 ?auto_1862136 ) ) ( not ( = ?auto_1862129 ?auto_1862137 ) ) ( not ( = ?auto_1862129 ?auto_1862138 ) ) ( not ( = ?auto_1862129 ?auto_1862142 ) ) ( not ( = ?auto_1862129 ?auto_1862145 ) ) ( not ( = ?auto_1862130 ?auto_1862127 ) ) ( not ( = ?auto_1862130 ?auto_1862131 ) ) ( not ( = ?auto_1862130 ?auto_1862133 ) ) ( not ( = ?auto_1862130 ?auto_1862132 ) ) ( not ( = ?auto_1862130 ?auto_1862134 ) ) ( not ( = ?auto_1862130 ?auto_1862135 ) ) ( not ( = ?auto_1862130 ?auto_1862136 ) ) ( not ( = ?auto_1862130 ?auto_1862137 ) ) ( not ( = ?auto_1862130 ?auto_1862138 ) ) ( not ( = ?auto_1862130 ?auto_1862142 ) ) ( not ( = ?auto_1862130 ?auto_1862145 ) ) ( not ( = ?auto_1862127 ?auto_1862131 ) ) ( not ( = ?auto_1862127 ?auto_1862133 ) ) ( not ( = ?auto_1862127 ?auto_1862132 ) ) ( not ( = ?auto_1862127 ?auto_1862134 ) ) ( not ( = ?auto_1862127 ?auto_1862135 ) ) ( not ( = ?auto_1862127 ?auto_1862136 ) ) ( not ( = ?auto_1862127 ?auto_1862137 ) ) ( not ( = ?auto_1862127 ?auto_1862138 ) ) ( not ( = ?auto_1862127 ?auto_1862142 ) ) ( not ( = ?auto_1862127 ?auto_1862145 ) ) ( not ( = ?auto_1862131 ?auto_1862133 ) ) ( not ( = ?auto_1862131 ?auto_1862132 ) ) ( not ( = ?auto_1862131 ?auto_1862134 ) ) ( not ( = ?auto_1862131 ?auto_1862135 ) ) ( not ( = ?auto_1862131 ?auto_1862136 ) ) ( not ( = ?auto_1862131 ?auto_1862137 ) ) ( not ( = ?auto_1862131 ?auto_1862138 ) ) ( not ( = ?auto_1862131 ?auto_1862142 ) ) ( not ( = ?auto_1862131 ?auto_1862145 ) ) ( not ( = ?auto_1862133 ?auto_1862132 ) ) ( not ( = ?auto_1862133 ?auto_1862134 ) ) ( not ( = ?auto_1862133 ?auto_1862135 ) ) ( not ( = ?auto_1862133 ?auto_1862136 ) ) ( not ( = ?auto_1862133 ?auto_1862137 ) ) ( not ( = ?auto_1862133 ?auto_1862138 ) ) ( not ( = ?auto_1862133 ?auto_1862142 ) ) ( not ( = ?auto_1862133 ?auto_1862145 ) ) ( not ( = ?auto_1862132 ?auto_1862134 ) ) ( not ( = ?auto_1862132 ?auto_1862135 ) ) ( not ( = ?auto_1862132 ?auto_1862136 ) ) ( not ( = ?auto_1862132 ?auto_1862137 ) ) ( not ( = ?auto_1862132 ?auto_1862138 ) ) ( not ( = ?auto_1862132 ?auto_1862142 ) ) ( not ( = ?auto_1862132 ?auto_1862145 ) ) ( not ( = ?auto_1862134 ?auto_1862135 ) ) ( not ( = ?auto_1862134 ?auto_1862136 ) ) ( not ( = ?auto_1862134 ?auto_1862137 ) ) ( not ( = ?auto_1862134 ?auto_1862138 ) ) ( not ( = ?auto_1862134 ?auto_1862142 ) ) ( not ( = ?auto_1862134 ?auto_1862145 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1862136 ?auto_1862137 ?auto_1862138 )
      ( MAKE-11CRATE-VERIFY ?auto_1862128 ?auto_1862129 ?auto_1862130 ?auto_1862127 ?auto_1862131 ?auto_1862133 ?auto_1862132 ?auto_1862134 ?auto_1862135 ?auto_1862136 ?auto_1862137 ?auto_1862138 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1862147 - SURFACE
      ?auto_1862148 - SURFACE
      ?auto_1862149 - SURFACE
      ?auto_1862146 - SURFACE
      ?auto_1862150 - SURFACE
      ?auto_1862152 - SURFACE
      ?auto_1862151 - SURFACE
      ?auto_1862153 - SURFACE
      ?auto_1862154 - SURFACE
      ?auto_1862155 - SURFACE
      ?auto_1862156 - SURFACE
      ?auto_1862157 - SURFACE
      ?auto_1862158 - SURFACE
    )
    :vars
    (
      ?auto_1862159 - HOIST
      ?auto_1862163 - PLACE
      ?auto_1862161 - PLACE
      ?auto_1862160 - HOIST
      ?auto_1862162 - SURFACE
      ?auto_1862165 - SURFACE
      ?auto_1862164 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1862159 ?auto_1862163 ) ( IS-CRATE ?auto_1862158 ) ( not ( = ?auto_1862157 ?auto_1862158 ) ) ( not ( = ?auto_1862156 ?auto_1862157 ) ) ( not ( = ?auto_1862156 ?auto_1862158 ) ) ( not ( = ?auto_1862161 ?auto_1862163 ) ) ( HOIST-AT ?auto_1862160 ?auto_1862161 ) ( not ( = ?auto_1862159 ?auto_1862160 ) ) ( SURFACE-AT ?auto_1862158 ?auto_1862161 ) ( ON ?auto_1862158 ?auto_1862162 ) ( CLEAR ?auto_1862158 ) ( not ( = ?auto_1862157 ?auto_1862162 ) ) ( not ( = ?auto_1862158 ?auto_1862162 ) ) ( not ( = ?auto_1862156 ?auto_1862162 ) ) ( IS-CRATE ?auto_1862157 ) ( AVAILABLE ?auto_1862160 ) ( SURFACE-AT ?auto_1862157 ?auto_1862161 ) ( ON ?auto_1862157 ?auto_1862165 ) ( CLEAR ?auto_1862157 ) ( not ( = ?auto_1862157 ?auto_1862165 ) ) ( not ( = ?auto_1862158 ?auto_1862165 ) ) ( not ( = ?auto_1862156 ?auto_1862165 ) ) ( not ( = ?auto_1862162 ?auto_1862165 ) ) ( TRUCK-AT ?auto_1862164 ?auto_1862163 ) ( SURFACE-AT ?auto_1862155 ?auto_1862163 ) ( CLEAR ?auto_1862155 ) ( LIFTING ?auto_1862159 ?auto_1862156 ) ( IS-CRATE ?auto_1862156 ) ( not ( = ?auto_1862155 ?auto_1862156 ) ) ( not ( = ?auto_1862157 ?auto_1862155 ) ) ( not ( = ?auto_1862158 ?auto_1862155 ) ) ( not ( = ?auto_1862162 ?auto_1862155 ) ) ( not ( = ?auto_1862165 ?auto_1862155 ) ) ( ON ?auto_1862148 ?auto_1862147 ) ( ON ?auto_1862149 ?auto_1862148 ) ( ON ?auto_1862146 ?auto_1862149 ) ( ON ?auto_1862150 ?auto_1862146 ) ( ON ?auto_1862152 ?auto_1862150 ) ( ON ?auto_1862151 ?auto_1862152 ) ( ON ?auto_1862153 ?auto_1862151 ) ( ON ?auto_1862154 ?auto_1862153 ) ( ON ?auto_1862155 ?auto_1862154 ) ( not ( = ?auto_1862147 ?auto_1862148 ) ) ( not ( = ?auto_1862147 ?auto_1862149 ) ) ( not ( = ?auto_1862147 ?auto_1862146 ) ) ( not ( = ?auto_1862147 ?auto_1862150 ) ) ( not ( = ?auto_1862147 ?auto_1862152 ) ) ( not ( = ?auto_1862147 ?auto_1862151 ) ) ( not ( = ?auto_1862147 ?auto_1862153 ) ) ( not ( = ?auto_1862147 ?auto_1862154 ) ) ( not ( = ?auto_1862147 ?auto_1862155 ) ) ( not ( = ?auto_1862147 ?auto_1862156 ) ) ( not ( = ?auto_1862147 ?auto_1862157 ) ) ( not ( = ?auto_1862147 ?auto_1862158 ) ) ( not ( = ?auto_1862147 ?auto_1862162 ) ) ( not ( = ?auto_1862147 ?auto_1862165 ) ) ( not ( = ?auto_1862148 ?auto_1862149 ) ) ( not ( = ?auto_1862148 ?auto_1862146 ) ) ( not ( = ?auto_1862148 ?auto_1862150 ) ) ( not ( = ?auto_1862148 ?auto_1862152 ) ) ( not ( = ?auto_1862148 ?auto_1862151 ) ) ( not ( = ?auto_1862148 ?auto_1862153 ) ) ( not ( = ?auto_1862148 ?auto_1862154 ) ) ( not ( = ?auto_1862148 ?auto_1862155 ) ) ( not ( = ?auto_1862148 ?auto_1862156 ) ) ( not ( = ?auto_1862148 ?auto_1862157 ) ) ( not ( = ?auto_1862148 ?auto_1862158 ) ) ( not ( = ?auto_1862148 ?auto_1862162 ) ) ( not ( = ?auto_1862148 ?auto_1862165 ) ) ( not ( = ?auto_1862149 ?auto_1862146 ) ) ( not ( = ?auto_1862149 ?auto_1862150 ) ) ( not ( = ?auto_1862149 ?auto_1862152 ) ) ( not ( = ?auto_1862149 ?auto_1862151 ) ) ( not ( = ?auto_1862149 ?auto_1862153 ) ) ( not ( = ?auto_1862149 ?auto_1862154 ) ) ( not ( = ?auto_1862149 ?auto_1862155 ) ) ( not ( = ?auto_1862149 ?auto_1862156 ) ) ( not ( = ?auto_1862149 ?auto_1862157 ) ) ( not ( = ?auto_1862149 ?auto_1862158 ) ) ( not ( = ?auto_1862149 ?auto_1862162 ) ) ( not ( = ?auto_1862149 ?auto_1862165 ) ) ( not ( = ?auto_1862146 ?auto_1862150 ) ) ( not ( = ?auto_1862146 ?auto_1862152 ) ) ( not ( = ?auto_1862146 ?auto_1862151 ) ) ( not ( = ?auto_1862146 ?auto_1862153 ) ) ( not ( = ?auto_1862146 ?auto_1862154 ) ) ( not ( = ?auto_1862146 ?auto_1862155 ) ) ( not ( = ?auto_1862146 ?auto_1862156 ) ) ( not ( = ?auto_1862146 ?auto_1862157 ) ) ( not ( = ?auto_1862146 ?auto_1862158 ) ) ( not ( = ?auto_1862146 ?auto_1862162 ) ) ( not ( = ?auto_1862146 ?auto_1862165 ) ) ( not ( = ?auto_1862150 ?auto_1862152 ) ) ( not ( = ?auto_1862150 ?auto_1862151 ) ) ( not ( = ?auto_1862150 ?auto_1862153 ) ) ( not ( = ?auto_1862150 ?auto_1862154 ) ) ( not ( = ?auto_1862150 ?auto_1862155 ) ) ( not ( = ?auto_1862150 ?auto_1862156 ) ) ( not ( = ?auto_1862150 ?auto_1862157 ) ) ( not ( = ?auto_1862150 ?auto_1862158 ) ) ( not ( = ?auto_1862150 ?auto_1862162 ) ) ( not ( = ?auto_1862150 ?auto_1862165 ) ) ( not ( = ?auto_1862152 ?auto_1862151 ) ) ( not ( = ?auto_1862152 ?auto_1862153 ) ) ( not ( = ?auto_1862152 ?auto_1862154 ) ) ( not ( = ?auto_1862152 ?auto_1862155 ) ) ( not ( = ?auto_1862152 ?auto_1862156 ) ) ( not ( = ?auto_1862152 ?auto_1862157 ) ) ( not ( = ?auto_1862152 ?auto_1862158 ) ) ( not ( = ?auto_1862152 ?auto_1862162 ) ) ( not ( = ?auto_1862152 ?auto_1862165 ) ) ( not ( = ?auto_1862151 ?auto_1862153 ) ) ( not ( = ?auto_1862151 ?auto_1862154 ) ) ( not ( = ?auto_1862151 ?auto_1862155 ) ) ( not ( = ?auto_1862151 ?auto_1862156 ) ) ( not ( = ?auto_1862151 ?auto_1862157 ) ) ( not ( = ?auto_1862151 ?auto_1862158 ) ) ( not ( = ?auto_1862151 ?auto_1862162 ) ) ( not ( = ?auto_1862151 ?auto_1862165 ) ) ( not ( = ?auto_1862153 ?auto_1862154 ) ) ( not ( = ?auto_1862153 ?auto_1862155 ) ) ( not ( = ?auto_1862153 ?auto_1862156 ) ) ( not ( = ?auto_1862153 ?auto_1862157 ) ) ( not ( = ?auto_1862153 ?auto_1862158 ) ) ( not ( = ?auto_1862153 ?auto_1862162 ) ) ( not ( = ?auto_1862153 ?auto_1862165 ) ) ( not ( = ?auto_1862154 ?auto_1862155 ) ) ( not ( = ?auto_1862154 ?auto_1862156 ) ) ( not ( = ?auto_1862154 ?auto_1862157 ) ) ( not ( = ?auto_1862154 ?auto_1862158 ) ) ( not ( = ?auto_1862154 ?auto_1862162 ) ) ( not ( = ?auto_1862154 ?auto_1862165 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1862156 ?auto_1862157 ?auto_1862158 )
      ( MAKE-12CRATE-VERIFY ?auto_1862147 ?auto_1862148 ?auto_1862149 ?auto_1862146 ?auto_1862150 ?auto_1862152 ?auto_1862151 ?auto_1862153 ?auto_1862154 ?auto_1862155 ?auto_1862156 ?auto_1862157 ?auto_1862158 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1862167 - SURFACE
      ?auto_1862168 - SURFACE
      ?auto_1862169 - SURFACE
      ?auto_1862166 - SURFACE
      ?auto_1862170 - SURFACE
      ?auto_1862172 - SURFACE
      ?auto_1862171 - SURFACE
      ?auto_1862173 - SURFACE
      ?auto_1862174 - SURFACE
      ?auto_1862175 - SURFACE
      ?auto_1862176 - SURFACE
      ?auto_1862177 - SURFACE
      ?auto_1862178 - SURFACE
      ?auto_1862179 - SURFACE
    )
    :vars
    (
      ?auto_1862180 - HOIST
      ?auto_1862184 - PLACE
      ?auto_1862182 - PLACE
      ?auto_1862181 - HOIST
      ?auto_1862183 - SURFACE
      ?auto_1862186 - SURFACE
      ?auto_1862185 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1862180 ?auto_1862184 ) ( IS-CRATE ?auto_1862179 ) ( not ( = ?auto_1862178 ?auto_1862179 ) ) ( not ( = ?auto_1862177 ?auto_1862178 ) ) ( not ( = ?auto_1862177 ?auto_1862179 ) ) ( not ( = ?auto_1862182 ?auto_1862184 ) ) ( HOIST-AT ?auto_1862181 ?auto_1862182 ) ( not ( = ?auto_1862180 ?auto_1862181 ) ) ( SURFACE-AT ?auto_1862179 ?auto_1862182 ) ( ON ?auto_1862179 ?auto_1862183 ) ( CLEAR ?auto_1862179 ) ( not ( = ?auto_1862178 ?auto_1862183 ) ) ( not ( = ?auto_1862179 ?auto_1862183 ) ) ( not ( = ?auto_1862177 ?auto_1862183 ) ) ( IS-CRATE ?auto_1862178 ) ( AVAILABLE ?auto_1862181 ) ( SURFACE-AT ?auto_1862178 ?auto_1862182 ) ( ON ?auto_1862178 ?auto_1862186 ) ( CLEAR ?auto_1862178 ) ( not ( = ?auto_1862178 ?auto_1862186 ) ) ( not ( = ?auto_1862179 ?auto_1862186 ) ) ( not ( = ?auto_1862177 ?auto_1862186 ) ) ( not ( = ?auto_1862183 ?auto_1862186 ) ) ( TRUCK-AT ?auto_1862185 ?auto_1862184 ) ( SURFACE-AT ?auto_1862176 ?auto_1862184 ) ( CLEAR ?auto_1862176 ) ( LIFTING ?auto_1862180 ?auto_1862177 ) ( IS-CRATE ?auto_1862177 ) ( not ( = ?auto_1862176 ?auto_1862177 ) ) ( not ( = ?auto_1862178 ?auto_1862176 ) ) ( not ( = ?auto_1862179 ?auto_1862176 ) ) ( not ( = ?auto_1862183 ?auto_1862176 ) ) ( not ( = ?auto_1862186 ?auto_1862176 ) ) ( ON ?auto_1862168 ?auto_1862167 ) ( ON ?auto_1862169 ?auto_1862168 ) ( ON ?auto_1862166 ?auto_1862169 ) ( ON ?auto_1862170 ?auto_1862166 ) ( ON ?auto_1862172 ?auto_1862170 ) ( ON ?auto_1862171 ?auto_1862172 ) ( ON ?auto_1862173 ?auto_1862171 ) ( ON ?auto_1862174 ?auto_1862173 ) ( ON ?auto_1862175 ?auto_1862174 ) ( ON ?auto_1862176 ?auto_1862175 ) ( not ( = ?auto_1862167 ?auto_1862168 ) ) ( not ( = ?auto_1862167 ?auto_1862169 ) ) ( not ( = ?auto_1862167 ?auto_1862166 ) ) ( not ( = ?auto_1862167 ?auto_1862170 ) ) ( not ( = ?auto_1862167 ?auto_1862172 ) ) ( not ( = ?auto_1862167 ?auto_1862171 ) ) ( not ( = ?auto_1862167 ?auto_1862173 ) ) ( not ( = ?auto_1862167 ?auto_1862174 ) ) ( not ( = ?auto_1862167 ?auto_1862175 ) ) ( not ( = ?auto_1862167 ?auto_1862176 ) ) ( not ( = ?auto_1862167 ?auto_1862177 ) ) ( not ( = ?auto_1862167 ?auto_1862178 ) ) ( not ( = ?auto_1862167 ?auto_1862179 ) ) ( not ( = ?auto_1862167 ?auto_1862183 ) ) ( not ( = ?auto_1862167 ?auto_1862186 ) ) ( not ( = ?auto_1862168 ?auto_1862169 ) ) ( not ( = ?auto_1862168 ?auto_1862166 ) ) ( not ( = ?auto_1862168 ?auto_1862170 ) ) ( not ( = ?auto_1862168 ?auto_1862172 ) ) ( not ( = ?auto_1862168 ?auto_1862171 ) ) ( not ( = ?auto_1862168 ?auto_1862173 ) ) ( not ( = ?auto_1862168 ?auto_1862174 ) ) ( not ( = ?auto_1862168 ?auto_1862175 ) ) ( not ( = ?auto_1862168 ?auto_1862176 ) ) ( not ( = ?auto_1862168 ?auto_1862177 ) ) ( not ( = ?auto_1862168 ?auto_1862178 ) ) ( not ( = ?auto_1862168 ?auto_1862179 ) ) ( not ( = ?auto_1862168 ?auto_1862183 ) ) ( not ( = ?auto_1862168 ?auto_1862186 ) ) ( not ( = ?auto_1862169 ?auto_1862166 ) ) ( not ( = ?auto_1862169 ?auto_1862170 ) ) ( not ( = ?auto_1862169 ?auto_1862172 ) ) ( not ( = ?auto_1862169 ?auto_1862171 ) ) ( not ( = ?auto_1862169 ?auto_1862173 ) ) ( not ( = ?auto_1862169 ?auto_1862174 ) ) ( not ( = ?auto_1862169 ?auto_1862175 ) ) ( not ( = ?auto_1862169 ?auto_1862176 ) ) ( not ( = ?auto_1862169 ?auto_1862177 ) ) ( not ( = ?auto_1862169 ?auto_1862178 ) ) ( not ( = ?auto_1862169 ?auto_1862179 ) ) ( not ( = ?auto_1862169 ?auto_1862183 ) ) ( not ( = ?auto_1862169 ?auto_1862186 ) ) ( not ( = ?auto_1862166 ?auto_1862170 ) ) ( not ( = ?auto_1862166 ?auto_1862172 ) ) ( not ( = ?auto_1862166 ?auto_1862171 ) ) ( not ( = ?auto_1862166 ?auto_1862173 ) ) ( not ( = ?auto_1862166 ?auto_1862174 ) ) ( not ( = ?auto_1862166 ?auto_1862175 ) ) ( not ( = ?auto_1862166 ?auto_1862176 ) ) ( not ( = ?auto_1862166 ?auto_1862177 ) ) ( not ( = ?auto_1862166 ?auto_1862178 ) ) ( not ( = ?auto_1862166 ?auto_1862179 ) ) ( not ( = ?auto_1862166 ?auto_1862183 ) ) ( not ( = ?auto_1862166 ?auto_1862186 ) ) ( not ( = ?auto_1862170 ?auto_1862172 ) ) ( not ( = ?auto_1862170 ?auto_1862171 ) ) ( not ( = ?auto_1862170 ?auto_1862173 ) ) ( not ( = ?auto_1862170 ?auto_1862174 ) ) ( not ( = ?auto_1862170 ?auto_1862175 ) ) ( not ( = ?auto_1862170 ?auto_1862176 ) ) ( not ( = ?auto_1862170 ?auto_1862177 ) ) ( not ( = ?auto_1862170 ?auto_1862178 ) ) ( not ( = ?auto_1862170 ?auto_1862179 ) ) ( not ( = ?auto_1862170 ?auto_1862183 ) ) ( not ( = ?auto_1862170 ?auto_1862186 ) ) ( not ( = ?auto_1862172 ?auto_1862171 ) ) ( not ( = ?auto_1862172 ?auto_1862173 ) ) ( not ( = ?auto_1862172 ?auto_1862174 ) ) ( not ( = ?auto_1862172 ?auto_1862175 ) ) ( not ( = ?auto_1862172 ?auto_1862176 ) ) ( not ( = ?auto_1862172 ?auto_1862177 ) ) ( not ( = ?auto_1862172 ?auto_1862178 ) ) ( not ( = ?auto_1862172 ?auto_1862179 ) ) ( not ( = ?auto_1862172 ?auto_1862183 ) ) ( not ( = ?auto_1862172 ?auto_1862186 ) ) ( not ( = ?auto_1862171 ?auto_1862173 ) ) ( not ( = ?auto_1862171 ?auto_1862174 ) ) ( not ( = ?auto_1862171 ?auto_1862175 ) ) ( not ( = ?auto_1862171 ?auto_1862176 ) ) ( not ( = ?auto_1862171 ?auto_1862177 ) ) ( not ( = ?auto_1862171 ?auto_1862178 ) ) ( not ( = ?auto_1862171 ?auto_1862179 ) ) ( not ( = ?auto_1862171 ?auto_1862183 ) ) ( not ( = ?auto_1862171 ?auto_1862186 ) ) ( not ( = ?auto_1862173 ?auto_1862174 ) ) ( not ( = ?auto_1862173 ?auto_1862175 ) ) ( not ( = ?auto_1862173 ?auto_1862176 ) ) ( not ( = ?auto_1862173 ?auto_1862177 ) ) ( not ( = ?auto_1862173 ?auto_1862178 ) ) ( not ( = ?auto_1862173 ?auto_1862179 ) ) ( not ( = ?auto_1862173 ?auto_1862183 ) ) ( not ( = ?auto_1862173 ?auto_1862186 ) ) ( not ( = ?auto_1862174 ?auto_1862175 ) ) ( not ( = ?auto_1862174 ?auto_1862176 ) ) ( not ( = ?auto_1862174 ?auto_1862177 ) ) ( not ( = ?auto_1862174 ?auto_1862178 ) ) ( not ( = ?auto_1862174 ?auto_1862179 ) ) ( not ( = ?auto_1862174 ?auto_1862183 ) ) ( not ( = ?auto_1862174 ?auto_1862186 ) ) ( not ( = ?auto_1862175 ?auto_1862176 ) ) ( not ( = ?auto_1862175 ?auto_1862177 ) ) ( not ( = ?auto_1862175 ?auto_1862178 ) ) ( not ( = ?auto_1862175 ?auto_1862179 ) ) ( not ( = ?auto_1862175 ?auto_1862183 ) ) ( not ( = ?auto_1862175 ?auto_1862186 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1862177 ?auto_1862178 ?auto_1862179 )
      ( MAKE-13CRATE-VERIFY ?auto_1862167 ?auto_1862168 ?auto_1862169 ?auto_1862166 ?auto_1862170 ?auto_1862172 ?auto_1862171 ?auto_1862173 ?auto_1862174 ?auto_1862175 ?auto_1862176 ?auto_1862177 ?auto_1862178 ?auto_1862179 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1866034 - SURFACE
      ?auto_1866035 - SURFACE
    )
    :vars
    (
      ?auto_1866037 - HOIST
      ?auto_1866041 - PLACE
      ?auto_1866039 - SURFACE
      ?auto_1866036 - PLACE
      ?auto_1866043 - HOIST
      ?auto_1866040 - SURFACE
      ?auto_1866042 - TRUCK
      ?auto_1866038 - SURFACE
      ?auto_1866044 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1866037 ?auto_1866041 ) ( IS-CRATE ?auto_1866035 ) ( not ( = ?auto_1866034 ?auto_1866035 ) ) ( not ( = ?auto_1866039 ?auto_1866034 ) ) ( not ( = ?auto_1866039 ?auto_1866035 ) ) ( not ( = ?auto_1866036 ?auto_1866041 ) ) ( HOIST-AT ?auto_1866043 ?auto_1866036 ) ( not ( = ?auto_1866037 ?auto_1866043 ) ) ( SURFACE-AT ?auto_1866035 ?auto_1866036 ) ( ON ?auto_1866035 ?auto_1866040 ) ( CLEAR ?auto_1866035 ) ( not ( = ?auto_1866034 ?auto_1866040 ) ) ( not ( = ?auto_1866035 ?auto_1866040 ) ) ( not ( = ?auto_1866039 ?auto_1866040 ) ) ( SURFACE-AT ?auto_1866039 ?auto_1866041 ) ( CLEAR ?auto_1866039 ) ( IS-CRATE ?auto_1866034 ) ( AVAILABLE ?auto_1866037 ) ( TRUCK-AT ?auto_1866042 ?auto_1866036 ) ( SURFACE-AT ?auto_1866034 ?auto_1866036 ) ( ON ?auto_1866034 ?auto_1866038 ) ( CLEAR ?auto_1866034 ) ( not ( = ?auto_1866034 ?auto_1866038 ) ) ( not ( = ?auto_1866035 ?auto_1866038 ) ) ( not ( = ?auto_1866039 ?auto_1866038 ) ) ( not ( = ?auto_1866040 ?auto_1866038 ) ) ( LIFTING ?auto_1866043 ?auto_1866044 ) ( IS-CRATE ?auto_1866044 ) ( not ( = ?auto_1866034 ?auto_1866044 ) ) ( not ( = ?auto_1866035 ?auto_1866044 ) ) ( not ( = ?auto_1866039 ?auto_1866044 ) ) ( not ( = ?auto_1866040 ?auto_1866044 ) ) ( not ( = ?auto_1866038 ?auto_1866044 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1866043 ?auto_1866044 ?auto_1866042 ?auto_1866036 )
      ( MAKE-2CRATE ?auto_1866039 ?auto_1866034 ?auto_1866035 )
      ( MAKE-1CRATE-VERIFY ?auto_1866034 ?auto_1866035 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1866045 - SURFACE
      ?auto_1866046 - SURFACE
      ?auto_1866047 - SURFACE
    )
    :vars
    (
      ?auto_1866053 - HOIST
      ?auto_1866052 - PLACE
      ?auto_1866049 - PLACE
      ?auto_1866048 - HOIST
      ?auto_1866054 - SURFACE
      ?auto_1866051 - TRUCK
      ?auto_1866050 - SURFACE
      ?auto_1866055 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1866053 ?auto_1866052 ) ( IS-CRATE ?auto_1866047 ) ( not ( = ?auto_1866046 ?auto_1866047 ) ) ( not ( = ?auto_1866045 ?auto_1866046 ) ) ( not ( = ?auto_1866045 ?auto_1866047 ) ) ( not ( = ?auto_1866049 ?auto_1866052 ) ) ( HOIST-AT ?auto_1866048 ?auto_1866049 ) ( not ( = ?auto_1866053 ?auto_1866048 ) ) ( SURFACE-AT ?auto_1866047 ?auto_1866049 ) ( ON ?auto_1866047 ?auto_1866054 ) ( CLEAR ?auto_1866047 ) ( not ( = ?auto_1866046 ?auto_1866054 ) ) ( not ( = ?auto_1866047 ?auto_1866054 ) ) ( not ( = ?auto_1866045 ?auto_1866054 ) ) ( SURFACE-AT ?auto_1866045 ?auto_1866052 ) ( CLEAR ?auto_1866045 ) ( IS-CRATE ?auto_1866046 ) ( AVAILABLE ?auto_1866053 ) ( TRUCK-AT ?auto_1866051 ?auto_1866049 ) ( SURFACE-AT ?auto_1866046 ?auto_1866049 ) ( ON ?auto_1866046 ?auto_1866050 ) ( CLEAR ?auto_1866046 ) ( not ( = ?auto_1866046 ?auto_1866050 ) ) ( not ( = ?auto_1866047 ?auto_1866050 ) ) ( not ( = ?auto_1866045 ?auto_1866050 ) ) ( not ( = ?auto_1866054 ?auto_1866050 ) ) ( LIFTING ?auto_1866048 ?auto_1866055 ) ( IS-CRATE ?auto_1866055 ) ( not ( = ?auto_1866046 ?auto_1866055 ) ) ( not ( = ?auto_1866047 ?auto_1866055 ) ) ( not ( = ?auto_1866045 ?auto_1866055 ) ) ( not ( = ?auto_1866054 ?auto_1866055 ) ) ( not ( = ?auto_1866050 ?auto_1866055 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1866046 ?auto_1866047 )
      ( MAKE-2CRATE-VERIFY ?auto_1866045 ?auto_1866046 ?auto_1866047 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1875247 - SURFACE
      ?auto_1875248 - SURFACE
      ?auto_1875249 - SURFACE
      ?auto_1875246 - SURFACE
      ?auto_1875250 - SURFACE
      ?auto_1875252 - SURFACE
      ?auto_1875251 - SURFACE
      ?auto_1875253 - SURFACE
      ?auto_1875254 - SURFACE
      ?auto_1875255 - SURFACE
      ?auto_1875256 - SURFACE
      ?auto_1875257 - SURFACE
      ?auto_1875258 - SURFACE
      ?auto_1875259 - SURFACE
      ?auto_1875260 - SURFACE
    )
    :vars
    (
      ?auto_1875261 - HOIST
      ?auto_1875262 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1875261 ?auto_1875262 ) ( SURFACE-AT ?auto_1875259 ?auto_1875262 ) ( CLEAR ?auto_1875259 ) ( LIFTING ?auto_1875261 ?auto_1875260 ) ( IS-CRATE ?auto_1875260 ) ( not ( = ?auto_1875259 ?auto_1875260 ) ) ( ON ?auto_1875248 ?auto_1875247 ) ( ON ?auto_1875249 ?auto_1875248 ) ( ON ?auto_1875246 ?auto_1875249 ) ( ON ?auto_1875250 ?auto_1875246 ) ( ON ?auto_1875252 ?auto_1875250 ) ( ON ?auto_1875251 ?auto_1875252 ) ( ON ?auto_1875253 ?auto_1875251 ) ( ON ?auto_1875254 ?auto_1875253 ) ( ON ?auto_1875255 ?auto_1875254 ) ( ON ?auto_1875256 ?auto_1875255 ) ( ON ?auto_1875257 ?auto_1875256 ) ( ON ?auto_1875258 ?auto_1875257 ) ( ON ?auto_1875259 ?auto_1875258 ) ( not ( = ?auto_1875247 ?auto_1875248 ) ) ( not ( = ?auto_1875247 ?auto_1875249 ) ) ( not ( = ?auto_1875247 ?auto_1875246 ) ) ( not ( = ?auto_1875247 ?auto_1875250 ) ) ( not ( = ?auto_1875247 ?auto_1875252 ) ) ( not ( = ?auto_1875247 ?auto_1875251 ) ) ( not ( = ?auto_1875247 ?auto_1875253 ) ) ( not ( = ?auto_1875247 ?auto_1875254 ) ) ( not ( = ?auto_1875247 ?auto_1875255 ) ) ( not ( = ?auto_1875247 ?auto_1875256 ) ) ( not ( = ?auto_1875247 ?auto_1875257 ) ) ( not ( = ?auto_1875247 ?auto_1875258 ) ) ( not ( = ?auto_1875247 ?auto_1875259 ) ) ( not ( = ?auto_1875247 ?auto_1875260 ) ) ( not ( = ?auto_1875248 ?auto_1875249 ) ) ( not ( = ?auto_1875248 ?auto_1875246 ) ) ( not ( = ?auto_1875248 ?auto_1875250 ) ) ( not ( = ?auto_1875248 ?auto_1875252 ) ) ( not ( = ?auto_1875248 ?auto_1875251 ) ) ( not ( = ?auto_1875248 ?auto_1875253 ) ) ( not ( = ?auto_1875248 ?auto_1875254 ) ) ( not ( = ?auto_1875248 ?auto_1875255 ) ) ( not ( = ?auto_1875248 ?auto_1875256 ) ) ( not ( = ?auto_1875248 ?auto_1875257 ) ) ( not ( = ?auto_1875248 ?auto_1875258 ) ) ( not ( = ?auto_1875248 ?auto_1875259 ) ) ( not ( = ?auto_1875248 ?auto_1875260 ) ) ( not ( = ?auto_1875249 ?auto_1875246 ) ) ( not ( = ?auto_1875249 ?auto_1875250 ) ) ( not ( = ?auto_1875249 ?auto_1875252 ) ) ( not ( = ?auto_1875249 ?auto_1875251 ) ) ( not ( = ?auto_1875249 ?auto_1875253 ) ) ( not ( = ?auto_1875249 ?auto_1875254 ) ) ( not ( = ?auto_1875249 ?auto_1875255 ) ) ( not ( = ?auto_1875249 ?auto_1875256 ) ) ( not ( = ?auto_1875249 ?auto_1875257 ) ) ( not ( = ?auto_1875249 ?auto_1875258 ) ) ( not ( = ?auto_1875249 ?auto_1875259 ) ) ( not ( = ?auto_1875249 ?auto_1875260 ) ) ( not ( = ?auto_1875246 ?auto_1875250 ) ) ( not ( = ?auto_1875246 ?auto_1875252 ) ) ( not ( = ?auto_1875246 ?auto_1875251 ) ) ( not ( = ?auto_1875246 ?auto_1875253 ) ) ( not ( = ?auto_1875246 ?auto_1875254 ) ) ( not ( = ?auto_1875246 ?auto_1875255 ) ) ( not ( = ?auto_1875246 ?auto_1875256 ) ) ( not ( = ?auto_1875246 ?auto_1875257 ) ) ( not ( = ?auto_1875246 ?auto_1875258 ) ) ( not ( = ?auto_1875246 ?auto_1875259 ) ) ( not ( = ?auto_1875246 ?auto_1875260 ) ) ( not ( = ?auto_1875250 ?auto_1875252 ) ) ( not ( = ?auto_1875250 ?auto_1875251 ) ) ( not ( = ?auto_1875250 ?auto_1875253 ) ) ( not ( = ?auto_1875250 ?auto_1875254 ) ) ( not ( = ?auto_1875250 ?auto_1875255 ) ) ( not ( = ?auto_1875250 ?auto_1875256 ) ) ( not ( = ?auto_1875250 ?auto_1875257 ) ) ( not ( = ?auto_1875250 ?auto_1875258 ) ) ( not ( = ?auto_1875250 ?auto_1875259 ) ) ( not ( = ?auto_1875250 ?auto_1875260 ) ) ( not ( = ?auto_1875252 ?auto_1875251 ) ) ( not ( = ?auto_1875252 ?auto_1875253 ) ) ( not ( = ?auto_1875252 ?auto_1875254 ) ) ( not ( = ?auto_1875252 ?auto_1875255 ) ) ( not ( = ?auto_1875252 ?auto_1875256 ) ) ( not ( = ?auto_1875252 ?auto_1875257 ) ) ( not ( = ?auto_1875252 ?auto_1875258 ) ) ( not ( = ?auto_1875252 ?auto_1875259 ) ) ( not ( = ?auto_1875252 ?auto_1875260 ) ) ( not ( = ?auto_1875251 ?auto_1875253 ) ) ( not ( = ?auto_1875251 ?auto_1875254 ) ) ( not ( = ?auto_1875251 ?auto_1875255 ) ) ( not ( = ?auto_1875251 ?auto_1875256 ) ) ( not ( = ?auto_1875251 ?auto_1875257 ) ) ( not ( = ?auto_1875251 ?auto_1875258 ) ) ( not ( = ?auto_1875251 ?auto_1875259 ) ) ( not ( = ?auto_1875251 ?auto_1875260 ) ) ( not ( = ?auto_1875253 ?auto_1875254 ) ) ( not ( = ?auto_1875253 ?auto_1875255 ) ) ( not ( = ?auto_1875253 ?auto_1875256 ) ) ( not ( = ?auto_1875253 ?auto_1875257 ) ) ( not ( = ?auto_1875253 ?auto_1875258 ) ) ( not ( = ?auto_1875253 ?auto_1875259 ) ) ( not ( = ?auto_1875253 ?auto_1875260 ) ) ( not ( = ?auto_1875254 ?auto_1875255 ) ) ( not ( = ?auto_1875254 ?auto_1875256 ) ) ( not ( = ?auto_1875254 ?auto_1875257 ) ) ( not ( = ?auto_1875254 ?auto_1875258 ) ) ( not ( = ?auto_1875254 ?auto_1875259 ) ) ( not ( = ?auto_1875254 ?auto_1875260 ) ) ( not ( = ?auto_1875255 ?auto_1875256 ) ) ( not ( = ?auto_1875255 ?auto_1875257 ) ) ( not ( = ?auto_1875255 ?auto_1875258 ) ) ( not ( = ?auto_1875255 ?auto_1875259 ) ) ( not ( = ?auto_1875255 ?auto_1875260 ) ) ( not ( = ?auto_1875256 ?auto_1875257 ) ) ( not ( = ?auto_1875256 ?auto_1875258 ) ) ( not ( = ?auto_1875256 ?auto_1875259 ) ) ( not ( = ?auto_1875256 ?auto_1875260 ) ) ( not ( = ?auto_1875257 ?auto_1875258 ) ) ( not ( = ?auto_1875257 ?auto_1875259 ) ) ( not ( = ?auto_1875257 ?auto_1875260 ) ) ( not ( = ?auto_1875258 ?auto_1875259 ) ) ( not ( = ?auto_1875258 ?auto_1875260 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1875259 ?auto_1875260 )
      ( MAKE-14CRATE-VERIFY ?auto_1875247 ?auto_1875248 ?auto_1875249 ?auto_1875246 ?auto_1875250 ?auto_1875252 ?auto_1875251 ?auto_1875253 ?auto_1875254 ?auto_1875255 ?auto_1875256 ?auto_1875257 ?auto_1875258 ?auto_1875259 ?auto_1875260 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1875407 - SURFACE
      ?auto_1875408 - SURFACE
      ?auto_1875409 - SURFACE
      ?auto_1875406 - SURFACE
      ?auto_1875410 - SURFACE
      ?auto_1875412 - SURFACE
      ?auto_1875411 - SURFACE
      ?auto_1875413 - SURFACE
      ?auto_1875414 - SURFACE
      ?auto_1875415 - SURFACE
      ?auto_1875416 - SURFACE
      ?auto_1875417 - SURFACE
      ?auto_1875418 - SURFACE
      ?auto_1875419 - SURFACE
      ?auto_1875420 - SURFACE
    )
    :vars
    (
      ?auto_1875421 - HOIST
      ?auto_1875423 - PLACE
      ?auto_1875422 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1875421 ?auto_1875423 ) ( SURFACE-AT ?auto_1875419 ?auto_1875423 ) ( CLEAR ?auto_1875419 ) ( IS-CRATE ?auto_1875420 ) ( not ( = ?auto_1875419 ?auto_1875420 ) ) ( TRUCK-AT ?auto_1875422 ?auto_1875423 ) ( AVAILABLE ?auto_1875421 ) ( IN ?auto_1875420 ?auto_1875422 ) ( ON ?auto_1875419 ?auto_1875418 ) ( not ( = ?auto_1875418 ?auto_1875419 ) ) ( not ( = ?auto_1875418 ?auto_1875420 ) ) ( ON ?auto_1875408 ?auto_1875407 ) ( ON ?auto_1875409 ?auto_1875408 ) ( ON ?auto_1875406 ?auto_1875409 ) ( ON ?auto_1875410 ?auto_1875406 ) ( ON ?auto_1875412 ?auto_1875410 ) ( ON ?auto_1875411 ?auto_1875412 ) ( ON ?auto_1875413 ?auto_1875411 ) ( ON ?auto_1875414 ?auto_1875413 ) ( ON ?auto_1875415 ?auto_1875414 ) ( ON ?auto_1875416 ?auto_1875415 ) ( ON ?auto_1875417 ?auto_1875416 ) ( ON ?auto_1875418 ?auto_1875417 ) ( not ( = ?auto_1875407 ?auto_1875408 ) ) ( not ( = ?auto_1875407 ?auto_1875409 ) ) ( not ( = ?auto_1875407 ?auto_1875406 ) ) ( not ( = ?auto_1875407 ?auto_1875410 ) ) ( not ( = ?auto_1875407 ?auto_1875412 ) ) ( not ( = ?auto_1875407 ?auto_1875411 ) ) ( not ( = ?auto_1875407 ?auto_1875413 ) ) ( not ( = ?auto_1875407 ?auto_1875414 ) ) ( not ( = ?auto_1875407 ?auto_1875415 ) ) ( not ( = ?auto_1875407 ?auto_1875416 ) ) ( not ( = ?auto_1875407 ?auto_1875417 ) ) ( not ( = ?auto_1875407 ?auto_1875418 ) ) ( not ( = ?auto_1875407 ?auto_1875419 ) ) ( not ( = ?auto_1875407 ?auto_1875420 ) ) ( not ( = ?auto_1875408 ?auto_1875409 ) ) ( not ( = ?auto_1875408 ?auto_1875406 ) ) ( not ( = ?auto_1875408 ?auto_1875410 ) ) ( not ( = ?auto_1875408 ?auto_1875412 ) ) ( not ( = ?auto_1875408 ?auto_1875411 ) ) ( not ( = ?auto_1875408 ?auto_1875413 ) ) ( not ( = ?auto_1875408 ?auto_1875414 ) ) ( not ( = ?auto_1875408 ?auto_1875415 ) ) ( not ( = ?auto_1875408 ?auto_1875416 ) ) ( not ( = ?auto_1875408 ?auto_1875417 ) ) ( not ( = ?auto_1875408 ?auto_1875418 ) ) ( not ( = ?auto_1875408 ?auto_1875419 ) ) ( not ( = ?auto_1875408 ?auto_1875420 ) ) ( not ( = ?auto_1875409 ?auto_1875406 ) ) ( not ( = ?auto_1875409 ?auto_1875410 ) ) ( not ( = ?auto_1875409 ?auto_1875412 ) ) ( not ( = ?auto_1875409 ?auto_1875411 ) ) ( not ( = ?auto_1875409 ?auto_1875413 ) ) ( not ( = ?auto_1875409 ?auto_1875414 ) ) ( not ( = ?auto_1875409 ?auto_1875415 ) ) ( not ( = ?auto_1875409 ?auto_1875416 ) ) ( not ( = ?auto_1875409 ?auto_1875417 ) ) ( not ( = ?auto_1875409 ?auto_1875418 ) ) ( not ( = ?auto_1875409 ?auto_1875419 ) ) ( not ( = ?auto_1875409 ?auto_1875420 ) ) ( not ( = ?auto_1875406 ?auto_1875410 ) ) ( not ( = ?auto_1875406 ?auto_1875412 ) ) ( not ( = ?auto_1875406 ?auto_1875411 ) ) ( not ( = ?auto_1875406 ?auto_1875413 ) ) ( not ( = ?auto_1875406 ?auto_1875414 ) ) ( not ( = ?auto_1875406 ?auto_1875415 ) ) ( not ( = ?auto_1875406 ?auto_1875416 ) ) ( not ( = ?auto_1875406 ?auto_1875417 ) ) ( not ( = ?auto_1875406 ?auto_1875418 ) ) ( not ( = ?auto_1875406 ?auto_1875419 ) ) ( not ( = ?auto_1875406 ?auto_1875420 ) ) ( not ( = ?auto_1875410 ?auto_1875412 ) ) ( not ( = ?auto_1875410 ?auto_1875411 ) ) ( not ( = ?auto_1875410 ?auto_1875413 ) ) ( not ( = ?auto_1875410 ?auto_1875414 ) ) ( not ( = ?auto_1875410 ?auto_1875415 ) ) ( not ( = ?auto_1875410 ?auto_1875416 ) ) ( not ( = ?auto_1875410 ?auto_1875417 ) ) ( not ( = ?auto_1875410 ?auto_1875418 ) ) ( not ( = ?auto_1875410 ?auto_1875419 ) ) ( not ( = ?auto_1875410 ?auto_1875420 ) ) ( not ( = ?auto_1875412 ?auto_1875411 ) ) ( not ( = ?auto_1875412 ?auto_1875413 ) ) ( not ( = ?auto_1875412 ?auto_1875414 ) ) ( not ( = ?auto_1875412 ?auto_1875415 ) ) ( not ( = ?auto_1875412 ?auto_1875416 ) ) ( not ( = ?auto_1875412 ?auto_1875417 ) ) ( not ( = ?auto_1875412 ?auto_1875418 ) ) ( not ( = ?auto_1875412 ?auto_1875419 ) ) ( not ( = ?auto_1875412 ?auto_1875420 ) ) ( not ( = ?auto_1875411 ?auto_1875413 ) ) ( not ( = ?auto_1875411 ?auto_1875414 ) ) ( not ( = ?auto_1875411 ?auto_1875415 ) ) ( not ( = ?auto_1875411 ?auto_1875416 ) ) ( not ( = ?auto_1875411 ?auto_1875417 ) ) ( not ( = ?auto_1875411 ?auto_1875418 ) ) ( not ( = ?auto_1875411 ?auto_1875419 ) ) ( not ( = ?auto_1875411 ?auto_1875420 ) ) ( not ( = ?auto_1875413 ?auto_1875414 ) ) ( not ( = ?auto_1875413 ?auto_1875415 ) ) ( not ( = ?auto_1875413 ?auto_1875416 ) ) ( not ( = ?auto_1875413 ?auto_1875417 ) ) ( not ( = ?auto_1875413 ?auto_1875418 ) ) ( not ( = ?auto_1875413 ?auto_1875419 ) ) ( not ( = ?auto_1875413 ?auto_1875420 ) ) ( not ( = ?auto_1875414 ?auto_1875415 ) ) ( not ( = ?auto_1875414 ?auto_1875416 ) ) ( not ( = ?auto_1875414 ?auto_1875417 ) ) ( not ( = ?auto_1875414 ?auto_1875418 ) ) ( not ( = ?auto_1875414 ?auto_1875419 ) ) ( not ( = ?auto_1875414 ?auto_1875420 ) ) ( not ( = ?auto_1875415 ?auto_1875416 ) ) ( not ( = ?auto_1875415 ?auto_1875417 ) ) ( not ( = ?auto_1875415 ?auto_1875418 ) ) ( not ( = ?auto_1875415 ?auto_1875419 ) ) ( not ( = ?auto_1875415 ?auto_1875420 ) ) ( not ( = ?auto_1875416 ?auto_1875417 ) ) ( not ( = ?auto_1875416 ?auto_1875418 ) ) ( not ( = ?auto_1875416 ?auto_1875419 ) ) ( not ( = ?auto_1875416 ?auto_1875420 ) ) ( not ( = ?auto_1875417 ?auto_1875418 ) ) ( not ( = ?auto_1875417 ?auto_1875419 ) ) ( not ( = ?auto_1875417 ?auto_1875420 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1875418 ?auto_1875419 ?auto_1875420 )
      ( MAKE-14CRATE-VERIFY ?auto_1875407 ?auto_1875408 ?auto_1875409 ?auto_1875406 ?auto_1875410 ?auto_1875412 ?auto_1875411 ?auto_1875413 ?auto_1875414 ?auto_1875415 ?auto_1875416 ?auto_1875417 ?auto_1875418 ?auto_1875419 ?auto_1875420 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1875582 - SURFACE
      ?auto_1875583 - SURFACE
      ?auto_1875584 - SURFACE
      ?auto_1875581 - SURFACE
      ?auto_1875585 - SURFACE
      ?auto_1875587 - SURFACE
      ?auto_1875586 - SURFACE
      ?auto_1875588 - SURFACE
      ?auto_1875589 - SURFACE
      ?auto_1875590 - SURFACE
      ?auto_1875591 - SURFACE
      ?auto_1875592 - SURFACE
      ?auto_1875593 - SURFACE
      ?auto_1875594 - SURFACE
      ?auto_1875595 - SURFACE
    )
    :vars
    (
      ?auto_1875599 - HOIST
      ?auto_1875598 - PLACE
      ?auto_1875597 - TRUCK
      ?auto_1875596 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1875599 ?auto_1875598 ) ( SURFACE-AT ?auto_1875594 ?auto_1875598 ) ( CLEAR ?auto_1875594 ) ( IS-CRATE ?auto_1875595 ) ( not ( = ?auto_1875594 ?auto_1875595 ) ) ( AVAILABLE ?auto_1875599 ) ( IN ?auto_1875595 ?auto_1875597 ) ( ON ?auto_1875594 ?auto_1875593 ) ( not ( = ?auto_1875593 ?auto_1875594 ) ) ( not ( = ?auto_1875593 ?auto_1875595 ) ) ( TRUCK-AT ?auto_1875597 ?auto_1875596 ) ( not ( = ?auto_1875596 ?auto_1875598 ) ) ( ON ?auto_1875583 ?auto_1875582 ) ( ON ?auto_1875584 ?auto_1875583 ) ( ON ?auto_1875581 ?auto_1875584 ) ( ON ?auto_1875585 ?auto_1875581 ) ( ON ?auto_1875587 ?auto_1875585 ) ( ON ?auto_1875586 ?auto_1875587 ) ( ON ?auto_1875588 ?auto_1875586 ) ( ON ?auto_1875589 ?auto_1875588 ) ( ON ?auto_1875590 ?auto_1875589 ) ( ON ?auto_1875591 ?auto_1875590 ) ( ON ?auto_1875592 ?auto_1875591 ) ( ON ?auto_1875593 ?auto_1875592 ) ( not ( = ?auto_1875582 ?auto_1875583 ) ) ( not ( = ?auto_1875582 ?auto_1875584 ) ) ( not ( = ?auto_1875582 ?auto_1875581 ) ) ( not ( = ?auto_1875582 ?auto_1875585 ) ) ( not ( = ?auto_1875582 ?auto_1875587 ) ) ( not ( = ?auto_1875582 ?auto_1875586 ) ) ( not ( = ?auto_1875582 ?auto_1875588 ) ) ( not ( = ?auto_1875582 ?auto_1875589 ) ) ( not ( = ?auto_1875582 ?auto_1875590 ) ) ( not ( = ?auto_1875582 ?auto_1875591 ) ) ( not ( = ?auto_1875582 ?auto_1875592 ) ) ( not ( = ?auto_1875582 ?auto_1875593 ) ) ( not ( = ?auto_1875582 ?auto_1875594 ) ) ( not ( = ?auto_1875582 ?auto_1875595 ) ) ( not ( = ?auto_1875583 ?auto_1875584 ) ) ( not ( = ?auto_1875583 ?auto_1875581 ) ) ( not ( = ?auto_1875583 ?auto_1875585 ) ) ( not ( = ?auto_1875583 ?auto_1875587 ) ) ( not ( = ?auto_1875583 ?auto_1875586 ) ) ( not ( = ?auto_1875583 ?auto_1875588 ) ) ( not ( = ?auto_1875583 ?auto_1875589 ) ) ( not ( = ?auto_1875583 ?auto_1875590 ) ) ( not ( = ?auto_1875583 ?auto_1875591 ) ) ( not ( = ?auto_1875583 ?auto_1875592 ) ) ( not ( = ?auto_1875583 ?auto_1875593 ) ) ( not ( = ?auto_1875583 ?auto_1875594 ) ) ( not ( = ?auto_1875583 ?auto_1875595 ) ) ( not ( = ?auto_1875584 ?auto_1875581 ) ) ( not ( = ?auto_1875584 ?auto_1875585 ) ) ( not ( = ?auto_1875584 ?auto_1875587 ) ) ( not ( = ?auto_1875584 ?auto_1875586 ) ) ( not ( = ?auto_1875584 ?auto_1875588 ) ) ( not ( = ?auto_1875584 ?auto_1875589 ) ) ( not ( = ?auto_1875584 ?auto_1875590 ) ) ( not ( = ?auto_1875584 ?auto_1875591 ) ) ( not ( = ?auto_1875584 ?auto_1875592 ) ) ( not ( = ?auto_1875584 ?auto_1875593 ) ) ( not ( = ?auto_1875584 ?auto_1875594 ) ) ( not ( = ?auto_1875584 ?auto_1875595 ) ) ( not ( = ?auto_1875581 ?auto_1875585 ) ) ( not ( = ?auto_1875581 ?auto_1875587 ) ) ( not ( = ?auto_1875581 ?auto_1875586 ) ) ( not ( = ?auto_1875581 ?auto_1875588 ) ) ( not ( = ?auto_1875581 ?auto_1875589 ) ) ( not ( = ?auto_1875581 ?auto_1875590 ) ) ( not ( = ?auto_1875581 ?auto_1875591 ) ) ( not ( = ?auto_1875581 ?auto_1875592 ) ) ( not ( = ?auto_1875581 ?auto_1875593 ) ) ( not ( = ?auto_1875581 ?auto_1875594 ) ) ( not ( = ?auto_1875581 ?auto_1875595 ) ) ( not ( = ?auto_1875585 ?auto_1875587 ) ) ( not ( = ?auto_1875585 ?auto_1875586 ) ) ( not ( = ?auto_1875585 ?auto_1875588 ) ) ( not ( = ?auto_1875585 ?auto_1875589 ) ) ( not ( = ?auto_1875585 ?auto_1875590 ) ) ( not ( = ?auto_1875585 ?auto_1875591 ) ) ( not ( = ?auto_1875585 ?auto_1875592 ) ) ( not ( = ?auto_1875585 ?auto_1875593 ) ) ( not ( = ?auto_1875585 ?auto_1875594 ) ) ( not ( = ?auto_1875585 ?auto_1875595 ) ) ( not ( = ?auto_1875587 ?auto_1875586 ) ) ( not ( = ?auto_1875587 ?auto_1875588 ) ) ( not ( = ?auto_1875587 ?auto_1875589 ) ) ( not ( = ?auto_1875587 ?auto_1875590 ) ) ( not ( = ?auto_1875587 ?auto_1875591 ) ) ( not ( = ?auto_1875587 ?auto_1875592 ) ) ( not ( = ?auto_1875587 ?auto_1875593 ) ) ( not ( = ?auto_1875587 ?auto_1875594 ) ) ( not ( = ?auto_1875587 ?auto_1875595 ) ) ( not ( = ?auto_1875586 ?auto_1875588 ) ) ( not ( = ?auto_1875586 ?auto_1875589 ) ) ( not ( = ?auto_1875586 ?auto_1875590 ) ) ( not ( = ?auto_1875586 ?auto_1875591 ) ) ( not ( = ?auto_1875586 ?auto_1875592 ) ) ( not ( = ?auto_1875586 ?auto_1875593 ) ) ( not ( = ?auto_1875586 ?auto_1875594 ) ) ( not ( = ?auto_1875586 ?auto_1875595 ) ) ( not ( = ?auto_1875588 ?auto_1875589 ) ) ( not ( = ?auto_1875588 ?auto_1875590 ) ) ( not ( = ?auto_1875588 ?auto_1875591 ) ) ( not ( = ?auto_1875588 ?auto_1875592 ) ) ( not ( = ?auto_1875588 ?auto_1875593 ) ) ( not ( = ?auto_1875588 ?auto_1875594 ) ) ( not ( = ?auto_1875588 ?auto_1875595 ) ) ( not ( = ?auto_1875589 ?auto_1875590 ) ) ( not ( = ?auto_1875589 ?auto_1875591 ) ) ( not ( = ?auto_1875589 ?auto_1875592 ) ) ( not ( = ?auto_1875589 ?auto_1875593 ) ) ( not ( = ?auto_1875589 ?auto_1875594 ) ) ( not ( = ?auto_1875589 ?auto_1875595 ) ) ( not ( = ?auto_1875590 ?auto_1875591 ) ) ( not ( = ?auto_1875590 ?auto_1875592 ) ) ( not ( = ?auto_1875590 ?auto_1875593 ) ) ( not ( = ?auto_1875590 ?auto_1875594 ) ) ( not ( = ?auto_1875590 ?auto_1875595 ) ) ( not ( = ?auto_1875591 ?auto_1875592 ) ) ( not ( = ?auto_1875591 ?auto_1875593 ) ) ( not ( = ?auto_1875591 ?auto_1875594 ) ) ( not ( = ?auto_1875591 ?auto_1875595 ) ) ( not ( = ?auto_1875592 ?auto_1875593 ) ) ( not ( = ?auto_1875592 ?auto_1875594 ) ) ( not ( = ?auto_1875592 ?auto_1875595 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1875593 ?auto_1875594 ?auto_1875595 )
      ( MAKE-14CRATE-VERIFY ?auto_1875582 ?auto_1875583 ?auto_1875584 ?auto_1875581 ?auto_1875585 ?auto_1875587 ?auto_1875586 ?auto_1875588 ?auto_1875589 ?auto_1875590 ?auto_1875591 ?auto_1875592 ?auto_1875593 ?auto_1875594 ?auto_1875595 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1875771 - SURFACE
      ?auto_1875772 - SURFACE
      ?auto_1875773 - SURFACE
      ?auto_1875770 - SURFACE
      ?auto_1875774 - SURFACE
      ?auto_1875776 - SURFACE
      ?auto_1875775 - SURFACE
      ?auto_1875777 - SURFACE
      ?auto_1875778 - SURFACE
      ?auto_1875779 - SURFACE
      ?auto_1875780 - SURFACE
      ?auto_1875781 - SURFACE
      ?auto_1875782 - SURFACE
      ?auto_1875783 - SURFACE
      ?auto_1875784 - SURFACE
    )
    :vars
    (
      ?auto_1875789 - HOIST
      ?auto_1875788 - PLACE
      ?auto_1875786 - TRUCK
      ?auto_1875787 - PLACE
      ?auto_1875785 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1875789 ?auto_1875788 ) ( SURFACE-AT ?auto_1875783 ?auto_1875788 ) ( CLEAR ?auto_1875783 ) ( IS-CRATE ?auto_1875784 ) ( not ( = ?auto_1875783 ?auto_1875784 ) ) ( AVAILABLE ?auto_1875789 ) ( ON ?auto_1875783 ?auto_1875782 ) ( not ( = ?auto_1875782 ?auto_1875783 ) ) ( not ( = ?auto_1875782 ?auto_1875784 ) ) ( TRUCK-AT ?auto_1875786 ?auto_1875787 ) ( not ( = ?auto_1875787 ?auto_1875788 ) ) ( HOIST-AT ?auto_1875785 ?auto_1875787 ) ( LIFTING ?auto_1875785 ?auto_1875784 ) ( not ( = ?auto_1875789 ?auto_1875785 ) ) ( ON ?auto_1875772 ?auto_1875771 ) ( ON ?auto_1875773 ?auto_1875772 ) ( ON ?auto_1875770 ?auto_1875773 ) ( ON ?auto_1875774 ?auto_1875770 ) ( ON ?auto_1875776 ?auto_1875774 ) ( ON ?auto_1875775 ?auto_1875776 ) ( ON ?auto_1875777 ?auto_1875775 ) ( ON ?auto_1875778 ?auto_1875777 ) ( ON ?auto_1875779 ?auto_1875778 ) ( ON ?auto_1875780 ?auto_1875779 ) ( ON ?auto_1875781 ?auto_1875780 ) ( ON ?auto_1875782 ?auto_1875781 ) ( not ( = ?auto_1875771 ?auto_1875772 ) ) ( not ( = ?auto_1875771 ?auto_1875773 ) ) ( not ( = ?auto_1875771 ?auto_1875770 ) ) ( not ( = ?auto_1875771 ?auto_1875774 ) ) ( not ( = ?auto_1875771 ?auto_1875776 ) ) ( not ( = ?auto_1875771 ?auto_1875775 ) ) ( not ( = ?auto_1875771 ?auto_1875777 ) ) ( not ( = ?auto_1875771 ?auto_1875778 ) ) ( not ( = ?auto_1875771 ?auto_1875779 ) ) ( not ( = ?auto_1875771 ?auto_1875780 ) ) ( not ( = ?auto_1875771 ?auto_1875781 ) ) ( not ( = ?auto_1875771 ?auto_1875782 ) ) ( not ( = ?auto_1875771 ?auto_1875783 ) ) ( not ( = ?auto_1875771 ?auto_1875784 ) ) ( not ( = ?auto_1875772 ?auto_1875773 ) ) ( not ( = ?auto_1875772 ?auto_1875770 ) ) ( not ( = ?auto_1875772 ?auto_1875774 ) ) ( not ( = ?auto_1875772 ?auto_1875776 ) ) ( not ( = ?auto_1875772 ?auto_1875775 ) ) ( not ( = ?auto_1875772 ?auto_1875777 ) ) ( not ( = ?auto_1875772 ?auto_1875778 ) ) ( not ( = ?auto_1875772 ?auto_1875779 ) ) ( not ( = ?auto_1875772 ?auto_1875780 ) ) ( not ( = ?auto_1875772 ?auto_1875781 ) ) ( not ( = ?auto_1875772 ?auto_1875782 ) ) ( not ( = ?auto_1875772 ?auto_1875783 ) ) ( not ( = ?auto_1875772 ?auto_1875784 ) ) ( not ( = ?auto_1875773 ?auto_1875770 ) ) ( not ( = ?auto_1875773 ?auto_1875774 ) ) ( not ( = ?auto_1875773 ?auto_1875776 ) ) ( not ( = ?auto_1875773 ?auto_1875775 ) ) ( not ( = ?auto_1875773 ?auto_1875777 ) ) ( not ( = ?auto_1875773 ?auto_1875778 ) ) ( not ( = ?auto_1875773 ?auto_1875779 ) ) ( not ( = ?auto_1875773 ?auto_1875780 ) ) ( not ( = ?auto_1875773 ?auto_1875781 ) ) ( not ( = ?auto_1875773 ?auto_1875782 ) ) ( not ( = ?auto_1875773 ?auto_1875783 ) ) ( not ( = ?auto_1875773 ?auto_1875784 ) ) ( not ( = ?auto_1875770 ?auto_1875774 ) ) ( not ( = ?auto_1875770 ?auto_1875776 ) ) ( not ( = ?auto_1875770 ?auto_1875775 ) ) ( not ( = ?auto_1875770 ?auto_1875777 ) ) ( not ( = ?auto_1875770 ?auto_1875778 ) ) ( not ( = ?auto_1875770 ?auto_1875779 ) ) ( not ( = ?auto_1875770 ?auto_1875780 ) ) ( not ( = ?auto_1875770 ?auto_1875781 ) ) ( not ( = ?auto_1875770 ?auto_1875782 ) ) ( not ( = ?auto_1875770 ?auto_1875783 ) ) ( not ( = ?auto_1875770 ?auto_1875784 ) ) ( not ( = ?auto_1875774 ?auto_1875776 ) ) ( not ( = ?auto_1875774 ?auto_1875775 ) ) ( not ( = ?auto_1875774 ?auto_1875777 ) ) ( not ( = ?auto_1875774 ?auto_1875778 ) ) ( not ( = ?auto_1875774 ?auto_1875779 ) ) ( not ( = ?auto_1875774 ?auto_1875780 ) ) ( not ( = ?auto_1875774 ?auto_1875781 ) ) ( not ( = ?auto_1875774 ?auto_1875782 ) ) ( not ( = ?auto_1875774 ?auto_1875783 ) ) ( not ( = ?auto_1875774 ?auto_1875784 ) ) ( not ( = ?auto_1875776 ?auto_1875775 ) ) ( not ( = ?auto_1875776 ?auto_1875777 ) ) ( not ( = ?auto_1875776 ?auto_1875778 ) ) ( not ( = ?auto_1875776 ?auto_1875779 ) ) ( not ( = ?auto_1875776 ?auto_1875780 ) ) ( not ( = ?auto_1875776 ?auto_1875781 ) ) ( not ( = ?auto_1875776 ?auto_1875782 ) ) ( not ( = ?auto_1875776 ?auto_1875783 ) ) ( not ( = ?auto_1875776 ?auto_1875784 ) ) ( not ( = ?auto_1875775 ?auto_1875777 ) ) ( not ( = ?auto_1875775 ?auto_1875778 ) ) ( not ( = ?auto_1875775 ?auto_1875779 ) ) ( not ( = ?auto_1875775 ?auto_1875780 ) ) ( not ( = ?auto_1875775 ?auto_1875781 ) ) ( not ( = ?auto_1875775 ?auto_1875782 ) ) ( not ( = ?auto_1875775 ?auto_1875783 ) ) ( not ( = ?auto_1875775 ?auto_1875784 ) ) ( not ( = ?auto_1875777 ?auto_1875778 ) ) ( not ( = ?auto_1875777 ?auto_1875779 ) ) ( not ( = ?auto_1875777 ?auto_1875780 ) ) ( not ( = ?auto_1875777 ?auto_1875781 ) ) ( not ( = ?auto_1875777 ?auto_1875782 ) ) ( not ( = ?auto_1875777 ?auto_1875783 ) ) ( not ( = ?auto_1875777 ?auto_1875784 ) ) ( not ( = ?auto_1875778 ?auto_1875779 ) ) ( not ( = ?auto_1875778 ?auto_1875780 ) ) ( not ( = ?auto_1875778 ?auto_1875781 ) ) ( not ( = ?auto_1875778 ?auto_1875782 ) ) ( not ( = ?auto_1875778 ?auto_1875783 ) ) ( not ( = ?auto_1875778 ?auto_1875784 ) ) ( not ( = ?auto_1875779 ?auto_1875780 ) ) ( not ( = ?auto_1875779 ?auto_1875781 ) ) ( not ( = ?auto_1875779 ?auto_1875782 ) ) ( not ( = ?auto_1875779 ?auto_1875783 ) ) ( not ( = ?auto_1875779 ?auto_1875784 ) ) ( not ( = ?auto_1875780 ?auto_1875781 ) ) ( not ( = ?auto_1875780 ?auto_1875782 ) ) ( not ( = ?auto_1875780 ?auto_1875783 ) ) ( not ( = ?auto_1875780 ?auto_1875784 ) ) ( not ( = ?auto_1875781 ?auto_1875782 ) ) ( not ( = ?auto_1875781 ?auto_1875783 ) ) ( not ( = ?auto_1875781 ?auto_1875784 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1875782 ?auto_1875783 ?auto_1875784 )
      ( MAKE-14CRATE-VERIFY ?auto_1875771 ?auto_1875772 ?auto_1875773 ?auto_1875770 ?auto_1875774 ?auto_1875776 ?auto_1875775 ?auto_1875777 ?auto_1875778 ?auto_1875779 ?auto_1875780 ?auto_1875781 ?auto_1875782 ?auto_1875783 ?auto_1875784 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1875974 - SURFACE
      ?auto_1875975 - SURFACE
      ?auto_1875976 - SURFACE
      ?auto_1875973 - SURFACE
      ?auto_1875977 - SURFACE
      ?auto_1875979 - SURFACE
      ?auto_1875978 - SURFACE
      ?auto_1875980 - SURFACE
      ?auto_1875981 - SURFACE
      ?auto_1875982 - SURFACE
      ?auto_1875983 - SURFACE
      ?auto_1875984 - SURFACE
      ?auto_1875985 - SURFACE
      ?auto_1875986 - SURFACE
      ?auto_1875987 - SURFACE
    )
    :vars
    (
      ?auto_1875990 - HOIST
      ?auto_1875992 - PLACE
      ?auto_1875989 - TRUCK
      ?auto_1875993 - PLACE
      ?auto_1875991 - HOIST
      ?auto_1875988 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1875990 ?auto_1875992 ) ( SURFACE-AT ?auto_1875986 ?auto_1875992 ) ( CLEAR ?auto_1875986 ) ( IS-CRATE ?auto_1875987 ) ( not ( = ?auto_1875986 ?auto_1875987 ) ) ( AVAILABLE ?auto_1875990 ) ( ON ?auto_1875986 ?auto_1875985 ) ( not ( = ?auto_1875985 ?auto_1875986 ) ) ( not ( = ?auto_1875985 ?auto_1875987 ) ) ( TRUCK-AT ?auto_1875989 ?auto_1875993 ) ( not ( = ?auto_1875993 ?auto_1875992 ) ) ( HOIST-AT ?auto_1875991 ?auto_1875993 ) ( not ( = ?auto_1875990 ?auto_1875991 ) ) ( AVAILABLE ?auto_1875991 ) ( SURFACE-AT ?auto_1875987 ?auto_1875993 ) ( ON ?auto_1875987 ?auto_1875988 ) ( CLEAR ?auto_1875987 ) ( not ( = ?auto_1875986 ?auto_1875988 ) ) ( not ( = ?auto_1875987 ?auto_1875988 ) ) ( not ( = ?auto_1875985 ?auto_1875988 ) ) ( ON ?auto_1875975 ?auto_1875974 ) ( ON ?auto_1875976 ?auto_1875975 ) ( ON ?auto_1875973 ?auto_1875976 ) ( ON ?auto_1875977 ?auto_1875973 ) ( ON ?auto_1875979 ?auto_1875977 ) ( ON ?auto_1875978 ?auto_1875979 ) ( ON ?auto_1875980 ?auto_1875978 ) ( ON ?auto_1875981 ?auto_1875980 ) ( ON ?auto_1875982 ?auto_1875981 ) ( ON ?auto_1875983 ?auto_1875982 ) ( ON ?auto_1875984 ?auto_1875983 ) ( ON ?auto_1875985 ?auto_1875984 ) ( not ( = ?auto_1875974 ?auto_1875975 ) ) ( not ( = ?auto_1875974 ?auto_1875976 ) ) ( not ( = ?auto_1875974 ?auto_1875973 ) ) ( not ( = ?auto_1875974 ?auto_1875977 ) ) ( not ( = ?auto_1875974 ?auto_1875979 ) ) ( not ( = ?auto_1875974 ?auto_1875978 ) ) ( not ( = ?auto_1875974 ?auto_1875980 ) ) ( not ( = ?auto_1875974 ?auto_1875981 ) ) ( not ( = ?auto_1875974 ?auto_1875982 ) ) ( not ( = ?auto_1875974 ?auto_1875983 ) ) ( not ( = ?auto_1875974 ?auto_1875984 ) ) ( not ( = ?auto_1875974 ?auto_1875985 ) ) ( not ( = ?auto_1875974 ?auto_1875986 ) ) ( not ( = ?auto_1875974 ?auto_1875987 ) ) ( not ( = ?auto_1875974 ?auto_1875988 ) ) ( not ( = ?auto_1875975 ?auto_1875976 ) ) ( not ( = ?auto_1875975 ?auto_1875973 ) ) ( not ( = ?auto_1875975 ?auto_1875977 ) ) ( not ( = ?auto_1875975 ?auto_1875979 ) ) ( not ( = ?auto_1875975 ?auto_1875978 ) ) ( not ( = ?auto_1875975 ?auto_1875980 ) ) ( not ( = ?auto_1875975 ?auto_1875981 ) ) ( not ( = ?auto_1875975 ?auto_1875982 ) ) ( not ( = ?auto_1875975 ?auto_1875983 ) ) ( not ( = ?auto_1875975 ?auto_1875984 ) ) ( not ( = ?auto_1875975 ?auto_1875985 ) ) ( not ( = ?auto_1875975 ?auto_1875986 ) ) ( not ( = ?auto_1875975 ?auto_1875987 ) ) ( not ( = ?auto_1875975 ?auto_1875988 ) ) ( not ( = ?auto_1875976 ?auto_1875973 ) ) ( not ( = ?auto_1875976 ?auto_1875977 ) ) ( not ( = ?auto_1875976 ?auto_1875979 ) ) ( not ( = ?auto_1875976 ?auto_1875978 ) ) ( not ( = ?auto_1875976 ?auto_1875980 ) ) ( not ( = ?auto_1875976 ?auto_1875981 ) ) ( not ( = ?auto_1875976 ?auto_1875982 ) ) ( not ( = ?auto_1875976 ?auto_1875983 ) ) ( not ( = ?auto_1875976 ?auto_1875984 ) ) ( not ( = ?auto_1875976 ?auto_1875985 ) ) ( not ( = ?auto_1875976 ?auto_1875986 ) ) ( not ( = ?auto_1875976 ?auto_1875987 ) ) ( not ( = ?auto_1875976 ?auto_1875988 ) ) ( not ( = ?auto_1875973 ?auto_1875977 ) ) ( not ( = ?auto_1875973 ?auto_1875979 ) ) ( not ( = ?auto_1875973 ?auto_1875978 ) ) ( not ( = ?auto_1875973 ?auto_1875980 ) ) ( not ( = ?auto_1875973 ?auto_1875981 ) ) ( not ( = ?auto_1875973 ?auto_1875982 ) ) ( not ( = ?auto_1875973 ?auto_1875983 ) ) ( not ( = ?auto_1875973 ?auto_1875984 ) ) ( not ( = ?auto_1875973 ?auto_1875985 ) ) ( not ( = ?auto_1875973 ?auto_1875986 ) ) ( not ( = ?auto_1875973 ?auto_1875987 ) ) ( not ( = ?auto_1875973 ?auto_1875988 ) ) ( not ( = ?auto_1875977 ?auto_1875979 ) ) ( not ( = ?auto_1875977 ?auto_1875978 ) ) ( not ( = ?auto_1875977 ?auto_1875980 ) ) ( not ( = ?auto_1875977 ?auto_1875981 ) ) ( not ( = ?auto_1875977 ?auto_1875982 ) ) ( not ( = ?auto_1875977 ?auto_1875983 ) ) ( not ( = ?auto_1875977 ?auto_1875984 ) ) ( not ( = ?auto_1875977 ?auto_1875985 ) ) ( not ( = ?auto_1875977 ?auto_1875986 ) ) ( not ( = ?auto_1875977 ?auto_1875987 ) ) ( not ( = ?auto_1875977 ?auto_1875988 ) ) ( not ( = ?auto_1875979 ?auto_1875978 ) ) ( not ( = ?auto_1875979 ?auto_1875980 ) ) ( not ( = ?auto_1875979 ?auto_1875981 ) ) ( not ( = ?auto_1875979 ?auto_1875982 ) ) ( not ( = ?auto_1875979 ?auto_1875983 ) ) ( not ( = ?auto_1875979 ?auto_1875984 ) ) ( not ( = ?auto_1875979 ?auto_1875985 ) ) ( not ( = ?auto_1875979 ?auto_1875986 ) ) ( not ( = ?auto_1875979 ?auto_1875987 ) ) ( not ( = ?auto_1875979 ?auto_1875988 ) ) ( not ( = ?auto_1875978 ?auto_1875980 ) ) ( not ( = ?auto_1875978 ?auto_1875981 ) ) ( not ( = ?auto_1875978 ?auto_1875982 ) ) ( not ( = ?auto_1875978 ?auto_1875983 ) ) ( not ( = ?auto_1875978 ?auto_1875984 ) ) ( not ( = ?auto_1875978 ?auto_1875985 ) ) ( not ( = ?auto_1875978 ?auto_1875986 ) ) ( not ( = ?auto_1875978 ?auto_1875987 ) ) ( not ( = ?auto_1875978 ?auto_1875988 ) ) ( not ( = ?auto_1875980 ?auto_1875981 ) ) ( not ( = ?auto_1875980 ?auto_1875982 ) ) ( not ( = ?auto_1875980 ?auto_1875983 ) ) ( not ( = ?auto_1875980 ?auto_1875984 ) ) ( not ( = ?auto_1875980 ?auto_1875985 ) ) ( not ( = ?auto_1875980 ?auto_1875986 ) ) ( not ( = ?auto_1875980 ?auto_1875987 ) ) ( not ( = ?auto_1875980 ?auto_1875988 ) ) ( not ( = ?auto_1875981 ?auto_1875982 ) ) ( not ( = ?auto_1875981 ?auto_1875983 ) ) ( not ( = ?auto_1875981 ?auto_1875984 ) ) ( not ( = ?auto_1875981 ?auto_1875985 ) ) ( not ( = ?auto_1875981 ?auto_1875986 ) ) ( not ( = ?auto_1875981 ?auto_1875987 ) ) ( not ( = ?auto_1875981 ?auto_1875988 ) ) ( not ( = ?auto_1875982 ?auto_1875983 ) ) ( not ( = ?auto_1875982 ?auto_1875984 ) ) ( not ( = ?auto_1875982 ?auto_1875985 ) ) ( not ( = ?auto_1875982 ?auto_1875986 ) ) ( not ( = ?auto_1875982 ?auto_1875987 ) ) ( not ( = ?auto_1875982 ?auto_1875988 ) ) ( not ( = ?auto_1875983 ?auto_1875984 ) ) ( not ( = ?auto_1875983 ?auto_1875985 ) ) ( not ( = ?auto_1875983 ?auto_1875986 ) ) ( not ( = ?auto_1875983 ?auto_1875987 ) ) ( not ( = ?auto_1875983 ?auto_1875988 ) ) ( not ( = ?auto_1875984 ?auto_1875985 ) ) ( not ( = ?auto_1875984 ?auto_1875986 ) ) ( not ( = ?auto_1875984 ?auto_1875987 ) ) ( not ( = ?auto_1875984 ?auto_1875988 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1875985 ?auto_1875986 ?auto_1875987 )
      ( MAKE-14CRATE-VERIFY ?auto_1875974 ?auto_1875975 ?auto_1875976 ?auto_1875973 ?auto_1875977 ?auto_1875979 ?auto_1875978 ?auto_1875980 ?auto_1875981 ?auto_1875982 ?auto_1875983 ?auto_1875984 ?auto_1875985 ?auto_1875986 ?auto_1875987 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1876178 - SURFACE
      ?auto_1876179 - SURFACE
      ?auto_1876180 - SURFACE
      ?auto_1876177 - SURFACE
      ?auto_1876181 - SURFACE
      ?auto_1876183 - SURFACE
      ?auto_1876182 - SURFACE
      ?auto_1876184 - SURFACE
      ?auto_1876185 - SURFACE
      ?auto_1876186 - SURFACE
      ?auto_1876187 - SURFACE
      ?auto_1876188 - SURFACE
      ?auto_1876189 - SURFACE
      ?auto_1876190 - SURFACE
      ?auto_1876191 - SURFACE
    )
    :vars
    (
      ?auto_1876196 - HOIST
      ?auto_1876195 - PLACE
      ?auto_1876192 - PLACE
      ?auto_1876193 - HOIST
      ?auto_1876194 - SURFACE
      ?auto_1876197 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1876196 ?auto_1876195 ) ( SURFACE-AT ?auto_1876190 ?auto_1876195 ) ( CLEAR ?auto_1876190 ) ( IS-CRATE ?auto_1876191 ) ( not ( = ?auto_1876190 ?auto_1876191 ) ) ( AVAILABLE ?auto_1876196 ) ( ON ?auto_1876190 ?auto_1876189 ) ( not ( = ?auto_1876189 ?auto_1876190 ) ) ( not ( = ?auto_1876189 ?auto_1876191 ) ) ( not ( = ?auto_1876192 ?auto_1876195 ) ) ( HOIST-AT ?auto_1876193 ?auto_1876192 ) ( not ( = ?auto_1876196 ?auto_1876193 ) ) ( AVAILABLE ?auto_1876193 ) ( SURFACE-AT ?auto_1876191 ?auto_1876192 ) ( ON ?auto_1876191 ?auto_1876194 ) ( CLEAR ?auto_1876191 ) ( not ( = ?auto_1876190 ?auto_1876194 ) ) ( not ( = ?auto_1876191 ?auto_1876194 ) ) ( not ( = ?auto_1876189 ?auto_1876194 ) ) ( TRUCK-AT ?auto_1876197 ?auto_1876195 ) ( ON ?auto_1876179 ?auto_1876178 ) ( ON ?auto_1876180 ?auto_1876179 ) ( ON ?auto_1876177 ?auto_1876180 ) ( ON ?auto_1876181 ?auto_1876177 ) ( ON ?auto_1876183 ?auto_1876181 ) ( ON ?auto_1876182 ?auto_1876183 ) ( ON ?auto_1876184 ?auto_1876182 ) ( ON ?auto_1876185 ?auto_1876184 ) ( ON ?auto_1876186 ?auto_1876185 ) ( ON ?auto_1876187 ?auto_1876186 ) ( ON ?auto_1876188 ?auto_1876187 ) ( ON ?auto_1876189 ?auto_1876188 ) ( not ( = ?auto_1876178 ?auto_1876179 ) ) ( not ( = ?auto_1876178 ?auto_1876180 ) ) ( not ( = ?auto_1876178 ?auto_1876177 ) ) ( not ( = ?auto_1876178 ?auto_1876181 ) ) ( not ( = ?auto_1876178 ?auto_1876183 ) ) ( not ( = ?auto_1876178 ?auto_1876182 ) ) ( not ( = ?auto_1876178 ?auto_1876184 ) ) ( not ( = ?auto_1876178 ?auto_1876185 ) ) ( not ( = ?auto_1876178 ?auto_1876186 ) ) ( not ( = ?auto_1876178 ?auto_1876187 ) ) ( not ( = ?auto_1876178 ?auto_1876188 ) ) ( not ( = ?auto_1876178 ?auto_1876189 ) ) ( not ( = ?auto_1876178 ?auto_1876190 ) ) ( not ( = ?auto_1876178 ?auto_1876191 ) ) ( not ( = ?auto_1876178 ?auto_1876194 ) ) ( not ( = ?auto_1876179 ?auto_1876180 ) ) ( not ( = ?auto_1876179 ?auto_1876177 ) ) ( not ( = ?auto_1876179 ?auto_1876181 ) ) ( not ( = ?auto_1876179 ?auto_1876183 ) ) ( not ( = ?auto_1876179 ?auto_1876182 ) ) ( not ( = ?auto_1876179 ?auto_1876184 ) ) ( not ( = ?auto_1876179 ?auto_1876185 ) ) ( not ( = ?auto_1876179 ?auto_1876186 ) ) ( not ( = ?auto_1876179 ?auto_1876187 ) ) ( not ( = ?auto_1876179 ?auto_1876188 ) ) ( not ( = ?auto_1876179 ?auto_1876189 ) ) ( not ( = ?auto_1876179 ?auto_1876190 ) ) ( not ( = ?auto_1876179 ?auto_1876191 ) ) ( not ( = ?auto_1876179 ?auto_1876194 ) ) ( not ( = ?auto_1876180 ?auto_1876177 ) ) ( not ( = ?auto_1876180 ?auto_1876181 ) ) ( not ( = ?auto_1876180 ?auto_1876183 ) ) ( not ( = ?auto_1876180 ?auto_1876182 ) ) ( not ( = ?auto_1876180 ?auto_1876184 ) ) ( not ( = ?auto_1876180 ?auto_1876185 ) ) ( not ( = ?auto_1876180 ?auto_1876186 ) ) ( not ( = ?auto_1876180 ?auto_1876187 ) ) ( not ( = ?auto_1876180 ?auto_1876188 ) ) ( not ( = ?auto_1876180 ?auto_1876189 ) ) ( not ( = ?auto_1876180 ?auto_1876190 ) ) ( not ( = ?auto_1876180 ?auto_1876191 ) ) ( not ( = ?auto_1876180 ?auto_1876194 ) ) ( not ( = ?auto_1876177 ?auto_1876181 ) ) ( not ( = ?auto_1876177 ?auto_1876183 ) ) ( not ( = ?auto_1876177 ?auto_1876182 ) ) ( not ( = ?auto_1876177 ?auto_1876184 ) ) ( not ( = ?auto_1876177 ?auto_1876185 ) ) ( not ( = ?auto_1876177 ?auto_1876186 ) ) ( not ( = ?auto_1876177 ?auto_1876187 ) ) ( not ( = ?auto_1876177 ?auto_1876188 ) ) ( not ( = ?auto_1876177 ?auto_1876189 ) ) ( not ( = ?auto_1876177 ?auto_1876190 ) ) ( not ( = ?auto_1876177 ?auto_1876191 ) ) ( not ( = ?auto_1876177 ?auto_1876194 ) ) ( not ( = ?auto_1876181 ?auto_1876183 ) ) ( not ( = ?auto_1876181 ?auto_1876182 ) ) ( not ( = ?auto_1876181 ?auto_1876184 ) ) ( not ( = ?auto_1876181 ?auto_1876185 ) ) ( not ( = ?auto_1876181 ?auto_1876186 ) ) ( not ( = ?auto_1876181 ?auto_1876187 ) ) ( not ( = ?auto_1876181 ?auto_1876188 ) ) ( not ( = ?auto_1876181 ?auto_1876189 ) ) ( not ( = ?auto_1876181 ?auto_1876190 ) ) ( not ( = ?auto_1876181 ?auto_1876191 ) ) ( not ( = ?auto_1876181 ?auto_1876194 ) ) ( not ( = ?auto_1876183 ?auto_1876182 ) ) ( not ( = ?auto_1876183 ?auto_1876184 ) ) ( not ( = ?auto_1876183 ?auto_1876185 ) ) ( not ( = ?auto_1876183 ?auto_1876186 ) ) ( not ( = ?auto_1876183 ?auto_1876187 ) ) ( not ( = ?auto_1876183 ?auto_1876188 ) ) ( not ( = ?auto_1876183 ?auto_1876189 ) ) ( not ( = ?auto_1876183 ?auto_1876190 ) ) ( not ( = ?auto_1876183 ?auto_1876191 ) ) ( not ( = ?auto_1876183 ?auto_1876194 ) ) ( not ( = ?auto_1876182 ?auto_1876184 ) ) ( not ( = ?auto_1876182 ?auto_1876185 ) ) ( not ( = ?auto_1876182 ?auto_1876186 ) ) ( not ( = ?auto_1876182 ?auto_1876187 ) ) ( not ( = ?auto_1876182 ?auto_1876188 ) ) ( not ( = ?auto_1876182 ?auto_1876189 ) ) ( not ( = ?auto_1876182 ?auto_1876190 ) ) ( not ( = ?auto_1876182 ?auto_1876191 ) ) ( not ( = ?auto_1876182 ?auto_1876194 ) ) ( not ( = ?auto_1876184 ?auto_1876185 ) ) ( not ( = ?auto_1876184 ?auto_1876186 ) ) ( not ( = ?auto_1876184 ?auto_1876187 ) ) ( not ( = ?auto_1876184 ?auto_1876188 ) ) ( not ( = ?auto_1876184 ?auto_1876189 ) ) ( not ( = ?auto_1876184 ?auto_1876190 ) ) ( not ( = ?auto_1876184 ?auto_1876191 ) ) ( not ( = ?auto_1876184 ?auto_1876194 ) ) ( not ( = ?auto_1876185 ?auto_1876186 ) ) ( not ( = ?auto_1876185 ?auto_1876187 ) ) ( not ( = ?auto_1876185 ?auto_1876188 ) ) ( not ( = ?auto_1876185 ?auto_1876189 ) ) ( not ( = ?auto_1876185 ?auto_1876190 ) ) ( not ( = ?auto_1876185 ?auto_1876191 ) ) ( not ( = ?auto_1876185 ?auto_1876194 ) ) ( not ( = ?auto_1876186 ?auto_1876187 ) ) ( not ( = ?auto_1876186 ?auto_1876188 ) ) ( not ( = ?auto_1876186 ?auto_1876189 ) ) ( not ( = ?auto_1876186 ?auto_1876190 ) ) ( not ( = ?auto_1876186 ?auto_1876191 ) ) ( not ( = ?auto_1876186 ?auto_1876194 ) ) ( not ( = ?auto_1876187 ?auto_1876188 ) ) ( not ( = ?auto_1876187 ?auto_1876189 ) ) ( not ( = ?auto_1876187 ?auto_1876190 ) ) ( not ( = ?auto_1876187 ?auto_1876191 ) ) ( not ( = ?auto_1876187 ?auto_1876194 ) ) ( not ( = ?auto_1876188 ?auto_1876189 ) ) ( not ( = ?auto_1876188 ?auto_1876190 ) ) ( not ( = ?auto_1876188 ?auto_1876191 ) ) ( not ( = ?auto_1876188 ?auto_1876194 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1876189 ?auto_1876190 ?auto_1876191 )
      ( MAKE-14CRATE-VERIFY ?auto_1876178 ?auto_1876179 ?auto_1876180 ?auto_1876177 ?auto_1876181 ?auto_1876183 ?auto_1876182 ?auto_1876184 ?auto_1876185 ?auto_1876186 ?auto_1876187 ?auto_1876188 ?auto_1876189 ?auto_1876190 ?auto_1876191 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1876382 - SURFACE
      ?auto_1876383 - SURFACE
      ?auto_1876384 - SURFACE
      ?auto_1876381 - SURFACE
      ?auto_1876385 - SURFACE
      ?auto_1876387 - SURFACE
      ?auto_1876386 - SURFACE
      ?auto_1876388 - SURFACE
      ?auto_1876389 - SURFACE
      ?auto_1876390 - SURFACE
      ?auto_1876391 - SURFACE
      ?auto_1876392 - SURFACE
      ?auto_1876393 - SURFACE
      ?auto_1876394 - SURFACE
      ?auto_1876395 - SURFACE
    )
    :vars
    (
      ?auto_1876396 - HOIST
      ?auto_1876397 - PLACE
      ?auto_1876400 - PLACE
      ?auto_1876399 - HOIST
      ?auto_1876398 - SURFACE
      ?auto_1876401 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1876396 ?auto_1876397 ) ( IS-CRATE ?auto_1876395 ) ( not ( = ?auto_1876394 ?auto_1876395 ) ) ( not ( = ?auto_1876393 ?auto_1876394 ) ) ( not ( = ?auto_1876393 ?auto_1876395 ) ) ( not ( = ?auto_1876400 ?auto_1876397 ) ) ( HOIST-AT ?auto_1876399 ?auto_1876400 ) ( not ( = ?auto_1876396 ?auto_1876399 ) ) ( AVAILABLE ?auto_1876399 ) ( SURFACE-AT ?auto_1876395 ?auto_1876400 ) ( ON ?auto_1876395 ?auto_1876398 ) ( CLEAR ?auto_1876395 ) ( not ( = ?auto_1876394 ?auto_1876398 ) ) ( not ( = ?auto_1876395 ?auto_1876398 ) ) ( not ( = ?auto_1876393 ?auto_1876398 ) ) ( TRUCK-AT ?auto_1876401 ?auto_1876397 ) ( SURFACE-AT ?auto_1876393 ?auto_1876397 ) ( CLEAR ?auto_1876393 ) ( LIFTING ?auto_1876396 ?auto_1876394 ) ( IS-CRATE ?auto_1876394 ) ( ON ?auto_1876383 ?auto_1876382 ) ( ON ?auto_1876384 ?auto_1876383 ) ( ON ?auto_1876381 ?auto_1876384 ) ( ON ?auto_1876385 ?auto_1876381 ) ( ON ?auto_1876387 ?auto_1876385 ) ( ON ?auto_1876386 ?auto_1876387 ) ( ON ?auto_1876388 ?auto_1876386 ) ( ON ?auto_1876389 ?auto_1876388 ) ( ON ?auto_1876390 ?auto_1876389 ) ( ON ?auto_1876391 ?auto_1876390 ) ( ON ?auto_1876392 ?auto_1876391 ) ( ON ?auto_1876393 ?auto_1876392 ) ( not ( = ?auto_1876382 ?auto_1876383 ) ) ( not ( = ?auto_1876382 ?auto_1876384 ) ) ( not ( = ?auto_1876382 ?auto_1876381 ) ) ( not ( = ?auto_1876382 ?auto_1876385 ) ) ( not ( = ?auto_1876382 ?auto_1876387 ) ) ( not ( = ?auto_1876382 ?auto_1876386 ) ) ( not ( = ?auto_1876382 ?auto_1876388 ) ) ( not ( = ?auto_1876382 ?auto_1876389 ) ) ( not ( = ?auto_1876382 ?auto_1876390 ) ) ( not ( = ?auto_1876382 ?auto_1876391 ) ) ( not ( = ?auto_1876382 ?auto_1876392 ) ) ( not ( = ?auto_1876382 ?auto_1876393 ) ) ( not ( = ?auto_1876382 ?auto_1876394 ) ) ( not ( = ?auto_1876382 ?auto_1876395 ) ) ( not ( = ?auto_1876382 ?auto_1876398 ) ) ( not ( = ?auto_1876383 ?auto_1876384 ) ) ( not ( = ?auto_1876383 ?auto_1876381 ) ) ( not ( = ?auto_1876383 ?auto_1876385 ) ) ( not ( = ?auto_1876383 ?auto_1876387 ) ) ( not ( = ?auto_1876383 ?auto_1876386 ) ) ( not ( = ?auto_1876383 ?auto_1876388 ) ) ( not ( = ?auto_1876383 ?auto_1876389 ) ) ( not ( = ?auto_1876383 ?auto_1876390 ) ) ( not ( = ?auto_1876383 ?auto_1876391 ) ) ( not ( = ?auto_1876383 ?auto_1876392 ) ) ( not ( = ?auto_1876383 ?auto_1876393 ) ) ( not ( = ?auto_1876383 ?auto_1876394 ) ) ( not ( = ?auto_1876383 ?auto_1876395 ) ) ( not ( = ?auto_1876383 ?auto_1876398 ) ) ( not ( = ?auto_1876384 ?auto_1876381 ) ) ( not ( = ?auto_1876384 ?auto_1876385 ) ) ( not ( = ?auto_1876384 ?auto_1876387 ) ) ( not ( = ?auto_1876384 ?auto_1876386 ) ) ( not ( = ?auto_1876384 ?auto_1876388 ) ) ( not ( = ?auto_1876384 ?auto_1876389 ) ) ( not ( = ?auto_1876384 ?auto_1876390 ) ) ( not ( = ?auto_1876384 ?auto_1876391 ) ) ( not ( = ?auto_1876384 ?auto_1876392 ) ) ( not ( = ?auto_1876384 ?auto_1876393 ) ) ( not ( = ?auto_1876384 ?auto_1876394 ) ) ( not ( = ?auto_1876384 ?auto_1876395 ) ) ( not ( = ?auto_1876384 ?auto_1876398 ) ) ( not ( = ?auto_1876381 ?auto_1876385 ) ) ( not ( = ?auto_1876381 ?auto_1876387 ) ) ( not ( = ?auto_1876381 ?auto_1876386 ) ) ( not ( = ?auto_1876381 ?auto_1876388 ) ) ( not ( = ?auto_1876381 ?auto_1876389 ) ) ( not ( = ?auto_1876381 ?auto_1876390 ) ) ( not ( = ?auto_1876381 ?auto_1876391 ) ) ( not ( = ?auto_1876381 ?auto_1876392 ) ) ( not ( = ?auto_1876381 ?auto_1876393 ) ) ( not ( = ?auto_1876381 ?auto_1876394 ) ) ( not ( = ?auto_1876381 ?auto_1876395 ) ) ( not ( = ?auto_1876381 ?auto_1876398 ) ) ( not ( = ?auto_1876385 ?auto_1876387 ) ) ( not ( = ?auto_1876385 ?auto_1876386 ) ) ( not ( = ?auto_1876385 ?auto_1876388 ) ) ( not ( = ?auto_1876385 ?auto_1876389 ) ) ( not ( = ?auto_1876385 ?auto_1876390 ) ) ( not ( = ?auto_1876385 ?auto_1876391 ) ) ( not ( = ?auto_1876385 ?auto_1876392 ) ) ( not ( = ?auto_1876385 ?auto_1876393 ) ) ( not ( = ?auto_1876385 ?auto_1876394 ) ) ( not ( = ?auto_1876385 ?auto_1876395 ) ) ( not ( = ?auto_1876385 ?auto_1876398 ) ) ( not ( = ?auto_1876387 ?auto_1876386 ) ) ( not ( = ?auto_1876387 ?auto_1876388 ) ) ( not ( = ?auto_1876387 ?auto_1876389 ) ) ( not ( = ?auto_1876387 ?auto_1876390 ) ) ( not ( = ?auto_1876387 ?auto_1876391 ) ) ( not ( = ?auto_1876387 ?auto_1876392 ) ) ( not ( = ?auto_1876387 ?auto_1876393 ) ) ( not ( = ?auto_1876387 ?auto_1876394 ) ) ( not ( = ?auto_1876387 ?auto_1876395 ) ) ( not ( = ?auto_1876387 ?auto_1876398 ) ) ( not ( = ?auto_1876386 ?auto_1876388 ) ) ( not ( = ?auto_1876386 ?auto_1876389 ) ) ( not ( = ?auto_1876386 ?auto_1876390 ) ) ( not ( = ?auto_1876386 ?auto_1876391 ) ) ( not ( = ?auto_1876386 ?auto_1876392 ) ) ( not ( = ?auto_1876386 ?auto_1876393 ) ) ( not ( = ?auto_1876386 ?auto_1876394 ) ) ( not ( = ?auto_1876386 ?auto_1876395 ) ) ( not ( = ?auto_1876386 ?auto_1876398 ) ) ( not ( = ?auto_1876388 ?auto_1876389 ) ) ( not ( = ?auto_1876388 ?auto_1876390 ) ) ( not ( = ?auto_1876388 ?auto_1876391 ) ) ( not ( = ?auto_1876388 ?auto_1876392 ) ) ( not ( = ?auto_1876388 ?auto_1876393 ) ) ( not ( = ?auto_1876388 ?auto_1876394 ) ) ( not ( = ?auto_1876388 ?auto_1876395 ) ) ( not ( = ?auto_1876388 ?auto_1876398 ) ) ( not ( = ?auto_1876389 ?auto_1876390 ) ) ( not ( = ?auto_1876389 ?auto_1876391 ) ) ( not ( = ?auto_1876389 ?auto_1876392 ) ) ( not ( = ?auto_1876389 ?auto_1876393 ) ) ( not ( = ?auto_1876389 ?auto_1876394 ) ) ( not ( = ?auto_1876389 ?auto_1876395 ) ) ( not ( = ?auto_1876389 ?auto_1876398 ) ) ( not ( = ?auto_1876390 ?auto_1876391 ) ) ( not ( = ?auto_1876390 ?auto_1876392 ) ) ( not ( = ?auto_1876390 ?auto_1876393 ) ) ( not ( = ?auto_1876390 ?auto_1876394 ) ) ( not ( = ?auto_1876390 ?auto_1876395 ) ) ( not ( = ?auto_1876390 ?auto_1876398 ) ) ( not ( = ?auto_1876391 ?auto_1876392 ) ) ( not ( = ?auto_1876391 ?auto_1876393 ) ) ( not ( = ?auto_1876391 ?auto_1876394 ) ) ( not ( = ?auto_1876391 ?auto_1876395 ) ) ( not ( = ?auto_1876391 ?auto_1876398 ) ) ( not ( = ?auto_1876392 ?auto_1876393 ) ) ( not ( = ?auto_1876392 ?auto_1876394 ) ) ( not ( = ?auto_1876392 ?auto_1876395 ) ) ( not ( = ?auto_1876392 ?auto_1876398 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1876393 ?auto_1876394 ?auto_1876395 )
      ( MAKE-14CRATE-VERIFY ?auto_1876382 ?auto_1876383 ?auto_1876384 ?auto_1876381 ?auto_1876385 ?auto_1876387 ?auto_1876386 ?auto_1876388 ?auto_1876389 ?auto_1876390 ?auto_1876391 ?auto_1876392 ?auto_1876393 ?auto_1876394 ?auto_1876395 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1876586 - SURFACE
      ?auto_1876587 - SURFACE
      ?auto_1876588 - SURFACE
      ?auto_1876585 - SURFACE
      ?auto_1876589 - SURFACE
      ?auto_1876591 - SURFACE
      ?auto_1876590 - SURFACE
      ?auto_1876592 - SURFACE
      ?auto_1876593 - SURFACE
      ?auto_1876594 - SURFACE
      ?auto_1876595 - SURFACE
      ?auto_1876596 - SURFACE
      ?auto_1876597 - SURFACE
      ?auto_1876598 - SURFACE
      ?auto_1876599 - SURFACE
    )
    :vars
    (
      ?auto_1876601 - HOIST
      ?auto_1876600 - PLACE
      ?auto_1876602 - PLACE
      ?auto_1876603 - HOIST
      ?auto_1876605 - SURFACE
      ?auto_1876604 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1876601 ?auto_1876600 ) ( IS-CRATE ?auto_1876599 ) ( not ( = ?auto_1876598 ?auto_1876599 ) ) ( not ( = ?auto_1876597 ?auto_1876598 ) ) ( not ( = ?auto_1876597 ?auto_1876599 ) ) ( not ( = ?auto_1876602 ?auto_1876600 ) ) ( HOIST-AT ?auto_1876603 ?auto_1876602 ) ( not ( = ?auto_1876601 ?auto_1876603 ) ) ( AVAILABLE ?auto_1876603 ) ( SURFACE-AT ?auto_1876599 ?auto_1876602 ) ( ON ?auto_1876599 ?auto_1876605 ) ( CLEAR ?auto_1876599 ) ( not ( = ?auto_1876598 ?auto_1876605 ) ) ( not ( = ?auto_1876599 ?auto_1876605 ) ) ( not ( = ?auto_1876597 ?auto_1876605 ) ) ( TRUCK-AT ?auto_1876604 ?auto_1876600 ) ( SURFACE-AT ?auto_1876597 ?auto_1876600 ) ( CLEAR ?auto_1876597 ) ( IS-CRATE ?auto_1876598 ) ( AVAILABLE ?auto_1876601 ) ( IN ?auto_1876598 ?auto_1876604 ) ( ON ?auto_1876587 ?auto_1876586 ) ( ON ?auto_1876588 ?auto_1876587 ) ( ON ?auto_1876585 ?auto_1876588 ) ( ON ?auto_1876589 ?auto_1876585 ) ( ON ?auto_1876591 ?auto_1876589 ) ( ON ?auto_1876590 ?auto_1876591 ) ( ON ?auto_1876592 ?auto_1876590 ) ( ON ?auto_1876593 ?auto_1876592 ) ( ON ?auto_1876594 ?auto_1876593 ) ( ON ?auto_1876595 ?auto_1876594 ) ( ON ?auto_1876596 ?auto_1876595 ) ( ON ?auto_1876597 ?auto_1876596 ) ( not ( = ?auto_1876586 ?auto_1876587 ) ) ( not ( = ?auto_1876586 ?auto_1876588 ) ) ( not ( = ?auto_1876586 ?auto_1876585 ) ) ( not ( = ?auto_1876586 ?auto_1876589 ) ) ( not ( = ?auto_1876586 ?auto_1876591 ) ) ( not ( = ?auto_1876586 ?auto_1876590 ) ) ( not ( = ?auto_1876586 ?auto_1876592 ) ) ( not ( = ?auto_1876586 ?auto_1876593 ) ) ( not ( = ?auto_1876586 ?auto_1876594 ) ) ( not ( = ?auto_1876586 ?auto_1876595 ) ) ( not ( = ?auto_1876586 ?auto_1876596 ) ) ( not ( = ?auto_1876586 ?auto_1876597 ) ) ( not ( = ?auto_1876586 ?auto_1876598 ) ) ( not ( = ?auto_1876586 ?auto_1876599 ) ) ( not ( = ?auto_1876586 ?auto_1876605 ) ) ( not ( = ?auto_1876587 ?auto_1876588 ) ) ( not ( = ?auto_1876587 ?auto_1876585 ) ) ( not ( = ?auto_1876587 ?auto_1876589 ) ) ( not ( = ?auto_1876587 ?auto_1876591 ) ) ( not ( = ?auto_1876587 ?auto_1876590 ) ) ( not ( = ?auto_1876587 ?auto_1876592 ) ) ( not ( = ?auto_1876587 ?auto_1876593 ) ) ( not ( = ?auto_1876587 ?auto_1876594 ) ) ( not ( = ?auto_1876587 ?auto_1876595 ) ) ( not ( = ?auto_1876587 ?auto_1876596 ) ) ( not ( = ?auto_1876587 ?auto_1876597 ) ) ( not ( = ?auto_1876587 ?auto_1876598 ) ) ( not ( = ?auto_1876587 ?auto_1876599 ) ) ( not ( = ?auto_1876587 ?auto_1876605 ) ) ( not ( = ?auto_1876588 ?auto_1876585 ) ) ( not ( = ?auto_1876588 ?auto_1876589 ) ) ( not ( = ?auto_1876588 ?auto_1876591 ) ) ( not ( = ?auto_1876588 ?auto_1876590 ) ) ( not ( = ?auto_1876588 ?auto_1876592 ) ) ( not ( = ?auto_1876588 ?auto_1876593 ) ) ( not ( = ?auto_1876588 ?auto_1876594 ) ) ( not ( = ?auto_1876588 ?auto_1876595 ) ) ( not ( = ?auto_1876588 ?auto_1876596 ) ) ( not ( = ?auto_1876588 ?auto_1876597 ) ) ( not ( = ?auto_1876588 ?auto_1876598 ) ) ( not ( = ?auto_1876588 ?auto_1876599 ) ) ( not ( = ?auto_1876588 ?auto_1876605 ) ) ( not ( = ?auto_1876585 ?auto_1876589 ) ) ( not ( = ?auto_1876585 ?auto_1876591 ) ) ( not ( = ?auto_1876585 ?auto_1876590 ) ) ( not ( = ?auto_1876585 ?auto_1876592 ) ) ( not ( = ?auto_1876585 ?auto_1876593 ) ) ( not ( = ?auto_1876585 ?auto_1876594 ) ) ( not ( = ?auto_1876585 ?auto_1876595 ) ) ( not ( = ?auto_1876585 ?auto_1876596 ) ) ( not ( = ?auto_1876585 ?auto_1876597 ) ) ( not ( = ?auto_1876585 ?auto_1876598 ) ) ( not ( = ?auto_1876585 ?auto_1876599 ) ) ( not ( = ?auto_1876585 ?auto_1876605 ) ) ( not ( = ?auto_1876589 ?auto_1876591 ) ) ( not ( = ?auto_1876589 ?auto_1876590 ) ) ( not ( = ?auto_1876589 ?auto_1876592 ) ) ( not ( = ?auto_1876589 ?auto_1876593 ) ) ( not ( = ?auto_1876589 ?auto_1876594 ) ) ( not ( = ?auto_1876589 ?auto_1876595 ) ) ( not ( = ?auto_1876589 ?auto_1876596 ) ) ( not ( = ?auto_1876589 ?auto_1876597 ) ) ( not ( = ?auto_1876589 ?auto_1876598 ) ) ( not ( = ?auto_1876589 ?auto_1876599 ) ) ( not ( = ?auto_1876589 ?auto_1876605 ) ) ( not ( = ?auto_1876591 ?auto_1876590 ) ) ( not ( = ?auto_1876591 ?auto_1876592 ) ) ( not ( = ?auto_1876591 ?auto_1876593 ) ) ( not ( = ?auto_1876591 ?auto_1876594 ) ) ( not ( = ?auto_1876591 ?auto_1876595 ) ) ( not ( = ?auto_1876591 ?auto_1876596 ) ) ( not ( = ?auto_1876591 ?auto_1876597 ) ) ( not ( = ?auto_1876591 ?auto_1876598 ) ) ( not ( = ?auto_1876591 ?auto_1876599 ) ) ( not ( = ?auto_1876591 ?auto_1876605 ) ) ( not ( = ?auto_1876590 ?auto_1876592 ) ) ( not ( = ?auto_1876590 ?auto_1876593 ) ) ( not ( = ?auto_1876590 ?auto_1876594 ) ) ( not ( = ?auto_1876590 ?auto_1876595 ) ) ( not ( = ?auto_1876590 ?auto_1876596 ) ) ( not ( = ?auto_1876590 ?auto_1876597 ) ) ( not ( = ?auto_1876590 ?auto_1876598 ) ) ( not ( = ?auto_1876590 ?auto_1876599 ) ) ( not ( = ?auto_1876590 ?auto_1876605 ) ) ( not ( = ?auto_1876592 ?auto_1876593 ) ) ( not ( = ?auto_1876592 ?auto_1876594 ) ) ( not ( = ?auto_1876592 ?auto_1876595 ) ) ( not ( = ?auto_1876592 ?auto_1876596 ) ) ( not ( = ?auto_1876592 ?auto_1876597 ) ) ( not ( = ?auto_1876592 ?auto_1876598 ) ) ( not ( = ?auto_1876592 ?auto_1876599 ) ) ( not ( = ?auto_1876592 ?auto_1876605 ) ) ( not ( = ?auto_1876593 ?auto_1876594 ) ) ( not ( = ?auto_1876593 ?auto_1876595 ) ) ( not ( = ?auto_1876593 ?auto_1876596 ) ) ( not ( = ?auto_1876593 ?auto_1876597 ) ) ( not ( = ?auto_1876593 ?auto_1876598 ) ) ( not ( = ?auto_1876593 ?auto_1876599 ) ) ( not ( = ?auto_1876593 ?auto_1876605 ) ) ( not ( = ?auto_1876594 ?auto_1876595 ) ) ( not ( = ?auto_1876594 ?auto_1876596 ) ) ( not ( = ?auto_1876594 ?auto_1876597 ) ) ( not ( = ?auto_1876594 ?auto_1876598 ) ) ( not ( = ?auto_1876594 ?auto_1876599 ) ) ( not ( = ?auto_1876594 ?auto_1876605 ) ) ( not ( = ?auto_1876595 ?auto_1876596 ) ) ( not ( = ?auto_1876595 ?auto_1876597 ) ) ( not ( = ?auto_1876595 ?auto_1876598 ) ) ( not ( = ?auto_1876595 ?auto_1876599 ) ) ( not ( = ?auto_1876595 ?auto_1876605 ) ) ( not ( = ?auto_1876596 ?auto_1876597 ) ) ( not ( = ?auto_1876596 ?auto_1876598 ) ) ( not ( = ?auto_1876596 ?auto_1876599 ) ) ( not ( = ?auto_1876596 ?auto_1876605 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1876597 ?auto_1876598 ?auto_1876599 )
      ( MAKE-14CRATE-VERIFY ?auto_1876586 ?auto_1876587 ?auto_1876588 ?auto_1876585 ?auto_1876589 ?auto_1876591 ?auto_1876590 ?auto_1876592 ?auto_1876593 ?auto_1876594 ?auto_1876595 ?auto_1876596 ?auto_1876597 ?auto_1876598 ?auto_1876599 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1893740 - SURFACE
      ?auto_1893741 - SURFACE
      ?auto_1893742 - SURFACE
      ?auto_1893739 - SURFACE
      ?auto_1893743 - SURFACE
      ?auto_1893745 - SURFACE
      ?auto_1893744 - SURFACE
      ?auto_1893746 - SURFACE
      ?auto_1893747 - SURFACE
      ?auto_1893748 - SURFACE
      ?auto_1893749 - SURFACE
      ?auto_1893750 - SURFACE
      ?auto_1893751 - SURFACE
      ?auto_1893752 - SURFACE
      ?auto_1893753 - SURFACE
      ?auto_1893754 - SURFACE
    )
    :vars
    (
      ?auto_1893756 - HOIST
      ?auto_1893755 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1893756 ?auto_1893755 ) ( SURFACE-AT ?auto_1893753 ?auto_1893755 ) ( CLEAR ?auto_1893753 ) ( LIFTING ?auto_1893756 ?auto_1893754 ) ( IS-CRATE ?auto_1893754 ) ( not ( = ?auto_1893753 ?auto_1893754 ) ) ( ON ?auto_1893741 ?auto_1893740 ) ( ON ?auto_1893742 ?auto_1893741 ) ( ON ?auto_1893739 ?auto_1893742 ) ( ON ?auto_1893743 ?auto_1893739 ) ( ON ?auto_1893745 ?auto_1893743 ) ( ON ?auto_1893744 ?auto_1893745 ) ( ON ?auto_1893746 ?auto_1893744 ) ( ON ?auto_1893747 ?auto_1893746 ) ( ON ?auto_1893748 ?auto_1893747 ) ( ON ?auto_1893749 ?auto_1893748 ) ( ON ?auto_1893750 ?auto_1893749 ) ( ON ?auto_1893751 ?auto_1893750 ) ( ON ?auto_1893752 ?auto_1893751 ) ( ON ?auto_1893753 ?auto_1893752 ) ( not ( = ?auto_1893740 ?auto_1893741 ) ) ( not ( = ?auto_1893740 ?auto_1893742 ) ) ( not ( = ?auto_1893740 ?auto_1893739 ) ) ( not ( = ?auto_1893740 ?auto_1893743 ) ) ( not ( = ?auto_1893740 ?auto_1893745 ) ) ( not ( = ?auto_1893740 ?auto_1893744 ) ) ( not ( = ?auto_1893740 ?auto_1893746 ) ) ( not ( = ?auto_1893740 ?auto_1893747 ) ) ( not ( = ?auto_1893740 ?auto_1893748 ) ) ( not ( = ?auto_1893740 ?auto_1893749 ) ) ( not ( = ?auto_1893740 ?auto_1893750 ) ) ( not ( = ?auto_1893740 ?auto_1893751 ) ) ( not ( = ?auto_1893740 ?auto_1893752 ) ) ( not ( = ?auto_1893740 ?auto_1893753 ) ) ( not ( = ?auto_1893740 ?auto_1893754 ) ) ( not ( = ?auto_1893741 ?auto_1893742 ) ) ( not ( = ?auto_1893741 ?auto_1893739 ) ) ( not ( = ?auto_1893741 ?auto_1893743 ) ) ( not ( = ?auto_1893741 ?auto_1893745 ) ) ( not ( = ?auto_1893741 ?auto_1893744 ) ) ( not ( = ?auto_1893741 ?auto_1893746 ) ) ( not ( = ?auto_1893741 ?auto_1893747 ) ) ( not ( = ?auto_1893741 ?auto_1893748 ) ) ( not ( = ?auto_1893741 ?auto_1893749 ) ) ( not ( = ?auto_1893741 ?auto_1893750 ) ) ( not ( = ?auto_1893741 ?auto_1893751 ) ) ( not ( = ?auto_1893741 ?auto_1893752 ) ) ( not ( = ?auto_1893741 ?auto_1893753 ) ) ( not ( = ?auto_1893741 ?auto_1893754 ) ) ( not ( = ?auto_1893742 ?auto_1893739 ) ) ( not ( = ?auto_1893742 ?auto_1893743 ) ) ( not ( = ?auto_1893742 ?auto_1893745 ) ) ( not ( = ?auto_1893742 ?auto_1893744 ) ) ( not ( = ?auto_1893742 ?auto_1893746 ) ) ( not ( = ?auto_1893742 ?auto_1893747 ) ) ( not ( = ?auto_1893742 ?auto_1893748 ) ) ( not ( = ?auto_1893742 ?auto_1893749 ) ) ( not ( = ?auto_1893742 ?auto_1893750 ) ) ( not ( = ?auto_1893742 ?auto_1893751 ) ) ( not ( = ?auto_1893742 ?auto_1893752 ) ) ( not ( = ?auto_1893742 ?auto_1893753 ) ) ( not ( = ?auto_1893742 ?auto_1893754 ) ) ( not ( = ?auto_1893739 ?auto_1893743 ) ) ( not ( = ?auto_1893739 ?auto_1893745 ) ) ( not ( = ?auto_1893739 ?auto_1893744 ) ) ( not ( = ?auto_1893739 ?auto_1893746 ) ) ( not ( = ?auto_1893739 ?auto_1893747 ) ) ( not ( = ?auto_1893739 ?auto_1893748 ) ) ( not ( = ?auto_1893739 ?auto_1893749 ) ) ( not ( = ?auto_1893739 ?auto_1893750 ) ) ( not ( = ?auto_1893739 ?auto_1893751 ) ) ( not ( = ?auto_1893739 ?auto_1893752 ) ) ( not ( = ?auto_1893739 ?auto_1893753 ) ) ( not ( = ?auto_1893739 ?auto_1893754 ) ) ( not ( = ?auto_1893743 ?auto_1893745 ) ) ( not ( = ?auto_1893743 ?auto_1893744 ) ) ( not ( = ?auto_1893743 ?auto_1893746 ) ) ( not ( = ?auto_1893743 ?auto_1893747 ) ) ( not ( = ?auto_1893743 ?auto_1893748 ) ) ( not ( = ?auto_1893743 ?auto_1893749 ) ) ( not ( = ?auto_1893743 ?auto_1893750 ) ) ( not ( = ?auto_1893743 ?auto_1893751 ) ) ( not ( = ?auto_1893743 ?auto_1893752 ) ) ( not ( = ?auto_1893743 ?auto_1893753 ) ) ( not ( = ?auto_1893743 ?auto_1893754 ) ) ( not ( = ?auto_1893745 ?auto_1893744 ) ) ( not ( = ?auto_1893745 ?auto_1893746 ) ) ( not ( = ?auto_1893745 ?auto_1893747 ) ) ( not ( = ?auto_1893745 ?auto_1893748 ) ) ( not ( = ?auto_1893745 ?auto_1893749 ) ) ( not ( = ?auto_1893745 ?auto_1893750 ) ) ( not ( = ?auto_1893745 ?auto_1893751 ) ) ( not ( = ?auto_1893745 ?auto_1893752 ) ) ( not ( = ?auto_1893745 ?auto_1893753 ) ) ( not ( = ?auto_1893745 ?auto_1893754 ) ) ( not ( = ?auto_1893744 ?auto_1893746 ) ) ( not ( = ?auto_1893744 ?auto_1893747 ) ) ( not ( = ?auto_1893744 ?auto_1893748 ) ) ( not ( = ?auto_1893744 ?auto_1893749 ) ) ( not ( = ?auto_1893744 ?auto_1893750 ) ) ( not ( = ?auto_1893744 ?auto_1893751 ) ) ( not ( = ?auto_1893744 ?auto_1893752 ) ) ( not ( = ?auto_1893744 ?auto_1893753 ) ) ( not ( = ?auto_1893744 ?auto_1893754 ) ) ( not ( = ?auto_1893746 ?auto_1893747 ) ) ( not ( = ?auto_1893746 ?auto_1893748 ) ) ( not ( = ?auto_1893746 ?auto_1893749 ) ) ( not ( = ?auto_1893746 ?auto_1893750 ) ) ( not ( = ?auto_1893746 ?auto_1893751 ) ) ( not ( = ?auto_1893746 ?auto_1893752 ) ) ( not ( = ?auto_1893746 ?auto_1893753 ) ) ( not ( = ?auto_1893746 ?auto_1893754 ) ) ( not ( = ?auto_1893747 ?auto_1893748 ) ) ( not ( = ?auto_1893747 ?auto_1893749 ) ) ( not ( = ?auto_1893747 ?auto_1893750 ) ) ( not ( = ?auto_1893747 ?auto_1893751 ) ) ( not ( = ?auto_1893747 ?auto_1893752 ) ) ( not ( = ?auto_1893747 ?auto_1893753 ) ) ( not ( = ?auto_1893747 ?auto_1893754 ) ) ( not ( = ?auto_1893748 ?auto_1893749 ) ) ( not ( = ?auto_1893748 ?auto_1893750 ) ) ( not ( = ?auto_1893748 ?auto_1893751 ) ) ( not ( = ?auto_1893748 ?auto_1893752 ) ) ( not ( = ?auto_1893748 ?auto_1893753 ) ) ( not ( = ?auto_1893748 ?auto_1893754 ) ) ( not ( = ?auto_1893749 ?auto_1893750 ) ) ( not ( = ?auto_1893749 ?auto_1893751 ) ) ( not ( = ?auto_1893749 ?auto_1893752 ) ) ( not ( = ?auto_1893749 ?auto_1893753 ) ) ( not ( = ?auto_1893749 ?auto_1893754 ) ) ( not ( = ?auto_1893750 ?auto_1893751 ) ) ( not ( = ?auto_1893750 ?auto_1893752 ) ) ( not ( = ?auto_1893750 ?auto_1893753 ) ) ( not ( = ?auto_1893750 ?auto_1893754 ) ) ( not ( = ?auto_1893751 ?auto_1893752 ) ) ( not ( = ?auto_1893751 ?auto_1893753 ) ) ( not ( = ?auto_1893751 ?auto_1893754 ) ) ( not ( = ?auto_1893752 ?auto_1893753 ) ) ( not ( = ?auto_1893752 ?auto_1893754 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1893753 ?auto_1893754 )
      ( MAKE-15CRATE-VERIFY ?auto_1893740 ?auto_1893741 ?auto_1893742 ?auto_1893739 ?auto_1893743 ?auto_1893745 ?auto_1893744 ?auto_1893746 ?auto_1893747 ?auto_1893748 ?auto_1893749 ?auto_1893750 ?auto_1893751 ?auto_1893752 ?auto_1893753 ?auto_1893754 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1893919 - SURFACE
      ?auto_1893920 - SURFACE
      ?auto_1893921 - SURFACE
      ?auto_1893918 - SURFACE
      ?auto_1893922 - SURFACE
      ?auto_1893924 - SURFACE
      ?auto_1893923 - SURFACE
      ?auto_1893925 - SURFACE
      ?auto_1893926 - SURFACE
      ?auto_1893927 - SURFACE
      ?auto_1893928 - SURFACE
      ?auto_1893929 - SURFACE
      ?auto_1893930 - SURFACE
      ?auto_1893931 - SURFACE
      ?auto_1893932 - SURFACE
      ?auto_1893933 - SURFACE
    )
    :vars
    (
      ?auto_1893935 - HOIST
      ?auto_1893936 - PLACE
      ?auto_1893934 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1893935 ?auto_1893936 ) ( SURFACE-AT ?auto_1893932 ?auto_1893936 ) ( CLEAR ?auto_1893932 ) ( IS-CRATE ?auto_1893933 ) ( not ( = ?auto_1893932 ?auto_1893933 ) ) ( TRUCK-AT ?auto_1893934 ?auto_1893936 ) ( AVAILABLE ?auto_1893935 ) ( IN ?auto_1893933 ?auto_1893934 ) ( ON ?auto_1893932 ?auto_1893931 ) ( not ( = ?auto_1893931 ?auto_1893932 ) ) ( not ( = ?auto_1893931 ?auto_1893933 ) ) ( ON ?auto_1893920 ?auto_1893919 ) ( ON ?auto_1893921 ?auto_1893920 ) ( ON ?auto_1893918 ?auto_1893921 ) ( ON ?auto_1893922 ?auto_1893918 ) ( ON ?auto_1893924 ?auto_1893922 ) ( ON ?auto_1893923 ?auto_1893924 ) ( ON ?auto_1893925 ?auto_1893923 ) ( ON ?auto_1893926 ?auto_1893925 ) ( ON ?auto_1893927 ?auto_1893926 ) ( ON ?auto_1893928 ?auto_1893927 ) ( ON ?auto_1893929 ?auto_1893928 ) ( ON ?auto_1893930 ?auto_1893929 ) ( ON ?auto_1893931 ?auto_1893930 ) ( not ( = ?auto_1893919 ?auto_1893920 ) ) ( not ( = ?auto_1893919 ?auto_1893921 ) ) ( not ( = ?auto_1893919 ?auto_1893918 ) ) ( not ( = ?auto_1893919 ?auto_1893922 ) ) ( not ( = ?auto_1893919 ?auto_1893924 ) ) ( not ( = ?auto_1893919 ?auto_1893923 ) ) ( not ( = ?auto_1893919 ?auto_1893925 ) ) ( not ( = ?auto_1893919 ?auto_1893926 ) ) ( not ( = ?auto_1893919 ?auto_1893927 ) ) ( not ( = ?auto_1893919 ?auto_1893928 ) ) ( not ( = ?auto_1893919 ?auto_1893929 ) ) ( not ( = ?auto_1893919 ?auto_1893930 ) ) ( not ( = ?auto_1893919 ?auto_1893931 ) ) ( not ( = ?auto_1893919 ?auto_1893932 ) ) ( not ( = ?auto_1893919 ?auto_1893933 ) ) ( not ( = ?auto_1893920 ?auto_1893921 ) ) ( not ( = ?auto_1893920 ?auto_1893918 ) ) ( not ( = ?auto_1893920 ?auto_1893922 ) ) ( not ( = ?auto_1893920 ?auto_1893924 ) ) ( not ( = ?auto_1893920 ?auto_1893923 ) ) ( not ( = ?auto_1893920 ?auto_1893925 ) ) ( not ( = ?auto_1893920 ?auto_1893926 ) ) ( not ( = ?auto_1893920 ?auto_1893927 ) ) ( not ( = ?auto_1893920 ?auto_1893928 ) ) ( not ( = ?auto_1893920 ?auto_1893929 ) ) ( not ( = ?auto_1893920 ?auto_1893930 ) ) ( not ( = ?auto_1893920 ?auto_1893931 ) ) ( not ( = ?auto_1893920 ?auto_1893932 ) ) ( not ( = ?auto_1893920 ?auto_1893933 ) ) ( not ( = ?auto_1893921 ?auto_1893918 ) ) ( not ( = ?auto_1893921 ?auto_1893922 ) ) ( not ( = ?auto_1893921 ?auto_1893924 ) ) ( not ( = ?auto_1893921 ?auto_1893923 ) ) ( not ( = ?auto_1893921 ?auto_1893925 ) ) ( not ( = ?auto_1893921 ?auto_1893926 ) ) ( not ( = ?auto_1893921 ?auto_1893927 ) ) ( not ( = ?auto_1893921 ?auto_1893928 ) ) ( not ( = ?auto_1893921 ?auto_1893929 ) ) ( not ( = ?auto_1893921 ?auto_1893930 ) ) ( not ( = ?auto_1893921 ?auto_1893931 ) ) ( not ( = ?auto_1893921 ?auto_1893932 ) ) ( not ( = ?auto_1893921 ?auto_1893933 ) ) ( not ( = ?auto_1893918 ?auto_1893922 ) ) ( not ( = ?auto_1893918 ?auto_1893924 ) ) ( not ( = ?auto_1893918 ?auto_1893923 ) ) ( not ( = ?auto_1893918 ?auto_1893925 ) ) ( not ( = ?auto_1893918 ?auto_1893926 ) ) ( not ( = ?auto_1893918 ?auto_1893927 ) ) ( not ( = ?auto_1893918 ?auto_1893928 ) ) ( not ( = ?auto_1893918 ?auto_1893929 ) ) ( not ( = ?auto_1893918 ?auto_1893930 ) ) ( not ( = ?auto_1893918 ?auto_1893931 ) ) ( not ( = ?auto_1893918 ?auto_1893932 ) ) ( not ( = ?auto_1893918 ?auto_1893933 ) ) ( not ( = ?auto_1893922 ?auto_1893924 ) ) ( not ( = ?auto_1893922 ?auto_1893923 ) ) ( not ( = ?auto_1893922 ?auto_1893925 ) ) ( not ( = ?auto_1893922 ?auto_1893926 ) ) ( not ( = ?auto_1893922 ?auto_1893927 ) ) ( not ( = ?auto_1893922 ?auto_1893928 ) ) ( not ( = ?auto_1893922 ?auto_1893929 ) ) ( not ( = ?auto_1893922 ?auto_1893930 ) ) ( not ( = ?auto_1893922 ?auto_1893931 ) ) ( not ( = ?auto_1893922 ?auto_1893932 ) ) ( not ( = ?auto_1893922 ?auto_1893933 ) ) ( not ( = ?auto_1893924 ?auto_1893923 ) ) ( not ( = ?auto_1893924 ?auto_1893925 ) ) ( not ( = ?auto_1893924 ?auto_1893926 ) ) ( not ( = ?auto_1893924 ?auto_1893927 ) ) ( not ( = ?auto_1893924 ?auto_1893928 ) ) ( not ( = ?auto_1893924 ?auto_1893929 ) ) ( not ( = ?auto_1893924 ?auto_1893930 ) ) ( not ( = ?auto_1893924 ?auto_1893931 ) ) ( not ( = ?auto_1893924 ?auto_1893932 ) ) ( not ( = ?auto_1893924 ?auto_1893933 ) ) ( not ( = ?auto_1893923 ?auto_1893925 ) ) ( not ( = ?auto_1893923 ?auto_1893926 ) ) ( not ( = ?auto_1893923 ?auto_1893927 ) ) ( not ( = ?auto_1893923 ?auto_1893928 ) ) ( not ( = ?auto_1893923 ?auto_1893929 ) ) ( not ( = ?auto_1893923 ?auto_1893930 ) ) ( not ( = ?auto_1893923 ?auto_1893931 ) ) ( not ( = ?auto_1893923 ?auto_1893932 ) ) ( not ( = ?auto_1893923 ?auto_1893933 ) ) ( not ( = ?auto_1893925 ?auto_1893926 ) ) ( not ( = ?auto_1893925 ?auto_1893927 ) ) ( not ( = ?auto_1893925 ?auto_1893928 ) ) ( not ( = ?auto_1893925 ?auto_1893929 ) ) ( not ( = ?auto_1893925 ?auto_1893930 ) ) ( not ( = ?auto_1893925 ?auto_1893931 ) ) ( not ( = ?auto_1893925 ?auto_1893932 ) ) ( not ( = ?auto_1893925 ?auto_1893933 ) ) ( not ( = ?auto_1893926 ?auto_1893927 ) ) ( not ( = ?auto_1893926 ?auto_1893928 ) ) ( not ( = ?auto_1893926 ?auto_1893929 ) ) ( not ( = ?auto_1893926 ?auto_1893930 ) ) ( not ( = ?auto_1893926 ?auto_1893931 ) ) ( not ( = ?auto_1893926 ?auto_1893932 ) ) ( not ( = ?auto_1893926 ?auto_1893933 ) ) ( not ( = ?auto_1893927 ?auto_1893928 ) ) ( not ( = ?auto_1893927 ?auto_1893929 ) ) ( not ( = ?auto_1893927 ?auto_1893930 ) ) ( not ( = ?auto_1893927 ?auto_1893931 ) ) ( not ( = ?auto_1893927 ?auto_1893932 ) ) ( not ( = ?auto_1893927 ?auto_1893933 ) ) ( not ( = ?auto_1893928 ?auto_1893929 ) ) ( not ( = ?auto_1893928 ?auto_1893930 ) ) ( not ( = ?auto_1893928 ?auto_1893931 ) ) ( not ( = ?auto_1893928 ?auto_1893932 ) ) ( not ( = ?auto_1893928 ?auto_1893933 ) ) ( not ( = ?auto_1893929 ?auto_1893930 ) ) ( not ( = ?auto_1893929 ?auto_1893931 ) ) ( not ( = ?auto_1893929 ?auto_1893932 ) ) ( not ( = ?auto_1893929 ?auto_1893933 ) ) ( not ( = ?auto_1893930 ?auto_1893931 ) ) ( not ( = ?auto_1893930 ?auto_1893932 ) ) ( not ( = ?auto_1893930 ?auto_1893933 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1893931 ?auto_1893932 ?auto_1893933 )
      ( MAKE-15CRATE-VERIFY ?auto_1893919 ?auto_1893920 ?auto_1893921 ?auto_1893918 ?auto_1893922 ?auto_1893924 ?auto_1893923 ?auto_1893925 ?auto_1893926 ?auto_1893927 ?auto_1893928 ?auto_1893929 ?auto_1893930 ?auto_1893931 ?auto_1893932 ?auto_1893933 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1894114 - SURFACE
      ?auto_1894115 - SURFACE
      ?auto_1894116 - SURFACE
      ?auto_1894113 - SURFACE
      ?auto_1894117 - SURFACE
      ?auto_1894119 - SURFACE
      ?auto_1894118 - SURFACE
      ?auto_1894120 - SURFACE
      ?auto_1894121 - SURFACE
      ?auto_1894122 - SURFACE
      ?auto_1894123 - SURFACE
      ?auto_1894124 - SURFACE
      ?auto_1894125 - SURFACE
      ?auto_1894126 - SURFACE
      ?auto_1894127 - SURFACE
      ?auto_1894128 - SURFACE
    )
    :vars
    (
      ?auto_1894130 - HOIST
      ?auto_1894131 - PLACE
      ?auto_1894132 - TRUCK
      ?auto_1894129 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1894130 ?auto_1894131 ) ( SURFACE-AT ?auto_1894127 ?auto_1894131 ) ( CLEAR ?auto_1894127 ) ( IS-CRATE ?auto_1894128 ) ( not ( = ?auto_1894127 ?auto_1894128 ) ) ( AVAILABLE ?auto_1894130 ) ( IN ?auto_1894128 ?auto_1894132 ) ( ON ?auto_1894127 ?auto_1894126 ) ( not ( = ?auto_1894126 ?auto_1894127 ) ) ( not ( = ?auto_1894126 ?auto_1894128 ) ) ( TRUCK-AT ?auto_1894132 ?auto_1894129 ) ( not ( = ?auto_1894129 ?auto_1894131 ) ) ( ON ?auto_1894115 ?auto_1894114 ) ( ON ?auto_1894116 ?auto_1894115 ) ( ON ?auto_1894113 ?auto_1894116 ) ( ON ?auto_1894117 ?auto_1894113 ) ( ON ?auto_1894119 ?auto_1894117 ) ( ON ?auto_1894118 ?auto_1894119 ) ( ON ?auto_1894120 ?auto_1894118 ) ( ON ?auto_1894121 ?auto_1894120 ) ( ON ?auto_1894122 ?auto_1894121 ) ( ON ?auto_1894123 ?auto_1894122 ) ( ON ?auto_1894124 ?auto_1894123 ) ( ON ?auto_1894125 ?auto_1894124 ) ( ON ?auto_1894126 ?auto_1894125 ) ( not ( = ?auto_1894114 ?auto_1894115 ) ) ( not ( = ?auto_1894114 ?auto_1894116 ) ) ( not ( = ?auto_1894114 ?auto_1894113 ) ) ( not ( = ?auto_1894114 ?auto_1894117 ) ) ( not ( = ?auto_1894114 ?auto_1894119 ) ) ( not ( = ?auto_1894114 ?auto_1894118 ) ) ( not ( = ?auto_1894114 ?auto_1894120 ) ) ( not ( = ?auto_1894114 ?auto_1894121 ) ) ( not ( = ?auto_1894114 ?auto_1894122 ) ) ( not ( = ?auto_1894114 ?auto_1894123 ) ) ( not ( = ?auto_1894114 ?auto_1894124 ) ) ( not ( = ?auto_1894114 ?auto_1894125 ) ) ( not ( = ?auto_1894114 ?auto_1894126 ) ) ( not ( = ?auto_1894114 ?auto_1894127 ) ) ( not ( = ?auto_1894114 ?auto_1894128 ) ) ( not ( = ?auto_1894115 ?auto_1894116 ) ) ( not ( = ?auto_1894115 ?auto_1894113 ) ) ( not ( = ?auto_1894115 ?auto_1894117 ) ) ( not ( = ?auto_1894115 ?auto_1894119 ) ) ( not ( = ?auto_1894115 ?auto_1894118 ) ) ( not ( = ?auto_1894115 ?auto_1894120 ) ) ( not ( = ?auto_1894115 ?auto_1894121 ) ) ( not ( = ?auto_1894115 ?auto_1894122 ) ) ( not ( = ?auto_1894115 ?auto_1894123 ) ) ( not ( = ?auto_1894115 ?auto_1894124 ) ) ( not ( = ?auto_1894115 ?auto_1894125 ) ) ( not ( = ?auto_1894115 ?auto_1894126 ) ) ( not ( = ?auto_1894115 ?auto_1894127 ) ) ( not ( = ?auto_1894115 ?auto_1894128 ) ) ( not ( = ?auto_1894116 ?auto_1894113 ) ) ( not ( = ?auto_1894116 ?auto_1894117 ) ) ( not ( = ?auto_1894116 ?auto_1894119 ) ) ( not ( = ?auto_1894116 ?auto_1894118 ) ) ( not ( = ?auto_1894116 ?auto_1894120 ) ) ( not ( = ?auto_1894116 ?auto_1894121 ) ) ( not ( = ?auto_1894116 ?auto_1894122 ) ) ( not ( = ?auto_1894116 ?auto_1894123 ) ) ( not ( = ?auto_1894116 ?auto_1894124 ) ) ( not ( = ?auto_1894116 ?auto_1894125 ) ) ( not ( = ?auto_1894116 ?auto_1894126 ) ) ( not ( = ?auto_1894116 ?auto_1894127 ) ) ( not ( = ?auto_1894116 ?auto_1894128 ) ) ( not ( = ?auto_1894113 ?auto_1894117 ) ) ( not ( = ?auto_1894113 ?auto_1894119 ) ) ( not ( = ?auto_1894113 ?auto_1894118 ) ) ( not ( = ?auto_1894113 ?auto_1894120 ) ) ( not ( = ?auto_1894113 ?auto_1894121 ) ) ( not ( = ?auto_1894113 ?auto_1894122 ) ) ( not ( = ?auto_1894113 ?auto_1894123 ) ) ( not ( = ?auto_1894113 ?auto_1894124 ) ) ( not ( = ?auto_1894113 ?auto_1894125 ) ) ( not ( = ?auto_1894113 ?auto_1894126 ) ) ( not ( = ?auto_1894113 ?auto_1894127 ) ) ( not ( = ?auto_1894113 ?auto_1894128 ) ) ( not ( = ?auto_1894117 ?auto_1894119 ) ) ( not ( = ?auto_1894117 ?auto_1894118 ) ) ( not ( = ?auto_1894117 ?auto_1894120 ) ) ( not ( = ?auto_1894117 ?auto_1894121 ) ) ( not ( = ?auto_1894117 ?auto_1894122 ) ) ( not ( = ?auto_1894117 ?auto_1894123 ) ) ( not ( = ?auto_1894117 ?auto_1894124 ) ) ( not ( = ?auto_1894117 ?auto_1894125 ) ) ( not ( = ?auto_1894117 ?auto_1894126 ) ) ( not ( = ?auto_1894117 ?auto_1894127 ) ) ( not ( = ?auto_1894117 ?auto_1894128 ) ) ( not ( = ?auto_1894119 ?auto_1894118 ) ) ( not ( = ?auto_1894119 ?auto_1894120 ) ) ( not ( = ?auto_1894119 ?auto_1894121 ) ) ( not ( = ?auto_1894119 ?auto_1894122 ) ) ( not ( = ?auto_1894119 ?auto_1894123 ) ) ( not ( = ?auto_1894119 ?auto_1894124 ) ) ( not ( = ?auto_1894119 ?auto_1894125 ) ) ( not ( = ?auto_1894119 ?auto_1894126 ) ) ( not ( = ?auto_1894119 ?auto_1894127 ) ) ( not ( = ?auto_1894119 ?auto_1894128 ) ) ( not ( = ?auto_1894118 ?auto_1894120 ) ) ( not ( = ?auto_1894118 ?auto_1894121 ) ) ( not ( = ?auto_1894118 ?auto_1894122 ) ) ( not ( = ?auto_1894118 ?auto_1894123 ) ) ( not ( = ?auto_1894118 ?auto_1894124 ) ) ( not ( = ?auto_1894118 ?auto_1894125 ) ) ( not ( = ?auto_1894118 ?auto_1894126 ) ) ( not ( = ?auto_1894118 ?auto_1894127 ) ) ( not ( = ?auto_1894118 ?auto_1894128 ) ) ( not ( = ?auto_1894120 ?auto_1894121 ) ) ( not ( = ?auto_1894120 ?auto_1894122 ) ) ( not ( = ?auto_1894120 ?auto_1894123 ) ) ( not ( = ?auto_1894120 ?auto_1894124 ) ) ( not ( = ?auto_1894120 ?auto_1894125 ) ) ( not ( = ?auto_1894120 ?auto_1894126 ) ) ( not ( = ?auto_1894120 ?auto_1894127 ) ) ( not ( = ?auto_1894120 ?auto_1894128 ) ) ( not ( = ?auto_1894121 ?auto_1894122 ) ) ( not ( = ?auto_1894121 ?auto_1894123 ) ) ( not ( = ?auto_1894121 ?auto_1894124 ) ) ( not ( = ?auto_1894121 ?auto_1894125 ) ) ( not ( = ?auto_1894121 ?auto_1894126 ) ) ( not ( = ?auto_1894121 ?auto_1894127 ) ) ( not ( = ?auto_1894121 ?auto_1894128 ) ) ( not ( = ?auto_1894122 ?auto_1894123 ) ) ( not ( = ?auto_1894122 ?auto_1894124 ) ) ( not ( = ?auto_1894122 ?auto_1894125 ) ) ( not ( = ?auto_1894122 ?auto_1894126 ) ) ( not ( = ?auto_1894122 ?auto_1894127 ) ) ( not ( = ?auto_1894122 ?auto_1894128 ) ) ( not ( = ?auto_1894123 ?auto_1894124 ) ) ( not ( = ?auto_1894123 ?auto_1894125 ) ) ( not ( = ?auto_1894123 ?auto_1894126 ) ) ( not ( = ?auto_1894123 ?auto_1894127 ) ) ( not ( = ?auto_1894123 ?auto_1894128 ) ) ( not ( = ?auto_1894124 ?auto_1894125 ) ) ( not ( = ?auto_1894124 ?auto_1894126 ) ) ( not ( = ?auto_1894124 ?auto_1894127 ) ) ( not ( = ?auto_1894124 ?auto_1894128 ) ) ( not ( = ?auto_1894125 ?auto_1894126 ) ) ( not ( = ?auto_1894125 ?auto_1894127 ) ) ( not ( = ?auto_1894125 ?auto_1894128 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1894126 ?auto_1894127 ?auto_1894128 )
      ( MAKE-15CRATE-VERIFY ?auto_1894114 ?auto_1894115 ?auto_1894116 ?auto_1894113 ?auto_1894117 ?auto_1894119 ?auto_1894118 ?auto_1894120 ?auto_1894121 ?auto_1894122 ?auto_1894123 ?auto_1894124 ?auto_1894125 ?auto_1894126 ?auto_1894127 ?auto_1894128 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1894324 - SURFACE
      ?auto_1894325 - SURFACE
      ?auto_1894326 - SURFACE
      ?auto_1894323 - SURFACE
      ?auto_1894327 - SURFACE
      ?auto_1894329 - SURFACE
      ?auto_1894328 - SURFACE
      ?auto_1894330 - SURFACE
      ?auto_1894331 - SURFACE
      ?auto_1894332 - SURFACE
      ?auto_1894333 - SURFACE
      ?auto_1894334 - SURFACE
      ?auto_1894335 - SURFACE
      ?auto_1894336 - SURFACE
      ?auto_1894337 - SURFACE
      ?auto_1894338 - SURFACE
    )
    :vars
    (
      ?auto_1894341 - HOIST
      ?auto_1894339 - PLACE
      ?auto_1894340 - TRUCK
      ?auto_1894343 - PLACE
      ?auto_1894342 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1894341 ?auto_1894339 ) ( SURFACE-AT ?auto_1894337 ?auto_1894339 ) ( CLEAR ?auto_1894337 ) ( IS-CRATE ?auto_1894338 ) ( not ( = ?auto_1894337 ?auto_1894338 ) ) ( AVAILABLE ?auto_1894341 ) ( ON ?auto_1894337 ?auto_1894336 ) ( not ( = ?auto_1894336 ?auto_1894337 ) ) ( not ( = ?auto_1894336 ?auto_1894338 ) ) ( TRUCK-AT ?auto_1894340 ?auto_1894343 ) ( not ( = ?auto_1894343 ?auto_1894339 ) ) ( HOIST-AT ?auto_1894342 ?auto_1894343 ) ( LIFTING ?auto_1894342 ?auto_1894338 ) ( not ( = ?auto_1894341 ?auto_1894342 ) ) ( ON ?auto_1894325 ?auto_1894324 ) ( ON ?auto_1894326 ?auto_1894325 ) ( ON ?auto_1894323 ?auto_1894326 ) ( ON ?auto_1894327 ?auto_1894323 ) ( ON ?auto_1894329 ?auto_1894327 ) ( ON ?auto_1894328 ?auto_1894329 ) ( ON ?auto_1894330 ?auto_1894328 ) ( ON ?auto_1894331 ?auto_1894330 ) ( ON ?auto_1894332 ?auto_1894331 ) ( ON ?auto_1894333 ?auto_1894332 ) ( ON ?auto_1894334 ?auto_1894333 ) ( ON ?auto_1894335 ?auto_1894334 ) ( ON ?auto_1894336 ?auto_1894335 ) ( not ( = ?auto_1894324 ?auto_1894325 ) ) ( not ( = ?auto_1894324 ?auto_1894326 ) ) ( not ( = ?auto_1894324 ?auto_1894323 ) ) ( not ( = ?auto_1894324 ?auto_1894327 ) ) ( not ( = ?auto_1894324 ?auto_1894329 ) ) ( not ( = ?auto_1894324 ?auto_1894328 ) ) ( not ( = ?auto_1894324 ?auto_1894330 ) ) ( not ( = ?auto_1894324 ?auto_1894331 ) ) ( not ( = ?auto_1894324 ?auto_1894332 ) ) ( not ( = ?auto_1894324 ?auto_1894333 ) ) ( not ( = ?auto_1894324 ?auto_1894334 ) ) ( not ( = ?auto_1894324 ?auto_1894335 ) ) ( not ( = ?auto_1894324 ?auto_1894336 ) ) ( not ( = ?auto_1894324 ?auto_1894337 ) ) ( not ( = ?auto_1894324 ?auto_1894338 ) ) ( not ( = ?auto_1894325 ?auto_1894326 ) ) ( not ( = ?auto_1894325 ?auto_1894323 ) ) ( not ( = ?auto_1894325 ?auto_1894327 ) ) ( not ( = ?auto_1894325 ?auto_1894329 ) ) ( not ( = ?auto_1894325 ?auto_1894328 ) ) ( not ( = ?auto_1894325 ?auto_1894330 ) ) ( not ( = ?auto_1894325 ?auto_1894331 ) ) ( not ( = ?auto_1894325 ?auto_1894332 ) ) ( not ( = ?auto_1894325 ?auto_1894333 ) ) ( not ( = ?auto_1894325 ?auto_1894334 ) ) ( not ( = ?auto_1894325 ?auto_1894335 ) ) ( not ( = ?auto_1894325 ?auto_1894336 ) ) ( not ( = ?auto_1894325 ?auto_1894337 ) ) ( not ( = ?auto_1894325 ?auto_1894338 ) ) ( not ( = ?auto_1894326 ?auto_1894323 ) ) ( not ( = ?auto_1894326 ?auto_1894327 ) ) ( not ( = ?auto_1894326 ?auto_1894329 ) ) ( not ( = ?auto_1894326 ?auto_1894328 ) ) ( not ( = ?auto_1894326 ?auto_1894330 ) ) ( not ( = ?auto_1894326 ?auto_1894331 ) ) ( not ( = ?auto_1894326 ?auto_1894332 ) ) ( not ( = ?auto_1894326 ?auto_1894333 ) ) ( not ( = ?auto_1894326 ?auto_1894334 ) ) ( not ( = ?auto_1894326 ?auto_1894335 ) ) ( not ( = ?auto_1894326 ?auto_1894336 ) ) ( not ( = ?auto_1894326 ?auto_1894337 ) ) ( not ( = ?auto_1894326 ?auto_1894338 ) ) ( not ( = ?auto_1894323 ?auto_1894327 ) ) ( not ( = ?auto_1894323 ?auto_1894329 ) ) ( not ( = ?auto_1894323 ?auto_1894328 ) ) ( not ( = ?auto_1894323 ?auto_1894330 ) ) ( not ( = ?auto_1894323 ?auto_1894331 ) ) ( not ( = ?auto_1894323 ?auto_1894332 ) ) ( not ( = ?auto_1894323 ?auto_1894333 ) ) ( not ( = ?auto_1894323 ?auto_1894334 ) ) ( not ( = ?auto_1894323 ?auto_1894335 ) ) ( not ( = ?auto_1894323 ?auto_1894336 ) ) ( not ( = ?auto_1894323 ?auto_1894337 ) ) ( not ( = ?auto_1894323 ?auto_1894338 ) ) ( not ( = ?auto_1894327 ?auto_1894329 ) ) ( not ( = ?auto_1894327 ?auto_1894328 ) ) ( not ( = ?auto_1894327 ?auto_1894330 ) ) ( not ( = ?auto_1894327 ?auto_1894331 ) ) ( not ( = ?auto_1894327 ?auto_1894332 ) ) ( not ( = ?auto_1894327 ?auto_1894333 ) ) ( not ( = ?auto_1894327 ?auto_1894334 ) ) ( not ( = ?auto_1894327 ?auto_1894335 ) ) ( not ( = ?auto_1894327 ?auto_1894336 ) ) ( not ( = ?auto_1894327 ?auto_1894337 ) ) ( not ( = ?auto_1894327 ?auto_1894338 ) ) ( not ( = ?auto_1894329 ?auto_1894328 ) ) ( not ( = ?auto_1894329 ?auto_1894330 ) ) ( not ( = ?auto_1894329 ?auto_1894331 ) ) ( not ( = ?auto_1894329 ?auto_1894332 ) ) ( not ( = ?auto_1894329 ?auto_1894333 ) ) ( not ( = ?auto_1894329 ?auto_1894334 ) ) ( not ( = ?auto_1894329 ?auto_1894335 ) ) ( not ( = ?auto_1894329 ?auto_1894336 ) ) ( not ( = ?auto_1894329 ?auto_1894337 ) ) ( not ( = ?auto_1894329 ?auto_1894338 ) ) ( not ( = ?auto_1894328 ?auto_1894330 ) ) ( not ( = ?auto_1894328 ?auto_1894331 ) ) ( not ( = ?auto_1894328 ?auto_1894332 ) ) ( not ( = ?auto_1894328 ?auto_1894333 ) ) ( not ( = ?auto_1894328 ?auto_1894334 ) ) ( not ( = ?auto_1894328 ?auto_1894335 ) ) ( not ( = ?auto_1894328 ?auto_1894336 ) ) ( not ( = ?auto_1894328 ?auto_1894337 ) ) ( not ( = ?auto_1894328 ?auto_1894338 ) ) ( not ( = ?auto_1894330 ?auto_1894331 ) ) ( not ( = ?auto_1894330 ?auto_1894332 ) ) ( not ( = ?auto_1894330 ?auto_1894333 ) ) ( not ( = ?auto_1894330 ?auto_1894334 ) ) ( not ( = ?auto_1894330 ?auto_1894335 ) ) ( not ( = ?auto_1894330 ?auto_1894336 ) ) ( not ( = ?auto_1894330 ?auto_1894337 ) ) ( not ( = ?auto_1894330 ?auto_1894338 ) ) ( not ( = ?auto_1894331 ?auto_1894332 ) ) ( not ( = ?auto_1894331 ?auto_1894333 ) ) ( not ( = ?auto_1894331 ?auto_1894334 ) ) ( not ( = ?auto_1894331 ?auto_1894335 ) ) ( not ( = ?auto_1894331 ?auto_1894336 ) ) ( not ( = ?auto_1894331 ?auto_1894337 ) ) ( not ( = ?auto_1894331 ?auto_1894338 ) ) ( not ( = ?auto_1894332 ?auto_1894333 ) ) ( not ( = ?auto_1894332 ?auto_1894334 ) ) ( not ( = ?auto_1894332 ?auto_1894335 ) ) ( not ( = ?auto_1894332 ?auto_1894336 ) ) ( not ( = ?auto_1894332 ?auto_1894337 ) ) ( not ( = ?auto_1894332 ?auto_1894338 ) ) ( not ( = ?auto_1894333 ?auto_1894334 ) ) ( not ( = ?auto_1894333 ?auto_1894335 ) ) ( not ( = ?auto_1894333 ?auto_1894336 ) ) ( not ( = ?auto_1894333 ?auto_1894337 ) ) ( not ( = ?auto_1894333 ?auto_1894338 ) ) ( not ( = ?auto_1894334 ?auto_1894335 ) ) ( not ( = ?auto_1894334 ?auto_1894336 ) ) ( not ( = ?auto_1894334 ?auto_1894337 ) ) ( not ( = ?auto_1894334 ?auto_1894338 ) ) ( not ( = ?auto_1894335 ?auto_1894336 ) ) ( not ( = ?auto_1894335 ?auto_1894337 ) ) ( not ( = ?auto_1894335 ?auto_1894338 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1894336 ?auto_1894337 ?auto_1894338 )
      ( MAKE-15CRATE-VERIFY ?auto_1894324 ?auto_1894325 ?auto_1894326 ?auto_1894323 ?auto_1894327 ?auto_1894329 ?auto_1894328 ?auto_1894330 ?auto_1894331 ?auto_1894332 ?auto_1894333 ?auto_1894334 ?auto_1894335 ?auto_1894336 ?auto_1894337 ?auto_1894338 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1894549 - SURFACE
      ?auto_1894550 - SURFACE
      ?auto_1894551 - SURFACE
      ?auto_1894548 - SURFACE
      ?auto_1894552 - SURFACE
      ?auto_1894554 - SURFACE
      ?auto_1894553 - SURFACE
      ?auto_1894555 - SURFACE
      ?auto_1894556 - SURFACE
      ?auto_1894557 - SURFACE
      ?auto_1894558 - SURFACE
      ?auto_1894559 - SURFACE
      ?auto_1894560 - SURFACE
      ?auto_1894561 - SURFACE
      ?auto_1894562 - SURFACE
      ?auto_1894563 - SURFACE
    )
    :vars
    (
      ?auto_1894569 - HOIST
      ?auto_1894564 - PLACE
      ?auto_1894565 - TRUCK
      ?auto_1894566 - PLACE
      ?auto_1894568 - HOIST
      ?auto_1894567 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1894569 ?auto_1894564 ) ( SURFACE-AT ?auto_1894562 ?auto_1894564 ) ( CLEAR ?auto_1894562 ) ( IS-CRATE ?auto_1894563 ) ( not ( = ?auto_1894562 ?auto_1894563 ) ) ( AVAILABLE ?auto_1894569 ) ( ON ?auto_1894562 ?auto_1894561 ) ( not ( = ?auto_1894561 ?auto_1894562 ) ) ( not ( = ?auto_1894561 ?auto_1894563 ) ) ( TRUCK-AT ?auto_1894565 ?auto_1894566 ) ( not ( = ?auto_1894566 ?auto_1894564 ) ) ( HOIST-AT ?auto_1894568 ?auto_1894566 ) ( not ( = ?auto_1894569 ?auto_1894568 ) ) ( AVAILABLE ?auto_1894568 ) ( SURFACE-AT ?auto_1894563 ?auto_1894566 ) ( ON ?auto_1894563 ?auto_1894567 ) ( CLEAR ?auto_1894563 ) ( not ( = ?auto_1894562 ?auto_1894567 ) ) ( not ( = ?auto_1894563 ?auto_1894567 ) ) ( not ( = ?auto_1894561 ?auto_1894567 ) ) ( ON ?auto_1894550 ?auto_1894549 ) ( ON ?auto_1894551 ?auto_1894550 ) ( ON ?auto_1894548 ?auto_1894551 ) ( ON ?auto_1894552 ?auto_1894548 ) ( ON ?auto_1894554 ?auto_1894552 ) ( ON ?auto_1894553 ?auto_1894554 ) ( ON ?auto_1894555 ?auto_1894553 ) ( ON ?auto_1894556 ?auto_1894555 ) ( ON ?auto_1894557 ?auto_1894556 ) ( ON ?auto_1894558 ?auto_1894557 ) ( ON ?auto_1894559 ?auto_1894558 ) ( ON ?auto_1894560 ?auto_1894559 ) ( ON ?auto_1894561 ?auto_1894560 ) ( not ( = ?auto_1894549 ?auto_1894550 ) ) ( not ( = ?auto_1894549 ?auto_1894551 ) ) ( not ( = ?auto_1894549 ?auto_1894548 ) ) ( not ( = ?auto_1894549 ?auto_1894552 ) ) ( not ( = ?auto_1894549 ?auto_1894554 ) ) ( not ( = ?auto_1894549 ?auto_1894553 ) ) ( not ( = ?auto_1894549 ?auto_1894555 ) ) ( not ( = ?auto_1894549 ?auto_1894556 ) ) ( not ( = ?auto_1894549 ?auto_1894557 ) ) ( not ( = ?auto_1894549 ?auto_1894558 ) ) ( not ( = ?auto_1894549 ?auto_1894559 ) ) ( not ( = ?auto_1894549 ?auto_1894560 ) ) ( not ( = ?auto_1894549 ?auto_1894561 ) ) ( not ( = ?auto_1894549 ?auto_1894562 ) ) ( not ( = ?auto_1894549 ?auto_1894563 ) ) ( not ( = ?auto_1894549 ?auto_1894567 ) ) ( not ( = ?auto_1894550 ?auto_1894551 ) ) ( not ( = ?auto_1894550 ?auto_1894548 ) ) ( not ( = ?auto_1894550 ?auto_1894552 ) ) ( not ( = ?auto_1894550 ?auto_1894554 ) ) ( not ( = ?auto_1894550 ?auto_1894553 ) ) ( not ( = ?auto_1894550 ?auto_1894555 ) ) ( not ( = ?auto_1894550 ?auto_1894556 ) ) ( not ( = ?auto_1894550 ?auto_1894557 ) ) ( not ( = ?auto_1894550 ?auto_1894558 ) ) ( not ( = ?auto_1894550 ?auto_1894559 ) ) ( not ( = ?auto_1894550 ?auto_1894560 ) ) ( not ( = ?auto_1894550 ?auto_1894561 ) ) ( not ( = ?auto_1894550 ?auto_1894562 ) ) ( not ( = ?auto_1894550 ?auto_1894563 ) ) ( not ( = ?auto_1894550 ?auto_1894567 ) ) ( not ( = ?auto_1894551 ?auto_1894548 ) ) ( not ( = ?auto_1894551 ?auto_1894552 ) ) ( not ( = ?auto_1894551 ?auto_1894554 ) ) ( not ( = ?auto_1894551 ?auto_1894553 ) ) ( not ( = ?auto_1894551 ?auto_1894555 ) ) ( not ( = ?auto_1894551 ?auto_1894556 ) ) ( not ( = ?auto_1894551 ?auto_1894557 ) ) ( not ( = ?auto_1894551 ?auto_1894558 ) ) ( not ( = ?auto_1894551 ?auto_1894559 ) ) ( not ( = ?auto_1894551 ?auto_1894560 ) ) ( not ( = ?auto_1894551 ?auto_1894561 ) ) ( not ( = ?auto_1894551 ?auto_1894562 ) ) ( not ( = ?auto_1894551 ?auto_1894563 ) ) ( not ( = ?auto_1894551 ?auto_1894567 ) ) ( not ( = ?auto_1894548 ?auto_1894552 ) ) ( not ( = ?auto_1894548 ?auto_1894554 ) ) ( not ( = ?auto_1894548 ?auto_1894553 ) ) ( not ( = ?auto_1894548 ?auto_1894555 ) ) ( not ( = ?auto_1894548 ?auto_1894556 ) ) ( not ( = ?auto_1894548 ?auto_1894557 ) ) ( not ( = ?auto_1894548 ?auto_1894558 ) ) ( not ( = ?auto_1894548 ?auto_1894559 ) ) ( not ( = ?auto_1894548 ?auto_1894560 ) ) ( not ( = ?auto_1894548 ?auto_1894561 ) ) ( not ( = ?auto_1894548 ?auto_1894562 ) ) ( not ( = ?auto_1894548 ?auto_1894563 ) ) ( not ( = ?auto_1894548 ?auto_1894567 ) ) ( not ( = ?auto_1894552 ?auto_1894554 ) ) ( not ( = ?auto_1894552 ?auto_1894553 ) ) ( not ( = ?auto_1894552 ?auto_1894555 ) ) ( not ( = ?auto_1894552 ?auto_1894556 ) ) ( not ( = ?auto_1894552 ?auto_1894557 ) ) ( not ( = ?auto_1894552 ?auto_1894558 ) ) ( not ( = ?auto_1894552 ?auto_1894559 ) ) ( not ( = ?auto_1894552 ?auto_1894560 ) ) ( not ( = ?auto_1894552 ?auto_1894561 ) ) ( not ( = ?auto_1894552 ?auto_1894562 ) ) ( not ( = ?auto_1894552 ?auto_1894563 ) ) ( not ( = ?auto_1894552 ?auto_1894567 ) ) ( not ( = ?auto_1894554 ?auto_1894553 ) ) ( not ( = ?auto_1894554 ?auto_1894555 ) ) ( not ( = ?auto_1894554 ?auto_1894556 ) ) ( not ( = ?auto_1894554 ?auto_1894557 ) ) ( not ( = ?auto_1894554 ?auto_1894558 ) ) ( not ( = ?auto_1894554 ?auto_1894559 ) ) ( not ( = ?auto_1894554 ?auto_1894560 ) ) ( not ( = ?auto_1894554 ?auto_1894561 ) ) ( not ( = ?auto_1894554 ?auto_1894562 ) ) ( not ( = ?auto_1894554 ?auto_1894563 ) ) ( not ( = ?auto_1894554 ?auto_1894567 ) ) ( not ( = ?auto_1894553 ?auto_1894555 ) ) ( not ( = ?auto_1894553 ?auto_1894556 ) ) ( not ( = ?auto_1894553 ?auto_1894557 ) ) ( not ( = ?auto_1894553 ?auto_1894558 ) ) ( not ( = ?auto_1894553 ?auto_1894559 ) ) ( not ( = ?auto_1894553 ?auto_1894560 ) ) ( not ( = ?auto_1894553 ?auto_1894561 ) ) ( not ( = ?auto_1894553 ?auto_1894562 ) ) ( not ( = ?auto_1894553 ?auto_1894563 ) ) ( not ( = ?auto_1894553 ?auto_1894567 ) ) ( not ( = ?auto_1894555 ?auto_1894556 ) ) ( not ( = ?auto_1894555 ?auto_1894557 ) ) ( not ( = ?auto_1894555 ?auto_1894558 ) ) ( not ( = ?auto_1894555 ?auto_1894559 ) ) ( not ( = ?auto_1894555 ?auto_1894560 ) ) ( not ( = ?auto_1894555 ?auto_1894561 ) ) ( not ( = ?auto_1894555 ?auto_1894562 ) ) ( not ( = ?auto_1894555 ?auto_1894563 ) ) ( not ( = ?auto_1894555 ?auto_1894567 ) ) ( not ( = ?auto_1894556 ?auto_1894557 ) ) ( not ( = ?auto_1894556 ?auto_1894558 ) ) ( not ( = ?auto_1894556 ?auto_1894559 ) ) ( not ( = ?auto_1894556 ?auto_1894560 ) ) ( not ( = ?auto_1894556 ?auto_1894561 ) ) ( not ( = ?auto_1894556 ?auto_1894562 ) ) ( not ( = ?auto_1894556 ?auto_1894563 ) ) ( not ( = ?auto_1894556 ?auto_1894567 ) ) ( not ( = ?auto_1894557 ?auto_1894558 ) ) ( not ( = ?auto_1894557 ?auto_1894559 ) ) ( not ( = ?auto_1894557 ?auto_1894560 ) ) ( not ( = ?auto_1894557 ?auto_1894561 ) ) ( not ( = ?auto_1894557 ?auto_1894562 ) ) ( not ( = ?auto_1894557 ?auto_1894563 ) ) ( not ( = ?auto_1894557 ?auto_1894567 ) ) ( not ( = ?auto_1894558 ?auto_1894559 ) ) ( not ( = ?auto_1894558 ?auto_1894560 ) ) ( not ( = ?auto_1894558 ?auto_1894561 ) ) ( not ( = ?auto_1894558 ?auto_1894562 ) ) ( not ( = ?auto_1894558 ?auto_1894563 ) ) ( not ( = ?auto_1894558 ?auto_1894567 ) ) ( not ( = ?auto_1894559 ?auto_1894560 ) ) ( not ( = ?auto_1894559 ?auto_1894561 ) ) ( not ( = ?auto_1894559 ?auto_1894562 ) ) ( not ( = ?auto_1894559 ?auto_1894563 ) ) ( not ( = ?auto_1894559 ?auto_1894567 ) ) ( not ( = ?auto_1894560 ?auto_1894561 ) ) ( not ( = ?auto_1894560 ?auto_1894562 ) ) ( not ( = ?auto_1894560 ?auto_1894563 ) ) ( not ( = ?auto_1894560 ?auto_1894567 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1894561 ?auto_1894562 ?auto_1894563 )
      ( MAKE-15CRATE-VERIFY ?auto_1894549 ?auto_1894550 ?auto_1894551 ?auto_1894548 ?auto_1894552 ?auto_1894554 ?auto_1894553 ?auto_1894555 ?auto_1894556 ?auto_1894557 ?auto_1894558 ?auto_1894559 ?auto_1894560 ?auto_1894561 ?auto_1894562 ?auto_1894563 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1894775 - SURFACE
      ?auto_1894776 - SURFACE
      ?auto_1894777 - SURFACE
      ?auto_1894774 - SURFACE
      ?auto_1894778 - SURFACE
      ?auto_1894780 - SURFACE
      ?auto_1894779 - SURFACE
      ?auto_1894781 - SURFACE
      ?auto_1894782 - SURFACE
      ?auto_1894783 - SURFACE
      ?auto_1894784 - SURFACE
      ?auto_1894785 - SURFACE
      ?auto_1894786 - SURFACE
      ?auto_1894787 - SURFACE
      ?auto_1894788 - SURFACE
      ?auto_1894789 - SURFACE
    )
    :vars
    (
      ?auto_1894791 - HOIST
      ?auto_1894794 - PLACE
      ?auto_1894792 - PLACE
      ?auto_1894795 - HOIST
      ?auto_1894793 - SURFACE
      ?auto_1894790 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1894791 ?auto_1894794 ) ( SURFACE-AT ?auto_1894788 ?auto_1894794 ) ( CLEAR ?auto_1894788 ) ( IS-CRATE ?auto_1894789 ) ( not ( = ?auto_1894788 ?auto_1894789 ) ) ( AVAILABLE ?auto_1894791 ) ( ON ?auto_1894788 ?auto_1894787 ) ( not ( = ?auto_1894787 ?auto_1894788 ) ) ( not ( = ?auto_1894787 ?auto_1894789 ) ) ( not ( = ?auto_1894792 ?auto_1894794 ) ) ( HOIST-AT ?auto_1894795 ?auto_1894792 ) ( not ( = ?auto_1894791 ?auto_1894795 ) ) ( AVAILABLE ?auto_1894795 ) ( SURFACE-AT ?auto_1894789 ?auto_1894792 ) ( ON ?auto_1894789 ?auto_1894793 ) ( CLEAR ?auto_1894789 ) ( not ( = ?auto_1894788 ?auto_1894793 ) ) ( not ( = ?auto_1894789 ?auto_1894793 ) ) ( not ( = ?auto_1894787 ?auto_1894793 ) ) ( TRUCK-AT ?auto_1894790 ?auto_1894794 ) ( ON ?auto_1894776 ?auto_1894775 ) ( ON ?auto_1894777 ?auto_1894776 ) ( ON ?auto_1894774 ?auto_1894777 ) ( ON ?auto_1894778 ?auto_1894774 ) ( ON ?auto_1894780 ?auto_1894778 ) ( ON ?auto_1894779 ?auto_1894780 ) ( ON ?auto_1894781 ?auto_1894779 ) ( ON ?auto_1894782 ?auto_1894781 ) ( ON ?auto_1894783 ?auto_1894782 ) ( ON ?auto_1894784 ?auto_1894783 ) ( ON ?auto_1894785 ?auto_1894784 ) ( ON ?auto_1894786 ?auto_1894785 ) ( ON ?auto_1894787 ?auto_1894786 ) ( not ( = ?auto_1894775 ?auto_1894776 ) ) ( not ( = ?auto_1894775 ?auto_1894777 ) ) ( not ( = ?auto_1894775 ?auto_1894774 ) ) ( not ( = ?auto_1894775 ?auto_1894778 ) ) ( not ( = ?auto_1894775 ?auto_1894780 ) ) ( not ( = ?auto_1894775 ?auto_1894779 ) ) ( not ( = ?auto_1894775 ?auto_1894781 ) ) ( not ( = ?auto_1894775 ?auto_1894782 ) ) ( not ( = ?auto_1894775 ?auto_1894783 ) ) ( not ( = ?auto_1894775 ?auto_1894784 ) ) ( not ( = ?auto_1894775 ?auto_1894785 ) ) ( not ( = ?auto_1894775 ?auto_1894786 ) ) ( not ( = ?auto_1894775 ?auto_1894787 ) ) ( not ( = ?auto_1894775 ?auto_1894788 ) ) ( not ( = ?auto_1894775 ?auto_1894789 ) ) ( not ( = ?auto_1894775 ?auto_1894793 ) ) ( not ( = ?auto_1894776 ?auto_1894777 ) ) ( not ( = ?auto_1894776 ?auto_1894774 ) ) ( not ( = ?auto_1894776 ?auto_1894778 ) ) ( not ( = ?auto_1894776 ?auto_1894780 ) ) ( not ( = ?auto_1894776 ?auto_1894779 ) ) ( not ( = ?auto_1894776 ?auto_1894781 ) ) ( not ( = ?auto_1894776 ?auto_1894782 ) ) ( not ( = ?auto_1894776 ?auto_1894783 ) ) ( not ( = ?auto_1894776 ?auto_1894784 ) ) ( not ( = ?auto_1894776 ?auto_1894785 ) ) ( not ( = ?auto_1894776 ?auto_1894786 ) ) ( not ( = ?auto_1894776 ?auto_1894787 ) ) ( not ( = ?auto_1894776 ?auto_1894788 ) ) ( not ( = ?auto_1894776 ?auto_1894789 ) ) ( not ( = ?auto_1894776 ?auto_1894793 ) ) ( not ( = ?auto_1894777 ?auto_1894774 ) ) ( not ( = ?auto_1894777 ?auto_1894778 ) ) ( not ( = ?auto_1894777 ?auto_1894780 ) ) ( not ( = ?auto_1894777 ?auto_1894779 ) ) ( not ( = ?auto_1894777 ?auto_1894781 ) ) ( not ( = ?auto_1894777 ?auto_1894782 ) ) ( not ( = ?auto_1894777 ?auto_1894783 ) ) ( not ( = ?auto_1894777 ?auto_1894784 ) ) ( not ( = ?auto_1894777 ?auto_1894785 ) ) ( not ( = ?auto_1894777 ?auto_1894786 ) ) ( not ( = ?auto_1894777 ?auto_1894787 ) ) ( not ( = ?auto_1894777 ?auto_1894788 ) ) ( not ( = ?auto_1894777 ?auto_1894789 ) ) ( not ( = ?auto_1894777 ?auto_1894793 ) ) ( not ( = ?auto_1894774 ?auto_1894778 ) ) ( not ( = ?auto_1894774 ?auto_1894780 ) ) ( not ( = ?auto_1894774 ?auto_1894779 ) ) ( not ( = ?auto_1894774 ?auto_1894781 ) ) ( not ( = ?auto_1894774 ?auto_1894782 ) ) ( not ( = ?auto_1894774 ?auto_1894783 ) ) ( not ( = ?auto_1894774 ?auto_1894784 ) ) ( not ( = ?auto_1894774 ?auto_1894785 ) ) ( not ( = ?auto_1894774 ?auto_1894786 ) ) ( not ( = ?auto_1894774 ?auto_1894787 ) ) ( not ( = ?auto_1894774 ?auto_1894788 ) ) ( not ( = ?auto_1894774 ?auto_1894789 ) ) ( not ( = ?auto_1894774 ?auto_1894793 ) ) ( not ( = ?auto_1894778 ?auto_1894780 ) ) ( not ( = ?auto_1894778 ?auto_1894779 ) ) ( not ( = ?auto_1894778 ?auto_1894781 ) ) ( not ( = ?auto_1894778 ?auto_1894782 ) ) ( not ( = ?auto_1894778 ?auto_1894783 ) ) ( not ( = ?auto_1894778 ?auto_1894784 ) ) ( not ( = ?auto_1894778 ?auto_1894785 ) ) ( not ( = ?auto_1894778 ?auto_1894786 ) ) ( not ( = ?auto_1894778 ?auto_1894787 ) ) ( not ( = ?auto_1894778 ?auto_1894788 ) ) ( not ( = ?auto_1894778 ?auto_1894789 ) ) ( not ( = ?auto_1894778 ?auto_1894793 ) ) ( not ( = ?auto_1894780 ?auto_1894779 ) ) ( not ( = ?auto_1894780 ?auto_1894781 ) ) ( not ( = ?auto_1894780 ?auto_1894782 ) ) ( not ( = ?auto_1894780 ?auto_1894783 ) ) ( not ( = ?auto_1894780 ?auto_1894784 ) ) ( not ( = ?auto_1894780 ?auto_1894785 ) ) ( not ( = ?auto_1894780 ?auto_1894786 ) ) ( not ( = ?auto_1894780 ?auto_1894787 ) ) ( not ( = ?auto_1894780 ?auto_1894788 ) ) ( not ( = ?auto_1894780 ?auto_1894789 ) ) ( not ( = ?auto_1894780 ?auto_1894793 ) ) ( not ( = ?auto_1894779 ?auto_1894781 ) ) ( not ( = ?auto_1894779 ?auto_1894782 ) ) ( not ( = ?auto_1894779 ?auto_1894783 ) ) ( not ( = ?auto_1894779 ?auto_1894784 ) ) ( not ( = ?auto_1894779 ?auto_1894785 ) ) ( not ( = ?auto_1894779 ?auto_1894786 ) ) ( not ( = ?auto_1894779 ?auto_1894787 ) ) ( not ( = ?auto_1894779 ?auto_1894788 ) ) ( not ( = ?auto_1894779 ?auto_1894789 ) ) ( not ( = ?auto_1894779 ?auto_1894793 ) ) ( not ( = ?auto_1894781 ?auto_1894782 ) ) ( not ( = ?auto_1894781 ?auto_1894783 ) ) ( not ( = ?auto_1894781 ?auto_1894784 ) ) ( not ( = ?auto_1894781 ?auto_1894785 ) ) ( not ( = ?auto_1894781 ?auto_1894786 ) ) ( not ( = ?auto_1894781 ?auto_1894787 ) ) ( not ( = ?auto_1894781 ?auto_1894788 ) ) ( not ( = ?auto_1894781 ?auto_1894789 ) ) ( not ( = ?auto_1894781 ?auto_1894793 ) ) ( not ( = ?auto_1894782 ?auto_1894783 ) ) ( not ( = ?auto_1894782 ?auto_1894784 ) ) ( not ( = ?auto_1894782 ?auto_1894785 ) ) ( not ( = ?auto_1894782 ?auto_1894786 ) ) ( not ( = ?auto_1894782 ?auto_1894787 ) ) ( not ( = ?auto_1894782 ?auto_1894788 ) ) ( not ( = ?auto_1894782 ?auto_1894789 ) ) ( not ( = ?auto_1894782 ?auto_1894793 ) ) ( not ( = ?auto_1894783 ?auto_1894784 ) ) ( not ( = ?auto_1894783 ?auto_1894785 ) ) ( not ( = ?auto_1894783 ?auto_1894786 ) ) ( not ( = ?auto_1894783 ?auto_1894787 ) ) ( not ( = ?auto_1894783 ?auto_1894788 ) ) ( not ( = ?auto_1894783 ?auto_1894789 ) ) ( not ( = ?auto_1894783 ?auto_1894793 ) ) ( not ( = ?auto_1894784 ?auto_1894785 ) ) ( not ( = ?auto_1894784 ?auto_1894786 ) ) ( not ( = ?auto_1894784 ?auto_1894787 ) ) ( not ( = ?auto_1894784 ?auto_1894788 ) ) ( not ( = ?auto_1894784 ?auto_1894789 ) ) ( not ( = ?auto_1894784 ?auto_1894793 ) ) ( not ( = ?auto_1894785 ?auto_1894786 ) ) ( not ( = ?auto_1894785 ?auto_1894787 ) ) ( not ( = ?auto_1894785 ?auto_1894788 ) ) ( not ( = ?auto_1894785 ?auto_1894789 ) ) ( not ( = ?auto_1894785 ?auto_1894793 ) ) ( not ( = ?auto_1894786 ?auto_1894787 ) ) ( not ( = ?auto_1894786 ?auto_1894788 ) ) ( not ( = ?auto_1894786 ?auto_1894789 ) ) ( not ( = ?auto_1894786 ?auto_1894793 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1894787 ?auto_1894788 ?auto_1894789 )
      ( MAKE-15CRATE-VERIFY ?auto_1894775 ?auto_1894776 ?auto_1894777 ?auto_1894774 ?auto_1894778 ?auto_1894780 ?auto_1894779 ?auto_1894781 ?auto_1894782 ?auto_1894783 ?auto_1894784 ?auto_1894785 ?auto_1894786 ?auto_1894787 ?auto_1894788 ?auto_1894789 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1895001 - SURFACE
      ?auto_1895002 - SURFACE
      ?auto_1895003 - SURFACE
      ?auto_1895000 - SURFACE
      ?auto_1895004 - SURFACE
      ?auto_1895006 - SURFACE
      ?auto_1895005 - SURFACE
      ?auto_1895007 - SURFACE
      ?auto_1895008 - SURFACE
      ?auto_1895009 - SURFACE
      ?auto_1895010 - SURFACE
      ?auto_1895011 - SURFACE
      ?auto_1895012 - SURFACE
      ?auto_1895013 - SURFACE
      ?auto_1895014 - SURFACE
      ?auto_1895015 - SURFACE
    )
    :vars
    (
      ?auto_1895017 - HOIST
      ?auto_1895019 - PLACE
      ?auto_1895021 - PLACE
      ?auto_1895020 - HOIST
      ?auto_1895018 - SURFACE
      ?auto_1895016 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1895017 ?auto_1895019 ) ( IS-CRATE ?auto_1895015 ) ( not ( = ?auto_1895014 ?auto_1895015 ) ) ( not ( = ?auto_1895013 ?auto_1895014 ) ) ( not ( = ?auto_1895013 ?auto_1895015 ) ) ( not ( = ?auto_1895021 ?auto_1895019 ) ) ( HOIST-AT ?auto_1895020 ?auto_1895021 ) ( not ( = ?auto_1895017 ?auto_1895020 ) ) ( AVAILABLE ?auto_1895020 ) ( SURFACE-AT ?auto_1895015 ?auto_1895021 ) ( ON ?auto_1895015 ?auto_1895018 ) ( CLEAR ?auto_1895015 ) ( not ( = ?auto_1895014 ?auto_1895018 ) ) ( not ( = ?auto_1895015 ?auto_1895018 ) ) ( not ( = ?auto_1895013 ?auto_1895018 ) ) ( TRUCK-AT ?auto_1895016 ?auto_1895019 ) ( SURFACE-AT ?auto_1895013 ?auto_1895019 ) ( CLEAR ?auto_1895013 ) ( LIFTING ?auto_1895017 ?auto_1895014 ) ( IS-CRATE ?auto_1895014 ) ( ON ?auto_1895002 ?auto_1895001 ) ( ON ?auto_1895003 ?auto_1895002 ) ( ON ?auto_1895000 ?auto_1895003 ) ( ON ?auto_1895004 ?auto_1895000 ) ( ON ?auto_1895006 ?auto_1895004 ) ( ON ?auto_1895005 ?auto_1895006 ) ( ON ?auto_1895007 ?auto_1895005 ) ( ON ?auto_1895008 ?auto_1895007 ) ( ON ?auto_1895009 ?auto_1895008 ) ( ON ?auto_1895010 ?auto_1895009 ) ( ON ?auto_1895011 ?auto_1895010 ) ( ON ?auto_1895012 ?auto_1895011 ) ( ON ?auto_1895013 ?auto_1895012 ) ( not ( = ?auto_1895001 ?auto_1895002 ) ) ( not ( = ?auto_1895001 ?auto_1895003 ) ) ( not ( = ?auto_1895001 ?auto_1895000 ) ) ( not ( = ?auto_1895001 ?auto_1895004 ) ) ( not ( = ?auto_1895001 ?auto_1895006 ) ) ( not ( = ?auto_1895001 ?auto_1895005 ) ) ( not ( = ?auto_1895001 ?auto_1895007 ) ) ( not ( = ?auto_1895001 ?auto_1895008 ) ) ( not ( = ?auto_1895001 ?auto_1895009 ) ) ( not ( = ?auto_1895001 ?auto_1895010 ) ) ( not ( = ?auto_1895001 ?auto_1895011 ) ) ( not ( = ?auto_1895001 ?auto_1895012 ) ) ( not ( = ?auto_1895001 ?auto_1895013 ) ) ( not ( = ?auto_1895001 ?auto_1895014 ) ) ( not ( = ?auto_1895001 ?auto_1895015 ) ) ( not ( = ?auto_1895001 ?auto_1895018 ) ) ( not ( = ?auto_1895002 ?auto_1895003 ) ) ( not ( = ?auto_1895002 ?auto_1895000 ) ) ( not ( = ?auto_1895002 ?auto_1895004 ) ) ( not ( = ?auto_1895002 ?auto_1895006 ) ) ( not ( = ?auto_1895002 ?auto_1895005 ) ) ( not ( = ?auto_1895002 ?auto_1895007 ) ) ( not ( = ?auto_1895002 ?auto_1895008 ) ) ( not ( = ?auto_1895002 ?auto_1895009 ) ) ( not ( = ?auto_1895002 ?auto_1895010 ) ) ( not ( = ?auto_1895002 ?auto_1895011 ) ) ( not ( = ?auto_1895002 ?auto_1895012 ) ) ( not ( = ?auto_1895002 ?auto_1895013 ) ) ( not ( = ?auto_1895002 ?auto_1895014 ) ) ( not ( = ?auto_1895002 ?auto_1895015 ) ) ( not ( = ?auto_1895002 ?auto_1895018 ) ) ( not ( = ?auto_1895003 ?auto_1895000 ) ) ( not ( = ?auto_1895003 ?auto_1895004 ) ) ( not ( = ?auto_1895003 ?auto_1895006 ) ) ( not ( = ?auto_1895003 ?auto_1895005 ) ) ( not ( = ?auto_1895003 ?auto_1895007 ) ) ( not ( = ?auto_1895003 ?auto_1895008 ) ) ( not ( = ?auto_1895003 ?auto_1895009 ) ) ( not ( = ?auto_1895003 ?auto_1895010 ) ) ( not ( = ?auto_1895003 ?auto_1895011 ) ) ( not ( = ?auto_1895003 ?auto_1895012 ) ) ( not ( = ?auto_1895003 ?auto_1895013 ) ) ( not ( = ?auto_1895003 ?auto_1895014 ) ) ( not ( = ?auto_1895003 ?auto_1895015 ) ) ( not ( = ?auto_1895003 ?auto_1895018 ) ) ( not ( = ?auto_1895000 ?auto_1895004 ) ) ( not ( = ?auto_1895000 ?auto_1895006 ) ) ( not ( = ?auto_1895000 ?auto_1895005 ) ) ( not ( = ?auto_1895000 ?auto_1895007 ) ) ( not ( = ?auto_1895000 ?auto_1895008 ) ) ( not ( = ?auto_1895000 ?auto_1895009 ) ) ( not ( = ?auto_1895000 ?auto_1895010 ) ) ( not ( = ?auto_1895000 ?auto_1895011 ) ) ( not ( = ?auto_1895000 ?auto_1895012 ) ) ( not ( = ?auto_1895000 ?auto_1895013 ) ) ( not ( = ?auto_1895000 ?auto_1895014 ) ) ( not ( = ?auto_1895000 ?auto_1895015 ) ) ( not ( = ?auto_1895000 ?auto_1895018 ) ) ( not ( = ?auto_1895004 ?auto_1895006 ) ) ( not ( = ?auto_1895004 ?auto_1895005 ) ) ( not ( = ?auto_1895004 ?auto_1895007 ) ) ( not ( = ?auto_1895004 ?auto_1895008 ) ) ( not ( = ?auto_1895004 ?auto_1895009 ) ) ( not ( = ?auto_1895004 ?auto_1895010 ) ) ( not ( = ?auto_1895004 ?auto_1895011 ) ) ( not ( = ?auto_1895004 ?auto_1895012 ) ) ( not ( = ?auto_1895004 ?auto_1895013 ) ) ( not ( = ?auto_1895004 ?auto_1895014 ) ) ( not ( = ?auto_1895004 ?auto_1895015 ) ) ( not ( = ?auto_1895004 ?auto_1895018 ) ) ( not ( = ?auto_1895006 ?auto_1895005 ) ) ( not ( = ?auto_1895006 ?auto_1895007 ) ) ( not ( = ?auto_1895006 ?auto_1895008 ) ) ( not ( = ?auto_1895006 ?auto_1895009 ) ) ( not ( = ?auto_1895006 ?auto_1895010 ) ) ( not ( = ?auto_1895006 ?auto_1895011 ) ) ( not ( = ?auto_1895006 ?auto_1895012 ) ) ( not ( = ?auto_1895006 ?auto_1895013 ) ) ( not ( = ?auto_1895006 ?auto_1895014 ) ) ( not ( = ?auto_1895006 ?auto_1895015 ) ) ( not ( = ?auto_1895006 ?auto_1895018 ) ) ( not ( = ?auto_1895005 ?auto_1895007 ) ) ( not ( = ?auto_1895005 ?auto_1895008 ) ) ( not ( = ?auto_1895005 ?auto_1895009 ) ) ( not ( = ?auto_1895005 ?auto_1895010 ) ) ( not ( = ?auto_1895005 ?auto_1895011 ) ) ( not ( = ?auto_1895005 ?auto_1895012 ) ) ( not ( = ?auto_1895005 ?auto_1895013 ) ) ( not ( = ?auto_1895005 ?auto_1895014 ) ) ( not ( = ?auto_1895005 ?auto_1895015 ) ) ( not ( = ?auto_1895005 ?auto_1895018 ) ) ( not ( = ?auto_1895007 ?auto_1895008 ) ) ( not ( = ?auto_1895007 ?auto_1895009 ) ) ( not ( = ?auto_1895007 ?auto_1895010 ) ) ( not ( = ?auto_1895007 ?auto_1895011 ) ) ( not ( = ?auto_1895007 ?auto_1895012 ) ) ( not ( = ?auto_1895007 ?auto_1895013 ) ) ( not ( = ?auto_1895007 ?auto_1895014 ) ) ( not ( = ?auto_1895007 ?auto_1895015 ) ) ( not ( = ?auto_1895007 ?auto_1895018 ) ) ( not ( = ?auto_1895008 ?auto_1895009 ) ) ( not ( = ?auto_1895008 ?auto_1895010 ) ) ( not ( = ?auto_1895008 ?auto_1895011 ) ) ( not ( = ?auto_1895008 ?auto_1895012 ) ) ( not ( = ?auto_1895008 ?auto_1895013 ) ) ( not ( = ?auto_1895008 ?auto_1895014 ) ) ( not ( = ?auto_1895008 ?auto_1895015 ) ) ( not ( = ?auto_1895008 ?auto_1895018 ) ) ( not ( = ?auto_1895009 ?auto_1895010 ) ) ( not ( = ?auto_1895009 ?auto_1895011 ) ) ( not ( = ?auto_1895009 ?auto_1895012 ) ) ( not ( = ?auto_1895009 ?auto_1895013 ) ) ( not ( = ?auto_1895009 ?auto_1895014 ) ) ( not ( = ?auto_1895009 ?auto_1895015 ) ) ( not ( = ?auto_1895009 ?auto_1895018 ) ) ( not ( = ?auto_1895010 ?auto_1895011 ) ) ( not ( = ?auto_1895010 ?auto_1895012 ) ) ( not ( = ?auto_1895010 ?auto_1895013 ) ) ( not ( = ?auto_1895010 ?auto_1895014 ) ) ( not ( = ?auto_1895010 ?auto_1895015 ) ) ( not ( = ?auto_1895010 ?auto_1895018 ) ) ( not ( = ?auto_1895011 ?auto_1895012 ) ) ( not ( = ?auto_1895011 ?auto_1895013 ) ) ( not ( = ?auto_1895011 ?auto_1895014 ) ) ( not ( = ?auto_1895011 ?auto_1895015 ) ) ( not ( = ?auto_1895011 ?auto_1895018 ) ) ( not ( = ?auto_1895012 ?auto_1895013 ) ) ( not ( = ?auto_1895012 ?auto_1895014 ) ) ( not ( = ?auto_1895012 ?auto_1895015 ) ) ( not ( = ?auto_1895012 ?auto_1895018 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1895013 ?auto_1895014 ?auto_1895015 )
      ( MAKE-15CRATE-VERIFY ?auto_1895001 ?auto_1895002 ?auto_1895003 ?auto_1895000 ?auto_1895004 ?auto_1895006 ?auto_1895005 ?auto_1895007 ?auto_1895008 ?auto_1895009 ?auto_1895010 ?auto_1895011 ?auto_1895012 ?auto_1895013 ?auto_1895014 ?auto_1895015 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1895227 - SURFACE
      ?auto_1895228 - SURFACE
      ?auto_1895229 - SURFACE
      ?auto_1895226 - SURFACE
      ?auto_1895230 - SURFACE
      ?auto_1895232 - SURFACE
      ?auto_1895231 - SURFACE
      ?auto_1895233 - SURFACE
      ?auto_1895234 - SURFACE
      ?auto_1895235 - SURFACE
      ?auto_1895236 - SURFACE
      ?auto_1895237 - SURFACE
      ?auto_1895238 - SURFACE
      ?auto_1895239 - SURFACE
      ?auto_1895240 - SURFACE
      ?auto_1895241 - SURFACE
    )
    :vars
    (
      ?auto_1895242 - HOIST
      ?auto_1895244 - PLACE
      ?auto_1895246 - PLACE
      ?auto_1895245 - HOIST
      ?auto_1895243 - SURFACE
      ?auto_1895247 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1895242 ?auto_1895244 ) ( IS-CRATE ?auto_1895241 ) ( not ( = ?auto_1895240 ?auto_1895241 ) ) ( not ( = ?auto_1895239 ?auto_1895240 ) ) ( not ( = ?auto_1895239 ?auto_1895241 ) ) ( not ( = ?auto_1895246 ?auto_1895244 ) ) ( HOIST-AT ?auto_1895245 ?auto_1895246 ) ( not ( = ?auto_1895242 ?auto_1895245 ) ) ( AVAILABLE ?auto_1895245 ) ( SURFACE-AT ?auto_1895241 ?auto_1895246 ) ( ON ?auto_1895241 ?auto_1895243 ) ( CLEAR ?auto_1895241 ) ( not ( = ?auto_1895240 ?auto_1895243 ) ) ( not ( = ?auto_1895241 ?auto_1895243 ) ) ( not ( = ?auto_1895239 ?auto_1895243 ) ) ( TRUCK-AT ?auto_1895247 ?auto_1895244 ) ( SURFACE-AT ?auto_1895239 ?auto_1895244 ) ( CLEAR ?auto_1895239 ) ( IS-CRATE ?auto_1895240 ) ( AVAILABLE ?auto_1895242 ) ( IN ?auto_1895240 ?auto_1895247 ) ( ON ?auto_1895228 ?auto_1895227 ) ( ON ?auto_1895229 ?auto_1895228 ) ( ON ?auto_1895226 ?auto_1895229 ) ( ON ?auto_1895230 ?auto_1895226 ) ( ON ?auto_1895232 ?auto_1895230 ) ( ON ?auto_1895231 ?auto_1895232 ) ( ON ?auto_1895233 ?auto_1895231 ) ( ON ?auto_1895234 ?auto_1895233 ) ( ON ?auto_1895235 ?auto_1895234 ) ( ON ?auto_1895236 ?auto_1895235 ) ( ON ?auto_1895237 ?auto_1895236 ) ( ON ?auto_1895238 ?auto_1895237 ) ( ON ?auto_1895239 ?auto_1895238 ) ( not ( = ?auto_1895227 ?auto_1895228 ) ) ( not ( = ?auto_1895227 ?auto_1895229 ) ) ( not ( = ?auto_1895227 ?auto_1895226 ) ) ( not ( = ?auto_1895227 ?auto_1895230 ) ) ( not ( = ?auto_1895227 ?auto_1895232 ) ) ( not ( = ?auto_1895227 ?auto_1895231 ) ) ( not ( = ?auto_1895227 ?auto_1895233 ) ) ( not ( = ?auto_1895227 ?auto_1895234 ) ) ( not ( = ?auto_1895227 ?auto_1895235 ) ) ( not ( = ?auto_1895227 ?auto_1895236 ) ) ( not ( = ?auto_1895227 ?auto_1895237 ) ) ( not ( = ?auto_1895227 ?auto_1895238 ) ) ( not ( = ?auto_1895227 ?auto_1895239 ) ) ( not ( = ?auto_1895227 ?auto_1895240 ) ) ( not ( = ?auto_1895227 ?auto_1895241 ) ) ( not ( = ?auto_1895227 ?auto_1895243 ) ) ( not ( = ?auto_1895228 ?auto_1895229 ) ) ( not ( = ?auto_1895228 ?auto_1895226 ) ) ( not ( = ?auto_1895228 ?auto_1895230 ) ) ( not ( = ?auto_1895228 ?auto_1895232 ) ) ( not ( = ?auto_1895228 ?auto_1895231 ) ) ( not ( = ?auto_1895228 ?auto_1895233 ) ) ( not ( = ?auto_1895228 ?auto_1895234 ) ) ( not ( = ?auto_1895228 ?auto_1895235 ) ) ( not ( = ?auto_1895228 ?auto_1895236 ) ) ( not ( = ?auto_1895228 ?auto_1895237 ) ) ( not ( = ?auto_1895228 ?auto_1895238 ) ) ( not ( = ?auto_1895228 ?auto_1895239 ) ) ( not ( = ?auto_1895228 ?auto_1895240 ) ) ( not ( = ?auto_1895228 ?auto_1895241 ) ) ( not ( = ?auto_1895228 ?auto_1895243 ) ) ( not ( = ?auto_1895229 ?auto_1895226 ) ) ( not ( = ?auto_1895229 ?auto_1895230 ) ) ( not ( = ?auto_1895229 ?auto_1895232 ) ) ( not ( = ?auto_1895229 ?auto_1895231 ) ) ( not ( = ?auto_1895229 ?auto_1895233 ) ) ( not ( = ?auto_1895229 ?auto_1895234 ) ) ( not ( = ?auto_1895229 ?auto_1895235 ) ) ( not ( = ?auto_1895229 ?auto_1895236 ) ) ( not ( = ?auto_1895229 ?auto_1895237 ) ) ( not ( = ?auto_1895229 ?auto_1895238 ) ) ( not ( = ?auto_1895229 ?auto_1895239 ) ) ( not ( = ?auto_1895229 ?auto_1895240 ) ) ( not ( = ?auto_1895229 ?auto_1895241 ) ) ( not ( = ?auto_1895229 ?auto_1895243 ) ) ( not ( = ?auto_1895226 ?auto_1895230 ) ) ( not ( = ?auto_1895226 ?auto_1895232 ) ) ( not ( = ?auto_1895226 ?auto_1895231 ) ) ( not ( = ?auto_1895226 ?auto_1895233 ) ) ( not ( = ?auto_1895226 ?auto_1895234 ) ) ( not ( = ?auto_1895226 ?auto_1895235 ) ) ( not ( = ?auto_1895226 ?auto_1895236 ) ) ( not ( = ?auto_1895226 ?auto_1895237 ) ) ( not ( = ?auto_1895226 ?auto_1895238 ) ) ( not ( = ?auto_1895226 ?auto_1895239 ) ) ( not ( = ?auto_1895226 ?auto_1895240 ) ) ( not ( = ?auto_1895226 ?auto_1895241 ) ) ( not ( = ?auto_1895226 ?auto_1895243 ) ) ( not ( = ?auto_1895230 ?auto_1895232 ) ) ( not ( = ?auto_1895230 ?auto_1895231 ) ) ( not ( = ?auto_1895230 ?auto_1895233 ) ) ( not ( = ?auto_1895230 ?auto_1895234 ) ) ( not ( = ?auto_1895230 ?auto_1895235 ) ) ( not ( = ?auto_1895230 ?auto_1895236 ) ) ( not ( = ?auto_1895230 ?auto_1895237 ) ) ( not ( = ?auto_1895230 ?auto_1895238 ) ) ( not ( = ?auto_1895230 ?auto_1895239 ) ) ( not ( = ?auto_1895230 ?auto_1895240 ) ) ( not ( = ?auto_1895230 ?auto_1895241 ) ) ( not ( = ?auto_1895230 ?auto_1895243 ) ) ( not ( = ?auto_1895232 ?auto_1895231 ) ) ( not ( = ?auto_1895232 ?auto_1895233 ) ) ( not ( = ?auto_1895232 ?auto_1895234 ) ) ( not ( = ?auto_1895232 ?auto_1895235 ) ) ( not ( = ?auto_1895232 ?auto_1895236 ) ) ( not ( = ?auto_1895232 ?auto_1895237 ) ) ( not ( = ?auto_1895232 ?auto_1895238 ) ) ( not ( = ?auto_1895232 ?auto_1895239 ) ) ( not ( = ?auto_1895232 ?auto_1895240 ) ) ( not ( = ?auto_1895232 ?auto_1895241 ) ) ( not ( = ?auto_1895232 ?auto_1895243 ) ) ( not ( = ?auto_1895231 ?auto_1895233 ) ) ( not ( = ?auto_1895231 ?auto_1895234 ) ) ( not ( = ?auto_1895231 ?auto_1895235 ) ) ( not ( = ?auto_1895231 ?auto_1895236 ) ) ( not ( = ?auto_1895231 ?auto_1895237 ) ) ( not ( = ?auto_1895231 ?auto_1895238 ) ) ( not ( = ?auto_1895231 ?auto_1895239 ) ) ( not ( = ?auto_1895231 ?auto_1895240 ) ) ( not ( = ?auto_1895231 ?auto_1895241 ) ) ( not ( = ?auto_1895231 ?auto_1895243 ) ) ( not ( = ?auto_1895233 ?auto_1895234 ) ) ( not ( = ?auto_1895233 ?auto_1895235 ) ) ( not ( = ?auto_1895233 ?auto_1895236 ) ) ( not ( = ?auto_1895233 ?auto_1895237 ) ) ( not ( = ?auto_1895233 ?auto_1895238 ) ) ( not ( = ?auto_1895233 ?auto_1895239 ) ) ( not ( = ?auto_1895233 ?auto_1895240 ) ) ( not ( = ?auto_1895233 ?auto_1895241 ) ) ( not ( = ?auto_1895233 ?auto_1895243 ) ) ( not ( = ?auto_1895234 ?auto_1895235 ) ) ( not ( = ?auto_1895234 ?auto_1895236 ) ) ( not ( = ?auto_1895234 ?auto_1895237 ) ) ( not ( = ?auto_1895234 ?auto_1895238 ) ) ( not ( = ?auto_1895234 ?auto_1895239 ) ) ( not ( = ?auto_1895234 ?auto_1895240 ) ) ( not ( = ?auto_1895234 ?auto_1895241 ) ) ( not ( = ?auto_1895234 ?auto_1895243 ) ) ( not ( = ?auto_1895235 ?auto_1895236 ) ) ( not ( = ?auto_1895235 ?auto_1895237 ) ) ( not ( = ?auto_1895235 ?auto_1895238 ) ) ( not ( = ?auto_1895235 ?auto_1895239 ) ) ( not ( = ?auto_1895235 ?auto_1895240 ) ) ( not ( = ?auto_1895235 ?auto_1895241 ) ) ( not ( = ?auto_1895235 ?auto_1895243 ) ) ( not ( = ?auto_1895236 ?auto_1895237 ) ) ( not ( = ?auto_1895236 ?auto_1895238 ) ) ( not ( = ?auto_1895236 ?auto_1895239 ) ) ( not ( = ?auto_1895236 ?auto_1895240 ) ) ( not ( = ?auto_1895236 ?auto_1895241 ) ) ( not ( = ?auto_1895236 ?auto_1895243 ) ) ( not ( = ?auto_1895237 ?auto_1895238 ) ) ( not ( = ?auto_1895237 ?auto_1895239 ) ) ( not ( = ?auto_1895237 ?auto_1895240 ) ) ( not ( = ?auto_1895237 ?auto_1895241 ) ) ( not ( = ?auto_1895237 ?auto_1895243 ) ) ( not ( = ?auto_1895238 ?auto_1895239 ) ) ( not ( = ?auto_1895238 ?auto_1895240 ) ) ( not ( = ?auto_1895238 ?auto_1895241 ) ) ( not ( = ?auto_1895238 ?auto_1895243 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1895239 ?auto_1895240 ?auto_1895241 )
      ( MAKE-15CRATE-VERIFY ?auto_1895227 ?auto_1895228 ?auto_1895229 ?auto_1895226 ?auto_1895230 ?auto_1895232 ?auto_1895231 ?auto_1895233 ?auto_1895234 ?auto_1895235 ?auto_1895236 ?auto_1895237 ?auto_1895238 ?auto_1895239 ?auto_1895240 ?auto_1895241 ) )
  )

)

