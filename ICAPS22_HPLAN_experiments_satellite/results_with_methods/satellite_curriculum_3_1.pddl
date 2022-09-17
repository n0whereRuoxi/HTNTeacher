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

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_769 - DIRECTION
      ?auto_770 - MODE
    )
    :vars
    (
      ?auto_771 - INSTRUMENT
      ?auto_772 - SATELLITE
      ?auto_773 - DIRECTION
      ?auto_774 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_771 ?auto_772 ) ( SUPPORTS ?auto_771 ?auto_770 ) ( not ( = ?auto_769 ?auto_773 ) ) ( CALIBRATION_TARGET ?auto_771 ?auto_773 ) ( POWER_AVAIL ?auto_772 ) ( POINTING ?auto_772 ?auto_774 ) ( not ( = ?auto_773 ?auto_774 ) ) ( not ( = ?auto_769 ?auto_774 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_772 ?auto_773 ?auto_774 )
      ( !SWITCH_ON ?auto_771 ?auto_772 )
      ( !CALIBRATE ?auto_772 ?auto_771 ?auto_773 )
      ( !TURN_TO ?auto_772 ?auto_769 ?auto_773 )
      ( !TAKE_IMAGE ?auto_772 ?auto_769 ?auto_771 ?auto_770 )
      ( GET-1IMAGE-VERIFY ?auto_769 ?auto_770 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_777 - DIRECTION
      ?auto_778 - MODE
    )
    :vars
    (
      ?auto_779 - INSTRUMENT
      ?auto_780 - SATELLITE
      ?auto_781 - DIRECTION
      ?auto_782 - DIRECTION
      ?auto_783 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_779 ?auto_780 ) ( SUPPORTS ?auto_779 ?auto_778 ) ( not ( = ?auto_777 ?auto_781 ) ) ( CALIBRATION_TARGET ?auto_779 ?auto_781 ) ( POINTING ?auto_780 ?auto_782 ) ( not ( = ?auto_781 ?auto_782 ) ) ( ON_BOARD ?auto_783 ?auto_780 ) ( POWER_ON ?auto_783 ) ( not ( = ?auto_777 ?auto_782 ) ) ( not ( = ?auto_779 ?auto_783 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_783 ?auto_780 )
      ( !TURN_TO ?auto_780 ?auto_781 ?auto_782 )
      ( !SWITCH_ON ?auto_779 ?auto_780 )
      ( !CALIBRATE ?auto_780 ?auto_779 ?auto_781 )
      ( !TURN_TO ?auto_780 ?auto_777 ?auto_781 )
      ( !TAKE_IMAGE ?auto_780 ?auto_777 ?auto_779 ?auto_778 )
      ( GET-1IMAGE-VERIFY ?auto_777 ?auto_778 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_796 - DIRECTION
      ?auto_797 - MODE
      ?auto_799 - DIRECTION
      ?auto_798 - MODE
    )
    :vars
    (
      ?auto_801 - INSTRUMENT
      ?auto_800 - SATELLITE
      ?auto_802 - DIRECTION
      ?auto_803 - INSTRUMENT
      ?auto_804 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_799 ?auto_796 ) ) ( ON_BOARD ?auto_801 ?auto_800 ) ( SUPPORTS ?auto_801 ?auto_798 ) ( not ( = ?auto_799 ?auto_802 ) ) ( CALIBRATION_TARGET ?auto_801 ?auto_802 ) ( not ( = ?auto_802 ?auto_796 ) ) ( ON_BOARD ?auto_803 ?auto_800 ) ( not ( = ?auto_801 ?auto_803 ) ) ( SUPPORTS ?auto_803 ?auto_797 ) ( CALIBRATION_TARGET ?auto_803 ?auto_802 ) ( POWER_AVAIL ?auto_800 ) ( POINTING ?auto_800 ?auto_804 ) ( not ( = ?auto_802 ?auto_804 ) ) ( not ( = ?auto_796 ?auto_804 ) ) ( not ( = ?auto_797 ?auto_798 ) ) ( not ( = ?auto_799 ?auto_804 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_796 ?auto_797 )
      ( GET-1IMAGE ?auto_799 ?auto_798 )
      ( GET-2IMAGE-VERIFY ?auto_796 ?auto_797 ?auto_799 ?auto_798 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_805 - DIRECTION
      ?auto_806 - MODE
      ?auto_808 - DIRECTION
      ?auto_807 - MODE
    )
    :vars
    (
      ?auto_812 - INSTRUMENT
      ?auto_809 - SATELLITE
      ?auto_813 - DIRECTION
      ?auto_811 - INSTRUMENT
      ?auto_810 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_808 ?auto_805 ) ) ( ON_BOARD ?auto_812 ?auto_809 ) ( SUPPORTS ?auto_812 ?auto_806 ) ( not ( = ?auto_805 ?auto_813 ) ) ( CALIBRATION_TARGET ?auto_812 ?auto_813 ) ( not ( = ?auto_813 ?auto_808 ) ) ( ON_BOARD ?auto_811 ?auto_809 ) ( not ( = ?auto_812 ?auto_811 ) ) ( SUPPORTS ?auto_811 ?auto_807 ) ( CALIBRATION_TARGET ?auto_811 ?auto_813 ) ( POWER_AVAIL ?auto_809 ) ( POINTING ?auto_809 ?auto_810 ) ( not ( = ?auto_813 ?auto_810 ) ) ( not ( = ?auto_808 ?auto_810 ) ) ( not ( = ?auto_807 ?auto_806 ) ) ( not ( = ?auto_805 ?auto_810 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_808 ?auto_807 ?auto_805 ?auto_806 )
      ( GET-2IMAGE-VERIFY ?auto_805 ?auto_806 ?auto_808 ?auto_807 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_827 - DIRECTION
      ?auto_828 - MODE
    )
    :vars
    (
      ?auto_829 - INSTRUMENT
      ?auto_830 - SATELLITE
      ?auto_831 - DIRECTION
      ?auto_832 - DIRECTION
      ?auto_833 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_829 ?auto_830 ) ( SUPPORTS ?auto_829 ?auto_828 ) ( not ( = ?auto_827 ?auto_831 ) ) ( CALIBRATION_TARGET ?auto_829 ?auto_831 ) ( POINTING ?auto_830 ?auto_832 ) ( not ( = ?auto_831 ?auto_832 ) ) ( ON_BOARD ?auto_833 ?auto_830 ) ( POWER_ON ?auto_833 ) ( not ( = ?auto_827 ?auto_832 ) ) ( not ( = ?auto_829 ?auto_833 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_833 ?auto_830 )
      ( !TURN_TO ?auto_830 ?auto_831 ?auto_832 )
      ( !SWITCH_ON ?auto_829 ?auto_830 )
      ( !CALIBRATE ?auto_830 ?auto_829 ?auto_831 )
      ( !TURN_TO ?auto_830 ?auto_827 ?auto_831 )
      ( !TAKE_IMAGE ?auto_830 ?auto_827 ?auto_829 ?auto_828 )
      ( GET-1IMAGE-VERIFY ?auto_827 ?auto_828 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_962 - DIRECTION
      ?auto_963 - MODE
      ?auto_965 - DIRECTION
      ?auto_964 - MODE
      ?auto_966 - DIRECTION
      ?auto_967 - MODE
    )
    :vars
    (
      ?auto_968 - INSTRUMENT
      ?auto_971 - SATELLITE
      ?auto_970 - DIRECTION
      ?auto_969 - INSTRUMENT
      ?auto_973 - INSTRUMENT
      ?auto_972 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_965 ?auto_962 ) ) ( not ( = ?auto_966 ?auto_962 ) ) ( not ( = ?auto_966 ?auto_965 ) ) ( ON_BOARD ?auto_968 ?auto_971 ) ( SUPPORTS ?auto_968 ?auto_967 ) ( not ( = ?auto_966 ?auto_970 ) ) ( CALIBRATION_TARGET ?auto_968 ?auto_970 ) ( not ( = ?auto_970 ?auto_965 ) ) ( ON_BOARD ?auto_969 ?auto_971 ) ( not ( = ?auto_968 ?auto_969 ) ) ( SUPPORTS ?auto_969 ?auto_964 ) ( CALIBRATION_TARGET ?auto_969 ?auto_970 ) ( not ( = ?auto_970 ?auto_962 ) ) ( ON_BOARD ?auto_973 ?auto_971 ) ( not ( = ?auto_969 ?auto_973 ) ) ( SUPPORTS ?auto_973 ?auto_963 ) ( CALIBRATION_TARGET ?auto_973 ?auto_970 ) ( POWER_AVAIL ?auto_971 ) ( POINTING ?auto_971 ?auto_972 ) ( not ( = ?auto_970 ?auto_972 ) ) ( not ( = ?auto_962 ?auto_972 ) ) ( not ( = ?auto_963 ?auto_964 ) ) ( not ( = ?auto_965 ?auto_972 ) ) ( not ( = ?auto_963 ?auto_967 ) ) ( not ( = ?auto_964 ?auto_967 ) ) ( not ( = ?auto_966 ?auto_972 ) ) ( not ( = ?auto_968 ?auto_973 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_965 ?auto_964 ?auto_962 ?auto_963 )
      ( GET-1IMAGE ?auto_966 ?auto_967 )
      ( GET-3IMAGE-VERIFY ?auto_962 ?auto_963 ?auto_965 ?auto_964 ?auto_966 ?auto_967 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_988 - DIRECTION
      ?auto_989 - MODE
      ?auto_991 - DIRECTION
      ?auto_990 - MODE
      ?auto_992 - DIRECTION
      ?auto_993 - MODE
    )
    :vars
    (
      ?auto_999 - INSTRUMENT
      ?auto_997 - SATELLITE
      ?auto_996 - DIRECTION
      ?auto_998 - INSTRUMENT
      ?auto_994 - INSTRUMENT
      ?auto_995 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_991 ?auto_988 ) ) ( not ( = ?auto_992 ?auto_988 ) ) ( not ( = ?auto_992 ?auto_991 ) ) ( ON_BOARD ?auto_999 ?auto_997 ) ( SUPPORTS ?auto_999 ?auto_990 ) ( not ( = ?auto_991 ?auto_996 ) ) ( CALIBRATION_TARGET ?auto_999 ?auto_996 ) ( not ( = ?auto_996 ?auto_992 ) ) ( ON_BOARD ?auto_998 ?auto_997 ) ( not ( = ?auto_999 ?auto_998 ) ) ( SUPPORTS ?auto_998 ?auto_993 ) ( CALIBRATION_TARGET ?auto_998 ?auto_996 ) ( not ( = ?auto_996 ?auto_988 ) ) ( ON_BOARD ?auto_994 ?auto_997 ) ( not ( = ?auto_998 ?auto_994 ) ) ( SUPPORTS ?auto_994 ?auto_989 ) ( CALIBRATION_TARGET ?auto_994 ?auto_996 ) ( POWER_AVAIL ?auto_997 ) ( POINTING ?auto_997 ?auto_995 ) ( not ( = ?auto_996 ?auto_995 ) ) ( not ( = ?auto_988 ?auto_995 ) ) ( not ( = ?auto_989 ?auto_993 ) ) ( not ( = ?auto_992 ?auto_995 ) ) ( not ( = ?auto_989 ?auto_990 ) ) ( not ( = ?auto_993 ?auto_990 ) ) ( not ( = ?auto_991 ?auto_995 ) ) ( not ( = ?auto_999 ?auto_994 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_988 ?auto_989 ?auto_992 ?auto_993 ?auto_991 ?auto_990 )
      ( GET-3IMAGE-VERIFY ?auto_988 ?auto_989 ?auto_991 ?auto_990 ?auto_992 ?auto_993 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1014 - DIRECTION
      ?auto_1015 - MODE
      ?auto_1017 - DIRECTION
      ?auto_1016 - MODE
      ?auto_1018 - DIRECTION
      ?auto_1019 - MODE
    )
    :vars
    (
      ?auto_1024 - INSTRUMENT
      ?auto_1023 - SATELLITE
      ?auto_1025 - DIRECTION
      ?auto_1022 - INSTRUMENT
      ?auto_1021 - INSTRUMENT
      ?auto_1020 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1017 ?auto_1014 ) ) ( not ( = ?auto_1018 ?auto_1014 ) ) ( not ( = ?auto_1018 ?auto_1017 ) ) ( ON_BOARD ?auto_1024 ?auto_1023 ) ( SUPPORTS ?auto_1024 ?auto_1019 ) ( not ( = ?auto_1018 ?auto_1025 ) ) ( CALIBRATION_TARGET ?auto_1024 ?auto_1025 ) ( not ( = ?auto_1025 ?auto_1014 ) ) ( ON_BOARD ?auto_1022 ?auto_1023 ) ( not ( = ?auto_1024 ?auto_1022 ) ) ( SUPPORTS ?auto_1022 ?auto_1015 ) ( CALIBRATION_TARGET ?auto_1022 ?auto_1025 ) ( not ( = ?auto_1025 ?auto_1017 ) ) ( ON_BOARD ?auto_1021 ?auto_1023 ) ( not ( = ?auto_1022 ?auto_1021 ) ) ( SUPPORTS ?auto_1021 ?auto_1016 ) ( CALIBRATION_TARGET ?auto_1021 ?auto_1025 ) ( POWER_AVAIL ?auto_1023 ) ( POINTING ?auto_1023 ?auto_1020 ) ( not ( = ?auto_1025 ?auto_1020 ) ) ( not ( = ?auto_1017 ?auto_1020 ) ) ( not ( = ?auto_1016 ?auto_1015 ) ) ( not ( = ?auto_1014 ?auto_1020 ) ) ( not ( = ?auto_1016 ?auto_1019 ) ) ( not ( = ?auto_1015 ?auto_1019 ) ) ( not ( = ?auto_1018 ?auto_1020 ) ) ( not ( = ?auto_1024 ?auto_1021 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_1017 ?auto_1016 ?auto_1018 ?auto_1019 ?auto_1014 ?auto_1015 )
      ( GET-3IMAGE-VERIFY ?auto_1014 ?auto_1015 ?auto_1017 ?auto_1016 ?auto_1018 ?auto_1019 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1040 - DIRECTION
      ?auto_1041 - MODE
      ?auto_1043 - DIRECTION
      ?auto_1042 - MODE
      ?auto_1044 - DIRECTION
      ?auto_1045 - MODE
    )
    :vars
    (
      ?auto_1050 - INSTRUMENT
      ?auto_1049 - SATELLITE
      ?auto_1051 - DIRECTION
      ?auto_1048 - INSTRUMENT
      ?auto_1047 - INSTRUMENT
      ?auto_1046 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1043 ?auto_1040 ) ) ( not ( = ?auto_1044 ?auto_1040 ) ) ( not ( = ?auto_1044 ?auto_1043 ) ) ( ON_BOARD ?auto_1050 ?auto_1049 ) ( SUPPORTS ?auto_1050 ?auto_1042 ) ( not ( = ?auto_1043 ?auto_1051 ) ) ( CALIBRATION_TARGET ?auto_1050 ?auto_1051 ) ( not ( = ?auto_1051 ?auto_1040 ) ) ( ON_BOARD ?auto_1048 ?auto_1049 ) ( not ( = ?auto_1050 ?auto_1048 ) ) ( SUPPORTS ?auto_1048 ?auto_1041 ) ( CALIBRATION_TARGET ?auto_1048 ?auto_1051 ) ( not ( = ?auto_1051 ?auto_1044 ) ) ( ON_BOARD ?auto_1047 ?auto_1049 ) ( not ( = ?auto_1048 ?auto_1047 ) ) ( SUPPORTS ?auto_1047 ?auto_1045 ) ( CALIBRATION_TARGET ?auto_1047 ?auto_1051 ) ( POWER_AVAIL ?auto_1049 ) ( POINTING ?auto_1049 ?auto_1046 ) ( not ( = ?auto_1051 ?auto_1046 ) ) ( not ( = ?auto_1044 ?auto_1046 ) ) ( not ( = ?auto_1045 ?auto_1041 ) ) ( not ( = ?auto_1040 ?auto_1046 ) ) ( not ( = ?auto_1045 ?auto_1042 ) ) ( not ( = ?auto_1041 ?auto_1042 ) ) ( not ( = ?auto_1043 ?auto_1046 ) ) ( not ( = ?auto_1050 ?auto_1047 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_1044 ?auto_1045 ?auto_1043 ?auto_1042 ?auto_1040 ?auto_1041 )
      ( GET-3IMAGE-VERIFY ?auto_1040 ?auto_1041 ?auto_1043 ?auto_1042 ?auto_1044 ?auto_1045 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1094 - DIRECTION
      ?auto_1095 - MODE
      ?auto_1097 - DIRECTION
      ?auto_1096 - MODE
      ?auto_1098 - DIRECTION
      ?auto_1099 - MODE
    )
    :vars
    (
      ?auto_1104 - INSTRUMENT
      ?auto_1103 - SATELLITE
      ?auto_1105 - DIRECTION
      ?auto_1102 - INSTRUMENT
      ?auto_1101 - INSTRUMENT
      ?auto_1100 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1097 ?auto_1094 ) ) ( not ( = ?auto_1098 ?auto_1094 ) ) ( not ( = ?auto_1098 ?auto_1097 ) ) ( ON_BOARD ?auto_1104 ?auto_1103 ) ( SUPPORTS ?auto_1104 ?auto_1095 ) ( not ( = ?auto_1094 ?auto_1105 ) ) ( CALIBRATION_TARGET ?auto_1104 ?auto_1105 ) ( not ( = ?auto_1105 ?auto_1098 ) ) ( ON_BOARD ?auto_1102 ?auto_1103 ) ( not ( = ?auto_1104 ?auto_1102 ) ) ( SUPPORTS ?auto_1102 ?auto_1099 ) ( CALIBRATION_TARGET ?auto_1102 ?auto_1105 ) ( not ( = ?auto_1105 ?auto_1097 ) ) ( ON_BOARD ?auto_1101 ?auto_1103 ) ( not ( = ?auto_1102 ?auto_1101 ) ) ( SUPPORTS ?auto_1101 ?auto_1096 ) ( CALIBRATION_TARGET ?auto_1101 ?auto_1105 ) ( POWER_AVAIL ?auto_1103 ) ( POINTING ?auto_1103 ?auto_1100 ) ( not ( = ?auto_1105 ?auto_1100 ) ) ( not ( = ?auto_1097 ?auto_1100 ) ) ( not ( = ?auto_1096 ?auto_1099 ) ) ( not ( = ?auto_1098 ?auto_1100 ) ) ( not ( = ?auto_1096 ?auto_1095 ) ) ( not ( = ?auto_1099 ?auto_1095 ) ) ( not ( = ?auto_1094 ?auto_1100 ) ) ( not ( = ?auto_1104 ?auto_1101 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_1097 ?auto_1096 ?auto_1094 ?auto_1095 ?auto_1098 ?auto_1099 )
      ( GET-3IMAGE-VERIFY ?auto_1094 ?auto_1095 ?auto_1097 ?auto_1096 ?auto_1098 ?auto_1099 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1120 - DIRECTION
      ?auto_1121 - MODE
      ?auto_1123 - DIRECTION
      ?auto_1122 - MODE
      ?auto_1124 - DIRECTION
      ?auto_1125 - MODE
    )
    :vars
    (
      ?auto_1130 - INSTRUMENT
      ?auto_1129 - SATELLITE
      ?auto_1131 - DIRECTION
      ?auto_1128 - INSTRUMENT
      ?auto_1127 - INSTRUMENT
      ?auto_1126 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1123 ?auto_1120 ) ) ( not ( = ?auto_1124 ?auto_1120 ) ) ( not ( = ?auto_1124 ?auto_1123 ) ) ( ON_BOARD ?auto_1130 ?auto_1129 ) ( SUPPORTS ?auto_1130 ?auto_1121 ) ( not ( = ?auto_1120 ?auto_1131 ) ) ( CALIBRATION_TARGET ?auto_1130 ?auto_1131 ) ( not ( = ?auto_1131 ?auto_1123 ) ) ( ON_BOARD ?auto_1128 ?auto_1129 ) ( not ( = ?auto_1130 ?auto_1128 ) ) ( SUPPORTS ?auto_1128 ?auto_1122 ) ( CALIBRATION_TARGET ?auto_1128 ?auto_1131 ) ( not ( = ?auto_1131 ?auto_1124 ) ) ( ON_BOARD ?auto_1127 ?auto_1129 ) ( not ( = ?auto_1128 ?auto_1127 ) ) ( SUPPORTS ?auto_1127 ?auto_1125 ) ( CALIBRATION_TARGET ?auto_1127 ?auto_1131 ) ( POWER_AVAIL ?auto_1129 ) ( POINTING ?auto_1129 ?auto_1126 ) ( not ( = ?auto_1131 ?auto_1126 ) ) ( not ( = ?auto_1124 ?auto_1126 ) ) ( not ( = ?auto_1125 ?auto_1122 ) ) ( not ( = ?auto_1123 ?auto_1126 ) ) ( not ( = ?auto_1125 ?auto_1121 ) ) ( not ( = ?auto_1122 ?auto_1121 ) ) ( not ( = ?auto_1120 ?auto_1126 ) ) ( not ( = ?auto_1130 ?auto_1127 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_1124 ?auto_1125 ?auto_1120 ?auto_1121 ?auto_1123 ?auto_1122 )
      ( GET-3IMAGE-VERIFY ?auto_1120 ?auto_1121 ?auto_1123 ?auto_1122 ?auto_1124 ?auto_1125 ) )
  )

)

