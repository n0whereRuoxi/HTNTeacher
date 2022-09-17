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
      ?auto_30023 - SURFACE
      ?auto_30024 - SURFACE
    )
    :vars
    (
      ?auto_30025 - HOIST
      ?auto_30026 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30025 ?auto_30026 ) ( SURFACE-AT ?auto_30024 ?auto_30026 ) ( CLEAR ?auto_30024 ) ( LIFTING ?auto_30025 ?auto_30023 ) ( IS-CRATE ?auto_30023 ) ( not ( = ?auto_30023 ?auto_30024 ) ) )
    :subtasks
    ( ( !DROP ?auto_30025 ?auto_30023 ?auto_30024 ?auto_30026 )
      ( MAKE-ON-VERIFY ?auto_30023 ?auto_30024 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30027 - SURFACE
      ?auto_30028 - SURFACE
    )
    :vars
    (
      ?auto_30029 - HOIST
      ?auto_30030 - PLACE
      ?auto_30031 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30029 ?auto_30030 ) ( SURFACE-AT ?auto_30028 ?auto_30030 ) ( CLEAR ?auto_30028 ) ( IS-CRATE ?auto_30027 ) ( not ( = ?auto_30027 ?auto_30028 ) ) ( TRUCK-AT ?auto_30031 ?auto_30030 ) ( AVAILABLE ?auto_30029 ) ( IN ?auto_30027 ?auto_30031 ) )
    :subtasks
    ( ( !UNLOAD ?auto_30029 ?auto_30027 ?auto_30031 ?auto_30030 )
      ( MAKE-ON ?auto_30027 ?auto_30028 )
      ( MAKE-ON-VERIFY ?auto_30027 ?auto_30028 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30032 - SURFACE
      ?auto_30033 - SURFACE
    )
    :vars
    (
      ?auto_30034 - HOIST
      ?auto_30036 - PLACE
      ?auto_30035 - TRUCK
      ?auto_30037 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30034 ?auto_30036 ) ( SURFACE-AT ?auto_30033 ?auto_30036 ) ( CLEAR ?auto_30033 ) ( IS-CRATE ?auto_30032 ) ( not ( = ?auto_30032 ?auto_30033 ) ) ( AVAILABLE ?auto_30034 ) ( IN ?auto_30032 ?auto_30035 ) ( TRUCK-AT ?auto_30035 ?auto_30037 ) ( not ( = ?auto_30037 ?auto_30036 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_30035 ?auto_30037 ?auto_30036 )
      ( MAKE-ON ?auto_30032 ?auto_30033 )
      ( MAKE-ON-VERIFY ?auto_30032 ?auto_30033 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30038 - SURFACE
      ?auto_30039 - SURFACE
    )
    :vars
    (
      ?auto_30042 - HOIST
      ?auto_30043 - PLACE
      ?auto_30041 - TRUCK
      ?auto_30040 - PLACE
      ?auto_30044 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30042 ?auto_30043 ) ( SURFACE-AT ?auto_30039 ?auto_30043 ) ( CLEAR ?auto_30039 ) ( IS-CRATE ?auto_30038 ) ( not ( = ?auto_30038 ?auto_30039 ) ) ( AVAILABLE ?auto_30042 ) ( TRUCK-AT ?auto_30041 ?auto_30040 ) ( not ( = ?auto_30040 ?auto_30043 ) ) ( HOIST-AT ?auto_30044 ?auto_30040 ) ( LIFTING ?auto_30044 ?auto_30038 ) ( not ( = ?auto_30042 ?auto_30044 ) ) )
    :subtasks
    ( ( !LOAD ?auto_30044 ?auto_30038 ?auto_30041 ?auto_30040 )
      ( MAKE-ON ?auto_30038 ?auto_30039 )
      ( MAKE-ON-VERIFY ?auto_30038 ?auto_30039 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30045 - SURFACE
      ?auto_30046 - SURFACE
    )
    :vars
    (
      ?auto_30047 - HOIST
      ?auto_30049 - PLACE
      ?auto_30050 - TRUCK
      ?auto_30051 - PLACE
      ?auto_30048 - HOIST
      ?auto_30052 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30047 ?auto_30049 ) ( SURFACE-AT ?auto_30046 ?auto_30049 ) ( CLEAR ?auto_30046 ) ( IS-CRATE ?auto_30045 ) ( not ( = ?auto_30045 ?auto_30046 ) ) ( AVAILABLE ?auto_30047 ) ( TRUCK-AT ?auto_30050 ?auto_30051 ) ( not ( = ?auto_30051 ?auto_30049 ) ) ( HOIST-AT ?auto_30048 ?auto_30051 ) ( not ( = ?auto_30047 ?auto_30048 ) ) ( AVAILABLE ?auto_30048 ) ( SURFACE-AT ?auto_30045 ?auto_30051 ) ( ON ?auto_30045 ?auto_30052 ) ( CLEAR ?auto_30045 ) ( not ( = ?auto_30045 ?auto_30052 ) ) ( not ( = ?auto_30046 ?auto_30052 ) ) )
    :subtasks
    ( ( !LIFT ?auto_30048 ?auto_30045 ?auto_30052 ?auto_30051 )
      ( MAKE-ON ?auto_30045 ?auto_30046 )
      ( MAKE-ON-VERIFY ?auto_30045 ?auto_30046 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30053 - SURFACE
      ?auto_30054 - SURFACE
    )
    :vars
    (
      ?auto_30056 - HOIST
      ?auto_30058 - PLACE
      ?auto_30060 - PLACE
      ?auto_30059 - HOIST
      ?auto_30057 - SURFACE
      ?auto_30055 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30056 ?auto_30058 ) ( SURFACE-AT ?auto_30054 ?auto_30058 ) ( CLEAR ?auto_30054 ) ( IS-CRATE ?auto_30053 ) ( not ( = ?auto_30053 ?auto_30054 ) ) ( AVAILABLE ?auto_30056 ) ( not ( = ?auto_30060 ?auto_30058 ) ) ( HOIST-AT ?auto_30059 ?auto_30060 ) ( not ( = ?auto_30056 ?auto_30059 ) ) ( AVAILABLE ?auto_30059 ) ( SURFACE-AT ?auto_30053 ?auto_30060 ) ( ON ?auto_30053 ?auto_30057 ) ( CLEAR ?auto_30053 ) ( not ( = ?auto_30053 ?auto_30057 ) ) ( not ( = ?auto_30054 ?auto_30057 ) ) ( TRUCK-AT ?auto_30055 ?auto_30058 ) )
    :subtasks
    ( ( !DRIVE ?auto_30055 ?auto_30058 ?auto_30060 )
      ( MAKE-ON ?auto_30053 ?auto_30054 )
      ( MAKE-ON-VERIFY ?auto_30053 ?auto_30054 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30101 - SURFACE
      ?auto_30102 - SURFACE
    )
    :vars
    (
      ?auto_30103 - HOIST
      ?auto_30104 - PLACE
      ?auto_30108 - PLACE
      ?auto_30105 - HOIST
      ?auto_30107 - SURFACE
      ?auto_30106 - TRUCK
      ?auto_30109 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30103 ?auto_30104 ) ( IS-CRATE ?auto_30101 ) ( not ( = ?auto_30101 ?auto_30102 ) ) ( not ( = ?auto_30108 ?auto_30104 ) ) ( HOIST-AT ?auto_30105 ?auto_30108 ) ( not ( = ?auto_30103 ?auto_30105 ) ) ( AVAILABLE ?auto_30105 ) ( SURFACE-AT ?auto_30101 ?auto_30108 ) ( ON ?auto_30101 ?auto_30107 ) ( CLEAR ?auto_30101 ) ( not ( = ?auto_30101 ?auto_30107 ) ) ( not ( = ?auto_30102 ?auto_30107 ) ) ( TRUCK-AT ?auto_30106 ?auto_30104 ) ( SURFACE-AT ?auto_30109 ?auto_30104 ) ( CLEAR ?auto_30109 ) ( LIFTING ?auto_30103 ?auto_30102 ) ( IS-CRATE ?auto_30102 ) ( not ( = ?auto_30101 ?auto_30109 ) ) ( not ( = ?auto_30102 ?auto_30109 ) ) ( not ( = ?auto_30107 ?auto_30109 ) ) )
    :subtasks
    ( ( !DROP ?auto_30103 ?auto_30102 ?auto_30109 ?auto_30104 )
      ( MAKE-ON ?auto_30101 ?auto_30102 )
      ( MAKE-ON-VERIFY ?auto_30101 ?auto_30102 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30110 - SURFACE
      ?auto_30111 - SURFACE
    )
    :vars
    (
      ?auto_30115 - HOIST
      ?auto_30118 - PLACE
      ?auto_30117 - PLACE
      ?auto_30116 - HOIST
      ?auto_30113 - SURFACE
      ?auto_30114 - TRUCK
      ?auto_30112 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30115 ?auto_30118 ) ( IS-CRATE ?auto_30110 ) ( not ( = ?auto_30110 ?auto_30111 ) ) ( not ( = ?auto_30117 ?auto_30118 ) ) ( HOIST-AT ?auto_30116 ?auto_30117 ) ( not ( = ?auto_30115 ?auto_30116 ) ) ( AVAILABLE ?auto_30116 ) ( SURFACE-AT ?auto_30110 ?auto_30117 ) ( ON ?auto_30110 ?auto_30113 ) ( CLEAR ?auto_30110 ) ( not ( = ?auto_30110 ?auto_30113 ) ) ( not ( = ?auto_30111 ?auto_30113 ) ) ( TRUCK-AT ?auto_30114 ?auto_30118 ) ( SURFACE-AT ?auto_30112 ?auto_30118 ) ( CLEAR ?auto_30112 ) ( IS-CRATE ?auto_30111 ) ( not ( = ?auto_30110 ?auto_30112 ) ) ( not ( = ?auto_30111 ?auto_30112 ) ) ( not ( = ?auto_30113 ?auto_30112 ) ) ( AVAILABLE ?auto_30115 ) ( IN ?auto_30111 ?auto_30114 ) )
    :subtasks
    ( ( !UNLOAD ?auto_30115 ?auto_30111 ?auto_30114 ?auto_30118 )
      ( MAKE-ON ?auto_30110 ?auto_30111 )
      ( MAKE-ON-VERIFY ?auto_30110 ?auto_30111 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30125 - SURFACE
      ?auto_30126 - SURFACE
    )
    :vars
    (
      ?auto_30132 - HOIST
      ?auto_30130 - PLACE
      ?auto_30127 - PLACE
      ?auto_30128 - HOIST
      ?auto_30131 - SURFACE
      ?auto_30129 - TRUCK
      ?auto_30133 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30132 ?auto_30130 ) ( SURFACE-AT ?auto_30126 ?auto_30130 ) ( CLEAR ?auto_30126 ) ( IS-CRATE ?auto_30125 ) ( not ( = ?auto_30125 ?auto_30126 ) ) ( AVAILABLE ?auto_30132 ) ( not ( = ?auto_30127 ?auto_30130 ) ) ( HOIST-AT ?auto_30128 ?auto_30127 ) ( not ( = ?auto_30132 ?auto_30128 ) ) ( AVAILABLE ?auto_30128 ) ( SURFACE-AT ?auto_30125 ?auto_30127 ) ( ON ?auto_30125 ?auto_30131 ) ( CLEAR ?auto_30125 ) ( not ( = ?auto_30125 ?auto_30131 ) ) ( not ( = ?auto_30126 ?auto_30131 ) ) ( TRUCK-AT ?auto_30129 ?auto_30133 ) ( not ( = ?auto_30133 ?auto_30130 ) ) ( not ( = ?auto_30127 ?auto_30133 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_30129 ?auto_30133 ?auto_30130 )
      ( MAKE-ON ?auto_30125 ?auto_30126 )
      ( MAKE-ON-VERIFY ?auto_30125 ?auto_30126 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30192 - SURFACE
      ?auto_30193 - SURFACE
    )
    :vars
    (
      ?auto_30194 - HOIST
      ?auto_30195 - PLACE
      ?auto_30197 - PLACE
      ?auto_30198 - HOIST
      ?auto_30196 - SURFACE
      ?auto_30200 - SURFACE
      ?auto_30199 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30194 ?auto_30195 ) ( IS-CRATE ?auto_30192 ) ( not ( = ?auto_30192 ?auto_30193 ) ) ( not ( = ?auto_30197 ?auto_30195 ) ) ( HOIST-AT ?auto_30198 ?auto_30197 ) ( not ( = ?auto_30194 ?auto_30198 ) ) ( AVAILABLE ?auto_30198 ) ( SURFACE-AT ?auto_30192 ?auto_30197 ) ( ON ?auto_30192 ?auto_30196 ) ( CLEAR ?auto_30192 ) ( not ( = ?auto_30192 ?auto_30196 ) ) ( not ( = ?auto_30193 ?auto_30196 ) ) ( SURFACE-AT ?auto_30200 ?auto_30195 ) ( CLEAR ?auto_30200 ) ( IS-CRATE ?auto_30193 ) ( not ( = ?auto_30192 ?auto_30200 ) ) ( not ( = ?auto_30193 ?auto_30200 ) ) ( not ( = ?auto_30196 ?auto_30200 ) ) ( AVAILABLE ?auto_30194 ) ( IN ?auto_30193 ?auto_30199 ) ( TRUCK-AT ?auto_30199 ?auto_30197 ) )
    :subtasks
    ( ( !DRIVE ?auto_30199 ?auto_30197 ?auto_30195 )
      ( MAKE-ON ?auto_30192 ?auto_30193 )
      ( MAKE-ON-VERIFY ?auto_30192 ?auto_30193 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30201 - SURFACE
      ?auto_30202 - SURFACE
    )
    :vars
    (
      ?auto_30206 - HOIST
      ?auto_30203 - PLACE
      ?auto_30208 - PLACE
      ?auto_30209 - HOIST
      ?auto_30204 - SURFACE
      ?auto_30207 - SURFACE
      ?auto_30205 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30206 ?auto_30203 ) ( IS-CRATE ?auto_30201 ) ( not ( = ?auto_30201 ?auto_30202 ) ) ( not ( = ?auto_30208 ?auto_30203 ) ) ( HOIST-AT ?auto_30209 ?auto_30208 ) ( not ( = ?auto_30206 ?auto_30209 ) ) ( SURFACE-AT ?auto_30201 ?auto_30208 ) ( ON ?auto_30201 ?auto_30204 ) ( CLEAR ?auto_30201 ) ( not ( = ?auto_30201 ?auto_30204 ) ) ( not ( = ?auto_30202 ?auto_30204 ) ) ( SURFACE-AT ?auto_30207 ?auto_30203 ) ( CLEAR ?auto_30207 ) ( IS-CRATE ?auto_30202 ) ( not ( = ?auto_30201 ?auto_30207 ) ) ( not ( = ?auto_30202 ?auto_30207 ) ) ( not ( = ?auto_30204 ?auto_30207 ) ) ( AVAILABLE ?auto_30206 ) ( TRUCK-AT ?auto_30205 ?auto_30208 ) ( LIFTING ?auto_30209 ?auto_30202 ) )
    :subtasks
    ( ( !LOAD ?auto_30209 ?auto_30202 ?auto_30205 ?auto_30208 )
      ( MAKE-ON ?auto_30201 ?auto_30202 )
      ( MAKE-ON-VERIFY ?auto_30201 ?auto_30202 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30210 - SURFACE
      ?auto_30211 - SURFACE
    )
    :vars
    (
      ?auto_30213 - HOIST
      ?auto_30217 - PLACE
      ?auto_30212 - PLACE
      ?auto_30215 - HOIST
      ?auto_30214 - SURFACE
      ?auto_30218 - SURFACE
      ?auto_30216 - TRUCK
      ?auto_30219 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30213 ?auto_30217 ) ( IS-CRATE ?auto_30210 ) ( not ( = ?auto_30210 ?auto_30211 ) ) ( not ( = ?auto_30212 ?auto_30217 ) ) ( HOIST-AT ?auto_30215 ?auto_30212 ) ( not ( = ?auto_30213 ?auto_30215 ) ) ( SURFACE-AT ?auto_30210 ?auto_30212 ) ( ON ?auto_30210 ?auto_30214 ) ( CLEAR ?auto_30210 ) ( not ( = ?auto_30210 ?auto_30214 ) ) ( not ( = ?auto_30211 ?auto_30214 ) ) ( SURFACE-AT ?auto_30218 ?auto_30217 ) ( CLEAR ?auto_30218 ) ( IS-CRATE ?auto_30211 ) ( not ( = ?auto_30210 ?auto_30218 ) ) ( not ( = ?auto_30211 ?auto_30218 ) ) ( not ( = ?auto_30214 ?auto_30218 ) ) ( AVAILABLE ?auto_30213 ) ( TRUCK-AT ?auto_30216 ?auto_30212 ) ( AVAILABLE ?auto_30215 ) ( SURFACE-AT ?auto_30211 ?auto_30212 ) ( ON ?auto_30211 ?auto_30219 ) ( CLEAR ?auto_30211 ) ( not ( = ?auto_30210 ?auto_30219 ) ) ( not ( = ?auto_30211 ?auto_30219 ) ) ( not ( = ?auto_30214 ?auto_30219 ) ) ( not ( = ?auto_30218 ?auto_30219 ) ) )
    :subtasks
    ( ( !LIFT ?auto_30215 ?auto_30211 ?auto_30219 ?auto_30212 )
      ( MAKE-ON ?auto_30210 ?auto_30211 )
      ( MAKE-ON-VERIFY ?auto_30210 ?auto_30211 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30220 - SURFACE
      ?auto_30221 - SURFACE
    )
    :vars
    (
      ?auto_30229 - HOIST
      ?auto_30228 - PLACE
      ?auto_30222 - PLACE
      ?auto_30226 - HOIST
      ?auto_30225 - SURFACE
      ?auto_30227 - SURFACE
      ?auto_30223 - SURFACE
      ?auto_30224 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30229 ?auto_30228 ) ( IS-CRATE ?auto_30220 ) ( not ( = ?auto_30220 ?auto_30221 ) ) ( not ( = ?auto_30222 ?auto_30228 ) ) ( HOIST-AT ?auto_30226 ?auto_30222 ) ( not ( = ?auto_30229 ?auto_30226 ) ) ( SURFACE-AT ?auto_30220 ?auto_30222 ) ( ON ?auto_30220 ?auto_30225 ) ( CLEAR ?auto_30220 ) ( not ( = ?auto_30220 ?auto_30225 ) ) ( not ( = ?auto_30221 ?auto_30225 ) ) ( SURFACE-AT ?auto_30227 ?auto_30228 ) ( CLEAR ?auto_30227 ) ( IS-CRATE ?auto_30221 ) ( not ( = ?auto_30220 ?auto_30227 ) ) ( not ( = ?auto_30221 ?auto_30227 ) ) ( not ( = ?auto_30225 ?auto_30227 ) ) ( AVAILABLE ?auto_30229 ) ( AVAILABLE ?auto_30226 ) ( SURFACE-AT ?auto_30221 ?auto_30222 ) ( ON ?auto_30221 ?auto_30223 ) ( CLEAR ?auto_30221 ) ( not ( = ?auto_30220 ?auto_30223 ) ) ( not ( = ?auto_30221 ?auto_30223 ) ) ( not ( = ?auto_30225 ?auto_30223 ) ) ( not ( = ?auto_30227 ?auto_30223 ) ) ( TRUCK-AT ?auto_30224 ?auto_30228 ) )
    :subtasks
    ( ( !DRIVE ?auto_30224 ?auto_30228 ?auto_30222 )
      ( MAKE-ON ?auto_30220 ?auto_30221 )
      ( MAKE-ON-VERIFY ?auto_30220 ?auto_30221 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30230 - SURFACE
      ?auto_30231 - SURFACE
    )
    :vars
    (
      ?auto_30238 - HOIST
      ?auto_30233 - PLACE
      ?auto_30234 - PLACE
      ?auto_30232 - HOIST
      ?auto_30236 - SURFACE
      ?auto_30239 - SURFACE
      ?auto_30235 - SURFACE
      ?auto_30237 - TRUCK
      ?auto_30240 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30238 ?auto_30233 ) ( IS-CRATE ?auto_30230 ) ( not ( = ?auto_30230 ?auto_30231 ) ) ( not ( = ?auto_30234 ?auto_30233 ) ) ( HOIST-AT ?auto_30232 ?auto_30234 ) ( not ( = ?auto_30238 ?auto_30232 ) ) ( SURFACE-AT ?auto_30230 ?auto_30234 ) ( ON ?auto_30230 ?auto_30236 ) ( CLEAR ?auto_30230 ) ( not ( = ?auto_30230 ?auto_30236 ) ) ( not ( = ?auto_30231 ?auto_30236 ) ) ( IS-CRATE ?auto_30231 ) ( not ( = ?auto_30230 ?auto_30239 ) ) ( not ( = ?auto_30231 ?auto_30239 ) ) ( not ( = ?auto_30236 ?auto_30239 ) ) ( AVAILABLE ?auto_30232 ) ( SURFACE-AT ?auto_30231 ?auto_30234 ) ( ON ?auto_30231 ?auto_30235 ) ( CLEAR ?auto_30231 ) ( not ( = ?auto_30230 ?auto_30235 ) ) ( not ( = ?auto_30231 ?auto_30235 ) ) ( not ( = ?auto_30236 ?auto_30235 ) ) ( not ( = ?auto_30239 ?auto_30235 ) ) ( TRUCK-AT ?auto_30237 ?auto_30233 ) ( SURFACE-AT ?auto_30240 ?auto_30233 ) ( CLEAR ?auto_30240 ) ( LIFTING ?auto_30238 ?auto_30239 ) ( IS-CRATE ?auto_30239 ) ( not ( = ?auto_30230 ?auto_30240 ) ) ( not ( = ?auto_30231 ?auto_30240 ) ) ( not ( = ?auto_30236 ?auto_30240 ) ) ( not ( = ?auto_30239 ?auto_30240 ) ) ( not ( = ?auto_30235 ?auto_30240 ) ) )
    :subtasks
    ( ( !DROP ?auto_30238 ?auto_30239 ?auto_30240 ?auto_30233 )
      ( MAKE-ON ?auto_30230 ?auto_30231 )
      ( MAKE-ON-VERIFY ?auto_30230 ?auto_30231 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30330 - SURFACE
      ?auto_30331 - SURFACE
    )
    :vars
    (
      ?auto_30337 - HOIST
      ?auto_30333 - PLACE
      ?auto_30334 - PLACE
      ?auto_30335 - HOIST
      ?auto_30332 - SURFACE
      ?auto_30336 - TRUCK
      ?auto_30338 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30337 ?auto_30333 ) ( SURFACE-AT ?auto_30331 ?auto_30333 ) ( CLEAR ?auto_30331 ) ( IS-CRATE ?auto_30330 ) ( not ( = ?auto_30330 ?auto_30331 ) ) ( not ( = ?auto_30334 ?auto_30333 ) ) ( HOIST-AT ?auto_30335 ?auto_30334 ) ( not ( = ?auto_30337 ?auto_30335 ) ) ( AVAILABLE ?auto_30335 ) ( SURFACE-AT ?auto_30330 ?auto_30334 ) ( ON ?auto_30330 ?auto_30332 ) ( CLEAR ?auto_30330 ) ( not ( = ?auto_30330 ?auto_30332 ) ) ( not ( = ?auto_30331 ?auto_30332 ) ) ( TRUCK-AT ?auto_30336 ?auto_30333 ) ( LIFTING ?auto_30337 ?auto_30338 ) ( IS-CRATE ?auto_30338 ) ( not ( = ?auto_30330 ?auto_30338 ) ) ( not ( = ?auto_30331 ?auto_30338 ) ) ( not ( = ?auto_30332 ?auto_30338 ) ) )
    :subtasks
    ( ( !LOAD ?auto_30337 ?auto_30338 ?auto_30336 ?auto_30333 )
      ( MAKE-ON ?auto_30330 ?auto_30331 )
      ( MAKE-ON-VERIFY ?auto_30330 ?auto_30331 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30942 - SURFACE
      ?auto_30943 - SURFACE
    )
    :vars
    (
      ?auto_30944 - HOIST
      ?auto_30947 - PLACE
      ?auto_30949 - TRUCK
      ?auto_30945 - PLACE
      ?auto_30946 - HOIST
      ?auto_30948 - SURFACE
      ?auto_30950 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30944 ?auto_30947 ) ( SURFACE-AT ?auto_30943 ?auto_30947 ) ( CLEAR ?auto_30943 ) ( IS-CRATE ?auto_30942 ) ( not ( = ?auto_30942 ?auto_30943 ) ) ( AVAILABLE ?auto_30944 ) ( TRUCK-AT ?auto_30949 ?auto_30945 ) ( not ( = ?auto_30945 ?auto_30947 ) ) ( HOIST-AT ?auto_30946 ?auto_30945 ) ( not ( = ?auto_30944 ?auto_30946 ) ) ( SURFACE-AT ?auto_30942 ?auto_30945 ) ( ON ?auto_30942 ?auto_30948 ) ( CLEAR ?auto_30942 ) ( not ( = ?auto_30942 ?auto_30948 ) ) ( not ( = ?auto_30943 ?auto_30948 ) ) ( LIFTING ?auto_30946 ?auto_30950 ) ( IS-CRATE ?auto_30950 ) ( not ( = ?auto_30942 ?auto_30950 ) ) ( not ( = ?auto_30943 ?auto_30950 ) ) ( not ( = ?auto_30948 ?auto_30950 ) ) )
    :subtasks
    ( ( !LOAD ?auto_30946 ?auto_30950 ?auto_30949 ?auto_30945 )
      ( MAKE-ON ?auto_30942 ?auto_30943 )
      ( MAKE-ON-VERIFY ?auto_30942 ?auto_30943 ) )
  )

)

