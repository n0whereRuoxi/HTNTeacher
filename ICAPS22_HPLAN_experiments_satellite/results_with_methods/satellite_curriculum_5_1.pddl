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

  ( :method GET-5IMAGE-VERIFY
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
      ?goal_dir5 - DIRECTION
      ?goal_mode5 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) ( HAVE_IMAGE ?goal_dir2 ?goal_mode2 ) ( HAVE_IMAGE ?goal_dir3 ?goal_mode3 ) ( HAVE_IMAGE ?goal_dir4 ?goal_mode4 ) ( HAVE_IMAGE ?goal_dir5 ?goal_mode5 ) )
    :subtasks
    (  )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_96768 - DIRECTION
      ?auto_96769 - MODE
    )
    :vars
    (
      ?auto_96770 - INSTRUMENT
      ?auto_96771 - SATELLITE
      ?auto_96772 - DIRECTION
      ?auto_96773 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_96770 ?auto_96771 ) ( SUPPORTS ?auto_96770 ?auto_96769 ) ( not ( = ?auto_96768 ?auto_96772 ) ) ( CALIBRATION_TARGET ?auto_96770 ?auto_96772 ) ( POWER_AVAIL ?auto_96771 ) ( POINTING ?auto_96771 ?auto_96773 ) ( not ( = ?auto_96772 ?auto_96773 ) ) ( not ( = ?auto_96768 ?auto_96773 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_96771 ?auto_96772 ?auto_96773 )
      ( !SWITCH_ON ?auto_96770 ?auto_96771 )
      ( !CALIBRATE ?auto_96771 ?auto_96770 ?auto_96772 )
      ( !TURN_TO ?auto_96771 ?auto_96768 ?auto_96772 )
      ( !TAKE_IMAGE ?auto_96771 ?auto_96768 ?auto_96770 ?auto_96769 )
      ( GET-1IMAGE-VERIFY ?auto_96768 ?auto_96769 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_96776 - DIRECTION
      ?auto_96777 - MODE
    )
    :vars
    (
      ?auto_96778 - INSTRUMENT
      ?auto_96779 - SATELLITE
      ?auto_96780 - DIRECTION
      ?auto_96781 - DIRECTION
      ?auto_96782 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_96778 ?auto_96779 ) ( SUPPORTS ?auto_96778 ?auto_96777 ) ( not ( = ?auto_96776 ?auto_96780 ) ) ( CALIBRATION_TARGET ?auto_96778 ?auto_96780 ) ( POINTING ?auto_96779 ?auto_96781 ) ( not ( = ?auto_96780 ?auto_96781 ) ) ( ON_BOARD ?auto_96782 ?auto_96779 ) ( POWER_ON ?auto_96782 ) ( not ( = ?auto_96776 ?auto_96781 ) ) ( not ( = ?auto_96778 ?auto_96782 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_96782 ?auto_96779 )
      ( !TURN_TO ?auto_96779 ?auto_96780 ?auto_96781 )
      ( !SWITCH_ON ?auto_96778 ?auto_96779 )
      ( !CALIBRATE ?auto_96779 ?auto_96778 ?auto_96780 )
      ( !TURN_TO ?auto_96779 ?auto_96776 ?auto_96780 )
      ( !TAKE_IMAGE ?auto_96779 ?auto_96776 ?auto_96778 ?auto_96777 )
      ( GET-1IMAGE-VERIFY ?auto_96776 ?auto_96777 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_96795 - DIRECTION
      ?auto_96796 - MODE
      ?auto_96798 - DIRECTION
      ?auto_96797 - MODE
    )
    :vars
    (
      ?auto_96800 - INSTRUMENT
      ?auto_96801 - SATELLITE
      ?auto_96802 - DIRECTION
      ?auto_96799 - INSTRUMENT
      ?auto_96803 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_96798 ?auto_96795 ) ) ( ON_BOARD ?auto_96800 ?auto_96801 ) ( SUPPORTS ?auto_96800 ?auto_96797 ) ( not ( = ?auto_96798 ?auto_96802 ) ) ( CALIBRATION_TARGET ?auto_96800 ?auto_96802 ) ( not ( = ?auto_96802 ?auto_96795 ) ) ( ON_BOARD ?auto_96799 ?auto_96801 ) ( not ( = ?auto_96800 ?auto_96799 ) ) ( SUPPORTS ?auto_96799 ?auto_96796 ) ( CALIBRATION_TARGET ?auto_96799 ?auto_96802 ) ( POWER_AVAIL ?auto_96801 ) ( POINTING ?auto_96801 ?auto_96803 ) ( not ( = ?auto_96802 ?auto_96803 ) ) ( not ( = ?auto_96795 ?auto_96803 ) ) ( not ( = ?auto_96796 ?auto_96797 ) ) ( not ( = ?auto_96798 ?auto_96803 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_96795 ?auto_96796 )
      ( GET-1IMAGE ?auto_96798 ?auto_96797 )
      ( GET-2IMAGE-VERIFY ?auto_96795 ?auto_96796 ?auto_96798 ?auto_96797 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_96804 - DIRECTION
      ?auto_96805 - MODE
      ?auto_96807 - DIRECTION
      ?auto_96806 - MODE
    )
    :vars
    (
      ?auto_96809 - INSTRUMENT
      ?auto_96811 - SATELLITE
      ?auto_96810 - DIRECTION
      ?auto_96812 - INSTRUMENT
      ?auto_96808 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_96807 ?auto_96804 ) ) ( ON_BOARD ?auto_96809 ?auto_96811 ) ( SUPPORTS ?auto_96809 ?auto_96805 ) ( not ( = ?auto_96804 ?auto_96810 ) ) ( CALIBRATION_TARGET ?auto_96809 ?auto_96810 ) ( not ( = ?auto_96810 ?auto_96807 ) ) ( ON_BOARD ?auto_96812 ?auto_96811 ) ( not ( = ?auto_96809 ?auto_96812 ) ) ( SUPPORTS ?auto_96812 ?auto_96806 ) ( CALIBRATION_TARGET ?auto_96812 ?auto_96810 ) ( POWER_AVAIL ?auto_96811 ) ( POINTING ?auto_96811 ?auto_96808 ) ( not ( = ?auto_96810 ?auto_96808 ) ) ( not ( = ?auto_96807 ?auto_96808 ) ) ( not ( = ?auto_96806 ?auto_96805 ) ) ( not ( = ?auto_96804 ?auto_96808 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_96807 ?auto_96806 ?auto_96804 ?auto_96805 )
      ( GET-2IMAGE-VERIFY ?auto_96804 ?auto_96805 ?auto_96807 ?auto_96806 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_96826 - DIRECTION
      ?auto_96827 - MODE
    )
    :vars
    (
      ?auto_96828 - INSTRUMENT
      ?auto_96829 - SATELLITE
      ?auto_96830 - DIRECTION
      ?auto_96831 - DIRECTION
      ?auto_96832 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_96828 ?auto_96829 ) ( SUPPORTS ?auto_96828 ?auto_96827 ) ( not ( = ?auto_96826 ?auto_96830 ) ) ( CALIBRATION_TARGET ?auto_96828 ?auto_96830 ) ( POINTING ?auto_96829 ?auto_96831 ) ( not ( = ?auto_96830 ?auto_96831 ) ) ( ON_BOARD ?auto_96832 ?auto_96829 ) ( POWER_ON ?auto_96832 ) ( not ( = ?auto_96826 ?auto_96831 ) ) ( not ( = ?auto_96828 ?auto_96832 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_96832 ?auto_96829 )
      ( !TURN_TO ?auto_96829 ?auto_96830 ?auto_96831 )
      ( !SWITCH_ON ?auto_96828 ?auto_96829 )
      ( !CALIBRATE ?auto_96829 ?auto_96828 ?auto_96830 )
      ( !TURN_TO ?auto_96829 ?auto_96826 ?auto_96830 )
      ( !TAKE_IMAGE ?auto_96829 ?auto_96826 ?auto_96828 ?auto_96827 )
      ( GET-1IMAGE-VERIFY ?auto_96826 ?auto_96827 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_96961 - DIRECTION
      ?auto_96962 - MODE
      ?auto_96964 - DIRECTION
      ?auto_96963 - MODE
      ?auto_96965 - DIRECTION
      ?auto_96966 - MODE
    )
    :vars
    (
      ?auto_96968 - INSTRUMENT
      ?auto_96970 - SATELLITE
      ?auto_96969 - DIRECTION
      ?auto_96967 - INSTRUMENT
      ?auto_96972 - INSTRUMENT
      ?auto_96971 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_96964 ?auto_96961 ) ) ( not ( = ?auto_96965 ?auto_96961 ) ) ( not ( = ?auto_96965 ?auto_96964 ) ) ( ON_BOARD ?auto_96968 ?auto_96970 ) ( SUPPORTS ?auto_96968 ?auto_96966 ) ( not ( = ?auto_96965 ?auto_96969 ) ) ( CALIBRATION_TARGET ?auto_96968 ?auto_96969 ) ( not ( = ?auto_96969 ?auto_96964 ) ) ( ON_BOARD ?auto_96967 ?auto_96970 ) ( not ( = ?auto_96968 ?auto_96967 ) ) ( SUPPORTS ?auto_96967 ?auto_96963 ) ( CALIBRATION_TARGET ?auto_96967 ?auto_96969 ) ( not ( = ?auto_96969 ?auto_96961 ) ) ( ON_BOARD ?auto_96972 ?auto_96970 ) ( not ( = ?auto_96967 ?auto_96972 ) ) ( SUPPORTS ?auto_96972 ?auto_96962 ) ( CALIBRATION_TARGET ?auto_96972 ?auto_96969 ) ( POWER_AVAIL ?auto_96970 ) ( POINTING ?auto_96970 ?auto_96971 ) ( not ( = ?auto_96969 ?auto_96971 ) ) ( not ( = ?auto_96961 ?auto_96971 ) ) ( not ( = ?auto_96962 ?auto_96963 ) ) ( not ( = ?auto_96964 ?auto_96971 ) ) ( not ( = ?auto_96962 ?auto_96966 ) ) ( not ( = ?auto_96963 ?auto_96966 ) ) ( not ( = ?auto_96965 ?auto_96971 ) ) ( not ( = ?auto_96968 ?auto_96972 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_96964 ?auto_96963 ?auto_96961 ?auto_96962 )
      ( GET-1IMAGE ?auto_96965 ?auto_96966 )
      ( GET-3IMAGE-VERIFY ?auto_96961 ?auto_96962 ?auto_96964 ?auto_96963 ?auto_96965 ?auto_96966 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_96987 - DIRECTION
      ?auto_96988 - MODE
      ?auto_96990 - DIRECTION
      ?auto_96989 - MODE
      ?auto_96991 - DIRECTION
      ?auto_96992 - MODE
    )
    :vars
    (
      ?auto_96993 - INSTRUMENT
      ?auto_96997 - SATELLITE
      ?auto_96996 - DIRECTION
      ?auto_96994 - INSTRUMENT
      ?auto_96998 - INSTRUMENT
      ?auto_96995 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_96990 ?auto_96987 ) ) ( not ( = ?auto_96991 ?auto_96987 ) ) ( not ( = ?auto_96991 ?auto_96990 ) ) ( ON_BOARD ?auto_96993 ?auto_96997 ) ( SUPPORTS ?auto_96993 ?auto_96989 ) ( not ( = ?auto_96990 ?auto_96996 ) ) ( CALIBRATION_TARGET ?auto_96993 ?auto_96996 ) ( not ( = ?auto_96996 ?auto_96991 ) ) ( ON_BOARD ?auto_96994 ?auto_96997 ) ( not ( = ?auto_96993 ?auto_96994 ) ) ( SUPPORTS ?auto_96994 ?auto_96992 ) ( CALIBRATION_TARGET ?auto_96994 ?auto_96996 ) ( not ( = ?auto_96996 ?auto_96987 ) ) ( ON_BOARD ?auto_96998 ?auto_96997 ) ( not ( = ?auto_96994 ?auto_96998 ) ) ( SUPPORTS ?auto_96998 ?auto_96988 ) ( CALIBRATION_TARGET ?auto_96998 ?auto_96996 ) ( POWER_AVAIL ?auto_96997 ) ( POINTING ?auto_96997 ?auto_96995 ) ( not ( = ?auto_96996 ?auto_96995 ) ) ( not ( = ?auto_96987 ?auto_96995 ) ) ( not ( = ?auto_96988 ?auto_96992 ) ) ( not ( = ?auto_96991 ?auto_96995 ) ) ( not ( = ?auto_96988 ?auto_96989 ) ) ( not ( = ?auto_96992 ?auto_96989 ) ) ( not ( = ?auto_96990 ?auto_96995 ) ) ( not ( = ?auto_96993 ?auto_96998 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_96987 ?auto_96988 ?auto_96991 ?auto_96992 ?auto_96990 ?auto_96989 )
      ( GET-3IMAGE-VERIFY ?auto_96987 ?auto_96988 ?auto_96990 ?auto_96989 ?auto_96991 ?auto_96992 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_97013 - DIRECTION
      ?auto_97014 - MODE
      ?auto_97016 - DIRECTION
      ?auto_97015 - MODE
      ?auto_97017 - DIRECTION
      ?auto_97018 - MODE
    )
    :vars
    (
      ?auto_97024 - INSTRUMENT
      ?auto_97021 - SATELLITE
      ?auto_97022 - DIRECTION
      ?auto_97020 - INSTRUMENT
      ?auto_97023 - INSTRUMENT
      ?auto_97019 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_97016 ?auto_97013 ) ) ( not ( = ?auto_97017 ?auto_97013 ) ) ( not ( = ?auto_97017 ?auto_97016 ) ) ( ON_BOARD ?auto_97024 ?auto_97021 ) ( SUPPORTS ?auto_97024 ?auto_97018 ) ( not ( = ?auto_97017 ?auto_97022 ) ) ( CALIBRATION_TARGET ?auto_97024 ?auto_97022 ) ( not ( = ?auto_97022 ?auto_97013 ) ) ( ON_BOARD ?auto_97020 ?auto_97021 ) ( not ( = ?auto_97024 ?auto_97020 ) ) ( SUPPORTS ?auto_97020 ?auto_97014 ) ( CALIBRATION_TARGET ?auto_97020 ?auto_97022 ) ( not ( = ?auto_97022 ?auto_97016 ) ) ( ON_BOARD ?auto_97023 ?auto_97021 ) ( not ( = ?auto_97020 ?auto_97023 ) ) ( SUPPORTS ?auto_97023 ?auto_97015 ) ( CALIBRATION_TARGET ?auto_97023 ?auto_97022 ) ( POWER_AVAIL ?auto_97021 ) ( POINTING ?auto_97021 ?auto_97019 ) ( not ( = ?auto_97022 ?auto_97019 ) ) ( not ( = ?auto_97016 ?auto_97019 ) ) ( not ( = ?auto_97015 ?auto_97014 ) ) ( not ( = ?auto_97013 ?auto_97019 ) ) ( not ( = ?auto_97015 ?auto_97018 ) ) ( not ( = ?auto_97014 ?auto_97018 ) ) ( not ( = ?auto_97017 ?auto_97019 ) ) ( not ( = ?auto_97024 ?auto_97023 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_97016 ?auto_97015 ?auto_97017 ?auto_97018 ?auto_97013 ?auto_97014 )
      ( GET-3IMAGE-VERIFY ?auto_97013 ?auto_97014 ?auto_97016 ?auto_97015 ?auto_97017 ?auto_97018 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_97039 - DIRECTION
      ?auto_97040 - MODE
      ?auto_97042 - DIRECTION
      ?auto_97041 - MODE
      ?auto_97043 - DIRECTION
      ?auto_97044 - MODE
    )
    :vars
    (
      ?auto_97050 - INSTRUMENT
      ?auto_97047 - SATELLITE
      ?auto_97048 - DIRECTION
      ?auto_97046 - INSTRUMENT
      ?auto_97049 - INSTRUMENT
      ?auto_97045 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_97042 ?auto_97039 ) ) ( not ( = ?auto_97043 ?auto_97039 ) ) ( not ( = ?auto_97043 ?auto_97042 ) ) ( ON_BOARD ?auto_97050 ?auto_97047 ) ( SUPPORTS ?auto_97050 ?auto_97041 ) ( not ( = ?auto_97042 ?auto_97048 ) ) ( CALIBRATION_TARGET ?auto_97050 ?auto_97048 ) ( not ( = ?auto_97048 ?auto_97039 ) ) ( ON_BOARD ?auto_97046 ?auto_97047 ) ( not ( = ?auto_97050 ?auto_97046 ) ) ( SUPPORTS ?auto_97046 ?auto_97040 ) ( CALIBRATION_TARGET ?auto_97046 ?auto_97048 ) ( not ( = ?auto_97048 ?auto_97043 ) ) ( ON_BOARD ?auto_97049 ?auto_97047 ) ( not ( = ?auto_97046 ?auto_97049 ) ) ( SUPPORTS ?auto_97049 ?auto_97044 ) ( CALIBRATION_TARGET ?auto_97049 ?auto_97048 ) ( POWER_AVAIL ?auto_97047 ) ( POINTING ?auto_97047 ?auto_97045 ) ( not ( = ?auto_97048 ?auto_97045 ) ) ( not ( = ?auto_97043 ?auto_97045 ) ) ( not ( = ?auto_97044 ?auto_97040 ) ) ( not ( = ?auto_97039 ?auto_97045 ) ) ( not ( = ?auto_97044 ?auto_97041 ) ) ( not ( = ?auto_97040 ?auto_97041 ) ) ( not ( = ?auto_97042 ?auto_97045 ) ) ( not ( = ?auto_97050 ?auto_97049 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_97043 ?auto_97044 ?auto_97042 ?auto_97041 ?auto_97039 ?auto_97040 )
      ( GET-3IMAGE-VERIFY ?auto_97039 ?auto_97040 ?auto_97042 ?auto_97041 ?auto_97043 ?auto_97044 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_97093 - DIRECTION
      ?auto_97094 - MODE
      ?auto_97096 - DIRECTION
      ?auto_97095 - MODE
      ?auto_97097 - DIRECTION
      ?auto_97098 - MODE
    )
    :vars
    (
      ?auto_97104 - INSTRUMENT
      ?auto_97101 - SATELLITE
      ?auto_97102 - DIRECTION
      ?auto_97100 - INSTRUMENT
      ?auto_97103 - INSTRUMENT
      ?auto_97099 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_97096 ?auto_97093 ) ) ( not ( = ?auto_97097 ?auto_97093 ) ) ( not ( = ?auto_97097 ?auto_97096 ) ) ( ON_BOARD ?auto_97104 ?auto_97101 ) ( SUPPORTS ?auto_97104 ?auto_97094 ) ( not ( = ?auto_97093 ?auto_97102 ) ) ( CALIBRATION_TARGET ?auto_97104 ?auto_97102 ) ( not ( = ?auto_97102 ?auto_97097 ) ) ( ON_BOARD ?auto_97100 ?auto_97101 ) ( not ( = ?auto_97104 ?auto_97100 ) ) ( SUPPORTS ?auto_97100 ?auto_97098 ) ( CALIBRATION_TARGET ?auto_97100 ?auto_97102 ) ( not ( = ?auto_97102 ?auto_97096 ) ) ( ON_BOARD ?auto_97103 ?auto_97101 ) ( not ( = ?auto_97100 ?auto_97103 ) ) ( SUPPORTS ?auto_97103 ?auto_97095 ) ( CALIBRATION_TARGET ?auto_97103 ?auto_97102 ) ( POWER_AVAIL ?auto_97101 ) ( POINTING ?auto_97101 ?auto_97099 ) ( not ( = ?auto_97102 ?auto_97099 ) ) ( not ( = ?auto_97096 ?auto_97099 ) ) ( not ( = ?auto_97095 ?auto_97098 ) ) ( not ( = ?auto_97097 ?auto_97099 ) ) ( not ( = ?auto_97095 ?auto_97094 ) ) ( not ( = ?auto_97098 ?auto_97094 ) ) ( not ( = ?auto_97093 ?auto_97099 ) ) ( not ( = ?auto_97104 ?auto_97103 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_97096 ?auto_97095 ?auto_97093 ?auto_97094 ?auto_97097 ?auto_97098 )
      ( GET-3IMAGE-VERIFY ?auto_97093 ?auto_97094 ?auto_97096 ?auto_97095 ?auto_97097 ?auto_97098 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_97119 - DIRECTION
      ?auto_97120 - MODE
      ?auto_97122 - DIRECTION
      ?auto_97121 - MODE
      ?auto_97123 - DIRECTION
      ?auto_97124 - MODE
    )
    :vars
    (
      ?auto_97130 - INSTRUMENT
      ?auto_97127 - SATELLITE
      ?auto_97128 - DIRECTION
      ?auto_97126 - INSTRUMENT
      ?auto_97129 - INSTRUMENT
      ?auto_97125 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_97122 ?auto_97119 ) ) ( not ( = ?auto_97123 ?auto_97119 ) ) ( not ( = ?auto_97123 ?auto_97122 ) ) ( ON_BOARD ?auto_97130 ?auto_97127 ) ( SUPPORTS ?auto_97130 ?auto_97120 ) ( not ( = ?auto_97119 ?auto_97128 ) ) ( CALIBRATION_TARGET ?auto_97130 ?auto_97128 ) ( not ( = ?auto_97128 ?auto_97122 ) ) ( ON_BOARD ?auto_97126 ?auto_97127 ) ( not ( = ?auto_97130 ?auto_97126 ) ) ( SUPPORTS ?auto_97126 ?auto_97121 ) ( CALIBRATION_TARGET ?auto_97126 ?auto_97128 ) ( not ( = ?auto_97128 ?auto_97123 ) ) ( ON_BOARD ?auto_97129 ?auto_97127 ) ( not ( = ?auto_97126 ?auto_97129 ) ) ( SUPPORTS ?auto_97129 ?auto_97124 ) ( CALIBRATION_TARGET ?auto_97129 ?auto_97128 ) ( POWER_AVAIL ?auto_97127 ) ( POINTING ?auto_97127 ?auto_97125 ) ( not ( = ?auto_97128 ?auto_97125 ) ) ( not ( = ?auto_97123 ?auto_97125 ) ) ( not ( = ?auto_97124 ?auto_97121 ) ) ( not ( = ?auto_97122 ?auto_97125 ) ) ( not ( = ?auto_97124 ?auto_97120 ) ) ( not ( = ?auto_97121 ?auto_97120 ) ) ( not ( = ?auto_97119 ?auto_97125 ) ) ( not ( = ?auto_97130 ?auto_97129 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_97123 ?auto_97124 ?auto_97119 ?auto_97120 ?auto_97122 ?auto_97121 )
      ( GET-3IMAGE-VERIFY ?auto_97119 ?auto_97120 ?auto_97122 ?auto_97121 ?auto_97123 ?auto_97124 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_97205 - DIRECTION
      ?auto_97206 - MODE
    )
    :vars
    (
      ?auto_97207 - INSTRUMENT
      ?auto_97208 - SATELLITE
      ?auto_97209 - DIRECTION
      ?auto_97210 - DIRECTION
      ?auto_97211 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_97207 ?auto_97208 ) ( SUPPORTS ?auto_97207 ?auto_97206 ) ( not ( = ?auto_97205 ?auto_97209 ) ) ( CALIBRATION_TARGET ?auto_97207 ?auto_97209 ) ( POINTING ?auto_97208 ?auto_97210 ) ( not ( = ?auto_97209 ?auto_97210 ) ) ( ON_BOARD ?auto_97211 ?auto_97208 ) ( POWER_ON ?auto_97211 ) ( not ( = ?auto_97205 ?auto_97210 ) ) ( not ( = ?auto_97207 ?auto_97211 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_97211 ?auto_97208 )
      ( !TURN_TO ?auto_97208 ?auto_97209 ?auto_97210 )
      ( !SWITCH_ON ?auto_97207 ?auto_97208 )
      ( !CALIBRATE ?auto_97208 ?auto_97207 ?auto_97209 )
      ( !TURN_TO ?auto_97208 ?auto_97205 ?auto_97209 )
      ( !TAKE_IMAGE ?auto_97208 ?auto_97205 ?auto_97207 ?auto_97206 )
      ( GET-1IMAGE-VERIFY ?auto_97205 ?auto_97206 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_98771 - DIRECTION
      ?auto_98772 - MODE
      ?auto_98774 - DIRECTION
      ?auto_98773 - MODE
      ?auto_98775 - DIRECTION
      ?auto_98776 - MODE
      ?auto_98777 - DIRECTION
      ?auto_98778 - MODE
    )
    :vars
    (
      ?auto_98780 - INSTRUMENT
      ?auto_98779 - SATELLITE
      ?auto_98782 - DIRECTION
      ?auto_98781 - INSTRUMENT
      ?auto_98784 - INSTRUMENT
      ?auto_98785 - INSTRUMENT
      ?auto_98783 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_98774 ?auto_98771 ) ) ( not ( = ?auto_98775 ?auto_98771 ) ) ( not ( = ?auto_98775 ?auto_98774 ) ) ( not ( = ?auto_98777 ?auto_98771 ) ) ( not ( = ?auto_98777 ?auto_98774 ) ) ( not ( = ?auto_98777 ?auto_98775 ) ) ( ON_BOARD ?auto_98780 ?auto_98779 ) ( SUPPORTS ?auto_98780 ?auto_98778 ) ( not ( = ?auto_98777 ?auto_98782 ) ) ( CALIBRATION_TARGET ?auto_98780 ?auto_98782 ) ( not ( = ?auto_98782 ?auto_98775 ) ) ( ON_BOARD ?auto_98781 ?auto_98779 ) ( not ( = ?auto_98780 ?auto_98781 ) ) ( SUPPORTS ?auto_98781 ?auto_98776 ) ( CALIBRATION_TARGET ?auto_98781 ?auto_98782 ) ( not ( = ?auto_98782 ?auto_98774 ) ) ( ON_BOARD ?auto_98784 ?auto_98779 ) ( not ( = ?auto_98781 ?auto_98784 ) ) ( SUPPORTS ?auto_98784 ?auto_98773 ) ( CALIBRATION_TARGET ?auto_98784 ?auto_98782 ) ( not ( = ?auto_98782 ?auto_98771 ) ) ( ON_BOARD ?auto_98785 ?auto_98779 ) ( not ( = ?auto_98784 ?auto_98785 ) ) ( SUPPORTS ?auto_98785 ?auto_98772 ) ( CALIBRATION_TARGET ?auto_98785 ?auto_98782 ) ( POWER_AVAIL ?auto_98779 ) ( POINTING ?auto_98779 ?auto_98783 ) ( not ( = ?auto_98782 ?auto_98783 ) ) ( not ( = ?auto_98771 ?auto_98783 ) ) ( not ( = ?auto_98772 ?auto_98773 ) ) ( not ( = ?auto_98774 ?auto_98783 ) ) ( not ( = ?auto_98772 ?auto_98776 ) ) ( not ( = ?auto_98773 ?auto_98776 ) ) ( not ( = ?auto_98775 ?auto_98783 ) ) ( not ( = ?auto_98781 ?auto_98785 ) ) ( not ( = ?auto_98772 ?auto_98778 ) ) ( not ( = ?auto_98773 ?auto_98778 ) ) ( not ( = ?auto_98776 ?auto_98778 ) ) ( not ( = ?auto_98777 ?auto_98783 ) ) ( not ( = ?auto_98780 ?auto_98784 ) ) ( not ( = ?auto_98780 ?auto_98785 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_98771 ?auto_98772 ?auto_98775 ?auto_98776 ?auto_98774 ?auto_98773 )
      ( GET-1IMAGE ?auto_98777 ?auto_98778 )
      ( GET-4IMAGE-VERIFY ?auto_98771 ?auto_98772 ?auto_98774 ?auto_98773 ?auto_98775 ?auto_98776 ?auto_98777 ?auto_98778 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_98820 - DIRECTION
      ?auto_98821 - MODE
      ?auto_98823 - DIRECTION
      ?auto_98822 - MODE
      ?auto_98824 - DIRECTION
      ?auto_98825 - MODE
      ?auto_98826 - DIRECTION
      ?auto_98827 - MODE
    )
    :vars
    (
      ?auto_98828 - INSTRUMENT
      ?auto_98834 - SATELLITE
      ?auto_98832 - DIRECTION
      ?auto_98833 - INSTRUMENT
      ?auto_98831 - INSTRUMENT
      ?auto_98829 - INSTRUMENT
      ?auto_98830 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_98823 ?auto_98820 ) ) ( not ( = ?auto_98824 ?auto_98820 ) ) ( not ( = ?auto_98824 ?auto_98823 ) ) ( not ( = ?auto_98826 ?auto_98820 ) ) ( not ( = ?auto_98826 ?auto_98823 ) ) ( not ( = ?auto_98826 ?auto_98824 ) ) ( ON_BOARD ?auto_98828 ?auto_98834 ) ( SUPPORTS ?auto_98828 ?auto_98825 ) ( not ( = ?auto_98824 ?auto_98832 ) ) ( CALIBRATION_TARGET ?auto_98828 ?auto_98832 ) ( not ( = ?auto_98832 ?auto_98826 ) ) ( ON_BOARD ?auto_98833 ?auto_98834 ) ( not ( = ?auto_98828 ?auto_98833 ) ) ( SUPPORTS ?auto_98833 ?auto_98827 ) ( CALIBRATION_TARGET ?auto_98833 ?auto_98832 ) ( not ( = ?auto_98832 ?auto_98823 ) ) ( ON_BOARD ?auto_98831 ?auto_98834 ) ( not ( = ?auto_98833 ?auto_98831 ) ) ( SUPPORTS ?auto_98831 ?auto_98822 ) ( CALIBRATION_TARGET ?auto_98831 ?auto_98832 ) ( not ( = ?auto_98832 ?auto_98820 ) ) ( ON_BOARD ?auto_98829 ?auto_98834 ) ( not ( = ?auto_98831 ?auto_98829 ) ) ( SUPPORTS ?auto_98829 ?auto_98821 ) ( CALIBRATION_TARGET ?auto_98829 ?auto_98832 ) ( POWER_AVAIL ?auto_98834 ) ( POINTING ?auto_98834 ?auto_98830 ) ( not ( = ?auto_98832 ?auto_98830 ) ) ( not ( = ?auto_98820 ?auto_98830 ) ) ( not ( = ?auto_98821 ?auto_98822 ) ) ( not ( = ?auto_98823 ?auto_98830 ) ) ( not ( = ?auto_98821 ?auto_98827 ) ) ( not ( = ?auto_98822 ?auto_98827 ) ) ( not ( = ?auto_98826 ?auto_98830 ) ) ( not ( = ?auto_98833 ?auto_98829 ) ) ( not ( = ?auto_98821 ?auto_98825 ) ) ( not ( = ?auto_98822 ?auto_98825 ) ) ( not ( = ?auto_98827 ?auto_98825 ) ) ( not ( = ?auto_98824 ?auto_98830 ) ) ( not ( = ?auto_98828 ?auto_98831 ) ) ( not ( = ?auto_98828 ?auto_98829 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_98820 ?auto_98821 ?auto_98823 ?auto_98822 ?auto_98826 ?auto_98827 ?auto_98824 ?auto_98825 )
      ( GET-4IMAGE-VERIFY ?auto_98820 ?auto_98821 ?auto_98823 ?auto_98822 ?auto_98824 ?auto_98825 ?auto_98826 ?auto_98827 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_98869 - DIRECTION
      ?auto_98870 - MODE
      ?auto_98872 - DIRECTION
      ?auto_98871 - MODE
      ?auto_98873 - DIRECTION
      ?auto_98874 - MODE
      ?auto_98875 - DIRECTION
      ?auto_98876 - MODE
    )
    :vars
    (
      ?auto_98883 - INSTRUMENT
      ?auto_98881 - SATELLITE
      ?auto_98879 - DIRECTION
      ?auto_98882 - INSTRUMENT
      ?auto_98877 - INSTRUMENT
      ?auto_98878 - INSTRUMENT
      ?auto_98880 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_98872 ?auto_98869 ) ) ( not ( = ?auto_98873 ?auto_98869 ) ) ( not ( = ?auto_98873 ?auto_98872 ) ) ( not ( = ?auto_98875 ?auto_98869 ) ) ( not ( = ?auto_98875 ?auto_98872 ) ) ( not ( = ?auto_98875 ?auto_98873 ) ) ( ON_BOARD ?auto_98883 ?auto_98881 ) ( SUPPORTS ?auto_98883 ?auto_98876 ) ( not ( = ?auto_98875 ?auto_98879 ) ) ( CALIBRATION_TARGET ?auto_98883 ?auto_98879 ) ( not ( = ?auto_98879 ?auto_98872 ) ) ( ON_BOARD ?auto_98882 ?auto_98881 ) ( not ( = ?auto_98883 ?auto_98882 ) ) ( SUPPORTS ?auto_98882 ?auto_98871 ) ( CALIBRATION_TARGET ?auto_98882 ?auto_98879 ) ( not ( = ?auto_98879 ?auto_98873 ) ) ( ON_BOARD ?auto_98877 ?auto_98881 ) ( not ( = ?auto_98882 ?auto_98877 ) ) ( SUPPORTS ?auto_98877 ?auto_98874 ) ( CALIBRATION_TARGET ?auto_98877 ?auto_98879 ) ( not ( = ?auto_98879 ?auto_98869 ) ) ( ON_BOARD ?auto_98878 ?auto_98881 ) ( not ( = ?auto_98877 ?auto_98878 ) ) ( SUPPORTS ?auto_98878 ?auto_98870 ) ( CALIBRATION_TARGET ?auto_98878 ?auto_98879 ) ( POWER_AVAIL ?auto_98881 ) ( POINTING ?auto_98881 ?auto_98880 ) ( not ( = ?auto_98879 ?auto_98880 ) ) ( not ( = ?auto_98869 ?auto_98880 ) ) ( not ( = ?auto_98870 ?auto_98874 ) ) ( not ( = ?auto_98873 ?auto_98880 ) ) ( not ( = ?auto_98870 ?auto_98871 ) ) ( not ( = ?auto_98874 ?auto_98871 ) ) ( not ( = ?auto_98872 ?auto_98880 ) ) ( not ( = ?auto_98882 ?auto_98878 ) ) ( not ( = ?auto_98870 ?auto_98876 ) ) ( not ( = ?auto_98874 ?auto_98876 ) ) ( not ( = ?auto_98871 ?auto_98876 ) ) ( not ( = ?auto_98875 ?auto_98880 ) ) ( not ( = ?auto_98883 ?auto_98877 ) ) ( not ( = ?auto_98883 ?auto_98878 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_98869 ?auto_98870 ?auto_98873 ?auto_98874 ?auto_98875 ?auto_98876 ?auto_98872 ?auto_98871 )
      ( GET-4IMAGE-VERIFY ?auto_98869 ?auto_98870 ?auto_98872 ?auto_98871 ?auto_98873 ?auto_98874 ?auto_98875 ?auto_98876 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_98918 - DIRECTION
      ?auto_98919 - MODE
      ?auto_98921 - DIRECTION
      ?auto_98920 - MODE
      ?auto_98922 - DIRECTION
      ?auto_98923 - MODE
      ?auto_98924 - DIRECTION
      ?auto_98925 - MODE
    )
    :vars
    (
      ?auto_98932 - INSTRUMENT
      ?auto_98930 - SATELLITE
      ?auto_98928 - DIRECTION
      ?auto_98931 - INSTRUMENT
      ?auto_98926 - INSTRUMENT
      ?auto_98927 - INSTRUMENT
      ?auto_98929 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_98921 ?auto_98918 ) ) ( not ( = ?auto_98922 ?auto_98918 ) ) ( not ( = ?auto_98922 ?auto_98921 ) ) ( not ( = ?auto_98924 ?auto_98918 ) ) ( not ( = ?auto_98924 ?auto_98921 ) ) ( not ( = ?auto_98924 ?auto_98922 ) ) ( ON_BOARD ?auto_98932 ?auto_98930 ) ( SUPPORTS ?auto_98932 ?auto_98923 ) ( not ( = ?auto_98922 ?auto_98928 ) ) ( CALIBRATION_TARGET ?auto_98932 ?auto_98928 ) ( not ( = ?auto_98928 ?auto_98921 ) ) ( ON_BOARD ?auto_98931 ?auto_98930 ) ( not ( = ?auto_98932 ?auto_98931 ) ) ( SUPPORTS ?auto_98931 ?auto_98920 ) ( CALIBRATION_TARGET ?auto_98931 ?auto_98928 ) ( not ( = ?auto_98928 ?auto_98924 ) ) ( ON_BOARD ?auto_98926 ?auto_98930 ) ( not ( = ?auto_98931 ?auto_98926 ) ) ( SUPPORTS ?auto_98926 ?auto_98925 ) ( CALIBRATION_TARGET ?auto_98926 ?auto_98928 ) ( not ( = ?auto_98928 ?auto_98918 ) ) ( ON_BOARD ?auto_98927 ?auto_98930 ) ( not ( = ?auto_98926 ?auto_98927 ) ) ( SUPPORTS ?auto_98927 ?auto_98919 ) ( CALIBRATION_TARGET ?auto_98927 ?auto_98928 ) ( POWER_AVAIL ?auto_98930 ) ( POINTING ?auto_98930 ?auto_98929 ) ( not ( = ?auto_98928 ?auto_98929 ) ) ( not ( = ?auto_98918 ?auto_98929 ) ) ( not ( = ?auto_98919 ?auto_98925 ) ) ( not ( = ?auto_98924 ?auto_98929 ) ) ( not ( = ?auto_98919 ?auto_98920 ) ) ( not ( = ?auto_98925 ?auto_98920 ) ) ( not ( = ?auto_98921 ?auto_98929 ) ) ( not ( = ?auto_98931 ?auto_98927 ) ) ( not ( = ?auto_98919 ?auto_98923 ) ) ( not ( = ?auto_98925 ?auto_98923 ) ) ( not ( = ?auto_98920 ?auto_98923 ) ) ( not ( = ?auto_98922 ?auto_98929 ) ) ( not ( = ?auto_98932 ?auto_98926 ) ) ( not ( = ?auto_98932 ?auto_98927 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_98918 ?auto_98919 ?auto_98924 ?auto_98925 ?auto_98922 ?auto_98923 ?auto_98921 ?auto_98920 )
      ( GET-4IMAGE-VERIFY ?auto_98918 ?auto_98919 ?auto_98921 ?auto_98920 ?auto_98922 ?auto_98923 ?auto_98924 ?auto_98925 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_99073 - DIRECTION
      ?auto_99074 - MODE
      ?auto_99076 - DIRECTION
      ?auto_99075 - MODE
      ?auto_99077 - DIRECTION
      ?auto_99078 - MODE
      ?auto_99079 - DIRECTION
      ?auto_99080 - MODE
    )
    :vars
    (
      ?auto_99087 - INSTRUMENT
      ?auto_99085 - SATELLITE
      ?auto_99083 - DIRECTION
      ?auto_99086 - INSTRUMENT
      ?auto_99081 - INSTRUMENT
      ?auto_99082 - INSTRUMENT
      ?auto_99084 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_99076 ?auto_99073 ) ) ( not ( = ?auto_99077 ?auto_99073 ) ) ( not ( = ?auto_99077 ?auto_99076 ) ) ( not ( = ?auto_99079 ?auto_99073 ) ) ( not ( = ?auto_99079 ?auto_99076 ) ) ( not ( = ?auto_99079 ?auto_99077 ) ) ( ON_BOARD ?auto_99087 ?auto_99085 ) ( SUPPORTS ?auto_99087 ?auto_99075 ) ( not ( = ?auto_99076 ?auto_99083 ) ) ( CALIBRATION_TARGET ?auto_99087 ?auto_99083 ) ( not ( = ?auto_99083 ?auto_99079 ) ) ( ON_BOARD ?auto_99086 ?auto_99085 ) ( not ( = ?auto_99087 ?auto_99086 ) ) ( SUPPORTS ?auto_99086 ?auto_99080 ) ( CALIBRATION_TARGET ?auto_99086 ?auto_99083 ) ( not ( = ?auto_99083 ?auto_99077 ) ) ( ON_BOARD ?auto_99081 ?auto_99085 ) ( not ( = ?auto_99086 ?auto_99081 ) ) ( SUPPORTS ?auto_99081 ?auto_99078 ) ( CALIBRATION_TARGET ?auto_99081 ?auto_99083 ) ( not ( = ?auto_99083 ?auto_99073 ) ) ( ON_BOARD ?auto_99082 ?auto_99085 ) ( not ( = ?auto_99081 ?auto_99082 ) ) ( SUPPORTS ?auto_99082 ?auto_99074 ) ( CALIBRATION_TARGET ?auto_99082 ?auto_99083 ) ( POWER_AVAIL ?auto_99085 ) ( POINTING ?auto_99085 ?auto_99084 ) ( not ( = ?auto_99083 ?auto_99084 ) ) ( not ( = ?auto_99073 ?auto_99084 ) ) ( not ( = ?auto_99074 ?auto_99078 ) ) ( not ( = ?auto_99077 ?auto_99084 ) ) ( not ( = ?auto_99074 ?auto_99080 ) ) ( not ( = ?auto_99078 ?auto_99080 ) ) ( not ( = ?auto_99079 ?auto_99084 ) ) ( not ( = ?auto_99086 ?auto_99082 ) ) ( not ( = ?auto_99074 ?auto_99075 ) ) ( not ( = ?auto_99078 ?auto_99075 ) ) ( not ( = ?auto_99080 ?auto_99075 ) ) ( not ( = ?auto_99076 ?auto_99084 ) ) ( not ( = ?auto_99087 ?auto_99081 ) ) ( not ( = ?auto_99087 ?auto_99082 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_99073 ?auto_99074 ?auto_99077 ?auto_99078 ?auto_99076 ?auto_99075 ?auto_99079 ?auto_99080 )
      ( GET-4IMAGE-VERIFY ?auto_99073 ?auto_99074 ?auto_99076 ?auto_99075 ?auto_99077 ?auto_99078 ?auto_99079 ?auto_99080 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_99122 - DIRECTION
      ?auto_99123 - MODE
      ?auto_99125 - DIRECTION
      ?auto_99124 - MODE
      ?auto_99126 - DIRECTION
      ?auto_99127 - MODE
      ?auto_99128 - DIRECTION
      ?auto_99129 - MODE
    )
    :vars
    (
      ?auto_99136 - INSTRUMENT
      ?auto_99134 - SATELLITE
      ?auto_99132 - DIRECTION
      ?auto_99135 - INSTRUMENT
      ?auto_99130 - INSTRUMENT
      ?auto_99131 - INSTRUMENT
      ?auto_99133 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_99125 ?auto_99122 ) ) ( not ( = ?auto_99126 ?auto_99122 ) ) ( not ( = ?auto_99126 ?auto_99125 ) ) ( not ( = ?auto_99128 ?auto_99122 ) ) ( not ( = ?auto_99128 ?auto_99125 ) ) ( not ( = ?auto_99128 ?auto_99126 ) ) ( ON_BOARD ?auto_99136 ?auto_99134 ) ( SUPPORTS ?auto_99136 ?auto_99124 ) ( not ( = ?auto_99125 ?auto_99132 ) ) ( CALIBRATION_TARGET ?auto_99136 ?auto_99132 ) ( not ( = ?auto_99132 ?auto_99126 ) ) ( ON_BOARD ?auto_99135 ?auto_99134 ) ( not ( = ?auto_99136 ?auto_99135 ) ) ( SUPPORTS ?auto_99135 ?auto_99127 ) ( CALIBRATION_TARGET ?auto_99135 ?auto_99132 ) ( not ( = ?auto_99132 ?auto_99128 ) ) ( ON_BOARD ?auto_99130 ?auto_99134 ) ( not ( = ?auto_99135 ?auto_99130 ) ) ( SUPPORTS ?auto_99130 ?auto_99129 ) ( CALIBRATION_TARGET ?auto_99130 ?auto_99132 ) ( not ( = ?auto_99132 ?auto_99122 ) ) ( ON_BOARD ?auto_99131 ?auto_99134 ) ( not ( = ?auto_99130 ?auto_99131 ) ) ( SUPPORTS ?auto_99131 ?auto_99123 ) ( CALIBRATION_TARGET ?auto_99131 ?auto_99132 ) ( POWER_AVAIL ?auto_99134 ) ( POINTING ?auto_99134 ?auto_99133 ) ( not ( = ?auto_99132 ?auto_99133 ) ) ( not ( = ?auto_99122 ?auto_99133 ) ) ( not ( = ?auto_99123 ?auto_99129 ) ) ( not ( = ?auto_99128 ?auto_99133 ) ) ( not ( = ?auto_99123 ?auto_99127 ) ) ( not ( = ?auto_99129 ?auto_99127 ) ) ( not ( = ?auto_99126 ?auto_99133 ) ) ( not ( = ?auto_99135 ?auto_99131 ) ) ( not ( = ?auto_99123 ?auto_99124 ) ) ( not ( = ?auto_99129 ?auto_99124 ) ) ( not ( = ?auto_99127 ?auto_99124 ) ) ( not ( = ?auto_99125 ?auto_99133 ) ) ( not ( = ?auto_99136 ?auto_99130 ) ) ( not ( = ?auto_99136 ?auto_99131 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_99122 ?auto_99123 ?auto_99128 ?auto_99129 ?auto_99125 ?auto_99124 ?auto_99126 ?auto_99127 )
      ( GET-4IMAGE-VERIFY ?auto_99122 ?auto_99123 ?auto_99125 ?auto_99124 ?auto_99126 ?auto_99127 ?auto_99128 ?auto_99129 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_99277 - DIRECTION
      ?auto_99278 - MODE
      ?auto_99280 - DIRECTION
      ?auto_99279 - MODE
      ?auto_99281 - DIRECTION
      ?auto_99282 - MODE
      ?auto_99283 - DIRECTION
      ?auto_99284 - MODE
    )
    :vars
    (
      ?auto_99291 - INSTRUMENT
      ?auto_99289 - SATELLITE
      ?auto_99287 - DIRECTION
      ?auto_99290 - INSTRUMENT
      ?auto_99285 - INSTRUMENT
      ?auto_99286 - INSTRUMENT
      ?auto_99288 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_99280 ?auto_99277 ) ) ( not ( = ?auto_99281 ?auto_99277 ) ) ( not ( = ?auto_99281 ?auto_99280 ) ) ( not ( = ?auto_99283 ?auto_99277 ) ) ( not ( = ?auto_99283 ?auto_99280 ) ) ( not ( = ?auto_99283 ?auto_99281 ) ) ( ON_BOARD ?auto_99291 ?auto_99289 ) ( SUPPORTS ?auto_99291 ?auto_99284 ) ( not ( = ?auto_99283 ?auto_99287 ) ) ( CALIBRATION_TARGET ?auto_99291 ?auto_99287 ) ( not ( = ?auto_99287 ?auto_99281 ) ) ( ON_BOARD ?auto_99290 ?auto_99289 ) ( not ( = ?auto_99291 ?auto_99290 ) ) ( SUPPORTS ?auto_99290 ?auto_99282 ) ( CALIBRATION_TARGET ?auto_99290 ?auto_99287 ) ( not ( = ?auto_99287 ?auto_99277 ) ) ( ON_BOARD ?auto_99285 ?auto_99289 ) ( not ( = ?auto_99290 ?auto_99285 ) ) ( SUPPORTS ?auto_99285 ?auto_99278 ) ( CALIBRATION_TARGET ?auto_99285 ?auto_99287 ) ( not ( = ?auto_99287 ?auto_99280 ) ) ( ON_BOARD ?auto_99286 ?auto_99289 ) ( not ( = ?auto_99285 ?auto_99286 ) ) ( SUPPORTS ?auto_99286 ?auto_99279 ) ( CALIBRATION_TARGET ?auto_99286 ?auto_99287 ) ( POWER_AVAIL ?auto_99289 ) ( POINTING ?auto_99289 ?auto_99288 ) ( not ( = ?auto_99287 ?auto_99288 ) ) ( not ( = ?auto_99280 ?auto_99288 ) ) ( not ( = ?auto_99279 ?auto_99278 ) ) ( not ( = ?auto_99277 ?auto_99288 ) ) ( not ( = ?auto_99279 ?auto_99282 ) ) ( not ( = ?auto_99278 ?auto_99282 ) ) ( not ( = ?auto_99281 ?auto_99288 ) ) ( not ( = ?auto_99290 ?auto_99286 ) ) ( not ( = ?auto_99279 ?auto_99284 ) ) ( not ( = ?auto_99278 ?auto_99284 ) ) ( not ( = ?auto_99282 ?auto_99284 ) ) ( not ( = ?auto_99283 ?auto_99288 ) ) ( not ( = ?auto_99291 ?auto_99285 ) ) ( not ( = ?auto_99291 ?auto_99286 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_99280 ?auto_99279 ?auto_99277 ?auto_99278 ?auto_99283 ?auto_99284 ?auto_99281 ?auto_99282 )
      ( GET-4IMAGE-VERIFY ?auto_99277 ?auto_99278 ?auto_99280 ?auto_99279 ?auto_99281 ?auto_99282 ?auto_99283 ?auto_99284 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_99326 - DIRECTION
      ?auto_99327 - MODE
      ?auto_99329 - DIRECTION
      ?auto_99328 - MODE
      ?auto_99330 - DIRECTION
      ?auto_99331 - MODE
      ?auto_99332 - DIRECTION
      ?auto_99333 - MODE
    )
    :vars
    (
      ?auto_99340 - INSTRUMENT
      ?auto_99338 - SATELLITE
      ?auto_99336 - DIRECTION
      ?auto_99339 - INSTRUMENT
      ?auto_99334 - INSTRUMENT
      ?auto_99335 - INSTRUMENT
      ?auto_99337 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_99329 ?auto_99326 ) ) ( not ( = ?auto_99330 ?auto_99326 ) ) ( not ( = ?auto_99330 ?auto_99329 ) ) ( not ( = ?auto_99332 ?auto_99326 ) ) ( not ( = ?auto_99332 ?auto_99329 ) ) ( not ( = ?auto_99332 ?auto_99330 ) ) ( ON_BOARD ?auto_99340 ?auto_99338 ) ( SUPPORTS ?auto_99340 ?auto_99331 ) ( not ( = ?auto_99330 ?auto_99336 ) ) ( CALIBRATION_TARGET ?auto_99340 ?auto_99336 ) ( not ( = ?auto_99336 ?auto_99332 ) ) ( ON_BOARD ?auto_99339 ?auto_99338 ) ( not ( = ?auto_99340 ?auto_99339 ) ) ( SUPPORTS ?auto_99339 ?auto_99333 ) ( CALIBRATION_TARGET ?auto_99339 ?auto_99336 ) ( not ( = ?auto_99336 ?auto_99326 ) ) ( ON_BOARD ?auto_99334 ?auto_99338 ) ( not ( = ?auto_99339 ?auto_99334 ) ) ( SUPPORTS ?auto_99334 ?auto_99327 ) ( CALIBRATION_TARGET ?auto_99334 ?auto_99336 ) ( not ( = ?auto_99336 ?auto_99329 ) ) ( ON_BOARD ?auto_99335 ?auto_99338 ) ( not ( = ?auto_99334 ?auto_99335 ) ) ( SUPPORTS ?auto_99335 ?auto_99328 ) ( CALIBRATION_TARGET ?auto_99335 ?auto_99336 ) ( POWER_AVAIL ?auto_99338 ) ( POINTING ?auto_99338 ?auto_99337 ) ( not ( = ?auto_99336 ?auto_99337 ) ) ( not ( = ?auto_99329 ?auto_99337 ) ) ( not ( = ?auto_99328 ?auto_99327 ) ) ( not ( = ?auto_99326 ?auto_99337 ) ) ( not ( = ?auto_99328 ?auto_99333 ) ) ( not ( = ?auto_99327 ?auto_99333 ) ) ( not ( = ?auto_99332 ?auto_99337 ) ) ( not ( = ?auto_99339 ?auto_99335 ) ) ( not ( = ?auto_99328 ?auto_99331 ) ) ( not ( = ?auto_99327 ?auto_99331 ) ) ( not ( = ?auto_99333 ?auto_99331 ) ) ( not ( = ?auto_99330 ?auto_99337 ) ) ( not ( = ?auto_99340 ?auto_99334 ) ) ( not ( = ?auto_99340 ?auto_99335 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_99329 ?auto_99328 ?auto_99326 ?auto_99327 ?auto_99330 ?auto_99331 ?auto_99332 ?auto_99333 )
      ( GET-4IMAGE-VERIFY ?auto_99326 ?auto_99327 ?auto_99329 ?auto_99328 ?auto_99330 ?auto_99331 ?auto_99332 ?auto_99333 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_99483 - DIRECTION
      ?auto_99484 - MODE
      ?auto_99486 - DIRECTION
      ?auto_99485 - MODE
      ?auto_99487 - DIRECTION
      ?auto_99488 - MODE
      ?auto_99489 - DIRECTION
      ?auto_99490 - MODE
    )
    :vars
    (
      ?auto_99497 - INSTRUMENT
      ?auto_99495 - SATELLITE
      ?auto_99493 - DIRECTION
      ?auto_99496 - INSTRUMENT
      ?auto_99491 - INSTRUMENT
      ?auto_99492 - INSTRUMENT
      ?auto_99494 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_99486 ?auto_99483 ) ) ( not ( = ?auto_99487 ?auto_99483 ) ) ( not ( = ?auto_99487 ?auto_99486 ) ) ( not ( = ?auto_99489 ?auto_99483 ) ) ( not ( = ?auto_99489 ?auto_99486 ) ) ( not ( = ?auto_99489 ?auto_99487 ) ) ( ON_BOARD ?auto_99497 ?auto_99495 ) ( SUPPORTS ?auto_99497 ?auto_99490 ) ( not ( = ?auto_99489 ?auto_99493 ) ) ( CALIBRATION_TARGET ?auto_99497 ?auto_99493 ) ( not ( = ?auto_99493 ?auto_99486 ) ) ( ON_BOARD ?auto_99496 ?auto_99495 ) ( not ( = ?auto_99497 ?auto_99496 ) ) ( SUPPORTS ?auto_99496 ?auto_99485 ) ( CALIBRATION_TARGET ?auto_99496 ?auto_99493 ) ( not ( = ?auto_99493 ?auto_99483 ) ) ( ON_BOARD ?auto_99491 ?auto_99495 ) ( not ( = ?auto_99496 ?auto_99491 ) ) ( SUPPORTS ?auto_99491 ?auto_99484 ) ( CALIBRATION_TARGET ?auto_99491 ?auto_99493 ) ( not ( = ?auto_99493 ?auto_99487 ) ) ( ON_BOARD ?auto_99492 ?auto_99495 ) ( not ( = ?auto_99491 ?auto_99492 ) ) ( SUPPORTS ?auto_99492 ?auto_99488 ) ( CALIBRATION_TARGET ?auto_99492 ?auto_99493 ) ( POWER_AVAIL ?auto_99495 ) ( POINTING ?auto_99495 ?auto_99494 ) ( not ( = ?auto_99493 ?auto_99494 ) ) ( not ( = ?auto_99487 ?auto_99494 ) ) ( not ( = ?auto_99488 ?auto_99484 ) ) ( not ( = ?auto_99483 ?auto_99494 ) ) ( not ( = ?auto_99488 ?auto_99485 ) ) ( not ( = ?auto_99484 ?auto_99485 ) ) ( not ( = ?auto_99486 ?auto_99494 ) ) ( not ( = ?auto_99496 ?auto_99492 ) ) ( not ( = ?auto_99488 ?auto_99490 ) ) ( not ( = ?auto_99484 ?auto_99490 ) ) ( not ( = ?auto_99485 ?auto_99490 ) ) ( not ( = ?auto_99489 ?auto_99494 ) ) ( not ( = ?auto_99497 ?auto_99491 ) ) ( not ( = ?auto_99497 ?auto_99492 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_99487 ?auto_99488 ?auto_99483 ?auto_99484 ?auto_99489 ?auto_99490 ?auto_99486 ?auto_99485 )
      ( GET-4IMAGE-VERIFY ?auto_99483 ?auto_99484 ?auto_99486 ?auto_99485 ?auto_99487 ?auto_99488 ?auto_99489 ?auto_99490 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_99532 - DIRECTION
      ?auto_99533 - MODE
      ?auto_99535 - DIRECTION
      ?auto_99534 - MODE
      ?auto_99536 - DIRECTION
      ?auto_99537 - MODE
      ?auto_99538 - DIRECTION
      ?auto_99539 - MODE
    )
    :vars
    (
      ?auto_99546 - INSTRUMENT
      ?auto_99544 - SATELLITE
      ?auto_99542 - DIRECTION
      ?auto_99545 - INSTRUMENT
      ?auto_99540 - INSTRUMENT
      ?auto_99541 - INSTRUMENT
      ?auto_99543 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_99535 ?auto_99532 ) ) ( not ( = ?auto_99536 ?auto_99532 ) ) ( not ( = ?auto_99536 ?auto_99535 ) ) ( not ( = ?auto_99538 ?auto_99532 ) ) ( not ( = ?auto_99538 ?auto_99535 ) ) ( not ( = ?auto_99538 ?auto_99536 ) ) ( ON_BOARD ?auto_99546 ?auto_99544 ) ( SUPPORTS ?auto_99546 ?auto_99537 ) ( not ( = ?auto_99536 ?auto_99542 ) ) ( CALIBRATION_TARGET ?auto_99546 ?auto_99542 ) ( not ( = ?auto_99542 ?auto_99535 ) ) ( ON_BOARD ?auto_99545 ?auto_99544 ) ( not ( = ?auto_99546 ?auto_99545 ) ) ( SUPPORTS ?auto_99545 ?auto_99534 ) ( CALIBRATION_TARGET ?auto_99545 ?auto_99542 ) ( not ( = ?auto_99542 ?auto_99532 ) ) ( ON_BOARD ?auto_99540 ?auto_99544 ) ( not ( = ?auto_99545 ?auto_99540 ) ) ( SUPPORTS ?auto_99540 ?auto_99533 ) ( CALIBRATION_TARGET ?auto_99540 ?auto_99542 ) ( not ( = ?auto_99542 ?auto_99538 ) ) ( ON_BOARD ?auto_99541 ?auto_99544 ) ( not ( = ?auto_99540 ?auto_99541 ) ) ( SUPPORTS ?auto_99541 ?auto_99539 ) ( CALIBRATION_TARGET ?auto_99541 ?auto_99542 ) ( POWER_AVAIL ?auto_99544 ) ( POINTING ?auto_99544 ?auto_99543 ) ( not ( = ?auto_99542 ?auto_99543 ) ) ( not ( = ?auto_99538 ?auto_99543 ) ) ( not ( = ?auto_99539 ?auto_99533 ) ) ( not ( = ?auto_99532 ?auto_99543 ) ) ( not ( = ?auto_99539 ?auto_99534 ) ) ( not ( = ?auto_99533 ?auto_99534 ) ) ( not ( = ?auto_99535 ?auto_99543 ) ) ( not ( = ?auto_99545 ?auto_99541 ) ) ( not ( = ?auto_99539 ?auto_99537 ) ) ( not ( = ?auto_99533 ?auto_99537 ) ) ( not ( = ?auto_99534 ?auto_99537 ) ) ( not ( = ?auto_99536 ?auto_99543 ) ) ( not ( = ?auto_99546 ?auto_99540 ) ) ( not ( = ?auto_99546 ?auto_99541 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_99538 ?auto_99539 ?auto_99532 ?auto_99533 ?auto_99536 ?auto_99537 ?auto_99535 ?auto_99534 )
      ( GET-4IMAGE-VERIFY ?auto_99532 ?auto_99533 ?auto_99535 ?auto_99534 ?auto_99536 ?auto_99537 ?auto_99538 ?auto_99539 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_99632 - DIRECTION
      ?auto_99633 - MODE
      ?auto_99635 - DIRECTION
      ?auto_99634 - MODE
      ?auto_99636 - DIRECTION
      ?auto_99637 - MODE
      ?auto_99638 - DIRECTION
      ?auto_99639 - MODE
    )
    :vars
    (
      ?auto_99646 - INSTRUMENT
      ?auto_99644 - SATELLITE
      ?auto_99642 - DIRECTION
      ?auto_99645 - INSTRUMENT
      ?auto_99640 - INSTRUMENT
      ?auto_99641 - INSTRUMENT
      ?auto_99643 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_99635 ?auto_99632 ) ) ( not ( = ?auto_99636 ?auto_99632 ) ) ( not ( = ?auto_99636 ?auto_99635 ) ) ( not ( = ?auto_99638 ?auto_99632 ) ) ( not ( = ?auto_99638 ?auto_99635 ) ) ( not ( = ?auto_99638 ?auto_99636 ) ) ( ON_BOARD ?auto_99646 ?auto_99644 ) ( SUPPORTS ?auto_99646 ?auto_99634 ) ( not ( = ?auto_99635 ?auto_99642 ) ) ( CALIBRATION_TARGET ?auto_99646 ?auto_99642 ) ( not ( = ?auto_99642 ?auto_99638 ) ) ( ON_BOARD ?auto_99645 ?auto_99644 ) ( not ( = ?auto_99646 ?auto_99645 ) ) ( SUPPORTS ?auto_99645 ?auto_99639 ) ( CALIBRATION_TARGET ?auto_99645 ?auto_99642 ) ( not ( = ?auto_99642 ?auto_99632 ) ) ( ON_BOARD ?auto_99640 ?auto_99644 ) ( not ( = ?auto_99645 ?auto_99640 ) ) ( SUPPORTS ?auto_99640 ?auto_99633 ) ( CALIBRATION_TARGET ?auto_99640 ?auto_99642 ) ( not ( = ?auto_99642 ?auto_99636 ) ) ( ON_BOARD ?auto_99641 ?auto_99644 ) ( not ( = ?auto_99640 ?auto_99641 ) ) ( SUPPORTS ?auto_99641 ?auto_99637 ) ( CALIBRATION_TARGET ?auto_99641 ?auto_99642 ) ( POWER_AVAIL ?auto_99644 ) ( POINTING ?auto_99644 ?auto_99643 ) ( not ( = ?auto_99642 ?auto_99643 ) ) ( not ( = ?auto_99636 ?auto_99643 ) ) ( not ( = ?auto_99637 ?auto_99633 ) ) ( not ( = ?auto_99632 ?auto_99643 ) ) ( not ( = ?auto_99637 ?auto_99639 ) ) ( not ( = ?auto_99633 ?auto_99639 ) ) ( not ( = ?auto_99638 ?auto_99643 ) ) ( not ( = ?auto_99645 ?auto_99641 ) ) ( not ( = ?auto_99637 ?auto_99634 ) ) ( not ( = ?auto_99633 ?auto_99634 ) ) ( not ( = ?auto_99639 ?auto_99634 ) ) ( not ( = ?auto_99635 ?auto_99643 ) ) ( not ( = ?auto_99646 ?auto_99640 ) ) ( not ( = ?auto_99646 ?auto_99641 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_99636 ?auto_99637 ?auto_99632 ?auto_99633 ?auto_99635 ?auto_99634 ?auto_99638 ?auto_99639 )
      ( GET-4IMAGE-VERIFY ?auto_99632 ?auto_99633 ?auto_99635 ?auto_99634 ?auto_99636 ?auto_99637 ?auto_99638 ?auto_99639 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_99736 - DIRECTION
      ?auto_99737 - MODE
      ?auto_99739 - DIRECTION
      ?auto_99738 - MODE
      ?auto_99740 - DIRECTION
      ?auto_99741 - MODE
      ?auto_99742 - DIRECTION
      ?auto_99743 - MODE
    )
    :vars
    (
      ?auto_99750 - INSTRUMENT
      ?auto_99748 - SATELLITE
      ?auto_99746 - DIRECTION
      ?auto_99749 - INSTRUMENT
      ?auto_99744 - INSTRUMENT
      ?auto_99745 - INSTRUMENT
      ?auto_99747 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_99739 ?auto_99736 ) ) ( not ( = ?auto_99740 ?auto_99736 ) ) ( not ( = ?auto_99740 ?auto_99739 ) ) ( not ( = ?auto_99742 ?auto_99736 ) ) ( not ( = ?auto_99742 ?auto_99739 ) ) ( not ( = ?auto_99742 ?auto_99740 ) ) ( ON_BOARD ?auto_99750 ?auto_99748 ) ( SUPPORTS ?auto_99750 ?auto_99738 ) ( not ( = ?auto_99739 ?auto_99746 ) ) ( CALIBRATION_TARGET ?auto_99750 ?auto_99746 ) ( not ( = ?auto_99746 ?auto_99740 ) ) ( ON_BOARD ?auto_99749 ?auto_99748 ) ( not ( = ?auto_99750 ?auto_99749 ) ) ( SUPPORTS ?auto_99749 ?auto_99741 ) ( CALIBRATION_TARGET ?auto_99749 ?auto_99746 ) ( not ( = ?auto_99746 ?auto_99736 ) ) ( ON_BOARD ?auto_99744 ?auto_99748 ) ( not ( = ?auto_99749 ?auto_99744 ) ) ( SUPPORTS ?auto_99744 ?auto_99737 ) ( CALIBRATION_TARGET ?auto_99744 ?auto_99746 ) ( not ( = ?auto_99746 ?auto_99742 ) ) ( ON_BOARD ?auto_99745 ?auto_99748 ) ( not ( = ?auto_99744 ?auto_99745 ) ) ( SUPPORTS ?auto_99745 ?auto_99743 ) ( CALIBRATION_TARGET ?auto_99745 ?auto_99746 ) ( POWER_AVAIL ?auto_99748 ) ( POINTING ?auto_99748 ?auto_99747 ) ( not ( = ?auto_99746 ?auto_99747 ) ) ( not ( = ?auto_99742 ?auto_99747 ) ) ( not ( = ?auto_99743 ?auto_99737 ) ) ( not ( = ?auto_99736 ?auto_99747 ) ) ( not ( = ?auto_99743 ?auto_99741 ) ) ( not ( = ?auto_99737 ?auto_99741 ) ) ( not ( = ?auto_99740 ?auto_99747 ) ) ( not ( = ?auto_99749 ?auto_99745 ) ) ( not ( = ?auto_99743 ?auto_99738 ) ) ( not ( = ?auto_99737 ?auto_99738 ) ) ( not ( = ?auto_99741 ?auto_99738 ) ) ( not ( = ?auto_99739 ?auto_99747 ) ) ( not ( = ?auto_99750 ?auto_99744 ) ) ( not ( = ?auto_99750 ?auto_99745 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_99742 ?auto_99743 ?auto_99736 ?auto_99737 ?auto_99739 ?auto_99738 ?auto_99740 ?auto_99741 )
      ( GET-4IMAGE-VERIFY ?auto_99736 ?auto_99737 ?auto_99739 ?auto_99738 ?auto_99740 ?auto_99741 ?auto_99742 ?auto_99743 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_99891 - DIRECTION
      ?auto_99892 - MODE
      ?auto_99894 - DIRECTION
      ?auto_99893 - MODE
      ?auto_99895 - DIRECTION
      ?auto_99896 - MODE
      ?auto_99897 - DIRECTION
      ?auto_99898 - MODE
    )
    :vars
    (
      ?auto_99905 - INSTRUMENT
      ?auto_99903 - SATELLITE
      ?auto_99901 - DIRECTION
      ?auto_99904 - INSTRUMENT
      ?auto_99899 - INSTRUMENT
      ?auto_99900 - INSTRUMENT
      ?auto_99902 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_99894 ?auto_99891 ) ) ( not ( = ?auto_99895 ?auto_99891 ) ) ( not ( = ?auto_99895 ?auto_99894 ) ) ( not ( = ?auto_99897 ?auto_99891 ) ) ( not ( = ?auto_99897 ?auto_99894 ) ) ( not ( = ?auto_99897 ?auto_99895 ) ) ( ON_BOARD ?auto_99905 ?auto_99903 ) ( SUPPORTS ?auto_99905 ?auto_99898 ) ( not ( = ?auto_99897 ?auto_99901 ) ) ( CALIBRATION_TARGET ?auto_99905 ?auto_99901 ) ( not ( = ?auto_99901 ?auto_99891 ) ) ( ON_BOARD ?auto_99904 ?auto_99903 ) ( not ( = ?auto_99905 ?auto_99904 ) ) ( SUPPORTS ?auto_99904 ?auto_99892 ) ( CALIBRATION_TARGET ?auto_99904 ?auto_99901 ) ( not ( = ?auto_99901 ?auto_99895 ) ) ( ON_BOARD ?auto_99899 ?auto_99903 ) ( not ( = ?auto_99904 ?auto_99899 ) ) ( SUPPORTS ?auto_99899 ?auto_99896 ) ( CALIBRATION_TARGET ?auto_99899 ?auto_99901 ) ( not ( = ?auto_99901 ?auto_99894 ) ) ( ON_BOARD ?auto_99900 ?auto_99903 ) ( not ( = ?auto_99899 ?auto_99900 ) ) ( SUPPORTS ?auto_99900 ?auto_99893 ) ( CALIBRATION_TARGET ?auto_99900 ?auto_99901 ) ( POWER_AVAIL ?auto_99903 ) ( POINTING ?auto_99903 ?auto_99902 ) ( not ( = ?auto_99901 ?auto_99902 ) ) ( not ( = ?auto_99894 ?auto_99902 ) ) ( not ( = ?auto_99893 ?auto_99896 ) ) ( not ( = ?auto_99895 ?auto_99902 ) ) ( not ( = ?auto_99893 ?auto_99892 ) ) ( not ( = ?auto_99896 ?auto_99892 ) ) ( not ( = ?auto_99891 ?auto_99902 ) ) ( not ( = ?auto_99904 ?auto_99900 ) ) ( not ( = ?auto_99893 ?auto_99898 ) ) ( not ( = ?auto_99896 ?auto_99898 ) ) ( not ( = ?auto_99892 ?auto_99898 ) ) ( not ( = ?auto_99897 ?auto_99902 ) ) ( not ( = ?auto_99905 ?auto_99899 ) ) ( not ( = ?auto_99905 ?auto_99900 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_99894 ?auto_99893 ?auto_99895 ?auto_99896 ?auto_99897 ?auto_99898 ?auto_99891 ?auto_99892 )
      ( GET-4IMAGE-VERIFY ?auto_99891 ?auto_99892 ?auto_99894 ?auto_99893 ?auto_99895 ?auto_99896 ?auto_99897 ?auto_99898 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_99940 - DIRECTION
      ?auto_99941 - MODE
      ?auto_99943 - DIRECTION
      ?auto_99942 - MODE
      ?auto_99944 - DIRECTION
      ?auto_99945 - MODE
      ?auto_99946 - DIRECTION
      ?auto_99947 - MODE
    )
    :vars
    (
      ?auto_99954 - INSTRUMENT
      ?auto_99952 - SATELLITE
      ?auto_99950 - DIRECTION
      ?auto_99953 - INSTRUMENT
      ?auto_99948 - INSTRUMENT
      ?auto_99949 - INSTRUMENT
      ?auto_99951 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_99943 ?auto_99940 ) ) ( not ( = ?auto_99944 ?auto_99940 ) ) ( not ( = ?auto_99944 ?auto_99943 ) ) ( not ( = ?auto_99946 ?auto_99940 ) ) ( not ( = ?auto_99946 ?auto_99943 ) ) ( not ( = ?auto_99946 ?auto_99944 ) ) ( ON_BOARD ?auto_99954 ?auto_99952 ) ( SUPPORTS ?auto_99954 ?auto_99945 ) ( not ( = ?auto_99944 ?auto_99950 ) ) ( CALIBRATION_TARGET ?auto_99954 ?auto_99950 ) ( not ( = ?auto_99950 ?auto_99940 ) ) ( ON_BOARD ?auto_99953 ?auto_99952 ) ( not ( = ?auto_99954 ?auto_99953 ) ) ( SUPPORTS ?auto_99953 ?auto_99941 ) ( CALIBRATION_TARGET ?auto_99953 ?auto_99950 ) ( not ( = ?auto_99950 ?auto_99946 ) ) ( ON_BOARD ?auto_99948 ?auto_99952 ) ( not ( = ?auto_99953 ?auto_99948 ) ) ( SUPPORTS ?auto_99948 ?auto_99947 ) ( CALIBRATION_TARGET ?auto_99948 ?auto_99950 ) ( not ( = ?auto_99950 ?auto_99943 ) ) ( ON_BOARD ?auto_99949 ?auto_99952 ) ( not ( = ?auto_99948 ?auto_99949 ) ) ( SUPPORTS ?auto_99949 ?auto_99942 ) ( CALIBRATION_TARGET ?auto_99949 ?auto_99950 ) ( POWER_AVAIL ?auto_99952 ) ( POINTING ?auto_99952 ?auto_99951 ) ( not ( = ?auto_99950 ?auto_99951 ) ) ( not ( = ?auto_99943 ?auto_99951 ) ) ( not ( = ?auto_99942 ?auto_99947 ) ) ( not ( = ?auto_99946 ?auto_99951 ) ) ( not ( = ?auto_99942 ?auto_99941 ) ) ( not ( = ?auto_99947 ?auto_99941 ) ) ( not ( = ?auto_99940 ?auto_99951 ) ) ( not ( = ?auto_99953 ?auto_99949 ) ) ( not ( = ?auto_99942 ?auto_99945 ) ) ( not ( = ?auto_99947 ?auto_99945 ) ) ( not ( = ?auto_99941 ?auto_99945 ) ) ( not ( = ?auto_99944 ?auto_99951 ) ) ( not ( = ?auto_99954 ?auto_99948 ) ) ( not ( = ?auto_99954 ?auto_99949 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_99943 ?auto_99942 ?auto_99946 ?auto_99947 ?auto_99944 ?auto_99945 ?auto_99940 ?auto_99941 )
      ( GET-4IMAGE-VERIFY ?auto_99940 ?auto_99941 ?auto_99943 ?auto_99942 ?auto_99944 ?auto_99945 ?auto_99946 ?auto_99947 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_99989 - DIRECTION
      ?auto_99990 - MODE
      ?auto_99992 - DIRECTION
      ?auto_99991 - MODE
      ?auto_99993 - DIRECTION
      ?auto_99994 - MODE
      ?auto_99995 - DIRECTION
      ?auto_99996 - MODE
    )
    :vars
    (
      ?auto_100003 - INSTRUMENT
      ?auto_100001 - SATELLITE
      ?auto_99999 - DIRECTION
      ?auto_100002 - INSTRUMENT
      ?auto_99997 - INSTRUMENT
      ?auto_99998 - INSTRUMENT
      ?auto_100000 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_99992 ?auto_99989 ) ) ( not ( = ?auto_99993 ?auto_99989 ) ) ( not ( = ?auto_99993 ?auto_99992 ) ) ( not ( = ?auto_99995 ?auto_99989 ) ) ( not ( = ?auto_99995 ?auto_99992 ) ) ( not ( = ?auto_99995 ?auto_99993 ) ) ( ON_BOARD ?auto_100003 ?auto_100001 ) ( SUPPORTS ?auto_100003 ?auto_99996 ) ( not ( = ?auto_99995 ?auto_99999 ) ) ( CALIBRATION_TARGET ?auto_100003 ?auto_99999 ) ( not ( = ?auto_99999 ?auto_99989 ) ) ( ON_BOARD ?auto_100002 ?auto_100001 ) ( not ( = ?auto_100003 ?auto_100002 ) ) ( SUPPORTS ?auto_100002 ?auto_99990 ) ( CALIBRATION_TARGET ?auto_100002 ?auto_99999 ) ( not ( = ?auto_99999 ?auto_99992 ) ) ( ON_BOARD ?auto_99997 ?auto_100001 ) ( not ( = ?auto_100002 ?auto_99997 ) ) ( SUPPORTS ?auto_99997 ?auto_99991 ) ( CALIBRATION_TARGET ?auto_99997 ?auto_99999 ) ( not ( = ?auto_99999 ?auto_99993 ) ) ( ON_BOARD ?auto_99998 ?auto_100001 ) ( not ( = ?auto_99997 ?auto_99998 ) ) ( SUPPORTS ?auto_99998 ?auto_99994 ) ( CALIBRATION_TARGET ?auto_99998 ?auto_99999 ) ( POWER_AVAIL ?auto_100001 ) ( POINTING ?auto_100001 ?auto_100000 ) ( not ( = ?auto_99999 ?auto_100000 ) ) ( not ( = ?auto_99993 ?auto_100000 ) ) ( not ( = ?auto_99994 ?auto_99991 ) ) ( not ( = ?auto_99992 ?auto_100000 ) ) ( not ( = ?auto_99994 ?auto_99990 ) ) ( not ( = ?auto_99991 ?auto_99990 ) ) ( not ( = ?auto_99989 ?auto_100000 ) ) ( not ( = ?auto_100002 ?auto_99998 ) ) ( not ( = ?auto_99994 ?auto_99996 ) ) ( not ( = ?auto_99991 ?auto_99996 ) ) ( not ( = ?auto_99990 ?auto_99996 ) ) ( not ( = ?auto_99995 ?auto_100000 ) ) ( not ( = ?auto_100003 ?auto_99997 ) ) ( not ( = ?auto_100003 ?auto_99998 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_99993 ?auto_99994 ?auto_99992 ?auto_99991 ?auto_99995 ?auto_99996 ?auto_99989 ?auto_99990 )
      ( GET-4IMAGE-VERIFY ?auto_99989 ?auto_99990 ?auto_99992 ?auto_99991 ?auto_99993 ?auto_99994 ?auto_99995 ?auto_99996 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_100038 - DIRECTION
      ?auto_100039 - MODE
      ?auto_100041 - DIRECTION
      ?auto_100040 - MODE
      ?auto_100042 - DIRECTION
      ?auto_100043 - MODE
      ?auto_100044 - DIRECTION
      ?auto_100045 - MODE
    )
    :vars
    (
      ?auto_100052 - INSTRUMENT
      ?auto_100050 - SATELLITE
      ?auto_100048 - DIRECTION
      ?auto_100051 - INSTRUMENT
      ?auto_100046 - INSTRUMENT
      ?auto_100047 - INSTRUMENT
      ?auto_100049 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_100041 ?auto_100038 ) ) ( not ( = ?auto_100042 ?auto_100038 ) ) ( not ( = ?auto_100042 ?auto_100041 ) ) ( not ( = ?auto_100044 ?auto_100038 ) ) ( not ( = ?auto_100044 ?auto_100041 ) ) ( not ( = ?auto_100044 ?auto_100042 ) ) ( ON_BOARD ?auto_100052 ?auto_100050 ) ( SUPPORTS ?auto_100052 ?auto_100043 ) ( not ( = ?auto_100042 ?auto_100048 ) ) ( CALIBRATION_TARGET ?auto_100052 ?auto_100048 ) ( not ( = ?auto_100048 ?auto_100038 ) ) ( ON_BOARD ?auto_100051 ?auto_100050 ) ( not ( = ?auto_100052 ?auto_100051 ) ) ( SUPPORTS ?auto_100051 ?auto_100039 ) ( CALIBRATION_TARGET ?auto_100051 ?auto_100048 ) ( not ( = ?auto_100048 ?auto_100041 ) ) ( ON_BOARD ?auto_100046 ?auto_100050 ) ( not ( = ?auto_100051 ?auto_100046 ) ) ( SUPPORTS ?auto_100046 ?auto_100040 ) ( CALIBRATION_TARGET ?auto_100046 ?auto_100048 ) ( not ( = ?auto_100048 ?auto_100044 ) ) ( ON_BOARD ?auto_100047 ?auto_100050 ) ( not ( = ?auto_100046 ?auto_100047 ) ) ( SUPPORTS ?auto_100047 ?auto_100045 ) ( CALIBRATION_TARGET ?auto_100047 ?auto_100048 ) ( POWER_AVAIL ?auto_100050 ) ( POINTING ?auto_100050 ?auto_100049 ) ( not ( = ?auto_100048 ?auto_100049 ) ) ( not ( = ?auto_100044 ?auto_100049 ) ) ( not ( = ?auto_100045 ?auto_100040 ) ) ( not ( = ?auto_100041 ?auto_100049 ) ) ( not ( = ?auto_100045 ?auto_100039 ) ) ( not ( = ?auto_100040 ?auto_100039 ) ) ( not ( = ?auto_100038 ?auto_100049 ) ) ( not ( = ?auto_100051 ?auto_100047 ) ) ( not ( = ?auto_100045 ?auto_100043 ) ) ( not ( = ?auto_100040 ?auto_100043 ) ) ( not ( = ?auto_100039 ?auto_100043 ) ) ( not ( = ?auto_100042 ?auto_100049 ) ) ( not ( = ?auto_100052 ?auto_100046 ) ) ( not ( = ?auto_100052 ?auto_100047 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_100044 ?auto_100045 ?auto_100041 ?auto_100040 ?auto_100042 ?auto_100043 ?auto_100038 ?auto_100039 )
      ( GET-4IMAGE-VERIFY ?auto_100038 ?auto_100039 ?auto_100041 ?auto_100040 ?auto_100042 ?auto_100043 ?auto_100044 ?auto_100045 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_100246 - DIRECTION
      ?auto_100247 - MODE
      ?auto_100249 - DIRECTION
      ?auto_100248 - MODE
      ?auto_100250 - DIRECTION
      ?auto_100251 - MODE
      ?auto_100252 - DIRECTION
      ?auto_100253 - MODE
    )
    :vars
    (
      ?auto_100260 - INSTRUMENT
      ?auto_100258 - SATELLITE
      ?auto_100256 - DIRECTION
      ?auto_100259 - INSTRUMENT
      ?auto_100254 - INSTRUMENT
      ?auto_100255 - INSTRUMENT
      ?auto_100257 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_100249 ?auto_100246 ) ) ( not ( = ?auto_100250 ?auto_100246 ) ) ( not ( = ?auto_100250 ?auto_100249 ) ) ( not ( = ?auto_100252 ?auto_100246 ) ) ( not ( = ?auto_100252 ?auto_100249 ) ) ( not ( = ?auto_100252 ?auto_100250 ) ) ( ON_BOARD ?auto_100260 ?auto_100258 ) ( SUPPORTS ?auto_100260 ?auto_100248 ) ( not ( = ?auto_100249 ?auto_100256 ) ) ( CALIBRATION_TARGET ?auto_100260 ?auto_100256 ) ( not ( = ?auto_100256 ?auto_100246 ) ) ( ON_BOARD ?auto_100259 ?auto_100258 ) ( not ( = ?auto_100260 ?auto_100259 ) ) ( SUPPORTS ?auto_100259 ?auto_100247 ) ( CALIBRATION_TARGET ?auto_100259 ?auto_100256 ) ( not ( = ?auto_100256 ?auto_100252 ) ) ( ON_BOARD ?auto_100254 ?auto_100258 ) ( not ( = ?auto_100259 ?auto_100254 ) ) ( SUPPORTS ?auto_100254 ?auto_100253 ) ( CALIBRATION_TARGET ?auto_100254 ?auto_100256 ) ( not ( = ?auto_100256 ?auto_100250 ) ) ( ON_BOARD ?auto_100255 ?auto_100258 ) ( not ( = ?auto_100254 ?auto_100255 ) ) ( SUPPORTS ?auto_100255 ?auto_100251 ) ( CALIBRATION_TARGET ?auto_100255 ?auto_100256 ) ( POWER_AVAIL ?auto_100258 ) ( POINTING ?auto_100258 ?auto_100257 ) ( not ( = ?auto_100256 ?auto_100257 ) ) ( not ( = ?auto_100250 ?auto_100257 ) ) ( not ( = ?auto_100251 ?auto_100253 ) ) ( not ( = ?auto_100252 ?auto_100257 ) ) ( not ( = ?auto_100251 ?auto_100247 ) ) ( not ( = ?auto_100253 ?auto_100247 ) ) ( not ( = ?auto_100246 ?auto_100257 ) ) ( not ( = ?auto_100259 ?auto_100255 ) ) ( not ( = ?auto_100251 ?auto_100248 ) ) ( not ( = ?auto_100253 ?auto_100248 ) ) ( not ( = ?auto_100247 ?auto_100248 ) ) ( not ( = ?auto_100249 ?auto_100257 ) ) ( not ( = ?auto_100260 ?auto_100254 ) ) ( not ( = ?auto_100260 ?auto_100255 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_100250 ?auto_100251 ?auto_100252 ?auto_100253 ?auto_100249 ?auto_100248 ?auto_100246 ?auto_100247 )
      ( GET-4IMAGE-VERIFY ?auto_100246 ?auto_100247 ?auto_100249 ?auto_100248 ?auto_100250 ?auto_100251 ?auto_100252 ?auto_100253 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_100295 - DIRECTION
      ?auto_100296 - MODE
      ?auto_100298 - DIRECTION
      ?auto_100297 - MODE
      ?auto_100299 - DIRECTION
      ?auto_100300 - MODE
      ?auto_100301 - DIRECTION
      ?auto_100302 - MODE
    )
    :vars
    (
      ?auto_100309 - INSTRUMENT
      ?auto_100307 - SATELLITE
      ?auto_100305 - DIRECTION
      ?auto_100308 - INSTRUMENT
      ?auto_100303 - INSTRUMENT
      ?auto_100304 - INSTRUMENT
      ?auto_100306 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_100298 ?auto_100295 ) ) ( not ( = ?auto_100299 ?auto_100295 ) ) ( not ( = ?auto_100299 ?auto_100298 ) ) ( not ( = ?auto_100301 ?auto_100295 ) ) ( not ( = ?auto_100301 ?auto_100298 ) ) ( not ( = ?auto_100301 ?auto_100299 ) ) ( ON_BOARD ?auto_100309 ?auto_100307 ) ( SUPPORTS ?auto_100309 ?auto_100297 ) ( not ( = ?auto_100298 ?auto_100305 ) ) ( CALIBRATION_TARGET ?auto_100309 ?auto_100305 ) ( not ( = ?auto_100305 ?auto_100295 ) ) ( ON_BOARD ?auto_100308 ?auto_100307 ) ( not ( = ?auto_100309 ?auto_100308 ) ) ( SUPPORTS ?auto_100308 ?auto_100296 ) ( CALIBRATION_TARGET ?auto_100308 ?auto_100305 ) ( not ( = ?auto_100305 ?auto_100299 ) ) ( ON_BOARD ?auto_100303 ?auto_100307 ) ( not ( = ?auto_100308 ?auto_100303 ) ) ( SUPPORTS ?auto_100303 ?auto_100300 ) ( CALIBRATION_TARGET ?auto_100303 ?auto_100305 ) ( not ( = ?auto_100305 ?auto_100301 ) ) ( ON_BOARD ?auto_100304 ?auto_100307 ) ( not ( = ?auto_100303 ?auto_100304 ) ) ( SUPPORTS ?auto_100304 ?auto_100302 ) ( CALIBRATION_TARGET ?auto_100304 ?auto_100305 ) ( POWER_AVAIL ?auto_100307 ) ( POINTING ?auto_100307 ?auto_100306 ) ( not ( = ?auto_100305 ?auto_100306 ) ) ( not ( = ?auto_100301 ?auto_100306 ) ) ( not ( = ?auto_100302 ?auto_100300 ) ) ( not ( = ?auto_100299 ?auto_100306 ) ) ( not ( = ?auto_100302 ?auto_100296 ) ) ( not ( = ?auto_100300 ?auto_100296 ) ) ( not ( = ?auto_100295 ?auto_100306 ) ) ( not ( = ?auto_100308 ?auto_100304 ) ) ( not ( = ?auto_100302 ?auto_100297 ) ) ( not ( = ?auto_100300 ?auto_100297 ) ) ( not ( = ?auto_100296 ?auto_100297 ) ) ( not ( = ?auto_100298 ?auto_100306 ) ) ( not ( = ?auto_100309 ?auto_100303 ) ) ( not ( = ?auto_100309 ?auto_100304 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_100301 ?auto_100302 ?auto_100299 ?auto_100300 ?auto_100298 ?auto_100297 ?auto_100295 ?auto_100296 )
      ( GET-4IMAGE-VERIFY ?auto_100295 ?auto_100296 ?auto_100298 ?auto_100297 ?auto_100299 ?auto_100300 ?auto_100301 ?auto_100302 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_100611 - DIRECTION
      ?auto_100612 - MODE
      ?auto_100614 - DIRECTION
      ?auto_100613 - MODE
      ?auto_100615 - DIRECTION
      ?auto_100616 - MODE
      ?auto_100617 - DIRECTION
      ?auto_100618 - MODE
    )
    :vars
    (
      ?auto_100625 - INSTRUMENT
      ?auto_100623 - SATELLITE
      ?auto_100621 - DIRECTION
      ?auto_100624 - INSTRUMENT
      ?auto_100619 - INSTRUMENT
      ?auto_100620 - INSTRUMENT
      ?auto_100622 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_100614 ?auto_100611 ) ) ( not ( = ?auto_100615 ?auto_100611 ) ) ( not ( = ?auto_100615 ?auto_100614 ) ) ( not ( = ?auto_100617 ?auto_100611 ) ) ( not ( = ?auto_100617 ?auto_100614 ) ) ( not ( = ?auto_100617 ?auto_100615 ) ) ( ON_BOARD ?auto_100625 ?auto_100623 ) ( SUPPORTS ?auto_100625 ?auto_100612 ) ( not ( = ?auto_100611 ?auto_100621 ) ) ( CALIBRATION_TARGET ?auto_100625 ?auto_100621 ) ( not ( = ?auto_100621 ?auto_100617 ) ) ( ON_BOARD ?auto_100624 ?auto_100623 ) ( not ( = ?auto_100625 ?auto_100624 ) ) ( SUPPORTS ?auto_100624 ?auto_100618 ) ( CALIBRATION_TARGET ?auto_100624 ?auto_100621 ) ( not ( = ?auto_100621 ?auto_100615 ) ) ( ON_BOARD ?auto_100619 ?auto_100623 ) ( not ( = ?auto_100624 ?auto_100619 ) ) ( SUPPORTS ?auto_100619 ?auto_100616 ) ( CALIBRATION_TARGET ?auto_100619 ?auto_100621 ) ( not ( = ?auto_100621 ?auto_100614 ) ) ( ON_BOARD ?auto_100620 ?auto_100623 ) ( not ( = ?auto_100619 ?auto_100620 ) ) ( SUPPORTS ?auto_100620 ?auto_100613 ) ( CALIBRATION_TARGET ?auto_100620 ?auto_100621 ) ( POWER_AVAIL ?auto_100623 ) ( POINTING ?auto_100623 ?auto_100622 ) ( not ( = ?auto_100621 ?auto_100622 ) ) ( not ( = ?auto_100614 ?auto_100622 ) ) ( not ( = ?auto_100613 ?auto_100616 ) ) ( not ( = ?auto_100615 ?auto_100622 ) ) ( not ( = ?auto_100613 ?auto_100618 ) ) ( not ( = ?auto_100616 ?auto_100618 ) ) ( not ( = ?auto_100617 ?auto_100622 ) ) ( not ( = ?auto_100624 ?auto_100620 ) ) ( not ( = ?auto_100613 ?auto_100612 ) ) ( not ( = ?auto_100616 ?auto_100612 ) ) ( not ( = ?auto_100618 ?auto_100612 ) ) ( not ( = ?auto_100611 ?auto_100622 ) ) ( not ( = ?auto_100625 ?auto_100619 ) ) ( not ( = ?auto_100625 ?auto_100620 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_100614 ?auto_100613 ?auto_100615 ?auto_100616 ?auto_100611 ?auto_100612 ?auto_100617 ?auto_100618 )
      ( GET-4IMAGE-VERIFY ?auto_100611 ?auto_100612 ?auto_100614 ?auto_100613 ?auto_100615 ?auto_100616 ?auto_100617 ?auto_100618 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_100660 - DIRECTION
      ?auto_100661 - MODE
      ?auto_100663 - DIRECTION
      ?auto_100662 - MODE
      ?auto_100664 - DIRECTION
      ?auto_100665 - MODE
      ?auto_100666 - DIRECTION
      ?auto_100667 - MODE
    )
    :vars
    (
      ?auto_100674 - INSTRUMENT
      ?auto_100672 - SATELLITE
      ?auto_100670 - DIRECTION
      ?auto_100673 - INSTRUMENT
      ?auto_100668 - INSTRUMENT
      ?auto_100669 - INSTRUMENT
      ?auto_100671 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_100663 ?auto_100660 ) ) ( not ( = ?auto_100664 ?auto_100660 ) ) ( not ( = ?auto_100664 ?auto_100663 ) ) ( not ( = ?auto_100666 ?auto_100660 ) ) ( not ( = ?auto_100666 ?auto_100663 ) ) ( not ( = ?auto_100666 ?auto_100664 ) ) ( ON_BOARD ?auto_100674 ?auto_100672 ) ( SUPPORTS ?auto_100674 ?auto_100661 ) ( not ( = ?auto_100660 ?auto_100670 ) ) ( CALIBRATION_TARGET ?auto_100674 ?auto_100670 ) ( not ( = ?auto_100670 ?auto_100664 ) ) ( ON_BOARD ?auto_100673 ?auto_100672 ) ( not ( = ?auto_100674 ?auto_100673 ) ) ( SUPPORTS ?auto_100673 ?auto_100665 ) ( CALIBRATION_TARGET ?auto_100673 ?auto_100670 ) ( not ( = ?auto_100670 ?auto_100666 ) ) ( ON_BOARD ?auto_100668 ?auto_100672 ) ( not ( = ?auto_100673 ?auto_100668 ) ) ( SUPPORTS ?auto_100668 ?auto_100667 ) ( CALIBRATION_TARGET ?auto_100668 ?auto_100670 ) ( not ( = ?auto_100670 ?auto_100663 ) ) ( ON_BOARD ?auto_100669 ?auto_100672 ) ( not ( = ?auto_100668 ?auto_100669 ) ) ( SUPPORTS ?auto_100669 ?auto_100662 ) ( CALIBRATION_TARGET ?auto_100669 ?auto_100670 ) ( POWER_AVAIL ?auto_100672 ) ( POINTING ?auto_100672 ?auto_100671 ) ( not ( = ?auto_100670 ?auto_100671 ) ) ( not ( = ?auto_100663 ?auto_100671 ) ) ( not ( = ?auto_100662 ?auto_100667 ) ) ( not ( = ?auto_100666 ?auto_100671 ) ) ( not ( = ?auto_100662 ?auto_100665 ) ) ( not ( = ?auto_100667 ?auto_100665 ) ) ( not ( = ?auto_100664 ?auto_100671 ) ) ( not ( = ?auto_100673 ?auto_100669 ) ) ( not ( = ?auto_100662 ?auto_100661 ) ) ( not ( = ?auto_100667 ?auto_100661 ) ) ( not ( = ?auto_100665 ?auto_100661 ) ) ( not ( = ?auto_100660 ?auto_100671 ) ) ( not ( = ?auto_100674 ?auto_100668 ) ) ( not ( = ?auto_100674 ?auto_100669 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_100663 ?auto_100662 ?auto_100666 ?auto_100667 ?auto_100660 ?auto_100661 ?auto_100664 ?auto_100665 )
      ( GET-4IMAGE-VERIFY ?auto_100660 ?auto_100661 ?auto_100663 ?auto_100662 ?auto_100664 ?auto_100665 ?auto_100666 ?auto_100667 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_100815 - DIRECTION
      ?auto_100816 - MODE
      ?auto_100818 - DIRECTION
      ?auto_100817 - MODE
      ?auto_100819 - DIRECTION
      ?auto_100820 - MODE
      ?auto_100821 - DIRECTION
      ?auto_100822 - MODE
    )
    :vars
    (
      ?auto_100829 - INSTRUMENT
      ?auto_100827 - SATELLITE
      ?auto_100825 - DIRECTION
      ?auto_100828 - INSTRUMENT
      ?auto_100823 - INSTRUMENT
      ?auto_100824 - INSTRUMENT
      ?auto_100826 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_100818 ?auto_100815 ) ) ( not ( = ?auto_100819 ?auto_100815 ) ) ( not ( = ?auto_100819 ?auto_100818 ) ) ( not ( = ?auto_100821 ?auto_100815 ) ) ( not ( = ?auto_100821 ?auto_100818 ) ) ( not ( = ?auto_100821 ?auto_100819 ) ) ( ON_BOARD ?auto_100829 ?auto_100827 ) ( SUPPORTS ?auto_100829 ?auto_100816 ) ( not ( = ?auto_100815 ?auto_100825 ) ) ( CALIBRATION_TARGET ?auto_100829 ?auto_100825 ) ( not ( = ?auto_100825 ?auto_100821 ) ) ( ON_BOARD ?auto_100828 ?auto_100827 ) ( not ( = ?auto_100829 ?auto_100828 ) ) ( SUPPORTS ?auto_100828 ?auto_100822 ) ( CALIBRATION_TARGET ?auto_100828 ?auto_100825 ) ( not ( = ?auto_100825 ?auto_100818 ) ) ( ON_BOARD ?auto_100823 ?auto_100827 ) ( not ( = ?auto_100828 ?auto_100823 ) ) ( SUPPORTS ?auto_100823 ?auto_100817 ) ( CALIBRATION_TARGET ?auto_100823 ?auto_100825 ) ( not ( = ?auto_100825 ?auto_100819 ) ) ( ON_BOARD ?auto_100824 ?auto_100827 ) ( not ( = ?auto_100823 ?auto_100824 ) ) ( SUPPORTS ?auto_100824 ?auto_100820 ) ( CALIBRATION_TARGET ?auto_100824 ?auto_100825 ) ( POWER_AVAIL ?auto_100827 ) ( POINTING ?auto_100827 ?auto_100826 ) ( not ( = ?auto_100825 ?auto_100826 ) ) ( not ( = ?auto_100819 ?auto_100826 ) ) ( not ( = ?auto_100820 ?auto_100817 ) ) ( not ( = ?auto_100818 ?auto_100826 ) ) ( not ( = ?auto_100820 ?auto_100822 ) ) ( not ( = ?auto_100817 ?auto_100822 ) ) ( not ( = ?auto_100821 ?auto_100826 ) ) ( not ( = ?auto_100828 ?auto_100824 ) ) ( not ( = ?auto_100820 ?auto_100816 ) ) ( not ( = ?auto_100817 ?auto_100816 ) ) ( not ( = ?auto_100822 ?auto_100816 ) ) ( not ( = ?auto_100815 ?auto_100826 ) ) ( not ( = ?auto_100829 ?auto_100823 ) ) ( not ( = ?auto_100829 ?auto_100824 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_100819 ?auto_100820 ?auto_100818 ?auto_100817 ?auto_100815 ?auto_100816 ?auto_100821 ?auto_100822 )
      ( GET-4IMAGE-VERIFY ?auto_100815 ?auto_100816 ?auto_100818 ?auto_100817 ?auto_100819 ?auto_100820 ?auto_100821 ?auto_100822 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_100919 - DIRECTION
      ?auto_100920 - MODE
      ?auto_100922 - DIRECTION
      ?auto_100921 - MODE
      ?auto_100923 - DIRECTION
      ?auto_100924 - MODE
      ?auto_100925 - DIRECTION
      ?auto_100926 - MODE
    )
    :vars
    (
      ?auto_100933 - INSTRUMENT
      ?auto_100931 - SATELLITE
      ?auto_100929 - DIRECTION
      ?auto_100932 - INSTRUMENT
      ?auto_100927 - INSTRUMENT
      ?auto_100928 - INSTRUMENT
      ?auto_100930 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_100922 ?auto_100919 ) ) ( not ( = ?auto_100923 ?auto_100919 ) ) ( not ( = ?auto_100923 ?auto_100922 ) ) ( not ( = ?auto_100925 ?auto_100919 ) ) ( not ( = ?auto_100925 ?auto_100922 ) ) ( not ( = ?auto_100925 ?auto_100923 ) ) ( ON_BOARD ?auto_100933 ?auto_100931 ) ( SUPPORTS ?auto_100933 ?auto_100920 ) ( not ( = ?auto_100919 ?auto_100929 ) ) ( CALIBRATION_TARGET ?auto_100933 ?auto_100929 ) ( not ( = ?auto_100929 ?auto_100923 ) ) ( ON_BOARD ?auto_100932 ?auto_100931 ) ( not ( = ?auto_100933 ?auto_100932 ) ) ( SUPPORTS ?auto_100932 ?auto_100924 ) ( CALIBRATION_TARGET ?auto_100932 ?auto_100929 ) ( not ( = ?auto_100929 ?auto_100922 ) ) ( ON_BOARD ?auto_100927 ?auto_100931 ) ( not ( = ?auto_100932 ?auto_100927 ) ) ( SUPPORTS ?auto_100927 ?auto_100921 ) ( CALIBRATION_TARGET ?auto_100927 ?auto_100929 ) ( not ( = ?auto_100929 ?auto_100925 ) ) ( ON_BOARD ?auto_100928 ?auto_100931 ) ( not ( = ?auto_100927 ?auto_100928 ) ) ( SUPPORTS ?auto_100928 ?auto_100926 ) ( CALIBRATION_TARGET ?auto_100928 ?auto_100929 ) ( POWER_AVAIL ?auto_100931 ) ( POINTING ?auto_100931 ?auto_100930 ) ( not ( = ?auto_100929 ?auto_100930 ) ) ( not ( = ?auto_100925 ?auto_100930 ) ) ( not ( = ?auto_100926 ?auto_100921 ) ) ( not ( = ?auto_100922 ?auto_100930 ) ) ( not ( = ?auto_100926 ?auto_100924 ) ) ( not ( = ?auto_100921 ?auto_100924 ) ) ( not ( = ?auto_100923 ?auto_100930 ) ) ( not ( = ?auto_100932 ?auto_100928 ) ) ( not ( = ?auto_100926 ?auto_100920 ) ) ( not ( = ?auto_100921 ?auto_100920 ) ) ( not ( = ?auto_100924 ?auto_100920 ) ) ( not ( = ?auto_100919 ?auto_100930 ) ) ( not ( = ?auto_100933 ?auto_100927 ) ) ( not ( = ?auto_100933 ?auto_100928 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_100925 ?auto_100926 ?auto_100922 ?auto_100921 ?auto_100919 ?auto_100920 ?auto_100923 ?auto_100924 )
      ( GET-4IMAGE-VERIFY ?auto_100919 ?auto_100920 ?auto_100922 ?auto_100921 ?auto_100923 ?auto_100924 ?auto_100925 ?auto_100926 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_101074 - DIRECTION
      ?auto_101075 - MODE
      ?auto_101077 - DIRECTION
      ?auto_101076 - MODE
      ?auto_101078 - DIRECTION
      ?auto_101079 - MODE
      ?auto_101080 - DIRECTION
      ?auto_101081 - MODE
    )
    :vars
    (
      ?auto_101088 - INSTRUMENT
      ?auto_101086 - SATELLITE
      ?auto_101084 - DIRECTION
      ?auto_101087 - INSTRUMENT
      ?auto_101082 - INSTRUMENT
      ?auto_101083 - INSTRUMENT
      ?auto_101085 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_101077 ?auto_101074 ) ) ( not ( = ?auto_101078 ?auto_101074 ) ) ( not ( = ?auto_101078 ?auto_101077 ) ) ( not ( = ?auto_101080 ?auto_101074 ) ) ( not ( = ?auto_101080 ?auto_101077 ) ) ( not ( = ?auto_101080 ?auto_101078 ) ) ( ON_BOARD ?auto_101088 ?auto_101086 ) ( SUPPORTS ?auto_101088 ?auto_101075 ) ( not ( = ?auto_101074 ?auto_101084 ) ) ( CALIBRATION_TARGET ?auto_101088 ?auto_101084 ) ( not ( = ?auto_101084 ?auto_101077 ) ) ( ON_BOARD ?auto_101087 ?auto_101086 ) ( not ( = ?auto_101088 ?auto_101087 ) ) ( SUPPORTS ?auto_101087 ?auto_101076 ) ( CALIBRATION_TARGET ?auto_101087 ?auto_101084 ) ( not ( = ?auto_101084 ?auto_101080 ) ) ( ON_BOARD ?auto_101082 ?auto_101086 ) ( not ( = ?auto_101087 ?auto_101082 ) ) ( SUPPORTS ?auto_101082 ?auto_101081 ) ( CALIBRATION_TARGET ?auto_101082 ?auto_101084 ) ( not ( = ?auto_101084 ?auto_101078 ) ) ( ON_BOARD ?auto_101083 ?auto_101086 ) ( not ( = ?auto_101082 ?auto_101083 ) ) ( SUPPORTS ?auto_101083 ?auto_101079 ) ( CALIBRATION_TARGET ?auto_101083 ?auto_101084 ) ( POWER_AVAIL ?auto_101086 ) ( POINTING ?auto_101086 ?auto_101085 ) ( not ( = ?auto_101084 ?auto_101085 ) ) ( not ( = ?auto_101078 ?auto_101085 ) ) ( not ( = ?auto_101079 ?auto_101081 ) ) ( not ( = ?auto_101080 ?auto_101085 ) ) ( not ( = ?auto_101079 ?auto_101076 ) ) ( not ( = ?auto_101081 ?auto_101076 ) ) ( not ( = ?auto_101077 ?auto_101085 ) ) ( not ( = ?auto_101087 ?auto_101083 ) ) ( not ( = ?auto_101079 ?auto_101075 ) ) ( not ( = ?auto_101081 ?auto_101075 ) ) ( not ( = ?auto_101076 ?auto_101075 ) ) ( not ( = ?auto_101074 ?auto_101085 ) ) ( not ( = ?auto_101088 ?auto_101082 ) ) ( not ( = ?auto_101088 ?auto_101083 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_101078 ?auto_101079 ?auto_101080 ?auto_101081 ?auto_101074 ?auto_101075 ?auto_101077 ?auto_101076 )
      ( GET-4IMAGE-VERIFY ?auto_101074 ?auto_101075 ?auto_101077 ?auto_101076 ?auto_101078 ?auto_101079 ?auto_101080 ?auto_101081 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_101123 - DIRECTION
      ?auto_101124 - MODE
      ?auto_101126 - DIRECTION
      ?auto_101125 - MODE
      ?auto_101127 - DIRECTION
      ?auto_101128 - MODE
      ?auto_101129 - DIRECTION
      ?auto_101130 - MODE
    )
    :vars
    (
      ?auto_101137 - INSTRUMENT
      ?auto_101135 - SATELLITE
      ?auto_101133 - DIRECTION
      ?auto_101136 - INSTRUMENT
      ?auto_101131 - INSTRUMENT
      ?auto_101132 - INSTRUMENT
      ?auto_101134 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_101126 ?auto_101123 ) ) ( not ( = ?auto_101127 ?auto_101123 ) ) ( not ( = ?auto_101127 ?auto_101126 ) ) ( not ( = ?auto_101129 ?auto_101123 ) ) ( not ( = ?auto_101129 ?auto_101126 ) ) ( not ( = ?auto_101129 ?auto_101127 ) ) ( ON_BOARD ?auto_101137 ?auto_101135 ) ( SUPPORTS ?auto_101137 ?auto_101124 ) ( not ( = ?auto_101123 ?auto_101133 ) ) ( CALIBRATION_TARGET ?auto_101137 ?auto_101133 ) ( not ( = ?auto_101133 ?auto_101126 ) ) ( ON_BOARD ?auto_101136 ?auto_101135 ) ( not ( = ?auto_101137 ?auto_101136 ) ) ( SUPPORTS ?auto_101136 ?auto_101125 ) ( CALIBRATION_TARGET ?auto_101136 ?auto_101133 ) ( not ( = ?auto_101133 ?auto_101127 ) ) ( ON_BOARD ?auto_101131 ?auto_101135 ) ( not ( = ?auto_101136 ?auto_101131 ) ) ( SUPPORTS ?auto_101131 ?auto_101128 ) ( CALIBRATION_TARGET ?auto_101131 ?auto_101133 ) ( not ( = ?auto_101133 ?auto_101129 ) ) ( ON_BOARD ?auto_101132 ?auto_101135 ) ( not ( = ?auto_101131 ?auto_101132 ) ) ( SUPPORTS ?auto_101132 ?auto_101130 ) ( CALIBRATION_TARGET ?auto_101132 ?auto_101133 ) ( POWER_AVAIL ?auto_101135 ) ( POINTING ?auto_101135 ?auto_101134 ) ( not ( = ?auto_101133 ?auto_101134 ) ) ( not ( = ?auto_101129 ?auto_101134 ) ) ( not ( = ?auto_101130 ?auto_101128 ) ) ( not ( = ?auto_101127 ?auto_101134 ) ) ( not ( = ?auto_101130 ?auto_101125 ) ) ( not ( = ?auto_101128 ?auto_101125 ) ) ( not ( = ?auto_101126 ?auto_101134 ) ) ( not ( = ?auto_101136 ?auto_101132 ) ) ( not ( = ?auto_101130 ?auto_101124 ) ) ( not ( = ?auto_101128 ?auto_101124 ) ) ( not ( = ?auto_101125 ?auto_101124 ) ) ( not ( = ?auto_101123 ?auto_101134 ) ) ( not ( = ?auto_101137 ?auto_101131 ) ) ( not ( = ?auto_101137 ?auto_101132 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_101129 ?auto_101130 ?auto_101127 ?auto_101128 ?auto_101123 ?auto_101124 ?auto_101126 ?auto_101125 )
      ( GET-4IMAGE-VERIFY ?auto_101123 ?auto_101124 ?auto_101126 ?auto_101125 ?auto_101127 ?auto_101128 ?auto_101129 ?auto_101130 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_101629 - DIRECTION
      ?auto_101630 - MODE
    )
    :vars
    (
      ?auto_101631 - INSTRUMENT
      ?auto_101632 - SATELLITE
      ?auto_101633 - DIRECTION
      ?auto_101634 - DIRECTION
      ?auto_101635 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_101631 ?auto_101632 ) ( SUPPORTS ?auto_101631 ?auto_101630 ) ( not ( = ?auto_101629 ?auto_101633 ) ) ( CALIBRATION_TARGET ?auto_101631 ?auto_101633 ) ( POINTING ?auto_101632 ?auto_101634 ) ( not ( = ?auto_101633 ?auto_101634 ) ) ( ON_BOARD ?auto_101635 ?auto_101632 ) ( POWER_ON ?auto_101635 ) ( not ( = ?auto_101629 ?auto_101634 ) ) ( not ( = ?auto_101631 ?auto_101635 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_101635 ?auto_101632 )
      ( !TURN_TO ?auto_101632 ?auto_101633 ?auto_101634 )
      ( !SWITCH_ON ?auto_101631 ?auto_101632 )
      ( !CALIBRATE ?auto_101632 ?auto_101631 ?auto_101633 )
      ( !TURN_TO ?auto_101632 ?auto_101629 ?auto_101633 )
      ( !TAKE_IMAGE ?auto_101632 ?auto_101629 ?auto_101631 ?auto_101630 )
      ( GET-1IMAGE-VERIFY ?auto_101629 ?auto_101630 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_124406 - DIRECTION
      ?auto_124407 - MODE
      ?auto_124409 - DIRECTION
      ?auto_124408 - MODE
      ?auto_124410 - DIRECTION
      ?auto_124411 - MODE
      ?auto_124412 - DIRECTION
      ?auto_124413 - MODE
      ?auto_124414 - DIRECTION
      ?auto_124415 - MODE
    )
    :vars
    (
      ?auto_124417 - INSTRUMENT
      ?auto_124418 - SATELLITE
      ?auto_124416 - DIRECTION
      ?auto_124419 - INSTRUMENT
      ?auto_124423 - INSTRUMENT
      ?auto_124420 - INSTRUMENT
      ?auto_124421 - INSTRUMENT
      ?auto_124422 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_124409 ?auto_124406 ) ) ( not ( = ?auto_124410 ?auto_124406 ) ) ( not ( = ?auto_124410 ?auto_124409 ) ) ( not ( = ?auto_124412 ?auto_124406 ) ) ( not ( = ?auto_124412 ?auto_124409 ) ) ( not ( = ?auto_124412 ?auto_124410 ) ) ( not ( = ?auto_124414 ?auto_124406 ) ) ( not ( = ?auto_124414 ?auto_124409 ) ) ( not ( = ?auto_124414 ?auto_124410 ) ) ( not ( = ?auto_124414 ?auto_124412 ) ) ( ON_BOARD ?auto_124417 ?auto_124418 ) ( SUPPORTS ?auto_124417 ?auto_124415 ) ( not ( = ?auto_124414 ?auto_124416 ) ) ( CALIBRATION_TARGET ?auto_124417 ?auto_124416 ) ( not ( = ?auto_124416 ?auto_124412 ) ) ( ON_BOARD ?auto_124419 ?auto_124418 ) ( not ( = ?auto_124417 ?auto_124419 ) ) ( SUPPORTS ?auto_124419 ?auto_124413 ) ( CALIBRATION_TARGET ?auto_124419 ?auto_124416 ) ( not ( = ?auto_124416 ?auto_124410 ) ) ( ON_BOARD ?auto_124423 ?auto_124418 ) ( not ( = ?auto_124419 ?auto_124423 ) ) ( SUPPORTS ?auto_124423 ?auto_124411 ) ( CALIBRATION_TARGET ?auto_124423 ?auto_124416 ) ( not ( = ?auto_124416 ?auto_124409 ) ) ( ON_BOARD ?auto_124420 ?auto_124418 ) ( not ( = ?auto_124423 ?auto_124420 ) ) ( SUPPORTS ?auto_124420 ?auto_124408 ) ( CALIBRATION_TARGET ?auto_124420 ?auto_124416 ) ( not ( = ?auto_124416 ?auto_124406 ) ) ( ON_BOARD ?auto_124421 ?auto_124418 ) ( not ( = ?auto_124420 ?auto_124421 ) ) ( SUPPORTS ?auto_124421 ?auto_124407 ) ( CALIBRATION_TARGET ?auto_124421 ?auto_124416 ) ( POWER_AVAIL ?auto_124418 ) ( POINTING ?auto_124418 ?auto_124422 ) ( not ( = ?auto_124416 ?auto_124422 ) ) ( not ( = ?auto_124406 ?auto_124422 ) ) ( not ( = ?auto_124407 ?auto_124408 ) ) ( not ( = ?auto_124409 ?auto_124422 ) ) ( not ( = ?auto_124407 ?auto_124411 ) ) ( not ( = ?auto_124408 ?auto_124411 ) ) ( not ( = ?auto_124410 ?auto_124422 ) ) ( not ( = ?auto_124423 ?auto_124421 ) ) ( not ( = ?auto_124407 ?auto_124413 ) ) ( not ( = ?auto_124408 ?auto_124413 ) ) ( not ( = ?auto_124411 ?auto_124413 ) ) ( not ( = ?auto_124412 ?auto_124422 ) ) ( not ( = ?auto_124419 ?auto_124420 ) ) ( not ( = ?auto_124419 ?auto_124421 ) ) ( not ( = ?auto_124407 ?auto_124415 ) ) ( not ( = ?auto_124408 ?auto_124415 ) ) ( not ( = ?auto_124411 ?auto_124415 ) ) ( not ( = ?auto_124413 ?auto_124415 ) ) ( not ( = ?auto_124414 ?auto_124422 ) ) ( not ( = ?auto_124417 ?auto_124423 ) ) ( not ( = ?auto_124417 ?auto_124420 ) ) ( not ( = ?auto_124417 ?auto_124421 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_124406 ?auto_124407 ?auto_124409 ?auto_124408 ?auto_124412 ?auto_124413 ?auto_124410 ?auto_124411 )
      ( GET-1IMAGE ?auto_124414 ?auto_124415 )
      ( GET-5IMAGE-VERIFY ?auto_124406 ?auto_124407 ?auto_124409 ?auto_124408 ?auto_124410 ?auto_124411 ?auto_124412 ?auto_124413 ?auto_124414 ?auto_124415 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_124484 - DIRECTION
      ?auto_124485 - MODE
      ?auto_124487 - DIRECTION
      ?auto_124486 - MODE
      ?auto_124488 - DIRECTION
      ?auto_124489 - MODE
      ?auto_124490 - DIRECTION
      ?auto_124491 - MODE
      ?auto_124492 - DIRECTION
      ?auto_124493 - MODE
    )
    :vars
    (
      ?auto_124494 - INSTRUMENT
      ?auto_124497 - SATELLITE
      ?auto_124500 - DIRECTION
      ?auto_124496 - INSTRUMENT
      ?auto_124501 - INSTRUMENT
      ?auto_124499 - INSTRUMENT
      ?auto_124495 - INSTRUMENT
      ?auto_124498 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_124487 ?auto_124484 ) ) ( not ( = ?auto_124488 ?auto_124484 ) ) ( not ( = ?auto_124488 ?auto_124487 ) ) ( not ( = ?auto_124490 ?auto_124484 ) ) ( not ( = ?auto_124490 ?auto_124487 ) ) ( not ( = ?auto_124490 ?auto_124488 ) ) ( not ( = ?auto_124492 ?auto_124484 ) ) ( not ( = ?auto_124492 ?auto_124487 ) ) ( not ( = ?auto_124492 ?auto_124488 ) ) ( not ( = ?auto_124492 ?auto_124490 ) ) ( ON_BOARD ?auto_124494 ?auto_124497 ) ( SUPPORTS ?auto_124494 ?auto_124491 ) ( not ( = ?auto_124490 ?auto_124500 ) ) ( CALIBRATION_TARGET ?auto_124494 ?auto_124500 ) ( not ( = ?auto_124500 ?auto_124492 ) ) ( ON_BOARD ?auto_124496 ?auto_124497 ) ( not ( = ?auto_124494 ?auto_124496 ) ) ( SUPPORTS ?auto_124496 ?auto_124493 ) ( CALIBRATION_TARGET ?auto_124496 ?auto_124500 ) ( not ( = ?auto_124500 ?auto_124488 ) ) ( ON_BOARD ?auto_124501 ?auto_124497 ) ( not ( = ?auto_124496 ?auto_124501 ) ) ( SUPPORTS ?auto_124501 ?auto_124489 ) ( CALIBRATION_TARGET ?auto_124501 ?auto_124500 ) ( not ( = ?auto_124500 ?auto_124487 ) ) ( ON_BOARD ?auto_124499 ?auto_124497 ) ( not ( = ?auto_124501 ?auto_124499 ) ) ( SUPPORTS ?auto_124499 ?auto_124486 ) ( CALIBRATION_TARGET ?auto_124499 ?auto_124500 ) ( not ( = ?auto_124500 ?auto_124484 ) ) ( ON_BOARD ?auto_124495 ?auto_124497 ) ( not ( = ?auto_124499 ?auto_124495 ) ) ( SUPPORTS ?auto_124495 ?auto_124485 ) ( CALIBRATION_TARGET ?auto_124495 ?auto_124500 ) ( POWER_AVAIL ?auto_124497 ) ( POINTING ?auto_124497 ?auto_124498 ) ( not ( = ?auto_124500 ?auto_124498 ) ) ( not ( = ?auto_124484 ?auto_124498 ) ) ( not ( = ?auto_124485 ?auto_124486 ) ) ( not ( = ?auto_124487 ?auto_124498 ) ) ( not ( = ?auto_124485 ?auto_124489 ) ) ( not ( = ?auto_124486 ?auto_124489 ) ) ( not ( = ?auto_124488 ?auto_124498 ) ) ( not ( = ?auto_124501 ?auto_124495 ) ) ( not ( = ?auto_124485 ?auto_124493 ) ) ( not ( = ?auto_124486 ?auto_124493 ) ) ( not ( = ?auto_124489 ?auto_124493 ) ) ( not ( = ?auto_124492 ?auto_124498 ) ) ( not ( = ?auto_124496 ?auto_124499 ) ) ( not ( = ?auto_124496 ?auto_124495 ) ) ( not ( = ?auto_124485 ?auto_124491 ) ) ( not ( = ?auto_124486 ?auto_124491 ) ) ( not ( = ?auto_124489 ?auto_124491 ) ) ( not ( = ?auto_124493 ?auto_124491 ) ) ( not ( = ?auto_124490 ?auto_124498 ) ) ( not ( = ?auto_124494 ?auto_124501 ) ) ( not ( = ?auto_124494 ?auto_124499 ) ) ( not ( = ?auto_124494 ?auto_124495 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_124484 ?auto_124485 ?auto_124487 ?auto_124486 ?auto_124488 ?auto_124489 ?auto_124492 ?auto_124493 ?auto_124490 ?auto_124491 )
      ( GET-5IMAGE-VERIFY ?auto_124484 ?auto_124485 ?auto_124487 ?auto_124486 ?auto_124488 ?auto_124489 ?auto_124490 ?auto_124491 ?auto_124492 ?auto_124493 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_124562 - DIRECTION
      ?auto_124563 - MODE
      ?auto_124565 - DIRECTION
      ?auto_124564 - MODE
      ?auto_124566 - DIRECTION
      ?auto_124567 - MODE
      ?auto_124568 - DIRECTION
      ?auto_124569 - MODE
      ?auto_124570 - DIRECTION
      ?auto_124571 - MODE
    )
    :vars
    (
      ?auto_124579 - INSTRUMENT
      ?auto_124572 - SATELLITE
      ?auto_124577 - DIRECTION
      ?auto_124573 - INSTRUMENT
      ?auto_124578 - INSTRUMENT
      ?auto_124574 - INSTRUMENT
      ?auto_124576 - INSTRUMENT
      ?auto_124575 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_124565 ?auto_124562 ) ) ( not ( = ?auto_124566 ?auto_124562 ) ) ( not ( = ?auto_124566 ?auto_124565 ) ) ( not ( = ?auto_124568 ?auto_124562 ) ) ( not ( = ?auto_124568 ?auto_124565 ) ) ( not ( = ?auto_124568 ?auto_124566 ) ) ( not ( = ?auto_124570 ?auto_124562 ) ) ( not ( = ?auto_124570 ?auto_124565 ) ) ( not ( = ?auto_124570 ?auto_124566 ) ) ( not ( = ?auto_124570 ?auto_124568 ) ) ( ON_BOARD ?auto_124579 ?auto_124572 ) ( SUPPORTS ?auto_124579 ?auto_124571 ) ( not ( = ?auto_124570 ?auto_124577 ) ) ( CALIBRATION_TARGET ?auto_124579 ?auto_124577 ) ( not ( = ?auto_124577 ?auto_124566 ) ) ( ON_BOARD ?auto_124573 ?auto_124572 ) ( not ( = ?auto_124579 ?auto_124573 ) ) ( SUPPORTS ?auto_124573 ?auto_124567 ) ( CALIBRATION_TARGET ?auto_124573 ?auto_124577 ) ( not ( = ?auto_124577 ?auto_124568 ) ) ( ON_BOARD ?auto_124578 ?auto_124572 ) ( not ( = ?auto_124573 ?auto_124578 ) ) ( SUPPORTS ?auto_124578 ?auto_124569 ) ( CALIBRATION_TARGET ?auto_124578 ?auto_124577 ) ( not ( = ?auto_124577 ?auto_124565 ) ) ( ON_BOARD ?auto_124574 ?auto_124572 ) ( not ( = ?auto_124578 ?auto_124574 ) ) ( SUPPORTS ?auto_124574 ?auto_124564 ) ( CALIBRATION_TARGET ?auto_124574 ?auto_124577 ) ( not ( = ?auto_124577 ?auto_124562 ) ) ( ON_BOARD ?auto_124576 ?auto_124572 ) ( not ( = ?auto_124574 ?auto_124576 ) ) ( SUPPORTS ?auto_124576 ?auto_124563 ) ( CALIBRATION_TARGET ?auto_124576 ?auto_124577 ) ( POWER_AVAIL ?auto_124572 ) ( POINTING ?auto_124572 ?auto_124575 ) ( not ( = ?auto_124577 ?auto_124575 ) ) ( not ( = ?auto_124562 ?auto_124575 ) ) ( not ( = ?auto_124563 ?auto_124564 ) ) ( not ( = ?auto_124565 ?auto_124575 ) ) ( not ( = ?auto_124563 ?auto_124569 ) ) ( not ( = ?auto_124564 ?auto_124569 ) ) ( not ( = ?auto_124568 ?auto_124575 ) ) ( not ( = ?auto_124578 ?auto_124576 ) ) ( not ( = ?auto_124563 ?auto_124567 ) ) ( not ( = ?auto_124564 ?auto_124567 ) ) ( not ( = ?auto_124569 ?auto_124567 ) ) ( not ( = ?auto_124566 ?auto_124575 ) ) ( not ( = ?auto_124573 ?auto_124574 ) ) ( not ( = ?auto_124573 ?auto_124576 ) ) ( not ( = ?auto_124563 ?auto_124571 ) ) ( not ( = ?auto_124564 ?auto_124571 ) ) ( not ( = ?auto_124569 ?auto_124571 ) ) ( not ( = ?auto_124567 ?auto_124571 ) ) ( not ( = ?auto_124570 ?auto_124575 ) ) ( not ( = ?auto_124579 ?auto_124578 ) ) ( not ( = ?auto_124579 ?auto_124574 ) ) ( not ( = ?auto_124579 ?auto_124576 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_124562 ?auto_124563 ?auto_124565 ?auto_124564 ?auto_124568 ?auto_124569 ?auto_124570 ?auto_124571 ?auto_124566 ?auto_124567 )
      ( GET-5IMAGE-VERIFY ?auto_124562 ?auto_124563 ?auto_124565 ?auto_124564 ?auto_124566 ?auto_124567 ?auto_124568 ?auto_124569 ?auto_124570 ?auto_124571 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_124640 - DIRECTION
      ?auto_124641 - MODE
      ?auto_124643 - DIRECTION
      ?auto_124642 - MODE
      ?auto_124644 - DIRECTION
      ?auto_124645 - MODE
      ?auto_124646 - DIRECTION
      ?auto_124647 - MODE
      ?auto_124648 - DIRECTION
      ?auto_124649 - MODE
    )
    :vars
    (
      ?auto_124657 - INSTRUMENT
      ?auto_124650 - SATELLITE
      ?auto_124655 - DIRECTION
      ?auto_124651 - INSTRUMENT
      ?auto_124656 - INSTRUMENT
      ?auto_124652 - INSTRUMENT
      ?auto_124654 - INSTRUMENT
      ?auto_124653 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_124643 ?auto_124640 ) ) ( not ( = ?auto_124644 ?auto_124640 ) ) ( not ( = ?auto_124644 ?auto_124643 ) ) ( not ( = ?auto_124646 ?auto_124640 ) ) ( not ( = ?auto_124646 ?auto_124643 ) ) ( not ( = ?auto_124646 ?auto_124644 ) ) ( not ( = ?auto_124648 ?auto_124640 ) ) ( not ( = ?auto_124648 ?auto_124643 ) ) ( not ( = ?auto_124648 ?auto_124644 ) ) ( not ( = ?auto_124648 ?auto_124646 ) ) ( ON_BOARD ?auto_124657 ?auto_124650 ) ( SUPPORTS ?auto_124657 ?auto_124647 ) ( not ( = ?auto_124646 ?auto_124655 ) ) ( CALIBRATION_TARGET ?auto_124657 ?auto_124655 ) ( not ( = ?auto_124655 ?auto_124644 ) ) ( ON_BOARD ?auto_124651 ?auto_124650 ) ( not ( = ?auto_124657 ?auto_124651 ) ) ( SUPPORTS ?auto_124651 ?auto_124645 ) ( CALIBRATION_TARGET ?auto_124651 ?auto_124655 ) ( not ( = ?auto_124655 ?auto_124648 ) ) ( ON_BOARD ?auto_124656 ?auto_124650 ) ( not ( = ?auto_124651 ?auto_124656 ) ) ( SUPPORTS ?auto_124656 ?auto_124649 ) ( CALIBRATION_TARGET ?auto_124656 ?auto_124655 ) ( not ( = ?auto_124655 ?auto_124643 ) ) ( ON_BOARD ?auto_124652 ?auto_124650 ) ( not ( = ?auto_124656 ?auto_124652 ) ) ( SUPPORTS ?auto_124652 ?auto_124642 ) ( CALIBRATION_TARGET ?auto_124652 ?auto_124655 ) ( not ( = ?auto_124655 ?auto_124640 ) ) ( ON_BOARD ?auto_124654 ?auto_124650 ) ( not ( = ?auto_124652 ?auto_124654 ) ) ( SUPPORTS ?auto_124654 ?auto_124641 ) ( CALIBRATION_TARGET ?auto_124654 ?auto_124655 ) ( POWER_AVAIL ?auto_124650 ) ( POINTING ?auto_124650 ?auto_124653 ) ( not ( = ?auto_124655 ?auto_124653 ) ) ( not ( = ?auto_124640 ?auto_124653 ) ) ( not ( = ?auto_124641 ?auto_124642 ) ) ( not ( = ?auto_124643 ?auto_124653 ) ) ( not ( = ?auto_124641 ?auto_124649 ) ) ( not ( = ?auto_124642 ?auto_124649 ) ) ( not ( = ?auto_124648 ?auto_124653 ) ) ( not ( = ?auto_124656 ?auto_124654 ) ) ( not ( = ?auto_124641 ?auto_124645 ) ) ( not ( = ?auto_124642 ?auto_124645 ) ) ( not ( = ?auto_124649 ?auto_124645 ) ) ( not ( = ?auto_124644 ?auto_124653 ) ) ( not ( = ?auto_124651 ?auto_124652 ) ) ( not ( = ?auto_124651 ?auto_124654 ) ) ( not ( = ?auto_124641 ?auto_124647 ) ) ( not ( = ?auto_124642 ?auto_124647 ) ) ( not ( = ?auto_124649 ?auto_124647 ) ) ( not ( = ?auto_124645 ?auto_124647 ) ) ( not ( = ?auto_124646 ?auto_124653 ) ) ( not ( = ?auto_124657 ?auto_124656 ) ) ( not ( = ?auto_124657 ?auto_124652 ) ) ( not ( = ?auto_124657 ?auto_124654 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_124640 ?auto_124641 ?auto_124643 ?auto_124642 ?auto_124648 ?auto_124649 ?auto_124646 ?auto_124647 ?auto_124644 ?auto_124645 )
      ( GET-5IMAGE-VERIFY ?auto_124640 ?auto_124641 ?auto_124643 ?auto_124642 ?auto_124644 ?auto_124645 ?auto_124646 ?auto_124647 ?auto_124648 ?auto_124649 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_124970 - DIRECTION
      ?auto_124971 - MODE
      ?auto_124973 - DIRECTION
      ?auto_124972 - MODE
      ?auto_124974 - DIRECTION
      ?auto_124975 - MODE
      ?auto_124976 - DIRECTION
      ?auto_124977 - MODE
      ?auto_124978 - DIRECTION
      ?auto_124979 - MODE
    )
    :vars
    (
      ?auto_124987 - INSTRUMENT
      ?auto_124980 - SATELLITE
      ?auto_124985 - DIRECTION
      ?auto_124981 - INSTRUMENT
      ?auto_124986 - INSTRUMENT
      ?auto_124982 - INSTRUMENT
      ?auto_124984 - INSTRUMENT
      ?auto_124983 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_124973 ?auto_124970 ) ) ( not ( = ?auto_124974 ?auto_124970 ) ) ( not ( = ?auto_124974 ?auto_124973 ) ) ( not ( = ?auto_124976 ?auto_124970 ) ) ( not ( = ?auto_124976 ?auto_124973 ) ) ( not ( = ?auto_124976 ?auto_124974 ) ) ( not ( = ?auto_124978 ?auto_124970 ) ) ( not ( = ?auto_124978 ?auto_124973 ) ) ( not ( = ?auto_124978 ?auto_124974 ) ) ( not ( = ?auto_124978 ?auto_124976 ) ) ( ON_BOARD ?auto_124987 ?auto_124980 ) ( SUPPORTS ?auto_124987 ?auto_124975 ) ( not ( = ?auto_124974 ?auto_124985 ) ) ( CALIBRATION_TARGET ?auto_124987 ?auto_124985 ) ( not ( = ?auto_124985 ?auto_124978 ) ) ( ON_BOARD ?auto_124981 ?auto_124980 ) ( not ( = ?auto_124987 ?auto_124981 ) ) ( SUPPORTS ?auto_124981 ?auto_124979 ) ( CALIBRATION_TARGET ?auto_124981 ?auto_124985 ) ( not ( = ?auto_124985 ?auto_124976 ) ) ( ON_BOARD ?auto_124986 ?auto_124980 ) ( not ( = ?auto_124981 ?auto_124986 ) ) ( SUPPORTS ?auto_124986 ?auto_124977 ) ( CALIBRATION_TARGET ?auto_124986 ?auto_124985 ) ( not ( = ?auto_124985 ?auto_124973 ) ) ( ON_BOARD ?auto_124982 ?auto_124980 ) ( not ( = ?auto_124986 ?auto_124982 ) ) ( SUPPORTS ?auto_124982 ?auto_124972 ) ( CALIBRATION_TARGET ?auto_124982 ?auto_124985 ) ( not ( = ?auto_124985 ?auto_124970 ) ) ( ON_BOARD ?auto_124984 ?auto_124980 ) ( not ( = ?auto_124982 ?auto_124984 ) ) ( SUPPORTS ?auto_124984 ?auto_124971 ) ( CALIBRATION_TARGET ?auto_124984 ?auto_124985 ) ( POWER_AVAIL ?auto_124980 ) ( POINTING ?auto_124980 ?auto_124983 ) ( not ( = ?auto_124985 ?auto_124983 ) ) ( not ( = ?auto_124970 ?auto_124983 ) ) ( not ( = ?auto_124971 ?auto_124972 ) ) ( not ( = ?auto_124973 ?auto_124983 ) ) ( not ( = ?auto_124971 ?auto_124977 ) ) ( not ( = ?auto_124972 ?auto_124977 ) ) ( not ( = ?auto_124976 ?auto_124983 ) ) ( not ( = ?auto_124986 ?auto_124984 ) ) ( not ( = ?auto_124971 ?auto_124979 ) ) ( not ( = ?auto_124972 ?auto_124979 ) ) ( not ( = ?auto_124977 ?auto_124979 ) ) ( not ( = ?auto_124978 ?auto_124983 ) ) ( not ( = ?auto_124981 ?auto_124982 ) ) ( not ( = ?auto_124981 ?auto_124984 ) ) ( not ( = ?auto_124971 ?auto_124975 ) ) ( not ( = ?auto_124972 ?auto_124975 ) ) ( not ( = ?auto_124977 ?auto_124975 ) ) ( not ( = ?auto_124979 ?auto_124975 ) ) ( not ( = ?auto_124974 ?auto_124983 ) ) ( not ( = ?auto_124987 ?auto_124986 ) ) ( not ( = ?auto_124987 ?auto_124982 ) ) ( not ( = ?auto_124987 ?auto_124984 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_124970 ?auto_124971 ?auto_124973 ?auto_124972 ?auto_124976 ?auto_124977 ?auto_124974 ?auto_124975 ?auto_124978 ?auto_124979 )
      ( GET-5IMAGE-VERIFY ?auto_124970 ?auto_124971 ?auto_124973 ?auto_124972 ?auto_124974 ?auto_124975 ?auto_124976 ?auto_124977 ?auto_124978 ?auto_124979 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_125048 - DIRECTION
      ?auto_125049 - MODE
      ?auto_125051 - DIRECTION
      ?auto_125050 - MODE
      ?auto_125052 - DIRECTION
      ?auto_125053 - MODE
      ?auto_125054 - DIRECTION
      ?auto_125055 - MODE
      ?auto_125056 - DIRECTION
      ?auto_125057 - MODE
    )
    :vars
    (
      ?auto_125065 - INSTRUMENT
      ?auto_125058 - SATELLITE
      ?auto_125063 - DIRECTION
      ?auto_125059 - INSTRUMENT
      ?auto_125064 - INSTRUMENT
      ?auto_125060 - INSTRUMENT
      ?auto_125062 - INSTRUMENT
      ?auto_125061 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_125051 ?auto_125048 ) ) ( not ( = ?auto_125052 ?auto_125048 ) ) ( not ( = ?auto_125052 ?auto_125051 ) ) ( not ( = ?auto_125054 ?auto_125048 ) ) ( not ( = ?auto_125054 ?auto_125051 ) ) ( not ( = ?auto_125054 ?auto_125052 ) ) ( not ( = ?auto_125056 ?auto_125048 ) ) ( not ( = ?auto_125056 ?auto_125051 ) ) ( not ( = ?auto_125056 ?auto_125052 ) ) ( not ( = ?auto_125056 ?auto_125054 ) ) ( ON_BOARD ?auto_125065 ?auto_125058 ) ( SUPPORTS ?auto_125065 ?auto_125053 ) ( not ( = ?auto_125052 ?auto_125063 ) ) ( CALIBRATION_TARGET ?auto_125065 ?auto_125063 ) ( not ( = ?auto_125063 ?auto_125054 ) ) ( ON_BOARD ?auto_125059 ?auto_125058 ) ( not ( = ?auto_125065 ?auto_125059 ) ) ( SUPPORTS ?auto_125059 ?auto_125055 ) ( CALIBRATION_TARGET ?auto_125059 ?auto_125063 ) ( not ( = ?auto_125063 ?auto_125056 ) ) ( ON_BOARD ?auto_125064 ?auto_125058 ) ( not ( = ?auto_125059 ?auto_125064 ) ) ( SUPPORTS ?auto_125064 ?auto_125057 ) ( CALIBRATION_TARGET ?auto_125064 ?auto_125063 ) ( not ( = ?auto_125063 ?auto_125051 ) ) ( ON_BOARD ?auto_125060 ?auto_125058 ) ( not ( = ?auto_125064 ?auto_125060 ) ) ( SUPPORTS ?auto_125060 ?auto_125050 ) ( CALIBRATION_TARGET ?auto_125060 ?auto_125063 ) ( not ( = ?auto_125063 ?auto_125048 ) ) ( ON_BOARD ?auto_125062 ?auto_125058 ) ( not ( = ?auto_125060 ?auto_125062 ) ) ( SUPPORTS ?auto_125062 ?auto_125049 ) ( CALIBRATION_TARGET ?auto_125062 ?auto_125063 ) ( POWER_AVAIL ?auto_125058 ) ( POINTING ?auto_125058 ?auto_125061 ) ( not ( = ?auto_125063 ?auto_125061 ) ) ( not ( = ?auto_125048 ?auto_125061 ) ) ( not ( = ?auto_125049 ?auto_125050 ) ) ( not ( = ?auto_125051 ?auto_125061 ) ) ( not ( = ?auto_125049 ?auto_125057 ) ) ( not ( = ?auto_125050 ?auto_125057 ) ) ( not ( = ?auto_125056 ?auto_125061 ) ) ( not ( = ?auto_125064 ?auto_125062 ) ) ( not ( = ?auto_125049 ?auto_125055 ) ) ( not ( = ?auto_125050 ?auto_125055 ) ) ( not ( = ?auto_125057 ?auto_125055 ) ) ( not ( = ?auto_125054 ?auto_125061 ) ) ( not ( = ?auto_125059 ?auto_125060 ) ) ( not ( = ?auto_125059 ?auto_125062 ) ) ( not ( = ?auto_125049 ?auto_125053 ) ) ( not ( = ?auto_125050 ?auto_125053 ) ) ( not ( = ?auto_125057 ?auto_125053 ) ) ( not ( = ?auto_125055 ?auto_125053 ) ) ( not ( = ?auto_125052 ?auto_125061 ) ) ( not ( = ?auto_125065 ?auto_125064 ) ) ( not ( = ?auto_125065 ?auto_125060 ) ) ( not ( = ?auto_125065 ?auto_125062 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_125048 ?auto_125049 ?auto_125051 ?auto_125050 ?auto_125056 ?auto_125057 ?auto_125052 ?auto_125053 ?auto_125054 ?auto_125055 )
      ( GET-5IMAGE-VERIFY ?auto_125048 ?auto_125049 ?auto_125051 ?auto_125050 ?auto_125052 ?auto_125053 ?auto_125054 ?auto_125055 ?auto_125056 ?auto_125057 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_125462 - DIRECTION
      ?auto_125463 - MODE
      ?auto_125465 - DIRECTION
      ?auto_125464 - MODE
      ?auto_125466 - DIRECTION
      ?auto_125467 - MODE
      ?auto_125468 - DIRECTION
      ?auto_125469 - MODE
      ?auto_125470 - DIRECTION
      ?auto_125471 - MODE
    )
    :vars
    (
      ?auto_125479 - INSTRUMENT
      ?auto_125472 - SATELLITE
      ?auto_125477 - DIRECTION
      ?auto_125473 - INSTRUMENT
      ?auto_125478 - INSTRUMENT
      ?auto_125474 - INSTRUMENT
      ?auto_125476 - INSTRUMENT
      ?auto_125475 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_125465 ?auto_125462 ) ) ( not ( = ?auto_125466 ?auto_125462 ) ) ( not ( = ?auto_125466 ?auto_125465 ) ) ( not ( = ?auto_125468 ?auto_125462 ) ) ( not ( = ?auto_125468 ?auto_125465 ) ) ( not ( = ?auto_125468 ?auto_125466 ) ) ( not ( = ?auto_125470 ?auto_125462 ) ) ( not ( = ?auto_125470 ?auto_125465 ) ) ( not ( = ?auto_125470 ?auto_125466 ) ) ( not ( = ?auto_125470 ?auto_125468 ) ) ( ON_BOARD ?auto_125479 ?auto_125472 ) ( SUPPORTS ?auto_125479 ?auto_125471 ) ( not ( = ?auto_125470 ?auto_125477 ) ) ( CALIBRATION_TARGET ?auto_125479 ?auto_125477 ) ( not ( = ?auto_125477 ?auto_125468 ) ) ( ON_BOARD ?auto_125473 ?auto_125472 ) ( not ( = ?auto_125479 ?auto_125473 ) ) ( SUPPORTS ?auto_125473 ?auto_125469 ) ( CALIBRATION_TARGET ?auto_125473 ?auto_125477 ) ( not ( = ?auto_125477 ?auto_125465 ) ) ( ON_BOARD ?auto_125478 ?auto_125472 ) ( not ( = ?auto_125473 ?auto_125478 ) ) ( SUPPORTS ?auto_125478 ?auto_125464 ) ( CALIBRATION_TARGET ?auto_125478 ?auto_125477 ) ( not ( = ?auto_125477 ?auto_125466 ) ) ( ON_BOARD ?auto_125474 ?auto_125472 ) ( not ( = ?auto_125478 ?auto_125474 ) ) ( SUPPORTS ?auto_125474 ?auto_125467 ) ( CALIBRATION_TARGET ?auto_125474 ?auto_125477 ) ( not ( = ?auto_125477 ?auto_125462 ) ) ( ON_BOARD ?auto_125476 ?auto_125472 ) ( not ( = ?auto_125474 ?auto_125476 ) ) ( SUPPORTS ?auto_125476 ?auto_125463 ) ( CALIBRATION_TARGET ?auto_125476 ?auto_125477 ) ( POWER_AVAIL ?auto_125472 ) ( POINTING ?auto_125472 ?auto_125475 ) ( not ( = ?auto_125477 ?auto_125475 ) ) ( not ( = ?auto_125462 ?auto_125475 ) ) ( not ( = ?auto_125463 ?auto_125467 ) ) ( not ( = ?auto_125466 ?auto_125475 ) ) ( not ( = ?auto_125463 ?auto_125464 ) ) ( not ( = ?auto_125467 ?auto_125464 ) ) ( not ( = ?auto_125465 ?auto_125475 ) ) ( not ( = ?auto_125478 ?auto_125476 ) ) ( not ( = ?auto_125463 ?auto_125469 ) ) ( not ( = ?auto_125467 ?auto_125469 ) ) ( not ( = ?auto_125464 ?auto_125469 ) ) ( not ( = ?auto_125468 ?auto_125475 ) ) ( not ( = ?auto_125473 ?auto_125474 ) ) ( not ( = ?auto_125473 ?auto_125476 ) ) ( not ( = ?auto_125463 ?auto_125471 ) ) ( not ( = ?auto_125467 ?auto_125471 ) ) ( not ( = ?auto_125464 ?auto_125471 ) ) ( not ( = ?auto_125469 ?auto_125471 ) ) ( not ( = ?auto_125470 ?auto_125475 ) ) ( not ( = ?auto_125479 ?auto_125478 ) ) ( not ( = ?auto_125479 ?auto_125474 ) ) ( not ( = ?auto_125479 ?auto_125476 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_125462 ?auto_125463 ?auto_125466 ?auto_125467 ?auto_125465 ?auto_125464 ?auto_125470 ?auto_125471 ?auto_125468 ?auto_125469 )
      ( GET-5IMAGE-VERIFY ?auto_125462 ?auto_125463 ?auto_125465 ?auto_125464 ?auto_125466 ?auto_125467 ?auto_125468 ?auto_125469 ?auto_125470 ?auto_125471 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_125540 - DIRECTION
      ?auto_125541 - MODE
      ?auto_125543 - DIRECTION
      ?auto_125542 - MODE
      ?auto_125544 - DIRECTION
      ?auto_125545 - MODE
      ?auto_125546 - DIRECTION
      ?auto_125547 - MODE
      ?auto_125548 - DIRECTION
      ?auto_125549 - MODE
    )
    :vars
    (
      ?auto_125557 - INSTRUMENT
      ?auto_125550 - SATELLITE
      ?auto_125555 - DIRECTION
      ?auto_125551 - INSTRUMENT
      ?auto_125556 - INSTRUMENT
      ?auto_125552 - INSTRUMENT
      ?auto_125554 - INSTRUMENT
      ?auto_125553 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_125543 ?auto_125540 ) ) ( not ( = ?auto_125544 ?auto_125540 ) ) ( not ( = ?auto_125544 ?auto_125543 ) ) ( not ( = ?auto_125546 ?auto_125540 ) ) ( not ( = ?auto_125546 ?auto_125543 ) ) ( not ( = ?auto_125546 ?auto_125544 ) ) ( not ( = ?auto_125548 ?auto_125540 ) ) ( not ( = ?auto_125548 ?auto_125543 ) ) ( not ( = ?auto_125548 ?auto_125544 ) ) ( not ( = ?auto_125548 ?auto_125546 ) ) ( ON_BOARD ?auto_125557 ?auto_125550 ) ( SUPPORTS ?auto_125557 ?auto_125547 ) ( not ( = ?auto_125546 ?auto_125555 ) ) ( CALIBRATION_TARGET ?auto_125557 ?auto_125555 ) ( not ( = ?auto_125555 ?auto_125548 ) ) ( ON_BOARD ?auto_125551 ?auto_125550 ) ( not ( = ?auto_125557 ?auto_125551 ) ) ( SUPPORTS ?auto_125551 ?auto_125549 ) ( CALIBRATION_TARGET ?auto_125551 ?auto_125555 ) ( not ( = ?auto_125555 ?auto_125543 ) ) ( ON_BOARD ?auto_125556 ?auto_125550 ) ( not ( = ?auto_125551 ?auto_125556 ) ) ( SUPPORTS ?auto_125556 ?auto_125542 ) ( CALIBRATION_TARGET ?auto_125556 ?auto_125555 ) ( not ( = ?auto_125555 ?auto_125544 ) ) ( ON_BOARD ?auto_125552 ?auto_125550 ) ( not ( = ?auto_125556 ?auto_125552 ) ) ( SUPPORTS ?auto_125552 ?auto_125545 ) ( CALIBRATION_TARGET ?auto_125552 ?auto_125555 ) ( not ( = ?auto_125555 ?auto_125540 ) ) ( ON_BOARD ?auto_125554 ?auto_125550 ) ( not ( = ?auto_125552 ?auto_125554 ) ) ( SUPPORTS ?auto_125554 ?auto_125541 ) ( CALIBRATION_TARGET ?auto_125554 ?auto_125555 ) ( POWER_AVAIL ?auto_125550 ) ( POINTING ?auto_125550 ?auto_125553 ) ( not ( = ?auto_125555 ?auto_125553 ) ) ( not ( = ?auto_125540 ?auto_125553 ) ) ( not ( = ?auto_125541 ?auto_125545 ) ) ( not ( = ?auto_125544 ?auto_125553 ) ) ( not ( = ?auto_125541 ?auto_125542 ) ) ( not ( = ?auto_125545 ?auto_125542 ) ) ( not ( = ?auto_125543 ?auto_125553 ) ) ( not ( = ?auto_125556 ?auto_125554 ) ) ( not ( = ?auto_125541 ?auto_125549 ) ) ( not ( = ?auto_125545 ?auto_125549 ) ) ( not ( = ?auto_125542 ?auto_125549 ) ) ( not ( = ?auto_125548 ?auto_125553 ) ) ( not ( = ?auto_125551 ?auto_125552 ) ) ( not ( = ?auto_125551 ?auto_125554 ) ) ( not ( = ?auto_125541 ?auto_125547 ) ) ( not ( = ?auto_125545 ?auto_125547 ) ) ( not ( = ?auto_125542 ?auto_125547 ) ) ( not ( = ?auto_125549 ?auto_125547 ) ) ( not ( = ?auto_125546 ?auto_125553 ) ) ( not ( = ?auto_125557 ?auto_125556 ) ) ( not ( = ?auto_125557 ?auto_125552 ) ) ( not ( = ?auto_125557 ?auto_125554 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_125540 ?auto_125541 ?auto_125544 ?auto_125545 ?auto_125543 ?auto_125542 ?auto_125546 ?auto_125547 ?auto_125548 ?auto_125549 )
      ( GET-5IMAGE-VERIFY ?auto_125540 ?auto_125541 ?auto_125543 ?auto_125542 ?auto_125544 ?auto_125545 ?auto_125546 ?auto_125547 ?auto_125548 ?auto_125549 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_125788 - DIRECTION
      ?auto_125789 - MODE
      ?auto_125791 - DIRECTION
      ?auto_125790 - MODE
      ?auto_125792 - DIRECTION
      ?auto_125793 - MODE
      ?auto_125794 - DIRECTION
      ?auto_125795 - MODE
      ?auto_125796 - DIRECTION
      ?auto_125797 - MODE
    )
    :vars
    (
      ?auto_125805 - INSTRUMENT
      ?auto_125798 - SATELLITE
      ?auto_125803 - DIRECTION
      ?auto_125799 - INSTRUMENT
      ?auto_125804 - INSTRUMENT
      ?auto_125800 - INSTRUMENT
      ?auto_125802 - INSTRUMENT
      ?auto_125801 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_125791 ?auto_125788 ) ) ( not ( = ?auto_125792 ?auto_125788 ) ) ( not ( = ?auto_125792 ?auto_125791 ) ) ( not ( = ?auto_125794 ?auto_125788 ) ) ( not ( = ?auto_125794 ?auto_125791 ) ) ( not ( = ?auto_125794 ?auto_125792 ) ) ( not ( = ?auto_125796 ?auto_125788 ) ) ( not ( = ?auto_125796 ?auto_125791 ) ) ( not ( = ?auto_125796 ?auto_125792 ) ) ( not ( = ?auto_125796 ?auto_125794 ) ) ( ON_BOARD ?auto_125805 ?auto_125798 ) ( SUPPORTS ?auto_125805 ?auto_125797 ) ( not ( = ?auto_125796 ?auto_125803 ) ) ( CALIBRATION_TARGET ?auto_125805 ?auto_125803 ) ( not ( = ?auto_125803 ?auto_125792 ) ) ( ON_BOARD ?auto_125799 ?auto_125798 ) ( not ( = ?auto_125805 ?auto_125799 ) ) ( SUPPORTS ?auto_125799 ?auto_125793 ) ( CALIBRATION_TARGET ?auto_125799 ?auto_125803 ) ( not ( = ?auto_125803 ?auto_125791 ) ) ( ON_BOARD ?auto_125804 ?auto_125798 ) ( not ( = ?auto_125799 ?auto_125804 ) ) ( SUPPORTS ?auto_125804 ?auto_125790 ) ( CALIBRATION_TARGET ?auto_125804 ?auto_125803 ) ( not ( = ?auto_125803 ?auto_125794 ) ) ( ON_BOARD ?auto_125800 ?auto_125798 ) ( not ( = ?auto_125804 ?auto_125800 ) ) ( SUPPORTS ?auto_125800 ?auto_125795 ) ( CALIBRATION_TARGET ?auto_125800 ?auto_125803 ) ( not ( = ?auto_125803 ?auto_125788 ) ) ( ON_BOARD ?auto_125802 ?auto_125798 ) ( not ( = ?auto_125800 ?auto_125802 ) ) ( SUPPORTS ?auto_125802 ?auto_125789 ) ( CALIBRATION_TARGET ?auto_125802 ?auto_125803 ) ( POWER_AVAIL ?auto_125798 ) ( POINTING ?auto_125798 ?auto_125801 ) ( not ( = ?auto_125803 ?auto_125801 ) ) ( not ( = ?auto_125788 ?auto_125801 ) ) ( not ( = ?auto_125789 ?auto_125795 ) ) ( not ( = ?auto_125794 ?auto_125801 ) ) ( not ( = ?auto_125789 ?auto_125790 ) ) ( not ( = ?auto_125795 ?auto_125790 ) ) ( not ( = ?auto_125791 ?auto_125801 ) ) ( not ( = ?auto_125804 ?auto_125802 ) ) ( not ( = ?auto_125789 ?auto_125793 ) ) ( not ( = ?auto_125795 ?auto_125793 ) ) ( not ( = ?auto_125790 ?auto_125793 ) ) ( not ( = ?auto_125792 ?auto_125801 ) ) ( not ( = ?auto_125799 ?auto_125800 ) ) ( not ( = ?auto_125799 ?auto_125802 ) ) ( not ( = ?auto_125789 ?auto_125797 ) ) ( not ( = ?auto_125795 ?auto_125797 ) ) ( not ( = ?auto_125790 ?auto_125797 ) ) ( not ( = ?auto_125793 ?auto_125797 ) ) ( not ( = ?auto_125796 ?auto_125801 ) ) ( not ( = ?auto_125805 ?auto_125804 ) ) ( not ( = ?auto_125805 ?auto_125800 ) ) ( not ( = ?auto_125805 ?auto_125802 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_125788 ?auto_125789 ?auto_125794 ?auto_125795 ?auto_125791 ?auto_125790 ?auto_125796 ?auto_125797 ?auto_125792 ?auto_125793 )
      ( GET-5IMAGE-VERIFY ?auto_125788 ?auto_125789 ?auto_125791 ?auto_125790 ?auto_125792 ?auto_125793 ?auto_125794 ?auto_125795 ?auto_125796 ?auto_125797 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_125866 - DIRECTION
      ?auto_125867 - MODE
      ?auto_125869 - DIRECTION
      ?auto_125868 - MODE
      ?auto_125870 - DIRECTION
      ?auto_125871 - MODE
      ?auto_125872 - DIRECTION
      ?auto_125873 - MODE
      ?auto_125874 - DIRECTION
      ?auto_125875 - MODE
    )
    :vars
    (
      ?auto_125883 - INSTRUMENT
      ?auto_125876 - SATELLITE
      ?auto_125881 - DIRECTION
      ?auto_125877 - INSTRUMENT
      ?auto_125882 - INSTRUMENT
      ?auto_125878 - INSTRUMENT
      ?auto_125880 - INSTRUMENT
      ?auto_125879 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_125869 ?auto_125866 ) ) ( not ( = ?auto_125870 ?auto_125866 ) ) ( not ( = ?auto_125870 ?auto_125869 ) ) ( not ( = ?auto_125872 ?auto_125866 ) ) ( not ( = ?auto_125872 ?auto_125869 ) ) ( not ( = ?auto_125872 ?auto_125870 ) ) ( not ( = ?auto_125874 ?auto_125866 ) ) ( not ( = ?auto_125874 ?auto_125869 ) ) ( not ( = ?auto_125874 ?auto_125870 ) ) ( not ( = ?auto_125874 ?auto_125872 ) ) ( ON_BOARD ?auto_125883 ?auto_125876 ) ( SUPPORTS ?auto_125883 ?auto_125873 ) ( not ( = ?auto_125872 ?auto_125881 ) ) ( CALIBRATION_TARGET ?auto_125883 ?auto_125881 ) ( not ( = ?auto_125881 ?auto_125870 ) ) ( ON_BOARD ?auto_125877 ?auto_125876 ) ( not ( = ?auto_125883 ?auto_125877 ) ) ( SUPPORTS ?auto_125877 ?auto_125871 ) ( CALIBRATION_TARGET ?auto_125877 ?auto_125881 ) ( not ( = ?auto_125881 ?auto_125869 ) ) ( ON_BOARD ?auto_125882 ?auto_125876 ) ( not ( = ?auto_125877 ?auto_125882 ) ) ( SUPPORTS ?auto_125882 ?auto_125868 ) ( CALIBRATION_TARGET ?auto_125882 ?auto_125881 ) ( not ( = ?auto_125881 ?auto_125874 ) ) ( ON_BOARD ?auto_125878 ?auto_125876 ) ( not ( = ?auto_125882 ?auto_125878 ) ) ( SUPPORTS ?auto_125878 ?auto_125875 ) ( CALIBRATION_TARGET ?auto_125878 ?auto_125881 ) ( not ( = ?auto_125881 ?auto_125866 ) ) ( ON_BOARD ?auto_125880 ?auto_125876 ) ( not ( = ?auto_125878 ?auto_125880 ) ) ( SUPPORTS ?auto_125880 ?auto_125867 ) ( CALIBRATION_TARGET ?auto_125880 ?auto_125881 ) ( POWER_AVAIL ?auto_125876 ) ( POINTING ?auto_125876 ?auto_125879 ) ( not ( = ?auto_125881 ?auto_125879 ) ) ( not ( = ?auto_125866 ?auto_125879 ) ) ( not ( = ?auto_125867 ?auto_125875 ) ) ( not ( = ?auto_125874 ?auto_125879 ) ) ( not ( = ?auto_125867 ?auto_125868 ) ) ( not ( = ?auto_125875 ?auto_125868 ) ) ( not ( = ?auto_125869 ?auto_125879 ) ) ( not ( = ?auto_125882 ?auto_125880 ) ) ( not ( = ?auto_125867 ?auto_125871 ) ) ( not ( = ?auto_125875 ?auto_125871 ) ) ( not ( = ?auto_125868 ?auto_125871 ) ) ( not ( = ?auto_125870 ?auto_125879 ) ) ( not ( = ?auto_125877 ?auto_125878 ) ) ( not ( = ?auto_125877 ?auto_125880 ) ) ( not ( = ?auto_125867 ?auto_125873 ) ) ( not ( = ?auto_125875 ?auto_125873 ) ) ( not ( = ?auto_125868 ?auto_125873 ) ) ( not ( = ?auto_125871 ?auto_125873 ) ) ( not ( = ?auto_125872 ?auto_125879 ) ) ( not ( = ?auto_125883 ?auto_125882 ) ) ( not ( = ?auto_125883 ?auto_125878 ) ) ( not ( = ?auto_125883 ?auto_125880 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_125866 ?auto_125867 ?auto_125874 ?auto_125875 ?auto_125869 ?auto_125868 ?auto_125872 ?auto_125873 ?auto_125870 ?auto_125871 )
      ( GET-5IMAGE-VERIFY ?auto_125866 ?auto_125867 ?auto_125869 ?auto_125868 ?auto_125870 ?auto_125871 ?auto_125872 ?auto_125873 ?auto_125874 ?auto_125875 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_126110 - DIRECTION
      ?auto_126111 - MODE
      ?auto_126113 - DIRECTION
      ?auto_126112 - MODE
      ?auto_126114 - DIRECTION
      ?auto_126115 - MODE
      ?auto_126116 - DIRECTION
      ?auto_126117 - MODE
      ?auto_126118 - DIRECTION
      ?auto_126119 - MODE
    )
    :vars
    (
      ?auto_126127 - INSTRUMENT
      ?auto_126120 - SATELLITE
      ?auto_126125 - DIRECTION
      ?auto_126121 - INSTRUMENT
      ?auto_126126 - INSTRUMENT
      ?auto_126122 - INSTRUMENT
      ?auto_126124 - INSTRUMENT
      ?auto_126123 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_126113 ?auto_126110 ) ) ( not ( = ?auto_126114 ?auto_126110 ) ) ( not ( = ?auto_126114 ?auto_126113 ) ) ( not ( = ?auto_126116 ?auto_126110 ) ) ( not ( = ?auto_126116 ?auto_126113 ) ) ( not ( = ?auto_126116 ?auto_126114 ) ) ( not ( = ?auto_126118 ?auto_126110 ) ) ( not ( = ?auto_126118 ?auto_126113 ) ) ( not ( = ?auto_126118 ?auto_126114 ) ) ( not ( = ?auto_126118 ?auto_126116 ) ) ( ON_BOARD ?auto_126127 ?auto_126120 ) ( SUPPORTS ?auto_126127 ?auto_126115 ) ( not ( = ?auto_126114 ?auto_126125 ) ) ( CALIBRATION_TARGET ?auto_126127 ?auto_126125 ) ( not ( = ?auto_126125 ?auto_126118 ) ) ( ON_BOARD ?auto_126121 ?auto_126120 ) ( not ( = ?auto_126127 ?auto_126121 ) ) ( SUPPORTS ?auto_126121 ?auto_126119 ) ( CALIBRATION_TARGET ?auto_126121 ?auto_126125 ) ( not ( = ?auto_126125 ?auto_126113 ) ) ( ON_BOARD ?auto_126126 ?auto_126120 ) ( not ( = ?auto_126121 ?auto_126126 ) ) ( SUPPORTS ?auto_126126 ?auto_126112 ) ( CALIBRATION_TARGET ?auto_126126 ?auto_126125 ) ( not ( = ?auto_126125 ?auto_126116 ) ) ( ON_BOARD ?auto_126122 ?auto_126120 ) ( not ( = ?auto_126126 ?auto_126122 ) ) ( SUPPORTS ?auto_126122 ?auto_126117 ) ( CALIBRATION_TARGET ?auto_126122 ?auto_126125 ) ( not ( = ?auto_126125 ?auto_126110 ) ) ( ON_BOARD ?auto_126124 ?auto_126120 ) ( not ( = ?auto_126122 ?auto_126124 ) ) ( SUPPORTS ?auto_126124 ?auto_126111 ) ( CALIBRATION_TARGET ?auto_126124 ?auto_126125 ) ( POWER_AVAIL ?auto_126120 ) ( POINTING ?auto_126120 ?auto_126123 ) ( not ( = ?auto_126125 ?auto_126123 ) ) ( not ( = ?auto_126110 ?auto_126123 ) ) ( not ( = ?auto_126111 ?auto_126117 ) ) ( not ( = ?auto_126116 ?auto_126123 ) ) ( not ( = ?auto_126111 ?auto_126112 ) ) ( not ( = ?auto_126117 ?auto_126112 ) ) ( not ( = ?auto_126113 ?auto_126123 ) ) ( not ( = ?auto_126126 ?auto_126124 ) ) ( not ( = ?auto_126111 ?auto_126119 ) ) ( not ( = ?auto_126117 ?auto_126119 ) ) ( not ( = ?auto_126112 ?auto_126119 ) ) ( not ( = ?auto_126118 ?auto_126123 ) ) ( not ( = ?auto_126121 ?auto_126122 ) ) ( not ( = ?auto_126121 ?auto_126124 ) ) ( not ( = ?auto_126111 ?auto_126115 ) ) ( not ( = ?auto_126117 ?auto_126115 ) ) ( not ( = ?auto_126112 ?auto_126115 ) ) ( not ( = ?auto_126119 ?auto_126115 ) ) ( not ( = ?auto_126114 ?auto_126123 ) ) ( not ( = ?auto_126127 ?auto_126126 ) ) ( not ( = ?auto_126127 ?auto_126122 ) ) ( not ( = ?auto_126127 ?auto_126124 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_126110 ?auto_126111 ?auto_126116 ?auto_126117 ?auto_126113 ?auto_126112 ?auto_126114 ?auto_126115 ?auto_126118 ?auto_126119 )
      ( GET-5IMAGE-VERIFY ?auto_126110 ?auto_126111 ?auto_126113 ?auto_126112 ?auto_126114 ?auto_126115 ?auto_126116 ?auto_126117 ?auto_126118 ?auto_126119 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_126274 - DIRECTION
      ?auto_126275 - MODE
      ?auto_126277 - DIRECTION
      ?auto_126276 - MODE
      ?auto_126278 - DIRECTION
      ?auto_126279 - MODE
      ?auto_126280 - DIRECTION
      ?auto_126281 - MODE
      ?auto_126282 - DIRECTION
      ?auto_126283 - MODE
    )
    :vars
    (
      ?auto_126291 - INSTRUMENT
      ?auto_126284 - SATELLITE
      ?auto_126289 - DIRECTION
      ?auto_126285 - INSTRUMENT
      ?auto_126290 - INSTRUMENT
      ?auto_126286 - INSTRUMENT
      ?auto_126288 - INSTRUMENT
      ?auto_126287 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_126277 ?auto_126274 ) ) ( not ( = ?auto_126278 ?auto_126274 ) ) ( not ( = ?auto_126278 ?auto_126277 ) ) ( not ( = ?auto_126280 ?auto_126274 ) ) ( not ( = ?auto_126280 ?auto_126277 ) ) ( not ( = ?auto_126280 ?auto_126278 ) ) ( not ( = ?auto_126282 ?auto_126274 ) ) ( not ( = ?auto_126282 ?auto_126277 ) ) ( not ( = ?auto_126282 ?auto_126278 ) ) ( not ( = ?auto_126282 ?auto_126280 ) ) ( ON_BOARD ?auto_126291 ?auto_126284 ) ( SUPPORTS ?auto_126291 ?auto_126279 ) ( not ( = ?auto_126278 ?auto_126289 ) ) ( CALIBRATION_TARGET ?auto_126291 ?auto_126289 ) ( not ( = ?auto_126289 ?auto_126280 ) ) ( ON_BOARD ?auto_126285 ?auto_126284 ) ( not ( = ?auto_126291 ?auto_126285 ) ) ( SUPPORTS ?auto_126285 ?auto_126281 ) ( CALIBRATION_TARGET ?auto_126285 ?auto_126289 ) ( not ( = ?auto_126289 ?auto_126277 ) ) ( ON_BOARD ?auto_126290 ?auto_126284 ) ( not ( = ?auto_126285 ?auto_126290 ) ) ( SUPPORTS ?auto_126290 ?auto_126276 ) ( CALIBRATION_TARGET ?auto_126290 ?auto_126289 ) ( not ( = ?auto_126289 ?auto_126282 ) ) ( ON_BOARD ?auto_126286 ?auto_126284 ) ( not ( = ?auto_126290 ?auto_126286 ) ) ( SUPPORTS ?auto_126286 ?auto_126283 ) ( CALIBRATION_TARGET ?auto_126286 ?auto_126289 ) ( not ( = ?auto_126289 ?auto_126274 ) ) ( ON_BOARD ?auto_126288 ?auto_126284 ) ( not ( = ?auto_126286 ?auto_126288 ) ) ( SUPPORTS ?auto_126288 ?auto_126275 ) ( CALIBRATION_TARGET ?auto_126288 ?auto_126289 ) ( POWER_AVAIL ?auto_126284 ) ( POINTING ?auto_126284 ?auto_126287 ) ( not ( = ?auto_126289 ?auto_126287 ) ) ( not ( = ?auto_126274 ?auto_126287 ) ) ( not ( = ?auto_126275 ?auto_126283 ) ) ( not ( = ?auto_126282 ?auto_126287 ) ) ( not ( = ?auto_126275 ?auto_126276 ) ) ( not ( = ?auto_126283 ?auto_126276 ) ) ( not ( = ?auto_126277 ?auto_126287 ) ) ( not ( = ?auto_126290 ?auto_126288 ) ) ( not ( = ?auto_126275 ?auto_126281 ) ) ( not ( = ?auto_126283 ?auto_126281 ) ) ( not ( = ?auto_126276 ?auto_126281 ) ) ( not ( = ?auto_126280 ?auto_126287 ) ) ( not ( = ?auto_126285 ?auto_126286 ) ) ( not ( = ?auto_126285 ?auto_126288 ) ) ( not ( = ?auto_126275 ?auto_126279 ) ) ( not ( = ?auto_126283 ?auto_126279 ) ) ( not ( = ?auto_126276 ?auto_126279 ) ) ( not ( = ?auto_126281 ?auto_126279 ) ) ( not ( = ?auto_126278 ?auto_126287 ) ) ( not ( = ?auto_126291 ?auto_126290 ) ) ( not ( = ?auto_126291 ?auto_126286 ) ) ( not ( = ?auto_126291 ?auto_126288 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_126274 ?auto_126275 ?auto_126282 ?auto_126283 ?auto_126277 ?auto_126276 ?auto_126278 ?auto_126279 ?auto_126280 ?auto_126281 )
      ( GET-5IMAGE-VERIFY ?auto_126274 ?auto_126275 ?auto_126277 ?auto_126276 ?auto_126278 ?auto_126279 ?auto_126280 ?auto_126281 ?auto_126282 ?auto_126283 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_126688 - DIRECTION
      ?auto_126689 - MODE
      ?auto_126691 - DIRECTION
      ?auto_126690 - MODE
      ?auto_126692 - DIRECTION
      ?auto_126693 - MODE
      ?auto_126694 - DIRECTION
      ?auto_126695 - MODE
      ?auto_126696 - DIRECTION
      ?auto_126697 - MODE
    )
    :vars
    (
      ?auto_126705 - INSTRUMENT
      ?auto_126698 - SATELLITE
      ?auto_126703 - DIRECTION
      ?auto_126699 - INSTRUMENT
      ?auto_126704 - INSTRUMENT
      ?auto_126700 - INSTRUMENT
      ?auto_126702 - INSTRUMENT
      ?auto_126701 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_126691 ?auto_126688 ) ) ( not ( = ?auto_126692 ?auto_126688 ) ) ( not ( = ?auto_126692 ?auto_126691 ) ) ( not ( = ?auto_126694 ?auto_126688 ) ) ( not ( = ?auto_126694 ?auto_126691 ) ) ( not ( = ?auto_126694 ?auto_126692 ) ) ( not ( = ?auto_126696 ?auto_126688 ) ) ( not ( = ?auto_126696 ?auto_126691 ) ) ( not ( = ?auto_126696 ?auto_126692 ) ) ( not ( = ?auto_126696 ?auto_126694 ) ) ( ON_BOARD ?auto_126705 ?auto_126698 ) ( SUPPORTS ?auto_126705 ?auto_126697 ) ( not ( = ?auto_126696 ?auto_126703 ) ) ( CALIBRATION_TARGET ?auto_126705 ?auto_126703 ) ( not ( = ?auto_126703 ?auto_126691 ) ) ( ON_BOARD ?auto_126699 ?auto_126698 ) ( not ( = ?auto_126705 ?auto_126699 ) ) ( SUPPORTS ?auto_126699 ?auto_126690 ) ( CALIBRATION_TARGET ?auto_126699 ?auto_126703 ) ( not ( = ?auto_126703 ?auto_126694 ) ) ( ON_BOARD ?auto_126704 ?auto_126698 ) ( not ( = ?auto_126699 ?auto_126704 ) ) ( SUPPORTS ?auto_126704 ?auto_126695 ) ( CALIBRATION_TARGET ?auto_126704 ?auto_126703 ) ( not ( = ?auto_126703 ?auto_126692 ) ) ( ON_BOARD ?auto_126700 ?auto_126698 ) ( not ( = ?auto_126704 ?auto_126700 ) ) ( SUPPORTS ?auto_126700 ?auto_126693 ) ( CALIBRATION_TARGET ?auto_126700 ?auto_126703 ) ( not ( = ?auto_126703 ?auto_126688 ) ) ( ON_BOARD ?auto_126702 ?auto_126698 ) ( not ( = ?auto_126700 ?auto_126702 ) ) ( SUPPORTS ?auto_126702 ?auto_126689 ) ( CALIBRATION_TARGET ?auto_126702 ?auto_126703 ) ( POWER_AVAIL ?auto_126698 ) ( POINTING ?auto_126698 ?auto_126701 ) ( not ( = ?auto_126703 ?auto_126701 ) ) ( not ( = ?auto_126688 ?auto_126701 ) ) ( not ( = ?auto_126689 ?auto_126693 ) ) ( not ( = ?auto_126692 ?auto_126701 ) ) ( not ( = ?auto_126689 ?auto_126695 ) ) ( not ( = ?auto_126693 ?auto_126695 ) ) ( not ( = ?auto_126694 ?auto_126701 ) ) ( not ( = ?auto_126704 ?auto_126702 ) ) ( not ( = ?auto_126689 ?auto_126690 ) ) ( not ( = ?auto_126693 ?auto_126690 ) ) ( not ( = ?auto_126695 ?auto_126690 ) ) ( not ( = ?auto_126691 ?auto_126701 ) ) ( not ( = ?auto_126699 ?auto_126700 ) ) ( not ( = ?auto_126699 ?auto_126702 ) ) ( not ( = ?auto_126689 ?auto_126697 ) ) ( not ( = ?auto_126693 ?auto_126697 ) ) ( not ( = ?auto_126695 ?auto_126697 ) ) ( not ( = ?auto_126690 ?auto_126697 ) ) ( not ( = ?auto_126696 ?auto_126701 ) ) ( not ( = ?auto_126705 ?auto_126704 ) ) ( not ( = ?auto_126705 ?auto_126700 ) ) ( not ( = ?auto_126705 ?auto_126702 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_126688 ?auto_126689 ?auto_126692 ?auto_126693 ?auto_126694 ?auto_126695 ?auto_126696 ?auto_126697 ?auto_126691 ?auto_126690 )
      ( GET-5IMAGE-VERIFY ?auto_126688 ?auto_126689 ?auto_126691 ?auto_126690 ?auto_126692 ?auto_126693 ?auto_126694 ?auto_126695 ?auto_126696 ?auto_126697 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_126766 - DIRECTION
      ?auto_126767 - MODE
      ?auto_126769 - DIRECTION
      ?auto_126768 - MODE
      ?auto_126770 - DIRECTION
      ?auto_126771 - MODE
      ?auto_126772 - DIRECTION
      ?auto_126773 - MODE
      ?auto_126774 - DIRECTION
      ?auto_126775 - MODE
    )
    :vars
    (
      ?auto_126783 - INSTRUMENT
      ?auto_126776 - SATELLITE
      ?auto_126781 - DIRECTION
      ?auto_126777 - INSTRUMENT
      ?auto_126782 - INSTRUMENT
      ?auto_126778 - INSTRUMENT
      ?auto_126780 - INSTRUMENT
      ?auto_126779 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_126769 ?auto_126766 ) ) ( not ( = ?auto_126770 ?auto_126766 ) ) ( not ( = ?auto_126770 ?auto_126769 ) ) ( not ( = ?auto_126772 ?auto_126766 ) ) ( not ( = ?auto_126772 ?auto_126769 ) ) ( not ( = ?auto_126772 ?auto_126770 ) ) ( not ( = ?auto_126774 ?auto_126766 ) ) ( not ( = ?auto_126774 ?auto_126769 ) ) ( not ( = ?auto_126774 ?auto_126770 ) ) ( not ( = ?auto_126774 ?auto_126772 ) ) ( ON_BOARD ?auto_126783 ?auto_126776 ) ( SUPPORTS ?auto_126783 ?auto_126773 ) ( not ( = ?auto_126772 ?auto_126781 ) ) ( CALIBRATION_TARGET ?auto_126783 ?auto_126781 ) ( not ( = ?auto_126781 ?auto_126769 ) ) ( ON_BOARD ?auto_126777 ?auto_126776 ) ( not ( = ?auto_126783 ?auto_126777 ) ) ( SUPPORTS ?auto_126777 ?auto_126768 ) ( CALIBRATION_TARGET ?auto_126777 ?auto_126781 ) ( not ( = ?auto_126781 ?auto_126774 ) ) ( ON_BOARD ?auto_126782 ?auto_126776 ) ( not ( = ?auto_126777 ?auto_126782 ) ) ( SUPPORTS ?auto_126782 ?auto_126775 ) ( CALIBRATION_TARGET ?auto_126782 ?auto_126781 ) ( not ( = ?auto_126781 ?auto_126770 ) ) ( ON_BOARD ?auto_126778 ?auto_126776 ) ( not ( = ?auto_126782 ?auto_126778 ) ) ( SUPPORTS ?auto_126778 ?auto_126771 ) ( CALIBRATION_TARGET ?auto_126778 ?auto_126781 ) ( not ( = ?auto_126781 ?auto_126766 ) ) ( ON_BOARD ?auto_126780 ?auto_126776 ) ( not ( = ?auto_126778 ?auto_126780 ) ) ( SUPPORTS ?auto_126780 ?auto_126767 ) ( CALIBRATION_TARGET ?auto_126780 ?auto_126781 ) ( POWER_AVAIL ?auto_126776 ) ( POINTING ?auto_126776 ?auto_126779 ) ( not ( = ?auto_126781 ?auto_126779 ) ) ( not ( = ?auto_126766 ?auto_126779 ) ) ( not ( = ?auto_126767 ?auto_126771 ) ) ( not ( = ?auto_126770 ?auto_126779 ) ) ( not ( = ?auto_126767 ?auto_126775 ) ) ( not ( = ?auto_126771 ?auto_126775 ) ) ( not ( = ?auto_126774 ?auto_126779 ) ) ( not ( = ?auto_126782 ?auto_126780 ) ) ( not ( = ?auto_126767 ?auto_126768 ) ) ( not ( = ?auto_126771 ?auto_126768 ) ) ( not ( = ?auto_126775 ?auto_126768 ) ) ( not ( = ?auto_126769 ?auto_126779 ) ) ( not ( = ?auto_126777 ?auto_126778 ) ) ( not ( = ?auto_126777 ?auto_126780 ) ) ( not ( = ?auto_126767 ?auto_126773 ) ) ( not ( = ?auto_126771 ?auto_126773 ) ) ( not ( = ?auto_126775 ?auto_126773 ) ) ( not ( = ?auto_126768 ?auto_126773 ) ) ( not ( = ?auto_126772 ?auto_126779 ) ) ( not ( = ?auto_126783 ?auto_126782 ) ) ( not ( = ?auto_126783 ?auto_126778 ) ) ( not ( = ?auto_126783 ?auto_126780 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_126766 ?auto_126767 ?auto_126770 ?auto_126771 ?auto_126774 ?auto_126775 ?auto_126772 ?auto_126773 ?auto_126769 ?auto_126768 )
      ( GET-5IMAGE-VERIFY ?auto_126766 ?auto_126767 ?auto_126769 ?auto_126768 ?auto_126770 ?auto_126771 ?auto_126772 ?auto_126773 ?auto_126774 ?auto_126775 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_126844 - DIRECTION
      ?auto_126845 - MODE
      ?auto_126847 - DIRECTION
      ?auto_126846 - MODE
      ?auto_126848 - DIRECTION
      ?auto_126849 - MODE
      ?auto_126850 - DIRECTION
      ?auto_126851 - MODE
      ?auto_126852 - DIRECTION
      ?auto_126853 - MODE
    )
    :vars
    (
      ?auto_126861 - INSTRUMENT
      ?auto_126854 - SATELLITE
      ?auto_126859 - DIRECTION
      ?auto_126855 - INSTRUMENT
      ?auto_126860 - INSTRUMENT
      ?auto_126856 - INSTRUMENT
      ?auto_126858 - INSTRUMENT
      ?auto_126857 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_126847 ?auto_126844 ) ) ( not ( = ?auto_126848 ?auto_126844 ) ) ( not ( = ?auto_126848 ?auto_126847 ) ) ( not ( = ?auto_126850 ?auto_126844 ) ) ( not ( = ?auto_126850 ?auto_126847 ) ) ( not ( = ?auto_126850 ?auto_126848 ) ) ( not ( = ?auto_126852 ?auto_126844 ) ) ( not ( = ?auto_126852 ?auto_126847 ) ) ( not ( = ?auto_126852 ?auto_126848 ) ) ( not ( = ?auto_126852 ?auto_126850 ) ) ( ON_BOARD ?auto_126861 ?auto_126854 ) ( SUPPORTS ?auto_126861 ?auto_126853 ) ( not ( = ?auto_126852 ?auto_126859 ) ) ( CALIBRATION_TARGET ?auto_126861 ?auto_126859 ) ( not ( = ?auto_126859 ?auto_126847 ) ) ( ON_BOARD ?auto_126855 ?auto_126854 ) ( not ( = ?auto_126861 ?auto_126855 ) ) ( SUPPORTS ?auto_126855 ?auto_126846 ) ( CALIBRATION_TARGET ?auto_126855 ?auto_126859 ) ( not ( = ?auto_126859 ?auto_126848 ) ) ( ON_BOARD ?auto_126860 ?auto_126854 ) ( not ( = ?auto_126855 ?auto_126860 ) ) ( SUPPORTS ?auto_126860 ?auto_126849 ) ( CALIBRATION_TARGET ?auto_126860 ?auto_126859 ) ( not ( = ?auto_126859 ?auto_126850 ) ) ( ON_BOARD ?auto_126856 ?auto_126854 ) ( not ( = ?auto_126860 ?auto_126856 ) ) ( SUPPORTS ?auto_126856 ?auto_126851 ) ( CALIBRATION_TARGET ?auto_126856 ?auto_126859 ) ( not ( = ?auto_126859 ?auto_126844 ) ) ( ON_BOARD ?auto_126858 ?auto_126854 ) ( not ( = ?auto_126856 ?auto_126858 ) ) ( SUPPORTS ?auto_126858 ?auto_126845 ) ( CALIBRATION_TARGET ?auto_126858 ?auto_126859 ) ( POWER_AVAIL ?auto_126854 ) ( POINTING ?auto_126854 ?auto_126857 ) ( not ( = ?auto_126859 ?auto_126857 ) ) ( not ( = ?auto_126844 ?auto_126857 ) ) ( not ( = ?auto_126845 ?auto_126851 ) ) ( not ( = ?auto_126850 ?auto_126857 ) ) ( not ( = ?auto_126845 ?auto_126849 ) ) ( not ( = ?auto_126851 ?auto_126849 ) ) ( not ( = ?auto_126848 ?auto_126857 ) ) ( not ( = ?auto_126860 ?auto_126858 ) ) ( not ( = ?auto_126845 ?auto_126846 ) ) ( not ( = ?auto_126851 ?auto_126846 ) ) ( not ( = ?auto_126849 ?auto_126846 ) ) ( not ( = ?auto_126847 ?auto_126857 ) ) ( not ( = ?auto_126855 ?auto_126856 ) ) ( not ( = ?auto_126855 ?auto_126858 ) ) ( not ( = ?auto_126845 ?auto_126853 ) ) ( not ( = ?auto_126851 ?auto_126853 ) ) ( not ( = ?auto_126849 ?auto_126853 ) ) ( not ( = ?auto_126846 ?auto_126853 ) ) ( not ( = ?auto_126852 ?auto_126857 ) ) ( not ( = ?auto_126861 ?auto_126860 ) ) ( not ( = ?auto_126861 ?auto_126856 ) ) ( not ( = ?auto_126861 ?auto_126858 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_126844 ?auto_126845 ?auto_126850 ?auto_126851 ?auto_126848 ?auto_126849 ?auto_126852 ?auto_126853 ?auto_126847 ?auto_126846 )
      ( GET-5IMAGE-VERIFY ?auto_126844 ?auto_126845 ?auto_126847 ?auto_126846 ?auto_126848 ?auto_126849 ?auto_126850 ?auto_126851 ?auto_126852 ?auto_126853 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_126922 - DIRECTION
      ?auto_126923 - MODE
      ?auto_126925 - DIRECTION
      ?auto_126924 - MODE
      ?auto_126926 - DIRECTION
      ?auto_126927 - MODE
      ?auto_126928 - DIRECTION
      ?auto_126929 - MODE
      ?auto_126930 - DIRECTION
      ?auto_126931 - MODE
    )
    :vars
    (
      ?auto_126939 - INSTRUMENT
      ?auto_126932 - SATELLITE
      ?auto_126937 - DIRECTION
      ?auto_126933 - INSTRUMENT
      ?auto_126938 - INSTRUMENT
      ?auto_126934 - INSTRUMENT
      ?auto_126936 - INSTRUMENT
      ?auto_126935 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_126925 ?auto_126922 ) ) ( not ( = ?auto_126926 ?auto_126922 ) ) ( not ( = ?auto_126926 ?auto_126925 ) ) ( not ( = ?auto_126928 ?auto_126922 ) ) ( not ( = ?auto_126928 ?auto_126925 ) ) ( not ( = ?auto_126928 ?auto_126926 ) ) ( not ( = ?auto_126930 ?auto_126922 ) ) ( not ( = ?auto_126930 ?auto_126925 ) ) ( not ( = ?auto_126930 ?auto_126926 ) ) ( not ( = ?auto_126930 ?auto_126928 ) ) ( ON_BOARD ?auto_126939 ?auto_126932 ) ( SUPPORTS ?auto_126939 ?auto_126929 ) ( not ( = ?auto_126928 ?auto_126937 ) ) ( CALIBRATION_TARGET ?auto_126939 ?auto_126937 ) ( not ( = ?auto_126937 ?auto_126925 ) ) ( ON_BOARD ?auto_126933 ?auto_126932 ) ( not ( = ?auto_126939 ?auto_126933 ) ) ( SUPPORTS ?auto_126933 ?auto_126924 ) ( CALIBRATION_TARGET ?auto_126933 ?auto_126937 ) ( not ( = ?auto_126937 ?auto_126926 ) ) ( ON_BOARD ?auto_126938 ?auto_126932 ) ( not ( = ?auto_126933 ?auto_126938 ) ) ( SUPPORTS ?auto_126938 ?auto_126927 ) ( CALIBRATION_TARGET ?auto_126938 ?auto_126937 ) ( not ( = ?auto_126937 ?auto_126930 ) ) ( ON_BOARD ?auto_126934 ?auto_126932 ) ( not ( = ?auto_126938 ?auto_126934 ) ) ( SUPPORTS ?auto_126934 ?auto_126931 ) ( CALIBRATION_TARGET ?auto_126934 ?auto_126937 ) ( not ( = ?auto_126937 ?auto_126922 ) ) ( ON_BOARD ?auto_126936 ?auto_126932 ) ( not ( = ?auto_126934 ?auto_126936 ) ) ( SUPPORTS ?auto_126936 ?auto_126923 ) ( CALIBRATION_TARGET ?auto_126936 ?auto_126937 ) ( POWER_AVAIL ?auto_126932 ) ( POINTING ?auto_126932 ?auto_126935 ) ( not ( = ?auto_126937 ?auto_126935 ) ) ( not ( = ?auto_126922 ?auto_126935 ) ) ( not ( = ?auto_126923 ?auto_126931 ) ) ( not ( = ?auto_126930 ?auto_126935 ) ) ( not ( = ?auto_126923 ?auto_126927 ) ) ( not ( = ?auto_126931 ?auto_126927 ) ) ( not ( = ?auto_126926 ?auto_126935 ) ) ( not ( = ?auto_126938 ?auto_126936 ) ) ( not ( = ?auto_126923 ?auto_126924 ) ) ( not ( = ?auto_126931 ?auto_126924 ) ) ( not ( = ?auto_126927 ?auto_126924 ) ) ( not ( = ?auto_126925 ?auto_126935 ) ) ( not ( = ?auto_126933 ?auto_126934 ) ) ( not ( = ?auto_126933 ?auto_126936 ) ) ( not ( = ?auto_126923 ?auto_126929 ) ) ( not ( = ?auto_126931 ?auto_126929 ) ) ( not ( = ?auto_126927 ?auto_126929 ) ) ( not ( = ?auto_126924 ?auto_126929 ) ) ( not ( = ?auto_126928 ?auto_126935 ) ) ( not ( = ?auto_126939 ?auto_126938 ) ) ( not ( = ?auto_126939 ?auto_126934 ) ) ( not ( = ?auto_126939 ?auto_126936 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_126922 ?auto_126923 ?auto_126930 ?auto_126931 ?auto_126926 ?auto_126927 ?auto_126928 ?auto_126929 ?auto_126925 ?auto_126924 )
      ( GET-5IMAGE-VERIFY ?auto_126922 ?auto_126923 ?auto_126925 ?auto_126924 ?auto_126926 ?auto_126927 ?auto_126928 ?auto_126929 ?auto_126930 ?auto_126931 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_127336 - DIRECTION
      ?auto_127337 - MODE
      ?auto_127339 - DIRECTION
      ?auto_127338 - MODE
      ?auto_127340 - DIRECTION
      ?auto_127341 - MODE
      ?auto_127342 - DIRECTION
      ?auto_127343 - MODE
      ?auto_127344 - DIRECTION
      ?auto_127345 - MODE
    )
    :vars
    (
      ?auto_127353 - INSTRUMENT
      ?auto_127346 - SATELLITE
      ?auto_127351 - DIRECTION
      ?auto_127347 - INSTRUMENT
      ?auto_127352 - INSTRUMENT
      ?auto_127348 - INSTRUMENT
      ?auto_127350 - INSTRUMENT
      ?auto_127349 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_127339 ?auto_127336 ) ) ( not ( = ?auto_127340 ?auto_127336 ) ) ( not ( = ?auto_127340 ?auto_127339 ) ) ( not ( = ?auto_127342 ?auto_127336 ) ) ( not ( = ?auto_127342 ?auto_127339 ) ) ( not ( = ?auto_127342 ?auto_127340 ) ) ( not ( = ?auto_127344 ?auto_127336 ) ) ( not ( = ?auto_127344 ?auto_127339 ) ) ( not ( = ?auto_127344 ?auto_127340 ) ) ( not ( = ?auto_127344 ?auto_127342 ) ) ( ON_BOARD ?auto_127353 ?auto_127346 ) ( SUPPORTS ?auto_127353 ?auto_127341 ) ( not ( = ?auto_127340 ?auto_127351 ) ) ( CALIBRATION_TARGET ?auto_127353 ?auto_127351 ) ( not ( = ?auto_127351 ?auto_127339 ) ) ( ON_BOARD ?auto_127347 ?auto_127346 ) ( not ( = ?auto_127353 ?auto_127347 ) ) ( SUPPORTS ?auto_127347 ?auto_127338 ) ( CALIBRATION_TARGET ?auto_127347 ?auto_127351 ) ( not ( = ?auto_127351 ?auto_127344 ) ) ( ON_BOARD ?auto_127352 ?auto_127346 ) ( not ( = ?auto_127347 ?auto_127352 ) ) ( SUPPORTS ?auto_127352 ?auto_127345 ) ( CALIBRATION_TARGET ?auto_127352 ?auto_127351 ) ( not ( = ?auto_127351 ?auto_127342 ) ) ( ON_BOARD ?auto_127348 ?auto_127346 ) ( not ( = ?auto_127352 ?auto_127348 ) ) ( SUPPORTS ?auto_127348 ?auto_127343 ) ( CALIBRATION_TARGET ?auto_127348 ?auto_127351 ) ( not ( = ?auto_127351 ?auto_127336 ) ) ( ON_BOARD ?auto_127350 ?auto_127346 ) ( not ( = ?auto_127348 ?auto_127350 ) ) ( SUPPORTS ?auto_127350 ?auto_127337 ) ( CALIBRATION_TARGET ?auto_127350 ?auto_127351 ) ( POWER_AVAIL ?auto_127346 ) ( POINTING ?auto_127346 ?auto_127349 ) ( not ( = ?auto_127351 ?auto_127349 ) ) ( not ( = ?auto_127336 ?auto_127349 ) ) ( not ( = ?auto_127337 ?auto_127343 ) ) ( not ( = ?auto_127342 ?auto_127349 ) ) ( not ( = ?auto_127337 ?auto_127345 ) ) ( not ( = ?auto_127343 ?auto_127345 ) ) ( not ( = ?auto_127344 ?auto_127349 ) ) ( not ( = ?auto_127352 ?auto_127350 ) ) ( not ( = ?auto_127337 ?auto_127338 ) ) ( not ( = ?auto_127343 ?auto_127338 ) ) ( not ( = ?auto_127345 ?auto_127338 ) ) ( not ( = ?auto_127339 ?auto_127349 ) ) ( not ( = ?auto_127347 ?auto_127348 ) ) ( not ( = ?auto_127347 ?auto_127350 ) ) ( not ( = ?auto_127337 ?auto_127341 ) ) ( not ( = ?auto_127343 ?auto_127341 ) ) ( not ( = ?auto_127345 ?auto_127341 ) ) ( not ( = ?auto_127338 ?auto_127341 ) ) ( not ( = ?auto_127340 ?auto_127349 ) ) ( not ( = ?auto_127353 ?auto_127352 ) ) ( not ( = ?auto_127353 ?auto_127348 ) ) ( not ( = ?auto_127353 ?auto_127350 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_127336 ?auto_127337 ?auto_127342 ?auto_127343 ?auto_127344 ?auto_127345 ?auto_127340 ?auto_127341 ?auto_127339 ?auto_127338 )
      ( GET-5IMAGE-VERIFY ?auto_127336 ?auto_127337 ?auto_127339 ?auto_127338 ?auto_127340 ?auto_127341 ?auto_127342 ?auto_127343 ?auto_127344 ?auto_127345 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_127414 - DIRECTION
      ?auto_127415 - MODE
      ?auto_127417 - DIRECTION
      ?auto_127416 - MODE
      ?auto_127418 - DIRECTION
      ?auto_127419 - MODE
      ?auto_127420 - DIRECTION
      ?auto_127421 - MODE
      ?auto_127422 - DIRECTION
      ?auto_127423 - MODE
    )
    :vars
    (
      ?auto_127431 - INSTRUMENT
      ?auto_127424 - SATELLITE
      ?auto_127429 - DIRECTION
      ?auto_127425 - INSTRUMENT
      ?auto_127430 - INSTRUMENT
      ?auto_127426 - INSTRUMENT
      ?auto_127428 - INSTRUMENT
      ?auto_127427 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_127417 ?auto_127414 ) ) ( not ( = ?auto_127418 ?auto_127414 ) ) ( not ( = ?auto_127418 ?auto_127417 ) ) ( not ( = ?auto_127420 ?auto_127414 ) ) ( not ( = ?auto_127420 ?auto_127417 ) ) ( not ( = ?auto_127420 ?auto_127418 ) ) ( not ( = ?auto_127422 ?auto_127414 ) ) ( not ( = ?auto_127422 ?auto_127417 ) ) ( not ( = ?auto_127422 ?auto_127418 ) ) ( not ( = ?auto_127422 ?auto_127420 ) ) ( ON_BOARD ?auto_127431 ?auto_127424 ) ( SUPPORTS ?auto_127431 ?auto_127419 ) ( not ( = ?auto_127418 ?auto_127429 ) ) ( CALIBRATION_TARGET ?auto_127431 ?auto_127429 ) ( not ( = ?auto_127429 ?auto_127417 ) ) ( ON_BOARD ?auto_127425 ?auto_127424 ) ( not ( = ?auto_127431 ?auto_127425 ) ) ( SUPPORTS ?auto_127425 ?auto_127416 ) ( CALIBRATION_TARGET ?auto_127425 ?auto_127429 ) ( not ( = ?auto_127429 ?auto_127420 ) ) ( ON_BOARD ?auto_127430 ?auto_127424 ) ( not ( = ?auto_127425 ?auto_127430 ) ) ( SUPPORTS ?auto_127430 ?auto_127421 ) ( CALIBRATION_TARGET ?auto_127430 ?auto_127429 ) ( not ( = ?auto_127429 ?auto_127422 ) ) ( ON_BOARD ?auto_127426 ?auto_127424 ) ( not ( = ?auto_127430 ?auto_127426 ) ) ( SUPPORTS ?auto_127426 ?auto_127423 ) ( CALIBRATION_TARGET ?auto_127426 ?auto_127429 ) ( not ( = ?auto_127429 ?auto_127414 ) ) ( ON_BOARD ?auto_127428 ?auto_127424 ) ( not ( = ?auto_127426 ?auto_127428 ) ) ( SUPPORTS ?auto_127428 ?auto_127415 ) ( CALIBRATION_TARGET ?auto_127428 ?auto_127429 ) ( POWER_AVAIL ?auto_127424 ) ( POINTING ?auto_127424 ?auto_127427 ) ( not ( = ?auto_127429 ?auto_127427 ) ) ( not ( = ?auto_127414 ?auto_127427 ) ) ( not ( = ?auto_127415 ?auto_127423 ) ) ( not ( = ?auto_127422 ?auto_127427 ) ) ( not ( = ?auto_127415 ?auto_127421 ) ) ( not ( = ?auto_127423 ?auto_127421 ) ) ( not ( = ?auto_127420 ?auto_127427 ) ) ( not ( = ?auto_127430 ?auto_127428 ) ) ( not ( = ?auto_127415 ?auto_127416 ) ) ( not ( = ?auto_127423 ?auto_127416 ) ) ( not ( = ?auto_127421 ?auto_127416 ) ) ( not ( = ?auto_127417 ?auto_127427 ) ) ( not ( = ?auto_127425 ?auto_127426 ) ) ( not ( = ?auto_127425 ?auto_127428 ) ) ( not ( = ?auto_127415 ?auto_127419 ) ) ( not ( = ?auto_127423 ?auto_127419 ) ) ( not ( = ?auto_127421 ?auto_127419 ) ) ( not ( = ?auto_127416 ?auto_127419 ) ) ( not ( = ?auto_127418 ?auto_127427 ) ) ( not ( = ?auto_127431 ?auto_127430 ) ) ( not ( = ?auto_127431 ?auto_127426 ) ) ( not ( = ?auto_127431 ?auto_127428 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_127414 ?auto_127415 ?auto_127422 ?auto_127423 ?auto_127420 ?auto_127421 ?auto_127418 ?auto_127419 ?auto_127417 ?auto_127416 )
      ( GET-5IMAGE-VERIFY ?auto_127414 ?auto_127415 ?auto_127417 ?auto_127416 ?auto_127418 ?auto_127419 ?auto_127420 ?auto_127421 ?auto_127422 ?auto_127423 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_128522 - DIRECTION
      ?auto_128523 - MODE
      ?auto_128525 - DIRECTION
      ?auto_128524 - MODE
      ?auto_128526 - DIRECTION
      ?auto_128527 - MODE
      ?auto_128528 - DIRECTION
      ?auto_128529 - MODE
      ?auto_128530 - DIRECTION
      ?auto_128531 - MODE
    )
    :vars
    (
      ?auto_128539 - INSTRUMENT
      ?auto_128532 - SATELLITE
      ?auto_128537 - DIRECTION
      ?auto_128533 - INSTRUMENT
      ?auto_128538 - INSTRUMENT
      ?auto_128534 - INSTRUMENT
      ?auto_128536 - INSTRUMENT
      ?auto_128535 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_128525 ?auto_128522 ) ) ( not ( = ?auto_128526 ?auto_128522 ) ) ( not ( = ?auto_128526 ?auto_128525 ) ) ( not ( = ?auto_128528 ?auto_128522 ) ) ( not ( = ?auto_128528 ?auto_128525 ) ) ( not ( = ?auto_128528 ?auto_128526 ) ) ( not ( = ?auto_128530 ?auto_128522 ) ) ( not ( = ?auto_128530 ?auto_128525 ) ) ( not ( = ?auto_128530 ?auto_128526 ) ) ( not ( = ?auto_128530 ?auto_128528 ) ) ( ON_BOARD ?auto_128539 ?auto_128532 ) ( SUPPORTS ?auto_128539 ?auto_128524 ) ( not ( = ?auto_128525 ?auto_128537 ) ) ( CALIBRATION_TARGET ?auto_128539 ?auto_128537 ) ( not ( = ?auto_128537 ?auto_128530 ) ) ( ON_BOARD ?auto_128533 ?auto_128532 ) ( not ( = ?auto_128539 ?auto_128533 ) ) ( SUPPORTS ?auto_128533 ?auto_128531 ) ( CALIBRATION_TARGET ?auto_128533 ?auto_128537 ) ( not ( = ?auto_128537 ?auto_128528 ) ) ( ON_BOARD ?auto_128538 ?auto_128532 ) ( not ( = ?auto_128533 ?auto_128538 ) ) ( SUPPORTS ?auto_128538 ?auto_128529 ) ( CALIBRATION_TARGET ?auto_128538 ?auto_128537 ) ( not ( = ?auto_128537 ?auto_128526 ) ) ( ON_BOARD ?auto_128534 ?auto_128532 ) ( not ( = ?auto_128538 ?auto_128534 ) ) ( SUPPORTS ?auto_128534 ?auto_128527 ) ( CALIBRATION_TARGET ?auto_128534 ?auto_128537 ) ( not ( = ?auto_128537 ?auto_128522 ) ) ( ON_BOARD ?auto_128536 ?auto_128532 ) ( not ( = ?auto_128534 ?auto_128536 ) ) ( SUPPORTS ?auto_128536 ?auto_128523 ) ( CALIBRATION_TARGET ?auto_128536 ?auto_128537 ) ( POWER_AVAIL ?auto_128532 ) ( POINTING ?auto_128532 ?auto_128535 ) ( not ( = ?auto_128537 ?auto_128535 ) ) ( not ( = ?auto_128522 ?auto_128535 ) ) ( not ( = ?auto_128523 ?auto_128527 ) ) ( not ( = ?auto_128526 ?auto_128535 ) ) ( not ( = ?auto_128523 ?auto_128529 ) ) ( not ( = ?auto_128527 ?auto_128529 ) ) ( not ( = ?auto_128528 ?auto_128535 ) ) ( not ( = ?auto_128538 ?auto_128536 ) ) ( not ( = ?auto_128523 ?auto_128531 ) ) ( not ( = ?auto_128527 ?auto_128531 ) ) ( not ( = ?auto_128529 ?auto_128531 ) ) ( not ( = ?auto_128530 ?auto_128535 ) ) ( not ( = ?auto_128533 ?auto_128534 ) ) ( not ( = ?auto_128533 ?auto_128536 ) ) ( not ( = ?auto_128523 ?auto_128524 ) ) ( not ( = ?auto_128527 ?auto_128524 ) ) ( not ( = ?auto_128529 ?auto_128524 ) ) ( not ( = ?auto_128531 ?auto_128524 ) ) ( not ( = ?auto_128525 ?auto_128535 ) ) ( not ( = ?auto_128539 ?auto_128538 ) ) ( not ( = ?auto_128539 ?auto_128534 ) ) ( not ( = ?auto_128539 ?auto_128536 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_128522 ?auto_128523 ?auto_128526 ?auto_128527 ?auto_128528 ?auto_128529 ?auto_128525 ?auto_128524 ?auto_128530 ?auto_128531 )
      ( GET-5IMAGE-VERIFY ?auto_128522 ?auto_128523 ?auto_128525 ?auto_128524 ?auto_128526 ?auto_128527 ?auto_128528 ?auto_128529 ?auto_128530 ?auto_128531 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_128600 - DIRECTION
      ?auto_128601 - MODE
      ?auto_128603 - DIRECTION
      ?auto_128602 - MODE
      ?auto_128604 - DIRECTION
      ?auto_128605 - MODE
      ?auto_128606 - DIRECTION
      ?auto_128607 - MODE
      ?auto_128608 - DIRECTION
      ?auto_128609 - MODE
    )
    :vars
    (
      ?auto_128617 - INSTRUMENT
      ?auto_128610 - SATELLITE
      ?auto_128615 - DIRECTION
      ?auto_128611 - INSTRUMENT
      ?auto_128616 - INSTRUMENT
      ?auto_128612 - INSTRUMENT
      ?auto_128614 - INSTRUMENT
      ?auto_128613 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_128603 ?auto_128600 ) ) ( not ( = ?auto_128604 ?auto_128600 ) ) ( not ( = ?auto_128604 ?auto_128603 ) ) ( not ( = ?auto_128606 ?auto_128600 ) ) ( not ( = ?auto_128606 ?auto_128603 ) ) ( not ( = ?auto_128606 ?auto_128604 ) ) ( not ( = ?auto_128608 ?auto_128600 ) ) ( not ( = ?auto_128608 ?auto_128603 ) ) ( not ( = ?auto_128608 ?auto_128604 ) ) ( not ( = ?auto_128608 ?auto_128606 ) ) ( ON_BOARD ?auto_128617 ?auto_128610 ) ( SUPPORTS ?auto_128617 ?auto_128602 ) ( not ( = ?auto_128603 ?auto_128615 ) ) ( CALIBRATION_TARGET ?auto_128617 ?auto_128615 ) ( not ( = ?auto_128615 ?auto_128606 ) ) ( ON_BOARD ?auto_128611 ?auto_128610 ) ( not ( = ?auto_128617 ?auto_128611 ) ) ( SUPPORTS ?auto_128611 ?auto_128607 ) ( CALIBRATION_TARGET ?auto_128611 ?auto_128615 ) ( not ( = ?auto_128615 ?auto_128608 ) ) ( ON_BOARD ?auto_128616 ?auto_128610 ) ( not ( = ?auto_128611 ?auto_128616 ) ) ( SUPPORTS ?auto_128616 ?auto_128609 ) ( CALIBRATION_TARGET ?auto_128616 ?auto_128615 ) ( not ( = ?auto_128615 ?auto_128604 ) ) ( ON_BOARD ?auto_128612 ?auto_128610 ) ( not ( = ?auto_128616 ?auto_128612 ) ) ( SUPPORTS ?auto_128612 ?auto_128605 ) ( CALIBRATION_TARGET ?auto_128612 ?auto_128615 ) ( not ( = ?auto_128615 ?auto_128600 ) ) ( ON_BOARD ?auto_128614 ?auto_128610 ) ( not ( = ?auto_128612 ?auto_128614 ) ) ( SUPPORTS ?auto_128614 ?auto_128601 ) ( CALIBRATION_TARGET ?auto_128614 ?auto_128615 ) ( POWER_AVAIL ?auto_128610 ) ( POINTING ?auto_128610 ?auto_128613 ) ( not ( = ?auto_128615 ?auto_128613 ) ) ( not ( = ?auto_128600 ?auto_128613 ) ) ( not ( = ?auto_128601 ?auto_128605 ) ) ( not ( = ?auto_128604 ?auto_128613 ) ) ( not ( = ?auto_128601 ?auto_128609 ) ) ( not ( = ?auto_128605 ?auto_128609 ) ) ( not ( = ?auto_128608 ?auto_128613 ) ) ( not ( = ?auto_128616 ?auto_128614 ) ) ( not ( = ?auto_128601 ?auto_128607 ) ) ( not ( = ?auto_128605 ?auto_128607 ) ) ( not ( = ?auto_128609 ?auto_128607 ) ) ( not ( = ?auto_128606 ?auto_128613 ) ) ( not ( = ?auto_128611 ?auto_128612 ) ) ( not ( = ?auto_128611 ?auto_128614 ) ) ( not ( = ?auto_128601 ?auto_128602 ) ) ( not ( = ?auto_128605 ?auto_128602 ) ) ( not ( = ?auto_128609 ?auto_128602 ) ) ( not ( = ?auto_128607 ?auto_128602 ) ) ( not ( = ?auto_128603 ?auto_128613 ) ) ( not ( = ?auto_128617 ?auto_128616 ) ) ( not ( = ?auto_128617 ?auto_128612 ) ) ( not ( = ?auto_128617 ?auto_128614 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_128600 ?auto_128601 ?auto_128604 ?auto_128605 ?auto_128608 ?auto_128609 ?auto_128603 ?auto_128602 ?auto_128606 ?auto_128607 )
      ( GET-5IMAGE-VERIFY ?auto_128600 ?auto_128601 ?auto_128603 ?auto_128602 ?auto_128604 ?auto_128605 ?auto_128606 ?auto_128607 ?auto_128608 ?auto_128609 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_128930 - DIRECTION
      ?auto_128931 - MODE
      ?auto_128933 - DIRECTION
      ?auto_128932 - MODE
      ?auto_128934 - DIRECTION
      ?auto_128935 - MODE
      ?auto_128936 - DIRECTION
      ?auto_128937 - MODE
      ?auto_128938 - DIRECTION
      ?auto_128939 - MODE
    )
    :vars
    (
      ?auto_128947 - INSTRUMENT
      ?auto_128940 - SATELLITE
      ?auto_128945 - DIRECTION
      ?auto_128941 - INSTRUMENT
      ?auto_128946 - INSTRUMENT
      ?auto_128942 - INSTRUMENT
      ?auto_128944 - INSTRUMENT
      ?auto_128943 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_128933 ?auto_128930 ) ) ( not ( = ?auto_128934 ?auto_128930 ) ) ( not ( = ?auto_128934 ?auto_128933 ) ) ( not ( = ?auto_128936 ?auto_128930 ) ) ( not ( = ?auto_128936 ?auto_128933 ) ) ( not ( = ?auto_128936 ?auto_128934 ) ) ( not ( = ?auto_128938 ?auto_128930 ) ) ( not ( = ?auto_128938 ?auto_128933 ) ) ( not ( = ?auto_128938 ?auto_128934 ) ) ( not ( = ?auto_128938 ?auto_128936 ) ) ( ON_BOARD ?auto_128947 ?auto_128940 ) ( SUPPORTS ?auto_128947 ?auto_128932 ) ( not ( = ?auto_128933 ?auto_128945 ) ) ( CALIBRATION_TARGET ?auto_128947 ?auto_128945 ) ( not ( = ?auto_128945 ?auto_128938 ) ) ( ON_BOARD ?auto_128941 ?auto_128940 ) ( not ( = ?auto_128947 ?auto_128941 ) ) ( SUPPORTS ?auto_128941 ?auto_128939 ) ( CALIBRATION_TARGET ?auto_128941 ?auto_128945 ) ( not ( = ?auto_128945 ?auto_128934 ) ) ( ON_BOARD ?auto_128946 ?auto_128940 ) ( not ( = ?auto_128941 ?auto_128946 ) ) ( SUPPORTS ?auto_128946 ?auto_128935 ) ( CALIBRATION_TARGET ?auto_128946 ?auto_128945 ) ( not ( = ?auto_128945 ?auto_128936 ) ) ( ON_BOARD ?auto_128942 ?auto_128940 ) ( not ( = ?auto_128946 ?auto_128942 ) ) ( SUPPORTS ?auto_128942 ?auto_128937 ) ( CALIBRATION_TARGET ?auto_128942 ?auto_128945 ) ( not ( = ?auto_128945 ?auto_128930 ) ) ( ON_BOARD ?auto_128944 ?auto_128940 ) ( not ( = ?auto_128942 ?auto_128944 ) ) ( SUPPORTS ?auto_128944 ?auto_128931 ) ( CALIBRATION_TARGET ?auto_128944 ?auto_128945 ) ( POWER_AVAIL ?auto_128940 ) ( POINTING ?auto_128940 ?auto_128943 ) ( not ( = ?auto_128945 ?auto_128943 ) ) ( not ( = ?auto_128930 ?auto_128943 ) ) ( not ( = ?auto_128931 ?auto_128937 ) ) ( not ( = ?auto_128936 ?auto_128943 ) ) ( not ( = ?auto_128931 ?auto_128935 ) ) ( not ( = ?auto_128937 ?auto_128935 ) ) ( not ( = ?auto_128934 ?auto_128943 ) ) ( not ( = ?auto_128946 ?auto_128944 ) ) ( not ( = ?auto_128931 ?auto_128939 ) ) ( not ( = ?auto_128937 ?auto_128939 ) ) ( not ( = ?auto_128935 ?auto_128939 ) ) ( not ( = ?auto_128938 ?auto_128943 ) ) ( not ( = ?auto_128941 ?auto_128942 ) ) ( not ( = ?auto_128941 ?auto_128944 ) ) ( not ( = ?auto_128931 ?auto_128932 ) ) ( not ( = ?auto_128937 ?auto_128932 ) ) ( not ( = ?auto_128935 ?auto_128932 ) ) ( not ( = ?auto_128939 ?auto_128932 ) ) ( not ( = ?auto_128933 ?auto_128943 ) ) ( not ( = ?auto_128947 ?auto_128946 ) ) ( not ( = ?auto_128947 ?auto_128942 ) ) ( not ( = ?auto_128947 ?auto_128944 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_128930 ?auto_128931 ?auto_128936 ?auto_128937 ?auto_128934 ?auto_128935 ?auto_128933 ?auto_128932 ?auto_128938 ?auto_128939 )
      ( GET-5IMAGE-VERIFY ?auto_128930 ?auto_128931 ?auto_128933 ?auto_128932 ?auto_128934 ?auto_128935 ?auto_128936 ?auto_128937 ?auto_128938 ?auto_128939 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_129094 - DIRECTION
      ?auto_129095 - MODE
      ?auto_129097 - DIRECTION
      ?auto_129096 - MODE
      ?auto_129098 - DIRECTION
      ?auto_129099 - MODE
      ?auto_129100 - DIRECTION
      ?auto_129101 - MODE
      ?auto_129102 - DIRECTION
      ?auto_129103 - MODE
    )
    :vars
    (
      ?auto_129111 - INSTRUMENT
      ?auto_129104 - SATELLITE
      ?auto_129109 - DIRECTION
      ?auto_129105 - INSTRUMENT
      ?auto_129110 - INSTRUMENT
      ?auto_129106 - INSTRUMENT
      ?auto_129108 - INSTRUMENT
      ?auto_129107 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_129097 ?auto_129094 ) ) ( not ( = ?auto_129098 ?auto_129094 ) ) ( not ( = ?auto_129098 ?auto_129097 ) ) ( not ( = ?auto_129100 ?auto_129094 ) ) ( not ( = ?auto_129100 ?auto_129097 ) ) ( not ( = ?auto_129100 ?auto_129098 ) ) ( not ( = ?auto_129102 ?auto_129094 ) ) ( not ( = ?auto_129102 ?auto_129097 ) ) ( not ( = ?auto_129102 ?auto_129098 ) ) ( not ( = ?auto_129102 ?auto_129100 ) ) ( ON_BOARD ?auto_129111 ?auto_129104 ) ( SUPPORTS ?auto_129111 ?auto_129096 ) ( not ( = ?auto_129097 ?auto_129109 ) ) ( CALIBRATION_TARGET ?auto_129111 ?auto_129109 ) ( not ( = ?auto_129109 ?auto_129100 ) ) ( ON_BOARD ?auto_129105 ?auto_129104 ) ( not ( = ?auto_129111 ?auto_129105 ) ) ( SUPPORTS ?auto_129105 ?auto_129101 ) ( CALIBRATION_TARGET ?auto_129105 ?auto_129109 ) ( not ( = ?auto_129109 ?auto_129098 ) ) ( ON_BOARD ?auto_129110 ?auto_129104 ) ( not ( = ?auto_129105 ?auto_129110 ) ) ( SUPPORTS ?auto_129110 ?auto_129099 ) ( CALIBRATION_TARGET ?auto_129110 ?auto_129109 ) ( not ( = ?auto_129109 ?auto_129102 ) ) ( ON_BOARD ?auto_129106 ?auto_129104 ) ( not ( = ?auto_129110 ?auto_129106 ) ) ( SUPPORTS ?auto_129106 ?auto_129103 ) ( CALIBRATION_TARGET ?auto_129106 ?auto_129109 ) ( not ( = ?auto_129109 ?auto_129094 ) ) ( ON_BOARD ?auto_129108 ?auto_129104 ) ( not ( = ?auto_129106 ?auto_129108 ) ) ( SUPPORTS ?auto_129108 ?auto_129095 ) ( CALIBRATION_TARGET ?auto_129108 ?auto_129109 ) ( POWER_AVAIL ?auto_129104 ) ( POINTING ?auto_129104 ?auto_129107 ) ( not ( = ?auto_129109 ?auto_129107 ) ) ( not ( = ?auto_129094 ?auto_129107 ) ) ( not ( = ?auto_129095 ?auto_129103 ) ) ( not ( = ?auto_129102 ?auto_129107 ) ) ( not ( = ?auto_129095 ?auto_129099 ) ) ( not ( = ?auto_129103 ?auto_129099 ) ) ( not ( = ?auto_129098 ?auto_129107 ) ) ( not ( = ?auto_129110 ?auto_129108 ) ) ( not ( = ?auto_129095 ?auto_129101 ) ) ( not ( = ?auto_129103 ?auto_129101 ) ) ( not ( = ?auto_129099 ?auto_129101 ) ) ( not ( = ?auto_129100 ?auto_129107 ) ) ( not ( = ?auto_129105 ?auto_129106 ) ) ( not ( = ?auto_129105 ?auto_129108 ) ) ( not ( = ?auto_129095 ?auto_129096 ) ) ( not ( = ?auto_129103 ?auto_129096 ) ) ( not ( = ?auto_129099 ?auto_129096 ) ) ( not ( = ?auto_129101 ?auto_129096 ) ) ( not ( = ?auto_129097 ?auto_129107 ) ) ( not ( = ?auto_129111 ?auto_129110 ) ) ( not ( = ?auto_129111 ?auto_129106 ) ) ( not ( = ?auto_129111 ?auto_129108 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_129094 ?auto_129095 ?auto_129102 ?auto_129103 ?auto_129098 ?auto_129099 ?auto_129097 ?auto_129096 ?auto_129100 ?auto_129101 )
      ( GET-5IMAGE-VERIFY ?auto_129094 ?auto_129095 ?auto_129097 ?auto_129096 ?auto_129098 ?auto_129099 ?auto_129100 ?auto_129101 ?auto_129102 ?auto_129103 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_129424 - DIRECTION
      ?auto_129425 - MODE
      ?auto_129427 - DIRECTION
      ?auto_129426 - MODE
      ?auto_129428 - DIRECTION
      ?auto_129429 - MODE
      ?auto_129430 - DIRECTION
      ?auto_129431 - MODE
      ?auto_129432 - DIRECTION
      ?auto_129433 - MODE
    )
    :vars
    (
      ?auto_129441 - INSTRUMENT
      ?auto_129434 - SATELLITE
      ?auto_129439 - DIRECTION
      ?auto_129435 - INSTRUMENT
      ?auto_129440 - INSTRUMENT
      ?auto_129436 - INSTRUMENT
      ?auto_129438 - INSTRUMENT
      ?auto_129437 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_129427 ?auto_129424 ) ) ( not ( = ?auto_129428 ?auto_129424 ) ) ( not ( = ?auto_129428 ?auto_129427 ) ) ( not ( = ?auto_129430 ?auto_129424 ) ) ( not ( = ?auto_129430 ?auto_129427 ) ) ( not ( = ?auto_129430 ?auto_129428 ) ) ( not ( = ?auto_129432 ?auto_129424 ) ) ( not ( = ?auto_129432 ?auto_129427 ) ) ( not ( = ?auto_129432 ?auto_129428 ) ) ( not ( = ?auto_129432 ?auto_129430 ) ) ( ON_BOARD ?auto_129441 ?auto_129434 ) ( SUPPORTS ?auto_129441 ?auto_129426 ) ( not ( = ?auto_129427 ?auto_129439 ) ) ( CALIBRATION_TARGET ?auto_129441 ?auto_129439 ) ( not ( = ?auto_129439 ?auto_129428 ) ) ( ON_BOARD ?auto_129435 ?auto_129434 ) ( not ( = ?auto_129441 ?auto_129435 ) ) ( SUPPORTS ?auto_129435 ?auto_129429 ) ( CALIBRATION_TARGET ?auto_129435 ?auto_129439 ) ( not ( = ?auto_129439 ?auto_129432 ) ) ( ON_BOARD ?auto_129440 ?auto_129434 ) ( not ( = ?auto_129435 ?auto_129440 ) ) ( SUPPORTS ?auto_129440 ?auto_129433 ) ( CALIBRATION_TARGET ?auto_129440 ?auto_129439 ) ( not ( = ?auto_129439 ?auto_129430 ) ) ( ON_BOARD ?auto_129436 ?auto_129434 ) ( not ( = ?auto_129440 ?auto_129436 ) ) ( SUPPORTS ?auto_129436 ?auto_129431 ) ( CALIBRATION_TARGET ?auto_129436 ?auto_129439 ) ( not ( = ?auto_129439 ?auto_129424 ) ) ( ON_BOARD ?auto_129438 ?auto_129434 ) ( not ( = ?auto_129436 ?auto_129438 ) ) ( SUPPORTS ?auto_129438 ?auto_129425 ) ( CALIBRATION_TARGET ?auto_129438 ?auto_129439 ) ( POWER_AVAIL ?auto_129434 ) ( POINTING ?auto_129434 ?auto_129437 ) ( not ( = ?auto_129439 ?auto_129437 ) ) ( not ( = ?auto_129424 ?auto_129437 ) ) ( not ( = ?auto_129425 ?auto_129431 ) ) ( not ( = ?auto_129430 ?auto_129437 ) ) ( not ( = ?auto_129425 ?auto_129433 ) ) ( not ( = ?auto_129431 ?auto_129433 ) ) ( not ( = ?auto_129432 ?auto_129437 ) ) ( not ( = ?auto_129440 ?auto_129438 ) ) ( not ( = ?auto_129425 ?auto_129429 ) ) ( not ( = ?auto_129431 ?auto_129429 ) ) ( not ( = ?auto_129433 ?auto_129429 ) ) ( not ( = ?auto_129428 ?auto_129437 ) ) ( not ( = ?auto_129435 ?auto_129436 ) ) ( not ( = ?auto_129435 ?auto_129438 ) ) ( not ( = ?auto_129425 ?auto_129426 ) ) ( not ( = ?auto_129431 ?auto_129426 ) ) ( not ( = ?auto_129433 ?auto_129426 ) ) ( not ( = ?auto_129429 ?auto_129426 ) ) ( not ( = ?auto_129427 ?auto_129437 ) ) ( not ( = ?auto_129441 ?auto_129440 ) ) ( not ( = ?auto_129441 ?auto_129436 ) ) ( not ( = ?auto_129441 ?auto_129438 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_129424 ?auto_129425 ?auto_129430 ?auto_129431 ?auto_129432 ?auto_129433 ?auto_129427 ?auto_129426 ?auto_129428 ?auto_129429 )
      ( GET-5IMAGE-VERIFY ?auto_129424 ?auto_129425 ?auto_129427 ?auto_129426 ?auto_129428 ?auto_129429 ?auto_129430 ?auto_129431 ?auto_129432 ?auto_129433 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_129502 - DIRECTION
      ?auto_129503 - MODE
      ?auto_129505 - DIRECTION
      ?auto_129504 - MODE
      ?auto_129506 - DIRECTION
      ?auto_129507 - MODE
      ?auto_129508 - DIRECTION
      ?auto_129509 - MODE
      ?auto_129510 - DIRECTION
      ?auto_129511 - MODE
    )
    :vars
    (
      ?auto_129519 - INSTRUMENT
      ?auto_129512 - SATELLITE
      ?auto_129517 - DIRECTION
      ?auto_129513 - INSTRUMENT
      ?auto_129518 - INSTRUMENT
      ?auto_129514 - INSTRUMENT
      ?auto_129516 - INSTRUMENT
      ?auto_129515 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_129505 ?auto_129502 ) ) ( not ( = ?auto_129506 ?auto_129502 ) ) ( not ( = ?auto_129506 ?auto_129505 ) ) ( not ( = ?auto_129508 ?auto_129502 ) ) ( not ( = ?auto_129508 ?auto_129505 ) ) ( not ( = ?auto_129508 ?auto_129506 ) ) ( not ( = ?auto_129510 ?auto_129502 ) ) ( not ( = ?auto_129510 ?auto_129505 ) ) ( not ( = ?auto_129510 ?auto_129506 ) ) ( not ( = ?auto_129510 ?auto_129508 ) ) ( ON_BOARD ?auto_129519 ?auto_129512 ) ( SUPPORTS ?auto_129519 ?auto_129504 ) ( not ( = ?auto_129505 ?auto_129517 ) ) ( CALIBRATION_TARGET ?auto_129519 ?auto_129517 ) ( not ( = ?auto_129517 ?auto_129506 ) ) ( ON_BOARD ?auto_129513 ?auto_129512 ) ( not ( = ?auto_129519 ?auto_129513 ) ) ( SUPPORTS ?auto_129513 ?auto_129507 ) ( CALIBRATION_TARGET ?auto_129513 ?auto_129517 ) ( not ( = ?auto_129517 ?auto_129508 ) ) ( ON_BOARD ?auto_129518 ?auto_129512 ) ( not ( = ?auto_129513 ?auto_129518 ) ) ( SUPPORTS ?auto_129518 ?auto_129509 ) ( CALIBRATION_TARGET ?auto_129518 ?auto_129517 ) ( not ( = ?auto_129517 ?auto_129510 ) ) ( ON_BOARD ?auto_129514 ?auto_129512 ) ( not ( = ?auto_129518 ?auto_129514 ) ) ( SUPPORTS ?auto_129514 ?auto_129511 ) ( CALIBRATION_TARGET ?auto_129514 ?auto_129517 ) ( not ( = ?auto_129517 ?auto_129502 ) ) ( ON_BOARD ?auto_129516 ?auto_129512 ) ( not ( = ?auto_129514 ?auto_129516 ) ) ( SUPPORTS ?auto_129516 ?auto_129503 ) ( CALIBRATION_TARGET ?auto_129516 ?auto_129517 ) ( POWER_AVAIL ?auto_129512 ) ( POINTING ?auto_129512 ?auto_129515 ) ( not ( = ?auto_129517 ?auto_129515 ) ) ( not ( = ?auto_129502 ?auto_129515 ) ) ( not ( = ?auto_129503 ?auto_129511 ) ) ( not ( = ?auto_129510 ?auto_129515 ) ) ( not ( = ?auto_129503 ?auto_129509 ) ) ( not ( = ?auto_129511 ?auto_129509 ) ) ( not ( = ?auto_129508 ?auto_129515 ) ) ( not ( = ?auto_129518 ?auto_129516 ) ) ( not ( = ?auto_129503 ?auto_129507 ) ) ( not ( = ?auto_129511 ?auto_129507 ) ) ( not ( = ?auto_129509 ?auto_129507 ) ) ( not ( = ?auto_129506 ?auto_129515 ) ) ( not ( = ?auto_129513 ?auto_129514 ) ) ( not ( = ?auto_129513 ?auto_129516 ) ) ( not ( = ?auto_129503 ?auto_129504 ) ) ( not ( = ?auto_129511 ?auto_129504 ) ) ( not ( = ?auto_129509 ?auto_129504 ) ) ( not ( = ?auto_129507 ?auto_129504 ) ) ( not ( = ?auto_129505 ?auto_129515 ) ) ( not ( = ?auto_129519 ?auto_129518 ) ) ( not ( = ?auto_129519 ?auto_129514 ) ) ( not ( = ?auto_129519 ?auto_129516 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_129502 ?auto_129503 ?auto_129510 ?auto_129511 ?auto_129508 ?auto_129509 ?auto_129505 ?auto_129504 ?auto_129506 ?auto_129507 )
      ( GET-5IMAGE-VERIFY ?auto_129502 ?auto_129503 ?auto_129505 ?auto_129504 ?auto_129506 ?auto_129507 ?auto_129508 ?auto_129509 ?auto_129510 ?auto_129511 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_130778 - DIRECTION
      ?auto_130779 - MODE
      ?auto_130781 - DIRECTION
      ?auto_130780 - MODE
      ?auto_130782 - DIRECTION
      ?auto_130783 - MODE
      ?auto_130784 - DIRECTION
      ?auto_130785 - MODE
      ?auto_130786 - DIRECTION
      ?auto_130787 - MODE
    )
    :vars
    (
      ?auto_130795 - INSTRUMENT
      ?auto_130788 - SATELLITE
      ?auto_130793 - DIRECTION
      ?auto_130789 - INSTRUMENT
      ?auto_130794 - INSTRUMENT
      ?auto_130790 - INSTRUMENT
      ?auto_130792 - INSTRUMENT
      ?auto_130791 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_130781 ?auto_130778 ) ) ( not ( = ?auto_130782 ?auto_130778 ) ) ( not ( = ?auto_130782 ?auto_130781 ) ) ( not ( = ?auto_130784 ?auto_130778 ) ) ( not ( = ?auto_130784 ?auto_130781 ) ) ( not ( = ?auto_130784 ?auto_130782 ) ) ( not ( = ?auto_130786 ?auto_130778 ) ) ( not ( = ?auto_130786 ?auto_130781 ) ) ( not ( = ?auto_130786 ?auto_130782 ) ) ( not ( = ?auto_130786 ?auto_130784 ) ) ( ON_BOARD ?auto_130795 ?auto_130788 ) ( SUPPORTS ?auto_130795 ?auto_130787 ) ( not ( = ?auto_130786 ?auto_130793 ) ) ( CALIBRATION_TARGET ?auto_130795 ?auto_130793 ) ( not ( = ?auto_130793 ?auto_130784 ) ) ( ON_BOARD ?auto_130789 ?auto_130788 ) ( not ( = ?auto_130795 ?auto_130789 ) ) ( SUPPORTS ?auto_130789 ?auto_130785 ) ( CALIBRATION_TARGET ?auto_130789 ?auto_130793 ) ( not ( = ?auto_130793 ?auto_130782 ) ) ( ON_BOARD ?auto_130794 ?auto_130788 ) ( not ( = ?auto_130789 ?auto_130794 ) ) ( SUPPORTS ?auto_130794 ?auto_130783 ) ( CALIBRATION_TARGET ?auto_130794 ?auto_130793 ) ( not ( = ?auto_130793 ?auto_130778 ) ) ( ON_BOARD ?auto_130790 ?auto_130788 ) ( not ( = ?auto_130794 ?auto_130790 ) ) ( SUPPORTS ?auto_130790 ?auto_130779 ) ( CALIBRATION_TARGET ?auto_130790 ?auto_130793 ) ( not ( = ?auto_130793 ?auto_130781 ) ) ( ON_BOARD ?auto_130792 ?auto_130788 ) ( not ( = ?auto_130790 ?auto_130792 ) ) ( SUPPORTS ?auto_130792 ?auto_130780 ) ( CALIBRATION_TARGET ?auto_130792 ?auto_130793 ) ( POWER_AVAIL ?auto_130788 ) ( POINTING ?auto_130788 ?auto_130791 ) ( not ( = ?auto_130793 ?auto_130791 ) ) ( not ( = ?auto_130781 ?auto_130791 ) ) ( not ( = ?auto_130780 ?auto_130779 ) ) ( not ( = ?auto_130778 ?auto_130791 ) ) ( not ( = ?auto_130780 ?auto_130783 ) ) ( not ( = ?auto_130779 ?auto_130783 ) ) ( not ( = ?auto_130782 ?auto_130791 ) ) ( not ( = ?auto_130794 ?auto_130792 ) ) ( not ( = ?auto_130780 ?auto_130785 ) ) ( not ( = ?auto_130779 ?auto_130785 ) ) ( not ( = ?auto_130783 ?auto_130785 ) ) ( not ( = ?auto_130784 ?auto_130791 ) ) ( not ( = ?auto_130789 ?auto_130790 ) ) ( not ( = ?auto_130789 ?auto_130792 ) ) ( not ( = ?auto_130780 ?auto_130787 ) ) ( not ( = ?auto_130779 ?auto_130787 ) ) ( not ( = ?auto_130783 ?auto_130787 ) ) ( not ( = ?auto_130785 ?auto_130787 ) ) ( not ( = ?auto_130786 ?auto_130791 ) ) ( not ( = ?auto_130795 ?auto_130794 ) ) ( not ( = ?auto_130795 ?auto_130790 ) ) ( not ( = ?auto_130795 ?auto_130792 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_130781 ?auto_130780 ?auto_130778 ?auto_130779 ?auto_130782 ?auto_130783 ?auto_130786 ?auto_130787 ?auto_130784 ?auto_130785 )
      ( GET-5IMAGE-VERIFY ?auto_130778 ?auto_130779 ?auto_130781 ?auto_130780 ?auto_130782 ?auto_130783 ?auto_130784 ?auto_130785 ?auto_130786 ?auto_130787 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_130856 - DIRECTION
      ?auto_130857 - MODE
      ?auto_130859 - DIRECTION
      ?auto_130858 - MODE
      ?auto_130860 - DIRECTION
      ?auto_130861 - MODE
      ?auto_130862 - DIRECTION
      ?auto_130863 - MODE
      ?auto_130864 - DIRECTION
      ?auto_130865 - MODE
    )
    :vars
    (
      ?auto_130873 - INSTRUMENT
      ?auto_130866 - SATELLITE
      ?auto_130871 - DIRECTION
      ?auto_130867 - INSTRUMENT
      ?auto_130872 - INSTRUMENT
      ?auto_130868 - INSTRUMENT
      ?auto_130870 - INSTRUMENT
      ?auto_130869 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_130859 ?auto_130856 ) ) ( not ( = ?auto_130860 ?auto_130856 ) ) ( not ( = ?auto_130860 ?auto_130859 ) ) ( not ( = ?auto_130862 ?auto_130856 ) ) ( not ( = ?auto_130862 ?auto_130859 ) ) ( not ( = ?auto_130862 ?auto_130860 ) ) ( not ( = ?auto_130864 ?auto_130856 ) ) ( not ( = ?auto_130864 ?auto_130859 ) ) ( not ( = ?auto_130864 ?auto_130860 ) ) ( not ( = ?auto_130864 ?auto_130862 ) ) ( ON_BOARD ?auto_130873 ?auto_130866 ) ( SUPPORTS ?auto_130873 ?auto_130863 ) ( not ( = ?auto_130862 ?auto_130871 ) ) ( CALIBRATION_TARGET ?auto_130873 ?auto_130871 ) ( not ( = ?auto_130871 ?auto_130864 ) ) ( ON_BOARD ?auto_130867 ?auto_130866 ) ( not ( = ?auto_130873 ?auto_130867 ) ) ( SUPPORTS ?auto_130867 ?auto_130865 ) ( CALIBRATION_TARGET ?auto_130867 ?auto_130871 ) ( not ( = ?auto_130871 ?auto_130860 ) ) ( ON_BOARD ?auto_130872 ?auto_130866 ) ( not ( = ?auto_130867 ?auto_130872 ) ) ( SUPPORTS ?auto_130872 ?auto_130861 ) ( CALIBRATION_TARGET ?auto_130872 ?auto_130871 ) ( not ( = ?auto_130871 ?auto_130856 ) ) ( ON_BOARD ?auto_130868 ?auto_130866 ) ( not ( = ?auto_130872 ?auto_130868 ) ) ( SUPPORTS ?auto_130868 ?auto_130857 ) ( CALIBRATION_TARGET ?auto_130868 ?auto_130871 ) ( not ( = ?auto_130871 ?auto_130859 ) ) ( ON_BOARD ?auto_130870 ?auto_130866 ) ( not ( = ?auto_130868 ?auto_130870 ) ) ( SUPPORTS ?auto_130870 ?auto_130858 ) ( CALIBRATION_TARGET ?auto_130870 ?auto_130871 ) ( POWER_AVAIL ?auto_130866 ) ( POINTING ?auto_130866 ?auto_130869 ) ( not ( = ?auto_130871 ?auto_130869 ) ) ( not ( = ?auto_130859 ?auto_130869 ) ) ( not ( = ?auto_130858 ?auto_130857 ) ) ( not ( = ?auto_130856 ?auto_130869 ) ) ( not ( = ?auto_130858 ?auto_130861 ) ) ( not ( = ?auto_130857 ?auto_130861 ) ) ( not ( = ?auto_130860 ?auto_130869 ) ) ( not ( = ?auto_130872 ?auto_130870 ) ) ( not ( = ?auto_130858 ?auto_130865 ) ) ( not ( = ?auto_130857 ?auto_130865 ) ) ( not ( = ?auto_130861 ?auto_130865 ) ) ( not ( = ?auto_130864 ?auto_130869 ) ) ( not ( = ?auto_130867 ?auto_130868 ) ) ( not ( = ?auto_130867 ?auto_130870 ) ) ( not ( = ?auto_130858 ?auto_130863 ) ) ( not ( = ?auto_130857 ?auto_130863 ) ) ( not ( = ?auto_130861 ?auto_130863 ) ) ( not ( = ?auto_130865 ?auto_130863 ) ) ( not ( = ?auto_130862 ?auto_130869 ) ) ( not ( = ?auto_130873 ?auto_130872 ) ) ( not ( = ?auto_130873 ?auto_130868 ) ) ( not ( = ?auto_130873 ?auto_130870 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_130859 ?auto_130858 ?auto_130856 ?auto_130857 ?auto_130860 ?auto_130861 ?auto_130862 ?auto_130863 ?auto_130864 ?auto_130865 )
      ( GET-5IMAGE-VERIFY ?auto_130856 ?auto_130857 ?auto_130859 ?auto_130858 ?auto_130860 ?auto_130861 ?auto_130862 ?auto_130863 ?auto_130864 ?auto_130865 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_130934 - DIRECTION
      ?auto_130935 - MODE
      ?auto_130937 - DIRECTION
      ?auto_130936 - MODE
      ?auto_130938 - DIRECTION
      ?auto_130939 - MODE
      ?auto_130940 - DIRECTION
      ?auto_130941 - MODE
      ?auto_130942 - DIRECTION
      ?auto_130943 - MODE
    )
    :vars
    (
      ?auto_130951 - INSTRUMENT
      ?auto_130944 - SATELLITE
      ?auto_130949 - DIRECTION
      ?auto_130945 - INSTRUMENT
      ?auto_130950 - INSTRUMENT
      ?auto_130946 - INSTRUMENT
      ?auto_130948 - INSTRUMENT
      ?auto_130947 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_130937 ?auto_130934 ) ) ( not ( = ?auto_130938 ?auto_130934 ) ) ( not ( = ?auto_130938 ?auto_130937 ) ) ( not ( = ?auto_130940 ?auto_130934 ) ) ( not ( = ?auto_130940 ?auto_130937 ) ) ( not ( = ?auto_130940 ?auto_130938 ) ) ( not ( = ?auto_130942 ?auto_130934 ) ) ( not ( = ?auto_130942 ?auto_130937 ) ) ( not ( = ?auto_130942 ?auto_130938 ) ) ( not ( = ?auto_130942 ?auto_130940 ) ) ( ON_BOARD ?auto_130951 ?auto_130944 ) ( SUPPORTS ?auto_130951 ?auto_130943 ) ( not ( = ?auto_130942 ?auto_130949 ) ) ( CALIBRATION_TARGET ?auto_130951 ?auto_130949 ) ( not ( = ?auto_130949 ?auto_130938 ) ) ( ON_BOARD ?auto_130945 ?auto_130944 ) ( not ( = ?auto_130951 ?auto_130945 ) ) ( SUPPORTS ?auto_130945 ?auto_130939 ) ( CALIBRATION_TARGET ?auto_130945 ?auto_130949 ) ( not ( = ?auto_130949 ?auto_130940 ) ) ( ON_BOARD ?auto_130950 ?auto_130944 ) ( not ( = ?auto_130945 ?auto_130950 ) ) ( SUPPORTS ?auto_130950 ?auto_130941 ) ( CALIBRATION_TARGET ?auto_130950 ?auto_130949 ) ( not ( = ?auto_130949 ?auto_130934 ) ) ( ON_BOARD ?auto_130946 ?auto_130944 ) ( not ( = ?auto_130950 ?auto_130946 ) ) ( SUPPORTS ?auto_130946 ?auto_130935 ) ( CALIBRATION_TARGET ?auto_130946 ?auto_130949 ) ( not ( = ?auto_130949 ?auto_130937 ) ) ( ON_BOARD ?auto_130948 ?auto_130944 ) ( not ( = ?auto_130946 ?auto_130948 ) ) ( SUPPORTS ?auto_130948 ?auto_130936 ) ( CALIBRATION_TARGET ?auto_130948 ?auto_130949 ) ( POWER_AVAIL ?auto_130944 ) ( POINTING ?auto_130944 ?auto_130947 ) ( not ( = ?auto_130949 ?auto_130947 ) ) ( not ( = ?auto_130937 ?auto_130947 ) ) ( not ( = ?auto_130936 ?auto_130935 ) ) ( not ( = ?auto_130934 ?auto_130947 ) ) ( not ( = ?auto_130936 ?auto_130941 ) ) ( not ( = ?auto_130935 ?auto_130941 ) ) ( not ( = ?auto_130940 ?auto_130947 ) ) ( not ( = ?auto_130950 ?auto_130948 ) ) ( not ( = ?auto_130936 ?auto_130939 ) ) ( not ( = ?auto_130935 ?auto_130939 ) ) ( not ( = ?auto_130941 ?auto_130939 ) ) ( not ( = ?auto_130938 ?auto_130947 ) ) ( not ( = ?auto_130945 ?auto_130946 ) ) ( not ( = ?auto_130945 ?auto_130948 ) ) ( not ( = ?auto_130936 ?auto_130943 ) ) ( not ( = ?auto_130935 ?auto_130943 ) ) ( not ( = ?auto_130941 ?auto_130943 ) ) ( not ( = ?auto_130939 ?auto_130943 ) ) ( not ( = ?auto_130942 ?auto_130947 ) ) ( not ( = ?auto_130951 ?auto_130950 ) ) ( not ( = ?auto_130951 ?auto_130946 ) ) ( not ( = ?auto_130951 ?auto_130948 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_130937 ?auto_130936 ?auto_130934 ?auto_130935 ?auto_130940 ?auto_130941 ?auto_130942 ?auto_130943 ?auto_130938 ?auto_130939 )
      ( GET-5IMAGE-VERIFY ?auto_130934 ?auto_130935 ?auto_130937 ?auto_130936 ?auto_130938 ?auto_130939 ?auto_130940 ?auto_130941 ?auto_130942 ?auto_130943 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_131012 - DIRECTION
      ?auto_131013 - MODE
      ?auto_131015 - DIRECTION
      ?auto_131014 - MODE
      ?auto_131016 - DIRECTION
      ?auto_131017 - MODE
      ?auto_131018 - DIRECTION
      ?auto_131019 - MODE
      ?auto_131020 - DIRECTION
      ?auto_131021 - MODE
    )
    :vars
    (
      ?auto_131029 - INSTRUMENT
      ?auto_131022 - SATELLITE
      ?auto_131027 - DIRECTION
      ?auto_131023 - INSTRUMENT
      ?auto_131028 - INSTRUMENT
      ?auto_131024 - INSTRUMENT
      ?auto_131026 - INSTRUMENT
      ?auto_131025 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_131015 ?auto_131012 ) ) ( not ( = ?auto_131016 ?auto_131012 ) ) ( not ( = ?auto_131016 ?auto_131015 ) ) ( not ( = ?auto_131018 ?auto_131012 ) ) ( not ( = ?auto_131018 ?auto_131015 ) ) ( not ( = ?auto_131018 ?auto_131016 ) ) ( not ( = ?auto_131020 ?auto_131012 ) ) ( not ( = ?auto_131020 ?auto_131015 ) ) ( not ( = ?auto_131020 ?auto_131016 ) ) ( not ( = ?auto_131020 ?auto_131018 ) ) ( ON_BOARD ?auto_131029 ?auto_131022 ) ( SUPPORTS ?auto_131029 ?auto_131019 ) ( not ( = ?auto_131018 ?auto_131027 ) ) ( CALIBRATION_TARGET ?auto_131029 ?auto_131027 ) ( not ( = ?auto_131027 ?auto_131016 ) ) ( ON_BOARD ?auto_131023 ?auto_131022 ) ( not ( = ?auto_131029 ?auto_131023 ) ) ( SUPPORTS ?auto_131023 ?auto_131017 ) ( CALIBRATION_TARGET ?auto_131023 ?auto_131027 ) ( not ( = ?auto_131027 ?auto_131020 ) ) ( ON_BOARD ?auto_131028 ?auto_131022 ) ( not ( = ?auto_131023 ?auto_131028 ) ) ( SUPPORTS ?auto_131028 ?auto_131021 ) ( CALIBRATION_TARGET ?auto_131028 ?auto_131027 ) ( not ( = ?auto_131027 ?auto_131012 ) ) ( ON_BOARD ?auto_131024 ?auto_131022 ) ( not ( = ?auto_131028 ?auto_131024 ) ) ( SUPPORTS ?auto_131024 ?auto_131013 ) ( CALIBRATION_TARGET ?auto_131024 ?auto_131027 ) ( not ( = ?auto_131027 ?auto_131015 ) ) ( ON_BOARD ?auto_131026 ?auto_131022 ) ( not ( = ?auto_131024 ?auto_131026 ) ) ( SUPPORTS ?auto_131026 ?auto_131014 ) ( CALIBRATION_TARGET ?auto_131026 ?auto_131027 ) ( POWER_AVAIL ?auto_131022 ) ( POINTING ?auto_131022 ?auto_131025 ) ( not ( = ?auto_131027 ?auto_131025 ) ) ( not ( = ?auto_131015 ?auto_131025 ) ) ( not ( = ?auto_131014 ?auto_131013 ) ) ( not ( = ?auto_131012 ?auto_131025 ) ) ( not ( = ?auto_131014 ?auto_131021 ) ) ( not ( = ?auto_131013 ?auto_131021 ) ) ( not ( = ?auto_131020 ?auto_131025 ) ) ( not ( = ?auto_131028 ?auto_131026 ) ) ( not ( = ?auto_131014 ?auto_131017 ) ) ( not ( = ?auto_131013 ?auto_131017 ) ) ( not ( = ?auto_131021 ?auto_131017 ) ) ( not ( = ?auto_131016 ?auto_131025 ) ) ( not ( = ?auto_131023 ?auto_131024 ) ) ( not ( = ?auto_131023 ?auto_131026 ) ) ( not ( = ?auto_131014 ?auto_131019 ) ) ( not ( = ?auto_131013 ?auto_131019 ) ) ( not ( = ?auto_131021 ?auto_131019 ) ) ( not ( = ?auto_131017 ?auto_131019 ) ) ( not ( = ?auto_131018 ?auto_131025 ) ) ( not ( = ?auto_131029 ?auto_131028 ) ) ( not ( = ?auto_131029 ?auto_131024 ) ) ( not ( = ?auto_131029 ?auto_131026 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_131015 ?auto_131014 ?auto_131012 ?auto_131013 ?auto_131020 ?auto_131021 ?auto_131018 ?auto_131019 ?auto_131016 ?auto_131017 )
      ( GET-5IMAGE-VERIFY ?auto_131012 ?auto_131013 ?auto_131015 ?auto_131014 ?auto_131016 ?auto_131017 ?auto_131018 ?auto_131019 ?auto_131020 ?auto_131021 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_131342 - DIRECTION
      ?auto_131343 - MODE
      ?auto_131345 - DIRECTION
      ?auto_131344 - MODE
      ?auto_131346 - DIRECTION
      ?auto_131347 - MODE
      ?auto_131348 - DIRECTION
      ?auto_131349 - MODE
      ?auto_131350 - DIRECTION
      ?auto_131351 - MODE
    )
    :vars
    (
      ?auto_131359 - INSTRUMENT
      ?auto_131352 - SATELLITE
      ?auto_131357 - DIRECTION
      ?auto_131353 - INSTRUMENT
      ?auto_131358 - INSTRUMENT
      ?auto_131354 - INSTRUMENT
      ?auto_131356 - INSTRUMENT
      ?auto_131355 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_131345 ?auto_131342 ) ) ( not ( = ?auto_131346 ?auto_131342 ) ) ( not ( = ?auto_131346 ?auto_131345 ) ) ( not ( = ?auto_131348 ?auto_131342 ) ) ( not ( = ?auto_131348 ?auto_131345 ) ) ( not ( = ?auto_131348 ?auto_131346 ) ) ( not ( = ?auto_131350 ?auto_131342 ) ) ( not ( = ?auto_131350 ?auto_131345 ) ) ( not ( = ?auto_131350 ?auto_131346 ) ) ( not ( = ?auto_131350 ?auto_131348 ) ) ( ON_BOARD ?auto_131359 ?auto_131352 ) ( SUPPORTS ?auto_131359 ?auto_131347 ) ( not ( = ?auto_131346 ?auto_131357 ) ) ( CALIBRATION_TARGET ?auto_131359 ?auto_131357 ) ( not ( = ?auto_131357 ?auto_131350 ) ) ( ON_BOARD ?auto_131353 ?auto_131352 ) ( not ( = ?auto_131359 ?auto_131353 ) ) ( SUPPORTS ?auto_131353 ?auto_131351 ) ( CALIBRATION_TARGET ?auto_131353 ?auto_131357 ) ( not ( = ?auto_131357 ?auto_131348 ) ) ( ON_BOARD ?auto_131358 ?auto_131352 ) ( not ( = ?auto_131353 ?auto_131358 ) ) ( SUPPORTS ?auto_131358 ?auto_131349 ) ( CALIBRATION_TARGET ?auto_131358 ?auto_131357 ) ( not ( = ?auto_131357 ?auto_131342 ) ) ( ON_BOARD ?auto_131354 ?auto_131352 ) ( not ( = ?auto_131358 ?auto_131354 ) ) ( SUPPORTS ?auto_131354 ?auto_131343 ) ( CALIBRATION_TARGET ?auto_131354 ?auto_131357 ) ( not ( = ?auto_131357 ?auto_131345 ) ) ( ON_BOARD ?auto_131356 ?auto_131352 ) ( not ( = ?auto_131354 ?auto_131356 ) ) ( SUPPORTS ?auto_131356 ?auto_131344 ) ( CALIBRATION_TARGET ?auto_131356 ?auto_131357 ) ( POWER_AVAIL ?auto_131352 ) ( POINTING ?auto_131352 ?auto_131355 ) ( not ( = ?auto_131357 ?auto_131355 ) ) ( not ( = ?auto_131345 ?auto_131355 ) ) ( not ( = ?auto_131344 ?auto_131343 ) ) ( not ( = ?auto_131342 ?auto_131355 ) ) ( not ( = ?auto_131344 ?auto_131349 ) ) ( not ( = ?auto_131343 ?auto_131349 ) ) ( not ( = ?auto_131348 ?auto_131355 ) ) ( not ( = ?auto_131358 ?auto_131356 ) ) ( not ( = ?auto_131344 ?auto_131351 ) ) ( not ( = ?auto_131343 ?auto_131351 ) ) ( not ( = ?auto_131349 ?auto_131351 ) ) ( not ( = ?auto_131350 ?auto_131355 ) ) ( not ( = ?auto_131353 ?auto_131354 ) ) ( not ( = ?auto_131353 ?auto_131356 ) ) ( not ( = ?auto_131344 ?auto_131347 ) ) ( not ( = ?auto_131343 ?auto_131347 ) ) ( not ( = ?auto_131349 ?auto_131347 ) ) ( not ( = ?auto_131351 ?auto_131347 ) ) ( not ( = ?auto_131346 ?auto_131355 ) ) ( not ( = ?auto_131359 ?auto_131358 ) ) ( not ( = ?auto_131359 ?auto_131354 ) ) ( not ( = ?auto_131359 ?auto_131356 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_131345 ?auto_131344 ?auto_131342 ?auto_131343 ?auto_131348 ?auto_131349 ?auto_131346 ?auto_131347 ?auto_131350 ?auto_131351 )
      ( GET-5IMAGE-VERIFY ?auto_131342 ?auto_131343 ?auto_131345 ?auto_131344 ?auto_131346 ?auto_131347 ?auto_131348 ?auto_131349 ?auto_131350 ?auto_131351 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_131420 - DIRECTION
      ?auto_131421 - MODE
      ?auto_131423 - DIRECTION
      ?auto_131422 - MODE
      ?auto_131424 - DIRECTION
      ?auto_131425 - MODE
      ?auto_131426 - DIRECTION
      ?auto_131427 - MODE
      ?auto_131428 - DIRECTION
      ?auto_131429 - MODE
    )
    :vars
    (
      ?auto_131437 - INSTRUMENT
      ?auto_131430 - SATELLITE
      ?auto_131435 - DIRECTION
      ?auto_131431 - INSTRUMENT
      ?auto_131436 - INSTRUMENT
      ?auto_131432 - INSTRUMENT
      ?auto_131434 - INSTRUMENT
      ?auto_131433 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_131423 ?auto_131420 ) ) ( not ( = ?auto_131424 ?auto_131420 ) ) ( not ( = ?auto_131424 ?auto_131423 ) ) ( not ( = ?auto_131426 ?auto_131420 ) ) ( not ( = ?auto_131426 ?auto_131423 ) ) ( not ( = ?auto_131426 ?auto_131424 ) ) ( not ( = ?auto_131428 ?auto_131420 ) ) ( not ( = ?auto_131428 ?auto_131423 ) ) ( not ( = ?auto_131428 ?auto_131424 ) ) ( not ( = ?auto_131428 ?auto_131426 ) ) ( ON_BOARD ?auto_131437 ?auto_131430 ) ( SUPPORTS ?auto_131437 ?auto_131425 ) ( not ( = ?auto_131424 ?auto_131435 ) ) ( CALIBRATION_TARGET ?auto_131437 ?auto_131435 ) ( not ( = ?auto_131435 ?auto_131426 ) ) ( ON_BOARD ?auto_131431 ?auto_131430 ) ( not ( = ?auto_131437 ?auto_131431 ) ) ( SUPPORTS ?auto_131431 ?auto_131427 ) ( CALIBRATION_TARGET ?auto_131431 ?auto_131435 ) ( not ( = ?auto_131435 ?auto_131428 ) ) ( ON_BOARD ?auto_131436 ?auto_131430 ) ( not ( = ?auto_131431 ?auto_131436 ) ) ( SUPPORTS ?auto_131436 ?auto_131429 ) ( CALIBRATION_TARGET ?auto_131436 ?auto_131435 ) ( not ( = ?auto_131435 ?auto_131420 ) ) ( ON_BOARD ?auto_131432 ?auto_131430 ) ( not ( = ?auto_131436 ?auto_131432 ) ) ( SUPPORTS ?auto_131432 ?auto_131421 ) ( CALIBRATION_TARGET ?auto_131432 ?auto_131435 ) ( not ( = ?auto_131435 ?auto_131423 ) ) ( ON_BOARD ?auto_131434 ?auto_131430 ) ( not ( = ?auto_131432 ?auto_131434 ) ) ( SUPPORTS ?auto_131434 ?auto_131422 ) ( CALIBRATION_TARGET ?auto_131434 ?auto_131435 ) ( POWER_AVAIL ?auto_131430 ) ( POINTING ?auto_131430 ?auto_131433 ) ( not ( = ?auto_131435 ?auto_131433 ) ) ( not ( = ?auto_131423 ?auto_131433 ) ) ( not ( = ?auto_131422 ?auto_131421 ) ) ( not ( = ?auto_131420 ?auto_131433 ) ) ( not ( = ?auto_131422 ?auto_131429 ) ) ( not ( = ?auto_131421 ?auto_131429 ) ) ( not ( = ?auto_131428 ?auto_131433 ) ) ( not ( = ?auto_131436 ?auto_131434 ) ) ( not ( = ?auto_131422 ?auto_131427 ) ) ( not ( = ?auto_131421 ?auto_131427 ) ) ( not ( = ?auto_131429 ?auto_131427 ) ) ( not ( = ?auto_131426 ?auto_131433 ) ) ( not ( = ?auto_131431 ?auto_131432 ) ) ( not ( = ?auto_131431 ?auto_131434 ) ) ( not ( = ?auto_131422 ?auto_131425 ) ) ( not ( = ?auto_131421 ?auto_131425 ) ) ( not ( = ?auto_131429 ?auto_131425 ) ) ( not ( = ?auto_131427 ?auto_131425 ) ) ( not ( = ?auto_131424 ?auto_131433 ) ) ( not ( = ?auto_131437 ?auto_131436 ) ) ( not ( = ?auto_131437 ?auto_131432 ) ) ( not ( = ?auto_131437 ?auto_131434 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_131423 ?auto_131422 ?auto_131420 ?auto_131421 ?auto_131428 ?auto_131429 ?auto_131424 ?auto_131425 ?auto_131426 ?auto_131427 )
      ( GET-5IMAGE-VERIFY ?auto_131420 ?auto_131421 ?auto_131423 ?auto_131422 ?auto_131424 ?auto_131425 ?auto_131426 ?auto_131427 ?auto_131428 ?auto_131429 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_132964 - DIRECTION
      ?auto_132965 - MODE
      ?auto_132967 - DIRECTION
      ?auto_132966 - MODE
      ?auto_132968 - DIRECTION
      ?auto_132969 - MODE
      ?auto_132970 - DIRECTION
      ?auto_132971 - MODE
      ?auto_132972 - DIRECTION
      ?auto_132973 - MODE
    )
    :vars
    (
      ?auto_132981 - INSTRUMENT
      ?auto_132974 - SATELLITE
      ?auto_132979 - DIRECTION
      ?auto_132975 - INSTRUMENT
      ?auto_132980 - INSTRUMENT
      ?auto_132976 - INSTRUMENT
      ?auto_132978 - INSTRUMENT
      ?auto_132977 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_132967 ?auto_132964 ) ) ( not ( = ?auto_132968 ?auto_132964 ) ) ( not ( = ?auto_132968 ?auto_132967 ) ) ( not ( = ?auto_132970 ?auto_132964 ) ) ( not ( = ?auto_132970 ?auto_132967 ) ) ( not ( = ?auto_132970 ?auto_132968 ) ) ( not ( = ?auto_132972 ?auto_132964 ) ) ( not ( = ?auto_132972 ?auto_132967 ) ) ( not ( = ?auto_132972 ?auto_132968 ) ) ( not ( = ?auto_132972 ?auto_132970 ) ) ( ON_BOARD ?auto_132981 ?auto_132974 ) ( SUPPORTS ?auto_132981 ?auto_132973 ) ( not ( = ?auto_132972 ?auto_132979 ) ) ( CALIBRATION_TARGET ?auto_132981 ?auto_132979 ) ( not ( = ?auto_132979 ?auto_132970 ) ) ( ON_BOARD ?auto_132975 ?auto_132974 ) ( not ( = ?auto_132981 ?auto_132975 ) ) ( SUPPORTS ?auto_132975 ?auto_132971 ) ( CALIBRATION_TARGET ?auto_132975 ?auto_132979 ) ( not ( = ?auto_132979 ?auto_132967 ) ) ( ON_BOARD ?auto_132980 ?auto_132974 ) ( not ( = ?auto_132975 ?auto_132980 ) ) ( SUPPORTS ?auto_132980 ?auto_132966 ) ( CALIBRATION_TARGET ?auto_132980 ?auto_132979 ) ( not ( = ?auto_132979 ?auto_132964 ) ) ( ON_BOARD ?auto_132976 ?auto_132974 ) ( not ( = ?auto_132980 ?auto_132976 ) ) ( SUPPORTS ?auto_132976 ?auto_132965 ) ( CALIBRATION_TARGET ?auto_132976 ?auto_132979 ) ( not ( = ?auto_132979 ?auto_132968 ) ) ( ON_BOARD ?auto_132978 ?auto_132974 ) ( not ( = ?auto_132976 ?auto_132978 ) ) ( SUPPORTS ?auto_132978 ?auto_132969 ) ( CALIBRATION_TARGET ?auto_132978 ?auto_132979 ) ( POWER_AVAIL ?auto_132974 ) ( POINTING ?auto_132974 ?auto_132977 ) ( not ( = ?auto_132979 ?auto_132977 ) ) ( not ( = ?auto_132968 ?auto_132977 ) ) ( not ( = ?auto_132969 ?auto_132965 ) ) ( not ( = ?auto_132964 ?auto_132977 ) ) ( not ( = ?auto_132969 ?auto_132966 ) ) ( not ( = ?auto_132965 ?auto_132966 ) ) ( not ( = ?auto_132967 ?auto_132977 ) ) ( not ( = ?auto_132980 ?auto_132978 ) ) ( not ( = ?auto_132969 ?auto_132971 ) ) ( not ( = ?auto_132965 ?auto_132971 ) ) ( not ( = ?auto_132966 ?auto_132971 ) ) ( not ( = ?auto_132970 ?auto_132977 ) ) ( not ( = ?auto_132975 ?auto_132976 ) ) ( not ( = ?auto_132975 ?auto_132978 ) ) ( not ( = ?auto_132969 ?auto_132973 ) ) ( not ( = ?auto_132965 ?auto_132973 ) ) ( not ( = ?auto_132966 ?auto_132973 ) ) ( not ( = ?auto_132971 ?auto_132973 ) ) ( not ( = ?auto_132972 ?auto_132977 ) ) ( not ( = ?auto_132981 ?auto_132980 ) ) ( not ( = ?auto_132981 ?auto_132976 ) ) ( not ( = ?auto_132981 ?auto_132978 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_132968 ?auto_132969 ?auto_132964 ?auto_132965 ?auto_132967 ?auto_132966 ?auto_132972 ?auto_132973 ?auto_132970 ?auto_132971 )
      ( GET-5IMAGE-VERIFY ?auto_132964 ?auto_132965 ?auto_132967 ?auto_132966 ?auto_132968 ?auto_132969 ?auto_132970 ?auto_132971 ?auto_132972 ?auto_132973 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_133042 - DIRECTION
      ?auto_133043 - MODE
      ?auto_133045 - DIRECTION
      ?auto_133044 - MODE
      ?auto_133046 - DIRECTION
      ?auto_133047 - MODE
      ?auto_133048 - DIRECTION
      ?auto_133049 - MODE
      ?auto_133050 - DIRECTION
      ?auto_133051 - MODE
    )
    :vars
    (
      ?auto_133059 - INSTRUMENT
      ?auto_133052 - SATELLITE
      ?auto_133057 - DIRECTION
      ?auto_133053 - INSTRUMENT
      ?auto_133058 - INSTRUMENT
      ?auto_133054 - INSTRUMENT
      ?auto_133056 - INSTRUMENT
      ?auto_133055 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_133045 ?auto_133042 ) ) ( not ( = ?auto_133046 ?auto_133042 ) ) ( not ( = ?auto_133046 ?auto_133045 ) ) ( not ( = ?auto_133048 ?auto_133042 ) ) ( not ( = ?auto_133048 ?auto_133045 ) ) ( not ( = ?auto_133048 ?auto_133046 ) ) ( not ( = ?auto_133050 ?auto_133042 ) ) ( not ( = ?auto_133050 ?auto_133045 ) ) ( not ( = ?auto_133050 ?auto_133046 ) ) ( not ( = ?auto_133050 ?auto_133048 ) ) ( ON_BOARD ?auto_133059 ?auto_133052 ) ( SUPPORTS ?auto_133059 ?auto_133049 ) ( not ( = ?auto_133048 ?auto_133057 ) ) ( CALIBRATION_TARGET ?auto_133059 ?auto_133057 ) ( not ( = ?auto_133057 ?auto_133050 ) ) ( ON_BOARD ?auto_133053 ?auto_133052 ) ( not ( = ?auto_133059 ?auto_133053 ) ) ( SUPPORTS ?auto_133053 ?auto_133051 ) ( CALIBRATION_TARGET ?auto_133053 ?auto_133057 ) ( not ( = ?auto_133057 ?auto_133045 ) ) ( ON_BOARD ?auto_133058 ?auto_133052 ) ( not ( = ?auto_133053 ?auto_133058 ) ) ( SUPPORTS ?auto_133058 ?auto_133044 ) ( CALIBRATION_TARGET ?auto_133058 ?auto_133057 ) ( not ( = ?auto_133057 ?auto_133042 ) ) ( ON_BOARD ?auto_133054 ?auto_133052 ) ( not ( = ?auto_133058 ?auto_133054 ) ) ( SUPPORTS ?auto_133054 ?auto_133043 ) ( CALIBRATION_TARGET ?auto_133054 ?auto_133057 ) ( not ( = ?auto_133057 ?auto_133046 ) ) ( ON_BOARD ?auto_133056 ?auto_133052 ) ( not ( = ?auto_133054 ?auto_133056 ) ) ( SUPPORTS ?auto_133056 ?auto_133047 ) ( CALIBRATION_TARGET ?auto_133056 ?auto_133057 ) ( POWER_AVAIL ?auto_133052 ) ( POINTING ?auto_133052 ?auto_133055 ) ( not ( = ?auto_133057 ?auto_133055 ) ) ( not ( = ?auto_133046 ?auto_133055 ) ) ( not ( = ?auto_133047 ?auto_133043 ) ) ( not ( = ?auto_133042 ?auto_133055 ) ) ( not ( = ?auto_133047 ?auto_133044 ) ) ( not ( = ?auto_133043 ?auto_133044 ) ) ( not ( = ?auto_133045 ?auto_133055 ) ) ( not ( = ?auto_133058 ?auto_133056 ) ) ( not ( = ?auto_133047 ?auto_133051 ) ) ( not ( = ?auto_133043 ?auto_133051 ) ) ( not ( = ?auto_133044 ?auto_133051 ) ) ( not ( = ?auto_133050 ?auto_133055 ) ) ( not ( = ?auto_133053 ?auto_133054 ) ) ( not ( = ?auto_133053 ?auto_133056 ) ) ( not ( = ?auto_133047 ?auto_133049 ) ) ( not ( = ?auto_133043 ?auto_133049 ) ) ( not ( = ?auto_133044 ?auto_133049 ) ) ( not ( = ?auto_133051 ?auto_133049 ) ) ( not ( = ?auto_133048 ?auto_133055 ) ) ( not ( = ?auto_133059 ?auto_133058 ) ) ( not ( = ?auto_133059 ?auto_133054 ) ) ( not ( = ?auto_133059 ?auto_133056 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_133046 ?auto_133047 ?auto_133042 ?auto_133043 ?auto_133045 ?auto_133044 ?auto_133048 ?auto_133049 ?auto_133050 ?auto_133051 )
      ( GET-5IMAGE-VERIFY ?auto_133042 ?auto_133043 ?auto_133045 ?auto_133044 ?auto_133046 ?auto_133047 ?auto_133048 ?auto_133049 ?auto_133050 ?auto_133051 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_133460 - DIRECTION
      ?auto_133461 - MODE
      ?auto_133463 - DIRECTION
      ?auto_133462 - MODE
      ?auto_133464 - DIRECTION
      ?auto_133465 - MODE
      ?auto_133466 - DIRECTION
      ?auto_133467 - MODE
      ?auto_133468 - DIRECTION
      ?auto_133469 - MODE
    )
    :vars
    (
      ?auto_133477 - INSTRUMENT
      ?auto_133470 - SATELLITE
      ?auto_133475 - DIRECTION
      ?auto_133471 - INSTRUMENT
      ?auto_133476 - INSTRUMENT
      ?auto_133472 - INSTRUMENT
      ?auto_133474 - INSTRUMENT
      ?auto_133473 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_133463 ?auto_133460 ) ) ( not ( = ?auto_133464 ?auto_133460 ) ) ( not ( = ?auto_133464 ?auto_133463 ) ) ( not ( = ?auto_133466 ?auto_133460 ) ) ( not ( = ?auto_133466 ?auto_133463 ) ) ( not ( = ?auto_133466 ?auto_133464 ) ) ( not ( = ?auto_133468 ?auto_133460 ) ) ( not ( = ?auto_133468 ?auto_133463 ) ) ( not ( = ?auto_133468 ?auto_133464 ) ) ( not ( = ?auto_133468 ?auto_133466 ) ) ( ON_BOARD ?auto_133477 ?auto_133470 ) ( SUPPORTS ?auto_133477 ?auto_133469 ) ( not ( = ?auto_133468 ?auto_133475 ) ) ( CALIBRATION_TARGET ?auto_133477 ?auto_133475 ) ( not ( = ?auto_133475 ?auto_133464 ) ) ( ON_BOARD ?auto_133471 ?auto_133470 ) ( not ( = ?auto_133477 ?auto_133471 ) ) ( SUPPORTS ?auto_133471 ?auto_133465 ) ( CALIBRATION_TARGET ?auto_133471 ?auto_133475 ) ( not ( = ?auto_133475 ?auto_133463 ) ) ( ON_BOARD ?auto_133476 ?auto_133470 ) ( not ( = ?auto_133471 ?auto_133476 ) ) ( SUPPORTS ?auto_133476 ?auto_133462 ) ( CALIBRATION_TARGET ?auto_133476 ?auto_133475 ) ( not ( = ?auto_133475 ?auto_133460 ) ) ( ON_BOARD ?auto_133472 ?auto_133470 ) ( not ( = ?auto_133476 ?auto_133472 ) ) ( SUPPORTS ?auto_133472 ?auto_133461 ) ( CALIBRATION_TARGET ?auto_133472 ?auto_133475 ) ( not ( = ?auto_133475 ?auto_133466 ) ) ( ON_BOARD ?auto_133474 ?auto_133470 ) ( not ( = ?auto_133472 ?auto_133474 ) ) ( SUPPORTS ?auto_133474 ?auto_133467 ) ( CALIBRATION_TARGET ?auto_133474 ?auto_133475 ) ( POWER_AVAIL ?auto_133470 ) ( POINTING ?auto_133470 ?auto_133473 ) ( not ( = ?auto_133475 ?auto_133473 ) ) ( not ( = ?auto_133466 ?auto_133473 ) ) ( not ( = ?auto_133467 ?auto_133461 ) ) ( not ( = ?auto_133460 ?auto_133473 ) ) ( not ( = ?auto_133467 ?auto_133462 ) ) ( not ( = ?auto_133461 ?auto_133462 ) ) ( not ( = ?auto_133463 ?auto_133473 ) ) ( not ( = ?auto_133476 ?auto_133474 ) ) ( not ( = ?auto_133467 ?auto_133465 ) ) ( not ( = ?auto_133461 ?auto_133465 ) ) ( not ( = ?auto_133462 ?auto_133465 ) ) ( not ( = ?auto_133464 ?auto_133473 ) ) ( not ( = ?auto_133471 ?auto_133472 ) ) ( not ( = ?auto_133471 ?auto_133474 ) ) ( not ( = ?auto_133467 ?auto_133469 ) ) ( not ( = ?auto_133461 ?auto_133469 ) ) ( not ( = ?auto_133462 ?auto_133469 ) ) ( not ( = ?auto_133465 ?auto_133469 ) ) ( not ( = ?auto_133468 ?auto_133473 ) ) ( not ( = ?auto_133477 ?auto_133476 ) ) ( not ( = ?auto_133477 ?auto_133472 ) ) ( not ( = ?auto_133477 ?auto_133474 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_133466 ?auto_133467 ?auto_133460 ?auto_133461 ?auto_133463 ?auto_133462 ?auto_133468 ?auto_133469 ?auto_133464 ?auto_133465 )
      ( GET-5IMAGE-VERIFY ?auto_133460 ?auto_133461 ?auto_133463 ?auto_133462 ?auto_133464 ?auto_133465 ?auto_133466 ?auto_133467 ?auto_133468 ?auto_133469 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_133538 - DIRECTION
      ?auto_133539 - MODE
      ?auto_133541 - DIRECTION
      ?auto_133540 - MODE
      ?auto_133542 - DIRECTION
      ?auto_133543 - MODE
      ?auto_133544 - DIRECTION
      ?auto_133545 - MODE
      ?auto_133546 - DIRECTION
      ?auto_133547 - MODE
    )
    :vars
    (
      ?auto_133555 - INSTRUMENT
      ?auto_133548 - SATELLITE
      ?auto_133553 - DIRECTION
      ?auto_133549 - INSTRUMENT
      ?auto_133554 - INSTRUMENT
      ?auto_133550 - INSTRUMENT
      ?auto_133552 - INSTRUMENT
      ?auto_133551 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_133541 ?auto_133538 ) ) ( not ( = ?auto_133542 ?auto_133538 ) ) ( not ( = ?auto_133542 ?auto_133541 ) ) ( not ( = ?auto_133544 ?auto_133538 ) ) ( not ( = ?auto_133544 ?auto_133541 ) ) ( not ( = ?auto_133544 ?auto_133542 ) ) ( not ( = ?auto_133546 ?auto_133538 ) ) ( not ( = ?auto_133546 ?auto_133541 ) ) ( not ( = ?auto_133546 ?auto_133542 ) ) ( not ( = ?auto_133546 ?auto_133544 ) ) ( ON_BOARD ?auto_133555 ?auto_133548 ) ( SUPPORTS ?auto_133555 ?auto_133545 ) ( not ( = ?auto_133544 ?auto_133553 ) ) ( CALIBRATION_TARGET ?auto_133555 ?auto_133553 ) ( not ( = ?auto_133553 ?auto_133542 ) ) ( ON_BOARD ?auto_133549 ?auto_133548 ) ( not ( = ?auto_133555 ?auto_133549 ) ) ( SUPPORTS ?auto_133549 ?auto_133543 ) ( CALIBRATION_TARGET ?auto_133549 ?auto_133553 ) ( not ( = ?auto_133553 ?auto_133541 ) ) ( ON_BOARD ?auto_133554 ?auto_133548 ) ( not ( = ?auto_133549 ?auto_133554 ) ) ( SUPPORTS ?auto_133554 ?auto_133540 ) ( CALIBRATION_TARGET ?auto_133554 ?auto_133553 ) ( not ( = ?auto_133553 ?auto_133538 ) ) ( ON_BOARD ?auto_133550 ?auto_133548 ) ( not ( = ?auto_133554 ?auto_133550 ) ) ( SUPPORTS ?auto_133550 ?auto_133539 ) ( CALIBRATION_TARGET ?auto_133550 ?auto_133553 ) ( not ( = ?auto_133553 ?auto_133546 ) ) ( ON_BOARD ?auto_133552 ?auto_133548 ) ( not ( = ?auto_133550 ?auto_133552 ) ) ( SUPPORTS ?auto_133552 ?auto_133547 ) ( CALIBRATION_TARGET ?auto_133552 ?auto_133553 ) ( POWER_AVAIL ?auto_133548 ) ( POINTING ?auto_133548 ?auto_133551 ) ( not ( = ?auto_133553 ?auto_133551 ) ) ( not ( = ?auto_133546 ?auto_133551 ) ) ( not ( = ?auto_133547 ?auto_133539 ) ) ( not ( = ?auto_133538 ?auto_133551 ) ) ( not ( = ?auto_133547 ?auto_133540 ) ) ( not ( = ?auto_133539 ?auto_133540 ) ) ( not ( = ?auto_133541 ?auto_133551 ) ) ( not ( = ?auto_133554 ?auto_133552 ) ) ( not ( = ?auto_133547 ?auto_133543 ) ) ( not ( = ?auto_133539 ?auto_133543 ) ) ( not ( = ?auto_133540 ?auto_133543 ) ) ( not ( = ?auto_133542 ?auto_133551 ) ) ( not ( = ?auto_133549 ?auto_133550 ) ) ( not ( = ?auto_133549 ?auto_133552 ) ) ( not ( = ?auto_133547 ?auto_133545 ) ) ( not ( = ?auto_133539 ?auto_133545 ) ) ( not ( = ?auto_133540 ?auto_133545 ) ) ( not ( = ?auto_133543 ?auto_133545 ) ) ( not ( = ?auto_133544 ?auto_133551 ) ) ( not ( = ?auto_133555 ?auto_133554 ) ) ( not ( = ?auto_133555 ?auto_133550 ) ) ( not ( = ?auto_133555 ?auto_133552 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_133546 ?auto_133547 ?auto_133538 ?auto_133539 ?auto_133541 ?auto_133540 ?auto_133544 ?auto_133545 ?auto_133542 ?auto_133543 )
      ( GET-5IMAGE-VERIFY ?auto_133538 ?auto_133539 ?auto_133541 ?auto_133540 ?auto_133542 ?auto_133543 ?auto_133544 ?auto_133545 ?auto_133546 ?auto_133547 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_133696 - DIRECTION
      ?auto_133697 - MODE
      ?auto_133699 - DIRECTION
      ?auto_133698 - MODE
      ?auto_133700 - DIRECTION
      ?auto_133701 - MODE
      ?auto_133702 - DIRECTION
      ?auto_133703 - MODE
      ?auto_133704 - DIRECTION
      ?auto_133705 - MODE
    )
    :vars
    (
      ?auto_133713 - INSTRUMENT
      ?auto_133706 - SATELLITE
      ?auto_133711 - DIRECTION
      ?auto_133707 - INSTRUMENT
      ?auto_133712 - INSTRUMENT
      ?auto_133708 - INSTRUMENT
      ?auto_133710 - INSTRUMENT
      ?auto_133709 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_133699 ?auto_133696 ) ) ( not ( = ?auto_133700 ?auto_133696 ) ) ( not ( = ?auto_133700 ?auto_133699 ) ) ( not ( = ?auto_133702 ?auto_133696 ) ) ( not ( = ?auto_133702 ?auto_133699 ) ) ( not ( = ?auto_133702 ?auto_133700 ) ) ( not ( = ?auto_133704 ?auto_133696 ) ) ( not ( = ?auto_133704 ?auto_133699 ) ) ( not ( = ?auto_133704 ?auto_133700 ) ) ( not ( = ?auto_133704 ?auto_133702 ) ) ( ON_BOARD ?auto_133713 ?auto_133706 ) ( SUPPORTS ?auto_133713 ?auto_133701 ) ( not ( = ?auto_133700 ?auto_133711 ) ) ( CALIBRATION_TARGET ?auto_133713 ?auto_133711 ) ( not ( = ?auto_133711 ?auto_133704 ) ) ( ON_BOARD ?auto_133707 ?auto_133706 ) ( not ( = ?auto_133713 ?auto_133707 ) ) ( SUPPORTS ?auto_133707 ?auto_133705 ) ( CALIBRATION_TARGET ?auto_133707 ?auto_133711 ) ( not ( = ?auto_133711 ?auto_133699 ) ) ( ON_BOARD ?auto_133712 ?auto_133706 ) ( not ( = ?auto_133707 ?auto_133712 ) ) ( SUPPORTS ?auto_133712 ?auto_133698 ) ( CALIBRATION_TARGET ?auto_133712 ?auto_133711 ) ( not ( = ?auto_133711 ?auto_133696 ) ) ( ON_BOARD ?auto_133708 ?auto_133706 ) ( not ( = ?auto_133712 ?auto_133708 ) ) ( SUPPORTS ?auto_133708 ?auto_133697 ) ( CALIBRATION_TARGET ?auto_133708 ?auto_133711 ) ( not ( = ?auto_133711 ?auto_133702 ) ) ( ON_BOARD ?auto_133710 ?auto_133706 ) ( not ( = ?auto_133708 ?auto_133710 ) ) ( SUPPORTS ?auto_133710 ?auto_133703 ) ( CALIBRATION_TARGET ?auto_133710 ?auto_133711 ) ( POWER_AVAIL ?auto_133706 ) ( POINTING ?auto_133706 ?auto_133709 ) ( not ( = ?auto_133711 ?auto_133709 ) ) ( not ( = ?auto_133702 ?auto_133709 ) ) ( not ( = ?auto_133703 ?auto_133697 ) ) ( not ( = ?auto_133696 ?auto_133709 ) ) ( not ( = ?auto_133703 ?auto_133698 ) ) ( not ( = ?auto_133697 ?auto_133698 ) ) ( not ( = ?auto_133699 ?auto_133709 ) ) ( not ( = ?auto_133712 ?auto_133710 ) ) ( not ( = ?auto_133703 ?auto_133705 ) ) ( not ( = ?auto_133697 ?auto_133705 ) ) ( not ( = ?auto_133698 ?auto_133705 ) ) ( not ( = ?auto_133704 ?auto_133709 ) ) ( not ( = ?auto_133707 ?auto_133708 ) ) ( not ( = ?auto_133707 ?auto_133710 ) ) ( not ( = ?auto_133703 ?auto_133701 ) ) ( not ( = ?auto_133697 ?auto_133701 ) ) ( not ( = ?auto_133698 ?auto_133701 ) ) ( not ( = ?auto_133705 ?auto_133701 ) ) ( not ( = ?auto_133700 ?auto_133709 ) ) ( not ( = ?auto_133713 ?auto_133712 ) ) ( not ( = ?auto_133713 ?auto_133708 ) ) ( not ( = ?auto_133713 ?auto_133710 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_133702 ?auto_133703 ?auto_133696 ?auto_133697 ?auto_133699 ?auto_133698 ?auto_133700 ?auto_133701 ?auto_133704 ?auto_133705 )
      ( GET-5IMAGE-VERIFY ?auto_133696 ?auto_133697 ?auto_133699 ?auto_133698 ?auto_133700 ?auto_133701 ?auto_133702 ?auto_133703 ?auto_133704 ?auto_133705 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_133946 - DIRECTION
      ?auto_133947 - MODE
      ?auto_133949 - DIRECTION
      ?auto_133948 - MODE
      ?auto_133950 - DIRECTION
      ?auto_133951 - MODE
      ?auto_133952 - DIRECTION
      ?auto_133953 - MODE
      ?auto_133954 - DIRECTION
      ?auto_133955 - MODE
    )
    :vars
    (
      ?auto_133963 - INSTRUMENT
      ?auto_133956 - SATELLITE
      ?auto_133961 - DIRECTION
      ?auto_133957 - INSTRUMENT
      ?auto_133962 - INSTRUMENT
      ?auto_133958 - INSTRUMENT
      ?auto_133960 - INSTRUMENT
      ?auto_133959 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_133949 ?auto_133946 ) ) ( not ( = ?auto_133950 ?auto_133946 ) ) ( not ( = ?auto_133950 ?auto_133949 ) ) ( not ( = ?auto_133952 ?auto_133946 ) ) ( not ( = ?auto_133952 ?auto_133949 ) ) ( not ( = ?auto_133952 ?auto_133950 ) ) ( not ( = ?auto_133954 ?auto_133946 ) ) ( not ( = ?auto_133954 ?auto_133949 ) ) ( not ( = ?auto_133954 ?auto_133950 ) ) ( not ( = ?auto_133954 ?auto_133952 ) ) ( ON_BOARD ?auto_133963 ?auto_133956 ) ( SUPPORTS ?auto_133963 ?auto_133951 ) ( not ( = ?auto_133950 ?auto_133961 ) ) ( CALIBRATION_TARGET ?auto_133963 ?auto_133961 ) ( not ( = ?auto_133961 ?auto_133952 ) ) ( ON_BOARD ?auto_133957 ?auto_133956 ) ( not ( = ?auto_133963 ?auto_133957 ) ) ( SUPPORTS ?auto_133957 ?auto_133953 ) ( CALIBRATION_TARGET ?auto_133957 ?auto_133961 ) ( not ( = ?auto_133961 ?auto_133949 ) ) ( ON_BOARD ?auto_133962 ?auto_133956 ) ( not ( = ?auto_133957 ?auto_133962 ) ) ( SUPPORTS ?auto_133962 ?auto_133948 ) ( CALIBRATION_TARGET ?auto_133962 ?auto_133961 ) ( not ( = ?auto_133961 ?auto_133946 ) ) ( ON_BOARD ?auto_133958 ?auto_133956 ) ( not ( = ?auto_133962 ?auto_133958 ) ) ( SUPPORTS ?auto_133958 ?auto_133947 ) ( CALIBRATION_TARGET ?auto_133958 ?auto_133961 ) ( not ( = ?auto_133961 ?auto_133954 ) ) ( ON_BOARD ?auto_133960 ?auto_133956 ) ( not ( = ?auto_133958 ?auto_133960 ) ) ( SUPPORTS ?auto_133960 ?auto_133955 ) ( CALIBRATION_TARGET ?auto_133960 ?auto_133961 ) ( POWER_AVAIL ?auto_133956 ) ( POINTING ?auto_133956 ?auto_133959 ) ( not ( = ?auto_133961 ?auto_133959 ) ) ( not ( = ?auto_133954 ?auto_133959 ) ) ( not ( = ?auto_133955 ?auto_133947 ) ) ( not ( = ?auto_133946 ?auto_133959 ) ) ( not ( = ?auto_133955 ?auto_133948 ) ) ( not ( = ?auto_133947 ?auto_133948 ) ) ( not ( = ?auto_133949 ?auto_133959 ) ) ( not ( = ?auto_133962 ?auto_133960 ) ) ( not ( = ?auto_133955 ?auto_133953 ) ) ( not ( = ?auto_133947 ?auto_133953 ) ) ( not ( = ?auto_133948 ?auto_133953 ) ) ( not ( = ?auto_133952 ?auto_133959 ) ) ( not ( = ?auto_133957 ?auto_133958 ) ) ( not ( = ?auto_133957 ?auto_133960 ) ) ( not ( = ?auto_133955 ?auto_133951 ) ) ( not ( = ?auto_133947 ?auto_133951 ) ) ( not ( = ?auto_133948 ?auto_133951 ) ) ( not ( = ?auto_133953 ?auto_133951 ) ) ( not ( = ?auto_133950 ?auto_133959 ) ) ( not ( = ?auto_133963 ?auto_133962 ) ) ( not ( = ?auto_133963 ?auto_133958 ) ) ( not ( = ?auto_133963 ?auto_133960 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_133954 ?auto_133955 ?auto_133946 ?auto_133947 ?auto_133949 ?auto_133948 ?auto_133950 ?auto_133951 ?auto_133952 ?auto_133953 )
      ( GET-5IMAGE-VERIFY ?auto_133946 ?auto_133947 ?auto_133949 ?auto_133948 ?auto_133950 ?auto_133951 ?auto_133952 ?auto_133953 ?auto_133954 ?auto_133955 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_134190 - DIRECTION
      ?auto_134191 - MODE
      ?auto_134193 - DIRECTION
      ?auto_134192 - MODE
      ?auto_134194 - DIRECTION
      ?auto_134195 - MODE
      ?auto_134196 - DIRECTION
      ?auto_134197 - MODE
      ?auto_134198 - DIRECTION
      ?auto_134199 - MODE
    )
    :vars
    (
      ?auto_134207 - INSTRUMENT
      ?auto_134200 - SATELLITE
      ?auto_134205 - DIRECTION
      ?auto_134201 - INSTRUMENT
      ?auto_134206 - INSTRUMENT
      ?auto_134202 - INSTRUMENT
      ?auto_134204 - INSTRUMENT
      ?auto_134203 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_134193 ?auto_134190 ) ) ( not ( = ?auto_134194 ?auto_134190 ) ) ( not ( = ?auto_134194 ?auto_134193 ) ) ( not ( = ?auto_134196 ?auto_134190 ) ) ( not ( = ?auto_134196 ?auto_134193 ) ) ( not ( = ?auto_134196 ?auto_134194 ) ) ( not ( = ?auto_134198 ?auto_134190 ) ) ( not ( = ?auto_134198 ?auto_134193 ) ) ( not ( = ?auto_134198 ?auto_134194 ) ) ( not ( = ?auto_134198 ?auto_134196 ) ) ( ON_BOARD ?auto_134207 ?auto_134200 ) ( SUPPORTS ?auto_134207 ?auto_134199 ) ( not ( = ?auto_134198 ?auto_134205 ) ) ( CALIBRATION_TARGET ?auto_134207 ?auto_134205 ) ( not ( = ?auto_134205 ?auto_134193 ) ) ( ON_BOARD ?auto_134201 ?auto_134200 ) ( not ( = ?auto_134207 ?auto_134201 ) ) ( SUPPORTS ?auto_134201 ?auto_134192 ) ( CALIBRATION_TARGET ?auto_134201 ?auto_134205 ) ( not ( = ?auto_134205 ?auto_134196 ) ) ( ON_BOARD ?auto_134206 ?auto_134200 ) ( not ( = ?auto_134201 ?auto_134206 ) ) ( SUPPORTS ?auto_134206 ?auto_134197 ) ( CALIBRATION_TARGET ?auto_134206 ?auto_134205 ) ( not ( = ?auto_134205 ?auto_134190 ) ) ( ON_BOARD ?auto_134202 ?auto_134200 ) ( not ( = ?auto_134206 ?auto_134202 ) ) ( SUPPORTS ?auto_134202 ?auto_134191 ) ( CALIBRATION_TARGET ?auto_134202 ?auto_134205 ) ( not ( = ?auto_134205 ?auto_134194 ) ) ( ON_BOARD ?auto_134204 ?auto_134200 ) ( not ( = ?auto_134202 ?auto_134204 ) ) ( SUPPORTS ?auto_134204 ?auto_134195 ) ( CALIBRATION_TARGET ?auto_134204 ?auto_134205 ) ( POWER_AVAIL ?auto_134200 ) ( POINTING ?auto_134200 ?auto_134203 ) ( not ( = ?auto_134205 ?auto_134203 ) ) ( not ( = ?auto_134194 ?auto_134203 ) ) ( not ( = ?auto_134195 ?auto_134191 ) ) ( not ( = ?auto_134190 ?auto_134203 ) ) ( not ( = ?auto_134195 ?auto_134197 ) ) ( not ( = ?auto_134191 ?auto_134197 ) ) ( not ( = ?auto_134196 ?auto_134203 ) ) ( not ( = ?auto_134206 ?auto_134204 ) ) ( not ( = ?auto_134195 ?auto_134192 ) ) ( not ( = ?auto_134191 ?auto_134192 ) ) ( not ( = ?auto_134197 ?auto_134192 ) ) ( not ( = ?auto_134193 ?auto_134203 ) ) ( not ( = ?auto_134201 ?auto_134202 ) ) ( not ( = ?auto_134201 ?auto_134204 ) ) ( not ( = ?auto_134195 ?auto_134199 ) ) ( not ( = ?auto_134191 ?auto_134199 ) ) ( not ( = ?auto_134197 ?auto_134199 ) ) ( not ( = ?auto_134192 ?auto_134199 ) ) ( not ( = ?auto_134198 ?auto_134203 ) ) ( not ( = ?auto_134207 ?auto_134206 ) ) ( not ( = ?auto_134207 ?auto_134202 ) ) ( not ( = ?auto_134207 ?auto_134204 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_134194 ?auto_134195 ?auto_134190 ?auto_134191 ?auto_134196 ?auto_134197 ?auto_134198 ?auto_134199 ?auto_134193 ?auto_134192 )
      ( GET-5IMAGE-VERIFY ?auto_134190 ?auto_134191 ?auto_134193 ?auto_134192 ?auto_134194 ?auto_134195 ?auto_134196 ?auto_134197 ?auto_134198 ?auto_134199 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_134268 - DIRECTION
      ?auto_134269 - MODE
      ?auto_134271 - DIRECTION
      ?auto_134270 - MODE
      ?auto_134272 - DIRECTION
      ?auto_134273 - MODE
      ?auto_134274 - DIRECTION
      ?auto_134275 - MODE
      ?auto_134276 - DIRECTION
      ?auto_134277 - MODE
    )
    :vars
    (
      ?auto_134285 - INSTRUMENT
      ?auto_134278 - SATELLITE
      ?auto_134283 - DIRECTION
      ?auto_134279 - INSTRUMENT
      ?auto_134284 - INSTRUMENT
      ?auto_134280 - INSTRUMENT
      ?auto_134282 - INSTRUMENT
      ?auto_134281 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_134271 ?auto_134268 ) ) ( not ( = ?auto_134272 ?auto_134268 ) ) ( not ( = ?auto_134272 ?auto_134271 ) ) ( not ( = ?auto_134274 ?auto_134268 ) ) ( not ( = ?auto_134274 ?auto_134271 ) ) ( not ( = ?auto_134274 ?auto_134272 ) ) ( not ( = ?auto_134276 ?auto_134268 ) ) ( not ( = ?auto_134276 ?auto_134271 ) ) ( not ( = ?auto_134276 ?auto_134272 ) ) ( not ( = ?auto_134276 ?auto_134274 ) ) ( ON_BOARD ?auto_134285 ?auto_134278 ) ( SUPPORTS ?auto_134285 ?auto_134275 ) ( not ( = ?auto_134274 ?auto_134283 ) ) ( CALIBRATION_TARGET ?auto_134285 ?auto_134283 ) ( not ( = ?auto_134283 ?auto_134271 ) ) ( ON_BOARD ?auto_134279 ?auto_134278 ) ( not ( = ?auto_134285 ?auto_134279 ) ) ( SUPPORTS ?auto_134279 ?auto_134270 ) ( CALIBRATION_TARGET ?auto_134279 ?auto_134283 ) ( not ( = ?auto_134283 ?auto_134276 ) ) ( ON_BOARD ?auto_134284 ?auto_134278 ) ( not ( = ?auto_134279 ?auto_134284 ) ) ( SUPPORTS ?auto_134284 ?auto_134277 ) ( CALIBRATION_TARGET ?auto_134284 ?auto_134283 ) ( not ( = ?auto_134283 ?auto_134268 ) ) ( ON_BOARD ?auto_134280 ?auto_134278 ) ( not ( = ?auto_134284 ?auto_134280 ) ) ( SUPPORTS ?auto_134280 ?auto_134269 ) ( CALIBRATION_TARGET ?auto_134280 ?auto_134283 ) ( not ( = ?auto_134283 ?auto_134272 ) ) ( ON_BOARD ?auto_134282 ?auto_134278 ) ( not ( = ?auto_134280 ?auto_134282 ) ) ( SUPPORTS ?auto_134282 ?auto_134273 ) ( CALIBRATION_TARGET ?auto_134282 ?auto_134283 ) ( POWER_AVAIL ?auto_134278 ) ( POINTING ?auto_134278 ?auto_134281 ) ( not ( = ?auto_134283 ?auto_134281 ) ) ( not ( = ?auto_134272 ?auto_134281 ) ) ( not ( = ?auto_134273 ?auto_134269 ) ) ( not ( = ?auto_134268 ?auto_134281 ) ) ( not ( = ?auto_134273 ?auto_134277 ) ) ( not ( = ?auto_134269 ?auto_134277 ) ) ( not ( = ?auto_134276 ?auto_134281 ) ) ( not ( = ?auto_134284 ?auto_134282 ) ) ( not ( = ?auto_134273 ?auto_134270 ) ) ( not ( = ?auto_134269 ?auto_134270 ) ) ( not ( = ?auto_134277 ?auto_134270 ) ) ( not ( = ?auto_134271 ?auto_134281 ) ) ( not ( = ?auto_134279 ?auto_134280 ) ) ( not ( = ?auto_134279 ?auto_134282 ) ) ( not ( = ?auto_134273 ?auto_134275 ) ) ( not ( = ?auto_134269 ?auto_134275 ) ) ( not ( = ?auto_134277 ?auto_134275 ) ) ( not ( = ?auto_134270 ?auto_134275 ) ) ( not ( = ?auto_134274 ?auto_134281 ) ) ( not ( = ?auto_134285 ?auto_134284 ) ) ( not ( = ?auto_134285 ?auto_134280 ) ) ( not ( = ?auto_134285 ?auto_134282 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_134272 ?auto_134273 ?auto_134268 ?auto_134269 ?auto_134276 ?auto_134277 ?auto_134274 ?auto_134275 ?auto_134271 ?auto_134270 )
      ( GET-5IMAGE-VERIFY ?auto_134268 ?auto_134269 ?auto_134271 ?auto_134270 ?auto_134272 ?auto_134273 ?auto_134274 ?auto_134275 ?auto_134276 ?auto_134277 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_134516 - DIRECTION
      ?auto_134517 - MODE
      ?auto_134519 - DIRECTION
      ?auto_134518 - MODE
      ?auto_134520 - DIRECTION
      ?auto_134521 - MODE
      ?auto_134522 - DIRECTION
      ?auto_134523 - MODE
      ?auto_134524 - DIRECTION
      ?auto_134525 - MODE
    )
    :vars
    (
      ?auto_134533 - INSTRUMENT
      ?auto_134526 - SATELLITE
      ?auto_134531 - DIRECTION
      ?auto_134527 - INSTRUMENT
      ?auto_134532 - INSTRUMENT
      ?auto_134528 - INSTRUMENT
      ?auto_134530 - INSTRUMENT
      ?auto_134529 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_134519 ?auto_134516 ) ) ( not ( = ?auto_134520 ?auto_134516 ) ) ( not ( = ?auto_134520 ?auto_134519 ) ) ( not ( = ?auto_134522 ?auto_134516 ) ) ( not ( = ?auto_134522 ?auto_134519 ) ) ( not ( = ?auto_134522 ?auto_134520 ) ) ( not ( = ?auto_134524 ?auto_134516 ) ) ( not ( = ?auto_134524 ?auto_134519 ) ) ( not ( = ?auto_134524 ?auto_134520 ) ) ( not ( = ?auto_134524 ?auto_134522 ) ) ( ON_BOARD ?auto_134533 ?auto_134526 ) ( SUPPORTS ?auto_134533 ?auto_134525 ) ( not ( = ?auto_134524 ?auto_134531 ) ) ( CALIBRATION_TARGET ?auto_134533 ?auto_134531 ) ( not ( = ?auto_134531 ?auto_134519 ) ) ( ON_BOARD ?auto_134527 ?auto_134526 ) ( not ( = ?auto_134533 ?auto_134527 ) ) ( SUPPORTS ?auto_134527 ?auto_134518 ) ( CALIBRATION_TARGET ?auto_134527 ?auto_134531 ) ( not ( = ?auto_134531 ?auto_134520 ) ) ( ON_BOARD ?auto_134532 ?auto_134526 ) ( not ( = ?auto_134527 ?auto_134532 ) ) ( SUPPORTS ?auto_134532 ?auto_134521 ) ( CALIBRATION_TARGET ?auto_134532 ?auto_134531 ) ( not ( = ?auto_134531 ?auto_134516 ) ) ( ON_BOARD ?auto_134528 ?auto_134526 ) ( not ( = ?auto_134532 ?auto_134528 ) ) ( SUPPORTS ?auto_134528 ?auto_134517 ) ( CALIBRATION_TARGET ?auto_134528 ?auto_134531 ) ( not ( = ?auto_134531 ?auto_134522 ) ) ( ON_BOARD ?auto_134530 ?auto_134526 ) ( not ( = ?auto_134528 ?auto_134530 ) ) ( SUPPORTS ?auto_134530 ?auto_134523 ) ( CALIBRATION_TARGET ?auto_134530 ?auto_134531 ) ( POWER_AVAIL ?auto_134526 ) ( POINTING ?auto_134526 ?auto_134529 ) ( not ( = ?auto_134531 ?auto_134529 ) ) ( not ( = ?auto_134522 ?auto_134529 ) ) ( not ( = ?auto_134523 ?auto_134517 ) ) ( not ( = ?auto_134516 ?auto_134529 ) ) ( not ( = ?auto_134523 ?auto_134521 ) ) ( not ( = ?auto_134517 ?auto_134521 ) ) ( not ( = ?auto_134520 ?auto_134529 ) ) ( not ( = ?auto_134532 ?auto_134530 ) ) ( not ( = ?auto_134523 ?auto_134518 ) ) ( not ( = ?auto_134517 ?auto_134518 ) ) ( not ( = ?auto_134521 ?auto_134518 ) ) ( not ( = ?auto_134519 ?auto_134529 ) ) ( not ( = ?auto_134527 ?auto_134528 ) ) ( not ( = ?auto_134527 ?auto_134530 ) ) ( not ( = ?auto_134523 ?auto_134525 ) ) ( not ( = ?auto_134517 ?auto_134525 ) ) ( not ( = ?auto_134521 ?auto_134525 ) ) ( not ( = ?auto_134518 ?auto_134525 ) ) ( not ( = ?auto_134524 ?auto_134529 ) ) ( not ( = ?auto_134533 ?auto_134532 ) ) ( not ( = ?auto_134533 ?auto_134528 ) ) ( not ( = ?auto_134533 ?auto_134530 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_134522 ?auto_134523 ?auto_134516 ?auto_134517 ?auto_134520 ?auto_134521 ?auto_134524 ?auto_134525 ?auto_134519 ?auto_134518 )
      ( GET-5IMAGE-VERIFY ?auto_134516 ?auto_134517 ?auto_134519 ?auto_134518 ?auto_134520 ?auto_134521 ?auto_134522 ?auto_134523 ?auto_134524 ?auto_134525 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_134594 - DIRECTION
      ?auto_134595 - MODE
      ?auto_134597 - DIRECTION
      ?auto_134596 - MODE
      ?auto_134598 - DIRECTION
      ?auto_134599 - MODE
      ?auto_134600 - DIRECTION
      ?auto_134601 - MODE
      ?auto_134602 - DIRECTION
      ?auto_134603 - MODE
    )
    :vars
    (
      ?auto_134611 - INSTRUMENT
      ?auto_134604 - SATELLITE
      ?auto_134609 - DIRECTION
      ?auto_134605 - INSTRUMENT
      ?auto_134610 - INSTRUMENT
      ?auto_134606 - INSTRUMENT
      ?auto_134608 - INSTRUMENT
      ?auto_134607 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_134597 ?auto_134594 ) ) ( not ( = ?auto_134598 ?auto_134594 ) ) ( not ( = ?auto_134598 ?auto_134597 ) ) ( not ( = ?auto_134600 ?auto_134594 ) ) ( not ( = ?auto_134600 ?auto_134597 ) ) ( not ( = ?auto_134600 ?auto_134598 ) ) ( not ( = ?auto_134602 ?auto_134594 ) ) ( not ( = ?auto_134602 ?auto_134597 ) ) ( not ( = ?auto_134602 ?auto_134598 ) ) ( not ( = ?auto_134602 ?auto_134600 ) ) ( ON_BOARD ?auto_134611 ?auto_134604 ) ( SUPPORTS ?auto_134611 ?auto_134601 ) ( not ( = ?auto_134600 ?auto_134609 ) ) ( CALIBRATION_TARGET ?auto_134611 ?auto_134609 ) ( not ( = ?auto_134609 ?auto_134597 ) ) ( ON_BOARD ?auto_134605 ?auto_134604 ) ( not ( = ?auto_134611 ?auto_134605 ) ) ( SUPPORTS ?auto_134605 ?auto_134596 ) ( CALIBRATION_TARGET ?auto_134605 ?auto_134609 ) ( not ( = ?auto_134609 ?auto_134598 ) ) ( ON_BOARD ?auto_134610 ?auto_134604 ) ( not ( = ?auto_134605 ?auto_134610 ) ) ( SUPPORTS ?auto_134610 ?auto_134599 ) ( CALIBRATION_TARGET ?auto_134610 ?auto_134609 ) ( not ( = ?auto_134609 ?auto_134594 ) ) ( ON_BOARD ?auto_134606 ?auto_134604 ) ( not ( = ?auto_134610 ?auto_134606 ) ) ( SUPPORTS ?auto_134606 ?auto_134595 ) ( CALIBRATION_TARGET ?auto_134606 ?auto_134609 ) ( not ( = ?auto_134609 ?auto_134602 ) ) ( ON_BOARD ?auto_134608 ?auto_134604 ) ( not ( = ?auto_134606 ?auto_134608 ) ) ( SUPPORTS ?auto_134608 ?auto_134603 ) ( CALIBRATION_TARGET ?auto_134608 ?auto_134609 ) ( POWER_AVAIL ?auto_134604 ) ( POINTING ?auto_134604 ?auto_134607 ) ( not ( = ?auto_134609 ?auto_134607 ) ) ( not ( = ?auto_134602 ?auto_134607 ) ) ( not ( = ?auto_134603 ?auto_134595 ) ) ( not ( = ?auto_134594 ?auto_134607 ) ) ( not ( = ?auto_134603 ?auto_134599 ) ) ( not ( = ?auto_134595 ?auto_134599 ) ) ( not ( = ?auto_134598 ?auto_134607 ) ) ( not ( = ?auto_134610 ?auto_134608 ) ) ( not ( = ?auto_134603 ?auto_134596 ) ) ( not ( = ?auto_134595 ?auto_134596 ) ) ( not ( = ?auto_134599 ?auto_134596 ) ) ( not ( = ?auto_134597 ?auto_134607 ) ) ( not ( = ?auto_134605 ?auto_134606 ) ) ( not ( = ?auto_134605 ?auto_134608 ) ) ( not ( = ?auto_134603 ?auto_134601 ) ) ( not ( = ?auto_134595 ?auto_134601 ) ) ( not ( = ?auto_134599 ?auto_134601 ) ) ( not ( = ?auto_134596 ?auto_134601 ) ) ( not ( = ?auto_134600 ?auto_134607 ) ) ( not ( = ?auto_134611 ?auto_134610 ) ) ( not ( = ?auto_134611 ?auto_134606 ) ) ( not ( = ?auto_134611 ?auto_134608 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_134602 ?auto_134603 ?auto_134594 ?auto_134595 ?auto_134598 ?auto_134599 ?auto_134600 ?auto_134601 ?auto_134597 ?auto_134596 )
      ( GET-5IMAGE-VERIFY ?auto_134594 ?auto_134595 ?auto_134597 ?auto_134596 ?auto_134598 ?auto_134599 ?auto_134600 ?auto_134601 ?auto_134602 ?auto_134603 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_134922 - DIRECTION
      ?auto_134923 - MODE
      ?auto_134925 - DIRECTION
      ?auto_134924 - MODE
      ?auto_134926 - DIRECTION
      ?auto_134927 - MODE
      ?auto_134928 - DIRECTION
      ?auto_134929 - MODE
      ?auto_134930 - DIRECTION
      ?auto_134931 - MODE
    )
    :vars
    (
      ?auto_134939 - INSTRUMENT
      ?auto_134932 - SATELLITE
      ?auto_134937 - DIRECTION
      ?auto_134933 - INSTRUMENT
      ?auto_134938 - INSTRUMENT
      ?auto_134934 - INSTRUMENT
      ?auto_134936 - INSTRUMENT
      ?auto_134935 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_134925 ?auto_134922 ) ) ( not ( = ?auto_134926 ?auto_134922 ) ) ( not ( = ?auto_134926 ?auto_134925 ) ) ( not ( = ?auto_134928 ?auto_134922 ) ) ( not ( = ?auto_134928 ?auto_134925 ) ) ( not ( = ?auto_134928 ?auto_134926 ) ) ( not ( = ?auto_134930 ?auto_134922 ) ) ( not ( = ?auto_134930 ?auto_134925 ) ) ( not ( = ?auto_134930 ?auto_134926 ) ) ( not ( = ?auto_134930 ?auto_134928 ) ) ( ON_BOARD ?auto_134939 ?auto_134932 ) ( SUPPORTS ?auto_134939 ?auto_134927 ) ( not ( = ?auto_134926 ?auto_134937 ) ) ( CALIBRATION_TARGET ?auto_134939 ?auto_134937 ) ( not ( = ?auto_134937 ?auto_134925 ) ) ( ON_BOARD ?auto_134933 ?auto_134932 ) ( not ( = ?auto_134939 ?auto_134933 ) ) ( SUPPORTS ?auto_134933 ?auto_134924 ) ( CALIBRATION_TARGET ?auto_134933 ?auto_134937 ) ( not ( = ?auto_134937 ?auto_134930 ) ) ( ON_BOARD ?auto_134938 ?auto_134932 ) ( not ( = ?auto_134933 ?auto_134938 ) ) ( SUPPORTS ?auto_134938 ?auto_134931 ) ( CALIBRATION_TARGET ?auto_134938 ?auto_134937 ) ( not ( = ?auto_134937 ?auto_134922 ) ) ( ON_BOARD ?auto_134934 ?auto_134932 ) ( not ( = ?auto_134938 ?auto_134934 ) ) ( SUPPORTS ?auto_134934 ?auto_134923 ) ( CALIBRATION_TARGET ?auto_134934 ?auto_134937 ) ( not ( = ?auto_134937 ?auto_134928 ) ) ( ON_BOARD ?auto_134936 ?auto_134932 ) ( not ( = ?auto_134934 ?auto_134936 ) ) ( SUPPORTS ?auto_134936 ?auto_134929 ) ( CALIBRATION_TARGET ?auto_134936 ?auto_134937 ) ( POWER_AVAIL ?auto_134932 ) ( POINTING ?auto_134932 ?auto_134935 ) ( not ( = ?auto_134937 ?auto_134935 ) ) ( not ( = ?auto_134928 ?auto_134935 ) ) ( not ( = ?auto_134929 ?auto_134923 ) ) ( not ( = ?auto_134922 ?auto_134935 ) ) ( not ( = ?auto_134929 ?auto_134931 ) ) ( not ( = ?auto_134923 ?auto_134931 ) ) ( not ( = ?auto_134930 ?auto_134935 ) ) ( not ( = ?auto_134938 ?auto_134936 ) ) ( not ( = ?auto_134929 ?auto_134924 ) ) ( not ( = ?auto_134923 ?auto_134924 ) ) ( not ( = ?auto_134931 ?auto_134924 ) ) ( not ( = ?auto_134925 ?auto_134935 ) ) ( not ( = ?auto_134933 ?auto_134934 ) ) ( not ( = ?auto_134933 ?auto_134936 ) ) ( not ( = ?auto_134929 ?auto_134927 ) ) ( not ( = ?auto_134923 ?auto_134927 ) ) ( not ( = ?auto_134931 ?auto_134927 ) ) ( not ( = ?auto_134924 ?auto_134927 ) ) ( not ( = ?auto_134926 ?auto_134935 ) ) ( not ( = ?auto_134939 ?auto_134938 ) ) ( not ( = ?auto_134939 ?auto_134934 ) ) ( not ( = ?auto_134939 ?auto_134936 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_134928 ?auto_134929 ?auto_134922 ?auto_134923 ?auto_134930 ?auto_134931 ?auto_134926 ?auto_134927 ?auto_134925 ?auto_134924 )
      ( GET-5IMAGE-VERIFY ?auto_134922 ?auto_134923 ?auto_134925 ?auto_134924 ?auto_134926 ?auto_134927 ?auto_134928 ?auto_134929 ?auto_134930 ?auto_134931 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_135086 - DIRECTION
      ?auto_135087 - MODE
      ?auto_135089 - DIRECTION
      ?auto_135088 - MODE
      ?auto_135090 - DIRECTION
      ?auto_135091 - MODE
      ?auto_135092 - DIRECTION
      ?auto_135093 - MODE
      ?auto_135094 - DIRECTION
      ?auto_135095 - MODE
    )
    :vars
    (
      ?auto_135103 - INSTRUMENT
      ?auto_135096 - SATELLITE
      ?auto_135101 - DIRECTION
      ?auto_135097 - INSTRUMENT
      ?auto_135102 - INSTRUMENT
      ?auto_135098 - INSTRUMENT
      ?auto_135100 - INSTRUMENT
      ?auto_135099 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_135089 ?auto_135086 ) ) ( not ( = ?auto_135090 ?auto_135086 ) ) ( not ( = ?auto_135090 ?auto_135089 ) ) ( not ( = ?auto_135092 ?auto_135086 ) ) ( not ( = ?auto_135092 ?auto_135089 ) ) ( not ( = ?auto_135092 ?auto_135090 ) ) ( not ( = ?auto_135094 ?auto_135086 ) ) ( not ( = ?auto_135094 ?auto_135089 ) ) ( not ( = ?auto_135094 ?auto_135090 ) ) ( not ( = ?auto_135094 ?auto_135092 ) ) ( ON_BOARD ?auto_135103 ?auto_135096 ) ( SUPPORTS ?auto_135103 ?auto_135091 ) ( not ( = ?auto_135090 ?auto_135101 ) ) ( CALIBRATION_TARGET ?auto_135103 ?auto_135101 ) ( not ( = ?auto_135101 ?auto_135089 ) ) ( ON_BOARD ?auto_135097 ?auto_135096 ) ( not ( = ?auto_135103 ?auto_135097 ) ) ( SUPPORTS ?auto_135097 ?auto_135088 ) ( CALIBRATION_TARGET ?auto_135097 ?auto_135101 ) ( not ( = ?auto_135101 ?auto_135092 ) ) ( ON_BOARD ?auto_135102 ?auto_135096 ) ( not ( = ?auto_135097 ?auto_135102 ) ) ( SUPPORTS ?auto_135102 ?auto_135093 ) ( CALIBRATION_TARGET ?auto_135102 ?auto_135101 ) ( not ( = ?auto_135101 ?auto_135086 ) ) ( ON_BOARD ?auto_135098 ?auto_135096 ) ( not ( = ?auto_135102 ?auto_135098 ) ) ( SUPPORTS ?auto_135098 ?auto_135087 ) ( CALIBRATION_TARGET ?auto_135098 ?auto_135101 ) ( not ( = ?auto_135101 ?auto_135094 ) ) ( ON_BOARD ?auto_135100 ?auto_135096 ) ( not ( = ?auto_135098 ?auto_135100 ) ) ( SUPPORTS ?auto_135100 ?auto_135095 ) ( CALIBRATION_TARGET ?auto_135100 ?auto_135101 ) ( POWER_AVAIL ?auto_135096 ) ( POINTING ?auto_135096 ?auto_135099 ) ( not ( = ?auto_135101 ?auto_135099 ) ) ( not ( = ?auto_135094 ?auto_135099 ) ) ( not ( = ?auto_135095 ?auto_135087 ) ) ( not ( = ?auto_135086 ?auto_135099 ) ) ( not ( = ?auto_135095 ?auto_135093 ) ) ( not ( = ?auto_135087 ?auto_135093 ) ) ( not ( = ?auto_135092 ?auto_135099 ) ) ( not ( = ?auto_135102 ?auto_135100 ) ) ( not ( = ?auto_135095 ?auto_135088 ) ) ( not ( = ?auto_135087 ?auto_135088 ) ) ( not ( = ?auto_135093 ?auto_135088 ) ) ( not ( = ?auto_135089 ?auto_135099 ) ) ( not ( = ?auto_135097 ?auto_135098 ) ) ( not ( = ?auto_135097 ?auto_135100 ) ) ( not ( = ?auto_135095 ?auto_135091 ) ) ( not ( = ?auto_135087 ?auto_135091 ) ) ( not ( = ?auto_135093 ?auto_135091 ) ) ( not ( = ?auto_135088 ?auto_135091 ) ) ( not ( = ?auto_135090 ?auto_135099 ) ) ( not ( = ?auto_135103 ?auto_135102 ) ) ( not ( = ?auto_135103 ?auto_135098 ) ) ( not ( = ?auto_135103 ?auto_135100 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_135094 ?auto_135095 ?auto_135086 ?auto_135087 ?auto_135092 ?auto_135093 ?auto_135090 ?auto_135091 ?auto_135089 ?auto_135088 )
      ( GET-5IMAGE-VERIFY ?auto_135086 ?auto_135087 ?auto_135089 ?auto_135088 ?auto_135090 ?auto_135091 ?auto_135092 ?auto_135093 ?auto_135094 ?auto_135095 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_135668 - DIRECTION
      ?auto_135669 - MODE
      ?auto_135671 - DIRECTION
      ?auto_135670 - MODE
      ?auto_135672 - DIRECTION
      ?auto_135673 - MODE
      ?auto_135674 - DIRECTION
      ?auto_135675 - MODE
      ?auto_135676 - DIRECTION
      ?auto_135677 - MODE
    )
    :vars
    (
      ?auto_135685 - INSTRUMENT
      ?auto_135678 - SATELLITE
      ?auto_135683 - DIRECTION
      ?auto_135679 - INSTRUMENT
      ?auto_135684 - INSTRUMENT
      ?auto_135680 - INSTRUMENT
      ?auto_135682 - INSTRUMENT
      ?auto_135681 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_135671 ?auto_135668 ) ) ( not ( = ?auto_135672 ?auto_135668 ) ) ( not ( = ?auto_135672 ?auto_135671 ) ) ( not ( = ?auto_135674 ?auto_135668 ) ) ( not ( = ?auto_135674 ?auto_135671 ) ) ( not ( = ?auto_135674 ?auto_135672 ) ) ( not ( = ?auto_135676 ?auto_135668 ) ) ( not ( = ?auto_135676 ?auto_135671 ) ) ( not ( = ?auto_135676 ?auto_135672 ) ) ( not ( = ?auto_135676 ?auto_135674 ) ) ( ON_BOARD ?auto_135685 ?auto_135678 ) ( SUPPORTS ?auto_135685 ?auto_135670 ) ( not ( = ?auto_135671 ?auto_135683 ) ) ( CALIBRATION_TARGET ?auto_135685 ?auto_135683 ) ( not ( = ?auto_135683 ?auto_135676 ) ) ( ON_BOARD ?auto_135679 ?auto_135678 ) ( not ( = ?auto_135685 ?auto_135679 ) ) ( SUPPORTS ?auto_135679 ?auto_135677 ) ( CALIBRATION_TARGET ?auto_135679 ?auto_135683 ) ( not ( = ?auto_135683 ?auto_135674 ) ) ( ON_BOARD ?auto_135684 ?auto_135678 ) ( not ( = ?auto_135679 ?auto_135684 ) ) ( SUPPORTS ?auto_135684 ?auto_135675 ) ( CALIBRATION_TARGET ?auto_135684 ?auto_135683 ) ( not ( = ?auto_135683 ?auto_135668 ) ) ( ON_BOARD ?auto_135680 ?auto_135678 ) ( not ( = ?auto_135684 ?auto_135680 ) ) ( SUPPORTS ?auto_135680 ?auto_135669 ) ( CALIBRATION_TARGET ?auto_135680 ?auto_135683 ) ( not ( = ?auto_135683 ?auto_135672 ) ) ( ON_BOARD ?auto_135682 ?auto_135678 ) ( not ( = ?auto_135680 ?auto_135682 ) ) ( SUPPORTS ?auto_135682 ?auto_135673 ) ( CALIBRATION_TARGET ?auto_135682 ?auto_135683 ) ( POWER_AVAIL ?auto_135678 ) ( POINTING ?auto_135678 ?auto_135681 ) ( not ( = ?auto_135683 ?auto_135681 ) ) ( not ( = ?auto_135672 ?auto_135681 ) ) ( not ( = ?auto_135673 ?auto_135669 ) ) ( not ( = ?auto_135668 ?auto_135681 ) ) ( not ( = ?auto_135673 ?auto_135675 ) ) ( not ( = ?auto_135669 ?auto_135675 ) ) ( not ( = ?auto_135674 ?auto_135681 ) ) ( not ( = ?auto_135684 ?auto_135682 ) ) ( not ( = ?auto_135673 ?auto_135677 ) ) ( not ( = ?auto_135669 ?auto_135677 ) ) ( not ( = ?auto_135675 ?auto_135677 ) ) ( not ( = ?auto_135676 ?auto_135681 ) ) ( not ( = ?auto_135679 ?auto_135680 ) ) ( not ( = ?auto_135679 ?auto_135682 ) ) ( not ( = ?auto_135673 ?auto_135670 ) ) ( not ( = ?auto_135669 ?auto_135670 ) ) ( not ( = ?auto_135675 ?auto_135670 ) ) ( not ( = ?auto_135677 ?auto_135670 ) ) ( not ( = ?auto_135671 ?auto_135681 ) ) ( not ( = ?auto_135685 ?auto_135684 ) ) ( not ( = ?auto_135685 ?auto_135680 ) ) ( not ( = ?auto_135685 ?auto_135682 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_135672 ?auto_135673 ?auto_135668 ?auto_135669 ?auto_135674 ?auto_135675 ?auto_135671 ?auto_135670 ?auto_135676 ?auto_135677 )
      ( GET-5IMAGE-VERIFY ?auto_135668 ?auto_135669 ?auto_135671 ?auto_135670 ?auto_135672 ?auto_135673 ?auto_135674 ?auto_135675 ?auto_135676 ?auto_135677 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_135746 - DIRECTION
      ?auto_135747 - MODE
      ?auto_135749 - DIRECTION
      ?auto_135748 - MODE
      ?auto_135750 - DIRECTION
      ?auto_135751 - MODE
      ?auto_135752 - DIRECTION
      ?auto_135753 - MODE
      ?auto_135754 - DIRECTION
      ?auto_135755 - MODE
    )
    :vars
    (
      ?auto_135763 - INSTRUMENT
      ?auto_135756 - SATELLITE
      ?auto_135761 - DIRECTION
      ?auto_135757 - INSTRUMENT
      ?auto_135762 - INSTRUMENT
      ?auto_135758 - INSTRUMENT
      ?auto_135760 - INSTRUMENT
      ?auto_135759 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_135749 ?auto_135746 ) ) ( not ( = ?auto_135750 ?auto_135746 ) ) ( not ( = ?auto_135750 ?auto_135749 ) ) ( not ( = ?auto_135752 ?auto_135746 ) ) ( not ( = ?auto_135752 ?auto_135749 ) ) ( not ( = ?auto_135752 ?auto_135750 ) ) ( not ( = ?auto_135754 ?auto_135746 ) ) ( not ( = ?auto_135754 ?auto_135749 ) ) ( not ( = ?auto_135754 ?auto_135750 ) ) ( not ( = ?auto_135754 ?auto_135752 ) ) ( ON_BOARD ?auto_135763 ?auto_135756 ) ( SUPPORTS ?auto_135763 ?auto_135748 ) ( not ( = ?auto_135749 ?auto_135761 ) ) ( CALIBRATION_TARGET ?auto_135763 ?auto_135761 ) ( not ( = ?auto_135761 ?auto_135752 ) ) ( ON_BOARD ?auto_135757 ?auto_135756 ) ( not ( = ?auto_135763 ?auto_135757 ) ) ( SUPPORTS ?auto_135757 ?auto_135753 ) ( CALIBRATION_TARGET ?auto_135757 ?auto_135761 ) ( not ( = ?auto_135761 ?auto_135754 ) ) ( ON_BOARD ?auto_135762 ?auto_135756 ) ( not ( = ?auto_135757 ?auto_135762 ) ) ( SUPPORTS ?auto_135762 ?auto_135755 ) ( CALIBRATION_TARGET ?auto_135762 ?auto_135761 ) ( not ( = ?auto_135761 ?auto_135746 ) ) ( ON_BOARD ?auto_135758 ?auto_135756 ) ( not ( = ?auto_135762 ?auto_135758 ) ) ( SUPPORTS ?auto_135758 ?auto_135747 ) ( CALIBRATION_TARGET ?auto_135758 ?auto_135761 ) ( not ( = ?auto_135761 ?auto_135750 ) ) ( ON_BOARD ?auto_135760 ?auto_135756 ) ( not ( = ?auto_135758 ?auto_135760 ) ) ( SUPPORTS ?auto_135760 ?auto_135751 ) ( CALIBRATION_TARGET ?auto_135760 ?auto_135761 ) ( POWER_AVAIL ?auto_135756 ) ( POINTING ?auto_135756 ?auto_135759 ) ( not ( = ?auto_135761 ?auto_135759 ) ) ( not ( = ?auto_135750 ?auto_135759 ) ) ( not ( = ?auto_135751 ?auto_135747 ) ) ( not ( = ?auto_135746 ?auto_135759 ) ) ( not ( = ?auto_135751 ?auto_135755 ) ) ( not ( = ?auto_135747 ?auto_135755 ) ) ( not ( = ?auto_135754 ?auto_135759 ) ) ( not ( = ?auto_135762 ?auto_135760 ) ) ( not ( = ?auto_135751 ?auto_135753 ) ) ( not ( = ?auto_135747 ?auto_135753 ) ) ( not ( = ?auto_135755 ?auto_135753 ) ) ( not ( = ?auto_135752 ?auto_135759 ) ) ( not ( = ?auto_135757 ?auto_135758 ) ) ( not ( = ?auto_135757 ?auto_135760 ) ) ( not ( = ?auto_135751 ?auto_135748 ) ) ( not ( = ?auto_135747 ?auto_135748 ) ) ( not ( = ?auto_135755 ?auto_135748 ) ) ( not ( = ?auto_135753 ?auto_135748 ) ) ( not ( = ?auto_135749 ?auto_135759 ) ) ( not ( = ?auto_135763 ?auto_135762 ) ) ( not ( = ?auto_135763 ?auto_135758 ) ) ( not ( = ?auto_135763 ?auto_135760 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_135750 ?auto_135751 ?auto_135746 ?auto_135747 ?auto_135754 ?auto_135755 ?auto_135749 ?auto_135748 ?auto_135752 ?auto_135753 )
      ( GET-5IMAGE-VERIFY ?auto_135746 ?auto_135747 ?auto_135749 ?auto_135748 ?auto_135750 ?auto_135751 ?auto_135752 ?auto_135753 ?auto_135754 ?auto_135755 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_136516 - DIRECTION
      ?auto_136517 - MODE
      ?auto_136519 - DIRECTION
      ?auto_136518 - MODE
      ?auto_136520 - DIRECTION
      ?auto_136521 - MODE
      ?auto_136522 - DIRECTION
      ?auto_136523 - MODE
      ?auto_136524 - DIRECTION
      ?auto_136525 - MODE
    )
    :vars
    (
      ?auto_136533 - INSTRUMENT
      ?auto_136526 - SATELLITE
      ?auto_136531 - DIRECTION
      ?auto_136527 - INSTRUMENT
      ?auto_136532 - INSTRUMENT
      ?auto_136528 - INSTRUMENT
      ?auto_136530 - INSTRUMENT
      ?auto_136529 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_136519 ?auto_136516 ) ) ( not ( = ?auto_136520 ?auto_136516 ) ) ( not ( = ?auto_136520 ?auto_136519 ) ) ( not ( = ?auto_136522 ?auto_136516 ) ) ( not ( = ?auto_136522 ?auto_136519 ) ) ( not ( = ?auto_136522 ?auto_136520 ) ) ( not ( = ?auto_136524 ?auto_136516 ) ) ( not ( = ?auto_136524 ?auto_136519 ) ) ( not ( = ?auto_136524 ?auto_136520 ) ) ( not ( = ?auto_136524 ?auto_136522 ) ) ( ON_BOARD ?auto_136533 ?auto_136526 ) ( SUPPORTS ?auto_136533 ?auto_136518 ) ( not ( = ?auto_136519 ?auto_136531 ) ) ( CALIBRATION_TARGET ?auto_136533 ?auto_136531 ) ( not ( = ?auto_136531 ?auto_136524 ) ) ( ON_BOARD ?auto_136527 ?auto_136526 ) ( not ( = ?auto_136533 ?auto_136527 ) ) ( SUPPORTS ?auto_136527 ?auto_136525 ) ( CALIBRATION_TARGET ?auto_136527 ?auto_136531 ) ( not ( = ?auto_136531 ?auto_136520 ) ) ( ON_BOARD ?auto_136532 ?auto_136526 ) ( not ( = ?auto_136527 ?auto_136532 ) ) ( SUPPORTS ?auto_136532 ?auto_136521 ) ( CALIBRATION_TARGET ?auto_136532 ?auto_136531 ) ( not ( = ?auto_136531 ?auto_136516 ) ) ( ON_BOARD ?auto_136528 ?auto_136526 ) ( not ( = ?auto_136532 ?auto_136528 ) ) ( SUPPORTS ?auto_136528 ?auto_136517 ) ( CALIBRATION_TARGET ?auto_136528 ?auto_136531 ) ( not ( = ?auto_136531 ?auto_136522 ) ) ( ON_BOARD ?auto_136530 ?auto_136526 ) ( not ( = ?auto_136528 ?auto_136530 ) ) ( SUPPORTS ?auto_136530 ?auto_136523 ) ( CALIBRATION_TARGET ?auto_136530 ?auto_136531 ) ( POWER_AVAIL ?auto_136526 ) ( POINTING ?auto_136526 ?auto_136529 ) ( not ( = ?auto_136531 ?auto_136529 ) ) ( not ( = ?auto_136522 ?auto_136529 ) ) ( not ( = ?auto_136523 ?auto_136517 ) ) ( not ( = ?auto_136516 ?auto_136529 ) ) ( not ( = ?auto_136523 ?auto_136521 ) ) ( not ( = ?auto_136517 ?auto_136521 ) ) ( not ( = ?auto_136520 ?auto_136529 ) ) ( not ( = ?auto_136532 ?auto_136530 ) ) ( not ( = ?auto_136523 ?auto_136525 ) ) ( not ( = ?auto_136517 ?auto_136525 ) ) ( not ( = ?auto_136521 ?auto_136525 ) ) ( not ( = ?auto_136524 ?auto_136529 ) ) ( not ( = ?auto_136527 ?auto_136528 ) ) ( not ( = ?auto_136527 ?auto_136530 ) ) ( not ( = ?auto_136523 ?auto_136518 ) ) ( not ( = ?auto_136517 ?auto_136518 ) ) ( not ( = ?auto_136521 ?auto_136518 ) ) ( not ( = ?auto_136525 ?auto_136518 ) ) ( not ( = ?auto_136519 ?auto_136529 ) ) ( not ( = ?auto_136533 ?auto_136532 ) ) ( not ( = ?auto_136533 ?auto_136528 ) ) ( not ( = ?auto_136533 ?auto_136530 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_136522 ?auto_136523 ?auto_136516 ?auto_136517 ?auto_136520 ?auto_136521 ?auto_136519 ?auto_136518 ?auto_136524 ?auto_136525 )
      ( GET-5IMAGE-VERIFY ?auto_136516 ?auto_136517 ?auto_136519 ?auto_136518 ?auto_136520 ?auto_136521 ?auto_136522 ?auto_136523 ?auto_136524 ?auto_136525 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_136766 - DIRECTION
      ?auto_136767 - MODE
      ?auto_136769 - DIRECTION
      ?auto_136768 - MODE
      ?auto_136770 - DIRECTION
      ?auto_136771 - MODE
      ?auto_136772 - DIRECTION
      ?auto_136773 - MODE
      ?auto_136774 - DIRECTION
      ?auto_136775 - MODE
    )
    :vars
    (
      ?auto_136783 - INSTRUMENT
      ?auto_136776 - SATELLITE
      ?auto_136781 - DIRECTION
      ?auto_136777 - INSTRUMENT
      ?auto_136782 - INSTRUMENT
      ?auto_136778 - INSTRUMENT
      ?auto_136780 - INSTRUMENT
      ?auto_136779 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_136769 ?auto_136766 ) ) ( not ( = ?auto_136770 ?auto_136766 ) ) ( not ( = ?auto_136770 ?auto_136769 ) ) ( not ( = ?auto_136772 ?auto_136766 ) ) ( not ( = ?auto_136772 ?auto_136769 ) ) ( not ( = ?auto_136772 ?auto_136770 ) ) ( not ( = ?auto_136774 ?auto_136766 ) ) ( not ( = ?auto_136774 ?auto_136769 ) ) ( not ( = ?auto_136774 ?auto_136770 ) ) ( not ( = ?auto_136774 ?auto_136772 ) ) ( ON_BOARD ?auto_136783 ?auto_136776 ) ( SUPPORTS ?auto_136783 ?auto_136768 ) ( not ( = ?auto_136769 ?auto_136781 ) ) ( CALIBRATION_TARGET ?auto_136783 ?auto_136781 ) ( not ( = ?auto_136781 ?auto_136772 ) ) ( ON_BOARD ?auto_136777 ?auto_136776 ) ( not ( = ?auto_136783 ?auto_136777 ) ) ( SUPPORTS ?auto_136777 ?auto_136773 ) ( CALIBRATION_TARGET ?auto_136777 ?auto_136781 ) ( not ( = ?auto_136781 ?auto_136770 ) ) ( ON_BOARD ?auto_136782 ?auto_136776 ) ( not ( = ?auto_136777 ?auto_136782 ) ) ( SUPPORTS ?auto_136782 ?auto_136771 ) ( CALIBRATION_TARGET ?auto_136782 ?auto_136781 ) ( not ( = ?auto_136781 ?auto_136766 ) ) ( ON_BOARD ?auto_136778 ?auto_136776 ) ( not ( = ?auto_136782 ?auto_136778 ) ) ( SUPPORTS ?auto_136778 ?auto_136767 ) ( CALIBRATION_TARGET ?auto_136778 ?auto_136781 ) ( not ( = ?auto_136781 ?auto_136774 ) ) ( ON_BOARD ?auto_136780 ?auto_136776 ) ( not ( = ?auto_136778 ?auto_136780 ) ) ( SUPPORTS ?auto_136780 ?auto_136775 ) ( CALIBRATION_TARGET ?auto_136780 ?auto_136781 ) ( POWER_AVAIL ?auto_136776 ) ( POINTING ?auto_136776 ?auto_136779 ) ( not ( = ?auto_136781 ?auto_136779 ) ) ( not ( = ?auto_136774 ?auto_136779 ) ) ( not ( = ?auto_136775 ?auto_136767 ) ) ( not ( = ?auto_136766 ?auto_136779 ) ) ( not ( = ?auto_136775 ?auto_136771 ) ) ( not ( = ?auto_136767 ?auto_136771 ) ) ( not ( = ?auto_136770 ?auto_136779 ) ) ( not ( = ?auto_136782 ?auto_136780 ) ) ( not ( = ?auto_136775 ?auto_136773 ) ) ( not ( = ?auto_136767 ?auto_136773 ) ) ( not ( = ?auto_136771 ?auto_136773 ) ) ( not ( = ?auto_136772 ?auto_136779 ) ) ( not ( = ?auto_136777 ?auto_136778 ) ) ( not ( = ?auto_136777 ?auto_136780 ) ) ( not ( = ?auto_136775 ?auto_136768 ) ) ( not ( = ?auto_136767 ?auto_136768 ) ) ( not ( = ?auto_136771 ?auto_136768 ) ) ( not ( = ?auto_136773 ?auto_136768 ) ) ( not ( = ?auto_136769 ?auto_136779 ) ) ( not ( = ?auto_136783 ?auto_136782 ) ) ( not ( = ?auto_136783 ?auto_136778 ) ) ( not ( = ?auto_136783 ?auto_136780 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_136774 ?auto_136775 ?auto_136766 ?auto_136767 ?auto_136770 ?auto_136771 ?auto_136769 ?auto_136768 ?auto_136772 ?auto_136773 )
      ( GET-5IMAGE-VERIFY ?auto_136766 ?auto_136767 ?auto_136769 ?auto_136768 ?auto_136770 ?auto_136771 ?auto_136772 ?auto_136773 ?auto_136774 ?auto_136775 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_137010 - DIRECTION
      ?auto_137011 - MODE
      ?auto_137013 - DIRECTION
      ?auto_137012 - MODE
      ?auto_137014 - DIRECTION
      ?auto_137015 - MODE
      ?auto_137016 - DIRECTION
      ?auto_137017 - MODE
      ?auto_137018 - DIRECTION
      ?auto_137019 - MODE
    )
    :vars
    (
      ?auto_137027 - INSTRUMENT
      ?auto_137020 - SATELLITE
      ?auto_137025 - DIRECTION
      ?auto_137021 - INSTRUMENT
      ?auto_137026 - INSTRUMENT
      ?auto_137022 - INSTRUMENT
      ?auto_137024 - INSTRUMENT
      ?auto_137023 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_137013 ?auto_137010 ) ) ( not ( = ?auto_137014 ?auto_137010 ) ) ( not ( = ?auto_137014 ?auto_137013 ) ) ( not ( = ?auto_137016 ?auto_137010 ) ) ( not ( = ?auto_137016 ?auto_137013 ) ) ( not ( = ?auto_137016 ?auto_137014 ) ) ( not ( = ?auto_137018 ?auto_137010 ) ) ( not ( = ?auto_137018 ?auto_137013 ) ) ( not ( = ?auto_137018 ?auto_137014 ) ) ( not ( = ?auto_137018 ?auto_137016 ) ) ( ON_BOARD ?auto_137027 ?auto_137020 ) ( SUPPORTS ?auto_137027 ?auto_137012 ) ( not ( = ?auto_137013 ?auto_137025 ) ) ( CALIBRATION_TARGET ?auto_137027 ?auto_137025 ) ( not ( = ?auto_137025 ?auto_137014 ) ) ( ON_BOARD ?auto_137021 ?auto_137020 ) ( not ( = ?auto_137027 ?auto_137021 ) ) ( SUPPORTS ?auto_137021 ?auto_137015 ) ( CALIBRATION_TARGET ?auto_137021 ?auto_137025 ) ( not ( = ?auto_137025 ?auto_137018 ) ) ( ON_BOARD ?auto_137026 ?auto_137020 ) ( not ( = ?auto_137021 ?auto_137026 ) ) ( SUPPORTS ?auto_137026 ?auto_137019 ) ( CALIBRATION_TARGET ?auto_137026 ?auto_137025 ) ( not ( = ?auto_137025 ?auto_137010 ) ) ( ON_BOARD ?auto_137022 ?auto_137020 ) ( not ( = ?auto_137026 ?auto_137022 ) ) ( SUPPORTS ?auto_137022 ?auto_137011 ) ( CALIBRATION_TARGET ?auto_137022 ?auto_137025 ) ( not ( = ?auto_137025 ?auto_137016 ) ) ( ON_BOARD ?auto_137024 ?auto_137020 ) ( not ( = ?auto_137022 ?auto_137024 ) ) ( SUPPORTS ?auto_137024 ?auto_137017 ) ( CALIBRATION_TARGET ?auto_137024 ?auto_137025 ) ( POWER_AVAIL ?auto_137020 ) ( POINTING ?auto_137020 ?auto_137023 ) ( not ( = ?auto_137025 ?auto_137023 ) ) ( not ( = ?auto_137016 ?auto_137023 ) ) ( not ( = ?auto_137017 ?auto_137011 ) ) ( not ( = ?auto_137010 ?auto_137023 ) ) ( not ( = ?auto_137017 ?auto_137019 ) ) ( not ( = ?auto_137011 ?auto_137019 ) ) ( not ( = ?auto_137018 ?auto_137023 ) ) ( not ( = ?auto_137026 ?auto_137024 ) ) ( not ( = ?auto_137017 ?auto_137015 ) ) ( not ( = ?auto_137011 ?auto_137015 ) ) ( not ( = ?auto_137019 ?auto_137015 ) ) ( not ( = ?auto_137014 ?auto_137023 ) ) ( not ( = ?auto_137021 ?auto_137022 ) ) ( not ( = ?auto_137021 ?auto_137024 ) ) ( not ( = ?auto_137017 ?auto_137012 ) ) ( not ( = ?auto_137011 ?auto_137012 ) ) ( not ( = ?auto_137019 ?auto_137012 ) ) ( not ( = ?auto_137015 ?auto_137012 ) ) ( not ( = ?auto_137013 ?auto_137023 ) ) ( not ( = ?auto_137027 ?auto_137026 ) ) ( not ( = ?auto_137027 ?auto_137022 ) ) ( not ( = ?auto_137027 ?auto_137024 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_137016 ?auto_137017 ?auto_137010 ?auto_137011 ?auto_137018 ?auto_137019 ?auto_137013 ?auto_137012 ?auto_137014 ?auto_137015 )
      ( GET-5IMAGE-VERIFY ?auto_137010 ?auto_137011 ?auto_137013 ?auto_137012 ?auto_137014 ?auto_137015 ?auto_137016 ?auto_137017 ?auto_137018 ?auto_137019 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_137174 - DIRECTION
      ?auto_137175 - MODE
      ?auto_137177 - DIRECTION
      ?auto_137176 - MODE
      ?auto_137178 - DIRECTION
      ?auto_137179 - MODE
      ?auto_137180 - DIRECTION
      ?auto_137181 - MODE
      ?auto_137182 - DIRECTION
      ?auto_137183 - MODE
    )
    :vars
    (
      ?auto_137191 - INSTRUMENT
      ?auto_137184 - SATELLITE
      ?auto_137189 - DIRECTION
      ?auto_137185 - INSTRUMENT
      ?auto_137190 - INSTRUMENT
      ?auto_137186 - INSTRUMENT
      ?auto_137188 - INSTRUMENT
      ?auto_137187 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_137177 ?auto_137174 ) ) ( not ( = ?auto_137178 ?auto_137174 ) ) ( not ( = ?auto_137178 ?auto_137177 ) ) ( not ( = ?auto_137180 ?auto_137174 ) ) ( not ( = ?auto_137180 ?auto_137177 ) ) ( not ( = ?auto_137180 ?auto_137178 ) ) ( not ( = ?auto_137182 ?auto_137174 ) ) ( not ( = ?auto_137182 ?auto_137177 ) ) ( not ( = ?auto_137182 ?auto_137178 ) ) ( not ( = ?auto_137182 ?auto_137180 ) ) ( ON_BOARD ?auto_137191 ?auto_137184 ) ( SUPPORTS ?auto_137191 ?auto_137176 ) ( not ( = ?auto_137177 ?auto_137189 ) ) ( CALIBRATION_TARGET ?auto_137191 ?auto_137189 ) ( not ( = ?auto_137189 ?auto_137178 ) ) ( ON_BOARD ?auto_137185 ?auto_137184 ) ( not ( = ?auto_137191 ?auto_137185 ) ) ( SUPPORTS ?auto_137185 ?auto_137179 ) ( CALIBRATION_TARGET ?auto_137185 ?auto_137189 ) ( not ( = ?auto_137189 ?auto_137180 ) ) ( ON_BOARD ?auto_137190 ?auto_137184 ) ( not ( = ?auto_137185 ?auto_137190 ) ) ( SUPPORTS ?auto_137190 ?auto_137181 ) ( CALIBRATION_TARGET ?auto_137190 ?auto_137189 ) ( not ( = ?auto_137189 ?auto_137174 ) ) ( ON_BOARD ?auto_137186 ?auto_137184 ) ( not ( = ?auto_137190 ?auto_137186 ) ) ( SUPPORTS ?auto_137186 ?auto_137175 ) ( CALIBRATION_TARGET ?auto_137186 ?auto_137189 ) ( not ( = ?auto_137189 ?auto_137182 ) ) ( ON_BOARD ?auto_137188 ?auto_137184 ) ( not ( = ?auto_137186 ?auto_137188 ) ) ( SUPPORTS ?auto_137188 ?auto_137183 ) ( CALIBRATION_TARGET ?auto_137188 ?auto_137189 ) ( POWER_AVAIL ?auto_137184 ) ( POINTING ?auto_137184 ?auto_137187 ) ( not ( = ?auto_137189 ?auto_137187 ) ) ( not ( = ?auto_137182 ?auto_137187 ) ) ( not ( = ?auto_137183 ?auto_137175 ) ) ( not ( = ?auto_137174 ?auto_137187 ) ) ( not ( = ?auto_137183 ?auto_137181 ) ) ( not ( = ?auto_137175 ?auto_137181 ) ) ( not ( = ?auto_137180 ?auto_137187 ) ) ( not ( = ?auto_137190 ?auto_137188 ) ) ( not ( = ?auto_137183 ?auto_137179 ) ) ( not ( = ?auto_137175 ?auto_137179 ) ) ( not ( = ?auto_137181 ?auto_137179 ) ) ( not ( = ?auto_137178 ?auto_137187 ) ) ( not ( = ?auto_137185 ?auto_137186 ) ) ( not ( = ?auto_137185 ?auto_137188 ) ) ( not ( = ?auto_137183 ?auto_137176 ) ) ( not ( = ?auto_137175 ?auto_137176 ) ) ( not ( = ?auto_137181 ?auto_137176 ) ) ( not ( = ?auto_137179 ?auto_137176 ) ) ( not ( = ?auto_137177 ?auto_137187 ) ) ( not ( = ?auto_137191 ?auto_137190 ) ) ( not ( = ?auto_137191 ?auto_137186 ) ) ( not ( = ?auto_137191 ?auto_137188 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_137182 ?auto_137183 ?auto_137174 ?auto_137175 ?auto_137180 ?auto_137181 ?auto_137177 ?auto_137176 ?auto_137178 ?auto_137179 )
      ( GET-5IMAGE-VERIFY ?auto_137174 ?auto_137175 ?auto_137177 ?auto_137176 ?auto_137178 ?auto_137179 ?auto_137180 ?auto_137181 ?auto_137182 ?auto_137183 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_138280 - DIRECTION
      ?auto_138281 - MODE
      ?auto_138283 - DIRECTION
      ?auto_138282 - MODE
      ?auto_138284 - DIRECTION
      ?auto_138285 - MODE
      ?auto_138286 - DIRECTION
      ?auto_138287 - MODE
      ?auto_138288 - DIRECTION
      ?auto_138289 - MODE
    )
    :vars
    (
      ?auto_138297 - INSTRUMENT
      ?auto_138290 - SATELLITE
      ?auto_138295 - DIRECTION
      ?auto_138291 - INSTRUMENT
      ?auto_138296 - INSTRUMENT
      ?auto_138292 - INSTRUMENT
      ?auto_138294 - INSTRUMENT
      ?auto_138293 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_138283 ?auto_138280 ) ) ( not ( = ?auto_138284 ?auto_138280 ) ) ( not ( = ?auto_138284 ?auto_138283 ) ) ( not ( = ?auto_138286 ?auto_138280 ) ) ( not ( = ?auto_138286 ?auto_138283 ) ) ( not ( = ?auto_138286 ?auto_138284 ) ) ( not ( = ?auto_138288 ?auto_138280 ) ) ( not ( = ?auto_138288 ?auto_138283 ) ) ( not ( = ?auto_138288 ?auto_138284 ) ) ( not ( = ?auto_138288 ?auto_138286 ) ) ( ON_BOARD ?auto_138297 ?auto_138290 ) ( SUPPORTS ?auto_138297 ?auto_138289 ) ( not ( = ?auto_138288 ?auto_138295 ) ) ( CALIBRATION_TARGET ?auto_138297 ?auto_138295 ) ( not ( = ?auto_138295 ?auto_138286 ) ) ( ON_BOARD ?auto_138291 ?auto_138290 ) ( not ( = ?auto_138297 ?auto_138291 ) ) ( SUPPORTS ?auto_138291 ?auto_138287 ) ( CALIBRATION_TARGET ?auto_138291 ?auto_138295 ) ( not ( = ?auto_138295 ?auto_138280 ) ) ( ON_BOARD ?auto_138296 ?auto_138290 ) ( not ( = ?auto_138291 ?auto_138296 ) ) ( SUPPORTS ?auto_138296 ?auto_138281 ) ( CALIBRATION_TARGET ?auto_138296 ?auto_138295 ) ( not ( = ?auto_138295 ?auto_138284 ) ) ( ON_BOARD ?auto_138292 ?auto_138290 ) ( not ( = ?auto_138296 ?auto_138292 ) ) ( SUPPORTS ?auto_138292 ?auto_138285 ) ( CALIBRATION_TARGET ?auto_138292 ?auto_138295 ) ( not ( = ?auto_138295 ?auto_138283 ) ) ( ON_BOARD ?auto_138294 ?auto_138290 ) ( not ( = ?auto_138292 ?auto_138294 ) ) ( SUPPORTS ?auto_138294 ?auto_138282 ) ( CALIBRATION_TARGET ?auto_138294 ?auto_138295 ) ( POWER_AVAIL ?auto_138290 ) ( POINTING ?auto_138290 ?auto_138293 ) ( not ( = ?auto_138295 ?auto_138293 ) ) ( not ( = ?auto_138283 ?auto_138293 ) ) ( not ( = ?auto_138282 ?auto_138285 ) ) ( not ( = ?auto_138284 ?auto_138293 ) ) ( not ( = ?auto_138282 ?auto_138281 ) ) ( not ( = ?auto_138285 ?auto_138281 ) ) ( not ( = ?auto_138280 ?auto_138293 ) ) ( not ( = ?auto_138296 ?auto_138294 ) ) ( not ( = ?auto_138282 ?auto_138287 ) ) ( not ( = ?auto_138285 ?auto_138287 ) ) ( not ( = ?auto_138281 ?auto_138287 ) ) ( not ( = ?auto_138286 ?auto_138293 ) ) ( not ( = ?auto_138291 ?auto_138292 ) ) ( not ( = ?auto_138291 ?auto_138294 ) ) ( not ( = ?auto_138282 ?auto_138289 ) ) ( not ( = ?auto_138285 ?auto_138289 ) ) ( not ( = ?auto_138281 ?auto_138289 ) ) ( not ( = ?auto_138287 ?auto_138289 ) ) ( not ( = ?auto_138288 ?auto_138293 ) ) ( not ( = ?auto_138297 ?auto_138296 ) ) ( not ( = ?auto_138297 ?auto_138292 ) ) ( not ( = ?auto_138297 ?auto_138294 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_138283 ?auto_138282 ?auto_138284 ?auto_138285 ?auto_138280 ?auto_138281 ?auto_138288 ?auto_138289 ?auto_138286 ?auto_138287 )
      ( GET-5IMAGE-VERIFY ?auto_138280 ?auto_138281 ?auto_138283 ?auto_138282 ?auto_138284 ?auto_138285 ?auto_138286 ?auto_138287 ?auto_138288 ?auto_138289 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_138358 - DIRECTION
      ?auto_138359 - MODE
      ?auto_138361 - DIRECTION
      ?auto_138360 - MODE
      ?auto_138362 - DIRECTION
      ?auto_138363 - MODE
      ?auto_138364 - DIRECTION
      ?auto_138365 - MODE
      ?auto_138366 - DIRECTION
      ?auto_138367 - MODE
    )
    :vars
    (
      ?auto_138375 - INSTRUMENT
      ?auto_138368 - SATELLITE
      ?auto_138373 - DIRECTION
      ?auto_138369 - INSTRUMENT
      ?auto_138374 - INSTRUMENT
      ?auto_138370 - INSTRUMENT
      ?auto_138372 - INSTRUMENT
      ?auto_138371 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_138361 ?auto_138358 ) ) ( not ( = ?auto_138362 ?auto_138358 ) ) ( not ( = ?auto_138362 ?auto_138361 ) ) ( not ( = ?auto_138364 ?auto_138358 ) ) ( not ( = ?auto_138364 ?auto_138361 ) ) ( not ( = ?auto_138364 ?auto_138362 ) ) ( not ( = ?auto_138366 ?auto_138358 ) ) ( not ( = ?auto_138366 ?auto_138361 ) ) ( not ( = ?auto_138366 ?auto_138362 ) ) ( not ( = ?auto_138366 ?auto_138364 ) ) ( ON_BOARD ?auto_138375 ?auto_138368 ) ( SUPPORTS ?auto_138375 ?auto_138365 ) ( not ( = ?auto_138364 ?auto_138373 ) ) ( CALIBRATION_TARGET ?auto_138375 ?auto_138373 ) ( not ( = ?auto_138373 ?auto_138366 ) ) ( ON_BOARD ?auto_138369 ?auto_138368 ) ( not ( = ?auto_138375 ?auto_138369 ) ) ( SUPPORTS ?auto_138369 ?auto_138367 ) ( CALIBRATION_TARGET ?auto_138369 ?auto_138373 ) ( not ( = ?auto_138373 ?auto_138358 ) ) ( ON_BOARD ?auto_138374 ?auto_138368 ) ( not ( = ?auto_138369 ?auto_138374 ) ) ( SUPPORTS ?auto_138374 ?auto_138359 ) ( CALIBRATION_TARGET ?auto_138374 ?auto_138373 ) ( not ( = ?auto_138373 ?auto_138362 ) ) ( ON_BOARD ?auto_138370 ?auto_138368 ) ( not ( = ?auto_138374 ?auto_138370 ) ) ( SUPPORTS ?auto_138370 ?auto_138363 ) ( CALIBRATION_TARGET ?auto_138370 ?auto_138373 ) ( not ( = ?auto_138373 ?auto_138361 ) ) ( ON_BOARD ?auto_138372 ?auto_138368 ) ( not ( = ?auto_138370 ?auto_138372 ) ) ( SUPPORTS ?auto_138372 ?auto_138360 ) ( CALIBRATION_TARGET ?auto_138372 ?auto_138373 ) ( POWER_AVAIL ?auto_138368 ) ( POINTING ?auto_138368 ?auto_138371 ) ( not ( = ?auto_138373 ?auto_138371 ) ) ( not ( = ?auto_138361 ?auto_138371 ) ) ( not ( = ?auto_138360 ?auto_138363 ) ) ( not ( = ?auto_138362 ?auto_138371 ) ) ( not ( = ?auto_138360 ?auto_138359 ) ) ( not ( = ?auto_138363 ?auto_138359 ) ) ( not ( = ?auto_138358 ?auto_138371 ) ) ( not ( = ?auto_138374 ?auto_138372 ) ) ( not ( = ?auto_138360 ?auto_138367 ) ) ( not ( = ?auto_138363 ?auto_138367 ) ) ( not ( = ?auto_138359 ?auto_138367 ) ) ( not ( = ?auto_138366 ?auto_138371 ) ) ( not ( = ?auto_138369 ?auto_138370 ) ) ( not ( = ?auto_138369 ?auto_138372 ) ) ( not ( = ?auto_138360 ?auto_138365 ) ) ( not ( = ?auto_138363 ?auto_138365 ) ) ( not ( = ?auto_138359 ?auto_138365 ) ) ( not ( = ?auto_138367 ?auto_138365 ) ) ( not ( = ?auto_138364 ?auto_138371 ) ) ( not ( = ?auto_138375 ?auto_138374 ) ) ( not ( = ?auto_138375 ?auto_138370 ) ) ( not ( = ?auto_138375 ?auto_138372 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_138361 ?auto_138360 ?auto_138362 ?auto_138363 ?auto_138358 ?auto_138359 ?auto_138364 ?auto_138365 ?auto_138366 ?auto_138367 )
      ( GET-5IMAGE-VERIFY ?auto_138358 ?auto_138359 ?auto_138361 ?auto_138360 ?auto_138362 ?auto_138363 ?auto_138364 ?auto_138365 ?auto_138366 ?auto_138367 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_138606 - DIRECTION
      ?auto_138607 - MODE
      ?auto_138609 - DIRECTION
      ?auto_138608 - MODE
      ?auto_138610 - DIRECTION
      ?auto_138611 - MODE
      ?auto_138612 - DIRECTION
      ?auto_138613 - MODE
      ?auto_138614 - DIRECTION
      ?auto_138615 - MODE
    )
    :vars
    (
      ?auto_138623 - INSTRUMENT
      ?auto_138616 - SATELLITE
      ?auto_138621 - DIRECTION
      ?auto_138617 - INSTRUMENT
      ?auto_138622 - INSTRUMENT
      ?auto_138618 - INSTRUMENT
      ?auto_138620 - INSTRUMENT
      ?auto_138619 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_138609 ?auto_138606 ) ) ( not ( = ?auto_138610 ?auto_138606 ) ) ( not ( = ?auto_138610 ?auto_138609 ) ) ( not ( = ?auto_138612 ?auto_138606 ) ) ( not ( = ?auto_138612 ?auto_138609 ) ) ( not ( = ?auto_138612 ?auto_138610 ) ) ( not ( = ?auto_138614 ?auto_138606 ) ) ( not ( = ?auto_138614 ?auto_138609 ) ) ( not ( = ?auto_138614 ?auto_138610 ) ) ( not ( = ?auto_138614 ?auto_138612 ) ) ( ON_BOARD ?auto_138623 ?auto_138616 ) ( SUPPORTS ?auto_138623 ?auto_138615 ) ( not ( = ?auto_138614 ?auto_138621 ) ) ( CALIBRATION_TARGET ?auto_138623 ?auto_138621 ) ( not ( = ?auto_138621 ?auto_138610 ) ) ( ON_BOARD ?auto_138617 ?auto_138616 ) ( not ( = ?auto_138623 ?auto_138617 ) ) ( SUPPORTS ?auto_138617 ?auto_138611 ) ( CALIBRATION_TARGET ?auto_138617 ?auto_138621 ) ( not ( = ?auto_138621 ?auto_138606 ) ) ( ON_BOARD ?auto_138622 ?auto_138616 ) ( not ( = ?auto_138617 ?auto_138622 ) ) ( SUPPORTS ?auto_138622 ?auto_138607 ) ( CALIBRATION_TARGET ?auto_138622 ?auto_138621 ) ( not ( = ?auto_138621 ?auto_138612 ) ) ( ON_BOARD ?auto_138618 ?auto_138616 ) ( not ( = ?auto_138622 ?auto_138618 ) ) ( SUPPORTS ?auto_138618 ?auto_138613 ) ( CALIBRATION_TARGET ?auto_138618 ?auto_138621 ) ( not ( = ?auto_138621 ?auto_138609 ) ) ( ON_BOARD ?auto_138620 ?auto_138616 ) ( not ( = ?auto_138618 ?auto_138620 ) ) ( SUPPORTS ?auto_138620 ?auto_138608 ) ( CALIBRATION_TARGET ?auto_138620 ?auto_138621 ) ( POWER_AVAIL ?auto_138616 ) ( POINTING ?auto_138616 ?auto_138619 ) ( not ( = ?auto_138621 ?auto_138619 ) ) ( not ( = ?auto_138609 ?auto_138619 ) ) ( not ( = ?auto_138608 ?auto_138613 ) ) ( not ( = ?auto_138612 ?auto_138619 ) ) ( not ( = ?auto_138608 ?auto_138607 ) ) ( not ( = ?auto_138613 ?auto_138607 ) ) ( not ( = ?auto_138606 ?auto_138619 ) ) ( not ( = ?auto_138622 ?auto_138620 ) ) ( not ( = ?auto_138608 ?auto_138611 ) ) ( not ( = ?auto_138613 ?auto_138611 ) ) ( not ( = ?auto_138607 ?auto_138611 ) ) ( not ( = ?auto_138610 ?auto_138619 ) ) ( not ( = ?auto_138617 ?auto_138618 ) ) ( not ( = ?auto_138617 ?auto_138620 ) ) ( not ( = ?auto_138608 ?auto_138615 ) ) ( not ( = ?auto_138613 ?auto_138615 ) ) ( not ( = ?auto_138607 ?auto_138615 ) ) ( not ( = ?auto_138611 ?auto_138615 ) ) ( not ( = ?auto_138614 ?auto_138619 ) ) ( not ( = ?auto_138623 ?auto_138622 ) ) ( not ( = ?auto_138623 ?auto_138618 ) ) ( not ( = ?auto_138623 ?auto_138620 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_138609 ?auto_138608 ?auto_138612 ?auto_138613 ?auto_138606 ?auto_138607 ?auto_138614 ?auto_138615 ?auto_138610 ?auto_138611 )
      ( GET-5IMAGE-VERIFY ?auto_138606 ?auto_138607 ?auto_138609 ?auto_138608 ?auto_138610 ?auto_138611 ?auto_138612 ?auto_138613 ?auto_138614 ?auto_138615 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_138684 - DIRECTION
      ?auto_138685 - MODE
      ?auto_138687 - DIRECTION
      ?auto_138686 - MODE
      ?auto_138688 - DIRECTION
      ?auto_138689 - MODE
      ?auto_138690 - DIRECTION
      ?auto_138691 - MODE
      ?auto_138692 - DIRECTION
      ?auto_138693 - MODE
    )
    :vars
    (
      ?auto_138701 - INSTRUMENT
      ?auto_138694 - SATELLITE
      ?auto_138699 - DIRECTION
      ?auto_138695 - INSTRUMENT
      ?auto_138700 - INSTRUMENT
      ?auto_138696 - INSTRUMENT
      ?auto_138698 - INSTRUMENT
      ?auto_138697 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_138687 ?auto_138684 ) ) ( not ( = ?auto_138688 ?auto_138684 ) ) ( not ( = ?auto_138688 ?auto_138687 ) ) ( not ( = ?auto_138690 ?auto_138684 ) ) ( not ( = ?auto_138690 ?auto_138687 ) ) ( not ( = ?auto_138690 ?auto_138688 ) ) ( not ( = ?auto_138692 ?auto_138684 ) ) ( not ( = ?auto_138692 ?auto_138687 ) ) ( not ( = ?auto_138692 ?auto_138688 ) ) ( not ( = ?auto_138692 ?auto_138690 ) ) ( ON_BOARD ?auto_138701 ?auto_138694 ) ( SUPPORTS ?auto_138701 ?auto_138691 ) ( not ( = ?auto_138690 ?auto_138699 ) ) ( CALIBRATION_TARGET ?auto_138701 ?auto_138699 ) ( not ( = ?auto_138699 ?auto_138688 ) ) ( ON_BOARD ?auto_138695 ?auto_138694 ) ( not ( = ?auto_138701 ?auto_138695 ) ) ( SUPPORTS ?auto_138695 ?auto_138689 ) ( CALIBRATION_TARGET ?auto_138695 ?auto_138699 ) ( not ( = ?auto_138699 ?auto_138684 ) ) ( ON_BOARD ?auto_138700 ?auto_138694 ) ( not ( = ?auto_138695 ?auto_138700 ) ) ( SUPPORTS ?auto_138700 ?auto_138685 ) ( CALIBRATION_TARGET ?auto_138700 ?auto_138699 ) ( not ( = ?auto_138699 ?auto_138692 ) ) ( ON_BOARD ?auto_138696 ?auto_138694 ) ( not ( = ?auto_138700 ?auto_138696 ) ) ( SUPPORTS ?auto_138696 ?auto_138693 ) ( CALIBRATION_TARGET ?auto_138696 ?auto_138699 ) ( not ( = ?auto_138699 ?auto_138687 ) ) ( ON_BOARD ?auto_138698 ?auto_138694 ) ( not ( = ?auto_138696 ?auto_138698 ) ) ( SUPPORTS ?auto_138698 ?auto_138686 ) ( CALIBRATION_TARGET ?auto_138698 ?auto_138699 ) ( POWER_AVAIL ?auto_138694 ) ( POINTING ?auto_138694 ?auto_138697 ) ( not ( = ?auto_138699 ?auto_138697 ) ) ( not ( = ?auto_138687 ?auto_138697 ) ) ( not ( = ?auto_138686 ?auto_138693 ) ) ( not ( = ?auto_138692 ?auto_138697 ) ) ( not ( = ?auto_138686 ?auto_138685 ) ) ( not ( = ?auto_138693 ?auto_138685 ) ) ( not ( = ?auto_138684 ?auto_138697 ) ) ( not ( = ?auto_138700 ?auto_138698 ) ) ( not ( = ?auto_138686 ?auto_138689 ) ) ( not ( = ?auto_138693 ?auto_138689 ) ) ( not ( = ?auto_138685 ?auto_138689 ) ) ( not ( = ?auto_138688 ?auto_138697 ) ) ( not ( = ?auto_138695 ?auto_138696 ) ) ( not ( = ?auto_138695 ?auto_138698 ) ) ( not ( = ?auto_138686 ?auto_138691 ) ) ( not ( = ?auto_138693 ?auto_138691 ) ) ( not ( = ?auto_138685 ?auto_138691 ) ) ( not ( = ?auto_138689 ?auto_138691 ) ) ( not ( = ?auto_138690 ?auto_138697 ) ) ( not ( = ?auto_138701 ?auto_138700 ) ) ( not ( = ?auto_138701 ?auto_138696 ) ) ( not ( = ?auto_138701 ?auto_138698 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_138687 ?auto_138686 ?auto_138692 ?auto_138693 ?auto_138684 ?auto_138685 ?auto_138690 ?auto_138691 ?auto_138688 ?auto_138689 )
      ( GET-5IMAGE-VERIFY ?auto_138684 ?auto_138685 ?auto_138687 ?auto_138686 ?auto_138688 ?auto_138689 ?auto_138690 ?auto_138691 ?auto_138692 ?auto_138693 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_138928 - DIRECTION
      ?auto_138929 - MODE
      ?auto_138931 - DIRECTION
      ?auto_138930 - MODE
      ?auto_138932 - DIRECTION
      ?auto_138933 - MODE
      ?auto_138934 - DIRECTION
      ?auto_138935 - MODE
      ?auto_138936 - DIRECTION
      ?auto_138937 - MODE
    )
    :vars
    (
      ?auto_138945 - INSTRUMENT
      ?auto_138938 - SATELLITE
      ?auto_138943 - DIRECTION
      ?auto_138939 - INSTRUMENT
      ?auto_138944 - INSTRUMENT
      ?auto_138940 - INSTRUMENT
      ?auto_138942 - INSTRUMENT
      ?auto_138941 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_138931 ?auto_138928 ) ) ( not ( = ?auto_138932 ?auto_138928 ) ) ( not ( = ?auto_138932 ?auto_138931 ) ) ( not ( = ?auto_138934 ?auto_138928 ) ) ( not ( = ?auto_138934 ?auto_138931 ) ) ( not ( = ?auto_138934 ?auto_138932 ) ) ( not ( = ?auto_138936 ?auto_138928 ) ) ( not ( = ?auto_138936 ?auto_138931 ) ) ( not ( = ?auto_138936 ?auto_138932 ) ) ( not ( = ?auto_138936 ?auto_138934 ) ) ( ON_BOARD ?auto_138945 ?auto_138938 ) ( SUPPORTS ?auto_138945 ?auto_138933 ) ( not ( = ?auto_138932 ?auto_138943 ) ) ( CALIBRATION_TARGET ?auto_138945 ?auto_138943 ) ( not ( = ?auto_138943 ?auto_138936 ) ) ( ON_BOARD ?auto_138939 ?auto_138938 ) ( not ( = ?auto_138945 ?auto_138939 ) ) ( SUPPORTS ?auto_138939 ?auto_138937 ) ( CALIBRATION_TARGET ?auto_138939 ?auto_138943 ) ( not ( = ?auto_138943 ?auto_138928 ) ) ( ON_BOARD ?auto_138944 ?auto_138938 ) ( not ( = ?auto_138939 ?auto_138944 ) ) ( SUPPORTS ?auto_138944 ?auto_138929 ) ( CALIBRATION_TARGET ?auto_138944 ?auto_138943 ) ( not ( = ?auto_138943 ?auto_138934 ) ) ( ON_BOARD ?auto_138940 ?auto_138938 ) ( not ( = ?auto_138944 ?auto_138940 ) ) ( SUPPORTS ?auto_138940 ?auto_138935 ) ( CALIBRATION_TARGET ?auto_138940 ?auto_138943 ) ( not ( = ?auto_138943 ?auto_138931 ) ) ( ON_BOARD ?auto_138942 ?auto_138938 ) ( not ( = ?auto_138940 ?auto_138942 ) ) ( SUPPORTS ?auto_138942 ?auto_138930 ) ( CALIBRATION_TARGET ?auto_138942 ?auto_138943 ) ( POWER_AVAIL ?auto_138938 ) ( POINTING ?auto_138938 ?auto_138941 ) ( not ( = ?auto_138943 ?auto_138941 ) ) ( not ( = ?auto_138931 ?auto_138941 ) ) ( not ( = ?auto_138930 ?auto_138935 ) ) ( not ( = ?auto_138934 ?auto_138941 ) ) ( not ( = ?auto_138930 ?auto_138929 ) ) ( not ( = ?auto_138935 ?auto_138929 ) ) ( not ( = ?auto_138928 ?auto_138941 ) ) ( not ( = ?auto_138944 ?auto_138942 ) ) ( not ( = ?auto_138930 ?auto_138937 ) ) ( not ( = ?auto_138935 ?auto_138937 ) ) ( not ( = ?auto_138929 ?auto_138937 ) ) ( not ( = ?auto_138936 ?auto_138941 ) ) ( not ( = ?auto_138939 ?auto_138940 ) ) ( not ( = ?auto_138939 ?auto_138942 ) ) ( not ( = ?auto_138930 ?auto_138933 ) ) ( not ( = ?auto_138935 ?auto_138933 ) ) ( not ( = ?auto_138929 ?auto_138933 ) ) ( not ( = ?auto_138937 ?auto_138933 ) ) ( not ( = ?auto_138932 ?auto_138941 ) ) ( not ( = ?auto_138945 ?auto_138944 ) ) ( not ( = ?auto_138945 ?auto_138940 ) ) ( not ( = ?auto_138945 ?auto_138942 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_138931 ?auto_138930 ?auto_138934 ?auto_138935 ?auto_138928 ?auto_138929 ?auto_138932 ?auto_138933 ?auto_138936 ?auto_138937 )
      ( GET-5IMAGE-VERIFY ?auto_138928 ?auto_138929 ?auto_138931 ?auto_138930 ?auto_138932 ?auto_138933 ?auto_138934 ?auto_138935 ?auto_138936 ?auto_138937 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_139092 - DIRECTION
      ?auto_139093 - MODE
      ?auto_139095 - DIRECTION
      ?auto_139094 - MODE
      ?auto_139096 - DIRECTION
      ?auto_139097 - MODE
      ?auto_139098 - DIRECTION
      ?auto_139099 - MODE
      ?auto_139100 - DIRECTION
      ?auto_139101 - MODE
    )
    :vars
    (
      ?auto_139109 - INSTRUMENT
      ?auto_139102 - SATELLITE
      ?auto_139107 - DIRECTION
      ?auto_139103 - INSTRUMENT
      ?auto_139108 - INSTRUMENT
      ?auto_139104 - INSTRUMENT
      ?auto_139106 - INSTRUMENT
      ?auto_139105 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_139095 ?auto_139092 ) ) ( not ( = ?auto_139096 ?auto_139092 ) ) ( not ( = ?auto_139096 ?auto_139095 ) ) ( not ( = ?auto_139098 ?auto_139092 ) ) ( not ( = ?auto_139098 ?auto_139095 ) ) ( not ( = ?auto_139098 ?auto_139096 ) ) ( not ( = ?auto_139100 ?auto_139092 ) ) ( not ( = ?auto_139100 ?auto_139095 ) ) ( not ( = ?auto_139100 ?auto_139096 ) ) ( not ( = ?auto_139100 ?auto_139098 ) ) ( ON_BOARD ?auto_139109 ?auto_139102 ) ( SUPPORTS ?auto_139109 ?auto_139097 ) ( not ( = ?auto_139096 ?auto_139107 ) ) ( CALIBRATION_TARGET ?auto_139109 ?auto_139107 ) ( not ( = ?auto_139107 ?auto_139098 ) ) ( ON_BOARD ?auto_139103 ?auto_139102 ) ( not ( = ?auto_139109 ?auto_139103 ) ) ( SUPPORTS ?auto_139103 ?auto_139099 ) ( CALIBRATION_TARGET ?auto_139103 ?auto_139107 ) ( not ( = ?auto_139107 ?auto_139092 ) ) ( ON_BOARD ?auto_139108 ?auto_139102 ) ( not ( = ?auto_139103 ?auto_139108 ) ) ( SUPPORTS ?auto_139108 ?auto_139093 ) ( CALIBRATION_TARGET ?auto_139108 ?auto_139107 ) ( not ( = ?auto_139107 ?auto_139100 ) ) ( ON_BOARD ?auto_139104 ?auto_139102 ) ( not ( = ?auto_139108 ?auto_139104 ) ) ( SUPPORTS ?auto_139104 ?auto_139101 ) ( CALIBRATION_TARGET ?auto_139104 ?auto_139107 ) ( not ( = ?auto_139107 ?auto_139095 ) ) ( ON_BOARD ?auto_139106 ?auto_139102 ) ( not ( = ?auto_139104 ?auto_139106 ) ) ( SUPPORTS ?auto_139106 ?auto_139094 ) ( CALIBRATION_TARGET ?auto_139106 ?auto_139107 ) ( POWER_AVAIL ?auto_139102 ) ( POINTING ?auto_139102 ?auto_139105 ) ( not ( = ?auto_139107 ?auto_139105 ) ) ( not ( = ?auto_139095 ?auto_139105 ) ) ( not ( = ?auto_139094 ?auto_139101 ) ) ( not ( = ?auto_139100 ?auto_139105 ) ) ( not ( = ?auto_139094 ?auto_139093 ) ) ( not ( = ?auto_139101 ?auto_139093 ) ) ( not ( = ?auto_139092 ?auto_139105 ) ) ( not ( = ?auto_139108 ?auto_139106 ) ) ( not ( = ?auto_139094 ?auto_139099 ) ) ( not ( = ?auto_139101 ?auto_139099 ) ) ( not ( = ?auto_139093 ?auto_139099 ) ) ( not ( = ?auto_139098 ?auto_139105 ) ) ( not ( = ?auto_139103 ?auto_139104 ) ) ( not ( = ?auto_139103 ?auto_139106 ) ) ( not ( = ?auto_139094 ?auto_139097 ) ) ( not ( = ?auto_139101 ?auto_139097 ) ) ( not ( = ?auto_139093 ?auto_139097 ) ) ( not ( = ?auto_139099 ?auto_139097 ) ) ( not ( = ?auto_139096 ?auto_139105 ) ) ( not ( = ?auto_139109 ?auto_139108 ) ) ( not ( = ?auto_139109 ?auto_139104 ) ) ( not ( = ?auto_139109 ?auto_139106 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_139095 ?auto_139094 ?auto_139100 ?auto_139101 ?auto_139092 ?auto_139093 ?auto_139096 ?auto_139097 ?auto_139098 ?auto_139099 )
      ( GET-5IMAGE-VERIFY ?auto_139092 ?auto_139093 ?auto_139095 ?auto_139094 ?auto_139096 ?auto_139097 ?auto_139098 ?auto_139099 ?auto_139100 ?auto_139101 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_139336 - DIRECTION
      ?auto_139337 - MODE
      ?auto_139339 - DIRECTION
      ?auto_139338 - MODE
      ?auto_139340 - DIRECTION
      ?auto_139341 - MODE
      ?auto_139342 - DIRECTION
      ?auto_139343 - MODE
      ?auto_139344 - DIRECTION
      ?auto_139345 - MODE
    )
    :vars
    (
      ?auto_139353 - INSTRUMENT
      ?auto_139346 - SATELLITE
      ?auto_139351 - DIRECTION
      ?auto_139347 - INSTRUMENT
      ?auto_139352 - INSTRUMENT
      ?auto_139348 - INSTRUMENT
      ?auto_139350 - INSTRUMENT
      ?auto_139349 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_139339 ?auto_139336 ) ) ( not ( = ?auto_139340 ?auto_139336 ) ) ( not ( = ?auto_139340 ?auto_139339 ) ) ( not ( = ?auto_139342 ?auto_139336 ) ) ( not ( = ?auto_139342 ?auto_139339 ) ) ( not ( = ?auto_139342 ?auto_139340 ) ) ( not ( = ?auto_139344 ?auto_139336 ) ) ( not ( = ?auto_139344 ?auto_139339 ) ) ( not ( = ?auto_139344 ?auto_139340 ) ) ( not ( = ?auto_139344 ?auto_139342 ) ) ( ON_BOARD ?auto_139353 ?auto_139346 ) ( SUPPORTS ?auto_139353 ?auto_139345 ) ( not ( = ?auto_139344 ?auto_139351 ) ) ( CALIBRATION_TARGET ?auto_139353 ?auto_139351 ) ( not ( = ?auto_139351 ?auto_139342 ) ) ( ON_BOARD ?auto_139347 ?auto_139346 ) ( not ( = ?auto_139353 ?auto_139347 ) ) ( SUPPORTS ?auto_139347 ?auto_139343 ) ( CALIBRATION_TARGET ?auto_139347 ?auto_139351 ) ( not ( = ?auto_139351 ?auto_139336 ) ) ( ON_BOARD ?auto_139352 ?auto_139346 ) ( not ( = ?auto_139347 ?auto_139352 ) ) ( SUPPORTS ?auto_139352 ?auto_139337 ) ( CALIBRATION_TARGET ?auto_139352 ?auto_139351 ) ( not ( = ?auto_139351 ?auto_139339 ) ) ( ON_BOARD ?auto_139348 ?auto_139346 ) ( not ( = ?auto_139352 ?auto_139348 ) ) ( SUPPORTS ?auto_139348 ?auto_139338 ) ( CALIBRATION_TARGET ?auto_139348 ?auto_139351 ) ( not ( = ?auto_139351 ?auto_139340 ) ) ( ON_BOARD ?auto_139350 ?auto_139346 ) ( not ( = ?auto_139348 ?auto_139350 ) ) ( SUPPORTS ?auto_139350 ?auto_139341 ) ( CALIBRATION_TARGET ?auto_139350 ?auto_139351 ) ( POWER_AVAIL ?auto_139346 ) ( POINTING ?auto_139346 ?auto_139349 ) ( not ( = ?auto_139351 ?auto_139349 ) ) ( not ( = ?auto_139340 ?auto_139349 ) ) ( not ( = ?auto_139341 ?auto_139338 ) ) ( not ( = ?auto_139339 ?auto_139349 ) ) ( not ( = ?auto_139341 ?auto_139337 ) ) ( not ( = ?auto_139338 ?auto_139337 ) ) ( not ( = ?auto_139336 ?auto_139349 ) ) ( not ( = ?auto_139352 ?auto_139350 ) ) ( not ( = ?auto_139341 ?auto_139343 ) ) ( not ( = ?auto_139338 ?auto_139343 ) ) ( not ( = ?auto_139337 ?auto_139343 ) ) ( not ( = ?auto_139342 ?auto_139349 ) ) ( not ( = ?auto_139347 ?auto_139348 ) ) ( not ( = ?auto_139347 ?auto_139350 ) ) ( not ( = ?auto_139341 ?auto_139345 ) ) ( not ( = ?auto_139338 ?auto_139345 ) ) ( not ( = ?auto_139337 ?auto_139345 ) ) ( not ( = ?auto_139343 ?auto_139345 ) ) ( not ( = ?auto_139344 ?auto_139349 ) ) ( not ( = ?auto_139353 ?auto_139352 ) ) ( not ( = ?auto_139353 ?auto_139348 ) ) ( not ( = ?auto_139353 ?auto_139350 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_139340 ?auto_139341 ?auto_139339 ?auto_139338 ?auto_139336 ?auto_139337 ?auto_139344 ?auto_139345 ?auto_139342 ?auto_139343 )
      ( GET-5IMAGE-VERIFY ?auto_139336 ?auto_139337 ?auto_139339 ?auto_139338 ?auto_139340 ?auto_139341 ?auto_139342 ?auto_139343 ?auto_139344 ?auto_139345 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_139414 - DIRECTION
      ?auto_139415 - MODE
      ?auto_139417 - DIRECTION
      ?auto_139416 - MODE
      ?auto_139418 - DIRECTION
      ?auto_139419 - MODE
      ?auto_139420 - DIRECTION
      ?auto_139421 - MODE
      ?auto_139422 - DIRECTION
      ?auto_139423 - MODE
    )
    :vars
    (
      ?auto_139431 - INSTRUMENT
      ?auto_139424 - SATELLITE
      ?auto_139429 - DIRECTION
      ?auto_139425 - INSTRUMENT
      ?auto_139430 - INSTRUMENT
      ?auto_139426 - INSTRUMENT
      ?auto_139428 - INSTRUMENT
      ?auto_139427 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_139417 ?auto_139414 ) ) ( not ( = ?auto_139418 ?auto_139414 ) ) ( not ( = ?auto_139418 ?auto_139417 ) ) ( not ( = ?auto_139420 ?auto_139414 ) ) ( not ( = ?auto_139420 ?auto_139417 ) ) ( not ( = ?auto_139420 ?auto_139418 ) ) ( not ( = ?auto_139422 ?auto_139414 ) ) ( not ( = ?auto_139422 ?auto_139417 ) ) ( not ( = ?auto_139422 ?auto_139418 ) ) ( not ( = ?auto_139422 ?auto_139420 ) ) ( ON_BOARD ?auto_139431 ?auto_139424 ) ( SUPPORTS ?auto_139431 ?auto_139421 ) ( not ( = ?auto_139420 ?auto_139429 ) ) ( CALIBRATION_TARGET ?auto_139431 ?auto_139429 ) ( not ( = ?auto_139429 ?auto_139422 ) ) ( ON_BOARD ?auto_139425 ?auto_139424 ) ( not ( = ?auto_139431 ?auto_139425 ) ) ( SUPPORTS ?auto_139425 ?auto_139423 ) ( CALIBRATION_TARGET ?auto_139425 ?auto_139429 ) ( not ( = ?auto_139429 ?auto_139414 ) ) ( ON_BOARD ?auto_139430 ?auto_139424 ) ( not ( = ?auto_139425 ?auto_139430 ) ) ( SUPPORTS ?auto_139430 ?auto_139415 ) ( CALIBRATION_TARGET ?auto_139430 ?auto_139429 ) ( not ( = ?auto_139429 ?auto_139417 ) ) ( ON_BOARD ?auto_139426 ?auto_139424 ) ( not ( = ?auto_139430 ?auto_139426 ) ) ( SUPPORTS ?auto_139426 ?auto_139416 ) ( CALIBRATION_TARGET ?auto_139426 ?auto_139429 ) ( not ( = ?auto_139429 ?auto_139418 ) ) ( ON_BOARD ?auto_139428 ?auto_139424 ) ( not ( = ?auto_139426 ?auto_139428 ) ) ( SUPPORTS ?auto_139428 ?auto_139419 ) ( CALIBRATION_TARGET ?auto_139428 ?auto_139429 ) ( POWER_AVAIL ?auto_139424 ) ( POINTING ?auto_139424 ?auto_139427 ) ( not ( = ?auto_139429 ?auto_139427 ) ) ( not ( = ?auto_139418 ?auto_139427 ) ) ( not ( = ?auto_139419 ?auto_139416 ) ) ( not ( = ?auto_139417 ?auto_139427 ) ) ( not ( = ?auto_139419 ?auto_139415 ) ) ( not ( = ?auto_139416 ?auto_139415 ) ) ( not ( = ?auto_139414 ?auto_139427 ) ) ( not ( = ?auto_139430 ?auto_139428 ) ) ( not ( = ?auto_139419 ?auto_139423 ) ) ( not ( = ?auto_139416 ?auto_139423 ) ) ( not ( = ?auto_139415 ?auto_139423 ) ) ( not ( = ?auto_139422 ?auto_139427 ) ) ( not ( = ?auto_139425 ?auto_139426 ) ) ( not ( = ?auto_139425 ?auto_139428 ) ) ( not ( = ?auto_139419 ?auto_139421 ) ) ( not ( = ?auto_139416 ?auto_139421 ) ) ( not ( = ?auto_139415 ?auto_139421 ) ) ( not ( = ?auto_139423 ?auto_139421 ) ) ( not ( = ?auto_139420 ?auto_139427 ) ) ( not ( = ?auto_139431 ?auto_139430 ) ) ( not ( = ?auto_139431 ?auto_139426 ) ) ( not ( = ?auto_139431 ?auto_139428 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_139418 ?auto_139419 ?auto_139417 ?auto_139416 ?auto_139414 ?auto_139415 ?auto_139420 ?auto_139421 ?auto_139422 ?auto_139423 )
      ( GET-5IMAGE-VERIFY ?auto_139414 ?auto_139415 ?auto_139417 ?auto_139416 ?auto_139418 ?auto_139419 ?auto_139420 ?auto_139421 ?auto_139422 ?auto_139423 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_139832 - DIRECTION
      ?auto_139833 - MODE
      ?auto_139835 - DIRECTION
      ?auto_139834 - MODE
      ?auto_139836 - DIRECTION
      ?auto_139837 - MODE
      ?auto_139838 - DIRECTION
      ?auto_139839 - MODE
      ?auto_139840 - DIRECTION
      ?auto_139841 - MODE
    )
    :vars
    (
      ?auto_139849 - INSTRUMENT
      ?auto_139842 - SATELLITE
      ?auto_139847 - DIRECTION
      ?auto_139843 - INSTRUMENT
      ?auto_139848 - INSTRUMENT
      ?auto_139844 - INSTRUMENT
      ?auto_139846 - INSTRUMENT
      ?auto_139845 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_139835 ?auto_139832 ) ) ( not ( = ?auto_139836 ?auto_139832 ) ) ( not ( = ?auto_139836 ?auto_139835 ) ) ( not ( = ?auto_139838 ?auto_139832 ) ) ( not ( = ?auto_139838 ?auto_139835 ) ) ( not ( = ?auto_139838 ?auto_139836 ) ) ( not ( = ?auto_139840 ?auto_139832 ) ) ( not ( = ?auto_139840 ?auto_139835 ) ) ( not ( = ?auto_139840 ?auto_139836 ) ) ( not ( = ?auto_139840 ?auto_139838 ) ) ( ON_BOARD ?auto_139849 ?auto_139842 ) ( SUPPORTS ?auto_139849 ?auto_139841 ) ( not ( = ?auto_139840 ?auto_139847 ) ) ( CALIBRATION_TARGET ?auto_139849 ?auto_139847 ) ( not ( = ?auto_139847 ?auto_139836 ) ) ( ON_BOARD ?auto_139843 ?auto_139842 ) ( not ( = ?auto_139849 ?auto_139843 ) ) ( SUPPORTS ?auto_139843 ?auto_139837 ) ( CALIBRATION_TARGET ?auto_139843 ?auto_139847 ) ( not ( = ?auto_139847 ?auto_139832 ) ) ( ON_BOARD ?auto_139848 ?auto_139842 ) ( not ( = ?auto_139843 ?auto_139848 ) ) ( SUPPORTS ?auto_139848 ?auto_139833 ) ( CALIBRATION_TARGET ?auto_139848 ?auto_139847 ) ( not ( = ?auto_139847 ?auto_139835 ) ) ( ON_BOARD ?auto_139844 ?auto_139842 ) ( not ( = ?auto_139848 ?auto_139844 ) ) ( SUPPORTS ?auto_139844 ?auto_139834 ) ( CALIBRATION_TARGET ?auto_139844 ?auto_139847 ) ( not ( = ?auto_139847 ?auto_139838 ) ) ( ON_BOARD ?auto_139846 ?auto_139842 ) ( not ( = ?auto_139844 ?auto_139846 ) ) ( SUPPORTS ?auto_139846 ?auto_139839 ) ( CALIBRATION_TARGET ?auto_139846 ?auto_139847 ) ( POWER_AVAIL ?auto_139842 ) ( POINTING ?auto_139842 ?auto_139845 ) ( not ( = ?auto_139847 ?auto_139845 ) ) ( not ( = ?auto_139838 ?auto_139845 ) ) ( not ( = ?auto_139839 ?auto_139834 ) ) ( not ( = ?auto_139835 ?auto_139845 ) ) ( not ( = ?auto_139839 ?auto_139833 ) ) ( not ( = ?auto_139834 ?auto_139833 ) ) ( not ( = ?auto_139832 ?auto_139845 ) ) ( not ( = ?auto_139848 ?auto_139846 ) ) ( not ( = ?auto_139839 ?auto_139837 ) ) ( not ( = ?auto_139834 ?auto_139837 ) ) ( not ( = ?auto_139833 ?auto_139837 ) ) ( not ( = ?auto_139836 ?auto_139845 ) ) ( not ( = ?auto_139843 ?auto_139844 ) ) ( not ( = ?auto_139843 ?auto_139846 ) ) ( not ( = ?auto_139839 ?auto_139841 ) ) ( not ( = ?auto_139834 ?auto_139841 ) ) ( not ( = ?auto_139833 ?auto_139841 ) ) ( not ( = ?auto_139837 ?auto_139841 ) ) ( not ( = ?auto_139840 ?auto_139845 ) ) ( not ( = ?auto_139849 ?auto_139848 ) ) ( not ( = ?auto_139849 ?auto_139844 ) ) ( not ( = ?auto_139849 ?auto_139846 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_139838 ?auto_139839 ?auto_139835 ?auto_139834 ?auto_139832 ?auto_139833 ?auto_139840 ?auto_139841 ?auto_139836 ?auto_139837 )
      ( GET-5IMAGE-VERIFY ?auto_139832 ?auto_139833 ?auto_139835 ?auto_139834 ?auto_139836 ?auto_139837 ?auto_139838 ?auto_139839 ?auto_139840 ?auto_139841 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_139910 - DIRECTION
      ?auto_139911 - MODE
      ?auto_139913 - DIRECTION
      ?auto_139912 - MODE
      ?auto_139914 - DIRECTION
      ?auto_139915 - MODE
      ?auto_139916 - DIRECTION
      ?auto_139917 - MODE
      ?auto_139918 - DIRECTION
      ?auto_139919 - MODE
    )
    :vars
    (
      ?auto_139927 - INSTRUMENT
      ?auto_139920 - SATELLITE
      ?auto_139925 - DIRECTION
      ?auto_139921 - INSTRUMENT
      ?auto_139926 - INSTRUMENT
      ?auto_139922 - INSTRUMENT
      ?auto_139924 - INSTRUMENT
      ?auto_139923 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_139913 ?auto_139910 ) ) ( not ( = ?auto_139914 ?auto_139910 ) ) ( not ( = ?auto_139914 ?auto_139913 ) ) ( not ( = ?auto_139916 ?auto_139910 ) ) ( not ( = ?auto_139916 ?auto_139913 ) ) ( not ( = ?auto_139916 ?auto_139914 ) ) ( not ( = ?auto_139918 ?auto_139910 ) ) ( not ( = ?auto_139918 ?auto_139913 ) ) ( not ( = ?auto_139918 ?auto_139914 ) ) ( not ( = ?auto_139918 ?auto_139916 ) ) ( ON_BOARD ?auto_139927 ?auto_139920 ) ( SUPPORTS ?auto_139927 ?auto_139917 ) ( not ( = ?auto_139916 ?auto_139925 ) ) ( CALIBRATION_TARGET ?auto_139927 ?auto_139925 ) ( not ( = ?auto_139925 ?auto_139914 ) ) ( ON_BOARD ?auto_139921 ?auto_139920 ) ( not ( = ?auto_139927 ?auto_139921 ) ) ( SUPPORTS ?auto_139921 ?auto_139915 ) ( CALIBRATION_TARGET ?auto_139921 ?auto_139925 ) ( not ( = ?auto_139925 ?auto_139910 ) ) ( ON_BOARD ?auto_139926 ?auto_139920 ) ( not ( = ?auto_139921 ?auto_139926 ) ) ( SUPPORTS ?auto_139926 ?auto_139911 ) ( CALIBRATION_TARGET ?auto_139926 ?auto_139925 ) ( not ( = ?auto_139925 ?auto_139913 ) ) ( ON_BOARD ?auto_139922 ?auto_139920 ) ( not ( = ?auto_139926 ?auto_139922 ) ) ( SUPPORTS ?auto_139922 ?auto_139912 ) ( CALIBRATION_TARGET ?auto_139922 ?auto_139925 ) ( not ( = ?auto_139925 ?auto_139918 ) ) ( ON_BOARD ?auto_139924 ?auto_139920 ) ( not ( = ?auto_139922 ?auto_139924 ) ) ( SUPPORTS ?auto_139924 ?auto_139919 ) ( CALIBRATION_TARGET ?auto_139924 ?auto_139925 ) ( POWER_AVAIL ?auto_139920 ) ( POINTING ?auto_139920 ?auto_139923 ) ( not ( = ?auto_139925 ?auto_139923 ) ) ( not ( = ?auto_139918 ?auto_139923 ) ) ( not ( = ?auto_139919 ?auto_139912 ) ) ( not ( = ?auto_139913 ?auto_139923 ) ) ( not ( = ?auto_139919 ?auto_139911 ) ) ( not ( = ?auto_139912 ?auto_139911 ) ) ( not ( = ?auto_139910 ?auto_139923 ) ) ( not ( = ?auto_139926 ?auto_139924 ) ) ( not ( = ?auto_139919 ?auto_139915 ) ) ( not ( = ?auto_139912 ?auto_139915 ) ) ( not ( = ?auto_139911 ?auto_139915 ) ) ( not ( = ?auto_139914 ?auto_139923 ) ) ( not ( = ?auto_139921 ?auto_139922 ) ) ( not ( = ?auto_139921 ?auto_139924 ) ) ( not ( = ?auto_139919 ?auto_139917 ) ) ( not ( = ?auto_139912 ?auto_139917 ) ) ( not ( = ?auto_139911 ?auto_139917 ) ) ( not ( = ?auto_139915 ?auto_139917 ) ) ( not ( = ?auto_139916 ?auto_139923 ) ) ( not ( = ?auto_139927 ?auto_139926 ) ) ( not ( = ?auto_139927 ?auto_139922 ) ) ( not ( = ?auto_139927 ?auto_139924 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_139918 ?auto_139919 ?auto_139913 ?auto_139912 ?auto_139910 ?auto_139911 ?auto_139916 ?auto_139917 ?auto_139914 ?auto_139915 )
      ( GET-5IMAGE-VERIFY ?auto_139910 ?auto_139911 ?auto_139913 ?auto_139912 ?auto_139914 ?auto_139915 ?auto_139916 ?auto_139917 ?auto_139918 ?auto_139919 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_140068 - DIRECTION
      ?auto_140069 - MODE
      ?auto_140071 - DIRECTION
      ?auto_140070 - MODE
      ?auto_140072 - DIRECTION
      ?auto_140073 - MODE
      ?auto_140074 - DIRECTION
      ?auto_140075 - MODE
      ?auto_140076 - DIRECTION
      ?auto_140077 - MODE
    )
    :vars
    (
      ?auto_140085 - INSTRUMENT
      ?auto_140078 - SATELLITE
      ?auto_140083 - DIRECTION
      ?auto_140079 - INSTRUMENT
      ?auto_140084 - INSTRUMENT
      ?auto_140080 - INSTRUMENT
      ?auto_140082 - INSTRUMENT
      ?auto_140081 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_140071 ?auto_140068 ) ) ( not ( = ?auto_140072 ?auto_140068 ) ) ( not ( = ?auto_140072 ?auto_140071 ) ) ( not ( = ?auto_140074 ?auto_140068 ) ) ( not ( = ?auto_140074 ?auto_140071 ) ) ( not ( = ?auto_140074 ?auto_140072 ) ) ( not ( = ?auto_140076 ?auto_140068 ) ) ( not ( = ?auto_140076 ?auto_140071 ) ) ( not ( = ?auto_140076 ?auto_140072 ) ) ( not ( = ?auto_140076 ?auto_140074 ) ) ( ON_BOARD ?auto_140085 ?auto_140078 ) ( SUPPORTS ?auto_140085 ?auto_140073 ) ( not ( = ?auto_140072 ?auto_140083 ) ) ( CALIBRATION_TARGET ?auto_140085 ?auto_140083 ) ( not ( = ?auto_140083 ?auto_140076 ) ) ( ON_BOARD ?auto_140079 ?auto_140078 ) ( not ( = ?auto_140085 ?auto_140079 ) ) ( SUPPORTS ?auto_140079 ?auto_140077 ) ( CALIBRATION_TARGET ?auto_140079 ?auto_140083 ) ( not ( = ?auto_140083 ?auto_140068 ) ) ( ON_BOARD ?auto_140084 ?auto_140078 ) ( not ( = ?auto_140079 ?auto_140084 ) ) ( SUPPORTS ?auto_140084 ?auto_140069 ) ( CALIBRATION_TARGET ?auto_140084 ?auto_140083 ) ( not ( = ?auto_140083 ?auto_140071 ) ) ( ON_BOARD ?auto_140080 ?auto_140078 ) ( not ( = ?auto_140084 ?auto_140080 ) ) ( SUPPORTS ?auto_140080 ?auto_140070 ) ( CALIBRATION_TARGET ?auto_140080 ?auto_140083 ) ( not ( = ?auto_140083 ?auto_140074 ) ) ( ON_BOARD ?auto_140082 ?auto_140078 ) ( not ( = ?auto_140080 ?auto_140082 ) ) ( SUPPORTS ?auto_140082 ?auto_140075 ) ( CALIBRATION_TARGET ?auto_140082 ?auto_140083 ) ( POWER_AVAIL ?auto_140078 ) ( POINTING ?auto_140078 ?auto_140081 ) ( not ( = ?auto_140083 ?auto_140081 ) ) ( not ( = ?auto_140074 ?auto_140081 ) ) ( not ( = ?auto_140075 ?auto_140070 ) ) ( not ( = ?auto_140071 ?auto_140081 ) ) ( not ( = ?auto_140075 ?auto_140069 ) ) ( not ( = ?auto_140070 ?auto_140069 ) ) ( not ( = ?auto_140068 ?auto_140081 ) ) ( not ( = ?auto_140084 ?auto_140082 ) ) ( not ( = ?auto_140075 ?auto_140077 ) ) ( not ( = ?auto_140070 ?auto_140077 ) ) ( not ( = ?auto_140069 ?auto_140077 ) ) ( not ( = ?auto_140076 ?auto_140081 ) ) ( not ( = ?auto_140079 ?auto_140080 ) ) ( not ( = ?auto_140079 ?auto_140082 ) ) ( not ( = ?auto_140075 ?auto_140073 ) ) ( not ( = ?auto_140070 ?auto_140073 ) ) ( not ( = ?auto_140069 ?auto_140073 ) ) ( not ( = ?auto_140077 ?auto_140073 ) ) ( not ( = ?auto_140072 ?auto_140081 ) ) ( not ( = ?auto_140085 ?auto_140084 ) ) ( not ( = ?auto_140085 ?auto_140080 ) ) ( not ( = ?auto_140085 ?auto_140082 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_140074 ?auto_140075 ?auto_140071 ?auto_140070 ?auto_140068 ?auto_140069 ?auto_140072 ?auto_140073 ?auto_140076 ?auto_140077 )
      ( GET-5IMAGE-VERIFY ?auto_140068 ?auto_140069 ?auto_140071 ?auto_140070 ?auto_140072 ?auto_140073 ?auto_140074 ?auto_140075 ?auto_140076 ?auto_140077 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_140318 - DIRECTION
      ?auto_140319 - MODE
      ?auto_140321 - DIRECTION
      ?auto_140320 - MODE
      ?auto_140322 - DIRECTION
      ?auto_140323 - MODE
      ?auto_140324 - DIRECTION
      ?auto_140325 - MODE
      ?auto_140326 - DIRECTION
      ?auto_140327 - MODE
    )
    :vars
    (
      ?auto_140335 - INSTRUMENT
      ?auto_140328 - SATELLITE
      ?auto_140333 - DIRECTION
      ?auto_140329 - INSTRUMENT
      ?auto_140334 - INSTRUMENT
      ?auto_140330 - INSTRUMENT
      ?auto_140332 - INSTRUMENT
      ?auto_140331 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_140321 ?auto_140318 ) ) ( not ( = ?auto_140322 ?auto_140318 ) ) ( not ( = ?auto_140322 ?auto_140321 ) ) ( not ( = ?auto_140324 ?auto_140318 ) ) ( not ( = ?auto_140324 ?auto_140321 ) ) ( not ( = ?auto_140324 ?auto_140322 ) ) ( not ( = ?auto_140326 ?auto_140318 ) ) ( not ( = ?auto_140326 ?auto_140321 ) ) ( not ( = ?auto_140326 ?auto_140322 ) ) ( not ( = ?auto_140326 ?auto_140324 ) ) ( ON_BOARD ?auto_140335 ?auto_140328 ) ( SUPPORTS ?auto_140335 ?auto_140323 ) ( not ( = ?auto_140322 ?auto_140333 ) ) ( CALIBRATION_TARGET ?auto_140335 ?auto_140333 ) ( not ( = ?auto_140333 ?auto_140324 ) ) ( ON_BOARD ?auto_140329 ?auto_140328 ) ( not ( = ?auto_140335 ?auto_140329 ) ) ( SUPPORTS ?auto_140329 ?auto_140325 ) ( CALIBRATION_TARGET ?auto_140329 ?auto_140333 ) ( not ( = ?auto_140333 ?auto_140318 ) ) ( ON_BOARD ?auto_140334 ?auto_140328 ) ( not ( = ?auto_140329 ?auto_140334 ) ) ( SUPPORTS ?auto_140334 ?auto_140319 ) ( CALIBRATION_TARGET ?auto_140334 ?auto_140333 ) ( not ( = ?auto_140333 ?auto_140321 ) ) ( ON_BOARD ?auto_140330 ?auto_140328 ) ( not ( = ?auto_140334 ?auto_140330 ) ) ( SUPPORTS ?auto_140330 ?auto_140320 ) ( CALIBRATION_TARGET ?auto_140330 ?auto_140333 ) ( not ( = ?auto_140333 ?auto_140326 ) ) ( ON_BOARD ?auto_140332 ?auto_140328 ) ( not ( = ?auto_140330 ?auto_140332 ) ) ( SUPPORTS ?auto_140332 ?auto_140327 ) ( CALIBRATION_TARGET ?auto_140332 ?auto_140333 ) ( POWER_AVAIL ?auto_140328 ) ( POINTING ?auto_140328 ?auto_140331 ) ( not ( = ?auto_140333 ?auto_140331 ) ) ( not ( = ?auto_140326 ?auto_140331 ) ) ( not ( = ?auto_140327 ?auto_140320 ) ) ( not ( = ?auto_140321 ?auto_140331 ) ) ( not ( = ?auto_140327 ?auto_140319 ) ) ( not ( = ?auto_140320 ?auto_140319 ) ) ( not ( = ?auto_140318 ?auto_140331 ) ) ( not ( = ?auto_140334 ?auto_140332 ) ) ( not ( = ?auto_140327 ?auto_140325 ) ) ( not ( = ?auto_140320 ?auto_140325 ) ) ( not ( = ?auto_140319 ?auto_140325 ) ) ( not ( = ?auto_140324 ?auto_140331 ) ) ( not ( = ?auto_140329 ?auto_140330 ) ) ( not ( = ?auto_140329 ?auto_140332 ) ) ( not ( = ?auto_140327 ?auto_140323 ) ) ( not ( = ?auto_140320 ?auto_140323 ) ) ( not ( = ?auto_140319 ?auto_140323 ) ) ( not ( = ?auto_140325 ?auto_140323 ) ) ( not ( = ?auto_140322 ?auto_140331 ) ) ( not ( = ?auto_140335 ?auto_140334 ) ) ( not ( = ?auto_140335 ?auto_140330 ) ) ( not ( = ?auto_140335 ?auto_140332 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_140326 ?auto_140327 ?auto_140321 ?auto_140320 ?auto_140318 ?auto_140319 ?auto_140322 ?auto_140323 ?auto_140324 ?auto_140325 )
      ( GET-5IMAGE-VERIFY ?auto_140318 ?auto_140319 ?auto_140321 ?auto_140320 ?auto_140322 ?auto_140323 ?auto_140324 ?auto_140325 ?auto_140326 ?auto_140327 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_141862 - DIRECTION
      ?auto_141863 - MODE
      ?auto_141865 - DIRECTION
      ?auto_141864 - MODE
      ?auto_141866 - DIRECTION
      ?auto_141867 - MODE
      ?auto_141868 - DIRECTION
      ?auto_141869 - MODE
      ?auto_141870 - DIRECTION
      ?auto_141871 - MODE
    )
    :vars
    (
      ?auto_141879 - INSTRUMENT
      ?auto_141872 - SATELLITE
      ?auto_141877 - DIRECTION
      ?auto_141873 - INSTRUMENT
      ?auto_141878 - INSTRUMENT
      ?auto_141874 - INSTRUMENT
      ?auto_141876 - INSTRUMENT
      ?auto_141875 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_141865 ?auto_141862 ) ) ( not ( = ?auto_141866 ?auto_141862 ) ) ( not ( = ?auto_141866 ?auto_141865 ) ) ( not ( = ?auto_141868 ?auto_141862 ) ) ( not ( = ?auto_141868 ?auto_141865 ) ) ( not ( = ?auto_141868 ?auto_141866 ) ) ( not ( = ?auto_141870 ?auto_141862 ) ) ( not ( = ?auto_141870 ?auto_141865 ) ) ( not ( = ?auto_141870 ?auto_141866 ) ) ( not ( = ?auto_141870 ?auto_141868 ) ) ( ON_BOARD ?auto_141879 ?auto_141872 ) ( SUPPORTS ?auto_141879 ?auto_141871 ) ( not ( = ?auto_141870 ?auto_141877 ) ) ( CALIBRATION_TARGET ?auto_141879 ?auto_141877 ) ( not ( = ?auto_141877 ?auto_141865 ) ) ( ON_BOARD ?auto_141873 ?auto_141872 ) ( not ( = ?auto_141879 ?auto_141873 ) ) ( SUPPORTS ?auto_141873 ?auto_141864 ) ( CALIBRATION_TARGET ?auto_141873 ?auto_141877 ) ( not ( = ?auto_141877 ?auto_141862 ) ) ( ON_BOARD ?auto_141878 ?auto_141872 ) ( not ( = ?auto_141873 ?auto_141878 ) ) ( SUPPORTS ?auto_141878 ?auto_141863 ) ( CALIBRATION_TARGET ?auto_141878 ?auto_141877 ) ( not ( = ?auto_141877 ?auto_141868 ) ) ( ON_BOARD ?auto_141874 ?auto_141872 ) ( not ( = ?auto_141878 ?auto_141874 ) ) ( SUPPORTS ?auto_141874 ?auto_141869 ) ( CALIBRATION_TARGET ?auto_141874 ?auto_141877 ) ( not ( = ?auto_141877 ?auto_141866 ) ) ( ON_BOARD ?auto_141876 ?auto_141872 ) ( not ( = ?auto_141874 ?auto_141876 ) ) ( SUPPORTS ?auto_141876 ?auto_141867 ) ( CALIBRATION_TARGET ?auto_141876 ?auto_141877 ) ( POWER_AVAIL ?auto_141872 ) ( POINTING ?auto_141872 ?auto_141875 ) ( not ( = ?auto_141877 ?auto_141875 ) ) ( not ( = ?auto_141866 ?auto_141875 ) ) ( not ( = ?auto_141867 ?auto_141869 ) ) ( not ( = ?auto_141868 ?auto_141875 ) ) ( not ( = ?auto_141867 ?auto_141863 ) ) ( not ( = ?auto_141869 ?auto_141863 ) ) ( not ( = ?auto_141862 ?auto_141875 ) ) ( not ( = ?auto_141878 ?auto_141876 ) ) ( not ( = ?auto_141867 ?auto_141864 ) ) ( not ( = ?auto_141869 ?auto_141864 ) ) ( not ( = ?auto_141863 ?auto_141864 ) ) ( not ( = ?auto_141865 ?auto_141875 ) ) ( not ( = ?auto_141873 ?auto_141874 ) ) ( not ( = ?auto_141873 ?auto_141876 ) ) ( not ( = ?auto_141867 ?auto_141871 ) ) ( not ( = ?auto_141869 ?auto_141871 ) ) ( not ( = ?auto_141863 ?auto_141871 ) ) ( not ( = ?auto_141864 ?auto_141871 ) ) ( not ( = ?auto_141870 ?auto_141875 ) ) ( not ( = ?auto_141879 ?auto_141878 ) ) ( not ( = ?auto_141879 ?auto_141874 ) ) ( not ( = ?auto_141879 ?auto_141876 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_141866 ?auto_141867 ?auto_141868 ?auto_141869 ?auto_141862 ?auto_141863 ?auto_141870 ?auto_141871 ?auto_141865 ?auto_141864 )
      ( GET-5IMAGE-VERIFY ?auto_141862 ?auto_141863 ?auto_141865 ?auto_141864 ?auto_141866 ?auto_141867 ?auto_141868 ?auto_141869 ?auto_141870 ?auto_141871 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_141940 - DIRECTION
      ?auto_141941 - MODE
      ?auto_141943 - DIRECTION
      ?auto_141942 - MODE
      ?auto_141944 - DIRECTION
      ?auto_141945 - MODE
      ?auto_141946 - DIRECTION
      ?auto_141947 - MODE
      ?auto_141948 - DIRECTION
      ?auto_141949 - MODE
    )
    :vars
    (
      ?auto_141957 - INSTRUMENT
      ?auto_141950 - SATELLITE
      ?auto_141955 - DIRECTION
      ?auto_141951 - INSTRUMENT
      ?auto_141956 - INSTRUMENT
      ?auto_141952 - INSTRUMENT
      ?auto_141954 - INSTRUMENT
      ?auto_141953 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_141943 ?auto_141940 ) ) ( not ( = ?auto_141944 ?auto_141940 ) ) ( not ( = ?auto_141944 ?auto_141943 ) ) ( not ( = ?auto_141946 ?auto_141940 ) ) ( not ( = ?auto_141946 ?auto_141943 ) ) ( not ( = ?auto_141946 ?auto_141944 ) ) ( not ( = ?auto_141948 ?auto_141940 ) ) ( not ( = ?auto_141948 ?auto_141943 ) ) ( not ( = ?auto_141948 ?auto_141944 ) ) ( not ( = ?auto_141948 ?auto_141946 ) ) ( ON_BOARD ?auto_141957 ?auto_141950 ) ( SUPPORTS ?auto_141957 ?auto_141947 ) ( not ( = ?auto_141946 ?auto_141955 ) ) ( CALIBRATION_TARGET ?auto_141957 ?auto_141955 ) ( not ( = ?auto_141955 ?auto_141943 ) ) ( ON_BOARD ?auto_141951 ?auto_141950 ) ( not ( = ?auto_141957 ?auto_141951 ) ) ( SUPPORTS ?auto_141951 ?auto_141942 ) ( CALIBRATION_TARGET ?auto_141951 ?auto_141955 ) ( not ( = ?auto_141955 ?auto_141940 ) ) ( ON_BOARD ?auto_141956 ?auto_141950 ) ( not ( = ?auto_141951 ?auto_141956 ) ) ( SUPPORTS ?auto_141956 ?auto_141941 ) ( CALIBRATION_TARGET ?auto_141956 ?auto_141955 ) ( not ( = ?auto_141955 ?auto_141948 ) ) ( ON_BOARD ?auto_141952 ?auto_141950 ) ( not ( = ?auto_141956 ?auto_141952 ) ) ( SUPPORTS ?auto_141952 ?auto_141949 ) ( CALIBRATION_TARGET ?auto_141952 ?auto_141955 ) ( not ( = ?auto_141955 ?auto_141944 ) ) ( ON_BOARD ?auto_141954 ?auto_141950 ) ( not ( = ?auto_141952 ?auto_141954 ) ) ( SUPPORTS ?auto_141954 ?auto_141945 ) ( CALIBRATION_TARGET ?auto_141954 ?auto_141955 ) ( POWER_AVAIL ?auto_141950 ) ( POINTING ?auto_141950 ?auto_141953 ) ( not ( = ?auto_141955 ?auto_141953 ) ) ( not ( = ?auto_141944 ?auto_141953 ) ) ( not ( = ?auto_141945 ?auto_141949 ) ) ( not ( = ?auto_141948 ?auto_141953 ) ) ( not ( = ?auto_141945 ?auto_141941 ) ) ( not ( = ?auto_141949 ?auto_141941 ) ) ( not ( = ?auto_141940 ?auto_141953 ) ) ( not ( = ?auto_141956 ?auto_141954 ) ) ( not ( = ?auto_141945 ?auto_141942 ) ) ( not ( = ?auto_141949 ?auto_141942 ) ) ( not ( = ?auto_141941 ?auto_141942 ) ) ( not ( = ?auto_141943 ?auto_141953 ) ) ( not ( = ?auto_141951 ?auto_141952 ) ) ( not ( = ?auto_141951 ?auto_141954 ) ) ( not ( = ?auto_141945 ?auto_141947 ) ) ( not ( = ?auto_141949 ?auto_141947 ) ) ( not ( = ?auto_141941 ?auto_141947 ) ) ( not ( = ?auto_141942 ?auto_141947 ) ) ( not ( = ?auto_141946 ?auto_141953 ) ) ( not ( = ?auto_141957 ?auto_141956 ) ) ( not ( = ?auto_141957 ?auto_141952 ) ) ( not ( = ?auto_141957 ?auto_141954 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_141944 ?auto_141945 ?auto_141948 ?auto_141949 ?auto_141940 ?auto_141941 ?auto_141946 ?auto_141947 ?auto_141943 ?auto_141942 )
      ( GET-5IMAGE-VERIFY ?auto_141940 ?auto_141941 ?auto_141943 ?auto_141942 ?auto_141944 ?auto_141945 ?auto_141946 ?auto_141947 ?auto_141948 ?auto_141949 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_142018 - DIRECTION
      ?auto_142019 - MODE
      ?auto_142021 - DIRECTION
      ?auto_142020 - MODE
      ?auto_142022 - DIRECTION
      ?auto_142023 - MODE
      ?auto_142024 - DIRECTION
      ?auto_142025 - MODE
      ?auto_142026 - DIRECTION
      ?auto_142027 - MODE
    )
    :vars
    (
      ?auto_142035 - INSTRUMENT
      ?auto_142028 - SATELLITE
      ?auto_142033 - DIRECTION
      ?auto_142029 - INSTRUMENT
      ?auto_142034 - INSTRUMENT
      ?auto_142030 - INSTRUMENT
      ?auto_142032 - INSTRUMENT
      ?auto_142031 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_142021 ?auto_142018 ) ) ( not ( = ?auto_142022 ?auto_142018 ) ) ( not ( = ?auto_142022 ?auto_142021 ) ) ( not ( = ?auto_142024 ?auto_142018 ) ) ( not ( = ?auto_142024 ?auto_142021 ) ) ( not ( = ?auto_142024 ?auto_142022 ) ) ( not ( = ?auto_142026 ?auto_142018 ) ) ( not ( = ?auto_142026 ?auto_142021 ) ) ( not ( = ?auto_142026 ?auto_142022 ) ) ( not ( = ?auto_142026 ?auto_142024 ) ) ( ON_BOARD ?auto_142035 ?auto_142028 ) ( SUPPORTS ?auto_142035 ?auto_142027 ) ( not ( = ?auto_142026 ?auto_142033 ) ) ( CALIBRATION_TARGET ?auto_142035 ?auto_142033 ) ( not ( = ?auto_142033 ?auto_142021 ) ) ( ON_BOARD ?auto_142029 ?auto_142028 ) ( not ( = ?auto_142035 ?auto_142029 ) ) ( SUPPORTS ?auto_142029 ?auto_142020 ) ( CALIBRATION_TARGET ?auto_142029 ?auto_142033 ) ( not ( = ?auto_142033 ?auto_142018 ) ) ( ON_BOARD ?auto_142034 ?auto_142028 ) ( not ( = ?auto_142029 ?auto_142034 ) ) ( SUPPORTS ?auto_142034 ?auto_142019 ) ( CALIBRATION_TARGET ?auto_142034 ?auto_142033 ) ( not ( = ?auto_142033 ?auto_142022 ) ) ( ON_BOARD ?auto_142030 ?auto_142028 ) ( not ( = ?auto_142034 ?auto_142030 ) ) ( SUPPORTS ?auto_142030 ?auto_142023 ) ( CALIBRATION_TARGET ?auto_142030 ?auto_142033 ) ( not ( = ?auto_142033 ?auto_142024 ) ) ( ON_BOARD ?auto_142032 ?auto_142028 ) ( not ( = ?auto_142030 ?auto_142032 ) ) ( SUPPORTS ?auto_142032 ?auto_142025 ) ( CALIBRATION_TARGET ?auto_142032 ?auto_142033 ) ( POWER_AVAIL ?auto_142028 ) ( POINTING ?auto_142028 ?auto_142031 ) ( not ( = ?auto_142033 ?auto_142031 ) ) ( not ( = ?auto_142024 ?auto_142031 ) ) ( not ( = ?auto_142025 ?auto_142023 ) ) ( not ( = ?auto_142022 ?auto_142031 ) ) ( not ( = ?auto_142025 ?auto_142019 ) ) ( not ( = ?auto_142023 ?auto_142019 ) ) ( not ( = ?auto_142018 ?auto_142031 ) ) ( not ( = ?auto_142034 ?auto_142032 ) ) ( not ( = ?auto_142025 ?auto_142020 ) ) ( not ( = ?auto_142023 ?auto_142020 ) ) ( not ( = ?auto_142019 ?auto_142020 ) ) ( not ( = ?auto_142021 ?auto_142031 ) ) ( not ( = ?auto_142029 ?auto_142030 ) ) ( not ( = ?auto_142029 ?auto_142032 ) ) ( not ( = ?auto_142025 ?auto_142027 ) ) ( not ( = ?auto_142023 ?auto_142027 ) ) ( not ( = ?auto_142019 ?auto_142027 ) ) ( not ( = ?auto_142020 ?auto_142027 ) ) ( not ( = ?auto_142026 ?auto_142031 ) ) ( not ( = ?auto_142035 ?auto_142034 ) ) ( not ( = ?auto_142035 ?auto_142030 ) ) ( not ( = ?auto_142035 ?auto_142032 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_142024 ?auto_142025 ?auto_142022 ?auto_142023 ?auto_142018 ?auto_142019 ?auto_142026 ?auto_142027 ?auto_142021 ?auto_142020 )
      ( GET-5IMAGE-VERIFY ?auto_142018 ?auto_142019 ?auto_142021 ?auto_142020 ?auto_142022 ?auto_142023 ?auto_142024 ?auto_142025 ?auto_142026 ?auto_142027 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_142096 - DIRECTION
      ?auto_142097 - MODE
      ?auto_142099 - DIRECTION
      ?auto_142098 - MODE
      ?auto_142100 - DIRECTION
      ?auto_142101 - MODE
      ?auto_142102 - DIRECTION
      ?auto_142103 - MODE
      ?auto_142104 - DIRECTION
      ?auto_142105 - MODE
    )
    :vars
    (
      ?auto_142113 - INSTRUMENT
      ?auto_142106 - SATELLITE
      ?auto_142111 - DIRECTION
      ?auto_142107 - INSTRUMENT
      ?auto_142112 - INSTRUMENT
      ?auto_142108 - INSTRUMENT
      ?auto_142110 - INSTRUMENT
      ?auto_142109 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_142099 ?auto_142096 ) ) ( not ( = ?auto_142100 ?auto_142096 ) ) ( not ( = ?auto_142100 ?auto_142099 ) ) ( not ( = ?auto_142102 ?auto_142096 ) ) ( not ( = ?auto_142102 ?auto_142099 ) ) ( not ( = ?auto_142102 ?auto_142100 ) ) ( not ( = ?auto_142104 ?auto_142096 ) ) ( not ( = ?auto_142104 ?auto_142099 ) ) ( not ( = ?auto_142104 ?auto_142100 ) ) ( not ( = ?auto_142104 ?auto_142102 ) ) ( ON_BOARD ?auto_142113 ?auto_142106 ) ( SUPPORTS ?auto_142113 ?auto_142103 ) ( not ( = ?auto_142102 ?auto_142111 ) ) ( CALIBRATION_TARGET ?auto_142113 ?auto_142111 ) ( not ( = ?auto_142111 ?auto_142099 ) ) ( ON_BOARD ?auto_142107 ?auto_142106 ) ( not ( = ?auto_142113 ?auto_142107 ) ) ( SUPPORTS ?auto_142107 ?auto_142098 ) ( CALIBRATION_TARGET ?auto_142107 ?auto_142111 ) ( not ( = ?auto_142111 ?auto_142096 ) ) ( ON_BOARD ?auto_142112 ?auto_142106 ) ( not ( = ?auto_142107 ?auto_142112 ) ) ( SUPPORTS ?auto_142112 ?auto_142097 ) ( CALIBRATION_TARGET ?auto_142112 ?auto_142111 ) ( not ( = ?auto_142111 ?auto_142100 ) ) ( ON_BOARD ?auto_142108 ?auto_142106 ) ( not ( = ?auto_142112 ?auto_142108 ) ) ( SUPPORTS ?auto_142108 ?auto_142101 ) ( CALIBRATION_TARGET ?auto_142108 ?auto_142111 ) ( not ( = ?auto_142111 ?auto_142104 ) ) ( ON_BOARD ?auto_142110 ?auto_142106 ) ( not ( = ?auto_142108 ?auto_142110 ) ) ( SUPPORTS ?auto_142110 ?auto_142105 ) ( CALIBRATION_TARGET ?auto_142110 ?auto_142111 ) ( POWER_AVAIL ?auto_142106 ) ( POINTING ?auto_142106 ?auto_142109 ) ( not ( = ?auto_142111 ?auto_142109 ) ) ( not ( = ?auto_142104 ?auto_142109 ) ) ( not ( = ?auto_142105 ?auto_142101 ) ) ( not ( = ?auto_142100 ?auto_142109 ) ) ( not ( = ?auto_142105 ?auto_142097 ) ) ( not ( = ?auto_142101 ?auto_142097 ) ) ( not ( = ?auto_142096 ?auto_142109 ) ) ( not ( = ?auto_142112 ?auto_142110 ) ) ( not ( = ?auto_142105 ?auto_142098 ) ) ( not ( = ?auto_142101 ?auto_142098 ) ) ( not ( = ?auto_142097 ?auto_142098 ) ) ( not ( = ?auto_142099 ?auto_142109 ) ) ( not ( = ?auto_142107 ?auto_142108 ) ) ( not ( = ?auto_142107 ?auto_142110 ) ) ( not ( = ?auto_142105 ?auto_142103 ) ) ( not ( = ?auto_142101 ?auto_142103 ) ) ( not ( = ?auto_142097 ?auto_142103 ) ) ( not ( = ?auto_142098 ?auto_142103 ) ) ( not ( = ?auto_142102 ?auto_142109 ) ) ( not ( = ?auto_142113 ?auto_142112 ) ) ( not ( = ?auto_142113 ?auto_142108 ) ) ( not ( = ?auto_142113 ?auto_142110 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_142104 ?auto_142105 ?auto_142100 ?auto_142101 ?auto_142096 ?auto_142097 ?auto_142102 ?auto_142103 ?auto_142099 ?auto_142098 )
      ( GET-5IMAGE-VERIFY ?auto_142096 ?auto_142097 ?auto_142099 ?auto_142098 ?auto_142100 ?auto_142101 ?auto_142102 ?auto_142103 ?auto_142104 ?auto_142105 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_142594 - DIRECTION
      ?auto_142595 - MODE
      ?auto_142597 - DIRECTION
      ?auto_142596 - MODE
      ?auto_142598 - DIRECTION
      ?auto_142599 - MODE
      ?auto_142600 - DIRECTION
      ?auto_142601 - MODE
      ?auto_142602 - DIRECTION
      ?auto_142603 - MODE
    )
    :vars
    (
      ?auto_142611 - INSTRUMENT
      ?auto_142604 - SATELLITE
      ?auto_142609 - DIRECTION
      ?auto_142605 - INSTRUMENT
      ?auto_142610 - INSTRUMENT
      ?auto_142606 - INSTRUMENT
      ?auto_142608 - INSTRUMENT
      ?auto_142607 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_142597 ?auto_142594 ) ) ( not ( = ?auto_142598 ?auto_142594 ) ) ( not ( = ?auto_142598 ?auto_142597 ) ) ( not ( = ?auto_142600 ?auto_142594 ) ) ( not ( = ?auto_142600 ?auto_142597 ) ) ( not ( = ?auto_142600 ?auto_142598 ) ) ( not ( = ?auto_142602 ?auto_142594 ) ) ( not ( = ?auto_142602 ?auto_142597 ) ) ( not ( = ?auto_142602 ?auto_142598 ) ) ( not ( = ?auto_142602 ?auto_142600 ) ) ( ON_BOARD ?auto_142611 ?auto_142604 ) ( SUPPORTS ?auto_142611 ?auto_142599 ) ( not ( = ?auto_142598 ?auto_142609 ) ) ( CALIBRATION_TARGET ?auto_142611 ?auto_142609 ) ( not ( = ?auto_142609 ?auto_142597 ) ) ( ON_BOARD ?auto_142605 ?auto_142604 ) ( not ( = ?auto_142611 ?auto_142605 ) ) ( SUPPORTS ?auto_142605 ?auto_142596 ) ( CALIBRATION_TARGET ?auto_142605 ?auto_142609 ) ( not ( = ?auto_142609 ?auto_142594 ) ) ( ON_BOARD ?auto_142610 ?auto_142604 ) ( not ( = ?auto_142605 ?auto_142610 ) ) ( SUPPORTS ?auto_142610 ?auto_142595 ) ( CALIBRATION_TARGET ?auto_142610 ?auto_142609 ) ( not ( = ?auto_142609 ?auto_142602 ) ) ( ON_BOARD ?auto_142606 ?auto_142604 ) ( not ( = ?auto_142610 ?auto_142606 ) ) ( SUPPORTS ?auto_142606 ?auto_142603 ) ( CALIBRATION_TARGET ?auto_142606 ?auto_142609 ) ( not ( = ?auto_142609 ?auto_142600 ) ) ( ON_BOARD ?auto_142608 ?auto_142604 ) ( not ( = ?auto_142606 ?auto_142608 ) ) ( SUPPORTS ?auto_142608 ?auto_142601 ) ( CALIBRATION_TARGET ?auto_142608 ?auto_142609 ) ( POWER_AVAIL ?auto_142604 ) ( POINTING ?auto_142604 ?auto_142607 ) ( not ( = ?auto_142609 ?auto_142607 ) ) ( not ( = ?auto_142600 ?auto_142607 ) ) ( not ( = ?auto_142601 ?auto_142603 ) ) ( not ( = ?auto_142602 ?auto_142607 ) ) ( not ( = ?auto_142601 ?auto_142595 ) ) ( not ( = ?auto_142603 ?auto_142595 ) ) ( not ( = ?auto_142594 ?auto_142607 ) ) ( not ( = ?auto_142610 ?auto_142608 ) ) ( not ( = ?auto_142601 ?auto_142596 ) ) ( not ( = ?auto_142603 ?auto_142596 ) ) ( not ( = ?auto_142595 ?auto_142596 ) ) ( not ( = ?auto_142597 ?auto_142607 ) ) ( not ( = ?auto_142605 ?auto_142606 ) ) ( not ( = ?auto_142605 ?auto_142608 ) ) ( not ( = ?auto_142601 ?auto_142599 ) ) ( not ( = ?auto_142603 ?auto_142599 ) ) ( not ( = ?auto_142595 ?auto_142599 ) ) ( not ( = ?auto_142596 ?auto_142599 ) ) ( not ( = ?auto_142598 ?auto_142607 ) ) ( not ( = ?auto_142611 ?auto_142610 ) ) ( not ( = ?auto_142611 ?auto_142606 ) ) ( not ( = ?auto_142611 ?auto_142608 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_142600 ?auto_142601 ?auto_142602 ?auto_142603 ?auto_142594 ?auto_142595 ?auto_142598 ?auto_142599 ?auto_142597 ?auto_142596 )
      ( GET-5IMAGE-VERIFY ?auto_142594 ?auto_142595 ?auto_142597 ?auto_142596 ?auto_142598 ?auto_142599 ?auto_142600 ?auto_142601 ?auto_142602 ?auto_142603 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_142672 - DIRECTION
      ?auto_142673 - MODE
      ?auto_142675 - DIRECTION
      ?auto_142674 - MODE
      ?auto_142676 - DIRECTION
      ?auto_142677 - MODE
      ?auto_142678 - DIRECTION
      ?auto_142679 - MODE
      ?auto_142680 - DIRECTION
      ?auto_142681 - MODE
    )
    :vars
    (
      ?auto_142689 - INSTRUMENT
      ?auto_142682 - SATELLITE
      ?auto_142687 - DIRECTION
      ?auto_142683 - INSTRUMENT
      ?auto_142688 - INSTRUMENT
      ?auto_142684 - INSTRUMENT
      ?auto_142686 - INSTRUMENT
      ?auto_142685 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_142675 ?auto_142672 ) ) ( not ( = ?auto_142676 ?auto_142672 ) ) ( not ( = ?auto_142676 ?auto_142675 ) ) ( not ( = ?auto_142678 ?auto_142672 ) ) ( not ( = ?auto_142678 ?auto_142675 ) ) ( not ( = ?auto_142678 ?auto_142676 ) ) ( not ( = ?auto_142680 ?auto_142672 ) ) ( not ( = ?auto_142680 ?auto_142675 ) ) ( not ( = ?auto_142680 ?auto_142676 ) ) ( not ( = ?auto_142680 ?auto_142678 ) ) ( ON_BOARD ?auto_142689 ?auto_142682 ) ( SUPPORTS ?auto_142689 ?auto_142677 ) ( not ( = ?auto_142676 ?auto_142687 ) ) ( CALIBRATION_TARGET ?auto_142689 ?auto_142687 ) ( not ( = ?auto_142687 ?auto_142675 ) ) ( ON_BOARD ?auto_142683 ?auto_142682 ) ( not ( = ?auto_142689 ?auto_142683 ) ) ( SUPPORTS ?auto_142683 ?auto_142674 ) ( CALIBRATION_TARGET ?auto_142683 ?auto_142687 ) ( not ( = ?auto_142687 ?auto_142672 ) ) ( ON_BOARD ?auto_142688 ?auto_142682 ) ( not ( = ?auto_142683 ?auto_142688 ) ) ( SUPPORTS ?auto_142688 ?auto_142673 ) ( CALIBRATION_TARGET ?auto_142688 ?auto_142687 ) ( not ( = ?auto_142687 ?auto_142678 ) ) ( ON_BOARD ?auto_142684 ?auto_142682 ) ( not ( = ?auto_142688 ?auto_142684 ) ) ( SUPPORTS ?auto_142684 ?auto_142679 ) ( CALIBRATION_TARGET ?auto_142684 ?auto_142687 ) ( not ( = ?auto_142687 ?auto_142680 ) ) ( ON_BOARD ?auto_142686 ?auto_142682 ) ( not ( = ?auto_142684 ?auto_142686 ) ) ( SUPPORTS ?auto_142686 ?auto_142681 ) ( CALIBRATION_TARGET ?auto_142686 ?auto_142687 ) ( POWER_AVAIL ?auto_142682 ) ( POINTING ?auto_142682 ?auto_142685 ) ( not ( = ?auto_142687 ?auto_142685 ) ) ( not ( = ?auto_142680 ?auto_142685 ) ) ( not ( = ?auto_142681 ?auto_142679 ) ) ( not ( = ?auto_142678 ?auto_142685 ) ) ( not ( = ?auto_142681 ?auto_142673 ) ) ( not ( = ?auto_142679 ?auto_142673 ) ) ( not ( = ?auto_142672 ?auto_142685 ) ) ( not ( = ?auto_142688 ?auto_142686 ) ) ( not ( = ?auto_142681 ?auto_142674 ) ) ( not ( = ?auto_142679 ?auto_142674 ) ) ( not ( = ?auto_142673 ?auto_142674 ) ) ( not ( = ?auto_142675 ?auto_142685 ) ) ( not ( = ?auto_142683 ?auto_142684 ) ) ( not ( = ?auto_142683 ?auto_142686 ) ) ( not ( = ?auto_142681 ?auto_142677 ) ) ( not ( = ?auto_142679 ?auto_142677 ) ) ( not ( = ?auto_142673 ?auto_142677 ) ) ( not ( = ?auto_142674 ?auto_142677 ) ) ( not ( = ?auto_142676 ?auto_142685 ) ) ( not ( = ?auto_142689 ?auto_142688 ) ) ( not ( = ?auto_142689 ?auto_142684 ) ) ( not ( = ?auto_142689 ?auto_142686 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_142680 ?auto_142681 ?auto_142678 ?auto_142679 ?auto_142672 ?auto_142673 ?auto_142676 ?auto_142677 ?auto_142675 ?auto_142674 )
      ( GET-5IMAGE-VERIFY ?auto_142672 ?auto_142673 ?auto_142675 ?auto_142674 ?auto_142676 ?auto_142677 ?auto_142678 ?auto_142679 ?auto_142680 ?auto_142681 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_143254 - DIRECTION
      ?auto_143255 - MODE
      ?auto_143257 - DIRECTION
      ?auto_143256 - MODE
      ?auto_143258 - DIRECTION
      ?auto_143259 - MODE
      ?auto_143260 - DIRECTION
      ?auto_143261 - MODE
      ?auto_143262 - DIRECTION
      ?auto_143263 - MODE
    )
    :vars
    (
      ?auto_143271 - INSTRUMENT
      ?auto_143264 - SATELLITE
      ?auto_143269 - DIRECTION
      ?auto_143265 - INSTRUMENT
      ?auto_143270 - INSTRUMENT
      ?auto_143266 - INSTRUMENT
      ?auto_143268 - INSTRUMENT
      ?auto_143267 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_143257 ?auto_143254 ) ) ( not ( = ?auto_143258 ?auto_143254 ) ) ( not ( = ?auto_143258 ?auto_143257 ) ) ( not ( = ?auto_143260 ?auto_143254 ) ) ( not ( = ?auto_143260 ?auto_143257 ) ) ( not ( = ?auto_143260 ?auto_143258 ) ) ( not ( = ?auto_143262 ?auto_143254 ) ) ( not ( = ?auto_143262 ?auto_143257 ) ) ( not ( = ?auto_143262 ?auto_143258 ) ) ( not ( = ?auto_143262 ?auto_143260 ) ) ( ON_BOARD ?auto_143271 ?auto_143264 ) ( SUPPORTS ?auto_143271 ?auto_143256 ) ( not ( = ?auto_143257 ?auto_143269 ) ) ( CALIBRATION_TARGET ?auto_143271 ?auto_143269 ) ( not ( = ?auto_143269 ?auto_143262 ) ) ( ON_BOARD ?auto_143265 ?auto_143264 ) ( not ( = ?auto_143271 ?auto_143265 ) ) ( SUPPORTS ?auto_143265 ?auto_143263 ) ( CALIBRATION_TARGET ?auto_143265 ?auto_143269 ) ( not ( = ?auto_143269 ?auto_143254 ) ) ( ON_BOARD ?auto_143270 ?auto_143264 ) ( not ( = ?auto_143265 ?auto_143270 ) ) ( SUPPORTS ?auto_143270 ?auto_143255 ) ( CALIBRATION_TARGET ?auto_143270 ?auto_143269 ) ( not ( = ?auto_143269 ?auto_143260 ) ) ( ON_BOARD ?auto_143266 ?auto_143264 ) ( not ( = ?auto_143270 ?auto_143266 ) ) ( SUPPORTS ?auto_143266 ?auto_143261 ) ( CALIBRATION_TARGET ?auto_143266 ?auto_143269 ) ( not ( = ?auto_143269 ?auto_143258 ) ) ( ON_BOARD ?auto_143268 ?auto_143264 ) ( not ( = ?auto_143266 ?auto_143268 ) ) ( SUPPORTS ?auto_143268 ?auto_143259 ) ( CALIBRATION_TARGET ?auto_143268 ?auto_143269 ) ( POWER_AVAIL ?auto_143264 ) ( POINTING ?auto_143264 ?auto_143267 ) ( not ( = ?auto_143269 ?auto_143267 ) ) ( not ( = ?auto_143258 ?auto_143267 ) ) ( not ( = ?auto_143259 ?auto_143261 ) ) ( not ( = ?auto_143260 ?auto_143267 ) ) ( not ( = ?auto_143259 ?auto_143255 ) ) ( not ( = ?auto_143261 ?auto_143255 ) ) ( not ( = ?auto_143254 ?auto_143267 ) ) ( not ( = ?auto_143270 ?auto_143268 ) ) ( not ( = ?auto_143259 ?auto_143263 ) ) ( not ( = ?auto_143261 ?auto_143263 ) ) ( not ( = ?auto_143255 ?auto_143263 ) ) ( not ( = ?auto_143262 ?auto_143267 ) ) ( not ( = ?auto_143265 ?auto_143266 ) ) ( not ( = ?auto_143265 ?auto_143268 ) ) ( not ( = ?auto_143259 ?auto_143256 ) ) ( not ( = ?auto_143261 ?auto_143256 ) ) ( not ( = ?auto_143255 ?auto_143256 ) ) ( not ( = ?auto_143263 ?auto_143256 ) ) ( not ( = ?auto_143257 ?auto_143267 ) ) ( not ( = ?auto_143271 ?auto_143270 ) ) ( not ( = ?auto_143271 ?auto_143266 ) ) ( not ( = ?auto_143271 ?auto_143268 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_143258 ?auto_143259 ?auto_143260 ?auto_143261 ?auto_143254 ?auto_143255 ?auto_143257 ?auto_143256 ?auto_143262 ?auto_143263 )
      ( GET-5IMAGE-VERIFY ?auto_143254 ?auto_143255 ?auto_143257 ?auto_143256 ?auto_143258 ?auto_143259 ?auto_143260 ?auto_143261 ?auto_143262 ?auto_143263 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_143418 - DIRECTION
      ?auto_143419 - MODE
      ?auto_143421 - DIRECTION
      ?auto_143420 - MODE
      ?auto_143422 - DIRECTION
      ?auto_143423 - MODE
      ?auto_143424 - DIRECTION
      ?auto_143425 - MODE
      ?auto_143426 - DIRECTION
      ?auto_143427 - MODE
    )
    :vars
    (
      ?auto_143435 - INSTRUMENT
      ?auto_143428 - SATELLITE
      ?auto_143433 - DIRECTION
      ?auto_143429 - INSTRUMENT
      ?auto_143434 - INSTRUMENT
      ?auto_143430 - INSTRUMENT
      ?auto_143432 - INSTRUMENT
      ?auto_143431 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_143421 ?auto_143418 ) ) ( not ( = ?auto_143422 ?auto_143418 ) ) ( not ( = ?auto_143422 ?auto_143421 ) ) ( not ( = ?auto_143424 ?auto_143418 ) ) ( not ( = ?auto_143424 ?auto_143421 ) ) ( not ( = ?auto_143424 ?auto_143422 ) ) ( not ( = ?auto_143426 ?auto_143418 ) ) ( not ( = ?auto_143426 ?auto_143421 ) ) ( not ( = ?auto_143426 ?auto_143422 ) ) ( not ( = ?auto_143426 ?auto_143424 ) ) ( ON_BOARD ?auto_143435 ?auto_143428 ) ( SUPPORTS ?auto_143435 ?auto_143420 ) ( not ( = ?auto_143421 ?auto_143433 ) ) ( CALIBRATION_TARGET ?auto_143435 ?auto_143433 ) ( not ( = ?auto_143433 ?auto_143424 ) ) ( ON_BOARD ?auto_143429 ?auto_143428 ) ( not ( = ?auto_143435 ?auto_143429 ) ) ( SUPPORTS ?auto_143429 ?auto_143425 ) ( CALIBRATION_TARGET ?auto_143429 ?auto_143433 ) ( not ( = ?auto_143433 ?auto_143418 ) ) ( ON_BOARD ?auto_143434 ?auto_143428 ) ( not ( = ?auto_143429 ?auto_143434 ) ) ( SUPPORTS ?auto_143434 ?auto_143419 ) ( CALIBRATION_TARGET ?auto_143434 ?auto_143433 ) ( not ( = ?auto_143433 ?auto_143426 ) ) ( ON_BOARD ?auto_143430 ?auto_143428 ) ( not ( = ?auto_143434 ?auto_143430 ) ) ( SUPPORTS ?auto_143430 ?auto_143427 ) ( CALIBRATION_TARGET ?auto_143430 ?auto_143433 ) ( not ( = ?auto_143433 ?auto_143422 ) ) ( ON_BOARD ?auto_143432 ?auto_143428 ) ( not ( = ?auto_143430 ?auto_143432 ) ) ( SUPPORTS ?auto_143432 ?auto_143423 ) ( CALIBRATION_TARGET ?auto_143432 ?auto_143433 ) ( POWER_AVAIL ?auto_143428 ) ( POINTING ?auto_143428 ?auto_143431 ) ( not ( = ?auto_143433 ?auto_143431 ) ) ( not ( = ?auto_143422 ?auto_143431 ) ) ( not ( = ?auto_143423 ?auto_143427 ) ) ( not ( = ?auto_143426 ?auto_143431 ) ) ( not ( = ?auto_143423 ?auto_143419 ) ) ( not ( = ?auto_143427 ?auto_143419 ) ) ( not ( = ?auto_143418 ?auto_143431 ) ) ( not ( = ?auto_143434 ?auto_143432 ) ) ( not ( = ?auto_143423 ?auto_143425 ) ) ( not ( = ?auto_143427 ?auto_143425 ) ) ( not ( = ?auto_143419 ?auto_143425 ) ) ( not ( = ?auto_143424 ?auto_143431 ) ) ( not ( = ?auto_143429 ?auto_143430 ) ) ( not ( = ?auto_143429 ?auto_143432 ) ) ( not ( = ?auto_143423 ?auto_143420 ) ) ( not ( = ?auto_143427 ?auto_143420 ) ) ( not ( = ?auto_143419 ?auto_143420 ) ) ( not ( = ?auto_143425 ?auto_143420 ) ) ( not ( = ?auto_143421 ?auto_143431 ) ) ( not ( = ?auto_143435 ?auto_143434 ) ) ( not ( = ?auto_143435 ?auto_143430 ) ) ( not ( = ?auto_143435 ?auto_143432 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_143422 ?auto_143423 ?auto_143426 ?auto_143427 ?auto_143418 ?auto_143419 ?auto_143421 ?auto_143420 ?auto_143424 ?auto_143425 )
      ( GET-5IMAGE-VERIFY ?auto_143418 ?auto_143419 ?auto_143421 ?auto_143420 ?auto_143422 ?auto_143423 ?auto_143424 ?auto_143425 ?auto_143426 ?auto_143427 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_143662 - DIRECTION
      ?auto_143663 - MODE
      ?auto_143665 - DIRECTION
      ?auto_143664 - MODE
      ?auto_143666 - DIRECTION
      ?auto_143667 - MODE
      ?auto_143668 - DIRECTION
      ?auto_143669 - MODE
      ?auto_143670 - DIRECTION
      ?auto_143671 - MODE
    )
    :vars
    (
      ?auto_143679 - INSTRUMENT
      ?auto_143672 - SATELLITE
      ?auto_143677 - DIRECTION
      ?auto_143673 - INSTRUMENT
      ?auto_143678 - INSTRUMENT
      ?auto_143674 - INSTRUMENT
      ?auto_143676 - INSTRUMENT
      ?auto_143675 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_143665 ?auto_143662 ) ) ( not ( = ?auto_143666 ?auto_143662 ) ) ( not ( = ?auto_143666 ?auto_143665 ) ) ( not ( = ?auto_143668 ?auto_143662 ) ) ( not ( = ?auto_143668 ?auto_143665 ) ) ( not ( = ?auto_143668 ?auto_143666 ) ) ( not ( = ?auto_143670 ?auto_143662 ) ) ( not ( = ?auto_143670 ?auto_143665 ) ) ( not ( = ?auto_143670 ?auto_143666 ) ) ( not ( = ?auto_143670 ?auto_143668 ) ) ( ON_BOARD ?auto_143679 ?auto_143672 ) ( SUPPORTS ?auto_143679 ?auto_143664 ) ( not ( = ?auto_143665 ?auto_143677 ) ) ( CALIBRATION_TARGET ?auto_143679 ?auto_143677 ) ( not ( = ?auto_143677 ?auto_143670 ) ) ( ON_BOARD ?auto_143673 ?auto_143672 ) ( not ( = ?auto_143679 ?auto_143673 ) ) ( SUPPORTS ?auto_143673 ?auto_143671 ) ( CALIBRATION_TARGET ?auto_143673 ?auto_143677 ) ( not ( = ?auto_143677 ?auto_143662 ) ) ( ON_BOARD ?auto_143678 ?auto_143672 ) ( not ( = ?auto_143673 ?auto_143678 ) ) ( SUPPORTS ?auto_143678 ?auto_143663 ) ( CALIBRATION_TARGET ?auto_143678 ?auto_143677 ) ( not ( = ?auto_143677 ?auto_143666 ) ) ( ON_BOARD ?auto_143674 ?auto_143672 ) ( not ( = ?auto_143678 ?auto_143674 ) ) ( SUPPORTS ?auto_143674 ?auto_143667 ) ( CALIBRATION_TARGET ?auto_143674 ?auto_143677 ) ( not ( = ?auto_143677 ?auto_143668 ) ) ( ON_BOARD ?auto_143676 ?auto_143672 ) ( not ( = ?auto_143674 ?auto_143676 ) ) ( SUPPORTS ?auto_143676 ?auto_143669 ) ( CALIBRATION_TARGET ?auto_143676 ?auto_143677 ) ( POWER_AVAIL ?auto_143672 ) ( POINTING ?auto_143672 ?auto_143675 ) ( not ( = ?auto_143677 ?auto_143675 ) ) ( not ( = ?auto_143668 ?auto_143675 ) ) ( not ( = ?auto_143669 ?auto_143667 ) ) ( not ( = ?auto_143666 ?auto_143675 ) ) ( not ( = ?auto_143669 ?auto_143663 ) ) ( not ( = ?auto_143667 ?auto_143663 ) ) ( not ( = ?auto_143662 ?auto_143675 ) ) ( not ( = ?auto_143678 ?auto_143676 ) ) ( not ( = ?auto_143669 ?auto_143671 ) ) ( not ( = ?auto_143667 ?auto_143671 ) ) ( not ( = ?auto_143663 ?auto_143671 ) ) ( not ( = ?auto_143670 ?auto_143675 ) ) ( not ( = ?auto_143673 ?auto_143674 ) ) ( not ( = ?auto_143673 ?auto_143676 ) ) ( not ( = ?auto_143669 ?auto_143664 ) ) ( not ( = ?auto_143667 ?auto_143664 ) ) ( not ( = ?auto_143663 ?auto_143664 ) ) ( not ( = ?auto_143671 ?auto_143664 ) ) ( not ( = ?auto_143665 ?auto_143675 ) ) ( not ( = ?auto_143679 ?auto_143678 ) ) ( not ( = ?auto_143679 ?auto_143674 ) ) ( not ( = ?auto_143679 ?auto_143676 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_143668 ?auto_143669 ?auto_143666 ?auto_143667 ?auto_143662 ?auto_143663 ?auto_143665 ?auto_143664 ?auto_143670 ?auto_143671 )
      ( GET-5IMAGE-VERIFY ?auto_143662 ?auto_143663 ?auto_143665 ?auto_143664 ?auto_143666 ?auto_143667 ?auto_143668 ?auto_143669 ?auto_143670 ?auto_143671 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_143912 - DIRECTION
      ?auto_143913 - MODE
      ?auto_143915 - DIRECTION
      ?auto_143914 - MODE
      ?auto_143916 - DIRECTION
      ?auto_143917 - MODE
      ?auto_143918 - DIRECTION
      ?auto_143919 - MODE
      ?auto_143920 - DIRECTION
      ?auto_143921 - MODE
    )
    :vars
    (
      ?auto_143929 - INSTRUMENT
      ?auto_143922 - SATELLITE
      ?auto_143927 - DIRECTION
      ?auto_143923 - INSTRUMENT
      ?auto_143928 - INSTRUMENT
      ?auto_143924 - INSTRUMENT
      ?auto_143926 - INSTRUMENT
      ?auto_143925 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_143915 ?auto_143912 ) ) ( not ( = ?auto_143916 ?auto_143912 ) ) ( not ( = ?auto_143916 ?auto_143915 ) ) ( not ( = ?auto_143918 ?auto_143912 ) ) ( not ( = ?auto_143918 ?auto_143915 ) ) ( not ( = ?auto_143918 ?auto_143916 ) ) ( not ( = ?auto_143920 ?auto_143912 ) ) ( not ( = ?auto_143920 ?auto_143915 ) ) ( not ( = ?auto_143920 ?auto_143916 ) ) ( not ( = ?auto_143920 ?auto_143918 ) ) ( ON_BOARD ?auto_143929 ?auto_143922 ) ( SUPPORTS ?auto_143929 ?auto_143914 ) ( not ( = ?auto_143915 ?auto_143927 ) ) ( CALIBRATION_TARGET ?auto_143929 ?auto_143927 ) ( not ( = ?auto_143927 ?auto_143918 ) ) ( ON_BOARD ?auto_143923 ?auto_143922 ) ( not ( = ?auto_143929 ?auto_143923 ) ) ( SUPPORTS ?auto_143923 ?auto_143919 ) ( CALIBRATION_TARGET ?auto_143923 ?auto_143927 ) ( not ( = ?auto_143927 ?auto_143912 ) ) ( ON_BOARD ?auto_143928 ?auto_143922 ) ( not ( = ?auto_143923 ?auto_143928 ) ) ( SUPPORTS ?auto_143928 ?auto_143913 ) ( CALIBRATION_TARGET ?auto_143928 ?auto_143927 ) ( not ( = ?auto_143927 ?auto_143916 ) ) ( ON_BOARD ?auto_143924 ?auto_143922 ) ( not ( = ?auto_143928 ?auto_143924 ) ) ( SUPPORTS ?auto_143924 ?auto_143917 ) ( CALIBRATION_TARGET ?auto_143924 ?auto_143927 ) ( not ( = ?auto_143927 ?auto_143920 ) ) ( ON_BOARD ?auto_143926 ?auto_143922 ) ( not ( = ?auto_143924 ?auto_143926 ) ) ( SUPPORTS ?auto_143926 ?auto_143921 ) ( CALIBRATION_TARGET ?auto_143926 ?auto_143927 ) ( POWER_AVAIL ?auto_143922 ) ( POINTING ?auto_143922 ?auto_143925 ) ( not ( = ?auto_143927 ?auto_143925 ) ) ( not ( = ?auto_143920 ?auto_143925 ) ) ( not ( = ?auto_143921 ?auto_143917 ) ) ( not ( = ?auto_143916 ?auto_143925 ) ) ( not ( = ?auto_143921 ?auto_143913 ) ) ( not ( = ?auto_143917 ?auto_143913 ) ) ( not ( = ?auto_143912 ?auto_143925 ) ) ( not ( = ?auto_143928 ?auto_143926 ) ) ( not ( = ?auto_143921 ?auto_143919 ) ) ( not ( = ?auto_143917 ?auto_143919 ) ) ( not ( = ?auto_143913 ?auto_143919 ) ) ( not ( = ?auto_143918 ?auto_143925 ) ) ( not ( = ?auto_143923 ?auto_143924 ) ) ( not ( = ?auto_143923 ?auto_143926 ) ) ( not ( = ?auto_143921 ?auto_143914 ) ) ( not ( = ?auto_143917 ?auto_143914 ) ) ( not ( = ?auto_143913 ?auto_143914 ) ) ( not ( = ?auto_143919 ?auto_143914 ) ) ( not ( = ?auto_143915 ?auto_143925 ) ) ( not ( = ?auto_143929 ?auto_143928 ) ) ( not ( = ?auto_143929 ?auto_143924 ) ) ( not ( = ?auto_143929 ?auto_143926 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_143920 ?auto_143921 ?auto_143916 ?auto_143917 ?auto_143912 ?auto_143913 ?auto_143915 ?auto_143914 ?auto_143918 ?auto_143919 )
      ( GET-5IMAGE-VERIFY ?auto_143912 ?auto_143913 ?auto_143915 ?auto_143914 ?auto_143916 ?auto_143917 ?auto_143918 ?auto_143919 ?auto_143920 ?auto_143921 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_144682 - DIRECTION
      ?auto_144683 - MODE
      ?auto_144685 - DIRECTION
      ?auto_144684 - MODE
      ?auto_144686 - DIRECTION
      ?auto_144687 - MODE
      ?auto_144688 - DIRECTION
      ?auto_144689 - MODE
      ?auto_144690 - DIRECTION
      ?auto_144691 - MODE
    )
    :vars
    (
      ?auto_144699 - INSTRUMENT
      ?auto_144692 - SATELLITE
      ?auto_144697 - DIRECTION
      ?auto_144693 - INSTRUMENT
      ?auto_144698 - INSTRUMENT
      ?auto_144694 - INSTRUMENT
      ?auto_144696 - INSTRUMENT
      ?auto_144695 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_144685 ?auto_144682 ) ) ( not ( = ?auto_144686 ?auto_144682 ) ) ( not ( = ?auto_144686 ?auto_144685 ) ) ( not ( = ?auto_144688 ?auto_144682 ) ) ( not ( = ?auto_144688 ?auto_144685 ) ) ( not ( = ?auto_144688 ?auto_144686 ) ) ( not ( = ?auto_144690 ?auto_144682 ) ) ( not ( = ?auto_144690 ?auto_144685 ) ) ( not ( = ?auto_144690 ?auto_144686 ) ) ( not ( = ?auto_144690 ?auto_144688 ) ) ( ON_BOARD ?auto_144699 ?auto_144692 ) ( SUPPORTS ?auto_144699 ?auto_144684 ) ( not ( = ?auto_144685 ?auto_144697 ) ) ( CALIBRATION_TARGET ?auto_144699 ?auto_144697 ) ( not ( = ?auto_144697 ?auto_144686 ) ) ( ON_BOARD ?auto_144693 ?auto_144692 ) ( not ( = ?auto_144699 ?auto_144693 ) ) ( SUPPORTS ?auto_144693 ?auto_144687 ) ( CALIBRATION_TARGET ?auto_144693 ?auto_144697 ) ( not ( = ?auto_144697 ?auto_144682 ) ) ( ON_BOARD ?auto_144698 ?auto_144692 ) ( not ( = ?auto_144693 ?auto_144698 ) ) ( SUPPORTS ?auto_144698 ?auto_144683 ) ( CALIBRATION_TARGET ?auto_144698 ?auto_144697 ) ( not ( = ?auto_144697 ?auto_144690 ) ) ( ON_BOARD ?auto_144694 ?auto_144692 ) ( not ( = ?auto_144698 ?auto_144694 ) ) ( SUPPORTS ?auto_144694 ?auto_144691 ) ( CALIBRATION_TARGET ?auto_144694 ?auto_144697 ) ( not ( = ?auto_144697 ?auto_144688 ) ) ( ON_BOARD ?auto_144696 ?auto_144692 ) ( not ( = ?auto_144694 ?auto_144696 ) ) ( SUPPORTS ?auto_144696 ?auto_144689 ) ( CALIBRATION_TARGET ?auto_144696 ?auto_144697 ) ( POWER_AVAIL ?auto_144692 ) ( POINTING ?auto_144692 ?auto_144695 ) ( not ( = ?auto_144697 ?auto_144695 ) ) ( not ( = ?auto_144688 ?auto_144695 ) ) ( not ( = ?auto_144689 ?auto_144691 ) ) ( not ( = ?auto_144690 ?auto_144695 ) ) ( not ( = ?auto_144689 ?auto_144683 ) ) ( not ( = ?auto_144691 ?auto_144683 ) ) ( not ( = ?auto_144682 ?auto_144695 ) ) ( not ( = ?auto_144698 ?auto_144696 ) ) ( not ( = ?auto_144689 ?auto_144687 ) ) ( not ( = ?auto_144691 ?auto_144687 ) ) ( not ( = ?auto_144683 ?auto_144687 ) ) ( not ( = ?auto_144686 ?auto_144695 ) ) ( not ( = ?auto_144693 ?auto_144694 ) ) ( not ( = ?auto_144693 ?auto_144696 ) ) ( not ( = ?auto_144689 ?auto_144684 ) ) ( not ( = ?auto_144691 ?auto_144684 ) ) ( not ( = ?auto_144683 ?auto_144684 ) ) ( not ( = ?auto_144687 ?auto_144684 ) ) ( not ( = ?auto_144685 ?auto_144695 ) ) ( not ( = ?auto_144699 ?auto_144698 ) ) ( not ( = ?auto_144699 ?auto_144694 ) ) ( not ( = ?auto_144699 ?auto_144696 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_144688 ?auto_144689 ?auto_144690 ?auto_144691 ?auto_144682 ?auto_144683 ?auto_144685 ?auto_144684 ?auto_144686 ?auto_144687 )
      ( GET-5IMAGE-VERIFY ?auto_144682 ?auto_144683 ?auto_144685 ?auto_144684 ?auto_144686 ?auto_144687 ?auto_144688 ?auto_144689 ?auto_144690 ?auto_144691 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_144760 - DIRECTION
      ?auto_144761 - MODE
      ?auto_144763 - DIRECTION
      ?auto_144762 - MODE
      ?auto_144764 - DIRECTION
      ?auto_144765 - MODE
      ?auto_144766 - DIRECTION
      ?auto_144767 - MODE
      ?auto_144768 - DIRECTION
      ?auto_144769 - MODE
    )
    :vars
    (
      ?auto_144777 - INSTRUMENT
      ?auto_144770 - SATELLITE
      ?auto_144775 - DIRECTION
      ?auto_144771 - INSTRUMENT
      ?auto_144776 - INSTRUMENT
      ?auto_144772 - INSTRUMENT
      ?auto_144774 - INSTRUMENT
      ?auto_144773 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_144763 ?auto_144760 ) ) ( not ( = ?auto_144764 ?auto_144760 ) ) ( not ( = ?auto_144764 ?auto_144763 ) ) ( not ( = ?auto_144766 ?auto_144760 ) ) ( not ( = ?auto_144766 ?auto_144763 ) ) ( not ( = ?auto_144766 ?auto_144764 ) ) ( not ( = ?auto_144768 ?auto_144760 ) ) ( not ( = ?auto_144768 ?auto_144763 ) ) ( not ( = ?auto_144768 ?auto_144764 ) ) ( not ( = ?auto_144768 ?auto_144766 ) ) ( ON_BOARD ?auto_144777 ?auto_144770 ) ( SUPPORTS ?auto_144777 ?auto_144762 ) ( not ( = ?auto_144763 ?auto_144775 ) ) ( CALIBRATION_TARGET ?auto_144777 ?auto_144775 ) ( not ( = ?auto_144775 ?auto_144764 ) ) ( ON_BOARD ?auto_144771 ?auto_144770 ) ( not ( = ?auto_144777 ?auto_144771 ) ) ( SUPPORTS ?auto_144771 ?auto_144765 ) ( CALIBRATION_TARGET ?auto_144771 ?auto_144775 ) ( not ( = ?auto_144775 ?auto_144760 ) ) ( ON_BOARD ?auto_144776 ?auto_144770 ) ( not ( = ?auto_144771 ?auto_144776 ) ) ( SUPPORTS ?auto_144776 ?auto_144761 ) ( CALIBRATION_TARGET ?auto_144776 ?auto_144775 ) ( not ( = ?auto_144775 ?auto_144766 ) ) ( ON_BOARD ?auto_144772 ?auto_144770 ) ( not ( = ?auto_144776 ?auto_144772 ) ) ( SUPPORTS ?auto_144772 ?auto_144767 ) ( CALIBRATION_TARGET ?auto_144772 ?auto_144775 ) ( not ( = ?auto_144775 ?auto_144768 ) ) ( ON_BOARD ?auto_144774 ?auto_144770 ) ( not ( = ?auto_144772 ?auto_144774 ) ) ( SUPPORTS ?auto_144774 ?auto_144769 ) ( CALIBRATION_TARGET ?auto_144774 ?auto_144775 ) ( POWER_AVAIL ?auto_144770 ) ( POINTING ?auto_144770 ?auto_144773 ) ( not ( = ?auto_144775 ?auto_144773 ) ) ( not ( = ?auto_144768 ?auto_144773 ) ) ( not ( = ?auto_144769 ?auto_144767 ) ) ( not ( = ?auto_144766 ?auto_144773 ) ) ( not ( = ?auto_144769 ?auto_144761 ) ) ( not ( = ?auto_144767 ?auto_144761 ) ) ( not ( = ?auto_144760 ?auto_144773 ) ) ( not ( = ?auto_144776 ?auto_144774 ) ) ( not ( = ?auto_144769 ?auto_144765 ) ) ( not ( = ?auto_144767 ?auto_144765 ) ) ( not ( = ?auto_144761 ?auto_144765 ) ) ( not ( = ?auto_144764 ?auto_144773 ) ) ( not ( = ?auto_144771 ?auto_144772 ) ) ( not ( = ?auto_144771 ?auto_144774 ) ) ( not ( = ?auto_144769 ?auto_144762 ) ) ( not ( = ?auto_144767 ?auto_144762 ) ) ( not ( = ?auto_144761 ?auto_144762 ) ) ( not ( = ?auto_144765 ?auto_144762 ) ) ( not ( = ?auto_144763 ?auto_144773 ) ) ( not ( = ?auto_144777 ?auto_144776 ) ) ( not ( = ?auto_144777 ?auto_144772 ) ) ( not ( = ?auto_144777 ?auto_144774 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_144768 ?auto_144769 ?auto_144766 ?auto_144767 ?auto_144760 ?auto_144761 ?auto_144763 ?auto_144762 ?auto_144764 ?auto_144765 )
      ( GET-5IMAGE-VERIFY ?auto_144760 ?auto_144761 ?auto_144763 ?auto_144762 ?auto_144764 ?auto_144765 ?auto_144766 ?auto_144767 ?auto_144768 ?auto_144769 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_145952 - DIRECTION
      ?auto_145953 - MODE
      ?auto_145955 - DIRECTION
      ?auto_145954 - MODE
      ?auto_145956 - DIRECTION
      ?auto_145957 - MODE
      ?auto_145958 - DIRECTION
      ?auto_145959 - MODE
      ?auto_145960 - DIRECTION
      ?auto_145961 - MODE
    )
    :vars
    (
      ?auto_145969 - INSTRUMENT
      ?auto_145962 - SATELLITE
      ?auto_145967 - DIRECTION
      ?auto_145963 - INSTRUMENT
      ?auto_145968 - INSTRUMENT
      ?auto_145964 - INSTRUMENT
      ?auto_145966 - INSTRUMENT
      ?auto_145965 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_145955 ?auto_145952 ) ) ( not ( = ?auto_145956 ?auto_145952 ) ) ( not ( = ?auto_145956 ?auto_145955 ) ) ( not ( = ?auto_145958 ?auto_145952 ) ) ( not ( = ?auto_145958 ?auto_145955 ) ) ( not ( = ?auto_145958 ?auto_145956 ) ) ( not ( = ?auto_145960 ?auto_145952 ) ) ( not ( = ?auto_145960 ?auto_145955 ) ) ( not ( = ?auto_145960 ?auto_145956 ) ) ( not ( = ?auto_145960 ?auto_145958 ) ) ( ON_BOARD ?auto_145969 ?auto_145962 ) ( SUPPORTS ?auto_145969 ?auto_145961 ) ( not ( = ?auto_145960 ?auto_145967 ) ) ( CALIBRATION_TARGET ?auto_145969 ?auto_145967 ) ( not ( = ?auto_145967 ?auto_145952 ) ) ( ON_BOARD ?auto_145963 ?auto_145962 ) ( not ( = ?auto_145969 ?auto_145963 ) ) ( SUPPORTS ?auto_145963 ?auto_145953 ) ( CALIBRATION_TARGET ?auto_145963 ?auto_145967 ) ( not ( = ?auto_145967 ?auto_145958 ) ) ( ON_BOARD ?auto_145968 ?auto_145962 ) ( not ( = ?auto_145963 ?auto_145968 ) ) ( SUPPORTS ?auto_145968 ?auto_145959 ) ( CALIBRATION_TARGET ?auto_145968 ?auto_145967 ) ( not ( = ?auto_145967 ?auto_145956 ) ) ( ON_BOARD ?auto_145964 ?auto_145962 ) ( not ( = ?auto_145968 ?auto_145964 ) ) ( SUPPORTS ?auto_145964 ?auto_145957 ) ( CALIBRATION_TARGET ?auto_145964 ?auto_145967 ) ( not ( = ?auto_145967 ?auto_145955 ) ) ( ON_BOARD ?auto_145966 ?auto_145962 ) ( not ( = ?auto_145964 ?auto_145966 ) ) ( SUPPORTS ?auto_145966 ?auto_145954 ) ( CALIBRATION_TARGET ?auto_145966 ?auto_145967 ) ( POWER_AVAIL ?auto_145962 ) ( POINTING ?auto_145962 ?auto_145965 ) ( not ( = ?auto_145967 ?auto_145965 ) ) ( not ( = ?auto_145955 ?auto_145965 ) ) ( not ( = ?auto_145954 ?auto_145957 ) ) ( not ( = ?auto_145956 ?auto_145965 ) ) ( not ( = ?auto_145954 ?auto_145959 ) ) ( not ( = ?auto_145957 ?auto_145959 ) ) ( not ( = ?auto_145958 ?auto_145965 ) ) ( not ( = ?auto_145968 ?auto_145966 ) ) ( not ( = ?auto_145954 ?auto_145953 ) ) ( not ( = ?auto_145957 ?auto_145953 ) ) ( not ( = ?auto_145959 ?auto_145953 ) ) ( not ( = ?auto_145952 ?auto_145965 ) ) ( not ( = ?auto_145963 ?auto_145964 ) ) ( not ( = ?auto_145963 ?auto_145966 ) ) ( not ( = ?auto_145954 ?auto_145961 ) ) ( not ( = ?auto_145957 ?auto_145961 ) ) ( not ( = ?auto_145959 ?auto_145961 ) ) ( not ( = ?auto_145953 ?auto_145961 ) ) ( not ( = ?auto_145960 ?auto_145965 ) ) ( not ( = ?auto_145969 ?auto_145968 ) ) ( not ( = ?auto_145969 ?auto_145964 ) ) ( not ( = ?auto_145969 ?auto_145966 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_145955 ?auto_145954 ?auto_145956 ?auto_145957 ?auto_145958 ?auto_145959 ?auto_145960 ?auto_145961 ?auto_145952 ?auto_145953 )
      ( GET-5IMAGE-VERIFY ?auto_145952 ?auto_145953 ?auto_145955 ?auto_145954 ?auto_145956 ?auto_145957 ?auto_145958 ?auto_145959 ?auto_145960 ?auto_145961 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_146030 - DIRECTION
      ?auto_146031 - MODE
      ?auto_146033 - DIRECTION
      ?auto_146032 - MODE
      ?auto_146034 - DIRECTION
      ?auto_146035 - MODE
      ?auto_146036 - DIRECTION
      ?auto_146037 - MODE
      ?auto_146038 - DIRECTION
      ?auto_146039 - MODE
    )
    :vars
    (
      ?auto_146047 - INSTRUMENT
      ?auto_146040 - SATELLITE
      ?auto_146045 - DIRECTION
      ?auto_146041 - INSTRUMENT
      ?auto_146046 - INSTRUMENT
      ?auto_146042 - INSTRUMENT
      ?auto_146044 - INSTRUMENT
      ?auto_146043 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_146033 ?auto_146030 ) ) ( not ( = ?auto_146034 ?auto_146030 ) ) ( not ( = ?auto_146034 ?auto_146033 ) ) ( not ( = ?auto_146036 ?auto_146030 ) ) ( not ( = ?auto_146036 ?auto_146033 ) ) ( not ( = ?auto_146036 ?auto_146034 ) ) ( not ( = ?auto_146038 ?auto_146030 ) ) ( not ( = ?auto_146038 ?auto_146033 ) ) ( not ( = ?auto_146038 ?auto_146034 ) ) ( not ( = ?auto_146038 ?auto_146036 ) ) ( ON_BOARD ?auto_146047 ?auto_146040 ) ( SUPPORTS ?auto_146047 ?auto_146037 ) ( not ( = ?auto_146036 ?auto_146045 ) ) ( CALIBRATION_TARGET ?auto_146047 ?auto_146045 ) ( not ( = ?auto_146045 ?auto_146030 ) ) ( ON_BOARD ?auto_146041 ?auto_146040 ) ( not ( = ?auto_146047 ?auto_146041 ) ) ( SUPPORTS ?auto_146041 ?auto_146031 ) ( CALIBRATION_TARGET ?auto_146041 ?auto_146045 ) ( not ( = ?auto_146045 ?auto_146038 ) ) ( ON_BOARD ?auto_146046 ?auto_146040 ) ( not ( = ?auto_146041 ?auto_146046 ) ) ( SUPPORTS ?auto_146046 ?auto_146039 ) ( CALIBRATION_TARGET ?auto_146046 ?auto_146045 ) ( not ( = ?auto_146045 ?auto_146034 ) ) ( ON_BOARD ?auto_146042 ?auto_146040 ) ( not ( = ?auto_146046 ?auto_146042 ) ) ( SUPPORTS ?auto_146042 ?auto_146035 ) ( CALIBRATION_TARGET ?auto_146042 ?auto_146045 ) ( not ( = ?auto_146045 ?auto_146033 ) ) ( ON_BOARD ?auto_146044 ?auto_146040 ) ( not ( = ?auto_146042 ?auto_146044 ) ) ( SUPPORTS ?auto_146044 ?auto_146032 ) ( CALIBRATION_TARGET ?auto_146044 ?auto_146045 ) ( POWER_AVAIL ?auto_146040 ) ( POINTING ?auto_146040 ?auto_146043 ) ( not ( = ?auto_146045 ?auto_146043 ) ) ( not ( = ?auto_146033 ?auto_146043 ) ) ( not ( = ?auto_146032 ?auto_146035 ) ) ( not ( = ?auto_146034 ?auto_146043 ) ) ( not ( = ?auto_146032 ?auto_146039 ) ) ( not ( = ?auto_146035 ?auto_146039 ) ) ( not ( = ?auto_146038 ?auto_146043 ) ) ( not ( = ?auto_146046 ?auto_146044 ) ) ( not ( = ?auto_146032 ?auto_146031 ) ) ( not ( = ?auto_146035 ?auto_146031 ) ) ( not ( = ?auto_146039 ?auto_146031 ) ) ( not ( = ?auto_146030 ?auto_146043 ) ) ( not ( = ?auto_146041 ?auto_146042 ) ) ( not ( = ?auto_146041 ?auto_146044 ) ) ( not ( = ?auto_146032 ?auto_146037 ) ) ( not ( = ?auto_146035 ?auto_146037 ) ) ( not ( = ?auto_146039 ?auto_146037 ) ) ( not ( = ?auto_146031 ?auto_146037 ) ) ( not ( = ?auto_146036 ?auto_146043 ) ) ( not ( = ?auto_146047 ?auto_146046 ) ) ( not ( = ?auto_146047 ?auto_146042 ) ) ( not ( = ?auto_146047 ?auto_146044 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_146033 ?auto_146032 ?auto_146034 ?auto_146035 ?auto_146038 ?auto_146039 ?auto_146036 ?auto_146037 ?auto_146030 ?auto_146031 )
      ( GET-5IMAGE-VERIFY ?auto_146030 ?auto_146031 ?auto_146033 ?auto_146032 ?auto_146034 ?auto_146035 ?auto_146036 ?auto_146037 ?auto_146038 ?auto_146039 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_146108 - DIRECTION
      ?auto_146109 - MODE
      ?auto_146111 - DIRECTION
      ?auto_146110 - MODE
      ?auto_146112 - DIRECTION
      ?auto_146113 - MODE
      ?auto_146114 - DIRECTION
      ?auto_146115 - MODE
      ?auto_146116 - DIRECTION
      ?auto_146117 - MODE
    )
    :vars
    (
      ?auto_146125 - INSTRUMENT
      ?auto_146118 - SATELLITE
      ?auto_146123 - DIRECTION
      ?auto_146119 - INSTRUMENT
      ?auto_146124 - INSTRUMENT
      ?auto_146120 - INSTRUMENT
      ?auto_146122 - INSTRUMENT
      ?auto_146121 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_146111 ?auto_146108 ) ) ( not ( = ?auto_146112 ?auto_146108 ) ) ( not ( = ?auto_146112 ?auto_146111 ) ) ( not ( = ?auto_146114 ?auto_146108 ) ) ( not ( = ?auto_146114 ?auto_146111 ) ) ( not ( = ?auto_146114 ?auto_146112 ) ) ( not ( = ?auto_146116 ?auto_146108 ) ) ( not ( = ?auto_146116 ?auto_146111 ) ) ( not ( = ?auto_146116 ?auto_146112 ) ) ( not ( = ?auto_146116 ?auto_146114 ) ) ( ON_BOARD ?auto_146125 ?auto_146118 ) ( SUPPORTS ?auto_146125 ?auto_146117 ) ( not ( = ?auto_146116 ?auto_146123 ) ) ( CALIBRATION_TARGET ?auto_146125 ?auto_146123 ) ( not ( = ?auto_146123 ?auto_146108 ) ) ( ON_BOARD ?auto_146119 ?auto_146118 ) ( not ( = ?auto_146125 ?auto_146119 ) ) ( SUPPORTS ?auto_146119 ?auto_146109 ) ( CALIBRATION_TARGET ?auto_146119 ?auto_146123 ) ( not ( = ?auto_146123 ?auto_146112 ) ) ( ON_BOARD ?auto_146124 ?auto_146118 ) ( not ( = ?auto_146119 ?auto_146124 ) ) ( SUPPORTS ?auto_146124 ?auto_146113 ) ( CALIBRATION_TARGET ?auto_146124 ?auto_146123 ) ( not ( = ?auto_146123 ?auto_146114 ) ) ( ON_BOARD ?auto_146120 ?auto_146118 ) ( not ( = ?auto_146124 ?auto_146120 ) ) ( SUPPORTS ?auto_146120 ?auto_146115 ) ( CALIBRATION_TARGET ?auto_146120 ?auto_146123 ) ( not ( = ?auto_146123 ?auto_146111 ) ) ( ON_BOARD ?auto_146122 ?auto_146118 ) ( not ( = ?auto_146120 ?auto_146122 ) ) ( SUPPORTS ?auto_146122 ?auto_146110 ) ( CALIBRATION_TARGET ?auto_146122 ?auto_146123 ) ( POWER_AVAIL ?auto_146118 ) ( POINTING ?auto_146118 ?auto_146121 ) ( not ( = ?auto_146123 ?auto_146121 ) ) ( not ( = ?auto_146111 ?auto_146121 ) ) ( not ( = ?auto_146110 ?auto_146115 ) ) ( not ( = ?auto_146114 ?auto_146121 ) ) ( not ( = ?auto_146110 ?auto_146113 ) ) ( not ( = ?auto_146115 ?auto_146113 ) ) ( not ( = ?auto_146112 ?auto_146121 ) ) ( not ( = ?auto_146124 ?auto_146122 ) ) ( not ( = ?auto_146110 ?auto_146109 ) ) ( not ( = ?auto_146115 ?auto_146109 ) ) ( not ( = ?auto_146113 ?auto_146109 ) ) ( not ( = ?auto_146108 ?auto_146121 ) ) ( not ( = ?auto_146119 ?auto_146120 ) ) ( not ( = ?auto_146119 ?auto_146122 ) ) ( not ( = ?auto_146110 ?auto_146117 ) ) ( not ( = ?auto_146115 ?auto_146117 ) ) ( not ( = ?auto_146113 ?auto_146117 ) ) ( not ( = ?auto_146109 ?auto_146117 ) ) ( not ( = ?auto_146116 ?auto_146121 ) ) ( not ( = ?auto_146125 ?auto_146124 ) ) ( not ( = ?auto_146125 ?auto_146120 ) ) ( not ( = ?auto_146125 ?auto_146122 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_146111 ?auto_146110 ?auto_146114 ?auto_146115 ?auto_146112 ?auto_146113 ?auto_146116 ?auto_146117 ?auto_146108 ?auto_146109 )
      ( GET-5IMAGE-VERIFY ?auto_146108 ?auto_146109 ?auto_146111 ?auto_146110 ?auto_146112 ?auto_146113 ?auto_146114 ?auto_146115 ?auto_146116 ?auto_146117 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_146186 - DIRECTION
      ?auto_146187 - MODE
      ?auto_146189 - DIRECTION
      ?auto_146188 - MODE
      ?auto_146190 - DIRECTION
      ?auto_146191 - MODE
      ?auto_146192 - DIRECTION
      ?auto_146193 - MODE
      ?auto_146194 - DIRECTION
      ?auto_146195 - MODE
    )
    :vars
    (
      ?auto_146203 - INSTRUMENT
      ?auto_146196 - SATELLITE
      ?auto_146201 - DIRECTION
      ?auto_146197 - INSTRUMENT
      ?auto_146202 - INSTRUMENT
      ?auto_146198 - INSTRUMENT
      ?auto_146200 - INSTRUMENT
      ?auto_146199 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_146189 ?auto_146186 ) ) ( not ( = ?auto_146190 ?auto_146186 ) ) ( not ( = ?auto_146190 ?auto_146189 ) ) ( not ( = ?auto_146192 ?auto_146186 ) ) ( not ( = ?auto_146192 ?auto_146189 ) ) ( not ( = ?auto_146192 ?auto_146190 ) ) ( not ( = ?auto_146194 ?auto_146186 ) ) ( not ( = ?auto_146194 ?auto_146189 ) ) ( not ( = ?auto_146194 ?auto_146190 ) ) ( not ( = ?auto_146194 ?auto_146192 ) ) ( ON_BOARD ?auto_146203 ?auto_146196 ) ( SUPPORTS ?auto_146203 ?auto_146193 ) ( not ( = ?auto_146192 ?auto_146201 ) ) ( CALIBRATION_TARGET ?auto_146203 ?auto_146201 ) ( not ( = ?auto_146201 ?auto_146186 ) ) ( ON_BOARD ?auto_146197 ?auto_146196 ) ( not ( = ?auto_146203 ?auto_146197 ) ) ( SUPPORTS ?auto_146197 ?auto_146187 ) ( CALIBRATION_TARGET ?auto_146197 ?auto_146201 ) ( not ( = ?auto_146201 ?auto_146190 ) ) ( ON_BOARD ?auto_146202 ?auto_146196 ) ( not ( = ?auto_146197 ?auto_146202 ) ) ( SUPPORTS ?auto_146202 ?auto_146191 ) ( CALIBRATION_TARGET ?auto_146202 ?auto_146201 ) ( not ( = ?auto_146201 ?auto_146194 ) ) ( ON_BOARD ?auto_146198 ?auto_146196 ) ( not ( = ?auto_146202 ?auto_146198 ) ) ( SUPPORTS ?auto_146198 ?auto_146195 ) ( CALIBRATION_TARGET ?auto_146198 ?auto_146201 ) ( not ( = ?auto_146201 ?auto_146189 ) ) ( ON_BOARD ?auto_146200 ?auto_146196 ) ( not ( = ?auto_146198 ?auto_146200 ) ) ( SUPPORTS ?auto_146200 ?auto_146188 ) ( CALIBRATION_TARGET ?auto_146200 ?auto_146201 ) ( POWER_AVAIL ?auto_146196 ) ( POINTING ?auto_146196 ?auto_146199 ) ( not ( = ?auto_146201 ?auto_146199 ) ) ( not ( = ?auto_146189 ?auto_146199 ) ) ( not ( = ?auto_146188 ?auto_146195 ) ) ( not ( = ?auto_146194 ?auto_146199 ) ) ( not ( = ?auto_146188 ?auto_146191 ) ) ( not ( = ?auto_146195 ?auto_146191 ) ) ( not ( = ?auto_146190 ?auto_146199 ) ) ( not ( = ?auto_146202 ?auto_146200 ) ) ( not ( = ?auto_146188 ?auto_146187 ) ) ( not ( = ?auto_146195 ?auto_146187 ) ) ( not ( = ?auto_146191 ?auto_146187 ) ) ( not ( = ?auto_146186 ?auto_146199 ) ) ( not ( = ?auto_146197 ?auto_146198 ) ) ( not ( = ?auto_146197 ?auto_146200 ) ) ( not ( = ?auto_146188 ?auto_146193 ) ) ( not ( = ?auto_146195 ?auto_146193 ) ) ( not ( = ?auto_146191 ?auto_146193 ) ) ( not ( = ?auto_146187 ?auto_146193 ) ) ( not ( = ?auto_146192 ?auto_146199 ) ) ( not ( = ?auto_146203 ?auto_146202 ) ) ( not ( = ?auto_146203 ?auto_146198 ) ) ( not ( = ?auto_146203 ?auto_146200 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_146189 ?auto_146188 ?auto_146194 ?auto_146195 ?auto_146190 ?auto_146191 ?auto_146192 ?auto_146193 ?auto_146186 ?auto_146187 )
      ( GET-5IMAGE-VERIFY ?auto_146186 ?auto_146187 ?auto_146189 ?auto_146188 ?auto_146190 ?auto_146191 ?auto_146192 ?auto_146193 ?auto_146194 ?auto_146195 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_146600 - DIRECTION
      ?auto_146601 - MODE
      ?auto_146603 - DIRECTION
      ?auto_146602 - MODE
      ?auto_146604 - DIRECTION
      ?auto_146605 - MODE
      ?auto_146606 - DIRECTION
      ?auto_146607 - MODE
      ?auto_146608 - DIRECTION
      ?auto_146609 - MODE
    )
    :vars
    (
      ?auto_146617 - INSTRUMENT
      ?auto_146610 - SATELLITE
      ?auto_146615 - DIRECTION
      ?auto_146611 - INSTRUMENT
      ?auto_146616 - INSTRUMENT
      ?auto_146612 - INSTRUMENT
      ?auto_146614 - INSTRUMENT
      ?auto_146613 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_146603 ?auto_146600 ) ) ( not ( = ?auto_146604 ?auto_146600 ) ) ( not ( = ?auto_146604 ?auto_146603 ) ) ( not ( = ?auto_146606 ?auto_146600 ) ) ( not ( = ?auto_146606 ?auto_146603 ) ) ( not ( = ?auto_146606 ?auto_146604 ) ) ( not ( = ?auto_146608 ?auto_146600 ) ) ( not ( = ?auto_146608 ?auto_146603 ) ) ( not ( = ?auto_146608 ?auto_146604 ) ) ( not ( = ?auto_146608 ?auto_146606 ) ) ( ON_BOARD ?auto_146617 ?auto_146610 ) ( SUPPORTS ?auto_146617 ?auto_146605 ) ( not ( = ?auto_146604 ?auto_146615 ) ) ( CALIBRATION_TARGET ?auto_146617 ?auto_146615 ) ( not ( = ?auto_146615 ?auto_146600 ) ) ( ON_BOARD ?auto_146611 ?auto_146610 ) ( not ( = ?auto_146617 ?auto_146611 ) ) ( SUPPORTS ?auto_146611 ?auto_146601 ) ( CALIBRATION_TARGET ?auto_146611 ?auto_146615 ) ( not ( = ?auto_146615 ?auto_146608 ) ) ( ON_BOARD ?auto_146616 ?auto_146610 ) ( not ( = ?auto_146611 ?auto_146616 ) ) ( SUPPORTS ?auto_146616 ?auto_146609 ) ( CALIBRATION_TARGET ?auto_146616 ?auto_146615 ) ( not ( = ?auto_146615 ?auto_146606 ) ) ( ON_BOARD ?auto_146612 ?auto_146610 ) ( not ( = ?auto_146616 ?auto_146612 ) ) ( SUPPORTS ?auto_146612 ?auto_146607 ) ( CALIBRATION_TARGET ?auto_146612 ?auto_146615 ) ( not ( = ?auto_146615 ?auto_146603 ) ) ( ON_BOARD ?auto_146614 ?auto_146610 ) ( not ( = ?auto_146612 ?auto_146614 ) ) ( SUPPORTS ?auto_146614 ?auto_146602 ) ( CALIBRATION_TARGET ?auto_146614 ?auto_146615 ) ( POWER_AVAIL ?auto_146610 ) ( POINTING ?auto_146610 ?auto_146613 ) ( not ( = ?auto_146615 ?auto_146613 ) ) ( not ( = ?auto_146603 ?auto_146613 ) ) ( not ( = ?auto_146602 ?auto_146607 ) ) ( not ( = ?auto_146606 ?auto_146613 ) ) ( not ( = ?auto_146602 ?auto_146609 ) ) ( not ( = ?auto_146607 ?auto_146609 ) ) ( not ( = ?auto_146608 ?auto_146613 ) ) ( not ( = ?auto_146616 ?auto_146614 ) ) ( not ( = ?auto_146602 ?auto_146601 ) ) ( not ( = ?auto_146607 ?auto_146601 ) ) ( not ( = ?auto_146609 ?auto_146601 ) ) ( not ( = ?auto_146600 ?auto_146613 ) ) ( not ( = ?auto_146611 ?auto_146612 ) ) ( not ( = ?auto_146611 ?auto_146614 ) ) ( not ( = ?auto_146602 ?auto_146605 ) ) ( not ( = ?auto_146607 ?auto_146605 ) ) ( not ( = ?auto_146609 ?auto_146605 ) ) ( not ( = ?auto_146601 ?auto_146605 ) ) ( not ( = ?auto_146604 ?auto_146613 ) ) ( not ( = ?auto_146617 ?auto_146616 ) ) ( not ( = ?auto_146617 ?auto_146612 ) ) ( not ( = ?auto_146617 ?auto_146614 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_146603 ?auto_146602 ?auto_146606 ?auto_146607 ?auto_146608 ?auto_146609 ?auto_146604 ?auto_146605 ?auto_146600 ?auto_146601 )
      ( GET-5IMAGE-VERIFY ?auto_146600 ?auto_146601 ?auto_146603 ?auto_146602 ?auto_146604 ?auto_146605 ?auto_146606 ?auto_146607 ?auto_146608 ?auto_146609 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_146678 - DIRECTION
      ?auto_146679 - MODE
      ?auto_146681 - DIRECTION
      ?auto_146680 - MODE
      ?auto_146682 - DIRECTION
      ?auto_146683 - MODE
      ?auto_146684 - DIRECTION
      ?auto_146685 - MODE
      ?auto_146686 - DIRECTION
      ?auto_146687 - MODE
    )
    :vars
    (
      ?auto_146695 - INSTRUMENT
      ?auto_146688 - SATELLITE
      ?auto_146693 - DIRECTION
      ?auto_146689 - INSTRUMENT
      ?auto_146694 - INSTRUMENT
      ?auto_146690 - INSTRUMENT
      ?auto_146692 - INSTRUMENT
      ?auto_146691 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_146681 ?auto_146678 ) ) ( not ( = ?auto_146682 ?auto_146678 ) ) ( not ( = ?auto_146682 ?auto_146681 ) ) ( not ( = ?auto_146684 ?auto_146678 ) ) ( not ( = ?auto_146684 ?auto_146681 ) ) ( not ( = ?auto_146684 ?auto_146682 ) ) ( not ( = ?auto_146686 ?auto_146678 ) ) ( not ( = ?auto_146686 ?auto_146681 ) ) ( not ( = ?auto_146686 ?auto_146682 ) ) ( not ( = ?auto_146686 ?auto_146684 ) ) ( ON_BOARD ?auto_146695 ?auto_146688 ) ( SUPPORTS ?auto_146695 ?auto_146683 ) ( not ( = ?auto_146682 ?auto_146693 ) ) ( CALIBRATION_TARGET ?auto_146695 ?auto_146693 ) ( not ( = ?auto_146693 ?auto_146678 ) ) ( ON_BOARD ?auto_146689 ?auto_146688 ) ( not ( = ?auto_146695 ?auto_146689 ) ) ( SUPPORTS ?auto_146689 ?auto_146679 ) ( CALIBRATION_TARGET ?auto_146689 ?auto_146693 ) ( not ( = ?auto_146693 ?auto_146684 ) ) ( ON_BOARD ?auto_146694 ?auto_146688 ) ( not ( = ?auto_146689 ?auto_146694 ) ) ( SUPPORTS ?auto_146694 ?auto_146685 ) ( CALIBRATION_TARGET ?auto_146694 ?auto_146693 ) ( not ( = ?auto_146693 ?auto_146686 ) ) ( ON_BOARD ?auto_146690 ?auto_146688 ) ( not ( = ?auto_146694 ?auto_146690 ) ) ( SUPPORTS ?auto_146690 ?auto_146687 ) ( CALIBRATION_TARGET ?auto_146690 ?auto_146693 ) ( not ( = ?auto_146693 ?auto_146681 ) ) ( ON_BOARD ?auto_146692 ?auto_146688 ) ( not ( = ?auto_146690 ?auto_146692 ) ) ( SUPPORTS ?auto_146692 ?auto_146680 ) ( CALIBRATION_TARGET ?auto_146692 ?auto_146693 ) ( POWER_AVAIL ?auto_146688 ) ( POINTING ?auto_146688 ?auto_146691 ) ( not ( = ?auto_146693 ?auto_146691 ) ) ( not ( = ?auto_146681 ?auto_146691 ) ) ( not ( = ?auto_146680 ?auto_146687 ) ) ( not ( = ?auto_146686 ?auto_146691 ) ) ( not ( = ?auto_146680 ?auto_146685 ) ) ( not ( = ?auto_146687 ?auto_146685 ) ) ( not ( = ?auto_146684 ?auto_146691 ) ) ( not ( = ?auto_146694 ?auto_146692 ) ) ( not ( = ?auto_146680 ?auto_146679 ) ) ( not ( = ?auto_146687 ?auto_146679 ) ) ( not ( = ?auto_146685 ?auto_146679 ) ) ( not ( = ?auto_146678 ?auto_146691 ) ) ( not ( = ?auto_146689 ?auto_146690 ) ) ( not ( = ?auto_146689 ?auto_146692 ) ) ( not ( = ?auto_146680 ?auto_146683 ) ) ( not ( = ?auto_146687 ?auto_146683 ) ) ( not ( = ?auto_146685 ?auto_146683 ) ) ( not ( = ?auto_146679 ?auto_146683 ) ) ( not ( = ?auto_146682 ?auto_146691 ) ) ( not ( = ?auto_146695 ?auto_146694 ) ) ( not ( = ?auto_146695 ?auto_146690 ) ) ( not ( = ?auto_146695 ?auto_146692 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_146681 ?auto_146680 ?auto_146686 ?auto_146687 ?auto_146684 ?auto_146685 ?auto_146682 ?auto_146683 ?auto_146678 ?auto_146679 )
      ( GET-5IMAGE-VERIFY ?auto_146678 ?auto_146679 ?auto_146681 ?auto_146680 ?auto_146682 ?auto_146683 ?auto_146684 ?auto_146685 ?auto_146686 ?auto_146687 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_147008 - DIRECTION
      ?auto_147009 - MODE
      ?auto_147011 - DIRECTION
      ?auto_147010 - MODE
      ?auto_147012 - DIRECTION
      ?auto_147013 - MODE
      ?auto_147014 - DIRECTION
      ?auto_147015 - MODE
      ?auto_147016 - DIRECTION
      ?auto_147017 - MODE
    )
    :vars
    (
      ?auto_147025 - INSTRUMENT
      ?auto_147018 - SATELLITE
      ?auto_147023 - DIRECTION
      ?auto_147019 - INSTRUMENT
      ?auto_147024 - INSTRUMENT
      ?auto_147020 - INSTRUMENT
      ?auto_147022 - INSTRUMENT
      ?auto_147021 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_147011 ?auto_147008 ) ) ( not ( = ?auto_147012 ?auto_147008 ) ) ( not ( = ?auto_147012 ?auto_147011 ) ) ( not ( = ?auto_147014 ?auto_147008 ) ) ( not ( = ?auto_147014 ?auto_147011 ) ) ( not ( = ?auto_147014 ?auto_147012 ) ) ( not ( = ?auto_147016 ?auto_147008 ) ) ( not ( = ?auto_147016 ?auto_147011 ) ) ( not ( = ?auto_147016 ?auto_147012 ) ) ( not ( = ?auto_147016 ?auto_147014 ) ) ( ON_BOARD ?auto_147025 ?auto_147018 ) ( SUPPORTS ?auto_147025 ?auto_147017 ) ( not ( = ?auto_147016 ?auto_147023 ) ) ( CALIBRATION_TARGET ?auto_147025 ?auto_147023 ) ( not ( = ?auto_147023 ?auto_147008 ) ) ( ON_BOARD ?auto_147019 ?auto_147018 ) ( not ( = ?auto_147025 ?auto_147019 ) ) ( SUPPORTS ?auto_147019 ?auto_147009 ) ( CALIBRATION_TARGET ?auto_147019 ?auto_147023 ) ( not ( = ?auto_147023 ?auto_147014 ) ) ( ON_BOARD ?auto_147024 ?auto_147018 ) ( not ( = ?auto_147019 ?auto_147024 ) ) ( SUPPORTS ?auto_147024 ?auto_147015 ) ( CALIBRATION_TARGET ?auto_147024 ?auto_147023 ) ( not ( = ?auto_147023 ?auto_147011 ) ) ( ON_BOARD ?auto_147020 ?auto_147018 ) ( not ( = ?auto_147024 ?auto_147020 ) ) ( SUPPORTS ?auto_147020 ?auto_147010 ) ( CALIBRATION_TARGET ?auto_147020 ?auto_147023 ) ( not ( = ?auto_147023 ?auto_147012 ) ) ( ON_BOARD ?auto_147022 ?auto_147018 ) ( not ( = ?auto_147020 ?auto_147022 ) ) ( SUPPORTS ?auto_147022 ?auto_147013 ) ( CALIBRATION_TARGET ?auto_147022 ?auto_147023 ) ( POWER_AVAIL ?auto_147018 ) ( POINTING ?auto_147018 ?auto_147021 ) ( not ( = ?auto_147023 ?auto_147021 ) ) ( not ( = ?auto_147012 ?auto_147021 ) ) ( not ( = ?auto_147013 ?auto_147010 ) ) ( not ( = ?auto_147011 ?auto_147021 ) ) ( not ( = ?auto_147013 ?auto_147015 ) ) ( not ( = ?auto_147010 ?auto_147015 ) ) ( not ( = ?auto_147014 ?auto_147021 ) ) ( not ( = ?auto_147024 ?auto_147022 ) ) ( not ( = ?auto_147013 ?auto_147009 ) ) ( not ( = ?auto_147010 ?auto_147009 ) ) ( not ( = ?auto_147015 ?auto_147009 ) ) ( not ( = ?auto_147008 ?auto_147021 ) ) ( not ( = ?auto_147019 ?auto_147020 ) ) ( not ( = ?auto_147019 ?auto_147022 ) ) ( not ( = ?auto_147013 ?auto_147017 ) ) ( not ( = ?auto_147010 ?auto_147017 ) ) ( not ( = ?auto_147015 ?auto_147017 ) ) ( not ( = ?auto_147009 ?auto_147017 ) ) ( not ( = ?auto_147016 ?auto_147021 ) ) ( not ( = ?auto_147025 ?auto_147024 ) ) ( not ( = ?auto_147025 ?auto_147020 ) ) ( not ( = ?auto_147025 ?auto_147022 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_147012 ?auto_147013 ?auto_147011 ?auto_147010 ?auto_147014 ?auto_147015 ?auto_147016 ?auto_147017 ?auto_147008 ?auto_147009 )
      ( GET-5IMAGE-VERIFY ?auto_147008 ?auto_147009 ?auto_147011 ?auto_147010 ?auto_147012 ?auto_147013 ?auto_147014 ?auto_147015 ?auto_147016 ?auto_147017 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_147086 - DIRECTION
      ?auto_147087 - MODE
      ?auto_147089 - DIRECTION
      ?auto_147088 - MODE
      ?auto_147090 - DIRECTION
      ?auto_147091 - MODE
      ?auto_147092 - DIRECTION
      ?auto_147093 - MODE
      ?auto_147094 - DIRECTION
      ?auto_147095 - MODE
    )
    :vars
    (
      ?auto_147103 - INSTRUMENT
      ?auto_147096 - SATELLITE
      ?auto_147101 - DIRECTION
      ?auto_147097 - INSTRUMENT
      ?auto_147102 - INSTRUMENT
      ?auto_147098 - INSTRUMENT
      ?auto_147100 - INSTRUMENT
      ?auto_147099 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_147089 ?auto_147086 ) ) ( not ( = ?auto_147090 ?auto_147086 ) ) ( not ( = ?auto_147090 ?auto_147089 ) ) ( not ( = ?auto_147092 ?auto_147086 ) ) ( not ( = ?auto_147092 ?auto_147089 ) ) ( not ( = ?auto_147092 ?auto_147090 ) ) ( not ( = ?auto_147094 ?auto_147086 ) ) ( not ( = ?auto_147094 ?auto_147089 ) ) ( not ( = ?auto_147094 ?auto_147090 ) ) ( not ( = ?auto_147094 ?auto_147092 ) ) ( ON_BOARD ?auto_147103 ?auto_147096 ) ( SUPPORTS ?auto_147103 ?auto_147093 ) ( not ( = ?auto_147092 ?auto_147101 ) ) ( CALIBRATION_TARGET ?auto_147103 ?auto_147101 ) ( not ( = ?auto_147101 ?auto_147086 ) ) ( ON_BOARD ?auto_147097 ?auto_147096 ) ( not ( = ?auto_147103 ?auto_147097 ) ) ( SUPPORTS ?auto_147097 ?auto_147087 ) ( CALIBRATION_TARGET ?auto_147097 ?auto_147101 ) ( not ( = ?auto_147101 ?auto_147094 ) ) ( ON_BOARD ?auto_147102 ?auto_147096 ) ( not ( = ?auto_147097 ?auto_147102 ) ) ( SUPPORTS ?auto_147102 ?auto_147095 ) ( CALIBRATION_TARGET ?auto_147102 ?auto_147101 ) ( not ( = ?auto_147101 ?auto_147089 ) ) ( ON_BOARD ?auto_147098 ?auto_147096 ) ( not ( = ?auto_147102 ?auto_147098 ) ) ( SUPPORTS ?auto_147098 ?auto_147088 ) ( CALIBRATION_TARGET ?auto_147098 ?auto_147101 ) ( not ( = ?auto_147101 ?auto_147090 ) ) ( ON_BOARD ?auto_147100 ?auto_147096 ) ( not ( = ?auto_147098 ?auto_147100 ) ) ( SUPPORTS ?auto_147100 ?auto_147091 ) ( CALIBRATION_TARGET ?auto_147100 ?auto_147101 ) ( POWER_AVAIL ?auto_147096 ) ( POINTING ?auto_147096 ?auto_147099 ) ( not ( = ?auto_147101 ?auto_147099 ) ) ( not ( = ?auto_147090 ?auto_147099 ) ) ( not ( = ?auto_147091 ?auto_147088 ) ) ( not ( = ?auto_147089 ?auto_147099 ) ) ( not ( = ?auto_147091 ?auto_147095 ) ) ( not ( = ?auto_147088 ?auto_147095 ) ) ( not ( = ?auto_147094 ?auto_147099 ) ) ( not ( = ?auto_147102 ?auto_147100 ) ) ( not ( = ?auto_147091 ?auto_147087 ) ) ( not ( = ?auto_147088 ?auto_147087 ) ) ( not ( = ?auto_147095 ?auto_147087 ) ) ( not ( = ?auto_147086 ?auto_147099 ) ) ( not ( = ?auto_147097 ?auto_147098 ) ) ( not ( = ?auto_147097 ?auto_147100 ) ) ( not ( = ?auto_147091 ?auto_147093 ) ) ( not ( = ?auto_147088 ?auto_147093 ) ) ( not ( = ?auto_147095 ?auto_147093 ) ) ( not ( = ?auto_147087 ?auto_147093 ) ) ( not ( = ?auto_147092 ?auto_147099 ) ) ( not ( = ?auto_147103 ?auto_147102 ) ) ( not ( = ?auto_147103 ?auto_147098 ) ) ( not ( = ?auto_147103 ?auto_147100 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_147090 ?auto_147091 ?auto_147089 ?auto_147088 ?auto_147094 ?auto_147095 ?auto_147092 ?auto_147093 ?auto_147086 ?auto_147087 )
      ( GET-5IMAGE-VERIFY ?auto_147086 ?auto_147087 ?auto_147089 ?auto_147088 ?auto_147090 ?auto_147091 ?auto_147092 ?auto_147093 ?auto_147094 ?auto_147095 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_147334 - DIRECTION
      ?auto_147335 - MODE
      ?auto_147337 - DIRECTION
      ?auto_147336 - MODE
      ?auto_147338 - DIRECTION
      ?auto_147339 - MODE
      ?auto_147340 - DIRECTION
      ?auto_147341 - MODE
      ?auto_147342 - DIRECTION
      ?auto_147343 - MODE
    )
    :vars
    (
      ?auto_147351 - INSTRUMENT
      ?auto_147344 - SATELLITE
      ?auto_147349 - DIRECTION
      ?auto_147345 - INSTRUMENT
      ?auto_147350 - INSTRUMENT
      ?auto_147346 - INSTRUMENT
      ?auto_147348 - INSTRUMENT
      ?auto_147347 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_147337 ?auto_147334 ) ) ( not ( = ?auto_147338 ?auto_147334 ) ) ( not ( = ?auto_147338 ?auto_147337 ) ) ( not ( = ?auto_147340 ?auto_147334 ) ) ( not ( = ?auto_147340 ?auto_147337 ) ) ( not ( = ?auto_147340 ?auto_147338 ) ) ( not ( = ?auto_147342 ?auto_147334 ) ) ( not ( = ?auto_147342 ?auto_147337 ) ) ( not ( = ?auto_147342 ?auto_147338 ) ) ( not ( = ?auto_147342 ?auto_147340 ) ) ( ON_BOARD ?auto_147351 ?auto_147344 ) ( SUPPORTS ?auto_147351 ?auto_147343 ) ( not ( = ?auto_147342 ?auto_147349 ) ) ( CALIBRATION_TARGET ?auto_147351 ?auto_147349 ) ( not ( = ?auto_147349 ?auto_147334 ) ) ( ON_BOARD ?auto_147345 ?auto_147344 ) ( not ( = ?auto_147351 ?auto_147345 ) ) ( SUPPORTS ?auto_147345 ?auto_147335 ) ( CALIBRATION_TARGET ?auto_147345 ?auto_147349 ) ( not ( = ?auto_147349 ?auto_147338 ) ) ( ON_BOARD ?auto_147350 ?auto_147344 ) ( not ( = ?auto_147345 ?auto_147350 ) ) ( SUPPORTS ?auto_147350 ?auto_147339 ) ( CALIBRATION_TARGET ?auto_147350 ?auto_147349 ) ( not ( = ?auto_147349 ?auto_147337 ) ) ( ON_BOARD ?auto_147346 ?auto_147344 ) ( not ( = ?auto_147350 ?auto_147346 ) ) ( SUPPORTS ?auto_147346 ?auto_147336 ) ( CALIBRATION_TARGET ?auto_147346 ?auto_147349 ) ( not ( = ?auto_147349 ?auto_147340 ) ) ( ON_BOARD ?auto_147348 ?auto_147344 ) ( not ( = ?auto_147346 ?auto_147348 ) ) ( SUPPORTS ?auto_147348 ?auto_147341 ) ( CALIBRATION_TARGET ?auto_147348 ?auto_147349 ) ( POWER_AVAIL ?auto_147344 ) ( POINTING ?auto_147344 ?auto_147347 ) ( not ( = ?auto_147349 ?auto_147347 ) ) ( not ( = ?auto_147340 ?auto_147347 ) ) ( not ( = ?auto_147341 ?auto_147336 ) ) ( not ( = ?auto_147337 ?auto_147347 ) ) ( not ( = ?auto_147341 ?auto_147339 ) ) ( not ( = ?auto_147336 ?auto_147339 ) ) ( not ( = ?auto_147338 ?auto_147347 ) ) ( not ( = ?auto_147350 ?auto_147348 ) ) ( not ( = ?auto_147341 ?auto_147335 ) ) ( not ( = ?auto_147336 ?auto_147335 ) ) ( not ( = ?auto_147339 ?auto_147335 ) ) ( not ( = ?auto_147334 ?auto_147347 ) ) ( not ( = ?auto_147345 ?auto_147346 ) ) ( not ( = ?auto_147345 ?auto_147348 ) ) ( not ( = ?auto_147341 ?auto_147343 ) ) ( not ( = ?auto_147336 ?auto_147343 ) ) ( not ( = ?auto_147339 ?auto_147343 ) ) ( not ( = ?auto_147335 ?auto_147343 ) ) ( not ( = ?auto_147342 ?auto_147347 ) ) ( not ( = ?auto_147351 ?auto_147350 ) ) ( not ( = ?auto_147351 ?auto_147346 ) ) ( not ( = ?auto_147351 ?auto_147348 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_147340 ?auto_147341 ?auto_147337 ?auto_147336 ?auto_147338 ?auto_147339 ?auto_147342 ?auto_147343 ?auto_147334 ?auto_147335 )
      ( GET-5IMAGE-VERIFY ?auto_147334 ?auto_147335 ?auto_147337 ?auto_147336 ?auto_147338 ?auto_147339 ?auto_147340 ?auto_147341 ?auto_147342 ?auto_147343 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_147412 - DIRECTION
      ?auto_147413 - MODE
      ?auto_147415 - DIRECTION
      ?auto_147414 - MODE
      ?auto_147416 - DIRECTION
      ?auto_147417 - MODE
      ?auto_147418 - DIRECTION
      ?auto_147419 - MODE
      ?auto_147420 - DIRECTION
      ?auto_147421 - MODE
    )
    :vars
    (
      ?auto_147429 - INSTRUMENT
      ?auto_147422 - SATELLITE
      ?auto_147427 - DIRECTION
      ?auto_147423 - INSTRUMENT
      ?auto_147428 - INSTRUMENT
      ?auto_147424 - INSTRUMENT
      ?auto_147426 - INSTRUMENT
      ?auto_147425 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_147415 ?auto_147412 ) ) ( not ( = ?auto_147416 ?auto_147412 ) ) ( not ( = ?auto_147416 ?auto_147415 ) ) ( not ( = ?auto_147418 ?auto_147412 ) ) ( not ( = ?auto_147418 ?auto_147415 ) ) ( not ( = ?auto_147418 ?auto_147416 ) ) ( not ( = ?auto_147420 ?auto_147412 ) ) ( not ( = ?auto_147420 ?auto_147415 ) ) ( not ( = ?auto_147420 ?auto_147416 ) ) ( not ( = ?auto_147420 ?auto_147418 ) ) ( ON_BOARD ?auto_147429 ?auto_147422 ) ( SUPPORTS ?auto_147429 ?auto_147419 ) ( not ( = ?auto_147418 ?auto_147427 ) ) ( CALIBRATION_TARGET ?auto_147429 ?auto_147427 ) ( not ( = ?auto_147427 ?auto_147412 ) ) ( ON_BOARD ?auto_147423 ?auto_147422 ) ( not ( = ?auto_147429 ?auto_147423 ) ) ( SUPPORTS ?auto_147423 ?auto_147413 ) ( CALIBRATION_TARGET ?auto_147423 ?auto_147427 ) ( not ( = ?auto_147427 ?auto_147416 ) ) ( ON_BOARD ?auto_147428 ?auto_147422 ) ( not ( = ?auto_147423 ?auto_147428 ) ) ( SUPPORTS ?auto_147428 ?auto_147417 ) ( CALIBRATION_TARGET ?auto_147428 ?auto_147427 ) ( not ( = ?auto_147427 ?auto_147415 ) ) ( ON_BOARD ?auto_147424 ?auto_147422 ) ( not ( = ?auto_147428 ?auto_147424 ) ) ( SUPPORTS ?auto_147424 ?auto_147414 ) ( CALIBRATION_TARGET ?auto_147424 ?auto_147427 ) ( not ( = ?auto_147427 ?auto_147420 ) ) ( ON_BOARD ?auto_147426 ?auto_147422 ) ( not ( = ?auto_147424 ?auto_147426 ) ) ( SUPPORTS ?auto_147426 ?auto_147421 ) ( CALIBRATION_TARGET ?auto_147426 ?auto_147427 ) ( POWER_AVAIL ?auto_147422 ) ( POINTING ?auto_147422 ?auto_147425 ) ( not ( = ?auto_147427 ?auto_147425 ) ) ( not ( = ?auto_147420 ?auto_147425 ) ) ( not ( = ?auto_147421 ?auto_147414 ) ) ( not ( = ?auto_147415 ?auto_147425 ) ) ( not ( = ?auto_147421 ?auto_147417 ) ) ( not ( = ?auto_147414 ?auto_147417 ) ) ( not ( = ?auto_147416 ?auto_147425 ) ) ( not ( = ?auto_147428 ?auto_147426 ) ) ( not ( = ?auto_147421 ?auto_147413 ) ) ( not ( = ?auto_147414 ?auto_147413 ) ) ( not ( = ?auto_147417 ?auto_147413 ) ) ( not ( = ?auto_147412 ?auto_147425 ) ) ( not ( = ?auto_147423 ?auto_147424 ) ) ( not ( = ?auto_147423 ?auto_147426 ) ) ( not ( = ?auto_147421 ?auto_147419 ) ) ( not ( = ?auto_147414 ?auto_147419 ) ) ( not ( = ?auto_147417 ?auto_147419 ) ) ( not ( = ?auto_147413 ?auto_147419 ) ) ( not ( = ?auto_147418 ?auto_147425 ) ) ( not ( = ?auto_147429 ?auto_147428 ) ) ( not ( = ?auto_147429 ?auto_147424 ) ) ( not ( = ?auto_147429 ?auto_147426 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_147420 ?auto_147421 ?auto_147415 ?auto_147414 ?auto_147416 ?auto_147417 ?auto_147418 ?auto_147419 ?auto_147412 ?auto_147413 )
      ( GET-5IMAGE-VERIFY ?auto_147412 ?auto_147413 ?auto_147415 ?auto_147414 ?auto_147416 ?auto_147417 ?auto_147418 ?auto_147419 ?auto_147420 ?auto_147421 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_147740 - DIRECTION
      ?auto_147741 - MODE
      ?auto_147743 - DIRECTION
      ?auto_147742 - MODE
      ?auto_147744 - DIRECTION
      ?auto_147745 - MODE
      ?auto_147746 - DIRECTION
      ?auto_147747 - MODE
      ?auto_147748 - DIRECTION
      ?auto_147749 - MODE
    )
    :vars
    (
      ?auto_147757 - INSTRUMENT
      ?auto_147750 - SATELLITE
      ?auto_147755 - DIRECTION
      ?auto_147751 - INSTRUMENT
      ?auto_147756 - INSTRUMENT
      ?auto_147752 - INSTRUMENT
      ?auto_147754 - INSTRUMENT
      ?auto_147753 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_147743 ?auto_147740 ) ) ( not ( = ?auto_147744 ?auto_147740 ) ) ( not ( = ?auto_147744 ?auto_147743 ) ) ( not ( = ?auto_147746 ?auto_147740 ) ) ( not ( = ?auto_147746 ?auto_147743 ) ) ( not ( = ?auto_147746 ?auto_147744 ) ) ( not ( = ?auto_147748 ?auto_147740 ) ) ( not ( = ?auto_147748 ?auto_147743 ) ) ( not ( = ?auto_147748 ?auto_147744 ) ) ( not ( = ?auto_147748 ?auto_147746 ) ) ( ON_BOARD ?auto_147757 ?auto_147750 ) ( SUPPORTS ?auto_147757 ?auto_147745 ) ( not ( = ?auto_147744 ?auto_147755 ) ) ( CALIBRATION_TARGET ?auto_147757 ?auto_147755 ) ( not ( = ?auto_147755 ?auto_147740 ) ) ( ON_BOARD ?auto_147751 ?auto_147750 ) ( not ( = ?auto_147757 ?auto_147751 ) ) ( SUPPORTS ?auto_147751 ?auto_147741 ) ( CALIBRATION_TARGET ?auto_147751 ?auto_147755 ) ( not ( = ?auto_147755 ?auto_147748 ) ) ( ON_BOARD ?auto_147756 ?auto_147750 ) ( not ( = ?auto_147751 ?auto_147756 ) ) ( SUPPORTS ?auto_147756 ?auto_147749 ) ( CALIBRATION_TARGET ?auto_147756 ?auto_147755 ) ( not ( = ?auto_147755 ?auto_147743 ) ) ( ON_BOARD ?auto_147752 ?auto_147750 ) ( not ( = ?auto_147756 ?auto_147752 ) ) ( SUPPORTS ?auto_147752 ?auto_147742 ) ( CALIBRATION_TARGET ?auto_147752 ?auto_147755 ) ( not ( = ?auto_147755 ?auto_147746 ) ) ( ON_BOARD ?auto_147754 ?auto_147750 ) ( not ( = ?auto_147752 ?auto_147754 ) ) ( SUPPORTS ?auto_147754 ?auto_147747 ) ( CALIBRATION_TARGET ?auto_147754 ?auto_147755 ) ( POWER_AVAIL ?auto_147750 ) ( POINTING ?auto_147750 ?auto_147753 ) ( not ( = ?auto_147755 ?auto_147753 ) ) ( not ( = ?auto_147746 ?auto_147753 ) ) ( not ( = ?auto_147747 ?auto_147742 ) ) ( not ( = ?auto_147743 ?auto_147753 ) ) ( not ( = ?auto_147747 ?auto_147749 ) ) ( not ( = ?auto_147742 ?auto_147749 ) ) ( not ( = ?auto_147748 ?auto_147753 ) ) ( not ( = ?auto_147756 ?auto_147754 ) ) ( not ( = ?auto_147747 ?auto_147741 ) ) ( not ( = ?auto_147742 ?auto_147741 ) ) ( not ( = ?auto_147749 ?auto_147741 ) ) ( not ( = ?auto_147740 ?auto_147753 ) ) ( not ( = ?auto_147751 ?auto_147752 ) ) ( not ( = ?auto_147751 ?auto_147754 ) ) ( not ( = ?auto_147747 ?auto_147745 ) ) ( not ( = ?auto_147742 ?auto_147745 ) ) ( not ( = ?auto_147749 ?auto_147745 ) ) ( not ( = ?auto_147741 ?auto_147745 ) ) ( not ( = ?auto_147744 ?auto_147753 ) ) ( not ( = ?auto_147757 ?auto_147756 ) ) ( not ( = ?auto_147757 ?auto_147752 ) ) ( not ( = ?auto_147757 ?auto_147754 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_147746 ?auto_147747 ?auto_147743 ?auto_147742 ?auto_147748 ?auto_147749 ?auto_147744 ?auto_147745 ?auto_147740 ?auto_147741 )
      ( GET-5IMAGE-VERIFY ?auto_147740 ?auto_147741 ?auto_147743 ?auto_147742 ?auto_147744 ?auto_147745 ?auto_147746 ?auto_147747 ?auto_147748 ?auto_147749 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_147904 - DIRECTION
      ?auto_147905 - MODE
      ?auto_147907 - DIRECTION
      ?auto_147906 - MODE
      ?auto_147908 - DIRECTION
      ?auto_147909 - MODE
      ?auto_147910 - DIRECTION
      ?auto_147911 - MODE
      ?auto_147912 - DIRECTION
      ?auto_147913 - MODE
    )
    :vars
    (
      ?auto_147921 - INSTRUMENT
      ?auto_147914 - SATELLITE
      ?auto_147919 - DIRECTION
      ?auto_147915 - INSTRUMENT
      ?auto_147920 - INSTRUMENT
      ?auto_147916 - INSTRUMENT
      ?auto_147918 - INSTRUMENT
      ?auto_147917 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_147907 ?auto_147904 ) ) ( not ( = ?auto_147908 ?auto_147904 ) ) ( not ( = ?auto_147908 ?auto_147907 ) ) ( not ( = ?auto_147910 ?auto_147904 ) ) ( not ( = ?auto_147910 ?auto_147907 ) ) ( not ( = ?auto_147910 ?auto_147908 ) ) ( not ( = ?auto_147912 ?auto_147904 ) ) ( not ( = ?auto_147912 ?auto_147907 ) ) ( not ( = ?auto_147912 ?auto_147908 ) ) ( not ( = ?auto_147912 ?auto_147910 ) ) ( ON_BOARD ?auto_147921 ?auto_147914 ) ( SUPPORTS ?auto_147921 ?auto_147909 ) ( not ( = ?auto_147908 ?auto_147919 ) ) ( CALIBRATION_TARGET ?auto_147921 ?auto_147919 ) ( not ( = ?auto_147919 ?auto_147904 ) ) ( ON_BOARD ?auto_147915 ?auto_147914 ) ( not ( = ?auto_147921 ?auto_147915 ) ) ( SUPPORTS ?auto_147915 ?auto_147905 ) ( CALIBRATION_TARGET ?auto_147915 ?auto_147919 ) ( not ( = ?auto_147919 ?auto_147910 ) ) ( ON_BOARD ?auto_147920 ?auto_147914 ) ( not ( = ?auto_147915 ?auto_147920 ) ) ( SUPPORTS ?auto_147920 ?auto_147911 ) ( CALIBRATION_TARGET ?auto_147920 ?auto_147919 ) ( not ( = ?auto_147919 ?auto_147907 ) ) ( ON_BOARD ?auto_147916 ?auto_147914 ) ( not ( = ?auto_147920 ?auto_147916 ) ) ( SUPPORTS ?auto_147916 ?auto_147906 ) ( CALIBRATION_TARGET ?auto_147916 ?auto_147919 ) ( not ( = ?auto_147919 ?auto_147912 ) ) ( ON_BOARD ?auto_147918 ?auto_147914 ) ( not ( = ?auto_147916 ?auto_147918 ) ) ( SUPPORTS ?auto_147918 ?auto_147913 ) ( CALIBRATION_TARGET ?auto_147918 ?auto_147919 ) ( POWER_AVAIL ?auto_147914 ) ( POINTING ?auto_147914 ?auto_147917 ) ( not ( = ?auto_147919 ?auto_147917 ) ) ( not ( = ?auto_147912 ?auto_147917 ) ) ( not ( = ?auto_147913 ?auto_147906 ) ) ( not ( = ?auto_147907 ?auto_147917 ) ) ( not ( = ?auto_147913 ?auto_147911 ) ) ( not ( = ?auto_147906 ?auto_147911 ) ) ( not ( = ?auto_147910 ?auto_147917 ) ) ( not ( = ?auto_147920 ?auto_147918 ) ) ( not ( = ?auto_147913 ?auto_147905 ) ) ( not ( = ?auto_147906 ?auto_147905 ) ) ( not ( = ?auto_147911 ?auto_147905 ) ) ( not ( = ?auto_147904 ?auto_147917 ) ) ( not ( = ?auto_147915 ?auto_147916 ) ) ( not ( = ?auto_147915 ?auto_147918 ) ) ( not ( = ?auto_147913 ?auto_147909 ) ) ( not ( = ?auto_147906 ?auto_147909 ) ) ( not ( = ?auto_147911 ?auto_147909 ) ) ( not ( = ?auto_147905 ?auto_147909 ) ) ( not ( = ?auto_147908 ?auto_147917 ) ) ( not ( = ?auto_147921 ?auto_147920 ) ) ( not ( = ?auto_147921 ?auto_147916 ) ) ( not ( = ?auto_147921 ?auto_147918 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_147912 ?auto_147913 ?auto_147907 ?auto_147906 ?auto_147910 ?auto_147911 ?auto_147908 ?auto_147909 ?auto_147904 ?auto_147905 )
      ( GET-5IMAGE-VERIFY ?auto_147904 ?auto_147905 ?auto_147907 ?auto_147906 ?auto_147908 ?auto_147909 ?auto_147910 ?auto_147911 ?auto_147912 ?auto_147913 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_148234 - DIRECTION
      ?auto_148235 - MODE
      ?auto_148237 - DIRECTION
      ?auto_148236 - MODE
      ?auto_148238 - DIRECTION
      ?auto_148239 - MODE
      ?auto_148240 - DIRECTION
      ?auto_148241 - MODE
      ?auto_148242 - DIRECTION
      ?auto_148243 - MODE
    )
    :vars
    (
      ?auto_148251 - INSTRUMENT
      ?auto_148244 - SATELLITE
      ?auto_148249 - DIRECTION
      ?auto_148245 - INSTRUMENT
      ?auto_148250 - INSTRUMENT
      ?auto_148246 - INSTRUMENT
      ?auto_148248 - INSTRUMENT
      ?auto_148247 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_148237 ?auto_148234 ) ) ( not ( = ?auto_148238 ?auto_148234 ) ) ( not ( = ?auto_148238 ?auto_148237 ) ) ( not ( = ?auto_148240 ?auto_148234 ) ) ( not ( = ?auto_148240 ?auto_148237 ) ) ( not ( = ?auto_148240 ?auto_148238 ) ) ( not ( = ?auto_148242 ?auto_148234 ) ) ( not ( = ?auto_148242 ?auto_148237 ) ) ( not ( = ?auto_148242 ?auto_148238 ) ) ( not ( = ?auto_148242 ?auto_148240 ) ) ( ON_BOARD ?auto_148251 ?auto_148244 ) ( SUPPORTS ?auto_148251 ?auto_148243 ) ( not ( = ?auto_148242 ?auto_148249 ) ) ( CALIBRATION_TARGET ?auto_148251 ?auto_148249 ) ( not ( = ?auto_148249 ?auto_148234 ) ) ( ON_BOARD ?auto_148245 ?auto_148244 ) ( not ( = ?auto_148251 ?auto_148245 ) ) ( SUPPORTS ?auto_148245 ?auto_148235 ) ( CALIBRATION_TARGET ?auto_148245 ?auto_148249 ) ( not ( = ?auto_148249 ?auto_148237 ) ) ( ON_BOARD ?auto_148250 ?auto_148244 ) ( not ( = ?auto_148245 ?auto_148250 ) ) ( SUPPORTS ?auto_148250 ?auto_148236 ) ( CALIBRATION_TARGET ?auto_148250 ?auto_148249 ) ( not ( = ?auto_148249 ?auto_148240 ) ) ( ON_BOARD ?auto_148246 ?auto_148244 ) ( not ( = ?auto_148250 ?auto_148246 ) ) ( SUPPORTS ?auto_148246 ?auto_148241 ) ( CALIBRATION_TARGET ?auto_148246 ?auto_148249 ) ( not ( = ?auto_148249 ?auto_148238 ) ) ( ON_BOARD ?auto_148248 ?auto_148244 ) ( not ( = ?auto_148246 ?auto_148248 ) ) ( SUPPORTS ?auto_148248 ?auto_148239 ) ( CALIBRATION_TARGET ?auto_148248 ?auto_148249 ) ( POWER_AVAIL ?auto_148244 ) ( POINTING ?auto_148244 ?auto_148247 ) ( not ( = ?auto_148249 ?auto_148247 ) ) ( not ( = ?auto_148238 ?auto_148247 ) ) ( not ( = ?auto_148239 ?auto_148241 ) ) ( not ( = ?auto_148240 ?auto_148247 ) ) ( not ( = ?auto_148239 ?auto_148236 ) ) ( not ( = ?auto_148241 ?auto_148236 ) ) ( not ( = ?auto_148237 ?auto_148247 ) ) ( not ( = ?auto_148250 ?auto_148248 ) ) ( not ( = ?auto_148239 ?auto_148235 ) ) ( not ( = ?auto_148241 ?auto_148235 ) ) ( not ( = ?auto_148236 ?auto_148235 ) ) ( not ( = ?auto_148234 ?auto_148247 ) ) ( not ( = ?auto_148245 ?auto_148246 ) ) ( not ( = ?auto_148245 ?auto_148248 ) ) ( not ( = ?auto_148239 ?auto_148243 ) ) ( not ( = ?auto_148241 ?auto_148243 ) ) ( not ( = ?auto_148236 ?auto_148243 ) ) ( not ( = ?auto_148235 ?auto_148243 ) ) ( not ( = ?auto_148242 ?auto_148247 ) ) ( not ( = ?auto_148251 ?auto_148250 ) ) ( not ( = ?auto_148251 ?auto_148246 ) ) ( not ( = ?auto_148251 ?auto_148248 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_148238 ?auto_148239 ?auto_148240 ?auto_148241 ?auto_148237 ?auto_148236 ?auto_148242 ?auto_148243 ?auto_148234 ?auto_148235 )
      ( GET-5IMAGE-VERIFY ?auto_148234 ?auto_148235 ?auto_148237 ?auto_148236 ?auto_148238 ?auto_148239 ?auto_148240 ?auto_148241 ?auto_148242 ?auto_148243 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_148312 - DIRECTION
      ?auto_148313 - MODE
      ?auto_148315 - DIRECTION
      ?auto_148314 - MODE
      ?auto_148316 - DIRECTION
      ?auto_148317 - MODE
      ?auto_148318 - DIRECTION
      ?auto_148319 - MODE
      ?auto_148320 - DIRECTION
      ?auto_148321 - MODE
    )
    :vars
    (
      ?auto_148329 - INSTRUMENT
      ?auto_148322 - SATELLITE
      ?auto_148327 - DIRECTION
      ?auto_148323 - INSTRUMENT
      ?auto_148328 - INSTRUMENT
      ?auto_148324 - INSTRUMENT
      ?auto_148326 - INSTRUMENT
      ?auto_148325 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_148315 ?auto_148312 ) ) ( not ( = ?auto_148316 ?auto_148312 ) ) ( not ( = ?auto_148316 ?auto_148315 ) ) ( not ( = ?auto_148318 ?auto_148312 ) ) ( not ( = ?auto_148318 ?auto_148315 ) ) ( not ( = ?auto_148318 ?auto_148316 ) ) ( not ( = ?auto_148320 ?auto_148312 ) ) ( not ( = ?auto_148320 ?auto_148315 ) ) ( not ( = ?auto_148320 ?auto_148316 ) ) ( not ( = ?auto_148320 ?auto_148318 ) ) ( ON_BOARD ?auto_148329 ?auto_148322 ) ( SUPPORTS ?auto_148329 ?auto_148319 ) ( not ( = ?auto_148318 ?auto_148327 ) ) ( CALIBRATION_TARGET ?auto_148329 ?auto_148327 ) ( not ( = ?auto_148327 ?auto_148312 ) ) ( ON_BOARD ?auto_148323 ?auto_148322 ) ( not ( = ?auto_148329 ?auto_148323 ) ) ( SUPPORTS ?auto_148323 ?auto_148313 ) ( CALIBRATION_TARGET ?auto_148323 ?auto_148327 ) ( not ( = ?auto_148327 ?auto_148315 ) ) ( ON_BOARD ?auto_148328 ?auto_148322 ) ( not ( = ?auto_148323 ?auto_148328 ) ) ( SUPPORTS ?auto_148328 ?auto_148314 ) ( CALIBRATION_TARGET ?auto_148328 ?auto_148327 ) ( not ( = ?auto_148327 ?auto_148320 ) ) ( ON_BOARD ?auto_148324 ?auto_148322 ) ( not ( = ?auto_148328 ?auto_148324 ) ) ( SUPPORTS ?auto_148324 ?auto_148321 ) ( CALIBRATION_TARGET ?auto_148324 ?auto_148327 ) ( not ( = ?auto_148327 ?auto_148316 ) ) ( ON_BOARD ?auto_148326 ?auto_148322 ) ( not ( = ?auto_148324 ?auto_148326 ) ) ( SUPPORTS ?auto_148326 ?auto_148317 ) ( CALIBRATION_TARGET ?auto_148326 ?auto_148327 ) ( POWER_AVAIL ?auto_148322 ) ( POINTING ?auto_148322 ?auto_148325 ) ( not ( = ?auto_148327 ?auto_148325 ) ) ( not ( = ?auto_148316 ?auto_148325 ) ) ( not ( = ?auto_148317 ?auto_148321 ) ) ( not ( = ?auto_148320 ?auto_148325 ) ) ( not ( = ?auto_148317 ?auto_148314 ) ) ( not ( = ?auto_148321 ?auto_148314 ) ) ( not ( = ?auto_148315 ?auto_148325 ) ) ( not ( = ?auto_148328 ?auto_148326 ) ) ( not ( = ?auto_148317 ?auto_148313 ) ) ( not ( = ?auto_148321 ?auto_148313 ) ) ( not ( = ?auto_148314 ?auto_148313 ) ) ( not ( = ?auto_148312 ?auto_148325 ) ) ( not ( = ?auto_148323 ?auto_148324 ) ) ( not ( = ?auto_148323 ?auto_148326 ) ) ( not ( = ?auto_148317 ?auto_148319 ) ) ( not ( = ?auto_148321 ?auto_148319 ) ) ( not ( = ?auto_148314 ?auto_148319 ) ) ( not ( = ?auto_148313 ?auto_148319 ) ) ( not ( = ?auto_148318 ?auto_148325 ) ) ( not ( = ?auto_148329 ?auto_148328 ) ) ( not ( = ?auto_148329 ?auto_148324 ) ) ( not ( = ?auto_148329 ?auto_148326 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_148316 ?auto_148317 ?auto_148320 ?auto_148321 ?auto_148315 ?auto_148314 ?auto_148318 ?auto_148319 ?auto_148312 ?auto_148313 )
      ( GET-5IMAGE-VERIFY ?auto_148312 ?auto_148313 ?auto_148315 ?auto_148314 ?auto_148316 ?auto_148317 ?auto_148318 ?auto_148319 ?auto_148320 ?auto_148321 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_148390 - DIRECTION
      ?auto_148391 - MODE
      ?auto_148393 - DIRECTION
      ?auto_148392 - MODE
      ?auto_148394 - DIRECTION
      ?auto_148395 - MODE
      ?auto_148396 - DIRECTION
      ?auto_148397 - MODE
      ?auto_148398 - DIRECTION
      ?auto_148399 - MODE
    )
    :vars
    (
      ?auto_148407 - INSTRUMENT
      ?auto_148400 - SATELLITE
      ?auto_148405 - DIRECTION
      ?auto_148401 - INSTRUMENT
      ?auto_148406 - INSTRUMENT
      ?auto_148402 - INSTRUMENT
      ?auto_148404 - INSTRUMENT
      ?auto_148403 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_148393 ?auto_148390 ) ) ( not ( = ?auto_148394 ?auto_148390 ) ) ( not ( = ?auto_148394 ?auto_148393 ) ) ( not ( = ?auto_148396 ?auto_148390 ) ) ( not ( = ?auto_148396 ?auto_148393 ) ) ( not ( = ?auto_148396 ?auto_148394 ) ) ( not ( = ?auto_148398 ?auto_148390 ) ) ( not ( = ?auto_148398 ?auto_148393 ) ) ( not ( = ?auto_148398 ?auto_148394 ) ) ( not ( = ?auto_148398 ?auto_148396 ) ) ( ON_BOARD ?auto_148407 ?auto_148400 ) ( SUPPORTS ?auto_148407 ?auto_148399 ) ( not ( = ?auto_148398 ?auto_148405 ) ) ( CALIBRATION_TARGET ?auto_148407 ?auto_148405 ) ( not ( = ?auto_148405 ?auto_148390 ) ) ( ON_BOARD ?auto_148401 ?auto_148400 ) ( not ( = ?auto_148407 ?auto_148401 ) ) ( SUPPORTS ?auto_148401 ?auto_148391 ) ( CALIBRATION_TARGET ?auto_148401 ?auto_148405 ) ( not ( = ?auto_148405 ?auto_148393 ) ) ( ON_BOARD ?auto_148406 ?auto_148400 ) ( not ( = ?auto_148401 ?auto_148406 ) ) ( SUPPORTS ?auto_148406 ?auto_148392 ) ( CALIBRATION_TARGET ?auto_148406 ?auto_148405 ) ( not ( = ?auto_148405 ?auto_148394 ) ) ( ON_BOARD ?auto_148402 ?auto_148400 ) ( not ( = ?auto_148406 ?auto_148402 ) ) ( SUPPORTS ?auto_148402 ?auto_148395 ) ( CALIBRATION_TARGET ?auto_148402 ?auto_148405 ) ( not ( = ?auto_148405 ?auto_148396 ) ) ( ON_BOARD ?auto_148404 ?auto_148400 ) ( not ( = ?auto_148402 ?auto_148404 ) ) ( SUPPORTS ?auto_148404 ?auto_148397 ) ( CALIBRATION_TARGET ?auto_148404 ?auto_148405 ) ( POWER_AVAIL ?auto_148400 ) ( POINTING ?auto_148400 ?auto_148403 ) ( not ( = ?auto_148405 ?auto_148403 ) ) ( not ( = ?auto_148396 ?auto_148403 ) ) ( not ( = ?auto_148397 ?auto_148395 ) ) ( not ( = ?auto_148394 ?auto_148403 ) ) ( not ( = ?auto_148397 ?auto_148392 ) ) ( not ( = ?auto_148395 ?auto_148392 ) ) ( not ( = ?auto_148393 ?auto_148403 ) ) ( not ( = ?auto_148406 ?auto_148404 ) ) ( not ( = ?auto_148397 ?auto_148391 ) ) ( not ( = ?auto_148395 ?auto_148391 ) ) ( not ( = ?auto_148392 ?auto_148391 ) ) ( not ( = ?auto_148390 ?auto_148403 ) ) ( not ( = ?auto_148401 ?auto_148402 ) ) ( not ( = ?auto_148401 ?auto_148404 ) ) ( not ( = ?auto_148397 ?auto_148399 ) ) ( not ( = ?auto_148395 ?auto_148399 ) ) ( not ( = ?auto_148392 ?auto_148399 ) ) ( not ( = ?auto_148391 ?auto_148399 ) ) ( not ( = ?auto_148398 ?auto_148403 ) ) ( not ( = ?auto_148407 ?auto_148406 ) ) ( not ( = ?auto_148407 ?auto_148402 ) ) ( not ( = ?auto_148407 ?auto_148404 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_148396 ?auto_148397 ?auto_148394 ?auto_148395 ?auto_148393 ?auto_148392 ?auto_148398 ?auto_148399 ?auto_148390 ?auto_148391 )
      ( GET-5IMAGE-VERIFY ?auto_148390 ?auto_148391 ?auto_148393 ?auto_148392 ?auto_148394 ?auto_148395 ?auto_148396 ?auto_148397 ?auto_148398 ?auto_148399 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_148468 - DIRECTION
      ?auto_148469 - MODE
      ?auto_148471 - DIRECTION
      ?auto_148470 - MODE
      ?auto_148472 - DIRECTION
      ?auto_148473 - MODE
      ?auto_148474 - DIRECTION
      ?auto_148475 - MODE
      ?auto_148476 - DIRECTION
      ?auto_148477 - MODE
    )
    :vars
    (
      ?auto_148485 - INSTRUMENT
      ?auto_148478 - SATELLITE
      ?auto_148483 - DIRECTION
      ?auto_148479 - INSTRUMENT
      ?auto_148484 - INSTRUMENT
      ?auto_148480 - INSTRUMENT
      ?auto_148482 - INSTRUMENT
      ?auto_148481 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_148471 ?auto_148468 ) ) ( not ( = ?auto_148472 ?auto_148468 ) ) ( not ( = ?auto_148472 ?auto_148471 ) ) ( not ( = ?auto_148474 ?auto_148468 ) ) ( not ( = ?auto_148474 ?auto_148471 ) ) ( not ( = ?auto_148474 ?auto_148472 ) ) ( not ( = ?auto_148476 ?auto_148468 ) ) ( not ( = ?auto_148476 ?auto_148471 ) ) ( not ( = ?auto_148476 ?auto_148472 ) ) ( not ( = ?auto_148476 ?auto_148474 ) ) ( ON_BOARD ?auto_148485 ?auto_148478 ) ( SUPPORTS ?auto_148485 ?auto_148475 ) ( not ( = ?auto_148474 ?auto_148483 ) ) ( CALIBRATION_TARGET ?auto_148485 ?auto_148483 ) ( not ( = ?auto_148483 ?auto_148468 ) ) ( ON_BOARD ?auto_148479 ?auto_148478 ) ( not ( = ?auto_148485 ?auto_148479 ) ) ( SUPPORTS ?auto_148479 ?auto_148469 ) ( CALIBRATION_TARGET ?auto_148479 ?auto_148483 ) ( not ( = ?auto_148483 ?auto_148471 ) ) ( ON_BOARD ?auto_148484 ?auto_148478 ) ( not ( = ?auto_148479 ?auto_148484 ) ) ( SUPPORTS ?auto_148484 ?auto_148470 ) ( CALIBRATION_TARGET ?auto_148484 ?auto_148483 ) ( not ( = ?auto_148483 ?auto_148472 ) ) ( ON_BOARD ?auto_148480 ?auto_148478 ) ( not ( = ?auto_148484 ?auto_148480 ) ) ( SUPPORTS ?auto_148480 ?auto_148473 ) ( CALIBRATION_TARGET ?auto_148480 ?auto_148483 ) ( not ( = ?auto_148483 ?auto_148476 ) ) ( ON_BOARD ?auto_148482 ?auto_148478 ) ( not ( = ?auto_148480 ?auto_148482 ) ) ( SUPPORTS ?auto_148482 ?auto_148477 ) ( CALIBRATION_TARGET ?auto_148482 ?auto_148483 ) ( POWER_AVAIL ?auto_148478 ) ( POINTING ?auto_148478 ?auto_148481 ) ( not ( = ?auto_148483 ?auto_148481 ) ) ( not ( = ?auto_148476 ?auto_148481 ) ) ( not ( = ?auto_148477 ?auto_148473 ) ) ( not ( = ?auto_148472 ?auto_148481 ) ) ( not ( = ?auto_148477 ?auto_148470 ) ) ( not ( = ?auto_148473 ?auto_148470 ) ) ( not ( = ?auto_148471 ?auto_148481 ) ) ( not ( = ?auto_148484 ?auto_148482 ) ) ( not ( = ?auto_148477 ?auto_148469 ) ) ( not ( = ?auto_148473 ?auto_148469 ) ) ( not ( = ?auto_148470 ?auto_148469 ) ) ( not ( = ?auto_148468 ?auto_148481 ) ) ( not ( = ?auto_148479 ?auto_148480 ) ) ( not ( = ?auto_148479 ?auto_148482 ) ) ( not ( = ?auto_148477 ?auto_148475 ) ) ( not ( = ?auto_148473 ?auto_148475 ) ) ( not ( = ?auto_148470 ?auto_148475 ) ) ( not ( = ?auto_148469 ?auto_148475 ) ) ( not ( = ?auto_148474 ?auto_148481 ) ) ( not ( = ?auto_148485 ?auto_148484 ) ) ( not ( = ?auto_148485 ?auto_148480 ) ) ( not ( = ?auto_148485 ?auto_148482 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_148476 ?auto_148477 ?auto_148472 ?auto_148473 ?auto_148471 ?auto_148470 ?auto_148474 ?auto_148475 ?auto_148468 ?auto_148469 )
      ( GET-5IMAGE-VERIFY ?auto_148468 ?auto_148469 ?auto_148471 ?auto_148470 ?auto_148472 ?auto_148473 ?auto_148474 ?auto_148475 ?auto_148476 ?auto_148477 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_148966 - DIRECTION
      ?auto_148967 - MODE
      ?auto_148969 - DIRECTION
      ?auto_148968 - MODE
      ?auto_148970 - DIRECTION
      ?auto_148971 - MODE
      ?auto_148972 - DIRECTION
      ?auto_148973 - MODE
      ?auto_148974 - DIRECTION
      ?auto_148975 - MODE
    )
    :vars
    (
      ?auto_148983 - INSTRUMENT
      ?auto_148976 - SATELLITE
      ?auto_148981 - DIRECTION
      ?auto_148977 - INSTRUMENT
      ?auto_148982 - INSTRUMENT
      ?auto_148978 - INSTRUMENT
      ?auto_148980 - INSTRUMENT
      ?auto_148979 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_148969 ?auto_148966 ) ) ( not ( = ?auto_148970 ?auto_148966 ) ) ( not ( = ?auto_148970 ?auto_148969 ) ) ( not ( = ?auto_148972 ?auto_148966 ) ) ( not ( = ?auto_148972 ?auto_148969 ) ) ( not ( = ?auto_148972 ?auto_148970 ) ) ( not ( = ?auto_148974 ?auto_148966 ) ) ( not ( = ?auto_148974 ?auto_148969 ) ) ( not ( = ?auto_148974 ?auto_148970 ) ) ( not ( = ?auto_148974 ?auto_148972 ) ) ( ON_BOARD ?auto_148983 ?auto_148976 ) ( SUPPORTS ?auto_148983 ?auto_148971 ) ( not ( = ?auto_148970 ?auto_148981 ) ) ( CALIBRATION_TARGET ?auto_148983 ?auto_148981 ) ( not ( = ?auto_148981 ?auto_148966 ) ) ( ON_BOARD ?auto_148977 ?auto_148976 ) ( not ( = ?auto_148983 ?auto_148977 ) ) ( SUPPORTS ?auto_148977 ?auto_148967 ) ( CALIBRATION_TARGET ?auto_148977 ?auto_148981 ) ( not ( = ?auto_148981 ?auto_148969 ) ) ( ON_BOARD ?auto_148982 ?auto_148976 ) ( not ( = ?auto_148977 ?auto_148982 ) ) ( SUPPORTS ?auto_148982 ?auto_148968 ) ( CALIBRATION_TARGET ?auto_148982 ?auto_148981 ) ( not ( = ?auto_148981 ?auto_148974 ) ) ( ON_BOARD ?auto_148978 ?auto_148976 ) ( not ( = ?auto_148982 ?auto_148978 ) ) ( SUPPORTS ?auto_148978 ?auto_148975 ) ( CALIBRATION_TARGET ?auto_148978 ?auto_148981 ) ( not ( = ?auto_148981 ?auto_148972 ) ) ( ON_BOARD ?auto_148980 ?auto_148976 ) ( not ( = ?auto_148978 ?auto_148980 ) ) ( SUPPORTS ?auto_148980 ?auto_148973 ) ( CALIBRATION_TARGET ?auto_148980 ?auto_148981 ) ( POWER_AVAIL ?auto_148976 ) ( POINTING ?auto_148976 ?auto_148979 ) ( not ( = ?auto_148981 ?auto_148979 ) ) ( not ( = ?auto_148972 ?auto_148979 ) ) ( not ( = ?auto_148973 ?auto_148975 ) ) ( not ( = ?auto_148974 ?auto_148979 ) ) ( not ( = ?auto_148973 ?auto_148968 ) ) ( not ( = ?auto_148975 ?auto_148968 ) ) ( not ( = ?auto_148969 ?auto_148979 ) ) ( not ( = ?auto_148982 ?auto_148980 ) ) ( not ( = ?auto_148973 ?auto_148967 ) ) ( not ( = ?auto_148975 ?auto_148967 ) ) ( not ( = ?auto_148968 ?auto_148967 ) ) ( not ( = ?auto_148966 ?auto_148979 ) ) ( not ( = ?auto_148977 ?auto_148978 ) ) ( not ( = ?auto_148977 ?auto_148980 ) ) ( not ( = ?auto_148973 ?auto_148971 ) ) ( not ( = ?auto_148975 ?auto_148971 ) ) ( not ( = ?auto_148968 ?auto_148971 ) ) ( not ( = ?auto_148967 ?auto_148971 ) ) ( not ( = ?auto_148970 ?auto_148979 ) ) ( not ( = ?auto_148983 ?auto_148982 ) ) ( not ( = ?auto_148983 ?auto_148978 ) ) ( not ( = ?auto_148983 ?auto_148980 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_148972 ?auto_148973 ?auto_148974 ?auto_148975 ?auto_148969 ?auto_148968 ?auto_148970 ?auto_148971 ?auto_148966 ?auto_148967 )
      ( GET-5IMAGE-VERIFY ?auto_148966 ?auto_148967 ?auto_148969 ?auto_148968 ?auto_148970 ?auto_148971 ?auto_148972 ?auto_148973 ?auto_148974 ?auto_148975 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_149044 - DIRECTION
      ?auto_149045 - MODE
      ?auto_149047 - DIRECTION
      ?auto_149046 - MODE
      ?auto_149048 - DIRECTION
      ?auto_149049 - MODE
      ?auto_149050 - DIRECTION
      ?auto_149051 - MODE
      ?auto_149052 - DIRECTION
      ?auto_149053 - MODE
    )
    :vars
    (
      ?auto_149061 - INSTRUMENT
      ?auto_149054 - SATELLITE
      ?auto_149059 - DIRECTION
      ?auto_149055 - INSTRUMENT
      ?auto_149060 - INSTRUMENT
      ?auto_149056 - INSTRUMENT
      ?auto_149058 - INSTRUMENT
      ?auto_149057 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_149047 ?auto_149044 ) ) ( not ( = ?auto_149048 ?auto_149044 ) ) ( not ( = ?auto_149048 ?auto_149047 ) ) ( not ( = ?auto_149050 ?auto_149044 ) ) ( not ( = ?auto_149050 ?auto_149047 ) ) ( not ( = ?auto_149050 ?auto_149048 ) ) ( not ( = ?auto_149052 ?auto_149044 ) ) ( not ( = ?auto_149052 ?auto_149047 ) ) ( not ( = ?auto_149052 ?auto_149048 ) ) ( not ( = ?auto_149052 ?auto_149050 ) ) ( ON_BOARD ?auto_149061 ?auto_149054 ) ( SUPPORTS ?auto_149061 ?auto_149049 ) ( not ( = ?auto_149048 ?auto_149059 ) ) ( CALIBRATION_TARGET ?auto_149061 ?auto_149059 ) ( not ( = ?auto_149059 ?auto_149044 ) ) ( ON_BOARD ?auto_149055 ?auto_149054 ) ( not ( = ?auto_149061 ?auto_149055 ) ) ( SUPPORTS ?auto_149055 ?auto_149045 ) ( CALIBRATION_TARGET ?auto_149055 ?auto_149059 ) ( not ( = ?auto_149059 ?auto_149047 ) ) ( ON_BOARD ?auto_149060 ?auto_149054 ) ( not ( = ?auto_149055 ?auto_149060 ) ) ( SUPPORTS ?auto_149060 ?auto_149046 ) ( CALIBRATION_TARGET ?auto_149060 ?auto_149059 ) ( not ( = ?auto_149059 ?auto_149050 ) ) ( ON_BOARD ?auto_149056 ?auto_149054 ) ( not ( = ?auto_149060 ?auto_149056 ) ) ( SUPPORTS ?auto_149056 ?auto_149051 ) ( CALIBRATION_TARGET ?auto_149056 ?auto_149059 ) ( not ( = ?auto_149059 ?auto_149052 ) ) ( ON_BOARD ?auto_149058 ?auto_149054 ) ( not ( = ?auto_149056 ?auto_149058 ) ) ( SUPPORTS ?auto_149058 ?auto_149053 ) ( CALIBRATION_TARGET ?auto_149058 ?auto_149059 ) ( POWER_AVAIL ?auto_149054 ) ( POINTING ?auto_149054 ?auto_149057 ) ( not ( = ?auto_149059 ?auto_149057 ) ) ( not ( = ?auto_149052 ?auto_149057 ) ) ( not ( = ?auto_149053 ?auto_149051 ) ) ( not ( = ?auto_149050 ?auto_149057 ) ) ( not ( = ?auto_149053 ?auto_149046 ) ) ( not ( = ?auto_149051 ?auto_149046 ) ) ( not ( = ?auto_149047 ?auto_149057 ) ) ( not ( = ?auto_149060 ?auto_149058 ) ) ( not ( = ?auto_149053 ?auto_149045 ) ) ( not ( = ?auto_149051 ?auto_149045 ) ) ( not ( = ?auto_149046 ?auto_149045 ) ) ( not ( = ?auto_149044 ?auto_149057 ) ) ( not ( = ?auto_149055 ?auto_149056 ) ) ( not ( = ?auto_149055 ?auto_149058 ) ) ( not ( = ?auto_149053 ?auto_149049 ) ) ( not ( = ?auto_149051 ?auto_149049 ) ) ( not ( = ?auto_149046 ?auto_149049 ) ) ( not ( = ?auto_149045 ?auto_149049 ) ) ( not ( = ?auto_149048 ?auto_149057 ) ) ( not ( = ?auto_149061 ?auto_149060 ) ) ( not ( = ?auto_149061 ?auto_149056 ) ) ( not ( = ?auto_149061 ?auto_149058 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_149052 ?auto_149053 ?auto_149050 ?auto_149051 ?auto_149047 ?auto_149046 ?auto_149048 ?auto_149049 ?auto_149044 ?auto_149045 )
      ( GET-5IMAGE-VERIFY ?auto_149044 ?auto_149045 ?auto_149047 ?auto_149046 ?auto_149048 ?auto_149049 ?auto_149050 ?auto_149051 ?auto_149052 ?auto_149053 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_150926 - DIRECTION
      ?auto_150927 - MODE
      ?auto_150929 - DIRECTION
      ?auto_150928 - MODE
      ?auto_150930 - DIRECTION
      ?auto_150931 - MODE
      ?auto_150932 - DIRECTION
      ?auto_150933 - MODE
      ?auto_150934 - DIRECTION
      ?auto_150935 - MODE
    )
    :vars
    (
      ?auto_150943 - INSTRUMENT
      ?auto_150936 - SATELLITE
      ?auto_150941 - DIRECTION
      ?auto_150937 - INSTRUMENT
      ?auto_150942 - INSTRUMENT
      ?auto_150938 - INSTRUMENT
      ?auto_150940 - INSTRUMENT
      ?auto_150939 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_150929 ?auto_150926 ) ) ( not ( = ?auto_150930 ?auto_150926 ) ) ( not ( = ?auto_150930 ?auto_150929 ) ) ( not ( = ?auto_150932 ?auto_150926 ) ) ( not ( = ?auto_150932 ?auto_150929 ) ) ( not ( = ?auto_150932 ?auto_150930 ) ) ( not ( = ?auto_150934 ?auto_150926 ) ) ( not ( = ?auto_150934 ?auto_150929 ) ) ( not ( = ?auto_150934 ?auto_150930 ) ) ( not ( = ?auto_150934 ?auto_150932 ) ) ( ON_BOARD ?auto_150943 ?auto_150936 ) ( SUPPORTS ?auto_150943 ?auto_150928 ) ( not ( = ?auto_150929 ?auto_150941 ) ) ( CALIBRATION_TARGET ?auto_150943 ?auto_150941 ) ( not ( = ?auto_150941 ?auto_150926 ) ) ( ON_BOARD ?auto_150937 ?auto_150936 ) ( not ( = ?auto_150943 ?auto_150937 ) ) ( SUPPORTS ?auto_150937 ?auto_150927 ) ( CALIBRATION_TARGET ?auto_150937 ?auto_150941 ) ( not ( = ?auto_150941 ?auto_150934 ) ) ( ON_BOARD ?auto_150942 ?auto_150936 ) ( not ( = ?auto_150937 ?auto_150942 ) ) ( SUPPORTS ?auto_150942 ?auto_150935 ) ( CALIBRATION_TARGET ?auto_150942 ?auto_150941 ) ( not ( = ?auto_150941 ?auto_150932 ) ) ( ON_BOARD ?auto_150938 ?auto_150936 ) ( not ( = ?auto_150942 ?auto_150938 ) ) ( SUPPORTS ?auto_150938 ?auto_150933 ) ( CALIBRATION_TARGET ?auto_150938 ?auto_150941 ) ( not ( = ?auto_150941 ?auto_150930 ) ) ( ON_BOARD ?auto_150940 ?auto_150936 ) ( not ( = ?auto_150938 ?auto_150940 ) ) ( SUPPORTS ?auto_150940 ?auto_150931 ) ( CALIBRATION_TARGET ?auto_150940 ?auto_150941 ) ( POWER_AVAIL ?auto_150936 ) ( POINTING ?auto_150936 ?auto_150939 ) ( not ( = ?auto_150941 ?auto_150939 ) ) ( not ( = ?auto_150930 ?auto_150939 ) ) ( not ( = ?auto_150931 ?auto_150933 ) ) ( not ( = ?auto_150932 ?auto_150939 ) ) ( not ( = ?auto_150931 ?auto_150935 ) ) ( not ( = ?auto_150933 ?auto_150935 ) ) ( not ( = ?auto_150934 ?auto_150939 ) ) ( not ( = ?auto_150942 ?auto_150940 ) ) ( not ( = ?auto_150931 ?auto_150927 ) ) ( not ( = ?auto_150933 ?auto_150927 ) ) ( not ( = ?auto_150935 ?auto_150927 ) ) ( not ( = ?auto_150926 ?auto_150939 ) ) ( not ( = ?auto_150937 ?auto_150938 ) ) ( not ( = ?auto_150937 ?auto_150940 ) ) ( not ( = ?auto_150931 ?auto_150928 ) ) ( not ( = ?auto_150933 ?auto_150928 ) ) ( not ( = ?auto_150935 ?auto_150928 ) ) ( not ( = ?auto_150927 ?auto_150928 ) ) ( not ( = ?auto_150929 ?auto_150939 ) ) ( not ( = ?auto_150943 ?auto_150942 ) ) ( not ( = ?auto_150943 ?auto_150938 ) ) ( not ( = ?auto_150943 ?auto_150940 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_150930 ?auto_150931 ?auto_150932 ?auto_150933 ?auto_150934 ?auto_150935 ?auto_150929 ?auto_150928 ?auto_150926 ?auto_150927 )
      ( GET-5IMAGE-VERIFY ?auto_150926 ?auto_150927 ?auto_150929 ?auto_150928 ?auto_150930 ?auto_150931 ?auto_150932 ?auto_150933 ?auto_150934 ?auto_150935 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_151004 - DIRECTION
      ?auto_151005 - MODE
      ?auto_151007 - DIRECTION
      ?auto_151006 - MODE
      ?auto_151008 - DIRECTION
      ?auto_151009 - MODE
      ?auto_151010 - DIRECTION
      ?auto_151011 - MODE
      ?auto_151012 - DIRECTION
      ?auto_151013 - MODE
    )
    :vars
    (
      ?auto_151021 - INSTRUMENT
      ?auto_151014 - SATELLITE
      ?auto_151019 - DIRECTION
      ?auto_151015 - INSTRUMENT
      ?auto_151020 - INSTRUMENT
      ?auto_151016 - INSTRUMENT
      ?auto_151018 - INSTRUMENT
      ?auto_151017 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_151007 ?auto_151004 ) ) ( not ( = ?auto_151008 ?auto_151004 ) ) ( not ( = ?auto_151008 ?auto_151007 ) ) ( not ( = ?auto_151010 ?auto_151004 ) ) ( not ( = ?auto_151010 ?auto_151007 ) ) ( not ( = ?auto_151010 ?auto_151008 ) ) ( not ( = ?auto_151012 ?auto_151004 ) ) ( not ( = ?auto_151012 ?auto_151007 ) ) ( not ( = ?auto_151012 ?auto_151008 ) ) ( not ( = ?auto_151012 ?auto_151010 ) ) ( ON_BOARD ?auto_151021 ?auto_151014 ) ( SUPPORTS ?auto_151021 ?auto_151006 ) ( not ( = ?auto_151007 ?auto_151019 ) ) ( CALIBRATION_TARGET ?auto_151021 ?auto_151019 ) ( not ( = ?auto_151019 ?auto_151004 ) ) ( ON_BOARD ?auto_151015 ?auto_151014 ) ( not ( = ?auto_151021 ?auto_151015 ) ) ( SUPPORTS ?auto_151015 ?auto_151005 ) ( CALIBRATION_TARGET ?auto_151015 ?auto_151019 ) ( not ( = ?auto_151019 ?auto_151010 ) ) ( ON_BOARD ?auto_151020 ?auto_151014 ) ( not ( = ?auto_151015 ?auto_151020 ) ) ( SUPPORTS ?auto_151020 ?auto_151011 ) ( CALIBRATION_TARGET ?auto_151020 ?auto_151019 ) ( not ( = ?auto_151019 ?auto_151012 ) ) ( ON_BOARD ?auto_151016 ?auto_151014 ) ( not ( = ?auto_151020 ?auto_151016 ) ) ( SUPPORTS ?auto_151016 ?auto_151013 ) ( CALIBRATION_TARGET ?auto_151016 ?auto_151019 ) ( not ( = ?auto_151019 ?auto_151008 ) ) ( ON_BOARD ?auto_151018 ?auto_151014 ) ( not ( = ?auto_151016 ?auto_151018 ) ) ( SUPPORTS ?auto_151018 ?auto_151009 ) ( CALIBRATION_TARGET ?auto_151018 ?auto_151019 ) ( POWER_AVAIL ?auto_151014 ) ( POINTING ?auto_151014 ?auto_151017 ) ( not ( = ?auto_151019 ?auto_151017 ) ) ( not ( = ?auto_151008 ?auto_151017 ) ) ( not ( = ?auto_151009 ?auto_151013 ) ) ( not ( = ?auto_151012 ?auto_151017 ) ) ( not ( = ?auto_151009 ?auto_151011 ) ) ( not ( = ?auto_151013 ?auto_151011 ) ) ( not ( = ?auto_151010 ?auto_151017 ) ) ( not ( = ?auto_151020 ?auto_151018 ) ) ( not ( = ?auto_151009 ?auto_151005 ) ) ( not ( = ?auto_151013 ?auto_151005 ) ) ( not ( = ?auto_151011 ?auto_151005 ) ) ( not ( = ?auto_151004 ?auto_151017 ) ) ( not ( = ?auto_151015 ?auto_151016 ) ) ( not ( = ?auto_151015 ?auto_151018 ) ) ( not ( = ?auto_151009 ?auto_151006 ) ) ( not ( = ?auto_151013 ?auto_151006 ) ) ( not ( = ?auto_151011 ?auto_151006 ) ) ( not ( = ?auto_151005 ?auto_151006 ) ) ( not ( = ?auto_151007 ?auto_151017 ) ) ( not ( = ?auto_151021 ?auto_151020 ) ) ( not ( = ?auto_151021 ?auto_151016 ) ) ( not ( = ?auto_151021 ?auto_151018 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_151008 ?auto_151009 ?auto_151012 ?auto_151013 ?auto_151010 ?auto_151011 ?auto_151007 ?auto_151006 ?auto_151004 ?auto_151005 )
      ( GET-5IMAGE-VERIFY ?auto_151004 ?auto_151005 ?auto_151007 ?auto_151006 ?auto_151008 ?auto_151009 ?auto_151010 ?auto_151011 ?auto_151012 ?auto_151013 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_151334 - DIRECTION
      ?auto_151335 - MODE
      ?auto_151337 - DIRECTION
      ?auto_151336 - MODE
      ?auto_151338 - DIRECTION
      ?auto_151339 - MODE
      ?auto_151340 - DIRECTION
      ?auto_151341 - MODE
      ?auto_151342 - DIRECTION
      ?auto_151343 - MODE
    )
    :vars
    (
      ?auto_151351 - INSTRUMENT
      ?auto_151344 - SATELLITE
      ?auto_151349 - DIRECTION
      ?auto_151345 - INSTRUMENT
      ?auto_151350 - INSTRUMENT
      ?auto_151346 - INSTRUMENT
      ?auto_151348 - INSTRUMENT
      ?auto_151347 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_151337 ?auto_151334 ) ) ( not ( = ?auto_151338 ?auto_151334 ) ) ( not ( = ?auto_151338 ?auto_151337 ) ) ( not ( = ?auto_151340 ?auto_151334 ) ) ( not ( = ?auto_151340 ?auto_151337 ) ) ( not ( = ?auto_151340 ?auto_151338 ) ) ( not ( = ?auto_151342 ?auto_151334 ) ) ( not ( = ?auto_151342 ?auto_151337 ) ) ( not ( = ?auto_151342 ?auto_151338 ) ) ( not ( = ?auto_151342 ?auto_151340 ) ) ( ON_BOARD ?auto_151351 ?auto_151344 ) ( SUPPORTS ?auto_151351 ?auto_151336 ) ( not ( = ?auto_151337 ?auto_151349 ) ) ( CALIBRATION_TARGET ?auto_151351 ?auto_151349 ) ( not ( = ?auto_151349 ?auto_151334 ) ) ( ON_BOARD ?auto_151345 ?auto_151344 ) ( not ( = ?auto_151351 ?auto_151345 ) ) ( SUPPORTS ?auto_151345 ?auto_151335 ) ( CALIBRATION_TARGET ?auto_151345 ?auto_151349 ) ( not ( = ?auto_151349 ?auto_151342 ) ) ( ON_BOARD ?auto_151350 ?auto_151344 ) ( not ( = ?auto_151345 ?auto_151350 ) ) ( SUPPORTS ?auto_151350 ?auto_151343 ) ( CALIBRATION_TARGET ?auto_151350 ?auto_151349 ) ( not ( = ?auto_151349 ?auto_151338 ) ) ( ON_BOARD ?auto_151346 ?auto_151344 ) ( not ( = ?auto_151350 ?auto_151346 ) ) ( SUPPORTS ?auto_151346 ?auto_151339 ) ( CALIBRATION_TARGET ?auto_151346 ?auto_151349 ) ( not ( = ?auto_151349 ?auto_151340 ) ) ( ON_BOARD ?auto_151348 ?auto_151344 ) ( not ( = ?auto_151346 ?auto_151348 ) ) ( SUPPORTS ?auto_151348 ?auto_151341 ) ( CALIBRATION_TARGET ?auto_151348 ?auto_151349 ) ( POWER_AVAIL ?auto_151344 ) ( POINTING ?auto_151344 ?auto_151347 ) ( not ( = ?auto_151349 ?auto_151347 ) ) ( not ( = ?auto_151340 ?auto_151347 ) ) ( not ( = ?auto_151341 ?auto_151339 ) ) ( not ( = ?auto_151338 ?auto_151347 ) ) ( not ( = ?auto_151341 ?auto_151343 ) ) ( not ( = ?auto_151339 ?auto_151343 ) ) ( not ( = ?auto_151342 ?auto_151347 ) ) ( not ( = ?auto_151350 ?auto_151348 ) ) ( not ( = ?auto_151341 ?auto_151335 ) ) ( not ( = ?auto_151339 ?auto_151335 ) ) ( not ( = ?auto_151343 ?auto_151335 ) ) ( not ( = ?auto_151334 ?auto_151347 ) ) ( not ( = ?auto_151345 ?auto_151346 ) ) ( not ( = ?auto_151345 ?auto_151348 ) ) ( not ( = ?auto_151341 ?auto_151336 ) ) ( not ( = ?auto_151339 ?auto_151336 ) ) ( not ( = ?auto_151343 ?auto_151336 ) ) ( not ( = ?auto_151335 ?auto_151336 ) ) ( not ( = ?auto_151337 ?auto_151347 ) ) ( not ( = ?auto_151351 ?auto_151350 ) ) ( not ( = ?auto_151351 ?auto_151346 ) ) ( not ( = ?auto_151351 ?auto_151348 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_151340 ?auto_151341 ?auto_151338 ?auto_151339 ?auto_151342 ?auto_151343 ?auto_151337 ?auto_151336 ?auto_151334 ?auto_151335 )
      ( GET-5IMAGE-VERIFY ?auto_151334 ?auto_151335 ?auto_151337 ?auto_151336 ?auto_151338 ?auto_151339 ?auto_151340 ?auto_151341 ?auto_151342 ?auto_151343 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_151498 - DIRECTION
      ?auto_151499 - MODE
      ?auto_151501 - DIRECTION
      ?auto_151500 - MODE
      ?auto_151502 - DIRECTION
      ?auto_151503 - MODE
      ?auto_151504 - DIRECTION
      ?auto_151505 - MODE
      ?auto_151506 - DIRECTION
      ?auto_151507 - MODE
    )
    :vars
    (
      ?auto_151515 - INSTRUMENT
      ?auto_151508 - SATELLITE
      ?auto_151513 - DIRECTION
      ?auto_151509 - INSTRUMENT
      ?auto_151514 - INSTRUMENT
      ?auto_151510 - INSTRUMENT
      ?auto_151512 - INSTRUMENT
      ?auto_151511 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_151501 ?auto_151498 ) ) ( not ( = ?auto_151502 ?auto_151498 ) ) ( not ( = ?auto_151502 ?auto_151501 ) ) ( not ( = ?auto_151504 ?auto_151498 ) ) ( not ( = ?auto_151504 ?auto_151501 ) ) ( not ( = ?auto_151504 ?auto_151502 ) ) ( not ( = ?auto_151506 ?auto_151498 ) ) ( not ( = ?auto_151506 ?auto_151501 ) ) ( not ( = ?auto_151506 ?auto_151502 ) ) ( not ( = ?auto_151506 ?auto_151504 ) ) ( ON_BOARD ?auto_151515 ?auto_151508 ) ( SUPPORTS ?auto_151515 ?auto_151500 ) ( not ( = ?auto_151501 ?auto_151513 ) ) ( CALIBRATION_TARGET ?auto_151515 ?auto_151513 ) ( not ( = ?auto_151513 ?auto_151498 ) ) ( ON_BOARD ?auto_151509 ?auto_151508 ) ( not ( = ?auto_151515 ?auto_151509 ) ) ( SUPPORTS ?auto_151509 ?auto_151499 ) ( CALIBRATION_TARGET ?auto_151509 ?auto_151513 ) ( not ( = ?auto_151513 ?auto_151504 ) ) ( ON_BOARD ?auto_151514 ?auto_151508 ) ( not ( = ?auto_151509 ?auto_151514 ) ) ( SUPPORTS ?auto_151514 ?auto_151505 ) ( CALIBRATION_TARGET ?auto_151514 ?auto_151513 ) ( not ( = ?auto_151513 ?auto_151502 ) ) ( ON_BOARD ?auto_151510 ?auto_151508 ) ( not ( = ?auto_151514 ?auto_151510 ) ) ( SUPPORTS ?auto_151510 ?auto_151503 ) ( CALIBRATION_TARGET ?auto_151510 ?auto_151513 ) ( not ( = ?auto_151513 ?auto_151506 ) ) ( ON_BOARD ?auto_151512 ?auto_151508 ) ( not ( = ?auto_151510 ?auto_151512 ) ) ( SUPPORTS ?auto_151512 ?auto_151507 ) ( CALIBRATION_TARGET ?auto_151512 ?auto_151513 ) ( POWER_AVAIL ?auto_151508 ) ( POINTING ?auto_151508 ?auto_151511 ) ( not ( = ?auto_151513 ?auto_151511 ) ) ( not ( = ?auto_151506 ?auto_151511 ) ) ( not ( = ?auto_151507 ?auto_151503 ) ) ( not ( = ?auto_151502 ?auto_151511 ) ) ( not ( = ?auto_151507 ?auto_151505 ) ) ( not ( = ?auto_151503 ?auto_151505 ) ) ( not ( = ?auto_151504 ?auto_151511 ) ) ( not ( = ?auto_151514 ?auto_151512 ) ) ( not ( = ?auto_151507 ?auto_151499 ) ) ( not ( = ?auto_151503 ?auto_151499 ) ) ( not ( = ?auto_151505 ?auto_151499 ) ) ( not ( = ?auto_151498 ?auto_151511 ) ) ( not ( = ?auto_151509 ?auto_151510 ) ) ( not ( = ?auto_151509 ?auto_151512 ) ) ( not ( = ?auto_151507 ?auto_151500 ) ) ( not ( = ?auto_151503 ?auto_151500 ) ) ( not ( = ?auto_151505 ?auto_151500 ) ) ( not ( = ?auto_151499 ?auto_151500 ) ) ( not ( = ?auto_151501 ?auto_151511 ) ) ( not ( = ?auto_151515 ?auto_151514 ) ) ( not ( = ?auto_151515 ?auto_151510 ) ) ( not ( = ?auto_151515 ?auto_151512 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_151506 ?auto_151507 ?auto_151502 ?auto_151503 ?auto_151504 ?auto_151505 ?auto_151501 ?auto_151500 ?auto_151498 ?auto_151499 )
      ( GET-5IMAGE-VERIFY ?auto_151498 ?auto_151499 ?auto_151501 ?auto_151500 ?auto_151502 ?auto_151503 ?auto_151504 ?auto_151505 ?auto_151506 ?auto_151507 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_151828 - DIRECTION
      ?auto_151829 - MODE
      ?auto_151831 - DIRECTION
      ?auto_151830 - MODE
      ?auto_151832 - DIRECTION
      ?auto_151833 - MODE
      ?auto_151834 - DIRECTION
      ?auto_151835 - MODE
      ?auto_151836 - DIRECTION
      ?auto_151837 - MODE
    )
    :vars
    (
      ?auto_151845 - INSTRUMENT
      ?auto_151838 - SATELLITE
      ?auto_151843 - DIRECTION
      ?auto_151839 - INSTRUMENT
      ?auto_151844 - INSTRUMENT
      ?auto_151840 - INSTRUMENT
      ?auto_151842 - INSTRUMENT
      ?auto_151841 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_151831 ?auto_151828 ) ) ( not ( = ?auto_151832 ?auto_151828 ) ) ( not ( = ?auto_151832 ?auto_151831 ) ) ( not ( = ?auto_151834 ?auto_151828 ) ) ( not ( = ?auto_151834 ?auto_151831 ) ) ( not ( = ?auto_151834 ?auto_151832 ) ) ( not ( = ?auto_151836 ?auto_151828 ) ) ( not ( = ?auto_151836 ?auto_151831 ) ) ( not ( = ?auto_151836 ?auto_151832 ) ) ( not ( = ?auto_151836 ?auto_151834 ) ) ( ON_BOARD ?auto_151845 ?auto_151838 ) ( SUPPORTS ?auto_151845 ?auto_151830 ) ( not ( = ?auto_151831 ?auto_151843 ) ) ( CALIBRATION_TARGET ?auto_151845 ?auto_151843 ) ( not ( = ?auto_151843 ?auto_151828 ) ) ( ON_BOARD ?auto_151839 ?auto_151838 ) ( not ( = ?auto_151845 ?auto_151839 ) ) ( SUPPORTS ?auto_151839 ?auto_151829 ) ( CALIBRATION_TARGET ?auto_151839 ?auto_151843 ) ( not ( = ?auto_151843 ?auto_151832 ) ) ( ON_BOARD ?auto_151844 ?auto_151838 ) ( not ( = ?auto_151839 ?auto_151844 ) ) ( SUPPORTS ?auto_151844 ?auto_151833 ) ( CALIBRATION_TARGET ?auto_151844 ?auto_151843 ) ( not ( = ?auto_151843 ?auto_151836 ) ) ( ON_BOARD ?auto_151840 ?auto_151838 ) ( not ( = ?auto_151844 ?auto_151840 ) ) ( SUPPORTS ?auto_151840 ?auto_151837 ) ( CALIBRATION_TARGET ?auto_151840 ?auto_151843 ) ( not ( = ?auto_151843 ?auto_151834 ) ) ( ON_BOARD ?auto_151842 ?auto_151838 ) ( not ( = ?auto_151840 ?auto_151842 ) ) ( SUPPORTS ?auto_151842 ?auto_151835 ) ( CALIBRATION_TARGET ?auto_151842 ?auto_151843 ) ( POWER_AVAIL ?auto_151838 ) ( POINTING ?auto_151838 ?auto_151841 ) ( not ( = ?auto_151843 ?auto_151841 ) ) ( not ( = ?auto_151834 ?auto_151841 ) ) ( not ( = ?auto_151835 ?auto_151837 ) ) ( not ( = ?auto_151836 ?auto_151841 ) ) ( not ( = ?auto_151835 ?auto_151833 ) ) ( not ( = ?auto_151837 ?auto_151833 ) ) ( not ( = ?auto_151832 ?auto_151841 ) ) ( not ( = ?auto_151844 ?auto_151842 ) ) ( not ( = ?auto_151835 ?auto_151829 ) ) ( not ( = ?auto_151837 ?auto_151829 ) ) ( not ( = ?auto_151833 ?auto_151829 ) ) ( not ( = ?auto_151828 ?auto_151841 ) ) ( not ( = ?auto_151839 ?auto_151840 ) ) ( not ( = ?auto_151839 ?auto_151842 ) ) ( not ( = ?auto_151835 ?auto_151830 ) ) ( not ( = ?auto_151837 ?auto_151830 ) ) ( not ( = ?auto_151833 ?auto_151830 ) ) ( not ( = ?auto_151829 ?auto_151830 ) ) ( not ( = ?auto_151831 ?auto_151841 ) ) ( not ( = ?auto_151845 ?auto_151844 ) ) ( not ( = ?auto_151845 ?auto_151840 ) ) ( not ( = ?auto_151845 ?auto_151842 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_151834 ?auto_151835 ?auto_151836 ?auto_151837 ?auto_151832 ?auto_151833 ?auto_151831 ?auto_151830 ?auto_151828 ?auto_151829 )
      ( GET-5IMAGE-VERIFY ?auto_151828 ?auto_151829 ?auto_151831 ?auto_151830 ?auto_151832 ?auto_151833 ?auto_151834 ?auto_151835 ?auto_151836 ?auto_151837 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_151906 - DIRECTION
      ?auto_151907 - MODE
      ?auto_151909 - DIRECTION
      ?auto_151908 - MODE
      ?auto_151910 - DIRECTION
      ?auto_151911 - MODE
      ?auto_151912 - DIRECTION
      ?auto_151913 - MODE
      ?auto_151914 - DIRECTION
      ?auto_151915 - MODE
    )
    :vars
    (
      ?auto_151923 - INSTRUMENT
      ?auto_151916 - SATELLITE
      ?auto_151921 - DIRECTION
      ?auto_151917 - INSTRUMENT
      ?auto_151922 - INSTRUMENT
      ?auto_151918 - INSTRUMENT
      ?auto_151920 - INSTRUMENT
      ?auto_151919 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_151909 ?auto_151906 ) ) ( not ( = ?auto_151910 ?auto_151906 ) ) ( not ( = ?auto_151910 ?auto_151909 ) ) ( not ( = ?auto_151912 ?auto_151906 ) ) ( not ( = ?auto_151912 ?auto_151909 ) ) ( not ( = ?auto_151912 ?auto_151910 ) ) ( not ( = ?auto_151914 ?auto_151906 ) ) ( not ( = ?auto_151914 ?auto_151909 ) ) ( not ( = ?auto_151914 ?auto_151910 ) ) ( not ( = ?auto_151914 ?auto_151912 ) ) ( ON_BOARD ?auto_151923 ?auto_151916 ) ( SUPPORTS ?auto_151923 ?auto_151908 ) ( not ( = ?auto_151909 ?auto_151921 ) ) ( CALIBRATION_TARGET ?auto_151923 ?auto_151921 ) ( not ( = ?auto_151921 ?auto_151906 ) ) ( ON_BOARD ?auto_151917 ?auto_151916 ) ( not ( = ?auto_151923 ?auto_151917 ) ) ( SUPPORTS ?auto_151917 ?auto_151907 ) ( CALIBRATION_TARGET ?auto_151917 ?auto_151921 ) ( not ( = ?auto_151921 ?auto_151910 ) ) ( ON_BOARD ?auto_151922 ?auto_151916 ) ( not ( = ?auto_151917 ?auto_151922 ) ) ( SUPPORTS ?auto_151922 ?auto_151911 ) ( CALIBRATION_TARGET ?auto_151922 ?auto_151921 ) ( not ( = ?auto_151921 ?auto_151912 ) ) ( ON_BOARD ?auto_151918 ?auto_151916 ) ( not ( = ?auto_151922 ?auto_151918 ) ) ( SUPPORTS ?auto_151918 ?auto_151913 ) ( CALIBRATION_TARGET ?auto_151918 ?auto_151921 ) ( not ( = ?auto_151921 ?auto_151914 ) ) ( ON_BOARD ?auto_151920 ?auto_151916 ) ( not ( = ?auto_151918 ?auto_151920 ) ) ( SUPPORTS ?auto_151920 ?auto_151915 ) ( CALIBRATION_TARGET ?auto_151920 ?auto_151921 ) ( POWER_AVAIL ?auto_151916 ) ( POINTING ?auto_151916 ?auto_151919 ) ( not ( = ?auto_151921 ?auto_151919 ) ) ( not ( = ?auto_151914 ?auto_151919 ) ) ( not ( = ?auto_151915 ?auto_151913 ) ) ( not ( = ?auto_151912 ?auto_151919 ) ) ( not ( = ?auto_151915 ?auto_151911 ) ) ( not ( = ?auto_151913 ?auto_151911 ) ) ( not ( = ?auto_151910 ?auto_151919 ) ) ( not ( = ?auto_151922 ?auto_151920 ) ) ( not ( = ?auto_151915 ?auto_151907 ) ) ( not ( = ?auto_151913 ?auto_151907 ) ) ( not ( = ?auto_151911 ?auto_151907 ) ) ( not ( = ?auto_151906 ?auto_151919 ) ) ( not ( = ?auto_151917 ?auto_151918 ) ) ( not ( = ?auto_151917 ?auto_151920 ) ) ( not ( = ?auto_151915 ?auto_151908 ) ) ( not ( = ?auto_151913 ?auto_151908 ) ) ( not ( = ?auto_151911 ?auto_151908 ) ) ( not ( = ?auto_151907 ?auto_151908 ) ) ( not ( = ?auto_151909 ?auto_151919 ) ) ( not ( = ?auto_151923 ?auto_151922 ) ) ( not ( = ?auto_151923 ?auto_151918 ) ) ( not ( = ?auto_151923 ?auto_151920 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_151914 ?auto_151915 ?auto_151912 ?auto_151913 ?auto_151910 ?auto_151911 ?auto_151909 ?auto_151908 ?auto_151906 ?auto_151907 )
      ( GET-5IMAGE-VERIFY ?auto_151906 ?auto_151907 ?auto_151909 ?auto_151908 ?auto_151910 ?auto_151911 ?auto_151912 ?auto_151913 ?auto_151914 ?auto_151915 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_154232 - DIRECTION
      ?auto_154233 - MODE
      ?auto_154235 - DIRECTION
      ?auto_154234 - MODE
      ?auto_154236 - DIRECTION
      ?auto_154237 - MODE
      ?auto_154238 - DIRECTION
      ?auto_154239 - MODE
      ?auto_154240 - DIRECTION
      ?auto_154241 - MODE
    )
    :vars
    (
      ?auto_154249 - INSTRUMENT
      ?auto_154242 - SATELLITE
      ?auto_154247 - DIRECTION
      ?auto_154243 - INSTRUMENT
      ?auto_154248 - INSTRUMENT
      ?auto_154244 - INSTRUMENT
      ?auto_154246 - INSTRUMENT
      ?auto_154245 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_154235 ?auto_154232 ) ) ( not ( = ?auto_154236 ?auto_154232 ) ) ( not ( = ?auto_154236 ?auto_154235 ) ) ( not ( = ?auto_154238 ?auto_154232 ) ) ( not ( = ?auto_154238 ?auto_154235 ) ) ( not ( = ?auto_154238 ?auto_154236 ) ) ( not ( = ?auto_154240 ?auto_154232 ) ) ( not ( = ?auto_154240 ?auto_154235 ) ) ( not ( = ?auto_154240 ?auto_154236 ) ) ( not ( = ?auto_154240 ?auto_154238 ) ) ( ON_BOARD ?auto_154249 ?auto_154242 ) ( SUPPORTS ?auto_154249 ?auto_154233 ) ( not ( = ?auto_154232 ?auto_154247 ) ) ( CALIBRATION_TARGET ?auto_154249 ?auto_154247 ) ( not ( = ?auto_154247 ?auto_154240 ) ) ( ON_BOARD ?auto_154243 ?auto_154242 ) ( not ( = ?auto_154249 ?auto_154243 ) ) ( SUPPORTS ?auto_154243 ?auto_154241 ) ( CALIBRATION_TARGET ?auto_154243 ?auto_154247 ) ( not ( = ?auto_154247 ?auto_154238 ) ) ( ON_BOARD ?auto_154248 ?auto_154242 ) ( not ( = ?auto_154243 ?auto_154248 ) ) ( SUPPORTS ?auto_154248 ?auto_154239 ) ( CALIBRATION_TARGET ?auto_154248 ?auto_154247 ) ( not ( = ?auto_154247 ?auto_154236 ) ) ( ON_BOARD ?auto_154244 ?auto_154242 ) ( not ( = ?auto_154248 ?auto_154244 ) ) ( SUPPORTS ?auto_154244 ?auto_154237 ) ( CALIBRATION_TARGET ?auto_154244 ?auto_154247 ) ( not ( = ?auto_154247 ?auto_154235 ) ) ( ON_BOARD ?auto_154246 ?auto_154242 ) ( not ( = ?auto_154244 ?auto_154246 ) ) ( SUPPORTS ?auto_154246 ?auto_154234 ) ( CALIBRATION_TARGET ?auto_154246 ?auto_154247 ) ( POWER_AVAIL ?auto_154242 ) ( POINTING ?auto_154242 ?auto_154245 ) ( not ( = ?auto_154247 ?auto_154245 ) ) ( not ( = ?auto_154235 ?auto_154245 ) ) ( not ( = ?auto_154234 ?auto_154237 ) ) ( not ( = ?auto_154236 ?auto_154245 ) ) ( not ( = ?auto_154234 ?auto_154239 ) ) ( not ( = ?auto_154237 ?auto_154239 ) ) ( not ( = ?auto_154238 ?auto_154245 ) ) ( not ( = ?auto_154248 ?auto_154246 ) ) ( not ( = ?auto_154234 ?auto_154241 ) ) ( not ( = ?auto_154237 ?auto_154241 ) ) ( not ( = ?auto_154239 ?auto_154241 ) ) ( not ( = ?auto_154240 ?auto_154245 ) ) ( not ( = ?auto_154243 ?auto_154244 ) ) ( not ( = ?auto_154243 ?auto_154246 ) ) ( not ( = ?auto_154234 ?auto_154233 ) ) ( not ( = ?auto_154237 ?auto_154233 ) ) ( not ( = ?auto_154239 ?auto_154233 ) ) ( not ( = ?auto_154241 ?auto_154233 ) ) ( not ( = ?auto_154232 ?auto_154245 ) ) ( not ( = ?auto_154249 ?auto_154248 ) ) ( not ( = ?auto_154249 ?auto_154244 ) ) ( not ( = ?auto_154249 ?auto_154246 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_154235 ?auto_154234 ?auto_154236 ?auto_154237 ?auto_154238 ?auto_154239 ?auto_154232 ?auto_154233 ?auto_154240 ?auto_154241 )
      ( GET-5IMAGE-VERIFY ?auto_154232 ?auto_154233 ?auto_154235 ?auto_154234 ?auto_154236 ?auto_154237 ?auto_154238 ?auto_154239 ?auto_154240 ?auto_154241 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_154310 - DIRECTION
      ?auto_154311 - MODE
      ?auto_154313 - DIRECTION
      ?auto_154312 - MODE
      ?auto_154314 - DIRECTION
      ?auto_154315 - MODE
      ?auto_154316 - DIRECTION
      ?auto_154317 - MODE
      ?auto_154318 - DIRECTION
      ?auto_154319 - MODE
    )
    :vars
    (
      ?auto_154327 - INSTRUMENT
      ?auto_154320 - SATELLITE
      ?auto_154325 - DIRECTION
      ?auto_154321 - INSTRUMENT
      ?auto_154326 - INSTRUMENT
      ?auto_154322 - INSTRUMENT
      ?auto_154324 - INSTRUMENT
      ?auto_154323 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_154313 ?auto_154310 ) ) ( not ( = ?auto_154314 ?auto_154310 ) ) ( not ( = ?auto_154314 ?auto_154313 ) ) ( not ( = ?auto_154316 ?auto_154310 ) ) ( not ( = ?auto_154316 ?auto_154313 ) ) ( not ( = ?auto_154316 ?auto_154314 ) ) ( not ( = ?auto_154318 ?auto_154310 ) ) ( not ( = ?auto_154318 ?auto_154313 ) ) ( not ( = ?auto_154318 ?auto_154314 ) ) ( not ( = ?auto_154318 ?auto_154316 ) ) ( ON_BOARD ?auto_154327 ?auto_154320 ) ( SUPPORTS ?auto_154327 ?auto_154311 ) ( not ( = ?auto_154310 ?auto_154325 ) ) ( CALIBRATION_TARGET ?auto_154327 ?auto_154325 ) ( not ( = ?auto_154325 ?auto_154316 ) ) ( ON_BOARD ?auto_154321 ?auto_154320 ) ( not ( = ?auto_154327 ?auto_154321 ) ) ( SUPPORTS ?auto_154321 ?auto_154317 ) ( CALIBRATION_TARGET ?auto_154321 ?auto_154325 ) ( not ( = ?auto_154325 ?auto_154318 ) ) ( ON_BOARD ?auto_154326 ?auto_154320 ) ( not ( = ?auto_154321 ?auto_154326 ) ) ( SUPPORTS ?auto_154326 ?auto_154319 ) ( CALIBRATION_TARGET ?auto_154326 ?auto_154325 ) ( not ( = ?auto_154325 ?auto_154314 ) ) ( ON_BOARD ?auto_154322 ?auto_154320 ) ( not ( = ?auto_154326 ?auto_154322 ) ) ( SUPPORTS ?auto_154322 ?auto_154315 ) ( CALIBRATION_TARGET ?auto_154322 ?auto_154325 ) ( not ( = ?auto_154325 ?auto_154313 ) ) ( ON_BOARD ?auto_154324 ?auto_154320 ) ( not ( = ?auto_154322 ?auto_154324 ) ) ( SUPPORTS ?auto_154324 ?auto_154312 ) ( CALIBRATION_TARGET ?auto_154324 ?auto_154325 ) ( POWER_AVAIL ?auto_154320 ) ( POINTING ?auto_154320 ?auto_154323 ) ( not ( = ?auto_154325 ?auto_154323 ) ) ( not ( = ?auto_154313 ?auto_154323 ) ) ( not ( = ?auto_154312 ?auto_154315 ) ) ( not ( = ?auto_154314 ?auto_154323 ) ) ( not ( = ?auto_154312 ?auto_154319 ) ) ( not ( = ?auto_154315 ?auto_154319 ) ) ( not ( = ?auto_154318 ?auto_154323 ) ) ( not ( = ?auto_154326 ?auto_154324 ) ) ( not ( = ?auto_154312 ?auto_154317 ) ) ( not ( = ?auto_154315 ?auto_154317 ) ) ( not ( = ?auto_154319 ?auto_154317 ) ) ( not ( = ?auto_154316 ?auto_154323 ) ) ( not ( = ?auto_154321 ?auto_154322 ) ) ( not ( = ?auto_154321 ?auto_154324 ) ) ( not ( = ?auto_154312 ?auto_154311 ) ) ( not ( = ?auto_154315 ?auto_154311 ) ) ( not ( = ?auto_154319 ?auto_154311 ) ) ( not ( = ?auto_154317 ?auto_154311 ) ) ( not ( = ?auto_154310 ?auto_154323 ) ) ( not ( = ?auto_154327 ?auto_154326 ) ) ( not ( = ?auto_154327 ?auto_154322 ) ) ( not ( = ?auto_154327 ?auto_154324 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_154313 ?auto_154312 ?auto_154314 ?auto_154315 ?auto_154318 ?auto_154319 ?auto_154310 ?auto_154311 ?auto_154316 ?auto_154317 )
      ( GET-5IMAGE-VERIFY ?auto_154310 ?auto_154311 ?auto_154313 ?auto_154312 ?auto_154314 ?auto_154315 ?auto_154316 ?auto_154317 ?auto_154318 ?auto_154319 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_154640 - DIRECTION
      ?auto_154641 - MODE
      ?auto_154643 - DIRECTION
      ?auto_154642 - MODE
      ?auto_154644 - DIRECTION
      ?auto_154645 - MODE
      ?auto_154646 - DIRECTION
      ?auto_154647 - MODE
      ?auto_154648 - DIRECTION
      ?auto_154649 - MODE
    )
    :vars
    (
      ?auto_154657 - INSTRUMENT
      ?auto_154650 - SATELLITE
      ?auto_154655 - DIRECTION
      ?auto_154651 - INSTRUMENT
      ?auto_154656 - INSTRUMENT
      ?auto_154652 - INSTRUMENT
      ?auto_154654 - INSTRUMENT
      ?auto_154653 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_154643 ?auto_154640 ) ) ( not ( = ?auto_154644 ?auto_154640 ) ) ( not ( = ?auto_154644 ?auto_154643 ) ) ( not ( = ?auto_154646 ?auto_154640 ) ) ( not ( = ?auto_154646 ?auto_154643 ) ) ( not ( = ?auto_154646 ?auto_154644 ) ) ( not ( = ?auto_154648 ?auto_154640 ) ) ( not ( = ?auto_154648 ?auto_154643 ) ) ( not ( = ?auto_154648 ?auto_154644 ) ) ( not ( = ?auto_154648 ?auto_154646 ) ) ( ON_BOARD ?auto_154657 ?auto_154650 ) ( SUPPORTS ?auto_154657 ?auto_154641 ) ( not ( = ?auto_154640 ?auto_154655 ) ) ( CALIBRATION_TARGET ?auto_154657 ?auto_154655 ) ( not ( = ?auto_154655 ?auto_154648 ) ) ( ON_BOARD ?auto_154651 ?auto_154650 ) ( not ( = ?auto_154657 ?auto_154651 ) ) ( SUPPORTS ?auto_154651 ?auto_154649 ) ( CALIBRATION_TARGET ?auto_154651 ?auto_154655 ) ( not ( = ?auto_154655 ?auto_154644 ) ) ( ON_BOARD ?auto_154656 ?auto_154650 ) ( not ( = ?auto_154651 ?auto_154656 ) ) ( SUPPORTS ?auto_154656 ?auto_154645 ) ( CALIBRATION_TARGET ?auto_154656 ?auto_154655 ) ( not ( = ?auto_154655 ?auto_154646 ) ) ( ON_BOARD ?auto_154652 ?auto_154650 ) ( not ( = ?auto_154656 ?auto_154652 ) ) ( SUPPORTS ?auto_154652 ?auto_154647 ) ( CALIBRATION_TARGET ?auto_154652 ?auto_154655 ) ( not ( = ?auto_154655 ?auto_154643 ) ) ( ON_BOARD ?auto_154654 ?auto_154650 ) ( not ( = ?auto_154652 ?auto_154654 ) ) ( SUPPORTS ?auto_154654 ?auto_154642 ) ( CALIBRATION_TARGET ?auto_154654 ?auto_154655 ) ( POWER_AVAIL ?auto_154650 ) ( POINTING ?auto_154650 ?auto_154653 ) ( not ( = ?auto_154655 ?auto_154653 ) ) ( not ( = ?auto_154643 ?auto_154653 ) ) ( not ( = ?auto_154642 ?auto_154647 ) ) ( not ( = ?auto_154646 ?auto_154653 ) ) ( not ( = ?auto_154642 ?auto_154645 ) ) ( not ( = ?auto_154647 ?auto_154645 ) ) ( not ( = ?auto_154644 ?auto_154653 ) ) ( not ( = ?auto_154656 ?auto_154654 ) ) ( not ( = ?auto_154642 ?auto_154649 ) ) ( not ( = ?auto_154647 ?auto_154649 ) ) ( not ( = ?auto_154645 ?auto_154649 ) ) ( not ( = ?auto_154648 ?auto_154653 ) ) ( not ( = ?auto_154651 ?auto_154652 ) ) ( not ( = ?auto_154651 ?auto_154654 ) ) ( not ( = ?auto_154642 ?auto_154641 ) ) ( not ( = ?auto_154647 ?auto_154641 ) ) ( not ( = ?auto_154645 ?auto_154641 ) ) ( not ( = ?auto_154649 ?auto_154641 ) ) ( not ( = ?auto_154640 ?auto_154653 ) ) ( not ( = ?auto_154657 ?auto_154656 ) ) ( not ( = ?auto_154657 ?auto_154652 ) ) ( not ( = ?auto_154657 ?auto_154654 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_154643 ?auto_154642 ?auto_154646 ?auto_154647 ?auto_154644 ?auto_154645 ?auto_154640 ?auto_154641 ?auto_154648 ?auto_154649 )
      ( GET-5IMAGE-VERIFY ?auto_154640 ?auto_154641 ?auto_154643 ?auto_154642 ?auto_154644 ?auto_154645 ?auto_154646 ?auto_154647 ?auto_154648 ?auto_154649 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_154804 - DIRECTION
      ?auto_154805 - MODE
      ?auto_154807 - DIRECTION
      ?auto_154806 - MODE
      ?auto_154808 - DIRECTION
      ?auto_154809 - MODE
      ?auto_154810 - DIRECTION
      ?auto_154811 - MODE
      ?auto_154812 - DIRECTION
      ?auto_154813 - MODE
    )
    :vars
    (
      ?auto_154821 - INSTRUMENT
      ?auto_154814 - SATELLITE
      ?auto_154819 - DIRECTION
      ?auto_154815 - INSTRUMENT
      ?auto_154820 - INSTRUMENT
      ?auto_154816 - INSTRUMENT
      ?auto_154818 - INSTRUMENT
      ?auto_154817 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_154807 ?auto_154804 ) ) ( not ( = ?auto_154808 ?auto_154804 ) ) ( not ( = ?auto_154808 ?auto_154807 ) ) ( not ( = ?auto_154810 ?auto_154804 ) ) ( not ( = ?auto_154810 ?auto_154807 ) ) ( not ( = ?auto_154810 ?auto_154808 ) ) ( not ( = ?auto_154812 ?auto_154804 ) ) ( not ( = ?auto_154812 ?auto_154807 ) ) ( not ( = ?auto_154812 ?auto_154808 ) ) ( not ( = ?auto_154812 ?auto_154810 ) ) ( ON_BOARD ?auto_154821 ?auto_154814 ) ( SUPPORTS ?auto_154821 ?auto_154805 ) ( not ( = ?auto_154804 ?auto_154819 ) ) ( CALIBRATION_TARGET ?auto_154821 ?auto_154819 ) ( not ( = ?auto_154819 ?auto_154810 ) ) ( ON_BOARD ?auto_154815 ?auto_154814 ) ( not ( = ?auto_154821 ?auto_154815 ) ) ( SUPPORTS ?auto_154815 ?auto_154811 ) ( CALIBRATION_TARGET ?auto_154815 ?auto_154819 ) ( not ( = ?auto_154819 ?auto_154808 ) ) ( ON_BOARD ?auto_154820 ?auto_154814 ) ( not ( = ?auto_154815 ?auto_154820 ) ) ( SUPPORTS ?auto_154820 ?auto_154809 ) ( CALIBRATION_TARGET ?auto_154820 ?auto_154819 ) ( not ( = ?auto_154819 ?auto_154812 ) ) ( ON_BOARD ?auto_154816 ?auto_154814 ) ( not ( = ?auto_154820 ?auto_154816 ) ) ( SUPPORTS ?auto_154816 ?auto_154813 ) ( CALIBRATION_TARGET ?auto_154816 ?auto_154819 ) ( not ( = ?auto_154819 ?auto_154807 ) ) ( ON_BOARD ?auto_154818 ?auto_154814 ) ( not ( = ?auto_154816 ?auto_154818 ) ) ( SUPPORTS ?auto_154818 ?auto_154806 ) ( CALIBRATION_TARGET ?auto_154818 ?auto_154819 ) ( POWER_AVAIL ?auto_154814 ) ( POINTING ?auto_154814 ?auto_154817 ) ( not ( = ?auto_154819 ?auto_154817 ) ) ( not ( = ?auto_154807 ?auto_154817 ) ) ( not ( = ?auto_154806 ?auto_154813 ) ) ( not ( = ?auto_154812 ?auto_154817 ) ) ( not ( = ?auto_154806 ?auto_154809 ) ) ( not ( = ?auto_154813 ?auto_154809 ) ) ( not ( = ?auto_154808 ?auto_154817 ) ) ( not ( = ?auto_154820 ?auto_154818 ) ) ( not ( = ?auto_154806 ?auto_154811 ) ) ( not ( = ?auto_154813 ?auto_154811 ) ) ( not ( = ?auto_154809 ?auto_154811 ) ) ( not ( = ?auto_154810 ?auto_154817 ) ) ( not ( = ?auto_154815 ?auto_154816 ) ) ( not ( = ?auto_154815 ?auto_154818 ) ) ( not ( = ?auto_154806 ?auto_154805 ) ) ( not ( = ?auto_154813 ?auto_154805 ) ) ( not ( = ?auto_154809 ?auto_154805 ) ) ( not ( = ?auto_154811 ?auto_154805 ) ) ( not ( = ?auto_154804 ?auto_154817 ) ) ( not ( = ?auto_154821 ?auto_154820 ) ) ( not ( = ?auto_154821 ?auto_154816 ) ) ( not ( = ?auto_154821 ?auto_154818 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_154807 ?auto_154806 ?auto_154812 ?auto_154813 ?auto_154808 ?auto_154809 ?auto_154804 ?auto_154805 ?auto_154810 ?auto_154811 )
      ( GET-5IMAGE-VERIFY ?auto_154804 ?auto_154805 ?auto_154807 ?auto_154806 ?auto_154808 ?auto_154809 ?auto_154810 ?auto_154811 ?auto_154812 ?auto_154813 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_155134 - DIRECTION
      ?auto_155135 - MODE
      ?auto_155137 - DIRECTION
      ?auto_155136 - MODE
      ?auto_155138 - DIRECTION
      ?auto_155139 - MODE
      ?auto_155140 - DIRECTION
      ?auto_155141 - MODE
      ?auto_155142 - DIRECTION
      ?auto_155143 - MODE
    )
    :vars
    (
      ?auto_155151 - INSTRUMENT
      ?auto_155144 - SATELLITE
      ?auto_155149 - DIRECTION
      ?auto_155145 - INSTRUMENT
      ?auto_155150 - INSTRUMENT
      ?auto_155146 - INSTRUMENT
      ?auto_155148 - INSTRUMENT
      ?auto_155147 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_155137 ?auto_155134 ) ) ( not ( = ?auto_155138 ?auto_155134 ) ) ( not ( = ?auto_155138 ?auto_155137 ) ) ( not ( = ?auto_155140 ?auto_155134 ) ) ( not ( = ?auto_155140 ?auto_155137 ) ) ( not ( = ?auto_155140 ?auto_155138 ) ) ( not ( = ?auto_155142 ?auto_155134 ) ) ( not ( = ?auto_155142 ?auto_155137 ) ) ( not ( = ?auto_155142 ?auto_155138 ) ) ( not ( = ?auto_155142 ?auto_155140 ) ) ( ON_BOARD ?auto_155151 ?auto_155144 ) ( SUPPORTS ?auto_155151 ?auto_155135 ) ( not ( = ?auto_155134 ?auto_155149 ) ) ( CALIBRATION_TARGET ?auto_155151 ?auto_155149 ) ( not ( = ?auto_155149 ?auto_155138 ) ) ( ON_BOARD ?auto_155145 ?auto_155144 ) ( not ( = ?auto_155151 ?auto_155145 ) ) ( SUPPORTS ?auto_155145 ?auto_155139 ) ( CALIBRATION_TARGET ?auto_155145 ?auto_155149 ) ( not ( = ?auto_155149 ?auto_155142 ) ) ( ON_BOARD ?auto_155150 ?auto_155144 ) ( not ( = ?auto_155145 ?auto_155150 ) ) ( SUPPORTS ?auto_155150 ?auto_155143 ) ( CALIBRATION_TARGET ?auto_155150 ?auto_155149 ) ( not ( = ?auto_155149 ?auto_155140 ) ) ( ON_BOARD ?auto_155146 ?auto_155144 ) ( not ( = ?auto_155150 ?auto_155146 ) ) ( SUPPORTS ?auto_155146 ?auto_155141 ) ( CALIBRATION_TARGET ?auto_155146 ?auto_155149 ) ( not ( = ?auto_155149 ?auto_155137 ) ) ( ON_BOARD ?auto_155148 ?auto_155144 ) ( not ( = ?auto_155146 ?auto_155148 ) ) ( SUPPORTS ?auto_155148 ?auto_155136 ) ( CALIBRATION_TARGET ?auto_155148 ?auto_155149 ) ( POWER_AVAIL ?auto_155144 ) ( POINTING ?auto_155144 ?auto_155147 ) ( not ( = ?auto_155149 ?auto_155147 ) ) ( not ( = ?auto_155137 ?auto_155147 ) ) ( not ( = ?auto_155136 ?auto_155141 ) ) ( not ( = ?auto_155140 ?auto_155147 ) ) ( not ( = ?auto_155136 ?auto_155143 ) ) ( not ( = ?auto_155141 ?auto_155143 ) ) ( not ( = ?auto_155142 ?auto_155147 ) ) ( not ( = ?auto_155150 ?auto_155148 ) ) ( not ( = ?auto_155136 ?auto_155139 ) ) ( not ( = ?auto_155141 ?auto_155139 ) ) ( not ( = ?auto_155143 ?auto_155139 ) ) ( not ( = ?auto_155138 ?auto_155147 ) ) ( not ( = ?auto_155145 ?auto_155146 ) ) ( not ( = ?auto_155145 ?auto_155148 ) ) ( not ( = ?auto_155136 ?auto_155135 ) ) ( not ( = ?auto_155141 ?auto_155135 ) ) ( not ( = ?auto_155143 ?auto_155135 ) ) ( not ( = ?auto_155139 ?auto_155135 ) ) ( not ( = ?auto_155134 ?auto_155147 ) ) ( not ( = ?auto_155151 ?auto_155150 ) ) ( not ( = ?auto_155151 ?auto_155146 ) ) ( not ( = ?auto_155151 ?auto_155148 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_155137 ?auto_155136 ?auto_155140 ?auto_155141 ?auto_155142 ?auto_155143 ?auto_155134 ?auto_155135 ?auto_155138 ?auto_155139 )
      ( GET-5IMAGE-VERIFY ?auto_155134 ?auto_155135 ?auto_155137 ?auto_155136 ?auto_155138 ?auto_155139 ?auto_155140 ?auto_155141 ?auto_155142 ?auto_155143 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_155212 - DIRECTION
      ?auto_155213 - MODE
      ?auto_155215 - DIRECTION
      ?auto_155214 - MODE
      ?auto_155216 - DIRECTION
      ?auto_155217 - MODE
      ?auto_155218 - DIRECTION
      ?auto_155219 - MODE
      ?auto_155220 - DIRECTION
      ?auto_155221 - MODE
    )
    :vars
    (
      ?auto_155229 - INSTRUMENT
      ?auto_155222 - SATELLITE
      ?auto_155227 - DIRECTION
      ?auto_155223 - INSTRUMENT
      ?auto_155228 - INSTRUMENT
      ?auto_155224 - INSTRUMENT
      ?auto_155226 - INSTRUMENT
      ?auto_155225 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_155215 ?auto_155212 ) ) ( not ( = ?auto_155216 ?auto_155212 ) ) ( not ( = ?auto_155216 ?auto_155215 ) ) ( not ( = ?auto_155218 ?auto_155212 ) ) ( not ( = ?auto_155218 ?auto_155215 ) ) ( not ( = ?auto_155218 ?auto_155216 ) ) ( not ( = ?auto_155220 ?auto_155212 ) ) ( not ( = ?auto_155220 ?auto_155215 ) ) ( not ( = ?auto_155220 ?auto_155216 ) ) ( not ( = ?auto_155220 ?auto_155218 ) ) ( ON_BOARD ?auto_155229 ?auto_155222 ) ( SUPPORTS ?auto_155229 ?auto_155213 ) ( not ( = ?auto_155212 ?auto_155227 ) ) ( CALIBRATION_TARGET ?auto_155229 ?auto_155227 ) ( not ( = ?auto_155227 ?auto_155216 ) ) ( ON_BOARD ?auto_155223 ?auto_155222 ) ( not ( = ?auto_155229 ?auto_155223 ) ) ( SUPPORTS ?auto_155223 ?auto_155217 ) ( CALIBRATION_TARGET ?auto_155223 ?auto_155227 ) ( not ( = ?auto_155227 ?auto_155218 ) ) ( ON_BOARD ?auto_155228 ?auto_155222 ) ( not ( = ?auto_155223 ?auto_155228 ) ) ( SUPPORTS ?auto_155228 ?auto_155219 ) ( CALIBRATION_TARGET ?auto_155228 ?auto_155227 ) ( not ( = ?auto_155227 ?auto_155220 ) ) ( ON_BOARD ?auto_155224 ?auto_155222 ) ( not ( = ?auto_155228 ?auto_155224 ) ) ( SUPPORTS ?auto_155224 ?auto_155221 ) ( CALIBRATION_TARGET ?auto_155224 ?auto_155227 ) ( not ( = ?auto_155227 ?auto_155215 ) ) ( ON_BOARD ?auto_155226 ?auto_155222 ) ( not ( = ?auto_155224 ?auto_155226 ) ) ( SUPPORTS ?auto_155226 ?auto_155214 ) ( CALIBRATION_TARGET ?auto_155226 ?auto_155227 ) ( POWER_AVAIL ?auto_155222 ) ( POINTING ?auto_155222 ?auto_155225 ) ( not ( = ?auto_155227 ?auto_155225 ) ) ( not ( = ?auto_155215 ?auto_155225 ) ) ( not ( = ?auto_155214 ?auto_155221 ) ) ( not ( = ?auto_155220 ?auto_155225 ) ) ( not ( = ?auto_155214 ?auto_155219 ) ) ( not ( = ?auto_155221 ?auto_155219 ) ) ( not ( = ?auto_155218 ?auto_155225 ) ) ( not ( = ?auto_155228 ?auto_155226 ) ) ( not ( = ?auto_155214 ?auto_155217 ) ) ( not ( = ?auto_155221 ?auto_155217 ) ) ( not ( = ?auto_155219 ?auto_155217 ) ) ( not ( = ?auto_155216 ?auto_155225 ) ) ( not ( = ?auto_155223 ?auto_155224 ) ) ( not ( = ?auto_155223 ?auto_155226 ) ) ( not ( = ?auto_155214 ?auto_155213 ) ) ( not ( = ?auto_155221 ?auto_155213 ) ) ( not ( = ?auto_155219 ?auto_155213 ) ) ( not ( = ?auto_155217 ?auto_155213 ) ) ( not ( = ?auto_155212 ?auto_155225 ) ) ( not ( = ?auto_155229 ?auto_155228 ) ) ( not ( = ?auto_155229 ?auto_155224 ) ) ( not ( = ?auto_155229 ?auto_155226 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_155215 ?auto_155214 ?auto_155220 ?auto_155221 ?auto_155218 ?auto_155219 ?auto_155212 ?auto_155213 ?auto_155216 ?auto_155217 )
      ( GET-5IMAGE-VERIFY ?auto_155212 ?auto_155213 ?auto_155215 ?auto_155214 ?auto_155216 ?auto_155217 ?auto_155218 ?auto_155219 ?auto_155220 ?auto_155221 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_156320 - DIRECTION
      ?auto_156321 - MODE
      ?auto_156323 - DIRECTION
      ?auto_156322 - MODE
      ?auto_156324 - DIRECTION
      ?auto_156325 - MODE
      ?auto_156326 - DIRECTION
      ?auto_156327 - MODE
      ?auto_156328 - DIRECTION
      ?auto_156329 - MODE
    )
    :vars
    (
      ?auto_156337 - INSTRUMENT
      ?auto_156330 - SATELLITE
      ?auto_156335 - DIRECTION
      ?auto_156331 - INSTRUMENT
      ?auto_156336 - INSTRUMENT
      ?auto_156332 - INSTRUMENT
      ?auto_156334 - INSTRUMENT
      ?auto_156333 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_156323 ?auto_156320 ) ) ( not ( = ?auto_156324 ?auto_156320 ) ) ( not ( = ?auto_156324 ?auto_156323 ) ) ( not ( = ?auto_156326 ?auto_156320 ) ) ( not ( = ?auto_156326 ?auto_156323 ) ) ( not ( = ?auto_156326 ?auto_156324 ) ) ( not ( = ?auto_156328 ?auto_156320 ) ) ( not ( = ?auto_156328 ?auto_156323 ) ) ( not ( = ?auto_156328 ?auto_156324 ) ) ( not ( = ?auto_156328 ?auto_156326 ) ) ( ON_BOARD ?auto_156337 ?auto_156330 ) ( SUPPORTS ?auto_156337 ?auto_156321 ) ( not ( = ?auto_156320 ?auto_156335 ) ) ( CALIBRATION_TARGET ?auto_156337 ?auto_156335 ) ( not ( = ?auto_156335 ?auto_156328 ) ) ( ON_BOARD ?auto_156331 ?auto_156330 ) ( not ( = ?auto_156337 ?auto_156331 ) ) ( SUPPORTS ?auto_156331 ?auto_156329 ) ( CALIBRATION_TARGET ?auto_156331 ?auto_156335 ) ( not ( = ?auto_156335 ?auto_156326 ) ) ( ON_BOARD ?auto_156336 ?auto_156330 ) ( not ( = ?auto_156331 ?auto_156336 ) ) ( SUPPORTS ?auto_156336 ?auto_156327 ) ( CALIBRATION_TARGET ?auto_156336 ?auto_156335 ) ( not ( = ?auto_156335 ?auto_156323 ) ) ( ON_BOARD ?auto_156332 ?auto_156330 ) ( not ( = ?auto_156336 ?auto_156332 ) ) ( SUPPORTS ?auto_156332 ?auto_156322 ) ( CALIBRATION_TARGET ?auto_156332 ?auto_156335 ) ( not ( = ?auto_156335 ?auto_156324 ) ) ( ON_BOARD ?auto_156334 ?auto_156330 ) ( not ( = ?auto_156332 ?auto_156334 ) ) ( SUPPORTS ?auto_156334 ?auto_156325 ) ( CALIBRATION_TARGET ?auto_156334 ?auto_156335 ) ( POWER_AVAIL ?auto_156330 ) ( POINTING ?auto_156330 ?auto_156333 ) ( not ( = ?auto_156335 ?auto_156333 ) ) ( not ( = ?auto_156324 ?auto_156333 ) ) ( not ( = ?auto_156325 ?auto_156322 ) ) ( not ( = ?auto_156323 ?auto_156333 ) ) ( not ( = ?auto_156325 ?auto_156327 ) ) ( not ( = ?auto_156322 ?auto_156327 ) ) ( not ( = ?auto_156326 ?auto_156333 ) ) ( not ( = ?auto_156336 ?auto_156334 ) ) ( not ( = ?auto_156325 ?auto_156329 ) ) ( not ( = ?auto_156322 ?auto_156329 ) ) ( not ( = ?auto_156327 ?auto_156329 ) ) ( not ( = ?auto_156328 ?auto_156333 ) ) ( not ( = ?auto_156331 ?auto_156332 ) ) ( not ( = ?auto_156331 ?auto_156334 ) ) ( not ( = ?auto_156325 ?auto_156321 ) ) ( not ( = ?auto_156322 ?auto_156321 ) ) ( not ( = ?auto_156327 ?auto_156321 ) ) ( not ( = ?auto_156329 ?auto_156321 ) ) ( not ( = ?auto_156320 ?auto_156333 ) ) ( not ( = ?auto_156337 ?auto_156336 ) ) ( not ( = ?auto_156337 ?auto_156332 ) ) ( not ( = ?auto_156337 ?auto_156334 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_156324 ?auto_156325 ?auto_156323 ?auto_156322 ?auto_156326 ?auto_156327 ?auto_156320 ?auto_156321 ?auto_156328 ?auto_156329 )
      ( GET-5IMAGE-VERIFY ?auto_156320 ?auto_156321 ?auto_156323 ?auto_156322 ?auto_156324 ?auto_156325 ?auto_156326 ?auto_156327 ?auto_156328 ?auto_156329 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_156398 - DIRECTION
      ?auto_156399 - MODE
      ?auto_156401 - DIRECTION
      ?auto_156400 - MODE
      ?auto_156402 - DIRECTION
      ?auto_156403 - MODE
      ?auto_156404 - DIRECTION
      ?auto_156405 - MODE
      ?auto_156406 - DIRECTION
      ?auto_156407 - MODE
    )
    :vars
    (
      ?auto_156415 - INSTRUMENT
      ?auto_156408 - SATELLITE
      ?auto_156413 - DIRECTION
      ?auto_156409 - INSTRUMENT
      ?auto_156414 - INSTRUMENT
      ?auto_156410 - INSTRUMENT
      ?auto_156412 - INSTRUMENT
      ?auto_156411 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_156401 ?auto_156398 ) ) ( not ( = ?auto_156402 ?auto_156398 ) ) ( not ( = ?auto_156402 ?auto_156401 ) ) ( not ( = ?auto_156404 ?auto_156398 ) ) ( not ( = ?auto_156404 ?auto_156401 ) ) ( not ( = ?auto_156404 ?auto_156402 ) ) ( not ( = ?auto_156406 ?auto_156398 ) ) ( not ( = ?auto_156406 ?auto_156401 ) ) ( not ( = ?auto_156406 ?auto_156402 ) ) ( not ( = ?auto_156406 ?auto_156404 ) ) ( ON_BOARD ?auto_156415 ?auto_156408 ) ( SUPPORTS ?auto_156415 ?auto_156399 ) ( not ( = ?auto_156398 ?auto_156413 ) ) ( CALIBRATION_TARGET ?auto_156415 ?auto_156413 ) ( not ( = ?auto_156413 ?auto_156404 ) ) ( ON_BOARD ?auto_156409 ?auto_156408 ) ( not ( = ?auto_156415 ?auto_156409 ) ) ( SUPPORTS ?auto_156409 ?auto_156405 ) ( CALIBRATION_TARGET ?auto_156409 ?auto_156413 ) ( not ( = ?auto_156413 ?auto_156406 ) ) ( ON_BOARD ?auto_156414 ?auto_156408 ) ( not ( = ?auto_156409 ?auto_156414 ) ) ( SUPPORTS ?auto_156414 ?auto_156407 ) ( CALIBRATION_TARGET ?auto_156414 ?auto_156413 ) ( not ( = ?auto_156413 ?auto_156401 ) ) ( ON_BOARD ?auto_156410 ?auto_156408 ) ( not ( = ?auto_156414 ?auto_156410 ) ) ( SUPPORTS ?auto_156410 ?auto_156400 ) ( CALIBRATION_TARGET ?auto_156410 ?auto_156413 ) ( not ( = ?auto_156413 ?auto_156402 ) ) ( ON_BOARD ?auto_156412 ?auto_156408 ) ( not ( = ?auto_156410 ?auto_156412 ) ) ( SUPPORTS ?auto_156412 ?auto_156403 ) ( CALIBRATION_TARGET ?auto_156412 ?auto_156413 ) ( POWER_AVAIL ?auto_156408 ) ( POINTING ?auto_156408 ?auto_156411 ) ( not ( = ?auto_156413 ?auto_156411 ) ) ( not ( = ?auto_156402 ?auto_156411 ) ) ( not ( = ?auto_156403 ?auto_156400 ) ) ( not ( = ?auto_156401 ?auto_156411 ) ) ( not ( = ?auto_156403 ?auto_156407 ) ) ( not ( = ?auto_156400 ?auto_156407 ) ) ( not ( = ?auto_156406 ?auto_156411 ) ) ( not ( = ?auto_156414 ?auto_156412 ) ) ( not ( = ?auto_156403 ?auto_156405 ) ) ( not ( = ?auto_156400 ?auto_156405 ) ) ( not ( = ?auto_156407 ?auto_156405 ) ) ( not ( = ?auto_156404 ?auto_156411 ) ) ( not ( = ?auto_156409 ?auto_156410 ) ) ( not ( = ?auto_156409 ?auto_156412 ) ) ( not ( = ?auto_156403 ?auto_156399 ) ) ( not ( = ?auto_156400 ?auto_156399 ) ) ( not ( = ?auto_156407 ?auto_156399 ) ) ( not ( = ?auto_156405 ?auto_156399 ) ) ( not ( = ?auto_156398 ?auto_156411 ) ) ( not ( = ?auto_156415 ?auto_156414 ) ) ( not ( = ?auto_156415 ?auto_156410 ) ) ( not ( = ?auto_156415 ?auto_156412 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_156402 ?auto_156403 ?auto_156401 ?auto_156400 ?auto_156406 ?auto_156407 ?auto_156398 ?auto_156399 ?auto_156404 ?auto_156405 )
      ( GET-5IMAGE-VERIFY ?auto_156398 ?auto_156399 ?auto_156401 ?auto_156400 ?auto_156402 ?auto_156403 ?auto_156404 ?auto_156405 ?auto_156406 ?auto_156407 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_157168 - DIRECTION
      ?auto_157169 - MODE
      ?auto_157171 - DIRECTION
      ?auto_157170 - MODE
      ?auto_157172 - DIRECTION
      ?auto_157173 - MODE
      ?auto_157174 - DIRECTION
      ?auto_157175 - MODE
      ?auto_157176 - DIRECTION
      ?auto_157177 - MODE
    )
    :vars
    (
      ?auto_157185 - INSTRUMENT
      ?auto_157178 - SATELLITE
      ?auto_157183 - DIRECTION
      ?auto_157179 - INSTRUMENT
      ?auto_157184 - INSTRUMENT
      ?auto_157180 - INSTRUMENT
      ?auto_157182 - INSTRUMENT
      ?auto_157181 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_157171 ?auto_157168 ) ) ( not ( = ?auto_157172 ?auto_157168 ) ) ( not ( = ?auto_157172 ?auto_157171 ) ) ( not ( = ?auto_157174 ?auto_157168 ) ) ( not ( = ?auto_157174 ?auto_157171 ) ) ( not ( = ?auto_157174 ?auto_157172 ) ) ( not ( = ?auto_157176 ?auto_157168 ) ) ( not ( = ?auto_157176 ?auto_157171 ) ) ( not ( = ?auto_157176 ?auto_157172 ) ) ( not ( = ?auto_157176 ?auto_157174 ) ) ( ON_BOARD ?auto_157185 ?auto_157178 ) ( SUPPORTS ?auto_157185 ?auto_157169 ) ( not ( = ?auto_157168 ?auto_157183 ) ) ( CALIBRATION_TARGET ?auto_157185 ?auto_157183 ) ( not ( = ?auto_157183 ?auto_157176 ) ) ( ON_BOARD ?auto_157179 ?auto_157178 ) ( not ( = ?auto_157185 ?auto_157179 ) ) ( SUPPORTS ?auto_157179 ?auto_157177 ) ( CALIBRATION_TARGET ?auto_157179 ?auto_157183 ) ( not ( = ?auto_157183 ?auto_157172 ) ) ( ON_BOARD ?auto_157184 ?auto_157178 ) ( not ( = ?auto_157179 ?auto_157184 ) ) ( SUPPORTS ?auto_157184 ?auto_157173 ) ( CALIBRATION_TARGET ?auto_157184 ?auto_157183 ) ( not ( = ?auto_157183 ?auto_157171 ) ) ( ON_BOARD ?auto_157180 ?auto_157178 ) ( not ( = ?auto_157184 ?auto_157180 ) ) ( SUPPORTS ?auto_157180 ?auto_157170 ) ( CALIBRATION_TARGET ?auto_157180 ?auto_157183 ) ( not ( = ?auto_157183 ?auto_157174 ) ) ( ON_BOARD ?auto_157182 ?auto_157178 ) ( not ( = ?auto_157180 ?auto_157182 ) ) ( SUPPORTS ?auto_157182 ?auto_157175 ) ( CALIBRATION_TARGET ?auto_157182 ?auto_157183 ) ( POWER_AVAIL ?auto_157178 ) ( POINTING ?auto_157178 ?auto_157181 ) ( not ( = ?auto_157183 ?auto_157181 ) ) ( not ( = ?auto_157174 ?auto_157181 ) ) ( not ( = ?auto_157175 ?auto_157170 ) ) ( not ( = ?auto_157171 ?auto_157181 ) ) ( not ( = ?auto_157175 ?auto_157173 ) ) ( not ( = ?auto_157170 ?auto_157173 ) ) ( not ( = ?auto_157172 ?auto_157181 ) ) ( not ( = ?auto_157184 ?auto_157182 ) ) ( not ( = ?auto_157175 ?auto_157177 ) ) ( not ( = ?auto_157170 ?auto_157177 ) ) ( not ( = ?auto_157173 ?auto_157177 ) ) ( not ( = ?auto_157176 ?auto_157181 ) ) ( not ( = ?auto_157179 ?auto_157180 ) ) ( not ( = ?auto_157179 ?auto_157182 ) ) ( not ( = ?auto_157175 ?auto_157169 ) ) ( not ( = ?auto_157170 ?auto_157169 ) ) ( not ( = ?auto_157173 ?auto_157169 ) ) ( not ( = ?auto_157177 ?auto_157169 ) ) ( not ( = ?auto_157168 ?auto_157181 ) ) ( not ( = ?auto_157185 ?auto_157184 ) ) ( not ( = ?auto_157185 ?auto_157180 ) ) ( not ( = ?auto_157185 ?auto_157182 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_157174 ?auto_157175 ?auto_157171 ?auto_157170 ?auto_157172 ?auto_157173 ?auto_157168 ?auto_157169 ?auto_157176 ?auto_157177 )
      ( GET-5IMAGE-VERIFY ?auto_157168 ?auto_157169 ?auto_157171 ?auto_157170 ?auto_157172 ?auto_157173 ?auto_157174 ?auto_157175 ?auto_157176 ?auto_157177 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_157418 - DIRECTION
      ?auto_157419 - MODE
      ?auto_157421 - DIRECTION
      ?auto_157420 - MODE
      ?auto_157422 - DIRECTION
      ?auto_157423 - MODE
      ?auto_157424 - DIRECTION
      ?auto_157425 - MODE
      ?auto_157426 - DIRECTION
      ?auto_157427 - MODE
    )
    :vars
    (
      ?auto_157435 - INSTRUMENT
      ?auto_157428 - SATELLITE
      ?auto_157433 - DIRECTION
      ?auto_157429 - INSTRUMENT
      ?auto_157434 - INSTRUMENT
      ?auto_157430 - INSTRUMENT
      ?auto_157432 - INSTRUMENT
      ?auto_157431 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_157421 ?auto_157418 ) ) ( not ( = ?auto_157422 ?auto_157418 ) ) ( not ( = ?auto_157422 ?auto_157421 ) ) ( not ( = ?auto_157424 ?auto_157418 ) ) ( not ( = ?auto_157424 ?auto_157421 ) ) ( not ( = ?auto_157424 ?auto_157422 ) ) ( not ( = ?auto_157426 ?auto_157418 ) ) ( not ( = ?auto_157426 ?auto_157421 ) ) ( not ( = ?auto_157426 ?auto_157422 ) ) ( not ( = ?auto_157426 ?auto_157424 ) ) ( ON_BOARD ?auto_157435 ?auto_157428 ) ( SUPPORTS ?auto_157435 ?auto_157419 ) ( not ( = ?auto_157418 ?auto_157433 ) ) ( CALIBRATION_TARGET ?auto_157435 ?auto_157433 ) ( not ( = ?auto_157433 ?auto_157424 ) ) ( ON_BOARD ?auto_157429 ?auto_157428 ) ( not ( = ?auto_157435 ?auto_157429 ) ) ( SUPPORTS ?auto_157429 ?auto_157425 ) ( CALIBRATION_TARGET ?auto_157429 ?auto_157433 ) ( not ( = ?auto_157433 ?auto_157422 ) ) ( ON_BOARD ?auto_157434 ?auto_157428 ) ( not ( = ?auto_157429 ?auto_157434 ) ) ( SUPPORTS ?auto_157434 ?auto_157423 ) ( CALIBRATION_TARGET ?auto_157434 ?auto_157433 ) ( not ( = ?auto_157433 ?auto_157421 ) ) ( ON_BOARD ?auto_157430 ?auto_157428 ) ( not ( = ?auto_157434 ?auto_157430 ) ) ( SUPPORTS ?auto_157430 ?auto_157420 ) ( CALIBRATION_TARGET ?auto_157430 ?auto_157433 ) ( not ( = ?auto_157433 ?auto_157426 ) ) ( ON_BOARD ?auto_157432 ?auto_157428 ) ( not ( = ?auto_157430 ?auto_157432 ) ) ( SUPPORTS ?auto_157432 ?auto_157427 ) ( CALIBRATION_TARGET ?auto_157432 ?auto_157433 ) ( POWER_AVAIL ?auto_157428 ) ( POINTING ?auto_157428 ?auto_157431 ) ( not ( = ?auto_157433 ?auto_157431 ) ) ( not ( = ?auto_157426 ?auto_157431 ) ) ( not ( = ?auto_157427 ?auto_157420 ) ) ( not ( = ?auto_157421 ?auto_157431 ) ) ( not ( = ?auto_157427 ?auto_157423 ) ) ( not ( = ?auto_157420 ?auto_157423 ) ) ( not ( = ?auto_157422 ?auto_157431 ) ) ( not ( = ?auto_157434 ?auto_157432 ) ) ( not ( = ?auto_157427 ?auto_157425 ) ) ( not ( = ?auto_157420 ?auto_157425 ) ) ( not ( = ?auto_157423 ?auto_157425 ) ) ( not ( = ?auto_157424 ?auto_157431 ) ) ( not ( = ?auto_157429 ?auto_157430 ) ) ( not ( = ?auto_157429 ?auto_157432 ) ) ( not ( = ?auto_157427 ?auto_157419 ) ) ( not ( = ?auto_157420 ?auto_157419 ) ) ( not ( = ?auto_157423 ?auto_157419 ) ) ( not ( = ?auto_157425 ?auto_157419 ) ) ( not ( = ?auto_157418 ?auto_157431 ) ) ( not ( = ?auto_157435 ?auto_157434 ) ) ( not ( = ?auto_157435 ?auto_157430 ) ) ( not ( = ?auto_157435 ?auto_157432 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_157426 ?auto_157427 ?auto_157421 ?auto_157420 ?auto_157422 ?auto_157423 ?auto_157418 ?auto_157419 ?auto_157424 ?auto_157425 )
      ( GET-5IMAGE-VERIFY ?auto_157418 ?auto_157419 ?auto_157421 ?auto_157420 ?auto_157422 ?auto_157423 ?auto_157424 ?auto_157425 ?auto_157426 ?auto_157427 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_157662 - DIRECTION
      ?auto_157663 - MODE
      ?auto_157665 - DIRECTION
      ?auto_157664 - MODE
      ?auto_157666 - DIRECTION
      ?auto_157667 - MODE
      ?auto_157668 - DIRECTION
      ?auto_157669 - MODE
      ?auto_157670 - DIRECTION
      ?auto_157671 - MODE
    )
    :vars
    (
      ?auto_157679 - INSTRUMENT
      ?auto_157672 - SATELLITE
      ?auto_157677 - DIRECTION
      ?auto_157673 - INSTRUMENT
      ?auto_157678 - INSTRUMENT
      ?auto_157674 - INSTRUMENT
      ?auto_157676 - INSTRUMENT
      ?auto_157675 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_157665 ?auto_157662 ) ) ( not ( = ?auto_157666 ?auto_157662 ) ) ( not ( = ?auto_157666 ?auto_157665 ) ) ( not ( = ?auto_157668 ?auto_157662 ) ) ( not ( = ?auto_157668 ?auto_157665 ) ) ( not ( = ?auto_157668 ?auto_157666 ) ) ( not ( = ?auto_157670 ?auto_157662 ) ) ( not ( = ?auto_157670 ?auto_157665 ) ) ( not ( = ?auto_157670 ?auto_157666 ) ) ( not ( = ?auto_157670 ?auto_157668 ) ) ( ON_BOARD ?auto_157679 ?auto_157672 ) ( SUPPORTS ?auto_157679 ?auto_157663 ) ( not ( = ?auto_157662 ?auto_157677 ) ) ( CALIBRATION_TARGET ?auto_157679 ?auto_157677 ) ( not ( = ?auto_157677 ?auto_157666 ) ) ( ON_BOARD ?auto_157673 ?auto_157672 ) ( not ( = ?auto_157679 ?auto_157673 ) ) ( SUPPORTS ?auto_157673 ?auto_157667 ) ( CALIBRATION_TARGET ?auto_157673 ?auto_157677 ) ( not ( = ?auto_157677 ?auto_157670 ) ) ( ON_BOARD ?auto_157678 ?auto_157672 ) ( not ( = ?auto_157673 ?auto_157678 ) ) ( SUPPORTS ?auto_157678 ?auto_157671 ) ( CALIBRATION_TARGET ?auto_157678 ?auto_157677 ) ( not ( = ?auto_157677 ?auto_157665 ) ) ( ON_BOARD ?auto_157674 ?auto_157672 ) ( not ( = ?auto_157678 ?auto_157674 ) ) ( SUPPORTS ?auto_157674 ?auto_157664 ) ( CALIBRATION_TARGET ?auto_157674 ?auto_157677 ) ( not ( = ?auto_157677 ?auto_157668 ) ) ( ON_BOARD ?auto_157676 ?auto_157672 ) ( not ( = ?auto_157674 ?auto_157676 ) ) ( SUPPORTS ?auto_157676 ?auto_157669 ) ( CALIBRATION_TARGET ?auto_157676 ?auto_157677 ) ( POWER_AVAIL ?auto_157672 ) ( POINTING ?auto_157672 ?auto_157675 ) ( not ( = ?auto_157677 ?auto_157675 ) ) ( not ( = ?auto_157668 ?auto_157675 ) ) ( not ( = ?auto_157669 ?auto_157664 ) ) ( not ( = ?auto_157665 ?auto_157675 ) ) ( not ( = ?auto_157669 ?auto_157671 ) ) ( not ( = ?auto_157664 ?auto_157671 ) ) ( not ( = ?auto_157670 ?auto_157675 ) ) ( not ( = ?auto_157678 ?auto_157676 ) ) ( not ( = ?auto_157669 ?auto_157667 ) ) ( not ( = ?auto_157664 ?auto_157667 ) ) ( not ( = ?auto_157671 ?auto_157667 ) ) ( not ( = ?auto_157666 ?auto_157675 ) ) ( not ( = ?auto_157673 ?auto_157674 ) ) ( not ( = ?auto_157673 ?auto_157676 ) ) ( not ( = ?auto_157669 ?auto_157663 ) ) ( not ( = ?auto_157664 ?auto_157663 ) ) ( not ( = ?auto_157671 ?auto_157663 ) ) ( not ( = ?auto_157667 ?auto_157663 ) ) ( not ( = ?auto_157662 ?auto_157675 ) ) ( not ( = ?auto_157679 ?auto_157678 ) ) ( not ( = ?auto_157679 ?auto_157674 ) ) ( not ( = ?auto_157679 ?auto_157676 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_157668 ?auto_157669 ?auto_157665 ?auto_157664 ?auto_157670 ?auto_157671 ?auto_157662 ?auto_157663 ?auto_157666 ?auto_157667 )
      ( GET-5IMAGE-VERIFY ?auto_157662 ?auto_157663 ?auto_157665 ?auto_157664 ?auto_157666 ?auto_157667 ?auto_157668 ?auto_157669 ?auto_157670 ?auto_157671 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_157826 - DIRECTION
      ?auto_157827 - MODE
      ?auto_157829 - DIRECTION
      ?auto_157828 - MODE
      ?auto_157830 - DIRECTION
      ?auto_157831 - MODE
      ?auto_157832 - DIRECTION
      ?auto_157833 - MODE
      ?auto_157834 - DIRECTION
      ?auto_157835 - MODE
    )
    :vars
    (
      ?auto_157843 - INSTRUMENT
      ?auto_157836 - SATELLITE
      ?auto_157841 - DIRECTION
      ?auto_157837 - INSTRUMENT
      ?auto_157842 - INSTRUMENT
      ?auto_157838 - INSTRUMENT
      ?auto_157840 - INSTRUMENT
      ?auto_157839 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_157829 ?auto_157826 ) ) ( not ( = ?auto_157830 ?auto_157826 ) ) ( not ( = ?auto_157830 ?auto_157829 ) ) ( not ( = ?auto_157832 ?auto_157826 ) ) ( not ( = ?auto_157832 ?auto_157829 ) ) ( not ( = ?auto_157832 ?auto_157830 ) ) ( not ( = ?auto_157834 ?auto_157826 ) ) ( not ( = ?auto_157834 ?auto_157829 ) ) ( not ( = ?auto_157834 ?auto_157830 ) ) ( not ( = ?auto_157834 ?auto_157832 ) ) ( ON_BOARD ?auto_157843 ?auto_157836 ) ( SUPPORTS ?auto_157843 ?auto_157827 ) ( not ( = ?auto_157826 ?auto_157841 ) ) ( CALIBRATION_TARGET ?auto_157843 ?auto_157841 ) ( not ( = ?auto_157841 ?auto_157830 ) ) ( ON_BOARD ?auto_157837 ?auto_157836 ) ( not ( = ?auto_157843 ?auto_157837 ) ) ( SUPPORTS ?auto_157837 ?auto_157831 ) ( CALIBRATION_TARGET ?auto_157837 ?auto_157841 ) ( not ( = ?auto_157841 ?auto_157832 ) ) ( ON_BOARD ?auto_157842 ?auto_157836 ) ( not ( = ?auto_157837 ?auto_157842 ) ) ( SUPPORTS ?auto_157842 ?auto_157833 ) ( CALIBRATION_TARGET ?auto_157842 ?auto_157841 ) ( not ( = ?auto_157841 ?auto_157829 ) ) ( ON_BOARD ?auto_157838 ?auto_157836 ) ( not ( = ?auto_157842 ?auto_157838 ) ) ( SUPPORTS ?auto_157838 ?auto_157828 ) ( CALIBRATION_TARGET ?auto_157838 ?auto_157841 ) ( not ( = ?auto_157841 ?auto_157834 ) ) ( ON_BOARD ?auto_157840 ?auto_157836 ) ( not ( = ?auto_157838 ?auto_157840 ) ) ( SUPPORTS ?auto_157840 ?auto_157835 ) ( CALIBRATION_TARGET ?auto_157840 ?auto_157841 ) ( POWER_AVAIL ?auto_157836 ) ( POINTING ?auto_157836 ?auto_157839 ) ( not ( = ?auto_157841 ?auto_157839 ) ) ( not ( = ?auto_157834 ?auto_157839 ) ) ( not ( = ?auto_157835 ?auto_157828 ) ) ( not ( = ?auto_157829 ?auto_157839 ) ) ( not ( = ?auto_157835 ?auto_157833 ) ) ( not ( = ?auto_157828 ?auto_157833 ) ) ( not ( = ?auto_157832 ?auto_157839 ) ) ( not ( = ?auto_157842 ?auto_157840 ) ) ( not ( = ?auto_157835 ?auto_157831 ) ) ( not ( = ?auto_157828 ?auto_157831 ) ) ( not ( = ?auto_157833 ?auto_157831 ) ) ( not ( = ?auto_157830 ?auto_157839 ) ) ( not ( = ?auto_157837 ?auto_157838 ) ) ( not ( = ?auto_157837 ?auto_157840 ) ) ( not ( = ?auto_157835 ?auto_157827 ) ) ( not ( = ?auto_157828 ?auto_157827 ) ) ( not ( = ?auto_157833 ?auto_157827 ) ) ( not ( = ?auto_157831 ?auto_157827 ) ) ( not ( = ?auto_157826 ?auto_157839 ) ) ( not ( = ?auto_157843 ?auto_157842 ) ) ( not ( = ?auto_157843 ?auto_157838 ) ) ( not ( = ?auto_157843 ?auto_157840 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_157834 ?auto_157835 ?auto_157829 ?auto_157828 ?auto_157832 ?auto_157833 ?auto_157826 ?auto_157827 ?auto_157830 ?auto_157831 )
      ( GET-5IMAGE-VERIFY ?auto_157826 ?auto_157827 ?auto_157829 ?auto_157828 ?auto_157830 ?auto_157831 ?auto_157832 ?auto_157833 ?auto_157834 ?auto_157835 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_158848 - DIRECTION
      ?auto_158849 - MODE
      ?auto_158851 - DIRECTION
      ?auto_158850 - MODE
      ?auto_158852 - DIRECTION
      ?auto_158853 - MODE
      ?auto_158854 - DIRECTION
      ?auto_158855 - MODE
      ?auto_158856 - DIRECTION
      ?auto_158857 - MODE
    )
    :vars
    (
      ?auto_158865 - INSTRUMENT
      ?auto_158858 - SATELLITE
      ?auto_158863 - DIRECTION
      ?auto_158859 - INSTRUMENT
      ?auto_158864 - INSTRUMENT
      ?auto_158860 - INSTRUMENT
      ?auto_158862 - INSTRUMENT
      ?auto_158861 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_158851 ?auto_158848 ) ) ( not ( = ?auto_158852 ?auto_158848 ) ) ( not ( = ?auto_158852 ?auto_158851 ) ) ( not ( = ?auto_158854 ?auto_158848 ) ) ( not ( = ?auto_158854 ?auto_158851 ) ) ( not ( = ?auto_158854 ?auto_158852 ) ) ( not ( = ?auto_158856 ?auto_158848 ) ) ( not ( = ?auto_158856 ?auto_158851 ) ) ( not ( = ?auto_158856 ?auto_158852 ) ) ( not ( = ?auto_158856 ?auto_158854 ) ) ( ON_BOARD ?auto_158865 ?auto_158858 ) ( SUPPORTS ?auto_158865 ?auto_158849 ) ( not ( = ?auto_158848 ?auto_158863 ) ) ( CALIBRATION_TARGET ?auto_158865 ?auto_158863 ) ( not ( = ?auto_158863 ?auto_158856 ) ) ( ON_BOARD ?auto_158859 ?auto_158858 ) ( not ( = ?auto_158865 ?auto_158859 ) ) ( SUPPORTS ?auto_158859 ?auto_158857 ) ( CALIBRATION_TARGET ?auto_158859 ?auto_158863 ) ( not ( = ?auto_158863 ?auto_158851 ) ) ( ON_BOARD ?auto_158864 ?auto_158858 ) ( not ( = ?auto_158859 ?auto_158864 ) ) ( SUPPORTS ?auto_158864 ?auto_158850 ) ( CALIBRATION_TARGET ?auto_158864 ?auto_158863 ) ( not ( = ?auto_158863 ?auto_158854 ) ) ( ON_BOARD ?auto_158860 ?auto_158858 ) ( not ( = ?auto_158864 ?auto_158860 ) ) ( SUPPORTS ?auto_158860 ?auto_158855 ) ( CALIBRATION_TARGET ?auto_158860 ?auto_158863 ) ( not ( = ?auto_158863 ?auto_158852 ) ) ( ON_BOARD ?auto_158862 ?auto_158858 ) ( not ( = ?auto_158860 ?auto_158862 ) ) ( SUPPORTS ?auto_158862 ?auto_158853 ) ( CALIBRATION_TARGET ?auto_158862 ?auto_158863 ) ( POWER_AVAIL ?auto_158858 ) ( POINTING ?auto_158858 ?auto_158861 ) ( not ( = ?auto_158863 ?auto_158861 ) ) ( not ( = ?auto_158852 ?auto_158861 ) ) ( not ( = ?auto_158853 ?auto_158855 ) ) ( not ( = ?auto_158854 ?auto_158861 ) ) ( not ( = ?auto_158853 ?auto_158850 ) ) ( not ( = ?auto_158855 ?auto_158850 ) ) ( not ( = ?auto_158851 ?auto_158861 ) ) ( not ( = ?auto_158864 ?auto_158862 ) ) ( not ( = ?auto_158853 ?auto_158857 ) ) ( not ( = ?auto_158855 ?auto_158857 ) ) ( not ( = ?auto_158850 ?auto_158857 ) ) ( not ( = ?auto_158856 ?auto_158861 ) ) ( not ( = ?auto_158859 ?auto_158860 ) ) ( not ( = ?auto_158859 ?auto_158862 ) ) ( not ( = ?auto_158853 ?auto_158849 ) ) ( not ( = ?auto_158855 ?auto_158849 ) ) ( not ( = ?auto_158850 ?auto_158849 ) ) ( not ( = ?auto_158857 ?auto_158849 ) ) ( not ( = ?auto_158848 ?auto_158861 ) ) ( not ( = ?auto_158865 ?auto_158864 ) ) ( not ( = ?auto_158865 ?auto_158860 ) ) ( not ( = ?auto_158865 ?auto_158862 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_158852 ?auto_158853 ?auto_158854 ?auto_158855 ?auto_158851 ?auto_158850 ?auto_158848 ?auto_158849 ?auto_158856 ?auto_158857 )
      ( GET-5IMAGE-VERIFY ?auto_158848 ?auto_158849 ?auto_158851 ?auto_158850 ?auto_158852 ?auto_158853 ?auto_158854 ?auto_158855 ?auto_158856 ?auto_158857 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_159012 - DIRECTION
      ?auto_159013 - MODE
      ?auto_159015 - DIRECTION
      ?auto_159014 - MODE
      ?auto_159016 - DIRECTION
      ?auto_159017 - MODE
      ?auto_159018 - DIRECTION
      ?auto_159019 - MODE
      ?auto_159020 - DIRECTION
      ?auto_159021 - MODE
    )
    :vars
    (
      ?auto_159029 - INSTRUMENT
      ?auto_159022 - SATELLITE
      ?auto_159027 - DIRECTION
      ?auto_159023 - INSTRUMENT
      ?auto_159028 - INSTRUMENT
      ?auto_159024 - INSTRUMENT
      ?auto_159026 - INSTRUMENT
      ?auto_159025 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_159015 ?auto_159012 ) ) ( not ( = ?auto_159016 ?auto_159012 ) ) ( not ( = ?auto_159016 ?auto_159015 ) ) ( not ( = ?auto_159018 ?auto_159012 ) ) ( not ( = ?auto_159018 ?auto_159015 ) ) ( not ( = ?auto_159018 ?auto_159016 ) ) ( not ( = ?auto_159020 ?auto_159012 ) ) ( not ( = ?auto_159020 ?auto_159015 ) ) ( not ( = ?auto_159020 ?auto_159016 ) ) ( not ( = ?auto_159020 ?auto_159018 ) ) ( ON_BOARD ?auto_159029 ?auto_159022 ) ( SUPPORTS ?auto_159029 ?auto_159013 ) ( not ( = ?auto_159012 ?auto_159027 ) ) ( CALIBRATION_TARGET ?auto_159029 ?auto_159027 ) ( not ( = ?auto_159027 ?auto_159018 ) ) ( ON_BOARD ?auto_159023 ?auto_159022 ) ( not ( = ?auto_159029 ?auto_159023 ) ) ( SUPPORTS ?auto_159023 ?auto_159019 ) ( CALIBRATION_TARGET ?auto_159023 ?auto_159027 ) ( not ( = ?auto_159027 ?auto_159015 ) ) ( ON_BOARD ?auto_159028 ?auto_159022 ) ( not ( = ?auto_159023 ?auto_159028 ) ) ( SUPPORTS ?auto_159028 ?auto_159014 ) ( CALIBRATION_TARGET ?auto_159028 ?auto_159027 ) ( not ( = ?auto_159027 ?auto_159020 ) ) ( ON_BOARD ?auto_159024 ?auto_159022 ) ( not ( = ?auto_159028 ?auto_159024 ) ) ( SUPPORTS ?auto_159024 ?auto_159021 ) ( CALIBRATION_TARGET ?auto_159024 ?auto_159027 ) ( not ( = ?auto_159027 ?auto_159016 ) ) ( ON_BOARD ?auto_159026 ?auto_159022 ) ( not ( = ?auto_159024 ?auto_159026 ) ) ( SUPPORTS ?auto_159026 ?auto_159017 ) ( CALIBRATION_TARGET ?auto_159026 ?auto_159027 ) ( POWER_AVAIL ?auto_159022 ) ( POINTING ?auto_159022 ?auto_159025 ) ( not ( = ?auto_159027 ?auto_159025 ) ) ( not ( = ?auto_159016 ?auto_159025 ) ) ( not ( = ?auto_159017 ?auto_159021 ) ) ( not ( = ?auto_159020 ?auto_159025 ) ) ( not ( = ?auto_159017 ?auto_159014 ) ) ( not ( = ?auto_159021 ?auto_159014 ) ) ( not ( = ?auto_159015 ?auto_159025 ) ) ( not ( = ?auto_159028 ?auto_159026 ) ) ( not ( = ?auto_159017 ?auto_159019 ) ) ( not ( = ?auto_159021 ?auto_159019 ) ) ( not ( = ?auto_159014 ?auto_159019 ) ) ( not ( = ?auto_159018 ?auto_159025 ) ) ( not ( = ?auto_159023 ?auto_159024 ) ) ( not ( = ?auto_159023 ?auto_159026 ) ) ( not ( = ?auto_159017 ?auto_159013 ) ) ( not ( = ?auto_159021 ?auto_159013 ) ) ( not ( = ?auto_159014 ?auto_159013 ) ) ( not ( = ?auto_159019 ?auto_159013 ) ) ( not ( = ?auto_159012 ?auto_159025 ) ) ( not ( = ?auto_159029 ?auto_159028 ) ) ( not ( = ?auto_159029 ?auto_159024 ) ) ( not ( = ?auto_159029 ?auto_159026 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_159016 ?auto_159017 ?auto_159020 ?auto_159021 ?auto_159015 ?auto_159014 ?auto_159012 ?auto_159013 ?auto_159018 ?auto_159019 )
      ( GET-5IMAGE-VERIFY ?auto_159012 ?auto_159013 ?auto_159015 ?auto_159014 ?auto_159016 ?auto_159017 ?auto_159018 ?auto_159019 ?auto_159020 ?auto_159021 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_159256 - DIRECTION
      ?auto_159257 - MODE
      ?auto_159259 - DIRECTION
      ?auto_159258 - MODE
      ?auto_159260 - DIRECTION
      ?auto_159261 - MODE
      ?auto_159262 - DIRECTION
      ?auto_159263 - MODE
      ?auto_159264 - DIRECTION
      ?auto_159265 - MODE
    )
    :vars
    (
      ?auto_159273 - INSTRUMENT
      ?auto_159266 - SATELLITE
      ?auto_159271 - DIRECTION
      ?auto_159267 - INSTRUMENT
      ?auto_159272 - INSTRUMENT
      ?auto_159268 - INSTRUMENT
      ?auto_159270 - INSTRUMENT
      ?auto_159269 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_159259 ?auto_159256 ) ) ( not ( = ?auto_159260 ?auto_159256 ) ) ( not ( = ?auto_159260 ?auto_159259 ) ) ( not ( = ?auto_159262 ?auto_159256 ) ) ( not ( = ?auto_159262 ?auto_159259 ) ) ( not ( = ?auto_159262 ?auto_159260 ) ) ( not ( = ?auto_159264 ?auto_159256 ) ) ( not ( = ?auto_159264 ?auto_159259 ) ) ( not ( = ?auto_159264 ?auto_159260 ) ) ( not ( = ?auto_159264 ?auto_159262 ) ) ( ON_BOARD ?auto_159273 ?auto_159266 ) ( SUPPORTS ?auto_159273 ?auto_159257 ) ( not ( = ?auto_159256 ?auto_159271 ) ) ( CALIBRATION_TARGET ?auto_159273 ?auto_159271 ) ( not ( = ?auto_159271 ?auto_159264 ) ) ( ON_BOARD ?auto_159267 ?auto_159266 ) ( not ( = ?auto_159273 ?auto_159267 ) ) ( SUPPORTS ?auto_159267 ?auto_159265 ) ( CALIBRATION_TARGET ?auto_159267 ?auto_159271 ) ( not ( = ?auto_159271 ?auto_159259 ) ) ( ON_BOARD ?auto_159272 ?auto_159266 ) ( not ( = ?auto_159267 ?auto_159272 ) ) ( SUPPORTS ?auto_159272 ?auto_159258 ) ( CALIBRATION_TARGET ?auto_159272 ?auto_159271 ) ( not ( = ?auto_159271 ?auto_159260 ) ) ( ON_BOARD ?auto_159268 ?auto_159266 ) ( not ( = ?auto_159272 ?auto_159268 ) ) ( SUPPORTS ?auto_159268 ?auto_159261 ) ( CALIBRATION_TARGET ?auto_159268 ?auto_159271 ) ( not ( = ?auto_159271 ?auto_159262 ) ) ( ON_BOARD ?auto_159270 ?auto_159266 ) ( not ( = ?auto_159268 ?auto_159270 ) ) ( SUPPORTS ?auto_159270 ?auto_159263 ) ( CALIBRATION_TARGET ?auto_159270 ?auto_159271 ) ( POWER_AVAIL ?auto_159266 ) ( POINTING ?auto_159266 ?auto_159269 ) ( not ( = ?auto_159271 ?auto_159269 ) ) ( not ( = ?auto_159262 ?auto_159269 ) ) ( not ( = ?auto_159263 ?auto_159261 ) ) ( not ( = ?auto_159260 ?auto_159269 ) ) ( not ( = ?auto_159263 ?auto_159258 ) ) ( not ( = ?auto_159261 ?auto_159258 ) ) ( not ( = ?auto_159259 ?auto_159269 ) ) ( not ( = ?auto_159272 ?auto_159270 ) ) ( not ( = ?auto_159263 ?auto_159265 ) ) ( not ( = ?auto_159261 ?auto_159265 ) ) ( not ( = ?auto_159258 ?auto_159265 ) ) ( not ( = ?auto_159264 ?auto_159269 ) ) ( not ( = ?auto_159267 ?auto_159268 ) ) ( not ( = ?auto_159267 ?auto_159270 ) ) ( not ( = ?auto_159263 ?auto_159257 ) ) ( not ( = ?auto_159261 ?auto_159257 ) ) ( not ( = ?auto_159258 ?auto_159257 ) ) ( not ( = ?auto_159265 ?auto_159257 ) ) ( not ( = ?auto_159256 ?auto_159269 ) ) ( not ( = ?auto_159273 ?auto_159272 ) ) ( not ( = ?auto_159273 ?auto_159268 ) ) ( not ( = ?auto_159273 ?auto_159270 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_159262 ?auto_159263 ?auto_159260 ?auto_159261 ?auto_159259 ?auto_159258 ?auto_159256 ?auto_159257 ?auto_159264 ?auto_159265 )
      ( GET-5IMAGE-VERIFY ?auto_159256 ?auto_159257 ?auto_159259 ?auto_159258 ?auto_159260 ?auto_159261 ?auto_159262 ?auto_159263 ?auto_159264 ?auto_159265 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_159506 - DIRECTION
      ?auto_159507 - MODE
      ?auto_159509 - DIRECTION
      ?auto_159508 - MODE
      ?auto_159510 - DIRECTION
      ?auto_159511 - MODE
      ?auto_159512 - DIRECTION
      ?auto_159513 - MODE
      ?auto_159514 - DIRECTION
      ?auto_159515 - MODE
    )
    :vars
    (
      ?auto_159523 - INSTRUMENT
      ?auto_159516 - SATELLITE
      ?auto_159521 - DIRECTION
      ?auto_159517 - INSTRUMENT
      ?auto_159522 - INSTRUMENT
      ?auto_159518 - INSTRUMENT
      ?auto_159520 - INSTRUMENT
      ?auto_159519 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_159509 ?auto_159506 ) ) ( not ( = ?auto_159510 ?auto_159506 ) ) ( not ( = ?auto_159510 ?auto_159509 ) ) ( not ( = ?auto_159512 ?auto_159506 ) ) ( not ( = ?auto_159512 ?auto_159509 ) ) ( not ( = ?auto_159512 ?auto_159510 ) ) ( not ( = ?auto_159514 ?auto_159506 ) ) ( not ( = ?auto_159514 ?auto_159509 ) ) ( not ( = ?auto_159514 ?auto_159510 ) ) ( not ( = ?auto_159514 ?auto_159512 ) ) ( ON_BOARD ?auto_159523 ?auto_159516 ) ( SUPPORTS ?auto_159523 ?auto_159507 ) ( not ( = ?auto_159506 ?auto_159521 ) ) ( CALIBRATION_TARGET ?auto_159523 ?auto_159521 ) ( not ( = ?auto_159521 ?auto_159512 ) ) ( ON_BOARD ?auto_159517 ?auto_159516 ) ( not ( = ?auto_159523 ?auto_159517 ) ) ( SUPPORTS ?auto_159517 ?auto_159513 ) ( CALIBRATION_TARGET ?auto_159517 ?auto_159521 ) ( not ( = ?auto_159521 ?auto_159509 ) ) ( ON_BOARD ?auto_159522 ?auto_159516 ) ( not ( = ?auto_159517 ?auto_159522 ) ) ( SUPPORTS ?auto_159522 ?auto_159508 ) ( CALIBRATION_TARGET ?auto_159522 ?auto_159521 ) ( not ( = ?auto_159521 ?auto_159510 ) ) ( ON_BOARD ?auto_159518 ?auto_159516 ) ( not ( = ?auto_159522 ?auto_159518 ) ) ( SUPPORTS ?auto_159518 ?auto_159511 ) ( CALIBRATION_TARGET ?auto_159518 ?auto_159521 ) ( not ( = ?auto_159521 ?auto_159514 ) ) ( ON_BOARD ?auto_159520 ?auto_159516 ) ( not ( = ?auto_159518 ?auto_159520 ) ) ( SUPPORTS ?auto_159520 ?auto_159515 ) ( CALIBRATION_TARGET ?auto_159520 ?auto_159521 ) ( POWER_AVAIL ?auto_159516 ) ( POINTING ?auto_159516 ?auto_159519 ) ( not ( = ?auto_159521 ?auto_159519 ) ) ( not ( = ?auto_159514 ?auto_159519 ) ) ( not ( = ?auto_159515 ?auto_159511 ) ) ( not ( = ?auto_159510 ?auto_159519 ) ) ( not ( = ?auto_159515 ?auto_159508 ) ) ( not ( = ?auto_159511 ?auto_159508 ) ) ( not ( = ?auto_159509 ?auto_159519 ) ) ( not ( = ?auto_159522 ?auto_159520 ) ) ( not ( = ?auto_159515 ?auto_159513 ) ) ( not ( = ?auto_159511 ?auto_159513 ) ) ( not ( = ?auto_159508 ?auto_159513 ) ) ( not ( = ?auto_159512 ?auto_159519 ) ) ( not ( = ?auto_159517 ?auto_159518 ) ) ( not ( = ?auto_159517 ?auto_159520 ) ) ( not ( = ?auto_159515 ?auto_159507 ) ) ( not ( = ?auto_159511 ?auto_159507 ) ) ( not ( = ?auto_159508 ?auto_159507 ) ) ( not ( = ?auto_159513 ?auto_159507 ) ) ( not ( = ?auto_159506 ?auto_159519 ) ) ( not ( = ?auto_159523 ?auto_159522 ) ) ( not ( = ?auto_159523 ?auto_159518 ) ) ( not ( = ?auto_159523 ?auto_159520 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_159514 ?auto_159515 ?auto_159510 ?auto_159511 ?auto_159509 ?auto_159508 ?auto_159506 ?auto_159507 ?auto_159512 ?auto_159513 )
      ( GET-5IMAGE-VERIFY ?auto_159506 ?auto_159507 ?auto_159509 ?auto_159508 ?auto_159510 ?auto_159511 ?auto_159512 ?auto_159513 ?auto_159514 ?auto_159515 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_160276 - DIRECTION
      ?auto_160277 - MODE
      ?auto_160279 - DIRECTION
      ?auto_160278 - MODE
      ?auto_160280 - DIRECTION
      ?auto_160281 - MODE
      ?auto_160282 - DIRECTION
      ?auto_160283 - MODE
      ?auto_160284 - DIRECTION
      ?auto_160285 - MODE
    )
    :vars
    (
      ?auto_160293 - INSTRUMENT
      ?auto_160286 - SATELLITE
      ?auto_160291 - DIRECTION
      ?auto_160287 - INSTRUMENT
      ?auto_160292 - INSTRUMENT
      ?auto_160288 - INSTRUMENT
      ?auto_160290 - INSTRUMENT
      ?auto_160289 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_160279 ?auto_160276 ) ) ( not ( = ?auto_160280 ?auto_160276 ) ) ( not ( = ?auto_160280 ?auto_160279 ) ) ( not ( = ?auto_160282 ?auto_160276 ) ) ( not ( = ?auto_160282 ?auto_160279 ) ) ( not ( = ?auto_160282 ?auto_160280 ) ) ( not ( = ?auto_160284 ?auto_160276 ) ) ( not ( = ?auto_160284 ?auto_160279 ) ) ( not ( = ?auto_160284 ?auto_160280 ) ) ( not ( = ?auto_160284 ?auto_160282 ) ) ( ON_BOARD ?auto_160293 ?auto_160286 ) ( SUPPORTS ?auto_160293 ?auto_160277 ) ( not ( = ?auto_160276 ?auto_160291 ) ) ( CALIBRATION_TARGET ?auto_160293 ?auto_160291 ) ( not ( = ?auto_160291 ?auto_160280 ) ) ( ON_BOARD ?auto_160287 ?auto_160286 ) ( not ( = ?auto_160293 ?auto_160287 ) ) ( SUPPORTS ?auto_160287 ?auto_160281 ) ( CALIBRATION_TARGET ?auto_160287 ?auto_160291 ) ( not ( = ?auto_160291 ?auto_160279 ) ) ( ON_BOARD ?auto_160292 ?auto_160286 ) ( not ( = ?auto_160287 ?auto_160292 ) ) ( SUPPORTS ?auto_160292 ?auto_160278 ) ( CALIBRATION_TARGET ?auto_160292 ?auto_160291 ) ( not ( = ?auto_160291 ?auto_160284 ) ) ( ON_BOARD ?auto_160288 ?auto_160286 ) ( not ( = ?auto_160292 ?auto_160288 ) ) ( SUPPORTS ?auto_160288 ?auto_160285 ) ( CALIBRATION_TARGET ?auto_160288 ?auto_160291 ) ( not ( = ?auto_160291 ?auto_160282 ) ) ( ON_BOARD ?auto_160290 ?auto_160286 ) ( not ( = ?auto_160288 ?auto_160290 ) ) ( SUPPORTS ?auto_160290 ?auto_160283 ) ( CALIBRATION_TARGET ?auto_160290 ?auto_160291 ) ( POWER_AVAIL ?auto_160286 ) ( POINTING ?auto_160286 ?auto_160289 ) ( not ( = ?auto_160291 ?auto_160289 ) ) ( not ( = ?auto_160282 ?auto_160289 ) ) ( not ( = ?auto_160283 ?auto_160285 ) ) ( not ( = ?auto_160284 ?auto_160289 ) ) ( not ( = ?auto_160283 ?auto_160278 ) ) ( not ( = ?auto_160285 ?auto_160278 ) ) ( not ( = ?auto_160279 ?auto_160289 ) ) ( not ( = ?auto_160292 ?auto_160290 ) ) ( not ( = ?auto_160283 ?auto_160281 ) ) ( not ( = ?auto_160285 ?auto_160281 ) ) ( not ( = ?auto_160278 ?auto_160281 ) ) ( not ( = ?auto_160280 ?auto_160289 ) ) ( not ( = ?auto_160287 ?auto_160288 ) ) ( not ( = ?auto_160287 ?auto_160290 ) ) ( not ( = ?auto_160283 ?auto_160277 ) ) ( not ( = ?auto_160285 ?auto_160277 ) ) ( not ( = ?auto_160278 ?auto_160277 ) ) ( not ( = ?auto_160281 ?auto_160277 ) ) ( not ( = ?auto_160276 ?auto_160289 ) ) ( not ( = ?auto_160293 ?auto_160292 ) ) ( not ( = ?auto_160293 ?auto_160288 ) ) ( not ( = ?auto_160293 ?auto_160290 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_160282 ?auto_160283 ?auto_160284 ?auto_160285 ?auto_160279 ?auto_160278 ?auto_160276 ?auto_160277 ?auto_160280 ?auto_160281 )
      ( GET-5IMAGE-VERIFY ?auto_160276 ?auto_160277 ?auto_160279 ?auto_160278 ?auto_160280 ?auto_160281 ?auto_160282 ?auto_160283 ?auto_160284 ?auto_160285 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_160354 - DIRECTION
      ?auto_160355 - MODE
      ?auto_160357 - DIRECTION
      ?auto_160356 - MODE
      ?auto_160358 - DIRECTION
      ?auto_160359 - MODE
      ?auto_160360 - DIRECTION
      ?auto_160361 - MODE
      ?auto_160362 - DIRECTION
      ?auto_160363 - MODE
    )
    :vars
    (
      ?auto_160371 - INSTRUMENT
      ?auto_160364 - SATELLITE
      ?auto_160369 - DIRECTION
      ?auto_160365 - INSTRUMENT
      ?auto_160370 - INSTRUMENT
      ?auto_160366 - INSTRUMENT
      ?auto_160368 - INSTRUMENT
      ?auto_160367 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_160357 ?auto_160354 ) ) ( not ( = ?auto_160358 ?auto_160354 ) ) ( not ( = ?auto_160358 ?auto_160357 ) ) ( not ( = ?auto_160360 ?auto_160354 ) ) ( not ( = ?auto_160360 ?auto_160357 ) ) ( not ( = ?auto_160360 ?auto_160358 ) ) ( not ( = ?auto_160362 ?auto_160354 ) ) ( not ( = ?auto_160362 ?auto_160357 ) ) ( not ( = ?auto_160362 ?auto_160358 ) ) ( not ( = ?auto_160362 ?auto_160360 ) ) ( ON_BOARD ?auto_160371 ?auto_160364 ) ( SUPPORTS ?auto_160371 ?auto_160355 ) ( not ( = ?auto_160354 ?auto_160369 ) ) ( CALIBRATION_TARGET ?auto_160371 ?auto_160369 ) ( not ( = ?auto_160369 ?auto_160358 ) ) ( ON_BOARD ?auto_160365 ?auto_160364 ) ( not ( = ?auto_160371 ?auto_160365 ) ) ( SUPPORTS ?auto_160365 ?auto_160359 ) ( CALIBRATION_TARGET ?auto_160365 ?auto_160369 ) ( not ( = ?auto_160369 ?auto_160357 ) ) ( ON_BOARD ?auto_160370 ?auto_160364 ) ( not ( = ?auto_160365 ?auto_160370 ) ) ( SUPPORTS ?auto_160370 ?auto_160356 ) ( CALIBRATION_TARGET ?auto_160370 ?auto_160369 ) ( not ( = ?auto_160369 ?auto_160360 ) ) ( ON_BOARD ?auto_160366 ?auto_160364 ) ( not ( = ?auto_160370 ?auto_160366 ) ) ( SUPPORTS ?auto_160366 ?auto_160361 ) ( CALIBRATION_TARGET ?auto_160366 ?auto_160369 ) ( not ( = ?auto_160369 ?auto_160362 ) ) ( ON_BOARD ?auto_160368 ?auto_160364 ) ( not ( = ?auto_160366 ?auto_160368 ) ) ( SUPPORTS ?auto_160368 ?auto_160363 ) ( CALIBRATION_TARGET ?auto_160368 ?auto_160369 ) ( POWER_AVAIL ?auto_160364 ) ( POINTING ?auto_160364 ?auto_160367 ) ( not ( = ?auto_160369 ?auto_160367 ) ) ( not ( = ?auto_160362 ?auto_160367 ) ) ( not ( = ?auto_160363 ?auto_160361 ) ) ( not ( = ?auto_160360 ?auto_160367 ) ) ( not ( = ?auto_160363 ?auto_160356 ) ) ( not ( = ?auto_160361 ?auto_160356 ) ) ( not ( = ?auto_160357 ?auto_160367 ) ) ( not ( = ?auto_160370 ?auto_160368 ) ) ( not ( = ?auto_160363 ?auto_160359 ) ) ( not ( = ?auto_160361 ?auto_160359 ) ) ( not ( = ?auto_160356 ?auto_160359 ) ) ( not ( = ?auto_160358 ?auto_160367 ) ) ( not ( = ?auto_160365 ?auto_160366 ) ) ( not ( = ?auto_160365 ?auto_160368 ) ) ( not ( = ?auto_160363 ?auto_160355 ) ) ( not ( = ?auto_160361 ?auto_160355 ) ) ( not ( = ?auto_160356 ?auto_160355 ) ) ( not ( = ?auto_160359 ?auto_160355 ) ) ( not ( = ?auto_160354 ?auto_160367 ) ) ( not ( = ?auto_160371 ?auto_160370 ) ) ( not ( = ?auto_160371 ?auto_160366 ) ) ( not ( = ?auto_160371 ?auto_160368 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_160362 ?auto_160363 ?auto_160360 ?auto_160361 ?auto_160357 ?auto_160356 ?auto_160354 ?auto_160355 ?auto_160358 ?auto_160359 )
      ( GET-5IMAGE-VERIFY ?auto_160354 ?auto_160355 ?auto_160357 ?auto_160356 ?auto_160358 ?auto_160359 ?auto_160360 ?auto_160361 ?auto_160362 ?auto_160363 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_161462 - DIRECTION
      ?auto_161463 - MODE
      ?auto_161465 - DIRECTION
      ?auto_161464 - MODE
      ?auto_161466 - DIRECTION
      ?auto_161467 - MODE
      ?auto_161468 - DIRECTION
      ?auto_161469 - MODE
      ?auto_161470 - DIRECTION
      ?auto_161471 - MODE
    )
    :vars
    (
      ?auto_161479 - INSTRUMENT
      ?auto_161472 - SATELLITE
      ?auto_161477 - DIRECTION
      ?auto_161473 - INSTRUMENT
      ?auto_161478 - INSTRUMENT
      ?auto_161474 - INSTRUMENT
      ?auto_161476 - INSTRUMENT
      ?auto_161475 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_161465 ?auto_161462 ) ) ( not ( = ?auto_161466 ?auto_161462 ) ) ( not ( = ?auto_161466 ?auto_161465 ) ) ( not ( = ?auto_161468 ?auto_161462 ) ) ( not ( = ?auto_161468 ?auto_161465 ) ) ( not ( = ?auto_161468 ?auto_161466 ) ) ( not ( = ?auto_161470 ?auto_161462 ) ) ( not ( = ?auto_161470 ?auto_161465 ) ) ( not ( = ?auto_161470 ?auto_161466 ) ) ( not ( = ?auto_161470 ?auto_161468 ) ) ( ON_BOARD ?auto_161479 ?auto_161472 ) ( SUPPORTS ?auto_161479 ?auto_161463 ) ( not ( = ?auto_161462 ?auto_161477 ) ) ( CALIBRATION_TARGET ?auto_161479 ?auto_161477 ) ( not ( = ?auto_161477 ?auto_161465 ) ) ( ON_BOARD ?auto_161473 ?auto_161472 ) ( not ( = ?auto_161479 ?auto_161473 ) ) ( SUPPORTS ?auto_161473 ?auto_161464 ) ( CALIBRATION_TARGET ?auto_161473 ?auto_161477 ) ( not ( = ?auto_161477 ?auto_161470 ) ) ( ON_BOARD ?auto_161478 ?auto_161472 ) ( not ( = ?auto_161473 ?auto_161478 ) ) ( SUPPORTS ?auto_161478 ?auto_161471 ) ( CALIBRATION_TARGET ?auto_161478 ?auto_161477 ) ( not ( = ?auto_161477 ?auto_161468 ) ) ( ON_BOARD ?auto_161474 ?auto_161472 ) ( not ( = ?auto_161478 ?auto_161474 ) ) ( SUPPORTS ?auto_161474 ?auto_161469 ) ( CALIBRATION_TARGET ?auto_161474 ?auto_161477 ) ( not ( = ?auto_161477 ?auto_161466 ) ) ( ON_BOARD ?auto_161476 ?auto_161472 ) ( not ( = ?auto_161474 ?auto_161476 ) ) ( SUPPORTS ?auto_161476 ?auto_161467 ) ( CALIBRATION_TARGET ?auto_161476 ?auto_161477 ) ( POWER_AVAIL ?auto_161472 ) ( POINTING ?auto_161472 ?auto_161475 ) ( not ( = ?auto_161477 ?auto_161475 ) ) ( not ( = ?auto_161466 ?auto_161475 ) ) ( not ( = ?auto_161467 ?auto_161469 ) ) ( not ( = ?auto_161468 ?auto_161475 ) ) ( not ( = ?auto_161467 ?auto_161471 ) ) ( not ( = ?auto_161469 ?auto_161471 ) ) ( not ( = ?auto_161470 ?auto_161475 ) ) ( not ( = ?auto_161478 ?auto_161476 ) ) ( not ( = ?auto_161467 ?auto_161464 ) ) ( not ( = ?auto_161469 ?auto_161464 ) ) ( not ( = ?auto_161471 ?auto_161464 ) ) ( not ( = ?auto_161465 ?auto_161475 ) ) ( not ( = ?auto_161473 ?auto_161474 ) ) ( not ( = ?auto_161473 ?auto_161476 ) ) ( not ( = ?auto_161467 ?auto_161463 ) ) ( not ( = ?auto_161469 ?auto_161463 ) ) ( not ( = ?auto_161471 ?auto_161463 ) ) ( not ( = ?auto_161464 ?auto_161463 ) ) ( not ( = ?auto_161462 ?auto_161475 ) ) ( not ( = ?auto_161479 ?auto_161478 ) ) ( not ( = ?auto_161479 ?auto_161474 ) ) ( not ( = ?auto_161479 ?auto_161476 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_161466 ?auto_161467 ?auto_161468 ?auto_161469 ?auto_161470 ?auto_161471 ?auto_161462 ?auto_161463 ?auto_161465 ?auto_161464 )
      ( GET-5IMAGE-VERIFY ?auto_161462 ?auto_161463 ?auto_161465 ?auto_161464 ?auto_161466 ?auto_161467 ?auto_161468 ?auto_161469 ?auto_161470 ?auto_161471 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_161540 - DIRECTION
      ?auto_161541 - MODE
      ?auto_161543 - DIRECTION
      ?auto_161542 - MODE
      ?auto_161544 - DIRECTION
      ?auto_161545 - MODE
      ?auto_161546 - DIRECTION
      ?auto_161547 - MODE
      ?auto_161548 - DIRECTION
      ?auto_161549 - MODE
    )
    :vars
    (
      ?auto_161557 - INSTRUMENT
      ?auto_161550 - SATELLITE
      ?auto_161555 - DIRECTION
      ?auto_161551 - INSTRUMENT
      ?auto_161556 - INSTRUMENT
      ?auto_161552 - INSTRUMENT
      ?auto_161554 - INSTRUMENT
      ?auto_161553 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_161543 ?auto_161540 ) ) ( not ( = ?auto_161544 ?auto_161540 ) ) ( not ( = ?auto_161544 ?auto_161543 ) ) ( not ( = ?auto_161546 ?auto_161540 ) ) ( not ( = ?auto_161546 ?auto_161543 ) ) ( not ( = ?auto_161546 ?auto_161544 ) ) ( not ( = ?auto_161548 ?auto_161540 ) ) ( not ( = ?auto_161548 ?auto_161543 ) ) ( not ( = ?auto_161548 ?auto_161544 ) ) ( not ( = ?auto_161548 ?auto_161546 ) ) ( ON_BOARD ?auto_161557 ?auto_161550 ) ( SUPPORTS ?auto_161557 ?auto_161541 ) ( not ( = ?auto_161540 ?auto_161555 ) ) ( CALIBRATION_TARGET ?auto_161557 ?auto_161555 ) ( not ( = ?auto_161555 ?auto_161543 ) ) ( ON_BOARD ?auto_161551 ?auto_161550 ) ( not ( = ?auto_161557 ?auto_161551 ) ) ( SUPPORTS ?auto_161551 ?auto_161542 ) ( CALIBRATION_TARGET ?auto_161551 ?auto_161555 ) ( not ( = ?auto_161555 ?auto_161546 ) ) ( ON_BOARD ?auto_161556 ?auto_161550 ) ( not ( = ?auto_161551 ?auto_161556 ) ) ( SUPPORTS ?auto_161556 ?auto_161547 ) ( CALIBRATION_TARGET ?auto_161556 ?auto_161555 ) ( not ( = ?auto_161555 ?auto_161548 ) ) ( ON_BOARD ?auto_161552 ?auto_161550 ) ( not ( = ?auto_161556 ?auto_161552 ) ) ( SUPPORTS ?auto_161552 ?auto_161549 ) ( CALIBRATION_TARGET ?auto_161552 ?auto_161555 ) ( not ( = ?auto_161555 ?auto_161544 ) ) ( ON_BOARD ?auto_161554 ?auto_161550 ) ( not ( = ?auto_161552 ?auto_161554 ) ) ( SUPPORTS ?auto_161554 ?auto_161545 ) ( CALIBRATION_TARGET ?auto_161554 ?auto_161555 ) ( POWER_AVAIL ?auto_161550 ) ( POINTING ?auto_161550 ?auto_161553 ) ( not ( = ?auto_161555 ?auto_161553 ) ) ( not ( = ?auto_161544 ?auto_161553 ) ) ( not ( = ?auto_161545 ?auto_161549 ) ) ( not ( = ?auto_161548 ?auto_161553 ) ) ( not ( = ?auto_161545 ?auto_161547 ) ) ( not ( = ?auto_161549 ?auto_161547 ) ) ( not ( = ?auto_161546 ?auto_161553 ) ) ( not ( = ?auto_161556 ?auto_161554 ) ) ( not ( = ?auto_161545 ?auto_161542 ) ) ( not ( = ?auto_161549 ?auto_161542 ) ) ( not ( = ?auto_161547 ?auto_161542 ) ) ( not ( = ?auto_161543 ?auto_161553 ) ) ( not ( = ?auto_161551 ?auto_161552 ) ) ( not ( = ?auto_161551 ?auto_161554 ) ) ( not ( = ?auto_161545 ?auto_161541 ) ) ( not ( = ?auto_161549 ?auto_161541 ) ) ( not ( = ?auto_161547 ?auto_161541 ) ) ( not ( = ?auto_161542 ?auto_161541 ) ) ( not ( = ?auto_161540 ?auto_161553 ) ) ( not ( = ?auto_161557 ?auto_161556 ) ) ( not ( = ?auto_161557 ?auto_161552 ) ) ( not ( = ?auto_161557 ?auto_161554 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_161544 ?auto_161545 ?auto_161548 ?auto_161549 ?auto_161546 ?auto_161547 ?auto_161540 ?auto_161541 ?auto_161543 ?auto_161542 )
      ( GET-5IMAGE-VERIFY ?auto_161540 ?auto_161541 ?auto_161543 ?auto_161542 ?auto_161544 ?auto_161545 ?auto_161546 ?auto_161547 ?auto_161548 ?auto_161549 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_161870 - DIRECTION
      ?auto_161871 - MODE
      ?auto_161873 - DIRECTION
      ?auto_161872 - MODE
      ?auto_161874 - DIRECTION
      ?auto_161875 - MODE
      ?auto_161876 - DIRECTION
      ?auto_161877 - MODE
      ?auto_161878 - DIRECTION
      ?auto_161879 - MODE
    )
    :vars
    (
      ?auto_161887 - INSTRUMENT
      ?auto_161880 - SATELLITE
      ?auto_161885 - DIRECTION
      ?auto_161881 - INSTRUMENT
      ?auto_161886 - INSTRUMENT
      ?auto_161882 - INSTRUMENT
      ?auto_161884 - INSTRUMENT
      ?auto_161883 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_161873 ?auto_161870 ) ) ( not ( = ?auto_161874 ?auto_161870 ) ) ( not ( = ?auto_161874 ?auto_161873 ) ) ( not ( = ?auto_161876 ?auto_161870 ) ) ( not ( = ?auto_161876 ?auto_161873 ) ) ( not ( = ?auto_161876 ?auto_161874 ) ) ( not ( = ?auto_161878 ?auto_161870 ) ) ( not ( = ?auto_161878 ?auto_161873 ) ) ( not ( = ?auto_161878 ?auto_161874 ) ) ( not ( = ?auto_161878 ?auto_161876 ) ) ( ON_BOARD ?auto_161887 ?auto_161880 ) ( SUPPORTS ?auto_161887 ?auto_161871 ) ( not ( = ?auto_161870 ?auto_161885 ) ) ( CALIBRATION_TARGET ?auto_161887 ?auto_161885 ) ( not ( = ?auto_161885 ?auto_161873 ) ) ( ON_BOARD ?auto_161881 ?auto_161880 ) ( not ( = ?auto_161887 ?auto_161881 ) ) ( SUPPORTS ?auto_161881 ?auto_161872 ) ( CALIBRATION_TARGET ?auto_161881 ?auto_161885 ) ( not ( = ?auto_161885 ?auto_161878 ) ) ( ON_BOARD ?auto_161886 ?auto_161880 ) ( not ( = ?auto_161881 ?auto_161886 ) ) ( SUPPORTS ?auto_161886 ?auto_161879 ) ( CALIBRATION_TARGET ?auto_161886 ?auto_161885 ) ( not ( = ?auto_161885 ?auto_161874 ) ) ( ON_BOARD ?auto_161882 ?auto_161880 ) ( not ( = ?auto_161886 ?auto_161882 ) ) ( SUPPORTS ?auto_161882 ?auto_161875 ) ( CALIBRATION_TARGET ?auto_161882 ?auto_161885 ) ( not ( = ?auto_161885 ?auto_161876 ) ) ( ON_BOARD ?auto_161884 ?auto_161880 ) ( not ( = ?auto_161882 ?auto_161884 ) ) ( SUPPORTS ?auto_161884 ?auto_161877 ) ( CALIBRATION_TARGET ?auto_161884 ?auto_161885 ) ( POWER_AVAIL ?auto_161880 ) ( POINTING ?auto_161880 ?auto_161883 ) ( not ( = ?auto_161885 ?auto_161883 ) ) ( not ( = ?auto_161876 ?auto_161883 ) ) ( not ( = ?auto_161877 ?auto_161875 ) ) ( not ( = ?auto_161874 ?auto_161883 ) ) ( not ( = ?auto_161877 ?auto_161879 ) ) ( not ( = ?auto_161875 ?auto_161879 ) ) ( not ( = ?auto_161878 ?auto_161883 ) ) ( not ( = ?auto_161886 ?auto_161884 ) ) ( not ( = ?auto_161877 ?auto_161872 ) ) ( not ( = ?auto_161875 ?auto_161872 ) ) ( not ( = ?auto_161879 ?auto_161872 ) ) ( not ( = ?auto_161873 ?auto_161883 ) ) ( not ( = ?auto_161881 ?auto_161882 ) ) ( not ( = ?auto_161881 ?auto_161884 ) ) ( not ( = ?auto_161877 ?auto_161871 ) ) ( not ( = ?auto_161875 ?auto_161871 ) ) ( not ( = ?auto_161879 ?auto_161871 ) ) ( not ( = ?auto_161872 ?auto_161871 ) ) ( not ( = ?auto_161870 ?auto_161883 ) ) ( not ( = ?auto_161887 ?auto_161886 ) ) ( not ( = ?auto_161887 ?auto_161882 ) ) ( not ( = ?auto_161887 ?auto_161884 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_161876 ?auto_161877 ?auto_161874 ?auto_161875 ?auto_161878 ?auto_161879 ?auto_161870 ?auto_161871 ?auto_161873 ?auto_161872 )
      ( GET-5IMAGE-VERIFY ?auto_161870 ?auto_161871 ?auto_161873 ?auto_161872 ?auto_161874 ?auto_161875 ?auto_161876 ?auto_161877 ?auto_161878 ?auto_161879 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_162034 - DIRECTION
      ?auto_162035 - MODE
      ?auto_162037 - DIRECTION
      ?auto_162036 - MODE
      ?auto_162038 - DIRECTION
      ?auto_162039 - MODE
      ?auto_162040 - DIRECTION
      ?auto_162041 - MODE
      ?auto_162042 - DIRECTION
      ?auto_162043 - MODE
    )
    :vars
    (
      ?auto_162051 - INSTRUMENT
      ?auto_162044 - SATELLITE
      ?auto_162049 - DIRECTION
      ?auto_162045 - INSTRUMENT
      ?auto_162050 - INSTRUMENT
      ?auto_162046 - INSTRUMENT
      ?auto_162048 - INSTRUMENT
      ?auto_162047 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_162037 ?auto_162034 ) ) ( not ( = ?auto_162038 ?auto_162034 ) ) ( not ( = ?auto_162038 ?auto_162037 ) ) ( not ( = ?auto_162040 ?auto_162034 ) ) ( not ( = ?auto_162040 ?auto_162037 ) ) ( not ( = ?auto_162040 ?auto_162038 ) ) ( not ( = ?auto_162042 ?auto_162034 ) ) ( not ( = ?auto_162042 ?auto_162037 ) ) ( not ( = ?auto_162042 ?auto_162038 ) ) ( not ( = ?auto_162042 ?auto_162040 ) ) ( ON_BOARD ?auto_162051 ?auto_162044 ) ( SUPPORTS ?auto_162051 ?auto_162035 ) ( not ( = ?auto_162034 ?auto_162049 ) ) ( CALIBRATION_TARGET ?auto_162051 ?auto_162049 ) ( not ( = ?auto_162049 ?auto_162037 ) ) ( ON_BOARD ?auto_162045 ?auto_162044 ) ( not ( = ?auto_162051 ?auto_162045 ) ) ( SUPPORTS ?auto_162045 ?auto_162036 ) ( CALIBRATION_TARGET ?auto_162045 ?auto_162049 ) ( not ( = ?auto_162049 ?auto_162040 ) ) ( ON_BOARD ?auto_162050 ?auto_162044 ) ( not ( = ?auto_162045 ?auto_162050 ) ) ( SUPPORTS ?auto_162050 ?auto_162041 ) ( CALIBRATION_TARGET ?auto_162050 ?auto_162049 ) ( not ( = ?auto_162049 ?auto_162038 ) ) ( ON_BOARD ?auto_162046 ?auto_162044 ) ( not ( = ?auto_162050 ?auto_162046 ) ) ( SUPPORTS ?auto_162046 ?auto_162039 ) ( CALIBRATION_TARGET ?auto_162046 ?auto_162049 ) ( not ( = ?auto_162049 ?auto_162042 ) ) ( ON_BOARD ?auto_162048 ?auto_162044 ) ( not ( = ?auto_162046 ?auto_162048 ) ) ( SUPPORTS ?auto_162048 ?auto_162043 ) ( CALIBRATION_TARGET ?auto_162048 ?auto_162049 ) ( POWER_AVAIL ?auto_162044 ) ( POINTING ?auto_162044 ?auto_162047 ) ( not ( = ?auto_162049 ?auto_162047 ) ) ( not ( = ?auto_162042 ?auto_162047 ) ) ( not ( = ?auto_162043 ?auto_162039 ) ) ( not ( = ?auto_162038 ?auto_162047 ) ) ( not ( = ?auto_162043 ?auto_162041 ) ) ( not ( = ?auto_162039 ?auto_162041 ) ) ( not ( = ?auto_162040 ?auto_162047 ) ) ( not ( = ?auto_162050 ?auto_162048 ) ) ( not ( = ?auto_162043 ?auto_162036 ) ) ( not ( = ?auto_162039 ?auto_162036 ) ) ( not ( = ?auto_162041 ?auto_162036 ) ) ( not ( = ?auto_162037 ?auto_162047 ) ) ( not ( = ?auto_162045 ?auto_162046 ) ) ( not ( = ?auto_162045 ?auto_162048 ) ) ( not ( = ?auto_162043 ?auto_162035 ) ) ( not ( = ?auto_162039 ?auto_162035 ) ) ( not ( = ?auto_162041 ?auto_162035 ) ) ( not ( = ?auto_162036 ?auto_162035 ) ) ( not ( = ?auto_162034 ?auto_162047 ) ) ( not ( = ?auto_162051 ?auto_162050 ) ) ( not ( = ?auto_162051 ?auto_162046 ) ) ( not ( = ?auto_162051 ?auto_162048 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_162042 ?auto_162043 ?auto_162038 ?auto_162039 ?auto_162040 ?auto_162041 ?auto_162034 ?auto_162035 ?auto_162037 ?auto_162036 )
      ( GET-5IMAGE-VERIFY ?auto_162034 ?auto_162035 ?auto_162037 ?auto_162036 ?auto_162038 ?auto_162039 ?auto_162040 ?auto_162041 ?auto_162042 ?auto_162043 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_162364 - DIRECTION
      ?auto_162365 - MODE
      ?auto_162367 - DIRECTION
      ?auto_162366 - MODE
      ?auto_162368 - DIRECTION
      ?auto_162369 - MODE
      ?auto_162370 - DIRECTION
      ?auto_162371 - MODE
      ?auto_162372 - DIRECTION
      ?auto_162373 - MODE
    )
    :vars
    (
      ?auto_162381 - INSTRUMENT
      ?auto_162374 - SATELLITE
      ?auto_162379 - DIRECTION
      ?auto_162375 - INSTRUMENT
      ?auto_162380 - INSTRUMENT
      ?auto_162376 - INSTRUMENT
      ?auto_162378 - INSTRUMENT
      ?auto_162377 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_162367 ?auto_162364 ) ) ( not ( = ?auto_162368 ?auto_162364 ) ) ( not ( = ?auto_162368 ?auto_162367 ) ) ( not ( = ?auto_162370 ?auto_162364 ) ) ( not ( = ?auto_162370 ?auto_162367 ) ) ( not ( = ?auto_162370 ?auto_162368 ) ) ( not ( = ?auto_162372 ?auto_162364 ) ) ( not ( = ?auto_162372 ?auto_162367 ) ) ( not ( = ?auto_162372 ?auto_162368 ) ) ( not ( = ?auto_162372 ?auto_162370 ) ) ( ON_BOARD ?auto_162381 ?auto_162374 ) ( SUPPORTS ?auto_162381 ?auto_162365 ) ( not ( = ?auto_162364 ?auto_162379 ) ) ( CALIBRATION_TARGET ?auto_162381 ?auto_162379 ) ( not ( = ?auto_162379 ?auto_162367 ) ) ( ON_BOARD ?auto_162375 ?auto_162374 ) ( not ( = ?auto_162381 ?auto_162375 ) ) ( SUPPORTS ?auto_162375 ?auto_162366 ) ( CALIBRATION_TARGET ?auto_162375 ?auto_162379 ) ( not ( = ?auto_162379 ?auto_162368 ) ) ( ON_BOARD ?auto_162380 ?auto_162374 ) ( not ( = ?auto_162375 ?auto_162380 ) ) ( SUPPORTS ?auto_162380 ?auto_162369 ) ( CALIBRATION_TARGET ?auto_162380 ?auto_162379 ) ( not ( = ?auto_162379 ?auto_162372 ) ) ( ON_BOARD ?auto_162376 ?auto_162374 ) ( not ( = ?auto_162380 ?auto_162376 ) ) ( SUPPORTS ?auto_162376 ?auto_162373 ) ( CALIBRATION_TARGET ?auto_162376 ?auto_162379 ) ( not ( = ?auto_162379 ?auto_162370 ) ) ( ON_BOARD ?auto_162378 ?auto_162374 ) ( not ( = ?auto_162376 ?auto_162378 ) ) ( SUPPORTS ?auto_162378 ?auto_162371 ) ( CALIBRATION_TARGET ?auto_162378 ?auto_162379 ) ( POWER_AVAIL ?auto_162374 ) ( POINTING ?auto_162374 ?auto_162377 ) ( not ( = ?auto_162379 ?auto_162377 ) ) ( not ( = ?auto_162370 ?auto_162377 ) ) ( not ( = ?auto_162371 ?auto_162373 ) ) ( not ( = ?auto_162372 ?auto_162377 ) ) ( not ( = ?auto_162371 ?auto_162369 ) ) ( not ( = ?auto_162373 ?auto_162369 ) ) ( not ( = ?auto_162368 ?auto_162377 ) ) ( not ( = ?auto_162380 ?auto_162378 ) ) ( not ( = ?auto_162371 ?auto_162366 ) ) ( not ( = ?auto_162373 ?auto_162366 ) ) ( not ( = ?auto_162369 ?auto_162366 ) ) ( not ( = ?auto_162367 ?auto_162377 ) ) ( not ( = ?auto_162375 ?auto_162376 ) ) ( not ( = ?auto_162375 ?auto_162378 ) ) ( not ( = ?auto_162371 ?auto_162365 ) ) ( not ( = ?auto_162373 ?auto_162365 ) ) ( not ( = ?auto_162369 ?auto_162365 ) ) ( not ( = ?auto_162366 ?auto_162365 ) ) ( not ( = ?auto_162364 ?auto_162377 ) ) ( not ( = ?auto_162381 ?auto_162380 ) ) ( not ( = ?auto_162381 ?auto_162376 ) ) ( not ( = ?auto_162381 ?auto_162378 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_162370 ?auto_162371 ?auto_162372 ?auto_162373 ?auto_162368 ?auto_162369 ?auto_162364 ?auto_162365 ?auto_162367 ?auto_162366 )
      ( GET-5IMAGE-VERIFY ?auto_162364 ?auto_162365 ?auto_162367 ?auto_162366 ?auto_162368 ?auto_162369 ?auto_162370 ?auto_162371 ?auto_162372 ?auto_162373 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_162442 - DIRECTION
      ?auto_162443 - MODE
      ?auto_162445 - DIRECTION
      ?auto_162444 - MODE
      ?auto_162446 - DIRECTION
      ?auto_162447 - MODE
      ?auto_162448 - DIRECTION
      ?auto_162449 - MODE
      ?auto_162450 - DIRECTION
      ?auto_162451 - MODE
    )
    :vars
    (
      ?auto_162459 - INSTRUMENT
      ?auto_162452 - SATELLITE
      ?auto_162457 - DIRECTION
      ?auto_162453 - INSTRUMENT
      ?auto_162458 - INSTRUMENT
      ?auto_162454 - INSTRUMENT
      ?auto_162456 - INSTRUMENT
      ?auto_162455 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_162445 ?auto_162442 ) ) ( not ( = ?auto_162446 ?auto_162442 ) ) ( not ( = ?auto_162446 ?auto_162445 ) ) ( not ( = ?auto_162448 ?auto_162442 ) ) ( not ( = ?auto_162448 ?auto_162445 ) ) ( not ( = ?auto_162448 ?auto_162446 ) ) ( not ( = ?auto_162450 ?auto_162442 ) ) ( not ( = ?auto_162450 ?auto_162445 ) ) ( not ( = ?auto_162450 ?auto_162446 ) ) ( not ( = ?auto_162450 ?auto_162448 ) ) ( ON_BOARD ?auto_162459 ?auto_162452 ) ( SUPPORTS ?auto_162459 ?auto_162443 ) ( not ( = ?auto_162442 ?auto_162457 ) ) ( CALIBRATION_TARGET ?auto_162459 ?auto_162457 ) ( not ( = ?auto_162457 ?auto_162445 ) ) ( ON_BOARD ?auto_162453 ?auto_162452 ) ( not ( = ?auto_162459 ?auto_162453 ) ) ( SUPPORTS ?auto_162453 ?auto_162444 ) ( CALIBRATION_TARGET ?auto_162453 ?auto_162457 ) ( not ( = ?auto_162457 ?auto_162446 ) ) ( ON_BOARD ?auto_162458 ?auto_162452 ) ( not ( = ?auto_162453 ?auto_162458 ) ) ( SUPPORTS ?auto_162458 ?auto_162447 ) ( CALIBRATION_TARGET ?auto_162458 ?auto_162457 ) ( not ( = ?auto_162457 ?auto_162448 ) ) ( ON_BOARD ?auto_162454 ?auto_162452 ) ( not ( = ?auto_162458 ?auto_162454 ) ) ( SUPPORTS ?auto_162454 ?auto_162449 ) ( CALIBRATION_TARGET ?auto_162454 ?auto_162457 ) ( not ( = ?auto_162457 ?auto_162450 ) ) ( ON_BOARD ?auto_162456 ?auto_162452 ) ( not ( = ?auto_162454 ?auto_162456 ) ) ( SUPPORTS ?auto_162456 ?auto_162451 ) ( CALIBRATION_TARGET ?auto_162456 ?auto_162457 ) ( POWER_AVAIL ?auto_162452 ) ( POINTING ?auto_162452 ?auto_162455 ) ( not ( = ?auto_162457 ?auto_162455 ) ) ( not ( = ?auto_162450 ?auto_162455 ) ) ( not ( = ?auto_162451 ?auto_162449 ) ) ( not ( = ?auto_162448 ?auto_162455 ) ) ( not ( = ?auto_162451 ?auto_162447 ) ) ( not ( = ?auto_162449 ?auto_162447 ) ) ( not ( = ?auto_162446 ?auto_162455 ) ) ( not ( = ?auto_162458 ?auto_162456 ) ) ( not ( = ?auto_162451 ?auto_162444 ) ) ( not ( = ?auto_162449 ?auto_162444 ) ) ( not ( = ?auto_162447 ?auto_162444 ) ) ( not ( = ?auto_162445 ?auto_162455 ) ) ( not ( = ?auto_162453 ?auto_162454 ) ) ( not ( = ?auto_162453 ?auto_162456 ) ) ( not ( = ?auto_162451 ?auto_162443 ) ) ( not ( = ?auto_162449 ?auto_162443 ) ) ( not ( = ?auto_162447 ?auto_162443 ) ) ( not ( = ?auto_162444 ?auto_162443 ) ) ( not ( = ?auto_162442 ?auto_162455 ) ) ( not ( = ?auto_162459 ?auto_162458 ) ) ( not ( = ?auto_162459 ?auto_162454 ) ) ( not ( = ?auto_162459 ?auto_162456 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_162450 ?auto_162451 ?auto_162448 ?auto_162449 ?auto_162446 ?auto_162447 ?auto_162442 ?auto_162443 ?auto_162445 ?auto_162444 )
      ( GET-5IMAGE-VERIFY ?auto_162442 ?auto_162443 ?auto_162445 ?auto_162444 ?auto_162446 ?auto_162447 ?auto_162448 ?auto_162449 ?auto_162450 ?auto_162451 ) )
  )

)

