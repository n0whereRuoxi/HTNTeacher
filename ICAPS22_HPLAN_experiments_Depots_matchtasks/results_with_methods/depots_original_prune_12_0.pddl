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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_593127 - SURFACE
      ?auto_593128 - SURFACE
    )
    :vars
    (
      ?auto_593129 - HOIST
      ?auto_593130 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_593129 ?auto_593130 ) ( SURFACE-AT ?auto_593127 ?auto_593130 ) ( CLEAR ?auto_593127 ) ( LIFTING ?auto_593129 ?auto_593128 ) ( IS-CRATE ?auto_593128 ) ( not ( = ?auto_593127 ?auto_593128 ) ) )
    :subtasks
    ( ( !DROP ?auto_593129 ?auto_593128 ?auto_593127 ?auto_593130 )
      ( MAKE-1CRATE-VERIFY ?auto_593127 ?auto_593128 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_593131 - SURFACE
      ?auto_593132 - SURFACE
    )
    :vars
    (
      ?auto_593133 - HOIST
      ?auto_593134 - PLACE
      ?auto_593135 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593133 ?auto_593134 ) ( SURFACE-AT ?auto_593131 ?auto_593134 ) ( CLEAR ?auto_593131 ) ( IS-CRATE ?auto_593132 ) ( not ( = ?auto_593131 ?auto_593132 ) ) ( TRUCK-AT ?auto_593135 ?auto_593134 ) ( AVAILABLE ?auto_593133 ) ( IN ?auto_593132 ?auto_593135 ) )
    :subtasks
    ( ( !UNLOAD ?auto_593133 ?auto_593132 ?auto_593135 ?auto_593134 )
      ( MAKE-1CRATE ?auto_593131 ?auto_593132 )
      ( MAKE-1CRATE-VERIFY ?auto_593131 ?auto_593132 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_593136 - SURFACE
      ?auto_593137 - SURFACE
    )
    :vars
    (
      ?auto_593138 - HOIST
      ?auto_593139 - PLACE
      ?auto_593140 - TRUCK
      ?auto_593141 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_593138 ?auto_593139 ) ( SURFACE-AT ?auto_593136 ?auto_593139 ) ( CLEAR ?auto_593136 ) ( IS-CRATE ?auto_593137 ) ( not ( = ?auto_593136 ?auto_593137 ) ) ( AVAILABLE ?auto_593138 ) ( IN ?auto_593137 ?auto_593140 ) ( TRUCK-AT ?auto_593140 ?auto_593141 ) ( not ( = ?auto_593141 ?auto_593139 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_593140 ?auto_593141 ?auto_593139 )
      ( MAKE-1CRATE ?auto_593136 ?auto_593137 )
      ( MAKE-1CRATE-VERIFY ?auto_593136 ?auto_593137 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_593142 - SURFACE
      ?auto_593143 - SURFACE
    )
    :vars
    (
      ?auto_593147 - HOIST
      ?auto_593146 - PLACE
      ?auto_593144 - TRUCK
      ?auto_593145 - PLACE
      ?auto_593148 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_593147 ?auto_593146 ) ( SURFACE-AT ?auto_593142 ?auto_593146 ) ( CLEAR ?auto_593142 ) ( IS-CRATE ?auto_593143 ) ( not ( = ?auto_593142 ?auto_593143 ) ) ( AVAILABLE ?auto_593147 ) ( TRUCK-AT ?auto_593144 ?auto_593145 ) ( not ( = ?auto_593145 ?auto_593146 ) ) ( HOIST-AT ?auto_593148 ?auto_593145 ) ( LIFTING ?auto_593148 ?auto_593143 ) ( not ( = ?auto_593147 ?auto_593148 ) ) )
    :subtasks
    ( ( !LOAD ?auto_593148 ?auto_593143 ?auto_593144 ?auto_593145 )
      ( MAKE-1CRATE ?auto_593142 ?auto_593143 )
      ( MAKE-1CRATE-VERIFY ?auto_593142 ?auto_593143 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_593149 - SURFACE
      ?auto_593150 - SURFACE
    )
    :vars
    (
      ?auto_593151 - HOIST
      ?auto_593153 - PLACE
      ?auto_593152 - TRUCK
      ?auto_593154 - PLACE
      ?auto_593155 - HOIST
      ?auto_593156 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_593151 ?auto_593153 ) ( SURFACE-AT ?auto_593149 ?auto_593153 ) ( CLEAR ?auto_593149 ) ( IS-CRATE ?auto_593150 ) ( not ( = ?auto_593149 ?auto_593150 ) ) ( AVAILABLE ?auto_593151 ) ( TRUCK-AT ?auto_593152 ?auto_593154 ) ( not ( = ?auto_593154 ?auto_593153 ) ) ( HOIST-AT ?auto_593155 ?auto_593154 ) ( not ( = ?auto_593151 ?auto_593155 ) ) ( AVAILABLE ?auto_593155 ) ( SURFACE-AT ?auto_593150 ?auto_593154 ) ( ON ?auto_593150 ?auto_593156 ) ( CLEAR ?auto_593150 ) ( not ( = ?auto_593149 ?auto_593156 ) ) ( not ( = ?auto_593150 ?auto_593156 ) ) )
    :subtasks
    ( ( !LIFT ?auto_593155 ?auto_593150 ?auto_593156 ?auto_593154 )
      ( MAKE-1CRATE ?auto_593149 ?auto_593150 )
      ( MAKE-1CRATE-VERIFY ?auto_593149 ?auto_593150 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_593157 - SURFACE
      ?auto_593158 - SURFACE
    )
    :vars
    (
      ?auto_593163 - HOIST
      ?auto_593161 - PLACE
      ?auto_593164 - PLACE
      ?auto_593159 - HOIST
      ?auto_593162 - SURFACE
      ?auto_593160 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593163 ?auto_593161 ) ( SURFACE-AT ?auto_593157 ?auto_593161 ) ( CLEAR ?auto_593157 ) ( IS-CRATE ?auto_593158 ) ( not ( = ?auto_593157 ?auto_593158 ) ) ( AVAILABLE ?auto_593163 ) ( not ( = ?auto_593164 ?auto_593161 ) ) ( HOIST-AT ?auto_593159 ?auto_593164 ) ( not ( = ?auto_593163 ?auto_593159 ) ) ( AVAILABLE ?auto_593159 ) ( SURFACE-AT ?auto_593158 ?auto_593164 ) ( ON ?auto_593158 ?auto_593162 ) ( CLEAR ?auto_593158 ) ( not ( = ?auto_593157 ?auto_593162 ) ) ( not ( = ?auto_593158 ?auto_593162 ) ) ( TRUCK-AT ?auto_593160 ?auto_593161 ) )
    :subtasks
    ( ( !DRIVE ?auto_593160 ?auto_593161 ?auto_593164 )
      ( MAKE-1CRATE ?auto_593157 ?auto_593158 )
      ( MAKE-1CRATE-VERIFY ?auto_593157 ?auto_593158 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_593174 - SURFACE
      ?auto_593175 - SURFACE
      ?auto_593176 - SURFACE
    )
    :vars
    (
      ?auto_593177 - HOIST
      ?auto_593178 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_593177 ?auto_593178 ) ( SURFACE-AT ?auto_593175 ?auto_593178 ) ( CLEAR ?auto_593175 ) ( LIFTING ?auto_593177 ?auto_593176 ) ( IS-CRATE ?auto_593176 ) ( not ( = ?auto_593175 ?auto_593176 ) ) ( ON ?auto_593175 ?auto_593174 ) ( not ( = ?auto_593174 ?auto_593175 ) ) ( not ( = ?auto_593174 ?auto_593176 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_593175 ?auto_593176 )
      ( MAKE-2CRATE-VERIFY ?auto_593174 ?auto_593175 ?auto_593176 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_593184 - SURFACE
      ?auto_593185 - SURFACE
      ?auto_593186 - SURFACE
    )
    :vars
    (
      ?auto_593188 - HOIST
      ?auto_593189 - PLACE
      ?auto_593187 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593188 ?auto_593189 ) ( SURFACE-AT ?auto_593185 ?auto_593189 ) ( CLEAR ?auto_593185 ) ( IS-CRATE ?auto_593186 ) ( not ( = ?auto_593185 ?auto_593186 ) ) ( TRUCK-AT ?auto_593187 ?auto_593189 ) ( AVAILABLE ?auto_593188 ) ( IN ?auto_593186 ?auto_593187 ) ( ON ?auto_593185 ?auto_593184 ) ( not ( = ?auto_593184 ?auto_593185 ) ) ( not ( = ?auto_593184 ?auto_593186 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_593185 ?auto_593186 )
      ( MAKE-2CRATE-VERIFY ?auto_593184 ?auto_593185 ?auto_593186 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_593190 - SURFACE
      ?auto_593191 - SURFACE
    )
    :vars
    (
      ?auto_593193 - HOIST
      ?auto_593192 - PLACE
      ?auto_593195 - TRUCK
      ?auto_593194 - SURFACE
      ?auto_593196 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_593193 ?auto_593192 ) ( SURFACE-AT ?auto_593190 ?auto_593192 ) ( CLEAR ?auto_593190 ) ( IS-CRATE ?auto_593191 ) ( not ( = ?auto_593190 ?auto_593191 ) ) ( AVAILABLE ?auto_593193 ) ( IN ?auto_593191 ?auto_593195 ) ( ON ?auto_593190 ?auto_593194 ) ( not ( = ?auto_593194 ?auto_593190 ) ) ( not ( = ?auto_593194 ?auto_593191 ) ) ( TRUCK-AT ?auto_593195 ?auto_593196 ) ( not ( = ?auto_593196 ?auto_593192 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_593195 ?auto_593196 ?auto_593192 )
      ( MAKE-2CRATE ?auto_593194 ?auto_593190 ?auto_593191 )
      ( MAKE-1CRATE-VERIFY ?auto_593190 ?auto_593191 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_593197 - SURFACE
      ?auto_593198 - SURFACE
      ?auto_593199 - SURFACE
    )
    :vars
    (
      ?auto_593203 - HOIST
      ?auto_593202 - PLACE
      ?auto_593200 - TRUCK
      ?auto_593201 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_593203 ?auto_593202 ) ( SURFACE-AT ?auto_593198 ?auto_593202 ) ( CLEAR ?auto_593198 ) ( IS-CRATE ?auto_593199 ) ( not ( = ?auto_593198 ?auto_593199 ) ) ( AVAILABLE ?auto_593203 ) ( IN ?auto_593199 ?auto_593200 ) ( ON ?auto_593198 ?auto_593197 ) ( not ( = ?auto_593197 ?auto_593198 ) ) ( not ( = ?auto_593197 ?auto_593199 ) ) ( TRUCK-AT ?auto_593200 ?auto_593201 ) ( not ( = ?auto_593201 ?auto_593202 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_593198 ?auto_593199 )
      ( MAKE-2CRATE-VERIFY ?auto_593197 ?auto_593198 ?auto_593199 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_593204 - SURFACE
      ?auto_593205 - SURFACE
    )
    :vars
    (
      ?auto_593208 - HOIST
      ?auto_593206 - PLACE
      ?auto_593210 - SURFACE
      ?auto_593209 - TRUCK
      ?auto_593207 - PLACE
      ?auto_593211 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_593208 ?auto_593206 ) ( SURFACE-AT ?auto_593204 ?auto_593206 ) ( CLEAR ?auto_593204 ) ( IS-CRATE ?auto_593205 ) ( not ( = ?auto_593204 ?auto_593205 ) ) ( AVAILABLE ?auto_593208 ) ( ON ?auto_593204 ?auto_593210 ) ( not ( = ?auto_593210 ?auto_593204 ) ) ( not ( = ?auto_593210 ?auto_593205 ) ) ( TRUCK-AT ?auto_593209 ?auto_593207 ) ( not ( = ?auto_593207 ?auto_593206 ) ) ( HOIST-AT ?auto_593211 ?auto_593207 ) ( LIFTING ?auto_593211 ?auto_593205 ) ( not ( = ?auto_593208 ?auto_593211 ) ) )
    :subtasks
    ( ( !LOAD ?auto_593211 ?auto_593205 ?auto_593209 ?auto_593207 )
      ( MAKE-2CRATE ?auto_593210 ?auto_593204 ?auto_593205 )
      ( MAKE-1CRATE-VERIFY ?auto_593204 ?auto_593205 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_593212 - SURFACE
      ?auto_593213 - SURFACE
      ?auto_593214 - SURFACE
    )
    :vars
    (
      ?auto_593216 - HOIST
      ?auto_593219 - PLACE
      ?auto_593215 - TRUCK
      ?auto_593217 - PLACE
      ?auto_593218 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_593216 ?auto_593219 ) ( SURFACE-AT ?auto_593213 ?auto_593219 ) ( CLEAR ?auto_593213 ) ( IS-CRATE ?auto_593214 ) ( not ( = ?auto_593213 ?auto_593214 ) ) ( AVAILABLE ?auto_593216 ) ( ON ?auto_593213 ?auto_593212 ) ( not ( = ?auto_593212 ?auto_593213 ) ) ( not ( = ?auto_593212 ?auto_593214 ) ) ( TRUCK-AT ?auto_593215 ?auto_593217 ) ( not ( = ?auto_593217 ?auto_593219 ) ) ( HOIST-AT ?auto_593218 ?auto_593217 ) ( LIFTING ?auto_593218 ?auto_593214 ) ( not ( = ?auto_593216 ?auto_593218 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_593213 ?auto_593214 )
      ( MAKE-2CRATE-VERIFY ?auto_593212 ?auto_593213 ?auto_593214 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_593220 - SURFACE
      ?auto_593221 - SURFACE
    )
    :vars
    (
      ?auto_593226 - HOIST
      ?auto_593223 - PLACE
      ?auto_593225 - SURFACE
      ?auto_593222 - TRUCK
      ?auto_593227 - PLACE
      ?auto_593224 - HOIST
      ?auto_593228 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_593226 ?auto_593223 ) ( SURFACE-AT ?auto_593220 ?auto_593223 ) ( CLEAR ?auto_593220 ) ( IS-CRATE ?auto_593221 ) ( not ( = ?auto_593220 ?auto_593221 ) ) ( AVAILABLE ?auto_593226 ) ( ON ?auto_593220 ?auto_593225 ) ( not ( = ?auto_593225 ?auto_593220 ) ) ( not ( = ?auto_593225 ?auto_593221 ) ) ( TRUCK-AT ?auto_593222 ?auto_593227 ) ( not ( = ?auto_593227 ?auto_593223 ) ) ( HOIST-AT ?auto_593224 ?auto_593227 ) ( not ( = ?auto_593226 ?auto_593224 ) ) ( AVAILABLE ?auto_593224 ) ( SURFACE-AT ?auto_593221 ?auto_593227 ) ( ON ?auto_593221 ?auto_593228 ) ( CLEAR ?auto_593221 ) ( not ( = ?auto_593220 ?auto_593228 ) ) ( not ( = ?auto_593221 ?auto_593228 ) ) ( not ( = ?auto_593225 ?auto_593228 ) ) )
    :subtasks
    ( ( !LIFT ?auto_593224 ?auto_593221 ?auto_593228 ?auto_593227 )
      ( MAKE-2CRATE ?auto_593225 ?auto_593220 ?auto_593221 )
      ( MAKE-1CRATE-VERIFY ?auto_593220 ?auto_593221 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_593229 - SURFACE
      ?auto_593230 - SURFACE
      ?auto_593231 - SURFACE
    )
    :vars
    (
      ?auto_593237 - HOIST
      ?auto_593234 - PLACE
      ?auto_593233 - TRUCK
      ?auto_593235 - PLACE
      ?auto_593236 - HOIST
      ?auto_593232 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_593237 ?auto_593234 ) ( SURFACE-AT ?auto_593230 ?auto_593234 ) ( CLEAR ?auto_593230 ) ( IS-CRATE ?auto_593231 ) ( not ( = ?auto_593230 ?auto_593231 ) ) ( AVAILABLE ?auto_593237 ) ( ON ?auto_593230 ?auto_593229 ) ( not ( = ?auto_593229 ?auto_593230 ) ) ( not ( = ?auto_593229 ?auto_593231 ) ) ( TRUCK-AT ?auto_593233 ?auto_593235 ) ( not ( = ?auto_593235 ?auto_593234 ) ) ( HOIST-AT ?auto_593236 ?auto_593235 ) ( not ( = ?auto_593237 ?auto_593236 ) ) ( AVAILABLE ?auto_593236 ) ( SURFACE-AT ?auto_593231 ?auto_593235 ) ( ON ?auto_593231 ?auto_593232 ) ( CLEAR ?auto_593231 ) ( not ( = ?auto_593230 ?auto_593232 ) ) ( not ( = ?auto_593231 ?auto_593232 ) ) ( not ( = ?auto_593229 ?auto_593232 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_593230 ?auto_593231 )
      ( MAKE-2CRATE-VERIFY ?auto_593229 ?auto_593230 ?auto_593231 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_593238 - SURFACE
      ?auto_593239 - SURFACE
    )
    :vars
    (
      ?auto_593243 - HOIST
      ?auto_593244 - PLACE
      ?auto_593245 - SURFACE
      ?auto_593241 - PLACE
      ?auto_593246 - HOIST
      ?auto_593240 - SURFACE
      ?auto_593242 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593243 ?auto_593244 ) ( SURFACE-AT ?auto_593238 ?auto_593244 ) ( CLEAR ?auto_593238 ) ( IS-CRATE ?auto_593239 ) ( not ( = ?auto_593238 ?auto_593239 ) ) ( AVAILABLE ?auto_593243 ) ( ON ?auto_593238 ?auto_593245 ) ( not ( = ?auto_593245 ?auto_593238 ) ) ( not ( = ?auto_593245 ?auto_593239 ) ) ( not ( = ?auto_593241 ?auto_593244 ) ) ( HOIST-AT ?auto_593246 ?auto_593241 ) ( not ( = ?auto_593243 ?auto_593246 ) ) ( AVAILABLE ?auto_593246 ) ( SURFACE-AT ?auto_593239 ?auto_593241 ) ( ON ?auto_593239 ?auto_593240 ) ( CLEAR ?auto_593239 ) ( not ( = ?auto_593238 ?auto_593240 ) ) ( not ( = ?auto_593239 ?auto_593240 ) ) ( not ( = ?auto_593245 ?auto_593240 ) ) ( TRUCK-AT ?auto_593242 ?auto_593244 ) )
    :subtasks
    ( ( !DRIVE ?auto_593242 ?auto_593244 ?auto_593241 )
      ( MAKE-2CRATE ?auto_593245 ?auto_593238 ?auto_593239 )
      ( MAKE-1CRATE-VERIFY ?auto_593238 ?auto_593239 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_593247 - SURFACE
      ?auto_593248 - SURFACE
      ?auto_593249 - SURFACE
    )
    :vars
    (
      ?auto_593252 - HOIST
      ?auto_593250 - PLACE
      ?auto_593255 - PLACE
      ?auto_593253 - HOIST
      ?auto_593254 - SURFACE
      ?auto_593251 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593252 ?auto_593250 ) ( SURFACE-AT ?auto_593248 ?auto_593250 ) ( CLEAR ?auto_593248 ) ( IS-CRATE ?auto_593249 ) ( not ( = ?auto_593248 ?auto_593249 ) ) ( AVAILABLE ?auto_593252 ) ( ON ?auto_593248 ?auto_593247 ) ( not ( = ?auto_593247 ?auto_593248 ) ) ( not ( = ?auto_593247 ?auto_593249 ) ) ( not ( = ?auto_593255 ?auto_593250 ) ) ( HOIST-AT ?auto_593253 ?auto_593255 ) ( not ( = ?auto_593252 ?auto_593253 ) ) ( AVAILABLE ?auto_593253 ) ( SURFACE-AT ?auto_593249 ?auto_593255 ) ( ON ?auto_593249 ?auto_593254 ) ( CLEAR ?auto_593249 ) ( not ( = ?auto_593248 ?auto_593254 ) ) ( not ( = ?auto_593249 ?auto_593254 ) ) ( not ( = ?auto_593247 ?auto_593254 ) ) ( TRUCK-AT ?auto_593251 ?auto_593250 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_593248 ?auto_593249 )
      ( MAKE-2CRATE-VERIFY ?auto_593247 ?auto_593248 ?auto_593249 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_593256 - SURFACE
      ?auto_593257 - SURFACE
    )
    :vars
    (
      ?auto_593261 - HOIST
      ?auto_593258 - PLACE
      ?auto_593259 - SURFACE
      ?auto_593262 - PLACE
      ?auto_593264 - HOIST
      ?auto_593260 - SURFACE
      ?auto_593263 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593261 ?auto_593258 ) ( IS-CRATE ?auto_593257 ) ( not ( = ?auto_593256 ?auto_593257 ) ) ( not ( = ?auto_593259 ?auto_593256 ) ) ( not ( = ?auto_593259 ?auto_593257 ) ) ( not ( = ?auto_593262 ?auto_593258 ) ) ( HOIST-AT ?auto_593264 ?auto_593262 ) ( not ( = ?auto_593261 ?auto_593264 ) ) ( AVAILABLE ?auto_593264 ) ( SURFACE-AT ?auto_593257 ?auto_593262 ) ( ON ?auto_593257 ?auto_593260 ) ( CLEAR ?auto_593257 ) ( not ( = ?auto_593256 ?auto_593260 ) ) ( not ( = ?auto_593257 ?auto_593260 ) ) ( not ( = ?auto_593259 ?auto_593260 ) ) ( TRUCK-AT ?auto_593263 ?auto_593258 ) ( SURFACE-AT ?auto_593259 ?auto_593258 ) ( CLEAR ?auto_593259 ) ( LIFTING ?auto_593261 ?auto_593256 ) ( IS-CRATE ?auto_593256 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_593259 ?auto_593256 )
      ( MAKE-2CRATE ?auto_593259 ?auto_593256 ?auto_593257 )
      ( MAKE-1CRATE-VERIFY ?auto_593256 ?auto_593257 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_593265 - SURFACE
      ?auto_593266 - SURFACE
      ?auto_593267 - SURFACE
    )
    :vars
    (
      ?auto_593272 - HOIST
      ?auto_593273 - PLACE
      ?auto_593271 - PLACE
      ?auto_593270 - HOIST
      ?auto_593268 - SURFACE
      ?auto_593269 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593272 ?auto_593273 ) ( IS-CRATE ?auto_593267 ) ( not ( = ?auto_593266 ?auto_593267 ) ) ( not ( = ?auto_593265 ?auto_593266 ) ) ( not ( = ?auto_593265 ?auto_593267 ) ) ( not ( = ?auto_593271 ?auto_593273 ) ) ( HOIST-AT ?auto_593270 ?auto_593271 ) ( not ( = ?auto_593272 ?auto_593270 ) ) ( AVAILABLE ?auto_593270 ) ( SURFACE-AT ?auto_593267 ?auto_593271 ) ( ON ?auto_593267 ?auto_593268 ) ( CLEAR ?auto_593267 ) ( not ( = ?auto_593266 ?auto_593268 ) ) ( not ( = ?auto_593267 ?auto_593268 ) ) ( not ( = ?auto_593265 ?auto_593268 ) ) ( TRUCK-AT ?auto_593269 ?auto_593273 ) ( SURFACE-AT ?auto_593265 ?auto_593273 ) ( CLEAR ?auto_593265 ) ( LIFTING ?auto_593272 ?auto_593266 ) ( IS-CRATE ?auto_593266 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_593266 ?auto_593267 )
      ( MAKE-2CRATE-VERIFY ?auto_593265 ?auto_593266 ?auto_593267 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_593274 - SURFACE
      ?auto_593275 - SURFACE
    )
    :vars
    (
      ?auto_593276 - HOIST
      ?auto_593281 - PLACE
      ?auto_593277 - SURFACE
      ?auto_593279 - PLACE
      ?auto_593278 - HOIST
      ?auto_593282 - SURFACE
      ?auto_593280 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593276 ?auto_593281 ) ( IS-CRATE ?auto_593275 ) ( not ( = ?auto_593274 ?auto_593275 ) ) ( not ( = ?auto_593277 ?auto_593274 ) ) ( not ( = ?auto_593277 ?auto_593275 ) ) ( not ( = ?auto_593279 ?auto_593281 ) ) ( HOIST-AT ?auto_593278 ?auto_593279 ) ( not ( = ?auto_593276 ?auto_593278 ) ) ( AVAILABLE ?auto_593278 ) ( SURFACE-AT ?auto_593275 ?auto_593279 ) ( ON ?auto_593275 ?auto_593282 ) ( CLEAR ?auto_593275 ) ( not ( = ?auto_593274 ?auto_593282 ) ) ( not ( = ?auto_593275 ?auto_593282 ) ) ( not ( = ?auto_593277 ?auto_593282 ) ) ( TRUCK-AT ?auto_593280 ?auto_593281 ) ( SURFACE-AT ?auto_593277 ?auto_593281 ) ( CLEAR ?auto_593277 ) ( IS-CRATE ?auto_593274 ) ( AVAILABLE ?auto_593276 ) ( IN ?auto_593274 ?auto_593280 ) )
    :subtasks
    ( ( !UNLOAD ?auto_593276 ?auto_593274 ?auto_593280 ?auto_593281 )
      ( MAKE-2CRATE ?auto_593277 ?auto_593274 ?auto_593275 )
      ( MAKE-1CRATE-VERIFY ?auto_593274 ?auto_593275 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_593283 - SURFACE
      ?auto_593284 - SURFACE
      ?auto_593285 - SURFACE
    )
    :vars
    (
      ?auto_593286 - HOIST
      ?auto_593287 - PLACE
      ?auto_593291 - PLACE
      ?auto_593290 - HOIST
      ?auto_593289 - SURFACE
      ?auto_593288 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593286 ?auto_593287 ) ( IS-CRATE ?auto_593285 ) ( not ( = ?auto_593284 ?auto_593285 ) ) ( not ( = ?auto_593283 ?auto_593284 ) ) ( not ( = ?auto_593283 ?auto_593285 ) ) ( not ( = ?auto_593291 ?auto_593287 ) ) ( HOIST-AT ?auto_593290 ?auto_593291 ) ( not ( = ?auto_593286 ?auto_593290 ) ) ( AVAILABLE ?auto_593290 ) ( SURFACE-AT ?auto_593285 ?auto_593291 ) ( ON ?auto_593285 ?auto_593289 ) ( CLEAR ?auto_593285 ) ( not ( = ?auto_593284 ?auto_593289 ) ) ( not ( = ?auto_593285 ?auto_593289 ) ) ( not ( = ?auto_593283 ?auto_593289 ) ) ( TRUCK-AT ?auto_593288 ?auto_593287 ) ( SURFACE-AT ?auto_593283 ?auto_593287 ) ( CLEAR ?auto_593283 ) ( IS-CRATE ?auto_593284 ) ( AVAILABLE ?auto_593286 ) ( IN ?auto_593284 ?auto_593288 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_593284 ?auto_593285 )
      ( MAKE-2CRATE-VERIFY ?auto_593283 ?auto_593284 ?auto_593285 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_593328 - SURFACE
      ?auto_593329 - SURFACE
    )
    :vars
    (
      ?auto_593332 - HOIST
      ?auto_593333 - PLACE
      ?auto_593335 - SURFACE
      ?auto_593336 - PLACE
      ?auto_593330 - HOIST
      ?auto_593334 - SURFACE
      ?auto_593331 - TRUCK
      ?auto_593337 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_593332 ?auto_593333 ) ( SURFACE-AT ?auto_593328 ?auto_593333 ) ( CLEAR ?auto_593328 ) ( IS-CRATE ?auto_593329 ) ( not ( = ?auto_593328 ?auto_593329 ) ) ( AVAILABLE ?auto_593332 ) ( ON ?auto_593328 ?auto_593335 ) ( not ( = ?auto_593335 ?auto_593328 ) ) ( not ( = ?auto_593335 ?auto_593329 ) ) ( not ( = ?auto_593336 ?auto_593333 ) ) ( HOIST-AT ?auto_593330 ?auto_593336 ) ( not ( = ?auto_593332 ?auto_593330 ) ) ( AVAILABLE ?auto_593330 ) ( SURFACE-AT ?auto_593329 ?auto_593336 ) ( ON ?auto_593329 ?auto_593334 ) ( CLEAR ?auto_593329 ) ( not ( = ?auto_593328 ?auto_593334 ) ) ( not ( = ?auto_593329 ?auto_593334 ) ) ( not ( = ?auto_593335 ?auto_593334 ) ) ( TRUCK-AT ?auto_593331 ?auto_593337 ) ( not ( = ?auto_593337 ?auto_593333 ) ) ( not ( = ?auto_593336 ?auto_593337 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_593331 ?auto_593337 ?auto_593333 )
      ( MAKE-1CRATE ?auto_593328 ?auto_593329 )
      ( MAKE-1CRATE-VERIFY ?auto_593328 ?auto_593329 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_593368 - SURFACE
      ?auto_593369 - SURFACE
      ?auto_593370 - SURFACE
      ?auto_593367 - SURFACE
    )
    :vars
    (
      ?auto_593371 - HOIST
      ?auto_593372 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_593371 ?auto_593372 ) ( SURFACE-AT ?auto_593370 ?auto_593372 ) ( CLEAR ?auto_593370 ) ( LIFTING ?auto_593371 ?auto_593367 ) ( IS-CRATE ?auto_593367 ) ( not ( = ?auto_593370 ?auto_593367 ) ) ( ON ?auto_593369 ?auto_593368 ) ( ON ?auto_593370 ?auto_593369 ) ( not ( = ?auto_593368 ?auto_593369 ) ) ( not ( = ?auto_593368 ?auto_593370 ) ) ( not ( = ?auto_593368 ?auto_593367 ) ) ( not ( = ?auto_593369 ?auto_593370 ) ) ( not ( = ?auto_593369 ?auto_593367 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_593370 ?auto_593367 )
      ( MAKE-3CRATE-VERIFY ?auto_593368 ?auto_593369 ?auto_593370 ?auto_593367 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_593385 - SURFACE
      ?auto_593386 - SURFACE
      ?auto_593387 - SURFACE
      ?auto_593384 - SURFACE
    )
    :vars
    (
      ?auto_593388 - HOIST
      ?auto_593390 - PLACE
      ?auto_593389 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593388 ?auto_593390 ) ( SURFACE-AT ?auto_593387 ?auto_593390 ) ( CLEAR ?auto_593387 ) ( IS-CRATE ?auto_593384 ) ( not ( = ?auto_593387 ?auto_593384 ) ) ( TRUCK-AT ?auto_593389 ?auto_593390 ) ( AVAILABLE ?auto_593388 ) ( IN ?auto_593384 ?auto_593389 ) ( ON ?auto_593387 ?auto_593386 ) ( not ( = ?auto_593386 ?auto_593387 ) ) ( not ( = ?auto_593386 ?auto_593384 ) ) ( ON ?auto_593386 ?auto_593385 ) ( not ( = ?auto_593385 ?auto_593386 ) ) ( not ( = ?auto_593385 ?auto_593387 ) ) ( not ( = ?auto_593385 ?auto_593384 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593386 ?auto_593387 ?auto_593384 )
      ( MAKE-3CRATE-VERIFY ?auto_593385 ?auto_593386 ?auto_593387 ?auto_593384 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_593406 - SURFACE
      ?auto_593407 - SURFACE
      ?auto_593408 - SURFACE
      ?auto_593405 - SURFACE
    )
    :vars
    (
      ?auto_593409 - HOIST
      ?auto_593410 - PLACE
      ?auto_593412 - TRUCK
      ?auto_593411 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_593409 ?auto_593410 ) ( SURFACE-AT ?auto_593408 ?auto_593410 ) ( CLEAR ?auto_593408 ) ( IS-CRATE ?auto_593405 ) ( not ( = ?auto_593408 ?auto_593405 ) ) ( AVAILABLE ?auto_593409 ) ( IN ?auto_593405 ?auto_593412 ) ( ON ?auto_593408 ?auto_593407 ) ( not ( = ?auto_593407 ?auto_593408 ) ) ( not ( = ?auto_593407 ?auto_593405 ) ) ( TRUCK-AT ?auto_593412 ?auto_593411 ) ( not ( = ?auto_593411 ?auto_593410 ) ) ( ON ?auto_593407 ?auto_593406 ) ( not ( = ?auto_593406 ?auto_593407 ) ) ( not ( = ?auto_593406 ?auto_593408 ) ) ( not ( = ?auto_593406 ?auto_593405 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593407 ?auto_593408 ?auto_593405 )
      ( MAKE-3CRATE-VERIFY ?auto_593406 ?auto_593407 ?auto_593408 ?auto_593405 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_593430 - SURFACE
      ?auto_593431 - SURFACE
      ?auto_593432 - SURFACE
      ?auto_593429 - SURFACE
    )
    :vars
    (
      ?auto_593437 - HOIST
      ?auto_593434 - PLACE
      ?auto_593433 - TRUCK
      ?auto_593436 - PLACE
      ?auto_593435 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_593437 ?auto_593434 ) ( SURFACE-AT ?auto_593432 ?auto_593434 ) ( CLEAR ?auto_593432 ) ( IS-CRATE ?auto_593429 ) ( not ( = ?auto_593432 ?auto_593429 ) ) ( AVAILABLE ?auto_593437 ) ( ON ?auto_593432 ?auto_593431 ) ( not ( = ?auto_593431 ?auto_593432 ) ) ( not ( = ?auto_593431 ?auto_593429 ) ) ( TRUCK-AT ?auto_593433 ?auto_593436 ) ( not ( = ?auto_593436 ?auto_593434 ) ) ( HOIST-AT ?auto_593435 ?auto_593436 ) ( LIFTING ?auto_593435 ?auto_593429 ) ( not ( = ?auto_593437 ?auto_593435 ) ) ( ON ?auto_593431 ?auto_593430 ) ( not ( = ?auto_593430 ?auto_593431 ) ) ( not ( = ?auto_593430 ?auto_593432 ) ) ( not ( = ?auto_593430 ?auto_593429 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593431 ?auto_593432 ?auto_593429 )
      ( MAKE-3CRATE-VERIFY ?auto_593430 ?auto_593431 ?auto_593432 ?auto_593429 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_593457 - SURFACE
      ?auto_593458 - SURFACE
      ?auto_593459 - SURFACE
      ?auto_593456 - SURFACE
    )
    :vars
    (
      ?auto_593465 - HOIST
      ?auto_593462 - PLACE
      ?auto_593460 - TRUCK
      ?auto_593461 - PLACE
      ?auto_593464 - HOIST
      ?auto_593463 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_593465 ?auto_593462 ) ( SURFACE-AT ?auto_593459 ?auto_593462 ) ( CLEAR ?auto_593459 ) ( IS-CRATE ?auto_593456 ) ( not ( = ?auto_593459 ?auto_593456 ) ) ( AVAILABLE ?auto_593465 ) ( ON ?auto_593459 ?auto_593458 ) ( not ( = ?auto_593458 ?auto_593459 ) ) ( not ( = ?auto_593458 ?auto_593456 ) ) ( TRUCK-AT ?auto_593460 ?auto_593461 ) ( not ( = ?auto_593461 ?auto_593462 ) ) ( HOIST-AT ?auto_593464 ?auto_593461 ) ( not ( = ?auto_593465 ?auto_593464 ) ) ( AVAILABLE ?auto_593464 ) ( SURFACE-AT ?auto_593456 ?auto_593461 ) ( ON ?auto_593456 ?auto_593463 ) ( CLEAR ?auto_593456 ) ( not ( = ?auto_593459 ?auto_593463 ) ) ( not ( = ?auto_593456 ?auto_593463 ) ) ( not ( = ?auto_593458 ?auto_593463 ) ) ( ON ?auto_593458 ?auto_593457 ) ( not ( = ?auto_593457 ?auto_593458 ) ) ( not ( = ?auto_593457 ?auto_593459 ) ) ( not ( = ?auto_593457 ?auto_593456 ) ) ( not ( = ?auto_593457 ?auto_593463 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593458 ?auto_593459 ?auto_593456 )
      ( MAKE-3CRATE-VERIFY ?auto_593457 ?auto_593458 ?auto_593459 ?auto_593456 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_593485 - SURFACE
      ?auto_593486 - SURFACE
      ?auto_593487 - SURFACE
      ?auto_593484 - SURFACE
    )
    :vars
    (
      ?auto_593489 - HOIST
      ?auto_593492 - PLACE
      ?auto_593493 - PLACE
      ?auto_593491 - HOIST
      ?auto_593490 - SURFACE
      ?auto_593488 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593489 ?auto_593492 ) ( SURFACE-AT ?auto_593487 ?auto_593492 ) ( CLEAR ?auto_593487 ) ( IS-CRATE ?auto_593484 ) ( not ( = ?auto_593487 ?auto_593484 ) ) ( AVAILABLE ?auto_593489 ) ( ON ?auto_593487 ?auto_593486 ) ( not ( = ?auto_593486 ?auto_593487 ) ) ( not ( = ?auto_593486 ?auto_593484 ) ) ( not ( = ?auto_593493 ?auto_593492 ) ) ( HOIST-AT ?auto_593491 ?auto_593493 ) ( not ( = ?auto_593489 ?auto_593491 ) ) ( AVAILABLE ?auto_593491 ) ( SURFACE-AT ?auto_593484 ?auto_593493 ) ( ON ?auto_593484 ?auto_593490 ) ( CLEAR ?auto_593484 ) ( not ( = ?auto_593487 ?auto_593490 ) ) ( not ( = ?auto_593484 ?auto_593490 ) ) ( not ( = ?auto_593486 ?auto_593490 ) ) ( TRUCK-AT ?auto_593488 ?auto_593492 ) ( ON ?auto_593486 ?auto_593485 ) ( not ( = ?auto_593485 ?auto_593486 ) ) ( not ( = ?auto_593485 ?auto_593487 ) ) ( not ( = ?auto_593485 ?auto_593484 ) ) ( not ( = ?auto_593485 ?auto_593490 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593486 ?auto_593487 ?auto_593484 )
      ( MAKE-3CRATE-VERIFY ?auto_593485 ?auto_593486 ?auto_593487 ?auto_593484 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_593513 - SURFACE
      ?auto_593514 - SURFACE
      ?auto_593515 - SURFACE
      ?auto_593512 - SURFACE
    )
    :vars
    (
      ?auto_593520 - HOIST
      ?auto_593521 - PLACE
      ?auto_593519 - PLACE
      ?auto_593518 - HOIST
      ?auto_593517 - SURFACE
      ?auto_593516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593520 ?auto_593521 ) ( IS-CRATE ?auto_593512 ) ( not ( = ?auto_593515 ?auto_593512 ) ) ( not ( = ?auto_593514 ?auto_593515 ) ) ( not ( = ?auto_593514 ?auto_593512 ) ) ( not ( = ?auto_593519 ?auto_593521 ) ) ( HOIST-AT ?auto_593518 ?auto_593519 ) ( not ( = ?auto_593520 ?auto_593518 ) ) ( AVAILABLE ?auto_593518 ) ( SURFACE-AT ?auto_593512 ?auto_593519 ) ( ON ?auto_593512 ?auto_593517 ) ( CLEAR ?auto_593512 ) ( not ( = ?auto_593515 ?auto_593517 ) ) ( not ( = ?auto_593512 ?auto_593517 ) ) ( not ( = ?auto_593514 ?auto_593517 ) ) ( TRUCK-AT ?auto_593516 ?auto_593521 ) ( SURFACE-AT ?auto_593514 ?auto_593521 ) ( CLEAR ?auto_593514 ) ( LIFTING ?auto_593520 ?auto_593515 ) ( IS-CRATE ?auto_593515 ) ( ON ?auto_593514 ?auto_593513 ) ( not ( = ?auto_593513 ?auto_593514 ) ) ( not ( = ?auto_593513 ?auto_593515 ) ) ( not ( = ?auto_593513 ?auto_593512 ) ) ( not ( = ?auto_593513 ?auto_593517 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593514 ?auto_593515 ?auto_593512 )
      ( MAKE-3CRATE-VERIFY ?auto_593513 ?auto_593514 ?auto_593515 ?auto_593512 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_593541 - SURFACE
      ?auto_593542 - SURFACE
      ?auto_593543 - SURFACE
      ?auto_593540 - SURFACE
    )
    :vars
    (
      ?auto_593549 - HOIST
      ?auto_593546 - PLACE
      ?auto_593545 - PLACE
      ?auto_593548 - HOIST
      ?auto_593544 - SURFACE
      ?auto_593547 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593549 ?auto_593546 ) ( IS-CRATE ?auto_593540 ) ( not ( = ?auto_593543 ?auto_593540 ) ) ( not ( = ?auto_593542 ?auto_593543 ) ) ( not ( = ?auto_593542 ?auto_593540 ) ) ( not ( = ?auto_593545 ?auto_593546 ) ) ( HOIST-AT ?auto_593548 ?auto_593545 ) ( not ( = ?auto_593549 ?auto_593548 ) ) ( AVAILABLE ?auto_593548 ) ( SURFACE-AT ?auto_593540 ?auto_593545 ) ( ON ?auto_593540 ?auto_593544 ) ( CLEAR ?auto_593540 ) ( not ( = ?auto_593543 ?auto_593544 ) ) ( not ( = ?auto_593540 ?auto_593544 ) ) ( not ( = ?auto_593542 ?auto_593544 ) ) ( TRUCK-AT ?auto_593547 ?auto_593546 ) ( SURFACE-AT ?auto_593542 ?auto_593546 ) ( CLEAR ?auto_593542 ) ( IS-CRATE ?auto_593543 ) ( AVAILABLE ?auto_593549 ) ( IN ?auto_593543 ?auto_593547 ) ( ON ?auto_593542 ?auto_593541 ) ( not ( = ?auto_593541 ?auto_593542 ) ) ( not ( = ?auto_593541 ?auto_593543 ) ) ( not ( = ?auto_593541 ?auto_593540 ) ) ( not ( = ?auto_593541 ?auto_593544 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593542 ?auto_593543 ?auto_593540 )
      ( MAKE-3CRATE-VERIFY ?auto_593541 ?auto_593542 ?auto_593543 ?auto_593540 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_593550 - SURFACE
      ?auto_593551 - SURFACE
    )
    :vars
    (
      ?auto_593558 - HOIST
      ?auto_593555 - PLACE
      ?auto_593553 - SURFACE
      ?auto_593554 - PLACE
      ?auto_593557 - HOIST
      ?auto_593552 - SURFACE
      ?auto_593556 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593558 ?auto_593555 ) ( IS-CRATE ?auto_593551 ) ( not ( = ?auto_593550 ?auto_593551 ) ) ( not ( = ?auto_593553 ?auto_593550 ) ) ( not ( = ?auto_593553 ?auto_593551 ) ) ( not ( = ?auto_593554 ?auto_593555 ) ) ( HOIST-AT ?auto_593557 ?auto_593554 ) ( not ( = ?auto_593558 ?auto_593557 ) ) ( AVAILABLE ?auto_593557 ) ( SURFACE-AT ?auto_593551 ?auto_593554 ) ( ON ?auto_593551 ?auto_593552 ) ( CLEAR ?auto_593551 ) ( not ( = ?auto_593550 ?auto_593552 ) ) ( not ( = ?auto_593551 ?auto_593552 ) ) ( not ( = ?auto_593553 ?auto_593552 ) ) ( SURFACE-AT ?auto_593553 ?auto_593555 ) ( CLEAR ?auto_593553 ) ( IS-CRATE ?auto_593550 ) ( AVAILABLE ?auto_593558 ) ( IN ?auto_593550 ?auto_593556 ) ( TRUCK-AT ?auto_593556 ?auto_593554 ) )
    :subtasks
    ( ( !DRIVE ?auto_593556 ?auto_593554 ?auto_593555 )
      ( MAKE-2CRATE ?auto_593553 ?auto_593550 ?auto_593551 )
      ( MAKE-1CRATE-VERIFY ?auto_593550 ?auto_593551 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_593559 - SURFACE
      ?auto_593560 - SURFACE
      ?auto_593561 - SURFACE
    )
    :vars
    (
      ?auto_593566 - HOIST
      ?auto_593564 - PLACE
      ?auto_593563 - PLACE
      ?auto_593565 - HOIST
      ?auto_593562 - SURFACE
      ?auto_593567 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593566 ?auto_593564 ) ( IS-CRATE ?auto_593561 ) ( not ( = ?auto_593560 ?auto_593561 ) ) ( not ( = ?auto_593559 ?auto_593560 ) ) ( not ( = ?auto_593559 ?auto_593561 ) ) ( not ( = ?auto_593563 ?auto_593564 ) ) ( HOIST-AT ?auto_593565 ?auto_593563 ) ( not ( = ?auto_593566 ?auto_593565 ) ) ( AVAILABLE ?auto_593565 ) ( SURFACE-AT ?auto_593561 ?auto_593563 ) ( ON ?auto_593561 ?auto_593562 ) ( CLEAR ?auto_593561 ) ( not ( = ?auto_593560 ?auto_593562 ) ) ( not ( = ?auto_593561 ?auto_593562 ) ) ( not ( = ?auto_593559 ?auto_593562 ) ) ( SURFACE-AT ?auto_593559 ?auto_593564 ) ( CLEAR ?auto_593559 ) ( IS-CRATE ?auto_593560 ) ( AVAILABLE ?auto_593566 ) ( IN ?auto_593560 ?auto_593567 ) ( TRUCK-AT ?auto_593567 ?auto_593563 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_593560 ?auto_593561 )
      ( MAKE-2CRATE-VERIFY ?auto_593559 ?auto_593560 ?auto_593561 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_593569 - SURFACE
      ?auto_593570 - SURFACE
      ?auto_593571 - SURFACE
      ?auto_593568 - SURFACE
    )
    :vars
    (
      ?auto_593573 - HOIST
      ?auto_593572 - PLACE
      ?auto_593574 - PLACE
      ?auto_593575 - HOIST
      ?auto_593576 - SURFACE
      ?auto_593577 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593573 ?auto_593572 ) ( IS-CRATE ?auto_593568 ) ( not ( = ?auto_593571 ?auto_593568 ) ) ( not ( = ?auto_593570 ?auto_593571 ) ) ( not ( = ?auto_593570 ?auto_593568 ) ) ( not ( = ?auto_593574 ?auto_593572 ) ) ( HOIST-AT ?auto_593575 ?auto_593574 ) ( not ( = ?auto_593573 ?auto_593575 ) ) ( AVAILABLE ?auto_593575 ) ( SURFACE-AT ?auto_593568 ?auto_593574 ) ( ON ?auto_593568 ?auto_593576 ) ( CLEAR ?auto_593568 ) ( not ( = ?auto_593571 ?auto_593576 ) ) ( not ( = ?auto_593568 ?auto_593576 ) ) ( not ( = ?auto_593570 ?auto_593576 ) ) ( SURFACE-AT ?auto_593570 ?auto_593572 ) ( CLEAR ?auto_593570 ) ( IS-CRATE ?auto_593571 ) ( AVAILABLE ?auto_593573 ) ( IN ?auto_593571 ?auto_593577 ) ( TRUCK-AT ?auto_593577 ?auto_593574 ) ( ON ?auto_593570 ?auto_593569 ) ( not ( = ?auto_593569 ?auto_593570 ) ) ( not ( = ?auto_593569 ?auto_593571 ) ) ( not ( = ?auto_593569 ?auto_593568 ) ) ( not ( = ?auto_593569 ?auto_593576 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593570 ?auto_593571 ?auto_593568 )
      ( MAKE-3CRATE-VERIFY ?auto_593569 ?auto_593570 ?auto_593571 ?auto_593568 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_593578 - SURFACE
      ?auto_593579 - SURFACE
    )
    :vars
    (
      ?auto_593581 - HOIST
      ?auto_593580 - PLACE
      ?auto_593582 - SURFACE
      ?auto_593583 - PLACE
      ?auto_593584 - HOIST
      ?auto_593585 - SURFACE
      ?auto_593586 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593581 ?auto_593580 ) ( IS-CRATE ?auto_593579 ) ( not ( = ?auto_593578 ?auto_593579 ) ) ( not ( = ?auto_593582 ?auto_593578 ) ) ( not ( = ?auto_593582 ?auto_593579 ) ) ( not ( = ?auto_593583 ?auto_593580 ) ) ( HOIST-AT ?auto_593584 ?auto_593583 ) ( not ( = ?auto_593581 ?auto_593584 ) ) ( SURFACE-AT ?auto_593579 ?auto_593583 ) ( ON ?auto_593579 ?auto_593585 ) ( CLEAR ?auto_593579 ) ( not ( = ?auto_593578 ?auto_593585 ) ) ( not ( = ?auto_593579 ?auto_593585 ) ) ( not ( = ?auto_593582 ?auto_593585 ) ) ( SURFACE-AT ?auto_593582 ?auto_593580 ) ( CLEAR ?auto_593582 ) ( IS-CRATE ?auto_593578 ) ( AVAILABLE ?auto_593581 ) ( TRUCK-AT ?auto_593586 ?auto_593583 ) ( LIFTING ?auto_593584 ?auto_593578 ) )
    :subtasks
    ( ( !LOAD ?auto_593584 ?auto_593578 ?auto_593586 ?auto_593583 )
      ( MAKE-2CRATE ?auto_593582 ?auto_593578 ?auto_593579 )
      ( MAKE-1CRATE-VERIFY ?auto_593578 ?auto_593579 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_593587 - SURFACE
      ?auto_593588 - SURFACE
      ?auto_593589 - SURFACE
    )
    :vars
    (
      ?auto_593593 - HOIST
      ?auto_593591 - PLACE
      ?auto_593590 - PLACE
      ?auto_593592 - HOIST
      ?auto_593594 - SURFACE
      ?auto_593595 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593593 ?auto_593591 ) ( IS-CRATE ?auto_593589 ) ( not ( = ?auto_593588 ?auto_593589 ) ) ( not ( = ?auto_593587 ?auto_593588 ) ) ( not ( = ?auto_593587 ?auto_593589 ) ) ( not ( = ?auto_593590 ?auto_593591 ) ) ( HOIST-AT ?auto_593592 ?auto_593590 ) ( not ( = ?auto_593593 ?auto_593592 ) ) ( SURFACE-AT ?auto_593589 ?auto_593590 ) ( ON ?auto_593589 ?auto_593594 ) ( CLEAR ?auto_593589 ) ( not ( = ?auto_593588 ?auto_593594 ) ) ( not ( = ?auto_593589 ?auto_593594 ) ) ( not ( = ?auto_593587 ?auto_593594 ) ) ( SURFACE-AT ?auto_593587 ?auto_593591 ) ( CLEAR ?auto_593587 ) ( IS-CRATE ?auto_593588 ) ( AVAILABLE ?auto_593593 ) ( TRUCK-AT ?auto_593595 ?auto_593590 ) ( LIFTING ?auto_593592 ?auto_593588 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_593588 ?auto_593589 )
      ( MAKE-2CRATE-VERIFY ?auto_593587 ?auto_593588 ?auto_593589 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_593597 - SURFACE
      ?auto_593598 - SURFACE
      ?auto_593599 - SURFACE
      ?auto_593596 - SURFACE
    )
    :vars
    (
      ?auto_593605 - HOIST
      ?auto_593603 - PLACE
      ?auto_593600 - PLACE
      ?auto_593602 - HOIST
      ?auto_593601 - SURFACE
      ?auto_593604 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593605 ?auto_593603 ) ( IS-CRATE ?auto_593596 ) ( not ( = ?auto_593599 ?auto_593596 ) ) ( not ( = ?auto_593598 ?auto_593599 ) ) ( not ( = ?auto_593598 ?auto_593596 ) ) ( not ( = ?auto_593600 ?auto_593603 ) ) ( HOIST-AT ?auto_593602 ?auto_593600 ) ( not ( = ?auto_593605 ?auto_593602 ) ) ( SURFACE-AT ?auto_593596 ?auto_593600 ) ( ON ?auto_593596 ?auto_593601 ) ( CLEAR ?auto_593596 ) ( not ( = ?auto_593599 ?auto_593601 ) ) ( not ( = ?auto_593596 ?auto_593601 ) ) ( not ( = ?auto_593598 ?auto_593601 ) ) ( SURFACE-AT ?auto_593598 ?auto_593603 ) ( CLEAR ?auto_593598 ) ( IS-CRATE ?auto_593599 ) ( AVAILABLE ?auto_593605 ) ( TRUCK-AT ?auto_593604 ?auto_593600 ) ( LIFTING ?auto_593602 ?auto_593599 ) ( ON ?auto_593598 ?auto_593597 ) ( not ( = ?auto_593597 ?auto_593598 ) ) ( not ( = ?auto_593597 ?auto_593599 ) ) ( not ( = ?auto_593597 ?auto_593596 ) ) ( not ( = ?auto_593597 ?auto_593601 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593598 ?auto_593599 ?auto_593596 )
      ( MAKE-3CRATE-VERIFY ?auto_593597 ?auto_593598 ?auto_593599 ?auto_593596 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_593606 - SURFACE
      ?auto_593607 - SURFACE
    )
    :vars
    (
      ?auto_593614 - HOIST
      ?auto_593611 - PLACE
      ?auto_593613 - SURFACE
      ?auto_593608 - PLACE
      ?auto_593610 - HOIST
      ?auto_593609 - SURFACE
      ?auto_593612 - TRUCK
      ?auto_593615 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_593614 ?auto_593611 ) ( IS-CRATE ?auto_593607 ) ( not ( = ?auto_593606 ?auto_593607 ) ) ( not ( = ?auto_593613 ?auto_593606 ) ) ( not ( = ?auto_593613 ?auto_593607 ) ) ( not ( = ?auto_593608 ?auto_593611 ) ) ( HOIST-AT ?auto_593610 ?auto_593608 ) ( not ( = ?auto_593614 ?auto_593610 ) ) ( SURFACE-AT ?auto_593607 ?auto_593608 ) ( ON ?auto_593607 ?auto_593609 ) ( CLEAR ?auto_593607 ) ( not ( = ?auto_593606 ?auto_593609 ) ) ( not ( = ?auto_593607 ?auto_593609 ) ) ( not ( = ?auto_593613 ?auto_593609 ) ) ( SURFACE-AT ?auto_593613 ?auto_593611 ) ( CLEAR ?auto_593613 ) ( IS-CRATE ?auto_593606 ) ( AVAILABLE ?auto_593614 ) ( TRUCK-AT ?auto_593612 ?auto_593608 ) ( AVAILABLE ?auto_593610 ) ( SURFACE-AT ?auto_593606 ?auto_593608 ) ( ON ?auto_593606 ?auto_593615 ) ( CLEAR ?auto_593606 ) ( not ( = ?auto_593606 ?auto_593615 ) ) ( not ( = ?auto_593607 ?auto_593615 ) ) ( not ( = ?auto_593613 ?auto_593615 ) ) ( not ( = ?auto_593609 ?auto_593615 ) ) )
    :subtasks
    ( ( !LIFT ?auto_593610 ?auto_593606 ?auto_593615 ?auto_593608 )
      ( MAKE-2CRATE ?auto_593613 ?auto_593606 ?auto_593607 )
      ( MAKE-1CRATE-VERIFY ?auto_593606 ?auto_593607 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_593616 - SURFACE
      ?auto_593617 - SURFACE
      ?auto_593618 - SURFACE
    )
    :vars
    (
      ?auto_593625 - HOIST
      ?auto_593623 - PLACE
      ?auto_593622 - PLACE
      ?auto_593624 - HOIST
      ?auto_593620 - SURFACE
      ?auto_593619 - TRUCK
      ?auto_593621 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_593625 ?auto_593623 ) ( IS-CRATE ?auto_593618 ) ( not ( = ?auto_593617 ?auto_593618 ) ) ( not ( = ?auto_593616 ?auto_593617 ) ) ( not ( = ?auto_593616 ?auto_593618 ) ) ( not ( = ?auto_593622 ?auto_593623 ) ) ( HOIST-AT ?auto_593624 ?auto_593622 ) ( not ( = ?auto_593625 ?auto_593624 ) ) ( SURFACE-AT ?auto_593618 ?auto_593622 ) ( ON ?auto_593618 ?auto_593620 ) ( CLEAR ?auto_593618 ) ( not ( = ?auto_593617 ?auto_593620 ) ) ( not ( = ?auto_593618 ?auto_593620 ) ) ( not ( = ?auto_593616 ?auto_593620 ) ) ( SURFACE-AT ?auto_593616 ?auto_593623 ) ( CLEAR ?auto_593616 ) ( IS-CRATE ?auto_593617 ) ( AVAILABLE ?auto_593625 ) ( TRUCK-AT ?auto_593619 ?auto_593622 ) ( AVAILABLE ?auto_593624 ) ( SURFACE-AT ?auto_593617 ?auto_593622 ) ( ON ?auto_593617 ?auto_593621 ) ( CLEAR ?auto_593617 ) ( not ( = ?auto_593617 ?auto_593621 ) ) ( not ( = ?auto_593618 ?auto_593621 ) ) ( not ( = ?auto_593616 ?auto_593621 ) ) ( not ( = ?auto_593620 ?auto_593621 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_593617 ?auto_593618 )
      ( MAKE-2CRATE-VERIFY ?auto_593616 ?auto_593617 ?auto_593618 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_593627 - SURFACE
      ?auto_593628 - SURFACE
      ?auto_593629 - SURFACE
      ?auto_593626 - SURFACE
    )
    :vars
    (
      ?auto_593631 - HOIST
      ?auto_593635 - PLACE
      ?auto_593632 - PLACE
      ?auto_593636 - HOIST
      ?auto_593633 - SURFACE
      ?auto_593634 - TRUCK
      ?auto_593630 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_593631 ?auto_593635 ) ( IS-CRATE ?auto_593626 ) ( not ( = ?auto_593629 ?auto_593626 ) ) ( not ( = ?auto_593628 ?auto_593629 ) ) ( not ( = ?auto_593628 ?auto_593626 ) ) ( not ( = ?auto_593632 ?auto_593635 ) ) ( HOIST-AT ?auto_593636 ?auto_593632 ) ( not ( = ?auto_593631 ?auto_593636 ) ) ( SURFACE-AT ?auto_593626 ?auto_593632 ) ( ON ?auto_593626 ?auto_593633 ) ( CLEAR ?auto_593626 ) ( not ( = ?auto_593629 ?auto_593633 ) ) ( not ( = ?auto_593626 ?auto_593633 ) ) ( not ( = ?auto_593628 ?auto_593633 ) ) ( SURFACE-AT ?auto_593628 ?auto_593635 ) ( CLEAR ?auto_593628 ) ( IS-CRATE ?auto_593629 ) ( AVAILABLE ?auto_593631 ) ( TRUCK-AT ?auto_593634 ?auto_593632 ) ( AVAILABLE ?auto_593636 ) ( SURFACE-AT ?auto_593629 ?auto_593632 ) ( ON ?auto_593629 ?auto_593630 ) ( CLEAR ?auto_593629 ) ( not ( = ?auto_593629 ?auto_593630 ) ) ( not ( = ?auto_593626 ?auto_593630 ) ) ( not ( = ?auto_593628 ?auto_593630 ) ) ( not ( = ?auto_593633 ?auto_593630 ) ) ( ON ?auto_593628 ?auto_593627 ) ( not ( = ?auto_593627 ?auto_593628 ) ) ( not ( = ?auto_593627 ?auto_593629 ) ) ( not ( = ?auto_593627 ?auto_593626 ) ) ( not ( = ?auto_593627 ?auto_593633 ) ) ( not ( = ?auto_593627 ?auto_593630 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593628 ?auto_593629 ?auto_593626 )
      ( MAKE-3CRATE-VERIFY ?auto_593627 ?auto_593628 ?auto_593629 ?auto_593626 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_593637 - SURFACE
      ?auto_593638 - SURFACE
    )
    :vars
    (
      ?auto_593640 - HOIST
      ?auto_593645 - PLACE
      ?auto_593642 - SURFACE
      ?auto_593641 - PLACE
      ?auto_593646 - HOIST
      ?auto_593643 - SURFACE
      ?auto_593639 - SURFACE
      ?auto_593644 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593640 ?auto_593645 ) ( IS-CRATE ?auto_593638 ) ( not ( = ?auto_593637 ?auto_593638 ) ) ( not ( = ?auto_593642 ?auto_593637 ) ) ( not ( = ?auto_593642 ?auto_593638 ) ) ( not ( = ?auto_593641 ?auto_593645 ) ) ( HOIST-AT ?auto_593646 ?auto_593641 ) ( not ( = ?auto_593640 ?auto_593646 ) ) ( SURFACE-AT ?auto_593638 ?auto_593641 ) ( ON ?auto_593638 ?auto_593643 ) ( CLEAR ?auto_593638 ) ( not ( = ?auto_593637 ?auto_593643 ) ) ( not ( = ?auto_593638 ?auto_593643 ) ) ( not ( = ?auto_593642 ?auto_593643 ) ) ( SURFACE-AT ?auto_593642 ?auto_593645 ) ( CLEAR ?auto_593642 ) ( IS-CRATE ?auto_593637 ) ( AVAILABLE ?auto_593640 ) ( AVAILABLE ?auto_593646 ) ( SURFACE-AT ?auto_593637 ?auto_593641 ) ( ON ?auto_593637 ?auto_593639 ) ( CLEAR ?auto_593637 ) ( not ( = ?auto_593637 ?auto_593639 ) ) ( not ( = ?auto_593638 ?auto_593639 ) ) ( not ( = ?auto_593642 ?auto_593639 ) ) ( not ( = ?auto_593643 ?auto_593639 ) ) ( TRUCK-AT ?auto_593644 ?auto_593645 ) )
    :subtasks
    ( ( !DRIVE ?auto_593644 ?auto_593645 ?auto_593641 )
      ( MAKE-2CRATE ?auto_593642 ?auto_593637 ?auto_593638 )
      ( MAKE-1CRATE-VERIFY ?auto_593637 ?auto_593638 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_593647 - SURFACE
      ?auto_593648 - SURFACE
      ?auto_593649 - SURFACE
    )
    :vars
    (
      ?auto_593653 - HOIST
      ?auto_593650 - PLACE
      ?auto_593656 - PLACE
      ?auto_593655 - HOIST
      ?auto_593654 - SURFACE
      ?auto_593651 - SURFACE
      ?auto_593652 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593653 ?auto_593650 ) ( IS-CRATE ?auto_593649 ) ( not ( = ?auto_593648 ?auto_593649 ) ) ( not ( = ?auto_593647 ?auto_593648 ) ) ( not ( = ?auto_593647 ?auto_593649 ) ) ( not ( = ?auto_593656 ?auto_593650 ) ) ( HOIST-AT ?auto_593655 ?auto_593656 ) ( not ( = ?auto_593653 ?auto_593655 ) ) ( SURFACE-AT ?auto_593649 ?auto_593656 ) ( ON ?auto_593649 ?auto_593654 ) ( CLEAR ?auto_593649 ) ( not ( = ?auto_593648 ?auto_593654 ) ) ( not ( = ?auto_593649 ?auto_593654 ) ) ( not ( = ?auto_593647 ?auto_593654 ) ) ( SURFACE-AT ?auto_593647 ?auto_593650 ) ( CLEAR ?auto_593647 ) ( IS-CRATE ?auto_593648 ) ( AVAILABLE ?auto_593653 ) ( AVAILABLE ?auto_593655 ) ( SURFACE-AT ?auto_593648 ?auto_593656 ) ( ON ?auto_593648 ?auto_593651 ) ( CLEAR ?auto_593648 ) ( not ( = ?auto_593648 ?auto_593651 ) ) ( not ( = ?auto_593649 ?auto_593651 ) ) ( not ( = ?auto_593647 ?auto_593651 ) ) ( not ( = ?auto_593654 ?auto_593651 ) ) ( TRUCK-AT ?auto_593652 ?auto_593650 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_593648 ?auto_593649 )
      ( MAKE-2CRATE-VERIFY ?auto_593647 ?auto_593648 ?auto_593649 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_593658 - SURFACE
      ?auto_593659 - SURFACE
      ?auto_593660 - SURFACE
      ?auto_593657 - SURFACE
    )
    :vars
    (
      ?auto_593663 - HOIST
      ?auto_593666 - PLACE
      ?auto_593667 - PLACE
      ?auto_593662 - HOIST
      ?auto_593661 - SURFACE
      ?auto_593665 - SURFACE
      ?auto_593664 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593663 ?auto_593666 ) ( IS-CRATE ?auto_593657 ) ( not ( = ?auto_593660 ?auto_593657 ) ) ( not ( = ?auto_593659 ?auto_593660 ) ) ( not ( = ?auto_593659 ?auto_593657 ) ) ( not ( = ?auto_593667 ?auto_593666 ) ) ( HOIST-AT ?auto_593662 ?auto_593667 ) ( not ( = ?auto_593663 ?auto_593662 ) ) ( SURFACE-AT ?auto_593657 ?auto_593667 ) ( ON ?auto_593657 ?auto_593661 ) ( CLEAR ?auto_593657 ) ( not ( = ?auto_593660 ?auto_593661 ) ) ( not ( = ?auto_593657 ?auto_593661 ) ) ( not ( = ?auto_593659 ?auto_593661 ) ) ( SURFACE-AT ?auto_593659 ?auto_593666 ) ( CLEAR ?auto_593659 ) ( IS-CRATE ?auto_593660 ) ( AVAILABLE ?auto_593663 ) ( AVAILABLE ?auto_593662 ) ( SURFACE-AT ?auto_593660 ?auto_593667 ) ( ON ?auto_593660 ?auto_593665 ) ( CLEAR ?auto_593660 ) ( not ( = ?auto_593660 ?auto_593665 ) ) ( not ( = ?auto_593657 ?auto_593665 ) ) ( not ( = ?auto_593659 ?auto_593665 ) ) ( not ( = ?auto_593661 ?auto_593665 ) ) ( TRUCK-AT ?auto_593664 ?auto_593666 ) ( ON ?auto_593659 ?auto_593658 ) ( not ( = ?auto_593658 ?auto_593659 ) ) ( not ( = ?auto_593658 ?auto_593660 ) ) ( not ( = ?auto_593658 ?auto_593657 ) ) ( not ( = ?auto_593658 ?auto_593661 ) ) ( not ( = ?auto_593658 ?auto_593665 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593659 ?auto_593660 ?auto_593657 )
      ( MAKE-3CRATE-VERIFY ?auto_593658 ?auto_593659 ?auto_593660 ?auto_593657 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_593668 - SURFACE
      ?auto_593669 - SURFACE
    )
    :vars
    (
      ?auto_593673 - HOIST
      ?auto_593676 - PLACE
      ?auto_593670 - SURFACE
      ?auto_593677 - PLACE
      ?auto_593672 - HOIST
      ?auto_593671 - SURFACE
      ?auto_593675 - SURFACE
      ?auto_593674 - TRUCK
      ?auto_593678 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_593673 ?auto_593676 ) ( IS-CRATE ?auto_593669 ) ( not ( = ?auto_593668 ?auto_593669 ) ) ( not ( = ?auto_593670 ?auto_593668 ) ) ( not ( = ?auto_593670 ?auto_593669 ) ) ( not ( = ?auto_593677 ?auto_593676 ) ) ( HOIST-AT ?auto_593672 ?auto_593677 ) ( not ( = ?auto_593673 ?auto_593672 ) ) ( SURFACE-AT ?auto_593669 ?auto_593677 ) ( ON ?auto_593669 ?auto_593671 ) ( CLEAR ?auto_593669 ) ( not ( = ?auto_593668 ?auto_593671 ) ) ( not ( = ?auto_593669 ?auto_593671 ) ) ( not ( = ?auto_593670 ?auto_593671 ) ) ( IS-CRATE ?auto_593668 ) ( AVAILABLE ?auto_593672 ) ( SURFACE-AT ?auto_593668 ?auto_593677 ) ( ON ?auto_593668 ?auto_593675 ) ( CLEAR ?auto_593668 ) ( not ( = ?auto_593668 ?auto_593675 ) ) ( not ( = ?auto_593669 ?auto_593675 ) ) ( not ( = ?auto_593670 ?auto_593675 ) ) ( not ( = ?auto_593671 ?auto_593675 ) ) ( TRUCK-AT ?auto_593674 ?auto_593676 ) ( SURFACE-AT ?auto_593678 ?auto_593676 ) ( CLEAR ?auto_593678 ) ( LIFTING ?auto_593673 ?auto_593670 ) ( IS-CRATE ?auto_593670 ) ( not ( = ?auto_593678 ?auto_593670 ) ) ( not ( = ?auto_593668 ?auto_593678 ) ) ( not ( = ?auto_593669 ?auto_593678 ) ) ( not ( = ?auto_593671 ?auto_593678 ) ) ( not ( = ?auto_593675 ?auto_593678 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_593678 ?auto_593670 )
      ( MAKE-2CRATE ?auto_593670 ?auto_593668 ?auto_593669 )
      ( MAKE-1CRATE-VERIFY ?auto_593668 ?auto_593669 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_593679 - SURFACE
      ?auto_593680 - SURFACE
      ?auto_593681 - SURFACE
    )
    :vars
    (
      ?auto_593689 - HOIST
      ?auto_593684 - PLACE
      ?auto_593683 - PLACE
      ?auto_593687 - HOIST
      ?auto_593686 - SURFACE
      ?auto_593682 - SURFACE
      ?auto_593685 - TRUCK
      ?auto_593688 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_593689 ?auto_593684 ) ( IS-CRATE ?auto_593681 ) ( not ( = ?auto_593680 ?auto_593681 ) ) ( not ( = ?auto_593679 ?auto_593680 ) ) ( not ( = ?auto_593679 ?auto_593681 ) ) ( not ( = ?auto_593683 ?auto_593684 ) ) ( HOIST-AT ?auto_593687 ?auto_593683 ) ( not ( = ?auto_593689 ?auto_593687 ) ) ( SURFACE-AT ?auto_593681 ?auto_593683 ) ( ON ?auto_593681 ?auto_593686 ) ( CLEAR ?auto_593681 ) ( not ( = ?auto_593680 ?auto_593686 ) ) ( not ( = ?auto_593681 ?auto_593686 ) ) ( not ( = ?auto_593679 ?auto_593686 ) ) ( IS-CRATE ?auto_593680 ) ( AVAILABLE ?auto_593687 ) ( SURFACE-AT ?auto_593680 ?auto_593683 ) ( ON ?auto_593680 ?auto_593682 ) ( CLEAR ?auto_593680 ) ( not ( = ?auto_593680 ?auto_593682 ) ) ( not ( = ?auto_593681 ?auto_593682 ) ) ( not ( = ?auto_593679 ?auto_593682 ) ) ( not ( = ?auto_593686 ?auto_593682 ) ) ( TRUCK-AT ?auto_593685 ?auto_593684 ) ( SURFACE-AT ?auto_593688 ?auto_593684 ) ( CLEAR ?auto_593688 ) ( LIFTING ?auto_593689 ?auto_593679 ) ( IS-CRATE ?auto_593679 ) ( not ( = ?auto_593688 ?auto_593679 ) ) ( not ( = ?auto_593680 ?auto_593688 ) ) ( not ( = ?auto_593681 ?auto_593688 ) ) ( not ( = ?auto_593686 ?auto_593688 ) ) ( not ( = ?auto_593682 ?auto_593688 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_593680 ?auto_593681 )
      ( MAKE-2CRATE-VERIFY ?auto_593679 ?auto_593680 ?auto_593681 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_593691 - SURFACE
      ?auto_593692 - SURFACE
      ?auto_593693 - SURFACE
      ?auto_593690 - SURFACE
    )
    :vars
    (
      ?auto_593699 - HOIST
      ?auto_593697 - PLACE
      ?auto_593700 - PLACE
      ?auto_593696 - HOIST
      ?auto_593698 - SURFACE
      ?auto_593695 - SURFACE
      ?auto_593694 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593699 ?auto_593697 ) ( IS-CRATE ?auto_593690 ) ( not ( = ?auto_593693 ?auto_593690 ) ) ( not ( = ?auto_593692 ?auto_593693 ) ) ( not ( = ?auto_593692 ?auto_593690 ) ) ( not ( = ?auto_593700 ?auto_593697 ) ) ( HOIST-AT ?auto_593696 ?auto_593700 ) ( not ( = ?auto_593699 ?auto_593696 ) ) ( SURFACE-AT ?auto_593690 ?auto_593700 ) ( ON ?auto_593690 ?auto_593698 ) ( CLEAR ?auto_593690 ) ( not ( = ?auto_593693 ?auto_593698 ) ) ( not ( = ?auto_593690 ?auto_593698 ) ) ( not ( = ?auto_593692 ?auto_593698 ) ) ( IS-CRATE ?auto_593693 ) ( AVAILABLE ?auto_593696 ) ( SURFACE-AT ?auto_593693 ?auto_593700 ) ( ON ?auto_593693 ?auto_593695 ) ( CLEAR ?auto_593693 ) ( not ( = ?auto_593693 ?auto_593695 ) ) ( not ( = ?auto_593690 ?auto_593695 ) ) ( not ( = ?auto_593692 ?auto_593695 ) ) ( not ( = ?auto_593698 ?auto_593695 ) ) ( TRUCK-AT ?auto_593694 ?auto_593697 ) ( SURFACE-AT ?auto_593691 ?auto_593697 ) ( CLEAR ?auto_593691 ) ( LIFTING ?auto_593699 ?auto_593692 ) ( IS-CRATE ?auto_593692 ) ( not ( = ?auto_593691 ?auto_593692 ) ) ( not ( = ?auto_593693 ?auto_593691 ) ) ( not ( = ?auto_593690 ?auto_593691 ) ) ( not ( = ?auto_593698 ?auto_593691 ) ) ( not ( = ?auto_593695 ?auto_593691 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593692 ?auto_593693 ?auto_593690 )
      ( MAKE-3CRATE-VERIFY ?auto_593691 ?auto_593692 ?auto_593693 ?auto_593690 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_593837 - SURFACE
      ?auto_593838 - SURFACE
      ?auto_593839 - SURFACE
      ?auto_593836 - SURFACE
      ?auto_593840 - SURFACE
    )
    :vars
    (
      ?auto_593842 - HOIST
      ?auto_593841 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_593842 ?auto_593841 ) ( SURFACE-AT ?auto_593836 ?auto_593841 ) ( CLEAR ?auto_593836 ) ( LIFTING ?auto_593842 ?auto_593840 ) ( IS-CRATE ?auto_593840 ) ( not ( = ?auto_593836 ?auto_593840 ) ) ( ON ?auto_593838 ?auto_593837 ) ( ON ?auto_593839 ?auto_593838 ) ( ON ?auto_593836 ?auto_593839 ) ( not ( = ?auto_593837 ?auto_593838 ) ) ( not ( = ?auto_593837 ?auto_593839 ) ) ( not ( = ?auto_593837 ?auto_593836 ) ) ( not ( = ?auto_593837 ?auto_593840 ) ) ( not ( = ?auto_593838 ?auto_593839 ) ) ( not ( = ?auto_593838 ?auto_593836 ) ) ( not ( = ?auto_593838 ?auto_593840 ) ) ( not ( = ?auto_593839 ?auto_593836 ) ) ( not ( = ?auto_593839 ?auto_593840 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_593836 ?auto_593840 )
      ( MAKE-4CRATE-VERIFY ?auto_593837 ?auto_593838 ?auto_593839 ?auto_593836 ?auto_593840 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_593862 - SURFACE
      ?auto_593863 - SURFACE
      ?auto_593864 - SURFACE
      ?auto_593861 - SURFACE
      ?auto_593865 - SURFACE
    )
    :vars
    (
      ?auto_593868 - HOIST
      ?auto_593867 - PLACE
      ?auto_593866 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593868 ?auto_593867 ) ( SURFACE-AT ?auto_593861 ?auto_593867 ) ( CLEAR ?auto_593861 ) ( IS-CRATE ?auto_593865 ) ( not ( = ?auto_593861 ?auto_593865 ) ) ( TRUCK-AT ?auto_593866 ?auto_593867 ) ( AVAILABLE ?auto_593868 ) ( IN ?auto_593865 ?auto_593866 ) ( ON ?auto_593861 ?auto_593864 ) ( not ( = ?auto_593864 ?auto_593861 ) ) ( not ( = ?auto_593864 ?auto_593865 ) ) ( ON ?auto_593863 ?auto_593862 ) ( ON ?auto_593864 ?auto_593863 ) ( not ( = ?auto_593862 ?auto_593863 ) ) ( not ( = ?auto_593862 ?auto_593864 ) ) ( not ( = ?auto_593862 ?auto_593861 ) ) ( not ( = ?auto_593862 ?auto_593865 ) ) ( not ( = ?auto_593863 ?auto_593864 ) ) ( not ( = ?auto_593863 ?auto_593861 ) ) ( not ( = ?auto_593863 ?auto_593865 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593864 ?auto_593861 ?auto_593865 )
      ( MAKE-4CRATE-VERIFY ?auto_593862 ?auto_593863 ?auto_593864 ?auto_593861 ?auto_593865 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_593892 - SURFACE
      ?auto_593893 - SURFACE
      ?auto_593894 - SURFACE
      ?auto_593891 - SURFACE
      ?auto_593895 - SURFACE
    )
    :vars
    (
      ?auto_593899 - HOIST
      ?auto_593897 - PLACE
      ?auto_593896 - TRUCK
      ?auto_593898 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_593899 ?auto_593897 ) ( SURFACE-AT ?auto_593891 ?auto_593897 ) ( CLEAR ?auto_593891 ) ( IS-CRATE ?auto_593895 ) ( not ( = ?auto_593891 ?auto_593895 ) ) ( AVAILABLE ?auto_593899 ) ( IN ?auto_593895 ?auto_593896 ) ( ON ?auto_593891 ?auto_593894 ) ( not ( = ?auto_593894 ?auto_593891 ) ) ( not ( = ?auto_593894 ?auto_593895 ) ) ( TRUCK-AT ?auto_593896 ?auto_593898 ) ( not ( = ?auto_593898 ?auto_593897 ) ) ( ON ?auto_593893 ?auto_593892 ) ( ON ?auto_593894 ?auto_593893 ) ( not ( = ?auto_593892 ?auto_593893 ) ) ( not ( = ?auto_593892 ?auto_593894 ) ) ( not ( = ?auto_593892 ?auto_593891 ) ) ( not ( = ?auto_593892 ?auto_593895 ) ) ( not ( = ?auto_593893 ?auto_593894 ) ) ( not ( = ?auto_593893 ?auto_593891 ) ) ( not ( = ?auto_593893 ?auto_593895 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593894 ?auto_593891 ?auto_593895 )
      ( MAKE-4CRATE-VERIFY ?auto_593892 ?auto_593893 ?auto_593894 ?auto_593891 ?auto_593895 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_593926 - SURFACE
      ?auto_593927 - SURFACE
      ?auto_593928 - SURFACE
      ?auto_593925 - SURFACE
      ?auto_593929 - SURFACE
    )
    :vars
    (
      ?auto_593932 - HOIST
      ?auto_593933 - PLACE
      ?auto_593934 - TRUCK
      ?auto_593931 - PLACE
      ?auto_593930 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_593932 ?auto_593933 ) ( SURFACE-AT ?auto_593925 ?auto_593933 ) ( CLEAR ?auto_593925 ) ( IS-CRATE ?auto_593929 ) ( not ( = ?auto_593925 ?auto_593929 ) ) ( AVAILABLE ?auto_593932 ) ( ON ?auto_593925 ?auto_593928 ) ( not ( = ?auto_593928 ?auto_593925 ) ) ( not ( = ?auto_593928 ?auto_593929 ) ) ( TRUCK-AT ?auto_593934 ?auto_593931 ) ( not ( = ?auto_593931 ?auto_593933 ) ) ( HOIST-AT ?auto_593930 ?auto_593931 ) ( LIFTING ?auto_593930 ?auto_593929 ) ( not ( = ?auto_593932 ?auto_593930 ) ) ( ON ?auto_593927 ?auto_593926 ) ( ON ?auto_593928 ?auto_593927 ) ( not ( = ?auto_593926 ?auto_593927 ) ) ( not ( = ?auto_593926 ?auto_593928 ) ) ( not ( = ?auto_593926 ?auto_593925 ) ) ( not ( = ?auto_593926 ?auto_593929 ) ) ( not ( = ?auto_593927 ?auto_593928 ) ) ( not ( = ?auto_593927 ?auto_593925 ) ) ( not ( = ?auto_593927 ?auto_593929 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593928 ?auto_593925 ?auto_593929 )
      ( MAKE-4CRATE-VERIFY ?auto_593926 ?auto_593927 ?auto_593928 ?auto_593925 ?auto_593929 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_593964 - SURFACE
      ?auto_593965 - SURFACE
      ?auto_593966 - SURFACE
      ?auto_593963 - SURFACE
      ?auto_593967 - SURFACE
    )
    :vars
    (
      ?auto_593971 - HOIST
      ?auto_593973 - PLACE
      ?auto_593970 - TRUCK
      ?auto_593972 - PLACE
      ?auto_593969 - HOIST
      ?auto_593968 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_593971 ?auto_593973 ) ( SURFACE-AT ?auto_593963 ?auto_593973 ) ( CLEAR ?auto_593963 ) ( IS-CRATE ?auto_593967 ) ( not ( = ?auto_593963 ?auto_593967 ) ) ( AVAILABLE ?auto_593971 ) ( ON ?auto_593963 ?auto_593966 ) ( not ( = ?auto_593966 ?auto_593963 ) ) ( not ( = ?auto_593966 ?auto_593967 ) ) ( TRUCK-AT ?auto_593970 ?auto_593972 ) ( not ( = ?auto_593972 ?auto_593973 ) ) ( HOIST-AT ?auto_593969 ?auto_593972 ) ( not ( = ?auto_593971 ?auto_593969 ) ) ( AVAILABLE ?auto_593969 ) ( SURFACE-AT ?auto_593967 ?auto_593972 ) ( ON ?auto_593967 ?auto_593968 ) ( CLEAR ?auto_593967 ) ( not ( = ?auto_593963 ?auto_593968 ) ) ( not ( = ?auto_593967 ?auto_593968 ) ) ( not ( = ?auto_593966 ?auto_593968 ) ) ( ON ?auto_593965 ?auto_593964 ) ( ON ?auto_593966 ?auto_593965 ) ( not ( = ?auto_593964 ?auto_593965 ) ) ( not ( = ?auto_593964 ?auto_593966 ) ) ( not ( = ?auto_593964 ?auto_593963 ) ) ( not ( = ?auto_593964 ?auto_593967 ) ) ( not ( = ?auto_593964 ?auto_593968 ) ) ( not ( = ?auto_593965 ?auto_593966 ) ) ( not ( = ?auto_593965 ?auto_593963 ) ) ( not ( = ?auto_593965 ?auto_593967 ) ) ( not ( = ?auto_593965 ?auto_593968 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593966 ?auto_593963 ?auto_593967 )
      ( MAKE-4CRATE-VERIFY ?auto_593964 ?auto_593965 ?auto_593966 ?auto_593963 ?auto_593967 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_594003 - SURFACE
      ?auto_594004 - SURFACE
      ?auto_594005 - SURFACE
      ?auto_594002 - SURFACE
      ?auto_594006 - SURFACE
    )
    :vars
    (
      ?auto_594010 - HOIST
      ?auto_594011 - PLACE
      ?auto_594007 - PLACE
      ?auto_594008 - HOIST
      ?auto_594009 - SURFACE
      ?auto_594012 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_594010 ?auto_594011 ) ( SURFACE-AT ?auto_594002 ?auto_594011 ) ( CLEAR ?auto_594002 ) ( IS-CRATE ?auto_594006 ) ( not ( = ?auto_594002 ?auto_594006 ) ) ( AVAILABLE ?auto_594010 ) ( ON ?auto_594002 ?auto_594005 ) ( not ( = ?auto_594005 ?auto_594002 ) ) ( not ( = ?auto_594005 ?auto_594006 ) ) ( not ( = ?auto_594007 ?auto_594011 ) ) ( HOIST-AT ?auto_594008 ?auto_594007 ) ( not ( = ?auto_594010 ?auto_594008 ) ) ( AVAILABLE ?auto_594008 ) ( SURFACE-AT ?auto_594006 ?auto_594007 ) ( ON ?auto_594006 ?auto_594009 ) ( CLEAR ?auto_594006 ) ( not ( = ?auto_594002 ?auto_594009 ) ) ( not ( = ?auto_594006 ?auto_594009 ) ) ( not ( = ?auto_594005 ?auto_594009 ) ) ( TRUCK-AT ?auto_594012 ?auto_594011 ) ( ON ?auto_594004 ?auto_594003 ) ( ON ?auto_594005 ?auto_594004 ) ( not ( = ?auto_594003 ?auto_594004 ) ) ( not ( = ?auto_594003 ?auto_594005 ) ) ( not ( = ?auto_594003 ?auto_594002 ) ) ( not ( = ?auto_594003 ?auto_594006 ) ) ( not ( = ?auto_594003 ?auto_594009 ) ) ( not ( = ?auto_594004 ?auto_594005 ) ) ( not ( = ?auto_594004 ?auto_594002 ) ) ( not ( = ?auto_594004 ?auto_594006 ) ) ( not ( = ?auto_594004 ?auto_594009 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_594005 ?auto_594002 ?auto_594006 )
      ( MAKE-4CRATE-VERIFY ?auto_594003 ?auto_594004 ?auto_594005 ?auto_594002 ?auto_594006 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_594042 - SURFACE
      ?auto_594043 - SURFACE
      ?auto_594044 - SURFACE
      ?auto_594041 - SURFACE
      ?auto_594045 - SURFACE
    )
    :vars
    (
      ?auto_594048 - HOIST
      ?auto_594047 - PLACE
      ?auto_594050 - PLACE
      ?auto_594049 - HOIST
      ?auto_594046 - SURFACE
      ?auto_594051 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_594048 ?auto_594047 ) ( IS-CRATE ?auto_594045 ) ( not ( = ?auto_594041 ?auto_594045 ) ) ( not ( = ?auto_594044 ?auto_594041 ) ) ( not ( = ?auto_594044 ?auto_594045 ) ) ( not ( = ?auto_594050 ?auto_594047 ) ) ( HOIST-AT ?auto_594049 ?auto_594050 ) ( not ( = ?auto_594048 ?auto_594049 ) ) ( AVAILABLE ?auto_594049 ) ( SURFACE-AT ?auto_594045 ?auto_594050 ) ( ON ?auto_594045 ?auto_594046 ) ( CLEAR ?auto_594045 ) ( not ( = ?auto_594041 ?auto_594046 ) ) ( not ( = ?auto_594045 ?auto_594046 ) ) ( not ( = ?auto_594044 ?auto_594046 ) ) ( TRUCK-AT ?auto_594051 ?auto_594047 ) ( SURFACE-AT ?auto_594044 ?auto_594047 ) ( CLEAR ?auto_594044 ) ( LIFTING ?auto_594048 ?auto_594041 ) ( IS-CRATE ?auto_594041 ) ( ON ?auto_594043 ?auto_594042 ) ( ON ?auto_594044 ?auto_594043 ) ( not ( = ?auto_594042 ?auto_594043 ) ) ( not ( = ?auto_594042 ?auto_594044 ) ) ( not ( = ?auto_594042 ?auto_594041 ) ) ( not ( = ?auto_594042 ?auto_594045 ) ) ( not ( = ?auto_594042 ?auto_594046 ) ) ( not ( = ?auto_594043 ?auto_594044 ) ) ( not ( = ?auto_594043 ?auto_594041 ) ) ( not ( = ?auto_594043 ?auto_594045 ) ) ( not ( = ?auto_594043 ?auto_594046 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_594044 ?auto_594041 ?auto_594045 )
      ( MAKE-4CRATE-VERIFY ?auto_594042 ?auto_594043 ?auto_594044 ?auto_594041 ?auto_594045 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_594081 - SURFACE
      ?auto_594082 - SURFACE
      ?auto_594083 - SURFACE
      ?auto_594080 - SURFACE
      ?auto_594084 - SURFACE
    )
    :vars
    (
      ?auto_594090 - HOIST
      ?auto_594087 - PLACE
      ?auto_594088 - PLACE
      ?auto_594086 - HOIST
      ?auto_594089 - SURFACE
      ?auto_594085 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_594090 ?auto_594087 ) ( IS-CRATE ?auto_594084 ) ( not ( = ?auto_594080 ?auto_594084 ) ) ( not ( = ?auto_594083 ?auto_594080 ) ) ( not ( = ?auto_594083 ?auto_594084 ) ) ( not ( = ?auto_594088 ?auto_594087 ) ) ( HOIST-AT ?auto_594086 ?auto_594088 ) ( not ( = ?auto_594090 ?auto_594086 ) ) ( AVAILABLE ?auto_594086 ) ( SURFACE-AT ?auto_594084 ?auto_594088 ) ( ON ?auto_594084 ?auto_594089 ) ( CLEAR ?auto_594084 ) ( not ( = ?auto_594080 ?auto_594089 ) ) ( not ( = ?auto_594084 ?auto_594089 ) ) ( not ( = ?auto_594083 ?auto_594089 ) ) ( TRUCK-AT ?auto_594085 ?auto_594087 ) ( SURFACE-AT ?auto_594083 ?auto_594087 ) ( CLEAR ?auto_594083 ) ( IS-CRATE ?auto_594080 ) ( AVAILABLE ?auto_594090 ) ( IN ?auto_594080 ?auto_594085 ) ( ON ?auto_594082 ?auto_594081 ) ( ON ?auto_594083 ?auto_594082 ) ( not ( = ?auto_594081 ?auto_594082 ) ) ( not ( = ?auto_594081 ?auto_594083 ) ) ( not ( = ?auto_594081 ?auto_594080 ) ) ( not ( = ?auto_594081 ?auto_594084 ) ) ( not ( = ?auto_594081 ?auto_594089 ) ) ( not ( = ?auto_594082 ?auto_594083 ) ) ( not ( = ?auto_594082 ?auto_594080 ) ) ( not ( = ?auto_594082 ?auto_594084 ) ) ( not ( = ?auto_594082 ?auto_594089 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_594083 ?auto_594080 ?auto_594084 )
      ( MAKE-4CRATE-VERIFY ?auto_594081 ?auto_594082 ?auto_594083 ?auto_594080 ?auto_594084 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_594353 - SURFACE
      ?auto_594354 - SURFACE
    )
    :vars
    (
      ?auto_594361 - HOIST
      ?auto_594355 - PLACE
      ?auto_594357 - SURFACE
      ?auto_594358 - PLACE
      ?auto_594356 - HOIST
      ?auto_594359 - SURFACE
      ?auto_594360 - TRUCK
      ?auto_594362 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_594361 ?auto_594355 ) ( SURFACE-AT ?auto_594353 ?auto_594355 ) ( CLEAR ?auto_594353 ) ( IS-CRATE ?auto_594354 ) ( not ( = ?auto_594353 ?auto_594354 ) ) ( ON ?auto_594353 ?auto_594357 ) ( not ( = ?auto_594357 ?auto_594353 ) ) ( not ( = ?auto_594357 ?auto_594354 ) ) ( not ( = ?auto_594358 ?auto_594355 ) ) ( HOIST-AT ?auto_594356 ?auto_594358 ) ( not ( = ?auto_594361 ?auto_594356 ) ) ( AVAILABLE ?auto_594356 ) ( SURFACE-AT ?auto_594354 ?auto_594358 ) ( ON ?auto_594354 ?auto_594359 ) ( CLEAR ?auto_594354 ) ( not ( = ?auto_594353 ?auto_594359 ) ) ( not ( = ?auto_594354 ?auto_594359 ) ) ( not ( = ?auto_594357 ?auto_594359 ) ) ( TRUCK-AT ?auto_594360 ?auto_594355 ) ( LIFTING ?auto_594361 ?auto_594362 ) ( IS-CRATE ?auto_594362 ) ( not ( = ?auto_594353 ?auto_594362 ) ) ( not ( = ?auto_594354 ?auto_594362 ) ) ( not ( = ?auto_594357 ?auto_594362 ) ) ( not ( = ?auto_594359 ?auto_594362 ) ) )
    :subtasks
    ( ( !LOAD ?auto_594361 ?auto_594362 ?auto_594360 ?auto_594355 )
      ( MAKE-1CRATE ?auto_594353 ?auto_594354 )
      ( MAKE-1CRATE-VERIFY ?auto_594353 ?auto_594354 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_594740 - SURFACE
      ?auto_594741 - SURFACE
      ?auto_594742 - SURFACE
      ?auto_594739 - SURFACE
      ?auto_594743 - SURFACE
      ?auto_594744 - SURFACE
    )
    :vars
    (
      ?auto_594745 - HOIST
      ?auto_594746 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_594745 ?auto_594746 ) ( SURFACE-AT ?auto_594743 ?auto_594746 ) ( CLEAR ?auto_594743 ) ( LIFTING ?auto_594745 ?auto_594744 ) ( IS-CRATE ?auto_594744 ) ( not ( = ?auto_594743 ?auto_594744 ) ) ( ON ?auto_594741 ?auto_594740 ) ( ON ?auto_594742 ?auto_594741 ) ( ON ?auto_594739 ?auto_594742 ) ( ON ?auto_594743 ?auto_594739 ) ( not ( = ?auto_594740 ?auto_594741 ) ) ( not ( = ?auto_594740 ?auto_594742 ) ) ( not ( = ?auto_594740 ?auto_594739 ) ) ( not ( = ?auto_594740 ?auto_594743 ) ) ( not ( = ?auto_594740 ?auto_594744 ) ) ( not ( = ?auto_594741 ?auto_594742 ) ) ( not ( = ?auto_594741 ?auto_594739 ) ) ( not ( = ?auto_594741 ?auto_594743 ) ) ( not ( = ?auto_594741 ?auto_594744 ) ) ( not ( = ?auto_594742 ?auto_594739 ) ) ( not ( = ?auto_594742 ?auto_594743 ) ) ( not ( = ?auto_594742 ?auto_594744 ) ) ( not ( = ?auto_594739 ?auto_594743 ) ) ( not ( = ?auto_594739 ?auto_594744 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_594743 ?auto_594744 )
      ( MAKE-5CRATE-VERIFY ?auto_594740 ?auto_594741 ?auto_594742 ?auto_594739 ?auto_594743 ?auto_594744 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_594774 - SURFACE
      ?auto_594775 - SURFACE
      ?auto_594776 - SURFACE
      ?auto_594773 - SURFACE
      ?auto_594777 - SURFACE
      ?auto_594778 - SURFACE
    )
    :vars
    (
      ?auto_594781 - HOIST
      ?auto_594779 - PLACE
      ?auto_594780 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_594781 ?auto_594779 ) ( SURFACE-AT ?auto_594777 ?auto_594779 ) ( CLEAR ?auto_594777 ) ( IS-CRATE ?auto_594778 ) ( not ( = ?auto_594777 ?auto_594778 ) ) ( TRUCK-AT ?auto_594780 ?auto_594779 ) ( AVAILABLE ?auto_594781 ) ( IN ?auto_594778 ?auto_594780 ) ( ON ?auto_594777 ?auto_594773 ) ( not ( = ?auto_594773 ?auto_594777 ) ) ( not ( = ?auto_594773 ?auto_594778 ) ) ( ON ?auto_594775 ?auto_594774 ) ( ON ?auto_594776 ?auto_594775 ) ( ON ?auto_594773 ?auto_594776 ) ( not ( = ?auto_594774 ?auto_594775 ) ) ( not ( = ?auto_594774 ?auto_594776 ) ) ( not ( = ?auto_594774 ?auto_594773 ) ) ( not ( = ?auto_594774 ?auto_594777 ) ) ( not ( = ?auto_594774 ?auto_594778 ) ) ( not ( = ?auto_594775 ?auto_594776 ) ) ( not ( = ?auto_594775 ?auto_594773 ) ) ( not ( = ?auto_594775 ?auto_594777 ) ) ( not ( = ?auto_594775 ?auto_594778 ) ) ( not ( = ?auto_594776 ?auto_594773 ) ) ( not ( = ?auto_594776 ?auto_594777 ) ) ( not ( = ?auto_594776 ?auto_594778 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_594773 ?auto_594777 ?auto_594778 )
      ( MAKE-5CRATE-VERIFY ?auto_594774 ?auto_594775 ?auto_594776 ?auto_594773 ?auto_594777 ?auto_594778 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_594814 - SURFACE
      ?auto_594815 - SURFACE
      ?auto_594816 - SURFACE
      ?auto_594813 - SURFACE
      ?auto_594817 - SURFACE
      ?auto_594818 - SURFACE
    )
    :vars
    (
      ?auto_594822 - HOIST
      ?auto_594820 - PLACE
      ?auto_594819 - TRUCK
      ?auto_594821 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_594822 ?auto_594820 ) ( SURFACE-AT ?auto_594817 ?auto_594820 ) ( CLEAR ?auto_594817 ) ( IS-CRATE ?auto_594818 ) ( not ( = ?auto_594817 ?auto_594818 ) ) ( AVAILABLE ?auto_594822 ) ( IN ?auto_594818 ?auto_594819 ) ( ON ?auto_594817 ?auto_594813 ) ( not ( = ?auto_594813 ?auto_594817 ) ) ( not ( = ?auto_594813 ?auto_594818 ) ) ( TRUCK-AT ?auto_594819 ?auto_594821 ) ( not ( = ?auto_594821 ?auto_594820 ) ) ( ON ?auto_594815 ?auto_594814 ) ( ON ?auto_594816 ?auto_594815 ) ( ON ?auto_594813 ?auto_594816 ) ( not ( = ?auto_594814 ?auto_594815 ) ) ( not ( = ?auto_594814 ?auto_594816 ) ) ( not ( = ?auto_594814 ?auto_594813 ) ) ( not ( = ?auto_594814 ?auto_594817 ) ) ( not ( = ?auto_594814 ?auto_594818 ) ) ( not ( = ?auto_594815 ?auto_594816 ) ) ( not ( = ?auto_594815 ?auto_594813 ) ) ( not ( = ?auto_594815 ?auto_594817 ) ) ( not ( = ?auto_594815 ?auto_594818 ) ) ( not ( = ?auto_594816 ?auto_594813 ) ) ( not ( = ?auto_594816 ?auto_594817 ) ) ( not ( = ?auto_594816 ?auto_594818 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_594813 ?auto_594817 ?auto_594818 )
      ( MAKE-5CRATE-VERIFY ?auto_594814 ?auto_594815 ?auto_594816 ?auto_594813 ?auto_594817 ?auto_594818 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_594859 - SURFACE
      ?auto_594860 - SURFACE
      ?auto_594861 - SURFACE
      ?auto_594858 - SURFACE
      ?auto_594862 - SURFACE
      ?auto_594863 - SURFACE
    )
    :vars
    (
      ?auto_594868 - HOIST
      ?auto_594867 - PLACE
      ?auto_594864 - TRUCK
      ?auto_594866 - PLACE
      ?auto_594865 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_594868 ?auto_594867 ) ( SURFACE-AT ?auto_594862 ?auto_594867 ) ( CLEAR ?auto_594862 ) ( IS-CRATE ?auto_594863 ) ( not ( = ?auto_594862 ?auto_594863 ) ) ( AVAILABLE ?auto_594868 ) ( ON ?auto_594862 ?auto_594858 ) ( not ( = ?auto_594858 ?auto_594862 ) ) ( not ( = ?auto_594858 ?auto_594863 ) ) ( TRUCK-AT ?auto_594864 ?auto_594866 ) ( not ( = ?auto_594866 ?auto_594867 ) ) ( HOIST-AT ?auto_594865 ?auto_594866 ) ( LIFTING ?auto_594865 ?auto_594863 ) ( not ( = ?auto_594868 ?auto_594865 ) ) ( ON ?auto_594860 ?auto_594859 ) ( ON ?auto_594861 ?auto_594860 ) ( ON ?auto_594858 ?auto_594861 ) ( not ( = ?auto_594859 ?auto_594860 ) ) ( not ( = ?auto_594859 ?auto_594861 ) ) ( not ( = ?auto_594859 ?auto_594858 ) ) ( not ( = ?auto_594859 ?auto_594862 ) ) ( not ( = ?auto_594859 ?auto_594863 ) ) ( not ( = ?auto_594860 ?auto_594861 ) ) ( not ( = ?auto_594860 ?auto_594858 ) ) ( not ( = ?auto_594860 ?auto_594862 ) ) ( not ( = ?auto_594860 ?auto_594863 ) ) ( not ( = ?auto_594861 ?auto_594858 ) ) ( not ( = ?auto_594861 ?auto_594862 ) ) ( not ( = ?auto_594861 ?auto_594863 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_594858 ?auto_594862 ?auto_594863 )
      ( MAKE-5CRATE-VERIFY ?auto_594859 ?auto_594860 ?auto_594861 ?auto_594858 ?auto_594862 ?auto_594863 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_594909 - SURFACE
      ?auto_594910 - SURFACE
      ?auto_594911 - SURFACE
      ?auto_594908 - SURFACE
      ?auto_594912 - SURFACE
      ?auto_594913 - SURFACE
    )
    :vars
    (
      ?auto_594916 - HOIST
      ?auto_594917 - PLACE
      ?auto_594915 - TRUCK
      ?auto_594914 - PLACE
      ?auto_594919 - HOIST
      ?auto_594918 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_594916 ?auto_594917 ) ( SURFACE-AT ?auto_594912 ?auto_594917 ) ( CLEAR ?auto_594912 ) ( IS-CRATE ?auto_594913 ) ( not ( = ?auto_594912 ?auto_594913 ) ) ( AVAILABLE ?auto_594916 ) ( ON ?auto_594912 ?auto_594908 ) ( not ( = ?auto_594908 ?auto_594912 ) ) ( not ( = ?auto_594908 ?auto_594913 ) ) ( TRUCK-AT ?auto_594915 ?auto_594914 ) ( not ( = ?auto_594914 ?auto_594917 ) ) ( HOIST-AT ?auto_594919 ?auto_594914 ) ( not ( = ?auto_594916 ?auto_594919 ) ) ( AVAILABLE ?auto_594919 ) ( SURFACE-AT ?auto_594913 ?auto_594914 ) ( ON ?auto_594913 ?auto_594918 ) ( CLEAR ?auto_594913 ) ( not ( = ?auto_594912 ?auto_594918 ) ) ( not ( = ?auto_594913 ?auto_594918 ) ) ( not ( = ?auto_594908 ?auto_594918 ) ) ( ON ?auto_594910 ?auto_594909 ) ( ON ?auto_594911 ?auto_594910 ) ( ON ?auto_594908 ?auto_594911 ) ( not ( = ?auto_594909 ?auto_594910 ) ) ( not ( = ?auto_594909 ?auto_594911 ) ) ( not ( = ?auto_594909 ?auto_594908 ) ) ( not ( = ?auto_594909 ?auto_594912 ) ) ( not ( = ?auto_594909 ?auto_594913 ) ) ( not ( = ?auto_594909 ?auto_594918 ) ) ( not ( = ?auto_594910 ?auto_594911 ) ) ( not ( = ?auto_594910 ?auto_594908 ) ) ( not ( = ?auto_594910 ?auto_594912 ) ) ( not ( = ?auto_594910 ?auto_594913 ) ) ( not ( = ?auto_594910 ?auto_594918 ) ) ( not ( = ?auto_594911 ?auto_594908 ) ) ( not ( = ?auto_594911 ?auto_594912 ) ) ( not ( = ?auto_594911 ?auto_594913 ) ) ( not ( = ?auto_594911 ?auto_594918 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_594908 ?auto_594912 ?auto_594913 )
      ( MAKE-5CRATE-VERIFY ?auto_594909 ?auto_594910 ?auto_594911 ?auto_594908 ?auto_594912 ?auto_594913 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_594960 - SURFACE
      ?auto_594961 - SURFACE
      ?auto_594962 - SURFACE
      ?auto_594959 - SURFACE
      ?auto_594963 - SURFACE
      ?auto_594964 - SURFACE
    )
    :vars
    (
      ?auto_594965 - HOIST
      ?auto_594969 - PLACE
      ?auto_594967 - PLACE
      ?auto_594970 - HOIST
      ?auto_594966 - SURFACE
      ?auto_594968 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_594965 ?auto_594969 ) ( SURFACE-AT ?auto_594963 ?auto_594969 ) ( CLEAR ?auto_594963 ) ( IS-CRATE ?auto_594964 ) ( not ( = ?auto_594963 ?auto_594964 ) ) ( AVAILABLE ?auto_594965 ) ( ON ?auto_594963 ?auto_594959 ) ( not ( = ?auto_594959 ?auto_594963 ) ) ( not ( = ?auto_594959 ?auto_594964 ) ) ( not ( = ?auto_594967 ?auto_594969 ) ) ( HOIST-AT ?auto_594970 ?auto_594967 ) ( not ( = ?auto_594965 ?auto_594970 ) ) ( AVAILABLE ?auto_594970 ) ( SURFACE-AT ?auto_594964 ?auto_594967 ) ( ON ?auto_594964 ?auto_594966 ) ( CLEAR ?auto_594964 ) ( not ( = ?auto_594963 ?auto_594966 ) ) ( not ( = ?auto_594964 ?auto_594966 ) ) ( not ( = ?auto_594959 ?auto_594966 ) ) ( TRUCK-AT ?auto_594968 ?auto_594969 ) ( ON ?auto_594961 ?auto_594960 ) ( ON ?auto_594962 ?auto_594961 ) ( ON ?auto_594959 ?auto_594962 ) ( not ( = ?auto_594960 ?auto_594961 ) ) ( not ( = ?auto_594960 ?auto_594962 ) ) ( not ( = ?auto_594960 ?auto_594959 ) ) ( not ( = ?auto_594960 ?auto_594963 ) ) ( not ( = ?auto_594960 ?auto_594964 ) ) ( not ( = ?auto_594960 ?auto_594966 ) ) ( not ( = ?auto_594961 ?auto_594962 ) ) ( not ( = ?auto_594961 ?auto_594959 ) ) ( not ( = ?auto_594961 ?auto_594963 ) ) ( not ( = ?auto_594961 ?auto_594964 ) ) ( not ( = ?auto_594961 ?auto_594966 ) ) ( not ( = ?auto_594962 ?auto_594959 ) ) ( not ( = ?auto_594962 ?auto_594963 ) ) ( not ( = ?auto_594962 ?auto_594964 ) ) ( not ( = ?auto_594962 ?auto_594966 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_594959 ?auto_594963 ?auto_594964 )
      ( MAKE-5CRATE-VERIFY ?auto_594960 ?auto_594961 ?auto_594962 ?auto_594959 ?auto_594963 ?auto_594964 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_595011 - SURFACE
      ?auto_595012 - SURFACE
      ?auto_595013 - SURFACE
      ?auto_595010 - SURFACE
      ?auto_595014 - SURFACE
      ?auto_595015 - SURFACE
    )
    :vars
    (
      ?auto_595019 - HOIST
      ?auto_595017 - PLACE
      ?auto_595016 - PLACE
      ?auto_595021 - HOIST
      ?auto_595018 - SURFACE
      ?auto_595020 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_595019 ?auto_595017 ) ( IS-CRATE ?auto_595015 ) ( not ( = ?auto_595014 ?auto_595015 ) ) ( not ( = ?auto_595010 ?auto_595014 ) ) ( not ( = ?auto_595010 ?auto_595015 ) ) ( not ( = ?auto_595016 ?auto_595017 ) ) ( HOIST-AT ?auto_595021 ?auto_595016 ) ( not ( = ?auto_595019 ?auto_595021 ) ) ( AVAILABLE ?auto_595021 ) ( SURFACE-AT ?auto_595015 ?auto_595016 ) ( ON ?auto_595015 ?auto_595018 ) ( CLEAR ?auto_595015 ) ( not ( = ?auto_595014 ?auto_595018 ) ) ( not ( = ?auto_595015 ?auto_595018 ) ) ( not ( = ?auto_595010 ?auto_595018 ) ) ( TRUCK-AT ?auto_595020 ?auto_595017 ) ( SURFACE-AT ?auto_595010 ?auto_595017 ) ( CLEAR ?auto_595010 ) ( LIFTING ?auto_595019 ?auto_595014 ) ( IS-CRATE ?auto_595014 ) ( ON ?auto_595012 ?auto_595011 ) ( ON ?auto_595013 ?auto_595012 ) ( ON ?auto_595010 ?auto_595013 ) ( not ( = ?auto_595011 ?auto_595012 ) ) ( not ( = ?auto_595011 ?auto_595013 ) ) ( not ( = ?auto_595011 ?auto_595010 ) ) ( not ( = ?auto_595011 ?auto_595014 ) ) ( not ( = ?auto_595011 ?auto_595015 ) ) ( not ( = ?auto_595011 ?auto_595018 ) ) ( not ( = ?auto_595012 ?auto_595013 ) ) ( not ( = ?auto_595012 ?auto_595010 ) ) ( not ( = ?auto_595012 ?auto_595014 ) ) ( not ( = ?auto_595012 ?auto_595015 ) ) ( not ( = ?auto_595012 ?auto_595018 ) ) ( not ( = ?auto_595013 ?auto_595010 ) ) ( not ( = ?auto_595013 ?auto_595014 ) ) ( not ( = ?auto_595013 ?auto_595015 ) ) ( not ( = ?auto_595013 ?auto_595018 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_595010 ?auto_595014 ?auto_595015 )
      ( MAKE-5CRATE-VERIFY ?auto_595011 ?auto_595012 ?auto_595013 ?auto_595010 ?auto_595014 ?auto_595015 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_595062 - SURFACE
      ?auto_595063 - SURFACE
      ?auto_595064 - SURFACE
      ?auto_595061 - SURFACE
      ?auto_595065 - SURFACE
      ?auto_595066 - SURFACE
    )
    :vars
    (
      ?auto_595067 - HOIST
      ?auto_595072 - PLACE
      ?auto_595071 - PLACE
      ?auto_595070 - HOIST
      ?auto_595068 - SURFACE
      ?auto_595069 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_595067 ?auto_595072 ) ( IS-CRATE ?auto_595066 ) ( not ( = ?auto_595065 ?auto_595066 ) ) ( not ( = ?auto_595061 ?auto_595065 ) ) ( not ( = ?auto_595061 ?auto_595066 ) ) ( not ( = ?auto_595071 ?auto_595072 ) ) ( HOIST-AT ?auto_595070 ?auto_595071 ) ( not ( = ?auto_595067 ?auto_595070 ) ) ( AVAILABLE ?auto_595070 ) ( SURFACE-AT ?auto_595066 ?auto_595071 ) ( ON ?auto_595066 ?auto_595068 ) ( CLEAR ?auto_595066 ) ( not ( = ?auto_595065 ?auto_595068 ) ) ( not ( = ?auto_595066 ?auto_595068 ) ) ( not ( = ?auto_595061 ?auto_595068 ) ) ( TRUCK-AT ?auto_595069 ?auto_595072 ) ( SURFACE-AT ?auto_595061 ?auto_595072 ) ( CLEAR ?auto_595061 ) ( IS-CRATE ?auto_595065 ) ( AVAILABLE ?auto_595067 ) ( IN ?auto_595065 ?auto_595069 ) ( ON ?auto_595063 ?auto_595062 ) ( ON ?auto_595064 ?auto_595063 ) ( ON ?auto_595061 ?auto_595064 ) ( not ( = ?auto_595062 ?auto_595063 ) ) ( not ( = ?auto_595062 ?auto_595064 ) ) ( not ( = ?auto_595062 ?auto_595061 ) ) ( not ( = ?auto_595062 ?auto_595065 ) ) ( not ( = ?auto_595062 ?auto_595066 ) ) ( not ( = ?auto_595062 ?auto_595068 ) ) ( not ( = ?auto_595063 ?auto_595064 ) ) ( not ( = ?auto_595063 ?auto_595061 ) ) ( not ( = ?auto_595063 ?auto_595065 ) ) ( not ( = ?auto_595063 ?auto_595066 ) ) ( not ( = ?auto_595063 ?auto_595068 ) ) ( not ( = ?auto_595064 ?auto_595061 ) ) ( not ( = ?auto_595064 ?auto_595065 ) ) ( not ( = ?auto_595064 ?auto_595066 ) ) ( not ( = ?auto_595064 ?auto_595068 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_595061 ?auto_595065 ?auto_595066 )
      ( MAKE-5CRATE-VERIFY ?auto_595062 ?auto_595063 ?auto_595064 ?auto_595061 ?auto_595065 ?auto_595066 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_595429 - SURFACE
      ?auto_595430 - SURFACE
    )
    :vars
    (
      ?auto_595433 - HOIST
      ?auto_595437 - PLACE
      ?auto_595436 - SURFACE
      ?auto_595431 - TRUCK
      ?auto_595434 - PLACE
      ?auto_595432 - HOIST
      ?auto_595435 - SURFACE
      ?auto_595438 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_595433 ?auto_595437 ) ( SURFACE-AT ?auto_595429 ?auto_595437 ) ( CLEAR ?auto_595429 ) ( IS-CRATE ?auto_595430 ) ( not ( = ?auto_595429 ?auto_595430 ) ) ( AVAILABLE ?auto_595433 ) ( ON ?auto_595429 ?auto_595436 ) ( not ( = ?auto_595436 ?auto_595429 ) ) ( not ( = ?auto_595436 ?auto_595430 ) ) ( TRUCK-AT ?auto_595431 ?auto_595434 ) ( not ( = ?auto_595434 ?auto_595437 ) ) ( HOIST-AT ?auto_595432 ?auto_595434 ) ( not ( = ?auto_595433 ?auto_595432 ) ) ( SURFACE-AT ?auto_595430 ?auto_595434 ) ( ON ?auto_595430 ?auto_595435 ) ( CLEAR ?auto_595430 ) ( not ( = ?auto_595429 ?auto_595435 ) ) ( not ( = ?auto_595430 ?auto_595435 ) ) ( not ( = ?auto_595436 ?auto_595435 ) ) ( LIFTING ?auto_595432 ?auto_595438 ) ( IS-CRATE ?auto_595438 ) ( not ( = ?auto_595429 ?auto_595438 ) ) ( not ( = ?auto_595430 ?auto_595438 ) ) ( not ( = ?auto_595436 ?auto_595438 ) ) ( not ( = ?auto_595435 ?auto_595438 ) ) )
    :subtasks
    ( ( !LOAD ?auto_595432 ?auto_595438 ?auto_595431 ?auto_595434 )
      ( MAKE-1CRATE ?auto_595429 ?auto_595430 )
      ( MAKE-1CRATE-VERIFY ?auto_595429 ?auto_595430 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_596256 - SURFACE
      ?auto_596257 - SURFACE
      ?auto_596258 - SURFACE
      ?auto_596255 - SURFACE
      ?auto_596259 - SURFACE
      ?auto_596261 - SURFACE
      ?auto_596260 - SURFACE
    )
    :vars
    (
      ?auto_596263 - HOIST
      ?auto_596262 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_596263 ?auto_596262 ) ( SURFACE-AT ?auto_596261 ?auto_596262 ) ( CLEAR ?auto_596261 ) ( LIFTING ?auto_596263 ?auto_596260 ) ( IS-CRATE ?auto_596260 ) ( not ( = ?auto_596261 ?auto_596260 ) ) ( ON ?auto_596257 ?auto_596256 ) ( ON ?auto_596258 ?auto_596257 ) ( ON ?auto_596255 ?auto_596258 ) ( ON ?auto_596259 ?auto_596255 ) ( ON ?auto_596261 ?auto_596259 ) ( not ( = ?auto_596256 ?auto_596257 ) ) ( not ( = ?auto_596256 ?auto_596258 ) ) ( not ( = ?auto_596256 ?auto_596255 ) ) ( not ( = ?auto_596256 ?auto_596259 ) ) ( not ( = ?auto_596256 ?auto_596261 ) ) ( not ( = ?auto_596256 ?auto_596260 ) ) ( not ( = ?auto_596257 ?auto_596258 ) ) ( not ( = ?auto_596257 ?auto_596255 ) ) ( not ( = ?auto_596257 ?auto_596259 ) ) ( not ( = ?auto_596257 ?auto_596261 ) ) ( not ( = ?auto_596257 ?auto_596260 ) ) ( not ( = ?auto_596258 ?auto_596255 ) ) ( not ( = ?auto_596258 ?auto_596259 ) ) ( not ( = ?auto_596258 ?auto_596261 ) ) ( not ( = ?auto_596258 ?auto_596260 ) ) ( not ( = ?auto_596255 ?auto_596259 ) ) ( not ( = ?auto_596255 ?auto_596261 ) ) ( not ( = ?auto_596255 ?auto_596260 ) ) ( not ( = ?auto_596259 ?auto_596261 ) ) ( not ( = ?auto_596259 ?auto_596260 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_596261 ?auto_596260 )
      ( MAKE-6CRATE-VERIFY ?auto_596256 ?auto_596257 ?auto_596258 ?auto_596255 ?auto_596259 ?auto_596261 ?auto_596260 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_596300 - SURFACE
      ?auto_596301 - SURFACE
      ?auto_596302 - SURFACE
      ?auto_596299 - SURFACE
      ?auto_596303 - SURFACE
      ?auto_596305 - SURFACE
      ?auto_596304 - SURFACE
    )
    :vars
    (
      ?auto_596308 - HOIST
      ?auto_596306 - PLACE
      ?auto_596307 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_596308 ?auto_596306 ) ( SURFACE-AT ?auto_596305 ?auto_596306 ) ( CLEAR ?auto_596305 ) ( IS-CRATE ?auto_596304 ) ( not ( = ?auto_596305 ?auto_596304 ) ) ( TRUCK-AT ?auto_596307 ?auto_596306 ) ( AVAILABLE ?auto_596308 ) ( IN ?auto_596304 ?auto_596307 ) ( ON ?auto_596305 ?auto_596303 ) ( not ( = ?auto_596303 ?auto_596305 ) ) ( not ( = ?auto_596303 ?auto_596304 ) ) ( ON ?auto_596301 ?auto_596300 ) ( ON ?auto_596302 ?auto_596301 ) ( ON ?auto_596299 ?auto_596302 ) ( ON ?auto_596303 ?auto_596299 ) ( not ( = ?auto_596300 ?auto_596301 ) ) ( not ( = ?auto_596300 ?auto_596302 ) ) ( not ( = ?auto_596300 ?auto_596299 ) ) ( not ( = ?auto_596300 ?auto_596303 ) ) ( not ( = ?auto_596300 ?auto_596305 ) ) ( not ( = ?auto_596300 ?auto_596304 ) ) ( not ( = ?auto_596301 ?auto_596302 ) ) ( not ( = ?auto_596301 ?auto_596299 ) ) ( not ( = ?auto_596301 ?auto_596303 ) ) ( not ( = ?auto_596301 ?auto_596305 ) ) ( not ( = ?auto_596301 ?auto_596304 ) ) ( not ( = ?auto_596302 ?auto_596299 ) ) ( not ( = ?auto_596302 ?auto_596303 ) ) ( not ( = ?auto_596302 ?auto_596305 ) ) ( not ( = ?auto_596302 ?auto_596304 ) ) ( not ( = ?auto_596299 ?auto_596303 ) ) ( not ( = ?auto_596299 ?auto_596305 ) ) ( not ( = ?auto_596299 ?auto_596304 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_596303 ?auto_596305 ?auto_596304 )
      ( MAKE-6CRATE-VERIFY ?auto_596300 ?auto_596301 ?auto_596302 ?auto_596299 ?auto_596303 ?auto_596305 ?auto_596304 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_596351 - SURFACE
      ?auto_596352 - SURFACE
      ?auto_596353 - SURFACE
      ?auto_596350 - SURFACE
      ?auto_596354 - SURFACE
      ?auto_596356 - SURFACE
      ?auto_596355 - SURFACE
    )
    :vars
    (
      ?auto_596360 - HOIST
      ?auto_596358 - PLACE
      ?auto_596359 - TRUCK
      ?auto_596357 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_596360 ?auto_596358 ) ( SURFACE-AT ?auto_596356 ?auto_596358 ) ( CLEAR ?auto_596356 ) ( IS-CRATE ?auto_596355 ) ( not ( = ?auto_596356 ?auto_596355 ) ) ( AVAILABLE ?auto_596360 ) ( IN ?auto_596355 ?auto_596359 ) ( ON ?auto_596356 ?auto_596354 ) ( not ( = ?auto_596354 ?auto_596356 ) ) ( not ( = ?auto_596354 ?auto_596355 ) ) ( TRUCK-AT ?auto_596359 ?auto_596357 ) ( not ( = ?auto_596357 ?auto_596358 ) ) ( ON ?auto_596352 ?auto_596351 ) ( ON ?auto_596353 ?auto_596352 ) ( ON ?auto_596350 ?auto_596353 ) ( ON ?auto_596354 ?auto_596350 ) ( not ( = ?auto_596351 ?auto_596352 ) ) ( not ( = ?auto_596351 ?auto_596353 ) ) ( not ( = ?auto_596351 ?auto_596350 ) ) ( not ( = ?auto_596351 ?auto_596354 ) ) ( not ( = ?auto_596351 ?auto_596356 ) ) ( not ( = ?auto_596351 ?auto_596355 ) ) ( not ( = ?auto_596352 ?auto_596353 ) ) ( not ( = ?auto_596352 ?auto_596350 ) ) ( not ( = ?auto_596352 ?auto_596354 ) ) ( not ( = ?auto_596352 ?auto_596356 ) ) ( not ( = ?auto_596352 ?auto_596355 ) ) ( not ( = ?auto_596353 ?auto_596350 ) ) ( not ( = ?auto_596353 ?auto_596354 ) ) ( not ( = ?auto_596353 ?auto_596356 ) ) ( not ( = ?auto_596353 ?auto_596355 ) ) ( not ( = ?auto_596350 ?auto_596354 ) ) ( not ( = ?auto_596350 ?auto_596356 ) ) ( not ( = ?auto_596350 ?auto_596355 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_596354 ?auto_596356 ?auto_596355 )
      ( MAKE-6CRATE-VERIFY ?auto_596351 ?auto_596352 ?auto_596353 ?auto_596350 ?auto_596354 ?auto_596356 ?auto_596355 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_596408 - SURFACE
      ?auto_596409 - SURFACE
      ?auto_596410 - SURFACE
      ?auto_596407 - SURFACE
      ?auto_596411 - SURFACE
      ?auto_596413 - SURFACE
      ?auto_596412 - SURFACE
    )
    :vars
    (
      ?auto_596414 - HOIST
      ?auto_596418 - PLACE
      ?auto_596415 - TRUCK
      ?auto_596416 - PLACE
      ?auto_596417 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_596414 ?auto_596418 ) ( SURFACE-AT ?auto_596413 ?auto_596418 ) ( CLEAR ?auto_596413 ) ( IS-CRATE ?auto_596412 ) ( not ( = ?auto_596413 ?auto_596412 ) ) ( AVAILABLE ?auto_596414 ) ( ON ?auto_596413 ?auto_596411 ) ( not ( = ?auto_596411 ?auto_596413 ) ) ( not ( = ?auto_596411 ?auto_596412 ) ) ( TRUCK-AT ?auto_596415 ?auto_596416 ) ( not ( = ?auto_596416 ?auto_596418 ) ) ( HOIST-AT ?auto_596417 ?auto_596416 ) ( LIFTING ?auto_596417 ?auto_596412 ) ( not ( = ?auto_596414 ?auto_596417 ) ) ( ON ?auto_596409 ?auto_596408 ) ( ON ?auto_596410 ?auto_596409 ) ( ON ?auto_596407 ?auto_596410 ) ( ON ?auto_596411 ?auto_596407 ) ( not ( = ?auto_596408 ?auto_596409 ) ) ( not ( = ?auto_596408 ?auto_596410 ) ) ( not ( = ?auto_596408 ?auto_596407 ) ) ( not ( = ?auto_596408 ?auto_596411 ) ) ( not ( = ?auto_596408 ?auto_596413 ) ) ( not ( = ?auto_596408 ?auto_596412 ) ) ( not ( = ?auto_596409 ?auto_596410 ) ) ( not ( = ?auto_596409 ?auto_596407 ) ) ( not ( = ?auto_596409 ?auto_596411 ) ) ( not ( = ?auto_596409 ?auto_596413 ) ) ( not ( = ?auto_596409 ?auto_596412 ) ) ( not ( = ?auto_596410 ?auto_596407 ) ) ( not ( = ?auto_596410 ?auto_596411 ) ) ( not ( = ?auto_596410 ?auto_596413 ) ) ( not ( = ?auto_596410 ?auto_596412 ) ) ( not ( = ?auto_596407 ?auto_596411 ) ) ( not ( = ?auto_596407 ?auto_596413 ) ) ( not ( = ?auto_596407 ?auto_596412 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_596411 ?auto_596413 ?auto_596412 )
      ( MAKE-6CRATE-VERIFY ?auto_596408 ?auto_596409 ?auto_596410 ?auto_596407 ?auto_596411 ?auto_596413 ?auto_596412 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_596471 - SURFACE
      ?auto_596472 - SURFACE
      ?auto_596473 - SURFACE
      ?auto_596470 - SURFACE
      ?auto_596474 - SURFACE
      ?auto_596476 - SURFACE
      ?auto_596475 - SURFACE
    )
    :vars
    (
      ?auto_596478 - HOIST
      ?auto_596477 - PLACE
      ?auto_596479 - TRUCK
      ?auto_596482 - PLACE
      ?auto_596481 - HOIST
      ?auto_596480 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_596478 ?auto_596477 ) ( SURFACE-AT ?auto_596476 ?auto_596477 ) ( CLEAR ?auto_596476 ) ( IS-CRATE ?auto_596475 ) ( not ( = ?auto_596476 ?auto_596475 ) ) ( AVAILABLE ?auto_596478 ) ( ON ?auto_596476 ?auto_596474 ) ( not ( = ?auto_596474 ?auto_596476 ) ) ( not ( = ?auto_596474 ?auto_596475 ) ) ( TRUCK-AT ?auto_596479 ?auto_596482 ) ( not ( = ?auto_596482 ?auto_596477 ) ) ( HOIST-AT ?auto_596481 ?auto_596482 ) ( not ( = ?auto_596478 ?auto_596481 ) ) ( AVAILABLE ?auto_596481 ) ( SURFACE-AT ?auto_596475 ?auto_596482 ) ( ON ?auto_596475 ?auto_596480 ) ( CLEAR ?auto_596475 ) ( not ( = ?auto_596476 ?auto_596480 ) ) ( not ( = ?auto_596475 ?auto_596480 ) ) ( not ( = ?auto_596474 ?auto_596480 ) ) ( ON ?auto_596472 ?auto_596471 ) ( ON ?auto_596473 ?auto_596472 ) ( ON ?auto_596470 ?auto_596473 ) ( ON ?auto_596474 ?auto_596470 ) ( not ( = ?auto_596471 ?auto_596472 ) ) ( not ( = ?auto_596471 ?auto_596473 ) ) ( not ( = ?auto_596471 ?auto_596470 ) ) ( not ( = ?auto_596471 ?auto_596474 ) ) ( not ( = ?auto_596471 ?auto_596476 ) ) ( not ( = ?auto_596471 ?auto_596475 ) ) ( not ( = ?auto_596471 ?auto_596480 ) ) ( not ( = ?auto_596472 ?auto_596473 ) ) ( not ( = ?auto_596472 ?auto_596470 ) ) ( not ( = ?auto_596472 ?auto_596474 ) ) ( not ( = ?auto_596472 ?auto_596476 ) ) ( not ( = ?auto_596472 ?auto_596475 ) ) ( not ( = ?auto_596472 ?auto_596480 ) ) ( not ( = ?auto_596473 ?auto_596470 ) ) ( not ( = ?auto_596473 ?auto_596474 ) ) ( not ( = ?auto_596473 ?auto_596476 ) ) ( not ( = ?auto_596473 ?auto_596475 ) ) ( not ( = ?auto_596473 ?auto_596480 ) ) ( not ( = ?auto_596470 ?auto_596474 ) ) ( not ( = ?auto_596470 ?auto_596476 ) ) ( not ( = ?auto_596470 ?auto_596475 ) ) ( not ( = ?auto_596470 ?auto_596480 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_596474 ?auto_596476 ?auto_596475 )
      ( MAKE-6CRATE-VERIFY ?auto_596471 ?auto_596472 ?auto_596473 ?auto_596470 ?auto_596474 ?auto_596476 ?auto_596475 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_596535 - SURFACE
      ?auto_596536 - SURFACE
      ?auto_596537 - SURFACE
      ?auto_596534 - SURFACE
      ?auto_596538 - SURFACE
      ?auto_596540 - SURFACE
      ?auto_596539 - SURFACE
    )
    :vars
    (
      ?auto_596542 - HOIST
      ?auto_596544 - PLACE
      ?auto_596543 - PLACE
      ?auto_596545 - HOIST
      ?auto_596546 - SURFACE
      ?auto_596541 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_596542 ?auto_596544 ) ( SURFACE-AT ?auto_596540 ?auto_596544 ) ( CLEAR ?auto_596540 ) ( IS-CRATE ?auto_596539 ) ( not ( = ?auto_596540 ?auto_596539 ) ) ( AVAILABLE ?auto_596542 ) ( ON ?auto_596540 ?auto_596538 ) ( not ( = ?auto_596538 ?auto_596540 ) ) ( not ( = ?auto_596538 ?auto_596539 ) ) ( not ( = ?auto_596543 ?auto_596544 ) ) ( HOIST-AT ?auto_596545 ?auto_596543 ) ( not ( = ?auto_596542 ?auto_596545 ) ) ( AVAILABLE ?auto_596545 ) ( SURFACE-AT ?auto_596539 ?auto_596543 ) ( ON ?auto_596539 ?auto_596546 ) ( CLEAR ?auto_596539 ) ( not ( = ?auto_596540 ?auto_596546 ) ) ( not ( = ?auto_596539 ?auto_596546 ) ) ( not ( = ?auto_596538 ?auto_596546 ) ) ( TRUCK-AT ?auto_596541 ?auto_596544 ) ( ON ?auto_596536 ?auto_596535 ) ( ON ?auto_596537 ?auto_596536 ) ( ON ?auto_596534 ?auto_596537 ) ( ON ?auto_596538 ?auto_596534 ) ( not ( = ?auto_596535 ?auto_596536 ) ) ( not ( = ?auto_596535 ?auto_596537 ) ) ( not ( = ?auto_596535 ?auto_596534 ) ) ( not ( = ?auto_596535 ?auto_596538 ) ) ( not ( = ?auto_596535 ?auto_596540 ) ) ( not ( = ?auto_596535 ?auto_596539 ) ) ( not ( = ?auto_596535 ?auto_596546 ) ) ( not ( = ?auto_596536 ?auto_596537 ) ) ( not ( = ?auto_596536 ?auto_596534 ) ) ( not ( = ?auto_596536 ?auto_596538 ) ) ( not ( = ?auto_596536 ?auto_596540 ) ) ( not ( = ?auto_596536 ?auto_596539 ) ) ( not ( = ?auto_596536 ?auto_596546 ) ) ( not ( = ?auto_596537 ?auto_596534 ) ) ( not ( = ?auto_596537 ?auto_596538 ) ) ( not ( = ?auto_596537 ?auto_596540 ) ) ( not ( = ?auto_596537 ?auto_596539 ) ) ( not ( = ?auto_596537 ?auto_596546 ) ) ( not ( = ?auto_596534 ?auto_596538 ) ) ( not ( = ?auto_596534 ?auto_596540 ) ) ( not ( = ?auto_596534 ?auto_596539 ) ) ( not ( = ?auto_596534 ?auto_596546 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_596538 ?auto_596540 ?auto_596539 )
      ( MAKE-6CRATE-VERIFY ?auto_596535 ?auto_596536 ?auto_596537 ?auto_596534 ?auto_596538 ?auto_596540 ?auto_596539 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_596599 - SURFACE
      ?auto_596600 - SURFACE
      ?auto_596601 - SURFACE
      ?auto_596598 - SURFACE
      ?auto_596602 - SURFACE
      ?auto_596604 - SURFACE
      ?auto_596603 - SURFACE
    )
    :vars
    (
      ?auto_596606 - HOIST
      ?auto_596608 - PLACE
      ?auto_596609 - PLACE
      ?auto_596605 - HOIST
      ?auto_596607 - SURFACE
      ?auto_596610 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_596606 ?auto_596608 ) ( IS-CRATE ?auto_596603 ) ( not ( = ?auto_596604 ?auto_596603 ) ) ( not ( = ?auto_596602 ?auto_596604 ) ) ( not ( = ?auto_596602 ?auto_596603 ) ) ( not ( = ?auto_596609 ?auto_596608 ) ) ( HOIST-AT ?auto_596605 ?auto_596609 ) ( not ( = ?auto_596606 ?auto_596605 ) ) ( AVAILABLE ?auto_596605 ) ( SURFACE-AT ?auto_596603 ?auto_596609 ) ( ON ?auto_596603 ?auto_596607 ) ( CLEAR ?auto_596603 ) ( not ( = ?auto_596604 ?auto_596607 ) ) ( not ( = ?auto_596603 ?auto_596607 ) ) ( not ( = ?auto_596602 ?auto_596607 ) ) ( TRUCK-AT ?auto_596610 ?auto_596608 ) ( SURFACE-AT ?auto_596602 ?auto_596608 ) ( CLEAR ?auto_596602 ) ( LIFTING ?auto_596606 ?auto_596604 ) ( IS-CRATE ?auto_596604 ) ( ON ?auto_596600 ?auto_596599 ) ( ON ?auto_596601 ?auto_596600 ) ( ON ?auto_596598 ?auto_596601 ) ( ON ?auto_596602 ?auto_596598 ) ( not ( = ?auto_596599 ?auto_596600 ) ) ( not ( = ?auto_596599 ?auto_596601 ) ) ( not ( = ?auto_596599 ?auto_596598 ) ) ( not ( = ?auto_596599 ?auto_596602 ) ) ( not ( = ?auto_596599 ?auto_596604 ) ) ( not ( = ?auto_596599 ?auto_596603 ) ) ( not ( = ?auto_596599 ?auto_596607 ) ) ( not ( = ?auto_596600 ?auto_596601 ) ) ( not ( = ?auto_596600 ?auto_596598 ) ) ( not ( = ?auto_596600 ?auto_596602 ) ) ( not ( = ?auto_596600 ?auto_596604 ) ) ( not ( = ?auto_596600 ?auto_596603 ) ) ( not ( = ?auto_596600 ?auto_596607 ) ) ( not ( = ?auto_596601 ?auto_596598 ) ) ( not ( = ?auto_596601 ?auto_596602 ) ) ( not ( = ?auto_596601 ?auto_596604 ) ) ( not ( = ?auto_596601 ?auto_596603 ) ) ( not ( = ?auto_596601 ?auto_596607 ) ) ( not ( = ?auto_596598 ?auto_596602 ) ) ( not ( = ?auto_596598 ?auto_596604 ) ) ( not ( = ?auto_596598 ?auto_596603 ) ) ( not ( = ?auto_596598 ?auto_596607 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_596602 ?auto_596604 ?auto_596603 )
      ( MAKE-6CRATE-VERIFY ?auto_596599 ?auto_596600 ?auto_596601 ?auto_596598 ?auto_596602 ?auto_596604 ?auto_596603 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_596663 - SURFACE
      ?auto_596664 - SURFACE
      ?auto_596665 - SURFACE
      ?auto_596662 - SURFACE
      ?auto_596666 - SURFACE
      ?auto_596668 - SURFACE
      ?auto_596667 - SURFACE
    )
    :vars
    (
      ?auto_596672 - HOIST
      ?auto_596674 - PLACE
      ?auto_596669 - PLACE
      ?auto_596671 - HOIST
      ?auto_596673 - SURFACE
      ?auto_596670 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_596672 ?auto_596674 ) ( IS-CRATE ?auto_596667 ) ( not ( = ?auto_596668 ?auto_596667 ) ) ( not ( = ?auto_596666 ?auto_596668 ) ) ( not ( = ?auto_596666 ?auto_596667 ) ) ( not ( = ?auto_596669 ?auto_596674 ) ) ( HOIST-AT ?auto_596671 ?auto_596669 ) ( not ( = ?auto_596672 ?auto_596671 ) ) ( AVAILABLE ?auto_596671 ) ( SURFACE-AT ?auto_596667 ?auto_596669 ) ( ON ?auto_596667 ?auto_596673 ) ( CLEAR ?auto_596667 ) ( not ( = ?auto_596668 ?auto_596673 ) ) ( not ( = ?auto_596667 ?auto_596673 ) ) ( not ( = ?auto_596666 ?auto_596673 ) ) ( TRUCK-AT ?auto_596670 ?auto_596674 ) ( SURFACE-AT ?auto_596666 ?auto_596674 ) ( CLEAR ?auto_596666 ) ( IS-CRATE ?auto_596668 ) ( AVAILABLE ?auto_596672 ) ( IN ?auto_596668 ?auto_596670 ) ( ON ?auto_596664 ?auto_596663 ) ( ON ?auto_596665 ?auto_596664 ) ( ON ?auto_596662 ?auto_596665 ) ( ON ?auto_596666 ?auto_596662 ) ( not ( = ?auto_596663 ?auto_596664 ) ) ( not ( = ?auto_596663 ?auto_596665 ) ) ( not ( = ?auto_596663 ?auto_596662 ) ) ( not ( = ?auto_596663 ?auto_596666 ) ) ( not ( = ?auto_596663 ?auto_596668 ) ) ( not ( = ?auto_596663 ?auto_596667 ) ) ( not ( = ?auto_596663 ?auto_596673 ) ) ( not ( = ?auto_596664 ?auto_596665 ) ) ( not ( = ?auto_596664 ?auto_596662 ) ) ( not ( = ?auto_596664 ?auto_596666 ) ) ( not ( = ?auto_596664 ?auto_596668 ) ) ( not ( = ?auto_596664 ?auto_596667 ) ) ( not ( = ?auto_596664 ?auto_596673 ) ) ( not ( = ?auto_596665 ?auto_596662 ) ) ( not ( = ?auto_596665 ?auto_596666 ) ) ( not ( = ?auto_596665 ?auto_596668 ) ) ( not ( = ?auto_596665 ?auto_596667 ) ) ( not ( = ?auto_596665 ?auto_596673 ) ) ( not ( = ?auto_596662 ?auto_596666 ) ) ( not ( = ?auto_596662 ?auto_596668 ) ) ( not ( = ?auto_596662 ?auto_596667 ) ) ( not ( = ?auto_596662 ?auto_596673 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_596666 ?auto_596668 ?auto_596667 )
      ( MAKE-6CRATE-VERIFY ?auto_596663 ?auto_596664 ?auto_596665 ?auto_596662 ?auto_596666 ?auto_596668 ?auto_596667 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_598600 - SURFACE
      ?auto_598601 - SURFACE
      ?auto_598602 - SURFACE
      ?auto_598599 - SURFACE
      ?auto_598603 - SURFACE
      ?auto_598605 - SURFACE
      ?auto_598604 - SURFACE
      ?auto_598606 - SURFACE
    )
    :vars
    (
      ?auto_598608 - HOIST
      ?auto_598607 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_598608 ?auto_598607 ) ( SURFACE-AT ?auto_598604 ?auto_598607 ) ( CLEAR ?auto_598604 ) ( LIFTING ?auto_598608 ?auto_598606 ) ( IS-CRATE ?auto_598606 ) ( not ( = ?auto_598604 ?auto_598606 ) ) ( ON ?auto_598601 ?auto_598600 ) ( ON ?auto_598602 ?auto_598601 ) ( ON ?auto_598599 ?auto_598602 ) ( ON ?auto_598603 ?auto_598599 ) ( ON ?auto_598605 ?auto_598603 ) ( ON ?auto_598604 ?auto_598605 ) ( not ( = ?auto_598600 ?auto_598601 ) ) ( not ( = ?auto_598600 ?auto_598602 ) ) ( not ( = ?auto_598600 ?auto_598599 ) ) ( not ( = ?auto_598600 ?auto_598603 ) ) ( not ( = ?auto_598600 ?auto_598605 ) ) ( not ( = ?auto_598600 ?auto_598604 ) ) ( not ( = ?auto_598600 ?auto_598606 ) ) ( not ( = ?auto_598601 ?auto_598602 ) ) ( not ( = ?auto_598601 ?auto_598599 ) ) ( not ( = ?auto_598601 ?auto_598603 ) ) ( not ( = ?auto_598601 ?auto_598605 ) ) ( not ( = ?auto_598601 ?auto_598604 ) ) ( not ( = ?auto_598601 ?auto_598606 ) ) ( not ( = ?auto_598602 ?auto_598599 ) ) ( not ( = ?auto_598602 ?auto_598603 ) ) ( not ( = ?auto_598602 ?auto_598605 ) ) ( not ( = ?auto_598602 ?auto_598604 ) ) ( not ( = ?auto_598602 ?auto_598606 ) ) ( not ( = ?auto_598599 ?auto_598603 ) ) ( not ( = ?auto_598599 ?auto_598605 ) ) ( not ( = ?auto_598599 ?auto_598604 ) ) ( not ( = ?auto_598599 ?auto_598606 ) ) ( not ( = ?auto_598603 ?auto_598605 ) ) ( not ( = ?auto_598603 ?auto_598604 ) ) ( not ( = ?auto_598603 ?auto_598606 ) ) ( not ( = ?auto_598605 ?auto_598604 ) ) ( not ( = ?auto_598605 ?auto_598606 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_598604 ?auto_598606 )
      ( MAKE-7CRATE-VERIFY ?auto_598600 ?auto_598601 ?auto_598602 ?auto_598599 ?auto_598603 ?auto_598605 ?auto_598604 ?auto_598606 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_598655 - SURFACE
      ?auto_598656 - SURFACE
      ?auto_598657 - SURFACE
      ?auto_598654 - SURFACE
      ?auto_598658 - SURFACE
      ?auto_598660 - SURFACE
      ?auto_598659 - SURFACE
      ?auto_598661 - SURFACE
    )
    :vars
    (
      ?auto_598664 - HOIST
      ?auto_598662 - PLACE
      ?auto_598663 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_598664 ?auto_598662 ) ( SURFACE-AT ?auto_598659 ?auto_598662 ) ( CLEAR ?auto_598659 ) ( IS-CRATE ?auto_598661 ) ( not ( = ?auto_598659 ?auto_598661 ) ) ( TRUCK-AT ?auto_598663 ?auto_598662 ) ( AVAILABLE ?auto_598664 ) ( IN ?auto_598661 ?auto_598663 ) ( ON ?auto_598659 ?auto_598660 ) ( not ( = ?auto_598660 ?auto_598659 ) ) ( not ( = ?auto_598660 ?auto_598661 ) ) ( ON ?auto_598656 ?auto_598655 ) ( ON ?auto_598657 ?auto_598656 ) ( ON ?auto_598654 ?auto_598657 ) ( ON ?auto_598658 ?auto_598654 ) ( ON ?auto_598660 ?auto_598658 ) ( not ( = ?auto_598655 ?auto_598656 ) ) ( not ( = ?auto_598655 ?auto_598657 ) ) ( not ( = ?auto_598655 ?auto_598654 ) ) ( not ( = ?auto_598655 ?auto_598658 ) ) ( not ( = ?auto_598655 ?auto_598660 ) ) ( not ( = ?auto_598655 ?auto_598659 ) ) ( not ( = ?auto_598655 ?auto_598661 ) ) ( not ( = ?auto_598656 ?auto_598657 ) ) ( not ( = ?auto_598656 ?auto_598654 ) ) ( not ( = ?auto_598656 ?auto_598658 ) ) ( not ( = ?auto_598656 ?auto_598660 ) ) ( not ( = ?auto_598656 ?auto_598659 ) ) ( not ( = ?auto_598656 ?auto_598661 ) ) ( not ( = ?auto_598657 ?auto_598654 ) ) ( not ( = ?auto_598657 ?auto_598658 ) ) ( not ( = ?auto_598657 ?auto_598660 ) ) ( not ( = ?auto_598657 ?auto_598659 ) ) ( not ( = ?auto_598657 ?auto_598661 ) ) ( not ( = ?auto_598654 ?auto_598658 ) ) ( not ( = ?auto_598654 ?auto_598660 ) ) ( not ( = ?auto_598654 ?auto_598659 ) ) ( not ( = ?auto_598654 ?auto_598661 ) ) ( not ( = ?auto_598658 ?auto_598660 ) ) ( not ( = ?auto_598658 ?auto_598659 ) ) ( not ( = ?auto_598658 ?auto_598661 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_598660 ?auto_598659 ?auto_598661 )
      ( MAKE-7CRATE-VERIFY ?auto_598655 ?auto_598656 ?auto_598657 ?auto_598654 ?auto_598658 ?auto_598660 ?auto_598659 ?auto_598661 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_598718 - SURFACE
      ?auto_598719 - SURFACE
      ?auto_598720 - SURFACE
      ?auto_598717 - SURFACE
      ?auto_598721 - SURFACE
      ?auto_598723 - SURFACE
      ?auto_598722 - SURFACE
      ?auto_598724 - SURFACE
    )
    :vars
    (
      ?auto_598726 - HOIST
      ?auto_598727 - PLACE
      ?auto_598728 - TRUCK
      ?auto_598725 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_598726 ?auto_598727 ) ( SURFACE-AT ?auto_598722 ?auto_598727 ) ( CLEAR ?auto_598722 ) ( IS-CRATE ?auto_598724 ) ( not ( = ?auto_598722 ?auto_598724 ) ) ( AVAILABLE ?auto_598726 ) ( IN ?auto_598724 ?auto_598728 ) ( ON ?auto_598722 ?auto_598723 ) ( not ( = ?auto_598723 ?auto_598722 ) ) ( not ( = ?auto_598723 ?auto_598724 ) ) ( TRUCK-AT ?auto_598728 ?auto_598725 ) ( not ( = ?auto_598725 ?auto_598727 ) ) ( ON ?auto_598719 ?auto_598718 ) ( ON ?auto_598720 ?auto_598719 ) ( ON ?auto_598717 ?auto_598720 ) ( ON ?auto_598721 ?auto_598717 ) ( ON ?auto_598723 ?auto_598721 ) ( not ( = ?auto_598718 ?auto_598719 ) ) ( not ( = ?auto_598718 ?auto_598720 ) ) ( not ( = ?auto_598718 ?auto_598717 ) ) ( not ( = ?auto_598718 ?auto_598721 ) ) ( not ( = ?auto_598718 ?auto_598723 ) ) ( not ( = ?auto_598718 ?auto_598722 ) ) ( not ( = ?auto_598718 ?auto_598724 ) ) ( not ( = ?auto_598719 ?auto_598720 ) ) ( not ( = ?auto_598719 ?auto_598717 ) ) ( not ( = ?auto_598719 ?auto_598721 ) ) ( not ( = ?auto_598719 ?auto_598723 ) ) ( not ( = ?auto_598719 ?auto_598722 ) ) ( not ( = ?auto_598719 ?auto_598724 ) ) ( not ( = ?auto_598720 ?auto_598717 ) ) ( not ( = ?auto_598720 ?auto_598721 ) ) ( not ( = ?auto_598720 ?auto_598723 ) ) ( not ( = ?auto_598720 ?auto_598722 ) ) ( not ( = ?auto_598720 ?auto_598724 ) ) ( not ( = ?auto_598717 ?auto_598721 ) ) ( not ( = ?auto_598717 ?auto_598723 ) ) ( not ( = ?auto_598717 ?auto_598722 ) ) ( not ( = ?auto_598717 ?auto_598724 ) ) ( not ( = ?auto_598721 ?auto_598723 ) ) ( not ( = ?auto_598721 ?auto_598722 ) ) ( not ( = ?auto_598721 ?auto_598724 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_598723 ?auto_598722 ?auto_598724 )
      ( MAKE-7CRATE-VERIFY ?auto_598718 ?auto_598719 ?auto_598720 ?auto_598717 ?auto_598721 ?auto_598723 ?auto_598722 ?auto_598724 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_598788 - SURFACE
      ?auto_598789 - SURFACE
      ?auto_598790 - SURFACE
      ?auto_598787 - SURFACE
      ?auto_598791 - SURFACE
      ?auto_598793 - SURFACE
      ?auto_598792 - SURFACE
      ?auto_598794 - SURFACE
    )
    :vars
    (
      ?auto_598797 - HOIST
      ?auto_598796 - PLACE
      ?auto_598798 - TRUCK
      ?auto_598799 - PLACE
      ?auto_598795 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_598797 ?auto_598796 ) ( SURFACE-AT ?auto_598792 ?auto_598796 ) ( CLEAR ?auto_598792 ) ( IS-CRATE ?auto_598794 ) ( not ( = ?auto_598792 ?auto_598794 ) ) ( AVAILABLE ?auto_598797 ) ( ON ?auto_598792 ?auto_598793 ) ( not ( = ?auto_598793 ?auto_598792 ) ) ( not ( = ?auto_598793 ?auto_598794 ) ) ( TRUCK-AT ?auto_598798 ?auto_598799 ) ( not ( = ?auto_598799 ?auto_598796 ) ) ( HOIST-AT ?auto_598795 ?auto_598799 ) ( LIFTING ?auto_598795 ?auto_598794 ) ( not ( = ?auto_598797 ?auto_598795 ) ) ( ON ?auto_598789 ?auto_598788 ) ( ON ?auto_598790 ?auto_598789 ) ( ON ?auto_598787 ?auto_598790 ) ( ON ?auto_598791 ?auto_598787 ) ( ON ?auto_598793 ?auto_598791 ) ( not ( = ?auto_598788 ?auto_598789 ) ) ( not ( = ?auto_598788 ?auto_598790 ) ) ( not ( = ?auto_598788 ?auto_598787 ) ) ( not ( = ?auto_598788 ?auto_598791 ) ) ( not ( = ?auto_598788 ?auto_598793 ) ) ( not ( = ?auto_598788 ?auto_598792 ) ) ( not ( = ?auto_598788 ?auto_598794 ) ) ( not ( = ?auto_598789 ?auto_598790 ) ) ( not ( = ?auto_598789 ?auto_598787 ) ) ( not ( = ?auto_598789 ?auto_598791 ) ) ( not ( = ?auto_598789 ?auto_598793 ) ) ( not ( = ?auto_598789 ?auto_598792 ) ) ( not ( = ?auto_598789 ?auto_598794 ) ) ( not ( = ?auto_598790 ?auto_598787 ) ) ( not ( = ?auto_598790 ?auto_598791 ) ) ( not ( = ?auto_598790 ?auto_598793 ) ) ( not ( = ?auto_598790 ?auto_598792 ) ) ( not ( = ?auto_598790 ?auto_598794 ) ) ( not ( = ?auto_598787 ?auto_598791 ) ) ( not ( = ?auto_598787 ?auto_598793 ) ) ( not ( = ?auto_598787 ?auto_598792 ) ) ( not ( = ?auto_598787 ?auto_598794 ) ) ( not ( = ?auto_598791 ?auto_598793 ) ) ( not ( = ?auto_598791 ?auto_598792 ) ) ( not ( = ?auto_598791 ?auto_598794 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_598793 ?auto_598792 ?auto_598794 )
      ( MAKE-7CRATE-VERIFY ?auto_598788 ?auto_598789 ?auto_598790 ?auto_598787 ?auto_598791 ?auto_598793 ?auto_598792 ?auto_598794 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_598865 - SURFACE
      ?auto_598866 - SURFACE
      ?auto_598867 - SURFACE
      ?auto_598864 - SURFACE
      ?auto_598868 - SURFACE
      ?auto_598870 - SURFACE
      ?auto_598869 - SURFACE
      ?auto_598871 - SURFACE
    )
    :vars
    (
      ?auto_598875 - HOIST
      ?auto_598876 - PLACE
      ?auto_598877 - TRUCK
      ?auto_598872 - PLACE
      ?auto_598873 - HOIST
      ?auto_598874 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_598875 ?auto_598876 ) ( SURFACE-AT ?auto_598869 ?auto_598876 ) ( CLEAR ?auto_598869 ) ( IS-CRATE ?auto_598871 ) ( not ( = ?auto_598869 ?auto_598871 ) ) ( AVAILABLE ?auto_598875 ) ( ON ?auto_598869 ?auto_598870 ) ( not ( = ?auto_598870 ?auto_598869 ) ) ( not ( = ?auto_598870 ?auto_598871 ) ) ( TRUCK-AT ?auto_598877 ?auto_598872 ) ( not ( = ?auto_598872 ?auto_598876 ) ) ( HOIST-AT ?auto_598873 ?auto_598872 ) ( not ( = ?auto_598875 ?auto_598873 ) ) ( AVAILABLE ?auto_598873 ) ( SURFACE-AT ?auto_598871 ?auto_598872 ) ( ON ?auto_598871 ?auto_598874 ) ( CLEAR ?auto_598871 ) ( not ( = ?auto_598869 ?auto_598874 ) ) ( not ( = ?auto_598871 ?auto_598874 ) ) ( not ( = ?auto_598870 ?auto_598874 ) ) ( ON ?auto_598866 ?auto_598865 ) ( ON ?auto_598867 ?auto_598866 ) ( ON ?auto_598864 ?auto_598867 ) ( ON ?auto_598868 ?auto_598864 ) ( ON ?auto_598870 ?auto_598868 ) ( not ( = ?auto_598865 ?auto_598866 ) ) ( not ( = ?auto_598865 ?auto_598867 ) ) ( not ( = ?auto_598865 ?auto_598864 ) ) ( not ( = ?auto_598865 ?auto_598868 ) ) ( not ( = ?auto_598865 ?auto_598870 ) ) ( not ( = ?auto_598865 ?auto_598869 ) ) ( not ( = ?auto_598865 ?auto_598871 ) ) ( not ( = ?auto_598865 ?auto_598874 ) ) ( not ( = ?auto_598866 ?auto_598867 ) ) ( not ( = ?auto_598866 ?auto_598864 ) ) ( not ( = ?auto_598866 ?auto_598868 ) ) ( not ( = ?auto_598866 ?auto_598870 ) ) ( not ( = ?auto_598866 ?auto_598869 ) ) ( not ( = ?auto_598866 ?auto_598871 ) ) ( not ( = ?auto_598866 ?auto_598874 ) ) ( not ( = ?auto_598867 ?auto_598864 ) ) ( not ( = ?auto_598867 ?auto_598868 ) ) ( not ( = ?auto_598867 ?auto_598870 ) ) ( not ( = ?auto_598867 ?auto_598869 ) ) ( not ( = ?auto_598867 ?auto_598871 ) ) ( not ( = ?auto_598867 ?auto_598874 ) ) ( not ( = ?auto_598864 ?auto_598868 ) ) ( not ( = ?auto_598864 ?auto_598870 ) ) ( not ( = ?auto_598864 ?auto_598869 ) ) ( not ( = ?auto_598864 ?auto_598871 ) ) ( not ( = ?auto_598864 ?auto_598874 ) ) ( not ( = ?auto_598868 ?auto_598870 ) ) ( not ( = ?auto_598868 ?auto_598869 ) ) ( not ( = ?auto_598868 ?auto_598871 ) ) ( not ( = ?auto_598868 ?auto_598874 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_598870 ?auto_598869 ?auto_598871 )
      ( MAKE-7CRATE-VERIFY ?auto_598865 ?auto_598866 ?auto_598867 ?auto_598864 ?auto_598868 ?auto_598870 ?auto_598869 ?auto_598871 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_598943 - SURFACE
      ?auto_598944 - SURFACE
      ?auto_598945 - SURFACE
      ?auto_598942 - SURFACE
      ?auto_598946 - SURFACE
      ?auto_598948 - SURFACE
      ?auto_598947 - SURFACE
      ?auto_598949 - SURFACE
    )
    :vars
    (
      ?auto_598952 - HOIST
      ?auto_598954 - PLACE
      ?auto_598953 - PLACE
      ?auto_598951 - HOIST
      ?auto_598955 - SURFACE
      ?auto_598950 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_598952 ?auto_598954 ) ( SURFACE-AT ?auto_598947 ?auto_598954 ) ( CLEAR ?auto_598947 ) ( IS-CRATE ?auto_598949 ) ( not ( = ?auto_598947 ?auto_598949 ) ) ( AVAILABLE ?auto_598952 ) ( ON ?auto_598947 ?auto_598948 ) ( not ( = ?auto_598948 ?auto_598947 ) ) ( not ( = ?auto_598948 ?auto_598949 ) ) ( not ( = ?auto_598953 ?auto_598954 ) ) ( HOIST-AT ?auto_598951 ?auto_598953 ) ( not ( = ?auto_598952 ?auto_598951 ) ) ( AVAILABLE ?auto_598951 ) ( SURFACE-AT ?auto_598949 ?auto_598953 ) ( ON ?auto_598949 ?auto_598955 ) ( CLEAR ?auto_598949 ) ( not ( = ?auto_598947 ?auto_598955 ) ) ( not ( = ?auto_598949 ?auto_598955 ) ) ( not ( = ?auto_598948 ?auto_598955 ) ) ( TRUCK-AT ?auto_598950 ?auto_598954 ) ( ON ?auto_598944 ?auto_598943 ) ( ON ?auto_598945 ?auto_598944 ) ( ON ?auto_598942 ?auto_598945 ) ( ON ?auto_598946 ?auto_598942 ) ( ON ?auto_598948 ?auto_598946 ) ( not ( = ?auto_598943 ?auto_598944 ) ) ( not ( = ?auto_598943 ?auto_598945 ) ) ( not ( = ?auto_598943 ?auto_598942 ) ) ( not ( = ?auto_598943 ?auto_598946 ) ) ( not ( = ?auto_598943 ?auto_598948 ) ) ( not ( = ?auto_598943 ?auto_598947 ) ) ( not ( = ?auto_598943 ?auto_598949 ) ) ( not ( = ?auto_598943 ?auto_598955 ) ) ( not ( = ?auto_598944 ?auto_598945 ) ) ( not ( = ?auto_598944 ?auto_598942 ) ) ( not ( = ?auto_598944 ?auto_598946 ) ) ( not ( = ?auto_598944 ?auto_598948 ) ) ( not ( = ?auto_598944 ?auto_598947 ) ) ( not ( = ?auto_598944 ?auto_598949 ) ) ( not ( = ?auto_598944 ?auto_598955 ) ) ( not ( = ?auto_598945 ?auto_598942 ) ) ( not ( = ?auto_598945 ?auto_598946 ) ) ( not ( = ?auto_598945 ?auto_598948 ) ) ( not ( = ?auto_598945 ?auto_598947 ) ) ( not ( = ?auto_598945 ?auto_598949 ) ) ( not ( = ?auto_598945 ?auto_598955 ) ) ( not ( = ?auto_598942 ?auto_598946 ) ) ( not ( = ?auto_598942 ?auto_598948 ) ) ( not ( = ?auto_598942 ?auto_598947 ) ) ( not ( = ?auto_598942 ?auto_598949 ) ) ( not ( = ?auto_598942 ?auto_598955 ) ) ( not ( = ?auto_598946 ?auto_598948 ) ) ( not ( = ?auto_598946 ?auto_598947 ) ) ( not ( = ?auto_598946 ?auto_598949 ) ) ( not ( = ?auto_598946 ?auto_598955 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_598948 ?auto_598947 ?auto_598949 )
      ( MAKE-7CRATE-VERIFY ?auto_598943 ?auto_598944 ?auto_598945 ?auto_598942 ?auto_598946 ?auto_598948 ?auto_598947 ?auto_598949 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_599021 - SURFACE
      ?auto_599022 - SURFACE
      ?auto_599023 - SURFACE
      ?auto_599020 - SURFACE
      ?auto_599024 - SURFACE
      ?auto_599026 - SURFACE
      ?auto_599025 - SURFACE
      ?auto_599027 - SURFACE
    )
    :vars
    (
      ?auto_599033 - HOIST
      ?auto_599030 - PLACE
      ?auto_599031 - PLACE
      ?auto_599029 - HOIST
      ?auto_599032 - SURFACE
      ?auto_599028 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_599033 ?auto_599030 ) ( IS-CRATE ?auto_599027 ) ( not ( = ?auto_599025 ?auto_599027 ) ) ( not ( = ?auto_599026 ?auto_599025 ) ) ( not ( = ?auto_599026 ?auto_599027 ) ) ( not ( = ?auto_599031 ?auto_599030 ) ) ( HOIST-AT ?auto_599029 ?auto_599031 ) ( not ( = ?auto_599033 ?auto_599029 ) ) ( AVAILABLE ?auto_599029 ) ( SURFACE-AT ?auto_599027 ?auto_599031 ) ( ON ?auto_599027 ?auto_599032 ) ( CLEAR ?auto_599027 ) ( not ( = ?auto_599025 ?auto_599032 ) ) ( not ( = ?auto_599027 ?auto_599032 ) ) ( not ( = ?auto_599026 ?auto_599032 ) ) ( TRUCK-AT ?auto_599028 ?auto_599030 ) ( SURFACE-AT ?auto_599026 ?auto_599030 ) ( CLEAR ?auto_599026 ) ( LIFTING ?auto_599033 ?auto_599025 ) ( IS-CRATE ?auto_599025 ) ( ON ?auto_599022 ?auto_599021 ) ( ON ?auto_599023 ?auto_599022 ) ( ON ?auto_599020 ?auto_599023 ) ( ON ?auto_599024 ?auto_599020 ) ( ON ?auto_599026 ?auto_599024 ) ( not ( = ?auto_599021 ?auto_599022 ) ) ( not ( = ?auto_599021 ?auto_599023 ) ) ( not ( = ?auto_599021 ?auto_599020 ) ) ( not ( = ?auto_599021 ?auto_599024 ) ) ( not ( = ?auto_599021 ?auto_599026 ) ) ( not ( = ?auto_599021 ?auto_599025 ) ) ( not ( = ?auto_599021 ?auto_599027 ) ) ( not ( = ?auto_599021 ?auto_599032 ) ) ( not ( = ?auto_599022 ?auto_599023 ) ) ( not ( = ?auto_599022 ?auto_599020 ) ) ( not ( = ?auto_599022 ?auto_599024 ) ) ( not ( = ?auto_599022 ?auto_599026 ) ) ( not ( = ?auto_599022 ?auto_599025 ) ) ( not ( = ?auto_599022 ?auto_599027 ) ) ( not ( = ?auto_599022 ?auto_599032 ) ) ( not ( = ?auto_599023 ?auto_599020 ) ) ( not ( = ?auto_599023 ?auto_599024 ) ) ( not ( = ?auto_599023 ?auto_599026 ) ) ( not ( = ?auto_599023 ?auto_599025 ) ) ( not ( = ?auto_599023 ?auto_599027 ) ) ( not ( = ?auto_599023 ?auto_599032 ) ) ( not ( = ?auto_599020 ?auto_599024 ) ) ( not ( = ?auto_599020 ?auto_599026 ) ) ( not ( = ?auto_599020 ?auto_599025 ) ) ( not ( = ?auto_599020 ?auto_599027 ) ) ( not ( = ?auto_599020 ?auto_599032 ) ) ( not ( = ?auto_599024 ?auto_599026 ) ) ( not ( = ?auto_599024 ?auto_599025 ) ) ( not ( = ?auto_599024 ?auto_599027 ) ) ( not ( = ?auto_599024 ?auto_599032 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_599026 ?auto_599025 ?auto_599027 )
      ( MAKE-7CRATE-VERIFY ?auto_599021 ?auto_599022 ?auto_599023 ?auto_599020 ?auto_599024 ?auto_599026 ?auto_599025 ?auto_599027 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_599099 - SURFACE
      ?auto_599100 - SURFACE
      ?auto_599101 - SURFACE
      ?auto_599098 - SURFACE
      ?auto_599102 - SURFACE
      ?auto_599104 - SURFACE
      ?auto_599103 - SURFACE
      ?auto_599105 - SURFACE
    )
    :vars
    (
      ?auto_599107 - HOIST
      ?auto_599108 - PLACE
      ?auto_599111 - PLACE
      ?auto_599110 - HOIST
      ?auto_599106 - SURFACE
      ?auto_599109 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_599107 ?auto_599108 ) ( IS-CRATE ?auto_599105 ) ( not ( = ?auto_599103 ?auto_599105 ) ) ( not ( = ?auto_599104 ?auto_599103 ) ) ( not ( = ?auto_599104 ?auto_599105 ) ) ( not ( = ?auto_599111 ?auto_599108 ) ) ( HOIST-AT ?auto_599110 ?auto_599111 ) ( not ( = ?auto_599107 ?auto_599110 ) ) ( AVAILABLE ?auto_599110 ) ( SURFACE-AT ?auto_599105 ?auto_599111 ) ( ON ?auto_599105 ?auto_599106 ) ( CLEAR ?auto_599105 ) ( not ( = ?auto_599103 ?auto_599106 ) ) ( not ( = ?auto_599105 ?auto_599106 ) ) ( not ( = ?auto_599104 ?auto_599106 ) ) ( TRUCK-AT ?auto_599109 ?auto_599108 ) ( SURFACE-AT ?auto_599104 ?auto_599108 ) ( CLEAR ?auto_599104 ) ( IS-CRATE ?auto_599103 ) ( AVAILABLE ?auto_599107 ) ( IN ?auto_599103 ?auto_599109 ) ( ON ?auto_599100 ?auto_599099 ) ( ON ?auto_599101 ?auto_599100 ) ( ON ?auto_599098 ?auto_599101 ) ( ON ?auto_599102 ?auto_599098 ) ( ON ?auto_599104 ?auto_599102 ) ( not ( = ?auto_599099 ?auto_599100 ) ) ( not ( = ?auto_599099 ?auto_599101 ) ) ( not ( = ?auto_599099 ?auto_599098 ) ) ( not ( = ?auto_599099 ?auto_599102 ) ) ( not ( = ?auto_599099 ?auto_599104 ) ) ( not ( = ?auto_599099 ?auto_599103 ) ) ( not ( = ?auto_599099 ?auto_599105 ) ) ( not ( = ?auto_599099 ?auto_599106 ) ) ( not ( = ?auto_599100 ?auto_599101 ) ) ( not ( = ?auto_599100 ?auto_599098 ) ) ( not ( = ?auto_599100 ?auto_599102 ) ) ( not ( = ?auto_599100 ?auto_599104 ) ) ( not ( = ?auto_599100 ?auto_599103 ) ) ( not ( = ?auto_599100 ?auto_599105 ) ) ( not ( = ?auto_599100 ?auto_599106 ) ) ( not ( = ?auto_599101 ?auto_599098 ) ) ( not ( = ?auto_599101 ?auto_599102 ) ) ( not ( = ?auto_599101 ?auto_599104 ) ) ( not ( = ?auto_599101 ?auto_599103 ) ) ( not ( = ?auto_599101 ?auto_599105 ) ) ( not ( = ?auto_599101 ?auto_599106 ) ) ( not ( = ?auto_599098 ?auto_599102 ) ) ( not ( = ?auto_599098 ?auto_599104 ) ) ( not ( = ?auto_599098 ?auto_599103 ) ) ( not ( = ?auto_599098 ?auto_599105 ) ) ( not ( = ?auto_599098 ?auto_599106 ) ) ( not ( = ?auto_599102 ?auto_599104 ) ) ( not ( = ?auto_599102 ?auto_599103 ) ) ( not ( = ?auto_599102 ?auto_599105 ) ) ( not ( = ?auto_599102 ?auto_599106 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_599104 ?auto_599103 ?auto_599105 )
      ( MAKE-7CRATE-VERIFY ?auto_599099 ?auto_599100 ?auto_599101 ?auto_599098 ?auto_599102 ?auto_599104 ?auto_599103 ?auto_599105 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_601977 - SURFACE
      ?auto_601978 - SURFACE
      ?auto_601979 - SURFACE
      ?auto_601976 - SURFACE
      ?auto_601980 - SURFACE
      ?auto_601982 - SURFACE
      ?auto_601981 - SURFACE
      ?auto_601983 - SURFACE
      ?auto_601984 - SURFACE
    )
    :vars
    (
      ?auto_601985 - HOIST
      ?auto_601986 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_601985 ?auto_601986 ) ( SURFACE-AT ?auto_601983 ?auto_601986 ) ( CLEAR ?auto_601983 ) ( LIFTING ?auto_601985 ?auto_601984 ) ( IS-CRATE ?auto_601984 ) ( not ( = ?auto_601983 ?auto_601984 ) ) ( ON ?auto_601978 ?auto_601977 ) ( ON ?auto_601979 ?auto_601978 ) ( ON ?auto_601976 ?auto_601979 ) ( ON ?auto_601980 ?auto_601976 ) ( ON ?auto_601982 ?auto_601980 ) ( ON ?auto_601981 ?auto_601982 ) ( ON ?auto_601983 ?auto_601981 ) ( not ( = ?auto_601977 ?auto_601978 ) ) ( not ( = ?auto_601977 ?auto_601979 ) ) ( not ( = ?auto_601977 ?auto_601976 ) ) ( not ( = ?auto_601977 ?auto_601980 ) ) ( not ( = ?auto_601977 ?auto_601982 ) ) ( not ( = ?auto_601977 ?auto_601981 ) ) ( not ( = ?auto_601977 ?auto_601983 ) ) ( not ( = ?auto_601977 ?auto_601984 ) ) ( not ( = ?auto_601978 ?auto_601979 ) ) ( not ( = ?auto_601978 ?auto_601976 ) ) ( not ( = ?auto_601978 ?auto_601980 ) ) ( not ( = ?auto_601978 ?auto_601982 ) ) ( not ( = ?auto_601978 ?auto_601981 ) ) ( not ( = ?auto_601978 ?auto_601983 ) ) ( not ( = ?auto_601978 ?auto_601984 ) ) ( not ( = ?auto_601979 ?auto_601976 ) ) ( not ( = ?auto_601979 ?auto_601980 ) ) ( not ( = ?auto_601979 ?auto_601982 ) ) ( not ( = ?auto_601979 ?auto_601981 ) ) ( not ( = ?auto_601979 ?auto_601983 ) ) ( not ( = ?auto_601979 ?auto_601984 ) ) ( not ( = ?auto_601976 ?auto_601980 ) ) ( not ( = ?auto_601976 ?auto_601982 ) ) ( not ( = ?auto_601976 ?auto_601981 ) ) ( not ( = ?auto_601976 ?auto_601983 ) ) ( not ( = ?auto_601976 ?auto_601984 ) ) ( not ( = ?auto_601980 ?auto_601982 ) ) ( not ( = ?auto_601980 ?auto_601981 ) ) ( not ( = ?auto_601980 ?auto_601983 ) ) ( not ( = ?auto_601980 ?auto_601984 ) ) ( not ( = ?auto_601982 ?auto_601981 ) ) ( not ( = ?auto_601982 ?auto_601983 ) ) ( not ( = ?auto_601982 ?auto_601984 ) ) ( not ( = ?auto_601981 ?auto_601983 ) ) ( not ( = ?auto_601981 ?auto_601984 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_601983 ?auto_601984 )
      ( MAKE-8CRATE-VERIFY ?auto_601977 ?auto_601978 ?auto_601979 ?auto_601976 ?auto_601980 ?auto_601982 ?auto_601981 ?auto_601983 ?auto_601984 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_602044 - SURFACE
      ?auto_602045 - SURFACE
      ?auto_602046 - SURFACE
      ?auto_602043 - SURFACE
      ?auto_602047 - SURFACE
      ?auto_602049 - SURFACE
      ?auto_602048 - SURFACE
      ?auto_602050 - SURFACE
      ?auto_602051 - SURFACE
    )
    :vars
    (
      ?auto_602054 - HOIST
      ?auto_602052 - PLACE
      ?auto_602053 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_602054 ?auto_602052 ) ( SURFACE-AT ?auto_602050 ?auto_602052 ) ( CLEAR ?auto_602050 ) ( IS-CRATE ?auto_602051 ) ( not ( = ?auto_602050 ?auto_602051 ) ) ( TRUCK-AT ?auto_602053 ?auto_602052 ) ( AVAILABLE ?auto_602054 ) ( IN ?auto_602051 ?auto_602053 ) ( ON ?auto_602050 ?auto_602048 ) ( not ( = ?auto_602048 ?auto_602050 ) ) ( not ( = ?auto_602048 ?auto_602051 ) ) ( ON ?auto_602045 ?auto_602044 ) ( ON ?auto_602046 ?auto_602045 ) ( ON ?auto_602043 ?auto_602046 ) ( ON ?auto_602047 ?auto_602043 ) ( ON ?auto_602049 ?auto_602047 ) ( ON ?auto_602048 ?auto_602049 ) ( not ( = ?auto_602044 ?auto_602045 ) ) ( not ( = ?auto_602044 ?auto_602046 ) ) ( not ( = ?auto_602044 ?auto_602043 ) ) ( not ( = ?auto_602044 ?auto_602047 ) ) ( not ( = ?auto_602044 ?auto_602049 ) ) ( not ( = ?auto_602044 ?auto_602048 ) ) ( not ( = ?auto_602044 ?auto_602050 ) ) ( not ( = ?auto_602044 ?auto_602051 ) ) ( not ( = ?auto_602045 ?auto_602046 ) ) ( not ( = ?auto_602045 ?auto_602043 ) ) ( not ( = ?auto_602045 ?auto_602047 ) ) ( not ( = ?auto_602045 ?auto_602049 ) ) ( not ( = ?auto_602045 ?auto_602048 ) ) ( not ( = ?auto_602045 ?auto_602050 ) ) ( not ( = ?auto_602045 ?auto_602051 ) ) ( not ( = ?auto_602046 ?auto_602043 ) ) ( not ( = ?auto_602046 ?auto_602047 ) ) ( not ( = ?auto_602046 ?auto_602049 ) ) ( not ( = ?auto_602046 ?auto_602048 ) ) ( not ( = ?auto_602046 ?auto_602050 ) ) ( not ( = ?auto_602046 ?auto_602051 ) ) ( not ( = ?auto_602043 ?auto_602047 ) ) ( not ( = ?auto_602043 ?auto_602049 ) ) ( not ( = ?auto_602043 ?auto_602048 ) ) ( not ( = ?auto_602043 ?auto_602050 ) ) ( not ( = ?auto_602043 ?auto_602051 ) ) ( not ( = ?auto_602047 ?auto_602049 ) ) ( not ( = ?auto_602047 ?auto_602048 ) ) ( not ( = ?auto_602047 ?auto_602050 ) ) ( not ( = ?auto_602047 ?auto_602051 ) ) ( not ( = ?auto_602049 ?auto_602048 ) ) ( not ( = ?auto_602049 ?auto_602050 ) ) ( not ( = ?auto_602049 ?auto_602051 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_602048 ?auto_602050 ?auto_602051 )
      ( MAKE-8CRATE-VERIFY ?auto_602044 ?auto_602045 ?auto_602046 ?auto_602043 ?auto_602047 ?auto_602049 ?auto_602048 ?auto_602050 ?auto_602051 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_602120 - SURFACE
      ?auto_602121 - SURFACE
      ?auto_602122 - SURFACE
      ?auto_602119 - SURFACE
      ?auto_602123 - SURFACE
      ?auto_602125 - SURFACE
      ?auto_602124 - SURFACE
      ?auto_602126 - SURFACE
      ?auto_602127 - SURFACE
    )
    :vars
    (
      ?auto_602129 - HOIST
      ?auto_602131 - PLACE
      ?auto_602128 - TRUCK
      ?auto_602130 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_602129 ?auto_602131 ) ( SURFACE-AT ?auto_602126 ?auto_602131 ) ( CLEAR ?auto_602126 ) ( IS-CRATE ?auto_602127 ) ( not ( = ?auto_602126 ?auto_602127 ) ) ( AVAILABLE ?auto_602129 ) ( IN ?auto_602127 ?auto_602128 ) ( ON ?auto_602126 ?auto_602124 ) ( not ( = ?auto_602124 ?auto_602126 ) ) ( not ( = ?auto_602124 ?auto_602127 ) ) ( TRUCK-AT ?auto_602128 ?auto_602130 ) ( not ( = ?auto_602130 ?auto_602131 ) ) ( ON ?auto_602121 ?auto_602120 ) ( ON ?auto_602122 ?auto_602121 ) ( ON ?auto_602119 ?auto_602122 ) ( ON ?auto_602123 ?auto_602119 ) ( ON ?auto_602125 ?auto_602123 ) ( ON ?auto_602124 ?auto_602125 ) ( not ( = ?auto_602120 ?auto_602121 ) ) ( not ( = ?auto_602120 ?auto_602122 ) ) ( not ( = ?auto_602120 ?auto_602119 ) ) ( not ( = ?auto_602120 ?auto_602123 ) ) ( not ( = ?auto_602120 ?auto_602125 ) ) ( not ( = ?auto_602120 ?auto_602124 ) ) ( not ( = ?auto_602120 ?auto_602126 ) ) ( not ( = ?auto_602120 ?auto_602127 ) ) ( not ( = ?auto_602121 ?auto_602122 ) ) ( not ( = ?auto_602121 ?auto_602119 ) ) ( not ( = ?auto_602121 ?auto_602123 ) ) ( not ( = ?auto_602121 ?auto_602125 ) ) ( not ( = ?auto_602121 ?auto_602124 ) ) ( not ( = ?auto_602121 ?auto_602126 ) ) ( not ( = ?auto_602121 ?auto_602127 ) ) ( not ( = ?auto_602122 ?auto_602119 ) ) ( not ( = ?auto_602122 ?auto_602123 ) ) ( not ( = ?auto_602122 ?auto_602125 ) ) ( not ( = ?auto_602122 ?auto_602124 ) ) ( not ( = ?auto_602122 ?auto_602126 ) ) ( not ( = ?auto_602122 ?auto_602127 ) ) ( not ( = ?auto_602119 ?auto_602123 ) ) ( not ( = ?auto_602119 ?auto_602125 ) ) ( not ( = ?auto_602119 ?auto_602124 ) ) ( not ( = ?auto_602119 ?auto_602126 ) ) ( not ( = ?auto_602119 ?auto_602127 ) ) ( not ( = ?auto_602123 ?auto_602125 ) ) ( not ( = ?auto_602123 ?auto_602124 ) ) ( not ( = ?auto_602123 ?auto_602126 ) ) ( not ( = ?auto_602123 ?auto_602127 ) ) ( not ( = ?auto_602125 ?auto_602124 ) ) ( not ( = ?auto_602125 ?auto_602126 ) ) ( not ( = ?auto_602125 ?auto_602127 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_602124 ?auto_602126 ?auto_602127 )
      ( MAKE-8CRATE-VERIFY ?auto_602120 ?auto_602121 ?auto_602122 ?auto_602119 ?auto_602123 ?auto_602125 ?auto_602124 ?auto_602126 ?auto_602127 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_602204 - SURFACE
      ?auto_602205 - SURFACE
      ?auto_602206 - SURFACE
      ?auto_602203 - SURFACE
      ?auto_602207 - SURFACE
      ?auto_602209 - SURFACE
      ?auto_602208 - SURFACE
      ?auto_602210 - SURFACE
      ?auto_602211 - SURFACE
    )
    :vars
    (
      ?auto_602213 - HOIST
      ?auto_602214 - PLACE
      ?auto_602215 - TRUCK
      ?auto_602216 - PLACE
      ?auto_602212 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_602213 ?auto_602214 ) ( SURFACE-AT ?auto_602210 ?auto_602214 ) ( CLEAR ?auto_602210 ) ( IS-CRATE ?auto_602211 ) ( not ( = ?auto_602210 ?auto_602211 ) ) ( AVAILABLE ?auto_602213 ) ( ON ?auto_602210 ?auto_602208 ) ( not ( = ?auto_602208 ?auto_602210 ) ) ( not ( = ?auto_602208 ?auto_602211 ) ) ( TRUCK-AT ?auto_602215 ?auto_602216 ) ( not ( = ?auto_602216 ?auto_602214 ) ) ( HOIST-AT ?auto_602212 ?auto_602216 ) ( LIFTING ?auto_602212 ?auto_602211 ) ( not ( = ?auto_602213 ?auto_602212 ) ) ( ON ?auto_602205 ?auto_602204 ) ( ON ?auto_602206 ?auto_602205 ) ( ON ?auto_602203 ?auto_602206 ) ( ON ?auto_602207 ?auto_602203 ) ( ON ?auto_602209 ?auto_602207 ) ( ON ?auto_602208 ?auto_602209 ) ( not ( = ?auto_602204 ?auto_602205 ) ) ( not ( = ?auto_602204 ?auto_602206 ) ) ( not ( = ?auto_602204 ?auto_602203 ) ) ( not ( = ?auto_602204 ?auto_602207 ) ) ( not ( = ?auto_602204 ?auto_602209 ) ) ( not ( = ?auto_602204 ?auto_602208 ) ) ( not ( = ?auto_602204 ?auto_602210 ) ) ( not ( = ?auto_602204 ?auto_602211 ) ) ( not ( = ?auto_602205 ?auto_602206 ) ) ( not ( = ?auto_602205 ?auto_602203 ) ) ( not ( = ?auto_602205 ?auto_602207 ) ) ( not ( = ?auto_602205 ?auto_602209 ) ) ( not ( = ?auto_602205 ?auto_602208 ) ) ( not ( = ?auto_602205 ?auto_602210 ) ) ( not ( = ?auto_602205 ?auto_602211 ) ) ( not ( = ?auto_602206 ?auto_602203 ) ) ( not ( = ?auto_602206 ?auto_602207 ) ) ( not ( = ?auto_602206 ?auto_602209 ) ) ( not ( = ?auto_602206 ?auto_602208 ) ) ( not ( = ?auto_602206 ?auto_602210 ) ) ( not ( = ?auto_602206 ?auto_602211 ) ) ( not ( = ?auto_602203 ?auto_602207 ) ) ( not ( = ?auto_602203 ?auto_602209 ) ) ( not ( = ?auto_602203 ?auto_602208 ) ) ( not ( = ?auto_602203 ?auto_602210 ) ) ( not ( = ?auto_602203 ?auto_602211 ) ) ( not ( = ?auto_602207 ?auto_602209 ) ) ( not ( = ?auto_602207 ?auto_602208 ) ) ( not ( = ?auto_602207 ?auto_602210 ) ) ( not ( = ?auto_602207 ?auto_602211 ) ) ( not ( = ?auto_602209 ?auto_602208 ) ) ( not ( = ?auto_602209 ?auto_602210 ) ) ( not ( = ?auto_602209 ?auto_602211 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_602208 ?auto_602210 ?auto_602211 )
      ( MAKE-8CRATE-VERIFY ?auto_602204 ?auto_602205 ?auto_602206 ?auto_602203 ?auto_602207 ?auto_602209 ?auto_602208 ?auto_602210 ?auto_602211 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_602296 - SURFACE
      ?auto_602297 - SURFACE
      ?auto_602298 - SURFACE
      ?auto_602295 - SURFACE
      ?auto_602299 - SURFACE
      ?auto_602301 - SURFACE
      ?auto_602300 - SURFACE
      ?auto_602302 - SURFACE
      ?auto_602303 - SURFACE
    )
    :vars
    (
      ?auto_602308 - HOIST
      ?auto_602307 - PLACE
      ?auto_602305 - TRUCK
      ?auto_602306 - PLACE
      ?auto_602309 - HOIST
      ?auto_602304 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_602308 ?auto_602307 ) ( SURFACE-AT ?auto_602302 ?auto_602307 ) ( CLEAR ?auto_602302 ) ( IS-CRATE ?auto_602303 ) ( not ( = ?auto_602302 ?auto_602303 ) ) ( AVAILABLE ?auto_602308 ) ( ON ?auto_602302 ?auto_602300 ) ( not ( = ?auto_602300 ?auto_602302 ) ) ( not ( = ?auto_602300 ?auto_602303 ) ) ( TRUCK-AT ?auto_602305 ?auto_602306 ) ( not ( = ?auto_602306 ?auto_602307 ) ) ( HOIST-AT ?auto_602309 ?auto_602306 ) ( not ( = ?auto_602308 ?auto_602309 ) ) ( AVAILABLE ?auto_602309 ) ( SURFACE-AT ?auto_602303 ?auto_602306 ) ( ON ?auto_602303 ?auto_602304 ) ( CLEAR ?auto_602303 ) ( not ( = ?auto_602302 ?auto_602304 ) ) ( not ( = ?auto_602303 ?auto_602304 ) ) ( not ( = ?auto_602300 ?auto_602304 ) ) ( ON ?auto_602297 ?auto_602296 ) ( ON ?auto_602298 ?auto_602297 ) ( ON ?auto_602295 ?auto_602298 ) ( ON ?auto_602299 ?auto_602295 ) ( ON ?auto_602301 ?auto_602299 ) ( ON ?auto_602300 ?auto_602301 ) ( not ( = ?auto_602296 ?auto_602297 ) ) ( not ( = ?auto_602296 ?auto_602298 ) ) ( not ( = ?auto_602296 ?auto_602295 ) ) ( not ( = ?auto_602296 ?auto_602299 ) ) ( not ( = ?auto_602296 ?auto_602301 ) ) ( not ( = ?auto_602296 ?auto_602300 ) ) ( not ( = ?auto_602296 ?auto_602302 ) ) ( not ( = ?auto_602296 ?auto_602303 ) ) ( not ( = ?auto_602296 ?auto_602304 ) ) ( not ( = ?auto_602297 ?auto_602298 ) ) ( not ( = ?auto_602297 ?auto_602295 ) ) ( not ( = ?auto_602297 ?auto_602299 ) ) ( not ( = ?auto_602297 ?auto_602301 ) ) ( not ( = ?auto_602297 ?auto_602300 ) ) ( not ( = ?auto_602297 ?auto_602302 ) ) ( not ( = ?auto_602297 ?auto_602303 ) ) ( not ( = ?auto_602297 ?auto_602304 ) ) ( not ( = ?auto_602298 ?auto_602295 ) ) ( not ( = ?auto_602298 ?auto_602299 ) ) ( not ( = ?auto_602298 ?auto_602301 ) ) ( not ( = ?auto_602298 ?auto_602300 ) ) ( not ( = ?auto_602298 ?auto_602302 ) ) ( not ( = ?auto_602298 ?auto_602303 ) ) ( not ( = ?auto_602298 ?auto_602304 ) ) ( not ( = ?auto_602295 ?auto_602299 ) ) ( not ( = ?auto_602295 ?auto_602301 ) ) ( not ( = ?auto_602295 ?auto_602300 ) ) ( not ( = ?auto_602295 ?auto_602302 ) ) ( not ( = ?auto_602295 ?auto_602303 ) ) ( not ( = ?auto_602295 ?auto_602304 ) ) ( not ( = ?auto_602299 ?auto_602301 ) ) ( not ( = ?auto_602299 ?auto_602300 ) ) ( not ( = ?auto_602299 ?auto_602302 ) ) ( not ( = ?auto_602299 ?auto_602303 ) ) ( not ( = ?auto_602299 ?auto_602304 ) ) ( not ( = ?auto_602301 ?auto_602300 ) ) ( not ( = ?auto_602301 ?auto_602302 ) ) ( not ( = ?auto_602301 ?auto_602303 ) ) ( not ( = ?auto_602301 ?auto_602304 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_602300 ?auto_602302 ?auto_602303 )
      ( MAKE-8CRATE-VERIFY ?auto_602296 ?auto_602297 ?auto_602298 ?auto_602295 ?auto_602299 ?auto_602301 ?auto_602300 ?auto_602302 ?auto_602303 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_602389 - SURFACE
      ?auto_602390 - SURFACE
      ?auto_602391 - SURFACE
      ?auto_602388 - SURFACE
      ?auto_602392 - SURFACE
      ?auto_602394 - SURFACE
      ?auto_602393 - SURFACE
      ?auto_602395 - SURFACE
      ?auto_602396 - SURFACE
    )
    :vars
    (
      ?auto_602398 - HOIST
      ?auto_602400 - PLACE
      ?auto_602399 - PLACE
      ?auto_602402 - HOIST
      ?auto_602401 - SURFACE
      ?auto_602397 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_602398 ?auto_602400 ) ( SURFACE-AT ?auto_602395 ?auto_602400 ) ( CLEAR ?auto_602395 ) ( IS-CRATE ?auto_602396 ) ( not ( = ?auto_602395 ?auto_602396 ) ) ( AVAILABLE ?auto_602398 ) ( ON ?auto_602395 ?auto_602393 ) ( not ( = ?auto_602393 ?auto_602395 ) ) ( not ( = ?auto_602393 ?auto_602396 ) ) ( not ( = ?auto_602399 ?auto_602400 ) ) ( HOIST-AT ?auto_602402 ?auto_602399 ) ( not ( = ?auto_602398 ?auto_602402 ) ) ( AVAILABLE ?auto_602402 ) ( SURFACE-AT ?auto_602396 ?auto_602399 ) ( ON ?auto_602396 ?auto_602401 ) ( CLEAR ?auto_602396 ) ( not ( = ?auto_602395 ?auto_602401 ) ) ( not ( = ?auto_602396 ?auto_602401 ) ) ( not ( = ?auto_602393 ?auto_602401 ) ) ( TRUCK-AT ?auto_602397 ?auto_602400 ) ( ON ?auto_602390 ?auto_602389 ) ( ON ?auto_602391 ?auto_602390 ) ( ON ?auto_602388 ?auto_602391 ) ( ON ?auto_602392 ?auto_602388 ) ( ON ?auto_602394 ?auto_602392 ) ( ON ?auto_602393 ?auto_602394 ) ( not ( = ?auto_602389 ?auto_602390 ) ) ( not ( = ?auto_602389 ?auto_602391 ) ) ( not ( = ?auto_602389 ?auto_602388 ) ) ( not ( = ?auto_602389 ?auto_602392 ) ) ( not ( = ?auto_602389 ?auto_602394 ) ) ( not ( = ?auto_602389 ?auto_602393 ) ) ( not ( = ?auto_602389 ?auto_602395 ) ) ( not ( = ?auto_602389 ?auto_602396 ) ) ( not ( = ?auto_602389 ?auto_602401 ) ) ( not ( = ?auto_602390 ?auto_602391 ) ) ( not ( = ?auto_602390 ?auto_602388 ) ) ( not ( = ?auto_602390 ?auto_602392 ) ) ( not ( = ?auto_602390 ?auto_602394 ) ) ( not ( = ?auto_602390 ?auto_602393 ) ) ( not ( = ?auto_602390 ?auto_602395 ) ) ( not ( = ?auto_602390 ?auto_602396 ) ) ( not ( = ?auto_602390 ?auto_602401 ) ) ( not ( = ?auto_602391 ?auto_602388 ) ) ( not ( = ?auto_602391 ?auto_602392 ) ) ( not ( = ?auto_602391 ?auto_602394 ) ) ( not ( = ?auto_602391 ?auto_602393 ) ) ( not ( = ?auto_602391 ?auto_602395 ) ) ( not ( = ?auto_602391 ?auto_602396 ) ) ( not ( = ?auto_602391 ?auto_602401 ) ) ( not ( = ?auto_602388 ?auto_602392 ) ) ( not ( = ?auto_602388 ?auto_602394 ) ) ( not ( = ?auto_602388 ?auto_602393 ) ) ( not ( = ?auto_602388 ?auto_602395 ) ) ( not ( = ?auto_602388 ?auto_602396 ) ) ( not ( = ?auto_602388 ?auto_602401 ) ) ( not ( = ?auto_602392 ?auto_602394 ) ) ( not ( = ?auto_602392 ?auto_602393 ) ) ( not ( = ?auto_602392 ?auto_602395 ) ) ( not ( = ?auto_602392 ?auto_602396 ) ) ( not ( = ?auto_602392 ?auto_602401 ) ) ( not ( = ?auto_602394 ?auto_602393 ) ) ( not ( = ?auto_602394 ?auto_602395 ) ) ( not ( = ?auto_602394 ?auto_602396 ) ) ( not ( = ?auto_602394 ?auto_602401 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_602393 ?auto_602395 ?auto_602396 )
      ( MAKE-8CRATE-VERIFY ?auto_602389 ?auto_602390 ?auto_602391 ?auto_602388 ?auto_602392 ?auto_602394 ?auto_602393 ?auto_602395 ?auto_602396 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_602482 - SURFACE
      ?auto_602483 - SURFACE
      ?auto_602484 - SURFACE
      ?auto_602481 - SURFACE
      ?auto_602485 - SURFACE
      ?auto_602487 - SURFACE
      ?auto_602486 - SURFACE
      ?auto_602488 - SURFACE
      ?auto_602489 - SURFACE
    )
    :vars
    (
      ?auto_602494 - HOIST
      ?auto_602493 - PLACE
      ?auto_602492 - PLACE
      ?auto_602490 - HOIST
      ?auto_602495 - SURFACE
      ?auto_602491 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_602494 ?auto_602493 ) ( IS-CRATE ?auto_602489 ) ( not ( = ?auto_602488 ?auto_602489 ) ) ( not ( = ?auto_602486 ?auto_602488 ) ) ( not ( = ?auto_602486 ?auto_602489 ) ) ( not ( = ?auto_602492 ?auto_602493 ) ) ( HOIST-AT ?auto_602490 ?auto_602492 ) ( not ( = ?auto_602494 ?auto_602490 ) ) ( AVAILABLE ?auto_602490 ) ( SURFACE-AT ?auto_602489 ?auto_602492 ) ( ON ?auto_602489 ?auto_602495 ) ( CLEAR ?auto_602489 ) ( not ( = ?auto_602488 ?auto_602495 ) ) ( not ( = ?auto_602489 ?auto_602495 ) ) ( not ( = ?auto_602486 ?auto_602495 ) ) ( TRUCK-AT ?auto_602491 ?auto_602493 ) ( SURFACE-AT ?auto_602486 ?auto_602493 ) ( CLEAR ?auto_602486 ) ( LIFTING ?auto_602494 ?auto_602488 ) ( IS-CRATE ?auto_602488 ) ( ON ?auto_602483 ?auto_602482 ) ( ON ?auto_602484 ?auto_602483 ) ( ON ?auto_602481 ?auto_602484 ) ( ON ?auto_602485 ?auto_602481 ) ( ON ?auto_602487 ?auto_602485 ) ( ON ?auto_602486 ?auto_602487 ) ( not ( = ?auto_602482 ?auto_602483 ) ) ( not ( = ?auto_602482 ?auto_602484 ) ) ( not ( = ?auto_602482 ?auto_602481 ) ) ( not ( = ?auto_602482 ?auto_602485 ) ) ( not ( = ?auto_602482 ?auto_602487 ) ) ( not ( = ?auto_602482 ?auto_602486 ) ) ( not ( = ?auto_602482 ?auto_602488 ) ) ( not ( = ?auto_602482 ?auto_602489 ) ) ( not ( = ?auto_602482 ?auto_602495 ) ) ( not ( = ?auto_602483 ?auto_602484 ) ) ( not ( = ?auto_602483 ?auto_602481 ) ) ( not ( = ?auto_602483 ?auto_602485 ) ) ( not ( = ?auto_602483 ?auto_602487 ) ) ( not ( = ?auto_602483 ?auto_602486 ) ) ( not ( = ?auto_602483 ?auto_602488 ) ) ( not ( = ?auto_602483 ?auto_602489 ) ) ( not ( = ?auto_602483 ?auto_602495 ) ) ( not ( = ?auto_602484 ?auto_602481 ) ) ( not ( = ?auto_602484 ?auto_602485 ) ) ( not ( = ?auto_602484 ?auto_602487 ) ) ( not ( = ?auto_602484 ?auto_602486 ) ) ( not ( = ?auto_602484 ?auto_602488 ) ) ( not ( = ?auto_602484 ?auto_602489 ) ) ( not ( = ?auto_602484 ?auto_602495 ) ) ( not ( = ?auto_602481 ?auto_602485 ) ) ( not ( = ?auto_602481 ?auto_602487 ) ) ( not ( = ?auto_602481 ?auto_602486 ) ) ( not ( = ?auto_602481 ?auto_602488 ) ) ( not ( = ?auto_602481 ?auto_602489 ) ) ( not ( = ?auto_602481 ?auto_602495 ) ) ( not ( = ?auto_602485 ?auto_602487 ) ) ( not ( = ?auto_602485 ?auto_602486 ) ) ( not ( = ?auto_602485 ?auto_602488 ) ) ( not ( = ?auto_602485 ?auto_602489 ) ) ( not ( = ?auto_602485 ?auto_602495 ) ) ( not ( = ?auto_602487 ?auto_602486 ) ) ( not ( = ?auto_602487 ?auto_602488 ) ) ( not ( = ?auto_602487 ?auto_602489 ) ) ( not ( = ?auto_602487 ?auto_602495 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_602486 ?auto_602488 ?auto_602489 )
      ( MAKE-8CRATE-VERIFY ?auto_602482 ?auto_602483 ?auto_602484 ?auto_602481 ?auto_602485 ?auto_602487 ?auto_602486 ?auto_602488 ?auto_602489 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_602575 - SURFACE
      ?auto_602576 - SURFACE
      ?auto_602577 - SURFACE
      ?auto_602574 - SURFACE
      ?auto_602578 - SURFACE
      ?auto_602580 - SURFACE
      ?auto_602579 - SURFACE
      ?auto_602581 - SURFACE
      ?auto_602582 - SURFACE
    )
    :vars
    (
      ?auto_602585 - HOIST
      ?auto_602583 - PLACE
      ?auto_602586 - PLACE
      ?auto_602588 - HOIST
      ?auto_602587 - SURFACE
      ?auto_602584 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_602585 ?auto_602583 ) ( IS-CRATE ?auto_602582 ) ( not ( = ?auto_602581 ?auto_602582 ) ) ( not ( = ?auto_602579 ?auto_602581 ) ) ( not ( = ?auto_602579 ?auto_602582 ) ) ( not ( = ?auto_602586 ?auto_602583 ) ) ( HOIST-AT ?auto_602588 ?auto_602586 ) ( not ( = ?auto_602585 ?auto_602588 ) ) ( AVAILABLE ?auto_602588 ) ( SURFACE-AT ?auto_602582 ?auto_602586 ) ( ON ?auto_602582 ?auto_602587 ) ( CLEAR ?auto_602582 ) ( not ( = ?auto_602581 ?auto_602587 ) ) ( not ( = ?auto_602582 ?auto_602587 ) ) ( not ( = ?auto_602579 ?auto_602587 ) ) ( TRUCK-AT ?auto_602584 ?auto_602583 ) ( SURFACE-AT ?auto_602579 ?auto_602583 ) ( CLEAR ?auto_602579 ) ( IS-CRATE ?auto_602581 ) ( AVAILABLE ?auto_602585 ) ( IN ?auto_602581 ?auto_602584 ) ( ON ?auto_602576 ?auto_602575 ) ( ON ?auto_602577 ?auto_602576 ) ( ON ?auto_602574 ?auto_602577 ) ( ON ?auto_602578 ?auto_602574 ) ( ON ?auto_602580 ?auto_602578 ) ( ON ?auto_602579 ?auto_602580 ) ( not ( = ?auto_602575 ?auto_602576 ) ) ( not ( = ?auto_602575 ?auto_602577 ) ) ( not ( = ?auto_602575 ?auto_602574 ) ) ( not ( = ?auto_602575 ?auto_602578 ) ) ( not ( = ?auto_602575 ?auto_602580 ) ) ( not ( = ?auto_602575 ?auto_602579 ) ) ( not ( = ?auto_602575 ?auto_602581 ) ) ( not ( = ?auto_602575 ?auto_602582 ) ) ( not ( = ?auto_602575 ?auto_602587 ) ) ( not ( = ?auto_602576 ?auto_602577 ) ) ( not ( = ?auto_602576 ?auto_602574 ) ) ( not ( = ?auto_602576 ?auto_602578 ) ) ( not ( = ?auto_602576 ?auto_602580 ) ) ( not ( = ?auto_602576 ?auto_602579 ) ) ( not ( = ?auto_602576 ?auto_602581 ) ) ( not ( = ?auto_602576 ?auto_602582 ) ) ( not ( = ?auto_602576 ?auto_602587 ) ) ( not ( = ?auto_602577 ?auto_602574 ) ) ( not ( = ?auto_602577 ?auto_602578 ) ) ( not ( = ?auto_602577 ?auto_602580 ) ) ( not ( = ?auto_602577 ?auto_602579 ) ) ( not ( = ?auto_602577 ?auto_602581 ) ) ( not ( = ?auto_602577 ?auto_602582 ) ) ( not ( = ?auto_602577 ?auto_602587 ) ) ( not ( = ?auto_602574 ?auto_602578 ) ) ( not ( = ?auto_602574 ?auto_602580 ) ) ( not ( = ?auto_602574 ?auto_602579 ) ) ( not ( = ?auto_602574 ?auto_602581 ) ) ( not ( = ?auto_602574 ?auto_602582 ) ) ( not ( = ?auto_602574 ?auto_602587 ) ) ( not ( = ?auto_602578 ?auto_602580 ) ) ( not ( = ?auto_602578 ?auto_602579 ) ) ( not ( = ?auto_602578 ?auto_602581 ) ) ( not ( = ?auto_602578 ?auto_602582 ) ) ( not ( = ?auto_602578 ?auto_602587 ) ) ( not ( = ?auto_602580 ?auto_602579 ) ) ( not ( = ?auto_602580 ?auto_602581 ) ) ( not ( = ?auto_602580 ?auto_602582 ) ) ( not ( = ?auto_602580 ?auto_602587 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_602579 ?auto_602581 ?auto_602582 )
      ( MAKE-8CRATE-VERIFY ?auto_602575 ?auto_602576 ?auto_602577 ?auto_602574 ?auto_602578 ?auto_602580 ?auto_602579 ?auto_602581 ?auto_602582 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_606631 - SURFACE
      ?auto_606632 - SURFACE
      ?auto_606633 - SURFACE
      ?auto_606630 - SURFACE
      ?auto_606634 - SURFACE
      ?auto_606636 - SURFACE
      ?auto_606635 - SURFACE
      ?auto_606637 - SURFACE
      ?auto_606638 - SURFACE
      ?auto_606639 - SURFACE
    )
    :vars
    (
      ?auto_606640 - HOIST
      ?auto_606641 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_606640 ?auto_606641 ) ( SURFACE-AT ?auto_606638 ?auto_606641 ) ( CLEAR ?auto_606638 ) ( LIFTING ?auto_606640 ?auto_606639 ) ( IS-CRATE ?auto_606639 ) ( not ( = ?auto_606638 ?auto_606639 ) ) ( ON ?auto_606632 ?auto_606631 ) ( ON ?auto_606633 ?auto_606632 ) ( ON ?auto_606630 ?auto_606633 ) ( ON ?auto_606634 ?auto_606630 ) ( ON ?auto_606636 ?auto_606634 ) ( ON ?auto_606635 ?auto_606636 ) ( ON ?auto_606637 ?auto_606635 ) ( ON ?auto_606638 ?auto_606637 ) ( not ( = ?auto_606631 ?auto_606632 ) ) ( not ( = ?auto_606631 ?auto_606633 ) ) ( not ( = ?auto_606631 ?auto_606630 ) ) ( not ( = ?auto_606631 ?auto_606634 ) ) ( not ( = ?auto_606631 ?auto_606636 ) ) ( not ( = ?auto_606631 ?auto_606635 ) ) ( not ( = ?auto_606631 ?auto_606637 ) ) ( not ( = ?auto_606631 ?auto_606638 ) ) ( not ( = ?auto_606631 ?auto_606639 ) ) ( not ( = ?auto_606632 ?auto_606633 ) ) ( not ( = ?auto_606632 ?auto_606630 ) ) ( not ( = ?auto_606632 ?auto_606634 ) ) ( not ( = ?auto_606632 ?auto_606636 ) ) ( not ( = ?auto_606632 ?auto_606635 ) ) ( not ( = ?auto_606632 ?auto_606637 ) ) ( not ( = ?auto_606632 ?auto_606638 ) ) ( not ( = ?auto_606632 ?auto_606639 ) ) ( not ( = ?auto_606633 ?auto_606630 ) ) ( not ( = ?auto_606633 ?auto_606634 ) ) ( not ( = ?auto_606633 ?auto_606636 ) ) ( not ( = ?auto_606633 ?auto_606635 ) ) ( not ( = ?auto_606633 ?auto_606637 ) ) ( not ( = ?auto_606633 ?auto_606638 ) ) ( not ( = ?auto_606633 ?auto_606639 ) ) ( not ( = ?auto_606630 ?auto_606634 ) ) ( not ( = ?auto_606630 ?auto_606636 ) ) ( not ( = ?auto_606630 ?auto_606635 ) ) ( not ( = ?auto_606630 ?auto_606637 ) ) ( not ( = ?auto_606630 ?auto_606638 ) ) ( not ( = ?auto_606630 ?auto_606639 ) ) ( not ( = ?auto_606634 ?auto_606636 ) ) ( not ( = ?auto_606634 ?auto_606635 ) ) ( not ( = ?auto_606634 ?auto_606637 ) ) ( not ( = ?auto_606634 ?auto_606638 ) ) ( not ( = ?auto_606634 ?auto_606639 ) ) ( not ( = ?auto_606636 ?auto_606635 ) ) ( not ( = ?auto_606636 ?auto_606637 ) ) ( not ( = ?auto_606636 ?auto_606638 ) ) ( not ( = ?auto_606636 ?auto_606639 ) ) ( not ( = ?auto_606635 ?auto_606637 ) ) ( not ( = ?auto_606635 ?auto_606638 ) ) ( not ( = ?auto_606635 ?auto_606639 ) ) ( not ( = ?auto_606637 ?auto_606638 ) ) ( not ( = ?auto_606637 ?auto_606639 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_606638 ?auto_606639 )
      ( MAKE-9CRATE-VERIFY ?auto_606631 ?auto_606632 ?auto_606633 ?auto_606630 ?auto_606634 ?auto_606636 ?auto_606635 ?auto_606637 ?auto_606638 ?auto_606639 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_606711 - SURFACE
      ?auto_606712 - SURFACE
      ?auto_606713 - SURFACE
      ?auto_606710 - SURFACE
      ?auto_606714 - SURFACE
      ?auto_606716 - SURFACE
      ?auto_606715 - SURFACE
      ?auto_606717 - SURFACE
      ?auto_606718 - SURFACE
      ?auto_606719 - SURFACE
    )
    :vars
    (
      ?auto_606721 - HOIST
      ?auto_606720 - PLACE
      ?auto_606722 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_606721 ?auto_606720 ) ( SURFACE-AT ?auto_606718 ?auto_606720 ) ( CLEAR ?auto_606718 ) ( IS-CRATE ?auto_606719 ) ( not ( = ?auto_606718 ?auto_606719 ) ) ( TRUCK-AT ?auto_606722 ?auto_606720 ) ( AVAILABLE ?auto_606721 ) ( IN ?auto_606719 ?auto_606722 ) ( ON ?auto_606718 ?auto_606717 ) ( not ( = ?auto_606717 ?auto_606718 ) ) ( not ( = ?auto_606717 ?auto_606719 ) ) ( ON ?auto_606712 ?auto_606711 ) ( ON ?auto_606713 ?auto_606712 ) ( ON ?auto_606710 ?auto_606713 ) ( ON ?auto_606714 ?auto_606710 ) ( ON ?auto_606716 ?auto_606714 ) ( ON ?auto_606715 ?auto_606716 ) ( ON ?auto_606717 ?auto_606715 ) ( not ( = ?auto_606711 ?auto_606712 ) ) ( not ( = ?auto_606711 ?auto_606713 ) ) ( not ( = ?auto_606711 ?auto_606710 ) ) ( not ( = ?auto_606711 ?auto_606714 ) ) ( not ( = ?auto_606711 ?auto_606716 ) ) ( not ( = ?auto_606711 ?auto_606715 ) ) ( not ( = ?auto_606711 ?auto_606717 ) ) ( not ( = ?auto_606711 ?auto_606718 ) ) ( not ( = ?auto_606711 ?auto_606719 ) ) ( not ( = ?auto_606712 ?auto_606713 ) ) ( not ( = ?auto_606712 ?auto_606710 ) ) ( not ( = ?auto_606712 ?auto_606714 ) ) ( not ( = ?auto_606712 ?auto_606716 ) ) ( not ( = ?auto_606712 ?auto_606715 ) ) ( not ( = ?auto_606712 ?auto_606717 ) ) ( not ( = ?auto_606712 ?auto_606718 ) ) ( not ( = ?auto_606712 ?auto_606719 ) ) ( not ( = ?auto_606713 ?auto_606710 ) ) ( not ( = ?auto_606713 ?auto_606714 ) ) ( not ( = ?auto_606713 ?auto_606716 ) ) ( not ( = ?auto_606713 ?auto_606715 ) ) ( not ( = ?auto_606713 ?auto_606717 ) ) ( not ( = ?auto_606713 ?auto_606718 ) ) ( not ( = ?auto_606713 ?auto_606719 ) ) ( not ( = ?auto_606710 ?auto_606714 ) ) ( not ( = ?auto_606710 ?auto_606716 ) ) ( not ( = ?auto_606710 ?auto_606715 ) ) ( not ( = ?auto_606710 ?auto_606717 ) ) ( not ( = ?auto_606710 ?auto_606718 ) ) ( not ( = ?auto_606710 ?auto_606719 ) ) ( not ( = ?auto_606714 ?auto_606716 ) ) ( not ( = ?auto_606714 ?auto_606715 ) ) ( not ( = ?auto_606714 ?auto_606717 ) ) ( not ( = ?auto_606714 ?auto_606718 ) ) ( not ( = ?auto_606714 ?auto_606719 ) ) ( not ( = ?auto_606716 ?auto_606715 ) ) ( not ( = ?auto_606716 ?auto_606717 ) ) ( not ( = ?auto_606716 ?auto_606718 ) ) ( not ( = ?auto_606716 ?auto_606719 ) ) ( not ( = ?auto_606715 ?auto_606717 ) ) ( not ( = ?auto_606715 ?auto_606718 ) ) ( not ( = ?auto_606715 ?auto_606719 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_606717 ?auto_606718 ?auto_606719 )
      ( MAKE-9CRATE-VERIFY ?auto_606711 ?auto_606712 ?auto_606713 ?auto_606710 ?auto_606714 ?auto_606716 ?auto_606715 ?auto_606717 ?auto_606718 ?auto_606719 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_606801 - SURFACE
      ?auto_606802 - SURFACE
      ?auto_606803 - SURFACE
      ?auto_606800 - SURFACE
      ?auto_606804 - SURFACE
      ?auto_606806 - SURFACE
      ?auto_606805 - SURFACE
      ?auto_606807 - SURFACE
      ?auto_606808 - SURFACE
      ?auto_606809 - SURFACE
    )
    :vars
    (
      ?auto_606810 - HOIST
      ?auto_606812 - PLACE
      ?auto_606811 - TRUCK
      ?auto_606813 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_606810 ?auto_606812 ) ( SURFACE-AT ?auto_606808 ?auto_606812 ) ( CLEAR ?auto_606808 ) ( IS-CRATE ?auto_606809 ) ( not ( = ?auto_606808 ?auto_606809 ) ) ( AVAILABLE ?auto_606810 ) ( IN ?auto_606809 ?auto_606811 ) ( ON ?auto_606808 ?auto_606807 ) ( not ( = ?auto_606807 ?auto_606808 ) ) ( not ( = ?auto_606807 ?auto_606809 ) ) ( TRUCK-AT ?auto_606811 ?auto_606813 ) ( not ( = ?auto_606813 ?auto_606812 ) ) ( ON ?auto_606802 ?auto_606801 ) ( ON ?auto_606803 ?auto_606802 ) ( ON ?auto_606800 ?auto_606803 ) ( ON ?auto_606804 ?auto_606800 ) ( ON ?auto_606806 ?auto_606804 ) ( ON ?auto_606805 ?auto_606806 ) ( ON ?auto_606807 ?auto_606805 ) ( not ( = ?auto_606801 ?auto_606802 ) ) ( not ( = ?auto_606801 ?auto_606803 ) ) ( not ( = ?auto_606801 ?auto_606800 ) ) ( not ( = ?auto_606801 ?auto_606804 ) ) ( not ( = ?auto_606801 ?auto_606806 ) ) ( not ( = ?auto_606801 ?auto_606805 ) ) ( not ( = ?auto_606801 ?auto_606807 ) ) ( not ( = ?auto_606801 ?auto_606808 ) ) ( not ( = ?auto_606801 ?auto_606809 ) ) ( not ( = ?auto_606802 ?auto_606803 ) ) ( not ( = ?auto_606802 ?auto_606800 ) ) ( not ( = ?auto_606802 ?auto_606804 ) ) ( not ( = ?auto_606802 ?auto_606806 ) ) ( not ( = ?auto_606802 ?auto_606805 ) ) ( not ( = ?auto_606802 ?auto_606807 ) ) ( not ( = ?auto_606802 ?auto_606808 ) ) ( not ( = ?auto_606802 ?auto_606809 ) ) ( not ( = ?auto_606803 ?auto_606800 ) ) ( not ( = ?auto_606803 ?auto_606804 ) ) ( not ( = ?auto_606803 ?auto_606806 ) ) ( not ( = ?auto_606803 ?auto_606805 ) ) ( not ( = ?auto_606803 ?auto_606807 ) ) ( not ( = ?auto_606803 ?auto_606808 ) ) ( not ( = ?auto_606803 ?auto_606809 ) ) ( not ( = ?auto_606800 ?auto_606804 ) ) ( not ( = ?auto_606800 ?auto_606806 ) ) ( not ( = ?auto_606800 ?auto_606805 ) ) ( not ( = ?auto_606800 ?auto_606807 ) ) ( not ( = ?auto_606800 ?auto_606808 ) ) ( not ( = ?auto_606800 ?auto_606809 ) ) ( not ( = ?auto_606804 ?auto_606806 ) ) ( not ( = ?auto_606804 ?auto_606805 ) ) ( not ( = ?auto_606804 ?auto_606807 ) ) ( not ( = ?auto_606804 ?auto_606808 ) ) ( not ( = ?auto_606804 ?auto_606809 ) ) ( not ( = ?auto_606806 ?auto_606805 ) ) ( not ( = ?auto_606806 ?auto_606807 ) ) ( not ( = ?auto_606806 ?auto_606808 ) ) ( not ( = ?auto_606806 ?auto_606809 ) ) ( not ( = ?auto_606805 ?auto_606807 ) ) ( not ( = ?auto_606805 ?auto_606808 ) ) ( not ( = ?auto_606805 ?auto_606809 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_606807 ?auto_606808 ?auto_606809 )
      ( MAKE-9CRATE-VERIFY ?auto_606801 ?auto_606802 ?auto_606803 ?auto_606800 ?auto_606804 ?auto_606806 ?auto_606805 ?auto_606807 ?auto_606808 ?auto_606809 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_606900 - SURFACE
      ?auto_606901 - SURFACE
      ?auto_606902 - SURFACE
      ?auto_606899 - SURFACE
      ?auto_606903 - SURFACE
      ?auto_606905 - SURFACE
      ?auto_606904 - SURFACE
      ?auto_606906 - SURFACE
      ?auto_606907 - SURFACE
      ?auto_606908 - SURFACE
    )
    :vars
    (
      ?auto_606911 - HOIST
      ?auto_606909 - PLACE
      ?auto_606910 - TRUCK
      ?auto_606913 - PLACE
      ?auto_606912 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_606911 ?auto_606909 ) ( SURFACE-AT ?auto_606907 ?auto_606909 ) ( CLEAR ?auto_606907 ) ( IS-CRATE ?auto_606908 ) ( not ( = ?auto_606907 ?auto_606908 ) ) ( AVAILABLE ?auto_606911 ) ( ON ?auto_606907 ?auto_606906 ) ( not ( = ?auto_606906 ?auto_606907 ) ) ( not ( = ?auto_606906 ?auto_606908 ) ) ( TRUCK-AT ?auto_606910 ?auto_606913 ) ( not ( = ?auto_606913 ?auto_606909 ) ) ( HOIST-AT ?auto_606912 ?auto_606913 ) ( LIFTING ?auto_606912 ?auto_606908 ) ( not ( = ?auto_606911 ?auto_606912 ) ) ( ON ?auto_606901 ?auto_606900 ) ( ON ?auto_606902 ?auto_606901 ) ( ON ?auto_606899 ?auto_606902 ) ( ON ?auto_606903 ?auto_606899 ) ( ON ?auto_606905 ?auto_606903 ) ( ON ?auto_606904 ?auto_606905 ) ( ON ?auto_606906 ?auto_606904 ) ( not ( = ?auto_606900 ?auto_606901 ) ) ( not ( = ?auto_606900 ?auto_606902 ) ) ( not ( = ?auto_606900 ?auto_606899 ) ) ( not ( = ?auto_606900 ?auto_606903 ) ) ( not ( = ?auto_606900 ?auto_606905 ) ) ( not ( = ?auto_606900 ?auto_606904 ) ) ( not ( = ?auto_606900 ?auto_606906 ) ) ( not ( = ?auto_606900 ?auto_606907 ) ) ( not ( = ?auto_606900 ?auto_606908 ) ) ( not ( = ?auto_606901 ?auto_606902 ) ) ( not ( = ?auto_606901 ?auto_606899 ) ) ( not ( = ?auto_606901 ?auto_606903 ) ) ( not ( = ?auto_606901 ?auto_606905 ) ) ( not ( = ?auto_606901 ?auto_606904 ) ) ( not ( = ?auto_606901 ?auto_606906 ) ) ( not ( = ?auto_606901 ?auto_606907 ) ) ( not ( = ?auto_606901 ?auto_606908 ) ) ( not ( = ?auto_606902 ?auto_606899 ) ) ( not ( = ?auto_606902 ?auto_606903 ) ) ( not ( = ?auto_606902 ?auto_606905 ) ) ( not ( = ?auto_606902 ?auto_606904 ) ) ( not ( = ?auto_606902 ?auto_606906 ) ) ( not ( = ?auto_606902 ?auto_606907 ) ) ( not ( = ?auto_606902 ?auto_606908 ) ) ( not ( = ?auto_606899 ?auto_606903 ) ) ( not ( = ?auto_606899 ?auto_606905 ) ) ( not ( = ?auto_606899 ?auto_606904 ) ) ( not ( = ?auto_606899 ?auto_606906 ) ) ( not ( = ?auto_606899 ?auto_606907 ) ) ( not ( = ?auto_606899 ?auto_606908 ) ) ( not ( = ?auto_606903 ?auto_606905 ) ) ( not ( = ?auto_606903 ?auto_606904 ) ) ( not ( = ?auto_606903 ?auto_606906 ) ) ( not ( = ?auto_606903 ?auto_606907 ) ) ( not ( = ?auto_606903 ?auto_606908 ) ) ( not ( = ?auto_606905 ?auto_606904 ) ) ( not ( = ?auto_606905 ?auto_606906 ) ) ( not ( = ?auto_606905 ?auto_606907 ) ) ( not ( = ?auto_606905 ?auto_606908 ) ) ( not ( = ?auto_606904 ?auto_606906 ) ) ( not ( = ?auto_606904 ?auto_606907 ) ) ( not ( = ?auto_606904 ?auto_606908 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_606906 ?auto_606907 ?auto_606908 )
      ( MAKE-9CRATE-VERIFY ?auto_606900 ?auto_606901 ?auto_606902 ?auto_606899 ?auto_606903 ?auto_606905 ?auto_606904 ?auto_606906 ?auto_606907 ?auto_606908 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_607008 - SURFACE
      ?auto_607009 - SURFACE
      ?auto_607010 - SURFACE
      ?auto_607007 - SURFACE
      ?auto_607011 - SURFACE
      ?auto_607013 - SURFACE
      ?auto_607012 - SURFACE
      ?auto_607014 - SURFACE
      ?auto_607015 - SURFACE
      ?auto_607016 - SURFACE
    )
    :vars
    (
      ?auto_607020 - HOIST
      ?auto_607017 - PLACE
      ?auto_607018 - TRUCK
      ?auto_607021 - PLACE
      ?auto_607019 - HOIST
      ?auto_607022 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_607020 ?auto_607017 ) ( SURFACE-AT ?auto_607015 ?auto_607017 ) ( CLEAR ?auto_607015 ) ( IS-CRATE ?auto_607016 ) ( not ( = ?auto_607015 ?auto_607016 ) ) ( AVAILABLE ?auto_607020 ) ( ON ?auto_607015 ?auto_607014 ) ( not ( = ?auto_607014 ?auto_607015 ) ) ( not ( = ?auto_607014 ?auto_607016 ) ) ( TRUCK-AT ?auto_607018 ?auto_607021 ) ( not ( = ?auto_607021 ?auto_607017 ) ) ( HOIST-AT ?auto_607019 ?auto_607021 ) ( not ( = ?auto_607020 ?auto_607019 ) ) ( AVAILABLE ?auto_607019 ) ( SURFACE-AT ?auto_607016 ?auto_607021 ) ( ON ?auto_607016 ?auto_607022 ) ( CLEAR ?auto_607016 ) ( not ( = ?auto_607015 ?auto_607022 ) ) ( not ( = ?auto_607016 ?auto_607022 ) ) ( not ( = ?auto_607014 ?auto_607022 ) ) ( ON ?auto_607009 ?auto_607008 ) ( ON ?auto_607010 ?auto_607009 ) ( ON ?auto_607007 ?auto_607010 ) ( ON ?auto_607011 ?auto_607007 ) ( ON ?auto_607013 ?auto_607011 ) ( ON ?auto_607012 ?auto_607013 ) ( ON ?auto_607014 ?auto_607012 ) ( not ( = ?auto_607008 ?auto_607009 ) ) ( not ( = ?auto_607008 ?auto_607010 ) ) ( not ( = ?auto_607008 ?auto_607007 ) ) ( not ( = ?auto_607008 ?auto_607011 ) ) ( not ( = ?auto_607008 ?auto_607013 ) ) ( not ( = ?auto_607008 ?auto_607012 ) ) ( not ( = ?auto_607008 ?auto_607014 ) ) ( not ( = ?auto_607008 ?auto_607015 ) ) ( not ( = ?auto_607008 ?auto_607016 ) ) ( not ( = ?auto_607008 ?auto_607022 ) ) ( not ( = ?auto_607009 ?auto_607010 ) ) ( not ( = ?auto_607009 ?auto_607007 ) ) ( not ( = ?auto_607009 ?auto_607011 ) ) ( not ( = ?auto_607009 ?auto_607013 ) ) ( not ( = ?auto_607009 ?auto_607012 ) ) ( not ( = ?auto_607009 ?auto_607014 ) ) ( not ( = ?auto_607009 ?auto_607015 ) ) ( not ( = ?auto_607009 ?auto_607016 ) ) ( not ( = ?auto_607009 ?auto_607022 ) ) ( not ( = ?auto_607010 ?auto_607007 ) ) ( not ( = ?auto_607010 ?auto_607011 ) ) ( not ( = ?auto_607010 ?auto_607013 ) ) ( not ( = ?auto_607010 ?auto_607012 ) ) ( not ( = ?auto_607010 ?auto_607014 ) ) ( not ( = ?auto_607010 ?auto_607015 ) ) ( not ( = ?auto_607010 ?auto_607016 ) ) ( not ( = ?auto_607010 ?auto_607022 ) ) ( not ( = ?auto_607007 ?auto_607011 ) ) ( not ( = ?auto_607007 ?auto_607013 ) ) ( not ( = ?auto_607007 ?auto_607012 ) ) ( not ( = ?auto_607007 ?auto_607014 ) ) ( not ( = ?auto_607007 ?auto_607015 ) ) ( not ( = ?auto_607007 ?auto_607016 ) ) ( not ( = ?auto_607007 ?auto_607022 ) ) ( not ( = ?auto_607011 ?auto_607013 ) ) ( not ( = ?auto_607011 ?auto_607012 ) ) ( not ( = ?auto_607011 ?auto_607014 ) ) ( not ( = ?auto_607011 ?auto_607015 ) ) ( not ( = ?auto_607011 ?auto_607016 ) ) ( not ( = ?auto_607011 ?auto_607022 ) ) ( not ( = ?auto_607013 ?auto_607012 ) ) ( not ( = ?auto_607013 ?auto_607014 ) ) ( not ( = ?auto_607013 ?auto_607015 ) ) ( not ( = ?auto_607013 ?auto_607016 ) ) ( not ( = ?auto_607013 ?auto_607022 ) ) ( not ( = ?auto_607012 ?auto_607014 ) ) ( not ( = ?auto_607012 ?auto_607015 ) ) ( not ( = ?auto_607012 ?auto_607016 ) ) ( not ( = ?auto_607012 ?auto_607022 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_607014 ?auto_607015 ?auto_607016 )
      ( MAKE-9CRATE-VERIFY ?auto_607008 ?auto_607009 ?auto_607010 ?auto_607007 ?auto_607011 ?auto_607013 ?auto_607012 ?auto_607014 ?auto_607015 ?auto_607016 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_607117 - SURFACE
      ?auto_607118 - SURFACE
      ?auto_607119 - SURFACE
      ?auto_607116 - SURFACE
      ?auto_607120 - SURFACE
      ?auto_607122 - SURFACE
      ?auto_607121 - SURFACE
      ?auto_607123 - SURFACE
      ?auto_607124 - SURFACE
      ?auto_607125 - SURFACE
    )
    :vars
    (
      ?auto_607127 - HOIST
      ?auto_607130 - PLACE
      ?auto_607126 - PLACE
      ?auto_607131 - HOIST
      ?auto_607128 - SURFACE
      ?auto_607129 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_607127 ?auto_607130 ) ( SURFACE-AT ?auto_607124 ?auto_607130 ) ( CLEAR ?auto_607124 ) ( IS-CRATE ?auto_607125 ) ( not ( = ?auto_607124 ?auto_607125 ) ) ( AVAILABLE ?auto_607127 ) ( ON ?auto_607124 ?auto_607123 ) ( not ( = ?auto_607123 ?auto_607124 ) ) ( not ( = ?auto_607123 ?auto_607125 ) ) ( not ( = ?auto_607126 ?auto_607130 ) ) ( HOIST-AT ?auto_607131 ?auto_607126 ) ( not ( = ?auto_607127 ?auto_607131 ) ) ( AVAILABLE ?auto_607131 ) ( SURFACE-AT ?auto_607125 ?auto_607126 ) ( ON ?auto_607125 ?auto_607128 ) ( CLEAR ?auto_607125 ) ( not ( = ?auto_607124 ?auto_607128 ) ) ( not ( = ?auto_607125 ?auto_607128 ) ) ( not ( = ?auto_607123 ?auto_607128 ) ) ( TRUCK-AT ?auto_607129 ?auto_607130 ) ( ON ?auto_607118 ?auto_607117 ) ( ON ?auto_607119 ?auto_607118 ) ( ON ?auto_607116 ?auto_607119 ) ( ON ?auto_607120 ?auto_607116 ) ( ON ?auto_607122 ?auto_607120 ) ( ON ?auto_607121 ?auto_607122 ) ( ON ?auto_607123 ?auto_607121 ) ( not ( = ?auto_607117 ?auto_607118 ) ) ( not ( = ?auto_607117 ?auto_607119 ) ) ( not ( = ?auto_607117 ?auto_607116 ) ) ( not ( = ?auto_607117 ?auto_607120 ) ) ( not ( = ?auto_607117 ?auto_607122 ) ) ( not ( = ?auto_607117 ?auto_607121 ) ) ( not ( = ?auto_607117 ?auto_607123 ) ) ( not ( = ?auto_607117 ?auto_607124 ) ) ( not ( = ?auto_607117 ?auto_607125 ) ) ( not ( = ?auto_607117 ?auto_607128 ) ) ( not ( = ?auto_607118 ?auto_607119 ) ) ( not ( = ?auto_607118 ?auto_607116 ) ) ( not ( = ?auto_607118 ?auto_607120 ) ) ( not ( = ?auto_607118 ?auto_607122 ) ) ( not ( = ?auto_607118 ?auto_607121 ) ) ( not ( = ?auto_607118 ?auto_607123 ) ) ( not ( = ?auto_607118 ?auto_607124 ) ) ( not ( = ?auto_607118 ?auto_607125 ) ) ( not ( = ?auto_607118 ?auto_607128 ) ) ( not ( = ?auto_607119 ?auto_607116 ) ) ( not ( = ?auto_607119 ?auto_607120 ) ) ( not ( = ?auto_607119 ?auto_607122 ) ) ( not ( = ?auto_607119 ?auto_607121 ) ) ( not ( = ?auto_607119 ?auto_607123 ) ) ( not ( = ?auto_607119 ?auto_607124 ) ) ( not ( = ?auto_607119 ?auto_607125 ) ) ( not ( = ?auto_607119 ?auto_607128 ) ) ( not ( = ?auto_607116 ?auto_607120 ) ) ( not ( = ?auto_607116 ?auto_607122 ) ) ( not ( = ?auto_607116 ?auto_607121 ) ) ( not ( = ?auto_607116 ?auto_607123 ) ) ( not ( = ?auto_607116 ?auto_607124 ) ) ( not ( = ?auto_607116 ?auto_607125 ) ) ( not ( = ?auto_607116 ?auto_607128 ) ) ( not ( = ?auto_607120 ?auto_607122 ) ) ( not ( = ?auto_607120 ?auto_607121 ) ) ( not ( = ?auto_607120 ?auto_607123 ) ) ( not ( = ?auto_607120 ?auto_607124 ) ) ( not ( = ?auto_607120 ?auto_607125 ) ) ( not ( = ?auto_607120 ?auto_607128 ) ) ( not ( = ?auto_607122 ?auto_607121 ) ) ( not ( = ?auto_607122 ?auto_607123 ) ) ( not ( = ?auto_607122 ?auto_607124 ) ) ( not ( = ?auto_607122 ?auto_607125 ) ) ( not ( = ?auto_607122 ?auto_607128 ) ) ( not ( = ?auto_607121 ?auto_607123 ) ) ( not ( = ?auto_607121 ?auto_607124 ) ) ( not ( = ?auto_607121 ?auto_607125 ) ) ( not ( = ?auto_607121 ?auto_607128 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_607123 ?auto_607124 ?auto_607125 )
      ( MAKE-9CRATE-VERIFY ?auto_607117 ?auto_607118 ?auto_607119 ?auto_607116 ?auto_607120 ?auto_607122 ?auto_607121 ?auto_607123 ?auto_607124 ?auto_607125 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_607226 - SURFACE
      ?auto_607227 - SURFACE
      ?auto_607228 - SURFACE
      ?auto_607225 - SURFACE
      ?auto_607229 - SURFACE
      ?auto_607231 - SURFACE
      ?auto_607230 - SURFACE
      ?auto_607232 - SURFACE
      ?auto_607233 - SURFACE
      ?auto_607234 - SURFACE
    )
    :vars
    (
      ?auto_607237 - HOIST
      ?auto_607240 - PLACE
      ?auto_607235 - PLACE
      ?auto_607238 - HOIST
      ?auto_607236 - SURFACE
      ?auto_607239 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_607237 ?auto_607240 ) ( IS-CRATE ?auto_607234 ) ( not ( = ?auto_607233 ?auto_607234 ) ) ( not ( = ?auto_607232 ?auto_607233 ) ) ( not ( = ?auto_607232 ?auto_607234 ) ) ( not ( = ?auto_607235 ?auto_607240 ) ) ( HOIST-AT ?auto_607238 ?auto_607235 ) ( not ( = ?auto_607237 ?auto_607238 ) ) ( AVAILABLE ?auto_607238 ) ( SURFACE-AT ?auto_607234 ?auto_607235 ) ( ON ?auto_607234 ?auto_607236 ) ( CLEAR ?auto_607234 ) ( not ( = ?auto_607233 ?auto_607236 ) ) ( not ( = ?auto_607234 ?auto_607236 ) ) ( not ( = ?auto_607232 ?auto_607236 ) ) ( TRUCK-AT ?auto_607239 ?auto_607240 ) ( SURFACE-AT ?auto_607232 ?auto_607240 ) ( CLEAR ?auto_607232 ) ( LIFTING ?auto_607237 ?auto_607233 ) ( IS-CRATE ?auto_607233 ) ( ON ?auto_607227 ?auto_607226 ) ( ON ?auto_607228 ?auto_607227 ) ( ON ?auto_607225 ?auto_607228 ) ( ON ?auto_607229 ?auto_607225 ) ( ON ?auto_607231 ?auto_607229 ) ( ON ?auto_607230 ?auto_607231 ) ( ON ?auto_607232 ?auto_607230 ) ( not ( = ?auto_607226 ?auto_607227 ) ) ( not ( = ?auto_607226 ?auto_607228 ) ) ( not ( = ?auto_607226 ?auto_607225 ) ) ( not ( = ?auto_607226 ?auto_607229 ) ) ( not ( = ?auto_607226 ?auto_607231 ) ) ( not ( = ?auto_607226 ?auto_607230 ) ) ( not ( = ?auto_607226 ?auto_607232 ) ) ( not ( = ?auto_607226 ?auto_607233 ) ) ( not ( = ?auto_607226 ?auto_607234 ) ) ( not ( = ?auto_607226 ?auto_607236 ) ) ( not ( = ?auto_607227 ?auto_607228 ) ) ( not ( = ?auto_607227 ?auto_607225 ) ) ( not ( = ?auto_607227 ?auto_607229 ) ) ( not ( = ?auto_607227 ?auto_607231 ) ) ( not ( = ?auto_607227 ?auto_607230 ) ) ( not ( = ?auto_607227 ?auto_607232 ) ) ( not ( = ?auto_607227 ?auto_607233 ) ) ( not ( = ?auto_607227 ?auto_607234 ) ) ( not ( = ?auto_607227 ?auto_607236 ) ) ( not ( = ?auto_607228 ?auto_607225 ) ) ( not ( = ?auto_607228 ?auto_607229 ) ) ( not ( = ?auto_607228 ?auto_607231 ) ) ( not ( = ?auto_607228 ?auto_607230 ) ) ( not ( = ?auto_607228 ?auto_607232 ) ) ( not ( = ?auto_607228 ?auto_607233 ) ) ( not ( = ?auto_607228 ?auto_607234 ) ) ( not ( = ?auto_607228 ?auto_607236 ) ) ( not ( = ?auto_607225 ?auto_607229 ) ) ( not ( = ?auto_607225 ?auto_607231 ) ) ( not ( = ?auto_607225 ?auto_607230 ) ) ( not ( = ?auto_607225 ?auto_607232 ) ) ( not ( = ?auto_607225 ?auto_607233 ) ) ( not ( = ?auto_607225 ?auto_607234 ) ) ( not ( = ?auto_607225 ?auto_607236 ) ) ( not ( = ?auto_607229 ?auto_607231 ) ) ( not ( = ?auto_607229 ?auto_607230 ) ) ( not ( = ?auto_607229 ?auto_607232 ) ) ( not ( = ?auto_607229 ?auto_607233 ) ) ( not ( = ?auto_607229 ?auto_607234 ) ) ( not ( = ?auto_607229 ?auto_607236 ) ) ( not ( = ?auto_607231 ?auto_607230 ) ) ( not ( = ?auto_607231 ?auto_607232 ) ) ( not ( = ?auto_607231 ?auto_607233 ) ) ( not ( = ?auto_607231 ?auto_607234 ) ) ( not ( = ?auto_607231 ?auto_607236 ) ) ( not ( = ?auto_607230 ?auto_607232 ) ) ( not ( = ?auto_607230 ?auto_607233 ) ) ( not ( = ?auto_607230 ?auto_607234 ) ) ( not ( = ?auto_607230 ?auto_607236 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_607232 ?auto_607233 ?auto_607234 )
      ( MAKE-9CRATE-VERIFY ?auto_607226 ?auto_607227 ?auto_607228 ?auto_607225 ?auto_607229 ?auto_607231 ?auto_607230 ?auto_607232 ?auto_607233 ?auto_607234 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_607335 - SURFACE
      ?auto_607336 - SURFACE
      ?auto_607337 - SURFACE
      ?auto_607334 - SURFACE
      ?auto_607338 - SURFACE
      ?auto_607340 - SURFACE
      ?auto_607339 - SURFACE
      ?auto_607341 - SURFACE
      ?auto_607342 - SURFACE
      ?auto_607343 - SURFACE
    )
    :vars
    (
      ?auto_607344 - HOIST
      ?auto_607347 - PLACE
      ?auto_607348 - PLACE
      ?auto_607345 - HOIST
      ?auto_607346 - SURFACE
      ?auto_607349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_607344 ?auto_607347 ) ( IS-CRATE ?auto_607343 ) ( not ( = ?auto_607342 ?auto_607343 ) ) ( not ( = ?auto_607341 ?auto_607342 ) ) ( not ( = ?auto_607341 ?auto_607343 ) ) ( not ( = ?auto_607348 ?auto_607347 ) ) ( HOIST-AT ?auto_607345 ?auto_607348 ) ( not ( = ?auto_607344 ?auto_607345 ) ) ( AVAILABLE ?auto_607345 ) ( SURFACE-AT ?auto_607343 ?auto_607348 ) ( ON ?auto_607343 ?auto_607346 ) ( CLEAR ?auto_607343 ) ( not ( = ?auto_607342 ?auto_607346 ) ) ( not ( = ?auto_607343 ?auto_607346 ) ) ( not ( = ?auto_607341 ?auto_607346 ) ) ( TRUCK-AT ?auto_607349 ?auto_607347 ) ( SURFACE-AT ?auto_607341 ?auto_607347 ) ( CLEAR ?auto_607341 ) ( IS-CRATE ?auto_607342 ) ( AVAILABLE ?auto_607344 ) ( IN ?auto_607342 ?auto_607349 ) ( ON ?auto_607336 ?auto_607335 ) ( ON ?auto_607337 ?auto_607336 ) ( ON ?auto_607334 ?auto_607337 ) ( ON ?auto_607338 ?auto_607334 ) ( ON ?auto_607340 ?auto_607338 ) ( ON ?auto_607339 ?auto_607340 ) ( ON ?auto_607341 ?auto_607339 ) ( not ( = ?auto_607335 ?auto_607336 ) ) ( not ( = ?auto_607335 ?auto_607337 ) ) ( not ( = ?auto_607335 ?auto_607334 ) ) ( not ( = ?auto_607335 ?auto_607338 ) ) ( not ( = ?auto_607335 ?auto_607340 ) ) ( not ( = ?auto_607335 ?auto_607339 ) ) ( not ( = ?auto_607335 ?auto_607341 ) ) ( not ( = ?auto_607335 ?auto_607342 ) ) ( not ( = ?auto_607335 ?auto_607343 ) ) ( not ( = ?auto_607335 ?auto_607346 ) ) ( not ( = ?auto_607336 ?auto_607337 ) ) ( not ( = ?auto_607336 ?auto_607334 ) ) ( not ( = ?auto_607336 ?auto_607338 ) ) ( not ( = ?auto_607336 ?auto_607340 ) ) ( not ( = ?auto_607336 ?auto_607339 ) ) ( not ( = ?auto_607336 ?auto_607341 ) ) ( not ( = ?auto_607336 ?auto_607342 ) ) ( not ( = ?auto_607336 ?auto_607343 ) ) ( not ( = ?auto_607336 ?auto_607346 ) ) ( not ( = ?auto_607337 ?auto_607334 ) ) ( not ( = ?auto_607337 ?auto_607338 ) ) ( not ( = ?auto_607337 ?auto_607340 ) ) ( not ( = ?auto_607337 ?auto_607339 ) ) ( not ( = ?auto_607337 ?auto_607341 ) ) ( not ( = ?auto_607337 ?auto_607342 ) ) ( not ( = ?auto_607337 ?auto_607343 ) ) ( not ( = ?auto_607337 ?auto_607346 ) ) ( not ( = ?auto_607334 ?auto_607338 ) ) ( not ( = ?auto_607334 ?auto_607340 ) ) ( not ( = ?auto_607334 ?auto_607339 ) ) ( not ( = ?auto_607334 ?auto_607341 ) ) ( not ( = ?auto_607334 ?auto_607342 ) ) ( not ( = ?auto_607334 ?auto_607343 ) ) ( not ( = ?auto_607334 ?auto_607346 ) ) ( not ( = ?auto_607338 ?auto_607340 ) ) ( not ( = ?auto_607338 ?auto_607339 ) ) ( not ( = ?auto_607338 ?auto_607341 ) ) ( not ( = ?auto_607338 ?auto_607342 ) ) ( not ( = ?auto_607338 ?auto_607343 ) ) ( not ( = ?auto_607338 ?auto_607346 ) ) ( not ( = ?auto_607340 ?auto_607339 ) ) ( not ( = ?auto_607340 ?auto_607341 ) ) ( not ( = ?auto_607340 ?auto_607342 ) ) ( not ( = ?auto_607340 ?auto_607343 ) ) ( not ( = ?auto_607340 ?auto_607346 ) ) ( not ( = ?auto_607339 ?auto_607341 ) ) ( not ( = ?auto_607339 ?auto_607342 ) ) ( not ( = ?auto_607339 ?auto_607343 ) ) ( not ( = ?auto_607339 ?auto_607346 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_607341 ?auto_607342 ?auto_607343 )
      ( MAKE-9CRATE-VERIFY ?auto_607335 ?auto_607336 ?auto_607337 ?auto_607334 ?auto_607338 ?auto_607340 ?auto_607339 ?auto_607341 ?auto_607342 ?auto_607343 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_612864 - SURFACE
      ?auto_612865 - SURFACE
      ?auto_612866 - SURFACE
      ?auto_612863 - SURFACE
      ?auto_612867 - SURFACE
      ?auto_612869 - SURFACE
      ?auto_612868 - SURFACE
      ?auto_612870 - SURFACE
      ?auto_612871 - SURFACE
      ?auto_612872 - SURFACE
      ?auto_612873 - SURFACE
    )
    :vars
    (
      ?auto_612874 - HOIST
      ?auto_612875 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_612874 ?auto_612875 ) ( SURFACE-AT ?auto_612872 ?auto_612875 ) ( CLEAR ?auto_612872 ) ( LIFTING ?auto_612874 ?auto_612873 ) ( IS-CRATE ?auto_612873 ) ( not ( = ?auto_612872 ?auto_612873 ) ) ( ON ?auto_612865 ?auto_612864 ) ( ON ?auto_612866 ?auto_612865 ) ( ON ?auto_612863 ?auto_612866 ) ( ON ?auto_612867 ?auto_612863 ) ( ON ?auto_612869 ?auto_612867 ) ( ON ?auto_612868 ?auto_612869 ) ( ON ?auto_612870 ?auto_612868 ) ( ON ?auto_612871 ?auto_612870 ) ( ON ?auto_612872 ?auto_612871 ) ( not ( = ?auto_612864 ?auto_612865 ) ) ( not ( = ?auto_612864 ?auto_612866 ) ) ( not ( = ?auto_612864 ?auto_612863 ) ) ( not ( = ?auto_612864 ?auto_612867 ) ) ( not ( = ?auto_612864 ?auto_612869 ) ) ( not ( = ?auto_612864 ?auto_612868 ) ) ( not ( = ?auto_612864 ?auto_612870 ) ) ( not ( = ?auto_612864 ?auto_612871 ) ) ( not ( = ?auto_612864 ?auto_612872 ) ) ( not ( = ?auto_612864 ?auto_612873 ) ) ( not ( = ?auto_612865 ?auto_612866 ) ) ( not ( = ?auto_612865 ?auto_612863 ) ) ( not ( = ?auto_612865 ?auto_612867 ) ) ( not ( = ?auto_612865 ?auto_612869 ) ) ( not ( = ?auto_612865 ?auto_612868 ) ) ( not ( = ?auto_612865 ?auto_612870 ) ) ( not ( = ?auto_612865 ?auto_612871 ) ) ( not ( = ?auto_612865 ?auto_612872 ) ) ( not ( = ?auto_612865 ?auto_612873 ) ) ( not ( = ?auto_612866 ?auto_612863 ) ) ( not ( = ?auto_612866 ?auto_612867 ) ) ( not ( = ?auto_612866 ?auto_612869 ) ) ( not ( = ?auto_612866 ?auto_612868 ) ) ( not ( = ?auto_612866 ?auto_612870 ) ) ( not ( = ?auto_612866 ?auto_612871 ) ) ( not ( = ?auto_612866 ?auto_612872 ) ) ( not ( = ?auto_612866 ?auto_612873 ) ) ( not ( = ?auto_612863 ?auto_612867 ) ) ( not ( = ?auto_612863 ?auto_612869 ) ) ( not ( = ?auto_612863 ?auto_612868 ) ) ( not ( = ?auto_612863 ?auto_612870 ) ) ( not ( = ?auto_612863 ?auto_612871 ) ) ( not ( = ?auto_612863 ?auto_612872 ) ) ( not ( = ?auto_612863 ?auto_612873 ) ) ( not ( = ?auto_612867 ?auto_612869 ) ) ( not ( = ?auto_612867 ?auto_612868 ) ) ( not ( = ?auto_612867 ?auto_612870 ) ) ( not ( = ?auto_612867 ?auto_612871 ) ) ( not ( = ?auto_612867 ?auto_612872 ) ) ( not ( = ?auto_612867 ?auto_612873 ) ) ( not ( = ?auto_612869 ?auto_612868 ) ) ( not ( = ?auto_612869 ?auto_612870 ) ) ( not ( = ?auto_612869 ?auto_612871 ) ) ( not ( = ?auto_612869 ?auto_612872 ) ) ( not ( = ?auto_612869 ?auto_612873 ) ) ( not ( = ?auto_612868 ?auto_612870 ) ) ( not ( = ?auto_612868 ?auto_612871 ) ) ( not ( = ?auto_612868 ?auto_612872 ) ) ( not ( = ?auto_612868 ?auto_612873 ) ) ( not ( = ?auto_612870 ?auto_612871 ) ) ( not ( = ?auto_612870 ?auto_612872 ) ) ( not ( = ?auto_612870 ?auto_612873 ) ) ( not ( = ?auto_612871 ?auto_612872 ) ) ( not ( = ?auto_612871 ?auto_612873 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_612872 ?auto_612873 )
      ( MAKE-10CRATE-VERIFY ?auto_612864 ?auto_612865 ?auto_612866 ?auto_612863 ?auto_612867 ?auto_612869 ?auto_612868 ?auto_612870 ?auto_612871 ?auto_612872 ?auto_612873 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_612958 - SURFACE
      ?auto_612959 - SURFACE
      ?auto_612960 - SURFACE
      ?auto_612957 - SURFACE
      ?auto_612961 - SURFACE
      ?auto_612963 - SURFACE
      ?auto_612962 - SURFACE
      ?auto_612964 - SURFACE
      ?auto_612965 - SURFACE
      ?auto_612966 - SURFACE
      ?auto_612967 - SURFACE
    )
    :vars
    (
      ?auto_612969 - HOIST
      ?auto_612970 - PLACE
      ?auto_612968 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_612969 ?auto_612970 ) ( SURFACE-AT ?auto_612966 ?auto_612970 ) ( CLEAR ?auto_612966 ) ( IS-CRATE ?auto_612967 ) ( not ( = ?auto_612966 ?auto_612967 ) ) ( TRUCK-AT ?auto_612968 ?auto_612970 ) ( AVAILABLE ?auto_612969 ) ( IN ?auto_612967 ?auto_612968 ) ( ON ?auto_612966 ?auto_612965 ) ( not ( = ?auto_612965 ?auto_612966 ) ) ( not ( = ?auto_612965 ?auto_612967 ) ) ( ON ?auto_612959 ?auto_612958 ) ( ON ?auto_612960 ?auto_612959 ) ( ON ?auto_612957 ?auto_612960 ) ( ON ?auto_612961 ?auto_612957 ) ( ON ?auto_612963 ?auto_612961 ) ( ON ?auto_612962 ?auto_612963 ) ( ON ?auto_612964 ?auto_612962 ) ( ON ?auto_612965 ?auto_612964 ) ( not ( = ?auto_612958 ?auto_612959 ) ) ( not ( = ?auto_612958 ?auto_612960 ) ) ( not ( = ?auto_612958 ?auto_612957 ) ) ( not ( = ?auto_612958 ?auto_612961 ) ) ( not ( = ?auto_612958 ?auto_612963 ) ) ( not ( = ?auto_612958 ?auto_612962 ) ) ( not ( = ?auto_612958 ?auto_612964 ) ) ( not ( = ?auto_612958 ?auto_612965 ) ) ( not ( = ?auto_612958 ?auto_612966 ) ) ( not ( = ?auto_612958 ?auto_612967 ) ) ( not ( = ?auto_612959 ?auto_612960 ) ) ( not ( = ?auto_612959 ?auto_612957 ) ) ( not ( = ?auto_612959 ?auto_612961 ) ) ( not ( = ?auto_612959 ?auto_612963 ) ) ( not ( = ?auto_612959 ?auto_612962 ) ) ( not ( = ?auto_612959 ?auto_612964 ) ) ( not ( = ?auto_612959 ?auto_612965 ) ) ( not ( = ?auto_612959 ?auto_612966 ) ) ( not ( = ?auto_612959 ?auto_612967 ) ) ( not ( = ?auto_612960 ?auto_612957 ) ) ( not ( = ?auto_612960 ?auto_612961 ) ) ( not ( = ?auto_612960 ?auto_612963 ) ) ( not ( = ?auto_612960 ?auto_612962 ) ) ( not ( = ?auto_612960 ?auto_612964 ) ) ( not ( = ?auto_612960 ?auto_612965 ) ) ( not ( = ?auto_612960 ?auto_612966 ) ) ( not ( = ?auto_612960 ?auto_612967 ) ) ( not ( = ?auto_612957 ?auto_612961 ) ) ( not ( = ?auto_612957 ?auto_612963 ) ) ( not ( = ?auto_612957 ?auto_612962 ) ) ( not ( = ?auto_612957 ?auto_612964 ) ) ( not ( = ?auto_612957 ?auto_612965 ) ) ( not ( = ?auto_612957 ?auto_612966 ) ) ( not ( = ?auto_612957 ?auto_612967 ) ) ( not ( = ?auto_612961 ?auto_612963 ) ) ( not ( = ?auto_612961 ?auto_612962 ) ) ( not ( = ?auto_612961 ?auto_612964 ) ) ( not ( = ?auto_612961 ?auto_612965 ) ) ( not ( = ?auto_612961 ?auto_612966 ) ) ( not ( = ?auto_612961 ?auto_612967 ) ) ( not ( = ?auto_612963 ?auto_612962 ) ) ( not ( = ?auto_612963 ?auto_612964 ) ) ( not ( = ?auto_612963 ?auto_612965 ) ) ( not ( = ?auto_612963 ?auto_612966 ) ) ( not ( = ?auto_612963 ?auto_612967 ) ) ( not ( = ?auto_612962 ?auto_612964 ) ) ( not ( = ?auto_612962 ?auto_612965 ) ) ( not ( = ?auto_612962 ?auto_612966 ) ) ( not ( = ?auto_612962 ?auto_612967 ) ) ( not ( = ?auto_612964 ?auto_612965 ) ) ( not ( = ?auto_612964 ?auto_612966 ) ) ( not ( = ?auto_612964 ?auto_612967 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_612965 ?auto_612966 ?auto_612967 )
      ( MAKE-10CRATE-VERIFY ?auto_612958 ?auto_612959 ?auto_612960 ?auto_612957 ?auto_612961 ?auto_612963 ?auto_612962 ?auto_612964 ?auto_612965 ?auto_612966 ?auto_612967 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_613063 - SURFACE
      ?auto_613064 - SURFACE
      ?auto_613065 - SURFACE
      ?auto_613062 - SURFACE
      ?auto_613066 - SURFACE
      ?auto_613068 - SURFACE
      ?auto_613067 - SURFACE
      ?auto_613069 - SURFACE
      ?auto_613070 - SURFACE
      ?auto_613071 - SURFACE
      ?auto_613072 - SURFACE
    )
    :vars
    (
      ?auto_613073 - HOIST
      ?auto_613076 - PLACE
      ?auto_613075 - TRUCK
      ?auto_613074 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_613073 ?auto_613076 ) ( SURFACE-AT ?auto_613071 ?auto_613076 ) ( CLEAR ?auto_613071 ) ( IS-CRATE ?auto_613072 ) ( not ( = ?auto_613071 ?auto_613072 ) ) ( AVAILABLE ?auto_613073 ) ( IN ?auto_613072 ?auto_613075 ) ( ON ?auto_613071 ?auto_613070 ) ( not ( = ?auto_613070 ?auto_613071 ) ) ( not ( = ?auto_613070 ?auto_613072 ) ) ( TRUCK-AT ?auto_613075 ?auto_613074 ) ( not ( = ?auto_613074 ?auto_613076 ) ) ( ON ?auto_613064 ?auto_613063 ) ( ON ?auto_613065 ?auto_613064 ) ( ON ?auto_613062 ?auto_613065 ) ( ON ?auto_613066 ?auto_613062 ) ( ON ?auto_613068 ?auto_613066 ) ( ON ?auto_613067 ?auto_613068 ) ( ON ?auto_613069 ?auto_613067 ) ( ON ?auto_613070 ?auto_613069 ) ( not ( = ?auto_613063 ?auto_613064 ) ) ( not ( = ?auto_613063 ?auto_613065 ) ) ( not ( = ?auto_613063 ?auto_613062 ) ) ( not ( = ?auto_613063 ?auto_613066 ) ) ( not ( = ?auto_613063 ?auto_613068 ) ) ( not ( = ?auto_613063 ?auto_613067 ) ) ( not ( = ?auto_613063 ?auto_613069 ) ) ( not ( = ?auto_613063 ?auto_613070 ) ) ( not ( = ?auto_613063 ?auto_613071 ) ) ( not ( = ?auto_613063 ?auto_613072 ) ) ( not ( = ?auto_613064 ?auto_613065 ) ) ( not ( = ?auto_613064 ?auto_613062 ) ) ( not ( = ?auto_613064 ?auto_613066 ) ) ( not ( = ?auto_613064 ?auto_613068 ) ) ( not ( = ?auto_613064 ?auto_613067 ) ) ( not ( = ?auto_613064 ?auto_613069 ) ) ( not ( = ?auto_613064 ?auto_613070 ) ) ( not ( = ?auto_613064 ?auto_613071 ) ) ( not ( = ?auto_613064 ?auto_613072 ) ) ( not ( = ?auto_613065 ?auto_613062 ) ) ( not ( = ?auto_613065 ?auto_613066 ) ) ( not ( = ?auto_613065 ?auto_613068 ) ) ( not ( = ?auto_613065 ?auto_613067 ) ) ( not ( = ?auto_613065 ?auto_613069 ) ) ( not ( = ?auto_613065 ?auto_613070 ) ) ( not ( = ?auto_613065 ?auto_613071 ) ) ( not ( = ?auto_613065 ?auto_613072 ) ) ( not ( = ?auto_613062 ?auto_613066 ) ) ( not ( = ?auto_613062 ?auto_613068 ) ) ( not ( = ?auto_613062 ?auto_613067 ) ) ( not ( = ?auto_613062 ?auto_613069 ) ) ( not ( = ?auto_613062 ?auto_613070 ) ) ( not ( = ?auto_613062 ?auto_613071 ) ) ( not ( = ?auto_613062 ?auto_613072 ) ) ( not ( = ?auto_613066 ?auto_613068 ) ) ( not ( = ?auto_613066 ?auto_613067 ) ) ( not ( = ?auto_613066 ?auto_613069 ) ) ( not ( = ?auto_613066 ?auto_613070 ) ) ( not ( = ?auto_613066 ?auto_613071 ) ) ( not ( = ?auto_613066 ?auto_613072 ) ) ( not ( = ?auto_613068 ?auto_613067 ) ) ( not ( = ?auto_613068 ?auto_613069 ) ) ( not ( = ?auto_613068 ?auto_613070 ) ) ( not ( = ?auto_613068 ?auto_613071 ) ) ( not ( = ?auto_613068 ?auto_613072 ) ) ( not ( = ?auto_613067 ?auto_613069 ) ) ( not ( = ?auto_613067 ?auto_613070 ) ) ( not ( = ?auto_613067 ?auto_613071 ) ) ( not ( = ?auto_613067 ?auto_613072 ) ) ( not ( = ?auto_613069 ?auto_613070 ) ) ( not ( = ?auto_613069 ?auto_613071 ) ) ( not ( = ?auto_613069 ?auto_613072 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613070 ?auto_613071 ?auto_613072 )
      ( MAKE-10CRATE-VERIFY ?auto_613063 ?auto_613064 ?auto_613065 ?auto_613062 ?auto_613066 ?auto_613068 ?auto_613067 ?auto_613069 ?auto_613070 ?auto_613071 ?auto_613072 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_613178 - SURFACE
      ?auto_613179 - SURFACE
      ?auto_613180 - SURFACE
      ?auto_613177 - SURFACE
      ?auto_613181 - SURFACE
      ?auto_613183 - SURFACE
      ?auto_613182 - SURFACE
      ?auto_613184 - SURFACE
      ?auto_613185 - SURFACE
      ?auto_613186 - SURFACE
      ?auto_613187 - SURFACE
    )
    :vars
    (
      ?auto_613188 - HOIST
      ?auto_613189 - PLACE
      ?auto_613191 - TRUCK
      ?auto_613190 - PLACE
      ?auto_613192 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_613188 ?auto_613189 ) ( SURFACE-AT ?auto_613186 ?auto_613189 ) ( CLEAR ?auto_613186 ) ( IS-CRATE ?auto_613187 ) ( not ( = ?auto_613186 ?auto_613187 ) ) ( AVAILABLE ?auto_613188 ) ( ON ?auto_613186 ?auto_613185 ) ( not ( = ?auto_613185 ?auto_613186 ) ) ( not ( = ?auto_613185 ?auto_613187 ) ) ( TRUCK-AT ?auto_613191 ?auto_613190 ) ( not ( = ?auto_613190 ?auto_613189 ) ) ( HOIST-AT ?auto_613192 ?auto_613190 ) ( LIFTING ?auto_613192 ?auto_613187 ) ( not ( = ?auto_613188 ?auto_613192 ) ) ( ON ?auto_613179 ?auto_613178 ) ( ON ?auto_613180 ?auto_613179 ) ( ON ?auto_613177 ?auto_613180 ) ( ON ?auto_613181 ?auto_613177 ) ( ON ?auto_613183 ?auto_613181 ) ( ON ?auto_613182 ?auto_613183 ) ( ON ?auto_613184 ?auto_613182 ) ( ON ?auto_613185 ?auto_613184 ) ( not ( = ?auto_613178 ?auto_613179 ) ) ( not ( = ?auto_613178 ?auto_613180 ) ) ( not ( = ?auto_613178 ?auto_613177 ) ) ( not ( = ?auto_613178 ?auto_613181 ) ) ( not ( = ?auto_613178 ?auto_613183 ) ) ( not ( = ?auto_613178 ?auto_613182 ) ) ( not ( = ?auto_613178 ?auto_613184 ) ) ( not ( = ?auto_613178 ?auto_613185 ) ) ( not ( = ?auto_613178 ?auto_613186 ) ) ( not ( = ?auto_613178 ?auto_613187 ) ) ( not ( = ?auto_613179 ?auto_613180 ) ) ( not ( = ?auto_613179 ?auto_613177 ) ) ( not ( = ?auto_613179 ?auto_613181 ) ) ( not ( = ?auto_613179 ?auto_613183 ) ) ( not ( = ?auto_613179 ?auto_613182 ) ) ( not ( = ?auto_613179 ?auto_613184 ) ) ( not ( = ?auto_613179 ?auto_613185 ) ) ( not ( = ?auto_613179 ?auto_613186 ) ) ( not ( = ?auto_613179 ?auto_613187 ) ) ( not ( = ?auto_613180 ?auto_613177 ) ) ( not ( = ?auto_613180 ?auto_613181 ) ) ( not ( = ?auto_613180 ?auto_613183 ) ) ( not ( = ?auto_613180 ?auto_613182 ) ) ( not ( = ?auto_613180 ?auto_613184 ) ) ( not ( = ?auto_613180 ?auto_613185 ) ) ( not ( = ?auto_613180 ?auto_613186 ) ) ( not ( = ?auto_613180 ?auto_613187 ) ) ( not ( = ?auto_613177 ?auto_613181 ) ) ( not ( = ?auto_613177 ?auto_613183 ) ) ( not ( = ?auto_613177 ?auto_613182 ) ) ( not ( = ?auto_613177 ?auto_613184 ) ) ( not ( = ?auto_613177 ?auto_613185 ) ) ( not ( = ?auto_613177 ?auto_613186 ) ) ( not ( = ?auto_613177 ?auto_613187 ) ) ( not ( = ?auto_613181 ?auto_613183 ) ) ( not ( = ?auto_613181 ?auto_613182 ) ) ( not ( = ?auto_613181 ?auto_613184 ) ) ( not ( = ?auto_613181 ?auto_613185 ) ) ( not ( = ?auto_613181 ?auto_613186 ) ) ( not ( = ?auto_613181 ?auto_613187 ) ) ( not ( = ?auto_613183 ?auto_613182 ) ) ( not ( = ?auto_613183 ?auto_613184 ) ) ( not ( = ?auto_613183 ?auto_613185 ) ) ( not ( = ?auto_613183 ?auto_613186 ) ) ( not ( = ?auto_613183 ?auto_613187 ) ) ( not ( = ?auto_613182 ?auto_613184 ) ) ( not ( = ?auto_613182 ?auto_613185 ) ) ( not ( = ?auto_613182 ?auto_613186 ) ) ( not ( = ?auto_613182 ?auto_613187 ) ) ( not ( = ?auto_613184 ?auto_613185 ) ) ( not ( = ?auto_613184 ?auto_613186 ) ) ( not ( = ?auto_613184 ?auto_613187 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613185 ?auto_613186 ?auto_613187 )
      ( MAKE-10CRATE-VERIFY ?auto_613178 ?auto_613179 ?auto_613180 ?auto_613177 ?auto_613181 ?auto_613183 ?auto_613182 ?auto_613184 ?auto_613185 ?auto_613186 ?auto_613187 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_613303 - SURFACE
      ?auto_613304 - SURFACE
      ?auto_613305 - SURFACE
      ?auto_613302 - SURFACE
      ?auto_613306 - SURFACE
      ?auto_613308 - SURFACE
      ?auto_613307 - SURFACE
      ?auto_613309 - SURFACE
      ?auto_613310 - SURFACE
      ?auto_613311 - SURFACE
      ?auto_613312 - SURFACE
    )
    :vars
    (
      ?auto_613313 - HOIST
      ?auto_613314 - PLACE
      ?auto_613318 - TRUCK
      ?auto_613317 - PLACE
      ?auto_613316 - HOIST
      ?auto_613315 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_613313 ?auto_613314 ) ( SURFACE-AT ?auto_613311 ?auto_613314 ) ( CLEAR ?auto_613311 ) ( IS-CRATE ?auto_613312 ) ( not ( = ?auto_613311 ?auto_613312 ) ) ( AVAILABLE ?auto_613313 ) ( ON ?auto_613311 ?auto_613310 ) ( not ( = ?auto_613310 ?auto_613311 ) ) ( not ( = ?auto_613310 ?auto_613312 ) ) ( TRUCK-AT ?auto_613318 ?auto_613317 ) ( not ( = ?auto_613317 ?auto_613314 ) ) ( HOIST-AT ?auto_613316 ?auto_613317 ) ( not ( = ?auto_613313 ?auto_613316 ) ) ( AVAILABLE ?auto_613316 ) ( SURFACE-AT ?auto_613312 ?auto_613317 ) ( ON ?auto_613312 ?auto_613315 ) ( CLEAR ?auto_613312 ) ( not ( = ?auto_613311 ?auto_613315 ) ) ( not ( = ?auto_613312 ?auto_613315 ) ) ( not ( = ?auto_613310 ?auto_613315 ) ) ( ON ?auto_613304 ?auto_613303 ) ( ON ?auto_613305 ?auto_613304 ) ( ON ?auto_613302 ?auto_613305 ) ( ON ?auto_613306 ?auto_613302 ) ( ON ?auto_613308 ?auto_613306 ) ( ON ?auto_613307 ?auto_613308 ) ( ON ?auto_613309 ?auto_613307 ) ( ON ?auto_613310 ?auto_613309 ) ( not ( = ?auto_613303 ?auto_613304 ) ) ( not ( = ?auto_613303 ?auto_613305 ) ) ( not ( = ?auto_613303 ?auto_613302 ) ) ( not ( = ?auto_613303 ?auto_613306 ) ) ( not ( = ?auto_613303 ?auto_613308 ) ) ( not ( = ?auto_613303 ?auto_613307 ) ) ( not ( = ?auto_613303 ?auto_613309 ) ) ( not ( = ?auto_613303 ?auto_613310 ) ) ( not ( = ?auto_613303 ?auto_613311 ) ) ( not ( = ?auto_613303 ?auto_613312 ) ) ( not ( = ?auto_613303 ?auto_613315 ) ) ( not ( = ?auto_613304 ?auto_613305 ) ) ( not ( = ?auto_613304 ?auto_613302 ) ) ( not ( = ?auto_613304 ?auto_613306 ) ) ( not ( = ?auto_613304 ?auto_613308 ) ) ( not ( = ?auto_613304 ?auto_613307 ) ) ( not ( = ?auto_613304 ?auto_613309 ) ) ( not ( = ?auto_613304 ?auto_613310 ) ) ( not ( = ?auto_613304 ?auto_613311 ) ) ( not ( = ?auto_613304 ?auto_613312 ) ) ( not ( = ?auto_613304 ?auto_613315 ) ) ( not ( = ?auto_613305 ?auto_613302 ) ) ( not ( = ?auto_613305 ?auto_613306 ) ) ( not ( = ?auto_613305 ?auto_613308 ) ) ( not ( = ?auto_613305 ?auto_613307 ) ) ( not ( = ?auto_613305 ?auto_613309 ) ) ( not ( = ?auto_613305 ?auto_613310 ) ) ( not ( = ?auto_613305 ?auto_613311 ) ) ( not ( = ?auto_613305 ?auto_613312 ) ) ( not ( = ?auto_613305 ?auto_613315 ) ) ( not ( = ?auto_613302 ?auto_613306 ) ) ( not ( = ?auto_613302 ?auto_613308 ) ) ( not ( = ?auto_613302 ?auto_613307 ) ) ( not ( = ?auto_613302 ?auto_613309 ) ) ( not ( = ?auto_613302 ?auto_613310 ) ) ( not ( = ?auto_613302 ?auto_613311 ) ) ( not ( = ?auto_613302 ?auto_613312 ) ) ( not ( = ?auto_613302 ?auto_613315 ) ) ( not ( = ?auto_613306 ?auto_613308 ) ) ( not ( = ?auto_613306 ?auto_613307 ) ) ( not ( = ?auto_613306 ?auto_613309 ) ) ( not ( = ?auto_613306 ?auto_613310 ) ) ( not ( = ?auto_613306 ?auto_613311 ) ) ( not ( = ?auto_613306 ?auto_613312 ) ) ( not ( = ?auto_613306 ?auto_613315 ) ) ( not ( = ?auto_613308 ?auto_613307 ) ) ( not ( = ?auto_613308 ?auto_613309 ) ) ( not ( = ?auto_613308 ?auto_613310 ) ) ( not ( = ?auto_613308 ?auto_613311 ) ) ( not ( = ?auto_613308 ?auto_613312 ) ) ( not ( = ?auto_613308 ?auto_613315 ) ) ( not ( = ?auto_613307 ?auto_613309 ) ) ( not ( = ?auto_613307 ?auto_613310 ) ) ( not ( = ?auto_613307 ?auto_613311 ) ) ( not ( = ?auto_613307 ?auto_613312 ) ) ( not ( = ?auto_613307 ?auto_613315 ) ) ( not ( = ?auto_613309 ?auto_613310 ) ) ( not ( = ?auto_613309 ?auto_613311 ) ) ( not ( = ?auto_613309 ?auto_613312 ) ) ( not ( = ?auto_613309 ?auto_613315 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613310 ?auto_613311 ?auto_613312 )
      ( MAKE-10CRATE-VERIFY ?auto_613303 ?auto_613304 ?auto_613305 ?auto_613302 ?auto_613306 ?auto_613308 ?auto_613307 ?auto_613309 ?auto_613310 ?auto_613311 ?auto_613312 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_613429 - SURFACE
      ?auto_613430 - SURFACE
      ?auto_613431 - SURFACE
      ?auto_613428 - SURFACE
      ?auto_613432 - SURFACE
      ?auto_613434 - SURFACE
      ?auto_613433 - SURFACE
      ?auto_613435 - SURFACE
      ?auto_613436 - SURFACE
      ?auto_613437 - SURFACE
      ?auto_613438 - SURFACE
    )
    :vars
    (
      ?auto_613441 - HOIST
      ?auto_613442 - PLACE
      ?auto_613444 - PLACE
      ?auto_613443 - HOIST
      ?auto_613440 - SURFACE
      ?auto_613439 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613441 ?auto_613442 ) ( SURFACE-AT ?auto_613437 ?auto_613442 ) ( CLEAR ?auto_613437 ) ( IS-CRATE ?auto_613438 ) ( not ( = ?auto_613437 ?auto_613438 ) ) ( AVAILABLE ?auto_613441 ) ( ON ?auto_613437 ?auto_613436 ) ( not ( = ?auto_613436 ?auto_613437 ) ) ( not ( = ?auto_613436 ?auto_613438 ) ) ( not ( = ?auto_613444 ?auto_613442 ) ) ( HOIST-AT ?auto_613443 ?auto_613444 ) ( not ( = ?auto_613441 ?auto_613443 ) ) ( AVAILABLE ?auto_613443 ) ( SURFACE-AT ?auto_613438 ?auto_613444 ) ( ON ?auto_613438 ?auto_613440 ) ( CLEAR ?auto_613438 ) ( not ( = ?auto_613437 ?auto_613440 ) ) ( not ( = ?auto_613438 ?auto_613440 ) ) ( not ( = ?auto_613436 ?auto_613440 ) ) ( TRUCK-AT ?auto_613439 ?auto_613442 ) ( ON ?auto_613430 ?auto_613429 ) ( ON ?auto_613431 ?auto_613430 ) ( ON ?auto_613428 ?auto_613431 ) ( ON ?auto_613432 ?auto_613428 ) ( ON ?auto_613434 ?auto_613432 ) ( ON ?auto_613433 ?auto_613434 ) ( ON ?auto_613435 ?auto_613433 ) ( ON ?auto_613436 ?auto_613435 ) ( not ( = ?auto_613429 ?auto_613430 ) ) ( not ( = ?auto_613429 ?auto_613431 ) ) ( not ( = ?auto_613429 ?auto_613428 ) ) ( not ( = ?auto_613429 ?auto_613432 ) ) ( not ( = ?auto_613429 ?auto_613434 ) ) ( not ( = ?auto_613429 ?auto_613433 ) ) ( not ( = ?auto_613429 ?auto_613435 ) ) ( not ( = ?auto_613429 ?auto_613436 ) ) ( not ( = ?auto_613429 ?auto_613437 ) ) ( not ( = ?auto_613429 ?auto_613438 ) ) ( not ( = ?auto_613429 ?auto_613440 ) ) ( not ( = ?auto_613430 ?auto_613431 ) ) ( not ( = ?auto_613430 ?auto_613428 ) ) ( not ( = ?auto_613430 ?auto_613432 ) ) ( not ( = ?auto_613430 ?auto_613434 ) ) ( not ( = ?auto_613430 ?auto_613433 ) ) ( not ( = ?auto_613430 ?auto_613435 ) ) ( not ( = ?auto_613430 ?auto_613436 ) ) ( not ( = ?auto_613430 ?auto_613437 ) ) ( not ( = ?auto_613430 ?auto_613438 ) ) ( not ( = ?auto_613430 ?auto_613440 ) ) ( not ( = ?auto_613431 ?auto_613428 ) ) ( not ( = ?auto_613431 ?auto_613432 ) ) ( not ( = ?auto_613431 ?auto_613434 ) ) ( not ( = ?auto_613431 ?auto_613433 ) ) ( not ( = ?auto_613431 ?auto_613435 ) ) ( not ( = ?auto_613431 ?auto_613436 ) ) ( not ( = ?auto_613431 ?auto_613437 ) ) ( not ( = ?auto_613431 ?auto_613438 ) ) ( not ( = ?auto_613431 ?auto_613440 ) ) ( not ( = ?auto_613428 ?auto_613432 ) ) ( not ( = ?auto_613428 ?auto_613434 ) ) ( not ( = ?auto_613428 ?auto_613433 ) ) ( not ( = ?auto_613428 ?auto_613435 ) ) ( not ( = ?auto_613428 ?auto_613436 ) ) ( not ( = ?auto_613428 ?auto_613437 ) ) ( not ( = ?auto_613428 ?auto_613438 ) ) ( not ( = ?auto_613428 ?auto_613440 ) ) ( not ( = ?auto_613432 ?auto_613434 ) ) ( not ( = ?auto_613432 ?auto_613433 ) ) ( not ( = ?auto_613432 ?auto_613435 ) ) ( not ( = ?auto_613432 ?auto_613436 ) ) ( not ( = ?auto_613432 ?auto_613437 ) ) ( not ( = ?auto_613432 ?auto_613438 ) ) ( not ( = ?auto_613432 ?auto_613440 ) ) ( not ( = ?auto_613434 ?auto_613433 ) ) ( not ( = ?auto_613434 ?auto_613435 ) ) ( not ( = ?auto_613434 ?auto_613436 ) ) ( not ( = ?auto_613434 ?auto_613437 ) ) ( not ( = ?auto_613434 ?auto_613438 ) ) ( not ( = ?auto_613434 ?auto_613440 ) ) ( not ( = ?auto_613433 ?auto_613435 ) ) ( not ( = ?auto_613433 ?auto_613436 ) ) ( not ( = ?auto_613433 ?auto_613437 ) ) ( not ( = ?auto_613433 ?auto_613438 ) ) ( not ( = ?auto_613433 ?auto_613440 ) ) ( not ( = ?auto_613435 ?auto_613436 ) ) ( not ( = ?auto_613435 ?auto_613437 ) ) ( not ( = ?auto_613435 ?auto_613438 ) ) ( not ( = ?auto_613435 ?auto_613440 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613436 ?auto_613437 ?auto_613438 )
      ( MAKE-10CRATE-VERIFY ?auto_613429 ?auto_613430 ?auto_613431 ?auto_613428 ?auto_613432 ?auto_613434 ?auto_613433 ?auto_613435 ?auto_613436 ?auto_613437 ?auto_613438 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_613555 - SURFACE
      ?auto_613556 - SURFACE
      ?auto_613557 - SURFACE
      ?auto_613554 - SURFACE
      ?auto_613558 - SURFACE
      ?auto_613560 - SURFACE
      ?auto_613559 - SURFACE
      ?auto_613561 - SURFACE
      ?auto_613562 - SURFACE
      ?auto_613563 - SURFACE
      ?auto_613564 - SURFACE
    )
    :vars
    (
      ?auto_613570 - HOIST
      ?auto_613567 - PLACE
      ?auto_613565 - PLACE
      ?auto_613566 - HOIST
      ?auto_613568 - SURFACE
      ?auto_613569 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613570 ?auto_613567 ) ( IS-CRATE ?auto_613564 ) ( not ( = ?auto_613563 ?auto_613564 ) ) ( not ( = ?auto_613562 ?auto_613563 ) ) ( not ( = ?auto_613562 ?auto_613564 ) ) ( not ( = ?auto_613565 ?auto_613567 ) ) ( HOIST-AT ?auto_613566 ?auto_613565 ) ( not ( = ?auto_613570 ?auto_613566 ) ) ( AVAILABLE ?auto_613566 ) ( SURFACE-AT ?auto_613564 ?auto_613565 ) ( ON ?auto_613564 ?auto_613568 ) ( CLEAR ?auto_613564 ) ( not ( = ?auto_613563 ?auto_613568 ) ) ( not ( = ?auto_613564 ?auto_613568 ) ) ( not ( = ?auto_613562 ?auto_613568 ) ) ( TRUCK-AT ?auto_613569 ?auto_613567 ) ( SURFACE-AT ?auto_613562 ?auto_613567 ) ( CLEAR ?auto_613562 ) ( LIFTING ?auto_613570 ?auto_613563 ) ( IS-CRATE ?auto_613563 ) ( ON ?auto_613556 ?auto_613555 ) ( ON ?auto_613557 ?auto_613556 ) ( ON ?auto_613554 ?auto_613557 ) ( ON ?auto_613558 ?auto_613554 ) ( ON ?auto_613560 ?auto_613558 ) ( ON ?auto_613559 ?auto_613560 ) ( ON ?auto_613561 ?auto_613559 ) ( ON ?auto_613562 ?auto_613561 ) ( not ( = ?auto_613555 ?auto_613556 ) ) ( not ( = ?auto_613555 ?auto_613557 ) ) ( not ( = ?auto_613555 ?auto_613554 ) ) ( not ( = ?auto_613555 ?auto_613558 ) ) ( not ( = ?auto_613555 ?auto_613560 ) ) ( not ( = ?auto_613555 ?auto_613559 ) ) ( not ( = ?auto_613555 ?auto_613561 ) ) ( not ( = ?auto_613555 ?auto_613562 ) ) ( not ( = ?auto_613555 ?auto_613563 ) ) ( not ( = ?auto_613555 ?auto_613564 ) ) ( not ( = ?auto_613555 ?auto_613568 ) ) ( not ( = ?auto_613556 ?auto_613557 ) ) ( not ( = ?auto_613556 ?auto_613554 ) ) ( not ( = ?auto_613556 ?auto_613558 ) ) ( not ( = ?auto_613556 ?auto_613560 ) ) ( not ( = ?auto_613556 ?auto_613559 ) ) ( not ( = ?auto_613556 ?auto_613561 ) ) ( not ( = ?auto_613556 ?auto_613562 ) ) ( not ( = ?auto_613556 ?auto_613563 ) ) ( not ( = ?auto_613556 ?auto_613564 ) ) ( not ( = ?auto_613556 ?auto_613568 ) ) ( not ( = ?auto_613557 ?auto_613554 ) ) ( not ( = ?auto_613557 ?auto_613558 ) ) ( not ( = ?auto_613557 ?auto_613560 ) ) ( not ( = ?auto_613557 ?auto_613559 ) ) ( not ( = ?auto_613557 ?auto_613561 ) ) ( not ( = ?auto_613557 ?auto_613562 ) ) ( not ( = ?auto_613557 ?auto_613563 ) ) ( not ( = ?auto_613557 ?auto_613564 ) ) ( not ( = ?auto_613557 ?auto_613568 ) ) ( not ( = ?auto_613554 ?auto_613558 ) ) ( not ( = ?auto_613554 ?auto_613560 ) ) ( not ( = ?auto_613554 ?auto_613559 ) ) ( not ( = ?auto_613554 ?auto_613561 ) ) ( not ( = ?auto_613554 ?auto_613562 ) ) ( not ( = ?auto_613554 ?auto_613563 ) ) ( not ( = ?auto_613554 ?auto_613564 ) ) ( not ( = ?auto_613554 ?auto_613568 ) ) ( not ( = ?auto_613558 ?auto_613560 ) ) ( not ( = ?auto_613558 ?auto_613559 ) ) ( not ( = ?auto_613558 ?auto_613561 ) ) ( not ( = ?auto_613558 ?auto_613562 ) ) ( not ( = ?auto_613558 ?auto_613563 ) ) ( not ( = ?auto_613558 ?auto_613564 ) ) ( not ( = ?auto_613558 ?auto_613568 ) ) ( not ( = ?auto_613560 ?auto_613559 ) ) ( not ( = ?auto_613560 ?auto_613561 ) ) ( not ( = ?auto_613560 ?auto_613562 ) ) ( not ( = ?auto_613560 ?auto_613563 ) ) ( not ( = ?auto_613560 ?auto_613564 ) ) ( not ( = ?auto_613560 ?auto_613568 ) ) ( not ( = ?auto_613559 ?auto_613561 ) ) ( not ( = ?auto_613559 ?auto_613562 ) ) ( not ( = ?auto_613559 ?auto_613563 ) ) ( not ( = ?auto_613559 ?auto_613564 ) ) ( not ( = ?auto_613559 ?auto_613568 ) ) ( not ( = ?auto_613561 ?auto_613562 ) ) ( not ( = ?auto_613561 ?auto_613563 ) ) ( not ( = ?auto_613561 ?auto_613564 ) ) ( not ( = ?auto_613561 ?auto_613568 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613562 ?auto_613563 ?auto_613564 )
      ( MAKE-10CRATE-VERIFY ?auto_613555 ?auto_613556 ?auto_613557 ?auto_613554 ?auto_613558 ?auto_613560 ?auto_613559 ?auto_613561 ?auto_613562 ?auto_613563 ?auto_613564 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_613681 - SURFACE
      ?auto_613682 - SURFACE
      ?auto_613683 - SURFACE
      ?auto_613680 - SURFACE
      ?auto_613684 - SURFACE
      ?auto_613686 - SURFACE
      ?auto_613685 - SURFACE
      ?auto_613687 - SURFACE
      ?auto_613688 - SURFACE
      ?auto_613689 - SURFACE
      ?auto_613690 - SURFACE
    )
    :vars
    (
      ?auto_613694 - HOIST
      ?auto_613692 - PLACE
      ?auto_613693 - PLACE
      ?auto_613696 - HOIST
      ?auto_613695 - SURFACE
      ?auto_613691 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613694 ?auto_613692 ) ( IS-CRATE ?auto_613690 ) ( not ( = ?auto_613689 ?auto_613690 ) ) ( not ( = ?auto_613688 ?auto_613689 ) ) ( not ( = ?auto_613688 ?auto_613690 ) ) ( not ( = ?auto_613693 ?auto_613692 ) ) ( HOIST-AT ?auto_613696 ?auto_613693 ) ( not ( = ?auto_613694 ?auto_613696 ) ) ( AVAILABLE ?auto_613696 ) ( SURFACE-AT ?auto_613690 ?auto_613693 ) ( ON ?auto_613690 ?auto_613695 ) ( CLEAR ?auto_613690 ) ( not ( = ?auto_613689 ?auto_613695 ) ) ( not ( = ?auto_613690 ?auto_613695 ) ) ( not ( = ?auto_613688 ?auto_613695 ) ) ( TRUCK-AT ?auto_613691 ?auto_613692 ) ( SURFACE-AT ?auto_613688 ?auto_613692 ) ( CLEAR ?auto_613688 ) ( IS-CRATE ?auto_613689 ) ( AVAILABLE ?auto_613694 ) ( IN ?auto_613689 ?auto_613691 ) ( ON ?auto_613682 ?auto_613681 ) ( ON ?auto_613683 ?auto_613682 ) ( ON ?auto_613680 ?auto_613683 ) ( ON ?auto_613684 ?auto_613680 ) ( ON ?auto_613686 ?auto_613684 ) ( ON ?auto_613685 ?auto_613686 ) ( ON ?auto_613687 ?auto_613685 ) ( ON ?auto_613688 ?auto_613687 ) ( not ( = ?auto_613681 ?auto_613682 ) ) ( not ( = ?auto_613681 ?auto_613683 ) ) ( not ( = ?auto_613681 ?auto_613680 ) ) ( not ( = ?auto_613681 ?auto_613684 ) ) ( not ( = ?auto_613681 ?auto_613686 ) ) ( not ( = ?auto_613681 ?auto_613685 ) ) ( not ( = ?auto_613681 ?auto_613687 ) ) ( not ( = ?auto_613681 ?auto_613688 ) ) ( not ( = ?auto_613681 ?auto_613689 ) ) ( not ( = ?auto_613681 ?auto_613690 ) ) ( not ( = ?auto_613681 ?auto_613695 ) ) ( not ( = ?auto_613682 ?auto_613683 ) ) ( not ( = ?auto_613682 ?auto_613680 ) ) ( not ( = ?auto_613682 ?auto_613684 ) ) ( not ( = ?auto_613682 ?auto_613686 ) ) ( not ( = ?auto_613682 ?auto_613685 ) ) ( not ( = ?auto_613682 ?auto_613687 ) ) ( not ( = ?auto_613682 ?auto_613688 ) ) ( not ( = ?auto_613682 ?auto_613689 ) ) ( not ( = ?auto_613682 ?auto_613690 ) ) ( not ( = ?auto_613682 ?auto_613695 ) ) ( not ( = ?auto_613683 ?auto_613680 ) ) ( not ( = ?auto_613683 ?auto_613684 ) ) ( not ( = ?auto_613683 ?auto_613686 ) ) ( not ( = ?auto_613683 ?auto_613685 ) ) ( not ( = ?auto_613683 ?auto_613687 ) ) ( not ( = ?auto_613683 ?auto_613688 ) ) ( not ( = ?auto_613683 ?auto_613689 ) ) ( not ( = ?auto_613683 ?auto_613690 ) ) ( not ( = ?auto_613683 ?auto_613695 ) ) ( not ( = ?auto_613680 ?auto_613684 ) ) ( not ( = ?auto_613680 ?auto_613686 ) ) ( not ( = ?auto_613680 ?auto_613685 ) ) ( not ( = ?auto_613680 ?auto_613687 ) ) ( not ( = ?auto_613680 ?auto_613688 ) ) ( not ( = ?auto_613680 ?auto_613689 ) ) ( not ( = ?auto_613680 ?auto_613690 ) ) ( not ( = ?auto_613680 ?auto_613695 ) ) ( not ( = ?auto_613684 ?auto_613686 ) ) ( not ( = ?auto_613684 ?auto_613685 ) ) ( not ( = ?auto_613684 ?auto_613687 ) ) ( not ( = ?auto_613684 ?auto_613688 ) ) ( not ( = ?auto_613684 ?auto_613689 ) ) ( not ( = ?auto_613684 ?auto_613690 ) ) ( not ( = ?auto_613684 ?auto_613695 ) ) ( not ( = ?auto_613686 ?auto_613685 ) ) ( not ( = ?auto_613686 ?auto_613687 ) ) ( not ( = ?auto_613686 ?auto_613688 ) ) ( not ( = ?auto_613686 ?auto_613689 ) ) ( not ( = ?auto_613686 ?auto_613690 ) ) ( not ( = ?auto_613686 ?auto_613695 ) ) ( not ( = ?auto_613685 ?auto_613687 ) ) ( not ( = ?auto_613685 ?auto_613688 ) ) ( not ( = ?auto_613685 ?auto_613689 ) ) ( not ( = ?auto_613685 ?auto_613690 ) ) ( not ( = ?auto_613685 ?auto_613695 ) ) ( not ( = ?auto_613687 ?auto_613688 ) ) ( not ( = ?auto_613687 ?auto_613689 ) ) ( not ( = ?auto_613687 ?auto_613690 ) ) ( not ( = ?auto_613687 ?auto_613695 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613688 ?auto_613689 ?auto_613690 )
      ( MAKE-10CRATE-VERIFY ?auto_613681 ?auto_613682 ?auto_613683 ?auto_613680 ?auto_613684 ?auto_613686 ?auto_613685 ?auto_613687 ?auto_613688 ?auto_613689 ?auto_613690 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_620857 - SURFACE
      ?auto_620858 - SURFACE
      ?auto_620859 - SURFACE
      ?auto_620856 - SURFACE
      ?auto_620860 - SURFACE
      ?auto_620862 - SURFACE
      ?auto_620861 - SURFACE
      ?auto_620863 - SURFACE
      ?auto_620864 - SURFACE
      ?auto_620865 - SURFACE
      ?auto_620866 - SURFACE
      ?auto_620867 - SURFACE
    )
    :vars
    (
      ?auto_620869 - HOIST
      ?auto_620868 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_620869 ?auto_620868 ) ( SURFACE-AT ?auto_620866 ?auto_620868 ) ( CLEAR ?auto_620866 ) ( LIFTING ?auto_620869 ?auto_620867 ) ( IS-CRATE ?auto_620867 ) ( not ( = ?auto_620866 ?auto_620867 ) ) ( ON ?auto_620858 ?auto_620857 ) ( ON ?auto_620859 ?auto_620858 ) ( ON ?auto_620856 ?auto_620859 ) ( ON ?auto_620860 ?auto_620856 ) ( ON ?auto_620862 ?auto_620860 ) ( ON ?auto_620861 ?auto_620862 ) ( ON ?auto_620863 ?auto_620861 ) ( ON ?auto_620864 ?auto_620863 ) ( ON ?auto_620865 ?auto_620864 ) ( ON ?auto_620866 ?auto_620865 ) ( not ( = ?auto_620857 ?auto_620858 ) ) ( not ( = ?auto_620857 ?auto_620859 ) ) ( not ( = ?auto_620857 ?auto_620856 ) ) ( not ( = ?auto_620857 ?auto_620860 ) ) ( not ( = ?auto_620857 ?auto_620862 ) ) ( not ( = ?auto_620857 ?auto_620861 ) ) ( not ( = ?auto_620857 ?auto_620863 ) ) ( not ( = ?auto_620857 ?auto_620864 ) ) ( not ( = ?auto_620857 ?auto_620865 ) ) ( not ( = ?auto_620857 ?auto_620866 ) ) ( not ( = ?auto_620857 ?auto_620867 ) ) ( not ( = ?auto_620858 ?auto_620859 ) ) ( not ( = ?auto_620858 ?auto_620856 ) ) ( not ( = ?auto_620858 ?auto_620860 ) ) ( not ( = ?auto_620858 ?auto_620862 ) ) ( not ( = ?auto_620858 ?auto_620861 ) ) ( not ( = ?auto_620858 ?auto_620863 ) ) ( not ( = ?auto_620858 ?auto_620864 ) ) ( not ( = ?auto_620858 ?auto_620865 ) ) ( not ( = ?auto_620858 ?auto_620866 ) ) ( not ( = ?auto_620858 ?auto_620867 ) ) ( not ( = ?auto_620859 ?auto_620856 ) ) ( not ( = ?auto_620859 ?auto_620860 ) ) ( not ( = ?auto_620859 ?auto_620862 ) ) ( not ( = ?auto_620859 ?auto_620861 ) ) ( not ( = ?auto_620859 ?auto_620863 ) ) ( not ( = ?auto_620859 ?auto_620864 ) ) ( not ( = ?auto_620859 ?auto_620865 ) ) ( not ( = ?auto_620859 ?auto_620866 ) ) ( not ( = ?auto_620859 ?auto_620867 ) ) ( not ( = ?auto_620856 ?auto_620860 ) ) ( not ( = ?auto_620856 ?auto_620862 ) ) ( not ( = ?auto_620856 ?auto_620861 ) ) ( not ( = ?auto_620856 ?auto_620863 ) ) ( not ( = ?auto_620856 ?auto_620864 ) ) ( not ( = ?auto_620856 ?auto_620865 ) ) ( not ( = ?auto_620856 ?auto_620866 ) ) ( not ( = ?auto_620856 ?auto_620867 ) ) ( not ( = ?auto_620860 ?auto_620862 ) ) ( not ( = ?auto_620860 ?auto_620861 ) ) ( not ( = ?auto_620860 ?auto_620863 ) ) ( not ( = ?auto_620860 ?auto_620864 ) ) ( not ( = ?auto_620860 ?auto_620865 ) ) ( not ( = ?auto_620860 ?auto_620866 ) ) ( not ( = ?auto_620860 ?auto_620867 ) ) ( not ( = ?auto_620862 ?auto_620861 ) ) ( not ( = ?auto_620862 ?auto_620863 ) ) ( not ( = ?auto_620862 ?auto_620864 ) ) ( not ( = ?auto_620862 ?auto_620865 ) ) ( not ( = ?auto_620862 ?auto_620866 ) ) ( not ( = ?auto_620862 ?auto_620867 ) ) ( not ( = ?auto_620861 ?auto_620863 ) ) ( not ( = ?auto_620861 ?auto_620864 ) ) ( not ( = ?auto_620861 ?auto_620865 ) ) ( not ( = ?auto_620861 ?auto_620866 ) ) ( not ( = ?auto_620861 ?auto_620867 ) ) ( not ( = ?auto_620863 ?auto_620864 ) ) ( not ( = ?auto_620863 ?auto_620865 ) ) ( not ( = ?auto_620863 ?auto_620866 ) ) ( not ( = ?auto_620863 ?auto_620867 ) ) ( not ( = ?auto_620864 ?auto_620865 ) ) ( not ( = ?auto_620864 ?auto_620866 ) ) ( not ( = ?auto_620864 ?auto_620867 ) ) ( not ( = ?auto_620865 ?auto_620866 ) ) ( not ( = ?auto_620865 ?auto_620867 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_620866 ?auto_620867 )
      ( MAKE-11CRATE-VERIFY ?auto_620857 ?auto_620858 ?auto_620859 ?auto_620856 ?auto_620860 ?auto_620862 ?auto_620861 ?auto_620863 ?auto_620864 ?auto_620865 ?auto_620866 ?auto_620867 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_620966 - SURFACE
      ?auto_620967 - SURFACE
      ?auto_620968 - SURFACE
      ?auto_620965 - SURFACE
      ?auto_620969 - SURFACE
      ?auto_620971 - SURFACE
      ?auto_620970 - SURFACE
      ?auto_620972 - SURFACE
      ?auto_620973 - SURFACE
      ?auto_620974 - SURFACE
      ?auto_620975 - SURFACE
      ?auto_620976 - SURFACE
    )
    :vars
    (
      ?auto_620977 - HOIST
      ?auto_620979 - PLACE
      ?auto_620978 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_620977 ?auto_620979 ) ( SURFACE-AT ?auto_620975 ?auto_620979 ) ( CLEAR ?auto_620975 ) ( IS-CRATE ?auto_620976 ) ( not ( = ?auto_620975 ?auto_620976 ) ) ( TRUCK-AT ?auto_620978 ?auto_620979 ) ( AVAILABLE ?auto_620977 ) ( IN ?auto_620976 ?auto_620978 ) ( ON ?auto_620975 ?auto_620974 ) ( not ( = ?auto_620974 ?auto_620975 ) ) ( not ( = ?auto_620974 ?auto_620976 ) ) ( ON ?auto_620967 ?auto_620966 ) ( ON ?auto_620968 ?auto_620967 ) ( ON ?auto_620965 ?auto_620968 ) ( ON ?auto_620969 ?auto_620965 ) ( ON ?auto_620971 ?auto_620969 ) ( ON ?auto_620970 ?auto_620971 ) ( ON ?auto_620972 ?auto_620970 ) ( ON ?auto_620973 ?auto_620972 ) ( ON ?auto_620974 ?auto_620973 ) ( not ( = ?auto_620966 ?auto_620967 ) ) ( not ( = ?auto_620966 ?auto_620968 ) ) ( not ( = ?auto_620966 ?auto_620965 ) ) ( not ( = ?auto_620966 ?auto_620969 ) ) ( not ( = ?auto_620966 ?auto_620971 ) ) ( not ( = ?auto_620966 ?auto_620970 ) ) ( not ( = ?auto_620966 ?auto_620972 ) ) ( not ( = ?auto_620966 ?auto_620973 ) ) ( not ( = ?auto_620966 ?auto_620974 ) ) ( not ( = ?auto_620966 ?auto_620975 ) ) ( not ( = ?auto_620966 ?auto_620976 ) ) ( not ( = ?auto_620967 ?auto_620968 ) ) ( not ( = ?auto_620967 ?auto_620965 ) ) ( not ( = ?auto_620967 ?auto_620969 ) ) ( not ( = ?auto_620967 ?auto_620971 ) ) ( not ( = ?auto_620967 ?auto_620970 ) ) ( not ( = ?auto_620967 ?auto_620972 ) ) ( not ( = ?auto_620967 ?auto_620973 ) ) ( not ( = ?auto_620967 ?auto_620974 ) ) ( not ( = ?auto_620967 ?auto_620975 ) ) ( not ( = ?auto_620967 ?auto_620976 ) ) ( not ( = ?auto_620968 ?auto_620965 ) ) ( not ( = ?auto_620968 ?auto_620969 ) ) ( not ( = ?auto_620968 ?auto_620971 ) ) ( not ( = ?auto_620968 ?auto_620970 ) ) ( not ( = ?auto_620968 ?auto_620972 ) ) ( not ( = ?auto_620968 ?auto_620973 ) ) ( not ( = ?auto_620968 ?auto_620974 ) ) ( not ( = ?auto_620968 ?auto_620975 ) ) ( not ( = ?auto_620968 ?auto_620976 ) ) ( not ( = ?auto_620965 ?auto_620969 ) ) ( not ( = ?auto_620965 ?auto_620971 ) ) ( not ( = ?auto_620965 ?auto_620970 ) ) ( not ( = ?auto_620965 ?auto_620972 ) ) ( not ( = ?auto_620965 ?auto_620973 ) ) ( not ( = ?auto_620965 ?auto_620974 ) ) ( not ( = ?auto_620965 ?auto_620975 ) ) ( not ( = ?auto_620965 ?auto_620976 ) ) ( not ( = ?auto_620969 ?auto_620971 ) ) ( not ( = ?auto_620969 ?auto_620970 ) ) ( not ( = ?auto_620969 ?auto_620972 ) ) ( not ( = ?auto_620969 ?auto_620973 ) ) ( not ( = ?auto_620969 ?auto_620974 ) ) ( not ( = ?auto_620969 ?auto_620975 ) ) ( not ( = ?auto_620969 ?auto_620976 ) ) ( not ( = ?auto_620971 ?auto_620970 ) ) ( not ( = ?auto_620971 ?auto_620972 ) ) ( not ( = ?auto_620971 ?auto_620973 ) ) ( not ( = ?auto_620971 ?auto_620974 ) ) ( not ( = ?auto_620971 ?auto_620975 ) ) ( not ( = ?auto_620971 ?auto_620976 ) ) ( not ( = ?auto_620970 ?auto_620972 ) ) ( not ( = ?auto_620970 ?auto_620973 ) ) ( not ( = ?auto_620970 ?auto_620974 ) ) ( not ( = ?auto_620970 ?auto_620975 ) ) ( not ( = ?auto_620970 ?auto_620976 ) ) ( not ( = ?auto_620972 ?auto_620973 ) ) ( not ( = ?auto_620972 ?auto_620974 ) ) ( not ( = ?auto_620972 ?auto_620975 ) ) ( not ( = ?auto_620972 ?auto_620976 ) ) ( not ( = ?auto_620973 ?auto_620974 ) ) ( not ( = ?auto_620973 ?auto_620975 ) ) ( not ( = ?auto_620973 ?auto_620976 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_620974 ?auto_620975 ?auto_620976 )
      ( MAKE-11CRATE-VERIFY ?auto_620966 ?auto_620967 ?auto_620968 ?auto_620965 ?auto_620969 ?auto_620971 ?auto_620970 ?auto_620972 ?auto_620973 ?auto_620974 ?auto_620975 ?auto_620976 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_621087 - SURFACE
      ?auto_621088 - SURFACE
      ?auto_621089 - SURFACE
      ?auto_621086 - SURFACE
      ?auto_621090 - SURFACE
      ?auto_621092 - SURFACE
      ?auto_621091 - SURFACE
      ?auto_621093 - SURFACE
      ?auto_621094 - SURFACE
      ?auto_621095 - SURFACE
      ?auto_621096 - SURFACE
      ?auto_621097 - SURFACE
    )
    :vars
    (
      ?auto_621098 - HOIST
      ?auto_621101 - PLACE
      ?auto_621099 - TRUCK
      ?auto_621100 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_621098 ?auto_621101 ) ( SURFACE-AT ?auto_621096 ?auto_621101 ) ( CLEAR ?auto_621096 ) ( IS-CRATE ?auto_621097 ) ( not ( = ?auto_621096 ?auto_621097 ) ) ( AVAILABLE ?auto_621098 ) ( IN ?auto_621097 ?auto_621099 ) ( ON ?auto_621096 ?auto_621095 ) ( not ( = ?auto_621095 ?auto_621096 ) ) ( not ( = ?auto_621095 ?auto_621097 ) ) ( TRUCK-AT ?auto_621099 ?auto_621100 ) ( not ( = ?auto_621100 ?auto_621101 ) ) ( ON ?auto_621088 ?auto_621087 ) ( ON ?auto_621089 ?auto_621088 ) ( ON ?auto_621086 ?auto_621089 ) ( ON ?auto_621090 ?auto_621086 ) ( ON ?auto_621092 ?auto_621090 ) ( ON ?auto_621091 ?auto_621092 ) ( ON ?auto_621093 ?auto_621091 ) ( ON ?auto_621094 ?auto_621093 ) ( ON ?auto_621095 ?auto_621094 ) ( not ( = ?auto_621087 ?auto_621088 ) ) ( not ( = ?auto_621087 ?auto_621089 ) ) ( not ( = ?auto_621087 ?auto_621086 ) ) ( not ( = ?auto_621087 ?auto_621090 ) ) ( not ( = ?auto_621087 ?auto_621092 ) ) ( not ( = ?auto_621087 ?auto_621091 ) ) ( not ( = ?auto_621087 ?auto_621093 ) ) ( not ( = ?auto_621087 ?auto_621094 ) ) ( not ( = ?auto_621087 ?auto_621095 ) ) ( not ( = ?auto_621087 ?auto_621096 ) ) ( not ( = ?auto_621087 ?auto_621097 ) ) ( not ( = ?auto_621088 ?auto_621089 ) ) ( not ( = ?auto_621088 ?auto_621086 ) ) ( not ( = ?auto_621088 ?auto_621090 ) ) ( not ( = ?auto_621088 ?auto_621092 ) ) ( not ( = ?auto_621088 ?auto_621091 ) ) ( not ( = ?auto_621088 ?auto_621093 ) ) ( not ( = ?auto_621088 ?auto_621094 ) ) ( not ( = ?auto_621088 ?auto_621095 ) ) ( not ( = ?auto_621088 ?auto_621096 ) ) ( not ( = ?auto_621088 ?auto_621097 ) ) ( not ( = ?auto_621089 ?auto_621086 ) ) ( not ( = ?auto_621089 ?auto_621090 ) ) ( not ( = ?auto_621089 ?auto_621092 ) ) ( not ( = ?auto_621089 ?auto_621091 ) ) ( not ( = ?auto_621089 ?auto_621093 ) ) ( not ( = ?auto_621089 ?auto_621094 ) ) ( not ( = ?auto_621089 ?auto_621095 ) ) ( not ( = ?auto_621089 ?auto_621096 ) ) ( not ( = ?auto_621089 ?auto_621097 ) ) ( not ( = ?auto_621086 ?auto_621090 ) ) ( not ( = ?auto_621086 ?auto_621092 ) ) ( not ( = ?auto_621086 ?auto_621091 ) ) ( not ( = ?auto_621086 ?auto_621093 ) ) ( not ( = ?auto_621086 ?auto_621094 ) ) ( not ( = ?auto_621086 ?auto_621095 ) ) ( not ( = ?auto_621086 ?auto_621096 ) ) ( not ( = ?auto_621086 ?auto_621097 ) ) ( not ( = ?auto_621090 ?auto_621092 ) ) ( not ( = ?auto_621090 ?auto_621091 ) ) ( not ( = ?auto_621090 ?auto_621093 ) ) ( not ( = ?auto_621090 ?auto_621094 ) ) ( not ( = ?auto_621090 ?auto_621095 ) ) ( not ( = ?auto_621090 ?auto_621096 ) ) ( not ( = ?auto_621090 ?auto_621097 ) ) ( not ( = ?auto_621092 ?auto_621091 ) ) ( not ( = ?auto_621092 ?auto_621093 ) ) ( not ( = ?auto_621092 ?auto_621094 ) ) ( not ( = ?auto_621092 ?auto_621095 ) ) ( not ( = ?auto_621092 ?auto_621096 ) ) ( not ( = ?auto_621092 ?auto_621097 ) ) ( not ( = ?auto_621091 ?auto_621093 ) ) ( not ( = ?auto_621091 ?auto_621094 ) ) ( not ( = ?auto_621091 ?auto_621095 ) ) ( not ( = ?auto_621091 ?auto_621096 ) ) ( not ( = ?auto_621091 ?auto_621097 ) ) ( not ( = ?auto_621093 ?auto_621094 ) ) ( not ( = ?auto_621093 ?auto_621095 ) ) ( not ( = ?auto_621093 ?auto_621096 ) ) ( not ( = ?auto_621093 ?auto_621097 ) ) ( not ( = ?auto_621094 ?auto_621095 ) ) ( not ( = ?auto_621094 ?auto_621096 ) ) ( not ( = ?auto_621094 ?auto_621097 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_621095 ?auto_621096 ?auto_621097 )
      ( MAKE-11CRATE-VERIFY ?auto_621087 ?auto_621088 ?auto_621089 ?auto_621086 ?auto_621090 ?auto_621092 ?auto_621091 ?auto_621093 ?auto_621094 ?auto_621095 ?auto_621096 ?auto_621097 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_621219 - SURFACE
      ?auto_621220 - SURFACE
      ?auto_621221 - SURFACE
      ?auto_621218 - SURFACE
      ?auto_621222 - SURFACE
      ?auto_621224 - SURFACE
      ?auto_621223 - SURFACE
      ?auto_621225 - SURFACE
      ?auto_621226 - SURFACE
      ?auto_621227 - SURFACE
      ?auto_621228 - SURFACE
      ?auto_621229 - SURFACE
    )
    :vars
    (
      ?auto_621233 - HOIST
      ?auto_621232 - PLACE
      ?auto_621234 - TRUCK
      ?auto_621231 - PLACE
      ?auto_621230 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_621233 ?auto_621232 ) ( SURFACE-AT ?auto_621228 ?auto_621232 ) ( CLEAR ?auto_621228 ) ( IS-CRATE ?auto_621229 ) ( not ( = ?auto_621228 ?auto_621229 ) ) ( AVAILABLE ?auto_621233 ) ( ON ?auto_621228 ?auto_621227 ) ( not ( = ?auto_621227 ?auto_621228 ) ) ( not ( = ?auto_621227 ?auto_621229 ) ) ( TRUCK-AT ?auto_621234 ?auto_621231 ) ( not ( = ?auto_621231 ?auto_621232 ) ) ( HOIST-AT ?auto_621230 ?auto_621231 ) ( LIFTING ?auto_621230 ?auto_621229 ) ( not ( = ?auto_621233 ?auto_621230 ) ) ( ON ?auto_621220 ?auto_621219 ) ( ON ?auto_621221 ?auto_621220 ) ( ON ?auto_621218 ?auto_621221 ) ( ON ?auto_621222 ?auto_621218 ) ( ON ?auto_621224 ?auto_621222 ) ( ON ?auto_621223 ?auto_621224 ) ( ON ?auto_621225 ?auto_621223 ) ( ON ?auto_621226 ?auto_621225 ) ( ON ?auto_621227 ?auto_621226 ) ( not ( = ?auto_621219 ?auto_621220 ) ) ( not ( = ?auto_621219 ?auto_621221 ) ) ( not ( = ?auto_621219 ?auto_621218 ) ) ( not ( = ?auto_621219 ?auto_621222 ) ) ( not ( = ?auto_621219 ?auto_621224 ) ) ( not ( = ?auto_621219 ?auto_621223 ) ) ( not ( = ?auto_621219 ?auto_621225 ) ) ( not ( = ?auto_621219 ?auto_621226 ) ) ( not ( = ?auto_621219 ?auto_621227 ) ) ( not ( = ?auto_621219 ?auto_621228 ) ) ( not ( = ?auto_621219 ?auto_621229 ) ) ( not ( = ?auto_621220 ?auto_621221 ) ) ( not ( = ?auto_621220 ?auto_621218 ) ) ( not ( = ?auto_621220 ?auto_621222 ) ) ( not ( = ?auto_621220 ?auto_621224 ) ) ( not ( = ?auto_621220 ?auto_621223 ) ) ( not ( = ?auto_621220 ?auto_621225 ) ) ( not ( = ?auto_621220 ?auto_621226 ) ) ( not ( = ?auto_621220 ?auto_621227 ) ) ( not ( = ?auto_621220 ?auto_621228 ) ) ( not ( = ?auto_621220 ?auto_621229 ) ) ( not ( = ?auto_621221 ?auto_621218 ) ) ( not ( = ?auto_621221 ?auto_621222 ) ) ( not ( = ?auto_621221 ?auto_621224 ) ) ( not ( = ?auto_621221 ?auto_621223 ) ) ( not ( = ?auto_621221 ?auto_621225 ) ) ( not ( = ?auto_621221 ?auto_621226 ) ) ( not ( = ?auto_621221 ?auto_621227 ) ) ( not ( = ?auto_621221 ?auto_621228 ) ) ( not ( = ?auto_621221 ?auto_621229 ) ) ( not ( = ?auto_621218 ?auto_621222 ) ) ( not ( = ?auto_621218 ?auto_621224 ) ) ( not ( = ?auto_621218 ?auto_621223 ) ) ( not ( = ?auto_621218 ?auto_621225 ) ) ( not ( = ?auto_621218 ?auto_621226 ) ) ( not ( = ?auto_621218 ?auto_621227 ) ) ( not ( = ?auto_621218 ?auto_621228 ) ) ( not ( = ?auto_621218 ?auto_621229 ) ) ( not ( = ?auto_621222 ?auto_621224 ) ) ( not ( = ?auto_621222 ?auto_621223 ) ) ( not ( = ?auto_621222 ?auto_621225 ) ) ( not ( = ?auto_621222 ?auto_621226 ) ) ( not ( = ?auto_621222 ?auto_621227 ) ) ( not ( = ?auto_621222 ?auto_621228 ) ) ( not ( = ?auto_621222 ?auto_621229 ) ) ( not ( = ?auto_621224 ?auto_621223 ) ) ( not ( = ?auto_621224 ?auto_621225 ) ) ( not ( = ?auto_621224 ?auto_621226 ) ) ( not ( = ?auto_621224 ?auto_621227 ) ) ( not ( = ?auto_621224 ?auto_621228 ) ) ( not ( = ?auto_621224 ?auto_621229 ) ) ( not ( = ?auto_621223 ?auto_621225 ) ) ( not ( = ?auto_621223 ?auto_621226 ) ) ( not ( = ?auto_621223 ?auto_621227 ) ) ( not ( = ?auto_621223 ?auto_621228 ) ) ( not ( = ?auto_621223 ?auto_621229 ) ) ( not ( = ?auto_621225 ?auto_621226 ) ) ( not ( = ?auto_621225 ?auto_621227 ) ) ( not ( = ?auto_621225 ?auto_621228 ) ) ( not ( = ?auto_621225 ?auto_621229 ) ) ( not ( = ?auto_621226 ?auto_621227 ) ) ( not ( = ?auto_621226 ?auto_621228 ) ) ( not ( = ?auto_621226 ?auto_621229 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_621227 ?auto_621228 ?auto_621229 )
      ( MAKE-11CRATE-VERIFY ?auto_621219 ?auto_621220 ?auto_621221 ?auto_621218 ?auto_621222 ?auto_621224 ?auto_621223 ?auto_621225 ?auto_621226 ?auto_621227 ?auto_621228 ?auto_621229 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_621362 - SURFACE
      ?auto_621363 - SURFACE
      ?auto_621364 - SURFACE
      ?auto_621361 - SURFACE
      ?auto_621365 - SURFACE
      ?auto_621367 - SURFACE
      ?auto_621366 - SURFACE
      ?auto_621368 - SURFACE
      ?auto_621369 - SURFACE
      ?auto_621370 - SURFACE
      ?auto_621371 - SURFACE
      ?auto_621372 - SURFACE
    )
    :vars
    (
      ?auto_621377 - HOIST
      ?auto_621375 - PLACE
      ?auto_621376 - TRUCK
      ?auto_621378 - PLACE
      ?auto_621373 - HOIST
      ?auto_621374 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_621377 ?auto_621375 ) ( SURFACE-AT ?auto_621371 ?auto_621375 ) ( CLEAR ?auto_621371 ) ( IS-CRATE ?auto_621372 ) ( not ( = ?auto_621371 ?auto_621372 ) ) ( AVAILABLE ?auto_621377 ) ( ON ?auto_621371 ?auto_621370 ) ( not ( = ?auto_621370 ?auto_621371 ) ) ( not ( = ?auto_621370 ?auto_621372 ) ) ( TRUCK-AT ?auto_621376 ?auto_621378 ) ( not ( = ?auto_621378 ?auto_621375 ) ) ( HOIST-AT ?auto_621373 ?auto_621378 ) ( not ( = ?auto_621377 ?auto_621373 ) ) ( AVAILABLE ?auto_621373 ) ( SURFACE-AT ?auto_621372 ?auto_621378 ) ( ON ?auto_621372 ?auto_621374 ) ( CLEAR ?auto_621372 ) ( not ( = ?auto_621371 ?auto_621374 ) ) ( not ( = ?auto_621372 ?auto_621374 ) ) ( not ( = ?auto_621370 ?auto_621374 ) ) ( ON ?auto_621363 ?auto_621362 ) ( ON ?auto_621364 ?auto_621363 ) ( ON ?auto_621361 ?auto_621364 ) ( ON ?auto_621365 ?auto_621361 ) ( ON ?auto_621367 ?auto_621365 ) ( ON ?auto_621366 ?auto_621367 ) ( ON ?auto_621368 ?auto_621366 ) ( ON ?auto_621369 ?auto_621368 ) ( ON ?auto_621370 ?auto_621369 ) ( not ( = ?auto_621362 ?auto_621363 ) ) ( not ( = ?auto_621362 ?auto_621364 ) ) ( not ( = ?auto_621362 ?auto_621361 ) ) ( not ( = ?auto_621362 ?auto_621365 ) ) ( not ( = ?auto_621362 ?auto_621367 ) ) ( not ( = ?auto_621362 ?auto_621366 ) ) ( not ( = ?auto_621362 ?auto_621368 ) ) ( not ( = ?auto_621362 ?auto_621369 ) ) ( not ( = ?auto_621362 ?auto_621370 ) ) ( not ( = ?auto_621362 ?auto_621371 ) ) ( not ( = ?auto_621362 ?auto_621372 ) ) ( not ( = ?auto_621362 ?auto_621374 ) ) ( not ( = ?auto_621363 ?auto_621364 ) ) ( not ( = ?auto_621363 ?auto_621361 ) ) ( not ( = ?auto_621363 ?auto_621365 ) ) ( not ( = ?auto_621363 ?auto_621367 ) ) ( not ( = ?auto_621363 ?auto_621366 ) ) ( not ( = ?auto_621363 ?auto_621368 ) ) ( not ( = ?auto_621363 ?auto_621369 ) ) ( not ( = ?auto_621363 ?auto_621370 ) ) ( not ( = ?auto_621363 ?auto_621371 ) ) ( not ( = ?auto_621363 ?auto_621372 ) ) ( not ( = ?auto_621363 ?auto_621374 ) ) ( not ( = ?auto_621364 ?auto_621361 ) ) ( not ( = ?auto_621364 ?auto_621365 ) ) ( not ( = ?auto_621364 ?auto_621367 ) ) ( not ( = ?auto_621364 ?auto_621366 ) ) ( not ( = ?auto_621364 ?auto_621368 ) ) ( not ( = ?auto_621364 ?auto_621369 ) ) ( not ( = ?auto_621364 ?auto_621370 ) ) ( not ( = ?auto_621364 ?auto_621371 ) ) ( not ( = ?auto_621364 ?auto_621372 ) ) ( not ( = ?auto_621364 ?auto_621374 ) ) ( not ( = ?auto_621361 ?auto_621365 ) ) ( not ( = ?auto_621361 ?auto_621367 ) ) ( not ( = ?auto_621361 ?auto_621366 ) ) ( not ( = ?auto_621361 ?auto_621368 ) ) ( not ( = ?auto_621361 ?auto_621369 ) ) ( not ( = ?auto_621361 ?auto_621370 ) ) ( not ( = ?auto_621361 ?auto_621371 ) ) ( not ( = ?auto_621361 ?auto_621372 ) ) ( not ( = ?auto_621361 ?auto_621374 ) ) ( not ( = ?auto_621365 ?auto_621367 ) ) ( not ( = ?auto_621365 ?auto_621366 ) ) ( not ( = ?auto_621365 ?auto_621368 ) ) ( not ( = ?auto_621365 ?auto_621369 ) ) ( not ( = ?auto_621365 ?auto_621370 ) ) ( not ( = ?auto_621365 ?auto_621371 ) ) ( not ( = ?auto_621365 ?auto_621372 ) ) ( not ( = ?auto_621365 ?auto_621374 ) ) ( not ( = ?auto_621367 ?auto_621366 ) ) ( not ( = ?auto_621367 ?auto_621368 ) ) ( not ( = ?auto_621367 ?auto_621369 ) ) ( not ( = ?auto_621367 ?auto_621370 ) ) ( not ( = ?auto_621367 ?auto_621371 ) ) ( not ( = ?auto_621367 ?auto_621372 ) ) ( not ( = ?auto_621367 ?auto_621374 ) ) ( not ( = ?auto_621366 ?auto_621368 ) ) ( not ( = ?auto_621366 ?auto_621369 ) ) ( not ( = ?auto_621366 ?auto_621370 ) ) ( not ( = ?auto_621366 ?auto_621371 ) ) ( not ( = ?auto_621366 ?auto_621372 ) ) ( not ( = ?auto_621366 ?auto_621374 ) ) ( not ( = ?auto_621368 ?auto_621369 ) ) ( not ( = ?auto_621368 ?auto_621370 ) ) ( not ( = ?auto_621368 ?auto_621371 ) ) ( not ( = ?auto_621368 ?auto_621372 ) ) ( not ( = ?auto_621368 ?auto_621374 ) ) ( not ( = ?auto_621369 ?auto_621370 ) ) ( not ( = ?auto_621369 ?auto_621371 ) ) ( not ( = ?auto_621369 ?auto_621372 ) ) ( not ( = ?auto_621369 ?auto_621374 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_621370 ?auto_621371 ?auto_621372 )
      ( MAKE-11CRATE-VERIFY ?auto_621362 ?auto_621363 ?auto_621364 ?auto_621361 ?auto_621365 ?auto_621367 ?auto_621366 ?auto_621368 ?auto_621369 ?auto_621370 ?auto_621371 ?auto_621372 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_621506 - SURFACE
      ?auto_621507 - SURFACE
      ?auto_621508 - SURFACE
      ?auto_621505 - SURFACE
      ?auto_621509 - SURFACE
      ?auto_621511 - SURFACE
      ?auto_621510 - SURFACE
      ?auto_621512 - SURFACE
      ?auto_621513 - SURFACE
      ?auto_621514 - SURFACE
      ?auto_621515 - SURFACE
      ?auto_621516 - SURFACE
    )
    :vars
    (
      ?auto_621522 - HOIST
      ?auto_621519 - PLACE
      ?auto_621517 - PLACE
      ?auto_621520 - HOIST
      ?auto_621521 - SURFACE
      ?auto_621518 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_621522 ?auto_621519 ) ( SURFACE-AT ?auto_621515 ?auto_621519 ) ( CLEAR ?auto_621515 ) ( IS-CRATE ?auto_621516 ) ( not ( = ?auto_621515 ?auto_621516 ) ) ( AVAILABLE ?auto_621522 ) ( ON ?auto_621515 ?auto_621514 ) ( not ( = ?auto_621514 ?auto_621515 ) ) ( not ( = ?auto_621514 ?auto_621516 ) ) ( not ( = ?auto_621517 ?auto_621519 ) ) ( HOIST-AT ?auto_621520 ?auto_621517 ) ( not ( = ?auto_621522 ?auto_621520 ) ) ( AVAILABLE ?auto_621520 ) ( SURFACE-AT ?auto_621516 ?auto_621517 ) ( ON ?auto_621516 ?auto_621521 ) ( CLEAR ?auto_621516 ) ( not ( = ?auto_621515 ?auto_621521 ) ) ( not ( = ?auto_621516 ?auto_621521 ) ) ( not ( = ?auto_621514 ?auto_621521 ) ) ( TRUCK-AT ?auto_621518 ?auto_621519 ) ( ON ?auto_621507 ?auto_621506 ) ( ON ?auto_621508 ?auto_621507 ) ( ON ?auto_621505 ?auto_621508 ) ( ON ?auto_621509 ?auto_621505 ) ( ON ?auto_621511 ?auto_621509 ) ( ON ?auto_621510 ?auto_621511 ) ( ON ?auto_621512 ?auto_621510 ) ( ON ?auto_621513 ?auto_621512 ) ( ON ?auto_621514 ?auto_621513 ) ( not ( = ?auto_621506 ?auto_621507 ) ) ( not ( = ?auto_621506 ?auto_621508 ) ) ( not ( = ?auto_621506 ?auto_621505 ) ) ( not ( = ?auto_621506 ?auto_621509 ) ) ( not ( = ?auto_621506 ?auto_621511 ) ) ( not ( = ?auto_621506 ?auto_621510 ) ) ( not ( = ?auto_621506 ?auto_621512 ) ) ( not ( = ?auto_621506 ?auto_621513 ) ) ( not ( = ?auto_621506 ?auto_621514 ) ) ( not ( = ?auto_621506 ?auto_621515 ) ) ( not ( = ?auto_621506 ?auto_621516 ) ) ( not ( = ?auto_621506 ?auto_621521 ) ) ( not ( = ?auto_621507 ?auto_621508 ) ) ( not ( = ?auto_621507 ?auto_621505 ) ) ( not ( = ?auto_621507 ?auto_621509 ) ) ( not ( = ?auto_621507 ?auto_621511 ) ) ( not ( = ?auto_621507 ?auto_621510 ) ) ( not ( = ?auto_621507 ?auto_621512 ) ) ( not ( = ?auto_621507 ?auto_621513 ) ) ( not ( = ?auto_621507 ?auto_621514 ) ) ( not ( = ?auto_621507 ?auto_621515 ) ) ( not ( = ?auto_621507 ?auto_621516 ) ) ( not ( = ?auto_621507 ?auto_621521 ) ) ( not ( = ?auto_621508 ?auto_621505 ) ) ( not ( = ?auto_621508 ?auto_621509 ) ) ( not ( = ?auto_621508 ?auto_621511 ) ) ( not ( = ?auto_621508 ?auto_621510 ) ) ( not ( = ?auto_621508 ?auto_621512 ) ) ( not ( = ?auto_621508 ?auto_621513 ) ) ( not ( = ?auto_621508 ?auto_621514 ) ) ( not ( = ?auto_621508 ?auto_621515 ) ) ( not ( = ?auto_621508 ?auto_621516 ) ) ( not ( = ?auto_621508 ?auto_621521 ) ) ( not ( = ?auto_621505 ?auto_621509 ) ) ( not ( = ?auto_621505 ?auto_621511 ) ) ( not ( = ?auto_621505 ?auto_621510 ) ) ( not ( = ?auto_621505 ?auto_621512 ) ) ( not ( = ?auto_621505 ?auto_621513 ) ) ( not ( = ?auto_621505 ?auto_621514 ) ) ( not ( = ?auto_621505 ?auto_621515 ) ) ( not ( = ?auto_621505 ?auto_621516 ) ) ( not ( = ?auto_621505 ?auto_621521 ) ) ( not ( = ?auto_621509 ?auto_621511 ) ) ( not ( = ?auto_621509 ?auto_621510 ) ) ( not ( = ?auto_621509 ?auto_621512 ) ) ( not ( = ?auto_621509 ?auto_621513 ) ) ( not ( = ?auto_621509 ?auto_621514 ) ) ( not ( = ?auto_621509 ?auto_621515 ) ) ( not ( = ?auto_621509 ?auto_621516 ) ) ( not ( = ?auto_621509 ?auto_621521 ) ) ( not ( = ?auto_621511 ?auto_621510 ) ) ( not ( = ?auto_621511 ?auto_621512 ) ) ( not ( = ?auto_621511 ?auto_621513 ) ) ( not ( = ?auto_621511 ?auto_621514 ) ) ( not ( = ?auto_621511 ?auto_621515 ) ) ( not ( = ?auto_621511 ?auto_621516 ) ) ( not ( = ?auto_621511 ?auto_621521 ) ) ( not ( = ?auto_621510 ?auto_621512 ) ) ( not ( = ?auto_621510 ?auto_621513 ) ) ( not ( = ?auto_621510 ?auto_621514 ) ) ( not ( = ?auto_621510 ?auto_621515 ) ) ( not ( = ?auto_621510 ?auto_621516 ) ) ( not ( = ?auto_621510 ?auto_621521 ) ) ( not ( = ?auto_621512 ?auto_621513 ) ) ( not ( = ?auto_621512 ?auto_621514 ) ) ( not ( = ?auto_621512 ?auto_621515 ) ) ( not ( = ?auto_621512 ?auto_621516 ) ) ( not ( = ?auto_621512 ?auto_621521 ) ) ( not ( = ?auto_621513 ?auto_621514 ) ) ( not ( = ?auto_621513 ?auto_621515 ) ) ( not ( = ?auto_621513 ?auto_621516 ) ) ( not ( = ?auto_621513 ?auto_621521 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_621514 ?auto_621515 ?auto_621516 )
      ( MAKE-11CRATE-VERIFY ?auto_621506 ?auto_621507 ?auto_621508 ?auto_621505 ?auto_621509 ?auto_621511 ?auto_621510 ?auto_621512 ?auto_621513 ?auto_621514 ?auto_621515 ?auto_621516 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_621650 - SURFACE
      ?auto_621651 - SURFACE
      ?auto_621652 - SURFACE
      ?auto_621649 - SURFACE
      ?auto_621653 - SURFACE
      ?auto_621655 - SURFACE
      ?auto_621654 - SURFACE
      ?auto_621656 - SURFACE
      ?auto_621657 - SURFACE
      ?auto_621658 - SURFACE
      ?auto_621659 - SURFACE
      ?auto_621660 - SURFACE
    )
    :vars
    (
      ?auto_621664 - HOIST
      ?auto_621663 - PLACE
      ?auto_621661 - PLACE
      ?auto_621662 - HOIST
      ?auto_621665 - SURFACE
      ?auto_621666 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_621664 ?auto_621663 ) ( IS-CRATE ?auto_621660 ) ( not ( = ?auto_621659 ?auto_621660 ) ) ( not ( = ?auto_621658 ?auto_621659 ) ) ( not ( = ?auto_621658 ?auto_621660 ) ) ( not ( = ?auto_621661 ?auto_621663 ) ) ( HOIST-AT ?auto_621662 ?auto_621661 ) ( not ( = ?auto_621664 ?auto_621662 ) ) ( AVAILABLE ?auto_621662 ) ( SURFACE-AT ?auto_621660 ?auto_621661 ) ( ON ?auto_621660 ?auto_621665 ) ( CLEAR ?auto_621660 ) ( not ( = ?auto_621659 ?auto_621665 ) ) ( not ( = ?auto_621660 ?auto_621665 ) ) ( not ( = ?auto_621658 ?auto_621665 ) ) ( TRUCK-AT ?auto_621666 ?auto_621663 ) ( SURFACE-AT ?auto_621658 ?auto_621663 ) ( CLEAR ?auto_621658 ) ( LIFTING ?auto_621664 ?auto_621659 ) ( IS-CRATE ?auto_621659 ) ( ON ?auto_621651 ?auto_621650 ) ( ON ?auto_621652 ?auto_621651 ) ( ON ?auto_621649 ?auto_621652 ) ( ON ?auto_621653 ?auto_621649 ) ( ON ?auto_621655 ?auto_621653 ) ( ON ?auto_621654 ?auto_621655 ) ( ON ?auto_621656 ?auto_621654 ) ( ON ?auto_621657 ?auto_621656 ) ( ON ?auto_621658 ?auto_621657 ) ( not ( = ?auto_621650 ?auto_621651 ) ) ( not ( = ?auto_621650 ?auto_621652 ) ) ( not ( = ?auto_621650 ?auto_621649 ) ) ( not ( = ?auto_621650 ?auto_621653 ) ) ( not ( = ?auto_621650 ?auto_621655 ) ) ( not ( = ?auto_621650 ?auto_621654 ) ) ( not ( = ?auto_621650 ?auto_621656 ) ) ( not ( = ?auto_621650 ?auto_621657 ) ) ( not ( = ?auto_621650 ?auto_621658 ) ) ( not ( = ?auto_621650 ?auto_621659 ) ) ( not ( = ?auto_621650 ?auto_621660 ) ) ( not ( = ?auto_621650 ?auto_621665 ) ) ( not ( = ?auto_621651 ?auto_621652 ) ) ( not ( = ?auto_621651 ?auto_621649 ) ) ( not ( = ?auto_621651 ?auto_621653 ) ) ( not ( = ?auto_621651 ?auto_621655 ) ) ( not ( = ?auto_621651 ?auto_621654 ) ) ( not ( = ?auto_621651 ?auto_621656 ) ) ( not ( = ?auto_621651 ?auto_621657 ) ) ( not ( = ?auto_621651 ?auto_621658 ) ) ( not ( = ?auto_621651 ?auto_621659 ) ) ( not ( = ?auto_621651 ?auto_621660 ) ) ( not ( = ?auto_621651 ?auto_621665 ) ) ( not ( = ?auto_621652 ?auto_621649 ) ) ( not ( = ?auto_621652 ?auto_621653 ) ) ( not ( = ?auto_621652 ?auto_621655 ) ) ( not ( = ?auto_621652 ?auto_621654 ) ) ( not ( = ?auto_621652 ?auto_621656 ) ) ( not ( = ?auto_621652 ?auto_621657 ) ) ( not ( = ?auto_621652 ?auto_621658 ) ) ( not ( = ?auto_621652 ?auto_621659 ) ) ( not ( = ?auto_621652 ?auto_621660 ) ) ( not ( = ?auto_621652 ?auto_621665 ) ) ( not ( = ?auto_621649 ?auto_621653 ) ) ( not ( = ?auto_621649 ?auto_621655 ) ) ( not ( = ?auto_621649 ?auto_621654 ) ) ( not ( = ?auto_621649 ?auto_621656 ) ) ( not ( = ?auto_621649 ?auto_621657 ) ) ( not ( = ?auto_621649 ?auto_621658 ) ) ( not ( = ?auto_621649 ?auto_621659 ) ) ( not ( = ?auto_621649 ?auto_621660 ) ) ( not ( = ?auto_621649 ?auto_621665 ) ) ( not ( = ?auto_621653 ?auto_621655 ) ) ( not ( = ?auto_621653 ?auto_621654 ) ) ( not ( = ?auto_621653 ?auto_621656 ) ) ( not ( = ?auto_621653 ?auto_621657 ) ) ( not ( = ?auto_621653 ?auto_621658 ) ) ( not ( = ?auto_621653 ?auto_621659 ) ) ( not ( = ?auto_621653 ?auto_621660 ) ) ( not ( = ?auto_621653 ?auto_621665 ) ) ( not ( = ?auto_621655 ?auto_621654 ) ) ( not ( = ?auto_621655 ?auto_621656 ) ) ( not ( = ?auto_621655 ?auto_621657 ) ) ( not ( = ?auto_621655 ?auto_621658 ) ) ( not ( = ?auto_621655 ?auto_621659 ) ) ( not ( = ?auto_621655 ?auto_621660 ) ) ( not ( = ?auto_621655 ?auto_621665 ) ) ( not ( = ?auto_621654 ?auto_621656 ) ) ( not ( = ?auto_621654 ?auto_621657 ) ) ( not ( = ?auto_621654 ?auto_621658 ) ) ( not ( = ?auto_621654 ?auto_621659 ) ) ( not ( = ?auto_621654 ?auto_621660 ) ) ( not ( = ?auto_621654 ?auto_621665 ) ) ( not ( = ?auto_621656 ?auto_621657 ) ) ( not ( = ?auto_621656 ?auto_621658 ) ) ( not ( = ?auto_621656 ?auto_621659 ) ) ( not ( = ?auto_621656 ?auto_621660 ) ) ( not ( = ?auto_621656 ?auto_621665 ) ) ( not ( = ?auto_621657 ?auto_621658 ) ) ( not ( = ?auto_621657 ?auto_621659 ) ) ( not ( = ?auto_621657 ?auto_621660 ) ) ( not ( = ?auto_621657 ?auto_621665 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_621658 ?auto_621659 ?auto_621660 )
      ( MAKE-11CRATE-VERIFY ?auto_621650 ?auto_621651 ?auto_621652 ?auto_621649 ?auto_621653 ?auto_621655 ?auto_621654 ?auto_621656 ?auto_621657 ?auto_621658 ?auto_621659 ?auto_621660 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_621794 - SURFACE
      ?auto_621795 - SURFACE
      ?auto_621796 - SURFACE
      ?auto_621793 - SURFACE
      ?auto_621797 - SURFACE
      ?auto_621799 - SURFACE
      ?auto_621798 - SURFACE
      ?auto_621800 - SURFACE
      ?auto_621801 - SURFACE
      ?auto_621802 - SURFACE
      ?auto_621803 - SURFACE
      ?auto_621804 - SURFACE
    )
    :vars
    (
      ?auto_621810 - HOIST
      ?auto_621806 - PLACE
      ?auto_621809 - PLACE
      ?auto_621808 - HOIST
      ?auto_621807 - SURFACE
      ?auto_621805 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_621810 ?auto_621806 ) ( IS-CRATE ?auto_621804 ) ( not ( = ?auto_621803 ?auto_621804 ) ) ( not ( = ?auto_621802 ?auto_621803 ) ) ( not ( = ?auto_621802 ?auto_621804 ) ) ( not ( = ?auto_621809 ?auto_621806 ) ) ( HOIST-AT ?auto_621808 ?auto_621809 ) ( not ( = ?auto_621810 ?auto_621808 ) ) ( AVAILABLE ?auto_621808 ) ( SURFACE-AT ?auto_621804 ?auto_621809 ) ( ON ?auto_621804 ?auto_621807 ) ( CLEAR ?auto_621804 ) ( not ( = ?auto_621803 ?auto_621807 ) ) ( not ( = ?auto_621804 ?auto_621807 ) ) ( not ( = ?auto_621802 ?auto_621807 ) ) ( TRUCK-AT ?auto_621805 ?auto_621806 ) ( SURFACE-AT ?auto_621802 ?auto_621806 ) ( CLEAR ?auto_621802 ) ( IS-CRATE ?auto_621803 ) ( AVAILABLE ?auto_621810 ) ( IN ?auto_621803 ?auto_621805 ) ( ON ?auto_621795 ?auto_621794 ) ( ON ?auto_621796 ?auto_621795 ) ( ON ?auto_621793 ?auto_621796 ) ( ON ?auto_621797 ?auto_621793 ) ( ON ?auto_621799 ?auto_621797 ) ( ON ?auto_621798 ?auto_621799 ) ( ON ?auto_621800 ?auto_621798 ) ( ON ?auto_621801 ?auto_621800 ) ( ON ?auto_621802 ?auto_621801 ) ( not ( = ?auto_621794 ?auto_621795 ) ) ( not ( = ?auto_621794 ?auto_621796 ) ) ( not ( = ?auto_621794 ?auto_621793 ) ) ( not ( = ?auto_621794 ?auto_621797 ) ) ( not ( = ?auto_621794 ?auto_621799 ) ) ( not ( = ?auto_621794 ?auto_621798 ) ) ( not ( = ?auto_621794 ?auto_621800 ) ) ( not ( = ?auto_621794 ?auto_621801 ) ) ( not ( = ?auto_621794 ?auto_621802 ) ) ( not ( = ?auto_621794 ?auto_621803 ) ) ( not ( = ?auto_621794 ?auto_621804 ) ) ( not ( = ?auto_621794 ?auto_621807 ) ) ( not ( = ?auto_621795 ?auto_621796 ) ) ( not ( = ?auto_621795 ?auto_621793 ) ) ( not ( = ?auto_621795 ?auto_621797 ) ) ( not ( = ?auto_621795 ?auto_621799 ) ) ( not ( = ?auto_621795 ?auto_621798 ) ) ( not ( = ?auto_621795 ?auto_621800 ) ) ( not ( = ?auto_621795 ?auto_621801 ) ) ( not ( = ?auto_621795 ?auto_621802 ) ) ( not ( = ?auto_621795 ?auto_621803 ) ) ( not ( = ?auto_621795 ?auto_621804 ) ) ( not ( = ?auto_621795 ?auto_621807 ) ) ( not ( = ?auto_621796 ?auto_621793 ) ) ( not ( = ?auto_621796 ?auto_621797 ) ) ( not ( = ?auto_621796 ?auto_621799 ) ) ( not ( = ?auto_621796 ?auto_621798 ) ) ( not ( = ?auto_621796 ?auto_621800 ) ) ( not ( = ?auto_621796 ?auto_621801 ) ) ( not ( = ?auto_621796 ?auto_621802 ) ) ( not ( = ?auto_621796 ?auto_621803 ) ) ( not ( = ?auto_621796 ?auto_621804 ) ) ( not ( = ?auto_621796 ?auto_621807 ) ) ( not ( = ?auto_621793 ?auto_621797 ) ) ( not ( = ?auto_621793 ?auto_621799 ) ) ( not ( = ?auto_621793 ?auto_621798 ) ) ( not ( = ?auto_621793 ?auto_621800 ) ) ( not ( = ?auto_621793 ?auto_621801 ) ) ( not ( = ?auto_621793 ?auto_621802 ) ) ( not ( = ?auto_621793 ?auto_621803 ) ) ( not ( = ?auto_621793 ?auto_621804 ) ) ( not ( = ?auto_621793 ?auto_621807 ) ) ( not ( = ?auto_621797 ?auto_621799 ) ) ( not ( = ?auto_621797 ?auto_621798 ) ) ( not ( = ?auto_621797 ?auto_621800 ) ) ( not ( = ?auto_621797 ?auto_621801 ) ) ( not ( = ?auto_621797 ?auto_621802 ) ) ( not ( = ?auto_621797 ?auto_621803 ) ) ( not ( = ?auto_621797 ?auto_621804 ) ) ( not ( = ?auto_621797 ?auto_621807 ) ) ( not ( = ?auto_621799 ?auto_621798 ) ) ( not ( = ?auto_621799 ?auto_621800 ) ) ( not ( = ?auto_621799 ?auto_621801 ) ) ( not ( = ?auto_621799 ?auto_621802 ) ) ( not ( = ?auto_621799 ?auto_621803 ) ) ( not ( = ?auto_621799 ?auto_621804 ) ) ( not ( = ?auto_621799 ?auto_621807 ) ) ( not ( = ?auto_621798 ?auto_621800 ) ) ( not ( = ?auto_621798 ?auto_621801 ) ) ( not ( = ?auto_621798 ?auto_621802 ) ) ( not ( = ?auto_621798 ?auto_621803 ) ) ( not ( = ?auto_621798 ?auto_621804 ) ) ( not ( = ?auto_621798 ?auto_621807 ) ) ( not ( = ?auto_621800 ?auto_621801 ) ) ( not ( = ?auto_621800 ?auto_621802 ) ) ( not ( = ?auto_621800 ?auto_621803 ) ) ( not ( = ?auto_621800 ?auto_621804 ) ) ( not ( = ?auto_621800 ?auto_621807 ) ) ( not ( = ?auto_621801 ?auto_621802 ) ) ( not ( = ?auto_621801 ?auto_621803 ) ) ( not ( = ?auto_621801 ?auto_621804 ) ) ( not ( = ?auto_621801 ?auto_621807 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_621802 ?auto_621803 ?auto_621804 )
      ( MAKE-11CRATE-VERIFY ?auto_621794 ?auto_621795 ?auto_621796 ?auto_621793 ?auto_621797 ?auto_621799 ?auto_621798 ?auto_621800 ?auto_621801 ?auto_621802 ?auto_621803 ?auto_621804 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_630945 - SURFACE
      ?auto_630946 - SURFACE
      ?auto_630947 - SURFACE
      ?auto_630944 - SURFACE
      ?auto_630948 - SURFACE
      ?auto_630950 - SURFACE
      ?auto_630949 - SURFACE
      ?auto_630951 - SURFACE
      ?auto_630952 - SURFACE
      ?auto_630953 - SURFACE
      ?auto_630954 - SURFACE
      ?auto_630955 - SURFACE
      ?auto_630956 - SURFACE
    )
    :vars
    (
      ?auto_630957 - HOIST
      ?auto_630958 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_630957 ?auto_630958 ) ( SURFACE-AT ?auto_630955 ?auto_630958 ) ( CLEAR ?auto_630955 ) ( LIFTING ?auto_630957 ?auto_630956 ) ( IS-CRATE ?auto_630956 ) ( not ( = ?auto_630955 ?auto_630956 ) ) ( ON ?auto_630946 ?auto_630945 ) ( ON ?auto_630947 ?auto_630946 ) ( ON ?auto_630944 ?auto_630947 ) ( ON ?auto_630948 ?auto_630944 ) ( ON ?auto_630950 ?auto_630948 ) ( ON ?auto_630949 ?auto_630950 ) ( ON ?auto_630951 ?auto_630949 ) ( ON ?auto_630952 ?auto_630951 ) ( ON ?auto_630953 ?auto_630952 ) ( ON ?auto_630954 ?auto_630953 ) ( ON ?auto_630955 ?auto_630954 ) ( not ( = ?auto_630945 ?auto_630946 ) ) ( not ( = ?auto_630945 ?auto_630947 ) ) ( not ( = ?auto_630945 ?auto_630944 ) ) ( not ( = ?auto_630945 ?auto_630948 ) ) ( not ( = ?auto_630945 ?auto_630950 ) ) ( not ( = ?auto_630945 ?auto_630949 ) ) ( not ( = ?auto_630945 ?auto_630951 ) ) ( not ( = ?auto_630945 ?auto_630952 ) ) ( not ( = ?auto_630945 ?auto_630953 ) ) ( not ( = ?auto_630945 ?auto_630954 ) ) ( not ( = ?auto_630945 ?auto_630955 ) ) ( not ( = ?auto_630945 ?auto_630956 ) ) ( not ( = ?auto_630946 ?auto_630947 ) ) ( not ( = ?auto_630946 ?auto_630944 ) ) ( not ( = ?auto_630946 ?auto_630948 ) ) ( not ( = ?auto_630946 ?auto_630950 ) ) ( not ( = ?auto_630946 ?auto_630949 ) ) ( not ( = ?auto_630946 ?auto_630951 ) ) ( not ( = ?auto_630946 ?auto_630952 ) ) ( not ( = ?auto_630946 ?auto_630953 ) ) ( not ( = ?auto_630946 ?auto_630954 ) ) ( not ( = ?auto_630946 ?auto_630955 ) ) ( not ( = ?auto_630946 ?auto_630956 ) ) ( not ( = ?auto_630947 ?auto_630944 ) ) ( not ( = ?auto_630947 ?auto_630948 ) ) ( not ( = ?auto_630947 ?auto_630950 ) ) ( not ( = ?auto_630947 ?auto_630949 ) ) ( not ( = ?auto_630947 ?auto_630951 ) ) ( not ( = ?auto_630947 ?auto_630952 ) ) ( not ( = ?auto_630947 ?auto_630953 ) ) ( not ( = ?auto_630947 ?auto_630954 ) ) ( not ( = ?auto_630947 ?auto_630955 ) ) ( not ( = ?auto_630947 ?auto_630956 ) ) ( not ( = ?auto_630944 ?auto_630948 ) ) ( not ( = ?auto_630944 ?auto_630950 ) ) ( not ( = ?auto_630944 ?auto_630949 ) ) ( not ( = ?auto_630944 ?auto_630951 ) ) ( not ( = ?auto_630944 ?auto_630952 ) ) ( not ( = ?auto_630944 ?auto_630953 ) ) ( not ( = ?auto_630944 ?auto_630954 ) ) ( not ( = ?auto_630944 ?auto_630955 ) ) ( not ( = ?auto_630944 ?auto_630956 ) ) ( not ( = ?auto_630948 ?auto_630950 ) ) ( not ( = ?auto_630948 ?auto_630949 ) ) ( not ( = ?auto_630948 ?auto_630951 ) ) ( not ( = ?auto_630948 ?auto_630952 ) ) ( not ( = ?auto_630948 ?auto_630953 ) ) ( not ( = ?auto_630948 ?auto_630954 ) ) ( not ( = ?auto_630948 ?auto_630955 ) ) ( not ( = ?auto_630948 ?auto_630956 ) ) ( not ( = ?auto_630950 ?auto_630949 ) ) ( not ( = ?auto_630950 ?auto_630951 ) ) ( not ( = ?auto_630950 ?auto_630952 ) ) ( not ( = ?auto_630950 ?auto_630953 ) ) ( not ( = ?auto_630950 ?auto_630954 ) ) ( not ( = ?auto_630950 ?auto_630955 ) ) ( not ( = ?auto_630950 ?auto_630956 ) ) ( not ( = ?auto_630949 ?auto_630951 ) ) ( not ( = ?auto_630949 ?auto_630952 ) ) ( not ( = ?auto_630949 ?auto_630953 ) ) ( not ( = ?auto_630949 ?auto_630954 ) ) ( not ( = ?auto_630949 ?auto_630955 ) ) ( not ( = ?auto_630949 ?auto_630956 ) ) ( not ( = ?auto_630951 ?auto_630952 ) ) ( not ( = ?auto_630951 ?auto_630953 ) ) ( not ( = ?auto_630951 ?auto_630954 ) ) ( not ( = ?auto_630951 ?auto_630955 ) ) ( not ( = ?auto_630951 ?auto_630956 ) ) ( not ( = ?auto_630952 ?auto_630953 ) ) ( not ( = ?auto_630952 ?auto_630954 ) ) ( not ( = ?auto_630952 ?auto_630955 ) ) ( not ( = ?auto_630952 ?auto_630956 ) ) ( not ( = ?auto_630953 ?auto_630954 ) ) ( not ( = ?auto_630953 ?auto_630955 ) ) ( not ( = ?auto_630953 ?auto_630956 ) ) ( not ( = ?auto_630954 ?auto_630955 ) ) ( not ( = ?auto_630954 ?auto_630956 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_630955 ?auto_630956 )
      ( MAKE-12CRATE-VERIFY ?auto_630945 ?auto_630946 ?auto_630947 ?auto_630944 ?auto_630948 ?auto_630950 ?auto_630949 ?auto_630951 ?auto_630952 ?auto_630953 ?auto_630954 ?auto_630955 ?auto_630956 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_631070 - SURFACE
      ?auto_631071 - SURFACE
      ?auto_631072 - SURFACE
      ?auto_631069 - SURFACE
      ?auto_631073 - SURFACE
      ?auto_631075 - SURFACE
      ?auto_631074 - SURFACE
      ?auto_631076 - SURFACE
      ?auto_631077 - SURFACE
      ?auto_631078 - SURFACE
      ?auto_631079 - SURFACE
      ?auto_631080 - SURFACE
      ?auto_631081 - SURFACE
    )
    :vars
    (
      ?auto_631084 - HOIST
      ?auto_631082 - PLACE
      ?auto_631083 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631084 ?auto_631082 ) ( SURFACE-AT ?auto_631080 ?auto_631082 ) ( CLEAR ?auto_631080 ) ( IS-CRATE ?auto_631081 ) ( not ( = ?auto_631080 ?auto_631081 ) ) ( TRUCK-AT ?auto_631083 ?auto_631082 ) ( AVAILABLE ?auto_631084 ) ( IN ?auto_631081 ?auto_631083 ) ( ON ?auto_631080 ?auto_631079 ) ( not ( = ?auto_631079 ?auto_631080 ) ) ( not ( = ?auto_631079 ?auto_631081 ) ) ( ON ?auto_631071 ?auto_631070 ) ( ON ?auto_631072 ?auto_631071 ) ( ON ?auto_631069 ?auto_631072 ) ( ON ?auto_631073 ?auto_631069 ) ( ON ?auto_631075 ?auto_631073 ) ( ON ?auto_631074 ?auto_631075 ) ( ON ?auto_631076 ?auto_631074 ) ( ON ?auto_631077 ?auto_631076 ) ( ON ?auto_631078 ?auto_631077 ) ( ON ?auto_631079 ?auto_631078 ) ( not ( = ?auto_631070 ?auto_631071 ) ) ( not ( = ?auto_631070 ?auto_631072 ) ) ( not ( = ?auto_631070 ?auto_631069 ) ) ( not ( = ?auto_631070 ?auto_631073 ) ) ( not ( = ?auto_631070 ?auto_631075 ) ) ( not ( = ?auto_631070 ?auto_631074 ) ) ( not ( = ?auto_631070 ?auto_631076 ) ) ( not ( = ?auto_631070 ?auto_631077 ) ) ( not ( = ?auto_631070 ?auto_631078 ) ) ( not ( = ?auto_631070 ?auto_631079 ) ) ( not ( = ?auto_631070 ?auto_631080 ) ) ( not ( = ?auto_631070 ?auto_631081 ) ) ( not ( = ?auto_631071 ?auto_631072 ) ) ( not ( = ?auto_631071 ?auto_631069 ) ) ( not ( = ?auto_631071 ?auto_631073 ) ) ( not ( = ?auto_631071 ?auto_631075 ) ) ( not ( = ?auto_631071 ?auto_631074 ) ) ( not ( = ?auto_631071 ?auto_631076 ) ) ( not ( = ?auto_631071 ?auto_631077 ) ) ( not ( = ?auto_631071 ?auto_631078 ) ) ( not ( = ?auto_631071 ?auto_631079 ) ) ( not ( = ?auto_631071 ?auto_631080 ) ) ( not ( = ?auto_631071 ?auto_631081 ) ) ( not ( = ?auto_631072 ?auto_631069 ) ) ( not ( = ?auto_631072 ?auto_631073 ) ) ( not ( = ?auto_631072 ?auto_631075 ) ) ( not ( = ?auto_631072 ?auto_631074 ) ) ( not ( = ?auto_631072 ?auto_631076 ) ) ( not ( = ?auto_631072 ?auto_631077 ) ) ( not ( = ?auto_631072 ?auto_631078 ) ) ( not ( = ?auto_631072 ?auto_631079 ) ) ( not ( = ?auto_631072 ?auto_631080 ) ) ( not ( = ?auto_631072 ?auto_631081 ) ) ( not ( = ?auto_631069 ?auto_631073 ) ) ( not ( = ?auto_631069 ?auto_631075 ) ) ( not ( = ?auto_631069 ?auto_631074 ) ) ( not ( = ?auto_631069 ?auto_631076 ) ) ( not ( = ?auto_631069 ?auto_631077 ) ) ( not ( = ?auto_631069 ?auto_631078 ) ) ( not ( = ?auto_631069 ?auto_631079 ) ) ( not ( = ?auto_631069 ?auto_631080 ) ) ( not ( = ?auto_631069 ?auto_631081 ) ) ( not ( = ?auto_631073 ?auto_631075 ) ) ( not ( = ?auto_631073 ?auto_631074 ) ) ( not ( = ?auto_631073 ?auto_631076 ) ) ( not ( = ?auto_631073 ?auto_631077 ) ) ( not ( = ?auto_631073 ?auto_631078 ) ) ( not ( = ?auto_631073 ?auto_631079 ) ) ( not ( = ?auto_631073 ?auto_631080 ) ) ( not ( = ?auto_631073 ?auto_631081 ) ) ( not ( = ?auto_631075 ?auto_631074 ) ) ( not ( = ?auto_631075 ?auto_631076 ) ) ( not ( = ?auto_631075 ?auto_631077 ) ) ( not ( = ?auto_631075 ?auto_631078 ) ) ( not ( = ?auto_631075 ?auto_631079 ) ) ( not ( = ?auto_631075 ?auto_631080 ) ) ( not ( = ?auto_631075 ?auto_631081 ) ) ( not ( = ?auto_631074 ?auto_631076 ) ) ( not ( = ?auto_631074 ?auto_631077 ) ) ( not ( = ?auto_631074 ?auto_631078 ) ) ( not ( = ?auto_631074 ?auto_631079 ) ) ( not ( = ?auto_631074 ?auto_631080 ) ) ( not ( = ?auto_631074 ?auto_631081 ) ) ( not ( = ?auto_631076 ?auto_631077 ) ) ( not ( = ?auto_631076 ?auto_631078 ) ) ( not ( = ?auto_631076 ?auto_631079 ) ) ( not ( = ?auto_631076 ?auto_631080 ) ) ( not ( = ?auto_631076 ?auto_631081 ) ) ( not ( = ?auto_631077 ?auto_631078 ) ) ( not ( = ?auto_631077 ?auto_631079 ) ) ( not ( = ?auto_631077 ?auto_631080 ) ) ( not ( = ?auto_631077 ?auto_631081 ) ) ( not ( = ?auto_631078 ?auto_631079 ) ) ( not ( = ?auto_631078 ?auto_631080 ) ) ( not ( = ?auto_631078 ?auto_631081 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631079 ?auto_631080 ?auto_631081 )
      ( MAKE-12CRATE-VERIFY ?auto_631070 ?auto_631071 ?auto_631072 ?auto_631069 ?auto_631073 ?auto_631075 ?auto_631074 ?auto_631076 ?auto_631077 ?auto_631078 ?auto_631079 ?auto_631080 ?auto_631081 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_631208 - SURFACE
      ?auto_631209 - SURFACE
      ?auto_631210 - SURFACE
      ?auto_631207 - SURFACE
      ?auto_631211 - SURFACE
      ?auto_631213 - SURFACE
      ?auto_631212 - SURFACE
      ?auto_631214 - SURFACE
      ?auto_631215 - SURFACE
      ?auto_631216 - SURFACE
      ?auto_631217 - SURFACE
      ?auto_631218 - SURFACE
      ?auto_631219 - SURFACE
    )
    :vars
    (
      ?auto_631220 - HOIST
      ?auto_631221 - PLACE
      ?auto_631222 - TRUCK
      ?auto_631223 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_631220 ?auto_631221 ) ( SURFACE-AT ?auto_631218 ?auto_631221 ) ( CLEAR ?auto_631218 ) ( IS-CRATE ?auto_631219 ) ( not ( = ?auto_631218 ?auto_631219 ) ) ( AVAILABLE ?auto_631220 ) ( IN ?auto_631219 ?auto_631222 ) ( ON ?auto_631218 ?auto_631217 ) ( not ( = ?auto_631217 ?auto_631218 ) ) ( not ( = ?auto_631217 ?auto_631219 ) ) ( TRUCK-AT ?auto_631222 ?auto_631223 ) ( not ( = ?auto_631223 ?auto_631221 ) ) ( ON ?auto_631209 ?auto_631208 ) ( ON ?auto_631210 ?auto_631209 ) ( ON ?auto_631207 ?auto_631210 ) ( ON ?auto_631211 ?auto_631207 ) ( ON ?auto_631213 ?auto_631211 ) ( ON ?auto_631212 ?auto_631213 ) ( ON ?auto_631214 ?auto_631212 ) ( ON ?auto_631215 ?auto_631214 ) ( ON ?auto_631216 ?auto_631215 ) ( ON ?auto_631217 ?auto_631216 ) ( not ( = ?auto_631208 ?auto_631209 ) ) ( not ( = ?auto_631208 ?auto_631210 ) ) ( not ( = ?auto_631208 ?auto_631207 ) ) ( not ( = ?auto_631208 ?auto_631211 ) ) ( not ( = ?auto_631208 ?auto_631213 ) ) ( not ( = ?auto_631208 ?auto_631212 ) ) ( not ( = ?auto_631208 ?auto_631214 ) ) ( not ( = ?auto_631208 ?auto_631215 ) ) ( not ( = ?auto_631208 ?auto_631216 ) ) ( not ( = ?auto_631208 ?auto_631217 ) ) ( not ( = ?auto_631208 ?auto_631218 ) ) ( not ( = ?auto_631208 ?auto_631219 ) ) ( not ( = ?auto_631209 ?auto_631210 ) ) ( not ( = ?auto_631209 ?auto_631207 ) ) ( not ( = ?auto_631209 ?auto_631211 ) ) ( not ( = ?auto_631209 ?auto_631213 ) ) ( not ( = ?auto_631209 ?auto_631212 ) ) ( not ( = ?auto_631209 ?auto_631214 ) ) ( not ( = ?auto_631209 ?auto_631215 ) ) ( not ( = ?auto_631209 ?auto_631216 ) ) ( not ( = ?auto_631209 ?auto_631217 ) ) ( not ( = ?auto_631209 ?auto_631218 ) ) ( not ( = ?auto_631209 ?auto_631219 ) ) ( not ( = ?auto_631210 ?auto_631207 ) ) ( not ( = ?auto_631210 ?auto_631211 ) ) ( not ( = ?auto_631210 ?auto_631213 ) ) ( not ( = ?auto_631210 ?auto_631212 ) ) ( not ( = ?auto_631210 ?auto_631214 ) ) ( not ( = ?auto_631210 ?auto_631215 ) ) ( not ( = ?auto_631210 ?auto_631216 ) ) ( not ( = ?auto_631210 ?auto_631217 ) ) ( not ( = ?auto_631210 ?auto_631218 ) ) ( not ( = ?auto_631210 ?auto_631219 ) ) ( not ( = ?auto_631207 ?auto_631211 ) ) ( not ( = ?auto_631207 ?auto_631213 ) ) ( not ( = ?auto_631207 ?auto_631212 ) ) ( not ( = ?auto_631207 ?auto_631214 ) ) ( not ( = ?auto_631207 ?auto_631215 ) ) ( not ( = ?auto_631207 ?auto_631216 ) ) ( not ( = ?auto_631207 ?auto_631217 ) ) ( not ( = ?auto_631207 ?auto_631218 ) ) ( not ( = ?auto_631207 ?auto_631219 ) ) ( not ( = ?auto_631211 ?auto_631213 ) ) ( not ( = ?auto_631211 ?auto_631212 ) ) ( not ( = ?auto_631211 ?auto_631214 ) ) ( not ( = ?auto_631211 ?auto_631215 ) ) ( not ( = ?auto_631211 ?auto_631216 ) ) ( not ( = ?auto_631211 ?auto_631217 ) ) ( not ( = ?auto_631211 ?auto_631218 ) ) ( not ( = ?auto_631211 ?auto_631219 ) ) ( not ( = ?auto_631213 ?auto_631212 ) ) ( not ( = ?auto_631213 ?auto_631214 ) ) ( not ( = ?auto_631213 ?auto_631215 ) ) ( not ( = ?auto_631213 ?auto_631216 ) ) ( not ( = ?auto_631213 ?auto_631217 ) ) ( not ( = ?auto_631213 ?auto_631218 ) ) ( not ( = ?auto_631213 ?auto_631219 ) ) ( not ( = ?auto_631212 ?auto_631214 ) ) ( not ( = ?auto_631212 ?auto_631215 ) ) ( not ( = ?auto_631212 ?auto_631216 ) ) ( not ( = ?auto_631212 ?auto_631217 ) ) ( not ( = ?auto_631212 ?auto_631218 ) ) ( not ( = ?auto_631212 ?auto_631219 ) ) ( not ( = ?auto_631214 ?auto_631215 ) ) ( not ( = ?auto_631214 ?auto_631216 ) ) ( not ( = ?auto_631214 ?auto_631217 ) ) ( not ( = ?auto_631214 ?auto_631218 ) ) ( not ( = ?auto_631214 ?auto_631219 ) ) ( not ( = ?auto_631215 ?auto_631216 ) ) ( not ( = ?auto_631215 ?auto_631217 ) ) ( not ( = ?auto_631215 ?auto_631218 ) ) ( not ( = ?auto_631215 ?auto_631219 ) ) ( not ( = ?auto_631216 ?auto_631217 ) ) ( not ( = ?auto_631216 ?auto_631218 ) ) ( not ( = ?auto_631216 ?auto_631219 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631217 ?auto_631218 ?auto_631219 )
      ( MAKE-12CRATE-VERIFY ?auto_631208 ?auto_631209 ?auto_631210 ?auto_631207 ?auto_631211 ?auto_631213 ?auto_631212 ?auto_631214 ?auto_631215 ?auto_631216 ?auto_631217 ?auto_631218 ?auto_631219 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_631358 - SURFACE
      ?auto_631359 - SURFACE
      ?auto_631360 - SURFACE
      ?auto_631357 - SURFACE
      ?auto_631361 - SURFACE
      ?auto_631363 - SURFACE
      ?auto_631362 - SURFACE
      ?auto_631364 - SURFACE
      ?auto_631365 - SURFACE
      ?auto_631366 - SURFACE
      ?auto_631367 - SURFACE
      ?auto_631368 - SURFACE
      ?auto_631369 - SURFACE
    )
    :vars
    (
      ?auto_631374 - HOIST
      ?auto_631371 - PLACE
      ?auto_631373 - TRUCK
      ?auto_631372 - PLACE
      ?auto_631370 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_631374 ?auto_631371 ) ( SURFACE-AT ?auto_631368 ?auto_631371 ) ( CLEAR ?auto_631368 ) ( IS-CRATE ?auto_631369 ) ( not ( = ?auto_631368 ?auto_631369 ) ) ( AVAILABLE ?auto_631374 ) ( ON ?auto_631368 ?auto_631367 ) ( not ( = ?auto_631367 ?auto_631368 ) ) ( not ( = ?auto_631367 ?auto_631369 ) ) ( TRUCK-AT ?auto_631373 ?auto_631372 ) ( not ( = ?auto_631372 ?auto_631371 ) ) ( HOIST-AT ?auto_631370 ?auto_631372 ) ( LIFTING ?auto_631370 ?auto_631369 ) ( not ( = ?auto_631374 ?auto_631370 ) ) ( ON ?auto_631359 ?auto_631358 ) ( ON ?auto_631360 ?auto_631359 ) ( ON ?auto_631357 ?auto_631360 ) ( ON ?auto_631361 ?auto_631357 ) ( ON ?auto_631363 ?auto_631361 ) ( ON ?auto_631362 ?auto_631363 ) ( ON ?auto_631364 ?auto_631362 ) ( ON ?auto_631365 ?auto_631364 ) ( ON ?auto_631366 ?auto_631365 ) ( ON ?auto_631367 ?auto_631366 ) ( not ( = ?auto_631358 ?auto_631359 ) ) ( not ( = ?auto_631358 ?auto_631360 ) ) ( not ( = ?auto_631358 ?auto_631357 ) ) ( not ( = ?auto_631358 ?auto_631361 ) ) ( not ( = ?auto_631358 ?auto_631363 ) ) ( not ( = ?auto_631358 ?auto_631362 ) ) ( not ( = ?auto_631358 ?auto_631364 ) ) ( not ( = ?auto_631358 ?auto_631365 ) ) ( not ( = ?auto_631358 ?auto_631366 ) ) ( not ( = ?auto_631358 ?auto_631367 ) ) ( not ( = ?auto_631358 ?auto_631368 ) ) ( not ( = ?auto_631358 ?auto_631369 ) ) ( not ( = ?auto_631359 ?auto_631360 ) ) ( not ( = ?auto_631359 ?auto_631357 ) ) ( not ( = ?auto_631359 ?auto_631361 ) ) ( not ( = ?auto_631359 ?auto_631363 ) ) ( not ( = ?auto_631359 ?auto_631362 ) ) ( not ( = ?auto_631359 ?auto_631364 ) ) ( not ( = ?auto_631359 ?auto_631365 ) ) ( not ( = ?auto_631359 ?auto_631366 ) ) ( not ( = ?auto_631359 ?auto_631367 ) ) ( not ( = ?auto_631359 ?auto_631368 ) ) ( not ( = ?auto_631359 ?auto_631369 ) ) ( not ( = ?auto_631360 ?auto_631357 ) ) ( not ( = ?auto_631360 ?auto_631361 ) ) ( not ( = ?auto_631360 ?auto_631363 ) ) ( not ( = ?auto_631360 ?auto_631362 ) ) ( not ( = ?auto_631360 ?auto_631364 ) ) ( not ( = ?auto_631360 ?auto_631365 ) ) ( not ( = ?auto_631360 ?auto_631366 ) ) ( not ( = ?auto_631360 ?auto_631367 ) ) ( not ( = ?auto_631360 ?auto_631368 ) ) ( not ( = ?auto_631360 ?auto_631369 ) ) ( not ( = ?auto_631357 ?auto_631361 ) ) ( not ( = ?auto_631357 ?auto_631363 ) ) ( not ( = ?auto_631357 ?auto_631362 ) ) ( not ( = ?auto_631357 ?auto_631364 ) ) ( not ( = ?auto_631357 ?auto_631365 ) ) ( not ( = ?auto_631357 ?auto_631366 ) ) ( not ( = ?auto_631357 ?auto_631367 ) ) ( not ( = ?auto_631357 ?auto_631368 ) ) ( not ( = ?auto_631357 ?auto_631369 ) ) ( not ( = ?auto_631361 ?auto_631363 ) ) ( not ( = ?auto_631361 ?auto_631362 ) ) ( not ( = ?auto_631361 ?auto_631364 ) ) ( not ( = ?auto_631361 ?auto_631365 ) ) ( not ( = ?auto_631361 ?auto_631366 ) ) ( not ( = ?auto_631361 ?auto_631367 ) ) ( not ( = ?auto_631361 ?auto_631368 ) ) ( not ( = ?auto_631361 ?auto_631369 ) ) ( not ( = ?auto_631363 ?auto_631362 ) ) ( not ( = ?auto_631363 ?auto_631364 ) ) ( not ( = ?auto_631363 ?auto_631365 ) ) ( not ( = ?auto_631363 ?auto_631366 ) ) ( not ( = ?auto_631363 ?auto_631367 ) ) ( not ( = ?auto_631363 ?auto_631368 ) ) ( not ( = ?auto_631363 ?auto_631369 ) ) ( not ( = ?auto_631362 ?auto_631364 ) ) ( not ( = ?auto_631362 ?auto_631365 ) ) ( not ( = ?auto_631362 ?auto_631366 ) ) ( not ( = ?auto_631362 ?auto_631367 ) ) ( not ( = ?auto_631362 ?auto_631368 ) ) ( not ( = ?auto_631362 ?auto_631369 ) ) ( not ( = ?auto_631364 ?auto_631365 ) ) ( not ( = ?auto_631364 ?auto_631366 ) ) ( not ( = ?auto_631364 ?auto_631367 ) ) ( not ( = ?auto_631364 ?auto_631368 ) ) ( not ( = ?auto_631364 ?auto_631369 ) ) ( not ( = ?auto_631365 ?auto_631366 ) ) ( not ( = ?auto_631365 ?auto_631367 ) ) ( not ( = ?auto_631365 ?auto_631368 ) ) ( not ( = ?auto_631365 ?auto_631369 ) ) ( not ( = ?auto_631366 ?auto_631367 ) ) ( not ( = ?auto_631366 ?auto_631368 ) ) ( not ( = ?auto_631366 ?auto_631369 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631367 ?auto_631368 ?auto_631369 )
      ( MAKE-12CRATE-VERIFY ?auto_631358 ?auto_631359 ?auto_631360 ?auto_631357 ?auto_631361 ?auto_631363 ?auto_631362 ?auto_631364 ?auto_631365 ?auto_631366 ?auto_631367 ?auto_631368 ?auto_631369 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_631520 - SURFACE
      ?auto_631521 - SURFACE
      ?auto_631522 - SURFACE
      ?auto_631519 - SURFACE
      ?auto_631523 - SURFACE
      ?auto_631525 - SURFACE
      ?auto_631524 - SURFACE
      ?auto_631526 - SURFACE
      ?auto_631527 - SURFACE
      ?auto_631528 - SURFACE
      ?auto_631529 - SURFACE
      ?auto_631530 - SURFACE
      ?auto_631531 - SURFACE
    )
    :vars
    (
      ?auto_631534 - HOIST
      ?auto_631533 - PLACE
      ?auto_631536 - TRUCK
      ?auto_631532 - PLACE
      ?auto_631537 - HOIST
      ?auto_631535 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_631534 ?auto_631533 ) ( SURFACE-AT ?auto_631530 ?auto_631533 ) ( CLEAR ?auto_631530 ) ( IS-CRATE ?auto_631531 ) ( not ( = ?auto_631530 ?auto_631531 ) ) ( AVAILABLE ?auto_631534 ) ( ON ?auto_631530 ?auto_631529 ) ( not ( = ?auto_631529 ?auto_631530 ) ) ( not ( = ?auto_631529 ?auto_631531 ) ) ( TRUCK-AT ?auto_631536 ?auto_631532 ) ( not ( = ?auto_631532 ?auto_631533 ) ) ( HOIST-AT ?auto_631537 ?auto_631532 ) ( not ( = ?auto_631534 ?auto_631537 ) ) ( AVAILABLE ?auto_631537 ) ( SURFACE-AT ?auto_631531 ?auto_631532 ) ( ON ?auto_631531 ?auto_631535 ) ( CLEAR ?auto_631531 ) ( not ( = ?auto_631530 ?auto_631535 ) ) ( not ( = ?auto_631531 ?auto_631535 ) ) ( not ( = ?auto_631529 ?auto_631535 ) ) ( ON ?auto_631521 ?auto_631520 ) ( ON ?auto_631522 ?auto_631521 ) ( ON ?auto_631519 ?auto_631522 ) ( ON ?auto_631523 ?auto_631519 ) ( ON ?auto_631525 ?auto_631523 ) ( ON ?auto_631524 ?auto_631525 ) ( ON ?auto_631526 ?auto_631524 ) ( ON ?auto_631527 ?auto_631526 ) ( ON ?auto_631528 ?auto_631527 ) ( ON ?auto_631529 ?auto_631528 ) ( not ( = ?auto_631520 ?auto_631521 ) ) ( not ( = ?auto_631520 ?auto_631522 ) ) ( not ( = ?auto_631520 ?auto_631519 ) ) ( not ( = ?auto_631520 ?auto_631523 ) ) ( not ( = ?auto_631520 ?auto_631525 ) ) ( not ( = ?auto_631520 ?auto_631524 ) ) ( not ( = ?auto_631520 ?auto_631526 ) ) ( not ( = ?auto_631520 ?auto_631527 ) ) ( not ( = ?auto_631520 ?auto_631528 ) ) ( not ( = ?auto_631520 ?auto_631529 ) ) ( not ( = ?auto_631520 ?auto_631530 ) ) ( not ( = ?auto_631520 ?auto_631531 ) ) ( not ( = ?auto_631520 ?auto_631535 ) ) ( not ( = ?auto_631521 ?auto_631522 ) ) ( not ( = ?auto_631521 ?auto_631519 ) ) ( not ( = ?auto_631521 ?auto_631523 ) ) ( not ( = ?auto_631521 ?auto_631525 ) ) ( not ( = ?auto_631521 ?auto_631524 ) ) ( not ( = ?auto_631521 ?auto_631526 ) ) ( not ( = ?auto_631521 ?auto_631527 ) ) ( not ( = ?auto_631521 ?auto_631528 ) ) ( not ( = ?auto_631521 ?auto_631529 ) ) ( not ( = ?auto_631521 ?auto_631530 ) ) ( not ( = ?auto_631521 ?auto_631531 ) ) ( not ( = ?auto_631521 ?auto_631535 ) ) ( not ( = ?auto_631522 ?auto_631519 ) ) ( not ( = ?auto_631522 ?auto_631523 ) ) ( not ( = ?auto_631522 ?auto_631525 ) ) ( not ( = ?auto_631522 ?auto_631524 ) ) ( not ( = ?auto_631522 ?auto_631526 ) ) ( not ( = ?auto_631522 ?auto_631527 ) ) ( not ( = ?auto_631522 ?auto_631528 ) ) ( not ( = ?auto_631522 ?auto_631529 ) ) ( not ( = ?auto_631522 ?auto_631530 ) ) ( not ( = ?auto_631522 ?auto_631531 ) ) ( not ( = ?auto_631522 ?auto_631535 ) ) ( not ( = ?auto_631519 ?auto_631523 ) ) ( not ( = ?auto_631519 ?auto_631525 ) ) ( not ( = ?auto_631519 ?auto_631524 ) ) ( not ( = ?auto_631519 ?auto_631526 ) ) ( not ( = ?auto_631519 ?auto_631527 ) ) ( not ( = ?auto_631519 ?auto_631528 ) ) ( not ( = ?auto_631519 ?auto_631529 ) ) ( not ( = ?auto_631519 ?auto_631530 ) ) ( not ( = ?auto_631519 ?auto_631531 ) ) ( not ( = ?auto_631519 ?auto_631535 ) ) ( not ( = ?auto_631523 ?auto_631525 ) ) ( not ( = ?auto_631523 ?auto_631524 ) ) ( not ( = ?auto_631523 ?auto_631526 ) ) ( not ( = ?auto_631523 ?auto_631527 ) ) ( not ( = ?auto_631523 ?auto_631528 ) ) ( not ( = ?auto_631523 ?auto_631529 ) ) ( not ( = ?auto_631523 ?auto_631530 ) ) ( not ( = ?auto_631523 ?auto_631531 ) ) ( not ( = ?auto_631523 ?auto_631535 ) ) ( not ( = ?auto_631525 ?auto_631524 ) ) ( not ( = ?auto_631525 ?auto_631526 ) ) ( not ( = ?auto_631525 ?auto_631527 ) ) ( not ( = ?auto_631525 ?auto_631528 ) ) ( not ( = ?auto_631525 ?auto_631529 ) ) ( not ( = ?auto_631525 ?auto_631530 ) ) ( not ( = ?auto_631525 ?auto_631531 ) ) ( not ( = ?auto_631525 ?auto_631535 ) ) ( not ( = ?auto_631524 ?auto_631526 ) ) ( not ( = ?auto_631524 ?auto_631527 ) ) ( not ( = ?auto_631524 ?auto_631528 ) ) ( not ( = ?auto_631524 ?auto_631529 ) ) ( not ( = ?auto_631524 ?auto_631530 ) ) ( not ( = ?auto_631524 ?auto_631531 ) ) ( not ( = ?auto_631524 ?auto_631535 ) ) ( not ( = ?auto_631526 ?auto_631527 ) ) ( not ( = ?auto_631526 ?auto_631528 ) ) ( not ( = ?auto_631526 ?auto_631529 ) ) ( not ( = ?auto_631526 ?auto_631530 ) ) ( not ( = ?auto_631526 ?auto_631531 ) ) ( not ( = ?auto_631526 ?auto_631535 ) ) ( not ( = ?auto_631527 ?auto_631528 ) ) ( not ( = ?auto_631527 ?auto_631529 ) ) ( not ( = ?auto_631527 ?auto_631530 ) ) ( not ( = ?auto_631527 ?auto_631531 ) ) ( not ( = ?auto_631527 ?auto_631535 ) ) ( not ( = ?auto_631528 ?auto_631529 ) ) ( not ( = ?auto_631528 ?auto_631530 ) ) ( not ( = ?auto_631528 ?auto_631531 ) ) ( not ( = ?auto_631528 ?auto_631535 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631529 ?auto_631530 ?auto_631531 )
      ( MAKE-12CRATE-VERIFY ?auto_631520 ?auto_631521 ?auto_631522 ?auto_631519 ?auto_631523 ?auto_631525 ?auto_631524 ?auto_631526 ?auto_631527 ?auto_631528 ?auto_631529 ?auto_631530 ?auto_631531 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_631683 - SURFACE
      ?auto_631684 - SURFACE
      ?auto_631685 - SURFACE
      ?auto_631682 - SURFACE
      ?auto_631686 - SURFACE
      ?auto_631688 - SURFACE
      ?auto_631687 - SURFACE
      ?auto_631689 - SURFACE
      ?auto_631690 - SURFACE
      ?auto_631691 - SURFACE
      ?auto_631692 - SURFACE
      ?auto_631693 - SURFACE
      ?auto_631694 - SURFACE
    )
    :vars
    (
      ?auto_631698 - HOIST
      ?auto_631699 - PLACE
      ?auto_631700 - PLACE
      ?auto_631696 - HOIST
      ?auto_631697 - SURFACE
      ?auto_631695 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631698 ?auto_631699 ) ( SURFACE-AT ?auto_631693 ?auto_631699 ) ( CLEAR ?auto_631693 ) ( IS-CRATE ?auto_631694 ) ( not ( = ?auto_631693 ?auto_631694 ) ) ( AVAILABLE ?auto_631698 ) ( ON ?auto_631693 ?auto_631692 ) ( not ( = ?auto_631692 ?auto_631693 ) ) ( not ( = ?auto_631692 ?auto_631694 ) ) ( not ( = ?auto_631700 ?auto_631699 ) ) ( HOIST-AT ?auto_631696 ?auto_631700 ) ( not ( = ?auto_631698 ?auto_631696 ) ) ( AVAILABLE ?auto_631696 ) ( SURFACE-AT ?auto_631694 ?auto_631700 ) ( ON ?auto_631694 ?auto_631697 ) ( CLEAR ?auto_631694 ) ( not ( = ?auto_631693 ?auto_631697 ) ) ( not ( = ?auto_631694 ?auto_631697 ) ) ( not ( = ?auto_631692 ?auto_631697 ) ) ( TRUCK-AT ?auto_631695 ?auto_631699 ) ( ON ?auto_631684 ?auto_631683 ) ( ON ?auto_631685 ?auto_631684 ) ( ON ?auto_631682 ?auto_631685 ) ( ON ?auto_631686 ?auto_631682 ) ( ON ?auto_631688 ?auto_631686 ) ( ON ?auto_631687 ?auto_631688 ) ( ON ?auto_631689 ?auto_631687 ) ( ON ?auto_631690 ?auto_631689 ) ( ON ?auto_631691 ?auto_631690 ) ( ON ?auto_631692 ?auto_631691 ) ( not ( = ?auto_631683 ?auto_631684 ) ) ( not ( = ?auto_631683 ?auto_631685 ) ) ( not ( = ?auto_631683 ?auto_631682 ) ) ( not ( = ?auto_631683 ?auto_631686 ) ) ( not ( = ?auto_631683 ?auto_631688 ) ) ( not ( = ?auto_631683 ?auto_631687 ) ) ( not ( = ?auto_631683 ?auto_631689 ) ) ( not ( = ?auto_631683 ?auto_631690 ) ) ( not ( = ?auto_631683 ?auto_631691 ) ) ( not ( = ?auto_631683 ?auto_631692 ) ) ( not ( = ?auto_631683 ?auto_631693 ) ) ( not ( = ?auto_631683 ?auto_631694 ) ) ( not ( = ?auto_631683 ?auto_631697 ) ) ( not ( = ?auto_631684 ?auto_631685 ) ) ( not ( = ?auto_631684 ?auto_631682 ) ) ( not ( = ?auto_631684 ?auto_631686 ) ) ( not ( = ?auto_631684 ?auto_631688 ) ) ( not ( = ?auto_631684 ?auto_631687 ) ) ( not ( = ?auto_631684 ?auto_631689 ) ) ( not ( = ?auto_631684 ?auto_631690 ) ) ( not ( = ?auto_631684 ?auto_631691 ) ) ( not ( = ?auto_631684 ?auto_631692 ) ) ( not ( = ?auto_631684 ?auto_631693 ) ) ( not ( = ?auto_631684 ?auto_631694 ) ) ( not ( = ?auto_631684 ?auto_631697 ) ) ( not ( = ?auto_631685 ?auto_631682 ) ) ( not ( = ?auto_631685 ?auto_631686 ) ) ( not ( = ?auto_631685 ?auto_631688 ) ) ( not ( = ?auto_631685 ?auto_631687 ) ) ( not ( = ?auto_631685 ?auto_631689 ) ) ( not ( = ?auto_631685 ?auto_631690 ) ) ( not ( = ?auto_631685 ?auto_631691 ) ) ( not ( = ?auto_631685 ?auto_631692 ) ) ( not ( = ?auto_631685 ?auto_631693 ) ) ( not ( = ?auto_631685 ?auto_631694 ) ) ( not ( = ?auto_631685 ?auto_631697 ) ) ( not ( = ?auto_631682 ?auto_631686 ) ) ( not ( = ?auto_631682 ?auto_631688 ) ) ( not ( = ?auto_631682 ?auto_631687 ) ) ( not ( = ?auto_631682 ?auto_631689 ) ) ( not ( = ?auto_631682 ?auto_631690 ) ) ( not ( = ?auto_631682 ?auto_631691 ) ) ( not ( = ?auto_631682 ?auto_631692 ) ) ( not ( = ?auto_631682 ?auto_631693 ) ) ( not ( = ?auto_631682 ?auto_631694 ) ) ( not ( = ?auto_631682 ?auto_631697 ) ) ( not ( = ?auto_631686 ?auto_631688 ) ) ( not ( = ?auto_631686 ?auto_631687 ) ) ( not ( = ?auto_631686 ?auto_631689 ) ) ( not ( = ?auto_631686 ?auto_631690 ) ) ( not ( = ?auto_631686 ?auto_631691 ) ) ( not ( = ?auto_631686 ?auto_631692 ) ) ( not ( = ?auto_631686 ?auto_631693 ) ) ( not ( = ?auto_631686 ?auto_631694 ) ) ( not ( = ?auto_631686 ?auto_631697 ) ) ( not ( = ?auto_631688 ?auto_631687 ) ) ( not ( = ?auto_631688 ?auto_631689 ) ) ( not ( = ?auto_631688 ?auto_631690 ) ) ( not ( = ?auto_631688 ?auto_631691 ) ) ( not ( = ?auto_631688 ?auto_631692 ) ) ( not ( = ?auto_631688 ?auto_631693 ) ) ( not ( = ?auto_631688 ?auto_631694 ) ) ( not ( = ?auto_631688 ?auto_631697 ) ) ( not ( = ?auto_631687 ?auto_631689 ) ) ( not ( = ?auto_631687 ?auto_631690 ) ) ( not ( = ?auto_631687 ?auto_631691 ) ) ( not ( = ?auto_631687 ?auto_631692 ) ) ( not ( = ?auto_631687 ?auto_631693 ) ) ( not ( = ?auto_631687 ?auto_631694 ) ) ( not ( = ?auto_631687 ?auto_631697 ) ) ( not ( = ?auto_631689 ?auto_631690 ) ) ( not ( = ?auto_631689 ?auto_631691 ) ) ( not ( = ?auto_631689 ?auto_631692 ) ) ( not ( = ?auto_631689 ?auto_631693 ) ) ( not ( = ?auto_631689 ?auto_631694 ) ) ( not ( = ?auto_631689 ?auto_631697 ) ) ( not ( = ?auto_631690 ?auto_631691 ) ) ( not ( = ?auto_631690 ?auto_631692 ) ) ( not ( = ?auto_631690 ?auto_631693 ) ) ( not ( = ?auto_631690 ?auto_631694 ) ) ( not ( = ?auto_631690 ?auto_631697 ) ) ( not ( = ?auto_631691 ?auto_631692 ) ) ( not ( = ?auto_631691 ?auto_631693 ) ) ( not ( = ?auto_631691 ?auto_631694 ) ) ( not ( = ?auto_631691 ?auto_631697 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631692 ?auto_631693 ?auto_631694 )
      ( MAKE-12CRATE-VERIFY ?auto_631683 ?auto_631684 ?auto_631685 ?auto_631682 ?auto_631686 ?auto_631688 ?auto_631687 ?auto_631689 ?auto_631690 ?auto_631691 ?auto_631692 ?auto_631693 ?auto_631694 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_631846 - SURFACE
      ?auto_631847 - SURFACE
      ?auto_631848 - SURFACE
      ?auto_631845 - SURFACE
      ?auto_631849 - SURFACE
      ?auto_631851 - SURFACE
      ?auto_631850 - SURFACE
      ?auto_631852 - SURFACE
      ?auto_631853 - SURFACE
      ?auto_631854 - SURFACE
      ?auto_631855 - SURFACE
      ?auto_631856 - SURFACE
      ?auto_631857 - SURFACE
    )
    :vars
    (
      ?auto_631858 - HOIST
      ?auto_631863 - PLACE
      ?auto_631860 - PLACE
      ?auto_631862 - HOIST
      ?auto_631861 - SURFACE
      ?auto_631859 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631858 ?auto_631863 ) ( IS-CRATE ?auto_631857 ) ( not ( = ?auto_631856 ?auto_631857 ) ) ( not ( = ?auto_631855 ?auto_631856 ) ) ( not ( = ?auto_631855 ?auto_631857 ) ) ( not ( = ?auto_631860 ?auto_631863 ) ) ( HOIST-AT ?auto_631862 ?auto_631860 ) ( not ( = ?auto_631858 ?auto_631862 ) ) ( AVAILABLE ?auto_631862 ) ( SURFACE-AT ?auto_631857 ?auto_631860 ) ( ON ?auto_631857 ?auto_631861 ) ( CLEAR ?auto_631857 ) ( not ( = ?auto_631856 ?auto_631861 ) ) ( not ( = ?auto_631857 ?auto_631861 ) ) ( not ( = ?auto_631855 ?auto_631861 ) ) ( TRUCK-AT ?auto_631859 ?auto_631863 ) ( SURFACE-AT ?auto_631855 ?auto_631863 ) ( CLEAR ?auto_631855 ) ( LIFTING ?auto_631858 ?auto_631856 ) ( IS-CRATE ?auto_631856 ) ( ON ?auto_631847 ?auto_631846 ) ( ON ?auto_631848 ?auto_631847 ) ( ON ?auto_631845 ?auto_631848 ) ( ON ?auto_631849 ?auto_631845 ) ( ON ?auto_631851 ?auto_631849 ) ( ON ?auto_631850 ?auto_631851 ) ( ON ?auto_631852 ?auto_631850 ) ( ON ?auto_631853 ?auto_631852 ) ( ON ?auto_631854 ?auto_631853 ) ( ON ?auto_631855 ?auto_631854 ) ( not ( = ?auto_631846 ?auto_631847 ) ) ( not ( = ?auto_631846 ?auto_631848 ) ) ( not ( = ?auto_631846 ?auto_631845 ) ) ( not ( = ?auto_631846 ?auto_631849 ) ) ( not ( = ?auto_631846 ?auto_631851 ) ) ( not ( = ?auto_631846 ?auto_631850 ) ) ( not ( = ?auto_631846 ?auto_631852 ) ) ( not ( = ?auto_631846 ?auto_631853 ) ) ( not ( = ?auto_631846 ?auto_631854 ) ) ( not ( = ?auto_631846 ?auto_631855 ) ) ( not ( = ?auto_631846 ?auto_631856 ) ) ( not ( = ?auto_631846 ?auto_631857 ) ) ( not ( = ?auto_631846 ?auto_631861 ) ) ( not ( = ?auto_631847 ?auto_631848 ) ) ( not ( = ?auto_631847 ?auto_631845 ) ) ( not ( = ?auto_631847 ?auto_631849 ) ) ( not ( = ?auto_631847 ?auto_631851 ) ) ( not ( = ?auto_631847 ?auto_631850 ) ) ( not ( = ?auto_631847 ?auto_631852 ) ) ( not ( = ?auto_631847 ?auto_631853 ) ) ( not ( = ?auto_631847 ?auto_631854 ) ) ( not ( = ?auto_631847 ?auto_631855 ) ) ( not ( = ?auto_631847 ?auto_631856 ) ) ( not ( = ?auto_631847 ?auto_631857 ) ) ( not ( = ?auto_631847 ?auto_631861 ) ) ( not ( = ?auto_631848 ?auto_631845 ) ) ( not ( = ?auto_631848 ?auto_631849 ) ) ( not ( = ?auto_631848 ?auto_631851 ) ) ( not ( = ?auto_631848 ?auto_631850 ) ) ( not ( = ?auto_631848 ?auto_631852 ) ) ( not ( = ?auto_631848 ?auto_631853 ) ) ( not ( = ?auto_631848 ?auto_631854 ) ) ( not ( = ?auto_631848 ?auto_631855 ) ) ( not ( = ?auto_631848 ?auto_631856 ) ) ( not ( = ?auto_631848 ?auto_631857 ) ) ( not ( = ?auto_631848 ?auto_631861 ) ) ( not ( = ?auto_631845 ?auto_631849 ) ) ( not ( = ?auto_631845 ?auto_631851 ) ) ( not ( = ?auto_631845 ?auto_631850 ) ) ( not ( = ?auto_631845 ?auto_631852 ) ) ( not ( = ?auto_631845 ?auto_631853 ) ) ( not ( = ?auto_631845 ?auto_631854 ) ) ( not ( = ?auto_631845 ?auto_631855 ) ) ( not ( = ?auto_631845 ?auto_631856 ) ) ( not ( = ?auto_631845 ?auto_631857 ) ) ( not ( = ?auto_631845 ?auto_631861 ) ) ( not ( = ?auto_631849 ?auto_631851 ) ) ( not ( = ?auto_631849 ?auto_631850 ) ) ( not ( = ?auto_631849 ?auto_631852 ) ) ( not ( = ?auto_631849 ?auto_631853 ) ) ( not ( = ?auto_631849 ?auto_631854 ) ) ( not ( = ?auto_631849 ?auto_631855 ) ) ( not ( = ?auto_631849 ?auto_631856 ) ) ( not ( = ?auto_631849 ?auto_631857 ) ) ( not ( = ?auto_631849 ?auto_631861 ) ) ( not ( = ?auto_631851 ?auto_631850 ) ) ( not ( = ?auto_631851 ?auto_631852 ) ) ( not ( = ?auto_631851 ?auto_631853 ) ) ( not ( = ?auto_631851 ?auto_631854 ) ) ( not ( = ?auto_631851 ?auto_631855 ) ) ( not ( = ?auto_631851 ?auto_631856 ) ) ( not ( = ?auto_631851 ?auto_631857 ) ) ( not ( = ?auto_631851 ?auto_631861 ) ) ( not ( = ?auto_631850 ?auto_631852 ) ) ( not ( = ?auto_631850 ?auto_631853 ) ) ( not ( = ?auto_631850 ?auto_631854 ) ) ( not ( = ?auto_631850 ?auto_631855 ) ) ( not ( = ?auto_631850 ?auto_631856 ) ) ( not ( = ?auto_631850 ?auto_631857 ) ) ( not ( = ?auto_631850 ?auto_631861 ) ) ( not ( = ?auto_631852 ?auto_631853 ) ) ( not ( = ?auto_631852 ?auto_631854 ) ) ( not ( = ?auto_631852 ?auto_631855 ) ) ( not ( = ?auto_631852 ?auto_631856 ) ) ( not ( = ?auto_631852 ?auto_631857 ) ) ( not ( = ?auto_631852 ?auto_631861 ) ) ( not ( = ?auto_631853 ?auto_631854 ) ) ( not ( = ?auto_631853 ?auto_631855 ) ) ( not ( = ?auto_631853 ?auto_631856 ) ) ( not ( = ?auto_631853 ?auto_631857 ) ) ( not ( = ?auto_631853 ?auto_631861 ) ) ( not ( = ?auto_631854 ?auto_631855 ) ) ( not ( = ?auto_631854 ?auto_631856 ) ) ( not ( = ?auto_631854 ?auto_631857 ) ) ( not ( = ?auto_631854 ?auto_631861 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631855 ?auto_631856 ?auto_631857 )
      ( MAKE-12CRATE-VERIFY ?auto_631846 ?auto_631847 ?auto_631848 ?auto_631845 ?auto_631849 ?auto_631851 ?auto_631850 ?auto_631852 ?auto_631853 ?auto_631854 ?auto_631855 ?auto_631856 ?auto_631857 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_632009 - SURFACE
      ?auto_632010 - SURFACE
      ?auto_632011 - SURFACE
      ?auto_632008 - SURFACE
      ?auto_632012 - SURFACE
      ?auto_632014 - SURFACE
      ?auto_632013 - SURFACE
      ?auto_632015 - SURFACE
      ?auto_632016 - SURFACE
      ?auto_632017 - SURFACE
      ?auto_632018 - SURFACE
      ?auto_632019 - SURFACE
      ?auto_632020 - SURFACE
    )
    :vars
    (
      ?auto_632026 - HOIST
      ?auto_632021 - PLACE
      ?auto_632024 - PLACE
      ?auto_632022 - HOIST
      ?auto_632023 - SURFACE
      ?auto_632025 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_632026 ?auto_632021 ) ( IS-CRATE ?auto_632020 ) ( not ( = ?auto_632019 ?auto_632020 ) ) ( not ( = ?auto_632018 ?auto_632019 ) ) ( not ( = ?auto_632018 ?auto_632020 ) ) ( not ( = ?auto_632024 ?auto_632021 ) ) ( HOIST-AT ?auto_632022 ?auto_632024 ) ( not ( = ?auto_632026 ?auto_632022 ) ) ( AVAILABLE ?auto_632022 ) ( SURFACE-AT ?auto_632020 ?auto_632024 ) ( ON ?auto_632020 ?auto_632023 ) ( CLEAR ?auto_632020 ) ( not ( = ?auto_632019 ?auto_632023 ) ) ( not ( = ?auto_632020 ?auto_632023 ) ) ( not ( = ?auto_632018 ?auto_632023 ) ) ( TRUCK-AT ?auto_632025 ?auto_632021 ) ( SURFACE-AT ?auto_632018 ?auto_632021 ) ( CLEAR ?auto_632018 ) ( IS-CRATE ?auto_632019 ) ( AVAILABLE ?auto_632026 ) ( IN ?auto_632019 ?auto_632025 ) ( ON ?auto_632010 ?auto_632009 ) ( ON ?auto_632011 ?auto_632010 ) ( ON ?auto_632008 ?auto_632011 ) ( ON ?auto_632012 ?auto_632008 ) ( ON ?auto_632014 ?auto_632012 ) ( ON ?auto_632013 ?auto_632014 ) ( ON ?auto_632015 ?auto_632013 ) ( ON ?auto_632016 ?auto_632015 ) ( ON ?auto_632017 ?auto_632016 ) ( ON ?auto_632018 ?auto_632017 ) ( not ( = ?auto_632009 ?auto_632010 ) ) ( not ( = ?auto_632009 ?auto_632011 ) ) ( not ( = ?auto_632009 ?auto_632008 ) ) ( not ( = ?auto_632009 ?auto_632012 ) ) ( not ( = ?auto_632009 ?auto_632014 ) ) ( not ( = ?auto_632009 ?auto_632013 ) ) ( not ( = ?auto_632009 ?auto_632015 ) ) ( not ( = ?auto_632009 ?auto_632016 ) ) ( not ( = ?auto_632009 ?auto_632017 ) ) ( not ( = ?auto_632009 ?auto_632018 ) ) ( not ( = ?auto_632009 ?auto_632019 ) ) ( not ( = ?auto_632009 ?auto_632020 ) ) ( not ( = ?auto_632009 ?auto_632023 ) ) ( not ( = ?auto_632010 ?auto_632011 ) ) ( not ( = ?auto_632010 ?auto_632008 ) ) ( not ( = ?auto_632010 ?auto_632012 ) ) ( not ( = ?auto_632010 ?auto_632014 ) ) ( not ( = ?auto_632010 ?auto_632013 ) ) ( not ( = ?auto_632010 ?auto_632015 ) ) ( not ( = ?auto_632010 ?auto_632016 ) ) ( not ( = ?auto_632010 ?auto_632017 ) ) ( not ( = ?auto_632010 ?auto_632018 ) ) ( not ( = ?auto_632010 ?auto_632019 ) ) ( not ( = ?auto_632010 ?auto_632020 ) ) ( not ( = ?auto_632010 ?auto_632023 ) ) ( not ( = ?auto_632011 ?auto_632008 ) ) ( not ( = ?auto_632011 ?auto_632012 ) ) ( not ( = ?auto_632011 ?auto_632014 ) ) ( not ( = ?auto_632011 ?auto_632013 ) ) ( not ( = ?auto_632011 ?auto_632015 ) ) ( not ( = ?auto_632011 ?auto_632016 ) ) ( not ( = ?auto_632011 ?auto_632017 ) ) ( not ( = ?auto_632011 ?auto_632018 ) ) ( not ( = ?auto_632011 ?auto_632019 ) ) ( not ( = ?auto_632011 ?auto_632020 ) ) ( not ( = ?auto_632011 ?auto_632023 ) ) ( not ( = ?auto_632008 ?auto_632012 ) ) ( not ( = ?auto_632008 ?auto_632014 ) ) ( not ( = ?auto_632008 ?auto_632013 ) ) ( not ( = ?auto_632008 ?auto_632015 ) ) ( not ( = ?auto_632008 ?auto_632016 ) ) ( not ( = ?auto_632008 ?auto_632017 ) ) ( not ( = ?auto_632008 ?auto_632018 ) ) ( not ( = ?auto_632008 ?auto_632019 ) ) ( not ( = ?auto_632008 ?auto_632020 ) ) ( not ( = ?auto_632008 ?auto_632023 ) ) ( not ( = ?auto_632012 ?auto_632014 ) ) ( not ( = ?auto_632012 ?auto_632013 ) ) ( not ( = ?auto_632012 ?auto_632015 ) ) ( not ( = ?auto_632012 ?auto_632016 ) ) ( not ( = ?auto_632012 ?auto_632017 ) ) ( not ( = ?auto_632012 ?auto_632018 ) ) ( not ( = ?auto_632012 ?auto_632019 ) ) ( not ( = ?auto_632012 ?auto_632020 ) ) ( not ( = ?auto_632012 ?auto_632023 ) ) ( not ( = ?auto_632014 ?auto_632013 ) ) ( not ( = ?auto_632014 ?auto_632015 ) ) ( not ( = ?auto_632014 ?auto_632016 ) ) ( not ( = ?auto_632014 ?auto_632017 ) ) ( not ( = ?auto_632014 ?auto_632018 ) ) ( not ( = ?auto_632014 ?auto_632019 ) ) ( not ( = ?auto_632014 ?auto_632020 ) ) ( not ( = ?auto_632014 ?auto_632023 ) ) ( not ( = ?auto_632013 ?auto_632015 ) ) ( not ( = ?auto_632013 ?auto_632016 ) ) ( not ( = ?auto_632013 ?auto_632017 ) ) ( not ( = ?auto_632013 ?auto_632018 ) ) ( not ( = ?auto_632013 ?auto_632019 ) ) ( not ( = ?auto_632013 ?auto_632020 ) ) ( not ( = ?auto_632013 ?auto_632023 ) ) ( not ( = ?auto_632015 ?auto_632016 ) ) ( not ( = ?auto_632015 ?auto_632017 ) ) ( not ( = ?auto_632015 ?auto_632018 ) ) ( not ( = ?auto_632015 ?auto_632019 ) ) ( not ( = ?auto_632015 ?auto_632020 ) ) ( not ( = ?auto_632015 ?auto_632023 ) ) ( not ( = ?auto_632016 ?auto_632017 ) ) ( not ( = ?auto_632016 ?auto_632018 ) ) ( not ( = ?auto_632016 ?auto_632019 ) ) ( not ( = ?auto_632016 ?auto_632020 ) ) ( not ( = ?auto_632016 ?auto_632023 ) ) ( not ( = ?auto_632017 ?auto_632018 ) ) ( not ( = ?auto_632017 ?auto_632019 ) ) ( not ( = ?auto_632017 ?auto_632020 ) ) ( not ( = ?auto_632017 ?auto_632023 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_632018 ?auto_632019 ?auto_632020 )
      ( MAKE-12CRATE-VERIFY ?auto_632009 ?auto_632010 ?auto_632011 ?auto_632008 ?auto_632012 ?auto_632014 ?auto_632013 ?auto_632015 ?auto_632016 ?auto_632017 ?auto_632018 ?auto_632019 ?auto_632020 ) )
  )

)

