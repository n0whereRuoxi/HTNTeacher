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
      ?auto_15093 - SURFACE
      ?auto_15094 - SURFACE
    )
    :vars
    (
      ?auto_15095 - HOIST
      ?auto_15096 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15095 ?auto_15096 ) ( SURFACE-AT ?auto_15094 ?auto_15096 ) ( CLEAR ?auto_15094 ) ( LIFTING ?auto_15095 ?auto_15093 ) ( IS-CRATE ?auto_15093 ) ( not ( = ?auto_15093 ?auto_15094 ) ) )
    :subtasks
    ( ( !DROP ?auto_15095 ?auto_15093 ?auto_15094 ?auto_15096 )
      ( MAKE-ON-VERIFY ?auto_15093 ?auto_15094 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15097 - SURFACE
      ?auto_15098 - SURFACE
    )
    :vars
    (
      ?auto_15100 - HOIST
      ?auto_15099 - PLACE
      ?auto_15101 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15100 ?auto_15099 ) ( SURFACE-AT ?auto_15098 ?auto_15099 ) ( CLEAR ?auto_15098 ) ( IS-CRATE ?auto_15097 ) ( not ( = ?auto_15097 ?auto_15098 ) ) ( TRUCK-AT ?auto_15101 ?auto_15099 ) ( AVAILABLE ?auto_15100 ) ( IN ?auto_15097 ?auto_15101 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15100 ?auto_15097 ?auto_15101 ?auto_15099 )
      ( MAKE-ON ?auto_15097 ?auto_15098 )
      ( MAKE-ON-VERIFY ?auto_15097 ?auto_15098 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15102 - SURFACE
      ?auto_15103 - SURFACE
    )
    :vars
    (
      ?auto_15106 - HOIST
      ?auto_15104 - PLACE
      ?auto_15105 - TRUCK
      ?auto_15107 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15106 ?auto_15104 ) ( SURFACE-AT ?auto_15103 ?auto_15104 ) ( CLEAR ?auto_15103 ) ( IS-CRATE ?auto_15102 ) ( not ( = ?auto_15102 ?auto_15103 ) ) ( AVAILABLE ?auto_15106 ) ( IN ?auto_15102 ?auto_15105 ) ( TRUCK-AT ?auto_15105 ?auto_15107 ) ( not ( = ?auto_15107 ?auto_15104 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15105 ?auto_15107 ?auto_15104 )
      ( MAKE-ON ?auto_15102 ?auto_15103 )
      ( MAKE-ON-VERIFY ?auto_15102 ?auto_15103 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15108 - SURFACE
      ?auto_15109 - SURFACE
    )
    :vars
    (
      ?auto_15111 - HOIST
      ?auto_15112 - PLACE
      ?auto_15113 - TRUCK
      ?auto_15110 - PLACE
      ?auto_15114 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15111 ?auto_15112 ) ( SURFACE-AT ?auto_15109 ?auto_15112 ) ( CLEAR ?auto_15109 ) ( IS-CRATE ?auto_15108 ) ( not ( = ?auto_15108 ?auto_15109 ) ) ( AVAILABLE ?auto_15111 ) ( TRUCK-AT ?auto_15113 ?auto_15110 ) ( not ( = ?auto_15110 ?auto_15112 ) ) ( HOIST-AT ?auto_15114 ?auto_15110 ) ( LIFTING ?auto_15114 ?auto_15108 ) ( not ( = ?auto_15111 ?auto_15114 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15114 ?auto_15108 ?auto_15113 ?auto_15110 )
      ( MAKE-ON ?auto_15108 ?auto_15109 )
      ( MAKE-ON-VERIFY ?auto_15108 ?auto_15109 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15115 - SURFACE
      ?auto_15116 - SURFACE
    )
    :vars
    (
      ?auto_15117 - HOIST
      ?auto_15118 - PLACE
      ?auto_15120 - TRUCK
      ?auto_15119 - PLACE
      ?auto_15121 - HOIST
      ?auto_15122 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15117 ?auto_15118 ) ( SURFACE-AT ?auto_15116 ?auto_15118 ) ( CLEAR ?auto_15116 ) ( IS-CRATE ?auto_15115 ) ( not ( = ?auto_15115 ?auto_15116 ) ) ( AVAILABLE ?auto_15117 ) ( TRUCK-AT ?auto_15120 ?auto_15119 ) ( not ( = ?auto_15119 ?auto_15118 ) ) ( HOIST-AT ?auto_15121 ?auto_15119 ) ( not ( = ?auto_15117 ?auto_15121 ) ) ( AVAILABLE ?auto_15121 ) ( SURFACE-AT ?auto_15115 ?auto_15119 ) ( ON ?auto_15115 ?auto_15122 ) ( CLEAR ?auto_15115 ) ( not ( = ?auto_15115 ?auto_15122 ) ) ( not ( = ?auto_15116 ?auto_15122 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15121 ?auto_15115 ?auto_15122 ?auto_15119 )
      ( MAKE-ON ?auto_15115 ?auto_15116 )
      ( MAKE-ON-VERIFY ?auto_15115 ?auto_15116 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15123 - SURFACE
      ?auto_15124 - SURFACE
    )
    :vars
    (
      ?auto_15129 - HOIST
      ?auto_15130 - PLACE
      ?auto_15127 - PLACE
      ?auto_15126 - HOIST
      ?auto_15125 - SURFACE
      ?auto_15128 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15129 ?auto_15130 ) ( SURFACE-AT ?auto_15124 ?auto_15130 ) ( CLEAR ?auto_15124 ) ( IS-CRATE ?auto_15123 ) ( not ( = ?auto_15123 ?auto_15124 ) ) ( AVAILABLE ?auto_15129 ) ( not ( = ?auto_15127 ?auto_15130 ) ) ( HOIST-AT ?auto_15126 ?auto_15127 ) ( not ( = ?auto_15129 ?auto_15126 ) ) ( AVAILABLE ?auto_15126 ) ( SURFACE-AT ?auto_15123 ?auto_15127 ) ( ON ?auto_15123 ?auto_15125 ) ( CLEAR ?auto_15123 ) ( not ( = ?auto_15123 ?auto_15125 ) ) ( not ( = ?auto_15124 ?auto_15125 ) ) ( TRUCK-AT ?auto_15128 ?auto_15130 ) )
    :subtasks
    ( ( !DRIVE ?auto_15128 ?auto_15130 ?auto_15127 )
      ( MAKE-ON ?auto_15123 ?auto_15124 )
      ( MAKE-ON-VERIFY ?auto_15123 ?auto_15124 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15133 - SURFACE
      ?auto_15134 - SURFACE
    )
    :vars
    (
      ?auto_15135 - HOIST
      ?auto_15136 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15135 ?auto_15136 ) ( SURFACE-AT ?auto_15134 ?auto_15136 ) ( CLEAR ?auto_15134 ) ( LIFTING ?auto_15135 ?auto_15133 ) ( IS-CRATE ?auto_15133 ) ( not ( = ?auto_15133 ?auto_15134 ) ) )
    :subtasks
    ( ( !DROP ?auto_15135 ?auto_15133 ?auto_15134 ?auto_15136 )
      ( MAKE-ON-VERIFY ?auto_15133 ?auto_15134 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15137 - SURFACE
      ?auto_15138 - SURFACE
    )
    :vars
    (
      ?auto_15139 - HOIST
      ?auto_15140 - PLACE
      ?auto_15141 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15139 ?auto_15140 ) ( SURFACE-AT ?auto_15138 ?auto_15140 ) ( CLEAR ?auto_15138 ) ( IS-CRATE ?auto_15137 ) ( not ( = ?auto_15137 ?auto_15138 ) ) ( TRUCK-AT ?auto_15141 ?auto_15140 ) ( AVAILABLE ?auto_15139 ) ( IN ?auto_15137 ?auto_15141 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15139 ?auto_15137 ?auto_15141 ?auto_15140 )
      ( MAKE-ON ?auto_15137 ?auto_15138 )
      ( MAKE-ON-VERIFY ?auto_15137 ?auto_15138 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15142 - SURFACE
      ?auto_15143 - SURFACE
    )
    :vars
    (
      ?auto_15145 - HOIST
      ?auto_15144 - PLACE
      ?auto_15146 - TRUCK
      ?auto_15147 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15145 ?auto_15144 ) ( SURFACE-AT ?auto_15143 ?auto_15144 ) ( CLEAR ?auto_15143 ) ( IS-CRATE ?auto_15142 ) ( not ( = ?auto_15142 ?auto_15143 ) ) ( AVAILABLE ?auto_15145 ) ( IN ?auto_15142 ?auto_15146 ) ( TRUCK-AT ?auto_15146 ?auto_15147 ) ( not ( = ?auto_15147 ?auto_15144 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15146 ?auto_15147 ?auto_15144 )
      ( MAKE-ON ?auto_15142 ?auto_15143 )
      ( MAKE-ON-VERIFY ?auto_15142 ?auto_15143 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15148 - SURFACE
      ?auto_15149 - SURFACE
    )
    :vars
    (
      ?auto_15150 - HOIST
      ?auto_15152 - PLACE
      ?auto_15153 - TRUCK
      ?auto_15151 - PLACE
      ?auto_15154 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15150 ?auto_15152 ) ( SURFACE-AT ?auto_15149 ?auto_15152 ) ( CLEAR ?auto_15149 ) ( IS-CRATE ?auto_15148 ) ( not ( = ?auto_15148 ?auto_15149 ) ) ( AVAILABLE ?auto_15150 ) ( TRUCK-AT ?auto_15153 ?auto_15151 ) ( not ( = ?auto_15151 ?auto_15152 ) ) ( HOIST-AT ?auto_15154 ?auto_15151 ) ( LIFTING ?auto_15154 ?auto_15148 ) ( not ( = ?auto_15150 ?auto_15154 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15154 ?auto_15148 ?auto_15153 ?auto_15151 )
      ( MAKE-ON ?auto_15148 ?auto_15149 )
      ( MAKE-ON-VERIFY ?auto_15148 ?auto_15149 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15155 - SURFACE
      ?auto_15156 - SURFACE
    )
    :vars
    (
      ?auto_15158 - HOIST
      ?auto_15157 - PLACE
      ?auto_15160 - TRUCK
      ?auto_15161 - PLACE
      ?auto_15159 - HOIST
      ?auto_15162 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15158 ?auto_15157 ) ( SURFACE-AT ?auto_15156 ?auto_15157 ) ( CLEAR ?auto_15156 ) ( IS-CRATE ?auto_15155 ) ( not ( = ?auto_15155 ?auto_15156 ) ) ( AVAILABLE ?auto_15158 ) ( TRUCK-AT ?auto_15160 ?auto_15161 ) ( not ( = ?auto_15161 ?auto_15157 ) ) ( HOIST-AT ?auto_15159 ?auto_15161 ) ( not ( = ?auto_15158 ?auto_15159 ) ) ( AVAILABLE ?auto_15159 ) ( SURFACE-AT ?auto_15155 ?auto_15161 ) ( ON ?auto_15155 ?auto_15162 ) ( CLEAR ?auto_15155 ) ( not ( = ?auto_15155 ?auto_15162 ) ) ( not ( = ?auto_15156 ?auto_15162 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15159 ?auto_15155 ?auto_15162 ?auto_15161 )
      ( MAKE-ON ?auto_15155 ?auto_15156 )
      ( MAKE-ON-VERIFY ?auto_15155 ?auto_15156 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15163 - SURFACE
      ?auto_15164 - SURFACE
    )
    :vars
    (
      ?auto_15169 - HOIST
      ?auto_15167 - PLACE
      ?auto_15170 - PLACE
      ?auto_15165 - HOIST
      ?auto_15166 - SURFACE
      ?auto_15168 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15169 ?auto_15167 ) ( SURFACE-AT ?auto_15164 ?auto_15167 ) ( CLEAR ?auto_15164 ) ( IS-CRATE ?auto_15163 ) ( not ( = ?auto_15163 ?auto_15164 ) ) ( AVAILABLE ?auto_15169 ) ( not ( = ?auto_15170 ?auto_15167 ) ) ( HOIST-AT ?auto_15165 ?auto_15170 ) ( not ( = ?auto_15169 ?auto_15165 ) ) ( AVAILABLE ?auto_15165 ) ( SURFACE-AT ?auto_15163 ?auto_15170 ) ( ON ?auto_15163 ?auto_15166 ) ( CLEAR ?auto_15163 ) ( not ( = ?auto_15163 ?auto_15166 ) ) ( not ( = ?auto_15164 ?auto_15166 ) ) ( TRUCK-AT ?auto_15168 ?auto_15167 ) )
    :subtasks
    ( ( !DRIVE ?auto_15168 ?auto_15167 ?auto_15170 )
      ( MAKE-ON ?auto_15163 ?auto_15164 )
      ( MAKE-ON-VERIFY ?auto_15163 ?auto_15164 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15171 - SURFACE
      ?auto_15172 - SURFACE
    )
    :vars
    (
      ?auto_15177 - HOIST
      ?auto_15176 - PLACE
      ?auto_15174 - PLACE
      ?auto_15175 - HOIST
      ?auto_15173 - SURFACE
      ?auto_15178 - TRUCK
      ?auto_15179 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15177 ?auto_15176 ) ( IS-CRATE ?auto_15171 ) ( not ( = ?auto_15171 ?auto_15172 ) ) ( not ( = ?auto_15174 ?auto_15176 ) ) ( HOIST-AT ?auto_15175 ?auto_15174 ) ( not ( = ?auto_15177 ?auto_15175 ) ) ( AVAILABLE ?auto_15175 ) ( SURFACE-AT ?auto_15171 ?auto_15174 ) ( ON ?auto_15171 ?auto_15173 ) ( CLEAR ?auto_15171 ) ( not ( = ?auto_15171 ?auto_15173 ) ) ( not ( = ?auto_15172 ?auto_15173 ) ) ( TRUCK-AT ?auto_15178 ?auto_15176 ) ( SURFACE-AT ?auto_15179 ?auto_15176 ) ( CLEAR ?auto_15179 ) ( LIFTING ?auto_15177 ?auto_15172 ) ( IS-CRATE ?auto_15172 ) ( not ( = ?auto_15171 ?auto_15179 ) ) ( not ( = ?auto_15172 ?auto_15179 ) ) ( not ( = ?auto_15173 ?auto_15179 ) ) )
    :subtasks
    ( ( !DROP ?auto_15177 ?auto_15172 ?auto_15179 ?auto_15176 )
      ( MAKE-ON ?auto_15171 ?auto_15172 )
      ( MAKE-ON-VERIFY ?auto_15171 ?auto_15172 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15180 - SURFACE
      ?auto_15181 - SURFACE
    )
    :vars
    (
      ?auto_15183 - HOIST
      ?auto_15188 - PLACE
      ?auto_15184 - PLACE
      ?auto_15185 - HOIST
      ?auto_15187 - SURFACE
      ?auto_15186 - TRUCK
      ?auto_15182 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15183 ?auto_15188 ) ( IS-CRATE ?auto_15180 ) ( not ( = ?auto_15180 ?auto_15181 ) ) ( not ( = ?auto_15184 ?auto_15188 ) ) ( HOIST-AT ?auto_15185 ?auto_15184 ) ( not ( = ?auto_15183 ?auto_15185 ) ) ( AVAILABLE ?auto_15185 ) ( SURFACE-AT ?auto_15180 ?auto_15184 ) ( ON ?auto_15180 ?auto_15187 ) ( CLEAR ?auto_15180 ) ( not ( = ?auto_15180 ?auto_15187 ) ) ( not ( = ?auto_15181 ?auto_15187 ) ) ( TRUCK-AT ?auto_15186 ?auto_15188 ) ( SURFACE-AT ?auto_15182 ?auto_15188 ) ( CLEAR ?auto_15182 ) ( IS-CRATE ?auto_15181 ) ( not ( = ?auto_15180 ?auto_15182 ) ) ( not ( = ?auto_15181 ?auto_15182 ) ) ( not ( = ?auto_15187 ?auto_15182 ) ) ( AVAILABLE ?auto_15183 ) ( IN ?auto_15181 ?auto_15186 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15183 ?auto_15181 ?auto_15186 ?auto_15188 )
      ( MAKE-ON ?auto_15180 ?auto_15181 )
      ( MAKE-ON-VERIFY ?auto_15180 ?auto_15181 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15189 - SURFACE
      ?auto_15190 - SURFACE
    )
    :vars
    (
      ?auto_15194 - HOIST
      ?auto_15192 - PLACE
      ?auto_15191 - PLACE
      ?auto_15196 - HOIST
      ?auto_15195 - SURFACE
      ?auto_15197 - SURFACE
      ?auto_15193 - TRUCK
      ?auto_15198 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15194 ?auto_15192 ) ( IS-CRATE ?auto_15189 ) ( not ( = ?auto_15189 ?auto_15190 ) ) ( not ( = ?auto_15191 ?auto_15192 ) ) ( HOIST-AT ?auto_15196 ?auto_15191 ) ( not ( = ?auto_15194 ?auto_15196 ) ) ( AVAILABLE ?auto_15196 ) ( SURFACE-AT ?auto_15189 ?auto_15191 ) ( ON ?auto_15189 ?auto_15195 ) ( CLEAR ?auto_15189 ) ( not ( = ?auto_15189 ?auto_15195 ) ) ( not ( = ?auto_15190 ?auto_15195 ) ) ( SURFACE-AT ?auto_15197 ?auto_15192 ) ( CLEAR ?auto_15197 ) ( IS-CRATE ?auto_15190 ) ( not ( = ?auto_15189 ?auto_15197 ) ) ( not ( = ?auto_15190 ?auto_15197 ) ) ( not ( = ?auto_15195 ?auto_15197 ) ) ( AVAILABLE ?auto_15194 ) ( IN ?auto_15190 ?auto_15193 ) ( TRUCK-AT ?auto_15193 ?auto_15198 ) ( not ( = ?auto_15198 ?auto_15192 ) ) ( not ( = ?auto_15191 ?auto_15198 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15193 ?auto_15198 ?auto_15192 )
      ( MAKE-ON ?auto_15189 ?auto_15190 )
      ( MAKE-ON-VERIFY ?auto_15189 ?auto_15190 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15199 - SURFACE
      ?auto_15200 - SURFACE
    )
    :vars
    (
      ?auto_15203 - HOIST
      ?auto_15208 - PLACE
      ?auto_15207 - PLACE
      ?auto_15202 - HOIST
      ?auto_15201 - SURFACE
      ?auto_15204 - SURFACE
      ?auto_15205 - TRUCK
      ?auto_15206 - PLACE
      ?auto_15209 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15203 ?auto_15208 ) ( IS-CRATE ?auto_15199 ) ( not ( = ?auto_15199 ?auto_15200 ) ) ( not ( = ?auto_15207 ?auto_15208 ) ) ( HOIST-AT ?auto_15202 ?auto_15207 ) ( not ( = ?auto_15203 ?auto_15202 ) ) ( AVAILABLE ?auto_15202 ) ( SURFACE-AT ?auto_15199 ?auto_15207 ) ( ON ?auto_15199 ?auto_15201 ) ( CLEAR ?auto_15199 ) ( not ( = ?auto_15199 ?auto_15201 ) ) ( not ( = ?auto_15200 ?auto_15201 ) ) ( SURFACE-AT ?auto_15204 ?auto_15208 ) ( CLEAR ?auto_15204 ) ( IS-CRATE ?auto_15200 ) ( not ( = ?auto_15199 ?auto_15204 ) ) ( not ( = ?auto_15200 ?auto_15204 ) ) ( not ( = ?auto_15201 ?auto_15204 ) ) ( AVAILABLE ?auto_15203 ) ( TRUCK-AT ?auto_15205 ?auto_15206 ) ( not ( = ?auto_15206 ?auto_15208 ) ) ( not ( = ?auto_15207 ?auto_15206 ) ) ( HOIST-AT ?auto_15209 ?auto_15206 ) ( LIFTING ?auto_15209 ?auto_15200 ) ( not ( = ?auto_15203 ?auto_15209 ) ) ( not ( = ?auto_15202 ?auto_15209 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15209 ?auto_15200 ?auto_15205 ?auto_15206 )
      ( MAKE-ON ?auto_15199 ?auto_15200 )
      ( MAKE-ON-VERIFY ?auto_15199 ?auto_15200 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15210 - SURFACE
      ?auto_15211 - SURFACE
    )
    :vars
    (
      ?auto_15215 - HOIST
      ?auto_15213 - PLACE
      ?auto_15219 - PLACE
      ?auto_15212 - HOIST
      ?auto_15214 - SURFACE
      ?auto_15218 - SURFACE
      ?auto_15220 - TRUCK
      ?auto_15217 - PLACE
      ?auto_15216 - HOIST
      ?auto_15221 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15215 ?auto_15213 ) ( IS-CRATE ?auto_15210 ) ( not ( = ?auto_15210 ?auto_15211 ) ) ( not ( = ?auto_15219 ?auto_15213 ) ) ( HOIST-AT ?auto_15212 ?auto_15219 ) ( not ( = ?auto_15215 ?auto_15212 ) ) ( AVAILABLE ?auto_15212 ) ( SURFACE-AT ?auto_15210 ?auto_15219 ) ( ON ?auto_15210 ?auto_15214 ) ( CLEAR ?auto_15210 ) ( not ( = ?auto_15210 ?auto_15214 ) ) ( not ( = ?auto_15211 ?auto_15214 ) ) ( SURFACE-AT ?auto_15218 ?auto_15213 ) ( CLEAR ?auto_15218 ) ( IS-CRATE ?auto_15211 ) ( not ( = ?auto_15210 ?auto_15218 ) ) ( not ( = ?auto_15211 ?auto_15218 ) ) ( not ( = ?auto_15214 ?auto_15218 ) ) ( AVAILABLE ?auto_15215 ) ( TRUCK-AT ?auto_15220 ?auto_15217 ) ( not ( = ?auto_15217 ?auto_15213 ) ) ( not ( = ?auto_15219 ?auto_15217 ) ) ( HOIST-AT ?auto_15216 ?auto_15217 ) ( not ( = ?auto_15215 ?auto_15216 ) ) ( not ( = ?auto_15212 ?auto_15216 ) ) ( AVAILABLE ?auto_15216 ) ( SURFACE-AT ?auto_15211 ?auto_15217 ) ( ON ?auto_15211 ?auto_15221 ) ( CLEAR ?auto_15211 ) ( not ( = ?auto_15210 ?auto_15221 ) ) ( not ( = ?auto_15211 ?auto_15221 ) ) ( not ( = ?auto_15214 ?auto_15221 ) ) ( not ( = ?auto_15218 ?auto_15221 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15216 ?auto_15211 ?auto_15221 ?auto_15217 )
      ( MAKE-ON ?auto_15210 ?auto_15211 )
      ( MAKE-ON-VERIFY ?auto_15210 ?auto_15211 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15222 - SURFACE
      ?auto_15223 - SURFACE
    )
    :vars
    (
      ?auto_15233 - HOIST
      ?auto_15225 - PLACE
      ?auto_15232 - PLACE
      ?auto_15228 - HOIST
      ?auto_15230 - SURFACE
      ?auto_15229 - SURFACE
      ?auto_15226 - PLACE
      ?auto_15224 - HOIST
      ?auto_15227 - SURFACE
      ?auto_15231 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15233 ?auto_15225 ) ( IS-CRATE ?auto_15222 ) ( not ( = ?auto_15222 ?auto_15223 ) ) ( not ( = ?auto_15232 ?auto_15225 ) ) ( HOIST-AT ?auto_15228 ?auto_15232 ) ( not ( = ?auto_15233 ?auto_15228 ) ) ( AVAILABLE ?auto_15228 ) ( SURFACE-AT ?auto_15222 ?auto_15232 ) ( ON ?auto_15222 ?auto_15230 ) ( CLEAR ?auto_15222 ) ( not ( = ?auto_15222 ?auto_15230 ) ) ( not ( = ?auto_15223 ?auto_15230 ) ) ( SURFACE-AT ?auto_15229 ?auto_15225 ) ( CLEAR ?auto_15229 ) ( IS-CRATE ?auto_15223 ) ( not ( = ?auto_15222 ?auto_15229 ) ) ( not ( = ?auto_15223 ?auto_15229 ) ) ( not ( = ?auto_15230 ?auto_15229 ) ) ( AVAILABLE ?auto_15233 ) ( not ( = ?auto_15226 ?auto_15225 ) ) ( not ( = ?auto_15232 ?auto_15226 ) ) ( HOIST-AT ?auto_15224 ?auto_15226 ) ( not ( = ?auto_15233 ?auto_15224 ) ) ( not ( = ?auto_15228 ?auto_15224 ) ) ( AVAILABLE ?auto_15224 ) ( SURFACE-AT ?auto_15223 ?auto_15226 ) ( ON ?auto_15223 ?auto_15227 ) ( CLEAR ?auto_15223 ) ( not ( = ?auto_15222 ?auto_15227 ) ) ( not ( = ?auto_15223 ?auto_15227 ) ) ( not ( = ?auto_15230 ?auto_15227 ) ) ( not ( = ?auto_15229 ?auto_15227 ) ) ( TRUCK-AT ?auto_15231 ?auto_15225 ) )
    :subtasks
    ( ( !DRIVE ?auto_15231 ?auto_15225 ?auto_15226 )
      ( MAKE-ON ?auto_15222 ?auto_15223 )
      ( MAKE-ON-VERIFY ?auto_15222 ?auto_15223 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15236 - SURFACE
      ?auto_15237 - SURFACE
    )
    :vars
    (
      ?auto_15238 - HOIST
      ?auto_15239 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15238 ?auto_15239 ) ( SURFACE-AT ?auto_15237 ?auto_15239 ) ( CLEAR ?auto_15237 ) ( LIFTING ?auto_15238 ?auto_15236 ) ( IS-CRATE ?auto_15236 ) ( not ( = ?auto_15236 ?auto_15237 ) ) )
    :subtasks
    ( ( !DROP ?auto_15238 ?auto_15236 ?auto_15237 ?auto_15239 )
      ( MAKE-ON-VERIFY ?auto_15236 ?auto_15237 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15240 - SURFACE
      ?auto_15241 - SURFACE
    )
    :vars
    (
      ?auto_15242 - HOIST
      ?auto_15243 - PLACE
      ?auto_15244 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15242 ?auto_15243 ) ( SURFACE-AT ?auto_15241 ?auto_15243 ) ( CLEAR ?auto_15241 ) ( IS-CRATE ?auto_15240 ) ( not ( = ?auto_15240 ?auto_15241 ) ) ( TRUCK-AT ?auto_15244 ?auto_15243 ) ( AVAILABLE ?auto_15242 ) ( IN ?auto_15240 ?auto_15244 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15242 ?auto_15240 ?auto_15244 ?auto_15243 )
      ( MAKE-ON ?auto_15240 ?auto_15241 )
      ( MAKE-ON-VERIFY ?auto_15240 ?auto_15241 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15245 - SURFACE
      ?auto_15246 - SURFACE
    )
    :vars
    (
      ?auto_15247 - HOIST
      ?auto_15249 - PLACE
      ?auto_15248 - TRUCK
      ?auto_15250 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15247 ?auto_15249 ) ( SURFACE-AT ?auto_15246 ?auto_15249 ) ( CLEAR ?auto_15246 ) ( IS-CRATE ?auto_15245 ) ( not ( = ?auto_15245 ?auto_15246 ) ) ( AVAILABLE ?auto_15247 ) ( IN ?auto_15245 ?auto_15248 ) ( TRUCK-AT ?auto_15248 ?auto_15250 ) ( not ( = ?auto_15250 ?auto_15249 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15248 ?auto_15250 ?auto_15249 )
      ( MAKE-ON ?auto_15245 ?auto_15246 )
      ( MAKE-ON-VERIFY ?auto_15245 ?auto_15246 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15251 - SURFACE
      ?auto_15252 - SURFACE
    )
    :vars
    (
      ?auto_15256 - HOIST
      ?auto_15253 - PLACE
      ?auto_15255 - TRUCK
      ?auto_15254 - PLACE
      ?auto_15257 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15256 ?auto_15253 ) ( SURFACE-AT ?auto_15252 ?auto_15253 ) ( CLEAR ?auto_15252 ) ( IS-CRATE ?auto_15251 ) ( not ( = ?auto_15251 ?auto_15252 ) ) ( AVAILABLE ?auto_15256 ) ( TRUCK-AT ?auto_15255 ?auto_15254 ) ( not ( = ?auto_15254 ?auto_15253 ) ) ( HOIST-AT ?auto_15257 ?auto_15254 ) ( LIFTING ?auto_15257 ?auto_15251 ) ( not ( = ?auto_15256 ?auto_15257 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15257 ?auto_15251 ?auto_15255 ?auto_15254 )
      ( MAKE-ON ?auto_15251 ?auto_15252 )
      ( MAKE-ON-VERIFY ?auto_15251 ?auto_15252 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15258 - SURFACE
      ?auto_15259 - SURFACE
    )
    :vars
    (
      ?auto_15260 - HOIST
      ?auto_15264 - PLACE
      ?auto_15262 - TRUCK
      ?auto_15261 - PLACE
      ?auto_15263 - HOIST
      ?auto_15265 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15260 ?auto_15264 ) ( SURFACE-AT ?auto_15259 ?auto_15264 ) ( CLEAR ?auto_15259 ) ( IS-CRATE ?auto_15258 ) ( not ( = ?auto_15258 ?auto_15259 ) ) ( AVAILABLE ?auto_15260 ) ( TRUCK-AT ?auto_15262 ?auto_15261 ) ( not ( = ?auto_15261 ?auto_15264 ) ) ( HOIST-AT ?auto_15263 ?auto_15261 ) ( not ( = ?auto_15260 ?auto_15263 ) ) ( AVAILABLE ?auto_15263 ) ( SURFACE-AT ?auto_15258 ?auto_15261 ) ( ON ?auto_15258 ?auto_15265 ) ( CLEAR ?auto_15258 ) ( not ( = ?auto_15258 ?auto_15265 ) ) ( not ( = ?auto_15259 ?auto_15265 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15263 ?auto_15258 ?auto_15265 ?auto_15261 )
      ( MAKE-ON ?auto_15258 ?auto_15259 )
      ( MAKE-ON-VERIFY ?auto_15258 ?auto_15259 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15266 - SURFACE
      ?auto_15267 - SURFACE
    )
    :vars
    (
      ?auto_15268 - HOIST
      ?auto_15269 - PLACE
      ?auto_15273 - PLACE
      ?auto_15272 - HOIST
      ?auto_15271 - SURFACE
      ?auto_15270 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15268 ?auto_15269 ) ( SURFACE-AT ?auto_15267 ?auto_15269 ) ( CLEAR ?auto_15267 ) ( IS-CRATE ?auto_15266 ) ( not ( = ?auto_15266 ?auto_15267 ) ) ( AVAILABLE ?auto_15268 ) ( not ( = ?auto_15273 ?auto_15269 ) ) ( HOIST-AT ?auto_15272 ?auto_15273 ) ( not ( = ?auto_15268 ?auto_15272 ) ) ( AVAILABLE ?auto_15272 ) ( SURFACE-AT ?auto_15266 ?auto_15273 ) ( ON ?auto_15266 ?auto_15271 ) ( CLEAR ?auto_15266 ) ( not ( = ?auto_15266 ?auto_15271 ) ) ( not ( = ?auto_15267 ?auto_15271 ) ) ( TRUCK-AT ?auto_15270 ?auto_15269 ) )
    :subtasks
    ( ( !DRIVE ?auto_15270 ?auto_15269 ?auto_15273 )
      ( MAKE-ON ?auto_15266 ?auto_15267 )
      ( MAKE-ON-VERIFY ?auto_15266 ?auto_15267 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15274 - SURFACE
      ?auto_15275 - SURFACE
    )
    :vars
    (
      ?auto_15277 - HOIST
      ?auto_15278 - PLACE
      ?auto_15276 - PLACE
      ?auto_15281 - HOIST
      ?auto_15280 - SURFACE
      ?auto_15279 - TRUCK
      ?auto_15282 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15277 ?auto_15278 ) ( IS-CRATE ?auto_15274 ) ( not ( = ?auto_15274 ?auto_15275 ) ) ( not ( = ?auto_15276 ?auto_15278 ) ) ( HOIST-AT ?auto_15281 ?auto_15276 ) ( not ( = ?auto_15277 ?auto_15281 ) ) ( AVAILABLE ?auto_15281 ) ( SURFACE-AT ?auto_15274 ?auto_15276 ) ( ON ?auto_15274 ?auto_15280 ) ( CLEAR ?auto_15274 ) ( not ( = ?auto_15274 ?auto_15280 ) ) ( not ( = ?auto_15275 ?auto_15280 ) ) ( TRUCK-AT ?auto_15279 ?auto_15278 ) ( SURFACE-AT ?auto_15282 ?auto_15278 ) ( CLEAR ?auto_15282 ) ( LIFTING ?auto_15277 ?auto_15275 ) ( IS-CRATE ?auto_15275 ) ( not ( = ?auto_15274 ?auto_15282 ) ) ( not ( = ?auto_15275 ?auto_15282 ) ) ( not ( = ?auto_15280 ?auto_15282 ) ) )
    :subtasks
    ( ( !DROP ?auto_15277 ?auto_15275 ?auto_15282 ?auto_15278 )
      ( MAKE-ON ?auto_15274 ?auto_15275 )
      ( MAKE-ON-VERIFY ?auto_15274 ?auto_15275 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15283 - SURFACE
      ?auto_15284 - SURFACE
    )
    :vars
    (
      ?auto_15287 - HOIST
      ?auto_15286 - PLACE
      ?auto_15289 - PLACE
      ?auto_15288 - HOIST
      ?auto_15290 - SURFACE
      ?auto_15291 - TRUCK
      ?auto_15285 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15287 ?auto_15286 ) ( IS-CRATE ?auto_15283 ) ( not ( = ?auto_15283 ?auto_15284 ) ) ( not ( = ?auto_15289 ?auto_15286 ) ) ( HOIST-AT ?auto_15288 ?auto_15289 ) ( not ( = ?auto_15287 ?auto_15288 ) ) ( AVAILABLE ?auto_15288 ) ( SURFACE-AT ?auto_15283 ?auto_15289 ) ( ON ?auto_15283 ?auto_15290 ) ( CLEAR ?auto_15283 ) ( not ( = ?auto_15283 ?auto_15290 ) ) ( not ( = ?auto_15284 ?auto_15290 ) ) ( TRUCK-AT ?auto_15291 ?auto_15286 ) ( SURFACE-AT ?auto_15285 ?auto_15286 ) ( CLEAR ?auto_15285 ) ( IS-CRATE ?auto_15284 ) ( not ( = ?auto_15283 ?auto_15285 ) ) ( not ( = ?auto_15284 ?auto_15285 ) ) ( not ( = ?auto_15290 ?auto_15285 ) ) ( AVAILABLE ?auto_15287 ) ( IN ?auto_15284 ?auto_15291 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15287 ?auto_15284 ?auto_15291 ?auto_15286 )
      ( MAKE-ON ?auto_15283 ?auto_15284 )
      ( MAKE-ON-VERIFY ?auto_15283 ?auto_15284 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15292 - SURFACE
      ?auto_15293 - SURFACE
    )
    :vars
    (
      ?auto_15297 - HOIST
      ?auto_15299 - PLACE
      ?auto_15295 - PLACE
      ?auto_15296 - HOIST
      ?auto_15294 - SURFACE
      ?auto_15300 - SURFACE
      ?auto_15298 - TRUCK
      ?auto_15301 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15297 ?auto_15299 ) ( IS-CRATE ?auto_15292 ) ( not ( = ?auto_15292 ?auto_15293 ) ) ( not ( = ?auto_15295 ?auto_15299 ) ) ( HOIST-AT ?auto_15296 ?auto_15295 ) ( not ( = ?auto_15297 ?auto_15296 ) ) ( AVAILABLE ?auto_15296 ) ( SURFACE-AT ?auto_15292 ?auto_15295 ) ( ON ?auto_15292 ?auto_15294 ) ( CLEAR ?auto_15292 ) ( not ( = ?auto_15292 ?auto_15294 ) ) ( not ( = ?auto_15293 ?auto_15294 ) ) ( SURFACE-AT ?auto_15300 ?auto_15299 ) ( CLEAR ?auto_15300 ) ( IS-CRATE ?auto_15293 ) ( not ( = ?auto_15292 ?auto_15300 ) ) ( not ( = ?auto_15293 ?auto_15300 ) ) ( not ( = ?auto_15294 ?auto_15300 ) ) ( AVAILABLE ?auto_15297 ) ( IN ?auto_15293 ?auto_15298 ) ( TRUCK-AT ?auto_15298 ?auto_15301 ) ( not ( = ?auto_15301 ?auto_15299 ) ) ( not ( = ?auto_15295 ?auto_15301 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15298 ?auto_15301 ?auto_15299 )
      ( MAKE-ON ?auto_15292 ?auto_15293 )
      ( MAKE-ON-VERIFY ?auto_15292 ?auto_15293 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15302 - SURFACE
      ?auto_15303 - SURFACE
    )
    :vars
    (
      ?auto_15311 - HOIST
      ?auto_15310 - PLACE
      ?auto_15304 - PLACE
      ?auto_15307 - HOIST
      ?auto_15306 - SURFACE
      ?auto_15309 - SURFACE
      ?auto_15305 - TRUCK
      ?auto_15308 - PLACE
      ?auto_15312 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15311 ?auto_15310 ) ( IS-CRATE ?auto_15302 ) ( not ( = ?auto_15302 ?auto_15303 ) ) ( not ( = ?auto_15304 ?auto_15310 ) ) ( HOIST-AT ?auto_15307 ?auto_15304 ) ( not ( = ?auto_15311 ?auto_15307 ) ) ( AVAILABLE ?auto_15307 ) ( SURFACE-AT ?auto_15302 ?auto_15304 ) ( ON ?auto_15302 ?auto_15306 ) ( CLEAR ?auto_15302 ) ( not ( = ?auto_15302 ?auto_15306 ) ) ( not ( = ?auto_15303 ?auto_15306 ) ) ( SURFACE-AT ?auto_15309 ?auto_15310 ) ( CLEAR ?auto_15309 ) ( IS-CRATE ?auto_15303 ) ( not ( = ?auto_15302 ?auto_15309 ) ) ( not ( = ?auto_15303 ?auto_15309 ) ) ( not ( = ?auto_15306 ?auto_15309 ) ) ( AVAILABLE ?auto_15311 ) ( TRUCK-AT ?auto_15305 ?auto_15308 ) ( not ( = ?auto_15308 ?auto_15310 ) ) ( not ( = ?auto_15304 ?auto_15308 ) ) ( HOIST-AT ?auto_15312 ?auto_15308 ) ( LIFTING ?auto_15312 ?auto_15303 ) ( not ( = ?auto_15311 ?auto_15312 ) ) ( not ( = ?auto_15307 ?auto_15312 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15312 ?auto_15303 ?auto_15305 ?auto_15308 )
      ( MAKE-ON ?auto_15302 ?auto_15303 )
      ( MAKE-ON-VERIFY ?auto_15302 ?auto_15303 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15313 - SURFACE
      ?auto_15314 - SURFACE
    )
    :vars
    (
      ?auto_15316 - HOIST
      ?auto_15315 - PLACE
      ?auto_15318 - PLACE
      ?auto_15319 - HOIST
      ?auto_15317 - SURFACE
      ?auto_15320 - SURFACE
      ?auto_15323 - TRUCK
      ?auto_15321 - PLACE
      ?auto_15322 - HOIST
      ?auto_15324 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15316 ?auto_15315 ) ( IS-CRATE ?auto_15313 ) ( not ( = ?auto_15313 ?auto_15314 ) ) ( not ( = ?auto_15318 ?auto_15315 ) ) ( HOIST-AT ?auto_15319 ?auto_15318 ) ( not ( = ?auto_15316 ?auto_15319 ) ) ( AVAILABLE ?auto_15319 ) ( SURFACE-AT ?auto_15313 ?auto_15318 ) ( ON ?auto_15313 ?auto_15317 ) ( CLEAR ?auto_15313 ) ( not ( = ?auto_15313 ?auto_15317 ) ) ( not ( = ?auto_15314 ?auto_15317 ) ) ( SURFACE-AT ?auto_15320 ?auto_15315 ) ( CLEAR ?auto_15320 ) ( IS-CRATE ?auto_15314 ) ( not ( = ?auto_15313 ?auto_15320 ) ) ( not ( = ?auto_15314 ?auto_15320 ) ) ( not ( = ?auto_15317 ?auto_15320 ) ) ( AVAILABLE ?auto_15316 ) ( TRUCK-AT ?auto_15323 ?auto_15321 ) ( not ( = ?auto_15321 ?auto_15315 ) ) ( not ( = ?auto_15318 ?auto_15321 ) ) ( HOIST-AT ?auto_15322 ?auto_15321 ) ( not ( = ?auto_15316 ?auto_15322 ) ) ( not ( = ?auto_15319 ?auto_15322 ) ) ( AVAILABLE ?auto_15322 ) ( SURFACE-AT ?auto_15314 ?auto_15321 ) ( ON ?auto_15314 ?auto_15324 ) ( CLEAR ?auto_15314 ) ( not ( = ?auto_15313 ?auto_15324 ) ) ( not ( = ?auto_15314 ?auto_15324 ) ) ( not ( = ?auto_15317 ?auto_15324 ) ) ( not ( = ?auto_15320 ?auto_15324 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15322 ?auto_15314 ?auto_15324 ?auto_15321 )
      ( MAKE-ON ?auto_15313 ?auto_15314 )
      ( MAKE-ON-VERIFY ?auto_15313 ?auto_15314 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15325 - SURFACE
      ?auto_15326 - SURFACE
    )
    :vars
    (
      ?auto_15331 - HOIST
      ?auto_15328 - PLACE
      ?auto_15335 - PLACE
      ?auto_15333 - HOIST
      ?auto_15330 - SURFACE
      ?auto_15329 - SURFACE
      ?auto_15327 - PLACE
      ?auto_15332 - HOIST
      ?auto_15336 - SURFACE
      ?auto_15334 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15331 ?auto_15328 ) ( IS-CRATE ?auto_15325 ) ( not ( = ?auto_15325 ?auto_15326 ) ) ( not ( = ?auto_15335 ?auto_15328 ) ) ( HOIST-AT ?auto_15333 ?auto_15335 ) ( not ( = ?auto_15331 ?auto_15333 ) ) ( AVAILABLE ?auto_15333 ) ( SURFACE-AT ?auto_15325 ?auto_15335 ) ( ON ?auto_15325 ?auto_15330 ) ( CLEAR ?auto_15325 ) ( not ( = ?auto_15325 ?auto_15330 ) ) ( not ( = ?auto_15326 ?auto_15330 ) ) ( SURFACE-AT ?auto_15329 ?auto_15328 ) ( CLEAR ?auto_15329 ) ( IS-CRATE ?auto_15326 ) ( not ( = ?auto_15325 ?auto_15329 ) ) ( not ( = ?auto_15326 ?auto_15329 ) ) ( not ( = ?auto_15330 ?auto_15329 ) ) ( AVAILABLE ?auto_15331 ) ( not ( = ?auto_15327 ?auto_15328 ) ) ( not ( = ?auto_15335 ?auto_15327 ) ) ( HOIST-AT ?auto_15332 ?auto_15327 ) ( not ( = ?auto_15331 ?auto_15332 ) ) ( not ( = ?auto_15333 ?auto_15332 ) ) ( AVAILABLE ?auto_15332 ) ( SURFACE-AT ?auto_15326 ?auto_15327 ) ( ON ?auto_15326 ?auto_15336 ) ( CLEAR ?auto_15326 ) ( not ( = ?auto_15325 ?auto_15336 ) ) ( not ( = ?auto_15326 ?auto_15336 ) ) ( not ( = ?auto_15330 ?auto_15336 ) ) ( not ( = ?auto_15329 ?auto_15336 ) ) ( TRUCK-AT ?auto_15334 ?auto_15328 ) )
    :subtasks
    ( ( !DRIVE ?auto_15334 ?auto_15328 ?auto_15327 )
      ( MAKE-ON ?auto_15325 ?auto_15326 )
      ( MAKE-ON-VERIFY ?auto_15325 ?auto_15326 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15337 - SURFACE
      ?auto_15338 - SURFACE
    )
    :vars
    (
      ?auto_15341 - HOIST
      ?auto_15344 - PLACE
      ?auto_15343 - PLACE
      ?auto_15348 - HOIST
      ?auto_15345 - SURFACE
      ?auto_15342 - SURFACE
      ?auto_15346 - PLACE
      ?auto_15347 - HOIST
      ?auto_15339 - SURFACE
      ?auto_15340 - TRUCK
      ?auto_15349 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15341 ?auto_15344 ) ( IS-CRATE ?auto_15337 ) ( not ( = ?auto_15337 ?auto_15338 ) ) ( not ( = ?auto_15343 ?auto_15344 ) ) ( HOIST-AT ?auto_15348 ?auto_15343 ) ( not ( = ?auto_15341 ?auto_15348 ) ) ( AVAILABLE ?auto_15348 ) ( SURFACE-AT ?auto_15337 ?auto_15343 ) ( ON ?auto_15337 ?auto_15345 ) ( CLEAR ?auto_15337 ) ( not ( = ?auto_15337 ?auto_15345 ) ) ( not ( = ?auto_15338 ?auto_15345 ) ) ( IS-CRATE ?auto_15338 ) ( not ( = ?auto_15337 ?auto_15342 ) ) ( not ( = ?auto_15338 ?auto_15342 ) ) ( not ( = ?auto_15345 ?auto_15342 ) ) ( not ( = ?auto_15346 ?auto_15344 ) ) ( not ( = ?auto_15343 ?auto_15346 ) ) ( HOIST-AT ?auto_15347 ?auto_15346 ) ( not ( = ?auto_15341 ?auto_15347 ) ) ( not ( = ?auto_15348 ?auto_15347 ) ) ( AVAILABLE ?auto_15347 ) ( SURFACE-AT ?auto_15338 ?auto_15346 ) ( ON ?auto_15338 ?auto_15339 ) ( CLEAR ?auto_15338 ) ( not ( = ?auto_15337 ?auto_15339 ) ) ( not ( = ?auto_15338 ?auto_15339 ) ) ( not ( = ?auto_15345 ?auto_15339 ) ) ( not ( = ?auto_15342 ?auto_15339 ) ) ( TRUCK-AT ?auto_15340 ?auto_15344 ) ( SURFACE-AT ?auto_15349 ?auto_15344 ) ( CLEAR ?auto_15349 ) ( LIFTING ?auto_15341 ?auto_15342 ) ( IS-CRATE ?auto_15342 ) ( not ( = ?auto_15337 ?auto_15349 ) ) ( not ( = ?auto_15338 ?auto_15349 ) ) ( not ( = ?auto_15345 ?auto_15349 ) ) ( not ( = ?auto_15342 ?auto_15349 ) ) ( not ( = ?auto_15339 ?auto_15349 ) ) )
    :subtasks
    ( ( !DROP ?auto_15341 ?auto_15342 ?auto_15349 ?auto_15344 )
      ( MAKE-ON ?auto_15337 ?auto_15338 )
      ( MAKE-ON-VERIFY ?auto_15337 ?auto_15338 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15350 - SURFACE
      ?auto_15351 - SURFACE
    )
    :vars
    (
      ?auto_15362 - HOIST
      ?auto_15360 - PLACE
      ?auto_15357 - PLACE
      ?auto_15352 - HOIST
      ?auto_15359 - SURFACE
      ?auto_15356 - SURFACE
      ?auto_15358 - PLACE
      ?auto_15354 - HOIST
      ?auto_15353 - SURFACE
      ?auto_15355 - TRUCK
      ?auto_15361 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15362 ?auto_15360 ) ( IS-CRATE ?auto_15350 ) ( not ( = ?auto_15350 ?auto_15351 ) ) ( not ( = ?auto_15357 ?auto_15360 ) ) ( HOIST-AT ?auto_15352 ?auto_15357 ) ( not ( = ?auto_15362 ?auto_15352 ) ) ( AVAILABLE ?auto_15352 ) ( SURFACE-AT ?auto_15350 ?auto_15357 ) ( ON ?auto_15350 ?auto_15359 ) ( CLEAR ?auto_15350 ) ( not ( = ?auto_15350 ?auto_15359 ) ) ( not ( = ?auto_15351 ?auto_15359 ) ) ( IS-CRATE ?auto_15351 ) ( not ( = ?auto_15350 ?auto_15356 ) ) ( not ( = ?auto_15351 ?auto_15356 ) ) ( not ( = ?auto_15359 ?auto_15356 ) ) ( not ( = ?auto_15358 ?auto_15360 ) ) ( not ( = ?auto_15357 ?auto_15358 ) ) ( HOIST-AT ?auto_15354 ?auto_15358 ) ( not ( = ?auto_15362 ?auto_15354 ) ) ( not ( = ?auto_15352 ?auto_15354 ) ) ( AVAILABLE ?auto_15354 ) ( SURFACE-AT ?auto_15351 ?auto_15358 ) ( ON ?auto_15351 ?auto_15353 ) ( CLEAR ?auto_15351 ) ( not ( = ?auto_15350 ?auto_15353 ) ) ( not ( = ?auto_15351 ?auto_15353 ) ) ( not ( = ?auto_15359 ?auto_15353 ) ) ( not ( = ?auto_15356 ?auto_15353 ) ) ( TRUCK-AT ?auto_15355 ?auto_15360 ) ( SURFACE-AT ?auto_15361 ?auto_15360 ) ( CLEAR ?auto_15361 ) ( IS-CRATE ?auto_15356 ) ( not ( = ?auto_15350 ?auto_15361 ) ) ( not ( = ?auto_15351 ?auto_15361 ) ) ( not ( = ?auto_15359 ?auto_15361 ) ) ( not ( = ?auto_15356 ?auto_15361 ) ) ( not ( = ?auto_15353 ?auto_15361 ) ) ( AVAILABLE ?auto_15362 ) ( IN ?auto_15356 ?auto_15355 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15362 ?auto_15356 ?auto_15355 ?auto_15360 )
      ( MAKE-ON ?auto_15350 ?auto_15351 )
      ( MAKE-ON-VERIFY ?auto_15350 ?auto_15351 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15363 - SURFACE
      ?auto_15364 - SURFACE
    )
    :vars
    (
      ?auto_15367 - HOIST
      ?auto_15365 - PLACE
      ?auto_15366 - PLACE
      ?auto_15370 - HOIST
      ?auto_15368 - SURFACE
      ?auto_15375 - SURFACE
      ?auto_15374 - PLACE
      ?auto_15372 - HOIST
      ?auto_15373 - SURFACE
      ?auto_15371 - SURFACE
      ?auto_15369 - TRUCK
      ?auto_15376 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15367 ?auto_15365 ) ( IS-CRATE ?auto_15363 ) ( not ( = ?auto_15363 ?auto_15364 ) ) ( not ( = ?auto_15366 ?auto_15365 ) ) ( HOIST-AT ?auto_15370 ?auto_15366 ) ( not ( = ?auto_15367 ?auto_15370 ) ) ( AVAILABLE ?auto_15370 ) ( SURFACE-AT ?auto_15363 ?auto_15366 ) ( ON ?auto_15363 ?auto_15368 ) ( CLEAR ?auto_15363 ) ( not ( = ?auto_15363 ?auto_15368 ) ) ( not ( = ?auto_15364 ?auto_15368 ) ) ( IS-CRATE ?auto_15364 ) ( not ( = ?auto_15363 ?auto_15375 ) ) ( not ( = ?auto_15364 ?auto_15375 ) ) ( not ( = ?auto_15368 ?auto_15375 ) ) ( not ( = ?auto_15374 ?auto_15365 ) ) ( not ( = ?auto_15366 ?auto_15374 ) ) ( HOIST-AT ?auto_15372 ?auto_15374 ) ( not ( = ?auto_15367 ?auto_15372 ) ) ( not ( = ?auto_15370 ?auto_15372 ) ) ( AVAILABLE ?auto_15372 ) ( SURFACE-AT ?auto_15364 ?auto_15374 ) ( ON ?auto_15364 ?auto_15373 ) ( CLEAR ?auto_15364 ) ( not ( = ?auto_15363 ?auto_15373 ) ) ( not ( = ?auto_15364 ?auto_15373 ) ) ( not ( = ?auto_15368 ?auto_15373 ) ) ( not ( = ?auto_15375 ?auto_15373 ) ) ( SURFACE-AT ?auto_15371 ?auto_15365 ) ( CLEAR ?auto_15371 ) ( IS-CRATE ?auto_15375 ) ( not ( = ?auto_15363 ?auto_15371 ) ) ( not ( = ?auto_15364 ?auto_15371 ) ) ( not ( = ?auto_15368 ?auto_15371 ) ) ( not ( = ?auto_15375 ?auto_15371 ) ) ( not ( = ?auto_15373 ?auto_15371 ) ) ( AVAILABLE ?auto_15367 ) ( IN ?auto_15375 ?auto_15369 ) ( TRUCK-AT ?auto_15369 ?auto_15376 ) ( not ( = ?auto_15376 ?auto_15365 ) ) ( not ( = ?auto_15366 ?auto_15376 ) ) ( not ( = ?auto_15374 ?auto_15376 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15369 ?auto_15376 ?auto_15365 )
      ( MAKE-ON ?auto_15363 ?auto_15364 )
      ( MAKE-ON-VERIFY ?auto_15363 ?auto_15364 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15377 - SURFACE
      ?auto_15378 - SURFACE
    )
    :vars
    (
      ?auto_15382 - HOIST
      ?auto_15386 - PLACE
      ?auto_15385 - PLACE
      ?auto_15383 - HOIST
      ?auto_15384 - SURFACE
      ?auto_15389 - SURFACE
      ?auto_15387 - PLACE
      ?auto_15388 - HOIST
      ?auto_15380 - SURFACE
      ?auto_15381 - SURFACE
      ?auto_15390 - TRUCK
      ?auto_15379 - PLACE
      ?auto_15391 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15382 ?auto_15386 ) ( IS-CRATE ?auto_15377 ) ( not ( = ?auto_15377 ?auto_15378 ) ) ( not ( = ?auto_15385 ?auto_15386 ) ) ( HOIST-AT ?auto_15383 ?auto_15385 ) ( not ( = ?auto_15382 ?auto_15383 ) ) ( AVAILABLE ?auto_15383 ) ( SURFACE-AT ?auto_15377 ?auto_15385 ) ( ON ?auto_15377 ?auto_15384 ) ( CLEAR ?auto_15377 ) ( not ( = ?auto_15377 ?auto_15384 ) ) ( not ( = ?auto_15378 ?auto_15384 ) ) ( IS-CRATE ?auto_15378 ) ( not ( = ?auto_15377 ?auto_15389 ) ) ( not ( = ?auto_15378 ?auto_15389 ) ) ( not ( = ?auto_15384 ?auto_15389 ) ) ( not ( = ?auto_15387 ?auto_15386 ) ) ( not ( = ?auto_15385 ?auto_15387 ) ) ( HOIST-AT ?auto_15388 ?auto_15387 ) ( not ( = ?auto_15382 ?auto_15388 ) ) ( not ( = ?auto_15383 ?auto_15388 ) ) ( AVAILABLE ?auto_15388 ) ( SURFACE-AT ?auto_15378 ?auto_15387 ) ( ON ?auto_15378 ?auto_15380 ) ( CLEAR ?auto_15378 ) ( not ( = ?auto_15377 ?auto_15380 ) ) ( not ( = ?auto_15378 ?auto_15380 ) ) ( not ( = ?auto_15384 ?auto_15380 ) ) ( not ( = ?auto_15389 ?auto_15380 ) ) ( SURFACE-AT ?auto_15381 ?auto_15386 ) ( CLEAR ?auto_15381 ) ( IS-CRATE ?auto_15389 ) ( not ( = ?auto_15377 ?auto_15381 ) ) ( not ( = ?auto_15378 ?auto_15381 ) ) ( not ( = ?auto_15384 ?auto_15381 ) ) ( not ( = ?auto_15389 ?auto_15381 ) ) ( not ( = ?auto_15380 ?auto_15381 ) ) ( AVAILABLE ?auto_15382 ) ( TRUCK-AT ?auto_15390 ?auto_15379 ) ( not ( = ?auto_15379 ?auto_15386 ) ) ( not ( = ?auto_15385 ?auto_15379 ) ) ( not ( = ?auto_15387 ?auto_15379 ) ) ( HOIST-AT ?auto_15391 ?auto_15379 ) ( LIFTING ?auto_15391 ?auto_15389 ) ( not ( = ?auto_15382 ?auto_15391 ) ) ( not ( = ?auto_15383 ?auto_15391 ) ) ( not ( = ?auto_15388 ?auto_15391 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15391 ?auto_15389 ?auto_15390 ?auto_15379 )
      ( MAKE-ON ?auto_15377 ?auto_15378 )
      ( MAKE-ON-VERIFY ?auto_15377 ?auto_15378 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15392 - SURFACE
      ?auto_15393 - SURFACE
    )
    :vars
    (
      ?auto_15395 - HOIST
      ?auto_15394 - PLACE
      ?auto_15401 - PLACE
      ?auto_15396 - HOIST
      ?auto_15397 - SURFACE
      ?auto_15403 - SURFACE
      ?auto_15400 - PLACE
      ?auto_15406 - HOIST
      ?auto_15404 - SURFACE
      ?auto_15399 - SURFACE
      ?auto_15398 - TRUCK
      ?auto_15405 - PLACE
      ?auto_15402 - HOIST
      ?auto_15407 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15395 ?auto_15394 ) ( IS-CRATE ?auto_15392 ) ( not ( = ?auto_15392 ?auto_15393 ) ) ( not ( = ?auto_15401 ?auto_15394 ) ) ( HOIST-AT ?auto_15396 ?auto_15401 ) ( not ( = ?auto_15395 ?auto_15396 ) ) ( AVAILABLE ?auto_15396 ) ( SURFACE-AT ?auto_15392 ?auto_15401 ) ( ON ?auto_15392 ?auto_15397 ) ( CLEAR ?auto_15392 ) ( not ( = ?auto_15392 ?auto_15397 ) ) ( not ( = ?auto_15393 ?auto_15397 ) ) ( IS-CRATE ?auto_15393 ) ( not ( = ?auto_15392 ?auto_15403 ) ) ( not ( = ?auto_15393 ?auto_15403 ) ) ( not ( = ?auto_15397 ?auto_15403 ) ) ( not ( = ?auto_15400 ?auto_15394 ) ) ( not ( = ?auto_15401 ?auto_15400 ) ) ( HOIST-AT ?auto_15406 ?auto_15400 ) ( not ( = ?auto_15395 ?auto_15406 ) ) ( not ( = ?auto_15396 ?auto_15406 ) ) ( AVAILABLE ?auto_15406 ) ( SURFACE-AT ?auto_15393 ?auto_15400 ) ( ON ?auto_15393 ?auto_15404 ) ( CLEAR ?auto_15393 ) ( not ( = ?auto_15392 ?auto_15404 ) ) ( not ( = ?auto_15393 ?auto_15404 ) ) ( not ( = ?auto_15397 ?auto_15404 ) ) ( not ( = ?auto_15403 ?auto_15404 ) ) ( SURFACE-AT ?auto_15399 ?auto_15394 ) ( CLEAR ?auto_15399 ) ( IS-CRATE ?auto_15403 ) ( not ( = ?auto_15392 ?auto_15399 ) ) ( not ( = ?auto_15393 ?auto_15399 ) ) ( not ( = ?auto_15397 ?auto_15399 ) ) ( not ( = ?auto_15403 ?auto_15399 ) ) ( not ( = ?auto_15404 ?auto_15399 ) ) ( AVAILABLE ?auto_15395 ) ( TRUCK-AT ?auto_15398 ?auto_15405 ) ( not ( = ?auto_15405 ?auto_15394 ) ) ( not ( = ?auto_15401 ?auto_15405 ) ) ( not ( = ?auto_15400 ?auto_15405 ) ) ( HOIST-AT ?auto_15402 ?auto_15405 ) ( not ( = ?auto_15395 ?auto_15402 ) ) ( not ( = ?auto_15396 ?auto_15402 ) ) ( not ( = ?auto_15406 ?auto_15402 ) ) ( AVAILABLE ?auto_15402 ) ( SURFACE-AT ?auto_15403 ?auto_15405 ) ( ON ?auto_15403 ?auto_15407 ) ( CLEAR ?auto_15403 ) ( not ( = ?auto_15392 ?auto_15407 ) ) ( not ( = ?auto_15393 ?auto_15407 ) ) ( not ( = ?auto_15397 ?auto_15407 ) ) ( not ( = ?auto_15403 ?auto_15407 ) ) ( not ( = ?auto_15404 ?auto_15407 ) ) ( not ( = ?auto_15399 ?auto_15407 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15402 ?auto_15403 ?auto_15407 ?auto_15405 )
      ( MAKE-ON ?auto_15392 ?auto_15393 )
      ( MAKE-ON-VERIFY ?auto_15392 ?auto_15393 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15408 - SURFACE
      ?auto_15409 - SURFACE
    )
    :vars
    (
      ?auto_15419 - HOIST
      ?auto_15410 - PLACE
      ?auto_15412 - PLACE
      ?auto_15420 - HOIST
      ?auto_15415 - SURFACE
      ?auto_15421 - SURFACE
      ?auto_15411 - PLACE
      ?auto_15417 - HOIST
      ?auto_15423 - SURFACE
      ?auto_15414 - SURFACE
      ?auto_15416 - PLACE
      ?auto_15422 - HOIST
      ?auto_15418 - SURFACE
      ?auto_15413 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15419 ?auto_15410 ) ( IS-CRATE ?auto_15408 ) ( not ( = ?auto_15408 ?auto_15409 ) ) ( not ( = ?auto_15412 ?auto_15410 ) ) ( HOIST-AT ?auto_15420 ?auto_15412 ) ( not ( = ?auto_15419 ?auto_15420 ) ) ( AVAILABLE ?auto_15420 ) ( SURFACE-AT ?auto_15408 ?auto_15412 ) ( ON ?auto_15408 ?auto_15415 ) ( CLEAR ?auto_15408 ) ( not ( = ?auto_15408 ?auto_15415 ) ) ( not ( = ?auto_15409 ?auto_15415 ) ) ( IS-CRATE ?auto_15409 ) ( not ( = ?auto_15408 ?auto_15421 ) ) ( not ( = ?auto_15409 ?auto_15421 ) ) ( not ( = ?auto_15415 ?auto_15421 ) ) ( not ( = ?auto_15411 ?auto_15410 ) ) ( not ( = ?auto_15412 ?auto_15411 ) ) ( HOIST-AT ?auto_15417 ?auto_15411 ) ( not ( = ?auto_15419 ?auto_15417 ) ) ( not ( = ?auto_15420 ?auto_15417 ) ) ( AVAILABLE ?auto_15417 ) ( SURFACE-AT ?auto_15409 ?auto_15411 ) ( ON ?auto_15409 ?auto_15423 ) ( CLEAR ?auto_15409 ) ( not ( = ?auto_15408 ?auto_15423 ) ) ( not ( = ?auto_15409 ?auto_15423 ) ) ( not ( = ?auto_15415 ?auto_15423 ) ) ( not ( = ?auto_15421 ?auto_15423 ) ) ( SURFACE-AT ?auto_15414 ?auto_15410 ) ( CLEAR ?auto_15414 ) ( IS-CRATE ?auto_15421 ) ( not ( = ?auto_15408 ?auto_15414 ) ) ( not ( = ?auto_15409 ?auto_15414 ) ) ( not ( = ?auto_15415 ?auto_15414 ) ) ( not ( = ?auto_15421 ?auto_15414 ) ) ( not ( = ?auto_15423 ?auto_15414 ) ) ( AVAILABLE ?auto_15419 ) ( not ( = ?auto_15416 ?auto_15410 ) ) ( not ( = ?auto_15412 ?auto_15416 ) ) ( not ( = ?auto_15411 ?auto_15416 ) ) ( HOIST-AT ?auto_15422 ?auto_15416 ) ( not ( = ?auto_15419 ?auto_15422 ) ) ( not ( = ?auto_15420 ?auto_15422 ) ) ( not ( = ?auto_15417 ?auto_15422 ) ) ( AVAILABLE ?auto_15422 ) ( SURFACE-AT ?auto_15421 ?auto_15416 ) ( ON ?auto_15421 ?auto_15418 ) ( CLEAR ?auto_15421 ) ( not ( = ?auto_15408 ?auto_15418 ) ) ( not ( = ?auto_15409 ?auto_15418 ) ) ( not ( = ?auto_15415 ?auto_15418 ) ) ( not ( = ?auto_15421 ?auto_15418 ) ) ( not ( = ?auto_15423 ?auto_15418 ) ) ( not ( = ?auto_15414 ?auto_15418 ) ) ( TRUCK-AT ?auto_15413 ?auto_15410 ) )
    :subtasks
    ( ( !DRIVE ?auto_15413 ?auto_15410 ?auto_15416 )
      ( MAKE-ON ?auto_15408 ?auto_15409 )
      ( MAKE-ON-VERIFY ?auto_15408 ?auto_15409 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15426 - SURFACE
      ?auto_15427 - SURFACE
    )
    :vars
    (
      ?auto_15428 - HOIST
      ?auto_15429 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15428 ?auto_15429 ) ( SURFACE-AT ?auto_15427 ?auto_15429 ) ( CLEAR ?auto_15427 ) ( LIFTING ?auto_15428 ?auto_15426 ) ( IS-CRATE ?auto_15426 ) ( not ( = ?auto_15426 ?auto_15427 ) ) )
    :subtasks
    ( ( !DROP ?auto_15428 ?auto_15426 ?auto_15427 ?auto_15429 )
      ( MAKE-ON-VERIFY ?auto_15426 ?auto_15427 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15430 - SURFACE
      ?auto_15431 - SURFACE
    )
    :vars
    (
      ?auto_15433 - HOIST
      ?auto_15432 - PLACE
      ?auto_15434 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15433 ?auto_15432 ) ( SURFACE-AT ?auto_15431 ?auto_15432 ) ( CLEAR ?auto_15431 ) ( IS-CRATE ?auto_15430 ) ( not ( = ?auto_15430 ?auto_15431 ) ) ( TRUCK-AT ?auto_15434 ?auto_15432 ) ( AVAILABLE ?auto_15433 ) ( IN ?auto_15430 ?auto_15434 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15433 ?auto_15430 ?auto_15434 ?auto_15432 )
      ( MAKE-ON ?auto_15430 ?auto_15431 )
      ( MAKE-ON-VERIFY ?auto_15430 ?auto_15431 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15435 - SURFACE
      ?auto_15436 - SURFACE
    )
    :vars
    (
      ?auto_15438 - HOIST
      ?auto_15439 - PLACE
      ?auto_15437 - TRUCK
      ?auto_15440 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15438 ?auto_15439 ) ( SURFACE-AT ?auto_15436 ?auto_15439 ) ( CLEAR ?auto_15436 ) ( IS-CRATE ?auto_15435 ) ( not ( = ?auto_15435 ?auto_15436 ) ) ( AVAILABLE ?auto_15438 ) ( IN ?auto_15435 ?auto_15437 ) ( TRUCK-AT ?auto_15437 ?auto_15440 ) ( not ( = ?auto_15440 ?auto_15439 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15437 ?auto_15440 ?auto_15439 )
      ( MAKE-ON ?auto_15435 ?auto_15436 )
      ( MAKE-ON-VERIFY ?auto_15435 ?auto_15436 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15441 - SURFACE
      ?auto_15442 - SURFACE
    )
    :vars
    (
      ?auto_15443 - HOIST
      ?auto_15445 - PLACE
      ?auto_15446 - TRUCK
      ?auto_15444 - PLACE
      ?auto_15447 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15443 ?auto_15445 ) ( SURFACE-AT ?auto_15442 ?auto_15445 ) ( CLEAR ?auto_15442 ) ( IS-CRATE ?auto_15441 ) ( not ( = ?auto_15441 ?auto_15442 ) ) ( AVAILABLE ?auto_15443 ) ( TRUCK-AT ?auto_15446 ?auto_15444 ) ( not ( = ?auto_15444 ?auto_15445 ) ) ( HOIST-AT ?auto_15447 ?auto_15444 ) ( LIFTING ?auto_15447 ?auto_15441 ) ( not ( = ?auto_15443 ?auto_15447 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15447 ?auto_15441 ?auto_15446 ?auto_15444 )
      ( MAKE-ON ?auto_15441 ?auto_15442 )
      ( MAKE-ON-VERIFY ?auto_15441 ?auto_15442 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15448 - SURFACE
      ?auto_15449 - SURFACE
    )
    :vars
    (
      ?auto_15453 - HOIST
      ?auto_15452 - PLACE
      ?auto_15454 - TRUCK
      ?auto_15451 - PLACE
      ?auto_15450 - HOIST
      ?auto_15455 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15453 ?auto_15452 ) ( SURFACE-AT ?auto_15449 ?auto_15452 ) ( CLEAR ?auto_15449 ) ( IS-CRATE ?auto_15448 ) ( not ( = ?auto_15448 ?auto_15449 ) ) ( AVAILABLE ?auto_15453 ) ( TRUCK-AT ?auto_15454 ?auto_15451 ) ( not ( = ?auto_15451 ?auto_15452 ) ) ( HOIST-AT ?auto_15450 ?auto_15451 ) ( not ( = ?auto_15453 ?auto_15450 ) ) ( AVAILABLE ?auto_15450 ) ( SURFACE-AT ?auto_15448 ?auto_15451 ) ( ON ?auto_15448 ?auto_15455 ) ( CLEAR ?auto_15448 ) ( not ( = ?auto_15448 ?auto_15455 ) ) ( not ( = ?auto_15449 ?auto_15455 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15450 ?auto_15448 ?auto_15455 ?auto_15451 )
      ( MAKE-ON ?auto_15448 ?auto_15449 )
      ( MAKE-ON-VERIFY ?auto_15448 ?auto_15449 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15456 - SURFACE
      ?auto_15457 - SURFACE
    )
    :vars
    (
      ?auto_15458 - HOIST
      ?auto_15460 - PLACE
      ?auto_15462 - PLACE
      ?auto_15461 - HOIST
      ?auto_15459 - SURFACE
      ?auto_15463 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15458 ?auto_15460 ) ( SURFACE-AT ?auto_15457 ?auto_15460 ) ( CLEAR ?auto_15457 ) ( IS-CRATE ?auto_15456 ) ( not ( = ?auto_15456 ?auto_15457 ) ) ( AVAILABLE ?auto_15458 ) ( not ( = ?auto_15462 ?auto_15460 ) ) ( HOIST-AT ?auto_15461 ?auto_15462 ) ( not ( = ?auto_15458 ?auto_15461 ) ) ( AVAILABLE ?auto_15461 ) ( SURFACE-AT ?auto_15456 ?auto_15462 ) ( ON ?auto_15456 ?auto_15459 ) ( CLEAR ?auto_15456 ) ( not ( = ?auto_15456 ?auto_15459 ) ) ( not ( = ?auto_15457 ?auto_15459 ) ) ( TRUCK-AT ?auto_15463 ?auto_15460 ) )
    :subtasks
    ( ( !DRIVE ?auto_15463 ?auto_15460 ?auto_15462 )
      ( MAKE-ON ?auto_15456 ?auto_15457 )
      ( MAKE-ON-VERIFY ?auto_15456 ?auto_15457 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15464 - SURFACE
      ?auto_15465 - SURFACE
    )
    :vars
    (
      ?auto_15468 - HOIST
      ?auto_15470 - PLACE
      ?auto_15471 - PLACE
      ?auto_15469 - HOIST
      ?auto_15467 - SURFACE
      ?auto_15466 - TRUCK
      ?auto_15472 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15468 ?auto_15470 ) ( IS-CRATE ?auto_15464 ) ( not ( = ?auto_15464 ?auto_15465 ) ) ( not ( = ?auto_15471 ?auto_15470 ) ) ( HOIST-AT ?auto_15469 ?auto_15471 ) ( not ( = ?auto_15468 ?auto_15469 ) ) ( AVAILABLE ?auto_15469 ) ( SURFACE-AT ?auto_15464 ?auto_15471 ) ( ON ?auto_15464 ?auto_15467 ) ( CLEAR ?auto_15464 ) ( not ( = ?auto_15464 ?auto_15467 ) ) ( not ( = ?auto_15465 ?auto_15467 ) ) ( TRUCK-AT ?auto_15466 ?auto_15470 ) ( SURFACE-AT ?auto_15472 ?auto_15470 ) ( CLEAR ?auto_15472 ) ( LIFTING ?auto_15468 ?auto_15465 ) ( IS-CRATE ?auto_15465 ) ( not ( = ?auto_15464 ?auto_15472 ) ) ( not ( = ?auto_15465 ?auto_15472 ) ) ( not ( = ?auto_15467 ?auto_15472 ) ) )
    :subtasks
    ( ( !DROP ?auto_15468 ?auto_15465 ?auto_15472 ?auto_15470 )
      ( MAKE-ON ?auto_15464 ?auto_15465 )
      ( MAKE-ON-VERIFY ?auto_15464 ?auto_15465 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15473 - SURFACE
      ?auto_15474 - SURFACE
    )
    :vars
    (
      ?auto_15476 - HOIST
      ?auto_15477 - PLACE
      ?auto_15481 - PLACE
      ?auto_15480 - HOIST
      ?auto_15475 - SURFACE
      ?auto_15478 - TRUCK
      ?auto_15479 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15476 ?auto_15477 ) ( IS-CRATE ?auto_15473 ) ( not ( = ?auto_15473 ?auto_15474 ) ) ( not ( = ?auto_15481 ?auto_15477 ) ) ( HOIST-AT ?auto_15480 ?auto_15481 ) ( not ( = ?auto_15476 ?auto_15480 ) ) ( AVAILABLE ?auto_15480 ) ( SURFACE-AT ?auto_15473 ?auto_15481 ) ( ON ?auto_15473 ?auto_15475 ) ( CLEAR ?auto_15473 ) ( not ( = ?auto_15473 ?auto_15475 ) ) ( not ( = ?auto_15474 ?auto_15475 ) ) ( TRUCK-AT ?auto_15478 ?auto_15477 ) ( SURFACE-AT ?auto_15479 ?auto_15477 ) ( CLEAR ?auto_15479 ) ( IS-CRATE ?auto_15474 ) ( not ( = ?auto_15473 ?auto_15479 ) ) ( not ( = ?auto_15474 ?auto_15479 ) ) ( not ( = ?auto_15475 ?auto_15479 ) ) ( AVAILABLE ?auto_15476 ) ( IN ?auto_15474 ?auto_15478 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15476 ?auto_15474 ?auto_15478 ?auto_15477 )
      ( MAKE-ON ?auto_15473 ?auto_15474 )
      ( MAKE-ON-VERIFY ?auto_15473 ?auto_15474 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15482 - SURFACE
      ?auto_15483 - SURFACE
    )
    :vars
    (
      ?auto_15486 - HOIST
      ?auto_15489 - PLACE
      ?auto_15487 - PLACE
      ?auto_15490 - HOIST
      ?auto_15488 - SURFACE
      ?auto_15485 - SURFACE
      ?auto_15484 - TRUCK
      ?auto_15491 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15486 ?auto_15489 ) ( IS-CRATE ?auto_15482 ) ( not ( = ?auto_15482 ?auto_15483 ) ) ( not ( = ?auto_15487 ?auto_15489 ) ) ( HOIST-AT ?auto_15490 ?auto_15487 ) ( not ( = ?auto_15486 ?auto_15490 ) ) ( AVAILABLE ?auto_15490 ) ( SURFACE-AT ?auto_15482 ?auto_15487 ) ( ON ?auto_15482 ?auto_15488 ) ( CLEAR ?auto_15482 ) ( not ( = ?auto_15482 ?auto_15488 ) ) ( not ( = ?auto_15483 ?auto_15488 ) ) ( SURFACE-AT ?auto_15485 ?auto_15489 ) ( CLEAR ?auto_15485 ) ( IS-CRATE ?auto_15483 ) ( not ( = ?auto_15482 ?auto_15485 ) ) ( not ( = ?auto_15483 ?auto_15485 ) ) ( not ( = ?auto_15488 ?auto_15485 ) ) ( AVAILABLE ?auto_15486 ) ( IN ?auto_15483 ?auto_15484 ) ( TRUCK-AT ?auto_15484 ?auto_15491 ) ( not ( = ?auto_15491 ?auto_15489 ) ) ( not ( = ?auto_15487 ?auto_15491 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15484 ?auto_15491 ?auto_15489 )
      ( MAKE-ON ?auto_15482 ?auto_15483 )
      ( MAKE-ON-VERIFY ?auto_15482 ?auto_15483 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15492 - SURFACE
      ?auto_15493 - SURFACE
    )
    :vars
    (
      ?auto_15500 - HOIST
      ?auto_15495 - PLACE
      ?auto_15494 - PLACE
      ?auto_15499 - HOIST
      ?auto_15496 - SURFACE
      ?auto_15498 - SURFACE
      ?auto_15497 - TRUCK
      ?auto_15501 - PLACE
      ?auto_15502 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15500 ?auto_15495 ) ( IS-CRATE ?auto_15492 ) ( not ( = ?auto_15492 ?auto_15493 ) ) ( not ( = ?auto_15494 ?auto_15495 ) ) ( HOIST-AT ?auto_15499 ?auto_15494 ) ( not ( = ?auto_15500 ?auto_15499 ) ) ( AVAILABLE ?auto_15499 ) ( SURFACE-AT ?auto_15492 ?auto_15494 ) ( ON ?auto_15492 ?auto_15496 ) ( CLEAR ?auto_15492 ) ( not ( = ?auto_15492 ?auto_15496 ) ) ( not ( = ?auto_15493 ?auto_15496 ) ) ( SURFACE-AT ?auto_15498 ?auto_15495 ) ( CLEAR ?auto_15498 ) ( IS-CRATE ?auto_15493 ) ( not ( = ?auto_15492 ?auto_15498 ) ) ( not ( = ?auto_15493 ?auto_15498 ) ) ( not ( = ?auto_15496 ?auto_15498 ) ) ( AVAILABLE ?auto_15500 ) ( TRUCK-AT ?auto_15497 ?auto_15501 ) ( not ( = ?auto_15501 ?auto_15495 ) ) ( not ( = ?auto_15494 ?auto_15501 ) ) ( HOIST-AT ?auto_15502 ?auto_15501 ) ( LIFTING ?auto_15502 ?auto_15493 ) ( not ( = ?auto_15500 ?auto_15502 ) ) ( not ( = ?auto_15499 ?auto_15502 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15502 ?auto_15493 ?auto_15497 ?auto_15501 )
      ( MAKE-ON ?auto_15492 ?auto_15493 )
      ( MAKE-ON-VERIFY ?auto_15492 ?auto_15493 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15503 - SURFACE
      ?auto_15504 - SURFACE
    )
    :vars
    (
      ?auto_15510 - HOIST
      ?auto_15505 - PLACE
      ?auto_15513 - PLACE
      ?auto_15511 - HOIST
      ?auto_15512 - SURFACE
      ?auto_15506 - SURFACE
      ?auto_15508 - TRUCK
      ?auto_15509 - PLACE
      ?auto_15507 - HOIST
      ?auto_15514 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15510 ?auto_15505 ) ( IS-CRATE ?auto_15503 ) ( not ( = ?auto_15503 ?auto_15504 ) ) ( not ( = ?auto_15513 ?auto_15505 ) ) ( HOIST-AT ?auto_15511 ?auto_15513 ) ( not ( = ?auto_15510 ?auto_15511 ) ) ( AVAILABLE ?auto_15511 ) ( SURFACE-AT ?auto_15503 ?auto_15513 ) ( ON ?auto_15503 ?auto_15512 ) ( CLEAR ?auto_15503 ) ( not ( = ?auto_15503 ?auto_15512 ) ) ( not ( = ?auto_15504 ?auto_15512 ) ) ( SURFACE-AT ?auto_15506 ?auto_15505 ) ( CLEAR ?auto_15506 ) ( IS-CRATE ?auto_15504 ) ( not ( = ?auto_15503 ?auto_15506 ) ) ( not ( = ?auto_15504 ?auto_15506 ) ) ( not ( = ?auto_15512 ?auto_15506 ) ) ( AVAILABLE ?auto_15510 ) ( TRUCK-AT ?auto_15508 ?auto_15509 ) ( not ( = ?auto_15509 ?auto_15505 ) ) ( not ( = ?auto_15513 ?auto_15509 ) ) ( HOIST-AT ?auto_15507 ?auto_15509 ) ( not ( = ?auto_15510 ?auto_15507 ) ) ( not ( = ?auto_15511 ?auto_15507 ) ) ( AVAILABLE ?auto_15507 ) ( SURFACE-AT ?auto_15504 ?auto_15509 ) ( ON ?auto_15504 ?auto_15514 ) ( CLEAR ?auto_15504 ) ( not ( = ?auto_15503 ?auto_15514 ) ) ( not ( = ?auto_15504 ?auto_15514 ) ) ( not ( = ?auto_15512 ?auto_15514 ) ) ( not ( = ?auto_15506 ?auto_15514 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15507 ?auto_15504 ?auto_15514 ?auto_15509 )
      ( MAKE-ON ?auto_15503 ?auto_15504 )
      ( MAKE-ON-VERIFY ?auto_15503 ?auto_15504 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15515 - SURFACE
      ?auto_15516 - SURFACE
    )
    :vars
    (
      ?auto_15526 - HOIST
      ?auto_15523 - PLACE
      ?auto_15522 - PLACE
      ?auto_15525 - HOIST
      ?auto_15519 - SURFACE
      ?auto_15518 - SURFACE
      ?auto_15521 - PLACE
      ?auto_15517 - HOIST
      ?auto_15524 - SURFACE
      ?auto_15520 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15526 ?auto_15523 ) ( IS-CRATE ?auto_15515 ) ( not ( = ?auto_15515 ?auto_15516 ) ) ( not ( = ?auto_15522 ?auto_15523 ) ) ( HOIST-AT ?auto_15525 ?auto_15522 ) ( not ( = ?auto_15526 ?auto_15525 ) ) ( AVAILABLE ?auto_15525 ) ( SURFACE-AT ?auto_15515 ?auto_15522 ) ( ON ?auto_15515 ?auto_15519 ) ( CLEAR ?auto_15515 ) ( not ( = ?auto_15515 ?auto_15519 ) ) ( not ( = ?auto_15516 ?auto_15519 ) ) ( SURFACE-AT ?auto_15518 ?auto_15523 ) ( CLEAR ?auto_15518 ) ( IS-CRATE ?auto_15516 ) ( not ( = ?auto_15515 ?auto_15518 ) ) ( not ( = ?auto_15516 ?auto_15518 ) ) ( not ( = ?auto_15519 ?auto_15518 ) ) ( AVAILABLE ?auto_15526 ) ( not ( = ?auto_15521 ?auto_15523 ) ) ( not ( = ?auto_15522 ?auto_15521 ) ) ( HOIST-AT ?auto_15517 ?auto_15521 ) ( not ( = ?auto_15526 ?auto_15517 ) ) ( not ( = ?auto_15525 ?auto_15517 ) ) ( AVAILABLE ?auto_15517 ) ( SURFACE-AT ?auto_15516 ?auto_15521 ) ( ON ?auto_15516 ?auto_15524 ) ( CLEAR ?auto_15516 ) ( not ( = ?auto_15515 ?auto_15524 ) ) ( not ( = ?auto_15516 ?auto_15524 ) ) ( not ( = ?auto_15519 ?auto_15524 ) ) ( not ( = ?auto_15518 ?auto_15524 ) ) ( TRUCK-AT ?auto_15520 ?auto_15523 ) )
    :subtasks
    ( ( !DRIVE ?auto_15520 ?auto_15523 ?auto_15521 )
      ( MAKE-ON ?auto_15515 ?auto_15516 )
      ( MAKE-ON-VERIFY ?auto_15515 ?auto_15516 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15527 - SURFACE
      ?auto_15528 - SURFACE
    )
    :vars
    (
      ?auto_15530 - HOIST
      ?auto_15534 - PLACE
      ?auto_15531 - PLACE
      ?auto_15532 - HOIST
      ?auto_15537 - SURFACE
      ?auto_15538 - SURFACE
      ?auto_15535 - PLACE
      ?auto_15529 - HOIST
      ?auto_15533 - SURFACE
      ?auto_15536 - TRUCK
      ?auto_15539 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15530 ?auto_15534 ) ( IS-CRATE ?auto_15527 ) ( not ( = ?auto_15527 ?auto_15528 ) ) ( not ( = ?auto_15531 ?auto_15534 ) ) ( HOIST-AT ?auto_15532 ?auto_15531 ) ( not ( = ?auto_15530 ?auto_15532 ) ) ( AVAILABLE ?auto_15532 ) ( SURFACE-AT ?auto_15527 ?auto_15531 ) ( ON ?auto_15527 ?auto_15537 ) ( CLEAR ?auto_15527 ) ( not ( = ?auto_15527 ?auto_15537 ) ) ( not ( = ?auto_15528 ?auto_15537 ) ) ( IS-CRATE ?auto_15528 ) ( not ( = ?auto_15527 ?auto_15538 ) ) ( not ( = ?auto_15528 ?auto_15538 ) ) ( not ( = ?auto_15537 ?auto_15538 ) ) ( not ( = ?auto_15535 ?auto_15534 ) ) ( not ( = ?auto_15531 ?auto_15535 ) ) ( HOIST-AT ?auto_15529 ?auto_15535 ) ( not ( = ?auto_15530 ?auto_15529 ) ) ( not ( = ?auto_15532 ?auto_15529 ) ) ( AVAILABLE ?auto_15529 ) ( SURFACE-AT ?auto_15528 ?auto_15535 ) ( ON ?auto_15528 ?auto_15533 ) ( CLEAR ?auto_15528 ) ( not ( = ?auto_15527 ?auto_15533 ) ) ( not ( = ?auto_15528 ?auto_15533 ) ) ( not ( = ?auto_15537 ?auto_15533 ) ) ( not ( = ?auto_15538 ?auto_15533 ) ) ( TRUCK-AT ?auto_15536 ?auto_15534 ) ( SURFACE-AT ?auto_15539 ?auto_15534 ) ( CLEAR ?auto_15539 ) ( LIFTING ?auto_15530 ?auto_15538 ) ( IS-CRATE ?auto_15538 ) ( not ( = ?auto_15527 ?auto_15539 ) ) ( not ( = ?auto_15528 ?auto_15539 ) ) ( not ( = ?auto_15537 ?auto_15539 ) ) ( not ( = ?auto_15538 ?auto_15539 ) ) ( not ( = ?auto_15533 ?auto_15539 ) ) )
    :subtasks
    ( ( !DROP ?auto_15530 ?auto_15538 ?auto_15539 ?auto_15534 )
      ( MAKE-ON ?auto_15527 ?auto_15528 )
      ( MAKE-ON-VERIFY ?auto_15527 ?auto_15528 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15540 - SURFACE
      ?auto_15541 - SURFACE
    )
    :vars
    (
      ?auto_15552 - HOIST
      ?auto_15542 - PLACE
      ?auto_15551 - PLACE
      ?auto_15550 - HOIST
      ?auto_15548 - SURFACE
      ?auto_15546 - SURFACE
      ?auto_15545 - PLACE
      ?auto_15544 - HOIST
      ?auto_15549 - SURFACE
      ?auto_15547 - TRUCK
      ?auto_15543 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15552 ?auto_15542 ) ( IS-CRATE ?auto_15540 ) ( not ( = ?auto_15540 ?auto_15541 ) ) ( not ( = ?auto_15551 ?auto_15542 ) ) ( HOIST-AT ?auto_15550 ?auto_15551 ) ( not ( = ?auto_15552 ?auto_15550 ) ) ( AVAILABLE ?auto_15550 ) ( SURFACE-AT ?auto_15540 ?auto_15551 ) ( ON ?auto_15540 ?auto_15548 ) ( CLEAR ?auto_15540 ) ( not ( = ?auto_15540 ?auto_15548 ) ) ( not ( = ?auto_15541 ?auto_15548 ) ) ( IS-CRATE ?auto_15541 ) ( not ( = ?auto_15540 ?auto_15546 ) ) ( not ( = ?auto_15541 ?auto_15546 ) ) ( not ( = ?auto_15548 ?auto_15546 ) ) ( not ( = ?auto_15545 ?auto_15542 ) ) ( not ( = ?auto_15551 ?auto_15545 ) ) ( HOIST-AT ?auto_15544 ?auto_15545 ) ( not ( = ?auto_15552 ?auto_15544 ) ) ( not ( = ?auto_15550 ?auto_15544 ) ) ( AVAILABLE ?auto_15544 ) ( SURFACE-AT ?auto_15541 ?auto_15545 ) ( ON ?auto_15541 ?auto_15549 ) ( CLEAR ?auto_15541 ) ( not ( = ?auto_15540 ?auto_15549 ) ) ( not ( = ?auto_15541 ?auto_15549 ) ) ( not ( = ?auto_15548 ?auto_15549 ) ) ( not ( = ?auto_15546 ?auto_15549 ) ) ( TRUCK-AT ?auto_15547 ?auto_15542 ) ( SURFACE-AT ?auto_15543 ?auto_15542 ) ( CLEAR ?auto_15543 ) ( IS-CRATE ?auto_15546 ) ( not ( = ?auto_15540 ?auto_15543 ) ) ( not ( = ?auto_15541 ?auto_15543 ) ) ( not ( = ?auto_15548 ?auto_15543 ) ) ( not ( = ?auto_15546 ?auto_15543 ) ) ( not ( = ?auto_15549 ?auto_15543 ) ) ( AVAILABLE ?auto_15552 ) ( IN ?auto_15546 ?auto_15547 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15552 ?auto_15546 ?auto_15547 ?auto_15542 )
      ( MAKE-ON ?auto_15540 ?auto_15541 )
      ( MAKE-ON-VERIFY ?auto_15540 ?auto_15541 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15553 - SURFACE
      ?auto_15554 - SURFACE
    )
    :vars
    (
      ?auto_15555 - HOIST
      ?auto_15563 - PLACE
      ?auto_15561 - PLACE
      ?auto_15559 - HOIST
      ?auto_15558 - SURFACE
      ?auto_15562 - SURFACE
      ?auto_15556 - PLACE
      ?auto_15565 - HOIST
      ?auto_15557 - SURFACE
      ?auto_15560 - SURFACE
      ?auto_15564 - TRUCK
      ?auto_15566 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15555 ?auto_15563 ) ( IS-CRATE ?auto_15553 ) ( not ( = ?auto_15553 ?auto_15554 ) ) ( not ( = ?auto_15561 ?auto_15563 ) ) ( HOIST-AT ?auto_15559 ?auto_15561 ) ( not ( = ?auto_15555 ?auto_15559 ) ) ( AVAILABLE ?auto_15559 ) ( SURFACE-AT ?auto_15553 ?auto_15561 ) ( ON ?auto_15553 ?auto_15558 ) ( CLEAR ?auto_15553 ) ( not ( = ?auto_15553 ?auto_15558 ) ) ( not ( = ?auto_15554 ?auto_15558 ) ) ( IS-CRATE ?auto_15554 ) ( not ( = ?auto_15553 ?auto_15562 ) ) ( not ( = ?auto_15554 ?auto_15562 ) ) ( not ( = ?auto_15558 ?auto_15562 ) ) ( not ( = ?auto_15556 ?auto_15563 ) ) ( not ( = ?auto_15561 ?auto_15556 ) ) ( HOIST-AT ?auto_15565 ?auto_15556 ) ( not ( = ?auto_15555 ?auto_15565 ) ) ( not ( = ?auto_15559 ?auto_15565 ) ) ( AVAILABLE ?auto_15565 ) ( SURFACE-AT ?auto_15554 ?auto_15556 ) ( ON ?auto_15554 ?auto_15557 ) ( CLEAR ?auto_15554 ) ( not ( = ?auto_15553 ?auto_15557 ) ) ( not ( = ?auto_15554 ?auto_15557 ) ) ( not ( = ?auto_15558 ?auto_15557 ) ) ( not ( = ?auto_15562 ?auto_15557 ) ) ( SURFACE-AT ?auto_15560 ?auto_15563 ) ( CLEAR ?auto_15560 ) ( IS-CRATE ?auto_15562 ) ( not ( = ?auto_15553 ?auto_15560 ) ) ( not ( = ?auto_15554 ?auto_15560 ) ) ( not ( = ?auto_15558 ?auto_15560 ) ) ( not ( = ?auto_15562 ?auto_15560 ) ) ( not ( = ?auto_15557 ?auto_15560 ) ) ( AVAILABLE ?auto_15555 ) ( IN ?auto_15562 ?auto_15564 ) ( TRUCK-AT ?auto_15564 ?auto_15566 ) ( not ( = ?auto_15566 ?auto_15563 ) ) ( not ( = ?auto_15561 ?auto_15566 ) ) ( not ( = ?auto_15556 ?auto_15566 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15564 ?auto_15566 ?auto_15563 )
      ( MAKE-ON ?auto_15553 ?auto_15554 )
      ( MAKE-ON-VERIFY ?auto_15553 ?auto_15554 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15567 - SURFACE
      ?auto_15568 - SURFACE
    )
    :vars
    (
      ?auto_15579 - HOIST
      ?auto_15580 - PLACE
      ?auto_15578 - PLACE
      ?auto_15574 - HOIST
      ?auto_15577 - SURFACE
      ?auto_15571 - SURFACE
      ?auto_15569 - PLACE
      ?auto_15573 - HOIST
      ?auto_15570 - SURFACE
      ?auto_15575 - SURFACE
      ?auto_15572 - TRUCK
      ?auto_15576 - PLACE
      ?auto_15581 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15579 ?auto_15580 ) ( IS-CRATE ?auto_15567 ) ( not ( = ?auto_15567 ?auto_15568 ) ) ( not ( = ?auto_15578 ?auto_15580 ) ) ( HOIST-AT ?auto_15574 ?auto_15578 ) ( not ( = ?auto_15579 ?auto_15574 ) ) ( AVAILABLE ?auto_15574 ) ( SURFACE-AT ?auto_15567 ?auto_15578 ) ( ON ?auto_15567 ?auto_15577 ) ( CLEAR ?auto_15567 ) ( not ( = ?auto_15567 ?auto_15577 ) ) ( not ( = ?auto_15568 ?auto_15577 ) ) ( IS-CRATE ?auto_15568 ) ( not ( = ?auto_15567 ?auto_15571 ) ) ( not ( = ?auto_15568 ?auto_15571 ) ) ( not ( = ?auto_15577 ?auto_15571 ) ) ( not ( = ?auto_15569 ?auto_15580 ) ) ( not ( = ?auto_15578 ?auto_15569 ) ) ( HOIST-AT ?auto_15573 ?auto_15569 ) ( not ( = ?auto_15579 ?auto_15573 ) ) ( not ( = ?auto_15574 ?auto_15573 ) ) ( AVAILABLE ?auto_15573 ) ( SURFACE-AT ?auto_15568 ?auto_15569 ) ( ON ?auto_15568 ?auto_15570 ) ( CLEAR ?auto_15568 ) ( not ( = ?auto_15567 ?auto_15570 ) ) ( not ( = ?auto_15568 ?auto_15570 ) ) ( not ( = ?auto_15577 ?auto_15570 ) ) ( not ( = ?auto_15571 ?auto_15570 ) ) ( SURFACE-AT ?auto_15575 ?auto_15580 ) ( CLEAR ?auto_15575 ) ( IS-CRATE ?auto_15571 ) ( not ( = ?auto_15567 ?auto_15575 ) ) ( not ( = ?auto_15568 ?auto_15575 ) ) ( not ( = ?auto_15577 ?auto_15575 ) ) ( not ( = ?auto_15571 ?auto_15575 ) ) ( not ( = ?auto_15570 ?auto_15575 ) ) ( AVAILABLE ?auto_15579 ) ( TRUCK-AT ?auto_15572 ?auto_15576 ) ( not ( = ?auto_15576 ?auto_15580 ) ) ( not ( = ?auto_15578 ?auto_15576 ) ) ( not ( = ?auto_15569 ?auto_15576 ) ) ( HOIST-AT ?auto_15581 ?auto_15576 ) ( LIFTING ?auto_15581 ?auto_15571 ) ( not ( = ?auto_15579 ?auto_15581 ) ) ( not ( = ?auto_15574 ?auto_15581 ) ) ( not ( = ?auto_15573 ?auto_15581 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15581 ?auto_15571 ?auto_15572 ?auto_15576 )
      ( MAKE-ON ?auto_15567 ?auto_15568 )
      ( MAKE-ON-VERIFY ?auto_15567 ?auto_15568 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15582 - SURFACE
      ?auto_15583 - SURFACE
    )
    :vars
    (
      ?auto_15584 - HOIST
      ?auto_15587 - PLACE
      ?auto_15588 - PLACE
      ?auto_15591 - HOIST
      ?auto_15596 - SURFACE
      ?auto_15590 - SURFACE
      ?auto_15595 - PLACE
      ?auto_15592 - HOIST
      ?auto_15586 - SURFACE
      ?auto_15594 - SURFACE
      ?auto_15585 - TRUCK
      ?auto_15589 - PLACE
      ?auto_15593 - HOIST
      ?auto_15597 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15584 ?auto_15587 ) ( IS-CRATE ?auto_15582 ) ( not ( = ?auto_15582 ?auto_15583 ) ) ( not ( = ?auto_15588 ?auto_15587 ) ) ( HOIST-AT ?auto_15591 ?auto_15588 ) ( not ( = ?auto_15584 ?auto_15591 ) ) ( AVAILABLE ?auto_15591 ) ( SURFACE-AT ?auto_15582 ?auto_15588 ) ( ON ?auto_15582 ?auto_15596 ) ( CLEAR ?auto_15582 ) ( not ( = ?auto_15582 ?auto_15596 ) ) ( not ( = ?auto_15583 ?auto_15596 ) ) ( IS-CRATE ?auto_15583 ) ( not ( = ?auto_15582 ?auto_15590 ) ) ( not ( = ?auto_15583 ?auto_15590 ) ) ( not ( = ?auto_15596 ?auto_15590 ) ) ( not ( = ?auto_15595 ?auto_15587 ) ) ( not ( = ?auto_15588 ?auto_15595 ) ) ( HOIST-AT ?auto_15592 ?auto_15595 ) ( not ( = ?auto_15584 ?auto_15592 ) ) ( not ( = ?auto_15591 ?auto_15592 ) ) ( AVAILABLE ?auto_15592 ) ( SURFACE-AT ?auto_15583 ?auto_15595 ) ( ON ?auto_15583 ?auto_15586 ) ( CLEAR ?auto_15583 ) ( not ( = ?auto_15582 ?auto_15586 ) ) ( not ( = ?auto_15583 ?auto_15586 ) ) ( not ( = ?auto_15596 ?auto_15586 ) ) ( not ( = ?auto_15590 ?auto_15586 ) ) ( SURFACE-AT ?auto_15594 ?auto_15587 ) ( CLEAR ?auto_15594 ) ( IS-CRATE ?auto_15590 ) ( not ( = ?auto_15582 ?auto_15594 ) ) ( not ( = ?auto_15583 ?auto_15594 ) ) ( not ( = ?auto_15596 ?auto_15594 ) ) ( not ( = ?auto_15590 ?auto_15594 ) ) ( not ( = ?auto_15586 ?auto_15594 ) ) ( AVAILABLE ?auto_15584 ) ( TRUCK-AT ?auto_15585 ?auto_15589 ) ( not ( = ?auto_15589 ?auto_15587 ) ) ( not ( = ?auto_15588 ?auto_15589 ) ) ( not ( = ?auto_15595 ?auto_15589 ) ) ( HOIST-AT ?auto_15593 ?auto_15589 ) ( not ( = ?auto_15584 ?auto_15593 ) ) ( not ( = ?auto_15591 ?auto_15593 ) ) ( not ( = ?auto_15592 ?auto_15593 ) ) ( AVAILABLE ?auto_15593 ) ( SURFACE-AT ?auto_15590 ?auto_15589 ) ( ON ?auto_15590 ?auto_15597 ) ( CLEAR ?auto_15590 ) ( not ( = ?auto_15582 ?auto_15597 ) ) ( not ( = ?auto_15583 ?auto_15597 ) ) ( not ( = ?auto_15596 ?auto_15597 ) ) ( not ( = ?auto_15590 ?auto_15597 ) ) ( not ( = ?auto_15586 ?auto_15597 ) ) ( not ( = ?auto_15594 ?auto_15597 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15593 ?auto_15590 ?auto_15597 ?auto_15589 )
      ( MAKE-ON ?auto_15582 ?auto_15583 )
      ( MAKE-ON-VERIFY ?auto_15582 ?auto_15583 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15598 - SURFACE
      ?auto_15599 - SURFACE
    )
    :vars
    (
      ?auto_15609 - HOIST
      ?auto_15600 - PLACE
      ?auto_15611 - PLACE
      ?auto_15605 - HOIST
      ?auto_15604 - SURFACE
      ?auto_15606 - SURFACE
      ?auto_15610 - PLACE
      ?auto_15603 - HOIST
      ?auto_15608 - SURFACE
      ?auto_15612 - SURFACE
      ?auto_15602 - PLACE
      ?auto_15607 - HOIST
      ?auto_15613 - SURFACE
      ?auto_15601 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15609 ?auto_15600 ) ( IS-CRATE ?auto_15598 ) ( not ( = ?auto_15598 ?auto_15599 ) ) ( not ( = ?auto_15611 ?auto_15600 ) ) ( HOIST-AT ?auto_15605 ?auto_15611 ) ( not ( = ?auto_15609 ?auto_15605 ) ) ( AVAILABLE ?auto_15605 ) ( SURFACE-AT ?auto_15598 ?auto_15611 ) ( ON ?auto_15598 ?auto_15604 ) ( CLEAR ?auto_15598 ) ( not ( = ?auto_15598 ?auto_15604 ) ) ( not ( = ?auto_15599 ?auto_15604 ) ) ( IS-CRATE ?auto_15599 ) ( not ( = ?auto_15598 ?auto_15606 ) ) ( not ( = ?auto_15599 ?auto_15606 ) ) ( not ( = ?auto_15604 ?auto_15606 ) ) ( not ( = ?auto_15610 ?auto_15600 ) ) ( not ( = ?auto_15611 ?auto_15610 ) ) ( HOIST-AT ?auto_15603 ?auto_15610 ) ( not ( = ?auto_15609 ?auto_15603 ) ) ( not ( = ?auto_15605 ?auto_15603 ) ) ( AVAILABLE ?auto_15603 ) ( SURFACE-AT ?auto_15599 ?auto_15610 ) ( ON ?auto_15599 ?auto_15608 ) ( CLEAR ?auto_15599 ) ( not ( = ?auto_15598 ?auto_15608 ) ) ( not ( = ?auto_15599 ?auto_15608 ) ) ( not ( = ?auto_15604 ?auto_15608 ) ) ( not ( = ?auto_15606 ?auto_15608 ) ) ( SURFACE-AT ?auto_15612 ?auto_15600 ) ( CLEAR ?auto_15612 ) ( IS-CRATE ?auto_15606 ) ( not ( = ?auto_15598 ?auto_15612 ) ) ( not ( = ?auto_15599 ?auto_15612 ) ) ( not ( = ?auto_15604 ?auto_15612 ) ) ( not ( = ?auto_15606 ?auto_15612 ) ) ( not ( = ?auto_15608 ?auto_15612 ) ) ( AVAILABLE ?auto_15609 ) ( not ( = ?auto_15602 ?auto_15600 ) ) ( not ( = ?auto_15611 ?auto_15602 ) ) ( not ( = ?auto_15610 ?auto_15602 ) ) ( HOIST-AT ?auto_15607 ?auto_15602 ) ( not ( = ?auto_15609 ?auto_15607 ) ) ( not ( = ?auto_15605 ?auto_15607 ) ) ( not ( = ?auto_15603 ?auto_15607 ) ) ( AVAILABLE ?auto_15607 ) ( SURFACE-AT ?auto_15606 ?auto_15602 ) ( ON ?auto_15606 ?auto_15613 ) ( CLEAR ?auto_15606 ) ( not ( = ?auto_15598 ?auto_15613 ) ) ( not ( = ?auto_15599 ?auto_15613 ) ) ( not ( = ?auto_15604 ?auto_15613 ) ) ( not ( = ?auto_15606 ?auto_15613 ) ) ( not ( = ?auto_15608 ?auto_15613 ) ) ( not ( = ?auto_15612 ?auto_15613 ) ) ( TRUCK-AT ?auto_15601 ?auto_15600 ) )
    :subtasks
    ( ( !DRIVE ?auto_15601 ?auto_15600 ?auto_15602 )
      ( MAKE-ON ?auto_15598 ?auto_15599 )
      ( MAKE-ON-VERIFY ?auto_15598 ?auto_15599 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15614 - SURFACE
      ?auto_15615 - SURFACE
    )
    :vars
    (
      ?auto_15621 - HOIST
      ?auto_15619 - PLACE
      ?auto_15625 - PLACE
      ?auto_15620 - HOIST
      ?auto_15618 - SURFACE
      ?auto_15623 - SURFACE
      ?auto_15617 - PLACE
      ?auto_15626 - HOIST
      ?auto_15622 - SURFACE
      ?auto_15616 - SURFACE
      ?auto_15627 - PLACE
      ?auto_15628 - HOIST
      ?auto_15624 - SURFACE
      ?auto_15629 - TRUCK
      ?auto_15630 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15621 ?auto_15619 ) ( IS-CRATE ?auto_15614 ) ( not ( = ?auto_15614 ?auto_15615 ) ) ( not ( = ?auto_15625 ?auto_15619 ) ) ( HOIST-AT ?auto_15620 ?auto_15625 ) ( not ( = ?auto_15621 ?auto_15620 ) ) ( AVAILABLE ?auto_15620 ) ( SURFACE-AT ?auto_15614 ?auto_15625 ) ( ON ?auto_15614 ?auto_15618 ) ( CLEAR ?auto_15614 ) ( not ( = ?auto_15614 ?auto_15618 ) ) ( not ( = ?auto_15615 ?auto_15618 ) ) ( IS-CRATE ?auto_15615 ) ( not ( = ?auto_15614 ?auto_15623 ) ) ( not ( = ?auto_15615 ?auto_15623 ) ) ( not ( = ?auto_15618 ?auto_15623 ) ) ( not ( = ?auto_15617 ?auto_15619 ) ) ( not ( = ?auto_15625 ?auto_15617 ) ) ( HOIST-AT ?auto_15626 ?auto_15617 ) ( not ( = ?auto_15621 ?auto_15626 ) ) ( not ( = ?auto_15620 ?auto_15626 ) ) ( AVAILABLE ?auto_15626 ) ( SURFACE-AT ?auto_15615 ?auto_15617 ) ( ON ?auto_15615 ?auto_15622 ) ( CLEAR ?auto_15615 ) ( not ( = ?auto_15614 ?auto_15622 ) ) ( not ( = ?auto_15615 ?auto_15622 ) ) ( not ( = ?auto_15618 ?auto_15622 ) ) ( not ( = ?auto_15623 ?auto_15622 ) ) ( IS-CRATE ?auto_15623 ) ( not ( = ?auto_15614 ?auto_15616 ) ) ( not ( = ?auto_15615 ?auto_15616 ) ) ( not ( = ?auto_15618 ?auto_15616 ) ) ( not ( = ?auto_15623 ?auto_15616 ) ) ( not ( = ?auto_15622 ?auto_15616 ) ) ( not ( = ?auto_15627 ?auto_15619 ) ) ( not ( = ?auto_15625 ?auto_15627 ) ) ( not ( = ?auto_15617 ?auto_15627 ) ) ( HOIST-AT ?auto_15628 ?auto_15627 ) ( not ( = ?auto_15621 ?auto_15628 ) ) ( not ( = ?auto_15620 ?auto_15628 ) ) ( not ( = ?auto_15626 ?auto_15628 ) ) ( AVAILABLE ?auto_15628 ) ( SURFACE-AT ?auto_15623 ?auto_15627 ) ( ON ?auto_15623 ?auto_15624 ) ( CLEAR ?auto_15623 ) ( not ( = ?auto_15614 ?auto_15624 ) ) ( not ( = ?auto_15615 ?auto_15624 ) ) ( not ( = ?auto_15618 ?auto_15624 ) ) ( not ( = ?auto_15623 ?auto_15624 ) ) ( not ( = ?auto_15622 ?auto_15624 ) ) ( not ( = ?auto_15616 ?auto_15624 ) ) ( TRUCK-AT ?auto_15629 ?auto_15619 ) ( SURFACE-AT ?auto_15630 ?auto_15619 ) ( CLEAR ?auto_15630 ) ( LIFTING ?auto_15621 ?auto_15616 ) ( IS-CRATE ?auto_15616 ) ( not ( = ?auto_15614 ?auto_15630 ) ) ( not ( = ?auto_15615 ?auto_15630 ) ) ( not ( = ?auto_15618 ?auto_15630 ) ) ( not ( = ?auto_15623 ?auto_15630 ) ) ( not ( = ?auto_15622 ?auto_15630 ) ) ( not ( = ?auto_15616 ?auto_15630 ) ) ( not ( = ?auto_15624 ?auto_15630 ) ) )
    :subtasks
    ( ( !DROP ?auto_15621 ?auto_15616 ?auto_15630 ?auto_15619 )
      ( MAKE-ON ?auto_15614 ?auto_15615 )
      ( MAKE-ON-VERIFY ?auto_15614 ?auto_15615 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15631 - SURFACE
      ?auto_15632 - SURFACE
    )
    :vars
    (
      ?auto_15636 - HOIST
      ?auto_15641 - PLACE
      ?auto_15646 - PLACE
      ?auto_15643 - HOIST
      ?auto_15645 - SURFACE
      ?auto_15635 - SURFACE
      ?auto_15644 - PLACE
      ?auto_15638 - HOIST
      ?auto_15637 - SURFACE
      ?auto_15642 - SURFACE
      ?auto_15640 - PLACE
      ?auto_15633 - HOIST
      ?auto_15639 - SURFACE
      ?auto_15634 - TRUCK
      ?auto_15647 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15636 ?auto_15641 ) ( IS-CRATE ?auto_15631 ) ( not ( = ?auto_15631 ?auto_15632 ) ) ( not ( = ?auto_15646 ?auto_15641 ) ) ( HOIST-AT ?auto_15643 ?auto_15646 ) ( not ( = ?auto_15636 ?auto_15643 ) ) ( AVAILABLE ?auto_15643 ) ( SURFACE-AT ?auto_15631 ?auto_15646 ) ( ON ?auto_15631 ?auto_15645 ) ( CLEAR ?auto_15631 ) ( not ( = ?auto_15631 ?auto_15645 ) ) ( not ( = ?auto_15632 ?auto_15645 ) ) ( IS-CRATE ?auto_15632 ) ( not ( = ?auto_15631 ?auto_15635 ) ) ( not ( = ?auto_15632 ?auto_15635 ) ) ( not ( = ?auto_15645 ?auto_15635 ) ) ( not ( = ?auto_15644 ?auto_15641 ) ) ( not ( = ?auto_15646 ?auto_15644 ) ) ( HOIST-AT ?auto_15638 ?auto_15644 ) ( not ( = ?auto_15636 ?auto_15638 ) ) ( not ( = ?auto_15643 ?auto_15638 ) ) ( AVAILABLE ?auto_15638 ) ( SURFACE-AT ?auto_15632 ?auto_15644 ) ( ON ?auto_15632 ?auto_15637 ) ( CLEAR ?auto_15632 ) ( not ( = ?auto_15631 ?auto_15637 ) ) ( not ( = ?auto_15632 ?auto_15637 ) ) ( not ( = ?auto_15645 ?auto_15637 ) ) ( not ( = ?auto_15635 ?auto_15637 ) ) ( IS-CRATE ?auto_15635 ) ( not ( = ?auto_15631 ?auto_15642 ) ) ( not ( = ?auto_15632 ?auto_15642 ) ) ( not ( = ?auto_15645 ?auto_15642 ) ) ( not ( = ?auto_15635 ?auto_15642 ) ) ( not ( = ?auto_15637 ?auto_15642 ) ) ( not ( = ?auto_15640 ?auto_15641 ) ) ( not ( = ?auto_15646 ?auto_15640 ) ) ( not ( = ?auto_15644 ?auto_15640 ) ) ( HOIST-AT ?auto_15633 ?auto_15640 ) ( not ( = ?auto_15636 ?auto_15633 ) ) ( not ( = ?auto_15643 ?auto_15633 ) ) ( not ( = ?auto_15638 ?auto_15633 ) ) ( AVAILABLE ?auto_15633 ) ( SURFACE-AT ?auto_15635 ?auto_15640 ) ( ON ?auto_15635 ?auto_15639 ) ( CLEAR ?auto_15635 ) ( not ( = ?auto_15631 ?auto_15639 ) ) ( not ( = ?auto_15632 ?auto_15639 ) ) ( not ( = ?auto_15645 ?auto_15639 ) ) ( not ( = ?auto_15635 ?auto_15639 ) ) ( not ( = ?auto_15637 ?auto_15639 ) ) ( not ( = ?auto_15642 ?auto_15639 ) ) ( TRUCK-AT ?auto_15634 ?auto_15641 ) ( SURFACE-AT ?auto_15647 ?auto_15641 ) ( CLEAR ?auto_15647 ) ( IS-CRATE ?auto_15642 ) ( not ( = ?auto_15631 ?auto_15647 ) ) ( not ( = ?auto_15632 ?auto_15647 ) ) ( not ( = ?auto_15645 ?auto_15647 ) ) ( not ( = ?auto_15635 ?auto_15647 ) ) ( not ( = ?auto_15637 ?auto_15647 ) ) ( not ( = ?auto_15642 ?auto_15647 ) ) ( not ( = ?auto_15639 ?auto_15647 ) ) ( AVAILABLE ?auto_15636 ) ( IN ?auto_15642 ?auto_15634 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15636 ?auto_15642 ?auto_15634 ?auto_15641 )
      ( MAKE-ON ?auto_15631 ?auto_15632 )
      ( MAKE-ON-VERIFY ?auto_15631 ?auto_15632 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15648 - SURFACE
      ?auto_15649 - SURFACE
    )
    :vars
    (
      ?auto_15652 - HOIST
      ?auto_15656 - PLACE
      ?auto_15660 - PLACE
      ?auto_15663 - HOIST
      ?auto_15653 - SURFACE
      ?auto_15651 - SURFACE
      ?auto_15658 - PLACE
      ?auto_15650 - HOIST
      ?auto_15661 - SURFACE
      ?auto_15654 - SURFACE
      ?auto_15664 - PLACE
      ?auto_15655 - HOIST
      ?auto_15657 - SURFACE
      ?auto_15662 - SURFACE
      ?auto_15659 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15652 ?auto_15656 ) ( IS-CRATE ?auto_15648 ) ( not ( = ?auto_15648 ?auto_15649 ) ) ( not ( = ?auto_15660 ?auto_15656 ) ) ( HOIST-AT ?auto_15663 ?auto_15660 ) ( not ( = ?auto_15652 ?auto_15663 ) ) ( AVAILABLE ?auto_15663 ) ( SURFACE-AT ?auto_15648 ?auto_15660 ) ( ON ?auto_15648 ?auto_15653 ) ( CLEAR ?auto_15648 ) ( not ( = ?auto_15648 ?auto_15653 ) ) ( not ( = ?auto_15649 ?auto_15653 ) ) ( IS-CRATE ?auto_15649 ) ( not ( = ?auto_15648 ?auto_15651 ) ) ( not ( = ?auto_15649 ?auto_15651 ) ) ( not ( = ?auto_15653 ?auto_15651 ) ) ( not ( = ?auto_15658 ?auto_15656 ) ) ( not ( = ?auto_15660 ?auto_15658 ) ) ( HOIST-AT ?auto_15650 ?auto_15658 ) ( not ( = ?auto_15652 ?auto_15650 ) ) ( not ( = ?auto_15663 ?auto_15650 ) ) ( AVAILABLE ?auto_15650 ) ( SURFACE-AT ?auto_15649 ?auto_15658 ) ( ON ?auto_15649 ?auto_15661 ) ( CLEAR ?auto_15649 ) ( not ( = ?auto_15648 ?auto_15661 ) ) ( not ( = ?auto_15649 ?auto_15661 ) ) ( not ( = ?auto_15653 ?auto_15661 ) ) ( not ( = ?auto_15651 ?auto_15661 ) ) ( IS-CRATE ?auto_15651 ) ( not ( = ?auto_15648 ?auto_15654 ) ) ( not ( = ?auto_15649 ?auto_15654 ) ) ( not ( = ?auto_15653 ?auto_15654 ) ) ( not ( = ?auto_15651 ?auto_15654 ) ) ( not ( = ?auto_15661 ?auto_15654 ) ) ( not ( = ?auto_15664 ?auto_15656 ) ) ( not ( = ?auto_15660 ?auto_15664 ) ) ( not ( = ?auto_15658 ?auto_15664 ) ) ( HOIST-AT ?auto_15655 ?auto_15664 ) ( not ( = ?auto_15652 ?auto_15655 ) ) ( not ( = ?auto_15663 ?auto_15655 ) ) ( not ( = ?auto_15650 ?auto_15655 ) ) ( AVAILABLE ?auto_15655 ) ( SURFACE-AT ?auto_15651 ?auto_15664 ) ( ON ?auto_15651 ?auto_15657 ) ( CLEAR ?auto_15651 ) ( not ( = ?auto_15648 ?auto_15657 ) ) ( not ( = ?auto_15649 ?auto_15657 ) ) ( not ( = ?auto_15653 ?auto_15657 ) ) ( not ( = ?auto_15651 ?auto_15657 ) ) ( not ( = ?auto_15661 ?auto_15657 ) ) ( not ( = ?auto_15654 ?auto_15657 ) ) ( SURFACE-AT ?auto_15662 ?auto_15656 ) ( CLEAR ?auto_15662 ) ( IS-CRATE ?auto_15654 ) ( not ( = ?auto_15648 ?auto_15662 ) ) ( not ( = ?auto_15649 ?auto_15662 ) ) ( not ( = ?auto_15653 ?auto_15662 ) ) ( not ( = ?auto_15651 ?auto_15662 ) ) ( not ( = ?auto_15661 ?auto_15662 ) ) ( not ( = ?auto_15654 ?auto_15662 ) ) ( not ( = ?auto_15657 ?auto_15662 ) ) ( AVAILABLE ?auto_15652 ) ( IN ?auto_15654 ?auto_15659 ) ( TRUCK-AT ?auto_15659 ?auto_15660 ) )
    :subtasks
    ( ( !DRIVE ?auto_15659 ?auto_15660 ?auto_15656 )
      ( MAKE-ON ?auto_15648 ?auto_15649 )
      ( MAKE-ON-VERIFY ?auto_15648 ?auto_15649 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15665 - SURFACE
      ?auto_15666 - SURFACE
    )
    :vars
    (
      ?auto_15676 - HOIST
      ?auto_15673 - PLACE
      ?auto_15680 - PLACE
      ?auto_15669 - HOIST
      ?auto_15681 - SURFACE
      ?auto_15675 - SURFACE
      ?auto_15679 - PLACE
      ?auto_15678 - HOIST
      ?auto_15670 - SURFACE
      ?auto_15671 - SURFACE
      ?auto_15668 - PLACE
      ?auto_15674 - HOIST
      ?auto_15677 - SURFACE
      ?auto_15667 - SURFACE
      ?auto_15672 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15676 ?auto_15673 ) ( IS-CRATE ?auto_15665 ) ( not ( = ?auto_15665 ?auto_15666 ) ) ( not ( = ?auto_15680 ?auto_15673 ) ) ( HOIST-AT ?auto_15669 ?auto_15680 ) ( not ( = ?auto_15676 ?auto_15669 ) ) ( SURFACE-AT ?auto_15665 ?auto_15680 ) ( ON ?auto_15665 ?auto_15681 ) ( CLEAR ?auto_15665 ) ( not ( = ?auto_15665 ?auto_15681 ) ) ( not ( = ?auto_15666 ?auto_15681 ) ) ( IS-CRATE ?auto_15666 ) ( not ( = ?auto_15665 ?auto_15675 ) ) ( not ( = ?auto_15666 ?auto_15675 ) ) ( not ( = ?auto_15681 ?auto_15675 ) ) ( not ( = ?auto_15679 ?auto_15673 ) ) ( not ( = ?auto_15680 ?auto_15679 ) ) ( HOIST-AT ?auto_15678 ?auto_15679 ) ( not ( = ?auto_15676 ?auto_15678 ) ) ( not ( = ?auto_15669 ?auto_15678 ) ) ( AVAILABLE ?auto_15678 ) ( SURFACE-AT ?auto_15666 ?auto_15679 ) ( ON ?auto_15666 ?auto_15670 ) ( CLEAR ?auto_15666 ) ( not ( = ?auto_15665 ?auto_15670 ) ) ( not ( = ?auto_15666 ?auto_15670 ) ) ( not ( = ?auto_15681 ?auto_15670 ) ) ( not ( = ?auto_15675 ?auto_15670 ) ) ( IS-CRATE ?auto_15675 ) ( not ( = ?auto_15665 ?auto_15671 ) ) ( not ( = ?auto_15666 ?auto_15671 ) ) ( not ( = ?auto_15681 ?auto_15671 ) ) ( not ( = ?auto_15675 ?auto_15671 ) ) ( not ( = ?auto_15670 ?auto_15671 ) ) ( not ( = ?auto_15668 ?auto_15673 ) ) ( not ( = ?auto_15680 ?auto_15668 ) ) ( not ( = ?auto_15679 ?auto_15668 ) ) ( HOIST-AT ?auto_15674 ?auto_15668 ) ( not ( = ?auto_15676 ?auto_15674 ) ) ( not ( = ?auto_15669 ?auto_15674 ) ) ( not ( = ?auto_15678 ?auto_15674 ) ) ( AVAILABLE ?auto_15674 ) ( SURFACE-AT ?auto_15675 ?auto_15668 ) ( ON ?auto_15675 ?auto_15677 ) ( CLEAR ?auto_15675 ) ( not ( = ?auto_15665 ?auto_15677 ) ) ( not ( = ?auto_15666 ?auto_15677 ) ) ( not ( = ?auto_15681 ?auto_15677 ) ) ( not ( = ?auto_15675 ?auto_15677 ) ) ( not ( = ?auto_15670 ?auto_15677 ) ) ( not ( = ?auto_15671 ?auto_15677 ) ) ( SURFACE-AT ?auto_15667 ?auto_15673 ) ( CLEAR ?auto_15667 ) ( IS-CRATE ?auto_15671 ) ( not ( = ?auto_15665 ?auto_15667 ) ) ( not ( = ?auto_15666 ?auto_15667 ) ) ( not ( = ?auto_15681 ?auto_15667 ) ) ( not ( = ?auto_15675 ?auto_15667 ) ) ( not ( = ?auto_15670 ?auto_15667 ) ) ( not ( = ?auto_15671 ?auto_15667 ) ) ( not ( = ?auto_15677 ?auto_15667 ) ) ( AVAILABLE ?auto_15676 ) ( TRUCK-AT ?auto_15672 ?auto_15680 ) ( LIFTING ?auto_15669 ?auto_15671 ) )
    :subtasks
    ( ( !LOAD ?auto_15669 ?auto_15671 ?auto_15672 ?auto_15680 )
      ( MAKE-ON ?auto_15665 ?auto_15666 )
      ( MAKE-ON-VERIFY ?auto_15665 ?auto_15666 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15682 - SURFACE
      ?auto_15683 - SURFACE
    )
    :vars
    (
      ?auto_15686 - HOIST
      ?auto_15697 - PLACE
      ?auto_15692 - PLACE
      ?auto_15694 - HOIST
      ?auto_15689 - SURFACE
      ?auto_15691 - SURFACE
      ?auto_15696 - PLACE
      ?auto_15687 - HOIST
      ?auto_15698 - SURFACE
      ?auto_15685 - SURFACE
      ?auto_15695 - PLACE
      ?auto_15684 - HOIST
      ?auto_15690 - SURFACE
      ?auto_15693 - SURFACE
      ?auto_15688 - TRUCK
      ?auto_15699 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15686 ?auto_15697 ) ( IS-CRATE ?auto_15682 ) ( not ( = ?auto_15682 ?auto_15683 ) ) ( not ( = ?auto_15692 ?auto_15697 ) ) ( HOIST-AT ?auto_15694 ?auto_15692 ) ( not ( = ?auto_15686 ?auto_15694 ) ) ( SURFACE-AT ?auto_15682 ?auto_15692 ) ( ON ?auto_15682 ?auto_15689 ) ( CLEAR ?auto_15682 ) ( not ( = ?auto_15682 ?auto_15689 ) ) ( not ( = ?auto_15683 ?auto_15689 ) ) ( IS-CRATE ?auto_15683 ) ( not ( = ?auto_15682 ?auto_15691 ) ) ( not ( = ?auto_15683 ?auto_15691 ) ) ( not ( = ?auto_15689 ?auto_15691 ) ) ( not ( = ?auto_15696 ?auto_15697 ) ) ( not ( = ?auto_15692 ?auto_15696 ) ) ( HOIST-AT ?auto_15687 ?auto_15696 ) ( not ( = ?auto_15686 ?auto_15687 ) ) ( not ( = ?auto_15694 ?auto_15687 ) ) ( AVAILABLE ?auto_15687 ) ( SURFACE-AT ?auto_15683 ?auto_15696 ) ( ON ?auto_15683 ?auto_15698 ) ( CLEAR ?auto_15683 ) ( not ( = ?auto_15682 ?auto_15698 ) ) ( not ( = ?auto_15683 ?auto_15698 ) ) ( not ( = ?auto_15689 ?auto_15698 ) ) ( not ( = ?auto_15691 ?auto_15698 ) ) ( IS-CRATE ?auto_15691 ) ( not ( = ?auto_15682 ?auto_15685 ) ) ( not ( = ?auto_15683 ?auto_15685 ) ) ( not ( = ?auto_15689 ?auto_15685 ) ) ( not ( = ?auto_15691 ?auto_15685 ) ) ( not ( = ?auto_15698 ?auto_15685 ) ) ( not ( = ?auto_15695 ?auto_15697 ) ) ( not ( = ?auto_15692 ?auto_15695 ) ) ( not ( = ?auto_15696 ?auto_15695 ) ) ( HOIST-AT ?auto_15684 ?auto_15695 ) ( not ( = ?auto_15686 ?auto_15684 ) ) ( not ( = ?auto_15694 ?auto_15684 ) ) ( not ( = ?auto_15687 ?auto_15684 ) ) ( AVAILABLE ?auto_15684 ) ( SURFACE-AT ?auto_15691 ?auto_15695 ) ( ON ?auto_15691 ?auto_15690 ) ( CLEAR ?auto_15691 ) ( not ( = ?auto_15682 ?auto_15690 ) ) ( not ( = ?auto_15683 ?auto_15690 ) ) ( not ( = ?auto_15689 ?auto_15690 ) ) ( not ( = ?auto_15691 ?auto_15690 ) ) ( not ( = ?auto_15698 ?auto_15690 ) ) ( not ( = ?auto_15685 ?auto_15690 ) ) ( SURFACE-AT ?auto_15693 ?auto_15697 ) ( CLEAR ?auto_15693 ) ( IS-CRATE ?auto_15685 ) ( not ( = ?auto_15682 ?auto_15693 ) ) ( not ( = ?auto_15683 ?auto_15693 ) ) ( not ( = ?auto_15689 ?auto_15693 ) ) ( not ( = ?auto_15691 ?auto_15693 ) ) ( not ( = ?auto_15698 ?auto_15693 ) ) ( not ( = ?auto_15685 ?auto_15693 ) ) ( not ( = ?auto_15690 ?auto_15693 ) ) ( AVAILABLE ?auto_15686 ) ( TRUCK-AT ?auto_15688 ?auto_15692 ) ( AVAILABLE ?auto_15694 ) ( SURFACE-AT ?auto_15685 ?auto_15692 ) ( ON ?auto_15685 ?auto_15699 ) ( CLEAR ?auto_15685 ) ( not ( = ?auto_15682 ?auto_15699 ) ) ( not ( = ?auto_15683 ?auto_15699 ) ) ( not ( = ?auto_15689 ?auto_15699 ) ) ( not ( = ?auto_15691 ?auto_15699 ) ) ( not ( = ?auto_15698 ?auto_15699 ) ) ( not ( = ?auto_15685 ?auto_15699 ) ) ( not ( = ?auto_15690 ?auto_15699 ) ) ( not ( = ?auto_15693 ?auto_15699 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15694 ?auto_15685 ?auto_15699 ?auto_15692 )
      ( MAKE-ON ?auto_15682 ?auto_15683 )
      ( MAKE-ON-VERIFY ?auto_15682 ?auto_15683 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15700 - SURFACE
      ?auto_15701 - SURFACE
    )
    :vars
    (
      ?auto_15709 - HOIST
      ?auto_15717 - PLACE
      ?auto_15705 - PLACE
      ?auto_15702 - HOIST
      ?auto_15715 - SURFACE
      ?auto_15714 - SURFACE
      ?auto_15713 - PLACE
      ?auto_15711 - HOIST
      ?auto_15707 - SURFACE
      ?auto_15710 - SURFACE
      ?auto_15703 - PLACE
      ?auto_15716 - HOIST
      ?auto_15704 - SURFACE
      ?auto_15708 - SURFACE
      ?auto_15712 - SURFACE
      ?auto_15706 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15709 ?auto_15717 ) ( IS-CRATE ?auto_15700 ) ( not ( = ?auto_15700 ?auto_15701 ) ) ( not ( = ?auto_15705 ?auto_15717 ) ) ( HOIST-AT ?auto_15702 ?auto_15705 ) ( not ( = ?auto_15709 ?auto_15702 ) ) ( SURFACE-AT ?auto_15700 ?auto_15705 ) ( ON ?auto_15700 ?auto_15715 ) ( CLEAR ?auto_15700 ) ( not ( = ?auto_15700 ?auto_15715 ) ) ( not ( = ?auto_15701 ?auto_15715 ) ) ( IS-CRATE ?auto_15701 ) ( not ( = ?auto_15700 ?auto_15714 ) ) ( not ( = ?auto_15701 ?auto_15714 ) ) ( not ( = ?auto_15715 ?auto_15714 ) ) ( not ( = ?auto_15713 ?auto_15717 ) ) ( not ( = ?auto_15705 ?auto_15713 ) ) ( HOIST-AT ?auto_15711 ?auto_15713 ) ( not ( = ?auto_15709 ?auto_15711 ) ) ( not ( = ?auto_15702 ?auto_15711 ) ) ( AVAILABLE ?auto_15711 ) ( SURFACE-AT ?auto_15701 ?auto_15713 ) ( ON ?auto_15701 ?auto_15707 ) ( CLEAR ?auto_15701 ) ( not ( = ?auto_15700 ?auto_15707 ) ) ( not ( = ?auto_15701 ?auto_15707 ) ) ( not ( = ?auto_15715 ?auto_15707 ) ) ( not ( = ?auto_15714 ?auto_15707 ) ) ( IS-CRATE ?auto_15714 ) ( not ( = ?auto_15700 ?auto_15710 ) ) ( not ( = ?auto_15701 ?auto_15710 ) ) ( not ( = ?auto_15715 ?auto_15710 ) ) ( not ( = ?auto_15714 ?auto_15710 ) ) ( not ( = ?auto_15707 ?auto_15710 ) ) ( not ( = ?auto_15703 ?auto_15717 ) ) ( not ( = ?auto_15705 ?auto_15703 ) ) ( not ( = ?auto_15713 ?auto_15703 ) ) ( HOIST-AT ?auto_15716 ?auto_15703 ) ( not ( = ?auto_15709 ?auto_15716 ) ) ( not ( = ?auto_15702 ?auto_15716 ) ) ( not ( = ?auto_15711 ?auto_15716 ) ) ( AVAILABLE ?auto_15716 ) ( SURFACE-AT ?auto_15714 ?auto_15703 ) ( ON ?auto_15714 ?auto_15704 ) ( CLEAR ?auto_15714 ) ( not ( = ?auto_15700 ?auto_15704 ) ) ( not ( = ?auto_15701 ?auto_15704 ) ) ( not ( = ?auto_15715 ?auto_15704 ) ) ( not ( = ?auto_15714 ?auto_15704 ) ) ( not ( = ?auto_15707 ?auto_15704 ) ) ( not ( = ?auto_15710 ?auto_15704 ) ) ( SURFACE-AT ?auto_15708 ?auto_15717 ) ( CLEAR ?auto_15708 ) ( IS-CRATE ?auto_15710 ) ( not ( = ?auto_15700 ?auto_15708 ) ) ( not ( = ?auto_15701 ?auto_15708 ) ) ( not ( = ?auto_15715 ?auto_15708 ) ) ( not ( = ?auto_15714 ?auto_15708 ) ) ( not ( = ?auto_15707 ?auto_15708 ) ) ( not ( = ?auto_15710 ?auto_15708 ) ) ( not ( = ?auto_15704 ?auto_15708 ) ) ( AVAILABLE ?auto_15709 ) ( AVAILABLE ?auto_15702 ) ( SURFACE-AT ?auto_15710 ?auto_15705 ) ( ON ?auto_15710 ?auto_15712 ) ( CLEAR ?auto_15710 ) ( not ( = ?auto_15700 ?auto_15712 ) ) ( not ( = ?auto_15701 ?auto_15712 ) ) ( not ( = ?auto_15715 ?auto_15712 ) ) ( not ( = ?auto_15714 ?auto_15712 ) ) ( not ( = ?auto_15707 ?auto_15712 ) ) ( not ( = ?auto_15710 ?auto_15712 ) ) ( not ( = ?auto_15704 ?auto_15712 ) ) ( not ( = ?auto_15708 ?auto_15712 ) ) ( TRUCK-AT ?auto_15706 ?auto_15717 ) )
    :subtasks
    ( ( !DRIVE ?auto_15706 ?auto_15717 ?auto_15705 )
      ( MAKE-ON ?auto_15700 ?auto_15701 )
      ( MAKE-ON-VERIFY ?auto_15700 ?auto_15701 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15720 - SURFACE
      ?auto_15721 - SURFACE
    )
    :vars
    (
      ?auto_15722 - HOIST
      ?auto_15723 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15722 ?auto_15723 ) ( SURFACE-AT ?auto_15721 ?auto_15723 ) ( CLEAR ?auto_15721 ) ( LIFTING ?auto_15722 ?auto_15720 ) ( IS-CRATE ?auto_15720 ) ( not ( = ?auto_15720 ?auto_15721 ) ) )
    :subtasks
    ( ( !DROP ?auto_15722 ?auto_15720 ?auto_15721 ?auto_15723 )
      ( MAKE-ON-VERIFY ?auto_15720 ?auto_15721 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15724 - SURFACE
      ?auto_15725 - SURFACE
    )
    :vars
    (
      ?auto_15726 - HOIST
      ?auto_15727 - PLACE
      ?auto_15728 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15726 ?auto_15727 ) ( SURFACE-AT ?auto_15725 ?auto_15727 ) ( CLEAR ?auto_15725 ) ( IS-CRATE ?auto_15724 ) ( not ( = ?auto_15724 ?auto_15725 ) ) ( TRUCK-AT ?auto_15728 ?auto_15727 ) ( AVAILABLE ?auto_15726 ) ( IN ?auto_15724 ?auto_15728 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15726 ?auto_15724 ?auto_15728 ?auto_15727 )
      ( MAKE-ON ?auto_15724 ?auto_15725 )
      ( MAKE-ON-VERIFY ?auto_15724 ?auto_15725 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15729 - SURFACE
      ?auto_15730 - SURFACE
    )
    :vars
    (
      ?auto_15731 - HOIST
      ?auto_15733 - PLACE
      ?auto_15732 - TRUCK
      ?auto_15734 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15731 ?auto_15733 ) ( SURFACE-AT ?auto_15730 ?auto_15733 ) ( CLEAR ?auto_15730 ) ( IS-CRATE ?auto_15729 ) ( not ( = ?auto_15729 ?auto_15730 ) ) ( AVAILABLE ?auto_15731 ) ( IN ?auto_15729 ?auto_15732 ) ( TRUCK-AT ?auto_15732 ?auto_15734 ) ( not ( = ?auto_15734 ?auto_15733 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15732 ?auto_15734 ?auto_15733 )
      ( MAKE-ON ?auto_15729 ?auto_15730 )
      ( MAKE-ON-VERIFY ?auto_15729 ?auto_15730 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15735 - SURFACE
      ?auto_15736 - SURFACE
    )
    :vars
    (
      ?auto_15740 - HOIST
      ?auto_15737 - PLACE
      ?auto_15738 - TRUCK
      ?auto_15739 - PLACE
      ?auto_15741 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15740 ?auto_15737 ) ( SURFACE-AT ?auto_15736 ?auto_15737 ) ( CLEAR ?auto_15736 ) ( IS-CRATE ?auto_15735 ) ( not ( = ?auto_15735 ?auto_15736 ) ) ( AVAILABLE ?auto_15740 ) ( TRUCK-AT ?auto_15738 ?auto_15739 ) ( not ( = ?auto_15739 ?auto_15737 ) ) ( HOIST-AT ?auto_15741 ?auto_15739 ) ( LIFTING ?auto_15741 ?auto_15735 ) ( not ( = ?auto_15740 ?auto_15741 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15741 ?auto_15735 ?auto_15738 ?auto_15739 )
      ( MAKE-ON ?auto_15735 ?auto_15736 )
      ( MAKE-ON-VERIFY ?auto_15735 ?auto_15736 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15742 - SURFACE
      ?auto_15743 - SURFACE
    )
    :vars
    (
      ?auto_15745 - HOIST
      ?auto_15744 - PLACE
      ?auto_15747 - TRUCK
      ?auto_15748 - PLACE
      ?auto_15746 - HOIST
      ?auto_15749 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15745 ?auto_15744 ) ( SURFACE-AT ?auto_15743 ?auto_15744 ) ( CLEAR ?auto_15743 ) ( IS-CRATE ?auto_15742 ) ( not ( = ?auto_15742 ?auto_15743 ) ) ( AVAILABLE ?auto_15745 ) ( TRUCK-AT ?auto_15747 ?auto_15748 ) ( not ( = ?auto_15748 ?auto_15744 ) ) ( HOIST-AT ?auto_15746 ?auto_15748 ) ( not ( = ?auto_15745 ?auto_15746 ) ) ( AVAILABLE ?auto_15746 ) ( SURFACE-AT ?auto_15742 ?auto_15748 ) ( ON ?auto_15742 ?auto_15749 ) ( CLEAR ?auto_15742 ) ( not ( = ?auto_15742 ?auto_15749 ) ) ( not ( = ?auto_15743 ?auto_15749 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15746 ?auto_15742 ?auto_15749 ?auto_15748 )
      ( MAKE-ON ?auto_15742 ?auto_15743 )
      ( MAKE-ON-VERIFY ?auto_15742 ?auto_15743 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15750 - SURFACE
      ?auto_15751 - SURFACE
    )
    :vars
    (
      ?auto_15757 - HOIST
      ?auto_15753 - PLACE
      ?auto_15754 - PLACE
      ?auto_15755 - HOIST
      ?auto_15756 - SURFACE
      ?auto_15752 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15757 ?auto_15753 ) ( SURFACE-AT ?auto_15751 ?auto_15753 ) ( CLEAR ?auto_15751 ) ( IS-CRATE ?auto_15750 ) ( not ( = ?auto_15750 ?auto_15751 ) ) ( AVAILABLE ?auto_15757 ) ( not ( = ?auto_15754 ?auto_15753 ) ) ( HOIST-AT ?auto_15755 ?auto_15754 ) ( not ( = ?auto_15757 ?auto_15755 ) ) ( AVAILABLE ?auto_15755 ) ( SURFACE-AT ?auto_15750 ?auto_15754 ) ( ON ?auto_15750 ?auto_15756 ) ( CLEAR ?auto_15750 ) ( not ( = ?auto_15750 ?auto_15756 ) ) ( not ( = ?auto_15751 ?auto_15756 ) ) ( TRUCK-AT ?auto_15752 ?auto_15753 ) )
    :subtasks
    ( ( !DRIVE ?auto_15752 ?auto_15753 ?auto_15754 )
      ( MAKE-ON ?auto_15750 ?auto_15751 )
      ( MAKE-ON-VERIFY ?auto_15750 ?auto_15751 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15758 - SURFACE
      ?auto_15759 - SURFACE
    )
    :vars
    (
      ?auto_15763 - HOIST
      ?auto_15760 - PLACE
      ?auto_15764 - PLACE
      ?auto_15765 - HOIST
      ?auto_15761 - SURFACE
      ?auto_15762 - TRUCK
      ?auto_15766 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15763 ?auto_15760 ) ( IS-CRATE ?auto_15758 ) ( not ( = ?auto_15758 ?auto_15759 ) ) ( not ( = ?auto_15764 ?auto_15760 ) ) ( HOIST-AT ?auto_15765 ?auto_15764 ) ( not ( = ?auto_15763 ?auto_15765 ) ) ( AVAILABLE ?auto_15765 ) ( SURFACE-AT ?auto_15758 ?auto_15764 ) ( ON ?auto_15758 ?auto_15761 ) ( CLEAR ?auto_15758 ) ( not ( = ?auto_15758 ?auto_15761 ) ) ( not ( = ?auto_15759 ?auto_15761 ) ) ( TRUCK-AT ?auto_15762 ?auto_15760 ) ( SURFACE-AT ?auto_15766 ?auto_15760 ) ( CLEAR ?auto_15766 ) ( LIFTING ?auto_15763 ?auto_15759 ) ( IS-CRATE ?auto_15759 ) ( not ( = ?auto_15758 ?auto_15766 ) ) ( not ( = ?auto_15759 ?auto_15766 ) ) ( not ( = ?auto_15761 ?auto_15766 ) ) )
    :subtasks
    ( ( !DROP ?auto_15763 ?auto_15759 ?auto_15766 ?auto_15760 )
      ( MAKE-ON ?auto_15758 ?auto_15759 )
      ( MAKE-ON-VERIFY ?auto_15758 ?auto_15759 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15767 - SURFACE
      ?auto_15768 - SURFACE
    )
    :vars
    (
      ?auto_15771 - HOIST
      ?auto_15772 - PLACE
      ?auto_15770 - PLACE
      ?auto_15775 - HOIST
      ?auto_15774 - SURFACE
      ?auto_15773 - TRUCK
      ?auto_15769 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15771 ?auto_15772 ) ( IS-CRATE ?auto_15767 ) ( not ( = ?auto_15767 ?auto_15768 ) ) ( not ( = ?auto_15770 ?auto_15772 ) ) ( HOIST-AT ?auto_15775 ?auto_15770 ) ( not ( = ?auto_15771 ?auto_15775 ) ) ( AVAILABLE ?auto_15775 ) ( SURFACE-AT ?auto_15767 ?auto_15770 ) ( ON ?auto_15767 ?auto_15774 ) ( CLEAR ?auto_15767 ) ( not ( = ?auto_15767 ?auto_15774 ) ) ( not ( = ?auto_15768 ?auto_15774 ) ) ( TRUCK-AT ?auto_15773 ?auto_15772 ) ( SURFACE-AT ?auto_15769 ?auto_15772 ) ( CLEAR ?auto_15769 ) ( IS-CRATE ?auto_15768 ) ( not ( = ?auto_15767 ?auto_15769 ) ) ( not ( = ?auto_15768 ?auto_15769 ) ) ( not ( = ?auto_15774 ?auto_15769 ) ) ( AVAILABLE ?auto_15771 ) ( IN ?auto_15768 ?auto_15773 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15771 ?auto_15768 ?auto_15773 ?auto_15772 )
      ( MAKE-ON ?auto_15767 ?auto_15768 )
      ( MAKE-ON-VERIFY ?auto_15767 ?auto_15768 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15776 - SURFACE
      ?auto_15777 - SURFACE
    )
    :vars
    (
      ?auto_15782 - HOIST
      ?auto_15779 - PLACE
      ?auto_15778 - PLACE
      ?auto_15783 - HOIST
      ?auto_15784 - SURFACE
      ?auto_15781 - SURFACE
      ?auto_15780 - TRUCK
      ?auto_15785 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15782 ?auto_15779 ) ( IS-CRATE ?auto_15776 ) ( not ( = ?auto_15776 ?auto_15777 ) ) ( not ( = ?auto_15778 ?auto_15779 ) ) ( HOIST-AT ?auto_15783 ?auto_15778 ) ( not ( = ?auto_15782 ?auto_15783 ) ) ( AVAILABLE ?auto_15783 ) ( SURFACE-AT ?auto_15776 ?auto_15778 ) ( ON ?auto_15776 ?auto_15784 ) ( CLEAR ?auto_15776 ) ( not ( = ?auto_15776 ?auto_15784 ) ) ( not ( = ?auto_15777 ?auto_15784 ) ) ( SURFACE-AT ?auto_15781 ?auto_15779 ) ( CLEAR ?auto_15781 ) ( IS-CRATE ?auto_15777 ) ( not ( = ?auto_15776 ?auto_15781 ) ) ( not ( = ?auto_15777 ?auto_15781 ) ) ( not ( = ?auto_15784 ?auto_15781 ) ) ( AVAILABLE ?auto_15782 ) ( IN ?auto_15777 ?auto_15780 ) ( TRUCK-AT ?auto_15780 ?auto_15785 ) ( not ( = ?auto_15785 ?auto_15779 ) ) ( not ( = ?auto_15778 ?auto_15785 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15780 ?auto_15785 ?auto_15779 )
      ( MAKE-ON ?auto_15776 ?auto_15777 )
      ( MAKE-ON-VERIFY ?auto_15776 ?auto_15777 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15786 - SURFACE
      ?auto_15787 - SURFACE
    )
    :vars
    (
      ?auto_15791 - HOIST
      ?auto_15793 - PLACE
      ?auto_15788 - PLACE
      ?auto_15792 - HOIST
      ?auto_15789 - SURFACE
      ?auto_15794 - SURFACE
      ?auto_15790 - TRUCK
      ?auto_15795 - PLACE
      ?auto_15796 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15791 ?auto_15793 ) ( IS-CRATE ?auto_15786 ) ( not ( = ?auto_15786 ?auto_15787 ) ) ( not ( = ?auto_15788 ?auto_15793 ) ) ( HOIST-AT ?auto_15792 ?auto_15788 ) ( not ( = ?auto_15791 ?auto_15792 ) ) ( AVAILABLE ?auto_15792 ) ( SURFACE-AT ?auto_15786 ?auto_15788 ) ( ON ?auto_15786 ?auto_15789 ) ( CLEAR ?auto_15786 ) ( not ( = ?auto_15786 ?auto_15789 ) ) ( not ( = ?auto_15787 ?auto_15789 ) ) ( SURFACE-AT ?auto_15794 ?auto_15793 ) ( CLEAR ?auto_15794 ) ( IS-CRATE ?auto_15787 ) ( not ( = ?auto_15786 ?auto_15794 ) ) ( not ( = ?auto_15787 ?auto_15794 ) ) ( not ( = ?auto_15789 ?auto_15794 ) ) ( AVAILABLE ?auto_15791 ) ( TRUCK-AT ?auto_15790 ?auto_15795 ) ( not ( = ?auto_15795 ?auto_15793 ) ) ( not ( = ?auto_15788 ?auto_15795 ) ) ( HOIST-AT ?auto_15796 ?auto_15795 ) ( LIFTING ?auto_15796 ?auto_15787 ) ( not ( = ?auto_15791 ?auto_15796 ) ) ( not ( = ?auto_15792 ?auto_15796 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15796 ?auto_15787 ?auto_15790 ?auto_15795 )
      ( MAKE-ON ?auto_15786 ?auto_15787 )
      ( MAKE-ON-VERIFY ?auto_15786 ?auto_15787 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15797 - SURFACE
      ?auto_15798 - SURFACE
    )
    :vars
    (
      ?auto_15803 - HOIST
      ?auto_15799 - PLACE
      ?auto_15804 - PLACE
      ?auto_15807 - HOIST
      ?auto_15802 - SURFACE
      ?auto_15805 - SURFACE
      ?auto_15801 - TRUCK
      ?auto_15806 - PLACE
      ?auto_15800 - HOIST
      ?auto_15808 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15803 ?auto_15799 ) ( IS-CRATE ?auto_15797 ) ( not ( = ?auto_15797 ?auto_15798 ) ) ( not ( = ?auto_15804 ?auto_15799 ) ) ( HOIST-AT ?auto_15807 ?auto_15804 ) ( not ( = ?auto_15803 ?auto_15807 ) ) ( AVAILABLE ?auto_15807 ) ( SURFACE-AT ?auto_15797 ?auto_15804 ) ( ON ?auto_15797 ?auto_15802 ) ( CLEAR ?auto_15797 ) ( not ( = ?auto_15797 ?auto_15802 ) ) ( not ( = ?auto_15798 ?auto_15802 ) ) ( SURFACE-AT ?auto_15805 ?auto_15799 ) ( CLEAR ?auto_15805 ) ( IS-CRATE ?auto_15798 ) ( not ( = ?auto_15797 ?auto_15805 ) ) ( not ( = ?auto_15798 ?auto_15805 ) ) ( not ( = ?auto_15802 ?auto_15805 ) ) ( AVAILABLE ?auto_15803 ) ( TRUCK-AT ?auto_15801 ?auto_15806 ) ( not ( = ?auto_15806 ?auto_15799 ) ) ( not ( = ?auto_15804 ?auto_15806 ) ) ( HOIST-AT ?auto_15800 ?auto_15806 ) ( not ( = ?auto_15803 ?auto_15800 ) ) ( not ( = ?auto_15807 ?auto_15800 ) ) ( AVAILABLE ?auto_15800 ) ( SURFACE-AT ?auto_15798 ?auto_15806 ) ( ON ?auto_15798 ?auto_15808 ) ( CLEAR ?auto_15798 ) ( not ( = ?auto_15797 ?auto_15808 ) ) ( not ( = ?auto_15798 ?auto_15808 ) ) ( not ( = ?auto_15802 ?auto_15808 ) ) ( not ( = ?auto_15805 ?auto_15808 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15800 ?auto_15798 ?auto_15808 ?auto_15806 )
      ( MAKE-ON ?auto_15797 ?auto_15798 )
      ( MAKE-ON-VERIFY ?auto_15797 ?auto_15798 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15809 - SURFACE
      ?auto_15810 - SURFACE
    )
    :vars
    (
      ?auto_15818 - HOIST
      ?auto_15816 - PLACE
      ?auto_15815 - PLACE
      ?auto_15812 - HOIST
      ?auto_15817 - SURFACE
      ?auto_15811 - SURFACE
      ?auto_15820 - PLACE
      ?auto_15813 - HOIST
      ?auto_15819 - SURFACE
      ?auto_15814 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15818 ?auto_15816 ) ( IS-CRATE ?auto_15809 ) ( not ( = ?auto_15809 ?auto_15810 ) ) ( not ( = ?auto_15815 ?auto_15816 ) ) ( HOIST-AT ?auto_15812 ?auto_15815 ) ( not ( = ?auto_15818 ?auto_15812 ) ) ( AVAILABLE ?auto_15812 ) ( SURFACE-AT ?auto_15809 ?auto_15815 ) ( ON ?auto_15809 ?auto_15817 ) ( CLEAR ?auto_15809 ) ( not ( = ?auto_15809 ?auto_15817 ) ) ( not ( = ?auto_15810 ?auto_15817 ) ) ( SURFACE-AT ?auto_15811 ?auto_15816 ) ( CLEAR ?auto_15811 ) ( IS-CRATE ?auto_15810 ) ( not ( = ?auto_15809 ?auto_15811 ) ) ( not ( = ?auto_15810 ?auto_15811 ) ) ( not ( = ?auto_15817 ?auto_15811 ) ) ( AVAILABLE ?auto_15818 ) ( not ( = ?auto_15820 ?auto_15816 ) ) ( not ( = ?auto_15815 ?auto_15820 ) ) ( HOIST-AT ?auto_15813 ?auto_15820 ) ( not ( = ?auto_15818 ?auto_15813 ) ) ( not ( = ?auto_15812 ?auto_15813 ) ) ( AVAILABLE ?auto_15813 ) ( SURFACE-AT ?auto_15810 ?auto_15820 ) ( ON ?auto_15810 ?auto_15819 ) ( CLEAR ?auto_15810 ) ( not ( = ?auto_15809 ?auto_15819 ) ) ( not ( = ?auto_15810 ?auto_15819 ) ) ( not ( = ?auto_15817 ?auto_15819 ) ) ( not ( = ?auto_15811 ?auto_15819 ) ) ( TRUCK-AT ?auto_15814 ?auto_15816 ) )
    :subtasks
    ( ( !DRIVE ?auto_15814 ?auto_15816 ?auto_15820 )
      ( MAKE-ON ?auto_15809 ?auto_15810 )
      ( MAKE-ON-VERIFY ?auto_15809 ?auto_15810 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15821 - SURFACE
      ?auto_15822 - SURFACE
    )
    :vars
    (
      ?auto_15823 - HOIST
      ?auto_15828 - PLACE
      ?auto_15825 - PLACE
      ?auto_15831 - HOIST
      ?auto_15830 - SURFACE
      ?auto_15829 - SURFACE
      ?auto_15832 - PLACE
      ?auto_15826 - HOIST
      ?auto_15827 - SURFACE
      ?auto_15824 - TRUCK
      ?auto_15833 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15823 ?auto_15828 ) ( IS-CRATE ?auto_15821 ) ( not ( = ?auto_15821 ?auto_15822 ) ) ( not ( = ?auto_15825 ?auto_15828 ) ) ( HOIST-AT ?auto_15831 ?auto_15825 ) ( not ( = ?auto_15823 ?auto_15831 ) ) ( AVAILABLE ?auto_15831 ) ( SURFACE-AT ?auto_15821 ?auto_15825 ) ( ON ?auto_15821 ?auto_15830 ) ( CLEAR ?auto_15821 ) ( not ( = ?auto_15821 ?auto_15830 ) ) ( not ( = ?auto_15822 ?auto_15830 ) ) ( IS-CRATE ?auto_15822 ) ( not ( = ?auto_15821 ?auto_15829 ) ) ( not ( = ?auto_15822 ?auto_15829 ) ) ( not ( = ?auto_15830 ?auto_15829 ) ) ( not ( = ?auto_15832 ?auto_15828 ) ) ( not ( = ?auto_15825 ?auto_15832 ) ) ( HOIST-AT ?auto_15826 ?auto_15832 ) ( not ( = ?auto_15823 ?auto_15826 ) ) ( not ( = ?auto_15831 ?auto_15826 ) ) ( AVAILABLE ?auto_15826 ) ( SURFACE-AT ?auto_15822 ?auto_15832 ) ( ON ?auto_15822 ?auto_15827 ) ( CLEAR ?auto_15822 ) ( not ( = ?auto_15821 ?auto_15827 ) ) ( not ( = ?auto_15822 ?auto_15827 ) ) ( not ( = ?auto_15830 ?auto_15827 ) ) ( not ( = ?auto_15829 ?auto_15827 ) ) ( TRUCK-AT ?auto_15824 ?auto_15828 ) ( SURFACE-AT ?auto_15833 ?auto_15828 ) ( CLEAR ?auto_15833 ) ( LIFTING ?auto_15823 ?auto_15829 ) ( IS-CRATE ?auto_15829 ) ( not ( = ?auto_15821 ?auto_15833 ) ) ( not ( = ?auto_15822 ?auto_15833 ) ) ( not ( = ?auto_15830 ?auto_15833 ) ) ( not ( = ?auto_15829 ?auto_15833 ) ) ( not ( = ?auto_15827 ?auto_15833 ) ) )
    :subtasks
    ( ( !DROP ?auto_15823 ?auto_15829 ?auto_15833 ?auto_15828 )
      ( MAKE-ON ?auto_15821 ?auto_15822 )
      ( MAKE-ON-VERIFY ?auto_15821 ?auto_15822 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15834 - SURFACE
      ?auto_15835 - SURFACE
    )
    :vars
    (
      ?auto_15839 - HOIST
      ?auto_15844 - PLACE
      ?auto_15843 - PLACE
      ?auto_15841 - HOIST
      ?auto_15836 - SURFACE
      ?auto_15838 - SURFACE
      ?auto_15837 - PLACE
      ?auto_15845 - HOIST
      ?auto_15840 - SURFACE
      ?auto_15846 - TRUCK
      ?auto_15842 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15839 ?auto_15844 ) ( IS-CRATE ?auto_15834 ) ( not ( = ?auto_15834 ?auto_15835 ) ) ( not ( = ?auto_15843 ?auto_15844 ) ) ( HOIST-AT ?auto_15841 ?auto_15843 ) ( not ( = ?auto_15839 ?auto_15841 ) ) ( AVAILABLE ?auto_15841 ) ( SURFACE-AT ?auto_15834 ?auto_15843 ) ( ON ?auto_15834 ?auto_15836 ) ( CLEAR ?auto_15834 ) ( not ( = ?auto_15834 ?auto_15836 ) ) ( not ( = ?auto_15835 ?auto_15836 ) ) ( IS-CRATE ?auto_15835 ) ( not ( = ?auto_15834 ?auto_15838 ) ) ( not ( = ?auto_15835 ?auto_15838 ) ) ( not ( = ?auto_15836 ?auto_15838 ) ) ( not ( = ?auto_15837 ?auto_15844 ) ) ( not ( = ?auto_15843 ?auto_15837 ) ) ( HOIST-AT ?auto_15845 ?auto_15837 ) ( not ( = ?auto_15839 ?auto_15845 ) ) ( not ( = ?auto_15841 ?auto_15845 ) ) ( AVAILABLE ?auto_15845 ) ( SURFACE-AT ?auto_15835 ?auto_15837 ) ( ON ?auto_15835 ?auto_15840 ) ( CLEAR ?auto_15835 ) ( not ( = ?auto_15834 ?auto_15840 ) ) ( not ( = ?auto_15835 ?auto_15840 ) ) ( not ( = ?auto_15836 ?auto_15840 ) ) ( not ( = ?auto_15838 ?auto_15840 ) ) ( TRUCK-AT ?auto_15846 ?auto_15844 ) ( SURFACE-AT ?auto_15842 ?auto_15844 ) ( CLEAR ?auto_15842 ) ( IS-CRATE ?auto_15838 ) ( not ( = ?auto_15834 ?auto_15842 ) ) ( not ( = ?auto_15835 ?auto_15842 ) ) ( not ( = ?auto_15836 ?auto_15842 ) ) ( not ( = ?auto_15838 ?auto_15842 ) ) ( not ( = ?auto_15840 ?auto_15842 ) ) ( AVAILABLE ?auto_15839 ) ( IN ?auto_15838 ?auto_15846 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15839 ?auto_15838 ?auto_15846 ?auto_15844 )
      ( MAKE-ON ?auto_15834 ?auto_15835 )
      ( MAKE-ON-VERIFY ?auto_15834 ?auto_15835 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15847 - SURFACE
      ?auto_15848 - SURFACE
    )
    :vars
    (
      ?auto_15851 - HOIST
      ?auto_15856 - PLACE
      ?auto_15857 - PLACE
      ?auto_15849 - HOIST
      ?auto_15853 - SURFACE
      ?auto_15858 - SURFACE
      ?auto_15859 - PLACE
      ?auto_15854 - HOIST
      ?auto_15852 - SURFACE
      ?auto_15855 - SURFACE
      ?auto_15850 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15851 ?auto_15856 ) ( IS-CRATE ?auto_15847 ) ( not ( = ?auto_15847 ?auto_15848 ) ) ( not ( = ?auto_15857 ?auto_15856 ) ) ( HOIST-AT ?auto_15849 ?auto_15857 ) ( not ( = ?auto_15851 ?auto_15849 ) ) ( AVAILABLE ?auto_15849 ) ( SURFACE-AT ?auto_15847 ?auto_15857 ) ( ON ?auto_15847 ?auto_15853 ) ( CLEAR ?auto_15847 ) ( not ( = ?auto_15847 ?auto_15853 ) ) ( not ( = ?auto_15848 ?auto_15853 ) ) ( IS-CRATE ?auto_15848 ) ( not ( = ?auto_15847 ?auto_15858 ) ) ( not ( = ?auto_15848 ?auto_15858 ) ) ( not ( = ?auto_15853 ?auto_15858 ) ) ( not ( = ?auto_15859 ?auto_15856 ) ) ( not ( = ?auto_15857 ?auto_15859 ) ) ( HOIST-AT ?auto_15854 ?auto_15859 ) ( not ( = ?auto_15851 ?auto_15854 ) ) ( not ( = ?auto_15849 ?auto_15854 ) ) ( AVAILABLE ?auto_15854 ) ( SURFACE-AT ?auto_15848 ?auto_15859 ) ( ON ?auto_15848 ?auto_15852 ) ( CLEAR ?auto_15848 ) ( not ( = ?auto_15847 ?auto_15852 ) ) ( not ( = ?auto_15848 ?auto_15852 ) ) ( not ( = ?auto_15853 ?auto_15852 ) ) ( not ( = ?auto_15858 ?auto_15852 ) ) ( SURFACE-AT ?auto_15855 ?auto_15856 ) ( CLEAR ?auto_15855 ) ( IS-CRATE ?auto_15858 ) ( not ( = ?auto_15847 ?auto_15855 ) ) ( not ( = ?auto_15848 ?auto_15855 ) ) ( not ( = ?auto_15853 ?auto_15855 ) ) ( not ( = ?auto_15858 ?auto_15855 ) ) ( not ( = ?auto_15852 ?auto_15855 ) ) ( AVAILABLE ?auto_15851 ) ( IN ?auto_15858 ?auto_15850 ) ( TRUCK-AT ?auto_15850 ?auto_15857 ) )
    :subtasks
    ( ( !DRIVE ?auto_15850 ?auto_15857 ?auto_15856 )
      ( MAKE-ON ?auto_15847 ?auto_15848 )
      ( MAKE-ON-VERIFY ?auto_15847 ?auto_15848 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15860 - SURFACE
      ?auto_15861 - SURFACE
    )
    :vars
    (
      ?auto_15869 - HOIST
      ?auto_15870 - PLACE
      ?auto_15868 - PLACE
      ?auto_15872 - HOIST
      ?auto_15863 - SURFACE
      ?auto_15864 - SURFACE
      ?auto_15867 - PLACE
      ?auto_15862 - HOIST
      ?auto_15866 - SURFACE
      ?auto_15871 - SURFACE
      ?auto_15865 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15869 ?auto_15870 ) ( IS-CRATE ?auto_15860 ) ( not ( = ?auto_15860 ?auto_15861 ) ) ( not ( = ?auto_15868 ?auto_15870 ) ) ( HOIST-AT ?auto_15872 ?auto_15868 ) ( not ( = ?auto_15869 ?auto_15872 ) ) ( SURFACE-AT ?auto_15860 ?auto_15868 ) ( ON ?auto_15860 ?auto_15863 ) ( CLEAR ?auto_15860 ) ( not ( = ?auto_15860 ?auto_15863 ) ) ( not ( = ?auto_15861 ?auto_15863 ) ) ( IS-CRATE ?auto_15861 ) ( not ( = ?auto_15860 ?auto_15864 ) ) ( not ( = ?auto_15861 ?auto_15864 ) ) ( not ( = ?auto_15863 ?auto_15864 ) ) ( not ( = ?auto_15867 ?auto_15870 ) ) ( not ( = ?auto_15868 ?auto_15867 ) ) ( HOIST-AT ?auto_15862 ?auto_15867 ) ( not ( = ?auto_15869 ?auto_15862 ) ) ( not ( = ?auto_15872 ?auto_15862 ) ) ( AVAILABLE ?auto_15862 ) ( SURFACE-AT ?auto_15861 ?auto_15867 ) ( ON ?auto_15861 ?auto_15866 ) ( CLEAR ?auto_15861 ) ( not ( = ?auto_15860 ?auto_15866 ) ) ( not ( = ?auto_15861 ?auto_15866 ) ) ( not ( = ?auto_15863 ?auto_15866 ) ) ( not ( = ?auto_15864 ?auto_15866 ) ) ( SURFACE-AT ?auto_15871 ?auto_15870 ) ( CLEAR ?auto_15871 ) ( IS-CRATE ?auto_15864 ) ( not ( = ?auto_15860 ?auto_15871 ) ) ( not ( = ?auto_15861 ?auto_15871 ) ) ( not ( = ?auto_15863 ?auto_15871 ) ) ( not ( = ?auto_15864 ?auto_15871 ) ) ( not ( = ?auto_15866 ?auto_15871 ) ) ( AVAILABLE ?auto_15869 ) ( TRUCK-AT ?auto_15865 ?auto_15868 ) ( LIFTING ?auto_15872 ?auto_15864 ) )
    :subtasks
    ( ( !LOAD ?auto_15872 ?auto_15864 ?auto_15865 ?auto_15868 )
      ( MAKE-ON ?auto_15860 ?auto_15861 )
      ( MAKE-ON-VERIFY ?auto_15860 ?auto_15861 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15873 - SURFACE
      ?auto_15874 - SURFACE
    )
    :vars
    (
      ?auto_15879 - HOIST
      ?auto_15875 - PLACE
      ?auto_15885 - PLACE
      ?auto_15876 - HOIST
      ?auto_15881 - SURFACE
      ?auto_15882 - SURFACE
      ?auto_15883 - PLACE
      ?auto_15880 - HOIST
      ?auto_15884 - SURFACE
      ?auto_15877 - SURFACE
      ?auto_15878 - TRUCK
      ?auto_15886 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15879 ?auto_15875 ) ( IS-CRATE ?auto_15873 ) ( not ( = ?auto_15873 ?auto_15874 ) ) ( not ( = ?auto_15885 ?auto_15875 ) ) ( HOIST-AT ?auto_15876 ?auto_15885 ) ( not ( = ?auto_15879 ?auto_15876 ) ) ( SURFACE-AT ?auto_15873 ?auto_15885 ) ( ON ?auto_15873 ?auto_15881 ) ( CLEAR ?auto_15873 ) ( not ( = ?auto_15873 ?auto_15881 ) ) ( not ( = ?auto_15874 ?auto_15881 ) ) ( IS-CRATE ?auto_15874 ) ( not ( = ?auto_15873 ?auto_15882 ) ) ( not ( = ?auto_15874 ?auto_15882 ) ) ( not ( = ?auto_15881 ?auto_15882 ) ) ( not ( = ?auto_15883 ?auto_15875 ) ) ( not ( = ?auto_15885 ?auto_15883 ) ) ( HOIST-AT ?auto_15880 ?auto_15883 ) ( not ( = ?auto_15879 ?auto_15880 ) ) ( not ( = ?auto_15876 ?auto_15880 ) ) ( AVAILABLE ?auto_15880 ) ( SURFACE-AT ?auto_15874 ?auto_15883 ) ( ON ?auto_15874 ?auto_15884 ) ( CLEAR ?auto_15874 ) ( not ( = ?auto_15873 ?auto_15884 ) ) ( not ( = ?auto_15874 ?auto_15884 ) ) ( not ( = ?auto_15881 ?auto_15884 ) ) ( not ( = ?auto_15882 ?auto_15884 ) ) ( SURFACE-AT ?auto_15877 ?auto_15875 ) ( CLEAR ?auto_15877 ) ( IS-CRATE ?auto_15882 ) ( not ( = ?auto_15873 ?auto_15877 ) ) ( not ( = ?auto_15874 ?auto_15877 ) ) ( not ( = ?auto_15881 ?auto_15877 ) ) ( not ( = ?auto_15882 ?auto_15877 ) ) ( not ( = ?auto_15884 ?auto_15877 ) ) ( AVAILABLE ?auto_15879 ) ( TRUCK-AT ?auto_15878 ?auto_15885 ) ( AVAILABLE ?auto_15876 ) ( SURFACE-AT ?auto_15882 ?auto_15885 ) ( ON ?auto_15882 ?auto_15886 ) ( CLEAR ?auto_15882 ) ( not ( = ?auto_15873 ?auto_15886 ) ) ( not ( = ?auto_15874 ?auto_15886 ) ) ( not ( = ?auto_15881 ?auto_15886 ) ) ( not ( = ?auto_15882 ?auto_15886 ) ) ( not ( = ?auto_15884 ?auto_15886 ) ) ( not ( = ?auto_15877 ?auto_15886 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15876 ?auto_15882 ?auto_15886 ?auto_15885 )
      ( MAKE-ON ?auto_15873 ?auto_15874 )
      ( MAKE-ON-VERIFY ?auto_15873 ?auto_15874 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15887 - SURFACE
      ?auto_15888 - SURFACE
    )
    :vars
    (
      ?auto_15889 - HOIST
      ?auto_15895 - PLACE
      ?auto_15894 - PLACE
      ?auto_15890 - HOIST
      ?auto_15892 - SURFACE
      ?auto_15891 - SURFACE
      ?auto_15896 - PLACE
      ?auto_15898 - HOIST
      ?auto_15900 - SURFACE
      ?auto_15893 - SURFACE
      ?auto_15899 - SURFACE
      ?auto_15897 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15889 ?auto_15895 ) ( IS-CRATE ?auto_15887 ) ( not ( = ?auto_15887 ?auto_15888 ) ) ( not ( = ?auto_15894 ?auto_15895 ) ) ( HOIST-AT ?auto_15890 ?auto_15894 ) ( not ( = ?auto_15889 ?auto_15890 ) ) ( SURFACE-AT ?auto_15887 ?auto_15894 ) ( ON ?auto_15887 ?auto_15892 ) ( CLEAR ?auto_15887 ) ( not ( = ?auto_15887 ?auto_15892 ) ) ( not ( = ?auto_15888 ?auto_15892 ) ) ( IS-CRATE ?auto_15888 ) ( not ( = ?auto_15887 ?auto_15891 ) ) ( not ( = ?auto_15888 ?auto_15891 ) ) ( not ( = ?auto_15892 ?auto_15891 ) ) ( not ( = ?auto_15896 ?auto_15895 ) ) ( not ( = ?auto_15894 ?auto_15896 ) ) ( HOIST-AT ?auto_15898 ?auto_15896 ) ( not ( = ?auto_15889 ?auto_15898 ) ) ( not ( = ?auto_15890 ?auto_15898 ) ) ( AVAILABLE ?auto_15898 ) ( SURFACE-AT ?auto_15888 ?auto_15896 ) ( ON ?auto_15888 ?auto_15900 ) ( CLEAR ?auto_15888 ) ( not ( = ?auto_15887 ?auto_15900 ) ) ( not ( = ?auto_15888 ?auto_15900 ) ) ( not ( = ?auto_15892 ?auto_15900 ) ) ( not ( = ?auto_15891 ?auto_15900 ) ) ( SURFACE-AT ?auto_15893 ?auto_15895 ) ( CLEAR ?auto_15893 ) ( IS-CRATE ?auto_15891 ) ( not ( = ?auto_15887 ?auto_15893 ) ) ( not ( = ?auto_15888 ?auto_15893 ) ) ( not ( = ?auto_15892 ?auto_15893 ) ) ( not ( = ?auto_15891 ?auto_15893 ) ) ( not ( = ?auto_15900 ?auto_15893 ) ) ( AVAILABLE ?auto_15889 ) ( AVAILABLE ?auto_15890 ) ( SURFACE-AT ?auto_15891 ?auto_15894 ) ( ON ?auto_15891 ?auto_15899 ) ( CLEAR ?auto_15891 ) ( not ( = ?auto_15887 ?auto_15899 ) ) ( not ( = ?auto_15888 ?auto_15899 ) ) ( not ( = ?auto_15892 ?auto_15899 ) ) ( not ( = ?auto_15891 ?auto_15899 ) ) ( not ( = ?auto_15900 ?auto_15899 ) ) ( not ( = ?auto_15893 ?auto_15899 ) ) ( TRUCK-AT ?auto_15897 ?auto_15895 ) )
    :subtasks
    ( ( !DRIVE ?auto_15897 ?auto_15895 ?auto_15894 )
      ( MAKE-ON ?auto_15887 ?auto_15888 )
      ( MAKE-ON-VERIFY ?auto_15887 ?auto_15888 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15901 - SURFACE
      ?auto_15902 - SURFACE
    )
    :vars
    (
      ?auto_15904 - HOIST
      ?auto_15914 - PLACE
      ?auto_15912 - PLACE
      ?auto_15907 - HOIST
      ?auto_15908 - SURFACE
      ?auto_15905 - SURFACE
      ?auto_15913 - PLACE
      ?auto_15910 - HOIST
      ?auto_15906 - SURFACE
      ?auto_15909 - SURFACE
      ?auto_15911 - SURFACE
      ?auto_15903 - TRUCK
      ?auto_15915 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15904 ?auto_15914 ) ( IS-CRATE ?auto_15901 ) ( not ( = ?auto_15901 ?auto_15902 ) ) ( not ( = ?auto_15912 ?auto_15914 ) ) ( HOIST-AT ?auto_15907 ?auto_15912 ) ( not ( = ?auto_15904 ?auto_15907 ) ) ( SURFACE-AT ?auto_15901 ?auto_15912 ) ( ON ?auto_15901 ?auto_15908 ) ( CLEAR ?auto_15901 ) ( not ( = ?auto_15901 ?auto_15908 ) ) ( not ( = ?auto_15902 ?auto_15908 ) ) ( IS-CRATE ?auto_15902 ) ( not ( = ?auto_15901 ?auto_15905 ) ) ( not ( = ?auto_15902 ?auto_15905 ) ) ( not ( = ?auto_15908 ?auto_15905 ) ) ( not ( = ?auto_15913 ?auto_15914 ) ) ( not ( = ?auto_15912 ?auto_15913 ) ) ( HOIST-AT ?auto_15910 ?auto_15913 ) ( not ( = ?auto_15904 ?auto_15910 ) ) ( not ( = ?auto_15907 ?auto_15910 ) ) ( AVAILABLE ?auto_15910 ) ( SURFACE-AT ?auto_15902 ?auto_15913 ) ( ON ?auto_15902 ?auto_15906 ) ( CLEAR ?auto_15902 ) ( not ( = ?auto_15901 ?auto_15906 ) ) ( not ( = ?auto_15902 ?auto_15906 ) ) ( not ( = ?auto_15908 ?auto_15906 ) ) ( not ( = ?auto_15905 ?auto_15906 ) ) ( IS-CRATE ?auto_15905 ) ( not ( = ?auto_15901 ?auto_15909 ) ) ( not ( = ?auto_15902 ?auto_15909 ) ) ( not ( = ?auto_15908 ?auto_15909 ) ) ( not ( = ?auto_15905 ?auto_15909 ) ) ( not ( = ?auto_15906 ?auto_15909 ) ) ( AVAILABLE ?auto_15907 ) ( SURFACE-AT ?auto_15905 ?auto_15912 ) ( ON ?auto_15905 ?auto_15911 ) ( CLEAR ?auto_15905 ) ( not ( = ?auto_15901 ?auto_15911 ) ) ( not ( = ?auto_15902 ?auto_15911 ) ) ( not ( = ?auto_15908 ?auto_15911 ) ) ( not ( = ?auto_15905 ?auto_15911 ) ) ( not ( = ?auto_15906 ?auto_15911 ) ) ( not ( = ?auto_15909 ?auto_15911 ) ) ( TRUCK-AT ?auto_15903 ?auto_15914 ) ( SURFACE-AT ?auto_15915 ?auto_15914 ) ( CLEAR ?auto_15915 ) ( LIFTING ?auto_15904 ?auto_15909 ) ( IS-CRATE ?auto_15909 ) ( not ( = ?auto_15901 ?auto_15915 ) ) ( not ( = ?auto_15902 ?auto_15915 ) ) ( not ( = ?auto_15908 ?auto_15915 ) ) ( not ( = ?auto_15905 ?auto_15915 ) ) ( not ( = ?auto_15906 ?auto_15915 ) ) ( not ( = ?auto_15909 ?auto_15915 ) ) ( not ( = ?auto_15911 ?auto_15915 ) ) )
    :subtasks
    ( ( !DROP ?auto_15904 ?auto_15909 ?auto_15915 ?auto_15914 )
      ( MAKE-ON ?auto_15901 ?auto_15902 )
      ( MAKE-ON-VERIFY ?auto_15901 ?auto_15902 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15916 - SURFACE
      ?auto_15917 - SURFACE
    )
    :vars
    (
      ?auto_15930 - HOIST
      ?auto_15923 - PLACE
      ?auto_15927 - PLACE
      ?auto_15920 - HOIST
      ?auto_15919 - SURFACE
      ?auto_15928 - SURFACE
      ?auto_15924 - PLACE
      ?auto_15926 - HOIST
      ?auto_15918 - SURFACE
      ?auto_15921 - SURFACE
      ?auto_15925 - SURFACE
      ?auto_15929 - TRUCK
      ?auto_15922 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15930 ?auto_15923 ) ( IS-CRATE ?auto_15916 ) ( not ( = ?auto_15916 ?auto_15917 ) ) ( not ( = ?auto_15927 ?auto_15923 ) ) ( HOIST-AT ?auto_15920 ?auto_15927 ) ( not ( = ?auto_15930 ?auto_15920 ) ) ( SURFACE-AT ?auto_15916 ?auto_15927 ) ( ON ?auto_15916 ?auto_15919 ) ( CLEAR ?auto_15916 ) ( not ( = ?auto_15916 ?auto_15919 ) ) ( not ( = ?auto_15917 ?auto_15919 ) ) ( IS-CRATE ?auto_15917 ) ( not ( = ?auto_15916 ?auto_15928 ) ) ( not ( = ?auto_15917 ?auto_15928 ) ) ( not ( = ?auto_15919 ?auto_15928 ) ) ( not ( = ?auto_15924 ?auto_15923 ) ) ( not ( = ?auto_15927 ?auto_15924 ) ) ( HOIST-AT ?auto_15926 ?auto_15924 ) ( not ( = ?auto_15930 ?auto_15926 ) ) ( not ( = ?auto_15920 ?auto_15926 ) ) ( AVAILABLE ?auto_15926 ) ( SURFACE-AT ?auto_15917 ?auto_15924 ) ( ON ?auto_15917 ?auto_15918 ) ( CLEAR ?auto_15917 ) ( not ( = ?auto_15916 ?auto_15918 ) ) ( not ( = ?auto_15917 ?auto_15918 ) ) ( not ( = ?auto_15919 ?auto_15918 ) ) ( not ( = ?auto_15928 ?auto_15918 ) ) ( IS-CRATE ?auto_15928 ) ( not ( = ?auto_15916 ?auto_15921 ) ) ( not ( = ?auto_15917 ?auto_15921 ) ) ( not ( = ?auto_15919 ?auto_15921 ) ) ( not ( = ?auto_15928 ?auto_15921 ) ) ( not ( = ?auto_15918 ?auto_15921 ) ) ( AVAILABLE ?auto_15920 ) ( SURFACE-AT ?auto_15928 ?auto_15927 ) ( ON ?auto_15928 ?auto_15925 ) ( CLEAR ?auto_15928 ) ( not ( = ?auto_15916 ?auto_15925 ) ) ( not ( = ?auto_15917 ?auto_15925 ) ) ( not ( = ?auto_15919 ?auto_15925 ) ) ( not ( = ?auto_15928 ?auto_15925 ) ) ( not ( = ?auto_15918 ?auto_15925 ) ) ( not ( = ?auto_15921 ?auto_15925 ) ) ( TRUCK-AT ?auto_15929 ?auto_15923 ) ( SURFACE-AT ?auto_15922 ?auto_15923 ) ( CLEAR ?auto_15922 ) ( IS-CRATE ?auto_15921 ) ( not ( = ?auto_15916 ?auto_15922 ) ) ( not ( = ?auto_15917 ?auto_15922 ) ) ( not ( = ?auto_15919 ?auto_15922 ) ) ( not ( = ?auto_15928 ?auto_15922 ) ) ( not ( = ?auto_15918 ?auto_15922 ) ) ( not ( = ?auto_15921 ?auto_15922 ) ) ( not ( = ?auto_15925 ?auto_15922 ) ) ( AVAILABLE ?auto_15930 ) ( IN ?auto_15921 ?auto_15929 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15930 ?auto_15921 ?auto_15929 ?auto_15923 )
      ( MAKE-ON ?auto_15916 ?auto_15917 )
      ( MAKE-ON-VERIFY ?auto_15916 ?auto_15917 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15931 - SURFACE
      ?auto_15932 - SURFACE
    )
    :vars
    (
      ?auto_15941 - HOIST
      ?auto_15938 - PLACE
      ?auto_15940 - PLACE
      ?auto_15937 - HOIST
      ?auto_15943 - SURFACE
      ?auto_15942 - SURFACE
      ?auto_15939 - PLACE
      ?auto_15933 - HOIST
      ?auto_15936 - SURFACE
      ?auto_15935 - SURFACE
      ?auto_15934 - SURFACE
      ?auto_15944 - SURFACE
      ?auto_15945 - TRUCK
      ?auto_15946 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15941 ?auto_15938 ) ( IS-CRATE ?auto_15931 ) ( not ( = ?auto_15931 ?auto_15932 ) ) ( not ( = ?auto_15940 ?auto_15938 ) ) ( HOIST-AT ?auto_15937 ?auto_15940 ) ( not ( = ?auto_15941 ?auto_15937 ) ) ( SURFACE-AT ?auto_15931 ?auto_15940 ) ( ON ?auto_15931 ?auto_15943 ) ( CLEAR ?auto_15931 ) ( not ( = ?auto_15931 ?auto_15943 ) ) ( not ( = ?auto_15932 ?auto_15943 ) ) ( IS-CRATE ?auto_15932 ) ( not ( = ?auto_15931 ?auto_15942 ) ) ( not ( = ?auto_15932 ?auto_15942 ) ) ( not ( = ?auto_15943 ?auto_15942 ) ) ( not ( = ?auto_15939 ?auto_15938 ) ) ( not ( = ?auto_15940 ?auto_15939 ) ) ( HOIST-AT ?auto_15933 ?auto_15939 ) ( not ( = ?auto_15941 ?auto_15933 ) ) ( not ( = ?auto_15937 ?auto_15933 ) ) ( AVAILABLE ?auto_15933 ) ( SURFACE-AT ?auto_15932 ?auto_15939 ) ( ON ?auto_15932 ?auto_15936 ) ( CLEAR ?auto_15932 ) ( not ( = ?auto_15931 ?auto_15936 ) ) ( not ( = ?auto_15932 ?auto_15936 ) ) ( not ( = ?auto_15943 ?auto_15936 ) ) ( not ( = ?auto_15942 ?auto_15936 ) ) ( IS-CRATE ?auto_15942 ) ( not ( = ?auto_15931 ?auto_15935 ) ) ( not ( = ?auto_15932 ?auto_15935 ) ) ( not ( = ?auto_15943 ?auto_15935 ) ) ( not ( = ?auto_15942 ?auto_15935 ) ) ( not ( = ?auto_15936 ?auto_15935 ) ) ( AVAILABLE ?auto_15937 ) ( SURFACE-AT ?auto_15942 ?auto_15940 ) ( ON ?auto_15942 ?auto_15934 ) ( CLEAR ?auto_15942 ) ( not ( = ?auto_15931 ?auto_15934 ) ) ( not ( = ?auto_15932 ?auto_15934 ) ) ( not ( = ?auto_15943 ?auto_15934 ) ) ( not ( = ?auto_15942 ?auto_15934 ) ) ( not ( = ?auto_15936 ?auto_15934 ) ) ( not ( = ?auto_15935 ?auto_15934 ) ) ( SURFACE-AT ?auto_15944 ?auto_15938 ) ( CLEAR ?auto_15944 ) ( IS-CRATE ?auto_15935 ) ( not ( = ?auto_15931 ?auto_15944 ) ) ( not ( = ?auto_15932 ?auto_15944 ) ) ( not ( = ?auto_15943 ?auto_15944 ) ) ( not ( = ?auto_15942 ?auto_15944 ) ) ( not ( = ?auto_15936 ?auto_15944 ) ) ( not ( = ?auto_15935 ?auto_15944 ) ) ( not ( = ?auto_15934 ?auto_15944 ) ) ( AVAILABLE ?auto_15941 ) ( IN ?auto_15935 ?auto_15945 ) ( TRUCK-AT ?auto_15945 ?auto_15946 ) ( not ( = ?auto_15946 ?auto_15938 ) ) ( not ( = ?auto_15940 ?auto_15946 ) ) ( not ( = ?auto_15939 ?auto_15946 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15945 ?auto_15946 ?auto_15938 )
      ( MAKE-ON ?auto_15931 ?auto_15932 )
      ( MAKE-ON-VERIFY ?auto_15931 ?auto_15932 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15947 - SURFACE
      ?auto_15948 - SURFACE
    )
    :vars
    (
      ?auto_15961 - HOIST
      ?auto_15955 - PLACE
      ?auto_15952 - PLACE
      ?auto_15960 - HOIST
      ?auto_15957 - SURFACE
      ?auto_15954 - SURFACE
      ?auto_15950 - PLACE
      ?auto_15959 - HOIST
      ?auto_15958 - SURFACE
      ?auto_15956 - SURFACE
      ?auto_15951 - SURFACE
      ?auto_15949 - SURFACE
      ?auto_15953 - TRUCK
      ?auto_15962 - PLACE
      ?auto_15963 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15961 ?auto_15955 ) ( IS-CRATE ?auto_15947 ) ( not ( = ?auto_15947 ?auto_15948 ) ) ( not ( = ?auto_15952 ?auto_15955 ) ) ( HOIST-AT ?auto_15960 ?auto_15952 ) ( not ( = ?auto_15961 ?auto_15960 ) ) ( SURFACE-AT ?auto_15947 ?auto_15952 ) ( ON ?auto_15947 ?auto_15957 ) ( CLEAR ?auto_15947 ) ( not ( = ?auto_15947 ?auto_15957 ) ) ( not ( = ?auto_15948 ?auto_15957 ) ) ( IS-CRATE ?auto_15948 ) ( not ( = ?auto_15947 ?auto_15954 ) ) ( not ( = ?auto_15948 ?auto_15954 ) ) ( not ( = ?auto_15957 ?auto_15954 ) ) ( not ( = ?auto_15950 ?auto_15955 ) ) ( not ( = ?auto_15952 ?auto_15950 ) ) ( HOIST-AT ?auto_15959 ?auto_15950 ) ( not ( = ?auto_15961 ?auto_15959 ) ) ( not ( = ?auto_15960 ?auto_15959 ) ) ( AVAILABLE ?auto_15959 ) ( SURFACE-AT ?auto_15948 ?auto_15950 ) ( ON ?auto_15948 ?auto_15958 ) ( CLEAR ?auto_15948 ) ( not ( = ?auto_15947 ?auto_15958 ) ) ( not ( = ?auto_15948 ?auto_15958 ) ) ( not ( = ?auto_15957 ?auto_15958 ) ) ( not ( = ?auto_15954 ?auto_15958 ) ) ( IS-CRATE ?auto_15954 ) ( not ( = ?auto_15947 ?auto_15956 ) ) ( not ( = ?auto_15948 ?auto_15956 ) ) ( not ( = ?auto_15957 ?auto_15956 ) ) ( not ( = ?auto_15954 ?auto_15956 ) ) ( not ( = ?auto_15958 ?auto_15956 ) ) ( AVAILABLE ?auto_15960 ) ( SURFACE-AT ?auto_15954 ?auto_15952 ) ( ON ?auto_15954 ?auto_15951 ) ( CLEAR ?auto_15954 ) ( not ( = ?auto_15947 ?auto_15951 ) ) ( not ( = ?auto_15948 ?auto_15951 ) ) ( not ( = ?auto_15957 ?auto_15951 ) ) ( not ( = ?auto_15954 ?auto_15951 ) ) ( not ( = ?auto_15958 ?auto_15951 ) ) ( not ( = ?auto_15956 ?auto_15951 ) ) ( SURFACE-AT ?auto_15949 ?auto_15955 ) ( CLEAR ?auto_15949 ) ( IS-CRATE ?auto_15956 ) ( not ( = ?auto_15947 ?auto_15949 ) ) ( not ( = ?auto_15948 ?auto_15949 ) ) ( not ( = ?auto_15957 ?auto_15949 ) ) ( not ( = ?auto_15954 ?auto_15949 ) ) ( not ( = ?auto_15958 ?auto_15949 ) ) ( not ( = ?auto_15956 ?auto_15949 ) ) ( not ( = ?auto_15951 ?auto_15949 ) ) ( AVAILABLE ?auto_15961 ) ( TRUCK-AT ?auto_15953 ?auto_15962 ) ( not ( = ?auto_15962 ?auto_15955 ) ) ( not ( = ?auto_15952 ?auto_15962 ) ) ( not ( = ?auto_15950 ?auto_15962 ) ) ( HOIST-AT ?auto_15963 ?auto_15962 ) ( LIFTING ?auto_15963 ?auto_15956 ) ( not ( = ?auto_15961 ?auto_15963 ) ) ( not ( = ?auto_15960 ?auto_15963 ) ) ( not ( = ?auto_15959 ?auto_15963 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15963 ?auto_15956 ?auto_15953 ?auto_15962 )
      ( MAKE-ON ?auto_15947 ?auto_15948 )
      ( MAKE-ON-VERIFY ?auto_15947 ?auto_15948 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15964 - SURFACE
      ?auto_15965 - SURFACE
    )
    :vars
    (
      ?auto_15976 - HOIST
      ?auto_15977 - PLACE
      ?auto_15968 - PLACE
      ?auto_15971 - HOIST
      ?auto_15967 - SURFACE
      ?auto_15980 - SURFACE
      ?auto_15975 - PLACE
      ?auto_15974 - HOIST
      ?auto_15970 - SURFACE
      ?auto_15979 - SURFACE
      ?auto_15978 - SURFACE
      ?auto_15972 - SURFACE
      ?auto_15969 - TRUCK
      ?auto_15966 - PLACE
      ?auto_15973 - HOIST
      ?auto_15981 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15976 ?auto_15977 ) ( IS-CRATE ?auto_15964 ) ( not ( = ?auto_15964 ?auto_15965 ) ) ( not ( = ?auto_15968 ?auto_15977 ) ) ( HOIST-AT ?auto_15971 ?auto_15968 ) ( not ( = ?auto_15976 ?auto_15971 ) ) ( SURFACE-AT ?auto_15964 ?auto_15968 ) ( ON ?auto_15964 ?auto_15967 ) ( CLEAR ?auto_15964 ) ( not ( = ?auto_15964 ?auto_15967 ) ) ( not ( = ?auto_15965 ?auto_15967 ) ) ( IS-CRATE ?auto_15965 ) ( not ( = ?auto_15964 ?auto_15980 ) ) ( not ( = ?auto_15965 ?auto_15980 ) ) ( not ( = ?auto_15967 ?auto_15980 ) ) ( not ( = ?auto_15975 ?auto_15977 ) ) ( not ( = ?auto_15968 ?auto_15975 ) ) ( HOIST-AT ?auto_15974 ?auto_15975 ) ( not ( = ?auto_15976 ?auto_15974 ) ) ( not ( = ?auto_15971 ?auto_15974 ) ) ( AVAILABLE ?auto_15974 ) ( SURFACE-AT ?auto_15965 ?auto_15975 ) ( ON ?auto_15965 ?auto_15970 ) ( CLEAR ?auto_15965 ) ( not ( = ?auto_15964 ?auto_15970 ) ) ( not ( = ?auto_15965 ?auto_15970 ) ) ( not ( = ?auto_15967 ?auto_15970 ) ) ( not ( = ?auto_15980 ?auto_15970 ) ) ( IS-CRATE ?auto_15980 ) ( not ( = ?auto_15964 ?auto_15979 ) ) ( not ( = ?auto_15965 ?auto_15979 ) ) ( not ( = ?auto_15967 ?auto_15979 ) ) ( not ( = ?auto_15980 ?auto_15979 ) ) ( not ( = ?auto_15970 ?auto_15979 ) ) ( AVAILABLE ?auto_15971 ) ( SURFACE-AT ?auto_15980 ?auto_15968 ) ( ON ?auto_15980 ?auto_15978 ) ( CLEAR ?auto_15980 ) ( not ( = ?auto_15964 ?auto_15978 ) ) ( not ( = ?auto_15965 ?auto_15978 ) ) ( not ( = ?auto_15967 ?auto_15978 ) ) ( not ( = ?auto_15980 ?auto_15978 ) ) ( not ( = ?auto_15970 ?auto_15978 ) ) ( not ( = ?auto_15979 ?auto_15978 ) ) ( SURFACE-AT ?auto_15972 ?auto_15977 ) ( CLEAR ?auto_15972 ) ( IS-CRATE ?auto_15979 ) ( not ( = ?auto_15964 ?auto_15972 ) ) ( not ( = ?auto_15965 ?auto_15972 ) ) ( not ( = ?auto_15967 ?auto_15972 ) ) ( not ( = ?auto_15980 ?auto_15972 ) ) ( not ( = ?auto_15970 ?auto_15972 ) ) ( not ( = ?auto_15979 ?auto_15972 ) ) ( not ( = ?auto_15978 ?auto_15972 ) ) ( AVAILABLE ?auto_15976 ) ( TRUCK-AT ?auto_15969 ?auto_15966 ) ( not ( = ?auto_15966 ?auto_15977 ) ) ( not ( = ?auto_15968 ?auto_15966 ) ) ( not ( = ?auto_15975 ?auto_15966 ) ) ( HOIST-AT ?auto_15973 ?auto_15966 ) ( not ( = ?auto_15976 ?auto_15973 ) ) ( not ( = ?auto_15971 ?auto_15973 ) ) ( not ( = ?auto_15974 ?auto_15973 ) ) ( AVAILABLE ?auto_15973 ) ( SURFACE-AT ?auto_15979 ?auto_15966 ) ( ON ?auto_15979 ?auto_15981 ) ( CLEAR ?auto_15979 ) ( not ( = ?auto_15964 ?auto_15981 ) ) ( not ( = ?auto_15965 ?auto_15981 ) ) ( not ( = ?auto_15967 ?auto_15981 ) ) ( not ( = ?auto_15980 ?auto_15981 ) ) ( not ( = ?auto_15970 ?auto_15981 ) ) ( not ( = ?auto_15979 ?auto_15981 ) ) ( not ( = ?auto_15978 ?auto_15981 ) ) ( not ( = ?auto_15972 ?auto_15981 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15973 ?auto_15979 ?auto_15981 ?auto_15966 )
      ( MAKE-ON ?auto_15964 ?auto_15965 )
      ( MAKE-ON-VERIFY ?auto_15964 ?auto_15965 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15982 - SURFACE
      ?auto_15983 - SURFACE
    )
    :vars
    (
      ?auto_15991 - HOIST
      ?auto_15988 - PLACE
      ?auto_15993 - PLACE
      ?auto_15994 - HOIST
      ?auto_15986 - SURFACE
      ?auto_15996 - SURFACE
      ?auto_15992 - PLACE
      ?auto_15984 - HOIST
      ?auto_15985 - SURFACE
      ?auto_15990 - SURFACE
      ?auto_15989 - SURFACE
      ?auto_15995 - SURFACE
      ?auto_15999 - PLACE
      ?auto_15997 - HOIST
      ?auto_15987 - SURFACE
      ?auto_15998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15991 ?auto_15988 ) ( IS-CRATE ?auto_15982 ) ( not ( = ?auto_15982 ?auto_15983 ) ) ( not ( = ?auto_15993 ?auto_15988 ) ) ( HOIST-AT ?auto_15994 ?auto_15993 ) ( not ( = ?auto_15991 ?auto_15994 ) ) ( SURFACE-AT ?auto_15982 ?auto_15993 ) ( ON ?auto_15982 ?auto_15986 ) ( CLEAR ?auto_15982 ) ( not ( = ?auto_15982 ?auto_15986 ) ) ( not ( = ?auto_15983 ?auto_15986 ) ) ( IS-CRATE ?auto_15983 ) ( not ( = ?auto_15982 ?auto_15996 ) ) ( not ( = ?auto_15983 ?auto_15996 ) ) ( not ( = ?auto_15986 ?auto_15996 ) ) ( not ( = ?auto_15992 ?auto_15988 ) ) ( not ( = ?auto_15993 ?auto_15992 ) ) ( HOIST-AT ?auto_15984 ?auto_15992 ) ( not ( = ?auto_15991 ?auto_15984 ) ) ( not ( = ?auto_15994 ?auto_15984 ) ) ( AVAILABLE ?auto_15984 ) ( SURFACE-AT ?auto_15983 ?auto_15992 ) ( ON ?auto_15983 ?auto_15985 ) ( CLEAR ?auto_15983 ) ( not ( = ?auto_15982 ?auto_15985 ) ) ( not ( = ?auto_15983 ?auto_15985 ) ) ( not ( = ?auto_15986 ?auto_15985 ) ) ( not ( = ?auto_15996 ?auto_15985 ) ) ( IS-CRATE ?auto_15996 ) ( not ( = ?auto_15982 ?auto_15990 ) ) ( not ( = ?auto_15983 ?auto_15990 ) ) ( not ( = ?auto_15986 ?auto_15990 ) ) ( not ( = ?auto_15996 ?auto_15990 ) ) ( not ( = ?auto_15985 ?auto_15990 ) ) ( AVAILABLE ?auto_15994 ) ( SURFACE-AT ?auto_15996 ?auto_15993 ) ( ON ?auto_15996 ?auto_15989 ) ( CLEAR ?auto_15996 ) ( not ( = ?auto_15982 ?auto_15989 ) ) ( not ( = ?auto_15983 ?auto_15989 ) ) ( not ( = ?auto_15986 ?auto_15989 ) ) ( not ( = ?auto_15996 ?auto_15989 ) ) ( not ( = ?auto_15985 ?auto_15989 ) ) ( not ( = ?auto_15990 ?auto_15989 ) ) ( SURFACE-AT ?auto_15995 ?auto_15988 ) ( CLEAR ?auto_15995 ) ( IS-CRATE ?auto_15990 ) ( not ( = ?auto_15982 ?auto_15995 ) ) ( not ( = ?auto_15983 ?auto_15995 ) ) ( not ( = ?auto_15986 ?auto_15995 ) ) ( not ( = ?auto_15996 ?auto_15995 ) ) ( not ( = ?auto_15985 ?auto_15995 ) ) ( not ( = ?auto_15990 ?auto_15995 ) ) ( not ( = ?auto_15989 ?auto_15995 ) ) ( AVAILABLE ?auto_15991 ) ( not ( = ?auto_15999 ?auto_15988 ) ) ( not ( = ?auto_15993 ?auto_15999 ) ) ( not ( = ?auto_15992 ?auto_15999 ) ) ( HOIST-AT ?auto_15997 ?auto_15999 ) ( not ( = ?auto_15991 ?auto_15997 ) ) ( not ( = ?auto_15994 ?auto_15997 ) ) ( not ( = ?auto_15984 ?auto_15997 ) ) ( AVAILABLE ?auto_15997 ) ( SURFACE-AT ?auto_15990 ?auto_15999 ) ( ON ?auto_15990 ?auto_15987 ) ( CLEAR ?auto_15990 ) ( not ( = ?auto_15982 ?auto_15987 ) ) ( not ( = ?auto_15983 ?auto_15987 ) ) ( not ( = ?auto_15986 ?auto_15987 ) ) ( not ( = ?auto_15996 ?auto_15987 ) ) ( not ( = ?auto_15985 ?auto_15987 ) ) ( not ( = ?auto_15990 ?auto_15987 ) ) ( not ( = ?auto_15989 ?auto_15987 ) ) ( not ( = ?auto_15995 ?auto_15987 ) ) ( TRUCK-AT ?auto_15998 ?auto_15988 ) )
    :subtasks
    ( ( !DRIVE ?auto_15998 ?auto_15988 ?auto_15999 )
      ( MAKE-ON ?auto_15982 ?auto_15983 )
      ( MAKE-ON-VERIFY ?auto_15982 ?auto_15983 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16000 - SURFACE
      ?auto_16001 - SURFACE
    )
    :vars
    (
      ?auto_16014 - HOIST
      ?auto_16002 - PLACE
      ?auto_16003 - PLACE
      ?auto_16008 - HOIST
      ?auto_16009 - SURFACE
      ?auto_16016 - SURFACE
      ?auto_16012 - PLACE
      ?auto_16010 - HOIST
      ?auto_16005 - SURFACE
      ?auto_16011 - SURFACE
      ?auto_16013 - SURFACE
      ?auto_16015 - SURFACE
      ?auto_16006 - PLACE
      ?auto_16004 - HOIST
      ?auto_16017 - SURFACE
      ?auto_16007 - TRUCK
      ?auto_16018 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16014 ?auto_16002 ) ( IS-CRATE ?auto_16000 ) ( not ( = ?auto_16000 ?auto_16001 ) ) ( not ( = ?auto_16003 ?auto_16002 ) ) ( HOIST-AT ?auto_16008 ?auto_16003 ) ( not ( = ?auto_16014 ?auto_16008 ) ) ( SURFACE-AT ?auto_16000 ?auto_16003 ) ( ON ?auto_16000 ?auto_16009 ) ( CLEAR ?auto_16000 ) ( not ( = ?auto_16000 ?auto_16009 ) ) ( not ( = ?auto_16001 ?auto_16009 ) ) ( IS-CRATE ?auto_16001 ) ( not ( = ?auto_16000 ?auto_16016 ) ) ( not ( = ?auto_16001 ?auto_16016 ) ) ( not ( = ?auto_16009 ?auto_16016 ) ) ( not ( = ?auto_16012 ?auto_16002 ) ) ( not ( = ?auto_16003 ?auto_16012 ) ) ( HOIST-AT ?auto_16010 ?auto_16012 ) ( not ( = ?auto_16014 ?auto_16010 ) ) ( not ( = ?auto_16008 ?auto_16010 ) ) ( AVAILABLE ?auto_16010 ) ( SURFACE-AT ?auto_16001 ?auto_16012 ) ( ON ?auto_16001 ?auto_16005 ) ( CLEAR ?auto_16001 ) ( not ( = ?auto_16000 ?auto_16005 ) ) ( not ( = ?auto_16001 ?auto_16005 ) ) ( not ( = ?auto_16009 ?auto_16005 ) ) ( not ( = ?auto_16016 ?auto_16005 ) ) ( IS-CRATE ?auto_16016 ) ( not ( = ?auto_16000 ?auto_16011 ) ) ( not ( = ?auto_16001 ?auto_16011 ) ) ( not ( = ?auto_16009 ?auto_16011 ) ) ( not ( = ?auto_16016 ?auto_16011 ) ) ( not ( = ?auto_16005 ?auto_16011 ) ) ( AVAILABLE ?auto_16008 ) ( SURFACE-AT ?auto_16016 ?auto_16003 ) ( ON ?auto_16016 ?auto_16013 ) ( CLEAR ?auto_16016 ) ( not ( = ?auto_16000 ?auto_16013 ) ) ( not ( = ?auto_16001 ?auto_16013 ) ) ( not ( = ?auto_16009 ?auto_16013 ) ) ( not ( = ?auto_16016 ?auto_16013 ) ) ( not ( = ?auto_16005 ?auto_16013 ) ) ( not ( = ?auto_16011 ?auto_16013 ) ) ( IS-CRATE ?auto_16011 ) ( not ( = ?auto_16000 ?auto_16015 ) ) ( not ( = ?auto_16001 ?auto_16015 ) ) ( not ( = ?auto_16009 ?auto_16015 ) ) ( not ( = ?auto_16016 ?auto_16015 ) ) ( not ( = ?auto_16005 ?auto_16015 ) ) ( not ( = ?auto_16011 ?auto_16015 ) ) ( not ( = ?auto_16013 ?auto_16015 ) ) ( not ( = ?auto_16006 ?auto_16002 ) ) ( not ( = ?auto_16003 ?auto_16006 ) ) ( not ( = ?auto_16012 ?auto_16006 ) ) ( HOIST-AT ?auto_16004 ?auto_16006 ) ( not ( = ?auto_16014 ?auto_16004 ) ) ( not ( = ?auto_16008 ?auto_16004 ) ) ( not ( = ?auto_16010 ?auto_16004 ) ) ( AVAILABLE ?auto_16004 ) ( SURFACE-AT ?auto_16011 ?auto_16006 ) ( ON ?auto_16011 ?auto_16017 ) ( CLEAR ?auto_16011 ) ( not ( = ?auto_16000 ?auto_16017 ) ) ( not ( = ?auto_16001 ?auto_16017 ) ) ( not ( = ?auto_16009 ?auto_16017 ) ) ( not ( = ?auto_16016 ?auto_16017 ) ) ( not ( = ?auto_16005 ?auto_16017 ) ) ( not ( = ?auto_16011 ?auto_16017 ) ) ( not ( = ?auto_16013 ?auto_16017 ) ) ( not ( = ?auto_16015 ?auto_16017 ) ) ( TRUCK-AT ?auto_16007 ?auto_16002 ) ( SURFACE-AT ?auto_16018 ?auto_16002 ) ( CLEAR ?auto_16018 ) ( LIFTING ?auto_16014 ?auto_16015 ) ( IS-CRATE ?auto_16015 ) ( not ( = ?auto_16000 ?auto_16018 ) ) ( not ( = ?auto_16001 ?auto_16018 ) ) ( not ( = ?auto_16009 ?auto_16018 ) ) ( not ( = ?auto_16016 ?auto_16018 ) ) ( not ( = ?auto_16005 ?auto_16018 ) ) ( not ( = ?auto_16011 ?auto_16018 ) ) ( not ( = ?auto_16013 ?auto_16018 ) ) ( not ( = ?auto_16015 ?auto_16018 ) ) ( not ( = ?auto_16017 ?auto_16018 ) ) )
    :subtasks
    ( ( !DROP ?auto_16014 ?auto_16015 ?auto_16018 ?auto_16002 )
      ( MAKE-ON ?auto_16000 ?auto_16001 )
      ( MAKE-ON-VERIFY ?auto_16000 ?auto_16001 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16019 - SURFACE
      ?auto_16020 - SURFACE
    )
    :vars
    (
      ?auto_16033 - HOIST
      ?auto_16028 - PLACE
      ?auto_16024 - PLACE
      ?auto_16023 - HOIST
      ?auto_16021 - SURFACE
      ?auto_16031 - SURFACE
      ?auto_16035 - PLACE
      ?auto_16027 - HOIST
      ?auto_16026 - SURFACE
      ?auto_16032 - SURFACE
      ?auto_16022 - SURFACE
      ?auto_16036 - SURFACE
      ?auto_16030 - PLACE
      ?auto_16025 - HOIST
      ?auto_16037 - SURFACE
      ?auto_16034 - TRUCK
      ?auto_16029 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16033 ?auto_16028 ) ( IS-CRATE ?auto_16019 ) ( not ( = ?auto_16019 ?auto_16020 ) ) ( not ( = ?auto_16024 ?auto_16028 ) ) ( HOIST-AT ?auto_16023 ?auto_16024 ) ( not ( = ?auto_16033 ?auto_16023 ) ) ( SURFACE-AT ?auto_16019 ?auto_16024 ) ( ON ?auto_16019 ?auto_16021 ) ( CLEAR ?auto_16019 ) ( not ( = ?auto_16019 ?auto_16021 ) ) ( not ( = ?auto_16020 ?auto_16021 ) ) ( IS-CRATE ?auto_16020 ) ( not ( = ?auto_16019 ?auto_16031 ) ) ( not ( = ?auto_16020 ?auto_16031 ) ) ( not ( = ?auto_16021 ?auto_16031 ) ) ( not ( = ?auto_16035 ?auto_16028 ) ) ( not ( = ?auto_16024 ?auto_16035 ) ) ( HOIST-AT ?auto_16027 ?auto_16035 ) ( not ( = ?auto_16033 ?auto_16027 ) ) ( not ( = ?auto_16023 ?auto_16027 ) ) ( AVAILABLE ?auto_16027 ) ( SURFACE-AT ?auto_16020 ?auto_16035 ) ( ON ?auto_16020 ?auto_16026 ) ( CLEAR ?auto_16020 ) ( not ( = ?auto_16019 ?auto_16026 ) ) ( not ( = ?auto_16020 ?auto_16026 ) ) ( not ( = ?auto_16021 ?auto_16026 ) ) ( not ( = ?auto_16031 ?auto_16026 ) ) ( IS-CRATE ?auto_16031 ) ( not ( = ?auto_16019 ?auto_16032 ) ) ( not ( = ?auto_16020 ?auto_16032 ) ) ( not ( = ?auto_16021 ?auto_16032 ) ) ( not ( = ?auto_16031 ?auto_16032 ) ) ( not ( = ?auto_16026 ?auto_16032 ) ) ( AVAILABLE ?auto_16023 ) ( SURFACE-AT ?auto_16031 ?auto_16024 ) ( ON ?auto_16031 ?auto_16022 ) ( CLEAR ?auto_16031 ) ( not ( = ?auto_16019 ?auto_16022 ) ) ( not ( = ?auto_16020 ?auto_16022 ) ) ( not ( = ?auto_16021 ?auto_16022 ) ) ( not ( = ?auto_16031 ?auto_16022 ) ) ( not ( = ?auto_16026 ?auto_16022 ) ) ( not ( = ?auto_16032 ?auto_16022 ) ) ( IS-CRATE ?auto_16032 ) ( not ( = ?auto_16019 ?auto_16036 ) ) ( not ( = ?auto_16020 ?auto_16036 ) ) ( not ( = ?auto_16021 ?auto_16036 ) ) ( not ( = ?auto_16031 ?auto_16036 ) ) ( not ( = ?auto_16026 ?auto_16036 ) ) ( not ( = ?auto_16032 ?auto_16036 ) ) ( not ( = ?auto_16022 ?auto_16036 ) ) ( not ( = ?auto_16030 ?auto_16028 ) ) ( not ( = ?auto_16024 ?auto_16030 ) ) ( not ( = ?auto_16035 ?auto_16030 ) ) ( HOIST-AT ?auto_16025 ?auto_16030 ) ( not ( = ?auto_16033 ?auto_16025 ) ) ( not ( = ?auto_16023 ?auto_16025 ) ) ( not ( = ?auto_16027 ?auto_16025 ) ) ( AVAILABLE ?auto_16025 ) ( SURFACE-AT ?auto_16032 ?auto_16030 ) ( ON ?auto_16032 ?auto_16037 ) ( CLEAR ?auto_16032 ) ( not ( = ?auto_16019 ?auto_16037 ) ) ( not ( = ?auto_16020 ?auto_16037 ) ) ( not ( = ?auto_16021 ?auto_16037 ) ) ( not ( = ?auto_16031 ?auto_16037 ) ) ( not ( = ?auto_16026 ?auto_16037 ) ) ( not ( = ?auto_16032 ?auto_16037 ) ) ( not ( = ?auto_16022 ?auto_16037 ) ) ( not ( = ?auto_16036 ?auto_16037 ) ) ( TRUCK-AT ?auto_16034 ?auto_16028 ) ( SURFACE-AT ?auto_16029 ?auto_16028 ) ( CLEAR ?auto_16029 ) ( IS-CRATE ?auto_16036 ) ( not ( = ?auto_16019 ?auto_16029 ) ) ( not ( = ?auto_16020 ?auto_16029 ) ) ( not ( = ?auto_16021 ?auto_16029 ) ) ( not ( = ?auto_16031 ?auto_16029 ) ) ( not ( = ?auto_16026 ?auto_16029 ) ) ( not ( = ?auto_16032 ?auto_16029 ) ) ( not ( = ?auto_16022 ?auto_16029 ) ) ( not ( = ?auto_16036 ?auto_16029 ) ) ( not ( = ?auto_16037 ?auto_16029 ) ) ( AVAILABLE ?auto_16033 ) ( IN ?auto_16036 ?auto_16034 ) )
    :subtasks
    ( ( !UNLOAD ?auto_16033 ?auto_16036 ?auto_16034 ?auto_16028 )
      ( MAKE-ON ?auto_16019 ?auto_16020 )
      ( MAKE-ON-VERIFY ?auto_16019 ?auto_16020 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16038 - SURFACE
      ?auto_16039 - SURFACE
    )
    :vars
    (
      ?auto_16041 - HOIST
      ?auto_16045 - PLACE
      ?auto_16050 - PLACE
      ?auto_16044 - HOIST
      ?auto_16055 - SURFACE
      ?auto_16048 - SURFACE
      ?auto_16056 - PLACE
      ?auto_16047 - HOIST
      ?auto_16046 - SURFACE
      ?auto_16043 - SURFACE
      ?auto_16052 - SURFACE
      ?auto_16042 - SURFACE
      ?auto_16054 - PLACE
      ?auto_16053 - HOIST
      ?auto_16049 - SURFACE
      ?auto_16040 - SURFACE
      ?auto_16051 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16041 ?auto_16045 ) ( IS-CRATE ?auto_16038 ) ( not ( = ?auto_16038 ?auto_16039 ) ) ( not ( = ?auto_16050 ?auto_16045 ) ) ( HOIST-AT ?auto_16044 ?auto_16050 ) ( not ( = ?auto_16041 ?auto_16044 ) ) ( SURFACE-AT ?auto_16038 ?auto_16050 ) ( ON ?auto_16038 ?auto_16055 ) ( CLEAR ?auto_16038 ) ( not ( = ?auto_16038 ?auto_16055 ) ) ( not ( = ?auto_16039 ?auto_16055 ) ) ( IS-CRATE ?auto_16039 ) ( not ( = ?auto_16038 ?auto_16048 ) ) ( not ( = ?auto_16039 ?auto_16048 ) ) ( not ( = ?auto_16055 ?auto_16048 ) ) ( not ( = ?auto_16056 ?auto_16045 ) ) ( not ( = ?auto_16050 ?auto_16056 ) ) ( HOIST-AT ?auto_16047 ?auto_16056 ) ( not ( = ?auto_16041 ?auto_16047 ) ) ( not ( = ?auto_16044 ?auto_16047 ) ) ( AVAILABLE ?auto_16047 ) ( SURFACE-AT ?auto_16039 ?auto_16056 ) ( ON ?auto_16039 ?auto_16046 ) ( CLEAR ?auto_16039 ) ( not ( = ?auto_16038 ?auto_16046 ) ) ( not ( = ?auto_16039 ?auto_16046 ) ) ( not ( = ?auto_16055 ?auto_16046 ) ) ( not ( = ?auto_16048 ?auto_16046 ) ) ( IS-CRATE ?auto_16048 ) ( not ( = ?auto_16038 ?auto_16043 ) ) ( not ( = ?auto_16039 ?auto_16043 ) ) ( not ( = ?auto_16055 ?auto_16043 ) ) ( not ( = ?auto_16048 ?auto_16043 ) ) ( not ( = ?auto_16046 ?auto_16043 ) ) ( AVAILABLE ?auto_16044 ) ( SURFACE-AT ?auto_16048 ?auto_16050 ) ( ON ?auto_16048 ?auto_16052 ) ( CLEAR ?auto_16048 ) ( not ( = ?auto_16038 ?auto_16052 ) ) ( not ( = ?auto_16039 ?auto_16052 ) ) ( not ( = ?auto_16055 ?auto_16052 ) ) ( not ( = ?auto_16048 ?auto_16052 ) ) ( not ( = ?auto_16046 ?auto_16052 ) ) ( not ( = ?auto_16043 ?auto_16052 ) ) ( IS-CRATE ?auto_16043 ) ( not ( = ?auto_16038 ?auto_16042 ) ) ( not ( = ?auto_16039 ?auto_16042 ) ) ( not ( = ?auto_16055 ?auto_16042 ) ) ( not ( = ?auto_16048 ?auto_16042 ) ) ( not ( = ?auto_16046 ?auto_16042 ) ) ( not ( = ?auto_16043 ?auto_16042 ) ) ( not ( = ?auto_16052 ?auto_16042 ) ) ( not ( = ?auto_16054 ?auto_16045 ) ) ( not ( = ?auto_16050 ?auto_16054 ) ) ( not ( = ?auto_16056 ?auto_16054 ) ) ( HOIST-AT ?auto_16053 ?auto_16054 ) ( not ( = ?auto_16041 ?auto_16053 ) ) ( not ( = ?auto_16044 ?auto_16053 ) ) ( not ( = ?auto_16047 ?auto_16053 ) ) ( AVAILABLE ?auto_16053 ) ( SURFACE-AT ?auto_16043 ?auto_16054 ) ( ON ?auto_16043 ?auto_16049 ) ( CLEAR ?auto_16043 ) ( not ( = ?auto_16038 ?auto_16049 ) ) ( not ( = ?auto_16039 ?auto_16049 ) ) ( not ( = ?auto_16055 ?auto_16049 ) ) ( not ( = ?auto_16048 ?auto_16049 ) ) ( not ( = ?auto_16046 ?auto_16049 ) ) ( not ( = ?auto_16043 ?auto_16049 ) ) ( not ( = ?auto_16052 ?auto_16049 ) ) ( not ( = ?auto_16042 ?auto_16049 ) ) ( SURFACE-AT ?auto_16040 ?auto_16045 ) ( CLEAR ?auto_16040 ) ( IS-CRATE ?auto_16042 ) ( not ( = ?auto_16038 ?auto_16040 ) ) ( not ( = ?auto_16039 ?auto_16040 ) ) ( not ( = ?auto_16055 ?auto_16040 ) ) ( not ( = ?auto_16048 ?auto_16040 ) ) ( not ( = ?auto_16046 ?auto_16040 ) ) ( not ( = ?auto_16043 ?auto_16040 ) ) ( not ( = ?auto_16052 ?auto_16040 ) ) ( not ( = ?auto_16042 ?auto_16040 ) ) ( not ( = ?auto_16049 ?auto_16040 ) ) ( AVAILABLE ?auto_16041 ) ( IN ?auto_16042 ?auto_16051 ) ( TRUCK-AT ?auto_16051 ?auto_16056 ) )
    :subtasks
    ( ( !DRIVE ?auto_16051 ?auto_16056 ?auto_16045 )
      ( MAKE-ON ?auto_16038 ?auto_16039 )
      ( MAKE-ON-VERIFY ?auto_16038 ?auto_16039 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16057 - SURFACE
      ?auto_16058 - SURFACE
    )
    :vars
    (
      ?auto_16062 - HOIST
      ?auto_16075 - PLACE
      ?auto_16063 - PLACE
      ?auto_16073 - HOIST
      ?auto_16067 - SURFACE
      ?auto_16066 - SURFACE
      ?auto_16071 - PLACE
      ?auto_16070 - HOIST
      ?auto_16069 - SURFACE
      ?auto_16074 - SURFACE
      ?auto_16064 - SURFACE
      ?auto_16065 - SURFACE
      ?auto_16068 - PLACE
      ?auto_16060 - HOIST
      ?auto_16061 - SURFACE
      ?auto_16072 - SURFACE
      ?auto_16059 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16062 ?auto_16075 ) ( IS-CRATE ?auto_16057 ) ( not ( = ?auto_16057 ?auto_16058 ) ) ( not ( = ?auto_16063 ?auto_16075 ) ) ( HOIST-AT ?auto_16073 ?auto_16063 ) ( not ( = ?auto_16062 ?auto_16073 ) ) ( SURFACE-AT ?auto_16057 ?auto_16063 ) ( ON ?auto_16057 ?auto_16067 ) ( CLEAR ?auto_16057 ) ( not ( = ?auto_16057 ?auto_16067 ) ) ( not ( = ?auto_16058 ?auto_16067 ) ) ( IS-CRATE ?auto_16058 ) ( not ( = ?auto_16057 ?auto_16066 ) ) ( not ( = ?auto_16058 ?auto_16066 ) ) ( not ( = ?auto_16067 ?auto_16066 ) ) ( not ( = ?auto_16071 ?auto_16075 ) ) ( not ( = ?auto_16063 ?auto_16071 ) ) ( HOIST-AT ?auto_16070 ?auto_16071 ) ( not ( = ?auto_16062 ?auto_16070 ) ) ( not ( = ?auto_16073 ?auto_16070 ) ) ( SURFACE-AT ?auto_16058 ?auto_16071 ) ( ON ?auto_16058 ?auto_16069 ) ( CLEAR ?auto_16058 ) ( not ( = ?auto_16057 ?auto_16069 ) ) ( not ( = ?auto_16058 ?auto_16069 ) ) ( not ( = ?auto_16067 ?auto_16069 ) ) ( not ( = ?auto_16066 ?auto_16069 ) ) ( IS-CRATE ?auto_16066 ) ( not ( = ?auto_16057 ?auto_16074 ) ) ( not ( = ?auto_16058 ?auto_16074 ) ) ( not ( = ?auto_16067 ?auto_16074 ) ) ( not ( = ?auto_16066 ?auto_16074 ) ) ( not ( = ?auto_16069 ?auto_16074 ) ) ( AVAILABLE ?auto_16073 ) ( SURFACE-AT ?auto_16066 ?auto_16063 ) ( ON ?auto_16066 ?auto_16064 ) ( CLEAR ?auto_16066 ) ( not ( = ?auto_16057 ?auto_16064 ) ) ( not ( = ?auto_16058 ?auto_16064 ) ) ( not ( = ?auto_16067 ?auto_16064 ) ) ( not ( = ?auto_16066 ?auto_16064 ) ) ( not ( = ?auto_16069 ?auto_16064 ) ) ( not ( = ?auto_16074 ?auto_16064 ) ) ( IS-CRATE ?auto_16074 ) ( not ( = ?auto_16057 ?auto_16065 ) ) ( not ( = ?auto_16058 ?auto_16065 ) ) ( not ( = ?auto_16067 ?auto_16065 ) ) ( not ( = ?auto_16066 ?auto_16065 ) ) ( not ( = ?auto_16069 ?auto_16065 ) ) ( not ( = ?auto_16074 ?auto_16065 ) ) ( not ( = ?auto_16064 ?auto_16065 ) ) ( not ( = ?auto_16068 ?auto_16075 ) ) ( not ( = ?auto_16063 ?auto_16068 ) ) ( not ( = ?auto_16071 ?auto_16068 ) ) ( HOIST-AT ?auto_16060 ?auto_16068 ) ( not ( = ?auto_16062 ?auto_16060 ) ) ( not ( = ?auto_16073 ?auto_16060 ) ) ( not ( = ?auto_16070 ?auto_16060 ) ) ( AVAILABLE ?auto_16060 ) ( SURFACE-AT ?auto_16074 ?auto_16068 ) ( ON ?auto_16074 ?auto_16061 ) ( CLEAR ?auto_16074 ) ( not ( = ?auto_16057 ?auto_16061 ) ) ( not ( = ?auto_16058 ?auto_16061 ) ) ( not ( = ?auto_16067 ?auto_16061 ) ) ( not ( = ?auto_16066 ?auto_16061 ) ) ( not ( = ?auto_16069 ?auto_16061 ) ) ( not ( = ?auto_16074 ?auto_16061 ) ) ( not ( = ?auto_16064 ?auto_16061 ) ) ( not ( = ?auto_16065 ?auto_16061 ) ) ( SURFACE-AT ?auto_16072 ?auto_16075 ) ( CLEAR ?auto_16072 ) ( IS-CRATE ?auto_16065 ) ( not ( = ?auto_16057 ?auto_16072 ) ) ( not ( = ?auto_16058 ?auto_16072 ) ) ( not ( = ?auto_16067 ?auto_16072 ) ) ( not ( = ?auto_16066 ?auto_16072 ) ) ( not ( = ?auto_16069 ?auto_16072 ) ) ( not ( = ?auto_16074 ?auto_16072 ) ) ( not ( = ?auto_16064 ?auto_16072 ) ) ( not ( = ?auto_16065 ?auto_16072 ) ) ( not ( = ?auto_16061 ?auto_16072 ) ) ( AVAILABLE ?auto_16062 ) ( TRUCK-AT ?auto_16059 ?auto_16071 ) ( LIFTING ?auto_16070 ?auto_16065 ) )
    :subtasks
    ( ( !LOAD ?auto_16070 ?auto_16065 ?auto_16059 ?auto_16071 )
      ( MAKE-ON ?auto_16057 ?auto_16058 )
      ( MAKE-ON-VERIFY ?auto_16057 ?auto_16058 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16076 - SURFACE
      ?auto_16077 - SURFACE
    )
    :vars
    (
      ?auto_16085 - HOIST
      ?auto_16086 - PLACE
      ?auto_16093 - PLACE
      ?auto_16087 - HOIST
      ?auto_16078 - SURFACE
      ?auto_16088 - SURFACE
      ?auto_16090 - PLACE
      ?auto_16084 - HOIST
      ?auto_16092 - SURFACE
      ?auto_16079 - SURFACE
      ?auto_16081 - SURFACE
      ?auto_16094 - SURFACE
      ?auto_16083 - PLACE
      ?auto_16080 - HOIST
      ?auto_16089 - SURFACE
      ?auto_16082 - SURFACE
      ?auto_16091 - TRUCK
      ?auto_16095 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16085 ?auto_16086 ) ( IS-CRATE ?auto_16076 ) ( not ( = ?auto_16076 ?auto_16077 ) ) ( not ( = ?auto_16093 ?auto_16086 ) ) ( HOIST-AT ?auto_16087 ?auto_16093 ) ( not ( = ?auto_16085 ?auto_16087 ) ) ( SURFACE-AT ?auto_16076 ?auto_16093 ) ( ON ?auto_16076 ?auto_16078 ) ( CLEAR ?auto_16076 ) ( not ( = ?auto_16076 ?auto_16078 ) ) ( not ( = ?auto_16077 ?auto_16078 ) ) ( IS-CRATE ?auto_16077 ) ( not ( = ?auto_16076 ?auto_16088 ) ) ( not ( = ?auto_16077 ?auto_16088 ) ) ( not ( = ?auto_16078 ?auto_16088 ) ) ( not ( = ?auto_16090 ?auto_16086 ) ) ( not ( = ?auto_16093 ?auto_16090 ) ) ( HOIST-AT ?auto_16084 ?auto_16090 ) ( not ( = ?auto_16085 ?auto_16084 ) ) ( not ( = ?auto_16087 ?auto_16084 ) ) ( SURFACE-AT ?auto_16077 ?auto_16090 ) ( ON ?auto_16077 ?auto_16092 ) ( CLEAR ?auto_16077 ) ( not ( = ?auto_16076 ?auto_16092 ) ) ( not ( = ?auto_16077 ?auto_16092 ) ) ( not ( = ?auto_16078 ?auto_16092 ) ) ( not ( = ?auto_16088 ?auto_16092 ) ) ( IS-CRATE ?auto_16088 ) ( not ( = ?auto_16076 ?auto_16079 ) ) ( not ( = ?auto_16077 ?auto_16079 ) ) ( not ( = ?auto_16078 ?auto_16079 ) ) ( not ( = ?auto_16088 ?auto_16079 ) ) ( not ( = ?auto_16092 ?auto_16079 ) ) ( AVAILABLE ?auto_16087 ) ( SURFACE-AT ?auto_16088 ?auto_16093 ) ( ON ?auto_16088 ?auto_16081 ) ( CLEAR ?auto_16088 ) ( not ( = ?auto_16076 ?auto_16081 ) ) ( not ( = ?auto_16077 ?auto_16081 ) ) ( not ( = ?auto_16078 ?auto_16081 ) ) ( not ( = ?auto_16088 ?auto_16081 ) ) ( not ( = ?auto_16092 ?auto_16081 ) ) ( not ( = ?auto_16079 ?auto_16081 ) ) ( IS-CRATE ?auto_16079 ) ( not ( = ?auto_16076 ?auto_16094 ) ) ( not ( = ?auto_16077 ?auto_16094 ) ) ( not ( = ?auto_16078 ?auto_16094 ) ) ( not ( = ?auto_16088 ?auto_16094 ) ) ( not ( = ?auto_16092 ?auto_16094 ) ) ( not ( = ?auto_16079 ?auto_16094 ) ) ( not ( = ?auto_16081 ?auto_16094 ) ) ( not ( = ?auto_16083 ?auto_16086 ) ) ( not ( = ?auto_16093 ?auto_16083 ) ) ( not ( = ?auto_16090 ?auto_16083 ) ) ( HOIST-AT ?auto_16080 ?auto_16083 ) ( not ( = ?auto_16085 ?auto_16080 ) ) ( not ( = ?auto_16087 ?auto_16080 ) ) ( not ( = ?auto_16084 ?auto_16080 ) ) ( AVAILABLE ?auto_16080 ) ( SURFACE-AT ?auto_16079 ?auto_16083 ) ( ON ?auto_16079 ?auto_16089 ) ( CLEAR ?auto_16079 ) ( not ( = ?auto_16076 ?auto_16089 ) ) ( not ( = ?auto_16077 ?auto_16089 ) ) ( not ( = ?auto_16078 ?auto_16089 ) ) ( not ( = ?auto_16088 ?auto_16089 ) ) ( not ( = ?auto_16092 ?auto_16089 ) ) ( not ( = ?auto_16079 ?auto_16089 ) ) ( not ( = ?auto_16081 ?auto_16089 ) ) ( not ( = ?auto_16094 ?auto_16089 ) ) ( SURFACE-AT ?auto_16082 ?auto_16086 ) ( CLEAR ?auto_16082 ) ( IS-CRATE ?auto_16094 ) ( not ( = ?auto_16076 ?auto_16082 ) ) ( not ( = ?auto_16077 ?auto_16082 ) ) ( not ( = ?auto_16078 ?auto_16082 ) ) ( not ( = ?auto_16088 ?auto_16082 ) ) ( not ( = ?auto_16092 ?auto_16082 ) ) ( not ( = ?auto_16079 ?auto_16082 ) ) ( not ( = ?auto_16081 ?auto_16082 ) ) ( not ( = ?auto_16094 ?auto_16082 ) ) ( not ( = ?auto_16089 ?auto_16082 ) ) ( AVAILABLE ?auto_16085 ) ( TRUCK-AT ?auto_16091 ?auto_16090 ) ( AVAILABLE ?auto_16084 ) ( SURFACE-AT ?auto_16094 ?auto_16090 ) ( ON ?auto_16094 ?auto_16095 ) ( CLEAR ?auto_16094 ) ( not ( = ?auto_16076 ?auto_16095 ) ) ( not ( = ?auto_16077 ?auto_16095 ) ) ( not ( = ?auto_16078 ?auto_16095 ) ) ( not ( = ?auto_16088 ?auto_16095 ) ) ( not ( = ?auto_16092 ?auto_16095 ) ) ( not ( = ?auto_16079 ?auto_16095 ) ) ( not ( = ?auto_16081 ?auto_16095 ) ) ( not ( = ?auto_16094 ?auto_16095 ) ) ( not ( = ?auto_16089 ?auto_16095 ) ) ( not ( = ?auto_16082 ?auto_16095 ) ) )
    :subtasks
    ( ( !LIFT ?auto_16084 ?auto_16094 ?auto_16095 ?auto_16090 )
      ( MAKE-ON ?auto_16076 ?auto_16077 )
      ( MAKE-ON-VERIFY ?auto_16076 ?auto_16077 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16096 - SURFACE
      ?auto_16097 - SURFACE
    )
    :vars
    (
      ?auto_16103 - HOIST
      ?auto_16104 - PLACE
      ?auto_16101 - PLACE
      ?auto_16102 - HOIST
      ?auto_16105 - SURFACE
      ?auto_16111 - SURFACE
      ?auto_16109 - PLACE
      ?auto_16110 - HOIST
      ?auto_16112 - SURFACE
      ?auto_16115 - SURFACE
      ?auto_16108 - SURFACE
      ?auto_16098 - SURFACE
      ?auto_16114 - PLACE
      ?auto_16113 - HOIST
      ?auto_16100 - SURFACE
      ?auto_16099 - SURFACE
      ?auto_16106 - SURFACE
      ?auto_16107 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16103 ?auto_16104 ) ( IS-CRATE ?auto_16096 ) ( not ( = ?auto_16096 ?auto_16097 ) ) ( not ( = ?auto_16101 ?auto_16104 ) ) ( HOIST-AT ?auto_16102 ?auto_16101 ) ( not ( = ?auto_16103 ?auto_16102 ) ) ( SURFACE-AT ?auto_16096 ?auto_16101 ) ( ON ?auto_16096 ?auto_16105 ) ( CLEAR ?auto_16096 ) ( not ( = ?auto_16096 ?auto_16105 ) ) ( not ( = ?auto_16097 ?auto_16105 ) ) ( IS-CRATE ?auto_16097 ) ( not ( = ?auto_16096 ?auto_16111 ) ) ( not ( = ?auto_16097 ?auto_16111 ) ) ( not ( = ?auto_16105 ?auto_16111 ) ) ( not ( = ?auto_16109 ?auto_16104 ) ) ( not ( = ?auto_16101 ?auto_16109 ) ) ( HOIST-AT ?auto_16110 ?auto_16109 ) ( not ( = ?auto_16103 ?auto_16110 ) ) ( not ( = ?auto_16102 ?auto_16110 ) ) ( SURFACE-AT ?auto_16097 ?auto_16109 ) ( ON ?auto_16097 ?auto_16112 ) ( CLEAR ?auto_16097 ) ( not ( = ?auto_16096 ?auto_16112 ) ) ( not ( = ?auto_16097 ?auto_16112 ) ) ( not ( = ?auto_16105 ?auto_16112 ) ) ( not ( = ?auto_16111 ?auto_16112 ) ) ( IS-CRATE ?auto_16111 ) ( not ( = ?auto_16096 ?auto_16115 ) ) ( not ( = ?auto_16097 ?auto_16115 ) ) ( not ( = ?auto_16105 ?auto_16115 ) ) ( not ( = ?auto_16111 ?auto_16115 ) ) ( not ( = ?auto_16112 ?auto_16115 ) ) ( AVAILABLE ?auto_16102 ) ( SURFACE-AT ?auto_16111 ?auto_16101 ) ( ON ?auto_16111 ?auto_16108 ) ( CLEAR ?auto_16111 ) ( not ( = ?auto_16096 ?auto_16108 ) ) ( not ( = ?auto_16097 ?auto_16108 ) ) ( not ( = ?auto_16105 ?auto_16108 ) ) ( not ( = ?auto_16111 ?auto_16108 ) ) ( not ( = ?auto_16112 ?auto_16108 ) ) ( not ( = ?auto_16115 ?auto_16108 ) ) ( IS-CRATE ?auto_16115 ) ( not ( = ?auto_16096 ?auto_16098 ) ) ( not ( = ?auto_16097 ?auto_16098 ) ) ( not ( = ?auto_16105 ?auto_16098 ) ) ( not ( = ?auto_16111 ?auto_16098 ) ) ( not ( = ?auto_16112 ?auto_16098 ) ) ( not ( = ?auto_16115 ?auto_16098 ) ) ( not ( = ?auto_16108 ?auto_16098 ) ) ( not ( = ?auto_16114 ?auto_16104 ) ) ( not ( = ?auto_16101 ?auto_16114 ) ) ( not ( = ?auto_16109 ?auto_16114 ) ) ( HOIST-AT ?auto_16113 ?auto_16114 ) ( not ( = ?auto_16103 ?auto_16113 ) ) ( not ( = ?auto_16102 ?auto_16113 ) ) ( not ( = ?auto_16110 ?auto_16113 ) ) ( AVAILABLE ?auto_16113 ) ( SURFACE-AT ?auto_16115 ?auto_16114 ) ( ON ?auto_16115 ?auto_16100 ) ( CLEAR ?auto_16115 ) ( not ( = ?auto_16096 ?auto_16100 ) ) ( not ( = ?auto_16097 ?auto_16100 ) ) ( not ( = ?auto_16105 ?auto_16100 ) ) ( not ( = ?auto_16111 ?auto_16100 ) ) ( not ( = ?auto_16112 ?auto_16100 ) ) ( not ( = ?auto_16115 ?auto_16100 ) ) ( not ( = ?auto_16108 ?auto_16100 ) ) ( not ( = ?auto_16098 ?auto_16100 ) ) ( SURFACE-AT ?auto_16099 ?auto_16104 ) ( CLEAR ?auto_16099 ) ( IS-CRATE ?auto_16098 ) ( not ( = ?auto_16096 ?auto_16099 ) ) ( not ( = ?auto_16097 ?auto_16099 ) ) ( not ( = ?auto_16105 ?auto_16099 ) ) ( not ( = ?auto_16111 ?auto_16099 ) ) ( not ( = ?auto_16112 ?auto_16099 ) ) ( not ( = ?auto_16115 ?auto_16099 ) ) ( not ( = ?auto_16108 ?auto_16099 ) ) ( not ( = ?auto_16098 ?auto_16099 ) ) ( not ( = ?auto_16100 ?auto_16099 ) ) ( AVAILABLE ?auto_16103 ) ( AVAILABLE ?auto_16110 ) ( SURFACE-AT ?auto_16098 ?auto_16109 ) ( ON ?auto_16098 ?auto_16106 ) ( CLEAR ?auto_16098 ) ( not ( = ?auto_16096 ?auto_16106 ) ) ( not ( = ?auto_16097 ?auto_16106 ) ) ( not ( = ?auto_16105 ?auto_16106 ) ) ( not ( = ?auto_16111 ?auto_16106 ) ) ( not ( = ?auto_16112 ?auto_16106 ) ) ( not ( = ?auto_16115 ?auto_16106 ) ) ( not ( = ?auto_16108 ?auto_16106 ) ) ( not ( = ?auto_16098 ?auto_16106 ) ) ( not ( = ?auto_16100 ?auto_16106 ) ) ( not ( = ?auto_16099 ?auto_16106 ) ) ( TRUCK-AT ?auto_16107 ?auto_16104 ) )
    :subtasks
    ( ( !DRIVE ?auto_16107 ?auto_16104 ?auto_16109 )
      ( MAKE-ON ?auto_16096 ?auto_16097 )
      ( MAKE-ON-VERIFY ?auto_16096 ?auto_16097 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16118 - SURFACE
      ?auto_16119 - SURFACE
    )
    :vars
    (
      ?auto_16120 - HOIST
      ?auto_16121 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16120 ?auto_16121 ) ( SURFACE-AT ?auto_16119 ?auto_16121 ) ( CLEAR ?auto_16119 ) ( LIFTING ?auto_16120 ?auto_16118 ) ( IS-CRATE ?auto_16118 ) ( not ( = ?auto_16118 ?auto_16119 ) ) )
    :subtasks
    ( ( !DROP ?auto_16120 ?auto_16118 ?auto_16119 ?auto_16121 )
      ( MAKE-ON-VERIFY ?auto_16118 ?auto_16119 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16122 - SURFACE
      ?auto_16123 - SURFACE
    )
    :vars
    (
      ?auto_16124 - HOIST
      ?auto_16125 - PLACE
      ?auto_16126 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16124 ?auto_16125 ) ( SURFACE-AT ?auto_16123 ?auto_16125 ) ( CLEAR ?auto_16123 ) ( IS-CRATE ?auto_16122 ) ( not ( = ?auto_16122 ?auto_16123 ) ) ( TRUCK-AT ?auto_16126 ?auto_16125 ) ( AVAILABLE ?auto_16124 ) ( IN ?auto_16122 ?auto_16126 ) )
    :subtasks
    ( ( !UNLOAD ?auto_16124 ?auto_16122 ?auto_16126 ?auto_16125 )
      ( MAKE-ON ?auto_16122 ?auto_16123 )
      ( MAKE-ON-VERIFY ?auto_16122 ?auto_16123 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16127 - SURFACE
      ?auto_16128 - SURFACE
    )
    :vars
    (
      ?auto_16129 - HOIST
      ?auto_16131 - PLACE
      ?auto_16130 - TRUCK
      ?auto_16132 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16129 ?auto_16131 ) ( SURFACE-AT ?auto_16128 ?auto_16131 ) ( CLEAR ?auto_16128 ) ( IS-CRATE ?auto_16127 ) ( not ( = ?auto_16127 ?auto_16128 ) ) ( AVAILABLE ?auto_16129 ) ( IN ?auto_16127 ?auto_16130 ) ( TRUCK-AT ?auto_16130 ?auto_16132 ) ( not ( = ?auto_16132 ?auto_16131 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16130 ?auto_16132 ?auto_16131 )
      ( MAKE-ON ?auto_16127 ?auto_16128 )
      ( MAKE-ON-VERIFY ?auto_16127 ?auto_16128 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16133 - SURFACE
      ?auto_16134 - SURFACE
    )
    :vars
    (
      ?auto_16137 - HOIST
      ?auto_16138 - PLACE
      ?auto_16136 - TRUCK
      ?auto_16135 - PLACE
      ?auto_16139 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16137 ?auto_16138 ) ( SURFACE-AT ?auto_16134 ?auto_16138 ) ( CLEAR ?auto_16134 ) ( IS-CRATE ?auto_16133 ) ( not ( = ?auto_16133 ?auto_16134 ) ) ( AVAILABLE ?auto_16137 ) ( TRUCK-AT ?auto_16136 ?auto_16135 ) ( not ( = ?auto_16135 ?auto_16138 ) ) ( HOIST-AT ?auto_16139 ?auto_16135 ) ( LIFTING ?auto_16139 ?auto_16133 ) ( not ( = ?auto_16137 ?auto_16139 ) ) )
    :subtasks
    ( ( !LOAD ?auto_16139 ?auto_16133 ?auto_16136 ?auto_16135 )
      ( MAKE-ON ?auto_16133 ?auto_16134 )
      ( MAKE-ON-VERIFY ?auto_16133 ?auto_16134 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16140 - SURFACE
      ?auto_16141 - SURFACE
    )
    :vars
    (
      ?auto_16142 - HOIST
      ?auto_16144 - PLACE
      ?auto_16146 - TRUCK
      ?auto_16143 - PLACE
      ?auto_16145 - HOIST
      ?auto_16147 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16142 ?auto_16144 ) ( SURFACE-AT ?auto_16141 ?auto_16144 ) ( CLEAR ?auto_16141 ) ( IS-CRATE ?auto_16140 ) ( not ( = ?auto_16140 ?auto_16141 ) ) ( AVAILABLE ?auto_16142 ) ( TRUCK-AT ?auto_16146 ?auto_16143 ) ( not ( = ?auto_16143 ?auto_16144 ) ) ( HOIST-AT ?auto_16145 ?auto_16143 ) ( not ( = ?auto_16142 ?auto_16145 ) ) ( AVAILABLE ?auto_16145 ) ( SURFACE-AT ?auto_16140 ?auto_16143 ) ( ON ?auto_16140 ?auto_16147 ) ( CLEAR ?auto_16140 ) ( not ( = ?auto_16140 ?auto_16147 ) ) ( not ( = ?auto_16141 ?auto_16147 ) ) )
    :subtasks
    ( ( !LIFT ?auto_16145 ?auto_16140 ?auto_16147 ?auto_16143 )
      ( MAKE-ON ?auto_16140 ?auto_16141 )
      ( MAKE-ON-VERIFY ?auto_16140 ?auto_16141 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16148 - SURFACE
      ?auto_16149 - SURFACE
    )
    :vars
    (
      ?auto_16152 - HOIST
      ?auto_16153 - PLACE
      ?auto_16155 - PLACE
      ?auto_16150 - HOIST
      ?auto_16151 - SURFACE
      ?auto_16154 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16152 ?auto_16153 ) ( SURFACE-AT ?auto_16149 ?auto_16153 ) ( CLEAR ?auto_16149 ) ( IS-CRATE ?auto_16148 ) ( not ( = ?auto_16148 ?auto_16149 ) ) ( AVAILABLE ?auto_16152 ) ( not ( = ?auto_16155 ?auto_16153 ) ) ( HOIST-AT ?auto_16150 ?auto_16155 ) ( not ( = ?auto_16152 ?auto_16150 ) ) ( AVAILABLE ?auto_16150 ) ( SURFACE-AT ?auto_16148 ?auto_16155 ) ( ON ?auto_16148 ?auto_16151 ) ( CLEAR ?auto_16148 ) ( not ( = ?auto_16148 ?auto_16151 ) ) ( not ( = ?auto_16149 ?auto_16151 ) ) ( TRUCK-AT ?auto_16154 ?auto_16153 ) )
    :subtasks
    ( ( !DRIVE ?auto_16154 ?auto_16153 ?auto_16155 )
      ( MAKE-ON ?auto_16148 ?auto_16149 )
      ( MAKE-ON-VERIFY ?auto_16148 ?auto_16149 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16156 - SURFACE
      ?auto_16157 - SURFACE
    )
    :vars
    (
      ?auto_16160 - HOIST
      ?auto_16159 - PLACE
      ?auto_16158 - PLACE
      ?auto_16162 - HOIST
      ?auto_16161 - SURFACE
      ?auto_16163 - TRUCK
      ?auto_16164 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16160 ?auto_16159 ) ( IS-CRATE ?auto_16156 ) ( not ( = ?auto_16156 ?auto_16157 ) ) ( not ( = ?auto_16158 ?auto_16159 ) ) ( HOIST-AT ?auto_16162 ?auto_16158 ) ( not ( = ?auto_16160 ?auto_16162 ) ) ( AVAILABLE ?auto_16162 ) ( SURFACE-AT ?auto_16156 ?auto_16158 ) ( ON ?auto_16156 ?auto_16161 ) ( CLEAR ?auto_16156 ) ( not ( = ?auto_16156 ?auto_16161 ) ) ( not ( = ?auto_16157 ?auto_16161 ) ) ( TRUCK-AT ?auto_16163 ?auto_16159 ) ( SURFACE-AT ?auto_16164 ?auto_16159 ) ( CLEAR ?auto_16164 ) ( LIFTING ?auto_16160 ?auto_16157 ) ( IS-CRATE ?auto_16157 ) ( not ( = ?auto_16156 ?auto_16164 ) ) ( not ( = ?auto_16157 ?auto_16164 ) ) ( not ( = ?auto_16161 ?auto_16164 ) ) )
    :subtasks
    ( ( !DROP ?auto_16160 ?auto_16157 ?auto_16164 ?auto_16159 )
      ( MAKE-ON ?auto_16156 ?auto_16157 )
      ( MAKE-ON-VERIFY ?auto_16156 ?auto_16157 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16165 - SURFACE
      ?auto_16166 - SURFACE
    )
    :vars
    (
      ?auto_16169 - HOIST
      ?auto_16168 - PLACE
      ?auto_16172 - PLACE
      ?auto_16170 - HOIST
      ?auto_16173 - SURFACE
      ?auto_16167 - TRUCK
      ?auto_16171 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16169 ?auto_16168 ) ( IS-CRATE ?auto_16165 ) ( not ( = ?auto_16165 ?auto_16166 ) ) ( not ( = ?auto_16172 ?auto_16168 ) ) ( HOIST-AT ?auto_16170 ?auto_16172 ) ( not ( = ?auto_16169 ?auto_16170 ) ) ( AVAILABLE ?auto_16170 ) ( SURFACE-AT ?auto_16165 ?auto_16172 ) ( ON ?auto_16165 ?auto_16173 ) ( CLEAR ?auto_16165 ) ( not ( = ?auto_16165 ?auto_16173 ) ) ( not ( = ?auto_16166 ?auto_16173 ) ) ( TRUCK-AT ?auto_16167 ?auto_16168 ) ( SURFACE-AT ?auto_16171 ?auto_16168 ) ( CLEAR ?auto_16171 ) ( IS-CRATE ?auto_16166 ) ( not ( = ?auto_16165 ?auto_16171 ) ) ( not ( = ?auto_16166 ?auto_16171 ) ) ( not ( = ?auto_16173 ?auto_16171 ) ) ( AVAILABLE ?auto_16169 ) ( IN ?auto_16166 ?auto_16167 ) )
    :subtasks
    ( ( !UNLOAD ?auto_16169 ?auto_16166 ?auto_16167 ?auto_16168 )
      ( MAKE-ON ?auto_16165 ?auto_16166 )
      ( MAKE-ON-VERIFY ?auto_16165 ?auto_16166 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16174 - SURFACE
      ?auto_16175 - SURFACE
    )
    :vars
    (
      ?auto_16182 - HOIST
      ?auto_16178 - PLACE
      ?auto_16179 - PLACE
      ?auto_16181 - HOIST
      ?auto_16176 - SURFACE
      ?auto_16180 - SURFACE
      ?auto_16177 - TRUCK
      ?auto_16183 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16182 ?auto_16178 ) ( IS-CRATE ?auto_16174 ) ( not ( = ?auto_16174 ?auto_16175 ) ) ( not ( = ?auto_16179 ?auto_16178 ) ) ( HOIST-AT ?auto_16181 ?auto_16179 ) ( not ( = ?auto_16182 ?auto_16181 ) ) ( AVAILABLE ?auto_16181 ) ( SURFACE-AT ?auto_16174 ?auto_16179 ) ( ON ?auto_16174 ?auto_16176 ) ( CLEAR ?auto_16174 ) ( not ( = ?auto_16174 ?auto_16176 ) ) ( not ( = ?auto_16175 ?auto_16176 ) ) ( SURFACE-AT ?auto_16180 ?auto_16178 ) ( CLEAR ?auto_16180 ) ( IS-CRATE ?auto_16175 ) ( not ( = ?auto_16174 ?auto_16180 ) ) ( not ( = ?auto_16175 ?auto_16180 ) ) ( not ( = ?auto_16176 ?auto_16180 ) ) ( AVAILABLE ?auto_16182 ) ( IN ?auto_16175 ?auto_16177 ) ( TRUCK-AT ?auto_16177 ?auto_16183 ) ( not ( = ?auto_16183 ?auto_16178 ) ) ( not ( = ?auto_16179 ?auto_16183 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16177 ?auto_16183 ?auto_16178 )
      ( MAKE-ON ?auto_16174 ?auto_16175 )
      ( MAKE-ON-VERIFY ?auto_16174 ?auto_16175 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16184 - SURFACE
      ?auto_16185 - SURFACE
    )
    :vars
    (
      ?auto_16190 - HOIST
      ?auto_16192 - PLACE
      ?auto_16191 - PLACE
      ?auto_16189 - HOIST
      ?auto_16186 - SURFACE
      ?auto_16188 - SURFACE
      ?auto_16187 - TRUCK
      ?auto_16193 - PLACE
      ?auto_16194 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16190 ?auto_16192 ) ( IS-CRATE ?auto_16184 ) ( not ( = ?auto_16184 ?auto_16185 ) ) ( not ( = ?auto_16191 ?auto_16192 ) ) ( HOIST-AT ?auto_16189 ?auto_16191 ) ( not ( = ?auto_16190 ?auto_16189 ) ) ( AVAILABLE ?auto_16189 ) ( SURFACE-AT ?auto_16184 ?auto_16191 ) ( ON ?auto_16184 ?auto_16186 ) ( CLEAR ?auto_16184 ) ( not ( = ?auto_16184 ?auto_16186 ) ) ( not ( = ?auto_16185 ?auto_16186 ) ) ( SURFACE-AT ?auto_16188 ?auto_16192 ) ( CLEAR ?auto_16188 ) ( IS-CRATE ?auto_16185 ) ( not ( = ?auto_16184 ?auto_16188 ) ) ( not ( = ?auto_16185 ?auto_16188 ) ) ( not ( = ?auto_16186 ?auto_16188 ) ) ( AVAILABLE ?auto_16190 ) ( TRUCK-AT ?auto_16187 ?auto_16193 ) ( not ( = ?auto_16193 ?auto_16192 ) ) ( not ( = ?auto_16191 ?auto_16193 ) ) ( HOIST-AT ?auto_16194 ?auto_16193 ) ( LIFTING ?auto_16194 ?auto_16185 ) ( not ( = ?auto_16190 ?auto_16194 ) ) ( not ( = ?auto_16189 ?auto_16194 ) ) )
    :subtasks
    ( ( !LOAD ?auto_16194 ?auto_16185 ?auto_16187 ?auto_16193 )
      ( MAKE-ON ?auto_16184 ?auto_16185 )
      ( MAKE-ON-VERIFY ?auto_16184 ?auto_16185 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16195 - SURFACE
      ?auto_16196 - SURFACE
    )
    :vars
    (
      ?auto_16205 - HOIST
      ?auto_16202 - PLACE
      ?auto_16201 - PLACE
      ?auto_16198 - HOIST
      ?auto_16204 - SURFACE
      ?auto_16200 - SURFACE
      ?auto_16199 - TRUCK
      ?auto_16197 - PLACE
      ?auto_16203 - HOIST
      ?auto_16206 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16205 ?auto_16202 ) ( IS-CRATE ?auto_16195 ) ( not ( = ?auto_16195 ?auto_16196 ) ) ( not ( = ?auto_16201 ?auto_16202 ) ) ( HOIST-AT ?auto_16198 ?auto_16201 ) ( not ( = ?auto_16205 ?auto_16198 ) ) ( AVAILABLE ?auto_16198 ) ( SURFACE-AT ?auto_16195 ?auto_16201 ) ( ON ?auto_16195 ?auto_16204 ) ( CLEAR ?auto_16195 ) ( not ( = ?auto_16195 ?auto_16204 ) ) ( not ( = ?auto_16196 ?auto_16204 ) ) ( SURFACE-AT ?auto_16200 ?auto_16202 ) ( CLEAR ?auto_16200 ) ( IS-CRATE ?auto_16196 ) ( not ( = ?auto_16195 ?auto_16200 ) ) ( not ( = ?auto_16196 ?auto_16200 ) ) ( not ( = ?auto_16204 ?auto_16200 ) ) ( AVAILABLE ?auto_16205 ) ( TRUCK-AT ?auto_16199 ?auto_16197 ) ( not ( = ?auto_16197 ?auto_16202 ) ) ( not ( = ?auto_16201 ?auto_16197 ) ) ( HOIST-AT ?auto_16203 ?auto_16197 ) ( not ( = ?auto_16205 ?auto_16203 ) ) ( not ( = ?auto_16198 ?auto_16203 ) ) ( AVAILABLE ?auto_16203 ) ( SURFACE-AT ?auto_16196 ?auto_16197 ) ( ON ?auto_16196 ?auto_16206 ) ( CLEAR ?auto_16196 ) ( not ( = ?auto_16195 ?auto_16206 ) ) ( not ( = ?auto_16196 ?auto_16206 ) ) ( not ( = ?auto_16204 ?auto_16206 ) ) ( not ( = ?auto_16200 ?auto_16206 ) ) )
    :subtasks
    ( ( !LIFT ?auto_16203 ?auto_16196 ?auto_16206 ?auto_16197 )
      ( MAKE-ON ?auto_16195 ?auto_16196 )
      ( MAKE-ON-VERIFY ?auto_16195 ?auto_16196 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16207 - SURFACE
      ?auto_16208 - SURFACE
    )
    :vars
    (
      ?auto_16216 - HOIST
      ?auto_16218 - PLACE
      ?auto_16211 - PLACE
      ?auto_16209 - HOIST
      ?auto_16210 - SURFACE
      ?auto_16213 - SURFACE
      ?auto_16217 - PLACE
      ?auto_16215 - HOIST
      ?auto_16214 - SURFACE
      ?auto_16212 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16216 ?auto_16218 ) ( IS-CRATE ?auto_16207 ) ( not ( = ?auto_16207 ?auto_16208 ) ) ( not ( = ?auto_16211 ?auto_16218 ) ) ( HOIST-AT ?auto_16209 ?auto_16211 ) ( not ( = ?auto_16216 ?auto_16209 ) ) ( AVAILABLE ?auto_16209 ) ( SURFACE-AT ?auto_16207 ?auto_16211 ) ( ON ?auto_16207 ?auto_16210 ) ( CLEAR ?auto_16207 ) ( not ( = ?auto_16207 ?auto_16210 ) ) ( not ( = ?auto_16208 ?auto_16210 ) ) ( SURFACE-AT ?auto_16213 ?auto_16218 ) ( CLEAR ?auto_16213 ) ( IS-CRATE ?auto_16208 ) ( not ( = ?auto_16207 ?auto_16213 ) ) ( not ( = ?auto_16208 ?auto_16213 ) ) ( not ( = ?auto_16210 ?auto_16213 ) ) ( AVAILABLE ?auto_16216 ) ( not ( = ?auto_16217 ?auto_16218 ) ) ( not ( = ?auto_16211 ?auto_16217 ) ) ( HOIST-AT ?auto_16215 ?auto_16217 ) ( not ( = ?auto_16216 ?auto_16215 ) ) ( not ( = ?auto_16209 ?auto_16215 ) ) ( AVAILABLE ?auto_16215 ) ( SURFACE-AT ?auto_16208 ?auto_16217 ) ( ON ?auto_16208 ?auto_16214 ) ( CLEAR ?auto_16208 ) ( not ( = ?auto_16207 ?auto_16214 ) ) ( not ( = ?auto_16208 ?auto_16214 ) ) ( not ( = ?auto_16210 ?auto_16214 ) ) ( not ( = ?auto_16213 ?auto_16214 ) ) ( TRUCK-AT ?auto_16212 ?auto_16218 ) )
    :subtasks
    ( ( !DRIVE ?auto_16212 ?auto_16218 ?auto_16217 )
      ( MAKE-ON ?auto_16207 ?auto_16208 )
      ( MAKE-ON-VERIFY ?auto_16207 ?auto_16208 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16219 - SURFACE
      ?auto_16220 - SURFACE
    )
    :vars
    (
      ?auto_16222 - HOIST
      ?auto_16225 - PLACE
      ?auto_16224 - PLACE
      ?auto_16227 - HOIST
      ?auto_16226 - SURFACE
      ?auto_16229 - SURFACE
      ?auto_16221 - PLACE
      ?auto_16230 - HOIST
      ?auto_16228 - SURFACE
      ?auto_16223 - TRUCK
      ?auto_16231 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16222 ?auto_16225 ) ( IS-CRATE ?auto_16219 ) ( not ( = ?auto_16219 ?auto_16220 ) ) ( not ( = ?auto_16224 ?auto_16225 ) ) ( HOIST-AT ?auto_16227 ?auto_16224 ) ( not ( = ?auto_16222 ?auto_16227 ) ) ( AVAILABLE ?auto_16227 ) ( SURFACE-AT ?auto_16219 ?auto_16224 ) ( ON ?auto_16219 ?auto_16226 ) ( CLEAR ?auto_16219 ) ( not ( = ?auto_16219 ?auto_16226 ) ) ( not ( = ?auto_16220 ?auto_16226 ) ) ( IS-CRATE ?auto_16220 ) ( not ( = ?auto_16219 ?auto_16229 ) ) ( not ( = ?auto_16220 ?auto_16229 ) ) ( not ( = ?auto_16226 ?auto_16229 ) ) ( not ( = ?auto_16221 ?auto_16225 ) ) ( not ( = ?auto_16224 ?auto_16221 ) ) ( HOIST-AT ?auto_16230 ?auto_16221 ) ( not ( = ?auto_16222 ?auto_16230 ) ) ( not ( = ?auto_16227 ?auto_16230 ) ) ( AVAILABLE ?auto_16230 ) ( SURFACE-AT ?auto_16220 ?auto_16221 ) ( ON ?auto_16220 ?auto_16228 ) ( CLEAR ?auto_16220 ) ( not ( = ?auto_16219 ?auto_16228 ) ) ( not ( = ?auto_16220 ?auto_16228 ) ) ( not ( = ?auto_16226 ?auto_16228 ) ) ( not ( = ?auto_16229 ?auto_16228 ) ) ( TRUCK-AT ?auto_16223 ?auto_16225 ) ( SURFACE-AT ?auto_16231 ?auto_16225 ) ( CLEAR ?auto_16231 ) ( LIFTING ?auto_16222 ?auto_16229 ) ( IS-CRATE ?auto_16229 ) ( not ( = ?auto_16219 ?auto_16231 ) ) ( not ( = ?auto_16220 ?auto_16231 ) ) ( not ( = ?auto_16226 ?auto_16231 ) ) ( not ( = ?auto_16229 ?auto_16231 ) ) ( not ( = ?auto_16228 ?auto_16231 ) ) )
    :subtasks
    ( ( !DROP ?auto_16222 ?auto_16229 ?auto_16231 ?auto_16225 )
      ( MAKE-ON ?auto_16219 ?auto_16220 )
      ( MAKE-ON-VERIFY ?auto_16219 ?auto_16220 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16232 - SURFACE
      ?auto_16233 - SURFACE
    )
    :vars
    (
      ?auto_16239 - HOIST
      ?auto_16241 - PLACE
      ?auto_16240 - PLACE
      ?auto_16242 - HOIST
      ?auto_16238 - SURFACE
      ?auto_16235 - SURFACE
      ?auto_16234 - PLACE
      ?auto_16243 - HOIST
      ?auto_16244 - SURFACE
      ?auto_16237 - TRUCK
      ?auto_16236 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16239 ?auto_16241 ) ( IS-CRATE ?auto_16232 ) ( not ( = ?auto_16232 ?auto_16233 ) ) ( not ( = ?auto_16240 ?auto_16241 ) ) ( HOIST-AT ?auto_16242 ?auto_16240 ) ( not ( = ?auto_16239 ?auto_16242 ) ) ( AVAILABLE ?auto_16242 ) ( SURFACE-AT ?auto_16232 ?auto_16240 ) ( ON ?auto_16232 ?auto_16238 ) ( CLEAR ?auto_16232 ) ( not ( = ?auto_16232 ?auto_16238 ) ) ( not ( = ?auto_16233 ?auto_16238 ) ) ( IS-CRATE ?auto_16233 ) ( not ( = ?auto_16232 ?auto_16235 ) ) ( not ( = ?auto_16233 ?auto_16235 ) ) ( not ( = ?auto_16238 ?auto_16235 ) ) ( not ( = ?auto_16234 ?auto_16241 ) ) ( not ( = ?auto_16240 ?auto_16234 ) ) ( HOIST-AT ?auto_16243 ?auto_16234 ) ( not ( = ?auto_16239 ?auto_16243 ) ) ( not ( = ?auto_16242 ?auto_16243 ) ) ( AVAILABLE ?auto_16243 ) ( SURFACE-AT ?auto_16233 ?auto_16234 ) ( ON ?auto_16233 ?auto_16244 ) ( CLEAR ?auto_16233 ) ( not ( = ?auto_16232 ?auto_16244 ) ) ( not ( = ?auto_16233 ?auto_16244 ) ) ( not ( = ?auto_16238 ?auto_16244 ) ) ( not ( = ?auto_16235 ?auto_16244 ) ) ( TRUCK-AT ?auto_16237 ?auto_16241 ) ( SURFACE-AT ?auto_16236 ?auto_16241 ) ( CLEAR ?auto_16236 ) ( IS-CRATE ?auto_16235 ) ( not ( = ?auto_16232 ?auto_16236 ) ) ( not ( = ?auto_16233 ?auto_16236 ) ) ( not ( = ?auto_16238 ?auto_16236 ) ) ( not ( = ?auto_16235 ?auto_16236 ) ) ( not ( = ?auto_16244 ?auto_16236 ) ) ( AVAILABLE ?auto_16239 ) ( IN ?auto_16235 ?auto_16237 ) )
    :subtasks
    ( ( !UNLOAD ?auto_16239 ?auto_16235 ?auto_16237 ?auto_16241 )
      ( MAKE-ON ?auto_16232 ?auto_16233 )
      ( MAKE-ON-VERIFY ?auto_16232 ?auto_16233 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16245 - SURFACE
      ?auto_16246 - SURFACE
    )
    :vars
    (
      ?auto_16251 - HOIST
      ?auto_16254 - PLACE
      ?auto_16250 - PLACE
      ?auto_16247 - HOIST
      ?auto_16257 - SURFACE
      ?auto_16248 - SURFACE
      ?auto_16255 - PLACE
      ?auto_16253 - HOIST
      ?auto_16252 - SURFACE
      ?auto_16256 - SURFACE
      ?auto_16249 - TRUCK
      ?auto_16258 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16251 ?auto_16254 ) ( IS-CRATE ?auto_16245 ) ( not ( = ?auto_16245 ?auto_16246 ) ) ( not ( = ?auto_16250 ?auto_16254 ) ) ( HOIST-AT ?auto_16247 ?auto_16250 ) ( not ( = ?auto_16251 ?auto_16247 ) ) ( AVAILABLE ?auto_16247 ) ( SURFACE-AT ?auto_16245 ?auto_16250 ) ( ON ?auto_16245 ?auto_16257 ) ( CLEAR ?auto_16245 ) ( not ( = ?auto_16245 ?auto_16257 ) ) ( not ( = ?auto_16246 ?auto_16257 ) ) ( IS-CRATE ?auto_16246 ) ( not ( = ?auto_16245 ?auto_16248 ) ) ( not ( = ?auto_16246 ?auto_16248 ) ) ( not ( = ?auto_16257 ?auto_16248 ) ) ( not ( = ?auto_16255 ?auto_16254 ) ) ( not ( = ?auto_16250 ?auto_16255 ) ) ( HOIST-AT ?auto_16253 ?auto_16255 ) ( not ( = ?auto_16251 ?auto_16253 ) ) ( not ( = ?auto_16247 ?auto_16253 ) ) ( AVAILABLE ?auto_16253 ) ( SURFACE-AT ?auto_16246 ?auto_16255 ) ( ON ?auto_16246 ?auto_16252 ) ( CLEAR ?auto_16246 ) ( not ( = ?auto_16245 ?auto_16252 ) ) ( not ( = ?auto_16246 ?auto_16252 ) ) ( not ( = ?auto_16257 ?auto_16252 ) ) ( not ( = ?auto_16248 ?auto_16252 ) ) ( SURFACE-AT ?auto_16256 ?auto_16254 ) ( CLEAR ?auto_16256 ) ( IS-CRATE ?auto_16248 ) ( not ( = ?auto_16245 ?auto_16256 ) ) ( not ( = ?auto_16246 ?auto_16256 ) ) ( not ( = ?auto_16257 ?auto_16256 ) ) ( not ( = ?auto_16248 ?auto_16256 ) ) ( not ( = ?auto_16252 ?auto_16256 ) ) ( AVAILABLE ?auto_16251 ) ( IN ?auto_16248 ?auto_16249 ) ( TRUCK-AT ?auto_16249 ?auto_16258 ) ( not ( = ?auto_16258 ?auto_16254 ) ) ( not ( = ?auto_16250 ?auto_16258 ) ) ( not ( = ?auto_16255 ?auto_16258 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16249 ?auto_16258 ?auto_16254 )
      ( MAKE-ON ?auto_16245 ?auto_16246 )
      ( MAKE-ON-VERIFY ?auto_16245 ?auto_16246 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16259 - SURFACE
      ?auto_16260 - SURFACE
    )
    :vars
    (
      ?auto_16268 - HOIST
      ?auto_16270 - PLACE
      ?auto_16263 - PLACE
      ?auto_16262 - HOIST
      ?auto_16264 - SURFACE
      ?auto_16261 - SURFACE
      ?auto_16267 - PLACE
      ?auto_16271 - HOIST
      ?auto_16269 - SURFACE
      ?auto_16265 - SURFACE
      ?auto_16266 - TRUCK
      ?auto_16272 - PLACE
      ?auto_16273 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16268 ?auto_16270 ) ( IS-CRATE ?auto_16259 ) ( not ( = ?auto_16259 ?auto_16260 ) ) ( not ( = ?auto_16263 ?auto_16270 ) ) ( HOIST-AT ?auto_16262 ?auto_16263 ) ( not ( = ?auto_16268 ?auto_16262 ) ) ( AVAILABLE ?auto_16262 ) ( SURFACE-AT ?auto_16259 ?auto_16263 ) ( ON ?auto_16259 ?auto_16264 ) ( CLEAR ?auto_16259 ) ( not ( = ?auto_16259 ?auto_16264 ) ) ( not ( = ?auto_16260 ?auto_16264 ) ) ( IS-CRATE ?auto_16260 ) ( not ( = ?auto_16259 ?auto_16261 ) ) ( not ( = ?auto_16260 ?auto_16261 ) ) ( not ( = ?auto_16264 ?auto_16261 ) ) ( not ( = ?auto_16267 ?auto_16270 ) ) ( not ( = ?auto_16263 ?auto_16267 ) ) ( HOIST-AT ?auto_16271 ?auto_16267 ) ( not ( = ?auto_16268 ?auto_16271 ) ) ( not ( = ?auto_16262 ?auto_16271 ) ) ( AVAILABLE ?auto_16271 ) ( SURFACE-AT ?auto_16260 ?auto_16267 ) ( ON ?auto_16260 ?auto_16269 ) ( CLEAR ?auto_16260 ) ( not ( = ?auto_16259 ?auto_16269 ) ) ( not ( = ?auto_16260 ?auto_16269 ) ) ( not ( = ?auto_16264 ?auto_16269 ) ) ( not ( = ?auto_16261 ?auto_16269 ) ) ( SURFACE-AT ?auto_16265 ?auto_16270 ) ( CLEAR ?auto_16265 ) ( IS-CRATE ?auto_16261 ) ( not ( = ?auto_16259 ?auto_16265 ) ) ( not ( = ?auto_16260 ?auto_16265 ) ) ( not ( = ?auto_16264 ?auto_16265 ) ) ( not ( = ?auto_16261 ?auto_16265 ) ) ( not ( = ?auto_16269 ?auto_16265 ) ) ( AVAILABLE ?auto_16268 ) ( TRUCK-AT ?auto_16266 ?auto_16272 ) ( not ( = ?auto_16272 ?auto_16270 ) ) ( not ( = ?auto_16263 ?auto_16272 ) ) ( not ( = ?auto_16267 ?auto_16272 ) ) ( HOIST-AT ?auto_16273 ?auto_16272 ) ( LIFTING ?auto_16273 ?auto_16261 ) ( not ( = ?auto_16268 ?auto_16273 ) ) ( not ( = ?auto_16262 ?auto_16273 ) ) ( not ( = ?auto_16271 ?auto_16273 ) ) )
    :subtasks
    ( ( !LOAD ?auto_16273 ?auto_16261 ?auto_16266 ?auto_16272 )
      ( MAKE-ON ?auto_16259 ?auto_16260 )
      ( MAKE-ON-VERIFY ?auto_16259 ?auto_16260 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16274 - SURFACE
      ?auto_16275 - SURFACE
    )
    :vars
    (
      ?auto_16278 - HOIST
      ?auto_16286 - PLACE
      ?auto_16287 - PLACE
      ?auto_16280 - HOIST
      ?auto_16279 - SURFACE
      ?auto_16285 - SURFACE
      ?auto_16283 - PLACE
      ?auto_16277 - HOIST
      ?auto_16284 - SURFACE
      ?auto_16276 - SURFACE
      ?auto_16288 - TRUCK
      ?auto_16281 - PLACE
      ?auto_16282 - HOIST
      ?auto_16289 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16278 ?auto_16286 ) ( IS-CRATE ?auto_16274 ) ( not ( = ?auto_16274 ?auto_16275 ) ) ( not ( = ?auto_16287 ?auto_16286 ) ) ( HOIST-AT ?auto_16280 ?auto_16287 ) ( not ( = ?auto_16278 ?auto_16280 ) ) ( AVAILABLE ?auto_16280 ) ( SURFACE-AT ?auto_16274 ?auto_16287 ) ( ON ?auto_16274 ?auto_16279 ) ( CLEAR ?auto_16274 ) ( not ( = ?auto_16274 ?auto_16279 ) ) ( not ( = ?auto_16275 ?auto_16279 ) ) ( IS-CRATE ?auto_16275 ) ( not ( = ?auto_16274 ?auto_16285 ) ) ( not ( = ?auto_16275 ?auto_16285 ) ) ( not ( = ?auto_16279 ?auto_16285 ) ) ( not ( = ?auto_16283 ?auto_16286 ) ) ( not ( = ?auto_16287 ?auto_16283 ) ) ( HOIST-AT ?auto_16277 ?auto_16283 ) ( not ( = ?auto_16278 ?auto_16277 ) ) ( not ( = ?auto_16280 ?auto_16277 ) ) ( AVAILABLE ?auto_16277 ) ( SURFACE-AT ?auto_16275 ?auto_16283 ) ( ON ?auto_16275 ?auto_16284 ) ( CLEAR ?auto_16275 ) ( not ( = ?auto_16274 ?auto_16284 ) ) ( not ( = ?auto_16275 ?auto_16284 ) ) ( not ( = ?auto_16279 ?auto_16284 ) ) ( not ( = ?auto_16285 ?auto_16284 ) ) ( SURFACE-AT ?auto_16276 ?auto_16286 ) ( CLEAR ?auto_16276 ) ( IS-CRATE ?auto_16285 ) ( not ( = ?auto_16274 ?auto_16276 ) ) ( not ( = ?auto_16275 ?auto_16276 ) ) ( not ( = ?auto_16279 ?auto_16276 ) ) ( not ( = ?auto_16285 ?auto_16276 ) ) ( not ( = ?auto_16284 ?auto_16276 ) ) ( AVAILABLE ?auto_16278 ) ( TRUCK-AT ?auto_16288 ?auto_16281 ) ( not ( = ?auto_16281 ?auto_16286 ) ) ( not ( = ?auto_16287 ?auto_16281 ) ) ( not ( = ?auto_16283 ?auto_16281 ) ) ( HOIST-AT ?auto_16282 ?auto_16281 ) ( not ( = ?auto_16278 ?auto_16282 ) ) ( not ( = ?auto_16280 ?auto_16282 ) ) ( not ( = ?auto_16277 ?auto_16282 ) ) ( AVAILABLE ?auto_16282 ) ( SURFACE-AT ?auto_16285 ?auto_16281 ) ( ON ?auto_16285 ?auto_16289 ) ( CLEAR ?auto_16285 ) ( not ( = ?auto_16274 ?auto_16289 ) ) ( not ( = ?auto_16275 ?auto_16289 ) ) ( not ( = ?auto_16279 ?auto_16289 ) ) ( not ( = ?auto_16285 ?auto_16289 ) ) ( not ( = ?auto_16284 ?auto_16289 ) ) ( not ( = ?auto_16276 ?auto_16289 ) ) )
    :subtasks
    ( ( !LIFT ?auto_16282 ?auto_16285 ?auto_16289 ?auto_16281 )
      ( MAKE-ON ?auto_16274 ?auto_16275 )
      ( MAKE-ON-VERIFY ?auto_16274 ?auto_16275 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16290 - SURFACE
      ?auto_16291 - SURFACE
    )
    :vars
    (
      ?auto_16301 - HOIST
      ?auto_16293 - PLACE
      ?auto_16297 - PLACE
      ?auto_16294 - HOIST
      ?auto_16300 - SURFACE
      ?auto_16302 - SURFACE
      ?auto_16292 - PLACE
      ?auto_16296 - HOIST
      ?auto_16303 - SURFACE
      ?auto_16304 - SURFACE
      ?auto_16295 - PLACE
      ?auto_16299 - HOIST
      ?auto_16305 - SURFACE
      ?auto_16298 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16301 ?auto_16293 ) ( IS-CRATE ?auto_16290 ) ( not ( = ?auto_16290 ?auto_16291 ) ) ( not ( = ?auto_16297 ?auto_16293 ) ) ( HOIST-AT ?auto_16294 ?auto_16297 ) ( not ( = ?auto_16301 ?auto_16294 ) ) ( AVAILABLE ?auto_16294 ) ( SURFACE-AT ?auto_16290 ?auto_16297 ) ( ON ?auto_16290 ?auto_16300 ) ( CLEAR ?auto_16290 ) ( not ( = ?auto_16290 ?auto_16300 ) ) ( not ( = ?auto_16291 ?auto_16300 ) ) ( IS-CRATE ?auto_16291 ) ( not ( = ?auto_16290 ?auto_16302 ) ) ( not ( = ?auto_16291 ?auto_16302 ) ) ( not ( = ?auto_16300 ?auto_16302 ) ) ( not ( = ?auto_16292 ?auto_16293 ) ) ( not ( = ?auto_16297 ?auto_16292 ) ) ( HOIST-AT ?auto_16296 ?auto_16292 ) ( not ( = ?auto_16301 ?auto_16296 ) ) ( not ( = ?auto_16294 ?auto_16296 ) ) ( AVAILABLE ?auto_16296 ) ( SURFACE-AT ?auto_16291 ?auto_16292 ) ( ON ?auto_16291 ?auto_16303 ) ( CLEAR ?auto_16291 ) ( not ( = ?auto_16290 ?auto_16303 ) ) ( not ( = ?auto_16291 ?auto_16303 ) ) ( not ( = ?auto_16300 ?auto_16303 ) ) ( not ( = ?auto_16302 ?auto_16303 ) ) ( SURFACE-AT ?auto_16304 ?auto_16293 ) ( CLEAR ?auto_16304 ) ( IS-CRATE ?auto_16302 ) ( not ( = ?auto_16290 ?auto_16304 ) ) ( not ( = ?auto_16291 ?auto_16304 ) ) ( not ( = ?auto_16300 ?auto_16304 ) ) ( not ( = ?auto_16302 ?auto_16304 ) ) ( not ( = ?auto_16303 ?auto_16304 ) ) ( AVAILABLE ?auto_16301 ) ( not ( = ?auto_16295 ?auto_16293 ) ) ( not ( = ?auto_16297 ?auto_16295 ) ) ( not ( = ?auto_16292 ?auto_16295 ) ) ( HOIST-AT ?auto_16299 ?auto_16295 ) ( not ( = ?auto_16301 ?auto_16299 ) ) ( not ( = ?auto_16294 ?auto_16299 ) ) ( not ( = ?auto_16296 ?auto_16299 ) ) ( AVAILABLE ?auto_16299 ) ( SURFACE-AT ?auto_16302 ?auto_16295 ) ( ON ?auto_16302 ?auto_16305 ) ( CLEAR ?auto_16302 ) ( not ( = ?auto_16290 ?auto_16305 ) ) ( not ( = ?auto_16291 ?auto_16305 ) ) ( not ( = ?auto_16300 ?auto_16305 ) ) ( not ( = ?auto_16302 ?auto_16305 ) ) ( not ( = ?auto_16303 ?auto_16305 ) ) ( not ( = ?auto_16304 ?auto_16305 ) ) ( TRUCK-AT ?auto_16298 ?auto_16293 ) )
    :subtasks
    ( ( !DRIVE ?auto_16298 ?auto_16293 ?auto_16295 )
      ( MAKE-ON ?auto_16290 ?auto_16291 )
      ( MAKE-ON-VERIFY ?auto_16290 ?auto_16291 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16306 - SURFACE
      ?auto_16307 - SURFACE
    )
    :vars
    (
      ?auto_16313 - HOIST
      ?auto_16317 - PLACE
      ?auto_16312 - PLACE
      ?auto_16314 - HOIST
      ?auto_16321 - SURFACE
      ?auto_16309 - SURFACE
      ?auto_16311 - PLACE
      ?auto_16310 - HOIST
      ?auto_16318 - SURFACE
      ?auto_16308 - SURFACE
      ?auto_16320 - PLACE
      ?auto_16316 - HOIST
      ?auto_16319 - SURFACE
      ?auto_16315 - TRUCK
      ?auto_16322 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16313 ?auto_16317 ) ( IS-CRATE ?auto_16306 ) ( not ( = ?auto_16306 ?auto_16307 ) ) ( not ( = ?auto_16312 ?auto_16317 ) ) ( HOIST-AT ?auto_16314 ?auto_16312 ) ( not ( = ?auto_16313 ?auto_16314 ) ) ( AVAILABLE ?auto_16314 ) ( SURFACE-AT ?auto_16306 ?auto_16312 ) ( ON ?auto_16306 ?auto_16321 ) ( CLEAR ?auto_16306 ) ( not ( = ?auto_16306 ?auto_16321 ) ) ( not ( = ?auto_16307 ?auto_16321 ) ) ( IS-CRATE ?auto_16307 ) ( not ( = ?auto_16306 ?auto_16309 ) ) ( not ( = ?auto_16307 ?auto_16309 ) ) ( not ( = ?auto_16321 ?auto_16309 ) ) ( not ( = ?auto_16311 ?auto_16317 ) ) ( not ( = ?auto_16312 ?auto_16311 ) ) ( HOIST-AT ?auto_16310 ?auto_16311 ) ( not ( = ?auto_16313 ?auto_16310 ) ) ( not ( = ?auto_16314 ?auto_16310 ) ) ( AVAILABLE ?auto_16310 ) ( SURFACE-AT ?auto_16307 ?auto_16311 ) ( ON ?auto_16307 ?auto_16318 ) ( CLEAR ?auto_16307 ) ( not ( = ?auto_16306 ?auto_16318 ) ) ( not ( = ?auto_16307 ?auto_16318 ) ) ( not ( = ?auto_16321 ?auto_16318 ) ) ( not ( = ?auto_16309 ?auto_16318 ) ) ( IS-CRATE ?auto_16309 ) ( not ( = ?auto_16306 ?auto_16308 ) ) ( not ( = ?auto_16307 ?auto_16308 ) ) ( not ( = ?auto_16321 ?auto_16308 ) ) ( not ( = ?auto_16309 ?auto_16308 ) ) ( not ( = ?auto_16318 ?auto_16308 ) ) ( not ( = ?auto_16320 ?auto_16317 ) ) ( not ( = ?auto_16312 ?auto_16320 ) ) ( not ( = ?auto_16311 ?auto_16320 ) ) ( HOIST-AT ?auto_16316 ?auto_16320 ) ( not ( = ?auto_16313 ?auto_16316 ) ) ( not ( = ?auto_16314 ?auto_16316 ) ) ( not ( = ?auto_16310 ?auto_16316 ) ) ( AVAILABLE ?auto_16316 ) ( SURFACE-AT ?auto_16309 ?auto_16320 ) ( ON ?auto_16309 ?auto_16319 ) ( CLEAR ?auto_16309 ) ( not ( = ?auto_16306 ?auto_16319 ) ) ( not ( = ?auto_16307 ?auto_16319 ) ) ( not ( = ?auto_16321 ?auto_16319 ) ) ( not ( = ?auto_16309 ?auto_16319 ) ) ( not ( = ?auto_16318 ?auto_16319 ) ) ( not ( = ?auto_16308 ?auto_16319 ) ) ( TRUCK-AT ?auto_16315 ?auto_16317 ) ( SURFACE-AT ?auto_16322 ?auto_16317 ) ( CLEAR ?auto_16322 ) ( LIFTING ?auto_16313 ?auto_16308 ) ( IS-CRATE ?auto_16308 ) ( not ( = ?auto_16306 ?auto_16322 ) ) ( not ( = ?auto_16307 ?auto_16322 ) ) ( not ( = ?auto_16321 ?auto_16322 ) ) ( not ( = ?auto_16309 ?auto_16322 ) ) ( not ( = ?auto_16318 ?auto_16322 ) ) ( not ( = ?auto_16308 ?auto_16322 ) ) ( not ( = ?auto_16319 ?auto_16322 ) ) )
    :subtasks
    ( ( !DROP ?auto_16313 ?auto_16308 ?auto_16322 ?auto_16317 )
      ( MAKE-ON ?auto_16306 ?auto_16307 )
      ( MAKE-ON-VERIFY ?auto_16306 ?auto_16307 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16323 - SURFACE
      ?auto_16324 - SURFACE
    )
    :vars
    (
      ?auto_16336 - HOIST
      ?auto_16333 - PLACE
      ?auto_16334 - PLACE
      ?auto_16327 - HOIST
      ?auto_16337 - SURFACE
      ?auto_16338 - SURFACE
      ?auto_16339 - PLACE
      ?auto_16331 - HOIST
      ?auto_16329 - SURFACE
      ?auto_16332 - SURFACE
      ?auto_16330 - PLACE
      ?auto_16325 - HOIST
      ?auto_16326 - SURFACE
      ?auto_16335 - TRUCK
      ?auto_16328 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16336 ?auto_16333 ) ( IS-CRATE ?auto_16323 ) ( not ( = ?auto_16323 ?auto_16324 ) ) ( not ( = ?auto_16334 ?auto_16333 ) ) ( HOIST-AT ?auto_16327 ?auto_16334 ) ( not ( = ?auto_16336 ?auto_16327 ) ) ( AVAILABLE ?auto_16327 ) ( SURFACE-AT ?auto_16323 ?auto_16334 ) ( ON ?auto_16323 ?auto_16337 ) ( CLEAR ?auto_16323 ) ( not ( = ?auto_16323 ?auto_16337 ) ) ( not ( = ?auto_16324 ?auto_16337 ) ) ( IS-CRATE ?auto_16324 ) ( not ( = ?auto_16323 ?auto_16338 ) ) ( not ( = ?auto_16324 ?auto_16338 ) ) ( not ( = ?auto_16337 ?auto_16338 ) ) ( not ( = ?auto_16339 ?auto_16333 ) ) ( not ( = ?auto_16334 ?auto_16339 ) ) ( HOIST-AT ?auto_16331 ?auto_16339 ) ( not ( = ?auto_16336 ?auto_16331 ) ) ( not ( = ?auto_16327 ?auto_16331 ) ) ( AVAILABLE ?auto_16331 ) ( SURFACE-AT ?auto_16324 ?auto_16339 ) ( ON ?auto_16324 ?auto_16329 ) ( CLEAR ?auto_16324 ) ( not ( = ?auto_16323 ?auto_16329 ) ) ( not ( = ?auto_16324 ?auto_16329 ) ) ( not ( = ?auto_16337 ?auto_16329 ) ) ( not ( = ?auto_16338 ?auto_16329 ) ) ( IS-CRATE ?auto_16338 ) ( not ( = ?auto_16323 ?auto_16332 ) ) ( not ( = ?auto_16324 ?auto_16332 ) ) ( not ( = ?auto_16337 ?auto_16332 ) ) ( not ( = ?auto_16338 ?auto_16332 ) ) ( not ( = ?auto_16329 ?auto_16332 ) ) ( not ( = ?auto_16330 ?auto_16333 ) ) ( not ( = ?auto_16334 ?auto_16330 ) ) ( not ( = ?auto_16339 ?auto_16330 ) ) ( HOIST-AT ?auto_16325 ?auto_16330 ) ( not ( = ?auto_16336 ?auto_16325 ) ) ( not ( = ?auto_16327 ?auto_16325 ) ) ( not ( = ?auto_16331 ?auto_16325 ) ) ( AVAILABLE ?auto_16325 ) ( SURFACE-AT ?auto_16338 ?auto_16330 ) ( ON ?auto_16338 ?auto_16326 ) ( CLEAR ?auto_16338 ) ( not ( = ?auto_16323 ?auto_16326 ) ) ( not ( = ?auto_16324 ?auto_16326 ) ) ( not ( = ?auto_16337 ?auto_16326 ) ) ( not ( = ?auto_16338 ?auto_16326 ) ) ( not ( = ?auto_16329 ?auto_16326 ) ) ( not ( = ?auto_16332 ?auto_16326 ) ) ( TRUCK-AT ?auto_16335 ?auto_16333 ) ( SURFACE-AT ?auto_16328 ?auto_16333 ) ( CLEAR ?auto_16328 ) ( IS-CRATE ?auto_16332 ) ( not ( = ?auto_16323 ?auto_16328 ) ) ( not ( = ?auto_16324 ?auto_16328 ) ) ( not ( = ?auto_16337 ?auto_16328 ) ) ( not ( = ?auto_16338 ?auto_16328 ) ) ( not ( = ?auto_16329 ?auto_16328 ) ) ( not ( = ?auto_16332 ?auto_16328 ) ) ( not ( = ?auto_16326 ?auto_16328 ) ) ( AVAILABLE ?auto_16336 ) ( IN ?auto_16332 ?auto_16335 ) )
    :subtasks
    ( ( !UNLOAD ?auto_16336 ?auto_16332 ?auto_16335 ?auto_16333 )
      ( MAKE-ON ?auto_16323 ?auto_16324 )
      ( MAKE-ON-VERIFY ?auto_16323 ?auto_16324 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16340 - SURFACE
      ?auto_16341 - SURFACE
    )
    :vars
    (
      ?auto_16342 - HOIST
      ?auto_16346 - PLACE
      ?auto_16348 - PLACE
      ?auto_16353 - HOIST
      ?auto_16347 - SURFACE
      ?auto_16354 - SURFACE
      ?auto_16352 - PLACE
      ?auto_16345 - HOIST
      ?auto_16344 - SURFACE
      ?auto_16343 - SURFACE
      ?auto_16356 - PLACE
      ?auto_16351 - HOIST
      ?auto_16349 - SURFACE
      ?auto_16350 - SURFACE
      ?auto_16355 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16342 ?auto_16346 ) ( IS-CRATE ?auto_16340 ) ( not ( = ?auto_16340 ?auto_16341 ) ) ( not ( = ?auto_16348 ?auto_16346 ) ) ( HOIST-AT ?auto_16353 ?auto_16348 ) ( not ( = ?auto_16342 ?auto_16353 ) ) ( AVAILABLE ?auto_16353 ) ( SURFACE-AT ?auto_16340 ?auto_16348 ) ( ON ?auto_16340 ?auto_16347 ) ( CLEAR ?auto_16340 ) ( not ( = ?auto_16340 ?auto_16347 ) ) ( not ( = ?auto_16341 ?auto_16347 ) ) ( IS-CRATE ?auto_16341 ) ( not ( = ?auto_16340 ?auto_16354 ) ) ( not ( = ?auto_16341 ?auto_16354 ) ) ( not ( = ?auto_16347 ?auto_16354 ) ) ( not ( = ?auto_16352 ?auto_16346 ) ) ( not ( = ?auto_16348 ?auto_16352 ) ) ( HOIST-AT ?auto_16345 ?auto_16352 ) ( not ( = ?auto_16342 ?auto_16345 ) ) ( not ( = ?auto_16353 ?auto_16345 ) ) ( AVAILABLE ?auto_16345 ) ( SURFACE-AT ?auto_16341 ?auto_16352 ) ( ON ?auto_16341 ?auto_16344 ) ( CLEAR ?auto_16341 ) ( not ( = ?auto_16340 ?auto_16344 ) ) ( not ( = ?auto_16341 ?auto_16344 ) ) ( not ( = ?auto_16347 ?auto_16344 ) ) ( not ( = ?auto_16354 ?auto_16344 ) ) ( IS-CRATE ?auto_16354 ) ( not ( = ?auto_16340 ?auto_16343 ) ) ( not ( = ?auto_16341 ?auto_16343 ) ) ( not ( = ?auto_16347 ?auto_16343 ) ) ( not ( = ?auto_16354 ?auto_16343 ) ) ( not ( = ?auto_16344 ?auto_16343 ) ) ( not ( = ?auto_16356 ?auto_16346 ) ) ( not ( = ?auto_16348 ?auto_16356 ) ) ( not ( = ?auto_16352 ?auto_16356 ) ) ( HOIST-AT ?auto_16351 ?auto_16356 ) ( not ( = ?auto_16342 ?auto_16351 ) ) ( not ( = ?auto_16353 ?auto_16351 ) ) ( not ( = ?auto_16345 ?auto_16351 ) ) ( AVAILABLE ?auto_16351 ) ( SURFACE-AT ?auto_16354 ?auto_16356 ) ( ON ?auto_16354 ?auto_16349 ) ( CLEAR ?auto_16354 ) ( not ( = ?auto_16340 ?auto_16349 ) ) ( not ( = ?auto_16341 ?auto_16349 ) ) ( not ( = ?auto_16347 ?auto_16349 ) ) ( not ( = ?auto_16354 ?auto_16349 ) ) ( not ( = ?auto_16344 ?auto_16349 ) ) ( not ( = ?auto_16343 ?auto_16349 ) ) ( SURFACE-AT ?auto_16350 ?auto_16346 ) ( CLEAR ?auto_16350 ) ( IS-CRATE ?auto_16343 ) ( not ( = ?auto_16340 ?auto_16350 ) ) ( not ( = ?auto_16341 ?auto_16350 ) ) ( not ( = ?auto_16347 ?auto_16350 ) ) ( not ( = ?auto_16354 ?auto_16350 ) ) ( not ( = ?auto_16344 ?auto_16350 ) ) ( not ( = ?auto_16343 ?auto_16350 ) ) ( not ( = ?auto_16349 ?auto_16350 ) ) ( AVAILABLE ?auto_16342 ) ( IN ?auto_16343 ?auto_16355 ) ( TRUCK-AT ?auto_16355 ?auto_16352 ) )
    :subtasks
    ( ( !DRIVE ?auto_16355 ?auto_16352 ?auto_16346 )
      ( MAKE-ON ?auto_16340 ?auto_16341 )
      ( MAKE-ON-VERIFY ?auto_16340 ?auto_16341 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16357 - SURFACE
      ?auto_16358 - SURFACE
    )
    :vars
    (
      ?auto_16373 - HOIST
      ?auto_16359 - PLACE
      ?auto_16371 - PLACE
      ?auto_16367 - HOIST
      ?auto_16366 - SURFACE
      ?auto_16368 - SURFACE
      ?auto_16369 - PLACE
      ?auto_16370 - HOIST
      ?auto_16365 - SURFACE
      ?auto_16360 - SURFACE
      ?auto_16363 - PLACE
      ?auto_16364 - HOIST
      ?auto_16361 - SURFACE
      ?auto_16372 - SURFACE
      ?auto_16362 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16373 ?auto_16359 ) ( IS-CRATE ?auto_16357 ) ( not ( = ?auto_16357 ?auto_16358 ) ) ( not ( = ?auto_16371 ?auto_16359 ) ) ( HOIST-AT ?auto_16367 ?auto_16371 ) ( not ( = ?auto_16373 ?auto_16367 ) ) ( AVAILABLE ?auto_16367 ) ( SURFACE-AT ?auto_16357 ?auto_16371 ) ( ON ?auto_16357 ?auto_16366 ) ( CLEAR ?auto_16357 ) ( not ( = ?auto_16357 ?auto_16366 ) ) ( not ( = ?auto_16358 ?auto_16366 ) ) ( IS-CRATE ?auto_16358 ) ( not ( = ?auto_16357 ?auto_16368 ) ) ( not ( = ?auto_16358 ?auto_16368 ) ) ( not ( = ?auto_16366 ?auto_16368 ) ) ( not ( = ?auto_16369 ?auto_16359 ) ) ( not ( = ?auto_16371 ?auto_16369 ) ) ( HOIST-AT ?auto_16370 ?auto_16369 ) ( not ( = ?auto_16373 ?auto_16370 ) ) ( not ( = ?auto_16367 ?auto_16370 ) ) ( SURFACE-AT ?auto_16358 ?auto_16369 ) ( ON ?auto_16358 ?auto_16365 ) ( CLEAR ?auto_16358 ) ( not ( = ?auto_16357 ?auto_16365 ) ) ( not ( = ?auto_16358 ?auto_16365 ) ) ( not ( = ?auto_16366 ?auto_16365 ) ) ( not ( = ?auto_16368 ?auto_16365 ) ) ( IS-CRATE ?auto_16368 ) ( not ( = ?auto_16357 ?auto_16360 ) ) ( not ( = ?auto_16358 ?auto_16360 ) ) ( not ( = ?auto_16366 ?auto_16360 ) ) ( not ( = ?auto_16368 ?auto_16360 ) ) ( not ( = ?auto_16365 ?auto_16360 ) ) ( not ( = ?auto_16363 ?auto_16359 ) ) ( not ( = ?auto_16371 ?auto_16363 ) ) ( not ( = ?auto_16369 ?auto_16363 ) ) ( HOIST-AT ?auto_16364 ?auto_16363 ) ( not ( = ?auto_16373 ?auto_16364 ) ) ( not ( = ?auto_16367 ?auto_16364 ) ) ( not ( = ?auto_16370 ?auto_16364 ) ) ( AVAILABLE ?auto_16364 ) ( SURFACE-AT ?auto_16368 ?auto_16363 ) ( ON ?auto_16368 ?auto_16361 ) ( CLEAR ?auto_16368 ) ( not ( = ?auto_16357 ?auto_16361 ) ) ( not ( = ?auto_16358 ?auto_16361 ) ) ( not ( = ?auto_16366 ?auto_16361 ) ) ( not ( = ?auto_16368 ?auto_16361 ) ) ( not ( = ?auto_16365 ?auto_16361 ) ) ( not ( = ?auto_16360 ?auto_16361 ) ) ( SURFACE-AT ?auto_16372 ?auto_16359 ) ( CLEAR ?auto_16372 ) ( IS-CRATE ?auto_16360 ) ( not ( = ?auto_16357 ?auto_16372 ) ) ( not ( = ?auto_16358 ?auto_16372 ) ) ( not ( = ?auto_16366 ?auto_16372 ) ) ( not ( = ?auto_16368 ?auto_16372 ) ) ( not ( = ?auto_16365 ?auto_16372 ) ) ( not ( = ?auto_16360 ?auto_16372 ) ) ( not ( = ?auto_16361 ?auto_16372 ) ) ( AVAILABLE ?auto_16373 ) ( TRUCK-AT ?auto_16362 ?auto_16369 ) ( LIFTING ?auto_16370 ?auto_16360 ) )
    :subtasks
    ( ( !LOAD ?auto_16370 ?auto_16360 ?auto_16362 ?auto_16369 )
      ( MAKE-ON ?auto_16357 ?auto_16358 )
      ( MAKE-ON-VERIFY ?auto_16357 ?auto_16358 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16374 - SURFACE
      ?auto_16375 - SURFACE
    )
    :vars
    (
      ?auto_16390 - HOIST
      ?auto_16389 - PLACE
      ?auto_16379 - PLACE
      ?auto_16376 - HOIST
      ?auto_16378 - SURFACE
      ?auto_16383 - SURFACE
      ?auto_16382 - PLACE
      ?auto_16380 - HOIST
      ?auto_16387 - SURFACE
      ?auto_16384 - SURFACE
      ?auto_16381 - PLACE
      ?auto_16386 - HOIST
      ?auto_16385 - SURFACE
      ?auto_16377 - SURFACE
      ?auto_16388 - TRUCK
      ?auto_16391 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16390 ?auto_16389 ) ( IS-CRATE ?auto_16374 ) ( not ( = ?auto_16374 ?auto_16375 ) ) ( not ( = ?auto_16379 ?auto_16389 ) ) ( HOIST-AT ?auto_16376 ?auto_16379 ) ( not ( = ?auto_16390 ?auto_16376 ) ) ( AVAILABLE ?auto_16376 ) ( SURFACE-AT ?auto_16374 ?auto_16379 ) ( ON ?auto_16374 ?auto_16378 ) ( CLEAR ?auto_16374 ) ( not ( = ?auto_16374 ?auto_16378 ) ) ( not ( = ?auto_16375 ?auto_16378 ) ) ( IS-CRATE ?auto_16375 ) ( not ( = ?auto_16374 ?auto_16383 ) ) ( not ( = ?auto_16375 ?auto_16383 ) ) ( not ( = ?auto_16378 ?auto_16383 ) ) ( not ( = ?auto_16382 ?auto_16389 ) ) ( not ( = ?auto_16379 ?auto_16382 ) ) ( HOIST-AT ?auto_16380 ?auto_16382 ) ( not ( = ?auto_16390 ?auto_16380 ) ) ( not ( = ?auto_16376 ?auto_16380 ) ) ( SURFACE-AT ?auto_16375 ?auto_16382 ) ( ON ?auto_16375 ?auto_16387 ) ( CLEAR ?auto_16375 ) ( not ( = ?auto_16374 ?auto_16387 ) ) ( not ( = ?auto_16375 ?auto_16387 ) ) ( not ( = ?auto_16378 ?auto_16387 ) ) ( not ( = ?auto_16383 ?auto_16387 ) ) ( IS-CRATE ?auto_16383 ) ( not ( = ?auto_16374 ?auto_16384 ) ) ( not ( = ?auto_16375 ?auto_16384 ) ) ( not ( = ?auto_16378 ?auto_16384 ) ) ( not ( = ?auto_16383 ?auto_16384 ) ) ( not ( = ?auto_16387 ?auto_16384 ) ) ( not ( = ?auto_16381 ?auto_16389 ) ) ( not ( = ?auto_16379 ?auto_16381 ) ) ( not ( = ?auto_16382 ?auto_16381 ) ) ( HOIST-AT ?auto_16386 ?auto_16381 ) ( not ( = ?auto_16390 ?auto_16386 ) ) ( not ( = ?auto_16376 ?auto_16386 ) ) ( not ( = ?auto_16380 ?auto_16386 ) ) ( AVAILABLE ?auto_16386 ) ( SURFACE-AT ?auto_16383 ?auto_16381 ) ( ON ?auto_16383 ?auto_16385 ) ( CLEAR ?auto_16383 ) ( not ( = ?auto_16374 ?auto_16385 ) ) ( not ( = ?auto_16375 ?auto_16385 ) ) ( not ( = ?auto_16378 ?auto_16385 ) ) ( not ( = ?auto_16383 ?auto_16385 ) ) ( not ( = ?auto_16387 ?auto_16385 ) ) ( not ( = ?auto_16384 ?auto_16385 ) ) ( SURFACE-AT ?auto_16377 ?auto_16389 ) ( CLEAR ?auto_16377 ) ( IS-CRATE ?auto_16384 ) ( not ( = ?auto_16374 ?auto_16377 ) ) ( not ( = ?auto_16375 ?auto_16377 ) ) ( not ( = ?auto_16378 ?auto_16377 ) ) ( not ( = ?auto_16383 ?auto_16377 ) ) ( not ( = ?auto_16387 ?auto_16377 ) ) ( not ( = ?auto_16384 ?auto_16377 ) ) ( not ( = ?auto_16385 ?auto_16377 ) ) ( AVAILABLE ?auto_16390 ) ( TRUCK-AT ?auto_16388 ?auto_16382 ) ( AVAILABLE ?auto_16380 ) ( SURFACE-AT ?auto_16384 ?auto_16382 ) ( ON ?auto_16384 ?auto_16391 ) ( CLEAR ?auto_16384 ) ( not ( = ?auto_16374 ?auto_16391 ) ) ( not ( = ?auto_16375 ?auto_16391 ) ) ( not ( = ?auto_16378 ?auto_16391 ) ) ( not ( = ?auto_16383 ?auto_16391 ) ) ( not ( = ?auto_16387 ?auto_16391 ) ) ( not ( = ?auto_16384 ?auto_16391 ) ) ( not ( = ?auto_16385 ?auto_16391 ) ) ( not ( = ?auto_16377 ?auto_16391 ) ) )
    :subtasks
    ( ( !LIFT ?auto_16380 ?auto_16384 ?auto_16391 ?auto_16382 )
      ( MAKE-ON ?auto_16374 ?auto_16375 )
      ( MAKE-ON-VERIFY ?auto_16374 ?auto_16375 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16392 - SURFACE
      ?auto_16393 - SURFACE
    )
    :vars
    (
      ?auto_16399 - HOIST
      ?auto_16394 - PLACE
      ?auto_16407 - PLACE
      ?auto_16404 - HOIST
      ?auto_16395 - SURFACE
      ?auto_16396 - SURFACE
      ?auto_16401 - PLACE
      ?auto_16408 - HOIST
      ?auto_16402 - SURFACE
      ?auto_16398 - SURFACE
      ?auto_16397 - PLACE
      ?auto_16409 - HOIST
      ?auto_16405 - SURFACE
      ?auto_16406 - SURFACE
      ?auto_16400 - SURFACE
      ?auto_16403 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16399 ?auto_16394 ) ( IS-CRATE ?auto_16392 ) ( not ( = ?auto_16392 ?auto_16393 ) ) ( not ( = ?auto_16407 ?auto_16394 ) ) ( HOIST-AT ?auto_16404 ?auto_16407 ) ( not ( = ?auto_16399 ?auto_16404 ) ) ( AVAILABLE ?auto_16404 ) ( SURFACE-AT ?auto_16392 ?auto_16407 ) ( ON ?auto_16392 ?auto_16395 ) ( CLEAR ?auto_16392 ) ( not ( = ?auto_16392 ?auto_16395 ) ) ( not ( = ?auto_16393 ?auto_16395 ) ) ( IS-CRATE ?auto_16393 ) ( not ( = ?auto_16392 ?auto_16396 ) ) ( not ( = ?auto_16393 ?auto_16396 ) ) ( not ( = ?auto_16395 ?auto_16396 ) ) ( not ( = ?auto_16401 ?auto_16394 ) ) ( not ( = ?auto_16407 ?auto_16401 ) ) ( HOIST-AT ?auto_16408 ?auto_16401 ) ( not ( = ?auto_16399 ?auto_16408 ) ) ( not ( = ?auto_16404 ?auto_16408 ) ) ( SURFACE-AT ?auto_16393 ?auto_16401 ) ( ON ?auto_16393 ?auto_16402 ) ( CLEAR ?auto_16393 ) ( not ( = ?auto_16392 ?auto_16402 ) ) ( not ( = ?auto_16393 ?auto_16402 ) ) ( not ( = ?auto_16395 ?auto_16402 ) ) ( not ( = ?auto_16396 ?auto_16402 ) ) ( IS-CRATE ?auto_16396 ) ( not ( = ?auto_16392 ?auto_16398 ) ) ( not ( = ?auto_16393 ?auto_16398 ) ) ( not ( = ?auto_16395 ?auto_16398 ) ) ( not ( = ?auto_16396 ?auto_16398 ) ) ( not ( = ?auto_16402 ?auto_16398 ) ) ( not ( = ?auto_16397 ?auto_16394 ) ) ( not ( = ?auto_16407 ?auto_16397 ) ) ( not ( = ?auto_16401 ?auto_16397 ) ) ( HOIST-AT ?auto_16409 ?auto_16397 ) ( not ( = ?auto_16399 ?auto_16409 ) ) ( not ( = ?auto_16404 ?auto_16409 ) ) ( not ( = ?auto_16408 ?auto_16409 ) ) ( AVAILABLE ?auto_16409 ) ( SURFACE-AT ?auto_16396 ?auto_16397 ) ( ON ?auto_16396 ?auto_16405 ) ( CLEAR ?auto_16396 ) ( not ( = ?auto_16392 ?auto_16405 ) ) ( not ( = ?auto_16393 ?auto_16405 ) ) ( not ( = ?auto_16395 ?auto_16405 ) ) ( not ( = ?auto_16396 ?auto_16405 ) ) ( not ( = ?auto_16402 ?auto_16405 ) ) ( not ( = ?auto_16398 ?auto_16405 ) ) ( SURFACE-AT ?auto_16406 ?auto_16394 ) ( CLEAR ?auto_16406 ) ( IS-CRATE ?auto_16398 ) ( not ( = ?auto_16392 ?auto_16406 ) ) ( not ( = ?auto_16393 ?auto_16406 ) ) ( not ( = ?auto_16395 ?auto_16406 ) ) ( not ( = ?auto_16396 ?auto_16406 ) ) ( not ( = ?auto_16402 ?auto_16406 ) ) ( not ( = ?auto_16398 ?auto_16406 ) ) ( not ( = ?auto_16405 ?auto_16406 ) ) ( AVAILABLE ?auto_16399 ) ( AVAILABLE ?auto_16408 ) ( SURFACE-AT ?auto_16398 ?auto_16401 ) ( ON ?auto_16398 ?auto_16400 ) ( CLEAR ?auto_16398 ) ( not ( = ?auto_16392 ?auto_16400 ) ) ( not ( = ?auto_16393 ?auto_16400 ) ) ( not ( = ?auto_16395 ?auto_16400 ) ) ( not ( = ?auto_16396 ?auto_16400 ) ) ( not ( = ?auto_16402 ?auto_16400 ) ) ( not ( = ?auto_16398 ?auto_16400 ) ) ( not ( = ?auto_16405 ?auto_16400 ) ) ( not ( = ?auto_16406 ?auto_16400 ) ) ( TRUCK-AT ?auto_16403 ?auto_16394 ) )
    :subtasks
    ( ( !DRIVE ?auto_16403 ?auto_16394 ?auto_16401 )
      ( MAKE-ON ?auto_16392 ?auto_16393 )
      ( MAKE-ON-VERIFY ?auto_16392 ?auto_16393 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16410 - SURFACE
      ?auto_16411 - SURFACE
    )
    :vars
    (
      ?auto_16415 - HOIST
      ?auto_16420 - PLACE
      ?auto_16418 - PLACE
      ?auto_16417 - HOIST
      ?auto_16414 - SURFACE
      ?auto_16421 - SURFACE
      ?auto_16423 - PLACE
      ?auto_16416 - HOIST
      ?auto_16413 - SURFACE
      ?auto_16419 - SURFACE
      ?auto_16424 - PLACE
      ?auto_16426 - HOIST
      ?auto_16412 - SURFACE
      ?auto_16422 - SURFACE
      ?auto_16427 - SURFACE
      ?auto_16425 - TRUCK
      ?auto_16428 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16415 ?auto_16420 ) ( IS-CRATE ?auto_16410 ) ( not ( = ?auto_16410 ?auto_16411 ) ) ( not ( = ?auto_16418 ?auto_16420 ) ) ( HOIST-AT ?auto_16417 ?auto_16418 ) ( not ( = ?auto_16415 ?auto_16417 ) ) ( AVAILABLE ?auto_16417 ) ( SURFACE-AT ?auto_16410 ?auto_16418 ) ( ON ?auto_16410 ?auto_16414 ) ( CLEAR ?auto_16410 ) ( not ( = ?auto_16410 ?auto_16414 ) ) ( not ( = ?auto_16411 ?auto_16414 ) ) ( IS-CRATE ?auto_16411 ) ( not ( = ?auto_16410 ?auto_16421 ) ) ( not ( = ?auto_16411 ?auto_16421 ) ) ( not ( = ?auto_16414 ?auto_16421 ) ) ( not ( = ?auto_16423 ?auto_16420 ) ) ( not ( = ?auto_16418 ?auto_16423 ) ) ( HOIST-AT ?auto_16416 ?auto_16423 ) ( not ( = ?auto_16415 ?auto_16416 ) ) ( not ( = ?auto_16417 ?auto_16416 ) ) ( SURFACE-AT ?auto_16411 ?auto_16423 ) ( ON ?auto_16411 ?auto_16413 ) ( CLEAR ?auto_16411 ) ( not ( = ?auto_16410 ?auto_16413 ) ) ( not ( = ?auto_16411 ?auto_16413 ) ) ( not ( = ?auto_16414 ?auto_16413 ) ) ( not ( = ?auto_16421 ?auto_16413 ) ) ( IS-CRATE ?auto_16421 ) ( not ( = ?auto_16410 ?auto_16419 ) ) ( not ( = ?auto_16411 ?auto_16419 ) ) ( not ( = ?auto_16414 ?auto_16419 ) ) ( not ( = ?auto_16421 ?auto_16419 ) ) ( not ( = ?auto_16413 ?auto_16419 ) ) ( not ( = ?auto_16424 ?auto_16420 ) ) ( not ( = ?auto_16418 ?auto_16424 ) ) ( not ( = ?auto_16423 ?auto_16424 ) ) ( HOIST-AT ?auto_16426 ?auto_16424 ) ( not ( = ?auto_16415 ?auto_16426 ) ) ( not ( = ?auto_16417 ?auto_16426 ) ) ( not ( = ?auto_16416 ?auto_16426 ) ) ( AVAILABLE ?auto_16426 ) ( SURFACE-AT ?auto_16421 ?auto_16424 ) ( ON ?auto_16421 ?auto_16412 ) ( CLEAR ?auto_16421 ) ( not ( = ?auto_16410 ?auto_16412 ) ) ( not ( = ?auto_16411 ?auto_16412 ) ) ( not ( = ?auto_16414 ?auto_16412 ) ) ( not ( = ?auto_16421 ?auto_16412 ) ) ( not ( = ?auto_16413 ?auto_16412 ) ) ( not ( = ?auto_16419 ?auto_16412 ) ) ( IS-CRATE ?auto_16419 ) ( not ( = ?auto_16410 ?auto_16422 ) ) ( not ( = ?auto_16411 ?auto_16422 ) ) ( not ( = ?auto_16414 ?auto_16422 ) ) ( not ( = ?auto_16421 ?auto_16422 ) ) ( not ( = ?auto_16413 ?auto_16422 ) ) ( not ( = ?auto_16419 ?auto_16422 ) ) ( not ( = ?auto_16412 ?auto_16422 ) ) ( AVAILABLE ?auto_16416 ) ( SURFACE-AT ?auto_16419 ?auto_16423 ) ( ON ?auto_16419 ?auto_16427 ) ( CLEAR ?auto_16419 ) ( not ( = ?auto_16410 ?auto_16427 ) ) ( not ( = ?auto_16411 ?auto_16427 ) ) ( not ( = ?auto_16414 ?auto_16427 ) ) ( not ( = ?auto_16421 ?auto_16427 ) ) ( not ( = ?auto_16413 ?auto_16427 ) ) ( not ( = ?auto_16419 ?auto_16427 ) ) ( not ( = ?auto_16412 ?auto_16427 ) ) ( not ( = ?auto_16422 ?auto_16427 ) ) ( TRUCK-AT ?auto_16425 ?auto_16420 ) ( SURFACE-AT ?auto_16428 ?auto_16420 ) ( CLEAR ?auto_16428 ) ( LIFTING ?auto_16415 ?auto_16422 ) ( IS-CRATE ?auto_16422 ) ( not ( = ?auto_16410 ?auto_16428 ) ) ( not ( = ?auto_16411 ?auto_16428 ) ) ( not ( = ?auto_16414 ?auto_16428 ) ) ( not ( = ?auto_16421 ?auto_16428 ) ) ( not ( = ?auto_16413 ?auto_16428 ) ) ( not ( = ?auto_16419 ?auto_16428 ) ) ( not ( = ?auto_16412 ?auto_16428 ) ) ( not ( = ?auto_16422 ?auto_16428 ) ) ( not ( = ?auto_16427 ?auto_16428 ) ) )
    :subtasks
    ( ( !DROP ?auto_16415 ?auto_16422 ?auto_16428 ?auto_16420 )
      ( MAKE-ON ?auto_16410 ?auto_16411 )
      ( MAKE-ON-VERIFY ?auto_16410 ?auto_16411 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16429 - SURFACE
      ?auto_16430 - SURFACE
    )
    :vars
    (
      ?auto_16438 - HOIST
      ?auto_16446 - PLACE
      ?auto_16439 - PLACE
      ?auto_16433 - HOIST
      ?auto_16437 - SURFACE
      ?auto_16441 - SURFACE
      ?auto_16431 - PLACE
      ?auto_16434 - HOIST
      ?auto_16440 - SURFACE
      ?auto_16432 - SURFACE
      ?auto_16443 - PLACE
      ?auto_16442 - HOIST
      ?auto_16447 - SURFACE
      ?auto_16435 - SURFACE
      ?auto_16444 - SURFACE
      ?auto_16436 - TRUCK
      ?auto_16445 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16438 ?auto_16446 ) ( IS-CRATE ?auto_16429 ) ( not ( = ?auto_16429 ?auto_16430 ) ) ( not ( = ?auto_16439 ?auto_16446 ) ) ( HOIST-AT ?auto_16433 ?auto_16439 ) ( not ( = ?auto_16438 ?auto_16433 ) ) ( AVAILABLE ?auto_16433 ) ( SURFACE-AT ?auto_16429 ?auto_16439 ) ( ON ?auto_16429 ?auto_16437 ) ( CLEAR ?auto_16429 ) ( not ( = ?auto_16429 ?auto_16437 ) ) ( not ( = ?auto_16430 ?auto_16437 ) ) ( IS-CRATE ?auto_16430 ) ( not ( = ?auto_16429 ?auto_16441 ) ) ( not ( = ?auto_16430 ?auto_16441 ) ) ( not ( = ?auto_16437 ?auto_16441 ) ) ( not ( = ?auto_16431 ?auto_16446 ) ) ( not ( = ?auto_16439 ?auto_16431 ) ) ( HOIST-AT ?auto_16434 ?auto_16431 ) ( not ( = ?auto_16438 ?auto_16434 ) ) ( not ( = ?auto_16433 ?auto_16434 ) ) ( SURFACE-AT ?auto_16430 ?auto_16431 ) ( ON ?auto_16430 ?auto_16440 ) ( CLEAR ?auto_16430 ) ( not ( = ?auto_16429 ?auto_16440 ) ) ( not ( = ?auto_16430 ?auto_16440 ) ) ( not ( = ?auto_16437 ?auto_16440 ) ) ( not ( = ?auto_16441 ?auto_16440 ) ) ( IS-CRATE ?auto_16441 ) ( not ( = ?auto_16429 ?auto_16432 ) ) ( not ( = ?auto_16430 ?auto_16432 ) ) ( not ( = ?auto_16437 ?auto_16432 ) ) ( not ( = ?auto_16441 ?auto_16432 ) ) ( not ( = ?auto_16440 ?auto_16432 ) ) ( not ( = ?auto_16443 ?auto_16446 ) ) ( not ( = ?auto_16439 ?auto_16443 ) ) ( not ( = ?auto_16431 ?auto_16443 ) ) ( HOIST-AT ?auto_16442 ?auto_16443 ) ( not ( = ?auto_16438 ?auto_16442 ) ) ( not ( = ?auto_16433 ?auto_16442 ) ) ( not ( = ?auto_16434 ?auto_16442 ) ) ( AVAILABLE ?auto_16442 ) ( SURFACE-AT ?auto_16441 ?auto_16443 ) ( ON ?auto_16441 ?auto_16447 ) ( CLEAR ?auto_16441 ) ( not ( = ?auto_16429 ?auto_16447 ) ) ( not ( = ?auto_16430 ?auto_16447 ) ) ( not ( = ?auto_16437 ?auto_16447 ) ) ( not ( = ?auto_16441 ?auto_16447 ) ) ( not ( = ?auto_16440 ?auto_16447 ) ) ( not ( = ?auto_16432 ?auto_16447 ) ) ( IS-CRATE ?auto_16432 ) ( not ( = ?auto_16429 ?auto_16435 ) ) ( not ( = ?auto_16430 ?auto_16435 ) ) ( not ( = ?auto_16437 ?auto_16435 ) ) ( not ( = ?auto_16441 ?auto_16435 ) ) ( not ( = ?auto_16440 ?auto_16435 ) ) ( not ( = ?auto_16432 ?auto_16435 ) ) ( not ( = ?auto_16447 ?auto_16435 ) ) ( AVAILABLE ?auto_16434 ) ( SURFACE-AT ?auto_16432 ?auto_16431 ) ( ON ?auto_16432 ?auto_16444 ) ( CLEAR ?auto_16432 ) ( not ( = ?auto_16429 ?auto_16444 ) ) ( not ( = ?auto_16430 ?auto_16444 ) ) ( not ( = ?auto_16437 ?auto_16444 ) ) ( not ( = ?auto_16441 ?auto_16444 ) ) ( not ( = ?auto_16440 ?auto_16444 ) ) ( not ( = ?auto_16432 ?auto_16444 ) ) ( not ( = ?auto_16447 ?auto_16444 ) ) ( not ( = ?auto_16435 ?auto_16444 ) ) ( TRUCK-AT ?auto_16436 ?auto_16446 ) ( SURFACE-AT ?auto_16445 ?auto_16446 ) ( CLEAR ?auto_16445 ) ( IS-CRATE ?auto_16435 ) ( not ( = ?auto_16429 ?auto_16445 ) ) ( not ( = ?auto_16430 ?auto_16445 ) ) ( not ( = ?auto_16437 ?auto_16445 ) ) ( not ( = ?auto_16441 ?auto_16445 ) ) ( not ( = ?auto_16440 ?auto_16445 ) ) ( not ( = ?auto_16432 ?auto_16445 ) ) ( not ( = ?auto_16447 ?auto_16445 ) ) ( not ( = ?auto_16435 ?auto_16445 ) ) ( not ( = ?auto_16444 ?auto_16445 ) ) ( AVAILABLE ?auto_16438 ) ( IN ?auto_16435 ?auto_16436 ) )
    :subtasks
    ( ( !UNLOAD ?auto_16438 ?auto_16435 ?auto_16436 ?auto_16446 )
      ( MAKE-ON ?auto_16429 ?auto_16430 )
      ( MAKE-ON-VERIFY ?auto_16429 ?auto_16430 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16448 - SURFACE
      ?auto_16449 - SURFACE
    )
    :vars
    (
      ?auto_16466 - HOIST
      ?auto_16460 - PLACE
      ?auto_16462 - PLACE
      ?auto_16451 - HOIST
      ?auto_16455 - SURFACE
      ?auto_16452 - SURFACE
      ?auto_16458 - PLACE
      ?auto_16465 - HOIST
      ?auto_16464 - SURFACE
      ?auto_16453 - SURFACE
      ?auto_16461 - PLACE
      ?auto_16463 - HOIST
      ?auto_16450 - SURFACE
      ?auto_16457 - SURFACE
      ?auto_16456 - SURFACE
      ?auto_16459 - SURFACE
      ?auto_16454 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16466 ?auto_16460 ) ( IS-CRATE ?auto_16448 ) ( not ( = ?auto_16448 ?auto_16449 ) ) ( not ( = ?auto_16462 ?auto_16460 ) ) ( HOIST-AT ?auto_16451 ?auto_16462 ) ( not ( = ?auto_16466 ?auto_16451 ) ) ( AVAILABLE ?auto_16451 ) ( SURFACE-AT ?auto_16448 ?auto_16462 ) ( ON ?auto_16448 ?auto_16455 ) ( CLEAR ?auto_16448 ) ( not ( = ?auto_16448 ?auto_16455 ) ) ( not ( = ?auto_16449 ?auto_16455 ) ) ( IS-CRATE ?auto_16449 ) ( not ( = ?auto_16448 ?auto_16452 ) ) ( not ( = ?auto_16449 ?auto_16452 ) ) ( not ( = ?auto_16455 ?auto_16452 ) ) ( not ( = ?auto_16458 ?auto_16460 ) ) ( not ( = ?auto_16462 ?auto_16458 ) ) ( HOIST-AT ?auto_16465 ?auto_16458 ) ( not ( = ?auto_16466 ?auto_16465 ) ) ( not ( = ?auto_16451 ?auto_16465 ) ) ( SURFACE-AT ?auto_16449 ?auto_16458 ) ( ON ?auto_16449 ?auto_16464 ) ( CLEAR ?auto_16449 ) ( not ( = ?auto_16448 ?auto_16464 ) ) ( not ( = ?auto_16449 ?auto_16464 ) ) ( not ( = ?auto_16455 ?auto_16464 ) ) ( not ( = ?auto_16452 ?auto_16464 ) ) ( IS-CRATE ?auto_16452 ) ( not ( = ?auto_16448 ?auto_16453 ) ) ( not ( = ?auto_16449 ?auto_16453 ) ) ( not ( = ?auto_16455 ?auto_16453 ) ) ( not ( = ?auto_16452 ?auto_16453 ) ) ( not ( = ?auto_16464 ?auto_16453 ) ) ( not ( = ?auto_16461 ?auto_16460 ) ) ( not ( = ?auto_16462 ?auto_16461 ) ) ( not ( = ?auto_16458 ?auto_16461 ) ) ( HOIST-AT ?auto_16463 ?auto_16461 ) ( not ( = ?auto_16466 ?auto_16463 ) ) ( not ( = ?auto_16451 ?auto_16463 ) ) ( not ( = ?auto_16465 ?auto_16463 ) ) ( AVAILABLE ?auto_16463 ) ( SURFACE-AT ?auto_16452 ?auto_16461 ) ( ON ?auto_16452 ?auto_16450 ) ( CLEAR ?auto_16452 ) ( not ( = ?auto_16448 ?auto_16450 ) ) ( not ( = ?auto_16449 ?auto_16450 ) ) ( not ( = ?auto_16455 ?auto_16450 ) ) ( not ( = ?auto_16452 ?auto_16450 ) ) ( not ( = ?auto_16464 ?auto_16450 ) ) ( not ( = ?auto_16453 ?auto_16450 ) ) ( IS-CRATE ?auto_16453 ) ( not ( = ?auto_16448 ?auto_16457 ) ) ( not ( = ?auto_16449 ?auto_16457 ) ) ( not ( = ?auto_16455 ?auto_16457 ) ) ( not ( = ?auto_16452 ?auto_16457 ) ) ( not ( = ?auto_16464 ?auto_16457 ) ) ( not ( = ?auto_16453 ?auto_16457 ) ) ( not ( = ?auto_16450 ?auto_16457 ) ) ( AVAILABLE ?auto_16465 ) ( SURFACE-AT ?auto_16453 ?auto_16458 ) ( ON ?auto_16453 ?auto_16456 ) ( CLEAR ?auto_16453 ) ( not ( = ?auto_16448 ?auto_16456 ) ) ( not ( = ?auto_16449 ?auto_16456 ) ) ( not ( = ?auto_16455 ?auto_16456 ) ) ( not ( = ?auto_16452 ?auto_16456 ) ) ( not ( = ?auto_16464 ?auto_16456 ) ) ( not ( = ?auto_16453 ?auto_16456 ) ) ( not ( = ?auto_16450 ?auto_16456 ) ) ( not ( = ?auto_16457 ?auto_16456 ) ) ( SURFACE-AT ?auto_16459 ?auto_16460 ) ( CLEAR ?auto_16459 ) ( IS-CRATE ?auto_16457 ) ( not ( = ?auto_16448 ?auto_16459 ) ) ( not ( = ?auto_16449 ?auto_16459 ) ) ( not ( = ?auto_16455 ?auto_16459 ) ) ( not ( = ?auto_16452 ?auto_16459 ) ) ( not ( = ?auto_16464 ?auto_16459 ) ) ( not ( = ?auto_16453 ?auto_16459 ) ) ( not ( = ?auto_16450 ?auto_16459 ) ) ( not ( = ?auto_16457 ?auto_16459 ) ) ( not ( = ?auto_16456 ?auto_16459 ) ) ( AVAILABLE ?auto_16466 ) ( IN ?auto_16457 ?auto_16454 ) ( TRUCK-AT ?auto_16454 ?auto_16462 ) )
    :subtasks
    ( ( !DRIVE ?auto_16454 ?auto_16462 ?auto_16460 )
      ( MAKE-ON ?auto_16448 ?auto_16449 )
      ( MAKE-ON-VERIFY ?auto_16448 ?auto_16449 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16467 - SURFACE
      ?auto_16468 - SURFACE
    )
    :vars
    (
      ?auto_16481 - HOIST
      ?auto_16472 - PLACE
      ?auto_16480 - PLACE
      ?auto_16469 - HOIST
      ?auto_16484 - SURFACE
      ?auto_16470 - SURFACE
      ?auto_16475 - PLACE
      ?auto_16474 - HOIST
      ?auto_16478 - SURFACE
      ?auto_16483 - SURFACE
      ?auto_16471 - PLACE
      ?auto_16477 - HOIST
      ?auto_16473 - SURFACE
      ?auto_16485 - SURFACE
      ?auto_16479 - SURFACE
      ?auto_16476 - SURFACE
      ?auto_16482 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16481 ?auto_16472 ) ( IS-CRATE ?auto_16467 ) ( not ( = ?auto_16467 ?auto_16468 ) ) ( not ( = ?auto_16480 ?auto_16472 ) ) ( HOIST-AT ?auto_16469 ?auto_16480 ) ( not ( = ?auto_16481 ?auto_16469 ) ) ( SURFACE-AT ?auto_16467 ?auto_16480 ) ( ON ?auto_16467 ?auto_16484 ) ( CLEAR ?auto_16467 ) ( not ( = ?auto_16467 ?auto_16484 ) ) ( not ( = ?auto_16468 ?auto_16484 ) ) ( IS-CRATE ?auto_16468 ) ( not ( = ?auto_16467 ?auto_16470 ) ) ( not ( = ?auto_16468 ?auto_16470 ) ) ( not ( = ?auto_16484 ?auto_16470 ) ) ( not ( = ?auto_16475 ?auto_16472 ) ) ( not ( = ?auto_16480 ?auto_16475 ) ) ( HOIST-AT ?auto_16474 ?auto_16475 ) ( not ( = ?auto_16481 ?auto_16474 ) ) ( not ( = ?auto_16469 ?auto_16474 ) ) ( SURFACE-AT ?auto_16468 ?auto_16475 ) ( ON ?auto_16468 ?auto_16478 ) ( CLEAR ?auto_16468 ) ( not ( = ?auto_16467 ?auto_16478 ) ) ( not ( = ?auto_16468 ?auto_16478 ) ) ( not ( = ?auto_16484 ?auto_16478 ) ) ( not ( = ?auto_16470 ?auto_16478 ) ) ( IS-CRATE ?auto_16470 ) ( not ( = ?auto_16467 ?auto_16483 ) ) ( not ( = ?auto_16468 ?auto_16483 ) ) ( not ( = ?auto_16484 ?auto_16483 ) ) ( not ( = ?auto_16470 ?auto_16483 ) ) ( not ( = ?auto_16478 ?auto_16483 ) ) ( not ( = ?auto_16471 ?auto_16472 ) ) ( not ( = ?auto_16480 ?auto_16471 ) ) ( not ( = ?auto_16475 ?auto_16471 ) ) ( HOIST-AT ?auto_16477 ?auto_16471 ) ( not ( = ?auto_16481 ?auto_16477 ) ) ( not ( = ?auto_16469 ?auto_16477 ) ) ( not ( = ?auto_16474 ?auto_16477 ) ) ( AVAILABLE ?auto_16477 ) ( SURFACE-AT ?auto_16470 ?auto_16471 ) ( ON ?auto_16470 ?auto_16473 ) ( CLEAR ?auto_16470 ) ( not ( = ?auto_16467 ?auto_16473 ) ) ( not ( = ?auto_16468 ?auto_16473 ) ) ( not ( = ?auto_16484 ?auto_16473 ) ) ( not ( = ?auto_16470 ?auto_16473 ) ) ( not ( = ?auto_16478 ?auto_16473 ) ) ( not ( = ?auto_16483 ?auto_16473 ) ) ( IS-CRATE ?auto_16483 ) ( not ( = ?auto_16467 ?auto_16485 ) ) ( not ( = ?auto_16468 ?auto_16485 ) ) ( not ( = ?auto_16484 ?auto_16485 ) ) ( not ( = ?auto_16470 ?auto_16485 ) ) ( not ( = ?auto_16478 ?auto_16485 ) ) ( not ( = ?auto_16483 ?auto_16485 ) ) ( not ( = ?auto_16473 ?auto_16485 ) ) ( AVAILABLE ?auto_16474 ) ( SURFACE-AT ?auto_16483 ?auto_16475 ) ( ON ?auto_16483 ?auto_16479 ) ( CLEAR ?auto_16483 ) ( not ( = ?auto_16467 ?auto_16479 ) ) ( not ( = ?auto_16468 ?auto_16479 ) ) ( not ( = ?auto_16484 ?auto_16479 ) ) ( not ( = ?auto_16470 ?auto_16479 ) ) ( not ( = ?auto_16478 ?auto_16479 ) ) ( not ( = ?auto_16483 ?auto_16479 ) ) ( not ( = ?auto_16473 ?auto_16479 ) ) ( not ( = ?auto_16485 ?auto_16479 ) ) ( SURFACE-AT ?auto_16476 ?auto_16472 ) ( CLEAR ?auto_16476 ) ( IS-CRATE ?auto_16485 ) ( not ( = ?auto_16467 ?auto_16476 ) ) ( not ( = ?auto_16468 ?auto_16476 ) ) ( not ( = ?auto_16484 ?auto_16476 ) ) ( not ( = ?auto_16470 ?auto_16476 ) ) ( not ( = ?auto_16478 ?auto_16476 ) ) ( not ( = ?auto_16483 ?auto_16476 ) ) ( not ( = ?auto_16473 ?auto_16476 ) ) ( not ( = ?auto_16485 ?auto_16476 ) ) ( not ( = ?auto_16479 ?auto_16476 ) ) ( AVAILABLE ?auto_16481 ) ( TRUCK-AT ?auto_16482 ?auto_16480 ) ( LIFTING ?auto_16469 ?auto_16485 ) )
    :subtasks
    ( ( !LOAD ?auto_16469 ?auto_16485 ?auto_16482 ?auto_16480 )
      ( MAKE-ON ?auto_16467 ?auto_16468 )
      ( MAKE-ON-VERIFY ?auto_16467 ?auto_16468 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16486 - SURFACE
      ?auto_16487 - SURFACE
    )
    :vars
    (
      ?auto_16490 - HOIST
      ?auto_16491 - PLACE
      ?auto_16492 - PLACE
      ?auto_16499 - HOIST
      ?auto_16500 - SURFACE
      ?auto_16493 - SURFACE
      ?auto_16497 - PLACE
      ?auto_16494 - HOIST
      ?auto_16488 - SURFACE
      ?auto_16502 - SURFACE
      ?auto_16489 - PLACE
      ?auto_16501 - HOIST
      ?auto_16496 - SURFACE
      ?auto_16495 - SURFACE
      ?auto_16498 - SURFACE
      ?auto_16503 - SURFACE
      ?auto_16504 - TRUCK
      ?auto_16505 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16490 ?auto_16491 ) ( IS-CRATE ?auto_16486 ) ( not ( = ?auto_16486 ?auto_16487 ) ) ( not ( = ?auto_16492 ?auto_16491 ) ) ( HOIST-AT ?auto_16499 ?auto_16492 ) ( not ( = ?auto_16490 ?auto_16499 ) ) ( SURFACE-AT ?auto_16486 ?auto_16492 ) ( ON ?auto_16486 ?auto_16500 ) ( CLEAR ?auto_16486 ) ( not ( = ?auto_16486 ?auto_16500 ) ) ( not ( = ?auto_16487 ?auto_16500 ) ) ( IS-CRATE ?auto_16487 ) ( not ( = ?auto_16486 ?auto_16493 ) ) ( not ( = ?auto_16487 ?auto_16493 ) ) ( not ( = ?auto_16500 ?auto_16493 ) ) ( not ( = ?auto_16497 ?auto_16491 ) ) ( not ( = ?auto_16492 ?auto_16497 ) ) ( HOIST-AT ?auto_16494 ?auto_16497 ) ( not ( = ?auto_16490 ?auto_16494 ) ) ( not ( = ?auto_16499 ?auto_16494 ) ) ( SURFACE-AT ?auto_16487 ?auto_16497 ) ( ON ?auto_16487 ?auto_16488 ) ( CLEAR ?auto_16487 ) ( not ( = ?auto_16486 ?auto_16488 ) ) ( not ( = ?auto_16487 ?auto_16488 ) ) ( not ( = ?auto_16500 ?auto_16488 ) ) ( not ( = ?auto_16493 ?auto_16488 ) ) ( IS-CRATE ?auto_16493 ) ( not ( = ?auto_16486 ?auto_16502 ) ) ( not ( = ?auto_16487 ?auto_16502 ) ) ( not ( = ?auto_16500 ?auto_16502 ) ) ( not ( = ?auto_16493 ?auto_16502 ) ) ( not ( = ?auto_16488 ?auto_16502 ) ) ( not ( = ?auto_16489 ?auto_16491 ) ) ( not ( = ?auto_16492 ?auto_16489 ) ) ( not ( = ?auto_16497 ?auto_16489 ) ) ( HOIST-AT ?auto_16501 ?auto_16489 ) ( not ( = ?auto_16490 ?auto_16501 ) ) ( not ( = ?auto_16499 ?auto_16501 ) ) ( not ( = ?auto_16494 ?auto_16501 ) ) ( AVAILABLE ?auto_16501 ) ( SURFACE-AT ?auto_16493 ?auto_16489 ) ( ON ?auto_16493 ?auto_16496 ) ( CLEAR ?auto_16493 ) ( not ( = ?auto_16486 ?auto_16496 ) ) ( not ( = ?auto_16487 ?auto_16496 ) ) ( not ( = ?auto_16500 ?auto_16496 ) ) ( not ( = ?auto_16493 ?auto_16496 ) ) ( not ( = ?auto_16488 ?auto_16496 ) ) ( not ( = ?auto_16502 ?auto_16496 ) ) ( IS-CRATE ?auto_16502 ) ( not ( = ?auto_16486 ?auto_16495 ) ) ( not ( = ?auto_16487 ?auto_16495 ) ) ( not ( = ?auto_16500 ?auto_16495 ) ) ( not ( = ?auto_16493 ?auto_16495 ) ) ( not ( = ?auto_16488 ?auto_16495 ) ) ( not ( = ?auto_16502 ?auto_16495 ) ) ( not ( = ?auto_16496 ?auto_16495 ) ) ( AVAILABLE ?auto_16494 ) ( SURFACE-AT ?auto_16502 ?auto_16497 ) ( ON ?auto_16502 ?auto_16498 ) ( CLEAR ?auto_16502 ) ( not ( = ?auto_16486 ?auto_16498 ) ) ( not ( = ?auto_16487 ?auto_16498 ) ) ( not ( = ?auto_16500 ?auto_16498 ) ) ( not ( = ?auto_16493 ?auto_16498 ) ) ( not ( = ?auto_16488 ?auto_16498 ) ) ( not ( = ?auto_16502 ?auto_16498 ) ) ( not ( = ?auto_16496 ?auto_16498 ) ) ( not ( = ?auto_16495 ?auto_16498 ) ) ( SURFACE-AT ?auto_16503 ?auto_16491 ) ( CLEAR ?auto_16503 ) ( IS-CRATE ?auto_16495 ) ( not ( = ?auto_16486 ?auto_16503 ) ) ( not ( = ?auto_16487 ?auto_16503 ) ) ( not ( = ?auto_16500 ?auto_16503 ) ) ( not ( = ?auto_16493 ?auto_16503 ) ) ( not ( = ?auto_16488 ?auto_16503 ) ) ( not ( = ?auto_16502 ?auto_16503 ) ) ( not ( = ?auto_16496 ?auto_16503 ) ) ( not ( = ?auto_16495 ?auto_16503 ) ) ( not ( = ?auto_16498 ?auto_16503 ) ) ( AVAILABLE ?auto_16490 ) ( TRUCK-AT ?auto_16504 ?auto_16492 ) ( AVAILABLE ?auto_16499 ) ( SURFACE-AT ?auto_16495 ?auto_16492 ) ( ON ?auto_16495 ?auto_16505 ) ( CLEAR ?auto_16495 ) ( not ( = ?auto_16486 ?auto_16505 ) ) ( not ( = ?auto_16487 ?auto_16505 ) ) ( not ( = ?auto_16500 ?auto_16505 ) ) ( not ( = ?auto_16493 ?auto_16505 ) ) ( not ( = ?auto_16488 ?auto_16505 ) ) ( not ( = ?auto_16502 ?auto_16505 ) ) ( not ( = ?auto_16496 ?auto_16505 ) ) ( not ( = ?auto_16495 ?auto_16505 ) ) ( not ( = ?auto_16498 ?auto_16505 ) ) ( not ( = ?auto_16503 ?auto_16505 ) ) )
    :subtasks
    ( ( !LIFT ?auto_16499 ?auto_16495 ?auto_16505 ?auto_16492 )
      ( MAKE-ON ?auto_16486 ?auto_16487 )
      ( MAKE-ON-VERIFY ?auto_16486 ?auto_16487 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16506 - SURFACE
      ?auto_16507 - SURFACE
    )
    :vars
    (
      ?auto_16515 - HOIST
      ?auto_16512 - PLACE
      ?auto_16508 - PLACE
      ?auto_16509 - HOIST
      ?auto_16511 - SURFACE
      ?auto_16524 - SURFACE
      ?auto_16510 - PLACE
      ?auto_16522 - HOIST
      ?auto_16518 - SURFACE
      ?auto_16514 - SURFACE
      ?auto_16525 - PLACE
      ?auto_16513 - HOIST
      ?auto_16517 - SURFACE
      ?auto_16519 - SURFACE
      ?auto_16523 - SURFACE
      ?auto_16521 - SURFACE
      ?auto_16516 - SURFACE
      ?auto_16520 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16515 ?auto_16512 ) ( IS-CRATE ?auto_16506 ) ( not ( = ?auto_16506 ?auto_16507 ) ) ( not ( = ?auto_16508 ?auto_16512 ) ) ( HOIST-AT ?auto_16509 ?auto_16508 ) ( not ( = ?auto_16515 ?auto_16509 ) ) ( SURFACE-AT ?auto_16506 ?auto_16508 ) ( ON ?auto_16506 ?auto_16511 ) ( CLEAR ?auto_16506 ) ( not ( = ?auto_16506 ?auto_16511 ) ) ( not ( = ?auto_16507 ?auto_16511 ) ) ( IS-CRATE ?auto_16507 ) ( not ( = ?auto_16506 ?auto_16524 ) ) ( not ( = ?auto_16507 ?auto_16524 ) ) ( not ( = ?auto_16511 ?auto_16524 ) ) ( not ( = ?auto_16510 ?auto_16512 ) ) ( not ( = ?auto_16508 ?auto_16510 ) ) ( HOIST-AT ?auto_16522 ?auto_16510 ) ( not ( = ?auto_16515 ?auto_16522 ) ) ( not ( = ?auto_16509 ?auto_16522 ) ) ( SURFACE-AT ?auto_16507 ?auto_16510 ) ( ON ?auto_16507 ?auto_16518 ) ( CLEAR ?auto_16507 ) ( not ( = ?auto_16506 ?auto_16518 ) ) ( not ( = ?auto_16507 ?auto_16518 ) ) ( not ( = ?auto_16511 ?auto_16518 ) ) ( not ( = ?auto_16524 ?auto_16518 ) ) ( IS-CRATE ?auto_16524 ) ( not ( = ?auto_16506 ?auto_16514 ) ) ( not ( = ?auto_16507 ?auto_16514 ) ) ( not ( = ?auto_16511 ?auto_16514 ) ) ( not ( = ?auto_16524 ?auto_16514 ) ) ( not ( = ?auto_16518 ?auto_16514 ) ) ( not ( = ?auto_16525 ?auto_16512 ) ) ( not ( = ?auto_16508 ?auto_16525 ) ) ( not ( = ?auto_16510 ?auto_16525 ) ) ( HOIST-AT ?auto_16513 ?auto_16525 ) ( not ( = ?auto_16515 ?auto_16513 ) ) ( not ( = ?auto_16509 ?auto_16513 ) ) ( not ( = ?auto_16522 ?auto_16513 ) ) ( AVAILABLE ?auto_16513 ) ( SURFACE-AT ?auto_16524 ?auto_16525 ) ( ON ?auto_16524 ?auto_16517 ) ( CLEAR ?auto_16524 ) ( not ( = ?auto_16506 ?auto_16517 ) ) ( not ( = ?auto_16507 ?auto_16517 ) ) ( not ( = ?auto_16511 ?auto_16517 ) ) ( not ( = ?auto_16524 ?auto_16517 ) ) ( not ( = ?auto_16518 ?auto_16517 ) ) ( not ( = ?auto_16514 ?auto_16517 ) ) ( IS-CRATE ?auto_16514 ) ( not ( = ?auto_16506 ?auto_16519 ) ) ( not ( = ?auto_16507 ?auto_16519 ) ) ( not ( = ?auto_16511 ?auto_16519 ) ) ( not ( = ?auto_16524 ?auto_16519 ) ) ( not ( = ?auto_16518 ?auto_16519 ) ) ( not ( = ?auto_16514 ?auto_16519 ) ) ( not ( = ?auto_16517 ?auto_16519 ) ) ( AVAILABLE ?auto_16522 ) ( SURFACE-AT ?auto_16514 ?auto_16510 ) ( ON ?auto_16514 ?auto_16523 ) ( CLEAR ?auto_16514 ) ( not ( = ?auto_16506 ?auto_16523 ) ) ( not ( = ?auto_16507 ?auto_16523 ) ) ( not ( = ?auto_16511 ?auto_16523 ) ) ( not ( = ?auto_16524 ?auto_16523 ) ) ( not ( = ?auto_16518 ?auto_16523 ) ) ( not ( = ?auto_16514 ?auto_16523 ) ) ( not ( = ?auto_16517 ?auto_16523 ) ) ( not ( = ?auto_16519 ?auto_16523 ) ) ( SURFACE-AT ?auto_16521 ?auto_16512 ) ( CLEAR ?auto_16521 ) ( IS-CRATE ?auto_16519 ) ( not ( = ?auto_16506 ?auto_16521 ) ) ( not ( = ?auto_16507 ?auto_16521 ) ) ( not ( = ?auto_16511 ?auto_16521 ) ) ( not ( = ?auto_16524 ?auto_16521 ) ) ( not ( = ?auto_16518 ?auto_16521 ) ) ( not ( = ?auto_16514 ?auto_16521 ) ) ( not ( = ?auto_16517 ?auto_16521 ) ) ( not ( = ?auto_16519 ?auto_16521 ) ) ( not ( = ?auto_16523 ?auto_16521 ) ) ( AVAILABLE ?auto_16515 ) ( AVAILABLE ?auto_16509 ) ( SURFACE-AT ?auto_16519 ?auto_16508 ) ( ON ?auto_16519 ?auto_16516 ) ( CLEAR ?auto_16519 ) ( not ( = ?auto_16506 ?auto_16516 ) ) ( not ( = ?auto_16507 ?auto_16516 ) ) ( not ( = ?auto_16511 ?auto_16516 ) ) ( not ( = ?auto_16524 ?auto_16516 ) ) ( not ( = ?auto_16518 ?auto_16516 ) ) ( not ( = ?auto_16514 ?auto_16516 ) ) ( not ( = ?auto_16517 ?auto_16516 ) ) ( not ( = ?auto_16519 ?auto_16516 ) ) ( not ( = ?auto_16523 ?auto_16516 ) ) ( not ( = ?auto_16521 ?auto_16516 ) ) ( TRUCK-AT ?auto_16520 ?auto_16512 ) )
    :subtasks
    ( ( !DRIVE ?auto_16520 ?auto_16512 ?auto_16508 )
      ( MAKE-ON ?auto_16506 ?auto_16507 )
      ( MAKE-ON-VERIFY ?auto_16506 ?auto_16507 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16526 - SURFACE
      ?auto_16527 - SURFACE
    )
    :vars
    (
      ?auto_16545 - HOIST
      ?auto_16543 - PLACE
      ?auto_16537 - PLACE
      ?auto_16544 - HOIST
      ?auto_16532 - SURFACE
      ?auto_16536 - SURFACE
      ?auto_16540 - PLACE
      ?auto_16538 - HOIST
      ?auto_16528 - SURFACE
      ?auto_16530 - SURFACE
      ?auto_16533 - PLACE
      ?auto_16529 - HOIST
      ?auto_16542 - SURFACE
      ?auto_16535 - SURFACE
      ?auto_16539 - SURFACE
      ?auto_16531 - SURFACE
      ?auto_16541 - SURFACE
      ?auto_16534 - TRUCK
      ?auto_16546 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16545 ?auto_16543 ) ( IS-CRATE ?auto_16526 ) ( not ( = ?auto_16526 ?auto_16527 ) ) ( not ( = ?auto_16537 ?auto_16543 ) ) ( HOIST-AT ?auto_16544 ?auto_16537 ) ( not ( = ?auto_16545 ?auto_16544 ) ) ( SURFACE-AT ?auto_16526 ?auto_16537 ) ( ON ?auto_16526 ?auto_16532 ) ( CLEAR ?auto_16526 ) ( not ( = ?auto_16526 ?auto_16532 ) ) ( not ( = ?auto_16527 ?auto_16532 ) ) ( IS-CRATE ?auto_16527 ) ( not ( = ?auto_16526 ?auto_16536 ) ) ( not ( = ?auto_16527 ?auto_16536 ) ) ( not ( = ?auto_16532 ?auto_16536 ) ) ( not ( = ?auto_16540 ?auto_16543 ) ) ( not ( = ?auto_16537 ?auto_16540 ) ) ( HOIST-AT ?auto_16538 ?auto_16540 ) ( not ( = ?auto_16545 ?auto_16538 ) ) ( not ( = ?auto_16544 ?auto_16538 ) ) ( SURFACE-AT ?auto_16527 ?auto_16540 ) ( ON ?auto_16527 ?auto_16528 ) ( CLEAR ?auto_16527 ) ( not ( = ?auto_16526 ?auto_16528 ) ) ( not ( = ?auto_16527 ?auto_16528 ) ) ( not ( = ?auto_16532 ?auto_16528 ) ) ( not ( = ?auto_16536 ?auto_16528 ) ) ( IS-CRATE ?auto_16536 ) ( not ( = ?auto_16526 ?auto_16530 ) ) ( not ( = ?auto_16527 ?auto_16530 ) ) ( not ( = ?auto_16532 ?auto_16530 ) ) ( not ( = ?auto_16536 ?auto_16530 ) ) ( not ( = ?auto_16528 ?auto_16530 ) ) ( not ( = ?auto_16533 ?auto_16543 ) ) ( not ( = ?auto_16537 ?auto_16533 ) ) ( not ( = ?auto_16540 ?auto_16533 ) ) ( HOIST-AT ?auto_16529 ?auto_16533 ) ( not ( = ?auto_16545 ?auto_16529 ) ) ( not ( = ?auto_16544 ?auto_16529 ) ) ( not ( = ?auto_16538 ?auto_16529 ) ) ( AVAILABLE ?auto_16529 ) ( SURFACE-AT ?auto_16536 ?auto_16533 ) ( ON ?auto_16536 ?auto_16542 ) ( CLEAR ?auto_16536 ) ( not ( = ?auto_16526 ?auto_16542 ) ) ( not ( = ?auto_16527 ?auto_16542 ) ) ( not ( = ?auto_16532 ?auto_16542 ) ) ( not ( = ?auto_16536 ?auto_16542 ) ) ( not ( = ?auto_16528 ?auto_16542 ) ) ( not ( = ?auto_16530 ?auto_16542 ) ) ( IS-CRATE ?auto_16530 ) ( not ( = ?auto_16526 ?auto_16535 ) ) ( not ( = ?auto_16527 ?auto_16535 ) ) ( not ( = ?auto_16532 ?auto_16535 ) ) ( not ( = ?auto_16536 ?auto_16535 ) ) ( not ( = ?auto_16528 ?auto_16535 ) ) ( not ( = ?auto_16530 ?auto_16535 ) ) ( not ( = ?auto_16542 ?auto_16535 ) ) ( AVAILABLE ?auto_16538 ) ( SURFACE-AT ?auto_16530 ?auto_16540 ) ( ON ?auto_16530 ?auto_16539 ) ( CLEAR ?auto_16530 ) ( not ( = ?auto_16526 ?auto_16539 ) ) ( not ( = ?auto_16527 ?auto_16539 ) ) ( not ( = ?auto_16532 ?auto_16539 ) ) ( not ( = ?auto_16536 ?auto_16539 ) ) ( not ( = ?auto_16528 ?auto_16539 ) ) ( not ( = ?auto_16530 ?auto_16539 ) ) ( not ( = ?auto_16542 ?auto_16539 ) ) ( not ( = ?auto_16535 ?auto_16539 ) ) ( IS-CRATE ?auto_16535 ) ( not ( = ?auto_16526 ?auto_16531 ) ) ( not ( = ?auto_16527 ?auto_16531 ) ) ( not ( = ?auto_16532 ?auto_16531 ) ) ( not ( = ?auto_16536 ?auto_16531 ) ) ( not ( = ?auto_16528 ?auto_16531 ) ) ( not ( = ?auto_16530 ?auto_16531 ) ) ( not ( = ?auto_16542 ?auto_16531 ) ) ( not ( = ?auto_16535 ?auto_16531 ) ) ( not ( = ?auto_16539 ?auto_16531 ) ) ( AVAILABLE ?auto_16544 ) ( SURFACE-AT ?auto_16535 ?auto_16537 ) ( ON ?auto_16535 ?auto_16541 ) ( CLEAR ?auto_16535 ) ( not ( = ?auto_16526 ?auto_16541 ) ) ( not ( = ?auto_16527 ?auto_16541 ) ) ( not ( = ?auto_16532 ?auto_16541 ) ) ( not ( = ?auto_16536 ?auto_16541 ) ) ( not ( = ?auto_16528 ?auto_16541 ) ) ( not ( = ?auto_16530 ?auto_16541 ) ) ( not ( = ?auto_16542 ?auto_16541 ) ) ( not ( = ?auto_16535 ?auto_16541 ) ) ( not ( = ?auto_16539 ?auto_16541 ) ) ( not ( = ?auto_16531 ?auto_16541 ) ) ( TRUCK-AT ?auto_16534 ?auto_16543 ) ( SURFACE-AT ?auto_16546 ?auto_16543 ) ( CLEAR ?auto_16546 ) ( LIFTING ?auto_16545 ?auto_16531 ) ( IS-CRATE ?auto_16531 ) ( not ( = ?auto_16526 ?auto_16546 ) ) ( not ( = ?auto_16527 ?auto_16546 ) ) ( not ( = ?auto_16532 ?auto_16546 ) ) ( not ( = ?auto_16536 ?auto_16546 ) ) ( not ( = ?auto_16528 ?auto_16546 ) ) ( not ( = ?auto_16530 ?auto_16546 ) ) ( not ( = ?auto_16542 ?auto_16546 ) ) ( not ( = ?auto_16535 ?auto_16546 ) ) ( not ( = ?auto_16539 ?auto_16546 ) ) ( not ( = ?auto_16531 ?auto_16546 ) ) ( not ( = ?auto_16541 ?auto_16546 ) ) )
    :subtasks
    ( ( !DROP ?auto_16545 ?auto_16531 ?auto_16546 ?auto_16543 )
      ( MAKE-ON ?auto_16526 ?auto_16527 )
      ( MAKE-ON-VERIFY ?auto_16526 ?auto_16527 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16547 - SURFACE
      ?auto_16548 - SURFACE
    )
    :vars
    (
      ?auto_16551 - HOIST
      ?auto_16550 - PLACE
      ?auto_16554 - PLACE
      ?auto_16552 - HOIST
      ?auto_16557 - SURFACE
      ?auto_16565 - SURFACE
      ?auto_16553 - PLACE
      ?auto_16559 - HOIST
      ?auto_16566 - SURFACE
      ?auto_16563 - SURFACE
      ?auto_16549 - PLACE
      ?auto_16556 - HOIST
      ?auto_16561 - SURFACE
      ?auto_16555 - SURFACE
      ?auto_16567 - SURFACE
      ?auto_16564 - SURFACE
      ?auto_16558 - SURFACE
      ?auto_16562 - TRUCK
      ?auto_16560 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16551 ?auto_16550 ) ( IS-CRATE ?auto_16547 ) ( not ( = ?auto_16547 ?auto_16548 ) ) ( not ( = ?auto_16554 ?auto_16550 ) ) ( HOIST-AT ?auto_16552 ?auto_16554 ) ( not ( = ?auto_16551 ?auto_16552 ) ) ( SURFACE-AT ?auto_16547 ?auto_16554 ) ( ON ?auto_16547 ?auto_16557 ) ( CLEAR ?auto_16547 ) ( not ( = ?auto_16547 ?auto_16557 ) ) ( not ( = ?auto_16548 ?auto_16557 ) ) ( IS-CRATE ?auto_16548 ) ( not ( = ?auto_16547 ?auto_16565 ) ) ( not ( = ?auto_16548 ?auto_16565 ) ) ( not ( = ?auto_16557 ?auto_16565 ) ) ( not ( = ?auto_16553 ?auto_16550 ) ) ( not ( = ?auto_16554 ?auto_16553 ) ) ( HOIST-AT ?auto_16559 ?auto_16553 ) ( not ( = ?auto_16551 ?auto_16559 ) ) ( not ( = ?auto_16552 ?auto_16559 ) ) ( SURFACE-AT ?auto_16548 ?auto_16553 ) ( ON ?auto_16548 ?auto_16566 ) ( CLEAR ?auto_16548 ) ( not ( = ?auto_16547 ?auto_16566 ) ) ( not ( = ?auto_16548 ?auto_16566 ) ) ( not ( = ?auto_16557 ?auto_16566 ) ) ( not ( = ?auto_16565 ?auto_16566 ) ) ( IS-CRATE ?auto_16565 ) ( not ( = ?auto_16547 ?auto_16563 ) ) ( not ( = ?auto_16548 ?auto_16563 ) ) ( not ( = ?auto_16557 ?auto_16563 ) ) ( not ( = ?auto_16565 ?auto_16563 ) ) ( not ( = ?auto_16566 ?auto_16563 ) ) ( not ( = ?auto_16549 ?auto_16550 ) ) ( not ( = ?auto_16554 ?auto_16549 ) ) ( not ( = ?auto_16553 ?auto_16549 ) ) ( HOIST-AT ?auto_16556 ?auto_16549 ) ( not ( = ?auto_16551 ?auto_16556 ) ) ( not ( = ?auto_16552 ?auto_16556 ) ) ( not ( = ?auto_16559 ?auto_16556 ) ) ( AVAILABLE ?auto_16556 ) ( SURFACE-AT ?auto_16565 ?auto_16549 ) ( ON ?auto_16565 ?auto_16561 ) ( CLEAR ?auto_16565 ) ( not ( = ?auto_16547 ?auto_16561 ) ) ( not ( = ?auto_16548 ?auto_16561 ) ) ( not ( = ?auto_16557 ?auto_16561 ) ) ( not ( = ?auto_16565 ?auto_16561 ) ) ( not ( = ?auto_16566 ?auto_16561 ) ) ( not ( = ?auto_16563 ?auto_16561 ) ) ( IS-CRATE ?auto_16563 ) ( not ( = ?auto_16547 ?auto_16555 ) ) ( not ( = ?auto_16548 ?auto_16555 ) ) ( not ( = ?auto_16557 ?auto_16555 ) ) ( not ( = ?auto_16565 ?auto_16555 ) ) ( not ( = ?auto_16566 ?auto_16555 ) ) ( not ( = ?auto_16563 ?auto_16555 ) ) ( not ( = ?auto_16561 ?auto_16555 ) ) ( AVAILABLE ?auto_16559 ) ( SURFACE-AT ?auto_16563 ?auto_16553 ) ( ON ?auto_16563 ?auto_16567 ) ( CLEAR ?auto_16563 ) ( not ( = ?auto_16547 ?auto_16567 ) ) ( not ( = ?auto_16548 ?auto_16567 ) ) ( not ( = ?auto_16557 ?auto_16567 ) ) ( not ( = ?auto_16565 ?auto_16567 ) ) ( not ( = ?auto_16566 ?auto_16567 ) ) ( not ( = ?auto_16563 ?auto_16567 ) ) ( not ( = ?auto_16561 ?auto_16567 ) ) ( not ( = ?auto_16555 ?auto_16567 ) ) ( IS-CRATE ?auto_16555 ) ( not ( = ?auto_16547 ?auto_16564 ) ) ( not ( = ?auto_16548 ?auto_16564 ) ) ( not ( = ?auto_16557 ?auto_16564 ) ) ( not ( = ?auto_16565 ?auto_16564 ) ) ( not ( = ?auto_16566 ?auto_16564 ) ) ( not ( = ?auto_16563 ?auto_16564 ) ) ( not ( = ?auto_16561 ?auto_16564 ) ) ( not ( = ?auto_16555 ?auto_16564 ) ) ( not ( = ?auto_16567 ?auto_16564 ) ) ( AVAILABLE ?auto_16552 ) ( SURFACE-AT ?auto_16555 ?auto_16554 ) ( ON ?auto_16555 ?auto_16558 ) ( CLEAR ?auto_16555 ) ( not ( = ?auto_16547 ?auto_16558 ) ) ( not ( = ?auto_16548 ?auto_16558 ) ) ( not ( = ?auto_16557 ?auto_16558 ) ) ( not ( = ?auto_16565 ?auto_16558 ) ) ( not ( = ?auto_16566 ?auto_16558 ) ) ( not ( = ?auto_16563 ?auto_16558 ) ) ( not ( = ?auto_16561 ?auto_16558 ) ) ( not ( = ?auto_16555 ?auto_16558 ) ) ( not ( = ?auto_16567 ?auto_16558 ) ) ( not ( = ?auto_16564 ?auto_16558 ) ) ( TRUCK-AT ?auto_16562 ?auto_16550 ) ( SURFACE-AT ?auto_16560 ?auto_16550 ) ( CLEAR ?auto_16560 ) ( IS-CRATE ?auto_16564 ) ( not ( = ?auto_16547 ?auto_16560 ) ) ( not ( = ?auto_16548 ?auto_16560 ) ) ( not ( = ?auto_16557 ?auto_16560 ) ) ( not ( = ?auto_16565 ?auto_16560 ) ) ( not ( = ?auto_16566 ?auto_16560 ) ) ( not ( = ?auto_16563 ?auto_16560 ) ) ( not ( = ?auto_16561 ?auto_16560 ) ) ( not ( = ?auto_16555 ?auto_16560 ) ) ( not ( = ?auto_16567 ?auto_16560 ) ) ( not ( = ?auto_16564 ?auto_16560 ) ) ( not ( = ?auto_16558 ?auto_16560 ) ) ( AVAILABLE ?auto_16551 ) ( IN ?auto_16564 ?auto_16562 ) )
    :subtasks
    ( ( !UNLOAD ?auto_16551 ?auto_16564 ?auto_16562 ?auto_16550 )
      ( MAKE-ON ?auto_16547 ?auto_16548 )
      ( MAKE-ON-VERIFY ?auto_16547 ?auto_16548 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16568 - SURFACE
      ?auto_16569 - SURFACE
    )
    :vars
    (
      ?auto_16575 - HOIST
      ?auto_16570 - PLACE
      ?auto_16571 - PLACE
      ?auto_16586 - HOIST
      ?auto_16584 - SURFACE
      ?auto_16572 - SURFACE
      ?auto_16574 - PLACE
      ?auto_16582 - HOIST
      ?auto_16577 - SURFACE
      ?auto_16587 - SURFACE
      ?auto_16578 - PLACE
      ?auto_16579 - HOIST
      ?auto_16588 - SURFACE
      ?auto_16583 - SURFACE
      ?auto_16573 - SURFACE
      ?auto_16585 - SURFACE
      ?auto_16576 - SURFACE
      ?auto_16580 - SURFACE
      ?auto_16581 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16575 ?auto_16570 ) ( IS-CRATE ?auto_16568 ) ( not ( = ?auto_16568 ?auto_16569 ) ) ( not ( = ?auto_16571 ?auto_16570 ) ) ( HOIST-AT ?auto_16586 ?auto_16571 ) ( not ( = ?auto_16575 ?auto_16586 ) ) ( SURFACE-AT ?auto_16568 ?auto_16571 ) ( ON ?auto_16568 ?auto_16584 ) ( CLEAR ?auto_16568 ) ( not ( = ?auto_16568 ?auto_16584 ) ) ( not ( = ?auto_16569 ?auto_16584 ) ) ( IS-CRATE ?auto_16569 ) ( not ( = ?auto_16568 ?auto_16572 ) ) ( not ( = ?auto_16569 ?auto_16572 ) ) ( not ( = ?auto_16584 ?auto_16572 ) ) ( not ( = ?auto_16574 ?auto_16570 ) ) ( not ( = ?auto_16571 ?auto_16574 ) ) ( HOIST-AT ?auto_16582 ?auto_16574 ) ( not ( = ?auto_16575 ?auto_16582 ) ) ( not ( = ?auto_16586 ?auto_16582 ) ) ( SURFACE-AT ?auto_16569 ?auto_16574 ) ( ON ?auto_16569 ?auto_16577 ) ( CLEAR ?auto_16569 ) ( not ( = ?auto_16568 ?auto_16577 ) ) ( not ( = ?auto_16569 ?auto_16577 ) ) ( not ( = ?auto_16584 ?auto_16577 ) ) ( not ( = ?auto_16572 ?auto_16577 ) ) ( IS-CRATE ?auto_16572 ) ( not ( = ?auto_16568 ?auto_16587 ) ) ( not ( = ?auto_16569 ?auto_16587 ) ) ( not ( = ?auto_16584 ?auto_16587 ) ) ( not ( = ?auto_16572 ?auto_16587 ) ) ( not ( = ?auto_16577 ?auto_16587 ) ) ( not ( = ?auto_16578 ?auto_16570 ) ) ( not ( = ?auto_16571 ?auto_16578 ) ) ( not ( = ?auto_16574 ?auto_16578 ) ) ( HOIST-AT ?auto_16579 ?auto_16578 ) ( not ( = ?auto_16575 ?auto_16579 ) ) ( not ( = ?auto_16586 ?auto_16579 ) ) ( not ( = ?auto_16582 ?auto_16579 ) ) ( AVAILABLE ?auto_16579 ) ( SURFACE-AT ?auto_16572 ?auto_16578 ) ( ON ?auto_16572 ?auto_16588 ) ( CLEAR ?auto_16572 ) ( not ( = ?auto_16568 ?auto_16588 ) ) ( not ( = ?auto_16569 ?auto_16588 ) ) ( not ( = ?auto_16584 ?auto_16588 ) ) ( not ( = ?auto_16572 ?auto_16588 ) ) ( not ( = ?auto_16577 ?auto_16588 ) ) ( not ( = ?auto_16587 ?auto_16588 ) ) ( IS-CRATE ?auto_16587 ) ( not ( = ?auto_16568 ?auto_16583 ) ) ( not ( = ?auto_16569 ?auto_16583 ) ) ( not ( = ?auto_16584 ?auto_16583 ) ) ( not ( = ?auto_16572 ?auto_16583 ) ) ( not ( = ?auto_16577 ?auto_16583 ) ) ( not ( = ?auto_16587 ?auto_16583 ) ) ( not ( = ?auto_16588 ?auto_16583 ) ) ( AVAILABLE ?auto_16582 ) ( SURFACE-AT ?auto_16587 ?auto_16574 ) ( ON ?auto_16587 ?auto_16573 ) ( CLEAR ?auto_16587 ) ( not ( = ?auto_16568 ?auto_16573 ) ) ( not ( = ?auto_16569 ?auto_16573 ) ) ( not ( = ?auto_16584 ?auto_16573 ) ) ( not ( = ?auto_16572 ?auto_16573 ) ) ( not ( = ?auto_16577 ?auto_16573 ) ) ( not ( = ?auto_16587 ?auto_16573 ) ) ( not ( = ?auto_16588 ?auto_16573 ) ) ( not ( = ?auto_16583 ?auto_16573 ) ) ( IS-CRATE ?auto_16583 ) ( not ( = ?auto_16568 ?auto_16585 ) ) ( not ( = ?auto_16569 ?auto_16585 ) ) ( not ( = ?auto_16584 ?auto_16585 ) ) ( not ( = ?auto_16572 ?auto_16585 ) ) ( not ( = ?auto_16577 ?auto_16585 ) ) ( not ( = ?auto_16587 ?auto_16585 ) ) ( not ( = ?auto_16588 ?auto_16585 ) ) ( not ( = ?auto_16583 ?auto_16585 ) ) ( not ( = ?auto_16573 ?auto_16585 ) ) ( AVAILABLE ?auto_16586 ) ( SURFACE-AT ?auto_16583 ?auto_16571 ) ( ON ?auto_16583 ?auto_16576 ) ( CLEAR ?auto_16583 ) ( not ( = ?auto_16568 ?auto_16576 ) ) ( not ( = ?auto_16569 ?auto_16576 ) ) ( not ( = ?auto_16584 ?auto_16576 ) ) ( not ( = ?auto_16572 ?auto_16576 ) ) ( not ( = ?auto_16577 ?auto_16576 ) ) ( not ( = ?auto_16587 ?auto_16576 ) ) ( not ( = ?auto_16588 ?auto_16576 ) ) ( not ( = ?auto_16583 ?auto_16576 ) ) ( not ( = ?auto_16573 ?auto_16576 ) ) ( not ( = ?auto_16585 ?auto_16576 ) ) ( SURFACE-AT ?auto_16580 ?auto_16570 ) ( CLEAR ?auto_16580 ) ( IS-CRATE ?auto_16585 ) ( not ( = ?auto_16568 ?auto_16580 ) ) ( not ( = ?auto_16569 ?auto_16580 ) ) ( not ( = ?auto_16584 ?auto_16580 ) ) ( not ( = ?auto_16572 ?auto_16580 ) ) ( not ( = ?auto_16577 ?auto_16580 ) ) ( not ( = ?auto_16587 ?auto_16580 ) ) ( not ( = ?auto_16588 ?auto_16580 ) ) ( not ( = ?auto_16583 ?auto_16580 ) ) ( not ( = ?auto_16573 ?auto_16580 ) ) ( not ( = ?auto_16585 ?auto_16580 ) ) ( not ( = ?auto_16576 ?auto_16580 ) ) ( AVAILABLE ?auto_16575 ) ( IN ?auto_16585 ?auto_16581 ) ( TRUCK-AT ?auto_16581 ?auto_16578 ) )
    :subtasks
    ( ( !DRIVE ?auto_16581 ?auto_16578 ?auto_16570 )
      ( MAKE-ON ?auto_16568 ?auto_16569 )
      ( MAKE-ON-VERIFY ?auto_16568 ?auto_16569 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16589 - SURFACE
      ?auto_16590 - SURFACE
    )
    :vars
    (
      ?auto_16604 - HOIST
      ?auto_16609 - PLACE
      ?auto_16607 - PLACE
      ?auto_16600 - HOIST
      ?auto_16605 - SURFACE
      ?auto_16598 - SURFACE
      ?auto_16599 - PLACE
      ?auto_16593 - HOIST
      ?auto_16606 - SURFACE
      ?auto_16601 - SURFACE
      ?auto_16608 - PLACE
      ?auto_16594 - HOIST
      ?auto_16602 - SURFACE
      ?auto_16592 - SURFACE
      ?auto_16596 - SURFACE
      ?auto_16603 - SURFACE
      ?auto_16597 - SURFACE
      ?auto_16595 - SURFACE
      ?auto_16591 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16604 ?auto_16609 ) ( IS-CRATE ?auto_16589 ) ( not ( = ?auto_16589 ?auto_16590 ) ) ( not ( = ?auto_16607 ?auto_16609 ) ) ( HOIST-AT ?auto_16600 ?auto_16607 ) ( not ( = ?auto_16604 ?auto_16600 ) ) ( SURFACE-AT ?auto_16589 ?auto_16607 ) ( ON ?auto_16589 ?auto_16605 ) ( CLEAR ?auto_16589 ) ( not ( = ?auto_16589 ?auto_16605 ) ) ( not ( = ?auto_16590 ?auto_16605 ) ) ( IS-CRATE ?auto_16590 ) ( not ( = ?auto_16589 ?auto_16598 ) ) ( not ( = ?auto_16590 ?auto_16598 ) ) ( not ( = ?auto_16605 ?auto_16598 ) ) ( not ( = ?auto_16599 ?auto_16609 ) ) ( not ( = ?auto_16607 ?auto_16599 ) ) ( HOIST-AT ?auto_16593 ?auto_16599 ) ( not ( = ?auto_16604 ?auto_16593 ) ) ( not ( = ?auto_16600 ?auto_16593 ) ) ( SURFACE-AT ?auto_16590 ?auto_16599 ) ( ON ?auto_16590 ?auto_16606 ) ( CLEAR ?auto_16590 ) ( not ( = ?auto_16589 ?auto_16606 ) ) ( not ( = ?auto_16590 ?auto_16606 ) ) ( not ( = ?auto_16605 ?auto_16606 ) ) ( not ( = ?auto_16598 ?auto_16606 ) ) ( IS-CRATE ?auto_16598 ) ( not ( = ?auto_16589 ?auto_16601 ) ) ( not ( = ?auto_16590 ?auto_16601 ) ) ( not ( = ?auto_16605 ?auto_16601 ) ) ( not ( = ?auto_16598 ?auto_16601 ) ) ( not ( = ?auto_16606 ?auto_16601 ) ) ( not ( = ?auto_16608 ?auto_16609 ) ) ( not ( = ?auto_16607 ?auto_16608 ) ) ( not ( = ?auto_16599 ?auto_16608 ) ) ( HOIST-AT ?auto_16594 ?auto_16608 ) ( not ( = ?auto_16604 ?auto_16594 ) ) ( not ( = ?auto_16600 ?auto_16594 ) ) ( not ( = ?auto_16593 ?auto_16594 ) ) ( SURFACE-AT ?auto_16598 ?auto_16608 ) ( ON ?auto_16598 ?auto_16602 ) ( CLEAR ?auto_16598 ) ( not ( = ?auto_16589 ?auto_16602 ) ) ( not ( = ?auto_16590 ?auto_16602 ) ) ( not ( = ?auto_16605 ?auto_16602 ) ) ( not ( = ?auto_16598 ?auto_16602 ) ) ( not ( = ?auto_16606 ?auto_16602 ) ) ( not ( = ?auto_16601 ?auto_16602 ) ) ( IS-CRATE ?auto_16601 ) ( not ( = ?auto_16589 ?auto_16592 ) ) ( not ( = ?auto_16590 ?auto_16592 ) ) ( not ( = ?auto_16605 ?auto_16592 ) ) ( not ( = ?auto_16598 ?auto_16592 ) ) ( not ( = ?auto_16606 ?auto_16592 ) ) ( not ( = ?auto_16601 ?auto_16592 ) ) ( not ( = ?auto_16602 ?auto_16592 ) ) ( AVAILABLE ?auto_16593 ) ( SURFACE-AT ?auto_16601 ?auto_16599 ) ( ON ?auto_16601 ?auto_16596 ) ( CLEAR ?auto_16601 ) ( not ( = ?auto_16589 ?auto_16596 ) ) ( not ( = ?auto_16590 ?auto_16596 ) ) ( not ( = ?auto_16605 ?auto_16596 ) ) ( not ( = ?auto_16598 ?auto_16596 ) ) ( not ( = ?auto_16606 ?auto_16596 ) ) ( not ( = ?auto_16601 ?auto_16596 ) ) ( not ( = ?auto_16602 ?auto_16596 ) ) ( not ( = ?auto_16592 ?auto_16596 ) ) ( IS-CRATE ?auto_16592 ) ( not ( = ?auto_16589 ?auto_16603 ) ) ( not ( = ?auto_16590 ?auto_16603 ) ) ( not ( = ?auto_16605 ?auto_16603 ) ) ( not ( = ?auto_16598 ?auto_16603 ) ) ( not ( = ?auto_16606 ?auto_16603 ) ) ( not ( = ?auto_16601 ?auto_16603 ) ) ( not ( = ?auto_16602 ?auto_16603 ) ) ( not ( = ?auto_16592 ?auto_16603 ) ) ( not ( = ?auto_16596 ?auto_16603 ) ) ( AVAILABLE ?auto_16600 ) ( SURFACE-AT ?auto_16592 ?auto_16607 ) ( ON ?auto_16592 ?auto_16597 ) ( CLEAR ?auto_16592 ) ( not ( = ?auto_16589 ?auto_16597 ) ) ( not ( = ?auto_16590 ?auto_16597 ) ) ( not ( = ?auto_16605 ?auto_16597 ) ) ( not ( = ?auto_16598 ?auto_16597 ) ) ( not ( = ?auto_16606 ?auto_16597 ) ) ( not ( = ?auto_16601 ?auto_16597 ) ) ( not ( = ?auto_16602 ?auto_16597 ) ) ( not ( = ?auto_16592 ?auto_16597 ) ) ( not ( = ?auto_16596 ?auto_16597 ) ) ( not ( = ?auto_16603 ?auto_16597 ) ) ( SURFACE-AT ?auto_16595 ?auto_16609 ) ( CLEAR ?auto_16595 ) ( IS-CRATE ?auto_16603 ) ( not ( = ?auto_16589 ?auto_16595 ) ) ( not ( = ?auto_16590 ?auto_16595 ) ) ( not ( = ?auto_16605 ?auto_16595 ) ) ( not ( = ?auto_16598 ?auto_16595 ) ) ( not ( = ?auto_16606 ?auto_16595 ) ) ( not ( = ?auto_16601 ?auto_16595 ) ) ( not ( = ?auto_16602 ?auto_16595 ) ) ( not ( = ?auto_16592 ?auto_16595 ) ) ( not ( = ?auto_16596 ?auto_16595 ) ) ( not ( = ?auto_16603 ?auto_16595 ) ) ( not ( = ?auto_16597 ?auto_16595 ) ) ( AVAILABLE ?auto_16604 ) ( TRUCK-AT ?auto_16591 ?auto_16608 ) ( LIFTING ?auto_16594 ?auto_16603 ) )
    :subtasks
    ( ( !LOAD ?auto_16594 ?auto_16603 ?auto_16591 ?auto_16608 )
      ( MAKE-ON ?auto_16589 ?auto_16590 )
      ( MAKE-ON-VERIFY ?auto_16589 ?auto_16590 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16610 - SURFACE
      ?auto_16611 - SURFACE
    )
    :vars
    (
      ?auto_16622 - HOIST
      ?auto_16615 - PLACE
      ?auto_16618 - PLACE
      ?auto_16623 - HOIST
      ?auto_16626 - SURFACE
      ?auto_16616 - SURFACE
      ?auto_16614 - PLACE
      ?auto_16624 - HOIST
      ?auto_16617 - SURFACE
      ?auto_16629 - SURFACE
      ?auto_16630 - PLACE
      ?auto_16619 - HOIST
      ?auto_16628 - SURFACE
      ?auto_16613 - SURFACE
      ?auto_16612 - SURFACE
      ?auto_16627 - SURFACE
      ?auto_16621 - SURFACE
      ?auto_16620 - SURFACE
      ?auto_16625 - TRUCK
      ?auto_16631 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16622 ?auto_16615 ) ( IS-CRATE ?auto_16610 ) ( not ( = ?auto_16610 ?auto_16611 ) ) ( not ( = ?auto_16618 ?auto_16615 ) ) ( HOIST-AT ?auto_16623 ?auto_16618 ) ( not ( = ?auto_16622 ?auto_16623 ) ) ( SURFACE-AT ?auto_16610 ?auto_16618 ) ( ON ?auto_16610 ?auto_16626 ) ( CLEAR ?auto_16610 ) ( not ( = ?auto_16610 ?auto_16626 ) ) ( not ( = ?auto_16611 ?auto_16626 ) ) ( IS-CRATE ?auto_16611 ) ( not ( = ?auto_16610 ?auto_16616 ) ) ( not ( = ?auto_16611 ?auto_16616 ) ) ( not ( = ?auto_16626 ?auto_16616 ) ) ( not ( = ?auto_16614 ?auto_16615 ) ) ( not ( = ?auto_16618 ?auto_16614 ) ) ( HOIST-AT ?auto_16624 ?auto_16614 ) ( not ( = ?auto_16622 ?auto_16624 ) ) ( not ( = ?auto_16623 ?auto_16624 ) ) ( SURFACE-AT ?auto_16611 ?auto_16614 ) ( ON ?auto_16611 ?auto_16617 ) ( CLEAR ?auto_16611 ) ( not ( = ?auto_16610 ?auto_16617 ) ) ( not ( = ?auto_16611 ?auto_16617 ) ) ( not ( = ?auto_16626 ?auto_16617 ) ) ( not ( = ?auto_16616 ?auto_16617 ) ) ( IS-CRATE ?auto_16616 ) ( not ( = ?auto_16610 ?auto_16629 ) ) ( not ( = ?auto_16611 ?auto_16629 ) ) ( not ( = ?auto_16626 ?auto_16629 ) ) ( not ( = ?auto_16616 ?auto_16629 ) ) ( not ( = ?auto_16617 ?auto_16629 ) ) ( not ( = ?auto_16630 ?auto_16615 ) ) ( not ( = ?auto_16618 ?auto_16630 ) ) ( not ( = ?auto_16614 ?auto_16630 ) ) ( HOIST-AT ?auto_16619 ?auto_16630 ) ( not ( = ?auto_16622 ?auto_16619 ) ) ( not ( = ?auto_16623 ?auto_16619 ) ) ( not ( = ?auto_16624 ?auto_16619 ) ) ( SURFACE-AT ?auto_16616 ?auto_16630 ) ( ON ?auto_16616 ?auto_16628 ) ( CLEAR ?auto_16616 ) ( not ( = ?auto_16610 ?auto_16628 ) ) ( not ( = ?auto_16611 ?auto_16628 ) ) ( not ( = ?auto_16626 ?auto_16628 ) ) ( not ( = ?auto_16616 ?auto_16628 ) ) ( not ( = ?auto_16617 ?auto_16628 ) ) ( not ( = ?auto_16629 ?auto_16628 ) ) ( IS-CRATE ?auto_16629 ) ( not ( = ?auto_16610 ?auto_16613 ) ) ( not ( = ?auto_16611 ?auto_16613 ) ) ( not ( = ?auto_16626 ?auto_16613 ) ) ( not ( = ?auto_16616 ?auto_16613 ) ) ( not ( = ?auto_16617 ?auto_16613 ) ) ( not ( = ?auto_16629 ?auto_16613 ) ) ( not ( = ?auto_16628 ?auto_16613 ) ) ( AVAILABLE ?auto_16624 ) ( SURFACE-AT ?auto_16629 ?auto_16614 ) ( ON ?auto_16629 ?auto_16612 ) ( CLEAR ?auto_16629 ) ( not ( = ?auto_16610 ?auto_16612 ) ) ( not ( = ?auto_16611 ?auto_16612 ) ) ( not ( = ?auto_16626 ?auto_16612 ) ) ( not ( = ?auto_16616 ?auto_16612 ) ) ( not ( = ?auto_16617 ?auto_16612 ) ) ( not ( = ?auto_16629 ?auto_16612 ) ) ( not ( = ?auto_16628 ?auto_16612 ) ) ( not ( = ?auto_16613 ?auto_16612 ) ) ( IS-CRATE ?auto_16613 ) ( not ( = ?auto_16610 ?auto_16627 ) ) ( not ( = ?auto_16611 ?auto_16627 ) ) ( not ( = ?auto_16626 ?auto_16627 ) ) ( not ( = ?auto_16616 ?auto_16627 ) ) ( not ( = ?auto_16617 ?auto_16627 ) ) ( not ( = ?auto_16629 ?auto_16627 ) ) ( not ( = ?auto_16628 ?auto_16627 ) ) ( not ( = ?auto_16613 ?auto_16627 ) ) ( not ( = ?auto_16612 ?auto_16627 ) ) ( AVAILABLE ?auto_16623 ) ( SURFACE-AT ?auto_16613 ?auto_16618 ) ( ON ?auto_16613 ?auto_16621 ) ( CLEAR ?auto_16613 ) ( not ( = ?auto_16610 ?auto_16621 ) ) ( not ( = ?auto_16611 ?auto_16621 ) ) ( not ( = ?auto_16626 ?auto_16621 ) ) ( not ( = ?auto_16616 ?auto_16621 ) ) ( not ( = ?auto_16617 ?auto_16621 ) ) ( not ( = ?auto_16629 ?auto_16621 ) ) ( not ( = ?auto_16628 ?auto_16621 ) ) ( not ( = ?auto_16613 ?auto_16621 ) ) ( not ( = ?auto_16612 ?auto_16621 ) ) ( not ( = ?auto_16627 ?auto_16621 ) ) ( SURFACE-AT ?auto_16620 ?auto_16615 ) ( CLEAR ?auto_16620 ) ( IS-CRATE ?auto_16627 ) ( not ( = ?auto_16610 ?auto_16620 ) ) ( not ( = ?auto_16611 ?auto_16620 ) ) ( not ( = ?auto_16626 ?auto_16620 ) ) ( not ( = ?auto_16616 ?auto_16620 ) ) ( not ( = ?auto_16617 ?auto_16620 ) ) ( not ( = ?auto_16629 ?auto_16620 ) ) ( not ( = ?auto_16628 ?auto_16620 ) ) ( not ( = ?auto_16613 ?auto_16620 ) ) ( not ( = ?auto_16612 ?auto_16620 ) ) ( not ( = ?auto_16627 ?auto_16620 ) ) ( not ( = ?auto_16621 ?auto_16620 ) ) ( AVAILABLE ?auto_16622 ) ( TRUCK-AT ?auto_16625 ?auto_16630 ) ( AVAILABLE ?auto_16619 ) ( SURFACE-AT ?auto_16627 ?auto_16630 ) ( ON ?auto_16627 ?auto_16631 ) ( CLEAR ?auto_16627 ) ( not ( = ?auto_16610 ?auto_16631 ) ) ( not ( = ?auto_16611 ?auto_16631 ) ) ( not ( = ?auto_16626 ?auto_16631 ) ) ( not ( = ?auto_16616 ?auto_16631 ) ) ( not ( = ?auto_16617 ?auto_16631 ) ) ( not ( = ?auto_16629 ?auto_16631 ) ) ( not ( = ?auto_16628 ?auto_16631 ) ) ( not ( = ?auto_16613 ?auto_16631 ) ) ( not ( = ?auto_16612 ?auto_16631 ) ) ( not ( = ?auto_16627 ?auto_16631 ) ) ( not ( = ?auto_16621 ?auto_16631 ) ) ( not ( = ?auto_16620 ?auto_16631 ) ) )
    :subtasks
    ( ( !LIFT ?auto_16619 ?auto_16627 ?auto_16631 ?auto_16630 )
      ( MAKE-ON ?auto_16610 ?auto_16611 )
      ( MAKE-ON-VERIFY ?auto_16610 ?auto_16611 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16632 - SURFACE
      ?auto_16633 - SURFACE
    )
    :vars
    (
      ?auto_16634 - HOIST
      ?auto_16635 - PLACE
      ?auto_16650 - PLACE
      ?auto_16643 - HOIST
      ?auto_16649 - SURFACE
      ?auto_16636 - SURFACE
      ?auto_16647 - PLACE
      ?auto_16640 - HOIST
      ?auto_16637 - SURFACE
      ?auto_16652 - SURFACE
      ?auto_16653 - PLACE
      ?auto_16642 - HOIST
      ?auto_16651 - SURFACE
      ?auto_16646 - SURFACE
      ?auto_16644 - SURFACE
      ?auto_16638 - SURFACE
      ?auto_16645 - SURFACE
      ?auto_16639 - SURFACE
      ?auto_16648 - SURFACE
      ?auto_16641 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16634 ?auto_16635 ) ( IS-CRATE ?auto_16632 ) ( not ( = ?auto_16632 ?auto_16633 ) ) ( not ( = ?auto_16650 ?auto_16635 ) ) ( HOIST-AT ?auto_16643 ?auto_16650 ) ( not ( = ?auto_16634 ?auto_16643 ) ) ( SURFACE-AT ?auto_16632 ?auto_16650 ) ( ON ?auto_16632 ?auto_16649 ) ( CLEAR ?auto_16632 ) ( not ( = ?auto_16632 ?auto_16649 ) ) ( not ( = ?auto_16633 ?auto_16649 ) ) ( IS-CRATE ?auto_16633 ) ( not ( = ?auto_16632 ?auto_16636 ) ) ( not ( = ?auto_16633 ?auto_16636 ) ) ( not ( = ?auto_16649 ?auto_16636 ) ) ( not ( = ?auto_16647 ?auto_16635 ) ) ( not ( = ?auto_16650 ?auto_16647 ) ) ( HOIST-AT ?auto_16640 ?auto_16647 ) ( not ( = ?auto_16634 ?auto_16640 ) ) ( not ( = ?auto_16643 ?auto_16640 ) ) ( SURFACE-AT ?auto_16633 ?auto_16647 ) ( ON ?auto_16633 ?auto_16637 ) ( CLEAR ?auto_16633 ) ( not ( = ?auto_16632 ?auto_16637 ) ) ( not ( = ?auto_16633 ?auto_16637 ) ) ( not ( = ?auto_16649 ?auto_16637 ) ) ( not ( = ?auto_16636 ?auto_16637 ) ) ( IS-CRATE ?auto_16636 ) ( not ( = ?auto_16632 ?auto_16652 ) ) ( not ( = ?auto_16633 ?auto_16652 ) ) ( not ( = ?auto_16649 ?auto_16652 ) ) ( not ( = ?auto_16636 ?auto_16652 ) ) ( not ( = ?auto_16637 ?auto_16652 ) ) ( not ( = ?auto_16653 ?auto_16635 ) ) ( not ( = ?auto_16650 ?auto_16653 ) ) ( not ( = ?auto_16647 ?auto_16653 ) ) ( HOIST-AT ?auto_16642 ?auto_16653 ) ( not ( = ?auto_16634 ?auto_16642 ) ) ( not ( = ?auto_16643 ?auto_16642 ) ) ( not ( = ?auto_16640 ?auto_16642 ) ) ( SURFACE-AT ?auto_16636 ?auto_16653 ) ( ON ?auto_16636 ?auto_16651 ) ( CLEAR ?auto_16636 ) ( not ( = ?auto_16632 ?auto_16651 ) ) ( not ( = ?auto_16633 ?auto_16651 ) ) ( not ( = ?auto_16649 ?auto_16651 ) ) ( not ( = ?auto_16636 ?auto_16651 ) ) ( not ( = ?auto_16637 ?auto_16651 ) ) ( not ( = ?auto_16652 ?auto_16651 ) ) ( IS-CRATE ?auto_16652 ) ( not ( = ?auto_16632 ?auto_16646 ) ) ( not ( = ?auto_16633 ?auto_16646 ) ) ( not ( = ?auto_16649 ?auto_16646 ) ) ( not ( = ?auto_16636 ?auto_16646 ) ) ( not ( = ?auto_16637 ?auto_16646 ) ) ( not ( = ?auto_16652 ?auto_16646 ) ) ( not ( = ?auto_16651 ?auto_16646 ) ) ( AVAILABLE ?auto_16640 ) ( SURFACE-AT ?auto_16652 ?auto_16647 ) ( ON ?auto_16652 ?auto_16644 ) ( CLEAR ?auto_16652 ) ( not ( = ?auto_16632 ?auto_16644 ) ) ( not ( = ?auto_16633 ?auto_16644 ) ) ( not ( = ?auto_16649 ?auto_16644 ) ) ( not ( = ?auto_16636 ?auto_16644 ) ) ( not ( = ?auto_16637 ?auto_16644 ) ) ( not ( = ?auto_16652 ?auto_16644 ) ) ( not ( = ?auto_16651 ?auto_16644 ) ) ( not ( = ?auto_16646 ?auto_16644 ) ) ( IS-CRATE ?auto_16646 ) ( not ( = ?auto_16632 ?auto_16638 ) ) ( not ( = ?auto_16633 ?auto_16638 ) ) ( not ( = ?auto_16649 ?auto_16638 ) ) ( not ( = ?auto_16636 ?auto_16638 ) ) ( not ( = ?auto_16637 ?auto_16638 ) ) ( not ( = ?auto_16652 ?auto_16638 ) ) ( not ( = ?auto_16651 ?auto_16638 ) ) ( not ( = ?auto_16646 ?auto_16638 ) ) ( not ( = ?auto_16644 ?auto_16638 ) ) ( AVAILABLE ?auto_16643 ) ( SURFACE-AT ?auto_16646 ?auto_16650 ) ( ON ?auto_16646 ?auto_16645 ) ( CLEAR ?auto_16646 ) ( not ( = ?auto_16632 ?auto_16645 ) ) ( not ( = ?auto_16633 ?auto_16645 ) ) ( not ( = ?auto_16649 ?auto_16645 ) ) ( not ( = ?auto_16636 ?auto_16645 ) ) ( not ( = ?auto_16637 ?auto_16645 ) ) ( not ( = ?auto_16652 ?auto_16645 ) ) ( not ( = ?auto_16651 ?auto_16645 ) ) ( not ( = ?auto_16646 ?auto_16645 ) ) ( not ( = ?auto_16644 ?auto_16645 ) ) ( not ( = ?auto_16638 ?auto_16645 ) ) ( SURFACE-AT ?auto_16639 ?auto_16635 ) ( CLEAR ?auto_16639 ) ( IS-CRATE ?auto_16638 ) ( not ( = ?auto_16632 ?auto_16639 ) ) ( not ( = ?auto_16633 ?auto_16639 ) ) ( not ( = ?auto_16649 ?auto_16639 ) ) ( not ( = ?auto_16636 ?auto_16639 ) ) ( not ( = ?auto_16637 ?auto_16639 ) ) ( not ( = ?auto_16652 ?auto_16639 ) ) ( not ( = ?auto_16651 ?auto_16639 ) ) ( not ( = ?auto_16646 ?auto_16639 ) ) ( not ( = ?auto_16644 ?auto_16639 ) ) ( not ( = ?auto_16638 ?auto_16639 ) ) ( not ( = ?auto_16645 ?auto_16639 ) ) ( AVAILABLE ?auto_16634 ) ( AVAILABLE ?auto_16642 ) ( SURFACE-AT ?auto_16638 ?auto_16653 ) ( ON ?auto_16638 ?auto_16648 ) ( CLEAR ?auto_16638 ) ( not ( = ?auto_16632 ?auto_16648 ) ) ( not ( = ?auto_16633 ?auto_16648 ) ) ( not ( = ?auto_16649 ?auto_16648 ) ) ( not ( = ?auto_16636 ?auto_16648 ) ) ( not ( = ?auto_16637 ?auto_16648 ) ) ( not ( = ?auto_16652 ?auto_16648 ) ) ( not ( = ?auto_16651 ?auto_16648 ) ) ( not ( = ?auto_16646 ?auto_16648 ) ) ( not ( = ?auto_16644 ?auto_16648 ) ) ( not ( = ?auto_16638 ?auto_16648 ) ) ( not ( = ?auto_16645 ?auto_16648 ) ) ( not ( = ?auto_16639 ?auto_16648 ) ) ( TRUCK-AT ?auto_16641 ?auto_16635 ) )
    :subtasks
    ( ( !DRIVE ?auto_16641 ?auto_16635 ?auto_16653 )
      ( MAKE-ON ?auto_16632 ?auto_16633 )
      ( MAKE-ON-VERIFY ?auto_16632 ?auto_16633 ) )
  )

)

