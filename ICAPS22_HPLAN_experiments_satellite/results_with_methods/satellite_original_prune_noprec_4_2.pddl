( define ( domain satellite )
  ( :requirements :strips :typing :equality :htn )
  ( :types direction instrument mode satellite )
  ( :predicates
    ( ON_BOARD ?i - INSTRUMENT ?s - SATELLITE )
    ( SUPPORTS ?i - INSTRUMENT ?m - MODE )
    ( POINTING ?s - SATELLITE ?d - DIRECTION )
    ( POWER_AVAIL ?s - SATELLITE )
    ( POWER_ON ?i - INSTRUMENT )
    ( CALIBRATED ?i - INSTRUMENT )
    ( NOT_CALIBRATED ?i - INSTRUMENT )
    ( HAVE_IMAGE ?d - DIRECTION ?m - MODE )
    ( CALIBRATION_TARGET ?i - INSTRUMENT ?d - DIRECTION )
  )
  ( :action !TURN_TO
    :parameters
    (
      ?s - SATELLITE
      ?d_new - DIRECTION
      ?d_prev - DIRECTION
    )
    :precondition
    ( and ( POINTING ?s ?d_prev ) ( not ( = ?d_new ?d_prev ) ) )
    :effect
    ( and ( POINTING ?s ?d_new ) ( not ( POINTING ?s ?d_prev ) ) )
  )
  ( :action !SWITCH_ON
    :parameters
    (
      ?i - INSTRUMENT
      ?s - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?i ?s ) ( POWER_AVAIL ?s ) )
    :effect
    ( and ( POWER_ON ?i ) ( NOT_CALIBRATED ?i ) ( not ( CALIBRATED ?i ) ) ( not ( POWER_AVAIL ?s ) ) )
  )
  ( :action !SWITCH_OFF
    :parameters
    (
      ?i - INSTRUMENT
      ?s - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?i ?s ) ( POWER_ON ?i ) )
    :effect
    ( and ( POWER_AVAIL ?s ) ( not ( POWER_ON ?i ) ) )
  )
  ( :action !CALIBRATE
    :parameters
    (
      ?s - SATELLITE
      ?i - INSTRUMENT
      ?d - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?i ?s ) ( CALIBRATION_TARGET ?i ?d ) ( POINTING ?s ?d ) ( POWER_ON ?i ) ( NOT_CALIBRATED ?i ) )
    :effect
    ( and ( CALIBRATED ?i ) ( not ( NOT_CALIBRATED ?i ) ) )
  )
  ( :action !TAKE_IMAGE
    :parameters
    (
      ?s - SATELLITE
      ?d - DIRECTION
      ?i - INSTRUMENT
      ?m - MODE
    )
    :precondition
    ( and ( CALIBRATED ?i ) ( ON_BOARD ?i ?s ) ( SUPPORTS ?i ?m ) ( POWER_ON ?i ) ( POINTING ?s ?d ) ( POWER_ON ?i ) )
    :effect
    ( and ( HAVE_IMAGE ?d ?m ) )
  )
  ( :method GET_IMAGE
    :parameters
    (
      ?goal_dir - DIRECTION
      ?goal_mode - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir ?goal_mode ) )
    :subtasks
    (  )
  )

  ( :method GET-1IMAGE-VERIFY
    :parameters
    (
      ?goal_dir1 - DIRECTION
      ?goal_mode1 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) )
    :subtasks
    (  )
  )

  ( :method GET-2IMAGE-VERIFY
    :parameters
    (
      ?goal_dir1 - DIRECTION
      ?goal_mode1 - MODE
      ?goal_dir2 - DIRECTION
      ?goal_mode2 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) ( HAVE_IMAGE ?goal_dir2 ?goal_mode2 ) )
    :subtasks
    (  )
  )

  ( :method GET-3IMAGE-VERIFY
    :parameters
    (
      ?goal_dir1 - DIRECTION
      ?goal_mode1 - MODE
      ?goal_dir2 - DIRECTION
      ?goal_mode2 - MODE
      ?goal_dir3 - DIRECTION
      ?goal_mode3 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) ( HAVE_IMAGE ?goal_dir2 ?goal_mode2 ) ( HAVE_IMAGE ?goal_dir3 ?goal_mode3 ) )
    :subtasks
    (  )
  )

  ( :method GET-4IMAGE-VERIFY
    :parameters
    (
      ?goal_dir1 - DIRECTION
      ?goal_mode1 - MODE
      ?goal_dir2 - DIRECTION
      ?goal_mode2 - MODE
      ?goal_dir3 - DIRECTION
      ?goal_mode3 - MODE
      ?goal_dir4 - DIRECTION
      ?goal_mode4 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) ( HAVE_IMAGE ?goal_dir2 ?goal_mode2 ) ( HAVE_IMAGE ?goal_dir3 ?goal_mode3 ) ( HAVE_IMAGE ?goal_dir4 ?goal_mode4 ) )
    :subtasks
    (  )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_192693 - DIRECTION
      ?auto_192694 - MODE
    )
    :vars
    (
      ?auto_192695 - INSTRUMENT
      ?auto_192696 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_192695 ) ( ON_BOARD ?auto_192695 ?auto_192696 ) ( SUPPORTS ?auto_192695 ?auto_192694 ) ( POWER_ON ?auto_192695 ) ( POINTING ?auto_192696 ?auto_192693 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_192696 ?auto_192693 ?auto_192695 ?auto_192694 )
      ( GET-1IMAGE-VERIFY ?auto_192693 ?auto_192694 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_192721 - DIRECTION
      ?auto_192722 - MODE
    )
    :vars
    (
      ?auto_192723 - INSTRUMENT
      ?auto_192724 - SATELLITE
      ?auto_192725 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_192723 ) ( ON_BOARD ?auto_192723 ?auto_192724 ) ( SUPPORTS ?auto_192723 ?auto_192722 ) ( POWER_ON ?auto_192723 ) ( POINTING ?auto_192724 ?auto_192725 ) ( not ( = ?auto_192721 ?auto_192725 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_192724 ?auto_192721 ?auto_192725 )
      ( GET-1IMAGE ?auto_192721 ?auto_192722 )
      ( GET-1IMAGE-VERIFY ?auto_192721 ?auto_192722 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_192753 - DIRECTION
      ?auto_192754 - MODE
    )
    :vars
    (
      ?auto_192756 - INSTRUMENT
      ?auto_192755 - SATELLITE
      ?auto_192757 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_192756 ?auto_192755 ) ( SUPPORTS ?auto_192756 ?auto_192754 ) ( POWER_ON ?auto_192756 ) ( POINTING ?auto_192755 ?auto_192757 ) ( not ( = ?auto_192753 ?auto_192757 ) ) ( CALIBRATION_TARGET ?auto_192756 ?auto_192757 ) ( NOT_CALIBRATED ?auto_192756 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_192755 ?auto_192756 ?auto_192757 )
      ( GET-1IMAGE ?auto_192753 ?auto_192754 )
      ( GET-1IMAGE-VERIFY ?auto_192753 ?auto_192754 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_192785 - DIRECTION
      ?auto_192786 - MODE
    )
    :vars
    (
      ?auto_192789 - INSTRUMENT
      ?auto_192788 - SATELLITE
      ?auto_192787 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_192789 ?auto_192788 ) ( SUPPORTS ?auto_192789 ?auto_192786 ) ( POINTING ?auto_192788 ?auto_192787 ) ( not ( = ?auto_192785 ?auto_192787 ) ) ( CALIBRATION_TARGET ?auto_192789 ?auto_192787 ) ( POWER_AVAIL ?auto_192788 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_192789 ?auto_192788 )
      ( GET-1IMAGE ?auto_192785 ?auto_192786 )
      ( GET-1IMAGE-VERIFY ?auto_192785 ?auto_192786 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_192817 - DIRECTION
      ?auto_192818 - MODE
    )
    :vars
    (
      ?auto_192819 - INSTRUMENT
      ?auto_192820 - SATELLITE
      ?auto_192821 - DIRECTION
      ?auto_192822 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_192819 ?auto_192820 ) ( SUPPORTS ?auto_192819 ?auto_192818 ) ( not ( = ?auto_192817 ?auto_192821 ) ) ( CALIBRATION_TARGET ?auto_192819 ?auto_192821 ) ( POWER_AVAIL ?auto_192820 ) ( POINTING ?auto_192820 ?auto_192822 ) ( not ( = ?auto_192821 ?auto_192822 ) ) ( not ( = ?auto_192817 ?auto_192822 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_192820 ?auto_192821 ?auto_192822 )
      ( GET-1IMAGE ?auto_192817 ?auto_192818 )
      ( GET-1IMAGE-VERIFY ?auto_192817 ?auto_192818 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_193034 - DIRECTION
      ?auto_193035 - MODE
      ?auto_193036 - DIRECTION
      ?auto_193033 - MODE
    )
    :vars
    (
      ?auto_193037 - INSTRUMENT
      ?auto_193038 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_193037 ) ( ON_BOARD ?auto_193037 ?auto_193038 ) ( SUPPORTS ?auto_193037 ?auto_193033 ) ( POWER_ON ?auto_193037 ) ( POINTING ?auto_193038 ?auto_193036 ) ( HAVE_IMAGE ?auto_193034 ?auto_193035 ) ( not ( = ?auto_193034 ?auto_193036 ) ) ( not ( = ?auto_193035 ?auto_193033 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_193036 ?auto_193033 )
      ( GET-2IMAGE-VERIFY ?auto_193034 ?auto_193035 ?auto_193036 ?auto_193033 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_193040 - DIRECTION
      ?auto_193041 - MODE
      ?auto_193042 - DIRECTION
      ?auto_193039 - MODE
    )
    :vars
    (
      ?auto_193043 - INSTRUMENT
      ?auto_193044 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_193043 ) ( ON_BOARD ?auto_193043 ?auto_193044 ) ( SUPPORTS ?auto_193043 ?auto_193041 ) ( POWER_ON ?auto_193043 ) ( POINTING ?auto_193044 ?auto_193040 ) ( HAVE_IMAGE ?auto_193042 ?auto_193039 ) ( not ( = ?auto_193040 ?auto_193042 ) ) ( not ( = ?auto_193041 ?auto_193039 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_193040 ?auto_193041 )
      ( GET-2IMAGE-VERIFY ?auto_193040 ?auto_193041 ?auto_193042 ?auto_193039 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_193052 - DIRECTION
      ?auto_193053 - MODE
      ?auto_193054 - DIRECTION
      ?auto_193051 - MODE
      ?auto_193055 - DIRECTION
      ?auto_193056 - MODE
    )
    :vars
    (
      ?auto_193057 - INSTRUMENT
      ?auto_193058 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_193057 ) ( ON_BOARD ?auto_193057 ?auto_193058 ) ( SUPPORTS ?auto_193057 ?auto_193056 ) ( POWER_ON ?auto_193057 ) ( POINTING ?auto_193058 ?auto_193055 ) ( HAVE_IMAGE ?auto_193052 ?auto_193053 ) ( HAVE_IMAGE ?auto_193054 ?auto_193051 ) ( not ( = ?auto_193052 ?auto_193054 ) ) ( not ( = ?auto_193052 ?auto_193055 ) ) ( not ( = ?auto_193053 ?auto_193051 ) ) ( not ( = ?auto_193053 ?auto_193056 ) ) ( not ( = ?auto_193054 ?auto_193055 ) ) ( not ( = ?auto_193051 ?auto_193056 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_193055 ?auto_193056 )
      ( GET-3IMAGE-VERIFY ?auto_193052 ?auto_193053 ?auto_193054 ?auto_193051 ?auto_193055 ?auto_193056 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_193060 - DIRECTION
      ?auto_193061 - MODE
      ?auto_193062 - DIRECTION
      ?auto_193059 - MODE
      ?auto_193063 - DIRECTION
      ?auto_193064 - MODE
    )
    :vars
    (
      ?auto_193065 - INSTRUMENT
      ?auto_193066 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_193065 ) ( ON_BOARD ?auto_193065 ?auto_193066 ) ( SUPPORTS ?auto_193065 ?auto_193059 ) ( POWER_ON ?auto_193065 ) ( POINTING ?auto_193066 ?auto_193062 ) ( HAVE_IMAGE ?auto_193060 ?auto_193061 ) ( HAVE_IMAGE ?auto_193063 ?auto_193064 ) ( not ( = ?auto_193060 ?auto_193062 ) ) ( not ( = ?auto_193060 ?auto_193063 ) ) ( not ( = ?auto_193061 ?auto_193059 ) ) ( not ( = ?auto_193061 ?auto_193064 ) ) ( not ( = ?auto_193062 ?auto_193063 ) ) ( not ( = ?auto_193059 ?auto_193064 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_193062 ?auto_193059 )
      ( GET-3IMAGE-VERIFY ?auto_193060 ?auto_193061 ?auto_193062 ?auto_193059 ?auto_193063 ?auto_193064 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_193076 - DIRECTION
      ?auto_193077 - MODE
      ?auto_193078 - DIRECTION
      ?auto_193075 - MODE
      ?auto_193079 - DIRECTION
      ?auto_193080 - MODE
    )
    :vars
    (
      ?auto_193081 - INSTRUMENT
      ?auto_193082 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_193081 ) ( ON_BOARD ?auto_193081 ?auto_193082 ) ( SUPPORTS ?auto_193081 ?auto_193077 ) ( POWER_ON ?auto_193081 ) ( POINTING ?auto_193082 ?auto_193076 ) ( HAVE_IMAGE ?auto_193078 ?auto_193075 ) ( HAVE_IMAGE ?auto_193079 ?auto_193080 ) ( not ( = ?auto_193076 ?auto_193078 ) ) ( not ( = ?auto_193076 ?auto_193079 ) ) ( not ( = ?auto_193077 ?auto_193075 ) ) ( not ( = ?auto_193077 ?auto_193080 ) ) ( not ( = ?auto_193078 ?auto_193079 ) ) ( not ( = ?auto_193075 ?auto_193080 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_193076 ?auto_193077 )
      ( GET-3IMAGE-VERIFY ?auto_193076 ?auto_193077 ?auto_193078 ?auto_193075 ?auto_193079 ?auto_193080 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_193108 - DIRECTION
      ?auto_193109 - MODE
      ?auto_193110 - DIRECTION
      ?auto_193107 - MODE
      ?auto_193111 - DIRECTION
      ?auto_193112 - MODE
      ?auto_193113 - DIRECTION
      ?auto_193114 - MODE
    )
    :vars
    (
      ?auto_193115 - INSTRUMENT
      ?auto_193116 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_193115 ) ( ON_BOARD ?auto_193115 ?auto_193116 ) ( SUPPORTS ?auto_193115 ?auto_193114 ) ( POWER_ON ?auto_193115 ) ( POINTING ?auto_193116 ?auto_193113 ) ( HAVE_IMAGE ?auto_193108 ?auto_193109 ) ( HAVE_IMAGE ?auto_193110 ?auto_193107 ) ( HAVE_IMAGE ?auto_193111 ?auto_193112 ) ( not ( = ?auto_193108 ?auto_193110 ) ) ( not ( = ?auto_193108 ?auto_193111 ) ) ( not ( = ?auto_193108 ?auto_193113 ) ) ( not ( = ?auto_193109 ?auto_193107 ) ) ( not ( = ?auto_193109 ?auto_193112 ) ) ( not ( = ?auto_193109 ?auto_193114 ) ) ( not ( = ?auto_193110 ?auto_193111 ) ) ( not ( = ?auto_193110 ?auto_193113 ) ) ( not ( = ?auto_193107 ?auto_193112 ) ) ( not ( = ?auto_193107 ?auto_193114 ) ) ( not ( = ?auto_193111 ?auto_193113 ) ) ( not ( = ?auto_193112 ?auto_193114 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_193113 ?auto_193114 )
      ( GET-4IMAGE-VERIFY ?auto_193108 ?auto_193109 ?auto_193110 ?auto_193107 ?auto_193111 ?auto_193112 ?auto_193113 ?auto_193114 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_193118 - DIRECTION
      ?auto_193119 - MODE
      ?auto_193120 - DIRECTION
      ?auto_193117 - MODE
      ?auto_193121 - DIRECTION
      ?auto_193122 - MODE
      ?auto_193123 - DIRECTION
      ?auto_193124 - MODE
    )
    :vars
    (
      ?auto_193125 - INSTRUMENT
      ?auto_193126 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_193125 ) ( ON_BOARD ?auto_193125 ?auto_193126 ) ( SUPPORTS ?auto_193125 ?auto_193122 ) ( POWER_ON ?auto_193125 ) ( POINTING ?auto_193126 ?auto_193121 ) ( HAVE_IMAGE ?auto_193118 ?auto_193119 ) ( HAVE_IMAGE ?auto_193120 ?auto_193117 ) ( HAVE_IMAGE ?auto_193123 ?auto_193124 ) ( not ( = ?auto_193118 ?auto_193120 ) ) ( not ( = ?auto_193118 ?auto_193121 ) ) ( not ( = ?auto_193118 ?auto_193123 ) ) ( not ( = ?auto_193119 ?auto_193117 ) ) ( not ( = ?auto_193119 ?auto_193122 ) ) ( not ( = ?auto_193119 ?auto_193124 ) ) ( not ( = ?auto_193120 ?auto_193121 ) ) ( not ( = ?auto_193120 ?auto_193123 ) ) ( not ( = ?auto_193117 ?auto_193122 ) ) ( not ( = ?auto_193117 ?auto_193124 ) ) ( not ( = ?auto_193121 ?auto_193123 ) ) ( not ( = ?auto_193122 ?auto_193124 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_193121 ?auto_193122 )
      ( GET-4IMAGE-VERIFY ?auto_193118 ?auto_193119 ?auto_193120 ?auto_193117 ?auto_193121 ?auto_193122 ?auto_193123 ?auto_193124 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_193138 - DIRECTION
      ?auto_193139 - MODE
      ?auto_193140 - DIRECTION
      ?auto_193137 - MODE
      ?auto_193141 - DIRECTION
      ?auto_193142 - MODE
      ?auto_193143 - DIRECTION
      ?auto_193144 - MODE
    )
    :vars
    (
      ?auto_193145 - INSTRUMENT
      ?auto_193146 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_193145 ) ( ON_BOARD ?auto_193145 ?auto_193146 ) ( SUPPORTS ?auto_193145 ?auto_193137 ) ( POWER_ON ?auto_193145 ) ( POINTING ?auto_193146 ?auto_193140 ) ( HAVE_IMAGE ?auto_193138 ?auto_193139 ) ( HAVE_IMAGE ?auto_193141 ?auto_193142 ) ( HAVE_IMAGE ?auto_193143 ?auto_193144 ) ( not ( = ?auto_193138 ?auto_193140 ) ) ( not ( = ?auto_193138 ?auto_193141 ) ) ( not ( = ?auto_193138 ?auto_193143 ) ) ( not ( = ?auto_193139 ?auto_193137 ) ) ( not ( = ?auto_193139 ?auto_193142 ) ) ( not ( = ?auto_193139 ?auto_193144 ) ) ( not ( = ?auto_193140 ?auto_193141 ) ) ( not ( = ?auto_193140 ?auto_193143 ) ) ( not ( = ?auto_193137 ?auto_193142 ) ) ( not ( = ?auto_193137 ?auto_193144 ) ) ( not ( = ?auto_193141 ?auto_193143 ) ) ( not ( = ?auto_193142 ?auto_193144 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_193140 ?auto_193137 )
      ( GET-4IMAGE-VERIFY ?auto_193138 ?auto_193139 ?auto_193140 ?auto_193137 ?auto_193141 ?auto_193142 ?auto_193143 ?auto_193144 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_193178 - DIRECTION
      ?auto_193179 - MODE
      ?auto_193180 - DIRECTION
      ?auto_193177 - MODE
      ?auto_193181 - DIRECTION
      ?auto_193182 - MODE
      ?auto_193183 - DIRECTION
      ?auto_193184 - MODE
    )
    :vars
    (
      ?auto_193185 - INSTRUMENT
      ?auto_193186 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_193185 ) ( ON_BOARD ?auto_193185 ?auto_193186 ) ( SUPPORTS ?auto_193185 ?auto_193179 ) ( POWER_ON ?auto_193185 ) ( POINTING ?auto_193186 ?auto_193178 ) ( HAVE_IMAGE ?auto_193180 ?auto_193177 ) ( HAVE_IMAGE ?auto_193181 ?auto_193182 ) ( HAVE_IMAGE ?auto_193183 ?auto_193184 ) ( not ( = ?auto_193178 ?auto_193180 ) ) ( not ( = ?auto_193178 ?auto_193181 ) ) ( not ( = ?auto_193178 ?auto_193183 ) ) ( not ( = ?auto_193179 ?auto_193177 ) ) ( not ( = ?auto_193179 ?auto_193182 ) ) ( not ( = ?auto_193179 ?auto_193184 ) ) ( not ( = ?auto_193180 ?auto_193181 ) ) ( not ( = ?auto_193180 ?auto_193183 ) ) ( not ( = ?auto_193177 ?auto_193182 ) ) ( not ( = ?auto_193177 ?auto_193184 ) ) ( not ( = ?auto_193181 ?auto_193183 ) ) ( not ( = ?auto_193182 ?auto_193184 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_193178 ?auto_193179 )
      ( GET-4IMAGE-VERIFY ?auto_193178 ?auto_193179 ?auto_193180 ?auto_193177 ?auto_193181 ?auto_193182 ?auto_193183 ?auto_193184 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_193263 - DIRECTION
      ?auto_193264 - MODE
      ?auto_193265 - DIRECTION
      ?auto_193262 - MODE
    )
    :vars
    (
      ?auto_193268 - INSTRUMENT
      ?auto_193266 - SATELLITE
      ?auto_193267 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_193268 ) ( ON_BOARD ?auto_193268 ?auto_193266 ) ( SUPPORTS ?auto_193268 ?auto_193262 ) ( POWER_ON ?auto_193268 ) ( POINTING ?auto_193266 ?auto_193267 ) ( not ( = ?auto_193265 ?auto_193267 ) ) ( HAVE_IMAGE ?auto_193263 ?auto_193264 ) ( not ( = ?auto_193263 ?auto_193265 ) ) ( not ( = ?auto_193263 ?auto_193267 ) ) ( not ( = ?auto_193264 ?auto_193262 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_193265 ?auto_193262 )
      ( GET-2IMAGE-VERIFY ?auto_193263 ?auto_193264 ?auto_193265 ?auto_193262 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_193270 - DIRECTION
      ?auto_193271 - MODE
      ?auto_193272 - DIRECTION
      ?auto_193269 - MODE
    )
    :vars
    (
      ?auto_193273 - INSTRUMENT
      ?auto_193275 - SATELLITE
      ?auto_193274 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_193273 ) ( ON_BOARD ?auto_193273 ?auto_193275 ) ( SUPPORTS ?auto_193273 ?auto_193271 ) ( POWER_ON ?auto_193273 ) ( POINTING ?auto_193275 ?auto_193274 ) ( not ( = ?auto_193270 ?auto_193274 ) ) ( HAVE_IMAGE ?auto_193272 ?auto_193269 ) ( not ( = ?auto_193272 ?auto_193270 ) ) ( not ( = ?auto_193272 ?auto_193274 ) ) ( not ( = ?auto_193269 ?auto_193271 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_193272 ?auto_193269 ?auto_193270 ?auto_193271 )
      ( GET-2IMAGE-VERIFY ?auto_193270 ?auto_193271 ?auto_193272 ?auto_193269 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_193286 - DIRECTION
      ?auto_193287 - MODE
      ?auto_193288 - DIRECTION
      ?auto_193285 - MODE
      ?auto_193289 - DIRECTION
      ?auto_193290 - MODE
    )
    :vars
    (
      ?auto_193291 - INSTRUMENT
      ?auto_193293 - SATELLITE
      ?auto_193292 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_193291 ) ( ON_BOARD ?auto_193291 ?auto_193293 ) ( SUPPORTS ?auto_193291 ?auto_193290 ) ( POWER_ON ?auto_193291 ) ( POINTING ?auto_193293 ?auto_193292 ) ( not ( = ?auto_193289 ?auto_193292 ) ) ( HAVE_IMAGE ?auto_193286 ?auto_193287 ) ( not ( = ?auto_193286 ?auto_193289 ) ) ( not ( = ?auto_193286 ?auto_193292 ) ) ( not ( = ?auto_193287 ?auto_193290 ) ) ( HAVE_IMAGE ?auto_193288 ?auto_193285 ) ( not ( = ?auto_193286 ?auto_193288 ) ) ( not ( = ?auto_193287 ?auto_193285 ) ) ( not ( = ?auto_193288 ?auto_193289 ) ) ( not ( = ?auto_193288 ?auto_193292 ) ) ( not ( = ?auto_193285 ?auto_193290 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_193286 ?auto_193287 ?auto_193289 ?auto_193290 )
      ( GET-3IMAGE-VERIFY ?auto_193286 ?auto_193287 ?auto_193288 ?auto_193285 ?auto_193289 ?auto_193290 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_193295 - DIRECTION
      ?auto_193296 - MODE
      ?auto_193297 - DIRECTION
      ?auto_193294 - MODE
      ?auto_193298 - DIRECTION
      ?auto_193299 - MODE
    )
    :vars
    (
      ?auto_193300 - INSTRUMENT
      ?auto_193302 - SATELLITE
      ?auto_193301 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_193300 ) ( ON_BOARD ?auto_193300 ?auto_193302 ) ( SUPPORTS ?auto_193300 ?auto_193294 ) ( POWER_ON ?auto_193300 ) ( POINTING ?auto_193302 ?auto_193301 ) ( not ( = ?auto_193297 ?auto_193301 ) ) ( HAVE_IMAGE ?auto_193298 ?auto_193299 ) ( not ( = ?auto_193298 ?auto_193297 ) ) ( not ( = ?auto_193298 ?auto_193301 ) ) ( not ( = ?auto_193299 ?auto_193294 ) ) ( HAVE_IMAGE ?auto_193295 ?auto_193296 ) ( not ( = ?auto_193295 ?auto_193297 ) ) ( not ( = ?auto_193295 ?auto_193298 ) ) ( not ( = ?auto_193295 ?auto_193301 ) ) ( not ( = ?auto_193296 ?auto_193294 ) ) ( not ( = ?auto_193296 ?auto_193299 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_193298 ?auto_193299 ?auto_193297 ?auto_193294 )
      ( GET-3IMAGE-VERIFY ?auto_193295 ?auto_193296 ?auto_193297 ?auto_193294 ?auto_193298 ?auto_193299 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_193313 - DIRECTION
      ?auto_193314 - MODE
      ?auto_193315 - DIRECTION
      ?auto_193312 - MODE
      ?auto_193316 - DIRECTION
      ?auto_193317 - MODE
    )
    :vars
    (
      ?auto_193318 - INSTRUMENT
      ?auto_193320 - SATELLITE
      ?auto_193319 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_193318 ) ( ON_BOARD ?auto_193318 ?auto_193320 ) ( SUPPORTS ?auto_193318 ?auto_193314 ) ( POWER_ON ?auto_193318 ) ( POINTING ?auto_193320 ?auto_193319 ) ( not ( = ?auto_193313 ?auto_193319 ) ) ( HAVE_IMAGE ?auto_193315 ?auto_193312 ) ( not ( = ?auto_193315 ?auto_193313 ) ) ( not ( = ?auto_193315 ?auto_193319 ) ) ( not ( = ?auto_193312 ?auto_193314 ) ) ( HAVE_IMAGE ?auto_193316 ?auto_193317 ) ( not ( = ?auto_193313 ?auto_193316 ) ) ( not ( = ?auto_193314 ?auto_193317 ) ) ( not ( = ?auto_193315 ?auto_193316 ) ) ( not ( = ?auto_193312 ?auto_193317 ) ) ( not ( = ?auto_193316 ?auto_193319 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_193315 ?auto_193312 ?auto_193313 ?auto_193314 )
      ( GET-3IMAGE-VERIFY ?auto_193313 ?auto_193314 ?auto_193315 ?auto_193312 ?auto_193316 ?auto_193317 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_193351 - DIRECTION
      ?auto_193352 - MODE
      ?auto_193353 - DIRECTION
      ?auto_193350 - MODE
      ?auto_193354 - DIRECTION
      ?auto_193355 - MODE
      ?auto_193356 - DIRECTION
      ?auto_193357 - MODE
    )
    :vars
    (
      ?auto_193358 - INSTRUMENT
      ?auto_193360 - SATELLITE
      ?auto_193359 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_193358 ) ( ON_BOARD ?auto_193358 ?auto_193360 ) ( SUPPORTS ?auto_193358 ?auto_193357 ) ( POWER_ON ?auto_193358 ) ( POINTING ?auto_193360 ?auto_193359 ) ( not ( = ?auto_193356 ?auto_193359 ) ) ( HAVE_IMAGE ?auto_193351 ?auto_193352 ) ( not ( = ?auto_193351 ?auto_193356 ) ) ( not ( = ?auto_193351 ?auto_193359 ) ) ( not ( = ?auto_193352 ?auto_193357 ) ) ( HAVE_IMAGE ?auto_193353 ?auto_193350 ) ( HAVE_IMAGE ?auto_193354 ?auto_193355 ) ( not ( = ?auto_193351 ?auto_193353 ) ) ( not ( = ?auto_193351 ?auto_193354 ) ) ( not ( = ?auto_193352 ?auto_193350 ) ) ( not ( = ?auto_193352 ?auto_193355 ) ) ( not ( = ?auto_193353 ?auto_193354 ) ) ( not ( = ?auto_193353 ?auto_193356 ) ) ( not ( = ?auto_193353 ?auto_193359 ) ) ( not ( = ?auto_193350 ?auto_193355 ) ) ( not ( = ?auto_193350 ?auto_193357 ) ) ( not ( = ?auto_193354 ?auto_193356 ) ) ( not ( = ?auto_193354 ?auto_193359 ) ) ( not ( = ?auto_193355 ?auto_193357 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_193351 ?auto_193352 ?auto_193356 ?auto_193357 )
      ( GET-4IMAGE-VERIFY ?auto_193351 ?auto_193352 ?auto_193353 ?auto_193350 ?auto_193354 ?auto_193355 ?auto_193356 ?auto_193357 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_193362 - DIRECTION
      ?auto_193363 - MODE
      ?auto_193364 - DIRECTION
      ?auto_193361 - MODE
      ?auto_193365 - DIRECTION
      ?auto_193366 - MODE
      ?auto_193367 - DIRECTION
      ?auto_193368 - MODE
    )
    :vars
    (
      ?auto_193369 - INSTRUMENT
      ?auto_193371 - SATELLITE
      ?auto_193370 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_193369 ) ( ON_BOARD ?auto_193369 ?auto_193371 ) ( SUPPORTS ?auto_193369 ?auto_193366 ) ( POWER_ON ?auto_193369 ) ( POINTING ?auto_193371 ?auto_193370 ) ( not ( = ?auto_193365 ?auto_193370 ) ) ( HAVE_IMAGE ?auto_193364 ?auto_193361 ) ( not ( = ?auto_193364 ?auto_193365 ) ) ( not ( = ?auto_193364 ?auto_193370 ) ) ( not ( = ?auto_193361 ?auto_193366 ) ) ( HAVE_IMAGE ?auto_193362 ?auto_193363 ) ( HAVE_IMAGE ?auto_193367 ?auto_193368 ) ( not ( = ?auto_193362 ?auto_193364 ) ) ( not ( = ?auto_193362 ?auto_193365 ) ) ( not ( = ?auto_193362 ?auto_193367 ) ) ( not ( = ?auto_193362 ?auto_193370 ) ) ( not ( = ?auto_193363 ?auto_193361 ) ) ( not ( = ?auto_193363 ?auto_193366 ) ) ( not ( = ?auto_193363 ?auto_193368 ) ) ( not ( = ?auto_193364 ?auto_193367 ) ) ( not ( = ?auto_193361 ?auto_193368 ) ) ( not ( = ?auto_193365 ?auto_193367 ) ) ( not ( = ?auto_193366 ?auto_193368 ) ) ( not ( = ?auto_193367 ?auto_193370 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_193364 ?auto_193361 ?auto_193365 ?auto_193366 )
      ( GET-4IMAGE-VERIFY ?auto_193362 ?auto_193363 ?auto_193364 ?auto_193361 ?auto_193365 ?auto_193366 ?auto_193367 ?auto_193368 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_193384 - DIRECTION
      ?auto_193385 - MODE
      ?auto_193386 - DIRECTION
      ?auto_193383 - MODE
      ?auto_193387 - DIRECTION
      ?auto_193388 - MODE
      ?auto_193389 - DIRECTION
      ?auto_193390 - MODE
    )
    :vars
    (
      ?auto_193391 - INSTRUMENT
      ?auto_193393 - SATELLITE
      ?auto_193392 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_193391 ) ( ON_BOARD ?auto_193391 ?auto_193393 ) ( SUPPORTS ?auto_193391 ?auto_193383 ) ( POWER_ON ?auto_193391 ) ( POINTING ?auto_193393 ?auto_193392 ) ( not ( = ?auto_193386 ?auto_193392 ) ) ( HAVE_IMAGE ?auto_193384 ?auto_193385 ) ( not ( = ?auto_193384 ?auto_193386 ) ) ( not ( = ?auto_193384 ?auto_193392 ) ) ( not ( = ?auto_193385 ?auto_193383 ) ) ( HAVE_IMAGE ?auto_193387 ?auto_193388 ) ( HAVE_IMAGE ?auto_193389 ?auto_193390 ) ( not ( = ?auto_193384 ?auto_193387 ) ) ( not ( = ?auto_193384 ?auto_193389 ) ) ( not ( = ?auto_193385 ?auto_193388 ) ) ( not ( = ?auto_193385 ?auto_193390 ) ) ( not ( = ?auto_193386 ?auto_193387 ) ) ( not ( = ?auto_193386 ?auto_193389 ) ) ( not ( = ?auto_193383 ?auto_193388 ) ) ( not ( = ?auto_193383 ?auto_193390 ) ) ( not ( = ?auto_193387 ?auto_193389 ) ) ( not ( = ?auto_193387 ?auto_193392 ) ) ( not ( = ?auto_193388 ?auto_193390 ) ) ( not ( = ?auto_193389 ?auto_193392 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_193384 ?auto_193385 ?auto_193386 ?auto_193383 )
      ( GET-4IMAGE-VERIFY ?auto_193384 ?auto_193385 ?auto_193386 ?auto_193383 ?auto_193387 ?auto_193388 ?auto_193389 ?auto_193390 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_193428 - DIRECTION
      ?auto_193429 - MODE
      ?auto_193430 - DIRECTION
      ?auto_193427 - MODE
      ?auto_193431 - DIRECTION
      ?auto_193432 - MODE
      ?auto_193433 - DIRECTION
      ?auto_193434 - MODE
    )
    :vars
    (
      ?auto_193435 - INSTRUMENT
      ?auto_193437 - SATELLITE
      ?auto_193436 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_193435 ) ( ON_BOARD ?auto_193435 ?auto_193437 ) ( SUPPORTS ?auto_193435 ?auto_193429 ) ( POWER_ON ?auto_193435 ) ( POINTING ?auto_193437 ?auto_193436 ) ( not ( = ?auto_193428 ?auto_193436 ) ) ( HAVE_IMAGE ?auto_193431 ?auto_193427 ) ( not ( = ?auto_193431 ?auto_193428 ) ) ( not ( = ?auto_193431 ?auto_193436 ) ) ( not ( = ?auto_193427 ?auto_193429 ) ) ( HAVE_IMAGE ?auto_193430 ?auto_193427 ) ( HAVE_IMAGE ?auto_193431 ?auto_193432 ) ( HAVE_IMAGE ?auto_193433 ?auto_193434 ) ( not ( = ?auto_193428 ?auto_193430 ) ) ( not ( = ?auto_193428 ?auto_193433 ) ) ( not ( = ?auto_193429 ?auto_193432 ) ) ( not ( = ?auto_193429 ?auto_193434 ) ) ( not ( = ?auto_193430 ?auto_193431 ) ) ( not ( = ?auto_193430 ?auto_193433 ) ) ( not ( = ?auto_193430 ?auto_193436 ) ) ( not ( = ?auto_193427 ?auto_193432 ) ) ( not ( = ?auto_193427 ?auto_193434 ) ) ( not ( = ?auto_193431 ?auto_193433 ) ) ( not ( = ?auto_193432 ?auto_193434 ) ) ( not ( = ?auto_193433 ?auto_193436 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_193431 ?auto_193427 ?auto_193428 ?auto_193429 )
      ( GET-4IMAGE-VERIFY ?auto_193428 ?auto_193429 ?auto_193430 ?auto_193427 ?auto_193431 ?auto_193432 ?auto_193433 ?auto_193434 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_193517 - DIRECTION
      ?auto_193518 - MODE
    )
    :vars
    (
      ?auto_193519 - INSTRUMENT
      ?auto_193523 - SATELLITE
      ?auto_193522 - DIRECTION
      ?auto_193520 - DIRECTION
      ?auto_193521 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_193519 ?auto_193523 ) ( SUPPORTS ?auto_193519 ?auto_193518 ) ( POWER_ON ?auto_193519 ) ( POINTING ?auto_193523 ?auto_193522 ) ( not ( = ?auto_193517 ?auto_193522 ) ) ( HAVE_IMAGE ?auto_193520 ?auto_193521 ) ( not ( = ?auto_193520 ?auto_193517 ) ) ( not ( = ?auto_193520 ?auto_193522 ) ) ( not ( = ?auto_193521 ?auto_193518 ) ) ( CALIBRATION_TARGET ?auto_193519 ?auto_193522 ) ( NOT_CALIBRATED ?auto_193519 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_193523 ?auto_193519 ?auto_193522 )
      ( GET-2IMAGE ?auto_193520 ?auto_193521 ?auto_193517 ?auto_193518 )
      ( GET-1IMAGE-VERIFY ?auto_193517 ?auto_193518 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_193525 - DIRECTION
      ?auto_193526 - MODE
      ?auto_193527 - DIRECTION
      ?auto_193524 - MODE
    )
    :vars
    (
      ?auto_193528 - INSTRUMENT
      ?auto_193529 - SATELLITE
      ?auto_193530 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_193528 ?auto_193529 ) ( SUPPORTS ?auto_193528 ?auto_193524 ) ( POWER_ON ?auto_193528 ) ( POINTING ?auto_193529 ?auto_193530 ) ( not ( = ?auto_193527 ?auto_193530 ) ) ( HAVE_IMAGE ?auto_193525 ?auto_193526 ) ( not ( = ?auto_193525 ?auto_193527 ) ) ( not ( = ?auto_193525 ?auto_193530 ) ) ( not ( = ?auto_193526 ?auto_193524 ) ) ( CALIBRATION_TARGET ?auto_193528 ?auto_193530 ) ( NOT_CALIBRATED ?auto_193528 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_193527 ?auto_193524 )
      ( GET-2IMAGE-VERIFY ?auto_193525 ?auto_193526 ?auto_193527 ?auto_193524 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_193532 - DIRECTION
      ?auto_193533 - MODE
      ?auto_193534 - DIRECTION
      ?auto_193531 - MODE
    )
    :vars
    (
      ?auto_193536 - INSTRUMENT
      ?auto_193537 - SATELLITE
      ?auto_193535 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_193536 ?auto_193537 ) ( SUPPORTS ?auto_193536 ?auto_193533 ) ( POWER_ON ?auto_193536 ) ( POINTING ?auto_193537 ?auto_193535 ) ( not ( = ?auto_193532 ?auto_193535 ) ) ( HAVE_IMAGE ?auto_193534 ?auto_193531 ) ( not ( = ?auto_193534 ?auto_193532 ) ) ( not ( = ?auto_193534 ?auto_193535 ) ) ( not ( = ?auto_193531 ?auto_193533 ) ) ( CALIBRATION_TARGET ?auto_193536 ?auto_193535 ) ( NOT_CALIBRATED ?auto_193536 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_193534 ?auto_193531 ?auto_193532 ?auto_193533 )
      ( GET-2IMAGE-VERIFY ?auto_193532 ?auto_193533 ?auto_193534 ?auto_193531 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_193548 - DIRECTION
      ?auto_193549 - MODE
      ?auto_193550 - DIRECTION
      ?auto_193547 - MODE
      ?auto_193551 - DIRECTION
      ?auto_193552 - MODE
    )
    :vars
    (
      ?auto_193554 - INSTRUMENT
      ?auto_193555 - SATELLITE
      ?auto_193553 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_193554 ?auto_193555 ) ( SUPPORTS ?auto_193554 ?auto_193552 ) ( POWER_ON ?auto_193554 ) ( POINTING ?auto_193555 ?auto_193553 ) ( not ( = ?auto_193551 ?auto_193553 ) ) ( HAVE_IMAGE ?auto_193550 ?auto_193549 ) ( not ( = ?auto_193550 ?auto_193551 ) ) ( not ( = ?auto_193550 ?auto_193553 ) ) ( not ( = ?auto_193549 ?auto_193552 ) ) ( CALIBRATION_TARGET ?auto_193554 ?auto_193553 ) ( NOT_CALIBRATED ?auto_193554 ) ( HAVE_IMAGE ?auto_193548 ?auto_193549 ) ( HAVE_IMAGE ?auto_193550 ?auto_193547 ) ( not ( = ?auto_193548 ?auto_193550 ) ) ( not ( = ?auto_193548 ?auto_193551 ) ) ( not ( = ?auto_193548 ?auto_193553 ) ) ( not ( = ?auto_193549 ?auto_193547 ) ) ( not ( = ?auto_193547 ?auto_193552 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_193550 ?auto_193549 ?auto_193551 ?auto_193552 )
      ( GET-3IMAGE-VERIFY ?auto_193548 ?auto_193549 ?auto_193550 ?auto_193547 ?auto_193551 ?auto_193552 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_193557 - DIRECTION
      ?auto_193558 - MODE
      ?auto_193559 - DIRECTION
      ?auto_193556 - MODE
      ?auto_193560 - DIRECTION
      ?auto_193561 - MODE
    )
    :vars
    (
      ?auto_193563 - INSTRUMENT
      ?auto_193564 - SATELLITE
      ?auto_193562 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_193563 ?auto_193564 ) ( SUPPORTS ?auto_193563 ?auto_193556 ) ( POWER_ON ?auto_193563 ) ( POINTING ?auto_193564 ?auto_193562 ) ( not ( = ?auto_193559 ?auto_193562 ) ) ( HAVE_IMAGE ?auto_193557 ?auto_193561 ) ( not ( = ?auto_193557 ?auto_193559 ) ) ( not ( = ?auto_193557 ?auto_193562 ) ) ( not ( = ?auto_193561 ?auto_193556 ) ) ( CALIBRATION_TARGET ?auto_193563 ?auto_193562 ) ( NOT_CALIBRATED ?auto_193563 ) ( HAVE_IMAGE ?auto_193557 ?auto_193558 ) ( HAVE_IMAGE ?auto_193560 ?auto_193561 ) ( not ( = ?auto_193557 ?auto_193560 ) ) ( not ( = ?auto_193558 ?auto_193556 ) ) ( not ( = ?auto_193558 ?auto_193561 ) ) ( not ( = ?auto_193559 ?auto_193560 ) ) ( not ( = ?auto_193560 ?auto_193562 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_193557 ?auto_193561 ?auto_193559 ?auto_193556 )
      ( GET-3IMAGE-VERIFY ?auto_193557 ?auto_193558 ?auto_193559 ?auto_193556 ?auto_193560 ?auto_193561 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_193575 - DIRECTION
      ?auto_193576 - MODE
      ?auto_193577 - DIRECTION
      ?auto_193574 - MODE
      ?auto_193578 - DIRECTION
      ?auto_193579 - MODE
    )
    :vars
    (
      ?auto_193581 - INSTRUMENT
      ?auto_193582 - SATELLITE
      ?auto_193580 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_193581 ?auto_193582 ) ( SUPPORTS ?auto_193581 ?auto_193576 ) ( POWER_ON ?auto_193581 ) ( POINTING ?auto_193582 ?auto_193580 ) ( not ( = ?auto_193575 ?auto_193580 ) ) ( HAVE_IMAGE ?auto_193577 ?auto_193579 ) ( not ( = ?auto_193577 ?auto_193575 ) ) ( not ( = ?auto_193577 ?auto_193580 ) ) ( not ( = ?auto_193579 ?auto_193576 ) ) ( CALIBRATION_TARGET ?auto_193581 ?auto_193580 ) ( NOT_CALIBRATED ?auto_193581 ) ( HAVE_IMAGE ?auto_193577 ?auto_193574 ) ( HAVE_IMAGE ?auto_193578 ?auto_193579 ) ( not ( = ?auto_193575 ?auto_193578 ) ) ( not ( = ?auto_193576 ?auto_193574 ) ) ( not ( = ?auto_193577 ?auto_193578 ) ) ( not ( = ?auto_193574 ?auto_193579 ) ) ( not ( = ?auto_193578 ?auto_193580 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_193577 ?auto_193579 ?auto_193575 ?auto_193576 )
      ( GET-3IMAGE-VERIFY ?auto_193575 ?auto_193576 ?auto_193577 ?auto_193574 ?auto_193578 ?auto_193579 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_193613 - DIRECTION
      ?auto_193614 - MODE
      ?auto_193615 - DIRECTION
      ?auto_193612 - MODE
      ?auto_193616 - DIRECTION
      ?auto_193617 - MODE
      ?auto_193618 - DIRECTION
      ?auto_193619 - MODE
    )
    :vars
    (
      ?auto_193621 - INSTRUMENT
      ?auto_193622 - SATELLITE
      ?auto_193620 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_193621 ?auto_193622 ) ( SUPPORTS ?auto_193621 ?auto_193619 ) ( POWER_ON ?auto_193621 ) ( POINTING ?auto_193622 ?auto_193620 ) ( not ( = ?auto_193618 ?auto_193620 ) ) ( HAVE_IMAGE ?auto_193616 ?auto_193617 ) ( not ( = ?auto_193616 ?auto_193618 ) ) ( not ( = ?auto_193616 ?auto_193620 ) ) ( not ( = ?auto_193617 ?auto_193619 ) ) ( CALIBRATION_TARGET ?auto_193621 ?auto_193620 ) ( NOT_CALIBRATED ?auto_193621 ) ( HAVE_IMAGE ?auto_193613 ?auto_193614 ) ( HAVE_IMAGE ?auto_193615 ?auto_193612 ) ( not ( = ?auto_193613 ?auto_193615 ) ) ( not ( = ?auto_193613 ?auto_193616 ) ) ( not ( = ?auto_193613 ?auto_193618 ) ) ( not ( = ?auto_193613 ?auto_193620 ) ) ( not ( = ?auto_193614 ?auto_193612 ) ) ( not ( = ?auto_193614 ?auto_193617 ) ) ( not ( = ?auto_193614 ?auto_193619 ) ) ( not ( = ?auto_193615 ?auto_193616 ) ) ( not ( = ?auto_193615 ?auto_193618 ) ) ( not ( = ?auto_193615 ?auto_193620 ) ) ( not ( = ?auto_193612 ?auto_193617 ) ) ( not ( = ?auto_193612 ?auto_193619 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_193616 ?auto_193617 ?auto_193618 ?auto_193619 )
      ( GET-4IMAGE-VERIFY ?auto_193613 ?auto_193614 ?auto_193615 ?auto_193612 ?auto_193616 ?auto_193617 ?auto_193618 ?auto_193619 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_193624 - DIRECTION
      ?auto_193625 - MODE
      ?auto_193626 - DIRECTION
      ?auto_193623 - MODE
      ?auto_193627 - DIRECTION
      ?auto_193628 - MODE
      ?auto_193629 - DIRECTION
      ?auto_193630 - MODE
    )
    :vars
    (
      ?auto_193632 - INSTRUMENT
      ?auto_193633 - SATELLITE
      ?auto_193631 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_193632 ?auto_193633 ) ( SUPPORTS ?auto_193632 ?auto_193628 ) ( POWER_ON ?auto_193632 ) ( POINTING ?auto_193633 ?auto_193631 ) ( not ( = ?auto_193627 ?auto_193631 ) ) ( HAVE_IMAGE ?auto_193624 ?auto_193630 ) ( not ( = ?auto_193624 ?auto_193627 ) ) ( not ( = ?auto_193624 ?auto_193631 ) ) ( not ( = ?auto_193630 ?auto_193628 ) ) ( CALIBRATION_TARGET ?auto_193632 ?auto_193631 ) ( NOT_CALIBRATED ?auto_193632 ) ( HAVE_IMAGE ?auto_193624 ?auto_193625 ) ( HAVE_IMAGE ?auto_193626 ?auto_193623 ) ( HAVE_IMAGE ?auto_193629 ?auto_193630 ) ( not ( = ?auto_193624 ?auto_193626 ) ) ( not ( = ?auto_193624 ?auto_193629 ) ) ( not ( = ?auto_193625 ?auto_193623 ) ) ( not ( = ?auto_193625 ?auto_193628 ) ) ( not ( = ?auto_193625 ?auto_193630 ) ) ( not ( = ?auto_193626 ?auto_193627 ) ) ( not ( = ?auto_193626 ?auto_193629 ) ) ( not ( = ?auto_193626 ?auto_193631 ) ) ( not ( = ?auto_193623 ?auto_193628 ) ) ( not ( = ?auto_193623 ?auto_193630 ) ) ( not ( = ?auto_193627 ?auto_193629 ) ) ( not ( = ?auto_193629 ?auto_193631 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_193624 ?auto_193630 ?auto_193627 ?auto_193628 )
      ( GET-4IMAGE-VERIFY ?auto_193624 ?auto_193625 ?auto_193626 ?auto_193623 ?auto_193627 ?auto_193628 ?auto_193629 ?auto_193630 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_193646 - DIRECTION
      ?auto_193647 - MODE
      ?auto_193648 - DIRECTION
      ?auto_193645 - MODE
      ?auto_193649 - DIRECTION
      ?auto_193650 - MODE
      ?auto_193651 - DIRECTION
      ?auto_193652 - MODE
    )
    :vars
    (
      ?auto_193654 - INSTRUMENT
      ?auto_193655 - SATELLITE
      ?auto_193653 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_193654 ?auto_193655 ) ( SUPPORTS ?auto_193654 ?auto_193645 ) ( POWER_ON ?auto_193654 ) ( POINTING ?auto_193655 ?auto_193653 ) ( not ( = ?auto_193648 ?auto_193653 ) ) ( HAVE_IMAGE ?auto_193646 ?auto_193650 ) ( not ( = ?auto_193646 ?auto_193648 ) ) ( not ( = ?auto_193646 ?auto_193653 ) ) ( not ( = ?auto_193650 ?auto_193645 ) ) ( CALIBRATION_TARGET ?auto_193654 ?auto_193653 ) ( NOT_CALIBRATED ?auto_193654 ) ( HAVE_IMAGE ?auto_193646 ?auto_193647 ) ( HAVE_IMAGE ?auto_193649 ?auto_193650 ) ( HAVE_IMAGE ?auto_193651 ?auto_193652 ) ( not ( = ?auto_193646 ?auto_193649 ) ) ( not ( = ?auto_193646 ?auto_193651 ) ) ( not ( = ?auto_193647 ?auto_193645 ) ) ( not ( = ?auto_193647 ?auto_193650 ) ) ( not ( = ?auto_193647 ?auto_193652 ) ) ( not ( = ?auto_193648 ?auto_193649 ) ) ( not ( = ?auto_193648 ?auto_193651 ) ) ( not ( = ?auto_193645 ?auto_193652 ) ) ( not ( = ?auto_193649 ?auto_193651 ) ) ( not ( = ?auto_193649 ?auto_193653 ) ) ( not ( = ?auto_193650 ?auto_193652 ) ) ( not ( = ?auto_193651 ?auto_193653 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_193646 ?auto_193650 ?auto_193648 ?auto_193645 )
      ( GET-4IMAGE-VERIFY ?auto_193646 ?auto_193647 ?auto_193648 ?auto_193645 ?auto_193649 ?auto_193650 ?auto_193651 ?auto_193652 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_193690 - DIRECTION
      ?auto_193691 - MODE
      ?auto_193692 - DIRECTION
      ?auto_193689 - MODE
      ?auto_193693 - DIRECTION
      ?auto_193694 - MODE
      ?auto_193695 - DIRECTION
      ?auto_193696 - MODE
    )
    :vars
    (
      ?auto_193698 - INSTRUMENT
      ?auto_193699 - SATELLITE
      ?auto_193697 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_193698 ?auto_193699 ) ( SUPPORTS ?auto_193698 ?auto_193691 ) ( POWER_ON ?auto_193698 ) ( POINTING ?auto_193699 ?auto_193697 ) ( not ( = ?auto_193690 ?auto_193697 ) ) ( HAVE_IMAGE ?auto_193695 ?auto_193696 ) ( not ( = ?auto_193695 ?auto_193690 ) ) ( not ( = ?auto_193695 ?auto_193697 ) ) ( not ( = ?auto_193696 ?auto_193691 ) ) ( CALIBRATION_TARGET ?auto_193698 ?auto_193697 ) ( NOT_CALIBRATED ?auto_193698 ) ( HAVE_IMAGE ?auto_193692 ?auto_193689 ) ( HAVE_IMAGE ?auto_193693 ?auto_193694 ) ( not ( = ?auto_193690 ?auto_193692 ) ) ( not ( = ?auto_193690 ?auto_193693 ) ) ( not ( = ?auto_193691 ?auto_193689 ) ) ( not ( = ?auto_193691 ?auto_193694 ) ) ( not ( = ?auto_193692 ?auto_193693 ) ) ( not ( = ?auto_193692 ?auto_193695 ) ) ( not ( = ?auto_193692 ?auto_193697 ) ) ( not ( = ?auto_193689 ?auto_193694 ) ) ( not ( = ?auto_193689 ?auto_193696 ) ) ( not ( = ?auto_193693 ?auto_193695 ) ) ( not ( = ?auto_193693 ?auto_193697 ) ) ( not ( = ?auto_193694 ?auto_193696 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_193695 ?auto_193696 ?auto_193690 ?auto_193691 )
      ( GET-4IMAGE-VERIFY ?auto_193690 ?auto_193691 ?auto_193692 ?auto_193689 ?auto_193693 ?auto_193694 ?auto_193695 ?auto_193696 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_193779 - DIRECTION
      ?auto_193780 - MODE
    )
    :vars
    (
      ?auto_193782 - INSTRUMENT
      ?auto_193784 - SATELLITE
      ?auto_193781 - DIRECTION
      ?auto_193783 - DIRECTION
      ?auto_193785 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_193782 ?auto_193784 ) ( SUPPORTS ?auto_193782 ?auto_193780 ) ( POINTING ?auto_193784 ?auto_193781 ) ( not ( = ?auto_193779 ?auto_193781 ) ) ( HAVE_IMAGE ?auto_193783 ?auto_193785 ) ( not ( = ?auto_193783 ?auto_193779 ) ) ( not ( = ?auto_193783 ?auto_193781 ) ) ( not ( = ?auto_193785 ?auto_193780 ) ) ( CALIBRATION_TARGET ?auto_193782 ?auto_193781 ) ( POWER_AVAIL ?auto_193784 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_193782 ?auto_193784 )
      ( GET-2IMAGE ?auto_193783 ?auto_193785 ?auto_193779 ?auto_193780 )
      ( GET-1IMAGE-VERIFY ?auto_193779 ?auto_193780 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_193787 - DIRECTION
      ?auto_193788 - MODE
      ?auto_193789 - DIRECTION
      ?auto_193786 - MODE
    )
    :vars
    (
      ?auto_193790 - INSTRUMENT
      ?auto_193792 - SATELLITE
      ?auto_193791 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_193790 ?auto_193792 ) ( SUPPORTS ?auto_193790 ?auto_193786 ) ( POINTING ?auto_193792 ?auto_193791 ) ( not ( = ?auto_193789 ?auto_193791 ) ) ( HAVE_IMAGE ?auto_193787 ?auto_193788 ) ( not ( = ?auto_193787 ?auto_193789 ) ) ( not ( = ?auto_193787 ?auto_193791 ) ) ( not ( = ?auto_193788 ?auto_193786 ) ) ( CALIBRATION_TARGET ?auto_193790 ?auto_193791 ) ( POWER_AVAIL ?auto_193792 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_193789 ?auto_193786 )
      ( GET-2IMAGE-VERIFY ?auto_193787 ?auto_193788 ?auto_193789 ?auto_193786 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_193794 - DIRECTION
      ?auto_193795 - MODE
      ?auto_193796 - DIRECTION
      ?auto_193793 - MODE
    )
    :vars
    (
      ?auto_193798 - INSTRUMENT
      ?auto_193799 - SATELLITE
      ?auto_193797 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_193798 ?auto_193799 ) ( SUPPORTS ?auto_193798 ?auto_193795 ) ( POINTING ?auto_193799 ?auto_193797 ) ( not ( = ?auto_193794 ?auto_193797 ) ) ( HAVE_IMAGE ?auto_193796 ?auto_193793 ) ( not ( = ?auto_193796 ?auto_193794 ) ) ( not ( = ?auto_193796 ?auto_193797 ) ) ( not ( = ?auto_193793 ?auto_193795 ) ) ( CALIBRATION_TARGET ?auto_193798 ?auto_193797 ) ( POWER_AVAIL ?auto_193799 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_193796 ?auto_193793 ?auto_193794 ?auto_193795 )
      ( GET-2IMAGE-VERIFY ?auto_193794 ?auto_193795 ?auto_193796 ?auto_193793 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_193810 - DIRECTION
      ?auto_193811 - MODE
      ?auto_193812 - DIRECTION
      ?auto_193809 - MODE
      ?auto_193813 - DIRECTION
      ?auto_193814 - MODE
    )
    :vars
    (
      ?auto_193816 - INSTRUMENT
      ?auto_193817 - SATELLITE
      ?auto_193815 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_193816 ?auto_193817 ) ( SUPPORTS ?auto_193816 ?auto_193814 ) ( POINTING ?auto_193817 ?auto_193815 ) ( not ( = ?auto_193813 ?auto_193815 ) ) ( HAVE_IMAGE ?auto_193810 ?auto_193811 ) ( not ( = ?auto_193810 ?auto_193813 ) ) ( not ( = ?auto_193810 ?auto_193815 ) ) ( not ( = ?auto_193811 ?auto_193814 ) ) ( CALIBRATION_TARGET ?auto_193816 ?auto_193815 ) ( POWER_AVAIL ?auto_193817 ) ( HAVE_IMAGE ?auto_193812 ?auto_193809 ) ( not ( = ?auto_193810 ?auto_193812 ) ) ( not ( = ?auto_193811 ?auto_193809 ) ) ( not ( = ?auto_193812 ?auto_193813 ) ) ( not ( = ?auto_193812 ?auto_193815 ) ) ( not ( = ?auto_193809 ?auto_193814 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_193810 ?auto_193811 ?auto_193813 ?auto_193814 )
      ( GET-3IMAGE-VERIFY ?auto_193810 ?auto_193811 ?auto_193812 ?auto_193809 ?auto_193813 ?auto_193814 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_193819 - DIRECTION
      ?auto_193820 - MODE
      ?auto_193821 - DIRECTION
      ?auto_193818 - MODE
      ?auto_193822 - DIRECTION
      ?auto_193823 - MODE
    )
    :vars
    (
      ?auto_193825 - INSTRUMENT
      ?auto_193826 - SATELLITE
      ?auto_193824 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_193825 ?auto_193826 ) ( SUPPORTS ?auto_193825 ?auto_193818 ) ( POINTING ?auto_193826 ?auto_193824 ) ( not ( = ?auto_193821 ?auto_193824 ) ) ( HAVE_IMAGE ?auto_193822 ?auto_193823 ) ( not ( = ?auto_193822 ?auto_193821 ) ) ( not ( = ?auto_193822 ?auto_193824 ) ) ( not ( = ?auto_193823 ?auto_193818 ) ) ( CALIBRATION_TARGET ?auto_193825 ?auto_193824 ) ( POWER_AVAIL ?auto_193826 ) ( HAVE_IMAGE ?auto_193819 ?auto_193820 ) ( not ( = ?auto_193819 ?auto_193821 ) ) ( not ( = ?auto_193819 ?auto_193822 ) ) ( not ( = ?auto_193819 ?auto_193824 ) ) ( not ( = ?auto_193820 ?auto_193818 ) ) ( not ( = ?auto_193820 ?auto_193823 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_193822 ?auto_193823 ?auto_193821 ?auto_193818 )
      ( GET-3IMAGE-VERIFY ?auto_193819 ?auto_193820 ?auto_193821 ?auto_193818 ?auto_193822 ?auto_193823 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_193837 - DIRECTION
      ?auto_193838 - MODE
      ?auto_193839 - DIRECTION
      ?auto_193836 - MODE
      ?auto_193840 - DIRECTION
      ?auto_193841 - MODE
    )
    :vars
    (
      ?auto_193843 - INSTRUMENT
      ?auto_193844 - SATELLITE
      ?auto_193842 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_193843 ?auto_193844 ) ( SUPPORTS ?auto_193843 ?auto_193838 ) ( POINTING ?auto_193844 ?auto_193842 ) ( not ( = ?auto_193837 ?auto_193842 ) ) ( HAVE_IMAGE ?auto_193839 ?auto_193841 ) ( not ( = ?auto_193839 ?auto_193837 ) ) ( not ( = ?auto_193839 ?auto_193842 ) ) ( not ( = ?auto_193841 ?auto_193838 ) ) ( CALIBRATION_TARGET ?auto_193843 ?auto_193842 ) ( POWER_AVAIL ?auto_193844 ) ( HAVE_IMAGE ?auto_193839 ?auto_193836 ) ( HAVE_IMAGE ?auto_193840 ?auto_193841 ) ( not ( = ?auto_193837 ?auto_193840 ) ) ( not ( = ?auto_193838 ?auto_193836 ) ) ( not ( = ?auto_193839 ?auto_193840 ) ) ( not ( = ?auto_193836 ?auto_193841 ) ) ( not ( = ?auto_193840 ?auto_193842 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_193839 ?auto_193841 ?auto_193837 ?auto_193838 )
      ( GET-3IMAGE-VERIFY ?auto_193837 ?auto_193838 ?auto_193839 ?auto_193836 ?auto_193840 ?auto_193841 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_193875 - DIRECTION
      ?auto_193876 - MODE
      ?auto_193877 - DIRECTION
      ?auto_193874 - MODE
      ?auto_193878 - DIRECTION
      ?auto_193879 - MODE
      ?auto_193880 - DIRECTION
      ?auto_193881 - MODE
    )
    :vars
    (
      ?auto_193883 - INSTRUMENT
      ?auto_193884 - SATELLITE
      ?auto_193882 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_193883 ?auto_193884 ) ( SUPPORTS ?auto_193883 ?auto_193881 ) ( POINTING ?auto_193884 ?auto_193882 ) ( not ( = ?auto_193880 ?auto_193882 ) ) ( HAVE_IMAGE ?auto_193878 ?auto_193876 ) ( not ( = ?auto_193878 ?auto_193880 ) ) ( not ( = ?auto_193878 ?auto_193882 ) ) ( not ( = ?auto_193876 ?auto_193881 ) ) ( CALIBRATION_TARGET ?auto_193883 ?auto_193882 ) ( POWER_AVAIL ?auto_193884 ) ( HAVE_IMAGE ?auto_193875 ?auto_193876 ) ( HAVE_IMAGE ?auto_193877 ?auto_193874 ) ( HAVE_IMAGE ?auto_193878 ?auto_193879 ) ( not ( = ?auto_193875 ?auto_193877 ) ) ( not ( = ?auto_193875 ?auto_193878 ) ) ( not ( = ?auto_193875 ?auto_193880 ) ) ( not ( = ?auto_193875 ?auto_193882 ) ) ( not ( = ?auto_193876 ?auto_193874 ) ) ( not ( = ?auto_193876 ?auto_193879 ) ) ( not ( = ?auto_193877 ?auto_193878 ) ) ( not ( = ?auto_193877 ?auto_193880 ) ) ( not ( = ?auto_193877 ?auto_193882 ) ) ( not ( = ?auto_193874 ?auto_193879 ) ) ( not ( = ?auto_193874 ?auto_193881 ) ) ( not ( = ?auto_193879 ?auto_193881 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_193878 ?auto_193876 ?auto_193880 ?auto_193881 )
      ( GET-4IMAGE-VERIFY ?auto_193875 ?auto_193876 ?auto_193877 ?auto_193874 ?auto_193878 ?auto_193879 ?auto_193880 ?auto_193881 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_193886 - DIRECTION
      ?auto_193887 - MODE
      ?auto_193888 - DIRECTION
      ?auto_193885 - MODE
      ?auto_193889 - DIRECTION
      ?auto_193890 - MODE
      ?auto_193891 - DIRECTION
      ?auto_193892 - MODE
    )
    :vars
    (
      ?auto_193894 - INSTRUMENT
      ?auto_193895 - SATELLITE
      ?auto_193893 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_193894 ?auto_193895 ) ( SUPPORTS ?auto_193894 ?auto_193890 ) ( POINTING ?auto_193895 ?auto_193893 ) ( not ( = ?auto_193889 ?auto_193893 ) ) ( HAVE_IMAGE ?auto_193888 ?auto_193887 ) ( not ( = ?auto_193888 ?auto_193889 ) ) ( not ( = ?auto_193888 ?auto_193893 ) ) ( not ( = ?auto_193887 ?auto_193890 ) ) ( CALIBRATION_TARGET ?auto_193894 ?auto_193893 ) ( POWER_AVAIL ?auto_193895 ) ( HAVE_IMAGE ?auto_193886 ?auto_193887 ) ( HAVE_IMAGE ?auto_193888 ?auto_193885 ) ( HAVE_IMAGE ?auto_193891 ?auto_193892 ) ( not ( = ?auto_193886 ?auto_193888 ) ) ( not ( = ?auto_193886 ?auto_193889 ) ) ( not ( = ?auto_193886 ?auto_193891 ) ) ( not ( = ?auto_193886 ?auto_193893 ) ) ( not ( = ?auto_193887 ?auto_193885 ) ) ( not ( = ?auto_193887 ?auto_193892 ) ) ( not ( = ?auto_193888 ?auto_193891 ) ) ( not ( = ?auto_193885 ?auto_193890 ) ) ( not ( = ?auto_193885 ?auto_193892 ) ) ( not ( = ?auto_193889 ?auto_193891 ) ) ( not ( = ?auto_193890 ?auto_193892 ) ) ( not ( = ?auto_193891 ?auto_193893 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_193888 ?auto_193887 ?auto_193889 ?auto_193890 )
      ( GET-4IMAGE-VERIFY ?auto_193886 ?auto_193887 ?auto_193888 ?auto_193885 ?auto_193889 ?auto_193890 ?auto_193891 ?auto_193892 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_193908 - DIRECTION
      ?auto_193909 - MODE
      ?auto_193910 - DIRECTION
      ?auto_193907 - MODE
      ?auto_193911 - DIRECTION
      ?auto_193912 - MODE
      ?auto_193913 - DIRECTION
      ?auto_193914 - MODE
    )
    :vars
    (
      ?auto_193916 - INSTRUMENT
      ?auto_193917 - SATELLITE
      ?auto_193915 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_193916 ?auto_193917 ) ( SUPPORTS ?auto_193916 ?auto_193907 ) ( POINTING ?auto_193917 ?auto_193915 ) ( not ( = ?auto_193910 ?auto_193915 ) ) ( HAVE_IMAGE ?auto_193911 ?auto_193909 ) ( not ( = ?auto_193911 ?auto_193910 ) ) ( not ( = ?auto_193911 ?auto_193915 ) ) ( not ( = ?auto_193909 ?auto_193907 ) ) ( CALIBRATION_TARGET ?auto_193916 ?auto_193915 ) ( POWER_AVAIL ?auto_193917 ) ( HAVE_IMAGE ?auto_193908 ?auto_193909 ) ( HAVE_IMAGE ?auto_193911 ?auto_193912 ) ( HAVE_IMAGE ?auto_193913 ?auto_193914 ) ( not ( = ?auto_193908 ?auto_193910 ) ) ( not ( = ?auto_193908 ?auto_193911 ) ) ( not ( = ?auto_193908 ?auto_193913 ) ) ( not ( = ?auto_193908 ?auto_193915 ) ) ( not ( = ?auto_193909 ?auto_193912 ) ) ( not ( = ?auto_193909 ?auto_193914 ) ) ( not ( = ?auto_193910 ?auto_193913 ) ) ( not ( = ?auto_193907 ?auto_193912 ) ) ( not ( = ?auto_193907 ?auto_193914 ) ) ( not ( = ?auto_193911 ?auto_193913 ) ) ( not ( = ?auto_193912 ?auto_193914 ) ) ( not ( = ?auto_193913 ?auto_193915 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_193911 ?auto_193909 ?auto_193910 ?auto_193907 )
      ( GET-4IMAGE-VERIFY ?auto_193908 ?auto_193909 ?auto_193910 ?auto_193907 ?auto_193911 ?auto_193912 ?auto_193913 ?auto_193914 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_193952 - DIRECTION
      ?auto_193953 - MODE
      ?auto_193954 - DIRECTION
      ?auto_193951 - MODE
      ?auto_193955 - DIRECTION
      ?auto_193956 - MODE
      ?auto_193957 - DIRECTION
      ?auto_193958 - MODE
    )
    :vars
    (
      ?auto_193960 - INSTRUMENT
      ?auto_193961 - SATELLITE
      ?auto_193959 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_193960 ?auto_193961 ) ( SUPPORTS ?auto_193960 ?auto_193953 ) ( POINTING ?auto_193961 ?auto_193959 ) ( not ( = ?auto_193952 ?auto_193959 ) ) ( HAVE_IMAGE ?auto_193954 ?auto_193958 ) ( not ( = ?auto_193954 ?auto_193952 ) ) ( not ( = ?auto_193954 ?auto_193959 ) ) ( not ( = ?auto_193958 ?auto_193953 ) ) ( CALIBRATION_TARGET ?auto_193960 ?auto_193959 ) ( POWER_AVAIL ?auto_193961 ) ( HAVE_IMAGE ?auto_193954 ?auto_193951 ) ( HAVE_IMAGE ?auto_193955 ?auto_193956 ) ( HAVE_IMAGE ?auto_193957 ?auto_193958 ) ( not ( = ?auto_193952 ?auto_193955 ) ) ( not ( = ?auto_193952 ?auto_193957 ) ) ( not ( = ?auto_193953 ?auto_193951 ) ) ( not ( = ?auto_193953 ?auto_193956 ) ) ( not ( = ?auto_193954 ?auto_193955 ) ) ( not ( = ?auto_193954 ?auto_193957 ) ) ( not ( = ?auto_193951 ?auto_193956 ) ) ( not ( = ?auto_193951 ?auto_193958 ) ) ( not ( = ?auto_193955 ?auto_193957 ) ) ( not ( = ?auto_193955 ?auto_193959 ) ) ( not ( = ?auto_193956 ?auto_193958 ) ) ( not ( = ?auto_193957 ?auto_193959 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_193954 ?auto_193958 ?auto_193952 ?auto_193953 )
      ( GET-4IMAGE-VERIFY ?auto_193952 ?auto_193953 ?auto_193954 ?auto_193951 ?auto_193955 ?auto_193956 ?auto_193957 ?auto_193958 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_194041 - DIRECTION
      ?auto_194042 - MODE
    )
    :vars
    (
      ?auto_194044 - INSTRUMENT
      ?auto_194045 - SATELLITE
      ?auto_194043 - DIRECTION
      ?auto_194047 - DIRECTION
      ?auto_194046 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_194044 ?auto_194045 ) ( SUPPORTS ?auto_194044 ?auto_194042 ) ( not ( = ?auto_194041 ?auto_194043 ) ) ( HAVE_IMAGE ?auto_194047 ?auto_194046 ) ( not ( = ?auto_194047 ?auto_194041 ) ) ( not ( = ?auto_194047 ?auto_194043 ) ) ( not ( = ?auto_194046 ?auto_194042 ) ) ( CALIBRATION_TARGET ?auto_194044 ?auto_194043 ) ( POWER_AVAIL ?auto_194045 ) ( POINTING ?auto_194045 ?auto_194047 ) )
    :subtasks
    ( ( !TURN_TO ?auto_194045 ?auto_194043 ?auto_194047 )
      ( GET-2IMAGE ?auto_194047 ?auto_194046 ?auto_194041 ?auto_194042 )
      ( GET-1IMAGE-VERIFY ?auto_194041 ?auto_194042 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_194049 - DIRECTION
      ?auto_194050 - MODE
      ?auto_194051 - DIRECTION
      ?auto_194048 - MODE
    )
    :vars
    (
      ?auto_194053 - INSTRUMENT
      ?auto_194054 - SATELLITE
      ?auto_194052 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_194053 ?auto_194054 ) ( SUPPORTS ?auto_194053 ?auto_194048 ) ( not ( = ?auto_194051 ?auto_194052 ) ) ( HAVE_IMAGE ?auto_194049 ?auto_194050 ) ( not ( = ?auto_194049 ?auto_194051 ) ) ( not ( = ?auto_194049 ?auto_194052 ) ) ( not ( = ?auto_194050 ?auto_194048 ) ) ( CALIBRATION_TARGET ?auto_194053 ?auto_194052 ) ( POWER_AVAIL ?auto_194054 ) ( POINTING ?auto_194054 ?auto_194049 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_194051 ?auto_194048 )
      ( GET-2IMAGE-VERIFY ?auto_194049 ?auto_194050 ?auto_194051 ?auto_194048 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_194056 - DIRECTION
      ?auto_194057 - MODE
      ?auto_194058 - DIRECTION
      ?auto_194055 - MODE
    )
    :vars
    (
      ?auto_194061 - INSTRUMENT
      ?auto_194060 - SATELLITE
      ?auto_194059 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_194061 ?auto_194060 ) ( SUPPORTS ?auto_194061 ?auto_194057 ) ( not ( = ?auto_194056 ?auto_194059 ) ) ( HAVE_IMAGE ?auto_194058 ?auto_194055 ) ( not ( = ?auto_194058 ?auto_194056 ) ) ( not ( = ?auto_194058 ?auto_194059 ) ) ( not ( = ?auto_194055 ?auto_194057 ) ) ( CALIBRATION_TARGET ?auto_194061 ?auto_194059 ) ( POWER_AVAIL ?auto_194060 ) ( POINTING ?auto_194060 ?auto_194058 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_194058 ?auto_194055 ?auto_194056 ?auto_194057 )
      ( GET-2IMAGE-VERIFY ?auto_194056 ?auto_194057 ?auto_194058 ?auto_194055 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_194072 - DIRECTION
      ?auto_194073 - MODE
      ?auto_194074 - DIRECTION
      ?auto_194071 - MODE
      ?auto_194075 - DIRECTION
      ?auto_194076 - MODE
    )
    :vars
    (
      ?auto_194079 - INSTRUMENT
      ?auto_194078 - SATELLITE
      ?auto_194077 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_194079 ?auto_194078 ) ( SUPPORTS ?auto_194079 ?auto_194076 ) ( not ( = ?auto_194075 ?auto_194077 ) ) ( HAVE_IMAGE ?auto_194072 ?auto_194073 ) ( not ( = ?auto_194072 ?auto_194075 ) ) ( not ( = ?auto_194072 ?auto_194077 ) ) ( not ( = ?auto_194073 ?auto_194076 ) ) ( CALIBRATION_TARGET ?auto_194079 ?auto_194077 ) ( POWER_AVAIL ?auto_194078 ) ( POINTING ?auto_194078 ?auto_194072 ) ( HAVE_IMAGE ?auto_194074 ?auto_194071 ) ( not ( = ?auto_194072 ?auto_194074 ) ) ( not ( = ?auto_194073 ?auto_194071 ) ) ( not ( = ?auto_194074 ?auto_194075 ) ) ( not ( = ?auto_194074 ?auto_194077 ) ) ( not ( = ?auto_194071 ?auto_194076 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_194072 ?auto_194073 ?auto_194075 ?auto_194076 )
      ( GET-3IMAGE-VERIFY ?auto_194072 ?auto_194073 ?auto_194074 ?auto_194071 ?auto_194075 ?auto_194076 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_194081 - DIRECTION
      ?auto_194082 - MODE
      ?auto_194083 - DIRECTION
      ?auto_194080 - MODE
      ?auto_194084 - DIRECTION
      ?auto_194085 - MODE
    )
    :vars
    (
      ?auto_194088 - INSTRUMENT
      ?auto_194087 - SATELLITE
      ?auto_194086 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_194088 ?auto_194087 ) ( SUPPORTS ?auto_194088 ?auto_194080 ) ( not ( = ?auto_194083 ?auto_194086 ) ) ( HAVE_IMAGE ?auto_194084 ?auto_194085 ) ( not ( = ?auto_194084 ?auto_194083 ) ) ( not ( = ?auto_194084 ?auto_194086 ) ) ( not ( = ?auto_194085 ?auto_194080 ) ) ( CALIBRATION_TARGET ?auto_194088 ?auto_194086 ) ( POWER_AVAIL ?auto_194087 ) ( POINTING ?auto_194087 ?auto_194084 ) ( HAVE_IMAGE ?auto_194081 ?auto_194082 ) ( not ( = ?auto_194081 ?auto_194083 ) ) ( not ( = ?auto_194081 ?auto_194084 ) ) ( not ( = ?auto_194081 ?auto_194086 ) ) ( not ( = ?auto_194082 ?auto_194080 ) ) ( not ( = ?auto_194082 ?auto_194085 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_194084 ?auto_194085 ?auto_194083 ?auto_194080 )
      ( GET-3IMAGE-VERIFY ?auto_194081 ?auto_194082 ?auto_194083 ?auto_194080 ?auto_194084 ?auto_194085 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_194099 - DIRECTION
      ?auto_194100 - MODE
      ?auto_194101 - DIRECTION
      ?auto_194098 - MODE
      ?auto_194102 - DIRECTION
      ?auto_194103 - MODE
    )
    :vars
    (
      ?auto_194106 - INSTRUMENT
      ?auto_194105 - SATELLITE
      ?auto_194104 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_194106 ?auto_194105 ) ( SUPPORTS ?auto_194106 ?auto_194100 ) ( not ( = ?auto_194099 ?auto_194104 ) ) ( HAVE_IMAGE ?auto_194102 ?auto_194103 ) ( not ( = ?auto_194102 ?auto_194099 ) ) ( not ( = ?auto_194102 ?auto_194104 ) ) ( not ( = ?auto_194103 ?auto_194100 ) ) ( CALIBRATION_TARGET ?auto_194106 ?auto_194104 ) ( POWER_AVAIL ?auto_194105 ) ( POINTING ?auto_194105 ?auto_194102 ) ( HAVE_IMAGE ?auto_194101 ?auto_194098 ) ( not ( = ?auto_194099 ?auto_194101 ) ) ( not ( = ?auto_194100 ?auto_194098 ) ) ( not ( = ?auto_194101 ?auto_194102 ) ) ( not ( = ?auto_194101 ?auto_194104 ) ) ( not ( = ?auto_194098 ?auto_194103 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_194102 ?auto_194103 ?auto_194099 ?auto_194100 )
      ( GET-3IMAGE-VERIFY ?auto_194099 ?auto_194100 ?auto_194101 ?auto_194098 ?auto_194102 ?auto_194103 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_194137 - DIRECTION
      ?auto_194138 - MODE
      ?auto_194139 - DIRECTION
      ?auto_194136 - MODE
      ?auto_194140 - DIRECTION
      ?auto_194141 - MODE
      ?auto_194142 - DIRECTION
      ?auto_194143 - MODE
    )
    :vars
    (
      ?auto_194146 - INSTRUMENT
      ?auto_194145 - SATELLITE
      ?auto_194144 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_194146 ?auto_194145 ) ( SUPPORTS ?auto_194146 ?auto_194143 ) ( not ( = ?auto_194142 ?auto_194144 ) ) ( HAVE_IMAGE ?auto_194137 ?auto_194138 ) ( not ( = ?auto_194137 ?auto_194142 ) ) ( not ( = ?auto_194137 ?auto_194144 ) ) ( not ( = ?auto_194138 ?auto_194143 ) ) ( CALIBRATION_TARGET ?auto_194146 ?auto_194144 ) ( POWER_AVAIL ?auto_194145 ) ( POINTING ?auto_194145 ?auto_194137 ) ( HAVE_IMAGE ?auto_194139 ?auto_194136 ) ( HAVE_IMAGE ?auto_194140 ?auto_194141 ) ( not ( = ?auto_194137 ?auto_194139 ) ) ( not ( = ?auto_194137 ?auto_194140 ) ) ( not ( = ?auto_194138 ?auto_194136 ) ) ( not ( = ?auto_194138 ?auto_194141 ) ) ( not ( = ?auto_194139 ?auto_194140 ) ) ( not ( = ?auto_194139 ?auto_194142 ) ) ( not ( = ?auto_194139 ?auto_194144 ) ) ( not ( = ?auto_194136 ?auto_194141 ) ) ( not ( = ?auto_194136 ?auto_194143 ) ) ( not ( = ?auto_194140 ?auto_194142 ) ) ( not ( = ?auto_194140 ?auto_194144 ) ) ( not ( = ?auto_194141 ?auto_194143 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_194137 ?auto_194138 ?auto_194142 ?auto_194143 )
      ( GET-4IMAGE-VERIFY ?auto_194137 ?auto_194138 ?auto_194139 ?auto_194136 ?auto_194140 ?auto_194141 ?auto_194142 ?auto_194143 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_194148 - DIRECTION
      ?auto_194149 - MODE
      ?auto_194150 - DIRECTION
      ?auto_194147 - MODE
      ?auto_194151 - DIRECTION
      ?auto_194152 - MODE
      ?auto_194153 - DIRECTION
      ?auto_194154 - MODE
    )
    :vars
    (
      ?auto_194157 - INSTRUMENT
      ?auto_194156 - SATELLITE
      ?auto_194155 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_194157 ?auto_194156 ) ( SUPPORTS ?auto_194157 ?auto_194152 ) ( not ( = ?auto_194151 ?auto_194155 ) ) ( HAVE_IMAGE ?auto_194153 ?auto_194154 ) ( not ( = ?auto_194153 ?auto_194151 ) ) ( not ( = ?auto_194153 ?auto_194155 ) ) ( not ( = ?auto_194154 ?auto_194152 ) ) ( CALIBRATION_TARGET ?auto_194157 ?auto_194155 ) ( POWER_AVAIL ?auto_194156 ) ( POINTING ?auto_194156 ?auto_194153 ) ( HAVE_IMAGE ?auto_194148 ?auto_194149 ) ( HAVE_IMAGE ?auto_194150 ?auto_194147 ) ( not ( = ?auto_194148 ?auto_194150 ) ) ( not ( = ?auto_194148 ?auto_194151 ) ) ( not ( = ?auto_194148 ?auto_194153 ) ) ( not ( = ?auto_194148 ?auto_194155 ) ) ( not ( = ?auto_194149 ?auto_194147 ) ) ( not ( = ?auto_194149 ?auto_194152 ) ) ( not ( = ?auto_194149 ?auto_194154 ) ) ( not ( = ?auto_194150 ?auto_194151 ) ) ( not ( = ?auto_194150 ?auto_194153 ) ) ( not ( = ?auto_194150 ?auto_194155 ) ) ( not ( = ?auto_194147 ?auto_194152 ) ) ( not ( = ?auto_194147 ?auto_194154 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_194153 ?auto_194154 ?auto_194151 ?auto_194152 )
      ( GET-4IMAGE-VERIFY ?auto_194148 ?auto_194149 ?auto_194150 ?auto_194147 ?auto_194151 ?auto_194152 ?auto_194153 ?auto_194154 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_194170 - DIRECTION
      ?auto_194171 - MODE
      ?auto_194172 - DIRECTION
      ?auto_194169 - MODE
      ?auto_194173 - DIRECTION
      ?auto_194174 - MODE
      ?auto_194175 - DIRECTION
      ?auto_194176 - MODE
    )
    :vars
    (
      ?auto_194179 - INSTRUMENT
      ?auto_194178 - SATELLITE
      ?auto_194177 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_194179 ?auto_194178 ) ( SUPPORTS ?auto_194179 ?auto_194169 ) ( not ( = ?auto_194172 ?auto_194177 ) ) ( HAVE_IMAGE ?auto_194173 ?auto_194174 ) ( not ( = ?auto_194173 ?auto_194172 ) ) ( not ( = ?auto_194173 ?auto_194177 ) ) ( not ( = ?auto_194174 ?auto_194169 ) ) ( CALIBRATION_TARGET ?auto_194179 ?auto_194177 ) ( POWER_AVAIL ?auto_194178 ) ( POINTING ?auto_194178 ?auto_194173 ) ( HAVE_IMAGE ?auto_194170 ?auto_194171 ) ( HAVE_IMAGE ?auto_194175 ?auto_194176 ) ( not ( = ?auto_194170 ?auto_194172 ) ) ( not ( = ?auto_194170 ?auto_194173 ) ) ( not ( = ?auto_194170 ?auto_194175 ) ) ( not ( = ?auto_194170 ?auto_194177 ) ) ( not ( = ?auto_194171 ?auto_194169 ) ) ( not ( = ?auto_194171 ?auto_194174 ) ) ( not ( = ?auto_194171 ?auto_194176 ) ) ( not ( = ?auto_194172 ?auto_194175 ) ) ( not ( = ?auto_194169 ?auto_194176 ) ) ( not ( = ?auto_194173 ?auto_194175 ) ) ( not ( = ?auto_194174 ?auto_194176 ) ) ( not ( = ?auto_194175 ?auto_194177 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_194173 ?auto_194174 ?auto_194172 ?auto_194169 )
      ( GET-4IMAGE-VERIFY ?auto_194170 ?auto_194171 ?auto_194172 ?auto_194169 ?auto_194173 ?auto_194174 ?auto_194175 ?auto_194176 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_194214 - DIRECTION
      ?auto_194215 - MODE
      ?auto_194216 - DIRECTION
      ?auto_194213 - MODE
      ?auto_194217 - DIRECTION
      ?auto_194218 - MODE
      ?auto_194219 - DIRECTION
      ?auto_194220 - MODE
    )
    :vars
    (
      ?auto_194223 - INSTRUMENT
      ?auto_194222 - SATELLITE
      ?auto_194221 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_194223 ?auto_194222 ) ( SUPPORTS ?auto_194223 ?auto_194215 ) ( not ( = ?auto_194214 ?auto_194221 ) ) ( HAVE_IMAGE ?auto_194219 ?auto_194218 ) ( not ( = ?auto_194219 ?auto_194214 ) ) ( not ( = ?auto_194219 ?auto_194221 ) ) ( not ( = ?auto_194218 ?auto_194215 ) ) ( CALIBRATION_TARGET ?auto_194223 ?auto_194221 ) ( POWER_AVAIL ?auto_194222 ) ( POINTING ?auto_194222 ?auto_194219 ) ( HAVE_IMAGE ?auto_194216 ?auto_194213 ) ( HAVE_IMAGE ?auto_194217 ?auto_194218 ) ( HAVE_IMAGE ?auto_194219 ?auto_194220 ) ( not ( = ?auto_194214 ?auto_194216 ) ) ( not ( = ?auto_194214 ?auto_194217 ) ) ( not ( = ?auto_194215 ?auto_194213 ) ) ( not ( = ?auto_194215 ?auto_194220 ) ) ( not ( = ?auto_194216 ?auto_194217 ) ) ( not ( = ?auto_194216 ?auto_194219 ) ) ( not ( = ?auto_194216 ?auto_194221 ) ) ( not ( = ?auto_194213 ?auto_194218 ) ) ( not ( = ?auto_194213 ?auto_194220 ) ) ( not ( = ?auto_194217 ?auto_194219 ) ) ( not ( = ?auto_194217 ?auto_194221 ) ) ( not ( = ?auto_194218 ?auto_194220 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_194219 ?auto_194218 ?auto_194214 ?auto_194215 )
      ( GET-4IMAGE-VERIFY ?auto_194214 ?auto_194215 ?auto_194216 ?auto_194213 ?auto_194217 ?auto_194218 ?auto_194219 ?auto_194220 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_194303 - DIRECTION
      ?auto_194304 - MODE
    )
    :vars
    (
      ?auto_194308 - INSTRUMENT
      ?auto_194306 - SATELLITE
      ?auto_194305 - DIRECTION
      ?auto_194309 - DIRECTION
      ?auto_194307 - MODE
      ?auto_194310 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_194308 ?auto_194306 ) ( SUPPORTS ?auto_194308 ?auto_194304 ) ( not ( = ?auto_194303 ?auto_194305 ) ) ( HAVE_IMAGE ?auto_194309 ?auto_194307 ) ( not ( = ?auto_194309 ?auto_194303 ) ) ( not ( = ?auto_194309 ?auto_194305 ) ) ( not ( = ?auto_194307 ?auto_194304 ) ) ( CALIBRATION_TARGET ?auto_194308 ?auto_194305 ) ( POINTING ?auto_194306 ?auto_194309 ) ( ON_BOARD ?auto_194310 ?auto_194306 ) ( POWER_ON ?auto_194310 ) ( not ( = ?auto_194308 ?auto_194310 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_194310 ?auto_194306 )
      ( GET-2IMAGE ?auto_194309 ?auto_194307 ?auto_194303 ?auto_194304 )
      ( GET-1IMAGE-VERIFY ?auto_194303 ?auto_194304 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_194312 - DIRECTION
      ?auto_194313 - MODE
      ?auto_194314 - DIRECTION
      ?auto_194311 - MODE
    )
    :vars
    (
      ?auto_194318 - INSTRUMENT
      ?auto_194315 - SATELLITE
      ?auto_194317 - DIRECTION
      ?auto_194316 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_194318 ?auto_194315 ) ( SUPPORTS ?auto_194318 ?auto_194311 ) ( not ( = ?auto_194314 ?auto_194317 ) ) ( HAVE_IMAGE ?auto_194312 ?auto_194313 ) ( not ( = ?auto_194312 ?auto_194314 ) ) ( not ( = ?auto_194312 ?auto_194317 ) ) ( not ( = ?auto_194313 ?auto_194311 ) ) ( CALIBRATION_TARGET ?auto_194318 ?auto_194317 ) ( POINTING ?auto_194315 ?auto_194312 ) ( ON_BOARD ?auto_194316 ?auto_194315 ) ( POWER_ON ?auto_194316 ) ( not ( = ?auto_194318 ?auto_194316 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_194314 ?auto_194311 )
      ( GET-2IMAGE-VERIFY ?auto_194312 ?auto_194313 ?auto_194314 ?auto_194311 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_194320 - DIRECTION
      ?auto_194321 - MODE
      ?auto_194322 - DIRECTION
      ?auto_194319 - MODE
    )
    :vars
    (
      ?auto_194326 - INSTRUMENT
      ?auto_194325 - SATELLITE
      ?auto_194323 - DIRECTION
      ?auto_194324 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_194326 ?auto_194325 ) ( SUPPORTS ?auto_194326 ?auto_194321 ) ( not ( = ?auto_194320 ?auto_194323 ) ) ( HAVE_IMAGE ?auto_194322 ?auto_194319 ) ( not ( = ?auto_194322 ?auto_194320 ) ) ( not ( = ?auto_194322 ?auto_194323 ) ) ( not ( = ?auto_194319 ?auto_194321 ) ) ( CALIBRATION_TARGET ?auto_194326 ?auto_194323 ) ( POINTING ?auto_194325 ?auto_194322 ) ( ON_BOARD ?auto_194324 ?auto_194325 ) ( POWER_ON ?auto_194324 ) ( not ( = ?auto_194326 ?auto_194324 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_194322 ?auto_194319 ?auto_194320 ?auto_194321 )
      ( GET-2IMAGE-VERIFY ?auto_194320 ?auto_194321 ?auto_194322 ?auto_194319 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_194338 - DIRECTION
      ?auto_194339 - MODE
      ?auto_194340 - DIRECTION
      ?auto_194337 - MODE
      ?auto_194341 - DIRECTION
      ?auto_194342 - MODE
    )
    :vars
    (
      ?auto_194346 - INSTRUMENT
      ?auto_194345 - SATELLITE
      ?auto_194343 - DIRECTION
      ?auto_194344 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_194346 ?auto_194345 ) ( SUPPORTS ?auto_194346 ?auto_194342 ) ( not ( = ?auto_194341 ?auto_194343 ) ) ( HAVE_IMAGE ?auto_194340 ?auto_194337 ) ( not ( = ?auto_194340 ?auto_194341 ) ) ( not ( = ?auto_194340 ?auto_194343 ) ) ( not ( = ?auto_194337 ?auto_194342 ) ) ( CALIBRATION_TARGET ?auto_194346 ?auto_194343 ) ( POINTING ?auto_194345 ?auto_194340 ) ( ON_BOARD ?auto_194344 ?auto_194345 ) ( POWER_ON ?auto_194344 ) ( not ( = ?auto_194346 ?auto_194344 ) ) ( HAVE_IMAGE ?auto_194338 ?auto_194339 ) ( not ( = ?auto_194338 ?auto_194340 ) ) ( not ( = ?auto_194338 ?auto_194341 ) ) ( not ( = ?auto_194338 ?auto_194343 ) ) ( not ( = ?auto_194339 ?auto_194337 ) ) ( not ( = ?auto_194339 ?auto_194342 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_194340 ?auto_194337 ?auto_194341 ?auto_194342 )
      ( GET-3IMAGE-VERIFY ?auto_194338 ?auto_194339 ?auto_194340 ?auto_194337 ?auto_194341 ?auto_194342 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_194348 - DIRECTION
      ?auto_194349 - MODE
      ?auto_194350 - DIRECTION
      ?auto_194347 - MODE
      ?auto_194351 - DIRECTION
      ?auto_194352 - MODE
    )
    :vars
    (
      ?auto_194356 - INSTRUMENT
      ?auto_194355 - SATELLITE
      ?auto_194353 - DIRECTION
      ?auto_194354 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_194356 ?auto_194355 ) ( SUPPORTS ?auto_194356 ?auto_194347 ) ( not ( = ?auto_194350 ?auto_194353 ) ) ( HAVE_IMAGE ?auto_194348 ?auto_194349 ) ( not ( = ?auto_194348 ?auto_194350 ) ) ( not ( = ?auto_194348 ?auto_194353 ) ) ( not ( = ?auto_194349 ?auto_194347 ) ) ( CALIBRATION_TARGET ?auto_194356 ?auto_194353 ) ( POINTING ?auto_194355 ?auto_194348 ) ( ON_BOARD ?auto_194354 ?auto_194355 ) ( POWER_ON ?auto_194354 ) ( not ( = ?auto_194356 ?auto_194354 ) ) ( HAVE_IMAGE ?auto_194351 ?auto_194352 ) ( not ( = ?auto_194348 ?auto_194351 ) ) ( not ( = ?auto_194349 ?auto_194352 ) ) ( not ( = ?auto_194350 ?auto_194351 ) ) ( not ( = ?auto_194347 ?auto_194352 ) ) ( not ( = ?auto_194351 ?auto_194353 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_194348 ?auto_194349 ?auto_194350 ?auto_194347 )
      ( GET-3IMAGE-VERIFY ?auto_194348 ?auto_194349 ?auto_194350 ?auto_194347 ?auto_194351 ?auto_194352 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_194368 - DIRECTION
      ?auto_194369 - MODE
      ?auto_194370 - DIRECTION
      ?auto_194367 - MODE
      ?auto_194371 - DIRECTION
      ?auto_194372 - MODE
    )
    :vars
    (
      ?auto_194376 - INSTRUMENT
      ?auto_194375 - SATELLITE
      ?auto_194373 - DIRECTION
      ?auto_194374 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_194376 ?auto_194375 ) ( SUPPORTS ?auto_194376 ?auto_194369 ) ( not ( = ?auto_194368 ?auto_194373 ) ) ( HAVE_IMAGE ?auto_194371 ?auto_194372 ) ( not ( = ?auto_194371 ?auto_194368 ) ) ( not ( = ?auto_194371 ?auto_194373 ) ) ( not ( = ?auto_194372 ?auto_194369 ) ) ( CALIBRATION_TARGET ?auto_194376 ?auto_194373 ) ( POINTING ?auto_194375 ?auto_194371 ) ( ON_BOARD ?auto_194374 ?auto_194375 ) ( POWER_ON ?auto_194374 ) ( not ( = ?auto_194376 ?auto_194374 ) ) ( HAVE_IMAGE ?auto_194370 ?auto_194367 ) ( not ( = ?auto_194368 ?auto_194370 ) ) ( not ( = ?auto_194369 ?auto_194367 ) ) ( not ( = ?auto_194370 ?auto_194371 ) ) ( not ( = ?auto_194370 ?auto_194373 ) ) ( not ( = ?auto_194367 ?auto_194372 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_194371 ?auto_194372 ?auto_194368 ?auto_194369 )
      ( GET-3IMAGE-VERIFY ?auto_194368 ?auto_194369 ?auto_194370 ?auto_194367 ?auto_194371 ?auto_194372 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_194410 - DIRECTION
      ?auto_194411 - MODE
      ?auto_194412 - DIRECTION
      ?auto_194409 - MODE
      ?auto_194413 - DIRECTION
      ?auto_194414 - MODE
      ?auto_194415 - DIRECTION
      ?auto_194416 - MODE
    )
    :vars
    (
      ?auto_194420 - INSTRUMENT
      ?auto_194419 - SATELLITE
      ?auto_194417 - DIRECTION
      ?auto_194418 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_194420 ?auto_194419 ) ( SUPPORTS ?auto_194420 ?auto_194416 ) ( not ( = ?auto_194415 ?auto_194417 ) ) ( HAVE_IMAGE ?auto_194413 ?auto_194414 ) ( not ( = ?auto_194413 ?auto_194415 ) ) ( not ( = ?auto_194413 ?auto_194417 ) ) ( not ( = ?auto_194414 ?auto_194416 ) ) ( CALIBRATION_TARGET ?auto_194420 ?auto_194417 ) ( POINTING ?auto_194419 ?auto_194413 ) ( ON_BOARD ?auto_194418 ?auto_194419 ) ( POWER_ON ?auto_194418 ) ( not ( = ?auto_194420 ?auto_194418 ) ) ( HAVE_IMAGE ?auto_194410 ?auto_194411 ) ( HAVE_IMAGE ?auto_194412 ?auto_194409 ) ( not ( = ?auto_194410 ?auto_194412 ) ) ( not ( = ?auto_194410 ?auto_194413 ) ) ( not ( = ?auto_194410 ?auto_194415 ) ) ( not ( = ?auto_194410 ?auto_194417 ) ) ( not ( = ?auto_194411 ?auto_194409 ) ) ( not ( = ?auto_194411 ?auto_194414 ) ) ( not ( = ?auto_194411 ?auto_194416 ) ) ( not ( = ?auto_194412 ?auto_194413 ) ) ( not ( = ?auto_194412 ?auto_194415 ) ) ( not ( = ?auto_194412 ?auto_194417 ) ) ( not ( = ?auto_194409 ?auto_194414 ) ) ( not ( = ?auto_194409 ?auto_194416 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_194413 ?auto_194414 ?auto_194415 ?auto_194416 )
      ( GET-4IMAGE-VERIFY ?auto_194410 ?auto_194411 ?auto_194412 ?auto_194409 ?auto_194413 ?auto_194414 ?auto_194415 ?auto_194416 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_194422 - DIRECTION
      ?auto_194423 - MODE
      ?auto_194424 - DIRECTION
      ?auto_194421 - MODE
      ?auto_194425 - DIRECTION
      ?auto_194426 - MODE
      ?auto_194427 - DIRECTION
      ?auto_194428 - MODE
    )
    :vars
    (
      ?auto_194432 - INSTRUMENT
      ?auto_194431 - SATELLITE
      ?auto_194429 - DIRECTION
      ?auto_194430 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_194432 ?auto_194431 ) ( SUPPORTS ?auto_194432 ?auto_194426 ) ( not ( = ?auto_194425 ?auto_194429 ) ) ( HAVE_IMAGE ?auto_194424 ?auto_194423 ) ( not ( = ?auto_194424 ?auto_194425 ) ) ( not ( = ?auto_194424 ?auto_194429 ) ) ( not ( = ?auto_194423 ?auto_194426 ) ) ( CALIBRATION_TARGET ?auto_194432 ?auto_194429 ) ( POINTING ?auto_194431 ?auto_194424 ) ( ON_BOARD ?auto_194430 ?auto_194431 ) ( POWER_ON ?auto_194430 ) ( not ( = ?auto_194432 ?auto_194430 ) ) ( HAVE_IMAGE ?auto_194422 ?auto_194423 ) ( HAVE_IMAGE ?auto_194424 ?auto_194421 ) ( HAVE_IMAGE ?auto_194427 ?auto_194428 ) ( not ( = ?auto_194422 ?auto_194424 ) ) ( not ( = ?auto_194422 ?auto_194425 ) ) ( not ( = ?auto_194422 ?auto_194427 ) ) ( not ( = ?auto_194422 ?auto_194429 ) ) ( not ( = ?auto_194423 ?auto_194421 ) ) ( not ( = ?auto_194423 ?auto_194428 ) ) ( not ( = ?auto_194424 ?auto_194427 ) ) ( not ( = ?auto_194421 ?auto_194426 ) ) ( not ( = ?auto_194421 ?auto_194428 ) ) ( not ( = ?auto_194425 ?auto_194427 ) ) ( not ( = ?auto_194426 ?auto_194428 ) ) ( not ( = ?auto_194427 ?auto_194429 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_194424 ?auto_194423 ?auto_194425 ?auto_194426 )
      ( GET-4IMAGE-VERIFY ?auto_194422 ?auto_194423 ?auto_194424 ?auto_194421 ?auto_194425 ?auto_194426 ?auto_194427 ?auto_194428 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_194446 - DIRECTION
      ?auto_194447 - MODE
      ?auto_194448 - DIRECTION
      ?auto_194445 - MODE
      ?auto_194449 - DIRECTION
      ?auto_194450 - MODE
      ?auto_194451 - DIRECTION
      ?auto_194452 - MODE
    )
    :vars
    (
      ?auto_194456 - INSTRUMENT
      ?auto_194455 - SATELLITE
      ?auto_194453 - DIRECTION
      ?auto_194454 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_194456 ?auto_194455 ) ( SUPPORTS ?auto_194456 ?auto_194445 ) ( not ( = ?auto_194448 ?auto_194453 ) ) ( HAVE_IMAGE ?auto_194446 ?auto_194450 ) ( not ( = ?auto_194446 ?auto_194448 ) ) ( not ( = ?auto_194446 ?auto_194453 ) ) ( not ( = ?auto_194450 ?auto_194445 ) ) ( CALIBRATION_TARGET ?auto_194456 ?auto_194453 ) ( POINTING ?auto_194455 ?auto_194446 ) ( ON_BOARD ?auto_194454 ?auto_194455 ) ( POWER_ON ?auto_194454 ) ( not ( = ?auto_194456 ?auto_194454 ) ) ( HAVE_IMAGE ?auto_194446 ?auto_194447 ) ( HAVE_IMAGE ?auto_194449 ?auto_194450 ) ( HAVE_IMAGE ?auto_194451 ?auto_194452 ) ( not ( = ?auto_194446 ?auto_194449 ) ) ( not ( = ?auto_194446 ?auto_194451 ) ) ( not ( = ?auto_194447 ?auto_194445 ) ) ( not ( = ?auto_194447 ?auto_194450 ) ) ( not ( = ?auto_194447 ?auto_194452 ) ) ( not ( = ?auto_194448 ?auto_194449 ) ) ( not ( = ?auto_194448 ?auto_194451 ) ) ( not ( = ?auto_194445 ?auto_194452 ) ) ( not ( = ?auto_194449 ?auto_194451 ) ) ( not ( = ?auto_194449 ?auto_194453 ) ) ( not ( = ?auto_194450 ?auto_194452 ) ) ( not ( = ?auto_194451 ?auto_194453 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_194446 ?auto_194450 ?auto_194448 ?auto_194445 )
      ( GET-4IMAGE-VERIFY ?auto_194446 ?auto_194447 ?auto_194448 ?auto_194445 ?auto_194449 ?auto_194450 ?auto_194451 ?auto_194452 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_194494 - DIRECTION
      ?auto_194495 - MODE
      ?auto_194496 - DIRECTION
      ?auto_194493 - MODE
      ?auto_194497 - DIRECTION
      ?auto_194498 - MODE
      ?auto_194499 - DIRECTION
      ?auto_194500 - MODE
    )
    :vars
    (
      ?auto_194504 - INSTRUMENT
      ?auto_194503 - SATELLITE
      ?auto_194501 - DIRECTION
      ?auto_194502 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_194504 ?auto_194503 ) ( SUPPORTS ?auto_194504 ?auto_194495 ) ( not ( = ?auto_194494 ?auto_194501 ) ) ( HAVE_IMAGE ?auto_194499 ?auto_194493 ) ( not ( = ?auto_194499 ?auto_194494 ) ) ( not ( = ?auto_194499 ?auto_194501 ) ) ( not ( = ?auto_194493 ?auto_194495 ) ) ( CALIBRATION_TARGET ?auto_194504 ?auto_194501 ) ( POINTING ?auto_194503 ?auto_194499 ) ( ON_BOARD ?auto_194502 ?auto_194503 ) ( POWER_ON ?auto_194502 ) ( not ( = ?auto_194504 ?auto_194502 ) ) ( HAVE_IMAGE ?auto_194496 ?auto_194493 ) ( HAVE_IMAGE ?auto_194497 ?auto_194498 ) ( HAVE_IMAGE ?auto_194499 ?auto_194500 ) ( not ( = ?auto_194494 ?auto_194496 ) ) ( not ( = ?auto_194494 ?auto_194497 ) ) ( not ( = ?auto_194495 ?auto_194498 ) ) ( not ( = ?auto_194495 ?auto_194500 ) ) ( not ( = ?auto_194496 ?auto_194497 ) ) ( not ( = ?auto_194496 ?auto_194499 ) ) ( not ( = ?auto_194496 ?auto_194501 ) ) ( not ( = ?auto_194493 ?auto_194498 ) ) ( not ( = ?auto_194493 ?auto_194500 ) ) ( not ( = ?auto_194497 ?auto_194499 ) ) ( not ( = ?auto_194497 ?auto_194501 ) ) ( not ( = ?auto_194498 ?auto_194500 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_194499 ?auto_194493 ?auto_194494 ?auto_194495 )
      ( GET-4IMAGE-VERIFY ?auto_194494 ?auto_194495 ?auto_194496 ?auto_194493 ?auto_194497 ?auto_194498 ?auto_194499 ?auto_194500 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_194591 - DIRECTION
      ?auto_194592 - MODE
    )
    :vars
    (
      ?auto_194598 - INSTRUMENT
      ?auto_194597 - SATELLITE
      ?auto_194593 - DIRECTION
      ?auto_194594 - DIRECTION
      ?auto_194595 - MODE
      ?auto_194596 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_194598 ?auto_194597 ) ( SUPPORTS ?auto_194598 ?auto_194592 ) ( not ( = ?auto_194591 ?auto_194593 ) ) ( not ( = ?auto_194594 ?auto_194591 ) ) ( not ( = ?auto_194594 ?auto_194593 ) ) ( not ( = ?auto_194595 ?auto_194592 ) ) ( CALIBRATION_TARGET ?auto_194598 ?auto_194593 ) ( POINTING ?auto_194597 ?auto_194594 ) ( ON_BOARD ?auto_194596 ?auto_194597 ) ( POWER_ON ?auto_194596 ) ( not ( = ?auto_194598 ?auto_194596 ) ) ( CALIBRATED ?auto_194596 ) ( SUPPORTS ?auto_194596 ?auto_194595 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_194594 ?auto_194595 )
      ( GET-2IMAGE ?auto_194594 ?auto_194595 ?auto_194591 ?auto_194592 )
      ( GET-1IMAGE-VERIFY ?auto_194591 ?auto_194592 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_194600 - DIRECTION
      ?auto_194601 - MODE
      ?auto_194602 - DIRECTION
      ?auto_194599 - MODE
    )
    :vars
    (
      ?auto_194604 - INSTRUMENT
      ?auto_194603 - SATELLITE
      ?auto_194606 - DIRECTION
      ?auto_194605 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_194604 ?auto_194603 ) ( SUPPORTS ?auto_194604 ?auto_194599 ) ( not ( = ?auto_194602 ?auto_194606 ) ) ( not ( = ?auto_194600 ?auto_194602 ) ) ( not ( = ?auto_194600 ?auto_194606 ) ) ( not ( = ?auto_194601 ?auto_194599 ) ) ( CALIBRATION_TARGET ?auto_194604 ?auto_194606 ) ( POINTING ?auto_194603 ?auto_194600 ) ( ON_BOARD ?auto_194605 ?auto_194603 ) ( POWER_ON ?auto_194605 ) ( not ( = ?auto_194604 ?auto_194605 ) ) ( CALIBRATED ?auto_194605 ) ( SUPPORTS ?auto_194605 ?auto_194601 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_194602 ?auto_194599 )
      ( GET-2IMAGE-VERIFY ?auto_194600 ?auto_194601 ?auto_194602 ?auto_194599 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_194608 - DIRECTION
      ?auto_194609 - MODE
      ?auto_194610 - DIRECTION
      ?auto_194607 - MODE
    )
    :vars
    (
      ?auto_194614 - INSTRUMENT
      ?auto_194611 - SATELLITE
      ?auto_194613 - DIRECTION
      ?auto_194612 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_194614 ?auto_194611 ) ( SUPPORTS ?auto_194614 ?auto_194609 ) ( not ( = ?auto_194608 ?auto_194613 ) ) ( not ( = ?auto_194610 ?auto_194608 ) ) ( not ( = ?auto_194610 ?auto_194613 ) ) ( not ( = ?auto_194607 ?auto_194609 ) ) ( CALIBRATION_TARGET ?auto_194614 ?auto_194613 ) ( POINTING ?auto_194611 ?auto_194610 ) ( ON_BOARD ?auto_194612 ?auto_194611 ) ( POWER_ON ?auto_194612 ) ( not ( = ?auto_194614 ?auto_194612 ) ) ( CALIBRATED ?auto_194612 ) ( SUPPORTS ?auto_194612 ?auto_194607 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_194610 ?auto_194607 ?auto_194608 ?auto_194609 )
      ( GET-2IMAGE-VERIFY ?auto_194608 ?auto_194609 ?auto_194610 ?auto_194607 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_194879 - DIRECTION
      ?auto_194880 - MODE
    )
    :vars
    (
      ?auto_194886 - INSTRUMENT
      ?auto_194881 - SATELLITE
      ?auto_194883 - DIRECTION
      ?auto_194885 - DIRECTION
      ?auto_194884 - MODE
      ?auto_194882 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_194886 ?auto_194881 ) ( SUPPORTS ?auto_194886 ?auto_194880 ) ( not ( = ?auto_194879 ?auto_194883 ) ) ( not ( = ?auto_194885 ?auto_194879 ) ) ( not ( = ?auto_194885 ?auto_194883 ) ) ( not ( = ?auto_194884 ?auto_194880 ) ) ( CALIBRATION_TARGET ?auto_194886 ?auto_194883 ) ( ON_BOARD ?auto_194882 ?auto_194881 ) ( POWER_ON ?auto_194882 ) ( not ( = ?auto_194886 ?auto_194882 ) ) ( CALIBRATED ?auto_194882 ) ( SUPPORTS ?auto_194882 ?auto_194884 ) ( POINTING ?auto_194881 ?auto_194883 ) )
    :subtasks
    ( ( !TURN_TO ?auto_194881 ?auto_194885 ?auto_194883 )
      ( GET-2IMAGE ?auto_194885 ?auto_194884 ?auto_194879 ?auto_194880 )
      ( GET-1IMAGE-VERIFY ?auto_194879 ?auto_194880 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_194888 - DIRECTION
      ?auto_194889 - MODE
      ?auto_194890 - DIRECTION
      ?auto_194887 - MODE
    )
    :vars
    (
      ?auto_194893 - INSTRUMENT
      ?auto_194894 - SATELLITE
      ?auto_194892 - DIRECTION
      ?auto_194891 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_194893 ?auto_194894 ) ( SUPPORTS ?auto_194893 ?auto_194887 ) ( not ( = ?auto_194890 ?auto_194892 ) ) ( not ( = ?auto_194888 ?auto_194890 ) ) ( not ( = ?auto_194888 ?auto_194892 ) ) ( not ( = ?auto_194889 ?auto_194887 ) ) ( CALIBRATION_TARGET ?auto_194893 ?auto_194892 ) ( ON_BOARD ?auto_194891 ?auto_194894 ) ( POWER_ON ?auto_194891 ) ( not ( = ?auto_194893 ?auto_194891 ) ) ( CALIBRATED ?auto_194891 ) ( SUPPORTS ?auto_194891 ?auto_194889 ) ( POINTING ?auto_194894 ?auto_194892 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_194890 ?auto_194887 )
      ( GET-2IMAGE-VERIFY ?auto_194888 ?auto_194889 ?auto_194890 ?auto_194887 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_194896 - DIRECTION
      ?auto_194897 - MODE
      ?auto_194898 - DIRECTION
      ?auto_194895 - MODE
    )
    :vars
    (
      ?auto_194901 - INSTRUMENT
      ?auto_194902 - SATELLITE
      ?auto_194900 - DIRECTION
      ?auto_194899 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_194901 ?auto_194902 ) ( SUPPORTS ?auto_194901 ?auto_194897 ) ( not ( = ?auto_194896 ?auto_194900 ) ) ( not ( = ?auto_194898 ?auto_194896 ) ) ( not ( = ?auto_194898 ?auto_194900 ) ) ( not ( = ?auto_194895 ?auto_194897 ) ) ( CALIBRATION_TARGET ?auto_194901 ?auto_194900 ) ( ON_BOARD ?auto_194899 ?auto_194902 ) ( POWER_ON ?auto_194899 ) ( not ( = ?auto_194901 ?auto_194899 ) ) ( CALIBRATED ?auto_194899 ) ( SUPPORTS ?auto_194899 ?auto_194895 ) ( POINTING ?auto_194902 ?auto_194900 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_194898 ?auto_194895 ?auto_194896 ?auto_194897 )
      ( GET-2IMAGE-VERIFY ?auto_194896 ?auto_194897 ?auto_194898 ?auto_194895 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_195167 - DIRECTION
      ?auto_195168 - MODE
    )
    :vars
    (
      ?auto_195173 - INSTRUMENT
      ?auto_195174 - SATELLITE
      ?auto_195172 - DIRECTION
      ?auto_195171 - DIRECTION
      ?auto_195170 - MODE
      ?auto_195169 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_195173 ?auto_195174 ) ( SUPPORTS ?auto_195173 ?auto_195168 ) ( not ( = ?auto_195167 ?auto_195172 ) ) ( not ( = ?auto_195171 ?auto_195167 ) ) ( not ( = ?auto_195171 ?auto_195172 ) ) ( not ( = ?auto_195170 ?auto_195168 ) ) ( CALIBRATION_TARGET ?auto_195173 ?auto_195172 ) ( ON_BOARD ?auto_195169 ?auto_195174 ) ( POWER_ON ?auto_195169 ) ( not ( = ?auto_195173 ?auto_195169 ) ) ( SUPPORTS ?auto_195169 ?auto_195170 ) ( POINTING ?auto_195174 ?auto_195172 ) ( CALIBRATION_TARGET ?auto_195169 ?auto_195172 ) ( NOT_CALIBRATED ?auto_195169 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_195174 ?auto_195169 ?auto_195172 )
      ( GET-2IMAGE ?auto_195171 ?auto_195170 ?auto_195167 ?auto_195168 )
      ( GET-1IMAGE-VERIFY ?auto_195167 ?auto_195168 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_195176 - DIRECTION
      ?auto_195177 - MODE
      ?auto_195178 - DIRECTION
      ?auto_195175 - MODE
    )
    :vars
    (
      ?auto_195179 - INSTRUMENT
      ?auto_195182 - SATELLITE
      ?auto_195181 - DIRECTION
      ?auto_195180 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_195179 ?auto_195182 ) ( SUPPORTS ?auto_195179 ?auto_195175 ) ( not ( = ?auto_195178 ?auto_195181 ) ) ( not ( = ?auto_195176 ?auto_195178 ) ) ( not ( = ?auto_195176 ?auto_195181 ) ) ( not ( = ?auto_195177 ?auto_195175 ) ) ( CALIBRATION_TARGET ?auto_195179 ?auto_195181 ) ( ON_BOARD ?auto_195180 ?auto_195182 ) ( POWER_ON ?auto_195180 ) ( not ( = ?auto_195179 ?auto_195180 ) ) ( SUPPORTS ?auto_195180 ?auto_195177 ) ( POINTING ?auto_195182 ?auto_195181 ) ( CALIBRATION_TARGET ?auto_195180 ?auto_195181 ) ( NOT_CALIBRATED ?auto_195180 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_195178 ?auto_195175 )
      ( GET-2IMAGE-VERIFY ?auto_195176 ?auto_195177 ?auto_195178 ?auto_195175 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_195184 - DIRECTION
      ?auto_195185 - MODE
      ?auto_195186 - DIRECTION
      ?auto_195183 - MODE
    )
    :vars
    (
      ?auto_195188 - INSTRUMENT
      ?auto_195190 - SATELLITE
      ?auto_195189 - DIRECTION
      ?auto_195187 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_195188 ?auto_195190 ) ( SUPPORTS ?auto_195188 ?auto_195185 ) ( not ( = ?auto_195184 ?auto_195189 ) ) ( not ( = ?auto_195186 ?auto_195184 ) ) ( not ( = ?auto_195186 ?auto_195189 ) ) ( not ( = ?auto_195183 ?auto_195185 ) ) ( CALIBRATION_TARGET ?auto_195188 ?auto_195189 ) ( ON_BOARD ?auto_195187 ?auto_195190 ) ( POWER_ON ?auto_195187 ) ( not ( = ?auto_195188 ?auto_195187 ) ) ( SUPPORTS ?auto_195187 ?auto_195183 ) ( POINTING ?auto_195190 ?auto_195189 ) ( CALIBRATION_TARGET ?auto_195187 ?auto_195189 ) ( NOT_CALIBRATED ?auto_195187 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_195186 ?auto_195183 ?auto_195184 ?auto_195185 )
      ( GET-2IMAGE-VERIFY ?auto_195184 ?auto_195185 ?auto_195186 ?auto_195183 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_197540 - DIRECTION
      ?auto_197541 - MODE
      ?auto_197542 - DIRECTION
      ?auto_197539 - MODE
      ?auto_197543 - DIRECTION
      ?auto_197544 - MODE
    )
    :vars
    (
      ?auto_197549 - INSTRUMENT
      ?auto_197545 - SATELLITE
      ?auto_197546 - DIRECTION
      ?auto_197548 - DIRECTION
      ?auto_197547 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_197549 ) ( ON_BOARD ?auto_197549 ?auto_197545 ) ( SUPPORTS ?auto_197549 ?auto_197544 ) ( POWER_ON ?auto_197549 ) ( POINTING ?auto_197545 ?auto_197546 ) ( not ( = ?auto_197543 ?auto_197546 ) ) ( HAVE_IMAGE ?auto_197548 ?auto_197547 ) ( not ( = ?auto_197548 ?auto_197543 ) ) ( not ( = ?auto_197548 ?auto_197546 ) ) ( not ( = ?auto_197547 ?auto_197544 ) ) ( HAVE_IMAGE ?auto_197540 ?auto_197541 ) ( HAVE_IMAGE ?auto_197542 ?auto_197539 ) ( not ( = ?auto_197540 ?auto_197542 ) ) ( not ( = ?auto_197540 ?auto_197543 ) ) ( not ( = ?auto_197540 ?auto_197546 ) ) ( not ( = ?auto_197540 ?auto_197548 ) ) ( not ( = ?auto_197541 ?auto_197539 ) ) ( not ( = ?auto_197541 ?auto_197544 ) ) ( not ( = ?auto_197541 ?auto_197547 ) ) ( not ( = ?auto_197542 ?auto_197543 ) ) ( not ( = ?auto_197542 ?auto_197546 ) ) ( not ( = ?auto_197542 ?auto_197548 ) ) ( not ( = ?auto_197539 ?auto_197544 ) ) ( not ( = ?auto_197539 ?auto_197547 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_197548 ?auto_197547 ?auto_197543 ?auto_197544 )
      ( GET-3IMAGE-VERIFY ?auto_197540 ?auto_197541 ?auto_197542 ?auto_197539 ?auto_197543 ?auto_197544 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_197557 - DIRECTION
      ?auto_197558 - MODE
      ?auto_197559 - DIRECTION
      ?auto_197556 - MODE
      ?auto_197560 - DIRECTION
      ?auto_197561 - MODE
    )
    :vars
    (
      ?auto_197566 - INSTRUMENT
      ?auto_197562 - SATELLITE
      ?auto_197563 - DIRECTION
      ?auto_197565 - DIRECTION
      ?auto_197564 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_197566 ) ( ON_BOARD ?auto_197566 ?auto_197562 ) ( SUPPORTS ?auto_197566 ?auto_197556 ) ( POWER_ON ?auto_197566 ) ( POINTING ?auto_197562 ?auto_197563 ) ( not ( = ?auto_197559 ?auto_197563 ) ) ( HAVE_IMAGE ?auto_197565 ?auto_197564 ) ( not ( = ?auto_197565 ?auto_197559 ) ) ( not ( = ?auto_197565 ?auto_197563 ) ) ( not ( = ?auto_197564 ?auto_197556 ) ) ( HAVE_IMAGE ?auto_197557 ?auto_197558 ) ( HAVE_IMAGE ?auto_197560 ?auto_197561 ) ( not ( = ?auto_197557 ?auto_197559 ) ) ( not ( = ?auto_197557 ?auto_197560 ) ) ( not ( = ?auto_197557 ?auto_197563 ) ) ( not ( = ?auto_197557 ?auto_197565 ) ) ( not ( = ?auto_197558 ?auto_197556 ) ) ( not ( = ?auto_197558 ?auto_197561 ) ) ( not ( = ?auto_197558 ?auto_197564 ) ) ( not ( = ?auto_197559 ?auto_197560 ) ) ( not ( = ?auto_197556 ?auto_197561 ) ) ( not ( = ?auto_197560 ?auto_197563 ) ) ( not ( = ?auto_197560 ?auto_197565 ) ) ( not ( = ?auto_197561 ?auto_197564 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_197565 ?auto_197564 ?auto_197559 ?auto_197556 )
      ( GET-3IMAGE-VERIFY ?auto_197557 ?auto_197558 ?auto_197559 ?auto_197556 ?auto_197560 ?auto_197561 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_197579 - DIRECTION
      ?auto_197580 - MODE
      ?auto_197581 - DIRECTION
      ?auto_197578 - MODE
      ?auto_197582 - DIRECTION
      ?auto_197583 - MODE
    )
    :vars
    (
      ?auto_197586 - INSTRUMENT
      ?auto_197584 - SATELLITE
      ?auto_197585 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_197586 ) ( ON_BOARD ?auto_197586 ?auto_197584 ) ( SUPPORTS ?auto_197586 ?auto_197580 ) ( POWER_ON ?auto_197586 ) ( POINTING ?auto_197584 ?auto_197585 ) ( not ( = ?auto_197579 ?auto_197585 ) ) ( HAVE_IMAGE ?auto_197582 ?auto_197583 ) ( not ( = ?auto_197582 ?auto_197579 ) ) ( not ( = ?auto_197582 ?auto_197585 ) ) ( not ( = ?auto_197583 ?auto_197580 ) ) ( HAVE_IMAGE ?auto_197581 ?auto_197578 ) ( not ( = ?auto_197579 ?auto_197581 ) ) ( not ( = ?auto_197580 ?auto_197578 ) ) ( not ( = ?auto_197581 ?auto_197582 ) ) ( not ( = ?auto_197581 ?auto_197585 ) ) ( not ( = ?auto_197578 ?auto_197583 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_197582 ?auto_197583 ?auto_197579 ?auto_197580 )
      ( GET-3IMAGE-VERIFY ?auto_197579 ?auto_197580 ?auto_197581 ?auto_197578 ?auto_197582 ?auto_197583 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_197609 - DIRECTION
      ?auto_197610 - MODE
      ?auto_197611 - DIRECTION
      ?auto_197608 - MODE
      ?auto_197612 - DIRECTION
      ?auto_197613 - MODE
    )
    :vars
    (
      ?auto_197618 - INSTRUMENT
      ?auto_197614 - SATELLITE
      ?auto_197615 - DIRECTION
      ?auto_197617 - DIRECTION
      ?auto_197616 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_197618 ) ( ON_BOARD ?auto_197618 ?auto_197614 ) ( SUPPORTS ?auto_197618 ?auto_197610 ) ( POWER_ON ?auto_197618 ) ( POINTING ?auto_197614 ?auto_197615 ) ( not ( = ?auto_197609 ?auto_197615 ) ) ( HAVE_IMAGE ?auto_197617 ?auto_197616 ) ( not ( = ?auto_197617 ?auto_197609 ) ) ( not ( = ?auto_197617 ?auto_197615 ) ) ( not ( = ?auto_197616 ?auto_197610 ) ) ( HAVE_IMAGE ?auto_197611 ?auto_197608 ) ( HAVE_IMAGE ?auto_197612 ?auto_197613 ) ( not ( = ?auto_197609 ?auto_197611 ) ) ( not ( = ?auto_197609 ?auto_197612 ) ) ( not ( = ?auto_197610 ?auto_197608 ) ) ( not ( = ?auto_197610 ?auto_197613 ) ) ( not ( = ?auto_197611 ?auto_197612 ) ) ( not ( = ?auto_197611 ?auto_197615 ) ) ( not ( = ?auto_197611 ?auto_197617 ) ) ( not ( = ?auto_197608 ?auto_197613 ) ) ( not ( = ?auto_197608 ?auto_197616 ) ) ( not ( = ?auto_197612 ?auto_197615 ) ) ( not ( = ?auto_197612 ?auto_197617 ) ) ( not ( = ?auto_197613 ?auto_197616 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_197617 ?auto_197616 ?auto_197609 ?auto_197610 )
      ( GET-3IMAGE-VERIFY ?auto_197609 ?auto_197610 ?auto_197611 ?auto_197608 ?auto_197612 ?auto_197613 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_197662 - DIRECTION
      ?auto_197663 - MODE
      ?auto_197664 - DIRECTION
      ?auto_197661 - MODE
      ?auto_197665 - DIRECTION
      ?auto_197666 - MODE
      ?auto_197667 - DIRECTION
      ?auto_197668 - MODE
    )
    :vars
    (
      ?auto_197671 - INSTRUMENT
      ?auto_197669 - SATELLITE
      ?auto_197670 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_197671 ) ( ON_BOARD ?auto_197671 ?auto_197669 ) ( SUPPORTS ?auto_197671 ?auto_197668 ) ( POWER_ON ?auto_197671 ) ( POINTING ?auto_197669 ?auto_197670 ) ( not ( = ?auto_197667 ?auto_197670 ) ) ( HAVE_IMAGE ?auto_197664 ?auto_197666 ) ( not ( = ?auto_197664 ?auto_197667 ) ) ( not ( = ?auto_197664 ?auto_197670 ) ) ( not ( = ?auto_197666 ?auto_197668 ) ) ( HAVE_IMAGE ?auto_197662 ?auto_197663 ) ( HAVE_IMAGE ?auto_197664 ?auto_197661 ) ( HAVE_IMAGE ?auto_197665 ?auto_197666 ) ( not ( = ?auto_197662 ?auto_197664 ) ) ( not ( = ?auto_197662 ?auto_197665 ) ) ( not ( = ?auto_197662 ?auto_197667 ) ) ( not ( = ?auto_197662 ?auto_197670 ) ) ( not ( = ?auto_197663 ?auto_197661 ) ) ( not ( = ?auto_197663 ?auto_197666 ) ) ( not ( = ?auto_197663 ?auto_197668 ) ) ( not ( = ?auto_197664 ?auto_197665 ) ) ( not ( = ?auto_197661 ?auto_197666 ) ) ( not ( = ?auto_197661 ?auto_197668 ) ) ( not ( = ?auto_197665 ?auto_197667 ) ) ( not ( = ?auto_197665 ?auto_197670 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_197664 ?auto_197666 ?auto_197667 ?auto_197668 )
      ( GET-4IMAGE-VERIFY ?auto_197662 ?auto_197663 ?auto_197664 ?auto_197661 ?auto_197665 ?auto_197666 ?auto_197667 ?auto_197668 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_197673 - DIRECTION
      ?auto_197674 - MODE
      ?auto_197675 - DIRECTION
      ?auto_197672 - MODE
      ?auto_197676 - DIRECTION
      ?auto_197677 - MODE
      ?auto_197678 - DIRECTION
      ?auto_197679 - MODE
    )
    :vars
    (
      ?auto_197682 - INSTRUMENT
      ?auto_197680 - SATELLITE
      ?auto_197681 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_197682 ) ( ON_BOARD ?auto_197682 ?auto_197680 ) ( SUPPORTS ?auto_197682 ?auto_197679 ) ( POWER_ON ?auto_197682 ) ( POINTING ?auto_197680 ?auto_197681 ) ( not ( = ?auto_197678 ?auto_197681 ) ) ( HAVE_IMAGE ?auto_197675 ?auto_197672 ) ( not ( = ?auto_197675 ?auto_197678 ) ) ( not ( = ?auto_197675 ?auto_197681 ) ) ( not ( = ?auto_197672 ?auto_197679 ) ) ( HAVE_IMAGE ?auto_197673 ?auto_197674 ) ( HAVE_IMAGE ?auto_197676 ?auto_197677 ) ( not ( = ?auto_197673 ?auto_197675 ) ) ( not ( = ?auto_197673 ?auto_197676 ) ) ( not ( = ?auto_197673 ?auto_197678 ) ) ( not ( = ?auto_197673 ?auto_197681 ) ) ( not ( = ?auto_197674 ?auto_197672 ) ) ( not ( = ?auto_197674 ?auto_197677 ) ) ( not ( = ?auto_197674 ?auto_197679 ) ) ( not ( = ?auto_197675 ?auto_197676 ) ) ( not ( = ?auto_197672 ?auto_197677 ) ) ( not ( = ?auto_197676 ?auto_197678 ) ) ( not ( = ?auto_197676 ?auto_197681 ) ) ( not ( = ?auto_197677 ?auto_197679 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_197675 ?auto_197672 ?auto_197678 ?auto_197679 )
      ( GET-4IMAGE-VERIFY ?auto_197673 ?auto_197674 ?auto_197675 ?auto_197672 ?auto_197676 ?auto_197677 ?auto_197678 ?auto_197679 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_197684 - DIRECTION
      ?auto_197685 - MODE
      ?auto_197686 - DIRECTION
      ?auto_197683 - MODE
      ?auto_197687 - DIRECTION
      ?auto_197688 - MODE
      ?auto_197689 - DIRECTION
      ?auto_197690 - MODE
    )
    :vars
    (
      ?auto_197693 - INSTRUMENT
      ?auto_197691 - SATELLITE
      ?auto_197692 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_197693 ) ( ON_BOARD ?auto_197693 ?auto_197691 ) ( SUPPORTS ?auto_197693 ?auto_197688 ) ( POWER_ON ?auto_197693 ) ( POINTING ?auto_197691 ?auto_197692 ) ( not ( = ?auto_197687 ?auto_197692 ) ) ( HAVE_IMAGE ?auto_197686 ?auto_197685 ) ( not ( = ?auto_197686 ?auto_197687 ) ) ( not ( = ?auto_197686 ?auto_197692 ) ) ( not ( = ?auto_197685 ?auto_197688 ) ) ( HAVE_IMAGE ?auto_197684 ?auto_197685 ) ( HAVE_IMAGE ?auto_197686 ?auto_197683 ) ( HAVE_IMAGE ?auto_197689 ?auto_197690 ) ( not ( = ?auto_197684 ?auto_197686 ) ) ( not ( = ?auto_197684 ?auto_197687 ) ) ( not ( = ?auto_197684 ?auto_197689 ) ) ( not ( = ?auto_197684 ?auto_197692 ) ) ( not ( = ?auto_197685 ?auto_197683 ) ) ( not ( = ?auto_197685 ?auto_197690 ) ) ( not ( = ?auto_197686 ?auto_197689 ) ) ( not ( = ?auto_197683 ?auto_197688 ) ) ( not ( = ?auto_197683 ?auto_197690 ) ) ( not ( = ?auto_197687 ?auto_197689 ) ) ( not ( = ?auto_197688 ?auto_197690 ) ) ( not ( = ?auto_197689 ?auto_197692 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_197686 ?auto_197685 ?auto_197687 ?auto_197688 )
      ( GET-4IMAGE-VERIFY ?auto_197684 ?auto_197685 ?auto_197686 ?auto_197683 ?auto_197687 ?auto_197688 ?auto_197689 ?auto_197690 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_197717 - DIRECTION
      ?auto_197718 - MODE
      ?auto_197719 - DIRECTION
      ?auto_197716 - MODE
      ?auto_197720 - DIRECTION
      ?auto_197721 - MODE
      ?auto_197722 - DIRECTION
      ?auto_197723 - MODE
    )
    :vars
    (
      ?auto_197726 - INSTRUMENT
      ?auto_197724 - SATELLITE
      ?auto_197725 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_197726 ) ( ON_BOARD ?auto_197726 ?auto_197724 ) ( SUPPORTS ?auto_197726 ?auto_197723 ) ( POWER_ON ?auto_197726 ) ( POINTING ?auto_197724 ?auto_197725 ) ( not ( = ?auto_197722 ?auto_197725 ) ) ( HAVE_IMAGE ?auto_197717 ?auto_197721 ) ( not ( = ?auto_197717 ?auto_197722 ) ) ( not ( = ?auto_197717 ?auto_197725 ) ) ( not ( = ?auto_197721 ?auto_197723 ) ) ( HAVE_IMAGE ?auto_197717 ?auto_197718 ) ( HAVE_IMAGE ?auto_197719 ?auto_197716 ) ( HAVE_IMAGE ?auto_197720 ?auto_197721 ) ( not ( = ?auto_197717 ?auto_197719 ) ) ( not ( = ?auto_197717 ?auto_197720 ) ) ( not ( = ?auto_197718 ?auto_197716 ) ) ( not ( = ?auto_197718 ?auto_197721 ) ) ( not ( = ?auto_197718 ?auto_197723 ) ) ( not ( = ?auto_197719 ?auto_197720 ) ) ( not ( = ?auto_197719 ?auto_197722 ) ) ( not ( = ?auto_197719 ?auto_197725 ) ) ( not ( = ?auto_197716 ?auto_197721 ) ) ( not ( = ?auto_197716 ?auto_197723 ) ) ( not ( = ?auto_197720 ?auto_197722 ) ) ( not ( = ?auto_197720 ?auto_197725 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_197717 ?auto_197721 ?auto_197722 ?auto_197723 )
      ( GET-4IMAGE-VERIFY ?auto_197717 ?auto_197718 ?auto_197719 ?auto_197716 ?auto_197720 ?auto_197721 ?auto_197722 ?auto_197723 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_197739 - DIRECTION
      ?auto_197740 - MODE
      ?auto_197741 - DIRECTION
      ?auto_197738 - MODE
      ?auto_197742 - DIRECTION
      ?auto_197743 - MODE
      ?auto_197744 - DIRECTION
      ?auto_197745 - MODE
    )
    :vars
    (
      ?auto_197748 - INSTRUMENT
      ?auto_197746 - SATELLITE
      ?auto_197747 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_197748 ) ( ON_BOARD ?auto_197748 ?auto_197746 ) ( SUPPORTS ?auto_197748 ?auto_197743 ) ( POWER_ON ?auto_197748 ) ( POINTING ?auto_197746 ?auto_197747 ) ( not ( = ?auto_197742 ?auto_197747 ) ) ( HAVE_IMAGE ?auto_197739 ?auto_197745 ) ( not ( = ?auto_197739 ?auto_197742 ) ) ( not ( = ?auto_197739 ?auto_197747 ) ) ( not ( = ?auto_197745 ?auto_197743 ) ) ( HAVE_IMAGE ?auto_197739 ?auto_197740 ) ( HAVE_IMAGE ?auto_197741 ?auto_197738 ) ( HAVE_IMAGE ?auto_197744 ?auto_197745 ) ( not ( = ?auto_197739 ?auto_197741 ) ) ( not ( = ?auto_197739 ?auto_197744 ) ) ( not ( = ?auto_197740 ?auto_197738 ) ) ( not ( = ?auto_197740 ?auto_197743 ) ) ( not ( = ?auto_197740 ?auto_197745 ) ) ( not ( = ?auto_197741 ?auto_197742 ) ) ( not ( = ?auto_197741 ?auto_197744 ) ) ( not ( = ?auto_197741 ?auto_197747 ) ) ( not ( = ?auto_197738 ?auto_197743 ) ) ( not ( = ?auto_197738 ?auto_197745 ) ) ( not ( = ?auto_197742 ?auto_197744 ) ) ( not ( = ?auto_197744 ?auto_197747 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_197739 ?auto_197745 ?auto_197742 ?auto_197743 )
      ( GET-4IMAGE-VERIFY ?auto_197739 ?auto_197740 ?auto_197741 ?auto_197738 ?auto_197742 ?auto_197743 ?auto_197744 ?auto_197745 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_197750 - DIRECTION
      ?auto_197751 - MODE
      ?auto_197752 - DIRECTION
      ?auto_197749 - MODE
      ?auto_197753 - DIRECTION
      ?auto_197754 - MODE
      ?auto_197755 - DIRECTION
      ?auto_197756 - MODE
    )
    :vars
    (
      ?auto_197759 - INSTRUMENT
      ?auto_197757 - SATELLITE
      ?auto_197758 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_197759 ) ( ON_BOARD ?auto_197759 ?auto_197757 ) ( SUPPORTS ?auto_197759 ?auto_197754 ) ( POWER_ON ?auto_197759 ) ( POINTING ?auto_197757 ?auto_197758 ) ( not ( = ?auto_197753 ?auto_197758 ) ) ( HAVE_IMAGE ?auto_197750 ?auto_197751 ) ( not ( = ?auto_197750 ?auto_197753 ) ) ( not ( = ?auto_197750 ?auto_197758 ) ) ( not ( = ?auto_197751 ?auto_197754 ) ) ( HAVE_IMAGE ?auto_197752 ?auto_197749 ) ( HAVE_IMAGE ?auto_197755 ?auto_197756 ) ( not ( = ?auto_197750 ?auto_197752 ) ) ( not ( = ?auto_197750 ?auto_197755 ) ) ( not ( = ?auto_197751 ?auto_197749 ) ) ( not ( = ?auto_197751 ?auto_197756 ) ) ( not ( = ?auto_197752 ?auto_197753 ) ) ( not ( = ?auto_197752 ?auto_197755 ) ) ( not ( = ?auto_197752 ?auto_197758 ) ) ( not ( = ?auto_197749 ?auto_197754 ) ) ( not ( = ?auto_197749 ?auto_197756 ) ) ( not ( = ?auto_197753 ?auto_197755 ) ) ( not ( = ?auto_197754 ?auto_197756 ) ) ( not ( = ?auto_197755 ?auto_197758 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_197750 ?auto_197751 ?auto_197753 ?auto_197754 )
      ( GET-4IMAGE-VERIFY ?auto_197750 ?auto_197751 ?auto_197752 ?auto_197749 ?auto_197753 ?auto_197754 ?auto_197755 ?auto_197756 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_197772 - DIRECTION
      ?auto_197773 - MODE
      ?auto_197774 - DIRECTION
      ?auto_197771 - MODE
      ?auto_197775 - DIRECTION
      ?auto_197776 - MODE
      ?auto_197777 - DIRECTION
      ?auto_197778 - MODE
    )
    :vars
    (
      ?auto_197781 - INSTRUMENT
      ?auto_197779 - SATELLITE
      ?auto_197780 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_197781 ) ( ON_BOARD ?auto_197781 ?auto_197779 ) ( SUPPORTS ?auto_197781 ?auto_197771 ) ( POWER_ON ?auto_197781 ) ( POINTING ?auto_197779 ?auto_197780 ) ( not ( = ?auto_197774 ?auto_197780 ) ) ( HAVE_IMAGE ?auto_197772 ?auto_197776 ) ( not ( = ?auto_197772 ?auto_197774 ) ) ( not ( = ?auto_197772 ?auto_197780 ) ) ( not ( = ?auto_197776 ?auto_197771 ) ) ( HAVE_IMAGE ?auto_197772 ?auto_197773 ) ( HAVE_IMAGE ?auto_197775 ?auto_197776 ) ( HAVE_IMAGE ?auto_197777 ?auto_197778 ) ( not ( = ?auto_197772 ?auto_197775 ) ) ( not ( = ?auto_197772 ?auto_197777 ) ) ( not ( = ?auto_197773 ?auto_197771 ) ) ( not ( = ?auto_197773 ?auto_197776 ) ) ( not ( = ?auto_197773 ?auto_197778 ) ) ( not ( = ?auto_197774 ?auto_197775 ) ) ( not ( = ?auto_197774 ?auto_197777 ) ) ( not ( = ?auto_197771 ?auto_197778 ) ) ( not ( = ?auto_197775 ?auto_197777 ) ) ( not ( = ?auto_197775 ?auto_197780 ) ) ( not ( = ?auto_197776 ?auto_197778 ) ) ( not ( = ?auto_197777 ?auto_197780 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_197772 ?auto_197776 ?auto_197774 ?auto_197771 )
      ( GET-4IMAGE-VERIFY ?auto_197772 ?auto_197773 ?auto_197774 ?auto_197771 ?auto_197775 ?auto_197776 ?auto_197777 ?auto_197778 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_197783 - DIRECTION
      ?auto_197784 - MODE
      ?auto_197785 - DIRECTION
      ?auto_197782 - MODE
      ?auto_197786 - DIRECTION
      ?auto_197787 - MODE
      ?auto_197788 - DIRECTION
      ?auto_197789 - MODE
    )
    :vars
    (
      ?auto_197792 - INSTRUMENT
      ?auto_197790 - SATELLITE
      ?auto_197791 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_197792 ) ( ON_BOARD ?auto_197792 ?auto_197790 ) ( SUPPORTS ?auto_197792 ?auto_197782 ) ( POWER_ON ?auto_197792 ) ( POINTING ?auto_197790 ?auto_197791 ) ( not ( = ?auto_197785 ?auto_197791 ) ) ( HAVE_IMAGE ?auto_197786 ?auto_197787 ) ( not ( = ?auto_197786 ?auto_197785 ) ) ( not ( = ?auto_197786 ?auto_197791 ) ) ( not ( = ?auto_197787 ?auto_197782 ) ) ( HAVE_IMAGE ?auto_197783 ?auto_197784 ) ( HAVE_IMAGE ?auto_197788 ?auto_197789 ) ( not ( = ?auto_197783 ?auto_197785 ) ) ( not ( = ?auto_197783 ?auto_197786 ) ) ( not ( = ?auto_197783 ?auto_197788 ) ) ( not ( = ?auto_197783 ?auto_197791 ) ) ( not ( = ?auto_197784 ?auto_197782 ) ) ( not ( = ?auto_197784 ?auto_197787 ) ) ( not ( = ?auto_197784 ?auto_197789 ) ) ( not ( = ?auto_197785 ?auto_197788 ) ) ( not ( = ?auto_197782 ?auto_197789 ) ) ( not ( = ?auto_197786 ?auto_197788 ) ) ( not ( = ?auto_197787 ?auto_197789 ) ) ( not ( = ?auto_197788 ?auto_197791 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_197786 ?auto_197787 ?auto_197785 ?auto_197782 )
      ( GET-4IMAGE-VERIFY ?auto_197783 ?auto_197784 ?auto_197785 ?auto_197782 ?auto_197786 ?auto_197787 ?auto_197788 ?auto_197789 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_197805 - DIRECTION
      ?auto_197806 - MODE
      ?auto_197807 - DIRECTION
      ?auto_197804 - MODE
      ?auto_197808 - DIRECTION
      ?auto_197809 - MODE
      ?auto_197810 - DIRECTION
      ?auto_197811 - MODE
    )
    :vars
    (
      ?auto_197814 - INSTRUMENT
      ?auto_197812 - SATELLITE
      ?auto_197813 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_197814 ) ( ON_BOARD ?auto_197814 ?auto_197812 ) ( SUPPORTS ?auto_197814 ?auto_197804 ) ( POWER_ON ?auto_197814 ) ( POINTING ?auto_197812 ?auto_197813 ) ( not ( = ?auto_197807 ?auto_197813 ) ) ( HAVE_IMAGE ?auto_197805 ?auto_197811 ) ( not ( = ?auto_197805 ?auto_197807 ) ) ( not ( = ?auto_197805 ?auto_197813 ) ) ( not ( = ?auto_197811 ?auto_197804 ) ) ( HAVE_IMAGE ?auto_197805 ?auto_197806 ) ( HAVE_IMAGE ?auto_197808 ?auto_197809 ) ( HAVE_IMAGE ?auto_197810 ?auto_197811 ) ( not ( = ?auto_197805 ?auto_197808 ) ) ( not ( = ?auto_197805 ?auto_197810 ) ) ( not ( = ?auto_197806 ?auto_197804 ) ) ( not ( = ?auto_197806 ?auto_197809 ) ) ( not ( = ?auto_197806 ?auto_197811 ) ) ( not ( = ?auto_197807 ?auto_197808 ) ) ( not ( = ?auto_197807 ?auto_197810 ) ) ( not ( = ?auto_197804 ?auto_197809 ) ) ( not ( = ?auto_197808 ?auto_197810 ) ) ( not ( = ?auto_197808 ?auto_197813 ) ) ( not ( = ?auto_197809 ?auto_197811 ) ) ( not ( = ?auto_197810 ?auto_197813 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_197805 ?auto_197811 ?auto_197807 ?auto_197804 )
      ( GET-4IMAGE-VERIFY ?auto_197805 ?auto_197806 ?auto_197807 ?auto_197804 ?auto_197808 ?auto_197809 ?auto_197810 ?auto_197811 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_197871 - DIRECTION
      ?auto_197872 - MODE
      ?auto_197873 - DIRECTION
      ?auto_197870 - MODE
      ?auto_197874 - DIRECTION
      ?auto_197875 - MODE
      ?auto_197876 - DIRECTION
      ?auto_197877 - MODE
    )
    :vars
    (
      ?auto_197880 - INSTRUMENT
      ?auto_197878 - SATELLITE
      ?auto_197879 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_197880 ) ( ON_BOARD ?auto_197880 ?auto_197878 ) ( SUPPORTS ?auto_197880 ?auto_197877 ) ( POWER_ON ?auto_197880 ) ( POINTING ?auto_197878 ?auto_197879 ) ( not ( = ?auto_197876 ?auto_197879 ) ) ( HAVE_IMAGE ?auto_197874 ?auto_197870 ) ( not ( = ?auto_197874 ?auto_197876 ) ) ( not ( = ?auto_197874 ?auto_197879 ) ) ( not ( = ?auto_197870 ?auto_197877 ) ) ( HAVE_IMAGE ?auto_197871 ?auto_197872 ) ( HAVE_IMAGE ?auto_197873 ?auto_197870 ) ( HAVE_IMAGE ?auto_197874 ?auto_197875 ) ( not ( = ?auto_197871 ?auto_197873 ) ) ( not ( = ?auto_197871 ?auto_197874 ) ) ( not ( = ?auto_197871 ?auto_197876 ) ) ( not ( = ?auto_197871 ?auto_197879 ) ) ( not ( = ?auto_197872 ?auto_197870 ) ) ( not ( = ?auto_197872 ?auto_197875 ) ) ( not ( = ?auto_197872 ?auto_197877 ) ) ( not ( = ?auto_197873 ?auto_197874 ) ) ( not ( = ?auto_197873 ?auto_197876 ) ) ( not ( = ?auto_197873 ?auto_197879 ) ) ( not ( = ?auto_197870 ?auto_197875 ) ) ( not ( = ?auto_197875 ?auto_197877 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_197874 ?auto_197870 ?auto_197876 ?auto_197877 )
      ( GET-4IMAGE-VERIFY ?auto_197871 ?auto_197872 ?auto_197873 ?auto_197870 ?auto_197874 ?auto_197875 ?auto_197876 ?auto_197877 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_197926 - DIRECTION
      ?auto_197927 - MODE
      ?auto_197928 - DIRECTION
      ?auto_197925 - MODE
      ?auto_197929 - DIRECTION
      ?auto_197930 - MODE
      ?auto_197931 - DIRECTION
      ?auto_197932 - MODE
    )
    :vars
    (
      ?auto_197935 - INSTRUMENT
      ?auto_197933 - SATELLITE
      ?auto_197934 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_197935 ) ( ON_BOARD ?auto_197935 ?auto_197933 ) ( SUPPORTS ?auto_197935 ?auto_197932 ) ( POWER_ON ?auto_197935 ) ( POINTING ?auto_197933 ?auto_197934 ) ( not ( = ?auto_197931 ?auto_197934 ) ) ( HAVE_IMAGE ?auto_197929 ?auto_197930 ) ( not ( = ?auto_197929 ?auto_197931 ) ) ( not ( = ?auto_197929 ?auto_197934 ) ) ( not ( = ?auto_197930 ?auto_197932 ) ) ( HAVE_IMAGE ?auto_197926 ?auto_197927 ) ( HAVE_IMAGE ?auto_197928 ?auto_197925 ) ( not ( = ?auto_197926 ?auto_197928 ) ) ( not ( = ?auto_197926 ?auto_197929 ) ) ( not ( = ?auto_197926 ?auto_197931 ) ) ( not ( = ?auto_197926 ?auto_197934 ) ) ( not ( = ?auto_197927 ?auto_197925 ) ) ( not ( = ?auto_197927 ?auto_197930 ) ) ( not ( = ?auto_197927 ?auto_197932 ) ) ( not ( = ?auto_197928 ?auto_197929 ) ) ( not ( = ?auto_197928 ?auto_197931 ) ) ( not ( = ?auto_197928 ?auto_197934 ) ) ( not ( = ?auto_197925 ?auto_197930 ) ) ( not ( = ?auto_197925 ?auto_197932 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_197929 ?auto_197930 ?auto_197931 ?auto_197932 )
      ( GET-4IMAGE-VERIFY ?auto_197926 ?auto_197927 ?auto_197928 ?auto_197925 ?auto_197929 ?auto_197930 ?auto_197931 ?auto_197932 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_197937 - DIRECTION
      ?auto_197938 - MODE
      ?auto_197939 - DIRECTION
      ?auto_197936 - MODE
      ?auto_197940 - DIRECTION
      ?auto_197941 - MODE
      ?auto_197942 - DIRECTION
      ?auto_197943 - MODE
    )
    :vars
    (
      ?auto_197948 - INSTRUMENT
      ?auto_197944 - SATELLITE
      ?auto_197945 - DIRECTION
      ?auto_197947 - DIRECTION
      ?auto_197946 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_197948 ) ( ON_BOARD ?auto_197948 ?auto_197944 ) ( SUPPORTS ?auto_197948 ?auto_197943 ) ( POWER_ON ?auto_197948 ) ( POINTING ?auto_197944 ?auto_197945 ) ( not ( = ?auto_197942 ?auto_197945 ) ) ( HAVE_IMAGE ?auto_197947 ?auto_197946 ) ( not ( = ?auto_197947 ?auto_197942 ) ) ( not ( = ?auto_197947 ?auto_197945 ) ) ( not ( = ?auto_197946 ?auto_197943 ) ) ( HAVE_IMAGE ?auto_197937 ?auto_197938 ) ( HAVE_IMAGE ?auto_197939 ?auto_197936 ) ( HAVE_IMAGE ?auto_197940 ?auto_197941 ) ( not ( = ?auto_197937 ?auto_197939 ) ) ( not ( = ?auto_197937 ?auto_197940 ) ) ( not ( = ?auto_197937 ?auto_197942 ) ) ( not ( = ?auto_197937 ?auto_197945 ) ) ( not ( = ?auto_197937 ?auto_197947 ) ) ( not ( = ?auto_197938 ?auto_197936 ) ) ( not ( = ?auto_197938 ?auto_197941 ) ) ( not ( = ?auto_197938 ?auto_197943 ) ) ( not ( = ?auto_197938 ?auto_197946 ) ) ( not ( = ?auto_197939 ?auto_197940 ) ) ( not ( = ?auto_197939 ?auto_197942 ) ) ( not ( = ?auto_197939 ?auto_197945 ) ) ( not ( = ?auto_197939 ?auto_197947 ) ) ( not ( = ?auto_197936 ?auto_197941 ) ) ( not ( = ?auto_197936 ?auto_197943 ) ) ( not ( = ?auto_197936 ?auto_197946 ) ) ( not ( = ?auto_197940 ?auto_197942 ) ) ( not ( = ?auto_197940 ?auto_197945 ) ) ( not ( = ?auto_197940 ?auto_197947 ) ) ( not ( = ?auto_197941 ?auto_197943 ) ) ( not ( = ?auto_197941 ?auto_197946 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_197947 ?auto_197946 ?auto_197942 ?auto_197943 )
      ( GET-4IMAGE-VERIFY ?auto_197937 ?auto_197938 ?auto_197939 ?auto_197936 ?auto_197940 ?auto_197941 ?auto_197942 ?auto_197943 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_197950 - DIRECTION
      ?auto_197951 - MODE
      ?auto_197952 - DIRECTION
      ?auto_197949 - MODE
      ?auto_197953 - DIRECTION
      ?auto_197954 - MODE
      ?auto_197955 - DIRECTION
      ?auto_197956 - MODE
    )
    :vars
    (
      ?auto_197959 - INSTRUMENT
      ?auto_197957 - SATELLITE
      ?auto_197958 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_197959 ) ( ON_BOARD ?auto_197959 ?auto_197957 ) ( SUPPORTS ?auto_197959 ?auto_197954 ) ( POWER_ON ?auto_197959 ) ( POINTING ?auto_197957 ?auto_197958 ) ( not ( = ?auto_197953 ?auto_197958 ) ) ( HAVE_IMAGE ?auto_197955 ?auto_197956 ) ( not ( = ?auto_197955 ?auto_197953 ) ) ( not ( = ?auto_197955 ?auto_197958 ) ) ( not ( = ?auto_197956 ?auto_197954 ) ) ( HAVE_IMAGE ?auto_197950 ?auto_197951 ) ( HAVE_IMAGE ?auto_197952 ?auto_197949 ) ( not ( = ?auto_197950 ?auto_197952 ) ) ( not ( = ?auto_197950 ?auto_197953 ) ) ( not ( = ?auto_197950 ?auto_197955 ) ) ( not ( = ?auto_197950 ?auto_197958 ) ) ( not ( = ?auto_197951 ?auto_197949 ) ) ( not ( = ?auto_197951 ?auto_197954 ) ) ( not ( = ?auto_197951 ?auto_197956 ) ) ( not ( = ?auto_197952 ?auto_197953 ) ) ( not ( = ?auto_197952 ?auto_197955 ) ) ( not ( = ?auto_197952 ?auto_197958 ) ) ( not ( = ?auto_197949 ?auto_197954 ) ) ( not ( = ?auto_197949 ?auto_197956 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_197955 ?auto_197956 ?auto_197953 ?auto_197954 )
      ( GET-4IMAGE-VERIFY ?auto_197950 ?auto_197951 ?auto_197952 ?auto_197949 ?auto_197953 ?auto_197954 ?auto_197955 ?auto_197956 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_197961 - DIRECTION
      ?auto_197962 - MODE
      ?auto_197963 - DIRECTION
      ?auto_197960 - MODE
      ?auto_197964 - DIRECTION
      ?auto_197965 - MODE
      ?auto_197966 - DIRECTION
      ?auto_197967 - MODE
    )
    :vars
    (
      ?auto_197972 - INSTRUMENT
      ?auto_197968 - SATELLITE
      ?auto_197969 - DIRECTION
      ?auto_197971 - DIRECTION
      ?auto_197970 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_197972 ) ( ON_BOARD ?auto_197972 ?auto_197968 ) ( SUPPORTS ?auto_197972 ?auto_197965 ) ( POWER_ON ?auto_197972 ) ( POINTING ?auto_197968 ?auto_197969 ) ( not ( = ?auto_197964 ?auto_197969 ) ) ( HAVE_IMAGE ?auto_197971 ?auto_197970 ) ( not ( = ?auto_197971 ?auto_197964 ) ) ( not ( = ?auto_197971 ?auto_197969 ) ) ( not ( = ?auto_197970 ?auto_197965 ) ) ( HAVE_IMAGE ?auto_197961 ?auto_197962 ) ( HAVE_IMAGE ?auto_197963 ?auto_197960 ) ( HAVE_IMAGE ?auto_197966 ?auto_197967 ) ( not ( = ?auto_197961 ?auto_197963 ) ) ( not ( = ?auto_197961 ?auto_197964 ) ) ( not ( = ?auto_197961 ?auto_197966 ) ) ( not ( = ?auto_197961 ?auto_197969 ) ) ( not ( = ?auto_197961 ?auto_197971 ) ) ( not ( = ?auto_197962 ?auto_197960 ) ) ( not ( = ?auto_197962 ?auto_197965 ) ) ( not ( = ?auto_197962 ?auto_197967 ) ) ( not ( = ?auto_197962 ?auto_197970 ) ) ( not ( = ?auto_197963 ?auto_197964 ) ) ( not ( = ?auto_197963 ?auto_197966 ) ) ( not ( = ?auto_197963 ?auto_197969 ) ) ( not ( = ?auto_197963 ?auto_197971 ) ) ( not ( = ?auto_197960 ?auto_197965 ) ) ( not ( = ?auto_197960 ?auto_197967 ) ) ( not ( = ?auto_197960 ?auto_197970 ) ) ( not ( = ?auto_197964 ?auto_197966 ) ) ( not ( = ?auto_197965 ?auto_197967 ) ) ( not ( = ?auto_197966 ?auto_197969 ) ) ( not ( = ?auto_197966 ?auto_197971 ) ) ( not ( = ?auto_197967 ?auto_197970 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_197971 ?auto_197970 ?auto_197964 ?auto_197965 )
      ( GET-4IMAGE-VERIFY ?auto_197961 ?auto_197962 ?auto_197963 ?auto_197960 ?auto_197964 ?auto_197965 ?auto_197966 ?auto_197967 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_198020 - DIRECTION
      ?auto_198021 - MODE
      ?auto_198022 - DIRECTION
      ?auto_198019 - MODE
      ?auto_198023 - DIRECTION
      ?auto_198024 - MODE
      ?auto_198025 - DIRECTION
      ?auto_198026 - MODE
    )
    :vars
    (
      ?auto_198029 - INSTRUMENT
      ?auto_198027 - SATELLITE
      ?auto_198028 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_198029 ) ( ON_BOARD ?auto_198029 ?auto_198027 ) ( SUPPORTS ?auto_198029 ?auto_198019 ) ( POWER_ON ?auto_198029 ) ( POINTING ?auto_198027 ?auto_198028 ) ( not ( = ?auto_198022 ?auto_198028 ) ) ( HAVE_IMAGE ?auto_198025 ?auto_198026 ) ( not ( = ?auto_198025 ?auto_198022 ) ) ( not ( = ?auto_198025 ?auto_198028 ) ) ( not ( = ?auto_198026 ?auto_198019 ) ) ( HAVE_IMAGE ?auto_198020 ?auto_198021 ) ( HAVE_IMAGE ?auto_198023 ?auto_198024 ) ( not ( = ?auto_198020 ?auto_198022 ) ) ( not ( = ?auto_198020 ?auto_198023 ) ) ( not ( = ?auto_198020 ?auto_198025 ) ) ( not ( = ?auto_198020 ?auto_198028 ) ) ( not ( = ?auto_198021 ?auto_198019 ) ) ( not ( = ?auto_198021 ?auto_198024 ) ) ( not ( = ?auto_198021 ?auto_198026 ) ) ( not ( = ?auto_198022 ?auto_198023 ) ) ( not ( = ?auto_198019 ?auto_198024 ) ) ( not ( = ?auto_198023 ?auto_198025 ) ) ( not ( = ?auto_198023 ?auto_198028 ) ) ( not ( = ?auto_198024 ?auto_198026 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198025 ?auto_198026 ?auto_198022 ?auto_198019 )
      ( GET-4IMAGE-VERIFY ?auto_198020 ?auto_198021 ?auto_198022 ?auto_198019 ?auto_198023 ?auto_198024 ?auto_198025 ?auto_198026 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_198031 - DIRECTION
      ?auto_198032 - MODE
      ?auto_198033 - DIRECTION
      ?auto_198030 - MODE
      ?auto_198034 - DIRECTION
      ?auto_198035 - MODE
      ?auto_198036 - DIRECTION
      ?auto_198037 - MODE
    )
    :vars
    (
      ?auto_198042 - INSTRUMENT
      ?auto_198038 - SATELLITE
      ?auto_198039 - DIRECTION
      ?auto_198041 - DIRECTION
      ?auto_198040 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_198042 ) ( ON_BOARD ?auto_198042 ?auto_198038 ) ( SUPPORTS ?auto_198042 ?auto_198030 ) ( POWER_ON ?auto_198042 ) ( POINTING ?auto_198038 ?auto_198039 ) ( not ( = ?auto_198033 ?auto_198039 ) ) ( HAVE_IMAGE ?auto_198041 ?auto_198040 ) ( not ( = ?auto_198041 ?auto_198033 ) ) ( not ( = ?auto_198041 ?auto_198039 ) ) ( not ( = ?auto_198040 ?auto_198030 ) ) ( HAVE_IMAGE ?auto_198031 ?auto_198032 ) ( HAVE_IMAGE ?auto_198034 ?auto_198035 ) ( HAVE_IMAGE ?auto_198036 ?auto_198037 ) ( not ( = ?auto_198031 ?auto_198033 ) ) ( not ( = ?auto_198031 ?auto_198034 ) ) ( not ( = ?auto_198031 ?auto_198036 ) ) ( not ( = ?auto_198031 ?auto_198039 ) ) ( not ( = ?auto_198031 ?auto_198041 ) ) ( not ( = ?auto_198032 ?auto_198030 ) ) ( not ( = ?auto_198032 ?auto_198035 ) ) ( not ( = ?auto_198032 ?auto_198037 ) ) ( not ( = ?auto_198032 ?auto_198040 ) ) ( not ( = ?auto_198033 ?auto_198034 ) ) ( not ( = ?auto_198033 ?auto_198036 ) ) ( not ( = ?auto_198030 ?auto_198035 ) ) ( not ( = ?auto_198030 ?auto_198037 ) ) ( not ( = ?auto_198034 ?auto_198036 ) ) ( not ( = ?auto_198034 ?auto_198039 ) ) ( not ( = ?auto_198034 ?auto_198041 ) ) ( not ( = ?auto_198035 ?auto_198037 ) ) ( not ( = ?auto_198035 ?auto_198040 ) ) ( not ( = ?auto_198036 ?auto_198039 ) ) ( not ( = ?auto_198036 ?auto_198041 ) ) ( not ( = ?auto_198037 ?auto_198040 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198041 ?auto_198040 ?auto_198033 ?auto_198030 )
      ( GET-4IMAGE-VERIFY ?auto_198031 ?auto_198032 ?auto_198033 ?auto_198030 ?auto_198034 ?auto_198035 ?auto_198036 ?auto_198037 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_198094 - DIRECTION
      ?auto_198095 - MODE
      ?auto_198096 - DIRECTION
      ?auto_198093 - MODE
      ?auto_198097 - DIRECTION
      ?auto_198098 - MODE
      ?auto_198099 - DIRECTION
      ?auto_198100 - MODE
    )
    :vars
    (
      ?auto_198103 - INSTRUMENT
      ?auto_198101 - SATELLITE
      ?auto_198102 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_198103 ) ( ON_BOARD ?auto_198103 ?auto_198101 ) ( SUPPORTS ?auto_198103 ?auto_198095 ) ( POWER_ON ?auto_198103 ) ( POINTING ?auto_198101 ?auto_198102 ) ( not ( = ?auto_198094 ?auto_198102 ) ) ( HAVE_IMAGE ?auto_198096 ?auto_198100 ) ( not ( = ?auto_198096 ?auto_198094 ) ) ( not ( = ?auto_198096 ?auto_198102 ) ) ( not ( = ?auto_198100 ?auto_198095 ) ) ( HAVE_IMAGE ?auto_198096 ?auto_198093 ) ( HAVE_IMAGE ?auto_198097 ?auto_198098 ) ( HAVE_IMAGE ?auto_198099 ?auto_198100 ) ( not ( = ?auto_198094 ?auto_198097 ) ) ( not ( = ?auto_198094 ?auto_198099 ) ) ( not ( = ?auto_198095 ?auto_198093 ) ) ( not ( = ?auto_198095 ?auto_198098 ) ) ( not ( = ?auto_198096 ?auto_198097 ) ) ( not ( = ?auto_198096 ?auto_198099 ) ) ( not ( = ?auto_198093 ?auto_198098 ) ) ( not ( = ?auto_198093 ?auto_198100 ) ) ( not ( = ?auto_198097 ?auto_198099 ) ) ( not ( = ?auto_198097 ?auto_198102 ) ) ( not ( = ?auto_198098 ?auto_198100 ) ) ( not ( = ?auto_198099 ?auto_198102 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198096 ?auto_198100 ?auto_198094 ?auto_198095 )
      ( GET-4IMAGE-VERIFY ?auto_198094 ?auto_198095 ?auto_198096 ?auto_198093 ?auto_198097 ?auto_198098 ?auto_198099 ?auto_198100 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_198105 - DIRECTION
      ?auto_198106 - MODE
      ?auto_198107 - DIRECTION
      ?auto_198104 - MODE
      ?auto_198108 - DIRECTION
      ?auto_198109 - MODE
      ?auto_198110 - DIRECTION
      ?auto_198111 - MODE
    )
    :vars
    (
      ?auto_198114 - INSTRUMENT
      ?auto_198112 - SATELLITE
      ?auto_198113 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_198114 ) ( ON_BOARD ?auto_198114 ?auto_198112 ) ( SUPPORTS ?auto_198114 ?auto_198106 ) ( POWER_ON ?auto_198114 ) ( POINTING ?auto_198112 ?auto_198113 ) ( not ( = ?auto_198105 ?auto_198113 ) ) ( HAVE_IMAGE ?auto_198108 ?auto_198109 ) ( not ( = ?auto_198108 ?auto_198105 ) ) ( not ( = ?auto_198108 ?auto_198113 ) ) ( not ( = ?auto_198109 ?auto_198106 ) ) ( HAVE_IMAGE ?auto_198107 ?auto_198104 ) ( HAVE_IMAGE ?auto_198110 ?auto_198111 ) ( not ( = ?auto_198105 ?auto_198107 ) ) ( not ( = ?auto_198105 ?auto_198110 ) ) ( not ( = ?auto_198106 ?auto_198104 ) ) ( not ( = ?auto_198106 ?auto_198111 ) ) ( not ( = ?auto_198107 ?auto_198108 ) ) ( not ( = ?auto_198107 ?auto_198110 ) ) ( not ( = ?auto_198107 ?auto_198113 ) ) ( not ( = ?auto_198104 ?auto_198109 ) ) ( not ( = ?auto_198104 ?auto_198111 ) ) ( not ( = ?auto_198108 ?auto_198110 ) ) ( not ( = ?auto_198109 ?auto_198111 ) ) ( not ( = ?auto_198110 ?auto_198113 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198108 ?auto_198109 ?auto_198105 ?auto_198106 )
      ( GET-4IMAGE-VERIFY ?auto_198105 ?auto_198106 ?auto_198107 ?auto_198104 ?auto_198108 ?auto_198109 ?auto_198110 ?auto_198111 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_198127 - DIRECTION
      ?auto_198128 - MODE
      ?auto_198129 - DIRECTION
      ?auto_198126 - MODE
      ?auto_198130 - DIRECTION
      ?auto_198131 - MODE
      ?auto_198132 - DIRECTION
      ?auto_198133 - MODE
    )
    :vars
    (
      ?auto_198136 - INSTRUMENT
      ?auto_198134 - SATELLITE
      ?auto_198135 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_198136 ) ( ON_BOARD ?auto_198136 ?auto_198134 ) ( SUPPORTS ?auto_198136 ?auto_198128 ) ( POWER_ON ?auto_198136 ) ( POINTING ?auto_198134 ?auto_198135 ) ( not ( = ?auto_198127 ?auto_198135 ) ) ( HAVE_IMAGE ?auto_198129 ?auto_198126 ) ( not ( = ?auto_198129 ?auto_198127 ) ) ( not ( = ?auto_198129 ?auto_198135 ) ) ( not ( = ?auto_198126 ?auto_198128 ) ) ( HAVE_IMAGE ?auto_198130 ?auto_198131 ) ( HAVE_IMAGE ?auto_198132 ?auto_198133 ) ( not ( = ?auto_198127 ?auto_198130 ) ) ( not ( = ?auto_198127 ?auto_198132 ) ) ( not ( = ?auto_198128 ?auto_198131 ) ) ( not ( = ?auto_198128 ?auto_198133 ) ) ( not ( = ?auto_198129 ?auto_198130 ) ) ( not ( = ?auto_198129 ?auto_198132 ) ) ( not ( = ?auto_198126 ?auto_198131 ) ) ( not ( = ?auto_198126 ?auto_198133 ) ) ( not ( = ?auto_198130 ?auto_198132 ) ) ( not ( = ?auto_198130 ?auto_198135 ) ) ( not ( = ?auto_198131 ?auto_198133 ) ) ( not ( = ?auto_198132 ?auto_198135 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198129 ?auto_198126 ?auto_198127 ?auto_198128 )
      ( GET-4IMAGE-VERIFY ?auto_198127 ?auto_198128 ?auto_198129 ?auto_198126 ?auto_198130 ?auto_198131 ?auto_198132 ?auto_198133 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_198193 - DIRECTION
      ?auto_198194 - MODE
      ?auto_198195 - DIRECTION
      ?auto_198192 - MODE
      ?auto_198196 - DIRECTION
      ?auto_198197 - MODE
      ?auto_198198 - DIRECTION
      ?auto_198199 - MODE
    )
    :vars
    (
      ?auto_198202 - INSTRUMENT
      ?auto_198200 - SATELLITE
      ?auto_198201 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_198202 ) ( ON_BOARD ?auto_198202 ?auto_198200 ) ( SUPPORTS ?auto_198202 ?auto_198194 ) ( POWER_ON ?auto_198202 ) ( POINTING ?auto_198200 ?auto_198201 ) ( not ( = ?auto_198193 ?auto_198201 ) ) ( HAVE_IMAGE ?auto_198196 ?auto_198199 ) ( not ( = ?auto_198196 ?auto_198193 ) ) ( not ( = ?auto_198196 ?auto_198201 ) ) ( not ( = ?auto_198199 ?auto_198194 ) ) ( HAVE_IMAGE ?auto_198195 ?auto_198192 ) ( HAVE_IMAGE ?auto_198196 ?auto_198197 ) ( HAVE_IMAGE ?auto_198198 ?auto_198199 ) ( not ( = ?auto_198193 ?auto_198195 ) ) ( not ( = ?auto_198193 ?auto_198198 ) ) ( not ( = ?auto_198194 ?auto_198192 ) ) ( not ( = ?auto_198194 ?auto_198197 ) ) ( not ( = ?auto_198195 ?auto_198196 ) ) ( not ( = ?auto_198195 ?auto_198198 ) ) ( not ( = ?auto_198195 ?auto_198201 ) ) ( not ( = ?auto_198192 ?auto_198197 ) ) ( not ( = ?auto_198192 ?auto_198199 ) ) ( not ( = ?auto_198196 ?auto_198198 ) ) ( not ( = ?auto_198197 ?auto_198199 ) ) ( not ( = ?auto_198198 ?auto_198201 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198196 ?auto_198199 ?auto_198193 ?auto_198194 )
      ( GET-4IMAGE-VERIFY ?auto_198193 ?auto_198194 ?auto_198195 ?auto_198192 ?auto_198196 ?auto_198197 ?auto_198198 ?auto_198199 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_198226 - DIRECTION
      ?auto_198227 - MODE
      ?auto_198228 - DIRECTION
      ?auto_198225 - MODE
      ?auto_198229 - DIRECTION
      ?auto_198230 - MODE
      ?auto_198231 - DIRECTION
      ?auto_198232 - MODE
    )
    :vars
    (
      ?auto_198235 - INSTRUMENT
      ?auto_198233 - SATELLITE
      ?auto_198234 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_198235 ) ( ON_BOARD ?auto_198235 ?auto_198233 ) ( SUPPORTS ?auto_198235 ?auto_198227 ) ( POWER_ON ?auto_198235 ) ( POINTING ?auto_198233 ?auto_198234 ) ( not ( = ?auto_198226 ?auto_198234 ) ) ( HAVE_IMAGE ?auto_198231 ?auto_198232 ) ( not ( = ?auto_198231 ?auto_198226 ) ) ( not ( = ?auto_198231 ?auto_198234 ) ) ( not ( = ?auto_198232 ?auto_198227 ) ) ( HAVE_IMAGE ?auto_198228 ?auto_198225 ) ( HAVE_IMAGE ?auto_198229 ?auto_198230 ) ( not ( = ?auto_198226 ?auto_198228 ) ) ( not ( = ?auto_198226 ?auto_198229 ) ) ( not ( = ?auto_198227 ?auto_198225 ) ) ( not ( = ?auto_198227 ?auto_198230 ) ) ( not ( = ?auto_198228 ?auto_198229 ) ) ( not ( = ?auto_198228 ?auto_198231 ) ) ( not ( = ?auto_198228 ?auto_198234 ) ) ( not ( = ?auto_198225 ?auto_198230 ) ) ( not ( = ?auto_198225 ?auto_198232 ) ) ( not ( = ?auto_198229 ?auto_198231 ) ) ( not ( = ?auto_198229 ?auto_198234 ) ) ( not ( = ?auto_198230 ?auto_198232 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198231 ?auto_198232 ?auto_198226 ?auto_198227 )
      ( GET-4IMAGE-VERIFY ?auto_198226 ?auto_198227 ?auto_198228 ?auto_198225 ?auto_198229 ?auto_198230 ?auto_198231 ?auto_198232 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_198237 - DIRECTION
      ?auto_198238 - MODE
      ?auto_198239 - DIRECTION
      ?auto_198236 - MODE
      ?auto_198240 - DIRECTION
      ?auto_198241 - MODE
      ?auto_198242 - DIRECTION
      ?auto_198243 - MODE
    )
    :vars
    (
      ?auto_198248 - INSTRUMENT
      ?auto_198244 - SATELLITE
      ?auto_198245 - DIRECTION
      ?auto_198247 - DIRECTION
      ?auto_198246 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_198248 ) ( ON_BOARD ?auto_198248 ?auto_198244 ) ( SUPPORTS ?auto_198248 ?auto_198238 ) ( POWER_ON ?auto_198248 ) ( POINTING ?auto_198244 ?auto_198245 ) ( not ( = ?auto_198237 ?auto_198245 ) ) ( HAVE_IMAGE ?auto_198247 ?auto_198246 ) ( not ( = ?auto_198247 ?auto_198237 ) ) ( not ( = ?auto_198247 ?auto_198245 ) ) ( not ( = ?auto_198246 ?auto_198238 ) ) ( HAVE_IMAGE ?auto_198239 ?auto_198236 ) ( HAVE_IMAGE ?auto_198240 ?auto_198241 ) ( HAVE_IMAGE ?auto_198242 ?auto_198243 ) ( not ( = ?auto_198237 ?auto_198239 ) ) ( not ( = ?auto_198237 ?auto_198240 ) ) ( not ( = ?auto_198237 ?auto_198242 ) ) ( not ( = ?auto_198238 ?auto_198236 ) ) ( not ( = ?auto_198238 ?auto_198241 ) ) ( not ( = ?auto_198238 ?auto_198243 ) ) ( not ( = ?auto_198239 ?auto_198240 ) ) ( not ( = ?auto_198239 ?auto_198242 ) ) ( not ( = ?auto_198239 ?auto_198245 ) ) ( not ( = ?auto_198239 ?auto_198247 ) ) ( not ( = ?auto_198236 ?auto_198241 ) ) ( not ( = ?auto_198236 ?auto_198243 ) ) ( not ( = ?auto_198236 ?auto_198246 ) ) ( not ( = ?auto_198240 ?auto_198242 ) ) ( not ( = ?auto_198240 ?auto_198245 ) ) ( not ( = ?auto_198240 ?auto_198247 ) ) ( not ( = ?auto_198241 ?auto_198243 ) ) ( not ( = ?auto_198241 ?auto_198246 ) ) ( not ( = ?auto_198242 ?auto_198245 ) ) ( not ( = ?auto_198242 ?auto_198247 ) ) ( not ( = ?auto_198243 ?auto_198246 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198247 ?auto_198246 ?auto_198237 ?auto_198238 )
      ( GET-4IMAGE-VERIFY ?auto_198237 ?auto_198238 ?auto_198239 ?auto_198236 ?auto_198240 ?auto_198241 ?auto_198242 ?auto_198243 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_198454 - DIRECTION
      ?auto_198455 - MODE
      ?auto_198456 - DIRECTION
      ?auto_198453 - MODE
      ?auto_198457 - DIRECTION
      ?auto_198458 - MODE
    )
    :vars
    (
      ?auto_198460 - INSTRUMENT
      ?auto_198461 - SATELLITE
      ?auto_198459 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_198460 ?auto_198461 ) ( SUPPORTS ?auto_198460 ?auto_198458 ) ( POWER_ON ?auto_198460 ) ( POINTING ?auto_198461 ?auto_198459 ) ( not ( = ?auto_198457 ?auto_198459 ) ) ( HAVE_IMAGE ?auto_198454 ?auto_198455 ) ( not ( = ?auto_198454 ?auto_198457 ) ) ( not ( = ?auto_198454 ?auto_198459 ) ) ( not ( = ?auto_198455 ?auto_198458 ) ) ( CALIBRATION_TARGET ?auto_198460 ?auto_198459 ) ( NOT_CALIBRATED ?auto_198460 ) ( HAVE_IMAGE ?auto_198456 ?auto_198453 ) ( not ( = ?auto_198454 ?auto_198456 ) ) ( not ( = ?auto_198455 ?auto_198453 ) ) ( not ( = ?auto_198456 ?auto_198457 ) ) ( not ( = ?auto_198456 ?auto_198459 ) ) ( not ( = ?auto_198453 ?auto_198458 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198454 ?auto_198455 ?auto_198457 ?auto_198458 )
      ( GET-3IMAGE-VERIFY ?auto_198454 ?auto_198455 ?auto_198456 ?auto_198453 ?auto_198457 ?auto_198458 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_198472 - DIRECTION
      ?auto_198473 - MODE
      ?auto_198474 - DIRECTION
      ?auto_198471 - MODE
      ?auto_198475 - DIRECTION
      ?auto_198476 - MODE
    )
    :vars
    (
      ?auto_198478 - INSTRUMENT
      ?auto_198479 - SATELLITE
      ?auto_198477 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_198478 ?auto_198479 ) ( SUPPORTS ?auto_198478 ?auto_198471 ) ( POWER_ON ?auto_198478 ) ( POINTING ?auto_198479 ?auto_198477 ) ( not ( = ?auto_198474 ?auto_198477 ) ) ( HAVE_IMAGE ?auto_198472 ?auto_198473 ) ( not ( = ?auto_198472 ?auto_198474 ) ) ( not ( = ?auto_198472 ?auto_198477 ) ) ( not ( = ?auto_198473 ?auto_198471 ) ) ( CALIBRATION_TARGET ?auto_198478 ?auto_198477 ) ( NOT_CALIBRATED ?auto_198478 ) ( HAVE_IMAGE ?auto_198475 ?auto_198476 ) ( not ( = ?auto_198472 ?auto_198475 ) ) ( not ( = ?auto_198473 ?auto_198476 ) ) ( not ( = ?auto_198474 ?auto_198475 ) ) ( not ( = ?auto_198471 ?auto_198476 ) ) ( not ( = ?auto_198475 ?auto_198477 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198472 ?auto_198473 ?auto_198474 ?auto_198471 )
      ( GET-3IMAGE-VERIFY ?auto_198472 ?auto_198473 ?auto_198474 ?auto_198471 ?auto_198475 ?auto_198476 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_198496 - DIRECTION
      ?auto_198497 - MODE
      ?auto_198498 - DIRECTION
      ?auto_198495 - MODE
      ?auto_198499 - DIRECTION
      ?auto_198500 - MODE
    )
    :vars
    (
      ?auto_198504 - INSTRUMENT
      ?auto_198505 - SATELLITE
      ?auto_198503 - DIRECTION
      ?auto_198502 - DIRECTION
      ?auto_198501 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_198504 ?auto_198505 ) ( SUPPORTS ?auto_198504 ?auto_198500 ) ( POWER_ON ?auto_198504 ) ( POINTING ?auto_198505 ?auto_198503 ) ( not ( = ?auto_198499 ?auto_198503 ) ) ( HAVE_IMAGE ?auto_198502 ?auto_198501 ) ( not ( = ?auto_198502 ?auto_198499 ) ) ( not ( = ?auto_198502 ?auto_198503 ) ) ( not ( = ?auto_198501 ?auto_198500 ) ) ( CALIBRATION_TARGET ?auto_198504 ?auto_198503 ) ( NOT_CALIBRATED ?auto_198504 ) ( HAVE_IMAGE ?auto_198496 ?auto_198497 ) ( HAVE_IMAGE ?auto_198498 ?auto_198495 ) ( not ( = ?auto_198496 ?auto_198498 ) ) ( not ( = ?auto_198496 ?auto_198499 ) ) ( not ( = ?auto_198496 ?auto_198503 ) ) ( not ( = ?auto_198496 ?auto_198502 ) ) ( not ( = ?auto_198497 ?auto_198495 ) ) ( not ( = ?auto_198497 ?auto_198500 ) ) ( not ( = ?auto_198497 ?auto_198501 ) ) ( not ( = ?auto_198498 ?auto_198499 ) ) ( not ( = ?auto_198498 ?auto_198503 ) ) ( not ( = ?auto_198498 ?auto_198502 ) ) ( not ( = ?auto_198495 ?auto_198500 ) ) ( not ( = ?auto_198495 ?auto_198501 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198502 ?auto_198501 ?auto_198499 ?auto_198500 )
      ( GET-3IMAGE-VERIFY ?auto_198496 ?auto_198497 ?auto_198498 ?auto_198495 ?auto_198499 ?auto_198500 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_198513 - DIRECTION
      ?auto_198514 - MODE
      ?auto_198515 - DIRECTION
      ?auto_198512 - MODE
      ?auto_198516 - DIRECTION
      ?auto_198517 - MODE
    )
    :vars
    (
      ?auto_198521 - INSTRUMENT
      ?auto_198522 - SATELLITE
      ?auto_198520 - DIRECTION
      ?auto_198519 - DIRECTION
      ?auto_198518 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_198521 ?auto_198522 ) ( SUPPORTS ?auto_198521 ?auto_198512 ) ( POWER_ON ?auto_198521 ) ( POINTING ?auto_198522 ?auto_198520 ) ( not ( = ?auto_198515 ?auto_198520 ) ) ( HAVE_IMAGE ?auto_198519 ?auto_198518 ) ( not ( = ?auto_198519 ?auto_198515 ) ) ( not ( = ?auto_198519 ?auto_198520 ) ) ( not ( = ?auto_198518 ?auto_198512 ) ) ( CALIBRATION_TARGET ?auto_198521 ?auto_198520 ) ( NOT_CALIBRATED ?auto_198521 ) ( HAVE_IMAGE ?auto_198513 ?auto_198514 ) ( HAVE_IMAGE ?auto_198516 ?auto_198517 ) ( not ( = ?auto_198513 ?auto_198515 ) ) ( not ( = ?auto_198513 ?auto_198516 ) ) ( not ( = ?auto_198513 ?auto_198520 ) ) ( not ( = ?auto_198513 ?auto_198519 ) ) ( not ( = ?auto_198514 ?auto_198512 ) ) ( not ( = ?auto_198514 ?auto_198517 ) ) ( not ( = ?auto_198514 ?auto_198518 ) ) ( not ( = ?auto_198515 ?auto_198516 ) ) ( not ( = ?auto_198512 ?auto_198517 ) ) ( not ( = ?auto_198516 ?auto_198520 ) ) ( not ( = ?auto_198516 ?auto_198519 ) ) ( not ( = ?auto_198517 ?auto_198518 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198519 ?auto_198518 ?auto_198515 ?auto_198512 )
      ( GET-3IMAGE-VERIFY ?auto_198513 ?auto_198514 ?auto_198515 ?auto_198512 ?auto_198516 ?auto_198517 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_198544 - DIRECTION
      ?auto_198545 - MODE
      ?auto_198546 - DIRECTION
      ?auto_198543 - MODE
      ?auto_198547 - DIRECTION
      ?auto_198548 - MODE
    )
    :vars
    (
      ?auto_198550 - INSTRUMENT
      ?auto_198551 - SATELLITE
      ?auto_198549 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_198550 ?auto_198551 ) ( SUPPORTS ?auto_198550 ?auto_198545 ) ( POWER_ON ?auto_198550 ) ( POINTING ?auto_198551 ?auto_198549 ) ( not ( = ?auto_198544 ?auto_198549 ) ) ( HAVE_IMAGE ?auto_198546 ?auto_198543 ) ( not ( = ?auto_198546 ?auto_198544 ) ) ( not ( = ?auto_198546 ?auto_198549 ) ) ( not ( = ?auto_198543 ?auto_198545 ) ) ( CALIBRATION_TARGET ?auto_198550 ?auto_198549 ) ( NOT_CALIBRATED ?auto_198550 ) ( HAVE_IMAGE ?auto_198547 ?auto_198548 ) ( not ( = ?auto_198544 ?auto_198547 ) ) ( not ( = ?auto_198545 ?auto_198548 ) ) ( not ( = ?auto_198546 ?auto_198547 ) ) ( not ( = ?auto_198543 ?auto_198548 ) ) ( not ( = ?auto_198547 ?auto_198549 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198546 ?auto_198543 ?auto_198544 ?auto_198545 )
      ( GET-3IMAGE-VERIFY ?auto_198544 ?auto_198545 ?auto_198546 ?auto_198543 ?auto_198547 ?auto_198548 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_198568 - DIRECTION
      ?auto_198569 - MODE
      ?auto_198570 - DIRECTION
      ?auto_198567 - MODE
      ?auto_198571 - DIRECTION
      ?auto_198572 - MODE
    )
    :vars
    (
      ?auto_198576 - INSTRUMENT
      ?auto_198577 - SATELLITE
      ?auto_198575 - DIRECTION
      ?auto_198574 - DIRECTION
      ?auto_198573 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_198576 ?auto_198577 ) ( SUPPORTS ?auto_198576 ?auto_198569 ) ( POWER_ON ?auto_198576 ) ( POINTING ?auto_198577 ?auto_198575 ) ( not ( = ?auto_198568 ?auto_198575 ) ) ( HAVE_IMAGE ?auto_198574 ?auto_198573 ) ( not ( = ?auto_198574 ?auto_198568 ) ) ( not ( = ?auto_198574 ?auto_198575 ) ) ( not ( = ?auto_198573 ?auto_198569 ) ) ( CALIBRATION_TARGET ?auto_198576 ?auto_198575 ) ( NOT_CALIBRATED ?auto_198576 ) ( HAVE_IMAGE ?auto_198570 ?auto_198567 ) ( HAVE_IMAGE ?auto_198571 ?auto_198572 ) ( not ( = ?auto_198568 ?auto_198570 ) ) ( not ( = ?auto_198568 ?auto_198571 ) ) ( not ( = ?auto_198569 ?auto_198567 ) ) ( not ( = ?auto_198569 ?auto_198572 ) ) ( not ( = ?auto_198570 ?auto_198571 ) ) ( not ( = ?auto_198570 ?auto_198575 ) ) ( not ( = ?auto_198570 ?auto_198574 ) ) ( not ( = ?auto_198567 ?auto_198572 ) ) ( not ( = ?auto_198567 ?auto_198573 ) ) ( not ( = ?auto_198571 ?auto_198575 ) ) ( not ( = ?auto_198571 ?auto_198574 ) ) ( not ( = ?auto_198572 ?auto_198573 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198574 ?auto_198573 ?auto_198568 ?auto_198569 )
      ( GET-3IMAGE-VERIFY ?auto_198568 ?auto_198569 ?auto_198570 ?auto_198567 ?auto_198571 ?auto_198572 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_198621 - DIRECTION
      ?auto_198622 - MODE
      ?auto_198623 - DIRECTION
      ?auto_198620 - MODE
      ?auto_198624 - DIRECTION
      ?auto_198625 - MODE
      ?auto_198626 - DIRECTION
      ?auto_198627 - MODE
    )
    :vars
    (
      ?auto_198629 - INSTRUMENT
      ?auto_198630 - SATELLITE
      ?auto_198628 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_198629 ?auto_198630 ) ( SUPPORTS ?auto_198629 ?auto_198627 ) ( POWER_ON ?auto_198629 ) ( POINTING ?auto_198630 ?auto_198628 ) ( not ( = ?auto_198626 ?auto_198628 ) ) ( HAVE_IMAGE ?auto_198621 ?auto_198625 ) ( not ( = ?auto_198621 ?auto_198626 ) ) ( not ( = ?auto_198621 ?auto_198628 ) ) ( not ( = ?auto_198625 ?auto_198627 ) ) ( CALIBRATION_TARGET ?auto_198629 ?auto_198628 ) ( NOT_CALIBRATED ?auto_198629 ) ( HAVE_IMAGE ?auto_198621 ?auto_198622 ) ( HAVE_IMAGE ?auto_198623 ?auto_198620 ) ( HAVE_IMAGE ?auto_198624 ?auto_198625 ) ( not ( = ?auto_198621 ?auto_198623 ) ) ( not ( = ?auto_198621 ?auto_198624 ) ) ( not ( = ?auto_198622 ?auto_198620 ) ) ( not ( = ?auto_198622 ?auto_198625 ) ) ( not ( = ?auto_198622 ?auto_198627 ) ) ( not ( = ?auto_198623 ?auto_198624 ) ) ( not ( = ?auto_198623 ?auto_198626 ) ) ( not ( = ?auto_198623 ?auto_198628 ) ) ( not ( = ?auto_198620 ?auto_198625 ) ) ( not ( = ?auto_198620 ?auto_198627 ) ) ( not ( = ?auto_198624 ?auto_198626 ) ) ( not ( = ?auto_198624 ?auto_198628 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198621 ?auto_198625 ?auto_198626 ?auto_198627 )
      ( GET-4IMAGE-VERIFY ?auto_198621 ?auto_198622 ?auto_198623 ?auto_198620 ?auto_198624 ?auto_198625 ?auto_198626 ?auto_198627 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_198632 - DIRECTION
      ?auto_198633 - MODE
      ?auto_198634 - DIRECTION
      ?auto_198631 - MODE
      ?auto_198635 - DIRECTION
      ?auto_198636 - MODE
      ?auto_198637 - DIRECTION
      ?auto_198638 - MODE
    )
    :vars
    (
      ?auto_198640 - INSTRUMENT
      ?auto_198641 - SATELLITE
      ?auto_198639 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_198640 ?auto_198641 ) ( SUPPORTS ?auto_198640 ?auto_198638 ) ( POWER_ON ?auto_198640 ) ( POINTING ?auto_198641 ?auto_198639 ) ( not ( = ?auto_198637 ?auto_198639 ) ) ( HAVE_IMAGE ?auto_198634 ?auto_198633 ) ( not ( = ?auto_198634 ?auto_198637 ) ) ( not ( = ?auto_198634 ?auto_198639 ) ) ( not ( = ?auto_198633 ?auto_198638 ) ) ( CALIBRATION_TARGET ?auto_198640 ?auto_198639 ) ( NOT_CALIBRATED ?auto_198640 ) ( HAVE_IMAGE ?auto_198632 ?auto_198633 ) ( HAVE_IMAGE ?auto_198634 ?auto_198631 ) ( HAVE_IMAGE ?auto_198635 ?auto_198636 ) ( not ( = ?auto_198632 ?auto_198634 ) ) ( not ( = ?auto_198632 ?auto_198635 ) ) ( not ( = ?auto_198632 ?auto_198637 ) ) ( not ( = ?auto_198632 ?auto_198639 ) ) ( not ( = ?auto_198633 ?auto_198631 ) ) ( not ( = ?auto_198633 ?auto_198636 ) ) ( not ( = ?auto_198634 ?auto_198635 ) ) ( not ( = ?auto_198631 ?auto_198636 ) ) ( not ( = ?auto_198631 ?auto_198638 ) ) ( not ( = ?auto_198635 ?auto_198637 ) ) ( not ( = ?auto_198635 ?auto_198639 ) ) ( not ( = ?auto_198636 ?auto_198638 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198634 ?auto_198633 ?auto_198637 ?auto_198638 )
      ( GET-4IMAGE-VERIFY ?auto_198632 ?auto_198633 ?auto_198634 ?auto_198631 ?auto_198635 ?auto_198636 ?auto_198637 ?auto_198638 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_198643 - DIRECTION
      ?auto_198644 - MODE
      ?auto_198645 - DIRECTION
      ?auto_198642 - MODE
      ?auto_198646 - DIRECTION
      ?auto_198647 - MODE
      ?auto_198648 - DIRECTION
      ?auto_198649 - MODE
    )
    :vars
    (
      ?auto_198651 - INSTRUMENT
      ?auto_198652 - SATELLITE
      ?auto_198650 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_198651 ?auto_198652 ) ( SUPPORTS ?auto_198651 ?auto_198647 ) ( POWER_ON ?auto_198651 ) ( POINTING ?auto_198652 ?auto_198650 ) ( not ( = ?auto_198646 ?auto_198650 ) ) ( HAVE_IMAGE ?auto_198648 ?auto_198644 ) ( not ( = ?auto_198648 ?auto_198646 ) ) ( not ( = ?auto_198648 ?auto_198650 ) ) ( not ( = ?auto_198644 ?auto_198647 ) ) ( CALIBRATION_TARGET ?auto_198651 ?auto_198650 ) ( NOT_CALIBRATED ?auto_198651 ) ( HAVE_IMAGE ?auto_198643 ?auto_198644 ) ( HAVE_IMAGE ?auto_198645 ?auto_198642 ) ( HAVE_IMAGE ?auto_198648 ?auto_198649 ) ( not ( = ?auto_198643 ?auto_198645 ) ) ( not ( = ?auto_198643 ?auto_198646 ) ) ( not ( = ?auto_198643 ?auto_198648 ) ) ( not ( = ?auto_198643 ?auto_198650 ) ) ( not ( = ?auto_198644 ?auto_198642 ) ) ( not ( = ?auto_198644 ?auto_198649 ) ) ( not ( = ?auto_198645 ?auto_198646 ) ) ( not ( = ?auto_198645 ?auto_198648 ) ) ( not ( = ?auto_198645 ?auto_198650 ) ) ( not ( = ?auto_198642 ?auto_198647 ) ) ( not ( = ?auto_198642 ?auto_198649 ) ) ( not ( = ?auto_198647 ?auto_198649 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198648 ?auto_198644 ?auto_198646 ?auto_198647 )
      ( GET-4IMAGE-VERIFY ?auto_198643 ?auto_198644 ?auto_198645 ?auto_198642 ?auto_198646 ?auto_198647 ?auto_198648 ?auto_198649 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_198654 - DIRECTION
      ?auto_198655 - MODE
      ?auto_198656 - DIRECTION
      ?auto_198653 - MODE
      ?auto_198657 - DIRECTION
      ?auto_198658 - MODE
      ?auto_198659 - DIRECTION
      ?auto_198660 - MODE
    )
    :vars
    (
      ?auto_198662 - INSTRUMENT
      ?auto_198663 - SATELLITE
      ?auto_198661 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_198662 ?auto_198663 ) ( SUPPORTS ?auto_198662 ?auto_198658 ) ( POWER_ON ?auto_198662 ) ( POINTING ?auto_198663 ?auto_198661 ) ( not ( = ?auto_198657 ?auto_198661 ) ) ( HAVE_IMAGE ?auto_198656 ?auto_198655 ) ( not ( = ?auto_198656 ?auto_198657 ) ) ( not ( = ?auto_198656 ?auto_198661 ) ) ( not ( = ?auto_198655 ?auto_198658 ) ) ( CALIBRATION_TARGET ?auto_198662 ?auto_198661 ) ( NOT_CALIBRATED ?auto_198662 ) ( HAVE_IMAGE ?auto_198654 ?auto_198655 ) ( HAVE_IMAGE ?auto_198656 ?auto_198653 ) ( HAVE_IMAGE ?auto_198659 ?auto_198660 ) ( not ( = ?auto_198654 ?auto_198656 ) ) ( not ( = ?auto_198654 ?auto_198657 ) ) ( not ( = ?auto_198654 ?auto_198659 ) ) ( not ( = ?auto_198654 ?auto_198661 ) ) ( not ( = ?auto_198655 ?auto_198653 ) ) ( not ( = ?auto_198655 ?auto_198660 ) ) ( not ( = ?auto_198656 ?auto_198659 ) ) ( not ( = ?auto_198653 ?auto_198658 ) ) ( not ( = ?auto_198653 ?auto_198660 ) ) ( not ( = ?auto_198657 ?auto_198659 ) ) ( not ( = ?auto_198658 ?auto_198660 ) ) ( not ( = ?auto_198659 ?auto_198661 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198656 ?auto_198655 ?auto_198657 ?auto_198658 )
      ( GET-4IMAGE-VERIFY ?auto_198654 ?auto_198655 ?auto_198656 ?auto_198653 ?auto_198657 ?auto_198658 ?auto_198659 ?auto_198660 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_198687 - DIRECTION
      ?auto_198688 - MODE
      ?auto_198689 - DIRECTION
      ?auto_198686 - MODE
      ?auto_198690 - DIRECTION
      ?auto_198691 - MODE
      ?auto_198692 - DIRECTION
      ?auto_198693 - MODE
    )
    :vars
    (
      ?auto_198695 - INSTRUMENT
      ?auto_198696 - SATELLITE
      ?auto_198694 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_198695 ?auto_198696 ) ( SUPPORTS ?auto_198695 ?auto_198693 ) ( POWER_ON ?auto_198695 ) ( POINTING ?auto_198696 ?auto_198694 ) ( not ( = ?auto_198692 ?auto_198694 ) ) ( HAVE_IMAGE ?auto_198687 ?auto_198688 ) ( not ( = ?auto_198687 ?auto_198692 ) ) ( not ( = ?auto_198687 ?auto_198694 ) ) ( not ( = ?auto_198688 ?auto_198693 ) ) ( CALIBRATION_TARGET ?auto_198695 ?auto_198694 ) ( NOT_CALIBRATED ?auto_198695 ) ( HAVE_IMAGE ?auto_198689 ?auto_198686 ) ( HAVE_IMAGE ?auto_198690 ?auto_198691 ) ( not ( = ?auto_198687 ?auto_198689 ) ) ( not ( = ?auto_198687 ?auto_198690 ) ) ( not ( = ?auto_198688 ?auto_198686 ) ) ( not ( = ?auto_198688 ?auto_198691 ) ) ( not ( = ?auto_198689 ?auto_198690 ) ) ( not ( = ?auto_198689 ?auto_198692 ) ) ( not ( = ?auto_198689 ?auto_198694 ) ) ( not ( = ?auto_198686 ?auto_198691 ) ) ( not ( = ?auto_198686 ?auto_198693 ) ) ( not ( = ?auto_198690 ?auto_198692 ) ) ( not ( = ?auto_198690 ?auto_198694 ) ) ( not ( = ?auto_198691 ?auto_198693 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198687 ?auto_198688 ?auto_198692 ?auto_198693 )
      ( GET-4IMAGE-VERIFY ?auto_198687 ?auto_198688 ?auto_198689 ?auto_198686 ?auto_198690 ?auto_198691 ?auto_198692 ?auto_198693 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_198709 - DIRECTION
      ?auto_198710 - MODE
      ?auto_198711 - DIRECTION
      ?auto_198708 - MODE
      ?auto_198712 - DIRECTION
      ?auto_198713 - MODE
      ?auto_198714 - DIRECTION
      ?auto_198715 - MODE
    )
    :vars
    (
      ?auto_198717 - INSTRUMENT
      ?auto_198718 - SATELLITE
      ?auto_198716 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_198717 ?auto_198718 ) ( SUPPORTS ?auto_198717 ?auto_198713 ) ( POWER_ON ?auto_198717 ) ( POINTING ?auto_198718 ?auto_198716 ) ( not ( = ?auto_198712 ?auto_198716 ) ) ( HAVE_IMAGE ?auto_198709 ?auto_198710 ) ( not ( = ?auto_198709 ?auto_198712 ) ) ( not ( = ?auto_198709 ?auto_198716 ) ) ( not ( = ?auto_198710 ?auto_198713 ) ) ( CALIBRATION_TARGET ?auto_198717 ?auto_198716 ) ( NOT_CALIBRATED ?auto_198717 ) ( HAVE_IMAGE ?auto_198711 ?auto_198708 ) ( HAVE_IMAGE ?auto_198714 ?auto_198715 ) ( not ( = ?auto_198709 ?auto_198711 ) ) ( not ( = ?auto_198709 ?auto_198714 ) ) ( not ( = ?auto_198710 ?auto_198708 ) ) ( not ( = ?auto_198710 ?auto_198715 ) ) ( not ( = ?auto_198711 ?auto_198712 ) ) ( not ( = ?auto_198711 ?auto_198714 ) ) ( not ( = ?auto_198711 ?auto_198716 ) ) ( not ( = ?auto_198708 ?auto_198713 ) ) ( not ( = ?auto_198708 ?auto_198715 ) ) ( not ( = ?auto_198712 ?auto_198714 ) ) ( not ( = ?auto_198713 ?auto_198715 ) ) ( not ( = ?auto_198714 ?auto_198716 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198709 ?auto_198710 ?auto_198712 ?auto_198713 )
      ( GET-4IMAGE-VERIFY ?auto_198709 ?auto_198710 ?auto_198711 ?auto_198708 ?auto_198712 ?auto_198713 ?auto_198714 ?auto_198715 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_198731 - DIRECTION
      ?auto_198732 - MODE
      ?auto_198733 - DIRECTION
      ?auto_198730 - MODE
      ?auto_198734 - DIRECTION
      ?auto_198735 - MODE
      ?auto_198736 - DIRECTION
      ?auto_198737 - MODE
    )
    :vars
    (
      ?auto_198739 - INSTRUMENT
      ?auto_198740 - SATELLITE
      ?auto_198738 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_198739 ?auto_198740 ) ( SUPPORTS ?auto_198739 ?auto_198730 ) ( POWER_ON ?auto_198739 ) ( POINTING ?auto_198740 ?auto_198738 ) ( not ( = ?auto_198733 ?auto_198738 ) ) ( HAVE_IMAGE ?auto_198734 ?auto_198732 ) ( not ( = ?auto_198734 ?auto_198733 ) ) ( not ( = ?auto_198734 ?auto_198738 ) ) ( not ( = ?auto_198732 ?auto_198730 ) ) ( CALIBRATION_TARGET ?auto_198739 ?auto_198738 ) ( NOT_CALIBRATED ?auto_198739 ) ( HAVE_IMAGE ?auto_198731 ?auto_198732 ) ( HAVE_IMAGE ?auto_198734 ?auto_198735 ) ( HAVE_IMAGE ?auto_198736 ?auto_198737 ) ( not ( = ?auto_198731 ?auto_198733 ) ) ( not ( = ?auto_198731 ?auto_198734 ) ) ( not ( = ?auto_198731 ?auto_198736 ) ) ( not ( = ?auto_198731 ?auto_198738 ) ) ( not ( = ?auto_198732 ?auto_198735 ) ) ( not ( = ?auto_198732 ?auto_198737 ) ) ( not ( = ?auto_198733 ?auto_198736 ) ) ( not ( = ?auto_198730 ?auto_198735 ) ) ( not ( = ?auto_198730 ?auto_198737 ) ) ( not ( = ?auto_198734 ?auto_198736 ) ) ( not ( = ?auto_198735 ?auto_198737 ) ) ( not ( = ?auto_198736 ?auto_198738 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198734 ?auto_198732 ?auto_198733 ?auto_198730 )
      ( GET-4IMAGE-VERIFY ?auto_198731 ?auto_198732 ?auto_198733 ?auto_198730 ?auto_198734 ?auto_198735 ?auto_198736 ?auto_198737 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_198742 - DIRECTION
      ?auto_198743 - MODE
      ?auto_198744 - DIRECTION
      ?auto_198741 - MODE
      ?auto_198745 - DIRECTION
      ?auto_198746 - MODE
      ?auto_198747 - DIRECTION
      ?auto_198748 - MODE
    )
    :vars
    (
      ?auto_198750 - INSTRUMENT
      ?auto_198751 - SATELLITE
      ?auto_198749 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_198750 ?auto_198751 ) ( SUPPORTS ?auto_198750 ?auto_198741 ) ( POWER_ON ?auto_198750 ) ( POINTING ?auto_198751 ?auto_198749 ) ( not ( = ?auto_198744 ?auto_198749 ) ) ( HAVE_IMAGE ?auto_198745 ?auto_198746 ) ( not ( = ?auto_198745 ?auto_198744 ) ) ( not ( = ?auto_198745 ?auto_198749 ) ) ( not ( = ?auto_198746 ?auto_198741 ) ) ( CALIBRATION_TARGET ?auto_198750 ?auto_198749 ) ( NOT_CALIBRATED ?auto_198750 ) ( HAVE_IMAGE ?auto_198742 ?auto_198743 ) ( HAVE_IMAGE ?auto_198747 ?auto_198748 ) ( not ( = ?auto_198742 ?auto_198744 ) ) ( not ( = ?auto_198742 ?auto_198745 ) ) ( not ( = ?auto_198742 ?auto_198747 ) ) ( not ( = ?auto_198742 ?auto_198749 ) ) ( not ( = ?auto_198743 ?auto_198741 ) ) ( not ( = ?auto_198743 ?auto_198746 ) ) ( not ( = ?auto_198743 ?auto_198748 ) ) ( not ( = ?auto_198744 ?auto_198747 ) ) ( not ( = ?auto_198741 ?auto_198748 ) ) ( not ( = ?auto_198745 ?auto_198747 ) ) ( not ( = ?auto_198746 ?auto_198748 ) ) ( not ( = ?auto_198747 ?auto_198749 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198745 ?auto_198746 ?auto_198744 ?auto_198741 )
      ( GET-4IMAGE-VERIFY ?auto_198742 ?auto_198743 ?auto_198744 ?auto_198741 ?auto_198745 ?auto_198746 ?auto_198747 ?auto_198748 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_198764 - DIRECTION
      ?auto_198765 - MODE
      ?auto_198766 - DIRECTION
      ?auto_198763 - MODE
      ?auto_198767 - DIRECTION
      ?auto_198768 - MODE
      ?auto_198769 - DIRECTION
      ?auto_198770 - MODE
    )
    :vars
    (
      ?auto_198772 - INSTRUMENT
      ?auto_198773 - SATELLITE
      ?auto_198771 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_198772 ?auto_198773 ) ( SUPPORTS ?auto_198772 ?auto_198763 ) ( POWER_ON ?auto_198772 ) ( POINTING ?auto_198773 ?auto_198771 ) ( not ( = ?auto_198766 ?auto_198771 ) ) ( HAVE_IMAGE ?auto_198764 ?auto_198770 ) ( not ( = ?auto_198764 ?auto_198766 ) ) ( not ( = ?auto_198764 ?auto_198771 ) ) ( not ( = ?auto_198770 ?auto_198763 ) ) ( CALIBRATION_TARGET ?auto_198772 ?auto_198771 ) ( NOT_CALIBRATED ?auto_198772 ) ( HAVE_IMAGE ?auto_198764 ?auto_198765 ) ( HAVE_IMAGE ?auto_198767 ?auto_198768 ) ( HAVE_IMAGE ?auto_198769 ?auto_198770 ) ( not ( = ?auto_198764 ?auto_198767 ) ) ( not ( = ?auto_198764 ?auto_198769 ) ) ( not ( = ?auto_198765 ?auto_198763 ) ) ( not ( = ?auto_198765 ?auto_198768 ) ) ( not ( = ?auto_198765 ?auto_198770 ) ) ( not ( = ?auto_198766 ?auto_198767 ) ) ( not ( = ?auto_198766 ?auto_198769 ) ) ( not ( = ?auto_198763 ?auto_198768 ) ) ( not ( = ?auto_198767 ?auto_198769 ) ) ( not ( = ?auto_198767 ?auto_198771 ) ) ( not ( = ?auto_198768 ?auto_198770 ) ) ( not ( = ?auto_198769 ?auto_198771 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198764 ?auto_198770 ?auto_198766 ?auto_198763 )
      ( GET-4IMAGE-VERIFY ?auto_198764 ?auto_198765 ?auto_198766 ?auto_198763 ?auto_198767 ?auto_198768 ?auto_198769 ?auto_198770 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_198775 - DIRECTION
      ?auto_198776 - MODE
      ?auto_198777 - DIRECTION
      ?auto_198774 - MODE
      ?auto_198778 - DIRECTION
      ?auto_198779 - MODE
      ?auto_198780 - DIRECTION
      ?auto_198781 - MODE
    )
    :vars
    (
      ?auto_198783 - INSTRUMENT
      ?auto_198784 - SATELLITE
      ?auto_198782 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_198783 ?auto_198784 ) ( SUPPORTS ?auto_198783 ?auto_198774 ) ( POWER_ON ?auto_198783 ) ( POINTING ?auto_198784 ?auto_198782 ) ( not ( = ?auto_198777 ?auto_198782 ) ) ( HAVE_IMAGE ?auto_198775 ?auto_198776 ) ( not ( = ?auto_198775 ?auto_198777 ) ) ( not ( = ?auto_198775 ?auto_198782 ) ) ( not ( = ?auto_198776 ?auto_198774 ) ) ( CALIBRATION_TARGET ?auto_198783 ?auto_198782 ) ( NOT_CALIBRATED ?auto_198783 ) ( HAVE_IMAGE ?auto_198778 ?auto_198779 ) ( HAVE_IMAGE ?auto_198780 ?auto_198781 ) ( not ( = ?auto_198775 ?auto_198778 ) ) ( not ( = ?auto_198775 ?auto_198780 ) ) ( not ( = ?auto_198776 ?auto_198779 ) ) ( not ( = ?auto_198776 ?auto_198781 ) ) ( not ( = ?auto_198777 ?auto_198778 ) ) ( not ( = ?auto_198777 ?auto_198780 ) ) ( not ( = ?auto_198774 ?auto_198779 ) ) ( not ( = ?auto_198774 ?auto_198781 ) ) ( not ( = ?auto_198778 ?auto_198780 ) ) ( not ( = ?auto_198778 ?auto_198782 ) ) ( not ( = ?auto_198779 ?auto_198781 ) ) ( not ( = ?auto_198780 ?auto_198782 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198775 ?auto_198776 ?auto_198777 ?auto_198774 )
      ( GET-4IMAGE-VERIFY ?auto_198775 ?auto_198776 ?auto_198777 ?auto_198774 ?auto_198778 ?auto_198779 ?auto_198780 ?auto_198781 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_198830 - DIRECTION
      ?auto_198831 - MODE
      ?auto_198832 - DIRECTION
      ?auto_198829 - MODE
      ?auto_198833 - DIRECTION
      ?auto_198834 - MODE
      ?auto_198835 - DIRECTION
      ?auto_198836 - MODE
    )
    :vars
    (
      ?auto_198838 - INSTRUMENT
      ?auto_198839 - SATELLITE
      ?auto_198837 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_198838 ?auto_198839 ) ( SUPPORTS ?auto_198838 ?auto_198836 ) ( POWER_ON ?auto_198838 ) ( POINTING ?auto_198839 ?auto_198837 ) ( not ( = ?auto_198835 ?auto_198837 ) ) ( HAVE_IMAGE ?auto_198832 ?auto_198834 ) ( not ( = ?auto_198832 ?auto_198835 ) ) ( not ( = ?auto_198832 ?auto_198837 ) ) ( not ( = ?auto_198834 ?auto_198836 ) ) ( CALIBRATION_TARGET ?auto_198838 ?auto_198837 ) ( NOT_CALIBRATED ?auto_198838 ) ( HAVE_IMAGE ?auto_198830 ?auto_198831 ) ( HAVE_IMAGE ?auto_198832 ?auto_198829 ) ( HAVE_IMAGE ?auto_198833 ?auto_198834 ) ( not ( = ?auto_198830 ?auto_198832 ) ) ( not ( = ?auto_198830 ?auto_198833 ) ) ( not ( = ?auto_198830 ?auto_198835 ) ) ( not ( = ?auto_198830 ?auto_198837 ) ) ( not ( = ?auto_198831 ?auto_198829 ) ) ( not ( = ?auto_198831 ?auto_198834 ) ) ( not ( = ?auto_198831 ?auto_198836 ) ) ( not ( = ?auto_198832 ?auto_198833 ) ) ( not ( = ?auto_198829 ?auto_198834 ) ) ( not ( = ?auto_198829 ?auto_198836 ) ) ( not ( = ?auto_198833 ?auto_198835 ) ) ( not ( = ?auto_198833 ?auto_198837 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198832 ?auto_198834 ?auto_198835 ?auto_198836 )
      ( GET-4IMAGE-VERIFY ?auto_198830 ?auto_198831 ?auto_198832 ?auto_198829 ?auto_198833 ?auto_198834 ?auto_198835 ?auto_198836 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_198841 - DIRECTION
      ?auto_198842 - MODE
      ?auto_198843 - DIRECTION
      ?auto_198840 - MODE
      ?auto_198844 - DIRECTION
      ?auto_198845 - MODE
      ?auto_198846 - DIRECTION
      ?auto_198847 - MODE
    )
    :vars
    (
      ?auto_198849 - INSTRUMENT
      ?auto_198850 - SATELLITE
      ?auto_198848 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_198849 ?auto_198850 ) ( SUPPORTS ?auto_198849 ?auto_198847 ) ( POWER_ON ?auto_198849 ) ( POINTING ?auto_198850 ?auto_198848 ) ( not ( = ?auto_198846 ?auto_198848 ) ) ( HAVE_IMAGE ?auto_198843 ?auto_198840 ) ( not ( = ?auto_198843 ?auto_198846 ) ) ( not ( = ?auto_198843 ?auto_198848 ) ) ( not ( = ?auto_198840 ?auto_198847 ) ) ( CALIBRATION_TARGET ?auto_198849 ?auto_198848 ) ( NOT_CALIBRATED ?auto_198849 ) ( HAVE_IMAGE ?auto_198841 ?auto_198842 ) ( HAVE_IMAGE ?auto_198844 ?auto_198845 ) ( not ( = ?auto_198841 ?auto_198843 ) ) ( not ( = ?auto_198841 ?auto_198844 ) ) ( not ( = ?auto_198841 ?auto_198846 ) ) ( not ( = ?auto_198841 ?auto_198848 ) ) ( not ( = ?auto_198842 ?auto_198840 ) ) ( not ( = ?auto_198842 ?auto_198845 ) ) ( not ( = ?auto_198842 ?auto_198847 ) ) ( not ( = ?auto_198843 ?auto_198844 ) ) ( not ( = ?auto_198840 ?auto_198845 ) ) ( not ( = ?auto_198844 ?auto_198846 ) ) ( not ( = ?auto_198844 ?auto_198848 ) ) ( not ( = ?auto_198845 ?auto_198847 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198843 ?auto_198840 ?auto_198846 ?auto_198847 )
      ( GET-4IMAGE-VERIFY ?auto_198841 ?auto_198842 ?auto_198843 ?auto_198840 ?auto_198844 ?auto_198845 ?auto_198846 ?auto_198847 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_198852 - DIRECTION
      ?auto_198853 - MODE
      ?auto_198854 - DIRECTION
      ?auto_198851 - MODE
      ?auto_198855 - DIRECTION
      ?auto_198856 - MODE
      ?auto_198857 - DIRECTION
      ?auto_198858 - MODE
    )
    :vars
    (
      ?auto_198860 - INSTRUMENT
      ?auto_198861 - SATELLITE
      ?auto_198859 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_198860 ?auto_198861 ) ( SUPPORTS ?auto_198860 ?auto_198856 ) ( POWER_ON ?auto_198860 ) ( POINTING ?auto_198861 ?auto_198859 ) ( not ( = ?auto_198855 ?auto_198859 ) ) ( HAVE_IMAGE ?auto_198857 ?auto_198851 ) ( not ( = ?auto_198857 ?auto_198855 ) ) ( not ( = ?auto_198857 ?auto_198859 ) ) ( not ( = ?auto_198851 ?auto_198856 ) ) ( CALIBRATION_TARGET ?auto_198860 ?auto_198859 ) ( NOT_CALIBRATED ?auto_198860 ) ( HAVE_IMAGE ?auto_198852 ?auto_198853 ) ( HAVE_IMAGE ?auto_198854 ?auto_198851 ) ( HAVE_IMAGE ?auto_198857 ?auto_198858 ) ( not ( = ?auto_198852 ?auto_198854 ) ) ( not ( = ?auto_198852 ?auto_198855 ) ) ( not ( = ?auto_198852 ?auto_198857 ) ) ( not ( = ?auto_198852 ?auto_198859 ) ) ( not ( = ?auto_198853 ?auto_198851 ) ) ( not ( = ?auto_198853 ?auto_198856 ) ) ( not ( = ?auto_198853 ?auto_198858 ) ) ( not ( = ?auto_198854 ?auto_198855 ) ) ( not ( = ?auto_198854 ?auto_198857 ) ) ( not ( = ?auto_198854 ?auto_198859 ) ) ( not ( = ?auto_198851 ?auto_198858 ) ) ( not ( = ?auto_198856 ?auto_198858 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198857 ?auto_198851 ?auto_198855 ?auto_198856 )
      ( GET-4IMAGE-VERIFY ?auto_198852 ?auto_198853 ?auto_198854 ?auto_198851 ?auto_198855 ?auto_198856 ?auto_198857 ?auto_198858 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_198863 - DIRECTION
      ?auto_198864 - MODE
      ?auto_198865 - DIRECTION
      ?auto_198862 - MODE
      ?auto_198866 - DIRECTION
      ?auto_198867 - MODE
      ?auto_198868 - DIRECTION
      ?auto_198869 - MODE
    )
    :vars
    (
      ?auto_198871 - INSTRUMENT
      ?auto_198872 - SATELLITE
      ?auto_198870 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_198871 ?auto_198872 ) ( SUPPORTS ?auto_198871 ?auto_198867 ) ( POWER_ON ?auto_198871 ) ( POINTING ?auto_198872 ?auto_198870 ) ( not ( = ?auto_198866 ?auto_198870 ) ) ( HAVE_IMAGE ?auto_198865 ?auto_198862 ) ( not ( = ?auto_198865 ?auto_198866 ) ) ( not ( = ?auto_198865 ?auto_198870 ) ) ( not ( = ?auto_198862 ?auto_198867 ) ) ( CALIBRATION_TARGET ?auto_198871 ?auto_198870 ) ( NOT_CALIBRATED ?auto_198871 ) ( HAVE_IMAGE ?auto_198863 ?auto_198864 ) ( HAVE_IMAGE ?auto_198868 ?auto_198869 ) ( not ( = ?auto_198863 ?auto_198865 ) ) ( not ( = ?auto_198863 ?auto_198866 ) ) ( not ( = ?auto_198863 ?auto_198868 ) ) ( not ( = ?auto_198863 ?auto_198870 ) ) ( not ( = ?auto_198864 ?auto_198862 ) ) ( not ( = ?auto_198864 ?auto_198867 ) ) ( not ( = ?auto_198864 ?auto_198869 ) ) ( not ( = ?auto_198865 ?auto_198868 ) ) ( not ( = ?auto_198862 ?auto_198869 ) ) ( not ( = ?auto_198866 ?auto_198868 ) ) ( not ( = ?auto_198867 ?auto_198869 ) ) ( not ( = ?auto_198868 ?auto_198870 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198865 ?auto_198862 ?auto_198866 ?auto_198867 )
      ( GET-4IMAGE-VERIFY ?auto_198863 ?auto_198864 ?auto_198865 ?auto_198862 ?auto_198866 ?auto_198867 ?auto_198868 ?auto_198869 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_198896 - DIRECTION
      ?auto_198897 - MODE
      ?auto_198898 - DIRECTION
      ?auto_198895 - MODE
      ?auto_198899 - DIRECTION
      ?auto_198900 - MODE
      ?auto_198901 - DIRECTION
      ?auto_198902 - MODE
    )
    :vars
    (
      ?auto_198906 - INSTRUMENT
      ?auto_198907 - SATELLITE
      ?auto_198905 - DIRECTION
      ?auto_198904 - DIRECTION
      ?auto_198903 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_198906 ?auto_198907 ) ( SUPPORTS ?auto_198906 ?auto_198902 ) ( POWER_ON ?auto_198906 ) ( POINTING ?auto_198907 ?auto_198905 ) ( not ( = ?auto_198901 ?auto_198905 ) ) ( HAVE_IMAGE ?auto_198904 ?auto_198903 ) ( not ( = ?auto_198904 ?auto_198901 ) ) ( not ( = ?auto_198904 ?auto_198905 ) ) ( not ( = ?auto_198903 ?auto_198902 ) ) ( CALIBRATION_TARGET ?auto_198906 ?auto_198905 ) ( NOT_CALIBRATED ?auto_198906 ) ( HAVE_IMAGE ?auto_198896 ?auto_198897 ) ( HAVE_IMAGE ?auto_198898 ?auto_198895 ) ( HAVE_IMAGE ?auto_198899 ?auto_198900 ) ( not ( = ?auto_198896 ?auto_198898 ) ) ( not ( = ?auto_198896 ?auto_198899 ) ) ( not ( = ?auto_198896 ?auto_198901 ) ) ( not ( = ?auto_198896 ?auto_198905 ) ) ( not ( = ?auto_198896 ?auto_198904 ) ) ( not ( = ?auto_198897 ?auto_198895 ) ) ( not ( = ?auto_198897 ?auto_198900 ) ) ( not ( = ?auto_198897 ?auto_198902 ) ) ( not ( = ?auto_198897 ?auto_198903 ) ) ( not ( = ?auto_198898 ?auto_198899 ) ) ( not ( = ?auto_198898 ?auto_198901 ) ) ( not ( = ?auto_198898 ?auto_198905 ) ) ( not ( = ?auto_198898 ?auto_198904 ) ) ( not ( = ?auto_198895 ?auto_198900 ) ) ( not ( = ?auto_198895 ?auto_198902 ) ) ( not ( = ?auto_198895 ?auto_198903 ) ) ( not ( = ?auto_198899 ?auto_198901 ) ) ( not ( = ?auto_198899 ?auto_198905 ) ) ( not ( = ?auto_198899 ?auto_198904 ) ) ( not ( = ?auto_198900 ?auto_198902 ) ) ( not ( = ?auto_198900 ?auto_198903 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198904 ?auto_198903 ?auto_198901 ?auto_198902 )
      ( GET-4IMAGE-VERIFY ?auto_198896 ?auto_198897 ?auto_198898 ?auto_198895 ?auto_198899 ?auto_198900 ?auto_198901 ?auto_198902 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_198909 - DIRECTION
      ?auto_198910 - MODE
      ?auto_198911 - DIRECTION
      ?auto_198908 - MODE
      ?auto_198912 - DIRECTION
      ?auto_198913 - MODE
      ?auto_198914 - DIRECTION
      ?auto_198915 - MODE
    )
    :vars
    (
      ?auto_198917 - INSTRUMENT
      ?auto_198918 - SATELLITE
      ?auto_198916 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_198917 ?auto_198918 ) ( SUPPORTS ?auto_198917 ?auto_198913 ) ( POWER_ON ?auto_198917 ) ( POINTING ?auto_198918 ?auto_198916 ) ( not ( = ?auto_198912 ?auto_198916 ) ) ( HAVE_IMAGE ?auto_198914 ?auto_198915 ) ( not ( = ?auto_198914 ?auto_198912 ) ) ( not ( = ?auto_198914 ?auto_198916 ) ) ( not ( = ?auto_198915 ?auto_198913 ) ) ( CALIBRATION_TARGET ?auto_198917 ?auto_198916 ) ( NOT_CALIBRATED ?auto_198917 ) ( HAVE_IMAGE ?auto_198909 ?auto_198910 ) ( HAVE_IMAGE ?auto_198911 ?auto_198908 ) ( not ( = ?auto_198909 ?auto_198911 ) ) ( not ( = ?auto_198909 ?auto_198912 ) ) ( not ( = ?auto_198909 ?auto_198914 ) ) ( not ( = ?auto_198909 ?auto_198916 ) ) ( not ( = ?auto_198910 ?auto_198908 ) ) ( not ( = ?auto_198910 ?auto_198913 ) ) ( not ( = ?auto_198910 ?auto_198915 ) ) ( not ( = ?auto_198911 ?auto_198912 ) ) ( not ( = ?auto_198911 ?auto_198914 ) ) ( not ( = ?auto_198911 ?auto_198916 ) ) ( not ( = ?auto_198908 ?auto_198913 ) ) ( not ( = ?auto_198908 ?auto_198915 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198914 ?auto_198915 ?auto_198912 ?auto_198913 )
      ( GET-4IMAGE-VERIFY ?auto_198909 ?auto_198910 ?auto_198911 ?auto_198908 ?auto_198912 ?auto_198913 ?auto_198914 ?auto_198915 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_198920 - DIRECTION
      ?auto_198921 - MODE
      ?auto_198922 - DIRECTION
      ?auto_198919 - MODE
      ?auto_198923 - DIRECTION
      ?auto_198924 - MODE
      ?auto_198925 - DIRECTION
      ?auto_198926 - MODE
    )
    :vars
    (
      ?auto_198930 - INSTRUMENT
      ?auto_198931 - SATELLITE
      ?auto_198929 - DIRECTION
      ?auto_198928 - DIRECTION
      ?auto_198927 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_198930 ?auto_198931 ) ( SUPPORTS ?auto_198930 ?auto_198924 ) ( POWER_ON ?auto_198930 ) ( POINTING ?auto_198931 ?auto_198929 ) ( not ( = ?auto_198923 ?auto_198929 ) ) ( HAVE_IMAGE ?auto_198928 ?auto_198927 ) ( not ( = ?auto_198928 ?auto_198923 ) ) ( not ( = ?auto_198928 ?auto_198929 ) ) ( not ( = ?auto_198927 ?auto_198924 ) ) ( CALIBRATION_TARGET ?auto_198930 ?auto_198929 ) ( NOT_CALIBRATED ?auto_198930 ) ( HAVE_IMAGE ?auto_198920 ?auto_198921 ) ( HAVE_IMAGE ?auto_198922 ?auto_198919 ) ( HAVE_IMAGE ?auto_198925 ?auto_198926 ) ( not ( = ?auto_198920 ?auto_198922 ) ) ( not ( = ?auto_198920 ?auto_198923 ) ) ( not ( = ?auto_198920 ?auto_198925 ) ) ( not ( = ?auto_198920 ?auto_198929 ) ) ( not ( = ?auto_198920 ?auto_198928 ) ) ( not ( = ?auto_198921 ?auto_198919 ) ) ( not ( = ?auto_198921 ?auto_198924 ) ) ( not ( = ?auto_198921 ?auto_198926 ) ) ( not ( = ?auto_198921 ?auto_198927 ) ) ( not ( = ?auto_198922 ?auto_198923 ) ) ( not ( = ?auto_198922 ?auto_198925 ) ) ( not ( = ?auto_198922 ?auto_198929 ) ) ( not ( = ?auto_198922 ?auto_198928 ) ) ( not ( = ?auto_198919 ?auto_198924 ) ) ( not ( = ?auto_198919 ?auto_198926 ) ) ( not ( = ?auto_198919 ?auto_198927 ) ) ( not ( = ?auto_198923 ?auto_198925 ) ) ( not ( = ?auto_198924 ?auto_198926 ) ) ( not ( = ?auto_198925 ?auto_198929 ) ) ( not ( = ?auto_198925 ?auto_198928 ) ) ( not ( = ?auto_198926 ?auto_198927 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198928 ?auto_198927 ?auto_198923 ?auto_198924 )
      ( GET-4IMAGE-VERIFY ?auto_198920 ?auto_198921 ?auto_198922 ?auto_198919 ?auto_198923 ?auto_198924 ?auto_198925 ?auto_198926 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_198979 - DIRECTION
      ?auto_198980 - MODE
      ?auto_198981 - DIRECTION
      ?auto_198978 - MODE
      ?auto_198982 - DIRECTION
      ?auto_198983 - MODE
      ?auto_198984 - DIRECTION
      ?auto_198985 - MODE
    )
    :vars
    (
      ?auto_198987 - INSTRUMENT
      ?auto_198988 - SATELLITE
      ?auto_198986 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_198987 ?auto_198988 ) ( SUPPORTS ?auto_198987 ?auto_198978 ) ( POWER_ON ?auto_198987 ) ( POINTING ?auto_198988 ?auto_198986 ) ( not ( = ?auto_198981 ?auto_198986 ) ) ( HAVE_IMAGE ?auto_198984 ?auto_198985 ) ( not ( = ?auto_198984 ?auto_198981 ) ) ( not ( = ?auto_198984 ?auto_198986 ) ) ( not ( = ?auto_198985 ?auto_198978 ) ) ( CALIBRATION_TARGET ?auto_198987 ?auto_198986 ) ( NOT_CALIBRATED ?auto_198987 ) ( HAVE_IMAGE ?auto_198979 ?auto_198980 ) ( HAVE_IMAGE ?auto_198982 ?auto_198983 ) ( not ( = ?auto_198979 ?auto_198981 ) ) ( not ( = ?auto_198979 ?auto_198982 ) ) ( not ( = ?auto_198979 ?auto_198984 ) ) ( not ( = ?auto_198979 ?auto_198986 ) ) ( not ( = ?auto_198980 ?auto_198978 ) ) ( not ( = ?auto_198980 ?auto_198983 ) ) ( not ( = ?auto_198980 ?auto_198985 ) ) ( not ( = ?auto_198981 ?auto_198982 ) ) ( not ( = ?auto_198978 ?auto_198983 ) ) ( not ( = ?auto_198982 ?auto_198984 ) ) ( not ( = ?auto_198982 ?auto_198986 ) ) ( not ( = ?auto_198983 ?auto_198985 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198984 ?auto_198985 ?auto_198981 ?auto_198978 )
      ( GET-4IMAGE-VERIFY ?auto_198979 ?auto_198980 ?auto_198981 ?auto_198978 ?auto_198982 ?auto_198983 ?auto_198984 ?auto_198985 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_198990 - DIRECTION
      ?auto_198991 - MODE
      ?auto_198992 - DIRECTION
      ?auto_198989 - MODE
      ?auto_198993 - DIRECTION
      ?auto_198994 - MODE
      ?auto_198995 - DIRECTION
      ?auto_198996 - MODE
    )
    :vars
    (
      ?auto_199000 - INSTRUMENT
      ?auto_199001 - SATELLITE
      ?auto_198999 - DIRECTION
      ?auto_198998 - DIRECTION
      ?auto_198997 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_199000 ?auto_199001 ) ( SUPPORTS ?auto_199000 ?auto_198989 ) ( POWER_ON ?auto_199000 ) ( POINTING ?auto_199001 ?auto_198999 ) ( not ( = ?auto_198992 ?auto_198999 ) ) ( HAVE_IMAGE ?auto_198998 ?auto_198997 ) ( not ( = ?auto_198998 ?auto_198992 ) ) ( not ( = ?auto_198998 ?auto_198999 ) ) ( not ( = ?auto_198997 ?auto_198989 ) ) ( CALIBRATION_TARGET ?auto_199000 ?auto_198999 ) ( NOT_CALIBRATED ?auto_199000 ) ( HAVE_IMAGE ?auto_198990 ?auto_198991 ) ( HAVE_IMAGE ?auto_198993 ?auto_198994 ) ( HAVE_IMAGE ?auto_198995 ?auto_198996 ) ( not ( = ?auto_198990 ?auto_198992 ) ) ( not ( = ?auto_198990 ?auto_198993 ) ) ( not ( = ?auto_198990 ?auto_198995 ) ) ( not ( = ?auto_198990 ?auto_198999 ) ) ( not ( = ?auto_198990 ?auto_198998 ) ) ( not ( = ?auto_198991 ?auto_198989 ) ) ( not ( = ?auto_198991 ?auto_198994 ) ) ( not ( = ?auto_198991 ?auto_198996 ) ) ( not ( = ?auto_198991 ?auto_198997 ) ) ( not ( = ?auto_198992 ?auto_198993 ) ) ( not ( = ?auto_198992 ?auto_198995 ) ) ( not ( = ?auto_198989 ?auto_198994 ) ) ( not ( = ?auto_198989 ?auto_198996 ) ) ( not ( = ?auto_198993 ?auto_198995 ) ) ( not ( = ?auto_198993 ?auto_198999 ) ) ( not ( = ?auto_198993 ?auto_198998 ) ) ( not ( = ?auto_198994 ?auto_198996 ) ) ( not ( = ?auto_198994 ?auto_198997 ) ) ( not ( = ?auto_198995 ?auto_198999 ) ) ( not ( = ?auto_198995 ?auto_198998 ) ) ( not ( = ?auto_198996 ?auto_198997 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198998 ?auto_198997 ?auto_198992 ?auto_198989 )
      ( GET-4IMAGE-VERIFY ?auto_198990 ?auto_198991 ?auto_198992 ?auto_198989 ?auto_198993 ?auto_198994 ?auto_198995 ?auto_198996 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_199053 - DIRECTION
      ?auto_199054 - MODE
      ?auto_199055 - DIRECTION
      ?auto_199052 - MODE
      ?auto_199056 - DIRECTION
      ?auto_199057 - MODE
      ?auto_199058 - DIRECTION
      ?auto_199059 - MODE
    )
    :vars
    (
      ?auto_199061 - INSTRUMENT
      ?auto_199062 - SATELLITE
      ?auto_199060 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_199061 ?auto_199062 ) ( SUPPORTS ?auto_199061 ?auto_199054 ) ( POWER_ON ?auto_199061 ) ( POINTING ?auto_199062 ?auto_199060 ) ( not ( = ?auto_199053 ?auto_199060 ) ) ( HAVE_IMAGE ?auto_199056 ?auto_199059 ) ( not ( = ?auto_199056 ?auto_199053 ) ) ( not ( = ?auto_199056 ?auto_199060 ) ) ( not ( = ?auto_199059 ?auto_199054 ) ) ( CALIBRATION_TARGET ?auto_199061 ?auto_199060 ) ( NOT_CALIBRATED ?auto_199061 ) ( HAVE_IMAGE ?auto_199055 ?auto_199052 ) ( HAVE_IMAGE ?auto_199056 ?auto_199057 ) ( HAVE_IMAGE ?auto_199058 ?auto_199059 ) ( not ( = ?auto_199053 ?auto_199055 ) ) ( not ( = ?auto_199053 ?auto_199058 ) ) ( not ( = ?auto_199054 ?auto_199052 ) ) ( not ( = ?auto_199054 ?auto_199057 ) ) ( not ( = ?auto_199055 ?auto_199056 ) ) ( not ( = ?auto_199055 ?auto_199058 ) ) ( not ( = ?auto_199055 ?auto_199060 ) ) ( not ( = ?auto_199052 ?auto_199057 ) ) ( not ( = ?auto_199052 ?auto_199059 ) ) ( not ( = ?auto_199056 ?auto_199058 ) ) ( not ( = ?auto_199057 ?auto_199059 ) ) ( not ( = ?auto_199058 ?auto_199060 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_199056 ?auto_199059 ?auto_199053 ?auto_199054 )
      ( GET-4IMAGE-VERIFY ?auto_199053 ?auto_199054 ?auto_199055 ?auto_199052 ?auto_199056 ?auto_199057 ?auto_199058 ?auto_199059 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_199064 - DIRECTION
      ?auto_199065 - MODE
      ?auto_199066 - DIRECTION
      ?auto_199063 - MODE
      ?auto_199067 - DIRECTION
      ?auto_199068 - MODE
      ?auto_199069 - DIRECTION
      ?auto_199070 - MODE
    )
    :vars
    (
      ?auto_199072 - INSTRUMENT
      ?auto_199073 - SATELLITE
      ?auto_199071 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_199072 ?auto_199073 ) ( SUPPORTS ?auto_199072 ?auto_199065 ) ( POWER_ON ?auto_199072 ) ( POINTING ?auto_199073 ?auto_199071 ) ( not ( = ?auto_199064 ?auto_199071 ) ) ( HAVE_IMAGE ?auto_199067 ?auto_199068 ) ( not ( = ?auto_199067 ?auto_199064 ) ) ( not ( = ?auto_199067 ?auto_199071 ) ) ( not ( = ?auto_199068 ?auto_199065 ) ) ( CALIBRATION_TARGET ?auto_199072 ?auto_199071 ) ( NOT_CALIBRATED ?auto_199072 ) ( HAVE_IMAGE ?auto_199066 ?auto_199063 ) ( HAVE_IMAGE ?auto_199069 ?auto_199070 ) ( not ( = ?auto_199064 ?auto_199066 ) ) ( not ( = ?auto_199064 ?auto_199069 ) ) ( not ( = ?auto_199065 ?auto_199063 ) ) ( not ( = ?auto_199065 ?auto_199070 ) ) ( not ( = ?auto_199066 ?auto_199067 ) ) ( not ( = ?auto_199066 ?auto_199069 ) ) ( not ( = ?auto_199066 ?auto_199071 ) ) ( not ( = ?auto_199063 ?auto_199068 ) ) ( not ( = ?auto_199063 ?auto_199070 ) ) ( not ( = ?auto_199067 ?auto_199069 ) ) ( not ( = ?auto_199068 ?auto_199070 ) ) ( not ( = ?auto_199069 ?auto_199071 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_199067 ?auto_199068 ?auto_199064 ?auto_199065 )
      ( GET-4IMAGE-VERIFY ?auto_199064 ?auto_199065 ?auto_199066 ?auto_199063 ?auto_199067 ?auto_199068 ?auto_199069 ?auto_199070 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_199086 - DIRECTION
      ?auto_199087 - MODE
      ?auto_199088 - DIRECTION
      ?auto_199085 - MODE
      ?auto_199089 - DIRECTION
      ?auto_199090 - MODE
      ?auto_199091 - DIRECTION
      ?auto_199092 - MODE
    )
    :vars
    (
      ?auto_199094 - INSTRUMENT
      ?auto_199095 - SATELLITE
      ?auto_199093 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_199094 ?auto_199095 ) ( SUPPORTS ?auto_199094 ?auto_199087 ) ( POWER_ON ?auto_199094 ) ( POINTING ?auto_199095 ?auto_199093 ) ( not ( = ?auto_199086 ?auto_199093 ) ) ( HAVE_IMAGE ?auto_199088 ?auto_199085 ) ( not ( = ?auto_199088 ?auto_199086 ) ) ( not ( = ?auto_199088 ?auto_199093 ) ) ( not ( = ?auto_199085 ?auto_199087 ) ) ( CALIBRATION_TARGET ?auto_199094 ?auto_199093 ) ( NOT_CALIBRATED ?auto_199094 ) ( HAVE_IMAGE ?auto_199089 ?auto_199090 ) ( HAVE_IMAGE ?auto_199091 ?auto_199092 ) ( not ( = ?auto_199086 ?auto_199089 ) ) ( not ( = ?auto_199086 ?auto_199091 ) ) ( not ( = ?auto_199087 ?auto_199090 ) ) ( not ( = ?auto_199087 ?auto_199092 ) ) ( not ( = ?auto_199088 ?auto_199089 ) ) ( not ( = ?auto_199088 ?auto_199091 ) ) ( not ( = ?auto_199085 ?auto_199090 ) ) ( not ( = ?auto_199085 ?auto_199092 ) ) ( not ( = ?auto_199089 ?auto_199091 ) ) ( not ( = ?auto_199089 ?auto_199093 ) ) ( not ( = ?auto_199090 ?auto_199092 ) ) ( not ( = ?auto_199091 ?auto_199093 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_199088 ?auto_199085 ?auto_199086 ?auto_199087 )
      ( GET-4IMAGE-VERIFY ?auto_199086 ?auto_199087 ?auto_199088 ?auto_199085 ?auto_199089 ?auto_199090 ?auto_199091 ?auto_199092 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_199196 - DIRECTION
      ?auto_199197 - MODE
      ?auto_199198 - DIRECTION
      ?auto_199195 - MODE
      ?auto_199199 - DIRECTION
      ?auto_199200 - MODE
      ?auto_199201 - DIRECTION
      ?auto_199202 - MODE
    )
    :vars
    (
      ?auto_199206 - INSTRUMENT
      ?auto_199207 - SATELLITE
      ?auto_199205 - DIRECTION
      ?auto_199204 - DIRECTION
      ?auto_199203 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_199206 ?auto_199207 ) ( SUPPORTS ?auto_199206 ?auto_199197 ) ( POWER_ON ?auto_199206 ) ( POINTING ?auto_199207 ?auto_199205 ) ( not ( = ?auto_199196 ?auto_199205 ) ) ( HAVE_IMAGE ?auto_199204 ?auto_199203 ) ( not ( = ?auto_199204 ?auto_199196 ) ) ( not ( = ?auto_199204 ?auto_199205 ) ) ( not ( = ?auto_199203 ?auto_199197 ) ) ( CALIBRATION_TARGET ?auto_199206 ?auto_199205 ) ( NOT_CALIBRATED ?auto_199206 ) ( HAVE_IMAGE ?auto_199198 ?auto_199195 ) ( HAVE_IMAGE ?auto_199199 ?auto_199200 ) ( HAVE_IMAGE ?auto_199201 ?auto_199202 ) ( not ( = ?auto_199196 ?auto_199198 ) ) ( not ( = ?auto_199196 ?auto_199199 ) ) ( not ( = ?auto_199196 ?auto_199201 ) ) ( not ( = ?auto_199197 ?auto_199195 ) ) ( not ( = ?auto_199197 ?auto_199200 ) ) ( not ( = ?auto_199197 ?auto_199202 ) ) ( not ( = ?auto_199198 ?auto_199199 ) ) ( not ( = ?auto_199198 ?auto_199201 ) ) ( not ( = ?auto_199198 ?auto_199205 ) ) ( not ( = ?auto_199198 ?auto_199204 ) ) ( not ( = ?auto_199195 ?auto_199200 ) ) ( not ( = ?auto_199195 ?auto_199202 ) ) ( not ( = ?auto_199195 ?auto_199203 ) ) ( not ( = ?auto_199199 ?auto_199201 ) ) ( not ( = ?auto_199199 ?auto_199205 ) ) ( not ( = ?auto_199199 ?auto_199204 ) ) ( not ( = ?auto_199200 ?auto_199202 ) ) ( not ( = ?auto_199200 ?auto_199203 ) ) ( not ( = ?auto_199201 ?auto_199205 ) ) ( not ( = ?auto_199201 ?auto_199204 ) ) ( not ( = ?auto_199202 ?auto_199203 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_199204 ?auto_199203 ?auto_199196 ?auto_199197 )
      ( GET-4IMAGE-VERIFY ?auto_199196 ?auto_199197 ?auto_199198 ?auto_199195 ?auto_199199 ?auto_199200 ?auto_199201 ?auto_199202 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_199419 - DIRECTION
      ?auto_199420 - MODE
      ?auto_199421 - DIRECTION
      ?auto_199418 - MODE
      ?auto_199422 - DIRECTION
      ?auto_199423 - MODE
    )
    :vars
    (
      ?auto_199425 - INSTRUMENT
      ?auto_199426 - SATELLITE
      ?auto_199424 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_199425 ?auto_199426 ) ( SUPPORTS ?auto_199425 ?auto_199418 ) ( POINTING ?auto_199426 ?auto_199424 ) ( not ( = ?auto_199421 ?auto_199424 ) ) ( HAVE_IMAGE ?auto_199422 ?auto_199420 ) ( not ( = ?auto_199422 ?auto_199421 ) ) ( not ( = ?auto_199422 ?auto_199424 ) ) ( not ( = ?auto_199420 ?auto_199418 ) ) ( CALIBRATION_TARGET ?auto_199425 ?auto_199424 ) ( POWER_AVAIL ?auto_199426 ) ( HAVE_IMAGE ?auto_199419 ?auto_199420 ) ( HAVE_IMAGE ?auto_199422 ?auto_199423 ) ( not ( = ?auto_199419 ?auto_199421 ) ) ( not ( = ?auto_199419 ?auto_199422 ) ) ( not ( = ?auto_199419 ?auto_199424 ) ) ( not ( = ?auto_199420 ?auto_199423 ) ) ( not ( = ?auto_199418 ?auto_199423 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_199422 ?auto_199420 ?auto_199421 ?auto_199418 )
      ( GET-3IMAGE-VERIFY ?auto_199419 ?auto_199420 ?auto_199421 ?auto_199418 ?auto_199422 ?auto_199423 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_199428 - DIRECTION
      ?auto_199429 - MODE
      ?auto_199430 - DIRECTION
      ?auto_199427 - MODE
      ?auto_199431 - DIRECTION
      ?auto_199432 - MODE
    )
    :vars
    (
      ?auto_199434 - INSTRUMENT
      ?auto_199435 - SATELLITE
      ?auto_199433 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_199434 ?auto_199435 ) ( SUPPORTS ?auto_199434 ?auto_199427 ) ( POINTING ?auto_199435 ?auto_199433 ) ( not ( = ?auto_199430 ?auto_199433 ) ) ( HAVE_IMAGE ?auto_199428 ?auto_199429 ) ( not ( = ?auto_199428 ?auto_199430 ) ) ( not ( = ?auto_199428 ?auto_199433 ) ) ( not ( = ?auto_199429 ?auto_199427 ) ) ( CALIBRATION_TARGET ?auto_199434 ?auto_199433 ) ( POWER_AVAIL ?auto_199435 ) ( HAVE_IMAGE ?auto_199431 ?auto_199432 ) ( not ( = ?auto_199428 ?auto_199431 ) ) ( not ( = ?auto_199429 ?auto_199432 ) ) ( not ( = ?auto_199430 ?auto_199431 ) ) ( not ( = ?auto_199427 ?auto_199432 ) ) ( not ( = ?auto_199431 ?auto_199433 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_199428 ?auto_199429 ?auto_199430 ?auto_199427 )
      ( GET-3IMAGE-VERIFY ?auto_199428 ?auto_199429 ?auto_199430 ?auto_199427 ?auto_199431 ?auto_199432 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_199452 - DIRECTION
      ?auto_199453 - MODE
      ?auto_199454 - DIRECTION
      ?auto_199451 - MODE
      ?auto_199455 - DIRECTION
      ?auto_199456 - MODE
    )
    :vars
    (
      ?auto_199458 - INSTRUMENT
      ?auto_199459 - SATELLITE
      ?auto_199457 - DIRECTION
      ?auto_199461 - DIRECTION
      ?auto_199460 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_199458 ?auto_199459 ) ( SUPPORTS ?auto_199458 ?auto_199456 ) ( POINTING ?auto_199459 ?auto_199457 ) ( not ( = ?auto_199455 ?auto_199457 ) ) ( HAVE_IMAGE ?auto_199461 ?auto_199460 ) ( not ( = ?auto_199461 ?auto_199455 ) ) ( not ( = ?auto_199461 ?auto_199457 ) ) ( not ( = ?auto_199460 ?auto_199456 ) ) ( CALIBRATION_TARGET ?auto_199458 ?auto_199457 ) ( POWER_AVAIL ?auto_199459 ) ( HAVE_IMAGE ?auto_199452 ?auto_199453 ) ( HAVE_IMAGE ?auto_199454 ?auto_199451 ) ( not ( = ?auto_199452 ?auto_199454 ) ) ( not ( = ?auto_199452 ?auto_199455 ) ) ( not ( = ?auto_199452 ?auto_199457 ) ) ( not ( = ?auto_199452 ?auto_199461 ) ) ( not ( = ?auto_199453 ?auto_199451 ) ) ( not ( = ?auto_199453 ?auto_199456 ) ) ( not ( = ?auto_199453 ?auto_199460 ) ) ( not ( = ?auto_199454 ?auto_199455 ) ) ( not ( = ?auto_199454 ?auto_199457 ) ) ( not ( = ?auto_199454 ?auto_199461 ) ) ( not ( = ?auto_199451 ?auto_199456 ) ) ( not ( = ?auto_199451 ?auto_199460 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_199461 ?auto_199460 ?auto_199455 ?auto_199456 )
      ( GET-3IMAGE-VERIFY ?auto_199452 ?auto_199453 ?auto_199454 ?auto_199451 ?auto_199455 ?auto_199456 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_199469 - DIRECTION
      ?auto_199470 - MODE
      ?auto_199471 - DIRECTION
      ?auto_199468 - MODE
      ?auto_199472 - DIRECTION
      ?auto_199473 - MODE
    )
    :vars
    (
      ?auto_199475 - INSTRUMENT
      ?auto_199476 - SATELLITE
      ?auto_199474 - DIRECTION
      ?auto_199478 - DIRECTION
      ?auto_199477 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_199475 ?auto_199476 ) ( SUPPORTS ?auto_199475 ?auto_199468 ) ( POINTING ?auto_199476 ?auto_199474 ) ( not ( = ?auto_199471 ?auto_199474 ) ) ( HAVE_IMAGE ?auto_199478 ?auto_199477 ) ( not ( = ?auto_199478 ?auto_199471 ) ) ( not ( = ?auto_199478 ?auto_199474 ) ) ( not ( = ?auto_199477 ?auto_199468 ) ) ( CALIBRATION_TARGET ?auto_199475 ?auto_199474 ) ( POWER_AVAIL ?auto_199476 ) ( HAVE_IMAGE ?auto_199469 ?auto_199470 ) ( HAVE_IMAGE ?auto_199472 ?auto_199473 ) ( not ( = ?auto_199469 ?auto_199471 ) ) ( not ( = ?auto_199469 ?auto_199472 ) ) ( not ( = ?auto_199469 ?auto_199474 ) ) ( not ( = ?auto_199469 ?auto_199478 ) ) ( not ( = ?auto_199470 ?auto_199468 ) ) ( not ( = ?auto_199470 ?auto_199473 ) ) ( not ( = ?auto_199470 ?auto_199477 ) ) ( not ( = ?auto_199471 ?auto_199472 ) ) ( not ( = ?auto_199468 ?auto_199473 ) ) ( not ( = ?auto_199472 ?auto_199474 ) ) ( not ( = ?auto_199472 ?auto_199478 ) ) ( not ( = ?auto_199473 ?auto_199477 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_199478 ?auto_199477 ?auto_199471 ?auto_199468 )
      ( GET-3IMAGE-VERIFY ?auto_199469 ?auto_199470 ?auto_199471 ?auto_199468 ?auto_199472 ?auto_199473 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_199500 - DIRECTION
      ?auto_199501 - MODE
      ?auto_199502 - DIRECTION
      ?auto_199499 - MODE
      ?auto_199503 - DIRECTION
      ?auto_199504 - MODE
    )
    :vars
    (
      ?auto_199506 - INSTRUMENT
      ?auto_199507 - SATELLITE
      ?auto_199505 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_199506 ?auto_199507 ) ( SUPPORTS ?auto_199506 ?auto_199501 ) ( POINTING ?auto_199507 ?auto_199505 ) ( not ( = ?auto_199500 ?auto_199505 ) ) ( HAVE_IMAGE ?auto_199502 ?auto_199499 ) ( not ( = ?auto_199502 ?auto_199500 ) ) ( not ( = ?auto_199502 ?auto_199505 ) ) ( not ( = ?auto_199499 ?auto_199501 ) ) ( CALIBRATION_TARGET ?auto_199506 ?auto_199505 ) ( POWER_AVAIL ?auto_199507 ) ( HAVE_IMAGE ?auto_199503 ?auto_199504 ) ( not ( = ?auto_199500 ?auto_199503 ) ) ( not ( = ?auto_199501 ?auto_199504 ) ) ( not ( = ?auto_199502 ?auto_199503 ) ) ( not ( = ?auto_199499 ?auto_199504 ) ) ( not ( = ?auto_199503 ?auto_199505 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_199502 ?auto_199499 ?auto_199500 ?auto_199501 )
      ( GET-3IMAGE-VERIFY ?auto_199500 ?auto_199501 ?auto_199502 ?auto_199499 ?auto_199503 ?auto_199504 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_199524 - DIRECTION
      ?auto_199525 - MODE
      ?auto_199526 - DIRECTION
      ?auto_199523 - MODE
      ?auto_199527 - DIRECTION
      ?auto_199528 - MODE
    )
    :vars
    (
      ?auto_199530 - INSTRUMENT
      ?auto_199531 - SATELLITE
      ?auto_199529 - DIRECTION
      ?auto_199533 - DIRECTION
      ?auto_199532 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_199530 ?auto_199531 ) ( SUPPORTS ?auto_199530 ?auto_199525 ) ( POINTING ?auto_199531 ?auto_199529 ) ( not ( = ?auto_199524 ?auto_199529 ) ) ( HAVE_IMAGE ?auto_199533 ?auto_199532 ) ( not ( = ?auto_199533 ?auto_199524 ) ) ( not ( = ?auto_199533 ?auto_199529 ) ) ( not ( = ?auto_199532 ?auto_199525 ) ) ( CALIBRATION_TARGET ?auto_199530 ?auto_199529 ) ( POWER_AVAIL ?auto_199531 ) ( HAVE_IMAGE ?auto_199526 ?auto_199523 ) ( HAVE_IMAGE ?auto_199527 ?auto_199528 ) ( not ( = ?auto_199524 ?auto_199526 ) ) ( not ( = ?auto_199524 ?auto_199527 ) ) ( not ( = ?auto_199525 ?auto_199523 ) ) ( not ( = ?auto_199525 ?auto_199528 ) ) ( not ( = ?auto_199526 ?auto_199527 ) ) ( not ( = ?auto_199526 ?auto_199529 ) ) ( not ( = ?auto_199526 ?auto_199533 ) ) ( not ( = ?auto_199523 ?auto_199528 ) ) ( not ( = ?auto_199523 ?auto_199532 ) ) ( not ( = ?auto_199527 ?auto_199529 ) ) ( not ( = ?auto_199527 ?auto_199533 ) ) ( not ( = ?auto_199528 ?auto_199532 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_199533 ?auto_199532 ?auto_199524 ?auto_199525 )
      ( GET-3IMAGE-VERIFY ?auto_199524 ?auto_199525 ?auto_199526 ?auto_199523 ?auto_199527 ?auto_199528 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_199577 - DIRECTION
      ?auto_199578 - MODE
      ?auto_199579 - DIRECTION
      ?auto_199576 - MODE
      ?auto_199580 - DIRECTION
      ?auto_199581 - MODE
      ?auto_199582 - DIRECTION
      ?auto_199583 - MODE
    )
    :vars
    (
      ?auto_199585 - INSTRUMENT
      ?auto_199586 - SATELLITE
      ?auto_199584 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_199585 ?auto_199586 ) ( SUPPORTS ?auto_199585 ?auto_199583 ) ( POINTING ?auto_199586 ?auto_199584 ) ( not ( = ?auto_199582 ?auto_199584 ) ) ( HAVE_IMAGE ?auto_199577 ?auto_199581 ) ( not ( = ?auto_199577 ?auto_199582 ) ) ( not ( = ?auto_199577 ?auto_199584 ) ) ( not ( = ?auto_199581 ?auto_199583 ) ) ( CALIBRATION_TARGET ?auto_199585 ?auto_199584 ) ( POWER_AVAIL ?auto_199586 ) ( HAVE_IMAGE ?auto_199577 ?auto_199578 ) ( HAVE_IMAGE ?auto_199579 ?auto_199576 ) ( HAVE_IMAGE ?auto_199580 ?auto_199581 ) ( not ( = ?auto_199577 ?auto_199579 ) ) ( not ( = ?auto_199577 ?auto_199580 ) ) ( not ( = ?auto_199578 ?auto_199576 ) ) ( not ( = ?auto_199578 ?auto_199581 ) ) ( not ( = ?auto_199578 ?auto_199583 ) ) ( not ( = ?auto_199579 ?auto_199580 ) ) ( not ( = ?auto_199579 ?auto_199582 ) ) ( not ( = ?auto_199579 ?auto_199584 ) ) ( not ( = ?auto_199576 ?auto_199581 ) ) ( not ( = ?auto_199576 ?auto_199583 ) ) ( not ( = ?auto_199580 ?auto_199582 ) ) ( not ( = ?auto_199580 ?auto_199584 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_199577 ?auto_199581 ?auto_199582 ?auto_199583 )
      ( GET-4IMAGE-VERIFY ?auto_199577 ?auto_199578 ?auto_199579 ?auto_199576 ?auto_199580 ?auto_199581 ?auto_199582 ?auto_199583 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_199588 - DIRECTION
      ?auto_199589 - MODE
      ?auto_199590 - DIRECTION
      ?auto_199587 - MODE
      ?auto_199591 - DIRECTION
      ?auto_199592 - MODE
      ?auto_199593 - DIRECTION
      ?auto_199594 - MODE
    )
    :vars
    (
      ?auto_199596 - INSTRUMENT
      ?auto_199597 - SATELLITE
      ?auto_199595 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_199596 ?auto_199597 ) ( SUPPORTS ?auto_199596 ?auto_199594 ) ( POINTING ?auto_199597 ?auto_199595 ) ( not ( = ?auto_199593 ?auto_199595 ) ) ( HAVE_IMAGE ?auto_199590 ?auto_199589 ) ( not ( = ?auto_199590 ?auto_199593 ) ) ( not ( = ?auto_199590 ?auto_199595 ) ) ( not ( = ?auto_199589 ?auto_199594 ) ) ( CALIBRATION_TARGET ?auto_199596 ?auto_199595 ) ( POWER_AVAIL ?auto_199597 ) ( HAVE_IMAGE ?auto_199588 ?auto_199589 ) ( HAVE_IMAGE ?auto_199590 ?auto_199587 ) ( HAVE_IMAGE ?auto_199591 ?auto_199592 ) ( not ( = ?auto_199588 ?auto_199590 ) ) ( not ( = ?auto_199588 ?auto_199591 ) ) ( not ( = ?auto_199588 ?auto_199593 ) ) ( not ( = ?auto_199588 ?auto_199595 ) ) ( not ( = ?auto_199589 ?auto_199587 ) ) ( not ( = ?auto_199589 ?auto_199592 ) ) ( not ( = ?auto_199590 ?auto_199591 ) ) ( not ( = ?auto_199587 ?auto_199592 ) ) ( not ( = ?auto_199587 ?auto_199594 ) ) ( not ( = ?auto_199591 ?auto_199593 ) ) ( not ( = ?auto_199591 ?auto_199595 ) ) ( not ( = ?auto_199592 ?auto_199594 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_199590 ?auto_199589 ?auto_199593 ?auto_199594 )
      ( GET-4IMAGE-VERIFY ?auto_199588 ?auto_199589 ?auto_199590 ?auto_199587 ?auto_199591 ?auto_199592 ?auto_199593 ?auto_199594 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_199599 - DIRECTION
      ?auto_199600 - MODE
      ?auto_199601 - DIRECTION
      ?auto_199598 - MODE
      ?auto_199602 - DIRECTION
      ?auto_199603 - MODE
      ?auto_199604 - DIRECTION
      ?auto_199605 - MODE
    )
    :vars
    (
      ?auto_199607 - INSTRUMENT
      ?auto_199608 - SATELLITE
      ?auto_199606 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_199607 ?auto_199608 ) ( SUPPORTS ?auto_199607 ?auto_199603 ) ( POINTING ?auto_199608 ?auto_199606 ) ( not ( = ?auto_199602 ?auto_199606 ) ) ( HAVE_IMAGE ?auto_199601 ?auto_199605 ) ( not ( = ?auto_199601 ?auto_199602 ) ) ( not ( = ?auto_199601 ?auto_199606 ) ) ( not ( = ?auto_199605 ?auto_199603 ) ) ( CALIBRATION_TARGET ?auto_199607 ?auto_199606 ) ( POWER_AVAIL ?auto_199608 ) ( HAVE_IMAGE ?auto_199599 ?auto_199600 ) ( HAVE_IMAGE ?auto_199601 ?auto_199598 ) ( HAVE_IMAGE ?auto_199604 ?auto_199605 ) ( not ( = ?auto_199599 ?auto_199601 ) ) ( not ( = ?auto_199599 ?auto_199602 ) ) ( not ( = ?auto_199599 ?auto_199604 ) ) ( not ( = ?auto_199599 ?auto_199606 ) ) ( not ( = ?auto_199600 ?auto_199598 ) ) ( not ( = ?auto_199600 ?auto_199603 ) ) ( not ( = ?auto_199600 ?auto_199605 ) ) ( not ( = ?auto_199601 ?auto_199604 ) ) ( not ( = ?auto_199598 ?auto_199603 ) ) ( not ( = ?auto_199598 ?auto_199605 ) ) ( not ( = ?auto_199602 ?auto_199604 ) ) ( not ( = ?auto_199604 ?auto_199606 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_199601 ?auto_199605 ?auto_199602 ?auto_199603 )
      ( GET-4IMAGE-VERIFY ?auto_199599 ?auto_199600 ?auto_199601 ?auto_199598 ?auto_199602 ?auto_199603 ?auto_199604 ?auto_199605 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_199632 - DIRECTION
      ?auto_199633 - MODE
      ?auto_199634 - DIRECTION
      ?auto_199631 - MODE
      ?auto_199635 - DIRECTION
      ?auto_199636 - MODE
      ?auto_199637 - DIRECTION
      ?auto_199638 - MODE
    )
    :vars
    (
      ?auto_199640 - INSTRUMENT
      ?auto_199641 - SATELLITE
      ?auto_199639 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_199640 ?auto_199641 ) ( SUPPORTS ?auto_199640 ?auto_199638 ) ( POINTING ?auto_199641 ?auto_199639 ) ( not ( = ?auto_199637 ?auto_199639 ) ) ( HAVE_IMAGE ?auto_199635 ?auto_199636 ) ( not ( = ?auto_199635 ?auto_199637 ) ) ( not ( = ?auto_199635 ?auto_199639 ) ) ( not ( = ?auto_199636 ?auto_199638 ) ) ( CALIBRATION_TARGET ?auto_199640 ?auto_199639 ) ( POWER_AVAIL ?auto_199641 ) ( HAVE_IMAGE ?auto_199632 ?auto_199633 ) ( HAVE_IMAGE ?auto_199634 ?auto_199631 ) ( not ( = ?auto_199632 ?auto_199634 ) ) ( not ( = ?auto_199632 ?auto_199635 ) ) ( not ( = ?auto_199632 ?auto_199637 ) ) ( not ( = ?auto_199632 ?auto_199639 ) ) ( not ( = ?auto_199633 ?auto_199631 ) ) ( not ( = ?auto_199633 ?auto_199636 ) ) ( not ( = ?auto_199633 ?auto_199638 ) ) ( not ( = ?auto_199634 ?auto_199635 ) ) ( not ( = ?auto_199634 ?auto_199637 ) ) ( not ( = ?auto_199634 ?auto_199639 ) ) ( not ( = ?auto_199631 ?auto_199636 ) ) ( not ( = ?auto_199631 ?auto_199638 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_199635 ?auto_199636 ?auto_199637 ?auto_199638 )
      ( GET-4IMAGE-VERIFY ?auto_199632 ?auto_199633 ?auto_199634 ?auto_199631 ?auto_199635 ?auto_199636 ?auto_199637 ?auto_199638 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_199643 - DIRECTION
      ?auto_199644 - MODE
      ?auto_199645 - DIRECTION
      ?auto_199642 - MODE
      ?auto_199646 - DIRECTION
      ?auto_199647 - MODE
      ?auto_199648 - DIRECTION
      ?auto_199649 - MODE
    )
    :vars
    (
      ?auto_199651 - INSTRUMENT
      ?auto_199652 - SATELLITE
      ?auto_199650 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_199651 ?auto_199652 ) ( SUPPORTS ?auto_199651 ?auto_199649 ) ( POINTING ?auto_199652 ?auto_199650 ) ( not ( = ?auto_199648 ?auto_199650 ) ) ( HAVE_IMAGE ?auto_199643 ?auto_199644 ) ( not ( = ?auto_199643 ?auto_199648 ) ) ( not ( = ?auto_199643 ?auto_199650 ) ) ( not ( = ?auto_199644 ?auto_199649 ) ) ( CALIBRATION_TARGET ?auto_199651 ?auto_199650 ) ( POWER_AVAIL ?auto_199652 ) ( HAVE_IMAGE ?auto_199645 ?auto_199642 ) ( HAVE_IMAGE ?auto_199646 ?auto_199647 ) ( not ( = ?auto_199643 ?auto_199645 ) ) ( not ( = ?auto_199643 ?auto_199646 ) ) ( not ( = ?auto_199644 ?auto_199642 ) ) ( not ( = ?auto_199644 ?auto_199647 ) ) ( not ( = ?auto_199645 ?auto_199646 ) ) ( not ( = ?auto_199645 ?auto_199648 ) ) ( not ( = ?auto_199645 ?auto_199650 ) ) ( not ( = ?auto_199642 ?auto_199647 ) ) ( not ( = ?auto_199642 ?auto_199649 ) ) ( not ( = ?auto_199646 ?auto_199648 ) ) ( not ( = ?auto_199646 ?auto_199650 ) ) ( not ( = ?auto_199647 ?auto_199649 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_199643 ?auto_199644 ?auto_199648 ?auto_199649 )
      ( GET-4IMAGE-VERIFY ?auto_199643 ?auto_199644 ?auto_199645 ?auto_199642 ?auto_199646 ?auto_199647 ?auto_199648 ?auto_199649 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_199654 - DIRECTION
      ?auto_199655 - MODE
      ?auto_199656 - DIRECTION
      ?auto_199653 - MODE
      ?auto_199657 - DIRECTION
      ?auto_199658 - MODE
      ?auto_199659 - DIRECTION
      ?auto_199660 - MODE
    )
    :vars
    (
      ?auto_199662 - INSTRUMENT
      ?auto_199663 - SATELLITE
      ?auto_199661 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_199662 ?auto_199663 ) ( SUPPORTS ?auto_199662 ?auto_199658 ) ( POINTING ?auto_199663 ?auto_199661 ) ( not ( = ?auto_199657 ?auto_199661 ) ) ( HAVE_IMAGE ?auto_199654 ?auto_199660 ) ( not ( = ?auto_199654 ?auto_199657 ) ) ( not ( = ?auto_199654 ?auto_199661 ) ) ( not ( = ?auto_199660 ?auto_199658 ) ) ( CALIBRATION_TARGET ?auto_199662 ?auto_199661 ) ( POWER_AVAIL ?auto_199663 ) ( HAVE_IMAGE ?auto_199654 ?auto_199655 ) ( HAVE_IMAGE ?auto_199656 ?auto_199653 ) ( HAVE_IMAGE ?auto_199659 ?auto_199660 ) ( not ( = ?auto_199654 ?auto_199656 ) ) ( not ( = ?auto_199654 ?auto_199659 ) ) ( not ( = ?auto_199655 ?auto_199653 ) ) ( not ( = ?auto_199655 ?auto_199658 ) ) ( not ( = ?auto_199655 ?auto_199660 ) ) ( not ( = ?auto_199656 ?auto_199657 ) ) ( not ( = ?auto_199656 ?auto_199659 ) ) ( not ( = ?auto_199656 ?auto_199661 ) ) ( not ( = ?auto_199653 ?auto_199658 ) ) ( not ( = ?auto_199653 ?auto_199660 ) ) ( not ( = ?auto_199657 ?auto_199659 ) ) ( not ( = ?auto_199659 ?auto_199661 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_199654 ?auto_199660 ?auto_199657 ?auto_199658 )
      ( GET-4IMAGE-VERIFY ?auto_199654 ?auto_199655 ?auto_199656 ?auto_199653 ?auto_199657 ?auto_199658 ?auto_199659 ?auto_199660 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_199665 - DIRECTION
      ?auto_199666 - MODE
      ?auto_199667 - DIRECTION
      ?auto_199664 - MODE
      ?auto_199668 - DIRECTION
      ?auto_199669 - MODE
      ?auto_199670 - DIRECTION
      ?auto_199671 - MODE
    )
    :vars
    (
      ?auto_199673 - INSTRUMENT
      ?auto_199674 - SATELLITE
      ?auto_199672 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_199673 ?auto_199674 ) ( SUPPORTS ?auto_199673 ?auto_199669 ) ( POINTING ?auto_199674 ?auto_199672 ) ( not ( = ?auto_199668 ?auto_199672 ) ) ( HAVE_IMAGE ?auto_199665 ?auto_199666 ) ( not ( = ?auto_199665 ?auto_199668 ) ) ( not ( = ?auto_199665 ?auto_199672 ) ) ( not ( = ?auto_199666 ?auto_199669 ) ) ( CALIBRATION_TARGET ?auto_199673 ?auto_199672 ) ( POWER_AVAIL ?auto_199674 ) ( HAVE_IMAGE ?auto_199667 ?auto_199664 ) ( HAVE_IMAGE ?auto_199670 ?auto_199671 ) ( not ( = ?auto_199665 ?auto_199667 ) ) ( not ( = ?auto_199665 ?auto_199670 ) ) ( not ( = ?auto_199666 ?auto_199664 ) ) ( not ( = ?auto_199666 ?auto_199671 ) ) ( not ( = ?auto_199667 ?auto_199668 ) ) ( not ( = ?auto_199667 ?auto_199670 ) ) ( not ( = ?auto_199667 ?auto_199672 ) ) ( not ( = ?auto_199664 ?auto_199669 ) ) ( not ( = ?auto_199664 ?auto_199671 ) ) ( not ( = ?auto_199668 ?auto_199670 ) ) ( not ( = ?auto_199669 ?auto_199671 ) ) ( not ( = ?auto_199670 ?auto_199672 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_199665 ?auto_199666 ?auto_199668 ?auto_199669 )
      ( GET-4IMAGE-VERIFY ?auto_199665 ?auto_199666 ?auto_199667 ?auto_199664 ?auto_199668 ?auto_199669 ?auto_199670 ?auto_199671 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_199687 - DIRECTION
      ?auto_199688 - MODE
      ?auto_199689 - DIRECTION
      ?auto_199686 - MODE
      ?auto_199690 - DIRECTION
      ?auto_199691 - MODE
      ?auto_199692 - DIRECTION
      ?auto_199693 - MODE
    )
    :vars
    (
      ?auto_199695 - INSTRUMENT
      ?auto_199696 - SATELLITE
      ?auto_199694 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_199695 ?auto_199696 ) ( SUPPORTS ?auto_199695 ?auto_199686 ) ( POINTING ?auto_199696 ?auto_199694 ) ( not ( = ?auto_199689 ?auto_199694 ) ) ( HAVE_IMAGE ?auto_199692 ?auto_199688 ) ( not ( = ?auto_199692 ?auto_199689 ) ) ( not ( = ?auto_199692 ?auto_199694 ) ) ( not ( = ?auto_199688 ?auto_199686 ) ) ( CALIBRATION_TARGET ?auto_199695 ?auto_199694 ) ( POWER_AVAIL ?auto_199696 ) ( HAVE_IMAGE ?auto_199687 ?auto_199688 ) ( HAVE_IMAGE ?auto_199690 ?auto_199691 ) ( HAVE_IMAGE ?auto_199692 ?auto_199693 ) ( not ( = ?auto_199687 ?auto_199689 ) ) ( not ( = ?auto_199687 ?auto_199690 ) ) ( not ( = ?auto_199687 ?auto_199692 ) ) ( not ( = ?auto_199687 ?auto_199694 ) ) ( not ( = ?auto_199688 ?auto_199691 ) ) ( not ( = ?auto_199688 ?auto_199693 ) ) ( not ( = ?auto_199689 ?auto_199690 ) ) ( not ( = ?auto_199686 ?auto_199691 ) ) ( not ( = ?auto_199686 ?auto_199693 ) ) ( not ( = ?auto_199690 ?auto_199692 ) ) ( not ( = ?auto_199690 ?auto_199694 ) ) ( not ( = ?auto_199691 ?auto_199693 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_199692 ?auto_199688 ?auto_199689 ?auto_199686 )
      ( GET-4IMAGE-VERIFY ?auto_199687 ?auto_199688 ?auto_199689 ?auto_199686 ?auto_199690 ?auto_199691 ?auto_199692 ?auto_199693 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_199698 - DIRECTION
      ?auto_199699 - MODE
      ?auto_199700 - DIRECTION
      ?auto_199697 - MODE
      ?auto_199701 - DIRECTION
      ?auto_199702 - MODE
      ?auto_199703 - DIRECTION
      ?auto_199704 - MODE
    )
    :vars
    (
      ?auto_199706 - INSTRUMENT
      ?auto_199707 - SATELLITE
      ?auto_199705 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_199706 ?auto_199707 ) ( SUPPORTS ?auto_199706 ?auto_199697 ) ( POINTING ?auto_199707 ?auto_199705 ) ( not ( = ?auto_199700 ?auto_199705 ) ) ( HAVE_IMAGE ?auto_199701 ?auto_199702 ) ( not ( = ?auto_199701 ?auto_199700 ) ) ( not ( = ?auto_199701 ?auto_199705 ) ) ( not ( = ?auto_199702 ?auto_199697 ) ) ( CALIBRATION_TARGET ?auto_199706 ?auto_199705 ) ( POWER_AVAIL ?auto_199707 ) ( HAVE_IMAGE ?auto_199698 ?auto_199699 ) ( HAVE_IMAGE ?auto_199703 ?auto_199704 ) ( not ( = ?auto_199698 ?auto_199700 ) ) ( not ( = ?auto_199698 ?auto_199701 ) ) ( not ( = ?auto_199698 ?auto_199703 ) ) ( not ( = ?auto_199698 ?auto_199705 ) ) ( not ( = ?auto_199699 ?auto_199697 ) ) ( not ( = ?auto_199699 ?auto_199702 ) ) ( not ( = ?auto_199699 ?auto_199704 ) ) ( not ( = ?auto_199700 ?auto_199703 ) ) ( not ( = ?auto_199697 ?auto_199704 ) ) ( not ( = ?auto_199701 ?auto_199703 ) ) ( not ( = ?auto_199702 ?auto_199704 ) ) ( not ( = ?auto_199703 ?auto_199705 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_199701 ?auto_199702 ?auto_199700 ?auto_199697 )
      ( GET-4IMAGE-VERIFY ?auto_199698 ?auto_199699 ?auto_199700 ?auto_199697 ?auto_199701 ?auto_199702 ?auto_199703 ?auto_199704 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_199720 - DIRECTION
      ?auto_199721 - MODE
      ?auto_199722 - DIRECTION
      ?auto_199719 - MODE
      ?auto_199723 - DIRECTION
      ?auto_199724 - MODE
      ?auto_199725 - DIRECTION
      ?auto_199726 - MODE
    )
    :vars
    (
      ?auto_199728 - INSTRUMENT
      ?auto_199729 - SATELLITE
      ?auto_199727 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_199728 ?auto_199729 ) ( SUPPORTS ?auto_199728 ?auto_199719 ) ( POINTING ?auto_199729 ?auto_199727 ) ( not ( = ?auto_199722 ?auto_199727 ) ) ( HAVE_IMAGE ?auto_199720 ?auto_199721 ) ( not ( = ?auto_199720 ?auto_199722 ) ) ( not ( = ?auto_199720 ?auto_199727 ) ) ( not ( = ?auto_199721 ?auto_199719 ) ) ( CALIBRATION_TARGET ?auto_199728 ?auto_199727 ) ( POWER_AVAIL ?auto_199729 ) ( HAVE_IMAGE ?auto_199723 ?auto_199724 ) ( HAVE_IMAGE ?auto_199725 ?auto_199726 ) ( not ( = ?auto_199720 ?auto_199723 ) ) ( not ( = ?auto_199720 ?auto_199725 ) ) ( not ( = ?auto_199721 ?auto_199724 ) ) ( not ( = ?auto_199721 ?auto_199726 ) ) ( not ( = ?auto_199722 ?auto_199723 ) ) ( not ( = ?auto_199722 ?auto_199725 ) ) ( not ( = ?auto_199719 ?auto_199724 ) ) ( not ( = ?auto_199719 ?auto_199726 ) ) ( not ( = ?auto_199723 ?auto_199725 ) ) ( not ( = ?auto_199723 ?auto_199727 ) ) ( not ( = ?auto_199724 ?auto_199726 ) ) ( not ( = ?auto_199725 ?auto_199727 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_199720 ?auto_199721 ?auto_199722 ?auto_199719 )
      ( GET-4IMAGE-VERIFY ?auto_199720 ?auto_199721 ?auto_199722 ?auto_199719 ?auto_199723 ?auto_199724 ?auto_199725 ?auto_199726 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_199786 - DIRECTION
      ?auto_199787 - MODE
      ?auto_199788 - DIRECTION
      ?auto_199785 - MODE
      ?auto_199789 - DIRECTION
      ?auto_199790 - MODE
      ?auto_199791 - DIRECTION
      ?auto_199792 - MODE
    )
    :vars
    (
      ?auto_199794 - INSTRUMENT
      ?auto_199795 - SATELLITE
      ?auto_199793 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_199794 ?auto_199795 ) ( SUPPORTS ?auto_199794 ?auto_199792 ) ( POINTING ?auto_199795 ?auto_199793 ) ( not ( = ?auto_199791 ?auto_199793 ) ) ( HAVE_IMAGE ?auto_199788 ?auto_199785 ) ( not ( = ?auto_199788 ?auto_199791 ) ) ( not ( = ?auto_199788 ?auto_199793 ) ) ( not ( = ?auto_199785 ?auto_199792 ) ) ( CALIBRATION_TARGET ?auto_199794 ?auto_199793 ) ( POWER_AVAIL ?auto_199795 ) ( HAVE_IMAGE ?auto_199786 ?auto_199787 ) ( HAVE_IMAGE ?auto_199789 ?auto_199790 ) ( not ( = ?auto_199786 ?auto_199788 ) ) ( not ( = ?auto_199786 ?auto_199789 ) ) ( not ( = ?auto_199786 ?auto_199791 ) ) ( not ( = ?auto_199786 ?auto_199793 ) ) ( not ( = ?auto_199787 ?auto_199785 ) ) ( not ( = ?auto_199787 ?auto_199790 ) ) ( not ( = ?auto_199787 ?auto_199792 ) ) ( not ( = ?auto_199788 ?auto_199789 ) ) ( not ( = ?auto_199785 ?auto_199790 ) ) ( not ( = ?auto_199789 ?auto_199791 ) ) ( not ( = ?auto_199789 ?auto_199793 ) ) ( not ( = ?auto_199790 ?auto_199792 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_199788 ?auto_199785 ?auto_199791 ?auto_199792 )
      ( GET-4IMAGE-VERIFY ?auto_199786 ?auto_199787 ?auto_199788 ?auto_199785 ?auto_199789 ?auto_199790 ?auto_199791 ?auto_199792 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_199819 - DIRECTION
      ?auto_199820 - MODE
      ?auto_199821 - DIRECTION
      ?auto_199818 - MODE
      ?auto_199822 - DIRECTION
      ?auto_199823 - MODE
      ?auto_199824 - DIRECTION
      ?auto_199825 - MODE
    )
    :vars
    (
      ?auto_199827 - INSTRUMENT
      ?auto_199828 - SATELLITE
      ?auto_199826 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_199827 ?auto_199828 ) ( SUPPORTS ?auto_199827 ?auto_199823 ) ( POINTING ?auto_199828 ?auto_199826 ) ( not ( = ?auto_199822 ?auto_199826 ) ) ( HAVE_IMAGE ?auto_199821 ?auto_199818 ) ( not ( = ?auto_199821 ?auto_199822 ) ) ( not ( = ?auto_199821 ?auto_199826 ) ) ( not ( = ?auto_199818 ?auto_199823 ) ) ( CALIBRATION_TARGET ?auto_199827 ?auto_199826 ) ( POWER_AVAIL ?auto_199828 ) ( HAVE_IMAGE ?auto_199819 ?auto_199820 ) ( HAVE_IMAGE ?auto_199824 ?auto_199825 ) ( not ( = ?auto_199819 ?auto_199821 ) ) ( not ( = ?auto_199819 ?auto_199822 ) ) ( not ( = ?auto_199819 ?auto_199824 ) ) ( not ( = ?auto_199819 ?auto_199826 ) ) ( not ( = ?auto_199820 ?auto_199818 ) ) ( not ( = ?auto_199820 ?auto_199823 ) ) ( not ( = ?auto_199820 ?auto_199825 ) ) ( not ( = ?auto_199821 ?auto_199824 ) ) ( not ( = ?auto_199818 ?auto_199825 ) ) ( not ( = ?auto_199822 ?auto_199824 ) ) ( not ( = ?auto_199823 ?auto_199825 ) ) ( not ( = ?auto_199824 ?auto_199826 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_199821 ?auto_199818 ?auto_199822 ?auto_199823 )
      ( GET-4IMAGE-VERIFY ?auto_199819 ?auto_199820 ?auto_199821 ?auto_199818 ?auto_199822 ?auto_199823 ?auto_199824 ?auto_199825 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_199852 - DIRECTION
      ?auto_199853 - MODE
      ?auto_199854 - DIRECTION
      ?auto_199851 - MODE
      ?auto_199855 - DIRECTION
      ?auto_199856 - MODE
      ?auto_199857 - DIRECTION
      ?auto_199858 - MODE
    )
    :vars
    (
      ?auto_199860 - INSTRUMENT
      ?auto_199861 - SATELLITE
      ?auto_199859 - DIRECTION
      ?auto_199863 - DIRECTION
      ?auto_199862 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_199860 ?auto_199861 ) ( SUPPORTS ?auto_199860 ?auto_199858 ) ( POINTING ?auto_199861 ?auto_199859 ) ( not ( = ?auto_199857 ?auto_199859 ) ) ( HAVE_IMAGE ?auto_199863 ?auto_199862 ) ( not ( = ?auto_199863 ?auto_199857 ) ) ( not ( = ?auto_199863 ?auto_199859 ) ) ( not ( = ?auto_199862 ?auto_199858 ) ) ( CALIBRATION_TARGET ?auto_199860 ?auto_199859 ) ( POWER_AVAIL ?auto_199861 ) ( HAVE_IMAGE ?auto_199852 ?auto_199853 ) ( HAVE_IMAGE ?auto_199854 ?auto_199851 ) ( HAVE_IMAGE ?auto_199855 ?auto_199856 ) ( not ( = ?auto_199852 ?auto_199854 ) ) ( not ( = ?auto_199852 ?auto_199855 ) ) ( not ( = ?auto_199852 ?auto_199857 ) ) ( not ( = ?auto_199852 ?auto_199859 ) ) ( not ( = ?auto_199852 ?auto_199863 ) ) ( not ( = ?auto_199853 ?auto_199851 ) ) ( not ( = ?auto_199853 ?auto_199856 ) ) ( not ( = ?auto_199853 ?auto_199858 ) ) ( not ( = ?auto_199853 ?auto_199862 ) ) ( not ( = ?auto_199854 ?auto_199855 ) ) ( not ( = ?auto_199854 ?auto_199857 ) ) ( not ( = ?auto_199854 ?auto_199859 ) ) ( not ( = ?auto_199854 ?auto_199863 ) ) ( not ( = ?auto_199851 ?auto_199856 ) ) ( not ( = ?auto_199851 ?auto_199858 ) ) ( not ( = ?auto_199851 ?auto_199862 ) ) ( not ( = ?auto_199855 ?auto_199857 ) ) ( not ( = ?auto_199855 ?auto_199859 ) ) ( not ( = ?auto_199855 ?auto_199863 ) ) ( not ( = ?auto_199856 ?auto_199858 ) ) ( not ( = ?auto_199856 ?auto_199862 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_199863 ?auto_199862 ?auto_199857 ?auto_199858 )
      ( GET-4IMAGE-VERIFY ?auto_199852 ?auto_199853 ?auto_199854 ?auto_199851 ?auto_199855 ?auto_199856 ?auto_199857 ?auto_199858 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_199865 - DIRECTION
      ?auto_199866 - MODE
      ?auto_199867 - DIRECTION
      ?auto_199864 - MODE
      ?auto_199868 - DIRECTION
      ?auto_199869 - MODE
      ?auto_199870 - DIRECTION
      ?auto_199871 - MODE
    )
    :vars
    (
      ?auto_199873 - INSTRUMENT
      ?auto_199874 - SATELLITE
      ?auto_199872 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_199873 ?auto_199874 ) ( SUPPORTS ?auto_199873 ?auto_199869 ) ( POINTING ?auto_199874 ?auto_199872 ) ( not ( = ?auto_199868 ?auto_199872 ) ) ( HAVE_IMAGE ?auto_199870 ?auto_199871 ) ( not ( = ?auto_199870 ?auto_199868 ) ) ( not ( = ?auto_199870 ?auto_199872 ) ) ( not ( = ?auto_199871 ?auto_199869 ) ) ( CALIBRATION_TARGET ?auto_199873 ?auto_199872 ) ( POWER_AVAIL ?auto_199874 ) ( HAVE_IMAGE ?auto_199865 ?auto_199866 ) ( HAVE_IMAGE ?auto_199867 ?auto_199864 ) ( not ( = ?auto_199865 ?auto_199867 ) ) ( not ( = ?auto_199865 ?auto_199868 ) ) ( not ( = ?auto_199865 ?auto_199870 ) ) ( not ( = ?auto_199865 ?auto_199872 ) ) ( not ( = ?auto_199866 ?auto_199864 ) ) ( not ( = ?auto_199866 ?auto_199869 ) ) ( not ( = ?auto_199866 ?auto_199871 ) ) ( not ( = ?auto_199867 ?auto_199868 ) ) ( not ( = ?auto_199867 ?auto_199870 ) ) ( not ( = ?auto_199867 ?auto_199872 ) ) ( not ( = ?auto_199864 ?auto_199869 ) ) ( not ( = ?auto_199864 ?auto_199871 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_199870 ?auto_199871 ?auto_199868 ?auto_199869 )
      ( GET-4IMAGE-VERIFY ?auto_199865 ?auto_199866 ?auto_199867 ?auto_199864 ?auto_199868 ?auto_199869 ?auto_199870 ?auto_199871 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_199876 - DIRECTION
      ?auto_199877 - MODE
      ?auto_199878 - DIRECTION
      ?auto_199875 - MODE
      ?auto_199879 - DIRECTION
      ?auto_199880 - MODE
      ?auto_199881 - DIRECTION
      ?auto_199882 - MODE
    )
    :vars
    (
      ?auto_199884 - INSTRUMENT
      ?auto_199885 - SATELLITE
      ?auto_199883 - DIRECTION
      ?auto_199887 - DIRECTION
      ?auto_199886 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_199884 ?auto_199885 ) ( SUPPORTS ?auto_199884 ?auto_199880 ) ( POINTING ?auto_199885 ?auto_199883 ) ( not ( = ?auto_199879 ?auto_199883 ) ) ( HAVE_IMAGE ?auto_199887 ?auto_199886 ) ( not ( = ?auto_199887 ?auto_199879 ) ) ( not ( = ?auto_199887 ?auto_199883 ) ) ( not ( = ?auto_199886 ?auto_199880 ) ) ( CALIBRATION_TARGET ?auto_199884 ?auto_199883 ) ( POWER_AVAIL ?auto_199885 ) ( HAVE_IMAGE ?auto_199876 ?auto_199877 ) ( HAVE_IMAGE ?auto_199878 ?auto_199875 ) ( HAVE_IMAGE ?auto_199881 ?auto_199882 ) ( not ( = ?auto_199876 ?auto_199878 ) ) ( not ( = ?auto_199876 ?auto_199879 ) ) ( not ( = ?auto_199876 ?auto_199881 ) ) ( not ( = ?auto_199876 ?auto_199883 ) ) ( not ( = ?auto_199876 ?auto_199887 ) ) ( not ( = ?auto_199877 ?auto_199875 ) ) ( not ( = ?auto_199877 ?auto_199880 ) ) ( not ( = ?auto_199877 ?auto_199882 ) ) ( not ( = ?auto_199877 ?auto_199886 ) ) ( not ( = ?auto_199878 ?auto_199879 ) ) ( not ( = ?auto_199878 ?auto_199881 ) ) ( not ( = ?auto_199878 ?auto_199883 ) ) ( not ( = ?auto_199878 ?auto_199887 ) ) ( not ( = ?auto_199875 ?auto_199880 ) ) ( not ( = ?auto_199875 ?auto_199882 ) ) ( not ( = ?auto_199875 ?auto_199886 ) ) ( not ( = ?auto_199879 ?auto_199881 ) ) ( not ( = ?auto_199880 ?auto_199882 ) ) ( not ( = ?auto_199881 ?auto_199883 ) ) ( not ( = ?auto_199881 ?auto_199887 ) ) ( not ( = ?auto_199882 ?auto_199886 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_199887 ?auto_199886 ?auto_199879 ?auto_199880 )
      ( GET-4IMAGE-VERIFY ?auto_199876 ?auto_199877 ?auto_199878 ?auto_199875 ?auto_199879 ?auto_199880 ?auto_199881 ?auto_199882 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_199902 - DIRECTION
      ?auto_199903 - MODE
      ?auto_199904 - DIRECTION
      ?auto_199901 - MODE
      ?auto_199905 - DIRECTION
      ?auto_199906 - MODE
      ?auto_199907 - DIRECTION
      ?auto_199908 - MODE
    )
    :vars
    (
      ?auto_199910 - INSTRUMENT
      ?auto_199911 - SATELLITE
      ?auto_199909 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_199910 ?auto_199911 ) ( SUPPORTS ?auto_199910 ?auto_199901 ) ( POINTING ?auto_199911 ?auto_199909 ) ( not ( = ?auto_199904 ?auto_199909 ) ) ( HAVE_IMAGE ?auto_199907 ?auto_199906 ) ( not ( = ?auto_199907 ?auto_199904 ) ) ( not ( = ?auto_199907 ?auto_199909 ) ) ( not ( = ?auto_199906 ?auto_199901 ) ) ( CALIBRATION_TARGET ?auto_199910 ?auto_199909 ) ( POWER_AVAIL ?auto_199911 ) ( HAVE_IMAGE ?auto_199902 ?auto_199903 ) ( HAVE_IMAGE ?auto_199905 ?auto_199906 ) ( HAVE_IMAGE ?auto_199907 ?auto_199908 ) ( not ( = ?auto_199902 ?auto_199904 ) ) ( not ( = ?auto_199902 ?auto_199905 ) ) ( not ( = ?auto_199902 ?auto_199907 ) ) ( not ( = ?auto_199902 ?auto_199909 ) ) ( not ( = ?auto_199903 ?auto_199901 ) ) ( not ( = ?auto_199903 ?auto_199906 ) ) ( not ( = ?auto_199903 ?auto_199908 ) ) ( not ( = ?auto_199904 ?auto_199905 ) ) ( not ( = ?auto_199901 ?auto_199908 ) ) ( not ( = ?auto_199905 ?auto_199907 ) ) ( not ( = ?auto_199905 ?auto_199909 ) ) ( not ( = ?auto_199906 ?auto_199908 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_199907 ?auto_199906 ?auto_199904 ?auto_199901 )
      ( GET-4IMAGE-VERIFY ?auto_199902 ?auto_199903 ?auto_199904 ?auto_199901 ?auto_199905 ?auto_199906 ?auto_199907 ?auto_199908 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_199935 - DIRECTION
      ?auto_199936 - MODE
      ?auto_199937 - DIRECTION
      ?auto_199934 - MODE
      ?auto_199938 - DIRECTION
      ?auto_199939 - MODE
      ?auto_199940 - DIRECTION
      ?auto_199941 - MODE
    )
    :vars
    (
      ?auto_199943 - INSTRUMENT
      ?auto_199944 - SATELLITE
      ?auto_199942 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_199943 ?auto_199944 ) ( SUPPORTS ?auto_199943 ?auto_199934 ) ( POINTING ?auto_199944 ?auto_199942 ) ( not ( = ?auto_199937 ?auto_199942 ) ) ( HAVE_IMAGE ?auto_199940 ?auto_199941 ) ( not ( = ?auto_199940 ?auto_199937 ) ) ( not ( = ?auto_199940 ?auto_199942 ) ) ( not ( = ?auto_199941 ?auto_199934 ) ) ( CALIBRATION_TARGET ?auto_199943 ?auto_199942 ) ( POWER_AVAIL ?auto_199944 ) ( HAVE_IMAGE ?auto_199935 ?auto_199936 ) ( HAVE_IMAGE ?auto_199938 ?auto_199939 ) ( not ( = ?auto_199935 ?auto_199937 ) ) ( not ( = ?auto_199935 ?auto_199938 ) ) ( not ( = ?auto_199935 ?auto_199940 ) ) ( not ( = ?auto_199935 ?auto_199942 ) ) ( not ( = ?auto_199936 ?auto_199934 ) ) ( not ( = ?auto_199936 ?auto_199939 ) ) ( not ( = ?auto_199936 ?auto_199941 ) ) ( not ( = ?auto_199937 ?auto_199938 ) ) ( not ( = ?auto_199934 ?auto_199939 ) ) ( not ( = ?auto_199938 ?auto_199940 ) ) ( not ( = ?auto_199938 ?auto_199942 ) ) ( not ( = ?auto_199939 ?auto_199941 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_199940 ?auto_199941 ?auto_199937 ?auto_199934 )
      ( GET-4IMAGE-VERIFY ?auto_199935 ?auto_199936 ?auto_199937 ?auto_199934 ?auto_199938 ?auto_199939 ?auto_199940 ?auto_199941 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_199946 - DIRECTION
      ?auto_199947 - MODE
      ?auto_199948 - DIRECTION
      ?auto_199945 - MODE
      ?auto_199949 - DIRECTION
      ?auto_199950 - MODE
      ?auto_199951 - DIRECTION
      ?auto_199952 - MODE
    )
    :vars
    (
      ?auto_199954 - INSTRUMENT
      ?auto_199955 - SATELLITE
      ?auto_199953 - DIRECTION
      ?auto_199957 - DIRECTION
      ?auto_199956 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_199954 ?auto_199955 ) ( SUPPORTS ?auto_199954 ?auto_199945 ) ( POINTING ?auto_199955 ?auto_199953 ) ( not ( = ?auto_199948 ?auto_199953 ) ) ( HAVE_IMAGE ?auto_199957 ?auto_199956 ) ( not ( = ?auto_199957 ?auto_199948 ) ) ( not ( = ?auto_199957 ?auto_199953 ) ) ( not ( = ?auto_199956 ?auto_199945 ) ) ( CALIBRATION_TARGET ?auto_199954 ?auto_199953 ) ( POWER_AVAIL ?auto_199955 ) ( HAVE_IMAGE ?auto_199946 ?auto_199947 ) ( HAVE_IMAGE ?auto_199949 ?auto_199950 ) ( HAVE_IMAGE ?auto_199951 ?auto_199952 ) ( not ( = ?auto_199946 ?auto_199948 ) ) ( not ( = ?auto_199946 ?auto_199949 ) ) ( not ( = ?auto_199946 ?auto_199951 ) ) ( not ( = ?auto_199946 ?auto_199953 ) ) ( not ( = ?auto_199946 ?auto_199957 ) ) ( not ( = ?auto_199947 ?auto_199945 ) ) ( not ( = ?auto_199947 ?auto_199950 ) ) ( not ( = ?auto_199947 ?auto_199952 ) ) ( not ( = ?auto_199947 ?auto_199956 ) ) ( not ( = ?auto_199948 ?auto_199949 ) ) ( not ( = ?auto_199948 ?auto_199951 ) ) ( not ( = ?auto_199945 ?auto_199950 ) ) ( not ( = ?auto_199945 ?auto_199952 ) ) ( not ( = ?auto_199949 ?auto_199951 ) ) ( not ( = ?auto_199949 ?auto_199953 ) ) ( not ( = ?auto_199949 ?auto_199957 ) ) ( not ( = ?auto_199950 ?auto_199952 ) ) ( not ( = ?auto_199950 ?auto_199956 ) ) ( not ( = ?auto_199951 ?auto_199953 ) ) ( not ( = ?auto_199951 ?auto_199957 ) ) ( not ( = ?auto_199952 ?auto_199956 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_199957 ?auto_199956 ?auto_199948 ?auto_199945 )
      ( GET-4IMAGE-VERIFY ?auto_199946 ?auto_199947 ?auto_199948 ?auto_199945 ?auto_199949 ?auto_199950 ?auto_199951 ?auto_199952 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_200020 - DIRECTION
      ?auto_200021 - MODE
      ?auto_200022 - DIRECTION
      ?auto_200019 - MODE
      ?auto_200023 - DIRECTION
      ?auto_200024 - MODE
      ?auto_200025 - DIRECTION
      ?auto_200026 - MODE
    )
    :vars
    (
      ?auto_200028 - INSTRUMENT
      ?auto_200029 - SATELLITE
      ?auto_200027 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200028 ?auto_200029 ) ( SUPPORTS ?auto_200028 ?auto_200021 ) ( POINTING ?auto_200029 ?auto_200027 ) ( not ( = ?auto_200020 ?auto_200027 ) ) ( HAVE_IMAGE ?auto_200022 ?auto_200019 ) ( not ( = ?auto_200022 ?auto_200020 ) ) ( not ( = ?auto_200022 ?auto_200027 ) ) ( not ( = ?auto_200019 ?auto_200021 ) ) ( CALIBRATION_TARGET ?auto_200028 ?auto_200027 ) ( POWER_AVAIL ?auto_200029 ) ( HAVE_IMAGE ?auto_200023 ?auto_200024 ) ( HAVE_IMAGE ?auto_200025 ?auto_200026 ) ( not ( = ?auto_200020 ?auto_200023 ) ) ( not ( = ?auto_200020 ?auto_200025 ) ) ( not ( = ?auto_200021 ?auto_200024 ) ) ( not ( = ?auto_200021 ?auto_200026 ) ) ( not ( = ?auto_200022 ?auto_200023 ) ) ( not ( = ?auto_200022 ?auto_200025 ) ) ( not ( = ?auto_200019 ?auto_200024 ) ) ( not ( = ?auto_200019 ?auto_200026 ) ) ( not ( = ?auto_200023 ?auto_200025 ) ) ( not ( = ?auto_200023 ?auto_200027 ) ) ( not ( = ?auto_200024 ?auto_200026 ) ) ( not ( = ?auto_200025 ?auto_200027 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200022 ?auto_200019 ?auto_200020 ?auto_200021 )
      ( GET-4IMAGE-VERIFY ?auto_200020 ?auto_200021 ?auto_200022 ?auto_200019 ?auto_200023 ?auto_200024 ?auto_200025 ?auto_200026 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_200108 - DIRECTION
      ?auto_200109 - MODE
      ?auto_200110 - DIRECTION
      ?auto_200107 - MODE
      ?auto_200111 - DIRECTION
      ?auto_200112 - MODE
      ?auto_200113 - DIRECTION
      ?auto_200114 - MODE
    )
    :vars
    (
      ?auto_200116 - INSTRUMENT
      ?auto_200117 - SATELLITE
      ?auto_200115 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200116 ?auto_200117 ) ( SUPPORTS ?auto_200116 ?auto_200109 ) ( POINTING ?auto_200117 ?auto_200115 ) ( not ( = ?auto_200108 ?auto_200115 ) ) ( HAVE_IMAGE ?auto_200111 ?auto_200112 ) ( not ( = ?auto_200111 ?auto_200108 ) ) ( not ( = ?auto_200111 ?auto_200115 ) ) ( not ( = ?auto_200112 ?auto_200109 ) ) ( CALIBRATION_TARGET ?auto_200116 ?auto_200115 ) ( POWER_AVAIL ?auto_200117 ) ( HAVE_IMAGE ?auto_200110 ?auto_200107 ) ( HAVE_IMAGE ?auto_200113 ?auto_200114 ) ( not ( = ?auto_200108 ?auto_200110 ) ) ( not ( = ?auto_200108 ?auto_200113 ) ) ( not ( = ?auto_200109 ?auto_200107 ) ) ( not ( = ?auto_200109 ?auto_200114 ) ) ( not ( = ?auto_200110 ?auto_200111 ) ) ( not ( = ?auto_200110 ?auto_200113 ) ) ( not ( = ?auto_200110 ?auto_200115 ) ) ( not ( = ?auto_200107 ?auto_200112 ) ) ( not ( = ?auto_200107 ?auto_200114 ) ) ( not ( = ?auto_200111 ?auto_200113 ) ) ( not ( = ?auto_200112 ?auto_200114 ) ) ( not ( = ?auto_200113 ?auto_200115 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200111 ?auto_200112 ?auto_200108 ?auto_200109 )
      ( GET-4IMAGE-VERIFY ?auto_200108 ?auto_200109 ?auto_200110 ?auto_200107 ?auto_200111 ?auto_200112 ?auto_200113 ?auto_200114 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_200141 - DIRECTION
      ?auto_200142 - MODE
      ?auto_200143 - DIRECTION
      ?auto_200140 - MODE
      ?auto_200144 - DIRECTION
      ?auto_200145 - MODE
      ?auto_200146 - DIRECTION
      ?auto_200147 - MODE
    )
    :vars
    (
      ?auto_200149 - INSTRUMENT
      ?auto_200150 - SATELLITE
      ?auto_200148 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200149 ?auto_200150 ) ( SUPPORTS ?auto_200149 ?auto_200142 ) ( POINTING ?auto_200150 ?auto_200148 ) ( not ( = ?auto_200141 ?auto_200148 ) ) ( HAVE_IMAGE ?auto_200146 ?auto_200147 ) ( not ( = ?auto_200146 ?auto_200141 ) ) ( not ( = ?auto_200146 ?auto_200148 ) ) ( not ( = ?auto_200147 ?auto_200142 ) ) ( CALIBRATION_TARGET ?auto_200149 ?auto_200148 ) ( POWER_AVAIL ?auto_200150 ) ( HAVE_IMAGE ?auto_200143 ?auto_200140 ) ( HAVE_IMAGE ?auto_200144 ?auto_200145 ) ( not ( = ?auto_200141 ?auto_200143 ) ) ( not ( = ?auto_200141 ?auto_200144 ) ) ( not ( = ?auto_200142 ?auto_200140 ) ) ( not ( = ?auto_200142 ?auto_200145 ) ) ( not ( = ?auto_200143 ?auto_200144 ) ) ( not ( = ?auto_200143 ?auto_200146 ) ) ( not ( = ?auto_200143 ?auto_200148 ) ) ( not ( = ?auto_200140 ?auto_200145 ) ) ( not ( = ?auto_200140 ?auto_200147 ) ) ( not ( = ?auto_200144 ?auto_200146 ) ) ( not ( = ?auto_200144 ?auto_200148 ) ) ( not ( = ?auto_200145 ?auto_200147 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200146 ?auto_200147 ?auto_200141 ?auto_200142 )
      ( GET-4IMAGE-VERIFY ?auto_200141 ?auto_200142 ?auto_200143 ?auto_200140 ?auto_200144 ?auto_200145 ?auto_200146 ?auto_200147 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_200152 - DIRECTION
      ?auto_200153 - MODE
      ?auto_200154 - DIRECTION
      ?auto_200151 - MODE
      ?auto_200155 - DIRECTION
      ?auto_200156 - MODE
      ?auto_200157 - DIRECTION
      ?auto_200158 - MODE
    )
    :vars
    (
      ?auto_200160 - INSTRUMENT
      ?auto_200161 - SATELLITE
      ?auto_200159 - DIRECTION
      ?auto_200163 - DIRECTION
      ?auto_200162 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_200160 ?auto_200161 ) ( SUPPORTS ?auto_200160 ?auto_200153 ) ( POINTING ?auto_200161 ?auto_200159 ) ( not ( = ?auto_200152 ?auto_200159 ) ) ( HAVE_IMAGE ?auto_200163 ?auto_200162 ) ( not ( = ?auto_200163 ?auto_200152 ) ) ( not ( = ?auto_200163 ?auto_200159 ) ) ( not ( = ?auto_200162 ?auto_200153 ) ) ( CALIBRATION_TARGET ?auto_200160 ?auto_200159 ) ( POWER_AVAIL ?auto_200161 ) ( HAVE_IMAGE ?auto_200154 ?auto_200151 ) ( HAVE_IMAGE ?auto_200155 ?auto_200156 ) ( HAVE_IMAGE ?auto_200157 ?auto_200158 ) ( not ( = ?auto_200152 ?auto_200154 ) ) ( not ( = ?auto_200152 ?auto_200155 ) ) ( not ( = ?auto_200152 ?auto_200157 ) ) ( not ( = ?auto_200153 ?auto_200151 ) ) ( not ( = ?auto_200153 ?auto_200156 ) ) ( not ( = ?auto_200153 ?auto_200158 ) ) ( not ( = ?auto_200154 ?auto_200155 ) ) ( not ( = ?auto_200154 ?auto_200157 ) ) ( not ( = ?auto_200154 ?auto_200159 ) ) ( not ( = ?auto_200154 ?auto_200163 ) ) ( not ( = ?auto_200151 ?auto_200156 ) ) ( not ( = ?auto_200151 ?auto_200158 ) ) ( not ( = ?auto_200151 ?auto_200162 ) ) ( not ( = ?auto_200155 ?auto_200157 ) ) ( not ( = ?auto_200155 ?auto_200159 ) ) ( not ( = ?auto_200155 ?auto_200163 ) ) ( not ( = ?auto_200156 ?auto_200158 ) ) ( not ( = ?auto_200156 ?auto_200162 ) ) ( not ( = ?auto_200157 ?auto_200159 ) ) ( not ( = ?auto_200157 ?auto_200163 ) ) ( not ( = ?auto_200158 ?auto_200162 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200163 ?auto_200162 ?auto_200152 ?auto_200153 )
      ( GET-4IMAGE-VERIFY ?auto_200152 ?auto_200153 ?auto_200154 ?auto_200151 ?auto_200155 ?auto_200156 ?auto_200157 ?auto_200158 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_200321 - DIRECTION
      ?auto_200322 - MODE
    )
    :vars
    (
      ?auto_200324 - INSTRUMENT
      ?auto_200325 - SATELLITE
      ?auto_200323 - DIRECTION
      ?auto_200327 - DIRECTION
      ?auto_200326 - MODE
      ?auto_200328 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200324 ?auto_200325 ) ( SUPPORTS ?auto_200324 ?auto_200322 ) ( not ( = ?auto_200321 ?auto_200323 ) ) ( HAVE_IMAGE ?auto_200327 ?auto_200326 ) ( not ( = ?auto_200327 ?auto_200321 ) ) ( not ( = ?auto_200327 ?auto_200323 ) ) ( not ( = ?auto_200326 ?auto_200322 ) ) ( CALIBRATION_TARGET ?auto_200324 ?auto_200323 ) ( POWER_AVAIL ?auto_200325 ) ( POINTING ?auto_200325 ?auto_200328 ) ( not ( = ?auto_200323 ?auto_200328 ) ) ( not ( = ?auto_200321 ?auto_200328 ) ) ( not ( = ?auto_200327 ?auto_200328 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_200325 ?auto_200323 ?auto_200328 )
      ( GET-2IMAGE ?auto_200327 ?auto_200326 ?auto_200321 ?auto_200322 )
      ( GET-1IMAGE-VERIFY ?auto_200321 ?auto_200322 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_200330 - DIRECTION
      ?auto_200331 - MODE
      ?auto_200332 - DIRECTION
      ?auto_200329 - MODE
    )
    :vars
    (
      ?auto_200333 - INSTRUMENT
      ?auto_200334 - SATELLITE
      ?auto_200335 - DIRECTION
      ?auto_200336 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200333 ?auto_200334 ) ( SUPPORTS ?auto_200333 ?auto_200329 ) ( not ( = ?auto_200332 ?auto_200335 ) ) ( HAVE_IMAGE ?auto_200330 ?auto_200331 ) ( not ( = ?auto_200330 ?auto_200332 ) ) ( not ( = ?auto_200330 ?auto_200335 ) ) ( not ( = ?auto_200331 ?auto_200329 ) ) ( CALIBRATION_TARGET ?auto_200333 ?auto_200335 ) ( POWER_AVAIL ?auto_200334 ) ( POINTING ?auto_200334 ?auto_200336 ) ( not ( = ?auto_200335 ?auto_200336 ) ) ( not ( = ?auto_200332 ?auto_200336 ) ) ( not ( = ?auto_200330 ?auto_200336 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_200332 ?auto_200329 )
      ( GET-2IMAGE-VERIFY ?auto_200330 ?auto_200331 ?auto_200332 ?auto_200329 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_200338 - DIRECTION
      ?auto_200339 - MODE
      ?auto_200340 - DIRECTION
      ?auto_200337 - MODE
    )
    :vars
    (
      ?auto_200344 - INSTRUMENT
      ?auto_200345 - SATELLITE
      ?auto_200342 - DIRECTION
      ?auto_200343 - DIRECTION
      ?auto_200341 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_200344 ?auto_200345 ) ( SUPPORTS ?auto_200344 ?auto_200337 ) ( not ( = ?auto_200340 ?auto_200342 ) ) ( HAVE_IMAGE ?auto_200343 ?auto_200341 ) ( not ( = ?auto_200343 ?auto_200340 ) ) ( not ( = ?auto_200343 ?auto_200342 ) ) ( not ( = ?auto_200341 ?auto_200337 ) ) ( CALIBRATION_TARGET ?auto_200344 ?auto_200342 ) ( POWER_AVAIL ?auto_200345 ) ( POINTING ?auto_200345 ?auto_200338 ) ( not ( = ?auto_200342 ?auto_200338 ) ) ( not ( = ?auto_200340 ?auto_200338 ) ) ( not ( = ?auto_200343 ?auto_200338 ) ) ( HAVE_IMAGE ?auto_200338 ?auto_200339 ) ( not ( = ?auto_200339 ?auto_200337 ) ) ( not ( = ?auto_200339 ?auto_200341 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200343 ?auto_200341 ?auto_200340 ?auto_200337 )
      ( GET-2IMAGE-VERIFY ?auto_200338 ?auto_200339 ?auto_200340 ?auto_200337 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_200347 - DIRECTION
      ?auto_200348 - MODE
      ?auto_200349 - DIRECTION
      ?auto_200346 - MODE
    )
    :vars
    (
      ?auto_200351 - INSTRUMENT
      ?auto_200352 - SATELLITE
      ?auto_200350 - DIRECTION
      ?auto_200353 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200351 ?auto_200352 ) ( SUPPORTS ?auto_200351 ?auto_200348 ) ( not ( = ?auto_200347 ?auto_200350 ) ) ( HAVE_IMAGE ?auto_200349 ?auto_200346 ) ( not ( = ?auto_200349 ?auto_200347 ) ) ( not ( = ?auto_200349 ?auto_200350 ) ) ( not ( = ?auto_200346 ?auto_200348 ) ) ( CALIBRATION_TARGET ?auto_200351 ?auto_200350 ) ( POWER_AVAIL ?auto_200352 ) ( POINTING ?auto_200352 ?auto_200353 ) ( not ( = ?auto_200350 ?auto_200353 ) ) ( not ( = ?auto_200347 ?auto_200353 ) ) ( not ( = ?auto_200349 ?auto_200353 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200349 ?auto_200346 ?auto_200347 ?auto_200348 )
      ( GET-2IMAGE-VERIFY ?auto_200347 ?auto_200348 ?auto_200349 ?auto_200346 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_200355 - DIRECTION
      ?auto_200356 - MODE
      ?auto_200357 - DIRECTION
      ?auto_200354 - MODE
    )
    :vars
    (
      ?auto_200361 - INSTRUMENT
      ?auto_200362 - SATELLITE
      ?auto_200359 - DIRECTION
      ?auto_200360 - DIRECTION
      ?auto_200358 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_200361 ?auto_200362 ) ( SUPPORTS ?auto_200361 ?auto_200356 ) ( not ( = ?auto_200355 ?auto_200359 ) ) ( HAVE_IMAGE ?auto_200360 ?auto_200358 ) ( not ( = ?auto_200360 ?auto_200355 ) ) ( not ( = ?auto_200360 ?auto_200359 ) ) ( not ( = ?auto_200358 ?auto_200356 ) ) ( CALIBRATION_TARGET ?auto_200361 ?auto_200359 ) ( POWER_AVAIL ?auto_200362 ) ( POINTING ?auto_200362 ?auto_200357 ) ( not ( = ?auto_200359 ?auto_200357 ) ) ( not ( = ?auto_200355 ?auto_200357 ) ) ( not ( = ?auto_200360 ?auto_200357 ) ) ( HAVE_IMAGE ?auto_200357 ?auto_200354 ) ( not ( = ?auto_200356 ?auto_200354 ) ) ( not ( = ?auto_200354 ?auto_200358 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200360 ?auto_200358 ?auto_200355 ?auto_200356 )
      ( GET-2IMAGE-VERIFY ?auto_200355 ?auto_200356 ?auto_200357 ?auto_200354 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_200374 - DIRECTION
      ?auto_200375 - MODE
      ?auto_200376 - DIRECTION
      ?auto_200373 - MODE
      ?auto_200377 - DIRECTION
      ?auto_200378 - MODE
    )
    :vars
    (
      ?auto_200380 - INSTRUMENT
      ?auto_200381 - SATELLITE
      ?auto_200379 - DIRECTION
      ?auto_200382 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200380 ?auto_200381 ) ( SUPPORTS ?auto_200380 ?auto_200378 ) ( not ( = ?auto_200377 ?auto_200379 ) ) ( HAVE_IMAGE ?auto_200376 ?auto_200375 ) ( not ( = ?auto_200376 ?auto_200377 ) ) ( not ( = ?auto_200376 ?auto_200379 ) ) ( not ( = ?auto_200375 ?auto_200378 ) ) ( CALIBRATION_TARGET ?auto_200380 ?auto_200379 ) ( POWER_AVAIL ?auto_200381 ) ( POINTING ?auto_200381 ?auto_200382 ) ( not ( = ?auto_200379 ?auto_200382 ) ) ( not ( = ?auto_200377 ?auto_200382 ) ) ( not ( = ?auto_200376 ?auto_200382 ) ) ( HAVE_IMAGE ?auto_200374 ?auto_200375 ) ( HAVE_IMAGE ?auto_200376 ?auto_200373 ) ( not ( = ?auto_200374 ?auto_200376 ) ) ( not ( = ?auto_200374 ?auto_200377 ) ) ( not ( = ?auto_200374 ?auto_200379 ) ) ( not ( = ?auto_200374 ?auto_200382 ) ) ( not ( = ?auto_200375 ?auto_200373 ) ) ( not ( = ?auto_200373 ?auto_200378 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200376 ?auto_200375 ?auto_200377 ?auto_200378 )
      ( GET-3IMAGE-VERIFY ?auto_200374 ?auto_200375 ?auto_200376 ?auto_200373 ?auto_200377 ?auto_200378 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_200384 - DIRECTION
      ?auto_200385 - MODE
      ?auto_200386 - DIRECTION
      ?auto_200383 - MODE
      ?auto_200387 - DIRECTION
      ?auto_200388 - MODE
    )
    :vars
    (
      ?auto_200390 - INSTRUMENT
      ?auto_200391 - SATELLITE
      ?auto_200389 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200390 ?auto_200391 ) ( SUPPORTS ?auto_200390 ?auto_200388 ) ( not ( = ?auto_200387 ?auto_200389 ) ) ( HAVE_IMAGE ?auto_200384 ?auto_200385 ) ( not ( = ?auto_200384 ?auto_200387 ) ) ( not ( = ?auto_200384 ?auto_200389 ) ) ( not ( = ?auto_200385 ?auto_200388 ) ) ( CALIBRATION_TARGET ?auto_200390 ?auto_200389 ) ( POWER_AVAIL ?auto_200391 ) ( POINTING ?auto_200391 ?auto_200386 ) ( not ( = ?auto_200389 ?auto_200386 ) ) ( not ( = ?auto_200387 ?auto_200386 ) ) ( not ( = ?auto_200384 ?auto_200386 ) ) ( HAVE_IMAGE ?auto_200386 ?auto_200383 ) ( not ( = ?auto_200385 ?auto_200383 ) ) ( not ( = ?auto_200383 ?auto_200388 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200384 ?auto_200385 ?auto_200387 ?auto_200388 )
      ( GET-3IMAGE-VERIFY ?auto_200384 ?auto_200385 ?auto_200386 ?auto_200383 ?auto_200387 ?auto_200388 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_200393 - DIRECTION
      ?auto_200394 - MODE
      ?auto_200395 - DIRECTION
      ?auto_200392 - MODE
      ?auto_200396 - DIRECTION
      ?auto_200397 - MODE
    )
    :vars
    (
      ?auto_200399 - INSTRUMENT
      ?auto_200400 - SATELLITE
      ?auto_200398 - DIRECTION
      ?auto_200401 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200399 ?auto_200400 ) ( SUPPORTS ?auto_200399 ?auto_200392 ) ( not ( = ?auto_200395 ?auto_200398 ) ) ( HAVE_IMAGE ?auto_200396 ?auto_200397 ) ( not ( = ?auto_200396 ?auto_200395 ) ) ( not ( = ?auto_200396 ?auto_200398 ) ) ( not ( = ?auto_200397 ?auto_200392 ) ) ( CALIBRATION_TARGET ?auto_200399 ?auto_200398 ) ( POWER_AVAIL ?auto_200400 ) ( POINTING ?auto_200400 ?auto_200401 ) ( not ( = ?auto_200398 ?auto_200401 ) ) ( not ( = ?auto_200395 ?auto_200401 ) ) ( not ( = ?auto_200396 ?auto_200401 ) ) ( HAVE_IMAGE ?auto_200393 ?auto_200394 ) ( not ( = ?auto_200393 ?auto_200395 ) ) ( not ( = ?auto_200393 ?auto_200396 ) ) ( not ( = ?auto_200393 ?auto_200398 ) ) ( not ( = ?auto_200393 ?auto_200401 ) ) ( not ( = ?auto_200394 ?auto_200392 ) ) ( not ( = ?auto_200394 ?auto_200397 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200396 ?auto_200397 ?auto_200395 ?auto_200392 )
      ( GET-3IMAGE-VERIFY ?auto_200393 ?auto_200394 ?auto_200395 ?auto_200392 ?auto_200396 ?auto_200397 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_200403 - DIRECTION
      ?auto_200404 - MODE
      ?auto_200405 - DIRECTION
      ?auto_200402 - MODE
      ?auto_200406 - DIRECTION
      ?auto_200407 - MODE
    )
    :vars
    (
      ?auto_200409 - INSTRUMENT
      ?auto_200410 - SATELLITE
      ?auto_200408 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200409 ?auto_200410 ) ( SUPPORTS ?auto_200409 ?auto_200402 ) ( not ( = ?auto_200405 ?auto_200408 ) ) ( HAVE_IMAGE ?auto_200403 ?auto_200404 ) ( not ( = ?auto_200403 ?auto_200405 ) ) ( not ( = ?auto_200403 ?auto_200408 ) ) ( not ( = ?auto_200404 ?auto_200402 ) ) ( CALIBRATION_TARGET ?auto_200409 ?auto_200408 ) ( POWER_AVAIL ?auto_200410 ) ( POINTING ?auto_200410 ?auto_200406 ) ( not ( = ?auto_200408 ?auto_200406 ) ) ( not ( = ?auto_200405 ?auto_200406 ) ) ( not ( = ?auto_200403 ?auto_200406 ) ) ( HAVE_IMAGE ?auto_200406 ?auto_200407 ) ( not ( = ?auto_200404 ?auto_200407 ) ) ( not ( = ?auto_200402 ?auto_200407 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200403 ?auto_200404 ?auto_200405 ?auto_200402 )
      ( GET-3IMAGE-VERIFY ?auto_200403 ?auto_200404 ?auto_200405 ?auto_200402 ?auto_200406 ?auto_200407 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_200422 - DIRECTION
      ?auto_200423 - MODE
      ?auto_200424 - DIRECTION
      ?auto_200421 - MODE
      ?auto_200425 - DIRECTION
      ?auto_200426 - MODE
    )
    :vars
    (
      ?auto_200428 - INSTRUMENT
      ?auto_200429 - SATELLITE
      ?auto_200427 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200428 ?auto_200429 ) ( SUPPORTS ?auto_200428 ?auto_200426 ) ( not ( = ?auto_200425 ?auto_200427 ) ) ( HAVE_IMAGE ?auto_200424 ?auto_200421 ) ( not ( = ?auto_200424 ?auto_200425 ) ) ( not ( = ?auto_200424 ?auto_200427 ) ) ( not ( = ?auto_200421 ?auto_200426 ) ) ( CALIBRATION_TARGET ?auto_200428 ?auto_200427 ) ( POWER_AVAIL ?auto_200429 ) ( POINTING ?auto_200429 ?auto_200422 ) ( not ( = ?auto_200427 ?auto_200422 ) ) ( not ( = ?auto_200425 ?auto_200422 ) ) ( not ( = ?auto_200424 ?auto_200422 ) ) ( HAVE_IMAGE ?auto_200422 ?auto_200423 ) ( not ( = ?auto_200423 ?auto_200421 ) ) ( not ( = ?auto_200423 ?auto_200426 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200424 ?auto_200421 ?auto_200425 ?auto_200426 )
      ( GET-3IMAGE-VERIFY ?auto_200422 ?auto_200423 ?auto_200424 ?auto_200421 ?auto_200425 ?auto_200426 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_200431 - DIRECTION
      ?auto_200432 - MODE
      ?auto_200433 - DIRECTION
      ?auto_200430 - MODE
      ?auto_200434 - DIRECTION
      ?auto_200435 - MODE
    )
    :vars
    (
      ?auto_200439 - INSTRUMENT
      ?auto_200440 - SATELLITE
      ?auto_200437 - DIRECTION
      ?auto_200438 - DIRECTION
      ?auto_200436 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_200439 ?auto_200440 ) ( SUPPORTS ?auto_200439 ?auto_200435 ) ( not ( = ?auto_200434 ?auto_200437 ) ) ( HAVE_IMAGE ?auto_200438 ?auto_200436 ) ( not ( = ?auto_200438 ?auto_200434 ) ) ( not ( = ?auto_200438 ?auto_200437 ) ) ( not ( = ?auto_200436 ?auto_200435 ) ) ( CALIBRATION_TARGET ?auto_200439 ?auto_200437 ) ( POWER_AVAIL ?auto_200440 ) ( POINTING ?auto_200440 ?auto_200433 ) ( not ( = ?auto_200437 ?auto_200433 ) ) ( not ( = ?auto_200434 ?auto_200433 ) ) ( not ( = ?auto_200438 ?auto_200433 ) ) ( HAVE_IMAGE ?auto_200431 ?auto_200432 ) ( HAVE_IMAGE ?auto_200433 ?auto_200430 ) ( not ( = ?auto_200431 ?auto_200433 ) ) ( not ( = ?auto_200431 ?auto_200434 ) ) ( not ( = ?auto_200431 ?auto_200437 ) ) ( not ( = ?auto_200431 ?auto_200438 ) ) ( not ( = ?auto_200432 ?auto_200430 ) ) ( not ( = ?auto_200432 ?auto_200435 ) ) ( not ( = ?auto_200432 ?auto_200436 ) ) ( not ( = ?auto_200430 ?auto_200435 ) ) ( not ( = ?auto_200430 ?auto_200436 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200438 ?auto_200436 ?auto_200434 ?auto_200435 )
      ( GET-3IMAGE-VERIFY ?auto_200431 ?auto_200432 ?auto_200433 ?auto_200430 ?auto_200434 ?auto_200435 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_200442 - DIRECTION
      ?auto_200443 - MODE
      ?auto_200444 - DIRECTION
      ?auto_200441 - MODE
      ?auto_200445 - DIRECTION
      ?auto_200446 - MODE
    )
    :vars
    (
      ?auto_200448 - INSTRUMENT
      ?auto_200449 - SATELLITE
      ?auto_200447 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200448 ?auto_200449 ) ( SUPPORTS ?auto_200448 ?auto_200441 ) ( not ( = ?auto_200444 ?auto_200447 ) ) ( HAVE_IMAGE ?auto_200445 ?auto_200446 ) ( not ( = ?auto_200445 ?auto_200444 ) ) ( not ( = ?auto_200445 ?auto_200447 ) ) ( not ( = ?auto_200446 ?auto_200441 ) ) ( CALIBRATION_TARGET ?auto_200448 ?auto_200447 ) ( POWER_AVAIL ?auto_200449 ) ( POINTING ?auto_200449 ?auto_200442 ) ( not ( = ?auto_200447 ?auto_200442 ) ) ( not ( = ?auto_200444 ?auto_200442 ) ) ( not ( = ?auto_200445 ?auto_200442 ) ) ( HAVE_IMAGE ?auto_200442 ?auto_200443 ) ( not ( = ?auto_200443 ?auto_200441 ) ) ( not ( = ?auto_200443 ?auto_200446 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200445 ?auto_200446 ?auto_200444 ?auto_200441 )
      ( GET-3IMAGE-VERIFY ?auto_200442 ?auto_200443 ?auto_200444 ?auto_200441 ?auto_200445 ?auto_200446 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_200451 - DIRECTION
      ?auto_200452 - MODE
      ?auto_200453 - DIRECTION
      ?auto_200450 - MODE
      ?auto_200454 - DIRECTION
      ?auto_200455 - MODE
    )
    :vars
    (
      ?auto_200459 - INSTRUMENT
      ?auto_200460 - SATELLITE
      ?auto_200457 - DIRECTION
      ?auto_200458 - DIRECTION
      ?auto_200456 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_200459 ?auto_200460 ) ( SUPPORTS ?auto_200459 ?auto_200450 ) ( not ( = ?auto_200453 ?auto_200457 ) ) ( HAVE_IMAGE ?auto_200458 ?auto_200456 ) ( not ( = ?auto_200458 ?auto_200453 ) ) ( not ( = ?auto_200458 ?auto_200457 ) ) ( not ( = ?auto_200456 ?auto_200450 ) ) ( CALIBRATION_TARGET ?auto_200459 ?auto_200457 ) ( POWER_AVAIL ?auto_200460 ) ( POINTING ?auto_200460 ?auto_200451 ) ( not ( = ?auto_200457 ?auto_200451 ) ) ( not ( = ?auto_200453 ?auto_200451 ) ) ( not ( = ?auto_200458 ?auto_200451 ) ) ( HAVE_IMAGE ?auto_200451 ?auto_200452 ) ( HAVE_IMAGE ?auto_200454 ?auto_200455 ) ( not ( = ?auto_200451 ?auto_200454 ) ) ( not ( = ?auto_200452 ?auto_200450 ) ) ( not ( = ?auto_200452 ?auto_200455 ) ) ( not ( = ?auto_200452 ?auto_200456 ) ) ( not ( = ?auto_200453 ?auto_200454 ) ) ( not ( = ?auto_200450 ?auto_200455 ) ) ( not ( = ?auto_200454 ?auto_200457 ) ) ( not ( = ?auto_200454 ?auto_200458 ) ) ( not ( = ?auto_200455 ?auto_200456 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200458 ?auto_200456 ?auto_200453 ?auto_200450 )
      ( GET-3IMAGE-VERIFY ?auto_200451 ?auto_200452 ?auto_200453 ?auto_200450 ?auto_200454 ?auto_200455 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_200473 - DIRECTION
      ?auto_200474 - MODE
      ?auto_200475 - DIRECTION
      ?auto_200472 - MODE
      ?auto_200476 - DIRECTION
      ?auto_200477 - MODE
    )
    :vars
    (
      ?auto_200479 - INSTRUMENT
      ?auto_200480 - SATELLITE
      ?auto_200478 - DIRECTION
      ?auto_200481 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200479 ?auto_200480 ) ( SUPPORTS ?auto_200479 ?auto_200474 ) ( not ( = ?auto_200473 ?auto_200478 ) ) ( HAVE_IMAGE ?auto_200476 ?auto_200477 ) ( not ( = ?auto_200476 ?auto_200473 ) ) ( not ( = ?auto_200476 ?auto_200478 ) ) ( not ( = ?auto_200477 ?auto_200474 ) ) ( CALIBRATION_TARGET ?auto_200479 ?auto_200478 ) ( POWER_AVAIL ?auto_200480 ) ( POINTING ?auto_200480 ?auto_200481 ) ( not ( = ?auto_200478 ?auto_200481 ) ) ( not ( = ?auto_200473 ?auto_200481 ) ) ( not ( = ?auto_200476 ?auto_200481 ) ) ( HAVE_IMAGE ?auto_200475 ?auto_200472 ) ( not ( = ?auto_200473 ?auto_200475 ) ) ( not ( = ?auto_200474 ?auto_200472 ) ) ( not ( = ?auto_200475 ?auto_200476 ) ) ( not ( = ?auto_200475 ?auto_200478 ) ) ( not ( = ?auto_200475 ?auto_200481 ) ) ( not ( = ?auto_200472 ?auto_200477 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200476 ?auto_200477 ?auto_200473 ?auto_200474 )
      ( GET-3IMAGE-VERIFY ?auto_200473 ?auto_200474 ?auto_200475 ?auto_200472 ?auto_200476 ?auto_200477 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_200483 - DIRECTION
      ?auto_200484 - MODE
      ?auto_200485 - DIRECTION
      ?auto_200482 - MODE
      ?auto_200486 - DIRECTION
      ?auto_200487 - MODE
    )
    :vars
    (
      ?auto_200489 - INSTRUMENT
      ?auto_200490 - SATELLITE
      ?auto_200488 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200489 ?auto_200490 ) ( SUPPORTS ?auto_200489 ?auto_200484 ) ( not ( = ?auto_200483 ?auto_200488 ) ) ( HAVE_IMAGE ?auto_200485 ?auto_200482 ) ( not ( = ?auto_200485 ?auto_200483 ) ) ( not ( = ?auto_200485 ?auto_200488 ) ) ( not ( = ?auto_200482 ?auto_200484 ) ) ( CALIBRATION_TARGET ?auto_200489 ?auto_200488 ) ( POWER_AVAIL ?auto_200490 ) ( POINTING ?auto_200490 ?auto_200486 ) ( not ( = ?auto_200488 ?auto_200486 ) ) ( not ( = ?auto_200483 ?auto_200486 ) ) ( not ( = ?auto_200485 ?auto_200486 ) ) ( HAVE_IMAGE ?auto_200486 ?auto_200487 ) ( not ( = ?auto_200484 ?auto_200487 ) ) ( not ( = ?auto_200482 ?auto_200487 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200485 ?auto_200482 ?auto_200483 ?auto_200484 )
      ( GET-3IMAGE-VERIFY ?auto_200483 ?auto_200484 ?auto_200485 ?auto_200482 ?auto_200486 ?auto_200487 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_200502 - DIRECTION
      ?auto_200503 - MODE
      ?auto_200504 - DIRECTION
      ?auto_200501 - MODE
      ?auto_200505 - DIRECTION
      ?auto_200506 - MODE
    )
    :vars
    (
      ?auto_200508 - INSTRUMENT
      ?auto_200509 - SATELLITE
      ?auto_200507 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200508 ?auto_200509 ) ( SUPPORTS ?auto_200508 ?auto_200503 ) ( not ( = ?auto_200502 ?auto_200507 ) ) ( HAVE_IMAGE ?auto_200505 ?auto_200506 ) ( not ( = ?auto_200505 ?auto_200502 ) ) ( not ( = ?auto_200505 ?auto_200507 ) ) ( not ( = ?auto_200506 ?auto_200503 ) ) ( CALIBRATION_TARGET ?auto_200508 ?auto_200507 ) ( POWER_AVAIL ?auto_200509 ) ( POINTING ?auto_200509 ?auto_200504 ) ( not ( = ?auto_200507 ?auto_200504 ) ) ( not ( = ?auto_200502 ?auto_200504 ) ) ( not ( = ?auto_200505 ?auto_200504 ) ) ( HAVE_IMAGE ?auto_200504 ?auto_200501 ) ( not ( = ?auto_200503 ?auto_200501 ) ) ( not ( = ?auto_200501 ?auto_200506 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200505 ?auto_200506 ?auto_200502 ?auto_200503 )
      ( GET-3IMAGE-VERIFY ?auto_200502 ?auto_200503 ?auto_200504 ?auto_200501 ?auto_200505 ?auto_200506 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_200511 - DIRECTION
      ?auto_200512 - MODE
      ?auto_200513 - DIRECTION
      ?auto_200510 - MODE
      ?auto_200514 - DIRECTION
      ?auto_200515 - MODE
    )
    :vars
    (
      ?auto_200519 - INSTRUMENT
      ?auto_200520 - SATELLITE
      ?auto_200517 - DIRECTION
      ?auto_200518 - DIRECTION
      ?auto_200516 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_200519 ?auto_200520 ) ( SUPPORTS ?auto_200519 ?auto_200512 ) ( not ( = ?auto_200511 ?auto_200517 ) ) ( HAVE_IMAGE ?auto_200518 ?auto_200516 ) ( not ( = ?auto_200518 ?auto_200511 ) ) ( not ( = ?auto_200518 ?auto_200517 ) ) ( not ( = ?auto_200516 ?auto_200512 ) ) ( CALIBRATION_TARGET ?auto_200519 ?auto_200517 ) ( POWER_AVAIL ?auto_200520 ) ( POINTING ?auto_200520 ?auto_200513 ) ( not ( = ?auto_200517 ?auto_200513 ) ) ( not ( = ?auto_200511 ?auto_200513 ) ) ( not ( = ?auto_200518 ?auto_200513 ) ) ( HAVE_IMAGE ?auto_200513 ?auto_200510 ) ( HAVE_IMAGE ?auto_200514 ?auto_200515 ) ( not ( = ?auto_200511 ?auto_200514 ) ) ( not ( = ?auto_200512 ?auto_200510 ) ) ( not ( = ?auto_200512 ?auto_200515 ) ) ( not ( = ?auto_200513 ?auto_200514 ) ) ( not ( = ?auto_200510 ?auto_200515 ) ) ( not ( = ?auto_200510 ?auto_200516 ) ) ( not ( = ?auto_200514 ?auto_200517 ) ) ( not ( = ?auto_200514 ?auto_200518 ) ) ( not ( = ?auto_200515 ?auto_200516 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200518 ?auto_200516 ?auto_200511 ?auto_200512 )
      ( GET-3IMAGE-VERIFY ?auto_200511 ?auto_200512 ?auto_200513 ?auto_200510 ?auto_200514 ?auto_200515 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_200566 - DIRECTION
      ?auto_200567 - MODE
      ?auto_200568 - DIRECTION
      ?auto_200565 - MODE
      ?auto_200569 - DIRECTION
      ?auto_200570 - MODE
      ?auto_200571 - DIRECTION
      ?auto_200572 - MODE
    )
    :vars
    (
      ?auto_200574 - INSTRUMENT
      ?auto_200575 - SATELLITE
      ?auto_200573 - DIRECTION
      ?auto_200576 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200574 ?auto_200575 ) ( SUPPORTS ?auto_200574 ?auto_200572 ) ( not ( = ?auto_200571 ?auto_200573 ) ) ( HAVE_IMAGE ?auto_200568 ?auto_200565 ) ( not ( = ?auto_200568 ?auto_200571 ) ) ( not ( = ?auto_200568 ?auto_200573 ) ) ( not ( = ?auto_200565 ?auto_200572 ) ) ( CALIBRATION_TARGET ?auto_200574 ?auto_200573 ) ( POWER_AVAIL ?auto_200575 ) ( POINTING ?auto_200575 ?auto_200576 ) ( not ( = ?auto_200573 ?auto_200576 ) ) ( not ( = ?auto_200571 ?auto_200576 ) ) ( not ( = ?auto_200568 ?auto_200576 ) ) ( HAVE_IMAGE ?auto_200566 ?auto_200567 ) ( HAVE_IMAGE ?auto_200569 ?auto_200570 ) ( not ( = ?auto_200566 ?auto_200568 ) ) ( not ( = ?auto_200566 ?auto_200569 ) ) ( not ( = ?auto_200566 ?auto_200571 ) ) ( not ( = ?auto_200566 ?auto_200573 ) ) ( not ( = ?auto_200566 ?auto_200576 ) ) ( not ( = ?auto_200567 ?auto_200565 ) ) ( not ( = ?auto_200567 ?auto_200570 ) ) ( not ( = ?auto_200567 ?auto_200572 ) ) ( not ( = ?auto_200568 ?auto_200569 ) ) ( not ( = ?auto_200565 ?auto_200570 ) ) ( not ( = ?auto_200569 ?auto_200571 ) ) ( not ( = ?auto_200569 ?auto_200573 ) ) ( not ( = ?auto_200569 ?auto_200576 ) ) ( not ( = ?auto_200570 ?auto_200572 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200568 ?auto_200565 ?auto_200571 ?auto_200572 )
      ( GET-4IMAGE-VERIFY ?auto_200566 ?auto_200567 ?auto_200568 ?auto_200565 ?auto_200569 ?auto_200570 ?auto_200571 ?auto_200572 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_200578 - DIRECTION
      ?auto_200579 - MODE
      ?auto_200580 - DIRECTION
      ?auto_200577 - MODE
      ?auto_200581 - DIRECTION
      ?auto_200582 - MODE
      ?auto_200583 - DIRECTION
      ?auto_200584 - MODE
    )
    :vars
    (
      ?auto_200586 - INSTRUMENT
      ?auto_200587 - SATELLITE
      ?auto_200585 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200586 ?auto_200587 ) ( SUPPORTS ?auto_200586 ?auto_200584 ) ( not ( = ?auto_200583 ?auto_200585 ) ) ( HAVE_IMAGE ?auto_200578 ?auto_200579 ) ( not ( = ?auto_200578 ?auto_200583 ) ) ( not ( = ?auto_200578 ?auto_200585 ) ) ( not ( = ?auto_200579 ?auto_200584 ) ) ( CALIBRATION_TARGET ?auto_200586 ?auto_200585 ) ( POWER_AVAIL ?auto_200587 ) ( POINTING ?auto_200587 ?auto_200581 ) ( not ( = ?auto_200585 ?auto_200581 ) ) ( not ( = ?auto_200583 ?auto_200581 ) ) ( not ( = ?auto_200578 ?auto_200581 ) ) ( HAVE_IMAGE ?auto_200580 ?auto_200577 ) ( HAVE_IMAGE ?auto_200581 ?auto_200582 ) ( not ( = ?auto_200578 ?auto_200580 ) ) ( not ( = ?auto_200579 ?auto_200577 ) ) ( not ( = ?auto_200579 ?auto_200582 ) ) ( not ( = ?auto_200580 ?auto_200581 ) ) ( not ( = ?auto_200580 ?auto_200583 ) ) ( not ( = ?auto_200580 ?auto_200585 ) ) ( not ( = ?auto_200577 ?auto_200582 ) ) ( not ( = ?auto_200577 ?auto_200584 ) ) ( not ( = ?auto_200582 ?auto_200584 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200578 ?auto_200579 ?auto_200583 ?auto_200584 )
      ( GET-4IMAGE-VERIFY ?auto_200578 ?auto_200579 ?auto_200580 ?auto_200577 ?auto_200581 ?auto_200582 ?auto_200583 ?auto_200584 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_200589 - DIRECTION
      ?auto_200590 - MODE
      ?auto_200591 - DIRECTION
      ?auto_200588 - MODE
      ?auto_200592 - DIRECTION
      ?auto_200593 - MODE
      ?auto_200594 - DIRECTION
      ?auto_200595 - MODE
    )
    :vars
    (
      ?auto_200597 - INSTRUMENT
      ?auto_200598 - SATELLITE
      ?auto_200596 - DIRECTION
      ?auto_200599 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200597 ?auto_200598 ) ( SUPPORTS ?auto_200597 ?auto_200593 ) ( not ( = ?auto_200592 ?auto_200596 ) ) ( HAVE_IMAGE ?auto_200591 ?auto_200595 ) ( not ( = ?auto_200591 ?auto_200592 ) ) ( not ( = ?auto_200591 ?auto_200596 ) ) ( not ( = ?auto_200595 ?auto_200593 ) ) ( CALIBRATION_TARGET ?auto_200597 ?auto_200596 ) ( POWER_AVAIL ?auto_200598 ) ( POINTING ?auto_200598 ?auto_200599 ) ( not ( = ?auto_200596 ?auto_200599 ) ) ( not ( = ?auto_200592 ?auto_200599 ) ) ( not ( = ?auto_200591 ?auto_200599 ) ) ( HAVE_IMAGE ?auto_200589 ?auto_200590 ) ( HAVE_IMAGE ?auto_200591 ?auto_200588 ) ( HAVE_IMAGE ?auto_200594 ?auto_200595 ) ( not ( = ?auto_200589 ?auto_200591 ) ) ( not ( = ?auto_200589 ?auto_200592 ) ) ( not ( = ?auto_200589 ?auto_200594 ) ) ( not ( = ?auto_200589 ?auto_200596 ) ) ( not ( = ?auto_200589 ?auto_200599 ) ) ( not ( = ?auto_200590 ?auto_200588 ) ) ( not ( = ?auto_200590 ?auto_200593 ) ) ( not ( = ?auto_200590 ?auto_200595 ) ) ( not ( = ?auto_200591 ?auto_200594 ) ) ( not ( = ?auto_200588 ?auto_200593 ) ) ( not ( = ?auto_200588 ?auto_200595 ) ) ( not ( = ?auto_200592 ?auto_200594 ) ) ( not ( = ?auto_200594 ?auto_200596 ) ) ( not ( = ?auto_200594 ?auto_200599 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200591 ?auto_200595 ?auto_200592 ?auto_200593 )
      ( GET-4IMAGE-VERIFY ?auto_200589 ?auto_200590 ?auto_200591 ?auto_200588 ?auto_200592 ?auto_200593 ?auto_200594 ?auto_200595 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_200601 - DIRECTION
      ?auto_200602 - MODE
      ?auto_200603 - DIRECTION
      ?auto_200600 - MODE
      ?auto_200604 - DIRECTION
      ?auto_200605 - MODE
      ?auto_200606 - DIRECTION
      ?auto_200607 - MODE
    )
    :vars
    (
      ?auto_200609 - INSTRUMENT
      ?auto_200610 - SATELLITE
      ?auto_200608 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200609 ?auto_200610 ) ( SUPPORTS ?auto_200609 ?auto_200605 ) ( not ( = ?auto_200604 ?auto_200608 ) ) ( HAVE_IMAGE ?auto_200603 ?auto_200602 ) ( not ( = ?auto_200603 ?auto_200604 ) ) ( not ( = ?auto_200603 ?auto_200608 ) ) ( not ( = ?auto_200602 ?auto_200605 ) ) ( CALIBRATION_TARGET ?auto_200609 ?auto_200608 ) ( POWER_AVAIL ?auto_200610 ) ( POINTING ?auto_200610 ?auto_200606 ) ( not ( = ?auto_200608 ?auto_200606 ) ) ( not ( = ?auto_200604 ?auto_200606 ) ) ( not ( = ?auto_200603 ?auto_200606 ) ) ( HAVE_IMAGE ?auto_200601 ?auto_200602 ) ( HAVE_IMAGE ?auto_200603 ?auto_200600 ) ( HAVE_IMAGE ?auto_200606 ?auto_200607 ) ( not ( = ?auto_200601 ?auto_200603 ) ) ( not ( = ?auto_200601 ?auto_200604 ) ) ( not ( = ?auto_200601 ?auto_200606 ) ) ( not ( = ?auto_200601 ?auto_200608 ) ) ( not ( = ?auto_200602 ?auto_200600 ) ) ( not ( = ?auto_200602 ?auto_200607 ) ) ( not ( = ?auto_200600 ?auto_200605 ) ) ( not ( = ?auto_200600 ?auto_200607 ) ) ( not ( = ?auto_200605 ?auto_200607 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200603 ?auto_200602 ?auto_200604 ?auto_200605 )
      ( GET-4IMAGE-VERIFY ?auto_200601 ?auto_200602 ?auto_200603 ?auto_200600 ?auto_200604 ?auto_200605 ?auto_200606 ?auto_200607 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_200624 - DIRECTION
      ?auto_200625 - MODE
      ?auto_200626 - DIRECTION
      ?auto_200623 - MODE
      ?auto_200627 - DIRECTION
      ?auto_200628 - MODE
      ?auto_200629 - DIRECTION
      ?auto_200630 - MODE
    )
    :vars
    (
      ?auto_200632 - INSTRUMENT
      ?auto_200633 - SATELLITE
      ?auto_200631 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200632 ?auto_200633 ) ( SUPPORTS ?auto_200632 ?auto_200630 ) ( not ( = ?auto_200629 ?auto_200631 ) ) ( HAVE_IMAGE ?auto_200627 ?auto_200628 ) ( not ( = ?auto_200627 ?auto_200629 ) ) ( not ( = ?auto_200627 ?auto_200631 ) ) ( not ( = ?auto_200628 ?auto_200630 ) ) ( CALIBRATION_TARGET ?auto_200632 ?auto_200631 ) ( POWER_AVAIL ?auto_200633 ) ( POINTING ?auto_200633 ?auto_200626 ) ( not ( = ?auto_200631 ?auto_200626 ) ) ( not ( = ?auto_200629 ?auto_200626 ) ) ( not ( = ?auto_200627 ?auto_200626 ) ) ( HAVE_IMAGE ?auto_200624 ?auto_200625 ) ( HAVE_IMAGE ?auto_200626 ?auto_200623 ) ( not ( = ?auto_200624 ?auto_200626 ) ) ( not ( = ?auto_200624 ?auto_200627 ) ) ( not ( = ?auto_200624 ?auto_200629 ) ) ( not ( = ?auto_200624 ?auto_200631 ) ) ( not ( = ?auto_200625 ?auto_200623 ) ) ( not ( = ?auto_200625 ?auto_200628 ) ) ( not ( = ?auto_200625 ?auto_200630 ) ) ( not ( = ?auto_200623 ?auto_200628 ) ) ( not ( = ?auto_200623 ?auto_200630 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200627 ?auto_200628 ?auto_200629 ?auto_200630 )
      ( GET-4IMAGE-VERIFY ?auto_200624 ?auto_200625 ?auto_200626 ?auto_200623 ?auto_200627 ?auto_200628 ?auto_200629 ?auto_200630 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_200646 - DIRECTION
      ?auto_200647 - MODE
      ?auto_200648 - DIRECTION
      ?auto_200645 - MODE
      ?auto_200649 - DIRECTION
      ?auto_200650 - MODE
      ?auto_200651 - DIRECTION
      ?auto_200652 - MODE
    )
    :vars
    (
      ?auto_200654 - INSTRUMENT
      ?auto_200655 - SATELLITE
      ?auto_200653 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200654 ?auto_200655 ) ( SUPPORTS ?auto_200654 ?auto_200650 ) ( not ( = ?auto_200649 ?auto_200653 ) ) ( HAVE_IMAGE ?auto_200646 ?auto_200652 ) ( not ( = ?auto_200646 ?auto_200649 ) ) ( not ( = ?auto_200646 ?auto_200653 ) ) ( not ( = ?auto_200652 ?auto_200650 ) ) ( CALIBRATION_TARGET ?auto_200654 ?auto_200653 ) ( POWER_AVAIL ?auto_200655 ) ( POINTING ?auto_200655 ?auto_200648 ) ( not ( = ?auto_200653 ?auto_200648 ) ) ( not ( = ?auto_200649 ?auto_200648 ) ) ( not ( = ?auto_200646 ?auto_200648 ) ) ( HAVE_IMAGE ?auto_200646 ?auto_200647 ) ( HAVE_IMAGE ?auto_200648 ?auto_200645 ) ( HAVE_IMAGE ?auto_200651 ?auto_200652 ) ( not ( = ?auto_200646 ?auto_200651 ) ) ( not ( = ?auto_200647 ?auto_200645 ) ) ( not ( = ?auto_200647 ?auto_200650 ) ) ( not ( = ?auto_200647 ?auto_200652 ) ) ( not ( = ?auto_200648 ?auto_200651 ) ) ( not ( = ?auto_200645 ?auto_200650 ) ) ( not ( = ?auto_200645 ?auto_200652 ) ) ( not ( = ?auto_200649 ?auto_200651 ) ) ( not ( = ?auto_200651 ?auto_200653 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200646 ?auto_200652 ?auto_200649 ?auto_200650 )
      ( GET-4IMAGE-VERIFY ?auto_200646 ?auto_200647 ?auto_200648 ?auto_200645 ?auto_200649 ?auto_200650 ?auto_200651 ?auto_200652 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_200657 - DIRECTION
      ?auto_200658 - MODE
      ?auto_200659 - DIRECTION
      ?auto_200656 - MODE
      ?auto_200660 - DIRECTION
      ?auto_200661 - MODE
      ?auto_200662 - DIRECTION
      ?auto_200663 - MODE
    )
    :vars
    (
      ?auto_200665 - INSTRUMENT
      ?auto_200666 - SATELLITE
      ?auto_200664 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200665 ?auto_200666 ) ( SUPPORTS ?auto_200665 ?auto_200661 ) ( not ( = ?auto_200660 ?auto_200664 ) ) ( HAVE_IMAGE ?auto_200657 ?auto_200658 ) ( not ( = ?auto_200657 ?auto_200660 ) ) ( not ( = ?auto_200657 ?auto_200664 ) ) ( not ( = ?auto_200658 ?auto_200661 ) ) ( CALIBRATION_TARGET ?auto_200665 ?auto_200664 ) ( POWER_AVAIL ?auto_200666 ) ( POINTING ?auto_200666 ?auto_200659 ) ( not ( = ?auto_200664 ?auto_200659 ) ) ( not ( = ?auto_200660 ?auto_200659 ) ) ( not ( = ?auto_200657 ?auto_200659 ) ) ( HAVE_IMAGE ?auto_200659 ?auto_200656 ) ( HAVE_IMAGE ?auto_200662 ?auto_200663 ) ( not ( = ?auto_200657 ?auto_200662 ) ) ( not ( = ?auto_200658 ?auto_200656 ) ) ( not ( = ?auto_200658 ?auto_200663 ) ) ( not ( = ?auto_200659 ?auto_200662 ) ) ( not ( = ?auto_200656 ?auto_200661 ) ) ( not ( = ?auto_200656 ?auto_200663 ) ) ( not ( = ?auto_200660 ?auto_200662 ) ) ( not ( = ?auto_200661 ?auto_200663 ) ) ( not ( = ?auto_200662 ?auto_200664 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200657 ?auto_200658 ?auto_200660 ?auto_200661 )
      ( GET-4IMAGE-VERIFY ?auto_200657 ?auto_200658 ?auto_200659 ?auto_200656 ?auto_200660 ?auto_200661 ?auto_200662 ?auto_200663 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_200679 - DIRECTION
      ?auto_200680 - MODE
      ?auto_200681 - DIRECTION
      ?auto_200678 - MODE
      ?auto_200682 - DIRECTION
      ?auto_200683 - MODE
      ?auto_200684 - DIRECTION
      ?auto_200685 - MODE
    )
    :vars
    (
      ?auto_200687 - INSTRUMENT
      ?auto_200688 - SATELLITE
      ?auto_200686 - DIRECTION
      ?auto_200689 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200687 ?auto_200688 ) ( SUPPORTS ?auto_200687 ?auto_200678 ) ( not ( = ?auto_200681 ?auto_200686 ) ) ( HAVE_IMAGE ?auto_200679 ?auto_200685 ) ( not ( = ?auto_200679 ?auto_200681 ) ) ( not ( = ?auto_200679 ?auto_200686 ) ) ( not ( = ?auto_200685 ?auto_200678 ) ) ( CALIBRATION_TARGET ?auto_200687 ?auto_200686 ) ( POWER_AVAIL ?auto_200688 ) ( POINTING ?auto_200688 ?auto_200689 ) ( not ( = ?auto_200686 ?auto_200689 ) ) ( not ( = ?auto_200681 ?auto_200689 ) ) ( not ( = ?auto_200679 ?auto_200689 ) ) ( HAVE_IMAGE ?auto_200679 ?auto_200680 ) ( HAVE_IMAGE ?auto_200682 ?auto_200683 ) ( HAVE_IMAGE ?auto_200684 ?auto_200685 ) ( not ( = ?auto_200679 ?auto_200682 ) ) ( not ( = ?auto_200679 ?auto_200684 ) ) ( not ( = ?auto_200680 ?auto_200678 ) ) ( not ( = ?auto_200680 ?auto_200683 ) ) ( not ( = ?auto_200680 ?auto_200685 ) ) ( not ( = ?auto_200681 ?auto_200682 ) ) ( not ( = ?auto_200681 ?auto_200684 ) ) ( not ( = ?auto_200678 ?auto_200683 ) ) ( not ( = ?auto_200682 ?auto_200684 ) ) ( not ( = ?auto_200682 ?auto_200686 ) ) ( not ( = ?auto_200682 ?auto_200689 ) ) ( not ( = ?auto_200683 ?auto_200685 ) ) ( not ( = ?auto_200684 ?auto_200686 ) ) ( not ( = ?auto_200684 ?auto_200689 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200679 ?auto_200685 ?auto_200681 ?auto_200678 )
      ( GET-4IMAGE-VERIFY ?auto_200679 ?auto_200680 ?auto_200681 ?auto_200678 ?auto_200682 ?auto_200683 ?auto_200684 ?auto_200685 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_200691 - DIRECTION
      ?auto_200692 - MODE
      ?auto_200693 - DIRECTION
      ?auto_200690 - MODE
      ?auto_200694 - DIRECTION
      ?auto_200695 - MODE
      ?auto_200696 - DIRECTION
      ?auto_200697 - MODE
    )
    :vars
    (
      ?auto_200699 - INSTRUMENT
      ?auto_200700 - SATELLITE
      ?auto_200698 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200699 ?auto_200700 ) ( SUPPORTS ?auto_200699 ?auto_200690 ) ( not ( = ?auto_200693 ?auto_200698 ) ) ( HAVE_IMAGE ?auto_200694 ?auto_200695 ) ( not ( = ?auto_200694 ?auto_200693 ) ) ( not ( = ?auto_200694 ?auto_200698 ) ) ( not ( = ?auto_200695 ?auto_200690 ) ) ( CALIBRATION_TARGET ?auto_200699 ?auto_200698 ) ( POWER_AVAIL ?auto_200700 ) ( POINTING ?auto_200700 ?auto_200696 ) ( not ( = ?auto_200698 ?auto_200696 ) ) ( not ( = ?auto_200693 ?auto_200696 ) ) ( not ( = ?auto_200694 ?auto_200696 ) ) ( HAVE_IMAGE ?auto_200691 ?auto_200692 ) ( HAVE_IMAGE ?auto_200696 ?auto_200697 ) ( not ( = ?auto_200691 ?auto_200693 ) ) ( not ( = ?auto_200691 ?auto_200694 ) ) ( not ( = ?auto_200691 ?auto_200696 ) ) ( not ( = ?auto_200691 ?auto_200698 ) ) ( not ( = ?auto_200692 ?auto_200690 ) ) ( not ( = ?auto_200692 ?auto_200695 ) ) ( not ( = ?auto_200692 ?auto_200697 ) ) ( not ( = ?auto_200690 ?auto_200697 ) ) ( not ( = ?auto_200695 ?auto_200697 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200694 ?auto_200695 ?auto_200693 ?auto_200690 )
      ( GET-4IMAGE-VERIFY ?auto_200691 ?auto_200692 ?auto_200693 ?auto_200690 ?auto_200694 ?auto_200695 ?auto_200696 ?auto_200697 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_200714 - DIRECTION
      ?auto_200715 - MODE
      ?auto_200716 - DIRECTION
      ?auto_200713 - MODE
      ?auto_200717 - DIRECTION
      ?auto_200718 - MODE
      ?auto_200719 - DIRECTION
      ?auto_200720 - MODE
    )
    :vars
    (
      ?auto_200722 - INSTRUMENT
      ?auto_200723 - SATELLITE
      ?auto_200721 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200722 ?auto_200723 ) ( SUPPORTS ?auto_200722 ?auto_200713 ) ( not ( = ?auto_200716 ?auto_200721 ) ) ( HAVE_IMAGE ?auto_200719 ?auto_200720 ) ( not ( = ?auto_200719 ?auto_200716 ) ) ( not ( = ?auto_200719 ?auto_200721 ) ) ( not ( = ?auto_200720 ?auto_200713 ) ) ( CALIBRATION_TARGET ?auto_200722 ?auto_200721 ) ( POWER_AVAIL ?auto_200723 ) ( POINTING ?auto_200723 ?auto_200717 ) ( not ( = ?auto_200721 ?auto_200717 ) ) ( not ( = ?auto_200716 ?auto_200717 ) ) ( not ( = ?auto_200719 ?auto_200717 ) ) ( HAVE_IMAGE ?auto_200714 ?auto_200715 ) ( HAVE_IMAGE ?auto_200717 ?auto_200718 ) ( not ( = ?auto_200714 ?auto_200716 ) ) ( not ( = ?auto_200714 ?auto_200717 ) ) ( not ( = ?auto_200714 ?auto_200719 ) ) ( not ( = ?auto_200714 ?auto_200721 ) ) ( not ( = ?auto_200715 ?auto_200713 ) ) ( not ( = ?auto_200715 ?auto_200718 ) ) ( not ( = ?auto_200715 ?auto_200720 ) ) ( not ( = ?auto_200713 ?auto_200718 ) ) ( not ( = ?auto_200718 ?auto_200720 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200719 ?auto_200720 ?auto_200716 ?auto_200713 )
      ( GET-4IMAGE-VERIFY ?auto_200714 ?auto_200715 ?auto_200716 ?auto_200713 ?auto_200717 ?auto_200718 ?auto_200719 ?auto_200720 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_200725 - DIRECTION
      ?auto_200726 - MODE
      ?auto_200727 - DIRECTION
      ?auto_200724 - MODE
      ?auto_200728 - DIRECTION
      ?auto_200729 - MODE
      ?auto_200730 - DIRECTION
      ?auto_200731 - MODE
    )
    :vars
    (
      ?auto_200733 - INSTRUMENT
      ?auto_200734 - SATELLITE
      ?auto_200732 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200733 ?auto_200734 ) ( SUPPORTS ?auto_200733 ?auto_200724 ) ( not ( = ?auto_200727 ?auto_200732 ) ) ( HAVE_IMAGE ?auto_200725 ?auto_200726 ) ( not ( = ?auto_200725 ?auto_200727 ) ) ( not ( = ?auto_200725 ?auto_200732 ) ) ( not ( = ?auto_200726 ?auto_200724 ) ) ( CALIBRATION_TARGET ?auto_200733 ?auto_200732 ) ( POWER_AVAIL ?auto_200734 ) ( POINTING ?auto_200734 ?auto_200728 ) ( not ( = ?auto_200732 ?auto_200728 ) ) ( not ( = ?auto_200727 ?auto_200728 ) ) ( not ( = ?auto_200725 ?auto_200728 ) ) ( HAVE_IMAGE ?auto_200728 ?auto_200729 ) ( HAVE_IMAGE ?auto_200730 ?auto_200731 ) ( not ( = ?auto_200725 ?auto_200730 ) ) ( not ( = ?auto_200726 ?auto_200729 ) ) ( not ( = ?auto_200726 ?auto_200731 ) ) ( not ( = ?auto_200727 ?auto_200730 ) ) ( not ( = ?auto_200724 ?auto_200729 ) ) ( not ( = ?auto_200724 ?auto_200731 ) ) ( not ( = ?auto_200728 ?auto_200730 ) ) ( not ( = ?auto_200729 ?auto_200731 ) ) ( not ( = ?auto_200730 ?auto_200732 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200725 ?auto_200726 ?auto_200727 ?auto_200724 )
      ( GET-4IMAGE-VERIFY ?auto_200725 ?auto_200726 ?auto_200727 ?auto_200724 ?auto_200728 ?auto_200729 ?auto_200730 ?auto_200731 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_200782 - DIRECTION
      ?auto_200783 - MODE
      ?auto_200784 - DIRECTION
      ?auto_200781 - MODE
      ?auto_200785 - DIRECTION
      ?auto_200786 - MODE
      ?auto_200787 - DIRECTION
      ?auto_200788 - MODE
    )
    :vars
    (
      ?auto_200790 - INSTRUMENT
      ?auto_200791 - SATELLITE
      ?auto_200789 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200790 ?auto_200791 ) ( SUPPORTS ?auto_200790 ?auto_200788 ) ( not ( = ?auto_200787 ?auto_200789 ) ) ( HAVE_IMAGE ?auto_200785 ?auto_200781 ) ( not ( = ?auto_200785 ?auto_200787 ) ) ( not ( = ?auto_200785 ?auto_200789 ) ) ( not ( = ?auto_200781 ?auto_200788 ) ) ( CALIBRATION_TARGET ?auto_200790 ?auto_200789 ) ( POWER_AVAIL ?auto_200791 ) ( POINTING ?auto_200791 ?auto_200782 ) ( not ( = ?auto_200789 ?auto_200782 ) ) ( not ( = ?auto_200787 ?auto_200782 ) ) ( not ( = ?auto_200785 ?auto_200782 ) ) ( HAVE_IMAGE ?auto_200782 ?auto_200783 ) ( HAVE_IMAGE ?auto_200784 ?auto_200781 ) ( HAVE_IMAGE ?auto_200785 ?auto_200786 ) ( not ( = ?auto_200782 ?auto_200784 ) ) ( not ( = ?auto_200783 ?auto_200781 ) ) ( not ( = ?auto_200783 ?auto_200786 ) ) ( not ( = ?auto_200783 ?auto_200788 ) ) ( not ( = ?auto_200784 ?auto_200785 ) ) ( not ( = ?auto_200784 ?auto_200787 ) ) ( not ( = ?auto_200784 ?auto_200789 ) ) ( not ( = ?auto_200781 ?auto_200786 ) ) ( not ( = ?auto_200786 ?auto_200788 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200785 ?auto_200781 ?auto_200787 ?auto_200788 )
      ( GET-4IMAGE-VERIFY ?auto_200782 ?auto_200783 ?auto_200784 ?auto_200781 ?auto_200785 ?auto_200786 ?auto_200787 ?auto_200788 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_200793 - DIRECTION
      ?auto_200794 - MODE
      ?auto_200795 - DIRECTION
      ?auto_200792 - MODE
      ?auto_200796 - DIRECTION
      ?auto_200797 - MODE
      ?auto_200798 - DIRECTION
      ?auto_200799 - MODE
    )
    :vars
    (
      ?auto_200801 - INSTRUMENT
      ?auto_200802 - SATELLITE
      ?auto_200800 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200801 ?auto_200802 ) ( SUPPORTS ?auto_200801 ?auto_200799 ) ( not ( = ?auto_200798 ?auto_200800 ) ) ( HAVE_IMAGE ?auto_200795 ?auto_200792 ) ( not ( = ?auto_200795 ?auto_200798 ) ) ( not ( = ?auto_200795 ?auto_200800 ) ) ( not ( = ?auto_200792 ?auto_200799 ) ) ( CALIBRATION_TARGET ?auto_200801 ?auto_200800 ) ( POWER_AVAIL ?auto_200802 ) ( POINTING ?auto_200802 ?auto_200796 ) ( not ( = ?auto_200800 ?auto_200796 ) ) ( not ( = ?auto_200798 ?auto_200796 ) ) ( not ( = ?auto_200795 ?auto_200796 ) ) ( HAVE_IMAGE ?auto_200793 ?auto_200794 ) ( HAVE_IMAGE ?auto_200796 ?auto_200797 ) ( not ( = ?auto_200793 ?auto_200795 ) ) ( not ( = ?auto_200793 ?auto_200796 ) ) ( not ( = ?auto_200793 ?auto_200798 ) ) ( not ( = ?auto_200793 ?auto_200800 ) ) ( not ( = ?auto_200794 ?auto_200792 ) ) ( not ( = ?auto_200794 ?auto_200797 ) ) ( not ( = ?auto_200794 ?auto_200799 ) ) ( not ( = ?auto_200792 ?auto_200797 ) ) ( not ( = ?auto_200797 ?auto_200799 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200795 ?auto_200792 ?auto_200798 ?auto_200799 )
      ( GET-4IMAGE-VERIFY ?auto_200793 ?auto_200794 ?auto_200795 ?auto_200792 ?auto_200796 ?auto_200797 ?auto_200798 ?auto_200799 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_200804 - DIRECTION
      ?auto_200805 - MODE
      ?auto_200806 - DIRECTION
      ?auto_200803 - MODE
      ?auto_200807 - DIRECTION
      ?auto_200808 - MODE
      ?auto_200809 - DIRECTION
      ?auto_200810 - MODE
    )
    :vars
    (
      ?auto_200812 - INSTRUMENT
      ?auto_200813 - SATELLITE
      ?auto_200811 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200812 ?auto_200813 ) ( SUPPORTS ?auto_200812 ?auto_200808 ) ( not ( = ?auto_200807 ?auto_200811 ) ) ( HAVE_IMAGE ?auto_200806 ?auto_200810 ) ( not ( = ?auto_200806 ?auto_200807 ) ) ( not ( = ?auto_200806 ?auto_200811 ) ) ( not ( = ?auto_200810 ?auto_200808 ) ) ( CALIBRATION_TARGET ?auto_200812 ?auto_200811 ) ( POWER_AVAIL ?auto_200813 ) ( POINTING ?auto_200813 ?auto_200804 ) ( not ( = ?auto_200811 ?auto_200804 ) ) ( not ( = ?auto_200807 ?auto_200804 ) ) ( not ( = ?auto_200806 ?auto_200804 ) ) ( HAVE_IMAGE ?auto_200804 ?auto_200805 ) ( HAVE_IMAGE ?auto_200806 ?auto_200803 ) ( HAVE_IMAGE ?auto_200809 ?auto_200810 ) ( not ( = ?auto_200804 ?auto_200809 ) ) ( not ( = ?auto_200805 ?auto_200803 ) ) ( not ( = ?auto_200805 ?auto_200808 ) ) ( not ( = ?auto_200805 ?auto_200810 ) ) ( not ( = ?auto_200806 ?auto_200809 ) ) ( not ( = ?auto_200803 ?auto_200808 ) ) ( not ( = ?auto_200803 ?auto_200810 ) ) ( not ( = ?auto_200807 ?auto_200809 ) ) ( not ( = ?auto_200809 ?auto_200811 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200806 ?auto_200810 ?auto_200807 ?auto_200808 )
      ( GET-4IMAGE-VERIFY ?auto_200804 ?auto_200805 ?auto_200806 ?auto_200803 ?auto_200807 ?auto_200808 ?auto_200809 ?auto_200810 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_200815 - DIRECTION
      ?auto_200816 - MODE
      ?auto_200817 - DIRECTION
      ?auto_200814 - MODE
      ?auto_200818 - DIRECTION
      ?auto_200819 - MODE
      ?auto_200820 - DIRECTION
      ?auto_200821 - MODE
    )
    :vars
    (
      ?auto_200823 - INSTRUMENT
      ?auto_200824 - SATELLITE
      ?auto_200822 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200823 ?auto_200824 ) ( SUPPORTS ?auto_200823 ?auto_200819 ) ( not ( = ?auto_200818 ?auto_200822 ) ) ( HAVE_IMAGE ?auto_200817 ?auto_200814 ) ( not ( = ?auto_200817 ?auto_200818 ) ) ( not ( = ?auto_200817 ?auto_200822 ) ) ( not ( = ?auto_200814 ?auto_200819 ) ) ( CALIBRATION_TARGET ?auto_200823 ?auto_200822 ) ( POWER_AVAIL ?auto_200824 ) ( POINTING ?auto_200824 ?auto_200815 ) ( not ( = ?auto_200822 ?auto_200815 ) ) ( not ( = ?auto_200818 ?auto_200815 ) ) ( not ( = ?auto_200817 ?auto_200815 ) ) ( HAVE_IMAGE ?auto_200815 ?auto_200816 ) ( HAVE_IMAGE ?auto_200820 ?auto_200821 ) ( not ( = ?auto_200815 ?auto_200820 ) ) ( not ( = ?auto_200816 ?auto_200814 ) ) ( not ( = ?auto_200816 ?auto_200819 ) ) ( not ( = ?auto_200816 ?auto_200821 ) ) ( not ( = ?auto_200817 ?auto_200820 ) ) ( not ( = ?auto_200814 ?auto_200821 ) ) ( not ( = ?auto_200818 ?auto_200820 ) ) ( not ( = ?auto_200819 ?auto_200821 ) ) ( not ( = ?auto_200820 ?auto_200822 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200817 ?auto_200814 ?auto_200818 ?auto_200819 )
      ( GET-4IMAGE-VERIFY ?auto_200815 ?auto_200816 ?auto_200817 ?auto_200814 ?auto_200818 ?auto_200819 ?auto_200820 ?auto_200821 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_200837 - DIRECTION
      ?auto_200838 - MODE
      ?auto_200839 - DIRECTION
      ?auto_200836 - MODE
      ?auto_200840 - DIRECTION
      ?auto_200841 - MODE
      ?auto_200842 - DIRECTION
      ?auto_200843 - MODE
    )
    :vars
    (
      ?auto_200845 - INSTRUMENT
      ?auto_200846 - SATELLITE
      ?auto_200844 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200845 ?auto_200846 ) ( SUPPORTS ?auto_200845 ?auto_200843 ) ( not ( = ?auto_200842 ?auto_200844 ) ) ( HAVE_IMAGE ?auto_200840 ?auto_200841 ) ( not ( = ?auto_200840 ?auto_200842 ) ) ( not ( = ?auto_200840 ?auto_200844 ) ) ( not ( = ?auto_200841 ?auto_200843 ) ) ( CALIBRATION_TARGET ?auto_200845 ?auto_200844 ) ( POWER_AVAIL ?auto_200846 ) ( POINTING ?auto_200846 ?auto_200837 ) ( not ( = ?auto_200844 ?auto_200837 ) ) ( not ( = ?auto_200842 ?auto_200837 ) ) ( not ( = ?auto_200840 ?auto_200837 ) ) ( HAVE_IMAGE ?auto_200837 ?auto_200838 ) ( HAVE_IMAGE ?auto_200839 ?auto_200836 ) ( not ( = ?auto_200837 ?auto_200839 ) ) ( not ( = ?auto_200838 ?auto_200836 ) ) ( not ( = ?auto_200838 ?auto_200841 ) ) ( not ( = ?auto_200838 ?auto_200843 ) ) ( not ( = ?auto_200839 ?auto_200840 ) ) ( not ( = ?auto_200839 ?auto_200842 ) ) ( not ( = ?auto_200839 ?auto_200844 ) ) ( not ( = ?auto_200836 ?auto_200841 ) ) ( not ( = ?auto_200836 ?auto_200843 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200840 ?auto_200841 ?auto_200842 ?auto_200843 )
      ( GET-4IMAGE-VERIFY ?auto_200837 ?auto_200838 ?auto_200839 ?auto_200836 ?auto_200840 ?auto_200841 ?auto_200842 ?auto_200843 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_200848 - DIRECTION
      ?auto_200849 - MODE
      ?auto_200850 - DIRECTION
      ?auto_200847 - MODE
      ?auto_200851 - DIRECTION
      ?auto_200852 - MODE
      ?auto_200853 - DIRECTION
      ?auto_200854 - MODE
    )
    :vars
    (
      ?auto_200858 - INSTRUMENT
      ?auto_200859 - SATELLITE
      ?auto_200856 - DIRECTION
      ?auto_200857 - DIRECTION
      ?auto_200855 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_200858 ?auto_200859 ) ( SUPPORTS ?auto_200858 ?auto_200854 ) ( not ( = ?auto_200853 ?auto_200856 ) ) ( HAVE_IMAGE ?auto_200857 ?auto_200855 ) ( not ( = ?auto_200857 ?auto_200853 ) ) ( not ( = ?auto_200857 ?auto_200856 ) ) ( not ( = ?auto_200855 ?auto_200854 ) ) ( CALIBRATION_TARGET ?auto_200858 ?auto_200856 ) ( POWER_AVAIL ?auto_200859 ) ( POINTING ?auto_200859 ?auto_200851 ) ( not ( = ?auto_200856 ?auto_200851 ) ) ( not ( = ?auto_200853 ?auto_200851 ) ) ( not ( = ?auto_200857 ?auto_200851 ) ) ( HAVE_IMAGE ?auto_200848 ?auto_200849 ) ( HAVE_IMAGE ?auto_200850 ?auto_200847 ) ( HAVE_IMAGE ?auto_200851 ?auto_200852 ) ( not ( = ?auto_200848 ?auto_200850 ) ) ( not ( = ?auto_200848 ?auto_200851 ) ) ( not ( = ?auto_200848 ?auto_200853 ) ) ( not ( = ?auto_200848 ?auto_200856 ) ) ( not ( = ?auto_200848 ?auto_200857 ) ) ( not ( = ?auto_200849 ?auto_200847 ) ) ( not ( = ?auto_200849 ?auto_200852 ) ) ( not ( = ?auto_200849 ?auto_200854 ) ) ( not ( = ?auto_200849 ?auto_200855 ) ) ( not ( = ?auto_200850 ?auto_200851 ) ) ( not ( = ?auto_200850 ?auto_200853 ) ) ( not ( = ?auto_200850 ?auto_200856 ) ) ( not ( = ?auto_200850 ?auto_200857 ) ) ( not ( = ?auto_200847 ?auto_200852 ) ) ( not ( = ?auto_200847 ?auto_200854 ) ) ( not ( = ?auto_200847 ?auto_200855 ) ) ( not ( = ?auto_200852 ?auto_200854 ) ) ( not ( = ?auto_200852 ?auto_200855 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200857 ?auto_200855 ?auto_200853 ?auto_200854 )
      ( GET-4IMAGE-VERIFY ?auto_200848 ?auto_200849 ?auto_200850 ?auto_200847 ?auto_200851 ?auto_200852 ?auto_200853 ?auto_200854 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_200861 - DIRECTION
      ?auto_200862 - MODE
      ?auto_200863 - DIRECTION
      ?auto_200860 - MODE
      ?auto_200864 - DIRECTION
      ?auto_200865 - MODE
      ?auto_200866 - DIRECTION
      ?auto_200867 - MODE
    )
    :vars
    (
      ?auto_200869 - INSTRUMENT
      ?auto_200870 - SATELLITE
      ?auto_200868 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200869 ?auto_200870 ) ( SUPPORTS ?auto_200869 ?auto_200865 ) ( not ( = ?auto_200864 ?auto_200868 ) ) ( HAVE_IMAGE ?auto_200866 ?auto_200867 ) ( not ( = ?auto_200866 ?auto_200864 ) ) ( not ( = ?auto_200866 ?auto_200868 ) ) ( not ( = ?auto_200867 ?auto_200865 ) ) ( CALIBRATION_TARGET ?auto_200869 ?auto_200868 ) ( POWER_AVAIL ?auto_200870 ) ( POINTING ?auto_200870 ?auto_200861 ) ( not ( = ?auto_200868 ?auto_200861 ) ) ( not ( = ?auto_200864 ?auto_200861 ) ) ( not ( = ?auto_200866 ?auto_200861 ) ) ( HAVE_IMAGE ?auto_200861 ?auto_200862 ) ( HAVE_IMAGE ?auto_200863 ?auto_200860 ) ( not ( = ?auto_200861 ?auto_200863 ) ) ( not ( = ?auto_200862 ?auto_200860 ) ) ( not ( = ?auto_200862 ?auto_200865 ) ) ( not ( = ?auto_200862 ?auto_200867 ) ) ( not ( = ?auto_200863 ?auto_200864 ) ) ( not ( = ?auto_200863 ?auto_200866 ) ) ( not ( = ?auto_200863 ?auto_200868 ) ) ( not ( = ?auto_200860 ?auto_200865 ) ) ( not ( = ?auto_200860 ?auto_200867 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200866 ?auto_200867 ?auto_200864 ?auto_200865 )
      ( GET-4IMAGE-VERIFY ?auto_200861 ?auto_200862 ?auto_200863 ?auto_200860 ?auto_200864 ?auto_200865 ?auto_200866 ?auto_200867 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_200872 - DIRECTION
      ?auto_200873 - MODE
      ?auto_200874 - DIRECTION
      ?auto_200871 - MODE
      ?auto_200875 - DIRECTION
      ?auto_200876 - MODE
      ?auto_200877 - DIRECTION
      ?auto_200878 - MODE
    )
    :vars
    (
      ?auto_200882 - INSTRUMENT
      ?auto_200883 - SATELLITE
      ?auto_200880 - DIRECTION
      ?auto_200881 - DIRECTION
      ?auto_200879 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_200882 ?auto_200883 ) ( SUPPORTS ?auto_200882 ?auto_200876 ) ( not ( = ?auto_200875 ?auto_200880 ) ) ( HAVE_IMAGE ?auto_200881 ?auto_200879 ) ( not ( = ?auto_200881 ?auto_200875 ) ) ( not ( = ?auto_200881 ?auto_200880 ) ) ( not ( = ?auto_200879 ?auto_200876 ) ) ( CALIBRATION_TARGET ?auto_200882 ?auto_200880 ) ( POWER_AVAIL ?auto_200883 ) ( POINTING ?auto_200883 ?auto_200874 ) ( not ( = ?auto_200880 ?auto_200874 ) ) ( not ( = ?auto_200875 ?auto_200874 ) ) ( not ( = ?auto_200881 ?auto_200874 ) ) ( HAVE_IMAGE ?auto_200872 ?auto_200873 ) ( HAVE_IMAGE ?auto_200874 ?auto_200871 ) ( HAVE_IMAGE ?auto_200877 ?auto_200878 ) ( not ( = ?auto_200872 ?auto_200874 ) ) ( not ( = ?auto_200872 ?auto_200875 ) ) ( not ( = ?auto_200872 ?auto_200877 ) ) ( not ( = ?auto_200872 ?auto_200880 ) ) ( not ( = ?auto_200872 ?auto_200881 ) ) ( not ( = ?auto_200873 ?auto_200871 ) ) ( not ( = ?auto_200873 ?auto_200876 ) ) ( not ( = ?auto_200873 ?auto_200878 ) ) ( not ( = ?auto_200873 ?auto_200879 ) ) ( not ( = ?auto_200874 ?auto_200877 ) ) ( not ( = ?auto_200871 ?auto_200876 ) ) ( not ( = ?auto_200871 ?auto_200878 ) ) ( not ( = ?auto_200871 ?auto_200879 ) ) ( not ( = ?auto_200875 ?auto_200877 ) ) ( not ( = ?auto_200876 ?auto_200878 ) ) ( not ( = ?auto_200877 ?auto_200880 ) ) ( not ( = ?auto_200877 ?auto_200881 ) ) ( not ( = ?auto_200878 ?auto_200879 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200881 ?auto_200879 ?auto_200875 ?auto_200876 )
      ( GET-4IMAGE-VERIFY ?auto_200872 ?auto_200873 ?auto_200874 ?auto_200871 ?auto_200875 ?auto_200876 ?auto_200877 ?auto_200878 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_200898 - DIRECTION
      ?auto_200899 - MODE
      ?auto_200900 - DIRECTION
      ?auto_200897 - MODE
      ?auto_200901 - DIRECTION
      ?auto_200902 - MODE
      ?auto_200903 - DIRECTION
      ?auto_200904 - MODE
    )
    :vars
    (
      ?auto_200906 - INSTRUMENT
      ?auto_200907 - SATELLITE
      ?auto_200905 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200906 ?auto_200907 ) ( SUPPORTS ?auto_200906 ?auto_200897 ) ( not ( = ?auto_200900 ?auto_200905 ) ) ( HAVE_IMAGE ?auto_200901 ?auto_200904 ) ( not ( = ?auto_200901 ?auto_200900 ) ) ( not ( = ?auto_200901 ?auto_200905 ) ) ( not ( = ?auto_200904 ?auto_200897 ) ) ( CALIBRATION_TARGET ?auto_200906 ?auto_200905 ) ( POWER_AVAIL ?auto_200907 ) ( POINTING ?auto_200907 ?auto_200898 ) ( not ( = ?auto_200905 ?auto_200898 ) ) ( not ( = ?auto_200900 ?auto_200898 ) ) ( not ( = ?auto_200901 ?auto_200898 ) ) ( HAVE_IMAGE ?auto_200898 ?auto_200899 ) ( HAVE_IMAGE ?auto_200901 ?auto_200902 ) ( HAVE_IMAGE ?auto_200903 ?auto_200904 ) ( not ( = ?auto_200898 ?auto_200903 ) ) ( not ( = ?auto_200899 ?auto_200897 ) ) ( not ( = ?auto_200899 ?auto_200902 ) ) ( not ( = ?auto_200899 ?auto_200904 ) ) ( not ( = ?auto_200900 ?auto_200903 ) ) ( not ( = ?auto_200897 ?auto_200902 ) ) ( not ( = ?auto_200901 ?auto_200903 ) ) ( not ( = ?auto_200902 ?auto_200904 ) ) ( not ( = ?auto_200903 ?auto_200905 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200901 ?auto_200904 ?auto_200900 ?auto_200897 )
      ( GET-4IMAGE-VERIFY ?auto_200898 ?auto_200899 ?auto_200900 ?auto_200897 ?auto_200901 ?auto_200902 ?auto_200903 ?auto_200904 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_200909 - DIRECTION
      ?auto_200910 - MODE
      ?auto_200911 - DIRECTION
      ?auto_200908 - MODE
      ?auto_200912 - DIRECTION
      ?auto_200913 - MODE
      ?auto_200914 - DIRECTION
      ?auto_200915 - MODE
    )
    :vars
    (
      ?auto_200917 - INSTRUMENT
      ?auto_200918 - SATELLITE
      ?auto_200916 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200917 ?auto_200918 ) ( SUPPORTS ?auto_200917 ?auto_200908 ) ( not ( = ?auto_200911 ?auto_200916 ) ) ( HAVE_IMAGE ?auto_200912 ?auto_200913 ) ( not ( = ?auto_200912 ?auto_200911 ) ) ( not ( = ?auto_200912 ?auto_200916 ) ) ( not ( = ?auto_200913 ?auto_200908 ) ) ( CALIBRATION_TARGET ?auto_200917 ?auto_200916 ) ( POWER_AVAIL ?auto_200918 ) ( POINTING ?auto_200918 ?auto_200909 ) ( not ( = ?auto_200916 ?auto_200909 ) ) ( not ( = ?auto_200911 ?auto_200909 ) ) ( not ( = ?auto_200912 ?auto_200909 ) ) ( HAVE_IMAGE ?auto_200909 ?auto_200910 ) ( HAVE_IMAGE ?auto_200914 ?auto_200915 ) ( not ( = ?auto_200909 ?auto_200914 ) ) ( not ( = ?auto_200910 ?auto_200908 ) ) ( not ( = ?auto_200910 ?auto_200913 ) ) ( not ( = ?auto_200910 ?auto_200915 ) ) ( not ( = ?auto_200911 ?auto_200914 ) ) ( not ( = ?auto_200908 ?auto_200915 ) ) ( not ( = ?auto_200912 ?auto_200914 ) ) ( not ( = ?auto_200913 ?auto_200915 ) ) ( not ( = ?auto_200914 ?auto_200916 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200912 ?auto_200913 ?auto_200911 ?auto_200908 )
      ( GET-4IMAGE-VERIFY ?auto_200909 ?auto_200910 ?auto_200911 ?auto_200908 ?auto_200912 ?auto_200913 ?auto_200914 ?auto_200915 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_200931 - DIRECTION
      ?auto_200932 - MODE
      ?auto_200933 - DIRECTION
      ?auto_200930 - MODE
      ?auto_200934 - DIRECTION
      ?auto_200935 - MODE
      ?auto_200936 - DIRECTION
      ?auto_200937 - MODE
    )
    :vars
    (
      ?auto_200939 - INSTRUMENT
      ?auto_200940 - SATELLITE
      ?auto_200938 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_200939 ?auto_200940 ) ( SUPPORTS ?auto_200939 ?auto_200930 ) ( not ( = ?auto_200933 ?auto_200938 ) ) ( HAVE_IMAGE ?auto_200936 ?auto_200937 ) ( not ( = ?auto_200936 ?auto_200933 ) ) ( not ( = ?auto_200936 ?auto_200938 ) ) ( not ( = ?auto_200937 ?auto_200930 ) ) ( CALIBRATION_TARGET ?auto_200939 ?auto_200938 ) ( POWER_AVAIL ?auto_200940 ) ( POINTING ?auto_200940 ?auto_200931 ) ( not ( = ?auto_200938 ?auto_200931 ) ) ( not ( = ?auto_200933 ?auto_200931 ) ) ( not ( = ?auto_200936 ?auto_200931 ) ) ( HAVE_IMAGE ?auto_200931 ?auto_200932 ) ( HAVE_IMAGE ?auto_200934 ?auto_200935 ) ( not ( = ?auto_200931 ?auto_200934 ) ) ( not ( = ?auto_200932 ?auto_200930 ) ) ( not ( = ?auto_200932 ?auto_200935 ) ) ( not ( = ?auto_200932 ?auto_200937 ) ) ( not ( = ?auto_200933 ?auto_200934 ) ) ( not ( = ?auto_200930 ?auto_200935 ) ) ( not ( = ?auto_200934 ?auto_200936 ) ) ( not ( = ?auto_200934 ?auto_200938 ) ) ( not ( = ?auto_200935 ?auto_200937 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200936 ?auto_200937 ?auto_200933 ?auto_200930 )
      ( GET-4IMAGE-VERIFY ?auto_200931 ?auto_200932 ?auto_200933 ?auto_200930 ?auto_200934 ?auto_200935 ?auto_200936 ?auto_200937 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_200942 - DIRECTION
      ?auto_200943 - MODE
      ?auto_200944 - DIRECTION
      ?auto_200941 - MODE
      ?auto_200945 - DIRECTION
      ?auto_200946 - MODE
      ?auto_200947 - DIRECTION
      ?auto_200948 - MODE
    )
    :vars
    (
      ?auto_200952 - INSTRUMENT
      ?auto_200953 - SATELLITE
      ?auto_200950 - DIRECTION
      ?auto_200951 - DIRECTION
      ?auto_200949 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_200952 ?auto_200953 ) ( SUPPORTS ?auto_200952 ?auto_200941 ) ( not ( = ?auto_200944 ?auto_200950 ) ) ( HAVE_IMAGE ?auto_200951 ?auto_200949 ) ( not ( = ?auto_200951 ?auto_200944 ) ) ( not ( = ?auto_200951 ?auto_200950 ) ) ( not ( = ?auto_200949 ?auto_200941 ) ) ( CALIBRATION_TARGET ?auto_200952 ?auto_200950 ) ( POWER_AVAIL ?auto_200953 ) ( POINTING ?auto_200953 ?auto_200945 ) ( not ( = ?auto_200950 ?auto_200945 ) ) ( not ( = ?auto_200944 ?auto_200945 ) ) ( not ( = ?auto_200951 ?auto_200945 ) ) ( HAVE_IMAGE ?auto_200942 ?auto_200943 ) ( HAVE_IMAGE ?auto_200945 ?auto_200946 ) ( HAVE_IMAGE ?auto_200947 ?auto_200948 ) ( not ( = ?auto_200942 ?auto_200944 ) ) ( not ( = ?auto_200942 ?auto_200945 ) ) ( not ( = ?auto_200942 ?auto_200947 ) ) ( not ( = ?auto_200942 ?auto_200950 ) ) ( not ( = ?auto_200942 ?auto_200951 ) ) ( not ( = ?auto_200943 ?auto_200941 ) ) ( not ( = ?auto_200943 ?auto_200946 ) ) ( not ( = ?auto_200943 ?auto_200948 ) ) ( not ( = ?auto_200943 ?auto_200949 ) ) ( not ( = ?auto_200944 ?auto_200947 ) ) ( not ( = ?auto_200941 ?auto_200946 ) ) ( not ( = ?auto_200941 ?auto_200948 ) ) ( not ( = ?auto_200945 ?auto_200947 ) ) ( not ( = ?auto_200946 ?auto_200948 ) ) ( not ( = ?auto_200946 ?auto_200949 ) ) ( not ( = ?auto_200947 ?auto_200950 ) ) ( not ( = ?auto_200947 ?auto_200951 ) ) ( not ( = ?auto_200948 ?auto_200949 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200951 ?auto_200949 ?auto_200944 ?auto_200941 )
      ( GET-4IMAGE-VERIFY ?auto_200942 ?auto_200943 ?auto_200944 ?auto_200941 ?auto_200945 ?auto_200946 ?auto_200947 ?auto_200948 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_201005 - DIRECTION
      ?auto_201006 - MODE
      ?auto_201007 - DIRECTION
      ?auto_201004 - MODE
      ?auto_201008 - DIRECTION
      ?auto_201009 - MODE
      ?auto_201010 - DIRECTION
      ?auto_201011 - MODE
    )
    :vars
    (
      ?auto_201013 - INSTRUMENT
      ?auto_201014 - SATELLITE
      ?auto_201012 - DIRECTION
      ?auto_201015 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_201013 ?auto_201014 ) ( SUPPORTS ?auto_201013 ?auto_201006 ) ( not ( = ?auto_201005 ?auto_201012 ) ) ( HAVE_IMAGE ?auto_201007 ?auto_201011 ) ( not ( = ?auto_201007 ?auto_201005 ) ) ( not ( = ?auto_201007 ?auto_201012 ) ) ( not ( = ?auto_201011 ?auto_201006 ) ) ( CALIBRATION_TARGET ?auto_201013 ?auto_201012 ) ( POWER_AVAIL ?auto_201014 ) ( POINTING ?auto_201014 ?auto_201015 ) ( not ( = ?auto_201012 ?auto_201015 ) ) ( not ( = ?auto_201005 ?auto_201015 ) ) ( not ( = ?auto_201007 ?auto_201015 ) ) ( HAVE_IMAGE ?auto_201007 ?auto_201004 ) ( HAVE_IMAGE ?auto_201008 ?auto_201009 ) ( HAVE_IMAGE ?auto_201010 ?auto_201011 ) ( not ( = ?auto_201005 ?auto_201008 ) ) ( not ( = ?auto_201005 ?auto_201010 ) ) ( not ( = ?auto_201006 ?auto_201004 ) ) ( not ( = ?auto_201006 ?auto_201009 ) ) ( not ( = ?auto_201007 ?auto_201008 ) ) ( not ( = ?auto_201007 ?auto_201010 ) ) ( not ( = ?auto_201004 ?auto_201009 ) ) ( not ( = ?auto_201004 ?auto_201011 ) ) ( not ( = ?auto_201008 ?auto_201010 ) ) ( not ( = ?auto_201008 ?auto_201012 ) ) ( not ( = ?auto_201008 ?auto_201015 ) ) ( not ( = ?auto_201009 ?auto_201011 ) ) ( not ( = ?auto_201010 ?auto_201012 ) ) ( not ( = ?auto_201010 ?auto_201015 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201007 ?auto_201011 ?auto_201005 ?auto_201006 )
      ( GET-4IMAGE-VERIFY ?auto_201005 ?auto_201006 ?auto_201007 ?auto_201004 ?auto_201008 ?auto_201009 ?auto_201010 ?auto_201011 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_201017 - DIRECTION
      ?auto_201018 - MODE
      ?auto_201019 - DIRECTION
      ?auto_201016 - MODE
      ?auto_201020 - DIRECTION
      ?auto_201021 - MODE
      ?auto_201022 - DIRECTION
      ?auto_201023 - MODE
    )
    :vars
    (
      ?auto_201025 - INSTRUMENT
      ?auto_201026 - SATELLITE
      ?auto_201024 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_201025 ?auto_201026 ) ( SUPPORTS ?auto_201025 ?auto_201018 ) ( not ( = ?auto_201017 ?auto_201024 ) ) ( HAVE_IMAGE ?auto_201019 ?auto_201016 ) ( not ( = ?auto_201019 ?auto_201017 ) ) ( not ( = ?auto_201019 ?auto_201024 ) ) ( not ( = ?auto_201016 ?auto_201018 ) ) ( CALIBRATION_TARGET ?auto_201025 ?auto_201024 ) ( POWER_AVAIL ?auto_201026 ) ( POINTING ?auto_201026 ?auto_201022 ) ( not ( = ?auto_201024 ?auto_201022 ) ) ( not ( = ?auto_201017 ?auto_201022 ) ) ( not ( = ?auto_201019 ?auto_201022 ) ) ( HAVE_IMAGE ?auto_201020 ?auto_201021 ) ( HAVE_IMAGE ?auto_201022 ?auto_201023 ) ( not ( = ?auto_201017 ?auto_201020 ) ) ( not ( = ?auto_201018 ?auto_201021 ) ) ( not ( = ?auto_201018 ?auto_201023 ) ) ( not ( = ?auto_201019 ?auto_201020 ) ) ( not ( = ?auto_201016 ?auto_201021 ) ) ( not ( = ?auto_201016 ?auto_201023 ) ) ( not ( = ?auto_201020 ?auto_201022 ) ) ( not ( = ?auto_201020 ?auto_201024 ) ) ( not ( = ?auto_201021 ?auto_201023 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201019 ?auto_201016 ?auto_201017 ?auto_201018 )
      ( GET-4IMAGE-VERIFY ?auto_201017 ?auto_201018 ?auto_201019 ?auto_201016 ?auto_201020 ?auto_201021 ?auto_201022 ?auto_201023 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_201040 - DIRECTION
      ?auto_201041 - MODE
      ?auto_201042 - DIRECTION
      ?auto_201039 - MODE
      ?auto_201043 - DIRECTION
      ?auto_201044 - MODE
      ?auto_201045 - DIRECTION
      ?auto_201046 - MODE
    )
    :vars
    (
      ?auto_201048 - INSTRUMENT
      ?auto_201049 - SATELLITE
      ?auto_201047 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_201048 ?auto_201049 ) ( SUPPORTS ?auto_201048 ?auto_201041 ) ( not ( = ?auto_201040 ?auto_201047 ) ) ( HAVE_IMAGE ?auto_201045 ?auto_201046 ) ( not ( = ?auto_201045 ?auto_201040 ) ) ( not ( = ?auto_201045 ?auto_201047 ) ) ( not ( = ?auto_201046 ?auto_201041 ) ) ( CALIBRATION_TARGET ?auto_201048 ?auto_201047 ) ( POWER_AVAIL ?auto_201049 ) ( POINTING ?auto_201049 ?auto_201043 ) ( not ( = ?auto_201047 ?auto_201043 ) ) ( not ( = ?auto_201040 ?auto_201043 ) ) ( not ( = ?auto_201045 ?auto_201043 ) ) ( HAVE_IMAGE ?auto_201042 ?auto_201039 ) ( HAVE_IMAGE ?auto_201043 ?auto_201044 ) ( not ( = ?auto_201040 ?auto_201042 ) ) ( not ( = ?auto_201041 ?auto_201039 ) ) ( not ( = ?auto_201041 ?auto_201044 ) ) ( not ( = ?auto_201042 ?auto_201043 ) ) ( not ( = ?auto_201042 ?auto_201045 ) ) ( not ( = ?auto_201042 ?auto_201047 ) ) ( not ( = ?auto_201039 ?auto_201044 ) ) ( not ( = ?auto_201039 ?auto_201046 ) ) ( not ( = ?auto_201044 ?auto_201046 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201045 ?auto_201046 ?auto_201040 ?auto_201041 )
      ( GET-4IMAGE-VERIFY ?auto_201040 ?auto_201041 ?auto_201042 ?auto_201039 ?auto_201043 ?auto_201044 ?auto_201045 ?auto_201046 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_201051 - DIRECTION
      ?auto_201052 - MODE
      ?auto_201053 - DIRECTION
      ?auto_201050 - MODE
      ?auto_201054 - DIRECTION
      ?auto_201055 - MODE
      ?auto_201056 - DIRECTION
      ?auto_201057 - MODE
    )
    :vars
    (
      ?auto_201059 - INSTRUMENT
      ?auto_201060 - SATELLITE
      ?auto_201058 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_201059 ?auto_201060 ) ( SUPPORTS ?auto_201059 ?auto_201052 ) ( not ( = ?auto_201051 ?auto_201058 ) ) ( HAVE_IMAGE ?auto_201053 ?auto_201050 ) ( not ( = ?auto_201053 ?auto_201051 ) ) ( not ( = ?auto_201053 ?auto_201058 ) ) ( not ( = ?auto_201050 ?auto_201052 ) ) ( CALIBRATION_TARGET ?auto_201059 ?auto_201058 ) ( POWER_AVAIL ?auto_201060 ) ( POINTING ?auto_201060 ?auto_201054 ) ( not ( = ?auto_201058 ?auto_201054 ) ) ( not ( = ?auto_201051 ?auto_201054 ) ) ( not ( = ?auto_201053 ?auto_201054 ) ) ( HAVE_IMAGE ?auto_201054 ?auto_201055 ) ( HAVE_IMAGE ?auto_201056 ?auto_201057 ) ( not ( = ?auto_201051 ?auto_201056 ) ) ( not ( = ?auto_201052 ?auto_201055 ) ) ( not ( = ?auto_201052 ?auto_201057 ) ) ( not ( = ?auto_201053 ?auto_201056 ) ) ( not ( = ?auto_201050 ?auto_201055 ) ) ( not ( = ?auto_201050 ?auto_201057 ) ) ( not ( = ?auto_201054 ?auto_201056 ) ) ( not ( = ?auto_201055 ?auto_201057 ) ) ( not ( = ?auto_201056 ?auto_201058 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201053 ?auto_201050 ?auto_201051 ?auto_201052 )
      ( GET-4IMAGE-VERIFY ?auto_201051 ?auto_201052 ?auto_201053 ?auto_201050 ?auto_201054 ?auto_201055 ?auto_201056 ?auto_201057 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_201108 - DIRECTION
      ?auto_201109 - MODE
      ?auto_201110 - DIRECTION
      ?auto_201107 - MODE
      ?auto_201111 - DIRECTION
      ?auto_201112 - MODE
      ?auto_201113 - DIRECTION
      ?auto_201114 - MODE
    )
    :vars
    (
      ?auto_201116 - INSTRUMENT
      ?auto_201117 - SATELLITE
      ?auto_201115 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_201116 ?auto_201117 ) ( SUPPORTS ?auto_201116 ?auto_201109 ) ( not ( = ?auto_201108 ?auto_201115 ) ) ( HAVE_IMAGE ?auto_201111 ?auto_201114 ) ( not ( = ?auto_201111 ?auto_201108 ) ) ( not ( = ?auto_201111 ?auto_201115 ) ) ( not ( = ?auto_201114 ?auto_201109 ) ) ( CALIBRATION_TARGET ?auto_201116 ?auto_201115 ) ( POWER_AVAIL ?auto_201117 ) ( POINTING ?auto_201117 ?auto_201110 ) ( not ( = ?auto_201115 ?auto_201110 ) ) ( not ( = ?auto_201108 ?auto_201110 ) ) ( not ( = ?auto_201111 ?auto_201110 ) ) ( HAVE_IMAGE ?auto_201110 ?auto_201107 ) ( HAVE_IMAGE ?auto_201111 ?auto_201112 ) ( HAVE_IMAGE ?auto_201113 ?auto_201114 ) ( not ( = ?auto_201108 ?auto_201113 ) ) ( not ( = ?auto_201109 ?auto_201107 ) ) ( not ( = ?auto_201109 ?auto_201112 ) ) ( not ( = ?auto_201110 ?auto_201113 ) ) ( not ( = ?auto_201107 ?auto_201112 ) ) ( not ( = ?auto_201107 ?auto_201114 ) ) ( not ( = ?auto_201111 ?auto_201113 ) ) ( not ( = ?auto_201112 ?auto_201114 ) ) ( not ( = ?auto_201113 ?auto_201115 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201111 ?auto_201114 ?auto_201108 ?auto_201109 )
      ( GET-4IMAGE-VERIFY ?auto_201108 ?auto_201109 ?auto_201110 ?auto_201107 ?auto_201111 ?auto_201112 ?auto_201113 ?auto_201114 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_201119 - DIRECTION
      ?auto_201120 - MODE
      ?auto_201121 - DIRECTION
      ?auto_201118 - MODE
      ?auto_201122 - DIRECTION
      ?auto_201123 - MODE
      ?auto_201124 - DIRECTION
      ?auto_201125 - MODE
    )
    :vars
    (
      ?auto_201127 - INSTRUMENT
      ?auto_201128 - SATELLITE
      ?auto_201126 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_201127 ?auto_201128 ) ( SUPPORTS ?auto_201127 ?auto_201120 ) ( not ( = ?auto_201119 ?auto_201126 ) ) ( HAVE_IMAGE ?auto_201122 ?auto_201123 ) ( not ( = ?auto_201122 ?auto_201119 ) ) ( not ( = ?auto_201122 ?auto_201126 ) ) ( not ( = ?auto_201123 ?auto_201120 ) ) ( CALIBRATION_TARGET ?auto_201127 ?auto_201126 ) ( POWER_AVAIL ?auto_201128 ) ( POINTING ?auto_201128 ?auto_201121 ) ( not ( = ?auto_201126 ?auto_201121 ) ) ( not ( = ?auto_201119 ?auto_201121 ) ) ( not ( = ?auto_201122 ?auto_201121 ) ) ( HAVE_IMAGE ?auto_201121 ?auto_201118 ) ( HAVE_IMAGE ?auto_201124 ?auto_201125 ) ( not ( = ?auto_201119 ?auto_201124 ) ) ( not ( = ?auto_201120 ?auto_201118 ) ) ( not ( = ?auto_201120 ?auto_201125 ) ) ( not ( = ?auto_201121 ?auto_201124 ) ) ( not ( = ?auto_201118 ?auto_201123 ) ) ( not ( = ?auto_201118 ?auto_201125 ) ) ( not ( = ?auto_201122 ?auto_201124 ) ) ( not ( = ?auto_201123 ?auto_201125 ) ) ( not ( = ?auto_201124 ?auto_201126 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201122 ?auto_201123 ?auto_201119 ?auto_201120 )
      ( GET-4IMAGE-VERIFY ?auto_201119 ?auto_201120 ?auto_201121 ?auto_201118 ?auto_201122 ?auto_201123 ?auto_201124 ?auto_201125 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_201152 - DIRECTION
      ?auto_201153 - MODE
      ?auto_201154 - DIRECTION
      ?auto_201151 - MODE
      ?auto_201155 - DIRECTION
      ?auto_201156 - MODE
      ?auto_201157 - DIRECTION
      ?auto_201158 - MODE
    )
    :vars
    (
      ?auto_201162 - INSTRUMENT
      ?auto_201163 - SATELLITE
      ?auto_201160 - DIRECTION
      ?auto_201161 - DIRECTION
      ?auto_201159 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_201162 ?auto_201163 ) ( SUPPORTS ?auto_201162 ?auto_201153 ) ( not ( = ?auto_201152 ?auto_201160 ) ) ( HAVE_IMAGE ?auto_201161 ?auto_201159 ) ( not ( = ?auto_201161 ?auto_201152 ) ) ( not ( = ?auto_201161 ?auto_201160 ) ) ( not ( = ?auto_201159 ?auto_201153 ) ) ( CALIBRATION_TARGET ?auto_201162 ?auto_201160 ) ( POWER_AVAIL ?auto_201163 ) ( POINTING ?auto_201163 ?auto_201154 ) ( not ( = ?auto_201160 ?auto_201154 ) ) ( not ( = ?auto_201152 ?auto_201154 ) ) ( not ( = ?auto_201161 ?auto_201154 ) ) ( HAVE_IMAGE ?auto_201154 ?auto_201151 ) ( HAVE_IMAGE ?auto_201155 ?auto_201156 ) ( HAVE_IMAGE ?auto_201157 ?auto_201158 ) ( not ( = ?auto_201152 ?auto_201155 ) ) ( not ( = ?auto_201152 ?auto_201157 ) ) ( not ( = ?auto_201153 ?auto_201151 ) ) ( not ( = ?auto_201153 ?auto_201156 ) ) ( not ( = ?auto_201153 ?auto_201158 ) ) ( not ( = ?auto_201154 ?auto_201155 ) ) ( not ( = ?auto_201154 ?auto_201157 ) ) ( not ( = ?auto_201151 ?auto_201156 ) ) ( not ( = ?auto_201151 ?auto_201158 ) ) ( not ( = ?auto_201151 ?auto_201159 ) ) ( not ( = ?auto_201155 ?auto_201157 ) ) ( not ( = ?auto_201155 ?auto_201160 ) ) ( not ( = ?auto_201155 ?auto_201161 ) ) ( not ( = ?auto_201156 ?auto_201158 ) ) ( not ( = ?auto_201156 ?auto_201159 ) ) ( not ( = ?auto_201157 ?auto_201160 ) ) ( not ( = ?auto_201157 ?auto_201161 ) ) ( not ( = ?auto_201158 ?auto_201159 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201161 ?auto_201159 ?auto_201152 ?auto_201153 )
      ( GET-4IMAGE-VERIFY ?auto_201152 ?auto_201153 ?auto_201154 ?auto_201151 ?auto_201155 ?auto_201156 ?auto_201157 ?auto_201158 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_201325 - DIRECTION
      ?auto_201326 - MODE
    )
    :vars
    (
      ?auto_201330 - INSTRUMENT
      ?auto_201331 - SATELLITE
      ?auto_201328 - DIRECTION
      ?auto_201329 - DIRECTION
      ?auto_201327 - MODE
      ?auto_201332 - DIRECTION
      ?auto_201333 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201330 ?auto_201331 ) ( SUPPORTS ?auto_201330 ?auto_201326 ) ( not ( = ?auto_201325 ?auto_201328 ) ) ( HAVE_IMAGE ?auto_201329 ?auto_201327 ) ( not ( = ?auto_201329 ?auto_201325 ) ) ( not ( = ?auto_201329 ?auto_201328 ) ) ( not ( = ?auto_201327 ?auto_201326 ) ) ( CALIBRATION_TARGET ?auto_201330 ?auto_201328 ) ( POINTING ?auto_201331 ?auto_201332 ) ( not ( = ?auto_201328 ?auto_201332 ) ) ( not ( = ?auto_201325 ?auto_201332 ) ) ( not ( = ?auto_201329 ?auto_201332 ) ) ( ON_BOARD ?auto_201333 ?auto_201331 ) ( POWER_ON ?auto_201333 ) ( not ( = ?auto_201330 ?auto_201333 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_201333 ?auto_201331 )
      ( GET-2IMAGE ?auto_201329 ?auto_201327 ?auto_201325 ?auto_201326 )
      ( GET-1IMAGE-VERIFY ?auto_201325 ?auto_201326 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_201335 - DIRECTION
      ?auto_201336 - MODE
      ?auto_201337 - DIRECTION
      ?auto_201334 - MODE
    )
    :vars
    (
      ?auto_201341 - INSTRUMENT
      ?auto_201340 - SATELLITE
      ?auto_201338 - DIRECTION
      ?auto_201342 - DIRECTION
      ?auto_201339 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201341 ?auto_201340 ) ( SUPPORTS ?auto_201341 ?auto_201334 ) ( not ( = ?auto_201337 ?auto_201338 ) ) ( HAVE_IMAGE ?auto_201335 ?auto_201336 ) ( not ( = ?auto_201335 ?auto_201337 ) ) ( not ( = ?auto_201335 ?auto_201338 ) ) ( not ( = ?auto_201336 ?auto_201334 ) ) ( CALIBRATION_TARGET ?auto_201341 ?auto_201338 ) ( POINTING ?auto_201340 ?auto_201342 ) ( not ( = ?auto_201338 ?auto_201342 ) ) ( not ( = ?auto_201337 ?auto_201342 ) ) ( not ( = ?auto_201335 ?auto_201342 ) ) ( ON_BOARD ?auto_201339 ?auto_201340 ) ( POWER_ON ?auto_201339 ) ( not ( = ?auto_201341 ?auto_201339 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_201337 ?auto_201334 )
      ( GET-2IMAGE-VERIFY ?auto_201335 ?auto_201336 ?auto_201337 ?auto_201334 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_201344 - DIRECTION
      ?auto_201345 - MODE
      ?auto_201346 - DIRECTION
      ?auto_201343 - MODE
    )
    :vars
    (
      ?auto_201347 - INSTRUMENT
      ?auto_201350 - SATELLITE
      ?auto_201348 - DIRECTION
      ?auto_201352 - DIRECTION
      ?auto_201351 - MODE
      ?auto_201349 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201347 ?auto_201350 ) ( SUPPORTS ?auto_201347 ?auto_201343 ) ( not ( = ?auto_201346 ?auto_201348 ) ) ( HAVE_IMAGE ?auto_201352 ?auto_201351 ) ( not ( = ?auto_201352 ?auto_201346 ) ) ( not ( = ?auto_201352 ?auto_201348 ) ) ( not ( = ?auto_201351 ?auto_201343 ) ) ( CALIBRATION_TARGET ?auto_201347 ?auto_201348 ) ( POINTING ?auto_201350 ?auto_201344 ) ( not ( = ?auto_201348 ?auto_201344 ) ) ( not ( = ?auto_201346 ?auto_201344 ) ) ( not ( = ?auto_201352 ?auto_201344 ) ) ( ON_BOARD ?auto_201349 ?auto_201350 ) ( POWER_ON ?auto_201349 ) ( not ( = ?auto_201347 ?auto_201349 ) ) ( HAVE_IMAGE ?auto_201344 ?auto_201345 ) ( not ( = ?auto_201345 ?auto_201343 ) ) ( not ( = ?auto_201345 ?auto_201351 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201352 ?auto_201351 ?auto_201346 ?auto_201343 )
      ( GET-2IMAGE-VERIFY ?auto_201344 ?auto_201345 ?auto_201346 ?auto_201343 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_201354 - DIRECTION
      ?auto_201355 - MODE
      ?auto_201356 - DIRECTION
      ?auto_201353 - MODE
    )
    :vars
    (
      ?auto_201357 - INSTRUMENT
      ?auto_201361 - SATELLITE
      ?auto_201358 - DIRECTION
      ?auto_201360 - DIRECTION
      ?auto_201359 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201357 ?auto_201361 ) ( SUPPORTS ?auto_201357 ?auto_201355 ) ( not ( = ?auto_201354 ?auto_201358 ) ) ( HAVE_IMAGE ?auto_201356 ?auto_201353 ) ( not ( = ?auto_201356 ?auto_201354 ) ) ( not ( = ?auto_201356 ?auto_201358 ) ) ( not ( = ?auto_201353 ?auto_201355 ) ) ( CALIBRATION_TARGET ?auto_201357 ?auto_201358 ) ( POINTING ?auto_201361 ?auto_201360 ) ( not ( = ?auto_201358 ?auto_201360 ) ) ( not ( = ?auto_201354 ?auto_201360 ) ) ( not ( = ?auto_201356 ?auto_201360 ) ) ( ON_BOARD ?auto_201359 ?auto_201361 ) ( POWER_ON ?auto_201359 ) ( not ( = ?auto_201357 ?auto_201359 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201356 ?auto_201353 ?auto_201354 ?auto_201355 )
      ( GET-2IMAGE-VERIFY ?auto_201354 ?auto_201355 ?auto_201356 ?auto_201353 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_201363 - DIRECTION
      ?auto_201364 - MODE
      ?auto_201365 - DIRECTION
      ?auto_201362 - MODE
    )
    :vars
    (
      ?auto_201366 - INSTRUMENT
      ?auto_201369 - SATELLITE
      ?auto_201367 - DIRECTION
      ?auto_201371 - DIRECTION
      ?auto_201370 - MODE
      ?auto_201368 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201366 ?auto_201369 ) ( SUPPORTS ?auto_201366 ?auto_201364 ) ( not ( = ?auto_201363 ?auto_201367 ) ) ( HAVE_IMAGE ?auto_201371 ?auto_201370 ) ( not ( = ?auto_201371 ?auto_201363 ) ) ( not ( = ?auto_201371 ?auto_201367 ) ) ( not ( = ?auto_201370 ?auto_201364 ) ) ( CALIBRATION_TARGET ?auto_201366 ?auto_201367 ) ( POINTING ?auto_201369 ?auto_201365 ) ( not ( = ?auto_201367 ?auto_201365 ) ) ( not ( = ?auto_201363 ?auto_201365 ) ) ( not ( = ?auto_201371 ?auto_201365 ) ) ( ON_BOARD ?auto_201368 ?auto_201369 ) ( POWER_ON ?auto_201368 ) ( not ( = ?auto_201366 ?auto_201368 ) ) ( HAVE_IMAGE ?auto_201365 ?auto_201362 ) ( not ( = ?auto_201364 ?auto_201362 ) ) ( not ( = ?auto_201362 ?auto_201370 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201371 ?auto_201370 ?auto_201363 ?auto_201364 )
      ( GET-2IMAGE-VERIFY ?auto_201363 ?auto_201364 ?auto_201365 ?auto_201362 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_201384 - DIRECTION
      ?auto_201385 - MODE
      ?auto_201386 - DIRECTION
      ?auto_201383 - MODE
      ?auto_201387 - DIRECTION
      ?auto_201388 - MODE
    )
    :vars
    (
      ?auto_201389 - INSTRUMENT
      ?auto_201393 - SATELLITE
      ?auto_201390 - DIRECTION
      ?auto_201392 - DIRECTION
      ?auto_201391 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201389 ?auto_201393 ) ( SUPPORTS ?auto_201389 ?auto_201388 ) ( not ( = ?auto_201387 ?auto_201390 ) ) ( HAVE_IMAGE ?auto_201384 ?auto_201383 ) ( not ( = ?auto_201384 ?auto_201387 ) ) ( not ( = ?auto_201384 ?auto_201390 ) ) ( not ( = ?auto_201383 ?auto_201388 ) ) ( CALIBRATION_TARGET ?auto_201389 ?auto_201390 ) ( POINTING ?auto_201393 ?auto_201392 ) ( not ( = ?auto_201390 ?auto_201392 ) ) ( not ( = ?auto_201387 ?auto_201392 ) ) ( not ( = ?auto_201384 ?auto_201392 ) ) ( ON_BOARD ?auto_201391 ?auto_201393 ) ( POWER_ON ?auto_201391 ) ( not ( = ?auto_201389 ?auto_201391 ) ) ( HAVE_IMAGE ?auto_201384 ?auto_201385 ) ( HAVE_IMAGE ?auto_201386 ?auto_201383 ) ( not ( = ?auto_201384 ?auto_201386 ) ) ( not ( = ?auto_201385 ?auto_201383 ) ) ( not ( = ?auto_201385 ?auto_201388 ) ) ( not ( = ?auto_201386 ?auto_201387 ) ) ( not ( = ?auto_201386 ?auto_201390 ) ) ( not ( = ?auto_201386 ?auto_201392 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201384 ?auto_201383 ?auto_201387 ?auto_201388 )
      ( GET-3IMAGE-VERIFY ?auto_201384 ?auto_201385 ?auto_201386 ?auto_201383 ?auto_201387 ?auto_201388 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_201395 - DIRECTION
      ?auto_201396 - MODE
      ?auto_201397 - DIRECTION
      ?auto_201394 - MODE
      ?auto_201398 - DIRECTION
      ?auto_201399 - MODE
    )
    :vars
    (
      ?auto_201400 - INSTRUMENT
      ?auto_201403 - SATELLITE
      ?auto_201401 - DIRECTION
      ?auto_201402 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201400 ?auto_201403 ) ( SUPPORTS ?auto_201400 ?auto_201399 ) ( not ( = ?auto_201398 ?auto_201401 ) ) ( HAVE_IMAGE ?auto_201395 ?auto_201396 ) ( not ( = ?auto_201395 ?auto_201398 ) ) ( not ( = ?auto_201395 ?auto_201401 ) ) ( not ( = ?auto_201396 ?auto_201399 ) ) ( CALIBRATION_TARGET ?auto_201400 ?auto_201401 ) ( POINTING ?auto_201403 ?auto_201397 ) ( not ( = ?auto_201401 ?auto_201397 ) ) ( not ( = ?auto_201398 ?auto_201397 ) ) ( not ( = ?auto_201395 ?auto_201397 ) ) ( ON_BOARD ?auto_201402 ?auto_201403 ) ( POWER_ON ?auto_201402 ) ( not ( = ?auto_201400 ?auto_201402 ) ) ( HAVE_IMAGE ?auto_201397 ?auto_201394 ) ( not ( = ?auto_201396 ?auto_201394 ) ) ( not ( = ?auto_201394 ?auto_201399 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201395 ?auto_201396 ?auto_201398 ?auto_201399 )
      ( GET-3IMAGE-VERIFY ?auto_201395 ?auto_201396 ?auto_201397 ?auto_201394 ?auto_201398 ?auto_201399 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_201405 - DIRECTION
      ?auto_201406 - MODE
      ?auto_201407 - DIRECTION
      ?auto_201404 - MODE
      ?auto_201408 - DIRECTION
      ?auto_201409 - MODE
    )
    :vars
    (
      ?auto_201410 - INSTRUMENT
      ?auto_201414 - SATELLITE
      ?auto_201411 - DIRECTION
      ?auto_201413 - DIRECTION
      ?auto_201412 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201410 ?auto_201414 ) ( SUPPORTS ?auto_201410 ?auto_201404 ) ( not ( = ?auto_201407 ?auto_201411 ) ) ( HAVE_IMAGE ?auto_201408 ?auto_201409 ) ( not ( = ?auto_201408 ?auto_201407 ) ) ( not ( = ?auto_201408 ?auto_201411 ) ) ( not ( = ?auto_201409 ?auto_201404 ) ) ( CALIBRATION_TARGET ?auto_201410 ?auto_201411 ) ( POINTING ?auto_201414 ?auto_201413 ) ( not ( = ?auto_201411 ?auto_201413 ) ) ( not ( = ?auto_201407 ?auto_201413 ) ) ( not ( = ?auto_201408 ?auto_201413 ) ) ( ON_BOARD ?auto_201412 ?auto_201414 ) ( POWER_ON ?auto_201412 ) ( not ( = ?auto_201410 ?auto_201412 ) ) ( HAVE_IMAGE ?auto_201405 ?auto_201406 ) ( not ( = ?auto_201405 ?auto_201407 ) ) ( not ( = ?auto_201405 ?auto_201408 ) ) ( not ( = ?auto_201405 ?auto_201411 ) ) ( not ( = ?auto_201405 ?auto_201413 ) ) ( not ( = ?auto_201406 ?auto_201404 ) ) ( not ( = ?auto_201406 ?auto_201409 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201408 ?auto_201409 ?auto_201407 ?auto_201404 )
      ( GET-3IMAGE-VERIFY ?auto_201405 ?auto_201406 ?auto_201407 ?auto_201404 ?auto_201408 ?auto_201409 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_201416 - DIRECTION
      ?auto_201417 - MODE
      ?auto_201418 - DIRECTION
      ?auto_201415 - MODE
      ?auto_201419 - DIRECTION
      ?auto_201420 - MODE
    )
    :vars
    (
      ?auto_201421 - INSTRUMENT
      ?auto_201424 - SATELLITE
      ?auto_201422 - DIRECTION
      ?auto_201423 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201421 ?auto_201424 ) ( SUPPORTS ?auto_201421 ?auto_201415 ) ( not ( = ?auto_201418 ?auto_201422 ) ) ( HAVE_IMAGE ?auto_201416 ?auto_201417 ) ( not ( = ?auto_201416 ?auto_201418 ) ) ( not ( = ?auto_201416 ?auto_201422 ) ) ( not ( = ?auto_201417 ?auto_201415 ) ) ( CALIBRATION_TARGET ?auto_201421 ?auto_201422 ) ( POINTING ?auto_201424 ?auto_201419 ) ( not ( = ?auto_201422 ?auto_201419 ) ) ( not ( = ?auto_201418 ?auto_201419 ) ) ( not ( = ?auto_201416 ?auto_201419 ) ) ( ON_BOARD ?auto_201423 ?auto_201424 ) ( POWER_ON ?auto_201423 ) ( not ( = ?auto_201421 ?auto_201423 ) ) ( HAVE_IMAGE ?auto_201419 ?auto_201420 ) ( not ( = ?auto_201417 ?auto_201420 ) ) ( not ( = ?auto_201415 ?auto_201420 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201416 ?auto_201417 ?auto_201418 ?auto_201415 )
      ( GET-3IMAGE-VERIFY ?auto_201416 ?auto_201417 ?auto_201418 ?auto_201415 ?auto_201419 ?auto_201420 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_201437 - DIRECTION
      ?auto_201438 - MODE
      ?auto_201439 - DIRECTION
      ?auto_201436 - MODE
      ?auto_201440 - DIRECTION
      ?auto_201441 - MODE
    )
    :vars
    (
      ?auto_201442 - INSTRUMENT
      ?auto_201445 - SATELLITE
      ?auto_201443 - DIRECTION
      ?auto_201444 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201442 ?auto_201445 ) ( SUPPORTS ?auto_201442 ?auto_201441 ) ( not ( = ?auto_201440 ?auto_201443 ) ) ( HAVE_IMAGE ?auto_201439 ?auto_201436 ) ( not ( = ?auto_201439 ?auto_201440 ) ) ( not ( = ?auto_201439 ?auto_201443 ) ) ( not ( = ?auto_201436 ?auto_201441 ) ) ( CALIBRATION_TARGET ?auto_201442 ?auto_201443 ) ( POINTING ?auto_201445 ?auto_201437 ) ( not ( = ?auto_201443 ?auto_201437 ) ) ( not ( = ?auto_201440 ?auto_201437 ) ) ( not ( = ?auto_201439 ?auto_201437 ) ) ( ON_BOARD ?auto_201444 ?auto_201445 ) ( POWER_ON ?auto_201444 ) ( not ( = ?auto_201442 ?auto_201444 ) ) ( HAVE_IMAGE ?auto_201437 ?auto_201438 ) ( not ( = ?auto_201438 ?auto_201436 ) ) ( not ( = ?auto_201438 ?auto_201441 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201439 ?auto_201436 ?auto_201440 ?auto_201441 )
      ( GET-3IMAGE-VERIFY ?auto_201437 ?auto_201438 ?auto_201439 ?auto_201436 ?auto_201440 ?auto_201441 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_201447 - DIRECTION
      ?auto_201448 - MODE
      ?auto_201449 - DIRECTION
      ?auto_201446 - MODE
      ?auto_201450 - DIRECTION
      ?auto_201451 - MODE
    )
    :vars
    (
      ?auto_201452 - INSTRUMENT
      ?auto_201455 - SATELLITE
      ?auto_201453 - DIRECTION
      ?auto_201457 - DIRECTION
      ?auto_201456 - MODE
      ?auto_201454 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201452 ?auto_201455 ) ( SUPPORTS ?auto_201452 ?auto_201451 ) ( not ( = ?auto_201450 ?auto_201453 ) ) ( HAVE_IMAGE ?auto_201457 ?auto_201456 ) ( not ( = ?auto_201457 ?auto_201450 ) ) ( not ( = ?auto_201457 ?auto_201453 ) ) ( not ( = ?auto_201456 ?auto_201451 ) ) ( CALIBRATION_TARGET ?auto_201452 ?auto_201453 ) ( POINTING ?auto_201455 ?auto_201449 ) ( not ( = ?auto_201453 ?auto_201449 ) ) ( not ( = ?auto_201450 ?auto_201449 ) ) ( not ( = ?auto_201457 ?auto_201449 ) ) ( ON_BOARD ?auto_201454 ?auto_201455 ) ( POWER_ON ?auto_201454 ) ( not ( = ?auto_201452 ?auto_201454 ) ) ( HAVE_IMAGE ?auto_201447 ?auto_201448 ) ( HAVE_IMAGE ?auto_201449 ?auto_201446 ) ( not ( = ?auto_201447 ?auto_201449 ) ) ( not ( = ?auto_201447 ?auto_201450 ) ) ( not ( = ?auto_201447 ?auto_201453 ) ) ( not ( = ?auto_201447 ?auto_201457 ) ) ( not ( = ?auto_201448 ?auto_201446 ) ) ( not ( = ?auto_201448 ?auto_201451 ) ) ( not ( = ?auto_201448 ?auto_201456 ) ) ( not ( = ?auto_201446 ?auto_201451 ) ) ( not ( = ?auto_201446 ?auto_201456 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201457 ?auto_201456 ?auto_201450 ?auto_201451 )
      ( GET-3IMAGE-VERIFY ?auto_201447 ?auto_201448 ?auto_201449 ?auto_201446 ?auto_201450 ?auto_201451 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_201459 - DIRECTION
      ?auto_201460 - MODE
      ?auto_201461 - DIRECTION
      ?auto_201458 - MODE
      ?auto_201462 - DIRECTION
      ?auto_201463 - MODE
    )
    :vars
    (
      ?auto_201464 - INSTRUMENT
      ?auto_201467 - SATELLITE
      ?auto_201465 - DIRECTION
      ?auto_201466 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201464 ?auto_201467 ) ( SUPPORTS ?auto_201464 ?auto_201458 ) ( not ( = ?auto_201461 ?auto_201465 ) ) ( HAVE_IMAGE ?auto_201462 ?auto_201463 ) ( not ( = ?auto_201462 ?auto_201461 ) ) ( not ( = ?auto_201462 ?auto_201465 ) ) ( not ( = ?auto_201463 ?auto_201458 ) ) ( CALIBRATION_TARGET ?auto_201464 ?auto_201465 ) ( POINTING ?auto_201467 ?auto_201459 ) ( not ( = ?auto_201465 ?auto_201459 ) ) ( not ( = ?auto_201461 ?auto_201459 ) ) ( not ( = ?auto_201462 ?auto_201459 ) ) ( ON_BOARD ?auto_201466 ?auto_201467 ) ( POWER_ON ?auto_201466 ) ( not ( = ?auto_201464 ?auto_201466 ) ) ( HAVE_IMAGE ?auto_201459 ?auto_201460 ) ( not ( = ?auto_201460 ?auto_201458 ) ) ( not ( = ?auto_201460 ?auto_201463 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201462 ?auto_201463 ?auto_201461 ?auto_201458 )
      ( GET-3IMAGE-VERIFY ?auto_201459 ?auto_201460 ?auto_201461 ?auto_201458 ?auto_201462 ?auto_201463 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_201469 - DIRECTION
      ?auto_201470 - MODE
      ?auto_201471 - DIRECTION
      ?auto_201468 - MODE
      ?auto_201472 - DIRECTION
      ?auto_201473 - MODE
    )
    :vars
    (
      ?auto_201474 - INSTRUMENT
      ?auto_201477 - SATELLITE
      ?auto_201475 - DIRECTION
      ?auto_201479 - DIRECTION
      ?auto_201478 - MODE
      ?auto_201476 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201474 ?auto_201477 ) ( SUPPORTS ?auto_201474 ?auto_201468 ) ( not ( = ?auto_201471 ?auto_201475 ) ) ( HAVE_IMAGE ?auto_201479 ?auto_201478 ) ( not ( = ?auto_201479 ?auto_201471 ) ) ( not ( = ?auto_201479 ?auto_201475 ) ) ( not ( = ?auto_201478 ?auto_201468 ) ) ( CALIBRATION_TARGET ?auto_201474 ?auto_201475 ) ( POINTING ?auto_201477 ?auto_201469 ) ( not ( = ?auto_201475 ?auto_201469 ) ) ( not ( = ?auto_201471 ?auto_201469 ) ) ( not ( = ?auto_201479 ?auto_201469 ) ) ( ON_BOARD ?auto_201476 ?auto_201477 ) ( POWER_ON ?auto_201476 ) ( not ( = ?auto_201474 ?auto_201476 ) ) ( HAVE_IMAGE ?auto_201469 ?auto_201470 ) ( HAVE_IMAGE ?auto_201472 ?auto_201473 ) ( not ( = ?auto_201469 ?auto_201472 ) ) ( not ( = ?auto_201470 ?auto_201468 ) ) ( not ( = ?auto_201470 ?auto_201473 ) ) ( not ( = ?auto_201470 ?auto_201478 ) ) ( not ( = ?auto_201471 ?auto_201472 ) ) ( not ( = ?auto_201468 ?auto_201473 ) ) ( not ( = ?auto_201472 ?auto_201475 ) ) ( not ( = ?auto_201472 ?auto_201479 ) ) ( not ( = ?auto_201473 ?auto_201478 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201479 ?auto_201478 ?auto_201471 ?auto_201468 )
      ( GET-3IMAGE-VERIFY ?auto_201469 ?auto_201470 ?auto_201471 ?auto_201468 ?auto_201472 ?auto_201473 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_201493 - DIRECTION
      ?auto_201494 - MODE
      ?auto_201495 - DIRECTION
      ?auto_201492 - MODE
      ?auto_201496 - DIRECTION
      ?auto_201497 - MODE
    )
    :vars
    (
      ?auto_201498 - INSTRUMENT
      ?auto_201502 - SATELLITE
      ?auto_201499 - DIRECTION
      ?auto_201501 - DIRECTION
      ?auto_201500 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201498 ?auto_201502 ) ( SUPPORTS ?auto_201498 ?auto_201494 ) ( not ( = ?auto_201493 ?auto_201499 ) ) ( HAVE_IMAGE ?auto_201495 ?auto_201497 ) ( not ( = ?auto_201495 ?auto_201493 ) ) ( not ( = ?auto_201495 ?auto_201499 ) ) ( not ( = ?auto_201497 ?auto_201494 ) ) ( CALIBRATION_TARGET ?auto_201498 ?auto_201499 ) ( POINTING ?auto_201502 ?auto_201501 ) ( not ( = ?auto_201499 ?auto_201501 ) ) ( not ( = ?auto_201493 ?auto_201501 ) ) ( not ( = ?auto_201495 ?auto_201501 ) ) ( ON_BOARD ?auto_201500 ?auto_201502 ) ( POWER_ON ?auto_201500 ) ( not ( = ?auto_201498 ?auto_201500 ) ) ( HAVE_IMAGE ?auto_201495 ?auto_201492 ) ( HAVE_IMAGE ?auto_201496 ?auto_201497 ) ( not ( = ?auto_201493 ?auto_201496 ) ) ( not ( = ?auto_201494 ?auto_201492 ) ) ( not ( = ?auto_201495 ?auto_201496 ) ) ( not ( = ?auto_201492 ?auto_201497 ) ) ( not ( = ?auto_201496 ?auto_201499 ) ) ( not ( = ?auto_201496 ?auto_201501 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201495 ?auto_201497 ?auto_201493 ?auto_201494 )
      ( GET-3IMAGE-VERIFY ?auto_201493 ?auto_201494 ?auto_201495 ?auto_201492 ?auto_201496 ?auto_201497 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_201504 - DIRECTION
      ?auto_201505 - MODE
      ?auto_201506 - DIRECTION
      ?auto_201503 - MODE
      ?auto_201507 - DIRECTION
      ?auto_201508 - MODE
    )
    :vars
    (
      ?auto_201509 - INSTRUMENT
      ?auto_201512 - SATELLITE
      ?auto_201510 - DIRECTION
      ?auto_201511 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201509 ?auto_201512 ) ( SUPPORTS ?auto_201509 ?auto_201505 ) ( not ( = ?auto_201504 ?auto_201510 ) ) ( HAVE_IMAGE ?auto_201506 ?auto_201503 ) ( not ( = ?auto_201506 ?auto_201504 ) ) ( not ( = ?auto_201506 ?auto_201510 ) ) ( not ( = ?auto_201503 ?auto_201505 ) ) ( CALIBRATION_TARGET ?auto_201509 ?auto_201510 ) ( POINTING ?auto_201512 ?auto_201507 ) ( not ( = ?auto_201510 ?auto_201507 ) ) ( not ( = ?auto_201504 ?auto_201507 ) ) ( not ( = ?auto_201506 ?auto_201507 ) ) ( ON_BOARD ?auto_201511 ?auto_201512 ) ( POWER_ON ?auto_201511 ) ( not ( = ?auto_201509 ?auto_201511 ) ) ( HAVE_IMAGE ?auto_201507 ?auto_201508 ) ( not ( = ?auto_201505 ?auto_201508 ) ) ( not ( = ?auto_201503 ?auto_201508 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201506 ?auto_201503 ?auto_201504 ?auto_201505 )
      ( GET-3IMAGE-VERIFY ?auto_201504 ?auto_201505 ?auto_201506 ?auto_201503 ?auto_201507 ?auto_201508 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_201525 - DIRECTION
      ?auto_201526 - MODE
      ?auto_201527 - DIRECTION
      ?auto_201524 - MODE
      ?auto_201528 - DIRECTION
      ?auto_201529 - MODE
    )
    :vars
    (
      ?auto_201530 - INSTRUMENT
      ?auto_201533 - SATELLITE
      ?auto_201531 - DIRECTION
      ?auto_201532 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201530 ?auto_201533 ) ( SUPPORTS ?auto_201530 ?auto_201526 ) ( not ( = ?auto_201525 ?auto_201531 ) ) ( HAVE_IMAGE ?auto_201528 ?auto_201529 ) ( not ( = ?auto_201528 ?auto_201525 ) ) ( not ( = ?auto_201528 ?auto_201531 ) ) ( not ( = ?auto_201529 ?auto_201526 ) ) ( CALIBRATION_TARGET ?auto_201530 ?auto_201531 ) ( POINTING ?auto_201533 ?auto_201527 ) ( not ( = ?auto_201531 ?auto_201527 ) ) ( not ( = ?auto_201525 ?auto_201527 ) ) ( not ( = ?auto_201528 ?auto_201527 ) ) ( ON_BOARD ?auto_201532 ?auto_201533 ) ( POWER_ON ?auto_201532 ) ( not ( = ?auto_201530 ?auto_201532 ) ) ( HAVE_IMAGE ?auto_201527 ?auto_201524 ) ( not ( = ?auto_201526 ?auto_201524 ) ) ( not ( = ?auto_201524 ?auto_201529 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201528 ?auto_201529 ?auto_201525 ?auto_201526 )
      ( GET-3IMAGE-VERIFY ?auto_201525 ?auto_201526 ?auto_201527 ?auto_201524 ?auto_201528 ?auto_201529 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_201535 - DIRECTION
      ?auto_201536 - MODE
      ?auto_201537 - DIRECTION
      ?auto_201534 - MODE
      ?auto_201538 - DIRECTION
      ?auto_201539 - MODE
    )
    :vars
    (
      ?auto_201540 - INSTRUMENT
      ?auto_201543 - SATELLITE
      ?auto_201541 - DIRECTION
      ?auto_201545 - DIRECTION
      ?auto_201544 - MODE
      ?auto_201542 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201540 ?auto_201543 ) ( SUPPORTS ?auto_201540 ?auto_201536 ) ( not ( = ?auto_201535 ?auto_201541 ) ) ( HAVE_IMAGE ?auto_201545 ?auto_201544 ) ( not ( = ?auto_201545 ?auto_201535 ) ) ( not ( = ?auto_201545 ?auto_201541 ) ) ( not ( = ?auto_201544 ?auto_201536 ) ) ( CALIBRATION_TARGET ?auto_201540 ?auto_201541 ) ( POINTING ?auto_201543 ?auto_201538 ) ( not ( = ?auto_201541 ?auto_201538 ) ) ( not ( = ?auto_201535 ?auto_201538 ) ) ( not ( = ?auto_201545 ?auto_201538 ) ) ( ON_BOARD ?auto_201542 ?auto_201543 ) ( POWER_ON ?auto_201542 ) ( not ( = ?auto_201540 ?auto_201542 ) ) ( HAVE_IMAGE ?auto_201537 ?auto_201534 ) ( HAVE_IMAGE ?auto_201538 ?auto_201539 ) ( not ( = ?auto_201535 ?auto_201537 ) ) ( not ( = ?auto_201536 ?auto_201534 ) ) ( not ( = ?auto_201536 ?auto_201539 ) ) ( not ( = ?auto_201537 ?auto_201538 ) ) ( not ( = ?auto_201537 ?auto_201541 ) ) ( not ( = ?auto_201537 ?auto_201545 ) ) ( not ( = ?auto_201534 ?auto_201539 ) ) ( not ( = ?auto_201534 ?auto_201544 ) ) ( not ( = ?auto_201539 ?auto_201544 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201545 ?auto_201544 ?auto_201535 ?auto_201536 )
      ( GET-3IMAGE-VERIFY ?auto_201535 ?auto_201536 ?auto_201537 ?auto_201534 ?auto_201538 ?auto_201539 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_201595 - DIRECTION
      ?auto_201596 - MODE
      ?auto_201597 - DIRECTION
      ?auto_201594 - MODE
      ?auto_201598 - DIRECTION
      ?auto_201599 - MODE
      ?auto_201600 - DIRECTION
      ?auto_201601 - MODE
    )
    :vars
    (
      ?auto_201602 - INSTRUMENT
      ?auto_201606 - SATELLITE
      ?auto_201603 - DIRECTION
      ?auto_201605 - DIRECTION
      ?auto_201604 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201602 ?auto_201606 ) ( SUPPORTS ?auto_201602 ?auto_201601 ) ( not ( = ?auto_201600 ?auto_201603 ) ) ( HAVE_IMAGE ?auto_201595 ?auto_201596 ) ( not ( = ?auto_201595 ?auto_201600 ) ) ( not ( = ?auto_201595 ?auto_201603 ) ) ( not ( = ?auto_201596 ?auto_201601 ) ) ( CALIBRATION_TARGET ?auto_201602 ?auto_201603 ) ( POINTING ?auto_201606 ?auto_201605 ) ( not ( = ?auto_201603 ?auto_201605 ) ) ( not ( = ?auto_201600 ?auto_201605 ) ) ( not ( = ?auto_201595 ?auto_201605 ) ) ( ON_BOARD ?auto_201604 ?auto_201606 ) ( POWER_ON ?auto_201604 ) ( not ( = ?auto_201602 ?auto_201604 ) ) ( HAVE_IMAGE ?auto_201597 ?auto_201594 ) ( HAVE_IMAGE ?auto_201598 ?auto_201599 ) ( not ( = ?auto_201595 ?auto_201597 ) ) ( not ( = ?auto_201595 ?auto_201598 ) ) ( not ( = ?auto_201596 ?auto_201594 ) ) ( not ( = ?auto_201596 ?auto_201599 ) ) ( not ( = ?auto_201597 ?auto_201598 ) ) ( not ( = ?auto_201597 ?auto_201600 ) ) ( not ( = ?auto_201597 ?auto_201603 ) ) ( not ( = ?auto_201597 ?auto_201605 ) ) ( not ( = ?auto_201594 ?auto_201599 ) ) ( not ( = ?auto_201594 ?auto_201601 ) ) ( not ( = ?auto_201598 ?auto_201600 ) ) ( not ( = ?auto_201598 ?auto_201603 ) ) ( not ( = ?auto_201598 ?auto_201605 ) ) ( not ( = ?auto_201599 ?auto_201601 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201595 ?auto_201596 ?auto_201600 ?auto_201601 )
      ( GET-4IMAGE-VERIFY ?auto_201595 ?auto_201596 ?auto_201597 ?auto_201594 ?auto_201598 ?auto_201599 ?auto_201600 ?auto_201601 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_201608 - DIRECTION
      ?auto_201609 - MODE
      ?auto_201610 - DIRECTION
      ?auto_201607 - MODE
      ?auto_201611 - DIRECTION
      ?auto_201612 - MODE
      ?auto_201613 - DIRECTION
      ?auto_201614 - MODE
    )
    :vars
    (
      ?auto_201615 - INSTRUMENT
      ?auto_201618 - SATELLITE
      ?auto_201616 - DIRECTION
      ?auto_201617 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201615 ?auto_201618 ) ( SUPPORTS ?auto_201615 ?auto_201614 ) ( not ( = ?auto_201613 ?auto_201616 ) ) ( HAVE_IMAGE ?auto_201608 ?auto_201609 ) ( not ( = ?auto_201608 ?auto_201613 ) ) ( not ( = ?auto_201608 ?auto_201616 ) ) ( not ( = ?auto_201609 ?auto_201614 ) ) ( CALIBRATION_TARGET ?auto_201615 ?auto_201616 ) ( POINTING ?auto_201618 ?auto_201611 ) ( not ( = ?auto_201616 ?auto_201611 ) ) ( not ( = ?auto_201613 ?auto_201611 ) ) ( not ( = ?auto_201608 ?auto_201611 ) ) ( ON_BOARD ?auto_201617 ?auto_201618 ) ( POWER_ON ?auto_201617 ) ( not ( = ?auto_201615 ?auto_201617 ) ) ( HAVE_IMAGE ?auto_201610 ?auto_201607 ) ( HAVE_IMAGE ?auto_201611 ?auto_201612 ) ( not ( = ?auto_201608 ?auto_201610 ) ) ( not ( = ?auto_201609 ?auto_201607 ) ) ( not ( = ?auto_201609 ?auto_201612 ) ) ( not ( = ?auto_201610 ?auto_201611 ) ) ( not ( = ?auto_201610 ?auto_201613 ) ) ( not ( = ?auto_201610 ?auto_201616 ) ) ( not ( = ?auto_201607 ?auto_201612 ) ) ( not ( = ?auto_201607 ?auto_201614 ) ) ( not ( = ?auto_201612 ?auto_201614 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201608 ?auto_201609 ?auto_201613 ?auto_201614 )
      ( GET-4IMAGE-VERIFY ?auto_201608 ?auto_201609 ?auto_201610 ?auto_201607 ?auto_201611 ?auto_201612 ?auto_201613 ?auto_201614 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_201620 - DIRECTION
      ?auto_201621 - MODE
      ?auto_201622 - DIRECTION
      ?auto_201619 - MODE
      ?auto_201623 - DIRECTION
      ?auto_201624 - MODE
      ?auto_201625 - DIRECTION
      ?auto_201626 - MODE
    )
    :vars
    (
      ?auto_201627 - INSTRUMENT
      ?auto_201631 - SATELLITE
      ?auto_201628 - DIRECTION
      ?auto_201630 - DIRECTION
      ?auto_201629 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201627 ?auto_201631 ) ( SUPPORTS ?auto_201627 ?auto_201624 ) ( not ( = ?auto_201623 ?auto_201628 ) ) ( HAVE_IMAGE ?auto_201620 ?auto_201626 ) ( not ( = ?auto_201620 ?auto_201623 ) ) ( not ( = ?auto_201620 ?auto_201628 ) ) ( not ( = ?auto_201626 ?auto_201624 ) ) ( CALIBRATION_TARGET ?auto_201627 ?auto_201628 ) ( POINTING ?auto_201631 ?auto_201630 ) ( not ( = ?auto_201628 ?auto_201630 ) ) ( not ( = ?auto_201623 ?auto_201630 ) ) ( not ( = ?auto_201620 ?auto_201630 ) ) ( ON_BOARD ?auto_201629 ?auto_201631 ) ( POWER_ON ?auto_201629 ) ( not ( = ?auto_201627 ?auto_201629 ) ) ( HAVE_IMAGE ?auto_201620 ?auto_201621 ) ( HAVE_IMAGE ?auto_201622 ?auto_201619 ) ( HAVE_IMAGE ?auto_201625 ?auto_201626 ) ( not ( = ?auto_201620 ?auto_201622 ) ) ( not ( = ?auto_201620 ?auto_201625 ) ) ( not ( = ?auto_201621 ?auto_201619 ) ) ( not ( = ?auto_201621 ?auto_201624 ) ) ( not ( = ?auto_201621 ?auto_201626 ) ) ( not ( = ?auto_201622 ?auto_201623 ) ) ( not ( = ?auto_201622 ?auto_201625 ) ) ( not ( = ?auto_201622 ?auto_201628 ) ) ( not ( = ?auto_201622 ?auto_201630 ) ) ( not ( = ?auto_201619 ?auto_201624 ) ) ( not ( = ?auto_201619 ?auto_201626 ) ) ( not ( = ?auto_201623 ?auto_201625 ) ) ( not ( = ?auto_201625 ?auto_201628 ) ) ( not ( = ?auto_201625 ?auto_201630 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201620 ?auto_201626 ?auto_201623 ?auto_201624 )
      ( GET-4IMAGE-VERIFY ?auto_201620 ?auto_201621 ?auto_201622 ?auto_201619 ?auto_201623 ?auto_201624 ?auto_201625 ?auto_201626 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_201633 - DIRECTION
      ?auto_201634 - MODE
      ?auto_201635 - DIRECTION
      ?auto_201632 - MODE
      ?auto_201636 - DIRECTION
      ?auto_201637 - MODE
      ?auto_201638 - DIRECTION
      ?auto_201639 - MODE
    )
    :vars
    (
      ?auto_201640 - INSTRUMENT
      ?auto_201643 - SATELLITE
      ?auto_201641 - DIRECTION
      ?auto_201642 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201640 ?auto_201643 ) ( SUPPORTS ?auto_201640 ?auto_201637 ) ( not ( = ?auto_201636 ?auto_201641 ) ) ( HAVE_IMAGE ?auto_201635 ?auto_201634 ) ( not ( = ?auto_201635 ?auto_201636 ) ) ( not ( = ?auto_201635 ?auto_201641 ) ) ( not ( = ?auto_201634 ?auto_201637 ) ) ( CALIBRATION_TARGET ?auto_201640 ?auto_201641 ) ( POINTING ?auto_201643 ?auto_201638 ) ( not ( = ?auto_201641 ?auto_201638 ) ) ( not ( = ?auto_201636 ?auto_201638 ) ) ( not ( = ?auto_201635 ?auto_201638 ) ) ( ON_BOARD ?auto_201642 ?auto_201643 ) ( POWER_ON ?auto_201642 ) ( not ( = ?auto_201640 ?auto_201642 ) ) ( HAVE_IMAGE ?auto_201633 ?auto_201634 ) ( HAVE_IMAGE ?auto_201635 ?auto_201632 ) ( HAVE_IMAGE ?auto_201638 ?auto_201639 ) ( not ( = ?auto_201633 ?auto_201635 ) ) ( not ( = ?auto_201633 ?auto_201636 ) ) ( not ( = ?auto_201633 ?auto_201638 ) ) ( not ( = ?auto_201633 ?auto_201641 ) ) ( not ( = ?auto_201634 ?auto_201632 ) ) ( not ( = ?auto_201634 ?auto_201639 ) ) ( not ( = ?auto_201632 ?auto_201637 ) ) ( not ( = ?auto_201632 ?auto_201639 ) ) ( not ( = ?auto_201637 ?auto_201639 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201635 ?auto_201634 ?auto_201636 ?auto_201637 )
      ( GET-4IMAGE-VERIFY ?auto_201633 ?auto_201634 ?auto_201635 ?auto_201632 ?auto_201636 ?auto_201637 ?auto_201638 ?auto_201639 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_201658 - DIRECTION
      ?auto_201659 - MODE
      ?auto_201660 - DIRECTION
      ?auto_201657 - MODE
      ?auto_201661 - DIRECTION
      ?auto_201662 - MODE
      ?auto_201663 - DIRECTION
      ?auto_201664 - MODE
    )
    :vars
    (
      ?auto_201665 - INSTRUMENT
      ?auto_201668 - SATELLITE
      ?auto_201666 - DIRECTION
      ?auto_201667 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201665 ?auto_201668 ) ( SUPPORTS ?auto_201665 ?auto_201664 ) ( not ( = ?auto_201663 ?auto_201666 ) ) ( HAVE_IMAGE ?auto_201661 ?auto_201662 ) ( not ( = ?auto_201661 ?auto_201663 ) ) ( not ( = ?auto_201661 ?auto_201666 ) ) ( not ( = ?auto_201662 ?auto_201664 ) ) ( CALIBRATION_TARGET ?auto_201665 ?auto_201666 ) ( POINTING ?auto_201668 ?auto_201660 ) ( not ( = ?auto_201666 ?auto_201660 ) ) ( not ( = ?auto_201663 ?auto_201660 ) ) ( not ( = ?auto_201661 ?auto_201660 ) ) ( ON_BOARD ?auto_201667 ?auto_201668 ) ( POWER_ON ?auto_201667 ) ( not ( = ?auto_201665 ?auto_201667 ) ) ( HAVE_IMAGE ?auto_201658 ?auto_201659 ) ( HAVE_IMAGE ?auto_201660 ?auto_201657 ) ( not ( = ?auto_201658 ?auto_201660 ) ) ( not ( = ?auto_201658 ?auto_201661 ) ) ( not ( = ?auto_201658 ?auto_201663 ) ) ( not ( = ?auto_201658 ?auto_201666 ) ) ( not ( = ?auto_201659 ?auto_201657 ) ) ( not ( = ?auto_201659 ?auto_201662 ) ) ( not ( = ?auto_201659 ?auto_201664 ) ) ( not ( = ?auto_201657 ?auto_201662 ) ) ( not ( = ?auto_201657 ?auto_201664 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201661 ?auto_201662 ?auto_201663 ?auto_201664 )
      ( GET-4IMAGE-VERIFY ?auto_201658 ?auto_201659 ?auto_201660 ?auto_201657 ?auto_201661 ?auto_201662 ?auto_201663 ?auto_201664 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_201682 - DIRECTION
      ?auto_201683 - MODE
      ?auto_201684 - DIRECTION
      ?auto_201681 - MODE
      ?auto_201685 - DIRECTION
      ?auto_201686 - MODE
      ?auto_201687 - DIRECTION
      ?auto_201688 - MODE
    )
    :vars
    (
      ?auto_201689 - INSTRUMENT
      ?auto_201692 - SATELLITE
      ?auto_201690 - DIRECTION
      ?auto_201691 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201689 ?auto_201692 ) ( SUPPORTS ?auto_201689 ?auto_201686 ) ( not ( = ?auto_201685 ?auto_201690 ) ) ( HAVE_IMAGE ?auto_201687 ?auto_201688 ) ( not ( = ?auto_201687 ?auto_201685 ) ) ( not ( = ?auto_201687 ?auto_201690 ) ) ( not ( = ?auto_201688 ?auto_201686 ) ) ( CALIBRATION_TARGET ?auto_201689 ?auto_201690 ) ( POINTING ?auto_201692 ?auto_201684 ) ( not ( = ?auto_201690 ?auto_201684 ) ) ( not ( = ?auto_201685 ?auto_201684 ) ) ( not ( = ?auto_201687 ?auto_201684 ) ) ( ON_BOARD ?auto_201691 ?auto_201692 ) ( POWER_ON ?auto_201691 ) ( not ( = ?auto_201689 ?auto_201691 ) ) ( HAVE_IMAGE ?auto_201682 ?auto_201683 ) ( HAVE_IMAGE ?auto_201684 ?auto_201681 ) ( not ( = ?auto_201682 ?auto_201684 ) ) ( not ( = ?auto_201682 ?auto_201685 ) ) ( not ( = ?auto_201682 ?auto_201687 ) ) ( not ( = ?auto_201682 ?auto_201690 ) ) ( not ( = ?auto_201683 ?auto_201681 ) ) ( not ( = ?auto_201683 ?auto_201686 ) ) ( not ( = ?auto_201683 ?auto_201688 ) ) ( not ( = ?auto_201681 ?auto_201686 ) ) ( not ( = ?auto_201681 ?auto_201688 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201687 ?auto_201688 ?auto_201685 ?auto_201686 )
      ( GET-4IMAGE-VERIFY ?auto_201682 ?auto_201683 ?auto_201684 ?auto_201681 ?auto_201685 ?auto_201686 ?auto_201687 ?auto_201688 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_201694 - DIRECTION
      ?auto_201695 - MODE
      ?auto_201696 - DIRECTION
      ?auto_201693 - MODE
      ?auto_201697 - DIRECTION
      ?auto_201698 - MODE
      ?auto_201699 - DIRECTION
      ?auto_201700 - MODE
    )
    :vars
    (
      ?auto_201701 - INSTRUMENT
      ?auto_201704 - SATELLITE
      ?auto_201702 - DIRECTION
      ?auto_201703 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201701 ?auto_201704 ) ( SUPPORTS ?auto_201701 ?auto_201698 ) ( not ( = ?auto_201697 ?auto_201702 ) ) ( HAVE_IMAGE ?auto_201694 ?auto_201695 ) ( not ( = ?auto_201694 ?auto_201697 ) ) ( not ( = ?auto_201694 ?auto_201702 ) ) ( not ( = ?auto_201695 ?auto_201698 ) ) ( CALIBRATION_TARGET ?auto_201701 ?auto_201702 ) ( POINTING ?auto_201704 ?auto_201696 ) ( not ( = ?auto_201702 ?auto_201696 ) ) ( not ( = ?auto_201697 ?auto_201696 ) ) ( not ( = ?auto_201694 ?auto_201696 ) ) ( ON_BOARD ?auto_201703 ?auto_201704 ) ( POWER_ON ?auto_201703 ) ( not ( = ?auto_201701 ?auto_201703 ) ) ( HAVE_IMAGE ?auto_201696 ?auto_201693 ) ( HAVE_IMAGE ?auto_201699 ?auto_201700 ) ( not ( = ?auto_201694 ?auto_201699 ) ) ( not ( = ?auto_201695 ?auto_201693 ) ) ( not ( = ?auto_201695 ?auto_201700 ) ) ( not ( = ?auto_201696 ?auto_201699 ) ) ( not ( = ?auto_201693 ?auto_201698 ) ) ( not ( = ?auto_201693 ?auto_201700 ) ) ( not ( = ?auto_201697 ?auto_201699 ) ) ( not ( = ?auto_201698 ?auto_201700 ) ) ( not ( = ?auto_201699 ?auto_201702 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201694 ?auto_201695 ?auto_201697 ?auto_201698 )
      ( GET-4IMAGE-VERIFY ?auto_201694 ?auto_201695 ?auto_201696 ?auto_201693 ?auto_201697 ?auto_201698 ?auto_201699 ?auto_201700 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_201718 - DIRECTION
      ?auto_201719 - MODE
      ?auto_201720 - DIRECTION
      ?auto_201717 - MODE
      ?auto_201721 - DIRECTION
      ?auto_201722 - MODE
      ?auto_201723 - DIRECTION
      ?auto_201724 - MODE
    )
    :vars
    (
      ?auto_201725 - INSTRUMENT
      ?auto_201729 - SATELLITE
      ?auto_201726 - DIRECTION
      ?auto_201728 - DIRECTION
      ?auto_201727 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201725 ?auto_201729 ) ( SUPPORTS ?auto_201725 ?auto_201717 ) ( not ( = ?auto_201720 ?auto_201726 ) ) ( HAVE_IMAGE ?auto_201718 ?auto_201724 ) ( not ( = ?auto_201718 ?auto_201720 ) ) ( not ( = ?auto_201718 ?auto_201726 ) ) ( not ( = ?auto_201724 ?auto_201717 ) ) ( CALIBRATION_TARGET ?auto_201725 ?auto_201726 ) ( POINTING ?auto_201729 ?auto_201728 ) ( not ( = ?auto_201726 ?auto_201728 ) ) ( not ( = ?auto_201720 ?auto_201728 ) ) ( not ( = ?auto_201718 ?auto_201728 ) ) ( ON_BOARD ?auto_201727 ?auto_201729 ) ( POWER_ON ?auto_201727 ) ( not ( = ?auto_201725 ?auto_201727 ) ) ( HAVE_IMAGE ?auto_201718 ?auto_201719 ) ( HAVE_IMAGE ?auto_201721 ?auto_201722 ) ( HAVE_IMAGE ?auto_201723 ?auto_201724 ) ( not ( = ?auto_201718 ?auto_201721 ) ) ( not ( = ?auto_201718 ?auto_201723 ) ) ( not ( = ?auto_201719 ?auto_201717 ) ) ( not ( = ?auto_201719 ?auto_201722 ) ) ( not ( = ?auto_201719 ?auto_201724 ) ) ( not ( = ?auto_201720 ?auto_201721 ) ) ( not ( = ?auto_201720 ?auto_201723 ) ) ( not ( = ?auto_201717 ?auto_201722 ) ) ( not ( = ?auto_201721 ?auto_201723 ) ) ( not ( = ?auto_201721 ?auto_201726 ) ) ( not ( = ?auto_201721 ?auto_201728 ) ) ( not ( = ?auto_201722 ?auto_201724 ) ) ( not ( = ?auto_201723 ?auto_201726 ) ) ( not ( = ?auto_201723 ?auto_201728 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201718 ?auto_201724 ?auto_201720 ?auto_201717 )
      ( GET-4IMAGE-VERIFY ?auto_201718 ?auto_201719 ?auto_201720 ?auto_201717 ?auto_201721 ?auto_201722 ?auto_201723 ?auto_201724 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_201731 - DIRECTION
      ?auto_201732 - MODE
      ?auto_201733 - DIRECTION
      ?auto_201730 - MODE
      ?auto_201734 - DIRECTION
      ?auto_201735 - MODE
      ?auto_201736 - DIRECTION
      ?auto_201737 - MODE
    )
    :vars
    (
      ?auto_201738 - INSTRUMENT
      ?auto_201741 - SATELLITE
      ?auto_201739 - DIRECTION
      ?auto_201740 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201738 ?auto_201741 ) ( SUPPORTS ?auto_201738 ?auto_201730 ) ( not ( = ?auto_201733 ?auto_201739 ) ) ( HAVE_IMAGE ?auto_201734 ?auto_201735 ) ( not ( = ?auto_201734 ?auto_201733 ) ) ( not ( = ?auto_201734 ?auto_201739 ) ) ( not ( = ?auto_201735 ?auto_201730 ) ) ( CALIBRATION_TARGET ?auto_201738 ?auto_201739 ) ( POINTING ?auto_201741 ?auto_201736 ) ( not ( = ?auto_201739 ?auto_201736 ) ) ( not ( = ?auto_201733 ?auto_201736 ) ) ( not ( = ?auto_201734 ?auto_201736 ) ) ( ON_BOARD ?auto_201740 ?auto_201741 ) ( POWER_ON ?auto_201740 ) ( not ( = ?auto_201738 ?auto_201740 ) ) ( HAVE_IMAGE ?auto_201731 ?auto_201732 ) ( HAVE_IMAGE ?auto_201736 ?auto_201737 ) ( not ( = ?auto_201731 ?auto_201733 ) ) ( not ( = ?auto_201731 ?auto_201734 ) ) ( not ( = ?auto_201731 ?auto_201736 ) ) ( not ( = ?auto_201731 ?auto_201739 ) ) ( not ( = ?auto_201732 ?auto_201730 ) ) ( not ( = ?auto_201732 ?auto_201735 ) ) ( not ( = ?auto_201732 ?auto_201737 ) ) ( not ( = ?auto_201730 ?auto_201737 ) ) ( not ( = ?auto_201735 ?auto_201737 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201734 ?auto_201735 ?auto_201733 ?auto_201730 )
      ( GET-4IMAGE-VERIFY ?auto_201731 ?auto_201732 ?auto_201733 ?auto_201730 ?auto_201734 ?auto_201735 ?auto_201736 ?auto_201737 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_201756 - DIRECTION
      ?auto_201757 - MODE
      ?auto_201758 - DIRECTION
      ?auto_201755 - MODE
      ?auto_201759 - DIRECTION
      ?auto_201760 - MODE
      ?auto_201761 - DIRECTION
      ?auto_201762 - MODE
    )
    :vars
    (
      ?auto_201763 - INSTRUMENT
      ?auto_201766 - SATELLITE
      ?auto_201764 - DIRECTION
      ?auto_201765 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201763 ?auto_201766 ) ( SUPPORTS ?auto_201763 ?auto_201755 ) ( not ( = ?auto_201758 ?auto_201764 ) ) ( HAVE_IMAGE ?auto_201756 ?auto_201762 ) ( not ( = ?auto_201756 ?auto_201758 ) ) ( not ( = ?auto_201756 ?auto_201764 ) ) ( not ( = ?auto_201762 ?auto_201755 ) ) ( CALIBRATION_TARGET ?auto_201763 ?auto_201764 ) ( POINTING ?auto_201766 ?auto_201759 ) ( not ( = ?auto_201764 ?auto_201759 ) ) ( not ( = ?auto_201758 ?auto_201759 ) ) ( not ( = ?auto_201756 ?auto_201759 ) ) ( ON_BOARD ?auto_201765 ?auto_201766 ) ( POWER_ON ?auto_201765 ) ( not ( = ?auto_201763 ?auto_201765 ) ) ( HAVE_IMAGE ?auto_201756 ?auto_201757 ) ( HAVE_IMAGE ?auto_201759 ?auto_201760 ) ( HAVE_IMAGE ?auto_201761 ?auto_201762 ) ( not ( = ?auto_201756 ?auto_201761 ) ) ( not ( = ?auto_201757 ?auto_201755 ) ) ( not ( = ?auto_201757 ?auto_201760 ) ) ( not ( = ?auto_201757 ?auto_201762 ) ) ( not ( = ?auto_201758 ?auto_201761 ) ) ( not ( = ?auto_201755 ?auto_201760 ) ) ( not ( = ?auto_201759 ?auto_201761 ) ) ( not ( = ?auto_201760 ?auto_201762 ) ) ( not ( = ?auto_201761 ?auto_201764 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201756 ?auto_201762 ?auto_201758 ?auto_201755 )
      ( GET-4IMAGE-VERIFY ?auto_201756 ?auto_201757 ?auto_201758 ?auto_201755 ?auto_201759 ?auto_201760 ?auto_201761 ?auto_201762 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_201768 - DIRECTION
      ?auto_201769 - MODE
      ?auto_201770 - DIRECTION
      ?auto_201767 - MODE
      ?auto_201771 - DIRECTION
      ?auto_201772 - MODE
      ?auto_201773 - DIRECTION
      ?auto_201774 - MODE
    )
    :vars
    (
      ?auto_201775 - INSTRUMENT
      ?auto_201778 - SATELLITE
      ?auto_201776 - DIRECTION
      ?auto_201777 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201775 ?auto_201778 ) ( SUPPORTS ?auto_201775 ?auto_201767 ) ( not ( = ?auto_201770 ?auto_201776 ) ) ( HAVE_IMAGE ?auto_201768 ?auto_201769 ) ( not ( = ?auto_201768 ?auto_201770 ) ) ( not ( = ?auto_201768 ?auto_201776 ) ) ( not ( = ?auto_201769 ?auto_201767 ) ) ( CALIBRATION_TARGET ?auto_201775 ?auto_201776 ) ( POINTING ?auto_201778 ?auto_201771 ) ( not ( = ?auto_201776 ?auto_201771 ) ) ( not ( = ?auto_201770 ?auto_201771 ) ) ( not ( = ?auto_201768 ?auto_201771 ) ) ( ON_BOARD ?auto_201777 ?auto_201778 ) ( POWER_ON ?auto_201777 ) ( not ( = ?auto_201775 ?auto_201777 ) ) ( HAVE_IMAGE ?auto_201771 ?auto_201772 ) ( HAVE_IMAGE ?auto_201773 ?auto_201774 ) ( not ( = ?auto_201768 ?auto_201773 ) ) ( not ( = ?auto_201769 ?auto_201772 ) ) ( not ( = ?auto_201769 ?auto_201774 ) ) ( not ( = ?auto_201770 ?auto_201773 ) ) ( not ( = ?auto_201767 ?auto_201772 ) ) ( not ( = ?auto_201767 ?auto_201774 ) ) ( not ( = ?auto_201771 ?auto_201773 ) ) ( not ( = ?auto_201772 ?auto_201774 ) ) ( not ( = ?auto_201773 ?auto_201776 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201768 ?auto_201769 ?auto_201770 ?auto_201767 )
      ( GET-4IMAGE-VERIFY ?auto_201768 ?auto_201769 ?auto_201770 ?auto_201767 ?auto_201771 ?auto_201772 ?auto_201773 ?auto_201774 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_201830 - DIRECTION
      ?auto_201831 - MODE
      ?auto_201832 - DIRECTION
      ?auto_201829 - MODE
      ?auto_201833 - DIRECTION
      ?auto_201834 - MODE
      ?auto_201835 - DIRECTION
      ?auto_201836 - MODE
    )
    :vars
    (
      ?auto_201837 - INSTRUMENT
      ?auto_201840 - SATELLITE
      ?auto_201838 - DIRECTION
      ?auto_201839 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201837 ?auto_201840 ) ( SUPPORTS ?auto_201837 ?auto_201836 ) ( not ( = ?auto_201835 ?auto_201838 ) ) ( HAVE_IMAGE ?auto_201832 ?auto_201829 ) ( not ( = ?auto_201832 ?auto_201835 ) ) ( not ( = ?auto_201832 ?auto_201838 ) ) ( not ( = ?auto_201829 ?auto_201836 ) ) ( CALIBRATION_TARGET ?auto_201837 ?auto_201838 ) ( POINTING ?auto_201840 ?auto_201830 ) ( not ( = ?auto_201838 ?auto_201830 ) ) ( not ( = ?auto_201835 ?auto_201830 ) ) ( not ( = ?auto_201832 ?auto_201830 ) ) ( ON_BOARD ?auto_201839 ?auto_201840 ) ( POWER_ON ?auto_201839 ) ( not ( = ?auto_201837 ?auto_201839 ) ) ( HAVE_IMAGE ?auto_201830 ?auto_201831 ) ( HAVE_IMAGE ?auto_201833 ?auto_201834 ) ( not ( = ?auto_201830 ?auto_201833 ) ) ( not ( = ?auto_201831 ?auto_201829 ) ) ( not ( = ?auto_201831 ?auto_201834 ) ) ( not ( = ?auto_201831 ?auto_201836 ) ) ( not ( = ?auto_201832 ?auto_201833 ) ) ( not ( = ?auto_201829 ?auto_201834 ) ) ( not ( = ?auto_201833 ?auto_201835 ) ) ( not ( = ?auto_201833 ?auto_201838 ) ) ( not ( = ?auto_201834 ?auto_201836 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201832 ?auto_201829 ?auto_201835 ?auto_201836 )
      ( GET-4IMAGE-VERIFY ?auto_201830 ?auto_201831 ?auto_201832 ?auto_201829 ?auto_201833 ?auto_201834 ?auto_201835 ?auto_201836 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_201842 - DIRECTION
      ?auto_201843 - MODE
      ?auto_201844 - DIRECTION
      ?auto_201841 - MODE
      ?auto_201845 - DIRECTION
      ?auto_201846 - MODE
      ?auto_201847 - DIRECTION
      ?auto_201848 - MODE
    )
    :vars
    (
      ?auto_201849 - INSTRUMENT
      ?auto_201852 - SATELLITE
      ?auto_201850 - DIRECTION
      ?auto_201851 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201849 ?auto_201852 ) ( SUPPORTS ?auto_201849 ?auto_201848 ) ( not ( = ?auto_201847 ?auto_201850 ) ) ( HAVE_IMAGE ?auto_201844 ?auto_201841 ) ( not ( = ?auto_201844 ?auto_201847 ) ) ( not ( = ?auto_201844 ?auto_201850 ) ) ( not ( = ?auto_201841 ?auto_201848 ) ) ( CALIBRATION_TARGET ?auto_201849 ?auto_201850 ) ( POINTING ?auto_201852 ?auto_201845 ) ( not ( = ?auto_201850 ?auto_201845 ) ) ( not ( = ?auto_201847 ?auto_201845 ) ) ( not ( = ?auto_201844 ?auto_201845 ) ) ( ON_BOARD ?auto_201851 ?auto_201852 ) ( POWER_ON ?auto_201851 ) ( not ( = ?auto_201849 ?auto_201851 ) ) ( HAVE_IMAGE ?auto_201842 ?auto_201843 ) ( HAVE_IMAGE ?auto_201845 ?auto_201846 ) ( not ( = ?auto_201842 ?auto_201844 ) ) ( not ( = ?auto_201842 ?auto_201845 ) ) ( not ( = ?auto_201842 ?auto_201847 ) ) ( not ( = ?auto_201842 ?auto_201850 ) ) ( not ( = ?auto_201843 ?auto_201841 ) ) ( not ( = ?auto_201843 ?auto_201846 ) ) ( not ( = ?auto_201843 ?auto_201848 ) ) ( not ( = ?auto_201841 ?auto_201846 ) ) ( not ( = ?auto_201846 ?auto_201848 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201844 ?auto_201841 ?auto_201847 ?auto_201848 )
      ( GET-4IMAGE-VERIFY ?auto_201842 ?auto_201843 ?auto_201844 ?auto_201841 ?auto_201845 ?auto_201846 ?auto_201847 ?auto_201848 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_201854 - DIRECTION
      ?auto_201855 - MODE
      ?auto_201856 - DIRECTION
      ?auto_201853 - MODE
      ?auto_201857 - DIRECTION
      ?auto_201858 - MODE
      ?auto_201859 - DIRECTION
      ?auto_201860 - MODE
    )
    :vars
    (
      ?auto_201861 - INSTRUMENT
      ?auto_201864 - SATELLITE
      ?auto_201862 - DIRECTION
      ?auto_201863 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201861 ?auto_201864 ) ( SUPPORTS ?auto_201861 ?auto_201858 ) ( not ( = ?auto_201857 ?auto_201862 ) ) ( HAVE_IMAGE ?auto_201856 ?auto_201860 ) ( not ( = ?auto_201856 ?auto_201857 ) ) ( not ( = ?auto_201856 ?auto_201862 ) ) ( not ( = ?auto_201860 ?auto_201858 ) ) ( CALIBRATION_TARGET ?auto_201861 ?auto_201862 ) ( POINTING ?auto_201864 ?auto_201854 ) ( not ( = ?auto_201862 ?auto_201854 ) ) ( not ( = ?auto_201857 ?auto_201854 ) ) ( not ( = ?auto_201856 ?auto_201854 ) ) ( ON_BOARD ?auto_201863 ?auto_201864 ) ( POWER_ON ?auto_201863 ) ( not ( = ?auto_201861 ?auto_201863 ) ) ( HAVE_IMAGE ?auto_201854 ?auto_201855 ) ( HAVE_IMAGE ?auto_201856 ?auto_201853 ) ( HAVE_IMAGE ?auto_201859 ?auto_201860 ) ( not ( = ?auto_201854 ?auto_201859 ) ) ( not ( = ?auto_201855 ?auto_201853 ) ) ( not ( = ?auto_201855 ?auto_201858 ) ) ( not ( = ?auto_201855 ?auto_201860 ) ) ( not ( = ?auto_201856 ?auto_201859 ) ) ( not ( = ?auto_201853 ?auto_201858 ) ) ( not ( = ?auto_201853 ?auto_201860 ) ) ( not ( = ?auto_201857 ?auto_201859 ) ) ( not ( = ?auto_201859 ?auto_201862 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201856 ?auto_201860 ?auto_201857 ?auto_201858 )
      ( GET-4IMAGE-VERIFY ?auto_201854 ?auto_201855 ?auto_201856 ?auto_201853 ?auto_201857 ?auto_201858 ?auto_201859 ?auto_201860 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_201866 - DIRECTION
      ?auto_201867 - MODE
      ?auto_201868 - DIRECTION
      ?auto_201865 - MODE
      ?auto_201869 - DIRECTION
      ?auto_201870 - MODE
      ?auto_201871 - DIRECTION
      ?auto_201872 - MODE
    )
    :vars
    (
      ?auto_201873 - INSTRUMENT
      ?auto_201876 - SATELLITE
      ?auto_201874 - DIRECTION
      ?auto_201875 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201873 ?auto_201876 ) ( SUPPORTS ?auto_201873 ?auto_201870 ) ( not ( = ?auto_201869 ?auto_201874 ) ) ( HAVE_IMAGE ?auto_201868 ?auto_201865 ) ( not ( = ?auto_201868 ?auto_201869 ) ) ( not ( = ?auto_201868 ?auto_201874 ) ) ( not ( = ?auto_201865 ?auto_201870 ) ) ( CALIBRATION_TARGET ?auto_201873 ?auto_201874 ) ( POINTING ?auto_201876 ?auto_201866 ) ( not ( = ?auto_201874 ?auto_201866 ) ) ( not ( = ?auto_201869 ?auto_201866 ) ) ( not ( = ?auto_201868 ?auto_201866 ) ) ( ON_BOARD ?auto_201875 ?auto_201876 ) ( POWER_ON ?auto_201875 ) ( not ( = ?auto_201873 ?auto_201875 ) ) ( HAVE_IMAGE ?auto_201866 ?auto_201867 ) ( HAVE_IMAGE ?auto_201871 ?auto_201872 ) ( not ( = ?auto_201866 ?auto_201871 ) ) ( not ( = ?auto_201867 ?auto_201865 ) ) ( not ( = ?auto_201867 ?auto_201870 ) ) ( not ( = ?auto_201867 ?auto_201872 ) ) ( not ( = ?auto_201868 ?auto_201871 ) ) ( not ( = ?auto_201865 ?auto_201872 ) ) ( not ( = ?auto_201869 ?auto_201871 ) ) ( not ( = ?auto_201870 ?auto_201872 ) ) ( not ( = ?auto_201871 ?auto_201874 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201868 ?auto_201865 ?auto_201869 ?auto_201870 )
      ( GET-4IMAGE-VERIFY ?auto_201866 ?auto_201867 ?auto_201868 ?auto_201865 ?auto_201869 ?auto_201870 ?auto_201871 ?auto_201872 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_201890 - DIRECTION
      ?auto_201891 - MODE
      ?auto_201892 - DIRECTION
      ?auto_201889 - MODE
      ?auto_201893 - DIRECTION
      ?auto_201894 - MODE
      ?auto_201895 - DIRECTION
      ?auto_201896 - MODE
    )
    :vars
    (
      ?auto_201897 - INSTRUMENT
      ?auto_201900 - SATELLITE
      ?auto_201898 - DIRECTION
      ?auto_201899 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201897 ?auto_201900 ) ( SUPPORTS ?auto_201897 ?auto_201896 ) ( not ( = ?auto_201895 ?auto_201898 ) ) ( HAVE_IMAGE ?auto_201893 ?auto_201894 ) ( not ( = ?auto_201893 ?auto_201895 ) ) ( not ( = ?auto_201893 ?auto_201898 ) ) ( not ( = ?auto_201894 ?auto_201896 ) ) ( CALIBRATION_TARGET ?auto_201897 ?auto_201898 ) ( POINTING ?auto_201900 ?auto_201890 ) ( not ( = ?auto_201898 ?auto_201890 ) ) ( not ( = ?auto_201895 ?auto_201890 ) ) ( not ( = ?auto_201893 ?auto_201890 ) ) ( ON_BOARD ?auto_201899 ?auto_201900 ) ( POWER_ON ?auto_201899 ) ( not ( = ?auto_201897 ?auto_201899 ) ) ( HAVE_IMAGE ?auto_201890 ?auto_201891 ) ( HAVE_IMAGE ?auto_201892 ?auto_201889 ) ( not ( = ?auto_201890 ?auto_201892 ) ) ( not ( = ?auto_201891 ?auto_201889 ) ) ( not ( = ?auto_201891 ?auto_201894 ) ) ( not ( = ?auto_201891 ?auto_201896 ) ) ( not ( = ?auto_201892 ?auto_201893 ) ) ( not ( = ?auto_201892 ?auto_201895 ) ) ( not ( = ?auto_201892 ?auto_201898 ) ) ( not ( = ?auto_201889 ?auto_201894 ) ) ( not ( = ?auto_201889 ?auto_201896 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201893 ?auto_201894 ?auto_201895 ?auto_201896 )
      ( GET-4IMAGE-VERIFY ?auto_201890 ?auto_201891 ?auto_201892 ?auto_201889 ?auto_201893 ?auto_201894 ?auto_201895 ?auto_201896 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_201902 - DIRECTION
      ?auto_201903 - MODE
      ?auto_201904 - DIRECTION
      ?auto_201901 - MODE
      ?auto_201905 - DIRECTION
      ?auto_201906 - MODE
      ?auto_201907 - DIRECTION
      ?auto_201908 - MODE
    )
    :vars
    (
      ?auto_201909 - INSTRUMENT
      ?auto_201912 - SATELLITE
      ?auto_201910 - DIRECTION
      ?auto_201914 - DIRECTION
      ?auto_201913 - MODE
      ?auto_201911 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201909 ?auto_201912 ) ( SUPPORTS ?auto_201909 ?auto_201908 ) ( not ( = ?auto_201907 ?auto_201910 ) ) ( HAVE_IMAGE ?auto_201914 ?auto_201913 ) ( not ( = ?auto_201914 ?auto_201907 ) ) ( not ( = ?auto_201914 ?auto_201910 ) ) ( not ( = ?auto_201913 ?auto_201908 ) ) ( CALIBRATION_TARGET ?auto_201909 ?auto_201910 ) ( POINTING ?auto_201912 ?auto_201905 ) ( not ( = ?auto_201910 ?auto_201905 ) ) ( not ( = ?auto_201907 ?auto_201905 ) ) ( not ( = ?auto_201914 ?auto_201905 ) ) ( ON_BOARD ?auto_201911 ?auto_201912 ) ( POWER_ON ?auto_201911 ) ( not ( = ?auto_201909 ?auto_201911 ) ) ( HAVE_IMAGE ?auto_201902 ?auto_201903 ) ( HAVE_IMAGE ?auto_201904 ?auto_201901 ) ( HAVE_IMAGE ?auto_201905 ?auto_201906 ) ( not ( = ?auto_201902 ?auto_201904 ) ) ( not ( = ?auto_201902 ?auto_201905 ) ) ( not ( = ?auto_201902 ?auto_201907 ) ) ( not ( = ?auto_201902 ?auto_201910 ) ) ( not ( = ?auto_201902 ?auto_201914 ) ) ( not ( = ?auto_201903 ?auto_201901 ) ) ( not ( = ?auto_201903 ?auto_201906 ) ) ( not ( = ?auto_201903 ?auto_201908 ) ) ( not ( = ?auto_201903 ?auto_201913 ) ) ( not ( = ?auto_201904 ?auto_201905 ) ) ( not ( = ?auto_201904 ?auto_201907 ) ) ( not ( = ?auto_201904 ?auto_201910 ) ) ( not ( = ?auto_201904 ?auto_201914 ) ) ( not ( = ?auto_201901 ?auto_201906 ) ) ( not ( = ?auto_201901 ?auto_201908 ) ) ( not ( = ?auto_201901 ?auto_201913 ) ) ( not ( = ?auto_201906 ?auto_201908 ) ) ( not ( = ?auto_201906 ?auto_201913 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201914 ?auto_201913 ?auto_201907 ?auto_201908 )
      ( GET-4IMAGE-VERIFY ?auto_201902 ?auto_201903 ?auto_201904 ?auto_201901 ?auto_201905 ?auto_201906 ?auto_201907 ?auto_201908 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_201916 - DIRECTION
      ?auto_201917 - MODE
      ?auto_201918 - DIRECTION
      ?auto_201915 - MODE
      ?auto_201919 - DIRECTION
      ?auto_201920 - MODE
      ?auto_201921 - DIRECTION
      ?auto_201922 - MODE
    )
    :vars
    (
      ?auto_201923 - INSTRUMENT
      ?auto_201926 - SATELLITE
      ?auto_201924 - DIRECTION
      ?auto_201925 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201923 ?auto_201926 ) ( SUPPORTS ?auto_201923 ?auto_201920 ) ( not ( = ?auto_201919 ?auto_201924 ) ) ( HAVE_IMAGE ?auto_201921 ?auto_201922 ) ( not ( = ?auto_201921 ?auto_201919 ) ) ( not ( = ?auto_201921 ?auto_201924 ) ) ( not ( = ?auto_201922 ?auto_201920 ) ) ( CALIBRATION_TARGET ?auto_201923 ?auto_201924 ) ( POINTING ?auto_201926 ?auto_201916 ) ( not ( = ?auto_201924 ?auto_201916 ) ) ( not ( = ?auto_201919 ?auto_201916 ) ) ( not ( = ?auto_201921 ?auto_201916 ) ) ( ON_BOARD ?auto_201925 ?auto_201926 ) ( POWER_ON ?auto_201925 ) ( not ( = ?auto_201923 ?auto_201925 ) ) ( HAVE_IMAGE ?auto_201916 ?auto_201917 ) ( HAVE_IMAGE ?auto_201918 ?auto_201915 ) ( not ( = ?auto_201916 ?auto_201918 ) ) ( not ( = ?auto_201917 ?auto_201915 ) ) ( not ( = ?auto_201917 ?auto_201920 ) ) ( not ( = ?auto_201917 ?auto_201922 ) ) ( not ( = ?auto_201918 ?auto_201919 ) ) ( not ( = ?auto_201918 ?auto_201921 ) ) ( not ( = ?auto_201918 ?auto_201924 ) ) ( not ( = ?auto_201915 ?auto_201920 ) ) ( not ( = ?auto_201915 ?auto_201922 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201921 ?auto_201922 ?auto_201919 ?auto_201920 )
      ( GET-4IMAGE-VERIFY ?auto_201916 ?auto_201917 ?auto_201918 ?auto_201915 ?auto_201919 ?auto_201920 ?auto_201921 ?auto_201922 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_201928 - DIRECTION
      ?auto_201929 - MODE
      ?auto_201930 - DIRECTION
      ?auto_201927 - MODE
      ?auto_201931 - DIRECTION
      ?auto_201932 - MODE
      ?auto_201933 - DIRECTION
      ?auto_201934 - MODE
    )
    :vars
    (
      ?auto_201935 - INSTRUMENT
      ?auto_201938 - SATELLITE
      ?auto_201936 - DIRECTION
      ?auto_201940 - DIRECTION
      ?auto_201939 - MODE
      ?auto_201937 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201935 ?auto_201938 ) ( SUPPORTS ?auto_201935 ?auto_201932 ) ( not ( = ?auto_201931 ?auto_201936 ) ) ( HAVE_IMAGE ?auto_201940 ?auto_201939 ) ( not ( = ?auto_201940 ?auto_201931 ) ) ( not ( = ?auto_201940 ?auto_201936 ) ) ( not ( = ?auto_201939 ?auto_201932 ) ) ( CALIBRATION_TARGET ?auto_201935 ?auto_201936 ) ( POINTING ?auto_201938 ?auto_201930 ) ( not ( = ?auto_201936 ?auto_201930 ) ) ( not ( = ?auto_201931 ?auto_201930 ) ) ( not ( = ?auto_201940 ?auto_201930 ) ) ( ON_BOARD ?auto_201937 ?auto_201938 ) ( POWER_ON ?auto_201937 ) ( not ( = ?auto_201935 ?auto_201937 ) ) ( HAVE_IMAGE ?auto_201928 ?auto_201929 ) ( HAVE_IMAGE ?auto_201930 ?auto_201927 ) ( HAVE_IMAGE ?auto_201933 ?auto_201934 ) ( not ( = ?auto_201928 ?auto_201930 ) ) ( not ( = ?auto_201928 ?auto_201931 ) ) ( not ( = ?auto_201928 ?auto_201933 ) ) ( not ( = ?auto_201928 ?auto_201936 ) ) ( not ( = ?auto_201928 ?auto_201940 ) ) ( not ( = ?auto_201929 ?auto_201927 ) ) ( not ( = ?auto_201929 ?auto_201932 ) ) ( not ( = ?auto_201929 ?auto_201934 ) ) ( not ( = ?auto_201929 ?auto_201939 ) ) ( not ( = ?auto_201930 ?auto_201933 ) ) ( not ( = ?auto_201927 ?auto_201932 ) ) ( not ( = ?auto_201927 ?auto_201934 ) ) ( not ( = ?auto_201927 ?auto_201939 ) ) ( not ( = ?auto_201931 ?auto_201933 ) ) ( not ( = ?auto_201932 ?auto_201934 ) ) ( not ( = ?auto_201933 ?auto_201936 ) ) ( not ( = ?auto_201933 ?auto_201940 ) ) ( not ( = ?auto_201934 ?auto_201939 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201940 ?auto_201939 ?auto_201931 ?auto_201932 )
      ( GET-4IMAGE-VERIFY ?auto_201928 ?auto_201929 ?auto_201930 ?auto_201927 ?auto_201931 ?auto_201932 ?auto_201933 ?auto_201934 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_201956 - DIRECTION
      ?auto_201957 - MODE
      ?auto_201958 - DIRECTION
      ?auto_201955 - MODE
      ?auto_201959 - DIRECTION
      ?auto_201960 - MODE
      ?auto_201961 - DIRECTION
      ?auto_201962 - MODE
    )
    :vars
    (
      ?auto_201963 - INSTRUMENT
      ?auto_201966 - SATELLITE
      ?auto_201964 - DIRECTION
      ?auto_201965 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201963 ?auto_201966 ) ( SUPPORTS ?auto_201963 ?auto_201955 ) ( not ( = ?auto_201958 ?auto_201964 ) ) ( HAVE_IMAGE ?auto_201959 ?auto_201962 ) ( not ( = ?auto_201959 ?auto_201958 ) ) ( not ( = ?auto_201959 ?auto_201964 ) ) ( not ( = ?auto_201962 ?auto_201955 ) ) ( CALIBRATION_TARGET ?auto_201963 ?auto_201964 ) ( POINTING ?auto_201966 ?auto_201956 ) ( not ( = ?auto_201964 ?auto_201956 ) ) ( not ( = ?auto_201958 ?auto_201956 ) ) ( not ( = ?auto_201959 ?auto_201956 ) ) ( ON_BOARD ?auto_201965 ?auto_201966 ) ( POWER_ON ?auto_201965 ) ( not ( = ?auto_201963 ?auto_201965 ) ) ( HAVE_IMAGE ?auto_201956 ?auto_201957 ) ( HAVE_IMAGE ?auto_201959 ?auto_201960 ) ( HAVE_IMAGE ?auto_201961 ?auto_201962 ) ( not ( = ?auto_201956 ?auto_201961 ) ) ( not ( = ?auto_201957 ?auto_201955 ) ) ( not ( = ?auto_201957 ?auto_201960 ) ) ( not ( = ?auto_201957 ?auto_201962 ) ) ( not ( = ?auto_201958 ?auto_201961 ) ) ( not ( = ?auto_201955 ?auto_201960 ) ) ( not ( = ?auto_201959 ?auto_201961 ) ) ( not ( = ?auto_201960 ?auto_201962 ) ) ( not ( = ?auto_201961 ?auto_201964 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201959 ?auto_201962 ?auto_201958 ?auto_201955 )
      ( GET-4IMAGE-VERIFY ?auto_201956 ?auto_201957 ?auto_201958 ?auto_201955 ?auto_201959 ?auto_201960 ?auto_201961 ?auto_201962 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_201968 - DIRECTION
      ?auto_201969 - MODE
      ?auto_201970 - DIRECTION
      ?auto_201967 - MODE
      ?auto_201971 - DIRECTION
      ?auto_201972 - MODE
      ?auto_201973 - DIRECTION
      ?auto_201974 - MODE
    )
    :vars
    (
      ?auto_201975 - INSTRUMENT
      ?auto_201978 - SATELLITE
      ?auto_201976 - DIRECTION
      ?auto_201977 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201975 ?auto_201978 ) ( SUPPORTS ?auto_201975 ?auto_201967 ) ( not ( = ?auto_201970 ?auto_201976 ) ) ( HAVE_IMAGE ?auto_201971 ?auto_201972 ) ( not ( = ?auto_201971 ?auto_201970 ) ) ( not ( = ?auto_201971 ?auto_201976 ) ) ( not ( = ?auto_201972 ?auto_201967 ) ) ( CALIBRATION_TARGET ?auto_201975 ?auto_201976 ) ( POINTING ?auto_201978 ?auto_201968 ) ( not ( = ?auto_201976 ?auto_201968 ) ) ( not ( = ?auto_201970 ?auto_201968 ) ) ( not ( = ?auto_201971 ?auto_201968 ) ) ( ON_BOARD ?auto_201977 ?auto_201978 ) ( POWER_ON ?auto_201977 ) ( not ( = ?auto_201975 ?auto_201977 ) ) ( HAVE_IMAGE ?auto_201968 ?auto_201969 ) ( HAVE_IMAGE ?auto_201973 ?auto_201974 ) ( not ( = ?auto_201968 ?auto_201973 ) ) ( not ( = ?auto_201969 ?auto_201967 ) ) ( not ( = ?auto_201969 ?auto_201972 ) ) ( not ( = ?auto_201969 ?auto_201974 ) ) ( not ( = ?auto_201970 ?auto_201973 ) ) ( not ( = ?auto_201967 ?auto_201974 ) ) ( not ( = ?auto_201971 ?auto_201973 ) ) ( not ( = ?auto_201972 ?auto_201974 ) ) ( not ( = ?auto_201973 ?auto_201976 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201971 ?auto_201972 ?auto_201970 ?auto_201967 )
      ( GET-4IMAGE-VERIFY ?auto_201968 ?auto_201969 ?auto_201970 ?auto_201967 ?auto_201971 ?auto_201972 ?auto_201973 ?auto_201974 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_201992 - DIRECTION
      ?auto_201993 - MODE
      ?auto_201994 - DIRECTION
      ?auto_201991 - MODE
      ?auto_201995 - DIRECTION
      ?auto_201996 - MODE
      ?auto_201997 - DIRECTION
      ?auto_201998 - MODE
    )
    :vars
    (
      ?auto_201999 - INSTRUMENT
      ?auto_202002 - SATELLITE
      ?auto_202000 - DIRECTION
      ?auto_202001 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_201999 ?auto_202002 ) ( SUPPORTS ?auto_201999 ?auto_201991 ) ( not ( = ?auto_201994 ?auto_202000 ) ) ( HAVE_IMAGE ?auto_201997 ?auto_201998 ) ( not ( = ?auto_201997 ?auto_201994 ) ) ( not ( = ?auto_201997 ?auto_202000 ) ) ( not ( = ?auto_201998 ?auto_201991 ) ) ( CALIBRATION_TARGET ?auto_201999 ?auto_202000 ) ( POINTING ?auto_202002 ?auto_201992 ) ( not ( = ?auto_202000 ?auto_201992 ) ) ( not ( = ?auto_201994 ?auto_201992 ) ) ( not ( = ?auto_201997 ?auto_201992 ) ) ( ON_BOARD ?auto_202001 ?auto_202002 ) ( POWER_ON ?auto_202001 ) ( not ( = ?auto_201999 ?auto_202001 ) ) ( HAVE_IMAGE ?auto_201992 ?auto_201993 ) ( HAVE_IMAGE ?auto_201995 ?auto_201996 ) ( not ( = ?auto_201992 ?auto_201995 ) ) ( not ( = ?auto_201993 ?auto_201991 ) ) ( not ( = ?auto_201993 ?auto_201996 ) ) ( not ( = ?auto_201993 ?auto_201998 ) ) ( not ( = ?auto_201994 ?auto_201995 ) ) ( not ( = ?auto_201991 ?auto_201996 ) ) ( not ( = ?auto_201995 ?auto_201997 ) ) ( not ( = ?auto_201995 ?auto_202000 ) ) ( not ( = ?auto_201996 ?auto_201998 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201997 ?auto_201998 ?auto_201994 ?auto_201991 )
      ( GET-4IMAGE-VERIFY ?auto_201992 ?auto_201993 ?auto_201994 ?auto_201991 ?auto_201995 ?auto_201996 ?auto_201997 ?auto_201998 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_202004 - DIRECTION
      ?auto_202005 - MODE
      ?auto_202006 - DIRECTION
      ?auto_202003 - MODE
      ?auto_202007 - DIRECTION
      ?auto_202008 - MODE
      ?auto_202009 - DIRECTION
      ?auto_202010 - MODE
    )
    :vars
    (
      ?auto_202011 - INSTRUMENT
      ?auto_202014 - SATELLITE
      ?auto_202012 - DIRECTION
      ?auto_202016 - DIRECTION
      ?auto_202015 - MODE
      ?auto_202013 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_202011 ?auto_202014 ) ( SUPPORTS ?auto_202011 ?auto_202003 ) ( not ( = ?auto_202006 ?auto_202012 ) ) ( HAVE_IMAGE ?auto_202016 ?auto_202015 ) ( not ( = ?auto_202016 ?auto_202006 ) ) ( not ( = ?auto_202016 ?auto_202012 ) ) ( not ( = ?auto_202015 ?auto_202003 ) ) ( CALIBRATION_TARGET ?auto_202011 ?auto_202012 ) ( POINTING ?auto_202014 ?auto_202007 ) ( not ( = ?auto_202012 ?auto_202007 ) ) ( not ( = ?auto_202006 ?auto_202007 ) ) ( not ( = ?auto_202016 ?auto_202007 ) ) ( ON_BOARD ?auto_202013 ?auto_202014 ) ( POWER_ON ?auto_202013 ) ( not ( = ?auto_202011 ?auto_202013 ) ) ( HAVE_IMAGE ?auto_202004 ?auto_202005 ) ( HAVE_IMAGE ?auto_202007 ?auto_202008 ) ( HAVE_IMAGE ?auto_202009 ?auto_202010 ) ( not ( = ?auto_202004 ?auto_202006 ) ) ( not ( = ?auto_202004 ?auto_202007 ) ) ( not ( = ?auto_202004 ?auto_202009 ) ) ( not ( = ?auto_202004 ?auto_202012 ) ) ( not ( = ?auto_202004 ?auto_202016 ) ) ( not ( = ?auto_202005 ?auto_202003 ) ) ( not ( = ?auto_202005 ?auto_202008 ) ) ( not ( = ?auto_202005 ?auto_202010 ) ) ( not ( = ?auto_202005 ?auto_202015 ) ) ( not ( = ?auto_202006 ?auto_202009 ) ) ( not ( = ?auto_202003 ?auto_202008 ) ) ( not ( = ?auto_202003 ?auto_202010 ) ) ( not ( = ?auto_202007 ?auto_202009 ) ) ( not ( = ?auto_202008 ?auto_202010 ) ) ( not ( = ?auto_202008 ?auto_202015 ) ) ( not ( = ?auto_202009 ?auto_202012 ) ) ( not ( = ?auto_202009 ?auto_202016 ) ) ( not ( = ?auto_202010 ?auto_202015 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_202016 ?auto_202015 ?auto_202006 ?auto_202003 )
      ( GET-4IMAGE-VERIFY ?auto_202004 ?auto_202005 ?auto_202006 ?auto_202003 ?auto_202007 ?auto_202008 ?auto_202009 ?auto_202010 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_202072 - DIRECTION
      ?auto_202073 - MODE
      ?auto_202074 - DIRECTION
      ?auto_202071 - MODE
      ?auto_202075 - DIRECTION
      ?auto_202076 - MODE
      ?auto_202077 - DIRECTION
      ?auto_202078 - MODE
    )
    :vars
    (
      ?auto_202079 - INSTRUMENT
      ?auto_202083 - SATELLITE
      ?auto_202080 - DIRECTION
      ?auto_202082 - DIRECTION
      ?auto_202081 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_202079 ?auto_202083 ) ( SUPPORTS ?auto_202079 ?auto_202073 ) ( not ( = ?auto_202072 ?auto_202080 ) ) ( HAVE_IMAGE ?auto_202075 ?auto_202078 ) ( not ( = ?auto_202075 ?auto_202072 ) ) ( not ( = ?auto_202075 ?auto_202080 ) ) ( not ( = ?auto_202078 ?auto_202073 ) ) ( CALIBRATION_TARGET ?auto_202079 ?auto_202080 ) ( POINTING ?auto_202083 ?auto_202082 ) ( not ( = ?auto_202080 ?auto_202082 ) ) ( not ( = ?auto_202072 ?auto_202082 ) ) ( not ( = ?auto_202075 ?auto_202082 ) ) ( ON_BOARD ?auto_202081 ?auto_202083 ) ( POWER_ON ?auto_202081 ) ( not ( = ?auto_202079 ?auto_202081 ) ) ( HAVE_IMAGE ?auto_202074 ?auto_202071 ) ( HAVE_IMAGE ?auto_202075 ?auto_202076 ) ( HAVE_IMAGE ?auto_202077 ?auto_202078 ) ( not ( = ?auto_202072 ?auto_202074 ) ) ( not ( = ?auto_202072 ?auto_202077 ) ) ( not ( = ?auto_202073 ?auto_202071 ) ) ( not ( = ?auto_202073 ?auto_202076 ) ) ( not ( = ?auto_202074 ?auto_202075 ) ) ( not ( = ?auto_202074 ?auto_202077 ) ) ( not ( = ?auto_202074 ?auto_202080 ) ) ( not ( = ?auto_202074 ?auto_202082 ) ) ( not ( = ?auto_202071 ?auto_202076 ) ) ( not ( = ?auto_202071 ?auto_202078 ) ) ( not ( = ?auto_202075 ?auto_202077 ) ) ( not ( = ?auto_202076 ?auto_202078 ) ) ( not ( = ?auto_202077 ?auto_202080 ) ) ( not ( = ?auto_202077 ?auto_202082 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_202075 ?auto_202078 ?auto_202072 ?auto_202073 )
      ( GET-4IMAGE-VERIFY ?auto_202072 ?auto_202073 ?auto_202074 ?auto_202071 ?auto_202075 ?auto_202076 ?auto_202077 ?auto_202078 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_202085 - DIRECTION
      ?auto_202086 - MODE
      ?auto_202087 - DIRECTION
      ?auto_202084 - MODE
      ?auto_202088 - DIRECTION
      ?auto_202089 - MODE
      ?auto_202090 - DIRECTION
      ?auto_202091 - MODE
    )
    :vars
    (
      ?auto_202092 - INSTRUMENT
      ?auto_202095 - SATELLITE
      ?auto_202093 - DIRECTION
      ?auto_202094 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_202092 ?auto_202095 ) ( SUPPORTS ?auto_202092 ?auto_202086 ) ( not ( = ?auto_202085 ?auto_202093 ) ) ( HAVE_IMAGE ?auto_202087 ?auto_202089 ) ( not ( = ?auto_202087 ?auto_202085 ) ) ( not ( = ?auto_202087 ?auto_202093 ) ) ( not ( = ?auto_202089 ?auto_202086 ) ) ( CALIBRATION_TARGET ?auto_202092 ?auto_202093 ) ( POINTING ?auto_202095 ?auto_202090 ) ( not ( = ?auto_202093 ?auto_202090 ) ) ( not ( = ?auto_202085 ?auto_202090 ) ) ( not ( = ?auto_202087 ?auto_202090 ) ) ( ON_BOARD ?auto_202094 ?auto_202095 ) ( POWER_ON ?auto_202094 ) ( not ( = ?auto_202092 ?auto_202094 ) ) ( HAVE_IMAGE ?auto_202087 ?auto_202084 ) ( HAVE_IMAGE ?auto_202088 ?auto_202089 ) ( HAVE_IMAGE ?auto_202090 ?auto_202091 ) ( not ( = ?auto_202085 ?auto_202088 ) ) ( not ( = ?auto_202086 ?auto_202084 ) ) ( not ( = ?auto_202086 ?auto_202091 ) ) ( not ( = ?auto_202087 ?auto_202088 ) ) ( not ( = ?auto_202084 ?auto_202089 ) ) ( not ( = ?auto_202084 ?auto_202091 ) ) ( not ( = ?auto_202088 ?auto_202090 ) ) ( not ( = ?auto_202088 ?auto_202093 ) ) ( not ( = ?auto_202089 ?auto_202091 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_202087 ?auto_202089 ?auto_202085 ?auto_202086 )
      ( GET-4IMAGE-VERIFY ?auto_202085 ?auto_202086 ?auto_202087 ?auto_202084 ?auto_202088 ?auto_202089 ?auto_202090 ?auto_202091 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_202110 - DIRECTION
      ?auto_202111 - MODE
      ?auto_202112 - DIRECTION
      ?auto_202109 - MODE
      ?auto_202113 - DIRECTION
      ?auto_202114 - MODE
      ?auto_202115 - DIRECTION
      ?auto_202116 - MODE
    )
    :vars
    (
      ?auto_202117 - INSTRUMENT
      ?auto_202120 - SATELLITE
      ?auto_202118 - DIRECTION
      ?auto_202119 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_202117 ?auto_202120 ) ( SUPPORTS ?auto_202117 ?auto_202111 ) ( not ( = ?auto_202110 ?auto_202118 ) ) ( HAVE_IMAGE ?auto_202112 ?auto_202116 ) ( not ( = ?auto_202112 ?auto_202110 ) ) ( not ( = ?auto_202112 ?auto_202118 ) ) ( not ( = ?auto_202116 ?auto_202111 ) ) ( CALIBRATION_TARGET ?auto_202117 ?auto_202118 ) ( POINTING ?auto_202120 ?auto_202113 ) ( not ( = ?auto_202118 ?auto_202113 ) ) ( not ( = ?auto_202110 ?auto_202113 ) ) ( not ( = ?auto_202112 ?auto_202113 ) ) ( ON_BOARD ?auto_202119 ?auto_202120 ) ( POWER_ON ?auto_202119 ) ( not ( = ?auto_202117 ?auto_202119 ) ) ( HAVE_IMAGE ?auto_202112 ?auto_202109 ) ( HAVE_IMAGE ?auto_202113 ?auto_202114 ) ( HAVE_IMAGE ?auto_202115 ?auto_202116 ) ( not ( = ?auto_202110 ?auto_202115 ) ) ( not ( = ?auto_202111 ?auto_202109 ) ) ( not ( = ?auto_202111 ?auto_202114 ) ) ( not ( = ?auto_202112 ?auto_202115 ) ) ( not ( = ?auto_202109 ?auto_202114 ) ) ( not ( = ?auto_202109 ?auto_202116 ) ) ( not ( = ?auto_202113 ?auto_202115 ) ) ( not ( = ?auto_202114 ?auto_202116 ) ) ( not ( = ?auto_202115 ?auto_202118 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_202112 ?auto_202116 ?auto_202110 ?auto_202111 )
      ( GET-4IMAGE-VERIFY ?auto_202110 ?auto_202111 ?auto_202112 ?auto_202109 ?auto_202113 ?auto_202114 ?auto_202115 ?auto_202116 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_202122 - DIRECTION
      ?auto_202123 - MODE
      ?auto_202124 - DIRECTION
      ?auto_202121 - MODE
      ?auto_202125 - DIRECTION
      ?auto_202126 - MODE
      ?auto_202127 - DIRECTION
      ?auto_202128 - MODE
    )
    :vars
    (
      ?auto_202129 - INSTRUMENT
      ?auto_202132 - SATELLITE
      ?auto_202130 - DIRECTION
      ?auto_202131 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_202129 ?auto_202132 ) ( SUPPORTS ?auto_202129 ?auto_202123 ) ( not ( = ?auto_202122 ?auto_202130 ) ) ( HAVE_IMAGE ?auto_202124 ?auto_202121 ) ( not ( = ?auto_202124 ?auto_202122 ) ) ( not ( = ?auto_202124 ?auto_202130 ) ) ( not ( = ?auto_202121 ?auto_202123 ) ) ( CALIBRATION_TARGET ?auto_202129 ?auto_202130 ) ( POINTING ?auto_202132 ?auto_202125 ) ( not ( = ?auto_202130 ?auto_202125 ) ) ( not ( = ?auto_202122 ?auto_202125 ) ) ( not ( = ?auto_202124 ?auto_202125 ) ) ( ON_BOARD ?auto_202131 ?auto_202132 ) ( POWER_ON ?auto_202131 ) ( not ( = ?auto_202129 ?auto_202131 ) ) ( HAVE_IMAGE ?auto_202125 ?auto_202126 ) ( HAVE_IMAGE ?auto_202127 ?auto_202128 ) ( not ( = ?auto_202122 ?auto_202127 ) ) ( not ( = ?auto_202123 ?auto_202126 ) ) ( not ( = ?auto_202123 ?auto_202128 ) ) ( not ( = ?auto_202124 ?auto_202127 ) ) ( not ( = ?auto_202121 ?auto_202126 ) ) ( not ( = ?auto_202121 ?auto_202128 ) ) ( not ( = ?auto_202125 ?auto_202127 ) ) ( not ( = ?auto_202126 ?auto_202128 ) ) ( not ( = ?auto_202127 ?auto_202130 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_202124 ?auto_202121 ?auto_202122 ?auto_202123 )
      ( GET-4IMAGE-VERIFY ?auto_202122 ?auto_202123 ?auto_202124 ?auto_202121 ?auto_202125 ?auto_202126 ?auto_202127 ?auto_202128 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_202184 - DIRECTION
      ?auto_202185 - MODE
      ?auto_202186 - DIRECTION
      ?auto_202183 - MODE
      ?auto_202187 - DIRECTION
      ?auto_202188 - MODE
      ?auto_202189 - DIRECTION
      ?auto_202190 - MODE
    )
    :vars
    (
      ?auto_202191 - INSTRUMENT
      ?auto_202194 - SATELLITE
      ?auto_202192 - DIRECTION
      ?auto_202193 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_202191 ?auto_202194 ) ( SUPPORTS ?auto_202191 ?auto_202185 ) ( not ( = ?auto_202184 ?auto_202192 ) ) ( HAVE_IMAGE ?auto_202187 ?auto_202190 ) ( not ( = ?auto_202187 ?auto_202184 ) ) ( not ( = ?auto_202187 ?auto_202192 ) ) ( not ( = ?auto_202190 ?auto_202185 ) ) ( CALIBRATION_TARGET ?auto_202191 ?auto_202192 ) ( POINTING ?auto_202194 ?auto_202186 ) ( not ( = ?auto_202192 ?auto_202186 ) ) ( not ( = ?auto_202184 ?auto_202186 ) ) ( not ( = ?auto_202187 ?auto_202186 ) ) ( ON_BOARD ?auto_202193 ?auto_202194 ) ( POWER_ON ?auto_202193 ) ( not ( = ?auto_202191 ?auto_202193 ) ) ( HAVE_IMAGE ?auto_202186 ?auto_202183 ) ( HAVE_IMAGE ?auto_202187 ?auto_202188 ) ( HAVE_IMAGE ?auto_202189 ?auto_202190 ) ( not ( = ?auto_202184 ?auto_202189 ) ) ( not ( = ?auto_202185 ?auto_202183 ) ) ( not ( = ?auto_202185 ?auto_202188 ) ) ( not ( = ?auto_202186 ?auto_202189 ) ) ( not ( = ?auto_202183 ?auto_202188 ) ) ( not ( = ?auto_202183 ?auto_202190 ) ) ( not ( = ?auto_202187 ?auto_202189 ) ) ( not ( = ?auto_202188 ?auto_202190 ) ) ( not ( = ?auto_202189 ?auto_202192 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_202187 ?auto_202190 ?auto_202184 ?auto_202185 )
      ( GET-4IMAGE-VERIFY ?auto_202184 ?auto_202185 ?auto_202186 ?auto_202183 ?auto_202187 ?auto_202188 ?auto_202189 ?auto_202190 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_202196 - DIRECTION
      ?auto_202197 - MODE
      ?auto_202198 - DIRECTION
      ?auto_202195 - MODE
      ?auto_202199 - DIRECTION
      ?auto_202200 - MODE
      ?auto_202201 - DIRECTION
      ?auto_202202 - MODE
    )
    :vars
    (
      ?auto_202203 - INSTRUMENT
      ?auto_202206 - SATELLITE
      ?auto_202204 - DIRECTION
      ?auto_202205 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_202203 ?auto_202206 ) ( SUPPORTS ?auto_202203 ?auto_202197 ) ( not ( = ?auto_202196 ?auto_202204 ) ) ( HAVE_IMAGE ?auto_202199 ?auto_202200 ) ( not ( = ?auto_202199 ?auto_202196 ) ) ( not ( = ?auto_202199 ?auto_202204 ) ) ( not ( = ?auto_202200 ?auto_202197 ) ) ( CALIBRATION_TARGET ?auto_202203 ?auto_202204 ) ( POINTING ?auto_202206 ?auto_202198 ) ( not ( = ?auto_202204 ?auto_202198 ) ) ( not ( = ?auto_202196 ?auto_202198 ) ) ( not ( = ?auto_202199 ?auto_202198 ) ) ( ON_BOARD ?auto_202205 ?auto_202206 ) ( POWER_ON ?auto_202205 ) ( not ( = ?auto_202203 ?auto_202205 ) ) ( HAVE_IMAGE ?auto_202198 ?auto_202195 ) ( HAVE_IMAGE ?auto_202201 ?auto_202202 ) ( not ( = ?auto_202196 ?auto_202201 ) ) ( not ( = ?auto_202197 ?auto_202195 ) ) ( not ( = ?auto_202197 ?auto_202202 ) ) ( not ( = ?auto_202198 ?auto_202201 ) ) ( not ( = ?auto_202195 ?auto_202200 ) ) ( not ( = ?auto_202195 ?auto_202202 ) ) ( not ( = ?auto_202199 ?auto_202201 ) ) ( not ( = ?auto_202200 ?auto_202202 ) ) ( not ( = ?auto_202201 ?auto_202204 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_202199 ?auto_202200 ?auto_202196 ?auto_202197 )
      ( GET-4IMAGE-VERIFY ?auto_202196 ?auto_202197 ?auto_202198 ?auto_202195 ?auto_202199 ?auto_202200 ?auto_202201 ?auto_202202 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_202220 - DIRECTION
      ?auto_202221 - MODE
      ?auto_202222 - DIRECTION
      ?auto_202219 - MODE
      ?auto_202223 - DIRECTION
      ?auto_202224 - MODE
      ?auto_202225 - DIRECTION
      ?auto_202226 - MODE
    )
    :vars
    (
      ?auto_202227 - INSTRUMENT
      ?auto_202230 - SATELLITE
      ?auto_202228 - DIRECTION
      ?auto_202229 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_202227 ?auto_202230 ) ( SUPPORTS ?auto_202227 ?auto_202221 ) ( not ( = ?auto_202220 ?auto_202228 ) ) ( HAVE_IMAGE ?auto_202225 ?auto_202226 ) ( not ( = ?auto_202225 ?auto_202220 ) ) ( not ( = ?auto_202225 ?auto_202228 ) ) ( not ( = ?auto_202226 ?auto_202221 ) ) ( CALIBRATION_TARGET ?auto_202227 ?auto_202228 ) ( POINTING ?auto_202230 ?auto_202223 ) ( not ( = ?auto_202228 ?auto_202223 ) ) ( not ( = ?auto_202220 ?auto_202223 ) ) ( not ( = ?auto_202225 ?auto_202223 ) ) ( ON_BOARD ?auto_202229 ?auto_202230 ) ( POWER_ON ?auto_202229 ) ( not ( = ?auto_202227 ?auto_202229 ) ) ( HAVE_IMAGE ?auto_202222 ?auto_202219 ) ( HAVE_IMAGE ?auto_202223 ?auto_202224 ) ( not ( = ?auto_202220 ?auto_202222 ) ) ( not ( = ?auto_202221 ?auto_202219 ) ) ( not ( = ?auto_202221 ?auto_202224 ) ) ( not ( = ?auto_202222 ?auto_202223 ) ) ( not ( = ?auto_202222 ?auto_202225 ) ) ( not ( = ?auto_202222 ?auto_202228 ) ) ( not ( = ?auto_202219 ?auto_202224 ) ) ( not ( = ?auto_202219 ?auto_202226 ) ) ( not ( = ?auto_202224 ?auto_202226 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_202225 ?auto_202226 ?auto_202220 ?auto_202221 )
      ( GET-4IMAGE-VERIFY ?auto_202220 ?auto_202221 ?auto_202222 ?auto_202219 ?auto_202223 ?auto_202224 ?auto_202225 ?auto_202226 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_202232 - DIRECTION
      ?auto_202233 - MODE
      ?auto_202234 - DIRECTION
      ?auto_202231 - MODE
      ?auto_202235 - DIRECTION
      ?auto_202236 - MODE
      ?auto_202237 - DIRECTION
      ?auto_202238 - MODE
    )
    :vars
    (
      ?auto_202239 - INSTRUMENT
      ?auto_202242 - SATELLITE
      ?auto_202240 - DIRECTION
      ?auto_202244 - DIRECTION
      ?auto_202243 - MODE
      ?auto_202241 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_202239 ?auto_202242 ) ( SUPPORTS ?auto_202239 ?auto_202233 ) ( not ( = ?auto_202232 ?auto_202240 ) ) ( HAVE_IMAGE ?auto_202244 ?auto_202243 ) ( not ( = ?auto_202244 ?auto_202232 ) ) ( not ( = ?auto_202244 ?auto_202240 ) ) ( not ( = ?auto_202243 ?auto_202233 ) ) ( CALIBRATION_TARGET ?auto_202239 ?auto_202240 ) ( POINTING ?auto_202242 ?auto_202235 ) ( not ( = ?auto_202240 ?auto_202235 ) ) ( not ( = ?auto_202232 ?auto_202235 ) ) ( not ( = ?auto_202244 ?auto_202235 ) ) ( ON_BOARD ?auto_202241 ?auto_202242 ) ( POWER_ON ?auto_202241 ) ( not ( = ?auto_202239 ?auto_202241 ) ) ( HAVE_IMAGE ?auto_202234 ?auto_202231 ) ( HAVE_IMAGE ?auto_202235 ?auto_202236 ) ( HAVE_IMAGE ?auto_202237 ?auto_202238 ) ( not ( = ?auto_202232 ?auto_202234 ) ) ( not ( = ?auto_202232 ?auto_202237 ) ) ( not ( = ?auto_202233 ?auto_202231 ) ) ( not ( = ?auto_202233 ?auto_202236 ) ) ( not ( = ?auto_202233 ?auto_202238 ) ) ( not ( = ?auto_202234 ?auto_202235 ) ) ( not ( = ?auto_202234 ?auto_202237 ) ) ( not ( = ?auto_202234 ?auto_202240 ) ) ( not ( = ?auto_202234 ?auto_202244 ) ) ( not ( = ?auto_202231 ?auto_202236 ) ) ( not ( = ?auto_202231 ?auto_202238 ) ) ( not ( = ?auto_202231 ?auto_202243 ) ) ( not ( = ?auto_202235 ?auto_202237 ) ) ( not ( = ?auto_202236 ?auto_202238 ) ) ( not ( = ?auto_202236 ?auto_202243 ) ) ( not ( = ?auto_202237 ?auto_202240 ) ) ( not ( = ?auto_202237 ?auto_202244 ) ) ( not ( = ?auto_202238 ?auto_202243 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_202244 ?auto_202243 ?auto_202232 ?auto_202233 )
      ( GET-4IMAGE-VERIFY ?auto_202232 ?auto_202233 ?auto_202234 ?auto_202231 ?auto_202235 ?auto_202236 ?auto_202237 ?auto_202238 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_202482 - DIRECTION
      ?auto_202483 - MODE
      ?auto_202484 - DIRECTION
      ?auto_202481 - MODE
      ?auto_202485 - DIRECTION
      ?auto_202486 - MODE
    )
    :vars
    (
      ?auto_202489 - INSTRUMENT
      ?auto_202490 - SATELLITE
      ?auto_202488 - DIRECTION
      ?auto_202491 - DIRECTION
      ?auto_202487 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_202489 ?auto_202490 ) ( SUPPORTS ?auto_202489 ?auto_202481 ) ( not ( = ?auto_202484 ?auto_202488 ) ) ( HAVE_IMAGE ?auto_202482 ?auto_202483 ) ( not ( = ?auto_202482 ?auto_202484 ) ) ( not ( = ?auto_202482 ?auto_202488 ) ) ( not ( = ?auto_202483 ?auto_202481 ) ) ( CALIBRATION_TARGET ?auto_202489 ?auto_202488 ) ( POINTING ?auto_202490 ?auto_202491 ) ( not ( = ?auto_202488 ?auto_202491 ) ) ( not ( = ?auto_202484 ?auto_202491 ) ) ( not ( = ?auto_202482 ?auto_202491 ) ) ( ON_BOARD ?auto_202487 ?auto_202490 ) ( POWER_ON ?auto_202487 ) ( not ( = ?auto_202489 ?auto_202487 ) ) ( HAVE_IMAGE ?auto_202485 ?auto_202486 ) ( not ( = ?auto_202482 ?auto_202485 ) ) ( not ( = ?auto_202483 ?auto_202486 ) ) ( not ( = ?auto_202484 ?auto_202485 ) ) ( not ( = ?auto_202481 ?auto_202486 ) ) ( not ( = ?auto_202485 ?auto_202488 ) ) ( not ( = ?auto_202485 ?auto_202491 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_202482 ?auto_202483 ?auto_202484 ?auto_202481 )
      ( GET-3IMAGE-VERIFY ?auto_202482 ?auto_202483 ?auto_202484 ?auto_202481 ?auto_202485 ?auto_202486 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_202570 - DIRECTION
      ?auto_202571 - MODE
      ?auto_202572 - DIRECTION
      ?auto_202569 - MODE
      ?auto_202573 - DIRECTION
      ?auto_202574 - MODE
    )
    :vars
    (
      ?auto_202577 - INSTRUMENT
      ?auto_202578 - SATELLITE
      ?auto_202576 - DIRECTION
      ?auto_202579 - DIRECTION
      ?auto_202575 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_202577 ?auto_202578 ) ( SUPPORTS ?auto_202577 ?auto_202571 ) ( not ( = ?auto_202570 ?auto_202576 ) ) ( HAVE_IMAGE ?auto_202572 ?auto_202569 ) ( not ( = ?auto_202572 ?auto_202570 ) ) ( not ( = ?auto_202572 ?auto_202576 ) ) ( not ( = ?auto_202569 ?auto_202571 ) ) ( CALIBRATION_TARGET ?auto_202577 ?auto_202576 ) ( POINTING ?auto_202578 ?auto_202579 ) ( not ( = ?auto_202576 ?auto_202579 ) ) ( not ( = ?auto_202570 ?auto_202579 ) ) ( not ( = ?auto_202572 ?auto_202579 ) ) ( ON_BOARD ?auto_202575 ?auto_202578 ) ( POWER_ON ?auto_202575 ) ( not ( = ?auto_202577 ?auto_202575 ) ) ( HAVE_IMAGE ?auto_202573 ?auto_202574 ) ( not ( = ?auto_202570 ?auto_202573 ) ) ( not ( = ?auto_202571 ?auto_202574 ) ) ( not ( = ?auto_202572 ?auto_202573 ) ) ( not ( = ?auto_202569 ?auto_202574 ) ) ( not ( = ?auto_202573 ?auto_202576 ) ) ( not ( = ?auto_202573 ?auto_202579 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_202572 ?auto_202569 ?auto_202570 ?auto_202571 )
      ( GET-3IMAGE-VERIFY ?auto_202570 ?auto_202571 ?auto_202572 ?auto_202569 ?auto_202573 ?auto_202574 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_202672 - DIRECTION
      ?auto_202673 - MODE
      ?auto_202674 - DIRECTION
      ?auto_202671 - MODE
      ?auto_202675 - DIRECTION
      ?auto_202676 - MODE
      ?auto_202677 - DIRECTION
      ?auto_202678 - MODE
    )
    :vars
    (
      ?auto_202681 - INSTRUMENT
      ?auto_202682 - SATELLITE
      ?auto_202680 - DIRECTION
      ?auto_202683 - DIRECTION
      ?auto_202679 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_202681 ?auto_202682 ) ( SUPPORTS ?auto_202681 ?auto_202678 ) ( not ( = ?auto_202677 ?auto_202680 ) ) ( HAVE_IMAGE ?auto_202674 ?auto_202671 ) ( not ( = ?auto_202674 ?auto_202677 ) ) ( not ( = ?auto_202674 ?auto_202680 ) ) ( not ( = ?auto_202671 ?auto_202678 ) ) ( CALIBRATION_TARGET ?auto_202681 ?auto_202680 ) ( POINTING ?auto_202682 ?auto_202683 ) ( not ( = ?auto_202680 ?auto_202683 ) ) ( not ( = ?auto_202677 ?auto_202683 ) ) ( not ( = ?auto_202674 ?auto_202683 ) ) ( ON_BOARD ?auto_202679 ?auto_202682 ) ( POWER_ON ?auto_202679 ) ( not ( = ?auto_202681 ?auto_202679 ) ) ( HAVE_IMAGE ?auto_202672 ?auto_202673 ) ( HAVE_IMAGE ?auto_202675 ?auto_202676 ) ( not ( = ?auto_202672 ?auto_202674 ) ) ( not ( = ?auto_202672 ?auto_202675 ) ) ( not ( = ?auto_202672 ?auto_202677 ) ) ( not ( = ?auto_202672 ?auto_202680 ) ) ( not ( = ?auto_202672 ?auto_202683 ) ) ( not ( = ?auto_202673 ?auto_202671 ) ) ( not ( = ?auto_202673 ?auto_202676 ) ) ( not ( = ?auto_202673 ?auto_202678 ) ) ( not ( = ?auto_202674 ?auto_202675 ) ) ( not ( = ?auto_202671 ?auto_202676 ) ) ( not ( = ?auto_202675 ?auto_202677 ) ) ( not ( = ?auto_202675 ?auto_202680 ) ) ( not ( = ?auto_202675 ?auto_202683 ) ) ( not ( = ?auto_202676 ?auto_202678 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_202674 ?auto_202671 ?auto_202677 ?auto_202678 )
      ( GET-4IMAGE-VERIFY ?auto_202672 ?auto_202673 ?auto_202674 ?auto_202671 ?auto_202675 ?auto_202676 ?auto_202677 ?auto_202678 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_202795 - DIRECTION
      ?auto_202796 - MODE
      ?auto_202797 - DIRECTION
      ?auto_202794 - MODE
      ?auto_202798 - DIRECTION
      ?auto_202799 - MODE
      ?auto_202800 - DIRECTION
      ?auto_202801 - MODE
    )
    :vars
    (
      ?auto_202804 - INSTRUMENT
      ?auto_202805 - SATELLITE
      ?auto_202803 - DIRECTION
      ?auto_202806 - DIRECTION
      ?auto_202802 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_202804 ?auto_202805 ) ( SUPPORTS ?auto_202804 ?auto_202794 ) ( not ( = ?auto_202797 ?auto_202803 ) ) ( HAVE_IMAGE ?auto_202795 ?auto_202796 ) ( not ( = ?auto_202795 ?auto_202797 ) ) ( not ( = ?auto_202795 ?auto_202803 ) ) ( not ( = ?auto_202796 ?auto_202794 ) ) ( CALIBRATION_TARGET ?auto_202804 ?auto_202803 ) ( POINTING ?auto_202805 ?auto_202806 ) ( not ( = ?auto_202803 ?auto_202806 ) ) ( not ( = ?auto_202797 ?auto_202806 ) ) ( not ( = ?auto_202795 ?auto_202806 ) ) ( ON_BOARD ?auto_202802 ?auto_202805 ) ( POWER_ON ?auto_202802 ) ( not ( = ?auto_202804 ?auto_202802 ) ) ( HAVE_IMAGE ?auto_202798 ?auto_202799 ) ( HAVE_IMAGE ?auto_202800 ?auto_202801 ) ( not ( = ?auto_202795 ?auto_202798 ) ) ( not ( = ?auto_202795 ?auto_202800 ) ) ( not ( = ?auto_202796 ?auto_202799 ) ) ( not ( = ?auto_202796 ?auto_202801 ) ) ( not ( = ?auto_202797 ?auto_202798 ) ) ( not ( = ?auto_202797 ?auto_202800 ) ) ( not ( = ?auto_202794 ?auto_202799 ) ) ( not ( = ?auto_202794 ?auto_202801 ) ) ( not ( = ?auto_202798 ?auto_202800 ) ) ( not ( = ?auto_202798 ?auto_202803 ) ) ( not ( = ?auto_202798 ?auto_202806 ) ) ( not ( = ?auto_202799 ?auto_202801 ) ) ( not ( = ?auto_202800 ?auto_202803 ) ) ( not ( = ?auto_202800 ?auto_202806 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_202795 ?auto_202796 ?auto_202797 ?auto_202794 )
      ( GET-4IMAGE-VERIFY ?auto_202795 ?auto_202796 ?auto_202797 ?auto_202794 ?auto_202798 ?auto_202799 ?auto_202800 ?auto_202801 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_203149 - DIRECTION
      ?auto_203150 - MODE
      ?auto_203151 - DIRECTION
      ?auto_203148 - MODE
      ?auto_203152 - DIRECTION
      ?auto_203153 - MODE
      ?auto_203154 - DIRECTION
      ?auto_203155 - MODE
    )
    :vars
    (
      ?auto_203158 - INSTRUMENT
      ?auto_203159 - SATELLITE
      ?auto_203157 - DIRECTION
      ?auto_203160 - DIRECTION
      ?auto_203156 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_203158 ?auto_203159 ) ( SUPPORTS ?auto_203158 ?auto_203150 ) ( not ( = ?auto_203149 ?auto_203157 ) ) ( HAVE_IMAGE ?auto_203151 ?auto_203155 ) ( not ( = ?auto_203151 ?auto_203149 ) ) ( not ( = ?auto_203151 ?auto_203157 ) ) ( not ( = ?auto_203155 ?auto_203150 ) ) ( CALIBRATION_TARGET ?auto_203158 ?auto_203157 ) ( POINTING ?auto_203159 ?auto_203160 ) ( not ( = ?auto_203157 ?auto_203160 ) ) ( not ( = ?auto_203149 ?auto_203160 ) ) ( not ( = ?auto_203151 ?auto_203160 ) ) ( ON_BOARD ?auto_203156 ?auto_203159 ) ( POWER_ON ?auto_203156 ) ( not ( = ?auto_203158 ?auto_203156 ) ) ( HAVE_IMAGE ?auto_203151 ?auto_203148 ) ( HAVE_IMAGE ?auto_203152 ?auto_203153 ) ( HAVE_IMAGE ?auto_203154 ?auto_203155 ) ( not ( = ?auto_203149 ?auto_203152 ) ) ( not ( = ?auto_203149 ?auto_203154 ) ) ( not ( = ?auto_203150 ?auto_203148 ) ) ( not ( = ?auto_203150 ?auto_203153 ) ) ( not ( = ?auto_203151 ?auto_203152 ) ) ( not ( = ?auto_203151 ?auto_203154 ) ) ( not ( = ?auto_203148 ?auto_203153 ) ) ( not ( = ?auto_203148 ?auto_203155 ) ) ( not ( = ?auto_203152 ?auto_203154 ) ) ( not ( = ?auto_203152 ?auto_203157 ) ) ( not ( = ?auto_203152 ?auto_203160 ) ) ( not ( = ?auto_203153 ?auto_203155 ) ) ( not ( = ?auto_203154 ?auto_203157 ) ) ( not ( = ?auto_203154 ?auto_203160 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_203151 ?auto_203155 ?auto_203149 ?auto_203150 )
      ( GET-4IMAGE-VERIFY ?auto_203149 ?auto_203150 ?auto_203151 ?auto_203148 ?auto_203152 ?auto_203153 ?auto_203154 ?auto_203155 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_203496 - DIRECTION
      ?auto_203497 - MODE
    )
    :vars
    (
      ?auto_203500 - INSTRUMENT
      ?auto_203503 - SATELLITE
      ?auto_203499 - DIRECTION
      ?auto_203502 - DIRECTION
      ?auto_203501 - MODE
      ?auto_203504 - DIRECTION
      ?auto_203498 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_203500 ?auto_203503 ) ( SUPPORTS ?auto_203500 ?auto_203497 ) ( not ( = ?auto_203496 ?auto_203499 ) ) ( HAVE_IMAGE ?auto_203502 ?auto_203501 ) ( not ( = ?auto_203502 ?auto_203496 ) ) ( not ( = ?auto_203502 ?auto_203499 ) ) ( not ( = ?auto_203501 ?auto_203497 ) ) ( CALIBRATION_TARGET ?auto_203500 ?auto_203499 ) ( not ( = ?auto_203499 ?auto_203504 ) ) ( not ( = ?auto_203496 ?auto_203504 ) ) ( not ( = ?auto_203502 ?auto_203504 ) ) ( ON_BOARD ?auto_203498 ?auto_203503 ) ( POWER_ON ?auto_203498 ) ( not ( = ?auto_203500 ?auto_203498 ) ) ( POINTING ?auto_203503 ?auto_203499 ) )
    :subtasks
    ( ( !TURN_TO ?auto_203503 ?auto_203504 ?auto_203499 )
      ( GET-2IMAGE ?auto_203502 ?auto_203501 ?auto_203496 ?auto_203497 )
      ( GET-1IMAGE-VERIFY ?auto_203496 ?auto_203497 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_203506 - DIRECTION
      ?auto_203507 - MODE
      ?auto_203508 - DIRECTION
      ?auto_203505 - MODE
    )
    :vars
    (
      ?auto_203512 - INSTRUMENT
      ?auto_203510 - SATELLITE
      ?auto_203509 - DIRECTION
      ?auto_203513 - DIRECTION
      ?auto_203511 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_203512 ?auto_203510 ) ( SUPPORTS ?auto_203512 ?auto_203505 ) ( not ( = ?auto_203508 ?auto_203509 ) ) ( HAVE_IMAGE ?auto_203506 ?auto_203507 ) ( not ( = ?auto_203506 ?auto_203508 ) ) ( not ( = ?auto_203506 ?auto_203509 ) ) ( not ( = ?auto_203507 ?auto_203505 ) ) ( CALIBRATION_TARGET ?auto_203512 ?auto_203509 ) ( not ( = ?auto_203509 ?auto_203513 ) ) ( not ( = ?auto_203508 ?auto_203513 ) ) ( not ( = ?auto_203506 ?auto_203513 ) ) ( ON_BOARD ?auto_203511 ?auto_203510 ) ( POWER_ON ?auto_203511 ) ( not ( = ?auto_203512 ?auto_203511 ) ) ( POINTING ?auto_203510 ?auto_203509 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_203508 ?auto_203505 )
      ( GET-2IMAGE-VERIFY ?auto_203506 ?auto_203507 ?auto_203508 ?auto_203505 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_203525 - DIRECTION
      ?auto_203526 - MODE
      ?auto_203527 - DIRECTION
      ?auto_203524 - MODE
    )
    :vars
    (
      ?auto_203531 - INSTRUMENT
      ?auto_203532 - SATELLITE
      ?auto_203528 - DIRECTION
      ?auto_203529 - DIRECTION
      ?auto_203530 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_203531 ?auto_203532 ) ( SUPPORTS ?auto_203531 ?auto_203526 ) ( not ( = ?auto_203525 ?auto_203528 ) ) ( HAVE_IMAGE ?auto_203527 ?auto_203524 ) ( not ( = ?auto_203527 ?auto_203525 ) ) ( not ( = ?auto_203527 ?auto_203528 ) ) ( not ( = ?auto_203524 ?auto_203526 ) ) ( CALIBRATION_TARGET ?auto_203531 ?auto_203528 ) ( not ( = ?auto_203528 ?auto_203529 ) ) ( not ( = ?auto_203525 ?auto_203529 ) ) ( not ( = ?auto_203527 ?auto_203529 ) ) ( ON_BOARD ?auto_203530 ?auto_203532 ) ( POWER_ON ?auto_203530 ) ( not ( = ?auto_203531 ?auto_203530 ) ) ( POINTING ?auto_203532 ?auto_203528 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_203527 ?auto_203524 ?auto_203525 ?auto_203526 )
      ( GET-2IMAGE-VERIFY ?auto_203525 ?auto_203526 ?auto_203527 ?auto_203524 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_235162 - DIRECTION
      ?auto_235163 - MODE
      ?auto_235164 - DIRECTION
      ?auto_235161 - MODE
      ?auto_235165 - DIRECTION
      ?auto_235166 - MODE
    )
    :vars
    (
      ?auto_235170 - INSTRUMENT
      ?auto_235167 - SATELLITE
      ?auto_235169 - DIRECTION
      ?auto_235168 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_235170 ?auto_235167 ) ( SUPPORTS ?auto_235170 ?auto_235166 ) ( not ( = ?auto_235165 ?auto_235169 ) ) ( HAVE_IMAGE ?auto_235162 ?auto_235163 ) ( not ( = ?auto_235162 ?auto_235165 ) ) ( not ( = ?auto_235162 ?auto_235169 ) ) ( not ( = ?auto_235163 ?auto_235166 ) ) ( CALIBRATION_TARGET ?auto_235170 ?auto_235169 ) ( not ( = ?auto_235169 ?auto_235164 ) ) ( not ( = ?auto_235165 ?auto_235164 ) ) ( not ( = ?auto_235162 ?auto_235164 ) ) ( ON_BOARD ?auto_235168 ?auto_235167 ) ( POWER_ON ?auto_235168 ) ( not ( = ?auto_235170 ?auto_235168 ) ) ( POINTING ?auto_235167 ?auto_235169 ) ( HAVE_IMAGE ?auto_235164 ?auto_235161 ) ( not ( = ?auto_235163 ?auto_235161 ) ) ( not ( = ?auto_235161 ?auto_235166 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_235162 ?auto_235163 ?auto_235165 ?auto_235166 )
      ( GET-3IMAGE-VERIFY ?auto_235162 ?auto_235163 ?auto_235164 ?auto_235161 ?auto_235165 ?auto_235166 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_203576 - DIRECTION
      ?auto_203577 - MODE
      ?auto_203578 - DIRECTION
      ?auto_203575 - MODE
      ?auto_203579 - DIRECTION
      ?auto_203580 - MODE
    )
    :vars
    (
      ?auto_203584 - INSTRUMENT
      ?auto_203585 - SATELLITE
      ?auto_203581 - DIRECTION
      ?auto_203582 - DIRECTION
      ?auto_203583 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_203584 ?auto_203585 ) ( SUPPORTS ?auto_203584 ?auto_203575 ) ( not ( = ?auto_203578 ?auto_203581 ) ) ( HAVE_IMAGE ?auto_203579 ?auto_203577 ) ( not ( = ?auto_203579 ?auto_203578 ) ) ( not ( = ?auto_203579 ?auto_203581 ) ) ( not ( = ?auto_203577 ?auto_203575 ) ) ( CALIBRATION_TARGET ?auto_203584 ?auto_203581 ) ( not ( = ?auto_203581 ?auto_203582 ) ) ( not ( = ?auto_203578 ?auto_203582 ) ) ( not ( = ?auto_203579 ?auto_203582 ) ) ( ON_BOARD ?auto_203583 ?auto_203585 ) ( POWER_ON ?auto_203583 ) ( not ( = ?auto_203584 ?auto_203583 ) ) ( POINTING ?auto_203585 ?auto_203581 ) ( HAVE_IMAGE ?auto_203576 ?auto_203577 ) ( HAVE_IMAGE ?auto_203579 ?auto_203580 ) ( not ( = ?auto_203576 ?auto_203578 ) ) ( not ( = ?auto_203576 ?auto_203579 ) ) ( not ( = ?auto_203576 ?auto_203581 ) ) ( not ( = ?auto_203576 ?auto_203582 ) ) ( not ( = ?auto_203577 ?auto_203580 ) ) ( not ( = ?auto_203575 ?auto_203580 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_203579 ?auto_203577 ?auto_203578 ?auto_203575 )
      ( GET-3IMAGE-VERIFY ?auto_203576 ?auto_203577 ?auto_203578 ?auto_203575 ?auto_203579 ?auto_203580 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_235394 - DIRECTION
      ?auto_235395 - MODE
      ?auto_235396 - DIRECTION
      ?auto_235393 - MODE
      ?auto_235397 - DIRECTION
      ?auto_235398 - MODE
    )
    :vars
    (
      ?auto_235402 - INSTRUMENT
      ?auto_235399 - SATELLITE
      ?auto_235401 - DIRECTION
      ?auto_235400 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_235402 ?auto_235399 ) ( SUPPORTS ?auto_235402 ?auto_235395 ) ( not ( = ?auto_235394 ?auto_235401 ) ) ( HAVE_IMAGE ?auto_235396 ?auto_235393 ) ( not ( = ?auto_235396 ?auto_235394 ) ) ( not ( = ?auto_235396 ?auto_235401 ) ) ( not ( = ?auto_235393 ?auto_235395 ) ) ( CALIBRATION_TARGET ?auto_235402 ?auto_235401 ) ( not ( = ?auto_235401 ?auto_235397 ) ) ( not ( = ?auto_235394 ?auto_235397 ) ) ( not ( = ?auto_235396 ?auto_235397 ) ) ( ON_BOARD ?auto_235400 ?auto_235399 ) ( POWER_ON ?auto_235400 ) ( not ( = ?auto_235402 ?auto_235400 ) ) ( POINTING ?auto_235399 ?auto_235401 ) ( HAVE_IMAGE ?auto_235397 ?auto_235398 ) ( not ( = ?auto_235395 ?auto_235398 ) ) ( not ( = ?auto_235393 ?auto_235398 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_235396 ?auto_235393 ?auto_235394 ?auto_235395 )
      ( GET-3IMAGE-VERIFY ?auto_235394 ?auto_235395 ?auto_235396 ?auto_235393 ?auto_235397 ?auto_235398 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_235579 - DIRECTION
      ?auto_235580 - MODE
      ?auto_235581 - DIRECTION
      ?auto_235578 - MODE
      ?auto_235582 - DIRECTION
      ?auto_235583 - MODE
      ?auto_235584 - DIRECTION
      ?auto_235585 - MODE
    )
    :vars
    (
      ?auto_235589 - INSTRUMENT
      ?auto_235586 - SATELLITE
      ?auto_235588 - DIRECTION
      ?auto_235587 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_235589 ?auto_235586 ) ( SUPPORTS ?auto_235589 ?auto_235585 ) ( not ( = ?auto_235584 ?auto_235588 ) ) ( HAVE_IMAGE ?auto_235579 ?auto_235580 ) ( not ( = ?auto_235579 ?auto_235584 ) ) ( not ( = ?auto_235579 ?auto_235588 ) ) ( not ( = ?auto_235580 ?auto_235585 ) ) ( CALIBRATION_TARGET ?auto_235589 ?auto_235588 ) ( not ( = ?auto_235588 ?auto_235582 ) ) ( not ( = ?auto_235584 ?auto_235582 ) ) ( not ( = ?auto_235579 ?auto_235582 ) ) ( ON_BOARD ?auto_235587 ?auto_235586 ) ( POWER_ON ?auto_235587 ) ( not ( = ?auto_235589 ?auto_235587 ) ) ( POINTING ?auto_235586 ?auto_235588 ) ( HAVE_IMAGE ?auto_235581 ?auto_235578 ) ( HAVE_IMAGE ?auto_235582 ?auto_235583 ) ( not ( = ?auto_235579 ?auto_235581 ) ) ( not ( = ?auto_235580 ?auto_235578 ) ) ( not ( = ?auto_235580 ?auto_235583 ) ) ( not ( = ?auto_235581 ?auto_235582 ) ) ( not ( = ?auto_235581 ?auto_235584 ) ) ( not ( = ?auto_235581 ?auto_235588 ) ) ( not ( = ?auto_235578 ?auto_235583 ) ) ( not ( = ?auto_235578 ?auto_235585 ) ) ( not ( = ?auto_235583 ?auto_235585 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_235579 ?auto_235580 ?auto_235584 ?auto_235585 )
      ( GET-4IMAGE-VERIFY ?auto_235579 ?auto_235580 ?auto_235581 ?auto_235578 ?auto_235582 ?auto_235583 ?auto_235584 ?auto_235585 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_203791 - DIRECTION
      ?auto_203792 - MODE
      ?auto_203793 - DIRECTION
      ?auto_203790 - MODE
      ?auto_203794 - DIRECTION
      ?auto_203795 - MODE
      ?auto_203796 - DIRECTION
      ?auto_203797 - MODE
    )
    :vars
    (
      ?auto_203801 - INSTRUMENT
      ?auto_203802 - SATELLITE
      ?auto_203798 - DIRECTION
      ?auto_203799 - DIRECTION
      ?auto_203800 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_203801 ?auto_203802 ) ( SUPPORTS ?auto_203801 ?auto_203795 ) ( not ( = ?auto_203794 ?auto_203798 ) ) ( HAVE_IMAGE ?auto_203791 ?auto_203790 ) ( not ( = ?auto_203791 ?auto_203794 ) ) ( not ( = ?auto_203791 ?auto_203798 ) ) ( not ( = ?auto_203790 ?auto_203795 ) ) ( CALIBRATION_TARGET ?auto_203801 ?auto_203798 ) ( not ( = ?auto_203798 ?auto_203799 ) ) ( not ( = ?auto_203794 ?auto_203799 ) ) ( not ( = ?auto_203791 ?auto_203799 ) ) ( ON_BOARD ?auto_203800 ?auto_203802 ) ( POWER_ON ?auto_203800 ) ( not ( = ?auto_203801 ?auto_203800 ) ) ( POINTING ?auto_203802 ?auto_203798 ) ( HAVE_IMAGE ?auto_203791 ?auto_203792 ) ( HAVE_IMAGE ?auto_203793 ?auto_203790 ) ( HAVE_IMAGE ?auto_203796 ?auto_203797 ) ( not ( = ?auto_203791 ?auto_203793 ) ) ( not ( = ?auto_203791 ?auto_203796 ) ) ( not ( = ?auto_203792 ?auto_203790 ) ) ( not ( = ?auto_203792 ?auto_203795 ) ) ( not ( = ?auto_203792 ?auto_203797 ) ) ( not ( = ?auto_203793 ?auto_203794 ) ) ( not ( = ?auto_203793 ?auto_203796 ) ) ( not ( = ?auto_203793 ?auto_203798 ) ) ( not ( = ?auto_203793 ?auto_203799 ) ) ( not ( = ?auto_203790 ?auto_203797 ) ) ( not ( = ?auto_203794 ?auto_203796 ) ) ( not ( = ?auto_203795 ?auto_203797 ) ) ( not ( = ?auto_203796 ?auto_203798 ) ) ( not ( = ?auto_203796 ?auto_203799 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_203791 ?auto_203790 ?auto_203794 ?auto_203795 )
      ( GET-4IMAGE-VERIFY ?auto_203791 ?auto_203792 ?auto_203793 ?auto_203790 ?auto_203794 ?auto_203795 ?auto_203796 ?auto_203797 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_235879 - DIRECTION
      ?auto_235880 - MODE
      ?auto_235881 - DIRECTION
      ?auto_235878 - MODE
      ?auto_235882 - DIRECTION
      ?auto_235883 - MODE
      ?auto_235884 - DIRECTION
      ?auto_235885 - MODE
    )
    :vars
    (
      ?auto_235889 - INSTRUMENT
      ?auto_235886 - SATELLITE
      ?auto_235888 - DIRECTION
      ?auto_235887 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_235889 ?auto_235886 ) ( SUPPORTS ?auto_235889 ?auto_235878 ) ( not ( = ?auto_235881 ?auto_235888 ) ) ( HAVE_IMAGE ?auto_235879 ?auto_235885 ) ( not ( = ?auto_235879 ?auto_235881 ) ) ( not ( = ?auto_235879 ?auto_235888 ) ) ( not ( = ?auto_235885 ?auto_235878 ) ) ( CALIBRATION_TARGET ?auto_235889 ?auto_235888 ) ( not ( = ?auto_235888 ?auto_235882 ) ) ( not ( = ?auto_235881 ?auto_235882 ) ) ( not ( = ?auto_235879 ?auto_235882 ) ) ( ON_BOARD ?auto_235887 ?auto_235886 ) ( POWER_ON ?auto_235887 ) ( not ( = ?auto_235889 ?auto_235887 ) ) ( POINTING ?auto_235886 ?auto_235888 ) ( HAVE_IMAGE ?auto_235879 ?auto_235880 ) ( HAVE_IMAGE ?auto_235882 ?auto_235883 ) ( HAVE_IMAGE ?auto_235884 ?auto_235885 ) ( not ( = ?auto_235879 ?auto_235884 ) ) ( not ( = ?auto_235880 ?auto_235878 ) ) ( not ( = ?auto_235880 ?auto_235883 ) ) ( not ( = ?auto_235880 ?auto_235885 ) ) ( not ( = ?auto_235881 ?auto_235884 ) ) ( not ( = ?auto_235878 ?auto_235883 ) ) ( not ( = ?auto_235882 ?auto_235884 ) ) ( not ( = ?auto_235883 ?auto_235885 ) ) ( not ( = ?auto_235884 ?auto_235888 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_235879 ?auto_235885 ?auto_235881 ?auto_235878 )
      ( GET-4IMAGE-VERIFY ?auto_235879 ?auto_235880 ?auto_235881 ?auto_235878 ?auto_235882 ?auto_235883 ?auto_235884 ?auto_235885 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_237063 - DIRECTION
      ?auto_237064 - MODE
      ?auto_237065 - DIRECTION
      ?auto_237062 - MODE
      ?auto_237066 - DIRECTION
      ?auto_237067 - MODE
      ?auto_237068 - DIRECTION
      ?auto_237069 - MODE
    )
    :vars
    (
      ?auto_237073 - INSTRUMENT
      ?auto_237070 - SATELLITE
      ?auto_237072 - DIRECTION
      ?auto_237071 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_237073 ?auto_237070 ) ( SUPPORTS ?auto_237073 ?auto_237064 ) ( not ( = ?auto_237063 ?auto_237072 ) ) ( HAVE_IMAGE ?auto_237065 ?auto_237069 ) ( not ( = ?auto_237065 ?auto_237063 ) ) ( not ( = ?auto_237065 ?auto_237072 ) ) ( not ( = ?auto_237069 ?auto_237064 ) ) ( CALIBRATION_TARGET ?auto_237073 ?auto_237072 ) ( not ( = ?auto_237072 ?auto_237066 ) ) ( not ( = ?auto_237063 ?auto_237066 ) ) ( not ( = ?auto_237065 ?auto_237066 ) ) ( ON_BOARD ?auto_237071 ?auto_237070 ) ( POWER_ON ?auto_237071 ) ( not ( = ?auto_237073 ?auto_237071 ) ) ( POINTING ?auto_237070 ?auto_237072 ) ( HAVE_IMAGE ?auto_237065 ?auto_237062 ) ( HAVE_IMAGE ?auto_237066 ?auto_237067 ) ( HAVE_IMAGE ?auto_237068 ?auto_237069 ) ( not ( = ?auto_237063 ?auto_237068 ) ) ( not ( = ?auto_237064 ?auto_237062 ) ) ( not ( = ?auto_237064 ?auto_237067 ) ) ( not ( = ?auto_237065 ?auto_237068 ) ) ( not ( = ?auto_237062 ?auto_237067 ) ) ( not ( = ?auto_237062 ?auto_237069 ) ) ( not ( = ?auto_237066 ?auto_237068 ) ) ( not ( = ?auto_237067 ?auto_237069 ) ) ( not ( = ?auto_237068 ?auto_237072 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_237065 ?auto_237069 ?auto_237063 ?auto_237064 )
      ( GET-4IMAGE-VERIFY ?auto_237063 ?auto_237064 ?auto_237065 ?auto_237062 ?auto_237066 ?auto_237067 ?auto_237068 ?auto_237069 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_205722 - DIRECTION
      ?auto_205723 - MODE
      ?auto_205724 - DIRECTION
      ?auto_205721 - MODE
      ?auto_205725 - DIRECTION
      ?auto_205726 - MODE
    )
    :vars
    (
      ?auto_205727 - INSTRUMENT
      ?auto_205729 - SATELLITE
      ?auto_205728 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_205727 ?auto_205729 ) ( SUPPORTS ?auto_205727 ?auto_205726 ) ( POINTING ?auto_205729 ?auto_205728 ) ( not ( = ?auto_205725 ?auto_205728 ) ) ( HAVE_IMAGE ?auto_205722 ?auto_205721 ) ( not ( = ?auto_205722 ?auto_205725 ) ) ( not ( = ?auto_205722 ?auto_205728 ) ) ( not ( = ?auto_205721 ?auto_205726 ) ) ( CALIBRATION_TARGET ?auto_205727 ?auto_205728 ) ( POWER_AVAIL ?auto_205729 ) ( HAVE_IMAGE ?auto_205722 ?auto_205723 ) ( HAVE_IMAGE ?auto_205724 ?auto_205721 ) ( not ( = ?auto_205722 ?auto_205724 ) ) ( not ( = ?auto_205723 ?auto_205721 ) ) ( not ( = ?auto_205723 ?auto_205726 ) ) ( not ( = ?auto_205724 ?auto_205725 ) ) ( not ( = ?auto_205724 ?auto_205728 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_205722 ?auto_205721 ?auto_205725 ?auto_205726 )
      ( GET-3IMAGE-VERIFY ?auto_205722 ?auto_205723 ?auto_205724 ?auto_205721 ?auto_205725 ?auto_205726 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_205818 - DIRECTION
      ?auto_205819 - MODE
      ?auto_205820 - DIRECTION
      ?auto_205817 - MODE
      ?auto_205821 - DIRECTION
      ?auto_205822 - MODE
    )
    :vars
    (
      ?auto_205823 - INSTRUMENT
      ?auto_205825 - SATELLITE
      ?auto_205824 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_205823 ?auto_205825 ) ( SUPPORTS ?auto_205823 ?auto_205819 ) ( POINTING ?auto_205825 ?auto_205824 ) ( not ( = ?auto_205818 ?auto_205824 ) ) ( HAVE_IMAGE ?auto_205821 ?auto_205822 ) ( not ( = ?auto_205821 ?auto_205818 ) ) ( not ( = ?auto_205821 ?auto_205824 ) ) ( not ( = ?auto_205822 ?auto_205819 ) ) ( CALIBRATION_TARGET ?auto_205823 ?auto_205824 ) ( POWER_AVAIL ?auto_205825 ) ( HAVE_IMAGE ?auto_205820 ?auto_205817 ) ( not ( = ?auto_205818 ?auto_205820 ) ) ( not ( = ?auto_205819 ?auto_205817 ) ) ( not ( = ?auto_205820 ?auto_205821 ) ) ( not ( = ?auto_205820 ?auto_205824 ) ) ( not ( = ?auto_205817 ?auto_205822 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_205821 ?auto_205822 ?auto_205818 ?auto_205819 )
      ( GET-3IMAGE-VERIFY ?auto_205818 ?auto_205819 ?auto_205820 ?auto_205817 ?auto_205821 ?auto_205822 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_205907 - DIRECTION
      ?auto_205908 - MODE
      ?auto_205909 - DIRECTION
      ?auto_205906 - MODE
      ?auto_205910 - DIRECTION
      ?auto_205911 - MODE
      ?auto_205912 - DIRECTION
      ?auto_205913 - MODE
    )
    :vars
    (
      ?auto_205914 - INSTRUMENT
      ?auto_205916 - SATELLITE
      ?auto_205915 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_205914 ?auto_205916 ) ( SUPPORTS ?auto_205914 ?auto_205913 ) ( POINTING ?auto_205916 ?auto_205915 ) ( not ( = ?auto_205912 ?auto_205915 ) ) ( HAVE_IMAGE ?auto_205907 ?auto_205906 ) ( not ( = ?auto_205907 ?auto_205912 ) ) ( not ( = ?auto_205907 ?auto_205915 ) ) ( not ( = ?auto_205906 ?auto_205913 ) ) ( CALIBRATION_TARGET ?auto_205914 ?auto_205915 ) ( POWER_AVAIL ?auto_205916 ) ( HAVE_IMAGE ?auto_205907 ?auto_205908 ) ( HAVE_IMAGE ?auto_205909 ?auto_205906 ) ( HAVE_IMAGE ?auto_205910 ?auto_205911 ) ( not ( = ?auto_205907 ?auto_205909 ) ) ( not ( = ?auto_205907 ?auto_205910 ) ) ( not ( = ?auto_205908 ?auto_205906 ) ) ( not ( = ?auto_205908 ?auto_205911 ) ) ( not ( = ?auto_205908 ?auto_205913 ) ) ( not ( = ?auto_205909 ?auto_205910 ) ) ( not ( = ?auto_205909 ?auto_205912 ) ) ( not ( = ?auto_205909 ?auto_205915 ) ) ( not ( = ?auto_205906 ?auto_205911 ) ) ( not ( = ?auto_205910 ?auto_205912 ) ) ( not ( = ?auto_205910 ?auto_205915 ) ) ( not ( = ?auto_205911 ?auto_205913 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_205907 ?auto_205906 ?auto_205912 ?auto_205913 )
      ( GET-4IMAGE-VERIFY ?auto_205907 ?auto_205908 ?auto_205909 ?auto_205906 ?auto_205910 ?auto_205911 ?auto_205912 ?auto_205913 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_206017 - DIRECTION
      ?auto_206018 - MODE
      ?auto_206019 - DIRECTION
      ?auto_206016 - MODE
      ?auto_206020 - DIRECTION
      ?auto_206021 - MODE
      ?auto_206022 - DIRECTION
      ?auto_206023 - MODE
    )
    :vars
    (
      ?auto_206024 - INSTRUMENT
      ?auto_206026 - SATELLITE
      ?auto_206025 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_206024 ?auto_206026 ) ( SUPPORTS ?auto_206024 ?auto_206016 ) ( POINTING ?auto_206026 ?auto_206025 ) ( not ( = ?auto_206019 ?auto_206025 ) ) ( HAVE_IMAGE ?auto_206017 ?auto_206021 ) ( not ( = ?auto_206017 ?auto_206019 ) ) ( not ( = ?auto_206017 ?auto_206025 ) ) ( not ( = ?auto_206021 ?auto_206016 ) ) ( CALIBRATION_TARGET ?auto_206024 ?auto_206025 ) ( POWER_AVAIL ?auto_206026 ) ( HAVE_IMAGE ?auto_206017 ?auto_206018 ) ( HAVE_IMAGE ?auto_206020 ?auto_206021 ) ( HAVE_IMAGE ?auto_206022 ?auto_206023 ) ( not ( = ?auto_206017 ?auto_206020 ) ) ( not ( = ?auto_206017 ?auto_206022 ) ) ( not ( = ?auto_206018 ?auto_206016 ) ) ( not ( = ?auto_206018 ?auto_206021 ) ) ( not ( = ?auto_206018 ?auto_206023 ) ) ( not ( = ?auto_206019 ?auto_206020 ) ) ( not ( = ?auto_206019 ?auto_206022 ) ) ( not ( = ?auto_206016 ?auto_206023 ) ) ( not ( = ?auto_206020 ?auto_206022 ) ) ( not ( = ?auto_206020 ?auto_206025 ) ) ( not ( = ?auto_206021 ?auto_206023 ) ) ( not ( = ?auto_206022 ?auto_206025 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_206017 ?auto_206021 ?auto_206019 ?auto_206016 )
      ( GET-4IMAGE-VERIFY ?auto_206017 ?auto_206018 ?auto_206019 ?auto_206016 ?auto_206020 ?auto_206021 ?auto_206022 ?auto_206023 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_206339 - DIRECTION
      ?auto_206340 - MODE
      ?auto_206341 - DIRECTION
      ?auto_206338 - MODE
      ?auto_206342 - DIRECTION
      ?auto_206343 - MODE
      ?auto_206344 - DIRECTION
      ?auto_206345 - MODE
    )
    :vars
    (
      ?auto_206346 - INSTRUMENT
      ?auto_206348 - SATELLITE
      ?auto_206347 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_206346 ?auto_206348 ) ( SUPPORTS ?auto_206346 ?auto_206340 ) ( POINTING ?auto_206348 ?auto_206347 ) ( not ( = ?auto_206339 ?auto_206347 ) ) ( HAVE_IMAGE ?auto_206341 ?auto_206343 ) ( not ( = ?auto_206341 ?auto_206339 ) ) ( not ( = ?auto_206341 ?auto_206347 ) ) ( not ( = ?auto_206343 ?auto_206340 ) ) ( CALIBRATION_TARGET ?auto_206346 ?auto_206347 ) ( POWER_AVAIL ?auto_206348 ) ( HAVE_IMAGE ?auto_206341 ?auto_206338 ) ( HAVE_IMAGE ?auto_206342 ?auto_206343 ) ( HAVE_IMAGE ?auto_206344 ?auto_206345 ) ( not ( = ?auto_206339 ?auto_206342 ) ) ( not ( = ?auto_206339 ?auto_206344 ) ) ( not ( = ?auto_206340 ?auto_206338 ) ) ( not ( = ?auto_206340 ?auto_206345 ) ) ( not ( = ?auto_206341 ?auto_206342 ) ) ( not ( = ?auto_206341 ?auto_206344 ) ) ( not ( = ?auto_206338 ?auto_206343 ) ) ( not ( = ?auto_206338 ?auto_206345 ) ) ( not ( = ?auto_206342 ?auto_206344 ) ) ( not ( = ?auto_206342 ?auto_206347 ) ) ( not ( = ?auto_206343 ?auto_206345 ) ) ( not ( = ?auto_206344 ?auto_206347 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_206341 ?auto_206343 ?auto_206339 ?auto_206340 )
      ( GET-4IMAGE-VERIFY ?auto_206339 ?auto_206340 ?auto_206341 ?auto_206338 ?auto_206342 ?auto_206343 ?auto_206344 ?auto_206345 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_206689 - DIRECTION
      ?auto_206690 - MODE
      ?auto_206691 - DIRECTION
      ?auto_206688 - MODE
      ?auto_206692 - DIRECTION
      ?auto_206693 - MODE
    )
    :vars
    (
      ?auto_206695 - INSTRUMENT
      ?auto_206696 - SATELLITE
      ?auto_206694 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_206695 ?auto_206696 ) ( SUPPORTS ?auto_206695 ?auto_206693 ) ( not ( = ?auto_206692 ?auto_206694 ) ) ( HAVE_IMAGE ?auto_206689 ?auto_206688 ) ( not ( = ?auto_206689 ?auto_206692 ) ) ( not ( = ?auto_206689 ?auto_206694 ) ) ( not ( = ?auto_206688 ?auto_206693 ) ) ( CALIBRATION_TARGET ?auto_206695 ?auto_206694 ) ( POWER_AVAIL ?auto_206696 ) ( POINTING ?auto_206696 ?auto_206689 ) ( HAVE_IMAGE ?auto_206689 ?auto_206690 ) ( HAVE_IMAGE ?auto_206691 ?auto_206688 ) ( not ( = ?auto_206689 ?auto_206691 ) ) ( not ( = ?auto_206690 ?auto_206688 ) ) ( not ( = ?auto_206690 ?auto_206693 ) ) ( not ( = ?auto_206691 ?auto_206692 ) ) ( not ( = ?auto_206691 ?auto_206694 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_206689 ?auto_206688 ?auto_206692 ?auto_206693 )
      ( GET-3IMAGE-VERIFY ?auto_206689 ?auto_206690 ?auto_206691 ?auto_206688 ?auto_206692 ?auto_206693 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_206707 - DIRECTION
      ?auto_206708 - MODE
      ?auto_206709 - DIRECTION
      ?auto_206706 - MODE
      ?auto_206710 - DIRECTION
      ?auto_206711 - MODE
    )
    :vars
    (
      ?auto_206713 - INSTRUMENT
      ?auto_206714 - SATELLITE
      ?auto_206712 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_206713 ?auto_206714 ) ( SUPPORTS ?auto_206713 ?auto_206706 ) ( not ( = ?auto_206709 ?auto_206712 ) ) ( HAVE_IMAGE ?auto_206707 ?auto_206711 ) ( not ( = ?auto_206707 ?auto_206709 ) ) ( not ( = ?auto_206707 ?auto_206712 ) ) ( not ( = ?auto_206711 ?auto_206706 ) ) ( CALIBRATION_TARGET ?auto_206713 ?auto_206712 ) ( POWER_AVAIL ?auto_206714 ) ( POINTING ?auto_206714 ?auto_206707 ) ( HAVE_IMAGE ?auto_206707 ?auto_206708 ) ( HAVE_IMAGE ?auto_206710 ?auto_206711 ) ( not ( = ?auto_206707 ?auto_206710 ) ) ( not ( = ?auto_206708 ?auto_206706 ) ) ( not ( = ?auto_206708 ?auto_206711 ) ) ( not ( = ?auto_206709 ?auto_206710 ) ) ( not ( = ?auto_206710 ?auto_206712 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_206707 ?auto_206711 ?auto_206709 ?auto_206706 )
      ( GET-3IMAGE-VERIFY ?auto_206707 ?auto_206708 ?auto_206709 ?auto_206706 ?auto_206710 ?auto_206711 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_206785 - DIRECTION
      ?auto_206786 - MODE
      ?auto_206787 - DIRECTION
      ?auto_206784 - MODE
      ?auto_206788 - DIRECTION
      ?auto_206789 - MODE
    )
    :vars
    (
      ?auto_206791 - INSTRUMENT
      ?auto_206792 - SATELLITE
      ?auto_206790 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_206791 ?auto_206792 ) ( SUPPORTS ?auto_206791 ?auto_206786 ) ( not ( = ?auto_206785 ?auto_206790 ) ) ( HAVE_IMAGE ?auto_206787 ?auto_206789 ) ( not ( = ?auto_206787 ?auto_206785 ) ) ( not ( = ?auto_206787 ?auto_206790 ) ) ( not ( = ?auto_206789 ?auto_206786 ) ) ( CALIBRATION_TARGET ?auto_206791 ?auto_206790 ) ( POWER_AVAIL ?auto_206792 ) ( POINTING ?auto_206792 ?auto_206787 ) ( HAVE_IMAGE ?auto_206787 ?auto_206784 ) ( HAVE_IMAGE ?auto_206788 ?auto_206789 ) ( not ( = ?auto_206785 ?auto_206788 ) ) ( not ( = ?auto_206786 ?auto_206784 ) ) ( not ( = ?auto_206787 ?auto_206788 ) ) ( not ( = ?auto_206784 ?auto_206789 ) ) ( not ( = ?auto_206788 ?auto_206790 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_206787 ?auto_206789 ?auto_206785 ?auto_206786 )
      ( GET-3IMAGE-VERIFY ?auto_206785 ?auto_206786 ?auto_206787 ?auto_206784 ?auto_206788 ?auto_206789 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_206874 - DIRECTION
      ?auto_206875 - MODE
      ?auto_206876 - DIRECTION
      ?auto_206873 - MODE
      ?auto_206877 - DIRECTION
      ?auto_206878 - MODE
      ?auto_206879 - DIRECTION
      ?auto_206880 - MODE
    )
    :vars
    (
      ?auto_206882 - INSTRUMENT
      ?auto_206883 - SATELLITE
      ?auto_206881 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_206882 ?auto_206883 ) ( SUPPORTS ?auto_206882 ?auto_206880 ) ( not ( = ?auto_206879 ?auto_206881 ) ) ( HAVE_IMAGE ?auto_206874 ?auto_206873 ) ( not ( = ?auto_206874 ?auto_206879 ) ) ( not ( = ?auto_206874 ?auto_206881 ) ) ( not ( = ?auto_206873 ?auto_206880 ) ) ( CALIBRATION_TARGET ?auto_206882 ?auto_206881 ) ( POWER_AVAIL ?auto_206883 ) ( POINTING ?auto_206883 ?auto_206874 ) ( HAVE_IMAGE ?auto_206874 ?auto_206875 ) ( HAVE_IMAGE ?auto_206876 ?auto_206873 ) ( HAVE_IMAGE ?auto_206877 ?auto_206878 ) ( not ( = ?auto_206874 ?auto_206876 ) ) ( not ( = ?auto_206874 ?auto_206877 ) ) ( not ( = ?auto_206875 ?auto_206873 ) ) ( not ( = ?auto_206875 ?auto_206878 ) ) ( not ( = ?auto_206875 ?auto_206880 ) ) ( not ( = ?auto_206876 ?auto_206877 ) ) ( not ( = ?auto_206876 ?auto_206879 ) ) ( not ( = ?auto_206876 ?auto_206881 ) ) ( not ( = ?auto_206873 ?auto_206878 ) ) ( not ( = ?auto_206877 ?auto_206879 ) ) ( not ( = ?auto_206877 ?auto_206881 ) ) ( not ( = ?auto_206878 ?auto_206880 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_206874 ?auto_206873 ?auto_206879 ?auto_206880 )
      ( GET-4IMAGE-VERIFY ?auto_206874 ?auto_206875 ?auto_206876 ?auto_206873 ?auto_206877 ?auto_206878 ?auto_206879 ?auto_206880 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_206896 - DIRECTION
      ?auto_206897 - MODE
      ?auto_206898 - DIRECTION
      ?auto_206895 - MODE
      ?auto_206899 - DIRECTION
      ?auto_206900 - MODE
      ?auto_206901 - DIRECTION
      ?auto_206902 - MODE
    )
    :vars
    (
      ?auto_206904 - INSTRUMENT
      ?auto_206905 - SATELLITE
      ?auto_206903 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_206904 ?auto_206905 ) ( SUPPORTS ?auto_206904 ?auto_206900 ) ( not ( = ?auto_206899 ?auto_206903 ) ) ( HAVE_IMAGE ?auto_206896 ?auto_206902 ) ( not ( = ?auto_206896 ?auto_206899 ) ) ( not ( = ?auto_206896 ?auto_206903 ) ) ( not ( = ?auto_206902 ?auto_206900 ) ) ( CALIBRATION_TARGET ?auto_206904 ?auto_206903 ) ( POWER_AVAIL ?auto_206905 ) ( POINTING ?auto_206905 ?auto_206896 ) ( HAVE_IMAGE ?auto_206896 ?auto_206897 ) ( HAVE_IMAGE ?auto_206898 ?auto_206895 ) ( HAVE_IMAGE ?auto_206901 ?auto_206902 ) ( not ( = ?auto_206896 ?auto_206898 ) ) ( not ( = ?auto_206896 ?auto_206901 ) ) ( not ( = ?auto_206897 ?auto_206895 ) ) ( not ( = ?auto_206897 ?auto_206900 ) ) ( not ( = ?auto_206897 ?auto_206902 ) ) ( not ( = ?auto_206898 ?auto_206899 ) ) ( not ( = ?auto_206898 ?auto_206901 ) ) ( not ( = ?auto_206898 ?auto_206903 ) ) ( not ( = ?auto_206895 ?auto_206900 ) ) ( not ( = ?auto_206895 ?auto_206902 ) ) ( not ( = ?auto_206899 ?auto_206901 ) ) ( not ( = ?auto_206901 ?auto_206903 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_206896 ?auto_206902 ?auto_206899 ?auto_206900 )
      ( GET-4IMAGE-VERIFY ?auto_206896 ?auto_206897 ?auto_206898 ?auto_206895 ?auto_206899 ?auto_206900 ?auto_206901 ?auto_206902 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_206984 - DIRECTION
      ?auto_206985 - MODE
      ?auto_206986 - DIRECTION
      ?auto_206983 - MODE
      ?auto_206987 - DIRECTION
      ?auto_206988 - MODE
      ?auto_206989 - DIRECTION
      ?auto_206990 - MODE
    )
    :vars
    (
      ?auto_206992 - INSTRUMENT
      ?auto_206993 - SATELLITE
      ?auto_206991 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_206992 ?auto_206993 ) ( SUPPORTS ?auto_206992 ?auto_206983 ) ( not ( = ?auto_206986 ?auto_206991 ) ) ( HAVE_IMAGE ?auto_206989 ?auto_206985 ) ( not ( = ?auto_206989 ?auto_206986 ) ) ( not ( = ?auto_206989 ?auto_206991 ) ) ( not ( = ?auto_206985 ?auto_206983 ) ) ( CALIBRATION_TARGET ?auto_206992 ?auto_206991 ) ( POWER_AVAIL ?auto_206993 ) ( POINTING ?auto_206993 ?auto_206989 ) ( HAVE_IMAGE ?auto_206984 ?auto_206985 ) ( HAVE_IMAGE ?auto_206987 ?auto_206988 ) ( HAVE_IMAGE ?auto_206989 ?auto_206990 ) ( not ( = ?auto_206984 ?auto_206986 ) ) ( not ( = ?auto_206984 ?auto_206987 ) ) ( not ( = ?auto_206984 ?auto_206989 ) ) ( not ( = ?auto_206984 ?auto_206991 ) ) ( not ( = ?auto_206985 ?auto_206988 ) ) ( not ( = ?auto_206985 ?auto_206990 ) ) ( not ( = ?auto_206986 ?auto_206987 ) ) ( not ( = ?auto_206983 ?auto_206988 ) ) ( not ( = ?auto_206983 ?auto_206990 ) ) ( not ( = ?auto_206987 ?auto_206989 ) ) ( not ( = ?auto_206987 ?auto_206991 ) ) ( not ( = ?auto_206988 ?auto_206990 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_206989 ?auto_206985 ?auto_206986 ?auto_206983 )
      ( GET-4IMAGE-VERIFY ?auto_206984 ?auto_206985 ?auto_206986 ?auto_206983 ?auto_206987 ?auto_206988 ?auto_206989 ?auto_206990 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_207306 - DIRECTION
      ?auto_207307 - MODE
      ?auto_207308 - DIRECTION
      ?auto_207305 - MODE
      ?auto_207309 - DIRECTION
      ?auto_207310 - MODE
      ?auto_207311 - DIRECTION
      ?auto_207312 - MODE
    )
    :vars
    (
      ?auto_207314 - INSTRUMENT
      ?auto_207315 - SATELLITE
      ?auto_207313 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_207314 ?auto_207315 ) ( SUPPORTS ?auto_207314 ?auto_207307 ) ( not ( = ?auto_207306 ?auto_207313 ) ) ( HAVE_IMAGE ?auto_207309 ?auto_207312 ) ( not ( = ?auto_207309 ?auto_207306 ) ) ( not ( = ?auto_207309 ?auto_207313 ) ) ( not ( = ?auto_207312 ?auto_207307 ) ) ( CALIBRATION_TARGET ?auto_207314 ?auto_207313 ) ( POWER_AVAIL ?auto_207315 ) ( POINTING ?auto_207315 ?auto_207309 ) ( HAVE_IMAGE ?auto_207308 ?auto_207305 ) ( HAVE_IMAGE ?auto_207309 ?auto_207310 ) ( HAVE_IMAGE ?auto_207311 ?auto_207312 ) ( not ( = ?auto_207306 ?auto_207308 ) ) ( not ( = ?auto_207306 ?auto_207311 ) ) ( not ( = ?auto_207307 ?auto_207305 ) ) ( not ( = ?auto_207307 ?auto_207310 ) ) ( not ( = ?auto_207308 ?auto_207309 ) ) ( not ( = ?auto_207308 ?auto_207311 ) ) ( not ( = ?auto_207308 ?auto_207313 ) ) ( not ( = ?auto_207305 ?auto_207310 ) ) ( not ( = ?auto_207305 ?auto_207312 ) ) ( not ( = ?auto_207309 ?auto_207311 ) ) ( not ( = ?auto_207310 ?auto_207312 ) ) ( not ( = ?auto_207311 ?auto_207313 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_207309 ?auto_207312 ?auto_207306 ?auto_207307 )
      ( GET-4IMAGE-VERIFY ?auto_207306 ?auto_207307 ?auto_207308 ?auto_207305 ?auto_207309 ?auto_207310 ?auto_207311 ?auto_207312 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_207659 - DIRECTION
      ?auto_207660 - MODE
      ?auto_207661 - DIRECTION
      ?auto_207658 - MODE
      ?auto_207662 - DIRECTION
      ?auto_207663 - MODE
    )
    :vars
    (
      ?auto_207664 - INSTRUMENT
      ?auto_207667 - SATELLITE
      ?auto_207666 - DIRECTION
      ?auto_207665 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_207664 ?auto_207667 ) ( SUPPORTS ?auto_207664 ?auto_207663 ) ( not ( = ?auto_207662 ?auto_207666 ) ) ( HAVE_IMAGE ?auto_207659 ?auto_207658 ) ( not ( = ?auto_207659 ?auto_207662 ) ) ( not ( = ?auto_207659 ?auto_207666 ) ) ( not ( = ?auto_207658 ?auto_207663 ) ) ( CALIBRATION_TARGET ?auto_207664 ?auto_207666 ) ( POINTING ?auto_207667 ?auto_207659 ) ( ON_BOARD ?auto_207665 ?auto_207667 ) ( POWER_ON ?auto_207665 ) ( not ( = ?auto_207664 ?auto_207665 ) ) ( HAVE_IMAGE ?auto_207659 ?auto_207660 ) ( HAVE_IMAGE ?auto_207661 ?auto_207658 ) ( not ( = ?auto_207659 ?auto_207661 ) ) ( not ( = ?auto_207660 ?auto_207658 ) ) ( not ( = ?auto_207660 ?auto_207663 ) ) ( not ( = ?auto_207661 ?auto_207662 ) ) ( not ( = ?auto_207661 ?auto_207666 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_207659 ?auto_207658 ?auto_207662 ?auto_207663 )
      ( GET-3IMAGE-VERIFY ?auto_207659 ?auto_207660 ?auto_207661 ?auto_207658 ?auto_207662 ?auto_207663 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_207679 - DIRECTION
      ?auto_207680 - MODE
      ?auto_207681 - DIRECTION
      ?auto_207678 - MODE
      ?auto_207682 - DIRECTION
      ?auto_207683 - MODE
    )
    :vars
    (
      ?auto_207684 - INSTRUMENT
      ?auto_207687 - SATELLITE
      ?auto_207686 - DIRECTION
      ?auto_207685 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_207684 ?auto_207687 ) ( SUPPORTS ?auto_207684 ?auto_207678 ) ( not ( = ?auto_207681 ?auto_207686 ) ) ( HAVE_IMAGE ?auto_207679 ?auto_207683 ) ( not ( = ?auto_207679 ?auto_207681 ) ) ( not ( = ?auto_207679 ?auto_207686 ) ) ( not ( = ?auto_207683 ?auto_207678 ) ) ( CALIBRATION_TARGET ?auto_207684 ?auto_207686 ) ( POINTING ?auto_207687 ?auto_207679 ) ( ON_BOARD ?auto_207685 ?auto_207687 ) ( POWER_ON ?auto_207685 ) ( not ( = ?auto_207684 ?auto_207685 ) ) ( HAVE_IMAGE ?auto_207679 ?auto_207680 ) ( HAVE_IMAGE ?auto_207682 ?auto_207683 ) ( not ( = ?auto_207679 ?auto_207682 ) ) ( not ( = ?auto_207680 ?auto_207678 ) ) ( not ( = ?auto_207680 ?auto_207683 ) ) ( not ( = ?auto_207681 ?auto_207682 ) ) ( not ( = ?auto_207682 ?auto_207686 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_207679 ?auto_207683 ?auto_207681 ?auto_207678 )
      ( GET-3IMAGE-VERIFY ?auto_207679 ?auto_207680 ?auto_207681 ?auto_207678 ?auto_207682 ?auto_207683 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_207765 - DIRECTION
      ?auto_207766 - MODE
      ?auto_207767 - DIRECTION
      ?auto_207764 - MODE
      ?auto_207768 - DIRECTION
      ?auto_207769 - MODE
    )
    :vars
    (
      ?auto_207770 - INSTRUMENT
      ?auto_207773 - SATELLITE
      ?auto_207772 - DIRECTION
      ?auto_207771 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_207770 ?auto_207773 ) ( SUPPORTS ?auto_207770 ?auto_207766 ) ( not ( = ?auto_207765 ?auto_207772 ) ) ( HAVE_IMAGE ?auto_207767 ?auto_207769 ) ( not ( = ?auto_207767 ?auto_207765 ) ) ( not ( = ?auto_207767 ?auto_207772 ) ) ( not ( = ?auto_207769 ?auto_207766 ) ) ( CALIBRATION_TARGET ?auto_207770 ?auto_207772 ) ( POINTING ?auto_207773 ?auto_207767 ) ( ON_BOARD ?auto_207771 ?auto_207773 ) ( POWER_ON ?auto_207771 ) ( not ( = ?auto_207770 ?auto_207771 ) ) ( HAVE_IMAGE ?auto_207767 ?auto_207764 ) ( HAVE_IMAGE ?auto_207768 ?auto_207769 ) ( not ( = ?auto_207765 ?auto_207768 ) ) ( not ( = ?auto_207766 ?auto_207764 ) ) ( not ( = ?auto_207767 ?auto_207768 ) ) ( not ( = ?auto_207764 ?auto_207769 ) ) ( not ( = ?auto_207768 ?auto_207772 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_207767 ?auto_207769 ?auto_207765 ?auto_207766 )
      ( GET-3IMAGE-VERIFY ?auto_207765 ?auto_207766 ?auto_207767 ?auto_207764 ?auto_207768 ?auto_207769 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_207863 - DIRECTION
      ?auto_207864 - MODE
      ?auto_207865 - DIRECTION
      ?auto_207862 - MODE
      ?auto_207866 - DIRECTION
      ?auto_207867 - MODE
      ?auto_207868 - DIRECTION
      ?auto_207869 - MODE
    )
    :vars
    (
      ?auto_207870 - INSTRUMENT
      ?auto_207873 - SATELLITE
      ?auto_207872 - DIRECTION
      ?auto_207871 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_207870 ?auto_207873 ) ( SUPPORTS ?auto_207870 ?auto_207869 ) ( not ( = ?auto_207868 ?auto_207872 ) ) ( HAVE_IMAGE ?auto_207863 ?auto_207867 ) ( not ( = ?auto_207863 ?auto_207868 ) ) ( not ( = ?auto_207863 ?auto_207872 ) ) ( not ( = ?auto_207867 ?auto_207869 ) ) ( CALIBRATION_TARGET ?auto_207870 ?auto_207872 ) ( POINTING ?auto_207873 ?auto_207863 ) ( ON_BOARD ?auto_207871 ?auto_207873 ) ( POWER_ON ?auto_207871 ) ( not ( = ?auto_207870 ?auto_207871 ) ) ( HAVE_IMAGE ?auto_207863 ?auto_207864 ) ( HAVE_IMAGE ?auto_207865 ?auto_207862 ) ( HAVE_IMAGE ?auto_207866 ?auto_207867 ) ( not ( = ?auto_207863 ?auto_207865 ) ) ( not ( = ?auto_207863 ?auto_207866 ) ) ( not ( = ?auto_207864 ?auto_207862 ) ) ( not ( = ?auto_207864 ?auto_207867 ) ) ( not ( = ?auto_207864 ?auto_207869 ) ) ( not ( = ?auto_207865 ?auto_207866 ) ) ( not ( = ?auto_207865 ?auto_207868 ) ) ( not ( = ?auto_207865 ?auto_207872 ) ) ( not ( = ?auto_207862 ?auto_207867 ) ) ( not ( = ?auto_207862 ?auto_207869 ) ) ( not ( = ?auto_207866 ?auto_207868 ) ) ( not ( = ?auto_207866 ?auto_207872 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_207863 ?auto_207867 ?auto_207868 ?auto_207869 )
      ( GET-4IMAGE-VERIFY ?auto_207863 ?auto_207864 ?auto_207865 ?auto_207862 ?auto_207866 ?auto_207867 ?auto_207868 ?auto_207869 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_207887 - DIRECTION
      ?auto_207888 - MODE
      ?auto_207889 - DIRECTION
      ?auto_207886 - MODE
      ?auto_207890 - DIRECTION
      ?auto_207891 - MODE
      ?auto_207892 - DIRECTION
      ?auto_207893 - MODE
    )
    :vars
    (
      ?auto_207894 - INSTRUMENT
      ?auto_207897 - SATELLITE
      ?auto_207896 - DIRECTION
      ?auto_207895 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_207894 ?auto_207897 ) ( SUPPORTS ?auto_207894 ?auto_207891 ) ( not ( = ?auto_207890 ?auto_207896 ) ) ( HAVE_IMAGE ?auto_207887 ?auto_207886 ) ( not ( = ?auto_207887 ?auto_207890 ) ) ( not ( = ?auto_207887 ?auto_207896 ) ) ( not ( = ?auto_207886 ?auto_207891 ) ) ( CALIBRATION_TARGET ?auto_207894 ?auto_207896 ) ( POINTING ?auto_207897 ?auto_207887 ) ( ON_BOARD ?auto_207895 ?auto_207897 ) ( POWER_ON ?auto_207895 ) ( not ( = ?auto_207894 ?auto_207895 ) ) ( HAVE_IMAGE ?auto_207887 ?auto_207888 ) ( HAVE_IMAGE ?auto_207889 ?auto_207886 ) ( HAVE_IMAGE ?auto_207892 ?auto_207893 ) ( not ( = ?auto_207887 ?auto_207889 ) ) ( not ( = ?auto_207887 ?auto_207892 ) ) ( not ( = ?auto_207888 ?auto_207886 ) ) ( not ( = ?auto_207888 ?auto_207891 ) ) ( not ( = ?auto_207888 ?auto_207893 ) ) ( not ( = ?auto_207889 ?auto_207890 ) ) ( not ( = ?auto_207889 ?auto_207892 ) ) ( not ( = ?auto_207889 ?auto_207896 ) ) ( not ( = ?auto_207886 ?auto_207893 ) ) ( not ( = ?auto_207890 ?auto_207892 ) ) ( not ( = ?auto_207891 ?auto_207893 ) ) ( not ( = ?auto_207892 ?auto_207896 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_207887 ?auto_207886 ?auto_207890 ?auto_207891 )
      ( GET-4IMAGE-VERIFY ?auto_207887 ?auto_207888 ?auto_207889 ?auto_207886 ?auto_207890 ?auto_207891 ?auto_207892 ?auto_207893 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_207983 - DIRECTION
      ?auto_207984 - MODE
      ?auto_207985 - DIRECTION
      ?auto_207982 - MODE
      ?auto_207986 - DIRECTION
      ?auto_207987 - MODE
      ?auto_207988 - DIRECTION
      ?auto_207989 - MODE
    )
    :vars
    (
      ?auto_207990 - INSTRUMENT
      ?auto_207993 - SATELLITE
      ?auto_207992 - DIRECTION
      ?auto_207991 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_207990 ?auto_207993 ) ( SUPPORTS ?auto_207990 ?auto_207982 ) ( not ( = ?auto_207985 ?auto_207992 ) ) ( HAVE_IMAGE ?auto_207983 ?auto_207989 ) ( not ( = ?auto_207983 ?auto_207985 ) ) ( not ( = ?auto_207983 ?auto_207992 ) ) ( not ( = ?auto_207989 ?auto_207982 ) ) ( CALIBRATION_TARGET ?auto_207990 ?auto_207992 ) ( POINTING ?auto_207993 ?auto_207983 ) ( ON_BOARD ?auto_207991 ?auto_207993 ) ( POWER_ON ?auto_207991 ) ( not ( = ?auto_207990 ?auto_207991 ) ) ( HAVE_IMAGE ?auto_207983 ?auto_207984 ) ( HAVE_IMAGE ?auto_207986 ?auto_207987 ) ( HAVE_IMAGE ?auto_207988 ?auto_207989 ) ( not ( = ?auto_207983 ?auto_207986 ) ) ( not ( = ?auto_207983 ?auto_207988 ) ) ( not ( = ?auto_207984 ?auto_207982 ) ) ( not ( = ?auto_207984 ?auto_207987 ) ) ( not ( = ?auto_207984 ?auto_207989 ) ) ( not ( = ?auto_207985 ?auto_207986 ) ) ( not ( = ?auto_207985 ?auto_207988 ) ) ( not ( = ?auto_207982 ?auto_207987 ) ) ( not ( = ?auto_207986 ?auto_207988 ) ) ( not ( = ?auto_207986 ?auto_207992 ) ) ( not ( = ?auto_207987 ?auto_207989 ) ) ( not ( = ?auto_207988 ?auto_207992 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_207983 ?auto_207989 ?auto_207985 ?auto_207982 )
      ( GET-4IMAGE-VERIFY ?auto_207983 ?auto_207984 ?auto_207985 ?auto_207982 ?auto_207986 ?auto_207987 ?auto_207988 ?auto_207989 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_217499 - DIRECTION
      ?auto_217500 - MODE
      ?auto_217501 - DIRECTION
      ?auto_217498 - MODE
      ?auto_217502 - DIRECTION
      ?auto_217503 - MODE
    )
    :vars
    (
      ?auto_217504 - INSTRUMENT
      ?auto_217506 - SATELLITE
      ?auto_217505 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_217504 ) ( ON_BOARD ?auto_217504 ?auto_217506 ) ( SUPPORTS ?auto_217504 ?auto_217498 ) ( POWER_ON ?auto_217504 ) ( POINTING ?auto_217506 ?auto_217505 ) ( not ( = ?auto_217501 ?auto_217505 ) ) ( HAVE_IMAGE ?auto_217499 ?auto_217500 ) ( not ( = ?auto_217499 ?auto_217501 ) ) ( not ( = ?auto_217499 ?auto_217505 ) ) ( not ( = ?auto_217500 ?auto_217498 ) ) ( HAVE_IMAGE ?auto_217502 ?auto_217503 ) ( not ( = ?auto_217499 ?auto_217502 ) ) ( not ( = ?auto_217500 ?auto_217503 ) ) ( not ( = ?auto_217501 ?auto_217502 ) ) ( not ( = ?auto_217498 ?auto_217503 ) ) ( not ( = ?auto_217502 ?auto_217505 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_217499 ?auto_217500 ?auto_217501 ?auto_217498 )
      ( GET-3IMAGE-VERIFY ?auto_217499 ?auto_217500 ?auto_217501 ?auto_217498 ?auto_217502 ?auto_217503 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_218002 - DIRECTION
      ?auto_218003 - MODE
      ?auto_218004 - DIRECTION
      ?auto_218001 - MODE
      ?auto_218005 - DIRECTION
      ?auto_218006 - MODE
      ?auto_218007 - DIRECTION
      ?auto_218008 - MODE
    )
    :vars
    (
      ?auto_218009 - INSTRUMENT
      ?auto_218011 - SATELLITE
      ?auto_218010 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_218009 ) ( ON_BOARD ?auto_218009 ?auto_218011 ) ( SUPPORTS ?auto_218009 ?auto_218001 ) ( POWER_ON ?auto_218009 ) ( POINTING ?auto_218011 ?auto_218010 ) ( not ( = ?auto_218004 ?auto_218010 ) ) ( HAVE_IMAGE ?auto_218005 ?auto_218008 ) ( not ( = ?auto_218005 ?auto_218004 ) ) ( not ( = ?auto_218005 ?auto_218010 ) ) ( not ( = ?auto_218008 ?auto_218001 ) ) ( HAVE_IMAGE ?auto_218002 ?auto_218003 ) ( HAVE_IMAGE ?auto_218005 ?auto_218006 ) ( HAVE_IMAGE ?auto_218007 ?auto_218008 ) ( not ( = ?auto_218002 ?auto_218004 ) ) ( not ( = ?auto_218002 ?auto_218005 ) ) ( not ( = ?auto_218002 ?auto_218007 ) ) ( not ( = ?auto_218002 ?auto_218010 ) ) ( not ( = ?auto_218003 ?auto_218001 ) ) ( not ( = ?auto_218003 ?auto_218006 ) ) ( not ( = ?auto_218003 ?auto_218008 ) ) ( not ( = ?auto_218004 ?auto_218007 ) ) ( not ( = ?auto_218001 ?auto_218006 ) ) ( not ( = ?auto_218005 ?auto_218007 ) ) ( not ( = ?auto_218006 ?auto_218008 ) ) ( not ( = ?auto_218007 ?auto_218010 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_218005 ?auto_218008 ?auto_218004 ?auto_218001 )
      ( GET-4IMAGE-VERIFY ?auto_218002 ?auto_218003 ?auto_218004 ?auto_218001 ?auto_218005 ?auto_218006 ?auto_218007 ?auto_218008 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_218629 - DIRECTION
      ?auto_218630 - MODE
      ?auto_218631 - DIRECTION
      ?auto_218628 - MODE
      ?auto_218632 - DIRECTION
      ?auto_218633 - MODE
      ?auto_218634 - DIRECTION
      ?auto_218635 - MODE
    )
    :vars
    (
      ?auto_218636 - INSTRUMENT
      ?auto_218638 - SATELLITE
      ?auto_218637 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_218636 ) ( ON_BOARD ?auto_218636 ?auto_218638 ) ( SUPPORTS ?auto_218636 ?auto_218633 ) ( POWER_ON ?auto_218636 ) ( POINTING ?auto_218638 ?auto_218637 ) ( not ( = ?auto_218632 ?auto_218637 ) ) ( HAVE_IMAGE ?auto_218631 ?auto_218635 ) ( not ( = ?auto_218631 ?auto_218632 ) ) ( not ( = ?auto_218631 ?auto_218637 ) ) ( not ( = ?auto_218635 ?auto_218633 ) ) ( HAVE_IMAGE ?auto_218629 ?auto_218630 ) ( HAVE_IMAGE ?auto_218631 ?auto_218628 ) ( HAVE_IMAGE ?auto_218634 ?auto_218635 ) ( not ( = ?auto_218629 ?auto_218631 ) ) ( not ( = ?auto_218629 ?auto_218632 ) ) ( not ( = ?auto_218629 ?auto_218634 ) ) ( not ( = ?auto_218629 ?auto_218637 ) ) ( not ( = ?auto_218630 ?auto_218628 ) ) ( not ( = ?auto_218630 ?auto_218633 ) ) ( not ( = ?auto_218630 ?auto_218635 ) ) ( not ( = ?auto_218631 ?auto_218634 ) ) ( not ( = ?auto_218628 ?auto_218633 ) ) ( not ( = ?auto_218628 ?auto_218635 ) ) ( not ( = ?auto_218632 ?auto_218634 ) ) ( not ( = ?auto_218634 ?auto_218637 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_218631 ?auto_218635 ?auto_218632 ?auto_218633 )
      ( GET-4IMAGE-VERIFY ?auto_218629 ?auto_218630 ?auto_218631 ?auto_218628 ?auto_218632 ?auto_218633 ?auto_218634 ?auto_218635 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_219812 - DIRECTION
      ?auto_219813 - MODE
      ?auto_219814 - DIRECTION
      ?auto_219811 - MODE
      ?auto_219815 - DIRECTION
      ?auto_219816 - MODE
    )
    :vars
    (
      ?auto_219818 - INSTRUMENT
      ?auto_219819 - SATELLITE
      ?auto_219817 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_219818 ?auto_219819 ) ( SUPPORTS ?auto_219818 ?auto_219816 ) ( POWER_ON ?auto_219818 ) ( POINTING ?auto_219819 ?auto_219817 ) ( not ( = ?auto_219815 ?auto_219817 ) ) ( HAVE_IMAGE ?auto_219812 ?auto_219811 ) ( not ( = ?auto_219812 ?auto_219815 ) ) ( not ( = ?auto_219812 ?auto_219817 ) ) ( not ( = ?auto_219811 ?auto_219816 ) ) ( CALIBRATION_TARGET ?auto_219818 ?auto_219817 ) ( NOT_CALIBRATED ?auto_219818 ) ( HAVE_IMAGE ?auto_219812 ?auto_219813 ) ( HAVE_IMAGE ?auto_219814 ?auto_219811 ) ( not ( = ?auto_219812 ?auto_219814 ) ) ( not ( = ?auto_219813 ?auto_219811 ) ) ( not ( = ?auto_219813 ?auto_219816 ) ) ( not ( = ?auto_219814 ?auto_219815 ) ) ( not ( = ?auto_219814 ?auto_219817 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_219812 ?auto_219811 ?auto_219815 ?auto_219816 )
      ( GET-3IMAGE-VERIFY ?auto_219812 ?auto_219813 ?auto_219814 ?auto_219811 ?auto_219815 ?auto_219816 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_220754 - DIRECTION
      ?auto_220755 - MODE
      ?auto_220756 - DIRECTION
      ?auto_220753 - MODE
      ?auto_220757 - DIRECTION
      ?auto_220758 - MODE
      ?auto_220759 - DIRECTION
      ?auto_220760 - MODE
    )
    :vars
    (
      ?auto_220762 - INSTRUMENT
      ?auto_220763 - SATELLITE
      ?auto_220761 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_220762 ?auto_220763 ) ( SUPPORTS ?auto_220762 ?auto_220753 ) ( POWER_ON ?auto_220762 ) ( POINTING ?auto_220763 ?auto_220761 ) ( not ( = ?auto_220756 ?auto_220761 ) ) ( HAVE_IMAGE ?auto_220759 ?auto_220758 ) ( not ( = ?auto_220759 ?auto_220756 ) ) ( not ( = ?auto_220759 ?auto_220761 ) ) ( not ( = ?auto_220758 ?auto_220753 ) ) ( CALIBRATION_TARGET ?auto_220762 ?auto_220761 ) ( NOT_CALIBRATED ?auto_220762 ) ( HAVE_IMAGE ?auto_220754 ?auto_220755 ) ( HAVE_IMAGE ?auto_220757 ?auto_220758 ) ( HAVE_IMAGE ?auto_220759 ?auto_220760 ) ( not ( = ?auto_220754 ?auto_220756 ) ) ( not ( = ?auto_220754 ?auto_220757 ) ) ( not ( = ?auto_220754 ?auto_220759 ) ) ( not ( = ?auto_220754 ?auto_220761 ) ) ( not ( = ?auto_220755 ?auto_220753 ) ) ( not ( = ?auto_220755 ?auto_220758 ) ) ( not ( = ?auto_220755 ?auto_220760 ) ) ( not ( = ?auto_220756 ?auto_220757 ) ) ( not ( = ?auto_220753 ?auto_220760 ) ) ( not ( = ?auto_220757 ?auto_220759 ) ) ( not ( = ?auto_220757 ?auto_220761 ) ) ( not ( = ?auto_220758 ?auto_220760 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_220759 ?auto_220758 ?auto_220756 ?auto_220753 )
      ( GET-4IMAGE-VERIFY ?auto_220754 ?auto_220755 ?auto_220756 ?auto_220753 ?auto_220757 ?auto_220758 ?auto_220759 ?auto_220760 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_220972 - DIRECTION
      ?auto_220973 - MODE
      ?auto_220974 - DIRECTION
      ?auto_220971 - MODE
      ?auto_220975 - DIRECTION
      ?auto_220976 - MODE
      ?auto_220977 - DIRECTION
      ?auto_220978 - MODE
    )
    :vars
    (
      ?auto_220980 - INSTRUMENT
      ?auto_220981 - SATELLITE
      ?auto_220979 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_220980 ?auto_220981 ) ( SUPPORTS ?auto_220980 ?auto_220976 ) ( POWER_ON ?auto_220980 ) ( POINTING ?auto_220981 ?auto_220979 ) ( not ( = ?auto_220975 ?auto_220979 ) ) ( HAVE_IMAGE ?auto_220974 ?auto_220978 ) ( not ( = ?auto_220974 ?auto_220975 ) ) ( not ( = ?auto_220974 ?auto_220979 ) ) ( not ( = ?auto_220978 ?auto_220976 ) ) ( CALIBRATION_TARGET ?auto_220980 ?auto_220979 ) ( NOT_CALIBRATED ?auto_220980 ) ( HAVE_IMAGE ?auto_220972 ?auto_220973 ) ( HAVE_IMAGE ?auto_220974 ?auto_220971 ) ( HAVE_IMAGE ?auto_220977 ?auto_220978 ) ( not ( = ?auto_220972 ?auto_220974 ) ) ( not ( = ?auto_220972 ?auto_220975 ) ) ( not ( = ?auto_220972 ?auto_220977 ) ) ( not ( = ?auto_220972 ?auto_220979 ) ) ( not ( = ?auto_220973 ?auto_220971 ) ) ( not ( = ?auto_220973 ?auto_220976 ) ) ( not ( = ?auto_220973 ?auto_220978 ) ) ( not ( = ?auto_220974 ?auto_220977 ) ) ( not ( = ?auto_220971 ?auto_220976 ) ) ( not ( = ?auto_220971 ?auto_220978 ) ) ( not ( = ?auto_220975 ?auto_220977 ) ) ( not ( = ?auto_220977 ?auto_220979 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_220974 ?auto_220978 ?auto_220975 ?auto_220976 )
      ( GET-4IMAGE-VERIFY ?auto_220972 ?auto_220973 ?auto_220974 ?auto_220971 ?auto_220975 ?auto_220976 ?auto_220977 ?auto_220978 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_221454 - DIRECTION
      ?auto_221455 - MODE
      ?auto_221456 - DIRECTION
      ?auto_221453 - MODE
      ?auto_221457 - DIRECTION
      ?auto_221458 - MODE
      ?auto_221459 - DIRECTION
      ?auto_221460 - MODE
    )
    :vars
    (
      ?auto_221462 - INSTRUMENT
      ?auto_221463 - SATELLITE
      ?auto_221461 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_221462 ?auto_221463 ) ( SUPPORTS ?auto_221462 ?auto_221455 ) ( POWER_ON ?auto_221462 ) ( POINTING ?auto_221463 ?auto_221461 ) ( not ( = ?auto_221454 ?auto_221461 ) ) ( HAVE_IMAGE ?auto_221459 ?auto_221453 ) ( not ( = ?auto_221459 ?auto_221454 ) ) ( not ( = ?auto_221459 ?auto_221461 ) ) ( not ( = ?auto_221453 ?auto_221455 ) ) ( CALIBRATION_TARGET ?auto_221462 ?auto_221461 ) ( NOT_CALIBRATED ?auto_221462 ) ( HAVE_IMAGE ?auto_221456 ?auto_221453 ) ( HAVE_IMAGE ?auto_221457 ?auto_221458 ) ( HAVE_IMAGE ?auto_221459 ?auto_221460 ) ( not ( = ?auto_221454 ?auto_221456 ) ) ( not ( = ?auto_221454 ?auto_221457 ) ) ( not ( = ?auto_221455 ?auto_221458 ) ) ( not ( = ?auto_221455 ?auto_221460 ) ) ( not ( = ?auto_221456 ?auto_221457 ) ) ( not ( = ?auto_221456 ?auto_221459 ) ) ( not ( = ?auto_221456 ?auto_221461 ) ) ( not ( = ?auto_221453 ?auto_221458 ) ) ( not ( = ?auto_221453 ?auto_221460 ) ) ( not ( = ?auto_221457 ?auto_221459 ) ) ( not ( = ?auto_221457 ?auto_221461 ) ) ( not ( = ?auto_221458 ?auto_221460 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_221459 ?auto_221453 ?auto_221454 ?auto_221455 )
      ( GET-4IMAGE-VERIFY ?auto_221454 ?auto_221455 ?auto_221456 ?auto_221453 ?auto_221457 ?auto_221458 ?auto_221459 ?auto_221460 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_222155 - DIRECTION
      ?auto_222156 - MODE
      ?auto_222157 - DIRECTION
      ?auto_222154 - MODE
      ?auto_222158 - DIRECTION
      ?auto_222159 - MODE
    )
    :vars
    (
      ?auto_222161 - INSTRUMENT
      ?auto_222162 - SATELLITE
      ?auto_222160 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_222161 ?auto_222162 ) ( SUPPORTS ?auto_222161 ?auto_222159 ) ( POINTING ?auto_222162 ?auto_222160 ) ( not ( = ?auto_222158 ?auto_222160 ) ) ( HAVE_IMAGE ?auto_222157 ?auto_222154 ) ( not ( = ?auto_222157 ?auto_222158 ) ) ( not ( = ?auto_222157 ?auto_222160 ) ) ( not ( = ?auto_222154 ?auto_222159 ) ) ( CALIBRATION_TARGET ?auto_222161 ?auto_222160 ) ( POWER_AVAIL ?auto_222162 ) ( HAVE_IMAGE ?auto_222155 ?auto_222156 ) ( not ( = ?auto_222155 ?auto_222157 ) ) ( not ( = ?auto_222155 ?auto_222158 ) ) ( not ( = ?auto_222155 ?auto_222160 ) ) ( not ( = ?auto_222156 ?auto_222154 ) ) ( not ( = ?auto_222156 ?auto_222159 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_222157 ?auto_222154 ?auto_222158 ?auto_222159 )
      ( GET-3IMAGE-VERIFY ?auto_222155 ?auto_222156 ?auto_222157 ?auto_222154 ?auto_222158 ?auto_222159 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_222320 - DIRECTION
      ?auto_222321 - MODE
      ?auto_222322 - DIRECTION
      ?auto_222319 - MODE
      ?auto_222323 - DIRECTION
      ?auto_222324 - MODE
    )
    :vars
    (
      ?auto_222326 - INSTRUMENT
      ?auto_222327 - SATELLITE
      ?auto_222325 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_222326 ?auto_222327 ) ( SUPPORTS ?auto_222326 ?auto_222321 ) ( POINTING ?auto_222327 ?auto_222325 ) ( not ( = ?auto_222320 ?auto_222325 ) ) ( HAVE_IMAGE ?auto_222323 ?auto_222319 ) ( not ( = ?auto_222323 ?auto_222320 ) ) ( not ( = ?auto_222323 ?auto_222325 ) ) ( not ( = ?auto_222319 ?auto_222321 ) ) ( CALIBRATION_TARGET ?auto_222326 ?auto_222325 ) ( POWER_AVAIL ?auto_222327 ) ( HAVE_IMAGE ?auto_222322 ?auto_222319 ) ( HAVE_IMAGE ?auto_222323 ?auto_222324 ) ( not ( = ?auto_222320 ?auto_222322 ) ) ( not ( = ?auto_222321 ?auto_222324 ) ) ( not ( = ?auto_222322 ?auto_222323 ) ) ( not ( = ?auto_222322 ?auto_222325 ) ) ( not ( = ?auto_222319 ?auto_222324 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_222323 ?auto_222319 ?auto_222320 ?auto_222321 )
      ( GET-3IMAGE-VERIFY ?auto_222320 ?auto_222321 ?auto_222322 ?auto_222319 ?auto_222323 ?auto_222324 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_222852 - DIRECTION
      ?auto_222853 - MODE
      ?auto_222854 - DIRECTION
      ?auto_222851 - MODE
      ?auto_222855 - DIRECTION
      ?auto_222856 - MODE
      ?auto_222857 - DIRECTION
      ?auto_222858 - MODE
    )
    :vars
    (
      ?auto_222860 - INSTRUMENT
      ?auto_222861 - SATELLITE
      ?auto_222859 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_222860 ?auto_222861 ) ( SUPPORTS ?auto_222860 ?auto_222858 ) ( POINTING ?auto_222861 ?auto_222859 ) ( not ( = ?auto_222857 ?auto_222859 ) ) ( HAVE_IMAGE ?auto_222855 ?auto_222851 ) ( not ( = ?auto_222855 ?auto_222857 ) ) ( not ( = ?auto_222855 ?auto_222859 ) ) ( not ( = ?auto_222851 ?auto_222858 ) ) ( CALIBRATION_TARGET ?auto_222860 ?auto_222859 ) ( POWER_AVAIL ?auto_222861 ) ( HAVE_IMAGE ?auto_222852 ?auto_222853 ) ( HAVE_IMAGE ?auto_222854 ?auto_222851 ) ( HAVE_IMAGE ?auto_222855 ?auto_222856 ) ( not ( = ?auto_222852 ?auto_222854 ) ) ( not ( = ?auto_222852 ?auto_222855 ) ) ( not ( = ?auto_222852 ?auto_222857 ) ) ( not ( = ?auto_222852 ?auto_222859 ) ) ( not ( = ?auto_222853 ?auto_222851 ) ) ( not ( = ?auto_222853 ?auto_222856 ) ) ( not ( = ?auto_222853 ?auto_222858 ) ) ( not ( = ?auto_222854 ?auto_222855 ) ) ( not ( = ?auto_222854 ?auto_222857 ) ) ( not ( = ?auto_222854 ?auto_222859 ) ) ( not ( = ?auto_222851 ?auto_222856 ) ) ( not ( = ?auto_222856 ?auto_222858 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_222855 ?auto_222851 ?auto_222857 ?auto_222858 )
      ( GET-4IMAGE-VERIFY ?auto_222852 ?auto_222853 ?auto_222854 ?auto_222851 ?auto_222855 ?auto_222856 ?auto_222857 ?auto_222858 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_223518 - DIRECTION
      ?auto_223519 - MODE
      ?auto_223520 - DIRECTION
      ?auto_223517 - MODE
      ?auto_223521 - DIRECTION
      ?auto_223522 - MODE
      ?auto_223523 - DIRECTION
      ?auto_223524 - MODE
    )
    :vars
    (
      ?auto_223526 - INSTRUMENT
      ?auto_223527 - SATELLITE
      ?auto_223525 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_223526 ?auto_223527 ) ( SUPPORTS ?auto_223526 ?auto_223517 ) ( POINTING ?auto_223527 ?auto_223525 ) ( not ( = ?auto_223520 ?auto_223525 ) ) ( HAVE_IMAGE ?auto_223521 ?auto_223524 ) ( not ( = ?auto_223521 ?auto_223520 ) ) ( not ( = ?auto_223521 ?auto_223525 ) ) ( not ( = ?auto_223524 ?auto_223517 ) ) ( CALIBRATION_TARGET ?auto_223526 ?auto_223525 ) ( POWER_AVAIL ?auto_223527 ) ( HAVE_IMAGE ?auto_223518 ?auto_223519 ) ( HAVE_IMAGE ?auto_223521 ?auto_223522 ) ( HAVE_IMAGE ?auto_223523 ?auto_223524 ) ( not ( = ?auto_223518 ?auto_223520 ) ) ( not ( = ?auto_223518 ?auto_223521 ) ) ( not ( = ?auto_223518 ?auto_223523 ) ) ( not ( = ?auto_223518 ?auto_223525 ) ) ( not ( = ?auto_223519 ?auto_223517 ) ) ( not ( = ?auto_223519 ?auto_223522 ) ) ( not ( = ?auto_223519 ?auto_223524 ) ) ( not ( = ?auto_223520 ?auto_223523 ) ) ( not ( = ?auto_223517 ?auto_223522 ) ) ( not ( = ?auto_223521 ?auto_223523 ) ) ( not ( = ?auto_223522 ?auto_223524 ) ) ( not ( = ?auto_223523 ?auto_223525 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_223521 ?auto_223524 ?auto_223520 ?auto_223517 )
      ( GET-4IMAGE-VERIFY ?auto_223518 ?auto_223519 ?auto_223520 ?auto_223517 ?auto_223521 ?auto_223522 ?auto_223523 ?auto_223524 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_224506 - DIRECTION
      ?auto_224507 - MODE
      ?auto_224508 - DIRECTION
      ?auto_224505 - MODE
      ?auto_224509 - DIRECTION
      ?auto_224510 - MODE
    )
    :vars
    (
      ?auto_224514 - INSTRUMENT
      ?auto_224511 - SATELLITE
      ?auto_224513 - DIRECTION
      ?auto_224512 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_224514 ?auto_224511 ) ( SUPPORTS ?auto_224514 ?auto_224510 ) ( not ( = ?auto_224509 ?auto_224513 ) ) ( HAVE_IMAGE ?auto_224506 ?auto_224507 ) ( not ( = ?auto_224506 ?auto_224509 ) ) ( not ( = ?auto_224506 ?auto_224513 ) ) ( not ( = ?auto_224507 ?auto_224510 ) ) ( CALIBRATION_TARGET ?auto_224514 ?auto_224513 ) ( POWER_AVAIL ?auto_224511 ) ( POINTING ?auto_224511 ?auto_224512 ) ( not ( = ?auto_224513 ?auto_224512 ) ) ( not ( = ?auto_224509 ?auto_224512 ) ) ( not ( = ?auto_224506 ?auto_224512 ) ) ( HAVE_IMAGE ?auto_224508 ?auto_224505 ) ( not ( = ?auto_224506 ?auto_224508 ) ) ( not ( = ?auto_224507 ?auto_224505 ) ) ( not ( = ?auto_224508 ?auto_224509 ) ) ( not ( = ?auto_224508 ?auto_224513 ) ) ( not ( = ?auto_224508 ?auto_224512 ) ) ( not ( = ?auto_224505 ?auto_224510 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_224506 ?auto_224507 ?auto_224509 ?auto_224510 )
      ( GET-3IMAGE-VERIFY ?auto_224506 ?auto_224507 ?auto_224508 ?auto_224505 ?auto_224509 ?auto_224510 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_224531 - DIRECTION
      ?auto_224532 - MODE
      ?auto_224533 - DIRECTION
      ?auto_224530 - MODE
      ?auto_224534 - DIRECTION
      ?auto_224535 - MODE
    )
    :vars
    (
      ?auto_224539 - INSTRUMENT
      ?auto_224536 - SATELLITE
      ?auto_224538 - DIRECTION
      ?auto_224537 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_224539 ?auto_224536 ) ( SUPPORTS ?auto_224539 ?auto_224530 ) ( not ( = ?auto_224533 ?auto_224538 ) ) ( HAVE_IMAGE ?auto_224531 ?auto_224532 ) ( not ( = ?auto_224531 ?auto_224533 ) ) ( not ( = ?auto_224531 ?auto_224538 ) ) ( not ( = ?auto_224532 ?auto_224530 ) ) ( CALIBRATION_TARGET ?auto_224539 ?auto_224538 ) ( POWER_AVAIL ?auto_224536 ) ( POINTING ?auto_224536 ?auto_224537 ) ( not ( = ?auto_224538 ?auto_224537 ) ) ( not ( = ?auto_224533 ?auto_224537 ) ) ( not ( = ?auto_224531 ?auto_224537 ) ) ( HAVE_IMAGE ?auto_224534 ?auto_224535 ) ( not ( = ?auto_224531 ?auto_224534 ) ) ( not ( = ?auto_224532 ?auto_224535 ) ) ( not ( = ?auto_224533 ?auto_224534 ) ) ( not ( = ?auto_224530 ?auto_224535 ) ) ( not ( = ?auto_224534 ?auto_224538 ) ) ( not ( = ?auto_224534 ?auto_224537 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_224531 ?auto_224532 ?auto_224533 ?auto_224530 )
      ( GET-3IMAGE-VERIFY ?auto_224531 ?auto_224532 ?auto_224533 ?auto_224530 ?auto_224534 ?auto_224535 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_224572 - DIRECTION
      ?auto_224573 - MODE
      ?auto_224574 - DIRECTION
      ?auto_224571 - MODE
      ?auto_224575 - DIRECTION
      ?auto_224576 - MODE
    )
    :vars
    (
      ?auto_224581 - INSTRUMENT
      ?auto_224577 - SATELLITE
      ?auto_224580 - DIRECTION
      ?auto_224582 - DIRECTION
      ?auto_224579 - MODE
      ?auto_224578 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_224581 ?auto_224577 ) ( SUPPORTS ?auto_224581 ?auto_224576 ) ( not ( = ?auto_224575 ?auto_224580 ) ) ( HAVE_IMAGE ?auto_224582 ?auto_224579 ) ( not ( = ?auto_224582 ?auto_224575 ) ) ( not ( = ?auto_224582 ?auto_224580 ) ) ( not ( = ?auto_224579 ?auto_224576 ) ) ( CALIBRATION_TARGET ?auto_224581 ?auto_224580 ) ( POWER_AVAIL ?auto_224577 ) ( POINTING ?auto_224577 ?auto_224578 ) ( not ( = ?auto_224580 ?auto_224578 ) ) ( not ( = ?auto_224575 ?auto_224578 ) ) ( not ( = ?auto_224582 ?auto_224578 ) ) ( HAVE_IMAGE ?auto_224572 ?auto_224573 ) ( HAVE_IMAGE ?auto_224574 ?auto_224571 ) ( not ( = ?auto_224572 ?auto_224574 ) ) ( not ( = ?auto_224572 ?auto_224575 ) ) ( not ( = ?auto_224572 ?auto_224580 ) ) ( not ( = ?auto_224572 ?auto_224582 ) ) ( not ( = ?auto_224572 ?auto_224578 ) ) ( not ( = ?auto_224573 ?auto_224571 ) ) ( not ( = ?auto_224573 ?auto_224576 ) ) ( not ( = ?auto_224573 ?auto_224579 ) ) ( not ( = ?auto_224574 ?auto_224575 ) ) ( not ( = ?auto_224574 ?auto_224580 ) ) ( not ( = ?auto_224574 ?auto_224582 ) ) ( not ( = ?auto_224574 ?auto_224578 ) ) ( not ( = ?auto_224571 ?auto_224576 ) ) ( not ( = ?auto_224571 ?auto_224579 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_224582 ?auto_224579 ?auto_224575 ?auto_224576 )
      ( GET-3IMAGE-VERIFY ?auto_224572 ?auto_224573 ?auto_224574 ?auto_224571 ?auto_224575 ?auto_224576 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_224596 - DIRECTION
      ?auto_224597 - MODE
      ?auto_224598 - DIRECTION
      ?auto_224595 - MODE
      ?auto_224599 - DIRECTION
      ?auto_224600 - MODE
    )
    :vars
    (
      ?auto_224605 - INSTRUMENT
      ?auto_224601 - SATELLITE
      ?auto_224604 - DIRECTION
      ?auto_224606 - DIRECTION
      ?auto_224603 - MODE
      ?auto_224602 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_224605 ?auto_224601 ) ( SUPPORTS ?auto_224605 ?auto_224595 ) ( not ( = ?auto_224598 ?auto_224604 ) ) ( HAVE_IMAGE ?auto_224606 ?auto_224603 ) ( not ( = ?auto_224606 ?auto_224598 ) ) ( not ( = ?auto_224606 ?auto_224604 ) ) ( not ( = ?auto_224603 ?auto_224595 ) ) ( CALIBRATION_TARGET ?auto_224605 ?auto_224604 ) ( POWER_AVAIL ?auto_224601 ) ( POINTING ?auto_224601 ?auto_224602 ) ( not ( = ?auto_224604 ?auto_224602 ) ) ( not ( = ?auto_224598 ?auto_224602 ) ) ( not ( = ?auto_224606 ?auto_224602 ) ) ( HAVE_IMAGE ?auto_224596 ?auto_224597 ) ( HAVE_IMAGE ?auto_224599 ?auto_224600 ) ( not ( = ?auto_224596 ?auto_224598 ) ) ( not ( = ?auto_224596 ?auto_224599 ) ) ( not ( = ?auto_224596 ?auto_224604 ) ) ( not ( = ?auto_224596 ?auto_224606 ) ) ( not ( = ?auto_224596 ?auto_224602 ) ) ( not ( = ?auto_224597 ?auto_224595 ) ) ( not ( = ?auto_224597 ?auto_224600 ) ) ( not ( = ?auto_224597 ?auto_224603 ) ) ( not ( = ?auto_224598 ?auto_224599 ) ) ( not ( = ?auto_224595 ?auto_224600 ) ) ( not ( = ?auto_224599 ?auto_224604 ) ) ( not ( = ?auto_224599 ?auto_224606 ) ) ( not ( = ?auto_224599 ?auto_224602 ) ) ( not ( = ?auto_224600 ?auto_224603 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_224606 ?auto_224603 ?auto_224598 ?auto_224595 )
      ( GET-3IMAGE-VERIFY ?auto_224596 ?auto_224597 ?auto_224598 ?auto_224595 ?auto_224599 ?auto_224600 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_224641 - DIRECTION
      ?auto_224642 - MODE
      ?auto_224643 - DIRECTION
      ?auto_224640 - MODE
      ?auto_224644 - DIRECTION
      ?auto_224645 - MODE
    )
    :vars
    (
      ?auto_224649 - INSTRUMENT
      ?auto_224646 - SATELLITE
      ?auto_224648 - DIRECTION
      ?auto_224650 - DIRECTION
      ?auto_224647 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_224649 ?auto_224646 ) ( SUPPORTS ?auto_224649 ?auto_224645 ) ( not ( = ?auto_224644 ?auto_224648 ) ) ( HAVE_IMAGE ?auto_224650 ?auto_224647 ) ( not ( = ?auto_224650 ?auto_224644 ) ) ( not ( = ?auto_224650 ?auto_224648 ) ) ( not ( = ?auto_224647 ?auto_224645 ) ) ( CALIBRATION_TARGET ?auto_224649 ?auto_224648 ) ( POWER_AVAIL ?auto_224646 ) ( POINTING ?auto_224646 ?auto_224641 ) ( not ( = ?auto_224648 ?auto_224641 ) ) ( not ( = ?auto_224644 ?auto_224641 ) ) ( not ( = ?auto_224650 ?auto_224641 ) ) ( HAVE_IMAGE ?auto_224641 ?auto_224642 ) ( HAVE_IMAGE ?auto_224643 ?auto_224640 ) ( not ( = ?auto_224641 ?auto_224643 ) ) ( not ( = ?auto_224642 ?auto_224640 ) ) ( not ( = ?auto_224642 ?auto_224645 ) ) ( not ( = ?auto_224642 ?auto_224647 ) ) ( not ( = ?auto_224643 ?auto_224644 ) ) ( not ( = ?auto_224643 ?auto_224648 ) ) ( not ( = ?auto_224643 ?auto_224650 ) ) ( not ( = ?auto_224640 ?auto_224645 ) ) ( not ( = ?auto_224640 ?auto_224647 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_224650 ?auto_224647 ?auto_224644 ?auto_224645 )
      ( GET-3IMAGE-VERIFY ?auto_224641 ?auto_224642 ?auto_224643 ?auto_224640 ?auto_224644 ?auto_224645 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_224667 - DIRECTION
      ?auto_224668 - MODE
      ?auto_224669 - DIRECTION
      ?auto_224666 - MODE
      ?auto_224670 - DIRECTION
      ?auto_224671 - MODE
    )
    :vars
    (
      ?auto_224675 - INSTRUMENT
      ?auto_224672 - SATELLITE
      ?auto_224674 - DIRECTION
      ?auto_224676 - DIRECTION
      ?auto_224673 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_224675 ?auto_224672 ) ( SUPPORTS ?auto_224675 ?auto_224666 ) ( not ( = ?auto_224669 ?auto_224674 ) ) ( HAVE_IMAGE ?auto_224676 ?auto_224673 ) ( not ( = ?auto_224676 ?auto_224669 ) ) ( not ( = ?auto_224676 ?auto_224674 ) ) ( not ( = ?auto_224673 ?auto_224666 ) ) ( CALIBRATION_TARGET ?auto_224675 ?auto_224674 ) ( POWER_AVAIL ?auto_224672 ) ( POINTING ?auto_224672 ?auto_224670 ) ( not ( = ?auto_224674 ?auto_224670 ) ) ( not ( = ?auto_224669 ?auto_224670 ) ) ( not ( = ?auto_224676 ?auto_224670 ) ) ( HAVE_IMAGE ?auto_224667 ?auto_224668 ) ( HAVE_IMAGE ?auto_224670 ?auto_224671 ) ( not ( = ?auto_224667 ?auto_224669 ) ) ( not ( = ?auto_224667 ?auto_224670 ) ) ( not ( = ?auto_224667 ?auto_224674 ) ) ( not ( = ?auto_224667 ?auto_224676 ) ) ( not ( = ?auto_224668 ?auto_224666 ) ) ( not ( = ?auto_224668 ?auto_224671 ) ) ( not ( = ?auto_224668 ?auto_224673 ) ) ( not ( = ?auto_224666 ?auto_224671 ) ) ( not ( = ?auto_224671 ?auto_224673 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_224676 ?auto_224673 ?auto_224669 ?auto_224666 )
      ( GET-3IMAGE-VERIFY ?auto_224667 ?auto_224668 ?auto_224669 ?auto_224666 ?auto_224670 ?auto_224671 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_224689 - DIRECTION
      ?auto_224690 - MODE
      ?auto_224691 - DIRECTION
      ?auto_224688 - MODE
      ?auto_224692 - DIRECTION
      ?auto_224693 - MODE
    )
    :vars
    (
      ?auto_224697 - INSTRUMENT
      ?auto_224694 - SATELLITE
      ?auto_224696 - DIRECTION
      ?auto_224695 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_224697 ?auto_224694 ) ( SUPPORTS ?auto_224697 ?auto_224690 ) ( not ( = ?auto_224689 ?auto_224696 ) ) ( HAVE_IMAGE ?auto_224692 ?auto_224688 ) ( not ( = ?auto_224692 ?auto_224689 ) ) ( not ( = ?auto_224692 ?auto_224696 ) ) ( not ( = ?auto_224688 ?auto_224690 ) ) ( CALIBRATION_TARGET ?auto_224697 ?auto_224696 ) ( POWER_AVAIL ?auto_224694 ) ( POINTING ?auto_224694 ?auto_224695 ) ( not ( = ?auto_224696 ?auto_224695 ) ) ( not ( = ?auto_224689 ?auto_224695 ) ) ( not ( = ?auto_224692 ?auto_224695 ) ) ( HAVE_IMAGE ?auto_224691 ?auto_224688 ) ( HAVE_IMAGE ?auto_224692 ?auto_224693 ) ( not ( = ?auto_224689 ?auto_224691 ) ) ( not ( = ?auto_224690 ?auto_224693 ) ) ( not ( = ?auto_224691 ?auto_224692 ) ) ( not ( = ?auto_224691 ?auto_224696 ) ) ( not ( = ?auto_224691 ?auto_224695 ) ) ( not ( = ?auto_224688 ?auto_224693 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_224692 ?auto_224688 ?auto_224689 ?auto_224690 )
      ( GET-3IMAGE-VERIFY ?auto_224689 ?auto_224690 ?auto_224691 ?auto_224688 ?auto_224692 ?auto_224693 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_224699 - DIRECTION
      ?auto_224700 - MODE
      ?auto_224701 - DIRECTION
      ?auto_224698 - MODE
      ?auto_224702 - DIRECTION
      ?auto_224703 - MODE
    )
    :vars
    (
      ?auto_224707 - INSTRUMENT
      ?auto_224704 - SATELLITE
      ?auto_224706 - DIRECTION
      ?auto_224705 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_224707 ?auto_224704 ) ( SUPPORTS ?auto_224707 ?auto_224700 ) ( not ( = ?auto_224699 ?auto_224706 ) ) ( HAVE_IMAGE ?auto_224701 ?auto_224698 ) ( not ( = ?auto_224701 ?auto_224699 ) ) ( not ( = ?auto_224701 ?auto_224706 ) ) ( not ( = ?auto_224698 ?auto_224700 ) ) ( CALIBRATION_TARGET ?auto_224707 ?auto_224706 ) ( POWER_AVAIL ?auto_224704 ) ( POINTING ?auto_224704 ?auto_224705 ) ( not ( = ?auto_224706 ?auto_224705 ) ) ( not ( = ?auto_224699 ?auto_224705 ) ) ( not ( = ?auto_224701 ?auto_224705 ) ) ( HAVE_IMAGE ?auto_224702 ?auto_224703 ) ( not ( = ?auto_224699 ?auto_224702 ) ) ( not ( = ?auto_224700 ?auto_224703 ) ) ( not ( = ?auto_224701 ?auto_224702 ) ) ( not ( = ?auto_224698 ?auto_224703 ) ) ( not ( = ?auto_224702 ?auto_224706 ) ) ( not ( = ?auto_224702 ?auto_224705 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_224701 ?auto_224698 ?auto_224699 ?auto_224700 )
      ( GET-3IMAGE-VERIFY ?auto_224699 ?auto_224700 ?auto_224701 ?auto_224698 ?auto_224702 ?auto_224703 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_224734 - DIRECTION
      ?auto_224735 - MODE
      ?auto_224736 - DIRECTION
      ?auto_224733 - MODE
      ?auto_224737 - DIRECTION
      ?auto_224738 - MODE
    )
    :vars
    (
      ?auto_224743 - INSTRUMENT
      ?auto_224739 - SATELLITE
      ?auto_224742 - DIRECTION
      ?auto_224744 - DIRECTION
      ?auto_224741 - MODE
      ?auto_224740 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_224743 ?auto_224739 ) ( SUPPORTS ?auto_224743 ?auto_224735 ) ( not ( = ?auto_224734 ?auto_224742 ) ) ( HAVE_IMAGE ?auto_224744 ?auto_224741 ) ( not ( = ?auto_224744 ?auto_224734 ) ) ( not ( = ?auto_224744 ?auto_224742 ) ) ( not ( = ?auto_224741 ?auto_224735 ) ) ( CALIBRATION_TARGET ?auto_224743 ?auto_224742 ) ( POWER_AVAIL ?auto_224739 ) ( POINTING ?auto_224739 ?auto_224740 ) ( not ( = ?auto_224742 ?auto_224740 ) ) ( not ( = ?auto_224734 ?auto_224740 ) ) ( not ( = ?auto_224744 ?auto_224740 ) ) ( HAVE_IMAGE ?auto_224736 ?auto_224733 ) ( HAVE_IMAGE ?auto_224737 ?auto_224738 ) ( not ( = ?auto_224734 ?auto_224736 ) ) ( not ( = ?auto_224734 ?auto_224737 ) ) ( not ( = ?auto_224735 ?auto_224733 ) ) ( not ( = ?auto_224735 ?auto_224738 ) ) ( not ( = ?auto_224736 ?auto_224737 ) ) ( not ( = ?auto_224736 ?auto_224742 ) ) ( not ( = ?auto_224736 ?auto_224744 ) ) ( not ( = ?auto_224736 ?auto_224740 ) ) ( not ( = ?auto_224733 ?auto_224738 ) ) ( not ( = ?auto_224733 ?auto_224741 ) ) ( not ( = ?auto_224737 ?auto_224742 ) ) ( not ( = ?auto_224737 ?auto_224744 ) ) ( not ( = ?auto_224737 ?auto_224740 ) ) ( not ( = ?auto_224738 ?auto_224741 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_224744 ?auto_224741 ?auto_224734 ?auto_224735 )
      ( GET-3IMAGE-VERIFY ?auto_224734 ?auto_224735 ?auto_224736 ?auto_224733 ?auto_224737 ?auto_224738 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_224846 - DIRECTION
      ?auto_224847 - MODE
      ?auto_224848 - DIRECTION
      ?auto_224845 - MODE
      ?auto_224849 - DIRECTION
      ?auto_224850 - MODE
      ?auto_224851 - DIRECTION
      ?auto_224852 - MODE
    )
    :vars
    (
      ?auto_224856 - INSTRUMENT
      ?auto_224853 - SATELLITE
      ?auto_224855 - DIRECTION
      ?auto_224854 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_224856 ?auto_224853 ) ( SUPPORTS ?auto_224856 ?auto_224852 ) ( not ( = ?auto_224851 ?auto_224855 ) ) ( HAVE_IMAGE ?auto_224846 ?auto_224845 ) ( not ( = ?auto_224846 ?auto_224851 ) ) ( not ( = ?auto_224846 ?auto_224855 ) ) ( not ( = ?auto_224845 ?auto_224852 ) ) ( CALIBRATION_TARGET ?auto_224856 ?auto_224855 ) ( POWER_AVAIL ?auto_224853 ) ( POINTING ?auto_224853 ?auto_224854 ) ( not ( = ?auto_224855 ?auto_224854 ) ) ( not ( = ?auto_224851 ?auto_224854 ) ) ( not ( = ?auto_224846 ?auto_224854 ) ) ( HAVE_IMAGE ?auto_224846 ?auto_224847 ) ( HAVE_IMAGE ?auto_224848 ?auto_224845 ) ( HAVE_IMAGE ?auto_224849 ?auto_224850 ) ( not ( = ?auto_224846 ?auto_224848 ) ) ( not ( = ?auto_224846 ?auto_224849 ) ) ( not ( = ?auto_224847 ?auto_224845 ) ) ( not ( = ?auto_224847 ?auto_224850 ) ) ( not ( = ?auto_224847 ?auto_224852 ) ) ( not ( = ?auto_224848 ?auto_224849 ) ) ( not ( = ?auto_224848 ?auto_224851 ) ) ( not ( = ?auto_224848 ?auto_224855 ) ) ( not ( = ?auto_224848 ?auto_224854 ) ) ( not ( = ?auto_224845 ?auto_224850 ) ) ( not ( = ?auto_224849 ?auto_224851 ) ) ( not ( = ?auto_224849 ?auto_224855 ) ) ( not ( = ?auto_224849 ?auto_224854 ) ) ( not ( = ?auto_224850 ?auto_224852 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_224846 ?auto_224845 ?auto_224851 ?auto_224852 )
      ( GET-4IMAGE-VERIFY ?auto_224846 ?auto_224847 ?auto_224848 ?auto_224845 ?auto_224849 ?auto_224850 ?auto_224851 ?auto_224852 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_224858 - DIRECTION
      ?auto_224859 - MODE
      ?auto_224860 - DIRECTION
      ?auto_224857 - MODE
      ?auto_224861 - DIRECTION
      ?auto_224862 - MODE
      ?auto_224863 - DIRECTION
      ?auto_224864 - MODE
    )
    :vars
    (
      ?auto_224868 - INSTRUMENT
      ?auto_224865 - SATELLITE
      ?auto_224867 - DIRECTION
      ?auto_224866 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_224868 ?auto_224865 ) ( SUPPORTS ?auto_224868 ?auto_224864 ) ( not ( = ?auto_224863 ?auto_224867 ) ) ( HAVE_IMAGE ?auto_224860 ?auto_224859 ) ( not ( = ?auto_224860 ?auto_224863 ) ) ( not ( = ?auto_224860 ?auto_224867 ) ) ( not ( = ?auto_224859 ?auto_224864 ) ) ( CALIBRATION_TARGET ?auto_224868 ?auto_224867 ) ( POWER_AVAIL ?auto_224865 ) ( POINTING ?auto_224865 ?auto_224866 ) ( not ( = ?auto_224867 ?auto_224866 ) ) ( not ( = ?auto_224863 ?auto_224866 ) ) ( not ( = ?auto_224860 ?auto_224866 ) ) ( HAVE_IMAGE ?auto_224858 ?auto_224859 ) ( HAVE_IMAGE ?auto_224860 ?auto_224857 ) ( HAVE_IMAGE ?auto_224861 ?auto_224862 ) ( not ( = ?auto_224858 ?auto_224860 ) ) ( not ( = ?auto_224858 ?auto_224861 ) ) ( not ( = ?auto_224858 ?auto_224863 ) ) ( not ( = ?auto_224858 ?auto_224867 ) ) ( not ( = ?auto_224858 ?auto_224866 ) ) ( not ( = ?auto_224859 ?auto_224857 ) ) ( not ( = ?auto_224859 ?auto_224862 ) ) ( not ( = ?auto_224860 ?auto_224861 ) ) ( not ( = ?auto_224857 ?auto_224862 ) ) ( not ( = ?auto_224857 ?auto_224864 ) ) ( not ( = ?auto_224861 ?auto_224863 ) ) ( not ( = ?auto_224861 ?auto_224867 ) ) ( not ( = ?auto_224861 ?auto_224866 ) ) ( not ( = ?auto_224862 ?auto_224864 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_224860 ?auto_224859 ?auto_224863 ?auto_224864 )
      ( GET-4IMAGE-VERIFY ?auto_224858 ?auto_224859 ?auto_224860 ?auto_224857 ?auto_224861 ?auto_224862 ?auto_224863 ?auto_224864 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_224870 - DIRECTION
      ?auto_224871 - MODE
      ?auto_224872 - DIRECTION
      ?auto_224869 - MODE
      ?auto_224873 - DIRECTION
      ?auto_224874 - MODE
      ?auto_224875 - DIRECTION
      ?auto_224876 - MODE
    )
    :vars
    (
      ?auto_224879 - INSTRUMENT
      ?auto_224877 - SATELLITE
      ?auto_224878 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_224879 ?auto_224877 ) ( SUPPORTS ?auto_224879 ?auto_224876 ) ( not ( = ?auto_224875 ?auto_224878 ) ) ( HAVE_IMAGE ?auto_224872 ?auto_224871 ) ( not ( = ?auto_224872 ?auto_224875 ) ) ( not ( = ?auto_224872 ?auto_224878 ) ) ( not ( = ?auto_224871 ?auto_224876 ) ) ( CALIBRATION_TARGET ?auto_224879 ?auto_224878 ) ( POWER_AVAIL ?auto_224877 ) ( POINTING ?auto_224877 ?auto_224873 ) ( not ( = ?auto_224878 ?auto_224873 ) ) ( not ( = ?auto_224875 ?auto_224873 ) ) ( not ( = ?auto_224872 ?auto_224873 ) ) ( HAVE_IMAGE ?auto_224870 ?auto_224871 ) ( HAVE_IMAGE ?auto_224872 ?auto_224869 ) ( HAVE_IMAGE ?auto_224873 ?auto_224874 ) ( not ( = ?auto_224870 ?auto_224872 ) ) ( not ( = ?auto_224870 ?auto_224873 ) ) ( not ( = ?auto_224870 ?auto_224875 ) ) ( not ( = ?auto_224870 ?auto_224878 ) ) ( not ( = ?auto_224871 ?auto_224869 ) ) ( not ( = ?auto_224871 ?auto_224874 ) ) ( not ( = ?auto_224869 ?auto_224874 ) ) ( not ( = ?auto_224869 ?auto_224876 ) ) ( not ( = ?auto_224874 ?auto_224876 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_224872 ?auto_224871 ?auto_224875 ?auto_224876 )
      ( GET-4IMAGE-VERIFY ?auto_224870 ?auto_224871 ?auto_224872 ?auto_224869 ?auto_224873 ?auto_224874 ?auto_224875 ?auto_224876 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_224881 - DIRECTION
      ?auto_224882 - MODE
      ?auto_224883 - DIRECTION
      ?auto_224880 - MODE
      ?auto_224884 - DIRECTION
      ?auto_224885 - MODE
      ?auto_224886 - DIRECTION
      ?auto_224887 - MODE
    )
    :vars
    (
      ?auto_224891 - INSTRUMENT
      ?auto_224888 - SATELLITE
      ?auto_224890 - DIRECTION
      ?auto_224889 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_224891 ?auto_224888 ) ( SUPPORTS ?auto_224891 ?auto_224885 ) ( not ( = ?auto_224884 ?auto_224890 ) ) ( HAVE_IMAGE ?auto_224881 ?auto_224887 ) ( not ( = ?auto_224881 ?auto_224884 ) ) ( not ( = ?auto_224881 ?auto_224890 ) ) ( not ( = ?auto_224887 ?auto_224885 ) ) ( CALIBRATION_TARGET ?auto_224891 ?auto_224890 ) ( POWER_AVAIL ?auto_224888 ) ( POINTING ?auto_224888 ?auto_224889 ) ( not ( = ?auto_224890 ?auto_224889 ) ) ( not ( = ?auto_224884 ?auto_224889 ) ) ( not ( = ?auto_224881 ?auto_224889 ) ) ( HAVE_IMAGE ?auto_224881 ?auto_224882 ) ( HAVE_IMAGE ?auto_224883 ?auto_224880 ) ( HAVE_IMAGE ?auto_224886 ?auto_224887 ) ( not ( = ?auto_224881 ?auto_224883 ) ) ( not ( = ?auto_224881 ?auto_224886 ) ) ( not ( = ?auto_224882 ?auto_224880 ) ) ( not ( = ?auto_224882 ?auto_224885 ) ) ( not ( = ?auto_224882 ?auto_224887 ) ) ( not ( = ?auto_224883 ?auto_224884 ) ) ( not ( = ?auto_224883 ?auto_224886 ) ) ( not ( = ?auto_224883 ?auto_224890 ) ) ( not ( = ?auto_224883 ?auto_224889 ) ) ( not ( = ?auto_224880 ?auto_224885 ) ) ( not ( = ?auto_224880 ?auto_224887 ) ) ( not ( = ?auto_224884 ?auto_224886 ) ) ( not ( = ?auto_224886 ?auto_224890 ) ) ( not ( = ?auto_224886 ?auto_224889 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_224881 ?auto_224887 ?auto_224884 ?auto_224885 )
      ( GET-4IMAGE-VERIFY ?auto_224881 ?auto_224882 ?auto_224883 ?auto_224880 ?auto_224884 ?auto_224885 ?auto_224886 ?auto_224887 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_224893 - DIRECTION
      ?auto_224894 - MODE
      ?auto_224895 - DIRECTION
      ?auto_224892 - MODE
      ?auto_224896 - DIRECTION
      ?auto_224897 - MODE
      ?auto_224898 - DIRECTION
      ?auto_224899 - MODE
    )
    :vars
    (
      ?auto_224903 - INSTRUMENT
      ?auto_224900 - SATELLITE
      ?auto_224902 - DIRECTION
      ?auto_224901 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_224903 ?auto_224900 ) ( SUPPORTS ?auto_224903 ?auto_224897 ) ( not ( = ?auto_224896 ?auto_224902 ) ) ( HAVE_IMAGE ?auto_224895 ?auto_224894 ) ( not ( = ?auto_224895 ?auto_224896 ) ) ( not ( = ?auto_224895 ?auto_224902 ) ) ( not ( = ?auto_224894 ?auto_224897 ) ) ( CALIBRATION_TARGET ?auto_224903 ?auto_224902 ) ( POWER_AVAIL ?auto_224900 ) ( POINTING ?auto_224900 ?auto_224901 ) ( not ( = ?auto_224902 ?auto_224901 ) ) ( not ( = ?auto_224896 ?auto_224901 ) ) ( not ( = ?auto_224895 ?auto_224901 ) ) ( HAVE_IMAGE ?auto_224893 ?auto_224894 ) ( HAVE_IMAGE ?auto_224895 ?auto_224892 ) ( HAVE_IMAGE ?auto_224898 ?auto_224899 ) ( not ( = ?auto_224893 ?auto_224895 ) ) ( not ( = ?auto_224893 ?auto_224896 ) ) ( not ( = ?auto_224893 ?auto_224898 ) ) ( not ( = ?auto_224893 ?auto_224902 ) ) ( not ( = ?auto_224893 ?auto_224901 ) ) ( not ( = ?auto_224894 ?auto_224892 ) ) ( not ( = ?auto_224894 ?auto_224899 ) ) ( not ( = ?auto_224895 ?auto_224898 ) ) ( not ( = ?auto_224892 ?auto_224897 ) ) ( not ( = ?auto_224892 ?auto_224899 ) ) ( not ( = ?auto_224896 ?auto_224898 ) ) ( not ( = ?auto_224897 ?auto_224899 ) ) ( not ( = ?auto_224898 ?auto_224902 ) ) ( not ( = ?auto_224898 ?auto_224901 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_224895 ?auto_224894 ?auto_224896 ?auto_224897 )
      ( GET-4IMAGE-VERIFY ?auto_224893 ?auto_224894 ?auto_224895 ?auto_224892 ?auto_224896 ?auto_224897 ?auto_224898 ?auto_224899 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_224928 - DIRECTION
      ?auto_224929 - MODE
      ?auto_224930 - DIRECTION
      ?auto_224927 - MODE
      ?auto_224931 - DIRECTION
      ?auto_224932 - MODE
      ?auto_224933 - DIRECTION
      ?auto_224934 - MODE
    )
    :vars
    (
      ?auto_224938 - INSTRUMENT
      ?auto_224935 - SATELLITE
      ?auto_224937 - DIRECTION
      ?auto_224936 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_224938 ?auto_224935 ) ( SUPPORTS ?auto_224938 ?auto_224934 ) ( not ( = ?auto_224933 ?auto_224937 ) ) ( HAVE_IMAGE ?auto_224928 ?auto_224929 ) ( not ( = ?auto_224928 ?auto_224933 ) ) ( not ( = ?auto_224928 ?auto_224937 ) ) ( not ( = ?auto_224929 ?auto_224934 ) ) ( CALIBRATION_TARGET ?auto_224938 ?auto_224937 ) ( POWER_AVAIL ?auto_224935 ) ( POINTING ?auto_224935 ?auto_224936 ) ( not ( = ?auto_224937 ?auto_224936 ) ) ( not ( = ?auto_224933 ?auto_224936 ) ) ( not ( = ?auto_224928 ?auto_224936 ) ) ( HAVE_IMAGE ?auto_224930 ?auto_224927 ) ( HAVE_IMAGE ?auto_224931 ?auto_224932 ) ( not ( = ?auto_224928 ?auto_224930 ) ) ( not ( = ?auto_224928 ?auto_224931 ) ) ( not ( = ?auto_224929 ?auto_224927 ) ) ( not ( = ?auto_224929 ?auto_224932 ) ) ( not ( = ?auto_224930 ?auto_224931 ) ) ( not ( = ?auto_224930 ?auto_224933 ) ) ( not ( = ?auto_224930 ?auto_224937 ) ) ( not ( = ?auto_224930 ?auto_224936 ) ) ( not ( = ?auto_224927 ?auto_224932 ) ) ( not ( = ?auto_224927 ?auto_224934 ) ) ( not ( = ?auto_224931 ?auto_224933 ) ) ( not ( = ?auto_224931 ?auto_224937 ) ) ( not ( = ?auto_224931 ?auto_224936 ) ) ( not ( = ?auto_224932 ?auto_224934 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_224928 ?auto_224929 ?auto_224933 ?auto_224934 )
      ( GET-4IMAGE-VERIFY ?auto_224928 ?auto_224929 ?auto_224930 ?auto_224927 ?auto_224931 ?auto_224932 ?auto_224933 ?auto_224934 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_224975 - DIRECTION
      ?auto_224976 - MODE
      ?auto_224977 - DIRECTION
      ?auto_224974 - MODE
      ?auto_224978 - DIRECTION
      ?auto_224979 - MODE
      ?auto_224980 - DIRECTION
      ?auto_224981 - MODE
    )
    :vars
    (
      ?auto_224985 - INSTRUMENT
      ?auto_224982 - SATELLITE
      ?auto_224984 - DIRECTION
      ?auto_224983 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_224985 ?auto_224982 ) ( SUPPORTS ?auto_224985 ?auto_224979 ) ( not ( = ?auto_224978 ?auto_224984 ) ) ( HAVE_IMAGE ?auto_224975 ?auto_224976 ) ( not ( = ?auto_224975 ?auto_224978 ) ) ( not ( = ?auto_224975 ?auto_224984 ) ) ( not ( = ?auto_224976 ?auto_224979 ) ) ( CALIBRATION_TARGET ?auto_224985 ?auto_224984 ) ( POWER_AVAIL ?auto_224982 ) ( POINTING ?auto_224982 ?auto_224983 ) ( not ( = ?auto_224984 ?auto_224983 ) ) ( not ( = ?auto_224978 ?auto_224983 ) ) ( not ( = ?auto_224975 ?auto_224983 ) ) ( HAVE_IMAGE ?auto_224977 ?auto_224974 ) ( HAVE_IMAGE ?auto_224980 ?auto_224981 ) ( not ( = ?auto_224975 ?auto_224977 ) ) ( not ( = ?auto_224975 ?auto_224980 ) ) ( not ( = ?auto_224976 ?auto_224974 ) ) ( not ( = ?auto_224976 ?auto_224981 ) ) ( not ( = ?auto_224977 ?auto_224978 ) ) ( not ( = ?auto_224977 ?auto_224980 ) ) ( not ( = ?auto_224977 ?auto_224984 ) ) ( not ( = ?auto_224977 ?auto_224983 ) ) ( not ( = ?auto_224974 ?auto_224979 ) ) ( not ( = ?auto_224974 ?auto_224981 ) ) ( not ( = ?auto_224978 ?auto_224980 ) ) ( not ( = ?auto_224979 ?auto_224981 ) ) ( not ( = ?auto_224980 ?auto_224984 ) ) ( not ( = ?auto_224980 ?auto_224983 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_224975 ?auto_224976 ?auto_224978 ?auto_224979 )
      ( GET-4IMAGE-VERIFY ?auto_224975 ?auto_224976 ?auto_224977 ?auto_224974 ?auto_224978 ?auto_224979 ?auto_224980 ?auto_224981 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_224987 - DIRECTION
      ?auto_224988 - MODE
      ?auto_224989 - DIRECTION
      ?auto_224986 - MODE
      ?auto_224990 - DIRECTION
      ?auto_224991 - MODE
      ?auto_224992 - DIRECTION
      ?auto_224993 - MODE
    )
    :vars
    (
      ?auto_224996 - INSTRUMENT
      ?auto_224994 - SATELLITE
      ?auto_224995 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_224996 ?auto_224994 ) ( SUPPORTS ?auto_224996 ?auto_224991 ) ( not ( = ?auto_224990 ?auto_224995 ) ) ( HAVE_IMAGE ?auto_224987 ?auto_224988 ) ( not ( = ?auto_224987 ?auto_224990 ) ) ( not ( = ?auto_224987 ?auto_224995 ) ) ( not ( = ?auto_224988 ?auto_224991 ) ) ( CALIBRATION_TARGET ?auto_224996 ?auto_224995 ) ( POWER_AVAIL ?auto_224994 ) ( POINTING ?auto_224994 ?auto_224992 ) ( not ( = ?auto_224995 ?auto_224992 ) ) ( not ( = ?auto_224990 ?auto_224992 ) ) ( not ( = ?auto_224987 ?auto_224992 ) ) ( HAVE_IMAGE ?auto_224989 ?auto_224986 ) ( HAVE_IMAGE ?auto_224992 ?auto_224993 ) ( not ( = ?auto_224987 ?auto_224989 ) ) ( not ( = ?auto_224988 ?auto_224986 ) ) ( not ( = ?auto_224988 ?auto_224993 ) ) ( not ( = ?auto_224989 ?auto_224990 ) ) ( not ( = ?auto_224989 ?auto_224992 ) ) ( not ( = ?auto_224989 ?auto_224995 ) ) ( not ( = ?auto_224986 ?auto_224991 ) ) ( not ( = ?auto_224986 ?auto_224993 ) ) ( not ( = ?auto_224991 ?auto_224993 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_224987 ?auto_224988 ?auto_224990 ?auto_224991 )
      ( GET-4IMAGE-VERIFY ?auto_224987 ?auto_224988 ?auto_224989 ?auto_224986 ?auto_224990 ?auto_224991 ?auto_224992 ?auto_224993 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_225084 - DIRECTION
      ?auto_225085 - MODE
      ?auto_225086 - DIRECTION
      ?auto_225083 - MODE
      ?auto_225087 - DIRECTION
      ?auto_225088 - MODE
      ?auto_225089 - DIRECTION
      ?auto_225090 - MODE
    )
    :vars
    (
      ?auto_225094 - INSTRUMENT
      ?auto_225091 - SATELLITE
      ?auto_225093 - DIRECTION
      ?auto_225092 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_225094 ?auto_225091 ) ( SUPPORTS ?auto_225094 ?auto_225083 ) ( not ( = ?auto_225086 ?auto_225093 ) ) ( HAVE_IMAGE ?auto_225087 ?auto_225085 ) ( not ( = ?auto_225087 ?auto_225086 ) ) ( not ( = ?auto_225087 ?auto_225093 ) ) ( not ( = ?auto_225085 ?auto_225083 ) ) ( CALIBRATION_TARGET ?auto_225094 ?auto_225093 ) ( POWER_AVAIL ?auto_225091 ) ( POINTING ?auto_225091 ?auto_225092 ) ( not ( = ?auto_225093 ?auto_225092 ) ) ( not ( = ?auto_225086 ?auto_225092 ) ) ( not ( = ?auto_225087 ?auto_225092 ) ) ( HAVE_IMAGE ?auto_225084 ?auto_225085 ) ( HAVE_IMAGE ?auto_225087 ?auto_225088 ) ( HAVE_IMAGE ?auto_225089 ?auto_225090 ) ( not ( = ?auto_225084 ?auto_225086 ) ) ( not ( = ?auto_225084 ?auto_225087 ) ) ( not ( = ?auto_225084 ?auto_225089 ) ) ( not ( = ?auto_225084 ?auto_225093 ) ) ( not ( = ?auto_225084 ?auto_225092 ) ) ( not ( = ?auto_225085 ?auto_225088 ) ) ( not ( = ?auto_225085 ?auto_225090 ) ) ( not ( = ?auto_225086 ?auto_225089 ) ) ( not ( = ?auto_225083 ?auto_225088 ) ) ( not ( = ?auto_225083 ?auto_225090 ) ) ( not ( = ?auto_225087 ?auto_225089 ) ) ( not ( = ?auto_225088 ?auto_225090 ) ) ( not ( = ?auto_225089 ?auto_225093 ) ) ( not ( = ?auto_225089 ?auto_225092 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_225087 ?auto_225085 ?auto_225086 ?auto_225083 )
      ( GET-4IMAGE-VERIFY ?auto_225084 ?auto_225085 ?auto_225086 ?auto_225083 ?auto_225087 ?auto_225088 ?auto_225089 ?auto_225090 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_225096 - DIRECTION
      ?auto_225097 - MODE
      ?auto_225098 - DIRECTION
      ?auto_225095 - MODE
      ?auto_225099 - DIRECTION
      ?auto_225100 - MODE
      ?auto_225101 - DIRECTION
      ?auto_225102 - MODE
    )
    :vars
    (
      ?auto_225106 - INSTRUMENT
      ?auto_225103 - SATELLITE
      ?auto_225105 - DIRECTION
      ?auto_225104 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_225106 ?auto_225103 ) ( SUPPORTS ?auto_225106 ?auto_225095 ) ( not ( = ?auto_225098 ?auto_225105 ) ) ( HAVE_IMAGE ?auto_225096 ?auto_225097 ) ( not ( = ?auto_225096 ?auto_225098 ) ) ( not ( = ?auto_225096 ?auto_225105 ) ) ( not ( = ?auto_225097 ?auto_225095 ) ) ( CALIBRATION_TARGET ?auto_225106 ?auto_225105 ) ( POWER_AVAIL ?auto_225103 ) ( POINTING ?auto_225103 ?auto_225104 ) ( not ( = ?auto_225105 ?auto_225104 ) ) ( not ( = ?auto_225098 ?auto_225104 ) ) ( not ( = ?auto_225096 ?auto_225104 ) ) ( HAVE_IMAGE ?auto_225099 ?auto_225100 ) ( HAVE_IMAGE ?auto_225101 ?auto_225102 ) ( not ( = ?auto_225096 ?auto_225099 ) ) ( not ( = ?auto_225096 ?auto_225101 ) ) ( not ( = ?auto_225097 ?auto_225100 ) ) ( not ( = ?auto_225097 ?auto_225102 ) ) ( not ( = ?auto_225098 ?auto_225099 ) ) ( not ( = ?auto_225098 ?auto_225101 ) ) ( not ( = ?auto_225095 ?auto_225100 ) ) ( not ( = ?auto_225095 ?auto_225102 ) ) ( not ( = ?auto_225099 ?auto_225101 ) ) ( not ( = ?auto_225099 ?auto_225105 ) ) ( not ( = ?auto_225099 ?auto_225104 ) ) ( not ( = ?auto_225100 ?auto_225102 ) ) ( not ( = ?auto_225101 ?auto_225105 ) ) ( not ( = ?auto_225101 ?auto_225104 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_225096 ?auto_225097 ?auto_225098 ?auto_225095 )
      ( GET-4IMAGE-VERIFY ?auto_225096 ?auto_225097 ?auto_225098 ?auto_225095 ?auto_225099 ?auto_225100 ?auto_225101 ?auto_225102 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_225131 - DIRECTION
      ?auto_225132 - MODE
      ?auto_225133 - DIRECTION
      ?auto_225130 - MODE
      ?auto_225134 - DIRECTION
      ?auto_225135 - MODE
      ?auto_225136 - DIRECTION
      ?auto_225137 - MODE
    )
    :vars
    (
      ?auto_225141 - INSTRUMENT
      ?auto_225138 - SATELLITE
      ?auto_225140 - DIRECTION
      ?auto_225139 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_225141 ?auto_225138 ) ( SUPPORTS ?auto_225141 ?auto_225130 ) ( not ( = ?auto_225133 ?auto_225140 ) ) ( HAVE_IMAGE ?auto_225136 ?auto_225137 ) ( not ( = ?auto_225136 ?auto_225133 ) ) ( not ( = ?auto_225136 ?auto_225140 ) ) ( not ( = ?auto_225137 ?auto_225130 ) ) ( CALIBRATION_TARGET ?auto_225141 ?auto_225140 ) ( POWER_AVAIL ?auto_225138 ) ( POINTING ?auto_225138 ?auto_225139 ) ( not ( = ?auto_225140 ?auto_225139 ) ) ( not ( = ?auto_225133 ?auto_225139 ) ) ( not ( = ?auto_225136 ?auto_225139 ) ) ( HAVE_IMAGE ?auto_225131 ?auto_225132 ) ( HAVE_IMAGE ?auto_225134 ?auto_225135 ) ( not ( = ?auto_225131 ?auto_225133 ) ) ( not ( = ?auto_225131 ?auto_225134 ) ) ( not ( = ?auto_225131 ?auto_225136 ) ) ( not ( = ?auto_225131 ?auto_225140 ) ) ( not ( = ?auto_225131 ?auto_225139 ) ) ( not ( = ?auto_225132 ?auto_225130 ) ) ( not ( = ?auto_225132 ?auto_225135 ) ) ( not ( = ?auto_225132 ?auto_225137 ) ) ( not ( = ?auto_225133 ?auto_225134 ) ) ( not ( = ?auto_225130 ?auto_225135 ) ) ( not ( = ?auto_225134 ?auto_225136 ) ) ( not ( = ?auto_225134 ?auto_225140 ) ) ( not ( = ?auto_225134 ?auto_225139 ) ) ( not ( = ?auto_225135 ?auto_225137 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_225136 ?auto_225137 ?auto_225133 ?auto_225130 )
      ( GET-4IMAGE-VERIFY ?auto_225131 ?auto_225132 ?auto_225133 ?auto_225130 ?auto_225134 ?auto_225135 ?auto_225136 ?auto_225137 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_225194 - DIRECTION
      ?auto_225195 - MODE
      ?auto_225196 - DIRECTION
      ?auto_225193 - MODE
      ?auto_225197 - DIRECTION
      ?auto_225198 - MODE
      ?auto_225199 - DIRECTION
      ?auto_225200 - MODE
    )
    :vars
    (
      ?auto_225203 - INSTRUMENT
      ?auto_225201 - SATELLITE
      ?auto_225202 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_225203 ?auto_225201 ) ( SUPPORTS ?auto_225203 ?auto_225193 ) ( not ( = ?auto_225196 ?auto_225202 ) ) ( HAVE_IMAGE ?auto_225194 ?auto_225195 ) ( not ( = ?auto_225194 ?auto_225196 ) ) ( not ( = ?auto_225194 ?auto_225202 ) ) ( not ( = ?auto_225195 ?auto_225193 ) ) ( CALIBRATION_TARGET ?auto_225203 ?auto_225202 ) ( POWER_AVAIL ?auto_225201 ) ( POINTING ?auto_225201 ?auto_225199 ) ( not ( = ?auto_225202 ?auto_225199 ) ) ( not ( = ?auto_225196 ?auto_225199 ) ) ( not ( = ?auto_225194 ?auto_225199 ) ) ( HAVE_IMAGE ?auto_225197 ?auto_225198 ) ( HAVE_IMAGE ?auto_225199 ?auto_225200 ) ( not ( = ?auto_225194 ?auto_225197 ) ) ( not ( = ?auto_225195 ?auto_225198 ) ) ( not ( = ?auto_225195 ?auto_225200 ) ) ( not ( = ?auto_225196 ?auto_225197 ) ) ( not ( = ?auto_225193 ?auto_225198 ) ) ( not ( = ?auto_225193 ?auto_225200 ) ) ( not ( = ?auto_225197 ?auto_225199 ) ) ( not ( = ?auto_225197 ?auto_225202 ) ) ( not ( = ?auto_225198 ?auto_225200 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_225194 ?auto_225195 ?auto_225196 ?auto_225193 )
      ( GET-4IMAGE-VERIFY ?auto_225194 ?auto_225195 ?auto_225196 ?auto_225193 ?auto_225197 ?auto_225198 ?auto_225199 ?auto_225200 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_225263 - DIRECTION
      ?auto_225264 - MODE
      ?auto_225265 - DIRECTION
      ?auto_225262 - MODE
      ?auto_225266 - DIRECTION
      ?auto_225267 - MODE
      ?auto_225268 - DIRECTION
      ?auto_225269 - MODE
    )
    :vars
    (
      ?auto_225273 - INSTRUMENT
      ?auto_225270 - SATELLITE
      ?auto_225272 - DIRECTION
      ?auto_225271 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_225273 ?auto_225270 ) ( SUPPORTS ?auto_225273 ?auto_225269 ) ( not ( = ?auto_225268 ?auto_225272 ) ) ( HAVE_IMAGE ?auto_225265 ?auto_225267 ) ( not ( = ?auto_225265 ?auto_225268 ) ) ( not ( = ?auto_225265 ?auto_225272 ) ) ( not ( = ?auto_225267 ?auto_225269 ) ) ( CALIBRATION_TARGET ?auto_225273 ?auto_225272 ) ( POWER_AVAIL ?auto_225270 ) ( POINTING ?auto_225270 ?auto_225271 ) ( not ( = ?auto_225272 ?auto_225271 ) ) ( not ( = ?auto_225268 ?auto_225271 ) ) ( not ( = ?auto_225265 ?auto_225271 ) ) ( HAVE_IMAGE ?auto_225263 ?auto_225264 ) ( HAVE_IMAGE ?auto_225265 ?auto_225262 ) ( HAVE_IMAGE ?auto_225266 ?auto_225267 ) ( not ( = ?auto_225263 ?auto_225265 ) ) ( not ( = ?auto_225263 ?auto_225266 ) ) ( not ( = ?auto_225263 ?auto_225268 ) ) ( not ( = ?auto_225263 ?auto_225272 ) ) ( not ( = ?auto_225263 ?auto_225271 ) ) ( not ( = ?auto_225264 ?auto_225262 ) ) ( not ( = ?auto_225264 ?auto_225267 ) ) ( not ( = ?auto_225264 ?auto_225269 ) ) ( not ( = ?auto_225265 ?auto_225266 ) ) ( not ( = ?auto_225262 ?auto_225267 ) ) ( not ( = ?auto_225262 ?auto_225269 ) ) ( not ( = ?auto_225266 ?auto_225268 ) ) ( not ( = ?auto_225266 ?auto_225272 ) ) ( not ( = ?auto_225266 ?auto_225271 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_225265 ?auto_225267 ?auto_225268 ?auto_225269 )
      ( GET-4IMAGE-VERIFY ?auto_225263 ?auto_225264 ?auto_225265 ?auto_225262 ?auto_225266 ?auto_225267 ?auto_225268 ?auto_225269 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_225307 - DIRECTION
      ?auto_225308 - MODE
      ?auto_225309 - DIRECTION
      ?auto_225306 - MODE
      ?auto_225310 - DIRECTION
      ?auto_225311 - MODE
      ?auto_225312 - DIRECTION
      ?auto_225313 - MODE
    )
    :vars
    (
      ?auto_225317 - INSTRUMENT
      ?auto_225314 - SATELLITE
      ?auto_225316 - DIRECTION
      ?auto_225315 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_225317 ?auto_225314 ) ( SUPPORTS ?auto_225317 ?auto_225311 ) ( not ( = ?auto_225310 ?auto_225316 ) ) ( HAVE_IMAGE ?auto_225309 ?auto_225306 ) ( not ( = ?auto_225309 ?auto_225310 ) ) ( not ( = ?auto_225309 ?auto_225316 ) ) ( not ( = ?auto_225306 ?auto_225311 ) ) ( CALIBRATION_TARGET ?auto_225317 ?auto_225316 ) ( POWER_AVAIL ?auto_225314 ) ( POINTING ?auto_225314 ?auto_225315 ) ( not ( = ?auto_225316 ?auto_225315 ) ) ( not ( = ?auto_225310 ?auto_225315 ) ) ( not ( = ?auto_225309 ?auto_225315 ) ) ( HAVE_IMAGE ?auto_225307 ?auto_225308 ) ( HAVE_IMAGE ?auto_225312 ?auto_225313 ) ( not ( = ?auto_225307 ?auto_225309 ) ) ( not ( = ?auto_225307 ?auto_225310 ) ) ( not ( = ?auto_225307 ?auto_225312 ) ) ( not ( = ?auto_225307 ?auto_225316 ) ) ( not ( = ?auto_225307 ?auto_225315 ) ) ( not ( = ?auto_225308 ?auto_225306 ) ) ( not ( = ?auto_225308 ?auto_225311 ) ) ( not ( = ?auto_225308 ?auto_225313 ) ) ( not ( = ?auto_225309 ?auto_225312 ) ) ( not ( = ?auto_225306 ?auto_225313 ) ) ( not ( = ?auto_225310 ?auto_225312 ) ) ( not ( = ?auto_225311 ?auto_225313 ) ) ( not ( = ?auto_225312 ?auto_225316 ) ) ( not ( = ?auto_225312 ?auto_225315 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_225309 ?auto_225306 ?auto_225310 ?auto_225311 )
      ( GET-4IMAGE-VERIFY ?auto_225307 ?auto_225308 ?auto_225309 ?auto_225306 ?auto_225310 ?auto_225311 ?auto_225312 ?auto_225313 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_225339 - DIRECTION
      ?auto_225340 - MODE
      ?auto_225341 - DIRECTION
      ?auto_225338 - MODE
      ?auto_225342 - DIRECTION
      ?auto_225343 - MODE
      ?auto_225344 - DIRECTION
      ?auto_225345 - MODE
    )
    :vars
    (
      ?auto_225349 - INSTRUMENT
      ?auto_225346 - SATELLITE
      ?auto_225348 - DIRECTION
      ?auto_225347 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_225349 ?auto_225346 ) ( SUPPORTS ?auto_225349 ?auto_225345 ) ( not ( = ?auto_225344 ?auto_225348 ) ) ( HAVE_IMAGE ?auto_225342 ?auto_225343 ) ( not ( = ?auto_225342 ?auto_225344 ) ) ( not ( = ?auto_225342 ?auto_225348 ) ) ( not ( = ?auto_225343 ?auto_225345 ) ) ( CALIBRATION_TARGET ?auto_225349 ?auto_225348 ) ( POWER_AVAIL ?auto_225346 ) ( POINTING ?auto_225346 ?auto_225347 ) ( not ( = ?auto_225348 ?auto_225347 ) ) ( not ( = ?auto_225344 ?auto_225347 ) ) ( not ( = ?auto_225342 ?auto_225347 ) ) ( HAVE_IMAGE ?auto_225339 ?auto_225340 ) ( HAVE_IMAGE ?auto_225341 ?auto_225338 ) ( not ( = ?auto_225339 ?auto_225341 ) ) ( not ( = ?auto_225339 ?auto_225342 ) ) ( not ( = ?auto_225339 ?auto_225344 ) ) ( not ( = ?auto_225339 ?auto_225348 ) ) ( not ( = ?auto_225339 ?auto_225347 ) ) ( not ( = ?auto_225340 ?auto_225338 ) ) ( not ( = ?auto_225340 ?auto_225343 ) ) ( not ( = ?auto_225340 ?auto_225345 ) ) ( not ( = ?auto_225341 ?auto_225342 ) ) ( not ( = ?auto_225341 ?auto_225344 ) ) ( not ( = ?auto_225341 ?auto_225348 ) ) ( not ( = ?auto_225341 ?auto_225347 ) ) ( not ( = ?auto_225338 ?auto_225343 ) ) ( not ( = ?auto_225338 ?auto_225345 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_225342 ?auto_225343 ?auto_225344 ?auto_225345 )
      ( GET-4IMAGE-VERIFY ?auto_225339 ?auto_225340 ?auto_225341 ?auto_225338 ?auto_225342 ?auto_225343 ?auto_225344 ?auto_225345 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_225351 - DIRECTION
      ?auto_225352 - MODE
      ?auto_225353 - DIRECTION
      ?auto_225350 - MODE
      ?auto_225354 - DIRECTION
      ?auto_225355 - MODE
      ?auto_225356 - DIRECTION
      ?auto_225357 - MODE
    )
    :vars
    (
      ?auto_225362 - INSTRUMENT
      ?auto_225358 - SATELLITE
      ?auto_225361 - DIRECTION
      ?auto_225363 - DIRECTION
      ?auto_225360 - MODE
      ?auto_225359 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_225362 ?auto_225358 ) ( SUPPORTS ?auto_225362 ?auto_225357 ) ( not ( = ?auto_225356 ?auto_225361 ) ) ( HAVE_IMAGE ?auto_225363 ?auto_225360 ) ( not ( = ?auto_225363 ?auto_225356 ) ) ( not ( = ?auto_225363 ?auto_225361 ) ) ( not ( = ?auto_225360 ?auto_225357 ) ) ( CALIBRATION_TARGET ?auto_225362 ?auto_225361 ) ( POWER_AVAIL ?auto_225358 ) ( POINTING ?auto_225358 ?auto_225359 ) ( not ( = ?auto_225361 ?auto_225359 ) ) ( not ( = ?auto_225356 ?auto_225359 ) ) ( not ( = ?auto_225363 ?auto_225359 ) ) ( HAVE_IMAGE ?auto_225351 ?auto_225352 ) ( HAVE_IMAGE ?auto_225353 ?auto_225350 ) ( HAVE_IMAGE ?auto_225354 ?auto_225355 ) ( not ( = ?auto_225351 ?auto_225353 ) ) ( not ( = ?auto_225351 ?auto_225354 ) ) ( not ( = ?auto_225351 ?auto_225356 ) ) ( not ( = ?auto_225351 ?auto_225361 ) ) ( not ( = ?auto_225351 ?auto_225363 ) ) ( not ( = ?auto_225351 ?auto_225359 ) ) ( not ( = ?auto_225352 ?auto_225350 ) ) ( not ( = ?auto_225352 ?auto_225355 ) ) ( not ( = ?auto_225352 ?auto_225357 ) ) ( not ( = ?auto_225352 ?auto_225360 ) ) ( not ( = ?auto_225353 ?auto_225354 ) ) ( not ( = ?auto_225353 ?auto_225356 ) ) ( not ( = ?auto_225353 ?auto_225361 ) ) ( not ( = ?auto_225353 ?auto_225363 ) ) ( not ( = ?auto_225353 ?auto_225359 ) ) ( not ( = ?auto_225350 ?auto_225355 ) ) ( not ( = ?auto_225350 ?auto_225357 ) ) ( not ( = ?auto_225350 ?auto_225360 ) ) ( not ( = ?auto_225354 ?auto_225356 ) ) ( not ( = ?auto_225354 ?auto_225361 ) ) ( not ( = ?auto_225354 ?auto_225363 ) ) ( not ( = ?auto_225354 ?auto_225359 ) ) ( not ( = ?auto_225355 ?auto_225357 ) ) ( not ( = ?auto_225355 ?auto_225360 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_225363 ?auto_225360 ?auto_225356 ?auto_225357 )
      ( GET-4IMAGE-VERIFY ?auto_225351 ?auto_225352 ?auto_225353 ?auto_225350 ?auto_225354 ?auto_225355 ?auto_225356 ?auto_225357 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_225378 - DIRECTION
      ?auto_225379 - MODE
      ?auto_225380 - DIRECTION
      ?auto_225377 - MODE
      ?auto_225381 - DIRECTION
      ?auto_225382 - MODE
      ?auto_225383 - DIRECTION
      ?auto_225384 - MODE
    )
    :vars
    (
      ?auto_225388 - INSTRUMENT
      ?auto_225385 - SATELLITE
      ?auto_225387 - DIRECTION
      ?auto_225386 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_225388 ?auto_225385 ) ( SUPPORTS ?auto_225388 ?auto_225382 ) ( not ( = ?auto_225381 ?auto_225387 ) ) ( HAVE_IMAGE ?auto_225383 ?auto_225384 ) ( not ( = ?auto_225383 ?auto_225381 ) ) ( not ( = ?auto_225383 ?auto_225387 ) ) ( not ( = ?auto_225384 ?auto_225382 ) ) ( CALIBRATION_TARGET ?auto_225388 ?auto_225387 ) ( POWER_AVAIL ?auto_225385 ) ( POINTING ?auto_225385 ?auto_225386 ) ( not ( = ?auto_225387 ?auto_225386 ) ) ( not ( = ?auto_225381 ?auto_225386 ) ) ( not ( = ?auto_225383 ?auto_225386 ) ) ( HAVE_IMAGE ?auto_225378 ?auto_225379 ) ( HAVE_IMAGE ?auto_225380 ?auto_225377 ) ( not ( = ?auto_225378 ?auto_225380 ) ) ( not ( = ?auto_225378 ?auto_225381 ) ) ( not ( = ?auto_225378 ?auto_225383 ) ) ( not ( = ?auto_225378 ?auto_225387 ) ) ( not ( = ?auto_225378 ?auto_225386 ) ) ( not ( = ?auto_225379 ?auto_225377 ) ) ( not ( = ?auto_225379 ?auto_225382 ) ) ( not ( = ?auto_225379 ?auto_225384 ) ) ( not ( = ?auto_225380 ?auto_225381 ) ) ( not ( = ?auto_225380 ?auto_225383 ) ) ( not ( = ?auto_225380 ?auto_225387 ) ) ( not ( = ?auto_225380 ?auto_225386 ) ) ( not ( = ?auto_225377 ?auto_225382 ) ) ( not ( = ?auto_225377 ?auto_225384 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_225383 ?auto_225384 ?auto_225381 ?auto_225382 )
      ( GET-4IMAGE-VERIFY ?auto_225378 ?auto_225379 ?auto_225380 ?auto_225377 ?auto_225381 ?auto_225382 ?auto_225383 ?auto_225384 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_225390 - DIRECTION
      ?auto_225391 - MODE
      ?auto_225392 - DIRECTION
      ?auto_225389 - MODE
      ?auto_225393 - DIRECTION
      ?auto_225394 - MODE
      ?auto_225395 - DIRECTION
      ?auto_225396 - MODE
    )
    :vars
    (
      ?auto_225401 - INSTRUMENT
      ?auto_225397 - SATELLITE
      ?auto_225400 - DIRECTION
      ?auto_225402 - DIRECTION
      ?auto_225399 - MODE
      ?auto_225398 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_225401 ?auto_225397 ) ( SUPPORTS ?auto_225401 ?auto_225394 ) ( not ( = ?auto_225393 ?auto_225400 ) ) ( HAVE_IMAGE ?auto_225402 ?auto_225399 ) ( not ( = ?auto_225402 ?auto_225393 ) ) ( not ( = ?auto_225402 ?auto_225400 ) ) ( not ( = ?auto_225399 ?auto_225394 ) ) ( CALIBRATION_TARGET ?auto_225401 ?auto_225400 ) ( POWER_AVAIL ?auto_225397 ) ( POINTING ?auto_225397 ?auto_225398 ) ( not ( = ?auto_225400 ?auto_225398 ) ) ( not ( = ?auto_225393 ?auto_225398 ) ) ( not ( = ?auto_225402 ?auto_225398 ) ) ( HAVE_IMAGE ?auto_225390 ?auto_225391 ) ( HAVE_IMAGE ?auto_225392 ?auto_225389 ) ( HAVE_IMAGE ?auto_225395 ?auto_225396 ) ( not ( = ?auto_225390 ?auto_225392 ) ) ( not ( = ?auto_225390 ?auto_225393 ) ) ( not ( = ?auto_225390 ?auto_225395 ) ) ( not ( = ?auto_225390 ?auto_225400 ) ) ( not ( = ?auto_225390 ?auto_225402 ) ) ( not ( = ?auto_225390 ?auto_225398 ) ) ( not ( = ?auto_225391 ?auto_225389 ) ) ( not ( = ?auto_225391 ?auto_225394 ) ) ( not ( = ?auto_225391 ?auto_225396 ) ) ( not ( = ?auto_225391 ?auto_225399 ) ) ( not ( = ?auto_225392 ?auto_225393 ) ) ( not ( = ?auto_225392 ?auto_225395 ) ) ( not ( = ?auto_225392 ?auto_225400 ) ) ( not ( = ?auto_225392 ?auto_225402 ) ) ( not ( = ?auto_225392 ?auto_225398 ) ) ( not ( = ?auto_225389 ?auto_225394 ) ) ( not ( = ?auto_225389 ?auto_225396 ) ) ( not ( = ?auto_225389 ?auto_225399 ) ) ( not ( = ?auto_225393 ?auto_225395 ) ) ( not ( = ?auto_225394 ?auto_225396 ) ) ( not ( = ?auto_225395 ?auto_225400 ) ) ( not ( = ?auto_225395 ?auto_225402 ) ) ( not ( = ?auto_225395 ?auto_225398 ) ) ( not ( = ?auto_225396 ?auto_225399 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_225402 ?auto_225399 ?auto_225393 ?auto_225394 )
      ( GET-4IMAGE-VERIFY ?auto_225390 ?auto_225391 ?auto_225392 ?auto_225389 ?auto_225393 ?auto_225394 ?auto_225395 ?auto_225396 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_225404 - DIRECTION
      ?auto_225405 - MODE
      ?auto_225406 - DIRECTION
      ?auto_225403 - MODE
      ?auto_225407 - DIRECTION
      ?auto_225408 - MODE
      ?auto_225409 - DIRECTION
      ?auto_225410 - MODE
    )
    :vars
    (
      ?auto_225414 - INSTRUMENT
      ?auto_225411 - SATELLITE
      ?auto_225413 - DIRECTION
      ?auto_225415 - DIRECTION
      ?auto_225412 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_225414 ?auto_225411 ) ( SUPPORTS ?auto_225414 ?auto_225408 ) ( not ( = ?auto_225407 ?auto_225413 ) ) ( HAVE_IMAGE ?auto_225415 ?auto_225412 ) ( not ( = ?auto_225415 ?auto_225407 ) ) ( not ( = ?auto_225415 ?auto_225413 ) ) ( not ( = ?auto_225412 ?auto_225408 ) ) ( CALIBRATION_TARGET ?auto_225414 ?auto_225413 ) ( POWER_AVAIL ?auto_225411 ) ( POINTING ?auto_225411 ?auto_225409 ) ( not ( = ?auto_225413 ?auto_225409 ) ) ( not ( = ?auto_225407 ?auto_225409 ) ) ( not ( = ?auto_225415 ?auto_225409 ) ) ( HAVE_IMAGE ?auto_225404 ?auto_225405 ) ( HAVE_IMAGE ?auto_225406 ?auto_225403 ) ( HAVE_IMAGE ?auto_225409 ?auto_225410 ) ( not ( = ?auto_225404 ?auto_225406 ) ) ( not ( = ?auto_225404 ?auto_225407 ) ) ( not ( = ?auto_225404 ?auto_225409 ) ) ( not ( = ?auto_225404 ?auto_225413 ) ) ( not ( = ?auto_225404 ?auto_225415 ) ) ( not ( = ?auto_225405 ?auto_225403 ) ) ( not ( = ?auto_225405 ?auto_225408 ) ) ( not ( = ?auto_225405 ?auto_225410 ) ) ( not ( = ?auto_225405 ?auto_225412 ) ) ( not ( = ?auto_225406 ?auto_225407 ) ) ( not ( = ?auto_225406 ?auto_225409 ) ) ( not ( = ?auto_225406 ?auto_225413 ) ) ( not ( = ?auto_225406 ?auto_225415 ) ) ( not ( = ?auto_225403 ?auto_225408 ) ) ( not ( = ?auto_225403 ?auto_225410 ) ) ( not ( = ?auto_225403 ?auto_225412 ) ) ( not ( = ?auto_225408 ?auto_225410 ) ) ( not ( = ?auto_225410 ?auto_225412 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_225415 ?auto_225412 ?auto_225407 ?auto_225408 )
      ( GET-4IMAGE-VERIFY ?auto_225404 ?auto_225405 ?auto_225406 ?auto_225403 ?auto_225407 ?auto_225408 ?auto_225409 ?auto_225410 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_225439 - DIRECTION
      ?auto_225440 - MODE
      ?auto_225441 - DIRECTION
      ?auto_225438 - MODE
      ?auto_225442 - DIRECTION
      ?auto_225443 - MODE
      ?auto_225444 - DIRECTION
      ?auto_225445 - MODE
    )
    :vars
    (
      ?auto_225449 - INSTRUMENT
      ?auto_225446 - SATELLITE
      ?auto_225448 - DIRECTION
      ?auto_225450 - DIRECTION
      ?auto_225447 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_225449 ?auto_225446 ) ( SUPPORTS ?auto_225449 ?auto_225445 ) ( not ( = ?auto_225444 ?auto_225448 ) ) ( HAVE_IMAGE ?auto_225450 ?auto_225447 ) ( not ( = ?auto_225450 ?auto_225444 ) ) ( not ( = ?auto_225450 ?auto_225448 ) ) ( not ( = ?auto_225447 ?auto_225445 ) ) ( CALIBRATION_TARGET ?auto_225449 ?auto_225448 ) ( POWER_AVAIL ?auto_225446 ) ( POINTING ?auto_225446 ?auto_225441 ) ( not ( = ?auto_225448 ?auto_225441 ) ) ( not ( = ?auto_225444 ?auto_225441 ) ) ( not ( = ?auto_225450 ?auto_225441 ) ) ( HAVE_IMAGE ?auto_225439 ?auto_225440 ) ( HAVE_IMAGE ?auto_225441 ?auto_225438 ) ( HAVE_IMAGE ?auto_225442 ?auto_225443 ) ( not ( = ?auto_225439 ?auto_225441 ) ) ( not ( = ?auto_225439 ?auto_225442 ) ) ( not ( = ?auto_225439 ?auto_225444 ) ) ( not ( = ?auto_225439 ?auto_225448 ) ) ( not ( = ?auto_225439 ?auto_225450 ) ) ( not ( = ?auto_225440 ?auto_225438 ) ) ( not ( = ?auto_225440 ?auto_225443 ) ) ( not ( = ?auto_225440 ?auto_225445 ) ) ( not ( = ?auto_225440 ?auto_225447 ) ) ( not ( = ?auto_225441 ?auto_225442 ) ) ( not ( = ?auto_225438 ?auto_225443 ) ) ( not ( = ?auto_225438 ?auto_225445 ) ) ( not ( = ?auto_225438 ?auto_225447 ) ) ( not ( = ?auto_225442 ?auto_225444 ) ) ( not ( = ?auto_225442 ?auto_225448 ) ) ( not ( = ?auto_225442 ?auto_225450 ) ) ( not ( = ?auto_225443 ?auto_225445 ) ) ( not ( = ?auto_225443 ?auto_225447 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_225450 ?auto_225447 ?auto_225444 ?auto_225445 )
      ( GET-4IMAGE-VERIFY ?auto_225439 ?auto_225440 ?auto_225441 ?auto_225438 ?auto_225442 ?auto_225443 ?auto_225444 ?auto_225445 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_225524 - DIRECTION
      ?auto_225525 - MODE
      ?auto_225526 - DIRECTION
      ?auto_225523 - MODE
      ?auto_225527 - DIRECTION
      ?auto_225528 - MODE
      ?auto_225529 - DIRECTION
      ?auto_225530 - MODE
    )
    :vars
    (
      ?auto_225534 - INSTRUMENT
      ?auto_225531 - SATELLITE
      ?auto_225533 - DIRECTION
      ?auto_225532 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_225534 ?auto_225531 ) ( SUPPORTS ?auto_225534 ?auto_225523 ) ( not ( = ?auto_225526 ?auto_225533 ) ) ( HAVE_IMAGE ?auto_225527 ?auto_225528 ) ( not ( = ?auto_225527 ?auto_225526 ) ) ( not ( = ?auto_225527 ?auto_225533 ) ) ( not ( = ?auto_225528 ?auto_225523 ) ) ( CALIBRATION_TARGET ?auto_225534 ?auto_225533 ) ( POWER_AVAIL ?auto_225531 ) ( POINTING ?auto_225531 ?auto_225532 ) ( not ( = ?auto_225533 ?auto_225532 ) ) ( not ( = ?auto_225526 ?auto_225532 ) ) ( not ( = ?auto_225527 ?auto_225532 ) ) ( HAVE_IMAGE ?auto_225524 ?auto_225525 ) ( HAVE_IMAGE ?auto_225529 ?auto_225530 ) ( not ( = ?auto_225524 ?auto_225526 ) ) ( not ( = ?auto_225524 ?auto_225527 ) ) ( not ( = ?auto_225524 ?auto_225529 ) ) ( not ( = ?auto_225524 ?auto_225533 ) ) ( not ( = ?auto_225524 ?auto_225532 ) ) ( not ( = ?auto_225525 ?auto_225523 ) ) ( not ( = ?auto_225525 ?auto_225528 ) ) ( not ( = ?auto_225525 ?auto_225530 ) ) ( not ( = ?auto_225526 ?auto_225529 ) ) ( not ( = ?auto_225523 ?auto_225530 ) ) ( not ( = ?auto_225527 ?auto_225529 ) ) ( not ( = ?auto_225528 ?auto_225530 ) ) ( not ( = ?auto_225529 ?auto_225533 ) ) ( not ( = ?auto_225529 ?auto_225532 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_225527 ?auto_225528 ?auto_225526 ?auto_225523 )
      ( GET-4IMAGE-VERIFY ?auto_225524 ?auto_225525 ?auto_225526 ?auto_225523 ?auto_225527 ?auto_225528 ?auto_225529 ?auto_225530 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_225568 - DIRECTION
      ?auto_225569 - MODE
      ?auto_225570 - DIRECTION
      ?auto_225567 - MODE
      ?auto_225571 - DIRECTION
      ?auto_225572 - MODE
      ?auto_225573 - DIRECTION
      ?auto_225574 - MODE
    )
    :vars
    (
      ?auto_225579 - INSTRUMENT
      ?auto_225575 - SATELLITE
      ?auto_225578 - DIRECTION
      ?auto_225580 - DIRECTION
      ?auto_225577 - MODE
      ?auto_225576 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_225579 ?auto_225575 ) ( SUPPORTS ?auto_225579 ?auto_225567 ) ( not ( = ?auto_225570 ?auto_225578 ) ) ( HAVE_IMAGE ?auto_225580 ?auto_225577 ) ( not ( = ?auto_225580 ?auto_225570 ) ) ( not ( = ?auto_225580 ?auto_225578 ) ) ( not ( = ?auto_225577 ?auto_225567 ) ) ( CALIBRATION_TARGET ?auto_225579 ?auto_225578 ) ( POWER_AVAIL ?auto_225575 ) ( POINTING ?auto_225575 ?auto_225576 ) ( not ( = ?auto_225578 ?auto_225576 ) ) ( not ( = ?auto_225570 ?auto_225576 ) ) ( not ( = ?auto_225580 ?auto_225576 ) ) ( HAVE_IMAGE ?auto_225568 ?auto_225569 ) ( HAVE_IMAGE ?auto_225571 ?auto_225572 ) ( HAVE_IMAGE ?auto_225573 ?auto_225574 ) ( not ( = ?auto_225568 ?auto_225570 ) ) ( not ( = ?auto_225568 ?auto_225571 ) ) ( not ( = ?auto_225568 ?auto_225573 ) ) ( not ( = ?auto_225568 ?auto_225578 ) ) ( not ( = ?auto_225568 ?auto_225580 ) ) ( not ( = ?auto_225568 ?auto_225576 ) ) ( not ( = ?auto_225569 ?auto_225567 ) ) ( not ( = ?auto_225569 ?auto_225572 ) ) ( not ( = ?auto_225569 ?auto_225574 ) ) ( not ( = ?auto_225569 ?auto_225577 ) ) ( not ( = ?auto_225570 ?auto_225571 ) ) ( not ( = ?auto_225570 ?auto_225573 ) ) ( not ( = ?auto_225567 ?auto_225572 ) ) ( not ( = ?auto_225567 ?auto_225574 ) ) ( not ( = ?auto_225571 ?auto_225573 ) ) ( not ( = ?auto_225571 ?auto_225578 ) ) ( not ( = ?auto_225571 ?auto_225580 ) ) ( not ( = ?auto_225571 ?auto_225576 ) ) ( not ( = ?auto_225572 ?auto_225574 ) ) ( not ( = ?auto_225572 ?auto_225577 ) ) ( not ( = ?auto_225573 ?auto_225578 ) ) ( not ( = ?auto_225573 ?auto_225580 ) ) ( not ( = ?auto_225573 ?auto_225576 ) ) ( not ( = ?auto_225574 ?auto_225577 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_225580 ?auto_225577 ?auto_225570 ?auto_225567 )
      ( GET-4IMAGE-VERIFY ?auto_225568 ?auto_225569 ?auto_225570 ?auto_225567 ?auto_225571 ?auto_225572 ?auto_225573 ?auto_225574 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_225582 - DIRECTION
      ?auto_225583 - MODE
      ?auto_225584 - DIRECTION
      ?auto_225581 - MODE
      ?auto_225585 - DIRECTION
      ?auto_225586 - MODE
      ?auto_225587 - DIRECTION
      ?auto_225588 - MODE
    )
    :vars
    (
      ?auto_225592 - INSTRUMENT
      ?auto_225589 - SATELLITE
      ?auto_225591 - DIRECTION
      ?auto_225593 - DIRECTION
      ?auto_225590 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_225592 ?auto_225589 ) ( SUPPORTS ?auto_225592 ?auto_225581 ) ( not ( = ?auto_225584 ?auto_225591 ) ) ( HAVE_IMAGE ?auto_225593 ?auto_225590 ) ( not ( = ?auto_225593 ?auto_225584 ) ) ( not ( = ?auto_225593 ?auto_225591 ) ) ( not ( = ?auto_225590 ?auto_225581 ) ) ( CALIBRATION_TARGET ?auto_225592 ?auto_225591 ) ( POWER_AVAIL ?auto_225589 ) ( POINTING ?auto_225589 ?auto_225587 ) ( not ( = ?auto_225591 ?auto_225587 ) ) ( not ( = ?auto_225584 ?auto_225587 ) ) ( not ( = ?auto_225593 ?auto_225587 ) ) ( HAVE_IMAGE ?auto_225582 ?auto_225583 ) ( HAVE_IMAGE ?auto_225585 ?auto_225586 ) ( HAVE_IMAGE ?auto_225587 ?auto_225588 ) ( not ( = ?auto_225582 ?auto_225584 ) ) ( not ( = ?auto_225582 ?auto_225585 ) ) ( not ( = ?auto_225582 ?auto_225587 ) ) ( not ( = ?auto_225582 ?auto_225591 ) ) ( not ( = ?auto_225582 ?auto_225593 ) ) ( not ( = ?auto_225583 ?auto_225581 ) ) ( not ( = ?auto_225583 ?auto_225586 ) ) ( not ( = ?auto_225583 ?auto_225588 ) ) ( not ( = ?auto_225583 ?auto_225590 ) ) ( not ( = ?auto_225584 ?auto_225585 ) ) ( not ( = ?auto_225581 ?auto_225586 ) ) ( not ( = ?auto_225581 ?auto_225588 ) ) ( not ( = ?auto_225585 ?auto_225587 ) ) ( not ( = ?auto_225585 ?auto_225591 ) ) ( not ( = ?auto_225585 ?auto_225593 ) ) ( not ( = ?auto_225586 ?auto_225588 ) ) ( not ( = ?auto_225586 ?auto_225590 ) ) ( not ( = ?auto_225588 ?auto_225590 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_225593 ?auto_225590 ?auto_225584 ?auto_225581 )
      ( GET-4IMAGE-VERIFY ?auto_225582 ?auto_225583 ?auto_225584 ?auto_225581 ?auto_225585 ?auto_225586 ?auto_225587 ?auto_225588 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_225791 - DIRECTION
      ?auto_225792 - MODE
      ?auto_225793 - DIRECTION
      ?auto_225790 - MODE
      ?auto_225794 - DIRECTION
      ?auto_225795 - MODE
      ?auto_225796 - DIRECTION
      ?auto_225797 - MODE
    )
    :vars
    (
      ?auto_225801 - INSTRUMENT
      ?auto_225798 - SATELLITE
      ?auto_225800 - DIRECTION
      ?auto_225802 - DIRECTION
      ?auto_225799 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_225801 ?auto_225798 ) ( SUPPORTS ?auto_225801 ?auto_225797 ) ( not ( = ?auto_225796 ?auto_225800 ) ) ( HAVE_IMAGE ?auto_225802 ?auto_225799 ) ( not ( = ?auto_225802 ?auto_225796 ) ) ( not ( = ?auto_225802 ?auto_225800 ) ) ( not ( = ?auto_225799 ?auto_225797 ) ) ( CALIBRATION_TARGET ?auto_225801 ?auto_225800 ) ( POWER_AVAIL ?auto_225798 ) ( POINTING ?auto_225798 ?auto_225791 ) ( not ( = ?auto_225800 ?auto_225791 ) ) ( not ( = ?auto_225796 ?auto_225791 ) ) ( not ( = ?auto_225802 ?auto_225791 ) ) ( HAVE_IMAGE ?auto_225791 ?auto_225792 ) ( HAVE_IMAGE ?auto_225793 ?auto_225790 ) ( HAVE_IMAGE ?auto_225794 ?auto_225795 ) ( not ( = ?auto_225791 ?auto_225793 ) ) ( not ( = ?auto_225791 ?auto_225794 ) ) ( not ( = ?auto_225792 ?auto_225790 ) ) ( not ( = ?auto_225792 ?auto_225795 ) ) ( not ( = ?auto_225792 ?auto_225797 ) ) ( not ( = ?auto_225792 ?auto_225799 ) ) ( not ( = ?auto_225793 ?auto_225794 ) ) ( not ( = ?auto_225793 ?auto_225796 ) ) ( not ( = ?auto_225793 ?auto_225800 ) ) ( not ( = ?auto_225793 ?auto_225802 ) ) ( not ( = ?auto_225790 ?auto_225795 ) ) ( not ( = ?auto_225790 ?auto_225797 ) ) ( not ( = ?auto_225790 ?auto_225799 ) ) ( not ( = ?auto_225794 ?auto_225796 ) ) ( not ( = ?auto_225794 ?auto_225800 ) ) ( not ( = ?auto_225794 ?auto_225802 ) ) ( not ( = ?auto_225795 ?auto_225797 ) ) ( not ( = ?auto_225795 ?auto_225799 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_225802 ?auto_225799 ?auto_225796 ?auto_225797 )
      ( GET-4IMAGE-VERIFY ?auto_225791 ?auto_225792 ?auto_225793 ?auto_225790 ?auto_225794 ?auto_225795 ?auto_225796 ?auto_225797 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_225825 - DIRECTION
      ?auto_225826 - MODE
      ?auto_225827 - DIRECTION
      ?auto_225824 - MODE
      ?auto_225828 - DIRECTION
      ?auto_225829 - MODE
      ?auto_225830 - DIRECTION
      ?auto_225831 - MODE
    )
    :vars
    (
      ?auto_225835 - INSTRUMENT
      ?auto_225832 - SATELLITE
      ?auto_225834 - DIRECTION
      ?auto_225836 - DIRECTION
      ?auto_225833 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_225835 ?auto_225832 ) ( SUPPORTS ?auto_225835 ?auto_225829 ) ( not ( = ?auto_225828 ?auto_225834 ) ) ( HAVE_IMAGE ?auto_225836 ?auto_225833 ) ( not ( = ?auto_225836 ?auto_225828 ) ) ( not ( = ?auto_225836 ?auto_225834 ) ) ( not ( = ?auto_225833 ?auto_225829 ) ) ( CALIBRATION_TARGET ?auto_225835 ?auto_225834 ) ( POWER_AVAIL ?auto_225832 ) ( POINTING ?auto_225832 ?auto_225825 ) ( not ( = ?auto_225834 ?auto_225825 ) ) ( not ( = ?auto_225828 ?auto_225825 ) ) ( not ( = ?auto_225836 ?auto_225825 ) ) ( HAVE_IMAGE ?auto_225825 ?auto_225826 ) ( HAVE_IMAGE ?auto_225827 ?auto_225824 ) ( HAVE_IMAGE ?auto_225830 ?auto_225831 ) ( not ( = ?auto_225825 ?auto_225827 ) ) ( not ( = ?auto_225825 ?auto_225830 ) ) ( not ( = ?auto_225826 ?auto_225824 ) ) ( not ( = ?auto_225826 ?auto_225829 ) ) ( not ( = ?auto_225826 ?auto_225831 ) ) ( not ( = ?auto_225826 ?auto_225833 ) ) ( not ( = ?auto_225827 ?auto_225828 ) ) ( not ( = ?auto_225827 ?auto_225830 ) ) ( not ( = ?auto_225827 ?auto_225834 ) ) ( not ( = ?auto_225827 ?auto_225836 ) ) ( not ( = ?auto_225824 ?auto_225829 ) ) ( not ( = ?auto_225824 ?auto_225831 ) ) ( not ( = ?auto_225824 ?auto_225833 ) ) ( not ( = ?auto_225828 ?auto_225830 ) ) ( not ( = ?auto_225829 ?auto_225831 ) ) ( not ( = ?auto_225830 ?auto_225834 ) ) ( not ( = ?auto_225830 ?auto_225836 ) ) ( not ( = ?auto_225831 ?auto_225833 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_225836 ?auto_225833 ?auto_225828 ?auto_225829 )
      ( GET-4IMAGE-VERIFY ?auto_225825 ?auto_225826 ?auto_225827 ?auto_225824 ?auto_225828 ?auto_225829 ?auto_225830 ?auto_225831 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_226003 - DIRECTION
      ?auto_226004 - MODE
      ?auto_226005 - DIRECTION
      ?auto_226002 - MODE
      ?auto_226006 - DIRECTION
      ?auto_226007 - MODE
      ?auto_226008 - DIRECTION
      ?auto_226009 - MODE
    )
    :vars
    (
      ?auto_226013 - INSTRUMENT
      ?auto_226010 - SATELLITE
      ?auto_226012 - DIRECTION
      ?auto_226014 - DIRECTION
      ?auto_226011 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_226013 ?auto_226010 ) ( SUPPORTS ?auto_226013 ?auto_226002 ) ( not ( = ?auto_226005 ?auto_226012 ) ) ( HAVE_IMAGE ?auto_226014 ?auto_226011 ) ( not ( = ?auto_226014 ?auto_226005 ) ) ( not ( = ?auto_226014 ?auto_226012 ) ) ( not ( = ?auto_226011 ?auto_226002 ) ) ( CALIBRATION_TARGET ?auto_226013 ?auto_226012 ) ( POWER_AVAIL ?auto_226010 ) ( POINTING ?auto_226010 ?auto_226003 ) ( not ( = ?auto_226012 ?auto_226003 ) ) ( not ( = ?auto_226005 ?auto_226003 ) ) ( not ( = ?auto_226014 ?auto_226003 ) ) ( HAVE_IMAGE ?auto_226003 ?auto_226004 ) ( HAVE_IMAGE ?auto_226006 ?auto_226007 ) ( HAVE_IMAGE ?auto_226008 ?auto_226009 ) ( not ( = ?auto_226003 ?auto_226006 ) ) ( not ( = ?auto_226003 ?auto_226008 ) ) ( not ( = ?auto_226004 ?auto_226002 ) ) ( not ( = ?auto_226004 ?auto_226007 ) ) ( not ( = ?auto_226004 ?auto_226009 ) ) ( not ( = ?auto_226004 ?auto_226011 ) ) ( not ( = ?auto_226005 ?auto_226006 ) ) ( not ( = ?auto_226005 ?auto_226008 ) ) ( not ( = ?auto_226002 ?auto_226007 ) ) ( not ( = ?auto_226002 ?auto_226009 ) ) ( not ( = ?auto_226006 ?auto_226008 ) ) ( not ( = ?auto_226006 ?auto_226012 ) ) ( not ( = ?auto_226006 ?auto_226014 ) ) ( not ( = ?auto_226007 ?auto_226009 ) ) ( not ( = ?auto_226007 ?auto_226011 ) ) ( not ( = ?auto_226008 ?auto_226012 ) ) ( not ( = ?auto_226008 ?auto_226014 ) ) ( not ( = ?auto_226009 ?auto_226011 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_226014 ?auto_226011 ?auto_226005 ?auto_226002 )
      ( GET-4IMAGE-VERIFY ?auto_226003 ?auto_226004 ?auto_226005 ?auto_226002 ?auto_226006 ?auto_226007 ?auto_226008 ?auto_226009 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_226142 - DIRECTION
      ?auto_226143 - MODE
      ?auto_226144 - DIRECTION
      ?auto_226141 - MODE
      ?auto_226145 - DIRECTION
      ?auto_226146 - MODE
      ?auto_226147 - DIRECTION
      ?auto_226148 - MODE
    )
    :vars
    (
      ?auto_226152 - INSTRUMENT
      ?auto_226149 - SATELLITE
      ?auto_226151 - DIRECTION
      ?auto_226150 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_226152 ?auto_226149 ) ( SUPPORTS ?auto_226152 ?auto_226143 ) ( not ( = ?auto_226142 ?auto_226151 ) ) ( HAVE_IMAGE ?auto_226147 ?auto_226146 ) ( not ( = ?auto_226147 ?auto_226142 ) ) ( not ( = ?auto_226147 ?auto_226151 ) ) ( not ( = ?auto_226146 ?auto_226143 ) ) ( CALIBRATION_TARGET ?auto_226152 ?auto_226151 ) ( POWER_AVAIL ?auto_226149 ) ( POINTING ?auto_226149 ?auto_226150 ) ( not ( = ?auto_226151 ?auto_226150 ) ) ( not ( = ?auto_226142 ?auto_226150 ) ) ( not ( = ?auto_226147 ?auto_226150 ) ) ( HAVE_IMAGE ?auto_226144 ?auto_226141 ) ( HAVE_IMAGE ?auto_226145 ?auto_226146 ) ( HAVE_IMAGE ?auto_226147 ?auto_226148 ) ( not ( = ?auto_226142 ?auto_226144 ) ) ( not ( = ?auto_226142 ?auto_226145 ) ) ( not ( = ?auto_226143 ?auto_226141 ) ) ( not ( = ?auto_226143 ?auto_226148 ) ) ( not ( = ?auto_226144 ?auto_226145 ) ) ( not ( = ?auto_226144 ?auto_226147 ) ) ( not ( = ?auto_226144 ?auto_226151 ) ) ( not ( = ?auto_226144 ?auto_226150 ) ) ( not ( = ?auto_226141 ?auto_226146 ) ) ( not ( = ?auto_226141 ?auto_226148 ) ) ( not ( = ?auto_226145 ?auto_226147 ) ) ( not ( = ?auto_226145 ?auto_226151 ) ) ( not ( = ?auto_226145 ?auto_226150 ) ) ( not ( = ?auto_226146 ?auto_226148 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_226147 ?auto_226146 ?auto_226142 ?auto_226143 )
      ( GET-4IMAGE-VERIFY ?auto_226142 ?auto_226143 ?auto_226144 ?auto_226141 ?auto_226145 ?auto_226146 ?auto_226147 ?auto_226148 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_226154 - DIRECTION
      ?auto_226155 - MODE
      ?auto_226156 - DIRECTION
      ?auto_226153 - MODE
      ?auto_226157 - DIRECTION
      ?auto_226158 - MODE
      ?auto_226159 - DIRECTION
      ?auto_226160 - MODE
    )
    :vars
    (
      ?auto_226164 - INSTRUMENT
      ?auto_226161 - SATELLITE
      ?auto_226163 - DIRECTION
      ?auto_226162 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_226164 ?auto_226161 ) ( SUPPORTS ?auto_226164 ?auto_226155 ) ( not ( = ?auto_226154 ?auto_226163 ) ) ( HAVE_IMAGE ?auto_226157 ?auto_226158 ) ( not ( = ?auto_226157 ?auto_226154 ) ) ( not ( = ?auto_226157 ?auto_226163 ) ) ( not ( = ?auto_226158 ?auto_226155 ) ) ( CALIBRATION_TARGET ?auto_226164 ?auto_226163 ) ( POWER_AVAIL ?auto_226161 ) ( POINTING ?auto_226161 ?auto_226162 ) ( not ( = ?auto_226163 ?auto_226162 ) ) ( not ( = ?auto_226154 ?auto_226162 ) ) ( not ( = ?auto_226157 ?auto_226162 ) ) ( HAVE_IMAGE ?auto_226156 ?auto_226153 ) ( HAVE_IMAGE ?auto_226159 ?auto_226160 ) ( not ( = ?auto_226154 ?auto_226156 ) ) ( not ( = ?auto_226154 ?auto_226159 ) ) ( not ( = ?auto_226155 ?auto_226153 ) ) ( not ( = ?auto_226155 ?auto_226160 ) ) ( not ( = ?auto_226156 ?auto_226157 ) ) ( not ( = ?auto_226156 ?auto_226159 ) ) ( not ( = ?auto_226156 ?auto_226163 ) ) ( not ( = ?auto_226156 ?auto_226162 ) ) ( not ( = ?auto_226153 ?auto_226158 ) ) ( not ( = ?auto_226153 ?auto_226160 ) ) ( not ( = ?auto_226157 ?auto_226159 ) ) ( not ( = ?auto_226158 ?auto_226160 ) ) ( not ( = ?auto_226159 ?auto_226163 ) ) ( not ( = ?auto_226159 ?auto_226162 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_226157 ?auto_226158 ?auto_226154 ?auto_226155 )
      ( GET-4IMAGE-VERIFY ?auto_226154 ?auto_226155 ?auto_226156 ?auto_226153 ?auto_226157 ?auto_226158 ?auto_226159 ?auto_226160 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_226166 - DIRECTION
      ?auto_226167 - MODE
      ?auto_226168 - DIRECTION
      ?auto_226165 - MODE
      ?auto_226169 - DIRECTION
      ?auto_226170 - MODE
      ?auto_226171 - DIRECTION
      ?auto_226172 - MODE
    )
    :vars
    (
      ?auto_226175 - INSTRUMENT
      ?auto_226173 - SATELLITE
      ?auto_226174 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_226175 ?auto_226173 ) ( SUPPORTS ?auto_226175 ?auto_226167 ) ( not ( = ?auto_226166 ?auto_226174 ) ) ( HAVE_IMAGE ?auto_226169 ?auto_226170 ) ( not ( = ?auto_226169 ?auto_226166 ) ) ( not ( = ?auto_226169 ?auto_226174 ) ) ( not ( = ?auto_226170 ?auto_226167 ) ) ( CALIBRATION_TARGET ?auto_226175 ?auto_226174 ) ( POWER_AVAIL ?auto_226173 ) ( POINTING ?auto_226173 ?auto_226171 ) ( not ( = ?auto_226174 ?auto_226171 ) ) ( not ( = ?auto_226166 ?auto_226171 ) ) ( not ( = ?auto_226169 ?auto_226171 ) ) ( HAVE_IMAGE ?auto_226168 ?auto_226165 ) ( HAVE_IMAGE ?auto_226171 ?auto_226172 ) ( not ( = ?auto_226166 ?auto_226168 ) ) ( not ( = ?auto_226167 ?auto_226165 ) ) ( not ( = ?auto_226167 ?auto_226172 ) ) ( not ( = ?auto_226168 ?auto_226169 ) ) ( not ( = ?auto_226168 ?auto_226171 ) ) ( not ( = ?auto_226168 ?auto_226174 ) ) ( not ( = ?auto_226165 ?auto_226170 ) ) ( not ( = ?auto_226165 ?auto_226172 ) ) ( not ( = ?auto_226170 ?auto_226172 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_226169 ?auto_226170 ?auto_226166 ?auto_226167 )
      ( GET-4IMAGE-VERIFY ?auto_226166 ?auto_226167 ?auto_226168 ?auto_226165 ?auto_226169 ?auto_226170 ?auto_226171 ?auto_226172 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_226189 - DIRECTION
      ?auto_226190 - MODE
      ?auto_226191 - DIRECTION
      ?auto_226188 - MODE
      ?auto_226192 - DIRECTION
      ?auto_226193 - MODE
      ?auto_226194 - DIRECTION
      ?auto_226195 - MODE
    )
    :vars
    (
      ?auto_226199 - INSTRUMENT
      ?auto_226196 - SATELLITE
      ?auto_226198 - DIRECTION
      ?auto_226197 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_226199 ?auto_226196 ) ( SUPPORTS ?auto_226199 ?auto_226190 ) ( not ( = ?auto_226189 ?auto_226198 ) ) ( HAVE_IMAGE ?auto_226194 ?auto_226195 ) ( not ( = ?auto_226194 ?auto_226189 ) ) ( not ( = ?auto_226194 ?auto_226198 ) ) ( not ( = ?auto_226195 ?auto_226190 ) ) ( CALIBRATION_TARGET ?auto_226199 ?auto_226198 ) ( POWER_AVAIL ?auto_226196 ) ( POINTING ?auto_226196 ?auto_226197 ) ( not ( = ?auto_226198 ?auto_226197 ) ) ( not ( = ?auto_226189 ?auto_226197 ) ) ( not ( = ?auto_226194 ?auto_226197 ) ) ( HAVE_IMAGE ?auto_226191 ?auto_226188 ) ( HAVE_IMAGE ?auto_226192 ?auto_226193 ) ( not ( = ?auto_226189 ?auto_226191 ) ) ( not ( = ?auto_226189 ?auto_226192 ) ) ( not ( = ?auto_226190 ?auto_226188 ) ) ( not ( = ?auto_226190 ?auto_226193 ) ) ( not ( = ?auto_226191 ?auto_226192 ) ) ( not ( = ?auto_226191 ?auto_226194 ) ) ( not ( = ?auto_226191 ?auto_226198 ) ) ( not ( = ?auto_226191 ?auto_226197 ) ) ( not ( = ?auto_226188 ?auto_226193 ) ) ( not ( = ?auto_226188 ?auto_226195 ) ) ( not ( = ?auto_226192 ?auto_226194 ) ) ( not ( = ?auto_226192 ?auto_226198 ) ) ( not ( = ?auto_226192 ?auto_226197 ) ) ( not ( = ?auto_226193 ?auto_226195 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_226194 ?auto_226195 ?auto_226189 ?auto_226190 )
      ( GET-4IMAGE-VERIFY ?auto_226189 ?auto_226190 ?auto_226191 ?auto_226188 ?auto_226192 ?auto_226193 ?auto_226194 ?auto_226195 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_226201 - DIRECTION
      ?auto_226202 - MODE
      ?auto_226203 - DIRECTION
      ?auto_226200 - MODE
      ?auto_226204 - DIRECTION
      ?auto_226205 - MODE
      ?auto_226206 - DIRECTION
      ?auto_226207 - MODE
    )
    :vars
    (
      ?auto_226211 - INSTRUMENT
      ?auto_226208 - SATELLITE
      ?auto_226210 - DIRECTION
      ?auto_226209 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_226211 ?auto_226208 ) ( SUPPORTS ?auto_226211 ?auto_226202 ) ( not ( = ?auto_226201 ?auto_226210 ) ) ( HAVE_IMAGE ?auto_226203 ?auto_226200 ) ( not ( = ?auto_226203 ?auto_226201 ) ) ( not ( = ?auto_226203 ?auto_226210 ) ) ( not ( = ?auto_226200 ?auto_226202 ) ) ( CALIBRATION_TARGET ?auto_226211 ?auto_226210 ) ( POWER_AVAIL ?auto_226208 ) ( POINTING ?auto_226208 ?auto_226209 ) ( not ( = ?auto_226210 ?auto_226209 ) ) ( not ( = ?auto_226201 ?auto_226209 ) ) ( not ( = ?auto_226203 ?auto_226209 ) ) ( HAVE_IMAGE ?auto_226204 ?auto_226205 ) ( HAVE_IMAGE ?auto_226206 ?auto_226207 ) ( not ( = ?auto_226201 ?auto_226204 ) ) ( not ( = ?auto_226201 ?auto_226206 ) ) ( not ( = ?auto_226202 ?auto_226205 ) ) ( not ( = ?auto_226202 ?auto_226207 ) ) ( not ( = ?auto_226203 ?auto_226204 ) ) ( not ( = ?auto_226203 ?auto_226206 ) ) ( not ( = ?auto_226200 ?auto_226205 ) ) ( not ( = ?auto_226200 ?auto_226207 ) ) ( not ( = ?auto_226204 ?auto_226206 ) ) ( not ( = ?auto_226204 ?auto_226210 ) ) ( not ( = ?auto_226204 ?auto_226209 ) ) ( not ( = ?auto_226205 ?auto_226207 ) ) ( not ( = ?auto_226206 ?auto_226210 ) ) ( not ( = ?auto_226206 ?auto_226209 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_226203 ?auto_226200 ?auto_226201 ?auto_226202 )
      ( GET-4IMAGE-VERIFY ?auto_226201 ?auto_226202 ?auto_226203 ?auto_226200 ?auto_226204 ?auto_226205 ?auto_226206 ?auto_226207 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_226233 - DIRECTION
      ?auto_226234 - MODE
      ?auto_226235 - DIRECTION
      ?auto_226232 - MODE
      ?auto_226236 - DIRECTION
      ?auto_226237 - MODE
      ?auto_226238 - DIRECTION
      ?auto_226239 - MODE
    )
    :vars
    (
      ?auto_226242 - INSTRUMENT
      ?auto_226240 - SATELLITE
      ?auto_226241 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_226242 ?auto_226240 ) ( SUPPORTS ?auto_226242 ?auto_226234 ) ( not ( = ?auto_226233 ?auto_226241 ) ) ( HAVE_IMAGE ?auto_226235 ?auto_226239 ) ( not ( = ?auto_226235 ?auto_226233 ) ) ( not ( = ?auto_226235 ?auto_226241 ) ) ( not ( = ?auto_226239 ?auto_226234 ) ) ( CALIBRATION_TARGET ?auto_226242 ?auto_226241 ) ( POWER_AVAIL ?auto_226240 ) ( POINTING ?auto_226240 ?auto_226236 ) ( not ( = ?auto_226241 ?auto_226236 ) ) ( not ( = ?auto_226233 ?auto_226236 ) ) ( not ( = ?auto_226235 ?auto_226236 ) ) ( HAVE_IMAGE ?auto_226235 ?auto_226232 ) ( HAVE_IMAGE ?auto_226236 ?auto_226237 ) ( HAVE_IMAGE ?auto_226238 ?auto_226239 ) ( not ( = ?auto_226233 ?auto_226238 ) ) ( not ( = ?auto_226234 ?auto_226232 ) ) ( not ( = ?auto_226234 ?auto_226237 ) ) ( not ( = ?auto_226235 ?auto_226238 ) ) ( not ( = ?auto_226232 ?auto_226237 ) ) ( not ( = ?auto_226232 ?auto_226239 ) ) ( not ( = ?auto_226236 ?auto_226238 ) ) ( not ( = ?auto_226237 ?auto_226239 ) ) ( not ( = ?auto_226238 ?auto_226241 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_226235 ?auto_226239 ?auto_226233 ?auto_226234 )
      ( GET-4IMAGE-VERIFY ?auto_226233 ?auto_226234 ?auto_226235 ?auto_226232 ?auto_226236 ?auto_226237 ?auto_226238 ?auto_226239 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_226324 - DIRECTION
      ?auto_226325 - MODE
      ?auto_226326 - DIRECTION
      ?auto_226323 - MODE
      ?auto_226327 - DIRECTION
      ?auto_226328 - MODE
      ?auto_226329 - DIRECTION
      ?auto_226330 - MODE
    )
    :vars
    (
      ?auto_226334 - INSTRUMENT
      ?auto_226331 - SATELLITE
      ?auto_226333 - DIRECTION
      ?auto_226332 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_226334 ?auto_226331 ) ( SUPPORTS ?auto_226334 ?auto_226325 ) ( not ( = ?auto_226324 ?auto_226333 ) ) ( HAVE_IMAGE ?auto_226327 ?auto_226330 ) ( not ( = ?auto_226327 ?auto_226324 ) ) ( not ( = ?auto_226327 ?auto_226333 ) ) ( not ( = ?auto_226330 ?auto_226325 ) ) ( CALIBRATION_TARGET ?auto_226334 ?auto_226333 ) ( POWER_AVAIL ?auto_226331 ) ( POINTING ?auto_226331 ?auto_226332 ) ( not ( = ?auto_226333 ?auto_226332 ) ) ( not ( = ?auto_226324 ?auto_226332 ) ) ( not ( = ?auto_226327 ?auto_226332 ) ) ( HAVE_IMAGE ?auto_226326 ?auto_226323 ) ( HAVE_IMAGE ?auto_226327 ?auto_226328 ) ( HAVE_IMAGE ?auto_226329 ?auto_226330 ) ( not ( = ?auto_226324 ?auto_226326 ) ) ( not ( = ?auto_226324 ?auto_226329 ) ) ( not ( = ?auto_226325 ?auto_226323 ) ) ( not ( = ?auto_226325 ?auto_226328 ) ) ( not ( = ?auto_226326 ?auto_226327 ) ) ( not ( = ?auto_226326 ?auto_226329 ) ) ( not ( = ?auto_226326 ?auto_226333 ) ) ( not ( = ?auto_226326 ?auto_226332 ) ) ( not ( = ?auto_226323 ?auto_226328 ) ) ( not ( = ?auto_226323 ?auto_226330 ) ) ( not ( = ?auto_226327 ?auto_226329 ) ) ( not ( = ?auto_226328 ?auto_226330 ) ) ( not ( = ?auto_226329 ?auto_226333 ) ) ( not ( = ?auto_226329 ?auto_226332 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_226327 ?auto_226330 ?auto_226324 ?auto_226325 )
      ( GET-4IMAGE-VERIFY ?auto_226324 ?auto_226325 ?auto_226326 ?auto_226323 ?auto_226327 ?auto_226328 ?auto_226329 ?auto_226330 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_226380 - DIRECTION
      ?auto_226381 - MODE
      ?auto_226382 - DIRECTION
      ?auto_226379 - MODE
      ?auto_226383 - DIRECTION
      ?auto_226384 - MODE
      ?auto_226385 - DIRECTION
      ?auto_226386 - MODE
    )
    :vars
    (
      ?auto_226391 - INSTRUMENT
      ?auto_226387 - SATELLITE
      ?auto_226390 - DIRECTION
      ?auto_226392 - DIRECTION
      ?auto_226389 - MODE
      ?auto_226388 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_226391 ?auto_226387 ) ( SUPPORTS ?auto_226391 ?auto_226381 ) ( not ( = ?auto_226380 ?auto_226390 ) ) ( HAVE_IMAGE ?auto_226392 ?auto_226389 ) ( not ( = ?auto_226392 ?auto_226380 ) ) ( not ( = ?auto_226392 ?auto_226390 ) ) ( not ( = ?auto_226389 ?auto_226381 ) ) ( CALIBRATION_TARGET ?auto_226391 ?auto_226390 ) ( POWER_AVAIL ?auto_226387 ) ( POINTING ?auto_226387 ?auto_226388 ) ( not ( = ?auto_226390 ?auto_226388 ) ) ( not ( = ?auto_226380 ?auto_226388 ) ) ( not ( = ?auto_226392 ?auto_226388 ) ) ( HAVE_IMAGE ?auto_226382 ?auto_226379 ) ( HAVE_IMAGE ?auto_226383 ?auto_226384 ) ( HAVE_IMAGE ?auto_226385 ?auto_226386 ) ( not ( = ?auto_226380 ?auto_226382 ) ) ( not ( = ?auto_226380 ?auto_226383 ) ) ( not ( = ?auto_226380 ?auto_226385 ) ) ( not ( = ?auto_226381 ?auto_226379 ) ) ( not ( = ?auto_226381 ?auto_226384 ) ) ( not ( = ?auto_226381 ?auto_226386 ) ) ( not ( = ?auto_226382 ?auto_226383 ) ) ( not ( = ?auto_226382 ?auto_226385 ) ) ( not ( = ?auto_226382 ?auto_226390 ) ) ( not ( = ?auto_226382 ?auto_226392 ) ) ( not ( = ?auto_226382 ?auto_226388 ) ) ( not ( = ?auto_226379 ?auto_226384 ) ) ( not ( = ?auto_226379 ?auto_226386 ) ) ( not ( = ?auto_226379 ?auto_226389 ) ) ( not ( = ?auto_226383 ?auto_226385 ) ) ( not ( = ?auto_226383 ?auto_226390 ) ) ( not ( = ?auto_226383 ?auto_226392 ) ) ( not ( = ?auto_226383 ?auto_226388 ) ) ( not ( = ?auto_226384 ?auto_226386 ) ) ( not ( = ?auto_226384 ?auto_226389 ) ) ( not ( = ?auto_226385 ?auto_226390 ) ) ( not ( = ?auto_226385 ?auto_226392 ) ) ( not ( = ?auto_226385 ?auto_226388 ) ) ( not ( = ?auto_226386 ?auto_226389 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_226392 ?auto_226389 ?auto_226380 ?auto_226381 )
      ( GET-4IMAGE-VERIFY ?auto_226380 ?auto_226381 ?auto_226382 ?auto_226379 ?auto_226383 ?auto_226384 ?auto_226385 ?auto_226386 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_226394 - DIRECTION
      ?auto_226395 - MODE
      ?auto_226396 - DIRECTION
      ?auto_226393 - MODE
      ?auto_226397 - DIRECTION
      ?auto_226398 - MODE
      ?auto_226399 - DIRECTION
      ?auto_226400 - MODE
    )
    :vars
    (
      ?auto_226404 - INSTRUMENT
      ?auto_226401 - SATELLITE
      ?auto_226403 - DIRECTION
      ?auto_226405 - DIRECTION
      ?auto_226402 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_226404 ?auto_226401 ) ( SUPPORTS ?auto_226404 ?auto_226395 ) ( not ( = ?auto_226394 ?auto_226403 ) ) ( HAVE_IMAGE ?auto_226405 ?auto_226402 ) ( not ( = ?auto_226405 ?auto_226394 ) ) ( not ( = ?auto_226405 ?auto_226403 ) ) ( not ( = ?auto_226402 ?auto_226395 ) ) ( CALIBRATION_TARGET ?auto_226404 ?auto_226403 ) ( POWER_AVAIL ?auto_226401 ) ( POINTING ?auto_226401 ?auto_226399 ) ( not ( = ?auto_226403 ?auto_226399 ) ) ( not ( = ?auto_226394 ?auto_226399 ) ) ( not ( = ?auto_226405 ?auto_226399 ) ) ( HAVE_IMAGE ?auto_226396 ?auto_226393 ) ( HAVE_IMAGE ?auto_226397 ?auto_226398 ) ( HAVE_IMAGE ?auto_226399 ?auto_226400 ) ( not ( = ?auto_226394 ?auto_226396 ) ) ( not ( = ?auto_226394 ?auto_226397 ) ) ( not ( = ?auto_226395 ?auto_226393 ) ) ( not ( = ?auto_226395 ?auto_226398 ) ) ( not ( = ?auto_226395 ?auto_226400 ) ) ( not ( = ?auto_226396 ?auto_226397 ) ) ( not ( = ?auto_226396 ?auto_226399 ) ) ( not ( = ?auto_226396 ?auto_226403 ) ) ( not ( = ?auto_226396 ?auto_226405 ) ) ( not ( = ?auto_226393 ?auto_226398 ) ) ( not ( = ?auto_226393 ?auto_226400 ) ) ( not ( = ?auto_226393 ?auto_226402 ) ) ( not ( = ?auto_226397 ?auto_226399 ) ) ( not ( = ?auto_226397 ?auto_226403 ) ) ( not ( = ?auto_226397 ?auto_226405 ) ) ( not ( = ?auto_226398 ?auto_226400 ) ) ( not ( = ?auto_226398 ?auto_226402 ) ) ( not ( = ?auto_226400 ?auto_226402 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_226405 ?auto_226402 ?auto_226394 ?auto_226395 )
      ( GET-4IMAGE-VERIFY ?auto_226394 ?auto_226395 ?auto_226396 ?auto_226393 ?auto_226397 ?auto_226398 ?auto_226399 ?auto_226400 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_226429 - DIRECTION
      ?auto_226430 - MODE
      ?auto_226431 - DIRECTION
      ?auto_226428 - MODE
      ?auto_226432 - DIRECTION
      ?auto_226433 - MODE
      ?auto_226434 - DIRECTION
      ?auto_226435 - MODE
    )
    :vars
    (
      ?auto_226439 - INSTRUMENT
      ?auto_226436 - SATELLITE
      ?auto_226438 - DIRECTION
      ?auto_226440 - DIRECTION
      ?auto_226437 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_226439 ?auto_226436 ) ( SUPPORTS ?auto_226439 ?auto_226430 ) ( not ( = ?auto_226429 ?auto_226438 ) ) ( HAVE_IMAGE ?auto_226440 ?auto_226437 ) ( not ( = ?auto_226440 ?auto_226429 ) ) ( not ( = ?auto_226440 ?auto_226438 ) ) ( not ( = ?auto_226437 ?auto_226430 ) ) ( CALIBRATION_TARGET ?auto_226439 ?auto_226438 ) ( POWER_AVAIL ?auto_226436 ) ( POINTING ?auto_226436 ?auto_226432 ) ( not ( = ?auto_226438 ?auto_226432 ) ) ( not ( = ?auto_226429 ?auto_226432 ) ) ( not ( = ?auto_226440 ?auto_226432 ) ) ( HAVE_IMAGE ?auto_226431 ?auto_226428 ) ( HAVE_IMAGE ?auto_226432 ?auto_226433 ) ( HAVE_IMAGE ?auto_226434 ?auto_226435 ) ( not ( = ?auto_226429 ?auto_226431 ) ) ( not ( = ?auto_226429 ?auto_226434 ) ) ( not ( = ?auto_226430 ?auto_226428 ) ) ( not ( = ?auto_226430 ?auto_226433 ) ) ( not ( = ?auto_226430 ?auto_226435 ) ) ( not ( = ?auto_226431 ?auto_226432 ) ) ( not ( = ?auto_226431 ?auto_226434 ) ) ( not ( = ?auto_226431 ?auto_226438 ) ) ( not ( = ?auto_226431 ?auto_226440 ) ) ( not ( = ?auto_226428 ?auto_226433 ) ) ( not ( = ?auto_226428 ?auto_226435 ) ) ( not ( = ?auto_226428 ?auto_226437 ) ) ( not ( = ?auto_226432 ?auto_226434 ) ) ( not ( = ?auto_226433 ?auto_226435 ) ) ( not ( = ?auto_226433 ?auto_226437 ) ) ( not ( = ?auto_226434 ?auto_226438 ) ) ( not ( = ?auto_226434 ?auto_226440 ) ) ( not ( = ?auto_226435 ?auto_226437 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_226440 ?auto_226437 ?auto_226429 ?auto_226430 )
      ( GET-4IMAGE-VERIFY ?auto_226429 ?auto_226430 ?auto_226431 ?auto_226428 ?auto_226432 ?auto_226433 ?auto_226434 ?auto_226435 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_226521 - DIRECTION
      ?auto_226522 - MODE
      ?auto_226523 - DIRECTION
      ?auto_226520 - MODE
      ?auto_226524 - DIRECTION
      ?auto_226525 - MODE
      ?auto_226526 - DIRECTION
      ?auto_226527 - MODE
    )
    :vars
    (
      ?auto_226530 - INSTRUMENT
      ?auto_226528 - SATELLITE
      ?auto_226529 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_226530 ?auto_226528 ) ( SUPPORTS ?auto_226530 ?auto_226522 ) ( not ( = ?auto_226521 ?auto_226529 ) ) ( HAVE_IMAGE ?auto_226526 ?auto_226527 ) ( not ( = ?auto_226526 ?auto_226521 ) ) ( not ( = ?auto_226526 ?auto_226529 ) ) ( not ( = ?auto_226527 ?auto_226522 ) ) ( CALIBRATION_TARGET ?auto_226530 ?auto_226529 ) ( POWER_AVAIL ?auto_226528 ) ( POINTING ?auto_226528 ?auto_226523 ) ( not ( = ?auto_226529 ?auto_226523 ) ) ( not ( = ?auto_226521 ?auto_226523 ) ) ( not ( = ?auto_226526 ?auto_226523 ) ) ( HAVE_IMAGE ?auto_226523 ?auto_226520 ) ( HAVE_IMAGE ?auto_226524 ?auto_226525 ) ( not ( = ?auto_226521 ?auto_226524 ) ) ( not ( = ?auto_226522 ?auto_226520 ) ) ( not ( = ?auto_226522 ?auto_226525 ) ) ( not ( = ?auto_226523 ?auto_226524 ) ) ( not ( = ?auto_226520 ?auto_226525 ) ) ( not ( = ?auto_226520 ?auto_226527 ) ) ( not ( = ?auto_226524 ?auto_226526 ) ) ( not ( = ?auto_226524 ?auto_226529 ) ) ( not ( = ?auto_226525 ?auto_226527 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_226526 ?auto_226527 ?auto_226521 ?auto_226522 )
      ( GET-4IMAGE-VERIFY ?auto_226521 ?auto_226522 ?auto_226523 ?auto_226520 ?auto_226524 ?auto_226525 ?auto_226526 ?auto_226527 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_226978 - DIRECTION
      ?auto_226979 - MODE
      ?auto_226980 - DIRECTION
      ?auto_226977 - MODE
      ?auto_226981 - DIRECTION
      ?auto_226982 - MODE
    )
    :vars
    (
      ?auto_226983 - INSTRUMENT
      ?auto_226987 - SATELLITE
      ?auto_226984 - DIRECTION
      ?auto_226985 - DIRECTION
      ?auto_226986 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_226983 ?auto_226987 ) ( SUPPORTS ?auto_226983 ?auto_226982 ) ( not ( = ?auto_226981 ?auto_226984 ) ) ( HAVE_IMAGE ?auto_226978 ?auto_226979 ) ( not ( = ?auto_226978 ?auto_226981 ) ) ( not ( = ?auto_226978 ?auto_226984 ) ) ( not ( = ?auto_226979 ?auto_226982 ) ) ( CALIBRATION_TARGET ?auto_226983 ?auto_226984 ) ( POINTING ?auto_226987 ?auto_226985 ) ( not ( = ?auto_226984 ?auto_226985 ) ) ( not ( = ?auto_226981 ?auto_226985 ) ) ( not ( = ?auto_226978 ?auto_226985 ) ) ( ON_BOARD ?auto_226986 ?auto_226987 ) ( POWER_ON ?auto_226986 ) ( not ( = ?auto_226983 ?auto_226986 ) ) ( HAVE_IMAGE ?auto_226980 ?auto_226977 ) ( not ( = ?auto_226978 ?auto_226980 ) ) ( not ( = ?auto_226979 ?auto_226977 ) ) ( not ( = ?auto_226980 ?auto_226981 ) ) ( not ( = ?auto_226980 ?auto_226984 ) ) ( not ( = ?auto_226980 ?auto_226985 ) ) ( not ( = ?auto_226977 ?auto_226982 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_226978 ?auto_226979 ?auto_226981 ?auto_226982 )
      ( GET-3IMAGE-VERIFY ?auto_226978 ?auto_226979 ?auto_226980 ?auto_226977 ?auto_226981 ?auto_226982 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_227049 - DIRECTION
      ?auto_227050 - MODE
      ?auto_227051 - DIRECTION
      ?auto_227048 - MODE
      ?auto_227052 - DIRECTION
      ?auto_227053 - MODE
    )
    :vars
    (
      ?auto_227054 - INSTRUMENT
      ?auto_227059 - SATELLITE
      ?auto_227055 - DIRECTION
      ?auto_227060 - DIRECTION
      ?auto_227057 - MODE
      ?auto_227056 - DIRECTION
      ?auto_227058 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_227054 ?auto_227059 ) ( SUPPORTS ?auto_227054 ?auto_227053 ) ( not ( = ?auto_227052 ?auto_227055 ) ) ( HAVE_IMAGE ?auto_227060 ?auto_227057 ) ( not ( = ?auto_227060 ?auto_227052 ) ) ( not ( = ?auto_227060 ?auto_227055 ) ) ( not ( = ?auto_227057 ?auto_227053 ) ) ( CALIBRATION_TARGET ?auto_227054 ?auto_227055 ) ( POINTING ?auto_227059 ?auto_227056 ) ( not ( = ?auto_227055 ?auto_227056 ) ) ( not ( = ?auto_227052 ?auto_227056 ) ) ( not ( = ?auto_227060 ?auto_227056 ) ) ( ON_BOARD ?auto_227058 ?auto_227059 ) ( POWER_ON ?auto_227058 ) ( not ( = ?auto_227054 ?auto_227058 ) ) ( HAVE_IMAGE ?auto_227049 ?auto_227050 ) ( HAVE_IMAGE ?auto_227051 ?auto_227048 ) ( not ( = ?auto_227049 ?auto_227051 ) ) ( not ( = ?auto_227049 ?auto_227052 ) ) ( not ( = ?auto_227049 ?auto_227055 ) ) ( not ( = ?auto_227049 ?auto_227060 ) ) ( not ( = ?auto_227049 ?auto_227056 ) ) ( not ( = ?auto_227050 ?auto_227048 ) ) ( not ( = ?auto_227050 ?auto_227053 ) ) ( not ( = ?auto_227050 ?auto_227057 ) ) ( not ( = ?auto_227051 ?auto_227052 ) ) ( not ( = ?auto_227051 ?auto_227055 ) ) ( not ( = ?auto_227051 ?auto_227060 ) ) ( not ( = ?auto_227051 ?auto_227056 ) ) ( not ( = ?auto_227048 ?auto_227053 ) ) ( not ( = ?auto_227048 ?auto_227057 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_227060 ?auto_227057 ?auto_227052 ?auto_227053 )
      ( GET-3IMAGE-VERIFY ?auto_227049 ?auto_227050 ?auto_227051 ?auto_227048 ?auto_227052 ?auto_227053 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_227074 - DIRECTION
      ?auto_227075 - MODE
      ?auto_227076 - DIRECTION
      ?auto_227073 - MODE
      ?auto_227077 - DIRECTION
      ?auto_227078 - MODE
    )
    :vars
    (
      ?auto_227079 - INSTRUMENT
      ?auto_227084 - SATELLITE
      ?auto_227080 - DIRECTION
      ?auto_227085 - DIRECTION
      ?auto_227082 - MODE
      ?auto_227081 - DIRECTION
      ?auto_227083 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_227079 ?auto_227084 ) ( SUPPORTS ?auto_227079 ?auto_227073 ) ( not ( = ?auto_227076 ?auto_227080 ) ) ( HAVE_IMAGE ?auto_227085 ?auto_227082 ) ( not ( = ?auto_227085 ?auto_227076 ) ) ( not ( = ?auto_227085 ?auto_227080 ) ) ( not ( = ?auto_227082 ?auto_227073 ) ) ( CALIBRATION_TARGET ?auto_227079 ?auto_227080 ) ( POINTING ?auto_227084 ?auto_227081 ) ( not ( = ?auto_227080 ?auto_227081 ) ) ( not ( = ?auto_227076 ?auto_227081 ) ) ( not ( = ?auto_227085 ?auto_227081 ) ) ( ON_BOARD ?auto_227083 ?auto_227084 ) ( POWER_ON ?auto_227083 ) ( not ( = ?auto_227079 ?auto_227083 ) ) ( HAVE_IMAGE ?auto_227074 ?auto_227075 ) ( HAVE_IMAGE ?auto_227077 ?auto_227078 ) ( not ( = ?auto_227074 ?auto_227076 ) ) ( not ( = ?auto_227074 ?auto_227077 ) ) ( not ( = ?auto_227074 ?auto_227080 ) ) ( not ( = ?auto_227074 ?auto_227085 ) ) ( not ( = ?auto_227074 ?auto_227081 ) ) ( not ( = ?auto_227075 ?auto_227073 ) ) ( not ( = ?auto_227075 ?auto_227078 ) ) ( not ( = ?auto_227075 ?auto_227082 ) ) ( not ( = ?auto_227076 ?auto_227077 ) ) ( not ( = ?auto_227073 ?auto_227078 ) ) ( not ( = ?auto_227077 ?auto_227080 ) ) ( not ( = ?auto_227077 ?auto_227085 ) ) ( not ( = ?auto_227077 ?auto_227081 ) ) ( not ( = ?auto_227078 ?auto_227082 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_227085 ?auto_227082 ?auto_227076 ?auto_227073 )
      ( GET-3IMAGE-VERIFY ?auto_227074 ?auto_227075 ?auto_227076 ?auto_227073 ?auto_227077 ?auto_227078 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_227150 - DIRECTION
      ?auto_227151 - MODE
      ?auto_227152 - DIRECTION
      ?auto_227149 - MODE
      ?auto_227153 - DIRECTION
      ?auto_227154 - MODE
    )
    :vars
    (
      ?auto_227155 - INSTRUMENT
      ?auto_227159 - SATELLITE
      ?auto_227156 - DIRECTION
      ?auto_227160 - DIRECTION
      ?auto_227157 - MODE
      ?auto_227158 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_227155 ?auto_227159 ) ( SUPPORTS ?auto_227155 ?auto_227149 ) ( not ( = ?auto_227152 ?auto_227156 ) ) ( HAVE_IMAGE ?auto_227160 ?auto_227157 ) ( not ( = ?auto_227160 ?auto_227152 ) ) ( not ( = ?auto_227160 ?auto_227156 ) ) ( not ( = ?auto_227157 ?auto_227149 ) ) ( CALIBRATION_TARGET ?auto_227155 ?auto_227156 ) ( POINTING ?auto_227159 ?auto_227153 ) ( not ( = ?auto_227156 ?auto_227153 ) ) ( not ( = ?auto_227152 ?auto_227153 ) ) ( not ( = ?auto_227160 ?auto_227153 ) ) ( ON_BOARD ?auto_227158 ?auto_227159 ) ( POWER_ON ?auto_227158 ) ( not ( = ?auto_227155 ?auto_227158 ) ) ( HAVE_IMAGE ?auto_227150 ?auto_227151 ) ( HAVE_IMAGE ?auto_227153 ?auto_227154 ) ( not ( = ?auto_227150 ?auto_227152 ) ) ( not ( = ?auto_227150 ?auto_227153 ) ) ( not ( = ?auto_227150 ?auto_227156 ) ) ( not ( = ?auto_227150 ?auto_227160 ) ) ( not ( = ?auto_227151 ?auto_227149 ) ) ( not ( = ?auto_227151 ?auto_227154 ) ) ( not ( = ?auto_227151 ?auto_227157 ) ) ( not ( = ?auto_227149 ?auto_227154 ) ) ( not ( = ?auto_227154 ?auto_227157 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_227160 ?auto_227157 ?auto_227152 ?auto_227149 )
      ( GET-3IMAGE-VERIFY ?auto_227150 ?auto_227151 ?auto_227152 ?auto_227149 ?auto_227153 ?auto_227154 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_227223 - DIRECTION
      ?auto_227224 - MODE
      ?auto_227225 - DIRECTION
      ?auto_227222 - MODE
      ?auto_227226 - DIRECTION
      ?auto_227227 - MODE
    )
    :vars
    (
      ?auto_227228 - INSTRUMENT
      ?auto_227233 - SATELLITE
      ?auto_227229 - DIRECTION
      ?auto_227234 - DIRECTION
      ?auto_227231 - MODE
      ?auto_227230 - DIRECTION
      ?auto_227232 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_227228 ?auto_227233 ) ( SUPPORTS ?auto_227228 ?auto_227224 ) ( not ( = ?auto_227223 ?auto_227229 ) ) ( HAVE_IMAGE ?auto_227234 ?auto_227231 ) ( not ( = ?auto_227234 ?auto_227223 ) ) ( not ( = ?auto_227234 ?auto_227229 ) ) ( not ( = ?auto_227231 ?auto_227224 ) ) ( CALIBRATION_TARGET ?auto_227228 ?auto_227229 ) ( POINTING ?auto_227233 ?auto_227230 ) ( not ( = ?auto_227229 ?auto_227230 ) ) ( not ( = ?auto_227223 ?auto_227230 ) ) ( not ( = ?auto_227234 ?auto_227230 ) ) ( ON_BOARD ?auto_227232 ?auto_227233 ) ( POWER_ON ?auto_227232 ) ( not ( = ?auto_227228 ?auto_227232 ) ) ( HAVE_IMAGE ?auto_227225 ?auto_227222 ) ( HAVE_IMAGE ?auto_227226 ?auto_227227 ) ( not ( = ?auto_227223 ?auto_227225 ) ) ( not ( = ?auto_227223 ?auto_227226 ) ) ( not ( = ?auto_227224 ?auto_227222 ) ) ( not ( = ?auto_227224 ?auto_227227 ) ) ( not ( = ?auto_227225 ?auto_227226 ) ) ( not ( = ?auto_227225 ?auto_227229 ) ) ( not ( = ?auto_227225 ?auto_227234 ) ) ( not ( = ?auto_227225 ?auto_227230 ) ) ( not ( = ?auto_227222 ?auto_227227 ) ) ( not ( = ?auto_227222 ?auto_227231 ) ) ( not ( = ?auto_227226 ?auto_227229 ) ) ( not ( = ?auto_227226 ?auto_227234 ) ) ( not ( = ?auto_227226 ?auto_227230 ) ) ( not ( = ?auto_227227 ?auto_227231 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_227234 ?auto_227231 ?auto_227223 ?auto_227224 )
      ( GET-3IMAGE-VERIFY ?auto_227223 ?auto_227224 ?auto_227225 ?auto_227222 ?auto_227226 ?auto_227227 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_227271 - DIRECTION
      ?auto_227272 - MODE
      ?auto_227273 - DIRECTION
      ?auto_227270 - MODE
      ?auto_227274 - DIRECTION
      ?auto_227275 - MODE
    )
    :vars
    (
      ?auto_227276 - INSTRUMENT
      ?auto_227280 - SATELLITE
      ?auto_227277 - DIRECTION
      ?auto_227281 - DIRECTION
      ?auto_227278 - MODE
      ?auto_227279 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_227276 ?auto_227280 ) ( SUPPORTS ?auto_227276 ?auto_227272 ) ( not ( = ?auto_227271 ?auto_227277 ) ) ( HAVE_IMAGE ?auto_227281 ?auto_227278 ) ( not ( = ?auto_227281 ?auto_227271 ) ) ( not ( = ?auto_227281 ?auto_227277 ) ) ( not ( = ?auto_227278 ?auto_227272 ) ) ( CALIBRATION_TARGET ?auto_227276 ?auto_227277 ) ( POINTING ?auto_227280 ?auto_227273 ) ( not ( = ?auto_227277 ?auto_227273 ) ) ( not ( = ?auto_227271 ?auto_227273 ) ) ( not ( = ?auto_227281 ?auto_227273 ) ) ( ON_BOARD ?auto_227279 ?auto_227280 ) ( POWER_ON ?auto_227279 ) ( not ( = ?auto_227276 ?auto_227279 ) ) ( HAVE_IMAGE ?auto_227273 ?auto_227270 ) ( HAVE_IMAGE ?auto_227274 ?auto_227275 ) ( not ( = ?auto_227271 ?auto_227274 ) ) ( not ( = ?auto_227272 ?auto_227270 ) ) ( not ( = ?auto_227272 ?auto_227275 ) ) ( not ( = ?auto_227273 ?auto_227274 ) ) ( not ( = ?auto_227270 ?auto_227275 ) ) ( not ( = ?auto_227270 ?auto_227278 ) ) ( not ( = ?auto_227274 ?auto_227277 ) ) ( not ( = ?auto_227274 ?auto_227281 ) ) ( not ( = ?auto_227275 ?auto_227278 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_227281 ?auto_227278 ?auto_227271 ?auto_227272 )
      ( GET-3IMAGE-VERIFY ?auto_227271 ?auto_227272 ?auto_227273 ?auto_227270 ?auto_227274 ?auto_227275 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_227344 - DIRECTION
      ?auto_227345 - MODE
      ?auto_227346 - DIRECTION
      ?auto_227343 - MODE
      ?auto_227347 - DIRECTION
      ?auto_227348 - MODE
      ?auto_227349 - DIRECTION
      ?auto_227350 - MODE
    )
    :vars
    (
      ?auto_227351 - INSTRUMENT
      ?auto_227355 - SATELLITE
      ?auto_227352 - DIRECTION
      ?auto_227353 - DIRECTION
      ?auto_227354 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_227351 ?auto_227355 ) ( SUPPORTS ?auto_227351 ?auto_227350 ) ( not ( = ?auto_227349 ?auto_227352 ) ) ( HAVE_IMAGE ?auto_227347 ?auto_227343 ) ( not ( = ?auto_227347 ?auto_227349 ) ) ( not ( = ?auto_227347 ?auto_227352 ) ) ( not ( = ?auto_227343 ?auto_227350 ) ) ( CALIBRATION_TARGET ?auto_227351 ?auto_227352 ) ( POINTING ?auto_227355 ?auto_227353 ) ( not ( = ?auto_227352 ?auto_227353 ) ) ( not ( = ?auto_227349 ?auto_227353 ) ) ( not ( = ?auto_227347 ?auto_227353 ) ) ( ON_BOARD ?auto_227354 ?auto_227355 ) ( POWER_ON ?auto_227354 ) ( not ( = ?auto_227351 ?auto_227354 ) ) ( HAVE_IMAGE ?auto_227344 ?auto_227345 ) ( HAVE_IMAGE ?auto_227346 ?auto_227343 ) ( HAVE_IMAGE ?auto_227347 ?auto_227348 ) ( not ( = ?auto_227344 ?auto_227346 ) ) ( not ( = ?auto_227344 ?auto_227347 ) ) ( not ( = ?auto_227344 ?auto_227349 ) ) ( not ( = ?auto_227344 ?auto_227352 ) ) ( not ( = ?auto_227344 ?auto_227353 ) ) ( not ( = ?auto_227345 ?auto_227343 ) ) ( not ( = ?auto_227345 ?auto_227348 ) ) ( not ( = ?auto_227345 ?auto_227350 ) ) ( not ( = ?auto_227346 ?auto_227347 ) ) ( not ( = ?auto_227346 ?auto_227349 ) ) ( not ( = ?auto_227346 ?auto_227352 ) ) ( not ( = ?auto_227346 ?auto_227353 ) ) ( not ( = ?auto_227343 ?auto_227348 ) ) ( not ( = ?auto_227348 ?auto_227350 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_227347 ?auto_227343 ?auto_227349 ?auto_227350 )
      ( GET-4IMAGE-VERIFY ?auto_227344 ?auto_227345 ?auto_227346 ?auto_227343 ?auto_227347 ?auto_227348 ?auto_227349 ?auto_227350 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_227357 - DIRECTION
      ?auto_227358 - MODE
      ?auto_227359 - DIRECTION
      ?auto_227356 - MODE
      ?auto_227360 - DIRECTION
      ?auto_227361 - MODE
      ?auto_227362 - DIRECTION
      ?auto_227363 - MODE
    )
    :vars
    (
      ?auto_227364 - INSTRUMENT
      ?auto_227368 - SATELLITE
      ?auto_227365 - DIRECTION
      ?auto_227366 - DIRECTION
      ?auto_227367 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_227364 ?auto_227368 ) ( SUPPORTS ?auto_227364 ?auto_227363 ) ( not ( = ?auto_227362 ?auto_227365 ) ) ( HAVE_IMAGE ?auto_227359 ?auto_227358 ) ( not ( = ?auto_227359 ?auto_227362 ) ) ( not ( = ?auto_227359 ?auto_227365 ) ) ( not ( = ?auto_227358 ?auto_227363 ) ) ( CALIBRATION_TARGET ?auto_227364 ?auto_227365 ) ( POINTING ?auto_227368 ?auto_227366 ) ( not ( = ?auto_227365 ?auto_227366 ) ) ( not ( = ?auto_227362 ?auto_227366 ) ) ( not ( = ?auto_227359 ?auto_227366 ) ) ( ON_BOARD ?auto_227367 ?auto_227368 ) ( POWER_ON ?auto_227367 ) ( not ( = ?auto_227364 ?auto_227367 ) ) ( HAVE_IMAGE ?auto_227357 ?auto_227358 ) ( HAVE_IMAGE ?auto_227359 ?auto_227356 ) ( HAVE_IMAGE ?auto_227360 ?auto_227361 ) ( not ( = ?auto_227357 ?auto_227359 ) ) ( not ( = ?auto_227357 ?auto_227360 ) ) ( not ( = ?auto_227357 ?auto_227362 ) ) ( not ( = ?auto_227357 ?auto_227365 ) ) ( not ( = ?auto_227357 ?auto_227366 ) ) ( not ( = ?auto_227358 ?auto_227356 ) ) ( not ( = ?auto_227358 ?auto_227361 ) ) ( not ( = ?auto_227359 ?auto_227360 ) ) ( not ( = ?auto_227356 ?auto_227361 ) ) ( not ( = ?auto_227356 ?auto_227363 ) ) ( not ( = ?auto_227360 ?auto_227362 ) ) ( not ( = ?auto_227360 ?auto_227365 ) ) ( not ( = ?auto_227360 ?auto_227366 ) ) ( not ( = ?auto_227361 ?auto_227363 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_227359 ?auto_227358 ?auto_227362 ?auto_227363 )
      ( GET-4IMAGE-VERIFY ?auto_227357 ?auto_227358 ?auto_227359 ?auto_227356 ?auto_227360 ?auto_227361 ?auto_227362 ?auto_227363 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_227370 - DIRECTION
      ?auto_227371 - MODE
      ?auto_227372 - DIRECTION
      ?auto_227369 - MODE
      ?auto_227373 - DIRECTION
      ?auto_227374 - MODE
      ?auto_227375 - DIRECTION
      ?auto_227376 - MODE
    )
    :vars
    (
      ?auto_227377 - INSTRUMENT
      ?auto_227380 - SATELLITE
      ?auto_227378 - DIRECTION
      ?auto_227379 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_227377 ?auto_227380 ) ( SUPPORTS ?auto_227377 ?auto_227376 ) ( not ( = ?auto_227375 ?auto_227378 ) ) ( HAVE_IMAGE ?auto_227372 ?auto_227371 ) ( not ( = ?auto_227372 ?auto_227375 ) ) ( not ( = ?auto_227372 ?auto_227378 ) ) ( not ( = ?auto_227371 ?auto_227376 ) ) ( CALIBRATION_TARGET ?auto_227377 ?auto_227378 ) ( POINTING ?auto_227380 ?auto_227373 ) ( not ( = ?auto_227378 ?auto_227373 ) ) ( not ( = ?auto_227375 ?auto_227373 ) ) ( not ( = ?auto_227372 ?auto_227373 ) ) ( ON_BOARD ?auto_227379 ?auto_227380 ) ( POWER_ON ?auto_227379 ) ( not ( = ?auto_227377 ?auto_227379 ) ) ( HAVE_IMAGE ?auto_227370 ?auto_227371 ) ( HAVE_IMAGE ?auto_227372 ?auto_227369 ) ( HAVE_IMAGE ?auto_227373 ?auto_227374 ) ( not ( = ?auto_227370 ?auto_227372 ) ) ( not ( = ?auto_227370 ?auto_227373 ) ) ( not ( = ?auto_227370 ?auto_227375 ) ) ( not ( = ?auto_227370 ?auto_227378 ) ) ( not ( = ?auto_227371 ?auto_227369 ) ) ( not ( = ?auto_227371 ?auto_227374 ) ) ( not ( = ?auto_227369 ?auto_227374 ) ) ( not ( = ?auto_227369 ?auto_227376 ) ) ( not ( = ?auto_227374 ?auto_227376 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_227372 ?auto_227371 ?auto_227375 ?auto_227376 )
      ( GET-4IMAGE-VERIFY ?auto_227370 ?auto_227371 ?auto_227372 ?auto_227369 ?auto_227373 ?auto_227374 ?auto_227375 ?auto_227376 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_227395 - DIRECTION
      ?auto_227396 - MODE
      ?auto_227397 - DIRECTION
      ?auto_227394 - MODE
      ?auto_227398 - DIRECTION
      ?auto_227399 - MODE
      ?auto_227400 - DIRECTION
      ?auto_227401 - MODE
    )
    :vars
    (
      ?auto_227402 - INSTRUMENT
      ?auto_227406 - SATELLITE
      ?auto_227403 - DIRECTION
      ?auto_227404 - DIRECTION
      ?auto_227405 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_227402 ?auto_227406 ) ( SUPPORTS ?auto_227402 ?auto_227399 ) ( not ( = ?auto_227398 ?auto_227403 ) ) ( HAVE_IMAGE ?auto_227397 ?auto_227396 ) ( not ( = ?auto_227397 ?auto_227398 ) ) ( not ( = ?auto_227397 ?auto_227403 ) ) ( not ( = ?auto_227396 ?auto_227399 ) ) ( CALIBRATION_TARGET ?auto_227402 ?auto_227403 ) ( POINTING ?auto_227406 ?auto_227404 ) ( not ( = ?auto_227403 ?auto_227404 ) ) ( not ( = ?auto_227398 ?auto_227404 ) ) ( not ( = ?auto_227397 ?auto_227404 ) ) ( ON_BOARD ?auto_227405 ?auto_227406 ) ( POWER_ON ?auto_227405 ) ( not ( = ?auto_227402 ?auto_227405 ) ) ( HAVE_IMAGE ?auto_227395 ?auto_227396 ) ( HAVE_IMAGE ?auto_227397 ?auto_227394 ) ( HAVE_IMAGE ?auto_227400 ?auto_227401 ) ( not ( = ?auto_227395 ?auto_227397 ) ) ( not ( = ?auto_227395 ?auto_227398 ) ) ( not ( = ?auto_227395 ?auto_227400 ) ) ( not ( = ?auto_227395 ?auto_227403 ) ) ( not ( = ?auto_227395 ?auto_227404 ) ) ( not ( = ?auto_227396 ?auto_227394 ) ) ( not ( = ?auto_227396 ?auto_227401 ) ) ( not ( = ?auto_227397 ?auto_227400 ) ) ( not ( = ?auto_227394 ?auto_227399 ) ) ( not ( = ?auto_227394 ?auto_227401 ) ) ( not ( = ?auto_227398 ?auto_227400 ) ) ( not ( = ?auto_227399 ?auto_227401 ) ) ( not ( = ?auto_227400 ?auto_227403 ) ) ( not ( = ?auto_227400 ?auto_227404 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_227397 ?auto_227396 ?auto_227398 ?auto_227399 )
      ( GET-4IMAGE-VERIFY ?auto_227395 ?auto_227396 ?auto_227397 ?auto_227394 ?auto_227398 ?auto_227399 ?auto_227400 ?auto_227401 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_227433 - DIRECTION
      ?auto_227434 - MODE
      ?auto_227435 - DIRECTION
      ?auto_227432 - MODE
      ?auto_227436 - DIRECTION
      ?auto_227437 - MODE
      ?auto_227438 - DIRECTION
      ?auto_227439 - MODE
    )
    :vars
    (
      ?auto_227440 - INSTRUMENT
      ?auto_227444 - SATELLITE
      ?auto_227441 - DIRECTION
      ?auto_227442 - DIRECTION
      ?auto_227443 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_227440 ?auto_227444 ) ( SUPPORTS ?auto_227440 ?auto_227439 ) ( not ( = ?auto_227438 ?auto_227441 ) ) ( HAVE_IMAGE ?auto_227433 ?auto_227437 ) ( not ( = ?auto_227433 ?auto_227438 ) ) ( not ( = ?auto_227433 ?auto_227441 ) ) ( not ( = ?auto_227437 ?auto_227439 ) ) ( CALIBRATION_TARGET ?auto_227440 ?auto_227441 ) ( POINTING ?auto_227444 ?auto_227442 ) ( not ( = ?auto_227441 ?auto_227442 ) ) ( not ( = ?auto_227438 ?auto_227442 ) ) ( not ( = ?auto_227433 ?auto_227442 ) ) ( ON_BOARD ?auto_227443 ?auto_227444 ) ( POWER_ON ?auto_227443 ) ( not ( = ?auto_227440 ?auto_227443 ) ) ( HAVE_IMAGE ?auto_227433 ?auto_227434 ) ( HAVE_IMAGE ?auto_227435 ?auto_227432 ) ( HAVE_IMAGE ?auto_227436 ?auto_227437 ) ( not ( = ?auto_227433 ?auto_227435 ) ) ( not ( = ?auto_227433 ?auto_227436 ) ) ( not ( = ?auto_227434 ?auto_227432 ) ) ( not ( = ?auto_227434 ?auto_227437 ) ) ( not ( = ?auto_227434 ?auto_227439 ) ) ( not ( = ?auto_227435 ?auto_227436 ) ) ( not ( = ?auto_227435 ?auto_227438 ) ) ( not ( = ?auto_227435 ?auto_227441 ) ) ( not ( = ?auto_227435 ?auto_227442 ) ) ( not ( = ?auto_227432 ?auto_227437 ) ) ( not ( = ?auto_227432 ?auto_227439 ) ) ( not ( = ?auto_227436 ?auto_227438 ) ) ( not ( = ?auto_227436 ?auto_227441 ) ) ( not ( = ?auto_227436 ?auto_227442 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_227433 ?auto_227437 ?auto_227438 ?auto_227439 )
      ( GET-4IMAGE-VERIFY ?auto_227433 ?auto_227434 ?auto_227435 ?auto_227432 ?auto_227436 ?auto_227437 ?auto_227438 ?auto_227439 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_227471 - DIRECTION
      ?auto_227472 - MODE
      ?auto_227473 - DIRECTION
      ?auto_227470 - MODE
      ?auto_227474 - DIRECTION
      ?auto_227475 - MODE
      ?auto_227476 - DIRECTION
      ?auto_227477 - MODE
    )
    :vars
    (
      ?auto_227478 - INSTRUMENT
      ?auto_227482 - SATELLITE
      ?auto_227479 - DIRECTION
      ?auto_227480 - DIRECTION
      ?auto_227481 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_227478 ?auto_227482 ) ( SUPPORTS ?auto_227478 ?auto_227475 ) ( not ( = ?auto_227474 ?auto_227479 ) ) ( HAVE_IMAGE ?auto_227476 ?auto_227477 ) ( not ( = ?auto_227476 ?auto_227474 ) ) ( not ( = ?auto_227476 ?auto_227479 ) ) ( not ( = ?auto_227477 ?auto_227475 ) ) ( CALIBRATION_TARGET ?auto_227478 ?auto_227479 ) ( POINTING ?auto_227482 ?auto_227480 ) ( not ( = ?auto_227479 ?auto_227480 ) ) ( not ( = ?auto_227474 ?auto_227480 ) ) ( not ( = ?auto_227476 ?auto_227480 ) ) ( ON_BOARD ?auto_227481 ?auto_227482 ) ( POWER_ON ?auto_227481 ) ( not ( = ?auto_227478 ?auto_227481 ) ) ( HAVE_IMAGE ?auto_227471 ?auto_227472 ) ( HAVE_IMAGE ?auto_227473 ?auto_227470 ) ( not ( = ?auto_227471 ?auto_227473 ) ) ( not ( = ?auto_227471 ?auto_227474 ) ) ( not ( = ?auto_227471 ?auto_227476 ) ) ( not ( = ?auto_227471 ?auto_227479 ) ) ( not ( = ?auto_227471 ?auto_227480 ) ) ( not ( = ?auto_227472 ?auto_227470 ) ) ( not ( = ?auto_227472 ?auto_227475 ) ) ( not ( = ?auto_227472 ?auto_227477 ) ) ( not ( = ?auto_227473 ?auto_227474 ) ) ( not ( = ?auto_227473 ?auto_227476 ) ) ( not ( = ?auto_227473 ?auto_227479 ) ) ( not ( = ?auto_227473 ?auto_227480 ) ) ( not ( = ?auto_227470 ?auto_227475 ) ) ( not ( = ?auto_227470 ?auto_227477 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_227476 ?auto_227477 ?auto_227474 ?auto_227475 )
      ( GET-4IMAGE-VERIFY ?auto_227471 ?auto_227472 ?auto_227473 ?auto_227470 ?auto_227474 ?auto_227475 ?auto_227476 ?auto_227477 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_227484 - DIRECTION
      ?auto_227485 - MODE
      ?auto_227486 - DIRECTION
      ?auto_227483 - MODE
      ?auto_227487 - DIRECTION
      ?auto_227488 - MODE
      ?auto_227489 - DIRECTION
      ?auto_227490 - MODE
    )
    :vars
    (
      ?auto_227491 - INSTRUMENT
      ?auto_227495 - SATELLITE
      ?auto_227492 - DIRECTION
      ?auto_227493 - DIRECTION
      ?auto_227494 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_227491 ?auto_227495 ) ( SUPPORTS ?auto_227491 ?auto_227488 ) ( not ( = ?auto_227487 ?auto_227492 ) ) ( HAVE_IMAGE ?auto_227484 ?auto_227485 ) ( not ( = ?auto_227484 ?auto_227487 ) ) ( not ( = ?auto_227484 ?auto_227492 ) ) ( not ( = ?auto_227485 ?auto_227488 ) ) ( CALIBRATION_TARGET ?auto_227491 ?auto_227492 ) ( POINTING ?auto_227495 ?auto_227493 ) ( not ( = ?auto_227492 ?auto_227493 ) ) ( not ( = ?auto_227487 ?auto_227493 ) ) ( not ( = ?auto_227484 ?auto_227493 ) ) ( ON_BOARD ?auto_227494 ?auto_227495 ) ( POWER_ON ?auto_227494 ) ( not ( = ?auto_227491 ?auto_227494 ) ) ( HAVE_IMAGE ?auto_227486 ?auto_227483 ) ( HAVE_IMAGE ?auto_227489 ?auto_227490 ) ( not ( = ?auto_227484 ?auto_227486 ) ) ( not ( = ?auto_227484 ?auto_227489 ) ) ( not ( = ?auto_227485 ?auto_227483 ) ) ( not ( = ?auto_227485 ?auto_227490 ) ) ( not ( = ?auto_227486 ?auto_227487 ) ) ( not ( = ?auto_227486 ?auto_227489 ) ) ( not ( = ?auto_227486 ?auto_227492 ) ) ( not ( = ?auto_227486 ?auto_227493 ) ) ( not ( = ?auto_227483 ?auto_227488 ) ) ( not ( = ?auto_227483 ?auto_227490 ) ) ( not ( = ?auto_227487 ?auto_227489 ) ) ( not ( = ?auto_227488 ?auto_227490 ) ) ( not ( = ?auto_227489 ?auto_227492 ) ) ( not ( = ?auto_227489 ?auto_227493 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_227484 ?auto_227485 ?auto_227487 ?auto_227488 )
      ( GET-4IMAGE-VERIFY ?auto_227484 ?auto_227485 ?auto_227486 ?auto_227483 ?auto_227487 ?auto_227488 ?auto_227489 ?auto_227490 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_227497 - DIRECTION
      ?auto_227498 - MODE
      ?auto_227499 - DIRECTION
      ?auto_227496 - MODE
      ?auto_227500 - DIRECTION
      ?auto_227501 - MODE
      ?auto_227502 - DIRECTION
      ?auto_227503 - MODE
    )
    :vars
    (
      ?auto_227504 - INSTRUMENT
      ?auto_227507 - SATELLITE
      ?auto_227505 - DIRECTION
      ?auto_227506 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_227504 ?auto_227507 ) ( SUPPORTS ?auto_227504 ?auto_227501 ) ( not ( = ?auto_227500 ?auto_227505 ) ) ( HAVE_IMAGE ?auto_227497 ?auto_227498 ) ( not ( = ?auto_227497 ?auto_227500 ) ) ( not ( = ?auto_227497 ?auto_227505 ) ) ( not ( = ?auto_227498 ?auto_227501 ) ) ( CALIBRATION_TARGET ?auto_227504 ?auto_227505 ) ( POINTING ?auto_227507 ?auto_227502 ) ( not ( = ?auto_227505 ?auto_227502 ) ) ( not ( = ?auto_227500 ?auto_227502 ) ) ( not ( = ?auto_227497 ?auto_227502 ) ) ( ON_BOARD ?auto_227506 ?auto_227507 ) ( POWER_ON ?auto_227506 ) ( not ( = ?auto_227504 ?auto_227506 ) ) ( HAVE_IMAGE ?auto_227499 ?auto_227496 ) ( HAVE_IMAGE ?auto_227502 ?auto_227503 ) ( not ( = ?auto_227497 ?auto_227499 ) ) ( not ( = ?auto_227498 ?auto_227496 ) ) ( not ( = ?auto_227498 ?auto_227503 ) ) ( not ( = ?auto_227499 ?auto_227500 ) ) ( not ( = ?auto_227499 ?auto_227502 ) ) ( not ( = ?auto_227499 ?auto_227505 ) ) ( not ( = ?auto_227496 ?auto_227501 ) ) ( not ( = ?auto_227496 ?auto_227503 ) ) ( not ( = ?auto_227501 ?auto_227503 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_227497 ?auto_227498 ?auto_227500 ?auto_227501 )
      ( GET-4IMAGE-VERIFY ?auto_227497 ?auto_227498 ?auto_227499 ?auto_227496 ?auto_227500 ?auto_227501 ?auto_227502 ?auto_227503 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_227542 - DIRECTION
      ?auto_227543 - MODE
      ?auto_227544 - DIRECTION
      ?auto_227541 - MODE
      ?auto_227545 - DIRECTION
      ?auto_227546 - MODE
      ?auto_227547 - DIRECTION
      ?auto_227548 - MODE
    )
    :vars
    (
      ?auto_227549 - INSTRUMENT
      ?auto_227552 - SATELLITE
      ?auto_227550 - DIRECTION
      ?auto_227551 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_227549 ?auto_227552 ) ( SUPPORTS ?auto_227549 ?auto_227548 ) ( not ( = ?auto_227547 ?auto_227550 ) ) ( HAVE_IMAGE ?auto_227542 ?auto_227543 ) ( not ( = ?auto_227542 ?auto_227547 ) ) ( not ( = ?auto_227542 ?auto_227550 ) ) ( not ( = ?auto_227543 ?auto_227548 ) ) ( CALIBRATION_TARGET ?auto_227549 ?auto_227550 ) ( POINTING ?auto_227552 ?auto_227544 ) ( not ( = ?auto_227550 ?auto_227544 ) ) ( not ( = ?auto_227547 ?auto_227544 ) ) ( not ( = ?auto_227542 ?auto_227544 ) ) ( ON_BOARD ?auto_227551 ?auto_227552 ) ( POWER_ON ?auto_227551 ) ( not ( = ?auto_227549 ?auto_227551 ) ) ( HAVE_IMAGE ?auto_227544 ?auto_227541 ) ( HAVE_IMAGE ?auto_227545 ?auto_227546 ) ( not ( = ?auto_227542 ?auto_227545 ) ) ( not ( = ?auto_227543 ?auto_227541 ) ) ( not ( = ?auto_227543 ?auto_227546 ) ) ( not ( = ?auto_227544 ?auto_227545 ) ) ( not ( = ?auto_227541 ?auto_227546 ) ) ( not ( = ?auto_227541 ?auto_227548 ) ) ( not ( = ?auto_227545 ?auto_227547 ) ) ( not ( = ?auto_227545 ?auto_227550 ) ) ( not ( = ?auto_227546 ?auto_227548 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_227542 ?auto_227543 ?auto_227547 ?auto_227548 )
      ( GET-4IMAGE-VERIFY ?auto_227542 ?auto_227543 ?auto_227544 ?auto_227541 ?auto_227545 ?auto_227546 ?auto_227547 ?auto_227548 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_227554 - DIRECTION
      ?auto_227555 - MODE
      ?auto_227556 - DIRECTION
      ?auto_227553 - MODE
      ?auto_227557 - DIRECTION
      ?auto_227558 - MODE
      ?auto_227559 - DIRECTION
      ?auto_227560 - MODE
    )
    :vars
    (
      ?auto_227561 - INSTRUMENT
      ?auto_227564 - SATELLITE
      ?auto_227562 - DIRECTION
      ?auto_227563 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_227561 ?auto_227564 ) ( SUPPORTS ?auto_227561 ?auto_227558 ) ( not ( = ?auto_227557 ?auto_227562 ) ) ( HAVE_IMAGE ?auto_227554 ?auto_227560 ) ( not ( = ?auto_227554 ?auto_227557 ) ) ( not ( = ?auto_227554 ?auto_227562 ) ) ( not ( = ?auto_227560 ?auto_227558 ) ) ( CALIBRATION_TARGET ?auto_227561 ?auto_227562 ) ( POINTING ?auto_227564 ?auto_227556 ) ( not ( = ?auto_227562 ?auto_227556 ) ) ( not ( = ?auto_227557 ?auto_227556 ) ) ( not ( = ?auto_227554 ?auto_227556 ) ) ( ON_BOARD ?auto_227563 ?auto_227564 ) ( POWER_ON ?auto_227563 ) ( not ( = ?auto_227561 ?auto_227563 ) ) ( HAVE_IMAGE ?auto_227554 ?auto_227555 ) ( HAVE_IMAGE ?auto_227556 ?auto_227553 ) ( HAVE_IMAGE ?auto_227559 ?auto_227560 ) ( not ( = ?auto_227554 ?auto_227559 ) ) ( not ( = ?auto_227555 ?auto_227553 ) ) ( not ( = ?auto_227555 ?auto_227558 ) ) ( not ( = ?auto_227555 ?auto_227560 ) ) ( not ( = ?auto_227556 ?auto_227559 ) ) ( not ( = ?auto_227553 ?auto_227558 ) ) ( not ( = ?auto_227553 ?auto_227560 ) ) ( not ( = ?auto_227557 ?auto_227559 ) ) ( not ( = ?auto_227559 ?auto_227562 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_227554 ?auto_227560 ?auto_227557 ?auto_227558 )
      ( GET-4IMAGE-VERIFY ?auto_227554 ?auto_227555 ?auto_227556 ?auto_227553 ?auto_227557 ?auto_227558 ?auto_227559 ?auto_227560 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_227602 - DIRECTION
      ?auto_227603 - MODE
      ?auto_227604 - DIRECTION
      ?auto_227601 - MODE
      ?auto_227605 - DIRECTION
      ?auto_227606 - MODE
      ?auto_227607 - DIRECTION
      ?auto_227608 - MODE
    )
    :vars
    (
      ?auto_227609 - INSTRUMENT
      ?auto_227613 - SATELLITE
      ?auto_227610 - DIRECTION
      ?auto_227611 - DIRECTION
      ?auto_227612 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_227609 ?auto_227613 ) ( SUPPORTS ?auto_227609 ?auto_227601 ) ( not ( = ?auto_227604 ?auto_227610 ) ) ( HAVE_IMAGE ?auto_227605 ?auto_227608 ) ( not ( = ?auto_227605 ?auto_227604 ) ) ( not ( = ?auto_227605 ?auto_227610 ) ) ( not ( = ?auto_227608 ?auto_227601 ) ) ( CALIBRATION_TARGET ?auto_227609 ?auto_227610 ) ( POINTING ?auto_227613 ?auto_227611 ) ( not ( = ?auto_227610 ?auto_227611 ) ) ( not ( = ?auto_227604 ?auto_227611 ) ) ( not ( = ?auto_227605 ?auto_227611 ) ) ( ON_BOARD ?auto_227612 ?auto_227613 ) ( POWER_ON ?auto_227612 ) ( not ( = ?auto_227609 ?auto_227612 ) ) ( HAVE_IMAGE ?auto_227602 ?auto_227603 ) ( HAVE_IMAGE ?auto_227605 ?auto_227606 ) ( HAVE_IMAGE ?auto_227607 ?auto_227608 ) ( not ( = ?auto_227602 ?auto_227604 ) ) ( not ( = ?auto_227602 ?auto_227605 ) ) ( not ( = ?auto_227602 ?auto_227607 ) ) ( not ( = ?auto_227602 ?auto_227610 ) ) ( not ( = ?auto_227602 ?auto_227611 ) ) ( not ( = ?auto_227603 ?auto_227601 ) ) ( not ( = ?auto_227603 ?auto_227606 ) ) ( not ( = ?auto_227603 ?auto_227608 ) ) ( not ( = ?auto_227604 ?auto_227607 ) ) ( not ( = ?auto_227601 ?auto_227606 ) ) ( not ( = ?auto_227605 ?auto_227607 ) ) ( not ( = ?auto_227606 ?auto_227608 ) ) ( not ( = ?auto_227607 ?auto_227610 ) ) ( not ( = ?auto_227607 ?auto_227611 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_227605 ?auto_227608 ?auto_227604 ?auto_227601 )
      ( GET-4IMAGE-VERIFY ?auto_227602 ?auto_227603 ?auto_227604 ?auto_227601 ?auto_227605 ?auto_227606 ?auto_227607 ?auto_227608 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_227615 - DIRECTION
      ?auto_227616 - MODE
      ?auto_227617 - DIRECTION
      ?auto_227614 - MODE
      ?auto_227618 - DIRECTION
      ?auto_227619 - MODE
      ?auto_227620 - DIRECTION
      ?auto_227621 - MODE
    )
    :vars
    (
      ?auto_227622 - INSTRUMENT
      ?auto_227626 - SATELLITE
      ?auto_227623 - DIRECTION
      ?auto_227624 - DIRECTION
      ?auto_227625 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_227622 ?auto_227626 ) ( SUPPORTS ?auto_227622 ?auto_227614 ) ( not ( = ?auto_227617 ?auto_227623 ) ) ( HAVE_IMAGE ?auto_227618 ?auto_227616 ) ( not ( = ?auto_227618 ?auto_227617 ) ) ( not ( = ?auto_227618 ?auto_227623 ) ) ( not ( = ?auto_227616 ?auto_227614 ) ) ( CALIBRATION_TARGET ?auto_227622 ?auto_227623 ) ( POINTING ?auto_227626 ?auto_227624 ) ( not ( = ?auto_227623 ?auto_227624 ) ) ( not ( = ?auto_227617 ?auto_227624 ) ) ( not ( = ?auto_227618 ?auto_227624 ) ) ( ON_BOARD ?auto_227625 ?auto_227626 ) ( POWER_ON ?auto_227625 ) ( not ( = ?auto_227622 ?auto_227625 ) ) ( HAVE_IMAGE ?auto_227615 ?auto_227616 ) ( HAVE_IMAGE ?auto_227618 ?auto_227619 ) ( HAVE_IMAGE ?auto_227620 ?auto_227621 ) ( not ( = ?auto_227615 ?auto_227617 ) ) ( not ( = ?auto_227615 ?auto_227618 ) ) ( not ( = ?auto_227615 ?auto_227620 ) ) ( not ( = ?auto_227615 ?auto_227623 ) ) ( not ( = ?auto_227615 ?auto_227624 ) ) ( not ( = ?auto_227616 ?auto_227619 ) ) ( not ( = ?auto_227616 ?auto_227621 ) ) ( not ( = ?auto_227617 ?auto_227620 ) ) ( not ( = ?auto_227614 ?auto_227619 ) ) ( not ( = ?auto_227614 ?auto_227621 ) ) ( not ( = ?auto_227618 ?auto_227620 ) ) ( not ( = ?auto_227619 ?auto_227621 ) ) ( not ( = ?auto_227620 ?auto_227623 ) ) ( not ( = ?auto_227620 ?auto_227624 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_227618 ?auto_227616 ?auto_227617 ?auto_227614 )
      ( GET-4IMAGE-VERIFY ?auto_227615 ?auto_227616 ?auto_227617 ?auto_227614 ?auto_227618 ?auto_227619 ?auto_227620 ?auto_227621 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_227700 - DIRECTION
      ?auto_227701 - MODE
      ?auto_227702 - DIRECTION
      ?auto_227699 - MODE
      ?auto_227703 - DIRECTION
      ?auto_227704 - MODE
      ?auto_227705 - DIRECTION
      ?auto_227706 - MODE
    )
    :vars
    (
      ?auto_227707 - INSTRUMENT
      ?auto_227710 - SATELLITE
      ?auto_227708 - DIRECTION
      ?auto_227709 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_227707 ?auto_227710 ) ( SUPPORTS ?auto_227707 ?auto_227699 ) ( not ( = ?auto_227702 ?auto_227708 ) ) ( HAVE_IMAGE ?auto_227705 ?auto_227706 ) ( not ( = ?auto_227705 ?auto_227702 ) ) ( not ( = ?auto_227705 ?auto_227708 ) ) ( not ( = ?auto_227706 ?auto_227699 ) ) ( CALIBRATION_TARGET ?auto_227707 ?auto_227708 ) ( POINTING ?auto_227710 ?auto_227703 ) ( not ( = ?auto_227708 ?auto_227703 ) ) ( not ( = ?auto_227702 ?auto_227703 ) ) ( not ( = ?auto_227705 ?auto_227703 ) ) ( ON_BOARD ?auto_227709 ?auto_227710 ) ( POWER_ON ?auto_227709 ) ( not ( = ?auto_227707 ?auto_227709 ) ) ( HAVE_IMAGE ?auto_227700 ?auto_227701 ) ( HAVE_IMAGE ?auto_227703 ?auto_227704 ) ( not ( = ?auto_227700 ?auto_227702 ) ) ( not ( = ?auto_227700 ?auto_227703 ) ) ( not ( = ?auto_227700 ?auto_227705 ) ) ( not ( = ?auto_227700 ?auto_227708 ) ) ( not ( = ?auto_227701 ?auto_227699 ) ) ( not ( = ?auto_227701 ?auto_227704 ) ) ( not ( = ?auto_227701 ?auto_227706 ) ) ( not ( = ?auto_227699 ?auto_227704 ) ) ( not ( = ?auto_227704 ?auto_227706 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_227705 ?auto_227706 ?auto_227702 ?auto_227699 )
      ( GET-4IMAGE-VERIFY ?auto_227700 ?auto_227701 ?auto_227702 ?auto_227699 ?auto_227703 ?auto_227704 ?auto_227705 ?auto_227706 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_227795 - DIRECTION
      ?auto_227796 - MODE
      ?auto_227797 - DIRECTION
      ?auto_227794 - MODE
      ?auto_227798 - DIRECTION
      ?auto_227799 - MODE
      ?auto_227800 - DIRECTION
      ?auto_227801 - MODE
    )
    :vars
    (
      ?auto_227802 - INSTRUMENT
      ?auto_227806 - SATELLITE
      ?auto_227803 - DIRECTION
      ?auto_227804 - DIRECTION
      ?auto_227805 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_227802 ?auto_227806 ) ( SUPPORTS ?auto_227802 ?auto_227801 ) ( not ( = ?auto_227800 ?auto_227803 ) ) ( HAVE_IMAGE ?auto_227797 ?auto_227799 ) ( not ( = ?auto_227797 ?auto_227800 ) ) ( not ( = ?auto_227797 ?auto_227803 ) ) ( not ( = ?auto_227799 ?auto_227801 ) ) ( CALIBRATION_TARGET ?auto_227802 ?auto_227803 ) ( POINTING ?auto_227806 ?auto_227804 ) ( not ( = ?auto_227803 ?auto_227804 ) ) ( not ( = ?auto_227800 ?auto_227804 ) ) ( not ( = ?auto_227797 ?auto_227804 ) ) ( ON_BOARD ?auto_227805 ?auto_227806 ) ( POWER_ON ?auto_227805 ) ( not ( = ?auto_227802 ?auto_227805 ) ) ( HAVE_IMAGE ?auto_227795 ?auto_227796 ) ( HAVE_IMAGE ?auto_227797 ?auto_227794 ) ( HAVE_IMAGE ?auto_227798 ?auto_227799 ) ( not ( = ?auto_227795 ?auto_227797 ) ) ( not ( = ?auto_227795 ?auto_227798 ) ) ( not ( = ?auto_227795 ?auto_227800 ) ) ( not ( = ?auto_227795 ?auto_227803 ) ) ( not ( = ?auto_227795 ?auto_227804 ) ) ( not ( = ?auto_227796 ?auto_227794 ) ) ( not ( = ?auto_227796 ?auto_227799 ) ) ( not ( = ?auto_227796 ?auto_227801 ) ) ( not ( = ?auto_227797 ?auto_227798 ) ) ( not ( = ?auto_227794 ?auto_227799 ) ) ( not ( = ?auto_227794 ?auto_227801 ) ) ( not ( = ?auto_227798 ?auto_227800 ) ) ( not ( = ?auto_227798 ?auto_227803 ) ) ( not ( = ?auto_227798 ?auto_227804 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_227797 ?auto_227799 ?auto_227800 ?auto_227801 )
      ( GET-4IMAGE-VERIFY ?auto_227795 ?auto_227796 ?auto_227797 ?auto_227794 ?auto_227798 ?auto_227799 ?auto_227800 ?auto_227801 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_227829 - DIRECTION
      ?auto_227830 - MODE
      ?auto_227831 - DIRECTION
      ?auto_227828 - MODE
      ?auto_227832 - DIRECTION
      ?auto_227833 - MODE
      ?auto_227834 - DIRECTION
      ?auto_227835 - MODE
    )
    :vars
    (
      ?auto_227836 - INSTRUMENT
      ?auto_227840 - SATELLITE
      ?auto_227837 - DIRECTION
      ?auto_227838 - DIRECTION
      ?auto_227839 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_227836 ?auto_227840 ) ( SUPPORTS ?auto_227836 ?auto_227833 ) ( not ( = ?auto_227832 ?auto_227837 ) ) ( HAVE_IMAGE ?auto_227831 ?auto_227828 ) ( not ( = ?auto_227831 ?auto_227832 ) ) ( not ( = ?auto_227831 ?auto_227837 ) ) ( not ( = ?auto_227828 ?auto_227833 ) ) ( CALIBRATION_TARGET ?auto_227836 ?auto_227837 ) ( POINTING ?auto_227840 ?auto_227838 ) ( not ( = ?auto_227837 ?auto_227838 ) ) ( not ( = ?auto_227832 ?auto_227838 ) ) ( not ( = ?auto_227831 ?auto_227838 ) ) ( ON_BOARD ?auto_227839 ?auto_227840 ) ( POWER_ON ?auto_227839 ) ( not ( = ?auto_227836 ?auto_227839 ) ) ( HAVE_IMAGE ?auto_227829 ?auto_227830 ) ( HAVE_IMAGE ?auto_227834 ?auto_227835 ) ( not ( = ?auto_227829 ?auto_227831 ) ) ( not ( = ?auto_227829 ?auto_227832 ) ) ( not ( = ?auto_227829 ?auto_227834 ) ) ( not ( = ?auto_227829 ?auto_227837 ) ) ( not ( = ?auto_227829 ?auto_227838 ) ) ( not ( = ?auto_227830 ?auto_227828 ) ) ( not ( = ?auto_227830 ?auto_227833 ) ) ( not ( = ?auto_227830 ?auto_227835 ) ) ( not ( = ?auto_227831 ?auto_227834 ) ) ( not ( = ?auto_227828 ?auto_227835 ) ) ( not ( = ?auto_227832 ?auto_227834 ) ) ( not ( = ?auto_227833 ?auto_227835 ) ) ( not ( = ?auto_227834 ?auto_227837 ) ) ( not ( = ?auto_227834 ?auto_227838 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_227831 ?auto_227828 ?auto_227832 ?auto_227833 )
      ( GET-4IMAGE-VERIFY ?auto_227829 ?auto_227830 ?auto_227831 ?auto_227828 ?auto_227832 ?auto_227833 ?auto_227834 ?auto_227835 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_227876 - DIRECTION
      ?auto_227877 - MODE
      ?auto_227878 - DIRECTION
      ?auto_227875 - MODE
      ?auto_227879 - DIRECTION
      ?auto_227880 - MODE
      ?auto_227881 - DIRECTION
      ?auto_227882 - MODE
    )
    :vars
    (
      ?auto_227883 - INSTRUMENT
      ?auto_227887 - SATELLITE
      ?auto_227884 - DIRECTION
      ?auto_227885 - DIRECTION
      ?auto_227886 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_227883 ?auto_227887 ) ( SUPPORTS ?auto_227883 ?auto_227882 ) ( not ( = ?auto_227881 ?auto_227884 ) ) ( HAVE_IMAGE ?auto_227879 ?auto_227880 ) ( not ( = ?auto_227879 ?auto_227881 ) ) ( not ( = ?auto_227879 ?auto_227884 ) ) ( not ( = ?auto_227880 ?auto_227882 ) ) ( CALIBRATION_TARGET ?auto_227883 ?auto_227884 ) ( POINTING ?auto_227887 ?auto_227885 ) ( not ( = ?auto_227884 ?auto_227885 ) ) ( not ( = ?auto_227881 ?auto_227885 ) ) ( not ( = ?auto_227879 ?auto_227885 ) ) ( ON_BOARD ?auto_227886 ?auto_227887 ) ( POWER_ON ?auto_227886 ) ( not ( = ?auto_227883 ?auto_227886 ) ) ( HAVE_IMAGE ?auto_227876 ?auto_227877 ) ( HAVE_IMAGE ?auto_227878 ?auto_227875 ) ( not ( = ?auto_227876 ?auto_227878 ) ) ( not ( = ?auto_227876 ?auto_227879 ) ) ( not ( = ?auto_227876 ?auto_227881 ) ) ( not ( = ?auto_227876 ?auto_227884 ) ) ( not ( = ?auto_227876 ?auto_227885 ) ) ( not ( = ?auto_227877 ?auto_227875 ) ) ( not ( = ?auto_227877 ?auto_227880 ) ) ( not ( = ?auto_227877 ?auto_227882 ) ) ( not ( = ?auto_227878 ?auto_227879 ) ) ( not ( = ?auto_227878 ?auto_227881 ) ) ( not ( = ?auto_227878 ?auto_227884 ) ) ( not ( = ?auto_227878 ?auto_227885 ) ) ( not ( = ?auto_227875 ?auto_227880 ) ) ( not ( = ?auto_227875 ?auto_227882 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_227879 ?auto_227880 ?auto_227881 ?auto_227882 )
      ( GET-4IMAGE-VERIFY ?auto_227876 ?auto_227877 ?auto_227878 ?auto_227875 ?auto_227879 ?auto_227880 ?auto_227881 ?auto_227882 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_227889 - DIRECTION
      ?auto_227890 - MODE
      ?auto_227891 - DIRECTION
      ?auto_227888 - MODE
      ?auto_227892 - DIRECTION
      ?auto_227893 - MODE
      ?auto_227894 - DIRECTION
      ?auto_227895 - MODE
    )
    :vars
    (
      ?auto_227896 - INSTRUMENT
      ?auto_227901 - SATELLITE
      ?auto_227897 - DIRECTION
      ?auto_227902 - DIRECTION
      ?auto_227899 - MODE
      ?auto_227898 - DIRECTION
      ?auto_227900 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_227896 ?auto_227901 ) ( SUPPORTS ?auto_227896 ?auto_227895 ) ( not ( = ?auto_227894 ?auto_227897 ) ) ( HAVE_IMAGE ?auto_227902 ?auto_227899 ) ( not ( = ?auto_227902 ?auto_227894 ) ) ( not ( = ?auto_227902 ?auto_227897 ) ) ( not ( = ?auto_227899 ?auto_227895 ) ) ( CALIBRATION_TARGET ?auto_227896 ?auto_227897 ) ( POINTING ?auto_227901 ?auto_227898 ) ( not ( = ?auto_227897 ?auto_227898 ) ) ( not ( = ?auto_227894 ?auto_227898 ) ) ( not ( = ?auto_227902 ?auto_227898 ) ) ( ON_BOARD ?auto_227900 ?auto_227901 ) ( POWER_ON ?auto_227900 ) ( not ( = ?auto_227896 ?auto_227900 ) ) ( HAVE_IMAGE ?auto_227889 ?auto_227890 ) ( HAVE_IMAGE ?auto_227891 ?auto_227888 ) ( HAVE_IMAGE ?auto_227892 ?auto_227893 ) ( not ( = ?auto_227889 ?auto_227891 ) ) ( not ( = ?auto_227889 ?auto_227892 ) ) ( not ( = ?auto_227889 ?auto_227894 ) ) ( not ( = ?auto_227889 ?auto_227897 ) ) ( not ( = ?auto_227889 ?auto_227902 ) ) ( not ( = ?auto_227889 ?auto_227898 ) ) ( not ( = ?auto_227890 ?auto_227888 ) ) ( not ( = ?auto_227890 ?auto_227893 ) ) ( not ( = ?auto_227890 ?auto_227895 ) ) ( not ( = ?auto_227890 ?auto_227899 ) ) ( not ( = ?auto_227891 ?auto_227892 ) ) ( not ( = ?auto_227891 ?auto_227894 ) ) ( not ( = ?auto_227891 ?auto_227897 ) ) ( not ( = ?auto_227891 ?auto_227902 ) ) ( not ( = ?auto_227891 ?auto_227898 ) ) ( not ( = ?auto_227888 ?auto_227893 ) ) ( not ( = ?auto_227888 ?auto_227895 ) ) ( not ( = ?auto_227888 ?auto_227899 ) ) ( not ( = ?auto_227892 ?auto_227894 ) ) ( not ( = ?auto_227892 ?auto_227897 ) ) ( not ( = ?auto_227892 ?auto_227902 ) ) ( not ( = ?auto_227892 ?auto_227898 ) ) ( not ( = ?auto_227893 ?auto_227895 ) ) ( not ( = ?auto_227893 ?auto_227899 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_227902 ?auto_227899 ?auto_227894 ?auto_227895 )
      ( GET-4IMAGE-VERIFY ?auto_227889 ?auto_227890 ?auto_227891 ?auto_227888 ?auto_227892 ?auto_227893 ?auto_227894 ?auto_227895 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_227931 - DIRECTION
      ?auto_227932 - MODE
      ?auto_227933 - DIRECTION
      ?auto_227930 - MODE
      ?auto_227934 - DIRECTION
      ?auto_227935 - MODE
      ?auto_227936 - DIRECTION
      ?auto_227937 - MODE
    )
    :vars
    (
      ?auto_227938 - INSTRUMENT
      ?auto_227943 - SATELLITE
      ?auto_227939 - DIRECTION
      ?auto_227944 - DIRECTION
      ?auto_227941 - MODE
      ?auto_227940 - DIRECTION
      ?auto_227942 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_227938 ?auto_227943 ) ( SUPPORTS ?auto_227938 ?auto_227935 ) ( not ( = ?auto_227934 ?auto_227939 ) ) ( HAVE_IMAGE ?auto_227944 ?auto_227941 ) ( not ( = ?auto_227944 ?auto_227934 ) ) ( not ( = ?auto_227944 ?auto_227939 ) ) ( not ( = ?auto_227941 ?auto_227935 ) ) ( CALIBRATION_TARGET ?auto_227938 ?auto_227939 ) ( POINTING ?auto_227943 ?auto_227940 ) ( not ( = ?auto_227939 ?auto_227940 ) ) ( not ( = ?auto_227934 ?auto_227940 ) ) ( not ( = ?auto_227944 ?auto_227940 ) ) ( ON_BOARD ?auto_227942 ?auto_227943 ) ( POWER_ON ?auto_227942 ) ( not ( = ?auto_227938 ?auto_227942 ) ) ( HAVE_IMAGE ?auto_227931 ?auto_227932 ) ( HAVE_IMAGE ?auto_227933 ?auto_227930 ) ( HAVE_IMAGE ?auto_227936 ?auto_227937 ) ( not ( = ?auto_227931 ?auto_227933 ) ) ( not ( = ?auto_227931 ?auto_227934 ) ) ( not ( = ?auto_227931 ?auto_227936 ) ) ( not ( = ?auto_227931 ?auto_227939 ) ) ( not ( = ?auto_227931 ?auto_227944 ) ) ( not ( = ?auto_227931 ?auto_227940 ) ) ( not ( = ?auto_227932 ?auto_227930 ) ) ( not ( = ?auto_227932 ?auto_227935 ) ) ( not ( = ?auto_227932 ?auto_227937 ) ) ( not ( = ?auto_227932 ?auto_227941 ) ) ( not ( = ?auto_227933 ?auto_227934 ) ) ( not ( = ?auto_227933 ?auto_227936 ) ) ( not ( = ?auto_227933 ?auto_227939 ) ) ( not ( = ?auto_227933 ?auto_227944 ) ) ( not ( = ?auto_227933 ?auto_227940 ) ) ( not ( = ?auto_227930 ?auto_227935 ) ) ( not ( = ?auto_227930 ?auto_227937 ) ) ( not ( = ?auto_227930 ?auto_227941 ) ) ( not ( = ?auto_227934 ?auto_227936 ) ) ( not ( = ?auto_227935 ?auto_227937 ) ) ( not ( = ?auto_227936 ?auto_227939 ) ) ( not ( = ?auto_227936 ?auto_227944 ) ) ( not ( = ?auto_227936 ?auto_227940 ) ) ( not ( = ?auto_227937 ?auto_227941 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_227944 ?auto_227941 ?auto_227934 ?auto_227935 )
      ( GET-4IMAGE-VERIFY ?auto_227931 ?auto_227932 ?auto_227933 ?auto_227930 ?auto_227934 ?auto_227935 ?auto_227936 ?auto_227937 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_227946 - DIRECTION
      ?auto_227947 - MODE
      ?auto_227948 - DIRECTION
      ?auto_227945 - MODE
      ?auto_227949 - DIRECTION
      ?auto_227950 - MODE
      ?auto_227951 - DIRECTION
      ?auto_227952 - MODE
    )
    :vars
    (
      ?auto_227953 - INSTRUMENT
      ?auto_227957 - SATELLITE
      ?auto_227954 - DIRECTION
      ?auto_227958 - DIRECTION
      ?auto_227955 - MODE
      ?auto_227956 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_227953 ?auto_227957 ) ( SUPPORTS ?auto_227953 ?auto_227950 ) ( not ( = ?auto_227949 ?auto_227954 ) ) ( HAVE_IMAGE ?auto_227958 ?auto_227955 ) ( not ( = ?auto_227958 ?auto_227949 ) ) ( not ( = ?auto_227958 ?auto_227954 ) ) ( not ( = ?auto_227955 ?auto_227950 ) ) ( CALIBRATION_TARGET ?auto_227953 ?auto_227954 ) ( POINTING ?auto_227957 ?auto_227951 ) ( not ( = ?auto_227954 ?auto_227951 ) ) ( not ( = ?auto_227949 ?auto_227951 ) ) ( not ( = ?auto_227958 ?auto_227951 ) ) ( ON_BOARD ?auto_227956 ?auto_227957 ) ( POWER_ON ?auto_227956 ) ( not ( = ?auto_227953 ?auto_227956 ) ) ( HAVE_IMAGE ?auto_227946 ?auto_227947 ) ( HAVE_IMAGE ?auto_227948 ?auto_227945 ) ( HAVE_IMAGE ?auto_227951 ?auto_227952 ) ( not ( = ?auto_227946 ?auto_227948 ) ) ( not ( = ?auto_227946 ?auto_227949 ) ) ( not ( = ?auto_227946 ?auto_227951 ) ) ( not ( = ?auto_227946 ?auto_227954 ) ) ( not ( = ?auto_227946 ?auto_227958 ) ) ( not ( = ?auto_227947 ?auto_227945 ) ) ( not ( = ?auto_227947 ?auto_227950 ) ) ( not ( = ?auto_227947 ?auto_227952 ) ) ( not ( = ?auto_227947 ?auto_227955 ) ) ( not ( = ?auto_227948 ?auto_227949 ) ) ( not ( = ?auto_227948 ?auto_227951 ) ) ( not ( = ?auto_227948 ?auto_227954 ) ) ( not ( = ?auto_227948 ?auto_227958 ) ) ( not ( = ?auto_227945 ?auto_227950 ) ) ( not ( = ?auto_227945 ?auto_227952 ) ) ( not ( = ?auto_227945 ?auto_227955 ) ) ( not ( = ?auto_227950 ?auto_227952 ) ) ( not ( = ?auto_227952 ?auto_227955 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_227958 ?auto_227955 ?auto_227949 ?auto_227950 )
      ( GET-4IMAGE-VERIFY ?auto_227946 ?auto_227947 ?auto_227948 ?auto_227945 ?auto_227949 ?auto_227950 ?auto_227951 ?auto_227952 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_227983 - DIRECTION
      ?auto_227984 - MODE
      ?auto_227985 - DIRECTION
      ?auto_227982 - MODE
      ?auto_227986 - DIRECTION
      ?auto_227987 - MODE
      ?auto_227988 - DIRECTION
      ?auto_227989 - MODE
    )
    :vars
    (
      ?auto_227990 - INSTRUMENT
      ?auto_227994 - SATELLITE
      ?auto_227991 - DIRECTION
      ?auto_227995 - DIRECTION
      ?auto_227992 - MODE
      ?auto_227993 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_227990 ?auto_227994 ) ( SUPPORTS ?auto_227990 ?auto_227989 ) ( not ( = ?auto_227988 ?auto_227991 ) ) ( HAVE_IMAGE ?auto_227995 ?auto_227992 ) ( not ( = ?auto_227995 ?auto_227988 ) ) ( not ( = ?auto_227995 ?auto_227991 ) ) ( not ( = ?auto_227992 ?auto_227989 ) ) ( CALIBRATION_TARGET ?auto_227990 ?auto_227991 ) ( POINTING ?auto_227994 ?auto_227985 ) ( not ( = ?auto_227991 ?auto_227985 ) ) ( not ( = ?auto_227988 ?auto_227985 ) ) ( not ( = ?auto_227995 ?auto_227985 ) ) ( ON_BOARD ?auto_227993 ?auto_227994 ) ( POWER_ON ?auto_227993 ) ( not ( = ?auto_227990 ?auto_227993 ) ) ( HAVE_IMAGE ?auto_227983 ?auto_227984 ) ( HAVE_IMAGE ?auto_227985 ?auto_227982 ) ( HAVE_IMAGE ?auto_227986 ?auto_227987 ) ( not ( = ?auto_227983 ?auto_227985 ) ) ( not ( = ?auto_227983 ?auto_227986 ) ) ( not ( = ?auto_227983 ?auto_227988 ) ) ( not ( = ?auto_227983 ?auto_227991 ) ) ( not ( = ?auto_227983 ?auto_227995 ) ) ( not ( = ?auto_227984 ?auto_227982 ) ) ( not ( = ?auto_227984 ?auto_227987 ) ) ( not ( = ?auto_227984 ?auto_227989 ) ) ( not ( = ?auto_227984 ?auto_227992 ) ) ( not ( = ?auto_227985 ?auto_227986 ) ) ( not ( = ?auto_227982 ?auto_227987 ) ) ( not ( = ?auto_227982 ?auto_227989 ) ) ( not ( = ?auto_227982 ?auto_227992 ) ) ( not ( = ?auto_227986 ?auto_227988 ) ) ( not ( = ?auto_227986 ?auto_227991 ) ) ( not ( = ?auto_227986 ?auto_227995 ) ) ( not ( = ?auto_227987 ?auto_227989 ) ) ( not ( = ?auto_227987 ?auto_227992 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_227995 ?auto_227992 ?auto_227988 ?auto_227989 )
      ( GET-4IMAGE-VERIFY ?auto_227983 ?auto_227984 ?auto_227985 ?auto_227982 ?auto_227986 ?auto_227987 ?auto_227988 ?auto_227989 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_228061 - DIRECTION
      ?auto_228062 - MODE
      ?auto_228063 - DIRECTION
      ?auto_228060 - MODE
      ?auto_228064 - DIRECTION
      ?auto_228065 - MODE
      ?auto_228066 - DIRECTION
      ?auto_228067 - MODE
    )
    :vars
    (
      ?auto_228068 - INSTRUMENT
      ?auto_228072 - SATELLITE
      ?auto_228069 - DIRECTION
      ?auto_228070 - DIRECTION
      ?auto_228071 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_228068 ?auto_228072 ) ( SUPPORTS ?auto_228068 ?auto_228060 ) ( not ( = ?auto_228063 ?auto_228069 ) ) ( HAVE_IMAGE ?auto_228066 ?auto_228065 ) ( not ( = ?auto_228066 ?auto_228063 ) ) ( not ( = ?auto_228066 ?auto_228069 ) ) ( not ( = ?auto_228065 ?auto_228060 ) ) ( CALIBRATION_TARGET ?auto_228068 ?auto_228069 ) ( POINTING ?auto_228072 ?auto_228070 ) ( not ( = ?auto_228069 ?auto_228070 ) ) ( not ( = ?auto_228063 ?auto_228070 ) ) ( not ( = ?auto_228066 ?auto_228070 ) ) ( ON_BOARD ?auto_228071 ?auto_228072 ) ( POWER_ON ?auto_228071 ) ( not ( = ?auto_228068 ?auto_228071 ) ) ( HAVE_IMAGE ?auto_228061 ?auto_228062 ) ( HAVE_IMAGE ?auto_228064 ?auto_228065 ) ( HAVE_IMAGE ?auto_228066 ?auto_228067 ) ( not ( = ?auto_228061 ?auto_228063 ) ) ( not ( = ?auto_228061 ?auto_228064 ) ) ( not ( = ?auto_228061 ?auto_228066 ) ) ( not ( = ?auto_228061 ?auto_228069 ) ) ( not ( = ?auto_228061 ?auto_228070 ) ) ( not ( = ?auto_228062 ?auto_228060 ) ) ( not ( = ?auto_228062 ?auto_228065 ) ) ( not ( = ?auto_228062 ?auto_228067 ) ) ( not ( = ?auto_228063 ?auto_228064 ) ) ( not ( = ?auto_228060 ?auto_228067 ) ) ( not ( = ?auto_228064 ?auto_228066 ) ) ( not ( = ?auto_228064 ?auto_228069 ) ) ( not ( = ?auto_228064 ?auto_228070 ) ) ( not ( = ?auto_228065 ?auto_228067 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_228066 ?auto_228065 ?auto_228063 ?auto_228060 )
      ( GET-4IMAGE-VERIFY ?auto_228061 ?auto_228062 ?auto_228063 ?auto_228060 ?auto_228064 ?auto_228065 ?auto_228066 ?auto_228067 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_228074 - DIRECTION
      ?auto_228075 - MODE
      ?auto_228076 - DIRECTION
      ?auto_228073 - MODE
      ?auto_228077 - DIRECTION
      ?auto_228078 - MODE
      ?auto_228079 - DIRECTION
      ?auto_228080 - MODE
    )
    :vars
    (
      ?auto_228081 - INSTRUMENT
      ?auto_228085 - SATELLITE
      ?auto_228082 - DIRECTION
      ?auto_228083 - DIRECTION
      ?auto_228084 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_228081 ?auto_228085 ) ( SUPPORTS ?auto_228081 ?auto_228073 ) ( not ( = ?auto_228076 ?auto_228082 ) ) ( HAVE_IMAGE ?auto_228077 ?auto_228078 ) ( not ( = ?auto_228077 ?auto_228076 ) ) ( not ( = ?auto_228077 ?auto_228082 ) ) ( not ( = ?auto_228078 ?auto_228073 ) ) ( CALIBRATION_TARGET ?auto_228081 ?auto_228082 ) ( POINTING ?auto_228085 ?auto_228083 ) ( not ( = ?auto_228082 ?auto_228083 ) ) ( not ( = ?auto_228076 ?auto_228083 ) ) ( not ( = ?auto_228077 ?auto_228083 ) ) ( ON_BOARD ?auto_228084 ?auto_228085 ) ( POWER_ON ?auto_228084 ) ( not ( = ?auto_228081 ?auto_228084 ) ) ( HAVE_IMAGE ?auto_228074 ?auto_228075 ) ( HAVE_IMAGE ?auto_228079 ?auto_228080 ) ( not ( = ?auto_228074 ?auto_228076 ) ) ( not ( = ?auto_228074 ?auto_228077 ) ) ( not ( = ?auto_228074 ?auto_228079 ) ) ( not ( = ?auto_228074 ?auto_228082 ) ) ( not ( = ?auto_228074 ?auto_228083 ) ) ( not ( = ?auto_228075 ?auto_228073 ) ) ( not ( = ?auto_228075 ?auto_228078 ) ) ( not ( = ?auto_228075 ?auto_228080 ) ) ( not ( = ?auto_228076 ?auto_228079 ) ) ( not ( = ?auto_228073 ?auto_228080 ) ) ( not ( = ?auto_228077 ?auto_228079 ) ) ( not ( = ?auto_228078 ?auto_228080 ) ) ( not ( = ?auto_228079 ?auto_228082 ) ) ( not ( = ?auto_228079 ?auto_228083 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_228077 ?auto_228078 ?auto_228076 ?auto_228073 )
      ( GET-4IMAGE-VERIFY ?auto_228074 ?auto_228075 ?auto_228076 ?auto_228073 ?auto_228077 ?auto_228078 ?auto_228079 ?auto_228080 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_228108 - DIRECTION
      ?auto_228109 - MODE
      ?auto_228110 - DIRECTION
      ?auto_228107 - MODE
      ?auto_228111 - DIRECTION
      ?auto_228112 - MODE
      ?auto_228113 - DIRECTION
      ?auto_228114 - MODE
    )
    :vars
    (
      ?auto_228115 - INSTRUMENT
      ?auto_228119 - SATELLITE
      ?auto_228116 - DIRECTION
      ?auto_228117 - DIRECTION
      ?auto_228118 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_228115 ?auto_228119 ) ( SUPPORTS ?auto_228115 ?auto_228107 ) ( not ( = ?auto_228110 ?auto_228116 ) ) ( HAVE_IMAGE ?auto_228113 ?auto_228114 ) ( not ( = ?auto_228113 ?auto_228110 ) ) ( not ( = ?auto_228113 ?auto_228116 ) ) ( not ( = ?auto_228114 ?auto_228107 ) ) ( CALIBRATION_TARGET ?auto_228115 ?auto_228116 ) ( POINTING ?auto_228119 ?auto_228117 ) ( not ( = ?auto_228116 ?auto_228117 ) ) ( not ( = ?auto_228110 ?auto_228117 ) ) ( not ( = ?auto_228113 ?auto_228117 ) ) ( ON_BOARD ?auto_228118 ?auto_228119 ) ( POWER_ON ?auto_228118 ) ( not ( = ?auto_228115 ?auto_228118 ) ) ( HAVE_IMAGE ?auto_228108 ?auto_228109 ) ( HAVE_IMAGE ?auto_228111 ?auto_228112 ) ( not ( = ?auto_228108 ?auto_228110 ) ) ( not ( = ?auto_228108 ?auto_228111 ) ) ( not ( = ?auto_228108 ?auto_228113 ) ) ( not ( = ?auto_228108 ?auto_228116 ) ) ( not ( = ?auto_228108 ?auto_228117 ) ) ( not ( = ?auto_228109 ?auto_228107 ) ) ( not ( = ?auto_228109 ?auto_228112 ) ) ( not ( = ?auto_228109 ?auto_228114 ) ) ( not ( = ?auto_228110 ?auto_228111 ) ) ( not ( = ?auto_228107 ?auto_228112 ) ) ( not ( = ?auto_228111 ?auto_228113 ) ) ( not ( = ?auto_228111 ?auto_228116 ) ) ( not ( = ?auto_228111 ?auto_228117 ) ) ( not ( = ?auto_228112 ?auto_228114 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_228113 ?auto_228114 ?auto_228110 ?auto_228107 )
      ( GET-4IMAGE-VERIFY ?auto_228108 ?auto_228109 ?auto_228110 ?auto_228107 ?auto_228111 ?auto_228112 ?auto_228113 ?auto_228114 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_228121 - DIRECTION
      ?auto_228122 - MODE
      ?auto_228123 - DIRECTION
      ?auto_228120 - MODE
      ?auto_228124 - DIRECTION
      ?auto_228125 - MODE
      ?auto_228126 - DIRECTION
      ?auto_228127 - MODE
    )
    :vars
    (
      ?auto_228128 - INSTRUMENT
      ?auto_228133 - SATELLITE
      ?auto_228129 - DIRECTION
      ?auto_228134 - DIRECTION
      ?auto_228131 - MODE
      ?auto_228130 - DIRECTION
      ?auto_228132 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_228128 ?auto_228133 ) ( SUPPORTS ?auto_228128 ?auto_228120 ) ( not ( = ?auto_228123 ?auto_228129 ) ) ( HAVE_IMAGE ?auto_228134 ?auto_228131 ) ( not ( = ?auto_228134 ?auto_228123 ) ) ( not ( = ?auto_228134 ?auto_228129 ) ) ( not ( = ?auto_228131 ?auto_228120 ) ) ( CALIBRATION_TARGET ?auto_228128 ?auto_228129 ) ( POINTING ?auto_228133 ?auto_228130 ) ( not ( = ?auto_228129 ?auto_228130 ) ) ( not ( = ?auto_228123 ?auto_228130 ) ) ( not ( = ?auto_228134 ?auto_228130 ) ) ( ON_BOARD ?auto_228132 ?auto_228133 ) ( POWER_ON ?auto_228132 ) ( not ( = ?auto_228128 ?auto_228132 ) ) ( HAVE_IMAGE ?auto_228121 ?auto_228122 ) ( HAVE_IMAGE ?auto_228124 ?auto_228125 ) ( HAVE_IMAGE ?auto_228126 ?auto_228127 ) ( not ( = ?auto_228121 ?auto_228123 ) ) ( not ( = ?auto_228121 ?auto_228124 ) ) ( not ( = ?auto_228121 ?auto_228126 ) ) ( not ( = ?auto_228121 ?auto_228129 ) ) ( not ( = ?auto_228121 ?auto_228134 ) ) ( not ( = ?auto_228121 ?auto_228130 ) ) ( not ( = ?auto_228122 ?auto_228120 ) ) ( not ( = ?auto_228122 ?auto_228125 ) ) ( not ( = ?auto_228122 ?auto_228127 ) ) ( not ( = ?auto_228122 ?auto_228131 ) ) ( not ( = ?auto_228123 ?auto_228124 ) ) ( not ( = ?auto_228123 ?auto_228126 ) ) ( not ( = ?auto_228120 ?auto_228125 ) ) ( not ( = ?auto_228120 ?auto_228127 ) ) ( not ( = ?auto_228124 ?auto_228126 ) ) ( not ( = ?auto_228124 ?auto_228129 ) ) ( not ( = ?auto_228124 ?auto_228134 ) ) ( not ( = ?auto_228124 ?auto_228130 ) ) ( not ( = ?auto_228125 ?auto_228127 ) ) ( not ( = ?auto_228125 ?auto_228131 ) ) ( not ( = ?auto_228126 ?auto_228129 ) ) ( not ( = ?auto_228126 ?auto_228134 ) ) ( not ( = ?auto_228126 ?auto_228130 ) ) ( not ( = ?auto_228127 ?auto_228131 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_228134 ?auto_228131 ?auto_228123 ?auto_228120 )
      ( GET-4IMAGE-VERIFY ?auto_228121 ?auto_228122 ?auto_228123 ?auto_228120 ?auto_228124 ?auto_228125 ?auto_228126 ?auto_228127 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_228136 - DIRECTION
      ?auto_228137 - MODE
      ?auto_228138 - DIRECTION
      ?auto_228135 - MODE
      ?auto_228139 - DIRECTION
      ?auto_228140 - MODE
      ?auto_228141 - DIRECTION
      ?auto_228142 - MODE
    )
    :vars
    (
      ?auto_228143 - INSTRUMENT
      ?auto_228147 - SATELLITE
      ?auto_228144 - DIRECTION
      ?auto_228148 - DIRECTION
      ?auto_228145 - MODE
      ?auto_228146 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_228143 ?auto_228147 ) ( SUPPORTS ?auto_228143 ?auto_228135 ) ( not ( = ?auto_228138 ?auto_228144 ) ) ( HAVE_IMAGE ?auto_228148 ?auto_228145 ) ( not ( = ?auto_228148 ?auto_228138 ) ) ( not ( = ?auto_228148 ?auto_228144 ) ) ( not ( = ?auto_228145 ?auto_228135 ) ) ( CALIBRATION_TARGET ?auto_228143 ?auto_228144 ) ( POINTING ?auto_228147 ?auto_228141 ) ( not ( = ?auto_228144 ?auto_228141 ) ) ( not ( = ?auto_228138 ?auto_228141 ) ) ( not ( = ?auto_228148 ?auto_228141 ) ) ( ON_BOARD ?auto_228146 ?auto_228147 ) ( POWER_ON ?auto_228146 ) ( not ( = ?auto_228143 ?auto_228146 ) ) ( HAVE_IMAGE ?auto_228136 ?auto_228137 ) ( HAVE_IMAGE ?auto_228139 ?auto_228140 ) ( HAVE_IMAGE ?auto_228141 ?auto_228142 ) ( not ( = ?auto_228136 ?auto_228138 ) ) ( not ( = ?auto_228136 ?auto_228139 ) ) ( not ( = ?auto_228136 ?auto_228141 ) ) ( not ( = ?auto_228136 ?auto_228144 ) ) ( not ( = ?auto_228136 ?auto_228148 ) ) ( not ( = ?auto_228137 ?auto_228135 ) ) ( not ( = ?auto_228137 ?auto_228140 ) ) ( not ( = ?auto_228137 ?auto_228142 ) ) ( not ( = ?auto_228137 ?auto_228145 ) ) ( not ( = ?auto_228138 ?auto_228139 ) ) ( not ( = ?auto_228135 ?auto_228140 ) ) ( not ( = ?auto_228135 ?auto_228142 ) ) ( not ( = ?auto_228139 ?auto_228141 ) ) ( not ( = ?auto_228139 ?auto_228144 ) ) ( not ( = ?auto_228139 ?auto_228148 ) ) ( not ( = ?auto_228140 ?auto_228142 ) ) ( not ( = ?auto_228140 ?auto_228145 ) ) ( not ( = ?auto_228142 ?auto_228145 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_228148 ?auto_228145 ?auto_228138 ?auto_228135 )
      ( GET-4IMAGE-VERIFY ?auto_228136 ?auto_228137 ?auto_228138 ?auto_228135 ?auto_228139 ?auto_228140 ?auto_228141 ?auto_228142 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_228360 - DIRECTION
      ?auto_228361 - MODE
      ?auto_228362 - DIRECTION
      ?auto_228359 - MODE
      ?auto_228363 - DIRECTION
      ?auto_228364 - MODE
      ?auto_228365 - DIRECTION
      ?auto_228366 - MODE
    )
    :vars
    (
      ?auto_228367 - INSTRUMENT
      ?auto_228371 - SATELLITE
      ?auto_228368 - DIRECTION
      ?auto_228372 - DIRECTION
      ?auto_228369 - MODE
      ?auto_228370 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_228367 ?auto_228371 ) ( SUPPORTS ?auto_228367 ?auto_228366 ) ( not ( = ?auto_228365 ?auto_228368 ) ) ( HAVE_IMAGE ?auto_228372 ?auto_228369 ) ( not ( = ?auto_228372 ?auto_228365 ) ) ( not ( = ?auto_228372 ?auto_228368 ) ) ( not ( = ?auto_228369 ?auto_228366 ) ) ( CALIBRATION_TARGET ?auto_228367 ?auto_228368 ) ( POINTING ?auto_228371 ?auto_228360 ) ( not ( = ?auto_228368 ?auto_228360 ) ) ( not ( = ?auto_228365 ?auto_228360 ) ) ( not ( = ?auto_228372 ?auto_228360 ) ) ( ON_BOARD ?auto_228370 ?auto_228371 ) ( POWER_ON ?auto_228370 ) ( not ( = ?auto_228367 ?auto_228370 ) ) ( HAVE_IMAGE ?auto_228360 ?auto_228361 ) ( HAVE_IMAGE ?auto_228362 ?auto_228359 ) ( HAVE_IMAGE ?auto_228363 ?auto_228364 ) ( not ( = ?auto_228360 ?auto_228362 ) ) ( not ( = ?auto_228360 ?auto_228363 ) ) ( not ( = ?auto_228361 ?auto_228359 ) ) ( not ( = ?auto_228361 ?auto_228364 ) ) ( not ( = ?auto_228361 ?auto_228366 ) ) ( not ( = ?auto_228361 ?auto_228369 ) ) ( not ( = ?auto_228362 ?auto_228363 ) ) ( not ( = ?auto_228362 ?auto_228365 ) ) ( not ( = ?auto_228362 ?auto_228368 ) ) ( not ( = ?auto_228362 ?auto_228372 ) ) ( not ( = ?auto_228359 ?auto_228364 ) ) ( not ( = ?auto_228359 ?auto_228366 ) ) ( not ( = ?auto_228359 ?auto_228369 ) ) ( not ( = ?auto_228363 ?auto_228365 ) ) ( not ( = ?auto_228363 ?auto_228368 ) ) ( not ( = ?auto_228363 ?auto_228372 ) ) ( not ( = ?auto_228364 ?auto_228366 ) ) ( not ( = ?auto_228364 ?auto_228369 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_228372 ?auto_228369 ?auto_228365 ?auto_228366 )
      ( GET-4IMAGE-VERIFY ?auto_228360 ?auto_228361 ?auto_228362 ?auto_228359 ?auto_228363 ?auto_228364 ?auto_228365 ?auto_228366 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_228396 - DIRECTION
      ?auto_228397 - MODE
      ?auto_228398 - DIRECTION
      ?auto_228395 - MODE
      ?auto_228399 - DIRECTION
      ?auto_228400 - MODE
      ?auto_228401 - DIRECTION
      ?auto_228402 - MODE
    )
    :vars
    (
      ?auto_228403 - INSTRUMENT
      ?auto_228407 - SATELLITE
      ?auto_228404 - DIRECTION
      ?auto_228408 - DIRECTION
      ?auto_228405 - MODE
      ?auto_228406 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_228403 ?auto_228407 ) ( SUPPORTS ?auto_228403 ?auto_228400 ) ( not ( = ?auto_228399 ?auto_228404 ) ) ( HAVE_IMAGE ?auto_228408 ?auto_228405 ) ( not ( = ?auto_228408 ?auto_228399 ) ) ( not ( = ?auto_228408 ?auto_228404 ) ) ( not ( = ?auto_228405 ?auto_228400 ) ) ( CALIBRATION_TARGET ?auto_228403 ?auto_228404 ) ( POINTING ?auto_228407 ?auto_228396 ) ( not ( = ?auto_228404 ?auto_228396 ) ) ( not ( = ?auto_228399 ?auto_228396 ) ) ( not ( = ?auto_228408 ?auto_228396 ) ) ( ON_BOARD ?auto_228406 ?auto_228407 ) ( POWER_ON ?auto_228406 ) ( not ( = ?auto_228403 ?auto_228406 ) ) ( HAVE_IMAGE ?auto_228396 ?auto_228397 ) ( HAVE_IMAGE ?auto_228398 ?auto_228395 ) ( HAVE_IMAGE ?auto_228401 ?auto_228402 ) ( not ( = ?auto_228396 ?auto_228398 ) ) ( not ( = ?auto_228396 ?auto_228401 ) ) ( not ( = ?auto_228397 ?auto_228395 ) ) ( not ( = ?auto_228397 ?auto_228400 ) ) ( not ( = ?auto_228397 ?auto_228402 ) ) ( not ( = ?auto_228397 ?auto_228405 ) ) ( not ( = ?auto_228398 ?auto_228399 ) ) ( not ( = ?auto_228398 ?auto_228401 ) ) ( not ( = ?auto_228398 ?auto_228404 ) ) ( not ( = ?auto_228398 ?auto_228408 ) ) ( not ( = ?auto_228395 ?auto_228400 ) ) ( not ( = ?auto_228395 ?auto_228402 ) ) ( not ( = ?auto_228395 ?auto_228405 ) ) ( not ( = ?auto_228399 ?auto_228401 ) ) ( not ( = ?auto_228400 ?auto_228402 ) ) ( not ( = ?auto_228401 ?auto_228404 ) ) ( not ( = ?auto_228401 ?auto_228408 ) ) ( not ( = ?auto_228402 ?auto_228405 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_228408 ?auto_228405 ?auto_228399 ?auto_228400 )
      ( GET-4IMAGE-VERIFY ?auto_228396 ?auto_228397 ?auto_228398 ?auto_228395 ?auto_228399 ?auto_228400 ?auto_228401 ?auto_228402 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_228588 - DIRECTION
      ?auto_228589 - MODE
      ?auto_228590 - DIRECTION
      ?auto_228587 - MODE
      ?auto_228591 - DIRECTION
      ?auto_228592 - MODE
      ?auto_228593 - DIRECTION
      ?auto_228594 - MODE
    )
    :vars
    (
      ?auto_228595 - INSTRUMENT
      ?auto_228599 - SATELLITE
      ?auto_228596 - DIRECTION
      ?auto_228600 - DIRECTION
      ?auto_228597 - MODE
      ?auto_228598 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_228595 ?auto_228599 ) ( SUPPORTS ?auto_228595 ?auto_228587 ) ( not ( = ?auto_228590 ?auto_228596 ) ) ( HAVE_IMAGE ?auto_228600 ?auto_228597 ) ( not ( = ?auto_228600 ?auto_228590 ) ) ( not ( = ?auto_228600 ?auto_228596 ) ) ( not ( = ?auto_228597 ?auto_228587 ) ) ( CALIBRATION_TARGET ?auto_228595 ?auto_228596 ) ( POINTING ?auto_228599 ?auto_228588 ) ( not ( = ?auto_228596 ?auto_228588 ) ) ( not ( = ?auto_228590 ?auto_228588 ) ) ( not ( = ?auto_228600 ?auto_228588 ) ) ( ON_BOARD ?auto_228598 ?auto_228599 ) ( POWER_ON ?auto_228598 ) ( not ( = ?auto_228595 ?auto_228598 ) ) ( HAVE_IMAGE ?auto_228588 ?auto_228589 ) ( HAVE_IMAGE ?auto_228591 ?auto_228592 ) ( HAVE_IMAGE ?auto_228593 ?auto_228594 ) ( not ( = ?auto_228588 ?auto_228591 ) ) ( not ( = ?auto_228588 ?auto_228593 ) ) ( not ( = ?auto_228589 ?auto_228587 ) ) ( not ( = ?auto_228589 ?auto_228592 ) ) ( not ( = ?auto_228589 ?auto_228594 ) ) ( not ( = ?auto_228589 ?auto_228597 ) ) ( not ( = ?auto_228590 ?auto_228591 ) ) ( not ( = ?auto_228590 ?auto_228593 ) ) ( not ( = ?auto_228587 ?auto_228592 ) ) ( not ( = ?auto_228587 ?auto_228594 ) ) ( not ( = ?auto_228591 ?auto_228593 ) ) ( not ( = ?auto_228591 ?auto_228596 ) ) ( not ( = ?auto_228591 ?auto_228600 ) ) ( not ( = ?auto_228592 ?auto_228594 ) ) ( not ( = ?auto_228592 ?auto_228597 ) ) ( not ( = ?auto_228593 ?auto_228596 ) ) ( not ( = ?auto_228593 ?auto_228600 ) ) ( not ( = ?auto_228594 ?auto_228597 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_228600 ?auto_228597 ?auto_228590 ?auto_228587 )
      ( GET-4IMAGE-VERIFY ?auto_228588 ?auto_228589 ?auto_228590 ?auto_228587 ?auto_228591 ?auto_228592 ?auto_228593 ?auto_228594 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_228751 - DIRECTION
      ?auto_228752 - MODE
      ?auto_228753 - DIRECTION
      ?auto_228750 - MODE
      ?auto_228754 - DIRECTION
      ?auto_228755 - MODE
      ?auto_228756 - DIRECTION
      ?auto_228757 - MODE
    )
    :vars
    (
      ?auto_228758 - INSTRUMENT
      ?auto_228762 - SATELLITE
      ?auto_228759 - DIRECTION
      ?auto_228760 - DIRECTION
      ?auto_228761 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_228758 ?auto_228762 ) ( SUPPORTS ?auto_228758 ?auto_228752 ) ( not ( = ?auto_228751 ?auto_228759 ) ) ( HAVE_IMAGE ?auto_228753 ?auto_228750 ) ( not ( = ?auto_228753 ?auto_228751 ) ) ( not ( = ?auto_228753 ?auto_228759 ) ) ( not ( = ?auto_228750 ?auto_228752 ) ) ( CALIBRATION_TARGET ?auto_228758 ?auto_228759 ) ( POINTING ?auto_228762 ?auto_228760 ) ( not ( = ?auto_228759 ?auto_228760 ) ) ( not ( = ?auto_228751 ?auto_228760 ) ) ( not ( = ?auto_228753 ?auto_228760 ) ) ( ON_BOARD ?auto_228761 ?auto_228762 ) ( POWER_ON ?auto_228761 ) ( not ( = ?auto_228758 ?auto_228761 ) ) ( HAVE_IMAGE ?auto_228754 ?auto_228755 ) ( HAVE_IMAGE ?auto_228756 ?auto_228757 ) ( not ( = ?auto_228751 ?auto_228754 ) ) ( not ( = ?auto_228751 ?auto_228756 ) ) ( not ( = ?auto_228752 ?auto_228755 ) ) ( not ( = ?auto_228752 ?auto_228757 ) ) ( not ( = ?auto_228753 ?auto_228754 ) ) ( not ( = ?auto_228753 ?auto_228756 ) ) ( not ( = ?auto_228750 ?auto_228755 ) ) ( not ( = ?auto_228750 ?auto_228757 ) ) ( not ( = ?auto_228754 ?auto_228756 ) ) ( not ( = ?auto_228754 ?auto_228759 ) ) ( not ( = ?auto_228754 ?auto_228760 ) ) ( not ( = ?auto_228755 ?auto_228757 ) ) ( not ( = ?auto_228756 ?auto_228759 ) ) ( not ( = ?auto_228756 ?auto_228760 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_228753 ?auto_228750 ?auto_228751 ?auto_228752 )
      ( GET-4IMAGE-VERIFY ?auto_228751 ?auto_228752 ?auto_228753 ?auto_228750 ?auto_228754 ?auto_228755 ?auto_228756 ?auto_228757 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_228815 - DIRECTION
      ?auto_228816 - MODE
      ?auto_228817 - DIRECTION
      ?auto_228814 - MODE
      ?auto_228818 - DIRECTION
      ?auto_228819 - MODE
      ?auto_228820 - DIRECTION
      ?auto_228821 - MODE
    )
    :vars
    (
      ?auto_228822 - INSTRUMENT
      ?auto_228825 - SATELLITE
      ?auto_228823 - DIRECTION
      ?auto_228824 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_228822 ?auto_228825 ) ( SUPPORTS ?auto_228822 ?auto_228816 ) ( not ( = ?auto_228815 ?auto_228823 ) ) ( HAVE_IMAGE ?auto_228817 ?auto_228814 ) ( not ( = ?auto_228817 ?auto_228815 ) ) ( not ( = ?auto_228817 ?auto_228823 ) ) ( not ( = ?auto_228814 ?auto_228816 ) ) ( CALIBRATION_TARGET ?auto_228822 ?auto_228823 ) ( POINTING ?auto_228825 ?auto_228820 ) ( not ( = ?auto_228823 ?auto_228820 ) ) ( not ( = ?auto_228815 ?auto_228820 ) ) ( not ( = ?auto_228817 ?auto_228820 ) ) ( ON_BOARD ?auto_228824 ?auto_228825 ) ( POWER_ON ?auto_228824 ) ( not ( = ?auto_228822 ?auto_228824 ) ) ( HAVE_IMAGE ?auto_228818 ?auto_228819 ) ( HAVE_IMAGE ?auto_228820 ?auto_228821 ) ( not ( = ?auto_228815 ?auto_228818 ) ) ( not ( = ?auto_228816 ?auto_228819 ) ) ( not ( = ?auto_228816 ?auto_228821 ) ) ( not ( = ?auto_228817 ?auto_228818 ) ) ( not ( = ?auto_228814 ?auto_228819 ) ) ( not ( = ?auto_228814 ?auto_228821 ) ) ( not ( = ?auto_228818 ?auto_228820 ) ) ( not ( = ?auto_228818 ?auto_228823 ) ) ( not ( = ?auto_228819 ?auto_228821 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_228817 ?auto_228814 ?auto_228815 ?auto_228816 )
      ( GET-4IMAGE-VERIFY ?auto_228815 ?auto_228816 ?auto_228817 ?auto_228814 ?auto_228818 ?auto_228819 ?auto_228820 ?auto_228821 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_228948 - DIRECTION
      ?auto_228949 - MODE
      ?auto_228950 - DIRECTION
      ?auto_228947 - MODE
      ?auto_228951 - DIRECTION
      ?auto_228952 - MODE
      ?auto_228953 - DIRECTION
      ?auto_228954 - MODE
    )
    :vars
    (
      ?auto_228955 - INSTRUMENT
      ?auto_228959 - SATELLITE
      ?auto_228956 - DIRECTION
      ?auto_228957 - DIRECTION
      ?auto_228958 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_228955 ?auto_228959 ) ( SUPPORTS ?auto_228955 ?auto_228949 ) ( not ( = ?auto_228948 ?auto_228956 ) ) ( HAVE_IMAGE ?auto_228951 ?auto_228952 ) ( not ( = ?auto_228951 ?auto_228948 ) ) ( not ( = ?auto_228951 ?auto_228956 ) ) ( not ( = ?auto_228952 ?auto_228949 ) ) ( CALIBRATION_TARGET ?auto_228955 ?auto_228956 ) ( POINTING ?auto_228959 ?auto_228957 ) ( not ( = ?auto_228956 ?auto_228957 ) ) ( not ( = ?auto_228948 ?auto_228957 ) ) ( not ( = ?auto_228951 ?auto_228957 ) ) ( ON_BOARD ?auto_228958 ?auto_228959 ) ( POWER_ON ?auto_228958 ) ( not ( = ?auto_228955 ?auto_228958 ) ) ( HAVE_IMAGE ?auto_228950 ?auto_228947 ) ( HAVE_IMAGE ?auto_228953 ?auto_228954 ) ( not ( = ?auto_228948 ?auto_228950 ) ) ( not ( = ?auto_228948 ?auto_228953 ) ) ( not ( = ?auto_228949 ?auto_228947 ) ) ( not ( = ?auto_228949 ?auto_228954 ) ) ( not ( = ?auto_228950 ?auto_228951 ) ) ( not ( = ?auto_228950 ?auto_228953 ) ) ( not ( = ?auto_228950 ?auto_228956 ) ) ( not ( = ?auto_228950 ?auto_228957 ) ) ( not ( = ?auto_228947 ?auto_228952 ) ) ( not ( = ?auto_228947 ?auto_228954 ) ) ( not ( = ?auto_228951 ?auto_228953 ) ) ( not ( = ?auto_228952 ?auto_228954 ) ) ( not ( = ?auto_228953 ?auto_228956 ) ) ( not ( = ?auto_228953 ?auto_228957 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_228951 ?auto_228952 ?auto_228948 ?auto_228949 )
      ( GET-4IMAGE-VERIFY ?auto_228948 ?auto_228949 ?auto_228950 ?auto_228947 ?auto_228951 ?auto_228952 ?auto_228953 ?auto_228954 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_228982 - DIRECTION
      ?auto_228983 - MODE
      ?auto_228984 - DIRECTION
      ?auto_228981 - MODE
      ?auto_228985 - DIRECTION
      ?auto_228986 - MODE
      ?auto_228987 - DIRECTION
      ?auto_228988 - MODE
    )
    :vars
    (
      ?auto_228989 - INSTRUMENT
      ?auto_228993 - SATELLITE
      ?auto_228990 - DIRECTION
      ?auto_228991 - DIRECTION
      ?auto_228992 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_228989 ?auto_228993 ) ( SUPPORTS ?auto_228989 ?auto_228983 ) ( not ( = ?auto_228982 ?auto_228990 ) ) ( HAVE_IMAGE ?auto_228987 ?auto_228988 ) ( not ( = ?auto_228987 ?auto_228982 ) ) ( not ( = ?auto_228987 ?auto_228990 ) ) ( not ( = ?auto_228988 ?auto_228983 ) ) ( CALIBRATION_TARGET ?auto_228989 ?auto_228990 ) ( POINTING ?auto_228993 ?auto_228991 ) ( not ( = ?auto_228990 ?auto_228991 ) ) ( not ( = ?auto_228982 ?auto_228991 ) ) ( not ( = ?auto_228987 ?auto_228991 ) ) ( ON_BOARD ?auto_228992 ?auto_228993 ) ( POWER_ON ?auto_228992 ) ( not ( = ?auto_228989 ?auto_228992 ) ) ( HAVE_IMAGE ?auto_228984 ?auto_228981 ) ( HAVE_IMAGE ?auto_228985 ?auto_228986 ) ( not ( = ?auto_228982 ?auto_228984 ) ) ( not ( = ?auto_228982 ?auto_228985 ) ) ( not ( = ?auto_228983 ?auto_228981 ) ) ( not ( = ?auto_228983 ?auto_228986 ) ) ( not ( = ?auto_228984 ?auto_228985 ) ) ( not ( = ?auto_228984 ?auto_228987 ) ) ( not ( = ?auto_228984 ?auto_228990 ) ) ( not ( = ?auto_228984 ?auto_228991 ) ) ( not ( = ?auto_228981 ?auto_228986 ) ) ( not ( = ?auto_228981 ?auto_228988 ) ) ( not ( = ?auto_228985 ?auto_228987 ) ) ( not ( = ?auto_228985 ?auto_228990 ) ) ( not ( = ?auto_228985 ?auto_228991 ) ) ( not ( = ?auto_228986 ?auto_228988 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_228987 ?auto_228988 ?auto_228982 ?auto_228983 )
      ( GET-4IMAGE-VERIFY ?auto_228982 ?auto_228983 ?auto_228984 ?auto_228981 ?auto_228985 ?auto_228986 ?auto_228987 ?auto_228988 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_228995 - DIRECTION
      ?auto_228996 - MODE
      ?auto_228997 - DIRECTION
      ?auto_228994 - MODE
      ?auto_228998 - DIRECTION
      ?auto_228999 - MODE
      ?auto_229000 - DIRECTION
      ?auto_229001 - MODE
    )
    :vars
    (
      ?auto_229002 - INSTRUMENT
      ?auto_229007 - SATELLITE
      ?auto_229003 - DIRECTION
      ?auto_229008 - DIRECTION
      ?auto_229005 - MODE
      ?auto_229004 - DIRECTION
      ?auto_229006 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_229002 ?auto_229007 ) ( SUPPORTS ?auto_229002 ?auto_228996 ) ( not ( = ?auto_228995 ?auto_229003 ) ) ( HAVE_IMAGE ?auto_229008 ?auto_229005 ) ( not ( = ?auto_229008 ?auto_228995 ) ) ( not ( = ?auto_229008 ?auto_229003 ) ) ( not ( = ?auto_229005 ?auto_228996 ) ) ( CALIBRATION_TARGET ?auto_229002 ?auto_229003 ) ( POINTING ?auto_229007 ?auto_229004 ) ( not ( = ?auto_229003 ?auto_229004 ) ) ( not ( = ?auto_228995 ?auto_229004 ) ) ( not ( = ?auto_229008 ?auto_229004 ) ) ( ON_BOARD ?auto_229006 ?auto_229007 ) ( POWER_ON ?auto_229006 ) ( not ( = ?auto_229002 ?auto_229006 ) ) ( HAVE_IMAGE ?auto_228997 ?auto_228994 ) ( HAVE_IMAGE ?auto_228998 ?auto_228999 ) ( HAVE_IMAGE ?auto_229000 ?auto_229001 ) ( not ( = ?auto_228995 ?auto_228997 ) ) ( not ( = ?auto_228995 ?auto_228998 ) ) ( not ( = ?auto_228995 ?auto_229000 ) ) ( not ( = ?auto_228996 ?auto_228994 ) ) ( not ( = ?auto_228996 ?auto_228999 ) ) ( not ( = ?auto_228996 ?auto_229001 ) ) ( not ( = ?auto_228997 ?auto_228998 ) ) ( not ( = ?auto_228997 ?auto_229000 ) ) ( not ( = ?auto_228997 ?auto_229003 ) ) ( not ( = ?auto_228997 ?auto_229008 ) ) ( not ( = ?auto_228997 ?auto_229004 ) ) ( not ( = ?auto_228994 ?auto_228999 ) ) ( not ( = ?auto_228994 ?auto_229001 ) ) ( not ( = ?auto_228994 ?auto_229005 ) ) ( not ( = ?auto_228998 ?auto_229000 ) ) ( not ( = ?auto_228998 ?auto_229003 ) ) ( not ( = ?auto_228998 ?auto_229008 ) ) ( not ( = ?auto_228998 ?auto_229004 ) ) ( not ( = ?auto_228999 ?auto_229001 ) ) ( not ( = ?auto_228999 ?auto_229005 ) ) ( not ( = ?auto_229000 ?auto_229003 ) ) ( not ( = ?auto_229000 ?auto_229008 ) ) ( not ( = ?auto_229000 ?auto_229004 ) ) ( not ( = ?auto_229001 ?auto_229005 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_229008 ?auto_229005 ?auto_228995 ?auto_228996 )
      ( GET-4IMAGE-VERIFY ?auto_228995 ?auto_228996 ?auto_228997 ?auto_228994 ?auto_228998 ?auto_228999 ?auto_229000 ?auto_229001 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_229010 - DIRECTION
      ?auto_229011 - MODE
      ?auto_229012 - DIRECTION
      ?auto_229009 - MODE
      ?auto_229013 - DIRECTION
      ?auto_229014 - MODE
      ?auto_229015 - DIRECTION
      ?auto_229016 - MODE
    )
    :vars
    (
      ?auto_229017 - INSTRUMENT
      ?auto_229021 - SATELLITE
      ?auto_229018 - DIRECTION
      ?auto_229022 - DIRECTION
      ?auto_229019 - MODE
      ?auto_229020 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_229017 ?auto_229021 ) ( SUPPORTS ?auto_229017 ?auto_229011 ) ( not ( = ?auto_229010 ?auto_229018 ) ) ( HAVE_IMAGE ?auto_229022 ?auto_229019 ) ( not ( = ?auto_229022 ?auto_229010 ) ) ( not ( = ?auto_229022 ?auto_229018 ) ) ( not ( = ?auto_229019 ?auto_229011 ) ) ( CALIBRATION_TARGET ?auto_229017 ?auto_229018 ) ( POINTING ?auto_229021 ?auto_229015 ) ( not ( = ?auto_229018 ?auto_229015 ) ) ( not ( = ?auto_229010 ?auto_229015 ) ) ( not ( = ?auto_229022 ?auto_229015 ) ) ( ON_BOARD ?auto_229020 ?auto_229021 ) ( POWER_ON ?auto_229020 ) ( not ( = ?auto_229017 ?auto_229020 ) ) ( HAVE_IMAGE ?auto_229012 ?auto_229009 ) ( HAVE_IMAGE ?auto_229013 ?auto_229014 ) ( HAVE_IMAGE ?auto_229015 ?auto_229016 ) ( not ( = ?auto_229010 ?auto_229012 ) ) ( not ( = ?auto_229010 ?auto_229013 ) ) ( not ( = ?auto_229011 ?auto_229009 ) ) ( not ( = ?auto_229011 ?auto_229014 ) ) ( not ( = ?auto_229011 ?auto_229016 ) ) ( not ( = ?auto_229012 ?auto_229013 ) ) ( not ( = ?auto_229012 ?auto_229015 ) ) ( not ( = ?auto_229012 ?auto_229018 ) ) ( not ( = ?auto_229012 ?auto_229022 ) ) ( not ( = ?auto_229009 ?auto_229014 ) ) ( not ( = ?auto_229009 ?auto_229016 ) ) ( not ( = ?auto_229009 ?auto_229019 ) ) ( not ( = ?auto_229013 ?auto_229015 ) ) ( not ( = ?auto_229013 ?auto_229018 ) ) ( not ( = ?auto_229013 ?auto_229022 ) ) ( not ( = ?auto_229014 ?auto_229016 ) ) ( not ( = ?auto_229014 ?auto_229019 ) ) ( not ( = ?auto_229016 ?auto_229019 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_229022 ?auto_229019 ?auto_229010 ?auto_229011 )
      ( GET-4IMAGE-VERIFY ?auto_229010 ?auto_229011 ?auto_229012 ?auto_229009 ?auto_229013 ?auto_229014 ?auto_229015 ?auto_229016 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_229146 - DIRECTION
      ?auto_229147 - MODE
      ?auto_229148 - DIRECTION
      ?auto_229145 - MODE
      ?auto_229149 - DIRECTION
      ?auto_229150 - MODE
      ?auto_229151 - DIRECTION
      ?auto_229152 - MODE
    )
    :vars
    (
      ?auto_229153 - INSTRUMENT
      ?auto_229156 - SATELLITE
      ?auto_229154 - DIRECTION
      ?auto_229155 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_229153 ?auto_229156 ) ( SUPPORTS ?auto_229153 ?auto_229147 ) ( not ( = ?auto_229146 ?auto_229154 ) ) ( HAVE_IMAGE ?auto_229151 ?auto_229150 ) ( not ( = ?auto_229151 ?auto_229146 ) ) ( not ( = ?auto_229151 ?auto_229154 ) ) ( not ( = ?auto_229150 ?auto_229147 ) ) ( CALIBRATION_TARGET ?auto_229153 ?auto_229154 ) ( POINTING ?auto_229156 ?auto_229148 ) ( not ( = ?auto_229154 ?auto_229148 ) ) ( not ( = ?auto_229146 ?auto_229148 ) ) ( not ( = ?auto_229151 ?auto_229148 ) ) ( ON_BOARD ?auto_229155 ?auto_229156 ) ( POWER_ON ?auto_229155 ) ( not ( = ?auto_229153 ?auto_229155 ) ) ( HAVE_IMAGE ?auto_229148 ?auto_229145 ) ( HAVE_IMAGE ?auto_229149 ?auto_229150 ) ( HAVE_IMAGE ?auto_229151 ?auto_229152 ) ( not ( = ?auto_229146 ?auto_229149 ) ) ( not ( = ?auto_229147 ?auto_229145 ) ) ( not ( = ?auto_229147 ?auto_229152 ) ) ( not ( = ?auto_229148 ?auto_229149 ) ) ( not ( = ?auto_229145 ?auto_229150 ) ) ( not ( = ?auto_229145 ?auto_229152 ) ) ( not ( = ?auto_229149 ?auto_229151 ) ) ( not ( = ?auto_229149 ?auto_229154 ) ) ( not ( = ?auto_229150 ?auto_229152 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_229151 ?auto_229150 ?auto_229146 ?auto_229147 )
      ( GET-4IMAGE-VERIFY ?auto_229146 ?auto_229147 ?auto_229148 ?auto_229145 ?auto_229149 ?auto_229150 ?auto_229151 ?auto_229152 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_229202 - DIRECTION
      ?auto_229203 - MODE
      ?auto_229204 - DIRECTION
      ?auto_229201 - MODE
      ?auto_229205 - DIRECTION
      ?auto_229206 - MODE
      ?auto_229207 - DIRECTION
      ?auto_229208 - MODE
    )
    :vars
    (
      ?auto_229209 - INSTRUMENT
      ?auto_229213 - SATELLITE
      ?auto_229210 - DIRECTION
      ?auto_229214 - DIRECTION
      ?auto_229211 - MODE
      ?auto_229212 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_229209 ?auto_229213 ) ( SUPPORTS ?auto_229209 ?auto_229203 ) ( not ( = ?auto_229202 ?auto_229210 ) ) ( HAVE_IMAGE ?auto_229214 ?auto_229211 ) ( not ( = ?auto_229214 ?auto_229202 ) ) ( not ( = ?auto_229214 ?auto_229210 ) ) ( not ( = ?auto_229211 ?auto_229203 ) ) ( CALIBRATION_TARGET ?auto_229209 ?auto_229210 ) ( POINTING ?auto_229213 ?auto_229204 ) ( not ( = ?auto_229210 ?auto_229204 ) ) ( not ( = ?auto_229202 ?auto_229204 ) ) ( not ( = ?auto_229214 ?auto_229204 ) ) ( ON_BOARD ?auto_229212 ?auto_229213 ) ( POWER_ON ?auto_229212 ) ( not ( = ?auto_229209 ?auto_229212 ) ) ( HAVE_IMAGE ?auto_229204 ?auto_229201 ) ( HAVE_IMAGE ?auto_229205 ?auto_229206 ) ( HAVE_IMAGE ?auto_229207 ?auto_229208 ) ( not ( = ?auto_229202 ?auto_229205 ) ) ( not ( = ?auto_229202 ?auto_229207 ) ) ( not ( = ?auto_229203 ?auto_229201 ) ) ( not ( = ?auto_229203 ?auto_229206 ) ) ( not ( = ?auto_229203 ?auto_229208 ) ) ( not ( = ?auto_229204 ?auto_229205 ) ) ( not ( = ?auto_229204 ?auto_229207 ) ) ( not ( = ?auto_229201 ?auto_229206 ) ) ( not ( = ?auto_229201 ?auto_229208 ) ) ( not ( = ?auto_229201 ?auto_229211 ) ) ( not ( = ?auto_229205 ?auto_229207 ) ) ( not ( = ?auto_229205 ?auto_229210 ) ) ( not ( = ?auto_229205 ?auto_229214 ) ) ( not ( = ?auto_229206 ?auto_229208 ) ) ( not ( = ?auto_229206 ?auto_229211 ) ) ( not ( = ?auto_229207 ?auto_229210 ) ) ( not ( = ?auto_229207 ?auto_229214 ) ) ( not ( = ?auto_229208 ?auto_229211 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_229214 ?auto_229211 ?auto_229202 ?auto_229203 )
      ( GET-4IMAGE-VERIFY ?auto_229202 ?auto_229203 ?auto_229204 ?auto_229201 ?auto_229205 ?auto_229206 ?auto_229207 ?auto_229208 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_229244 - DIRECTION
      ?auto_229245 - MODE
      ?auto_229246 - DIRECTION
      ?auto_229243 - MODE
      ?auto_229247 - DIRECTION
      ?auto_229248 - MODE
      ?auto_229249 - DIRECTION
      ?auto_229250 - MODE
    )
    :vars
    (
      ?auto_229251 - INSTRUMENT
      ?auto_229254 - SATELLITE
      ?auto_229252 - DIRECTION
      ?auto_229253 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_229251 ?auto_229254 ) ( SUPPORTS ?auto_229251 ?auto_229245 ) ( not ( = ?auto_229244 ?auto_229252 ) ) ( HAVE_IMAGE ?auto_229249 ?auto_229250 ) ( not ( = ?auto_229249 ?auto_229244 ) ) ( not ( = ?auto_229249 ?auto_229252 ) ) ( not ( = ?auto_229250 ?auto_229245 ) ) ( CALIBRATION_TARGET ?auto_229251 ?auto_229252 ) ( POINTING ?auto_229254 ?auto_229246 ) ( not ( = ?auto_229252 ?auto_229246 ) ) ( not ( = ?auto_229244 ?auto_229246 ) ) ( not ( = ?auto_229249 ?auto_229246 ) ) ( ON_BOARD ?auto_229253 ?auto_229254 ) ( POWER_ON ?auto_229253 ) ( not ( = ?auto_229251 ?auto_229253 ) ) ( HAVE_IMAGE ?auto_229246 ?auto_229243 ) ( HAVE_IMAGE ?auto_229247 ?auto_229248 ) ( not ( = ?auto_229244 ?auto_229247 ) ) ( not ( = ?auto_229245 ?auto_229243 ) ) ( not ( = ?auto_229245 ?auto_229248 ) ) ( not ( = ?auto_229246 ?auto_229247 ) ) ( not ( = ?auto_229243 ?auto_229248 ) ) ( not ( = ?auto_229243 ?auto_229250 ) ) ( not ( = ?auto_229247 ?auto_229249 ) ) ( not ( = ?auto_229247 ?auto_229252 ) ) ( not ( = ?auto_229248 ?auto_229250 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_229249 ?auto_229250 ?auto_229244 ?auto_229245 )
      ( GET-4IMAGE-VERIFY ?auto_229244 ?auto_229245 ?auto_229246 ?auto_229243 ?auto_229247 ?auto_229248 ?auto_229249 ?auto_229250 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_229840 - DIRECTION
      ?auto_229841 - MODE
      ?auto_229842 - DIRECTION
      ?auto_229839 - MODE
      ?auto_229843 - DIRECTION
      ?auto_229844 - MODE
    )
    :vars
    (
      ?auto_229849 - INSTRUMENT
      ?auto_229846 - SATELLITE
      ?auto_229847 - DIRECTION
      ?auto_229848 - DIRECTION
      ?auto_229845 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_229849 ?auto_229846 ) ( SUPPORTS ?auto_229849 ?auto_229841 ) ( not ( = ?auto_229840 ?auto_229847 ) ) ( HAVE_IMAGE ?auto_229843 ?auto_229844 ) ( not ( = ?auto_229843 ?auto_229840 ) ) ( not ( = ?auto_229843 ?auto_229847 ) ) ( not ( = ?auto_229844 ?auto_229841 ) ) ( CALIBRATION_TARGET ?auto_229849 ?auto_229847 ) ( POINTING ?auto_229846 ?auto_229848 ) ( not ( = ?auto_229847 ?auto_229848 ) ) ( not ( = ?auto_229840 ?auto_229848 ) ) ( not ( = ?auto_229843 ?auto_229848 ) ) ( ON_BOARD ?auto_229845 ?auto_229846 ) ( POWER_ON ?auto_229845 ) ( not ( = ?auto_229849 ?auto_229845 ) ) ( HAVE_IMAGE ?auto_229842 ?auto_229839 ) ( not ( = ?auto_229840 ?auto_229842 ) ) ( not ( = ?auto_229841 ?auto_229839 ) ) ( not ( = ?auto_229842 ?auto_229843 ) ) ( not ( = ?auto_229842 ?auto_229847 ) ) ( not ( = ?auto_229842 ?auto_229848 ) ) ( not ( = ?auto_229839 ?auto_229844 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_229843 ?auto_229844 ?auto_229840 ?auto_229841 )
      ( GET-3IMAGE-VERIFY ?auto_229840 ?auto_229841 ?auto_229842 ?auto_229839 ?auto_229843 ?auto_229844 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_230279 - DIRECTION
      ?auto_230280 - MODE
      ?auto_230281 - DIRECTION
      ?auto_230278 - MODE
      ?auto_230282 - DIRECTION
      ?auto_230283 - MODE
      ?auto_230284 - DIRECTION
      ?auto_230285 - MODE
    )
    :vars
    (
      ?auto_230290 - INSTRUMENT
      ?auto_230287 - SATELLITE
      ?auto_230288 - DIRECTION
      ?auto_230289 - DIRECTION
      ?auto_230286 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_230290 ?auto_230287 ) ( SUPPORTS ?auto_230290 ?auto_230278 ) ( not ( = ?auto_230281 ?auto_230288 ) ) ( HAVE_IMAGE ?auto_230279 ?auto_230283 ) ( not ( = ?auto_230279 ?auto_230281 ) ) ( not ( = ?auto_230279 ?auto_230288 ) ) ( not ( = ?auto_230283 ?auto_230278 ) ) ( CALIBRATION_TARGET ?auto_230290 ?auto_230288 ) ( POINTING ?auto_230287 ?auto_230289 ) ( not ( = ?auto_230288 ?auto_230289 ) ) ( not ( = ?auto_230281 ?auto_230289 ) ) ( not ( = ?auto_230279 ?auto_230289 ) ) ( ON_BOARD ?auto_230286 ?auto_230287 ) ( POWER_ON ?auto_230286 ) ( not ( = ?auto_230290 ?auto_230286 ) ) ( HAVE_IMAGE ?auto_230279 ?auto_230280 ) ( HAVE_IMAGE ?auto_230282 ?auto_230283 ) ( HAVE_IMAGE ?auto_230284 ?auto_230285 ) ( not ( = ?auto_230279 ?auto_230282 ) ) ( not ( = ?auto_230279 ?auto_230284 ) ) ( not ( = ?auto_230280 ?auto_230278 ) ) ( not ( = ?auto_230280 ?auto_230283 ) ) ( not ( = ?auto_230280 ?auto_230285 ) ) ( not ( = ?auto_230281 ?auto_230282 ) ) ( not ( = ?auto_230281 ?auto_230284 ) ) ( not ( = ?auto_230278 ?auto_230285 ) ) ( not ( = ?auto_230282 ?auto_230284 ) ) ( not ( = ?auto_230282 ?auto_230288 ) ) ( not ( = ?auto_230282 ?auto_230289 ) ) ( not ( = ?auto_230283 ?auto_230285 ) ) ( not ( = ?auto_230284 ?auto_230288 ) ) ( not ( = ?auto_230284 ?auto_230289 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_230279 ?auto_230283 ?auto_230281 ?auto_230278 )
      ( GET-4IMAGE-VERIFY ?auto_230279 ?auto_230280 ?auto_230281 ?auto_230278 ?auto_230282 ?auto_230283 ?auto_230284 ?auto_230285 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_230518 - DIRECTION
      ?auto_230519 - MODE
      ?auto_230520 - DIRECTION
      ?auto_230517 - MODE
      ?auto_230521 - DIRECTION
      ?auto_230522 - MODE
      ?auto_230523 - DIRECTION
      ?auto_230524 - MODE
    )
    :vars
    (
      ?auto_230529 - INSTRUMENT
      ?auto_230526 - SATELLITE
      ?auto_230527 - DIRECTION
      ?auto_230528 - DIRECTION
      ?auto_230525 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_230529 ?auto_230526 ) ( SUPPORTS ?auto_230529 ?auto_230522 ) ( not ( = ?auto_230521 ?auto_230527 ) ) ( HAVE_IMAGE ?auto_230520 ?auto_230524 ) ( not ( = ?auto_230520 ?auto_230521 ) ) ( not ( = ?auto_230520 ?auto_230527 ) ) ( not ( = ?auto_230524 ?auto_230522 ) ) ( CALIBRATION_TARGET ?auto_230529 ?auto_230527 ) ( POINTING ?auto_230526 ?auto_230528 ) ( not ( = ?auto_230527 ?auto_230528 ) ) ( not ( = ?auto_230521 ?auto_230528 ) ) ( not ( = ?auto_230520 ?auto_230528 ) ) ( ON_BOARD ?auto_230525 ?auto_230526 ) ( POWER_ON ?auto_230525 ) ( not ( = ?auto_230529 ?auto_230525 ) ) ( HAVE_IMAGE ?auto_230518 ?auto_230519 ) ( HAVE_IMAGE ?auto_230520 ?auto_230517 ) ( HAVE_IMAGE ?auto_230523 ?auto_230524 ) ( not ( = ?auto_230518 ?auto_230520 ) ) ( not ( = ?auto_230518 ?auto_230521 ) ) ( not ( = ?auto_230518 ?auto_230523 ) ) ( not ( = ?auto_230518 ?auto_230527 ) ) ( not ( = ?auto_230518 ?auto_230528 ) ) ( not ( = ?auto_230519 ?auto_230517 ) ) ( not ( = ?auto_230519 ?auto_230522 ) ) ( not ( = ?auto_230519 ?auto_230524 ) ) ( not ( = ?auto_230520 ?auto_230523 ) ) ( not ( = ?auto_230517 ?auto_230522 ) ) ( not ( = ?auto_230517 ?auto_230524 ) ) ( not ( = ?auto_230521 ?auto_230523 ) ) ( not ( = ?auto_230523 ?auto_230527 ) ) ( not ( = ?auto_230523 ?auto_230528 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_230520 ?auto_230524 ?auto_230521 ?auto_230522 )
      ( GET-4IMAGE-VERIFY ?auto_230518 ?auto_230519 ?auto_230520 ?auto_230517 ?auto_230521 ?auto_230522 ?auto_230523 ?auto_230524 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_232410 - DIRECTION
      ?auto_232411 - MODE
      ?auto_232412 - DIRECTION
      ?auto_232409 - MODE
      ?auto_232413 - DIRECTION
      ?auto_232414 - MODE
    )
    :vars
    (
      ?auto_232416 - INSTRUMENT
      ?auto_232418 - SATELLITE
      ?auto_232415 - DIRECTION
      ?auto_232417 - DIRECTION
      ?auto_232419 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_232416 ?auto_232418 ) ( SUPPORTS ?auto_232416 ?auto_232409 ) ( not ( = ?auto_232412 ?auto_232415 ) ) ( HAVE_IMAGE ?auto_232410 ?auto_232414 ) ( not ( = ?auto_232410 ?auto_232412 ) ) ( not ( = ?auto_232410 ?auto_232415 ) ) ( not ( = ?auto_232414 ?auto_232409 ) ) ( CALIBRATION_TARGET ?auto_232416 ?auto_232415 ) ( not ( = ?auto_232415 ?auto_232417 ) ) ( not ( = ?auto_232412 ?auto_232417 ) ) ( not ( = ?auto_232410 ?auto_232417 ) ) ( ON_BOARD ?auto_232419 ?auto_232418 ) ( POWER_ON ?auto_232419 ) ( not ( = ?auto_232416 ?auto_232419 ) ) ( POINTING ?auto_232418 ?auto_232415 ) ( HAVE_IMAGE ?auto_232410 ?auto_232411 ) ( HAVE_IMAGE ?auto_232413 ?auto_232414 ) ( not ( = ?auto_232410 ?auto_232413 ) ) ( not ( = ?auto_232411 ?auto_232409 ) ) ( not ( = ?auto_232411 ?auto_232414 ) ) ( not ( = ?auto_232412 ?auto_232413 ) ) ( not ( = ?auto_232413 ?auto_232415 ) ) ( not ( = ?auto_232413 ?auto_232417 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_232410 ?auto_232414 ?auto_232412 ?auto_232409 )
      ( GET-3IMAGE-VERIFY ?auto_232410 ?auto_232411 ?auto_232412 ?auto_232409 ?auto_232413 ?auto_232414 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_235194 - DIRECTION
      ?auto_235195 - MODE
      ?auto_235196 - DIRECTION
      ?auto_235193 - MODE
      ?auto_235197 - DIRECTION
      ?auto_235198 - MODE
    )
    :vars
    (
      ?auto_235202 - INSTRUMENT
      ?auto_235199 - SATELLITE
      ?auto_235201 - DIRECTION
      ?auto_235200 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_235202 ?auto_235199 ) ( SUPPORTS ?auto_235202 ?auto_235193 ) ( not ( = ?auto_235196 ?auto_235201 ) ) ( HAVE_IMAGE ?auto_235194 ?auto_235195 ) ( not ( = ?auto_235194 ?auto_235196 ) ) ( not ( = ?auto_235194 ?auto_235201 ) ) ( not ( = ?auto_235195 ?auto_235193 ) ) ( CALIBRATION_TARGET ?auto_235202 ?auto_235201 ) ( not ( = ?auto_235201 ?auto_235197 ) ) ( not ( = ?auto_235196 ?auto_235197 ) ) ( not ( = ?auto_235194 ?auto_235197 ) ) ( ON_BOARD ?auto_235200 ?auto_235199 ) ( POWER_ON ?auto_235200 ) ( not ( = ?auto_235202 ?auto_235200 ) ) ( POINTING ?auto_235199 ?auto_235201 ) ( HAVE_IMAGE ?auto_235197 ?auto_235198 ) ( not ( = ?auto_235195 ?auto_235198 ) ) ( not ( = ?auto_235193 ?auto_235198 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_235194 ?auto_235195 ?auto_235196 ?auto_235193 )
      ( GET-3IMAGE-VERIFY ?auto_235194 ?auto_235195 ?auto_235196 ?auto_235193 ?auto_235197 ?auto_235198 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_232453 - DIRECTION
      ?auto_232454 - MODE
      ?auto_232455 - DIRECTION
      ?auto_232452 - MODE
      ?auto_232456 - DIRECTION
      ?auto_232457 - MODE
    )
    :vars
    (
      ?auto_232459 - INSTRUMENT
      ?auto_232461 - SATELLITE
      ?auto_232458 - DIRECTION
      ?auto_232460 - DIRECTION
      ?auto_232462 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_232459 ?auto_232461 ) ( SUPPORTS ?auto_232459 ?auto_232457 ) ( not ( = ?auto_232456 ?auto_232458 ) ) ( HAVE_IMAGE ?auto_232455 ?auto_232452 ) ( not ( = ?auto_232455 ?auto_232456 ) ) ( not ( = ?auto_232455 ?auto_232458 ) ) ( not ( = ?auto_232452 ?auto_232457 ) ) ( CALIBRATION_TARGET ?auto_232459 ?auto_232458 ) ( not ( = ?auto_232458 ?auto_232460 ) ) ( not ( = ?auto_232456 ?auto_232460 ) ) ( not ( = ?auto_232455 ?auto_232460 ) ) ( ON_BOARD ?auto_232462 ?auto_232461 ) ( POWER_ON ?auto_232462 ) ( not ( = ?auto_232459 ?auto_232462 ) ) ( POINTING ?auto_232461 ?auto_232458 ) ( HAVE_IMAGE ?auto_232453 ?auto_232454 ) ( not ( = ?auto_232453 ?auto_232455 ) ) ( not ( = ?auto_232453 ?auto_232456 ) ) ( not ( = ?auto_232453 ?auto_232458 ) ) ( not ( = ?auto_232453 ?auto_232460 ) ) ( not ( = ?auto_232454 ?auto_232452 ) ) ( not ( = ?auto_232454 ?auto_232457 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_232455 ?auto_232452 ?auto_232456 ?auto_232457 )
      ( GET-3IMAGE-VERIFY ?auto_232453 ?auto_232454 ?auto_232455 ?auto_232452 ?auto_232456 ?auto_232457 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_235232 - DIRECTION
      ?auto_235233 - MODE
      ?auto_235234 - DIRECTION
      ?auto_235231 - MODE
      ?auto_235235 - DIRECTION
      ?auto_235236 - MODE
    )
    :vars
    (
      ?auto_235242 - INSTRUMENT
      ?auto_235237 - SATELLITE
      ?auto_235239 - DIRECTION
      ?auto_235240 - DIRECTION
      ?auto_235241 - MODE
      ?auto_235238 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_235242 ?auto_235237 ) ( SUPPORTS ?auto_235242 ?auto_235236 ) ( not ( = ?auto_235235 ?auto_235239 ) ) ( HAVE_IMAGE ?auto_235240 ?auto_235241 ) ( not ( = ?auto_235240 ?auto_235235 ) ) ( not ( = ?auto_235240 ?auto_235239 ) ) ( not ( = ?auto_235241 ?auto_235236 ) ) ( CALIBRATION_TARGET ?auto_235242 ?auto_235239 ) ( not ( = ?auto_235239 ?auto_235234 ) ) ( not ( = ?auto_235235 ?auto_235234 ) ) ( not ( = ?auto_235240 ?auto_235234 ) ) ( ON_BOARD ?auto_235238 ?auto_235237 ) ( POWER_ON ?auto_235238 ) ( not ( = ?auto_235242 ?auto_235238 ) ) ( POINTING ?auto_235237 ?auto_235239 ) ( HAVE_IMAGE ?auto_235232 ?auto_235233 ) ( HAVE_IMAGE ?auto_235234 ?auto_235231 ) ( not ( = ?auto_235232 ?auto_235234 ) ) ( not ( = ?auto_235232 ?auto_235235 ) ) ( not ( = ?auto_235232 ?auto_235239 ) ) ( not ( = ?auto_235232 ?auto_235240 ) ) ( not ( = ?auto_235233 ?auto_235231 ) ) ( not ( = ?auto_235233 ?auto_235236 ) ) ( not ( = ?auto_235233 ?auto_235241 ) ) ( not ( = ?auto_235231 ?auto_235236 ) ) ( not ( = ?auto_235231 ?auto_235241 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_235240 ?auto_235241 ?auto_235235 ?auto_235236 )
      ( GET-3IMAGE-VERIFY ?auto_235232 ?auto_235233 ?auto_235234 ?auto_235231 ?auto_235235 ?auto_235236 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_232489 - DIRECTION
      ?auto_232490 - MODE
      ?auto_232491 - DIRECTION
      ?auto_232488 - MODE
      ?auto_232492 - DIRECTION
      ?auto_232493 - MODE
    )
    :vars
    (
      ?auto_232495 - INSTRUMENT
      ?auto_232497 - SATELLITE
      ?auto_232494 - DIRECTION
      ?auto_232496 - DIRECTION
      ?auto_232498 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_232495 ?auto_232497 ) ( SUPPORTS ?auto_232495 ?auto_232488 ) ( not ( = ?auto_232491 ?auto_232494 ) ) ( HAVE_IMAGE ?auto_232492 ?auto_232493 ) ( not ( = ?auto_232492 ?auto_232491 ) ) ( not ( = ?auto_232492 ?auto_232494 ) ) ( not ( = ?auto_232493 ?auto_232488 ) ) ( CALIBRATION_TARGET ?auto_232495 ?auto_232494 ) ( not ( = ?auto_232494 ?auto_232496 ) ) ( not ( = ?auto_232491 ?auto_232496 ) ) ( not ( = ?auto_232492 ?auto_232496 ) ) ( ON_BOARD ?auto_232498 ?auto_232497 ) ( POWER_ON ?auto_232498 ) ( not ( = ?auto_232495 ?auto_232498 ) ) ( POINTING ?auto_232497 ?auto_232494 ) ( HAVE_IMAGE ?auto_232489 ?auto_232490 ) ( not ( = ?auto_232489 ?auto_232491 ) ) ( not ( = ?auto_232489 ?auto_232492 ) ) ( not ( = ?auto_232489 ?auto_232494 ) ) ( not ( = ?auto_232489 ?auto_232496 ) ) ( not ( = ?auto_232490 ?auto_232488 ) ) ( not ( = ?auto_232490 ?auto_232493 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_232492 ?auto_232493 ?auto_232491 ?auto_232488 )
      ( GET-3IMAGE-VERIFY ?auto_232489 ?auto_232490 ?auto_232491 ?auto_232488 ?auto_232492 ?auto_232493 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_235262 - DIRECTION
      ?auto_235263 - MODE
      ?auto_235264 - DIRECTION
      ?auto_235261 - MODE
      ?auto_235265 - DIRECTION
      ?auto_235266 - MODE
    )
    :vars
    (
      ?auto_235272 - INSTRUMENT
      ?auto_235267 - SATELLITE
      ?auto_235269 - DIRECTION
      ?auto_235270 - DIRECTION
      ?auto_235271 - MODE
      ?auto_235268 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_235272 ?auto_235267 ) ( SUPPORTS ?auto_235272 ?auto_235261 ) ( not ( = ?auto_235264 ?auto_235269 ) ) ( HAVE_IMAGE ?auto_235270 ?auto_235271 ) ( not ( = ?auto_235270 ?auto_235264 ) ) ( not ( = ?auto_235270 ?auto_235269 ) ) ( not ( = ?auto_235271 ?auto_235261 ) ) ( CALIBRATION_TARGET ?auto_235272 ?auto_235269 ) ( not ( = ?auto_235269 ?auto_235265 ) ) ( not ( = ?auto_235264 ?auto_235265 ) ) ( not ( = ?auto_235270 ?auto_235265 ) ) ( ON_BOARD ?auto_235268 ?auto_235267 ) ( POWER_ON ?auto_235268 ) ( not ( = ?auto_235272 ?auto_235268 ) ) ( POINTING ?auto_235267 ?auto_235269 ) ( HAVE_IMAGE ?auto_235262 ?auto_235263 ) ( HAVE_IMAGE ?auto_235265 ?auto_235266 ) ( not ( = ?auto_235262 ?auto_235264 ) ) ( not ( = ?auto_235262 ?auto_235265 ) ) ( not ( = ?auto_235262 ?auto_235269 ) ) ( not ( = ?auto_235262 ?auto_235270 ) ) ( not ( = ?auto_235263 ?auto_235261 ) ) ( not ( = ?auto_235263 ?auto_235266 ) ) ( not ( = ?auto_235263 ?auto_235271 ) ) ( not ( = ?auto_235261 ?auto_235266 ) ) ( not ( = ?auto_235266 ?auto_235271 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_235270 ?auto_235271 ?auto_235264 ?auto_235261 )
      ( GET-3IMAGE-VERIFY ?auto_235262 ?auto_235263 ?auto_235264 ?auto_235261 ?auto_235265 ?auto_235266 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_232618 - DIRECTION
      ?auto_232619 - MODE
      ?auto_232620 - DIRECTION
      ?auto_232617 - MODE
      ?auto_232621 - DIRECTION
      ?auto_232622 - MODE
    )
    :vars
    (
      ?auto_232624 - INSTRUMENT
      ?auto_232626 - SATELLITE
      ?auto_232623 - DIRECTION
      ?auto_232625 - DIRECTION
      ?auto_232627 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_232624 ?auto_232626 ) ( SUPPORTS ?auto_232624 ?auto_232619 ) ( not ( = ?auto_232618 ?auto_232623 ) ) ( HAVE_IMAGE ?auto_232621 ?auto_232617 ) ( not ( = ?auto_232621 ?auto_232618 ) ) ( not ( = ?auto_232621 ?auto_232623 ) ) ( not ( = ?auto_232617 ?auto_232619 ) ) ( CALIBRATION_TARGET ?auto_232624 ?auto_232623 ) ( not ( = ?auto_232623 ?auto_232625 ) ) ( not ( = ?auto_232618 ?auto_232625 ) ) ( not ( = ?auto_232621 ?auto_232625 ) ) ( ON_BOARD ?auto_232627 ?auto_232626 ) ( POWER_ON ?auto_232627 ) ( not ( = ?auto_232624 ?auto_232627 ) ) ( POINTING ?auto_232626 ?auto_232623 ) ( HAVE_IMAGE ?auto_232620 ?auto_232617 ) ( HAVE_IMAGE ?auto_232621 ?auto_232622 ) ( not ( = ?auto_232618 ?auto_232620 ) ) ( not ( = ?auto_232619 ?auto_232622 ) ) ( not ( = ?auto_232620 ?auto_232621 ) ) ( not ( = ?auto_232620 ?auto_232623 ) ) ( not ( = ?auto_232620 ?auto_232625 ) ) ( not ( = ?auto_232617 ?auto_232622 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_232621 ?auto_232617 ?auto_232618 ?auto_232619 )
      ( GET-3IMAGE-VERIFY ?auto_232618 ?auto_232619 ?auto_232620 ?auto_232617 ?auto_232621 ?auto_232622 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_232661 - DIRECTION
      ?auto_232662 - MODE
      ?auto_232663 - DIRECTION
      ?auto_232660 - MODE
      ?auto_232664 - DIRECTION
      ?auto_232665 - MODE
    )
    :vars
    (
      ?auto_232667 - INSTRUMENT
      ?auto_232669 - SATELLITE
      ?auto_232666 - DIRECTION
      ?auto_232668 - DIRECTION
      ?auto_232670 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_232667 ?auto_232669 ) ( SUPPORTS ?auto_232667 ?auto_232662 ) ( not ( = ?auto_232661 ?auto_232666 ) ) ( HAVE_IMAGE ?auto_232664 ?auto_232665 ) ( not ( = ?auto_232664 ?auto_232661 ) ) ( not ( = ?auto_232664 ?auto_232666 ) ) ( not ( = ?auto_232665 ?auto_232662 ) ) ( CALIBRATION_TARGET ?auto_232667 ?auto_232666 ) ( not ( = ?auto_232666 ?auto_232668 ) ) ( not ( = ?auto_232661 ?auto_232668 ) ) ( not ( = ?auto_232664 ?auto_232668 ) ) ( ON_BOARD ?auto_232670 ?auto_232669 ) ( POWER_ON ?auto_232670 ) ( not ( = ?auto_232667 ?auto_232670 ) ) ( POINTING ?auto_232669 ?auto_232666 ) ( HAVE_IMAGE ?auto_232663 ?auto_232660 ) ( not ( = ?auto_232661 ?auto_232663 ) ) ( not ( = ?auto_232662 ?auto_232660 ) ) ( not ( = ?auto_232663 ?auto_232664 ) ) ( not ( = ?auto_232663 ?auto_232666 ) ) ( not ( = ?auto_232663 ?auto_232668 ) ) ( not ( = ?auto_232660 ?auto_232665 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_232664 ?auto_232665 ?auto_232661 ?auto_232662 )
      ( GET-3IMAGE-VERIFY ?auto_232661 ?auto_232662 ?auto_232663 ?auto_232660 ?auto_232664 ?auto_232665 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_235432 - DIRECTION
      ?auto_235433 - MODE
      ?auto_235434 - DIRECTION
      ?auto_235431 - MODE
      ?auto_235435 - DIRECTION
      ?auto_235436 - MODE
    )
    :vars
    (
      ?auto_235442 - INSTRUMENT
      ?auto_235437 - SATELLITE
      ?auto_235439 - DIRECTION
      ?auto_235440 - DIRECTION
      ?auto_235441 - MODE
      ?auto_235438 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_235442 ?auto_235437 ) ( SUPPORTS ?auto_235442 ?auto_235433 ) ( not ( = ?auto_235432 ?auto_235439 ) ) ( HAVE_IMAGE ?auto_235440 ?auto_235441 ) ( not ( = ?auto_235440 ?auto_235432 ) ) ( not ( = ?auto_235440 ?auto_235439 ) ) ( not ( = ?auto_235441 ?auto_235433 ) ) ( CALIBRATION_TARGET ?auto_235442 ?auto_235439 ) ( not ( = ?auto_235439 ?auto_235434 ) ) ( not ( = ?auto_235432 ?auto_235434 ) ) ( not ( = ?auto_235440 ?auto_235434 ) ) ( ON_BOARD ?auto_235438 ?auto_235437 ) ( POWER_ON ?auto_235438 ) ( not ( = ?auto_235442 ?auto_235438 ) ) ( POINTING ?auto_235437 ?auto_235439 ) ( HAVE_IMAGE ?auto_235434 ?auto_235431 ) ( HAVE_IMAGE ?auto_235435 ?auto_235436 ) ( not ( = ?auto_235432 ?auto_235435 ) ) ( not ( = ?auto_235433 ?auto_235431 ) ) ( not ( = ?auto_235433 ?auto_235436 ) ) ( not ( = ?auto_235434 ?auto_235435 ) ) ( not ( = ?auto_235431 ?auto_235436 ) ) ( not ( = ?auto_235431 ?auto_235441 ) ) ( not ( = ?auto_235435 ?auto_235439 ) ) ( not ( = ?auto_235435 ?auto_235440 ) ) ( not ( = ?auto_235436 ?auto_235441 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_235440 ?auto_235441 ?auto_235432 ?auto_235433 )
      ( GET-3IMAGE-VERIFY ?auto_235432 ?auto_235433 ?auto_235434 ?auto_235431 ?auto_235435 ?auto_235436 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_235655 - DIRECTION
      ?auto_235656 - MODE
      ?auto_235657 - DIRECTION
      ?auto_235654 - MODE
      ?auto_235658 - DIRECTION
      ?auto_235659 - MODE
      ?auto_235660 - DIRECTION
      ?auto_235661 - MODE
    )
    :vars
    (
      ?auto_235665 - INSTRUMENT
      ?auto_235662 - SATELLITE
      ?auto_235664 - DIRECTION
      ?auto_235663 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_235665 ?auto_235662 ) ( SUPPORTS ?auto_235665 ?auto_235661 ) ( not ( = ?auto_235660 ?auto_235664 ) ) ( HAVE_IMAGE ?auto_235658 ?auto_235659 ) ( not ( = ?auto_235658 ?auto_235660 ) ) ( not ( = ?auto_235658 ?auto_235664 ) ) ( not ( = ?auto_235659 ?auto_235661 ) ) ( CALIBRATION_TARGET ?auto_235665 ?auto_235664 ) ( not ( = ?auto_235664 ?auto_235657 ) ) ( not ( = ?auto_235660 ?auto_235657 ) ) ( not ( = ?auto_235658 ?auto_235657 ) ) ( ON_BOARD ?auto_235663 ?auto_235662 ) ( POWER_ON ?auto_235663 ) ( not ( = ?auto_235665 ?auto_235663 ) ) ( POINTING ?auto_235662 ?auto_235664 ) ( HAVE_IMAGE ?auto_235655 ?auto_235656 ) ( HAVE_IMAGE ?auto_235657 ?auto_235654 ) ( not ( = ?auto_235655 ?auto_235657 ) ) ( not ( = ?auto_235655 ?auto_235658 ) ) ( not ( = ?auto_235655 ?auto_235660 ) ) ( not ( = ?auto_235655 ?auto_235664 ) ) ( not ( = ?auto_235656 ?auto_235654 ) ) ( not ( = ?auto_235656 ?auto_235659 ) ) ( not ( = ?auto_235656 ?auto_235661 ) ) ( not ( = ?auto_235654 ?auto_235659 ) ) ( not ( = ?auto_235654 ?auto_235661 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_235658 ?auto_235659 ?auto_235660 ?auto_235661 )
      ( GET-4IMAGE-VERIFY ?auto_235655 ?auto_235656 ?auto_235657 ?auto_235654 ?auto_235658 ?auto_235659 ?auto_235660 ?auto_235661 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_236029 - DIRECTION
      ?auto_236030 - MODE
      ?auto_236031 - DIRECTION
      ?auto_236028 - MODE
      ?auto_236032 - DIRECTION
      ?auto_236033 - MODE
      ?auto_236034 - DIRECTION
      ?auto_236035 - MODE
    )
    :vars
    (
      ?auto_236039 - INSTRUMENT
      ?auto_236036 - SATELLITE
      ?auto_236038 - DIRECTION
      ?auto_236037 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_236039 ?auto_236036 ) ( SUPPORTS ?auto_236039 ?auto_236035 ) ( not ( = ?auto_236034 ?auto_236038 ) ) ( HAVE_IMAGE ?auto_236031 ?auto_236028 ) ( not ( = ?auto_236031 ?auto_236034 ) ) ( not ( = ?auto_236031 ?auto_236038 ) ) ( not ( = ?auto_236028 ?auto_236035 ) ) ( CALIBRATION_TARGET ?auto_236039 ?auto_236038 ) ( not ( = ?auto_236038 ?auto_236029 ) ) ( not ( = ?auto_236034 ?auto_236029 ) ) ( not ( = ?auto_236031 ?auto_236029 ) ) ( ON_BOARD ?auto_236037 ?auto_236036 ) ( POWER_ON ?auto_236037 ) ( not ( = ?auto_236039 ?auto_236037 ) ) ( POINTING ?auto_236036 ?auto_236038 ) ( HAVE_IMAGE ?auto_236029 ?auto_236030 ) ( HAVE_IMAGE ?auto_236032 ?auto_236033 ) ( not ( = ?auto_236029 ?auto_236032 ) ) ( not ( = ?auto_236030 ?auto_236028 ) ) ( not ( = ?auto_236030 ?auto_236033 ) ) ( not ( = ?auto_236030 ?auto_236035 ) ) ( not ( = ?auto_236031 ?auto_236032 ) ) ( not ( = ?auto_236028 ?auto_236033 ) ) ( not ( = ?auto_236032 ?auto_236034 ) ) ( not ( = ?auto_236032 ?auto_236038 ) ) ( not ( = ?auto_236033 ?auto_236035 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_236031 ?auto_236028 ?auto_236034 ?auto_236035 )
      ( GET-4IMAGE-VERIFY ?auto_236029 ?auto_236030 ?auto_236031 ?auto_236028 ?auto_236032 ?auto_236033 ?auto_236034 ?auto_236035 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_235691 - DIRECTION
      ?auto_235692 - MODE
      ?auto_235693 - DIRECTION
      ?auto_235690 - MODE
      ?auto_235694 - DIRECTION
      ?auto_235695 - MODE
      ?auto_235696 - DIRECTION
      ?auto_235697 - MODE
    )
    :vars
    (
      ?auto_235701 - INSTRUMENT
      ?auto_235698 - SATELLITE
      ?auto_235700 - DIRECTION
      ?auto_235699 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_235701 ?auto_235698 ) ( SUPPORTS ?auto_235701 ?auto_235695 ) ( not ( = ?auto_235694 ?auto_235700 ) ) ( HAVE_IMAGE ?auto_235691 ?auto_235697 ) ( not ( = ?auto_235691 ?auto_235694 ) ) ( not ( = ?auto_235691 ?auto_235700 ) ) ( not ( = ?auto_235697 ?auto_235695 ) ) ( CALIBRATION_TARGET ?auto_235701 ?auto_235700 ) ( not ( = ?auto_235700 ?auto_235693 ) ) ( not ( = ?auto_235694 ?auto_235693 ) ) ( not ( = ?auto_235691 ?auto_235693 ) ) ( ON_BOARD ?auto_235699 ?auto_235698 ) ( POWER_ON ?auto_235699 ) ( not ( = ?auto_235701 ?auto_235699 ) ) ( POINTING ?auto_235698 ?auto_235700 ) ( HAVE_IMAGE ?auto_235691 ?auto_235692 ) ( HAVE_IMAGE ?auto_235693 ?auto_235690 ) ( HAVE_IMAGE ?auto_235696 ?auto_235697 ) ( not ( = ?auto_235691 ?auto_235696 ) ) ( not ( = ?auto_235692 ?auto_235690 ) ) ( not ( = ?auto_235692 ?auto_235695 ) ) ( not ( = ?auto_235692 ?auto_235697 ) ) ( not ( = ?auto_235693 ?auto_235696 ) ) ( not ( = ?auto_235690 ?auto_235695 ) ) ( not ( = ?auto_235690 ?auto_235697 ) ) ( not ( = ?auto_235694 ?auto_235696 ) ) ( not ( = ?auto_235696 ?auto_235700 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_235691 ?auto_235697 ?auto_235694 ?auto_235695 )
      ( GET-4IMAGE-VERIFY ?auto_235691 ?auto_235692 ?auto_235693 ?auto_235690 ?auto_235694 ?auto_235695 ?auto_235696 ?auto_235697 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_232856 - DIRECTION
      ?auto_232857 - MODE
      ?auto_232858 - DIRECTION
      ?auto_232855 - MODE
      ?auto_232859 - DIRECTION
      ?auto_232860 - MODE
      ?auto_232861 - DIRECTION
      ?auto_232862 - MODE
    )
    :vars
    (
      ?auto_232864 - INSTRUMENT
      ?auto_232866 - SATELLITE
      ?auto_232863 - DIRECTION
      ?auto_232865 - DIRECTION
      ?auto_232867 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_232864 ?auto_232866 ) ( SUPPORTS ?auto_232864 ?auto_232860 ) ( not ( = ?auto_232859 ?auto_232863 ) ) ( HAVE_IMAGE ?auto_232858 ?auto_232857 ) ( not ( = ?auto_232858 ?auto_232859 ) ) ( not ( = ?auto_232858 ?auto_232863 ) ) ( not ( = ?auto_232857 ?auto_232860 ) ) ( CALIBRATION_TARGET ?auto_232864 ?auto_232863 ) ( not ( = ?auto_232863 ?auto_232865 ) ) ( not ( = ?auto_232859 ?auto_232865 ) ) ( not ( = ?auto_232858 ?auto_232865 ) ) ( ON_BOARD ?auto_232867 ?auto_232866 ) ( POWER_ON ?auto_232867 ) ( not ( = ?auto_232864 ?auto_232867 ) ) ( POINTING ?auto_232866 ?auto_232863 ) ( HAVE_IMAGE ?auto_232856 ?auto_232857 ) ( HAVE_IMAGE ?auto_232858 ?auto_232855 ) ( HAVE_IMAGE ?auto_232861 ?auto_232862 ) ( not ( = ?auto_232856 ?auto_232858 ) ) ( not ( = ?auto_232856 ?auto_232859 ) ) ( not ( = ?auto_232856 ?auto_232861 ) ) ( not ( = ?auto_232856 ?auto_232863 ) ) ( not ( = ?auto_232856 ?auto_232865 ) ) ( not ( = ?auto_232857 ?auto_232855 ) ) ( not ( = ?auto_232857 ?auto_232862 ) ) ( not ( = ?auto_232858 ?auto_232861 ) ) ( not ( = ?auto_232855 ?auto_232860 ) ) ( not ( = ?auto_232855 ?auto_232862 ) ) ( not ( = ?auto_232859 ?auto_232861 ) ) ( not ( = ?auto_232860 ?auto_232862 ) ) ( not ( = ?auto_232861 ?auto_232863 ) ) ( not ( = ?auto_232861 ?auto_232865 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_232858 ?auto_232857 ?auto_232859 ?auto_232860 )
      ( GET-4IMAGE-VERIFY ?auto_232856 ?auto_232857 ?auto_232858 ?auto_232855 ?auto_232859 ?auto_232860 ?auto_232861 ?auto_232862 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_232894 - DIRECTION
      ?auto_232895 - MODE
      ?auto_232896 - DIRECTION
      ?auto_232893 - MODE
      ?auto_232897 - DIRECTION
      ?auto_232898 - MODE
      ?auto_232899 - DIRECTION
      ?auto_232900 - MODE
    )
    :vars
    (
      ?auto_232902 - INSTRUMENT
      ?auto_232904 - SATELLITE
      ?auto_232901 - DIRECTION
      ?auto_232903 - DIRECTION
      ?auto_232905 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_232902 ?auto_232904 ) ( SUPPORTS ?auto_232902 ?auto_232900 ) ( not ( = ?auto_232899 ?auto_232901 ) ) ( HAVE_IMAGE ?auto_232894 ?auto_232898 ) ( not ( = ?auto_232894 ?auto_232899 ) ) ( not ( = ?auto_232894 ?auto_232901 ) ) ( not ( = ?auto_232898 ?auto_232900 ) ) ( CALIBRATION_TARGET ?auto_232902 ?auto_232901 ) ( not ( = ?auto_232901 ?auto_232903 ) ) ( not ( = ?auto_232899 ?auto_232903 ) ) ( not ( = ?auto_232894 ?auto_232903 ) ) ( ON_BOARD ?auto_232905 ?auto_232904 ) ( POWER_ON ?auto_232905 ) ( not ( = ?auto_232902 ?auto_232905 ) ) ( POINTING ?auto_232904 ?auto_232901 ) ( HAVE_IMAGE ?auto_232894 ?auto_232895 ) ( HAVE_IMAGE ?auto_232896 ?auto_232893 ) ( HAVE_IMAGE ?auto_232897 ?auto_232898 ) ( not ( = ?auto_232894 ?auto_232896 ) ) ( not ( = ?auto_232894 ?auto_232897 ) ) ( not ( = ?auto_232895 ?auto_232893 ) ) ( not ( = ?auto_232895 ?auto_232898 ) ) ( not ( = ?auto_232895 ?auto_232900 ) ) ( not ( = ?auto_232896 ?auto_232897 ) ) ( not ( = ?auto_232896 ?auto_232899 ) ) ( not ( = ?auto_232896 ?auto_232901 ) ) ( not ( = ?auto_232896 ?auto_232903 ) ) ( not ( = ?auto_232893 ?auto_232898 ) ) ( not ( = ?auto_232893 ?auto_232900 ) ) ( not ( = ?auto_232897 ?auto_232899 ) ) ( not ( = ?auto_232897 ?auto_232901 ) ) ( not ( = ?auto_232897 ?auto_232903 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_232894 ?auto_232898 ?auto_232899 ?auto_232900 )
      ( GET-4IMAGE-VERIFY ?auto_232894 ?auto_232895 ?auto_232896 ?auto_232893 ?auto_232897 ?auto_232898 ?auto_232899 ?auto_232900 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_235617 - DIRECTION
      ?auto_235618 - MODE
      ?auto_235619 - DIRECTION
      ?auto_235616 - MODE
      ?auto_235620 - DIRECTION
      ?auto_235621 - MODE
      ?auto_235622 - DIRECTION
      ?auto_235623 - MODE
    )
    :vars
    (
      ?auto_235627 - INSTRUMENT
      ?auto_235624 - SATELLITE
      ?auto_235626 - DIRECTION
      ?auto_235625 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_235627 ?auto_235624 ) ( SUPPORTS ?auto_235627 ?auto_235621 ) ( not ( = ?auto_235620 ?auto_235626 ) ) ( HAVE_IMAGE ?auto_235617 ?auto_235618 ) ( not ( = ?auto_235617 ?auto_235620 ) ) ( not ( = ?auto_235617 ?auto_235626 ) ) ( not ( = ?auto_235618 ?auto_235621 ) ) ( CALIBRATION_TARGET ?auto_235627 ?auto_235626 ) ( not ( = ?auto_235626 ?auto_235622 ) ) ( not ( = ?auto_235620 ?auto_235622 ) ) ( not ( = ?auto_235617 ?auto_235622 ) ) ( ON_BOARD ?auto_235625 ?auto_235624 ) ( POWER_ON ?auto_235625 ) ( not ( = ?auto_235627 ?auto_235625 ) ) ( POINTING ?auto_235624 ?auto_235626 ) ( HAVE_IMAGE ?auto_235619 ?auto_235616 ) ( HAVE_IMAGE ?auto_235622 ?auto_235623 ) ( not ( = ?auto_235617 ?auto_235619 ) ) ( not ( = ?auto_235618 ?auto_235616 ) ) ( not ( = ?auto_235618 ?auto_235623 ) ) ( not ( = ?auto_235619 ?auto_235620 ) ) ( not ( = ?auto_235619 ?auto_235622 ) ) ( not ( = ?auto_235619 ?auto_235626 ) ) ( not ( = ?auto_235616 ?auto_235621 ) ) ( not ( = ?auto_235616 ?auto_235623 ) ) ( not ( = ?auto_235621 ?auto_235623 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_235617 ?auto_235618 ?auto_235620 ?auto_235621 )
      ( GET-4IMAGE-VERIFY ?auto_235617 ?auto_235618 ?auto_235619 ?auto_235616 ?auto_235620 ?auto_235621 ?auto_235622 ?auto_235623 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_235841 - DIRECTION
      ?auto_235842 - MODE
      ?auto_235843 - DIRECTION
      ?auto_235840 - MODE
      ?auto_235844 - DIRECTION
      ?auto_235845 - MODE
      ?auto_235846 - DIRECTION
      ?auto_235847 - MODE
    )
    :vars
    (
      ?auto_235851 - INSTRUMENT
      ?auto_235848 - SATELLITE
      ?auto_235850 - DIRECTION
      ?auto_235849 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_235851 ?auto_235848 ) ( SUPPORTS ?auto_235851 ?auto_235840 ) ( not ( = ?auto_235843 ?auto_235850 ) ) ( HAVE_IMAGE ?auto_235841 ?auto_235842 ) ( not ( = ?auto_235841 ?auto_235843 ) ) ( not ( = ?auto_235841 ?auto_235850 ) ) ( not ( = ?auto_235842 ?auto_235840 ) ) ( CALIBRATION_TARGET ?auto_235851 ?auto_235850 ) ( not ( = ?auto_235850 ?auto_235846 ) ) ( not ( = ?auto_235843 ?auto_235846 ) ) ( not ( = ?auto_235841 ?auto_235846 ) ) ( ON_BOARD ?auto_235849 ?auto_235848 ) ( POWER_ON ?auto_235849 ) ( not ( = ?auto_235851 ?auto_235849 ) ) ( POINTING ?auto_235848 ?auto_235850 ) ( HAVE_IMAGE ?auto_235844 ?auto_235845 ) ( HAVE_IMAGE ?auto_235846 ?auto_235847 ) ( not ( = ?auto_235841 ?auto_235844 ) ) ( not ( = ?auto_235842 ?auto_235845 ) ) ( not ( = ?auto_235842 ?auto_235847 ) ) ( not ( = ?auto_235843 ?auto_235844 ) ) ( not ( = ?auto_235840 ?auto_235845 ) ) ( not ( = ?auto_235840 ?auto_235847 ) ) ( not ( = ?auto_235844 ?auto_235846 ) ) ( not ( = ?auto_235844 ?auto_235850 ) ) ( not ( = ?auto_235845 ?auto_235847 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_235841 ?auto_235842 ?auto_235843 ?auto_235840 )
      ( GET-4IMAGE-VERIFY ?auto_235841 ?auto_235842 ?auto_235843 ?auto_235840 ?auto_235844 ?auto_235845 ?auto_235846 ?auto_235847 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_236349 - DIRECTION
      ?auto_236350 - MODE
      ?auto_236351 - DIRECTION
      ?auto_236348 - MODE
      ?auto_236352 - DIRECTION
      ?auto_236353 - MODE
      ?auto_236354 - DIRECTION
      ?auto_236355 - MODE
    )
    :vars
    (
      ?auto_236359 - INSTRUMENT
      ?auto_236356 - SATELLITE
      ?auto_236358 - DIRECTION
      ?auto_236357 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_236359 ?auto_236356 ) ( SUPPORTS ?auto_236359 ?auto_236348 ) ( not ( = ?auto_236351 ?auto_236358 ) ) ( HAVE_IMAGE ?auto_236354 ?auto_236355 ) ( not ( = ?auto_236354 ?auto_236351 ) ) ( not ( = ?auto_236354 ?auto_236358 ) ) ( not ( = ?auto_236355 ?auto_236348 ) ) ( CALIBRATION_TARGET ?auto_236359 ?auto_236358 ) ( not ( = ?auto_236358 ?auto_236352 ) ) ( not ( = ?auto_236351 ?auto_236352 ) ) ( not ( = ?auto_236354 ?auto_236352 ) ) ( ON_BOARD ?auto_236357 ?auto_236356 ) ( POWER_ON ?auto_236357 ) ( not ( = ?auto_236359 ?auto_236357 ) ) ( POINTING ?auto_236356 ?auto_236358 ) ( HAVE_IMAGE ?auto_236349 ?auto_236350 ) ( HAVE_IMAGE ?auto_236352 ?auto_236353 ) ( not ( = ?auto_236349 ?auto_236351 ) ) ( not ( = ?auto_236349 ?auto_236352 ) ) ( not ( = ?auto_236349 ?auto_236354 ) ) ( not ( = ?auto_236349 ?auto_236358 ) ) ( not ( = ?auto_236350 ?auto_236348 ) ) ( not ( = ?auto_236350 ?auto_236353 ) ) ( not ( = ?auto_236350 ?auto_236355 ) ) ( not ( = ?auto_236348 ?auto_236353 ) ) ( not ( = ?auto_236353 ?auto_236355 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_236354 ?auto_236355 ?auto_236351 ?auto_236348 )
      ( GET-4IMAGE-VERIFY ?auto_236349 ?auto_236350 ?auto_236351 ?auto_236348 ?auto_236352 ?auto_236353 ?auto_236354 ?auto_236355 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_236065 - DIRECTION
      ?auto_236066 - MODE
      ?auto_236067 - DIRECTION
      ?auto_236064 - MODE
      ?auto_236068 - DIRECTION
      ?auto_236069 - MODE
      ?auto_236070 - DIRECTION
      ?auto_236071 - MODE
    )
    :vars
    (
      ?auto_236075 - INSTRUMENT
      ?auto_236072 - SATELLITE
      ?auto_236074 - DIRECTION
      ?auto_236073 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_236075 ?auto_236072 ) ( SUPPORTS ?auto_236075 ?auto_236069 ) ( not ( = ?auto_236068 ?auto_236074 ) ) ( HAVE_IMAGE ?auto_236067 ?auto_236071 ) ( not ( = ?auto_236067 ?auto_236068 ) ) ( not ( = ?auto_236067 ?auto_236074 ) ) ( not ( = ?auto_236071 ?auto_236069 ) ) ( CALIBRATION_TARGET ?auto_236075 ?auto_236074 ) ( not ( = ?auto_236074 ?auto_236065 ) ) ( not ( = ?auto_236068 ?auto_236065 ) ) ( not ( = ?auto_236067 ?auto_236065 ) ) ( ON_BOARD ?auto_236073 ?auto_236072 ) ( POWER_ON ?auto_236073 ) ( not ( = ?auto_236075 ?auto_236073 ) ) ( POINTING ?auto_236072 ?auto_236074 ) ( HAVE_IMAGE ?auto_236065 ?auto_236066 ) ( HAVE_IMAGE ?auto_236067 ?auto_236064 ) ( HAVE_IMAGE ?auto_236070 ?auto_236071 ) ( not ( = ?auto_236065 ?auto_236070 ) ) ( not ( = ?auto_236066 ?auto_236064 ) ) ( not ( = ?auto_236066 ?auto_236069 ) ) ( not ( = ?auto_236066 ?auto_236071 ) ) ( not ( = ?auto_236067 ?auto_236070 ) ) ( not ( = ?auto_236064 ?auto_236069 ) ) ( not ( = ?auto_236064 ?auto_236071 ) ) ( not ( = ?auto_236068 ?auto_236070 ) ) ( not ( = ?auto_236070 ?auto_236074 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_236067 ?auto_236071 ?auto_236068 ?auto_236069 )
      ( GET-4IMAGE-VERIFY ?auto_236065 ?auto_236066 ?auto_236067 ?auto_236064 ?auto_236068 ?auto_236069 ?auto_236070 ?auto_236071 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_236077 - DIRECTION
      ?auto_236078 - MODE
      ?auto_236079 - DIRECTION
      ?auto_236076 - MODE
      ?auto_236080 - DIRECTION
      ?auto_236081 - MODE
      ?auto_236082 - DIRECTION
      ?auto_236083 - MODE
    )
    :vars
    (
      ?auto_236087 - INSTRUMENT
      ?auto_236084 - SATELLITE
      ?auto_236086 - DIRECTION
      ?auto_236085 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_236087 ?auto_236084 ) ( SUPPORTS ?auto_236087 ?auto_236081 ) ( not ( = ?auto_236080 ?auto_236086 ) ) ( HAVE_IMAGE ?auto_236079 ?auto_236076 ) ( not ( = ?auto_236079 ?auto_236080 ) ) ( not ( = ?auto_236079 ?auto_236086 ) ) ( not ( = ?auto_236076 ?auto_236081 ) ) ( CALIBRATION_TARGET ?auto_236087 ?auto_236086 ) ( not ( = ?auto_236086 ?auto_236077 ) ) ( not ( = ?auto_236080 ?auto_236077 ) ) ( not ( = ?auto_236079 ?auto_236077 ) ) ( ON_BOARD ?auto_236085 ?auto_236084 ) ( POWER_ON ?auto_236085 ) ( not ( = ?auto_236087 ?auto_236085 ) ) ( POINTING ?auto_236084 ?auto_236086 ) ( HAVE_IMAGE ?auto_236077 ?auto_236078 ) ( HAVE_IMAGE ?auto_236082 ?auto_236083 ) ( not ( = ?auto_236077 ?auto_236082 ) ) ( not ( = ?auto_236078 ?auto_236076 ) ) ( not ( = ?auto_236078 ?auto_236081 ) ) ( not ( = ?auto_236078 ?auto_236083 ) ) ( not ( = ?auto_236079 ?auto_236082 ) ) ( not ( = ?auto_236076 ?auto_236083 ) ) ( not ( = ?auto_236080 ?auto_236082 ) ) ( not ( = ?auto_236081 ?auto_236083 ) ) ( not ( = ?auto_236082 ?auto_236086 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_236079 ?auto_236076 ?auto_236080 ?auto_236081 )
      ( GET-4IMAGE-VERIFY ?auto_236077 ?auto_236078 ?auto_236079 ?auto_236076 ?auto_236080 ?auto_236081 ?auto_236082 ?auto_236083 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_236125 - DIRECTION
      ?auto_236126 - MODE
      ?auto_236127 - DIRECTION
      ?auto_236124 - MODE
      ?auto_236128 - DIRECTION
      ?auto_236129 - MODE
      ?auto_236130 - DIRECTION
      ?auto_236131 - MODE
    )
    :vars
    (
      ?auto_236137 - INSTRUMENT
      ?auto_236132 - SATELLITE
      ?auto_236134 - DIRECTION
      ?auto_236135 - DIRECTION
      ?auto_236136 - MODE
      ?auto_236133 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_236137 ?auto_236132 ) ( SUPPORTS ?auto_236137 ?auto_236131 ) ( not ( = ?auto_236130 ?auto_236134 ) ) ( HAVE_IMAGE ?auto_236135 ?auto_236136 ) ( not ( = ?auto_236135 ?auto_236130 ) ) ( not ( = ?auto_236135 ?auto_236134 ) ) ( not ( = ?auto_236136 ?auto_236131 ) ) ( CALIBRATION_TARGET ?auto_236137 ?auto_236134 ) ( not ( = ?auto_236134 ?auto_236125 ) ) ( not ( = ?auto_236130 ?auto_236125 ) ) ( not ( = ?auto_236135 ?auto_236125 ) ) ( ON_BOARD ?auto_236133 ?auto_236132 ) ( POWER_ON ?auto_236133 ) ( not ( = ?auto_236137 ?auto_236133 ) ) ( POINTING ?auto_236132 ?auto_236134 ) ( HAVE_IMAGE ?auto_236125 ?auto_236126 ) ( HAVE_IMAGE ?auto_236127 ?auto_236124 ) ( HAVE_IMAGE ?auto_236128 ?auto_236129 ) ( not ( = ?auto_236125 ?auto_236127 ) ) ( not ( = ?auto_236125 ?auto_236128 ) ) ( not ( = ?auto_236126 ?auto_236124 ) ) ( not ( = ?auto_236126 ?auto_236129 ) ) ( not ( = ?auto_236126 ?auto_236131 ) ) ( not ( = ?auto_236126 ?auto_236136 ) ) ( not ( = ?auto_236127 ?auto_236128 ) ) ( not ( = ?auto_236127 ?auto_236130 ) ) ( not ( = ?auto_236127 ?auto_236134 ) ) ( not ( = ?auto_236127 ?auto_236135 ) ) ( not ( = ?auto_236124 ?auto_236129 ) ) ( not ( = ?auto_236124 ?auto_236131 ) ) ( not ( = ?auto_236124 ?auto_236136 ) ) ( not ( = ?auto_236128 ?auto_236130 ) ) ( not ( = ?auto_236128 ?auto_236134 ) ) ( not ( = ?auto_236128 ?auto_236135 ) ) ( not ( = ?auto_236129 ?auto_236131 ) ) ( not ( = ?auto_236129 ?auto_236136 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_236135 ?auto_236136 ?auto_236130 ?auto_236131 )
      ( GET-4IMAGE-VERIFY ?auto_236125 ?auto_236126 ?auto_236127 ?auto_236124 ?auto_236128 ?auto_236129 ?auto_236130 ?auto_236131 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_236153 - DIRECTION
      ?auto_236154 - MODE
      ?auto_236155 - DIRECTION
      ?auto_236152 - MODE
      ?auto_236156 - DIRECTION
      ?auto_236157 - MODE
      ?auto_236158 - DIRECTION
      ?auto_236159 - MODE
    )
    :vars
    (
      ?auto_236163 - INSTRUMENT
      ?auto_236160 - SATELLITE
      ?auto_236162 - DIRECTION
      ?auto_236161 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_236163 ?auto_236160 ) ( SUPPORTS ?auto_236163 ?auto_236157 ) ( not ( = ?auto_236156 ?auto_236162 ) ) ( HAVE_IMAGE ?auto_236158 ?auto_236159 ) ( not ( = ?auto_236158 ?auto_236156 ) ) ( not ( = ?auto_236158 ?auto_236162 ) ) ( not ( = ?auto_236159 ?auto_236157 ) ) ( CALIBRATION_TARGET ?auto_236163 ?auto_236162 ) ( not ( = ?auto_236162 ?auto_236153 ) ) ( not ( = ?auto_236156 ?auto_236153 ) ) ( not ( = ?auto_236158 ?auto_236153 ) ) ( ON_BOARD ?auto_236161 ?auto_236160 ) ( POWER_ON ?auto_236161 ) ( not ( = ?auto_236163 ?auto_236161 ) ) ( POINTING ?auto_236160 ?auto_236162 ) ( HAVE_IMAGE ?auto_236153 ?auto_236154 ) ( HAVE_IMAGE ?auto_236155 ?auto_236152 ) ( not ( = ?auto_236153 ?auto_236155 ) ) ( not ( = ?auto_236154 ?auto_236152 ) ) ( not ( = ?auto_236154 ?auto_236157 ) ) ( not ( = ?auto_236154 ?auto_236159 ) ) ( not ( = ?auto_236155 ?auto_236156 ) ) ( not ( = ?auto_236155 ?auto_236158 ) ) ( not ( = ?auto_236155 ?auto_236162 ) ) ( not ( = ?auto_236152 ?auto_236157 ) ) ( not ( = ?auto_236152 ?auto_236159 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_236158 ?auto_236159 ?auto_236156 ?auto_236157 )
      ( GET-4IMAGE-VERIFY ?auto_236153 ?auto_236154 ?auto_236155 ?auto_236152 ?auto_236156 ?auto_236157 ?auto_236158 ?auto_236159 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_236165 - DIRECTION
      ?auto_236166 - MODE
      ?auto_236167 - DIRECTION
      ?auto_236164 - MODE
      ?auto_236168 - DIRECTION
      ?auto_236169 - MODE
      ?auto_236170 - DIRECTION
      ?auto_236171 - MODE
    )
    :vars
    (
      ?auto_236177 - INSTRUMENT
      ?auto_236172 - SATELLITE
      ?auto_236174 - DIRECTION
      ?auto_236175 - DIRECTION
      ?auto_236176 - MODE
      ?auto_236173 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_236177 ?auto_236172 ) ( SUPPORTS ?auto_236177 ?auto_236169 ) ( not ( = ?auto_236168 ?auto_236174 ) ) ( HAVE_IMAGE ?auto_236175 ?auto_236176 ) ( not ( = ?auto_236175 ?auto_236168 ) ) ( not ( = ?auto_236175 ?auto_236174 ) ) ( not ( = ?auto_236176 ?auto_236169 ) ) ( CALIBRATION_TARGET ?auto_236177 ?auto_236174 ) ( not ( = ?auto_236174 ?auto_236167 ) ) ( not ( = ?auto_236168 ?auto_236167 ) ) ( not ( = ?auto_236175 ?auto_236167 ) ) ( ON_BOARD ?auto_236173 ?auto_236172 ) ( POWER_ON ?auto_236173 ) ( not ( = ?auto_236177 ?auto_236173 ) ) ( POINTING ?auto_236172 ?auto_236174 ) ( HAVE_IMAGE ?auto_236165 ?auto_236166 ) ( HAVE_IMAGE ?auto_236167 ?auto_236164 ) ( HAVE_IMAGE ?auto_236170 ?auto_236171 ) ( not ( = ?auto_236165 ?auto_236167 ) ) ( not ( = ?auto_236165 ?auto_236168 ) ) ( not ( = ?auto_236165 ?auto_236170 ) ) ( not ( = ?auto_236165 ?auto_236174 ) ) ( not ( = ?auto_236165 ?auto_236175 ) ) ( not ( = ?auto_236166 ?auto_236164 ) ) ( not ( = ?auto_236166 ?auto_236169 ) ) ( not ( = ?auto_236166 ?auto_236171 ) ) ( not ( = ?auto_236166 ?auto_236176 ) ) ( not ( = ?auto_236167 ?auto_236170 ) ) ( not ( = ?auto_236164 ?auto_236169 ) ) ( not ( = ?auto_236164 ?auto_236171 ) ) ( not ( = ?auto_236164 ?auto_236176 ) ) ( not ( = ?auto_236168 ?auto_236170 ) ) ( not ( = ?auto_236169 ?auto_236171 ) ) ( not ( = ?auto_236170 ?auto_236174 ) ) ( not ( = ?auto_236170 ?auto_236175 ) ) ( not ( = ?auto_236171 ?auto_236176 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_236175 ?auto_236176 ?auto_236168 ?auto_236169 )
      ( GET-4IMAGE-VERIFY ?auto_236165 ?auto_236166 ?auto_236167 ?auto_236164 ?auto_236168 ?auto_236169 ?auto_236170 ?auto_236171 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_233550 - DIRECTION
      ?auto_233551 - MODE
      ?auto_233552 - DIRECTION
      ?auto_233549 - MODE
      ?auto_233553 - DIRECTION
      ?auto_233554 - MODE
      ?auto_233555 - DIRECTION
      ?auto_233556 - MODE
    )
    :vars
    (
      ?auto_233558 - INSTRUMENT
      ?auto_233560 - SATELLITE
      ?auto_233557 - DIRECTION
      ?auto_233559 - DIRECTION
      ?auto_233561 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_233558 ?auto_233560 ) ( SUPPORTS ?auto_233558 ?auto_233549 ) ( not ( = ?auto_233552 ?auto_233557 ) ) ( HAVE_IMAGE ?auto_233555 ?auto_233554 ) ( not ( = ?auto_233555 ?auto_233552 ) ) ( not ( = ?auto_233555 ?auto_233557 ) ) ( not ( = ?auto_233554 ?auto_233549 ) ) ( CALIBRATION_TARGET ?auto_233558 ?auto_233557 ) ( not ( = ?auto_233557 ?auto_233559 ) ) ( not ( = ?auto_233552 ?auto_233559 ) ) ( not ( = ?auto_233555 ?auto_233559 ) ) ( ON_BOARD ?auto_233561 ?auto_233560 ) ( POWER_ON ?auto_233561 ) ( not ( = ?auto_233558 ?auto_233561 ) ) ( POINTING ?auto_233560 ?auto_233557 ) ( HAVE_IMAGE ?auto_233550 ?auto_233551 ) ( HAVE_IMAGE ?auto_233553 ?auto_233554 ) ( HAVE_IMAGE ?auto_233555 ?auto_233556 ) ( not ( = ?auto_233550 ?auto_233552 ) ) ( not ( = ?auto_233550 ?auto_233553 ) ) ( not ( = ?auto_233550 ?auto_233555 ) ) ( not ( = ?auto_233550 ?auto_233557 ) ) ( not ( = ?auto_233550 ?auto_233559 ) ) ( not ( = ?auto_233551 ?auto_233549 ) ) ( not ( = ?auto_233551 ?auto_233554 ) ) ( not ( = ?auto_233551 ?auto_233556 ) ) ( not ( = ?auto_233552 ?auto_233553 ) ) ( not ( = ?auto_233549 ?auto_233556 ) ) ( not ( = ?auto_233553 ?auto_233555 ) ) ( not ( = ?auto_233553 ?auto_233557 ) ) ( not ( = ?auto_233553 ?auto_233559 ) ) ( not ( = ?auto_233554 ?auto_233556 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_233555 ?auto_233554 ?auto_233552 ?auto_233549 )
      ( GET-4IMAGE-VERIFY ?auto_233550 ?auto_233551 ?auto_233552 ?auto_233549 ?auto_233553 ?auto_233554 ?auto_233555 ?auto_233556 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_236313 - DIRECTION
      ?auto_236314 - MODE
      ?auto_236315 - DIRECTION
      ?auto_236312 - MODE
      ?auto_236316 - DIRECTION
      ?auto_236317 - MODE
      ?auto_236318 - DIRECTION
      ?auto_236319 - MODE
    )
    :vars
    (
      ?auto_236323 - INSTRUMENT
      ?auto_236320 - SATELLITE
      ?auto_236322 - DIRECTION
      ?auto_236321 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_236323 ?auto_236320 ) ( SUPPORTS ?auto_236323 ?auto_236312 ) ( not ( = ?auto_236315 ?auto_236322 ) ) ( HAVE_IMAGE ?auto_236316 ?auto_236317 ) ( not ( = ?auto_236316 ?auto_236315 ) ) ( not ( = ?auto_236316 ?auto_236322 ) ) ( not ( = ?auto_236317 ?auto_236312 ) ) ( CALIBRATION_TARGET ?auto_236323 ?auto_236322 ) ( not ( = ?auto_236322 ?auto_236313 ) ) ( not ( = ?auto_236315 ?auto_236313 ) ) ( not ( = ?auto_236316 ?auto_236313 ) ) ( ON_BOARD ?auto_236321 ?auto_236320 ) ( POWER_ON ?auto_236321 ) ( not ( = ?auto_236323 ?auto_236321 ) ) ( POINTING ?auto_236320 ?auto_236322 ) ( HAVE_IMAGE ?auto_236313 ?auto_236314 ) ( HAVE_IMAGE ?auto_236318 ?auto_236319 ) ( not ( = ?auto_236313 ?auto_236318 ) ) ( not ( = ?auto_236314 ?auto_236312 ) ) ( not ( = ?auto_236314 ?auto_236317 ) ) ( not ( = ?auto_236314 ?auto_236319 ) ) ( not ( = ?auto_236315 ?auto_236318 ) ) ( not ( = ?auto_236312 ?auto_236319 ) ) ( not ( = ?auto_236316 ?auto_236318 ) ) ( not ( = ?auto_236317 ?auto_236319 ) ) ( not ( = ?auto_236318 ?auto_236322 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_236316 ?auto_236317 ?auto_236315 ?auto_236312 )
      ( GET-4IMAGE-VERIFY ?auto_236313 ?auto_236314 ?auto_236315 ?auto_236312 ?auto_236316 ?auto_236317 ?auto_236318 ?auto_236319 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_236361 - DIRECTION
      ?auto_236362 - MODE
      ?auto_236363 - DIRECTION
      ?auto_236360 - MODE
      ?auto_236364 - DIRECTION
      ?auto_236365 - MODE
      ?auto_236366 - DIRECTION
      ?auto_236367 - MODE
    )
    :vars
    (
      ?auto_236373 - INSTRUMENT
      ?auto_236368 - SATELLITE
      ?auto_236370 - DIRECTION
      ?auto_236371 - DIRECTION
      ?auto_236372 - MODE
      ?auto_236369 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_236373 ?auto_236368 ) ( SUPPORTS ?auto_236373 ?auto_236360 ) ( not ( = ?auto_236363 ?auto_236370 ) ) ( HAVE_IMAGE ?auto_236371 ?auto_236372 ) ( not ( = ?auto_236371 ?auto_236363 ) ) ( not ( = ?auto_236371 ?auto_236370 ) ) ( not ( = ?auto_236372 ?auto_236360 ) ) ( CALIBRATION_TARGET ?auto_236373 ?auto_236370 ) ( not ( = ?auto_236370 ?auto_236364 ) ) ( not ( = ?auto_236363 ?auto_236364 ) ) ( not ( = ?auto_236371 ?auto_236364 ) ) ( ON_BOARD ?auto_236369 ?auto_236368 ) ( POWER_ON ?auto_236369 ) ( not ( = ?auto_236373 ?auto_236369 ) ) ( POINTING ?auto_236368 ?auto_236370 ) ( HAVE_IMAGE ?auto_236361 ?auto_236362 ) ( HAVE_IMAGE ?auto_236364 ?auto_236365 ) ( HAVE_IMAGE ?auto_236366 ?auto_236367 ) ( not ( = ?auto_236361 ?auto_236363 ) ) ( not ( = ?auto_236361 ?auto_236364 ) ) ( not ( = ?auto_236361 ?auto_236366 ) ) ( not ( = ?auto_236361 ?auto_236370 ) ) ( not ( = ?auto_236361 ?auto_236371 ) ) ( not ( = ?auto_236362 ?auto_236360 ) ) ( not ( = ?auto_236362 ?auto_236365 ) ) ( not ( = ?auto_236362 ?auto_236367 ) ) ( not ( = ?auto_236362 ?auto_236372 ) ) ( not ( = ?auto_236363 ?auto_236366 ) ) ( not ( = ?auto_236360 ?auto_236365 ) ) ( not ( = ?auto_236360 ?auto_236367 ) ) ( not ( = ?auto_236364 ?auto_236366 ) ) ( not ( = ?auto_236365 ?auto_236367 ) ) ( not ( = ?auto_236365 ?auto_236372 ) ) ( not ( = ?auto_236366 ?auto_236370 ) ) ( not ( = ?auto_236366 ?auto_236371 ) ) ( not ( = ?auto_236367 ?auto_236372 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_236371 ?auto_236372 ?auto_236363 ?auto_236360 )
      ( GET-4IMAGE-VERIFY ?auto_236361 ?auto_236362 ?auto_236363 ?auto_236360 ?auto_236364 ?auto_236365 ?auto_236366 ?auto_236367 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_237075 - DIRECTION
      ?auto_237076 - MODE
      ?auto_237077 - DIRECTION
      ?auto_237074 - MODE
      ?auto_237078 - DIRECTION
      ?auto_237079 - MODE
      ?auto_237080 - DIRECTION
      ?auto_237081 - MODE
    )
    :vars
    (
      ?auto_237085 - INSTRUMENT
      ?auto_237082 - SATELLITE
      ?auto_237084 - DIRECTION
      ?auto_237083 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_237085 ?auto_237082 ) ( SUPPORTS ?auto_237085 ?auto_237076 ) ( not ( = ?auto_237075 ?auto_237084 ) ) ( HAVE_IMAGE ?auto_237077 ?auto_237074 ) ( not ( = ?auto_237077 ?auto_237075 ) ) ( not ( = ?auto_237077 ?auto_237084 ) ) ( not ( = ?auto_237074 ?auto_237076 ) ) ( CALIBRATION_TARGET ?auto_237085 ?auto_237084 ) ( not ( = ?auto_237084 ?auto_237078 ) ) ( not ( = ?auto_237075 ?auto_237078 ) ) ( not ( = ?auto_237077 ?auto_237078 ) ) ( ON_BOARD ?auto_237083 ?auto_237082 ) ( POWER_ON ?auto_237083 ) ( not ( = ?auto_237085 ?auto_237083 ) ) ( POINTING ?auto_237082 ?auto_237084 ) ( HAVE_IMAGE ?auto_237078 ?auto_237079 ) ( HAVE_IMAGE ?auto_237080 ?auto_237081 ) ( not ( = ?auto_237075 ?auto_237080 ) ) ( not ( = ?auto_237076 ?auto_237079 ) ) ( not ( = ?auto_237076 ?auto_237081 ) ) ( not ( = ?auto_237077 ?auto_237080 ) ) ( not ( = ?auto_237074 ?auto_237079 ) ) ( not ( = ?auto_237074 ?auto_237081 ) ) ( not ( = ?auto_237078 ?auto_237080 ) ) ( not ( = ?auto_237079 ?auto_237081 ) ) ( not ( = ?auto_237080 ?auto_237084 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_237077 ?auto_237074 ?auto_237075 ?auto_237076 )
      ( GET-4IMAGE-VERIFY ?auto_237075 ?auto_237076 ?auto_237077 ?auto_237074 ?auto_237078 ?auto_237079 ?auto_237080 ?auto_237081 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_237225 - DIRECTION
      ?auto_237226 - MODE
      ?auto_237227 - DIRECTION
      ?auto_237224 - MODE
      ?auto_237228 - DIRECTION
      ?auto_237229 - MODE
      ?auto_237230 - DIRECTION
      ?auto_237231 - MODE
    )
    :vars
    (
      ?auto_237235 - INSTRUMENT
      ?auto_237232 - SATELLITE
      ?auto_237234 - DIRECTION
      ?auto_237233 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_237235 ?auto_237232 ) ( SUPPORTS ?auto_237235 ?auto_237226 ) ( not ( = ?auto_237225 ?auto_237234 ) ) ( HAVE_IMAGE ?auto_237228 ?auto_237229 ) ( not ( = ?auto_237228 ?auto_237225 ) ) ( not ( = ?auto_237228 ?auto_237234 ) ) ( not ( = ?auto_237229 ?auto_237226 ) ) ( CALIBRATION_TARGET ?auto_237235 ?auto_237234 ) ( not ( = ?auto_237234 ?auto_237227 ) ) ( not ( = ?auto_237225 ?auto_237227 ) ) ( not ( = ?auto_237228 ?auto_237227 ) ) ( ON_BOARD ?auto_237233 ?auto_237232 ) ( POWER_ON ?auto_237233 ) ( not ( = ?auto_237235 ?auto_237233 ) ) ( POINTING ?auto_237232 ?auto_237234 ) ( HAVE_IMAGE ?auto_237227 ?auto_237224 ) ( HAVE_IMAGE ?auto_237230 ?auto_237231 ) ( not ( = ?auto_237225 ?auto_237230 ) ) ( not ( = ?auto_237226 ?auto_237224 ) ) ( not ( = ?auto_237226 ?auto_237231 ) ) ( not ( = ?auto_237227 ?auto_237230 ) ) ( not ( = ?auto_237224 ?auto_237229 ) ) ( not ( = ?auto_237224 ?auto_237231 ) ) ( not ( = ?auto_237228 ?auto_237230 ) ) ( not ( = ?auto_237229 ?auto_237231 ) ) ( not ( = ?auto_237230 ?auto_237234 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_237228 ?auto_237229 ?auto_237225 ?auto_237226 )
      ( GET-4IMAGE-VERIFY ?auto_237225 ?auto_237226 ?auto_237227 ?auto_237224 ?auto_237228 ?auto_237229 ?auto_237230 ?auto_237231 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_237213 - DIRECTION
      ?auto_237214 - MODE
      ?auto_237215 - DIRECTION
      ?auto_237212 - MODE
      ?auto_237216 - DIRECTION
      ?auto_237217 - MODE
      ?auto_237218 - DIRECTION
      ?auto_237219 - MODE
    )
    :vars
    (
      ?auto_237223 - INSTRUMENT
      ?auto_237220 - SATELLITE
      ?auto_237222 - DIRECTION
      ?auto_237221 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_237223 ?auto_237220 ) ( SUPPORTS ?auto_237223 ?auto_237214 ) ( not ( = ?auto_237213 ?auto_237222 ) ) ( HAVE_IMAGE ?auto_237218 ?auto_237219 ) ( not ( = ?auto_237218 ?auto_237213 ) ) ( not ( = ?auto_237218 ?auto_237222 ) ) ( not ( = ?auto_237219 ?auto_237214 ) ) ( CALIBRATION_TARGET ?auto_237223 ?auto_237222 ) ( not ( = ?auto_237222 ?auto_237215 ) ) ( not ( = ?auto_237213 ?auto_237215 ) ) ( not ( = ?auto_237218 ?auto_237215 ) ) ( ON_BOARD ?auto_237221 ?auto_237220 ) ( POWER_ON ?auto_237221 ) ( not ( = ?auto_237223 ?auto_237221 ) ) ( POINTING ?auto_237220 ?auto_237222 ) ( HAVE_IMAGE ?auto_237215 ?auto_237212 ) ( HAVE_IMAGE ?auto_237216 ?auto_237217 ) ( not ( = ?auto_237213 ?auto_237216 ) ) ( not ( = ?auto_237214 ?auto_237212 ) ) ( not ( = ?auto_237214 ?auto_237217 ) ) ( not ( = ?auto_237215 ?auto_237216 ) ) ( not ( = ?auto_237212 ?auto_237217 ) ) ( not ( = ?auto_237212 ?auto_237219 ) ) ( not ( = ?auto_237216 ?auto_237218 ) ) ( not ( = ?auto_237216 ?auto_237222 ) ) ( not ( = ?auto_237217 ?auto_237219 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_237218 ?auto_237219 ?auto_237213 ?auto_237214 )
      ( GET-4IMAGE-VERIFY ?auto_237213 ?auto_237214 ?auto_237215 ?auto_237212 ?auto_237216 ?auto_237217 ?auto_237218 ?auto_237219 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_237273 - DIRECTION
      ?auto_237274 - MODE
      ?auto_237275 - DIRECTION
      ?auto_237272 - MODE
      ?auto_237276 - DIRECTION
      ?auto_237277 - MODE
      ?auto_237278 - DIRECTION
      ?auto_237279 - MODE
    )
    :vars
    (
      ?auto_237285 - INSTRUMENT
      ?auto_237280 - SATELLITE
      ?auto_237282 - DIRECTION
      ?auto_237283 - DIRECTION
      ?auto_237284 - MODE
      ?auto_237281 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_237285 ?auto_237280 ) ( SUPPORTS ?auto_237285 ?auto_237274 ) ( not ( = ?auto_237273 ?auto_237282 ) ) ( HAVE_IMAGE ?auto_237283 ?auto_237284 ) ( not ( = ?auto_237283 ?auto_237273 ) ) ( not ( = ?auto_237283 ?auto_237282 ) ) ( not ( = ?auto_237284 ?auto_237274 ) ) ( CALIBRATION_TARGET ?auto_237285 ?auto_237282 ) ( not ( = ?auto_237282 ?auto_237278 ) ) ( not ( = ?auto_237273 ?auto_237278 ) ) ( not ( = ?auto_237283 ?auto_237278 ) ) ( ON_BOARD ?auto_237281 ?auto_237280 ) ( POWER_ON ?auto_237281 ) ( not ( = ?auto_237285 ?auto_237281 ) ) ( POINTING ?auto_237280 ?auto_237282 ) ( HAVE_IMAGE ?auto_237275 ?auto_237272 ) ( HAVE_IMAGE ?auto_237276 ?auto_237277 ) ( HAVE_IMAGE ?auto_237278 ?auto_237279 ) ( not ( = ?auto_237273 ?auto_237275 ) ) ( not ( = ?auto_237273 ?auto_237276 ) ) ( not ( = ?auto_237274 ?auto_237272 ) ) ( not ( = ?auto_237274 ?auto_237277 ) ) ( not ( = ?auto_237274 ?auto_237279 ) ) ( not ( = ?auto_237275 ?auto_237276 ) ) ( not ( = ?auto_237275 ?auto_237278 ) ) ( not ( = ?auto_237275 ?auto_237282 ) ) ( not ( = ?auto_237275 ?auto_237283 ) ) ( not ( = ?auto_237272 ?auto_237277 ) ) ( not ( = ?auto_237272 ?auto_237279 ) ) ( not ( = ?auto_237272 ?auto_237284 ) ) ( not ( = ?auto_237276 ?auto_237278 ) ) ( not ( = ?auto_237276 ?auto_237282 ) ) ( not ( = ?auto_237276 ?auto_237283 ) ) ( not ( = ?auto_237277 ?auto_237279 ) ) ( not ( = ?auto_237277 ?auto_237284 ) ) ( not ( = ?auto_237279 ?auto_237284 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_237283 ?auto_237284 ?auto_237273 ?auto_237274 )
      ( GET-4IMAGE-VERIFY ?auto_237273 ?auto_237274 ?auto_237275 ?auto_237272 ?auto_237276 ?auto_237277 ?auto_237278 ?auto_237279 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_235151 - DIRECTION
      ?auto_235152 - MODE
      ?auto_235153 - DIRECTION
      ?auto_235150 - MODE
      ?auto_235154 - DIRECTION
      ?auto_235155 - MODE
    )
    :vars
    (
      ?auto_235159 - INSTRUMENT
      ?auto_235156 - SATELLITE
      ?auto_235158 - DIRECTION
      ?auto_235160 - DIRECTION
      ?auto_235157 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_235159 ?auto_235156 ) ( SUPPORTS ?auto_235159 ?auto_235155 ) ( not ( = ?auto_235154 ?auto_235158 ) ) ( HAVE_IMAGE ?auto_235151 ?auto_235150 ) ( not ( = ?auto_235151 ?auto_235154 ) ) ( not ( = ?auto_235151 ?auto_235158 ) ) ( not ( = ?auto_235150 ?auto_235155 ) ) ( CALIBRATION_TARGET ?auto_235159 ?auto_235158 ) ( not ( = ?auto_235158 ?auto_235160 ) ) ( not ( = ?auto_235154 ?auto_235160 ) ) ( not ( = ?auto_235151 ?auto_235160 ) ) ( ON_BOARD ?auto_235157 ?auto_235156 ) ( POWER_ON ?auto_235157 ) ( not ( = ?auto_235159 ?auto_235157 ) ) ( POINTING ?auto_235156 ?auto_235158 ) ( HAVE_IMAGE ?auto_235151 ?auto_235152 ) ( HAVE_IMAGE ?auto_235153 ?auto_235150 ) ( not ( = ?auto_235151 ?auto_235153 ) ) ( not ( = ?auto_235152 ?auto_235150 ) ) ( not ( = ?auto_235152 ?auto_235155 ) ) ( not ( = ?auto_235153 ?auto_235154 ) ) ( not ( = ?auto_235153 ?auto_235158 ) ) ( not ( = ?auto_235153 ?auto_235160 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_235151 ?auto_235150 ?auto_235154 ?auto_235155 )
      ( GET-3IMAGE-VERIFY ?auto_235151 ?auto_235152 ?auto_235153 ?auto_235150 ?auto_235154 ?auto_235155 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_235383 - DIRECTION
      ?auto_235384 - MODE
      ?auto_235385 - DIRECTION
      ?auto_235382 - MODE
      ?auto_235386 - DIRECTION
      ?auto_235387 - MODE
    )
    :vars
    (
      ?auto_235391 - INSTRUMENT
      ?auto_235388 - SATELLITE
      ?auto_235390 - DIRECTION
      ?auto_235392 - DIRECTION
      ?auto_235389 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_235391 ?auto_235388 ) ( SUPPORTS ?auto_235391 ?auto_235384 ) ( not ( = ?auto_235383 ?auto_235390 ) ) ( HAVE_IMAGE ?auto_235385 ?auto_235387 ) ( not ( = ?auto_235385 ?auto_235383 ) ) ( not ( = ?auto_235385 ?auto_235390 ) ) ( not ( = ?auto_235387 ?auto_235384 ) ) ( CALIBRATION_TARGET ?auto_235391 ?auto_235390 ) ( not ( = ?auto_235390 ?auto_235392 ) ) ( not ( = ?auto_235383 ?auto_235392 ) ) ( not ( = ?auto_235385 ?auto_235392 ) ) ( ON_BOARD ?auto_235389 ?auto_235388 ) ( POWER_ON ?auto_235389 ) ( not ( = ?auto_235391 ?auto_235389 ) ) ( POINTING ?auto_235388 ?auto_235390 ) ( HAVE_IMAGE ?auto_235385 ?auto_235382 ) ( HAVE_IMAGE ?auto_235386 ?auto_235387 ) ( not ( = ?auto_235383 ?auto_235386 ) ) ( not ( = ?auto_235384 ?auto_235382 ) ) ( not ( = ?auto_235385 ?auto_235386 ) ) ( not ( = ?auto_235382 ?auto_235387 ) ) ( not ( = ?auto_235386 ?auto_235390 ) ) ( not ( = ?auto_235386 ?auto_235392 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_235385 ?auto_235387 ?auto_235383 ?auto_235384 )
      ( GET-3IMAGE-VERIFY ?auto_235383 ?auto_235384 ?auto_235385 ?auto_235382 ?auto_235386 ?auto_235387 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_236301 - DIRECTION
      ?auto_236302 - MODE
      ?auto_236303 - DIRECTION
      ?auto_236300 - MODE
      ?auto_236304 - DIRECTION
      ?auto_236305 - MODE
      ?auto_236306 - DIRECTION
      ?auto_236307 - MODE
    )
    :vars
    (
      ?auto_236311 - INSTRUMENT
      ?auto_236308 - SATELLITE
      ?auto_236310 - DIRECTION
      ?auto_236309 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_236311 ?auto_236308 ) ( SUPPORTS ?auto_236311 ?auto_236300 ) ( not ( = ?auto_236303 ?auto_236310 ) ) ( HAVE_IMAGE ?auto_236304 ?auto_236307 ) ( not ( = ?auto_236304 ?auto_236303 ) ) ( not ( = ?auto_236304 ?auto_236310 ) ) ( not ( = ?auto_236307 ?auto_236300 ) ) ( CALIBRATION_TARGET ?auto_236311 ?auto_236310 ) ( not ( = ?auto_236310 ?auto_236301 ) ) ( not ( = ?auto_236303 ?auto_236301 ) ) ( not ( = ?auto_236304 ?auto_236301 ) ) ( ON_BOARD ?auto_236309 ?auto_236308 ) ( POWER_ON ?auto_236309 ) ( not ( = ?auto_236311 ?auto_236309 ) ) ( POINTING ?auto_236308 ?auto_236310 ) ( HAVE_IMAGE ?auto_236301 ?auto_236302 ) ( HAVE_IMAGE ?auto_236304 ?auto_236305 ) ( HAVE_IMAGE ?auto_236306 ?auto_236307 ) ( not ( = ?auto_236301 ?auto_236306 ) ) ( not ( = ?auto_236302 ?auto_236300 ) ) ( not ( = ?auto_236302 ?auto_236305 ) ) ( not ( = ?auto_236302 ?auto_236307 ) ) ( not ( = ?auto_236303 ?auto_236306 ) ) ( not ( = ?auto_236300 ?auto_236305 ) ) ( not ( = ?auto_236304 ?auto_236306 ) ) ( not ( = ?auto_236305 ?auto_236307 ) ) ( not ( = ?auto_236306 ?auto_236310 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_236304 ?auto_236307 ?auto_236303 ?auto_236300 )
      ( GET-4IMAGE-VERIFY ?auto_236301 ?auto_236302 ?auto_236303 ?auto_236300 ?auto_236304 ?auto_236305 ?auto_236306 ?auto_236307 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_237025 - DIRECTION
      ?auto_237026 - MODE
      ?auto_237027 - DIRECTION
      ?auto_237024 - MODE
      ?auto_237028 - DIRECTION
      ?auto_237029 - MODE
      ?auto_237030 - DIRECTION
      ?auto_237031 - MODE
    )
    :vars
    (
      ?auto_237035 - INSTRUMENT
      ?auto_237032 - SATELLITE
      ?auto_237034 - DIRECTION
      ?auto_237033 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_237035 ?auto_237032 ) ( SUPPORTS ?auto_237035 ?auto_237026 ) ( not ( = ?auto_237025 ?auto_237034 ) ) ( HAVE_IMAGE ?auto_237028 ?auto_237024 ) ( not ( = ?auto_237028 ?auto_237025 ) ) ( not ( = ?auto_237028 ?auto_237034 ) ) ( not ( = ?auto_237024 ?auto_237026 ) ) ( CALIBRATION_TARGET ?auto_237035 ?auto_237034 ) ( not ( = ?auto_237034 ?auto_237030 ) ) ( not ( = ?auto_237025 ?auto_237030 ) ) ( not ( = ?auto_237028 ?auto_237030 ) ) ( ON_BOARD ?auto_237033 ?auto_237032 ) ( POWER_ON ?auto_237033 ) ( not ( = ?auto_237035 ?auto_237033 ) ) ( POINTING ?auto_237032 ?auto_237034 ) ( HAVE_IMAGE ?auto_237027 ?auto_237024 ) ( HAVE_IMAGE ?auto_237028 ?auto_237029 ) ( HAVE_IMAGE ?auto_237030 ?auto_237031 ) ( not ( = ?auto_237025 ?auto_237027 ) ) ( not ( = ?auto_237026 ?auto_237029 ) ) ( not ( = ?auto_237026 ?auto_237031 ) ) ( not ( = ?auto_237027 ?auto_237028 ) ) ( not ( = ?auto_237027 ?auto_237030 ) ) ( not ( = ?auto_237027 ?auto_237034 ) ) ( not ( = ?auto_237024 ?auto_237029 ) ) ( not ( = ?auto_237024 ?auto_237031 ) ) ( not ( = ?auto_237029 ?auto_237031 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_237028 ?auto_237024 ?auto_237025 ?auto_237026 )
      ( GET-4IMAGE-VERIFY ?auto_237025 ?auto_237026 ?auto_237027 ?auto_237024 ?auto_237028 ?auto_237029 ?auto_237030 ?auto_237031 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_238292 - DIRECTION
      ?auto_238293 - MODE
      ?auto_238294 - DIRECTION
      ?auto_238291 - MODE
      ?auto_238295 - DIRECTION
      ?auto_238296 - MODE
      ?auto_238297 - DIRECTION
      ?auto_238298 - MODE
    )
    :vars
    (
      ?auto_238300 - INSTRUMENT
      ?auto_238301 - SATELLITE
      ?auto_238299 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_238300 ?auto_238301 ) ( SUPPORTS ?auto_238300 ?auto_238296 ) ( POINTING ?auto_238301 ?auto_238299 ) ( not ( = ?auto_238295 ?auto_238299 ) ) ( HAVE_IMAGE ?auto_238297 ?auto_238291 ) ( not ( = ?auto_238297 ?auto_238295 ) ) ( not ( = ?auto_238297 ?auto_238299 ) ) ( not ( = ?auto_238291 ?auto_238296 ) ) ( CALIBRATION_TARGET ?auto_238300 ?auto_238299 ) ( POWER_AVAIL ?auto_238301 ) ( HAVE_IMAGE ?auto_238292 ?auto_238293 ) ( HAVE_IMAGE ?auto_238294 ?auto_238291 ) ( HAVE_IMAGE ?auto_238297 ?auto_238298 ) ( not ( = ?auto_238292 ?auto_238294 ) ) ( not ( = ?auto_238292 ?auto_238295 ) ) ( not ( = ?auto_238292 ?auto_238297 ) ) ( not ( = ?auto_238292 ?auto_238299 ) ) ( not ( = ?auto_238293 ?auto_238291 ) ) ( not ( = ?auto_238293 ?auto_238296 ) ) ( not ( = ?auto_238293 ?auto_238298 ) ) ( not ( = ?auto_238294 ?auto_238295 ) ) ( not ( = ?auto_238294 ?auto_238297 ) ) ( not ( = ?auto_238294 ?auto_238299 ) ) ( not ( = ?auto_238291 ?auto_238298 ) ) ( not ( = ?auto_238296 ?auto_238298 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_238297 ?auto_238291 ?auto_238295 ?auto_238296 )
      ( GET-4IMAGE-VERIFY ?auto_238292 ?auto_238293 ?auto_238294 ?auto_238291 ?auto_238295 ?auto_238296 ?auto_238297 ?auto_238298 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_238303 - DIRECTION
      ?auto_238304 - MODE
      ?auto_238305 - DIRECTION
      ?auto_238302 - MODE
      ?auto_238306 - DIRECTION
      ?auto_238307 - MODE
      ?auto_238308 - DIRECTION
      ?auto_238309 - MODE
    )
    :vars
    (
      ?auto_238311 - INSTRUMENT
      ?auto_238312 - SATELLITE
      ?auto_238310 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_238311 ?auto_238312 ) ( SUPPORTS ?auto_238311 ?auto_238307 ) ( POINTING ?auto_238312 ?auto_238310 ) ( not ( = ?auto_238306 ?auto_238310 ) ) ( HAVE_IMAGE ?auto_238303 ?auto_238302 ) ( not ( = ?auto_238303 ?auto_238306 ) ) ( not ( = ?auto_238303 ?auto_238310 ) ) ( not ( = ?auto_238302 ?auto_238307 ) ) ( CALIBRATION_TARGET ?auto_238311 ?auto_238310 ) ( POWER_AVAIL ?auto_238312 ) ( HAVE_IMAGE ?auto_238303 ?auto_238304 ) ( HAVE_IMAGE ?auto_238305 ?auto_238302 ) ( HAVE_IMAGE ?auto_238308 ?auto_238309 ) ( not ( = ?auto_238303 ?auto_238305 ) ) ( not ( = ?auto_238303 ?auto_238308 ) ) ( not ( = ?auto_238304 ?auto_238302 ) ) ( not ( = ?auto_238304 ?auto_238307 ) ) ( not ( = ?auto_238304 ?auto_238309 ) ) ( not ( = ?auto_238305 ?auto_238306 ) ) ( not ( = ?auto_238305 ?auto_238308 ) ) ( not ( = ?auto_238305 ?auto_238310 ) ) ( not ( = ?auto_238302 ?auto_238309 ) ) ( not ( = ?auto_238306 ?auto_238308 ) ) ( not ( = ?auto_238307 ?auto_238309 ) ) ( not ( = ?auto_238308 ?auto_238310 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_238303 ?auto_238302 ?auto_238306 ?auto_238307 )
      ( GET-4IMAGE-VERIFY ?auto_238303 ?auto_238304 ?auto_238305 ?auto_238302 ?auto_238306 ?auto_238307 ?auto_238308 ?auto_238309 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_238490 - DIRECTION
      ?auto_238491 - MODE
      ?auto_238492 - DIRECTION
      ?auto_238489 - MODE
      ?auto_238493 - DIRECTION
      ?auto_238494 - MODE
      ?auto_238495 - DIRECTION
      ?auto_238496 - MODE
    )
    :vars
    (
      ?auto_238498 - INSTRUMENT
      ?auto_238499 - SATELLITE
      ?auto_238497 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_238498 ?auto_238499 ) ( SUPPORTS ?auto_238498 ?auto_238489 ) ( POINTING ?auto_238499 ?auto_238497 ) ( not ( = ?auto_238492 ?auto_238497 ) ) ( HAVE_IMAGE ?auto_238490 ?auto_238496 ) ( not ( = ?auto_238490 ?auto_238492 ) ) ( not ( = ?auto_238490 ?auto_238497 ) ) ( not ( = ?auto_238496 ?auto_238489 ) ) ( CALIBRATION_TARGET ?auto_238498 ?auto_238497 ) ( POWER_AVAIL ?auto_238499 ) ( HAVE_IMAGE ?auto_238490 ?auto_238491 ) ( HAVE_IMAGE ?auto_238493 ?auto_238494 ) ( HAVE_IMAGE ?auto_238495 ?auto_238496 ) ( not ( = ?auto_238490 ?auto_238493 ) ) ( not ( = ?auto_238490 ?auto_238495 ) ) ( not ( = ?auto_238491 ?auto_238489 ) ) ( not ( = ?auto_238491 ?auto_238494 ) ) ( not ( = ?auto_238491 ?auto_238496 ) ) ( not ( = ?auto_238492 ?auto_238493 ) ) ( not ( = ?auto_238492 ?auto_238495 ) ) ( not ( = ?auto_238489 ?auto_238494 ) ) ( not ( = ?auto_238493 ?auto_238495 ) ) ( not ( = ?auto_238493 ?auto_238497 ) ) ( not ( = ?auto_238494 ?auto_238496 ) ) ( not ( = ?auto_238495 ?auto_238497 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_238490 ?auto_238496 ?auto_238492 ?auto_238489 )
      ( GET-4IMAGE-VERIFY ?auto_238490 ?auto_238491 ?auto_238492 ?auto_238489 ?auto_238493 ?auto_238494 ?auto_238495 ?auto_238496 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_239556 - DIRECTION
      ?auto_239557 - MODE
      ?auto_239558 - DIRECTION
      ?auto_239555 - MODE
      ?auto_239559 - DIRECTION
      ?auto_239560 - MODE
      ?auto_239561 - DIRECTION
      ?auto_239562 - MODE
    )
    :vars
    (
      ?auto_239564 - INSTRUMENT
      ?auto_239565 - SATELLITE
      ?auto_239563 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_239564 ?auto_239565 ) ( SUPPORTS ?auto_239564 ?auto_239557 ) ( POINTING ?auto_239565 ?auto_239563 ) ( not ( = ?auto_239556 ?auto_239563 ) ) ( HAVE_IMAGE ?auto_239561 ?auto_239560 ) ( not ( = ?auto_239561 ?auto_239556 ) ) ( not ( = ?auto_239561 ?auto_239563 ) ) ( not ( = ?auto_239560 ?auto_239557 ) ) ( CALIBRATION_TARGET ?auto_239564 ?auto_239563 ) ( POWER_AVAIL ?auto_239565 ) ( HAVE_IMAGE ?auto_239558 ?auto_239555 ) ( HAVE_IMAGE ?auto_239559 ?auto_239560 ) ( HAVE_IMAGE ?auto_239561 ?auto_239562 ) ( not ( = ?auto_239556 ?auto_239558 ) ) ( not ( = ?auto_239556 ?auto_239559 ) ) ( not ( = ?auto_239557 ?auto_239555 ) ) ( not ( = ?auto_239557 ?auto_239562 ) ) ( not ( = ?auto_239558 ?auto_239559 ) ) ( not ( = ?auto_239558 ?auto_239561 ) ) ( not ( = ?auto_239558 ?auto_239563 ) ) ( not ( = ?auto_239555 ?auto_239560 ) ) ( not ( = ?auto_239555 ?auto_239562 ) ) ( not ( = ?auto_239559 ?auto_239561 ) ) ( not ( = ?auto_239559 ?auto_239563 ) ) ( not ( = ?auto_239560 ?auto_239562 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_239561 ?auto_239560 ?auto_239556 ?auto_239557 )
      ( GET-4IMAGE-VERIFY ?auto_239556 ?auto_239557 ?auto_239558 ?auto_239555 ?auto_239559 ?auto_239560 ?auto_239561 ?auto_239562 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_240362 - DIRECTION
      ?auto_240363 - MODE
      ?auto_240364 - DIRECTION
      ?auto_240361 - MODE
      ?auto_240365 - DIRECTION
      ?auto_240366 - MODE
    )
    :vars
    (
      ?auto_240368 - INSTRUMENT
      ?auto_240369 - SATELLITE
      ?auto_240370 - DIRECTION
      ?auto_240367 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_240368 ?auto_240369 ) ( SUPPORTS ?auto_240368 ?auto_240366 ) ( not ( = ?auto_240365 ?auto_240370 ) ) ( HAVE_IMAGE ?auto_240362 ?auto_240361 ) ( not ( = ?auto_240362 ?auto_240365 ) ) ( not ( = ?auto_240362 ?auto_240370 ) ) ( not ( = ?auto_240361 ?auto_240366 ) ) ( CALIBRATION_TARGET ?auto_240368 ?auto_240370 ) ( POWER_AVAIL ?auto_240369 ) ( POINTING ?auto_240369 ?auto_240367 ) ( not ( = ?auto_240370 ?auto_240367 ) ) ( not ( = ?auto_240365 ?auto_240367 ) ) ( not ( = ?auto_240362 ?auto_240367 ) ) ( HAVE_IMAGE ?auto_240362 ?auto_240363 ) ( HAVE_IMAGE ?auto_240364 ?auto_240361 ) ( not ( = ?auto_240362 ?auto_240364 ) ) ( not ( = ?auto_240363 ?auto_240361 ) ) ( not ( = ?auto_240363 ?auto_240366 ) ) ( not ( = ?auto_240364 ?auto_240365 ) ) ( not ( = ?auto_240364 ?auto_240370 ) ) ( not ( = ?auto_240364 ?auto_240367 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_240362 ?auto_240361 ?auto_240365 ?auto_240366 )
      ( GET-3IMAGE-VERIFY ?auto_240362 ?auto_240363 ?auto_240364 ?auto_240361 ?auto_240365 ?auto_240366 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_240388 - DIRECTION
      ?auto_240389 - MODE
      ?auto_240390 - DIRECTION
      ?auto_240387 - MODE
      ?auto_240391 - DIRECTION
      ?auto_240392 - MODE
    )
    :vars
    (
      ?auto_240394 - INSTRUMENT
      ?auto_240395 - SATELLITE
      ?auto_240396 - DIRECTION
      ?auto_240393 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_240394 ?auto_240395 ) ( SUPPORTS ?auto_240394 ?auto_240387 ) ( not ( = ?auto_240390 ?auto_240396 ) ) ( HAVE_IMAGE ?auto_240388 ?auto_240392 ) ( not ( = ?auto_240388 ?auto_240390 ) ) ( not ( = ?auto_240388 ?auto_240396 ) ) ( not ( = ?auto_240392 ?auto_240387 ) ) ( CALIBRATION_TARGET ?auto_240394 ?auto_240396 ) ( POWER_AVAIL ?auto_240395 ) ( POINTING ?auto_240395 ?auto_240393 ) ( not ( = ?auto_240396 ?auto_240393 ) ) ( not ( = ?auto_240390 ?auto_240393 ) ) ( not ( = ?auto_240388 ?auto_240393 ) ) ( HAVE_IMAGE ?auto_240388 ?auto_240389 ) ( HAVE_IMAGE ?auto_240391 ?auto_240392 ) ( not ( = ?auto_240388 ?auto_240391 ) ) ( not ( = ?auto_240389 ?auto_240387 ) ) ( not ( = ?auto_240389 ?auto_240392 ) ) ( not ( = ?auto_240390 ?auto_240391 ) ) ( not ( = ?auto_240391 ?auto_240396 ) ) ( not ( = ?auto_240391 ?auto_240393 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_240388 ?auto_240392 ?auto_240390 ?auto_240387 )
      ( GET-3IMAGE-VERIFY ?auto_240388 ?auto_240389 ?auto_240390 ?auto_240387 ?auto_240391 ?auto_240392 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_240816 - DIRECTION
      ?auto_240817 - MODE
      ?auto_240818 - DIRECTION
      ?auto_240815 - MODE
      ?auto_240819 - DIRECTION
      ?auto_240820 - MODE
      ?auto_240821 - DIRECTION
      ?auto_240822 - MODE
    )
    :vars
    (
      ?auto_240823 - INSTRUMENT
      ?auto_240824 - SATELLITE
      ?auto_240825 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_240823 ?auto_240824 ) ( SUPPORTS ?auto_240823 ?auto_240822 ) ( not ( = ?auto_240821 ?auto_240825 ) ) ( HAVE_IMAGE ?auto_240816 ?auto_240820 ) ( not ( = ?auto_240816 ?auto_240821 ) ) ( not ( = ?auto_240816 ?auto_240825 ) ) ( not ( = ?auto_240820 ?auto_240822 ) ) ( CALIBRATION_TARGET ?auto_240823 ?auto_240825 ) ( POWER_AVAIL ?auto_240824 ) ( POINTING ?auto_240824 ?auto_240818 ) ( not ( = ?auto_240825 ?auto_240818 ) ) ( not ( = ?auto_240821 ?auto_240818 ) ) ( not ( = ?auto_240816 ?auto_240818 ) ) ( HAVE_IMAGE ?auto_240816 ?auto_240817 ) ( HAVE_IMAGE ?auto_240818 ?auto_240815 ) ( HAVE_IMAGE ?auto_240819 ?auto_240820 ) ( not ( = ?auto_240816 ?auto_240819 ) ) ( not ( = ?auto_240817 ?auto_240815 ) ) ( not ( = ?auto_240817 ?auto_240820 ) ) ( not ( = ?auto_240817 ?auto_240822 ) ) ( not ( = ?auto_240818 ?auto_240819 ) ) ( not ( = ?auto_240815 ?auto_240820 ) ) ( not ( = ?auto_240815 ?auto_240822 ) ) ( not ( = ?auto_240819 ?auto_240821 ) ) ( not ( = ?auto_240819 ?auto_240825 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_240816 ?auto_240820 ?auto_240821 ?auto_240822 )
      ( GET-4IMAGE-VERIFY ?auto_240816 ?auto_240817 ?auto_240818 ?auto_240815 ?auto_240819 ?auto_240820 ?auto_240821 ?auto_240822 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_240827 - DIRECTION
      ?auto_240828 - MODE
      ?auto_240829 - DIRECTION
      ?auto_240826 - MODE
      ?auto_240830 - DIRECTION
      ?auto_240831 - MODE
      ?auto_240832 - DIRECTION
      ?auto_240833 - MODE
    )
    :vars
    (
      ?auto_240834 - INSTRUMENT
      ?auto_240835 - SATELLITE
      ?auto_240836 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_240834 ?auto_240835 ) ( SUPPORTS ?auto_240834 ?auto_240833 ) ( not ( = ?auto_240832 ?auto_240836 ) ) ( HAVE_IMAGE ?auto_240827 ?auto_240828 ) ( not ( = ?auto_240827 ?auto_240832 ) ) ( not ( = ?auto_240827 ?auto_240836 ) ) ( not ( = ?auto_240828 ?auto_240833 ) ) ( CALIBRATION_TARGET ?auto_240834 ?auto_240836 ) ( POWER_AVAIL ?auto_240835 ) ( POINTING ?auto_240835 ?auto_240829 ) ( not ( = ?auto_240836 ?auto_240829 ) ) ( not ( = ?auto_240832 ?auto_240829 ) ) ( not ( = ?auto_240827 ?auto_240829 ) ) ( HAVE_IMAGE ?auto_240829 ?auto_240826 ) ( HAVE_IMAGE ?auto_240830 ?auto_240831 ) ( not ( = ?auto_240827 ?auto_240830 ) ) ( not ( = ?auto_240828 ?auto_240826 ) ) ( not ( = ?auto_240828 ?auto_240831 ) ) ( not ( = ?auto_240829 ?auto_240830 ) ) ( not ( = ?auto_240826 ?auto_240831 ) ) ( not ( = ?auto_240826 ?auto_240833 ) ) ( not ( = ?auto_240830 ?auto_240832 ) ) ( not ( = ?auto_240830 ?auto_240836 ) ) ( not ( = ?auto_240831 ?auto_240833 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_240827 ?auto_240828 ?auto_240832 ?auto_240833 )
      ( GET-4IMAGE-VERIFY ?auto_240827 ?auto_240828 ?auto_240829 ?auto_240826 ?auto_240830 ?auto_240831 ?auto_240832 ?auto_240833 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_241022 - DIRECTION
      ?auto_241023 - MODE
      ?auto_241024 - DIRECTION
      ?auto_241021 - MODE
      ?auto_241025 - DIRECTION
      ?auto_241026 - MODE
      ?auto_241027 - DIRECTION
      ?auto_241028 - MODE
    )
    :vars
    (
      ?auto_241029 - INSTRUMENT
      ?auto_241030 - SATELLITE
      ?auto_241031 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_241029 ?auto_241030 ) ( SUPPORTS ?auto_241029 ?auto_241021 ) ( not ( = ?auto_241024 ?auto_241031 ) ) ( HAVE_IMAGE ?auto_241022 ?auto_241028 ) ( not ( = ?auto_241022 ?auto_241024 ) ) ( not ( = ?auto_241022 ?auto_241031 ) ) ( not ( = ?auto_241028 ?auto_241021 ) ) ( CALIBRATION_TARGET ?auto_241029 ?auto_241031 ) ( POWER_AVAIL ?auto_241030 ) ( POINTING ?auto_241030 ?auto_241025 ) ( not ( = ?auto_241031 ?auto_241025 ) ) ( not ( = ?auto_241024 ?auto_241025 ) ) ( not ( = ?auto_241022 ?auto_241025 ) ) ( HAVE_IMAGE ?auto_241022 ?auto_241023 ) ( HAVE_IMAGE ?auto_241025 ?auto_241026 ) ( HAVE_IMAGE ?auto_241027 ?auto_241028 ) ( not ( = ?auto_241022 ?auto_241027 ) ) ( not ( = ?auto_241023 ?auto_241021 ) ) ( not ( = ?auto_241023 ?auto_241026 ) ) ( not ( = ?auto_241023 ?auto_241028 ) ) ( not ( = ?auto_241024 ?auto_241027 ) ) ( not ( = ?auto_241021 ?auto_241026 ) ) ( not ( = ?auto_241025 ?auto_241027 ) ) ( not ( = ?auto_241026 ?auto_241028 ) ) ( not ( = ?auto_241027 ?auto_241031 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_241022 ?auto_241028 ?auto_241024 ?auto_241021 )
      ( GET-4IMAGE-VERIFY ?auto_241022 ?auto_241023 ?auto_241024 ?auto_241021 ?auto_241025 ?auto_241026 ?auto_241027 ?auto_241028 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_241171 - DIRECTION
      ?auto_241172 - MODE
      ?auto_241173 - DIRECTION
      ?auto_241170 - MODE
      ?auto_241174 - DIRECTION
      ?auto_241175 - MODE
      ?auto_241176 - DIRECTION
      ?auto_241177 - MODE
    )
    :vars
    (
      ?auto_241178 - INSTRUMENT
      ?auto_241179 - SATELLITE
      ?auto_241180 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_241178 ?auto_241179 ) ( SUPPORTS ?auto_241178 ?auto_241177 ) ( not ( = ?auto_241176 ?auto_241180 ) ) ( HAVE_IMAGE ?auto_241173 ?auto_241170 ) ( not ( = ?auto_241173 ?auto_241176 ) ) ( not ( = ?auto_241173 ?auto_241180 ) ) ( not ( = ?auto_241170 ?auto_241177 ) ) ( CALIBRATION_TARGET ?auto_241178 ?auto_241180 ) ( POWER_AVAIL ?auto_241179 ) ( POINTING ?auto_241179 ?auto_241171 ) ( not ( = ?auto_241180 ?auto_241171 ) ) ( not ( = ?auto_241176 ?auto_241171 ) ) ( not ( = ?auto_241173 ?auto_241171 ) ) ( HAVE_IMAGE ?auto_241171 ?auto_241172 ) ( HAVE_IMAGE ?auto_241174 ?auto_241175 ) ( not ( = ?auto_241171 ?auto_241174 ) ) ( not ( = ?auto_241172 ?auto_241170 ) ) ( not ( = ?auto_241172 ?auto_241175 ) ) ( not ( = ?auto_241172 ?auto_241177 ) ) ( not ( = ?auto_241173 ?auto_241174 ) ) ( not ( = ?auto_241170 ?auto_241175 ) ) ( not ( = ?auto_241174 ?auto_241176 ) ) ( not ( = ?auto_241174 ?auto_241180 ) ) ( not ( = ?auto_241175 ?auto_241177 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_241173 ?auto_241170 ?auto_241176 ?auto_241177 )
      ( GET-4IMAGE-VERIFY ?auto_241171 ?auto_241172 ?auto_241173 ?auto_241170 ?auto_241174 ?auto_241175 ?auto_241176 ?auto_241177 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_241274 - DIRECTION
      ?auto_241275 - MODE
      ?auto_241276 - DIRECTION
      ?auto_241273 - MODE
      ?auto_241277 - DIRECTION
      ?auto_241278 - MODE
      ?auto_241279 - DIRECTION
      ?auto_241280 - MODE
    )
    :vars
    (
      ?auto_241281 - INSTRUMENT
      ?auto_241282 - SATELLITE
      ?auto_241283 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_241281 ?auto_241282 ) ( SUPPORTS ?auto_241281 ?auto_241278 ) ( not ( = ?auto_241277 ?auto_241283 ) ) ( HAVE_IMAGE ?auto_241279 ?auto_241280 ) ( not ( = ?auto_241279 ?auto_241277 ) ) ( not ( = ?auto_241279 ?auto_241283 ) ) ( not ( = ?auto_241280 ?auto_241278 ) ) ( CALIBRATION_TARGET ?auto_241281 ?auto_241283 ) ( POWER_AVAIL ?auto_241282 ) ( POINTING ?auto_241282 ?auto_241276 ) ( not ( = ?auto_241283 ?auto_241276 ) ) ( not ( = ?auto_241277 ?auto_241276 ) ) ( not ( = ?auto_241279 ?auto_241276 ) ) ( HAVE_IMAGE ?auto_241274 ?auto_241275 ) ( HAVE_IMAGE ?auto_241276 ?auto_241273 ) ( not ( = ?auto_241274 ?auto_241276 ) ) ( not ( = ?auto_241274 ?auto_241277 ) ) ( not ( = ?auto_241274 ?auto_241279 ) ) ( not ( = ?auto_241274 ?auto_241283 ) ) ( not ( = ?auto_241275 ?auto_241273 ) ) ( not ( = ?auto_241275 ?auto_241278 ) ) ( not ( = ?auto_241275 ?auto_241280 ) ) ( not ( = ?auto_241273 ?auto_241278 ) ) ( not ( = ?auto_241273 ?auto_241280 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_241279 ?auto_241280 ?auto_241277 ?auto_241278 )
      ( GET-4IMAGE-VERIFY ?auto_241274 ?auto_241275 ?auto_241276 ?auto_241273 ?auto_241277 ?auto_241278 ?auto_241279 ?auto_241280 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_242254 - DIRECTION
      ?auto_242255 - MODE
      ?auto_242256 - DIRECTION
      ?auto_242253 - MODE
      ?auto_242257 - DIRECTION
      ?auto_242258 - MODE
      ?auto_242259 - DIRECTION
      ?auto_242260 - MODE
    )
    :vars
    (
      ?auto_242261 - INSTRUMENT
      ?auto_242262 - SATELLITE
      ?auto_242263 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_242261 ?auto_242262 ) ( SUPPORTS ?auto_242261 ?auto_242255 ) ( not ( = ?auto_242254 ?auto_242263 ) ) ( HAVE_IMAGE ?auto_242259 ?auto_242258 ) ( not ( = ?auto_242259 ?auto_242254 ) ) ( not ( = ?auto_242259 ?auto_242263 ) ) ( not ( = ?auto_242258 ?auto_242255 ) ) ( CALIBRATION_TARGET ?auto_242261 ?auto_242263 ) ( POWER_AVAIL ?auto_242262 ) ( POINTING ?auto_242262 ?auto_242256 ) ( not ( = ?auto_242263 ?auto_242256 ) ) ( not ( = ?auto_242254 ?auto_242256 ) ) ( not ( = ?auto_242259 ?auto_242256 ) ) ( HAVE_IMAGE ?auto_242256 ?auto_242253 ) ( HAVE_IMAGE ?auto_242257 ?auto_242258 ) ( HAVE_IMAGE ?auto_242259 ?auto_242260 ) ( not ( = ?auto_242254 ?auto_242257 ) ) ( not ( = ?auto_242255 ?auto_242253 ) ) ( not ( = ?auto_242255 ?auto_242260 ) ) ( not ( = ?auto_242256 ?auto_242257 ) ) ( not ( = ?auto_242253 ?auto_242258 ) ) ( not ( = ?auto_242253 ?auto_242260 ) ) ( not ( = ?auto_242257 ?auto_242259 ) ) ( not ( = ?auto_242257 ?auto_242263 ) ) ( not ( = ?auto_242258 ?auto_242260 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_242259 ?auto_242258 ?auto_242254 ?auto_242255 )
      ( GET-4IMAGE-VERIFY ?auto_242254 ?auto_242255 ?auto_242256 ?auto_242253 ?auto_242257 ?auto_242258 ?auto_242259 ?auto_242260 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_242933 - DIRECTION
      ?auto_242934 - MODE
      ?auto_242935 - DIRECTION
      ?auto_242932 - MODE
      ?auto_242936 - DIRECTION
      ?auto_242937 - MODE
    )
    :vars
    (
      ?auto_242939 - INSTRUMENT
      ?auto_242938 - SATELLITE
      ?auto_242940 - DIRECTION
      ?auto_242942 - DIRECTION
      ?auto_242941 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_242939 ?auto_242938 ) ( SUPPORTS ?auto_242939 ?auto_242932 ) ( not ( = ?auto_242935 ?auto_242940 ) ) ( HAVE_IMAGE ?auto_242933 ?auto_242937 ) ( not ( = ?auto_242933 ?auto_242935 ) ) ( not ( = ?auto_242933 ?auto_242940 ) ) ( not ( = ?auto_242937 ?auto_242932 ) ) ( CALIBRATION_TARGET ?auto_242939 ?auto_242940 ) ( POINTING ?auto_242938 ?auto_242942 ) ( not ( = ?auto_242940 ?auto_242942 ) ) ( not ( = ?auto_242935 ?auto_242942 ) ) ( not ( = ?auto_242933 ?auto_242942 ) ) ( ON_BOARD ?auto_242941 ?auto_242938 ) ( POWER_ON ?auto_242941 ) ( not ( = ?auto_242939 ?auto_242941 ) ) ( HAVE_IMAGE ?auto_242933 ?auto_242934 ) ( HAVE_IMAGE ?auto_242936 ?auto_242937 ) ( not ( = ?auto_242933 ?auto_242936 ) ) ( not ( = ?auto_242934 ?auto_242932 ) ) ( not ( = ?auto_242934 ?auto_242937 ) ) ( not ( = ?auto_242935 ?auto_242936 ) ) ( not ( = ?auto_242936 ?auto_242940 ) ) ( not ( = ?auto_242936 ?auto_242942 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_242933 ?auto_242937 ?auto_242935 ?auto_242932 )
      ( GET-3IMAGE-VERIFY ?auto_242933 ?auto_242934 ?auto_242935 ?auto_242932 ?auto_242936 ?auto_242937 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_243308 - DIRECTION
      ?auto_243309 - MODE
      ?auto_243310 - DIRECTION
      ?auto_243307 - MODE
      ?auto_243311 - DIRECTION
      ?auto_243312 - MODE
      ?auto_243313 - DIRECTION
      ?auto_243314 - MODE
    )
    :vars
    (
      ?auto_243316 - INSTRUMENT
      ?auto_243315 - SATELLITE
      ?auto_243317 - DIRECTION
      ?auto_243319 - DIRECTION
      ?auto_243318 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_243316 ?auto_243315 ) ( SUPPORTS ?auto_243316 ?auto_243314 ) ( not ( = ?auto_243313 ?auto_243317 ) ) ( HAVE_IMAGE ?auto_243308 ?auto_243307 ) ( not ( = ?auto_243308 ?auto_243313 ) ) ( not ( = ?auto_243308 ?auto_243317 ) ) ( not ( = ?auto_243307 ?auto_243314 ) ) ( CALIBRATION_TARGET ?auto_243316 ?auto_243317 ) ( POINTING ?auto_243315 ?auto_243319 ) ( not ( = ?auto_243317 ?auto_243319 ) ) ( not ( = ?auto_243313 ?auto_243319 ) ) ( not ( = ?auto_243308 ?auto_243319 ) ) ( ON_BOARD ?auto_243318 ?auto_243315 ) ( POWER_ON ?auto_243318 ) ( not ( = ?auto_243316 ?auto_243318 ) ) ( HAVE_IMAGE ?auto_243308 ?auto_243309 ) ( HAVE_IMAGE ?auto_243310 ?auto_243307 ) ( HAVE_IMAGE ?auto_243311 ?auto_243312 ) ( not ( = ?auto_243308 ?auto_243310 ) ) ( not ( = ?auto_243308 ?auto_243311 ) ) ( not ( = ?auto_243309 ?auto_243307 ) ) ( not ( = ?auto_243309 ?auto_243312 ) ) ( not ( = ?auto_243309 ?auto_243314 ) ) ( not ( = ?auto_243310 ?auto_243311 ) ) ( not ( = ?auto_243310 ?auto_243313 ) ) ( not ( = ?auto_243310 ?auto_243317 ) ) ( not ( = ?auto_243310 ?auto_243319 ) ) ( not ( = ?auto_243307 ?auto_243312 ) ) ( not ( = ?auto_243311 ?auto_243313 ) ) ( not ( = ?auto_243311 ?auto_243317 ) ) ( not ( = ?auto_243311 ?auto_243319 ) ) ( not ( = ?auto_243312 ?auto_243314 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_243308 ?auto_243307 ?auto_243313 ?auto_243314 )
      ( GET-4IMAGE-VERIFY ?auto_243308 ?auto_243309 ?auto_243310 ?auto_243307 ?auto_243311 ?auto_243312 ?auto_243313 ?auto_243314 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_243583 - DIRECTION
      ?auto_243584 - MODE
      ?auto_243585 - DIRECTION
      ?auto_243582 - MODE
      ?auto_243586 - DIRECTION
      ?auto_243587 - MODE
      ?auto_243588 - DIRECTION
      ?auto_243589 - MODE
    )
    :vars
    (
      ?auto_243591 - INSTRUMENT
      ?auto_243590 - SATELLITE
      ?auto_243592 - DIRECTION
      ?auto_243593 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_243591 ?auto_243590 ) ( SUPPORTS ?auto_243591 ?auto_243582 ) ( not ( = ?auto_243585 ?auto_243592 ) ) ( HAVE_IMAGE ?auto_243583 ?auto_243584 ) ( not ( = ?auto_243583 ?auto_243585 ) ) ( not ( = ?auto_243583 ?auto_243592 ) ) ( not ( = ?auto_243584 ?auto_243582 ) ) ( CALIBRATION_TARGET ?auto_243591 ?auto_243592 ) ( POINTING ?auto_243590 ?auto_243588 ) ( not ( = ?auto_243592 ?auto_243588 ) ) ( not ( = ?auto_243585 ?auto_243588 ) ) ( not ( = ?auto_243583 ?auto_243588 ) ) ( ON_BOARD ?auto_243593 ?auto_243590 ) ( POWER_ON ?auto_243593 ) ( not ( = ?auto_243591 ?auto_243593 ) ) ( HAVE_IMAGE ?auto_243586 ?auto_243587 ) ( HAVE_IMAGE ?auto_243588 ?auto_243589 ) ( not ( = ?auto_243583 ?auto_243586 ) ) ( not ( = ?auto_243584 ?auto_243587 ) ) ( not ( = ?auto_243584 ?auto_243589 ) ) ( not ( = ?auto_243585 ?auto_243586 ) ) ( not ( = ?auto_243582 ?auto_243587 ) ) ( not ( = ?auto_243582 ?auto_243589 ) ) ( not ( = ?auto_243586 ?auto_243588 ) ) ( not ( = ?auto_243586 ?auto_243592 ) ) ( not ( = ?auto_243587 ?auto_243589 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_243583 ?auto_243584 ?auto_243585 ?auto_243582 )
      ( GET-4IMAGE-VERIFY ?auto_243583 ?auto_243584 ?auto_243585 ?auto_243582 ?auto_243586 ?auto_243587 ?auto_243588 ?auto_243589 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_244043 - DIRECTION
      ?auto_244044 - MODE
      ?auto_244045 - DIRECTION
      ?auto_244042 - MODE
      ?auto_244046 - DIRECTION
      ?auto_244047 - MODE
      ?auto_244048 - DIRECTION
      ?auto_244049 - MODE
    )
    :vars
    (
      ?auto_244051 - INSTRUMENT
      ?auto_244050 - SATELLITE
      ?auto_244052 - DIRECTION
      ?auto_244053 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_244051 ?auto_244050 ) ( SUPPORTS ?auto_244051 ?auto_244042 ) ( not ( = ?auto_244045 ?auto_244052 ) ) ( HAVE_IMAGE ?auto_244048 ?auto_244047 ) ( not ( = ?auto_244048 ?auto_244045 ) ) ( not ( = ?auto_244048 ?auto_244052 ) ) ( not ( = ?auto_244047 ?auto_244042 ) ) ( CALIBRATION_TARGET ?auto_244051 ?auto_244052 ) ( POINTING ?auto_244050 ?auto_244043 ) ( not ( = ?auto_244052 ?auto_244043 ) ) ( not ( = ?auto_244045 ?auto_244043 ) ) ( not ( = ?auto_244048 ?auto_244043 ) ) ( ON_BOARD ?auto_244053 ?auto_244050 ) ( POWER_ON ?auto_244053 ) ( not ( = ?auto_244051 ?auto_244053 ) ) ( HAVE_IMAGE ?auto_244043 ?auto_244044 ) ( HAVE_IMAGE ?auto_244046 ?auto_244047 ) ( HAVE_IMAGE ?auto_244048 ?auto_244049 ) ( not ( = ?auto_244043 ?auto_244046 ) ) ( not ( = ?auto_244044 ?auto_244042 ) ) ( not ( = ?auto_244044 ?auto_244047 ) ) ( not ( = ?auto_244044 ?auto_244049 ) ) ( not ( = ?auto_244045 ?auto_244046 ) ) ( not ( = ?auto_244042 ?auto_244049 ) ) ( not ( = ?auto_244046 ?auto_244048 ) ) ( not ( = ?auto_244046 ?auto_244052 ) ) ( not ( = ?auto_244047 ?auto_244049 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_244048 ?auto_244047 ?auto_244045 ?auto_244042 )
      ( GET-4IMAGE-VERIFY ?auto_244043 ?auto_244044 ?auto_244045 ?auto_244042 ?auto_244046 ?auto_244047 ?auto_244048 ?auto_244049 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_245906 - DIRECTION
      ?auto_245907 - MODE
      ?auto_245908 - DIRECTION
      ?auto_245905 - MODE
      ?auto_245909 - DIRECTION
      ?auto_245910 - MODE
    )
    :vars
    (
      ?auto_245912 - INSTRUMENT
      ?auto_245913 - SATELLITE
      ?auto_245914 - DIRECTION
      ?auto_245911 - DIRECTION
      ?auto_245915 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_245912 ?auto_245913 ) ( SUPPORTS ?auto_245912 ?auto_245907 ) ( not ( = ?auto_245906 ?auto_245914 ) ) ( HAVE_IMAGE ?auto_245909 ?auto_245905 ) ( not ( = ?auto_245909 ?auto_245906 ) ) ( not ( = ?auto_245909 ?auto_245914 ) ) ( not ( = ?auto_245905 ?auto_245907 ) ) ( CALIBRATION_TARGET ?auto_245912 ?auto_245914 ) ( POINTING ?auto_245913 ?auto_245911 ) ( not ( = ?auto_245914 ?auto_245911 ) ) ( not ( = ?auto_245906 ?auto_245911 ) ) ( not ( = ?auto_245909 ?auto_245911 ) ) ( ON_BOARD ?auto_245915 ?auto_245913 ) ( POWER_ON ?auto_245915 ) ( not ( = ?auto_245912 ?auto_245915 ) ) ( HAVE_IMAGE ?auto_245908 ?auto_245905 ) ( HAVE_IMAGE ?auto_245909 ?auto_245910 ) ( not ( = ?auto_245906 ?auto_245908 ) ) ( not ( = ?auto_245907 ?auto_245910 ) ) ( not ( = ?auto_245908 ?auto_245909 ) ) ( not ( = ?auto_245908 ?auto_245914 ) ) ( not ( = ?auto_245908 ?auto_245911 ) ) ( not ( = ?auto_245905 ?auto_245910 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_245909 ?auto_245905 ?auto_245906 ?auto_245907 )
      ( GET-3IMAGE-VERIFY ?auto_245906 ?auto_245907 ?auto_245908 ?auto_245905 ?auto_245909 ?auto_245910 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_249157 - DIRECTION
      ?auto_249158 - MODE
      ?auto_249159 - DIRECTION
      ?auto_249156 - MODE
      ?auto_249160 - DIRECTION
      ?auto_249161 - MODE
      ?auto_249162 - DIRECTION
      ?auto_249163 - MODE
    )
    :vars
    (
      ?auto_249164 - INSTRUMENT
      ?auto_249165 - SATELLITE
      ?auto_249166 - DIRECTION
      ?auto_249167 - DIRECTION
      ?auto_249168 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_249164 ?auto_249165 ) ( SUPPORTS ?auto_249164 ?auto_249156 ) ( not ( = ?auto_249159 ?auto_249166 ) ) ( HAVE_IMAGE ?auto_249160 ?auto_249158 ) ( not ( = ?auto_249160 ?auto_249159 ) ) ( not ( = ?auto_249160 ?auto_249166 ) ) ( not ( = ?auto_249158 ?auto_249156 ) ) ( CALIBRATION_TARGET ?auto_249164 ?auto_249166 ) ( not ( = ?auto_249166 ?auto_249167 ) ) ( not ( = ?auto_249159 ?auto_249167 ) ) ( not ( = ?auto_249160 ?auto_249167 ) ) ( ON_BOARD ?auto_249168 ?auto_249165 ) ( POWER_ON ?auto_249168 ) ( not ( = ?auto_249164 ?auto_249168 ) ) ( POINTING ?auto_249165 ?auto_249166 ) ( HAVE_IMAGE ?auto_249157 ?auto_249158 ) ( HAVE_IMAGE ?auto_249160 ?auto_249161 ) ( HAVE_IMAGE ?auto_249162 ?auto_249163 ) ( not ( = ?auto_249157 ?auto_249159 ) ) ( not ( = ?auto_249157 ?auto_249160 ) ) ( not ( = ?auto_249157 ?auto_249162 ) ) ( not ( = ?auto_249157 ?auto_249166 ) ) ( not ( = ?auto_249157 ?auto_249167 ) ) ( not ( = ?auto_249158 ?auto_249161 ) ) ( not ( = ?auto_249158 ?auto_249163 ) ) ( not ( = ?auto_249159 ?auto_249162 ) ) ( not ( = ?auto_249156 ?auto_249161 ) ) ( not ( = ?auto_249156 ?auto_249163 ) ) ( not ( = ?auto_249160 ?auto_249162 ) ) ( not ( = ?auto_249161 ?auto_249163 ) ) ( not ( = ?auto_249162 ?auto_249166 ) ) ( not ( = ?auto_249162 ?auto_249167 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_249160 ?auto_249158 ?auto_249159 ?auto_249156 )
      ( GET-4IMAGE-VERIFY ?auto_249157 ?auto_249158 ?auto_249159 ?auto_249156 ?auto_249160 ?auto_249161 ?auto_249162 ?auto_249163 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_254074 - DIRECTION
      ?auto_254075 - MODE
      ?auto_254076 - DIRECTION
      ?auto_254073 - MODE
      ?auto_254077 - DIRECTION
      ?auto_254078 - MODE
    )
    :vars
    (
      ?auto_254079 - INSTRUMENT
      ?auto_254081 - SATELLITE
      ?auto_254080 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_254079 ?auto_254081 ) ( SUPPORTS ?auto_254079 ?auto_254073 ) ( POINTING ?auto_254081 ?auto_254080 ) ( not ( = ?auto_254076 ?auto_254080 ) ) ( HAVE_IMAGE ?auto_254074 ?auto_254078 ) ( not ( = ?auto_254074 ?auto_254076 ) ) ( not ( = ?auto_254074 ?auto_254080 ) ) ( not ( = ?auto_254078 ?auto_254073 ) ) ( CALIBRATION_TARGET ?auto_254079 ?auto_254080 ) ( POWER_AVAIL ?auto_254081 ) ( HAVE_IMAGE ?auto_254074 ?auto_254075 ) ( HAVE_IMAGE ?auto_254077 ?auto_254078 ) ( not ( = ?auto_254074 ?auto_254077 ) ) ( not ( = ?auto_254075 ?auto_254073 ) ) ( not ( = ?auto_254075 ?auto_254078 ) ) ( not ( = ?auto_254076 ?auto_254077 ) ) ( not ( = ?auto_254077 ?auto_254080 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_254074 ?auto_254078 ?auto_254076 ?auto_254073 )
      ( GET-3IMAGE-VERIFY ?auto_254074 ?auto_254075 ?auto_254076 ?auto_254073 ?auto_254077 ?auto_254078 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_254418 - DIRECTION
      ?auto_254419 - MODE
      ?auto_254420 - DIRECTION
      ?auto_254417 - MODE
      ?auto_254421 - DIRECTION
      ?auto_254422 - MODE
      ?auto_254423 - DIRECTION
      ?auto_254424 - MODE
    )
    :vars
    (
      ?auto_254425 - INSTRUMENT
      ?auto_254427 - SATELLITE
      ?auto_254426 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_254425 ?auto_254427 ) ( SUPPORTS ?auto_254425 ?auto_254424 ) ( POINTING ?auto_254427 ?auto_254426 ) ( not ( = ?auto_254423 ?auto_254426 ) ) ( HAVE_IMAGE ?auto_254420 ?auto_254422 ) ( not ( = ?auto_254420 ?auto_254423 ) ) ( not ( = ?auto_254420 ?auto_254426 ) ) ( not ( = ?auto_254422 ?auto_254424 ) ) ( CALIBRATION_TARGET ?auto_254425 ?auto_254426 ) ( POWER_AVAIL ?auto_254427 ) ( HAVE_IMAGE ?auto_254418 ?auto_254419 ) ( HAVE_IMAGE ?auto_254420 ?auto_254417 ) ( HAVE_IMAGE ?auto_254421 ?auto_254422 ) ( not ( = ?auto_254418 ?auto_254420 ) ) ( not ( = ?auto_254418 ?auto_254421 ) ) ( not ( = ?auto_254418 ?auto_254423 ) ) ( not ( = ?auto_254418 ?auto_254426 ) ) ( not ( = ?auto_254419 ?auto_254417 ) ) ( not ( = ?auto_254419 ?auto_254422 ) ) ( not ( = ?auto_254419 ?auto_254424 ) ) ( not ( = ?auto_254420 ?auto_254421 ) ) ( not ( = ?auto_254417 ?auto_254422 ) ) ( not ( = ?auto_254417 ?auto_254424 ) ) ( not ( = ?auto_254421 ?auto_254423 ) ) ( not ( = ?auto_254421 ?auto_254426 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_254420 ?auto_254422 ?auto_254423 ?auto_254424 )
      ( GET-4IMAGE-VERIFY ?auto_254418 ?auto_254419 ?auto_254420 ?auto_254417 ?auto_254421 ?auto_254422 ?auto_254423 ?auto_254424 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_255715 - DIRECTION
      ?auto_255716 - MODE
      ?auto_255717 - DIRECTION
      ?auto_255714 - MODE
      ?auto_255718 - DIRECTION
      ?auto_255719 - MODE
      ?auto_255720 - DIRECTION
      ?auto_255721 - MODE
    )
    :vars
    (
      ?auto_255722 - INSTRUMENT
      ?auto_255724 - SATELLITE
      ?auto_255723 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_255722 ?auto_255724 ) ( SUPPORTS ?auto_255722 ?auto_255716 ) ( POINTING ?auto_255724 ?auto_255723 ) ( not ( = ?auto_255715 ?auto_255723 ) ) ( HAVE_IMAGE ?auto_255720 ?auto_255714 ) ( not ( = ?auto_255720 ?auto_255715 ) ) ( not ( = ?auto_255720 ?auto_255723 ) ) ( not ( = ?auto_255714 ?auto_255716 ) ) ( CALIBRATION_TARGET ?auto_255722 ?auto_255723 ) ( POWER_AVAIL ?auto_255724 ) ( HAVE_IMAGE ?auto_255717 ?auto_255714 ) ( HAVE_IMAGE ?auto_255718 ?auto_255719 ) ( HAVE_IMAGE ?auto_255720 ?auto_255721 ) ( not ( = ?auto_255715 ?auto_255717 ) ) ( not ( = ?auto_255715 ?auto_255718 ) ) ( not ( = ?auto_255716 ?auto_255719 ) ) ( not ( = ?auto_255716 ?auto_255721 ) ) ( not ( = ?auto_255717 ?auto_255718 ) ) ( not ( = ?auto_255717 ?auto_255720 ) ) ( not ( = ?auto_255717 ?auto_255723 ) ) ( not ( = ?auto_255714 ?auto_255719 ) ) ( not ( = ?auto_255714 ?auto_255721 ) ) ( not ( = ?auto_255718 ?auto_255720 ) ) ( not ( = ?auto_255718 ?auto_255723 ) ) ( not ( = ?auto_255719 ?auto_255721 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_255720 ?auto_255714 ?auto_255715 ?auto_255716 )
      ( GET-4IMAGE-VERIFY ?auto_255715 ?auto_255716 ?auto_255717 ?auto_255714 ?auto_255718 ?auto_255719 ?auto_255720 ?auto_255721 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_256555 - DIRECTION
      ?auto_256556 - MODE
      ?auto_256557 - DIRECTION
      ?auto_256554 - MODE
      ?auto_256558 - DIRECTION
      ?auto_256559 - MODE
    )
    :vars
    (
      ?auto_256561 - INSTRUMENT
      ?auto_256560 - SATELLITE
      ?auto_256562 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_256561 ?auto_256560 ) ( SUPPORTS ?auto_256561 ?auto_256554 ) ( not ( = ?auto_256557 ?auto_256562 ) ) ( HAVE_IMAGE ?auto_256558 ?auto_256556 ) ( not ( = ?auto_256558 ?auto_256557 ) ) ( not ( = ?auto_256558 ?auto_256562 ) ) ( not ( = ?auto_256556 ?auto_256554 ) ) ( CALIBRATION_TARGET ?auto_256561 ?auto_256562 ) ( POWER_AVAIL ?auto_256560 ) ( POINTING ?auto_256560 ?auto_256558 ) ( HAVE_IMAGE ?auto_256555 ?auto_256556 ) ( HAVE_IMAGE ?auto_256558 ?auto_256559 ) ( not ( = ?auto_256555 ?auto_256557 ) ) ( not ( = ?auto_256555 ?auto_256558 ) ) ( not ( = ?auto_256555 ?auto_256562 ) ) ( not ( = ?auto_256556 ?auto_256559 ) ) ( not ( = ?auto_256554 ?auto_256559 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_256558 ?auto_256556 ?auto_256557 ?auto_256554 )
      ( GET-3IMAGE-VERIFY ?auto_256555 ?auto_256556 ?auto_256557 ?auto_256554 ?auto_256558 ?auto_256559 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_256899 - DIRECTION
      ?auto_256900 - MODE
      ?auto_256901 - DIRECTION
      ?auto_256898 - MODE
      ?auto_256902 - DIRECTION
      ?auto_256903 - MODE
      ?auto_256904 - DIRECTION
      ?auto_256905 - MODE
    )
    :vars
    (
      ?auto_256907 - INSTRUMENT
      ?auto_256906 - SATELLITE
      ?auto_256908 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_256907 ?auto_256906 ) ( SUPPORTS ?auto_256907 ?auto_256905 ) ( not ( = ?auto_256904 ?auto_256908 ) ) ( HAVE_IMAGE ?auto_256899 ?auto_256903 ) ( not ( = ?auto_256899 ?auto_256904 ) ) ( not ( = ?auto_256899 ?auto_256908 ) ) ( not ( = ?auto_256903 ?auto_256905 ) ) ( CALIBRATION_TARGET ?auto_256907 ?auto_256908 ) ( POWER_AVAIL ?auto_256906 ) ( POINTING ?auto_256906 ?auto_256899 ) ( HAVE_IMAGE ?auto_256899 ?auto_256900 ) ( HAVE_IMAGE ?auto_256901 ?auto_256898 ) ( HAVE_IMAGE ?auto_256902 ?auto_256903 ) ( not ( = ?auto_256899 ?auto_256901 ) ) ( not ( = ?auto_256899 ?auto_256902 ) ) ( not ( = ?auto_256900 ?auto_256898 ) ) ( not ( = ?auto_256900 ?auto_256903 ) ) ( not ( = ?auto_256900 ?auto_256905 ) ) ( not ( = ?auto_256901 ?auto_256902 ) ) ( not ( = ?auto_256901 ?auto_256904 ) ) ( not ( = ?auto_256901 ?auto_256908 ) ) ( not ( = ?auto_256898 ?auto_256903 ) ) ( not ( = ?auto_256898 ?auto_256905 ) ) ( not ( = ?auto_256902 ?auto_256904 ) ) ( not ( = ?auto_256902 ?auto_256908 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_256899 ?auto_256903 ?auto_256904 ?auto_256905 )
      ( GET-4IMAGE-VERIFY ?auto_256899 ?auto_256900 ?auto_256901 ?auto_256898 ?auto_256902 ?auto_256903 ?auto_256904 ?auto_256905 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_256932 - DIRECTION
      ?auto_256933 - MODE
      ?auto_256934 - DIRECTION
      ?auto_256931 - MODE
      ?auto_256935 - DIRECTION
      ?auto_256936 - MODE
      ?auto_256937 - DIRECTION
      ?auto_256938 - MODE
    )
    :vars
    (
      ?auto_256940 - INSTRUMENT
      ?auto_256939 - SATELLITE
      ?auto_256941 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_256940 ?auto_256939 ) ( SUPPORTS ?auto_256940 ?auto_256936 ) ( not ( = ?auto_256935 ?auto_256941 ) ) ( HAVE_IMAGE ?auto_256937 ?auto_256931 ) ( not ( = ?auto_256937 ?auto_256935 ) ) ( not ( = ?auto_256937 ?auto_256941 ) ) ( not ( = ?auto_256931 ?auto_256936 ) ) ( CALIBRATION_TARGET ?auto_256940 ?auto_256941 ) ( POWER_AVAIL ?auto_256939 ) ( POINTING ?auto_256939 ?auto_256937 ) ( HAVE_IMAGE ?auto_256932 ?auto_256933 ) ( HAVE_IMAGE ?auto_256934 ?auto_256931 ) ( HAVE_IMAGE ?auto_256937 ?auto_256938 ) ( not ( = ?auto_256932 ?auto_256934 ) ) ( not ( = ?auto_256932 ?auto_256935 ) ) ( not ( = ?auto_256932 ?auto_256937 ) ) ( not ( = ?auto_256932 ?auto_256941 ) ) ( not ( = ?auto_256933 ?auto_256931 ) ) ( not ( = ?auto_256933 ?auto_256936 ) ) ( not ( = ?auto_256933 ?auto_256938 ) ) ( not ( = ?auto_256934 ?auto_256935 ) ) ( not ( = ?auto_256934 ?auto_256937 ) ) ( not ( = ?auto_256934 ?auto_256941 ) ) ( not ( = ?auto_256931 ?auto_256938 ) ) ( not ( = ?auto_256936 ?auto_256938 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_256937 ?auto_256931 ?auto_256935 ?auto_256936 )
      ( GET-4IMAGE-VERIFY ?auto_256932 ?auto_256933 ?auto_256934 ?auto_256931 ?auto_256935 ?auto_256936 ?auto_256937 ?auto_256938 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_257130 - DIRECTION
      ?auto_257131 - MODE
      ?auto_257132 - DIRECTION
      ?auto_257129 - MODE
      ?auto_257133 - DIRECTION
      ?auto_257134 - MODE
      ?auto_257135 - DIRECTION
      ?auto_257136 - MODE
    )
    :vars
    (
      ?auto_257138 - INSTRUMENT
      ?auto_257137 - SATELLITE
      ?auto_257139 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_257138 ?auto_257137 ) ( SUPPORTS ?auto_257138 ?auto_257129 ) ( not ( = ?auto_257132 ?auto_257139 ) ) ( HAVE_IMAGE ?auto_257135 ?auto_257136 ) ( not ( = ?auto_257135 ?auto_257132 ) ) ( not ( = ?auto_257135 ?auto_257139 ) ) ( not ( = ?auto_257136 ?auto_257129 ) ) ( CALIBRATION_TARGET ?auto_257138 ?auto_257139 ) ( POWER_AVAIL ?auto_257137 ) ( POINTING ?auto_257137 ?auto_257135 ) ( HAVE_IMAGE ?auto_257130 ?auto_257131 ) ( HAVE_IMAGE ?auto_257133 ?auto_257134 ) ( not ( = ?auto_257130 ?auto_257132 ) ) ( not ( = ?auto_257130 ?auto_257133 ) ) ( not ( = ?auto_257130 ?auto_257135 ) ) ( not ( = ?auto_257130 ?auto_257139 ) ) ( not ( = ?auto_257131 ?auto_257129 ) ) ( not ( = ?auto_257131 ?auto_257134 ) ) ( not ( = ?auto_257131 ?auto_257136 ) ) ( not ( = ?auto_257132 ?auto_257133 ) ) ( not ( = ?auto_257129 ?auto_257134 ) ) ( not ( = ?auto_257133 ?auto_257135 ) ) ( not ( = ?auto_257133 ?auto_257139 ) ) ( not ( = ?auto_257134 ?auto_257136 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_257135 ?auto_257136 ?auto_257132 ?auto_257129 )
      ( GET-4IMAGE-VERIFY ?auto_257130 ?auto_257131 ?auto_257132 ?auto_257129 ?auto_257133 ?auto_257134 ?auto_257135 ?auto_257136 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_259244 - DIRECTION
      ?auto_259245 - MODE
      ?auto_259246 - DIRECTION
      ?auto_259243 - MODE
      ?auto_259247 - DIRECTION
      ?auto_259248 - MODE
    )
    :vars
    (
      ?auto_259250 - INSTRUMENT
      ?auto_259252 - SATELLITE
      ?auto_259251 - DIRECTION
      ?auto_259249 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_259250 ?auto_259252 ) ( SUPPORTS ?auto_259250 ?auto_259245 ) ( not ( = ?auto_259244 ?auto_259251 ) ) ( HAVE_IMAGE ?auto_259246 ?auto_259243 ) ( not ( = ?auto_259246 ?auto_259244 ) ) ( not ( = ?auto_259246 ?auto_259251 ) ) ( not ( = ?auto_259243 ?auto_259245 ) ) ( CALIBRATION_TARGET ?auto_259250 ?auto_259251 ) ( POINTING ?auto_259252 ?auto_259246 ) ( ON_BOARD ?auto_259249 ?auto_259252 ) ( POWER_ON ?auto_259249 ) ( not ( = ?auto_259250 ?auto_259249 ) ) ( HAVE_IMAGE ?auto_259247 ?auto_259248 ) ( not ( = ?auto_259244 ?auto_259247 ) ) ( not ( = ?auto_259245 ?auto_259248 ) ) ( not ( = ?auto_259246 ?auto_259247 ) ) ( not ( = ?auto_259243 ?auto_259248 ) ) ( not ( = ?auto_259247 ?auto_259251 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_259246 ?auto_259243 ?auto_259244 ?auto_259245 )
      ( GET-3IMAGE-VERIFY ?auto_259244 ?auto_259245 ?auto_259246 ?auto_259243 ?auto_259247 ?auto_259248 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_259458 - DIRECTION
      ?auto_259459 - MODE
      ?auto_259460 - DIRECTION
      ?auto_259457 - MODE
      ?auto_259461 - DIRECTION
      ?auto_259462 - MODE
      ?auto_259463 - DIRECTION
      ?auto_259464 - MODE
    )
    :vars
    (
      ?auto_259466 - INSTRUMENT
      ?auto_259468 - SATELLITE
      ?auto_259467 - DIRECTION
      ?auto_259465 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_259466 ?auto_259468 ) ( SUPPORTS ?auto_259466 ?auto_259462 ) ( not ( = ?auto_259461 ?auto_259467 ) ) ( HAVE_IMAGE ?auto_259463 ?auto_259464 ) ( not ( = ?auto_259463 ?auto_259461 ) ) ( not ( = ?auto_259463 ?auto_259467 ) ) ( not ( = ?auto_259464 ?auto_259462 ) ) ( CALIBRATION_TARGET ?auto_259466 ?auto_259467 ) ( POINTING ?auto_259468 ?auto_259463 ) ( ON_BOARD ?auto_259465 ?auto_259468 ) ( POWER_ON ?auto_259465 ) ( not ( = ?auto_259466 ?auto_259465 ) ) ( HAVE_IMAGE ?auto_259458 ?auto_259459 ) ( HAVE_IMAGE ?auto_259460 ?auto_259457 ) ( not ( = ?auto_259458 ?auto_259460 ) ) ( not ( = ?auto_259458 ?auto_259461 ) ) ( not ( = ?auto_259458 ?auto_259463 ) ) ( not ( = ?auto_259458 ?auto_259467 ) ) ( not ( = ?auto_259459 ?auto_259457 ) ) ( not ( = ?auto_259459 ?auto_259462 ) ) ( not ( = ?auto_259459 ?auto_259464 ) ) ( not ( = ?auto_259460 ?auto_259461 ) ) ( not ( = ?auto_259460 ?auto_259463 ) ) ( not ( = ?auto_259460 ?auto_259467 ) ) ( not ( = ?auto_259457 ?auto_259462 ) ) ( not ( = ?auto_259457 ?auto_259464 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_259463 ?auto_259464 ?auto_259461 ?auto_259462 )
      ( GET-4IMAGE-VERIFY ?auto_259458 ?auto_259459 ?auto_259460 ?auto_259457 ?auto_259461 ?auto_259462 ?auto_259463 ?auto_259464 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_259674 - DIRECTION
      ?auto_259675 - MODE
      ?auto_259676 - DIRECTION
      ?auto_259673 - MODE
      ?auto_259677 - DIRECTION
      ?auto_259678 - MODE
      ?auto_259679 - DIRECTION
      ?auto_259680 - MODE
    )
    :vars
    (
      ?auto_259682 - INSTRUMENT
      ?auto_259684 - SATELLITE
      ?auto_259683 - DIRECTION
      ?auto_259681 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_259682 ?auto_259684 ) ( SUPPORTS ?auto_259682 ?auto_259673 ) ( not ( = ?auto_259676 ?auto_259683 ) ) ( HAVE_IMAGE ?auto_259674 ?auto_259675 ) ( not ( = ?auto_259674 ?auto_259676 ) ) ( not ( = ?auto_259674 ?auto_259683 ) ) ( not ( = ?auto_259675 ?auto_259673 ) ) ( CALIBRATION_TARGET ?auto_259682 ?auto_259683 ) ( POINTING ?auto_259684 ?auto_259674 ) ( ON_BOARD ?auto_259681 ?auto_259684 ) ( POWER_ON ?auto_259681 ) ( not ( = ?auto_259682 ?auto_259681 ) ) ( HAVE_IMAGE ?auto_259677 ?auto_259678 ) ( HAVE_IMAGE ?auto_259679 ?auto_259680 ) ( not ( = ?auto_259674 ?auto_259677 ) ) ( not ( = ?auto_259674 ?auto_259679 ) ) ( not ( = ?auto_259675 ?auto_259678 ) ) ( not ( = ?auto_259675 ?auto_259680 ) ) ( not ( = ?auto_259676 ?auto_259677 ) ) ( not ( = ?auto_259676 ?auto_259679 ) ) ( not ( = ?auto_259673 ?auto_259678 ) ) ( not ( = ?auto_259673 ?auto_259680 ) ) ( not ( = ?auto_259677 ?auto_259679 ) ) ( not ( = ?auto_259677 ?auto_259683 ) ) ( not ( = ?auto_259678 ?auto_259680 ) ) ( not ( = ?auto_259679 ?auto_259683 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_259674 ?auto_259675 ?auto_259676 ?auto_259673 )
      ( GET-4IMAGE-VERIFY ?auto_259674 ?auto_259675 ?auto_259676 ?auto_259673 ?auto_259677 ?auto_259678 ?auto_259679 ?auto_259680 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_260830 - DIRECTION
      ?auto_260831 - MODE
      ?auto_260832 - DIRECTION
      ?auto_260829 - MODE
      ?auto_260833 - DIRECTION
      ?auto_260834 - MODE
      ?auto_260835 - DIRECTION
      ?auto_260836 - MODE
    )
    :vars
    (
      ?auto_260838 - INSTRUMENT
      ?auto_260840 - SATELLITE
      ?auto_260839 - DIRECTION
      ?auto_260837 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_260838 ?auto_260840 ) ( SUPPORTS ?auto_260838 ?auto_260831 ) ( not ( = ?auto_260830 ?auto_260839 ) ) ( HAVE_IMAGE ?auto_260832 ?auto_260829 ) ( not ( = ?auto_260832 ?auto_260830 ) ) ( not ( = ?auto_260832 ?auto_260839 ) ) ( not ( = ?auto_260829 ?auto_260831 ) ) ( CALIBRATION_TARGET ?auto_260838 ?auto_260839 ) ( POINTING ?auto_260840 ?auto_260832 ) ( ON_BOARD ?auto_260837 ?auto_260840 ) ( POWER_ON ?auto_260837 ) ( not ( = ?auto_260838 ?auto_260837 ) ) ( HAVE_IMAGE ?auto_260833 ?auto_260834 ) ( HAVE_IMAGE ?auto_260835 ?auto_260836 ) ( not ( = ?auto_260830 ?auto_260833 ) ) ( not ( = ?auto_260830 ?auto_260835 ) ) ( not ( = ?auto_260831 ?auto_260834 ) ) ( not ( = ?auto_260831 ?auto_260836 ) ) ( not ( = ?auto_260832 ?auto_260833 ) ) ( not ( = ?auto_260832 ?auto_260835 ) ) ( not ( = ?auto_260829 ?auto_260834 ) ) ( not ( = ?auto_260829 ?auto_260836 ) ) ( not ( = ?auto_260833 ?auto_260835 ) ) ( not ( = ?auto_260833 ?auto_260839 ) ) ( not ( = ?auto_260834 ?auto_260836 ) ) ( not ( = ?auto_260835 ?auto_260839 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_260832 ?auto_260829 ?auto_260830 ?auto_260831 )
      ( GET-4IMAGE-VERIFY ?auto_260830 ?auto_260831 ?auto_260832 ?auto_260829 ?auto_260833 ?auto_260834 ?auto_260835 ?auto_260836 ) )
  )

)

