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
      ?auto_1043130 - SURFACE
      ?auto_1043131 - SURFACE
    )
    :vars
    (
      ?auto_1043132 - HOIST
      ?auto_1043133 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043132 ?auto_1043133 ) ( SURFACE-AT ?auto_1043130 ?auto_1043133 ) ( CLEAR ?auto_1043130 ) ( LIFTING ?auto_1043132 ?auto_1043131 ) ( IS-CRATE ?auto_1043131 ) ( not ( = ?auto_1043130 ?auto_1043131 ) ) )
    :subtasks
    ( ( !DROP ?auto_1043132 ?auto_1043131 ?auto_1043130 ?auto_1043133 )
      ( MAKE-1CRATE-VERIFY ?auto_1043130 ?auto_1043131 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1043134 - SURFACE
      ?auto_1043135 - SURFACE
    )
    :vars
    (
      ?auto_1043137 - HOIST
      ?auto_1043136 - PLACE
      ?auto_1043138 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043137 ?auto_1043136 ) ( SURFACE-AT ?auto_1043134 ?auto_1043136 ) ( CLEAR ?auto_1043134 ) ( IS-CRATE ?auto_1043135 ) ( not ( = ?auto_1043134 ?auto_1043135 ) ) ( TRUCK-AT ?auto_1043138 ?auto_1043136 ) ( AVAILABLE ?auto_1043137 ) ( IN ?auto_1043135 ?auto_1043138 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1043137 ?auto_1043135 ?auto_1043138 ?auto_1043136 )
      ( MAKE-1CRATE ?auto_1043134 ?auto_1043135 )
      ( MAKE-1CRATE-VERIFY ?auto_1043134 ?auto_1043135 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1043139 - SURFACE
      ?auto_1043140 - SURFACE
    )
    :vars
    (
      ?auto_1043141 - HOIST
      ?auto_1043142 - PLACE
      ?auto_1043143 - TRUCK
      ?auto_1043144 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043141 ?auto_1043142 ) ( SURFACE-AT ?auto_1043139 ?auto_1043142 ) ( CLEAR ?auto_1043139 ) ( IS-CRATE ?auto_1043140 ) ( not ( = ?auto_1043139 ?auto_1043140 ) ) ( AVAILABLE ?auto_1043141 ) ( IN ?auto_1043140 ?auto_1043143 ) ( TRUCK-AT ?auto_1043143 ?auto_1043144 ) ( not ( = ?auto_1043144 ?auto_1043142 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1043143 ?auto_1043144 ?auto_1043142 )
      ( MAKE-1CRATE ?auto_1043139 ?auto_1043140 )
      ( MAKE-1CRATE-VERIFY ?auto_1043139 ?auto_1043140 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1043145 - SURFACE
      ?auto_1043146 - SURFACE
    )
    :vars
    (
      ?auto_1043148 - HOIST
      ?auto_1043150 - PLACE
      ?auto_1043147 - TRUCK
      ?auto_1043149 - PLACE
      ?auto_1043151 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043148 ?auto_1043150 ) ( SURFACE-AT ?auto_1043145 ?auto_1043150 ) ( CLEAR ?auto_1043145 ) ( IS-CRATE ?auto_1043146 ) ( not ( = ?auto_1043145 ?auto_1043146 ) ) ( AVAILABLE ?auto_1043148 ) ( TRUCK-AT ?auto_1043147 ?auto_1043149 ) ( not ( = ?auto_1043149 ?auto_1043150 ) ) ( HOIST-AT ?auto_1043151 ?auto_1043149 ) ( LIFTING ?auto_1043151 ?auto_1043146 ) ( not ( = ?auto_1043148 ?auto_1043151 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1043151 ?auto_1043146 ?auto_1043147 ?auto_1043149 )
      ( MAKE-1CRATE ?auto_1043145 ?auto_1043146 )
      ( MAKE-1CRATE-VERIFY ?auto_1043145 ?auto_1043146 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1043152 - SURFACE
      ?auto_1043153 - SURFACE
    )
    :vars
    (
      ?auto_1043157 - HOIST
      ?auto_1043155 - PLACE
      ?auto_1043156 - TRUCK
      ?auto_1043154 - PLACE
      ?auto_1043158 - HOIST
      ?auto_1043159 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043157 ?auto_1043155 ) ( SURFACE-AT ?auto_1043152 ?auto_1043155 ) ( CLEAR ?auto_1043152 ) ( IS-CRATE ?auto_1043153 ) ( not ( = ?auto_1043152 ?auto_1043153 ) ) ( AVAILABLE ?auto_1043157 ) ( TRUCK-AT ?auto_1043156 ?auto_1043154 ) ( not ( = ?auto_1043154 ?auto_1043155 ) ) ( HOIST-AT ?auto_1043158 ?auto_1043154 ) ( not ( = ?auto_1043157 ?auto_1043158 ) ) ( AVAILABLE ?auto_1043158 ) ( SURFACE-AT ?auto_1043153 ?auto_1043154 ) ( ON ?auto_1043153 ?auto_1043159 ) ( CLEAR ?auto_1043153 ) ( not ( = ?auto_1043152 ?auto_1043159 ) ) ( not ( = ?auto_1043153 ?auto_1043159 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1043158 ?auto_1043153 ?auto_1043159 ?auto_1043154 )
      ( MAKE-1CRATE ?auto_1043152 ?auto_1043153 )
      ( MAKE-1CRATE-VERIFY ?auto_1043152 ?auto_1043153 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1043160 - SURFACE
      ?auto_1043161 - SURFACE
    )
    :vars
    (
      ?auto_1043164 - HOIST
      ?auto_1043162 - PLACE
      ?auto_1043167 - PLACE
      ?auto_1043166 - HOIST
      ?auto_1043165 - SURFACE
      ?auto_1043163 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043164 ?auto_1043162 ) ( SURFACE-AT ?auto_1043160 ?auto_1043162 ) ( CLEAR ?auto_1043160 ) ( IS-CRATE ?auto_1043161 ) ( not ( = ?auto_1043160 ?auto_1043161 ) ) ( AVAILABLE ?auto_1043164 ) ( not ( = ?auto_1043167 ?auto_1043162 ) ) ( HOIST-AT ?auto_1043166 ?auto_1043167 ) ( not ( = ?auto_1043164 ?auto_1043166 ) ) ( AVAILABLE ?auto_1043166 ) ( SURFACE-AT ?auto_1043161 ?auto_1043167 ) ( ON ?auto_1043161 ?auto_1043165 ) ( CLEAR ?auto_1043161 ) ( not ( = ?auto_1043160 ?auto_1043165 ) ) ( not ( = ?auto_1043161 ?auto_1043165 ) ) ( TRUCK-AT ?auto_1043163 ?auto_1043162 ) )
    :subtasks
    ( ( !DRIVE ?auto_1043163 ?auto_1043162 ?auto_1043167 )
      ( MAKE-1CRATE ?auto_1043160 ?auto_1043161 )
      ( MAKE-1CRATE-VERIFY ?auto_1043160 ?auto_1043161 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1043177 - SURFACE
      ?auto_1043178 - SURFACE
      ?auto_1043179 - SURFACE
    )
    :vars
    (
      ?auto_1043180 - HOIST
      ?auto_1043181 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043180 ?auto_1043181 ) ( SURFACE-AT ?auto_1043178 ?auto_1043181 ) ( CLEAR ?auto_1043178 ) ( LIFTING ?auto_1043180 ?auto_1043179 ) ( IS-CRATE ?auto_1043179 ) ( not ( = ?auto_1043178 ?auto_1043179 ) ) ( ON ?auto_1043178 ?auto_1043177 ) ( not ( = ?auto_1043177 ?auto_1043178 ) ) ( not ( = ?auto_1043177 ?auto_1043179 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1043178 ?auto_1043179 )
      ( MAKE-2CRATE-VERIFY ?auto_1043177 ?auto_1043178 ?auto_1043179 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1043187 - SURFACE
      ?auto_1043188 - SURFACE
      ?auto_1043189 - SURFACE
    )
    :vars
    (
      ?auto_1043191 - HOIST
      ?auto_1043192 - PLACE
      ?auto_1043190 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043191 ?auto_1043192 ) ( SURFACE-AT ?auto_1043188 ?auto_1043192 ) ( CLEAR ?auto_1043188 ) ( IS-CRATE ?auto_1043189 ) ( not ( = ?auto_1043188 ?auto_1043189 ) ) ( TRUCK-AT ?auto_1043190 ?auto_1043192 ) ( AVAILABLE ?auto_1043191 ) ( IN ?auto_1043189 ?auto_1043190 ) ( ON ?auto_1043188 ?auto_1043187 ) ( not ( = ?auto_1043187 ?auto_1043188 ) ) ( not ( = ?auto_1043187 ?auto_1043189 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1043188 ?auto_1043189 )
      ( MAKE-2CRATE-VERIFY ?auto_1043187 ?auto_1043188 ?auto_1043189 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1043193 - SURFACE
      ?auto_1043194 - SURFACE
    )
    :vars
    (
      ?auto_1043197 - HOIST
      ?auto_1043196 - PLACE
      ?auto_1043198 - TRUCK
      ?auto_1043195 - SURFACE
      ?auto_1043199 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043197 ?auto_1043196 ) ( SURFACE-AT ?auto_1043193 ?auto_1043196 ) ( CLEAR ?auto_1043193 ) ( IS-CRATE ?auto_1043194 ) ( not ( = ?auto_1043193 ?auto_1043194 ) ) ( AVAILABLE ?auto_1043197 ) ( IN ?auto_1043194 ?auto_1043198 ) ( ON ?auto_1043193 ?auto_1043195 ) ( not ( = ?auto_1043195 ?auto_1043193 ) ) ( not ( = ?auto_1043195 ?auto_1043194 ) ) ( TRUCK-AT ?auto_1043198 ?auto_1043199 ) ( not ( = ?auto_1043199 ?auto_1043196 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1043198 ?auto_1043199 ?auto_1043196 )
      ( MAKE-2CRATE ?auto_1043195 ?auto_1043193 ?auto_1043194 )
      ( MAKE-1CRATE-VERIFY ?auto_1043193 ?auto_1043194 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1043200 - SURFACE
      ?auto_1043201 - SURFACE
      ?auto_1043202 - SURFACE
    )
    :vars
    (
      ?auto_1043204 - HOIST
      ?auto_1043206 - PLACE
      ?auto_1043205 - TRUCK
      ?auto_1043203 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043204 ?auto_1043206 ) ( SURFACE-AT ?auto_1043201 ?auto_1043206 ) ( CLEAR ?auto_1043201 ) ( IS-CRATE ?auto_1043202 ) ( not ( = ?auto_1043201 ?auto_1043202 ) ) ( AVAILABLE ?auto_1043204 ) ( IN ?auto_1043202 ?auto_1043205 ) ( ON ?auto_1043201 ?auto_1043200 ) ( not ( = ?auto_1043200 ?auto_1043201 ) ) ( not ( = ?auto_1043200 ?auto_1043202 ) ) ( TRUCK-AT ?auto_1043205 ?auto_1043203 ) ( not ( = ?auto_1043203 ?auto_1043206 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1043201 ?auto_1043202 )
      ( MAKE-2CRATE-VERIFY ?auto_1043200 ?auto_1043201 ?auto_1043202 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1043207 - SURFACE
      ?auto_1043208 - SURFACE
    )
    :vars
    (
      ?auto_1043209 - HOIST
      ?auto_1043213 - PLACE
      ?auto_1043211 - SURFACE
      ?auto_1043210 - TRUCK
      ?auto_1043212 - PLACE
      ?auto_1043214 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043209 ?auto_1043213 ) ( SURFACE-AT ?auto_1043207 ?auto_1043213 ) ( CLEAR ?auto_1043207 ) ( IS-CRATE ?auto_1043208 ) ( not ( = ?auto_1043207 ?auto_1043208 ) ) ( AVAILABLE ?auto_1043209 ) ( ON ?auto_1043207 ?auto_1043211 ) ( not ( = ?auto_1043211 ?auto_1043207 ) ) ( not ( = ?auto_1043211 ?auto_1043208 ) ) ( TRUCK-AT ?auto_1043210 ?auto_1043212 ) ( not ( = ?auto_1043212 ?auto_1043213 ) ) ( HOIST-AT ?auto_1043214 ?auto_1043212 ) ( LIFTING ?auto_1043214 ?auto_1043208 ) ( not ( = ?auto_1043209 ?auto_1043214 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1043214 ?auto_1043208 ?auto_1043210 ?auto_1043212 )
      ( MAKE-2CRATE ?auto_1043211 ?auto_1043207 ?auto_1043208 )
      ( MAKE-1CRATE-VERIFY ?auto_1043207 ?auto_1043208 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1043215 - SURFACE
      ?auto_1043216 - SURFACE
      ?auto_1043217 - SURFACE
    )
    :vars
    (
      ?auto_1043220 - HOIST
      ?auto_1043221 - PLACE
      ?auto_1043222 - TRUCK
      ?auto_1043219 - PLACE
      ?auto_1043218 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043220 ?auto_1043221 ) ( SURFACE-AT ?auto_1043216 ?auto_1043221 ) ( CLEAR ?auto_1043216 ) ( IS-CRATE ?auto_1043217 ) ( not ( = ?auto_1043216 ?auto_1043217 ) ) ( AVAILABLE ?auto_1043220 ) ( ON ?auto_1043216 ?auto_1043215 ) ( not ( = ?auto_1043215 ?auto_1043216 ) ) ( not ( = ?auto_1043215 ?auto_1043217 ) ) ( TRUCK-AT ?auto_1043222 ?auto_1043219 ) ( not ( = ?auto_1043219 ?auto_1043221 ) ) ( HOIST-AT ?auto_1043218 ?auto_1043219 ) ( LIFTING ?auto_1043218 ?auto_1043217 ) ( not ( = ?auto_1043220 ?auto_1043218 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1043216 ?auto_1043217 )
      ( MAKE-2CRATE-VERIFY ?auto_1043215 ?auto_1043216 ?auto_1043217 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1043223 - SURFACE
      ?auto_1043224 - SURFACE
    )
    :vars
    (
      ?auto_1043225 - HOIST
      ?auto_1043228 - PLACE
      ?auto_1043226 - SURFACE
      ?auto_1043227 - TRUCK
      ?auto_1043229 - PLACE
      ?auto_1043230 - HOIST
      ?auto_1043231 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043225 ?auto_1043228 ) ( SURFACE-AT ?auto_1043223 ?auto_1043228 ) ( CLEAR ?auto_1043223 ) ( IS-CRATE ?auto_1043224 ) ( not ( = ?auto_1043223 ?auto_1043224 ) ) ( AVAILABLE ?auto_1043225 ) ( ON ?auto_1043223 ?auto_1043226 ) ( not ( = ?auto_1043226 ?auto_1043223 ) ) ( not ( = ?auto_1043226 ?auto_1043224 ) ) ( TRUCK-AT ?auto_1043227 ?auto_1043229 ) ( not ( = ?auto_1043229 ?auto_1043228 ) ) ( HOIST-AT ?auto_1043230 ?auto_1043229 ) ( not ( = ?auto_1043225 ?auto_1043230 ) ) ( AVAILABLE ?auto_1043230 ) ( SURFACE-AT ?auto_1043224 ?auto_1043229 ) ( ON ?auto_1043224 ?auto_1043231 ) ( CLEAR ?auto_1043224 ) ( not ( = ?auto_1043223 ?auto_1043231 ) ) ( not ( = ?auto_1043224 ?auto_1043231 ) ) ( not ( = ?auto_1043226 ?auto_1043231 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1043230 ?auto_1043224 ?auto_1043231 ?auto_1043229 )
      ( MAKE-2CRATE ?auto_1043226 ?auto_1043223 ?auto_1043224 )
      ( MAKE-1CRATE-VERIFY ?auto_1043223 ?auto_1043224 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1043232 - SURFACE
      ?auto_1043233 - SURFACE
      ?auto_1043234 - SURFACE
    )
    :vars
    (
      ?auto_1043240 - HOIST
      ?auto_1043239 - PLACE
      ?auto_1043235 - TRUCK
      ?auto_1043236 - PLACE
      ?auto_1043237 - HOIST
      ?auto_1043238 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043240 ?auto_1043239 ) ( SURFACE-AT ?auto_1043233 ?auto_1043239 ) ( CLEAR ?auto_1043233 ) ( IS-CRATE ?auto_1043234 ) ( not ( = ?auto_1043233 ?auto_1043234 ) ) ( AVAILABLE ?auto_1043240 ) ( ON ?auto_1043233 ?auto_1043232 ) ( not ( = ?auto_1043232 ?auto_1043233 ) ) ( not ( = ?auto_1043232 ?auto_1043234 ) ) ( TRUCK-AT ?auto_1043235 ?auto_1043236 ) ( not ( = ?auto_1043236 ?auto_1043239 ) ) ( HOIST-AT ?auto_1043237 ?auto_1043236 ) ( not ( = ?auto_1043240 ?auto_1043237 ) ) ( AVAILABLE ?auto_1043237 ) ( SURFACE-AT ?auto_1043234 ?auto_1043236 ) ( ON ?auto_1043234 ?auto_1043238 ) ( CLEAR ?auto_1043234 ) ( not ( = ?auto_1043233 ?auto_1043238 ) ) ( not ( = ?auto_1043234 ?auto_1043238 ) ) ( not ( = ?auto_1043232 ?auto_1043238 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1043233 ?auto_1043234 )
      ( MAKE-2CRATE-VERIFY ?auto_1043232 ?auto_1043233 ?auto_1043234 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1043241 - SURFACE
      ?auto_1043242 - SURFACE
    )
    :vars
    (
      ?auto_1043245 - HOIST
      ?auto_1043243 - PLACE
      ?auto_1043249 - SURFACE
      ?auto_1043248 - PLACE
      ?auto_1043247 - HOIST
      ?auto_1043246 - SURFACE
      ?auto_1043244 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043245 ?auto_1043243 ) ( SURFACE-AT ?auto_1043241 ?auto_1043243 ) ( CLEAR ?auto_1043241 ) ( IS-CRATE ?auto_1043242 ) ( not ( = ?auto_1043241 ?auto_1043242 ) ) ( AVAILABLE ?auto_1043245 ) ( ON ?auto_1043241 ?auto_1043249 ) ( not ( = ?auto_1043249 ?auto_1043241 ) ) ( not ( = ?auto_1043249 ?auto_1043242 ) ) ( not ( = ?auto_1043248 ?auto_1043243 ) ) ( HOIST-AT ?auto_1043247 ?auto_1043248 ) ( not ( = ?auto_1043245 ?auto_1043247 ) ) ( AVAILABLE ?auto_1043247 ) ( SURFACE-AT ?auto_1043242 ?auto_1043248 ) ( ON ?auto_1043242 ?auto_1043246 ) ( CLEAR ?auto_1043242 ) ( not ( = ?auto_1043241 ?auto_1043246 ) ) ( not ( = ?auto_1043242 ?auto_1043246 ) ) ( not ( = ?auto_1043249 ?auto_1043246 ) ) ( TRUCK-AT ?auto_1043244 ?auto_1043243 ) )
    :subtasks
    ( ( !DRIVE ?auto_1043244 ?auto_1043243 ?auto_1043248 )
      ( MAKE-2CRATE ?auto_1043249 ?auto_1043241 ?auto_1043242 )
      ( MAKE-1CRATE-VERIFY ?auto_1043241 ?auto_1043242 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1043250 - SURFACE
      ?auto_1043251 - SURFACE
      ?auto_1043252 - SURFACE
    )
    :vars
    (
      ?auto_1043255 - HOIST
      ?auto_1043258 - PLACE
      ?auto_1043254 - PLACE
      ?auto_1043256 - HOIST
      ?auto_1043253 - SURFACE
      ?auto_1043257 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043255 ?auto_1043258 ) ( SURFACE-AT ?auto_1043251 ?auto_1043258 ) ( CLEAR ?auto_1043251 ) ( IS-CRATE ?auto_1043252 ) ( not ( = ?auto_1043251 ?auto_1043252 ) ) ( AVAILABLE ?auto_1043255 ) ( ON ?auto_1043251 ?auto_1043250 ) ( not ( = ?auto_1043250 ?auto_1043251 ) ) ( not ( = ?auto_1043250 ?auto_1043252 ) ) ( not ( = ?auto_1043254 ?auto_1043258 ) ) ( HOIST-AT ?auto_1043256 ?auto_1043254 ) ( not ( = ?auto_1043255 ?auto_1043256 ) ) ( AVAILABLE ?auto_1043256 ) ( SURFACE-AT ?auto_1043252 ?auto_1043254 ) ( ON ?auto_1043252 ?auto_1043253 ) ( CLEAR ?auto_1043252 ) ( not ( = ?auto_1043251 ?auto_1043253 ) ) ( not ( = ?auto_1043252 ?auto_1043253 ) ) ( not ( = ?auto_1043250 ?auto_1043253 ) ) ( TRUCK-AT ?auto_1043257 ?auto_1043258 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1043251 ?auto_1043252 )
      ( MAKE-2CRATE-VERIFY ?auto_1043250 ?auto_1043251 ?auto_1043252 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1043259 - SURFACE
      ?auto_1043260 - SURFACE
    )
    :vars
    (
      ?auto_1043263 - HOIST
      ?auto_1043264 - PLACE
      ?auto_1043266 - SURFACE
      ?auto_1043265 - PLACE
      ?auto_1043267 - HOIST
      ?auto_1043262 - SURFACE
      ?auto_1043261 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043263 ?auto_1043264 ) ( IS-CRATE ?auto_1043260 ) ( not ( = ?auto_1043259 ?auto_1043260 ) ) ( not ( = ?auto_1043266 ?auto_1043259 ) ) ( not ( = ?auto_1043266 ?auto_1043260 ) ) ( not ( = ?auto_1043265 ?auto_1043264 ) ) ( HOIST-AT ?auto_1043267 ?auto_1043265 ) ( not ( = ?auto_1043263 ?auto_1043267 ) ) ( AVAILABLE ?auto_1043267 ) ( SURFACE-AT ?auto_1043260 ?auto_1043265 ) ( ON ?auto_1043260 ?auto_1043262 ) ( CLEAR ?auto_1043260 ) ( not ( = ?auto_1043259 ?auto_1043262 ) ) ( not ( = ?auto_1043260 ?auto_1043262 ) ) ( not ( = ?auto_1043266 ?auto_1043262 ) ) ( TRUCK-AT ?auto_1043261 ?auto_1043264 ) ( SURFACE-AT ?auto_1043266 ?auto_1043264 ) ( CLEAR ?auto_1043266 ) ( LIFTING ?auto_1043263 ?auto_1043259 ) ( IS-CRATE ?auto_1043259 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1043266 ?auto_1043259 )
      ( MAKE-2CRATE ?auto_1043266 ?auto_1043259 ?auto_1043260 )
      ( MAKE-1CRATE-VERIFY ?auto_1043259 ?auto_1043260 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1043268 - SURFACE
      ?auto_1043269 - SURFACE
      ?auto_1043270 - SURFACE
    )
    :vars
    (
      ?auto_1043275 - HOIST
      ?auto_1043273 - PLACE
      ?auto_1043274 - PLACE
      ?auto_1043271 - HOIST
      ?auto_1043276 - SURFACE
      ?auto_1043272 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043275 ?auto_1043273 ) ( IS-CRATE ?auto_1043270 ) ( not ( = ?auto_1043269 ?auto_1043270 ) ) ( not ( = ?auto_1043268 ?auto_1043269 ) ) ( not ( = ?auto_1043268 ?auto_1043270 ) ) ( not ( = ?auto_1043274 ?auto_1043273 ) ) ( HOIST-AT ?auto_1043271 ?auto_1043274 ) ( not ( = ?auto_1043275 ?auto_1043271 ) ) ( AVAILABLE ?auto_1043271 ) ( SURFACE-AT ?auto_1043270 ?auto_1043274 ) ( ON ?auto_1043270 ?auto_1043276 ) ( CLEAR ?auto_1043270 ) ( not ( = ?auto_1043269 ?auto_1043276 ) ) ( not ( = ?auto_1043270 ?auto_1043276 ) ) ( not ( = ?auto_1043268 ?auto_1043276 ) ) ( TRUCK-AT ?auto_1043272 ?auto_1043273 ) ( SURFACE-AT ?auto_1043268 ?auto_1043273 ) ( CLEAR ?auto_1043268 ) ( LIFTING ?auto_1043275 ?auto_1043269 ) ( IS-CRATE ?auto_1043269 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1043269 ?auto_1043270 )
      ( MAKE-2CRATE-VERIFY ?auto_1043268 ?auto_1043269 ?auto_1043270 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1043277 - SURFACE
      ?auto_1043278 - SURFACE
    )
    :vars
    (
      ?auto_1043279 - HOIST
      ?auto_1043280 - PLACE
      ?auto_1043283 - SURFACE
      ?auto_1043281 - PLACE
      ?auto_1043282 - HOIST
      ?auto_1043284 - SURFACE
      ?auto_1043285 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043279 ?auto_1043280 ) ( IS-CRATE ?auto_1043278 ) ( not ( = ?auto_1043277 ?auto_1043278 ) ) ( not ( = ?auto_1043283 ?auto_1043277 ) ) ( not ( = ?auto_1043283 ?auto_1043278 ) ) ( not ( = ?auto_1043281 ?auto_1043280 ) ) ( HOIST-AT ?auto_1043282 ?auto_1043281 ) ( not ( = ?auto_1043279 ?auto_1043282 ) ) ( AVAILABLE ?auto_1043282 ) ( SURFACE-AT ?auto_1043278 ?auto_1043281 ) ( ON ?auto_1043278 ?auto_1043284 ) ( CLEAR ?auto_1043278 ) ( not ( = ?auto_1043277 ?auto_1043284 ) ) ( not ( = ?auto_1043278 ?auto_1043284 ) ) ( not ( = ?auto_1043283 ?auto_1043284 ) ) ( TRUCK-AT ?auto_1043285 ?auto_1043280 ) ( SURFACE-AT ?auto_1043283 ?auto_1043280 ) ( CLEAR ?auto_1043283 ) ( IS-CRATE ?auto_1043277 ) ( AVAILABLE ?auto_1043279 ) ( IN ?auto_1043277 ?auto_1043285 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1043279 ?auto_1043277 ?auto_1043285 ?auto_1043280 )
      ( MAKE-2CRATE ?auto_1043283 ?auto_1043277 ?auto_1043278 )
      ( MAKE-1CRATE-VERIFY ?auto_1043277 ?auto_1043278 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1043286 - SURFACE
      ?auto_1043287 - SURFACE
      ?auto_1043288 - SURFACE
    )
    :vars
    (
      ?auto_1043294 - HOIST
      ?auto_1043293 - PLACE
      ?auto_1043292 - PLACE
      ?auto_1043291 - HOIST
      ?auto_1043290 - SURFACE
      ?auto_1043289 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043294 ?auto_1043293 ) ( IS-CRATE ?auto_1043288 ) ( not ( = ?auto_1043287 ?auto_1043288 ) ) ( not ( = ?auto_1043286 ?auto_1043287 ) ) ( not ( = ?auto_1043286 ?auto_1043288 ) ) ( not ( = ?auto_1043292 ?auto_1043293 ) ) ( HOIST-AT ?auto_1043291 ?auto_1043292 ) ( not ( = ?auto_1043294 ?auto_1043291 ) ) ( AVAILABLE ?auto_1043291 ) ( SURFACE-AT ?auto_1043288 ?auto_1043292 ) ( ON ?auto_1043288 ?auto_1043290 ) ( CLEAR ?auto_1043288 ) ( not ( = ?auto_1043287 ?auto_1043290 ) ) ( not ( = ?auto_1043288 ?auto_1043290 ) ) ( not ( = ?auto_1043286 ?auto_1043290 ) ) ( TRUCK-AT ?auto_1043289 ?auto_1043293 ) ( SURFACE-AT ?auto_1043286 ?auto_1043293 ) ( CLEAR ?auto_1043286 ) ( IS-CRATE ?auto_1043287 ) ( AVAILABLE ?auto_1043294 ) ( IN ?auto_1043287 ?auto_1043289 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1043287 ?auto_1043288 )
      ( MAKE-2CRATE-VERIFY ?auto_1043286 ?auto_1043287 ?auto_1043288 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1043331 - SURFACE
      ?auto_1043332 - SURFACE
    )
    :vars
    (
      ?auto_1043337 - HOIST
      ?auto_1043339 - PLACE
      ?auto_1043336 - SURFACE
      ?auto_1043334 - PLACE
      ?auto_1043335 - HOIST
      ?auto_1043333 - SURFACE
      ?auto_1043338 - TRUCK
      ?auto_1043340 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043337 ?auto_1043339 ) ( SURFACE-AT ?auto_1043331 ?auto_1043339 ) ( CLEAR ?auto_1043331 ) ( IS-CRATE ?auto_1043332 ) ( not ( = ?auto_1043331 ?auto_1043332 ) ) ( AVAILABLE ?auto_1043337 ) ( ON ?auto_1043331 ?auto_1043336 ) ( not ( = ?auto_1043336 ?auto_1043331 ) ) ( not ( = ?auto_1043336 ?auto_1043332 ) ) ( not ( = ?auto_1043334 ?auto_1043339 ) ) ( HOIST-AT ?auto_1043335 ?auto_1043334 ) ( not ( = ?auto_1043337 ?auto_1043335 ) ) ( AVAILABLE ?auto_1043335 ) ( SURFACE-AT ?auto_1043332 ?auto_1043334 ) ( ON ?auto_1043332 ?auto_1043333 ) ( CLEAR ?auto_1043332 ) ( not ( = ?auto_1043331 ?auto_1043333 ) ) ( not ( = ?auto_1043332 ?auto_1043333 ) ) ( not ( = ?auto_1043336 ?auto_1043333 ) ) ( TRUCK-AT ?auto_1043338 ?auto_1043340 ) ( not ( = ?auto_1043340 ?auto_1043339 ) ) ( not ( = ?auto_1043334 ?auto_1043340 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1043338 ?auto_1043340 ?auto_1043339 )
      ( MAKE-1CRATE ?auto_1043331 ?auto_1043332 )
      ( MAKE-1CRATE-VERIFY ?auto_1043331 ?auto_1043332 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1043371 - SURFACE
      ?auto_1043372 - SURFACE
      ?auto_1043373 - SURFACE
      ?auto_1043370 - SURFACE
    )
    :vars
    (
      ?auto_1043374 - HOIST
      ?auto_1043375 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043374 ?auto_1043375 ) ( SURFACE-AT ?auto_1043373 ?auto_1043375 ) ( CLEAR ?auto_1043373 ) ( LIFTING ?auto_1043374 ?auto_1043370 ) ( IS-CRATE ?auto_1043370 ) ( not ( = ?auto_1043373 ?auto_1043370 ) ) ( ON ?auto_1043372 ?auto_1043371 ) ( ON ?auto_1043373 ?auto_1043372 ) ( not ( = ?auto_1043371 ?auto_1043372 ) ) ( not ( = ?auto_1043371 ?auto_1043373 ) ) ( not ( = ?auto_1043371 ?auto_1043370 ) ) ( not ( = ?auto_1043372 ?auto_1043373 ) ) ( not ( = ?auto_1043372 ?auto_1043370 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1043373 ?auto_1043370 )
      ( MAKE-3CRATE-VERIFY ?auto_1043371 ?auto_1043372 ?auto_1043373 ?auto_1043370 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1043388 - SURFACE
      ?auto_1043389 - SURFACE
      ?auto_1043390 - SURFACE
      ?auto_1043387 - SURFACE
    )
    :vars
    (
      ?auto_1043391 - HOIST
      ?auto_1043392 - PLACE
      ?auto_1043393 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043391 ?auto_1043392 ) ( SURFACE-AT ?auto_1043390 ?auto_1043392 ) ( CLEAR ?auto_1043390 ) ( IS-CRATE ?auto_1043387 ) ( not ( = ?auto_1043390 ?auto_1043387 ) ) ( TRUCK-AT ?auto_1043393 ?auto_1043392 ) ( AVAILABLE ?auto_1043391 ) ( IN ?auto_1043387 ?auto_1043393 ) ( ON ?auto_1043390 ?auto_1043389 ) ( not ( = ?auto_1043389 ?auto_1043390 ) ) ( not ( = ?auto_1043389 ?auto_1043387 ) ) ( ON ?auto_1043389 ?auto_1043388 ) ( not ( = ?auto_1043388 ?auto_1043389 ) ) ( not ( = ?auto_1043388 ?auto_1043390 ) ) ( not ( = ?auto_1043388 ?auto_1043387 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1043389 ?auto_1043390 ?auto_1043387 )
      ( MAKE-3CRATE-VERIFY ?auto_1043388 ?auto_1043389 ?auto_1043390 ?auto_1043387 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1043409 - SURFACE
      ?auto_1043410 - SURFACE
      ?auto_1043411 - SURFACE
      ?auto_1043408 - SURFACE
    )
    :vars
    (
      ?auto_1043413 - HOIST
      ?auto_1043415 - PLACE
      ?auto_1043412 - TRUCK
      ?auto_1043414 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043413 ?auto_1043415 ) ( SURFACE-AT ?auto_1043411 ?auto_1043415 ) ( CLEAR ?auto_1043411 ) ( IS-CRATE ?auto_1043408 ) ( not ( = ?auto_1043411 ?auto_1043408 ) ) ( AVAILABLE ?auto_1043413 ) ( IN ?auto_1043408 ?auto_1043412 ) ( ON ?auto_1043411 ?auto_1043410 ) ( not ( = ?auto_1043410 ?auto_1043411 ) ) ( not ( = ?auto_1043410 ?auto_1043408 ) ) ( TRUCK-AT ?auto_1043412 ?auto_1043414 ) ( not ( = ?auto_1043414 ?auto_1043415 ) ) ( ON ?auto_1043410 ?auto_1043409 ) ( not ( = ?auto_1043409 ?auto_1043410 ) ) ( not ( = ?auto_1043409 ?auto_1043411 ) ) ( not ( = ?auto_1043409 ?auto_1043408 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1043410 ?auto_1043411 ?auto_1043408 )
      ( MAKE-3CRATE-VERIFY ?auto_1043409 ?auto_1043410 ?auto_1043411 ?auto_1043408 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1043433 - SURFACE
      ?auto_1043434 - SURFACE
      ?auto_1043435 - SURFACE
      ?auto_1043432 - SURFACE
    )
    :vars
    (
      ?auto_1043436 - HOIST
      ?auto_1043439 - PLACE
      ?auto_1043437 - TRUCK
      ?auto_1043440 - PLACE
      ?auto_1043438 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043436 ?auto_1043439 ) ( SURFACE-AT ?auto_1043435 ?auto_1043439 ) ( CLEAR ?auto_1043435 ) ( IS-CRATE ?auto_1043432 ) ( not ( = ?auto_1043435 ?auto_1043432 ) ) ( AVAILABLE ?auto_1043436 ) ( ON ?auto_1043435 ?auto_1043434 ) ( not ( = ?auto_1043434 ?auto_1043435 ) ) ( not ( = ?auto_1043434 ?auto_1043432 ) ) ( TRUCK-AT ?auto_1043437 ?auto_1043440 ) ( not ( = ?auto_1043440 ?auto_1043439 ) ) ( HOIST-AT ?auto_1043438 ?auto_1043440 ) ( LIFTING ?auto_1043438 ?auto_1043432 ) ( not ( = ?auto_1043436 ?auto_1043438 ) ) ( ON ?auto_1043434 ?auto_1043433 ) ( not ( = ?auto_1043433 ?auto_1043434 ) ) ( not ( = ?auto_1043433 ?auto_1043435 ) ) ( not ( = ?auto_1043433 ?auto_1043432 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1043434 ?auto_1043435 ?auto_1043432 )
      ( MAKE-3CRATE-VERIFY ?auto_1043433 ?auto_1043434 ?auto_1043435 ?auto_1043432 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1043460 - SURFACE
      ?auto_1043461 - SURFACE
      ?auto_1043462 - SURFACE
      ?auto_1043459 - SURFACE
    )
    :vars
    (
      ?auto_1043465 - HOIST
      ?auto_1043468 - PLACE
      ?auto_1043467 - TRUCK
      ?auto_1043466 - PLACE
      ?auto_1043463 - HOIST
      ?auto_1043464 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043465 ?auto_1043468 ) ( SURFACE-AT ?auto_1043462 ?auto_1043468 ) ( CLEAR ?auto_1043462 ) ( IS-CRATE ?auto_1043459 ) ( not ( = ?auto_1043462 ?auto_1043459 ) ) ( AVAILABLE ?auto_1043465 ) ( ON ?auto_1043462 ?auto_1043461 ) ( not ( = ?auto_1043461 ?auto_1043462 ) ) ( not ( = ?auto_1043461 ?auto_1043459 ) ) ( TRUCK-AT ?auto_1043467 ?auto_1043466 ) ( not ( = ?auto_1043466 ?auto_1043468 ) ) ( HOIST-AT ?auto_1043463 ?auto_1043466 ) ( not ( = ?auto_1043465 ?auto_1043463 ) ) ( AVAILABLE ?auto_1043463 ) ( SURFACE-AT ?auto_1043459 ?auto_1043466 ) ( ON ?auto_1043459 ?auto_1043464 ) ( CLEAR ?auto_1043459 ) ( not ( = ?auto_1043462 ?auto_1043464 ) ) ( not ( = ?auto_1043459 ?auto_1043464 ) ) ( not ( = ?auto_1043461 ?auto_1043464 ) ) ( ON ?auto_1043461 ?auto_1043460 ) ( not ( = ?auto_1043460 ?auto_1043461 ) ) ( not ( = ?auto_1043460 ?auto_1043462 ) ) ( not ( = ?auto_1043460 ?auto_1043459 ) ) ( not ( = ?auto_1043460 ?auto_1043464 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1043461 ?auto_1043462 ?auto_1043459 )
      ( MAKE-3CRATE-VERIFY ?auto_1043460 ?auto_1043461 ?auto_1043462 ?auto_1043459 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1043488 - SURFACE
      ?auto_1043489 - SURFACE
      ?auto_1043490 - SURFACE
      ?auto_1043487 - SURFACE
    )
    :vars
    (
      ?auto_1043492 - HOIST
      ?auto_1043495 - PLACE
      ?auto_1043496 - PLACE
      ?auto_1043491 - HOIST
      ?auto_1043493 - SURFACE
      ?auto_1043494 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043492 ?auto_1043495 ) ( SURFACE-AT ?auto_1043490 ?auto_1043495 ) ( CLEAR ?auto_1043490 ) ( IS-CRATE ?auto_1043487 ) ( not ( = ?auto_1043490 ?auto_1043487 ) ) ( AVAILABLE ?auto_1043492 ) ( ON ?auto_1043490 ?auto_1043489 ) ( not ( = ?auto_1043489 ?auto_1043490 ) ) ( not ( = ?auto_1043489 ?auto_1043487 ) ) ( not ( = ?auto_1043496 ?auto_1043495 ) ) ( HOIST-AT ?auto_1043491 ?auto_1043496 ) ( not ( = ?auto_1043492 ?auto_1043491 ) ) ( AVAILABLE ?auto_1043491 ) ( SURFACE-AT ?auto_1043487 ?auto_1043496 ) ( ON ?auto_1043487 ?auto_1043493 ) ( CLEAR ?auto_1043487 ) ( not ( = ?auto_1043490 ?auto_1043493 ) ) ( not ( = ?auto_1043487 ?auto_1043493 ) ) ( not ( = ?auto_1043489 ?auto_1043493 ) ) ( TRUCK-AT ?auto_1043494 ?auto_1043495 ) ( ON ?auto_1043489 ?auto_1043488 ) ( not ( = ?auto_1043488 ?auto_1043489 ) ) ( not ( = ?auto_1043488 ?auto_1043490 ) ) ( not ( = ?auto_1043488 ?auto_1043487 ) ) ( not ( = ?auto_1043488 ?auto_1043493 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1043489 ?auto_1043490 ?auto_1043487 )
      ( MAKE-3CRATE-VERIFY ?auto_1043488 ?auto_1043489 ?auto_1043490 ?auto_1043487 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1043516 - SURFACE
      ?auto_1043517 - SURFACE
      ?auto_1043518 - SURFACE
      ?auto_1043515 - SURFACE
    )
    :vars
    (
      ?auto_1043524 - HOIST
      ?auto_1043523 - PLACE
      ?auto_1043521 - PLACE
      ?auto_1043519 - HOIST
      ?auto_1043522 - SURFACE
      ?auto_1043520 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043524 ?auto_1043523 ) ( IS-CRATE ?auto_1043515 ) ( not ( = ?auto_1043518 ?auto_1043515 ) ) ( not ( = ?auto_1043517 ?auto_1043518 ) ) ( not ( = ?auto_1043517 ?auto_1043515 ) ) ( not ( = ?auto_1043521 ?auto_1043523 ) ) ( HOIST-AT ?auto_1043519 ?auto_1043521 ) ( not ( = ?auto_1043524 ?auto_1043519 ) ) ( AVAILABLE ?auto_1043519 ) ( SURFACE-AT ?auto_1043515 ?auto_1043521 ) ( ON ?auto_1043515 ?auto_1043522 ) ( CLEAR ?auto_1043515 ) ( not ( = ?auto_1043518 ?auto_1043522 ) ) ( not ( = ?auto_1043515 ?auto_1043522 ) ) ( not ( = ?auto_1043517 ?auto_1043522 ) ) ( TRUCK-AT ?auto_1043520 ?auto_1043523 ) ( SURFACE-AT ?auto_1043517 ?auto_1043523 ) ( CLEAR ?auto_1043517 ) ( LIFTING ?auto_1043524 ?auto_1043518 ) ( IS-CRATE ?auto_1043518 ) ( ON ?auto_1043517 ?auto_1043516 ) ( not ( = ?auto_1043516 ?auto_1043517 ) ) ( not ( = ?auto_1043516 ?auto_1043518 ) ) ( not ( = ?auto_1043516 ?auto_1043515 ) ) ( not ( = ?auto_1043516 ?auto_1043522 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1043517 ?auto_1043518 ?auto_1043515 )
      ( MAKE-3CRATE-VERIFY ?auto_1043516 ?auto_1043517 ?auto_1043518 ?auto_1043515 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1043544 - SURFACE
      ?auto_1043545 - SURFACE
      ?auto_1043546 - SURFACE
      ?auto_1043543 - SURFACE
    )
    :vars
    (
      ?auto_1043551 - HOIST
      ?auto_1043550 - PLACE
      ?auto_1043547 - PLACE
      ?auto_1043549 - HOIST
      ?auto_1043548 - SURFACE
      ?auto_1043552 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043551 ?auto_1043550 ) ( IS-CRATE ?auto_1043543 ) ( not ( = ?auto_1043546 ?auto_1043543 ) ) ( not ( = ?auto_1043545 ?auto_1043546 ) ) ( not ( = ?auto_1043545 ?auto_1043543 ) ) ( not ( = ?auto_1043547 ?auto_1043550 ) ) ( HOIST-AT ?auto_1043549 ?auto_1043547 ) ( not ( = ?auto_1043551 ?auto_1043549 ) ) ( AVAILABLE ?auto_1043549 ) ( SURFACE-AT ?auto_1043543 ?auto_1043547 ) ( ON ?auto_1043543 ?auto_1043548 ) ( CLEAR ?auto_1043543 ) ( not ( = ?auto_1043546 ?auto_1043548 ) ) ( not ( = ?auto_1043543 ?auto_1043548 ) ) ( not ( = ?auto_1043545 ?auto_1043548 ) ) ( TRUCK-AT ?auto_1043552 ?auto_1043550 ) ( SURFACE-AT ?auto_1043545 ?auto_1043550 ) ( CLEAR ?auto_1043545 ) ( IS-CRATE ?auto_1043546 ) ( AVAILABLE ?auto_1043551 ) ( IN ?auto_1043546 ?auto_1043552 ) ( ON ?auto_1043545 ?auto_1043544 ) ( not ( = ?auto_1043544 ?auto_1043545 ) ) ( not ( = ?auto_1043544 ?auto_1043546 ) ) ( not ( = ?auto_1043544 ?auto_1043543 ) ) ( not ( = ?auto_1043544 ?auto_1043548 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1043545 ?auto_1043546 ?auto_1043543 )
      ( MAKE-3CRATE-VERIFY ?auto_1043544 ?auto_1043545 ?auto_1043546 ?auto_1043543 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1043835 - SURFACE
      ?auto_1043836 - SURFACE
      ?auto_1043837 - SURFACE
      ?auto_1043834 - SURFACE
      ?auto_1043838 - SURFACE
    )
    :vars
    (
      ?auto_1043839 - HOIST
      ?auto_1043840 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043839 ?auto_1043840 ) ( SURFACE-AT ?auto_1043834 ?auto_1043840 ) ( CLEAR ?auto_1043834 ) ( LIFTING ?auto_1043839 ?auto_1043838 ) ( IS-CRATE ?auto_1043838 ) ( not ( = ?auto_1043834 ?auto_1043838 ) ) ( ON ?auto_1043836 ?auto_1043835 ) ( ON ?auto_1043837 ?auto_1043836 ) ( ON ?auto_1043834 ?auto_1043837 ) ( not ( = ?auto_1043835 ?auto_1043836 ) ) ( not ( = ?auto_1043835 ?auto_1043837 ) ) ( not ( = ?auto_1043835 ?auto_1043834 ) ) ( not ( = ?auto_1043835 ?auto_1043838 ) ) ( not ( = ?auto_1043836 ?auto_1043837 ) ) ( not ( = ?auto_1043836 ?auto_1043834 ) ) ( not ( = ?auto_1043836 ?auto_1043838 ) ) ( not ( = ?auto_1043837 ?auto_1043834 ) ) ( not ( = ?auto_1043837 ?auto_1043838 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1043834 ?auto_1043838 )
      ( MAKE-4CRATE-VERIFY ?auto_1043835 ?auto_1043836 ?auto_1043837 ?auto_1043834 ?auto_1043838 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1043860 - SURFACE
      ?auto_1043861 - SURFACE
      ?auto_1043862 - SURFACE
      ?auto_1043859 - SURFACE
      ?auto_1043863 - SURFACE
    )
    :vars
    (
      ?auto_1043864 - HOIST
      ?auto_1043866 - PLACE
      ?auto_1043865 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043864 ?auto_1043866 ) ( SURFACE-AT ?auto_1043859 ?auto_1043866 ) ( CLEAR ?auto_1043859 ) ( IS-CRATE ?auto_1043863 ) ( not ( = ?auto_1043859 ?auto_1043863 ) ) ( TRUCK-AT ?auto_1043865 ?auto_1043866 ) ( AVAILABLE ?auto_1043864 ) ( IN ?auto_1043863 ?auto_1043865 ) ( ON ?auto_1043859 ?auto_1043862 ) ( not ( = ?auto_1043862 ?auto_1043859 ) ) ( not ( = ?auto_1043862 ?auto_1043863 ) ) ( ON ?auto_1043861 ?auto_1043860 ) ( ON ?auto_1043862 ?auto_1043861 ) ( not ( = ?auto_1043860 ?auto_1043861 ) ) ( not ( = ?auto_1043860 ?auto_1043862 ) ) ( not ( = ?auto_1043860 ?auto_1043859 ) ) ( not ( = ?auto_1043860 ?auto_1043863 ) ) ( not ( = ?auto_1043861 ?auto_1043862 ) ) ( not ( = ?auto_1043861 ?auto_1043859 ) ) ( not ( = ?auto_1043861 ?auto_1043863 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1043862 ?auto_1043859 ?auto_1043863 )
      ( MAKE-4CRATE-VERIFY ?auto_1043860 ?auto_1043861 ?auto_1043862 ?auto_1043859 ?auto_1043863 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1043890 - SURFACE
      ?auto_1043891 - SURFACE
      ?auto_1043892 - SURFACE
      ?auto_1043889 - SURFACE
      ?auto_1043893 - SURFACE
    )
    :vars
    (
      ?auto_1043895 - HOIST
      ?auto_1043894 - PLACE
      ?auto_1043897 - TRUCK
      ?auto_1043896 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043895 ?auto_1043894 ) ( SURFACE-AT ?auto_1043889 ?auto_1043894 ) ( CLEAR ?auto_1043889 ) ( IS-CRATE ?auto_1043893 ) ( not ( = ?auto_1043889 ?auto_1043893 ) ) ( AVAILABLE ?auto_1043895 ) ( IN ?auto_1043893 ?auto_1043897 ) ( ON ?auto_1043889 ?auto_1043892 ) ( not ( = ?auto_1043892 ?auto_1043889 ) ) ( not ( = ?auto_1043892 ?auto_1043893 ) ) ( TRUCK-AT ?auto_1043897 ?auto_1043896 ) ( not ( = ?auto_1043896 ?auto_1043894 ) ) ( ON ?auto_1043891 ?auto_1043890 ) ( ON ?auto_1043892 ?auto_1043891 ) ( not ( = ?auto_1043890 ?auto_1043891 ) ) ( not ( = ?auto_1043890 ?auto_1043892 ) ) ( not ( = ?auto_1043890 ?auto_1043889 ) ) ( not ( = ?auto_1043890 ?auto_1043893 ) ) ( not ( = ?auto_1043891 ?auto_1043892 ) ) ( not ( = ?auto_1043891 ?auto_1043889 ) ) ( not ( = ?auto_1043891 ?auto_1043893 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1043892 ?auto_1043889 ?auto_1043893 )
      ( MAKE-4CRATE-VERIFY ?auto_1043890 ?auto_1043891 ?auto_1043892 ?auto_1043889 ?auto_1043893 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1043924 - SURFACE
      ?auto_1043925 - SURFACE
      ?auto_1043926 - SURFACE
      ?auto_1043923 - SURFACE
      ?auto_1043927 - SURFACE
    )
    :vars
    (
      ?auto_1043932 - HOIST
      ?auto_1043928 - PLACE
      ?auto_1043929 - TRUCK
      ?auto_1043930 - PLACE
      ?auto_1043931 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043932 ?auto_1043928 ) ( SURFACE-AT ?auto_1043923 ?auto_1043928 ) ( CLEAR ?auto_1043923 ) ( IS-CRATE ?auto_1043927 ) ( not ( = ?auto_1043923 ?auto_1043927 ) ) ( AVAILABLE ?auto_1043932 ) ( ON ?auto_1043923 ?auto_1043926 ) ( not ( = ?auto_1043926 ?auto_1043923 ) ) ( not ( = ?auto_1043926 ?auto_1043927 ) ) ( TRUCK-AT ?auto_1043929 ?auto_1043930 ) ( not ( = ?auto_1043930 ?auto_1043928 ) ) ( HOIST-AT ?auto_1043931 ?auto_1043930 ) ( LIFTING ?auto_1043931 ?auto_1043927 ) ( not ( = ?auto_1043932 ?auto_1043931 ) ) ( ON ?auto_1043925 ?auto_1043924 ) ( ON ?auto_1043926 ?auto_1043925 ) ( not ( = ?auto_1043924 ?auto_1043925 ) ) ( not ( = ?auto_1043924 ?auto_1043926 ) ) ( not ( = ?auto_1043924 ?auto_1043923 ) ) ( not ( = ?auto_1043924 ?auto_1043927 ) ) ( not ( = ?auto_1043925 ?auto_1043926 ) ) ( not ( = ?auto_1043925 ?auto_1043923 ) ) ( not ( = ?auto_1043925 ?auto_1043927 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1043926 ?auto_1043923 ?auto_1043927 )
      ( MAKE-4CRATE-VERIFY ?auto_1043924 ?auto_1043925 ?auto_1043926 ?auto_1043923 ?auto_1043927 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1043962 - SURFACE
      ?auto_1043963 - SURFACE
      ?auto_1043964 - SURFACE
      ?auto_1043961 - SURFACE
      ?auto_1043965 - SURFACE
    )
    :vars
    (
      ?auto_1043968 - HOIST
      ?auto_1043967 - PLACE
      ?auto_1043971 - TRUCK
      ?auto_1043966 - PLACE
      ?auto_1043969 - HOIST
      ?auto_1043970 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043968 ?auto_1043967 ) ( SURFACE-AT ?auto_1043961 ?auto_1043967 ) ( CLEAR ?auto_1043961 ) ( IS-CRATE ?auto_1043965 ) ( not ( = ?auto_1043961 ?auto_1043965 ) ) ( AVAILABLE ?auto_1043968 ) ( ON ?auto_1043961 ?auto_1043964 ) ( not ( = ?auto_1043964 ?auto_1043961 ) ) ( not ( = ?auto_1043964 ?auto_1043965 ) ) ( TRUCK-AT ?auto_1043971 ?auto_1043966 ) ( not ( = ?auto_1043966 ?auto_1043967 ) ) ( HOIST-AT ?auto_1043969 ?auto_1043966 ) ( not ( = ?auto_1043968 ?auto_1043969 ) ) ( AVAILABLE ?auto_1043969 ) ( SURFACE-AT ?auto_1043965 ?auto_1043966 ) ( ON ?auto_1043965 ?auto_1043970 ) ( CLEAR ?auto_1043965 ) ( not ( = ?auto_1043961 ?auto_1043970 ) ) ( not ( = ?auto_1043965 ?auto_1043970 ) ) ( not ( = ?auto_1043964 ?auto_1043970 ) ) ( ON ?auto_1043963 ?auto_1043962 ) ( ON ?auto_1043964 ?auto_1043963 ) ( not ( = ?auto_1043962 ?auto_1043963 ) ) ( not ( = ?auto_1043962 ?auto_1043964 ) ) ( not ( = ?auto_1043962 ?auto_1043961 ) ) ( not ( = ?auto_1043962 ?auto_1043965 ) ) ( not ( = ?auto_1043962 ?auto_1043970 ) ) ( not ( = ?auto_1043963 ?auto_1043964 ) ) ( not ( = ?auto_1043963 ?auto_1043961 ) ) ( not ( = ?auto_1043963 ?auto_1043965 ) ) ( not ( = ?auto_1043963 ?auto_1043970 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1043964 ?auto_1043961 ?auto_1043965 )
      ( MAKE-4CRATE-VERIFY ?auto_1043962 ?auto_1043963 ?auto_1043964 ?auto_1043961 ?auto_1043965 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1044001 - SURFACE
      ?auto_1044002 - SURFACE
      ?auto_1044003 - SURFACE
      ?auto_1044000 - SURFACE
      ?auto_1044004 - SURFACE
    )
    :vars
    (
      ?auto_1044006 - HOIST
      ?auto_1044005 - PLACE
      ?auto_1044009 - PLACE
      ?auto_1044008 - HOIST
      ?auto_1044007 - SURFACE
      ?auto_1044010 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1044006 ?auto_1044005 ) ( SURFACE-AT ?auto_1044000 ?auto_1044005 ) ( CLEAR ?auto_1044000 ) ( IS-CRATE ?auto_1044004 ) ( not ( = ?auto_1044000 ?auto_1044004 ) ) ( AVAILABLE ?auto_1044006 ) ( ON ?auto_1044000 ?auto_1044003 ) ( not ( = ?auto_1044003 ?auto_1044000 ) ) ( not ( = ?auto_1044003 ?auto_1044004 ) ) ( not ( = ?auto_1044009 ?auto_1044005 ) ) ( HOIST-AT ?auto_1044008 ?auto_1044009 ) ( not ( = ?auto_1044006 ?auto_1044008 ) ) ( AVAILABLE ?auto_1044008 ) ( SURFACE-AT ?auto_1044004 ?auto_1044009 ) ( ON ?auto_1044004 ?auto_1044007 ) ( CLEAR ?auto_1044004 ) ( not ( = ?auto_1044000 ?auto_1044007 ) ) ( not ( = ?auto_1044004 ?auto_1044007 ) ) ( not ( = ?auto_1044003 ?auto_1044007 ) ) ( TRUCK-AT ?auto_1044010 ?auto_1044005 ) ( ON ?auto_1044002 ?auto_1044001 ) ( ON ?auto_1044003 ?auto_1044002 ) ( not ( = ?auto_1044001 ?auto_1044002 ) ) ( not ( = ?auto_1044001 ?auto_1044003 ) ) ( not ( = ?auto_1044001 ?auto_1044000 ) ) ( not ( = ?auto_1044001 ?auto_1044004 ) ) ( not ( = ?auto_1044001 ?auto_1044007 ) ) ( not ( = ?auto_1044002 ?auto_1044003 ) ) ( not ( = ?auto_1044002 ?auto_1044000 ) ) ( not ( = ?auto_1044002 ?auto_1044004 ) ) ( not ( = ?auto_1044002 ?auto_1044007 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1044003 ?auto_1044000 ?auto_1044004 )
      ( MAKE-4CRATE-VERIFY ?auto_1044001 ?auto_1044002 ?auto_1044003 ?auto_1044000 ?auto_1044004 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1044040 - SURFACE
      ?auto_1044041 - SURFACE
      ?auto_1044042 - SURFACE
      ?auto_1044039 - SURFACE
      ?auto_1044043 - SURFACE
    )
    :vars
    (
      ?auto_1044045 - HOIST
      ?auto_1044049 - PLACE
      ?auto_1044047 - PLACE
      ?auto_1044044 - HOIST
      ?auto_1044048 - SURFACE
      ?auto_1044046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1044045 ?auto_1044049 ) ( IS-CRATE ?auto_1044043 ) ( not ( = ?auto_1044039 ?auto_1044043 ) ) ( not ( = ?auto_1044042 ?auto_1044039 ) ) ( not ( = ?auto_1044042 ?auto_1044043 ) ) ( not ( = ?auto_1044047 ?auto_1044049 ) ) ( HOIST-AT ?auto_1044044 ?auto_1044047 ) ( not ( = ?auto_1044045 ?auto_1044044 ) ) ( AVAILABLE ?auto_1044044 ) ( SURFACE-AT ?auto_1044043 ?auto_1044047 ) ( ON ?auto_1044043 ?auto_1044048 ) ( CLEAR ?auto_1044043 ) ( not ( = ?auto_1044039 ?auto_1044048 ) ) ( not ( = ?auto_1044043 ?auto_1044048 ) ) ( not ( = ?auto_1044042 ?auto_1044048 ) ) ( TRUCK-AT ?auto_1044046 ?auto_1044049 ) ( SURFACE-AT ?auto_1044042 ?auto_1044049 ) ( CLEAR ?auto_1044042 ) ( LIFTING ?auto_1044045 ?auto_1044039 ) ( IS-CRATE ?auto_1044039 ) ( ON ?auto_1044041 ?auto_1044040 ) ( ON ?auto_1044042 ?auto_1044041 ) ( not ( = ?auto_1044040 ?auto_1044041 ) ) ( not ( = ?auto_1044040 ?auto_1044042 ) ) ( not ( = ?auto_1044040 ?auto_1044039 ) ) ( not ( = ?auto_1044040 ?auto_1044043 ) ) ( not ( = ?auto_1044040 ?auto_1044048 ) ) ( not ( = ?auto_1044041 ?auto_1044042 ) ) ( not ( = ?auto_1044041 ?auto_1044039 ) ) ( not ( = ?auto_1044041 ?auto_1044043 ) ) ( not ( = ?auto_1044041 ?auto_1044048 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1044042 ?auto_1044039 ?auto_1044043 )
      ( MAKE-4CRATE-VERIFY ?auto_1044040 ?auto_1044041 ?auto_1044042 ?auto_1044039 ?auto_1044043 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1044079 - SURFACE
      ?auto_1044080 - SURFACE
      ?auto_1044081 - SURFACE
      ?auto_1044078 - SURFACE
      ?auto_1044082 - SURFACE
    )
    :vars
    (
      ?auto_1044083 - HOIST
      ?auto_1044084 - PLACE
      ?auto_1044087 - PLACE
      ?auto_1044088 - HOIST
      ?auto_1044086 - SURFACE
      ?auto_1044085 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1044083 ?auto_1044084 ) ( IS-CRATE ?auto_1044082 ) ( not ( = ?auto_1044078 ?auto_1044082 ) ) ( not ( = ?auto_1044081 ?auto_1044078 ) ) ( not ( = ?auto_1044081 ?auto_1044082 ) ) ( not ( = ?auto_1044087 ?auto_1044084 ) ) ( HOIST-AT ?auto_1044088 ?auto_1044087 ) ( not ( = ?auto_1044083 ?auto_1044088 ) ) ( AVAILABLE ?auto_1044088 ) ( SURFACE-AT ?auto_1044082 ?auto_1044087 ) ( ON ?auto_1044082 ?auto_1044086 ) ( CLEAR ?auto_1044082 ) ( not ( = ?auto_1044078 ?auto_1044086 ) ) ( not ( = ?auto_1044082 ?auto_1044086 ) ) ( not ( = ?auto_1044081 ?auto_1044086 ) ) ( TRUCK-AT ?auto_1044085 ?auto_1044084 ) ( SURFACE-AT ?auto_1044081 ?auto_1044084 ) ( CLEAR ?auto_1044081 ) ( IS-CRATE ?auto_1044078 ) ( AVAILABLE ?auto_1044083 ) ( IN ?auto_1044078 ?auto_1044085 ) ( ON ?auto_1044080 ?auto_1044079 ) ( ON ?auto_1044081 ?auto_1044080 ) ( not ( = ?auto_1044079 ?auto_1044080 ) ) ( not ( = ?auto_1044079 ?auto_1044081 ) ) ( not ( = ?auto_1044079 ?auto_1044078 ) ) ( not ( = ?auto_1044079 ?auto_1044082 ) ) ( not ( = ?auto_1044079 ?auto_1044086 ) ) ( not ( = ?auto_1044080 ?auto_1044081 ) ) ( not ( = ?auto_1044080 ?auto_1044078 ) ) ( not ( = ?auto_1044080 ?auto_1044082 ) ) ( not ( = ?auto_1044080 ?auto_1044086 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1044081 ?auto_1044078 ?auto_1044082 )
      ( MAKE-4CRATE-VERIFY ?auto_1044079 ?auto_1044080 ?auto_1044081 ?auto_1044078 ?auto_1044082 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1044739 - SURFACE
      ?auto_1044740 - SURFACE
      ?auto_1044741 - SURFACE
      ?auto_1044738 - SURFACE
      ?auto_1044742 - SURFACE
      ?auto_1044743 - SURFACE
    )
    :vars
    (
      ?auto_1044745 - HOIST
      ?auto_1044744 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1044745 ?auto_1044744 ) ( SURFACE-AT ?auto_1044742 ?auto_1044744 ) ( CLEAR ?auto_1044742 ) ( LIFTING ?auto_1044745 ?auto_1044743 ) ( IS-CRATE ?auto_1044743 ) ( not ( = ?auto_1044742 ?auto_1044743 ) ) ( ON ?auto_1044740 ?auto_1044739 ) ( ON ?auto_1044741 ?auto_1044740 ) ( ON ?auto_1044738 ?auto_1044741 ) ( ON ?auto_1044742 ?auto_1044738 ) ( not ( = ?auto_1044739 ?auto_1044740 ) ) ( not ( = ?auto_1044739 ?auto_1044741 ) ) ( not ( = ?auto_1044739 ?auto_1044738 ) ) ( not ( = ?auto_1044739 ?auto_1044742 ) ) ( not ( = ?auto_1044739 ?auto_1044743 ) ) ( not ( = ?auto_1044740 ?auto_1044741 ) ) ( not ( = ?auto_1044740 ?auto_1044738 ) ) ( not ( = ?auto_1044740 ?auto_1044742 ) ) ( not ( = ?auto_1044740 ?auto_1044743 ) ) ( not ( = ?auto_1044741 ?auto_1044738 ) ) ( not ( = ?auto_1044741 ?auto_1044742 ) ) ( not ( = ?auto_1044741 ?auto_1044743 ) ) ( not ( = ?auto_1044738 ?auto_1044742 ) ) ( not ( = ?auto_1044738 ?auto_1044743 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1044742 ?auto_1044743 )
      ( MAKE-5CRATE-VERIFY ?auto_1044739 ?auto_1044740 ?auto_1044741 ?auto_1044738 ?auto_1044742 ?auto_1044743 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1044773 - SURFACE
      ?auto_1044774 - SURFACE
      ?auto_1044775 - SURFACE
      ?auto_1044772 - SURFACE
      ?auto_1044776 - SURFACE
      ?auto_1044777 - SURFACE
    )
    :vars
    (
      ?auto_1044778 - HOIST
      ?auto_1044779 - PLACE
      ?auto_1044780 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1044778 ?auto_1044779 ) ( SURFACE-AT ?auto_1044776 ?auto_1044779 ) ( CLEAR ?auto_1044776 ) ( IS-CRATE ?auto_1044777 ) ( not ( = ?auto_1044776 ?auto_1044777 ) ) ( TRUCK-AT ?auto_1044780 ?auto_1044779 ) ( AVAILABLE ?auto_1044778 ) ( IN ?auto_1044777 ?auto_1044780 ) ( ON ?auto_1044776 ?auto_1044772 ) ( not ( = ?auto_1044772 ?auto_1044776 ) ) ( not ( = ?auto_1044772 ?auto_1044777 ) ) ( ON ?auto_1044774 ?auto_1044773 ) ( ON ?auto_1044775 ?auto_1044774 ) ( ON ?auto_1044772 ?auto_1044775 ) ( not ( = ?auto_1044773 ?auto_1044774 ) ) ( not ( = ?auto_1044773 ?auto_1044775 ) ) ( not ( = ?auto_1044773 ?auto_1044772 ) ) ( not ( = ?auto_1044773 ?auto_1044776 ) ) ( not ( = ?auto_1044773 ?auto_1044777 ) ) ( not ( = ?auto_1044774 ?auto_1044775 ) ) ( not ( = ?auto_1044774 ?auto_1044772 ) ) ( not ( = ?auto_1044774 ?auto_1044776 ) ) ( not ( = ?auto_1044774 ?auto_1044777 ) ) ( not ( = ?auto_1044775 ?auto_1044772 ) ) ( not ( = ?auto_1044775 ?auto_1044776 ) ) ( not ( = ?auto_1044775 ?auto_1044777 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1044772 ?auto_1044776 ?auto_1044777 )
      ( MAKE-5CRATE-VERIFY ?auto_1044773 ?auto_1044774 ?auto_1044775 ?auto_1044772 ?auto_1044776 ?auto_1044777 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1044813 - SURFACE
      ?auto_1044814 - SURFACE
      ?auto_1044815 - SURFACE
      ?auto_1044812 - SURFACE
      ?auto_1044816 - SURFACE
      ?auto_1044817 - SURFACE
    )
    :vars
    (
      ?auto_1044821 - HOIST
      ?auto_1044819 - PLACE
      ?auto_1044818 - TRUCK
      ?auto_1044820 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1044821 ?auto_1044819 ) ( SURFACE-AT ?auto_1044816 ?auto_1044819 ) ( CLEAR ?auto_1044816 ) ( IS-CRATE ?auto_1044817 ) ( not ( = ?auto_1044816 ?auto_1044817 ) ) ( AVAILABLE ?auto_1044821 ) ( IN ?auto_1044817 ?auto_1044818 ) ( ON ?auto_1044816 ?auto_1044812 ) ( not ( = ?auto_1044812 ?auto_1044816 ) ) ( not ( = ?auto_1044812 ?auto_1044817 ) ) ( TRUCK-AT ?auto_1044818 ?auto_1044820 ) ( not ( = ?auto_1044820 ?auto_1044819 ) ) ( ON ?auto_1044814 ?auto_1044813 ) ( ON ?auto_1044815 ?auto_1044814 ) ( ON ?auto_1044812 ?auto_1044815 ) ( not ( = ?auto_1044813 ?auto_1044814 ) ) ( not ( = ?auto_1044813 ?auto_1044815 ) ) ( not ( = ?auto_1044813 ?auto_1044812 ) ) ( not ( = ?auto_1044813 ?auto_1044816 ) ) ( not ( = ?auto_1044813 ?auto_1044817 ) ) ( not ( = ?auto_1044814 ?auto_1044815 ) ) ( not ( = ?auto_1044814 ?auto_1044812 ) ) ( not ( = ?auto_1044814 ?auto_1044816 ) ) ( not ( = ?auto_1044814 ?auto_1044817 ) ) ( not ( = ?auto_1044815 ?auto_1044812 ) ) ( not ( = ?auto_1044815 ?auto_1044816 ) ) ( not ( = ?auto_1044815 ?auto_1044817 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1044812 ?auto_1044816 ?auto_1044817 )
      ( MAKE-5CRATE-VERIFY ?auto_1044813 ?auto_1044814 ?auto_1044815 ?auto_1044812 ?auto_1044816 ?auto_1044817 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1044858 - SURFACE
      ?auto_1044859 - SURFACE
      ?auto_1044860 - SURFACE
      ?auto_1044857 - SURFACE
      ?auto_1044861 - SURFACE
      ?auto_1044862 - SURFACE
    )
    :vars
    (
      ?auto_1044865 - HOIST
      ?auto_1044863 - PLACE
      ?auto_1044866 - TRUCK
      ?auto_1044867 - PLACE
      ?auto_1044864 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1044865 ?auto_1044863 ) ( SURFACE-AT ?auto_1044861 ?auto_1044863 ) ( CLEAR ?auto_1044861 ) ( IS-CRATE ?auto_1044862 ) ( not ( = ?auto_1044861 ?auto_1044862 ) ) ( AVAILABLE ?auto_1044865 ) ( ON ?auto_1044861 ?auto_1044857 ) ( not ( = ?auto_1044857 ?auto_1044861 ) ) ( not ( = ?auto_1044857 ?auto_1044862 ) ) ( TRUCK-AT ?auto_1044866 ?auto_1044867 ) ( not ( = ?auto_1044867 ?auto_1044863 ) ) ( HOIST-AT ?auto_1044864 ?auto_1044867 ) ( LIFTING ?auto_1044864 ?auto_1044862 ) ( not ( = ?auto_1044865 ?auto_1044864 ) ) ( ON ?auto_1044859 ?auto_1044858 ) ( ON ?auto_1044860 ?auto_1044859 ) ( ON ?auto_1044857 ?auto_1044860 ) ( not ( = ?auto_1044858 ?auto_1044859 ) ) ( not ( = ?auto_1044858 ?auto_1044860 ) ) ( not ( = ?auto_1044858 ?auto_1044857 ) ) ( not ( = ?auto_1044858 ?auto_1044861 ) ) ( not ( = ?auto_1044858 ?auto_1044862 ) ) ( not ( = ?auto_1044859 ?auto_1044860 ) ) ( not ( = ?auto_1044859 ?auto_1044857 ) ) ( not ( = ?auto_1044859 ?auto_1044861 ) ) ( not ( = ?auto_1044859 ?auto_1044862 ) ) ( not ( = ?auto_1044860 ?auto_1044857 ) ) ( not ( = ?auto_1044860 ?auto_1044861 ) ) ( not ( = ?auto_1044860 ?auto_1044862 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1044857 ?auto_1044861 ?auto_1044862 )
      ( MAKE-5CRATE-VERIFY ?auto_1044858 ?auto_1044859 ?auto_1044860 ?auto_1044857 ?auto_1044861 ?auto_1044862 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1044908 - SURFACE
      ?auto_1044909 - SURFACE
      ?auto_1044910 - SURFACE
      ?auto_1044907 - SURFACE
      ?auto_1044911 - SURFACE
      ?auto_1044912 - SURFACE
    )
    :vars
    (
      ?auto_1044913 - HOIST
      ?auto_1044918 - PLACE
      ?auto_1044915 - TRUCK
      ?auto_1044917 - PLACE
      ?auto_1044914 - HOIST
      ?auto_1044916 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1044913 ?auto_1044918 ) ( SURFACE-AT ?auto_1044911 ?auto_1044918 ) ( CLEAR ?auto_1044911 ) ( IS-CRATE ?auto_1044912 ) ( not ( = ?auto_1044911 ?auto_1044912 ) ) ( AVAILABLE ?auto_1044913 ) ( ON ?auto_1044911 ?auto_1044907 ) ( not ( = ?auto_1044907 ?auto_1044911 ) ) ( not ( = ?auto_1044907 ?auto_1044912 ) ) ( TRUCK-AT ?auto_1044915 ?auto_1044917 ) ( not ( = ?auto_1044917 ?auto_1044918 ) ) ( HOIST-AT ?auto_1044914 ?auto_1044917 ) ( not ( = ?auto_1044913 ?auto_1044914 ) ) ( AVAILABLE ?auto_1044914 ) ( SURFACE-AT ?auto_1044912 ?auto_1044917 ) ( ON ?auto_1044912 ?auto_1044916 ) ( CLEAR ?auto_1044912 ) ( not ( = ?auto_1044911 ?auto_1044916 ) ) ( not ( = ?auto_1044912 ?auto_1044916 ) ) ( not ( = ?auto_1044907 ?auto_1044916 ) ) ( ON ?auto_1044909 ?auto_1044908 ) ( ON ?auto_1044910 ?auto_1044909 ) ( ON ?auto_1044907 ?auto_1044910 ) ( not ( = ?auto_1044908 ?auto_1044909 ) ) ( not ( = ?auto_1044908 ?auto_1044910 ) ) ( not ( = ?auto_1044908 ?auto_1044907 ) ) ( not ( = ?auto_1044908 ?auto_1044911 ) ) ( not ( = ?auto_1044908 ?auto_1044912 ) ) ( not ( = ?auto_1044908 ?auto_1044916 ) ) ( not ( = ?auto_1044909 ?auto_1044910 ) ) ( not ( = ?auto_1044909 ?auto_1044907 ) ) ( not ( = ?auto_1044909 ?auto_1044911 ) ) ( not ( = ?auto_1044909 ?auto_1044912 ) ) ( not ( = ?auto_1044909 ?auto_1044916 ) ) ( not ( = ?auto_1044910 ?auto_1044907 ) ) ( not ( = ?auto_1044910 ?auto_1044911 ) ) ( not ( = ?auto_1044910 ?auto_1044912 ) ) ( not ( = ?auto_1044910 ?auto_1044916 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1044907 ?auto_1044911 ?auto_1044912 )
      ( MAKE-5CRATE-VERIFY ?auto_1044908 ?auto_1044909 ?auto_1044910 ?auto_1044907 ?auto_1044911 ?auto_1044912 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1044959 - SURFACE
      ?auto_1044960 - SURFACE
      ?auto_1044961 - SURFACE
      ?auto_1044958 - SURFACE
      ?auto_1044962 - SURFACE
      ?auto_1044963 - SURFACE
    )
    :vars
    (
      ?auto_1044969 - HOIST
      ?auto_1044965 - PLACE
      ?auto_1044967 - PLACE
      ?auto_1044968 - HOIST
      ?auto_1044966 - SURFACE
      ?auto_1044964 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1044969 ?auto_1044965 ) ( SURFACE-AT ?auto_1044962 ?auto_1044965 ) ( CLEAR ?auto_1044962 ) ( IS-CRATE ?auto_1044963 ) ( not ( = ?auto_1044962 ?auto_1044963 ) ) ( AVAILABLE ?auto_1044969 ) ( ON ?auto_1044962 ?auto_1044958 ) ( not ( = ?auto_1044958 ?auto_1044962 ) ) ( not ( = ?auto_1044958 ?auto_1044963 ) ) ( not ( = ?auto_1044967 ?auto_1044965 ) ) ( HOIST-AT ?auto_1044968 ?auto_1044967 ) ( not ( = ?auto_1044969 ?auto_1044968 ) ) ( AVAILABLE ?auto_1044968 ) ( SURFACE-AT ?auto_1044963 ?auto_1044967 ) ( ON ?auto_1044963 ?auto_1044966 ) ( CLEAR ?auto_1044963 ) ( not ( = ?auto_1044962 ?auto_1044966 ) ) ( not ( = ?auto_1044963 ?auto_1044966 ) ) ( not ( = ?auto_1044958 ?auto_1044966 ) ) ( TRUCK-AT ?auto_1044964 ?auto_1044965 ) ( ON ?auto_1044960 ?auto_1044959 ) ( ON ?auto_1044961 ?auto_1044960 ) ( ON ?auto_1044958 ?auto_1044961 ) ( not ( = ?auto_1044959 ?auto_1044960 ) ) ( not ( = ?auto_1044959 ?auto_1044961 ) ) ( not ( = ?auto_1044959 ?auto_1044958 ) ) ( not ( = ?auto_1044959 ?auto_1044962 ) ) ( not ( = ?auto_1044959 ?auto_1044963 ) ) ( not ( = ?auto_1044959 ?auto_1044966 ) ) ( not ( = ?auto_1044960 ?auto_1044961 ) ) ( not ( = ?auto_1044960 ?auto_1044958 ) ) ( not ( = ?auto_1044960 ?auto_1044962 ) ) ( not ( = ?auto_1044960 ?auto_1044963 ) ) ( not ( = ?auto_1044960 ?auto_1044966 ) ) ( not ( = ?auto_1044961 ?auto_1044958 ) ) ( not ( = ?auto_1044961 ?auto_1044962 ) ) ( not ( = ?auto_1044961 ?auto_1044963 ) ) ( not ( = ?auto_1044961 ?auto_1044966 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1044958 ?auto_1044962 ?auto_1044963 )
      ( MAKE-5CRATE-VERIFY ?auto_1044959 ?auto_1044960 ?auto_1044961 ?auto_1044958 ?auto_1044962 ?auto_1044963 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1045010 - SURFACE
      ?auto_1045011 - SURFACE
      ?auto_1045012 - SURFACE
      ?auto_1045009 - SURFACE
      ?auto_1045013 - SURFACE
      ?auto_1045014 - SURFACE
    )
    :vars
    (
      ?auto_1045015 - HOIST
      ?auto_1045017 - PLACE
      ?auto_1045018 - PLACE
      ?auto_1045019 - HOIST
      ?auto_1045016 - SURFACE
      ?auto_1045020 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1045015 ?auto_1045017 ) ( IS-CRATE ?auto_1045014 ) ( not ( = ?auto_1045013 ?auto_1045014 ) ) ( not ( = ?auto_1045009 ?auto_1045013 ) ) ( not ( = ?auto_1045009 ?auto_1045014 ) ) ( not ( = ?auto_1045018 ?auto_1045017 ) ) ( HOIST-AT ?auto_1045019 ?auto_1045018 ) ( not ( = ?auto_1045015 ?auto_1045019 ) ) ( AVAILABLE ?auto_1045019 ) ( SURFACE-AT ?auto_1045014 ?auto_1045018 ) ( ON ?auto_1045014 ?auto_1045016 ) ( CLEAR ?auto_1045014 ) ( not ( = ?auto_1045013 ?auto_1045016 ) ) ( not ( = ?auto_1045014 ?auto_1045016 ) ) ( not ( = ?auto_1045009 ?auto_1045016 ) ) ( TRUCK-AT ?auto_1045020 ?auto_1045017 ) ( SURFACE-AT ?auto_1045009 ?auto_1045017 ) ( CLEAR ?auto_1045009 ) ( LIFTING ?auto_1045015 ?auto_1045013 ) ( IS-CRATE ?auto_1045013 ) ( ON ?auto_1045011 ?auto_1045010 ) ( ON ?auto_1045012 ?auto_1045011 ) ( ON ?auto_1045009 ?auto_1045012 ) ( not ( = ?auto_1045010 ?auto_1045011 ) ) ( not ( = ?auto_1045010 ?auto_1045012 ) ) ( not ( = ?auto_1045010 ?auto_1045009 ) ) ( not ( = ?auto_1045010 ?auto_1045013 ) ) ( not ( = ?auto_1045010 ?auto_1045014 ) ) ( not ( = ?auto_1045010 ?auto_1045016 ) ) ( not ( = ?auto_1045011 ?auto_1045012 ) ) ( not ( = ?auto_1045011 ?auto_1045009 ) ) ( not ( = ?auto_1045011 ?auto_1045013 ) ) ( not ( = ?auto_1045011 ?auto_1045014 ) ) ( not ( = ?auto_1045011 ?auto_1045016 ) ) ( not ( = ?auto_1045012 ?auto_1045009 ) ) ( not ( = ?auto_1045012 ?auto_1045013 ) ) ( not ( = ?auto_1045012 ?auto_1045014 ) ) ( not ( = ?auto_1045012 ?auto_1045016 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1045009 ?auto_1045013 ?auto_1045014 )
      ( MAKE-5CRATE-VERIFY ?auto_1045010 ?auto_1045011 ?auto_1045012 ?auto_1045009 ?auto_1045013 ?auto_1045014 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1045061 - SURFACE
      ?auto_1045062 - SURFACE
      ?auto_1045063 - SURFACE
      ?auto_1045060 - SURFACE
      ?auto_1045064 - SURFACE
      ?auto_1045065 - SURFACE
    )
    :vars
    (
      ?auto_1045067 - HOIST
      ?auto_1045068 - PLACE
      ?auto_1045071 - PLACE
      ?auto_1045070 - HOIST
      ?auto_1045066 - SURFACE
      ?auto_1045069 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1045067 ?auto_1045068 ) ( IS-CRATE ?auto_1045065 ) ( not ( = ?auto_1045064 ?auto_1045065 ) ) ( not ( = ?auto_1045060 ?auto_1045064 ) ) ( not ( = ?auto_1045060 ?auto_1045065 ) ) ( not ( = ?auto_1045071 ?auto_1045068 ) ) ( HOIST-AT ?auto_1045070 ?auto_1045071 ) ( not ( = ?auto_1045067 ?auto_1045070 ) ) ( AVAILABLE ?auto_1045070 ) ( SURFACE-AT ?auto_1045065 ?auto_1045071 ) ( ON ?auto_1045065 ?auto_1045066 ) ( CLEAR ?auto_1045065 ) ( not ( = ?auto_1045064 ?auto_1045066 ) ) ( not ( = ?auto_1045065 ?auto_1045066 ) ) ( not ( = ?auto_1045060 ?auto_1045066 ) ) ( TRUCK-AT ?auto_1045069 ?auto_1045068 ) ( SURFACE-AT ?auto_1045060 ?auto_1045068 ) ( CLEAR ?auto_1045060 ) ( IS-CRATE ?auto_1045064 ) ( AVAILABLE ?auto_1045067 ) ( IN ?auto_1045064 ?auto_1045069 ) ( ON ?auto_1045062 ?auto_1045061 ) ( ON ?auto_1045063 ?auto_1045062 ) ( ON ?auto_1045060 ?auto_1045063 ) ( not ( = ?auto_1045061 ?auto_1045062 ) ) ( not ( = ?auto_1045061 ?auto_1045063 ) ) ( not ( = ?auto_1045061 ?auto_1045060 ) ) ( not ( = ?auto_1045061 ?auto_1045064 ) ) ( not ( = ?auto_1045061 ?auto_1045065 ) ) ( not ( = ?auto_1045061 ?auto_1045066 ) ) ( not ( = ?auto_1045062 ?auto_1045063 ) ) ( not ( = ?auto_1045062 ?auto_1045060 ) ) ( not ( = ?auto_1045062 ?auto_1045064 ) ) ( not ( = ?auto_1045062 ?auto_1045065 ) ) ( not ( = ?auto_1045062 ?auto_1045066 ) ) ( not ( = ?auto_1045063 ?auto_1045060 ) ) ( not ( = ?auto_1045063 ?auto_1045064 ) ) ( not ( = ?auto_1045063 ?auto_1045065 ) ) ( not ( = ?auto_1045063 ?auto_1045066 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1045060 ?auto_1045064 ?auto_1045065 )
      ( MAKE-5CRATE-VERIFY ?auto_1045061 ?auto_1045062 ?auto_1045063 ?auto_1045060 ?auto_1045064 ?auto_1045065 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1046270 - SURFACE
      ?auto_1046271 - SURFACE
      ?auto_1046272 - SURFACE
      ?auto_1046269 - SURFACE
      ?auto_1046273 - SURFACE
      ?auto_1046275 - SURFACE
      ?auto_1046274 - SURFACE
    )
    :vars
    (
      ?auto_1046276 - HOIST
      ?auto_1046277 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1046276 ?auto_1046277 ) ( SURFACE-AT ?auto_1046275 ?auto_1046277 ) ( CLEAR ?auto_1046275 ) ( LIFTING ?auto_1046276 ?auto_1046274 ) ( IS-CRATE ?auto_1046274 ) ( not ( = ?auto_1046275 ?auto_1046274 ) ) ( ON ?auto_1046271 ?auto_1046270 ) ( ON ?auto_1046272 ?auto_1046271 ) ( ON ?auto_1046269 ?auto_1046272 ) ( ON ?auto_1046273 ?auto_1046269 ) ( ON ?auto_1046275 ?auto_1046273 ) ( not ( = ?auto_1046270 ?auto_1046271 ) ) ( not ( = ?auto_1046270 ?auto_1046272 ) ) ( not ( = ?auto_1046270 ?auto_1046269 ) ) ( not ( = ?auto_1046270 ?auto_1046273 ) ) ( not ( = ?auto_1046270 ?auto_1046275 ) ) ( not ( = ?auto_1046270 ?auto_1046274 ) ) ( not ( = ?auto_1046271 ?auto_1046272 ) ) ( not ( = ?auto_1046271 ?auto_1046269 ) ) ( not ( = ?auto_1046271 ?auto_1046273 ) ) ( not ( = ?auto_1046271 ?auto_1046275 ) ) ( not ( = ?auto_1046271 ?auto_1046274 ) ) ( not ( = ?auto_1046272 ?auto_1046269 ) ) ( not ( = ?auto_1046272 ?auto_1046273 ) ) ( not ( = ?auto_1046272 ?auto_1046275 ) ) ( not ( = ?auto_1046272 ?auto_1046274 ) ) ( not ( = ?auto_1046269 ?auto_1046273 ) ) ( not ( = ?auto_1046269 ?auto_1046275 ) ) ( not ( = ?auto_1046269 ?auto_1046274 ) ) ( not ( = ?auto_1046273 ?auto_1046275 ) ) ( not ( = ?auto_1046273 ?auto_1046274 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1046275 ?auto_1046274 )
      ( MAKE-6CRATE-VERIFY ?auto_1046270 ?auto_1046271 ?auto_1046272 ?auto_1046269 ?auto_1046273 ?auto_1046275 ?auto_1046274 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1046314 - SURFACE
      ?auto_1046315 - SURFACE
      ?auto_1046316 - SURFACE
      ?auto_1046313 - SURFACE
      ?auto_1046317 - SURFACE
      ?auto_1046319 - SURFACE
      ?auto_1046318 - SURFACE
    )
    :vars
    (
      ?auto_1046321 - HOIST
      ?auto_1046322 - PLACE
      ?auto_1046320 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1046321 ?auto_1046322 ) ( SURFACE-AT ?auto_1046319 ?auto_1046322 ) ( CLEAR ?auto_1046319 ) ( IS-CRATE ?auto_1046318 ) ( not ( = ?auto_1046319 ?auto_1046318 ) ) ( TRUCK-AT ?auto_1046320 ?auto_1046322 ) ( AVAILABLE ?auto_1046321 ) ( IN ?auto_1046318 ?auto_1046320 ) ( ON ?auto_1046319 ?auto_1046317 ) ( not ( = ?auto_1046317 ?auto_1046319 ) ) ( not ( = ?auto_1046317 ?auto_1046318 ) ) ( ON ?auto_1046315 ?auto_1046314 ) ( ON ?auto_1046316 ?auto_1046315 ) ( ON ?auto_1046313 ?auto_1046316 ) ( ON ?auto_1046317 ?auto_1046313 ) ( not ( = ?auto_1046314 ?auto_1046315 ) ) ( not ( = ?auto_1046314 ?auto_1046316 ) ) ( not ( = ?auto_1046314 ?auto_1046313 ) ) ( not ( = ?auto_1046314 ?auto_1046317 ) ) ( not ( = ?auto_1046314 ?auto_1046319 ) ) ( not ( = ?auto_1046314 ?auto_1046318 ) ) ( not ( = ?auto_1046315 ?auto_1046316 ) ) ( not ( = ?auto_1046315 ?auto_1046313 ) ) ( not ( = ?auto_1046315 ?auto_1046317 ) ) ( not ( = ?auto_1046315 ?auto_1046319 ) ) ( not ( = ?auto_1046315 ?auto_1046318 ) ) ( not ( = ?auto_1046316 ?auto_1046313 ) ) ( not ( = ?auto_1046316 ?auto_1046317 ) ) ( not ( = ?auto_1046316 ?auto_1046319 ) ) ( not ( = ?auto_1046316 ?auto_1046318 ) ) ( not ( = ?auto_1046313 ?auto_1046317 ) ) ( not ( = ?auto_1046313 ?auto_1046319 ) ) ( not ( = ?auto_1046313 ?auto_1046318 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1046317 ?auto_1046319 ?auto_1046318 )
      ( MAKE-6CRATE-VERIFY ?auto_1046314 ?auto_1046315 ?auto_1046316 ?auto_1046313 ?auto_1046317 ?auto_1046319 ?auto_1046318 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1046365 - SURFACE
      ?auto_1046366 - SURFACE
      ?auto_1046367 - SURFACE
      ?auto_1046364 - SURFACE
      ?auto_1046368 - SURFACE
      ?auto_1046370 - SURFACE
      ?auto_1046369 - SURFACE
    )
    :vars
    (
      ?auto_1046373 - HOIST
      ?auto_1046372 - PLACE
      ?auto_1046374 - TRUCK
      ?auto_1046371 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1046373 ?auto_1046372 ) ( SURFACE-AT ?auto_1046370 ?auto_1046372 ) ( CLEAR ?auto_1046370 ) ( IS-CRATE ?auto_1046369 ) ( not ( = ?auto_1046370 ?auto_1046369 ) ) ( AVAILABLE ?auto_1046373 ) ( IN ?auto_1046369 ?auto_1046374 ) ( ON ?auto_1046370 ?auto_1046368 ) ( not ( = ?auto_1046368 ?auto_1046370 ) ) ( not ( = ?auto_1046368 ?auto_1046369 ) ) ( TRUCK-AT ?auto_1046374 ?auto_1046371 ) ( not ( = ?auto_1046371 ?auto_1046372 ) ) ( ON ?auto_1046366 ?auto_1046365 ) ( ON ?auto_1046367 ?auto_1046366 ) ( ON ?auto_1046364 ?auto_1046367 ) ( ON ?auto_1046368 ?auto_1046364 ) ( not ( = ?auto_1046365 ?auto_1046366 ) ) ( not ( = ?auto_1046365 ?auto_1046367 ) ) ( not ( = ?auto_1046365 ?auto_1046364 ) ) ( not ( = ?auto_1046365 ?auto_1046368 ) ) ( not ( = ?auto_1046365 ?auto_1046370 ) ) ( not ( = ?auto_1046365 ?auto_1046369 ) ) ( not ( = ?auto_1046366 ?auto_1046367 ) ) ( not ( = ?auto_1046366 ?auto_1046364 ) ) ( not ( = ?auto_1046366 ?auto_1046368 ) ) ( not ( = ?auto_1046366 ?auto_1046370 ) ) ( not ( = ?auto_1046366 ?auto_1046369 ) ) ( not ( = ?auto_1046367 ?auto_1046364 ) ) ( not ( = ?auto_1046367 ?auto_1046368 ) ) ( not ( = ?auto_1046367 ?auto_1046370 ) ) ( not ( = ?auto_1046367 ?auto_1046369 ) ) ( not ( = ?auto_1046364 ?auto_1046368 ) ) ( not ( = ?auto_1046364 ?auto_1046370 ) ) ( not ( = ?auto_1046364 ?auto_1046369 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1046368 ?auto_1046370 ?auto_1046369 )
      ( MAKE-6CRATE-VERIFY ?auto_1046365 ?auto_1046366 ?auto_1046367 ?auto_1046364 ?auto_1046368 ?auto_1046370 ?auto_1046369 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1046422 - SURFACE
      ?auto_1046423 - SURFACE
      ?auto_1046424 - SURFACE
      ?auto_1046421 - SURFACE
      ?auto_1046425 - SURFACE
      ?auto_1046427 - SURFACE
      ?auto_1046426 - SURFACE
    )
    :vars
    (
      ?auto_1046431 - HOIST
      ?auto_1046432 - PLACE
      ?auto_1046429 - TRUCK
      ?auto_1046430 - PLACE
      ?auto_1046428 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1046431 ?auto_1046432 ) ( SURFACE-AT ?auto_1046427 ?auto_1046432 ) ( CLEAR ?auto_1046427 ) ( IS-CRATE ?auto_1046426 ) ( not ( = ?auto_1046427 ?auto_1046426 ) ) ( AVAILABLE ?auto_1046431 ) ( ON ?auto_1046427 ?auto_1046425 ) ( not ( = ?auto_1046425 ?auto_1046427 ) ) ( not ( = ?auto_1046425 ?auto_1046426 ) ) ( TRUCK-AT ?auto_1046429 ?auto_1046430 ) ( not ( = ?auto_1046430 ?auto_1046432 ) ) ( HOIST-AT ?auto_1046428 ?auto_1046430 ) ( LIFTING ?auto_1046428 ?auto_1046426 ) ( not ( = ?auto_1046431 ?auto_1046428 ) ) ( ON ?auto_1046423 ?auto_1046422 ) ( ON ?auto_1046424 ?auto_1046423 ) ( ON ?auto_1046421 ?auto_1046424 ) ( ON ?auto_1046425 ?auto_1046421 ) ( not ( = ?auto_1046422 ?auto_1046423 ) ) ( not ( = ?auto_1046422 ?auto_1046424 ) ) ( not ( = ?auto_1046422 ?auto_1046421 ) ) ( not ( = ?auto_1046422 ?auto_1046425 ) ) ( not ( = ?auto_1046422 ?auto_1046427 ) ) ( not ( = ?auto_1046422 ?auto_1046426 ) ) ( not ( = ?auto_1046423 ?auto_1046424 ) ) ( not ( = ?auto_1046423 ?auto_1046421 ) ) ( not ( = ?auto_1046423 ?auto_1046425 ) ) ( not ( = ?auto_1046423 ?auto_1046427 ) ) ( not ( = ?auto_1046423 ?auto_1046426 ) ) ( not ( = ?auto_1046424 ?auto_1046421 ) ) ( not ( = ?auto_1046424 ?auto_1046425 ) ) ( not ( = ?auto_1046424 ?auto_1046427 ) ) ( not ( = ?auto_1046424 ?auto_1046426 ) ) ( not ( = ?auto_1046421 ?auto_1046425 ) ) ( not ( = ?auto_1046421 ?auto_1046427 ) ) ( not ( = ?auto_1046421 ?auto_1046426 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1046425 ?auto_1046427 ?auto_1046426 )
      ( MAKE-6CRATE-VERIFY ?auto_1046422 ?auto_1046423 ?auto_1046424 ?auto_1046421 ?auto_1046425 ?auto_1046427 ?auto_1046426 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1046485 - SURFACE
      ?auto_1046486 - SURFACE
      ?auto_1046487 - SURFACE
      ?auto_1046484 - SURFACE
      ?auto_1046488 - SURFACE
      ?auto_1046490 - SURFACE
      ?auto_1046489 - SURFACE
    )
    :vars
    (
      ?auto_1046496 - HOIST
      ?auto_1046494 - PLACE
      ?auto_1046495 - TRUCK
      ?auto_1046493 - PLACE
      ?auto_1046491 - HOIST
      ?auto_1046492 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1046496 ?auto_1046494 ) ( SURFACE-AT ?auto_1046490 ?auto_1046494 ) ( CLEAR ?auto_1046490 ) ( IS-CRATE ?auto_1046489 ) ( not ( = ?auto_1046490 ?auto_1046489 ) ) ( AVAILABLE ?auto_1046496 ) ( ON ?auto_1046490 ?auto_1046488 ) ( not ( = ?auto_1046488 ?auto_1046490 ) ) ( not ( = ?auto_1046488 ?auto_1046489 ) ) ( TRUCK-AT ?auto_1046495 ?auto_1046493 ) ( not ( = ?auto_1046493 ?auto_1046494 ) ) ( HOIST-AT ?auto_1046491 ?auto_1046493 ) ( not ( = ?auto_1046496 ?auto_1046491 ) ) ( AVAILABLE ?auto_1046491 ) ( SURFACE-AT ?auto_1046489 ?auto_1046493 ) ( ON ?auto_1046489 ?auto_1046492 ) ( CLEAR ?auto_1046489 ) ( not ( = ?auto_1046490 ?auto_1046492 ) ) ( not ( = ?auto_1046489 ?auto_1046492 ) ) ( not ( = ?auto_1046488 ?auto_1046492 ) ) ( ON ?auto_1046486 ?auto_1046485 ) ( ON ?auto_1046487 ?auto_1046486 ) ( ON ?auto_1046484 ?auto_1046487 ) ( ON ?auto_1046488 ?auto_1046484 ) ( not ( = ?auto_1046485 ?auto_1046486 ) ) ( not ( = ?auto_1046485 ?auto_1046487 ) ) ( not ( = ?auto_1046485 ?auto_1046484 ) ) ( not ( = ?auto_1046485 ?auto_1046488 ) ) ( not ( = ?auto_1046485 ?auto_1046490 ) ) ( not ( = ?auto_1046485 ?auto_1046489 ) ) ( not ( = ?auto_1046485 ?auto_1046492 ) ) ( not ( = ?auto_1046486 ?auto_1046487 ) ) ( not ( = ?auto_1046486 ?auto_1046484 ) ) ( not ( = ?auto_1046486 ?auto_1046488 ) ) ( not ( = ?auto_1046486 ?auto_1046490 ) ) ( not ( = ?auto_1046486 ?auto_1046489 ) ) ( not ( = ?auto_1046486 ?auto_1046492 ) ) ( not ( = ?auto_1046487 ?auto_1046484 ) ) ( not ( = ?auto_1046487 ?auto_1046488 ) ) ( not ( = ?auto_1046487 ?auto_1046490 ) ) ( not ( = ?auto_1046487 ?auto_1046489 ) ) ( not ( = ?auto_1046487 ?auto_1046492 ) ) ( not ( = ?auto_1046484 ?auto_1046488 ) ) ( not ( = ?auto_1046484 ?auto_1046490 ) ) ( not ( = ?auto_1046484 ?auto_1046489 ) ) ( not ( = ?auto_1046484 ?auto_1046492 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1046488 ?auto_1046490 ?auto_1046489 )
      ( MAKE-6CRATE-VERIFY ?auto_1046485 ?auto_1046486 ?auto_1046487 ?auto_1046484 ?auto_1046488 ?auto_1046490 ?auto_1046489 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1046549 - SURFACE
      ?auto_1046550 - SURFACE
      ?auto_1046551 - SURFACE
      ?auto_1046548 - SURFACE
      ?auto_1046552 - SURFACE
      ?auto_1046554 - SURFACE
      ?auto_1046553 - SURFACE
    )
    :vars
    (
      ?auto_1046555 - HOIST
      ?auto_1046560 - PLACE
      ?auto_1046558 - PLACE
      ?auto_1046559 - HOIST
      ?auto_1046556 - SURFACE
      ?auto_1046557 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1046555 ?auto_1046560 ) ( SURFACE-AT ?auto_1046554 ?auto_1046560 ) ( CLEAR ?auto_1046554 ) ( IS-CRATE ?auto_1046553 ) ( not ( = ?auto_1046554 ?auto_1046553 ) ) ( AVAILABLE ?auto_1046555 ) ( ON ?auto_1046554 ?auto_1046552 ) ( not ( = ?auto_1046552 ?auto_1046554 ) ) ( not ( = ?auto_1046552 ?auto_1046553 ) ) ( not ( = ?auto_1046558 ?auto_1046560 ) ) ( HOIST-AT ?auto_1046559 ?auto_1046558 ) ( not ( = ?auto_1046555 ?auto_1046559 ) ) ( AVAILABLE ?auto_1046559 ) ( SURFACE-AT ?auto_1046553 ?auto_1046558 ) ( ON ?auto_1046553 ?auto_1046556 ) ( CLEAR ?auto_1046553 ) ( not ( = ?auto_1046554 ?auto_1046556 ) ) ( not ( = ?auto_1046553 ?auto_1046556 ) ) ( not ( = ?auto_1046552 ?auto_1046556 ) ) ( TRUCK-AT ?auto_1046557 ?auto_1046560 ) ( ON ?auto_1046550 ?auto_1046549 ) ( ON ?auto_1046551 ?auto_1046550 ) ( ON ?auto_1046548 ?auto_1046551 ) ( ON ?auto_1046552 ?auto_1046548 ) ( not ( = ?auto_1046549 ?auto_1046550 ) ) ( not ( = ?auto_1046549 ?auto_1046551 ) ) ( not ( = ?auto_1046549 ?auto_1046548 ) ) ( not ( = ?auto_1046549 ?auto_1046552 ) ) ( not ( = ?auto_1046549 ?auto_1046554 ) ) ( not ( = ?auto_1046549 ?auto_1046553 ) ) ( not ( = ?auto_1046549 ?auto_1046556 ) ) ( not ( = ?auto_1046550 ?auto_1046551 ) ) ( not ( = ?auto_1046550 ?auto_1046548 ) ) ( not ( = ?auto_1046550 ?auto_1046552 ) ) ( not ( = ?auto_1046550 ?auto_1046554 ) ) ( not ( = ?auto_1046550 ?auto_1046553 ) ) ( not ( = ?auto_1046550 ?auto_1046556 ) ) ( not ( = ?auto_1046551 ?auto_1046548 ) ) ( not ( = ?auto_1046551 ?auto_1046552 ) ) ( not ( = ?auto_1046551 ?auto_1046554 ) ) ( not ( = ?auto_1046551 ?auto_1046553 ) ) ( not ( = ?auto_1046551 ?auto_1046556 ) ) ( not ( = ?auto_1046548 ?auto_1046552 ) ) ( not ( = ?auto_1046548 ?auto_1046554 ) ) ( not ( = ?auto_1046548 ?auto_1046553 ) ) ( not ( = ?auto_1046548 ?auto_1046556 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1046552 ?auto_1046554 ?auto_1046553 )
      ( MAKE-6CRATE-VERIFY ?auto_1046549 ?auto_1046550 ?auto_1046551 ?auto_1046548 ?auto_1046552 ?auto_1046554 ?auto_1046553 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1046613 - SURFACE
      ?auto_1046614 - SURFACE
      ?auto_1046615 - SURFACE
      ?auto_1046612 - SURFACE
      ?auto_1046616 - SURFACE
      ?auto_1046618 - SURFACE
      ?auto_1046617 - SURFACE
    )
    :vars
    (
      ?auto_1046620 - HOIST
      ?auto_1046619 - PLACE
      ?auto_1046621 - PLACE
      ?auto_1046624 - HOIST
      ?auto_1046623 - SURFACE
      ?auto_1046622 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1046620 ?auto_1046619 ) ( IS-CRATE ?auto_1046617 ) ( not ( = ?auto_1046618 ?auto_1046617 ) ) ( not ( = ?auto_1046616 ?auto_1046618 ) ) ( not ( = ?auto_1046616 ?auto_1046617 ) ) ( not ( = ?auto_1046621 ?auto_1046619 ) ) ( HOIST-AT ?auto_1046624 ?auto_1046621 ) ( not ( = ?auto_1046620 ?auto_1046624 ) ) ( AVAILABLE ?auto_1046624 ) ( SURFACE-AT ?auto_1046617 ?auto_1046621 ) ( ON ?auto_1046617 ?auto_1046623 ) ( CLEAR ?auto_1046617 ) ( not ( = ?auto_1046618 ?auto_1046623 ) ) ( not ( = ?auto_1046617 ?auto_1046623 ) ) ( not ( = ?auto_1046616 ?auto_1046623 ) ) ( TRUCK-AT ?auto_1046622 ?auto_1046619 ) ( SURFACE-AT ?auto_1046616 ?auto_1046619 ) ( CLEAR ?auto_1046616 ) ( LIFTING ?auto_1046620 ?auto_1046618 ) ( IS-CRATE ?auto_1046618 ) ( ON ?auto_1046614 ?auto_1046613 ) ( ON ?auto_1046615 ?auto_1046614 ) ( ON ?auto_1046612 ?auto_1046615 ) ( ON ?auto_1046616 ?auto_1046612 ) ( not ( = ?auto_1046613 ?auto_1046614 ) ) ( not ( = ?auto_1046613 ?auto_1046615 ) ) ( not ( = ?auto_1046613 ?auto_1046612 ) ) ( not ( = ?auto_1046613 ?auto_1046616 ) ) ( not ( = ?auto_1046613 ?auto_1046618 ) ) ( not ( = ?auto_1046613 ?auto_1046617 ) ) ( not ( = ?auto_1046613 ?auto_1046623 ) ) ( not ( = ?auto_1046614 ?auto_1046615 ) ) ( not ( = ?auto_1046614 ?auto_1046612 ) ) ( not ( = ?auto_1046614 ?auto_1046616 ) ) ( not ( = ?auto_1046614 ?auto_1046618 ) ) ( not ( = ?auto_1046614 ?auto_1046617 ) ) ( not ( = ?auto_1046614 ?auto_1046623 ) ) ( not ( = ?auto_1046615 ?auto_1046612 ) ) ( not ( = ?auto_1046615 ?auto_1046616 ) ) ( not ( = ?auto_1046615 ?auto_1046618 ) ) ( not ( = ?auto_1046615 ?auto_1046617 ) ) ( not ( = ?auto_1046615 ?auto_1046623 ) ) ( not ( = ?auto_1046612 ?auto_1046616 ) ) ( not ( = ?auto_1046612 ?auto_1046618 ) ) ( not ( = ?auto_1046612 ?auto_1046617 ) ) ( not ( = ?auto_1046612 ?auto_1046623 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1046616 ?auto_1046618 ?auto_1046617 )
      ( MAKE-6CRATE-VERIFY ?auto_1046613 ?auto_1046614 ?auto_1046615 ?auto_1046612 ?auto_1046616 ?auto_1046618 ?auto_1046617 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1046677 - SURFACE
      ?auto_1046678 - SURFACE
      ?auto_1046679 - SURFACE
      ?auto_1046676 - SURFACE
      ?auto_1046680 - SURFACE
      ?auto_1046682 - SURFACE
      ?auto_1046681 - SURFACE
    )
    :vars
    (
      ?auto_1046685 - HOIST
      ?auto_1046684 - PLACE
      ?auto_1046688 - PLACE
      ?auto_1046686 - HOIST
      ?auto_1046683 - SURFACE
      ?auto_1046687 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1046685 ?auto_1046684 ) ( IS-CRATE ?auto_1046681 ) ( not ( = ?auto_1046682 ?auto_1046681 ) ) ( not ( = ?auto_1046680 ?auto_1046682 ) ) ( not ( = ?auto_1046680 ?auto_1046681 ) ) ( not ( = ?auto_1046688 ?auto_1046684 ) ) ( HOIST-AT ?auto_1046686 ?auto_1046688 ) ( not ( = ?auto_1046685 ?auto_1046686 ) ) ( AVAILABLE ?auto_1046686 ) ( SURFACE-AT ?auto_1046681 ?auto_1046688 ) ( ON ?auto_1046681 ?auto_1046683 ) ( CLEAR ?auto_1046681 ) ( not ( = ?auto_1046682 ?auto_1046683 ) ) ( not ( = ?auto_1046681 ?auto_1046683 ) ) ( not ( = ?auto_1046680 ?auto_1046683 ) ) ( TRUCK-AT ?auto_1046687 ?auto_1046684 ) ( SURFACE-AT ?auto_1046680 ?auto_1046684 ) ( CLEAR ?auto_1046680 ) ( IS-CRATE ?auto_1046682 ) ( AVAILABLE ?auto_1046685 ) ( IN ?auto_1046682 ?auto_1046687 ) ( ON ?auto_1046678 ?auto_1046677 ) ( ON ?auto_1046679 ?auto_1046678 ) ( ON ?auto_1046676 ?auto_1046679 ) ( ON ?auto_1046680 ?auto_1046676 ) ( not ( = ?auto_1046677 ?auto_1046678 ) ) ( not ( = ?auto_1046677 ?auto_1046679 ) ) ( not ( = ?auto_1046677 ?auto_1046676 ) ) ( not ( = ?auto_1046677 ?auto_1046680 ) ) ( not ( = ?auto_1046677 ?auto_1046682 ) ) ( not ( = ?auto_1046677 ?auto_1046681 ) ) ( not ( = ?auto_1046677 ?auto_1046683 ) ) ( not ( = ?auto_1046678 ?auto_1046679 ) ) ( not ( = ?auto_1046678 ?auto_1046676 ) ) ( not ( = ?auto_1046678 ?auto_1046680 ) ) ( not ( = ?auto_1046678 ?auto_1046682 ) ) ( not ( = ?auto_1046678 ?auto_1046681 ) ) ( not ( = ?auto_1046678 ?auto_1046683 ) ) ( not ( = ?auto_1046679 ?auto_1046676 ) ) ( not ( = ?auto_1046679 ?auto_1046680 ) ) ( not ( = ?auto_1046679 ?auto_1046682 ) ) ( not ( = ?auto_1046679 ?auto_1046681 ) ) ( not ( = ?auto_1046679 ?auto_1046683 ) ) ( not ( = ?auto_1046676 ?auto_1046680 ) ) ( not ( = ?auto_1046676 ?auto_1046682 ) ) ( not ( = ?auto_1046676 ?auto_1046681 ) ) ( not ( = ?auto_1046676 ?auto_1046683 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1046680 ?auto_1046682 ?auto_1046681 )
      ( MAKE-6CRATE-VERIFY ?auto_1046677 ?auto_1046678 ?auto_1046679 ?auto_1046676 ?auto_1046680 ?auto_1046682 ?auto_1046681 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1048633 - SURFACE
      ?auto_1048634 - SURFACE
      ?auto_1048635 - SURFACE
      ?auto_1048632 - SURFACE
      ?auto_1048636 - SURFACE
      ?auto_1048638 - SURFACE
      ?auto_1048637 - SURFACE
      ?auto_1048639 - SURFACE
    )
    :vars
    (
      ?auto_1048640 - HOIST
      ?auto_1048641 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1048640 ?auto_1048641 ) ( SURFACE-AT ?auto_1048637 ?auto_1048641 ) ( CLEAR ?auto_1048637 ) ( LIFTING ?auto_1048640 ?auto_1048639 ) ( IS-CRATE ?auto_1048639 ) ( not ( = ?auto_1048637 ?auto_1048639 ) ) ( ON ?auto_1048634 ?auto_1048633 ) ( ON ?auto_1048635 ?auto_1048634 ) ( ON ?auto_1048632 ?auto_1048635 ) ( ON ?auto_1048636 ?auto_1048632 ) ( ON ?auto_1048638 ?auto_1048636 ) ( ON ?auto_1048637 ?auto_1048638 ) ( not ( = ?auto_1048633 ?auto_1048634 ) ) ( not ( = ?auto_1048633 ?auto_1048635 ) ) ( not ( = ?auto_1048633 ?auto_1048632 ) ) ( not ( = ?auto_1048633 ?auto_1048636 ) ) ( not ( = ?auto_1048633 ?auto_1048638 ) ) ( not ( = ?auto_1048633 ?auto_1048637 ) ) ( not ( = ?auto_1048633 ?auto_1048639 ) ) ( not ( = ?auto_1048634 ?auto_1048635 ) ) ( not ( = ?auto_1048634 ?auto_1048632 ) ) ( not ( = ?auto_1048634 ?auto_1048636 ) ) ( not ( = ?auto_1048634 ?auto_1048638 ) ) ( not ( = ?auto_1048634 ?auto_1048637 ) ) ( not ( = ?auto_1048634 ?auto_1048639 ) ) ( not ( = ?auto_1048635 ?auto_1048632 ) ) ( not ( = ?auto_1048635 ?auto_1048636 ) ) ( not ( = ?auto_1048635 ?auto_1048638 ) ) ( not ( = ?auto_1048635 ?auto_1048637 ) ) ( not ( = ?auto_1048635 ?auto_1048639 ) ) ( not ( = ?auto_1048632 ?auto_1048636 ) ) ( not ( = ?auto_1048632 ?auto_1048638 ) ) ( not ( = ?auto_1048632 ?auto_1048637 ) ) ( not ( = ?auto_1048632 ?auto_1048639 ) ) ( not ( = ?auto_1048636 ?auto_1048638 ) ) ( not ( = ?auto_1048636 ?auto_1048637 ) ) ( not ( = ?auto_1048636 ?auto_1048639 ) ) ( not ( = ?auto_1048638 ?auto_1048637 ) ) ( not ( = ?auto_1048638 ?auto_1048639 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1048637 ?auto_1048639 )
      ( MAKE-7CRATE-VERIFY ?auto_1048633 ?auto_1048634 ?auto_1048635 ?auto_1048632 ?auto_1048636 ?auto_1048638 ?auto_1048637 ?auto_1048639 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1048688 - SURFACE
      ?auto_1048689 - SURFACE
      ?auto_1048690 - SURFACE
      ?auto_1048687 - SURFACE
      ?auto_1048691 - SURFACE
      ?auto_1048693 - SURFACE
      ?auto_1048692 - SURFACE
      ?auto_1048694 - SURFACE
    )
    :vars
    (
      ?auto_1048697 - HOIST
      ?auto_1048696 - PLACE
      ?auto_1048695 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1048697 ?auto_1048696 ) ( SURFACE-AT ?auto_1048692 ?auto_1048696 ) ( CLEAR ?auto_1048692 ) ( IS-CRATE ?auto_1048694 ) ( not ( = ?auto_1048692 ?auto_1048694 ) ) ( TRUCK-AT ?auto_1048695 ?auto_1048696 ) ( AVAILABLE ?auto_1048697 ) ( IN ?auto_1048694 ?auto_1048695 ) ( ON ?auto_1048692 ?auto_1048693 ) ( not ( = ?auto_1048693 ?auto_1048692 ) ) ( not ( = ?auto_1048693 ?auto_1048694 ) ) ( ON ?auto_1048689 ?auto_1048688 ) ( ON ?auto_1048690 ?auto_1048689 ) ( ON ?auto_1048687 ?auto_1048690 ) ( ON ?auto_1048691 ?auto_1048687 ) ( ON ?auto_1048693 ?auto_1048691 ) ( not ( = ?auto_1048688 ?auto_1048689 ) ) ( not ( = ?auto_1048688 ?auto_1048690 ) ) ( not ( = ?auto_1048688 ?auto_1048687 ) ) ( not ( = ?auto_1048688 ?auto_1048691 ) ) ( not ( = ?auto_1048688 ?auto_1048693 ) ) ( not ( = ?auto_1048688 ?auto_1048692 ) ) ( not ( = ?auto_1048688 ?auto_1048694 ) ) ( not ( = ?auto_1048689 ?auto_1048690 ) ) ( not ( = ?auto_1048689 ?auto_1048687 ) ) ( not ( = ?auto_1048689 ?auto_1048691 ) ) ( not ( = ?auto_1048689 ?auto_1048693 ) ) ( not ( = ?auto_1048689 ?auto_1048692 ) ) ( not ( = ?auto_1048689 ?auto_1048694 ) ) ( not ( = ?auto_1048690 ?auto_1048687 ) ) ( not ( = ?auto_1048690 ?auto_1048691 ) ) ( not ( = ?auto_1048690 ?auto_1048693 ) ) ( not ( = ?auto_1048690 ?auto_1048692 ) ) ( not ( = ?auto_1048690 ?auto_1048694 ) ) ( not ( = ?auto_1048687 ?auto_1048691 ) ) ( not ( = ?auto_1048687 ?auto_1048693 ) ) ( not ( = ?auto_1048687 ?auto_1048692 ) ) ( not ( = ?auto_1048687 ?auto_1048694 ) ) ( not ( = ?auto_1048691 ?auto_1048693 ) ) ( not ( = ?auto_1048691 ?auto_1048692 ) ) ( not ( = ?auto_1048691 ?auto_1048694 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1048693 ?auto_1048692 ?auto_1048694 )
      ( MAKE-7CRATE-VERIFY ?auto_1048688 ?auto_1048689 ?auto_1048690 ?auto_1048687 ?auto_1048691 ?auto_1048693 ?auto_1048692 ?auto_1048694 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1048751 - SURFACE
      ?auto_1048752 - SURFACE
      ?auto_1048753 - SURFACE
      ?auto_1048750 - SURFACE
      ?auto_1048754 - SURFACE
      ?auto_1048756 - SURFACE
      ?auto_1048755 - SURFACE
      ?auto_1048757 - SURFACE
    )
    :vars
    (
      ?auto_1048761 - HOIST
      ?auto_1048760 - PLACE
      ?auto_1048759 - TRUCK
      ?auto_1048758 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1048761 ?auto_1048760 ) ( SURFACE-AT ?auto_1048755 ?auto_1048760 ) ( CLEAR ?auto_1048755 ) ( IS-CRATE ?auto_1048757 ) ( not ( = ?auto_1048755 ?auto_1048757 ) ) ( AVAILABLE ?auto_1048761 ) ( IN ?auto_1048757 ?auto_1048759 ) ( ON ?auto_1048755 ?auto_1048756 ) ( not ( = ?auto_1048756 ?auto_1048755 ) ) ( not ( = ?auto_1048756 ?auto_1048757 ) ) ( TRUCK-AT ?auto_1048759 ?auto_1048758 ) ( not ( = ?auto_1048758 ?auto_1048760 ) ) ( ON ?auto_1048752 ?auto_1048751 ) ( ON ?auto_1048753 ?auto_1048752 ) ( ON ?auto_1048750 ?auto_1048753 ) ( ON ?auto_1048754 ?auto_1048750 ) ( ON ?auto_1048756 ?auto_1048754 ) ( not ( = ?auto_1048751 ?auto_1048752 ) ) ( not ( = ?auto_1048751 ?auto_1048753 ) ) ( not ( = ?auto_1048751 ?auto_1048750 ) ) ( not ( = ?auto_1048751 ?auto_1048754 ) ) ( not ( = ?auto_1048751 ?auto_1048756 ) ) ( not ( = ?auto_1048751 ?auto_1048755 ) ) ( not ( = ?auto_1048751 ?auto_1048757 ) ) ( not ( = ?auto_1048752 ?auto_1048753 ) ) ( not ( = ?auto_1048752 ?auto_1048750 ) ) ( not ( = ?auto_1048752 ?auto_1048754 ) ) ( not ( = ?auto_1048752 ?auto_1048756 ) ) ( not ( = ?auto_1048752 ?auto_1048755 ) ) ( not ( = ?auto_1048752 ?auto_1048757 ) ) ( not ( = ?auto_1048753 ?auto_1048750 ) ) ( not ( = ?auto_1048753 ?auto_1048754 ) ) ( not ( = ?auto_1048753 ?auto_1048756 ) ) ( not ( = ?auto_1048753 ?auto_1048755 ) ) ( not ( = ?auto_1048753 ?auto_1048757 ) ) ( not ( = ?auto_1048750 ?auto_1048754 ) ) ( not ( = ?auto_1048750 ?auto_1048756 ) ) ( not ( = ?auto_1048750 ?auto_1048755 ) ) ( not ( = ?auto_1048750 ?auto_1048757 ) ) ( not ( = ?auto_1048754 ?auto_1048756 ) ) ( not ( = ?auto_1048754 ?auto_1048755 ) ) ( not ( = ?auto_1048754 ?auto_1048757 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1048756 ?auto_1048755 ?auto_1048757 )
      ( MAKE-7CRATE-VERIFY ?auto_1048751 ?auto_1048752 ?auto_1048753 ?auto_1048750 ?auto_1048754 ?auto_1048756 ?auto_1048755 ?auto_1048757 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1048821 - SURFACE
      ?auto_1048822 - SURFACE
      ?auto_1048823 - SURFACE
      ?auto_1048820 - SURFACE
      ?auto_1048824 - SURFACE
      ?auto_1048826 - SURFACE
      ?auto_1048825 - SURFACE
      ?auto_1048827 - SURFACE
    )
    :vars
    (
      ?auto_1048828 - HOIST
      ?auto_1048829 - PLACE
      ?auto_1048830 - TRUCK
      ?auto_1048832 - PLACE
      ?auto_1048831 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1048828 ?auto_1048829 ) ( SURFACE-AT ?auto_1048825 ?auto_1048829 ) ( CLEAR ?auto_1048825 ) ( IS-CRATE ?auto_1048827 ) ( not ( = ?auto_1048825 ?auto_1048827 ) ) ( AVAILABLE ?auto_1048828 ) ( ON ?auto_1048825 ?auto_1048826 ) ( not ( = ?auto_1048826 ?auto_1048825 ) ) ( not ( = ?auto_1048826 ?auto_1048827 ) ) ( TRUCK-AT ?auto_1048830 ?auto_1048832 ) ( not ( = ?auto_1048832 ?auto_1048829 ) ) ( HOIST-AT ?auto_1048831 ?auto_1048832 ) ( LIFTING ?auto_1048831 ?auto_1048827 ) ( not ( = ?auto_1048828 ?auto_1048831 ) ) ( ON ?auto_1048822 ?auto_1048821 ) ( ON ?auto_1048823 ?auto_1048822 ) ( ON ?auto_1048820 ?auto_1048823 ) ( ON ?auto_1048824 ?auto_1048820 ) ( ON ?auto_1048826 ?auto_1048824 ) ( not ( = ?auto_1048821 ?auto_1048822 ) ) ( not ( = ?auto_1048821 ?auto_1048823 ) ) ( not ( = ?auto_1048821 ?auto_1048820 ) ) ( not ( = ?auto_1048821 ?auto_1048824 ) ) ( not ( = ?auto_1048821 ?auto_1048826 ) ) ( not ( = ?auto_1048821 ?auto_1048825 ) ) ( not ( = ?auto_1048821 ?auto_1048827 ) ) ( not ( = ?auto_1048822 ?auto_1048823 ) ) ( not ( = ?auto_1048822 ?auto_1048820 ) ) ( not ( = ?auto_1048822 ?auto_1048824 ) ) ( not ( = ?auto_1048822 ?auto_1048826 ) ) ( not ( = ?auto_1048822 ?auto_1048825 ) ) ( not ( = ?auto_1048822 ?auto_1048827 ) ) ( not ( = ?auto_1048823 ?auto_1048820 ) ) ( not ( = ?auto_1048823 ?auto_1048824 ) ) ( not ( = ?auto_1048823 ?auto_1048826 ) ) ( not ( = ?auto_1048823 ?auto_1048825 ) ) ( not ( = ?auto_1048823 ?auto_1048827 ) ) ( not ( = ?auto_1048820 ?auto_1048824 ) ) ( not ( = ?auto_1048820 ?auto_1048826 ) ) ( not ( = ?auto_1048820 ?auto_1048825 ) ) ( not ( = ?auto_1048820 ?auto_1048827 ) ) ( not ( = ?auto_1048824 ?auto_1048826 ) ) ( not ( = ?auto_1048824 ?auto_1048825 ) ) ( not ( = ?auto_1048824 ?auto_1048827 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1048826 ?auto_1048825 ?auto_1048827 )
      ( MAKE-7CRATE-VERIFY ?auto_1048821 ?auto_1048822 ?auto_1048823 ?auto_1048820 ?auto_1048824 ?auto_1048826 ?auto_1048825 ?auto_1048827 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1048898 - SURFACE
      ?auto_1048899 - SURFACE
      ?auto_1048900 - SURFACE
      ?auto_1048897 - SURFACE
      ?auto_1048901 - SURFACE
      ?auto_1048903 - SURFACE
      ?auto_1048902 - SURFACE
      ?auto_1048904 - SURFACE
    )
    :vars
    (
      ?auto_1048910 - HOIST
      ?auto_1048908 - PLACE
      ?auto_1048909 - TRUCK
      ?auto_1048906 - PLACE
      ?auto_1048907 - HOIST
      ?auto_1048905 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1048910 ?auto_1048908 ) ( SURFACE-AT ?auto_1048902 ?auto_1048908 ) ( CLEAR ?auto_1048902 ) ( IS-CRATE ?auto_1048904 ) ( not ( = ?auto_1048902 ?auto_1048904 ) ) ( AVAILABLE ?auto_1048910 ) ( ON ?auto_1048902 ?auto_1048903 ) ( not ( = ?auto_1048903 ?auto_1048902 ) ) ( not ( = ?auto_1048903 ?auto_1048904 ) ) ( TRUCK-AT ?auto_1048909 ?auto_1048906 ) ( not ( = ?auto_1048906 ?auto_1048908 ) ) ( HOIST-AT ?auto_1048907 ?auto_1048906 ) ( not ( = ?auto_1048910 ?auto_1048907 ) ) ( AVAILABLE ?auto_1048907 ) ( SURFACE-AT ?auto_1048904 ?auto_1048906 ) ( ON ?auto_1048904 ?auto_1048905 ) ( CLEAR ?auto_1048904 ) ( not ( = ?auto_1048902 ?auto_1048905 ) ) ( not ( = ?auto_1048904 ?auto_1048905 ) ) ( not ( = ?auto_1048903 ?auto_1048905 ) ) ( ON ?auto_1048899 ?auto_1048898 ) ( ON ?auto_1048900 ?auto_1048899 ) ( ON ?auto_1048897 ?auto_1048900 ) ( ON ?auto_1048901 ?auto_1048897 ) ( ON ?auto_1048903 ?auto_1048901 ) ( not ( = ?auto_1048898 ?auto_1048899 ) ) ( not ( = ?auto_1048898 ?auto_1048900 ) ) ( not ( = ?auto_1048898 ?auto_1048897 ) ) ( not ( = ?auto_1048898 ?auto_1048901 ) ) ( not ( = ?auto_1048898 ?auto_1048903 ) ) ( not ( = ?auto_1048898 ?auto_1048902 ) ) ( not ( = ?auto_1048898 ?auto_1048904 ) ) ( not ( = ?auto_1048898 ?auto_1048905 ) ) ( not ( = ?auto_1048899 ?auto_1048900 ) ) ( not ( = ?auto_1048899 ?auto_1048897 ) ) ( not ( = ?auto_1048899 ?auto_1048901 ) ) ( not ( = ?auto_1048899 ?auto_1048903 ) ) ( not ( = ?auto_1048899 ?auto_1048902 ) ) ( not ( = ?auto_1048899 ?auto_1048904 ) ) ( not ( = ?auto_1048899 ?auto_1048905 ) ) ( not ( = ?auto_1048900 ?auto_1048897 ) ) ( not ( = ?auto_1048900 ?auto_1048901 ) ) ( not ( = ?auto_1048900 ?auto_1048903 ) ) ( not ( = ?auto_1048900 ?auto_1048902 ) ) ( not ( = ?auto_1048900 ?auto_1048904 ) ) ( not ( = ?auto_1048900 ?auto_1048905 ) ) ( not ( = ?auto_1048897 ?auto_1048901 ) ) ( not ( = ?auto_1048897 ?auto_1048903 ) ) ( not ( = ?auto_1048897 ?auto_1048902 ) ) ( not ( = ?auto_1048897 ?auto_1048904 ) ) ( not ( = ?auto_1048897 ?auto_1048905 ) ) ( not ( = ?auto_1048901 ?auto_1048903 ) ) ( not ( = ?auto_1048901 ?auto_1048902 ) ) ( not ( = ?auto_1048901 ?auto_1048904 ) ) ( not ( = ?auto_1048901 ?auto_1048905 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1048903 ?auto_1048902 ?auto_1048904 )
      ( MAKE-7CRATE-VERIFY ?auto_1048898 ?auto_1048899 ?auto_1048900 ?auto_1048897 ?auto_1048901 ?auto_1048903 ?auto_1048902 ?auto_1048904 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1048976 - SURFACE
      ?auto_1048977 - SURFACE
      ?auto_1048978 - SURFACE
      ?auto_1048975 - SURFACE
      ?auto_1048979 - SURFACE
      ?auto_1048981 - SURFACE
      ?auto_1048980 - SURFACE
      ?auto_1048982 - SURFACE
    )
    :vars
    (
      ?auto_1048985 - HOIST
      ?auto_1048987 - PLACE
      ?auto_1048988 - PLACE
      ?auto_1048983 - HOIST
      ?auto_1048984 - SURFACE
      ?auto_1048986 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1048985 ?auto_1048987 ) ( SURFACE-AT ?auto_1048980 ?auto_1048987 ) ( CLEAR ?auto_1048980 ) ( IS-CRATE ?auto_1048982 ) ( not ( = ?auto_1048980 ?auto_1048982 ) ) ( AVAILABLE ?auto_1048985 ) ( ON ?auto_1048980 ?auto_1048981 ) ( not ( = ?auto_1048981 ?auto_1048980 ) ) ( not ( = ?auto_1048981 ?auto_1048982 ) ) ( not ( = ?auto_1048988 ?auto_1048987 ) ) ( HOIST-AT ?auto_1048983 ?auto_1048988 ) ( not ( = ?auto_1048985 ?auto_1048983 ) ) ( AVAILABLE ?auto_1048983 ) ( SURFACE-AT ?auto_1048982 ?auto_1048988 ) ( ON ?auto_1048982 ?auto_1048984 ) ( CLEAR ?auto_1048982 ) ( not ( = ?auto_1048980 ?auto_1048984 ) ) ( not ( = ?auto_1048982 ?auto_1048984 ) ) ( not ( = ?auto_1048981 ?auto_1048984 ) ) ( TRUCK-AT ?auto_1048986 ?auto_1048987 ) ( ON ?auto_1048977 ?auto_1048976 ) ( ON ?auto_1048978 ?auto_1048977 ) ( ON ?auto_1048975 ?auto_1048978 ) ( ON ?auto_1048979 ?auto_1048975 ) ( ON ?auto_1048981 ?auto_1048979 ) ( not ( = ?auto_1048976 ?auto_1048977 ) ) ( not ( = ?auto_1048976 ?auto_1048978 ) ) ( not ( = ?auto_1048976 ?auto_1048975 ) ) ( not ( = ?auto_1048976 ?auto_1048979 ) ) ( not ( = ?auto_1048976 ?auto_1048981 ) ) ( not ( = ?auto_1048976 ?auto_1048980 ) ) ( not ( = ?auto_1048976 ?auto_1048982 ) ) ( not ( = ?auto_1048976 ?auto_1048984 ) ) ( not ( = ?auto_1048977 ?auto_1048978 ) ) ( not ( = ?auto_1048977 ?auto_1048975 ) ) ( not ( = ?auto_1048977 ?auto_1048979 ) ) ( not ( = ?auto_1048977 ?auto_1048981 ) ) ( not ( = ?auto_1048977 ?auto_1048980 ) ) ( not ( = ?auto_1048977 ?auto_1048982 ) ) ( not ( = ?auto_1048977 ?auto_1048984 ) ) ( not ( = ?auto_1048978 ?auto_1048975 ) ) ( not ( = ?auto_1048978 ?auto_1048979 ) ) ( not ( = ?auto_1048978 ?auto_1048981 ) ) ( not ( = ?auto_1048978 ?auto_1048980 ) ) ( not ( = ?auto_1048978 ?auto_1048982 ) ) ( not ( = ?auto_1048978 ?auto_1048984 ) ) ( not ( = ?auto_1048975 ?auto_1048979 ) ) ( not ( = ?auto_1048975 ?auto_1048981 ) ) ( not ( = ?auto_1048975 ?auto_1048980 ) ) ( not ( = ?auto_1048975 ?auto_1048982 ) ) ( not ( = ?auto_1048975 ?auto_1048984 ) ) ( not ( = ?auto_1048979 ?auto_1048981 ) ) ( not ( = ?auto_1048979 ?auto_1048980 ) ) ( not ( = ?auto_1048979 ?auto_1048982 ) ) ( not ( = ?auto_1048979 ?auto_1048984 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1048981 ?auto_1048980 ?auto_1048982 )
      ( MAKE-7CRATE-VERIFY ?auto_1048976 ?auto_1048977 ?auto_1048978 ?auto_1048975 ?auto_1048979 ?auto_1048981 ?auto_1048980 ?auto_1048982 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1049054 - SURFACE
      ?auto_1049055 - SURFACE
      ?auto_1049056 - SURFACE
      ?auto_1049053 - SURFACE
      ?auto_1049057 - SURFACE
      ?auto_1049059 - SURFACE
      ?auto_1049058 - SURFACE
      ?auto_1049060 - SURFACE
    )
    :vars
    (
      ?auto_1049066 - HOIST
      ?auto_1049065 - PLACE
      ?auto_1049063 - PLACE
      ?auto_1049062 - HOIST
      ?auto_1049064 - SURFACE
      ?auto_1049061 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1049066 ?auto_1049065 ) ( IS-CRATE ?auto_1049060 ) ( not ( = ?auto_1049058 ?auto_1049060 ) ) ( not ( = ?auto_1049059 ?auto_1049058 ) ) ( not ( = ?auto_1049059 ?auto_1049060 ) ) ( not ( = ?auto_1049063 ?auto_1049065 ) ) ( HOIST-AT ?auto_1049062 ?auto_1049063 ) ( not ( = ?auto_1049066 ?auto_1049062 ) ) ( AVAILABLE ?auto_1049062 ) ( SURFACE-AT ?auto_1049060 ?auto_1049063 ) ( ON ?auto_1049060 ?auto_1049064 ) ( CLEAR ?auto_1049060 ) ( not ( = ?auto_1049058 ?auto_1049064 ) ) ( not ( = ?auto_1049060 ?auto_1049064 ) ) ( not ( = ?auto_1049059 ?auto_1049064 ) ) ( TRUCK-AT ?auto_1049061 ?auto_1049065 ) ( SURFACE-AT ?auto_1049059 ?auto_1049065 ) ( CLEAR ?auto_1049059 ) ( LIFTING ?auto_1049066 ?auto_1049058 ) ( IS-CRATE ?auto_1049058 ) ( ON ?auto_1049055 ?auto_1049054 ) ( ON ?auto_1049056 ?auto_1049055 ) ( ON ?auto_1049053 ?auto_1049056 ) ( ON ?auto_1049057 ?auto_1049053 ) ( ON ?auto_1049059 ?auto_1049057 ) ( not ( = ?auto_1049054 ?auto_1049055 ) ) ( not ( = ?auto_1049054 ?auto_1049056 ) ) ( not ( = ?auto_1049054 ?auto_1049053 ) ) ( not ( = ?auto_1049054 ?auto_1049057 ) ) ( not ( = ?auto_1049054 ?auto_1049059 ) ) ( not ( = ?auto_1049054 ?auto_1049058 ) ) ( not ( = ?auto_1049054 ?auto_1049060 ) ) ( not ( = ?auto_1049054 ?auto_1049064 ) ) ( not ( = ?auto_1049055 ?auto_1049056 ) ) ( not ( = ?auto_1049055 ?auto_1049053 ) ) ( not ( = ?auto_1049055 ?auto_1049057 ) ) ( not ( = ?auto_1049055 ?auto_1049059 ) ) ( not ( = ?auto_1049055 ?auto_1049058 ) ) ( not ( = ?auto_1049055 ?auto_1049060 ) ) ( not ( = ?auto_1049055 ?auto_1049064 ) ) ( not ( = ?auto_1049056 ?auto_1049053 ) ) ( not ( = ?auto_1049056 ?auto_1049057 ) ) ( not ( = ?auto_1049056 ?auto_1049059 ) ) ( not ( = ?auto_1049056 ?auto_1049058 ) ) ( not ( = ?auto_1049056 ?auto_1049060 ) ) ( not ( = ?auto_1049056 ?auto_1049064 ) ) ( not ( = ?auto_1049053 ?auto_1049057 ) ) ( not ( = ?auto_1049053 ?auto_1049059 ) ) ( not ( = ?auto_1049053 ?auto_1049058 ) ) ( not ( = ?auto_1049053 ?auto_1049060 ) ) ( not ( = ?auto_1049053 ?auto_1049064 ) ) ( not ( = ?auto_1049057 ?auto_1049059 ) ) ( not ( = ?auto_1049057 ?auto_1049058 ) ) ( not ( = ?auto_1049057 ?auto_1049060 ) ) ( not ( = ?auto_1049057 ?auto_1049064 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1049059 ?auto_1049058 ?auto_1049060 )
      ( MAKE-7CRATE-VERIFY ?auto_1049054 ?auto_1049055 ?auto_1049056 ?auto_1049053 ?auto_1049057 ?auto_1049059 ?auto_1049058 ?auto_1049060 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1049132 - SURFACE
      ?auto_1049133 - SURFACE
      ?auto_1049134 - SURFACE
      ?auto_1049131 - SURFACE
      ?auto_1049135 - SURFACE
      ?auto_1049137 - SURFACE
      ?auto_1049136 - SURFACE
      ?auto_1049138 - SURFACE
    )
    :vars
    (
      ?auto_1049139 - HOIST
      ?auto_1049143 - PLACE
      ?auto_1049142 - PLACE
      ?auto_1049140 - HOIST
      ?auto_1049141 - SURFACE
      ?auto_1049144 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1049139 ?auto_1049143 ) ( IS-CRATE ?auto_1049138 ) ( not ( = ?auto_1049136 ?auto_1049138 ) ) ( not ( = ?auto_1049137 ?auto_1049136 ) ) ( not ( = ?auto_1049137 ?auto_1049138 ) ) ( not ( = ?auto_1049142 ?auto_1049143 ) ) ( HOIST-AT ?auto_1049140 ?auto_1049142 ) ( not ( = ?auto_1049139 ?auto_1049140 ) ) ( AVAILABLE ?auto_1049140 ) ( SURFACE-AT ?auto_1049138 ?auto_1049142 ) ( ON ?auto_1049138 ?auto_1049141 ) ( CLEAR ?auto_1049138 ) ( not ( = ?auto_1049136 ?auto_1049141 ) ) ( not ( = ?auto_1049138 ?auto_1049141 ) ) ( not ( = ?auto_1049137 ?auto_1049141 ) ) ( TRUCK-AT ?auto_1049144 ?auto_1049143 ) ( SURFACE-AT ?auto_1049137 ?auto_1049143 ) ( CLEAR ?auto_1049137 ) ( IS-CRATE ?auto_1049136 ) ( AVAILABLE ?auto_1049139 ) ( IN ?auto_1049136 ?auto_1049144 ) ( ON ?auto_1049133 ?auto_1049132 ) ( ON ?auto_1049134 ?auto_1049133 ) ( ON ?auto_1049131 ?auto_1049134 ) ( ON ?auto_1049135 ?auto_1049131 ) ( ON ?auto_1049137 ?auto_1049135 ) ( not ( = ?auto_1049132 ?auto_1049133 ) ) ( not ( = ?auto_1049132 ?auto_1049134 ) ) ( not ( = ?auto_1049132 ?auto_1049131 ) ) ( not ( = ?auto_1049132 ?auto_1049135 ) ) ( not ( = ?auto_1049132 ?auto_1049137 ) ) ( not ( = ?auto_1049132 ?auto_1049136 ) ) ( not ( = ?auto_1049132 ?auto_1049138 ) ) ( not ( = ?auto_1049132 ?auto_1049141 ) ) ( not ( = ?auto_1049133 ?auto_1049134 ) ) ( not ( = ?auto_1049133 ?auto_1049131 ) ) ( not ( = ?auto_1049133 ?auto_1049135 ) ) ( not ( = ?auto_1049133 ?auto_1049137 ) ) ( not ( = ?auto_1049133 ?auto_1049136 ) ) ( not ( = ?auto_1049133 ?auto_1049138 ) ) ( not ( = ?auto_1049133 ?auto_1049141 ) ) ( not ( = ?auto_1049134 ?auto_1049131 ) ) ( not ( = ?auto_1049134 ?auto_1049135 ) ) ( not ( = ?auto_1049134 ?auto_1049137 ) ) ( not ( = ?auto_1049134 ?auto_1049136 ) ) ( not ( = ?auto_1049134 ?auto_1049138 ) ) ( not ( = ?auto_1049134 ?auto_1049141 ) ) ( not ( = ?auto_1049131 ?auto_1049135 ) ) ( not ( = ?auto_1049131 ?auto_1049137 ) ) ( not ( = ?auto_1049131 ?auto_1049136 ) ) ( not ( = ?auto_1049131 ?auto_1049138 ) ) ( not ( = ?auto_1049131 ?auto_1049141 ) ) ( not ( = ?auto_1049135 ?auto_1049137 ) ) ( not ( = ?auto_1049135 ?auto_1049136 ) ) ( not ( = ?auto_1049135 ?auto_1049138 ) ) ( not ( = ?auto_1049135 ?auto_1049141 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1049137 ?auto_1049136 ?auto_1049138 )
      ( MAKE-7CRATE-VERIFY ?auto_1049132 ?auto_1049133 ?auto_1049134 ?auto_1049131 ?auto_1049135 ?auto_1049137 ?auto_1049136 ?auto_1049138 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1050706 - SURFACE
      ?auto_1050707 - SURFACE
    )
    :vars
    (
      ?auto_1050712 - HOIST
      ?auto_1050709 - PLACE
      ?auto_1050714 - SURFACE
      ?auto_1050713 - TRUCK
      ?auto_1050710 - PLACE
      ?auto_1050711 - HOIST
      ?auto_1050708 - SURFACE
      ?auto_1050715 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1050712 ?auto_1050709 ) ( SURFACE-AT ?auto_1050706 ?auto_1050709 ) ( CLEAR ?auto_1050706 ) ( IS-CRATE ?auto_1050707 ) ( not ( = ?auto_1050706 ?auto_1050707 ) ) ( AVAILABLE ?auto_1050712 ) ( ON ?auto_1050706 ?auto_1050714 ) ( not ( = ?auto_1050714 ?auto_1050706 ) ) ( not ( = ?auto_1050714 ?auto_1050707 ) ) ( TRUCK-AT ?auto_1050713 ?auto_1050710 ) ( not ( = ?auto_1050710 ?auto_1050709 ) ) ( HOIST-AT ?auto_1050711 ?auto_1050710 ) ( not ( = ?auto_1050712 ?auto_1050711 ) ) ( SURFACE-AT ?auto_1050707 ?auto_1050710 ) ( ON ?auto_1050707 ?auto_1050708 ) ( CLEAR ?auto_1050707 ) ( not ( = ?auto_1050706 ?auto_1050708 ) ) ( not ( = ?auto_1050707 ?auto_1050708 ) ) ( not ( = ?auto_1050714 ?auto_1050708 ) ) ( LIFTING ?auto_1050711 ?auto_1050715 ) ( IS-CRATE ?auto_1050715 ) ( not ( = ?auto_1050706 ?auto_1050715 ) ) ( not ( = ?auto_1050707 ?auto_1050715 ) ) ( not ( = ?auto_1050714 ?auto_1050715 ) ) ( not ( = ?auto_1050708 ?auto_1050715 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1050711 ?auto_1050715 ?auto_1050713 ?auto_1050710 )
      ( MAKE-1CRATE ?auto_1050706 ?auto_1050707 )
      ( MAKE-1CRATE-VERIFY ?auto_1050706 ?auto_1050707 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1052043 - SURFACE
      ?auto_1052044 - SURFACE
      ?auto_1052045 - SURFACE
      ?auto_1052042 - SURFACE
      ?auto_1052046 - SURFACE
      ?auto_1052048 - SURFACE
      ?auto_1052047 - SURFACE
      ?auto_1052049 - SURFACE
      ?auto_1052050 - SURFACE
    )
    :vars
    (
      ?auto_1052051 - HOIST
      ?auto_1052052 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052051 ?auto_1052052 ) ( SURFACE-AT ?auto_1052049 ?auto_1052052 ) ( CLEAR ?auto_1052049 ) ( LIFTING ?auto_1052051 ?auto_1052050 ) ( IS-CRATE ?auto_1052050 ) ( not ( = ?auto_1052049 ?auto_1052050 ) ) ( ON ?auto_1052044 ?auto_1052043 ) ( ON ?auto_1052045 ?auto_1052044 ) ( ON ?auto_1052042 ?auto_1052045 ) ( ON ?auto_1052046 ?auto_1052042 ) ( ON ?auto_1052048 ?auto_1052046 ) ( ON ?auto_1052047 ?auto_1052048 ) ( ON ?auto_1052049 ?auto_1052047 ) ( not ( = ?auto_1052043 ?auto_1052044 ) ) ( not ( = ?auto_1052043 ?auto_1052045 ) ) ( not ( = ?auto_1052043 ?auto_1052042 ) ) ( not ( = ?auto_1052043 ?auto_1052046 ) ) ( not ( = ?auto_1052043 ?auto_1052048 ) ) ( not ( = ?auto_1052043 ?auto_1052047 ) ) ( not ( = ?auto_1052043 ?auto_1052049 ) ) ( not ( = ?auto_1052043 ?auto_1052050 ) ) ( not ( = ?auto_1052044 ?auto_1052045 ) ) ( not ( = ?auto_1052044 ?auto_1052042 ) ) ( not ( = ?auto_1052044 ?auto_1052046 ) ) ( not ( = ?auto_1052044 ?auto_1052048 ) ) ( not ( = ?auto_1052044 ?auto_1052047 ) ) ( not ( = ?auto_1052044 ?auto_1052049 ) ) ( not ( = ?auto_1052044 ?auto_1052050 ) ) ( not ( = ?auto_1052045 ?auto_1052042 ) ) ( not ( = ?auto_1052045 ?auto_1052046 ) ) ( not ( = ?auto_1052045 ?auto_1052048 ) ) ( not ( = ?auto_1052045 ?auto_1052047 ) ) ( not ( = ?auto_1052045 ?auto_1052049 ) ) ( not ( = ?auto_1052045 ?auto_1052050 ) ) ( not ( = ?auto_1052042 ?auto_1052046 ) ) ( not ( = ?auto_1052042 ?auto_1052048 ) ) ( not ( = ?auto_1052042 ?auto_1052047 ) ) ( not ( = ?auto_1052042 ?auto_1052049 ) ) ( not ( = ?auto_1052042 ?auto_1052050 ) ) ( not ( = ?auto_1052046 ?auto_1052048 ) ) ( not ( = ?auto_1052046 ?auto_1052047 ) ) ( not ( = ?auto_1052046 ?auto_1052049 ) ) ( not ( = ?auto_1052046 ?auto_1052050 ) ) ( not ( = ?auto_1052048 ?auto_1052047 ) ) ( not ( = ?auto_1052048 ?auto_1052049 ) ) ( not ( = ?auto_1052048 ?auto_1052050 ) ) ( not ( = ?auto_1052047 ?auto_1052049 ) ) ( not ( = ?auto_1052047 ?auto_1052050 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1052049 ?auto_1052050 )
      ( MAKE-8CRATE-VERIFY ?auto_1052043 ?auto_1052044 ?auto_1052045 ?auto_1052042 ?auto_1052046 ?auto_1052048 ?auto_1052047 ?auto_1052049 ?auto_1052050 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1052110 - SURFACE
      ?auto_1052111 - SURFACE
      ?auto_1052112 - SURFACE
      ?auto_1052109 - SURFACE
      ?auto_1052113 - SURFACE
      ?auto_1052115 - SURFACE
      ?auto_1052114 - SURFACE
      ?auto_1052116 - SURFACE
      ?auto_1052117 - SURFACE
    )
    :vars
    (
      ?auto_1052118 - HOIST
      ?auto_1052119 - PLACE
      ?auto_1052120 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052118 ?auto_1052119 ) ( SURFACE-AT ?auto_1052116 ?auto_1052119 ) ( CLEAR ?auto_1052116 ) ( IS-CRATE ?auto_1052117 ) ( not ( = ?auto_1052116 ?auto_1052117 ) ) ( TRUCK-AT ?auto_1052120 ?auto_1052119 ) ( AVAILABLE ?auto_1052118 ) ( IN ?auto_1052117 ?auto_1052120 ) ( ON ?auto_1052116 ?auto_1052114 ) ( not ( = ?auto_1052114 ?auto_1052116 ) ) ( not ( = ?auto_1052114 ?auto_1052117 ) ) ( ON ?auto_1052111 ?auto_1052110 ) ( ON ?auto_1052112 ?auto_1052111 ) ( ON ?auto_1052109 ?auto_1052112 ) ( ON ?auto_1052113 ?auto_1052109 ) ( ON ?auto_1052115 ?auto_1052113 ) ( ON ?auto_1052114 ?auto_1052115 ) ( not ( = ?auto_1052110 ?auto_1052111 ) ) ( not ( = ?auto_1052110 ?auto_1052112 ) ) ( not ( = ?auto_1052110 ?auto_1052109 ) ) ( not ( = ?auto_1052110 ?auto_1052113 ) ) ( not ( = ?auto_1052110 ?auto_1052115 ) ) ( not ( = ?auto_1052110 ?auto_1052114 ) ) ( not ( = ?auto_1052110 ?auto_1052116 ) ) ( not ( = ?auto_1052110 ?auto_1052117 ) ) ( not ( = ?auto_1052111 ?auto_1052112 ) ) ( not ( = ?auto_1052111 ?auto_1052109 ) ) ( not ( = ?auto_1052111 ?auto_1052113 ) ) ( not ( = ?auto_1052111 ?auto_1052115 ) ) ( not ( = ?auto_1052111 ?auto_1052114 ) ) ( not ( = ?auto_1052111 ?auto_1052116 ) ) ( not ( = ?auto_1052111 ?auto_1052117 ) ) ( not ( = ?auto_1052112 ?auto_1052109 ) ) ( not ( = ?auto_1052112 ?auto_1052113 ) ) ( not ( = ?auto_1052112 ?auto_1052115 ) ) ( not ( = ?auto_1052112 ?auto_1052114 ) ) ( not ( = ?auto_1052112 ?auto_1052116 ) ) ( not ( = ?auto_1052112 ?auto_1052117 ) ) ( not ( = ?auto_1052109 ?auto_1052113 ) ) ( not ( = ?auto_1052109 ?auto_1052115 ) ) ( not ( = ?auto_1052109 ?auto_1052114 ) ) ( not ( = ?auto_1052109 ?auto_1052116 ) ) ( not ( = ?auto_1052109 ?auto_1052117 ) ) ( not ( = ?auto_1052113 ?auto_1052115 ) ) ( not ( = ?auto_1052113 ?auto_1052114 ) ) ( not ( = ?auto_1052113 ?auto_1052116 ) ) ( not ( = ?auto_1052113 ?auto_1052117 ) ) ( not ( = ?auto_1052115 ?auto_1052114 ) ) ( not ( = ?auto_1052115 ?auto_1052116 ) ) ( not ( = ?auto_1052115 ?auto_1052117 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052114 ?auto_1052116 ?auto_1052117 )
      ( MAKE-8CRATE-VERIFY ?auto_1052110 ?auto_1052111 ?auto_1052112 ?auto_1052109 ?auto_1052113 ?auto_1052115 ?auto_1052114 ?auto_1052116 ?auto_1052117 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1052186 - SURFACE
      ?auto_1052187 - SURFACE
      ?auto_1052188 - SURFACE
      ?auto_1052185 - SURFACE
      ?auto_1052189 - SURFACE
      ?auto_1052191 - SURFACE
      ?auto_1052190 - SURFACE
      ?auto_1052192 - SURFACE
      ?auto_1052193 - SURFACE
    )
    :vars
    (
      ?auto_1052194 - HOIST
      ?auto_1052196 - PLACE
      ?auto_1052195 - TRUCK
      ?auto_1052197 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052194 ?auto_1052196 ) ( SURFACE-AT ?auto_1052192 ?auto_1052196 ) ( CLEAR ?auto_1052192 ) ( IS-CRATE ?auto_1052193 ) ( not ( = ?auto_1052192 ?auto_1052193 ) ) ( AVAILABLE ?auto_1052194 ) ( IN ?auto_1052193 ?auto_1052195 ) ( ON ?auto_1052192 ?auto_1052190 ) ( not ( = ?auto_1052190 ?auto_1052192 ) ) ( not ( = ?auto_1052190 ?auto_1052193 ) ) ( TRUCK-AT ?auto_1052195 ?auto_1052197 ) ( not ( = ?auto_1052197 ?auto_1052196 ) ) ( ON ?auto_1052187 ?auto_1052186 ) ( ON ?auto_1052188 ?auto_1052187 ) ( ON ?auto_1052185 ?auto_1052188 ) ( ON ?auto_1052189 ?auto_1052185 ) ( ON ?auto_1052191 ?auto_1052189 ) ( ON ?auto_1052190 ?auto_1052191 ) ( not ( = ?auto_1052186 ?auto_1052187 ) ) ( not ( = ?auto_1052186 ?auto_1052188 ) ) ( not ( = ?auto_1052186 ?auto_1052185 ) ) ( not ( = ?auto_1052186 ?auto_1052189 ) ) ( not ( = ?auto_1052186 ?auto_1052191 ) ) ( not ( = ?auto_1052186 ?auto_1052190 ) ) ( not ( = ?auto_1052186 ?auto_1052192 ) ) ( not ( = ?auto_1052186 ?auto_1052193 ) ) ( not ( = ?auto_1052187 ?auto_1052188 ) ) ( not ( = ?auto_1052187 ?auto_1052185 ) ) ( not ( = ?auto_1052187 ?auto_1052189 ) ) ( not ( = ?auto_1052187 ?auto_1052191 ) ) ( not ( = ?auto_1052187 ?auto_1052190 ) ) ( not ( = ?auto_1052187 ?auto_1052192 ) ) ( not ( = ?auto_1052187 ?auto_1052193 ) ) ( not ( = ?auto_1052188 ?auto_1052185 ) ) ( not ( = ?auto_1052188 ?auto_1052189 ) ) ( not ( = ?auto_1052188 ?auto_1052191 ) ) ( not ( = ?auto_1052188 ?auto_1052190 ) ) ( not ( = ?auto_1052188 ?auto_1052192 ) ) ( not ( = ?auto_1052188 ?auto_1052193 ) ) ( not ( = ?auto_1052185 ?auto_1052189 ) ) ( not ( = ?auto_1052185 ?auto_1052191 ) ) ( not ( = ?auto_1052185 ?auto_1052190 ) ) ( not ( = ?auto_1052185 ?auto_1052192 ) ) ( not ( = ?auto_1052185 ?auto_1052193 ) ) ( not ( = ?auto_1052189 ?auto_1052191 ) ) ( not ( = ?auto_1052189 ?auto_1052190 ) ) ( not ( = ?auto_1052189 ?auto_1052192 ) ) ( not ( = ?auto_1052189 ?auto_1052193 ) ) ( not ( = ?auto_1052191 ?auto_1052190 ) ) ( not ( = ?auto_1052191 ?auto_1052192 ) ) ( not ( = ?auto_1052191 ?auto_1052193 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052190 ?auto_1052192 ?auto_1052193 )
      ( MAKE-8CRATE-VERIFY ?auto_1052186 ?auto_1052187 ?auto_1052188 ?auto_1052185 ?auto_1052189 ?auto_1052191 ?auto_1052190 ?auto_1052192 ?auto_1052193 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1052270 - SURFACE
      ?auto_1052271 - SURFACE
      ?auto_1052272 - SURFACE
      ?auto_1052269 - SURFACE
      ?auto_1052273 - SURFACE
      ?auto_1052275 - SURFACE
      ?auto_1052274 - SURFACE
      ?auto_1052276 - SURFACE
      ?auto_1052277 - SURFACE
    )
    :vars
    (
      ?auto_1052282 - HOIST
      ?auto_1052281 - PLACE
      ?auto_1052279 - TRUCK
      ?auto_1052278 - PLACE
      ?auto_1052280 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052282 ?auto_1052281 ) ( SURFACE-AT ?auto_1052276 ?auto_1052281 ) ( CLEAR ?auto_1052276 ) ( IS-CRATE ?auto_1052277 ) ( not ( = ?auto_1052276 ?auto_1052277 ) ) ( AVAILABLE ?auto_1052282 ) ( ON ?auto_1052276 ?auto_1052274 ) ( not ( = ?auto_1052274 ?auto_1052276 ) ) ( not ( = ?auto_1052274 ?auto_1052277 ) ) ( TRUCK-AT ?auto_1052279 ?auto_1052278 ) ( not ( = ?auto_1052278 ?auto_1052281 ) ) ( HOIST-AT ?auto_1052280 ?auto_1052278 ) ( LIFTING ?auto_1052280 ?auto_1052277 ) ( not ( = ?auto_1052282 ?auto_1052280 ) ) ( ON ?auto_1052271 ?auto_1052270 ) ( ON ?auto_1052272 ?auto_1052271 ) ( ON ?auto_1052269 ?auto_1052272 ) ( ON ?auto_1052273 ?auto_1052269 ) ( ON ?auto_1052275 ?auto_1052273 ) ( ON ?auto_1052274 ?auto_1052275 ) ( not ( = ?auto_1052270 ?auto_1052271 ) ) ( not ( = ?auto_1052270 ?auto_1052272 ) ) ( not ( = ?auto_1052270 ?auto_1052269 ) ) ( not ( = ?auto_1052270 ?auto_1052273 ) ) ( not ( = ?auto_1052270 ?auto_1052275 ) ) ( not ( = ?auto_1052270 ?auto_1052274 ) ) ( not ( = ?auto_1052270 ?auto_1052276 ) ) ( not ( = ?auto_1052270 ?auto_1052277 ) ) ( not ( = ?auto_1052271 ?auto_1052272 ) ) ( not ( = ?auto_1052271 ?auto_1052269 ) ) ( not ( = ?auto_1052271 ?auto_1052273 ) ) ( not ( = ?auto_1052271 ?auto_1052275 ) ) ( not ( = ?auto_1052271 ?auto_1052274 ) ) ( not ( = ?auto_1052271 ?auto_1052276 ) ) ( not ( = ?auto_1052271 ?auto_1052277 ) ) ( not ( = ?auto_1052272 ?auto_1052269 ) ) ( not ( = ?auto_1052272 ?auto_1052273 ) ) ( not ( = ?auto_1052272 ?auto_1052275 ) ) ( not ( = ?auto_1052272 ?auto_1052274 ) ) ( not ( = ?auto_1052272 ?auto_1052276 ) ) ( not ( = ?auto_1052272 ?auto_1052277 ) ) ( not ( = ?auto_1052269 ?auto_1052273 ) ) ( not ( = ?auto_1052269 ?auto_1052275 ) ) ( not ( = ?auto_1052269 ?auto_1052274 ) ) ( not ( = ?auto_1052269 ?auto_1052276 ) ) ( not ( = ?auto_1052269 ?auto_1052277 ) ) ( not ( = ?auto_1052273 ?auto_1052275 ) ) ( not ( = ?auto_1052273 ?auto_1052274 ) ) ( not ( = ?auto_1052273 ?auto_1052276 ) ) ( not ( = ?auto_1052273 ?auto_1052277 ) ) ( not ( = ?auto_1052275 ?auto_1052274 ) ) ( not ( = ?auto_1052275 ?auto_1052276 ) ) ( not ( = ?auto_1052275 ?auto_1052277 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052274 ?auto_1052276 ?auto_1052277 )
      ( MAKE-8CRATE-VERIFY ?auto_1052270 ?auto_1052271 ?auto_1052272 ?auto_1052269 ?auto_1052273 ?auto_1052275 ?auto_1052274 ?auto_1052276 ?auto_1052277 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1052362 - SURFACE
      ?auto_1052363 - SURFACE
      ?auto_1052364 - SURFACE
      ?auto_1052361 - SURFACE
      ?auto_1052365 - SURFACE
      ?auto_1052367 - SURFACE
      ?auto_1052366 - SURFACE
      ?auto_1052368 - SURFACE
      ?auto_1052369 - SURFACE
    )
    :vars
    (
      ?auto_1052371 - HOIST
      ?auto_1052370 - PLACE
      ?auto_1052374 - TRUCK
      ?auto_1052372 - PLACE
      ?auto_1052373 - HOIST
      ?auto_1052375 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052371 ?auto_1052370 ) ( SURFACE-AT ?auto_1052368 ?auto_1052370 ) ( CLEAR ?auto_1052368 ) ( IS-CRATE ?auto_1052369 ) ( not ( = ?auto_1052368 ?auto_1052369 ) ) ( AVAILABLE ?auto_1052371 ) ( ON ?auto_1052368 ?auto_1052366 ) ( not ( = ?auto_1052366 ?auto_1052368 ) ) ( not ( = ?auto_1052366 ?auto_1052369 ) ) ( TRUCK-AT ?auto_1052374 ?auto_1052372 ) ( not ( = ?auto_1052372 ?auto_1052370 ) ) ( HOIST-AT ?auto_1052373 ?auto_1052372 ) ( not ( = ?auto_1052371 ?auto_1052373 ) ) ( AVAILABLE ?auto_1052373 ) ( SURFACE-AT ?auto_1052369 ?auto_1052372 ) ( ON ?auto_1052369 ?auto_1052375 ) ( CLEAR ?auto_1052369 ) ( not ( = ?auto_1052368 ?auto_1052375 ) ) ( not ( = ?auto_1052369 ?auto_1052375 ) ) ( not ( = ?auto_1052366 ?auto_1052375 ) ) ( ON ?auto_1052363 ?auto_1052362 ) ( ON ?auto_1052364 ?auto_1052363 ) ( ON ?auto_1052361 ?auto_1052364 ) ( ON ?auto_1052365 ?auto_1052361 ) ( ON ?auto_1052367 ?auto_1052365 ) ( ON ?auto_1052366 ?auto_1052367 ) ( not ( = ?auto_1052362 ?auto_1052363 ) ) ( not ( = ?auto_1052362 ?auto_1052364 ) ) ( not ( = ?auto_1052362 ?auto_1052361 ) ) ( not ( = ?auto_1052362 ?auto_1052365 ) ) ( not ( = ?auto_1052362 ?auto_1052367 ) ) ( not ( = ?auto_1052362 ?auto_1052366 ) ) ( not ( = ?auto_1052362 ?auto_1052368 ) ) ( not ( = ?auto_1052362 ?auto_1052369 ) ) ( not ( = ?auto_1052362 ?auto_1052375 ) ) ( not ( = ?auto_1052363 ?auto_1052364 ) ) ( not ( = ?auto_1052363 ?auto_1052361 ) ) ( not ( = ?auto_1052363 ?auto_1052365 ) ) ( not ( = ?auto_1052363 ?auto_1052367 ) ) ( not ( = ?auto_1052363 ?auto_1052366 ) ) ( not ( = ?auto_1052363 ?auto_1052368 ) ) ( not ( = ?auto_1052363 ?auto_1052369 ) ) ( not ( = ?auto_1052363 ?auto_1052375 ) ) ( not ( = ?auto_1052364 ?auto_1052361 ) ) ( not ( = ?auto_1052364 ?auto_1052365 ) ) ( not ( = ?auto_1052364 ?auto_1052367 ) ) ( not ( = ?auto_1052364 ?auto_1052366 ) ) ( not ( = ?auto_1052364 ?auto_1052368 ) ) ( not ( = ?auto_1052364 ?auto_1052369 ) ) ( not ( = ?auto_1052364 ?auto_1052375 ) ) ( not ( = ?auto_1052361 ?auto_1052365 ) ) ( not ( = ?auto_1052361 ?auto_1052367 ) ) ( not ( = ?auto_1052361 ?auto_1052366 ) ) ( not ( = ?auto_1052361 ?auto_1052368 ) ) ( not ( = ?auto_1052361 ?auto_1052369 ) ) ( not ( = ?auto_1052361 ?auto_1052375 ) ) ( not ( = ?auto_1052365 ?auto_1052367 ) ) ( not ( = ?auto_1052365 ?auto_1052366 ) ) ( not ( = ?auto_1052365 ?auto_1052368 ) ) ( not ( = ?auto_1052365 ?auto_1052369 ) ) ( not ( = ?auto_1052365 ?auto_1052375 ) ) ( not ( = ?auto_1052367 ?auto_1052366 ) ) ( not ( = ?auto_1052367 ?auto_1052368 ) ) ( not ( = ?auto_1052367 ?auto_1052369 ) ) ( not ( = ?auto_1052367 ?auto_1052375 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052366 ?auto_1052368 ?auto_1052369 )
      ( MAKE-8CRATE-VERIFY ?auto_1052362 ?auto_1052363 ?auto_1052364 ?auto_1052361 ?auto_1052365 ?auto_1052367 ?auto_1052366 ?auto_1052368 ?auto_1052369 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1052455 - SURFACE
      ?auto_1052456 - SURFACE
      ?auto_1052457 - SURFACE
      ?auto_1052454 - SURFACE
      ?auto_1052458 - SURFACE
      ?auto_1052460 - SURFACE
      ?auto_1052459 - SURFACE
      ?auto_1052461 - SURFACE
      ?auto_1052462 - SURFACE
    )
    :vars
    (
      ?auto_1052463 - HOIST
      ?auto_1052468 - PLACE
      ?auto_1052465 - PLACE
      ?auto_1052464 - HOIST
      ?auto_1052467 - SURFACE
      ?auto_1052466 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052463 ?auto_1052468 ) ( SURFACE-AT ?auto_1052461 ?auto_1052468 ) ( CLEAR ?auto_1052461 ) ( IS-CRATE ?auto_1052462 ) ( not ( = ?auto_1052461 ?auto_1052462 ) ) ( AVAILABLE ?auto_1052463 ) ( ON ?auto_1052461 ?auto_1052459 ) ( not ( = ?auto_1052459 ?auto_1052461 ) ) ( not ( = ?auto_1052459 ?auto_1052462 ) ) ( not ( = ?auto_1052465 ?auto_1052468 ) ) ( HOIST-AT ?auto_1052464 ?auto_1052465 ) ( not ( = ?auto_1052463 ?auto_1052464 ) ) ( AVAILABLE ?auto_1052464 ) ( SURFACE-AT ?auto_1052462 ?auto_1052465 ) ( ON ?auto_1052462 ?auto_1052467 ) ( CLEAR ?auto_1052462 ) ( not ( = ?auto_1052461 ?auto_1052467 ) ) ( not ( = ?auto_1052462 ?auto_1052467 ) ) ( not ( = ?auto_1052459 ?auto_1052467 ) ) ( TRUCK-AT ?auto_1052466 ?auto_1052468 ) ( ON ?auto_1052456 ?auto_1052455 ) ( ON ?auto_1052457 ?auto_1052456 ) ( ON ?auto_1052454 ?auto_1052457 ) ( ON ?auto_1052458 ?auto_1052454 ) ( ON ?auto_1052460 ?auto_1052458 ) ( ON ?auto_1052459 ?auto_1052460 ) ( not ( = ?auto_1052455 ?auto_1052456 ) ) ( not ( = ?auto_1052455 ?auto_1052457 ) ) ( not ( = ?auto_1052455 ?auto_1052454 ) ) ( not ( = ?auto_1052455 ?auto_1052458 ) ) ( not ( = ?auto_1052455 ?auto_1052460 ) ) ( not ( = ?auto_1052455 ?auto_1052459 ) ) ( not ( = ?auto_1052455 ?auto_1052461 ) ) ( not ( = ?auto_1052455 ?auto_1052462 ) ) ( not ( = ?auto_1052455 ?auto_1052467 ) ) ( not ( = ?auto_1052456 ?auto_1052457 ) ) ( not ( = ?auto_1052456 ?auto_1052454 ) ) ( not ( = ?auto_1052456 ?auto_1052458 ) ) ( not ( = ?auto_1052456 ?auto_1052460 ) ) ( not ( = ?auto_1052456 ?auto_1052459 ) ) ( not ( = ?auto_1052456 ?auto_1052461 ) ) ( not ( = ?auto_1052456 ?auto_1052462 ) ) ( not ( = ?auto_1052456 ?auto_1052467 ) ) ( not ( = ?auto_1052457 ?auto_1052454 ) ) ( not ( = ?auto_1052457 ?auto_1052458 ) ) ( not ( = ?auto_1052457 ?auto_1052460 ) ) ( not ( = ?auto_1052457 ?auto_1052459 ) ) ( not ( = ?auto_1052457 ?auto_1052461 ) ) ( not ( = ?auto_1052457 ?auto_1052462 ) ) ( not ( = ?auto_1052457 ?auto_1052467 ) ) ( not ( = ?auto_1052454 ?auto_1052458 ) ) ( not ( = ?auto_1052454 ?auto_1052460 ) ) ( not ( = ?auto_1052454 ?auto_1052459 ) ) ( not ( = ?auto_1052454 ?auto_1052461 ) ) ( not ( = ?auto_1052454 ?auto_1052462 ) ) ( not ( = ?auto_1052454 ?auto_1052467 ) ) ( not ( = ?auto_1052458 ?auto_1052460 ) ) ( not ( = ?auto_1052458 ?auto_1052459 ) ) ( not ( = ?auto_1052458 ?auto_1052461 ) ) ( not ( = ?auto_1052458 ?auto_1052462 ) ) ( not ( = ?auto_1052458 ?auto_1052467 ) ) ( not ( = ?auto_1052460 ?auto_1052459 ) ) ( not ( = ?auto_1052460 ?auto_1052461 ) ) ( not ( = ?auto_1052460 ?auto_1052462 ) ) ( not ( = ?auto_1052460 ?auto_1052467 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052459 ?auto_1052461 ?auto_1052462 )
      ( MAKE-8CRATE-VERIFY ?auto_1052455 ?auto_1052456 ?auto_1052457 ?auto_1052454 ?auto_1052458 ?auto_1052460 ?auto_1052459 ?auto_1052461 ?auto_1052462 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1052548 - SURFACE
      ?auto_1052549 - SURFACE
      ?auto_1052550 - SURFACE
      ?auto_1052547 - SURFACE
      ?auto_1052551 - SURFACE
      ?auto_1052553 - SURFACE
      ?auto_1052552 - SURFACE
      ?auto_1052554 - SURFACE
      ?auto_1052555 - SURFACE
    )
    :vars
    (
      ?auto_1052560 - HOIST
      ?auto_1052561 - PLACE
      ?auto_1052557 - PLACE
      ?auto_1052556 - HOIST
      ?auto_1052559 - SURFACE
      ?auto_1052558 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052560 ?auto_1052561 ) ( IS-CRATE ?auto_1052555 ) ( not ( = ?auto_1052554 ?auto_1052555 ) ) ( not ( = ?auto_1052552 ?auto_1052554 ) ) ( not ( = ?auto_1052552 ?auto_1052555 ) ) ( not ( = ?auto_1052557 ?auto_1052561 ) ) ( HOIST-AT ?auto_1052556 ?auto_1052557 ) ( not ( = ?auto_1052560 ?auto_1052556 ) ) ( AVAILABLE ?auto_1052556 ) ( SURFACE-AT ?auto_1052555 ?auto_1052557 ) ( ON ?auto_1052555 ?auto_1052559 ) ( CLEAR ?auto_1052555 ) ( not ( = ?auto_1052554 ?auto_1052559 ) ) ( not ( = ?auto_1052555 ?auto_1052559 ) ) ( not ( = ?auto_1052552 ?auto_1052559 ) ) ( TRUCK-AT ?auto_1052558 ?auto_1052561 ) ( SURFACE-AT ?auto_1052552 ?auto_1052561 ) ( CLEAR ?auto_1052552 ) ( LIFTING ?auto_1052560 ?auto_1052554 ) ( IS-CRATE ?auto_1052554 ) ( ON ?auto_1052549 ?auto_1052548 ) ( ON ?auto_1052550 ?auto_1052549 ) ( ON ?auto_1052547 ?auto_1052550 ) ( ON ?auto_1052551 ?auto_1052547 ) ( ON ?auto_1052553 ?auto_1052551 ) ( ON ?auto_1052552 ?auto_1052553 ) ( not ( = ?auto_1052548 ?auto_1052549 ) ) ( not ( = ?auto_1052548 ?auto_1052550 ) ) ( not ( = ?auto_1052548 ?auto_1052547 ) ) ( not ( = ?auto_1052548 ?auto_1052551 ) ) ( not ( = ?auto_1052548 ?auto_1052553 ) ) ( not ( = ?auto_1052548 ?auto_1052552 ) ) ( not ( = ?auto_1052548 ?auto_1052554 ) ) ( not ( = ?auto_1052548 ?auto_1052555 ) ) ( not ( = ?auto_1052548 ?auto_1052559 ) ) ( not ( = ?auto_1052549 ?auto_1052550 ) ) ( not ( = ?auto_1052549 ?auto_1052547 ) ) ( not ( = ?auto_1052549 ?auto_1052551 ) ) ( not ( = ?auto_1052549 ?auto_1052553 ) ) ( not ( = ?auto_1052549 ?auto_1052552 ) ) ( not ( = ?auto_1052549 ?auto_1052554 ) ) ( not ( = ?auto_1052549 ?auto_1052555 ) ) ( not ( = ?auto_1052549 ?auto_1052559 ) ) ( not ( = ?auto_1052550 ?auto_1052547 ) ) ( not ( = ?auto_1052550 ?auto_1052551 ) ) ( not ( = ?auto_1052550 ?auto_1052553 ) ) ( not ( = ?auto_1052550 ?auto_1052552 ) ) ( not ( = ?auto_1052550 ?auto_1052554 ) ) ( not ( = ?auto_1052550 ?auto_1052555 ) ) ( not ( = ?auto_1052550 ?auto_1052559 ) ) ( not ( = ?auto_1052547 ?auto_1052551 ) ) ( not ( = ?auto_1052547 ?auto_1052553 ) ) ( not ( = ?auto_1052547 ?auto_1052552 ) ) ( not ( = ?auto_1052547 ?auto_1052554 ) ) ( not ( = ?auto_1052547 ?auto_1052555 ) ) ( not ( = ?auto_1052547 ?auto_1052559 ) ) ( not ( = ?auto_1052551 ?auto_1052553 ) ) ( not ( = ?auto_1052551 ?auto_1052552 ) ) ( not ( = ?auto_1052551 ?auto_1052554 ) ) ( not ( = ?auto_1052551 ?auto_1052555 ) ) ( not ( = ?auto_1052551 ?auto_1052559 ) ) ( not ( = ?auto_1052553 ?auto_1052552 ) ) ( not ( = ?auto_1052553 ?auto_1052554 ) ) ( not ( = ?auto_1052553 ?auto_1052555 ) ) ( not ( = ?auto_1052553 ?auto_1052559 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052552 ?auto_1052554 ?auto_1052555 )
      ( MAKE-8CRATE-VERIFY ?auto_1052548 ?auto_1052549 ?auto_1052550 ?auto_1052547 ?auto_1052551 ?auto_1052553 ?auto_1052552 ?auto_1052554 ?auto_1052555 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1052641 - SURFACE
      ?auto_1052642 - SURFACE
      ?auto_1052643 - SURFACE
      ?auto_1052640 - SURFACE
      ?auto_1052644 - SURFACE
      ?auto_1052646 - SURFACE
      ?auto_1052645 - SURFACE
      ?auto_1052647 - SURFACE
      ?auto_1052648 - SURFACE
    )
    :vars
    (
      ?auto_1052653 - HOIST
      ?auto_1052654 - PLACE
      ?auto_1052649 - PLACE
      ?auto_1052651 - HOIST
      ?auto_1052650 - SURFACE
      ?auto_1052652 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052653 ?auto_1052654 ) ( IS-CRATE ?auto_1052648 ) ( not ( = ?auto_1052647 ?auto_1052648 ) ) ( not ( = ?auto_1052645 ?auto_1052647 ) ) ( not ( = ?auto_1052645 ?auto_1052648 ) ) ( not ( = ?auto_1052649 ?auto_1052654 ) ) ( HOIST-AT ?auto_1052651 ?auto_1052649 ) ( not ( = ?auto_1052653 ?auto_1052651 ) ) ( AVAILABLE ?auto_1052651 ) ( SURFACE-AT ?auto_1052648 ?auto_1052649 ) ( ON ?auto_1052648 ?auto_1052650 ) ( CLEAR ?auto_1052648 ) ( not ( = ?auto_1052647 ?auto_1052650 ) ) ( not ( = ?auto_1052648 ?auto_1052650 ) ) ( not ( = ?auto_1052645 ?auto_1052650 ) ) ( TRUCK-AT ?auto_1052652 ?auto_1052654 ) ( SURFACE-AT ?auto_1052645 ?auto_1052654 ) ( CLEAR ?auto_1052645 ) ( IS-CRATE ?auto_1052647 ) ( AVAILABLE ?auto_1052653 ) ( IN ?auto_1052647 ?auto_1052652 ) ( ON ?auto_1052642 ?auto_1052641 ) ( ON ?auto_1052643 ?auto_1052642 ) ( ON ?auto_1052640 ?auto_1052643 ) ( ON ?auto_1052644 ?auto_1052640 ) ( ON ?auto_1052646 ?auto_1052644 ) ( ON ?auto_1052645 ?auto_1052646 ) ( not ( = ?auto_1052641 ?auto_1052642 ) ) ( not ( = ?auto_1052641 ?auto_1052643 ) ) ( not ( = ?auto_1052641 ?auto_1052640 ) ) ( not ( = ?auto_1052641 ?auto_1052644 ) ) ( not ( = ?auto_1052641 ?auto_1052646 ) ) ( not ( = ?auto_1052641 ?auto_1052645 ) ) ( not ( = ?auto_1052641 ?auto_1052647 ) ) ( not ( = ?auto_1052641 ?auto_1052648 ) ) ( not ( = ?auto_1052641 ?auto_1052650 ) ) ( not ( = ?auto_1052642 ?auto_1052643 ) ) ( not ( = ?auto_1052642 ?auto_1052640 ) ) ( not ( = ?auto_1052642 ?auto_1052644 ) ) ( not ( = ?auto_1052642 ?auto_1052646 ) ) ( not ( = ?auto_1052642 ?auto_1052645 ) ) ( not ( = ?auto_1052642 ?auto_1052647 ) ) ( not ( = ?auto_1052642 ?auto_1052648 ) ) ( not ( = ?auto_1052642 ?auto_1052650 ) ) ( not ( = ?auto_1052643 ?auto_1052640 ) ) ( not ( = ?auto_1052643 ?auto_1052644 ) ) ( not ( = ?auto_1052643 ?auto_1052646 ) ) ( not ( = ?auto_1052643 ?auto_1052645 ) ) ( not ( = ?auto_1052643 ?auto_1052647 ) ) ( not ( = ?auto_1052643 ?auto_1052648 ) ) ( not ( = ?auto_1052643 ?auto_1052650 ) ) ( not ( = ?auto_1052640 ?auto_1052644 ) ) ( not ( = ?auto_1052640 ?auto_1052646 ) ) ( not ( = ?auto_1052640 ?auto_1052645 ) ) ( not ( = ?auto_1052640 ?auto_1052647 ) ) ( not ( = ?auto_1052640 ?auto_1052648 ) ) ( not ( = ?auto_1052640 ?auto_1052650 ) ) ( not ( = ?auto_1052644 ?auto_1052646 ) ) ( not ( = ?auto_1052644 ?auto_1052645 ) ) ( not ( = ?auto_1052644 ?auto_1052647 ) ) ( not ( = ?auto_1052644 ?auto_1052648 ) ) ( not ( = ?auto_1052644 ?auto_1052650 ) ) ( not ( = ?auto_1052646 ?auto_1052645 ) ) ( not ( = ?auto_1052646 ?auto_1052647 ) ) ( not ( = ?auto_1052646 ?auto_1052648 ) ) ( not ( = ?auto_1052646 ?auto_1052650 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052645 ?auto_1052647 ?auto_1052648 )
      ( MAKE-8CRATE-VERIFY ?auto_1052641 ?auto_1052642 ?auto_1052643 ?auto_1052640 ?auto_1052644 ?auto_1052646 ?auto_1052645 ?auto_1052647 ?auto_1052648 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1055135 - SURFACE
      ?auto_1055136 - SURFACE
    )
    :vars
    (
      ?auto_1055142 - HOIST
      ?auto_1055137 - PLACE
      ?auto_1055138 - SURFACE
      ?auto_1055140 - PLACE
      ?auto_1055141 - HOIST
      ?auto_1055139 - SURFACE
      ?auto_1055143 - TRUCK
      ?auto_1055144 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1055142 ?auto_1055137 ) ( SURFACE-AT ?auto_1055135 ?auto_1055137 ) ( CLEAR ?auto_1055135 ) ( IS-CRATE ?auto_1055136 ) ( not ( = ?auto_1055135 ?auto_1055136 ) ) ( ON ?auto_1055135 ?auto_1055138 ) ( not ( = ?auto_1055138 ?auto_1055135 ) ) ( not ( = ?auto_1055138 ?auto_1055136 ) ) ( not ( = ?auto_1055140 ?auto_1055137 ) ) ( HOIST-AT ?auto_1055141 ?auto_1055140 ) ( not ( = ?auto_1055142 ?auto_1055141 ) ) ( AVAILABLE ?auto_1055141 ) ( SURFACE-AT ?auto_1055136 ?auto_1055140 ) ( ON ?auto_1055136 ?auto_1055139 ) ( CLEAR ?auto_1055136 ) ( not ( = ?auto_1055135 ?auto_1055139 ) ) ( not ( = ?auto_1055136 ?auto_1055139 ) ) ( not ( = ?auto_1055138 ?auto_1055139 ) ) ( TRUCK-AT ?auto_1055143 ?auto_1055137 ) ( LIFTING ?auto_1055142 ?auto_1055144 ) ( IS-CRATE ?auto_1055144 ) ( not ( = ?auto_1055135 ?auto_1055144 ) ) ( not ( = ?auto_1055136 ?auto_1055144 ) ) ( not ( = ?auto_1055138 ?auto_1055144 ) ) ( not ( = ?auto_1055139 ?auto_1055144 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1055142 ?auto_1055144 ?auto_1055143 ?auto_1055137 )
      ( MAKE-1CRATE ?auto_1055135 ?auto_1055136 )
      ( MAKE-1CRATE-VERIFY ?auto_1055135 ?auto_1055136 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1056747 - SURFACE
      ?auto_1056748 - SURFACE
      ?auto_1056749 - SURFACE
      ?auto_1056746 - SURFACE
      ?auto_1056750 - SURFACE
      ?auto_1056752 - SURFACE
      ?auto_1056751 - SURFACE
      ?auto_1056753 - SURFACE
      ?auto_1056754 - SURFACE
      ?auto_1056755 - SURFACE
    )
    :vars
    (
      ?auto_1056756 - HOIST
      ?auto_1056757 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1056756 ?auto_1056757 ) ( SURFACE-AT ?auto_1056754 ?auto_1056757 ) ( CLEAR ?auto_1056754 ) ( LIFTING ?auto_1056756 ?auto_1056755 ) ( IS-CRATE ?auto_1056755 ) ( not ( = ?auto_1056754 ?auto_1056755 ) ) ( ON ?auto_1056748 ?auto_1056747 ) ( ON ?auto_1056749 ?auto_1056748 ) ( ON ?auto_1056746 ?auto_1056749 ) ( ON ?auto_1056750 ?auto_1056746 ) ( ON ?auto_1056752 ?auto_1056750 ) ( ON ?auto_1056751 ?auto_1056752 ) ( ON ?auto_1056753 ?auto_1056751 ) ( ON ?auto_1056754 ?auto_1056753 ) ( not ( = ?auto_1056747 ?auto_1056748 ) ) ( not ( = ?auto_1056747 ?auto_1056749 ) ) ( not ( = ?auto_1056747 ?auto_1056746 ) ) ( not ( = ?auto_1056747 ?auto_1056750 ) ) ( not ( = ?auto_1056747 ?auto_1056752 ) ) ( not ( = ?auto_1056747 ?auto_1056751 ) ) ( not ( = ?auto_1056747 ?auto_1056753 ) ) ( not ( = ?auto_1056747 ?auto_1056754 ) ) ( not ( = ?auto_1056747 ?auto_1056755 ) ) ( not ( = ?auto_1056748 ?auto_1056749 ) ) ( not ( = ?auto_1056748 ?auto_1056746 ) ) ( not ( = ?auto_1056748 ?auto_1056750 ) ) ( not ( = ?auto_1056748 ?auto_1056752 ) ) ( not ( = ?auto_1056748 ?auto_1056751 ) ) ( not ( = ?auto_1056748 ?auto_1056753 ) ) ( not ( = ?auto_1056748 ?auto_1056754 ) ) ( not ( = ?auto_1056748 ?auto_1056755 ) ) ( not ( = ?auto_1056749 ?auto_1056746 ) ) ( not ( = ?auto_1056749 ?auto_1056750 ) ) ( not ( = ?auto_1056749 ?auto_1056752 ) ) ( not ( = ?auto_1056749 ?auto_1056751 ) ) ( not ( = ?auto_1056749 ?auto_1056753 ) ) ( not ( = ?auto_1056749 ?auto_1056754 ) ) ( not ( = ?auto_1056749 ?auto_1056755 ) ) ( not ( = ?auto_1056746 ?auto_1056750 ) ) ( not ( = ?auto_1056746 ?auto_1056752 ) ) ( not ( = ?auto_1056746 ?auto_1056751 ) ) ( not ( = ?auto_1056746 ?auto_1056753 ) ) ( not ( = ?auto_1056746 ?auto_1056754 ) ) ( not ( = ?auto_1056746 ?auto_1056755 ) ) ( not ( = ?auto_1056750 ?auto_1056752 ) ) ( not ( = ?auto_1056750 ?auto_1056751 ) ) ( not ( = ?auto_1056750 ?auto_1056753 ) ) ( not ( = ?auto_1056750 ?auto_1056754 ) ) ( not ( = ?auto_1056750 ?auto_1056755 ) ) ( not ( = ?auto_1056752 ?auto_1056751 ) ) ( not ( = ?auto_1056752 ?auto_1056753 ) ) ( not ( = ?auto_1056752 ?auto_1056754 ) ) ( not ( = ?auto_1056752 ?auto_1056755 ) ) ( not ( = ?auto_1056751 ?auto_1056753 ) ) ( not ( = ?auto_1056751 ?auto_1056754 ) ) ( not ( = ?auto_1056751 ?auto_1056755 ) ) ( not ( = ?auto_1056753 ?auto_1056754 ) ) ( not ( = ?auto_1056753 ?auto_1056755 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1056754 ?auto_1056755 )
      ( MAKE-9CRATE-VERIFY ?auto_1056747 ?auto_1056748 ?auto_1056749 ?auto_1056746 ?auto_1056750 ?auto_1056752 ?auto_1056751 ?auto_1056753 ?auto_1056754 ?auto_1056755 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1056827 - SURFACE
      ?auto_1056828 - SURFACE
      ?auto_1056829 - SURFACE
      ?auto_1056826 - SURFACE
      ?auto_1056830 - SURFACE
      ?auto_1056832 - SURFACE
      ?auto_1056831 - SURFACE
      ?auto_1056833 - SURFACE
      ?auto_1056834 - SURFACE
      ?auto_1056835 - SURFACE
    )
    :vars
    (
      ?auto_1056837 - HOIST
      ?auto_1056838 - PLACE
      ?auto_1056836 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1056837 ?auto_1056838 ) ( SURFACE-AT ?auto_1056834 ?auto_1056838 ) ( CLEAR ?auto_1056834 ) ( IS-CRATE ?auto_1056835 ) ( not ( = ?auto_1056834 ?auto_1056835 ) ) ( TRUCK-AT ?auto_1056836 ?auto_1056838 ) ( AVAILABLE ?auto_1056837 ) ( IN ?auto_1056835 ?auto_1056836 ) ( ON ?auto_1056834 ?auto_1056833 ) ( not ( = ?auto_1056833 ?auto_1056834 ) ) ( not ( = ?auto_1056833 ?auto_1056835 ) ) ( ON ?auto_1056828 ?auto_1056827 ) ( ON ?auto_1056829 ?auto_1056828 ) ( ON ?auto_1056826 ?auto_1056829 ) ( ON ?auto_1056830 ?auto_1056826 ) ( ON ?auto_1056832 ?auto_1056830 ) ( ON ?auto_1056831 ?auto_1056832 ) ( ON ?auto_1056833 ?auto_1056831 ) ( not ( = ?auto_1056827 ?auto_1056828 ) ) ( not ( = ?auto_1056827 ?auto_1056829 ) ) ( not ( = ?auto_1056827 ?auto_1056826 ) ) ( not ( = ?auto_1056827 ?auto_1056830 ) ) ( not ( = ?auto_1056827 ?auto_1056832 ) ) ( not ( = ?auto_1056827 ?auto_1056831 ) ) ( not ( = ?auto_1056827 ?auto_1056833 ) ) ( not ( = ?auto_1056827 ?auto_1056834 ) ) ( not ( = ?auto_1056827 ?auto_1056835 ) ) ( not ( = ?auto_1056828 ?auto_1056829 ) ) ( not ( = ?auto_1056828 ?auto_1056826 ) ) ( not ( = ?auto_1056828 ?auto_1056830 ) ) ( not ( = ?auto_1056828 ?auto_1056832 ) ) ( not ( = ?auto_1056828 ?auto_1056831 ) ) ( not ( = ?auto_1056828 ?auto_1056833 ) ) ( not ( = ?auto_1056828 ?auto_1056834 ) ) ( not ( = ?auto_1056828 ?auto_1056835 ) ) ( not ( = ?auto_1056829 ?auto_1056826 ) ) ( not ( = ?auto_1056829 ?auto_1056830 ) ) ( not ( = ?auto_1056829 ?auto_1056832 ) ) ( not ( = ?auto_1056829 ?auto_1056831 ) ) ( not ( = ?auto_1056829 ?auto_1056833 ) ) ( not ( = ?auto_1056829 ?auto_1056834 ) ) ( not ( = ?auto_1056829 ?auto_1056835 ) ) ( not ( = ?auto_1056826 ?auto_1056830 ) ) ( not ( = ?auto_1056826 ?auto_1056832 ) ) ( not ( = ?auto_1056826 ?auto_1056831 ) ) ( not ( = ?auto_1056826 ?auto_1056833 ) ) ( not ( = ?auto_1056826 ?auto_1056834 ) ) ( not ( = ?auto_1056826 ?auto_1056835 ) ) ( not ( = ?auto_1056830 ?auto_1056832 ) ) ( not ( = ?auto_1056830 ?auto_1056831 ) ) ( not ( = ?auto_1056830 ?auto_1056833 ) ) ( not ( = ?auto_1056830 ?auto_1056834 ) ) ( not ( = ?auto_1056830 ?auto_1056835 ) ) ( not ( = ?auto_1056832 ?auto_1056831 ) ) ( not ( = ?auto_1056832 ?auto_1056833 ) ) ( not ( = ?auto_1056832 ?auto_1056834 ) ) ( not ( = ?auto_1056832 ?auto_1056835 ) ) ( not ( = ?auto_1056831 ?auto_1056833 ) ) ( not ( = ?auto_1056831 ?auto_1056834 ) ) ( not ( = ?auto_1056831 ?auto_1056835 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1056833 ?auto_1056834 ?auto_1056835 )
      ( MAKE-9CRATE-VERIFY ?auto_1056827 ?auto_1056828 ?auto_1056829 ?auto_1056826 ?auto_1056830 ?auto_1056832 ?auto_1056831 ?auto_1056833 ?auto_1056834 ?auto_1056835 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1056917 - SURFACE
      ?auto_1056918 - SURFACE
      ?auto_1056919 - SURFACE
      ?auto_1056916 - SURFACE
      ?auto_1056920 - SURFACE
      ?auto_1056922 - SURFACE
      ?auto_1056921 - SURFACE
      ?auto_1056923 - SURFACE
      ?auto_1056924 - SURFACE
      ?auto_1056925 - SURFACE
    )
    :vars
    (
      ?auto_1056926 - HOIST
      ?auto_1056928 - PLACE
      ?auto_1056927 - TRUCK
      ?auto_1056929 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1056926 ?auto_1056928 ) ( SURFACE-AT ?auto_1056924 ?auto_1056928 ) ( CLEAR ?auto_1056924 ) ( IS-CRATE ?auto_1056925 ) ( not ( = ?auto_1056924 ?auto_1056925 ) ) ( AVAILABLE ?auto_1056926 ) ( IN ?auto_1056925 ?auto_1056927 ) ( ON ?auto_1056924 ?auto_1056923 ) ( not ( = ?auto_1056923 ?auto_1056924 ) ) ( not ( = ?auto_1056923 ?auto_1056925 ) ) ( TRUCK-AT ?auto_1056927 ?auto_1056929 ) ( not ( = ?auto_1056929 ?auto_1056928 ) ) ( ON ?auto_1056918 ?auto_1056917 ) ( ON ?auto_1056919 ?auto_1056918 ) ( ON ?auto_1056916 ?auto_1056919 ) ( ON ?auto_1056920 ?auto_1056916 ) ( ON ?auto_1056922 ?auto_1056920 ) ( ON ?auto_1056921 ?auto_1056922 ) ( ON ?auto_1056923 ?auto_1056921 ) ( not ( = ?auto_1056917 ?auto_1056918 ) ) ( not ( = ?auto_1056917 ?auto_1056919 ) ) ( not ( = ?auto_1056917 ?auto_1056916 ) ) ( not ( = ?auto_1056917 ?auto_1056920 ) ) ( not ( = ?auto_1056917 ?auto_1056922 ) ) ( not ( = ?auto_1056917 ?auto_1056921 ) ) ( not ( = ?auto_1056917 ?auto_1056923 ) ) ( not ( = ?auto_1056917 ?auto_1056924 ) ) ( not ( = ?auto_1056917 ?auto_1056925 ) ) ( not ( = ?auto_1056918 ?auto_1056919 ) ) ( not ( = ?auto_1056918 ?auto_1056916 ) ) ( not ( = ?auto_1056918 ?auto_1056920 ) ) ( not ( = ?auto_1056918 ?auto_1056922 ) ) ( not ( = ?auto_1056918 ?auto_1056921 ) ) ( not ( = ?auto_1056918 ?auto_1056923 ) ) ( not ( = ?auto_1056918 ?auto_1056924 ) ) ( not ( = ?auto_1056918 ?auto_1056925 ) ) ( not ( = ?auto_1056919 ?auto_1056916 ) ) ( not ( = ?auto_1056919 ?auto_1056920 ) ) ( not ( = ?auto_1056919 ?auto_1056922 ) ) ( not ( = ?auto_1056919 ?auto_1056921 ) ) ( not ( = ?auto_1056919 ?auto_1056923 ) ) ( not ( = ?auto_1056919 ?auto_1056924 ) ) ( not ( = ?auto_1056919 ?auto_1056925 ) ) ( not ( = ?auto_1056916 ?auto_1056920 ) ) ( not ( = ?auto_1056916 ?auto_1056922 ) ) ( not ( = ?auto_1056916 ?auto_1056921 ) ) ( not ( = ?auto_1056916 ?auto_1056923 ) ) ( not ( = ?auto_1056916 ?auto_1056924 ) ) ( not ( = ?auto_1056916 ?auto_1056925 ) ) ( not ( = ?auto_1056920 ?auto_1056922 ) ) ( not ( = ?auto_1056920 ?auto_1056921 ) ) ( not ( = ?auto_1056920 ?auto_1056923 ) ) ( not ( = ?auto_1056920 ?auto_1056924 ) ) ( not ( = ?auto_1056920 ?auto_1056925 ) ) ( not ( = ?auto_1056922 ?auto_1056921 ) ) ( not ( = ?auto_1056922 ?auto_1056923 ) ) ( not ( = ?auto_1056922 ?auto_1056924 ) ) ( not ( = ?auto_1056922 ?auto_1056925 ) ) ( not ( = ?auto_1056921 ?auto_1056923 ) ) ( not ( = ?auto_1056921 ?auto_1056924 ) ) ( not ( = ?auto_1056921 ?auto_1056925 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1056923 ?auto_1056924 ?auto_1056925 )
      ( MAKE-9CRATE-VERIFY ?auto_1056917 ?auto_1056918 ?auto_1056919 ?auto_1056916 ?auto_1056920 ?auto_1056922 ?auto_1056921 ?auto_1056923 ?auto_1056924 ?auto_1056925 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1057016 - SURFACE
      ?auto_1057017 - SURFACE
      ?auto_1057018 - SURFACE
      ?auto_1057015 - SURFACE
      ?auto_1057019 - SURFACE
      ?auto_1057021 - SURFACE
      ?auto_1057020 - SURFACE
      ?auto_1057022 - SURFACE
      ?auto_1057023 - SURFACE
      ?auto_1057024 - SURFACE
    )
    :vars
    (
      ?auto_1057027 - HOIST
      ?auto_1057026 - PLACE
      ?auto_1057029 - TRUCK
      ?auto_1057028 - PLACE
      ?auto_1057025 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057027 ?auto_1057026 ) ( SURFACE-AT ?auto_1057023 ?auto_1057026 ) ( CLEAR ?auto_1057023 ) ( IS-CRATE ?auto_1057024 ) ( not ( = ?auto_1057023 ?auto_1057024 ) ) ( AVAILABLE ?auto_1057027 ) ( ON ?auto_1057023 ?auto_1057022 ) ( not ( = ?auto_1057022 ?auto_1057023 ) ) ( not ( = ?auto_1057022 ?auto_1057024 ) ) ( TRUCK-AT ?auto_1057029 ?auto_1057028 ) ( not ( = ?auto_1057028 ?auto_1057026 ) ) ( HOIST-AT ?auto_1057025 ?auto_1057028 ) ( LIFTING ?auto_1057025 ?auto_1057024 ) ( not ( = ?auto_1057027 ?auto_1057025 ) ) ( ON ?auto_1057017 ?auto_1057016 ) ( ON ?auto_1057018 ?auto_1057017 ) ( ON ?auto_1057015 ?auto_1057018 ) ( ON ?auto_1057019 ?auto_1057015 ) ( ON ?auto_1057021 ?auto_1057019 ) ( ON ?auto_1057020 ?auto_1057021 ) ( ON ?auto_1057022 ?auto_1057020 ) ( not ( = ?auto_1057016 ?auto_1057017 ) ) ( not ( = ?auto_1057016 ?auto_1057018 ) ) ( not ( = ?auto_1057016 ?auto_1057015 ) ) ( not ( = ?auto_1057016 ?auto_1057019 ) ) ( not ( = ?auto_1057016 ?auto_1057021 ) ) ( not ( = ?auto_1057016 ?auto_1057020 ) ) ( not ( = ?auto_1057016 ?auto_1057022 ) ) ( not ( = ?auto_1057016 ?auto_1057023 ) ) ( not ( = ?auto_1057016 ?auto_1057024 ) ) ( not ( = ?auto_1057017 ?auto_1057018 ) ) ( not ( = ?auto_1057017 ?auto_1057015 ) ) ( not ( = ?auto_1057017 ?auto_1057019 ) ) ( not ( = ?auto_1057017 ?auto_1057021 ) ) ( not ( = ?auto_1057017 ?auto_1057020 ) ) ( not ( = ?auto_1057017 ?auto_1057022 ) ) ( not ( = ?auto_1057017 ?auto_1057023 ) ) ( not ( = ?auto_1057017 ?auto_1057024 ) ) ( not ( = ?auto_1057018 ?auto_1057015 ) ) ( not ( = ?auto_1057018 ?auto_1057019 ) ) ( not ( = ?auto_1057018 ?auto_1057021 ) ) ( not ( = ?auto_1057018 ?auto_1057020 ) ) ( not ( = ?auto_1057018 ?auto_1057022 ) ) ( not ( = ?auto_1057018 ?auto_1057023 ) ) ( not ( = ?auto_1057018 ?auto_1057024 ) ) ( not ( = ?auto_1057015 ?auto_1057019 ) ) ( not ( = ?auto_1057015 ?auto_1057021 ) ) ( not ( = ?auto_1057015 ?auto_1057020 ) ) ( not ( = ?auto_1057015 ?auto_1057022 ) ) ( not ( = ?auto_1057015 ?auto_1057023 ) ) ( not ( = ?auto_1057015 ?auto_1057024 ) ) ( not ( = ?auto_1057019 ?auto_1057021 ) ) ( not ( = ?auto_1057019 ?auto_1057020 ) ) ( not ( = ?auto_1057019 ?auto_1057022 ) ) ( not ( = ?auto_1057019 ?auto_1057023 ) ) ( not ( = ?auto_1057019 ?auto_1057024 ) ) ( not ( = ?auto_1057021 ?auto_1057020 ) ) ( not ( = ?auto_1057021 ?auto_1057022 ) ) ( not ( = ?auto_1057021 ?auto_1057023 ) ) ( not ( = ?auto_1057021 ?auto_1057024 ) ) ( not ( = ?auto_1057020 ?auto_1057022 ) ) ( not ( = ?auto_1057020 ?auto_1057023 ) ) ( not ( = ?auto_1057020 ?auto_1057024 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057022 ?auto_1057023 ?auto_1057024 )
      ( MAKE-9CRATE-VERIFY ?auto_1057016 ?auto_1057017 ?auto_1057018 ?auto_1057015 ?auto_1057019 ?auto_1057021 ?auto_1057020 ?auto_1057022 ?auto_1057023 ?auto_1057024 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1057124 - SURFACE
      ?auto_1057125 - SURFACE
      ?auto_1057126 - SURFACE
      ?auto_1057123 - SURFACE
      ?auto_1057127 - SURFACE
      ?auto_1057129 - SURFACE
      ?auto_1057128 - SURFACE
      ?auto_1057130 - SURFACE
      ?auto_1057131 - SURFACE
      ?auto_1057132 - SURFACE
    )
    :vars
    (
      ?auto_1057135 - HOIST
      ?auto_1057133 - PLACE
      ?auto_1057138 - TRUCK
      ?auto_1057136 - PLACE
      ?auto_1057134 - HOIST
      ?auto_1057137 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057135 ?auto_1057133 ) ( SURFACE-AT ?auto_1057131 ?auto_1057133 ) ( CLEAR ?auto_1057131 ) ( IS-CRATE ?auto_1057132 ) ( not ( = ?auto_1057131 ?auto_1057132 ) ) ( AVAILABLE ?auto_1057135 ) ( ON ?auto_1057131 ?auto_1057130 ) ( not ( = ?auto_1057130 ?auto_1057131 ) ) ( not ( = ?auto_1057130 ?auto_1057132 ) ) ( TRUCK-AT ?auto_1057138 ?auto_1057136 ) ( not ( = ?auto_1057136 ?auto_1057133 ) ) ( HOIST-AT ?auto_1057134 ?auto_1057136 ) ( not ( = ?auto_1057135 ?auto_1057134 ) ) ( AVAILABLE ?auto_1057134 ) ( SURFACE-AT ?auto_1057132 ?auto_1057136 ) ( ON ?auto_1057132 ?auto_1057137 ) ( CLEAR ?auto_1057132 ) ( not ( = ?auto_1057131 ?auto_1057137 ) ) ( not ( = ?auto_1057132 ?auto_1057137 ) ) ( not ( = ?auto_1057130 ?auto_1057137 ) ) ( ON ?auto_1057125 ?auto_1057124 ) ( ON ?auto_1057126 ?auto_1057125 ) ( ON ?auto_1057123 ?auto_1057126 ) ( ON ?auto_1057127 ?auto_1057123 ) ( ON ?auto_1057129 ?auto_1057127 ) ( ON ?auto_1057128 ?auto_1057129 ) ( ON ?auto_1057130 ?auto_1057128 ) ( not ( = ?auto_1057124 ?auto_1057125 ) ) ( not ( = ?auto_1057124 ?auto_1057126 ) ) ( not ( = ?auto_1057124 ?auto_1057123 ) ) ( not ( = ?auto_1057124 ?auto_1057127 ) ) ( not ( = ?auto_1057124 ?auto_1057129 ) ) ( not ( = ?auto_1057124 ?auto_1057128 ) ) ( not ( = ?auto_1057124 ?auto_1057130 ) ) ( not ( = ?auto_1057124 ?auto_1057131 ) ) ( not ( = ?auto_1057124 ?auto_1057132 ) ) ( not ( = ?auto_1057124 ?auto_1057137 ) ) ( not ( = ?auto_1057125 ?auto_1057126 ) ) ( not ( = ?auto_1057125 ?auto_1057123 ) ) ( not ( = ?auto_1057125 ?auto_1057127 ) ) ( not ( = ?auto_1057125 ?auto_1057129 ) ) ( not ( = ?auto_1057125 ?auto_1057128 ) ) ( not ( = ?auto_1057125 ?auto_1057130 ) ) ( not ( = ?auto_1057125 ?auto_1057131 ) ) ( not ( = ?auto_1057125 ?auto_1057132 ) ) ( not ( = ?auto_1057125 ?auto_1057137 ) ) ( not ( = ?auto_1057126 ?auto_1057123 ) ) ( not ( = ?auto_1057126 ?auto_1057127 ) ) ( not ( = ?auto_1057126 ?auto_1057129 ) ) ( not ( = ?auto_1057126 ?auto_1057128 ) ) ( not ( = ?auto_1057126 ?auto_1057130 ) ) ( not ( = ?auto_1057126 ?auto_1057131 ) ) ( not ( = ?auto_1057126 ?auto_1057132 ) ) ( not ( = ?auto_1057126 ?auto_1057137 ) ) ( not ( = ?auto_1057123 ?auto_1057127 ) ) ( not ( = ?auto_1057123 ?auto_1057129 ) ) ( not ( = ?auto_1057123 ?auto_1057128 ) ) ( not ( = ?auto_1057123 ?auto_1057130 ) ) ( not ( = ?auto_1057123 ?auto_1057131 ) ) ( not ( = ?auto_1057123 ?auto_1057132 ) ) ( not ( = ?auto_1057123 ?auto_1057137 ) ) ( not ( = ?auto_1057127 ?auto_1057129 ) ) ( not ( = ?auto_1057127 ?auto_1057128 ) ) ( not ( = ?auto_1057127 ?auto_1057130 ) ) ( not ( = ?auto_1057127 ?auto_1057131 ) ) ( not ( = ?auto_1057127 ?auto_1057132 ) ) ( not ( = ?auto_1057127 ?auto_1057137 ) ) ( not ( = ?auto_1057129 ?auto_1057128 ) ) ( not ( = ?auto_1057129 ?auto_1057130 ) ) ( not ( = ?auto_1057129 ?auto_1057131 ) ) ( not ( = ?auto_1057129 ?auto_1057132 ) ) ( not ( = ?auto_1057129 ?auto_1057137 ) ) ( not ( = ?auto_1057128 ?auto_1057130 ) ) ( not ( = ?auto_1057128 ?auto_1057131 ) ) ( not ( = ?auto_1057128 ?auto_1057132 ) ) ( not ( = ?auto_1057128 ?auto_1057137 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057130 ?auto_1057131 ?auto_1057132 )
      ( MAKE-9CRATE-VERIFY ?auto_1057124 ?auto_1057125 ?auto_1057126 ?auto_1057123 ?auto_1057127 ?auto_1057129 ?auto_1057128 ?auto_1057130 ?auto_1057131 ?auto_1057132 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1057233 - SURFACE
      ?auto_1057234 - SURFACE
      ?auto_1057235 - SURFACE
      ?auto_1057232 - SURFACE
      ?auto_1057236 - SURFACE
      ?auto_1057238 - SURFACE
      ?auto_1057237 - SURFACE
      ?auto_1057239 - SURFACE
      ?auto_1057240 - SURFACE
      ?auto_1057241 - SURFACE
    )
    :vars
    (
      ?auto_1057247 - HOIST
      ?auto_1057245 - PLACE
      ?auto_1057244 - PLACE
      ?auto_1057243 - HOIST
      ?auto_1057246 - SURFACE
      ?auto_1057242 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057247 ?auto_1057245 ) ( SURFACE-AT ?auto_1057240 ?auto_1057245 ) ( CLEAR ?auto_1057240 ) ( IS-CRATE ?auto_1057241 ) ( not ( = ?auto_1057240 ?auto_1057241 ) ) ( AVAILABLE ?auto_1057247 ) ( ON ?auto_1057240 ?auto_1057239 ) ( not ( = ?auto_1057239 ?auto_1057240 ) ) ( not ( = ?auto_1057239 ?auto_1057241 ) ) ( not ( = ?auto_1057244 ?auto_1057245 ) ) ( HOIST-AT ?auto_1057243 ?auto_1057244 ) ( not ( = ?auto_1057247 ?auto_1057243 ) ) ( AVAILABLE ?auto_1057243 ) ( SURFACE-AT ?auto_1057241 ?auto_1057244 ) ( ON ?auto_1057241 ?auto_1057246 ) ( CLEAR ?auto_1057241 ) ( not ( = ?auto_1057240 ?auto_1057246 ) ) ( not ( = ?auto_1057241 ?auto_1057246 ) ) ( not ( = ?auto_1057239 ?auto_1057246 ) ) ( TRUCK-AT ?auto_1057242 ?auto_1057245 ) ( ON ?auto_1057234 ?auto_1057233 ) ( ON ?auto_1057235 ?auto_1057234 ) ( ON ?auto_1057232 ?auto_1057235 ) ( ON ?auto_1057236 ?auto_1057232 ) ( ON ?auto_1057238 ?auto_1057236 ) ( ON ?auto_1057237 ?auto_1057238 ) ( ON ?auto_1057239 ?auto_1057237 ) ( not ( = ?auto_1057233 ?auto_1057234 ) ) ( not ( = ?auto_1057233 ?auto_1057235 ) ) ( not ( = ?auto_1057233 ?auto_1057232 ) ) ( not ( = ?auto_1057233 ?auto_1057236 ) ) ( not ( = ?auto_1057233 ?auto_1057238 ) ) ( not ( = ?auto_1057233 ?auto_1057237 ) ) ( not ( = ?auto_1057233 ?auto_1057239 ) ) ( not ( = ?auto_1057233 ?auto_1057240 ) ) ( not ( = ?auto_1057233 ?auto_1057241 ) ) ( not ( = ?auto_1057233 ?auto_1057246 ) ) ( not ( = ?auto_1057234 ?auto_1057235 ) ) ( not ( = ?auto_1057234 ?auto_1057232 ) ) ( not ( = ?auto_1057234 ?auto_1057236 ) ) ( not ( = ?auto_1057234 ?auto_1057238 ) ) ( not ( = ?auto_1057234 ?auto_1057237 ) ) ( not ( = ?auto_1057234 ?auto_1057239 ) ) ( not ( = ?auto_1057234 ?auto_1057240 ) ) ( not ( = ?auto_1057234 ?auto_1057241 ) ) ( not ( = ?auto_1057234 ?auto_1057246 ) ) ( not ( = ?auto_1057235 ?auto_1057232 ) ) ( not ( = ?auto_1057235 ?auto_1057236 ) ) ( not ( = ?auto_1057235 ?auto_1057238 ) ) ( not ( = ?auto_1057235 ?auto_1057237 ) ) ( not ( = ?auto_1057235 ?auto_1057239 ) ) ( not ( = ?auto_1057235 ?auto_1057240 ) ) ( not ( = ?auto_1057235 ?auto_1057241 ) ) ( not ( = ?auto_1057235 ?auto_1057246 ) ) ( not ( = ?auto_1057232 ?auto_1057236 ) ) ( not ( = ?auto_1057232 ?auto_1057238 ) ) ( not ( = ?auto_1057232 ?auto_1057237 ) ) ( not ( = ?auto_1057232 ?auto_1057239 ) ) ( not ( = ?auto_1057232 ?auto_1057240 ) ) ( not ( = ?auto_1057232 ?auto_1057241 ) ) ( not ( = ?auto_1057232 ?auto_1057246 ) ) ( not ( = ?auto_1057236 ?auto_1057238 ) ) ( not ( = ?auto_1057236 ?auto_1057237 ) ) ( not ( = ?auto_1057236 ?auto_1057239 ) ) ( not ( = ?auto_1057236 ?auto_1057240 ) ) ( not ( = ?auto_1057236 ?auto_1057241 ) ) ( not ( = ?auto_1057236 ?auto_1057246 ) ) ( not ( = ?auto_1057238 ?auto_1057237 ) ) ( not ( = ?auto_1057238 ?auto_1057239 ) ) ( not ( = ?auto_1057238 ?auto_1057240 ) ) ( not ( = ?auto_1057238 ?auto_1057241 ) ) ( not ( = ?auto_1057238 ?auto_1057246 ) ) ( not ( = ?auto_1057237 ?auto_1057239 ) ) ( not ( = ?auto_1057237 ?auto_1057240 ) ) ( not ( = ?auto_1057237 ?auto_1057241 ) ) ( not ( = ?auto_1057237 ?auto_1057246 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057239 ?auto_1057240 ?auto_1057241 )
      ( MAKE-9CRATE-VERIFY ?auto_1057233 ?auto_1057234 ?auto_1057235 ?auto_1057232 ?auto_1057236 ?auto_1057238 ?auto_1057237 ?auto_1057239 ?auto_1057240 ?auto_1057241 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1057342 - SURFACE
      ?auto_1057343 - SURFACE
      ?auto_1057344 - SURFACE
      ?auto_1057341 - SURFACE
      ?auto_1057345 - SURFACE
      ?auto_1057347 - SURFACE
      ?auto_1057346 - SURFACE
      ?auto_1057348 - SURFACE
      ?auto_1057349 - SURFACE
      ?auto_1057350 - SURFACE
    )
    :vars
    (
      ?auto_1057353 - HOIST
      ?auto_1057351 - PLACE
      ?auto_1057354 - PLACE
      ?auto_1057356 - HOIST
      ?auto_1057355 - SURFACE
      ?auto_1057352 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057353 ?auto_1057351 ) ( IS-CRATE ?auto_1057350 ) ( not ( = ?auto_1057349 ?auto_1057350 ) ) ( not ( = ?auto_1057348 ?auto_1057349 ) ) ( not ( = ?auto_1057348 ?auto_1057350 ) ) ( not ( = ?auto_1057354 ?auto_1057351 ) ) ( HOIST-AT ?auto_1057356 ?auto_1057354 ) ( not ( = ?auto_1057353 ?auto_1057356 ) ) ( AVAILABLE ?auto_1057356 ) ( SURFACE-AT ?auto_1057350 ?auto_1057354 ) ( ON ?auto_1057350 ?auto_1057355 ) ( CLEAR ?auto_1057350 ) ( not ( = ?auto_1057349 ?auto_1057355 ) ) ( not ( = ?auto_1057350 ?auto_1057355 ) ) ( not ( = ?auto_1057348 ?auto_1057355 ) ) ( TRUCK-AT ?auto_1057352 ?auto_1057351 ) ( SURFACE-AT ?auto_1057348 ?auto_1057351 ) ( CLEAR ?auto_1057348 ) ( LIFTING ?auto_1057353 ?auto_1057349 ) ( IS-CRATE ?auto_1057349 ) ( ON ?auto_1057343 ?auto_1057342 ) ( ON ?auto_1057344 ?auto_1057343 ) ( ON ?auto_1057341 ?auto_1057344 ) ( ON ?auto_1057345 ?auto_1057341 ) ( ON ?auto_1057347 ?auto_1057345 ) ( ON ?auto_1057346 ?auto_1057347 ) ( ON ?auto_1057348 ?auto_1057346 ) ( not ( = ?auto_1057342 ?auto_1057343 ) ) ( not ( = ?auto_1057342 ?auto_1057344 ) ) ( not ( = ?auto_1057342 ?auto_1057341 ) ) ( not ( = ?auto_1057342 ?auto_1057345 ) ) ( not ( = ?auto_1057342 ?auto_1057347 ) ) ( not ( = ?auto_1057342 ?auto_1057346 ) ) ( not ( = ?auto_1057342 ?auto_1057348 ) ) ( not ( = ?auto_1057342 ?auto_1057349 ) ) ( not ( = ?auto_1057342 ?auto_1057350 ) ) ( not ( = ?auto_1057342 ?auto_1057355 ) ) ( not ( = ?auto_1057343 ?auto_1057344 ) ) ( not ( = ?auto_1057343 ?auto_1057341 ) ) ( not ( = ?auto_1057343 ?auto_1057345 ) ) ( not ( = ?auto_1057343 ?auto_1057347 ) ) ( not ( = ?auto_1057343 ?auto_1057346 ) ) ( not ( = ?auto_1057343 ?auto_1057348 ) ) ( not ( = ?auto_1057343 ?auto_1057349 ) ) ( not ( = ?auto_1057343 ?auto_1057350 ) ) ( not ( = ?auto_1057343 ?auto_1057355 ) ) ( not ( = ?auto_1057344 ?auto_1057341 ) ) ( not ( = ?auto_1057344 ?auto_1057345 ) ) ( not ( = ?auto_1057344 ?auto_1057347 ) ) ( not ( = ?auto_1057344 ?auto_1057346 ) ) ( not ( = ?auto_1057344 ?auto_1057348 ) ) ( not ( = ?auto_1057344 ?auto_1057349 ) ) ( not ( = ?auto_1057344 ?auto_1057350 ) ) ( not ( = ?auto_1057344 ?auto_1057355 ) ) ( not ( = ?auto_1057341 ?auto_1057345 ) ) ( not ( = ?auto_1057341 ?auto_1057347 ) ) ( not ( = ?auto_1057341 ?auto_1057346 ) ) ( not ( = ?auto_1057341 ?auto_1057348 ) ) ( not ( = ?auto_1057341 ?auto_1057349 ) ) ( not ( = ?auto_1057341 ?auto_1057350 ) ) ( not ( = ?auto_1057341 ?auto_1057355 ) ) ( not ( = ?auto_1057345 ?auto_1057347 ) ) ( not ( = ?auto_1057345 ?auto_1057346 ) ) ( not ( = ?auto_1057345 ?auto_1057348 ) ) ( not ( = ?auto_1057345 ?auto_1057349 ) ) ( not ( = ?auto_1057345 ?auto_1057350 ) ) ( not ( = ?auto_1057345 ?auto_1057355 ) ) ( not ( = ?auto_1057347 ?auto_1057346 ) ) ( not ( = ?auto_1057347 ?auto_1057348 ) ) ( not ( = ?auto_1057347 ?auto_1057349 ) ) ( not ( = ?auto_1057347 ?auto_1057350 ) ) ( not ( = ?auto_1057347 ?auto_1057355 ) ) ( not ( = ?auto_1057346 ?auto_1057348 ) ) ( not ( = ?auto_1057346 ?auto_1057349 ) ) ( not ( = ?auto_1057346 ?auto_1057350 ) ) ( not ( = ?auto_1057346 ?auto_1057355 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057348 ?auto_1057349 ?auto_1057350 )
      ( MAKE-9CRATE-VERIFY ?auto_1057342 ?auto_1057343 ?auto_1057344 ?auto_1057341 ?auto_1057345 ?auto_1057347 ?auto_1057346 ?auto_1057348 ?auto_1057349 ?auto_1057350 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1057451 - SURFACE
      ?auto_1057452 - SURFACE
      ?auto_1057453 - SURFACE
      ?auto_1057450 - SURFACE
      ?auto_1057454 - SURFACE
      ?auto_1057456 - SURFACE
      ?auto_1057455 - SURFACE
      ?auto_1057457 - SURFACE
      ?auto_1057458 - SURFACE
      ?auto_1057459 - SURFACE
    )
    :vars
    (
      ?auto_1057461 - HOIST
      ?auto_1057460 - PLACE
      ?auto_1057465 - PLACE
      ?auto_1057463 - HOIST
      ?auto_1057462 - SURFACE
      ?auto_1057464 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057461 ?auto_1057460 ) ( IS-CRATE ?auto_1057459 ) ( not ( = ?auto_1057458 ?auto_1057459 ) ) ( not ( = ?auto_1057457 ?auto_1057458 ) ) ( not ( = ?auto_1057457 ?auto_1057459 ) ) ( not ( = ?auto_1057465 ?auto_1057460 ) ) ( HOIST-AT ?auto_1057463 ?auto_1057465 ) ( not ( = ?auto_1057461 ?auto_1057463 ) ) ( AVAILABLE ?auto_1057463 ) ( SURFACE-AT ?auto_1057459 ?auto_1057465 ) ( ON ?auto_1057459 ?auto_1057462 ) ( CLEAR ?auto_1057459 ) ( not ( = ?auto_1057458 ?auto_1057462 ) ) ( not ( = ?auto_1057459 ?auto_1057462 ) ) ( not ( = ?auto_1057457 ?auto_1057462 ) ) ( TRUCK-AT ?auto_1057464 ?auto_1057460 ) ( SURFACE-AT ?auto_1057457 ?auto_1057460 ) ( CLEAR ?auto_1057457 ) ( IS-CRATE ?auto_1057458 ) ( AVAILABLE ?auto_1057461 ) ( IN ?auto_1057458 ?auto_1057464 ) ( ON ?auto_1057452 ?auto_1057451 ) ( ON ?auto_1057453 ?auto_1057452 ) ( ON ?auto_1057450 ?auto_1057453 ) ( ON ?auto_1057454 ?auto_1057450 ) ( ON ?auto_1057456 ?auto_1057454 ) ( ON ?auto_1057455 ?auto_1057456 ) ( ON ?auto_1057457 ?auto_1057455 ) ( not ( = ?auto_1057451 ?auto_1057452 ) ) ( not ( = ?auto_1057451 ?auto_1057453 ) ) ( not ( = ?auto_1057451 ?auto_1057450 ) ) ( not ( = ?auto_1057451 ?auto_1057454 ) ) ( not ( = ?auto_1057451 ?auto_1057456 ) ) ( not ( = ?auto_1057451 ?auto_1057455 ) ) ( not ( = ?auto_1057451 ?auto_1057457 ) ) ( not ( = ?auto_1057451 ?auto_1057458 ) ) ( not ( = ?auto_1057451 ?auto_1057459 ) ) ( not ( = ?auto_1057451 ?auto_1057462 ) ) ( not ( = ?auto_1057452 ?auto_1057453 ) ) ( not ( = ?auto_1057452 ?auto_1057450 ) ) ( not ( = ?auto_1057452 ?auto_1057454 ) ) ( not ( = ?auto_1057452 ?auto_1057456 ) ) ( not ( = ?auto_1057452 ?auto_1057455 ) ) ( not ( = ?auto_1057452 ?auto_1057457 ) ) ( not ( = ?auto_1057452 ?auto_1057458 ) ) ( not ( = ?auto_1057452 ?auto_1057459 ) ) ( not ( = ?auto_1057452 ?auto_1057462 ) ) ( not ( = ?auto_1057453 ?auto_1057450 ) ) ( not ( = ?auto_1057453 ?auto_1057454 ) ) ( not ( = ?auto_1057453 ?auto_1057456 ) ) ( not ( = ?auto_1057453 ?auto_1057455 ) ) ( not ( = ?auto_1057453 ?auto_1057457 ) ) ( not ( = ?auto_1057453 ?auto_1057458 ) ) ( not ( = ?auto_1057453 ?auto_1057459 ) ) ( not ( = ?auto_1057453 ?auto_1057462 ) ) ( not ( = ?auto_1057450 ?auto_1057454 ) ) ( not ( = ?auto_1057450 ?auto_1057456 ) ) ( not ( = ?auto_1057450 ?auto_1057455 ) ) ( not ( = ?auto_1057450 ?auto_1057457 ) ) ( not ( = ?auto_1057450 ?auto_1057458 ) ) ( not ( = ?auto_1057450 ?auto_1057459 ) ) ( not ( = ?auto_1057450 ?auto_1057462 ) ) ( not ( = ?auto_1057454 ?auto_1057456 ) ) ( not ( = ?auto_1057454 ?auto_1057455 ) ) ( not ( = ?auto_1057454 ?auto_1057457 ) ) ( not ( = ?auto_1057454 ?auto_1057458 ) ) ( not ( = ?auto_1057454 ?auto_1057459 ) ) ( not ( = ?auto_1057454 ?auto_1057462 ) ) ( not ( = ?auto_1057456 ?auto_1057455 ) ) ( not ( = ?auto_1057456 ?auto_1057457 ) ) ( not ( = ?auto_1057456 ?auto_1057458 ) ) ( not ( = ?auto_1057456 ?auto_1057459 ) ) ( not ( = ?auto_1057456 ?auto_1057462 ) ) ( not ( = ?auto_1057455 ?auto_1057457 ) ) ( not ( = ?auto_1057455 ?auto_1057458 ) ) ( not ( = ?auto_1057455 ?auto_1057459 ) ) ( not ( = ?auto_1057455 ?auto_1057462 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057457 ?auto_1057458 ?auto_1057459 )
      ( MAKE-9CRATE-VERIFY ?auto_1057451 ?auto_1057452 ?auto_1057453 ?auto_1057450 ?auto_1057454 ?auto_1057456 ?auto_1057455 ?auto_1057457 ?auto_1057458 ?auto_1057459 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1057466 - SURFACE
      ?auto_1057467 - SURFACE
    )
    :vars
    (
      ?auto_1057469 - HOIST
      ?auto_1057468 - PLACE
      ?auto_1057471 - SURFACE
      ?auto_1057474 - PLACE
      ?auto_1057472 - HOIST
      ?auto_1057470 - SURFACE
      ?auto_1057473 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057469 ?auto_1057468 ) ( IS-CRATE ?auto_1057467 ) ( not ( = ?auto_1057466 ?auto_1057467 ) ) ( not ( = ?auto_1057471 ?auto_1057466 ) ) ( not ( = ?auto_1057471 ?auto_1057467 ) ) ( not ( = ?auto_1057474 ?auto_1057468 ) ) ( HOIST-AT ?auto_1057472 ?auto_1057474 ) ( not ( = ?auto_1057469 ?auto_1057472 ) ) ( AVAILABLE ?auto_1057472 ) ( SURFACE-AT ?auto_1057467 ?auto_1057474 ) ( ON ?auto_1057467 ?auto_1057470 ) ( CLEAR ?auto_1057467 ) ( not ( = ?auto_1057466 ?auto_1057470 ) ) ( not ( = ?auto_1057467 ?auto_1057470 ) ) ( not ( = ?auto_1057471 ?auto_1057470 ) ) ( SURFACE-AT ?auto_1057471 ?auto_1057468 ) ( CLEAR ?auto_1057471 ) ( IS-CRATE ?auto_1057466 ) ( AVAILABLE ?auto_1057469 ) ( IN ?auto_1057466 ?auto_1057473 ) ( TRUCK-AT ?auto_1057473 ?auto_1057474 ) )
    :subtasks
    ( ( !DRIVE ?auto_1057473 ?auto_1057474 ?auto_1057468 )
      ( MAKE-2CRATE ?auto_1057471 ?auto_1057466 ?auto_1057467 )
      ( MAKE-1CRATE-VERIFY ?auto_1057466 ?auto_1057467 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1057475 - SURFACE
      ?auto_1057476 - SURFACE
      ?auto_1057477 - SURFACE
    )
    :vars
    (
      ?auto_1057481 - HOIST
      ?auto_1057478 - PLACE
      ?auto_1057483 - PLACE
      ?auto_1057479 - HOIST
      ?auto_1057482 - SURFACE
      ?auto_1057480 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057481 ?auto_1057478 ) ( IS-CRATE ?auto_1057477 ) ( not ( = ?auto_1057476 ?auto_1057477 ) ) ( not ( = ?auto_1057475 ?auto_1057476 ) ) ( not ( = ?auto_1057475 ?auto_1057477 ) ) ( not ( = ?auto_1057483 ?auto_1057478 ) ) ( HOIST-AT ?auto_1057479 ?auto_1057483 ) ( not ( = ?auto_1057481 ?auto_1057479 ) ) ( AVAILABLE ?auto_1057479 ) ( SURFACE-AT ?auto_1057477 ?auto_1057483 ) ( ON ?auto_1057477 ?auto_1057482 ) ( CLEAR ?auto_1057477 ) ( not ( = ?auto_1057476 ?auto_1057482 ) ) ( not ( = ?auto_1057477 ?auto_1057482 ) ) ( not ( = ?auto_1057475 ?auto_1057482 ) ) ( SURFACE-AT ?auto_1057475 ?auto_1057478 ) ( CLEAR ?auto_1057475 ) ( IS-CRATE ?auto_1057476 ) ( AVAILABLE ?auto_1057481 ) ( IN ?auto_1057476 ?auto_1057480 ) ( TRUCK-AT ?auto_1057480 ?auto_1057483 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1057476 ?auto_1057477 )
      ( MAKE-2CRATE-VERIFY ?auto_1057475 ?auto_1057476 ?auto_1057477 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1057485 - SURFACE
      ?auto_1057486 - SURFACE
      ?auto_1057487 - SURFACE
      ?auto_1057484 - SURFACE
    )
    :vars
    (
      ?auto_1057488 - HOIST
      ?auto_1057489 - PLACE
      ?auto_1057492 - PLACE
      ?auto_1057493 - HOIST
      ?auto_1057490 - SURFACE
      ?auto_1057491 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057488 ?auto_1057489 ) ( IS-CRATE ?auto_1057484 ) ( not ( = ?auto_1057487 ?auto_1057484 ) ) ( not ( = ?auto_1057486 ?auto_1057487 ) ) ( not ( = ?auto_1057486 ?auto_1057484 ) ) ( not ( = ?auto_1057492 ?auto_1057489 ) ) ( HOIST-AT ?auto_1057493 ?auto_1057492 ) ( not ( = ?auto_1057488 ?auto_1057493 ) ) ( AVAILABLE ?auto_1057493 ) ( SURFACE-AT ?auto_1057484 ?auto_1057492 ) ( ON ?auto_1057484 ?auto_1057490 ) ( CLEAR ?auto_1057484 ) ( not ( = ?auto_1057487 ?auto_1057490 ) ) ( not ( = ?auto_1057484 ?auto_1057490 ) ) ( not ( = ?auto_1057486 ?auto_1057490 ) ) ( SURFACE-AT ?auto_1057486 ?auto_1057489 ) ( CLEAR ?auto_1057486 ) ( IS-CRATE ?auto_1057487 ) ( AVAILABLE ?auto_1057488 ) ( IN ?auto_1057487 ?auto_1057491 ) ( TRUCK-AT ?auto_1057491 ?auto_1057492 ) ( ON ?auto_1057486 ?auto_1057485 ) ( not ( = ?auto_1057485 ?auto_1057486 ) ) ( not ( = ?auto_1057485 ?auto_1057487 ) ) ( not ( = ?auto_1057485 ?auto_1057484 ) ) ( not ( = ?auto_1057485 ?auto_1057490 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057486 ?auto_1057487 ?auto_1057484 )
      ( MAKE-3CRATE-VERIFY ?auto_1057485 ?auto_1057486 ?auto_1057487 ?auto_1057484 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1057495 - SURFACE
      ?auto_1057496 - SURFACE
      ?auto_1057497 - SURFACE
      ?auto_1057494 - SURFACE
      ?auto_1057498 - SURFACE
    )
    :vars
    (
      ?auto_1057499 - HOIST
      ?auto_1057500 - PLACE
      ?auto_1057503 - PLACE
      ?auto_1057504 - HOIST
      ?auto_1057501 - SURFACE
      ?auto_1057502 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057499 ?auto_1057500 ) ( IS-CRATE ?auto_1057498 ) ( not ( = ?auto_1057494 ?auto_1057498 ) ) ( not ( = ?auto_1057497 ?auto_1057494 ) ) ( not ( = ?auto_1057497 ?auto_1057498 ) ) ( not ( = ?auto_1057503 ?auto_1057500 ) ) ( HOIST-AT ?auto_1057504 ?auto_1057503 ) ( not ( = ?auto_1057499 ?auto_1057504 ) ) ( AVAILABLE ?auto_1057504 ) ( SURFACE-AT ?auto_1057498 ?auto_1057503 ) ( ON ?auto_1057498 ?auto_1057501 ) ( CLEAR ?auto_1057498 ) ( not ( = ?auto_1057494 ?auto_1057501 ) ) ( not ( = ?auto_1057498 ?auto_1057501 ) ) ( not ( = ?auto_1057497 ?auto_1057501 ) ) ( SURFACE-AT ?auto_1057497 ?auto_1057500 ) ( CLEAR ?auto_1057497 ) ( IS-CRATE ?auto_1057494 ) ( AVAILABLE ?auto_1057499 ) ( IN ?auto_1057494 ?auto_1057502 ) ( TRUCK-AT ?auto_1057502 ?auto_1057503 ) ( ON ?auto_1057496 ?auto_1057495 ) ( ON ?auto_1057497 ?auto_1057496 ) ( not ( = ?auto_1057495 ?auto_1057496 ) ) ( not ( = ?auto_1057495 ?auto_1057497 ) ) ( not ( = ?auto_1057495 ?auto_1057494 ) ) ( not ( = ?auto_1057495 ?auto_1057498 ) ) ( not ( = ?auto_1057495 ?auto_1057501 ) ) ( not ( = ?auto_1057496 ?auto_1057497 ) ) ( not ( = ?auto_1057496 ?auto_1057494 ) ) ( not ( = ?auto_1057496 ?auto_1057498 ) ) ( not ( = ?auto_1057496 ?auto_1057501 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057497 ?auto_1057494 ?auto_1057498 )
      ( MAKE-4CRATE-VERIFY ?auto_1057495 ?auto_1057496 ?auto_1057497 ?auto_1057494 ?auto_1057498 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1057506 - SURFACE
      ?auto_1057507 - SURFACE
      ?auto_1057508 - SURFACE
      ?auto_1057505 - SURFACE
      ?auto_1057509 - SURFACE
      ?auto_1057510 - SURFACE
    )
    :vars
    (
      ?auto_1057511 - HOIST
      ?auto_1057512 - PLACE
      ?auto_1057515 - PLACE
      ?auto_1057516 - HOIST
      ?auto_1057513 - SURFACE
      ?auto_1057514 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057511 ?auto_1057512 ) ( IS-CRATE ?auto_1057510 ) ( not ( = ?auto_1057509 ?auto_1057510 ) ) ( not ( = ?auto_1057505 ?auto_1057509 ) ) ( not ( = ?auto_1057505 ?auto_1057510 ) ) ( not ( = ?auto_1057515 ?auto_1057512 ) ) ( HOIST-AT ?auto_1057516 ?auto_1057515 ) ( not ( = ?auto_1057511 ?auto_1057516 ) ) ( AVAILABLE ?auto_1057516 ) ( SURFACE-AT ?auto_1057510 ?auto_1057515 ) ( ON ?auto_1057510 ?auto_1057513 ) ( CLEAR ?auto_1057510 ) ( not ( = ?auto_1057509 ?auto_1057513 ) ) ( not ( = ?auto_1057510 ?auto_1057513 ) ) ( not ( = ?auto_1057505 ?auto_1057513 ) ) ( SURFACE-AT ?auto_1057505 ?auto_1057512 ) ( CLEAR ?auto_1057505 ) ( IS-CRATE ?auto_1057509 ) ( AVAILABLE ?auto_1057511 ) ( IN ?auto_1057509 ?auto_1057514 ) ( TRUCK-AT ?auto_1057514 ?auto_1057515 ) ( ON ?auto_1057507 ?auto_1057506 ) ( ON ?auto_1057508 ?auto_1057507 ) ( ON ?auto_1057505 ?auto_1057508 ) ( not ( = ?auto_1057506 ?auto_1057507 ) ) ( not ( = ?auto_1057506 ?auto_1057508 ) ) ( not ( = ?auto_1057506 ?auto_1057505 ) ) ( not ( = ?auto_1057506 ?auto_1057509 ) ) ( not ( = ?auto_1057506 ?auto_1057510 ) ) ( not ( = ?auto_1057506 ?auto_1057513 ) ) ( not ( = ?auto_1057507 ?auto_1057508 ) ) ( not ( = ?auto_1057507 ?auto_1057505 ) ) ( not ( = ?auto_1057507 ?auto_1057509 ) ) ( not ( = ?auto_1057507 ?auto_1057510 ) ) ( not ( = ?auto_1057507 ?auto_1057513 ) ) ( not ( = ?auto_1057508 ?auto_1057505 ) ) ( not ( = ?auto_1057508 ?auto_1057509 ) ) ( not ( = ?auto_1057508 ?auto_1057510 ) ) ( not ( = ?auto_1057508 ?auto_1057513 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057505 ?auto_1057509 ?auto_1057510 )
      ( MAKE-5CRATE-VERIFY ?auto_1057506 ?auto_1057507 ?auto_1057508 ?auto_1057505 ?auto_1057509 ?auto_1057510 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1057518 - SURFACE
      ?auto_1057519 - SURFACE
      ?auto_1057520 - SURFACE
      ?auto_1057517 - SURFACE
      ?auto_1057521 - SURFACE
      ?auto_1057523 - SURFACE
      ?auto_1057522 - SURFACE
    )
    :vars
    (
      ?auto_1057524 - HOIST
      ?auto_1057525 - PLACE
      ?auto_1057528 - PLACE
      ?auto_1057529 - HOIST
      ?auto_1057526 - SURFACE
      ?auto_1057527 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057524 ?auto_1057525 ) ( IS-CRATE ?auto_1057522 ) ( not ( = ?auto_1057523 ?auto_1057522 ) ) ( not ( = ?auto_1057521 ?auto_1057523 ) ) ( not ( = ?auto_1057521 ?auto_1057522 ) ) ( not ( = ?auto_1057528 ?auto_1057525 ) ) ( HOIST-AT ?auto_1057529 ?auto_1057528 ) ( not ( = ?auto_1057524 ?auto_1057529 ) ) ( AVAILABLE ?auto_1057529 ) ( SURFACE-AT ?auto_1057522 ?auto_1057528 ) ( ON ?auto_1057522 ?auto_1057526 ) ( CLEAR ?auto_1057522 ) ( not ( = ?auto_1057523 ?auto_1057526 ) ) ( not ( = ?auto_1057522 ?auto_1057526 ) ) ( not ( = ?auto_1057521 ?auto_1057526 ) ) ( SURFACE-AT ?auto_1057521 ?auto_1057525 ) ( CLEAR ?auto_1057521 ) ( IS-CRATE ?auto_1057523 ) ( AVAILABLE ?auto_1057524 ) ( IN ?auto_1057523 ?auto_1057527 ) ( TRUCK-AT ?auto_1057527 ?auto_1057528 ) ( ON ?auto_1057519 ?auto_1057518 ) ( ON ?auto_1057520 ?auto_1057519 ) ( ON ?auto_1057517 ?auto_1057520 ) ( ON ?auto_1057521 ?auto_1057517 ) ( not ( = ?auto_1057518 ?auto_1057519 ) ) ( not ( = ?auto_1057518 ?auto_1057520 ) ) ( not ( = ?auto_1057518 ?auto_1057517 ) ) ( not ( = ?auto_1057518 ?auto_1057521 ) ) ( not ( = ?auto_1057518 ?auto_1057523 ) ) ( not ( = ?auto_1057518 ?auto_1057522 ) ) ( not ( = ?auto_1057518 ?auto_1057526 ) ) ( not ( = ?auto_1057519 ?auto_1057520 ) ) ( not ( = ?auto_1057519 ?auto_1057517 ) ) ( not ( = ?auto_1057519 ?auto_1057521 ) ) ( not ( = ?auto_1057519 ?auto_1057523 ) ) ( not ( = ?auto_1057519 ?auto_1057522 ) ) ( not ( = ?auto_1057519 ?auto_1057526 ) ) ( not ( = ?auto_1057520 ?auto_1057517 ) ) ( not ( = ?auto_1057520 ?auto_1057521 ) ) ( not ( = ?auto_1057520 ?auto_1057523 ) ) ( not ( = ?auto_1057520 ?auto_1057522 ) ) ( not ( = ?auto_1057520 ?auto_1057526 ) ) ( not ( = ?auto_1057517 ?auto_1057521 ) ) ( not ( = ?auto_1057517 ?auto_1057523 ) ) ( not ( = ?auto_1057517 ?auto_1057522 ) ) ( not ( = ?auto_1057517 ?auto_1057526 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057521 ?auto_1057523 ?auto_1057522 )
      ( MAKE-6CRATE-VERIFY ?auto_1057518 ?auto_1057519 ?auto_1057520 ?auto_1057517 ?auto_1057521 ?auto_1057523 ?auto_1057522 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1057531 - SURFACE
      ?auto_1057532 - SURFACE
      ?auto_1057533 - SURFACE
      ?auto_1057530 - SURFACE
      ?auto_1057534 - SURFACE
      ?auto_1057536 - SURFACE
      ?auto_1057535 - SURFACE
      ?auto_1057537 - SURFACE
    )
    :vars
    (
      ?auto_1057538 - HOIST
      ?auto_1057539 - PLACE
      ?auto_1057542 - PLACE
      ?auto_1057543 - HOIST
      ?auto_1057540 - SURFACE
      ?auto_1057541 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057538 ?auto_1057539 ) ( IS-CRATE ?auto_1057537 ) ( not ( = ?auto_1057535 ?auto_1057537 ) ) ( not ( = ?auto_1057536 ?auto_1057535 ) ) ( not ( = ?auto_1057536 ?auto_1057537 ) ) ( not ( = ?auto_1057542 ?auto_1057539 ) ) ( HOIST-AT ?auto_1057543 ?auto_1057542 ) ( not ( = ?auto_1057538 ?auto_1057543 ) ) ( AVAILABLE ?auto_1057543 ) ( SURFACE-AT ?auto_1057537 ?auto_1057542 ) ( ON ?auto_1057537 ?auto_1057540 ) ( CLEAR ?auto_1057537 ) ( not ( = ?auto_1057535 ?auto_1057540 ) ) ( not ( = ?auto_1057537 ?auto_1057540 ) ) ( not ( = ?auto_1057536 ?auto_1057540 ) ) ( SURFACE-AT ?auto_1057536 ?auto_1057539 ) ( CLEAR ?auto_1057536 ) ( IS-CRATE ?auto_1057535 ) ( AVAILABLE ?auto_1057538 ) ( IN ?auto_1057535 ?auto_1057541 ) ( TRUCK-AT ?auto_1057541 ?auto_1057542 ) ( ON ?auto_1057532 ?auto_1057531 ) ( ON ?auto_1057533 ?auto_1057532 ) ( ON ?auto_1057530 ?auto_1057533 ) ( ON ?auto_1057534 ?auto_1057530 ) ( ON ?auto_1057536 ?auto_1057534 ) ( not ( = ?auto_1057531 ?auto_1057532 ) ) ( not ( = ?auto_1057531 ?auto_1057533 ) ) ( not ( = ?auto_1057531 ?auto_1057530 ) ) ( not ( = ?auto_1057531 ?auto_1057534 ) ) ( not ( = ?auto_1057531 ?auto_1057536 ) ) ( not ( = ?auto_1057531 ?auto_1057535 ) ) ( not ( = ?auto_1057531 ?auto_1057537 ) ) ( not ( = ?auto_1057531 ?auto_1057540 ) ) ( not ( = ?auto_1057532 ?auto_1057533 ) ) ( not ( = ?auto_1057532 ?auto_1057530 ) ) ( not ( = ?auto_1057532 ?auto_1057534 ) ) ( not ( = ?auto_1057532 ?auto_1057536 ) ) ( not ( = ?auto_1057532 ?auto_1057535 ) ) ( not ( = ?auto_1057532 ?auto_1057537 ) ) ( not ( = ?auto_1057532 ?auto_1057540 ) ) ( not ( = ?auto_1057533 ?auto_1057530 ) ) ( not ( = ?auto_1057533 ?auto_1057534 ) ) ( not ( = ?auto_1057533 ?auto_1057536 ) ) ( not ( = ?auto_1057533 ?auto_1057535 ) ) ( not ( = ?auto_1057533 ?auto_1057537 ) ) ( not ( = ?auto_1057533 ?auto_1057540 ) ) ( not ( = ?auto_1057530 ?auto_1057534 ) ) ( not ( = ?auto_1057530 ?auto_1057536 ) ) ( not ( = ?auto_1057530 ?auto_1057535 ) ) ( not ( = ?auto_1057530 ?auto_1057537 ) ) ( not ( = ?auto_1057530 ?auto_1057540 ) ) ( not ( = ?auto_1057534 ?auto_1057536 ) ) ( not ( = ?auto_1057534 ?auto_1057535 ) ) ( not ( = ?auto_1057534 ?auto_1057537 ) ) ( not ( = ?auto_1057534 ?auto_1057540 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057536 ?auto_1057535 ?auto_1057537 )
      ( MAKE-7CRATE-VERIFY ?auto_1057531 ?auto_1057532 ?auto_1057533 ?auto_1057530 ?auto_1057534 ?auto_1057536 ?auto_1057535 ?auto_1057537 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1057545 - SURFACE
      ?auto_1057546 - SURFACE
      ?auto_1057547 - SURFACE
      ?auto_1057544 - SURFACE
      ?auto_1057548 - SURFACE
      ?auto_1057550 - SURFACE
      ?auto_1057549 - SURFACE
      ?auto_1057551 - SURFACE
      ?auto_1057552 - SURFACE
    )
    :vars
    (
      ?auto_1057553 - HOIST
      ?auto_1057554 - PLACE
      ?auto_1057557 - PLACE
      ?auto_1057558 - HOIST
      ?auto_1057555 - SURFACE
      ?auto_1057556 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057553 ?auto_1057554 ) ( IS-CRATE ?auto_1057552 ) ( not ( = ?auto_1057551 ?auto_1057552 ) ) ( not ( = ?auto_1057549 ?auto_1057551 ) ) ( not ( = ?auto_1057549 ?auto_1057552 ) ) ( not ( = ?auto_1057557 ?auto_1057554 ) ) ( HOIST-AT ?auto_1057558 ?auto_1057557 ) ( not ( = ?auto_1057553 ?auto_1057558 ) ) ( AVAILABLE ?auto_1057558 ) ( SURFACE-AT ?auto_1057552 ?auto_1057557 ) ( ON ?auto_1057552 ?auto_1057555 ) ( CLEAR ?auto_1057552 ) ( not ( = ?auto_1057551 ?auto_1057555 ) ) ( not ( = ?auto_1057552 ?auto_1057555 ) ) ( not ( = ?auto_1057549 ?auto_1057555 ) ) ( SURFACE-AT ?auto_1057549 ?auto_1057554 ) ( CLEAR ?auto_1057549 ) ( IS-CRATE ?auto_1057551 ) ( AVAILABLE ?auto_1057553 ) ( IN ?auto_1057551 ?auto_1057556 ) ( TRUCK-AT ?auto_1057556 ?auto_1057557 ) ( ON ?auto_1057546 ?auto_1057545 ) ( ON ?auto_1057547 ?auto_1057546 ) ( ON ?auto_1057544 ?auto_1057547 ) ( ON ?auto_1057548 ?auto_1057544 ) ( ON ?auto_1057550 ?auto_1057548 ) ( ON ?auto_1057549 ?auto_1057550 ) ( not ( = ?auto_1057545 ?auto_1057546 ) ) ( not ( = ?auto_1057545 ?auto_1057547 ) ) ( not ( = ?auto_1057545 ?auto_1057544 ) ) ( not ( = ?auto_1057545 ?auto_1057548 ) ) ( not ( = ?auto_1057545 ?auto_1057550 ) ) ( not ( = ?auto_1057545 ?auto_1057549 ) ) ( not ( = ?auto_1057545 ?auto_1057551 ) ) ( not ( = ?auto_1057545 ?auto_1057552 ) ) ( not ( = ?auto_1057545 ?auto_1057555 ) ) ( not ( = ?auto_1057546 ?auto_1057547 ) ) ( not ( = ?auto_1057546 ?auto_1057544 ) ) ( not ( = ?auto_1057546 ?auto_1057548 ) ) ( not ( = ?auto_1057546 ?auto_1057550 ) ) ( not ( = ?auto_1057546 ?auto_1057549 ) ) ( not ( = ?auto_1057546 ?auto_1057551 ) ) ( not ( = ?auto_1057546 ?auto_1057552 ) ) ( not ( = ?auto_1057546 ?auto_1057555 ) ) ( not ( = ?auto_1057547 ?auto_1057544 ) ) ( not ( = ?auto_1057547 ?auto_1057548 ) ) ( not ( = ?auto_1057547 ?auto_1057550 ) ) ( not ( = ?auto_1057547 ?auto_1057549 ) ) ( not ( = ?auto_1057547 ?auto_1057551 ) ) ( not ( = ?auto_1057547 ?auto_1057552 ) ) ( not ( = ?auto_1057547 ?auto_1057555 ) ) ( not ( = ?auto_1057544 ?auto_1057548 ) ) ( not ( = ?auto_1057544 ?auto_1057550 ) ) ( not ( = ?auto_1057544 ?auto_1057549 ) ) ( not ( = ?auto_1057544 ?auto_1057551 ) ) ( not ( = ?auto_1057544 ?auto_1057552 ) ) ( not ( = ?auto_1057544 ?auto_1057555 ) ) ( not ( = ?auto_1057548 ?auto_1057550 ) ) ( not ( = ?auto_1057548 ?auto_1057549 ) ) ( not ( = ?auto_1057548 ?auto_1057551 ) ) ( not ( = ?auto_1057548 ?auto_1057552 ) ) ( not ( = ?auto_1057548 ?auto_1057555 ) ) ( not ( = ?auto_1057550 ?auto_1057549 ) ) ( not ( = ?auto_1057550 ?auto_1057551 ) ) ( not ( = ?auto_1057550 ?auto_1057552 ) ) ( not ( = ?auto_1057550 ?auto_1057555 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057549 ?auto_1057551 ?auto_1057552 )
      ( MAKE-8CRATE-VERIFY ?auto_1057545 ?auto_1057546 ?auto_1057547 ?auto_1057544 ?auto_1057548 ?auto_1057550 ?auto_1057549 ?auto_1057551 ?auto_1057552 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1057560 - SURFACE
      ?auto_1057561 - SURFACE
      ?auto_1057562 - SURFACE
      ?auto_1057559 - SURFACE
      ?auto_1057563 - SURFACE
      ?auto_1057565 - SURFACE
      ?auto_1057564 - SURFACE
      ?auto_1057566 - SURFACE
      ?auto_1057567 - SURFACE
      ?auto_1057568 - SURFACE
    )
    :vars
    (
      ?auto_1057569 - HOIST
      ?auto_1057570 - PLACE
      ?auto_1057573 - PLACE
      ?auto_1057574 - HOIST
      ?auto_1057571 - SURFACE
      ?auto_1057572 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057569 ?auto_1057570 ) ( IS-CRATE ?auto_1057568 ) ( not ( = ?auto_1057567 ?auto_1057568 ) ) ( not ( = ?auto_1057566 ?auto_1057567 ) ) ( not ( = ?auto_1057566 ?auto_1057568 ) ) ( not ( = ?auto_1057573 ?auto_1057570 ) ) ( HOIST-AT ?auto_1057574 ?auto_1057573 ) ( not ( = ?auto_1057569 ?auto_1057574 ) ) ( AVAILABLE ?auto_1057574 ) ( SURFACE-AT ?auto_1057568 ?auto_1057573 ) ( ON ?auto_1057568 ?auto_1057571 ) ( CLEAR ?auto_1057568 ) ( not ( = ?auto_1057567 ?auto_1057571 ) ) ( not ( = ?auto_1057568 ?auto_1057571 ) ) ( not ( = ?auto_1057566 ?auto_1057571 ) ) ( SURFACE-AT ?auto_1057566 ?auto_1057570 ) ( CLEAR ?auto_1057566 ) ( IS-CRATE ?auto_1057567 ) ( AVAILABLE ?auto_1057569 ) ( IN ?auto_1057567 ?auto_1057572 ) ( TRUCK-AT ?auto_1057572 ?auto_1057573 ) ( ON ?auto_1057561 ?auto_1057560 ) ( ON ?auto_1057562 ?auto_1057561 ) ( ON ?auto_1057559 ?auto_1057562 ) ( ON ?auto_1057563 ?auto_1057559 ) ( ON ?auto_1057565 ?auto_1057563 ) ( ON ?auto_1057564 ?auto_1057565 ) ( ON ?auto_1057566 ?auto_1057564 ) ( not ( = ?auto_1057560 ?auto_1057561 ) ) ( not ( = ?auto_1057560 ?auto_1057562 ) ) ( not ( = ?auto_1057560 ?auto_1057559 ) ) ( not ( = ?auto_1057560 ?auto_1057563 ) ) ( not ( = ?auto_1057560 ?auto_1057565 ) ) ( not ( = ?auto_1057560 ?auto_1057564 ) ) ( not ( = ?auto_1057560 ?auto_1057566 ) ) ( not ( = ?auto_1057560 ?auto_1057567 ) ) ( not ( = ?auto_1057560 ?auto_1057568 ) ) ( not ( = ?auto_1057560 ?auto_1057571 ) ) ( not ( = ?auto_1057561 ?auto_1057562 ) ) ( not ( = ?auto_1057561 ?auto_1057559 ) ) ( not ( = ?auto_1057561 ?auto_1057563 ) ) ( not ( = ?auto_1057561 ?auto_1057565 ) ) ( not ( = ?auto_1057561 ?auto_1057564 ) ) ( not ( = ?auto_1057561 ?auto_1057566 ) ) ( not ( = ?auto_1057561 ?auto_1057567 ) ) ( not ( = ?auto_1057561 ?auto_1057568 ) ) ( not ( = ?auto_1057561 ?auto_1057571 ) ) ( not ( = ?auto_1057562 ?auto_1057559 ) ) ( not ( = ?auto_1057562 ?auto_1057563 ) ) ( not ( = ?auto_1057562 ?auto_1057565 ) ) ( not ( = ?auto_1057562 ?auto_1057564 ) ) ( not ( = ?auto_1057562 ?auto_1057566 ) ) ( not ( = ?auto_1057562 ?auto_1057567 ) ) ( not ( = ?auto_1057562 ?auto_1057568 ) ) ( not ( = ?auto_1057562 ?auto_1057571 ) ) ( not ( = ?auto_1057559 ?auto_1057563 ) ) ( not ( = ?auto_1057559 ?auto_1057565 ) ) ( not ( = ?auto_1057559 ?auto_1057564 ) ) ( not ( = ?auto_1057559 ?auto_1057566 ) ) ( not ( = ?auto_1057559 ?auto_1057567 ) ) ( not ( = ?auto_1057559 ?auto_1057568 ) ) ( not ( = ?auto_1057559 ?auto_1057571 ) ) ( not ( = ?auto_1057563 ?auto_1057565 ) ) ( not ( = ?auto_1057563 ?auto_1057564 ) ) ( not ( = ?auto_1057563 ?auto_1057566 ) ) ( not ( = ?auto_1057563 ?auto_1057567 ) ) ( not ( = ?auto_1057563 ?auto_1057568 ) ) ( not ( = ?auto_1057563 ?auto_1057571 ) ) ( not ( = ?auto_1057565 ?auto_1057564 ) ) ( not ( = ?auto_1057565 ?auto_1057566 ) ) ( not ( = ?auto_1057565 ?auto_1057567 ) ) ( not ( = ?auto_1057565 ?auto_1057568 ) ) ( not ( = ?auto_1057565 ?auto_1057571 ) ) ( not ( = ?auto_1057564 ?auto_1057566 ) ) ( not ( = ?auto_1057564 ?auto_1057567 ) ) ( not ( = ?auto_1057564 ?auto_1057568 ) ) ( not ( = ?auto_1057564 ?auto_1057571 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057566 ?auto_1057567 ?auto_1057568 )
      ( MAKE-9CRATE-VERIFY ?auto_1057560 ?auto_1057561 ?auto_1057562 ?auto_1057559 ?auto_1057563 ?auto_1057565 ?auto_1057564 ?auto_1057566 ?auto_1057567 ?auto_1057568 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1057575 - SURFACE
      ?auto_1057576 - SURFACE
    )
    :vars
    (
      ?auto_1057577 - HOIST
      ?auto_1057578 - PLACE
      ?auto_1057582 - SURFACE
      ?auto_1057581 - PLACE
      ?auto_1057583 - HOIST
      ?auto_1057579 - SURFACE
      ?auto_1057580 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057577 ?auto_1057578 ) ( IS-CRATE ?auto_1057576 ) ( not ( = ?auto_1057575 ?auto_1057576 ) ) ( not ( = ?auto_1057582 ?auto_1057575 ) ) ( not ( = ?auto_1057582 ?auto_1057576 ) ) ( not ( = ?auto_1057581 ?auto_1057578 ) ) ( HOIST-AT ?auto_1057583 ?auto_1057581 ) ( not ( = ?auto_1057577 ?auto_1057583 ) ) ( SURFACE-AT ?auto_1057576 ?auto_1057581 ) ( ON ?auto_1057576 ?auto_1057579 ) ( CLEAR ?auto_1057576 ) ( not ( = ?auto_1057575 ?auto_1057579 ) ) ( not ( = ?auto_1057576 ?auto_1057579 ) ) ( not ( = ?auto_1057582 ?auto_1057579 ) ) ( SURFACE-AT ?auto_1057582 ?auto_1057578 ) ( CLEAR ?auto_1057582 ) ( IS-CRATE ?auto_1057575 ) ( AVAILABLE ?auto_1057577 ) ( TRUCK-AT ?auto_1057580 ?auto_1057581 ) ( LIFTING ?auto_1057583 ?auto_1057575 ) )
    :subtasks
    ( ( !LOAD ?auto_1057583 ?auto_1057575 ?auto_1057580 ?auto_1057581 )
      ( MAKE-2CRATE ?auto_1057582 ?auto_1057575 ?auto_1057576 )
      ( MAKE-1CRATE-VERIFY ?auto_1057575 ?auto_1057576 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1057584 - SURFACE
      ?auto_1057585 - SURFACE
      ?auto_1057586 - SURFACE
    )
    :vars
    (
      ?auto_1057592 - HOIST
      ?auto_1057590 - PLACE
      ?auto_1057587 - PLACE
      ?auto_1057588 - HOIST
      ?auto_1057591 - SURFACE
      ?auto_1057589 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057592 ?auto_1057590 ) ( IS-CRATE ?auto_1057586 ) ( not ( = ?auto_1057585 ?auto_1057586 ) ) ( not ( = ?auto_1057584 ?auto_1057585 ) ) ( not ( = ?auto_1057584 ?auto_1057586 ) ) ( not ( = ?auto_1057587 ?auto_1057590 ) ) ( HOIST-AT ?auto_1057588 ?auto_1057587 ) ( not ( = ?auto_1057592 ?auto_1057588 ) ) ( SURFACE-AT ?auto_1057586 ?auto_1057587 ) ( ON ?auto_1057586 ?auto_1057591 ) ( CLEAR ?auto_1057586 ) ( not ( = ?auto_1057585 ?auto_1057591 ) ) ( not ( = ?auto_1057586 ?auto_1057591 ) ) ( not ( = ?auto_1057584 ?auto_1057591 ) ) ( SURFACE-AT ?auto_1057584 ?auto_1057590 ) ( CLEAR ?auto_1057584 ) ( IS-CRATE ?auto_1057585 ) ( AVAILABLE ?auto_1057592 ) ( TRUCK-AT ?auto_1057589 ?auto_1057587 ) ( LIFTING ?auto_1057588 ?auto_1057585 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1057585 ?auto_1057586 )
      ( MAKE-2CRATE-VERIFY ?auto_1057584 ?auto_1057585 ?auto_1057586 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1057594 - SURFACE
      ?auto_1057595 - SURFACE
      ?auto_1057596 - SURFACE
      ?auto_1057593 - SURFACE
    )
    :vars
    (
      ?auto_1057601 - HOIST
      ?auto_1057598 - PLACE
      ?auto_1057600 - PLACE
      ?auto_1057597 - HOIST
      ?auto_1057602 - SURFACE
      ?auto_1057599 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057601 ?auto_1057598 ) ( IS-CRATE ?auto_1057593 ) ( not ( = ?auto_1057596 ?auto_1057593 ) ) ( not ( = ?auto_1057595 ?auto_1057596 ) ) ( not ( = ?auto_1057595 ?auto_1057593 ) ) ( not ( = ?auto_1057600 ?auto_1057598 ) ) ( HOIST-AT ?auto_1057597 ?auto_1057600 ) ( not ( = ?auto_1057601 ?auto_1057597 ) ) ( SURFACE-AT ?auto_1057593 ?auto_1057600 ) ( ON ?auto_1057593 ?auto_1057602 ) ( CLEAR ?auto_1057593 ) ( not ( = ?auto_1057596 ?auto_1057602 ) ) ( not ( = ?auto_1057593 ?auto_1057602 ) ) ( not ( = ?auto_1057595 ?auto_1057602 ) ) ( SURFACE-AT ?auto_1057595 ?auto_1057598 ) ( CLEAR ?auto_1057595 ) ( IS-CRATE ?auto_1057596 ) ( AVAILABLE ?auto_1057601 ) ( TRUCK-AT ?auto_1057599 ?auto_1057600 ) ( LIFTING ?auto_1057597 ?auto_1057596 ) ( ON ?auto_1057595 ?auto_1057594 ) ( not ( = ?auto_1057594 ?auto_1057595 ) ) ( not ( = ?auto_1057594 ?auto_1057596 ) ) ( not ( = ?auto_1057594 ?auto_1057593 ) ) ( not ( = ?auto_1057594 ?auto_1057602 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057595 ?auto_1057596 ?auto_1057593 )
      ( MAKE-3CRATE-VERIFY ?auto_1057594 ?auto_1057595 ?auto_1057596 ?auto_1057593 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1057604 - SURFACE
      ?auto_1057605 - SURFACE
      ?auto_1057606 - SURFACE
      ?auto_1057603 - SURFACE
      ?auto_1057607 - SURFACE
    )
    :vars
    (
      ?auto_1057612 - HOIST
      ?auto_1057609 - PLACE
      ?auto_1057611 - PLACE
      ?auto_1057608 - HOIST
      ?auto_1057613 - SURFACE
      ?auto_1057610 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057612 ?auto_1057609 ) ( IS-CRATE ?auto_1057607 ) ( not ( = ?auto_1057603 ?auto_1057607 ) ) ( not ( = ?auto_1057606 ?auto_1057603 ) ) ( not ( = ?auto_1057606 ?auto_1057607 ) ) ( not ( = ?auto_1057611 ?auto_1057609 ) ) ( HOIST-AT ?auto_1057608 ?auto_1057611 ) ( not ( = ?auto_1057612 ?auto_1057608 ) ) ( SURFACE-AT ?auto_1057607 ?auto_1057611 ) ( ON ?auto_1057607 ?auto_1057613 ) ( CLEAR ?auto_1057607 ) ( not ( = ?auto_1057603 ?auto_1057613 ) ) ( not ( = ?auto_1057607 ?auto_1057613 ) ) ( not ( = ?auto_1057606 ?auto_1057613 ) ) ( SURFACE-AT ?auto_1057606 ?auto_1057609 ) ( CLEAR ?auto_1057606 ) ( IS-CRATE ?auto_1057603 ) ( AVAILABLE ?auto_1057612 ) ( TRUCK-AT ?auto_1057610 ?auto_1057611 ) ( LIFTING ?auto_1057608 ?auto_1057603 ) ( ON ?auto_1057605 ?auto_1057604 ) ( ON ?auto_1057606 ?auto_1057605 ) ( not ( = ?auto_1057604 ?auto_1057605 ) ) ( not ( = ?auto_1057604 ?auto_1057606 ) ) ( not ( = ?auto_1057604 ?auto_1057603 ) ) ( not ( = ?auto_1057604 ?auto_1057607 ) ) ( not ( = ?auto_1057604 ?auto_1057613 ) ) ( not ( = ?auto_1057605 ?auto_1057606 ) ) ( not ( = ?auto_1057605 ?auto_1057603 ) ) ( not ( = ?auto_1057605 ?auto_1057607 ) ) ( not ( = ?auto_1057605 ?auto_1057613 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057606 ?auto_1057603 ?auto_1057607 )
      ( MAKE-4CRATE-VERIFY ?auto_1057604 ?auto_1057605 ?auto_1057606 ?auto_1057603 ?auto_1057607 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1057615 - SURFACE
      ?auto_1057616 - SURFACE
      ?auto_1057617 - SURFACE
      ?auto_1057614 - SURFACE
      ?auto_1057618 - SURFACE
      ?auto_1057619 - SURFACE
    )
    :vars
    (
      ?auto_1057624 - HOIST
      ?auto_1057621 - PLACE
      ?auto_1057623 - PLACE
      ?auto_1057620 - HOIST
      ?auto_1057625 - SURFACE
      ?auto_1057622 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057624 ?auto_1057621 ) ( IS-CRATE ?auto_1057619 ) ( not ( = ?auto_1057618 ?auto_1057619 ) ) ( not ( = ?auto_1057614 ?auto_1057618 ) ) ( not ( = ?auto_1057614 ?auto_1057619 ) ) ( not ( = ?auto_1057623 ?auto_1057621 ) ) ( HOIST-AT ?auto_1057620 ?auto_1057623 ) ( not ( = ?auto_1057624 ?auto_1057620 ) ) ( SURFACE-AT ?auto_1057619 ?auto_1057623 ) ( ON ?auto_1057619 ?auto_1057625 ) ( CLEAR ?auto_1057619 ) ( not ( = ?auto_1057618 ?auto_1057625 ) ) ( not ( = ?auto_1057619 ?auto_1057625 ) ) ( not ( = ?auto_1057614 ?auto_1057625 ) ) ( SURFACE-AT ?auto_1057614 ?auto_1057621 ) ( CLEAR ?auto_1057614 ) ( IS-CRATE ?auto_1057618 ) ( AVAILABLE ?auto_1057624 ) ( TRUCK-AT ?auto_1057622 ?auto_1057623 ) ( LIFTING ?auto_1057620 ?auto_1057618 ) ( ON ?auto_1057616 ?auto_1057615 ) ( ON ?auto_1057617 ?auto_1057616 ) ( ON ?auto_1057614 ?auto_1057617 ) ( not ( = ?auto_1057615 ?auto_1057616 ) ) ( not ( = ?auto_1057615 ?auto_1057617 ) ) ( not ( = ?auto_1057615 ?auto_1057614 ) ) ( not ( = ?auto_1057615 ?auto_1057618 ) ) ( not ( = ?auto_1057615 ?auto_1057619 ) ) ( not ( = ?auto_1057615 ?auto_1057625 ) ) ( not ( = ?auto_1057616 ?auto_1057617 ) ) ( not ( = ?auto_1057616 ?auto_1057614 ) ) ( not ( = ?auto_1057616 ?auto_1057618 ) ) ( not ( = ?auto_1057616 ?auto_1057619 ) ) ( not ( = ?auto_1057616 ?auto_1057625 ) ) ( not ( = ?auto_1057617 ?auto_1057614 ) ) ( not ( = ?auto_1057617 ?auto_1057618 ) ) ( not ( = ?auto_1057617 ?auto_1057619 ) ) ( not ( = ?auto_1057617 ?auto_1057625 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057614 ?auto_1057618 ?auto_1057619 )
      ( MAKE-5CRATE-VERIFY ?auto_1057615 ?auto_1057616 ?auto_1057617 ?auto_1057614 ?auto_1057618 ?auto_1057619 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1057627 - SURFACE
      ?auto_1057628 - SURFACE
      ?auto_1057629 - SURFACE
      ?auto_1057626 - SURFACE
      ?auto_1057630 - SURFACE
      ?auto_1057632 - SURFACE
      ?auto_1057631 - SURFACE
    )
    :vars
    (
      ?auto_1057637 - HOIST
      ?auto_1057634 - PLACE
      ?auto_1057636 - PLACE
      ?auto_1057633 - HOIST
      ?auto_1057638 - SURFACE
      ?auto_1057635 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057637 ?auto_1057634 ) ( IS-CRATE ?auto_1057631 ) ( not ( = ?auto_1057632 ?auto_1057631 ) ) ( not ( = ?auto_1057630 ?auto_1057632 ) ) ( not ( = ?auto_1057630 ?auto_1057631 ) ) ( not ( = ?auto_1057636 ?auto_1057634 ) ) ( HOIST-AT ?auto_1057633 ?auto_1057636 ) ( not ( = ?auto_1057637 ?auto_1057633 ) ) ( SURFACE-AT ?auto_1057631 ?auto_1057636 ) ( ON ?auto_1057631 ?auto_1057638 ) ( CLEAR ?auto_1057631 ) ( not ( = ?auto_1057632 ?auto_1057638 ) ) ( not ( = ?auto_1057631 ?auto_1057638 ) ) ( not ( = ?auto_1057630 ?auto_1057638 ) ) ( SURFACE-AT ?auto_1057630 ?auto_1057634 ) ( CLEAR ?auto_1057630 ) ( IS-CRATE ?auto_1057632 ) ( AVAILABLE ?auto_1057637 ) ( TRUCK-AT ?auto_1057635 ?auto_1057636 ) ( LIFTING ?auto_1057633 ?auto_1057632 ) ( ON ?auto_1057628 ?auto_1057627 ) ( ON ?auto_1057629 ?auto_1057628 ) ( ON ?auto_1057626 ?auto_1057629 ) ( ON ?auto_1057630 ?auto_1057626 ) ( not ( = ?auto_1057627 ?auto_1057628 ) ) ( not ( = ?auto_1057627 ?auto_1057629 ) ) ( not ( = ?auto_1057627 ?auto_1057626 ) ) ( not ( = ?auto_1057627 ?auto_1057630 ) ) ( not ( = ?auto_1057627 ?auto_1057632 ) ) ( not ( = ?auto_1057627 ?auto_1057631 ) ) ( not ( = ?auto_1057627 ?auto_1057638 ) ) ( not ( = ?auto_1057628 ?auto_1057629 ) ) ( not ( = ?auto_1057628 ?auto_1057626 ) ) ( not ( = ?auto_1057628 ?auto_1057630 ) ) ( not ( = ?auto_1057628 ?auto_1057632 ) ) ( not ( = ?auto_1057628 ?auto_1057631 ) ) ( not ( = ?auto_1057628 ?auto_1057638 ) ) ( not ( = ?auto_1057629 ?auto_1057626 ) ) ( not ( = ?auto_1057629 ?auto_1057630 ) ) ( not ( = ?auto_1057629 ?auto_1057632 ) ) ( not ( = ?auto_1057629 ?auto_1057631 ) ) ( not ( = ?auto_1057629 ?auto_1057638 ) ) ( not ( = ?auto_1057626 ?auto_1057630 ) ) ( not ( = ?auto_1057626 ?auto_1057632 ) ) ( not ( = ?auto_1057626 ?auto_1057631 ) ) ( not ( = ?auto_1057626 ?auto_1057638 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057630 ?auto_1057632 ?auto_1057631 )
      ( MAKE-6CRATE-VERIFY ?auto_1057627 ?auto_1057628 ?auto_1057629 ?auto_1057626 ?auto_1057630 ?auto_1057632 ?auto_1057631 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1057640 - SURFACE
      ?auto_1057641 - SURFACE
      ?auto_1057642 - SURFACE
      ?auto_1057639 - SURFACE
      ?auto_1057643 - SURFACE
      ?auto_1057645 - SURFACE
      ?auto_1057644 - SURFACE
      ?auto_1057646 - SURFACE
    )
    :vars
    (
      ?auto_1057651 - HOIST
      ?auto_1057648 - PLACE
      ?auto_1057650 - PLACE
      ?auto_1057647 - HOIST
      ?auto_1057652 - SURFACE
      ?auto_1057649 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057651 ?auto_1057648 ) ( IS-CRATE ?auto_1057646 ) ( not ( = ?auto_1057644 ?auto_1057646 ) ) ( not ( = ?auto_1057645 ?auto_1057644 ) ) ( not ( = ?auto_1057645 ?auto_1057646 ) ) ( not ( = ?auto_1057650 ?auto_1057648 ) ) ( HOIST-AT ?auto_1057647 ?auto_1057650 ) ( not ( = ?auto_1057651 ?auto_1057647 ) ) ( SURFACE-AT ?auto_1057646 ?auto_1057650 ) ( ON ?auto_1057646 ?auto_1057652 ) ( CLEAR ?auto_1057646 ) ( not ( = ?auto_1057644 ?auto_1057652 ) ) ( not ( = ?auto_1057646 ?auto_1057652 ) ) ( not ( = ?auto_1057645 ?auto_1057652 ) ) ( SURFACE-AT ?auto_1057645 ?auto_1057648 ) ( CLEAR ?auto_1057645 ) ( IS-CRATE ?auto_1057644 ) ( AVAILABLE ?auto_1057651 ) ( TRUCK-AT ?auto_1057649 ?auto_1057650 ) ( LIFTING ?auto_1057647 ?auto_1057644 ) ( ON ?auto_1057641 ?auto_1057640 ) ( ON ?auto_1057642 ?auto_1057641 ) ( ON ?auto_1057639 ?auto_1057642 ) ( ON ?auto_1057643 ?auto_1057639 ) ( ON ?auto_1057645 ?auto_1057643 ) ( not ( = ?auto_1057640 ?auto_1057641 ) ) ( not ( = ?auto_1057640 ?auto_1057642 ) ) ( not ( = ?auto_1057640 ?auto_1057639 ) ) ( not ( = ?auto_1057640 ?auto_1057643 ) ) ( not ( = ?auto_1057640 ?auto_1057645 ) ) ( not ( = ?auto_1057640 ?auto_1057644 ) ) ( not ( = ?auto_1057640 ?auto_1057646 ) ) ( not ( = ?auto_1057640 ?auto_1057652 ) ) ( not ( = ?auto_1057641 ?auto_1057642 ) ) ( not ( = ?auto_1057641 ?auto_1057639 ) ) ( not ( = ?auto_1057641 ?auto_1057643 ) ) ( not ( = ?auto_1057641 ?auto_1057645 ) ) ( not ( = ?auto_1057641 ?auto_1057644 ) ) ( not ( = ?auto_1057641 ?auto_1057646 ) ) ( not ( = ?auto_1057641 ?auto_1057652 ) ) ( not ( = ?auto_1057642 ?auto_1057639 ) ) ( not ( = ?auto_1057642 ?auto_1057643 ) ) ( not ( = ?auto_1057642 ?auto_1057645 ) ) ( not ( = ?auto_1057642 ?auto_1057644 ) ) ( not ( = ?auto_1057642 ?auto_1057646 ) ) ( not ( = ?auto_1057642 ?auto_1057652 ) ) ( not ( = ?auto_1057639 ?auto_1057643 ) ) ( not ( = ?auto_1057639 ?auto_1057645 ) ) ( not ( = ?auto_1057639 ?auto_1057644 ) ) ( not ( = ?auto_1057639 ?auto_1057646 ) ) ( not ( = ?auto_1057639 ?auto_1057652 ) ) ( not ( = ?auto_1057643 ?auto_1057645 ) ) ( not ( = ?auto_1057643 ?auto_1057644 ) ) ( not ( = ?auto_1057643 ?auto_1057646 ) ) ( not ( = ?auto_1057643 ?auto_1057652 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057645 ?auto_1057644 ?auto_1057646 )
      ( MAKE-7CRATE-VERIFY ?auto_1057640 ?auto_1057641 ?auto_1057642 ?auto_1057639 ?auto_1057643 ?auto_1057645 ?auto_1057644 ?auto_1057646 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1057654 - SURFACE
      ?auto_1057655 - SURFACE
      ?auto_1057656 - SURFACE
      ?auto_1057653 - SURFACE
      ?auto_1057657 - SURFACE
      ?auto_1057659 - SURFACE
      ?auto_1057658 - SURFACE
      ?auto_1057660 - SURFACE
      ?auto_1057661 - SURFACE
    )
    :vars
    (
      ?auto_1057666 - HOIST
      ?auto_1057663 - PLACE
      ?auto_1057665 - PLACE
      ?auto_1057662 - HOIST
      ?auto_1057667 - SURFACE
      ?auto_1057664 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057666 ?auto_1057663 ) ( IS-CRATE ?auto_1057661 ) ( not ( = ?auto_1057660 ?auto_1057661 ) ) ( not ( = ?auto_1057658 ?auto_1057660 ) ) ( not ( = ?auto_1057658 ?auto_1057661 ) ) ( not ( = ?auto_1057665 ?auto_1057663 ) ) ( HOIST-AT ?auto_1057662 ?auto_1057665 ) ( not ( = ?auto_1057666 ?auto_1057662 ) ) ( SURFACE-AT ?auto_1057661 ?auto_1057665 ) ( ON ?auto_1057661 ?auto_1057667 ) ( CLEAR ?auto_1057661 ) ( not ( = ?auto_1057660 ?auto_1057667 ) ) ( not ( = ?auto_1057661 ?auto_1057667 ) ) ( not ( = ?auto_1057658 ?auto_1057667 ) ) ( SURFACE-AT ?auto_1057658 ?auto_1057663 ) ( CLEAR ?auto_1057658 ) ( IS-CRATE ?auto_1057660 ) ( AVAILABLE ?auto_1057666 ) ( TRUCK-AT ?auto_1057664 ?auto_1057665 ) ( LIFTING ?auto_1057662 ?auto_1057660 ) ( ON ?auto_1057655 ?auto_1057654 ) ( ON ?auto_1057656 ?auto_1057655 ) ( ON ?auto_1057653 ?auto_1057656 ) ( ON ?auto_1057657 ?auto_1057653 ) ( ON ?auto_1057659 ?auto_1057657 ) ( ON ?auto_1057658 ?auto_1057659 ) ( not ( = ?auto_1057654 ?auto_1057655 ) ) ( not ( = ?auto_1057654 ?auto_1057656 ) ) ( not ( = ?auto_1057654 ?auto_1057653 ) ) ( not ( = ?auto_1057654 ?auto_1057657 ) ) ( not ( = ?auto_1057654 ?auto_1057659 ) ) ( not ( = ?auto_1057654 ?auto_1057658 ) ) ( not ( = ?auto_1057654 ?auto_1057660 ) ) ( not ( = ?auto_1057654 ?auto_1057661 ) ) ( not ( = ?auto_1057654 ?auto_1057667 ) ) ( not ( = ?auto_1057655 ?auto_1057656 ) ) ( not ( = ?auto_1057655 ?auto_1057653 ) ) ( not ( = ?auto_1057655 ?auto_1057657 ) ) ( not ( = ?auto_1057655 ?auto_1057659 ) ) ( not ( = ?auto_1057655 ?auto_1057658 ) ) ( not ( = ?auto_1057655 ?auto_1057660 ) ) ( not ( = ?auto_1057655 ?auto_1057661 ) ) ( not ( = ?auto_1057655 ?auto_1057667 ) ) ( not ( = ?auto_1057656 ?auto_1057653 ) ) ( not ( = ?auto_1057656 ?auto_1057657 ) ) ( not ( = ?auto_1057656 ?auto_1057659 ) ) ( not ( = ?auto_1057656 ?auto_1057658 ) ) ( not ( = ?auto_1057656 ?auto_1057660 ) ) ( not ( = ?auto_1057656 ?auto_1057661 ) ) ( not ( = ?auto_1057656 ?auto_1057667 ) ) ( not ( = ?auto_1057653 ?auto_1057657 ) ) ( not ( = ?auto_1057653 ?auto_1057659 ) ) ( not ( = ?auto_1057653 ?auto_1057658 ) ) ( not ( = ?auto_1057653 ?auto_1057660 ) ) ( not ( = ?auto_1057653 ?auto_1057661 ) ) ( not ( = ?auto_1057653 ?auto_1057667 ) ) ( not ( = ?auto_1057657 ?auto_1057659 ) ) ( not ( = ?auto_1057657 ?auto_1057658 ) ) ( not ( = ?auto_1057657 ?auto_1057660 ) ) ( not ( = ?auto_1057657 ?auto_1057661 ) ) ( not ( = ?auto_1057657 ?auto_1057667 ) ) ( not ( = ?auto_1057659 ?auto_1057658 ) ) ( not ( = ?auto_1057659 ?auto_1057660 ) ) ( not ( = ?auto_1057659 ?auto_1057661 ) ) ( not ( = ?auto_1057659 ?auto_1057667 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057658 ?auto_1057660 ?auto_1057661 )
      ( MAKE-8CRATE-VERIFY ?auto_1057654 ?auto_1057655 ?auto_1057656 ?auto_1057653 ?auto_1057657 ?auto_1057659 ?auto_1057658 ?auto_1057660 ?auto_1057661 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1057669 - SURFACE
      ?auto_1057670 - SURFACE
      ?auto_1057671 - SURFACE
      ?auto_1057668 - SURFACE
      ?auto_1057672 - SURFACE
      ?auto_1057674 - SURFACE
      ?auto_1057673 - SURFACE
      ?auto_1057675 - SURFACE
      ?auto_1057676 - SURFACE
      ?auto_1057677 - SURFACE
    )
    :vars
    (
      ?auto_1057682 - HOIST
      ?auto_1057679 - PLACE
      ?auto_1057681 - PLACE
      ?auto_1057678 - HOIST
      ?auto_1057683 - SURFACE
      ?auto_1057680 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057682 ?auto_1057679 ) ( IS-CRATE ?auto_1057677 ) ( not ( = ?auto_1057676 ?auto_1057677 ) ) ( not ( = ?auto_1057675 ?auto_1057676 ) ) ( not ( = ?auto_1057675 ?auto_1057677 ) ) ( not ( = ?auto_1057681 ?auto_1057679 ) ) ( HOIST-AT ?auto_1057678 ?auto_1057681 ) ( not ( = ?auto_1057682 ?auto_1057678 ) ) ( SURFACE-AT ?auto_1057677 ?auto_1057681 ) ( ON ?auto_1057677 ?auto_1057683 ) ( CLEAR ?auto_1057677 ) ( not ( = ?auto_1057676 ?auto_1057683 ) ) ( not ( = ?auto_1057677 ?auto_1057683 ) ) ( not ( = ?auto_1057675 ?auto_1057683 ) ) ( SURFACE-AT ?auto_1057675 ?auto_1057679 ) ( CLEAR ?auto_1057675 ) ( IS-CRATE ?auto_1057676 ) ( AVAILABLE ?auto_1057682 ) ( TRUCK-AT ?auto_1057680 ?auto_1057681 ) ( LIFTING ?auto_1057678 ?auto_1057676 ) ( ON ?auto_1057670 ?auto_1057669 ) ( ON ?auto_1057671 ?auto_1057670 ) ( ON ?auto_1057668 ?auto_1057671 ) ( ON ?auto_1057672 ?auto_1057668 ) ( ON ?auto_1057674 ?auto_1057672 ) ( ON ?auto_1057673 ?auto_1057674 ) ( ON ?auto_1057675 ?auto_1057673 ) ( not ( = ?auto_1057669 ?auto_1057670 ) ) ( not ( = ?auto_1057669 ?auto_1057671 ) ) ( not ( = ?auto_1057669 ?auto_1057668 ) ) ( not ( = ?auto_1057669 ?auto_1057672 ) ) ( not ( = ?auto_1057669 ?auto_1057674 ) ) ( not ( = ?auto_1057669 ?auto_1057673 ) ) ( not ( = ?auto_1057669 ?auto_1057675 ) ) ( not ( = ?auto_1057669 ?auto_1057676 ) ) ( not ( = ?auto_1057669 ?auto_1057677 ) ) ( not ( = ?auto_1057669 ?auto_1057683 ) ) ( not ( = ?auto_1057670 ?auto_1057671 ) ) ( not ( = ?auto_1057670 ?auto_1057668 ) ) ( not ( = ?auto_1057670 ?auto_1057672 ) ) ( not ( = ?auto_1057670 ?auto_1057674 ) ) ( not ( = ?auto_1057670 ?auto_1057673 ) ) ( not ( = ?auto_1057670 ?auto_1057675 ) ) ( not ( = ?auto_1057670 ?auto_1057676 ) ) ( not ( = ?auto_1057670 ?auto_1057677 ) ) ( not ( = ?auto_1057670 ?auto_1057683 ) ) ( not ( = ?auto_1057671 ?auto_1057668 ) ) ( not ( = ?auto_1057671 ?auto_1057672 ) ) ( not ( = ?auto_1057671 ?auto_1057674 ) ) ( not ( = ?auto_1057671 ?auto_1057673 ) ) ( not ( = ?auto_1057671 ?auto_1057675 ) ) ( not ( = ?auto_1057671 ?auto_1057676 ) ) ( not ( = ?auto_1057671 ?auto_1057677 ) ) ( not ( = ?auto_1057671 ?auto_1057683 ) ) ( not ( = ?auto_1057668 ?auto_1057672 ) ) ( not ( = ?auto_1057668 ?auto_1057674 ) ) ( not ( = ?auto_1057668 ?auto_1057673 ) ) ( not ( = ?auto_1057668 ?auto_1057675 ) ) ( not ( = ?auto_1057668 ?auto_1057676 ) ) ( not ( = ?auto_1057668 ?auto_1057677 ) ) ( not ( = ?auto_1057668 ?auto_1057683 ) ) ( not ( = ?auto_1057672 ?auto_1057674 ) ) ( not ( = ?auto_1057672 ?auto_1057673 ) ) ( not ( = ?auto_1057672 ?auto_1057675 ) ) ( not ( = ?auto_1057672 ?auto_1057676 ) ) ( not ( = ?auto_1057672 ?auto_1057677 ) ) ( not ( = ?auto_1057672 ?auto_1057683 ) ) ( not ( = ?auto_1057674 ?auto_1057673 ) ) ( not ( = ?auto_1057674 ?auto_1057675 ) ) ( not ( = ?auto_1057674 ?auto_1057676 ) ) ( not ( = ?auto_1057674 ?auto_1057677 ) ) ( not ( = ?auto_1057674 ?auto_1057683 ) ) ( not ( = ?auto_1057673 ?auto_1057675 ) ) ( not ( = ?auto_1057673 ?auto_1057676 ) ) ( not ( = ?auto_1057673 ?auto_1057677 ) ) ( not ( = ?auto_1057673 ?auto_1057683 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057675 ?auto_1057676 ?auto_1057677 )
      ( MAKE-9CRATE-VERIFY ?auto_1057669 ?auto_1057670 ?auto_1057671 ?auto_1057668 ?auto_1057672 ?auto_1057674 ?auto_1057673 ?auto_1057675 ?auto_1057676 ?auto_1057677 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1057684 - SURFACE
      ?auto_1057685 - SURFACE
    )
    :vars
    (
      ?auto_1057691 - HOIST
      ?auto_1057687 - PLACE
      ?auto_1057690 - SURFACE
      ?auto_1057689 - PLACE
      ?auto_1057686 - HOIST
      ?auto_1057692 - SURFACE
      ?auto_1057688 - TRUCK
      ?auto_1057693 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057691 ?auto_1057687 ) ( IS-CRATE ?auto_1057685 ) ( not ( = ?auto_1057684 ?auto_1057685 ) ) ( not ( = ?auto_1057690 ?auto_1057684 ) ) ( not ( = ?auto_1057690 ?auto_1057685 ) ) ( not ( = ?auto_1057689 ?auto_1057687 ) ) ( HOIST-AT ?auto_1057686 ?auto_1057689 ) ( not ( = ?auto_1057691 ?auto_1057686 ) ) ( SURFACE-AT ?auto_1057685 ?auto_1057689 ) ( ON ?auto_1057685 ?auto_1057692 ) ( CLEAR ?auto_1057685 ) ( not ( = ?auto_1057684 ?auto_1057692 ) ) ( not ( = ?auto_1057685 ?auto_1057692 ) ) ( not ( = ?auto_1057690 ?auto_1057692 ) ) ( SURFACE-AT ?auto_1057690 ?auto_1057687 ) ( CLEAR ?auto_1057690 ) ( IS-CRATE ?auto_1057684 ) ( AVAILABLE ?auto_1057691 ) ( TRUCK-AT ?auto_1057688 ?auto_1057689 ) ( AVAILABLE ?auto_1057686 ) ( SURFACE-AT ?auto_1057684 ?auto_1057689 ) ( ON ?auto_1057684 ?auto_1057693 ) ( CLEAR ?auto_1057684 ) ( not ( = ?auto_1057684 ?auto_1057693 ) ) ( not ( = ?auto_1057685 ?auto_1057693 ) ) ( not ( = ?auto_1057690 ?auto_1057693 ) ) ( not ( = ?auto_1057692 ?auto_1057693 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1057686 ?auto_1057684 ?auto_1057693 ?auto_1057689 )
      ( MAKE-2CRATE ?auto_1057690 ?auto_1057684 ?auto_1057685 )
      ( MAKE-1CRATE-VERIFY ?auto_1057684 ?auto_1057685 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1057694 - SURFACE
      ?auto_1057695 - SURFACE
      ?auto_1057696 - SURFACE
    )
    :vars
    (
      ?auto_1057698 - HOIST
      ?auto_1057699 - PLACE
      ?auto_1057702 - PLACE
      ?auto_1057703 - HOIST
      ?auto_1057701 - SURFACE
      ?auto_1057697 - TRUCK
      ?auto_1057700 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057698 ?auto_1057699 ) ( IS-CRATE ?auto_1057696 ) ( not ( = ?auto_1057695 ?auto_1057696 ) ) ( not ( = ?auto_1057694 ?auto_1057695 ) ) ( not ( = ?auto_1057694 ?auto_1057696 ) ) ( not ( = ?auto_1057702 ?auto_1057699 ) ) ( HOIST-AT ?auto_1057703 ?auto_1057702 ) ( not ( = ?auto_1057698 ?auto_1057703 ) ) ( SURFACE-AT ?auto_1057696 ?auto_1057702 ) ( ON ?auto_1057696 ?auto_1057701 ) ( CLEAR ?auto_1057696 ) ( not ( = ?auto_1057695 ?auto_1057701 ) ) ( not ( = ?auto_1057696 ?auto_1057701 ) ) ( not ( = ?auto_1057694 ?auto_1057701 ) ) ( SURFACE-AT ?auto_1057694 ?auto_1057699 ) ( CLEAR ?auto_1057694 ) ( IS-CRATE ?auto_1057695 ) ( AVAILABLE ?auto_1057698 ) ( TRUCK-AT ?auto_1057697 ?auto_1057702 ) ( AVAILABLE ?auto_1057703 ) ( SURFACE-AT ?auto_1057695 ?auto_1057702 ) ( ON ?auto_1057695 ?auto_1057700 ) ( CLEAR ?auto_1057695 ) ( not ( = ?auto_1057695 ?auto_1057700 ) ) ( not ( = ?auto_1057696 ?auto_1057700 ) ) ( not ( = ?auto_1057694 ?auto_1057700 ) ) ( not ( = ?auto_1057701 ?auto_1057700 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1057695 ?auto_1057696 )
      ( MAKE-2CRATE-VERIFY ?auto_1057694 ?auto_1057695 ?auto_1057696 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1057705 - SURFACE
      ?auto_1057706 - SURFACE
      ?auto_1057707 - SURFACE
      ?auto_1057704 - SURFACE
    )
    :vars
    (
      ?auto_1057713 - HOIST
      ?auto_1057712 - PLACE
      ?auto_1057711 - PLACE
      ?auto_1057708 - HOIST
      ?auto_1057709 - SURFACE
      ?auto_1057710 - TRUCK
      ?auto_1057714 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057713 ?auto_1057712 ) ( IS-CRATE ?auto_1057704 ) ( not ( = ?auto_1057707 ?auto_1057704 ) ) ( not ( = ?auto_1057706 ?auto_1057707 ) ) ( not ( = ?auto_1057706 ?auto_1057704 ) ) ( not ( = ?auto_1057711 ?auto_1057712 ) ) ( HOIST-AT ?auto_1057708 ?auto_1057711 ) ( not ( = ?auto_1057713 ?auto_1057708 ) ) ( SURFACE-AT ?auto_1057704 ?auto_1057711 ) ( ON ?auto_1057704 ?auto_1057709 ) ( CLEAR ?auto_1057704 ) ( not ( = ?auto_1057707 ?auto_1057709 ) ) ( not ( = ?auto_1057704 ?auto_1057709 ) ) ( not ( = ?auto_1057706 ?auto_1057709 ) ) ( SURFACE-AT ?auto_1057706 ?auto_1057712 ) ( CLEAR ?auto_1057706 ) ( IS-CRATE ?auto_1057707 ) ( AVAILABLE ?auto_1057713 ) ( TRUCK-AT ?auto_1057710 ?auto_1057711 ) ( AVAILABLE ?auto_1057708 ) ( SURFACE-AT ?auto_1057707 ?auto_1057711 ) ( ON ?auto_1057707 ?auto_1057714 ) ( CLEAR ?auto_1057707 ) ( not ( = ?auto_1057707 ?auto_1057714 ) ) ( not ( = ?auto_1057704 ?auto_1057714 ) ) ( not ( = ?auto_1057706 ?auto_1057714 ) ) ( not ( = ?auto_1057709 ?auto_1057714 ) ) ( ON ?auto_1057706 ?auto_1057705 ) ( not ( = ?auto_1057705 ?auto_1057706 ) ) ( not ( = ?auto_1057705 ?auto_1057707 ) ) ( not ( = ?auto_1057705 ?auto_1057704 ) ) ( not ( = ?auto_1057705 ?auto_1057709 ) ) ( not ( = ?auto_1057705 ?auto_1057714 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057706 ?auto_1057707 ?auto_1057704 )
      ( MAKE-3CRATE-VERIFY ?auto_1057705 ?auto_1057706 ?auto_1057707 ?auto_1057704 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1057716 - SURFACE
      ?auto_1057717 - SURFACE
      ?auto_1057718 - SURFACE
      ?auto_1057715 - SURFACE
      ?auto_1057719 - SURFACE
    )
    :vars
    (
      ?auto_1057725 - HOIST
      ?auto_1057724 - PLACE
      ?auto_1057723 - PLACE
      ?auto_1057720 - HOIST
      ?auto_1057721 - SURFACE
      ?auto_1057722 - TRUCK
      ?auto_1057726 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057725 ?auto_1057724 ) ( IS-CRATE ?auto_1057719 ) ( not ( = ?auto_1057715 ?auto_1057719 ) ) ( not ( = ?auto_1057718 ?auto_1057715 ) ) ( not ( = ?auto_1057718 ?auto_1057719 ) ) ( not ( = ?auto_1057723 ?auto_1057724 ) ) ( HOIST-AT ?auto_1057720 ?auto_1057723 ) ( not ( = ?auto_1057725 ?auto_1057720 ) ) ( SURFACE-AT ?auto_1057719 ?auto_1057723 ) ( ON ?auto_1057719 ?auto_1057721 ) ( CLEAR ?auto_1057719 ) ( not ( = ?auto_1057715 ?auto_1057721 ) ) ( not ( = ?auto_1057719 ?auto_1057721 ) ) ( not ( = ?auto_1057718 ?auto_1057721 ) ) ( SURFACE-AT ?auto_1057718 ?auto_1057724 ) ( CLEAR ?auto_1057718 ) ( IS-CRATE ?auto_1057715 ) ( AVAILABLE ?auto_1057725 ) ( TRUCK-AT ?auto_1057722 ?auto_1057723 ) ( AVAILABLE ?auto_1057720 ) ( SURFACE-AT ?auto_1057715 ?auto_1057723 ) ( ON ?auto_1057715 ?auto_1057726 ) ( CLEAR ?auto_1057715 ) ( not ( = ?auto_1057715 ?auto_1057726 ) ) ( not ( = ?auto_1057719 ?auto_1057726 ) ) ( not ( = ?auto_1057718 ?auto_1057726 ) ) ( not ( = ?auto_1057721 ?auto_1057726 ) ) ( ON ?auto_1057717 ?auto_1057716 ) ( ON ?auto_1057718 ?auto_1057717 ) ( not ( = ?auto_1057716 ?auto_1057717 ) ) ( not ( = ?auto_1057716 ?auto_1057718 ) ) ( not ( = ?auto_1057716 ?auto_1057715 ) ) ( not ( = ?auto_1057716 ?auto_1057719 ) ) ( not ( = ?auto_1057716 ?auto_1057721 ) ) ( not ( = ?auto_1057716 ?auto_1057726 ) ) ( not ( = ?auto_1057717 ?auto_1057718 ) ) ( not ( = ?auto_1057717 ?auto_1057715 ) ) ( not ( = ?auto_1057717 ?auto_1057719 ) ) ( not ( = ?auto_1057717 ?auto_1057721 ) ) ( not ( = ?auto_1057717 ?auto_1057726 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057718 ?auto_1057715 ?auto_1057719 )
      ( MAKE-4CRATE-VERIFY ?auto_1057716 ?auto_1057717 ?auto_1057718 ?auto_1057715 ?auto_1057719 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1057728 - SURFACE
      ?auto_1057729 - SURFACE
      ?auto_1057730 - SURFACE
      ?auto_1057727 - SURFACE
      ?auto_1057731 - SURFACE
      ?auto_1057732 - SURFACE
    )
    :vars
    (
      ?auto_1057738 - HOIST
      ?auto_1057737 - PLACE
      ?auto_1057736 - PLACE
      ?auto_1057733 - HOIST
      ?auto_1057734 - SURFACE
      ?auto_1057735 - TRUCK
      ?auto_1057739 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057738 ?auto_1057737 ) ( IS-CRATE ?auto_1057732 ) ( not ( = ?auto_1057731 ?auto_1057732 ) ) ( not ( = ?auto_1057727 ?auto_1057731 ) ) ( not ( = ?auto_1057727 ?auto_1057732 ) ) ( not ( = ?auto_1057736 ?auto_1057737 ) ) ( HOIST-AT ?auto_1057733 ?auto_1057736 ) ( not ( = ?auto_1057738 ?auto_1057733 ) ) ( SURFACE-AT ?auto_1057732 ?auto_1057736 ) ( ON ?auto_1057732 ?auto_1057734 ) ( CLEAR ?auto_1057732 ) ( not ( = ?auto_1057731 ?auto_1057734 ) ) ( not ( = ?auto_1057732 ?auto_1057734 ) ) ( not ( = ?auto_1057727 ?auto_1057734 ) ) ( SURFACE-AT ?auto_1057727 ?auto_1057737 ) ( CLEAR ?auto_1057727 ) ( IS-CRATE ?auto_1057731 ) ( AVAILABLE ?auto_1057738 ) ( TRUCK-AT ?auto_1057735 ?auto_1057736 ) ( AVAILABLE ?auto_1057733 ) ( SURFACE-AT ?auto_1057731 ?auto_1057736 ) ( ON ?auto_1057731 ?auto_1057739 ) ( CLEAR ?auto_1057731 ) ( not ( = ?auto_1057731 ?auto_1057739 ) ) ( not ( = ?auto_1057732 ?auto_1057739 ) ) ( not ( = ?auto_1057727 ?auto_1057739 ) ) ( not ( = ?auto_1057734 ?auto_1057739 ) ) ( ON ?auto_1057729 ?auto_1057728 ) ( ON ?auto_1057730 ?auto_1057729 ) ( ON ?auto_1057727 ?auto_1057730 ) ( not ( = ?auto_1057728 ?auto_1057729 ) ) ( not ( = ?auto_1057728 ?auto_1057730 ) ) ( not ( = ?auto_1057728 ?auto_1057727 ) ) ( not ( = ?auto_1057728 ?auto_1057731 ) ) ( not ( = ?auto_1057728 ?auto_1057732 ) ) ( not ( = ?auto_1057728 ?auto_1057734 ) ) ( not ( = ?auto_1057728 ?auto_1057739 ) ) ( not ( = ?auto_1057729 ?auto_1057730 ) ) ( not ( = ?auto_1057729 ?auto_1057727 ) ) ( not ( = ?auto_1057729 ?auto_1057731 ) ) ( not ( = ?auto_1057729 ?auto_1057732 ) ) ( not ( = ?auto_1057729 ?auto_1057734 ) ) ( not ( = ?auto_1057729 ?auto_1057739 ) ) ( not ( = ?auto_1057730 ?auto_1057727 ) ) ( not ( = ?auto_1057730 ?auto_1057731 ) ) ( not ( = ?auto_1057730 ?auto_1057732 ) ) ( not ( = ?auto_1057730 ?auto_1057734 ) ) ( not ( = ?auto_1057730 ?auto_1057739 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057727 ?auto_1057731 ?auto_1057732 )
      ( MAKE-5CRATE-VERIFY ?auto_1057728 ?auto_1057729 ?auto_1057730 ?auto_1057727 ?auto_1057731 ?auto_1057732 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1057741 - SURFACE
      ?auto_1057742 - SURFACE
      ?auto_1057743 - SURFACE
      ?auto_1057740 - SURFACE
      ?auto_1057744 - SURFACE
      ?auto_1057746 - SURFACE
      ?auto_1057745 - SURFACE
    )
    :vars
    (
      ?auto_1057752 - HOIST
      ?auto_1057751 - PLACE
      ?auto_1057750 - PLACE
      ?auto_1057747 - HOIST
      ?auto_1057748 - SURFACE
      ?auto_1057749 - TRUCK
      ?auto_1057753 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057752 ?auto_1057751 ) ( IS-CRATE ?auto_1057745 ) ( not ( = ?auto_1057746 ?auto_1057745 ) ) ( not ( = ?auto_1057744 ?auto_1057746 ) ) ( not ( = ?auto_1057744 ?auto_1057745 ) ) ( not ( = ?auto_1057750 ?auto_1057751 ) ) ( HOIST-AT ?auto_1057747 ?auto_1057750 ) ( not ( = ?auto_1057752 ?auto_1057747 ) ) ( SURFACE-AT ?auto_1057745 ?auto_1057750 ) ( ON ?auto_1057745 ?auto_1057748 ) ( CLEAR ?auto_1057745 ) ( not ( = ?auto_1057746 ?auto_1057748 ) ) ( not ( = ?auto_1057745 ?auto_1057748 ) ) ( not ( = ?auto_1057744 ?auto_1057748 ) ) ( SURFACE-AT ?auto_1057744 ?auto_1057751 ) ( CLEAR ?auto_1057744 ) ( IS-CRATE ?auto_1057746 ) ( AVAILABLE ?auto_1057752 ) ( TRUCK-AT ?auto_1057749 ?auto_1057750 ) ( AVAILABLE ?auto_1057747 ) ( SURFACE-AT ?auto_1057746 ?auto_1057750 ) ( ON ?auto_1057746 ?auto_1057753 ) ( CLEAR ?auto_1057746 ) ( not ( = ?auto_1057746 ?auto_1057753 ) ) ( not ( = ?auto_1057745 ?auto_1057753 ) ) ( not ( = ?auto_1057744 ?auto_1057753 ) ) ( not ( = ?auto_1057748 ?auto_1057753 ) ) ( ON ?auto_1057742 ?auto_1057741 ) ( ON ?auto_1057743 ?auto_1057742 ) ( ON ?auto_1057740 ?auto_1057743 ) ( ON ?auto_1057744 ?auto_1057740 ) ( not ( = ?auto_1057741 ?auto_1057742 ) ) ( not ( = ?auto_1057741 ?auto_1057743 ) ) ( not ( = ?auto_1057741 ?auto_1057740 ) ) ( not ( = ?auto_1057741 ?auto_1057744 ) ) ( not ( = ?auto_1057741 ?auto_1057746 ) ) ( not ( = ?auto_1057741 ?auto_1057745 ) ) ( not ( = ?auto_1057741 ?auto_1057748 ) ) ( not ( = ?auto_1057741 ?auto_1057753 ) ) ( not ( = ?auto_1057742 ?auto_1057743 ) ) ( not ( = ?auto_1057742 ?auto_1057740 ) ) ( not ( = ?auto_1057742 ?auto_1057744 ) ) ( not ( = ?auto_1057742 ?auto_1057746 ) ) ( not ( = ?auto_1057742 ?auto_1057745 ) ) ( not ( = ?auto_1057742 ?auto_1057748 ) ) ( not ( = ?auto_1057742 ?auto_1057753 ) ) ( not ( = ?auto_1057743 ?auto_1057740 ) ) ( not ( = ?auto_1057743 ?auto_1057744 ) ) ( not ( = ?auto_1057743 ?auto_1057746 ) ) ( not ( = ?auto_1057743 ?auto_1057745 ) ) ( not ( = ?auto_1057743 ?auto_1057748 ) ) ( not ( = ?auto_1057743 ?auto_1057753 ) ) ( not ( = ?auto_1057740 ?auto_1057744 ) ) ( not ( = ?auto_1057740 ?auto_1057746 ) ) ( not ( = ?auto_1057740 ?auto_1057745 ) ) ( not ( = ?auto_1057740 ?auto_1057748 ) ) ( not ( = ?auto_1057740 ?auto_1057753 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057744 ?auto_1057746 ?auto_1057745 )
      ( MAKE-6CRATE-VERIFY ?auto_1057741 ?auto_1057742 ?auto_1057743 ?auto_1057740 ?auto_1057744 ?auto_1057746 ?auto_1057745 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1057755 - SURFACE
      ?auto_1057756 - SURFACE
      ?auto_1057757 - SURFACE
      ?auto_1057754 - SURFACE
      ?auto_1057758 - SURFACE
      ?auto_1057760 - SURFACE
      ?auto_1057759 - SURFACE
      ?auto_1057761 - SURFACE
    )
    :vars
    (
      ?auto_1057767 - HOIST
      ?auto_1057766 - PLACE
      ?auto_1057765 - PLACE
      ?auto_1057762 - HOIST
      ?auto_1057763 - SURFACE
      ?auto_1057764 - TRUCK
      ?auto_1057768 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057767 ?auto_1057766 ) ( IS-CRATE ?auto_1057761 ) ( not ( = ?auto_1057759 ?auto_1057761 ) ) ( not ( = ?auto_1057760 ?auto_1057759 ) ) ( not ( = ?auto_1057760 ?auto_1057761 ) ) ( not ( = ?auto_1057765 ?auto_1057766 ) ) ( HOIST-AT ?auto_1057762 ?auto_1057765 ) ( not ( = ?auto_1057767 ?auto_1057762 ) ) ( SURFACE-AT ?auto_1057761 ?auto_1057765 ) ( ON ?auto_1057761 ?auto_1057763 ) ( CLEAR ?auto_1057761 ) ( not ( = ?auto_1057759 ?auto_1057763 ) ) ( not ( = ?auto_1057761 ?auto_1057763 ) ) ( not ( = ?auto_1057760 ?auto_1057763 ) ) ( SURFACE-AT ?auto_1057760 ?auto_1057766 ) ( CLEAR ?auto_1057760 ) ( IS-CRATE ?auto_1057759 ) ( AVAILABLE ?auto_1057767 ) ( TRUCK-AT ?auto_1057764 ?auto_1057765 ) ( AVAILABLE ?auto_1057762 ) ( SURFACE-AT ?auto_1057759 ?auto_1057765 ) ( ON ?auto_1057759 ?auto_1057768 ) ( CLEAR ?auto_1057759 ) ( not ( = ?auto_1057759 ?auto_1057768 ) ) ( not ( = ?auto_1057761 ?auto_1057768 ) ) ( not ( = ?auto_1057760 ?auto_1057768 ) ) ( not ( = ?auto_1057763 ?auto_1057768 ) ) ( ON ?auto_1057756 ?auto_1057755 ) ( ON ?auto_1057757 ?auto_1057756 ) ( ON ?auto_1057754 ?auto_1057757 ) ( ON ?auto_1057758 ?auto_1057754 ) ( ON ?auto_1057760 ?auto_1057758 ) ( not ( = ?auto_1057755 ?auto_1057756 ) ) ( not ( = ?auto_1057755 ?auto_1057757 ) ) ( not ( = ?auto_1057755 ?auto_1057754 ) ) ( not ( = ?auto_1057755 ?auto_1057758 ) ) ( not ( = ?auto_1057755 ?auto_1057760 ) ) ( not ( = ?auto_1057755 ?auto_1057759 ) ) ( not ( = ?auto_1057755 ?auto_1057761 ) ) ( not ( = ?auto_1057755 ?auto_1057763 ) ) ( not ( = ?auto_1057755 ?auto_1057768 ) ) ( not ( = ?auto_1057756 ?auto_1057757 ) ) ( not ( = ?auto_1057756 ?auto_1057754 ) ) ( not ( = ?auto_1057756 ?auto_1057758 ) ) ( not ( = ?auto_1057756 ?auto_1057760 ) ) ( not ( = ?auto_1057756 ?auto_1057759 ) ) ( not ( = ?auto_1057756 ?auto_1057761 ) ) ( not ( = ?auto_1057756 ?auto_1057763 ) ) ( not ( = ?auto_1057756 ?auto_1057768 ) ) ( not ( = ?auto_1057757 ?auto_1057754 ) ) ( not ( = ?auto_1057757 ?auto_1057758 ) ) ( not ( = ?auto_1057757 ?auto_1057760 ) ) ( not ( = ?auto_1057757 ?auto_1057759 ) ) ( not ( = ?auto_1057757 ?auto_1057761 ) ) ( not ( = ?auto_1057757 ?auto_1057763 ) ) ( not ( = ?auto_1057757 ?auto_1057768 ) ) ( not ( = ?auto_1057754 ?auto_1057758 ) ) ( not ( = ?auto_1057754 ?auto_1057760 ) ) ( not ( = ?auto_1057754 ?auto_1057759 ) ) ( not ( = ?auto_1057754 ?auto_1057761 ) ) ( not ( = ?auto_1057754 ?auto_1057763 ) ) ( not ( = ?auto_1057754 ?auto_1057768 ) ) ( not ( = ?auto_1057758 ?auto_1057760 ) ) ( not ( = ?auto_1057758 ?auto_1057759 ) ) ( not ( = ?auto_1057758 ?auto_1057761 ) ) ( not ( = ?auto_1057758 ?auto_1057763 ) ) ( not ( = ?auto_1057758 ?auto_1057768 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057760 ?auto_1057759 ?auto_1057761 )
      ( MAKE-7CRATE-VERIFY ?auto_1057755 ?auto_1057756 ?auto_1057757 ?auto_1057754 ?auto_1057758 ?auto_1057760 ?auto_1057759 ?auto_1057761 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1057770 - SURFACE
      ?auto_1057771 - SURFACE
      ?auto_1057772 - SURFACE
      ?auto_1057769 - SURFACE
      ?auto_1057773 - SURFACE
      ?auto_1057775 - SURFACE
      ?auto_1057774 - SURFACE
      ?auto_1057776 - SURFACE
      ?auto_1057777 - SURFACE
    )
    :vars
    (
      ?auto_1057783 - HOIST
      ?auto_1057782 - PLACE
      ?auto_1057781 - PLACE
      ?auto_1057778 - HOIST
      ?auto_1057779 - SURFACE
      ?auto_1057780 - TRUCK
      ?auto_1057784 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057783 ?auto_1057782 ) ( IS-CRATE ?auto_1057777 ) ( not ( = ?auto_1057776 ?auto_1057777 ) ) ( not ( = ?auto_1057774 ?auto_1057776 ) ) ( not ( = ?auto_1057774 ?auto_1057777 ) ) ( not ( = ?auto_1057781 ?auto_1057782 ) ) ( HOIST-AT ?auto_1057778 ?auto_1057781 ) ( not ( = ?auto_1057783 ?auto_1057778 ) ) ( SURFACE-AT ?auto_1057777 ?auto_1057781 ) ( ON ?auto_1057777 ?auto_1057779 ) ( CLEAR ?auto_1057777 ) ( not ( = ?auto_1057776 ?auto_1057779 ) ) ( not ( = ?auto_1057777 ?auto_1057779 ) ) ( not ( = ?auto_1057774 ?auto_1057779 ) ) ( SURFACE-AT ?auto_1057774 ?auto_1057782 ) ( CLEAR ?auto_1057774 ) ( IS-CRATE ?auto_1057776 ) ( AVAILABLE ?auto_1057783 ) ( TRUCK-AT ?auto_1057780 ?auto_1057781 ) ( AVAILABLE ?auto_1057778 ) ( SURFACE-AT ?auto_1057776 ?auto_1057781 ) ( ON ?auto_1057776 ?auto_1057784 ) ( CLEAR ?auto_1057776 ) ( not ( = ?auto_1057776 ?auto_1057784 ) ) ( not ( = ?auto_1057777 ?auto_1057784 ) ) ( not ( = ?auto_1057774 ?auto_1057784 ) ) ( not ( = ?auto_1057779 ?auto_1057784 ) ) ( ON ?auto_1057771 ?auto_1057770 ) ( ON ?auto_1057772 ?auto_1057771 ) ( ON ?auto_1057769 ?auto_1057772 ) ( ON ?auto_1057773 ?auto_1057769 ) ( ON ?auto_1057775 ?auto_1057773 ) ( ON ?auto_1057774 ?auto_1057775 ) ( not ( = ?auto_1057770 ?auto_1057771 ) ) ( not ( = ?auto_1057770 ?auto_1057772 ) ) ( not ( = ?auto_1057770 ?auto_1057769 ) ) ( not ( = ?auto_1057770 ?auto_1057773 ) ) ( not ( = ?auto_1057770 ?auto_1057775 ) ) ( not ( = ?auto_1057770 ?auto_1057774 ) ) ( not ( = ?auto_1057770 ?auto_1057776 ) ) ( not ( = ?auto_1057770 ?auto_1057777 ) ) ( not ( = ?auto_1057770 ?auto_1057779 ) ) ( not ( = ?auto_1057770 ?auto_1057784 ) ) ( not ( = ?auto_1057771 ?auto_1057772 ) ) ( not ( = ?auto_1057771 ?auto_1057769 ) ) ( not ( = ?auto_1057771 ?auto_1057773 ) ) ( not ( = ?auto_1057771 ?auto_1057775 ) ) ( not ( = ?auto_1057771 ?auto_1057774 ) ) ( not ( = ?auto_1057771 ?auto_1057776 ) ) ( not ( = ?auto_1057771 ?auto_1057777 ) ) ( not ( = ?auto_1057771 ?auto_1057779 ) ) ( not ( = ?auto_1057771 ?auto_1057784 ) ) ( not ( = ?auto_1057772 ?auto_1057769 ) ) ( not ( = ?auto_1057772 ?auto_1057773 ) ) ( not ( = ?auto_1057772 ?auto_1057775 ) ) ( not ( = ?auto_1057772 ?auto_1057774 ) ) ( not ( = ?auto_1057772 ?auto_1057776 ) ) ( not ( = ?auto_1057772 ?auto_1057777 ) ) ( not ( = ?auto_1057772 ?auto_1057779 ) ) ( not ( = ?auto_1057772 ?auto_1057784 ) ) ( not ( = ?auto_1057769 ?auto_1057773 ) ) ( not ( = ?auto_1057769 ?auto_1057775 ) ) ( not ( = ?auto_1057769 ?auto_1057774 ) ) ( not ( = ?auto_1057769 ?auto_1057776 ) ) ( not ( = ?auto_1057769 ?auto_1057777 ) ) ( not ( = ?auto_1057769 ?auto_1057779 ) ) ( not ( = ?auto_1057769 ?auto_1057784 ) ) ( not ( = ?auto_1057773 ?auto_1057775 ) ) ( not ( = ?auto_1057773 ?auto_1057774 ) ) ( not ( = ?auto_1057773 ?auto_1057776 ) ) ( not ( = ?auto_1057773 ?auto_1057777 ) ) ( not ( = ?auto_1057773 ?auto_1057779 ) ) ( not ( = ?auto_1057773 ?auto_1057784 ) ) ( not ( = ?auto_1057775 ?auto_1057774 ) ) ( not ( = ?auto_1057775 ?auto_1057776 ) ) ( not ( = ?auto_1057775 ?auto_1057777 ) ) ( not ( = ?auto_1057775 ?auto_1057779 ) ) ( not ( = ?auto_1057775 ?auto_1057784 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057774 ?auto_1057776 ?auto_1057777 )
      ( MAKE-8CRATE-VERIFY ?auto_1057770 ?auto_1057771 ?auto_1057772 ?auto_1057769 ?auto_1057773 ?auto_1057775 ?auto_1057774 ?auto_1057776 ?auto_1057777 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1057786 - SURFACE
      ?auto_1057787 - SURFACE
      ?auto_1057788 - SURFACE
      ?auto_1057785 - SURFACE
      ?auto_1057789 - SURFACE
      ?auto_1057791 - SURFACE
      ?auto_1057790 - SURFACE
      ?auto_1057792 - SURFACE
      ?auto_1057793 - SURFACE
      ?auto_1057794 - SURFACE
    )
    :vars
    (
      ?auto_1057800 - HOIST
      ?auto_1057799 - PLACE
      ?auto_1057798 - PLACE
      ?auto_1057795 - HOIST
      ?auto_1057796 - SURFACE
      ?auto_1057797 - TRUCK
      ?auto_1057801 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057800 ?auto_1057799 ) ( IS-CRATE ?auto_1057794 ) ( not ( = ?auto_1057793 ?auto_1057794 ) ) ( not ( = ?auto_1057792 ?auto_1057793 ) ) ( not ( = ?auto_1057792 ?auto_1057794 ) ) ( not ( = ?auto_1057798 ?auto_1057799 ) ) ( HOIST-AT ?auto_1057795 ?auto_1057798 ) ( not ( = ?auto_1057800 ?auto_1057795 ) ) ( SURFACE-AT ?auto_1057794 ?auto_1057798 ) ( ON ?auto_1057794 ?auto_1057796 ) ( CLEAR ?auto_1057794 ) ( not ( = ?auto_1057793 ?auto_1057796 ) ) ( not ( = ?auto_1057794 ?auto_1057796 ) ) ( not ( = ?auto_1057792 ?auto_1057796 ) ) ( SURFACE-AT ?auto_1057792 ?auto_1057799 ) ( CLEAR ?auto_1057792 ) ( IS-CRATE ?auto_1057793 ) ( AVAILABLE ?auto_1057800 ) ( TRUCK-AT ?auto_1057797 ?auto_1057798 ) ( AVAILABLE ?auto_1057795 ) ( SURFACE-AT ?auto_1057793 ?auto_1057798 ) ( ON ?auto_1057793 ?auto_1057801 ) ( CLEAR ?auto_1057793 ) ( not ( = ?auto_1057793 ?auto_1057801 ) ) ( not ( = ?auto_1057794 ?auto_1057801 ) ) ( not ( = ?auto_1057792 ?auto_1057801 ) ) ( not ( = ?auto_1057796 ?auto_1057801 ) ) ( ON ?auto_1057787 ?auto_1057786 ) ( ON ?auto_1057788 ?auto_1057787 ) ( ON ?auto_1057785 ?auto_1057788 ) ( ON ?auto_1057789 ?auto_1057785 ) ( ON ?auto_1057791 ?auto_1057789 ) ( ON ?auto_1057790 ?auto_1057791 ) ( ON ?auto_1057792 ?auto_1057790 ) ( not ( = ?auto_1057786 ?auto_1057787 ) ) ( not ( = ?auto_1057786 ?auto_1057788 ) ) ( not ( = ?auto_1057786 ?auto_1057785 ) ) ( not ( = ?auto_1057786 ?auto_1057789 ) ) ( not ( = ?auto_1057786 ?auto_1057791 ) ) ( not ( = ?auto_1057786 ?auto_1057790 ) ) ( not ( = ?auto_1057786 ?auto_1057792 ) ) ( not ( = ?auto_1057786 ?auto_1057793 ) ) ( not ( = ?auto_1057786 ?auto_1057794 ) ) ( not ( = ?auto_1057786 ?auto_1057796 ) ) ( not ( = ?auto_1057786 ?auto_1057801 ) ) ( not ( = ?auto_1057787 ?auto_1057788 ) ) ( not ( = ?auto_1057787 ?auto_1057785 ) ) ( not ( = ?auto_1057787 ?auto_1057789 ) ) ( not ( = ?auto_1057787 ?auto_1057791 ) ) ( not ( = ?auto_1057787 ?auto_1057790 ) ) ( not ( = ?auto_1057787 ?auto_1057792 ) ) ( not ( = ?auto_1057787 ?auto_1057793 ) ) ( not ( = ?auto_1057787 ?auto_1057794 ) ) ( not ( = ?auto_1057787 ?auto_1057796 ) ) ( not ( = ?auto_1057787 ?auto_1057801 ) ) ( not ( = ?auto_1057788 ?auto_1057785 ) ) ( not ( = ?auto_1057788 ?auto_1057789 ) ) ( not ( = ?auto_1057788 ?auto_1057791 ) ) ( not ( = ?auto_1057788 ?auto_1057790 ) ) ( not ( = ?auto_1057788 ?auto_1057792 ) ) ( not ( = ?auto_1057788 ?auto_1057793 ) ) ( not ( = ?auto_1057788 ?auto_1057794 ) ) ( not ( = ?auto_1057788 ?auto_1057796 ) ) ( not ( = ?auto_1057788 ?auto_1057801 ) ) ( not ( = ?auto_1057785 ?auto_1057789 ) ) ( not ( = ?auto_1057785 ?auto_1057791 ) ) ( not ( = ?auto_1057785 ?auto_1057790 ) ) ( not ( = ?auto_1057785 ?auto_1057792 ) ) ( not ( = ?auto_1057785 ?auto_1057793 ) ) ( not ( = ?auto_1057785 ?auto_1057794 ) ) ( not ( = ?auto_1057785 ?auto_1057796 ) ) ( not ( = ?auto_1057785 ?auto_1057801 ) ) ( not ( = ?auto_1057789 ?auto_1057791 ) ) ( not ( = ?auto_1057789 ?auto_1057790 ) ) ( not ( = ?auto_1057789 ?auto_1057792 ) ) ( not ( = ?auto_1057789 ?auto_1057793 ) ) ( not ( = ?auto_1057789 ?auto_1057794 ) ) ( not ( = ?auto_1057789 ?auto_1057796 ) ) ( not ( = ?auto_1057789 ?auto_1057801 ) ) ( not ( = ?auto_1057791 ?auto_1057790 ) ) ( not ( = ?auto_1057791 ?auto_1057792 ) ) ( not ( = ?auto_1057791 ?auto_1057793 ) ) ( not ( = ?auto_1057791 ?auto_1057794 ) ) ( not ( = ?auto_1057791 ?auto_1057796 ) ) ( not ( = ?auto_1057791 ?auto_1057801 ) ) ( not ( = ?auto_1057790 ?auto_1057792 ) ) ( not ( = ?auto_1057790 ?auto_1057793 ) ) ( not ( = ?auto_1057790 ?auto_1057794 ) ) ( not ( = ?auto_1057790 ?auto_1057796 ) ) ( not ( = ?auto_1057790 ?auto_1057801 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057792 ?auto_1057793 ?auto_1057794 )
      ( MAKE-9CRATE-VERIFY ?auto_1057786 ?auto_1057787 ?auto_1057788 ?auto_1057785 ?auto_1057789 ?auto_1057791 ?auto_1057790 ?auto_1057792 ?auto_1057793 ?auto_1057794 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1057802 - SURFACE
      ?auto_1057803 - SURFACE
    )
    :vars
    (
      ?auto_1057810 - HOIST
      ?auto_1057809 - PLACE
      ?auto_1057808 - SURFACE
      ?auto_1057807 - PLACE
      ?auto_1057804 - HOIST
      ?auto_1057805 - SURFACE
      ?auto_1057811 - SURFACE
      ?auto_1057806 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057810 ?auto_1057809 ) ( IS-CRATE ?auto_1057803 ) ( not ( = ?auto_1057802 ?auto_1057803 ) ) ( not ( = ?auto_1057808 ?auto_1057802 ) ) ( not ( = ?auto_1057808 ?auto_1057803 ) ) ( not ( = ?auto_1057807 ?auto_1057809 ) ) ( HOIST-AT ?auto_1057804 ?auto_1057807 ) ( not ( = ?auto_1057810 ?auto_1057804 ) ) ( SURFACE-AT ?auto_1057803 ?auto_1057807 ) ( ON ?auto_1057803 ?auto_1057805 ) ( CLEAR ?auto_1057803 ) ( not ( = ?auto_1057802 ?auto_1057805 ) ) ( not ( = ?auto_1057803 ?auto_1057805 ) ) ( not ( = ?auto_1057808 ?auto_1057805 ) ) ( SURFACE-AT ?auto_1057808 ?auto_1057809 ) ( CLEAR ?auto_1057808 ) ( IS-CRATE ?auto_1057802 ) ( AVAILABLE ?auto_1057810 ) ( AVAILABLE ?auto_1057804 ) ( SURFACE-AT ?auto_1057802 ?auto_1057807 ) ( ON ?auto_1057802 ?auto_1057811 ) ( CLEAR ?auto_1057802 ) ( not ( = ?auto_1057802 ?auto_1057811 ) ) ( not ( = ?auto_1057803 ?auto_1057811 ) ) ( not ( = ?auto_1057808 ?auto_1057811 ) ) ( not ( = ?auto_1057805 ?auto_1057811 ) ) ( TRUCK-AT ?auto_1057806 ?auto_1057809 ) )
    :subtasks
    ( ( !DRIVE ?auto_1057806 ?auto_1057809 ?auto_1057807 )
      ( MAKE-2CRATE ?auto_1057808 ?auto_1057802 ?auto_1057803 )
      ( MAKE-1CRATE-VERIFY ?auto_1057802 ?auto_1057803 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1057812 - SURFACE
      ?auto_1057813 - SURFACE
      ?auto_1057814 - SURFACE
    )
    :vars
    (
      ?auto_1057817 - HOIST
      ?auto_1057815 - PLACE
      ?auto_1057821 - PLACE
      ?auto_1057820 - HOIST
      ?auto_1057819 - SURFACE
      ?auto_1057818 - SURFACE
      ?auto_1057816 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057817 ?auto_1057815 ) ( IS-CRATE ?auto_1057814 ) ( not ( = ?auto_1057813 ?auto_1057814 ) ) ( not ( = ?auto_1057812 ?auto_1057813 ) ) ( not ( = ?auto_1057812 ?auto_1057814 ) ) ( not ( = ?auto_1057821 ?auto_1057815 ) ) ( HOIST-AT ?auto_1057820 ?auto_1057821 ) ( not ( = ?auto_1057817 ?auto_1057820 ) ) ( SURFACE-AT ?auto_1057814 ?auto_1057821 ) ( ON ?auto_1057814 ?auto_1057819 ) ( CLEAR ?auto_1057814 ) ( not ( = ?auto_1057813 ?auto_1057819 ) ) ( not ( = ?auto_1057814 ?auto_1057819 ) ) ( not ( = ?auto_1057812 ?auto_1057819 ) ) ( SURFACE-AT ?auto_1057812 ?auto_1057815 ) ( CLEAR ?auto_1057812 ) ( IS-CRATE ?auto_1057813 ) ( AVAILABLE ?auto_1057817 ) ( AVAILABLE ?auto_1057820 ) ( SURFACE-AT ?auto_1057813 ?auto_1057821 ) ( ON ?auto_1057813 ?auto_1057818 ) ( CLEAR ?auto_1057813 ) ( not ( = ?auto_1057813 ?auto_1057818 ) ) ( not ( = ?auto_1057814 ?auto_1057818 ) ) ( not ( = ?auto_1057812 ?auto_1057818 ) ) ( not ( = ?auto_1057819 ?auto_1057818 ) ) ( TRUCK-AT ?auto_1057816 ?auto_1057815 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1057813 ?auto_1057814 )
      ( MAKE-2CRATE-VERIFY ?auto_1057812 ?auto_1057813 ?auto_1057814 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1057823 - SURFACE
      ?auto_1057824 - SURFACE
      ?auto_1057825 - SURFACE
      ?auto_1057822 - SURFACE
    )
    :vars
    (
      ?auto_1057830 - HOIST
      ?auto_1057829 - PLACE
      ?auto_1057827 - PLACE
      ?auto_1057831 - HOIST
      ?auto_1057832 - SURFACE
      ?auto_1057826 - SURFACE
      ?auto_1057828 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057830 ?auto_1057829 ) ( IS-CRATE ?auto_1057822 ) ( not ( = ?auto_1057825 ?auto_1057822 ) ) ( not ( = ?auto_1057824 ?auto_1057825 ) ) ( not ( = ?auto_1057824 ?auto_1057822 ) ) ( not ( = ?auto_1057827 ?auto_1057829 ) ) ( HOIST-AT ?auto_1057831 ?auto_1057827 ) ( not ( = ?auto_1057830 ?auto_1057831 ) ) ( SURFACE-AT ?auto_1057822 ?auto_1057827 ) ( ON ?auto_1057822 ?auto_1057832 ) ( CLEAR ?auto_1057822 ) ( not ( = ?auto_1057825 ?auto_1057832 ) ) ( not ( = ?auto_1057822 ?auto_1057832 ) ) ( not ( = ?auto_1057824 ?auto_1057832 ) ) ( SURFACE-AT ?auto_1057824 ?auto_1057829 ) ( CLEAR ?auto_1057824 ) ( IS-CRATE ?auto_1057825 ) ( AVAILABLE ?auto_1057830 ) ( AVAILABLE ?auto_1057831 ) ( SURFACE-AT ?auto_1057825 ?auto_1057827 ) ( ON ?auto_1057825 ?auto_1057826 ) ( CLEAR ?auto_1057825 ) ( not ( = ?auto_1057825 ?auto_1057826 ) ) ( not ( = ?auto_1057822 ?auto_1057826 ) ) ( not ( = ?auto_1057824 ?auto_1057826 ) ) ( not ( = ?auto_1057832 ?auto_1057826 ) ) ( TRUCK-AT ?auto_1057828 ?auto_1057829 ) ( ON ?auto_1057824 ?auto_1057823 ) ( not ( = ?auto_1057823 ?auto_1057824 ) ) ( not ( = ?auto_1057823 ?auto_1057825 ) ) ( not ( = ?auto_1057823 ?auto_1057822 ) ) ( not ( = ?auto_1057823 ?auto_1057832 ) ) ( not ( = ?auto_1057823 ?auto_1057826 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057824 ?auto_1057825 ?auto_1057822 )
      ( MAKE-3CRATE-VERIFY ?auto_1057823 ?auto_1057824 ?auto_1057825 ?auto_1057822 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1057834 - SURFACE
      ?auto_1057835 - SURFACE
      ?auto_1057836 - SURFACE
      ?auto_1057833 - SURFACE
      ?auto_1057837 - SURFACE
    )
    :vars
    (
      ?auto_1057842 - HOIST
      ?auto_1057841 - PLACE
      ?auto_1057839 - PLACE
      ?auto_1057843 - HOIST
      ?auto_1057844 - SURFACE
      ?auto_1057838 - SURFACE
      ?auto_1057840 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057842 ?auto_1057841 ) ( IS-CRATE ?auto_1057837 ) ( not ( = ?auto_1057833 ?auto_1057837 ) ) ( not ( = ?auto_1057836 ?auto_1057833 ) ) ( not ( = ?auto_1057836 ?auto_1057837 ) ) ( not ( = ?auto_1057839 ?auto_1057841 ) ) ( HOIST-AT ?auto_1057843 ?auto_1057839 ) ( not ( = ?auto_1057842 ?auto_1057843 ) ) ( SURFACE-AT ?auto_1057837 ?auto_1057839 ) ( ON ?auto_1057837 ?auto_1057844 ) ( CLEAR ?auto_1057837 ) ( not ( = ?auto_1057833 ?auto_1057844 ) ) ( not ( = ?auto_1057837 ?auto_1057844 ) ) ( not ( = ?auto_1057836 ?auto_1057844 ) ) ( SURFACE-AT ?auto_1057836 ?auto_1057841 ) ( CLEAR ?auto_1057836 ) ( IS-CRATE ?auto_1057833 ) ( AVAILABLE ?auto_1057842 ) ( AVAILABLE ?auto_1057843 ) ( SURFACE-AT ?auto_1057833 ?auto_1057839 ) ( ON ?auto_1057833 ?auto_1057838 ) ( CLEAR ?auto_1057833 ) ( not ( = ?auto_1057833 ?auto_1057838 ) ) ( not ( = ?auto_1057837 ?auto_1057838 ) ) ( not ( = ?auto_1057836 ?auto_1057838 ) ) ( not ( = ?auto_1057844 ?auto_1057838 ) ) ( TRUCK-AT ?auto_1057840 ?auto_1057841 ) ( ON ?auto_1057835 ?auto_1057834 ) ( ON ?auto_1057836 ?auto_1057835 ) ( not ( = ?auto_1057834 ?auto_1057835 ) ) ( not ( = ?auto_1057834 ?auto_1057836 ) ) ( not ( = ?auto_1057834 ?auto_1057833 ) ) ( not ( = ?auto_1057834 ?auto_1057837 ) ) ( not ( = ?auto_1057834 ?auto_1057844 ) ) ( not ( = ?auto_1057834 ?auto_1057838 ) ) ( not ( = ?auto_1057835 ?auto_1057836 ) ) ( not ( = ?auto_1057835 ?auto_1057833 ) ) ( not ( = ?auto_1057835 ?auto_1057837 ) ) ( not ( = ?auto_1057835 ?auto_1057844 ) ) ( not ( = ?auto_1057835 ?auto_1057838 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057836 ?auto_1057833 ?auto_1057837 )
      ( MAKE-4CRATE-VERIFY ?auto_1057834 ?auto_1057835 ?auto_1057836 ?auto_1057833 ?auto_1057837 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1057846 - SURFACE
      ?auto_1057847 - SURFACE
      ?auto_1057848 - SURFACE
      ?auto_1057845 - SURFACE
      ?auto_1057849 - SURFACE
      ?auto_1057850 - SURFACE
    )
    :vars
    (
      ?auto_1057855 - HOIST
      ?auto_1057854 - PLACE
      ?auto_1057852 - PLACE
      ?auto_1057856 - HOIST
      ?auto_1057857 - SURFACE
      ?auto_1057851 - SURFACE
      ?auto_1057853 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057855 ?auto_1057854 ) ( IS-CRATE ?auto_1057850 ) ( not ( = ?auto_1057849 ?auto_1057850 ) ) ( not ( = ?auto_1057845 ?auto_1057849 ) ) ( not ( = ?auto_1057845 ?auto_1057850 ) ) ( not ( = ?auto_1057852 ?auto_1057854 ) ) ( HOIST-AT ?auto_1057856 ?auto_1057852 ) ( not ( = ?auto_1057855 ?auto_1057856 ) ) ( SURFACE-AT ?auto_1057850 ?auto_1057852 ) ( ON ?auto_1057850 ?auto_1057857 ) ( CLEAR ?auto_1057850 ) ( not ( = ?auto_1057849 ?auto_1057857 ) ) ( not ( = ?auto_1057850 ?auto_1057857 ) ) ( not ( = ?auto_1057845 ?auto_1057857 ) ) ( SURFACE-AT ?auto_1057845 ?auto_1057854 ) ( CLEAR ?auto_1057845 ) ( IS-CRATE ?auto_1057849 ) ( AVAILABLE ?auto_1057855 ) ( AVAILABLE ?auto_1057856 ) ( SURFACE-AT ?auto_1057849 ?auto_1057852 ) ( ON ?auto_1057849 ?auto_1057851 ) ( CLEAR ?auto_1057849 ) ( not ( = ?auto_1057849 ?auto_1057851 ) ) ( not ( = ?auto_1057850 ?auto_1057851 ) ) ( not ( = ?auto_1057845 ?auto_1057851 ) ) ( not ( = ?auto_1057857 ?auto_1057851 ) ) ( TRUCK-AT ?auto_1057853 ?auto_1057854 ) ( ON ?auto_1057847 ?auto_1057846 ) ( ON ?auto_1057848 ?auto_1057847 ) ( ON ?auto_1057845 ?auto_1057848 ) ( not ( = ?auto_1057846 ?auto_1057847 ) ) ( not ( = ?auto_1057846 ?auto_1057848 ) ) ( not ( = ?auto_1057846 ?auto_1057845 ) ) ( not ( = ?auto_1057846 ?auto_1057849 ) ) ( not ( = ?auto_1057846 ?auto_1057850 ) ) ( not ( = ?auto_1057846 ?auto_1057857 ) ) ( not ( = ?auto_1057846 ?auto_1057851 ) ) ( not ( = ?auto_1057847 ?auto_1057848 ) ) ( not ( = ?auto_1057847 ?auto_1057845 ) ) ( not ( = ?auto_1057847 ?auto_1057849 ) ) ( not ( = ?auto_1057847 ?auto_1057850 ) ) ( not ( = ?auto_1057847 ?auto_1057857 ) ) ( not ( = ?auto_1057847 ?auto_1057851 ) ) ( not ( = ?auto_1057848 ?auto_1057845 ) ) ( not ( = ?auto_1057848 ?auto_1057849 ) ) ( not ( = ?auto_1057848 ?auto_1057850 ) ) ( not ( = ?auto_1057848 ?auto_1057857 ) ) ( not ( = ?auto_1057848 ?auto_1057851 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057845 ?auto_1057849 ?auto_1057850 )
      ( MAKE-5CRATE-VERIFY ?auto_1057846 ?auto_1057847 ?auto_1057848 ?auto_1057845 ?auto_1057849 ?auto_1057850 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1057859 - SURFACE
      ?auto_1057860 - SURFACE
      ?auto_1057861 - SURFACE
      ?auto_1057858 - SURFACE
      ?auto_1057862 - SURFACE
      ?auto_1057864 - SURFACE
      ?auto_1057863 - SURFACE
    )
    :vars
    (
      ?auto_1057869 - HOIST
      ?auto_1057868 - PLACE
      ?auto_1057866 - PLACE
      ?auto_1057870 - HOIST
      ?auto_1057871 - SURFACE
      ?auto_1057865 - SURFACE
      ?auto_1057867 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057869 ?auto_1057868 ) ( IS-CRATE ?auto_1057863 ) ( not ( = ?auto_1057864 ?auto_1057863 ) ) ( not ( = ?auto_1057862 ?auto_1057864 ) ) ( not ( = ?auto_1057862 ?auto_1057863 ) ) ( not ( = ?auto_1057866 ?auto_1057868 ) ) ( HOIST-AT ?auto_1057870 ?auto_1057866 ) ( not ( = ?auto_1057869 ?auto_1057870 ) ) ( SURFACE-AT ?auto_1057863 ?auto_1057866 ) ( ON ?auto_1057863 ?auto_1057871 ) ( CLEAR ?auto_1057863 ) ( not ( = ?auto_1057864 ?auto_1057871 ) ) ( not ( = ?auto_1057863 ?auto_1057871 ) ) ( not ( = ?auto_1057862 ?auto_1057871 ) ) ( SURFACE-AT ?auto_1057862 ?auto_1057868 ) ( CLEAR ?auto_1057862 ) ( IS-CRATE ?auto_1057864 ) ( AVAILABLE ?auto_1057869 ) ( AVAILABLE ?auto_1057870 ) ( SURFACE-AT ?auto_1057864 ?auto_1057866 ) ( ON ?auto_1057864 ?auto_1057865 ) ( CLEAR ?auto_1057864 ) ( not ( = ?auto_1057864 ?auto_1057865 ) ) ( not ( = ?auto_1057863 ?auto_1057865 ) ) ( not ( = ?auto_1057862 ?auto_1057865 ) ) ( not ( = ?auto_1057871 ?auto_1057865 ) ) ( TRUCK-AT ?auto_1057867 ?auto_1057868 ) ( ON ?auto_1057860 ?auto_1057859 ) ( ON ?auto_1057861 ?auto_1057860 ) ( ON ?auto_1057858 ?auto_1057861 ) ( ON ?auto_1057862 ?auto_1057858 ) ( not ( = ?auto_1057859 ?auto_1057860 ) ) ( not ( = ?auto_1057859 ?auto_1057861 ) ) ( not ( = ?auto_1057859 ?auto_1057858 ) ) ( not ( = ?auto_1057859 ?auto_1057862 ) ) ( not ( = ?auto_1057859 ?auto_1057864 ) ) ( not ( = ?auto_1057859 ?auto_1057863 ) ) ( not ( = ?auto_1057859 ?auto_1057871 ) ) ( not ( = ?auto_1057859 ?auto_1057865 ) ) ( not ( = ?auto_1057860 ?auto_1057861 ) ) ( not ( = ?auto_1057860 ?auto_1057858 ) ) ( not ( = ?auto_1057860 ?auto_1057862 ) ) ( not ( = ?auto_1057860 ?auto_1057864 ) ) ( not ( = ?auto_1057860 ?auto_1057863 ) ) ( not ( = ?auto_1057860 ?auto_1057871 ) ) ( not ( = ?auto_1057860 ?auto_1057865 ) ) ( not ( = ?auto_1057861 ?auto_1057858 ) ) ( not ( = ?auto_1057861 ?auto_1057862 ) ) ( not ( = ?auto_1057861 ?auto_1057864 ) ) ( not ( = ?auto_1057861 ?auto_1057863 ) ) ( not ( = ?auto_1057861 ?auto_1057871 ) ) ( not ( = ?auto_1057861 ?auto_1057865 ) ) ( not ( = ?auto_1057858 ?auto_1057862 ) ) ( not ( = ?auto_1057858 ?auto_1057864 ) ) ( not ( = ?auto_1057858 ?auto_1057863 ) ) ( not ( = ?auto_1057858 ?auto_1057871 ) ) ( not ( = ?auto_1057858 ?auto_1057865 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057862 ?auto_1057864 ?auto_1057863 )
      ( MAKE-6CRATE-VERIFY ?auto_1057859 ?auto_1057860 ?auto_1057861 ?auto_1057858 ?auto_1057862 ?auto_1057864 ?auto_1057863 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1057873 - SURFACE
      ?auto_1057874 - SURFACE
      ?auto_1057875 - SURFACE
      ?auto_1057872 - SURFACE
      ?auto_1057876 - SURFACE
      ?auto_1057878 - SURFACE
      ?auto_1057877 - SURFACE
      ?auto_1057879 - SURFACE
    )
    :vars
    (
      ?auto_1057884 - HOIST
      ?auto_1057883 - PLACE
      ?auto_1057881 - PLACE
      ?auto_1057885 - HOIST
      ?auto_1057886 - SURFACE
      ?auto_1057880 - SURFACE
      ?auto_1057882 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057884 ?auto_1057883 ) ( IS-CRATE ?auto_1057879 ) ( not ( = ?auto_1057877 ?auto_1057879 ) ) ( not ( = ?auto_1057878 ?auto_1057877 ) ) ( not ( = ?auto_1057878 ?auto_1057879 ) ) ( not ( = ?auto_1057881 ?auto_1057883 ) ) ( HOIST-AT ?auto_1057885 ?auto_1057881 ) ( not ( = ?auto_1057884 ?auto_1057885 ) ) ( SURFACE-AT ?auto_1057879 ?auto_1057881 ) ( ON ?auto_1057879 ?auto_1057886 ) ( CLEAR ?auto_1057879 ) ( not ( = ?auto_1057877 ?auto_1057886 ) ) ( not ( = ?auto_1057879 ?auto_1057886 ) ) ( not ( = ?auto_1057878 ?auto_1057886 ) ) ( SURFACE-AT ?auto_1057878 ?auto_1057883 ) ( CLEAR ?auto_1057878 ) ( IS-CRATE ?auto_1057877 ) ( AVAILABLE ?auto_1057884 ) ( AVAILABLE ?auto_1057885 ) ( SURFACE-AT ?auto_1057877 ?auto_1057881 ) ( ON ?auto_1057877 ?auto_1057880 ) ( CLEAR ?auto_1057877 ) ( not ( = ?auto_1057877 ?auto_1057880 ) ) ( not ( = ?auto_1057879 ?auto_1057880 ) ) ( not ( = ?auto_1057878 ?auto_1057880 ) ) ( not ( = ?auto_1057886 ?auto_1057880 ) ) ( TRUCK-AT ?auto_1057882 ?auto_1057883 ) ( ON ?auto_1057874 ?auto_1057873 ) ( ON ?auto_1057875 ?auto_1057874 ) ( ON ?auto_1057872 ?auto_1057875 ) ( ON ?auto_1057876 ?auto_1057872 ) ( ON ?auto_1057878 ?auto_1057876 ) ( not ( = ?auto_1057873 ?auto_1057874 ) ) ( not ( = ?auto_1057873 ?auto_1057875 ) ) ( not ( = ?auto_1057873 ?auto_1057872 ) ) ( not ( = ?auto_1057873 ?auto_1057876 ) ) ( not ( = ?auto_1057873 ?auto_1057878 ) ) ( not ( = ?auto_1057873 ?auto_1057877 ) ) ( not ( = ?auto_1057873 ?auto_1057879 ) ) ( not ( = ?auto_1057873 ?auto_1057886 ) ) ( not ( = ?auto_1057873 ?auto_1057880 ) ) ( not ( = ?auto_1057874 ?auto_1057875 ) ) ( not ( = ?auto_1057874 ?auto_1057872 ) ) ( not ( = ?auto_1057874 ?auto_1057876 ) ) ( not ( = ?auto_1057874 ?auto_1057878 ) ) ( not ( = ?auto_1057874 ?auto_1057877 ) ) ( not ( = ?auto_1057874 ?auto_1057879 ) ) ( not ( = ?auto_1057874 ?auto_1057886 ) ) ( not ( = ?auto_1057874 ?auto_1057880 ) ) ( not ( = ?auto_1057875 ?auto_1057872 ) ) ( not ( = ?auto_1057875 ?auto_1057876 ) ) ( not ( = ?auto_1057875 ?auto_1057878 ) ) ( not ( = ?auto_1057875 ?auto_1057877 ) ) ( not ( = ?auto_1057875 ?auto_1057879 ) ) ( not ( = ?auto_1057875 ?auto_1057886 ) ) ( not ( = ?auto_1057875 ?auto_1057880 ) ) ( not ( = ?auto_1057872 ?auto_1057876 ) ) ( not ( = ?auto_1057872 ?auto_1057878 ) ) ( not ( = ?auto_1057872 ?auto_1057877 ) ) ( not ( = ?auto_1057872 ?auto_1057879 ) ) ( not ( = ?auto_1057872 ?auto_1057886 ) ) ( not ( = ?auto_1057872 ?auto_1057880 ) ) ( not ( = ?auto_1057876 ?auto_1057878 ) ) ( not ( = ?auto_1057876 ?auto_1057877 ) ) ( not ( = ?auto_1057876 ?auto_1057879 ) ) ( not ( = ?auto_1057876 ?auto_1057886 ) ) ( not ( = ?auto_1057876 ?auto_1057880 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057878 ?auto_1057877 ?auto_1057879 )
      ( MAKE-7CRATE-VERIFY ?auto_1057873 ?auto_1057874 ?auto_1057875 ?auto_1057872 ?auto_1057876 ?auto_1057878 ?auto_1057877 ?auto_1057879 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1057888 - SURFACE
      ?auto_1057889 - SURFACE
      ?auto_1057890 - SURFACE
      ?auto_1057887 - SURFACE
      ?auto_1057891 - SURFACE
      ?auto_1057893 - SURFACE
      ?auto_1057892 - SURFACE
      ?auto_1057894 - SURFACE
      ?auto_1057895 - SURFACE
    )
    :vars
    (
      ?auto_1057900 - HOIST
      ?auto_1057899 - PLACE
      ?auto_1057897 - PLACE
      ?auto_1057901 - HOIST
      ?auto_1057902 - SURFACE
      ?auto_1057896 - SURFACE
      ?auto_1057898 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057900 ?auto_1057899 ) ( IS-CRATE ?auto_1057895 ) ( not ( = ?auto_1057894 ?auto_1057895 ) ) ( not ( = ?auto_1057892 ?auto_1057894 ) ) ( not ( = ?auto_1057892 ?auto_1057895 ) ) ( not ( = ?auto_1057897 ?auto_1057899 ) ) ( HOIST-AT ?auto_1057901 ?auto_1057897 ) ( not ( = ?auto_1057900 ?auto_1057901 ) ) ( SURFACE-AT ?auto_1057895 ?auto_1057897 ) ( ON ?auto_1057895 ?auto_1057902 ) ( CLEAR ?auto_1057895 ) ( not ( = ?auto_1057894 ?auto_1057902 ) ) ( not ( = ?auto_1057895 ?auto_1057902 ) ) ( not ( = ?auto_1057892 ?auto_1057902 ) ) ( SURFACE-AT ?auto_1057892 ?auto_1057899 ) ( CLEAR ?auto_1057892 ) ( IS-CRATE ?auto_1057894 ) ( AVAILABLE ?auto_1057900 ) ( AVAILABLE ?auto_1057901 ) ( SURFACE-AT ?auto_1057894 ?auto_1057897 ) ( ON ?auto_1057894 ?auto_1057896 ) ( CLEAR ?auto_1057894 ) ( not ( = ?auto_1057894 ?auto_1057896 ) ) ( not ( = ?auto_1057895 ?auto_1057896 ) ) ( not ( = ?auto_1057892 ?auto_1057896 ) ) ( not ( = ?auto_1057902 ?auto_1057896 ) ) ( TRUCK-AT ?auto_1057898 ?auto_1057899 ) ( ON ?auto_1057889 ?auto_1057888 ) ( ON ?auto_1057890 ?auto_1057889 ) ( ON ?auto_1057887 ?auto_1057890 ) ( ON ?auto_1057891 ?auto_1057887 ) ( ON ?auto_1057893 ?auto_1057891 ) ( ON ?auto_1057892 ?auto_1057893 ) ( not ( = ?auto_1057888 ?auto_1057889 ) ) ( not ( = ?auto_1057888 ?auto_1057890 ) ) ( not ( = ?auto_1057888 ?auto_1057887 ) ) ( not ( = ?auto_1057888 ?auto_1057891 ) ) ( not ( = ?auto_1057888 ?auto_1057893 ) ) ( not ( = ?auto_1057888 ?auto_1057892 ) ) ( not ( = ?auto_1057888 ?auto_1057894 ) ) ( not ( = ?auto_1057888 ?auto_1057895 ) ) ( not ( = ?auto_1057888 ?auto_1057902 ) ) ( not ( = ?auto_1057888 ?auto_1057896 ) ) ( not ( = ?auto_1057889 ?auto_1057890 ) ) ( not ( = ?auto_1057889 ?auto_1057887 ) ) ( not ( = ?auto_1057889 ?auto_1057891 ) ) ( not ( = ?auto_1057889 ?auto_1057893 ) ) ( not ( = ?auto_1057889 ?auto_1057892 ) ) ( not ( = ?auto_1057889 ?auto_1057894 ) ) ( not ( = ?auto_1057889 ?auto_1057895 ) ) ( not ( = ?auto_1057889 ?auto_1057902 ) ) ( not ( = ?auto_1057889 ?auto_1057896 ) ) ( not ( = ?auto_1057890 ?auto_1057887 ) ) ( not ( = ?auto_1057890 ?auto_1057891 ) ) ( not ( = ?auto_1057890 ?auto_1057893 ) ) ( not ( = ?auto_1057890 ?auto_1057892 ) ) ( not ( = ?auto_1057890 ?auto_1057894 ) ) ( not ( = ?auto_1057890 ?auto_1057895 ) ) ( not ( = ?auto_1057890 ?auto_1057902 ) ) ( not ( = ?auto_1057890 ?auto_1057896 ) ) ( not ( = ?auto_1057887 ?auto_1057891 ) ) ( not ( = ?auto_1057887 ?auto_1057893 ) ) ( not ( = ?auto_1057887 ?auto_1057892 ) ) ( not ( = ?auto_1057887 ?auto_1057894 ) ) ( not ( = ?auto_1057887 ?auto_1057895 ) ) ( not ( = ?auto_1057887 ?auto_1057902 ) ) ( not ( = ?auto_1057887 ?auto_1057896 ) ) ( not ( = ?auto_1057891 ?auto_1057893 ) ) ( not ( = ?auto_1057891 ?auto_1057892 ) ) ( not ( = ?auto_1057891 ?auto_1057894 ) ) ( not ( = ?auto_1057891 ?auto_1057895 ) ) ( not ( = ?auto_1057891 ?auto_1057902 ) ) ( not ( = ?auto_1057891 ?auto_1057896 ) ) ( not ( = ?auto_1057893 ?auto_1057892 ) ) ( not ( = ?auto_1057893 ?auto_1057894 ) ) ( not ( = ?auto_1057893 ?auto_1057895 ) ) ( not ( = ?auto_1057893 ?auto_1057902 ) ) ( not ( = ?auto_1057893 ?auto_1057896 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057892 ?auto_1057894 ?auto_1057895 )
      ( MAKE-8CRATE-VERIFY ?auto_1057888 ?auto_1057889 ?auto_1057890 ?auto_1057887 ?auto_1057891 ?auto_1057893 ?auto_1057892 ?auto_1057894 ?auto_1057895 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1057904 - SURFACE
      ?auto_1057905 - SURFACE
      ?auto_1057906 - SURFACE
      ?auto_1057903 - SURFACE
      ?auto_1057907 - SURFACE
      ?auto_1057909 - SURFACE
      ?auto_1057908 - SURFACE
      ?auto_1057910 - SURFACE
      ?auto_1057911 - SURFACE
      ?auto_1057912 - SURFACE
    )
    :vars
    (
      ?auto_1057917 - HOIST
      ?auto_1057916 - PLACE
      ?auto_1057914 - PLACE
      ?auto_1057918 - HOIST
      ?auto_1057919 - SURFACE
      ?auto_1057913 - SURFACE
      ?auto_1057915 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057917 ?auto_1057916 ) ( IS-CRATE ?auto_1057912 ) ( not ( = ?auto_1057911 ?auto_1057912 ) ) ( not ( = ?auto_1057910 ?auto_1057911 ) ) ( not ( = ?auto_1057910 ?auto_1057912 ) ) ( not ( = ?auto_1057914 ?auto_1057916 ) ) ( HOIST-AT ?auto_1057918 ?auto_1057914 ) ( not ( = ?auto_1057917 ?auto_1057918 ) ) ( SURFACE-AT ?auto_1057912 ?auto_1057914 ) ( ON ?auto_1057912 ?auto_1057919 ) ( CLEAR ?auto_1057912 ) ( not ( = ?auto_1057911 ?auto_1057919 ) ) ( not ( = ?auto_1057912 ?auto_1057919 ) ) ( not ( = ?auto_1057910 ?auto_1057919 ) ) ( SURFACE-AT ?auto_1057910 ?auto_1057916 ) ( CLEAR ?auto_1057910 ) ( IS-CRATE ?auto_1057911 ) ( AVAILABLE ?auto_1057917 ) ( AVAILABLE ?auto_1057918 ) ( SURFACE-AT ?auto_1057911 ?auto_1057914 ) ( ON ?auto_1057911 ?auto_1057913 ) ( CLEAR ?auto_1057911 ) ( not ( = ?auto_1057911 ?auto_1057913 ) ) ( not ( = ?auto_1057912 ?auto_1057913 ) ) ( not ( = ?auto_1057910 ?auto_1057913 ) ) ( not ( = ?auto_1057919 ?auto_1057913 ) ) ( TRUCK-AT ?auto_1057915 ?auto_1057916 ) ( ON ?auto_1057905 ?auto_1057904 ) ( ON ?auto_1057906 ?auto_1057905 ) ( ON ?auto_1057903 ?auto_1057906 ) ( ON ?auto_1057907 ?auto_1057903 ) ( ON ?auto_1057909 ?auto_1057907 ) ( ON ?auto_1057908 ?auto_1057909 ) ( ON ?auto_1057910 ?auto_1057908 ) ( not ( = ?auto_1057904 ?auto_1057905 ) ) ( not ( = ?auto_1057904 ?auto_1057906 ) ) ( not ( = ?auto_1057904 ?auto_1057903 ) ) ( not ( = ?auto_1057904 ?auto_1057907 ) ) ( not ( = ?auto_1057904 ?auto_1057909 ) ) ( not ( = ?auto_1057904 ?auto_1057908 ) ) ( not ( = ?auto_1057904 ?auto_1057910 ) ) ( not ( = ?auto_1057904 ?auto_1057911 ) ) ( not ( = ?auto_1057904 ?auto_1057912 ) ) ( not ( = ?auto_1057904 ?auto_1057919 ) ) ( not ( = ?auto_1057904 ?auto_1057913 ) ) ( not ( = ?auto_1057905 ?auto_1057906 ) ) ( not ( = ?auto_1057905 ?auto_1057903 ) ) ( not ( = ?auto_1057905 ?auto_1057907 ) ) ( not ( = ?auto_1057905 ?auto_1057909 ) ) ( not ( = ?auto_1057905 ?auto_1057908 ) ) ( not ( = ?auto_1057905 ?auto_1057910 ) ) ( not ( = ?auto_1057905 ?auto_1057911 ) ) ( not ( = ?auto_1057905 ?auto_1057912 ) ) ( not ( = ?auto_1057905 ?auto_1057919 ) ) ( not ( = ?auto_1057905 ?auto_1057913 ) ) ( not ( = ?auto_1057906 ?auto_1057903 ) ) ( not ( = ?auto_1057906 ?auto_1057907 ) ) ( not ( = ?auto_1057906 ?auto_1057909 ) ) ( not ( = ?auto_1057906 ?auto_1057908 ) ) ( not ( = ?auto_1057906 ?auto_1057910 ) ) ( not ( = ?auto_1057906 ?auto_1057911 ) ) ( not ( = ?auto_1057906 ?auto_1057912 ) ) ( not ( = ?auto_1057906 ?auto_1057919 ) ) ( not ( = ?auto_1057906 ?auto_1057913 ) ) ( not ( = ?auto_1057903 ?auto_1057907 ) ) ( not ( = ?auto_1057903 ?auto_1057909 ) ) ( not ( = ?auto_1057903 ?auto_1057908 ) ) ( not ( = ?auto_1057903 ?auto_1057910 ) ) ( not ( = ?auto_1057903 ?auto_1057911 ) ) ( not ( = ?auto_1057903 ?auto_1057912 ) ) ( not ( = ?auto_1057903 ?auto_1057919 ) ) ( not ( = ?auto_1057903 ?auto_1057913 ) ) ( not ( = ?auto_1057907 ?auto_1057909 ) ) ( not ( = ?auto_1057907 ?auto_1057908 ) ) ( not ( = ?auto_1057907 ?auto_1057910 ) ) ( not ( = ?auto_1057907 ?auto_1057911 ) ) ( not ( = ?auto_1057907 ?auto_1057912 ) ) ( not ( = ?auto_1057907 ?auto_1057919 ) ) ( not ( = ?auto_1057907 ?auto_1057913 ) ) ( not ( = ?auto_1057909 ?auto_1057908 ) ) ( not ( = ?auto_1057909 ?auto_1057910 ) ) ( not ( = ?auto_1057909 ?auto_1057911 ) ) ( not ( = ?auto_1057909 ?auto_1057912 ) ) ( not ( = ?auto_1057909 ?auto_1057919 ) ) ( not ( = ?auto_1057909 ?auto_1057913 ) ) ( not ( = ?auto_1057908 ?auto_1057910 ) ) ( not ( = ?auto_1057908 ?auto_1057911 ) ) ( not ( = ?auto_1057908 ?auto_1057912 ) ) ( not ( = ?auto_1057908 ?auto_1057919 ) ) ( not ( = ?auto_1057908 ?auto_1057913 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057910 ?auto_1057911 ?auto_1057912 )
      ( MAKE-9CRATE-VERIFY ?auto_1057904 ?auto_1057905 ?auto_1057906 ?auto_1057903 ?auto_1057907 ?auto_1057909 ?auto_1057908 ?auto_1057910 ?auto_1057911 ?auto_1057912 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1057920 - SURFACE
      ?auto_1057921 - SURFACE
    )
    :vars
    (
      ?auto_1057927 - HOIST
      ?auto_1057926 - PLACE
      ?auto_1057922 - SURFACE
      ?auto_1057924 - PLACE
      ?auto_1057928 - HOIST
      ?auto_1057929 - SURFACE
      ?auto_1057923 - SURFACE
      ?auto_1057925 - TRUCK
      ?auto_1057930 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057927 ?auto_1057926 ) ( IS-CRATE ?auto_1057921 ) ( not ( = ?auto_1057920 ?auto_1057921 ) ) ( not ( = ?auto_1057922 ?auto_1057920 ) ) ( not ( = ?auto_1057922 ?auto_1057921 ) ) ( not ( = ?auto_1057924 ?auto_1057926 ) ) ( HOIST-AT ?auto_1057928 ?auto_1057924 ) ( not ( = ?auto_1057927 ?auto_1057928 ) ) ( SURFACE-AT ?auto_1057921 ?auto_1057924 ) ( ON ?auto_1057921 ?auto_1057929 ) ( CLEAR ?auto_1057921 ) ( not ( = ?auto_1057920 ?auto_1057929 ) ) ( not ( = ?auto_1057921 ?auto_1057929 ) ) ( not ( = ?auto_1057922 ?auto_1057929 ) ) ( IS-CRATE ?auto_1057920 ) ( AVAILABLE ?auto_1057928 ) ( SURFACE-AT ?auto_1057920 ?auto_1057924 ) ( ON ?auto_1057920 ?auto_1057923 ) ( CLEAR ?auto_1057920 ) ( not ( = ?auto_1057920 ?auto_1057923 ) ) ( not ( = ?auto_1057921 ?auto_1057923 ) ) ( not ( = ?auto_1057922 ?auto_1057923 ) ) ( not ( = ?auto_1057929 ?auto_1057923 ) ) ( TRUCK-AT ?auto_1057925 ?auto_1057926 ) ( SURFACE-AT ?auto_1057930 ?auto_1057926 ) ( CLEAR ?auto_1057930 ) ( LIFTING ?auto_1057927 ?auto_1057922 ) ( IS-CRATE ?auto_1057922 ) ( not ( = ?auto_1057930 ?auto_1057922 ) ) ( not ( = ?auto_1057920 ?auto_1057930 ) ) ( not ( = ?auto_1057921 ?auto_1057930 ) ) ( not ( = ?auto_1057929 ?auto_1057930 ) ) ( not ( = ?auto_1057923 ?auto_1057930 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1057930 ?auto_1057922 )
      ( MAKE-2CRATE ?auto_1057922 ?auto_1057920 ?auto_1057921 )
      ( MAKE-1CRATE-VERIFY ?auto_1057920 ?auto_1057921 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1057931 - SURFACE
      ?auto_1057932 - SURFACE
      ?auto_1057933 - SURFACE
    )
    :vars
    (
      ?auto_1057936 - HOIST
      ?auto_1057937 - PLACE
      ?auto_1057941 - PLACE
      ?auto_1057938 - HOIST
      ?auto_1057939 - SURFACE
      ?auto_1057940 - SURFACE
      ?auto_1057934 - TRUCK
      ?auto_1057935 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057936 ?auto_1057937 ) ( IS-CRATE ?auto_1057933 ) ( not ( = ?auto_1057932 ?auto_1057933 ) ) ( not ( = ?auto_1057931 ?auto_1057932 ) ) ( not ( = ?auto_1057931 ?auto_1057933 ) ) ( not ( = ?auto_1057941 ?auto_1057937 ) ) ( HOIST-AT ?auto_1057938 ?auto_1057941 ) ( not ( = ?auto_1057936 ?auto_1057938 ) ) ( SURFACE-AT ?auto_1057933 ?auto_1057941 ) ( ON ?auto_1057933 ?auto_1057939 ) ( CLEAR ?auto_1057933 ) ( not ( = ?auto_1057932 ?auto_1057939 ) ) ( not ( = ?auto_1057933 ?auto_1057939 ) ) ( not ( = ?auto_1057931 ?auto_1057939 ) ) ( IS-CRATE ?auto_1057932 ) ( AVAILABLE ?auto_1057938 ) ( SURFACE-AT ?auto_1057932 ?auto_1057941 ) ( ON ?auto_1057932 ?auto_1057940 ) ( CLEAR ?auto_1057932 ) ( not ( = ?auto_1057932 ?auto_1057940 ) ) ( not ( = ?auto_1057933 ?auto_1057940 ) ) ( not ( = ?auto_1057931 ?auto_1057940 ) ) ( not ( = ?auto_1057939 ?auto_1057940 ) ) ( TRUCK-AT ?auto_1057934 ?auto_1057937 ) ( SURFACE-AT ?auto_1057935 ?auto_1057937 ) ( CLEAR ?auto_1057935 ) ( LIFTING ?auto_1057936 ?auto_1057931 ) ( IS-CRATE ?auto_1057931 ) ( not ( = ?auto_1057935 ?auto_1057931 ) ) ( not ( = ?auto_1057932 ?auto_1057935 ) ) ( not ( = ?auto_1057933 ?auto_1057935 ) ) ( not ( = ?auto_1057939 ?auto_1057935 ) ) ( not ( = ?auto_1057940 ?auto_1057935 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1057932 ?auto_1057933 )
      ( MAKE-2CRATE-VERIFY ?auto_1057931 ?auto_1057932 ?auto_1057933 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1057943 - SURFACE
      ?auto_1057944 - SURFACE
      ?auto_1057945 - SURFACE
      ?auto_1057942 - SURFACE
    )
    :vars
    (
      ?auto_1057950 - HOIST
      ?auto_1057948 - PLACE
      ?auto_1057949 - PLACE
      ?auto_1057952 - HOIST
      ?auto_1057951 - SURFACE
      ?auto_1057946 - SURFACE
      ?auto_1057947 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057950 ?auto_1057948 ) ( IS-CRATE ?auto_1057942 ) ( not ( = ?auto_1057945 ?auto_1057942 ) ) ( not ( = ?auto_1057944 ?auto_1057945 ) ) ( not ( = ?auto_1057944 ?auto_1057942 ) ) ( not ( = ?auto_1057949 ?auto_1057948 ) ) ( HOIST-AT ?auto_1057952 ?auto_1057949 ) ( not ( = ?auto_1057950 ?auto_1057952 ) ) ( SURFACE-AT ?auto_1057942 ?auto_1057949 ) ( ON ?auto_1057942 ?auto_1057951 ) ( CLEAR ?auto_1057942 ) ( not ( = ?auto_1057945 ?auto_1057951 ) ) ( not ( = ?auto_1057942 ?auto_1057951 ) ) ( not ( = ?auto_1057944 ?auto_1057951 ) ) ( IS-CRATE ?auto_1057945 ) ( AVAILABLE ?auto_1057952 ) ( SURFACE-AT ?auto_1057945 ?auto_1057949 ) ( ON ?auto_1057945 ?auto_1057946 ) ( CLEAR ?auto_1057945 ) ( not ( = ?auto_1057945 ?auto_1057946 ) ) ( not ( = ?auto_1057942 ?auto_1057946 ) ) ( not ( = ?auto_1057944 ?auto_1057946 ) ) ( not ( = ?auto_1057951 ?auto_1057946 ) ) ( TRUCK-AT ?auto_1057947 ?auto_1057948 ) ( SURFACE-AT ?auto_1057943 ?auto_1057948 ) ( CLEAR ?auto_1057943 ) ( LIFTING ?auto_1057950 ?auto_1057944 ) ( IS-CRATE ?auto_1057944 ) ( not ( = ?auto_1057943 ?auto_1057944 ) ) ( not ( = ?auto_1057945 ?auto_1057943 ) ) ( not ( = ?auto_1057942 ?auto_1057943 ) ) ( not ( = ?auto_1057951 ?auto_1057943 ) ) ( not ( = ?auto_1057946 ?auto_1057943 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057944 ?auto_1057945 ?auto_1057942 )
      ( MAKE-3CRATE-VERIFY ?auto_1057943 ?auto_1057944 ?auto_1057945 ?auto_1057942 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1057954 - SURFACE
      ?auto_1057955 - SURFACE
      ?auto_1057956 - SURFACE
      ?auto_1057953 - SURFACE
      ?auto_1057957 - SURFACE
    )
    :vars
    (
      ?auto_1057962 - HOIST
      ?auto_1057960 - PLACE
      ?auto_1057961 - PLACE
      ?auto_1057964 - HOIST
      ?auto_1057963 - SURFACE
      ?auto_1057958 - SURFACE
      ?auto_1057959 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057962 ?auto_1057960 ) ( IS-CRATE ?auto_1057957 ) ( not ( = ?auto_1057953 ?auto_1057957 ) ) ( not ( = ?auto_1057956 ?auto_1057953 ) ) ( not ( = ?auto_1057956 ?auto_1057957 ) ) ( not ( = ?auto_1057961 ?auto_1057960 ) ) ( HOIST-AT ?auto_1057964 ?auto_1057961 ) ( not ( = ?auto_1057962 ?auto_1057964 ) ) ( SURFACE-AT ?auto_1057957 ?auto_1057961 ) ( ON ?auto_1057957 ?auto_1057963 ) ( CLEAR ?auto_1057957 ) ( not ( = ?auto_1057953 ?auto_1057963 ) ) ( not ( = ?auto_1057957 ?auto_1057963 ) ) ( not ( = ?auto_1057956 ?auto_1057963 ) ) ( IS-CRATE ?auto_1057953 ) ( AVAILABLE ?auto_1057964 ) ( SURFACE-AT ?auto_1057953 ?auto_1057961 ) ( ON ?auto_1057953 ?auto_1057958 ) ( CLEAR ?auto_1057953 ) ( not ( = ?auto_1057953 ?auto_1057958 ) ) ( not ( = ?auto_1057957 ?auto_1057958 ) ) ( not ( = ?auto_1057956 ?auto_1057958 ) ) ( not ( = ?auto_1057963 ?auto_1057958 ) ) ( TRUCK-AT ?auto_1057959 ?auto_1057960 ) ( SURFACE-AT ?auto_1057955 ?auto_1057960 ) ( CLEAR ?auto_1057955 ) ( LIFTING ?auto_1057962 ?auto_1057956 ) ( IS-CRATE ?auto_1057956 ) ( not ( = ?auto_1057955 ?auto_1057956 ) ) ( not ( = ?auto_1057953 ?auto_1057955 ) ) ( not ( = ?auto_1057957 ?auto_1057955 ) ) ( not ( = ?auto_1057963 ?auto_1057955 ) ) ( not ( = ?auto_1057958 ?auto_1057955 ) ) ( ON ?auto_1057955 ?auto_1057954 ) ( not ( = ?auto_1057954 ?auto_1057955 ) ) ( not ( = ?auto_1057954 ?auto_1057956 ) ) ( not ( = ?auto_1057954 ?auto_1057953 ) ) ( not ( = ?auto_1057954 ?auto_1057957 ) ) ( not ( = ?auto_1057954 ?auto_1057963 ) ) ( not ( = ?auto_1057954 ?auto_1057958 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057956 ?auto_1057953 ?auto_1057957 )
      ( MAKE-4CRATE-VERIFY ?auto_1057954 ?auto_1057955 ?auto_1057956 ?auto_1057953 ?auto_1057957 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1057966 - SURFACE
      ?auto_1057967 - SURFACE
      ?auto_1057968 - SURFACE
      ?auto_1057965 - SURFACE
      ?auto_1057969 - SURFACE
      ?auto_1057970 - SURFACE
    )
    :vars
    (
      ?auto_1057975 - HOIST
      ?auto_1057973 - PLACE
      ?auto_1057974 - PLACE
      ?auto_1057977 - HOIST
      ?auto_1057976 - SURFACE
      ?auto_1057971 - SURFACE
      ?auto_1057972 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057975 ?auto_1057973 ) ( IS-CRATE ?auto_1057970 ) ( not ( = ?auto_1057969 ?auto_1057970 ) ) ( not ( = ?auto_1057965 ?auto_1057969 ) ) ( not ( = ?auto_1057965 ?auto_1057970 ) ) ( not ( = ?auto_1057974 ?auto_1057973 ) ) ( HOIST-AT ?auto_1057977 ?auto_1057974 ) ( not ( = ?auto_1057975 ?auto_1057977 ) ) ( SURFACE-AT ?auto_1057970 ?auto_1057974 ) ( ON ?auto_1057970 ?auto_1057976 ) ( CLEAR ?auto_1057970 ) ( not ( = ?auto_1057969 ?auto_1057976 ) ) ( not ( = ?auto_1057970 ?auto_1057976 ) ) ( not ( = ?auto_1057965 ?auto_1057976 ) ) ( IS-CRATE ?auto_1057969 ) ( AVAILABLE ?auto_1057977 ) ( SURFACE-AT ?auto_1057969 ?auto_1057974 ) ( ON ?auto_1057969 ?auto_1057971 ) ( CLEAR ?auto_1057969 ) ( not ( = ?auto_1057969 ?auto_1057971 ) ) ( not ( = ?auto_1057970 ?auto_1057971 ) ) ( not ( = ?auto_1057965 ?auto_1057971 ) ) ( not ( = ?auto_1057976 ?auto_1057971 ) ) ( TRUCK-AT ?auto_1057972 ?auto_1057973 ) ( SURFACE-AT ?auto_1057968 ?auto_1057973 ) ( CLEAR ?auto_1057968 ) ( LIFTING ?auto_1057975 ?auto_1057965 ) ( IS-CRATE ?auto_1057965 ) ( not ( = ?auto_1057968 ?auto_1057965 ) ) ( not ( = ?auto_1057969 ?auto_1057968 ) ) ( not ( = ?auto_1057970 ?auto_1057968 ) ) ( not ( = ?auto_1057976 ?auto_1057968 ) ) ( not ( = ?auto_1057971 ?auto_1057968 ) ) ( ON ?auto_1057967 ?auto_1057966 ) ( ON ?auto_1057968 ?auto_1057967 ) ( not ( = ?auto_1057966 ?auto_1057967 ) ) ( not ( = ?auto_1057966 ?auto_1057968 ) ) ( not ( = ?auto_1057966 ?auto_1057965 ) ) ( not ( = ?auto_1057966 ?auto_1057969 ) ) ( not ( = ?auto_1057966 ?auto_1057970 ) ) ( not ( = ?auto_1057966 ?auto_1057976 ) ) ( not ( = ?auto_1057966 ?auto_1057971 ) ) ( not ( = ?auto_1057967 ?auto_1057968 ) ) ( not ( = ?auto_1057967 ?auto_1057965 ) ) ( not ( = ?auto_1057967 ?auto_1057969 ) ) ( not ( = ?auto_1057967 ?auto_1057970 ) ) ( not ( = ?auto_1057967 ?auto_1057976 ) ) ( not ( = ?auto_1057967 ?auto_1057971 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057965 ?auto_1057969 ?auto_1057970 )
      ( MAKE-5CRATE-VERIFY ?auto_1057966 ?auto_1057967 ?auto_1057968 ?auto_1057965 ?auto_1057969 ?auto_1057970 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1057979 - SURFACE
      ?auto_1057980 - SURFACE
      ?auto_1057981 - SURFACE
      ?auto_1057978 - SURFACE
      ?auto_1057982 - SURFACE
      ?auto_1057984 - SURFACE
      ?auto_1057983 - SURFACE
    )
    :vars
    (
      ?auto_1057989 - HOIST
      ?auto_1057987 - PLACE
      ?auto_1057988 - PLACE
      ?auto_1057991 - HOIST
      ?auto_1057990 - SURFACE
      ?auto_1057985 - SURFACE
      ?auto_1057986 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057989 ?auto_1057987 ) ( IS-CRATE ?auto_1057983 ) ( not ( = ?auto_1057984 ?auto_1057983 ) ) ( not ( = ?auto_1057982 ?auto_1057984 ) ) ( not ( = ?auto_1057982 ?auto_1057983 ) ) ( not ( = ?auto_1057988 ?auto_1057987 ) ) ( HOIST-AT ?auto_1057991 ?auto_1057988 ) ( not ( = ?auto_1057989 ?auto_1057991 ) ) ( SURFACE-AT ?auto_1057983 ?auto_1057988 ) ( ON ?auto_1057983 ?auto_1057990 ) ( CLEAR ?auto_1057983 ) ( not ( = ?auto_1057984 ?auto_1057990 ) ) ( not ( = ?auto_1057983 ?auto_1057990 ) ) ( not ( = ?auto_1057982 ?auto_1057990 ) ) ( IS-CRATE ?auto_1057984 ) ( AVAILABLE ?auto_1057991 ) ( SURFACE-AT ?auto_1057984 ?auto_1057988 ) ( ON ?auto_1057984 ?auto_1057985 ) ( CLEAR ?auto_1057984 ) ( not ( = ?auto_1057984 ?auto_1057985 ) ) ( not ( = ?auto_1057983 ?auto_1057985 ) ) ( not ( = ?auto_1057982 ?auto_1057985 ) ) ( not ( = ?auto_1057990 ?auto_1057985 ) ) ( TRUCK-AT ?auto_1057986 ?auto_1057987 ) ( SURFACE-AT ?auto_1057978 ?auto_1057987 ) ( CLEAR ?auto_1057978 ) ( LIFTING ?auto_1057989 ?auto_1057982 ) ( IS-CRATE ?auto_1057982 ) ( not ( = ?auto_1057978 ?auto_1057982 ) ) ( not ( = ?auto_1057984 ?auto_1057978 ) ) ( not ( = ?auto_1057983 ?auto_1057978 ) ) ( not ( = ?auto_1057990 ?auto_1057978 ) ) ( not ( = ?auto_1057985 ?auto_1057978 ) ) ( ON ?auto_1057980 ?auto_1057979 ) ( ON ?auto_1057981 ?auto_1057980 ) ( ON ?auto_1057978 ?auto_1057981 ) ( not ( = ?auto_1057979 ?auto_1057980 ) ) ( not ( = ?auto_1057979 ?auto_1057981 ) ) ( not ( = ?auto_1057979 ?auto_1057978 ) ) ( not ( = ?auto_1057979 ?auto_1057982 ) ) ( not ( = ?auto_1057979 ?auto_1057984 ) ) ( not ( = ?auto_1057979 ?auto_1057983 ) ) ( not ( = ?auto_1057979 ?auto_1057990 ) ) ( not ( = ?auto_1057979 ?auto_1057985 ) ) ( not ( = ?auto_1057980 ?auto_1057981 ) ) ( not ( = ?auto_1057980 ?auto_1057978 ) ) ( not ( = ?auto_1057980 ?auto_1057982 ) ) ( not ( = ?auto_1057980 ?auto_1057984 ) ) ( not ( = ?auto_1057980 ?auto_1057983 ) ) ( not ( = ?auto_1057980 ?auto_1057990 ) ) ( not ( = ?auto_1057980 ?auto_1057985 ) ) ( not ( = ?auto_1057981 ?auto_1057978 ) ) ( not ( = ?auto_1057981 ?auto_1057982 ) ) ( not ( = ?auto_1057981 ?auto_1057984 ) ) ( not ( = ?auto_1057981 ?auto_1057983 ) ) ( not ( = ?auto_1057981 ?auto_1057990 ) ) ( not ( = ?auto_1057981 ?auto_1057985 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057982 ?auto_1057984 ?auto_1057983 )
      ( MAKE-6CRATE-VERIFY ?auto_1057979 ?auto_1057980 ?auto_1057981 ?auto_1057978 ?auto_1057982 ?auto_1057984 ?auto_1057983 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1057993 - SURFACE
      ?auto_1057994 - SURFACE
      ?auto_1057995 - SURFACE
      ?auto_1057992 - SURFACE
      ?auto_1057996 - SURFACE
      ?auto_1057998 - SURFACE
      ?auto_1057997 - SURFACE
      ?auto_1057999 - SURFACE
    )
    :vars
    (
      ?auto_1058004 - HOIST
      ?auto_1058002 - PLACE
      ?auto_1058003 - PLACE
      ?auto_1058006 - HOIST
      ?auto_1058005 - SURFACE
      ?auto_1058000 - SURFACE
      ?auto_1058001 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1058004 ?auto_1058002 ) ( IS-CRATE ?auto_1057999 ) ( not ( = ?auto_1057997 ?auto_1057999 ) ) ( not ( = ?auto_1057998 ?auto_1057997 ) ) ( not ( = ?auto_1057998 ?auto_1057999 ) ) ( not ( = ?auto_1058003 ?auto_1058002 ) ) ( HOIST-AT ?auto_1058006 ?auto_1058003 ) ( not ( = ?auto_1058004 ?auto_1058006 ) ) ( SURFACE-AT ?auto_1057999 ?auto_1058003 ) ( ON ?auto_1057999 ?auto_1058005 ) ( CLEAR ?auto_1057999 ) ( not ( = ?auto_1057997 ?auto_1058005 ) ) ( not ( = ?auto_1057999 ?auto_1058005 ) ) ( not ( = ?auto_1057998 ?auto_1058005 ) ) ( IS-CRATE ?auto_1057997 ) ( AVAILABLE ?auto_1058006 ) ( SURFACE-AT ?auto_1057997 ?auto_1058003 ) ( ON ?auto_1057997 ?auto_1058000 ) ( CLEAR ?auto_1057997 ) ( not ( = ?auto_1057997 ?auto_1058000 ) ) ( not ( = ?auto_1057999 ?auto_1058000 ) ) ( not ( = ?auto_1057998 ?auto_1058000 ) ) ( not ( = ?auto_1058005 ?auto_1058000 ) ) ( TRUCK-AT ?auto_1058001 ?auto_1058002 ) ( SURFACE-AT ?auto_1057996 ?auto_1058002 ) ( CLEAR ?auto_1057996 ) ( LIFTING ?auto_1058004 ?auto_1057998 ) ( IS-CRATE ?auto_1057998 ) ( not ( = ?auto_1057996 ?auto_1057998 ) ) ( not ( = ?auto_1057997 ?auto_1057996 ) ) ( not ( = ?auto_1057999 ?auto_1057996 ) ) ( not ( = ?auto_1058005 ?auto_1057996 ) ) ( not ( = ?auto_1058000 ?auto_1057996 ) ) ( ON ?auto_1057994 ?auto_1057993 ) ( ON ?auto_1057995 ?auto_1057994 ) ( ON ?auto_1057992 ?auto_1057995 ) ( ON ?auto_1057996 ?auto_1057992 ) ( not ( = ?auto_1057993 ?auto_1057994 ) ) ( not ( = ?auto_1057993 ?auto_1057995 ) ) ( not ( = ?auto_1057993 ?auto_1057992 ) ) ( not ( = ?auto_1057993 ?auto_1057996 ) ) ( not ( = ?auto_1057993 ?auto_1057998 ) ) ( not ( = ?auto_1057993 ?auto_1057997 ) ) ( not ( = ?auto_1057993 ?auto_1057999 ) ) ( not ( = ?auto_1057993 ?auto_1058005 ) ) ( not ( = ?auto_1057993 ?auto_1058000 ) ) ( not ( = ?auto_1057994 ?auto_1057995 ) ) ( not ( = ?auto_1057994 ?auto_1057992 ) ) ( not ( = ?auto_1057994 ?auto_1057996 ) ) ( not ( = ?auto_1057994 ?auto_1057998 ) ) ( not ( = ?auto_1057994 ?auto_1057997 ) ) ( not ( = ?auto_1057994 ?auto_1057999 ) ) ( not ( = ?auto_1057994 ?auto_1058005 ) ) ( not ( = ?auto_1057994 ?auto_1058000 ) ) ( not ( = ?auto_1057995 ?auto_1057992 ) ) ( not ( = ?auto_1057995 ?auto_1057996 ) ) ( not ( = ?auto_1057995 ?auto_1057998 ) ) ( not ( = ?auto_1057995 ?auto_1057997 ) ) ( not ( = ?auto_1057995 ?auto_1057999 ) ) ( not ( = ?auto_1057995 ?auto_1058005 ) ) ( not ( = ?auto_1057995 ?auto_1058000 ) ) ( not ( = ?auto_1057992 ?auto_1057996 ) ) ( not ( = ?auto_1057992 ?auto_1057998 ) ) ( not ( = ?auto_1057992 ?auto_1057997 ) ) ( not ( = ?auto_1057992 ?auto_1057999 ) ) ( not ( = ?auto_1057992 ?auto_1058005 ) ) ( not ( = ?auto_1057992 ?auto_1058000 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057998 ?auto_1057997 ?auto_1057999 )
      ( MAKE-7CRATE-VERIFY ?auto_1057993 ?auto_1057994 ?auto_1057995 ?auto_1057992 ?auto_1057996 ?auto_1057998 ?auto_1057997 ?auto_1057999 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1058008 - SURFACE
      ?auto_1058009 - SURFACE
      ?auto_1058010 - SURFACE
      ?auto_1058007 - SURFACE
      ?auto_1058011 - SURFACE
      ?auto_1058013 - SURFACE
      ?auto_1058012 - SURFACE
      ?auto_1058014 - SURFACE
      ?auto_1058015 - SURFACE
    )
    :vars
    (
      ?auto_1058020 - HOIST
      ?auto_1058018 - PLACE
      ?auto_1058019 - PLACE
      ?auto_1058022 - HOIST
      ?auto_1058021 - SURFACE
      ?auto_1058016 - SURFACE
      ?auto_1058017 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1058020 ?auto_1058018 ) ( IS-CRATE ?auto_1058015 ) ( not ( = ?auto_1058014 ?auto_1058015 ) ) ( not ( = ?auto_1058012 ?auto_1058014 ) ) ( not ( = ?auto_1058012 ?auto_1058015 ) ) ( not ( = ?auto_1058019 ?auto_1058018 ) ) ( HOIST-AT ?auto_1058022 ?auto_1058019 ) ( not ( = ?auto_1058020 ?auto_1058022 ) ) ( SURFACE-AT ?auto_1058015 ?auto_1058019 ) ( ON ?auto_1058015 ?auto_1058021 ) ( CLEAR ?auto_1058015 ) ( not ( = ?auto_1058014 ?auto_1058021 ) ) ( not ( = ?auto_1058015 ?auto_1058021 ) ) ( not ( = ?auto_1058012 ?auto_1058021 ) ) ( IS-CRATE ?auto_1058014 ) ( AVAILABLE ?auto_1058022 ) ( SURFACE-AT ?auto_1058014 ?auto_1058019 ) ( ON ?auto_1058014 ?auto_1058016 ) ( CLEAR ?auto_1058014 ) ( not ( = ?auto_1058014 ?auto_1058016 ) ) ( not ( = ?auto_1058015 ?auto_1058016 ) ) ( not ( = ?auto_1058012 ?auto_1058016 ) ) ( not ( = ?auto_1058021 ?auto_1058016 ) ) ( TRUCK-AT ?auto_1058017 ?auto_1058018 ) ( SURFACE-AT ?auto_1058013 ?auto_1058018 ) ( CLEAR ?auto_1058013 ) ( LIFTING ?auto_1058020 ?auto_1058012 ) ( IS-CRATE ?auto_1058012 ) ( not ( = ?auto_1058013 ?auto_1058012 ) ) ( not ( = ?auto_1058014 ?auto_1058013 ) ) ( not ( = ?auto_1058015 ?auto_1058013 ) ) ( not ( = ?auto_1058021 ?auto_1058013 ) ) ( not ( = ?auto_1058016 ?auto_1058013 ) ) ( ON ?auto_1058009 ?auto_1058008 ) ( ON ?auto_1058010 ?auto_1058009 ) ( ON ?auto_1058007 ?auto_1058010 ) ( ON ?auto_1058011 ?auto_1058007 ) ( ON ?auto_1058013 ?auto_1058011 ) ( not ( = ?auto_1058008 ?auto_1058009 ) ) ( not ( = ?auto_1058008 ?auto_1058010 ) ) ( not ( = ?auto_1058008 ?auto_1058007 ) ) ( not ( = ?auto_1058008 ?auto_1058011 ) ) ( not ( = ?auto_1058008 ?auto_1058013 ) ) ( not ( = ?auto_1058008 ?auto_1058012 ) ) ( not ( = ?auto_1058008 ?auto_1058014 ) ) ( not ( = ?auto_1058008 ?auto_1058015 ) ) ( not ( = ?auto_1058008 ?auto_1058021 ) ) ( not ( = ?auto_1058008 ?auto_1058016 ) ) ( not ( = ?auto_1058009 ?auto_1058010 ) ) ( not ( = ?auto_1058009 ?auto_1058007 ) ) ( not ( = ?auto_1058009 ?auto_1058011 ) ) ( not ( = ?auto_1058009 ?auto_1058013 ) ) ( not ( = ?auto_1058009 ?auto_1058012 ) ) ( not ( = ?auto_1058009 ?auto_1058014 ) ) ( not ( = ?auto_1058009 ?auto_1058015 ) ) ( not ( = ?auto_1058009 ?auto_1058021 ) ) ( not ( = ?auto_1058009 ?auto_1058016 ) ) ( not ( = ?auto_1058010 ?auto_1058007 ) ) ( not ( = ?auto_1058010 ?auto_1058011 ) ) ( not ( = ?auto_1058010 ?auto_1058013 ) ) ( not ( = ?auto_1058010 ?auto_1058012 ) ) ( not ( = ?auto_1058010 ?auto_1058014 ) ) ( not ( = ?auto_1058010 ?auto_1058015 ) ) ( not ( = ?auto_1058010 ?auto_1058021 ) ) ( not ( = ?auto_1058010 ?auto_1058016 ) ) ( not ( = ?auto_1058007 ?auto_1058011 ) ) ( not ( = ?auto_1058007 ?auto_1058013 ) ) ( not ( = ?auto_1058007 ?auto_1058012 ) ) ( not ( = ?auto_1058007 ?auto_1058014 ) ) ( not ( = ?auto_1058007 ?auto_1058015 ) ) ( not ( = ?auto_1058007 ?auto_1058021 ) ) ( not ( = ?auto_1058007 ?auto_1058016 ) ) ( not ( = ?auto_1058011 ?auto_1058013 ) ) ( not ( = ?auto_1058011 ?auto_1058012 ) ) ( not ( = ?auto_1058011 ?auto_1058014 ) ) ( not ( = ?auto_1058011 ?auto_1058015 ) ) ( not ( = ?auto_1058011 ?auto_1058021 ) ) ( not ( = ?auto_1058011 ?auto_1058016 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1058012 ?auto_1058014 ?auto_1058015 )
      ( MAKE-8CRATE-VERIFY ?auto_1058008 ?auto_1058009 ?auto_1058010 ?auto_1058007 ?auto_1058011 ?auto_1058013 ?auto_1058012 ?auto_1058014 ?auto_1058015 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1058024 - SURFACE
      ?auto_1058025 - SURFACE
      ?auto_1058026 - SURFACE
      ?auto_1058023 - SURFACE
      ?auto_1058027 - SURFACE
      ?auto_1058029 - SURFACE
      ?auto_1058028 - SURFACE
      ?auto_1058030 - SURFACE
      ?auto_1058031 - SURFACE
      ?auto_1058032 - SURFACE
    )
    :vars
    (
      ?auto_1058037 - HOIST
      ?auto_1058035 - PLACE
      ?auto_1058036 - PLACE
      ?auto_1058039 - HOIST
      ?auto_1058038 - SURFACE
      ?auto_1058033 - SURFACE
      ?auto_1058034 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1058037 ?auto_1058035 ) ( IS-CRATE ?auto_1058032 ) ( not ( = ?auto_1058031 ?auto_1058032 ) ) ( not ( = ?auto_1058030 ?auto_1058031 ) ) ( not ( = ?auto_1058030 ?auto_1058032 ) ) ( not ( = ?auto_1058036 ?auto_1058035 ) ) ( HOIST-AT ?auto_1058039 ?auto_1058036 ) ( not ( = ?auto_1058037 ?auto_1058039 ) ) ( SURFACE-AT ?auto_1058032 ?auto_1058036 ) ( ON ?auto_1058032 ?auto_1058038 ) ( CLEAR ?auto_1058032 ) ( not ( = ?auto_1058031 ?auto_1058038 ) ) ( not ( = ?auto_1058032 ?auto_1058038 ) ) ( not ( = ?auto_1058030 ?auto_1058038 ) ) ( IS-CRATE ?auto_1058031 ) ( AVAILABLE ?auto_1058039 ) ( SURFACE-AT ?auto_1058031 ?auto_1058036 ) ( ON ?auto_1058031 ?auto_1058033 ) ( CLEAR ?auto_1058031 ) ( not ( = ?auto_1058031 ?auto_1058033 ) ) ( not ( = ?auto_1058032 ?auto_1058033 ) ) ( not ( = ?auto_1058030 ?auto_1058033 ) ) ( not ( = ?auto_1058038 ?auto_1058033 ) ) ( TRUCK-AT ?auto_1058034 ?auto_1058035 ) ( SURFACE-AT ?auto_1058028 ?auto_1058035 ) ( CLEAR ?auto_1058028 ) ( LIFTING ?auto_1058037 ?auto_1058030 ) ( IS-CRATE ?auto_1058030 ) ( not ( = ?auto_1058028 ?auto_1058030 ) ) ( not ( = ?auto_1058031 ?auto_1058028 ) ) ( not ( = ?auto_1058032 ?auto_1058028 ) ) ( not ( = ?auto_1058038 ?auto_1058028 ) ) ( not ( = ?auto_1058033 ?auto_1058028 ) ) ( ON ?auto_1058025 ?auto_1058024 ) ( ON ?auto_1058026 ?auto_1058025 ) ( ON ?auto_1058023 ?auto_1058026 ) ( ON ?auto_1058027 ?auto_1058023 ) ( ON ?auto_1058029 ?auto_1058027 ) ( ON ?auto_1058028 ?auto_1058029 ) ( not ( = ?auto_1058024 ?auto_1058025 ) ) ( not ( = ?auto_1058024 ?auto_1058026 ) ) ( not ( = ?auto_1058024 ?auto_1058023 ) ) ( not ( = ?auto_1058024 ?auto_1058027 ) ) ( not ( = ?auto_1058024 ?auto_1058029 ) ) ( not ( = ?auto_1058024 ?auto_1058028 ) ) ( not ( = ?auto_1058024 ?auto_1058030 ) ) ( not ( = ?auto_1058024 ?auto_1058031 ) ) ( not ( = ?auto_1058024 ?auto_1058032 ) ) ( not ( = ?auto_1058024 ?auto_1058038 ) ) ( not ( = ?auto_1058024 ?auto_1058033 ) ) ( not ( = ?auto_1058025 ?auto_1058026 ) ) ( not ( = ?auto_1058025 ?auto_1058023 ) ) ( not ( = ?auto_1058025 ?auto_1058027 ) ) ( not ( = ?auto_1058025 ?auto_1058029 ) ) ( not ( = ?auto_1058025 ?auto_1058028 ) ) ( not ( = ?auto_1058025 ?auto_1058030 ) ) ( not ( = ?auto_1058025 ?auto_1058031 ) ) ( not ( = ?auto_1058025 ?auto_1058032 ) ) ( not ( = ?auto_1058025 ?auto_1058038 ) ) ( not ( = ?auto_1058025 ?auto_1058033 ) ) ( not ( = ?auto_1058026 ?auto_1058023 ) ) ( not ( = ?auto_1058026 ?auto_1058027 ) ) ( not ( = ?auto_1058026 ?auto_1058029 ) ) ( not ( = ?auto_1058026 ?auto_1058028 ) ) ( not ( = ?auto_1058026 ?auto_1058030 ) ) ( not ( = ?auto_1058026 ?auto_1058031 ) ) ( not ( = ?auto_1058026 ?auto_1058032 ) ) ( not ( = ?auto_1058026 ?auto_1058038 ) ) ( not ( = ?auto_1058026 ?auto_1058033 ) ) ( not ( = ?auto_1058023 ?auto_1058027 ) ) ( not ( = ?auto_1058023 ?auto_1058029 ) ) ( not ( = ?auto_1058023 ?auto_1058028 ) ) ( not ( = ?auto_1058023 ?auto_1058030 ) ) ( not ( = ?auto_1058023 ?auto_1058031 ) ) ( not ( = ?auto_1058023 ?auto_1058032 ) ) ( not ( = ?auto_1058023 ?auto_1058038 ) ) ( not ( = ?auto_1058023 ?auto_1058033 ) ) ( not ( = ?auto_1058027 ?auto_1058029 ) ) ( not ( = ?auto_1058027 ?auto_1058028 ) ) ( not ( = ?auto_1058027 ?auto_1058030 ) ) ( not ( = ?auto_1058027 ?auto_1058031 ) ) ( not ( = ?auto_1058027 ?auto_1058032 ) ) ( not ( = ?auto_1058027 ?auto_1058038 ) ) ( not ( = ?auto_1058027 ?auto_1058033 ) ) ( not ( = ?auto_1058029 ?auto_1058028 ) ) ( not ( = ?auto_1058029 ?auto_1058030 ) ) ( not ( = ?auto_1058029 ?auto_1058031 ) ) ( not ( = ?auto_1058029 ?auto_1058032 ) ) ( not ( = ?auto_1058029 ?auto_1058038 ) ) ( not ( = ?auto_1058029 ?auto_1058033 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1058030 ?auto_1058031 ?auto_1058032 )
      ( MAKE-9CRATE-VERIFY ?auto_1058024 ?auto_1058025 ?auto_1058026 ?auto_1058023 ?auto_1058027 ?auto_1058029 ?auto_1058028 ?auto_1058030 ?auto_1058031 ?auto_1058032 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1062905 - SURFACE
      ?auto_1062906 - SURFACE
      ?auto_1062907 - SURFACE
      ?auto_1062904 - SURFACE
      ?auto_1062908 - SURFACE
      ?auto_1062910 - SURFACE
      ?auto_1062909 - SURFACE
      ?auto_1062911 - SURFACE
      ?auto_1062912 - SURFACE
      ?auto_1062913 - SURFACE
      ?auto_1062914 - SURFACE
    )
    :vars
    (
      ?auto_1062915 - HOIST
      ?auto_1062916 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1062915 ?auto_1062916 ) ( SURFACE-AT ?auto_1062913 ?auto_1062916 ) ( CLEAR ?auto_1062913 ) ( LIFTING ?auto_1062915 ?auto_1062914 ) ( IS-CRATE ?auto_1062914 ) ( not ( = ?auto_1062913 ?auto_1062914 ) ) ( ON ?auto_1062906 ?auto_1062905 ) ( ON ?auto_1062907 ?auto_1062906 ) ( ON ?auto_1062904 ?auto_1062907 ) ( ON ?auto_1062908 ?auto_1062904 ) ( ON ?auto_1062910 ?auto_1062908 ) ( ON ?auto_1062909 ?auto_1062910 ) ( ON ?auto_1062911 ?auto_1062909 ) ( ON ?auto_1062912 ?auto_1062911 ) ( ON ?auto_1062913 ?auto_1062912 ) ( not ( = ?auto_1062905 ?auto_1062906 ) ) ( not ( = ?auto_1062905 ?auto_1062907 ) ) ( not ( = ?auto_1062905 ?auto_1062904 ) ) ( not ( = ?auto_1062905 ?auto_1062908 ) ) ( not ( = ?auto_1062905 ?auto_1062910 ) ) ( not ( = ?auto_1062905 ?auto_1062909 ) ) ( not ( = ?auto_1062905 ?auto_1062911 ) ) ( not ( = ?auto_1062905 ?auto_1062912 ) ) ( not ( = ?auto_1062905 ?auto_1062913 ) ) ( not ( = ?auto_1062905 ?auto_1062914 ) ) ( not ( = ?auto_1062906 ?auto_1062907 ) ) ( not ( = ?auto_1062906 ?auto_1062904 ) ) ( not ( = ?auto_1062906 ?auto_1062908 ) ) ( not ( = ?auto_1062906 ?auto_1062910 ) ) ( not ( = ?auto_1062906 ?auto_1062909 ) ) ( not ( = ?auto_1062906 ?auto_1062911 ) ) ( not ( = ?auto_1062906 ?auto_1062912 ) ) ( not ( = ?auto_1062906 ?auto_1062913 ) ) ( not ( = ?auto_1062906 ?auto_1062914 ) ) ( not ( = ?auto_1062907 ?auto_1062904 ) ) ( not ( = ?auto_1062907 ?auto_1062908 ) ) ( not ( = ?auto_1062907 ?auto_1062910 ) ) ( not ( = ?auto_1062907 ?auto_1062909 ) ) ( not ( = ?auto_1062907 ?auto_1062911 ) ) ( not ( = ?auto_1062907 ?auto_1062912 ) ) ( not ( = ?auto_1062907 ?auto_1062913 ) ) ( not ( = ?auto_1062907 ?auto_1062914 ) ) ( not ( = ?auto_1062904 ?auto_1062908 ) ) ( not ( = ?auto_1062904 ?auto_1062910 ) ) ( not ( = ?auto_1062904 ?auto_1062909 ) ) ( not ( = ?auto_1062904 ?auto_1062911 ) ) ( not ( = ?auto_1062904 ?auto_1062912 ) ) ( not ( = ?auto_1062904 ?auto_1062913 ) ) ( not ( = ?auto_1062904 ?auto_1062914 ) ) ( not ( = ?auto_1062908 ?auto_1062910 ) ) ( not ( = ?auto_1062908 ?auto_1062909 ) ) ( not ( = ?auto_1062908 ?auto_1062911 ) ) ( not ( = ?auto_1062908 ?auto_1062912 ) ) ( not ( = ?auto_1062908 ?auto_1062913 ) ) ( not ( = ?auto_1062908 ?auto_1062914 ) ) ( not ( = ?auto_1062910 ?auto_1062909 ) ) ( not ( = ?auto_1062910 ?auto_1062911 ) ) ( not ( = ?auto_1062910 ?auto_1062912 ) ) ( not ( = ?auto_1062910 ?auto_1062913 ) ) ( not ( = ?auto_1062910 ?auto_1062914 ) ) ( not ( = ?auto_1062909 ?auto_1062911 ) ) ( not ( = ?auto_1062909 ?auto_1062912 ) ) ( not ( = ?auto_1062909 ?auto_1062913 ) ) ( not ( = ?auto_1062909 ?auto_1062914 ) ) ( not ( = ?auto_1062911 ?auto_1062912 ) ) ( not ( = ?auto_1062911 ?auto_1062913 ) ) ( not ( = ?auto_1062911 ?auto_1062914 ) ) ( not ( = ?auto_1062912 ?auto_1062913 ) ) ( not ( = ?auto_1062912 ?auto_1062914 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1062913 ?auto_1062914 )
      ( MAKE-10CRATE-VERIFY ?auto_1062905 ?auto_1062906 ?auto_1062907 ?auto_1062904 ?auto_1062908 ?auto_1062910 ?auto_1062909 ?auto_1062911 ?auto_1062912 ?auto_1062913 ?auto_1062914 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1062999 - SURFACE
      ?auto_1063000 - SURFACE
      ?auto_1063001 - SURFACE
      ?auto_1062998 - SURFACE
      ?auto_1063002 - SURFACE
      ?auto_1063004 - SURFACE
      ?auto_1063003 - SURFACE
      ?auto_1063005 - SURFACE
      ?auto_1063006 - SURFACE
      ?auto_1063007 - SURFACE
      ?auto_1063008 - SURFACE
    )
    :vars
    (
      ?auto_1063009 - HOIST
      ?auto_1063010 - PLACE
      ?auto_1063011 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1063009 ?auto_1063010 ) ( SURFACE-AT ?auto_1063007 ?auto_1063010 ) ( CLEAR ?auto_1063007 ) ( IS-CRATE ?auto_1063008 ) ( not ( = ?auto_1063007 ?auto_1063008 ) ) ( TRUCK-AT ?auto_1063011 ?auto_1063010 ) ( AVAILABLE ?auto_1063009 ) ( IN ?auto_1063008 ?auto_1063011 ) ( ON ?auto_1063007 ?auto_1063006 ) ( not ( = ?auto_1063006 ?auto_1063007 ) ) ( not ( = ?auto_1063006 ?auto_1063008 ) ) ( ON ?auto_1063000 ?auto_1062999 ) ( ON ?auto_1063001 ?auto_1063000 ) ( ON ?auto_1062998 ?auto_1063001 ) ( ON ?auto_1063002 ?auto_1062998 ) ( ON ?auto_1063004 ?auto_1063002 ) ( ON ?auto_1063003 ?auto_1063004 ) ( ON ?auto_1063005 ?auto_1063003 ) ( ON ?auto_1063006 ?auto_1063005 ) ( not ( = ?auto_1062999 ?auto_1063000 ) ) ( not ( = ?auto_1062999 ?auto_1063001 ) ) ( not ( = ?auto_1062999 ?auto_1062998 ) ) ( not ( = ?auto_1062999 ?auto_1063002 ) ) ( not ( = ?auto_1062999 ?auto_1063004 ) ) ( not ( = ?auto_1062999 ?auto_1063003 ) ) ( not ( = ?auto_1062999 ?auto_1063005 ) ) ( not ( = ?auto_1062999 ?auto_1063006 ) ) ( not ( = ?auto_1062999 ?auto_1063007 ) ) ( not ( = ?auto_1062999 ?auto_1063008 ) ) ( not ( = ?auto_1063000 ?auto_1063001 ) ) ( not ( = ?auto_1063000 ?auto_1062998 ) ) ( not ( = ?auto_1063000 ?auto_1063002 ) ) ( not ( = ?auto_1063000 ?auto_1063004 ) ) ( not ( = ?auto_1063000 ?auto_1063003 ) ) ( not ( = ?auto_1063000 ?auto_1063005 ) ) ( not ( = ?auto_1063000 ?auto_1063006 ) ) ( not ( = ?auto_1063000 ?auto_1063007 ) ) ( not ( = ?auto_1063000 ?auto_1063008 ) ) ( not ( = ?auto_1063001 ?auto_1062998 ) ) ( not ( = ?auto_1063001 ?auto_1063002 ) ) ( not ( = ?auto_1063001 ?auto_1063004 ) ) ( not ( = ?auto_1063001 ?auto_1063003 ) ) ( not ( = ?auto_1063001 ?auto_1063005 ) ) ( not ( = ?auto_1063001 ?auto_1063006 ) ) ( not ( = ?auto_1063001 ?auto_1063007 ) ) ( not ( = ?auto_1063001 ?auto_1063008 ) ) ( not ( = ?auto_1062998 ?auto_1063002 ) ) ( not ( = ?auto_1062998 ?auto_1063004 ) ) ( not ( = ?auto_1062998 ?auto_1063003 ) ) ( not ( = ?auto_1062998 ?auto_1063005 ) ) ( not ( = ?auto_1062998 ?auto_1063006 ) ) ( not ( = ?auto_1062998 ?auto_1063007 ) ) ( not ( = ?auto_1062998 ?auto_1063008 ) ) ( not ( = ?auto_1063002 ?auto_1063004 ) ) ( not ( = ?auto_1063002 ?auto_1063003 ) ) ( not ( = ?auto_1063002 ?auto_1063005 ) ) ( not ( = ?auto_1063002 ?auto_1063006 ) ) ( not ( = ?auto_1063002 ?auto_1063007 ) ) ( not ( = ?auto_1063002 ?auto_1063008 ) ) ( not ( = ?auto_1063004 ?auto_1063003 ) ) ( not ( = ?auto_1063004 ?auto_1063005 ) ) ( not ( = ?auto_1063004 ?auto_1063006 ) ) ( not ( = ?auto_1063004 ?auto_1063007 ) ) ( not ( = ?auto_1063004 ?auto_1063008 ) ) ( not ( = ?auto_1063003 ?auto_1063005 ) ) ( not ( = ?auto_1063003 ?auto_1063006 ) ) ( not ( = ?auto_1063003 ?auto_1063007 ) ) ( not ( = ?auto_1063003 ?auto_1063008 ) ) ( not ( = ?auto_1063005 ?auto_1063006 ) ) ( not ( = ?auto_1063005 ?auto_1063007 ) ) ( not ( = ?auto_1063005 ?auto_1063008 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1063006 ?auto_1063007 ?auto_1063008 )
      ( MAKE-10CRATE-VERIFY ?auto_1062999 ?auto_1063000 ?auto_1063001 ?auto_1062998 ?auto_1063002 ?auto_1063004 ?auto_1063003 ?auto_1063005 ?auto_1063006 ?auto_1063007 ?auto_1063008 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1063104 - SURFACE
      ?auto_1063105 - SURFACE
      ?auto_1063106 - SURFACE
      ?auto_1063103 - SURFACE
      ?auto_1063107 - SURFACE
      ?auto_1063109 - SURFACE
      ?auto_1063108 - SURFACE
      ?auto_1063110 - SURFACE
      ?auto_1063111 - SURFACE
      ?auto_1063112 - SURFACE
      ?auto_1063113 - SURFACE
    )
    :vars
    (
      ?auto_1063116 - HOIST
      ?auto_1063117 - PLACE
      ?auto_1063115 - TRUCK
      ?auto_1063114 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1063116 ?auto_1063117 ) ( SURFACE-AT ?auto_1063112 ?auto_1063117 ) ( CLEAR ?auto_1063112 ) ( IS-CRATE ?auto_1063113 ) ( not ( = ?auto_1063112 ?auto_1063113 ) ) ( AVAILABLE ?auto_1063116 ) ( IN ?auto_1063113 ?auto_1063115 ) ( ON ?auto_1063112 ?auto_1063111 ) ( not ( = ?auto_1063111 ?auto_1063112 ) ) ( not ( = ?auto_1063111 ?auto_1063113 ) ) ( TRUCK-AT ?auto_1063115 ?auto_1063114 ) ( not ( = ?auto_1063114 ?auto_1063117 ) ) ( ON ?auto_1063105 ?auto_1063104 ) ( ON ?auto_1063106 ?auto_1063105 ) ( ON ?auto_1063103 ?auto_1063106 ) ( ON ?auto_1063107 ?auto_1063103 ) ( ON ?auto_1063109 ?auto_1063107 ) ( ON ?auto_1063108 ?auto_1063109 ) ( ON ?auto_1063110 ?auto_1063108 ) ( ON ?auto_1063111 ?auto_1063110 ) ( not ( = ?auto_1063104 ?auto_1063105 ) ) ( not ( = ?auto_1063104 ?auto_1063106 ) ) ( not ( = ?auto_1063104 ?auto_1063103 ) ) ( not ( = ?auto_1063104 ?auto_1063107 ) ) ( not ( = ?auto_1063104 ?auto_1063109 ) ) ( not ( = ?auto_1063104 ?auto_1063108 ) ) ( not ( = ?auto_1063104 ?auto_1063110 ) ) ( not ( = ?auto_1063104 ?auto_1063111 ) ) ( not ( = ?auto_1063104 ?auto_1063112 ) ) ( not ( = ?auto_1063104 ?auto_1063113 ) ) ( not ( = ?auto_1063105 ?auto_1063106 ) ) ( not ( = ?auto_1063105 ?auto_1063103 ) ) ( not ( = ?auto_1063105 ?auto_1063107 ) ) ( not ( = ?auto_1063105 ?auto_1063109 ) ) ( not ( = ?auto_1063105 ?auto_1063108 ) ) ( not ( = ?auto_1063105 ?auto_1063110 ) ) ( not ( = ?auto_1063105 ?auto_1063111 ) ) ( not ( = ?auto_1063105 ?auto_1063112 ) ) ( not ( = ?auto_1063105 ?auto_1063113 ) ) ( not ( = ?auto_1063106 ?auto_1063103 ) ) ( not ( = ?auto_1063106 ?auto_1063107 ) ) ( not ( = ?auto_1063106 ?auto_1063109 ) ) ( not ( = ?auto_1063106 ?auto_1063108 ) ) ( not ( = ?auto_1063106 ?auto_1063110 ) ) ( not ( = ?auto_1063106 ?auto_1063111 ) ) ( not ( = ?auto_1063106 ?auto_1063112 ) ) ( not ( = ?auto_1063106 ?auto_1063113 ) ) ( not ( = ?auto_1063103 ?auto_1063107 ) ) ( not ( = ?auto_1063103 ?auto_1063109 ) ) ( not ( = ?auto_1063103 ?auto_1063108 ) ) ( not ( = ?auto_1063103 ?auto_1063110 ) ) ( not ( = ?auto_1063103 ?auto_1063111 ) ) ( not ( = ?auto_1063103 ?auto_1063112 ) ) ( not ( = ?auto_1063103 ?auto_1063113 ) ) ( not ( = ?auto_1063107 ?auto_1063109 ) ) ( not ( = ?auto_1063107 ?auto_1063108 ) ) ( not ( = ?auto_1063107 ?auto_1063110 ) ) ( not ( = ?auto_1063107 ?auto_1063111 ) ) ( not ( = ?auto_1063107 ?auto_1063112 ) ) ( not ( = ?auto_1063107 ?auto_1063113 ) ) ( not ( = ?auto_1063109 ?auto_1063108 ) ) ( not ( = ?auto_1063109 ?auto_1063110 ) ) ( not ( = ?auto_1063109 ?auto_1063111 ) ) ( not ( = ?auto_1063109 ?auto_1063112 ) ) ( not ( = ?auto_1063109 ?auto_1063113 ) ) ( not ( = ?auto_1063108 ?auto_1063110 ) ) ( not ( = ?auto_1063108 ?auto_1063111 ) ) ( not ( = ?auto_1063108 ?auto_1063112 ) ) ( not ( = ?auto_1063108 ?auto_1063113 ) ) ( not ( = ?auto_1063110 ?auto_1063111 ) ) ( not ( = ?auto_1063110 ?auto_1063112 ) ) ( not ( = ?auto_1063110 ?auto_1063113 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1063111 ?auto_1063112 ?auto_1063113 )
      ( MAKE-10CRATE-VERIFY ?auto_1063104 ?auto_1063105 ?auto_1063106 ?auto_1063103 ?auto_1063107 ?auto_1063109 ?auto_1063108 ?auto_1063110 ?auto_1063111 ?auto_1063112 ?auto_1063113 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1063219 - SURFACE
      ?auto_1063220 - SURFACE
      ?auto_1063221 - SURFACE
      ?auto_1063218 - SURFACE
      ?auto_1063222 - SURFACE
      ?auto_1063224 - SURFACE
      ?auto_1063223 - SURFACE
      ?auto_1063225 - SURFACE
      ?auto_1063226 - SURFACE
      ?auto_1063227 - SURFACE
      ?auto_1063228 - SURFACE
    )
    :vars
    (
      ?auto_1063232 - HOIST
      ?auto_1063231 - PLACE
      ?auto_1063230 - TRUCK
      ?auto_1063233 - PLACE
      ?auto_1063229 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1063232 ?auto_1063231 ) ( SURFACE-AT ?auto_1063227 ?auto_1063231 ) ( CLEAR ?auto_1063227 ) ( IS-CRATE ?auto_1063228 ) ( not ( = ?auto_1063227 ?auto_1063228 ) ) ( AVAILABLE ?auto_1063232 ) ( ON ?auto_1063227 ?auto_1063226 ) ( not ( = ?auto_1063226 ?auto_1063227 ) ) ( not ( = ?auto_1063226 ?auto_1063228 ) ) ( TRUCK-AT ?auto_1063230 ?auto_1063233 ) ( not ( = ?auto_1063233 ?auto_1063231 ) ) ( HOIST-AT ?auto_1063229 ?auto_1063233 ) ( LIFTING ?auto_1063229 ?auto_1063228 ) ( not ( = ?auto_1063232 ?auto_1063229 ) ) ( ON ?auto_1063220 ?auto_1063219 ) ( ON ?auto_1063221 ?auto_1063220 ) ( ON ?auto_1063218 ?auto_1063221 ) ( ON ?auto_1063222 ?auto_1063218 ) ( ON ?auto_1063224 ?auto_1063222 ) ( ON ?auto_1063223 ?auto_1063224 ) ( ON ?auto_1063225 ?auto_1063223 ) ( ON ?auto_1063226 ?auto_1063225 ) ( not ( = ?auto_1063219 ?auto_1063220 ) ) ( not ( = ?auto_1063219 ?auto_1063221 ) ) ( not ( = ?auto_1063219 ?auto_1063218 ) ) ( not ( = ?auto_1063219 ?auto_1063222 ) ) ( not ( = ?auto_1063219 ?auto_1063224 ) ) ( not ( = ?auto_1063219 ?auto_1063223 ) ) ( not ( = ?auto_1063219 ?auto_1063225 ) ) ( not ( = ?auto_1063219 ?auto_1063226 ) ) ( not ( = ?auto_1063219 ?auto_1063227 ) ) ( not ( = ?auto_1063219 ?auto_1063228 ) ) ( not ( = ?auto_1063220 ?auto_1063221 ) ) ( not ( = ?auto_1063220 ?auto_1063218 ) ) ( not ( = ?auto_1063220 ?auto_1063222 ) ) ( not ( = ?auto_1063220 ?auto_1063224 ) ) ( not ( = ?auto_1063220 ?auto_1063223 ) ) ( not ( = ?auto_1063220 ?auto_1063225 ) ) ( not ( = ?auto_1063220 ?auto_1063226 ) ) ( not ( = ?auto_1063220 ?auto_1063227 ) ) ( not ( = ?auto_1063220 ?auto_1063228 ) ) ( not ( = ?auto_1063221 ?auto_1063218 ) ) ( not ( = ?auto_1063221 ?auto_1063222 ) ) ( not ( = ?auto_1063221 ?auto_1063224 ) ) ( not ( = ?auto_1063221 ?auto_1063223 ) ) ( not ( = ?auto_1063221 ?auto_1063225 ) ) ( not ( = ?auto_1063221 ?auto_1063226 ) ) ( not ( = ?auto_1063221 ?auto_1063227 ) ) ( not ( = ?auto_1063221 ?auto_1063228 ) ) ( not ( = ?auto_1063218 ?auto_1063222 ) ) ( not ( = ?auto_1063218 ?auto_1063224 ) ) ( not ( = ?auto_1063218 ?auto_1063223 ) ) ( not ( = ?auto_1063218 ?auto_1063225 ) ) ( not ( = ?auto_1063218 ?auto_1063226 ) ) ( not ( = ?auto_1063218 ?auto_1063227 ) ) ( not ( = ?auto_1063218 ?auto_1063228 ) ) ( not ( = ?auto_1063222 ?auto_1063224 ) ) ( not ( = ?auto_1063222 ?auto_1063223 ) ) ( not ( = ?auto_1063222 ?auto_1063225 ) ) ( not ( = ?auto_1063222 ?auto_1063226 ) ) ( not ( = ?auto_1063222 ?auto_1063227 ) ) ( not ( = ?auto_1063222 ?auto_1063228 ) ) ( not ( = ?auto_1063224 ?auto_1063223 ) ) ( not ( = ?auto_1063224 ?auto_1063225 ) ) ( not ( = ?auto_1063224 ?auto_1063226 ) ) ( not ( = ?auto_1063224 ?auto_1063227 ) ) ( not ( = ?auto_1063224 ?auto_1063228 ) ) ( not ( = ?auto_1063223 ?auto_1063225 ) ) ( not ( = ?auto_1063223 ?auto_1063226 ) ) ( not ( = ?auto_1063223 ?auto_1063227 ) ) ( not ( = ?auto_1063223 ?auto_1063228 ) ) ( not ( = ?auto_1063225 ?auto_1063226 ) ) ( not ( = ?auto_1063225 ?auto_1063227 ) ) ( not ( = ?auto_1063225 ?auto_1063228 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1063226 ?auto_1063227 ?auto_1063228 )
      ( MAKE-10CRATE-VERIFY ?auto_1063219 ?auto_1063220 ?auto_1063221 ?auto_1063218 ?auto_1063222 ?auto_1063224 ?auto_1063223 ?auto_1063225 ?auto_1063226 ?auto_1063227 ?auto_1063228 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1063344 - SURFACE
      ?auto_1063345 - SURFACE
      ?auto_1063346 - SURFACE
      ?auto_1063343 - SURFACE
      ?auto_1063347 - SURFACE
      ?auto_1063349 - SURFACE
      ?auto_1063348 - SURFACE
      ?auto_1063350 - SURFACE
      ?auto_1063351 - SURFACE
      ?auto_1063352 - SURFACE
      ?auto_1063353 - SURFACE
    )
    :vars
    (
      ?auto_1063358 - HOIST
      ?auto_1063354 - PLACE
      ?auto_1063359 - TRUCK
      ?auto_1063356 - PLACE
      ?auto_1063357 - HOIST
      ?auto_1063355 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1063358 ?auto_1063354 ) ( SURFACE-AT ?auto_1063352 ?auto_1063354 ) ( CLEAR ?auto_1063352 ) ( IS-CRATE ?auto_1063353 ) ( not ( = ?auto_1063352 ?auto_1063353 ) ) ( AVAILABLE ?auto_1063358 ) ( ON ?auto_1063352 ?auto_1063351 ) ( not ( = ?auto_1063351 ?auto_1063352 ) ) ( not ( = ?auto_1063351 ?auto_1063353 ) ) ( TRUCK-AT ?auto_1063359 ?auto_1063356 ) ( not ( = ?auto_1063356 ?auto_1063354 ) ) ( HOIST-AT ?auto_1063357 ?auto_1063356 ) ( not ( = ?auto_1063358 ?auto_1063357 ) ) ( AVAILABLE ?auto_1063357 ) ( SURFACE-AT ?auto_1063353 ?auto_1063356 ) ( ON ?auto_1063353 ?auto_1063355 ) ( CLEAR ?auto_1063353 ) ( not ( = ?auto_1063352 ?auto_1063355 ) ) ( not ( = ?auto_1063353 ?auto_1063355 ) ) ( not ( = ?auto_1063351 ?auto_1063355 ) ) ( ON ?auto_1063345 ?auto_1063344 ) ( ON ?auto_1063346 ?auto_1063345 ) ( ON ?auto_1063343 ?auto_1063346 ) ( ON ?auto_1063347 ?auto_1063343 ) ( ON ?auto_1063349 ?auto_1063347 ) ( ON ?auto_1063348 ?auto_1063349 ) ( ON ?auto_1063350 ?auto_1063348 ) ( ON ?auto_1063351 ?auto_1063350 ) ( not ( = ?auto_1063344 ?auto_1063345 ) ) ( not ( = ?auto_1063344 ?auto_1063346 ) ) ( not ( = ?auto_1063344 ?auto_1063343 ) ) ( not ( = ?auto_1063344 ?auto_1063347 ) ) ( not ( = ?auto_1063344 ?auto_1063349 ) ) ( not ( = ?auto_1063344 ?auto_1063348 ) ) ( not ( = ?auto_1063344 ?auto_1063350 ) ) ( not ( = ?auto_1063344 ?auto_1063351 ) ) ( not ( = ?auto_1063344 ?auto_1063352 ) ) ( not ( = ?auto_1063344 ?auto_1063353 ) ) ( not ( = ?auto_1063344 ?auto_1063355 ) ) ( not ( = ?auto_1063345 ?auto_1063346 ) ) ( not ( = ?auto_1063345 ?auto_1063343 ) ) ( not ( = ?auto_1063345 ?auto_1063347 ) ) ( not ( = ?auto_1063345 ?auto_1063349 ) ) ( not ( = ?auto_1063345 ?auto_1063348 ) ) ( not ( = ?auto_1063345 ?auto_1063350 ) ) ( not ( = ?auto_1063345 ?auto_1063351 ) ) ( not ( = ?auto_1063345 ?auto_1063352 ) ) ( not ( = ?auto_1063345 ?auto_1063353 ) ) ( not ( = ?auto_1063345 ?auto_1063355 ) ) ( not ( = ?auto_1063346 ?auto_1063343 ) ) ( not ( = ?auto_1063346 ?auto_1063347 ) ) ( not ( = ?auto_1063346 ?auto_1063349 ) ) ( not ( = ?auto_1063346 ?auto_1063348 ) ) ( not ( = ?auto_1063346 ?auto_1063350 ) ) ( not ( = ?auto_1063346 ?auto_1063351 ) ) ( not ( = ?auto_1063346 ?auto_1063352 ) ) ( not ( = ?auto_1063346 ?auto_1063353 ) ) ( not ( = ?auto_1063346 ?auto_1063355 ) ) ( not ( = ?auto_1063343 ?auto_1063347 ) ) ( not ( = ?auto_1063343 ?auto_1063349 ) ) ( not ( = ?auto_1063343 ?auto_1063348 ) ) ( not ( = ?auto_1063343 ?auto_1063350 ) ) ( not ( = ?auto_1063343 ?auto_1063351 ) ) ( not ( = ?auto_1063343 ?auto_1063352 ) ) ( not ( = ?auto_1063343 ?auto_1063353 ) ) ( not ( = ?auto_1063343 ?auto_1063355 ) ) ( not ( = ?auto_1063347 ?auto_1063349 ) ) ( not ( = ?auto_1063347 ?auto_1063348 ) ) ( not ( = ?auto_1063347 ?auto_1063350 ) ) ( not ( = ?auto_1063347 ?auto_1063351 ) ) ( not ( = ?auto_1063347 ?auto_1063352 ) ) ( not ( = ?auto_1063347 ?auto_1063353 ) ) ( not ( = ?auto_1063347 ?auto_1063355 ) ) ( not ( = ?auto_1063349 ?auto_1063348 ) ) ( not ( = ?auto_1063349 ?auto_1063350 ) ) ( not ( = ?auto_1063349 ?auto_1063351 ) ) ( not ( = ?auto_1063349 ?auto_1063352 ) ) ( not ( = ?auto_1063349 ?auto_1063353 ) ) ( not ( = ?auto_1063349 ?auto_1063355 ) ) ( not ( = ?auto_1063348 ?auto_1063350 ) ) ( not ( = ?auto_1063348 ?auto_1063351 ) ) ( not ( = ?auto_1063348 ?auto_1063352 ) ) ( not ( = ?auto_1063348 ?auto_1063353 ) ) ( not ( = ?auto_1063348 ?auto_1063355 ) ) ( not ( = ?auto_1063350 ?auto_1063351 ) ) ( not ( = ?auto_1063350 ?auto_1063352 ) ) ( not ( = ?auto_1063350 ?auto_1063353 ) ) ( not ( = ?auto_1063350 ?auto_1063355 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1063351 ?auto_1063352 ?auto_1063353 )
      ( MAKE-10CRATE-VERIFY ?auto_1063344 ?auto_1063345 ?auto_1063346 ?auto_1063343 ?auto_1063347 ?auto_1063349 ?auto_1063348 ?auto_1063350 ?auto_1063351 ?auto_1063352 ?auto_1063353 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1063470 - SURFACE
      ?auto_1063471 - SURFACE
      ?auto_1063472 - SURFACE
      ?auto_1063469 - SURFACE
      ?auto_1063473 - SURFACE
      ?auto_1063475 - SURFACE
      ?auto_1063474 - SURFACE
      ?auto_1063476 - SURFACE
      ?auto_1063477 - SURFACE
      ?auto_1063478 - SURFACE
      ?auto_1063479 - SURFACE
    )
    :vars
    (
      ?auto_1063484 - HOIST
      ?auto_1063481 - PLACE
      ?auto_1063483 - PLACE
      ?auto_1063482 - HOIST
      ?auto_1063485 - SURFACE
      ?auto_1063480 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1063484 ?auto_1063481 ) ( SURFACE-AT ?auto_1063478 ?auto_1063481 ) ( CLEAR ?auto_1063478 ) ( IS-CRATE ?auto_1063479 ) ( not ( = ?auto_1063478 ?auto_1063479 ) ) ( AVAILABLE ?auto_1063484 ) ( ON ?auto_1063478 ?auto_1063477 ) ( not ( = ?auto_1063477 ?auto_1063478 ) ) ( not ( = ?auto_1063477 ?auto_1063479 ) ) ( not ( = ?auto_1063483 ?auto_1063481 ) ) ( HOIST-AT ?auto_1063482 ?auto_1063483 ) ( not ( = ?auto_1063484 ?auto_1063482 ) ) ( AVAILABLE ?auto_1063482 ) ( SURFACE-AT ?auto_1063479 ?auto_1063483 ) ( ON ?auto_1063479 ?auto_1063485 ) ( CLEAR ?auto_1063479 ) ( not ( = ?auto_1063478 ?auto_1063485 ) ) ( not ( = ?auto_1063479 ?auto_1063485 ) ) ( not ( = ?auto_1063477 ?auto_1063485 ) ) ( TRUCK-AT ?auto_1063480 ?auto_1063481 ) ( ON ?auto_1063471 ?auto_1063470 ) ( ON ?auto_1063472 ?auto_1063471 ) ( ON ?auto_1063469 ?auto_1063472 ) ( ON ?auto_1063473 ?auto_1063469 ) ( ON ?auto_1063475 ?auto_1063473 ) ( ON ?auto_1063474 ?auto_1063475 ) ( ON ?auto_1063476 ?auto_1063474 ) ( ON ?auto_1063477 ?auto_1063476 ) ( not ( = ?auto_1063470 ?auto_1063471 ) ) ( not ( = ?auto_1063470 ?auto_1063472 ) ) ( not ( = ?auto_1063470 ?auto_1063469 ) ) ( not ( = ?auto_1063470 ?auto_1063473 ) ) ( not ( = ?auto_1063470 ?auto_1063475 ) ) ( not ( = ?auto_1063470 ?auto_1063474 ) ) ( not ( = ?auto_1063470 ?auto_1063476 ) ) ( not ( = ?auto_1063470 ?auto_1063477 ) ) ( not ( = ?auto_1063470 ?auto_1063478 ) ) ( not ( = ?auto_1063470 ?auto_1063479 ) ) ( not ( = ?auto_1063470 ?auto_1063485 ) ) ( not ( = ?auto_1063471 ?auto_1063472 ) ) ( not ( = ?auto_1063471 ?auto_1063469 ) ) ( not ( = ?auto_1063471 ?auto_1063473 ) ) ( not ( = ?auto_1063471 ?auto_1063475 ) ) ( not ( = ?auto_1063471 ?auto_1063474 ) ) ( not ( = ?auto_1063471 ?auto_1063476 ) ) ( not ( = ?auto_1063471 ?auto_1063477 ) ) ( not ( = ?auto_1063471 ?auto_1063478 ) ) ( not ( = ?auto_1063471 ?auto_1063479 ) ) ( not ( = ?auto_1063471 ?auto_1063485 ) ) ( not ( = ?auto_1063472 ?auto_1063469 ) ) ( not ( = ?auto_1063472 ?auto_1063473 ) ) ( not ( = ?auto_1063472 ?auto_1063475 ) ) ( not ( = ?auto_1063472 ?auto_1063474 ) ) ( not ( = ?auto_1063472 ?auto_1063476 ) ) ( not ( = ?auto_1063472 ?auto_1063477 ) ) ( not ( = ?auto_1063472 ?auto_1063478 ) ) ( not ( = ?auto_1063472 ?auto_1063479 ) ) ( not ( = ?auto_1063472 ?auto_1063485 ) ) ( not ( = ?auto_1063469 ?auto_1063473 ) ) ( not ( = ?auto_1063469 ?auto_1063475 ) ) ( not ( = ?auto_1063469 ?auto_1063474 ) ) ( not ( = ?auto_1063469 ?auto_1063476 ) ) ( not ( = ?auto_1063469 ?auto_1063477 ) ) ( not ( = ?auto_1063469 ?auto_1063478 ) ) ( not ( = ?auto_1063469 ?auto_1063479 ) ) ( not ( = ?auto_1063469 ?auto_1063485 ) ) ( not ( = ?auto_1063473 ?auto_1063475 ) ) ( not ( = ?auto_1063473 ?auto_1063474 ) ) ( not ( = ?auto_1063473 ?auto_1063476 ) ) ( not ( = ?auto_1063473 ?auto_1063477 ) ) ( not ( = ?auto_1063473 ?auto_1063478 ) ) ( not ( = ?auto_1063473 ?auto_1063479 ) ) ( not ( = ?auto_1063473 ?auto_1063485 ) ) ( not ( = ?auto_1063475 ?auto_1063474 ) ) ( not ( = ?auto_1063475 ?auto_1063476 ) ) ( not ( = ?auto_1063475 ?auto_1063477 ) ) ( not ( = ?auto_1063475 ?auto_1063478 ) ) ( not ( = ?auto_1063475 ?auto_1063479 ) ) ( not ( = ?auto_1063475 ?auto_1063485 ) ) ( not ( = ?auto_1063474 ?auto_1063476 ) ) ( not ( = ?auto_1063474 ?auto_1063477 ) ) ( not ( = ?auto_1063474 ?auto_1063478 ) ) ( not ( = ?auto_1063474 ?auto_1063479 ) ) ( not ( = ?auto_1063474 ?auto_1063485 ) ) ( not ( = ?auto_1063476 ?auto_1063477 ) ) ( not ( = ?auto_1063476 ?auto_1063478 ) ) ( not ( = ?auto_1063476 ?auto_1063479 ) ) ( not ( = ?auto_1063476 ?auto_1063485 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1063477 ?auto_1063478 ?auto_1063479 )
      ( MAKE-10CRATE-VERIFY ?auto_1063470 ?auto_1063471 ?auto_1063472 ?auto_1063469 ?auto_1063473 ?auto_1063475 ?auto_1063474 ?auto_1063476 ?auto_1063477 ?auto_1063478 ?auto_1063479 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1063596 - SURFACE
      ?auto_1063597 - SURFACE
      ?auto_1063598 - SURFACE
      ?auto_1063595 - SURFACE
      ?auto_1063599 - SURFACE
      ?auto_1063601 - SURFACE
      ?auto_1063600 - SURFACE
      ?auto_1063602 - SURFACE
      ?auto_1063603 - SURFACE
      ?auto_1063604 - SURFACE
      ?auto_1063605 - SURFACE
    )
    :vars
    (
      ?auto_1063609 - HOIST
      ?auto_1063607 - PLACE
      ?auto_1063611 - PLACE
      ?auto_1063608 - HOIST
      ?auto_1063610 - SURFACE
      ?auto_1063606 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1063609 ?auto_1063607 ) ( IS-CRATE ?auto_1063605 ) ( not ( = ?auto_1063604 ?auto_1063605 ) ) ( not ( = ?auto_1063603 ?auto_1063604 ) ) ( not ( = ?auto_1063603 ?auto_1063605 ) ) ( not ( = ?auto_1063611 ?auto_1063607 ) ) ( HOIST-AT ?auto_1063608 ?auto_1063611 ) ( not ( = ?auto_1063609 ?auto_1063608 ) ) ( AVAILABLE ?auto_1063608 ) ( SURFACE-AT ?auto_1063605 ?auto_1063611 ) ( ON ?auto_1063605 ?auto_1063610 ) ( CLEAR ?auto_1063605 ) ( not ( = ?auto_1063604 ?auto_1063610 ) ) ( not ( = ?auto_1063605 ?auto_1063610 ) ) ( not ( = ?auto_1063603 ?auto_1063610 ) ) ( TRUCK-AT ?auto_1063606 ?auto_1063607 ) ( SURFACE-AT ?auto_1063603 ?auto_1063607 ) ( CLEAR ?auto_1063603 ) ( LIFTING ?auto_1063609 ?auto_1063604 ) ( IS-CRATE ?auto_1063604 ) ( ON ?auto_1063597 ?auto_1063596 ) ( ON ?auto_1063598 ?auto_1063597 ) ( ON ?auto_1063595 ?auto_1063598 ) ( ON ?auto_1063599 ?auto_1063595 ) ( ON ?auto_1063601 ?auto_1063599 ) ( ON ?auto_1063600 ?auto_1063601 ) ( ON ?auto_1063602 ?auto_1063600 ) ( ON ?auto_1063603 ?auto_1063602 ) ( not ( = ?auto_1063596 ?auto_1063597 ) ) ( not ( = ?auto_1063596 ?auto_1063598 ) ) ( not ( = ?auto_1063596 ?auto_1063595 ) ) ( not ( = ?auto_1063596 ?auto_1063599 ) ) ( not ( = ?auto_1063596 ?auto_1063601 ) ) ( not ( = ?auto_1063596 ?auto_1063600 ) ) ( not ( = ?auto_1063596 ?auto_1063602 ) ) ( not ( = ?auto_1063596 ?auto_1063603 ) ) ( not ( = ?auto_1063596 ?auto_1063604 ) ) ( not ( = ?auto_1063596 ?auto_1063605 ) ) ( not ( = ?auto_1063596 ?auto_1063610 ) ) ( not ( = ?auto_1063597 ?auto_1063598 ) ) ( not ( = ?auto_1063597 ?auto_1063595 ) ) ( not ( = ?auto_1063597 ?auto_1063599 ) ) ( not ( = ?auto_1063597 ?auto_1063601 ) ) ( not ( = ?auto_1063597 ?auto_1063600 ) ) ( not ( = ?auto_1063597 ?auto_1063602 ) ) ( not ( = ?auto_1063597 ?auto_1063603 ) ) ( not ( = ?auto_1063597 ?auto_1063604 ) ) ( not ( = ?auto_1063597 ?auto_1063605 ) ) ( not ( = ?auto_1063597 ?auto_1063610 ) ) ( not ( = ?auto_1063598 ?auto_1063595 ) ) ( not ( = ?auto_1063598 ?auto_1063599 ) ) ( not ( = ?auto_1063598 ?auto_1063601 ) ) ( not ( = ?auto_1063598 ?auto_1063600 ) ) ( not ( = ?auto_1063598 ?auto_1063602 ) ) ( not ( = ?auto_1063598 ?auto_1063603 ) ) ( not ( = ?auto_1063598 ?auto_1063604 ) ) ( not ( = ?auto_1063598 ?auto_1063605 ) ) ( not ( = ?auto_1063598 ?auto_1063610 ) ) ( not ( = ?auto_1063595 ?auto_1063599 ) ) ( not ( = ?auto_1063595 ?auto_1063601 ) ) ( not ( = ?auto_1063595 ?auto_1063600 ) ) ( not ( = ?auto_1063595 ?auto_1063602 ) ) ( not ( = ?auto_1063595 ?auto_1063603 ) ) ( not ( = ?auto_1063595 ?auto_1063604 ) ) ( not ( = ?auto_1063595 ?auto_1063605 ) ) ( not ( = ?auto_1063595 ?auto_1063610 ) ) ( not ( = ?auto_1063599 ?auto_1063601 ) ) ( not ( = ?auto_1063599 ?auto_1063600 ) ) ( not ( = ?auto_1063599 ?auto_1063602 ) ) ( not ( = ?auto_1063599 ?auto_1063603 ) ) ( not ( = ?auto_1063599 ?auto_1063604 ) ) ( not ( = ?auto_1063599 ?auto_1063605 ) ) ( not ( = ?auto_1063599 ?auto_1063610 ) ) ( not ( = ?auto_1063601 ?auto_1063600 ) ) ( not ( = ?auto_1063601 ?auto_1063602 ) ) ( not ( = ?auto_1063601 ?auto_1063603 ) ) ( not ( = ?auto_1063601 ?auto_1063604 ) ) ( not ( = ?auto_1063601 ?auto_1063605 ) ) ( not ( = ?auto_1063601 ?auto_1063610 ) ) ( not ( = ?auto_1063600 ?auto_1063602 ) ) ( not ( = ?auto_1063600 ?auto_1063603 ) ) ( not ( = ?auto_1063600 ?auto_1063604 ) ) ( not ( = ?auto_1063600 ?auto_1063605 ) ) ( not ( = ?auto_1063600 ?auto_1063610 ) ) ( not ( = ?auto_1063602 ?auto_1063603 ) ) ( not ( = ?auto_1063602 ?auto_1063604 ) ) ( not ( = ?auto_1063602 ?auto_1063605 ) ) ( not ( = ?auto_1063602 ?auto_1063610 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1063603 ?auto_1063604 ?auto_1063605 )
      ( MAKE-10CRATE-VERIFY ?auto_1063596 ?auto_1063597 ?auto_1063598 ?auto_1063595 ?auto_1063599 ?auto_1063601 ?auto_1063600 ?auto_1063602 ?auto_1063603 ?auto_1063604 ?auto_1063605 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1063722 - SURFACE
      ?auto_1063723 - SURFACE
      ?auto_1063724 - SURFACE
      ?auto_1063721 - SURFACE
      ?auto_1063725 - SURFACE
      ?auto_1063727 - SURFACE
      ?auto_1063726 - SURFACE
      ?auto_1063728 - SURFACE
      ?auto_1063729 - SURFACE
      ?auto_1063730 - SURFACE
      ?auto_1063731 - SURFACE
    )
    :vars
    (
      ?auto_1063734 - HOIST
      ?auto_1063737 - PLACE
      ?auto_1063735 - PLACE
      ?auto_1063732 - HOIST
      ?auto_1063733 - SURFACE
      ?auto_1063736 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1063734 ?auto_1063737 ) ( IS-CRATE ?auto_1063731 ) ( not ( = ?auto_1063730 ?auto_1063731 ) ) ( not ( = ?auto_1063729 ?auto_1063730 ) ) ( not ( = ?auto_1063729 ?auto_1063731 ) ) ( not ( = ?auto_1063735 ?auto_1063737 ) ) ( HOIST-AT ?auto_1063732 ?auto_1063735 ) ( not ( = ?auto_1063734 ?auto_1063732 ) ) ( AVAILABLE ?auto_1063732 ) ( SURFACE-AT ?auto_1063731 ?auto_1063735 ) ( ON ?auto_1063731 ?auto_1063733 ) ( CLEAR ?auto_1063731 ) ( not ( = ?auto_1063730 ?auto_1063733 ) ) ( not ( = ?auto_1063731 ?auto_1063733 ) ) ( not ( = ?auto_1063729 ?auto_1063733 ) ) ( TRUCK-AT ?auto_1063736 ?auto_1063737 ) ( SURFACE-AT ?auto_1063729 ?auto_1063737 ) ( CLEAR ?auto_1063729 ) ( IS-CRATE ?auto_1063730 ) ( AVAILABLE ?auto_1063734 ) ( IN ?auto_1063730 ?auto_1063736 ) ( ON ?auto_1063723 ?auto_1063722 ) ( ON ?auto_1063724 ?auto_1063723 ) ( ON ?auto_1063721 ?auto_1063724 ) ( ON ?auto_1063725 ?auto_1063721 ) ( ON ?auto_1063727 ?auto_1063725 ) ( ON ?auto_1063726 ?auto_1063727 ) ( ON ?auto_1063728 ?auto_1063726 ) ( ON ?auto_1063729 ?auto_1063728 ) ( not ( = ?auto_1063722 ?auto_1063723 ) ) ( not ( = ?auto_1063722 ?auto_1063724 ) ) ( not ( = ?auto_1063722 ?auto_1063721 ) ) ( not ( = ?auto_1063722 ?auto_1063725 ) ) ( not ( = ?auto_1063722 ?auto_1063727 ) ) ( not ( = ?auto_1063722 ?auto_1063726 ) ) ( not ( = ?auto_1063722 ?auto_1063728 ) ) ( not ( = ?auto_1063722 ?auto_1063729 ) ) ( not ( = ?auto_1063722 ?auto_1063730 ) ) ( not ( = ?auto_1063722 ?auto_1063731 ) ) ( not ( = ?auto_1063722 ?auto_1063733 ) ) ( not ( = ?auto_1063723 ?auto_1063724 ) ) ( not ( = ?auto_1063723 ?auto_1063721 ) ) ( not ( = ?auto_1063723 ?auto_1063725 ) ) ( not ( = ?auto_1063723 ?auto_1063727 ) ) ( not ( = ?auto_1063723 ?auto_1063726 ) ) ( not ( = ?auto_1063723 ?auto_1063728 ) ) ( not ( = ?auto_1063723 ?auto_1063729 ) ) ( not ( = ?auto_1063723 ?auto_1063730 ) ) ( not ( = ?auto_1063723 ?auto_1063731 ) ) ( not ( = ?auto_1063723 ?auto_1063733 ) ) ( not ( = ?auto_1063724 ?auto_1063721 ) ) ( not ( = ?auto_1063724 ?auto_1063725 ) ) ( not ( = ?auto_1063724 ?auto_1063727 ) ) ( not ( = ?auto_1063724 ?auto_1063726 ) ) ( not ( = ?auto_1063724 ?auto_1063728 ) ) ( not ( = ?auto_1063724 ?auto_1063729 ) ) ( not ( = ?auto_1063724 ?auto_1063730 ) ) ( not ( = ?auto_1063724 ?auto_1063731 ) ) ( not ( = ?auto_1063724 ?auto_1063733 ) ) ( not ( = ?auto_1063721 ?auto_1063725 ) ) ( not ( = ?auto_1063721 ?auto_1063727 ) ) ( not ( = ?auto_1063721 ?auto_1063726 ) ) ( not ( = ?auto_1063721 ?auto_1063728 ) ) ( not ( = ?auto_1063721 ?auto_1063729 ) ) ( not ( = ?auto_1063721 ?auto_1063730 ) ) ( not ( = ?auto_1063721 ?auto_1063731 ) ) ( not ( = ?auto_1063721 ?auto_1063733 ) ) ( not ( = ?auto_1063725 ?auto_1063727 ) ) ( not ( = ?auto_1063725 ?auto_1063726 ) ) ( not ( = ?auto_1063725 ?auto_1063728 ) ) ( not ( = ?auto_1063725 ?auto_1063729 ) ) ( not ( = ?auto_1063725 ?auto_1063730 ) ) ( not ( = ?auto_1063725 ?auto_1063731 ) ) ( not ( = ?auto_1063725 ?auto_1063733 ) ) ( not ( = ?auto_1063727 ?auto_1063726 ) ) ( not ( = ?auto_1063727 ?auto_1063728 ) ) ( not ( = ?auto_1063727 ?auto_1063729 ) ) ( not ( = ?auto_1063727 ?auto_1063730 ) ) ( not ( = ?auto_1063727 ?auto_1063731 ) ) ( not ( = ?auto_1063727 ?auto_1063733 ) ) ( not ( = ?auto_1063726 ?auto_1063728 ) ) ( not ( = ?auto_1063726 ?auto_1063729 ) ) ( not ( = ?auto_1063726 ?auto_1063730 ) ) ( not ( = ?auto_1063726 ?auto_1063731 ) ) ( not ( = ?auto_1063726 ?auto_1063733 ) ) ( not ( = ?auto_1063728 ?auto_1063729 ) ) ( not ( = ?auto_1063728 ?auto_1063730 ) ) ( not ( = ?auto_1063728 ?auto_1063731 ) ) ( not ( = ?auto_1063728 ?auto_1063733 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1063729 ?auto_1063730 ?auto_1063731 )
      ( MAKE-10CRATE-VERIFY ?auto_1063722 ?auto_1063723 ?auto_1063724 ?auto_1063721 ?auto_1063725 ?auto_1063727 ?auto_1063726 ?auto_1063728 ?auto_1063729 ?auto_1063730 ?auto_1063731 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1070987 - SURFACE
      ?auto_1070988 - SURFACE
      ?auto_1070989 - SURFACE
      ?auto_1070986 - SURFACE
      ?auto_1070990 - SURFACE
      ?auto_1070992 - SURFACE
      ?auto_1070991 - SURFACE
      ?auto_1070993 - SURFACE
      ?auto_1070994 - SURFACE
      ?auto_1070995 - SURFACE
      ?auto_1070996 - SURFACE
      ?auto_1070997 - SURFACE
    )
    :vars
    (
      ?auto_1070999 - HOIST
      ?auto_1070998 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1070999 ?auto_1070998 ) ( SURFACE-AT ?auto_1070996 ?auto_1070998 ) ( CLEAR ?auto_1070996 ) ( LIFTING ?auto_1070999 ?auto_1070997 ) ( IS-CRATE ?auto_1070997 ) ( not ( = ?auto_1070996 ?auto_1070997 ) ) ( ON ?auto_1070988 ?auto_1070987 ) ( ON ?auto_1070989 ?auto_1070988 ) ( ON ?auto_1070986 ?auto_1070989 ) ( ON ?auto_1070990 ?auto_1070986 ) ( ON ?auto_1070992 ?auto_1070990 ) ( ON ?auto_1070991 ?auto_1070992 ) ( ON ?auto_1070993 ?auto_1070991 ) ( ON ?auto_1070994 ?auto_1070993 ) ( ON ?auto_1070995 ?auto_1070994 ) ( ON ?auto_1070996 ?auto_1070995 ) ( not ( = ?auto_1070987 ?auto_1070988 ) ) ( not ( = ?auto_1070987 ?auto_1070989 ) ) ( not ( = ?auto_1070987 ?auto_1070986 ) ) ( not ( = ?auto_1070987 ?auto_1070990 ) ) ( not ( = ?auto_1070987 ?auto_1070992 ) ) ( not ( = ?auto_1070987 ?auto_1070991 ) ) ( not ( = ?auto_1070987 ?auto_1070993 ) ) ( not ( = ?auto_1070987 ?auto_1070994 ) ) ( not ( = ?auto_1070987 ?auto_1070995 ) ) ( not ( = ?auto_1070987 ?auto_1070996 ) ) ( not ( = ?auto_1070987 ?auto_1070997 ) ) ( not ( = ?auto_1070988 ?auto_1070989 ) ) ( not ( = ?auto_1070988 ?auto_1070986 ) ) ( not ( = ?auto_1070988 ?auto_1070990 ) ) ( not ( = ?auto_1070988 ?auto_1070992 ) ) ( not ( = ?auto_1070988 ?auto_1070991 ) ) ( not ( = ?auto_1070988 ?auto_1070993 ) ) ( not ( = ?auto_1070988 ?auto_1070994 ) ) ( not ( = ?auto_1070988 ?auto_1070995 ) ) ( not ( = ?auto_1070988 ?auto_1070996 ) ) ( not ( = ?auto_1070988 ?auto_1070997 ) ) ( not ( = ?auto_1070989 ?auto_1070986 ) ) ( not ( = ?auto_1070989 ?auto_1070990 ) ) ( not ( = ?auto_1070989 ?auto_1070992 ) ) ( not ( = ?auto_1070989 ?auto_1070991 ) ) ( not ( = ?auto_1070989 ?auto_1070993 ) ) ( not ( = ?auto_1070989 ?auto_1070994 ) ) ( not ( = ?auto_1070989 ?auto_1070995 ) ) ( not ( = ?auto_1070989 ?auto_1070996 ) ) ( not ( = ?auto_1070989 ?auto_1070997 ) ) ( not ( = ?auto_1070986 ?auto_1070990 ) ) ( not ( = ?auto_1070986 ?auto_1070992 ) ) ( not ( = ?auto_1070986 ?auto_1070991 ) ) ( not ( = ?auto_1070986 ?auto_1070993 ) ) ( not ( = ?auto_1070986 ?auto_1070994 ) ) ( not ( = ?auto_1070986 ?auto_1070995 ) ) ( not ( = ?auto_1070986 ?auto_1070996 ) ) ( not ( = ?auto_1070986 ?auto_1070997 ) ) ( not ( = ?auto_1070990 ?auto_1070992 ) ) ( not ( = ?auto_1070990 ?auto_1070991 ) ) ( not ( = ?auto_1070990 ?auto_1070993 ) ) ( not ( = ?auto_1070990 ?auto_1070994 ) ) ( not ( = ?auto_1070990 ?auto_1070995 ) ) ( not ( = ?auto_1070990 ?auto_1070996 ) ) ( not ( = ?auto_1070990 ?auto_1070997 ) ) ( not ( = ?auto_1070992 ?auto_1070991 ) ) ( not ( = ?auto_1070992 ?auto_1070993 ) ) ( not ( = ?auto_1070992 ?auto_1070994 ) ) ( not ( = ?auto_1070992 ?auto_1070995 ) ) ( not ( = ?auto_1070992 ?auto_1070996 ) ) ( not ( = ?auto_1070992 ?auto_1070997 ) ) ( not ( = ?auto_1070991 ?auto_1070993 ) ) ( not ( = ?auto_1070991 ?auto_1070994 ) ) ( not ( = ?auto_1070991 ?auto_1070995 ) ) ( not ( = ?auto_1070991 ?auto_1070996 ) ) ( not ( = ?auto_1070991 ?auto_1070997 ) ) ( not ( = ?auto_1070993 ?auto_1070994 ) ) ( not ( = ?auto_1070993 ?auto_1070995 ) ) ( not ( = ?auto_1070993 ?auto_1070996 ) ) ( not ( = ?auto_1070993 ?auto_1070997 ) ) ( not ( = ?auto_1070994 ?auto_1070995 ) ) ( not ( = ?auto_1070994 ?auto_1070996 ) ) ( not ( = ?auto_1070994 ?auto_1070997 ) ) ( not ( = ?auto_1070995 ?auto_1070996 ) ) ( not ( = ?auto_1070995 ?auto_1070997 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1070996 ?auto_1070997 )
      ( MAKE-11CRATE-VERIFY ?auto_1070987 ?auto_1070988 ?auto_1070989 ?auto_1070986 ?auto_1070990 ?auto_1070992 ?auto_1070991 ?auto_1070993 ?auto_1070994 ?auto_1070995 ?auto_1070996 ?auto_1070997 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1071096 - SURFACE
      ?auto_1071097 - SURFACE
      ?auto_1071098 - SURFACE
      ?auto_1071095 - SURFACE
      ?auto_1071099 - SURFACE
      ?auto_1071101 - SURFACE
      ?auto_1071100 - SURFACE
      ?auto_1071102 - SURFACE
      ?auto_1071103 - SURFACE
      ?auto_1071104 - SURFACE
      ?auto_1071105 - SURFACE
      ?auto_1071106 - SURFACE
    )
    :vars
    (
      ?auto_1071109 - HOIST
      ?auto_1071108 - PLACE
      ?auto_1071107 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1071109 ?auto_1071108 ) ( SURFACE-AT ?auto_1071105 ?auto_1071108 ) ( CLEAR ?auto_1071105 ) ( IS-CRATE ?auto_1071106 ) ( not ( = ?auto_1071105 ?auto_1071106 ) ) ( TRUCK-AT ?auto_1071107 ?auto_1071108 ) ( AVAILABLE ?auto_1071109 ) ( IN ?auto_1071106 ?auto_1071107 ) ( ON ?auto_1071105 ?auto_1071104 ) ( not ( = ?auto_1071104 ?auto_1071105 ) ) ( not ( = ?auto_1071104 ?auto_1071106 ) ) ( ON ?auto_1071097 ?auto_1071096 ) ( ON ?auto_1071098 ?auto_1071097 ) ( ON ?auto_1071095 ?auto_1071098 ) ( ON ?auto_1071099 ?auto_1071095 ) ( ON ?auto_1071101 ?auto_1071099 ) ( ON ?auto_1071100 ?auto_1071101 ) ( ON ?auto_1071102 ?auto_1071100 ) ( ON ?auto_1071103 ?auto_1071102 ) ( ON ?auto_1071104 ?auto_1071103 ) ( not ( = ?auto_1071096 ?auto_1071097 ) ) ( not ( = ?auto_1071096 ?auto_1071098 ) ) ( not ( = ?auto_1071096 ?auto_1071095 ) ) ( not ( = ?auto_1071096 ?auto_1071099 ) ) ( not ( = ?auto_1071096 ?auto_1071101 ) ) ( not ( = ?auto_1071096 ?auto_1071100 ) ) ( not ( = ?auto_1071096 ?auto_1071102 ) ) ( not ( = ?auto_1071096 ?auto_1071103 ) ) ( not ( = ?auto_1071096 ?auto_1071104 ) ) ( not ( = ?auto_1071096 ?auto_1071105 ) ) ( not ( = ?auto_1071096 ?auto_1071106 ) ) ( not ( = ?auto_1071097 ?auto_1071098 ) ) ( not ( = ?auto_1071097 ?auto_1071095 ) ) ( not ( = ?auto_1071097 ?auto_1071099 ) ) ( not ( = ?auto_1071097 ?auto_1071101 ) ) ( not ( = ?auto_1071097 ?auto_1071100 ) ) ( not ( = ?auto_1071097 ?auto_1071102 ) ) ( not ( = ?auto_1071097 ?auto_1071103 ) ) ( not ( = ?auto_1071097 ?auto_1071104 ) ) ( not ( = ?auto_1071097 ?auto_1071105 ) ) ( not ( = ?auto_1071097 ?auto_1071106 ) ) ( not ( = ?auto_1071098 ?auto_1071095 ) ) ( not ( = ?auto_1071098 ?auto_1071099 ) ) ( not ( = ?auto_1071098 ?auto_1071101 ) ) ( not ( = ?auto_1071098 ?auto_1071100 ) ) ( not ( = ?auto_1071098 ?auto_1071102 ) ) ( not ( = ?auto_1071098 ?auto_1071103 ) ) ( not ( = ?auto_1071098 ?auto_1071104 ) ) ( not ( = ?auto_1071098 ?auto_1071105 ) ) ( not ( = ?auto_1071098 ?auto_1071106 ) ) ( not ( = ?auto_1071095 ?auto_1071099 ) ) ( not ( = ?auto_1071095 ?auto_1071101 ) ) ( not ( = ?auto_1071095 ?auto_1071100 ) ) ( not ( = ?auto_1071095 ?auto_1071102 ) ) ( not ( = ?auto_1071095 ?auto_1071103 ) ) ( not ( = ?auto_1071095 ?auto_1071104 ) ) ( not ( = ?auto_1071095 ?auto_1071105 ) ) ( not ( = ?auto_1071095 ?auto_1071106 ) ) ( not ( = ?auto_1071099 ?auto_1071101 ) ) ( not ( = ?auto_1071099 ?auto_1071100 ) ) ( not ( = ?auto_1071099 ?auto_1071102 ) ) ( not ( = ?auto_1071099 ?auto_1071103 ) ) ( not ( = ?auto_1071099 ?auto_1071104 ) ) ( not ( = ?auto_1071099 ?auto_1071105 ) ) ( not ( = ?auto_1071099 ?auto_1071106 ) ) ( not ( = ?auto_1071101 ?auto_1071100 ) ) ( not ( = ?auto_1071101 ?auto_1071102 ) ) ( not ( = ?auto_1071101 ?auto_1071103 ) ) ( not ( = ?auto_1071101 ?auto_1071104 ) ) ( not ( = ?auto_1071101 ?auto_1071105 ) ) ( not ( = ?auto_1071101 ?auto_1071106 ) ) ( not ( = ?auto_1071100 ?auto_1071102 ) ) ( not ( = ?auto_1071100 ?auto_1071103 ) ) ( not ( = ?auto_1071100 ?auto_1071104 ) ) ( not ( = ?auto_1071100 ?auto_1071105 ) ) ( not ( = ?auto_1071100 ?auto_1071106 ) ) ( not ( = ?auto_1071102 ?auto_1071103 ) ) ( not ( = ?auto_1071102 ?auto_1071104 ) ) ( not ( = ?auto_1071102 ?auto_1071105 ) ) ( not ( = ?auto_1071102 ?auto_1071106 ) ) ( not ( = ?auto_1071103 ?auto_1071104 ) ) ( not ( = ?auto_1071103 ?auto_1071105 ) ) ( not ( = ?auto_1071103 ?auto_1071106 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1071104 ?auto_1071105 ?auto_1071106 )
      ( MAKE-11CRATE-VERIFY ?auto_1071096 ?auto_1071097 ?auto_1071098 ?auto_1071095 ?auto_1071099 ?auto_1071101 ?auto_1071100 ?auto_1071102 ?auto_1071103 ?auto_1071104 ?auto_1071105 ?auto_1071106 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1071217 - SURFACE
      ?auto_1071218 - SURFACE
      ?auto_1071219 - SURFACE
      ?auto_1071216 - SURFACE
      ?auto_1071220 - SURFACE
      ?auto_1071222 - SURFACE
      ?auto_1071221 - SURFACE
      ?auto_1071223 - SURFACE
      ?auto_1071224 - SURFACE
      ?auto_1071225 - SURFACE
      ?auto_1071226 - SURFACE
      ?auto_1071227 - SURFACE
    )
    :vars
    (
      ?auto_1071231 - HOIST
      ?auto_1071228 - PLACE
      ?auto_1071229 - TRUCK
      ?auto_1071230 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1071231 ?auto_1071228 ) ( SURFACE-AT ?auto_1071226 ?auto_1071228 ) ( CLEAR ?auto_1071226 ) ( IS-CRATE ?auto_1071227 ) ( not ( = ?auto_1071226 ?auto_1071227 ) ) ( AVAILABLE ?auto_1071231 ) ( IN ?auto_1071227 ?auto_1071229 ) ( ON ?auto_1071226 ?auto_1071225 ) ( not ( = ?auto_1071225 ?auto_1071226 ) ) ( not ( = ?auto_1071225 ?auto_1071227 ) ) ( TRUCK-AT ?auto_1071229 ?auto_1071230 ) ( not ( = ?auto_1071230 ?auto_1071228 ) ) ( ON ?auto_1071218 ?auto_1071217 ) ( ON ?auto_1071219 ?auto_1071218 ) ( ON ?auto_1071216 ?auto_1071219 ) ( ON ?auto_1071220 ?auto_1071216 ) ( ON ?auto_1071222 ?auto_1071220 ) ( ON ?auto_1071221 ?auto_1071222 ) ( ON ?auto_1071223 ?auto_1071221 ) ( ON ?auto_1071224 ?auto_1071223 ) ( ON ?auto_1071225 ?auto_1071224 ) ( not ( = ?auto_1071217 ?auto_1071218 ) ) ( not ( = ?auto_1071217 ?auto_1071219 ) ) ( not ( = ?auto_1071217 ?auto_1071216 ) ) ( not ( = ?auto_1071217 ?auto_1071220 ) ) ( not ( = ?auto_1071217 ?auto_1071222 ) ) ( not ( = ?auto_1071217 ?auto_1071221 ) ) ( not ( = ?auto_1071217 ?auto_1071223 ) ) ( not ( = ?auto_1071217 ?auto_1071224 ) ) ( not ( = ?auto_1071217 ?auto_1071225 ) ) ( not ( = ?auto_1071217 ?auto_1071226 ) ) ( not ( = ?auto_1071217 ?auto_1071227 ) ) ( not ( = ?auto_1071218 ?auto_1071219 ) ) ( not ( = ?auto_1071218 ?auto_1071216 ) ) ( not ( = ?auto_1071218 ?auto_1071220 ) ) ( not ( = ?auto_1071218 ?auto_1071222 ) ) ( not ( = ?auto_1071218 ?auto_1071221 ) ) ( not ( = ?auto_1071218 ?auto_1071223 ) ) ( not ( = ?auto_1071218 ?auto_1071224 ) ) ( not ( = ?auto_1071218 ?auto_1071225 ) ) ( not ( = ?auto_1071218 ?auto_1071226 ) ) ( not ( = ?auto_1071218 ?auto_1071227 ) ) ( not ( = ?auto_1071219 ?auto_1071216 ) ) ( not ( = ?auto_1071219 ?auto_1071220 ) ) ( not ( = ?auto_1071219 ?auto_1071222 ) ) ( not ( = ?auto_1071219 ?auto_1071221 ) ) ( not ( = ?auto_1071219 ?auto_1071223 ) ) ( not ( = ?auto_1071219 ?auto_1071224 ) ) ( not ( = ?auto_1071219 ?auto_1071225 ) ) ( not ( = ?auto_1071219 ?auto_1071226 ) ) ( not ( = ?auto_1071219 ?auto_1071227 ) ) ( not ( = ?auto_1071216 ?auto_1071220 ) ) ( not ( = ?auto_1071216 ?auto_1071222 ) ) ( not ( = ?auto_1071216 ?auto_1071221 ) ) ( not ( = ?auto_1071216 ?auto_1071223 ) ) ( not ( = ?auto_1071216 ?auto_1071224 ) ) ( not ( = ?auto_1071216 ?auto_1071225 ) ) ( not ( = ?auto_1071216 ?auto_1071226 ) ) ( not ( = ?auto_1071216 ?auto_1071227 ) ) ( not ( = ?auto_1071220 ?auto_1071222 ) ) ( not ( = ?auto_1071220 ?auto_1071221 ) ) ( not ( = ?auto_1071220 ?auto_1071223 ) ) ( not ( = ?auto_1071220 ?auto_1071224 ) ) ( not ( = ?auto_1071220 ?auto_1071225 ) ) ( not ( = ?auto_1071220 ?auto_1071226 ) ) ( not ( = ?auto_1071220 ?auto_1071227 ) ) ( not ( = ?auto_1071222 ?auto_1071221 ) ) ( not ( = ?auto_1071222 ?auto_1071223 ) ) ( not ( = ?auto_1071222 ?auto_1071224 ) ) ( not ( = ?auto_1071222 ?auto_1071225 ) ) ( not ( = ?auto_1071222 ?auto_1071226 ) ) ( not ( = ?auto_1071222 ?auto_1071227 ) ) ( not ( = ?auto_1071221 ?auto_1071223 ) ) ( not ( = ?auto_1071221 ?auto_1071224 ) ) ( not ( = ?auto_1071221 ?auto_1071225 ) ) ( not ( = ?auto_1071221 ?auto_1071226 ) ) ( not ( = ?auto_1071221 ?auto_1071227 ) ) ( not ( = ?auto_1071223 ?auto_1071224 ) ) ( not ( = ?auto_1071223 ?auto_1071225 ) ) ( not ( = ?auto_1071223 ?auto_1071226 ) ) ( not ( = ?auto_1071223 ?auto_1071227 ) ) ( not ( = ?auto_1071224 ?auto_1071225 ) ) ( not ( = ?auto_1071224 ?auto_1071226 ) ) ( not ( = ?auto_1071224 ?auto_1071227 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1071225 ?auto_1071226 ?auto_1071227 )
      ( MAKE-11CRATE-VERIFY ?auto_1071217 ?auto_1071218 ?auto_1071219 ?auto_1071216 ?auto_1071220 ?auto_1071222 ?auto_1071221 ?auto_1071223 ?auto_1071224 ?auto_1071225 ?auto_1071226 ?auto_1071227 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1071349 - SURFACE
      ?auto_1071350 - SURFACE
      ?auto_1071351 - SURFACE
      ?auto_1071348 - SURFACE
      ?auto_1071352 - SURFACE
      ?auto_1071354 - SURFACE
      ?auto_1071353 - SURFACE
      ?auto_1071355 - SURFACE
      ?auto_1071356 - SURFACE
      ?auto_1071357 - SURFACE
      ?auto_1071358 - SURFACE
      ?auto_1071359 - SURFACE
    )
    :vars
    (
      ?auto_1071363 - HOIST
      ?auto_1071362 - PLACE
      ?auto_1071361 - TRUCK
      ?auto_1071360 - PLACE
      ?auto_1071364 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1071363 ?auto_1071362 ) ( SURFACE-AT ?auto_1071358 ?auto_1071362 ) ( CLEAR ?auto_1071358 ) ( IS-CRATE ?auto_1071359 ) ( not ( = ?auto_1071358 ?auto_1071359 ) ) ( AVAILABLE ?auto_1071363 ) ( ON ?auto_1071358 ?auto_1071357 ) ( not ( = ?auto_1071357 ?auto_1071358 ) ) ( not ( = ?auto_1071357 ?auto_1071359 ) ) ( TRUCK-AT ?auto_1071361 ?auto_1071360 ) ( not ( = ?auto_1071360 ?auto_1071362 ) ) ( HOIST-AT ?auto_1071364 ?auto_1071360 ) ( LIFTING ?auto_1071364 ?auto_1071359 ) ( not ( = ?auto_1071363 ?auto_1071364 ) ) ( ON ?auto_1071350 ?auto_1071349 ) ( ON ?auto_1071351 ?auto_1071350 ) ( ON ?auto_1071348 ?auto_1071351 ) ( ON ?auto_1071352 ?auto_1071348 ) ( ON ?auto_1071354 ?auto_1071352 ) ( ON ?auto_1071353 ?auto_1071354 ) ( ON ?auto_1071355 ?auto_1071353 ) ( ON ?auto_1071356 ?auto_1071355 ) ( ON ?auto_1071357 ?auto_1071356 ) ( not ( = ?auto_1071349 ?auto_1071350 ) ) ( not ( = ?auto_1071349 ?auto_1071351 ) ) ( not ( = ?auto_1071349 ?auto_1071348 ) ) ( not ( = ?auto_1071349 ?auto_1071352 ) ) ( not ( = ?auto_1071349 ?auto_1071354 ) ) ( not ( = ?auto_1071349 ?auto_1071353 ) ) ( not ( = ?auto_1071349 ?auto_1071355 ) ) ( not ( = ?auto_1071349 ?auto_1071356 ) ) ( not ( = ?auto_1071349 ?auto_1071357 ) ) ( not ( = ?auto_1071349 ?auto_1071358 ) ) ( not ( = ?auto_1071349 ?auto_1071359 ) ) ( not ( = ?auto_1071350 ?auto_1071351 ) ) ( not ( = ?auto_1071350 ?auto_1071348 ) ) ( not ( = ?auto_1071350 ?auto_1071352 ) ) ( not ( = ?auto_1071350 ?auto_1071354 ) ) ( not ( = ?auto_1071350 ?auto_1071353 ) ) ( not ( = ?auto_1071350 ?auto_1071355 ) ) ( not ( = ?auto_1071350 ?auto_1071356 ) ) ( not ( = ?auto_1071350 ?auto_1071357 ) ) ( not ( = ?auto_1071350 ?auto_1071358 ) ) ( not ( = ?auto_1071350 ?auto_1071359 ) ) ( not ( = ?auto_1071351 ?auto_1071348 ) ) ( not ( = ?auto_1071351 ?auto_1071352 ) ) ( not ( = ?auto_1071351 ?auto_1071354 ) ) ( not ( = ?auto_1071351 ?auto_1071353 ) ) ( not ( = ?auto_1071351 ?auto_1071355 ) ) ( not ( = ?auto_1071351 ?auto_1071356 ) ) ( not ( = ?auto_1071351 ?auto_1071357 ) ) ( not ( = ?auto_1071351 ?auto_1071358 ) ) ( not ( = ?auto_1071351 ?auto_1071359 ) ) ( not ( = ?auto_1071348 ?auto_1071352 ) ) ( not ( = ?auto_1071348 ?auto_1071354 ) ) ( not ( = ?auto_1071348 ?auto_1071353 ) ) ( not ( = ?auto_1071348 ?auto_1071355 ) ) ( not ( = ?auto_1071348 ?auto_1071356 ) ) ( not ( = ?auto_1071348 ?auto_1071357 ) ) ( not ( = ?auto_1071348 ?auto_1071358 ) ) ( not ( = ?auto_1071348 ?auto_1071359 ) ) ( not ( = ?auto_1071352 ?auto_1071354 ) ) ( not ( = ?auto_1071352 ?auto_1071353 ) ) ( not ( = ?auto_1071352 ?auto_1071355 ) ) ( not ( = ?auto_1071352 ?auto_1071356 ) ) ( not ( = ?auto_1071352 ?auto_1071357 ) ) ( not ( = ?auto_1071352 ?auto_1071358 ) ) ( not ( = ?auto_1071352 ?auto_1071359 ) ) ( not ( = ?auto_1071354 ?auto_1071353 ) ) ( not ( = ?auto_1071354 ?auto_1071355 ) ) ( not ( = ?auto_1071354 ?auto_1071356 ) ) ( not ( = ?auto_1071354 ?auto_1071357 ) ) ( not ( = ?auto_1071354 ?auto_1071358 ) ) ( not ( = ?auto_1071354 ?auto_1071359 ) ) ( not ( = ?auto_1071353 ?auto_1071355 ) ) ( not ( = ?auto_1071353 ?auto_1071356 ) ) ( not ( = ?auto_1071353 ?auto_1071357 ) ) ( not ( = ?auto_1071353 ?auto_1071358 ) ) ( not ( = ?auto_1071353 ?auto_1071359 ) ) ( not ( = ?auto_1071355 ?auto_1071356 ) ) ( not ( = ?auto_1071355 ?auto_1071357 ) ) ( not ( = ?auto_1071355 ?auto_1071358 ) ) ( not ( = ?auto_1071355 ?auto_1071359 ) ) ( not ( = ?auto_1071356 ?auto_1071357 ) ) ( not ( = ?auto_1071356 ?auto_1071358 ) ) ( not ( = ?auto_1071356 ?auto_1071359 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1071357 ?auto_1071358 ?auto_1071359 )
      ( MAKE-11CRATE-VERIFY ?auto_1071349 ?auto_1071350 ?auto_1071351 ?auto_1071348 ?auto_1071352 ?auto_1071354 ?auto_1071353 ?auto_1071355 ?auto_1071356 ?auto_1071357 ?auto_1071358 ?auto_1071359 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1071492 - SURFACE
      ?auto_1071493 - SURFACE
      ?auto_1071494 - SURFACE
      ?auto_1071491 - SURFACE
      ?auto_1071495 - SURFACE
      ?auto_1071497 - SURFACE
      ?auto_1071496 - SURFACE
      ?auto_1071498 - SURFACE
      ?auto_1071499 - SURFACE
      ?auto_1071500 - SURFACE
      ?auto_1071501 - SURFACE
      ?auto_1071502 - SURFACE
    )
    :vars
    (
      ?auto_1071505 - HOIST
      ?auto_1071506 - PLACE
      ?auto_1071503 - TRUCK
      ?auto_1071508 - PLACE
      ?auto_1071507 - HOIST
      ?auto_1071504 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1071505 ?auto_1071506 ) ( SURFACE-AT ?auto_1071501 ?auto_1071506 ) ( CLEAR ?auto_1071501 ) ( IS-CRATE ?auto_1071502 ) ( not ( = ?auto_1071501 ?auto_1071502 ) ) ( AVAILABLE ?auto_1071505 ) ( ON ?auto_1071501 ?auto_1071500 ) ( not ( = ?auto_1071500 ?auto_1071501 ) ) ( not ( = ?auto_1071500 ?auto_1071502 ) ) ( TRUCK-AT ?auto_1071503 ?auto_1071508 ) ( not ( = ?auto_1071508 ?auto_1071506 ) ) ( HOIST-AT ?auto_1071507 ?auto_1071508 ) ( not ( = ?auto_1071505 ?auto_1071507 ) ) ( AVAILABLE ?auto_1071507 ) ( SURFACE-AT ?auto_1071502 ?auto_1071508 ) ( ON ?auto_1071502 ?auto_1071504 ) ( CLEAR ?auto_1071502 ) ( not ( = ?auto_1071501 ?auto_1071504 ) ) ( not ( = ?auto_1071502 ?auto_1071504 ) ) ( not ( = ?auto_1071500 ?auto_1071504 ) ) ( ON ?auto_1071493 ?auto_1071492 ) ( ON ?auto_1071494 ?auto_1071493 ) ( ON ?auto_1071491 ?auto_1071494 ) ( ON ?auto_1071495 ?auto_1071491 ) ( ON ?auto_1071497 ?auto_1071495 ) ( ON ?auto_1071496 ?auto_1071497 ) ( ON ?auto_1071498 ?auto_1071496 ) ( ON ?auto_1071499 ?auto_1071498 ) ( ON ?auto_1071500 ?auto_1071499 ) ( not ( = ?auto_1071492 ?auto_1071493 ) ) ( not ( = ?auto_1071492 ?auto_1071494 ) ) ( not ( = ?auto_1071492 ?auto_1071491 ) ) ( not ( = ?auto_1071492 ?auto_1071495 ) ) ( not ( = ?auto_1071492 ?auto_1071497 ) ) ( not ( = ?auto_1071492 ?auto_1071496 ) ) ( not ( = ?auto_1071492 ?auto_1071498 ) ) ( not ( = ?auto_1071492 ?auto_1071499 ) ) ( not ( = ?auto_1071492 ?auto_1071500 ) ) ( not ( = ?auto_1071492 ?auto_1071501 ) ) ( not ( = ?auto_1071492 ?auto_1071502 ) ) ( not ( = ?auto_1071492 ?auto_1071504 ) ) ( not ( = ?auto_1071493 ?auto_1071494 ) ) ( not ( = ?auto_1071493 ?auto_1071491 ) ) ( not ( = ?auto_1071493 ?auto_1071495 ) ) ( not ( = ?auto_1071493 ?auto_1071497 ) ) ( not ( = ?auto_1071493 ?auto_1071496 ) ) ( not ( = ?auto_1071493 ?auto_1071498 ) ) ( not ( = ?auto_1071493 ?auto_1071499 ) ) ( not ( = ?auto_1071493 ?auto_1071500 ) ) ( not ( = ?auto_1071493 ?auto_1071501 ) ) ( not ( = ?auto_1071493 ?auto_1071502 ) ) ( not ( = ?auto_1071493 ?auto_1071504 ) ) ( not ( = ?auto_1071494 ?auto_1071491 ) ) ( not ( = ?auto_1071494 ?auto_1071495 ) ) ( not ( = ?auto_1071494 ?auto_1071497 ) ) ( not ( = ?auto_1071494 ?auto_1071496 ) ) ( not ( = ?auto_1071494 ?auto_1071498 ) ) ( not ( = ?auto_1071494 ?auto_1071499 ) ) ( not ( = ?auto_1071494 ?auto_1071500 ) ) ( not ( = ?auto_1071494 ?auto_1071501 ) ) ( not ( = ?auto_1071494 ?auto_1071502 ) ) ( not ( = ?auto_1071494 ?auto_1071504 ) ) ( not ( = ?auto_1071491 ?auto_1071495 ) ) ( not ( = ?auto_1071491 ?auto_1071497 ) ) ( not ( = ?auto_1071491 ?auto_1071496 ) ) ( not ( = ?auto_1071491 ?auto_1071498 ) ) ( not ( = ?auto_1071491 ?auto_1071499 ) ) ( not ( = ?auto_1071491 ?auto_1071500 ) ) ( not ( = ?auto_1071491 ?auto_1071501 ) ) ( not ( = ?auto_1071491 ?auto_1071502 ) ) ( not ( = ?auto_1071491 ?auto_1071504 ) ) ( not ( = ?auto_1071495 ?auto_1071497 ) ) ( not ( = ?auto_1071495 ?auto_1071496 ) ) ( not ( = ?auto_1071495 ?auto_1071498 ) ) ( not ( = ?auto_1071495 ?auto_1071499 ) ) ( not ( = ?auto_1071495 ?auto_1071500 ) ) ( not ( = ?auto_1071495 ?auto_1071501 ) ) ( not ( = ?auto_1071495 ?auto_1071502 ) ) ( not ( = ?auto_1071495 ?auto_1071504 ) ) ( not ( = ?auto_1071497 ?auto_1071496 ) ) ( not ( = ?auto_1071497 ?auto_1071498 ) ) ( not ( = ?auto_1071497 ?auto_1071499 ) ) ( not ( = ?auto_1071497 ?auto_1071500 ) ) ( not ( = ?auto_1071497 ?auto_1071501 ) ) ( not ( = ?auto_1071497 ?auto_1071502 ) ) ( not ( = ?auto_1071497 ?auto_1071504 ) ) ( not ( = ?auto_1071496 ?auto_1071498 ) ) ( not ( = ?auto_1071496 ?auto_1071499 ) ) ( not ( = ?auto_1071496 ?auto_1071500 ) ) ( not ( = ?auto_1071496 ?auto_1071501 ) ) ( not ( = ?auto_1071496 ?auto_1071502 ) ) ( not ( = ?auto_1071496 ?auto_1071504 ) ) ( not ( = ?auto_1071498 ?auto_1071499 ) ) ( not ( = ?auto_1071498 ?auto_1071500 ) ) ( not ( = ?auto_1071498 ?auto_1071501 ) ) ( not ( = ?auto_1071498 ?auto_1071502 ) ) ( not ( = ?auto_1071498 ?auto_1071504 ) ) ( not ( = ?auto_1071499 ?auto_1071500 ) ) ( not ( = ?auto_1071499 ?auto_1071501 ) ) ( not ( = ?auto_1071499 ?auto_1071502 ) ) ( not ( = ?auto_1071499 ?auto_1071504 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1071500 ?auto_1071501 ?auto_1071502 )
      ( MAKE-11CRATE-VERIFY ?auto_1071492 ?auto_1071493 ?auto_1071494 ?auto_1071491 ?auto_1071495 ?auto_1071497 ?auto_1071496 ?auto_1071498 ?auto_1071499 ?auto_1071500 ?auto_1071501 ?auto_1071502 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1071636 - SURFACE
      ?auto_1071637 - SURFACE
      ?auto_1071638 - SURFACE
      ?auto_1071635 - SURFACE
      ?auto_1071639 - SURFACE
      ?auto_1071641 - SURFACE
      ?auto_1071640 - SURFACE
      ?auto_1071642 - SURFACE
      ?auto_1071643 - SURFACE
      ?auto_1071644 - SURFACE
      ?auto_1071645 - SURFACE
      ?auto_1071646 - SURFACE
    )
    :vars
    (
      ?auto_1071652 - HOIST
      ?auto_1071650 - PLACE
      ?auto_1071648 - PLACE
      ?auto_1071647 - HOIST
      ?auto_1071649 - SURFACE
      ?auto_1071651 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1071652 ?auto_1071650 ) ( SURFACE-AT ?auto_1071645 ?auto_1071650 ) ( CLEAR ?auto_1071645 ) ( IS-CRATE ?auto_1071646 ) ( not ( = ?auto_1071645 ?auto_1071646 ) ) ( AVAILABLE ?auto_1071652 ) ( ON ?auto_1071645 ?auto_1071644 ) ( not ( = ?auto_1071644 ?auto_1071645 ) ) ( not ( = ?auto_1071644 ?auto_1071646 ) ) ( not ( = ?auto_1071648 ?auto_1071650 ) ) ( HOIST-AT ?auto_1071647 ?auto_1071648 ) ( not ( = ?auto_1071652 ?auto_1071647 ) ) ( AVAILABLE ?auto_1071647 ) ( SURFACE-AT ?auto_1071646 ?auto_1071648 ) ( ON ?auto_1071646 ?auto_1071649 ) ( CLEAR ?auto_1071646 ) ( not ( = ?auto_1071645 ?auto_1071649 ) ) ( not ( = ?auto_1071646 ?auto_1071649 ) ) ( not ( = ?auto_1071644 ?auto_1071649 ) ) ( TRUCK-AT ?auto_1071651 ?auto_1071650 ) ( ON ?auto_1071637 ?auto_1071636 ) ( ON ?auto_1071638 ?auto_1071637 ) ( ON ?auto_1071635 ?auto_1071638 ) ( ON ?auto_1071639 ?auto_1071635 ) ( ON ?auto_1071641 ?auto_1071639 ) ( ON ?auto_1071640 ?auto_1071641 ) ( ON ?auto_1071642 ?auto_1071640 ) ( ON ?auto_1071643 ?auto_1071642 ) ( ON ?auto_1071644 ?auto_1071643 ) ( not ( = ?auto_1071636 ?auto_1071637 ) ) ( not ( = ?auto_1071636 ?auto_1071638 ) ) ( not ( = ?auto_1071636 ?auto_1071635 ) ) ( not ( = ?auto_1071636 ?auto_1071639 ) ) ( not ( = ?auto_1071636 ?auto_1071641 ) ) ( not ( = ?auto_1071636 ?auto_1071640 ) ) ( not ( = ?auto_1071636 ?auto_1071642 ) ) ( not ( = ?auto_1071636 ?auto_1071643 ) ) ( not ( = ?auto_1071636 ?auto_1071644 ) ) ( not ( = ?auto_1071636 ?auto_1071645 ) ) ( not ( = ?auto_1071636 ?auto_1071646 ) ) ( not ( = ?auto_1071636 ?auto_1071649 ) ) ( not ( = ?auto_1071637 ?auto_1071638 ) ) ( not ( = ?auto_1071637 ?auto_1071635 ) ) ( not ( = ?auto_1071637 ?auto_1071639 ) ) ( not ( = ?auto_1071637 ?auto_1071641 ) ) ( not ( = ?auto_1071637 ?auto_1071640 ) ) ( not ( = ?auto_1071637 ?auto_1071642 ) ) ( not ( = ?auto_1071637 ?auto_1071643 ) ) ( not ( = ?auto_1071637 ?auto_1071644 ) ) ( not ( = ?auto_1071637 ?auto_1071645 ) ) ( not ( = ?auto_1071637 ?auto_1071646 ) ) ( not ( = ?auto_1071637 ?auto_1071649 ) ) ( not ( = ?auto_1071638 ?auto_1071635 ) ) ( not ( = ?auto_1071638 ?auto_1071639 ) ) ( not ( = ?auto_1071638 ?auto_1071641 ) ) ( not ( = ?auto_1071638 ?auto_1071640 ) ) ( not ( = ?auto_1071638 ?auto_1071642 ) ) ( not ( = ?auto_1071638 ?auto_1071643 ) ) ( not ( = ?auto_1071638 ?auto_1071644 ) ) ( not ( = ?auto_1071638 ?auto_1071645 ) ) ( not ( = ?auto_1071638 ?auto_1071646 ) ) ( not ( = ?auto_1071638 ?auto_1071649 ) ) ( not ( = ?auto_1071635 ?auto_1071639 ) ) ( not ( = ?auto_1071635 ?auto_1071641 ) ) ( not ( = ?auto_1071635 ?auto_1071640 ) ) ( not ( = ?auto_1071635 ?auto_1071642 ) ) ( not ( = ?auto_1071635 ?auto_1071643 ) ) ( not ( = ?auto_1071635 ?auto_1071644 ) ) ( not ( = ?auto_1071635 ?auto_1071645 ) ) ( not ( = ?auto_1071635 ?auto_1071646 ) ) ( not ( = ?auto_1071635 ?auto_1071649 ) ) ( not ( = ?auto_1071639 ?auto_1071641 ) ) ( not ( = ?auto_1071639 ?auto_1071640 ) ) ( not ( = ?auto_1071639 ?auto_1071642 ) ) ( not ( = ?auto_1071639 ?auto_1071643 ) ) ( not ( = ?auto_1071639 ?auto_1071644 ) ) ( not ( = ?auto_1071639 ?auto_1071645 ) ) ( not ( = ?auto_1071639 ?auto_1071646 ) ) ( not ( = ?auto_1071639 ?auto_1071649 ) ) ( not ( = ?auto_1071641 ?auto_1071640 ) ) ( not ( = ?auto_1071641 ?auto_1071642 ) ) ( not ( = ?auto_1071641 ?auto_1071643 ) ) ( not ( = ?auto_1071641 ?auto_1071644 ) ) ( not ( = ?auto_1071641 ?auto_1071645 ) ) ( not ( = ?auto_1071641 ?auto_1071646 ) ) ( not ( = ?auto_1071641 ?auto_1071649 ) ) ( not ( = ?auto_1071640 ?auto_1071642 ) ) ( not ( = ?auto_1071640 ?auto_1071643 ) ) ( not ( = ?auto_1071640 ?auto_1071644 ) ) ( not ( = ?auto_1071640 ?auto_1071645 ) ) ( not ( = ?auto_1071640 ?auto_1071646 ) ) ( not ( = ?auto_1071640 ?auto_1071649 ) ) ( not ( = ?auto_1071642 ?auto_1071643 ) ) ( not ( = ?auto_1071642 ?auto_1071644 ) ) ( not ( = ?auto_1071642 ?auto_1071645 ) ) ( not ( = ?auto_1071642 ?auto_1071646 ) ) ( not ( = ?auto_1071642 ?auto_1071649 ) ) ( not ( = ?auto_1071643 ?auto_1071644 ) ) ( not ( = ?auto_1071643 ?auto_1071645 ) ) ( not ( = ?auto_1071643 ?auto_1071646 ) ) ( not ( = ?auto_1071643 ?auto_1071649 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1071644 ?auto_1071645 ?auto_1071646 )
      ( MAKE-11CRATE-VERIFY ?auto_1071636 ?auto_1071637 ?auto_1071638 ?auto_1071635 ?auto_1071639 ?auto_1071641 ?auto_1071640 ?auto_1071642 ?auto_1071643 ?auto_1071644 ?auto_1071645 ?auto_1071646 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1071780 - SURFACE
      ?auto_1071781 - SURFACE
      ?auto_1071782 - SURFACE
      ?auto_1071779 - SURFACE
      ?auto_1071783 - SURFACE
      ?auto_1071785 - SURFACE
      ?auto_1071784 - SURFACE
      ?auto_1071786 - SURFACE
      ?auto_1071787 - SURFACE
      ?auto_1071788 - SURFACE
      ?auto_1071789 - SURFACE
      ?auto_1071790 - SURFACE
    )
    :vars
    (
      ?auto_1071794 - HOIST
      ?auto_1071796 - PLACE
      ?auto_1071791 - PLACE
      ?auto_1071793 - HOIST
      ?auto_1071795 - SURFACE
      ?auto_1071792 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1071794 ?auto_1071796 ) ( IS-CRATE ?auto_1071790 ) ( not ( = ?auto_1071789 ?auto_1071790 ) ) ( not ( = ?auto_1071788 ?auto_1071789 ) ) ( not ( = ?auto_1071788 ?auto_1071790 ) ) ( not ( = ?auto_1071791 ?auto_1071796 ) ) ( HOIST-AT ?auto_1071793 ?auto_1071791 ) ( not ( = ?auto_1071794 ?auto_1071793 ) ) ( AVAILABLE ?auto_1071793 ) ( SURFACE-AT ?auto_1071790 ?auto_1071791 ) ( ON ?auto_1071790 ?auto_1071795 ) ( CLEAR ?auto_1071790 ) ( not ( = ?auto_1071789 ?auto_1071795 ) ) ( not ( = ?auto_1071790 ?auto_1071795 ) ) ( not ( = ?auto_1071788 ?auto_1071795 ) ) ( TRUCK-AT ?auto_1071792 ?auto_1071796 ) ( SURFACE-AT ?auto_1071788 ?auto_1071796 ) ( CLEAR ?auto_1071788 ) ( LIFTING ?auto_1071794 ?auto_1071789 ) ( IS-CRATE ?auto_1071789 ) ( ON ?auto_1071781 ?auto_1071780 ) ( ON ?auto_1071782 ?auto_1071781 ) ( ON ?auto_1071779 ?auto_1071782 ) ( ON ?auto_1071783 ?auto_1071779 ) ( ON ?auto_1071785 ?auto_1071783 ) ( ON ?auto_1071784 ?auto_1071785 ) ( ON ?auto_1071786 ?auto_1071784 ) ( ON ?auto_1071787 ?auto_1071786 ) ( ON ?auto_1071788 ?auto_1071787 ) ( not ( = ?auto_1071780 ?auto_1071781 ) ) ( not ( = ?auto_1071780 ?auto_1071782 ) ) ( not ( = ?auto_1071780 ?auto_1071779 ) ) ( not ( = ?auto_1071780 ?auto_1071783 ) ) ( not ( = ?auto_1071780 ?auto_1071785 ) ) ( not ( = ?auto_1071780 ?auto_1071784 ) ) ( not ( = ?auto_1071780 ?auto_1071786 ) ) ( not ( = ?auto_1071780 ?auto_1071787 ) ) ( not ( = ?auto_1071780 ?auto_1071788 ) ) ( not ( = ?auto_1071780 ?auto_1071789 ) ) ( not ( = ?auto_1071780 ?auto_1071790 ) ) ( not ( = ?auto_1071780 ?auto_1071795 ) ) ( not ( = ?auto_1071781 ?auto_1071782 ) ) ( not ( = ?auto_1071781 ?auto_1071779 ) ) ( not ( = ?auto_1071781 ?auto_1071783 ) ) ( not ( = ?auto_1071781 ?auto_1071785 ) ) ( not ( = ?auto_1071781 ?auto_1071784 ) ) ( not ( = ?auto_1071781 ?auto_1071786 ) ) ( not ( = ?auto_1071781 ?auto_1071787 ) ) ( not ( = ?auto_1071781 ?auto_1071788 ) ) ( not ( = ?auto_1071781 ?auto_1071789 ) ) ( not ( = ?auto_1071781 ?auto_1071790 ) ) ( not ( = ?auto_1071781 ?auto_1071795 ) ) ( not ( = ?auto_1071782 ?auto_1071779 ) ) ( not ( = ?auto_1071782 ?auto_1071783 ) ) ( not ( = ?auto_1071782 ?auto_1071785 ) ) ( not ( = ?auto_1071782 ?auto_1071784 ) ) ( not ( = ?auto_1071782 ?auto_1071786 ) ) ( not ( = ?auto_1071782 ?auto_1071787 ) ) ( not ( = ?auto_1071782 ?auto_1071788 ) ) ( not ( = ?auto_1071782 ?auto_1071789 ) ) ( not ( = ?auto_1071782 ?auto_1071790 ) ) ( not ( = ?auto_1071782 ?auto_1071795 ) ) ( not ( = ?auto_1071779 ?auto_1071783 ) ) ( not ( = ?auto_1071779 ?auto_1071785 ) ) ( not ( = ?auto_1071779 ?auto_1071784 ) ) ( not ( = ?auto_1071779 ?auto_1071786 ) ) ( not ( = ?auto_1071779 ?auto_1071787 ) ) ( not ( = ?auto_1071779 ?auto_1071788 ) ) ( not ( = ?auto_1071779 ?auto_1071789 ) ) ( not ( = ?auto_1071779 ?auto_1071790 ) ) ( not ( = ?auto_1071779 ?auto_1071795 ) ) ( not ( = ?auto_1071783 ?auto_1071785 ) ) ( not ( = ?auto_1071783 ?auto_1071784 ) ) ( not ( = ?auto_1071783 ?auto_1071786 ) ) ( not ( = ?auto_1071783 ?auto_1071787 ) ) ( not ( = ?auto_1071783 ?auto_1071788 ) ) ( not ( = ?auto_1071783 ?auto_1071789 ) ) ( not ( = ?auto_1071783 ?auto_1071790 ) ) ( not ( = ?auto_1071783 ?auto_1071795 ) ) ( not ( = ?auto_1071785 ?auto_1071784 ) ) ( not ( = ?auto_1071785 ?auto_1071786 ) ) ( not ( = ?auto_1071785 ?auto_1071787 ) ) ( not ( = ?auto_1071785 ?auto_1071788 ) ) ( not ( = ?auto_1071785 ?auto_1071789 ) ) ( not ( = ?auto_1071785 ?auto_1071790 ) ) ( not ( = ?auto_1071785 ?auto_1071795 ) ) ( not ( = ?auto_1071784 ?auto_1071786 ) ) ( not ( = ?auto_1071784 ?auto_1071787 ) ) ( not ( = ?auto_1071784 ?auto_1071788 ) ) ( not ( = ?auto_1071784 ?auto_1071789 ) ) ( not ( = ?auto_1071784 ?auto_1071790 ) ) ( not ( = ?auto_1071784 ?auto_1071795 ) ) ( not ( = ?auto_1071786 ?auto_1071787 ) ) ( not ( = ?auto_1071786 ?auto_1071788 ) ) ( not ( = ?auto_1071786 ?auto_1071789 ) ) ( not ( = ?auto_1071786 ?auto_1071790 ) ) ( not ( = ?auto_1071786 ?auto_1071795 ) ) ( not ( = ?auto_1071787 ?auto_1071788 ) ) ( not ( = ?auto_1071787 ?auto_1071789 ) ) ( not ( = ?auto_1071787 ?auto_1071790 ) ) ( not ( = ?auto_1071787 ?auto_1071795 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1071788 ?auto_1071789 ?auto_1071790 )
      ( MAKE-11CRATE-VERIFY ?auto_1071780 ?auto_1071781 ?auto_1071782 ?auto_1071779 ?auto_1071783 ?auto_1071785 ?auto_1071784 ?auto_1071786 ?auto_1071787 ?auto_1071788 ?auto_1071789 ?auto_1071790 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1071924 - SURFACE
      ?auto_1071925 - SURFACE
      ?auto_1071926 - SURFACE
      ?auto_1071923 - SURFACE
      ?auto_1071927 - SURFACE
      ?auto_1071929 - SURFACE
      ?auto_1071928 - SURFACE
      ?auto_1071930 - SURFACE
      ?auto_1071931 - SURFACE
      ?auto_1071932 - SURFACE
      ?auto_1071933 - SURFACE
      ?auto_1071934 - SURFACE
    )
    :vars
    (
      ?auto_1071939 - HOIST
      ?auto_1071935 - PLACE
      ?auto_1071940 - PLACE
      ?auto_1071937 - HOIST
      ?auto_1071938 - SURFACE
      ?auto_1071936 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1071939 ?auto_1071935 ) ( IS-CRATE ?auto_1071934 ) ( not ( = ?auto_1071933 ?auto_1071934 ) ) ( not ( = ?auto_1071932 ?auto_1071933 ) ) ( not ( = ?auto_1071932 ?auto_1071934 ) ) ( not ( = ?auto_1071940 ?auto_1071935 ) ) ( HOIST-AT ?auto_1071937 ?auto_1071940 ) ( not ( = ?auto_1071939 ?auto_1071937 ) ) ( AVAILABLE ?auto_1071937 ) ( SURFACE-AT ?auto_1071934 ?auto_1071940 ) ( ON ?auto_1071934 ?auto_1071938 ) ( CLEAR ?auto_1071934 ) ( not ( = ?auto_1071933 ?auto_1071938 ) ) ( not ( = ?auto_1071934 ?auto_1071938 ) ) ( not ( = ?auto_1071932 ?auto_1071938 ) ) ( TRUCK-AT ?auto_1071936 ?auto_1071935 ) ( SURFACE-AT ?auto_1071932 ?auto_1071935 ) ( CLEAR ?auto_1071932 ) ( IS-CRATE ?auto_1071933 ) ( AVAILABLE ?auto_1071939 ) ( IN ?auto_1071933 ?auto_1071936 ) ( ON ?auto_1071925 ?auto_1071924 ) ( ON ?auto_1071926 ?auto_1071925 ) ( ON ?auto_1071923 ?auto_1071926 ) ( ON ?auto_1071927 ?auto_1071923 ) ( ON ?auto_1071929 ?auto_1071927 ) ( ON ?auto_1071928 ?auto_1071929 ) ( ON ?auto_1071930 ?auto_1071928 ) ( ON ?auto_1071931 ?auto_1071930 ) ( ON ?auto_1071932 ?auto_1071931 ) ( not ( = ?auto_1071924 ?auto_1071925 ) ) ( not ( = ?auto_1071924 ?auto_1071926 ) ) ( not ( = ?auto_1071924 ?auto_1071923 ) ) ( not ( = ?auto_1071924 ?auto_1071927 ) ) ( not ( = ?auto_1071924 ?auto_1071929 ) ) ( not ( = ?auto_1071924 ?auto_1071928 ) ) ( not ( = ?auto_1071924 ?auto_1071930 ) ) ( not ( = ?auto_1071924 ?auto_1071931 ) ) ( not ( = ?auto_1071924 ?auto_1071932 ) ) ( not ( = ?auto_1071924 ?auto_1071933 ) ) ( not ( = ?auto_1071924 ?auto_1071934 ) ) ( not ( = ?auto_1071924 ?auto_1071938 ) ) ( not ( = ?auto_1071925 ?auto_1071926 ) ) ( not ( = ?auto_1071925 ?auto_1071923 ) ) ( not ( = ?auto_1071925 ?auto_1071927 ) ) ( not ( = ?auto_1071925 ?auto_1071929 ) ) ( not ( = ?auto_1071925 ?auto_1071928 ) ) ( not ( = ?auto_1071925 ?auto_1071930 ) ) ( not ( = ?auto_1071925 ?auto_1071931 ) ) ( not ( = ?auto_1071925 ?auto_1071932 ) ) ( not ( = ?auto_1071925 ?auto_1071933 ) ) ( not ( = ?auto_1071925 ?auto_1071934 ) ) ( not ( = ?auto_1071925 ?auto_1071938 ) ) ( not ( = ?auto_1071926 ?auto_1071923 ) ) ( not ( = ?auto_1071926 ?auto_1071927 ) ) ( not ( = ?auto_1071926 ?auto_1071929 ) ) ( not ( = ?auto_1071926 ?auto_1071928 ) ) ( not ( = ?auto_1071926 ?auto_1071930 ) ) ( not ( = ?auto_1071926 ?auto_1071931 ) ) ( not ( = ?auto_1071926 ?auto_1071932 ) ) ( not ( = ?auto_1071926 ?auto_1071933 ) ) ( not ( = ?auto_1071926 ?auto_1071934 ) ) ( not ( = ?auto_1071926 ?auto_1071938 ) ) ( not ( = ?auto_1071923 ?auto_1071927 ) ) ( not ( = ?auto_1071923 ?auto_1071929 ) ) ( not ( = ?auto_1071923 ?auto_1071928 ) ) ( not ( = ?auto_1071923 ?auto_1071930 ) ) ( not ( = ?auto_1071923 ?auto_1071931 ) ) ( not ( = ?auto_1071923 ?auto_1071932 ) ) ( not ( = ?auto_1071923 ?auto_1071933 ) ) ( not ( = ?auto_1071923 ?auto_1071934 ) ) ( not ( = ?auto_1071923 ?auto_1071938 ) ) ( not ( = ?auto_1071927 ?auto_1071929 ) ) ( not ( = ?auto_1071927 ?auto_1071928 ) ) ( not ( = ?auto_1071927 ?auto_1071930 ) ) ( not ( = ?auto_1071927 ?auto_1071931 ) ) ( not ( = ?auto_1071927 ?auto_1071932 ) ) ( not ( = ?auto_1071927 ?auto_1071933 ) ) ( not ( = ?auto_1071927 ?auto_1071934 ) ) ( not ( = ?auto_1071927 ?auto_1071938 ) ) ( not ( = ?auto_1071929 ?auto_1071928 ) ) ( not ( = ?auto_1071929 ?auto_1071930 ) ) ( not ( = ?auto_1071929 ?auto_1071931 ) ) ( not ( = ?auto_1071929 ?auto_1071932 ) ) ( not ( = ?auto_1071929 ?auto_1071933 ) ) ( not ( = ?auto_1071929 ?auto_1071934 ) ) ( not ( = ?auto_1071929 ?auto_1071938 ) ) ( not ( = ?auto_1071928 ?auto_1071930 ) ) ( not ( = ?auto_1071928 ?auto_1071931 ) ) ( not ( = ?auto_1071928 ?auto_1071932 ) ) ( not ( = ?auto_1071928 ?auto_1071933 ) ) ( not ( = ?auto_1071928 ?auto_1071934 ) ) ( not ( = ?auto_1071928 ?auto_1071938 ) ) ( not ( = ?auto_1071930 ?auto_1071931 ) ) ( not ( = ?auto_1071930 ?auto_1071932 ) ) ( not ( = ?auto_1071930 ?auto_1071933 ) ) ( not ( = ?auto_1071930 ?auto_1071934 ) ) ( not ( = ?auto_1071930 ?auto_1071938 ) ) ( not ( = ?auto_1071931 ?auto_1071932 ) ) ( not ( = ?auto_1071931 ?auto_1071933 ) ) ( not ( = ?auto_1071931 ?auto_1071934 ) ) ( not ( = ?auto_1071931 ?auto_1071938 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1071932 ?auto_1071933 ?auto_1071934 )
      ( MAKE-11CRATE-VERIFY ?auto_1071924 ?auto_1071925 ?auto_1071926 ?auto_1071923 ?auto_1071927 ?auto_1071929 ?auto_1071928 ?auto_1071930 ?auto_1071931 ?auto_1071932 ?auto_1071933 ?auto_1071934 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1081215 - SURFACE
      ?auto_1081216 - SURFACE
      ?auto_1081217 - SURFACE
      ?auto_1081214 - SURFACE
      ?auto_1081218 - SURFACE
      ?auto_1081220 - SURFACE
      ?auto_1081219 - SURFACE
      ?auto_1081221 - SURFACE
      ?auto_1081222 - SURFACE
      ?auto_1081223 - SURFACE
      ?auto_1081224 - SURFACE
      ?auto_1081225 - SURFACE
      ?auto_1081226 - SURFACE
    )
    :vars
    (
      ?auto_1081227 - HOIST
      ?auto_1081228 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081227 ?auto_1081228 ) ( SURFACE-AT ?auto_1081225 ?auto_1081228 ) ( CLEAR ?auto_1081225 ) ( LIFTING ?auto_1081227 ?auto_1081226 ) ( IS-CRATE ?auto_1081226 ) ( not ( = ?auto_1081225 ?auto_1081226 ) ) ( ON ?auto_1081216 ?auto_1081215 ) ( ON ?auto_1081217 ?auto_1081216 ) ( ON ?auto_1081214 ?auto_1081217 ) ( ON ?auto_1081218 ?auto_1081214 ) ( ON ?auto_1081220 ?auto_1081218 ) ( ON ?auto_1081219 ?auto_1081220 ) ( ON ?auto_1081221 ?auto_1081219 ) ( ON ?auto_1081222 ?auto_1081221 ) ( ON ?auto_1081223 ?auto_1081222 ) ( ON ?auto_1081224 ?auto_1081223 ) ( ON ?auto_1081225 ?auto_1081224 ) ( not ( = ?auto_1081215 ?auto_1081216 ) ) ( not ( = ?auto_1081215 ?auto_1081217 ) ) ( not ( = ?auto_1081215 ?auto_1081214 ) ) ( not ( = ?auto_1081215 ?auto_1081218 ) ) ( not ( = ?auto_1081215 ?auto_1081220 ) ) ( not ( = ?auto_1081215 ?auto_1081219 ) ) ( not ( = ?auto_1081215 ?auto_1081221 ) ) ( not ( = ?auto_1081215 ?auto_1081222 ) ) ( not ( = ?auto_1081215 ?auto_1081223 ) ) ( not ( = ?auto_1081215 ?auto_1081224 ) ) ( not ( = ?auto_1081215 ?auto_1081225 ) ) ( not ( = ?auto_1081215 ?auto_1081226 ) ) ( not ( = ?auto_1081216 ?auto_1081217 ) ) ( not ( = ?auto_1081216 ?auto_1081214 ) ) ( not ( = ?auto_1081216 ?auto_1081218 ) ) ( not ( = ?auto_1081216 ?auto_1081220 ) ) ( not ( = ?auto_1081216 ?auto_1081219 ) ) ( not ( = ?auto_1081216 ?auto_1081221 ) ) ( not ( = ?auto_1081216 ?auto_1081222 ) ) ( not ( = ?auto_1081216 ?auto_1081223 ) ) ( not ( = ?auto_1081216 ?auto_1081224 ) ) ( not ( = ?auto_1081216 ?auto_1081225 ) ) ( not ( = ?auto_1081216 ?auto_1081226 ) ) ( not ( = ?auto_1081217 ?auto_1081214 ) ) ( not ( = ?auto_1081217 ?auto_1081218 ) ) ( not ( = ?auto_1081217 ?auto_1081220 ) ) ( not ( = ?auto_1081217 ?auto_1081219 ) ) ( not ( = ?auto_1081217 ?auto_1081221 ) ) ( not ( = ?auto_1081217 ?auto_1081222 ) ) ( not ( = ?auto_1081217 ?auto_1081223 ) ) ( not ( = ?auto_1081217 ?auto_1081224 ) ) ( not ( = ?auto_1081217 ?auto_1081225 ) ) ( not ( = ?auto_1081217 ?auto_1081226 ) ) ( not ( = ?auto_1081214 ?auto_1081218 ) ) ( not ( = ?auto_1081214 ?auto_1081220 ) ) ( not ( = ?auto_1081214 ?auto_1081219 ) ) ( not ( = ?auto_1081214 ?auto_1081221 ) ) ( not ( = ?auto_1081214 ?auto_1081222 ) ) ( not ( = ?auto_1081214 ?auto_1081223 ) ) ( not ( = ?auto_1081214 ?auto_1081224 ) ) ( not ( = ?auto_1081214 ?auto_1081225 ) ) ( not ( = ?auto_1081214 ?auto_1081226 ) ) ( not ( = ?auto_1081218 ?auto_1081220 ) ) ( not ( = ?auto_1081218 ?auto_1081219 ) ) ( not ( = ?auto_1081218 ?auto_1081221 ) ) ( not ( = ?auto_1081218 ?auto_1081222 ) ) ( not ( = ?auto_1081218 ?auto_1081223 ) ) ( not ( = ?auto_1081218 ?auto_1081224 ) ) ( not ( = ?auto_1081218 ?auto_1081225 ) ) ( not ( = ?auto_1081218 ?auto_1081226 ) ) ( not ( = ?auto_1081220 ?auto_1081219 ) ) ( not ( = ?auto_1081220 ?auto_1081221 ) ) ( not ( = ?auto_1081220 ?auto_1081222 ) ) ( not ( = ?auto_1081220 ?auto_1081223 ) ) ( not ( = ?auto_1081220 ?auto_1081224 ) ) ( not ( = ?auto_1081220 ?auto_1081225 ) ) ( not ( = ?auto_1081220 ?auto_1081226 ) ) ( not ( = ?auto_1081219 ?auto_1081221 ) ) ( not ( = ?auto_1081219 ?auto_1081222 ) ) ( not ( = ?auto_1081219 ?auto_1081223 ) ) ( not ( = ?auto_1081219 ?auto_1081224 ) ) ( not ( = ?auto_1081219 ?auto_1081225 ) ) ( not ( = ?auto_1081219 ?auto_1081226 ) ) ( not ( = ?auto_1081221 ?auto_1081222 ) ) ( not ( = ?auto_1081221 ?auto_1081223 ) ) ( not ( = ?auto_1081221 ?auto_1081224 ) ) ( not ( = ?auto_1081221 ?auto_1081225 ) ) ( not ( = ?auto_1081221 ?auto_1081226 ) ) ( not ( = ?auto_1081222 ?auto_1081223 ) ) ( not ( = ?auto_1081222 ?auto_1081224 ) ) ( not ( = ?auto_1081222 ?auto_1081225 ) ) ( not ( = ?auto_1081222 ?auto_1081226 ) ) ( not ( = ?auto_1081223 ?auto_1081224 ) ) ( not ( = ?auto_1081223 ?auto_1081225 ) ) ( not ( = ?auto_1081223 ?auto_1081226 ) ) ( not ( = ?auto_1081224 ?auto_1081225 ) ) ( not ( = ?auto_1081224 ?auto_1081226 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1081225 ?auto_1081226 )
      ( MAKE-12CRATE-VERIFY ?auto_1081215 ?auto_1081216 ?auto_1081217 ?auto_1081214 ?auto_1081218 ?auto_1081220 ?auto_1081219 ?auto_1081221 ?auto_1081222 ?auto_1081223 ?auto_1081224 ?auto_1081225 ?auto_1081226 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1081340 - SURFACE
      ?auto_1081341 - SURFACE
      ?auto_1081342 - SURFACE
      ?auto_1081339 - SURFACE
      ?auto_1081343 - SURFACE
      ?auto_1081345 - SURFACE
      ?auto_1081344 - SURFACE
      ?auto_1081346 - SURFACE
      ?auto_1081347 - SURFACE
      ?auto_1081348 - SURFACE
      ?auto_1081349 - SURFACE
      ?auto_1081350 - SURFACE
      ?auto_1081351 - SURFACE
    )
    :vars
    (
      ?auto_1081354 - HOIST
      ?auto_1081353 - PLACE
      ?auto_1081352 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081354 ?auto_1081353 ) ( SURFACE-AT ?auto_1081350 ?auto_1081353 ) ( CLEAR ?auto_1081350 ) ( IS-CRATE ?auto_1081351 ) ( not ( = ?auto_1081350 ?auto_1081351 ) ) ( TRUCK-AT ?auto_1081352 ?auto_1081353 ) ( AVAILABLE ?auto_1081354 ) ( IN ?auto_1081351 ?auto_1081352 ) ( ON ?auto_1081350 ?auto_1081349 ) ( not ( = ?auto_1081349 ?auto_1081350 ) ) ( not ( = ?auto_1081349 ?auto_1081351 ) ) ( ON ?auto_1081341 ?auto_1081340 ) ( ON ?auto_1081342 ?auto_1081341 ) ( ON ?auto_1081339 ?auto_1081342 ) ( ON ?auto_1081343 ?auto_1081339 ) ( ON ?auto_1081345 ?auto_1081343 ) ( ON ?auto_1081344 ?auto_1081345 ) ( ON ?auto_1081346 ?auto_1081344 ) ( ON ?auto_1081347 ?auto_1081346 ) ( ON ?auto_1081348 ?auto_1081347 ) ( ON ?auto_1081349 ?auto_1081348 ) ( not ( = ?auto_1081340 ?auto_1081341 ) ) ( not ( = ?auto_1081340 ?auto_1081342 ) ) ( not ( = ?auto_1081340 ?auto_1081339 ) ) ( not ( = ?auto_1081340 ?auto_1081343 ) ) ( not ( = ?auto_1081340 ?auto_1081345 ) ) ( not ( = ?auto_1081340 ?auto_1081344 ) ) ( not ( = ?auto_1081340 ?auto_1081346 ) ) ( not ( = ?auto_1081340 ?auto_1081347 ) ) ( not ( = ?auto_1081340 ?auto_1081348 ) ) ( not ( = ?auto_1081340 ?auto_1081349 ) ) ( not ( = ?auto_1081340 ?auto_1081350 ) ) ( not ( = ?auto_1081340 ?auto_1081351 ) ) ( not ( = ?auto_1081341 ?auto_1081342 ) ) ( not ( = ?auto_1081341 ?auto_1081339 ) ) ( not ( = ?auto_1081341 ?auto_1081343 ) ) ( not ( = ?auto_1081341 ?auto_1081345 ) ) ( not ( = ?auto_1081341 ?auto_1081344 ) ) ( not ( = ?auto_1081341 ?auto_1081346 ) ) ( not ( = ?auto_1081341 ?auto_1081347 ) ) ( not ( = ?auto_1081341 ?auto_1081348 ) ) ( not ( = ?auto_1081341 ?auto_1081349 ) ) ( not ( = ?auto_1081341 ?auto_1081350 ) ) ( not ( = ?auto_1081341 ?auto_1081351 ) ) ( not ( = ?auto_1081342 ?auto_1081339 ) ) ( not ( = ?auto_1081342 ?auto_1081343 ) ) ( not ( = ?auto_1081342 ?auto_1081345 ) ) ( not ( = ?auto_1081342 ?auto_1081344 ) ) ( not ( = ?auto_1081342 ?auto_1081346 ) ) ( not ( = ?auto_1081342 ?auto_1081347 ) ) ( not ( = ?auto_1081342 ?auto_1081348 ) ) ( not ( = ?auto_1081342 ?auto_1081349 ) ) ( not ( = ?auto_1081342 ?auto_1081350 ) ) ( not ( = ?auto_1081342 ?auto_1081351 ) ) ( not ( = ?auto_1081339 ?auto_1081343 ) ) ( not ( = ?auto_1081339 ?auto_1081345 ) ) ( not ( = ?auto_1081339 ?auto_1081344 ) ) ( not ( = ?auto_1081339 ?auto_1081346 ) ) ( not ( = ?auto_1081339 ?auto_1081347 ) ) ( not ( = ?auto_1081339 ?auto_1081348 ) ) ( not ( = ?auto_1081339 ?auto_1081349 ) ) ( not ( = ?auto_1081339 ?auto_1081350 ) ) ( not ( = ?auto_1081339 ?auto_1081351 ) ) ( not ( = ?auto_1081343 ?auto_1081345 ) ) ( not ( = ?auto_1081343 ?auto_1081344 ) ) ( not ( = ?auto_1081343 ?auto_1081346 ) ) ( not ( = ?auto_1081343 ?auto_1081347 ) ) ( not ( = ?auto_1081343 ?auto_1081348 ) ) ( not ( = ?auto_1081343 ?auto_1081349 ) ) ( not ( = ?auto_1081343 ?auto_1081350 ) ) ( not ( = ?auto_1081343 ?auto_1081351 ) ) ( not ( = ?auto_1081345 ?auto_1081344 ) ) ( not ( = ?auto_1081345 ?auto_1081346 ) ) ( not ( = ?auto_1081345 ?auto_1081347 ) ) ( not ( = ?auto_1081345 ?auto_1081348 ) ) ( not ( = ?auto_1081345 ?auto_1081349 ) ) ( not ( = ?auto_1081345 ?auto_1081350 ) ) ( not ( = ?auto_1081345 ?auto_1081351 ) ) ( not ( = ?auto_1081344 ?auto_1081346 ) ) ( not ( = ?auto_1081344 ?auto_1081347 ) ) ( not ( = ?auto_1081344 ?auto_1081348 ) ) ( not ( = ?auto_1081344 ?auto_1081349 ) ) ( not ( = ?auto_1081344 ?auto_1081350 ) ) ( not ( = ?auto_1081344 ?auto_1081351 ) ) ( not ( = ?auto_1081346 ?auto_1081347 ) ) ( not ( = ?auto_1081346 ?auto_1081348 ) ) ( not ( = ?auto_1081346 ?auto_1081349 ) ) ( not ( = ?auto_1081346 ?auto_1081350 ) ) ( not ( = ?auto_1081346 ?auto_1081351 ) ) ( not ( = ?auto_1081347 ?auto_1081348 ) ) ( not ( = ?auto_1081347 ?auto_1081349 ) ) ( not ( = ?auto_1081347 ?auto_1081350 ) ) ( not ( = ?auto_1081347 ?auto_1081351 ) ) ( not ( = ?auto_1081348 ?auto_1081349 ) ) ( not ( = ?auto_1081348 ?auto_1081350 ) ) ( not ( = ?auto_1081348 ?auto_1081351 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081349 ?auto_1081350 ?auto_1081351 )
      ( MAKE-12CRATE-VERIFY ?auto_1081340 ?auto_1081341 ?auto_1081342 ?auto_1081339 ?auto_1081343 ?auto_1081345 ?auto_1081344 ?auto_1081346 ?auto_1081347 ?auto_1081348 ?auto_1081349 ?auto_1081350 ?auto_1081351 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1081478 - SURFACE
      ?auto_1081479 - SURFACE
      ?auto_1081480 - SURFACE
      ?auto_1081477 - SURFACE
      ?auto_1081481 - SURFACE
      ?auto_1081483 - SURFACE
      ?auto_1081482 - SURFACE
      ?auto_1081484 - SURFACE
      ?auto_1081485 - SURFACE
      ?auto_1081486 - SURFACE
      ?auto_1081487 - SURFACE
      ?auto_1081488 - SURFACE
      ?auto_1081489 - SURFACE
    )
    :vars
    (
      ?auto_1081492 - HOIST
      ?auto_1081491 - PLACE
      ?auto_1081493 - TRUCK
      ?auto_1081490 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081492 ?auto_1081491 ) ( SURFACE-AT ?auto_1081488 ?auto_1081491 ) ( CLEAR ?auto_1081488 ) ( IS-CRATE ?auto_1081489 ) ( not ( = ?auto_1081488 ?auto_1081489 ) ) ( AVAILABLE ?auto_1081492 ) ( IN ?auto_1081489 ?auto_1081493 ) ( ON ?auto_1081488 ?auto_1081487 ) ( not ( = ?auto_1081487 ?auto_1081488 ) ) ( not ( = ?auto_1081487 ?auto_1081489 ) ) ( TRUCK-AT ?auto_1081493 ?auto_1081490 ) ( not ( = ?auto_1081490 ?auto_1081491 ) ) ( ON ?auto_1081479 ?auto_1081478 ) ( ON ?auto_1081480 ?auto_1081479 ) ( ON ?auto_1081477 ?auto_1081480 ) ( ON ?auto_1081481 ?auto_1081477 ) ( ON ?auto_1081483 ?auto_1081481 ) ( ON ?auto_1081482 ?auto_1081483 ) ( ON ?auto_1081484 ?auto_1081482 ) ( ON ?auto_1081485 ?auto_1081484 ) ( ON ?auto_1081486 ?auto_1081485 ) ( ON ?auto_1081487 ?auto_1081486 ) ( not ( = ?auto_1081478 ?auto_1081479 ) ) ( not ( = ?auto_1081478 ?auto_1081480 ) ) ( not ( = ?auto_1081478 ?auto_1081477 ) ) ( not ( = ?auto_1081478 ?auto_1081481 ) ) ( not ( = ?auto_1081478 ?auto_1081483 ) ) ( not ( = ?auto_1081478 ?auto_1081482 ) ) ( not ( = ?auto_1081478 ?auto_1081484 ) ) ( not ( = ?auto_1081478 ?auto_1081485 ) ) ( not ( = ?auto_1081478 ?auto_1081486 ) ) ( not ( = ?auto_1081478 ?auto_1081487 ) ) ( not ( = ?auto_1081478 ?auto_1081488 ) ) ( not ( = ?auto_1081478 ?auto_1081489 ) ) ( not ( = ?auto_1081479 ?auto_1081480 ) ) ( not ( = ?auto_1081479 ?auto_1081477 ) ) ( not ( = ?auto_1081479 ?auto_1081481 ) ) ( not ( = ?auto_1081479 ?auto_1081483 ) ) ( not ( = ?auto_1081479 ?auto_1081482 ) ) ( not ( = ?auto_1081479 ?auto_1081484 ) ) ( not ( = ?auto_1081479 ?auto_1081485 ) ) ( not ( = ?auto_1081479 ?auto_1081486 ) ) ( not ( = ?auto_1081479 ?auto_1081487 ) ) ( not ( = ?auto_1081479 ?auto_1081488 ) ) ( not ( = ?auto_1081479 ?auto_1081489 ) ) ( not ( = ?auto_1081480 ?auto_1081477 ) ) ( not ( = ?auto_1081480 ?auto_1081481 ) ) ( not ( = ?auto_1081480 ?auto_1081483 ) ) ( not ( = ?auto_1081480 ?auto_1081482 ) ) ( not ( = ?auto_1081480 ?auto_1081484 ) ) ( not ( = ?auto_1081480 ?auto_1081485 ) ) ( not ( = ?auto_1081480 ?auto_1081486 ) ) ( not ( = ?auto_1081480 ?auto_1081487 ) ) ( not ( = ?auto_1081480 ?auto_1081488 ) ) ( not ( = ?auto_1081480 ?auto_1081489 ) ) ( not ( = ?auto_1081477 ?auto_1081481 ) ) ( not ( = ?auto_1081477 ?auto_1081483 ) ) ( not ( = ?auto_1081477 ?auto_1081482 ) ) ( not ( = ?auto_1081477 ?auto_1081484 ) ) ( not ( = ?auto_1081477 ?auto_1081485 ) ) ( not ( = ?auto_1081477 ?auto_1081486 ) ) ( not ( = ?auto_1081477 ?auto_1081487 ) ) ( not ( = ?auto_1081477 ?auto_1081488 ) ) ( not ( = ?auto_1081477 ?auto_1081489 ) ) ( not ( = ?auto_1081481 ?auto_1081483 ) ) ( not ( = ?auto_1081481 ?auto_1081482 ) ) ( not ( = ?auto_1081481 ?auto_1081484 ) ) ( not ( = ?auto_1081481 ?auto_1081485 ) ) ( not ( = ?auto_1081481 ?auto_1081486 ) ) ( not ( = ?auto_1081481 ?auto_1081487 ) ) ( not ( = ?auto_1081481 ?auto_1081488 ) ) ( not ( = ?auto_1081481 ?auto_1081489 ) ) ( not ( = ?auto_1081483 ?auto_1081482 ) ) ( not ( = ?auto_1081483 ?auto_1081484 ) ) ( not ( = ?auto_1081483 ?auto_1081485 ) ) ( not ( = ?auto_1081483 ?auto_1081486 ) ) ( not ( = ?auto_1081483 ?auto_1081487 ) ) ( not ( = ?auto_1081483 ?auto_1081488 ) ) ( not ( = ?auto_1081483 ?auto_1081489 ) ) ( not ( = ?auto_1081482 ?auto_1081484 ) ) ( not ( = ?auto_1081482 ?auto_1081485 ) ) ( not ( = ?auto_1081482 ?auto_1081486 ) ) ( not ( = ?auto_1081482 ?auto_1081487 ) ) ( not ( = ?auto_1081482 ?auto_1081488 ) ) ( not ( = ?auto_1081482 ?auto_1081489 ) ) ( not ( = ?auto_1081484 ?auto_1081485 ) ) ( not ( = ?auto_1081484 ?auto_1081486 ) ) ( not ( = ?auto_1081484 ?auto_1081487 ) ) ( not ( = ?auto_1081484 ?auto_1081488 ) ) ( not ( = ?auto_1081484 ?auto_1081489 ) ) ( not ( = ?auto_1081485 ?auto_1081486 ) ) ( not ( = ?auto_1081485 ?auto_1081487 ) ) ( not ( = ?auto_1081485 ?auto_1081488 ) ) ( not ( = ?auto_1081485 ?auto_1081489 ) ) ( not ( = ?auto_1081486 ?auto_1081487 ) ) ( not ( = ?auto_1081486 ?auto_1081488 ) ) ( not ( = ?auto_1081486 ?auto_1081489 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081487 ?auto_1081488 ?auto_1081489 )
      ( MAKE-12CRATE-VERIFY ?auto_1081478 ?auto_1081479 ?auto_1081480 ?auto_1081477 ?auto_1081481 ?auto_1081483 ?auto_1081482 ?auto_1081484 ?auto_1081485 ?auto_1081486 ?auto_1081487 ?auto_1081488 ?auto_1081489 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1081628 - SURFACE
      ?auto_1081629 - SURFACE
      ?auto_1081630 - SURFACE
      ?auto_1081627 - SURFACE
      ?auto_1081631 - SURFACE
      ?auto_1081633 - SURFACE
      ?auto_1081632 - SURFACE
      ?auto_1081634 - SURFACE
      ?auto_1081635 - SURFACE
      ?auto_1081636 - SURFACE
      ?auto_1081637 - SURFACE
      ?auto_1081638 - SURFACE
      ?auto_1081639 - SURFACE
    )
    :vars
    (
      ?auto_1081644 - HOIST
      ?auto_1081641 - PLACE
      ?auto_1081640 - TRUCK
      ?auto_1081642 - PLACE
      ?auto_1081643 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081644 ?auto_1081641 ) ( SURFACE-AT ?auto_1081638 ?auto_1081641 ) ( CLEAR ?auto_1081638 ) ( IS-CRATE ?auto_1081639 ) ( not ( = ?auto_1081638 ?auto_1081639 ) ) ( AVAILABLE ?auto_1081644 ) ( ON ?auto_1081638 ?auto_1081637 ) ( not ( = ?auto_1081637 ?auto_1081638 ) ) ( not ( = ?auto_1081637 ?auto_1081639 ) ) ( TRUCK-AT ?auto_1081640 ?auto_1081642 ) ( not ( = ?auto_1081642 ?auto_1081641 ) ) ( HOIST-AT ?auto_1081643 ?auto_1081642 ) ( LIFTING ?auto_1081643 ?auto_1081639 ) ( not ( = ?auto_1081644 ?auto_1081643 ) ) ( ON ?auto_1081629 ?auto_1081628 ) ( ON ?auto_1081630 ?auto_1081629 ) ( ON ?auto_1081627 ?auto_1081630 ) ( ON ?auto_1081631 ?auto_1081627 ) ( ON ?auto_1081633 ?auto_1081631 ) ( ON ?auto_1081632 ?auto_1081633 ) ( ON ?auto_1081634 ?auto_1081632 ) ( ON ?auto_1081635 ?auto_1081634 ) ( ON ?auto_1081636 ?auto_1081635 ) ( ON ?auto_1081637 ?auto_1081636 ) ( not ( = ?auto_1081628 ?auto_1081629 ) ) ( not ( = ?auto_1081628 ?auto_1081630 ) ) ( not ( = ?auto_1081628 ?auto_1081627 ) ) ( not ( = ?auto_1081628 ?auto_1081631 ) ) ( not ( = ?auto_1081628 ?auto_1081633 ) ) ( not ( = ?auto_1081628 ?auto_1081632 ) ) ( not ( = ?auto_1081628 ?auto_1081634 ) ) ( not ( = ?auto_1081628 ?auto_1081635 ) ) ( not ( = ?auto_1081628 ?auto_1081636 ) ) ( not ( = ?auto_1081628 ?auto_1081637 ) ) ( not ( = ?auto_1081628 ?auto_1081638 ) ) ( not ( = ?auto_1081628 ?auto_1081639 ) ) ( not ( = ?auto_1081629 ?auto_1081630 ) ) ( not ( = ?auto_1081629 ?auto_1081627 ) ) ( not ( = ?auto_1081629 ?auto_1081631 ) ) ( not ( = ?auto_1081629 ?auto_1081633 ) ) ( not ( = ?auto_1081629 ?auto_1081632 ) ) ( not ( = ?auto_1081629 ?auto_1081634 ) ) ( not ( = ?auto_1081629 ?auto_1081635 ) ) ( not ( = ?auto_1081629 ?auto_1081636 ) ) ( not ( = ?auto_1081629 ?auto_1081637 ) ) ( not ( = ?auto_1081629 ?auto_1081638 ) ) ( not ( = ?auto_1081629 ?auto_1081639 ) ) ( not ( = ?auto_1081630 ?auto_1081627 ) ) ( not ( = ?auto_1081630 ?auto_1081631 ) ) ( not ( = ?auto_1081630 ?auto_1081633 ) ) ( not ( = ?auto_1081630 ?auto_1081632 ) ) ( not ( = ?auto_1081630 ?auto_1081634 ) ) ( not ( = ?auto_1081630 ?auto_1081635 ) ) ( not ( = ?auto_1081630 ?auto_1081636 ) ) ( not ( = ?auto_1081630 ?auto_1081637 ) ) ( not ( = ?auto_1081630 ?auto_1081638 ) ) ( not ( = ?auto_1081630 ?auto_1081639 ) ) ( not ( = ?auto_1081627 ?auto_1081631 ) ) ( not ( = ?auto_1081627 ?auto_1081633 ) ) ( not ( = ?auto_1081627 ?auto_1081632 ) ) ( not ( = ?auto_1081627 ?auto_1081634 ) ) ( not ( = ?auto_1081627 ?auto_1081635 ) ) ( not ( = ?auto_1081627 ?auto_1081636 ) ) ( not ( = ?auto_1081627 ?auto_1081637 ) ) ( not ( = ?auto_1081627 ?auto_1081638 ) ) ( not ( = ?auto_1081627 ?auto_1081639 ) ) ( not ( = ?auto_1081631 ?auto_1081633 ) ) ( not ( = ?auto_1081631 ?auto_1081632 ) ) ( not ( = ?auto_1081631 ?auto_1081634 ) ) ( not ( = ?auto_1081631 ?auto_1081635 ) ) ( not ( = ?auto_1081631 ?auto_1081636 ) ) ( not ( = ?auto_1081631 ?auto_1081637 ) ) ( not ( = ?auto_1081631 ?auto_1081638 ) ) ( not ( = ?auto_1081631 ?auto_1081639 ) ) ( not ( = ?auto_1081633 ?auto_1081632 ) ) ( not ( = ?auto_1081633 ?auto_1081634 ) ) ( not ( = ?auto_1081633 ?auto_1081635 ) ) ( not ( = ?auto_1081633 ?auto_1081636 ) ) ( not ( = ?auto_1081633 ?auto_1081637 ) ) ( not ( = ?auto_1081633 ?auto_1081638 ) ) ( not ( = ?auto_1081633 ?auto_1081639 ) ) ( not ( = ?auto_1081632 ?auto_1081634 ) ) ( not ( = ?auto_1081632 ?auto_1081635 ) ) ( not ( = ?auto_1081632 ?auto_1081636 ) ) ( not ( = ?auto_1081632 ?auto_1081637 ) ) ( not ( = ?auto_1081632 ?auto_1081638 ) ) ( not ( = ?auto_1081632 ?auto_1081639 ) ) ( not ( = ?auto_1081634 ?auto_1081635 ) ) ( not ( = ?auto_1081634 ?auto_1081636 ) ) ( not ( = ?auto_1081634 ?auto_1081637 ) ) ( not ( = ?auto_1081634 ?auto_1081638 ) ) ( not ( = ?auto_1081634 ?auto_1081639 ) ) ( not ( = ?auto_1081635 ?auto_1081636 ) ) ( not ( = ?auto_1081635 ?auto_1081637 ) ) ( not ( = ?auto_1081635 ?auto_1081638 ) ) ( not ( = ?auto_1081635 ?auto_1081639 ) ) ( not ( = ?auto_1081636 ?auto_1081637 ) ) ( not ( = ?auto_1081636 ?auto_1081638 ) ) ( not ( = ?auto_1081636 ?auto_1081639 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081637 ?auto_1081638 ?auto_1081639 )
      ( MAKE-12CRATE-VERIFY ?auto_1081628 ?auto_1081629 ?auto_1081630 ?auto_1081627 ?auto_1081631 ?auto_1081633 ?auto_1081632 ?auto_1081634 ?auto_1081635 ?auto_1081636 ?auto_1081637 ?auto_1081638 ?auto_1081639 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1081790 - SURFACE
      ?auto_1081791 - SURFACE
      ?auto_1081792 - SURFACE
      ?auto_1081789 - SURFACE
      ?auto_1081793 - SURFACE
      ?auto_1081795 - SURFACE
      ?auto_1081794 - SURFACE
      ?auto_1081796 - SURFACE
      ?auto_1081797 - SURFACE
      ?auto_1081798 - SURFACE
      ?auto_1081799 - SURFACE
      ?auto_1081800 - SURFACE
      ?auto_1081801 - SURFACE
    )
    :vars
    (
      ?auto_1081803 - HOIST
      ?auto_1081805 - PLACE
      ?auto_1081802 - TRUCK
      ?auto_1081807 - PLACE
      ?auto_1081804 - HOIST
      ?auto_1081806 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081803 ?auto_1081805 ) ( SURFACE-AT ?auto_1081800 ?auto_1081805 ) ( CLEAR ?auto_1081800 ) ( IS-CRATE ?auto_1081801 ) ( not ( = ?auto_1081800 ?auto_1081801 ) ) ( AVAILABLE ?auto_1081803 ) ( ON ?auto_1081800 ?auto_1081799 ) ( not ( = ?auto_1081799 ?auto_1081800 ) ) ( not ( = ?auto_1081799 ?auto_1081801 ) ) ( TRUCK-AT ?auto_1081802 ?auto_1081807 ) ( not ( = ?auto_1081807 ?auto_1081805 ) ) ( HOIST-AT ?auto_1081804 ?auto_1081807 ) ( not ( = ?auto_1081803 ?auto_1081804 ) ) ( AVAILABLE ?auto_1081804 ) ( SURFACE-AT ?auto_1081801 ?auto_1081807 ) ( ON ?auto_1081801 ?auto_1081806 ) ( CLEAR ?auto_1081801 ) ( not ( = ?auto_1081800 ?auto_1081806 ) ) ( not ( = ?auto_1081801 ?auto_1081806 ) ) ( not ( = ?auto_1081799 ?auto_1081806 ) ) ( ON ?auto_1081791 ?auto_1081790 ) ( ON ?auto_1081792 ?auto_1081791 ) ( ON ?auto_1081789 ?auto_1081792 ) ( ON ?auto_1081793 ?auto_1081789 ) ( ON ?auto_1081795 ?auto_1081793 ) ( ON ?auto_1081794 ?auto_1081795 ) ( ON ?auto_1081796 ?auto_1081794 ) ( ON ?auto_1081797 ?auto_1081796 ) ( ON ?auto_1081798 ?auto_1081797 ) ( ON ?auto_1081799 ?auto_1081798 ) ( not ( = ?auto_1081790 ?auto_1081791 ) ) ( not ( = ?auto_1081790 ?auto_1081792 ) ) ( not ( = ?auto_1081790 ?auto_1081789 ) ) ( not ( = ?auto_1081790 ?auto_1081793 ) ) ( not ( = ?auto_1081790 ?auto_1081795 ) ) ( not ( = ?auto_1081790 ?auto_1081794 ) ) ( not ( = ?auto_1081790 ?auto_1081796 ) ) ( not ( = ?auto_1081790 ?auto_1081797 ) ) ( not ( = ?auto_1081790 ?auto_1081798 ) ) ( not ( = ?auto_1081790 ?auto_1081799 ) ) ( not ( = ?auto_1081790 ?auto_1081800 ) ) ( not ( = ?auto_1081790 ?auto_1081801 ) ) ( not ( = ?auto_1081790 ?auto_1081806 ) ) ( not ( = ?auto_1081791 ?auto_1081792 ) ) ( not ( = ?auto_1081791 ?auto_1081789 ) ) ( not ( = ?auto_1081791 ?auto_1081793 ) ) ( not ( = ?auto_1081791 ?auto_1081795 ) ) ( not ( = ?auto_1081791 ?auto_1081794 ) ) ( not ( = ?auto_1081791 ?auto_1081796 ) ) ( not ( = ?auto_1081791 ?auto_1081797 ) ) ( not ( = ?auto_1081791 ?auto_1081798 ) ) ( not ( = ?auto_1081791 ?auto_1081799 ) ) ( not ( = ?auto_1081791 ?auto_1081800 ) ) ( not ( = ?auto_1081791 ?auto_1081801 ) ) ( not ( = ?auto_1081791 ?auto_1081806 ) ) ( not ( = ?auto_1081792 ?auto_1081789 ) ) ( not ( = ?auto_1081792 ?auto_1081793 ) ) ( not ( = ?auto_1081792 ?auto_1081795 ) ) ( not ( = ?auto_1081792 ?auto_1081794 ) ) ( not ( = ?auto_1081792 ?auto_1081796 ) ) ( not ( = ?auto_1081792 ?auto_1081797 ) ) ( not ( = ?auto_1081792 ?auto_1081798 ) ) ( not ( = ?auto_1081792 ?auto_1081799 ) ) ( not ( = ?auto_1081792 ?auto_1081800 ) ) ( not ( = ?auto_1081792 ?auto_1081801 ) ) ( not ( = ?auto_1081792 ?auto_1081806 ) ) ( not ( = ?auto_1081789 ?auto_1081793 ) ) ( not ( = ?auto_1081789 ?auto_1081795 ) ) ( not ( = ?auto_1081789 ?auto_1081794 ) ) ( not ( = ?auto_1081789 ?auto_1081796 ) ) ( not ( = ?auto_1081789 ?auto_1081797 ) ) ( not ( = ?auto_1081789 ?auto_1081798 ) ) ( not ( = ?auto_1081789 ?auto_1081799 ) ) ( not ( = ?auto_1081789 ?auto_1081800 ) ) ( not ( = ?auto_1081789 ?auto_1081801 ) ) ( not ( = ?auto_1081789 ?auto_1081806 ) ) ( not ( = ?auto_1081793 ?auto_1081795 ) ) ( not ( = ?auto_1081793 ?auto_1081794 ) ) ( not ( = ?auto_1081793 ?auto_1081796 ) ) ( not ( = ?auto_1081793 ?auto_1081797 ) ) ( not ( = ?auto_1081793 ?auto_1081798 ) ) ( not ( = ?auto_1081793 ?auto_1081799 ) ) ( not ( = ?auto_1081793 ?auto_1081800 ) ) ( not ( = ?auto_1081793 ?auto_1081801 ) ) ( not ( = ?auto_1081793 ?auto_1081806 ) ) ( not ( = ?auto_1081795 ?auto_1081794 ) ) ( not ( = ?auto_1081795 ?auto_1081796 ) ) ( not ( = ?auto_1081795 ?auto_1081797 ) ) ( not ( = ?auto_1081795 ?auto_1081798 ) ) ( not ( = ?auto_1081795 ?auto_1081799 ) ) ( not ( = ?auto_1081795 ?auto_1081800 ) ) ( not ( = ?auto_1081795 ?auto_1081801 ) ) ( not ( = ?auto_1081795 ?auto_1081806 ) ) ( not ( = ?auto_1081794 ?auto_1081796 ) ) ( not ( = ?auto_1081794 ?auto_1081797 ) ) ( not ( = ?auto_1081794 ?auto_1081798 ) ) ( not ( = ?auto_1081794 ?auto_1081799 ) ) ( not ( = ?auto_1081794 ?auto_1081800 ) ) ( not ( = ?auto_1081794 ?auto_1081801 ) ) ( not ( = ?auto_1081794 ?auto_1081806 ) ) ( not ( = ?auto_1081796 ?auto_1081797 ) ) ( not ( = ?auto_1081796 ?auto_1081798 ) ) ( not ( = ?auto_1081796 ?auto_1081799 ) ) ( not ( = ?auto_1081796 ?auto_1081800 ) ) ( not ( = ?auto_1081796 ?auto_1081801 ) ) ( not ( = ?auto_1081796 ?auto_1081806 ) ) ( not ( = ?auto_1081797 ?auto_1081798 ) ) ( not ( = ?auto_1081797 ?auto_1081799 ) ) ( not ( = ?auto_1081797 ?auto_1081800 ) ) ( not ( = ?auto_1081797 ?auto_1081801 ) ) ( not ( = ?auto_1081797 ?auto_1081806 ) ) ( not ( = ?auto_1081798 ?auto_1081799 ) ) ( not ( = ?auto_1081798 ?auto_1081800 ) ) ( not ( = ?auto_1081798 ?auto_1081801 ) ) ( not ( = ?auto_1081798 ?auto_1081806 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081799 ?auto_1081800 ?auto_1081801 )
      ( MAKE-12CRATE-VERIFY ?auto_1081790 ?auto_1081791 ?auto_1081792 ?auto_1081789 ?auto_1081793 ?auto_1081795 ?auto_1081794 ?auto_1081796 ?auto_1081797 ?auto_1081798 ?auto_1081799 ?auto_1081800 ?auto_1081801 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1081953 - SURFACE
      ?auto_1081954 - SURFACE
      ?auto_1081955 - SURFACE
      ?auto_1081952 - SURFACE
      ?auto_1081956 - SURFACE
      ?auto_1081958 - SURFACE
      ?auto_1081957 - SURFACE
      ?auto_1081959 - SURFACE
      ?auto_1081960 - SURFACE
      ?auto_1081961 - SURFACE
      ?auto_1081962 - SURFACE
      ?auto_1081963 - SURFACE
      ?auto_1081964 - SURFACE
    )
    :vars
    (
      ?auto_1081970 - HOIST
      ?auto_1081965 - PLACE
      ?auto_1081967 - PLACE
      ?auto_1081968 - HOIST
      ?auto_1081966 - SURFACE
      ?auto_1081969 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081970 ?auto_1081965 ) ( SURFACE-AT ?auto_1081963 ?auto_1081965 ) ( CLEAR ?auto_1081963 ) ( IS-CRATE ?auto_1081964 ) ( not ( = ?auto_1081963 ?auto_1081964 ) ) ( AVAILABLE ?auto_1081970 ) ( ON ?auto_1081963 ?auto_1081962 ) ( not ( = ?auto_1081962 ?auto_1081963 ) ) ( not ( = ?auto_1081962 ?auto_1081964 ) ) ( not ( = ?auto_1081967 ?auto_1081965 ) ) ( HOIST-AT ?auto_1081968 ?auto_1081967 ) ( not ( = ?auto_1081970 ?auto_1081968 ) ) ( AVAILABLE ?auto_1081968 ) ( SURFACE-AT ?auto_1081964 ?auto_1081967 ) ( ON ?auto_1081964 ?auto_1081966 ) ( CLEAR ?auto_1081964 ) ( not ( = ?auto_1081963 ?auto_1081966 ) ) ( not ( = ?auto_1081964 ?auto_1081966 ) ) ( not ( = ?auto_1081962 ?auto_1081966 ) ) ( TRUCK-AT ?auto_1081969 ?auto_1081965 ) ( ON ?auto_1081954 ?auto_1081953 ) ( ON ?auto_1081955 ?auto_1081954 ) ( ON ?auto_1081952 ?auto_1081955 ) ( ON ?auto_1081956 ?auto_1081952 ) ( ON ?auto_1081958 ?auto_1081956 ) ( ON ?auto_1081957 ?auto_1081958 ) ( ON ?auto_1081959 ?auto_1081957 ) ( ON ?auto_1081960 ?auto_1081959 ) ( ON ?auto_1081961 ?auto_1081960 ) ( ON ?auto_1081962 ?auto_1081961 ) ( not ( = ?auto_1081953 ?auto_1081954 ) ) ( not ( = ?auto_1081953 ?auto_1081955 ) ) ( not ( = ?auto_1081953 ?auto_1081952 ) ) ( not ( = ?auto_1081953 ?auto_1081956 ) ) ( not ( = ?auto_1081953 ?auto_1081958 ) ) ( not ( = ?auto_1081953 ?auto_1081957 ) ) ( not ( = ?auto_1081953 ?auto_1081959 ) ) ( not ( = ?auto_1081953 ?auto_1081960 ) ) ( not ( = ?auto_1081953 ?auto_1081961 ) ) ( not ( = ?auto_1081953 ?auto_1081962 ) ) ( not ( = ?auto_1081953 ?auto_1081963 ) ) ( not ( = ?auto_1081953 ?auto_1081964 ) ) ( not ( = ?auto_1081953 ?auto_1081966 ) ) ( not ( = ?auto_1081954 ?auto_1081955 ) ) ( not ( = ?auto_1081954 ?auto_1081952 ) ) ( not ( = ?auto_1081954 ?auto_1081956 ) ) ( not ( = ?auto_1081954 ?auto_1081958 ) ) ( not ( = ?auto_1081954 ?auto_1081957 ) ) ( not ( = ?auto_1081954 ?auto_1081959 ) ) ( not ( = ?auto_1081954 ?auto_1081960 ) ) ( not ( = ?auto_1081954 ?auto_1081961 ) ) ( not ( = ?auto_1081954 ?auto_1081962 ) ) ( not ( = ?auto_1081954 ?auto_1081963 ) ) ( not ( = ?auto_1081954 ?auto_1081964 ) ) ( not ( = ?auto_1081954 ?auto_1081966 ) ) ( not ( = ?auto_1081955 ?auto_1081952 ) ) ( not ( = ?auto_1081955 ?auto_1081956 ) ) ( not ( = ?auto_1081955 ?auto_1081958 ) ) ( not ( = ?auto_1081955 ?auto_1081957 ) ) ( not ( = ?auto_1081955 ?auto_1081959 ) ) ( not ( = ?auto_1081955 ?auto_1081960 ) ) ( not ( = ?auto_1081955 ?auto_1081961 ) ) ( not ( = ?auto_1081955 ?auto_1081962 ) ) ( not ( = ?auto_1081955 ?auto_1081963 ) ) ( not ( = ?auto_1081955 ?auto_1081964 ) ) ( not ( = ?auto_1081955 ?auto_1081966 ) ) ( not ( = ?auto_1081952 ?auto_1081956 ) ) ( not ( = ?auto_1081952 ?auto_1081958 ) ) ( not ( = ?auto_1081952 ?auto_1081957 ) ) ( not ( = ?auto_1081952 ?auto_1081959 ) ) ( not ( = ?auto_1081952 ?auto_1081960 ) ) ( not ( = ?auto_1081952 ?auto_1081961 ) ) ( not ( = ?auto_1081952 ?auto_1081962 ) ) ( not ( = ?auto_1081952 ?auto_1081963 ) ) ( not ( = ?auto_1081952 ?auto_1081964 ) ) ( not ( = ?auto_1081952 ?auto_1081966 ) ) ( not ( = ?auto_1081956 ?auto_1081958 ) ) ( not ( = ?auto_1081956 ?auto_1081957 ) ) ( not ( = ?auto_1081956 ?auto_1081959 ) ) ( not ( = ?auto_1081956 ?auto_1081960 ) ) ( not ( = ?auto_1081956 ?auto_1081961 ) ) ( not ( = ?auto_1081956 ?auto_1081962 ) ) ( not ( = ?auto_1081956 ?auto_1081963 ) ) ( not ( = ?auto_1081956 ?auto_1081964 ) ) ( not ( = ?auto_1081956 ?auto_1081966 ) ) ( not ( = ?auto_1081958 ?auto_1081957 ) ) ( not ( = ?auto_1081958 ?auto_1081959 ) ) ( not ( = ?auto_1081958 ?auto_1081960 ) ) ( not ( = ?auto_1081958 ?auto_1081961 ) ) ( not ( = ?auto_1081958 ?auto_1081962 ) ) ( not ( = ?auto_1081958 ?auto_1081963 ) ) ( not ( = ?auto_1081958 ?auto_1081964 ) ) ( not ( = ?auto_1081958 ?auto_1081966 ) ) ( not ( = ?auto_1081957 ?auto_1081959 ) ) ( not ( = ?auto_1081957 ?auto_1081960 ) ) ( not ( = ?auto_1081957 ?auto_1081961 ) ) ( not ( = ?auto_1081957 ?auto_1081962 ) ) ( not ( = ?auto_1081957 ?auto_1081963 ) ) ( not ( = ?auto_1081957 ?auto_1081964 ) ) ( not ( = ?auto_1081957 ?auto_1081966 ) ) ( not ( = ?auto_1081959 ?auto_1081960 ) ) ( not ( = ?auto_1081959 ?auto_1081961 ) ) ( not ( = ?auto_1081959 ?auto_1081962 ) ) ( not ( = ?auto_1081959 ?auto_1081963 ) ) ( not ( = ?auto_1081959 ?auto_1081964 ) ) ( not ( = ?auto_1081959 ?auto_1081966 ) ) ( not ( = ?auto_1081960 ?auto_1081961 ) ) ( not ( = ?auto_1081960 ?auto_1081962 ) ) ( not ( = ?auto_1081960 ?auto_1081963 ) ) ( not ( = ?auto_1081960 ?auto_1081964 ) ) ( not ( = ?auto_1081960 ?auto_1081966 ) ) ( not ( = ?auto_1081961 ?auto_1081962 ) ) ( not ( = ?auto_1081961 ?auto_1081963 ) ) ( not ( = ?auto_1081961 ?auto_1081964 ) ) ( not ( = ?auto_1081961 ?auto_1081966 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081962 ?auto_1081963 ?auto_1081964 )
      ( MAKE-12CRATE-VERIFY ?auto_1081953 ?auto_1081954 ?auto_1081955 ?auto_1081952 ?auto_1081956 ?auto_1081958 ?auto_1081957 ?auto_1081959 ?auto_1081960 ?auto_1081961 ?auto_1081962 ?auto_1081963 ?auto_1081964 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1082116 - SURFACE
      ?auto_1082117 - SURFACE
      ?auto_1082118 - SURFACE
      ?auto_1082115 - SURFACE
      ?auto_1082119 - SURFACE
      ?auto_1082121 - SURFACE
      ?auto_1082120 - SURFACE
      ?auto_1082122 - SURFACE
      ?auto_1082123 - SURFACE
      ?auto_1082124 - SURFACE
      ?auto_1082125 - SURFACE
      ?auto_1082126 - SURFACE
      ?auto_1082127 - SURFACE
    )
    :vars
    (
      ?auto_1082132 - HOIST
      ?auto_1082128 - PLACE
      ?auto_1082130 - PLACE
      ?auto_1082133 - HOIST
      ?auto_1082129 - SURFACE
      ?auto_1082131 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082132 ?auto_1082128 ) ( IS-CRATE ?auto_1082127 ) ( not ( = ?auto_1082126 ?auto_1082127 ) ) ( not ( = ?auto_1082125 ?auto_1082126 ) ) ( not ( = ?auto_1082125 ?auto_1082127 ) ) ( not ( = ?auto_1082130 ?auto_1082128 ) ) ( HOIST-AT ?auto_1082133 ?auto_1082130 ) ( not ( = ?auto_1082132 ?auto_1082133 ) ) ( AVAILABLE ?auto_1082133 ) ( SURFACE-AT ?auto_1082127 ?auto_1082130 ) ( ON ?auto_1082127 ?auto_1082129 ) ( CLEAR ?auto_1082127 ) ( not ( = ?auto_1082126 ?auto_1082129 ) ) ( not ( = ?auto_1082127 ?auto_1082129 ) ) ( not ( = ?auto_1082125 ?auto_1082129 ) ) ( TRUCK-AT ?auto_1082131 ?auto_1082128 ) ( SURFACE-AT ?auto_1082125 ?auto_1082128 ) ( CLEAR ?auto_1082125 ) ( LIFTING ?auto_1082132 ?auto_1082126 ) ( IS-CRATE ?auto_1082126 ) ( ON ?auto_1082117 ?auto_1082116 ) ( ON ?auto_1082118 ?auto_1082117 ) ( ON ?auto_1082115 ?auto_1082118 ) ( ON ?auto_1082119 ?auto_1082115 ) ( ON ?auto_1082121 ?auto_1082119 ) ( ON ?auto_1082120 ?auto_1082121 ) ( ON ?auto_1082122 ?auto_1082120 ) ( ON ?auto_1082123 ?auto_1082122 ) ( ON ?auto_1082124 ?auto_1082123 ) ( ON ?auto_1082125 ?auto_1082124 ) ( not ( = ?auto_1082116 ?auto_1082117 ) ) ( not ( = ?auto_1082116 ?auto_1082118 ) ) ( not ( = ?auto_1082116 ?auto_1082115 ) ) ( not ( = ?auto_1082116 ?auto_1082119 ) ) ( not ( = ?auto_1082116 ?auto_1082121 ) ) ( not ( = ?auto_1082116 ?auto_1082120 ) ) ( not ( = ?auto_1082116 ?auto_1082122 ) ) ( not ( = ?auto_1082116 ?auto_1082123 ) ) ( not ( = ?auto_1082116 ?auto_1082124 ) ) ( not ( = ?auto_1082116 ?auto_1082125 ) ) ( not ( = ?auto_1082116 ?auto_1082126 ) ) ( not ( = ?auto_1082116 ?auto_1082127 ) ) ( not ( = ?auto_1082116 ?auto_1082129 ) ) ( not ( = ?auto_1082117 ?auto_1082118 ) ) ( not ( = ?auto_1082117 ?auto_1082115 ) ) ( not ( = ?auto_1082117 ?auto_1082119 ) ) ( not ( = ?auto_1082117 ?auto_1082121 ) ) ( not ( = ?auto_1082117 ?auto_1082120 ) ) ( not ( = ?auto_1082117 ?auto_1082122 ) ) ( not ( = ?auto_1082117 ?auto_1082123 ) ) ( not ( = ?auto_1082117 ?auto_1082124 ) ) ( not ( = ?auto_1082117 ?auto_1082125 ) ) ( not ( = ?auto_1082117 ?auto_1082126 ) ) ( not ( = ?auto_1082117 ?auto_1082127 ) ) ( not ( = ?auto_1082117 ?auto_1082129 ) ) ( not ( = ?auto_1082118 ?auto_1082115 ) ) ( not ( = ?auto_1082118 ?auto_1082119 ) ) ( not ( = ?auto_1082118 ?auto_1082121 ) ) ( not ( = ?auto_1082118 ?auto_1082120 ) ) ( not ( = ?auto_1082118 ?auto_1082122 ) ) ( not ( = ?auto_1082118 ?auto_1082123 ) ) ( not ( = ?auto_1082118 ?auto_1082124 ) ) ( not ( = ?auto_1082118 ?auto_1082125 ) ) ( not ( = ?auto_1082118 ?auto_1082126 ) ) ( not ( = ?auto_1082118 ?auto_1082127 ) ) ( not ( = ?auto_1082118 ?auto_1082129 ) ) ( not ( = ?auto_1082115 ?auto_1082119 ) ) ( not ( = ?auto_1082115 ?auto_1082121 ) ) ( not ( = ?auto_1082115 ?auto_1082120 ) ) ( not ( = ?auto_1082115 ?auto_1082122 ) ) ( not ( = ?auto_1082115 ?auto_1082123 ) ) ( not ( = ?auto_1082115 ?auto_1082124 ) ) ( not ( = ?auto_1082115 ?auto_1082125 ) ) ( not ( = ?auto_1082115 ?auto_1082126 ) ) ( not ( = ?auto_1082115 ?auto_1082127 ) ) ( not ( = ?auto_1082115 ?auto_1082129 ) ) ( not ( = ?auto_1082119 ?auto_1082121 ) ) ( not ( = ?auto_1082119 ?auto_1082120 ) ) ( not ( = ?auto_1082119 ?auto_1082122 ) ) ( not ( = ?auto_1082119 ?auto_1082123 ) ) ( not ( = ?auto_1082119 ?auto_1082124 ) ) ( not ( = ?auto_1082119 ?auto_1082125 ) ) ( not ( = ?auto_1082119 ?auto_1082126 ) ) ( not ( = ?auto_1082119 ?auto_1082127 ) ) ( not ( = ?auto_1082119 ?auto_1082129 ) ) ( not ( = ?auto_1082121 ?auto_1082120 ) ) ( not ( = ?auto_1082121 ?auto_1082122 ) ) ( not ( = ?auto_1082121 ?auto_1082123 ) ) ( not ( = ?auto_1082121 ?auto_1082124 ) ) ( not ( = ?auto_1082121 ?auto_1082125 ) ) ( not ( = ?auto_1082121 ?auto_1082126 ) ) ( not ( = ?auto_1082121 ?auto_1082127 ) ) ( not ( = ?auto_1082121 ?auto_1082129 ) ) ( not ( = ?auto_1082120 ?auto_1082122 ) ) ( not ( = ?auto_1082120 ?auto_1082123 ) ) ( not ( = ?auto_1082120 ?auto_1082124 ) ) ( not ( = ?auto_1082120 ?auto_1082125 ) ) ( not ( = ?auto_1082120 ?auto_1082126 ) ) ( not ( = ?auto_1082120 ?auto_1082127 ) ) ( not ( = ?auto_1082120 ?auto_1082129 ) ) ( not ( = ?auto_1082122 ?auto_1082123 ) ) ( not ( = ?auto_1082122 ?auto_1082124 ) ) ( not ( = ?auto_1082122 ?auto_1082125 ) ) ( not ( = ?auto_1082122 ?auto_1082126 ) ) ( not ( = ?auto_1082122 ?auto_1082127 ) ) ( not ( = ?auto_1082122 ?auto_1082129 ) ) ( not ( = ?auto_1082123 ?auto_1082124 ) ) ( not ( = ?auto_1082123 ?auto_1082125 ) ) ( not ( = ?auto_1082123 ?auto_1082126 ) ) ( not ( = ?auto_1082123 ?auto_1082127 ) ) ( not ( = ?auto_1082123 ?auto_1082129 ) ) ( not ( = ?auto_1082124 ?auto_1082125 ) ) ( not ( = ?auto_1082124 ?auto_1082126 ) ) ( not ( = ?auto_1082124 ?auto_1082127 ) ) ( not ( = ?auto_1082124 ?auto_1082129 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1082125 ?auto_1082126 ?auto_1082127 )
      ( MAKE-12CRATE-VERIFY ?auto_1082116 ?auto_1082117 ?auto_1082118 ?auto_1082115 ?auto_1082119 ?auto_1082121 ?auto_1082120 ?auto_1082122 ?auto_1082123 ?auto_1082124 ?auto_1082125 ?auto_1082126 ?auto_1082127 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1082279 - SURFACE
      ?auto_1082280 - SURFACE
      ?auto_1082281 - SURFACE
      ?auto_1082278 - SURFACE
      ?auto_1082282 - SURFACE
      ?auto_1082284 - SURFACE
      ?auto_1082283 - SURFACE
      ?auto_1082285 - SURFACE
      ?auto_1082286 - SURFACE
      ?auto_1082287 - SURFACE
      ?auto_1082288 - SURFACE
      ?auto_1082289 - SURFACE
      ?auto_1082290 - SURFACE
    )
    :vars
    (
      ?auto_1082294 - HOIST
      ?auto_1082296 - PLACE
      ?auto_1082291 - PLACE
      ?auto_1082292 - HOIST
      ?auto_1082293 - SURFACE
      ?auto_1082295 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082294 ?auto_1082296 ) ( IS-CRATE ?auto_1082290 ) ( not ( = ?auto_1082289 ?auto_1082290 ) ) ( not ( = ?auto_1082288 ?auto_1082289 ) ) ( not ( = ?auto_1082288 ?auto_1082290 ) ) ( not ( = ?auto_1082291 ?auto_1082296 ) ) ( HOIST-AT ?auto_1082292 ?auto_1082291 ) ( not ( = ?auto_1082294 ?auto_1082292 ) ) ( AVAILABLE ?auto_1082292 ) ( SURFACE-AT ?auto_1082290 ?auto_1082291 ) ( ON ?auto_1082290 ?auto_1082293 ) ( CLEAR ?auto_1082290 ) ( not ( = ?auto_1082289 ?auto_1082293 ) ) ( not ( = ?auto_1082290 ?auto_1082293 ) ) ( not ( = ?auto_1082288 ?auto_1082293 ) ) ( TRUCK-AT ?auto_1082295 ?auto_1082296 ) ( SURFACE-AT ?auto_1082288 ?auto_1082296 ) ( CLEAR ?auto_1082288 ) ( IS-CRATE ?auto_1082289 ) ( AVAILABLE ?auto_1082294 ) ( IN ?auto_1082289 ?auto_1082295 ) ( ON ?auto_1082280 ?auto_1082279 ) ( ON ?auto_1082281 ?auto_1082280 ) ( ON ?auto_1082278 ?auto_1082281 ) ( ON ?auto_1082282 ?auto_1082278 ) ( ON ?auto_1082284 ?auto_1082282 ) ( ON ?auto_1082283 ?auto_1082284 ) ( ON ?auto_1082285 ?auto_1082283 ) ( ON ?auto_1082286 ?auto_1082285 ) ( ON ?auto_1082287 ?auto_1082286 ) ( ON ?auto_1082288 ?auto_1082287 ) ( not ( = ?auto_1082279 ?auto_1082280 ) ) ( not ( = ?auto_1082279 ?auto_1082281 ) ) ( not ( = ?auto_1082279 ?auto_1082278 ) ) ( not ( = ?auto_1082279 ?auto_1082282 ) ) ( not ( = ?auto_1082279 ?auto_1082284 ) ) ( not ( = ?auto_1082279 ?auto_1082283 ) ) ( not ( = ?auto_1082279 ?auto_1082285 ) ) ( not ( = ?auto_1082279 ?auto_1082286 ) ) ( not ( = ?auto_1082279 ?auto_1082287 ) ) ( not ( = ?auto_1082279 ?auto_1082288 ) ) ( not ( = ?auto_1082279 ?auto_1082289 ) ) ( not ( = ?auto_1082279 ?auto_1082290 ) ) ( not ( = ?auto_1082279 ?auto_1082293 ) ) ( not ( = ?auto_1082280 ?auto_1082281 ) ) ( not ( = ?auto_1082280 ?auto_1082278 ) ) ( not ( = ?auto_1082280 ?auto_1082282 ) ) ( not ( = ?auto_1082280 ?auto_1082284 ) ) ( not ( = ?auto_1082280 ?auto_1082283 ) ) ( not ( = ?auto_1082280 ?auto_1082285 ) ) ( not ( = ?auto_1082280 ?auto_1082286 ) ) ( not ( = ?auto_1082280 ?auto_1082287 ) ) ( not ( = ?auto_1082280 ?auto_1082288 ) ) ( not ( = ?auto_1082280 ?auto_1082289 ) ) ( not ( = ?auto_1082280 ?auto_1082290 ) ) ( not ( = ?auto_1082280 ?auto_1082293 ) ) ( not ( = ?auto_1082281 ?auto_1082278 ) ) ( not ( = ?auto_1082281 ?auto_1082282 ) ) ( not ( = ?auto_1082281 ?auto_1082284 ) ) ( not ( = ?auto_1082281 ?auto_1082283 ) ) ( not ( = ?auto_1082281 ?auto_1082285 ) ) ( not ( = ?auto_1082281 ?auto_1082286 ) ) ( not ( = ?auto_1082281 ?auto_1082287 ) ) ( not ( = ?auto_1082281 ?auto_1082288 ) ) ( not ( = ?auto_1082281 ?auto_1082289 ) ) ( not ( = ?auto_1082281 ?auto_1082290 ) ) ( not ( = ?auto_1082281 ?auto_1082293 ) ) ( not ( = ?auto_1082278 ?auto_1082282 ) ) ( not ( = ?auto_1082278 ?auto_1082284 ) ) ( not ( = ?auto_1082278 ?auto_1082283 ) ) ( not ( = ?auto_1082278 ?auto_1082285 ) ) ( not ( = ?auto_1082278 ?auto_1082286 ) ) ( not ( = ?auto_1082278 ?auto_1082287 ) ) ( not ( = ?auto_1082278 ?auto_1082288 ) ) ( not ( = ?auto_1082278 ?auto_1082289 ) ) ( not ( = ?auto_1082278 ?auto_1082290 ) ) ( not ( = ?auto_1082278 ?auto_1082293 ) ) ( not ( = ?auto_1082282 ?auto_1082284 ) ) ( not ( = ?auto_1082282 ?auto_1082283 ) ) ( not ( = ?auto_1082282 ?auto_1082285 ) ) ( not ( = ?auto_1082282 ?auto_1082286 ) ) ( not ( = ?auto_1082282 ?auto_1082287 ) ) ( not ( = ?auto_1082282 ?auto_1082288 ) ) ( not ( = ?auto_1082282 ?auto_1082289 ) ) ( not ( = ?auto_1082282 ?auto_1082290 ) ) ( not ( = ?auto_1082282 ?auto_1082293 ) ) ( not ( = ?auto_1082284 ?auto_1082283 ) ) ( not ( = ?auto_1082284 ?auto_1082285 ) ) ( not ( = ?auto_1082284 ?auto_1082286 ) ) ( not ( = ?auto_1082284 ?auto_1082287 ) ) ( not ( = ?auto_1082284 ?auto_1082288 ) ) ( not ( = ?auto_1082284 ?auto_1082289 ) ) ( not ( = ?auto_1082284 ?auto_1082290 ) ) ( not ( = ?auto_1082284 ?auto_1082293 ) ) ( not ( = ?auto_1082283 ?auto_1082285 ) ) ( not ( = ?auto_1082283 ?auto_1082286 ) ) ( not ( = ?auto_1082283 ?auto_1082287 ) ) ( not ( = ?auto_1082283 ?auto_1082288 ) ) ( not ( = ?auto_1082283 ?auto_1082289 ) ) ( not ( = ?auto_1082283 ?auto_1082290 ) ) ( not ( = ?auto_1082283 ?auto_1082293 ) ) ( not ( = ?auto_1082285 ?auto_1082286 ) ) ( not ( = ?auto_1082285 ?auto_1082287 ) ) ( not ( = ?auto_1082285 ?auto_1082288 ) ) ( not ( = ?auto_1082285 ?auto_1082289 ) ) ( not ( = ?auto_1082285 ?auto_1082290 ) ) ( not ( = ?auto_1082285 ?auto_1082293 ) ) ( not ( = ?auto_1082286 ?auto_1082287 ) ) ( not ( = ?auto_1082286 ?auto_1082288 ) ) ( not ( = ?auto_1082286 ?auto_1082289 ) ) ( not ( = ?auto_1082286 ?auto_1082290 ) ) ( not ( = ?auto_1082286 ?auto_1082293 ) ) ( not ( = ?auto_1082287 ?auto_1082288 ) ) ( not ( = ?auto_1082287 ?auto_1082289 ) ) ( not ( = ?auto_1082287 ?auto_1082290 ) ) ( not ( = ?auto_1082287 ?auto_1082293 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1082288 ?auto_1082289 ?auto_1082290 )
      ( MAKE-12CRATE-VERIFY ?auto_1082279 ?auto_1082280 ?auto_1082281 ?auto_1082278 ?auto_1082282 ?auto_1082284 ?auto_1082283 ?auto_1082285 ?auto_1082286 ?auto_1082287 ?auto_1082288 ?auto_1082289 ?auto_1082290 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1093883 - SURFACE
      ?auto_1093884 - SURFACE
      ?auto_1093885 - SURFACE
      ?auto_1093882 - SURFACE
      ?auto_1093886 - SURFACE
      ?auto_1093888 - SURFACE
      ?auto_1093887 - SURFACE
      ?auto_1093889 - SURFACE
      ?auto_1093890 - SURFACE
      ?auto_1093891 - SURFACE
      ?auto_1093892 - SURFACE
      ?auto_1093893 - SURFACE
      ?auto_1093894 - SURFACE
      ?auto_1093895 - SURFACE
    )
    :vars
    (
      ?auto_1093896 - HOIST
      ?auto_1093897 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1093896 ?auto_1093897 ) ( SURFACE-AT ?auto_1093894 ?auto_1093897 ) ( CLEAR ?auto_1093894 ) ( LIFTING ?auto_1093896 ?auto_1093895 ) ( IS-CRATE ?auto_1093895 ) ( not ( = ?auto_1093894 ?auto_1093895 ) ) ( ON ?auto_1093884 ?auto_1093883 ) ( ON ?auto_1093885 ?auto_1093884 ) ( ON ?auto_1093882 ?auto_1093885 ) ( ON ?auto_1093886 ?auto_1093882 ) ( ON ?auto_1093888 ?auto_1093886 ) ( ON ?auto_1093887 ?auto_1093888 ) ( ON ?auto_1093889 ?auto_1093887 ) ( ON ?auto_1093890 ?auto_1093889 ) ( ON ?auto_1093891 ?auto_1093890 ) ( ON ?auto_1093892 ?auto_1093891 ) ( ON ?auto_1093893 ?auto_1093892 ) ( ON ?auto_1093894 ?auto_1093893 ) ( not ( = ?auto_1093883 ?auto_1093884 ) ) ( not ( = ?auto_1093883 ?auto_1093885 ) ) ( not ( = ?auto_1093883 ?auto_1093882 ) ) ( not ( = ?auto_1093883 ?auto_1093886 ) ) ( not ( = ?auto_1093883 ?auto_1093888 ) ) ( not ( = ?auto_1093883 ?auto_1093887 ) ) ( not ( = ?auto_1093883 ?auto_1093889 ) ) ( not ( = ?auto_1093883 ?auto_1093890 ) ) ( not ( = ?auto_1093883 ?auto_1093891 ) ) ( not ( = ?auto_1093883 ?auto_1093892 ) ) ( not ( = ?auto_1093883 ?auto_1093893 ) ) ( not ( = ?auto_1093883 ?auto_1093894 ) ) ( not ( = ?auto_1093883 ?auto_1093895 ) ) ( not ( = ?auto_1093884 ?auto_1093885 ) ) ( not ( = ?auto_1093884 ?auto_1093882 ) ) ( not ( = ?auto_1093884 ?auto_1093886 ) ) ( not ( = ?auto_1093884 ?auto_1093888 ) ) ( not ( = ?auto_1093884 ?auto_1093887 ) ) ( not ( = ?auto_1093884 ?auto_1093889 ) ) ( not ( = ?auto_1093884 ?auto_1093890 ) ) ( not ( = ?auto_1093884 ?auto_1093891 ) ) ( not ( = ?auto_1093884 ?auto_1093892 ) ) ( not ( = ?auto_1093884 ?auto_1093893 ) ) ( not ( = ?auto_1093884 ?auto_1093894 ) ) ( not ( = ?auto_1093884 ?auto_1093895 ) ) ( not ( = ?auto_1093885 ?auto_1093882 ) ) ( not ( = ?auto_1093885 ?auto_1093886 ) ) ( not ( = ?auto_1093885 ?auto_1093888 ) ) ( not ( = ?auto_1093885 ?auto_1093887 ) ) ( not ( = ?auto_1093885 ?auto_1093889 ) ) ( not ( = ?auto_1093885 ?auto_1093890 ) ) ( not ( = ?auto_1093885 ?auto_1093891 ) ) ( not ( = ?auto_1093885 ?auto_1093892 ) ) ( not ( = ?auto_1093885 ?auto_1093893 ) ) ( not ( = ?auto_1093885 ?auto_1093894 ) ) ( not ( = ?auto_1093885 ?auto_1093895 ) ) ( not ( = ?auto_1093882 ?auto_1093886 ) ) ( not ( = ?auto_1093882 ?auto_1093888 ) ) ( not ( = ?auto_1093882 ?auto_1093887 ) ) ( not ( = ?auto_1093882 ?auto_1093889 ) ) ( not ( = ?auto_1093882 ?auto_1093890 ) ) ( not ( = ?auto_1093882 ?auto_1093891 ) ) ( not ( = ?auto_1093882 ?auto_1093892 ) ) ( not ( = ?auto_1093882 ?auto_1093893 ) ) ( not ( = ?auto_1093882 ?auto_1093894 ) ) ( not ( = ?auto_1093882 ?auto_1093895 ) ) ( not ( = ?auto_1093886 ?auto_1093888 ) ) ( not ( = ?auto_1093886 ?auto_1093887 ) ) ( not ( = ?auto_1093886 ?auto_1093889 ) ) ( not ( = ?auto_1093886 ?auto_1093890 ) ) ( not ( = ?auto_1093886 ?auto_1093891 ) ) ( not ( = ?auto_1093886 ?auto_1093892 ) ) ( not ( = ?auto_1093886 ?auto_1093893 ) ) ( not ( = ?auto_1093886 ?auto_1093894 ) ) ( not ( = ?auto_1093886 ?auto_1093895 ) ) ( not ( = ?auto_1093888 ?auto_1093887 ) ) ( not ( = ?auto_1093888 ?auto_1093889 ) ) ( not ( = ?auto_1093888 ?auto_1093890 ) ) ( not ( = ?auto_1093888 ?auto_1093891 ) ) ( not ( = ?auto_1093888 ?auto_1093892 ) ) ( not ( = ?auto_1093888 ?auto_1093893 ) ) ( not ( = ?auto_1093888 ?auto_1093894 ) ) ( not ( = ?auto_1093888 ?auto_1093895 ) ) ( not ( = ?auto_1093887 ?auto_1093889 ) ) ( not ( = ?auto_1093887 ?auto_1093890 ) ) ( not ( = ?auto_1093887 ?auto_1093891 ) ) ( not ( = ?auto_1093887 ?auto_1093892 ) ) ( not ( = ?auto_1093887 ?auto_1093893 ) ) ( not ( = ?auto_1093887 ?auto_1093894 ) ) ( not ( = ?auto_1093887 ?auto_1093895 ) ) ( not ( = ?auto_1093889 ?auto_1093890 ) ) ( not ( = ?auto_1093889 ?auto_1093891 ) ) ( not ( = ?auto_1093889 ?auto_1093892 ) ) ( not ( = ?auto_1093889 ?auto_1093893 ) ) ( not ( = ?auto_1093889 ?auto_1093894 ) ) ( not ( = ?auto_1093889 ?auto_1093895 ) ) ( not ( = ?auto_1093890 ?auto_1093891 ) ) ( not ( = ?auto_1093890 ?auto_1093892 ) ) ( not ( = ?auto_1093890 ?auto_1093893 ) ) ( not ( = ?auto_1093890 ?auto_1093894 ) ) ( not ( = ?auto_1093890 ?auto_1093895 ) ) ( not ( = ?auto_1093891 ?auto_1093892 ) ) ( not ( = ?auto_1093891 ?auto_1093893 ) ) ( not ( = ?auto_1093891 ?auto_1093894 ) ) ( not ( = ?auto_1093891 ?auto_1093895 ) ) ( not ( = ?auto_1093892 ?auto_1093893 ) ) ( not ( = ?auto_1093892 ?auto_1093894 ) ) ( not ( = ?auto_1093892 ?auto_1093895 ) ) ( not ( = ?auto_1093893 ?auto_1093894 ) ) ( not ( = ?auto_1093893 ?auto_1093895 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1093894 ?auto_1093895 )
      ( MAKE-13CRATE-VERIFY ?auto_1093883 ?auto_1093884 ?auto_1093885 ?auto_1093882 ?auto_1093886 ?auto_1093888 ?auto_1093887 ?auto_1093889 ?auto_1093890 ?auto_1093891 ?auto_1093892 ?auto_1093893 ?auto_1093894 ?auto_1093895 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1094025 - SURFACE
      ?auto_1094026 - SURFACE
      ?auto_1094027 - SURFACE
      ?auto_1094024 - SURFACE
      ?auto_1094028 - SURFACE
      ?auto_1094030 - SURFACE
      ?auto_1094029 - SURFACE
      ?auto_1094031 - SURFACE
      ?auto_1094032 - SURFACE
      ?auto_1094033 - SURFACE
      ?auto_1094034 - SURFACE
      ?auto_1094035 - SURFACE
      ?auto_1094036 - SURFACE
      ?auto_1094037 - SURFACE
    )
    :vars
    (
      ?auto_1094038 - HOIST
      ?auto_1094039 - PLACE
      ?auto_1094040 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1094038 ?auto_1094039 ) ( SURFACE-AT ?auto_1094036 ?auto_1094039 ) ( CLEAR ?auto_1094036 ) ( IS-CRATE ?auto_1094037 ) ( not ( = ?auto_1094036 ?auto_1094037 ) ) ( TRUCK-AT ?auto_1094040 ?auto_1094039 ) ( AVAILABLE ?auto_1094038 ) ( IN ?auto_1094037 ?auto_1094040 ) ( ON ?auto_1094036 ?auto_1094035 ) ( not ( = ?auto_1094035 ?auto_1094036 ) ) ( not ( = ?auto_1094035 ?auto_1094037 ) ) ( ON ?auto_1094026 ?auto_1094025 ) ( ON ?auto_1094027 ?auto_1094026 ) ( ON ?auto_1094024 ?auto_1094027 ) ( ON ?auto_1094028 ?auto_1094024 ) ( ON ?auto_1094030 ?auto_1094028 ) ( ON ?auto_1094029 ?auto_1094030 ) ( ON ?auto_1094031 ?auto_1094029 ) ( ON ?auto_1094032 ?auto_1094031 ) ( ON ?auto_1094033 ?auto_1094032 ) ( ON ?auto_1094034 ?auto_1094033 ) ( ON ?auto_1094035 ?auto_1094034 ) ( not ( = ?auto_1094025 ?auto_1094026 ) ) ( not ( = ?auto_1094025 ?auto_1094027 ) ) ( not ( = ?auto_1094025 ?auto_1094024 ) ) ( not ( = ?auto_1094025 ?auto_1094028 ) ) ( not ( = ?auto_1094025 ?auto_1094030 ) ) ( not ( = ?auto_1094025 ?auto_1094029 ) ) ( not ( = ?auto_1094025 ?auto_1094031 ) ) ( not ( = ?auto_1094025 ?auto_1094032 ) ) ( not ( = ?auto_1094025 ?auto_1094033 ) ) ( not ( = ?auto_1094025 ?auto_1094034 ) ) ( not ( = ?auto_1094025 ?auto_1094035 ) ) ( not ( = ?auto_1094025 ?auto_1094036 ) ) ( not ( = ?auto_1094025 ?auto_1094037 ) ) ( not ( = ?auto_1094026 ?auto_1094027 ) ) ( not ( = ?auto_1094026 ?auto_1094024 ) ) ( not ( = ?auto_1094026 ?auto_1094028 ) ) ( not ( = ?auto_1094026 ?auto_1094030 ) ) ( not ( = ?auto_1094026 ?auto_1094029 ) ) ( not ( = ?auto_1094026 ?auto_1094031 ) ) ( not ( = ?auto_1094026 ?auto_1094032 ) ) ( not ( = ?auto_1094026 ?auto_1094033 ) ) ( not ( = ?auto_1094026 ?auto_1094034 ) ) ( not ( = ?auto_1094026 ?auto_1094035 ) ) ( not ( = ?auto_1094026 ?auto_1094036 ) ) ( not ( = ?auto_1094026 ?auto_1094037 ) ) ( not ( = ?auto_1094027 ?auto_1094024 ) ) ( not ( = ?auto_1094027 ?auto_1094028 ) ) ( not ( = ?auto_1094027 ?auto_1094030 ) ) ( not ( = ?auto_1094027 ?auto_1094029 ) ) ( not ( = ?auto_1094027 ?auto_1094031 ) ) ( not ( = ?auto_1094027 ?auto_1094032 ) ) ( not ( = ?auto_1094027 ?auto_1094033 ) ) ( not ( = ?auto_1094027 ?auto_1094034 ) ) ( not ( = ?auto_1094027 ?auto_1094035 ) ) ( not ( = ?auto_1094027 ?auto_1094036 ) ) ( not ( = ?auto_1094027 ?auto_1094037 ) ) ( not ( = ?auto_1094024 ?auto_1094028 ) ) ( not ( = ?auto_1094024 ?auto_1094030 ) ) ( not ( = ?auto_1094024 ?auto_1094029 ) ) ( not ( = ?auto_1094024 ?auto_1094031 ) ) ( not ( = ?auto_1094024 ?auto_1094032 ) ) ( not ( = ?auto_1094024 ?auto_1094033 ) ) ( not ( = ?auto_1094024 ?auto_1094034 ) ) ( not ( = ?auto_1094024 ?auto_1094035 ) ) ( not ( = ?auto_1094024 ?auto_1094036 ) ) ( not ( = ?auto_1094024 ?auto_1094037 ) ) ( not ( = ?auto_1094028 ?auto_1094030 ) ) ( not ( = ?auto_1094028 ?auto_1094029 ) ) ( not ( = ?auto_1094028 ?auto_1094031 ) ) ( not ( = ?auto_1094028 ?auto_1094032 ) ) ( not ( = ?auto_1094028 ?auto_1094033 ) ) ( not ( = ?auto_1094028 ?auto_1094034 ) ) ( not ( = ?auto_1094028 ?auto_1094035 ) ) ( not ( = ?auto_1094028 ?auto_1094036 ) ) ( not ( = ?auto_1094028 ?auto_1094037 ) ) ( not ( = ?auto_1094030 ?auto_1094029 ) ) ( not ( = ?auto_1094030 ?auto_1094031 ) ) ( not ( = ?auto_1094030 ?auto_1094032 ) ) ( not ( = ?auto_1094030 ?auto_1094033 ) ) ( not ( = ?auto_1094030 ?auto_1094034 ) ) ( not ( = ?auto_1094030 ?auto_1094035 ) ) ( not ( = ?auto_1094030 ?auto_1094036 ) ) ( not ( = ?auto_1094030 ?auto_1094037 ) ) ( not ( = ?auto_1094029 ?auto_1094031 ) ) ( not ( = ?auto_1094029 ?auto_1094032 ) ) ( not ( = ?auto_1094029 ?auto_1094033 ) ) ( not ( = ?auto_1094029 ?auto_1094034 ) ) ( not ( = ?auto_1094029 ?auto_1094035 ) ) ( not ( = ?auto_1094029 ?auto_1094036 ) ) ( not ( = ?auto_1094029 ?auto_1094037 ) ) ( not ( = ?auto_1094031 ?auto_1094032 ) ) ( not ( = ?auto_1094031 ?auto_1094033 ) ) ( not ( = ?auto_1094031 ?auto_1094034 ) ) ( not ( = ?auto_1094031 ?auto_1094035 ) ) ( not ( = ?auto_1094031 ?auto_1094036 ) ) ( not ( = ?auto_1094031 ?auto_1094037 ) ) ( not ( = ?auto_1094032 ?auto_1094033 ) ) ( not ( = ?auto_1094032 ?auto_1094034 ) ) ( not ( = ?auto_1094032 ?auto_1094035 ) ) ( not ( = ?auto_1094032 ?auto_1094036 ) ) ( not ( = ?auto_1094032 ?auto_1094037 ) ) ( not ( = ?auto_1094033 ?auto_1094034 ) ) ( not ( = ?auto_1094033 ?auto_1094035 ) ) ( not ( = ?auto_1094033 ?auto_1094036 ) ) ( not ( = ?auto_1094033 ?auto_1094037 ) ) ( not ( = ?auto_1094034 ?auto_1094035 ) ) ( not ( = ?auto_1094034 ?auto_1094036 ) ) ( not ( = ?auto_1094034 ?auto_1094037 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1094035 ?auto_1094036 ?auto_1094037 )
      ( MAKE-13CRATE-VERIFY ?auto_1094025 ?auto_1094026 ?auto_1094027 ?auto_1094024 ?auto_1094028 ?auto_1094030 ?auto_1094029 ?auto_1094031 ?auto_1094032 ?auto_1094033 ?auto_1094034 ?auto_1094035 ?auto_1094036 ?auto_1094037 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1094181 - SURFACE
      ?auto_1094182 - SURFACE
      ?auto_1094183 - SURFACE
      ?auto_1094180 - SURFACE
      ?auto_1094184 - SURFACE
      ?auto_1094186 - SURFACE
      ?auto_1094185 - SURFACE
      ?auto_1094187 - SURFACE
      ?auto_1094188 - SURFACE
      ?auto_1094189 - SURFACE
      ?auto_1094190 - SURFACE
      ?auto_1094191 - SURFACE
      ?auto_1094192 - SURFACE
      ?auto_1094193 - SURFACE
    )
    :vars
    (
      ?auto_1094194 - HOIST
      ?auto_1094196 - PLACE
      ?auto_1094195 - TRUCK
      ?auto_1094197 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1094194 ?auto_1094196 ) ( SURFACE-AT ?auto_1094192 ?auto_1094196 ) ( CLEAR ?auto_1094192 ) ( IS-CRATE ?auto_1094193 ) ( not ( = ?auto_1094192 ?auto_1094193 ) ) ( AVAILABLE ?auto_1094194 ) ( IN ?auto_1094193 ?auto_1094195 ) ( ON ?auto_1094192 ?auto_1094191 ) ( not ( = ?auto_1094191 ?auto_1094192 ) ) ( not ( = ?auto_1094191 ?auto_1094193 ) ) ( TRUCK-AT ?auto_1094195 ?auto_1094197 ) ( not ( = ?auto_1094197 ?auto_1094196 ) ) ( ON ?auto_1094182 ?auto_1094181 ) ( ON ?auto_1094183 ?auto_1094182 ) ( ON ?auto_1094180 ?auto_1094183 ) ( ON ?auto_1094184 ?auto_1094180 ) ( ON ?auto_1094186 ?auto_1094184 ) ( ON ?auto_1094185 ?auto_1094186 ) ( ON ?auto_1094187 ?auto_1094185 ) ( ON ?auto_1094188 ?auto_1094187 ) ( ON ?auto_1094189 ?auto_1094188 ) ( ON ?auto_1094190 ?auto_1094189 ) ( ON ?auto_1094191 ?auto_1094190 ) ( not ( = ?auto_1094181 ?auto_1094182 ) ) ( not ( = ?auto_1094181 ?auto_1094183 ) ) ( not ( = ?auto_1094181 ?auto_1094180 ) ) ( not ( = ?auto_1094181 ?auto_1094184 ) ) ( not ( = ?auto_1094181 ?auto_1094186 ) ) ( not ( = ?auto_1094181 ?auto_1094185 ) ) ( not ( = ?auto_1094181 ?auto_1094187 ) ) ( not ( = ?auto_1094181 ?auto_1094188 ) ) ( not ( = ?auto_1094181 ?auto_1094189 ) ) ( not ( = ?auto_1094181 ?auto_1094190 ) ) ( not ( = ?auto_1094181 ?auto_1094191 ) ) ( not ( = ?auto_1094181 ?auto_1094192 ) ) ( not ( = ?auto_1094181 ?auto_1094193 ) ) ( not ( = ?auto_1094182 ?auto_1094183 ) ) ( not ( = ?auto_1094182 ?auto_1094180 ) ) ( not ( = ?auto_1094182 ?auto_1094184 ) ) ( not ( = ?auto_1094182 ?auto_1094186 ) ) ( not ( = ?auto_1094182 ?auto_1094185 ) ) ( not ( = ?auto_1094182 ?auto_1094187 ) ) ( not ( = ?auto_1094182 ?auto_1094188 ) ) ( not ( = ?auto_1094182 ?auto_1094189 ) ) ( not ( = ?auto_1094182 ?auto_1094190 ) ) ( not ( = ?auto_1094182 ?auto_1094191 ) ) ( not ( = ?auto_1094182 ?auto_1094192 ) ) ( not ( = ?auto_1094182 ?auto_1094193 ) ) ( not ( = ?auto_1094183 ?auto_1094180 ) ) ( not ( = ?auto_1094183 ?auto_1094184 ) ) ( not ( = ?auto_1094183 ?auto_1094186 ) ) ( not ( = ?auto_1094183 ?auto_1094185 ) ) ( not ( = ?auto_1094183 ?auto_1094187 ) ) ( not ( = ?auto_1094183 ?auto_1094188 ) ) ( not ( = ?auto_1094183 ?auto_1094189 ) ) ( not ( = ?auto_1094183 ?auto_1094190 ) ) ( not ( = ?auto_1094183 ?auto_1094191 ) ) ( not ( = ?auto_1094183 ?auto_1094192 ) ) ( not ( = ?auto_1094183 ?auto_1094193 ) ) ( not ( = ?auto_1094180 ?auto_1094184 ) ) ( not ( = ?auto_1094180 ?auto_1094186 ) ) ( not ( = ?auto_1094180 ?auto_1094185 ) ) ( not ( = ?auto_1094180 ?auto_1094187 ) ) ( not ( = ?auto_1094180 ?auto_1094188 ) ) ( not ( = ?auto_1094180 ?auto_1094189 ) ) ( not ( = ?auto_1094180 ?auto_1094190 ) ) ( not ( = ?auto_1094180 ?auto_1094191 ) ) ( not ( = ?auto_1094180 ?auto_1094192 ) ) ( not ( = ?auto_1094180 ?auto_1094193 ) ) ( not ( = ?auto_1094184 ?auto_1094186 ) ) ( not ( = ?auto_1094184 ?auto_1094185 ) ) ( not ( = ?auto_1094184 ?auto_1094187 ) ) ( not ( = ?auto_1094184 ?auto_1094188 ) ) ( not ( = ?auto_1094184 ?auto_1094189 ) ) ( not ( = ?auto_1094184 ?auto_1094190 ) ) ( not ( = ?auto_1094184 ?auto_1094191 ) ) ( not ( = ?auto_1094184 ?auto_1094192 ) ) ( not ( = ?auto_1094184 ?auto_1094193 ) ) ( not ( = ?auto_1094186 ?auto_1094185 ) ) ( not ( = ?auto_1094186 ?auto_1094187 ) ) ( not ( = ?auto_1094186 ?auto_1094188 ) ) ( not ( = ?auto_1094186 ?auto_1094189 ) ) ( not ( = ?auto_1094186 ?auto_1094190 ) ) ( not ( = ?auto_1094186 ?auto_1094191 ) ) ( not ( = ?auto_1094186 ?auto_1094192 ) ) ( not ( = ?auto_1094186 ?auto_1094193 ) ) ( not ( = ?auto_1094185 ?auto_1094187 ) ) ( not ( = ?auto_1094185 ?auto_1094188 ) ) ( not ( = ?auto_1094185 ?auto_1094189 ) ) ( not ( = ?auto_1094185 ?auto_1094190 ) ) ( not ( = ?auto_1094185 ?auto_1094191 ) ) ( not ( = ?auto_1094185 ?auto_1094192 ) ) ( not ( = ?auto_1094185 ?auto_1094193 ) ) ( not ( = ?auto_1094187 ?auto_1094188 ) ) ( not ( = ?auto_1094187 ?auto_1094189 ) ) ( not ( = ?auto_1094187 ?auto_1094190 ) ) ( not ( = ?auto_1094187 ?auto_1094191 ) ) ( not ( = ?auto_1094187 ?auto_1094192 ) ) ( not ( = ?auto_1094187 ?auto_1094193 ) ) ( not ( = ?auto_1094188 ?auto_1094189 ) ) ( not ( = ?auto_1094188 ?auto_1094190 ) ) ( not ( = ?auto_1094188 ?auto_1094191 ) ) ( not ( = ?auto_1094188 ?auto_1094192 ) ) ( not ( = ?auto_1094188 ?auto_1094193 ) ) ( not ( = ?auto_1094189 ?auto_1094190 ) ) ( not ( = ?auto_1094189 ?auto_1094191 ) ) ( not ( = ?auto_1094189 ?auto_1094192 ) ) ( not ( = ?auto_1094189 ?auto_1094193 ) ) ( not ( = ?auto_1094190 ?auto_1094191 ) ) ( not ( = ?auto_1094190 ?auto_1094192 ) ) ( not ( = ?auto_1094190 ?auto_1094193 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1094191 ?auto_1094192 ?auto_1094193 )
      ( MAKE-13CRATE-VERIFY ?auto_1094181 ?auto_1094182 ?auto_1094183 ?auto_1094180 ?auto_1094184 ?auto_1094186 ?auto_1094185 ?auto_1094187 ?auto_1094188 ?auto_1094189 ?auto_1094190 ?auto_1094191 ?auto_1094192 ?auto_1094193 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1094350 - SURFACE
      ?auto_1094351 - SURFACE
      ?auto_1094352 - SURFACE
      ?auto_1094349 - SURFACE
      ?auto_1094353 - SURFACE
      ?auto_1094355 - SURFACE
      ?auto_1094354 - SURFACE
      ?auto_1094356 - SURFACE
      ?auto_1094357 - SURFACE
      ?auto_1094358 - SURFACE
      ?auto_1094359 - SURFACE
      ?auto_1094360 - SURFACE
      ?auto_1094361 - SURFACE
      ?auto_1094362 - SURFACE
    )
    :vars
    (
      ?auto_1094366 - HOIST
      ?auto_1094365 - PLACE
      ?auto_1094367 - TRUCK
      ?auto_1094364 - PLACE
      ?auto_1094363 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1094366 ?auto_1094365 ) ( SURFACE-AT ?auto_1094361 ?auto_1094365 ) ( CLEAR ?auto_1094361 ) ( IS-CRATE ?auto_1094362 ) ( not ( = ?auto_1094361 ?auto_1094362 ) ) ( AVAILABLE ?auto_1094366 ) ( ON ?auto_1094361 ?auto_1094360 ) ( not ( = ?auto_1094360 ?auto_1094361 ) ) ( not ( = ?auto_1094360 ?auto_1094362 ) ) ( TRUCK-AT ?auto_1094367 ?auto_1094364 ) ( not ( = ?auto_1094364 ?auto_1094365 ) ) ( HOIST-AT ?auto_1094363 ?auto_1094364 ) ( LIFTING ?auto_1094363 ?auto_1094362 ) ( not ( = ?auto_1094366 ?auto_1094363 ) ) ( ON ?auto_1094351 ?auto_1094350 ) ( ON ?auto_1094352 ?auto_1094351 ) ( ON ?auto_1094349 ?auto_1094352 ) ( ON ?auto_1094353 ?auto_1094349 ) ( ON ?auto_1094355 ?auto_1094353 ) ( ON ?auto_1094354 ?auto_1094355 ) ( ON ?auto_1094356 ?auto_1094354 ) ( ON ?auto_1094357 ?auto_1094356 ) ( ON ?auto_1094358 ?auto_1094357 ) ( ON ?auto_1094359 ?auto_1094358 ) ( ON ?auto_1094360 ?auto_1094359 ) ( not ( = ?auto_1094350 ?auto_1094351 ) ) ( not ( = ?auto_1094350 ?auto_1094352 ) ) ( not ( = ?auto_1094350 ?auto_1094349 ) ) ( not ( = ?auto_1094350 ?auto_1094353 ) ) ( not ( = ?auto_1094350 ?auto_1094355 ) ) ( not ( = ?auto_1094350 ?auto_1094354 ) ) ( not ( = ?auto_1094350 ?auto_1094356 ) ) ( not ( = ?auto_1094350 ?auto_1094357 ) ) ( not ( = ?auto_1094350 ?auto_1094358 ) ) ( not ( = ?auto_1094350 ?auto_1094359 ) ) ( not ( = ?auto_1094350 ?auto_1094360 ) ) ( not ( = ?auto_1094350 ?auto_1094361 ) ) ( not ( = ?auto_1094350 ?auto_1094362 ) ) ( not ( = ?auto_1094351 ?auto_1094352 ) ) ( not ( = ?auto_1094351 ?auto_1094349 ) ) ( not ( = ?auto_1094351 ?auto_1094353 ) ) ( not ( = ?auto_1094351 ?auto_1094355 ) ) ( not ( = ?auto_1094351 ?auto_1094354 ) ) ( not ( = ?auto_1094351 ?auto_1094356 ) ) ( not ( = ?auto_1094351 ?auto_1094357 ) ) ( not ( = ?auto_1094351 ?auto_1094358 ) ) ( not ( = ?auto_1094351 ?auto_1094359 ) ) ( not ( = ?auto_1094351 ?auto_1094360 ) ) ( not ( = ?auto_1094351 ?auto_1094361 ) ) ( not ( = ?auto_1094351 ?auto_1094362 ) ) ( not ( = ?auto_1094352 ?auto_1094349 ) ) ( not ( = ?auto_1094352 ?auto_1094353 ) ) ( not ( = ?auto_1094352 ?auto_1094355 ) ) ( not ( = ?auto_1094352 ?auto_1094354 ) ) ( not ( = ?auto_1094352 ?auto_1094356 ) ) ( not ( = ?auto_1094352 ?auto_1094357 ) ) ( not ( = ?auto_1094352 ?auto_1094358 ) ) ( not ( = ?auto_1094352 ?auto_1094359 ) ) ( not ( = ?auto_1094352 ?auto_1094360 ) ) ( not ( = ?auto_1094352 ?auto_1094361 ) ) ( not ( = ?auto_1094352 ?auto_1094362 ) ) ( not ( = ?auto_1094349 ?auto_1094353 ) ) ( not ( = ?auto_1094349 ?auto_1094355 ) ) ( not ( = ?auto_1094349 ?auto_1094354 ) ) ( not ( = ?auto_1094349 ?auto_1094356 ) ) ( not ( = ?auto_1094349 ?auto_1094357 ) ) ( not ( = ?auto_1094349 ?auto_1094358 ) ) ( not ( = ?auto_1094349 ?auto_1094359 ) ) ( not ( = ?auto_1094349 ?auto_1094360 ) ) ( not ( = ?auto_1094349 ?auto_1094361 ) ) ( not ( = ?auto_1094349 ?auto_1094362 ) ) ( not ( = ?auto_1094353 ?auto_1094355 ) ) ( not ( = ?auto_1094353 ?auto_1094354 ) ) ( not ( = ?auto_1094353 ?auto_1094356 ) ) ( not ( = ?auto_1094353 ?auto_1094357 ) ) ( not ( = ?auto_1094353 ?auto_1094358 ) ) ( not ( = ?auto_1094353 ?auto_1094359 ) ) ( not ( = ?auto_1094353 ?auto_1094360 ) ) ( not ( = ?auto_1094353 ?auto_1094361 ) ) ( not ( = ?auto_1094353 ?auto_1094362 ) ) ( not ( = ?auto_1094355 ?auto_1094354 ) ) ( not ( = ?auto_1094355 ?auto_1094356 ) ) ( not ( = ?auto_1094355 ?auto_1094357 ) ) ( not ( = ?auto_1094355 ?auto_1094358 ) ) ( not ( = ?auto_1094355 ?auto_1094359 ) ) ( not ( = ?auto_1094355 ?auto_1094360 ) ) ( not ( = ?auto_1094355 ?auto_1094361 ) ) ( not ( = ?auto_1094355 ?auto_1094362 ) ) ( not ( = ?auto_1094354 ?auto_1094356 ) ) ( not ( = ?auto_1094354 ?auto_1094357 ) ) ( not ( = ?auto_1094354 ?auto_1094358 ) ) ( not ( = ?auto_1094354 ?auto_1094359 ) ) ( not ( = ?auto_1094354 ?auto_1094360 ) ) ( not ( = ?auto_1094354 ?auto_1094361 ) ) ( not ( = ?auto_1094354 ?auto_1094362 ) ) ( not ( = ?auto_1094356 ?auto_1094357 ) ) ( not ( = ?auto_1094356 ?auto_1094358 ) ) ( not ( = ?auto_1094356 ?auto_1094359 ) ) ( not ( = ?auto_1094356 ?auto_1094360 ) ) ( not ( = ?auto_1094356 ?auto_1094361 ) ) ( not ( = ?auto_1094356 ?auto_1094362 ) ) ( not ( = ?auto_1094357 ?auto_1094358 ) ) ( not ( = ?auto_1094357 ?auto_1094359 ) ) ( not ( = ?auto_1094357 ?auto_1094360 ) ) ( not ( = ?auto_1094357 ?auto_1094361 ) ) ( not ( = ?auto_1094357 ?auto_1094362 ) ) ( not ( = ?auto_1094358 ?auto_1094359 ) ) ( not ( = ?auto_1094358 ?auto_1094360 ) ) ( not ( = ?auto_1094358 ?auto_1094361 ) ) ( not ( = ?auto_1094358 ?auto_1094362 ) ) ( not ( = ?auto_1094359 ?auto_1094360 ) ) ( not ( = ?auto_1094359 ?auto_1094361 ) ) ( not ( = ?auto_1094359 ?auto_1094362 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1094360 ?auto_1094361 ?auto_1094362 )
      ( MAKE-13CRATE-VERIFY ?auto_1094350 ?auto_1094351 ?auto_1094352 ?auto_1094349 ?auto_1094353 ?auto_1094355 ?auto_1094354 ?auto_1094356 ?auto_1094357 ?auto_1094358 ?auto_1094359 ?auto_1094360 ?auto_1094361 ?auto_1094362 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1094532 - SURFACE
      ?auto_1094533 - SURFACE
      ?auto_1094534 - SURFACE
      ?auto_1094531 - SURFACE
      ?auto_1094535 - SURFACE
      ?auto_1094537 - SURFACE
      ?auto_1094536 - SURFACE
      ?auto_1094538 - SURFACE
      ?auto_1094539 - SURFACE
      ?auto_1094540 - SURFACE
      ?auto_1094541 - SURFACE
      ?auto_1094542 - SURFACE
      ?auto_1094543 - SURFACE
      ?auto_1094544 - SURFACE
    )
    :vars
    (
      ?auto_1094548 - HOIST
      ?auto_1094547 - PLACE
      ?auto_1094550 - TRUCK
      ?auto_1094549 - PLACE
      ?auto_1094545 - HOIST
      ?auto_1094546 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1094548 ?auto_1094547 ) ( SURFACE-AT ?auto_1094543 ?auto_1094547 ) ( CLEAR ?auto_1094543 ) ( IS-CRATE ?auto_1094544 ) ( not ( = ?auto_1094543 ?auto_1094544 ) ) ( AVAILABLE ?auto_1094548 ) ( ON ?auto_1094543 ?auto_1094542 ) ( not ( = ?auto_1094542 ?auto_1094543 ) ) ( not ( = ?auto_1094542 ?auto_1094544 ) ) ( TRUCK-AT ?auto_1094550 ?auto_1094549 ) ( not ( = ?auto_1094549 ?auto_1094547 ) ) ( HOIST-AT ?auto_1094545 ?auto_1094549 ) ( not ( = ?auto_1094548 ?auto_1094545 ) ) ( AVAILABLE ?auto_1094545 ) ( SURFACE-AT ?auto_1094544 ?auto_1094549 ) ( ON ?auto_1094544 ?auto_1094546 ) ( CLEAR ?auto_1094544 ) ( not ( = ?auto_1094543 ?auto_1094546 ) ) ( not ( = ?auto_1094544 ?auto_1094546 ) ) ( not ( = ?auto_1094542 ?auto_1094546 ) ) ( ON ?auto_1094533 ?auto_1094532 ) ( ON ?auto_1094534 ?auto_1094533 ) ( ON ?auto_1094531 ?auto_1094534 ) ( ON ?auto_1094535 ?auto_1094531 ) ( ON ?auto_1094537 ?auto_1094535 ) ( ON ?auto_1094536 ?auto_1094537 ) ( ON ?auto_1094538 ?auto_1094536 ) ( ON ?auto_1094539 ?auto_1094538 ) ( ON ?auto_1094540 ?auto_1094539 ) ( ON ?auto_1094541 ?auto_1094540 ) ( ON ?auto_1094542 ?auto_1094541 ) ( not ( = ?auto_1094532 ?auto_1094533 ) ) ( not ( = ?auto_1094532 ?auto_1094534 ) ) ( not ( = ?auto_1094532 ?auto_1094531 ) ) ( not ( = ?auto_1094532 ?auto_1094535 ) ) ( not ( = ?auto_1094532 ?auto_1094537 ) ) ( not ( = ?auto_1094532 ?auto_1094536 ) ) ( not ( = ?auto_1094532 ?auto_1094538 ) ) ( not ( = ?auto_1094532 ?auto_1094539 ) ) ( not ( = ?auto_1094532 ?auto_1094540 ) ) ( not ( = ?auto_1094532 ?auto_1094541 ) ) ( not ( = ?auto_1094532 ?auto_1094542 ) ) ( not ( = ?auto_1094532 ?auto_1094543 ) ) ( not ( = ?auto_1094532 ?auto_1094544 ) ) ( not ( = ?auto_1094532 ?auto_1094546 ) ) ( not ( = ?auto_1094533 ?auto_1094534 ) ) ( not ( = ?auto_1094533 ?auto_1094531 ) ) ( not ( = ?auto_1094533 ?auto_1094535 ) ) ( not ( = ?auto_1094533 ?auto_1094537 ) ) ( not ( = ?auto_1094533 ?auto_1094536 ) ) ( not ( = ?auto_1094533 ?auto_1094538 ) ) ( not ( = ?auto_1094533 ?auto_1094539 ) ) ( not ( = ?auto_1094533 ?auto_1094540 ) ) ( not ( = ?auto_1094533 ?auto_1094541 ) ) ( not ( = ?auto_1094533 ?auto_1094542 ) ) ( not ( = ?auto_1094533 ?auto_1094543 ) ) ( not ( = ?auto_1094533 ?auto_1094544 ) ) ( not ( = ?auto_1094533 ?auto_1094546 ) ) ( not ( = ?auto_1094534 ?auto_1094531 ) ) ( not ( = ?auto_1094534 ?auto_1094535 ) ) ( not ( = ?auto_1094534 ?auto_1094537 ) ) ( not ( = ?auto_1094534 ?auto_1094536 ) ) ( not ( = ?auto_1094534 ?auto_1094538 ) ) ( not ( = ?auto_1094534 ?auto_1094539 ) ) ( not ( = ?auto_1094534 ?auto_1094540 ) ) ( not ( = ?auto_1094534 ?auto_1094541 ) ) ( not ( = ?auto_1094534 ?auto_1094542 ) ) ( not ( = ?auto_1094534 ?auto_1094543 ) ) ( not ( = ?auto_1094534 ?auto_1094544 ) ) ( not ( = ?auto_1094534 ?auto_1094546 ) ) ( not ( = ?auto_1094531 ?auto_1094535 ) ) ( not ( = ?auto_1094531 ?auto_1094537 ) ) ( not ( = ?auto_1094531 ?auto_1094536 ) ) ( not ( = ?auto_1094531 ?auto_1094538 ) ) ( not ( = ?auto_1094531 ?auto_1094539 ) ) ( not ( = ?auto_1094531 ?auto_1094540 ) ) ( not ( = ?auto_1094531 ?auto_1094541 ) ) ( not ( = ?auto_1094531 ?auto_1094542 ) ) ( not ( = ?auto_1094531 ?auto_1094543 ) ) ( not ( = ?auto_1094531 ?auto_1094544 ) ) ( not ( = ?auto_1094531 ?auto_1094546 ) ) ( not ( = ?auto_1094535 ?auto_1094537 ) ) ( not ( = ?auto_1094535 ?auto_1094536 ) ) ( not ( = ?auto_1094535 ?auto_1094538 ) ) ( not ( = ?auto_1094535 ?auto_1094539 ) ) ( not ( = ?auto_1094535 ?auto_1094540 ) ) ( not ( = ?auto_1094535 ?auto_1094541 ) ) ( not ( = ?auto_1094535 ?auto_1094542 ) ) ( not ( = ?auto_1094535 ?auto_1094543 ) ) ( not ( = ?auto_1094535 ?auto_1094544 ) ) ( not ( = ?auto_1094535 ?auto_1094546 ) ) ( not ( = ?auto_1094537 ?auto_1094536 ) ) ( not ( = ?auto_1094537 ?auto_1094538 ) ) ( not ( = ?auto_1094537 ?auto_1094539 ) ) ( not ( = ?auto_1094537 ?auto_1094540 ) ) ( not ( = ?auto_1094537 ?auto_1094541 ) ) ( not ( = ?auto_1094537 ?auto_1094542 ) ) ( not ( = ?auto_1094537 ?auto_1094543 ) ) ( not ( = ?auto_1094537 ?auto_1094544 ) ) ( not ( = ?auto_1094537 ?auto_1094546 ) ) ( not ( = ?auto_1094536 ?auto_1094538 ) ) ( not ( = ?auto_1094536 ?auto_1094539 ) ) ( not ( = ?auto_1094536 ?auto_1094540 ) ) ( not ( = ?auto_1094536 ?auto_1094541 ) ) ( not ( = ?auto_1094536 ?auto_1094542 ) ) ( not ( = ?auto_1094536 ?auto_1094543 ) ) ( not ( = ?auto_1094536 ?auto_1094544 ) ) ( not ( = ?auto_1094536 ?auto_1094546 ) ) ( not ( = ?auto_1094538 ?auto_1094539 ) ) ( not ( = ?auto_1094538 ?auto_1094540 ) ) ( not ( = ?auto_1094538 ?auto_1094541 ) ) ( not ( = ?auto_1094538 ?auto_1094542 ) ) ( not ( = ?auto_1094538 ?auto_1094543 ) ) ( not ( = ?auto_1094538 ?auto_1094544 ) ) ( not ( = ?auto_1094538 ?auto_1094546 ) ) ( not ( = ?auto_1094539 ?auto_1094540 ) ) ( not ( = ?auto_1094539 ?auto_1094541 ) ) ( not ( = ?auto_1094539 ?auto_1094542 ) ) ( not ( = ?auto_1094539 ?auto_1094543 ) ) ( not ( = ?auto_1094539 ?auto_1094544 ) ) ( not ( = ?auto_1094539 ?auto_1094546 ) ) ( not ( = ?auto_1094540 ?auto_1094541 ) ) ( not ( = ?auto_1094540 ?auto_1094542 ) ) ( not ( = ?auto_1094540 ?auto_1094543 ) ) ( not ( = ?auto_1094540 ?auto_1094544 ) ) ( not ( = ?auto_1094540 ?auto_1094546 ) ) ( not ( = ?auto_1094541 ?auto_1094542 ) ) ( not ( = ?auto_1094541 ?auto_1094543 ) ) ( not ( = ?auto_1094541 ?auto_1094544 ) ) ( not ( = ?auto_1094541 ?auto_1094546 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1094542 ?auto_1094543 ?auto_1094544 )
      ( MAKE-13CRATE-VERIFY ?auto_1094532 ?auto_1094533 ?auto_1094534 ?auto_1094531 ?auto_1094535 ?auto_1094537 ?auto_1094536 ?auto_1094538 ?auto_1094539 ?auto_1094540 ?auto_1094541 ?auto_1094542 ?auto_1094543 ?auto_1094544 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1094715 - SURFACE
      ?auto_1094716 - SURFACE
      ?auto_1094717 - SURFACE
      ?auto_1094714 - SURFACE
      ?auto_1094718 - SURFACE
      ?auto_1094720 - SURFACE
      ?auto_1094719 - SURFACE
      ?auto_1094721 - SURFACE
      ?auto_1094722 - SURFACE
      ?auto_1094723 - SURFACE
      ?auto_1094724 - SURFACE
      ?auto_1094725 - SURFACE
      ?auto_1094726 - SURFACE
      ?auto_1094727 - SURFACE
    )
    :vars
    (
      ?auto_1094731 - HOIST
      ?auto_1094730 - PLACE
      ?auto_1094732 - PLACE
      ?auto_1094729 - HOIST
      ?auto_1094733 - SURFACE
      ?auto_1094728 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1094731 ?auto_1094730 ) ( SURFACE-AT ?auto_1094726 ?auto_1094730 ) ( CLEAR ?auto_1094726 ) ( IS-CRATE ?auto_1094727 ) ( not ( = ?auto_1094726 ?auto_1094727 ) ) ( AVAILABLE ?auto_1094731 ) ( ON ?auto_1094726 ?auto_1094725 ) ( not ( = ?auto_1094725 ?auto_1094726 ) ) ( not ( = ?auto_1094725 ?auto_1094727 ) ) ( not ( = ?auto_1094732 ?auto_1094730 ) ) ( HOIST-AT ?auto_1094729 ?auto_1094732 ) ( not ( = ?auto_1094731 ?auto_1094729 ) ) ( AVAILABLE ?auto_1094729 ) ( SURFACE-AT ?auto_1094727 ?auto_1094732 ) ( ON ?auto_1094727 ?auto_1094733 ) ( CLEAR ?auto_1094727 ) ( not ( = ?auto_1094726 ?auto_1094733 ) ) ( not ( = ?auto_1094727 ?auto_1094733 ) ) ( not ( = ?auto_1094725 ?auto_1094733 ) ) ( TRUCK-AT ?auto_1094728 ?auto_1094730 ) ( ON ?auto_1094716 ?auto_1094715 ) ( ON ?auto_1094717 ?auto_1094716 ) ( ON ?auto_1094714 ?auto_1094717 ) ( ON ?auto_1094718 ?auto_1094714 ) ( ON ?auto_1094720 ?auto_1094718 ) ( ON ?auto_1094719 ?auto_1094720 ) ( ON ?auto_1094721 ?auto_1094719 ) ( ON ?auto_1094722 ?auto_1094721 ) ( ON ?auto_1094723 ?auto_1094722 ) ( ON ?auto_1094724 ?auto_1094723 ) ( ON ?auto_1094725 ?auto_1094724 ) ( not ( = ?auto_1094715 ?auto_1094716 ) ) ( not ( = ?auto_1094715 ?auto_1094717 ) ) ( not ( = ?auto_1094715 ?auto_1094714 ) ) ( not ( = ?auto_1094715 ?auto_1094718 ) ) ( not ( = ?auto_1094715 ?auto_1094720 ) ) ( not ( = ?auto_1094715 ?auto_1094719 ) ) ( not ( = ?auto_1094715 ?auto_1094721 ) ) ( not ( = ?auto_1094715 ?auto_1094722 ) ) ( not ( = ?auto_1094715 ?auto_1094723 ) ) ( not ( = ?auto_1094715 ?auto_1094724 ) ) ( not ( = ?auto_1094715 ?auto_1094725 ) ) ( not ( = ?auto_1094715 ?auto_1094726 ) ) ( not ( = ?auto_1094715 ?auto_1094727 ) ) ( not ( = ?auto_1094715 ?auto_1094733 ) ) ( not ( = ?auto_1094716 ?auto_1094717 ) ) ( not ( = ?auto_1094716 ?auto_1094714 ) ) ( not ( = ?auto_1094716 ?auto_1094718 ) ) ( not ( = ?auto_1094716 ?auto_1094720 ) ) ( not ( = ?auto_1094716 ?auto_1094719 ) ) ( not ( = ?auto_1094716 ?auto_1094721 ) ) ( not ( = ?auto_1094716 ?auto_1094722 ) ) ( not ( = ?auto_1094716 ?auto_1094723 ) ) ( not ( = ?auto_1094716 ?auto_1094724 ) ) ( not ( = ?auto_1094716 ?auto_1094725 ) ) ( not ( = ?auto_1094716 ?auto_1094726 ) ) ( not ( = ?auto_1094716 ?auto_1094727 ) ) ( not ( = ?auto_1094716 ?auto_1094733 ) ) ( not ( = ?auto_1094717 ?auto_1094714 ) ) ( not ( = ?auto_1094717 ?auto_1094718 ) ) ( not ( = ?auto_1094717 ?auto_1094720 ) ) ( not ( = ?auto_1094717 ?auto_1094719 ) ) ( not ( = ?auto_1094717 ?auto_1094721 ) ) ( not ( = ?auto_1094717 ?auto_1094722 ) ) ( not ( = ?auto_1094717 ?auto_1094723 ) ) ( not ( = ?auto_1094717 ?auto_1094724 ) ) ( not ( = ?auto_1094717 ?auto_1094725 ) ) ( not ( = ?auto_1094717 ?auto_1094726 ) ) ( not ( = ?auto_1094717 ?auto_1094727 ) ) ( not ( = ?auto_1094717 ?auto_1094733 ) ) ( not ( = ?auto_1094714 ?auto_1094718 ) ) ( not ( = ?auto_1094714 ?auto_1094720 ) ) ( not ( = ?auto_1094714 ?auto_1094719 ) ) ( not ( = ?auto_1094714 ?auto_1094721 ) ) ( not ( = ?auto_1094714 ?auto_1094722 ) ) ( not ( = ?auto_1094714 ?auto_1094723 ) ) ( not ( = ?auto_1094714 ?auto_1094724 ) ) ( not ( = ?auto_1094714 ?auto_1094725 ) ) ( not ( = ?auto_1094714 ?auto_1094726 ) ) ( not ( = ?auto_1094714 ?auto_1094727 ) ) ( not ( = ?auto_1094714 ?auto_1094733 ) ) ( not ( = ?auto_1094718 ?auto_1094720 ) ) ( not ( = ?auto_1094718 ?auto_1094719 ) ) ( not ( = ?auto_1094718 ?auto_1094721 ) ) ( not ( = ?auto_1094718 ?auto_1094722 ) ) ( not ( = ?auto_1094718 ?auto_1094723 ) ) ( not ( = ?auto_1094718 ?auto_1094724 ) ) ( not ( = ?auto_1094718 ?auto_1094725 ) ) ( not ( = ?auto_1094718 ?auto_1094726 ) ) ( not ( = ?auto_1094718 ?auto_1094727 ) ) ( not ( = ?auto_1094718 ?auto_1094733 ) ) ( not ( = ?auto_1094720 ?auto_1094719 ) ) ( not ( = ?auto_1094720 ?auto_1094721 ) ) ( not ( = ?auto_1094720 ?auto_1094722 ) ) ( not ( = ?auto_1094720 ?auto_1094723 ) ) ( not ( = ?auto_1094720 ?auto_1094724 ) ) ( not ( = ?auto_1094720 ?auto_1094725 ) ) ( not ( = ?auto_1094720 ?auto_1094726 ) ) ( not ( = ?auto_1094720 ?auto_1094727 ) ) ( not ( = ?auto_1094720 ?auto_1094733 ) ) ( not ( = ?auto_1094719 ?auto_1094721 ) ) ( not ( = ?auto_1094719 ?auto_1094722 ) ) ( not ( = ?auto_1094719 ?auto_1094723 ) ) ( not ( = ?auto_1094719 ?auto_1094724 ) ) ( not ( = ?auto_1094719 ?auto_1094725 ) ) ( not ( = ?auto_1094719 ?auto_1094726 ) ) ( not ( = ?auto_1094719 ?auto_1094727 ) ) ( not ( = ?auto_1094719 ?auto_1094733 ) ) ( not ( = ?auto_1094721 ?auto_1094722 ) ) ( not ( = ?auto_1094721 ?auto_1094723 ) ) ( not ( = ?auto_1094721 ?auto_1094724 ) ) ( not ( = ?auto_1094721 ?auto_1094725 ) ) ( not ( = ?auto_1094721 ?auto_1094726 ) ) ( not ( = ?auto_1094721 ?auto_1094727 ) ) ( not ( = ?auto_1094721 ?auto_1094733 ) ) ( not ( = ?auto_1094722 ?auto_1094723 ) ) ( not ( = ?auto_1094722 ?auto_1094724 ) ) ( not ( = ?auto_1094722 ?auto_1094725 ) ) ( not ( = ?auto_1094722 ?auto_1094726 ) ) ( not ( = ?auto_1094722 ?auto_1094727 ) ) ( not ( = ?auto_1094722 ?auto_1094733 ) ) ( not ( = ?auto_1094723 ?auto_1094724 ) ) ( not ( = ?auto_1094723 ?auto_1094725 ) ) ( not ( = ?auto_1094723 ?auto_1094726 ) ) ( not ( = ?auto_1094723 ?auto_1094727 ) ) ( not ( = ?auto_1094723 ?auto_1094733 ) ) ( not ( = ?auto_1094724 ?auto_1094725 ) ) ( not ( = ?auto_1094724 ?auto_1094726 ) ) ( not ( = ?auto_1094724 ?auto_1094727 ) ) ( not ( = ?auto_1094724 ?auto_1094733 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1094725 ?auto_1094726 ?auto_1094727 )
      ( MAKE-13CRATE-VERIFY ?auto_1094715 ?auto_1094716 ?auto_1094717 ?auto_1094714 ?auto_1094718 ?auto_1094720 ?auto_1094719 ?auto_1094721 ?auto_1094722 ?auto_1094723 ?auto_1094724 ?auto_1094725 ?auto_1094726 ?auto_1094727 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1094898 - SURFACE
      ?auto_1094899 - SURFACE
      ?auto_1094900 - SURFACE
      ?auto_1094897 - SURFACE
      ?auto_1094901 - SURFACE
      ?auto_1094903 - SURFACE
      ?auto_1094902 - SURFACE
      ?auto_1094904 - SURFACE
      ?auto_1094905 - SURFACE
      ?auto_1094906 - SURFACE
      ?auto_1094907 - SURFACE
      ?auto_1094908 - SURFACE
      ?auto_1094909 - SURFACE
      ?auto_1094910 - SURFACE
    )
    :vars
    (
      ?auto_1094916 - HOIST
      ?auto_1094915 - PLACE
      ?auto_1094912 - PLACE
      ?auto_1094911 - HOIST
      ?auto_1094914 - SURFACE
      ?auto_1094913 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1094916 ?auto_1094915 ) ( IS-CRATE ?auto_1094910 ) ( not ( = ?auto_1094909 ?auto_1094910 ) ) ( not ( = ?auto_1094908 ?auto_1094909 ) ) ( not ( = ?auto_1094908 ?auto_1094910 ) ) ( not ( = ?auto_1094912 ?auto_1094915 ) ) ( HOIST-AT ?auto_1094911 ?auto_1094912 ) ( not ( = ?auto_1094916 ?auto_1094911 ) ) ( AVAILABLE ?auto_1094911 ) ( SURFACE-AT ?auto_1094910 ?auto_1094912 ) ( ON ?auto_1094910 ?auto_1094914 ) ( CLEAR ?auto_1094910 ) ( not ( = ?auto_1094909 ?auto_1094914 ) ) ( not ( = ?auto_1094910 ?auto_1094914 ) ) ( not ( = ?auto_1094908 ?auto_1094914 ) ) ( TRUCK-AT ?auto_1094913 ?auto_1094915 ) ( SURFACE-AT ?auto_1094908 ?auto_1094915 ) ( CLEAR ?auto_1094908 ) ( LIFTING ?auto_1094916 ?auto_1094909 ) ( IS-CRATE ?auto_1094909 ) ( ON ?auto_1094899 ?auto_1094898 ) ( ON ?auto_1094900 ?auto_1094899 ) ( ON ?auto_1094897 ?auto_1094900 ) ( ON ?auto_1094901 ?auto_1094897 ) ( ON ?auto_1094903 ?auto_1094901 ) ( ON ?auto_1094902 ?auto_1094903 ) ( ON ?auto_1094904 ?auto_1094902 ) ( ON ?auto_1094905 ?auto_1094904 ) ( ON ?auto_1094906 ?auto_1094905 ) ( ON ?auto_1094907 ?auto_1094906 ) ( ON ?auto_1094908 ?auto_1094907 ) ( not ( = ?auto_1094898 ?auto_1094899 ) ) ( not ( = ?auto_1094898 ?auto_1094900 ) ) ( not ( = ?auto_1094898 ?auto_1094897 ) ) ( not ( = ?auto_1094898 ?auto_1094901 ) ) ( not ( = ?auto_1094898 ?auto_1094903 ) ) ( not ( = ?auto_1094898 ?auto_1094902 ) ) ( not ( = ?auto_1094898 ?auto_1094904 ) ) ( not ( = ?auto_1094898 ?auto_1094905 ) ) ( not ( = ?auto_1094898 ?auto_1094906 ) ) ( not ( = ?auto_1094898 ?auto_1094907 ) ) ( not ( = ?auto_1094898 ?auto_1094908 ) ) ( not ( = ?auto_1094898 ?auto_1094909 ) ) ( not ( = ?auto_1094898 ?auto_1094910 ) ) ( not ( = ?auto_1094898 ?auto_1094914 ) ) ( not ( = ?auto_1094899 ?auto_1094900 ) ) ( not ( = ?auto_1094899 ?auto_1094897 ) ) ( not ( = ?auto_1094899 ?auto_1094901 ) ) ( not ( = ?auto_1094899 ?auto_1094903 ) ) ( not ( = ?auto_1094899 ?auto_1094902 ) ) ( not ( = ?auto_1094899 ?auto_1094904 ) ) ( not ( = ?auto_1094899 ?auto_1094905 ) ) ( not ( = ?auto_1094899 ?auto_1094906 ) ) ( not ( = ?auto_1094899 ?auto_1094907 ) ) ( not ( = ?auto_1094899 ?auto_1094908 ) ) ( not ( = ?auto_1094899 ?auto_1094909 ) ) ( not ( = ?auto_1094899 ?auto_1094910 ) ) ( not ( = ?auto_1094899 ?auto_1094914 ) ) ( not ( = ?auto_1094900 ?auto_1094897 ) ) ( not ( = ?auto_1094900 ?auto_1094901 ) ) ( not ( = ?auto_1094900 ?auto_1094903 ) ) ( not ( = ?auto_1094900 ?auto_1094902 ) ) ( not ( = ?auto_1094900 ?auto_1094904 ) ) ( not ( = ?auto_1094900 ?auto_1094905 ) ) ( not ( = ?auto_1094900 ?auto_1094906 ) ) ( not ( = ?auto_1094900 ?auto_1094907 ) ) ( not ( = ?auto_1094900 ?auto_1094908 ) ) ( not ( = ?auto_1094900 ?auto_1094909 ) ) ( not ( = ?auto_1094900 ?auto_1094910 ) ) ( not ( = ?auto_1094900 ?auto_1094914 ) ) ( not ( = ?auto_1094897 ?auto_1094901 ) ) ( not ( = ?auto_1094897 ?auto_1094903 ) ) ( not ( = ?auto_1094897 ?auto_1094902 ) ) ( not ( = ?auto_1094897 ?auto_1094904 ) ) ( not ( = ?auto_1094897 ?auto_1094905 ) ) ( not ( = ?auto_1094897 ?auto_1094906 ) ) ( not ( = ?auto_1094897 ?auto_1094907 ) ) ( not ( = ?auto_1094897 ?auto_1094908 ) ) ( not ( = ?auto_1094897 ?auto_1094909 ) ) ( not ( = ?auto_1094897 ?auto_1094910 ) ) ( not ( = ?auto_1094897 ?auto_1094914 ) ) ( not ( = ?auto_1094901 ?auto_1094903 ) ) ( not ( = ?auto_1094901 ?auto_1094902 ) ) ( not ( = ?auto_1094901 ?auto_1094904 ) ) ( not ( = ?auto_1094901 ?auto_1094905 ) ) ( not ( = ?auto_1094901 ?auto_1094906 ) ) ( not ( = ?auto_1094901 ?auto_1094907 ) ) ( not ( = ?auto_1094901 ?auto_1094908 ) ) ( not ( = ?auto_1094901 ?auto_1094909 ) ) ( not ( = ?auto_1094901 ?auto_1094910 ) ) ( not ( = ?auto_1094901 ?auto_1094914 ) ) ( not ( = ?auto_1094903 ?auto_1094902 ) ) ( not ( = ?auto_1094903 ?auto_1094904 ) ) ( not ( = ?auto_1094903 ?auto_1094905 ) ) ( not ( = ?auto_1094903 ?auto_1094906 ) ) ( not ( = ?auto_1094903 ?auto_1094907 ) ) ( not ( = ?auto_1094903 ?auto_1094908 ) ) ( not ( = ?auto_1094903 ?auto_1094909 ) ) ( not ( = ?auto_1094903 ?auto_1094910 ) ) ( not ( = ?auto_1094903 ?auto_1094914 ) ) ( not ( = ?auto_1094902 ?auto_1094904 ) ) ( not ( = ?auto_1094902 ?auto_1094905 ) ) ( not ( = ?auto_1094902 ?auto_1094906 ) ) ( not ( = ?auto_1094902 ?auto_1094907 ) ) ( not ( = ?auto_1094902 ?auto_1094908 ) ) ( not ( = ?auto_1094902 ?auto_1094909 ) ) ( not ( = ?auto_1094902 ?auto_1094910 ) ) ( not ( = ?auto_1094902 ?auto_1094914 ) ) ( not ( = ?auto_1094904 ?auto_1094905 ) ) ( not ( = ?auto_1094904 ?auto_1094906 ) ) ( not ( = ?auto_1094904 ?auto_1094907 ) ) ( not ( = ?auto_1094904 ?auto_1094908 ) ) ( not ( = ?auto_1094904 ?auto_1094909 ) ) ( not ( = ?auto_1094904 ?auto_1094910 ) ) ( not ( = ?auto_1094904 ?auto_1094914 ) ) ( not ( = ?auto_1094905 ?auto_1094906 ) ) ( not ( = ?auto_1094905 ?auto_1094907 ) ) ( not ( = ?auto_1094905 ?auto_1094908 ) ) ( not ( = ?auto_1094905 ?auto_1094909 ) ) ( not ( = ?auto_1094905 ?auto_1094910 ) ) ( not ( = ?auto_1094905 ?auto_1094914 ) ) ( not ( = ?auto_1094906 ?auto_1094907 ) ) ( not ( = ?auto_1094906 ?auto_1094908 ) ) ( not ( = ?auto_1094906 ?auto_1094909 ) ) ( not ( = ?auto_1094906 ?auto_1094910 ) ) ( not ( = ?auto_1094906 ?auto_1094914 ) ) ( not ( = ?auto_1094907 ?auto_1094908 ) ) ( not ( = ?auto_1094907 ?auto_1094909 ) ) ( not ( = ?auto_1094907 ?auto_1094910 ) ) ( not ( = ?auto_1094907 ?auto_1094914 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1094908 ?auto_1094909 ?auto_1094910 )
      ( MAKE-13CRATE-VERIFY ?auto_1094898 ?auto_1094899 ?auto_1094900 ?auto_1094897 ?auto_1094901 ?auto_1094903 ?auto_1094902 ?auto_1094904 ?auto_1094905 ?auto_1094906 ?auto_1094907 ?auto_1094908 ?auto_1094909 ?auto_1094910 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1095081 - SURFACE
      ?auto_1095082 - SURFACE
      ?auto_1095083 - SURFACE
      ?auto_1095080 - SURFACE
      ?auto_1095084 - SURFACE
      ?auto_1095086 - SURFACE
      ?auto_1095085 - SURFACE
      ?auto_1095087 - SURFACE
      ?auto_1095088 - SURFACE
      ?auto_1095089 - SURFACE
      ?auto_1095090 - SURFACE
      ?auto_1095091 - SURFACE
      ?auto_1095092 - SURFACE
      ?auto_1095093 - SURFACE
    )
    :vars
    (
      ?auto_1095095 - HOIST
      ?auto_1095099 - PLACE
      ?auto_1095094 - PLACE
      ?auto_1095096 - HOIST
      ?auto_1095098 - SURFACE
      ?auto_1095097 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1095095 ?auto_1095099 ) ( IS-CRATE ?auto_1095093 ) ( not ( = ?auto_1095092 ?auto_1095093 ) ) ( not ( = ?auto_1095091 ?auto_1095092 ) ) ( not ( = ?auto_1095091 ?auto_1095093 ) ) ( not ( = ?auto_1095094 ?auto_1095099 ) ) ( HOIST-AT ?auto_1095096 ?auto_1095094 ) ( not ( = ?auto_1095095 ?auto_1095096 ) ) ( AVAILABLE ?auto_1095096 ) ( SURFACE-AT ?auto_1095093 ?auto_1095094 ) ( ON ?auto_1095093 ?auto_1095098 ) ( CLEAR ?auto_1095093 ) ( not ( = ?auto_1095092 ?auto_1095098 ) ) ( not ( = ?auto_1095093 ?auto_1095098 ) ) ( not ( = ?auto_1095091 ?auto_1095098 ) ) ( TRUCK-AT ?auto_1095097 ?auto_1095099 ) ( SURFACE-AT ?auto_1095091 ?auto_1095099 ) ( CLEAR ?auto_1095091 ) ( IS-CRATE ?auto_1095092 ) ( AVAILABLE ?auto_1095095 ) ( IN ?auto_1095092 ?auto_1095097 ) ( ON ?auto_1095082 ?auto_1095081 ) ( ON ?auto_1095083 ?auto_1095082 ) ( ON ?auto_1095080 ?auto_1095083 ) ( ON ?auto_1095084 ?auto_1095080 ) ( ON ?auto_1095086 ?auto_1095084 ) ( ON ?auto_1095085 ?auto_1095086 ) ( ON ?auto_1095087 ?auto_1095085 ) ( ON ?auto_1095088 ?auto_1095087 ) ( ON ?auto_1095089 ?auto_1095088 ) ( ON ?auto_1095090 ?auto_1095089 ) ( ON ?auto_1095091 ?auto_1095090 ) ( not ( = ?auto_1095081 ?auto_1095082 ) ) ( not ( = ?auto_1095081 ?auto_1095083 ) ) ( not ( = ?auto_1095081 ?auto_1095080 ) ) ( not ( = ?auto_1095081 ?auto_1095084 ) ) ( not ( = ?auto_1095081 ?auto_1095086 ) ) ( not ( = ?auto_1095081 ?auto_1095085 ) ) ( not ( = ?auto_1095081 ?auto_1095087 ) ) ( not ( = ?auto_1095081 ?auto_1095088 ) ) ( not ( = ?auto_1095081 ?auto_1095089 ) ) ( not ( = ?auto_1095081 ?auto_1095090 ) ) ( not ( = ?auto_1095081 ?auto_1095091 ) ) ( not ( = ?auto_1095081 ?auto_1095092 ) ) ( not ( = ?auto_1095081 ?auto_1095093 ) ) ( not ( = ?auto_1095081 ?auto_1095098 ) ) ( not ( = ?auto_1095082 ?auto_1095083 ) ) ( not ( = ?auto_1095082 ?auto_1095080 ) ) ( not ( = ?auto_1095082 ?auto_1095084 ) ) ( not ( = ?auto_1095082 ?auto_1095086 ) ) ( not ( = ?auto_1095082 ?auto_1095085 ) ) ( not ( = ?auto_1095082 ?auto_1095087 ) ) ( not ( = ?auto_1095082 ?auto_1095088 ) ) ( not ( = ?auto_1095082 ?auto_1095089 ) ) ( not ( = ?auto_1095082 ?auto_1095090 ) ) ( not ( = ?auto_1095082 ?auto_1095091 ) ) ( not ( = ?auto_1095082 ?auto_1095092 ) ) ( not ( = ?auto_1095082 ?auto_1095093 ) ) ( not ( = ?auto_1095082 ?auto_1095098 ) ) ( not ( = ?auto_1095083 ?auto_1095080 ) ) ( not ( = ?auto_1095083 ?auto_1095084 ) ) ( not ( = ?auto_1095083 ?auto_1095086 ) ) ( not ( = ?auto_1095083 ?auto_1095085 ) ) ( not ( = ?auto_1095083 ?auto_1095087 ) ) ( not ( = ?auto_1095083 ?auto_1095088 ) ) ( not ( = ?auto_1095083 ?auto_1095089 ) ) ( not ( = ?auto_1095083 ?auto_1095090 ) ) ( not ( = ?auto_1095083 ?auto_1095091 ) ) ( not ( = ?auto_1095083 ?auto_1095092 ) ) ( not ( = ?auto_1095083 ?auto_1095093 ) ) ( not ( = ?auto_1095083 ?auto_1095098 ) ) ( not ( = ?auto_1095080 ?auto_1095084 ) ) ( not ( = ?auto_1095080 ?auto_1095086 ) ) ( not ( = ?auto_1095080 ?auto_1095085 ) ) ( not ( = ?auto_1095080 ?auto_1095087 ) ) ( not ( = ?auto_1095080 ?auto_1095088 ) ) ( not ( = ?auto_1095080 ?auto_1095089 ) ) ( not ( = ?auto_1095080 ?auto_1095090 ) ) ( not ( = ?auto_1095080 ?auto_1095091 ) ) ( not ( = ?auto_1095080 ?auto_1095092 ) ) ( not ( = ?auto_1095080 ?auto_1095093 ) ) ( not ( = ?auto_1095080 ?auto_1095098 ) ) ( not ( = ?auto_1095084 ?auto_1095086 ) ) ( not ( = ?auto_1095084 ?auto_1095085 ) ) ( not ( = ?auto_1095084 ?auto_1095087 ) ) ( not ( = ?auto_1095084 ?auto_1095088 ) ) ( not ( = ?auto_1095084 ?auto_1095089 ) ) ( not ( = ?auto_1095084 ?auto_1095090 ) ) ( not ( = ?auto_1095084 ?auto_1095091 ) ) ( not ( = ?auto_1095084 ?auto_1095092 ) ) ( not ( = ?auto_1095084 ?auto_1095093 ) ) ( not ( = ?auto_1095084 ?auto_1095098 ) ) ( not ( = ?auto_1095086 ?auto_1095085 ) ) ( not ( = ?auto_1095086 ?auto_1095087 ) ) ( not ( = ?auto_1095086 ?auto_1095088 ) ) ( not ( = ?auto_1095086 ?auto_1095089 ) ) ( not ( = ?auto_1095086 ?auto_1095090 ) ) ( not ( = ?auto_1095086 ?auto_1095091 ) ) ( not ( = ?auto_1095086 ?auto_1095092 ) ) ( not ( = ?auto_1095086 ?auto_1095093 ) ) ( not ( = ?auto_1095086 ?auto_1095098 ) ) ( not ( = ?auto_1095085 ?auto_1095087 ) ) ( not ( = ?auto_1095085 ?auto_1095088 ) ) ( not ( = ?auto_1095085 ?auto_1095089 ) ) ( not ( = ?auto_1095085 ?auto_1095090 ) ) ( not ( = ?auto_1095085 ?auto_1095091 ) ) ( not ( = ?auto_1095085 ?auto_1095092 ) ) ( not ( = ?auto_1095085 ?auto_1095093 ) ) ( not ( = ?auto_1095085 ?auto_1095098 ) ) ( not ( = ?auto_1095087 ?auto_1095088 ) ) ( not ( = ?auto_1095087 ?auto_1095089 ) ) ( not ( = ?auto_1095087 ?auto_1095090 ) ) ( not ( = ?auto_1095087 ?auto_1095091 ) ) ( not ( = ?auto_1095087 ?auto_1095092 ) ) ( not ( = ?auto_1095087 ?auto_1095093 ) ) ( not ( = ?auto_1095087 ?auto_1095098 ) ) ( not ( = ?auto_1095088 ?auto_1095089 ) ) ( not ( = ?auto_1095088 ?auto_1095090 ) ) ( not ( = ?auto_1095088 ?auto_1095091 ) ) ( not ( = ?auto_1095088 ?auto_1095092 ) ) ( not ( = ?auto_1095088 ?auto_1095093 ) ) ( not ( = ?auto_1095088 ?auto_1095098 ) ) ( not ( = ?auto_1095089 ?auto_1095090 ) ) ( not ( = ?auto_1095089 ?auto_1095091 ) ) ( not ( = ?auto_1095089 ?auto_1095092 ) ) ( not ( = ?auto_1095089 ?auto_1095093 ) ) ( not ( = ?auto_1095089 ?auto_1095098 ) ) ( not ( = ?auto_1095090 ?auto_1095091 ) ) ( not ( = ?auto_1095090 ?auto_1095092 ) ) ( not ( = ?auto_1095090 ?auto_1095093 ) ) ( not ( = ?auto_1095090 ?auto_1095098 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1095091 ?auto_1095092 ?auto_1095093 )
      ( MAKE-13CRATE-VERIFY ?auto_1095081 ?auto_1095082 ?auto_1095083 ?auto_1095080 ?auto_1095084 ?auto_1095086 ?auto_1095085 ?auto_1095087 ?auto_1095088 ?auto_1095089 ?auto_1095090 ?auto_1095091 ?auto_1095092 ?auto_1095093 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1095210 - SURFACE
      ?auto_1095211 - SURFACE
      ?auto_1095212 - SURFACE
      ?auto_1095209 - SURFACE
      ?auto_1095213 - SURFACE
      ?auto_1095215 - SURFACE
      ?auto_1095214 - SURFACE
      ?auto_1095216 - SURFACE
      ?auto_1095217 - SURFACE
      ?auto_1095218 - SURFACE
      ?auto_1095219 - SURFACE
    )
    :vars
    (
      ?auto_1095224 - HOIST
      ?auto_1095225 - PLACE
      ?auto_1095222 - PLACE
      ?auto_1095223 - HOIST
      ?auto_1095220 - SURFACE
      ?auto_1095221 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1095224 ?auto_1095225 ) ( IS-CRATE ?auto_1095219 ) ( not ( = ?auto_1095218 ?auto_1095219 ) ) ( not ( = ?auto_1095217 ?auto_1095218 ) ) ( not ( = ?auto_1095217 ?auto_1095219 ) ) ( not ( = ?auto_1095222 ?auto_1095225 ) ) ( HOIST-AT ?auto_1095223 ?auto_1095222 ) ( not ( = ?auto_1095224 ?auto_1095223 ) ) ( AVAILABLE ?auto_1095223 ) ( SURFACE-AT ?auto_1095219 ?auto_1095222 ) ( ON ?auto_1095219 ?auto_1095220 ) ( CLEAR ?auto_1095219 ) ( not ( = ?auto_1095218 ?auto_1095220 ) ) ( not ( = ?auto_1095219 ?auto_1095220 ) ) ( not ( = ?auto_1095217 ?auto_1095220 ) ) ( SURFACE-AT ?auto_1095217 ?auto_1095225 ) ( CLEAR ?auto_1095217 ) ( IS-CRATE ?auto_1095218 ) ( AVAILABLE ?auto_1095224 ) ( IN ?auto_1095218 ?auto_1095221 ) ( TRUCK-AT ?auto_1095221 ?auto_1095222 ) ( ON ?auto_1095211 ?auto_1095210 ) ( ON ?auto_1095212 ?auto_1095211 ) ( ON ?auto_1095209 ?auto_1095212 ) ( ON ?auto_1095213 ?auto_1095209 ) ( ON ?auto_1095215 ?auto_1095213 ) ( ON ?auto_1095214 ?auto_1095215 ) ( ON ?auto_1095216 ?auto_1095214 ) ( ON ?auto_1095217 ?auto_1095216 ) ( not ( = ?auto_1095210 ?auto_1095211 ) ) ( not ( = ?auto_1095210 ?auto_1095212 ) ) ( not ( = ?auto_1095210 ?auto_1095209 ) ) ( not ( = ?auto_1095210 ?auto_1095213 ) ) ( not ( = ?auto_1095210 ?auto_1095215 ) ) ( not ( = ?auto_1095210 ?auto_1095214 ) ) ( not ( = ?auto_1095210 ?auto_1095216 ) ) ( not ( = ?auto_1095210 ?auto_1095217 ) ) ( not ( = ?auto_1095210 ?auto_1095218 ) ) ( not ( = ?auto_1095210 ?auto_1095219 ) ) ( not ( = ?auto_1095210 ?auto_1095220 ) ) ( not ( = ?auto_1095211 ?auto_1095212 ) ) ( not ( = ?auto_1095211 ?auto_1095209 ) ) ( not ( = ?auto_1095211 ?auto_1095213 ) ) ( not ( = ?auto_1095211 ?auto_1095215 ) ) ( not ( = ?auto_1095211 ?auto_1095214 ) ) ( not ( = ?auto_1095211 ?auto_1095216 ) ) ( not ( = ?auto_1095211 ?auto_1095217 ) ) ( not ( = ?auto_1095211 ?auto_1095218 ) ) ( not ( = ?auto_1095211 ?auto_1095219 ) ) ( not ( = ?auto_1095211 ?auto_1095220 ) ) ( not ( = ?auto_1095212 ?auto_1095209 ) ) ( not ( = ?auto_1095212 ?auto_1095213 ) ) ( not ( = ?auto_1095212 ?auto_1095215 ) ) ( not ( = ?auto_1095212 ?auto_1095214 ) ) ( not ( = ?auto_1095212 ?auto_1095216 ) ) ( not ( = ?auto_1095212 ?auto_1095217 ) ) ( not ( = ?auto_1095212 ?auto_1095218 ) ) ( not ( = ?auto_1095212 ?auto_1095219 ) ) ( not ( = ?auto_1095212 ?auto_1095220 ) ) ( not ( = ?auto_1095209 ?auto_1095213 ) ) ( not ( = ?auto_1095209 ?auto_1095215 ) ) ( not ( = ?auto_1095209 ?auto_1095214 ) ) ( not ( = ?auto_1095209 ?auto_1095216 ) ) ( not ( = ?auto_1095209 ?auto_1095217 ) ) ( not ( = ?auto_1095209 ?auto_1095218 ) ) ( not ( = ?auto_1095209 ?auto_1095219 ) ) ( not ( = ?auto_1095209 ?auto_1095220 ) ) ( not ( = ?auto_1095213 ?auto_1095215 ) ) ( not ( = ?auto_1095213 ?auto_1095214 ) ) ( not ( = ?auto_1095213 ?auto_1095216 ) ) ( not ( = ?auto_1095213 ?auto_1095217 ) ) ( not ( = ?auto_1095213 ?auto_1095218 ) ) ( not ( = ?auto_1095213 ?auto_1095219 ) ) ( not ( = ?auto_1095213 ?auto_1095220 ) ) ( not ( = ?auto_1095215 ?auto_1095214 ) ) ( not ( = ?auto_1095215 ?auto_1095216 ) ) ( not ( = ?auto_1095215 ?auto_1095217 ) ) ( not ( = ?auto_1095215 ?auto_1095218 ) ) ( not ( = ?auto_1095215 ?auto_1095219 ) ) ( not ( = ?auto_1095215 ?auto_1095220 ) ) ( not ( = ?auto_1095214 ?auto_1095216 ) ) ( not ( = ?auto_1095214 ?auto_1095217 ) ) ( not ( = ?auto_1095214 ?auto_1095218 ) ) ( not ( = ?auto_1095214 ?auto_1095219 ) ) ( not ( = ?auto_1095214 ?auto_1095220 ) ) ( not ( = ?auto_1095216 ?auto_1095217 ) ) ( not ( = ?auto_1095216 ?auto_1095218 ) ) ( not ( = ?auto_1095216 ?auto_1095219 ) ) ( not ( = ?auto_1095216 ?auto_1095220 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1095217 ?auto_1095218 ?auto_1095219 )
      ( MAKE-10CRATE-VERIFY ?auto_1095210 ?auto_1095211 ?auto_1095212 ?auto_1095209 ?auto_1095213 ?auto_1095215 ?auto_1095214 ?auto_1095216 ?auto_1095217 ?auto_1095218 ?auto_1095219 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1095227 - SURFACE
      ?auto_1095228 - SURFACE
      ?auto_1095229 - SURFACE
      ?auto_1095226 - SURFACE
      ?auto_1095230 - SURFACE
      ?auto_1095232 - SURFACE
      ?auto_1095231 - SURFACE
      ?auto_1095233 - SURFACE
      ?auto_1095234 - SURFACE
      ?auto_1095235 - SURFACE
      ?auto_1095236 - SURFACE
      ?auto_1095237 - SURFACE
    )
    :vars
    (
      ?auto_1095242 - HOIST
      ?auto_1095243 - PLACE
      ?auto_1095240 - PLACE
      ?auto_1095241 - HOIST
      ?auto_1095238 - SURFACE
      ?auto_1095239 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1095242 ?auto_1095243 ) ( IS-CRATE ?auto_1095237 ) ( not ( = ?auto_1095236 ?auto_1095237 ) ) ( not ( = ?auto_1095235 ?auto_1095236 ) ) ( not ( = ?auto_1095235 ?auto_1095237 ) ) ( not ( = ?auto_1095240 ?auto_1095243 ) ) ( HOIST-AT ?auto_1095241 ?auto_1095240 ) ( not ( = ?auto_1095242 ?auto_1095241 ) ) ( AVAILABLE ?auto_1095241 ) ( SURFACE-AT ?auto_1095237 ?auto_1095240 ) ( ON ?auto_1095237 ?auto_1095238 ) ( CLEAR ?auto_1095237 ) ( not ( = ?auto_1095236 ?auto_1095238 ) ) ( not ( = ?auto_1095237 ?auto_1095238 ) ) ( not ( = ?auto_1095235 ?auto_1095238 ) ) ( SURFACE-AT ?auto_1095235 ?auto_1095243 ) ( CLEAR ?auto_1095235 ) ( IS-CRATE ?auto_1095236 ) ( AVAILABLE ?auto_1095242 ) ( IN ?auto_1095236 ?auto_1095239 ) ( TRUCK-AT ?auto_1095239 ?auto_1095240 ) ( ON ?auto_1095228 ?auto_1095227 ) ( ON ?auto_1095229 ?auto_1095228 ) ( ON ?auto_1095226 ?auto_1095229 ) ( ON ?auto_1095230 ?auto_1095226 ) ( ON ?auto_1095232 ?auto_1095230 ) ( ON ?auto_1095231 ?auto_1095232 ) ( ON ?auto_1095233 ?auto_1095231 ) ( ON ?auto_1095234 ?auto_1095233 ) ( ON ?auto_1095235 ?auto_1095234 ) ( not ( = ?auto_1095227 ?auto_1095228 ) ) ( not ( = ?auto_1095227 ?auto_1095229 ) ) ( not ( = ?auto_1095227 ?auto_1095226 ) ) ( not ( = ?auto_1095227 ?auto_1095230 ) ) ( not ( = ?auto_1095227 ?auto_1095232 ) ) ( not ( = ?auto_1095227 ?auto_1095231 ) ) ( not ( = ?auto_1095227 ?auto_1095233 ) ) ( not ( = ?auto_1095227 ?auto_1095234 ) ) ( not ( = ?auto_1095227 ?auto_1095235 ) ) ( not ( = ?auto_1095227 ?auto_1095236 ) ) ( not ( = ?auto_1095227 ?auto_1095237 ) ) ( not ( = ?auto_1095227 ?auto_1095238 ) ) ( not ( = ?auto_1095228 ?auto_1095229 ) ) ( not ( = ?auto_1095228 ?auto_1095226 ) ) ( not ( = ?auto_1095228 ?auto_1095230 ) ) ( not ( = ?auto_1095228 ?auto_1095232 ) ) ( not ( = ?auto_1095228 ?auto_1095231 ) ) ( not ( = ?auto_1095228 ?auto_1095233 ) ) ( not ( = ?auto_1095228 ?auto_1095234 ) ) ( not ( = ?auto_1095228 ?auto_1095235 ) ) ( not ( = ?auto_1095228 ?auto_1095236 ) ) ( not ( = ?auto_1095228 ?auto_1095237 ) ) ( not ( = ?auto_1095228 ?auto_1095238 ) ) ( not ( = ?auto_1095229 ?auto_1095226 ) ) ( not ( = ?auto_1095229 ?auto_1095230 ) ) ( not ( = ?auto_1095229 ?auto_1095232 ) ) ( not ( = ?auto_1095229 ?auto_1095231 ) ) ( not ( = ?auto_1095229 ?auto_1095233 ) ) ( not ( = ?auto_1095229 ?auto_1095234 ) ) ( not ( = ?auto_1095229 ?auto_1095235 ) ) ( not ( = ?auto_1095229 ?auto_1095236 ) ) ( not ( = ?auto_1095229 ?auto_1095237 ) ) ( not ( = ?auto_1095229 ?auto_1095238 ) ) ( not ( = ?auto_1095226 ?auto_1095230 ) ) ( not ( = ?auto_1095226 ?auto_1095232 ) ) ( not ( = ?auto_1095226 ?auto_1095231 ) ) ( not ( = ?auto_1095226 ?auto_1095233 ) ) ( not ( = ?auto_1095226 ?auto_1095234 ) ) ( not ( = ?auto_1095226 ?auto_1095235 ) ) ( not ( = ?auto_1095226 ?auto_1095236 ) ) ( not ( = ?auto_1095226 ?auto_1095237 ) ) ( not ( = ?auto_1095226 ?auto_1095238 ) ) ( not ( = ?auto_1095230 ?auto_1095232 ) ) ( not ( = ?auto_1095230 ?auto_1095231 ) ) ( not ( = ?auto_1095230 ?auto_1095233 ) ) ( not ( = ?auto_1095230 ?auto_1095234 ) ) ( not ( = ?auto_1095230 ?auto_1095235 ) ) ( not ( = ?auto_1095230 ?auto_1095236 ) ) ( not ( = ?auto_1095230 ?auto_1095237 ) ) ( not ( = ?auto_1095230 ?auto_1095238 ) ) ( not ( = ?auto_1095232 ?auto_1095231 ) ) ( not ( = ?auto_1095232 ?auto_1095233 ) ) ( not ( = ?auto_1095232 ?auto_1095234 ) ) ( not ( = ?auto_1095232 ?auto_1095235 ) ) ( not ( = ?auto_1095232 ?auto_1095236 ) ) ( not ( = ?auto_1095232 ?auto_1095237 ) ) ( not ( = ?auto_1095232 ?auto_1095238 ) ) ( not ( = ?auto_1095231 ?auto_1095233 ) ) ( not ( = ?auto_1095231 ?auto_1095234 ) ) ( not ( = ?auto_1095231 ?auto_1095235 ) ) ( not ( = ?auto_1095231 ?auto_1095236 ) ) ( not ( = ?auto_1095231 ?auto_1095237 ) ) ( not ( = ?auto_1095231 ?auto_1095238 ) ) ( not ( = ?auto_1095233 ?auto_1095234 ) ) ( not ( = ?auto_1095233 ?auto_1095235 ) ) ( not ( = ?auto_1095233 ?auto_1095236 ) ) ( not ( = ?auto_1095233 ?auto_1095237 ) ) ( not ( = ?auto_1095233 ?auto_1095238 ) ) ( not ( = ?auto_1095234 ?auto_1095235 ) ) ( not ( = ?auto_1095234 ?auto_1095236 ) ) ( not ( = ?auto_1095234 ?auto_1095237 ) ) ( not ( = ?auto_1095234 ?auto_1095238 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1095235 ?auto_1095236 ?auto_1095237 )
      ( MAKE-11CRATE-VERIFY ?auto_1095227 ?auto_1095228 ?auto_1095229 ?auto_1095226 ?auto_1095230 ?auto_1095232 ?auto_1095231 ?auto_1095233 ?auto_1095234 ?auto_1095235 ?auto_1095236 ?auto_1095237 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1095245 - SURFACE
      ?auto_1095246 - SURFACE
      ?auto_1095247 - SURFACE
      ?auto_1095244 - SURFACE
      ?auto_1095248 - SURFACE
      ?auto_1095250 - SURFACE
      ?auto_1095249 - SURFACE
      ?auto_1095251 - SURFACE
      ?auto_1095252 - SURFACE
      ?auto_1095253 - SURFACE
      ?auto_1095254 - SURFACE
      ?auto_1095255 - SURFACE
      ?auto_1095256 - SURFACE
    )
    :vars
    (
      ?auto_1095261 - HOIST
      ?auto_1095262 - PLACE
      ?auto_1095259 - PLACE
      ?auto_1095260 - HOIST
      ?auto_1095257 - SURFACE
      ?auto_1095258 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1095261 ?auto_1095262 ) ( IS-CRATE ?auto_1095256 ) ( not ( = ?auto_1095255 ?auto_1095256 ) ) ( not ( = ?auto_1095254 ?auto_1095255 ) ) ( not ( = ?auto_1095254 ?auto_1095256 ) ) ( not ( = ?auto_1095259 ?auto_1095262 ) ) ( HOIST-AT ?auto_1095260 ?auto_1095259 ) ( not ( = ?auto_1095261 ?auto_1095260 ) ) ( AVAILABLE ?auto_1095260 ) ( SURFACE-AT ?auto_1095256 ?auto_1095259 ) ( ON ?auto_1095256 ?auto_1095257 ) ( CLEAR ?auto_1095256 ) ( not ( = ?auto_1095255 ?auto_1095257 ) ) ( not ( = ?auto_1095256 ?auto_1095257 ) ) ( not ( = ?auto_1095254 ?auto_1095257 ) ) ( SURFACE-AT ?auto_1095254 ?auto_1095262 ) ( CLEAR ?auto_1095254 ) ( IS-CRATE ?auto_1095255 ) ( AVAILABLE ?auto_1095261 ) ( IN ?auto_1095255 ?auto_1095258 ) ( TRUCK-AT ?auto_1095258 ?auto_1095259 ) ( ON ?auto_1095246 ?auto_1095245 ) ( ON ?auto_1095247 ?auto_1095246 ) ( ON ?auto_1095244 ?auto_1095247 ) ( ON ?auto_1095248 ?auto_1095244 ) ( ON ?auto_1095250 ?auto_1095248 ) ( ON ?auto_1095249 ?auto_1095250 ) ( ON ?auto_1095251 ?auto_1095249 ) ( ON ?auto_1095252 ?auto_1095251 ) ( ON ?auto_1095253 ?auto_1095252 ) ( ON ?auto_1095254 ?auto_1095253 ) ( not ( = ?auto_1095245 ?auto_1095246 ) ) ( not ( = ?auto_1095245 ?auto_1095247 ) ) ( not ( = ?auto_1095245 ?auto_1095244 ) ) ( not ( = ?auto_1095245 ?auto_1095248 ) ) ( not ( = ?auto_1095245 ?auto_1095250 ) ) ( not ( = ?auto_1095245 ?auto_1095249 ) ) ( not ( = ?auto_1095245 ?auto_1095251 ) ) ( not ( = ?auto_1095245 ?auto_1095252 ) ) ( not ( = ?auto_1095245 ?auto_1095253 ) ) ( not ( = ?auto_1095245 ?auto_1095254 ) ) ( not ( = ?auto_1095245 ?auto_1095255 ) ) ( not ( = ?auto_1095245 ?auto_1095256 ) ) ( not ( = ?auto_1095245 ?auto_1095257 ) ) ( not ( = ?auto_1095246 ?auto_1095247 ) ) ( not ( = ?auto_1095246 ?auto_1095244 ) ) ( not ( = ?auto_1095246 ?auto_1095248 ) ) ( not ( = ?auto_1095246 ?auto_1095250 ) ) ( not ( = ?auto_1095246 ?auto_1095249 ) ) ( not ( = ?auto_1095246 ?auto_1095251 ) ) ( not ( = ?auto_1095246 ?auto_1095252 ) ) ( not ( = ?auto_1095246 ?auto_1095253 ) ) ( not ( = ?auto_1095246 ?auto_1095254 ) ) ( not ( = ?auto_1095246 ?auto_1095255 ) ) ( not ( = ?auto_1095246 ?auto_1095256 ) ) ( not ( = ?auto_1095246 ?auto_1095257 ) ) ( not ( = ?auto_1095247 ?auto_1095244 ) ) ( not ( = ?auto_1095247 ?auto_1095248 ) ) ( not ( = ?auto_1095247 ?auto_1095250 ) ) ( not ( = ?auto_1095247 ?auto_1095249 ) ) ( not ( = ?auto_1095247 ?auto_1095251 ) ) ( not ( = ?auto_1095247 ?auto_1095252 ) ) ( not ( = ?auto_1095247 ?auto_1095253 ) ) ( not ( = ?auto_1095247 ?auto_1095254 ) ) ( not ( = ?auto_1095247 ?auto_1095255 ) ) ( not ( = ?auto_1095247 ?auto_1095256 ) ) ( not ( = ?auto_1095247 ?auto_1095257 ) ) ( not ( = ?auto_1095244 ?auto_1095248 ) ) ( not ( = ?auto_1095244 ?auto_1095250 ) ) ( not ( = ?auto_1095244 ?auto_1095249 ) ) ( not ( = ?auto_1095244 ?auto_1095251 ) ) ( not ( = ?auto_1095244 ?auto_1095252 ) ) ( not ( = ?auto_1095244 ?auto_1095253 ) ) ( not ( = ?auto_1095244 ?auto_1095254 ) ) ( not ( = ?auto_1095244 ?auto_1095255 ) ) ( not ( = ?auto_1095244 ?auto_1095256 ) ) ( not ( = ?auto_1095244 ?auto_1095257 ) ) ( not ( = ?auto_1095248 ?auto_1095250 ) ) ( not ( = ?auto_1095248 ?auto_1095249 ) ) ( not ( = ?auto_1095248 ?auto_1095251 ) ) ( not ( = ?auto_1095248 ?auto_1095252 ) ) ( not ( = ?auto_1095248 ?auto_1095253 ) ) ( not ( = ?auto_1095248 ?auto_1095254 ) ) ( not ( = ?auto_1095248 ?auto_1095255 ) ) ( not ( = ?auto_1095248 ?auto_1095256 ) ) ( not ( = ?auto_1095248 ?auto_1095257 ) ) ( not ( = ?auto_1095250 ?auto_1095249 ) ) ( not ( = ?auto_1095250 ?auto_1095251 ) ) ( not ( = ?auto_1095250 ?auto_1095252 ) ) ( not ( = ?auto_1095250 ?auto_1095253 ) ) ( not ( = ?auto_1095250 ?auto_1095254 ) ) ( not ( = ?auto_1095250 ?auto_1095255 ) ) ( not ( = ?auto_1095250 ?auto_1095256 ) ) ( not ( = ?auto_1095250 ?auto_1095257 ) ) ( not ( = ?auto_1095249 ?auto_1095251 ) ) ( not ( = ?auto_1095249 ?auto_1095252 ) ) ( not ( = ?auto_1095249 ?auto_1095253 ) ) ( not ( = ?auto_1095249 ?auto_1095254 ) ) ( not ( = ?auto_1095249 ?auto_1095255 ) ) ( not ( = ?auto_1095249 ?auto_1095256 ) ) ( not ( = ?auto_1095249 ?auto_1095257 ) ) ( not ( = ?auto_1095251 ?auto_1095252 ) ) ( not ( = ?auto_1095251 ?auto_1095253 ) ) ( not ( = ?auto_1095251 ?auto_1095254 ) ) ( not ( = ?auto_1095251 ?auto_1095255 ) ) ( not ( = ?auto_1095251 ?auto_1095256 ) ) ( not ( = ?auto_1095251 ?auto_1095257 ) ) ( not ( = ?auto_1095252 ?auto_1095253 ) ) ( not ( = ?auto_1095252 ?auto_1095254 ) ) ( not ( = ?auto_1095252 ?auto_1095255 ) ) ( not ( = ?auto_1095252 ?auto_1095256 ) ) ( not ( = ?auto_1095252 ?auto_1095257 ) ) ( not ( = ?auto_1095253 ?auto_1095254 ) ) ( not ( = ?auto_1095253 ?auto_1095255 ) ) ( not ( = ?auto_1095253 ?auto_1095256 ) ) ( not ( = ?auto_1095253 ?auto_1095257 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1095254 ?auto_1095255 ?auto_1095256 )
      ( MAKE-12CRATE-VERIFY ?auto_1095245 ?auto_1095246 ?auto_1095247 ?auto_1095244 ?auto_1095248 ?auto_1095250 ?auto_1095249 ?auto_1095251 ?auto_1095252 ?auto_1095253 ?auto_1095254 ?auto_1095255 ?auto_1095256 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1095264 - SURFACE
      ?auto_1095265 - SURFACE
      ?auto_1095266 - SURFACE
      ?auto_1095263 - SURFACE
      ?auto_1095267 - SURFACE
      ?auto_1095269 - SURFACE
      ?auto_1095268 - SURFACE
      ?auto_1095270 - SURFACE
      ?auto_1095271 - SURFACE
      ?auto_1095272 - SURFACE
      ?auto_1095273 - SURFACE
      ?auto_1095274 - SURFACE
      ?auto_1095275 - SURFACE
      ?auto_1095276 - SURFACE
    )
    :vars
    (
      ?auto_1095281 - HOIST
      ?auto_1095282 - PLACE
      ?auto_1095279 - PLACE
      ?auto_1095280 - HOIST
      ?auto_1095277 - SURFACE
      ?auto_1095278 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1095281 ?auto_1095282 ) ( IS-CRATE ?auto_1095276 ) ( not ( = ?auto_1095275 ?auto_1095276 ) ) ( not ( = ?auto_1095274 ?auto_1095275 ) ) ( not ( = ?auto_1095274 ?auto_1095276 ) ) ( not ( = ?auto_1095279 ?auto_1095282 ) ) ( HOIST-AT ?auto_1095280 ?auto_1095279 ) ( not ( = ?auto_1095281 ?auto_1095280 ) ) ( AVAILABLE ?auto_1095280 ) ( SURFACE-AT ?auto_1095276 ?auto_1095279 ) ( ON ?auto_1095276 ?auto_1095277 ) ( CLEAR ?auto_1095276 ) ( not ( = ?auto_1095275 ?auto_1095277 ) ) ( not ( = ?auto_1095276 ?auto_1095277 ) ) ( not ( = ?auto_1095274 ?auto_1095277 ) ) ( SURFACE-AT ?auto_1095274 ?auto_1095282 ) ( CLEAR ?auto_1095274 ) ( IS-CRATE ?auto_1095275 ) ( AVAILABLE ?auto_1095281 ) ( IN ?auto_1095275 ?auto_1095278 ) ( TRUCK-AT ?auto_1095278 ?auto_1095279 ) ( ON ?auto_1095265 ?auto_1095264 ) ( ON ?auto_1095266 ?auto_1095265 ) ( ON ?auto_1095263 ?auto_1095266 ) ( ON ?auto_1095267 ?auto_1095263 ) ( ON ?auto_1095269 ?auto_1095267 ) ( ON ?auto_1095268 ?auto_1095269 ) ( ON ?auto_1095270 ?auto_1095268 ) ( ON ?auto_1095271 ?auto_1095270 ) ( ON ?auto_1095272 ?auto_1095271 ) ( ON ?auto_1095273 ?auto_1095272 ) ( ON ?auto_1095274 ?auto_1095273 ) ( not ( = ?auto_1095264 ?auto_1095265 ) ) ( not ( = ?auto_1095264 ?auto_1095266 ) ) ( not ( = ?auto_1095264 ?auto_1095263 ) ) ( not ( = ?auto_1095264 ?auto_1095267 ) ) ( not ( = ?auto_1095264 ?auto_1095269 ) ) ( not ( = ?auto_1095264 ?auto_1095268 ) ) ( not ( = ?auto_1095264 ?auto_1095270 ) ) ( not ( = ?auto_1095264 ?auto_1095271 ) ) ( not ( = ?auto_1095264 ?auto_1095272 ) ) ( not ( = ?auto_1095264 ?auto_1095273 ) ) ( not ( = ?auto_1095264 ?auto_1095274 ) ) ( not ( = ?auto_1095264 ?auto_1095275 ) ) ( not ( = ?auto_1095264 ?auto_1095276 ) ) ( not ( = ?auto_1095264 ?auto_1095277 ) ) ( not ( = ?auto_1095265 ?auto_1095266 ) ) ( not ( = ?auto_1095265 ?auto_1095263 ) ) ( not ( = ?auto_1095265 ?auto_1095267 ) ) ( not ( = ?auto_1095265 ?auto_1095269 ) ) ( not ( = ?auto_1095265 ?auto_1095268 ) ) ( not ( = ?auto_1095265 ?auto_1095270 ) ) ( not ( = ?auto_1095265 ?auto_1095271 ) ) ( not ( = ?auto_1095265 ?auto_1095272 ) ) ( not ( = ?auto_1095265 ?auto_1095273 ) ) ( not ( = ?auto_1095265 ?auto_1095274 ) ) ( not ( = ?auto_1095265 ?auto_1095275 ) ) ( not ( = ?auto_1095265 ?auto_1095276 ) ) ( not ( = ?auto_1095265 ?auto_1095277 ) ) ( not ( = ?auto_1095266 ?auto_1095263 ) ) ( not ( = ?auto_1095266 ?auto_1095267 ) ) ( not ( = ?auto_1095266 ?auto_1095269 ) ) ( not ( = ?auto_1095266 ?auto_1095268 ) ) ( not ( = ?auto_1095266 ?auto_1095270 ) ) ( not ( = ?auto_1095266 ?auto_1095271 ) ) ( not ( = ?auto_1095266 ?auto_1095272 ) ) ( not ( = ?auto_1095266 ?auto_1095273 ) ) ( not ( = ?auto_1095266 ?auto_1095274 ) ) ( not ( = ?auto_1095266 ?auto_1095275 ) ) ( not ( = ?auto_1095266 ?auto_1095276 ) ) ( not ( = ?auto_1095266 ?auto_1095277 ) ) ( not ( = ?auto_1095263 ?auto_1095267 ) ) ( not ( = ?auto_1095263 ?auto_1095269 ) ) ( not ( = ?auto_1095263 ?auto_1095268 ) ) ( not ( = ?auto_1095263 ?auto_1095270 ) ) ( not ( = ?auto_1095263 ?auto_1095271 ) ) ( not ( = ?auto_1095263 ?auto_1095272 ) ) ( not ( = ?auto_1095263 ?auto_1095273 ) ) ( not ( = ?auto_1095263 ?auto_1095274 ) ) ( not ( = ?auto_1095263 ?auto_1095275 ) ) ( not ( = ?auto_1095263 ?auto_1095276 ) ) ( not ( = ?auto_1095263 ?auto_1095277 ) ) ( not ( = ?auto_1095267 ?auto_1095269 ) ) ( not ( = ?auto_1095267 ?auto_1095268 ) ) ( not ( = ?auto_1095267 ?auto_1095270 ) ) ( not ( = ?auto_1095267 ?auto_1095271 ) ) ( not ( = ?auto_1095267 ?auto_1095272 ) ) ( not ( = ?auto_1095267 ?auto_1095273 ) ) ( not ( = ?auto_1095267 ?auto_1095274 ) ) ( not ( = ?auto_1095267 ?auto_1095275 ) ) ( not ( = ?auto_1095267 ?auto_1095276 ) ) ( not ( = ?auto_1095267 ?auto_1095277 ) ) ( not ( = ?auto_1095269 ?auto_1095268 ) ) ( not ( = ?auto_1095269 ?auto_1095270 ) ) ( not ( = ?auto_1095269 ?auto_1095271 ) ) ( not ( = ?auto_1095269 ?auto_1095272 ) ) ( not ( = ?auto_1095269 ?auto_1095273 ) ) ( not ( = ?auto_1095269 ?auto_1095274 ) ) ( not ( = ?auto_1095269 ?auto_1095275 ) ) ( not ( = ?auto_1095269 ?auto_1095276 ) ) ( not ( = ?auto_1095269 ?auto_1095277 ) ) ( not ( = ?auto_1095268 ?auto_1095270 ) ) ( not ( = ?auto_1095268 ?auto_1095271 ) ) ( not ( = ?auto_1095268 ?auto_1095272 ) ) ( not ( = ?auto_1095268 ?auto_1095273 ) ) ( not ( = ?auto_1095268 ?auto_1095274 ) ) ( not ( = ?auto_1095268 ?auto_1095275 ) ) ( not ( = ?auto_1095268 ?auto_1095276 ) ) ( not ( = ?auto_1095268 ?auto_1095277 ) ) ( not ( = ?auto_1095270 ?auto_1095271 ) ) ( not ( = ?auto_1095270 ?auto_1095272 ) ) ( not ( = ?auto_1095270 ?auto_1095273 ) ) ( not ( = ?auto_1095270 ?auto_1095274 ) ) ( not ( = ?auto_1095270 ?auto_1095275 ) ) ( not ( = ?auto_1095270 ?auto_1095276 ) ) ( not ( = ?auto_1095270 ?auto_1095277 ) ) ( not ( = ?auto_1095271 ?auto_1095272 ) ) ( not ( = ?auto_1095271 ?auto_1095273 ) ) ( not ( = ?auto_1095271 ?auto_1095274 ) ) ( not ( = ?auto_1095271 ?auto_1095275 ) ) ( not ( = ?auto_1095271 ?auto_1095276 ) ) ( not ( = ?auto_1095271 ?auto_1095277 ) ) ( not ( = ?auto_1095272 ?auto_1095273 ) ) ( not ( = ?auto_1095272 ?auto_1095274 ) ) ( not ( = ?auto_1095272 ?auto_1095275 ) ) ( not ( = ?auto_1095272 ?auto_1095276 ) ) ( not ( = ?auto_1095272 ?auto_1095277 ) ) ( not ( = ?auto_1095273 ?auto_1095274 ) ) ( not ( = ?auto_1095273 ?auto_1095275 ) ) ( not ( = ?auto_1095273 ?auto_1095276 ) ) ( not ( = ?auto_1095273 ?auto_1095277 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1095274 ?auto_1095275 ?auto_1095276 )
      ( MAKE-13CRATE-VERIFY ?auto_1095264 ?auto_1095265 ?auto_1095266 ?auto_1095263 ?auto_1095267 ?auto_1095269 ?auto_1095268 ?auto_1095270 ?auto_1095271 ?auto_1095272 ?auto_1095273 ?auto_1095274 ?auto_1095275 ?auto_1095276 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1095393 - SURFACE
      ?auto_1095394 - SURFACE
      ?auto_1095395 - SURFACE
      ?auto_1095392 - SURFACE
      ?auto_1095396 - SURFACE
      ?auto_1095398 - SURFACE
      ?auto_1095397 - SURFACE
      ?auto_1095399 - SURFACE
      ?auto_1095400 - SURFACE
      ?auto_1095401 - SURFACE
      ?auto_1095402 - SURFACE
    )
    :vars
    (
      ?auto_1095405 - HOIST
      ?auto_1095407 - PLACE
      ?auto_1095408 - PLACE
      ?auto_1095406 - HOIST
      ?auto_1095404 - SURFACE
      ?auto_1095403 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1095405 ?auto_1095407 ) ( IS-CRATE ?auto_1095402 ) ( not ( = ?auto_1095401 ?auto_1095402 ) ) ( not ( = ?auto_1095400 ?auto_1095401 ) ) ( not ( = ?auto_1095400 ?auto_1095402 ) ) ( not ( = ?auto_1095408 ?auto_1095407 ) ) ( HOIST-AT ?auto_1095406 ?auto_1095408 ) ( not ( = ?auto_1095405 ?auto_1095406 ) ) ( SURFACE-AT ?auto_1095402 ?auto_1095408 ) ( ON ?auto_1095402 ?auto_1095404 ) ( CLEAR ?auto_1095402 ) ( not ( = ?auto_1095401 ?auto_1095404 ) ) ( not ( = ?auto_1095402 ?auto_1095404 ) ) ( not ( = ?auto_1095400 ?auto_1095404 ) ) ( SURFACE-AT ?auto_1095400 ?auto_1095407 ) ( CLEAR ?auto_1095400 ) ( IS-CRATE ?auto_1095401 ) ( AVAILABLE ?auto_1095405 ) ( TRUCK-AT ?auto_1095403 ?auto_1095408 ) ( LIFTING ?auto_1095406 ?auto_1095401 ) ( ON ?auto_1095394 ?auto_1095393 ) ( ON ?auto_1095395 ?auto_1095394 ) ( ON ?auto_1095392 ?auto_1095395 ) ( ON ?auto_1095396 ?auto_1095392 ) ( ON ?auto_1095398 ?auto_1095396 ) ( ON ?auto_1095397 ?auto_1095398 ) ( ON ?auto_1095399 ?auto_1095397 ) ( ON ?auto_1095400 ?auto_1095399 ) ( not ( = ?auto_1095393 ?auto_1095394 ) ) ( not ( = ?auto_1095393 ?auto_1095395 ) ) ( not ( = ?auto_1095393 ?auto_1095392 ) ) ( not ( = ?auto_1095393 ?auto_1095396 ) ) ( not ( = ?auto_1095393 ?auto_1095398 ) ) ( not ( = ?auto_1095393 ?auto_1095397 ) ) ( not ( = ?auto_1095393 ?auto_1095399 ) ) ( not ( = ?auto_1095393 ?auto_1095400 ) ) ( not ( = ?auto_1095393 ?auto_1095401 ) ) ( not ( = ?auto_1095393 ?auto_1095402 ) ) ( not ( = ?auto_1095393 ?auto_1095404 ) ) ( not ( = ?auto_1095394 ?auto_1095395 ) ) ( not ( = ?auto_1095394 ?auto_1095392 ) ) ( not ( = ?auto_1095394 ?auto_1095396 ) ) ( not ( = ?auto_1095394 ?auto_1095398 ) ) ( not ( = ?auto_1095394 ?auto_1095397 ) ) ( not ( = ?auto_1095394 ?auto_1095399 ) ) ( not ( = ?auto_1095394 ?auto_1095400 ) ) ( not ( = ?auto_1095394 ?auto_1095401 ) ) ( not ( = ?auto_1095394 ?auto_1095402 ) ) ( not ( = ?auto_1095394 ?auto_1095404 ) ) ( not ( = ?auto_1095395 ?auto_1095392 ) ) ( not ( = ?auto_1095395 ?auto_1095396 ) ) ( not ( = ?auto_1095395 ?auto_1095398 ) ) ( not ( = ?auto_1095395 ?auto_1095397 ) ) ( not ( = ?auto_1095395 ?auto_1095399 ) ) ( not ( = ?auto_1095395 ?auto_1095400 ) ) ( not ( = ?auto_1095395 ?auto_1095401 ) ) ( not ( = ?auto_1095395 ?auto_1095402 ) ) ( not ( = ?auto_1095395 ?auto_1095404 ) ) ( not ( = ?auto_1095392 ?auto_1095396 ) ) ( not ( = ?auto_1095392 ?auto_1095398 ) ) ( not ( = ?auto_1095392 ?auto_1095397 ) ) ( not ( = ?auto_1095392 ?auto_1095399 ) ) ( not ( = ?auto_1095392 ?auto_1095400 ) ) ( not ( = ?auto_1095392 ?auto_1095401 ) ) ( not ( = ?auto_1095392 ?auto_1095402 ) ) ( not ( = ?auto_1095392 ?auto_1095404 ) ) ( not ( = ?auto_1095396 ?auto_1095398 ) ) ( not ( = ?auto_1095396 ?auto_1095397 ) ) ( not ( = ?auto_1095396 ?auto_1095399 ) ) ( not ( = ?auto_1095396 ?auto_1095400 ) ) ( not ( = ?auto_1095396 ?auto_1095401 ) ) ( not ( = ?auto_1095396 ?auto_1095402 ) ) ( not ( = ?auto_1095396 ?auto_1095404 ) ) ( not ( = ?auto_1095398 ?auto_1095397 ) ) ( not ( = ?auto_1095398 ?auto_1095399 ) ) ( not ( = ?auto_1095398 ?auto_1095400 ) ) ( not ( = ?auto_1095398 ?auto_1095401 ) ) ( not ( = ?auto_1095398 ?auto_1095402 ) ) ( not ( = ?auto_1095398 ?auto_1095404 ) ) ( not ( = ?auto_1095397 ?auto_1095399 ) ) ( not ( = ?auto_1095397 ?auto_1095400 ) ) ( not ( = ?auto_1095397 ?auto_1095401 ) ) ( not ( = ?auto_1095397 ?auto_1095402 ) ) ( not ( = ?auto_1095397 ?auto_1095404 ) ) ( not ( = ?auto_1095399 ?auto_1095400 ) ) ( not ( = ?auto_1095399 ?auto_1095401 ) ) ( not ( = ?auto_1095399 ?auto_1095402 ) ) ( not ( = ?auto_1095399 ?auto_1095404 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1095400 ?auto_1095401 ?auto_1095402 )
      ( MAKE-10CRATE-VERIFY ?auto_1095393 ?auto_1095394 ?auto_1095395 ?auto_1095392 ?auto_1095396 ?auto_1095398 ?auto_1095397 ?auto_1095399 ?auto_1095400 ?auto_1095401 ?auto_1095402 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1095410 - SURFACE
      ?auto_1095411 - SURFACE
      ?auto_1095412 - SURFACE
      ?auto_1095409 - SURFACE
      ?auto_1095413 - SURFACE
      ?auto_1095415 - SURFACE
      ?auto_1095414 - SURFACE
      ?auto_1095416 - SURFACE
      ?auto_1095417 - SURFACE
      ?auto_1095418 - SURFACE
      ?auto_1095419 - SURFACE
      ?auto_1095420 - SURFACE
    )
    :vars
    (
      ?auto_1095423 - HOIST
      ?auto_1095425 - PLACE
      ?auto_1095426 - PLACE
      ?auto_1095424 - HOIST
      ?auto_1095422 - SURFACE
      ?auto_1095421 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1095423 ?auto_1095425 ) ( IS-CRATE ?auto_1095420 ) ( not ( = ?auto_1095419 ?auto_1095420 ) ) ( not ( = ?auto_1095418 ?auto_1095419 ) ) ( not ( = ?auto_1095418 ?auto_1095420 ) ) ( not ( = ?auto_1095426 ?auto_1095425 ) ) ( HOIST-AT ?auto_1095424 ?auto_1095426 ) ( not ( = ?auto_1095423 ?auto_1095424 ) ) ( SURFACE-AT ?auto_1095420 ?auto_1095426 ) ( ON ?auto_1095420 ?auto_1095422 ) ( CLEAR ?auto_1095420 ) ( not ( = ?auto_1095419 ?auto_1095422 ) ) ( not ( = ?auto_1095420 ?auto_1095422 ) ) ( not ( = ?auto_1095418 ?auto_1095422 ) ) ( SURFACE-AT ?auto_1095418 ?auto_1095425 ) ( CLEAR ?auto_1095418 ) ( IS-CRATE ?auto_1095419 ) ( AVAILABLE ?auto_1095423 ) ( TRUCK-AT ?auto_1095421 ?auto_1095426 ) ( LIFTING ?auto_1095424 ?auto_1095419 ) ( ON ?auto_1095411 ?auto_1095410 ) ( ON ?auto_1095412 ?auto_1095411 ) ( ON ?auto_1095409 ?auto_1095412 ) ( ON ?auto_1095413 ?auto_1095409 ) ( ON ?auto_1095415 ?auto_1095413 ) ( ON ?auto_1095414 ?auto_1095415 ) ( ON ?auto_1095416 ?auto_1095414 ) ( ON ?auto_1095417 ?auto_1095416 ) ( ON ?auto_1095418 ?auto_1095417 ) ( not ( = ?auto_1095410 ?auto_1095411 ) ) ( not ( = ?auto_1095410 ?auto_1095412 ) ) ( not ( = ?auto_1095410 ?auto_1095409 ) ) ( not ( = ?auto_1095410 ?auto_1095413 ) ) ( not ( = ?auto_1095410 ?auto_1095415 ) ) ( not ( = ?auto_1095410 ?auto_1095414 ) ) ( not ( = ?auto_1095410 ?auto_1095416 ) ) ( not ( = ?auto_1095410 ?auto_1095417 ) ) ( not ( = ?auto_1095410 ?auto_1095418 ) ) ( not ( = ?auto_1095410 ?auto_1095419 ) ) ( not ( = ?auto_1095410 ?auto_1095420 ) ) ( not ( = ?auto_1095410 ?auto_1095422 ) ) ( not ( = ?auto_1095411 ?auto_1095412 ) ) ( not ( = ?auto_1095411 ?auto_1095409 ) ) ( not ( = ?auto_1095411 ?auto_1095413 ) ) ( not ( = ?auto_1095411 ?auto_1095415 ) ) ( not ( = ?auto_1095411 ?auto_1095414 ) ) ( not ( = ?auto_1095411 ?auto_1095416 ) ) ( not ( = ?auto_1095411 ?auto_1095417 ) ) ( not ( = ?auto_1095411 ?auto_1095418 ) ) ( not ( = ?auto_1095411 ?auto_1095419 ) ) ( not ( = ?auto_1095411 ?auto_1095420 ) ) ( not ( = ?auto_1095411 ?auto_1095422 ) ) ( not ( = ?auto_1095412 ?auto_1095409 ) ) ( not ( = ?auto_1095412 ?auto_1095413 ) ) ( not ( = ?auto_1095412 ?auto_1095415 ) ) ( not ( = ?auto_1095412 ?auto_1095414 ) ) ( not ( = ?auto_1095412 ?auto_1095416 ) ) ( not ( = ?auto_1095412 ?auto_1095417 ) ) ( not ( = ?auto_1095412 ?auto_1095418 ) ) ( not ( = ?auto_1095412 ?auto_1095419 ) ) ( not ( = ?auto_1095412 ?auto_1095420 ) ) ( not ( = ?auto_1095412 ?auto_1095422 ) ) ( not ( = ?auto_1095409 ?auto_1095413 ) ) ( not ( = ?auto_1095409 ?auto_1095415 ) ) ( not ( = ?auto_1095409 ?auto_1095414 ) ) ( not ( = ?auto_1095409 ?auto_1095416 ) ) ( not ( = ?auto_1095409 ?auto_1095417 ) ) ( not ( = ?auto_1095409 ?auto_1095418 ) ) ( not ( = ?auto_1095409 ?auto_1095419 ) ) ( not ( = ?auto_1095409 ?auto_1095420 ) ) ( not ( = ?auto_1095409 ?auto_1095422 ) ) ( not ( = ?auto_1095413 ?auto_1095415 ) ) ( not ( = ?auto_1095413 ?auto_1095414 ) ) ( not ( = ?auto_1095413 ?auto_1095416 ) ) ( not ( = ?auto_1095413 ?auto_1095417 ) ) ( not ( = ?auto_1095413 ?auto_1095418 ) ) ( not ( = ?auto_1095413 ?auto_1095419 ) ) ( not ( = ?auto_1095413 ?auto_1095420 ) ) ( not ( = ?auto_1095413 ?auto_1095422 ) ) ( not ( = ?auto_1095415 ?auto_1095414 ) ) ( not ( = ?auto_1095415 ?auto_1095416 ) ) ( not ( = ?auto_1095415 ?auto_1095417 ) ) ( not ( = ?auto_1095415 ?auto_1095418 ) ) ( not ( = ?auto_1095415 ?auto_1095419 ) ) ( not ( = ?auto_1095415 ?auto_1095420 ) ) ( not ( = ?auto_1095415 ?auto_1095422 ) ) ( not ( = ?auto_1095414 ?auto_1095416 ) ) ( not ( = ?auto_1095414 ?auto_1095417 ) ) ( not ( = ?auto_1095414 ?auto_1095418 ) ) ( not ( = ?auto_1095414 ?auto_1095419 ) ) ( not ( = ?auto_1095414 ?auto_1095420 ) ) ( not ( = ?auto_1095414 ?auto_1095422 ) ) ( not ( = ?auto_1095416 ?auto_1095417 ) ) ( not ( = ?auto_1095416 ?auto_1095418 ) ) ( not ( = ?auto_1095416 ?auto_1095419 ) ) ( not ( = ?auto_1095416 ?auto_1095420 ) ) ( not ( = ?auto_1095416 ?auto_1095422 ) ) ( not ( = ?auto_1095417 ?auto_1095418 ) ) ( not ( = ?auto_1095417 ?auto_1095419 ) ) ( not ( = ?auto_1095417 ?auto_1095420 ) ) ( not ( = ?auto_1095417 ?auto_1095422 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1095418 ?auto_1095419 ?auto_1095420 )
      ( MAKE-11CRATE-VERIFY ?auto_1095410 ?auto_1095411 ?auto_1095412 ?auto_1095409 ?auto_1095413 ?auto_1095415 ?auto_1095414 ?auto_1095416 ?auto_1095417 ?auto_1095418 ?auto_1095419 ?auto_1095420 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1095428 - SURFACE
      ?auto_1095429 - SURFACE
      ?auto_1095430 - SURFACE
      ?auto_1095427 - SURFACE
      ?auto_1095431 - SURFACE
      ?auto_1095433 - SURFACE
      ?auto_1095432 - SURFACE
      ?auto_1095434 - SURFACE
      ?auto_1095435 - SURFACE
      ?auto_1095436 - SURFACE
      ?auto_1095437 - SURFACE
      ?auto_1095438 - SURFACE
      ?auto_1095439 - SURFACE
    )
    :vars
    (
      ?auto_1095442 - HOIST
      ?auto_1095444 - PLACE
      ?auto_1095445 - PLACE
      ?auto_1095443 - HOIST
      ?auto_1095441 - SURFACE
      ?auto_1095440 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1095442 ?auto_1095444 ) ( IS-CRATE ?auto_1095439 ) ( not ( = ?auto_1095438 ?auto_1095439 ) ) ( not ( = ?auto_1095437 ?auto_1095438 ) ) ( not ( = ?auto_1095437 ?auto_1095439 ) ) ( not ( = ?auto_1095445 ?auto_1095444 ) ) ( HOIST-AT ?auto_1095443 ?auto_1095445 ) ( not ( = ?auto_1095442 ?auto_1095443 ) ) ( SURFACE-AT ?auto_1095439 ?auto_1095445 ) ( ON ?auto_1095439 ?auto_1095441 ) ( CLEAR ?auto_1095439 ) ( not ( = ?auto_1095438 ?auto_1095441 ) ) ( not ( = ?auto_1095439 ?auto_1095441 ) ) ( not ( = ?auto_1095437 ?auto_1095441 ) ) ( SURFACE-AT ?auto_1095437 ?auto_1095444 ) ( CLEAR ?auto_1095437 ) ( IS-CRATE ?auto_1095438 ) ( AVAILABLE ?auto_1095442 ) ( TRUCK-AT ?auto_1095440 ?auto_1095445 ) ( LIFTING ?auto_1095443 ?auto_1095438 ) ( ON ?auto_1095429 ?auto_1095428 ) ( ON ?auto_1095430 ?auto_1095429 ) ( ON ?auto_1095427 ?auto_1095430 ) ( ON ?auto_1095431 ?auto_1095427 ) ( ON ?auto_1095433 ?auto_1095431 ) ( ON ?auto_1095432 ?auto_1095433 ) ( ON ?auto_1095434 ?auto_1095432 ) ( ON ?auto_1095435 ?auto_1095434 ) ( ON ?auto_1095436 ?auto_1095435 ) ( ON ?auto_1095437 ?auto_1095436 ) ( not ( = ?auto_1095428 ?auto_1095429 ) ) ( not ( = ?auto_1095428 ?auto_1095430 ) ) ( not ( = ?auto_1095428 ?auto_1095427 ) ) ( not ( = ?auto_1095428 ?auto_1095431 ) ) ( not ( = ?auto_1095428 ?auto_1095433 ) ) ( not ( = ?auto_1095428 ?auto_1095432 ) ) ( not ( = ?auto_1095428 ?auto_1095434 ) ) ( not ( = ?auto_1095428 ?auto_1095435 ) ) ( not ( = ?auto_1095428 ?auto_1095436 ) ) ( not ( = ?auto_1095428 ?auto_1095437 ) ) ( not ( = ?auto_1095428 ?auto_1095438 ) ) ( not ( = ?auto_1095428 ?auto_1095439 ) ) ( not ( = ?auto_1095428 ?auto_1095441 ) ) ( not ( = ?auto_1095429 ?auto_1095430 ) ) ( not ( = ?auto_1095429 ?auto_1095427 ) ) ( not ( = ?auto_1095429 ?auto_1095431 ) ) ( not ( = ?auto_1095429 ?auto_1095433 ) ) ( not ( = ?auto_1095429 ?auto_1095432 ) ) ( not ( = ?auto_1095429 ?auto_1095434 ) ) ( not ( = ?auto_1095429 ?auto_1095435 ) ) ( not ( = ?auto_1095429 ?auto_1095436 ) ) ( not ( = ?auto_1095429 ?auto_1095437 ) ) ( not ( = ?auto_1095429 ?auto_1095438 ) ) ( not ( = ?auto_1095429 ?auto_1095439 ) ) ( not ( = ?auto_1095429 ?auto_1095441 ) ) ( not ( = ?auto_1095430 ?auto_1095427 ) ) ( not ( = ?auto_1095430 ?auto_1095431 ) ) ( not ( = ?auto_1095430 ?auto_1095433 ) ) ( not ( = ?auto_1095430 ?auto_1095432 ) ) ( not ( = ?auto_1095430 ?auto_1095434 ) ) ( not ( = ?auto_1095430 ?auto_1095435 ) ) ( not ( = ?auto_1095430 ?auto_1095436 ) ) ( not ( = ?auto_1095430 ?auto_1095437 ) ) ( not ( = ?auto_1095430 ?auto_1095438 ) ) ( not ( = ?auto_1095430 ?auto_1095439 ) ) ( not ( = ?auto_1095430 ?auto_1095441 ) ) ( not ( = ?auto_1095427 ?auto_1095431 ) ) ( not ( = ?auto_1095427 ?auto_1095433 ) ) ( not ( = ?auto_1095427 ?auto_1095432 ) ) ( not ( = ?auto_1095427 ?auto_1095434 ) ) ( not ( = ?auto_1095427 ?auto_1095435 ) ) ( not ( = ?auto_1095427 ?auto_1095436 ) ) ( not ( = ?auto_1095427 ?auto_1095437 ) ) ( not ( = ?auto_1095427 ?auto_1095438 ) ) ( not ( = ?auto_1095427 ?auto_1095439 ) ) ( not ( = ?auto_1095427 ?auto_1095441 ) ) ( not ( = ?auto_1095431 ?auto_1095433 ) ) ( not ( = ?auto_1095431 ?auto_1095432 ) ) ( not ( = ?auto_1095431 ?auto_1095434 ) ) ( not ( = ?auto_1095431 ?auto_1095435 ) ) ( not ( = ?auto_1095431 ?auto_1095436 ) ) ( not ( = ?auto_1095431 ?auto_1095437 ) ) ( not ( = ?auto_1095431 ?auto_1095438 ) ) ( not ( = ?auto_1095431 ?auto_1095439 ) ) ( not ( = ?auto_1095431 ?auto_1095441 ) ) ( not ( = ?auto_1095433 ?auto_1095432 ) ) ( not ( = ?auto_1095433 ?auto_1095434 ) ) ( not ( = ?auto_1095433 ?auto_1095435 ) ) ( not ( = ?auto_1095433 ?auto_1095436 ) ) ( not ( = ?auto_1095433 ?auto_1095437 ) ) ( not ( = ?auto_1095433 ?auto_1095438 ) ) ( not ( = ?auto_1095433 ?auto_1095439 ) ) ( not ( = ?auto_1095433 ?auto_1095441 ) ) ( not ( = ?auto_1095432 ?auto_1095434 ) ) ( not ( = ?auto_1095432 ?auto_1095435 ) ) ( not ( = ?auto_1095432 ?auto_1095436 ) ) ( not ( = ?auto_1095432 ?auto_1095437 ) ) ( not ( = ?auto_1095432 ?auto_1095438 ) ) ( not ( = ?auto_1095432 ?auto_1095439 ) ) ( not ( = ?auto_1095432 ?auto_1095441 ) ) ( not ( = ?auto_1095434 ?auto_1095435 ) ) ( not ( = ?auto_1095434 ?auto_1095436 ) ) ( not ( = ?auto_1095434 ?auto_1095437 ) ) ( not ( = ?auto_1095434 ?auto_1095438 ) ) ( not ( = ?auto_1095434 ?auto_1095439 ) ) ( not ( = ?auto_1095434 ?auto_1095441 ) ) ( not ( = ?auto_1095435 ?auto_1095436 ) ) ( not ( = ?auto_1095435 ?auto_1095437 ) ) ( not ( = ?auto_1095435 ?auto_1095438 ) ) ( not ( = ?auto_1095435 ?auto_1095439 ) ) ( not ( = ?auto_1095435 ?auto_1095441 ) ) ( not ( = ?auto_1095436 ?auto_1095437 ) ) ( not ( = ?auto_1095436 ?auto_1095438 ) ) ( not ( = ?auto_1095436 ?auto_1095439 ) ) ( not ( = ?auto_1095436 ?auto_1095441 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1095437 ?auto_1095438 ?auto_1095439 )
      ( MAKE-12CRATE-VERIFY ?auto_1095428 ?auto_1095429 ?auto_1095430 ?auto_1095427 ?auto_1095431 ?auto_1095433 ?auto_1095432 ?auto_1095434 ?auto_1095435 ?auto_1095436 ?auto_1095437 ?auto_1095438 ?auto_1095439 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1095447 - SURFACE
      ?auto_1095448 - SURFACE
      ?auto_1095449 - SURFACE
      ?auto_1095446 - SURFACE
      ?auto_1095450 - SURFACE
      ?auto_1095452 - SURFACE
      ?auto_1095451 - SURFACE
      ?auto_1095453 - SURFACE
      ?auto_1095454 - SURFACE
      ?auto_1095455 - SURFACE
      ?auto_1095456 - SURFACE
      ?auto_1095457 - SURFACE
      ?auto_1095458 - SURFACE
      ?auto_1095459 - SURFACE
    )
    :vars
    (
      ?auto_1095462 - HOIST
      ?auto_1095464 - PLACE
      ?auto_1095465 - PLACE
      ?auto_1095463 - HOIST
      ?auto_1095461 - SURFACE
      ?auto_1095460 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1095462 ?auto_1095464 ) ( IS-CRATE ?auto_1095459 ) ( not ( = ?auto_1095458 ?auto_1095459 ) ) ( not ( = ?auto_1095457 ?auto_1095458 ) ) ( not ( = ?auto_1095457 ?auto_1095459 ) ) ( not ( = ?auto_1095465 ?auto_1095464 ) ) ( HOIST-AT ?auto_1095463 ?auto_1095465 ) ( not ( = ?auto_1095462 ?auto_1095463 ) ) ( SURFACE-AT ?auto_1095459 ?auto_1095465 ) ( ON ?auto_1095459 ?auto_1095461 ) ( CLEAR ?auto_1095459 ) ( not ( = ?auto_1095458 ?auto_1095461 ) ) ( not ( = ?auto_1095459 ?auto_1095461 ) ) ( not ( = ?auto_1095457 ?auto_1095461 ) ) ( SURFACE-AT ?auto_1095457 ?auto_1095464 ) ( CLEAR ?auto_1095457 ) ( IS-CRATE ?auto_1095458 ) ( AVAILABLE ?auto_1095462 ) ( TRUCK-AT ?auto_1095460 ?auto_1095465 ) ( LIFTING ?auto_1095463 ?auto_1095458 ) ( ON ?auto_1095448 ?auto_1095447 ) ( ON ?auto_1095449 ?auto_1095448 ) ( ON ?auto_1095446 ?auto_1095449 ) ( ON ?auto_1095450 ?auto_1095446 ) ( ON ?auto_1095452 ?auto_1095450 ) ( ON ?auto_1095451 ?auto_1095452 ) ( ON ?auto_1095453 ?auto_1095451 ) ( ON ?auto_1095454 ?auto_1095453 ) ( ON ?auto_1095455 ?auto_1095454 ) ( ON ?auto_1095456 ?auto_1095455 ) ( ON ?auto_1095457 ?auto_1095456 ) ( not ( = ?auto_1095447 ?auto_1095448 ) ) ( not ( = ?auto_1095447 ?auto_1095449 ) ) ( not ( = ?auto_1095447 ?auto_1095446 ) ) ( not ( = ?auto_1095447 ?auto_1095450 ) ) ( not ( = ?auto_1095447 ?auto_1095452 ) ) ( not ( = ?auto_1095447 ?auto_1095451 ) ) ( not ( = ?auto_1095447 ?auto_1095453 ) ) ( not ( = ?auto_1095447 ?auto_1095454 ) ) ( not ( = ?auto_1095447 ?auto_1095455 ) ) ( not ( = ?auto_1095447 ?auto_1095456 ) ) ( not ( = ?auto_1095447 ?auto_1095457 ) ) ( not ( = ?auto_1095447 ?auto_1095458 ) ) ( not ( = ?auto_1095447 ?auto_1095459 ) ) ( not ( = ?auto_1095447 ?auto_1095461 ) ) ( not ( = ?auto_1095448 ?auto_1095449 ) ) ( not ( = ?auto_1095448 ?auto_1095446 ) ) ( not ( = ?auto_1095448 ?auto_1095450 ) ) ( not ( = ?auto_1095448 ?auto_1095452 ) ) ( not ( = ?auto_1095448 ?auto_1095451 ) ) ( not ( = ?auto_1095448 ?auto_1095453 ) ) ( not ( = ?auto_1095448 ?auto_1095454 ) ) ( not ( = ?auto_1095448 ?auto_1095455 ) ) ( not ( = ?auto_1095448 ?auto_1095456 ) ) ( not ( = ?auto_1095448 ?auto_1095457 ) ) ( not ( = ?auto_1095448 ?auto_1095458 ) ) ( not ( = ?auto_1095448 ?auto_1095459 ) ) ( not ( = ?auto_1095448 ?auto_1095461 ) ) ( not ( = ?auto_1095449 ?auto_1095446 ) ) ( not ( = ?auto_1095449 ?auto_1095450 ) ) ( not ( = ?auto_1095449 ?auto_1095452 ) ) ( not ( = ?auto_1095449 ?auto_1095451 ) ) ( not ( = ?auto_1095449 ?auto_1095453 ) ) ( not ( = ?auto_1095449 ?auto_1095454 ) ) ( not ( = ?auto_1095449 ?auto_1095455 ) ) ( not ( = ?auto_1095449 ?auto_1095456 ) ) ( not ( = ?auto_1095449 ?auto_1095457 ) ) ( not ( = ?auto_1095449 ?auto_1095458 ) ) ( not ( = ?auto_1095449 ?auto_1095459 ) ) ( not ( = ?auto_1095449 ?auto_1095461 ) ) ( not ( = ?auto_1095446 ?auto_1095450 ) ) ( not ( = ?auto_1095446 ?auto_1095452 ) ) ( not ( = ?auto_1095446 ?auto_1095451 ) ) ( not ( = ?auto_1095446 ?auto_1095453 ) ) ( not ( = ?auto_1095446 ?auto_1095454 ) ) ( not ( = ?auto_1095446 ?auto_1095455 ) ) ( not ( = ?auto_1095446 ?auto_1095456 ) ) ( not ( = ?auto_1095446 ?auto_1095457 ) ) ( not ( = ?auto_1095446 ?auto_1095458 ) ) ( not ( = ?auto_1095446 ?auto_1095459 ) ) ( not ( = ?auto_1095446 ?auto_1095461 ) ) ( not ( = ?auto_1095450 ?auto_1095452 ) ) ( not ( = ?auto_1095450 ?auto_1095451 ) ) ( not ( = ?auto_1095450 ?auto_1095453 ) ) ( not ( = ?auto_1095450 ?auto_1095454 ) ) ( not ( = ?auto_1095450 ?auto_1095455 ) ) ( not ( = ?auto_1095450 ?auto_1095456 ) ) ( not ( = ?auto_1095450 ?auto_1095457 ) ) ( not ( = ?auto_1095450 ?auto_1095458 ) ) ( not ( = ?auto_1095450 ?auto_1095459 ) ) ( not ( = ?auto_1095450 ?auto_1095461 ) ) ( not ( = ?auto_1095452 ?auto_1095451 ) ) ( not ( = ?auto_1095452 ?auto_1095453 ) ) ( not ( = ?auto_1095452 ?auto_1095454 ) ) ( not ( = ?auto_1095452 ?auto_1095455 ) ) ( not ( = ?auto_1095452 ?auto_1095456 ) ) ( not ( = ?auto_1095452 ?auto_1095457 ) ) ( not ( = ?auto_1095452 ?auto_1095458 ) ) ( not ( = ?auto_1095452 ?auto_1095459 ) ) ( not ( = ?auto_1095452 ?auto_1095461 ) ) ( not ( = ?auto_1095451 ?auto_1095453 ) ) ( not ( = ?auto_1095451 ?auto_1095454 ) ) ( not ( = ?auto_1095451 ?auto_1095455 ) ) ( not ( = ?auto_1095451 ?auto_1095456 ) ) ( not ( = ?auto_1095451 ?auto_1095457 ) ) ( not ( = ?auto_1095451 ?auto_1095458 ) ) ( not ( = ?auto_1095451 ?auto_1095459 ) ) ( not ( = ?auto_1095451 ?auto_1095461 ) ) ( not ( = ?auto_1095453 ?auto_1095454 ) ) ( not ( = ?auto_1095453 ?auto_1095455 ) ) ( not ( = ?auto_1095453 ?auto_1095456 ) ) ( not ( = ?auto_1095453 ?auto_1095457 ) ) ( not ( = ?auto_1095453 ?auto_1095458 ) ) ( not ( = ?auto_1095453 ?auto_1095459 ) ) ( not ( = ?auto_1095453 ?auto_1095461 ) ) ( not ( = ?auto_1095454 ?auto_1095455 ) ) ( not ( = ?auto_1095454 ?auto_1095456 ) ) ( not ( = ?auto_1095454 ?auto_1095457 ) ) ( not ( = ?auto_1095454 ?auto_1095458 ) ) ( not ( = ?auto_1095454 ?auto_1095459 ) ) ( not ( = ?auto_1095454 ?auto_1095461 ) ) ( not ( = ?auto_1095455 ?auto_1095456 ) ) ( not ( = ?auto_1095455 ?auto_1095457 ) ) ( not ( = ?auto_1095455 ?auto_1095458 ) ) ( not ( = ?auto_1095455 ?auto_1095459 ) ) ( not ( = ?auto_1095455 ?auto_1095461 ) ) ( not ( = ?auto_1095456 ?auto_1095457 ) ) ( not ( = ?auto_1095456 ?auto_1095458 ) ) ( not ( = ?auto_1095456 ?auto_1095459 ) ) ( not ( = ?auto_1095456 ?auto_1095461 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1095457 ?auto_1095458 ?auto_1095459 )
      ( MAKE-13CRATE-VERIFY ?auto_1095447 ?auto_1095448 ?auto_1095449 ?auto_1095446 ?auto_1095450 ?auto_1095452 ?auto_1095451 ?auto_1095453 ?auto_1095454 ?auto_1095455 ?auto_1095456 ?auto_1095457 ?auto_1095458 ?auto_1095459 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1095585 - SURFACE
      ?auto_1095586 - SURFACE
      ?auto_1095587 - SURFACE
      ?auto_1095584 - SURFACE
      ?auto_1095588 - SURFACE
      ?auto_1095590 - SURFACE
      ?auto_1095589 - SURFACE
      ?auto_1095591 - SURFACE
      ?auto_1095592 - SURFACE
      ?auto_1095593 - SURFACE
      ?auto_1095594 - SURFACE
    )
    :vars
    (
      ?auto_1095598 - HOIST
      ?auto_1095601 - PLACE
      ?auto_1095599 - PLACE
      ?auto_1095597 - HOIST
      ?auto_1095600 - SURFACE
      ?auto_1095595 - TRUCK
      ?auto_1095596 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1095598 ?auto_1095601 ) ( IS-CRATE ?auto_1095594 ) ( not ( = ?auto_1095593 ?auto_1095594 ) ) ( not ( = ?auto_1095592 ?auto_1095593 ) ) ( not ( = ?auto_1095592 ?auto_1095594 ) ) ( not ( = ?auto_1095599 ?auto_1095601 ) ) ( HOIST-AT ?auto_1095597 ?auto_1095599 ) ( not ( = ?auto_1095598 ?auto_1095597 ) ) ( SURFACE-AT ?auto_1095594 ?auto_1095599 ) ( ON ?auto_1095594 ?auto_1095600 ) ( CLEAR ?auto_1095594 ) ( not ( = ?auto_1095593 ?auto_1095600 ) ) ( not ( = ?auto_1095594 ?auto_1095600 ) ) ( not ( = ?auto_1095592 ?auto_1095600 ) ) ( SURFACE-AT ?auto_1095592 ?auto_1095601 ) ( CLEAR ?auto_1095592 ) ( IS-CRATE ?auto_1095593 ) ( AVAILABLE ?auto_1095598 ) ( TRUCK-AT ?auto_1095595 ?auto_1095599 ) ( AVAILABLE ?auto_1095597 ) ( SURFACE-AT ?auto_1095593 ?auto_1095599 ) ( ON ?auto_1095593 ?auto_1095596 ) ( CLEAR ?auto_1095593 ) ( not ( = ?auto_1095593 ?auto_1095596 ) ) ( not ( = ?auto_1095594 ?auto_1095596 ) ) ( not ( = ?auto_1095592 ?auto_1095596 ) ) ( not ( = ?auto_1095600 ?auto_1095596 ) ) ( ON ?auto_1095586 ?auto_1095585 ) ( ON ?auto_1095587 ?auto_1095586 ) ( ON ?auto_1095584 ?auto_1095587 ) ( ON ?auto_1095588 ?auto_1095584 ) ( ON ?auto_1095590 ?auto_1095588 ) ( ON ?auto_1095589 ?auto_1095590 ) ( ON ?auto_1095591 ?auto_1095589 ) ( ON ?auto_1095592 ?auto_1095591 ) ( not ( = ?auto_1095585 ?auto_1095586 ) ) ( not ( = ?auto_1095585 ?auto_1095587 ) ) ( not ( = ?auto_1095585 ?auto_1095584 ) ) ( not ( = ?auto_1095585 ?auto_1095588 ) ) ( not ( = ?auto_1095585 ?auto_1095590 ) ) ( not ( = ?auto_1095585 ?auto_1095589 ) ) ( not ( = ?auto_1095585 ?auto_1095591 ) ) ( not ( = ?auto_1095585 ?auto_1095592 ) ) ( not ( = ?auto_1095585 ?auto_1095593 ) ) ( not ( = ?auto_1095585 ?auto_1095594 ) ) ( not ( = ?auto_1095585 ?auto_1095600 ) ) ( not ( = ?auto_1095585 ?auto_1095596 ) ) ( not ( = ?auto_1095586 ?auto_1095587 ) ) ( not ( = ?auto_1095586 ?auto_1095584 ) ) ( not ( = ?auto_1095586 ?auto_1095588 ) ) ( not ( = ?auto_1095586 ?auto_1095590 ) ) ( not ( = ?auto_1095586 ?auto_1095589 ) ) ( not ( = ?auto_1095586 ?auto_1095591 ) ) ( not ( = ?auto_1095586 ?auto_1095592 ) ) ( not ( = ?auto_1095586 ?auto_1095593 ) ) ( not ( = ?auto_1095586 ?auto_1095594 ) ) ( not ( = ?auto_1095586 ?auto_1095600 ) ) ( not ( = ?auto_1095586 ?auto_1095596 ) ) ( not ( = ?auto_1095587 ?auto_1095584 ) ) ( not ( = ?auto_1095587 ?auto_1095588 ) ) ( not ( = ?auto_1095587 ?auto_1095590 ) ) ( not ( = ?auto_1095587 ?auto_1095589 ) ) ( not ( = ?auto_1095587 ?auto_1095591 ) ) ( not ( = ?auto_1095587 ?auto_1095592 ) ) ( not ( = ?auto_1095587 ?auto_1095593 ) ) ( not ( = ?auto_1095587 ?auto_1095594 ) ) ( not ( = ?auto_1095587 ?auto_1095600 ) ) ( not ( = ?auto_1095587 ?auto_1095596 ) ) ( not ( = ?auto_1095584 ?auto_1095588 ) ) ( not ( = ?auto_1095584 ?auto_1095590 ) ) ( not ( = ?auto_1095584 ?auto_1095589 ) ) ( not ( = ?auto_1095584 ?auto_1095591 ) ) ( not ( = ?auto_1095584 ?auto_1095592 ) ) ( not ( = ?auto_1095584 ?auto_1095593 ) ) ( not ( = ?auto_1095584 ?auto_1095594 ) ) ( not ( = ?auto_1095584 ?auto_1095600 ) ) ( not ( = ?auto_1095584 ?auto_1095596 ) ) ( not ( = ?auto_1095588 ?auto_1095590 ) ) ( not ( = ?auto_1095588 ?auto_1095589 ) ) ( not ( = ?auto_1095588 ?auto_1095591 ) ) ( not ( = ?auto_1095588 ?auto_1095592 ) ) ( not ( = ?auto_1095588 ?auto_1095593 ) ) ( not ( = ?auto_1095588 ?auto_1095594 ) ) ( not ( = ?auto_1095588 ?auto_1095600 ) ) ( not ( = ?auto_1095588 ?auto_1095596 ) ) ( not ( = ?auto_1095590 ?auto_1095589 ) ) ( not ( = ?auto_1095590 ?auto_1095591 ) ) ( not ( = ?auto_1095590 ?auto_1095592 ) ) ( not ( = ?auto_1095590 ?auto_1095593 ) ) ( not ( = ?auto_1095590 ?auto_1095594 ) ) ( not ( = ?auto_1095590 ?auto_1095600 ) ) ( not ( = ?auto_1095590 ?auto_1095596 ) ) ( not ( = ?auto_1095589 ?auto_1095591 ) ) ( not ( = ?auto_1095589 ?auto_1095592 ) ) ( not ( = ?auto_1095589 ?auto_1095593 ) ) ( not ( = ?auto_1095589 ?auto_1095594 ) ) ( not ( = ?auto_1095589 ?auto_1095600 ) ) ( not ( = ?auto_1095589 ?auto_1095596 ) ) ( not ( = ?auto_1095591 ?auto_1095592 ) ) ( not ( = ?auto_1095591 ?auto_1095593 ) ) ( not ( = ?auto_1095591 ?auto_1095594 ) ) ( not ( = ?auto_1095591 ?auto_1095600 ) ) ( not ( = ?auto_1095591 ?auto_1095596 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1095592 ?auto_1095593 ?auto_1095594 )
      ( MAKE-10CRATE-VERIFY ?auto_1095585 ?auto_1095586 ?auto_1095587 ?auto_1095584 ?auto_1095588 ?auto_1095590 ?auto_1095589 ?auto_1095591 ?auto_1095592 ?auto_1095593 ?auto_1095594 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1095603 - SURFACE
      ?auto_1095604 - SURFACE
      ?auto_1095605 - SURFACE
      ?auto_1095602 - SURFACE
      ?auto_1095606 - SURFACE
      ?auto_1095608 - SURFACE
      ?auto_1095607 - SURFACE
      ?auto_1095609 - SURFACE
      ?auto_1095610 - SURFACE
      ?auto_1095611 - SURFACE
      ?auto_1095612 - SURFACE
      ?auto_1095613 - SURFACE
    )
    :vars
    (
      ?auto_1095617 - HOIST
      ?auto_1095620 - PLACE
      ?auto_1095618 - PLACE
      ?auto_1095616 - HOIST
      ?auto_1095619 - SURFACE
      ?auto_1095614 - TRUCK
      ?auto_1095615 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1095617 ?auto_1095620 ) ( IS-CRATE ?auto_1095613 ) ( not ( = ?auto_1095612 ?auto_1095613 ) ) ( not ( = ?auto_1095611 ?auto_1095612 ) ) ( not ( = ?auto_1095611 ?auto_1095613 ) ) ( not ( = ?auto_1095618 ?auto_1095620 ) ) ( HOIST-AT ?auto_1095616 ?auto_1095618 ) ( not ( = ?auto_1095617 ?auto_1095616 ) ) ( SURFACE-AT ?auto_1095613 ?auto_1095618 ) ( ON ?auto_1095613 ?auto_1095619 ) ( CLEAR ?auto_1095613 ) ( not ( = ?auto_1095612 ?auto_1095619 ) ) ( not ( = ?auto_1095613 ?auto_1095619 ) ) ( not ( = ?auto_1095611 ?auto_1095619 ) ) ( SURFACE-AT ?auto_1095611 ?auto_1095620 ) ( CLEAR ?auto_1095611 ) ( IS-CRATE ?auto_1095612 ) ( AVAILABLE ?auto_1095617 ) ( TRUCK-AT ?auto_1095614 ?auto_1095618 ) ( AVAILABLE ?auto_1095616 ) ( SURFACE-AT ?auto_1095612 ?auto_1095618 ) ( ON ?auto_1095612 ?auto_1095615 ) ( CLEAR ?auto_1095612 ) ( not ( = ?auto_1095612 ?auto_1095615 ) ) ( not ( = ?auto_1095613 ?auto_1095615 ) ) ( not ( = ?auto_1095611 ?auto_1095615 ) ) ( not ( = ?auto_1095619 ?auto_1095615 ) ) ( ON ?auto_1095604 ?auto_1095603 ) ( ON ?auto_1095605 ?auto_1095604 ) ( ON ?auto_1095602 ?auto_1095605 ) ( ON ?auto_1095606 ?auto_1095602 ) ( ON ?auto_1095608 ?auto_1095606 ) ( ON ?auto_1095607 ?auto_1095608 ) ( ON ?auto_1095609 ?auto_1095607 ) ( ON ?auto_1095610 ?auto_1095609 ) ( ON ?auto_1095611 ?auto_1095610 ) ( not ( = ?auto_1095603 ?auto_1095604 ) ) ( not ( = ?auto_1095603 ?auto_1095605 ) ) ( not ( = ?auto_1095603 ?auto_1095602 ) ) ( not ( = ?auto_1095603 ?auto_1095606 ) ) ( not ( = ?auto_1095603 ?auto_1095608 ) ) ( not ( = ?auto_1095603 ?auto_1095607 ) ) ( not ( = ?auto_1095603 ?auto_1095609 ) ) ( not ( = ?auto_1095603 ?auto_1095610 ) ) ( not ( = ?auto_1095603 ?auto_1095611 ) ) ( not ( = ?auto_1095603 ?auto_1095612 ) ) ( not ( = ?auto_1095603 ?auto_1095613 ) ) ( not ( = ?auto_1095603 ?auto_1095619 ) ) ( not ( = ?auto_1095603 ?auto_1095615 ) ) ( not ( = ?auto_1095604 ?auto_1095605 ) ) ( not ( = ?auto_1095604 ?auto_1095602 ) ) ( not ( = ?auto_1095604 ?auto_1095606 ) ) ( not ( = ?auto_1095604 ?auto_1095608 ) ) ( not ( = ?auto_1095604 ?auto_1095607 ) ) ( not ( = ?auto_1095604 ?auto_1095609 ) ) ( not ( = ?auto_1095604 ?auto_1095610 ) ) ( not ( = ?auto_1095604 ?auto_1095611 ) ) ( not ( = ?auto_1095604 ?auto_1095612 ) ) ( not ( = ?auto_1095604 ?auto_1095613 ) ) ( not ( = ?auto_1095604 ?auto_1095619 ) ) ( not ( = ?auto_1095604 ?auto_1095615 ) ) ( not ( = ?auto_1095605 ?auto_1095602 ) ) ( not ( = ?auto_1095605 ?auto_1095606 ) ) ( not ( = ?auto_1095605 ?auto_1095608 ) ) ( not ( = ?auto_1095605 ?auto_1095607 ) ) ( not ( = ?auto_1095605 ?auto_1095609 ) ) ( not ( = ?auto_1095605 ?auto_1095610 ) ) ( not ( = ?auto_1095605 ?auto_1095611 ) ) ( not ( = ?auto_1095605 ?auto_1095612 ) ) ( not ( = ?auto_1095605 ?auto_1095613 ) ) ( not ( = ?auto_1095605 ?auto_1095619 ) ) ( not ( = ?auto_1095605 ?auto_1095615 ) ) ( not ( = ?auto_1095602 ?auto_1095606 ) ) ( not ( = ?auto_1095602 ?auto_1095608 ) ) ( not ( = ?auto_1095602 ?auto_1095607 ) ) ( not ( = ?auto_1095602 ?auto_1095609 ) ) ( not ( = ?auto_1095602 ?auto_1095610 ) ) ( not ( = ?auto_1095602 ?auto_1095611 ) ) ( not ( = ?auto_1095602 ?auto_1095612 ) ) ( not ( = ?auto_1095602 ?auto_1095613 ) ) ( not ( = ?auto_1095602 ?auto_1095619 ) ) ( not ( = ?auto_1095602 ?auto_1095615 ) ) ( not ( = ?auto_1095606 ?auto_1095608 ) ) ( not ( = ?auto_1095606 ?auto_1095607 ) ) ( not ( = ?auto_1095606 ?auto_1095609 ) ) ( not ( = ?auto_1095606 ?auto_1095610 ) ) ( not ( = ?auto_1095606 ?auto_1095611 ) ) ( not ( = ?auto_1095606 ?auto_1095612 ) ) ( not ( = ?auto_1095606 ?auto_1095613 ) ) ( not ( = ?auto_1095606 ?auto_1095619 ) ) ( not ( = ?auto_1095606 ?auto_1095615 ) ) ( not ( = ?auto_1095608 ?auto_1095607 ) ) ( not ( = ?auto_1095608 ?auto_1095609 ) ) ( not ( = ?auto_1095608 ?auto_1095610 ) ) ( not ( = ?auto_1095608 ?auto_1095611 ) ) ( not ( = ?auto_1095608 ?auto_1095612 ) ) ( not ( = ?auto_1095608 ?auto_1095613 ) ) ( not ( = ?auto_1095608 ?auto_1095619 ) ) ( not ( = ?auto_1095608 ?auto_1095615 ) ) ( not ( = ?auto_1095607 ?auto_1095609 ) ) ( not ( = ?auto_1095607 ?auto_1095610 ) ) ( not ( = ?auto_1095607 ?auto_1095611 ) ) ( not ( = ?auto_1095607 ?auto_1095612 ) ) ( not ( = ?auto_1095607 ?auto_1095613 ) ) ( not ( = ?auto_1095607 ?auto_1095619 ) ) ( not ( = ?auto_1095607 ?auto_1095615 ) ) ( not ( = ?auto_1095609 ?auto_1095610 ) ) ( not ( = ?auto_1095609 ?auto_1095611 ) ) ( not ( = ?auto_1095609 ?auto_1095612 ) ) ( not ( = ?auto_1095609 ?auto_1095613 ) ) ( not ( = ?auto_1095609 ?auto_1095619 ) ) ( not ( = ?auto_1095609 ?auto_1095615 ) ) ( not ( = ?auto_1095610 ?auto_1095611 ) ) ( not ( = ?auto_1095610 ?auto_1095612 ) ) ( not ( = ?auto_1095610 ?auto_1095613 ) ) ( not ( = ?auto_1095610 ?auto_1095619 ) ) ( not ( = ?auto_1095610 ?auto_1095615 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1095611 ?auto_1095612 ?auto_1095613 )
      ( MAKE-11CRATE-VERIFY ?auto_1095603 ?auto_1095604 ?auto_1095605 ?auto_1095602 ?auto_1095606 ?auto_1095608 ?auto_1095607 ?auto_1095609 ?auto_1095610 ?auto_1095611 ?auto_1095612 ?auto_1095613 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1095622 - SURFACE
      ?auto_1095623 - SURFACE
      ?auto_1095624 - SURFACE
      ?auto_1095621 - SURFACE
      ?auto_1095625 - SURFACE
      ?auto_1095627 - SURFACE
      ?auto_1095626 - SURFACE
      ?auto_1095628 - SURFACE
      ?auto_1095629 - SURFACE
      ?auto_1095630 - SURFACE
      ?auto_1095631 - SURFACE
      ?auto_1095632 - SURFACE
      ?auto_1095633 - SURFACE
    )
    :vars
    (
      ?auto_1095637 - HOIST
      ?auto_1095640 - PLACE
      ?auto_1095638 - PLACE
      ?auto_1095636 - HOIST
      ?auto_1095639 - SURFACE
      ?auto_1095634 - TRUCK
      ?auto_1095635 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1095637 ?auto_1095640 ) ( IS-CRATE ?auto_1095633 ) ( not ( = ?auto_1095632 ?auto_1095633 ) ) ( not ( = ?auto_1095631 ?auto_1095632 ) ) ( not ( = ?auto_1095631 ?auto_1095633 ) ) ( not ( = ?auto_1095638 ?auto_1095640 ) ) ( HOIST-AT ?auto_1095636 ?auto_1095638 ) ( not ( = ?auto_1095637 ?auto_1095636 ) ) ( SURFACE-AT ?auto_1095633 ?auto_1095638 ) ( ON ?auto_1095633 ?auto_1095639 ) ( CLEAR ?auto_1095633 ) ( not ( = ?auto_1095632 ?auto_1095639 ) ) ( not ( = ?auto_1095633 ?auto_1095639 ) ) ( not ( = ?auto_1095631 ?auto_1095639 ) ) ( SURFACE-AT ?auto_1095631 ?auto_1095640 ) ( CLEAR ?auto_1095631 ) ( IS-CRATE ?auto_1095632 ) ( AVAILABLE ?auto_1095637 ) ( TRUCK-AT ?auto_1095634 ?auto_1095638 ) ( AVAILABLE ?auto_1095636 ) ( SURFACE-AT ?auto_1095632 ?auto_1095638 ) ( ON ?auto_1095632 ?auto_1095635 ) ( CLEAR ?auto_1095632 ) ( not ( = ?auto_1095632 ?auto_1095635 ) ) ( not ( = ?auto_1095633 ?auto_1095635 ) ) ( not ( = ?auto_1095631 ?auto_1095635 ) ) ( not ( = ?auto_1095639 ?auto_1095635 ) ) ( ON ?auto_1095623 ?auto_1095622 ) ( ON ?auto_1095624 ?auto_1095623 ) ( ON ?auto_1095621 ?auto_1095624 ) ( ON ?auto_1095625 ?auto_1095621 ) ( ON ?auto_1095627 ?auto_1095625 ) ( ON ?auto_1095626 ?auto_1095627 ) ( ON ?auto_1095628 ?auto_1095626 ) ( ON ?auto_1095629 ?auto_1095628 ) ( ON ?auto_1095630 ?auto_1095629 ) ( ON ?auto_1095631 ?auto_1095630 ) ( not ( = ?auto_1095622 ?auto_1095623 ) ) ( not ( = ?auto_1095622 ?auto_1095624 ) ) ( not ( = ?auto_1095622 ?auto_1095621 ) ) ( not ( = ?auto_1095622 ?auto_1095625 ) ) ( not ( = ?auto_1095622 ?auto_1095627 ) ) ( not ( = ?auto_1095622 ?auto_1095626 ) ) ( not ( = ?auto_1095622 ?auto_1095628 ) ) ( not ( = ?auto_1095622 ?auto_1095629 ) ) ( not ( = ?auto_1095622 ?auto_1095630 ) ) ( not ( = ?auto_1095622 ?auto_1095631 ) ) ( not ( = ?auto_1095622 ?auto_1095632 ) ) ( not ( = ?auto_1095622 ?auto_1095633 ) ) ( not ( = ?auto_1095622 ?auto_1095639 ) ) ( not ( = ?auto_1095622 ?auto_1095635 ) ) ( not ( = ?auto_1095623 ?auto_1095624 ) ) ( not ( = ?auto_1095623 ?auto_1095621 ) ) ( not ( = ?auto_1095623 ?auto_1095625 ) ) ( not ( = ?auto_1095623 ?auto_1095627 ) ) ( not ( = ?auto_1095623 ?auto_1095626 ) ) ( not ( = ?auto_1095623 ?auto_1095628 ) ) ( not ( = ?auto_1095623 ?auto_1095629 ) ) ( not ( = ?auto_1095623 ?auto_1095630 ) ) ( not ( = ?auto_1095623 ?auto_1095631 ) ) ( not ( = ?auto_1095623 ?auto_1095632 ) ) ( not ( = ?auto_1095623 ?auto_1095633 ) ) ( not ( = ?auto_1095623 ?auto_1095639 ) ) ( not ( = ?auto_1095623 ?auto_1095635 ) ) ( not ( = ?auto_1095624 ?auto_1095621 ) ) ( not ( = ?auto_1095624 ?auto_1095625 ) ) ( not ( = ?auto_1095624 ?auto_1095627 ) ) ( not ( = ?auto_1095624 ?auto_1095626 ) ) ( not ( = ?auto_1095624 ?auto_1095628 ) ) ( not ( = ?auto_1095624 ?auto_1095629 ) ) ( not ( = ?auto_1095624 ?auto_1095630 ) ) ( not ( = ?auto_1095624 ?auto_1095631 ) ) ( not ( = ?auto_1095624 ?auto_1095632 ) ) ( not ( = ?auto_1095624 ?auto_1095633 ) ) ( not ( = ?auto_1095624 ?auto_1095639 ) ) ( not ( = ?auto_1095624 ?auto_1095635 ) ) ( not ( = ?auto_1095621 ?auto_1095625 ) ) ( not ( = ?auto_1095621 ?auto_1095627 ) ) ( not ( = ?auto_1095621 ?auto_1095626 ) ) ( not ( = ?auto_1095621 ?auto_1095628 ) ) ( not ( = ?auto_1095621 ?auto_1095629 ) ) ( not ( = ?auto_1095621 ?auto_1095630 ) ) ( not ( = ?auto_1095621 ?auto_1095631 ) ) ( not ( = ?auto_1095621 ?auto_1095632 ) ) ( not ( = ?auto_1095621 ?auto_1095633 ) ) ( not ( = ?auto_1095621 ?auto_1095639 ) ) ( not ( = ?auto_1095621 ?auto_1095635 ) ) ( not ( = ?auto_1095625 ?auto_1095627 ) ) ( not ( = ?auto_1095625 ?auto_1095626 ) ) ( not ( = ?auto_1095625 ?auto_1095628 ) ) ( not ( = ?auto_1095625 ?auto_1095629 ) ) ( not ( = ?auto_1095625 ?auto_1095630 ) ) ( not ( = ?auto_1095625 ?auto_1095631 ) ) ( not ( = ?auto_1095625 ?auto_1095632 ) ) ( not ( = ?auto_1095625 ?auto_1095633 ) ) ( not ( = ?auto_1095625 ?auto_1095639 ) ) ( not ( = ?auto_1095625 ?auto_1095635 ) ) ( not ( = ?auto_1095627 ?auto_1095626 ) ) ( not ( = ?auto_1095627 ?auto_1095628 ) ) ( not ( = ?auto_1095627 ?auto_1095629 ) ) ( not ( = ?auto_1095627 ?auto_1095630 ) ) ( not ( = ?auto_1095627 ?auto_1095631 ) ) ( not ( = ?auto_1095627 ?auto_1095632 ) ) ( not ( = ?auto_1095627 ?auto_1095633 ) ) ( not ( = ?auto_1095627 ?auto_1095639 ) ) ( not ( = ?auto_1095627 ?auto_1095635 ) ) ( not ( = ?auto_1095626 ?auto_1095628 ) ) ( not ( = ?auto_1095626 ?auto_1095629 ) ) ( not ( = ?auto_1095626 ?auto_1095630 ) ) ( not ( = ?auto_1095626 ?auto_1095631 ) ) ( not ( = ?auto_1095626 ?auto_1095632 ) ) ( not ( = ?auto_1095626 ?auto_1095633 ) ) ( not ( = ?auto_1095626 ?auto_1095639 ) ) ( not ( = ?auto_1095626 ?auto_1095635 ) ) ( not ( = ?auto_1095628 ?auto_1095629 ) ) ( not ( = ?auto_1095628 ?auto_1095630 ) ) ( not ( = ?auto_1095628 ?auto_1095631 ) ) ( not ( = ?auto_1095628 ?auto_1095632 ) ) ( not ( = ?auto_1095628 ?auto_1095633 ) ) ( not ( = ?auto_1095628 ?auto_1095639 ) ) ( not ( = ?auto_1095628 ?auto_1095635 ) ) ( not ( = ?auto_1095629 ?auto_1095630 ) ) ( not ( = ?auto_1095629 ?auto_1095631 ) ) ( not ( = ?auto_1095629 ?auto_1095632 ) ) ( not ( = ?auto_1095629 ?auto_1095633 ) ) ( not ( = ?auto_1095629 ?auto_1095639 ) ) ( not ( = ?auto_1095629 ?auto_1095635 ) ) ( not ( = ?auto_1095630 ?auto_1095631 ) ) ( not ( = ?auto_1095630 ?auto_1095632 ) ) ( not ( = ?auto_1095630 ?auto_1095633 ) ) ( not ( = ?auto_1095630 ?auto_1095639 ) ) ( not ( = ?auto_1095630 ?auto_1095635 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1095631 ?auto_1095632 ?auto_1095633 )
      ( MAKE-12CRATE-VERIFY ?auto_1095622 ?auto_1095623 ?auto_1095624 ?auto_1095621 ?auto_1095625 ?auto_1095627 ?auto_1095626 ?auto_1095628 ?auto_1095629 ?auto_1095630 ?auto_1095631 ?auto_1095632 ?auto_1095633 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1095642 - SURFACE
      ?auto_1095643 - SURFACE
      ?auto_1095644 - SURFACE
      ?auto_1095641 - SURFACE
      ?auto_1095645 - SURFACE
      ?auto_1095647 - SURFACE
      ?auto_1095646 - SURFACE
      ?auto_1095648 - SURFACE
      ?auto_1095649 - SURFACE
      ?auto_1095650 - SURFACE
      ?auto_1095651 - SURFACE
      ?auto_1095652 - SURFACE
      ?auto_1095653 - SURFACE
      ?auto_1095654 - SURFACE
    )
    :vars
    (
      ?auto_1095658 - HOIST
      ?auto_1095661 - PLACE
      ?auto_1095659 - PLACE
      ?auto_1095657 - HOIST
      ?auto_1095660 - SURFACE
      ?auto_1095655 - TRUCK
      ?auto_1095656 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1095658 ?auto_1095661 ) ( IS-CRATE ?auto_1095654 ) ( not ( = ?auto_1095653 ?auto_1095654 ) ) ( not ( = ?auto_1095652 ?auto_1095653 ) ) ( not ( = ?auto_1095652 ?auto_1095654 ) ) ( not ( = ?auto_1095659 ?auto_1095661 ) ) ( HOIST-AT ?auto_1095657 ?auto_1095659 ) ( not ( = ?auto_1095658 ?auto_1095657 ) ) ( SURFACE-AT ?auto_1095654 ?auto_1095659 ) ( ON ?auto_1095654 ?auto_1095660 ) ( CLEAR ?auto_1095654 ) ( not ( = ?auto_1095653 ?auto_1095660 ) ) ( not ( = ?auto_1095654 ?auto_1095660 ) ) ( not ( = ?auto_1095652 ?auto_1095660 ) ) ( SURFACE-AT ?auto_1095652 ?auto_1095661 ) ( CLEAR ?auto_1095652 ) ( IS-CRATE ?auto_1095653 ) ( AVAILABLE ?auto_1095658 ) ( TRUCK-AT ?auto_1095655 ?auto_1095659 ) ( AVAILABLE ?auto_1095657 ) ( SURFACE-AT ?auto_1095653 ?auto_1095659 ) ( ON ?auto_1095653 ?auto_1095656 ) ( CLEAR ?auto_1095653 ) ( not ( = ?auto_1095653 ?auto_1095656 ) ) ( not ( = ?auto_1095654 ?auto_1095656 ) ) ( not ( = ?auto_1095652 ?auto_1095656 ) ) ( not ( = ?auto_1095660 ?auto_1095656 ) ) ( ON ?auto_1095643 ?auto_1095642 ) ( ON ?auto_1095644 ?auto_1095643 ) ( ON ?auto_1095641 ?auto_1095644 ) ( ON ?auto_1095645 ?auto_1095641 ) ( ON ?auto_1095647 ?auto_1095645 ) ( ON ?auto_1095646 ?auto_1095647 ) ( ON ?auto_1095648 ?auto_1095646 ) ( ON ?auto_1095649 ?auto_1095648 ) ( ON ?auto_1095650 ?auto_1095649 ) ( ON ?auto_1095651 ?auto_1095650 ) ( ON ?auto_1095652 ?auto_1095651 ) ( not ( = ?auto_1095642 ?auto_1095643 ) ) ( not ( = ?auto_1095642 ?auto_1095644 ) ) ( not ( = ?auto_1095642 ?auto_1095641 ) ) ( not ( = ?auto_1095642 ?auto_1095645 ) ) ( not ( = ?auto_1095642 ?auto_1095647 ) ) ( not ( = ?auto_1095642 ?auto_1095646 ) ) ( not ( = ?auto_1095642 ?auto_1095648 ) ) ( not ( = ?auto_1095642 ?auto_1095649 ) ) ( not ( = ?auto_1095642 ?auto_1095650 ) ) ( not ( = ?auto_1095642 ?auto_1095651 ) ) ( not ( = ?auto_1095642 ?auto_1095652 ) ) ( not ( = ?auto_1095642 ?auto_1095653 ) ) ( not ( = ?auto_1095642 ?auto_1095654 ) ) ( not ( = ?auto_1095642 ?auto_1095660 ) ) ( not ( = ?auto_1095642 ?auto_1095656 ) ) ( not ( = ?auto_1095643 ?auto_1095644 ) ) ( not ( = ?auto_1095643 ?auto_1095641 ) ) ( not ( = ?auto_1095643 ?auto_1095645 ) ) ( not ( = ?auto_1095643 ?auto_1095647 ) ) ( not ( = ?auto_1095643 ?auto_1095646 ) ) ( not ( = ?auto_1095643 ?auto_1095648 ) ) ( not ( = ?auto_1095643 ?auto_1095649 ) ) ( not ( = ?auto_1095643 ?auto_1095650 ) ) ( not ( = ?auto_1095643 ?auto_1095651 ) ) ( not ( = ?auto_1095643 ?auto_1095652 ) ) ( not ( = ?auto_1095643 ?auto_1095653 ) ) ( not ( = ?auto_1095643 ?auto_1095654 ) ) ( not ( = ?auto_1095643 ?auto_1095660 ) ) ( not ( = ?auto_1095643 ?auto_1095656 ) ) ( not ( = ?auto_1095644 ?auto_1095641 ) ) ( not ( = ?auto_1095644 ?auto_1095645 ) ) ( not ( = ?auto_1095644 ?auto_1095647 ) ) ( not ( = ?auto_1095644 ?auto_1095646 ) ) ( not ( = ?auto_1095644 ?auto_1095648 ) ) ( not ( = ?auto_1095644 ?auto_1095649 ) ) ( not ( = ?auto_1095644 ?auto_1095650 ) ) ( not ( = ?auto_1095644 ?auto_1095651 ) ) ( not ( = ?auto_1095644 ?auto_1095652 ) ) ( not ( = ?auto_1095644 ?auto_1095653 ) ) ( not ( = ?auto_1095644 ?auto_1095654 ) ) ( not ( = ?auto_1095644 ?auto_1095660 ) ) ( not ( = ?auto_1095644 ?auto_1095656 ) ) ( not ( = ?auto_1095641 ?auto_1095645 ) ) ( not ( = ?auto_1095641 ?auto_1095647 ) ) ( not ( = ?auto_1095641 ?auto_1095646 ) ) ( not ( = ?auto_1095641 ?auto_1095648 ) ) ( not ( = ?auto_1095641 ?auto_1095649 ) ) ( not ( = ?auto_1095641 ?auto_1095650 ) ) ( not ( = ?auto_1095641 ?auto_1095651 ) ) ( not ( = ?auto_1095641 ?auto_1095652 ) ) ( not ( = ?auto_1095641 ?auto_1095653 ) ) ( not ( = ?auto_1095641 ?auto_1095654 ) ) ( not ( = ?auto_1095641 ?auto_1095660 ) ) ( not ( = ?auto_1095641 ?auto_1095656 ) ) ( not ( = ?auto_1095645 ?auto_1095647 ) ) ( not ( = ?auto_1095645 ?auto_1095646 ) ) ( not ( = ?auto_1095645 ?auto_1095648 ) ) ( not ( = ?auto_1095645 ?auto_1095649 ) ) ( not ( = ?auto_1095645 ?auto_1095650 ) ) ( not ( = ?auto_1095645 ?auto_1095651 ) ) ( not ( = ?auto_1095645 ?auto_1095652 ) ) ( not ( = ?auto_1095645 ?auto_1095653 ) ) ( not ( = ?auto_1095645 ?auto_1095654 ) ) ( not ( = ?auto_1095645 ?auto_1095660 ) ) ( not ( = ?auto_1095645 ?auto_1095656 ) ) ( not ( = ?auto_1095647 ?auto_1095646 ) ) ( not ( = ?auto_1095647 ?auto_1095648 ) ) ( not ( = ?auto_1095647 ?auto_1095649 ) ) ( not ( = ?auto_1095647 ?auto_1095650 ) ) ( not ( = ?auto_1095647 ?auto_1095651 ) ) ( not ( = ?auto_1095647 ?auto_1095652 ) ) ( not ( = ?auto_1095647 ?auto_1095653 ) ) ( not ( = ?auto_1095647 ?auto_1095654 ) ) ( not ( = ?auto_1095647 ?auto_1095660 ) ) ( not ( = ?auto_1095647 ?auto_1095656 ) ) ( not ( = ?auto_1095646 ?auto_1095648 ) ) ( not ( = ?auto_1095646 ?auto_1095649 ) ) ( not ( = ?auto_1095646 ?auto_1095650 ) ) ( not ( = ?auto_1095646 ?auto_1095651 ) ) ( not ( = ?auto_1095646 ?auto_1095652 ) ) ( not ( = ?auto_1095646 ?auto_1095653 ) ) ( not ( = ?auto_1095646 ?auto_1095654 ) ) ( not ( = ?auto_1095646 ?auto_1095660 ) ) ( not ( = ?auto_1095646 ?auto_1095656 ) ) ( not ( = ?auto_1095648 ?auto_1095649 ) ) ( not ( = ?auto_1095648 ?auto_1095650 ) ) ( not ( = ?auto_1095648 ?auto_1095651 ) ) ( not ( = ?auto_1095648 ?auto_1095652 ) ) ( not ( = ?auto_1095648 ?auto_1095653 ) ) ( not ( = ?auto_1095648 ?auto_1095654 ) ) ( not ( = ?auto_1095648 ?auto_1095660 ) ) ( not ( = ?auto_1095648 ?auto_1095656 ) ) ( not ( = ?auto_1095649 ?auto_1095650 ) ) ( not ( = ?auto_1095649 ?auto_1095651 ) ) ( not ( = ?auto_1095649 ?auto_1095652 ) ) ( not ( = ?auto_1095649 ?auto_1095653 ) ) ( not ( = ?auto_1095649 ?auto_1095654 ) ) ( not ( = ?auto_1095649 ?auto_1095660 ) ) ( not ( = ?auto_1095649 ?auto_1095656 ) ) ( not ( = ?auto_1095650 ?auto_1095651 ) ) ( not ( = ?auto_1095650 ?auto_1095652 ) ) ( not ( = ?auto_1095650 ?auto_1095653 ) ) ( not ( = ?auto_1095650 ?auto_1095654 ) ) ( not ( = ?auto_1095650 ?auto_1095660 ) ) ( not ( = ?auto_1095650 ?auto_1095656 ) ) ( not ( = ?auto_1095651 ?auto_1095652 ) ) ( not ( = ?auto_1095651 ?auto_1095653 ) ) ( not ( = ?auto_1095651 ?auto_1095654 ) ) ( not ( = ?auto_1095651 ?auto_1095660 ) ) ( not ( = ?auto_1095651 ?auto_1095656 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1095652 ?auto_1095653 ?auto_1095654 )
      ( MAKE-13CRATE-VERIFY ?auto_1095642 ?auto_1095643 ?auto_1095644 ?auto_1095641 ?auto_1095645 ?auto_1095647 ?auto_1095646 ?auto_1095648 ?auto_1095649 ?auto_1095650 ?auto_1095651 ?auto_1095652 ?auto_1095653 ?auto_1095654 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1095781 - SURFACE
      ?auto_1095782 - SURFACE
      ?auto_1095783 - SURFACE
      ?auto_1095780 - SURFACE
      ?auto_1095784 - SURFACE
      ?auto_1095786 - SURFACE
      ?auto_1095785 - SURFACE
      ?auto_1095787 - SURFACE
      ?auto_1095788 - SURFACE
      ?auto_1095789 - SURFACE
      ?auto_1095790 - SURFACE
    )
    :vars
    (
      ?auto_1095796 - HOIST
      ?auto_1095792 - PLACE
      ?auto_1095797 - PLACE
      ?auto_1095793 - HOIST
      ?auto_1095795 - SURFACE
      ?auto_1095794 - SURFACE
      ?auto_1095791 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1095796 ?auto_1095792 ) ( IS-CRATE ?auto_1095790 ) ( not ( = ?auto_1095789 ?auto_1095790 ) ) ( not ( = ?auto_1095788 ?auto_1095789 ) ) ( not ( = ?auto_1095788 ?auto_1095790 ) ) ( not ( = ?auto_1095797 ?auto_1095792 ) ) ( HOIST-AT ?auto_1095793 ?auto_1095797 ) ( not ( = ?auto_1095796 ?auto_1095793 ) ) ( SURFACE-AT ?auto_1095790 ?auto_1095797 ) ( ON ?auto_1095790 ?auto_1095795 ) ( CLEAR ?auto_1095790 ) ( not ( = ?auto_1095789 ?auto_1095795 ) ) ( not ( = ?auto_1095790 ?auto_1095795 ) ) ( not ( = ?auto_1095788 ?auto_1095795 ) ) ( SURFACE-AT ?auto_1095788 ?auto_1095792 ) ( CLEAR ?auto_1095788 ) ( IS-CRATE ?auto_1095789 ) ( AVAILABLE ?auto_1095796 ) ( AVAILABLE ?auto_1095793 ) ( SURFACE-AT ?auto_1095789 ?auto_1095797 ) ( ON ?auto_1095789 ?auto_1095794 ) ( CLEAR ?auto_1095789 ) ( not ( = ?auto_1095789 ?auto_1095794 ) ) ( not ( = ?auto_1095790 ?auto_1095794 ) ) ( not ( = ?auto_1095788 ?auto_1095794 ) ) ( not ( = ?auto_1095795 ?auto_1095794 ) ) ( TRUCK-AT ?auto_1095791 ?auto_1095792 ) ( ON ?auto_1095782 ?auto_1095781 ) ( ON ?auto_1095783 ?auto_1095782 ) ( ON ?auto_1095780 ?auto_1095783 ) ( ON ?auto_1095784 ?auto_1095780 ) ( ON ?auto_1095786 ?auto_1095784 ) ( ON ?auto_1095785 ?auto_1095786 ) ( ON ?auto_1095787 ?auto_1095785 ) ( ON ?auto_1095788 ?auto_1095787 ) ( not ( = ?auto_1095781 ?auto_1095782 ) ) ( not ( = ?auto_1095781 ?auto_1095783 ) ) ( not ( = ?auto_1095781 ?auto_1095780 ) ) ( not ( = ?auto_1095781 ?auto_1095784 ) ) ( not ( = ?auto_1095781 ?auto_1095786 ) ) ( not ( = ?auto_1095781 ?auto_1095785 ) ) ( not ( = ?auto_1095781 ?auto_1095787 ) ) ( not ( = ?auto_1095781 ?auto_1095788 ) ) ( not ( = ?auto_1095781 ?auto_1095789 ) ) ( not ( = ?auto_1095781 ?auto_1095790 ) ) ( not ( = ?auto_1095781 ?auto_1095795 ) ) ( not ( = ?auto_1095781 ?auto_1095794 ) ) ( not ( = ?auto_1095782 ?auto_1095783 ) ) ( not ( = ?auto_1095782 ?auto_1095780 ) ) ( not ( = ?auto_1095782 ?auto_1095784 ) ) ( not ( = ?auto_1095782 ?auto_1095786 ) ) ( not ( = ?auto_1095782 ?auto_1095785 ) ) ( not ( = ?auto_1095782 ?auto_1095787 ) ) ( not ( = ?auto_1095782 ?auto_1095788 ) ) ( not ( = ?auto_1095782 ?auto_1095789 ) ) ( not ( = ?auto_1095782 ?auto_1095790 ) ) ( not ( = ?auto_1095782 ?auto_1095795 ) ) ( not ( = ?auto_1095782 ?auto_1095794 ) ) ( not ( = ?auto_1095783 ?auto_1095780 ) ) ( not ( = ?auto_1095783 ?auto_1095784 ) ) ( not ( = ?auto_1095783 ?auto_1095786 ) ) ( not ( = ?auto_1095783 ?auto_1095785 ) ) ( not ( = ?auto_1095783 ?auto_1095787 ) ) ( not ( = ?auto_1095783 ?auto_1095788 ) ) ( not ( = ?auto_1095783 ?auto_1095789 ) ) ( not ( = ?auto_1095783 ?auto_1095790 ) ) ( not ( = ?auto_1095783 ?auto_1095795 ) ) ( not ( = ?auto_1095783 ?auto_1095794 ) ) ( not ( = ?auto_1095780 ?auto_1095784 ) ) ( not ( = ?auto_1095780 ?auto_1095786 ) ) ( not ( = ?auto_1095780 ?auto_1095785 ) ) ( not ( = ?auto_1095780 ?auto_1095787 ) ) ( not ( = ?auto_1095780 ?auto_1095788 ) ) ( not ( = ?auto_1095780 ?auto_1095789 ) ) ( not ( = ?auto_1095780 ?auto_1095790 ) ) ( not ( = ?auto_1095780 ?auto_1095795 ) ) ( not ( = ?auto_1095780 ?auto_1095794 ) ) ( not ( = ?auto_1095784 ?auto_1095786 ) ) ( not ( = ?auto_1095784 ?auto_1095785 ) ) ( not ( = ?auto_1095784 ?auto_1095787 ) ) ( not ( = ?auto_1095784 ?auto_1095788 ) ) ( not ( = ?auto_1095784 ?auto_1095789 ) ) ( not ( = ?auto_1095784 ?auto_1095790 ) ) ( not ( = ?auto_1095784 ?auto_1095795 ) ) ( not ( = ?auto_1095784 ?auto_1095794 ) ) ( not ( = ?auto_1095786 ?auto_1095785 ) ) ( not ( = ?auto_1095786 ?auto_1095787 ) ) ( not ( = ?auto_1095786 ?auto_1095788 ) ) ( not ( = ?auto_1095786 ?auto_1095789 ) ) ( not ( = ?auto_1095786 ?auto_1095790 ) ) ( not ( = ?auto_1095786 ?auto_1095795 ) ) ( not ( = ?auto_1095786 ?auto_1095794 ) ) ( not ( = ?auto_1095785 ?auto_1095787 ) ) ( not ( = ?auto_1095785 ?auto_1095788 ) ) ( not ( = ?auto_1095785 ?auto_1095789 ) ) ( not ( = ?auto_1095785 ?auto_1095790 ) ) ( not ( = ?auto_1095785 ?auto_1095795 ) ) ( not ( = ?auto_1095785 ?auto_1095794 ) ) ( not ( = ?auto_1095787 ?auto_1095788 ) ) ( not ( = ?auto_1095787 ?auto_1095789 ) ) ( not ( = ?auto_1095787 ?auto_1095790 ) ) ( not ( = ?auto_1095787 ?auto_1095795 ) ) ( not ( = ?auto_1095787 ?auto_1095794 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1095788 ?auto_1095789 ?auto_1095790 )
      ( MAKE-10CRATE-VERIFY ?auto_1095781 ?auto_1095782 ?auto_1095783 ?auto_1095780 ?auto_1095784 ?auto_1095786 ?auto_1095785 ?auto_1095787 ?auto_1095788 ?auto_1095789 ?auto_1095790 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1095799 - SURFACE
      ?auto_1095800 - SURFACE
      ?auto_1095801 - SURFACE
      ?auto_1095798 - SURFACE
      ?auto_1095802 - SURFACE
      ?auto_1095804 - SURFACE
      ?auto_1095803 - SURFACE
      ?auto_1095805 - SURFACE
      ?auto_1095806 - SURFACE
      ?auto_1095807 - SURFACE
      ?auto_1095808 - SURFACE
      ?auto_1095809 - SURFACE
    )
    :vars
    (
      ?auto_1095815 - HOIST
      ?auto_1095811 - PLACE
      ?auto_1095816 - PLACE
      ?auto_1095812 - HOIST
      ?auto_1095814 - SURFACE
      ?auto_1095813 - SURFACE
      ?auto_1095810 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1095815 ?auto_1095811 ) ( IS-CRATE ?auto_1095809 ) ( not ( = ?auto_1095808 ?auto_1095809 ) ) ( not ( = ?auto_1095807 ?auto_1095808 ) ) ( not ( = ?auto_1095807 ?auto_1095809 ) ) ( not ( = ?auto_1095816 ?auto_1095811 ) ) ( HOIST-AT ?auto_1095812 ?auto_1095816 ) ( not ( = ?auto_1095815 ?auto_1095812 ) ) ( SURFACE-AT ?auto_1095809 ?auto_1095816 ) ( ON ?auto_1095809 ?auto_1095814 ) ( CLEAR ?auto_1095809 ) ( not ( = ?auto_1095808 ?auto_1095814 ) ) ( not ( = ?auto_1095809 ?auto_1095814 ) ) ( not ( = ?auto_1095807 ?auto_1095814 ) ) ( SURFACE-AT ?auto_1095807 ?auto_1095811 ) ( CLEAR ?auto_1095807 ) ( IS-CRATE ?auto_1095808 ) ( AVAILABLE ?auto_1095815 ) ( AVAILABLE ?auto_1095812 ) ( SURFACE-AT ?auto_1095808 ?auto_1095816 ) ( ON ?auto_1095808 ?auto_1095813 ) ( CLEAR ?auto_1095808 ) ( not ( = ?auto_1095808 ?auto_1095813 ) ) ( not ( = ?auto_1095809 ?auto_1095813 ) ) ( not ( = ?auto_1095807 ?auto_1095813 ) ) ( not ( = ?auto_1095814 ?auto_1095813 ) ) ( TRUCK-AT ?auto_1095810 ?auto_1095811 ) ( ON ?auto_1095800 ?auto_1095799 ) ( ON ?auto_1095801 ?auto_1095800 ) ( ON ?auto_1095798 ?auto_1095801 ) ( ON ?auto_1095802 ?auto_1095798 ) ( ON ?auto_1095804 ?auto_1095802 ) ( ON ?auto_1095803 ?auto_1095804 ) ( ON ?auto_1095805 ?auto_1095803 ) ( ON ?auto_1095806 ?auto_1095805 ) ( ON ?auto_1095807 ?auto_1095806 ) ( not ( = ?auto_1095799 ?auto_1095800 ) ) ( not ( = ?auto_1095799 ?auto_1095801 ) ) ( not ( = ?auto_1095799 ?auto_1095798 ) ) ( not ( = ?auto_1095799 ?auto_1095802 ) ) ( not ( = ?auto_1095799 ?auto_1095804 ) ) ( not ( = ?auto_1095799 ?auto_1095803 ) ) ( not ( = ?auto_1095799 ?auto_1095805 ) ) ( not ( = ?auto_1095799 ?auto_1095806 ) ) ( not ( = ?auto_1095799 ?auto_1095807 ) ) ( not ( = ?auto_1095799 ?auto_1095808 ) ) ( not ( = ?auto_1095799 ?auto_1095809 ) ) ( not ( = ?auto_1095799 ?auto_1095814 ) ) ( not ( = ?auto_1095799 ?auto_1095813 ) ) ( not ( = ?auto_1095800 ?auto_1095801 ) ) ( not ( = ?auto_1095800 ?auto_1095798 ) ) ( not ( = ?auto_1095800 ?auto_1095802 ) ) ( not ( = ?auto_1095800 ?auto_1095804 ) ) ( not ( = ?auto_1095800 ?auto_1095803 ) ) ( not ( = ?auto_1095800 ?auto_1095805 ) ) ( not ( = ?auto_1095800 ?auto_1095806 ) ) ( not ( = ?auto_1095800 ?auto_1095807 ) ) ( not ( = ?auto_1095800 ?auto_1095808 ) ) ( not ( = ?auto_1095800 ?auto_1095809 ) ) ( not ( = ?auto_1095800 ?auto_1095814 ) ) ( not ( = ?auto_1095800 ?auto_1095813 ) ) ( not ( = ?auto_1095801 ?auto_1095798 ) ) ( not ( = ?auto_1095801 ?auto_1095802 ) ) ( not ( = ?auto_1095801 ?auto_1095804 ) ) ( not ( = ?auto_1095801 ?auto_1095803 ) ) ( not ( = ?auto_1095801 ?auto_1095805 ) ) ( not ( = ?auto_1095801 ?auto_1095806 ) ) ( not ( = ?auto_1095801 ?auto_1095807 ) ) ( not ( = ?auto_1095801 ?auto_1095808 ) ) ( not ( = ?auto_1095801 ?auto_1095809 ) ) ( not ( = ?auto_1095801 ?auto_1095814 ) ) ( not ( = ?auto_1095801 ?auto_1095813 ) ) ( not ( = ?auto_1095798 ?auto_1095802 ) ) ( not ( = ?auto_1095798 ?auto_1095804 ) ) ( not ( = ?auto_1095798 ?auto_1095803 ) ) ( not ( = ?auto_1095798 ?auto_1095805 ) ) ( not ( = ?auto_1095798 ?auto_1095806 ) ) ( not ( = ?auto_1095798 ?auto_1095807 ) ) ( not ( = ?auto_1095798 ?auto_1095808 ) ) ( not ( = ?auto_1095798 ?auto_1095809 ) ) ( not ( = ?auto_1095798 ?auto_1095814 ) ) ( not ( = ?auto_1095798 ?auto_1095813 ) ) ( not ( = ?auto_1095802 ?auto_1095804 ) ) ( not ( = ?auto_1095802 ?auto_1095803 ) ) ( not ( = ?auto_1095802 ?auto_1095805 ) ) ( not ( = ?auto_1095802 ?auto_1095806 ) ) ( not ( = ?auto_1095802 ?auto_1095807 ) ) ( not ( = ?auto_1095802 ?auto_1095808 ) ) ( not ( = ?auto_1095802 ?auto_1095809 ) ) ( not ( = ?auto_1095802 ?auto_1095814 ) ) ( not ( = ?auto_1095802 ?auto_1095813 ) ) ( not ( = ?auto_1095804 ?auto_1095803 ) ) ( not ( = ?auto_1095804 ?auto_1095805 ) ) ( not ( = ?auto_1095804 ?auto_1095806 ) ) ( not ( = ?auto_1095804 ?auto_1095807 ) ) ( not ( = ?auto_1095804 ?auto_1095808 ) ) ( not ( = ?auto_1095804 ?auto_1095809 ) ) ( not ( = ?auto_1095804 ?auto_1095814 ) ) ( not ( = ?auto_1095804 ?auto_1095813 ) ) ( not ( = ?auto_1095803 ?auto_1095805 ) ) ( not ( = ?auto_1095803 ?auto_1095806 ) ) ( not ( = ?auto_1095803 ?auto_1095807 ) ) ( not ( = ?auto_1095803 ?auto_1095808 ) ) ( not ( = ?auto_1095803 ?auto_1095809 ) ) ( not ( = ?auto_1095803 ?auto_1095814 ) ) ( not ( = ?auto_1095803 ?auto_1095813 ) ) ( not ( = ?auto_1095805 ?auto_1095806 ) ) ( not ( = ?auto_1095805 ?auto_1095807 ) ) ( not ( = ?auto_1095805 ?auto_1095808 ) ) ( not ( = ?auto_1095805 ?auto_1095809 ) ) ( not ( = ?auto_1095805 ?auto_1095814 ) ) ( not ( = ?auto_1095805 ?auto_1095813 ) ) ( not ( = ?auto_1095806 ?auto_1095807 ) ) ( not ( = ?auto_1095806 ?auto_1095808 ) ) ( not ( = ?auto_1095806 ?auto_1095809 ) ) ( not ( = ?auto_1095806 ?auto_1095814 ) ) ( not ( = ?auto_1095806 ?auto_1095813 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1095807 ?auto_1095808 ?auto_1095809 )
      ( MAKE-11CRATE-VERIFY ?auto_1095799 ?auto_1095800 ?auto_1095801 ?auto_1095798 ?auto_1095802 ?auto_1095804 ?auto_1095803 ?auto_1095805 ?auto_1095806 ?auto_1095807 ?auto_1095808 ?auto_1095809 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1095818 - SURFACE
      ?auto_1095819 - SURFACE
      ?auto_1095820 - SURFACE
      ?auto_1095817 - SURFACE
      ?auto_1095821 - SURFACE
      ?auto_1095823 - SURFACE
      ?auto_1095822 - SURFACE
      ?auto_1095824 - SURFACE
      ?auto_1095825 - SURFACE
      ?auto_1095826 - SURFACE
      ?auto_1095827 - SURFACE
      ?auto_1095828 - SURFACE
      ?auto_1095829 - SURFACE
    )
    :vars
    (
      ?auto_1095835 - HOIST
      ?auto_1095831 - PLACE
      ?auto_1095836 - PLACE
      ?auto_1095832 - HOIST
      ?auto_1095834 - SURFACE
      ?auto_1095833 - SURFACE
      ?auto_1095830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1095835 ?auto_1095831 ) ( IS-CRATE ?auto_1095829 ) ( not ( = ?auto_1095828 ?auto_1095829 ) ) ( not ( = ?auto_1095827 ?auto_1095828 ) ) ( not ( = ?auto_1095827 ?auto_1095829 ) ) ( not ( = ?auto_1095836 ?auto_1095831 ) ) ( HOIST-AT ?auto_1095832 ?auto_1095836 ) ( not ( = ?auto_1095835 ?auto_1095832 ) ) ( SURFACE-AT ?auto_1095829 ?auto_1095836 ) ( ON ?auto_1095829 ?auto_1095834 ) ( CLEAR ?auto_1095829 ) ( not ( = ?auto_1095828 ?auto_1095834 ) ) ( not ( = ?auto_1095829 ?auto_1095834 ) ) ( not ( = ?auto_1095827 ?auto_1095834 ) ) ( SURFACE-AT ?auto_1095827 ?auto_1095831 ) ( CLEAR ?auto_1095827 ) ( IS-CRATE ?auto_1095828 ) ( AVAILABLE ?auto_1095835 ) ( AVAILABLE ?auto_1095832 ) ( SURFACE-AT ?auto_1095828 ?auto_1095836 ) ( ON ?auto_1095828 ?auto_1095833 ) ( CLEAR ?auto_1095828 ) ( not ( = ?auto_1095828 ?auto_1095833 ) ) ( not ( = ?auto_1095829 ?auto_1095833 ) ) ( not ( = ?auto_1095827 ?auto_1095833 ) ) ( not ( = ?auto_1095834 ?auto_1095833 ) ) ( TRUCK-AT ?auto_1095830 ?auto_1095831 ) ( ON ?auto_1095819 ?auto_1095818 ) ( ON ?auto_1095820 ?auto_1095819 ) ( ON ?auto_1095817 ?auto_1095820 ) ( ON ?auto_1095821 ?auto_1095817 ) ( ON ?auto_1095823 ?auto_1095821 ) ( ON ?auto_1095822 ?auto_1095823 ) ( ON ?auto_1095824 ?auto_1095822 ) ( ON ?auto_1095825 ?auto_1095824 ) ( ON ?auto_1095826 ?auto_1095825 ) ( ON ?auto_1095827 ?auto_1095826 ) ( not ( = ?auto_1095818 ?auto_1095819 ) ) ( not ( = ?auto_1095818 ?auto_1095820 ) ) ( not ( = ?auto_1095818 ?auto_1095817 ) ) ( not ( = ?auto_1095818 ?auto_1095821 ) ) ( not ( = ?auto_1095818 ?auto_1095823 ) ) ( not ( = ?auto_1095818 ?auto_1095822 ) ) ( not ( = ?auto_1095818 ?auto_1095824 ) ) ( not ( = ?auto_1095818 ?auto_1095825 ) ) ( not ( = ?auto_1095818 ?auto_1095826 ) ) ( not ( = ?auto_1095818 ?auto_1095827 ) ) ( not ( = ?auto_1095818 ?auto_1095828 ) ) ( not ( = ?auto_1095818 ?auto_1095829 ) ) ( not ( = ?auto_1095818 ?auto_1095834 ) ) ( not ( = ?auto_1095818 ?auto_1095833 ) ) ( not ( = ?auto_1095819 ?auto_1095820 ) ) ( not ( = ?auto_1095819 ?auto_1095817 ) ) ( not ( = ?auto_1095819 ?auto_1095821 ) ) ( not ( = ?auto_1095819 ?auto_1095823 ) ) ( not ( = ?auto_1095819 ?auto_1095822 ) ) ( not ( = ?auto_1095819 ?auto_1095824 ) ) ( not ( = ?auto_1095819 ?auto_1095825 ) ) ( not ( = ?auto_1095819 ?auto_1095826 ) ) ( not ( = ?auto_1095819 ?auto_1095827 ) ) ( not ( = ?auto_1095819 ?auto_1095828 ) ) ( not ( = ?auto_1095819 ?auto_1095829 ) ) ( not ( = ?auto_1095819 ?auto_1095834 ) ) ( not ( = ?auto_1095819 ?auto_1095833 ) ) ( not ( = ?auto_1095820 ?auto_1095817 ) ) ( not ( = ?auto_1095820 ?auto_1095821 ) ) ( not ( = ?auto_1095820 ?auto_1095823 ) ) ( not ( = ?auto_1095820 ?auto_1095822 ) ) ( not ( = ?auto_1095820 ?auto_1095824 ) ) ( not ( = ?auto_1095820 ?auto_1095825 ) ) ( not ( = ?auto_1095820 ?auto_1095826 ) ) ( not ( = ?auto_1095820 ?auto_1095827 ) ) ( not ( = ?auto_1095820 ?auto_1095828 ) ) ( not ( = ?auto_1095820 ?auto_1095829 ) ) ( not ( = ?auto_1095820 ?auto_1095834 ) ) ( not ( = ?auto_1095820 ?auto_1095833 ) ) ( not ( = ?auto_1095817 ?auto_1095821 ) ) ( not ( = ?auto_1095817 ?auto_1095823 ) ) ( not ( = ?auto_1095817 ?auto_1095822 ) ) ( not ( = ?auto_1095817 ?auto_1095824 ) ) ( not ( = ?auto_1095817 ?auto_1095825 ) ) ( not ( = ?auto_1095817 ?auto_1095826 ) ) ( not ( = ?auto_1095817 ?auto_1095827 ) ) ( not ( = ?auto_1095817 ?auto_1095828 ) ) ( not ( = ?auto_1095817 ?auto_1095829 ) ) ( not ( = ?auto_1095817 ?auto_1095834 ) ) ( not ( = ?auto_1095817 ?auto_1095833 ) ) ( not ( = ?auto_1095821 ?auto_1095823 ) ) ( not ( = ?auto_1095821 ?auto_1095822 ) ) ( not ( = ?auto_1095821 ?auto_1095824 ) ) ( not ( = ?auto_1095821 ?auto_1095825 ) ) ( not ( = ?auto_1095821 ?auto_1095826 ) ) ( not ( = ?auto_1095821 ?auto_1095827 ) ) ( not ( = ?auto_1095821 ?auto_1095828 ) ) ( not ( = ?auto_1095821 ?auto_1095829 ) ) ( not ( = ?auto_1095821 ?auto_1095834 ) ) ( not ( = ?auto_1095821 ?auto_1095833 ) ) ( not ( = ?auto_1095823 ?auto_1095822 ) ) ( not ( = ?auto_1095823 ?auto_1095824 ) ) ( not ( = ?auto_1095823 ?auto_1095825 ) ) ( not ( = ?auto_1095823 ?auto_1095826 ) ) ( not ( = ?auto_1095823 ?auto_1095827 ) ) ( not ( = ?auto_1095823 ?auto_1095828 ) ) ( not ( = ?auto_1095823 ?auto_1095829 ) ) ( not ( = ?auto_1095823 ?auto_1095834 ) ) ( not ( = ?auto_1095823 ?auto_1095833 ) ) ( not ( = ?auto_1095822 ?auto_1095824 ) ) ( not ( = ?auto_1095822 ?auto_1095825 ) ) ( not ( = ?auto_1095822 ?auto_1095826 ) ) ( not ( = ?auto_1095822 ?auto_1095827 ) ) ( not ( = ?auto_1095822 ?auto_1095828 ) ) ( not ( = ?auto_1095822 ?auto_1095829 ) ) ( not ( = ?auto_1095822 ?auto_1095834 ) ) ( not ( = ?auto_1095822 ?auto_1095833 ) ) ( not ( = ?auto_1095824 ?auto_1095825 ) ) ( not ( = ?auto_1095824 ?auto_1095826 ) ) ( not ( = ?auto_1095824 ?auto_1095827 ) ) ( not ( = ?auto_1095824 ?auto_1095828 ) ) ( not ( = ?auto_1095824 ?auto_1095829 ) ) ( not ( = ?auto_1095824 ?auto_1095834 ) ) ( not ( = ?auto_1095824 ?auto_1095833 ) ) ( not ( = ?auto_1095825 ?auto_1095826 ) ) ( not ( = ?auto_1095825 ?auto_1095827 ) ) ( not ( = ?auto_1095825 ?auto_1095828 ) ) ( not ( = ?auto_1095825 ?auto_1095829 ) ) ( not ( = ?auto_1095825 ?auto_1095834 ) ) ( not ( = ?auto_1095825 ?auto_1095833 ) ) ( not ( = ?auto_1095826 ?auto_1095827 ) ) ( not ( = ?auto_1095826 ?auto_1095828 ) ) ( not ( = ?auto_1095826 ?auto_1095829 ) ) ( not ( = ?auto_1095826 ?auto_1095834 ) ) ( not ( = ?auto_1095826 ?auto_1095833 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1095827 ?auto_1095828 ?auto_1095829 )
      ( MAKE-12CRATE-VERIFY ?auto_1095818 ?auto_1095819 ?auto_1095820 ?auto_1095817 ?auto_1095821 ?auto_1095823 ?auto_1095822 ?auto_1095824 ?auto_1095825 ?auto_1095826 ?auto_1095827 ?auto_1095828 ?auto_1095829 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1095838 - SURFACE
      ?auto_1095839 - SURFACE
      ?auto_1095840 - SURFACE
      ?auto_1095837 - SURFACE
      ?auto_1095841 - SURFACE
      ?auto_1095843 - SURFACE
      ?auto_1095842 - SURFACE
      ?auto_1095844 - SURFACE
      ?auto_1095845 - SURFACE
      ?auto_1095846 - SURFACE
      ?auto_1095847 - SURFACE
      ?auto_1095848 - SURFACE
      ?auto_1095849 - SURFACE
      ?auto_1095850 - SURFACE
    )
    :vars
    (
      ?auto_1095856 - HOIST
      ?auto_1095852 - PLACE
      ?auto_1095857 - PLACE
      ?auto_1095853 - HOIST
      ?auto_1095855 - SURFACE
      ?auto_1095854 - SURFACE
      ?auto_1095851 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1095856 ?auto_1095852 ) ( IS-CRATE ?auto_1095850 ) ( not ( = ?auto_1095849 ?auto_1095850 ) ) ( not ( = ?auto_1095848 ?auto_1095849 ) ) ( not ( = ?auto_1095848 ?auto_1095850 ) ) ( not ( = ?auto_1095857 ?auto_1095852 ) ) ( HOIST-AT ?auto_1095853 ?auto_1095857 ) ( not ( = ?auto_1095856 ?auto_1095853 ) ) ( SURFACE-AT ?auto_1095850 ?auto_1095857 ) ( ON ?auto_1095850 ?auto_1095855 ) ( CLEAR ?auto_1095850 ) ( not ( = ?auto_1095849 ?auto_1095855 ) ) ( not ( = ?auto_1095850 ?auto_1095855 ) ) ( not ( = ?auto_1095848 ?auto_1095855 ) ) ( SURFACE-AT ?auto_1095848 ?auto_1095852 ) ( CLEAR ?auto_1095848 ) ( IS-CRATE ?auto_1095849 ) ( AVAILABLE ?auto_1095856 ) ( AVAILABLE ?auto_1095853 ) ( SURFACE-AT ?auto_1095849 ?auto_1095857 ) ( ON ?auto_1095849 ?auto_1095854 ) ( CLEAR ?auto_1095849 ) ( not ( = ?auto_1095849 ?auto_1095854 ) ) ( not ( = ?auto_1095850 ?auto_1095854 ) ) ( not ( = ?auto_1095848 ?auto_1095854 ) ) ( not ( = ?auto_1095855 ?auto_1095854 ) ) ( TRUCK-AT ?auto_1095851 ?auto_1095852 ) ( ON ?auto_1095839 ?auto_1095838 ) ( ON ?auto_1095840 ?auto_1095839 ) ( ON ?auto_1095837 ?auto_1095840 ) ( ON ?auto_1095841 ?auto_1095837 ) ( ON ?auto_1095843 ?auto_1095841 ) ( ON ?auto_1095842 ?auto_1095843 ) ( ON ?auto_1095844 ?auto_1095842 ) ( ON ?auto_1095845 ?auto_1095844 ) ( ON ?auto_1095846 ?auto_1095845 ) ( ON ?auto_1095847 ?auto_1095846 ) ( ON ?auto_1095848 ?auto_1095847 ) ( not ( = ?auto_1095838 ?auto_1095839 ) ) ( not ( = ?auto_1095838 ?auto_1095840 ) ) ( not ( = ?auto_1095838 ?auto_1095837 ) ) ( not ( = ?auto_1095838 ?auto_1095841 ) ) ( not ( = ?auto_1095838 ?auto_1095843 ) ) ( not ( = ?auto_1095838 ?auto_1095842 ) ) ( not ( = ?auto_1095838 ?auto_1095844 ) ) ( not ( = ?auto_1095838 ?auto_1095845 ) ) ( not ( = ?auto_1095838 ?auto_1095846 ) ) ( not ( = ?auto_1095838 ?auto_1095847 ) ) ( not ( = ?auto_1095838 ?auto_1095848 ) ) ( not ( = ?auto_1095838 ?auto_1095849 ) ) ( not ( = ?auto_1095838 ?auto_1095850 ) ) ( not ( = ?auto_1095838 ?auto_1095855 ) ) ( not ( = ?auto_1095838 ?auto_1095854 ) ) ( not ( = ?auto_1095839 ?auto_1095840 ) ) ( not ( = ?auto_1095839 ?auto_1095837 ) ) ( not ( = ?auto_1095839 ?auto_1095841 ) ) ( not ( = ?auto_1095839 ?auto_1095843 ) ) ( not ( = ?auto_1095839 ?auto_1095842 ) ) ( not ( = ?auto_1095839 ?auto_1095844 ) ) ( not ( = ?auto_1095839 ?auto_1095845 ) ) ( not ( = ?auto_1095839 ?auto_1095846 ) ) ( not ( = ?auto_1095839 ?auto_1095847 ) ) ( not ( = ?auto_1095839 ?auto_1095848 ) ) ( not ( = ?auto_1095839 ?auto_1095849 ) ) ( not ( = ?auto_1095839 ?auto_1095850 ) ) ( not ( = ?auto_1095839 ?auto_1095855 ) ) ( not ( = ?auto_1095839 ?auto_1095854 ) ) ( not ( = ?auto_1095840 ?auto_1095837 ) ) ( not ( = ?auto_1095840 ?auto_1095841 ) ) ( not ( = ?auto_1095840 ?auto_1095843 ) ) ( not ( = ?auto_1095840 ?auto_1095842 ) ) ( not ( = ?auto_1095840 ?auto_1095844 ) ) ( not ( = ?auto_1095840 ?auto_1095845 ) ) ( not ( = ?auto_1095840 ?auto_1095846 ) ) ( not ( = ?auto_1095840 ?auto_1095847 ) ) ( not ( = ?auto_1095840 ?auto_1095848 ) ) ( not ( = ?auto_1095840 ?auto_1095849 ) ) ( not ( = ?auto_1095840 ?auto_1095850 ) ) ( not ( = ?auto_1095840 ?auto_1095855 ) ) ( not ( = ?auto_1095840 ?auto_1095854 ) ) ( not ( = ?auto_1095837 ?auto_1095841 ) ) ( not ( = ?auto_1095837 ?auto_1095843 ) ) ( not ( = ?auto_1095837 ?auto_1095842 ) ) ( not ( = ?auto_1095837 ?auto_1095844 ) ) ( not ( = ?auto_1095837 ?auto_1095845 ) ) ( not ( = ?auto_1095837 ?auto_1095846 ) ) ( not ( = ?auto_1095837 ?auto_1095847 ) ) ( not ( = ?auto_1095837 ?auto_1095848 ) ) ( not ( = ?auto_1095837 ?auto_1095849 ) ) ( not ( = ?auto_1095837 ?auto_1095850 ) ) ( not ( = ?auto_1095837 ?auto_1095855 ) ) ( not ( = ?auto_1095837 ?auto_1095854 ) ) ( not ( = ?auto_1095841 ?auto_1095843 ) ) ( not ( = ?auto_1095841 ?auto_1095842 ) ) ( not ( = ?auto_1095841 ?auto_1095844 ) ) ( not ( = ?auto_1095841 ?auto_1095845 ) ) ( not ( = ?auto_1095841 ?auto_1095846 ) ) ( not ( = ?auto_1095841 ?auto_1095847 ) ) ( not ( = ?auto_1095841 ?auto_1095848 ) ) ( not ( = ?auto_1095841 ?auto_1095849 ) ) ( not ( = ?auto_1095841 ?auto_1095850 ) ) ( not ( = ?auto_1095841 ?auto_1095855 ) ) ( not ( = ?auto_1095841 ?auto_1095854 ) ) ( not ( = ?auto_1095843 ?auto_1095842 ) ) ( not ( = ?auto_1095843 ?auto_1095844 ) ) ( not ( = ?auto_1095843 ?auto_1095845 ) ) ( not ( = ?auto_1095843 ?auto_1095846 ) ) ( not ( = ?auto_1095843 ?auto_1095847 ) ) ( not ( = ?auto_1095843 ?auto_1095848 ) ) ( not ( = ?auto_1095843 ?auto_1095849 ) ) ( not ( = ?auto_1095843 ?auto_1095850 ) ) ( not ( = ?auto_1095843 ?auto_1095855 ) ) ( not ( = ?auto_1095843 ?auto_1095854 ) ) ( not ( = ?auto_1095842 ?auto_1095844 ) ) ( not ( = ?auto_1095842 ?auto_1095845 ) ) ( not ( = ?auto_1095842 ?auto_1095846 ) ) ( not ( = ?auto_1095842 ?auto_1095847 ) ) ( not ( = ?auto_1095842 ?auto_1095848 ) ) ( not ( = ?auto_1095842 ?auto_1095849 ) ) ( not ( = ?auto_1095842 ?auto_1095850 ) ) ( not ( = ?auto_1095842 ?auto_1095855 ) ) ( not ( = ?auto_1095842 ?auto_1095854 ) ) ( not ( = ?auto_1095844 ?auto_1095845 ) ) ( not ( = ?auto_1095844 ?auto_1095846 ) ) ( not ( = ?auto_1095844 ?auto_1095847 ) ) ( not ( = ?auto_1095844 ?auto_1095848 ) ) ( not ( = ?auto_1095844 ?auto_1095849 ) ) ( not ( = ?auto_1095844 ?auto_1095850 ) ) ( not ( = ?auto_1095844 ?auto_1095855 ) ) ( not ( = ?auto_1095844 ?auto_1095854 ) ) ( not ( = ?auto_1095845 ?auto_1095846 ) ) ( not ( = ?auto_1095845 ?auto_1095847 ) ) ( not ( = ?auto_1095845 ?auto_1095848 ) ) ( not ( = ?auto_1095845 ?auto_1095849 ) ) ( not ( = ?auto_1095845 ?auto_1095850 ) ) ( not ( = ?auto_1095845 ?auto_1095855 ) ) ( not ( = ?auto_1095845 ?auto_1095854 ) ) ( not ( = ?auto_1095846 ?auto_1095847 ) ) ( not ( = ?auto_1095846 ?auto_1095848 ) ) ( not ( = ?auto_1095846 ?auto_1095849 ) ) ( not ( = ?auto_1095846 ?auto_1095850 ) ) ( not ( = ?auto_1095846 ?auto_1095855 ) ) ( not ( = ?auto_1095846 ?auto_1095854 ) ) ( not ( = ?auto_1095847 ?auto_1095848 ) ) ( not ( = ?auto_1095847 ?auto_1095849 ) ) ( not ( = ?auto_1095847 ?auto_1095850 ) ) ( not ( = ?auto_1095847 ?auto_1095855 ) ) ( not ( = ?auto_1095847 ?auto_1095854 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1095848 ?auto_1095849 ?auto_1095850 )
      ( MAKE-13CRATE-VERIFY ?auto_1095838 ?auto_1095839 ?auto_1095840 ?auto_1095837 ?auto_1095841 ?auto_1095843 ?auto_1095842 ?auto_1095844 ?auto_1095845 ?auto_1095846 ?auto_1095847 ?auto_1095848 ?auto_1095849 ?auto_1095850 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1095979 - SURFACE
      ?auto_1095980 - SURFACE
      ?auto_1095981 - SURFACE
      ?auto_1095978 - SURFACE
      ?auto_1095982 - SURFACE
      ?auto_1095984 - SURFACE
      ?auto_1095983 - SURFACE
      ?auto_1095985 - SURFACE
      ?auto_1095986 - SURFACE
      ?auto_1095987 - SURFACE
      ?auto_1095988 - SURFACE
    )
    :vars
    (
      ?auto_1095994 - HOIST
      ?auto_1095993 - PLACE
      ?auto_1095995 - PLACE
      ?auto_1095989 - HOIST
      ?auto_1095991 - SURFACE
      ?auto_1095992 - SURFACE
      ?auto_1095990 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1095994 ?auto_1095993 ) ( IS-CRATE ?auto_1095988 ) ( not ( = ?auto_1095987 ?auto_1095988 ) ) ( not ( = ?auto_1095986 ?auto_1095987 ) ) ( not ( = ?auto_1095986 ?auto_1095988 ) ) ( not ( = ?auto_1095995 ?auto_1095993 ) ) ( HOIST-AT ?auto_1095989 ?auto_1095995 ) ( not ( = ?auto_1095994 ?auto_1095989 ) ) ( SURFACE-AT ?auto_1095988 ?auto_1095995 ) ( ON ?auto_1095988 ?auto_1095991 ) ( CLEAR ?auto_1095988 ) ( not ( = ?auto_1095987 ?auto_1095991 ) ) ( not ( = ?auto_1095988 ?auto_1095991 ) ) ( not ( = ?auto_1095986 ?auto_1095991 ) ) ( IS-CRATE ?auto_1095987 ) ( AVAILABLE ?auto_1095989 ) ( SURFACE-AT ?auto_1095987 ?auto_1095995 ) ( ON ?auto_1095987 ?auto_1095992 ) ( CLEAR ?auto_1095987 ) ( not ( = ?auto_1095987 ?auto_1095992 ) ) ( not ( = ?auto_1095988 ?auto_1095992 ) ) ( not ( = ?auto_1095986 ?auto_1095992 ) ) ( not ( = ?auto_1095991 ?auto_1095992 ) ) ( TRUCK-AT ?auto_1095990 ?auto_1095993 ) ( SURFACE-AT ?auto_1095985 ?auto_1095993 ) ( CLEAR ?auto_1095985 ) ( LIFTING ?auto_1095994 ?auto_1095986 ) ( IS-CRATE ?auto_1095986 ) ( not ( = ?auto_1095985 ?auto_1095986 ) ) ( not ( = ?auto_1095987 ?auto_1095985 ) ) ( not ( = ?auto_1095988 ?auto_1095985 ) ) ( not ( = ?auto_1095991 ?auto_1095985 ) ) ( not ( = ?auto_1095992 ?auto_1095985 ) ) ( ON ?auto_1095980 ?auto_1095979 ) ( ON ?auto_1095981 ?auto_1095980 ) ( ON ?auto_1095978 ?auto_1095981 ) ( ON ?auto_1095982 ?auto_1095978 ) ( ON ?auto_1095984 ?auto_1095982 ) ( ON ?auto_1095983 ?auto_1095984 ) ( ON ?auto_1095985 ?auto_1095983 ) ( not ( = ?auto_1095979 ?auto_1095980 ) ) ( not ( = ?auto_1095979 ?auto_1095981 ) ) ( not ( = ?auto_1095979 ?auto_1095978 ) ) ( not ( = ?auto_1095979 ?auto_1095982 ) ) ( not ( = ?auto_1095979 ?auto_1095984 ) ) ( not ( = ?auto_1095979 ?auto_1095983 ) ) ( not ( = ?auto_1095979 ?auto_1095985 ) ) ( not ( = ?auto_1095979 ?auto_1095986 ) ) ( not ( = ?auto_1095979 ?auto_1095987 ) ) ( not ( = ?auto_1095979 ?auto_1095988 ) ) ( not ( = ?auto_1095979 ?auto_1095991 ) ) ( not ( = ?auto_1095979 ?auto_1095992 ) ) ( not ( = ?auto_1095980 ?auto_1095981 ) ) ( not ( = ?auto_1095980 ?auto_1095978 ) ) ( not ( = ?auto_1095980 ?auto_1095982 ) ) ( not ( = ?auto_1095980 ?auto_1095984 ) ) ( not ( = ?auto_1095980 ?auto_1095983 ) ) ( not ( = ?auto_1095980 ?auto_1095985 ) ) ( not ( = ?auto_1095980 ?auto_1095986 ) ) ( not ( = ?auto_1095980 ?auto_1095987 ) ) ( not ( = ?auto_1095980 ?auto_1095988 ) ) ( not ( = ?auto_1095980 ?auto_1095991 ) ) ( not ( = ?auto_1095980 ?auto_1095992 ) ) ( not ( = ?auto_1095981 ?auto_1095978 ) ) ( not ( = ?auto_1095981 ?auto_1095982 ) ) ( not ( = ?auto_1095981 ?auto_1095984 ) ) ( not ( = ?auto_1095981 ?auto_1095983 ) ) ( not ( = ?auto_1095981 ?auto_1095985 ) ) ( not ( = ?auto_1095981 ?auto_1095986 ) ) ( not ( = ?auto_1095981 ?auto_1095987 ) ) ( not ( = ?auto_1095981 ?auto_1095988 ) ) ( not ( = ?auto_1095981 ?auto_1095991 ) ) ( not ( = ?auto_1095981 ?auto_1095992 ) ) ( not ( = ?auto_1095978 ?auto_1095982 ) ) ( not ( = ?auto_1095978 ?auto_1095984 ) ) ( not ( = ?auto_1095978 ?auto_1095983 ) ) ( not ( = ?auto_1095978 ?auto_1095985 ) ) ( not ( = ?auto_1095978 ?auto_1095986 ) ) ( not ( = ?auto_1095978 ?auto_1095987 ) ) ( not ( = ?auto_1095978 ?auto_1095988 ) ) ( not ( = ?auto_1095978 ?auto_1095991 ) ) ( not ( = ?auto_1095978 ?auto_1095992 ) ) ( not ( = ?auto_1095982 ?auto_1095984 ) ) ( not ( = ?auto_1095982 ?auto_1095983 ) ) ( not ( = ?auto_1095982 ?auto_1095985 ) ) ( not ( = ?auto_1095982 ?auto_1095986 ) ) ( not ( = ?auto_1095982 ?auto_1095987 ) ) ( not ( = ?auto_1095982 ?auto_1095988 ) ) ( not ( = ?auto_1095982 ?auto_1095991 ) ) ( not ( = ?auto_1095982 ?auto_1095992 ) ) ( not ( = ?auto_1095984 ?auto_1095983 ) ) ( not ( = ?auto_1095984 ?auto_1095985 ) ) ( not ( = ?auto_1095984 ?auto_1095986 ) ) ( not ( = ?auto_1095984 ?auto_1095987 ) ) ( not ( = ?auto_1095984 ?auto_1095988 ) ) ( not ( = ?auto_1095984 ?auto_1095991 ) ) ( not ( = ?auto_1095984 ?auto_1095992 ) ) ( not ( = ?auto_1095983 ?auto_1095985 ) ) ( not ( = ?auto_1095983 ?auto_1095986 ) ) ( not ( = ?auto_1095983 ?auto_1095987 ) ) ( not ( = ?auto_1095983 ?auto_1095988 ) ) ( not ( = ?auto_1095983 ?auto_1095991 ) ) ( not ( = ?auto_1095983 ?auto_1095992 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1095986 ?auto_1095987 ?auto_1095988 )
      ( MAKE-10CRATE-VERIFY ?auto_1095979 ?auto_1095980 ?auto_1095981 ?auto_1095978 ?auto_1095982 ?auto_1095984 ?auto_1095983 ?auto_1095985 ?auto_1095986 ?auto_1095987 ?auto_1095988 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1095997 - SURFACE
      ?auto_1095998 - SURFACE
      ?auto_1095999 - SURFACE
      ?auto_1095996 - SURFACE
      ?auto_1096000 - SURFACE
      ?auto_1096002 - SURFACE
      ?auto_1096001 - SURFACE
      ?auto_1096003 - SURFACE
      ?auto_1096004 - SURFACE
      ?auto_1096005 - SURFACE
      ?auto_1096006 - SURFACE
      ?auto_1096007 - SURFACE
    )
    :vars
    (
      ?auto_1096013 - HOIST
      ?auto_1096012 - PLACE
      ?auto_1096014 - PLACE
      ?auto_1096008 - HOIST
      ?auto_1096010 - SURFACE
      ?auto_1096011 - SURFACE
      ?auto_1096009 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1096013 ?auto_1096012 ) ( IS-CRATE ?auto_1096007 ) ( not ( = ?auto_1096006 ?auto_1096007 ) ) ( not ( = ?auto_1096005 ?auto_1096006 ) ) ( not ( = ?auto_1096005 ?auto_1096007 ) ) ( not ( = ?auto_1096014 ?auto_1096012 ) ) ( HOIST-AT ?auto_1096008 ?auto_1096014 ) ( not ( = ?auto_1096013 ?auto_1096008 ) ) ( SURFACE-AT ?auto_1096007 ?auto_1096014 ) ( ON ?auto_1096007 ?auto_1096010 ) ( CLEAR ?auto_1096007 ) ( not ( = ?auto_1096006 ?auto_1096010 ) ) ( not ( = ?auto_1096007 ?auto_1096010 ) ) ( not ( = ?auto_1096005 ?auto_1096010 ) ) ( IS-CRATE ?auto_1096006 ) ( AVAILABLE ?auto_1096008 ) ( SURFACE-AT ?auto_1096006 ?auto_1096014 ) ( ON ?auto_1096006 ?auto_1096011 ) ( CLEAR ?auto_1096006 ) ( not ( = ?auto_1096006 ?auto_1096011 ) ) ( not ( = ?auto_1096007 ?auto_1096011 ) ) ( not ( = ?auto_1096005 ?auto_1096011 ) ) ( not ( = ?auto_1096010 ?auto_1096011 ) ) ( TRUCK-AT ?auto_1096009 ?auto_1096012 ) ( SURFACE-AT ?auto_1096004 ?auto_1096012 ) ( CLEAR ?auto_1096004 ) ( LIFTING ?auto_1096013 ?auto_1096005 ) ( IS-CRATE ?auto_1096005 ) ( not ( = ?auto_1096004 ?auto_1096005 ) ) ( not ( = ?auto_1096006 ?auto_1096004 ) ) ( not ( = ?auto_1096007 ?auto_1096004 ) ) ( not ( = ?auto_1096010 ?auto_1096004 ) ) ( not ( = ?auto_1096011 ?auto_1096004 ) ) ( ON ?auto_1095998 ?auto_1095997 ) ( ON ?auto_1095999 ?auto_1095998 ) ( ON ?auto_1095996 ?auto_1095999 ) ( ON ?auto_1096000 ?auto_1095996 ) ( ON ?auto_1096002 ?auto_1096000 ) ( ON ?auto_1096001 ?auto_1096002 ) ( ON ?auto_1096003 ?auto_1096001 ) ( ON ?auto_1096004 ?auto_1096003 ) ( not ( = ?auto_1095997 ?auto_1095998 ) ) ( not ( = ?auto_1095997 ?auto_1095999 ) ) ( not ( = ?auto_1095997 ?auto_1095996 ) ) ( not ( = ?auto_1095997 ?auto_1096000 ) ) ( not ( = ?auto_1095997 ?auto_1096002 ) ) ( not ( = ?auto_1095997 ?auto_1096001 ) ) ( not ( = ?auto_1095997 ?auto_1096003 ) ) ( not ( = ?auto_1095997 ?auto_1096004 ) ) ( not ( = ?auto_1095997 ?auto_1096005 ) ) ( not ( = ?auto_1095997 ?auto_1096006 ) ) ( not ( = ?auto_1095997 ?auto_1096007 ) ) ( not ( = ?auto_1095997 ?auto_1096010 ) ) ( not ( = ?auto_1095997 ?auto_1096011 ) ) ( not ( = ?auto_1095998 ?auto_1095999 ) ) ( not ( = ?auto_1095998 ?auto_1095996 ) ) ( not ( = ?auto_1095998 ?auto_1096000 ) ) ( not ( = ?auto_1095998 ?auto_1096002 ) ) ( not ( = ?auto_1095998 ?auto_1096001 ) ) ( not ( = ?auto_1095998 ?auto_1096003 ) ) ( not ( = ?auto_1095998 ?auto_1096004 ) ) ( not ( = ?auto_1095998 ?auto_1096005 ) ) ( not ( = ?auto_1095998 ?auto_1096006 ) ) ( not ( = ?auto_1095998 ?auto_1096007 ) ) ( not ( = ?auto_1095998 ?auto_1096010 ) ) ( not ( = ?auto_1095998 ?auto_1096011 ) ) ( not ( = ?auto_1095999 ?auto_1095996 ) ) ( not ( = ?auto_1095999 ?auto_1096000 ) ) ( not ( = ?auto_1095999 ?auto_1096002 ) ) ( not ( = ?auto_1095999 ?auto_1096001 ) ) ( not ( = ?auto_1095999 ?auto_1096003 ) ) ( not ( = ?auto_1095999 ?auto_1096004 ) ) ( not ( = ?auto_1095999 ?auto_1096005 ) ) ( not ( = ?auto_1095999 ?auto_1096006 ) ) ( not ( = ?auto_1095999 ?auto_1096007 ) ) ( not ( = ?auto_1095999 ?auto_1096010 ) ) ( not ( = ?auto_1095999 ?auto_1096011 ) ) ( not ( = ?auto_1095996 ?auto_1096000 ) ) ( not ( = ?auto_1095996 ?auto_1096002 ) ) ( not ( = ?auto_1095996 ?auto_1096001 ) ) ( not ( = ?auto_1095996 ?auto_1096003 ) ) ( not ( = ?auto_1095996 ?auto_1096004 ) ) ( not ( = ?auto_1095996 ?auto_1096005 ) ) ( not ( = ?auto_1095996 ?auto_1096006 ) ) ( not ( = ?auto_1095996 ?auto_1096007 ) ) ( not ( = ?auto_1095996 ?auto_1096010 ) ) ( not ( = ?auto_1095996 ?auto_1096011 ) ) ( not ( = ?auto_1096000 ?auto_1096002 ) ) ( not ( = ?auto_1096000 ?auto_1096001 ) ) ( not ( = ?auto_1096000 ?auto_1096003 ) ) ( not ( = ?auto_1096000 ?auto_1096004 ) ) ( not ( = ?auto_1096000 ?auto_1096005 ) ) ( not ( = ?auto_1096000 ?auto_1096006 ) ) ( not ( = ?auto_1096000 ?auto_1096007 ) ) ( not ( = ?auto_1096000 ?auto_1096010 ) ) ( not ( = ?auto_1096000 ?auto_1096011 ) ) ( not ( = ?auto_1096002 ?auto_1096001 ) ) ( not ( = ?auto_1096002 ?auto_1096003 ) ) ( not ( = ?auto_1096002 ?auto_1096004 ) ) ( not ( = ?auto_1096002 ?auto_1096005 ) ) ( not ( = ?auto_1096002 ?auto_1096006 ) ) ( not ( = ?auto_1096002 ?auto_1096007 ) ) ( not ( = ?auto_1096002 ?auto_1096010 ) ) ( not ( = ?auto_1096002 ?auto_1096011 ) ) ( not ( = ?auto_1096001 ?auto_1096003 ) ) ( not ( = ?auto_1096001 ?auto_1096004 ) ) ( not ( = ?auto_1096001 ?auto_1096005 ) ) ( not ( = ?auto_1096001 ?auto_1096006 ) ) ( not ( = ?auto_1096001 ?auto_1096007 ) ) ( not ( = ?auto_1096001 ?auto_1096010 ) ) ( not ( = ?auto_1096001 ?auto_1096011 ) ) ( not ( = ?auto_1096003 ?auto_1096004 ) ) ( not ( = ?auto_1096003 ?auto_1096005 ) ) ( not ( = ?auto_1096003 ?auto_1096006 ) ) ( not ( = ?auto_1096003 ?auto_1096007 ) ) ( not ( = ?auto_1096003 ?auto_1096010 ) ) ( not ( = ?auto_1096003 ?auto_1096011 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1096005 ?auto_1096006 ?auto_1096007 )
      ( MAKE-11CRATE-VERIFY ?auto_1095997 ?auto_1095998 ?auto_1095999 ?auto_1095996 ?auto_1096000 ?auto_1096002 ?auto_1096001 ?auto_1096003 ?auto_1096004 ?auto_1096005 ?auto_1096006 ?auto_1096007 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1096016 - SURFACE
      ?auto_1096017 - SURFACE
      ?auto_1096018 - SURFACE
      ?auto_1096015 - SURFACE
      ?auto_1096019 - SURFACE
      ?auto_1096021 - SURFACE
      ?auto_1096020 - SURFACE
      ?auto_1096022 - SURFACE
      ?auto_1096023 - SURFACE
      ?auto_1096024 - SURFACE
      ?auto_1096025 - SURFACE
      ?auto_1096026 - SURFACE
      ?auto_1096027 - SURFACE
    )
    :vars
    (
      ?auto_1096033 - HOIST
      ?auto_1096032 - PLACE
      ?auto_1096034 - PLACE
      ?auto_1096028 - HOIST
      ?auto_1096030 - SURFACE
      ?auto_1096031 - SURFACE
      ?auto_1096029 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1096033 ?auto_1096032 ) ( IS-CRATE ?auto_1096027 ) ( not ( = ?auto_1096026 ?auto_1096027 ) ) ( not ( = ?auto_1096025 ?auto_1096026 ) ) ( not ( = ?auto_1096025 ?auto_1096027 ) ) ( not ( = ?auto_1096034 ?auto_1096032 ) ) ( HOIST-AT ?auto_1096028 ?auto_1096034 ) ( not ( = ?auto_1096033 ?auto_1096028 ) ) ( SURFACE-AT ?auto_1096027 ?auto_1096034 ) ( ON ?auto_1096027 ?auto_1096030 ) ( CLEAR ?auto_1096027 ) ( not ( = ?auto_1096026 ?auto_1096030 ) ) ( not ( = ?auto_1096027 ?auto_1096030 ) ) ( not ( = ?auto_1096025 ?auto_1096030 ) ) ( IS-CRATE ?auto_1096026 ) ( AVAILABLE ?auto_1096028 ) ( SURFACE-AT ?auto_1096026 ?auto_1096034 ) ( ON ?auto_1096026 ?auto_1096031 ) ( CLEAR ?auto_1096026 ) ( not ( = ?auto_1096026 ?auto_1096031 ) ) ( not ( = ?auto_1096027 ?auto_1096031 ) ) ( not ( = ?auto_1096025 ?auto_1096031 ) ) ( not ( = ?auto_1096030 ?auto_1096031 ) ) ( TRUCK-AT ?auto_1096029 ?auto_1096032 ) ( SURFACE-AT ?auto_1096024 ?auto_1096032 ) ( CLEAR ?auto_1096024 ) ( LIFTING ?auto_1096033 ?auto_1096025 ) ( IS-CRATE ?auto_1096025 ) ( not ( = ?auto_1096024 ?auto_1096025 ) ) ( not ( = ?auto_1096026 ?auto_1096024 ) ) ( not ( = ?auto_1096027 ?auto_1096024 ) ) ( not ( = ?auto_1096030 ?auto_1096024 ) ) ( not ( = ?auto_1096031 ?auto_1096024 ) ) ( ON ?auto_1096017 ?auto_1096016 ) ( ON ?auto_1096018 ?auto_1096017 ) ( ON ?auto_1096015 ?auto_1096018 ) ( ON ?auto_1096019 ?auto_1096015 ) ( ON ?auto_1096021 ?auto_1096019 ) ( ON ?auto_1096020 ?auto_1096021 ) ( ON ?auto_1096022 ?auto_1096020 ) ( ON ?auto_1096023 ?auto_1096022 ) ( ON ?auto_1096024 ?auto_1096023 ) ( not ( = ?auto_1096016 ?auto_1096017 ) ) ( not ( = ?auto_1096016 ?auto_1096018 ) ) ( not ( = ?auto_1096016 ?auto_1096015 ) ) ( not ( = ?auto_1096016 ?auto_1096019 ) ) ( not ( = ?auto_1096016 ?auto_1096021 ) ) ( not ( = ?auto_1096016 ?auto_1096020 ) ) ( not ( = ?auto_1096016 ?auto_1096022 ) ) ( not ( = ?auto_1096016 ?auto_1096023 ) ) ( not ( = ?auto_1096016 ?auto_1096024 ) ) ( not ( = ?auto_1096016 ?auto_1096025 ) ) ( not ( = ?auto_1096016 ?auto_1096026 ) ) ( not ( = ?auto_1096016 ?auto_1096027 ) ) ( not ( = ?auto_1096016 ?auto_1096030 ) ) ( not ( = ?auto_1096016 ?auto_1096031 ) ) ( not ( = ?auto_1096017 ?auto_1096018 ) ) ( not ( = ?auto_1096017 ?auto_1096015 ) ) ( not ( = ?auto_1096017 ?auto_1096019 ) ) ( not ( = ?auto_1096017 ?auto_1096021 ) ) ( not ( = ?auto_1096017 ?auto_1096020 ) ) ( not ( = ?auto_1096017 ?auto_1096022 ) ) ( not ( = ?auto_1096017 ?auto_1096023 ) ) ( not ( = ?auto_1096017 ?auto_1096024 ) ) ( not ( = ?auto_1096017 ?auto_1096025 ) ) ( not ( = ?auto_1096017 ?auto_1096026 ) ) ( not ( = ?auto_1096017 ?auto_1096027 ) ) ( not ( = ?auto_1096017 ?auto_1096030 ) ) ( not ( = ?auto_1096017 ?auto_1096031 ) ) ( not ( = ?auto_1096018 ?auto_1096015 ) ) ( not ( = ?auto_1096018 ?auto_1096019 ) ) ( not ( = ?auto_1096018 ?auto_1096021 ) ) ( not ( = ?auto_1096018 ?auto_1096020 ) ) ( not ( = ?auto_1096018 ?auto_1096022 ) ) ( not ( = ?auto_1096018 ?auto_1096023 ) ) ( not ( = ?auto_1096018 ?auto_1096024 ) ) ( not ( = ?auto_1096018 ?auto_1096025 ) ) ( not ( = ?auto_1096018 ?auto_1096026 ) ) ( not ( = ?auto_1096018 ?auto_1096027 ) ) ( not ( = ?auto_1096018 ?auto_1096030 ) ) ( not ( = ?auto_1096018 ?auto_1096031 ) ) ( not ( = ?auto_1096015 ?auto_1096019 ) ) ( not ( = ?auto_1096015 ?auto_1096021 ) ) ( not ( = ?auto_1096015 ?auto_1096020 ) ) ( not ( = ?auto_1096015 ?auto_1096022 ) ) ( not ( = ?auto_1096015 ?auto_1096023 ) ) ( not ( = ?auto_1096015 ?auto_1096024 ) ) ( not ( = ?auto_1096015 ?auto_1096025 ) ) ( not ( = ?auto_1096015 ?auto_1096026 ) ) ( not ( = ?auto_1096015 ?auto_1096027 ) ) ( not ( = ?auto_1096015 ?auto_1096030 ) ) ( not ( = ?auto_1096015 ?auto_1096031 ) ) ( not ( = ?auto_1096019 ?auto_1096021 ) ) ( not ( = ?auto_1096019 ?auto_1096020 ) ) ( not ( = ?auto_1096019 ?auto_1096022 ) ) ( not ( = ?auto_1096019 ?auto_1096023 ) ) ( not ( = ?auto_1096019 ?auto_1096024 ) ) ( not ( = ?auto_1096019 ?auto_1096025 ) ) ( not ( = ?auto_1096019 ?auto_1096026 ) ) ( not ( = ?auto_1096019 ?auto_1096027 ) ) ( not ( = ?auto_1096019 ?auto_1096030 ) ) ( not ( = ?auto_1096019 ?auto_1096031 ) ) ( not ( = ?auto_1096021 ?auto_1096020 ) ) ( not ( = ?auto_1096021 ?auto_1096022 ) ) ( not ( = ?auto_1096021 ?auto_1096023 ) ) ( not ( = ?auto_1096021 ?auto_1096024 ) ) ( not ( = ?auto_1096021 ?auto_1096025 ) ) ( not ( = ?auto_1096021 ?auto_1096026 ) ) ( not ( = ?auto_1096021 ?auto_1096027 ) ) ( not ( = ?auto_1096021 ?auto_1096030 ) ) ( not ( = ?auto_1096021 ?auto_1096031 ) ) ( not ( = ?auto_1096020 ?auto_1096022 ) ) ( not ( = ?auto_1096020 ?auto_1096023 ) ) ( not ( = ?auto_1096020 ?auto_1096024 ) ) ( not ( = ?auto_1096020 ?auto_1096025 ) ) ( not ( = ?auto_1096020 ?auto_1096026 ) ) ( not ( = ?auto_1096020 ?auto_1096027 ) ) ( not ( = ?auto_1096020 ?auto_1096030 ) ) ( not ( = ?auto_1096020 ?auto_1096031 ) ) ( not ( = ?auto_1096022 ?auto_1096023 ) ) ( not ( = ?auto_1096022 ?auto_1096024 ) ) ( not ( = ?auto_1096022 ?auto_1096025 ) ) ( not ( = ?auto_1096022 ?auto_1096026 ) ) ( not ( = ?auto_1096022 ?auto_1096027 ) ) ( not ( = ?auto_1096022 ?auto_1096030 ) ) ( not ( = ?auto_1096022 ?auto_1096031 ) ) ( not ( = ?auto_1096023 ?auto_1096024 ) ) ( not ( = ?auto_1096023 ?auto_1096025 ) ) ( not ( = ?auto_1096023 ?auto_1096026 ) ) ( not ( = ?auto_1096023 ?auto_1096027 ) ) ( not ( = ?auto_1096023 ?auto_1096030 ) ) ( not ( = ?auto_1096023 ?auto_1096031 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1096025 ?auto_1096026 ?auto_1096027 )
      ( MAKE-12CRATE-VERIFY ?auto_1096016 ?auto_1096017 ?auto_1096018 ?auto_1096015 ?auto_1096019 ?auto_1096021 ?auto_1096020 ?auto_1096022 ?auto_1096023 ?auto_1096024 ?auto_1096025 ?auto_1096026 ?auto_1096027 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1096036 - SURFACE
      ?auto_1096037 - SURFACE
      ?auto_1096038 - SURFACE
      ?auto_1096035 - SURFACE
      ?auto_1096039 - SURFACE
      ?auto_1096041 - SURFACE
      ?auto_1096040 - SURFACE
      ?auto_1096042 - SURFACE
      ?auto_1096043 - SURFACE
      ?auto_1096044 - SURFACE
      ?auto_1096045 - SURFACE
      ?auto_1096046 - SURFACE
      ?auto_1096047 - SURFACE
      ?auto_1096048 - SURFACE
    )
    :vars
    (
      ?auto_1096054 - HOIST
      ?auto_1096053 - PLACE
      ?auto_1096055 - PLACE
      ?auto_1096049 - HOIST
      ?auto_1096051 - SURFACE
      ?auto_1096052 - SURFACE
      ?auto_1096050 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1096054 ?auto_1096053 ) ( IS-CRATE ?auto_1096048 ) ( not ( = ?auto_1096047 ?auto_1096048 ) ) ( not ( = ?auto_1096046 ?auto_1096047 ) ) ( not ( = ?auto_1096046 ?auto_1096048 ) ) ( not ( = ?auto_1096055 ?auto_1096053 ) ) ( HOIST-AT ?auto_1096049 ?auto_1096055 ) ( not ( = ?auto_1096054 ?auto_1096049 ) ) ( SURFACE-AT ?auto_1096048 ?auto_1096055 ) ( ON ?auto_1096048 ?auto_1096051 ) ( CLEAR ?auto_1096048 ) ( not ( = ?auto_1096047 ?auto_1096051 ) ) ( not ( = ?auto_1096048 ?auto_1096051 ) ) ( not ( = ?auto_1096046 ?auto_1096051 ) ) ( IS-CRATE ?auto_1096047 ) ( AVAILABLE ?auto_1096049 ) ( SURFACE-AT ?auto_1096047 ?auto_1096055 ) ( ON ?auto_1096047 ?auto_1096052 ) ( CLEAR ?auto_1096047 ) ( not ( = ?auto_1096047 ?auto_1096052 ) ) ( not ( = ?auto_1096048 ?auto_1096052 ) ) ( not ( = ?auto_1096046 ?auto_1096052 ) ) ( not ( = ?auto_1096051 ?auto_1096052 ) ) ( TRUCK-AT ?auto_1096050 ?auto_1096053 ) ( SURFACE-AT ?auto_1096045 ?auto_1096053 ) ( CLEAR ?auto_1096045 ) ( LIFTING ?auto_1096054 ?auto_1096046 ) ( IS-CRATE ?auto_1096046 ) ( not ( = ?auto_1096045 ?auto_1096046 ) ) ( not ( = ?auto_1096047 ?auto_1096045 ) ) ( not ( = ?auto_1096048 ?auto_1096045 ) ) ( not ( = ?auto_1096051 ?auto_1096045 ) ) ( not ( = ?auto_1096052 ?auto_1096045 ) ) ( ON ?auto_1096037 ?auto_1096036 ) ( ON ?auto_1096038 ?auto_1096037 ) ( ON ?auto_1096035 ?auto_1096038 ) ( ON ?auto_1096039 ?auto_1096035 ) ( ON ?auto_1096041 ?auto_1096039 ) ( ON ?auto_1096040 ?auto_1096041 ) ( ON ?auto_1096042 ?auto_1096040 ) ( ON ?auto_1096043 ?auto_1096042 ) ( ON ?auto_1096044 ?auto_1096043 ) ( ON ?auto_1096045 ?auto_1096044 ) ( not ( = ?auto_1096036 ?auto_1096037 ) ) ( not ( = ?auto_1096036 ?auto_1096038 ) ) ( not ( = ?auto_1096036 ?auto_1096035 ) ) ( not ( = ?auto_1096036 ?auto_1096039 ) ) ( not ( = ?auto_1096036 ?auto_1096041 ) ) ( not ( = ?auto_1096036 ?auto_1096040 ) ) ( not ( = ?auto_1096036 ?auto_1096042 ) ) ( not ( = ?auto_1096036 ?auto_1096043 ) ) ( not ( = ?auto_1096036 ?auto_1096044 ) ) ( not ( = ?auto_1096036 ?auto_1096045 ) ) ( not ( = ?auto_1096036 ?auto_1096046 ) ) ( not ( = ?auto_1096036 ?auto_1096047 ) ) ( not ( = ?auto_1096036 ?auto_1096048 ) ) ( not ( = ?auto_1096036 ?auto_1096051 ) ) ( not ( = ?auto_1096036 ?auto_1096052 ) ) ( not ( = ?auto_1096037 ?auto_1096038 ) ) ( not ( = ?auto_1096037 ?auto_1096035 ) ) ( not ( = ?auto_1096037 ?auto_1096039 ) ) ( not ( = ?auto_1096037 ?auto_1096041 ) ) ( not ( = ?auto_1096037 ?auto_1096040 ) ) ( not ( = ?auto_1096037 ?auto_1096042 ) ) ( not ( = ?auto_1096037 ?auto_1096043 ) ) ( not ( = ?auto_1096037 ?auto_1096044 ) ) ( not ( = ?auto_1096037 ?auto_1096045 ) ) ( not ( = ?auto_1096037 ?auto_1096046 ) ) ( not ( = ?auto_1096037 ?auto_1096047 ) ) ( not ( = ?auto_1096037 ?auto_1096048 ) ) ( not ( = ?auto_1096037 ?auto_1096051 ) ) ( not ( = ?auto_1096037 ?auto_1096052 ) ) ( not ( = ?auto_1096038 ?auto_1096035 ) ) ( not ( = ?auto_1096038 ?auto_1096039 ) ) ( not ( = ?auto_1096038 ?auto_1096041 ) ) ( not ( = ?auto_1096038 ?auto_1096040 ) ) ( not ( = ?auto_1096038 ?auto_1096042 ) ) ( not ( = ?auto_1096038 ?auto_1096043 ) ) ( not ( = ?auto_1096038 ?auto_1096044 ) ) ( not ( = ?auto_1096038 ?auto_1096045 ) ) ( not ( = ?auto_1096038 ?auto_1096046 ) ) ( not ( = ?auto_1096038 ?auto_1096047 ) ) ( not ( = ?auto_1096038 ?auto_1096048 ) ) ( not ( = ?auto_1096038 ?auto_1096051 ) ) ( not ( = ?auto_1096038 ?auto_1096052 ) ) ( not ( = ?auto_1096035 ?auto_1096039 ) ) ( not ( = ?auto_1096035 ?auto_1096041 ) ) ( not ( = ?auto_1096035 ?auto_1096040 ) ) ( not ( = ?auto_1096035 ?auto_1096042 ) ) ( not ( = ?auto_1096035 ?auto_1096043 ) ) ( not ( = ?auto_1096035 ?auto_1096044 ) ) ( not ( = ?auto_1096035 ?auto_1096045 ) ) ( not ( = ?auto_1096035 ?auto_1096046 ) ) ( not ( = ?auto_1096035 ?auto_1096047 ) ) ( not ( = ?auto_1096035 ?auto_1096048 ) ) ( not ( = ?auto_1096035 ?auto_1096051 ) ) ( not ( = ?auto_1096035 ?auto_1096052 ) ) ( not ( = ?auto_1096039 ?auto_1096041 ) ) ( not ( = ?auto_1096039 ?auto_1096040 ) ) ( not ( = ?auto_1096039 ?auto_1096042 ) ) ( not ( = ?auto_1096039 ?auto_1096043 ) ) ( not ( = ?auto_1096039 ?auto_1096044 ) ) ( not ( = ?auto_1096039 ?auto_1096045 ) ) ( not ( = ?auto_1096039 ?auto_1096046 ) ) ( not ( = ?auto_1096039 ?auto_1096047 ) ) ( not ( = ?auto_1096039 ?auto_1096048 ) ) ( not ( = ?auto_1096039 ?auto_1096051 ) ) ( not ( = ?auto_1096039 ?auto_1096052 ) ) ( not ( = ?auto_1096041 ?auto_1096040 ) ) ( not ( = ?auto_1096041 ?auto_1096042 ) ) ( not ( = ?auto_1096041 ?auto_1096043 ) ) ( not ( = ?auto_1096041 ?auto_1096044 ) ) ( not ( = ?auto_1096041 ?auto_1096045 ) ) ( not ( = ?auto_1096041 ?auto_1096046 ) ) ( not ( = ?auto_1096041 ?auto_1096047 ) ) ( not ( = ?auto_1096041 ?auto_1096048 ) ) ( not ( = ?auto_1096041 ?auto_1096051 ) ) ( not ( = ?auto_1096041 ?auto_1096052 ) ) ( not ( = ?auto_1096040 ?auto_1096042 ) ) ( not ( = ?auto_1096040 ?auto_1096043 ) ) ( not ( = ?auto_1096040 ?auto_1096044 ) ) ( not ( = ?auto_1096040 ?auto_1096045 ) ) ( not ( = ?auto_1096040 ?auto_1096046 ) ) ( not ( = ?auto_1096040 ?auto_1096047 ) ) ( not ( = ?auto_1096040 ?auto_1096048 ) ) ( not ( = ?auto_1096040 ?auto_1096051 ) ) ( not ( = ?auto_1096040 ?auto_1096052 ) ) ( not ( = ?auto_1096042 ?auto_1096043 ) ) ( not ( = ?auto_1096042 ?auto_1096044 ) ) ( not ( = ?auto_1096042 ?auto_1096045 ) ) ( not ( = ?auto_1096042 ?auto_1096046 ) ) ( not ( = ?auto_1096042 ?auto_1096047 ) ) ( not ( = ?auto_1096042 ?auto_1096048 ) ) ( not ( = ?auto_1096042 ?auto_1096051 ) ) ( not ( = ?auto_1096042 ?auto_1096052 ) ) ( not ( = ?auto_1096043 ?auto_1096044 ) ) ( not ( = ?auto_1096043 ?auto_1096045 ) ) ( not ( = ?auto_1096043 ?auto_1096046 ) ) ( not ( = ?auto_1096043 ?auto_1096047 ) ) ( not ( = ?auto_1096043 ?auto_1096048 ) ) ( not ( = ?auto_1096043 ?auto_1096051 ) ) ( not ( = ?auto_1096043 ?auto_1096052 ) ) ( not ( = ?auto_1096044 ?auto_1096045 ) ) ( not ( = ?auto_1096044 ?auto_1096046 ) ) ( not ( = ?auto_1096044 ?auto_1096047 ) ) ( not ( = ?auto_1096044 ?auto_1096048 ) ) ( not ( = ?auto_1096044 ?auto_1096051 ) ) ( not ( = ?auto_1096044 ?auto_1096052 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1096046 ?auto_1096047 ?auto_1096048 )
      ( MAKE-13CRATE-VERIFY ?auto_1096036 ?auto_1096037 ?auto_1096038 ?auto_1096035 ?auto_1096039 ?auto_1096041 ?auto_1096040 ?auto_1096042 ?auto_1096043 ?auto_1096044 ?auto_1096045 ?auto_1096046 ?auto_1096047 ?auto_1096048 ) )
  )

)

